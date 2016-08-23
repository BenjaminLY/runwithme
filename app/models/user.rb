class User < ApplicationRecord
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

  def events_as_participant
  	self.participations.map do |participation|
  		participation.event
  	end
  end
end
