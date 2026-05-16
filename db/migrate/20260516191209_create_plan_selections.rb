class CreatePlanSelections < ActiveRecord::Migration[8.1]
  def change
    create_table :plan_selections do |t|
      t.references :degree_plan, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.string :elective_group, null: false

      t.timestamps
    end
    add_index :plan_selections, [:degree_plan_id, :elective_group], unique: true
  end
end
