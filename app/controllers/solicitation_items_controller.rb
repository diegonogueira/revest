class SolicitationItemsController < ApplicationController
  # GET /solicitation_items
  # GET /solicitation_items.xml
  def index
    @solicitation_items = SolicitationItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitation_items }
    end
  end

  # GET /solicitation_items/1
  # GET /solicitation_items/1.xml
  def show
    @solicitation_item = SolicitationItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solicitation_item }
    end
  end

  # GET /solicitation_items/new
  # GET /solicitation_items/new.xml
  def new
    @solicitation_item = SolicitationItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitation_item }
    end
  end

  # GET /solicitation_items/1/edit
  def edit
    @solicitation_item = SolicitationItem.find(params[:id])
  end

  # POST /solicitation_items
  # POST /solicitation_items.xml
  def create
    @solicitation_item = SolicitationItem.new(params[:solicitation_item])

    respond_to do |format|
      if @solicitation_item.save
        flash[:notice] = 'SolicitationItem was successfully created.'
        format.html { redirect_to(@solicitation_item) }
        format.xml  { render :xml => @solicitation_item, :status => :created, :location => @solicitation_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solicitation_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /solicitation_items/1
  # PUT /solicitation_items/1.xml
  def update
    @solicitation_item = SolicitationItem.find(params[:id])

    respond_to do |format|
      if @solicitation_item.update_attributes(params[:solicitation_item])
        flash[:notice] = 'SolicitationItem was successfully updated.'
        format.html { redirect_to(@solicitation_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitation_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitation_items/1
  # DELETE /solicitation_items/1.xml
  def destroy
    @solicitation_item = SolicitationItem.find(params[:id])
    @solicitation_item.destroy

    respond_to do |format|
      format.html { redirect_to(solicitation_items_url) }
      format.xml  { head :ok }
    end
  end
end
