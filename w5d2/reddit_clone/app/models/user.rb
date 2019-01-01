class User < ApplicationRecord
  after_initialize :ensure_session_token

  validates :username, :password_digest, :session_token, presence: true
  validates :username, :password_digest, uniqueness: true
  validates :password, length: {within: 6..99, allow_nil: true}

  attr_reader :password

  has_many :subs
  has_many :comments
  
  def password=(password)
    @password = password
    @password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(@password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

  
  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
  
  private

  def ensure_session_token
    @session_token ||= SecureRandom.urlsafe_base64
  end
end