shared_examples "likable" do
  it { is_expected.to have_many(:likes) }
end