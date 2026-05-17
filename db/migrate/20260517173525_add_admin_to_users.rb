class AddAdminToUsers < ActiveRecord::Migration[8.1]
  def up
    add_column :users, :admin, :boolean, default: false, null: false
    # Any user that already exists at the moment we deploy this is the site
    # operator (this is a single-admin app), so promote them.
    User.update_all(admin: true)
  end

  def down
    remove_column :users, :admin
  end
end
