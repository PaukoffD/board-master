class ParsingController < ApplicationController
require 'open-uri'




  def index
  
  
  # page = Nokogiri::HTML(open("http://msk.barahla.net/25.html"))
   page = Nokogiri::HTML(open("http://msk.barahla.net/?page=4"))
   page2 = Nokogiri::HTML(open("http://msk.barahla.net/?page=5"))
   page3 = Nokogiri::HTML(open("http://msk.barahla.net/?page=6"))
   page4 = Nokogiri::HTML(open("http://msk.barahla.net/?page=7"))
   page5 = Nokogiri::HTML(open("http://msk.barahla.net/?page=8"))
   page6 = Nokogiri::HTML(open("http://msk.barahla.net/?page=9"))
   page7 = Nokogiri::HTML(open("http://msk.barahla.net/?page=10"))
   

   #puts page.css("title")[0].name # => title
   #puts page.css("title")[0].text
   page.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
   page2.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
   page3.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
   page4.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
   page5.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
   page6.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
   page7.css(".ob").each do |link|
    @notice=Tmpnotice.new
    @notice.notice=link.at_css(".ob_title").text
	s=link.at_css(".photo_preview")
	if !s.name="td"
	 @notice.ref_img=link.at_css(".photo_preview img")['src']
	end 
	@notice.ref_page=link.at_css(".ob_descr td a")['href']
	@notice.name=link.at_css(".author").text
	
	@notice.text=link.at_css("p[3]").text
	
	@notice.save
   end 
  # Категории
          # page.css(".ms_child").each do |link|
          #puts link.text
          #st=link.text
          # c=Category.new
        #      st = link.at_css("tr[4] td[1] div a").text
           # puts link.at_css("tr[4] td[1] div a").text
         # c.name=st
         #//*[@id="new_content"]/div[3]/div/div/div/div/table/tbody/tr[3]/td[1]/div/a
        # puts c.name
        #c.save
        #puts //*[@id="new_content"]/div[3]/div/div/div/div/table/tbody/tr[1]/td[1]/div/a
        #end 
  #puts page.at_css(".ob_rubrika").text 
   
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
    #topic=Topic.order(:created_at).reorder('id DESC').last
	#@forum = Forum.find(topic.forum_id)
	
  end
  
  def indextmp
  #load
  @notices = Tmpnotice.all
  #loading
  #puts page.at_css(".ob_rubrika").text 
   
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
    #topic=Topic.order(:created_at).reorder('id DESC').last
	#@forum = Forum.find(topic.forum_id)
	
  end
  
 def loadtmp
 
  @notices = Notice.moderated.all
  #puts page.at_css(".ob_rubrika").text 
 
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
 # Notice.where('id' => params[:notice_ids]).update_all({:state => "visible"})
  Tmpnotice.where(:state => 'pending_review').delete_all
	
	
	
  end 
 
 def update
 
  @notices = Tmpnotice.all
  #puts page.at_css(".ob_rubrika").text 
   loas
    #@topics = Topic.order(:created_at).reorder('id DESC').all.page(params[:page])
   Tmpnotice.update_all(choice=true, :id=> params[:notice_ids])
	
	
	
  end 
  
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: 'Notice was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Tmpnotice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit!
    end 
  
  
  
  
end