module Feedjira
  module AtomEntryElements
    def self.included(base)
      base.element :link, as: :url, value: :href, with: { rel: "alternate" }
      base.element :link, as: :url, value: :href, with: { rel: "alternate", type: "text/html" }
      base.element :title
      base.element :name, as: :author
      base.element :content
      base.element :summary
      base.element :published
      base.element :id, as: :entry_id
      base.element :created, as: :published
      base.element :issued, as: :published
      base.element :updated
      base.element :modified, as: :updated
      base.elements :category, as: :categories, value: :term
      base.elements :link, as: :links, value: :href
    end

    def url
      @url ||= links.first
    end
  end
end
