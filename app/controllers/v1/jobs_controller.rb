module V1
  class JobsController < ApplicationController
    def index
      jobs = Job.all

      if status = params[:status]
        jobs = jobs.where(status: status)
      end
      render json: jobs, status: 200
    end

    def show
      if job = Job.find(params[:id])
        render json: job, status: 200
      else
        render json: {error: 'not-found'}.to_json, status: 404
      end
    end

    def create
      job = Job.new(job_params)
      if job.save
        render json: job, status: 202, location: ['v1', job]
      else
        render json: job.errors, status: 422
      end
    end

  private

    def job_params
      params.require(:job).permit(:name, :algorithm)
    end
  end
end
