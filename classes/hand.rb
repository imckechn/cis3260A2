require_relative 'RandomizerContainer'

class Hand < RandomizerContainer

    def initialize
        super
    end

    # Removes and returns the last objected added to the hand
    # If no objects are in the hand, return nil
    def next
        if count() > 0
            @randomizer_list.pop
        else
            nil
        end

    end

    # Returns nil (items are “dropped on the ground”)
    #   i.e. the pointers to the contained objects are lost (and
    # The objects will be garbage collected by the system)
    def empty
        @randomizer_list = []
        nil
    end

    # To String method
    def to_s
        "Hand with " + @randomizer_list.length.to_s + " randomizers"
    end
end