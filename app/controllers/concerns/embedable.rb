module Embedable
  extend ActiveSupport::Concern

  def embed_models
    return [] unless params[:embed]

    params[:embed].split(',')
  end
end
