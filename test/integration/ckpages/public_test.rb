require 'test_helper'

module Ckpages
class PublicTest < ActionDispatch::IntegrationTest
  fixtures :all

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
    assert_response :missing
  end

  test 'У класса Ckpages::Public404Controller не должно быть метода show, иначе мы не сможем быть точно уверены, что из родительского класса был добавлен 404 код. Например завели show метод и в нём вызвали "render :status => 404"' do
    assert_raises NameError do
      Ckpages::Public404Controller.instance_method(:show)
    end
  end

end
end
