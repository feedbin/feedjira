# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with RDF feed entries.
    class RSSFeedBurnerEntry
      include SAXMachine
      include FeedEntryUtilities
      include ItunesEntryUtilities
      element :"feedburner:origLink", as: :url
    end
  end
end
