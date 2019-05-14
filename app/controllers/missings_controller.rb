class MissingsController < ApplicationController
  before_action :get_missing, only: [:show, :update, :destroy]
  before_action :get_user, only: [:get_missing_by_user]

  #GET "/missings"
  def index
    @missing = Missing.all.order(id: :desc)
    render json: @missing
  end

  #POST "/missings"
  def create
    data = missing_params
    data[:report] = 0
    @missing = Missing.create!(data)
    if @missing.save
      response = {
        missing: @missing,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response
  end

  #GET "/missings/:id"
  def show
    render json: @request_missing
  end

  #PUT "missings/:id"
  def update
    protected_params = Hash.new
    missing_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @missing = Missing.find(params[:id])
    @missing.update_attributes(protected_params)
    response = {
      missing: @missing,
      message: "Update success"
    }
    render json: response
  end

  #DELETE "/missings/:id"
  def destroy
  if @request_missing.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @missing.errors, status: :unprocessable_entity
    end
  end

  #GET users/:user_id/missings
  def get_missing_by_user
    render json: @user.missings
  end

  private

  def get_missing
    @request_missing = Missing.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

  def missing_params
    params.permit(:title, :description, :phone_number, :user_id, :image, :report)
  end
end
