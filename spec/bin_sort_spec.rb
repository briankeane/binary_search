require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../bsearch.rb'
require_relative '../bin_sort.rb'

describe "ArrayUtil" do
  describe "bin_sort" do
    it "should return false for empty arrays" do
      expect(BinSort::bin_include([], nil)).to eq([nil, nil])
    end

    it "should return true for arrays with 1 element equal to input" do
      expect(BinSort::bin_include([1], 1)).to eq([1, 0])
    end

    it "can find multiple entries" do
      word_array = ["bin", "bob", "bill", "bobby", "billy", "bindy", "rachel", "sue", "apple"]
      expect(BinSort::find_matches(word_array, "bi")).to eq(["bill", "billy", "bin", "bindy"])
    end

    it "should return true for an array that has the element in it" do
      expect(BinSort::bin_include([2, 5, 8, 10], 5)[0]).to eq(5)
      expect(BinSort::bin_include([-10, 3, 8, 19], 5)[0]).to eq(nil)
      expect(BinSort::bin_include([2, 3, 5, 8, 10], 5)[0]).to eq(5)
      expect(BinSort::bin_include([-10, 0, 3, 8, 19], 5)[0]).to eq(nil)
    end
  end
end
