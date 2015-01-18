class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true
      t.string :article
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
