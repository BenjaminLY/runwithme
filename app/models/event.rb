class Event < ApplicationRecord
  belongs_to :user
  has_attachment :photo

  validates :name, presence: true
  validates :datetime, presence: true
  validates :public, :inclusion => { :in => [true, false] }
  validates :place_name, presence: true
  validate :goal
  validates :nb_of_participants, presence: true

  def goal
    if time_goal.nil? && trail_goal.nil?
      errors.add(:time_goal, "You have to choose a goal")
      errors.add(:trail_goal, "You have to choose a goal")
    end
  end

  def time_goal_to_s
    return "" if time_goal.nil?
    hours = time_goal / 60
    min = time_goal % 60
    min = "0#{min}" if min < 10
    hours == 0 ? "#{min}min" : "#{hours}h#{min}min"
  end
end
