class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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

  ROLES = %w[student mentor company_representative lecturer admin]

  def role_enum
    ROLES
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
