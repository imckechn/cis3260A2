class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        serializedRandomziers = init_randomizers

        @user[:randomizers] = init_randomizers   
        @user[:points] = 0   

        if @user.save #if the save is successful
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account"        
        else
            render :new
        end
    end

    private 
    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

    #Create the coins and dice and serialize them
    def init_randomizers
        coinA = Coin.new(0.25)
        coinB = Coin.new(0.25)
        coinC = Coin.new(0.25)

        dieA = Die.new(6, :white)
        dieB = Die.new(6, :white)
        dieC = Die.new(6, :white)

        player = Player.new("Doesnt matter")
        player.store(coinA)
        player.store(coinB)
        player.store(coinC)
        player.store(dieA)
        player.store(dieB)
        player.store(dieC)

        player.serialize
    end

end
