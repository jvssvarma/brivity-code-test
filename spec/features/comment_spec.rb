require 'rails_helper'

describe 'comments' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    #@post = FactoryGirl.create(:post)
    @post = Post.create(title: "hello2 Mister", body: "2 A full body test for health check", user_id: @user.id)
  end

  describe 'adding comments' do
    before do
      visit post_path(@post)
    end

    it 'must be accessible' do
      expect(page.status_code).to eq(200)
    end

    it 'must be accessible' do
      expect(page).to have_content(/Comments/)
    end

    it 'has a list of all comments' do
      comment1 = Comment.create(body: "hello1 Mister", user_id: @user.id, post_id: @post.id)
      comment2 = Comment.create(body: "hello2 Mister", user_id: @user.id, post_id: @post.id)
      visit post_path(@post)
      expect(page).to have_content(/hello1|hello2/)
    end

    it 'can be added from the form part' do
      fill_in 'comment[body]', with: "a test comment"
      click_on "Save"
      expect(page).to have_content("a test comment")
    end

    it 'must have a user associated with it' do
      fill_in 'comment[body]', with: "a user test"
      click_on "Save"
      expect(User.last.comments.last.body).to eq("a user test")
    end
  end

  describe "delete comments" do
    before do
      visit post_path(@post)
      @comment = Comment.create(body: "hello1 Mister", user_id: @user.id, post_id: @post.id)
    end

    it "must allow the user to delete comments" do
      visit post_path(@post)
      click_link("comment_#{@comment.id}")
      expect(current_path).to eq(post_path(@post))
    end
  end
end
