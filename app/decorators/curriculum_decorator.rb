class CurriculumDecorator < ApplicationDecorator
  decorates :curriculum

  def title
    return curriculum.name unless curriculum.parent

    return curriculum.name + " [parent: #{parent.name}]"
  end
end
