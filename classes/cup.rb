require_relative "RandomizerContainer"
require_relative "Hand"
require_relative "Results"
require_relative "Cup"

class Cup < RandomizerContainer

    def initialize
        super
    end

    # Enters each randomizer from a Hand (synonym of move_all() )
    def load(hand)
        @randomizer_list.concat(hand.get_all)
        self
    end

    # Returns a Hand object to be returned to the bag, and leaves the cup empty
    def empty
        hand = Hand.new()
        hand.move_all(self)
        @randomizer_list = []
        hand
    end

    # Each randomizer in the cup is rolled or flipped
    # The results of the thrown randomizers are stored in
    #   a newly created Results object, which is returned
    def throw
        results = Results.new(Cup.new())

        @randomizer_list.each do |randomizer|
            randomizer_2 = Randomizer.new()

            # Completely erase the randomizer's description
            randomizer_2.set_description(nil)

            # Set the description
            randomizer_2.set_description(randomizer.get_description)

            randomizer_2.randomize()

            results.store(randomizer_2)
        end

        results
    end

    # To string method
    def to_s
        "Cup with " + @randomizer_list.length.to_s + " randomizers"
    end
end
