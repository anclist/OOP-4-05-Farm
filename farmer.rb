require_relative 'farm'

@@harvest = []


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
    puts 'What kind of field is it: corn or wheat?'
    kind = gets.chomp
      if kind == "corn" || kind == "wheat"
        kind
        puts 'How large is the field in hectares?'
        size = gets.chomp
      else
        puts "That's the wrong option"
        self.field
      end

    new_field = Farm.create(kind, size)
    puts "Added a #{kind} field of #{size} hectares!"
  end

  def harvest
    Farm.harvest
    Farm.fields.each do |field|
      puts "Harvesting #{field.production} food from #{field.size} hectare #{field.kind} field."
    end
    status_2
  end

  def status
      Farm.fields.each do |field|
        puts "#{field.kind.capitalize} field is #{field.size} hectares."
      end
      status_2
  end

  def status_2
    puts "The farm has #{Farm.harvested} harvested food so far."
  end

  def relax
    corn_hectares = Farm.hectares("corn")
    wheat_hectares = Farm.hectares("wheat")
    puts "#{corn_hectares} hectares of tall green stalks rustling in the breeze fill your horizon.
The sun hangs low, casting an orange glow on a sea of #{wheat_hectares} hectares of wheat."
  end

end


a_farm = Farmer.new
a_farm.main_menu
