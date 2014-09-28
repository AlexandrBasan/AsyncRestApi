require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest

  test 'routes version' do
    assert_generates '/v1/jobs', { controller: 'v1/jobs', action: 'index' }
  end
end
