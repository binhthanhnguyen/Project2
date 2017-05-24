class InternshipAssignment < ApplicationRecord
  belongs_to :internship_recruitment
  belongs_to :lecturer, class_name: "User"
  has_many :assignments, dependent: :destroy
  accepts_nested_attributes_for :assignments

  validates :internship_recruitment_id, presence: true
end
