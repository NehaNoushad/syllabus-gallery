class RemoveNotesAndAdmin < ActiveRecord::Migration[8.1]
  def change
    drop_table :notes do |t|
      t.string  :title
      t.text    :content
      t.references :user, foreign_key: true
      t.timestamps
    end
    remove_column :users, :admin, :boolean, default: false, null: false
  end
end
