class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :link
      t.integer :visits

      t.timestamps
    end
    add_index :urls, :link
    add_index :urls, :original
  end
end
