class AddStatusToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :status, :string, :default => 'enrolling'
    add_column :matches, :round_num, :integer, :default => 0
    add_column :matches, :next_round_time, :datetime
  end
end
