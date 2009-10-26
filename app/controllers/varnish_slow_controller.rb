class VarnishSlowController < ApplicationController
  def index
    send_data Slow.rotate_and_resize, :filename => "jelly_fish.png", :type => "image/png", :disposition => 'inline'
  end
end
