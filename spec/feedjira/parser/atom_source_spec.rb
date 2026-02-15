require "spec_helper"

describe Feedjira::Parser::AtomSource do
  before(:each) do
    feed = Feedjira::Parser::Atom.parse(sample_atom_planet_feed)
    @entry = feed.entries.first
  end

  it "should parse the source title" do
    expect(@entry.source.title).to eq "Marc Elvers"
  end

  it "should parse the source id" do
    expect(@entry.source.id).to eq "https://www.tunbury.org/atom.xml"
  end

  it "should parse the source url" do
    expect(@entry.source.url).to eq "https://www.tunbury.org/atom.xml"
  end

  it "should have nil source when not present" do
    feed = Feedjira::Parser::Atom.parse(sample_atom_feed)
    entry = feed.entries.first
    expect(entry.source).to be_nil
  end

  context "with different sources" do
    before(:each) do
      @feed = Feedjira::Parser::Atom.parse(sample_atom_planet_feed)
    end

    it "should parse source for Tarides entry" do
      tarides_entry = @feed.entries.find { |e| e.title == "Announcing New Wasm_of_ocaml Optimisations" }
      expect(tarides_entry.source.title).to eq "Tarides"
      expect(tarides_entry.source.id).to eq "https://tarides.com/feed.xml"
      expect(tarides_entry.source.url).to eq "https://tarides.com/feed.xml"
    end

    it "should parse source for Caml Weekly News entry" do
      cwn_entry = @feed.entries.find { |e| e.title == "OCaml Weekly News, 10 Feb 2026" }
      expect(cwn_entry.source.title).to eq "Caml Weekly News"
      expect(cwn_entry.source.id).to eq "https://alan.petitepomme.net/cwn/cwn.rss"
    end
  end
end
