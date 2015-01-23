class AddH1TextToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :h1_text, :string
  end
end
