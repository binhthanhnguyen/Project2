class InternshipRecruitment < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title,  presence: true
  validates :content, presence: true
  has_many :internship_registrations
  has_many :users, through: :internship_registrations
  has_many :internship_assignments

  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' } 

  scope :approved, -> {where status: :approved}

  def registration_status (user_id)
  	InternshipRegistration.where("user_id = ? and internship_recruitment_id = ?", user_id, id).first.status
  end

  def registration(user_id)
  	InternshipRegistration.where("user_id = ? and internship_recruitment_id = ?", user_id, id).first
  end
end
