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
			
		end
	end
end