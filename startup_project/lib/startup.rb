require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        if @salaries.include?(title)
            return true
        else
            return false
        end
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(name, title)
        if @salaries.has_key?(title)
            @employees << Employee.new(name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        @employees.count
    end

    def pay_employee(employee_instance)
        if @funding > @salaries[employee_instance.title]
            employee_instance.pay(@salaries[employee_instance.title])
            @funding -= @salaries[employee_instance.title]
        else
            raise
        end
    end

    def payday
        employees.map { |employee| pay_employee(employee) }
    end

    def average_salary
        salaries_arr = []
        employees.each do |employee|
            if salaries.has_key?(employee.title)
                salaries_arr << salaries[employee.title]
            end
        end
        salaries_arr.sum / salaries_arr.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @employees += startup.employees
        startup.salaries.each do |k, v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        startup.close
    end



end
