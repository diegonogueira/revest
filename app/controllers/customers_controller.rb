class CustomersController < ApplicationController

  before_filter :load_representative

  # GET /customers
  # GET /customers.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "customers.id asc" : "customers.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @customers = @representative.customers.paginate :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = @representative.customers.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = @representative.customers.new(params[:customer])

    respond_to do |format|
      if @customer.save
        flash[:notice] = 'Customer was successfully created.'
        format.html { redirect_to(representative_customers_path(@representative)) }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Customer was successfully updated.'
        format.html { redirect_to(representative_customers_path(@representative)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        Customer.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      Customer.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(representative_customers_path(@representative)) }
      format.xml  { head :ok }
    end
  end
  
  private

  def load_representative
	  @representative = Representative.find(params[:representative_id])
  end  
  
end
