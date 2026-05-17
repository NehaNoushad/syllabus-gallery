class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.string :kind
      t.text :excerpt
      t.text :body
      t.datetime :published_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :articles, :slug, unique: true
    add_index :articles, :published_at
  end
end
