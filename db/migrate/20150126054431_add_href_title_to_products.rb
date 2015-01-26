class AddHrefTitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :href_title, :string
  end
end
