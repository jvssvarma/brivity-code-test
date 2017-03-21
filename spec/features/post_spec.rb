require 'rails_helper'

describe 'navigate' do
  describe 'home' do
    it 'must be accessible' do
      visit root_path
      expect(page.status_code).to eq(200)
    end

    it 'must be accessible' do
      visit root_path
      expect(page).to have_content(/All Posts/)
    end
  end

  describe 'creation' do
    it 'has a new post form that can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new form page' do
      visit new_post_path
      fill_in 'post[title]', with: "a post test"
      fill_in 'post[body]', with: "Something in the body"
      click_on "Save"
      expect(page).to have_content("Something in the body")
    end
  end
end
