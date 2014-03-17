require "active_support/dependencies"

require_foulders = [
	'understand', '../app/models/understand/' 
]

require_foulders.each do |foulder|
	Dir["#{File.dirname(__FILE__)}/#{foulder}/*.rb"].each do |file|
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

	# Require our engine
	require "understand/engine"
end