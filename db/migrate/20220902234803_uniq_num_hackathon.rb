class UniqNumHackathon < ActiveRecord::Migration[6.1]
  def change
    add_column :hackathons, :uniq_id, :string, :default => rand(1...99999999)
  end
end
