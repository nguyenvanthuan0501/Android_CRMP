class ComplaintcategorysController < ApplicationController
    before_action :get_complaint_category, only: [:show, :update, :destroy]

    def index
      @complaint_categories = ComplaintCategory.all
      render json: @complaint_categories
    end

    def create 
      @complaint_category = ComplaintCategory.create!(complaint_category_params)
      if @complaint_category.save
        response = {
          complaint_category: @complaint_category,
          message: "success"
        }
      else
        response = {
          message: "error"
        }
      end
      render json: response
    end

    def destroy
      if @complaint_category.destroy
        render json: ({message: "success"}),status: :ok
      else
        render json: @complaint_category.errors, status: :unprocessable_entity
      end
    end

    def update
      @complaint_category.update_attributes(complaint_category_params)
      response = {
        missing: @complaint_category,
        message: "Update success"
      }
      render json: response
    end

    def show
      render json: @complaint_category
    end

    private
    def complaint_category_params
      params.permit(:name)
    end

    def get_complaint_category
      @complaint_category = ComplaintCategory.find(params[:id])
    end
end
