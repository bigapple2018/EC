class CdItem < ApplicationRecord
  belongs_to :item
  has_many :song
end
