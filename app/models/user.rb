class User < ApplicationRecord
  has_secure_password # tells password_digest needs to be encrypted

  validates_presence_of :email, :password_digest
  validates :email, format: { with: /@/, message: 'mist have an @' }, uniqueness: true
end
