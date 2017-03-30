class InternshipRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :internship_recruitment
  validates :internship_recruitment_id, uniqueness: { scope: :user_id }
end