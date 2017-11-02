class Teacher < ApplicationRecord
  has_many :students

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def average_gpa
    gpas = self.students.map { |student| student.gpa }
    gpas.reduce(:+) / self.students.length
  end

  def average_detentions
    detentions = self.students.map { |student| student.detentions }
    detentions.reduce(:+) / self.students.length
  end

  def total_detentions
    self.students.map { |student| student.detentions }.reduce(:+)
  end

  def total_students
    self.students.length
  end
end
