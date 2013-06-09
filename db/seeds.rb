# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
p1 = Person.create({:name => "Joe", :is_anon => true, :phone => "5551212"})
s1 = Schedule.create({})
t1 = Timeslot.create({:day => 6, :start_time => "08:00", :end_time => "09:00"})
t2 = Timeslot.create({:day => 6, :start_time => "20:00", :end_time => "23:00"})
s1.timeslots << t1
s1.timeslots << t2
p1.schedule = s1

p2 = Person.create({:name => "Bob", :is_anon => true, :in_call => true})
s2 = Schedule.create({})
t3 = Timeslot.create({:day => 6, :start_time => "08:00", :end_time => "09:00"})
t4 = Timeslot.create({:day => 6, :start_time => "20:00", :end_time => "23:00"})
s2.timeslots << t3
s2.timeslots << t4
p2.schedule = s2
