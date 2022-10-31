class RandomizerCollection
	def count
		@items.length
	end

	def store(r)			
		raise ArgumentError, "argument #{r} is not  a randomizer" unless r.is_a? Randomizer
		@items << r
		self
	end

	def store_all(randomizers)
		randomizers.each do |item|
			self.store item
		end
		self
	end

	# gets each randomizer in rc & stores items in the new collection, emptying rc by the end
	def move_all(rc) 	
		self.store_hand rc.empty_to_hand
		self
	end

	def store_hand(items)
		while (item = items.next) != nil
			self.store(item) 
		end
		self
	end

	def select(description, amt=:all)  	
		#initialize return object
		hand = Hand.new

		# initialize local variables
		amt = self.count if (amt == :all) 
		indices_to_delete = []
		
		# selects items from randomizer collection based on the description
		@items.each.with_index do |item, i|
			if description.all_match item
				indices_to_delete << i 
				hand.store item
			end

			# up to the number entered into amount
			if indices_to_delete.length >= amt
				break
			end
		end

		# remove selected items from the randomizer collection
		remove_at indices_to_delete

		#  return the Hand object that is holding the selected items
		hand

	end

	# returns a Hand of all items in the collection and resets the collection (sets it to empty)
	def empty_to_hand
		hand = Hand.new
		@items.each { |item| hand.store(item) }   # copies references of our items to hand
		reinitialize                              # eliminates reference to our former items in us
		hand
	end

	def empty
		self.empty_to_hand
	end

	def reset
		@items.each { |item| item.reset }
		self
	end

	# change items for clones; the item content is the same but now resides elsewhere in memory 
	# the originals items are discarded from this object, but if they reside elsewhere
	# in another container/object, they are left alone and untouched
	def dup_items							
		@items = @items.map { |it| it.dup }
		self
	end

	def duplicate 				# a deep copy
		sd = self.dup
		sd.dup_items
	end

	def initialize(it = [])
		@items = it
	end

	private

	def reinitialize
		@items = []
	end

	def remove_at(indices)
		indices.reverse.each do |del|			# reverses to delete from back to front, ow unstable
			@items.delete_at del 				# delete.at is an array method
		end
	end

end
