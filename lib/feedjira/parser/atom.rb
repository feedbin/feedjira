# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with Atom feeds.
    class Atom
      include SAXMachine
      include FeedUtilities

      attr_writer :url, :feed_url, :hubs

      element :title
      element :subtitle, as: :description
      elements :link, as: :links, class: AtomLink
      elements :entry, as: :entries, class: AtomEntry

      def self.able_to_parse?(xml)
        %r{\<feed[^\>]+xmlns\s?=\s?[\"\'](http://www\.w3\.org/2005/Atom|http://purl\.org/atom/ns\#)[\"\'][^\>]*\>} =~ xml # rubocop:disable Metrics/LineLength
      end

      def feed_url
        (links.find { it.rel == "self" })&.href || links.first&.href
      end

      def url
        (links.find { it.type == "text/html" || it.rel == "alternate" })&.href || links.last&.href
      end

      def hubs
        links.filter_map { it.rel == "hub" && it.href }
      end

      def self_url
        feed_url
      end

      def self.preprocess(xml)
        Preprocessor.new(xml).to_xml
      end
    end
  end
end
