# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
User.destroy_all

user_1 = User.create!(email: "coco@hoho", password: "2332123323")
user_2 = User.create!(email: "bubuo@hoho", password: "12232324")

attributes = [
{
  user_id: user_1.id,
  name: "runy poney",
  datetime: DateTime.new(2016, 8, 20),
  public: false,
  kind: "chatting run",
  place_name: "Buttes Chaumont",
  time_goal: 20,
  nb_of_participants: 3
},
{
  user_id: user_2.id,
  name: "walk",
  datetime: DateTime.new(2016, 9, 10),
  public: true,
  kind: "perf run",
  description: "Let's run run run",
  place_name: "Parc floral",
  address: "16 villa gaudelet",
  trail_goal: 20,
  nb_of_participants: 10
}
]

# attributes.each do |attribute|
#   Event.create!(attribute)
# end
