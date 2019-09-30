shared_examples "subable" do
  it { is_expected.to have_many(:subs) }
end