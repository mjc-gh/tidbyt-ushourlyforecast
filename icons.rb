require 'base64'

icons = Dir["icons/*.png"]

File.open('icons.star', 'w+') do |file|
  file.puts 'ICONS = {'

  icons.each.with_index do |png, index|
    file.puts %Q["#{File.basename(png, '.png')}": "#{Base64.strict_encode64(File.read(png))}"#{index + 1 == icons.size ? '' : ','}]
  end

  file.puts '}'
end
