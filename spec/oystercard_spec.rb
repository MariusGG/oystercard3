require 'oystercard'
describe Oystercard do
context 'when initialized' do
  it 'has a balance of zero' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

end


end
