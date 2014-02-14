module Understand
	class Configuration
		attr_accessor 	:fields_separator, :log_file_folder, :db_name

		attr_reader 	:gem_path, :processes_logs_folder, :log_file_pattern,
						:db_configuration, :db_location

	  	def initialize(connection_flag=true)
	  		@gem_path 				= File.dirname(__FILE__).gsub(/(\/[\w]+){2}$/, '')
	  		@processes_logs_folder = 'processes_log/'
	  		@db_name				= 'understand.db'

	  		# [rw] 	fields_separator 	=> TOKEN THAT SPLIT THE LOG DATA IN THE LOG FILES
	  		@fields_separator 		= ';'

	  		# [rw]	log_file_folder 	=> folder WHERE THE LOG FILES WAS STORED
	  		@log_file_folder 		= 'understand/log/'

	  		# [r]	db_location 		=> folder WHERE THE GEM DATA BASE WAS STORED
	  		@db_location 			= 'understand/data/'

	  		# [r]	log_file_pattern 	=> DEFINE THE PATTER OF THE DATA IN THE LOG FILE 
	  		@log_file_pattern 		= Pattern.new(Understand::Model::TABLES[:requests].keys)

	  		init if connection_flag
	  	end

	  	def init
	  		# [r]	log_file_pattern 	=> DEFINE THE PATTER OF THE DATA IN THE LOG FILE 
	  		@db_configuration = {
	  			:adapter  => 'sqlite3',
				:database => db_path
	  		}

	  		Understand::Model.init_db(@db_configuration)

	  		Understand::Model.connect_to_db(@db_configuration)
	  	end

	  	def log_file_path
	  		@log_file_folder
	  	end

	  	def processes_logs_path
	  		log_file_path + @processes_logs_folder
	  	end

	  	def db_path
	  		@db_location + @db_name
	  	end

	  	def [](method)
	  		permitted_methods 	= [:fields_separator, :log_file_folder, :gem_path, :log_file_path, :processes_logs_path]

	  		method 				= method.to_sym unless method.kind_of?(Symbol)

	  		if permitted_methods.include?(method)
	  			send(method)
	  		else
	  			raise "No method #{method} for Configuration class"
	  		end
	  	end
	end
end