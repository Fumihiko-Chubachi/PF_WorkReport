class WorkComment < ApplicationRecord

  #アソシエーション
  belongs_to :work
  belongs_to :user

  #
  validates :comment, presence: true
  
end