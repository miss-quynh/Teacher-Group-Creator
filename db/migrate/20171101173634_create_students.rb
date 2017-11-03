class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :grade_level, null: false
      t.string :gender, null: false
      t.decimal :gpa, :scale => 2, null: false
      t.integer :detentions
      t.string :shirt_size
      t.references :teacher

      t.timestamps
    end
  end
end
