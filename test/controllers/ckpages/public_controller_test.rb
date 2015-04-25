module Ckpages
  class PublicControllerTest < ActionController::TestCase
    test 'Проверка работы урлов pages' do
      assert_generates '/1/1', { controller: 'ckpages/public', action: 'show', path: '1/1' }
      assert_generates '1/1', { controller: 'ckpages/public', action: 'show', path: '1/1' }
    end

    test 'Проверка редиректа' do
      get :show, :path => '2/2'
      assert_redirected_to 'http://ya.ru'
      assert_equal 301, response.status
    end

    test 'Проверка редиректа на страницу этого же сайта' do
      get :show, :path => '3/3'
      assert_redirected_to '/4/4'
      assert_equal 301, response.status
    end

    test 'Проверка тестовой страницы' do
      get :show, :path => '1/1'
      assert_select 'title', 'title'
      assert_select('meta[name="description"][content="description"]')
      assert_select('meta[name="keywords"][content="keywords"]')
      assert_select('meta[name="robots"][content="robots"]')
      assert_select '#content', 'content'
    end
  end
end
