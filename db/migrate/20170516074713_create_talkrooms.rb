class CreateTalkrooms < ActiveRecord::Migration
  def change
    create_table :talkrooms do |t|

      t.integer	:request_id
      t.integer	:accept_id
      t.boolean	:accepted

      t.timestamps null: false
    end
  end
end
