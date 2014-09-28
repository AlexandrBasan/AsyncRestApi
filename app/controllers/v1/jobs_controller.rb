module V1
  class JobsController < ApplicationController
    def index
      jobs = Job.all

      if status = params[:status]
        jobs = jobs.where(status: status)
      end
      render json: jobs, status: 200
    end
  end
end
