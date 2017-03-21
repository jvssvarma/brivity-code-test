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

  describe 'creating post' do
    before do
      user = User.create(email: "checking1@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "John", last_name: "Doe")
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'has a new post form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new form page' do
      fill_in 'post[title]', with: "a post test"
      fill_in 'post[body]', with: "Something in the body"
      click_on "Save"
      expect(page).to have_content("Something in the body")
    end

    it 'must have a user associated with it' do
      fill_in 'post[title]', with: "a user test"
      fill_in 'post[body]', with: "Something about user in body"
      click_on "Save"
      expect(User.last.posts.last.title).to eq("a user test")
    end
  end
end
