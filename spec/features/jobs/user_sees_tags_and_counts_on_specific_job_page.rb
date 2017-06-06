require 'rails_helper'

describe "As a user" do
  context "on a specific job page" do
    it "can see a tags associated with job" do
      job = create(:job_with_tags, tag_count: 2)
      company = job.company
      tag1 = job.tags.first
      tag2 = job.tags.first

      visit company_job_path(company, job)
      
      expect(page).to have_content(tag1.name)
      expect(page).to have_content(tag2.name)
    end

    it "can see a count of jobs per tags for each associated with job" do
      job = create(:job_with_tags, tag_count: 2)
      company = job.company
      tag1 = job.tags.first
      tag2 = job.tags.first
      job2 = create(:job)
      job3 = create(:job)
      job2.tags << tag1
      job2.tags << tag2
      job3.tags << tag1

      visit company_job_path(company, job)

      expect(page).to have_content("#{tag1.name}: 3")
      expect(page).to have_content("#{tag2.name}: 2")
    end
  end
end
