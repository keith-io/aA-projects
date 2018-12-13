class Response < ApplicationRecord
    belongs_to :answer_choice,
        class_name: :AnswerChoice,
        foreign_key: :answer_choice_id

    belongs_to :respondent,
        class_name: :User,
        foreign_key: :user_id

    has_one :question,
        through: :answer_choice,
        source: :question

    def not_duplicate_response
        
    end 

    def sibling_responses
        self.question.responses
    end
end