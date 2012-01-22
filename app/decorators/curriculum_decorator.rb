class CurriculumDecorator < ApplicationDecorator
  decorates :curriculum

  def content
    ::Redcarpet::Markdown.new(::Redcarpet::Render::HTML).render(curriculum.content).html_safe
  end

  def title
    return curriculum.name unless curriculum.parent

    return curriculum.name + " [parent: #{parent.name}]"
  end
end
