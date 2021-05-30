require 'date'

# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# iterate through 13th of each month in the year
# check if day is friday
# if friday, then increment counter
# return counter


def friday_13th(year)
  count = 0
  dates = []
  1.upto(12) do |month|
    dates << Date.new(year, month, 13)
  end
  dates.each do |date|
    count += 1 if date.friday?
  end
  count
end

# Examples:

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2


# An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.

# iterate through each month
# iterate through each day in month
# if friday? increment month count
#if count == 5 then increment five_fridays count


def five_fridays(year)
  five_fridays_count = 0
  month_start_dates = []
  month_end_dates = []
  1.upto(12) do |month|
    start_date = Date.new(year, month, 1)
    end_date = start_date.next_month - 1
    month_start_dates << start_date
    month_end_dates << end_date
  end
  0.upto(11) do |index|
    fridays_in_month = 0
    month_start_dates[index].upto(month_end_dates[index]) do |day|
      fridays_in_month += 1 if day.friday?
    end
    five_fridays_count += 1 if fridays_in_month == 5
  end
  five_fridays_count
end

p five_fridays(2020)
p five_fridays(2021)
