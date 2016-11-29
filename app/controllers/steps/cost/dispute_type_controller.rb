module Steps::Cost
  class DisputeTypeController < Steps::CostStepController
    def edit
      super
      @form_object = DisputeTypeForm.new(
        tribunal_case: current_tribunal_case,
        dispute_type: current_tribunal_case.dispute_type
      )
    end

    def update
      update_and_advance(:dispute_type, DisputeTypeForm)
    end
  end
end