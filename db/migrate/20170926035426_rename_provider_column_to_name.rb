class RenameProviderColumnToName < ActiveRecord::Migration
  def change
    rename_column :users, :provider, :name
  end
end
