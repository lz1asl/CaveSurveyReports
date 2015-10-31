class AddMessageToError < ActiveRecord::Migration
  def change
    add_column :error_reports, :message, :string
  end
end
