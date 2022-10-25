require_relative "Randomizer"

class Coin < Randomizer

    # Constructor (i.e. Coin.new(denomination))
    def initialize(denomination)
        super()
        @has_been_flipped = false
        set_description({
            "item" => :coin,
            "sides" => 2,
            "denomination" => denomination
        })
    end

    # Returns the denomination of the coin (does not set it)
    def denomination
        @description["denomination"]
    end

    # Flips the coin
    # Returns self (for method chaining)
    # Is a synonym for randomize()
    def flip
        @has_been_flipped = true
        randomize()
        self
    end

    # Returns :H or :T (the result of the last flip)
    #   or nil (if no flips yet done)
    # is a synonym for result()
    def sideup
        nil if @has_been_flipped.equal?(false)
        flip_result = result

        # Heads = 1, Tails = 0
        if flip_result.equal?(1)
            set_description({"up" => :H})
        elsif flip_result.equal?(0)
            set_description({"up" => :H})
        else
            set_description({"up" => nil})
        end

        @description["up"]
    end

    # To string method
    def to_s
        "Coin: #{@denomination}"
    end
end