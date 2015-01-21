class AddSeoToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :image, :string
    add_column :categories, :seo_title, :string
    add_column :categories, :seo_description, :string
    add_column :categories, :seo_keywords, :string
    add_column :categories, :category_spec, :string
    add_column :categories, :header_addit, :text
    add_column :categories, :firm_purpose, :string
    add_column :categories, :footer_text, :string
  end
end
