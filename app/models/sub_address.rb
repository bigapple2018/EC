class SubAddress < ApplicationRecord

belongs_to :user
validates :sub_postal_code, presence: true
validates :sub_address, presence: true

end
