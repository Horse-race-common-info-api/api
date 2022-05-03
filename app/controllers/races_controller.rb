class RacesController < ApplicationController
  include Orderable
  include Embedable
  include FieldFilterable

  has_scope :q

  def index
    render json: races, include: embed_models, fields: fields, status: :ok
  end

  private 

  def races
    @races ||=
      paginate(
        apply_scopes(::Race).all.includes(embed_models).order(Arel.sql(sort_order)),
        per_page: params[:per_page]
      )
  end
end
