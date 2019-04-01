class UsersController < ApplicationController
   #GET "/users"
  def index
    @user = User.order(:id)

    render json: @user
  end

   #POST "/users"
  def create
    @user = User.new(user_params)

    if @user.save
      # 
      response = {
        user: @user,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
      # render json: @user.errors, status: :unprocessable_entity
    end
   
    render json: response
  end

  private 

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
