class Visit < ApplicationRecord

  belongs_to :user
    # class_name: :User,

  belongs_to :shortened_url
end