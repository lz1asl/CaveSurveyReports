require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test 'should index routing' do
    assert_routing({ path: '/', method: :get }, { controller: 'welcome', action: 'index' })
  end


end
