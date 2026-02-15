module Feedjira
  module Parser
    class AtomSource
      include SAXMachine
      include FeedEntryUtilities
      include AtomEntryElements

      element :subtitle, as: :description
    end
  end
end
