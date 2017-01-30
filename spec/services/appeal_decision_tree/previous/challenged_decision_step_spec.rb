require 'spec_helper'

RSpec.describe AppealDecisionTree, '#previous' do
  let(:tribunal_case) { double('TribunalCase') }
  let(:step_params)   { double('Step') }
  let(:next_step)     { nil }
  subject { described_class.new(tribunal_case: tribunal_case, step_params: step_params, next_step: next_step) }

  context 'when the step is `challenged_decision`' do
    let(:step_params) { { challenged_decision: 'anything' } }

    it { is_expected.to have_previous(:start, :show) }
  end
end