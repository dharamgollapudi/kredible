class Api::SchoolsController < ApplicationApiController
  def index
    @schools = School
    @schools = @schools.search(params[:term]) if params[:term].present?
    @schools = @schools.limit(10)

    render json: @schools.map(&:name)
  end
end
