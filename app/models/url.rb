class Url < ApplicationRecord
  validates :original, :link, :visits, presence: true
end
