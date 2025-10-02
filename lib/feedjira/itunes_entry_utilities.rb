# frozen_string_literal: true

module Feedjira
  module ItunesEntryUtilities
    def self.included(mod)
      mod.class_exec do
        sax_config.top_level_elements["enclosure"].clear

        element :title

        element :"content:encoded", as: :content
        element :"a10:content",     as: :content

        element :description,       as: :summary

        element :link,              as: :url
        element :"a10:link",        as: :url, value: :href

        element :author,            as: :author
        element :"dc:creator",      as: :author
        element :"a10:name",        as: :author

        element :pubDate,           as: :published
        element :pubdate,           as: :published
        element :issued,            as: :published
        element :"dc:date",         as: :published
        element :"dc:Date",         as: :published
        element :"dcterms:created", as: :published

        element :"dcterms:modified", as: :updated
        element :"a10:updated",      as: :updated

        element :guid,               as: :entry_id, class: Feedjira::Parser::GloballyUniqueIdentifier
        element :"dc:identifier",    as: :dc_identifier

        element :comments

        elements :"media:content", as: :media, class: Feedjira::Parser::EntryMedia
        elements :category,        as: :categories

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

      def entry_id
        @entry_id&.guid
      end

      def url
        @url || @entry_id&.url
      end

      def id
        entry_id || @dc_identifier || @url
      end

      def chapters
        raw_chapters.sort_by(&:start)
      end
    end
  end
end
