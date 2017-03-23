class User < ApplicationRecord
  before_save { self.email = email.downcase }
   validates :name,  presence: true, length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
       format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  has_one :curriculum_vitae
  has_many :internship_recruitments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(access_token)
  data = access_token.info
  user = User.where(:email => data["email"]).first

  unless user
    password = Devise.friendly_token[0,20]
    user = User.create(name: data["name"], email: data["email"],
      password: password, password_confirmation: password
    )
  end
  user
end

end
