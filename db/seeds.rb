# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all

mari = User.create(username: "mari", password: "abc123")
harmony = User.create(username: "harmony", password: "abc123")
jordan = User.create(username: "jordan", password: "abc123")


Post.create(caption: "article 1")
Post.create(caption: "article 5")


Post.create(caption: "article 2")


Post.create(caption: "article 6")
Post.create(caption: "article 7")


5.times do
  UserPost.create(user: User.all.sample, post: Post.all.sample)
end
# mari = User.create(username:"mari", password:"abc123")

# mari.posts.create(caption:"cool", content_url:"https://www.blackenterprise.com/netflixs-self-made-reintroduces-the-world-to-americas-first-black-millionaire-madam-c-j-walker/")
puts "done!"