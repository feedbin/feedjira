# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with Feedburner Atom feed entries.
    class AtomFeedBurnerEntry
      include SAXMachine
      include FeedEntryUtilities
      include AtomEntryElements

      element :"feedburner:origLink", as: :url

      element :enclosure, as: :image, value: :href
      elements :"media:content", as: :media, class: EntryMedia
    end
  end
end
