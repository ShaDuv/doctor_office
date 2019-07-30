
require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
require('./lib/doctor')

DB = PG.connect({:dbname => "clinic"})


get ('/')do
  erb(:default)
end

get ('/admin')do
  @doctors = Doctor.all
  erb(:admin)
end


post ('/add_doctor')do
  DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{params[:doctor_name]}', '#{params[:specialty]}');")
  redirect to ('/admin')
end

post ('/add_patient')do
  DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{params[:patient_name]}', '#{params[:birthday]}');")
  redirect to ('/admin')
end
