class Leave < ApplicationRecord
    validates :leave_reason, presence: true
    validates :leave_reason, length: { in: 1..75 }
end
