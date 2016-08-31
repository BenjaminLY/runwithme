class User < ApplicationRecord
  belongs_to :company

  RUNNING_TYPE = ["fractionné", "endurance", "marche rapide", "décontracté"]

  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :photo
  validates :job_title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def events_as_participant
  	self.participations.map do |participation|
  		participation.event
  	end
  end

  def private_events
    private_events = self.events_as_participant.select do |event|
      event.private && event.user_id =! self.id
    end
  end

  def refused_events
    events = []
    self.participations.each do |participation|
      if participation.status == "can t go"
        events << participation.event
      end
    end
    events
  end
end
