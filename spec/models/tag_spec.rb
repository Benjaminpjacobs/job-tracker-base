require 'rails_helper'

describe Tag do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name)}
    it { should have_many(:job_tags)}
    it { should have_many(:jobs).through(:job_tags)}
  end

  describe "count" do
    it "can count its jobs" do
      tag = create(:tag_with_jobs, job_count: 3)
      
      expect(tag.count).to eq(3)
    end
  end
end
