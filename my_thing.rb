class Bear

	attr_reader :size
	attr_accessor :color

	def initialize(size, color = :brown)
		@size = size
		@color = color
	end
end

class CaptiveBear < Bear

	attr_writer :captive
	@@tracked = 0

	def initialize(size, color = :brown)
		super(size, color)
		@@tracked += 1
	end

	def self.capture(bear)
		if not bear.instance_of? CaptiveBear
			@@tracked += 1
		return bear
	end

	def self.tracked_bears
		return @@tracked
	end
	
	def self.reset_tracking
		@@tracked = 0
	end
end
