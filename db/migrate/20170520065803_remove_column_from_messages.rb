class RemoveColumnFromMessages < ActiveRecord::Migration
  def change

  	  	def up
    	remove_column :messages, :date
    	remove_column :messages, :time
    end

  	def down
    	add_column :messages, :date, :date
    	add_column :messages, :time, :time
  	end

  end
end
