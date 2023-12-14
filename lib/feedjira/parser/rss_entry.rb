module Feedjira
  module Parser
    # Parser for dealing with RDF feed entries.
    class RSSEntry
      include SAXMachine
      include FeedEntryUtilities
      include ItunesEntryUtilities

      element :title
      element :link, as: :url

      element :"dc:creator", as: :author
      element :author, as: :author
      element :"content:encoded", as: :content
      element :description, as: :summary

      element :enclosure, as: :image, value: :url

      element :pubDate, as: :published
      element :pubdate, as: :published
      element :"dc:date", as: :published
      element :"dc:Date", as: :published
      element :"dcterms:created", as: :published

      element :"dcterms:modified", as: :updated
      element :issued, as: :published
      elements :category, as: :categories

      element :post_id
      element :"dc:identifier", as: :dc_identifier
      element :guid
      elements :"media:content", as: :media, class: EntryMedia

      def entry_id
        @guid || @dc_identifier
      end
    end
  end
end
