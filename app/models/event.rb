class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :datetime, presence: true
  validates :public, presence: true
  validates :place_name, presence: true
  validate :goal
  validates :nb_of_participants, presence: true

  def goal
    if time_goal.nil? && trail_goal.nil?
      errors.add(:time_goal, "You have to choose a goal")
      errors.add(:trail_goal, "You have to choose a goal")
    end
  end
end
