class PriceListsController < ApplicationController
  # GET /price_lists
  # GET /price_lists.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "price_lists.id asc" : "price_lists.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @price_lists = PriceList.paginate :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @price_lists }
    end
  end

  # GET /price_lists/1
  # GET /price_lists/1.xml
  def show
    @price_list = PriceList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @price_list }
    end
  end

  # GET /price_lists/new
  # GET /price_lists/new.xml
  def new
    @price_list = PriceList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price_list }
    end
  end

  # GET /price_lists/1/edit
  def edit
    @price_list = PriceList.find(params[:id])
  end

  # POST /price_lists
  # POST /price_lists.xml
  def create
    @price_list = PriceList.new(params[:price_list])

    respond_to do |format|
      if @price_list.save
        flash[:notice] = 'PriceList was successfully created.'
        format.html { redirect_to(price_lists_path) }
        format.xml  { render :xml => @price_list, :status => :created, :location => @price_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @price_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /price_lists/1
  # PUT /price_lists/1.xml
  def update
    @price_list = PriceList.find(params[:id])

    respond_to do |format|
      if @price_list.update_attributes(params[:price_list])
        flash[:notice] = 'PriceList was successfully updated.'
        format.html { redirect_to(price_lists_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /price_lists/1
  # DELETE /price_lists/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        PriceList.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      PriceList.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(price_lists_url) }
      format.xml  { head :ok }
    end
  end
end
