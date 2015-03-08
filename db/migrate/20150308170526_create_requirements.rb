class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :step
      t.belongs_to :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :requirements, :clients
  end
end
