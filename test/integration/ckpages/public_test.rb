require 'test_helper'

module Ckpages
class PublicTest < ActionDispatch::IntegrationTest
  fixtures :all

  # test "the truth" do
  #   assert true
  # end

  test 'Проверка тестовой страницы' do
    get '/1/1'
    assert assigns(:page)
  end

  test 'Проверка редиректа' do
    get '/2/2'
    assert_redirected_to 'http://ya.ru'
    assert_equal 301, response.status
  end

  test 'Проверка редиректа на страницу этого же сайта' do
    get '/3/3'
    assert_redirected_to '/4/4'
    assert_equal 301, response.status
  end

  test 'Провека не существующей страницы' do
    get '/not_exists.html'
    assert_template 'ckpages/public404/show'
  end

end
end
