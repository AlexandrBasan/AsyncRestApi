class AddInQueueToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :in_queue, :boolean
  end
end
