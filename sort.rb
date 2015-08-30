require 'byebug'

def bubble_sort(array, block)
  array.length.times do
    array.each_with_index do |element, index|
      next_element = array[index + 1]
      result = block.call(element, next_element) if !next_element.nil?
      if result == 1
        array[index + 1] = element
        array[index] = next_element
      end

    end

  end

  array
end

def your_sort(array, &block)
  normalized_block = block || Proc.new{|a, b| a <=> b}
  bubble_sort(array, normalized_block)
end
