# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

Event.destroy_all
Participation.destroy_all
User.destroy_all
Company.destroy_all


company_1 = Company.create!(name: "Club Med", address: "24 rue du Faubourg, Saint-Honoré 75008 Paris", name_of_contact: "Georges Kelly", phone_number: "0140174600", email: "georges.kelly@hermes.com" )
puts "#{company_1} a bien été créée"
company_2 = Company.create!(name: "Pierre et vacances", address: "22 avenue Montaigne, 75008 Paris", name_of_contact: "Vicky Adler", phone_number: "0144132222", email: "vicky.adler@lvmh.com")
puts "#{company_2} a bien été créée"
company_3 = Company.create!(name: "Uber", address: "17 boulevard Haussmann, 75009 Paris", name_of_contact: "Gerard Lactee", phone_number: "0144352020", email: "gerard.lactee@danone.com")
puts "#{company_3} a bien été créée"


user_1 = User.create!(email: "coline@gmail.com", password: "testtest", first_name: "coline", last_name: "colnat", job_title: "Web dev", company_id: company_1.id, photo: seed_image('coline') )
puts "#{user_1} a bien été créé'"
user_2 = User.create!(email: "benjamin@gmail.com", password: "testtest", first_name: "benjamin" , last_name: "lyphoudt", job_title: "Webmaster", company_id: company_2.id, photo: seed_image('benjamin'))
puts "#{user_2} a bien été créé'"
user_3 = User.create!(email: "abdel@gmail.com", password: "testtest", first_name: "abdel", last_name: "Mekhbout" , job_title: "Juriste", company_id: company_1.id, photo: seed_image('abdel'))
puts "#{user_3} a bien été créé'"
user_4 = User.create!(email:"Constance@gmail.com", password: "testtest", first_name: "Constance", last_name: "Toutlemonde" , job_title: "Marketing", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_5 = User.create!(email: "george@gmail.com", password: "testtest", first_name: "Georges", last_name: "Dupont" , job_title: "Comptable", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_6 = User.create!(email: "joe@gmail.com", password: "testtest", first_name: "joé", last_name: "Star" , job_title: "Business Developper", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_7 = User.create!(email: "musk@gmail.com", password: "testtest", first_name: "Elon", last_name: "Musk" , job_title: "DRH", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_8 = User.create!(email: "travis@gmail.com", password: "testtest", first_name: "Travis", last_name: "Kalanick" , job_title: "CEO", company_id: company_3.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_9 = User.create!(email: "garret@gmail.com", password: "testtest", first_name: "Garret", last_name: "Camp" , job_title: "CTO", company_id: company_3.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_10 = User.create!(email: "gerard@gmail.com", password: "testtest", first_name: "Gerard", last_name: "Bremond" , job_title: "PDG", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_11 = User.create!(email: "eric@gmail.com", password: "testtest", first_name: "eric", last_name: "star" , job_title: "Auxiliaire d'été", company_id: company_1.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_12 = User.create!(email: "gildas@gmail.com", password: "testtest", first_name: "paul", last_name: "fremont" , job_title: "Animateur", company_id: company_3.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_13 = User.create!(email: "victor@gmail.com", password: "testtest", first_name: "victor", last_name: "kros" , job_title: "Ingénieur", company_id: company_1.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_14 = User.create!(email: "victor@gmail.com", password: "testtest", first_name: "victor", last_name: "leroy" , job_title: "Comptable", company_id: company_1.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_15 = User.create!(email: "pauline@gmail.com", password: "testtest", first_name: "pauline", last_name: "peco" , job_title: "Directrice marketing", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_16 = User.create!(email: "emeric@gmail.com", password: "testtest", first_name: "emeric", last_name: "henon" , job_title: "Business Developper", company_id: company_3.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_17 = User.create!(email: "romain@gmail.com", password: "testtest", first_name: "romain", last_name: "morvelat" , job_title: "King of Burgers", company_id: company_3.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_18 = User.create!(email: "adrien@gmail.com", password: "testtest", first_name: "adrien", last_name: "sudiste" , job_title: "Logistique", company_id: company_1.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_19 = User.create!(email: "mael@gmail.com", password: "testtest", first_name: "mael", last_name: "gamer" , job_title: "Ingénieur", company_id: company_2.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_20 = User.create!(email: "thibault@gmail.com", password: "testtest", first_name: "thibault", last_name: "hmmm" , job_title: "Auxiliaire d'été", company_id: company_1.id, photo: seed_image('joe'))
puts "#{user_4} a bien été créé'"
user_21 = User.create!(email: "vincent@gmail.com", password: "testtest", first_name: "vincent", last_name: "vinz" , job_title: "Web Designer", company_id: company_2.id, photo: seed_image('joe'))
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

