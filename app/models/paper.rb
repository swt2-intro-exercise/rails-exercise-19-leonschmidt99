class Paper < ApplicationRecord
  has_and_belongs_to_many :authors
  validates :title, :venue, presence: true
  validates :year, numericality: true
end
