# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Release.delete_all
Release.reset_pk_sequence
User.delete_all
User.reset_pk_sequence

default_date = Date.today.weeks_ago(1)
now = Time.now

for i in 1..30 do
  Release.create!(
    name: "コミック" + i.to_s,
    content: "サンプル" + i.to_s,
    date: default_date + i,
    user_id: i % 2 + 1
  )
end

for i in 1..5 do
  User.create!(
    email: i.to_s + "@ho.ge",
    password: "hogehoge",
    name: "testuser" + i.to_s,
    confirmed_at: now,
    uid: "seed" + i.to_s,
    provider: "seed"
  )
end
