class CreateInternshipRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :internship_registrations do |t|
      t.references :user, foreign_key: true
      t.references :internship_recruitment, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :internship_registrations, [:user_id, :internship_recruitment_id], unique: true, name: 'registrations'
  end
end
