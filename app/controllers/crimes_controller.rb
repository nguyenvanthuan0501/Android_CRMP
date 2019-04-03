class CrimesController < ApplicationController
  before_action :get_crime, only: [:show, :update, :destroy]

  #GET "/crimes"
  def index
    @crime = Crime.all
    render json: @crime
  end

  #POST "/crimes"
  def create
    @crime = Crime.create!(crime_params)
    if @crime.save
      response = {
        crime: @crime,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response
  end

  #GET "/crimes/:id"
  def show
    render json: @request_crime
  end

  #PUT "/crimes/:id"
  def update
    protected_params = Hash.new
    crime_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @crime = Crime.find(params[:id])
    @crime.update_attributes(protected_params)
    response = {
      crime: @crime,
      message: "Update success"
    }
    render json: response
  end

  #DELETE "/crimes/:id"
  def destroy
    @request_crime.destroy
    if @request_crime.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @crime.errors, status: :unprocessable_entity
    end 
  end

  private 

  def get_crime
    @request_crime = Crime.find(params[:id])
  end

  def crime_params
    params.permit(:category_id, :area, :title, :description, :time, :user_id)
  end
end
