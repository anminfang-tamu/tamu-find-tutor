class RemoveColumnFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :email
  end
end
