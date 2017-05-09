class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :questions
  has_many :answers
  has_many :comments, as: :commentables
  has_many :votes, as: :voteables

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX },
                    length: { maximum: 255 }
  validates :user_name, presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, presence: true,
                        length: { minimum: 8 }


  # def password
  #   @password ||= BCrypt::Password.new(password_digest)
  # end

  # def password=(new_password)
  #   @password = BCrypt::Password.create(new_password)
  #   self.password_digest = @password
  # end

  # def self.authenticate(password)
  #   user = self.find_by(params[:id])
  #   user.password == password
  # end

end
