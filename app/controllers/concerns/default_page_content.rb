module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "CiiLaaBokk | Education"
		@seo_keywords = "Zicrou CiiLaaBokk CLBK SK8Z"
	end
end