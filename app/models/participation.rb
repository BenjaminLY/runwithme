class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user
  STATUS = ["invited","going", "can't go", "maybe"]
  validates :status, inclusion: { in: STATUS }
end
