class User < ApplicationRecord
  has_many :jobs, dependent: :destroy
  
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  MIN_LENGTH_PASSWORD = 6

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password,    presence: true, length: { minimum: MIN_LENGTH_PASSWORD }

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
