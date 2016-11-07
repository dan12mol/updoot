class AddSubTypeToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :sub_type, :string
  end
end
