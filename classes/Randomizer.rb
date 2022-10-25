class Randomizer

    def initialize
        @has_been_rolled = false
        @description = {}
        set_description({"up" => nil, "call_count" => 0, "sides" => -1})
    end

    # Both randomizes as well as returns self (for method chaining)
    def randomize
        return false if @description['sides'].equal?(-1)

        @has_been_rolled = true
        call_count = @description['call_count'] + 1

        roll_value = rand(0.. @description['sides'] - 1)
        set_description({"up" => roll_value, "call_count" => call_count})

        self
    end

    # Returns the result of the randomization, or nil if never randomized
    def result
        if @has_been_rolled.equal?(false)
            nil
        else
            @description['up']
        end
    end

    # Returns the number of randomizations performed
    def calls
        @description['call_count']
    end

    # Sets the result to nil and number of randomizations performed to 0
    # Returns self (for method chaining)
    def reset
        set_description({"up" => nil, "call_count" => 0})
        self
    end

    def get_num_faces
        @description["sides"]
    end

    def set_description(description)
        if description.equal?(nil) or description.equal?({})
            @description = {}
            return
        end

        description.each do |key, value|
            if @description.has_key?(key)
                @description[key] = value
            else
                @description.store(key, value)
            end
        end
    end

    def get_description
        @description
    end

    # Check if the description given matches the one in the randomizer,
    #   if so return true
    def matches?(description_arg_hash)
        keys_matched_counter = 0

        if description_arg_hash.equal?({})
            return true
        else

            description_arg_hash.each do |key, value|
                if !@description.has_key?(key)
                    return false
                elsif @description[key] != value
                    return false
                end
            end

            return true
        end
    end

    # To string method
    def to_s
        "Randomizer: #{@description}}"
    end
end

