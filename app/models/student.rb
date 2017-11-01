class Student < ApplicationRecord
  belongs_to :teacher

  validates :full_name, :grade_level, :gender, :gpa, presence: true
end
