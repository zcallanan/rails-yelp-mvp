class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  category_values = %w[chinese italian japanese french belgian]

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: category_values }
end
