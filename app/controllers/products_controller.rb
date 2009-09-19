class ProductsController < ApplicationController

  before_filter :load_lines, :only=>[:new,:create,:edit,:update]  

  # GET /products
  # GET /products.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "products.id asc" : "products.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @products = Product.paginate :include => :line, :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
	 @product.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(products_path) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(products_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        Product.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      Product.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def load_lines
	  @lines = Line.find(:all).collect{|i|[i.name,i.id]}
  end
  
end
