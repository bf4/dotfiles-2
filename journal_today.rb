#! ruby
# supa primitive script to access today's journal entry text file
now = Time.now
month = now.month.to_s
month = "0" + month if month.to_i < 10
day = now.mday.to_s
day = "0" + day if day.to_i < 10
date = month + day + now.year.to_s[2,3]

system("vi /Users/giles/Documents/Journal/#{now.year}/#{date}.txt")
