class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_email, :string
  end
end
