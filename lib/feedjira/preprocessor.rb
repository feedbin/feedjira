# rubocop:disable Style/Documentation
# rubocop:disable Style/DocumentationMethod
module Feedjira
  class Preprocessor
    def initialize(xml)
      @xml = xml
    end

    def to_xml
      process_content
      doc.to_xml
    end

    private

    def process_content
      content_nodes.each do |node|
        node.content = raw_html(node) unless node.cdata?
      end
    end

    def content_nodes
      doc.xpath(
        "//*[local-name()='entry']" \
        "/*[(local-name()='content' or local-name()='summary' or local-name()='title')" \
        " and @type='xhtml']"
      )
    end

    def raw_html(node)
      node.xpath("./*[local-name()='div']").inner_html
    end

    def doc
      @doc ||= Nokogiri::XML(@xml)
    end
  end
end
