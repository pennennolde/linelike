class AddOptionsToUsers < ActiveRecord::Migration
  def change

  	change_column_null :users, :name, false

  	change_column_default :users, :notice, 0
  	change_column_default :users, :request, 0

  end
end
