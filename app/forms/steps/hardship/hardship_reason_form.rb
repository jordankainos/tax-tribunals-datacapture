module Steps::Hardship
  class HardshipReasonForm < BaseForm
    attribute :hardship_reason, String
    attribute :hardship_reason_document, DocumentUpload

    validates_length_of :hardship_reason, minimum: 5, if: :requires_hardship_reason_text?
    validates_presence_of :hardship_reason_document, if: :requires_hardship_reason_document?
    validate :valid_uploaded_file

    private

    def persist!
      raise 'No TribunalCase given' unless tribunal_case
      upload_document_if_present && tribunal_case.update(
        hardship_reason: hardship_reason,
        hardship_reason_file_name: file_name
      )
    end

    def valid_uploaded_file
      return true if hardship_reason_document.nil? || hardship_reason_document.valid?
      retrieve_document_errors
    end

    def requires_hardship_reason_text?
      tribunal_case&.hardship_reason_file_name.blank? && hardship_reason_document.blank?
    end

    def requires_hardship_reason_document?
      hardship_reason.blank? && requires_hardship_reason_text?
    end

    def upload_document_if_present
      return true if hardship_reason_document.nil?

      hardship_reason_document.upload!(document_key: :hardship_reason, collection_ref: tribunal_case.files_collection_ref)
      retrieve_document_errors

      errors.empty?
    end

    def retrieve_document_errors
      hardship_reason_document.errors.each do |error|
        errors.add(:hardship_reason_document, error)
      end
    end

    # If there is a file upload, store the name of the file, otherwise, retrieve any previously
    # uploaded file name from the tribunal_case object (or none if nil).
    def file_name
      hardship_reason_document&.file_name || tribunal_case&.hardship_reason_file_name
    end
  end
end
