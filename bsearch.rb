require 'rubygems'
require 'pry-debugger'
require_relative 'bin_sort.rb'

module ArrayUtil
  def self.bsearch(array, element)
    # If the array is empty return a result
    if array.size == 0
      return false
    end
    # Otherwise call your helper _bsearch method
    result = BinSort::bin_include(array, element)
    if result == nil then return false end
    if result[0] == nil
      return false
    else
      return true
    end
  end

  def self._bsearch(array, element, start_index, end_index)
    # If the start and end indeces are the same, search
    # that element and return
    #
    # Otherwise, find the midpoint
    #   midpoint = start_index + (end_index - start_index) / 2
    #
    # If the element is greater than the one at midpoint, call
    #   _bsearch on the right half of the remaining array
    # Otherwise, call _bsearch on left half of the remaining array
  end

  def self.bin_include(array, target, sorted=false)

    # if this is the top level, sort and attach indexes
    if sorted == false

      if array.size == 0
        return [nil,nil]
      end

      array.sort!
      array = array.each_with_index.map { |x, i| [x,i] }
    end
    # if we're down to 1 number
    if array.size == 1
      if (array[0][0] == target)
        return [target, 0]
      else
        return [nil,0]
      end
    # if we're down to 2 numbers...
    elsif array.size < 3
      if (array[0][0] == target)
        return array[0]
      elsif (array[1][0] == target)
        return array[1]

      # return nil + the positions it should be at
      elsif (array[0][0] > target)
        return [nil, (array[0][1] - 1)]
      elsif (array[0][0] < target) && (array[1][0] > target)
        return [nil, array[1][1]]
      elsif (array[1][0] < target)
        return [nil, (array[1][1] + 1)]
      end
    end

    # if not, split the array unless we got lucky
    if target > array[(array.length/2)][0]
      return bin_include(array[(array.length/2)..-1], target, true)
    elsif target < array[(array.length/2)][0]
      return bin_include(array[0..(array.length/2)], target, true)
    elsif target == array[(array.length/2)][0]
      return array[(array.length/2)]
    end
  end

  def self.find_matches(array, target, sorted=false)

    array.sort!

    #get the starting position
    result = self.bin_include(array, target)

    # set the counter and empty array for results
    counter = result[1]
    results_array = []

    #collect all matches
    while array[counter].match(/^#{target}/)
      results_array << array[counter]
      counter += 1
    end

    return results_array
  end

end
