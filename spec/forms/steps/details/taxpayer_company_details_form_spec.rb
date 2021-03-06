require 'spec_helper'

RSpec.describe Steps::Details::TaxpayerCompanyDetailsForm do
  it_behaves_like 'a contactable entity form',
    entity_type: :taxpayer,
    additional_fields: [
      :taxpayer_organisation_name,
      :taxpayer_organisation_registration_number,
      :taxpayer_organisation_fao
    ],
    optional_fields: [
      :taxpayer_organisation_registration_number
    ]

  describe '#name_fields' do
    specify { expect(subject.name_fields).to eq([:taxpayer_organisation_name]) }
  end

  describe '#show_fao?' do
    specify { expect(subject.show_fao?).to eq(true) }
  end

  describe '#show_registration_number?' do
    specify { expect(subject.show_registration_number?).to eq(true) }
  end
end
