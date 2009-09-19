class RepresentativesController < ApplicationController

  before_filter :load_transporters, :except=>[:destroy]
  before_filter :load_price_tables, :except=>[:destroy]  
  
  # GET /representatives
  # GET /representatives.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "representatives.id asc" : "representatives.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @representatives = Representative.paginate :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @representatives }
    end
  end

  # GET /representatives/1
  # GET /representatives/1.xml
  def show
    @representative = Representative.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @representative }
    end
  end

  # GET /representatives/new
  # GET /representatives/new.xml
  def new
    @representative = Representative.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @representative }
    end
  end

  # GET /representatives/1/edit
  def edit
    @representative = Representative.find(params[:id])
  end

  # POST /representatives
  # POST /representatives.xml
  def create
    @representative = Representative.new(params[:representative])

    respond_to do |format|
      if @representative.save
        flash[:notice] = 'Representative was successfully created.'
        format.html { redirect_to(representatives_path) }
        format.xml  { render :xml => @representative, :status => :created, :location => @representative }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @representative.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /representatives/1
  # PUT /representatives/1.xml
  def update
    @representative = Representative.find(params[:id])
	params[:representative][:price_list_ids] ||= []
	params[:representative][:carrier_ids] ||= []
    respond_to do |format|
      if @representative.update_attributes(params[:representative])
        flash[:notice] = 'Representative was successfully updated.'
        format.html { redirect_to(representatives_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @representative.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /representatives/1
  # DELETE /representatives/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        Representative.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      Representative.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end
    respond_to do |format|
      format.html { redirect_to(representatives_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def load_transporters
	  @carriers = Carrier.find :all
  end

  def load_price_tables
	  @price_lists = PriceList.find :all
  end  
  
end
