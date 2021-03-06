class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update]
    skip_before_action :verify_authenticity_token
    
    def show
        @posts = @user.posts
    end
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def edit
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Profile was created successfully."
            redirect_to @user
        else
            render 'new'
        end
    end
    
    def update
        if @user.update(user_params)
            flash[:notice] = "The profile was updated successfully."
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account and all associated posts successfully deleted"
        redirect_to posts_path
    end
    
    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :fullname, :user_email, :password)
    end
    
    def require_same_user
        if current_user != @user && !!current_user.admin?
            flash[:alert] = "You can only edit or delete your own account"
            redirect_to @user
        end
    end
    
end