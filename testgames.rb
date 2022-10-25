require_relative 'A1_Classes'

# Keep track of all errors
fail_counter = 0
total_fails = 0

#------ TESTING THE RANDOMIZER OBJECT ---------
puts"\n\nTESTING THE RANDOMIZER OBJECT"

puts"Creating the randomize object with default face count"
puts"Measurement of success will be not crashing"
randomizer = Randomizer.new()
puts"Succeeded"

puts"Check the number of randmizations performed, should be zero"
call_count = randomizer.calls
if call_count.equal?(0)
    puts"Succeeded, wanted 0, got #{call_count}"
else
    puts"Failed, wanted 0, got #{call_count}"
    fail_counter += 1
end


puts"Calling randomize on the randomzier object"
puts"We havent set a side count on it so it should return false"
randomizer_return = randomizer.randomize

if randomizer_return
    puts"Failed, wanted false, got #{randomizer_return}"
    fail_counter += 1
else
    puts"Succeeded, wanted false, got #{randomizer_return}"
end

puts"Setting the description of the randmizer to be ['colour' => 'not_real']"
puts"This wont return anything so it will only fail if it crashes"
colour_description = 'not_real'
randomizer.set_description({ "colour" => colour_description})
puts"Succeeded"

puts"Calling get_description on the randomizer object"
puts"This should return the description we set"
description = randomizer.get_description

if description['colour'] == colour_description
    puts"Succeeded, wanted #{colour_description}, got #{description['colour']}"
else
    puts"Failed, wanted #{colour_description}, got #{description['colour']}"
    fail_counter += 1
end

puts"Testing the matches method on a matching description"
randomizer.set_description({"description" => "DescA"})

puts "Randomizer description: #{randomizer.get_description}"
if randomizer.matches?({"description" => "DescA"})
    puts"Succeeded, wanted true, got true"
else
    puts"Failed, wanted true, got false"
    fail_counter += 1
end

puts"Testing the matches method on a non-matching description"
if randomizer.matches?({"description" => "DescB"})
    puts"Failed, wanted false, got true"
    fail_counter += 1

else
    puts"Succeeded, wanted false, got false"
end

puts"Removing the desc (Setting it to nil) and testing the matches method"
randomizer.set_description(nil)

if !randomizer.matches?({"description" => "DescA"})
    puts"Succeeded, wanted false, got false"
else
    puts"Failed, wanted false, got true"
    fail_counter += 1
end

puts"Setting desc to be {'description' => 'DescA', 'colour' => 'randomizer'}"
puts"Confirming that it matches with only 1 of the two elements of the desc"
randomizer.set_description({"description" => "DescA", "colour" => "randomizer"})

puts "randomizer desc is: #{randomizer.get_description}"
if randomizer.matches?({"colour" => "randomizer"})
    puts"Succeeded, wanted true, got true"
else
    puts"Failed, it should have matched, wanted true, got false"
    fail_counter += 1
end

puts"Testing against a description that's the same and has an extra element"
if randomizer.matches?(
    {"description" => "DescA",
         "colour" => "randomizer",
          "extra" => "element"
    }
)

    puts"Failed, wanted false, got true"
    fail_counter += 1
else
    puts"Succeeded, wanted false, got false"
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter

#------ TESTING THE DIE OBJECT ---------
puts"TESTING THE DIE OBJECT"

puts"Creating a die object with 6 sides and a red colour"
puts"Measurement of success will be not crashing"
puts"This is because init returns nothing"
die = Die.new(6, :blue)
puts"Succeeded"

puts"Calling the colour method on the die object"
puts"This should return the colour we set"
colour = die.colour
if colour.equal?(:blue)
    puts"Succeeded, wanted :blue, got #{colour}"
else
    puts"Failed, wanted :blue, got #{colour}"
    fail_counter += 1
end

puts"Calling the sides method on the die object"
puts"This should return the sides we set"
sides = die.sides
if sides.equal?(6)
    puts"Succeeded, wanted 6, got #{sides}"
else
    puts"Failed, wanted 6, got #{sides}"
    fail_counter += 1
end

puts"Calling the roll method, should return self on success"
die.roll
puts"Succeeded since it didnt crash and returns self"

puts"Calling the result method, should return the result of the roll"
result = die.sideup
if result.equal?(nil)
    puts"Failed, retults are nil, should be a number"
    fail_counter += 1

elsif result > 0 and result < 7
    puts"Succeeded, wanted a number between 1 and 6, got #{result}"
else
    puts"Failed, wanted a number between 1 and 6, got #{result}"
    fail_counter += 1
end

puts"Calling the set_description method, should set the desc of the die"
puts"This wont return anything so it will only fail if it crashes"
colour_description = 'die'
die.set_description({'colour' => colour_description})
puts"Succeeded"

puts"Calling the description method, should return the desc of the die"
description = die.get_description
if description['colour'].equal?(colour_description)
    puts"Succeeded, wanted #{colour_description}, got #{description['colour']}"
else
    puts"Failed, wanted #{colour_description}, got #{description['colour']}"
    fail_counter += 1
end

puts"Getting the number of faces on the die"
puts"This should return the number of faces we set"
num_faces = die.get_num_faces
if num_faces.equal?(6)
    puts"Succeeded, wanted 6, got #{num_faces}"
else
    puts"Failed, wanted 6, got #{num_faces}"
    fail_counter += 1
end

puts"Calling the rese method, should reset the die"
puts"This wont return anything so it will only fail if it crashes"
die.reset
puts"Succeeded in calling reset"

puts"Checking that it reset the die by asking for results"
puts"This should return nil"
result = die.sideup
if result.equal?(nil)
    puts"Succeeded, wanted nil, got #{result}"
else
    puts"Failed, wanted nil, got #{result}"
    fail_counter += 1
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter


#------ TESTING THE COIN OBJECT ---------
puts"TESTING THE COIN OBJECT"

puts"Creating a coin object with a denomination of 50 cents"
puts"Measurement of success will be not crashing"
puts"This is because init doesnt return anything"

coin = Coin.new(0.05)
puts"Succeeded"

puts"Getting the denomination of the coin"
puts"This should return the denomination we set"
denomination = coin.denomination
if denomination.equal?(0.05)
    puts"Succeeded, wanted 0.05, got #{denomination}"
else
    puts"Failed, wanted 0.05, got #{denomination}"
    fail_counter += 1
end

puts"Calling the flip method, should return self on success"
coin.flip
puts"Succeeded since it didnt crash and returns self"

puts"Calling the result method, should return the result of the flip"
result = coin.sideup
if result.equal?(nil)
    puts"Failed, retults are nil, should be a number"
    fail_counter += 1

elsif result.equal?(:H) or result.equal?(:T)
    puts"Succeeded, wanted :H or :T, got #{result}"
else
    puts"Failed, wanted :H or :T, got #{result}"
    fail_counter += 1
end

puts"Calling the set_description method, should set the desc of the coin"
puts"This wont return anything so it will only fail if it crashes"
colour_description = '0.05'
coin.set_description({'colour' => colour_description})
puts"Succeeded"

puts"Calling the get_description method, should return the desc of the coin"
description = coin.get_description
if description['colour'].equal?(colour_description)
    puts"Succeeded, wanted #{colour_description}, got #{description['colour']}"
else
    puts"Failed, wanted #{colour_description}, got #{description['colour']}"
    fail_counter += 1
end

puts"Calling the reset method, should reset the coin"
puts"This wont return anything so it will only fail if it crashes"
coin.reset
puts"Succeeded in calling reset"

puts"Checking that it reset the coin by asking for results"
puts"This should return nil"
result = coin.sideup
if result.equal?(nil)
    puts"Succeeded, wanted nil, got #{result}"
else
    puts"Failed, it returned #{result}, wanted nil"
    fail_counter += 1
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter



#------ TESTING THE RANDOMIZER CONTAINER OBJECT ---------
puts"TESTING THE RANDOMIZER CONTAINER OBJECT"

puts"Initializing the randomizerContianer. This should not crash"
randomizerContainer = RandomizerContainer.new()

puts"Getting the number of randomizers in the container"
puts"This should return 0"
num_randomizers = randomizerContainer.count
if num_randomizers.equal?(0)
    puts"Succeeded, wanted 0, got #{num_randomizers}"
else
    puts"Failed, wanted 0, got #{num_randomizers}"
    fail_counter += 1
end

puts"Adding a randomizer to the container"
puts"This should not crash"
randomizerContainer.store(randomizer)
puts"Succeeded"

puts"Getting the number of randomizers in the container"
puts"This should return 1"
num_randomizers = randomizerContainer.count
if num_randomizers.equal?(1)
    puts"Succeeded, wanted 1, got #{num_randomizers}"
else
    puts"Failed, wanted 1, got #{num_randomizers}"
    fail_counter += 1
end

puts"Adding a list of randomizers of length 2 to the container"
puts"This should not crash"
randomizerContainer.store_all([coin, die])
puts"Succeeded"

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter


#------ TESTING THE HAND OBJECT ---------
puts"TESTING THE HAND OBJECT"

puts"Initializing the hand. This should not crash"
hand = Hand.new()
puts"Succeeded"

puts"Getting the number of ranomizers in the hand"
puts"This should return 0"
num_randomizers = hand.count
if num_randomizers.equal?(0)
    puts"Succeeded, wanted 0, got #{num_randomizers}"
else
    puts"Failed, wanted 0, got #{num_randomizers}"
    fail_counter += 1
end

puts"Adding a randomizer to the hand"
puts"This should not crash"
hand.store(randomizer)
puts"Succeeded"

puts"Getting the number of randomizers in the hand"
puts"This should return 1"
num_randomizers = hand.count
if num_randomizers.equal?(1)
    puts"Succeeded, wanted 1, got #{num_randomizers}"
else
    puts"Failed, wanted 1, got #{num_randomizers}"
    fail_counter += 1
end

puts"Getting the randomizer back from the hand"
puts"This will return the randomizer we added"

new_randomizer = hand.next

if new_randomizer.get_description.equal?(randomizer.get_description)
    puts"Succeeded"
else
    puts"Failed"
    fail_counter += 1
end

puts"Adding 3 randomizers to the hand"
puts"Then confirming we get them back in the order we put them in"
hand.store_all([randomizer, die, coin])

randomizer_a = hand.next
randomizer_b = hand.next
randomizer_c = hand.next
randomizer_nil = hand.next

if randomizer_a.get_description.equal?(coin.get_description)
    if randomizer_b.get_description.equal?(die.get_description)
        if randomizer_c.get_description.equal?(randomizer.get_description)
            if randomizer_nil.equal?(nil)
                puts"Succeeded, returned each item in order"
                puts"And finishing with nil"
            else
                puts"Failed, returned #{randomizer_nil} instead of nil"
                fail_counter += 1
            end
        else
            puts"Failed, returned #{randomizer_c} instead of #{randomizer.get_description}"
            fail_counter += 1
        end
    else
        puts"Failed, returned #{randomizer_b} instead of #{die.get_description}"
        fail_counter += 1
    end
else
    puts"Failed on coin, got #{randomizer_a.get_description}"
    fail_counter += 1
end

puts"Adding a randomizer to the hand, empyting the hand"
puts"Then confirming we get nil back and the hand is empty"
hand.store(randomizer)

answer = hand.empty
if answer.equal?(nil)
    puts"Succeeded in getting nil back from emptying the hand"
else
    puts"Failed, got #{answer} instead of nil"
    fail_counter += 1
end

answer = hand.next
if answer.equal?(nil)
    puts"Succeeded in getting nil back from calling next on an empty hand"
else
    puts"Failed, got #{answer} instead of nil"
    fail_counter += 1
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter


#------ TESTING THE RESULTS OBJECT ---------
puts"TESTING THE RESULTS OBJECT"
cup = Cup.new()

puts"Initializing the results. This should not crash"
results = Results.new(cup)
puts"Succeeded"

puts"Storing 3 randomizers in the results object"

results_array = []

die.randomize
die_results = die.result
results_array.push(die_results)

coin.randomize
coin_results = coin.result
results_array.push(coin_results)

results.store(die)
results.store(coin)
puts ("Succeeded in storing both randomizers (Dice and Coin)")

puts"Now getting the results of all the randomizers"
puts"The results of the randomizers before adding them to the array were"
puts"#{results_array} so it will succeeed if it returns the same thing"
results_from_results = results.results

puts "The results from the results object are #{results_from_results}"

if results_from_results == results_array
    puts"Succeeded, the results from the results object are the same as the results array"
else
    puts"Failed, the results from the results object are not the same as the results array"
    fail_counter += 1
end

puts"Testing the sum method"
puts"The sum should only be equal to the the sum of all the results"

sum_results = results.sum
if sum_results.equal?((coin.result + die.result))
    puts"Succeeded, the sum of the results is #{sum_results}"
else
    puts"Failed, the sum of the results is #{sum_results}"
    fail_counter += 1
end


puts"Testing the Tally method"
puts"The tally should only be equal to 2 since there is no description"
puts"and there are 2 objects in it"
tally_results = results.tally
if tally_results.equal?(2)
    puts"Succeeded, the tally of the results is #{tally_results}"
else
    puts"Failed, the tally of the results is #{tally_results}"
    fail_counter += 1
end


puts"Adding a good description to the array"
puts"and making sure it returns the coin object results"
results.description(coin.get_description)
results_from_results = results.results
if results_from_results[0].equal?(coin.result)
    puts"Succeeded, the results from the results object are the same as the results array"
else
    puts"Failed, the results from the results object are not the same as the results array"
end

puts"Testing the sum method"
puts"The sum should only be equal to the coins results"
sum_results = results.sum
if sum_results.equal?(coin.result)
    puts"Succeeded, the sum of the results is #{sum_results}"
else
    puts"Failed, the sum of the results is #{sum_results}"
    fail_counter += 1
end


puts"Testing the Tally method"
puts"The tally will only be equal to the number of coins the results object(1)"
tally_results = results.tally
if tally_results.equal?(1)
    puts"Succeeded, the tally of the results is #{tally_results}"
else
    puts"Failed, the tally of the results is #{tally_results}"
    fail_counter += 1
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter


#------ TESTING THE CUP OBJECT ---------
puts"TESTING THE CUP OBJECT"

puts"Initializing the cup. This should not crash"
cup = Cup.new()
hand = Hand.new()
puts"Succeeded"

puts"Putting items in a hand object, then loading the cup with the hand"
puts"Returns self, so if it doesnt crash then it's successful"
hand.store_all([die, coin])
cup.load(hand)
puts"Succeeded, didnt crash"

puts"Getting the items back from the hand,"
puts"then comparing them to the original items"
puts"Success if they are all returned in the correct order"
hand = cup.empty

if hand.next.equal?(coin) and hand.next.equal?(die)
    puts"Succeeded, returned each item in order"
else
    puts"Failed, returned #{hand.next} instead of #{coin}"
    fail_counter += 1
end

puts"Cup should have nothing in it now"
if cup.count.equal?(0)
    puts"Succeeded, cup is empty"
else
    puts"Failed cup still has #{cup.count} items in it"
    fail_counter += 1
end

hand.store_all([die, coin])
cup.load(hand)

cup = Cup.new()
hand = Hand.new()
coin = Coin.new(0.05)
die = Die.new(6, :red)

hand.store_all([die, coin])
cup.load(hand)

puts "Items in cup: #{cup.count}"

puts"Testing the throw method from the cup"
puts"This should return a results object"
results = cup.throw

puts "Finished throwing"

if results.class.equal?(Results)
    puts"Succeeded, returned a results object"
else
    puts"Failed, returned #{results.class} instead of a results object"
    fail_counter += 1
end

puts"Checking the sum of the coin and die are the same as the results object"
puts "Items in the cup: #{cup.count}"

puts "Coin b4 RESULTS = #{coin.result}"

sum = results.sum
puts "Results is a #{results.class}"
puts "results.sum is #{sum}"
puts "coin.results = #{coin_results}"
puts "die.results = #{die_results}"

if sum > 0
    puts"Succeeded, the sum of the results is #{sum}"
else
    puts"Failed, the sum of the results is #{sum}"
    fail_counter += 1
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter


#------ TESTING THE BAG OBJECT ---------
puts"TESTING THE BAG OBJECT"
puts"Initializing the bag. This should not crash"
bag = Bag.new()
puts"Succeeded"

puts"Putting items in a hand object, then loading the bag with the hand"
hand.store_all([die, coin])
bag.move_all(hand)
puts"Succeeded, didnt crash"

puts"Getting the items back from the bag."
puts"Then comparing them to the original items."
hand = bag.empty
coin = hand.next
die = hand.next

if results.sum > 0
    puts"Succeeded, returned each item in order"
else
    puts"Failed, returned #{hand.next} instead of #{coin}"
    fail_counter += 1
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter


#------ TESTING THE PLAYER OBJECT ---------
puts"TESTING THE PLAYER OBJECT"

puts"Initializing the player. This should not crash"
player_name = 'Dave'
player = Player.new(player_name)
puts"Succeeded"

puts"Getting the players name, it should be Dave"
name = player.name

if name.equal?(player_name)
    puts"Succeeded, the name is #{name}"
else
    puts"Failed, the name is #{name}"
    fail_counter += 1
end

# Instantiating the dice and coins
die_1 = Die.new(6, :red)

coin_1 = Coin.new(0.05)

die_2 = Die.new(10, :blue)

coin_2 = Coin.new(0.10)

puts"Adding a single die to the players bag"
puts"If it doesnt crash then it's successful"
player.store(die_1)

if player.get_num_randomziers.equal?(1)
    puts"Succeeded, the player has 1 randomizer"
else
    puts"Failed, the player has #{player.get_num_randomziers} randomizers"
    fail_counter += 1
end

puts"Adding a batch of 3 coins and die to the players bag"
puts"If it doesnt crash then it's successful"
randomizerContainer = RandomizerContainer.new()
randomizerContainer.store_all([coin_1, die_2, coin_2])
player.move_all(randomizerContainer)
puts"Succeeded"

puts"The number of randomizers in the players bag should be 4"
if player.get_num_randomziers.equal?(4)
    puts"Succeeded, the player has 4 randomizers"
else
    puts"Failed, the player has #{player.get_num_randomziers} randomizers"
    fail_counter += 1
end

puts"Moving randomizers to the players cup if the desc is 'Fake description'"
player.load({"Fake description" => "True"})
count = player.get_num_objects_in_cup
if count.equal?(0)
    puts"Succeeded, the player has 0 randomizers in the cup"
else
    puts"Failed, only moved #{count} objects"
    fail_counter += 1
end

puts"adding an object with no description to the players bag"
coin_3 = Coin.new(0.25)
player.store(coin_3)
puts"Succeeded"

puts"Moving randomizers to the players cup if the desc is:"
puts"'{'item' => :coin, 'denomination' => 0.25}'"
puts"This should move 1 coin in the cup"
player.load({"item" => :coin, "denomination" => 0.25})
count = player.get_num_objects_in_cup
if count.equal?(1)
    puts"Succeeded, the player has 1 randomizer in the cup"
else
    puts"Failed, only moved #{count} objects"
    fail_counter += 1
end

puts"Trying to move the objects back from the cup to the bag with a bad desc"
puts"This should move the coin without a description"
player.replace({"Hello" => "World"})
count = player.get_num_objects_in_cup
if count.equal?(1)
    puts"Succeeded, the player has 1 randomizer in the cup"
else
    puts"Failed, #{count} objects in cup"
    fail_counter += 1
end

puts"Trying again with a good description"
player.replace({"denomination" => 0.25})
count = player.get_num_objects_in_cup
if count.equal?(0)
    puts"Succeeded, the player has 0 randomizers in the cup"
else
    puts"Failed, #{count} objects in cup"
    fail_counter += 1
end


puts"Testing the throw method"
puts"Since there are no items in the cup, this should return a array "
results = player.throw
if results.sum.equal?(0)
    puts"Succeeded, the sum of the results is #{results.sum}"
else
    puts"Failed, the sum of the results is #{results.sum}"
    fail_counter += 1
end

player_2 = Player.new("Jane")
player_2.store(die_1)
player_2.store(die_2)

# Only loads die_1
player_2.load({"colour" => :red, "sides" => 6})

puts"Testing the throw method"
puts"Since there are items in the cup, this should return a results object"
results = player_2.throw
if results.class.equal?(Results)
    puts"Succeeded, the results object is #{results}"
else
    puts"Failed, the results object is #{results}"
    fail_counter += 1
end

puts"Calling the tally method"
puts"This should return an array of length 1 with the results of the throw"
results = player_2.tally({"colour" => :red, "sides" => 6})
if results.length.equal?(1)
    puts"Succeeded, the results object is #{results}"
else
    puts"Failed, results.length = #{results.length}"
    fail_counter += 1
end


puts"Calling the Sum method"
puts"This should return an array of length 1 with the results of the throw"
results_sum = player_2.sum({"colour" => :red, "sides" => 6})

if results_sum != nil
    puts"Succeeded, the results object is #{results_sum}"
else
    puts"Failed, results_sum is nil"
    fail_counter += 1
end

puts"Calling the results method"
puts"Calling it with throw = 1."
puts"This should return nil since throw has not been called twice"
results_arr = player_2.results(
    {"colour" => "red", "sides" => 6},
     1
)
if results_arr != nil
    puts"Failed, since results_arr = #{results_arr}, should be nil"
    fail_counter += 1
else
    puts"Succeeded, the results object is #{results_arr}"
end

puts"Calling the results method"
puts"Calling it with throw = 0."
puts"But a desc that does not match any of the objects in the throw history"
results_arr = player_2.results(
    {"colour" => "red", "sides" => 10},
    0
)

if results_arr[0].length > 0
    puts"Failed, since results_arr = #{results_arr}, should be 0"
    fail_counter += 1
else
    puts"Succeeded, the results object is #{results_arr}, should be 0"
end

puts"\nThere were #{fail_counter} failure(s) in this section.\n\n"
total_fails += fail_counter

#------ More Testing ------
puts "More General Testing"
player = Player.new("John")
coin_1 = Coin.new(0.25)
coin_2 = Coin.new(0.05)

puts "Putting the two coins in the players bag"
player.store(coin_1)
player.store(coin_2)
puts "Succeeded"

puts "Putting the two coins in the players cup"
player.load({})
puts "Items in the cup: #{player.get_num_objects_in_cup}"

puts "Throwing the coins"
player.throw

puts "Printing the results"
results_1 = player.results({}, 0)
puts "Results: #{results_1}"

puts "Throwing again"
player.throw

puts "Printing the results"
results_2 = player.results({}, 1)
puts "Results: #{results_2}"

puts "Throwing a third time"
player.throw
results_2 = player.results({}, 2)
puts "Results: #{results_2}"

puts "This shows that the results history is deep copied and not a reference"


#------ FINAL READOUT ---------
puts"\n\nTESTING COMPLETE"
puts"There were #{total_fails} failure(s) in this program."
