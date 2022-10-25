require_relative "Bag"
require_relative "Cup"

class Player

    # Constructor (ie Player.new("gandalf")"))
    def initialize(name = "")
        @name = name
        @bag = Bag.new()
        @cup = Cup.new()

        @throw_results_array = []
        # Array of all past throw results (result onjects)
    end

    # Returns the name of the player (does not set it)
    def name
        @name
    end

    # Stores the item in the player’s bag
    # Returns self (for method chaining
    def store(randomizer_item)
        @bag.store(randomizer_item)
        self
    end

    # Gets each item in randomizerContainer and stores it in the player’s bag
    # Returns self (for method chaining)
    def move_all(randomizer_container)
        @bag.move_all(randomizer_container)
        self
    end

    def get_num_randomziers
        @bag.count
    end

    # Loads items from the player’s bag to the player’s cup based on
    #   the description
    # Returns self (for method chaining)
    def load(description)
        swap_based_on_description(description, @bag, @cup)
        self
    end

    # Replaces the items selected by the description from the cup into the bag
    # Returns self (for method chaining)
    def replace(description)
        swap_based_on_description(description, @cup, @bag)
        self
    end

    # Swaps items between the old and new containers based on the description
    # If randomizers match the description they get moved, if they dont have
    #   a description they'll get moved
    def swap_based_on_description(description, old_container, new_container)
        hand = old_container.empty
        randomizer_object = hand.next

        until randomizer_object.equal?(nil)
            if randomizer_object.matches?(description)
                new_container.store(randomizer_object)
            else
                old_container.store(randomizer_object)
            end

            randomizer_object = hand.next
        end

        self
    end

    # Gets the number of randomizers in cup
    def get_num_objects_in_cup
        @cup.count
    end

    # Gets all the objects the player has on them (Their bag and cup)
    def get_all_objects_player_has
        @bag.count + @cup.count
    end

    # Throws the loaded cup
    # Store and return the Results (object) of the “thrown items” (which are
    #   still stored in the cup)
    def throw
        # If there is nothing loaded in the cup, return nil
        nil if @cup.count.equal?(0)

        @cup = @cup.dup

        throw_res = @cup.throw.clone

        @throw_results_array.push(throw_res)
        throw_res
    end

    # Clears all stored results
    # Returns self (for method chaining)
    def clear
        @throw_results_array = []
        self
    end

    # Sets the description, and calls tally() on each of the stored results
    #   and returns each of the values within a single array
    def tally(description)
        results_array = []

        @throw_results_array.each do |result|
            result.description(description)
            results_array.push(result.tally)
        end

        results_array
    end

    # Sets the description, and calls sum() on each of the stored results
    #   and returns the combined values as an array
    def sum(description)
        results_sum = 0

        @throw_results_array.each do |result|
            result.description(description)
            results_sum += result.sum
        end

        results_sum
    end

    # Sets the description and returns the result values as an array,
    #   where the last Results is “throw=0”, the throw before is “throw=1”, etc.
    # If a throw is requested that doesn’t exist (too far back in time and never
    #   occurred), return nil
    # Here a “throw” is short for “the result of a given throw”
    def results(description, throw_arg)
        return nil if throw_arg + 1 > @throw_results_array.length

        results_array = []
        for i in 0..(throw_arg)
            @throw_results_array[i].description(description)
            results_array.push(@throw_results_array[i].results)
        end

        results_array
    end

    # To String method
    def to_s
        @name + " has " + @bag.count.to_s + " randomizers in their bag, and " +
        @cup.count.to_s + " randomizers in their cup"
    end
end
