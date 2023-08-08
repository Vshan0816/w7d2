class SessionsController < ApplicationController
    def new
        user = User.new
        render :new
    end

    def create
        @user = user.find_by_credentials(
            params[:user][:email]
            params[:user][:password]
        )

        if @user
            login!(@user)
            redirect_to user_url(@user.id)
        else
            @user = User.new(username: params[:user][:username])
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end