class SubAddress < ApplicationRecord

belongs_to :user
POSTAL_TELL_REGEXP = /\A[0-9¥-]+\z/

validates :sub_address, presence: true
validates :sub_postal_code, presence: true
validates :sub_postal_code, format: { with: POSTAL_TELL_REGEXP, message: "数字とハイフンのみが使用できます" }, length: { minimum: 8 },if:"sub_postal_code.present?"

end
