module Understand
	class Configuration
		attr_accessor 	:fields_separetor, :log_file_foulder, :db_name, :db_location

		attr_reader 	:gem_path, :processes_logs_foulder

	  	def initialize
	  		# fields_separetor 	=> TOKEN THAT SPLIT THE LOG DATA IN THE LOG FILES
	  		@fields_separetor 		= ';'

	  		# log_file_foulder 	=> FOULDER WHERE THE LOG FILES WAS STORED
	  		@log_file_foulder 		= 'understand/log/'

	  		# db_location 		=> FOULDER WHERE THE GEM DATA BASE WAS STORED
	  		@db_location 			= 'understand/data/'

	  		@gem_path 				= File.dirname(__FILE__).gsub(/(\/[\w]+){2}$/, '')
	  		@processes_logs_foulder = 'processes_log/'
	  		@db_name				= 'understand.db'
	  	end

	  	def log_file_path
	  		@log_file_foulder
	  	end

	  	def processes_logs_path
	  		log_file_path + @processes_logs_foulder
	  	end

	  	def db_path
	  		@db_location + @db_name
	  	end

	  	def [](method)
	  		permetted_methods 	= [:fields_separetor, :log_file_foulder, :gem_path, :log_file_path, :processes_logs_path]

	  		method 				= method.to_sym unless method.kind_of?(Symbol)

	  		if permetted_methods.include?(method)
	  			send(method)
	  		else
	  			raise "No method #{method} for Configuration class"
	  		end
	  	end
	end
end