class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.integer :student_id
      t.integer :mentor_id
      t.datetime :start_date
      t.datetime :end_date
      t.references :internship_assignment, foreign_key: true

      t.timestamps
    end
  end
end
