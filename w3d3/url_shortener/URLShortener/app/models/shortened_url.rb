require 'securerandom'
class ShortenedUrl < ApplicationRecord
  # include SecureRandom::urlsafe_base64

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  
  has_many :visits


    def self.random_code
      code = SecureRandom.urlsafe_base64
      return code unless self.exists?(short_url: code)
      
      self.random_code     
    end

    def self.create_shorturl(user, long_url)
      short_url = "http://#{self.random_code}"
      self.create!(short_url: short_url, long_url: long_url, user_id: user.id)
    end
end