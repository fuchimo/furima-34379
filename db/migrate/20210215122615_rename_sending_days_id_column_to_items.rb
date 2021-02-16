class RenameSendingDaysIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sending_days_id, :sending_day_id
  end
end
