module RequestsHelper
	def time_difference(start_at, end_at)
		difference = "∞" if end_at == nil
		difference ||= end_at.to_i - start_at.to_i
	end
end
