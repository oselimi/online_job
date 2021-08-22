class Job < ApplicationRecord
  belongs_to :user
  has_many :applicates, dependent: :destroy

  CATEGORIES = ["Programming", "IT Security", "Desgin", "IT Support"]

  validates :title,       presence: true
  validates :description, presence: true
  validates :category,    presence: true
  validates :deadline,    presence: true
  validates :user_id,     presence: true
end
