require "application_system_test_case"

class Master::CategoriesTest < ApplicationSystemTestCase
  setup do
    @master_category = master_categories(:one)
  end

  test "visiting the index" do
    visit master_categories_url
    assert_selector "h1", text: "Categories"
  end

  test "should create category" do
    visit master_categories_url
    click_on "New category"

    fill_in "Name", with: @master_category.name
    fill_in "Status", with: @master_category.status_id
    click_on "Create Category"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "should update Category" do
    visit master_category_url(@master_category)
    click_on "Edit this category", match: :first

    fill_in "Name", with: @master_category.name
    fill_in "Status", with: @master_category.status_id
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "should destroy Category" do
    visit master_category_url(@master_category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
end
