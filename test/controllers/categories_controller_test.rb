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

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get show' do
    get(:show, {id: @category.id})
    assert_response :success
  end

end