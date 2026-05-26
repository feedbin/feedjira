require "spec_helper"

describe Feedjira::Preprocessor do
  it "returns the xml as parsed by Nokogiri" do
    xml = "<xml></xml>"
    doc = Nokogiri::XML(xml).remove_namespaces!
    processor = Feedjira::Preprocessor.new xml
    escaped = processor.to_xml

    expect(escaped).to eq doc.to_xml
  end

  it "escapes markup in xhtml content" do
    processor = Feedjira::Preprocessor.new sample_atom_xhtml_feed
    escaped = processor.to_xml
    escaped_parts = escaped.split "\n"

    expect(escaped_parts[10]).to match(%r{&lt;i&gt;dogs&lt;/i&gt;}) # title
    expect(escaped_parts[16]).to match(%r{&lt;b&gt;XHTML&lt;/b&gt;}) # summary
    expect(escaped_parts[26]).to match(/&lt;p&gt;$/) # content
  end

  it "leaves escaped html within pre tag" do
    processor = Feedjira::Preprocessor.new(sample_atom_xhtml_with_escpaed_html_in_pre_tag_feed) # rubocop:disable Metrics/LineLength
    escaped = processor.to_xml
    expected_pre_tag = "        &lt;pre&gt;&amp;lt;b&amp;gt;test&amp;lt;b&amp;gt;&lt;/pre&gt;" # rubocop:disable Metrics/LineLength
    expect(escaped.split("\n")[7]).to eq(expected_pre_tag)
  end

  it "preserves namespaced siblings of <content>" do
    xml = <<~XML
      <?xml version="1.0" encoding="utf-8"?>
      <feed xmlns="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/">
        <entry>
          <id>1</id>
          <media:content url="https://example.com/img.jpg" medium="image" />
          <content type="html">&lt;p&gt;hello&lt;/p&gt;</content>
        </entry>
      </feed>
    XML

    processed = Feedjira::Preprocessor.new(xml).to_xml
    entry = Feedjira::Parser::Atom.parse(processed).entries.first

    expect(entry.content).to eq("<p>hello</p>")
  end
end
