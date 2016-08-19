class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :participations, dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment :photo

  def events_as_participant
  	self.participations.map do |participation|
  		participation.event
  	end
  end
end
