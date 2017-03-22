require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'home or index' do
    before do
      visit root_path
    end

    it 'must be accessible' do
      expect(page.status_code).to eq(200)
    end

    it 'must be accessible' do
      expect(page).to have_content(/All Posts/)
    end

    it 'has a list of all posts' do
      post1 = Post.create(title: "hello1 Mister", body: "1 A full body test for health check", user_id: @user.id)
      post2 = Post.create(title: "hello2 Mister", body: "2 A full body test for health check", user_id: @user.id)
      visit root_path
      expect(page).to have_content(/hello1|hello2/)
    end
  end

  describe 'creating post' do
    before do
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

  describe "edit posts" do
    before do
      @post = Post.create(title: "hello1 Mister", body: "1 A full body test for health check")
    end

    it "must have the post content" do
      visit post_path(@post)
      click_on "Edit"
      fill_in 'post[title]', with: "Check man 2"
      click_on "Save"
      expect(page).to have_content("Check man 2")
    end
  end

  describe "delete posts" do
    before do
      @post = Post.create(title: "hello1 Mister", body: "1 A full body test for health check")
    end

    it "must allow the user to delete posts" do
      visit post_path(@post)
      click_on "Delete"
      expect(current_path).to eq(posts_path)
    end
  end
end
