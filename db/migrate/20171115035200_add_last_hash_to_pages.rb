class AddLastHashToPages < ActiveRecord::Migration
  def change
    add_column :pages, :last_hash, :string
  end
end
