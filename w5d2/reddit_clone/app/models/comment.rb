class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :post
  belongs_to :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: :comment,
    optional: :true


end