require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    COLORS = %w(
        black
        white
        grey
        orange
        calico
    ).freeze

    validates :name, presence: true
    validates :color, inclusion: { in: COLORS, message: 'not a valid color' }
    validates :sex, inclusion: { in: ['M', 'F'],
                                 message: "must be M or F" }

    has_many :requests, 
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy

    def age
        # time_ago_in_words(Date.today - birth_date)
        puts " #{((Date.today - birth_date) / 365).to_f.to_i } ish"
    end
end