class Evaluation < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  has_many :evaluation_criteria, dependent: :destroy
  accepts_nested_attributes_for :evaluation_criteria
  validates :assignment, presence: true
end
