class Curriculum < ActiveRecord::Base
  set_table_name 'curricula' # FIXME: Why is this necessary?
  acts_as_nested_set
  attr_protected :lft, :rgt, :depth
end
CurriculumDecorator # hack to make #decorate method work in dev with cache_classes
