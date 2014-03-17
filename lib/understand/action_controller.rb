require 'action_controller/railtie'
require_relative 'writer'

module Understand
	class ActionController::Base

		before_filter :catch_start_request
		after_filter :catch_finish_request

		def catch_start_request
			@unserstand_request = Writer.open_request(params) unless params[:controller].match /^understand\//
		end

		def catch_finish_request
			Writer.close_request(@unserstand_request) unless params[:controller].match /^understand\//
		end
	end
end