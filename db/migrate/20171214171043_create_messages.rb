class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.text :text
      t.boolean :message_displayed
      t.integer :user_receiver_id
      t.date :data_displayed

      t.timestamps
    end
  end
end
