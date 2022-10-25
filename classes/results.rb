require_relative "Cup"

class Results

    # Constructor (i.e. Results.new(cup)
    def initialize(cup)
        @description = nil
        @results_array = []
        @cup = cup
    end

    # Stores a description in Results from which the “randomizer” objects
    #   stored in Results (i.e. in self)
    # Can be selected when computing the results, tally or sum
    def description(description)
        @description = description
        self
    end

    # Returns an array containing the “side-up” values of the
    #   randomizers recorded in the Results (i.e. in self).
    # Only include the values from randomizers that match
    #   the description stored in the Results.
    # If description() has not yet been called,
    # Return the results from all randomizers
    def results
        ranomizer_results = []

        if @description != nil

            @results_array.each do |result|
                if result.matches?(@description)
                    ranomizer_results.push(result.result)
                end
            end

        else
            @results_array.each do |result|
                ranomizer_results.push(result.result)
            end
        end

        ranomizer_results
    end

    # Counts the items in the randomizer that match the
    #   description and returns the value
    # If description() has not yet been called, count all randomizers
    def tally
        counter = 0

        if @description.equal?(nil)
            counter = @results_array.length

        else
            @results_array.each do |result|
                counter += 1 if result.matches?(@description)
            end
        end

        counter
    end

    # Totals the value of the randomizer items in the
    #   results that match the description, where the value
    # Equals the number that is “up” (for coins, :H = 1 and :T = 0),
    #   and returns the value
    # If description() has not yet been called, total
    #   the values across all randomizers
    def sum
        sum = 0

        if @description.equal?(nil)
            @results_array.each do |result|
                puts "Description: " + result.get_description.to_s
                sum += result.result
            end

        else
            @results_array.each do |result|
                if result.matches?(@description)
                    sum += result.result
                end
            end
        end

        sum
    end

    # Stores a randomizer in the Results (i.e. in self)
    def store(randomizer_instance)
        @results_array.push(randomizer_instance)
    end

    # To String method
    def to_s
        "Results: #{@description}, #{@results_array}"
    end
end
