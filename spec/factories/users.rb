FactoryGirl.define do

  factory :user do
    email 'doejohn@test.com'
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'John'
    last_name 'Doe'
  end

  factory :another_user, class: 'User' do
    email 'doejane@test.com'
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    first_name 'Jane'
    last_name 'Doe'
  end
end
