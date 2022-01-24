require 'active_model'
require 'json'

class JsonValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless valid_json?(value)
      record.errors.add attribute, (options[:message] || "JSON is invalid" )
    end
  end

  def valid_json?(json)
    JSON.parse(json) rescue nil ? true : false
  end

end