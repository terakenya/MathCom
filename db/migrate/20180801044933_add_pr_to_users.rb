class AddPrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pr, :text
  end
end
