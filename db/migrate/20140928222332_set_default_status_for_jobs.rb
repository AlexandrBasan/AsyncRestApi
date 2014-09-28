class SetDefaultStatusForJobs < ActiveRecord::Migration
  def change
    change_column_default :jobs, :status, "queued"
  end
end
