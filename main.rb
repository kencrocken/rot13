require 'sinatra'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

enable :sessions
helpers Sinatra::RedirectWithFlash

SITE_TITLE = "Rot13"
SITE_DESCRIPTION = "Encode/Decode your messages"


def rot13(message)
  @message = message.tr!("A-Za-z","N-ZA-Mn-za-m")
  if @message
    redirect '/', :flash => {:success => "#{@message}"}
  else
    redirect '/', :flash => {:danger => "Sorry there was an error. Try again."}
  end
end

get '/' do
  erb :home
end

post '/' do
  @phrase = params[:phrase]
  rot13(@phrase)
end
