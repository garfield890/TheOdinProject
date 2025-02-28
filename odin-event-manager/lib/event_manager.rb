require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

puts 'Event Manager Initialized!'

# contents = File.read('event_attendees.csv') if File.exist? 'event_attendees.csv'

# File.readlines('event_attendees.csv').each_with_index do |line, index|
#   next if index == 0
#   columns = line.split(",")
#   puts columns[2]
# end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_numbers(phone_number)
  cleaned_phone_number = phone_number.gsub("-", "")
  if cleaned_phone_number.length < 10
    return "000-000-0000"
  elsif cleaned_phone_number.length == 10
    return cleaned_phone_number
  elsif cleaned_phone_number.length == 11 && cleaned_phone_number[0] == "1"
    return cleaned_phone_number[1..10]
  else 
    return "000-000-0000"
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end


puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter
hour_counts = Hash.new(0)
day_counts = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = row[:homephone]
  hour = row[1]

  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phone_numbers(phone_number)
  parsed_time = Time.strptime(hour, "%m/%d/%y %H:%M")  # Parse using correct format
  hour = parsed_time.hour  # Extract hour (0-23)
  day = parsed_time.wday
  hour_counts[hour] += 1
  day_counts[day] += 1

  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end

sorted_hours = hour_counts.sort_by { |hour, count| -count }
sorted_days = day_counts.sort_by { |day, count| -count }
sorted_hours.each do |hour, count|
  puts "Hour #{hour}: #{count} registrations"
end
sorted_days.each do |day, count|
  puts "Day #{day}: #{count} registrations"
end