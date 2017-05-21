class RenameColumnToMessages < ActiveRecord::Migration
  def change

  	rename_column :messages, :send_id, :sender_id
  	rename_column :messages, :receive_id, :receiver_id

  end
end
