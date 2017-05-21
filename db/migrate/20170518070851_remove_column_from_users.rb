class RemoveColumnFromUsers < ActiveRecord::Migration
  def change

  	def up
    	remove_column :users, :notice
    	remove_column :users, :request
    end

  	def down
    	add_column :users, :notice, :integer
    	add_column :users, :request, :integer
  	end

  end
end
