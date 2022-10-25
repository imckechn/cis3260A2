class RandomizerContainer

    def initialize
        @randomizer_list = []
    end

    # Stores a randomizer in the container
    # Returns self (for method chaining)
    def store(randomizer)
        @randomizer_list.push(randomizer)
        self
    end

    # Stores all randomizers from a list
    # Returns self (for method chaining)
    def store_all(list)
        @randomizer_list.concat(list)
        self
    end

    # Returns the count of all randomizer stored in itself
    def count
        if (@randomizer_list.equal?(nil))
            0
        else
            @randomizer_list.length
        end
    end

    # Remove each randomizer in rc & store it in self
    # Returns self (for method chaining)
    def move_all(randomizer_container)
        @randomizer_list.concat(randomizer_container.get_all)
        self
    end

    def get_all
        @randomizer_list
    end

    # Abstract method that should remove all members from the container
    def empty
        @randomizer_list = []
        self
    end


    # Selects items based on the description provided
    #   (see the section on descriptions on pg. 5)
    # Remove the selected items from self;
    # Returns a Hand object that holds the selected items
    #  up to the number entered into amount
    #   (if you want all items, supply the symbol :all instead of a number
    def select(description, amt=:all)
        counter_amount = 0
        hand = Hand.new()

        @randomizer_list.each do |randomizer|
            if random.matches?(description)
                hand.store(random)
                counter_amount += 1
                break if amt != :all and counter_amount >= amt
            end
        end

        hand
    end

    def to_s
        "RandomizerContainer, #{@randomizer_list.length} randomizers"
    end
end
