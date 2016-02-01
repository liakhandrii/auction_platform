class RemoveNotNullFromUsers < ActiveRecord::Migration
  def change
  	drop_table :users

    create_table :users do |t|
      t.string :uid, null: false
      t.string :provider
      t.string :name, null: false
      t.string :phone

      t.timestamps null: false
    end
  end
end
