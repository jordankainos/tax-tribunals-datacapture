module Steps::Appeal
  class MustChallengeHmrcController < Steps::AppealStepController
    def show
      raise 'No tribunal case in session' unless current_tribunal_case
    end
  end
end