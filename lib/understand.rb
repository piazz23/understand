require_foulders = [
	'understand', 'understand/reader', 'understand/writer',
	'../app/models/understand/', '../app/controllers/understand',
	'../app/views/understand', '../config', 
]

require_foulders.each do |foulder|
	Dir["#{File.dirname(__FILE__)}/#{foulder}/*.rb"].each do |file|
		require file if file != __FILE__
	end
end

require_foulders.each do |foulder|
	Dir["#{File.dirname(__FILE__)}/#{foulder}/*.erb"].each do |file|
		require file if file != __FILE__
	end
end

module Understand
	private
	@configuration = nil

	public
	def self.config
		if @configuration == nil
			@configuration ||= Understand::Configuration.new(false)
		
			yield(@configuration) if block_given?

			@configuration.init
		end

		@configuration
	end
end


