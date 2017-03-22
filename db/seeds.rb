# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user1 = User.create(email: "katemara@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Kate", last_name: "Mara")
@user2 = User.create(email: "rooneymara@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Rooney", last_name: "Mara")

20.times do |post|
  Post.create(user_id: @user1.id, title: "#{post} testing in seeds", body: "Pabst #{post} flannel roof party ugh readymade, blue bottle listicle 90's mumblecore mustache chia XOXO plaid heirloom cliche. Flannel farm-to-table four dollar toast normcore wolf prism. Edison bulb freegan pok pok, wayfarers 3 wolf moon cold-pressed vinyl trust fund pabst unicorn. Cardigan swag church-key mustache banjo tofu. Celiac freegan selvage blog letterpress. Before they sold out keytar meggings forage crucifix meh. Shabby chic kinfolk hella ennui pok pok blog.")
  Post.create(user_id: @user2.id, title: "#{post} it's check it maniac", body: "Bespoke #{post} mlkshk beard you probably haven't heard of them, four dollar toast pug waistcoat bicycle rights actually biodiesel offal synth lumbersexual. Sartorial tattooed hashtag, ramps whatever cornhole small batch. Kombucha air plant mustache, live-edge try-hard irony lumbersexual single-origin coffee farm-to-table chicharrones pitchfork hashtag tumeric blue bottle. Listicle venmo distillery, meh tofu roof party seitan 90's sriracha hammock quinoa. Wolf man bun pug distillery. Cred subway tile woke, trust fund tousled hell of mlkshk. Pabst prism snackwave freegan.")
end

puts "2 user and 40 posts created"
