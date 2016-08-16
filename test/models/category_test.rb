require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'category name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'category name should have at least 5 characters' do
    @category.name = 'x'*4
    assert_not @category.valid?
    @category.name = 'x'*5
    assert @category.valid?
  end

  test 'category name should have no more than 30 characters' do
    @category.name = 'x' * 31
    assert_not @category.valid?
    @category.name = 'x' * 30
    assert @category.valid?
  end

  test 'name should be unique' do
    @category.name = 'Książki'
    @category.save
    @category2 = Category.new(name: 'Książki')
    assert_not @category2.valid?
  end
end