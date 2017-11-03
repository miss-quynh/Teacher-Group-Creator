require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = Student.new(first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 3.9, teacher_id: nil)
  end

  describe "student attributes" do
    it "is valid with valid attributes" do
      expect(@student).to be_valid
    end

    it "initially does not belong to a teacher" do
      expect(@student).to be_valid
    end

    it "is not valid without a first name" do
      @student.first_name = nil
      expect(@student).to_not be_valid
    end

    it "is not valid without a last name" do
      @student.last_name = nil
      expect(@student).to_not be_valid
    end

    it "is not valid without a grade level" do
      @student.grade_level = nil
      expect(@student).to_not be_valid
    end

    it "is not valid without a gender" do
      @student.gender = nil
      expect(@student).to_not be_valid
    end

    it "is not valid without a GPA" do
      @student.gpa = nil
      expect(@student).to_not be_valid
    end
  end

  describe "associations" do
    before do
      @teacher = Teacher.new(first_name: 'Mai', last_name: 'Nguyen', email: 'mai-nguyen@gmail.com')
      @student = Student.new(first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 3.9, teacher_id: @teacher.id)
      @teacher.students << @student
    end

    it "should belong to a teacher once assigned" do
      expect(@student.teacher).to eq @teacher
    end
  end

  describe "#full_name" do
    it "returns the concatenated last and first name" do
      @student = Student.new(first_name: 'Quynh', last_name: 'Nguyen')

      expect(@student.full_name).to eq 'Nguyen, Quynh'
    end
  end

  describe "#assigned_teacher?" do
    it "checks if there is an assigned teacher" do
      expect(@student.assigned_teacher?).to be_falsey
    end
  end

  describe "#teacher_name" do
    it "assigns a teacher if unassigned" do
      teacher = Teacher.create(first_name: 'Mai', last_name: 'Nguyen', email: 'mai-nguyen-95@gmail.com', password: 'maimai')
      new_student = Student.create(first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 3.9, teacher_id: teacher.id)
      teacher.students << new_student

      expect(new_student.teacher_name).to eq 'Mai Nguyen'
    end

    it "shows 'Unassigned' if there is not assigned teacher" do
      expect(@student.teacher_name).to eq 'Unassigned'
    end
  end

end