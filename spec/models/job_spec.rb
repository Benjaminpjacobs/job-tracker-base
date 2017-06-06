require 'rails_helper'

describe Job do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:level_of_interest) }
    it { should validate_presence_of(:city) }
    it { should belong_to(:company) }
    it { should have_many(:job_tags) }
    it { should have_many(:tags).through(:job_tags) }
  end
end
