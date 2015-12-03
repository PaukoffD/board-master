class ParsingController < ApplicationController
require 'open-uri'




  def index
   page = Nokogiri::HTML(open("http://mediametrics.ru/rating/ru/hour.html"))   
   puts page.class   # => Nokogiri::HTML::Document
   
   puts page.css("title")[0].name   # => title
   puts page.css("title")[0].text
   page.css("nav ul.menu li a").each do |link|
    puts link.content
  end 
   
   
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
    #topic=Topic.order(:created_at).reorder('id DESC').last
	#@forum = Forum.find(topic.forum_id)
	return page
  end
  
end