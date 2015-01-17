class Restaurant

	@@filepath = nil

	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end

	def self.file_exists?
		# class should know if restaurant file exists
		if @@filepath && File.exists?(@@filepath)
			return true
		else
			return false
		end
	end

	def self.create_file
		# create the restaurant file if it doesnt exist
	end

	def self.saved_restaurants
		# read the restaurant file
		# return instances of restaurant
	end

end