require_relative '../base'

module Writer
	def self.save_process(params)
		log_string 	= [Process.pid.to_s,
	                  DateTime.now.strftime('%Y-%m-%d %H:%M:%S'),
	                  params[:controller],
	                  params[:action],
	                  "#{params.to_s}"].join(Base::FIELDS_SEPARTOR)

    	response 	= self.write_log(log_string)
	
    	unless response
    		if File.directory?(Rails.root + Base::LOG_FILE_PATH) == false
    			`mkdir #{Rails.root + Base::LOG_FILE_PATH}`
    		end

    		if File.directory?(Rails.root + Base::LOG_FILE_PATH + "processes_log/") == false
    			`mkdir #{Rails.root + Base::LOG_FILE_PATH}processes_log/`
    		end

    		self.write_log(log_string)
    	end
	end

	private
	def self.write_log(log_string)
		File.open(Rails.root + Base::LOG_FILE_PATH + "processes_log/#{Process.pid}.tmp", 'a') { |f| f.write(log_string + "\n") } rescue false
	end
end