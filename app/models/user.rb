class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :comments

  validates :name, presence: true 
  
  @password_regex = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i
  validates :password, presence: true
  validates_format_of :password, with: @password_regex
  validates_length_of :password, minimum: 6

  @email_regex = /\A\S+@\S+\.\S+\z/
  validates :email, uniqueness: true
  validates_format_of :email, with: @email_regular_expressions, allow_nil: true

end
