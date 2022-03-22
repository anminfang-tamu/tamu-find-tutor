class AddColumnsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :tutor_area, :string
    add_column :posts, :schedule, :string
    add_column :posts, :description, :string
    add_column :posts, :price, :decimal, :precision => 8, :scale => 2
  end
end
