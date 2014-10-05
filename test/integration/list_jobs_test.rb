require 'test_helper'

class ListJobsTest < ActionDispatch::IntegrationTest
  setup do
    @job = Job.create!(name: 'Check for face', algorithm: 'facial recognition', status: 'completed')
    Job.create!(name: 'Make into avatar', algorithm: 'resize', status: 'queued')
    Job.create!(name: 'Invert image', algorithm: 'invert', status: 'queued')
  end

  test 'list all jobs' do
    get '/v1/jobs'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Job.count, json(response.body).length
  end

  test 'list only queued jobs' do
    get '/v1/jobs?status=queued'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 2, json(response.body).length
  end

  test 'list single job' do
    get "/v1/jobs/#{@job.id}"

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    job = json(response.body)
    assert_equal @job.algorithm, job[:algorithm]
    assert_equal @job.name, job[:name]
    assert_equal @job.status, job[:status]
  end

  test 'handle job not found' do
    get '/v1/jobs/1234'

    assert_equal 404, response.status
    assert_equal 'not-found', json(response.body)[:error]
  end
end
