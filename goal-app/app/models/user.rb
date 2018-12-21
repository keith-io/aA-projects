class User < ApplicationRecord
    after_initialize :ensure_session_token

    validates :username, :password_digest, :session_token, presence: true, uniqueness: true

    attr_reader :password

    has_many :goals

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user && user.is_password?(password) ? user : nil        
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


end