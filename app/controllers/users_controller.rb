class UsersController < ApplicationController
   #GET "/users"
  def index
    @user = User.all
    render json: @user
  end

   #POST "/users"
  def create
    @user = User.create!(user_params)
    if @user.save
      response = {
        user: @user,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response
  end

  def login
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      response = {
        user: @user,
        message: "success"
      }
    else
      response = {
        message: "login not success"
      }
    end
    render json: response
  end

  private 

  def user_params
    params.require(:user).permit(:password, :email, :fullname, :phone_number, :address)
  end
end
