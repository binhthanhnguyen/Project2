class CreateInternshipAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :internship_assignments do |t|
      t.references :internship_recruitment, foreign_key: true
      t.integer :lecturer_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
