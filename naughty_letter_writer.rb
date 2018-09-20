require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split
  kid_data_infraction = kid.split('|')

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]

  random_toy = 'Kaleidoscope'
  while random_toy == 'Kaleidoscope'
      random_toy = toys[rand(0..toys.length-1)]
  end



  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
