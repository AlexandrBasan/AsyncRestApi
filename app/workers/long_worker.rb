class LongWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job.update(status: "processing")
    puts "Working..."
    # Simulate a job that may take a long time to process
    # e.g. Image Processing, hmm...
    # but just sleep for 1 to 10 minutes
    sleep rand(1..10).minutes
    job.update(status: "finished")
  end
end
