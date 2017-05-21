class RenameColumnToTalkrooms < ActiveRecord::Migration
  def change

  	rename_column :talkrooms, :request_id, :requester_id
  	rename_column :talkrooms, :accept_id, :accepter_id

  end
end
