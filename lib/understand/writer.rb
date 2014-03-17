module Understand
    module Writer
        # def self.save_process(params)
        #     # log_string  = [Process.pid.to_s,
        #     #               DateTime.now.strftime('%Y-%m-%d %H:%M:%S'),
        #     #               params[:controller],
        #     #               params[:action],
        #     #               "#{params.to_s}"].join(Understand.config.fields_separator)

        #     log_string  = Understand.config.log_file_pattern.to_array_pattern(
        #                     :pid => Process.pid.to_s, :start_at => DateTime.now.strftime('%Y-%m-%d %H:%M:%S'),
        #                     :controller => params[:controller], :action => params[:action],
        #                     :params => params.to_s
        #     ).join(Understand.config.fields_separator)

        #     response    = self.write_log(log_string)
        
        #     # Rails.logger.info "\n\n-- Foulder not found --\n\n" unless response

        #     unless response
        #         # if File.directory?(Rails.root + Base::LOG_FILE_PATH) == false
        #         if File.directory?(Understand.config.log_file_path) == false
        #             `mkdir #{Understand.config.log_file_path}`
        #             # Rails.logger.info "\n\n-- mkdir #{Understand.config.log_file_path} --\n\n"
        #         end

        #         # if File.directory?(Rails.root + Base::LOG_FILE_PATH + "processes_log/") == false
        #         if File.directory?(Understand.config.processes_logs_path) == false
        #             `mkdir #{Understand.config.processes_logs_path}`
        #             # Rails.logger.info "\n\n-- mkdir #{Understand.config.processes_logs_path} --\n\n"
        #         end

        #         # if File.directory?(Rails.root + Base::LOG_FILE_PATH) && File.directory?(Rails.root + Base::LOG_FILE_PATH + "processes_log/")
        #         if File.directory?(Understand.config.log_file_path) && File.directory?(Understand.config.processes_logs_path)
        #             raise "-- The understand log directory already exist --"
        #         end 

        #         self.write_log(log_string, false)
        #     end
        # end
        # 
        
        def self.open_request(params)
            request = Understand::Request.create(
                pid:        Process.pid.to_s,
                start_at:   DateTime.now.strftime('%Y-%m-%d %H:%M:%S:%L'),
                controller: params[:controller],
                action:     params[:action]
            )
        end

        def self.close_request(request)
            request.update_attributes(finish_at: DateTime.now.strftime('%Y-%m-%d %H:%M:%S'))
        end

        private
        def self.write_log(log_string, rescue_flag=true)
            # Rails.logger.info "\n\n-- write_log function called --\n\n"
            if rescue_flag
                File.open(Understand.config.processes_logs_path + "#{Process.pid}.tmp", 'a') { |f| f.write(log_string + "\n") } rescue false
                # File.open(Rails.root + Understand.config.processes_logs_path + "#{Process.pid}.tmp", 'a') { |f| f.write(log_string + "\n") } rescue false
            else
                File.open(Understand.config.processes_logs_path + "#{Process.pid}.tmp", 'a') { |f| f.write(log_string + "\n") }
                # File.open(Rails.root + Base::LOG_FILE_PATH + "processes_log/#{Process.pid}.tmp", 'a') { |f| f.write(log_string + "\n") }
            end
        end 
    end
end
