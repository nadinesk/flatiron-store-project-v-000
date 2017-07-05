class RemoveCartIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :cart_id, :integer
  end
end
