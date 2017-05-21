class AddStatusToInternshipRegistrations < ActiveRecord::Migration[5.0]

  def up
    execute <<-SQL
    	CREATE TYPE status AS ENUM ('pending', 'approved', 'rejected');
    SQL

    add_column :internship_registrations, :status, :status, index: true, default: 'pending'
  end

  def down
    remove_column :internship_registrations, :status

    execute <<-SQL
      DROP TYPE status;
    SQL
  end
end
