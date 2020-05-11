class RenameColumn < ActiveRecord::Migration
  def change
  	change_table :contacts do |t|
      t.rename :username , :user_name
    end
  end
end
