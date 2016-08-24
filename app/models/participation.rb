class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  STATUS = ["invited","going", "can t go", "maybe"]
  validates :status, inclusion: { in: STATUS }
  validates :event, presence: true
  validates :user, presence: true, uniqueness: { scope: :event, message: "you 've already joined this event !"}
end
