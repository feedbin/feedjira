module Feedjira
  module Parser
    class AtomLink
      include SAXMachine
      attribute :rel
      attribute :type
      attribute :href

      # From atom spec: If the "rel" attribute is not present, the link element MUST
      # be interpreted as if the link relation type is "alternate".
      def rel
        @rel || "alternate"
      end
    end
  end
end
