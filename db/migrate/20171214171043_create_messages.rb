class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.boolean :displayed, default: false
      t.integer :user_receiver_id
      t.datetime :date_view
      t.boolean :archive, default: false

      t.timestamps
    end
  end
end
