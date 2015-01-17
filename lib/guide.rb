require 'restaurant'
class Guide
	
	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions; @@actions; end
	end

	def initialize(path=nil)
		# locate the restaurant text file at path
		Restaurant.filepath = path
		if Restaurant.file_usable?
			puts "Found restaurant file."
		# or create a new file
		elsif Restaurant.create_file
			puts "Created restaurant file."
		# exit if create fails
		else
			puts "Exiting.\n\n"
			exit!
		end
	end

	def launch!
		introduction
		result = nil
		until result == :quit
		action = get_action
		result = do_action(action)
		end
			conclusion
	end

	def get_action
		action = nil
		until Guide::Config.actions.include?(action)
			puts "Actions: " + Guide::Config.actions.join(", ") if action
			print "> "
			user_response = gets.chomp
			action = user_response.downcase.strip
		end
		return action
	end


	def do_action(action)
		case action
		when 'list'
			puts 'Listing...'
		when 'find'
			puts 'Finding...'
		when 'add'
			add
		when 'quit'
			return :quit
		else
			puts "\nI don't understand that command.\n"
		end
	end

	def add
		puts "\nAdd a restaurant\n\n".upcase
		restaurant = Restaurant.new

		print "Restaurant name: "
		restaurant.name = gets.chomp.strip

		print "Cuisine type: "
		restaurant.cuisine = gets.chomp.strip

		print "Average Price: "
		restaurant.price = gets.chomp.strip

		if restaurant.save
			puts "\nRestaurant Added\n\n"
		else
			puts "\nSave Error: restaurant not added\n\n"
	end

	def introduction
		puts "\n\n<< Welcome to the Food Finder >>\n\n"
		puts "This is an interactive guide to help you find the food you crave.\n\n"
	end

	def conclusion
		puts "\n<< Goodbye and Bon Appetit! >>\n\n\n"
	end

end
