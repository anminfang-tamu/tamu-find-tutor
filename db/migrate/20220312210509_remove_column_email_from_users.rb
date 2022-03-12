class RemoveColumnEmailFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :email
    add_column :profiles, :email, :string
  end
end
