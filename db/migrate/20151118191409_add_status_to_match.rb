class AddStatusToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :status, :string, :default => 'enrolling'
  end
end
