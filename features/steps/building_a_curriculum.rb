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
    @args = Factory.build(:curriculum, name: 'Test Curriculum')
    page.driver.follow :post, curricula_path, curriculum: @args.attributes
  end

  Then 'I should see the curriculum' do
    within '.curriculum-module' do
      page.must_have_content 'Test Curriculum'
    end
  end

  Given 'a curriculum exists' do
    @curriculum = Factory(:curriculum)
  end

  When 'I am on the curriculum\'s page' do
    visit curriculum_path(@curriculum)
  end

  Then 'I should see a link to create a sub-curriculum' do
    page.must_have_link 'New Sub-Curriculum'
  end
end
