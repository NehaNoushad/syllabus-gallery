class AddAdminToUsersAgain < ActiveRecord::Migration[8.1]
  def up
    add_column :users, :admin, :boolean, default: false, null: false
    # Any user already in the DB at deploy time is the site operator.
    User.update_all(admin: true)
  end

  def down
    remove_column :users, :admin
  end
end
