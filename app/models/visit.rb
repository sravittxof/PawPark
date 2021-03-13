class Visit < ApplicationRecord
  belongs_to :dog
  belongs_to :park
  has_many :visit_playdates
  has_many :playdates, through: :visit_playdates


  scope :active_visit, -> { where(active_visit: true) }

  def visiting_dog_name
    self.dog.name
  end

  # def dog_name=(name)
  #   self.dog = 
  # end

  # def dog_name
  #   self.name
  # end



end
