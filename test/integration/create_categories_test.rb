require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    user = User.create(username: 'admin', password: 'adminadmin', email: 'admin@admin.pl', is_admin: true)
    sign_in_as user
  end

  test 'get new category form and create category' do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: 'ksiazki'}
    end
    assert_template 'categories/index'
    assert_match 'ksiazki', response.body
  end

  test 'wrong category name fails to create new category' do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      # tutaj nie ma redirecta?
      # metoda post po prostu sledzi 1 request,
      # metoda post_via_redirect sledzi request i wszystkie redirecty
      post categories_path, category: {name: 'dupa'}
    end
    assert_template 'categories/new'
    assert_match 'error', response.body
    # wybiera element na stronie i przechodzi jesli sie udalo
    # standardowa skladnia
    assert_select 'div.panel.panel-danger'
  end

end