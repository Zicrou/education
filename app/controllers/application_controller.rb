class ApplicationController < ActionController::Base
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent

	before_action :set_copyright

	def set_copyright
		@copyright = ZicrouViewTool::Renderer.copyright 'Zicrou Seck', 'All rights reserved'
	end
end
