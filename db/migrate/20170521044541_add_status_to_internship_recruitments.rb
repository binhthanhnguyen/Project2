class AddStatusToInternshipRecruitments < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
    	CREATE TYPE recruitment_status AS ENUM ('pending', 'approved', 'rejected');
    SQL

    add_column :internship_recruitments, :status, :recruitment_status, index: true, default: 'pending'
  end

  def down
    remove_column :internship_recruitments, :status

    execute <<-SQL
      DROP TYPE recruitment_status;
    SQL
  end
end
