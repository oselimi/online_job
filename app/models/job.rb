class Job < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["Programming", "IT Security", "Desgin", "IT Support"]

  validates :title,       presence: true
  validates :description, presence: true
  validates :category,    presence: true
  validates :deadline,    presence: true
  validates :user_id,     presence: true
end
