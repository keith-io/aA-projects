# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks,
    primary_key: :id,
    class_name: :Artwork,
    foreign_key: :artist_id
    
  has_many :viewers,
    primary_key: :id,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :viewers,
    source: :artwork


end
