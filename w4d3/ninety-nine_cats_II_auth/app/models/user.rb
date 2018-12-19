# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  user_name       :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  after_initialize reset_session_token!

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true
  validates :password, length: {within: 6..99}, allow_nil: true
  validates :session_token, presence: true

  def self.find_by_credentials(user_name, password)
    User.find_by(user_name: user_name, password: password)
  end
  
  def password=(pass)
    @password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(@password_digest).is_password?(pass)
  end

  def reset_session_token!
    @session_token = SecureRandom.hex(10)
  end

end