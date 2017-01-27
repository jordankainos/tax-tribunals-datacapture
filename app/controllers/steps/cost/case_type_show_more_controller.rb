module Steps::Cost
  class CaseTypeShowMoreController < Steps::CostStepController
    def edit
      super
      @form_object = CaseTypeShowMoreForm.new(
        tribunal_case: current_tribunal_case,
        case_type: current_tribunal_case.case_type,
        case_type_other_value: current_tribunal_case.case_type_other_value
      )
    end

    def update
      update_and_advance(CaseTypeShowMoreForm, as: :case_type)
    end
  end
end
