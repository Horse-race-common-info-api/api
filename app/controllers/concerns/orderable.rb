module Orderable
  extend ActiveSupport::Concern

  def sort_order
    return '' unless params[:sort]

    params[:sort].split(',').map do |v|
      "#{sort_column(v)} #{sort_direction(v)}"
    end.join(',')
  end

  private

  def sort_direction(str)
    str.start_with?('-') ? 'desc' : 'asc'
  end

  def sort_column(str)
    str.delete_prefix('-')
  end
end
