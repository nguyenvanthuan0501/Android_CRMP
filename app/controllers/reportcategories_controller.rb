class ReportcategoriesController < ApplicationController
    before_action :get_category , only: [:destroy, :update]
  #GET "/reportcategories"
  def index
    @reportcategories = Reportcategory.all
    render json: @reportcategories
  end

  #POST "/reportcategories"
  def create
    @reportcategory = Reportcategory.create!(category_params)
    if @reportcategory.save
      response = {
        category: @reportcategory,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response 
  end

  #DELETE "/reportcategories"
  def destroy
    @get_category.destroy
    if @get_category.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @get_category.errors, status: :unprocessable_entity
    end 
  end

  #PUT "reportcategories"
  def update
    protected_params = Hash.new
    category_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @get_category.update_attributes(protected_params)
    response = {
      category: @get_category,
      message: "Update success"
    }
    render json: response
  end

  private 

  def category_params
    params.permit(:name)
  end

  def get_category
    @get_category = Reportcategory.find(params[:id])
  end
end
