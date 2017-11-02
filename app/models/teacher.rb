class Teacher < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
