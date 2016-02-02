class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
    	t.string :attachment
    	t.string :link
    	t.string :name
    	t.string :uid
    	t.string :description
    	t.string :faculty
    	t.datetime :timestamp
    end
  end
end
