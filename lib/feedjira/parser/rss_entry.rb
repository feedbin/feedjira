module Feedjira
  module Parser
    # Parser for dealing with RDF feed entries.
    class RSSEntry
      include SAXMachine
      include FeedEntryUtilities
      include ItunesEntryUtilities
    end
  end
end
