class CatRentalRequest < ApplicationRecord
    validates :start_date, :end_date, :status, presence: true
    validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED'], message: 'invalid status' } 

    belongs_to :cat, dependent: :destroy

    def overlapping_requests
        self.cat.requests.where.not("start_date > #{self.end_date} OR end_date < #{self.start_date}")
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end

    def does_not_overlap_approved_request
        overlapping_approved_requests.exists?
    end
end