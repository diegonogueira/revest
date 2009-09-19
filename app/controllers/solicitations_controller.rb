class SolicitationsController < ApplicationController

  before_filter :load_representative, :only =>[:index,:new,:create,:update,:edit]
  before_filter :load_customers, :only =>[:new,:create,:update,:edit]
  before_filter :load_carriers, :only =>[:new,:create,:update,:edit]
  before_filter :load_carrier_price_lists, :only =>[:new,:create,:update,:edit]
  before_filter :load_payment_forms, :only =>[:new,:create,:update,:edit]
  before_filter :load_price_lists, :only =>[:new,:create,:update,:edit]
  before_filter :load_products, :only =>[:new,:create,:update,:edit]

  # GET /solicitations
  # GET /solicitations.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "solicitations.id asc" : "solicitations.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @solicitations = @representative.solicitations.paginate :include => [:customer], :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitations }
    end
  end

  # GET /solicitations/1
  # GET /solicitations/1.xml
  def show
    @solicitation = Solicitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solicitation }
    end
  end

  # GET /solicitations/new
  # GET /solicitations/new.xml
  def new
    @solicitation = @representative.solicitations.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitation }
    end
  end

  # GET /solicitations/1/edit
  def edit
    @solicitation = Solicitation.find(params[:id])
  end

  # POST /solicitations
  # POST /solicitations.xml
  def create
    @solicitation = @representative.solicitations.new(params[:solicitation])

    respond_to do |format|
      if @solicitation.save
        flash[:notice] = 'Solicitation was successfully created.'
        format.html { redirect_to(representative_solicitations_path(@representative)) }
        format.xml  { render :xml => @solicitation, :status => :created, :location => @solicitation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solicitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /solicitations/1
  # PUT /solicitations/1.xml
  def update
    @solicitation = Solicitation.find(params[:id])

    respond_to do |format|
      if @solicitation.update_attributes(params[:solicitation])
        flash[:notice] = 'Solicitation was successfully updated.'
        format.html { redirect_to(representative_solicitations_path(@representative)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitations/1
  # DELETE /solicitations/1.xml
  def destroy
    @solicitation = Solicitation.find(params[:id])
    @solicitation.destroy

    respond_to do |format|
      format.html { redirect_to(solicitations_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def load_representative
	  @representative = Representative.find(params[:representative_id])
  end

  def load_customers
	  @customers = @representative.customers.collect{|i|[i.name,i.id]}
  end

  def load_carriers
	  @carriers = @representative.carriers.collect{|i|[i.name,i.id]}
  end

  def load_carrier_price_lists
	  @carrier_price_lists = CarrierPriceList.find(:all).collect{|i|[i.name,i.id]}
  end

  def load_payment_forms
	  @payment_forms = PaymentForm.find(:all).collect{|i|[i.name,i.id]}
  end

  def load_price_lists
	  @price_lists = PriceList.find(:all).collect{|i|[i.name,i.id]}
  end

  def load_products
	  @products = Product.find(:all).collect{|i|[i.name,i.id]}
  end  
  
end
