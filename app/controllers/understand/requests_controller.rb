module Understand
	class RequestsController < ::ApplicationController
	    def index
	    	@requests 	= Understand::Request.all

	    	if params[:filter].present?
	    		@requests = @requests.where("finish_at IS NULL") if params[:filter] == 'null_finish_at'
	    		@requests = @requests.order("finish_at - start_at") if params[:filter] == 'order_by_time_spent'
	    	end

	    	page 		= params[:page] || 1
	    	per_page 	= params[:per_page] || 20

	    	@requests 	= @requests.offset(page * per_page - per_page).limit(per_page)
	    	# @requests = @requests.paginate :page => params[:page], :per_page => params[:per_page]
	    end

	    def parse_tmp_files
	    	Reader.parse_tmp_files

	    	redirect_to :back
	    end

	    def delete_all
			Understand::Request.all.delete_all
				    	
	    	redirect_to :back, notice: "All requests was deleted"
	    end
  	end
end