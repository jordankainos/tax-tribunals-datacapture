require 'rails_helper'

RSpec.describe Steps::Hardship::HardshipReviewStatusController, type: :controller do
  it_behaves_like 'an intermediate step controller', Steps::Hardship::HardshipReviewStatusForm, TaxTribs::HardshipDecisionTree
end
