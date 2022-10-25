require_relative "Randomizer"

class Die < Randomizer

    # Constructor (i.e. Die.new(sides, colour))
    def initialize(sides, colour)
        super()
        set_description({"item" => :die, "colour" => colour, "sides" => sides})
    end

    # Returns the colour of the die (does not set it)
    def colour
        @description["colour"]
    end

    # Returns the number of sides ( does not set it)
    def sides
        @description["sides"]
    end

    # Randomizes and returns self (for method chaining)
    # Is a synonym for randomize()
    def roll
        randomize()
        self
    end

    # Returns 1..sides or nil
    # Is a synonym for result()
    def sideup
        answer = result

        if answer.equal?(nil)
            nil
        else
            result + 1
        end
    end

    # To string method
    def to_s
        "Die: #{@colour}"
    end

end
