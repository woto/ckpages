require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  # test "the truth" do
  #   assert true
  # end

  test 'Провека не существующей страницы' do
    assert_raise ActionController::RoutingError do
      get '/not_exists.html'
      assert_response :missing
    end
  end

end

