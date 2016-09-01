class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
