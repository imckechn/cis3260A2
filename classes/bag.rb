require_relative "RandomizerContainer"
require_relative "Hand"

class Bag < RandomizerContainer

    def initialize
        super
    end

    # Empties all elements from the Bag into a Hand, which is returned
    def empty
        hand = Hand.new()
        hand.move_all(self)
        @randomizer_list = []
        hand
    end

    # To string method
    def to_s
        "Bag with " + @randomizer_list.length.to_s + " randomizers"
    end
end
