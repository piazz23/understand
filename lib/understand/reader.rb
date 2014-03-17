module Understand
	module Reader
		def self.initialize_db
			# WRITE THE DB SCHEMA
			query = [
				'CREATE TABLE requests(id INTEGER PRIMARY KEY, pid INT, action VARCHAR(30), controller VARCHAR(30), logged_at DATETIME)',
				'CREATE TABLE parameters(id INT PRIMARY KEY, request_id INT, name VARCHAR(50), value TEXT)'	
			]

			File.open(Understand.config.db_path, 'a')

			if File.exist?(Understand.config.db_path)
				db = SQLite3::Database.new Understand.config.db_path

				query.each do |q|
					db.execute q
				end
			else
				raise "DB file doesn't exist"
			end
		end

		def self.parse_tmp_files
			# PARSE EACH TMP FILE
			Dir["#{Understand.config.processes_logs_path}/*.tmp"].each do |file|
				incomplete_lines = []

				File.open(file, 'r').each_line do |line|
					line = line.gsub("\n", "")
					data = line.split(Understand.config.fields_separator)

					pid 		= data[Understand.config.log_file_pattern[:pid]]
					action 		= data[Understand.config.log_file_pattern[:action]]
					controller 	= data[Understand.config.log_file_pattern[:controller]]
					start_at 	= data[Understand.config.log_file_pattern[:start_at]]
					finish_at 	= data[Understand.config.log_file_pattern[:finish_at]]

					Understand::Request.create(
						:pid 		=> pid,
						:action 	=> action,
						:controller 	=> controller,
						:start_at 	=> start_at,
						:finish_at 	=> finish_at
					)

					incomplete_lines << line if finish_at == nil
				end

				if incomplete_lines.empty?
					File.delete(file)
				else
					File.open(file, 'w') {|f| f.write(incomplete_lines.join("\n")) }
				end

			end
		end
	end
end
