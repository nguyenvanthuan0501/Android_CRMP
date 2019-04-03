class UsersController < ApplicationController
  before_action :get_user, only: [:show, :destroy , :update]

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

   #POST "/login"
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

  #GET "/users/:id"
  def show
    render json: @request_user
  end

   #DELETE "users/:id"
  def destroy
    @request_user.destroy
      if @request_user.destroy
        render json: ({message: "success"}), status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end      
  end

   #PUT "users/:id"
  def update
    protected_params = Hash.new
    profile_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @request_user.update_attributes(protected_params)
    response = {
        user: @request_user,
        message: "Update success"
    }
    render json: response
  end

  private 

  def profile_params
    params.permit(:password, :password_confirmation, :fullname, :phone_number, :address)
  end

  def user_params
    params.permit(:password, :password_confirmation, :email, :fullname, :phone_number, :address)
  end

  # get request user
  def get_user
    @request_user = User.find(params[:id])
  end
end
