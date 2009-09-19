class CarriersController < ApplicationController
  # GET /carriers
  # GET /carriers.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "carriers.id asc" : "carriers.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @carriers = Carrier.paginate :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carriers }
    end
  end

  # GET /carriers/1
  # GET /carriers/1.xml
  def show
    @carrier = Carrier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carrier }
    end
  end

  # GET /carriers/new
  # GET /carriers/new.xml
  def new
    @carrier = Carrier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carrier }
    end
  end

  # GET /carriers/1/edit
  def edit
    @carrier = Carrier.find(params[:id])
  end

  # POST /carriers
  # POST /carriers.xml
  def create
    @carrier = Carrier.new(params[:carrier])

    respond_to do |format|
      if @carrier.save
        flash[:notice] = 'Carrier was successfully created.'
        format.html { redirect_to(carriers_path) }
        format.xml  { render :xml => @carrier, :status => :created, :location => @carrier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carrier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carriers/1
  # PUT /carriers/1.xml
  def update
    @carrier = Carrier.find(params[:id])

    respond_to do |format|
      if @carrier.update_attributes(params[:carrier])
        flash[:notice] = 'Carrier was successfully updated.'
        format.html { redirect_to(carriers_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carrier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carriers/1
  # DELETE /carriers/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        Carrier.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      Carrier.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(carriers_url) }
      format.xml  { head :ok }
    end
  end
end
