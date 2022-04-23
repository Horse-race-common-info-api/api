module FieldFilterable
  extend ActiveSupport::Concern

  def fields
    return [] unless params[:fields]

    embed_models_fields, fields =
      params[:fields].split(',').partition {|v| v.include?('.') }

    fields + embed_models_fields(embed_models_fields)
  end

  def embed_models_fields(fields)
    fields_hash = Hash.new { |hash, key| hash[key] = [] }
    fields.each do |v|
      model, column = v.split('.')
      fields_hash[model].append(column)
    end
    [fields_hash]
  end
end
