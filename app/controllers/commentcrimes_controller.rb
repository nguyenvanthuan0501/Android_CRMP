class CommentcrimesController < ApplicationController
  before_action :get_comments, only: [:show, :update, :destroy]
  before_action :get_crime, only: [:get_comments_by_crime]

  #GET "/commentcrimes"
  def index
    @comment_crime = Commentcrime.all
    render json: @comment_crime
  end

  #POST "/commentcrimes"
  def create
    @comment_crime = Commentcrime.create!(commentcrime_params)
    if @comment_crime.save
      response = {
        comment_crime: @comment_crime,
        message: "success"
      }
    else
      response = {
        message: "error"
      }
    end
    render json: response
  end

  #GET "/commentcrimes/:id"
  def show
    render json: @request_comment
  end

  #PUT "commentcrimes/:id"
  def update
    protected_params = Hash.new
    commentcrime_params.each do |attr_name, attr_value|
      protected_params[attr_name.to_sym] = attr_value unless attr_value.nil?
    end
    @comment_crime = Commentcrime.find(params[:id])
    @comment_crime.update_attributes(protected_params)
    response = {
      missing: @comment_crime,
      message: "Update success"
    }
    render json: response
  end

  #DELETE "/commentcrimes/:id"
  def destroy
    if @request_comment.destroy
      render json: ({message: "success"}), status: :ok
    else
      render json: @comment_crime.errors, status: :unprocessable_entity
    end
  end

  #GET "/crime/:crime_id/comments"
  def get_comments_by_crime
    render json: @crime.commentcrimes
  end

  private 

  def get_comments
    @request_comment = Commentcrime.find(params[:id])
  end

  def commentcrime_params
    params.permit(:content, :crime_id, :user_id)
  end

  def get_crime
    @crime = Crime.find(params[:crime_id])
  end
end
