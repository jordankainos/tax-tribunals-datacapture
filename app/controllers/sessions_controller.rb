class SessionsController < ApplicationController
  def create_and_fill_appeal
    raise 'For development use only' unless Rails.env.development?
    # :nocov:
    tribunal_case.update(case_type: CaseType::OTHER, challenged_decision: ChallengedDecision::YES)
    redirect_to task_list_path
    # :nocov:
  end

  def create_and_fill_appeal_and_lateness
    raise 'For development use only' unless Rails.env.development?
    # :nocov:
    tribunal_case.update(in_time: InTime::YES)
    create_and_fill_appeal
    # :nocov:
  end

  # although this is linked from the 'setup everything' developer tools button,
  # it does not upload any documents. So, if you need real documents for the
  # case, you need to use the 'Change' link on the 'Check your answers' page
  # and add some.
  def create_and_fill_appeal_and_lateness_and_appellant
    raise 'For development use only' unless Rails.env.development?
    # :nocov:
    tribunal_case.update(
      case_type: CaseType::OTHER,
      challenged_decision: ChallengedDecision::YES,
      in_time: InTime::YES,
      taxpayer_contact_phone: Faker::PhoneNumber.phone_number,
      taxpayer_contact_email: Faker::Internet.email,
      taxpayer_contact_postcode: Faker::Address.postcode,
      taxpayer_individual_first_name: Faker::Name.first_name,
      taxpayer_individual_last_name: Faker::Name.last_name,
      taxpayer_contact_address: [
        Faker::Address.street_address,
        Faker::Address.city,
        Faker::Address.county
      ].join("\n")
    )

    redirect_to steps_details_check_answers_path
    # :nocov:
  end

  def destroy
    reset_session
    redirect_to task_list_path
  end

  private

  # :nocov:
  def tribunal_case
    @tribunal_case ||= TribunalCase.find_by_id(session[:tribunal_case_id]) || TribunalCase.create.tap do |tribunal_case|
      session[:tribunal_case_id] = tribunal_case.id
    end
  end
  # :nocov:
end
