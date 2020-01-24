class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome to Private Events!"
            redirect_to @user
          else
            render 'new'
          end
        
    end

    def show
      @user = User.find(params[:id])
      @event = current_user.events.build if logged_in?
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
