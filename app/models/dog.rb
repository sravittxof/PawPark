class Dog < ApplicationRecord
  belongs_to :user
  has_many :visits
  has_many :parks, through: :visits
  has_many :playdates, through: :visits

  validates :name, presence: true
  validates :age, numericality: true

  #scope :my_dogs, -> { where(user_id: current_user.id) }

  # def my_dog?(user)
  #   self.user == user
  # end

  def has_active_visit?
    self.visits.active_visit.any?
  end


end
