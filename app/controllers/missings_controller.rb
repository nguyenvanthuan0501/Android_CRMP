class MissingsController < ApplicationController
  before_action :get_missing, only: [:show, :update, :destroy]

  #GET "/missings"
  def index
    @missing = Missing.all
    render json: @missing
  end

  #POST "/missings"
  def create
    @missing = Missing.create!(missing_params)
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

  private

  def get_missing
    @request_missing = Missing.find(params[:id])
  end

  def missing_params
    params.permit(:title, :description, :phone_number, :user_id)
  end
end
