class AddStatusToInternshipRecruitments < ActiveRecord::Migration[5.0]
  def change
    add_column :internship_recruitments, :status, :string
  end
end
