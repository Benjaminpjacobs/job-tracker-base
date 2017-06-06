require 'rails_helper'

describe Tag do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name)}
    it { should have_many(:job_tags)}
    it { should have_many(:jobs).through(:job_tags)}
  end
end
