class AdminUser < ApplicationRecord

  attr_accessor :login

  has_many :blogs, dependent: :destroy
  belongs_to :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable, 
         :trackable, 
         authentication_keys:[:login]

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    if(login = conditions.delete(:login))
      where(conditions).where(
        ["lower(username) = :value OR lower(email) = :value",
        { value: login.strip.downcase}]).first 
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  FORBIDDEN_USERNAME = ['admin', 'ADMIN']
  FORBIDDEN_EMAIL = ['admin', 'ADMIN']


  validates :first_name,  :presence => true,
                          :length => { :maximum => 50 }
  validates :last_name,   :presence => true,
                          :length => { :maximum => 50 }
  validates :username,  :presence => true,
                        :uniqueness =>true,
                        :length => { :maximum => 30 }
  validates :email, :presence => true,
                    :length => { :maximum => 40},
                    :format => VALID_EMAIL_REGEX,
                    :confirmation => true,
                    :uniqueness => true
  validates :password, :presence => true

  validate :username_is_allowed
  validate :email_is_allowed

  # private
    def login
        @login || self.username || self.email
    end

    def username_is_allowed 
        if FORBIDDEN_USERNAME.include?(username)
            errors.add(:username, "is not allowed")
        end
    end

    def email_is_allowed 
        if FORBIDDEN_EMAIL.include?(email)
            errors.add(:email, "is not allowed")
        end
    end
end
