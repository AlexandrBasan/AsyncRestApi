require 'test_helper'

class ListJobsTest < ActionDispatch::IntegrationTest
  setup do
    Job.create!(name: 'Check for face', algorithm: 'facial recognition', status: 'completed')
    Job.create!(name: 'Make into avatar', algorithm: 'resize', status: 'queued')
    Job.create!(name: 'Invert image', algorithm: 'invert', status: 'queued')
  end

  test 'list all jobs' do
    get '/v1/jobs'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Job.count, json(response.body).length
  end

  test 'list only queue jobs' do
    get '/v1/jobs?status=queued'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 2, json(response.body).length
  end
end
