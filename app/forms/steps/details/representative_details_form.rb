module Steps::Details
  class RepresentativeDetailsForm < BaseForm
    attribute :representative_contact_address, StrippedString
    attribute :representative_contact_postcode, StrippedString
    attribute :representative_contact_city, StrippedString
    attribute :representative_contact_country, StrippedString
    attribute :representative_contact_email, NormalisedEmail
    attribute :representative_contact_phone, StrippedString

    validates_presence_of :representative_contact_address,
                          :representative_contact_postcode,
                          :representative_contact_city,
                          :representative_contact_country

    validates :representative_contact_email, email: true, if: :started_by_representative_or_present?

    private

    delegate :started_by_representative?, to: :tribunal_case

    def started_by_representative_or_present?
      started_by_representative? || representative_contact_email.present?
    end

    def persist!(additional_attributes)
      raise 'No TribunalCase given' unless tribunal_case

      tribunal_case.update({
        representative_contact_address:  representative_contact_address,
        representative_contact_postcode: representative_contact_postcode,
        representative_contact_city:     representative_contact_city,
        representative_contact_country:  representative_contact_country,
        representative_contact_email:    representative_contact_email,
        representative_contact_phone:    representative_contact_phone
      }.merge(additional_attributes))
    end
  end
end
