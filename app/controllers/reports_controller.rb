class ReportsController < ApplicationController
    before_action :get_report, only: [:destroy]
  
  #GET "/reports"
  def index
    @reports = Report.all
    render json: @reports
  end

  #POST "/reports"
  def create
    @report = Report.create!(report_params)
    if @report.save
      response = {
        report: @report,
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
    @get_report.destroy
    if @get_report.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @get_report.errors, status: :unprocessable_entity
    end 
  end

  #DELETE reports/post/:post_id
  def destroy_by_post
    @reports = Report.where(post_id: params[:post_id])
    @reports.each do |report|
        report.destroy
    end
    render json: ({message: "success"}), status: :ok
  end

  #GET reports/post/:post_id
  def get_report_by_post
    @reports = Report.where(post_id: params[:post_id])
    result = Array.new
    @reports.each do |report|
      @tmp = Hash.new
      @tmp[:status] = report.status
      @tmp[:post_id] = report.post_id
      @tmp[:reportcategory] = report.reportcategory.name
      @tmp[:created_at] = report.created_at
      result.push(@tmp)
    end
    render json: result
  end

  private
  def report_params
    params.permit(:status, :post_id, :reportcategory_id)
  end

  def get_report
    @get_report = Report.find(params[:id])
  end
end
