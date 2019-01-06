# Guest creation
puts "Creating Guest"
['rohit', 'karan', 'sagar', 'sayed', 'ratika', 'kiran', 'sankara', 'akash'].each do |name|
  puts "Name: #{name}  ==> Email: #{name}@quickener.net"
  Guest.create(name: name, email: "#{name}@quickener.net")
end

puts "Creating Restourant"
['sarvana', 'seesell', 'rashwid', 'kotaria', 'mharaja', 'iceland', 'saltsea'].each do |name|
  phone_num = "9#{rand(9)}8#{rand(9)}31#{rand(9)}14#{rand(9)}".to_i
  puts "Name: #{name}  ==> Email: #{name}@quickener.net ==> Phone: #{phone_num}"
  Restourant.create(name: name, email: "#{name}@res.com", phone: phone_num)
end

puts "Creating Shift"
restourant_ids = Restourant.all.pluck(:id)
morning_start_time = DateTime.now.beginning_of_day + 7.hours
morning_end_time = DateTime.now.beginning_of_day + 10.hours
noon_start_time = DateTime.now.beginning_of_day + 12.hours
noon_end_time = DateTime.now.beginning_of_day + 15.hours
night_start_time = DateTime.now.beginning_of_day + 18.hours
night_end_time = DateTime.now.beginning_of_day + 23.hours

restourant_ids.each do |restourant_id|
  ["morning", "afternon", "night"].each do |shift_type|
    if shift_type == "morning"
      puts "Restourant: #{restourant_id} ==> Shift Type: #{shift_type} ==> start_time: #{morning_start_time} ==> end_time: #{morning_end_time}"
      Shift.create(restourant_id: restourant_id,
        shift_type: shift_type, start_time: morning_start_time,
        end_time: morning_end_time)
    elsif shift_type == "afternon"
      puts "Restourant: #{restourant_id} ==> Shift Type: #{shift_type} ==> start_time: #{noon_start_time} ==> end_time: #{noon_end_time}"
      Shift.create(restourant_id: restourant_id,
        shift_type: shift_type, start_time: noon_start_time,
        end_time: noon_end_time)
    elsif shift_type == "night"
      puts "Restourant: #{restourant_id} ==> Shift Type: #{shift_type} ==> start_time: #{night_start_time} ==> end_time: #{night_end_time}"
      Shift.create(restourant_id: restourant_id,
        shift_type: shift_type, start_time: night_start_time,
        end_time: night_end_time)
    end
  end
end

puts "Creating Tables"
small_min_num = 1
small_max_num = 4
medium_min_num = 5
medium_max_num = 12
large_min_num = 13
large_max_num = 24
xl_min_num = 25
xl_max_num = 50
restourant_ids.each do |restourant_id|
  ["small", "medium", "large", "xl"].each do |name|
    if name == "small"
      puts "Restourant: #{restourant_id} ==> name: #{name} ==> min_num: #{small_min_num} ==> max_num: #{small_max_num}"
      Table.create(restourant_id: restourant_id,
        name: name, min_num: small_min_num,
        max_num: small_max_num)
    elsif name == "medium"
      puts "Restourant: #{restourant_id} ==> name: #{name} ==> min_num: #{medium_min_num} ==> max_num: #{medium_max_num}"
      Table.create(restourant_id: restourant_id,
        name: name, min_num: medium_min_num,
        max_num: medium_max_num)
    elsif name == "large"
      puts "Restourant: #{restourant_id} ==> name: #{name} ==> min_num: #{large_min_num} ==> max_num: #{large_max_num}"
      Table.create(restourant_id: restourant_id,
        name: name, min_num: large_min_num,
        max_num: large_max_num)
    elsif name == "xl"
      puts "Restourant: #{restourant_id} ==> name: #{name} ==> min_num: #{xl_min_num} ==> max_num: #{xl_max_num}"
      Table.create(restourant_id: restourant_id,
        name: name, min_num: xl_min_num,
        max_num: xl_max_num)
    end
  end
end

puts "Done... Please use this quick data to test reservation"
puts "creation update and listing! Or you can try from backend"