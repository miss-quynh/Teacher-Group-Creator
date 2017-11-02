require 'rails_helper'

RSpec.describe Teacher, type: :model do
  let(:teacher) { Teacher.create(first_name: 'Mai', last_name: 'Nguyen', email: 'mai-nguyen@gmail.com', password: 'maimai') }
  let(:students) { [Student.create(first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 3.9, teacher_id: teacher.id), Student.create(first_name: 'Huu Phu', last_name: 'Nguyen', grade_level: 9, gender: 'male', gpa: 3.48, teacher_id: teacher.id)] }

  describe "associations" do
    it "has many students" do
      expect(teacher.students).to eq students
    end
  end

  describe "teacher attributes" do
    it "is valid with valid attributes" do
      expect(teacher).to be_valid
    end

    it "is not valid without a first name" do
      teacher.first_name = nil
      expect(teacher).to_not be_valid
    end

    it "is not valid without a last name" do
      teacher.last_name = nil
      expect(teacher).to_not be_valid
    end

    it "is not valid without an email" do
      teacher.email = nil
      expect(teacher).to_not be_valid
    end
  end

  describe "#full_name" do
    it "returns the concatenated first and last name" do
      expect(teacher.full_name).to eq 'Mai Nguyen'
    end
  end

end