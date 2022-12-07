module Feedjira
  module Parser
    class EntryMedia
      include SAXMachine
      element :"media:content",    as: :height,           value: :height
      element :"media:content",    as: :type,             value: :type
      element :"media:content",    as: :url,              value: :url
      element :"media:content",    as: :width,            value: :width
      element :"media:starRating", as: :star_average,     value: :average
      element :"media:starRating", as: :star_count,       value: :count
      element :"media:statistics", as: :views,            value: :views
      element :"media:thumbnail",  as: :thumbnail_height, value: :height
      element :"media:thumbnail",  as: :thumbnail_url,    value: :url
      element :"media:thumbnail",  as: :thumbnail_width,  value: :width
      element :"media:title",      as: :title
    end
  end
end
