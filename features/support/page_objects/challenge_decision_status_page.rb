class ChallengeDecisionStatusPage < BasePage
  set_url '/steps/challenge/decision_status'

  section :content, '#content' do
    element :header, 'h1', text: 'What response did you receive?'
    element :save_and_come_back, 'a', text: 'Save and come back later'
    element :review_conclusion_letter_option, '.multiple-choice', text: 'What response did you receive?'
  end

  def save_and_come_back
    content.save_and_come_back.click
  end

  def submit_review_conclusion_letter_option
    content.review_conclusion_letter_option.click
    continue
  end

end
