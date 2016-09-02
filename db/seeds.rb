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


company_1 = Company.create!(name: "Club Med", address: "11 rue de Cambrai, 75019 Paris", name_of_contact: "Jeremie Hoss", phone_number: "0140174600", email: "jeremiehoss@clubmed.com")
puts "#{company_1} a bien été créée"
company_2 = Company.create!(name: "Pierre et Vacances", address: "12 rue de Cambrai, 75019 Paris", name_of_contact: "Martin Pilleau", phone_number: "0144132222", email: "martinpilleau@pev.com")
puts "#{company_2} a bien été créée"
company_3 = Company.create!(name: "Uber", address: "13 rue de Cambrai, 75019 Paris", name_of_contact: "Gerard Biolato", phone_number: "0144352020", email: "gerardbiolato@uber.com")
puts "#{company_3} a bien été créée"



user_1 = User.create!(email: "colinecolnat@clubmed.com", password: "testtest", first_name: "coline", last_name: "colnat", job_title: "Directrice de la communication", company_id: company_1.id, photo: seed_image('coline'), run_level: "Intermédiaire")
puts "#{user_1} a bien été créé"

user_2 = User.create!(email: "benjamin@clubmed.com", password: "testtest", first_name: "benjamin" , last_name: "lyphoudt", job_title: "Responsable des achats", company_id: company_1.id, photo: seed_image('benjamin'), run_level: "Intermédiaire")
puts "#{user_2} a bien été créé"

user_3 = User.create!(email: "abel@clubmed.com", password: "testtest", first_name: "abel", last_name: "mebkhout" , job_title: "Juriste", company_id: company_1.id, photo: seed_image('abdel'), run_level: "Débutant")
puts "#{user_3} a bien été créé"

user_4 = User.create!(email:"Constance@clubmed.com", password: "testtest", first_name: "constance", last_name: "toutlemonde" , job_title: "Product Owner", company_id: company_1.id, photo: seed_image('constance'), run_level: "Intermédiaire")
puts "#{user_4} a bien été créé"

user_5 = User.create!(email: "george@clubmed.com", password: "testtest", first_name: "georges", last_name: "taluit" , job_title: "Comptable", company_id: company_1.id, photo: seed_image('georges'), run_level: "Débutant")
puts "#{user_4} a bien été créé"

user_6 = User.create!(email: "joe@clubmed.com", password: "testtest", first_name: "joé", last_name: "marc" , job_title: "Business Analyst", company_id: company_1.id, photo: seed_image('joe'), run_level: "Confirmé")
puts "#{user_4} a bien été créé"

user_7 = User.create!(email: "musk@clubmed.com", password: "testtest", first_name: "elon", last_name: "musk" , job_title: "DRH", company_id: company_1.id, photo: seed_image('Elon'), run_level: "Confirmé")
user_8 = User.create!(email: "travis@clubmed.com", password: "testtest", first_name: "travis", last_name: "Kalanick" , job_title: "CEO", company_id: company_1.id, photo: seed_image('travis_kalanick'), run_level: "Intermédiaire" )
puts "#{user_4} a bien été créé"

user_9 = User.create!(email: "garret@clubmed.com", password: "testtest", first_name: "garret", last_name: "Camp" , job_title: "CTO", company_id: company_1.id, photo: seed_image('garrett-camp'), run_level: "Débutant")
puts "#{user_4} a bien été créé"

user_10 = User.create!(email: "gerard@clubmed.com", password: "testtest", first_name: "gerard", last_name: "Bremond" , job_title: "Comptable", company_id: company_1.id, photo: seed_image('vincent'), run_level: "Confirmé")
puts "#{user_4} a bien été créé"

user_11 = User.create!(email: "victor@pev.com", password: "testtest", first_name: "victor", last_name: "korelsky" , job_title: "Analyste financier", company_id: company_2.id, photo: seed_image('victor'), run_level:"Débutant" )
puts "#{user_4} a bien été créé"

user_12 = User.create!(email: "paul@pev.com", password: "testtest", first_name: "paul", last_name: "fremont" , job_title: "Web designer", company_id: company_2.id, photo: seed_image('paul'), run_level: "Intermédiaire")
puts "#{user_4} a bien été créé"

user_13 = User.create!(email: "jean@pev.com", password: "testtest", first_name: "jean", last_name: "kros" , job_title: "Prestataire", company_id: company_2.id, photo: seed_image('jean'), run_level: "Débutant")
puts "#{user_4} a bien été créé"

user_14 = User.create!(email: "farah@pev.com", password: "testtest", first_name: "farah", last_name: "falcony" , job_title: "Responsable Juridique", company_id: company_2.id, photo: seed_image('farah'), run_level: "Confirmé")
puts "#{user_4} a bien été créé"

user_15 = User.create!(email: "pauline@uber.com", password: "testtest", first_name: "pauline", last_name: "peco" , job_title: "Directrice Marketing", company_id: company_3.id, photo: seed_image('pauline'), run_level:"Intermédiaire" )
puts "#{user_4} a bien été créé"

user_16 = User.create!(email: "emeric@uber.com", password: "testtest", first_name: "emeric", last_name: "henon" , job_title: "Business Developper", company_id: company_3.id, photo: seed_image('emeric'), run_level:"Confirmé" )
puts "#{user_4} a bien été créé"

user_17 = User.create!(email: "vincent@uber.com", password: "testtest", first_name: "vincent", last_name: "delauney" , job_title: "Chauffeur", company_id: company_3.id, photo: seed_image('vincent2'), run_level: "Débutant" )
puts "#{user_4} a bien été créé"

user_18 = User.create!(email: "adrien@uber.com", password: "testtest", first_name: "adrien", last_name: "tiliot" , job_title: "Logistique", company_id: company_3.id, photo: seed_image('adrien'), run_level: "Débutant")
puts "#{user_4} a bien été créé"

attributes = [
  {
    user_id: user_1.id,
    type_of: "Run rapide",
    datetime: DateTime.new(2016,9,8,12,15,0),
    private: true,
    description: "Course rapide avec un objectif temps déterminé",
    meeting_point: "Canal de l'Ourcq",
    time_goal: 40,
  },
  {
    user_id: user_2.id,
    type_of: "Run fractionné",
    datetime: DateTime.new(2016,9,12,13,00,0),
    private: false,
    description: "Un run fractionné pour s'entrainer au 20km de Paris",
    meeting_point: "A la cafet du RDC",
    address: "Parc de la Vilette",
    trail_goal: 5,
  },
  {
    user_id: user_7.id,
    type_of: "Run endurance",
    datetime: DateTime.new(2016, 9, 7,11,30,0),
    private: false,
    meeting_point: "En bas de la tour",
    time_goal: 55,
  },
  {
    user_id: user_9.id,
    type_of: "Marche rapide",
    datetime: DateTime.new(2016, 9, 30,11,30,0),
    private: true,
    description: "Faire une marche rapide pour faire une activité en douceur et prendre l'air",
    address: "Parc de la Vilette",
    meeting_point: "Devant la machine à café du 2eme",
    trail_goal: 4,
  },
  {
    user_id: user_1.id,
    type_of: "Blabla run",
    datetime: DateTime.new(2016, 9, 30,13,00,0),
    private: true,
    description: "Faire une course tranquille pour papoter en même temps",
    address: "Parc de la Vilette",
    meeting_point: "Devant les ascenseurs du 3ème étage",
    trail_goal: 5,
  },
  {
    user_id: user_2.id,
    type_of: "Marche plaisante",
    datetime: DateTime.new(2016, 9, 30,13,00,0),
    private: false,
    description: "Prendre l'air dans le parc de la vilette",
    address: "Parc de la Vilette",
    meeting_point: "En bas de la tour",
    time_goal: 30,
  },
  {
    user_id: user_14.id,
    type_of: "Run rapide",
    datetime: DateTime.new(2016, 9, 19,12,00,0),
    private: false,
    description: "Défier nos concurrents",
    address: "Parc de la Vilette",
    meeting_point: "En bas de nos locaux",
    time_goal: 30,
  },
  {
    user_id: user_9.id,
    type_of: "Run rapide",
    datetime: DateTime.new(2016, 9, 26,13,30,0),
    private: false,
    description: "S'entrainer pour le semi-marathon",
    address: "Buttes Chaumont",
    meeting_point: "En bas de la tour devant le bassin",
    time_goal: 40,
  },
  {
    user_id: user_16.id,
    type_of: "Run endurance",
    datetime: DateTime.new(2016, 9, 30,12,00,0),
    private: false,
    description: "Défiez nos voisins",
    address: "Canal de l'Ourcq",
    meeting_point: "Devant les locaux du CM",
    trail_goal: 15,
  }
]

attributes.each do |attribute|
  event = Event.create!(attribute)
  Participation.create!(status: "going", user_id: attribute[:user_id], event_id: event.id)
  puts " l'event et la participation ont bien été créés"
end


