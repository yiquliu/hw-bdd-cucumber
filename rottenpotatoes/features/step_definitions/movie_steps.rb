# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should eql(n_seeds.to_i)
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  pos1 = page.body.index(e1)
  if !pos1 then raise e1 + " not found" end
  pos2 = page.body.index(e2)
  if !pos2 then raise e2 + " not found" end
  pos1.should < pos2
end
