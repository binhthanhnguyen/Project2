class CreateInternshipRecruitments < ActiveRecord::Migration[5.0]
  def change
    create_table :internship_recruitments do |t|
      t.text :title
      t.text :content
      t.text :required_qualifications
      t.text :prefered_qualifications
      t.text :benefits
      t.text :company
      # t.integer :status, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
