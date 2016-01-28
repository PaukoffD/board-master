class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

 def normalize_friendly_id(string)
    string.to_slug.normalize.to_s
 end

 
  def index
    @notices = Notice.visible.page(params[:page])
  end

  def indextmp
  for j in 0..params[:notice_ids].length-1
  i=params[:notice_ids][j].to_i
  @notice = Notice.find(i)
  @cat= Category.find(@notice.category_id)
  @cat.count=@cat.count+1
 
  @cat.save
  end

 Notice.where('id' => params[:notice_ids]).update_all({:state => "visible"})
   
	
  end 
  
  
  
  def show
    @notice = Notice.friendly.find(params[:id])
	#category = Category.all.map { |category| [category.name] }
	#city = City.all.map { |category1| [category1.name] }
    #options_for_select(category_array) 
  end

  def rules
  end
  
  def moderation
   @notices =  Notice.moderated.page(params[:page])
   
  end
  
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
	@notice.slug= normalize_friendly_id(@notice.notice)
	if notice_params['category_id'].match('----')
	  s=notice_params['category_id'].delete('----')
	 if  notice_params['category_id'].match('--')
	   s=notice_params['category_id'].delete('--')
	 else
      s=notice_params['category_id']
	 end
	end 
 @category = Category.find_by(name: s)
  @notice.category_id= @category.id
	
 if  params[:searchng][:w]!=""
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
      @notice = Notice.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit!
    end
end
