require 'understand/version'
require 'understand/action_controller'
require 'understand/configuration'
require 'understand/reader/reader'
require 'understand/writer/writer'

module Understand
	@config = Understand::Configuration.new

	def self.config
		if block_given?
			yield(@config)
		else
			@config
		end
	end
end
