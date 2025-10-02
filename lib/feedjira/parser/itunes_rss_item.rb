module Feedjira
  module Parser
    # iTunes extensions to the standard RSS2.0 item
    # Source: http://www.apple.com/itunes/whatson/podcasts/specs.html
    class ITunesRSSItem
      include SAXMachine
      include FeedEntryUtilities
      include RSSEntryUtilities
    end
  end
end
