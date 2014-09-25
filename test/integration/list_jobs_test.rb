require 'test_helper'
require 'minitest/pride'

class ListJobsTest < ActionDispatch::IntegrationTest
  setup do
    Job.create!(name: 'Check for face', algorithm: 'facial recognition')
    Job.create!(name: 'Make into avatar', algorithm: 'resize')
  end

  test "list all jobs" do
    get '/jobs'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Job.count, JSON.parse(response.body).length
  end
end
