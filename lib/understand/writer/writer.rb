require_relative '../base'

module Writer
	def self.save_process(params)
		log_string = [Process.pid.to_s,
	                  DateTime.now.strftime('%Y-%m-%d %H:%M:%S'),
	                  params[:controller],
	                  params[:action],
	                  "#{params.to_s}"].join(Base::FIELDS_SEPARTOR)

    	Rails.logger.info "\n\n#{log_string}\n\n"

    	File.open(Base::LOG_FILE_PATH, 'a') { |f| f.write(log_string + "\n") }
	end
end