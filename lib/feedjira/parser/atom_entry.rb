# rubocop:disable Style/DocumentationMethod
module Feedjira
  module Parser
    # Parser for dealing with Atom feed entries.
    class AtomEntry
      include SAXMachine
      include FeedEntryUtilities
      include AtomEntryElements

      element :enclosure, as: :image, value: :href
      elements :"media:content", as: :media, class: EntryMedia
      element :source, class: AtomSource
    end
  end
end
