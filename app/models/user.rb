class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :usertype
  validates :citizenid, uniqueness: true
  validates :password, confirmation: true
  has_one :student
  has_one :instructor
  
  has_many :group_users
  has_many :groups, :through => :group_users

  has_many :course_users
  has_many :courses, :through => :course_users

  accepts_nested_attributes_for :student, :instructor
end
