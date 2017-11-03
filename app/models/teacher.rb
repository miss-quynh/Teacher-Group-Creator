class Teacher < ApplicationRecord
  has_many :students

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def has_students?
    !self.students.empty?
  end

  def average_gpa
    if has_students?
      gpas = self.students.map { |student| student.gpa }
      gpas.reduce(0, :+) / self.students.length
    else
      "n/a"
    end
  end

  def average_detentions
    if has_students?
      detentions = self.students.map { |student| student.detentions }
      detentions.reduce(0, :+) / self.students.length
    else
      "n/a"
    end
  end

  def total_detentions
    if has_students?
      self.students.map { |student| student.detentions }.reduce(:+)
    else
      "n/a"
    end
  end

  def total_students
    if has_students?
      self.students.length
    else
      "n/a"
    end
  end
end
