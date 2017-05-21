class CreateCriterions < ActiveRecord::Migration[5.0]
  def change
    create_table :criterions do |t|
      t.string :title

      t.timestamps
    end
  end
end
