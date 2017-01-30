module Steps::Appeal
  class DisputeTypeForm < BaseForm
    attribute :dispute_type, String

    validates_inclusion_of :dispute_type, in: proc { |record| record.choices }

    def choices
      case tribunal_case&.case_type
      when CaseType::INFORMATION_NOTICE
        [
          DisputeType::PENALTY,
          DisputeType::INFORMATION_NOTICE
        ]
      when CaseType::INCOME_TAX
        [
          DisputeType::PENALTY,
          DisputeType::AMOUNT_OF_TAX,
          DisputeType::AMOUNT_AND_PENALTY,
          DisputeType::PAYE_CODING_NOTICE,
          DisputeType::OTHER
        ]
      else
        [
          DisputeType::PENALTY,
          DisputeType::AMOUNT_OF_TAX,
          DisputeType::AMOUNT_AND_PENALTY,
          DisputeType::OTHER
        ]
      end.map(&:to_s)
    end

    private

    def dispute_type_value
      DisputeType.new(dispute_type)
    end

    def changed?
      tribunal_case.dispute_type != dispute_type_value
    end

    def persist!
      raise 'No TribunalCase given' unless tribunal_case
      return true unless changed?

      tribunal_case.update(
        dispute_type: dispute_type_value,
        # The following are dependent attributes that need to be reset
        penalty_level: nil,
        penalty_amount: nil,
        tax_amount: nil
      )
    end
  end
end