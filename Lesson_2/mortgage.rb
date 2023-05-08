# Info to grab:
    # Loan Amount
    # APR - Annual Percentafe Rate
    # Loan Duration

# Need to calculate:
    # Monthly intetrest rate
    # Loan duration in months
    # Monthly payment

# Formula:
    # m = p * (j / (1 - (1 + j)**(-n)))
    # Key:
        # m = monthly_payment
        # p = loan_amount
        # j = monthly_interest_rate
        # n = loan_duration_in_months

# Step 1: Welcome + Greeting (Grab user's name)
# Step 2: Prompt + grab the interest rate (convert the annual interst rate into the monthly interest rate as adecimal -- 5% = 0.05)
# Step 3: Prompt + grab the laon duration amount in months
# Step 4: Plug variables into formula 
# Step 5: Display Result - Your monthly payment is  ___ for ___ number of months at a __% intrets rate
# Step 6: sk if they want to calculate again, if not, break the loop.

def prompt(message)
    puts("=> #{message}")
end

def valid_loan_amount?(loan_amount)
    loan_amount.to_i != 0  
end

def valid_loan_duration?(loan_duration_in_months)
    loan_duration_in_months.to_i != 0
end

def valid_annual_percentage_rate?(annual_percentage_rate)
    annual_percentage_rate.to_f != 0
end


prompt("Welcome to the Mortgage Calculator! Please enter your name:")

name = gets.chomp
loan_amount = ''
prompt("Hi #{name}! What is your loan amount?")
    loop do

        loan_amount = gets.chomp.to_f
        
        if valid_loan_amount?(loan_amount)
            prompt("Your loan amount total is $#{loan_amount.to_f}")
            break
        else
            prompt("Please enter a valid loan amount")
        end
    end

loan_duration_in_months = ''
prompt("What is the duration of your loan? Please enter the total number of months:")
    loop do
       
        loan_duration_in_months = gets.chomp.to_i

        if valid_loan_duration?(loan_duration_in_months)
            prompt("Your loan term is #{loan_duration_in_months} months.")
            break
        else
            prompt("Loan term must be greater than 0. Please enter a valid loan duration.")
        end
    end

annual_percentage_rate = ''
prompt("Please enter your desired APR:")
    loop do
    
        annual_percentage_rate = gets.chomp.to_f
        
        if valid_annual_percentage_rate?(annual_percentage_rate)
            prompt("You have selected a #{annual_percentage_rate}% APR")
            break
        else
            prompt("Please enter a valid APR amount.")
        end
    end

    # agreement_prompt = <<-MSG
    # You have selected the following:
    # 1) Loan Amount: $#{loan_amount.to_f}
    # 2) Loan Term: #{loan_duration_in_months} months
    # 3) APR: #{annual_percentage_rate.to_f}
    # MSG

    # prompt(agreement_prompt)

# prompt("Is this correct? Enter Y to proceed or N to start again:")
   # loop do
        # agreement = gets.chomp.upcase!
        # if agreement == 'Y'
            # break
        # else
    # end

#Formula ---  m = p * (j / (1 - (1 + j)**(-n)))


monthly_interest_rate = (annual_percentage_rate.to_f / 100) / 12

monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

    calculation_prompt = <<-MSG
    Here are your results:
    1) Monthly Payment: $#{monthly_payment.to_f}
    2) Monthly Interest Rate: #{monthly_interest_rate}%
    3) Loan Term: #{loan_duration_in_months} months
    MSG

    prompt(calculation_prompt)




