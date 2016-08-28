# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
Participation.destroy_all
User.destroy_all
Company.destroy_all

company_1 = Company.create!(name: "Hermes", address: "24 rue du Faubourg, Saint-Honoré 75008 Paris", name_of_contact: "Georges Kelly", phone_number: "0140174600", email: "georges.kelly@hermes.com" )
puts "#{company_1} a bien été créée"
company_2 = Company.create!(name: "LVMH", address: "22 avenue Montaigne, 75008 Paris", name_of_contact: "Vicky Adler", phone_number: "0144132222", email: "vicky.adler@lvmh.com")
puts "#{company_2} a bien été créée"
company_3 = Company.create!(name: "Danone", address: "17 boulevard Haussmann, 75009 Paris", name_of_contact: "Gerard Lactee", phone_number: "0144352020", email: "gerard.lactee@danone.com")
puts "#{company_3} a bien été créée"


user_1 = User.create!(email: "coline@gmail.com", password: "testtest", first_name: "coline", last_name: "colnat", job_title: "Web dev", company_id: company_1.id)
puts "#{user_1} a bien été créé'"
user_2 = User.create!(email: "benjamin@gmail.com", password: "testtest", first_name: "benjamin" , last_name: "lyphoudt", job_title: "webmaster", company_id: company_1.id)
puts "#{user_2} a bien été créé'"
user_3 = User.create!(email: "abdel@gmail.com", password: "testtest", first_name: "abdel", last_name: "malik" , job_title: "Lawyer", company_id: company_1.id)
puts "#{user_3} a bien été créé'"
user_4 = User.create!(email: "joe@gmail.com", password: "testtest", first_name: "joe", last_name: "star" , job_title: "Accountant", company_id: company_1.id)
puts "#{user_4} a bien été créé'"

attributes = [
  {
    user_id: user_1.id,
    type_of: "Endurance run",
    datetime: DateTime.new(2016, 8, 20),
    private: true,
    description: "Course intensive avec un objectif temps déterminé",
    meeting_point: "Canal Saint Martin",
    time_goal: 55,
  },
  {
    user_id: user_2.id,
    type_of: "Speed walk",
    datetime: DateTime.new(2016, 9, 10),
    private: false,
    description: "Une belle marche dans le quartier populaire d'Oberkampf",
    meeting_point: "metro Oberkampf",
    address: "16 villa gaudelet, Paris",
    trail_goal: 5,
  },
  {
    user_id: user_3.id,
    type_of: "Cool run",
    datetime: DateTime.new(2016, 12, 12),
    private: false,
    meeting_point: "Buttes Chaumont",
    time_goal: 45,
  },
  {
    user_id: user_4.id,
    type_of: "Endurance run",
    datetime: DateTime.new(2016, 9, 30),
    private: false,
    description: "Let's run run run",
    address: "Place de la Bastille",
    meeting_point: "Place de la Bastille",
    trail_goal: 21,
  }
]

attributes.each do |attribute|
  event = Event.create!(attribute)
  Participation.create!(status: "going", user_id: attribute[:user_id], event_id: event.id)
  puts " l'event et la participation ont bien été créés"
end

