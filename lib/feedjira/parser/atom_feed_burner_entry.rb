# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with Feedburner Atom feed entries.
    class AtomFeedBurnerEntry
      include SAXMachine
      include FeedEntryUtilities

      element :title
      element :name, as: :author
      element :link, as: :url, value: :href, with: { type: "text/html", rel: "alternate" } # rubocop:disable Metrics/LineLength
      element :"feedburner:origLink", as: :url
      element :summary
      element :content

      element :enclosure, as: :image, value: :href

      element :published
      element :id, as: :entry_id
      element :issued, as: :published
      element :created, as: :published
      element :updated
      element :modified, as: :updated
      elements :category, as: :categories, value: :term
      elements :link, as: :links, value: :href
      elements :"media:content", as: :media, class: EntryMedia

      def url
        @url ||= links.first
      end
    end
  end
end
