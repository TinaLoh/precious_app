class RemoveTypeFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :type, :string
  end
end
