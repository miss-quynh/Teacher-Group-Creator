class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
