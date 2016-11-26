class RemoveUsernameAndLastnameFromProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :username
    remove_column :profiles, :lastname
  end
end
