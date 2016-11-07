class RemoveTypeFromSubscriptions < ActiveRecord::Migration[5.0]
  def change
    remove_column :subscriptions, :type
  end
end
