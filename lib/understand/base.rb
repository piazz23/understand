class Base
	GEM_PATH			= File.dirname(__FILE__).gsub(/(\/[\w]+){2}$/, '')

  	FIELDS_SEPARTOR 	= ';'

  	LOG_FILE_PATH		= "#{GEM_PATH}/var/log.csv"
end