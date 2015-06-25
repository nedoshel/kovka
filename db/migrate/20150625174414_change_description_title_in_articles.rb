class ChangeDescriptionTitleInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :description, :content
    rename_column :articles, :name, :title

  end
end
