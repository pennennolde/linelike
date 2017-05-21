class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.integer	:talkroom_id
      t.integer	:send_id
      t.integer	:receive_id
      t.text	:message
      t.boolean	:read
      t.date	:date
      t.time    :time

      t.timestamps null: false
    end
  end
end
