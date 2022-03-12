class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :display_name
      t.string :gender
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
