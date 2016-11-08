class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :subreddit
      t.string :sub_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
