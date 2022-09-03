class UniqNumUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uniq_id, :string, :default => rand(1...9999999999)
  end
end
