require 'test_helper'

#ActionController::TestCase zawiera klase bazawa z mockami
class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: 'Książki')
  end

  test 'should get categories index' do
    get :index
    assert_response :success
  end

  test 'should not get new if not admin' do
    get :new
    assert_response :redirect
    user = User.create(username: 'non_admin', password: 'not_an_admin', email: 'non_admin@admin.pl', is_admin: false)
    session[user_id: user.id]
    get :new
    assert_response :redirect
  end

  test 'should get new if admin' do
    user = User.create(username: 'admin', password: 'adminadmin', email: 'admin@admin.pl', is_admin: true)
    session[user_id: user.id]
    get :new
    assert_response :redirect
  end

  test 'should get show' do
    get(:show, {id: @category.id})
    assert_response :success
  end

  test 'shlould redirect when user not logged in and not admin' do
    assert_no_difference 'Category.count' do
      post :create, category: { name: 'Ksiazki'}
    end
  end

end