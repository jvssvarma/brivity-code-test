FactoryGirl.define do
  factory :post do
    title "My Amazing Post"
    body "Just some excellent details"
    user
  end

  factory :another_post, class: 'Post' do
    title "Another Amazing Post"
    body "Not so much excellent details"
    user
  end
end
