class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :description
      t.text :email
      t.integer :age
      t.belongs_to :gossip, index: true
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
