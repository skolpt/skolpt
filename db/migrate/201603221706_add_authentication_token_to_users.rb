class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :athletes, :authentication_token, :string
    add_index :athletes, :authentication_token
  end
end