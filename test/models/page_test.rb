require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should reject invalid URL" do
    page = Page.new
    page.pet_id = 1
    page.url = "The Dog"
    assert_not page.save
  end
  test "should accept valid URL" do
    page = Page.new
    page.pet_id = 1
    page.url = "dog"
    assert page.save
  end
  test "should not accept duplicate URL" do
    page = Page.new
    page.pet_id = 1
    page.url = "dog"
    page.save!
    page2 = Page.new
    page2.pet_id = 2
    page2.url = "dog"
    assert_not page2.save
  end
  test "should not allow invalid CSS for text color" do
    page = Page.new
    page.pet_id = 1
    page.url = "dog"
    page.text_color = "#dededr"
    assert_not page.save
  end
  test "should downcase URL" do
    page = Page.new
    page.pet_id = 1
    page.url = "DOG"
    page.save!
    saved_page = Page.find_by url: "dog"
    assert saved_page.url == "dog"
  end
end
