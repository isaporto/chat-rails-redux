require 'faker'

puts "Destroying all User instances. Please wait"
User.destroy_all
puts "Destroying all Message instances. Please wait"
Message.destroy_all
puts "Destroying all Channel instances. Please wait"
Channel.destroy_all
puts "\n"
puts "Creating some new Channel instances. One second, please"
general = Channel.create(name: "general")
brasil = Channel.create(name: "brasil")
react = Channel.create(name: "react")
puts "\n"
puts "Creating some new User instances. One second, please"
isa =   User.create(email: "isaportinho@hotmail.com", password: "senha123", username: "hisapudine")
kleb =  User.create(email: "klebinho@uol.com.br", password: "senha123", username: "keblinho123")
pablo = User.create(email: "pablo@yahoo.com.br", password: "senha123", username: "pablito")
puts "\n"
puts "Creating some random Message instances. One second, please"
users = [isa, kleb, pablo]
10.times do
  Message.create(content: Faker::TvShows::BojackHorseman.quote, user: users.sample, channel: general)
end
10.times do
  Message.create(content: Faker::TvShows::RickAndMorty.quote, user: users.sample, channel: brasil)
end
10.times do
  Message.create(content: Faker::TvShows::SouthPark.quote, user: users.sample, channel: react)
end
