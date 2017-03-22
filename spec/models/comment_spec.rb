require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "comment creation" do
    before do
      @user = FactoryGirl.create(:another_user)
      @post = FactoryGirl.create(:another_post)
      @comment = Comment.create(user_id: @user.id, post_id: @post.id, body: "Hello amn")
    end

    it "can be created" do
      expect(@comment).to be_valid
    end

    it "cannot be created without body" do
      @comment.body = nil
      expect(@comment).to_not be_valid
    end
  end
end
