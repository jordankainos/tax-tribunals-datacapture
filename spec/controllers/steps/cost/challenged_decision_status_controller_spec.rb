require 'rails_helper'

RSpec.describe Steps::Cost::ChallengedDecisionStatusController, type: :controller do
  it_behaves_like 'an intermediate step controller', Steps::Cost::ChallengedDecisionStatusForm, CostDecisionTree
end