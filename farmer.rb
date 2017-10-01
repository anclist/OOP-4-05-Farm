class Farmer

  def main_menu
      while true # repeat indefinitely
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end
  end

  def print_main_menu
    puts '[1] Field'
    puts '[2] Harvest'
    puts '[3] status'
    puts '[4] relax'
    puts '[5] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then field
      when 2 then harvest
      when 3 then status
      when 4 then relax
      when 5 then exit
    end
  end

  def field

  end

  def harvest

  end

  def status

  end

  def relax

  end

end


a_farm = Farmer.new
a_farm.main_menu
