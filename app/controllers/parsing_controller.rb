class ParsingController < ApplicationController
require 'open-uri'




  def index
  
  
   page = Nokogiri::HTML(open("http://msk.barahla.net/25.html"))
   page2 = Nokogiri::HTML(open("http://msk.barahla.net/?page=5"))
   page3 = Nokogiri::HTML(open("http://msk.barahla.net/?page=6"))
   page4 = Nokogiri::HTML(open("http://msk.barahla.net/?page=7"))
   puts page.class # => Nokogiri::HTML::Document
   
   
   

   #puts page.css("title")[0].name # => title
   #puts page.css("title")[0].text
   #page.css(".ob").each do |link|
  #  @notice=Tmpnotice.new
   # @notice.notice=link.at_css(".ob_title").text
	#puts link.at_css(".author").text
	#puts link.at_css(".grey").text
	#@notice.text=link.at_css("p[3]").text
	#puts link.at_css("p[1]").text
	#puts link.text
	#@notice.save
  #end 
 page.css(".ms_child").each do |link|
   puts link.text
  end 
  #puts page.at_css(".ob_rubrika").text 
   
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
    #topic=Topic.order(:created_at).reorder('id DESC').last
	#@forum = Forum.find(topic.forum_id)
	
  end
  
  def indextmp
  @notices = Tmpnotice.all
  #puts page.at_css(".ob_rubrika").text 
   
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
    #topic=Topic.order(:created_at).reorder('id DESC').last
	#@forum = Forum.find(topic.forum_id)
	
  end
  
  
  
end