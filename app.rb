require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post("/surveys") do
  title = params.fetch('title')
  binding.pry
  survey = Survey.new({:title => title})
  survey.save()
  redirect('/')
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id'))
  erb(:survey)
end

post("/surveys/:id") do
  name = params.fetch('name')
  id = params.fetch('id')
  question = Question.create({:name => name, :survey_id => id})
  redirect("/surveys/#{id}")
end
