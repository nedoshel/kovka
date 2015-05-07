class AddCounterToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :counter, :text
  end
end
