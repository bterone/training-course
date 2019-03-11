class User < ApplicationRecord
  belongs_to :usertype
  validates :citizenid, uniqueness: true
  validates :password, confirmation: true
  has_one :student
  has_one :instructor
  
  has_many :group_users
  has_many :groups, :through => :group_users

  accepts_nested_attributes_for :student, :instructor
end
