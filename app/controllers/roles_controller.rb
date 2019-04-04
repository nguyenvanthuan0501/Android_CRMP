class RolesController < ApplicationController
   # GET '/roles'
  def index 
    @roles = Role.all
    render json: @roles 
  end

   # POST '/roles'
  def create 
    @role = Role.create!(role_params)
    render json: @role
  end

   private

  def role_params
    params.permit(:role_name)
  end
end
