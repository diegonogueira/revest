class CarrierPriceListsController < ApplicationController
  # GET /carrier_price_lists
  # GET /carrier_price_lists.xml
  def index
    @carrier_price_lists = CarrierPriceList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carrier_price_lists }
    end
  end

  # GET /carrier_price_lists/1
  # GET /carrier_price_lists/1.xml
  def show
    @carrier_price_list = CarrierPriceList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carrier_price_list }
    end
  end

  # GET /carrier_price_lists/new
  # GET /carrier_price_lists/new.xml
  def new
    @carrier_price_list = CarrierPriceList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carrier_price_list }
    end
  end

  # GET /carrier_price_lists/1/edit
  def edit
    @carrier_price_list = CarrierPriceList.find(params[:id])
  end

  # POST /carrier_price_lists
  # POST /carrier_price_lists.xml
  def create
    @carrier_price_list = CarrierPriceList.new(params[:carrier_price_list])

    respond_to do |format|
      if @carrier_price_list.save
        flash[:notice] = 'CarrierPriceList was successfully created.'
        format.html { redirect_to(@carrier_price_list) }
        format.xml  { render :xml => @carrier_price_list, :status => :created, :location => @carrier_price_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carrier_price_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carrier_price_lists/1
  # PUT /carrier_price_lists/1.xml
  def update
    @carrier_price_list = CarrierPriceList.find(params[:id])

    respond_to do |format|
      if @carrier_price_list.update_attributes(params[:carrier_price_list])
        flash[:notice] = 'CarrierPriceList was successfully updated.'
        format.html { redirect_to(@carrier_price_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carrier_price_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carrier_price_lists/1
  # DELETE /carrier_price_lists/1.xml
  def destroy
    @carrier_price_list = CarrierPriceList.find(params[:id])
    @carrier_price_list.destroy

    respond_to do |format|
      format.html { redirect_to(carrier_price_lists_url) }
      format.xml  { head :ok }
    end
  end
end
