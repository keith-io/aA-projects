class User < ApplicationRecord
    after_initialize :ensure_session_token

    validates :username, :password_digest, :session_token, presence: true, uniqueness: true

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_session_token
        self.session_token = SecureRandom.urlsafe_base64
    end
end