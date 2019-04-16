class HotlinesController < ApplicationController
  before_action :get_hotine, only: [:show, :update, :destroy]

  #GET "/hotlines"
  def index
    @hotline = Hotline.all
    render json: @hotline
  end

  #POST "/hotlines"
  def create
    @hotline = Hotline.create!(hotline_params)
    if @hotline.save
      response = {
        hotline: @hotline,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response
  end

  #GET "hotline/:id"
  def show
    render json: @request_hotline
  end

  #PUT "hotlines/:id"
  def update
    protected_params = Hash.new
    hotline_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @hotline = Hotline.find(params[:id])
    @hotline.update_attributes(protected_params)
    response = {
      hotline: @hotline,
      message: "Update success"
    }
    render json: response
  end

  #DELETE "hotlines/:id"
  def destroy
    if @request_hotline.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @hotline.errors, status: :unprocessable_entity
    end
  end

  private

  def get_hotine
    @request_hotline = Hotline.find(params[:id])
  end

  def hotline_params
    params.permit(:area, :hotline_number)
  end
end
