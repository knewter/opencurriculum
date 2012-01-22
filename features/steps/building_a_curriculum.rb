class BuildingACurriculum < Spinach::FeatureSteps
  feature 'Building a Curriculum'

  Given 'there are some root and non-root curricula' do
    @root_curriculum = Factory(:curriculum, name: 'root')
    Factory(:curriculum, name: 'sub', parent_id: @root_curriculum.id)
  end

  When 'I am on the curricula index' do
    visit curricula_path
  end

  Then 'I should see only root-level curricula' do
    page.must_have_content 'root'
    page.wont_have_content 'sub'
  end

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
    @args = Factory.build(:curriculum, name: 'Test Curriculum', content: '*foo*')
    page.driver.follow :post, curricula_path, curriculum: @args.attributes
  end

  Then 'I should see the curriculum' do
    within '.curriculum-module' do
      page.must_have_content 'Test Curriculum'
      within 'em' do
        page.must_have_content 'foo'
      end
    end
  end

  Given 'a curriculum exists' do
    @curriculum = Factory(:curriculum, name: 'Test Curriculum', content: '*foo*')
  end

  When 'I am on the curriculum\'s page' do
    visit curriculum_path(@curriculum)
  end

  Then 'I should see a link to create a sub-curriculum' do
    page.must_have_link 'New Sub-Curriculum'
  end

  When 'I create a new sub-curriculum' do
    click_link 'New Sub-Curriculum'
    fill_in 'Name', with: 'Sub-Curriculum'
    click_button 'Create Curriculum'
  end

  Then 'I should see the sub-curriculum' do
    within '.curriculum-module' do
      page.must_have_content 'Sub-Curriculum'
      page.must_have_content 'parent: Test Curriculum'
    end
  end

  When 'I click the edit link' do
    find("a[rel='edit-curriculum']").click
  end
end
