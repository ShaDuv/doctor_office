
require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")

DB = PG.connect({:dbname => "clinic"})


get ('/')do
  erb :default
end
get ('/admin')do
  erb :admin
end
post ('/add_doctor')do
  DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{params[:doctor_name]}', '#{params[:specialty]}');")
  redirect to ('/admin')
end

post ('/add_patient')do
  DB.exec("INSERT INTO patients VALUES ('#{params[:patient_name]}', '#{params[:birthday]}');")
  redirect to ('/admin')
end


# get ('/:board_name') do
#   if categories.include?(params[:board_name]) == false
#     redirect to ('/whoops')
#   end
#   @posts = DB.exec("SELECT * FROM #{params[:board_name]}")
#   @board_name = params[:board_name]
#   erb :board
# end
#
#
# post ('/:board_name/post_message')do
#   DB.exec("INSERT INTO #{params[:board_name]} VALUES ('#{params[:user_name]}', '#{params[:content]}', '#{Time.new.to_s}');")
#   redirect to ("#{params[:board_name]}")
# end
#
# get('/whoops')do
#   "Whoops!!!"
# end
