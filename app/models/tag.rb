class Tag < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :job_tags
  has_many :jobs, through: :job_tags

  def count
    jobs.count
  end
end