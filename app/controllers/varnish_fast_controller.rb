require 'benchmark'

class VarnishFastController < ApplicationController
  def index
    headers['Cache-Control'] = 'public; max-age=2592000'
  	send_data Slow.rotate_and_resize, :filename => "jelly_fish.png", :type => "image/png", :disposition => 'inline'
  end
end
