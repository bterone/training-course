class Group < ApplicationRecord
  belongs_to :course

  has_many :group_users
  has_many :users, :through => :group_users
end
