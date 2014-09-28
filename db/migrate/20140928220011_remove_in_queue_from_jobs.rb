class RemoveInQueueFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :in_queue, :boolean
  end
end
