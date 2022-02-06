class AuthController < ApplicationController
  skip_before_action :authorized  ,:except => [:signout]

  def signup
    @user = User.new
  end

  def register
    @user = User.new(params.require(:user).permit(:full_name, :nickname, :email, :password))

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "User was successfully signed up. Please sign in" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def signin
    @user = User.new
  end

  def authenticate
    if params["email"]
      user = User.find_by_email(params["email"])
        if user
          @user = user.authenticate(params["password"])
        end
      end

    respond_to do |format|
      if @user
        session[:user_id] = user.id
        format.html { redirect_to root_path, notice: "User was successfully signed in." }
        format.json { render json: @user, status: :ok }
      else
        format.html { redirect_to signin_path, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def signout
    session[:user_id] = nil
    redirect_back fallback_location: root_path
  end
end
