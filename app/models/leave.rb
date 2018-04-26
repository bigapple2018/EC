class Leave < ApplicationRecord
    validates :leave_reason, presence: true
end
