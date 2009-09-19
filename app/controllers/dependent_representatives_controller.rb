class DependentRepresentativesController < ApplicationController
  # GET /dependent_representatives
  # GET /dependent_representatives.xml
  def index
    @dependent_representatives = DependentRepresentative.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dependent_representatives }
    end
  end

  # GET /dependent_representatives/1
  # GET /dependent_representatives/1.xml
  def show
    @dependent_representative = DependentRepresentative.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dependent_representative }
    end
  end

  # GET /dependent_representatives/new
  # GET /dependent_representatives/new.xml
  def new
    @dependent_representative = DependentRepresentative.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dependent_representative }
    end
  end

  # GET /dependent_representatives/1/edit
  def edit
    @dependent_representative = DependentRepresentative.find(params[:id])
  end

  # POST /dependent_representatives
  # POST /dependent_representatives.xml
  def create
    @dependent_representative = DependentRepresentative.new(params[:dependent_representative])

    respond_to do |format|
      if @dependent_representative.save
        flash[:notice] = 'DependentRepresentative was successfully created.'
        format.html { redirect_to(@dependent_representative) }
        format.xml  { render :xml => @dependent_representative, :status => :created, :location => @dependent_representative }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dependent_representative.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dependent_representatives/1
  # PUT /dependent_representatives/1.xml
  def update
    @dependent_representative = DependentRepresentative.find(params[:id])

    respond_to do |format|
      if @dependent_representative.update_attributes(params[:dependent_representative])
        flash[:notice] = 'DependentRepresentative was successfully updated.'
        format.html { redirect_to(@dependent_representative) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dependent_representative.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dependent_representatives/1
  # DELETE /dependent_representatives/1.xml
  def destroy
    @dependent_representative = DependentRepresentative.find(params[:id])
    @dependent_representative.destroy

    respond_to do |format|
      format.html { redirect_to(dependent_representatives_url) }
      format.xml  { head :ok }
    end
  end
end
