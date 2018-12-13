class User < ApplicationRecord
    Validates :username, presence: true, uniqueness: true 

    has_many :authored_poll,
        class_name: :Poll,
        foreign_key: :author_id

    has_many :responses,
        class_name: :Response,
        foreign_key: :user_id
end