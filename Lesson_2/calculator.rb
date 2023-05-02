# This program: 
# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# performs the operation
# displays the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
 
def prompt(message)
    Kernel.puts("=> #{message}")
end

def valid_number?(num)
    num.to_i != 0
end

def operator_to_message(op)
    case op
    when '1'
        "Adding"
    when '2'
        "Subtracting"
    when '3'
        "Multiplying"
    when '4'
        "Dividing"
    end
end

prompt(MESSAGES['welcome'])

name = ''

loop do
    name = Kernel.gets().chomp()

    if name.empty?()
        prompt(MESSAGES'valid_name')
    else
        break
    end
end

prompt("Hi #{name}!")

loop do #main loop
    number1 = ''
    loop do
        prompt(MESSAGES['first_number'])
        number1 = Kernel.gets().chomp()

        if valid_number?(number1)
            break
        else
            prompt(MESSAGES['valid_number'])
        end
    end

    number2 = ''
    loop do
        prompt(MESSAGES['second_number'])
        number2 = Kernel.gets().chomp()

        if valid_number?(number2)
            break
        else
            prompt((MESSAGES['valid_number']))
        end
    end

    operator_prompt = <<-MSG
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
    MSG


    prompt(operator_prompt) 

    operator = ''
    loop do
        operator = Kernel.gets().chomp()
            if %w(1 2 3 4).include?(operator)
                break
            else
                prompt(MESSAGES['valid_operator'])
            end
    end

    result = case operator 
            when '1'
                number1.to_i() + number2.to_i()
            when '2'
                number1.to_i() - number2.to_i()
            when '3'
                number1.to_i() * number2.to_i()
            when '4'
                number1.to_f() / number2.to_f()
    end

prompt("#{operator_to_message(operator)} the two numbers...")

prompt("The result is #{result}!")

    prompt(MESSAGES['recalculate'])
    answer = Kernel.gets().chomp()
    break unless answer.downcase == 'y'
end

prompt(MESSAGES['goodbye'])