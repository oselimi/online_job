class Applicate < ApplicationRecord
  belongs_to :job

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  NUMBER_REGEX = /\d[0-9]\)*\z/
  EDUCATIONS = ["Master degree", "Bachelor degree", "High school", "Other"]

  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :birthdate, presence: true
  validates :address, presence: true
  validates :phone, presence: true, format: { with: NUMBER_REGEX }
  validates :education, presence: true

  def fullname
    [first_name, last_name].join(' ')
  end
end
