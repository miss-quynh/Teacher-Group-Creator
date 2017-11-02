class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.references :teacher
      t.references :student

      t.timestamps
    end
  end
end
