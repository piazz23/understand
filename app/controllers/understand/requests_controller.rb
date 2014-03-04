module Understand
	class RequestsController < ActionController::Base
		def index
			Understand::Reader.parse_tmp_files
			render :json => nil
		end

	end
end