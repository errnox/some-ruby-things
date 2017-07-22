SPACE_TRAVEL = false

require 'rspec'

require_relative '../calculator'


# Tell RSpec to only accept the new `expect' syntax and to neglect the old
# `should' syntax.
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end


describe Calculator do
  before(:each) do
    @calculator = Calculator.new
  end

  it "should be a `Calculator' object" do
    expect(@calculator).to be_an_instance_of Calculator
    expect(@calculator).to be_a_kind_of Calculator
  end

  describe "#add" do
    it "should return 7 when summing 3 and 4" do
      expect(@calculator.sum(3, 4)).to eq(7)
    end
    it "should return 7 when summing the string\ \"3\" and the\
 string \"4\"" do
      expect(@calculator.sum("3", "4")).to eq(7)
    end
  end

  describe "#mul" do
    it "should return 12 when multiplying 3 and 4" do
      expect(@calculator.mul(3, 4)).to eq(12)
    end
    it "should return 12 when multiplying the string \"3\" and \"4\"" do
      expect(@calculator.mul("3", "4")).to eq(12)
    end
  end

  describe "#big_number" do
    it "should be greater than 100 no matter which number it is handed" do
      expect(@calculator.big_number(3)).to be >= 100
      expect(@calculator.big_number(-3)).to be >= 100
      expect(@calculator.big_number('3')).to be >= 100
    end
  end

  describe "#version" do
    it "should return a string describing the version number" do
      expect(@calculator.version).to match(/.*version.*/)
    end
  end

  describe "#space_travel" do
    pending("as soon as space travelling is cheaper",
            :if => SPACE_TRAVEL )do
      expect(@calculator.space_travel).to be == true
    end
  end

  # Note: This is a bad example since it moves state checking from the
  # calculator object to the Rspec test. The purpose is to illustrate the
  # use of contexts.
  describe "#change_color" do
    context "if the calculator is customizable" do
      it "should change the color" do
        if @calculator.customizable
          new_color = 'red'
          @calculator.change_color new_color
          expect(@calculator.color).to be == new_color
        end
      end
    end
    context "if the calculator is not customizable" do
      it "should not change the color" do
        if !@calculator.customizable
          new_color = 'red'
          original_color = @calculator.color
          @calculator.customizable = false
          @calculator.change_color new_color
          expect(@calculator.color).to be == old_color
        end
      end
    end
  end

  describe "shared example", :shared => :example do
  end

  describe "around hook test" do
    around(:each) do |example|
      example.run
    end

    it "should be wrapped with an around hook" do
    end
  end

  describe "do not use a custom `Calculator' instance" do
    it "work just like a custom `Calculator' instance" do
      expect(subject.sum(7, 8)).to be == 15
    end
  end

  class MiniCalculator
  end

  describe MiniCalculator do
    subject{[1, 2, 3]}
    it "should have the following array: [1, 2, 3]" do
      expect(subject).to be == [1, 2, 3]
    end
  end

  describe "using metadata in a `descibe' block", :meta => "metadata" do
    it "should be availbable in its inner `it' blocks", :data => 'DATA' do
      expect(example.metadata[:meta]).to be == 'metadata'
      expect(example.metadata[:data]).to be == 'DATA'
    end
  end

  describe "using metadata in an `it' block" do
    it "should be made availbable in the block itself", :meta =>
      "metadata" do
      expect(example.metadata[:meta]).to be == 'metadata'
    end
  end

  describe "using metadata in a `desscribe' block", :meta =>
    "metadata"  do
    it "should be overridable in an `it' block", :meta => "new data" do
      expect(example.metadata[:meta]).to be == 'new data'
    end
  end

  describe "auto-generating docstrings" do
    specify { expect(3).to be == 3 }
    specify { expect(4).to equal(4) }
    specify { expect('string').to match(/.*i.*/) }
  end
end
