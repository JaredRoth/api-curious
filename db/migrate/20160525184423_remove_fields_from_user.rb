class RemoveFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :email, :string
    remove_column :users, :uid, :string
  end
end
