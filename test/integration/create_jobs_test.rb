require 'test_helper'

class CreateJobsTest < ActionDispatch::IntegrationTest
  test 'create jobs' do
    post '/v1/jobs',
      { job:
        { name: 'Normalized box blur filtering', algorithm: 'blur' }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 202, response.status
    assert_equal Mime::JSON, response.content_type
    
    job = json(response.body)
    assert_equal v1_job_url(job[:id]), response.location
    assert_equal 'Normalized box blur filtering', job[:name]
    assert_equal 'blur', job[:algorithm]
  end
end
