class Student < ApplicationRecord
  belongs_to :teacher, required: false

  validates :first_name, :last_name, :grade_level, :gender, :gpa, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def assigned_teacher?
    !!teacher_id
  end

  def teacher_name
    if assigned_teacher?
      self.teacher.full_name
    else
      "Unassigned"
    end
  end

end
