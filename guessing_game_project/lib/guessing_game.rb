class GuessingGame

    attr_reader :num_attempts

    def initialize(min,max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        if num > @secret_num 
            puts 'too big'
            @num_attempts += 1
        elsif num < @secret_num
            puts 'too small'
            @num_attempts += 1
        else
            @game_over = true
            puts 'you win'
        end
    end
    
    def ask_user
        puts 'enter a number'
        number = gets.chomp.to_i
        self.check_num(number)
    end

end
