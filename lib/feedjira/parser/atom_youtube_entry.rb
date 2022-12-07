# rubocop:disable Style/Documentation
module Feedjira
  module Parser
    class AtomYoutubeEntry
      include SAXMachine
      include FeedEntryUtilities

      element :title
      element :link, as: :url, value: :href, with: { rel: "alternate" }
      element :name, as: :author
      element :"media:description", as: :content
      element :summary
      element :published
      element :id, as: :entry_id
      element :updated
      element :"yt:videoId", as: :youtube_video_id
      elements :"media:content", as: :media, class: EntryMedia
    end
  end
end
