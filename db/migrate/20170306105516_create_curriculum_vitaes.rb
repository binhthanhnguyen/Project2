class CreateCurriculumVitaes < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculum_vitaes do |t|
      t.text :objective
      t.text :work_eperience
      t.text :qualifications
      t.text :education
      t.text :skills
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
