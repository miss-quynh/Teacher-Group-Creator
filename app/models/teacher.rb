class Teacher < ApplicationRecord
  has_many :students

  validates :full_name, :email, presence: true
  validates :email, uniqueness: true
end
