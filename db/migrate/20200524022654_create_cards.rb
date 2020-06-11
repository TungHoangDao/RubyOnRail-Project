class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :student_full_name
      t.string :student_number
      t.string :picture

      t.timestamps
    end
  end
end
