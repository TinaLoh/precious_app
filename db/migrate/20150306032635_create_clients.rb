class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
        t.string :first_name
        t.string :last_name
        t.string :type
        t.string :description
        t.integer :age
        t.string :gender
        t.string :location
        t.string :guardian
        t.integer :user_id

      t.timestamps null: false
    end
  end
end
