class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :hackthon_id, :hackathon_id
  end
end
