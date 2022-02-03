# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # iTunes is RSS 2.0 + some apple extensions
    # Sources:
    #   * https://cyber.harvard.edu/rss/rss.html
    #   * http://lists.apple.com/archives/syndication-dev/2005/Nov/msg00002.html
    #   * https://help.apple.com/itc/podcasts_connect/
    class ITunesRSS
      include SAXMachine
      include FeedUtilities
      include ItunesFeedUtilities

      attr_accessor :feed_url

      # RSS 2.0 elements that need including
      element :copyright
      element :description
      element :image, class: RSSImage
      element :language
      element :lastBuildDate, as: :last_built
      element :link, as: :url
      element :managingEditor
      element :rss, as: :version, value: :version
      element :title
      element :ttl
      elements :"atom:link", as: :hubs, value: :href, with: {rel: "hub"}
      element :"atom:link", as: :self_url, value: :href, with: {rel: "self"}
      elements :item, as: :entries, class: ITunesRSSItem

      def self.able_to_parse?(xml)
        %r{xmlns:itunes\s?=\s?[\"\']http://www\.itunes\.com/dtds/podcast-1\.0\.dtd[\"\']}i =~ xml # rubocop:disable Metrics/LineLength
      end
    end
  end
end
