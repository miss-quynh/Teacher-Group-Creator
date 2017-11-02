require 'csv'

class Student < ApplicationRecord
  has_one :enrollment
  has_one :teacher, through: :enrollment

  validates :first_name, :last_name, :grade_level, :gender, :gpa, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.parse_list(filename)
    CSV.foreach(filename, { :headers => true, :header_converters => :symbol }) do |row|
      student = self.create(row.to_h)
    end
  end

end
