module Feedjira

  module Parser
    # Parser for dealing with Atom feed entries.
    class AtomYoutubeEntry
      include SAXMachine
      include FeedEntryUtilities

      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :name, :as => :author
      element :content
      element :summary

      element :enclosure, :as => :image, :value => :href

      element :published
      element :id, :as => :entry_id
      element :created, :as => :published
      element :issued, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link, :as => :links, :value => :href

      element :"yt:videoId", :as => :youtube_video_id
      element :"media:description", :as => :media_description
      element :"media:content", :as => :media_width, :value => :width do |width|
        width.to_i
      end
      element :"media:content", :as => :media_height, :value => :height do |height|
        height.to_i
      end

      def url
        @url ||= links.first
      end
    end

  end

end
