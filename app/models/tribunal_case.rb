class TribunalCase < ApplicationRecord
  has_value_object :intent

  # Appeal task
  has_value_object :challenged_decision
  has_value_object :challenged_decision_status
  has_value_object :case_type, constructor: :find_constant
  has_value_object :dispute_type
  has_value_object :penalty_level

  # Hardship task
  has_value_object :disputed_tax_paid
  has_value_object :hardship_review_requested
  has_value_object :hardship_review_status

  # Lateness task
  has_value_object :in_time

  # Details task
  has_value_object :user_type
  has_value_object :has_representative
  has_value_object :representative_is_legal_professional
  has_value_object :taxpayer_type, class_name: 'ContactableEntityType'
  has_value_object :representative_type, class_name: 'ContactableEntityType'

  # Closure task
  has_value_object :closure_case_type

  def mapping_code
    MappingCodeDeterminer.new(self).mapping_code
  end

  def documents(filter: default_documents_filter)
    Document.for_collection(files_collection_ref, filter: filter)
  end

  def default_documents_filter
    [grounds_for_appeal_file_name]
  end

  def taxpayer_is_organisation?
    taxpayer_type.organisation?
  end

  def representative_is_organisation?
    representative_type.organisation?
  end

  def appeal_or_application
    return :application if intent.eql?(Intent::CLOSE_ENQUIRY)
    return :appeal      unless case_type

    case_type.appeal_or_application
  end
end
