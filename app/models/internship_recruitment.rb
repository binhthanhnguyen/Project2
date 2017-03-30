class InternshipRecruitment < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title,  presence: true
  validates :content, presence: true
  has_many :internship_registrations
  has_many :users, through: :internship_registrations

end
