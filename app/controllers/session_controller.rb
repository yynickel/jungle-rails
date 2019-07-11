class SessionController < ApplicationController
  def new
    @user=User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:user][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to [:root] , notice: 'Logged In'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to [:root], notice: 'Wrong credentials'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: 'Logged Out'
  end
end
