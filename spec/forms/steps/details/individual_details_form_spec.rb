require 'spec_helper'

RSpec.describe Steps::Details::IndividualDetailsForm do
  let(:arguments) { {
    tribunal_case:             tribunal_case,
    taxpayer_individual_name:  taxpayer_individual_name,
    taxpayer_contact_address:  taxpayer_contact_address,
    taxpayer_contact_postcode: taxpayer_contact_postcode,
    taxpayer_contact_email:    taxpayer_contact_email,
    taxpayer_contact_phone:    taxpayer_contact_phone
  } }
  let(:tribunal_case) { instance_double(TribunalCase) }

  let(:taxpayer_individual_name)  { 'Jane McTaxpayer' }
  let(:taxpayer_contact_address)  { '123 New Street' }
  let(:taxpayer_contact_postcode) { 'AB1 2CD' }
  let(:taxpayer_contact_email)    { 'jane.taxpayer@aol.co.uk' }
  let(:taxpayer_contact_phone)    { '0118 999 881 999 119 7253' }

  subject { described_class.new(arguments) }

  describe '#save' do
    context 'when no tribunal_case is associated with the form' do
      let(:tribunal_case)  { nil }

      it 'raises an error' do
        expect { subject.save }.to raise_error(RuntimeError)
      end
    end

    context 'when taxpayer_individual_name is not present' do
      let(:taxpayer_individual_name) { nil }

      it 'returns false' do
        expect(subject.save).to be(false)
      end

      it 'has a validation error on the field' do
        expect(subject).to_not be_valid
        expect(subject.errors[:taxpayer_individual_name]).to_not be_empty
      end
    end

    context 'when taxpayer_contact_address is not present' do
      let(:taxpayer_contact_address) { nil }

      it 'returns false' do
        expect(subject.save).to be(false)
      end

      it 'has a validation error on the field' do
        expect(subject).to_not be_valid
        expect(subject.errors[:taxpayer_contact_address]).to_not be_empty
      end
    end

    context 'when taxpayer_contact_postcode is not present' do
      let(:taxpayer_contact_postcode) { nil }

      it 'returns false' do
        expect(subject.save).to be(false)
      end

      it 'has a validation error on the field' do
        expect(subject).to_not be_valid
        expect(subject.errors[:taxpayer_contact_postcode]).to_not be_empty
      end
    end

    context 'when taxpayer_contact_email is not present' do
      let(:taxpayer_contact_email) { nil }

      it 'returns false' do
        expect(subject.save).to be(false)
      end

      it 'has a validation error on the field' do
        expect(subject).to_not be_valid
        expect(subject.errors[:taxpayer_contact_email]).to_not be_empty
      end
    end

    context 'when taxpayer_contact_phone is not present' do
      let(:taxpayer_contact_phone) { nil }

      it 'returns false' do
        expect(subject.save).to be(false)
      end

      it 'has a validation error on the field' do
        expect(subject).to_not be_valid
        expect(subject.errors[:taxpayer_contact_phone]).to_not be_empty
      end
    end

    context 'when individual_details is valid' do
      it 'saves the record' do
        expect(tribunal_case).to receive(:update).with(
          taxpayer_individual_name:  taxpayer_individual_name,
          taxpayer_contact_address:  taxpayer_contact_address,
          taxpayer_contact_postcode: taxpayer_contact_postcode,
          taxpayer_contact_email:    taxpayer_contact_email,
          taxpayer_contact_phone:    taxpayer_contact_phone
        )
        expect(subject.save).to be(true)
      end
    end
  end
end