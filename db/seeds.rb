Job.delete_all
Job.create!(name: 'Check for face', algorithm: 'facial recognition', status: 'completed')
Job.create!(name: 'Make into avatar', algorithm: 'resize', status: 'queued')
Job.create!(name: 'Invert image', algorithm: 'invert', status: 'queued')
