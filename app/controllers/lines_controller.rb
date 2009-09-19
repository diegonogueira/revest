class LinesController < ApplicationController
  # GET /lines
  # GET /lines.xml
  def index  
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "lines.id asc" : "lines.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @lines = Line.paginate :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lines }
    end
  end

  # GET /lines/1
  # GET /lines/1.xml
  def show
    @line = Line.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/new
  # GET /lines/new.xml
  def new
    @line = Line.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line }
    end
  end

  # GET /lines/1/edit
  def edit
    @line = Line.find(params[:id])
  end

  # POST /lines
  # POST /lines.xml
  def create
    @line = Line.new(params[:line])

    respond_to do |format|
      if @line.save
        flash[:notice] = 'Line was successfully created.'
        format.html { redirect_to(lines_path) }
        format.xml  { render :xml => @line, :status => :created, :location => @line }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lines/1
  # PUT /lines/1.xml
  def update
    @line = Line.find(params[:id])

    respond_to do |format|
      if @line.update_attributes(params[:line])
        flash[:notice] = 'Line was successfully updated.'
        format.html { redirect_to(lines_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        Line.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      Line.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(lines_url) }
      format.xml  { head :ok }
    end
  end
end
