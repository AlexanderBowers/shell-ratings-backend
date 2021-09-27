class CreateShells < ActiveRecord::Migration[6.1]
  def change
    create_table :shells do |t|
      t.string :name
      t.string :image
      t.integer :score

      t.timestamps
    end
  end
end
