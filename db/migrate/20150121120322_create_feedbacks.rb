class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :product, index: true
      t.text :comment

      t.timestamps
    end
  end
end
