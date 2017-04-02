class Api::SchoolsController < ApplicationApiController
  def index
    @schools = School.all.limit(10)
  end
end
