require 'csv'

class Student < ApplicationRecord

  belongs_to :teacher, required: false


  validates :first_name, :last_name, :grade_level, :gender, :gpa, presence: true

  def full_name
    "#{self.last_name}, #{self.first_name} "
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

  def self.parse_list(filename)
    CSV.foreach(filename, { :headers => true, :header_converters => :symbol }) do |row|
      student = self.create(row.to_h)
    end
  end

end
