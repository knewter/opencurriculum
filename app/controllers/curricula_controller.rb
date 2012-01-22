class CurriculaController < InheritedResources::Base
  def new
    build_resource
    @curriculum.parent_id = params[:parent_id]
  end

  protected
  def collection
    @curricula ||= end_of_association_chain.decorate
  end

  def resource
    @curriculum ||= super.decorate
  end
end
