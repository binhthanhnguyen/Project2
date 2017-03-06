class CreateCirriculumVitaes < ActiveRecord::Migration[5.0]
  def change
    create_table :cirriculum_vitaes do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
