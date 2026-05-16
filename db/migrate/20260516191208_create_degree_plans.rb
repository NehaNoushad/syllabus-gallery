class CreateDegreePlans < ActiveRecord::Migration[8.1]
  def change
    create_table :degree_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :branch
      t.string :scheme

      t.timestamps
    end
  end
end
