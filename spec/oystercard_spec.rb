require 'oystercard'
describe Oystercard do
context 'when initialized' do
  it 'has a balance of zero' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it 'tops up the card' do
    random_number = rand
    subject.top_up(random_number)
    expect(subject.balance).to eq random_number
  end
  # it 'should also add more money' do
  #   subject.top_up(90)
  #   expect(subject.balance).to eq 90
  #
  # end

end


end
