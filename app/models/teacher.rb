class Teacher < ApplicationRecord
  has_many :students

  validates :full_name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
