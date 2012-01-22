class BuildingACurriculum < Spinach::FeatureSteps
  feature 'Building a Curriculum'
  When 'I am on the new curriculum page' do
    visit new_curriculum_path
  end

  Then 'I should see a form' do
    within '.curriculum-form' do
      page.must_have_selector 'input[id=curriculum_name]'
      page.must_have_selector 'textarea[id=curriculum_content]'
    end
  end

  When 'I submit a curriculum' do
    @args = Factory.build(:curriculum)
    page.driver.follow :post, curricula_path, curriculum: @args.attributes
  end

  Then 'I should see the curriculum' do
    within '.curriculum-module' do
      page.must_have_content @args[:name]
    end
  end
end
