class SalesController < ApplicationController
  
  before_filter :load_solicitation,:except=>[:index,:destroy]
  before_filter :load_sales,:except=>[:index,:destroy]  
  # GET /sales
  # GET /sales.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "sales.id asc" : "sales.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["solicitation_id like ?","%#{params[:search]}%"] unless params[:search].blank?
    @solicitations = Solicitation.paginate :include=>[:customer,:sales], :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitations }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  def new
    @sale = @solicitation.sales.new
    @sale.sale_date = Date.current.to_s_br
#  	@sale.sale_items.build    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  def create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        flash[:notice] = 'Sale was successfully created.'
        format.html { redirect_to(sales_url) }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        flash[:notice] = 'Sale was successfully updated.'
        format.html { redirect_to(sales_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        Sale.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      Sale.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(sales_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def load_solicitation
	  @solicitation = Solicitation.find(:first,:include=>[:solicitation_items],:conditions=>["id=?",params[:solicitation_id]])	
  end

  def load_sales
	  #@solicitation = Solicitation.find_first(:id=>params[:solicitation_id])
	  @sales = Sale.find(:all,
		  :include=>[:sale_items=>[:solicitation_item]],
		  :conditions=>["solicitation_id=?",params[:solicitation_id]])	
  end  
end
