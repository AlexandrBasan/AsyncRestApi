Job.delete_all
Job.create!(name: 'Check for face', algorithm: 'facial recognition')
Job.create!(name: 'Make into avatar', algorithm: 'resize')
