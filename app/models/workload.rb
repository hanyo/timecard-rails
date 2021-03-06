class Workload < ActiveRecord::Base
  scope :complete, -> { where("end_at is not ?", nil) }

  belongs_to :issue
  belongs_to :user

  validates :start_at, presence: true

  def self.running?
    exists?(["start_at is not ? and end_at is ?", nil, nil])
  end
end
