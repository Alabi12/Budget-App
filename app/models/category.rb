class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenditures

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :icon, presence: true
end
