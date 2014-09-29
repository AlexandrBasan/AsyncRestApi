module V1
  class JobsController < ApplicationController
    def index
      jobs = Job.all

      if status = params[:status]
        jobs = jobs.where(status: status)
      end
      render json: jobs, status: 200
    end

    def create
      job = Job.new(job_params)
      if job.save
        render json: job, status: 202, location: ['v1', job]
      end
    end

  private

    def job_params
      params.require(:job).permit(:name, :algorithm)
    end
  end
end
