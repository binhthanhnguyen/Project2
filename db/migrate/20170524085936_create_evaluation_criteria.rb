class CreateEvaluationCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluation_criteria do |t|
      t.references :criterion, foreign_key: true
      t.integer :point
      t.text :comment
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
