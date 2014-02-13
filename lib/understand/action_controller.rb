require 'action_controller/railtie'
require_relative 'writer/writer'

module Understand
	class ActionController::Base

		before_filter :catch_info

			def catch_info
				Writer.save_process(params)
			end
	end
end