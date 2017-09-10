require 'sinatra'



#Why/how do i add visuals to this page?

# get '/' do			#get methods takes two argumetns string: website
# 	p "#{Time.now}"	#block of ruby code executed when
# end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')



  # Pony.mail :to => 'sean@dvlper.com',
  #  :from => "#{params[:email]}",
  #  :subject => "Contact SFT :  #{params[:name]}",
  #  :body=> "#{params[:body]}, --- Contact Address #{params[:email]}",
  #  :via => :smtp,
  #  :smtp => {
  #    :host   => 'smtp.gmail.com',
  #    :port   => '587',
  #    :tls    => true,
  #    :user   => 'sparkcollaboration@gmail.com',
  #    :password   => 'Seantildawnn3',
  #    :auth   => :plain,
  #    :domain => "dvlper.com"
  #  }

end

post '/homecontact' do
  require 'pony'
  Pony.mail({
  :to => ['sean@dvlper.com', 'victor@dvlper.com'],
  :from => "#{params[:email]}",
  :body => "#{params[:message]}, -- #{params[:name]}, #{params[:phone]}, #{params[:email]}",
  :via => :smtp,
  :via_options => {
    :address        => 'smtp.gmail.com',
    :port           => '587',
    :enable_starttls_auto => true,
    :user_name      => 'sparkcollaboration@gmail.com',
    :password       => 'w87B212arNolds34',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
})

redirect '/success'

end

post '/subscriber' do
  require 'pony'
  Pony.mail({
  :to => ['sean@dvlper.com', 'victor@dvlper.com'],
  :from => "#{params[:email]}",
  :subject => "New Subscriber on website",
  :body => "New Subscription - #{params[:email]},",
  :via => :smtp,
  :via_options => {
    :address        => 'smtp.gmail.com',
    :port           => '587',
    :enable_starttls_auto => true,
    :user_name      => 'sparkcollaboration@gmail.com',
    :password       => 'w87B212arNolds34',
    :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
  }
})

redirect '/success'

end



get '/success' do
  send_file File.join(settings.public_folder, 'index.html')
  alert("Email Sent Successfully")
end
