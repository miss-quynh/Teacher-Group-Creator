class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :full_name, null: false
      t.integer :grade_level, null: false
      t.string :gender, null: false
      t.integer :gpa, null: false
      t.integer :detentions
      t.string :shirt_size
      t.references :teacher

      t.timestamps
    end
  end
end
