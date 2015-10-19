module Feedjira
  module Parser
    # Parser for dealing with Atom feeds.
    class AtomYoutube
      include SAXMachine
      include FeedUtilities
      element :title
      element :subtitle, :as => :description
      element :link, :as => :url, :value => :href, :with => {:type => "text/html"}
      element :link, :as => :feed_url, :value => :href, :with => {:rel => "self"}
      elements :link, :as => :links, :value => :href
      elements :link, :as => :hubs, :value => :href, :with => {:rel => "hub"}
      elements :entry, :as => :entries, :class => AtomYoutubeEntry

      def self.able_to_parse?(xml) #:nodoc:
        /\<feed[^\>]+xmlns:yt\s?=\s?[\"|\'](http:\/\/www\.youtube.com\/xml\/schemas\/2015)[\"|\'][^\>]*\>/ =~ xml
      end

      def url
        @url || (links - [feed_url]).last || links.last
      end

      def feed_url
        @feed_url ||= links.first
      end

    end
  end
end
