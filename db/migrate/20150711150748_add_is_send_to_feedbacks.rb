class AddIsSendToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :is_send, :boolean, defaut: false
  end
end
