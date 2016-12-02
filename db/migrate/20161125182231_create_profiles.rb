class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :lastname
      t.string :subnick
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
