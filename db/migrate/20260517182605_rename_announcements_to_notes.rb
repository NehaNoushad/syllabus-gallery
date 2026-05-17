class RenameAnnouncementsToNotes < ActiveRecord::Migration[8.1]
  def change
    rename_table :announcements, :notes
  end
end
