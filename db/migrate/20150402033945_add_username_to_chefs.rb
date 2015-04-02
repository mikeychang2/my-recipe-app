class AddUsernameToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :username, :string
  end
end
