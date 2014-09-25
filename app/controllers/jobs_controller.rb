class JobsController < ApplicationController
  def index
    render json: Job.all, status: 200
  end
end
