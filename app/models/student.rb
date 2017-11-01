class Student < ApplicationRecord
  belongs_to :teacher

  validates :first_name, :last_name, :grade_level, :gender, :gpa, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
