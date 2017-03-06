# Asynchronous RESTful API

This is just a little Rails app for playing with asynchronous REST calls. This is useful for when a client makes API calls and the responses take longer than a normal HTTP response time.
For instance, a scenario where this could be applicable is for image processing.

Make a `post` request to the jobs resource. The job enqueues and response with a 202, poll till the job status is finished.


  $ rake test test/integration/create_jobs_test.rb
