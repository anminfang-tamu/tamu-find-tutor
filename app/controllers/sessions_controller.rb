class SessionsController < ApplicationController

    def new
    end
    
    def create
        user = User.find_by(user_email: params[:session][:email].downcase)
        p user
        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "Logged in successfully."
            redirect_to root_path
        else
            flash.now[:alert] = "There was something wrong with your login details."
            render 'new'
        end
    end
    
    def destroy
    end

end