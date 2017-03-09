class CreateInternshipRecruitments < ActiveRecord::Migration[5.0]
  def change
    create_table :internship_recruitments do |t|
      t.text :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
