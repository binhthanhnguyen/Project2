class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
  		format: { with: VALID_EMAIL_REGEX },
  		uniqueness: { case_sensitive: false }

  # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_one :curriculum_vitae
  has_many :internship_recruitments
  has_many :internship_registrations

  validates :internship_registrations, length: {maximum: 3}



  has_many :internship_assignments, class_name: "InternshipAssignment", foreign_key: "lecturer_id"
  
  has_many :mentored_internships, class_name: "Assignment", foreign_key: "mentor_id"

  has_many :assignments, class_name: "Assignment", foreign_key: "student_id"

  ROLES = %w[student mentor company_representative lecturer supervisor admin]

  scope :student, -> {where role: :student}
  scope :lecturer, -> {where role: :lecturer}
  scope :mentor, -> {where role: :mentor}

  def role_enum
    ROLES
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) == ROLES.index(role)
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
end
