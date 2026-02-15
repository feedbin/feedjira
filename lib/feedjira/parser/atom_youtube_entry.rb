# rubocop:disable Style/Documentation
module Feedjira
  module Parser
    class AtomYoutubeEntry
      include SAXMachine
      include FeedEntryUtilities
      include AtomEntryElements

      element :"media:description", as: :content
      element :"yt:videoId", as: :youtube_video_id
      element :"yt:channelId", as: :youtube_channel_id
      elements :"media:content", as: :media, class: EntryMedia
    end
  end
end
