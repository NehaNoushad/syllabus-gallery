class DropPlans < ActiveRecord::Migration[8.1]
  def change
    # plan_selections has a foreign key into degree_plans, so it must go first.
    drop_table :plan_selections do |t|
      t.references :degree_plan, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.string :elective_group, null: false
      t.timestamps
    end

    drop_table :degree_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :branch
      t.string :scheme
      t.timestamps
    end
  end
end
