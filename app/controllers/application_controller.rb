require_relative '../a1/A1_Classes.rb'

class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find(session[:user_id])

            #Initialize the player and unserialize their randomziers
            @player = Player.new(Current.user.name)

            #temp
            init_randomizers

        end
    end

    private 

    def init_randomizers
        coinA = Coin.new(0.25)
        coinB = Coin.new(0.25)
        coinC = Coin.new(0.25)

        dieA = Die.new(6, :white)
        dieB = Die.new(6, :white)
        dieC = Die.new(6, :white)

        @player.store(coinA)
        @player.store(coinB)
        @player.store(coinC)
        @player.store(dieA)
        @player.store(dieB)
        @player.store(dieC)
    end
end
