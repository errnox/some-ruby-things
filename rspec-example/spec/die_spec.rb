ROLLABLE = false

describe "Die" do
  before(:each) do
    @die = double('die')
    @die.stub(:roll).and_return(1, 2, 3)
    @die.should_receive(:glance).with('hope')
    @die.should_not_receive(:glance).with('fear')
  end

  describe "#roll", :if => ROLLABLE do
    it "should return 1, 2, 3 in this order" do
      expect(@die.roll).to be == 1
      expect(@die.roll).to be == 2
      expect(@die.roll).to be == 3

      @die.send(:glance, 'hope')
      @die.send(:glance, 'nonsense')
    end
  end
end
