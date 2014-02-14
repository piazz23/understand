module Understand
	class Pattern
		attr :schema

		# def initialize(option)
		# 	defaul_schema = {
		# 		:log_file => {pid: 0, start_at: 1, finish_at: 2, controller: 3, action: 4, params: 5}
		# 	}

		# 	if option.kind_of?(Symbol)
		# 		@schema = defaul_schema[option]
		# 	elsif option.kind_of?(Hash)
		# 		raise "INVALID OPERATION - FOR NOW :D"
		# 	else
		# 		raise "INVALID OPERATION"
		# 	end
		# end

		def initialize(option)
			@schema = {}
			if option.kind_of?(Array)
				option.each_with_index{|sym, index| @schema[sym] = index}
			else
				raise "INVALID OPERATION"
			end
		end

		def to_array_pattern(values)
			response = []

			case values.class.to_s
			when "Hash"
				response = hash_to_array(values)
			else
				raise "INVALID OPERATION"
			end

			return response
		end

		private
		def hash_to_array(hash)
			array = []
			@schema.keys.each do |key|
				array << hash[key]
			end

			return array
		end

	end
end