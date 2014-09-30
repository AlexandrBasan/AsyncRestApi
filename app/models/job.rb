class Job < ActiveRecord::Base
  validates :name, presence: true
  validates :algorithm, presence: true
end
