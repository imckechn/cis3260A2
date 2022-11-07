class SessionsController < ApplicationController
    def destroy 
        Current.user.destroy
        session[:user_id] = nil
        redirect_to :sign_in, notice: "Logged out"
    end

    def logout
        session[:user_id] = nil
        redirect_to :sign_in, notice: "Logged out"
    end

    def new
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? 
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                @player = Player.new(user.name)
                redirect_to root_path, notice: "Logged in successfully"
            else
                @error = "password is incorrect"
                render :new
            end
        else
            @error = "User does not exist, you must create an account"
            render :new
        end
    end
end
