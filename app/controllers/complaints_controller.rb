class ComplaintsController < ApplicationController
  before_action :get_complaint, only: [:show, :destroy, :update]
  before_action :get_category, only: [:get_complaints_by_category]

  def index
    @complaints = Complaint.all
    render json: @complaints
  end

  def create
    @complaint = Complaint.create!(complaint_params)
    if @complaint.save
      respone = {
        complaint: @complaint,
        message: "success"
      }
    else
      respone = {
        message: "error"
      }
    end
    render json: respone
  end

  def show
    render json: @get_complaint
  end

  def update
    protected_params = Hash.new
    complaint_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.to_s.length == 0
    end
    @get_complaint.update_attributes(protected_params)
    response = {
      complaint: @get_complaint,
      message: "Update success"
    }
    render json: response
  end

  def destroy
    if @get_complaint.destroy
      render json: ({message: "success"})
    else
      render json: ({message: "error"})
    end
  end

  def get_complaints_by_category
    @category = ComplaintCategory.find(params[:complaint_category_id])
    render json: @category.complaints
  end

  private

  def complaint_params
    params.permit(:title, :content, :image, :user_id, :complaint_category_id) 
  end

  def get_complaint
    @get_complaint = Complaint.find(params[:id])
  end

  def get_category
    @category = ComplaintCategory.find(params[:complaint_category_id])
  end
end
