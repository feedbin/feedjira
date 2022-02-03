# frozen_string_literal: true

module Feedjira
  module ItunesFeedUtilities
    def self.included(mod)
      mod.class_exec do
        element :"itunes:author", as: :itunes_author
        element :"itunes:block", as: :itunes_block
        element :"itunes:image", value: :href, as: :itunes_image
        element :"itunes:explicit", as: :itunes_explicit
        element :"itunes:complete", as: :itunes_complete
        element :"itunes:keywords", as: :itunes_keywords
        element :"itunes:type", as: :itunes_type
        element :"itunes:new_feed_url", as: :itunes_new_feed_url
        element :"itunes:subtitle", as: :itunes_subtitle
        element :"itunes:summary", as: :itunes_summary
        elements :"itunes:category", as: :_itunes_categories, class: Feedjira::Parser::ITunesRSSCategory
        elements :"itunes:owner", as: :itunes_owners, class: Feedjira::Parser::ITunesRSSOwner

        private :_itunes_categories

      end
    end

    def itunes_categories
      _itunes_categories.flat_map do |itunes_category|
        itunes_category.enum_for(:each_subcategory).to_a
      end
    end

    def itunes_category_paths
      _itunes_categories.flat_map do |itunes_category|
        itunes_category.enum_for(:each_path).to_a
      end
    end
  end
end
