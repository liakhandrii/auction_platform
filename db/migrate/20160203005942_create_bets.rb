class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :lot_id
      t.string :user_id
      t.integer :confirmed_bet, default: 50

      t.timestamps null: false
    end
  end
end
