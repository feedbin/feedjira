module Feedjira
  module Parser
    # iTunes extensions to the standard RSS2.0 item
    # Source: http://www.apple.com/itunes/whatson/podcasts/specs.html
    class ITunesRSSItem
      include SAXMachine
      include FeedEntryUtilities
      include ItunesEntryUtilities

      element :author
      element :guid, as: :entry_id
      element :title
      element :link, as: :url
      element :description, as: :summary
      element :"content:encoded", as: :content
      element :pubDate, as: :published
      element :"dc:creator", as: :author
    end
  end
end
