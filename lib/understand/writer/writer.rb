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
                Rails.logger.info "\n\n-- mkdir #{Rails.root + Base::LOG_FILE_PATH} --\n\n"
    		end

    		if File.directory?(Rails.root + Base::LOG_FILE_PATH + "processes_log/") == false
    			`mkdir #{Rails.root + Base::LOG_FILE_PATH}processes_log/`
                Rails.logger.info "\n\n-- mkdir #{Rails.root + Base::LOG_FILE_PATH}processes_log/ --\n\n"
    		end

            if File.directory?(Rails.root + Base::LOG_FILE_PATH) && File.directory?(Rails.root + Base::LOG_FILE_PATH + "processes_log/")
                raise "\n\n-- The understand log directory already excist --\n\n"
            end 

    		self.write_log(log_string)
    	end
	end

	private
	def self.write_log(log_string)
		File.open(Rails.root + Base::LOG_FILE_PATH + "processes_log/#{Process.pid}.tmp", 'a') { |f| f.write(log_string + "\n") } rescue false
	end
end
