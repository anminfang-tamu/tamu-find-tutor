class DropTableProfile < ActiveRecord::Migration[6.0]
  def change
    drop_table :profiles
  end
end
