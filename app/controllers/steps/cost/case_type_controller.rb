module Steps::Cost
  class CaseTypeController < Steps::CostStepController
    def edit
      super
      @form_object = CaseTypeForm.new(
        tribunal_case: current_tribunal_case,
        case_type: current_tribunal_case.case_type
      )
    end

    def update
      update_and_advance(:case_type, CaseTypeForm)
    end
  end
end