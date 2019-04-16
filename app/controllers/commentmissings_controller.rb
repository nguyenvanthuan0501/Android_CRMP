class CommentmissingsController < ApplicationController
  before_action :get_comments, only: [:show, :update, :destroy]

  #GET "/commentmissings"
  def index
    @comment_missing = Commentmissing.all
    render json: @comment_missing
  end

  #POST "/commentmissings"
  def create
    @comment_missing = Commentmissing.create!(commentmissing_params)
    if @comment_missing.save
      response = {
        comment_missing: @comment_missing,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response
  end

  #GET "/commentmissing/:id"
  def show
    render json: @request_comments
  end

  #PUT "/commentmissing/:id"
  def update
    protected_params = Hash.new
    commentmissing_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @comment_missing = Commentmissing.find(params[:id])
    @comment_missing.update_attributes(protected_params)
    response = {
      comment_missing: @comment_missing,
      message: "Update success"
    }
    render json: response
  end

  #DELETE "commentmissing/:id"
  def destroy
    if @request_comments.destroy
      render json: ({message: "Delete success"}), status: :ok
    else
      render json: @comment_missing.errors, status: :unprocessable_entity
    end
  end

  private

  def get_comments
    @request_comments = Commentmissing.find(params[:id])
  end

  def commentmissing_params
    params.permit(:content, :user_id, :missing_id)
  end
end
