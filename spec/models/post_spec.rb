require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "post creation" do
    before do
      @post = Post.create(title: "hello Mister", body: "A full body test for health check")
    end
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without title" do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it "cannot be created without body" do
      @post.body = nil
      expect(@post).to_not be_valid
    end
  end
end
