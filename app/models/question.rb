class Question < ApplicationRecord
scope :answered, -> {where(answered: true)}
scope :unanswered, -> {where(answered: false)}


    belongs_to :listing
    belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

    def status
        self.answer ? "Answered" : "Not Answered"
    end

end
