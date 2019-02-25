class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_confirmation_of :password

  before_create :create_api_key

  private

  def create_api_key
    self.api_key = SecureRandom.hex(13)
    true
  end
end
