class CreateParticularities < ActiveRecord::Migration
  def change
    create_table :particularities do |t|
      t.string :note
      t.belongs_to :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :particularities, :clients
  end
end
