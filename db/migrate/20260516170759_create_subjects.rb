class CreateSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.integer :credits
      t.string :category
      t.string :kind
      t.integer :semester
      t.string :elective_group
      t.string :branch
      t.string :scheme

      t.timestamps
    end
  end
end
