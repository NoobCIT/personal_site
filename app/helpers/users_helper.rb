module UsersHelper

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:error] = "Please log in."
        redirect_to login_url
      end
    end
end
