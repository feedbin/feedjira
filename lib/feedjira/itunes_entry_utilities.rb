# frozen_string_literal: true

module Feedjira
  module ItunesEntryUtilities
    def self.included(mod)
      mod.class_exec do
        sax_config.top_level_elements["enclosure"].clear
        element :"itunes:author", as: :itunes_author
        element :"itunes:block", as: :itunes_block
        element :"itunes:duration", as: :itunes_duration
        element :"itunes:explicit", as: :itunes_explicit
        element :"itunes:keywords", as: :itunes_keywords
        element :"itunes:subtitle", as: :itunes_subtitle
        element :"itunes:image", value: :href, as: :itunes_image
        element :"itunes:isClosedCaptioned", as: :itunes_closed_captioned
        element :"itunes:order", as: :itunes_order
        element :"itunes:season", as: :itunes_season
        element :"itunes:episode", as: :itunes_episode
        element :"itunes:title", as: :itunes_title
        element :"itunes:episodeType", as: :itunes_episode_type
        element :"itunes:summary", as: :itunes_summary
        element :enclosure, value: :length, as: :enclosure_length
        element :enclosure, value: :type, as: :enclosure_type
        element :enclosure, value: :url, as: :enclosure_url
        elements "psc:chapter", as: :raw_chapters, class: Feedjira::Parser::PodloveChapter
      end

      def chapters
        raw_chapters.sort_by(&:start)
      end
    end
  end
end
