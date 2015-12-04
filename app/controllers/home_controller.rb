class HomeController < ApplicationController
  require 'open-uri'
  def index
    country_ids = ['IN','UK','US','IQ','IR']
    @tmp_arry = []
    @temp_min=[]
    @temp_max=[]
    (0...5).to_a.each do |i|
      c = country_ids[i]
      url = "http://api.openweathermap.org/data/2.5/weather?q=#{c}&mode=json&units=metric"
      contents = open(url).read
      parsed_json = JSON.parse(contents)
      @tmp_arry << parsed_json['main']['temp']
      @temp_min << parsed_json['main']['temp_min']
      @temp_max << parsed_json['main']['temp_max']
    end
  end
end
