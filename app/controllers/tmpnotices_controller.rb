class TmpnoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

   def normalize_friendly_id(string)
    string.to_slug.normalize(transliterations: :russian).to_s
 end
  
  
  
  # GET /notices
  # GET /notices.json
  def index
    @notices = Tmpnotice.all
	load
  end

  # GET /notices/1
  # GET /notices/1.json
  
  def edit
   load
  @notices = Tmpnotice.all
  end 
  
  
  def show
  end

   def indextmp
   for j in 0..params[:notice_ids].length-1
    notice=Notice.new
    i=params[:notice_ids][j].to_i
    @tmpnotice = Tmpnotice.find(i)
    page = Nokogiri::HTML(open(@tmpnotice.ref_page))
	p=page.xpath("//*[contains(@class,'ob_header')]")
	notice.notice=p.at_css("tr td h1").text
	puts notice.notice
	p=page.xpath("//*[contains(@class,'show_ob')]")
	s=p.at_css("tr td.td1 p strong").text
	s=s.delete('Стоимость:')
	s=s.delete('руб.')
	puts s
	notice.price=s.strip.to_i
	if page.xpath(".//*[@id='new_content']/table/tbody/tr/td[1]/p[2]").text.match('Район')
	  notice.text=page.xpath(".//*[@id='new_content']/table/tbody/tr/td[1]/p[3]").text
	else
	  notice.text=page.xpath(".//*[@id='new_content']/table/tbody/tr/td[1]/p[2]").text
    end	
	puts notice.text
	
	notice.city_id=2
	notice.category_id=17
	notice.name=page.xpath(".//*[@id='new_content']/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/p[1]").text
	puts notice.name
	notice.email=page.xpath(".//*[@id='new_content']/table/tbody/tr/td[1]/table/tbody/tr[2]/td[2]/p[6]/a").text

	if notice.email.blank?
	  notice.text=notice.text+"    Координаты здесь:  "+  @tmpnotice.ref_page.to_s  
	end  
	notice.slug= normalize_friendly_id(notice.notice)
	notice.save
	
 
    end
   
   Tmpnotice.where('id' => params[:notice_ids]).update_all({:choice => true})
   Tmpnotice.where('choice' => nil).delete_all
 
  end
  
  
  
  
  # GET /notices/new
  def new
  
    @notice = Notice.new
	category = Category.all.map { |category| [category.name] }
	city = City.all.map { |category1| [category1.name] }
    #options_for_select(category_array) 
end
  

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @notice = Notice.new(notice_params)
 if  params[:searchng][:w]!=nil
   c=City.new
   c.city= params[:searchng][:w]
   c.save
   c=City.last
 @notice.city_id=c.id
 end
 
    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: 'Notice was successfully created.' }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
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

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @notice.destroy
    respond_to do |format|
      format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
      format.json { head :no_content }
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
