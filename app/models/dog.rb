class Dog < ApplicationRecord
  belongs_to :user
  has_many :visits
  has_many :parks, through: :visits
  has_many :playdates, through: :visits

  #scope :my_dogs, -> { where(user_id: current_user.id) }

end
