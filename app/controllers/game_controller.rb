class GameController < ApplicationController

    def new
        @error = "BOOO"
        #@player.load("")

        @coinsInBag = @player.count_coins_in_bag
        @coinsInCup = @player.count_coins_in_cup
        @dieInBag = @player.count_dice_in_bag
        @dieInCup = @player.count_dice_in_cup
        #@gameStats[:coinsInBag] = @player.count_coins_in_bag
        #@gameStats[:coinsInCup] = @player.count_coins_in_cup
        #@gameStats[:dieInBag] = @player.count_dice_in_bag
        #@gameStats[:dieInCup] = @player.count_dice_in_cup
    end

    def moveToCup
        @error = "Hello there"
        #if :description
            #@player.load(:description)
            #@coinsInBag = @player.count_coins_in_bag
            #@coinsInCup = @player.count_coins_in_cup
            #@dieInBag = @player.count_dice_in_bag
            #@dieInCup = @player.count_dice_in_cup
        #else
        @player.load({})
        @coinsInBag = @player.count_coins_in_bag
        @coinsInCup = @player.count_coins_in_cup
        @dieInBag = @player.count_dice_in_bag
        @dieInCup = @player.count_dice_in_cup
        #end

        #redirect_to game_path
    end

    def throwCup
        @error = "Thrown"
        @player.throw
        @throwResults = @player.results

        @dup = @throwResults.select{|element| array.count(element) > 1 }
        Current.user.points += @dup.length
        @user = Current.user

        @user.update(:points => Current.user.points)
    end
end
