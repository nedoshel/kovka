class AddSeoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :figure_alt, :string
    add_column :products, :meta_width, :integer
    add_column :products, :meta_height, :integer
    add_column :products, :tovname_title, :string
  end
end
