require 'active_record'

module Understand
	module Model
		TABLES = {
			:requests 	=> {
				pid: 		:integer,
				action: 	"VARCHAR(40)",
				controller: "VARCHAR(40)",
				start_at: 	:datetime,
				finish_at: 	:datetime
			},
			:parameters => {
				request_id: :integer,
				name: 		"VARCHAR(50)",
				value: 		:text
			}
		}

		def self.init_db(connection_opt)
			Understand.constants.each do |constant|
				_class = ("Understand::" + constant.to_s).constantize
				_class.establish_connection(connection_opt) if _class.methods.include?(:establish_connection)
			end
		end

		def self.connect_to_db(connection_opt)
			Understand.constants.each do |constant|
				_class = ("Understand::" + constant.to_s).constantize
				_class.establish_connection(connection_opt) if _class.methods.include?(:establish_connection)
			end
		end
	end
end