#START

# Given a collection of integers called "numbers"

#SET iterator = 1
#SET saved_number = value within numbers collection at space 1

#WHILE iterator <= length of numbers
  #SET current_number = value within numbers collection at space "iterator"
  #IF saved_number >= current_number
    #go to the next iteration
  #ELSE
    #saved_number = current_number

  #iterator = iterator + 1

#PRINT saved_number

#END

def find_greatest(numbers)
    saved_number = numbers[0]
  
    numbers.each do |num|
      if saved_number >= num
        next
      else
        saved_number = num
      end
    end
  
    saved_number
  end

  # a method that determines the index of the 3rd occurrence of a given character in a string. 
  # For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). 
  # If the given character does not occur at least 3 times, return nil.
  
  #START
