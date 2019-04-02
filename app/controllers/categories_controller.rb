class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :update, :destroy]

  #GET "/categories"
  def index
    @category = Category.all
    render json: @category
  end

  #POST "/categories"
  def create
    @category = Category.create!(category_params)
    if @category.save
      response = {
        category: @category,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response 
  end

  #GET "/categories/:id"
  def show
    render json: @request_category
  end

  #PUT "categories/:id"
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    response = {
      category: @category,
      message: "Update success"
    }
    render json: response
  end

  #DELETE "categories/:id"
  def destroy
    @request_category.destroy
    if @request_category.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end 
  end

  private

  def category_params
    params.permit(:name_category)
  end

  #get request category
  def get_category
    @request_category = Category.find(params[:id])
  end
end
