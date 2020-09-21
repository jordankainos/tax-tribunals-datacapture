Given("that I'm on the home page and wants to give feedback") do
  home_page.load_page
end

Then("there should be a smart survey link at the top of the home page") do
  expect(home_page).to have_link('Report a problem', href: 'https://www.smartsurvey.co.uk/s/ETFBS20/')
end


Given("that I'm on the taxpayer details page and wants to give feedback") do
  home_page.load_page
  expect(home_page).to have_current_path('/')
  home_page.appeal
  expect(appeal_page).to have_current_path('/appeal')
  appeal_page.continue
  expect(appeal_case_type_page).to have_current_path('/steps/appeal/case_type')
  appeal_case_type_page.submit_income_tax
  expect(challenge_decision_page).to have_current_path('/steps/challenge/decision')
  challenge_decision_page.submit_yes
  expect(challenge_decision_status_page).to have_current_path('/steps/challenge/decision_status')
  challenge_decision_status_page.submit_review_conclusion_letter_option
  expect(page).to have_current_path('/steps/appeal/dispute_type')
  page.choose('Penalty or surcharge for example late payment, inaccurate returns or failure to notify tax liability')
  page.continue
  expect(page).to have_current_path('/steps/appeal/penalty_amount')
  page.choose('£100 or less')
  page.continue
  expect(page).to have_current_path('/steps/lateness/in_time')
  page.choose('Yes, I am in time')
  page.continue
  expect(page).to have_current_path('/steps/details/user_type')
  page.choose('Yes')
  page.continue
  expect(page).to have_current_path('/steps/details/taxpayer_type')
  page.choose('Individual')
  page.continue
  expect(taxpayer_details_page).to have_current_path('/steps/details/taxpayer_details')
end

Then("there should be a smart survey link at the top of the taxpayer details page") do
  expect(challenge_decision_page).to have_link('Report a problem', href: 'https://www.smartsurvey.co.uk/s/ETFBS20/')
end


Given("that I'm on the dispute type page and wants to give feedback") do
  home_page.load_page
  expect(home_page).to have_current_path('/')
  home_page.appeal
  expect(appeal_page).to have_current_path('/appeal')
  appeal_page.continue
  expect(appeal_case_type_page).to have_current_path('/steps/appeal/case_type')
  appeal_case_type_page.submit_income_tax
  expect(challenge_decision_page).to have_current_path('/steps/challenge/decision')
  challenge_decision_page.submit_yes
  expect(challenge_decision_status_page).to have_current_path('/steps/challenge/decision_status')
  challenge_decision_status_page.submit_review_conclusion_letter_option
  expect(page).to have_current_path('/steps/appeal/dispute_type')
end

Then("there should be a smart survey link at the top of the dispute type page") do
  expect(page).to have_link('Report a problem', href: 'https://www.smartsurvey.co.uk/s/ETFBS20/')
end