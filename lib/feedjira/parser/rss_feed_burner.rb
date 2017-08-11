# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with RSS feeds.
    class RSSFeedBurner
      include SAXMachine
      include FeedUtilities
      element :title
      element :description
      element :link, as: :url
      element :lastBuildDate, as: :last_built
      element :"atom10:link", as: :self_url, value: :href, with: {rel: "self"}
      elements :"atom10:link", as: :hubs, value: :href, with: { rel: "hub" }
      elements :item, as: :entries, class: RSSFeedBurnerEntry

      # If author is not present use author tag on the item
      element :"itunes:author", :as => :itunes_author
      element :"itunes:block", :as => :itunes_block
      element :"itunes:duration", :as => :itunes_duration
      element :"itunes:explicit", :as => :itunes_explicit
      element :"itunes:keywords", :as => :itunes_keywords
      element :"itunes:subtitle", :as => :itunes_subtitle
      element :"itunes:image", :value => :href, :as => :itunes_image
      element :"itunes:isClosedCaptioned", :as => :itunes_closed_captioned
      element :"itunes:order", :as => :itunes_order
      # If summary is not present, use the description tag
      element :"itunes:summary", :as => :itunes_summary
      element :enclosure, :value => :length, :as => :enclosure_length
      element :enclosure, :value => :type, :as => :enclosure_type
      element :enclosure, :value => :url, :as => :enclosure_url

      attr_accessor :feed_url

      def self.able_to_parse?(xml) #:nodoc:
        (/\<rss|\<rdf/ =~ xml) && (/feedburner/ =~ xml)
      end
    end
  end
end
