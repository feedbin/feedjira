# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with Atom feed entries.
    class AtomEntry
      include SAXMachine
      include FeedEntryUtilities

      element :title
      element :link, as: :url, value: :href, with: { rel: "alternate" }
      element :link, as: :url, value: :href, with: { rel: "alternate", type: "text/html" }
      element :name, as: :author
      element :content
      element :summary

      element :enclosure, as: :image, value: :href

      element :published
      element :id, as: :entry_id
      element :created, as: :published
      element :issued, as: :published
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
