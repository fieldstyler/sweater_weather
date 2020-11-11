class User < ApplicationRecord
  before_create :generate_api_key
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :api_key, uniqueness: true
  private
  def generate_api_key
    new_api_key = SecureRandom.urlsafe_base64
    self.api_key = new_api_key
  end
end
