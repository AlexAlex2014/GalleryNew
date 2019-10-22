# frozen_string_literal: true

require 'rails_helper'

# class FutureTest
class FutureTest
  include Capybara::DSL
  def run_root
    visit '/'
    sleep 2
  end

  def sign_in(email, password)
    visit '/'
    click_button 'toggle_mnu'
    fill_in 'inputEmail', with: email
    fill_in 'inputPassword', with: password
    click_button 'log_in'
    sleep 2
  end

  def run_images
    visit '/images'
    sleep 2
  end

  def run_comments
    visit '/comments'
    sleep 2
  end

  def show_categories(id)
    id.each { |var|
      visit "/categories/#{var}"
      sleep 2
    }
  end

  def add_category
    visit '/profiles/15'
    fill_in 'Title category', with: 'Test category'
    fill_in 'Text category', with: 'About the category'
    sleep 2
    click_button 'Category'
    visit '/categories/5'
    sleep 1
  end

  def add_image
    visit '/categories/5'
    click_link 'Add image'
    select('sport', from: 'image_category_id')
    attach_file('image_image', 'app/assets/images/categories/sport/1.jpg')
    fill_in 'Body', with: 'Test category'
    click_button 'Create Image'
    sleep 2
  end

  def user_profile_edit
    visit '/profiles/15/edit'
    fill_in 'Location', with: 'Kiev'
    select('Male', from: 'profile_gender')
    select('1997', from: 'profile_birthday_1i')
    select('January', from: 'profile_birthday_2i')
    select('1', from: 'profile_birthday_3i')
    click_button 'Update'
    sleep 1
  end
end

# email = 'azuev3199@gmail.com'
# password = '123456'
# categor_id = [1, 3, 4, 5, 6]
#
# it = FutureTest.new
#
# it.run_root
# it.sign_in(email, password)
# it.run_images
# it.run_comments
# it.show_categories(categor_id)
# it.add_category
# it.add_image
# it.user_profile_edit
