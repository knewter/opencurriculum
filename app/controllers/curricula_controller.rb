class CurriculaController < InheritedResources::Base
  def index
    @curricula = end_of_association_chain.where(parent_id: nil).decorate
  end

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
