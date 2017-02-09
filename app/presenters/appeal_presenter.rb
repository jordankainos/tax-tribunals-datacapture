class AppealPresenter < SimpleDelegator

  # Initialise with a TribunalCase instance and any method not
  # defined in this class will be forwarded automatically to that instance.
  #
  #   details = AppealPresenter.new(tribunal_case_instance)
  #
  #   details.taxpayer -> this class method
  #   details.case_reference -> tribunal_case_instance method
  #   details.foobar -> NoMethodError

  def taxpayer
    @taxpayer ||= TaxpayerDetailsPresenter.new(tribunal_case)
  end

  def representative
    @representative ||= RepresentativeDetailsPresenter.new(tribunal_case)
  end

  def documents
    @documents ||= DocumentsSubmittedPresenter.new(tribunal_case)
  end

  def appeal_type_answers
    @appeal_type_answers ||= AppealTypeAnswersPresenter.new(tribunal_case)
  end

  def appeal_lateness_answers
    @appeal_lateness_answers ||= AppealLatenessAnswersPresenter.new(tribunal_case)
  end

  private

  def tribunal_case
    __getobj__
  end
end