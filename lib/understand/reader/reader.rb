require_relative '../base'

module Reader
	DB_LOCATION = 'understand/data/'
	DB_NAME		= 'understand.db'

	def self.initialize_db
		# WRITE THE DB SCHEMA
		query = [
			'CREATE TABLE requests(id INTEGER PRIMARY KEY, pid INT, action VARCHAR(30), controller VARCHAR(30), logged_at DATETIME)',
			'CREATE TABLE parameters(id INT PRIMARY KEY, request_id INT, name VARCHAR(50), value TEXT)'	
		]

		File.open(db_path, 'a')

		if File.exist?(db_path)
			db = SQLite3::Database.new db_path

			query.each do |q|
				db.execute q
			end
				
		else Exception => e
			raise "Error while creating db file => #{e.message}"
		end
	end


	private 
	def self.db_path
		return DB_LOCATION + DB_NAME
	end

end