class PaymentFormsController < ApplicationController
  # GET /payment_forms
  # GET /payment_forms.xml
  def index
    per_page = params[:per_page].blank? ? "10" : params[:per_page]
    order = params[:order].blank? || params[:orderDirect].blank? ? "payment_forms.id asc" : "payment_forms.#{params[:order]} #{params[:orderDirect]}"
    conditions = ["name like ?","%#{params[:search]}%"] unless params[:search].blank?
    @payment_forms = PaymentForm.paginate :page => params[:page], :per_page => per_page, :order => order, :conditions => conditions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_forms }
    end
  end

  # GET /payment_forms/1
  # GET /payment_forms/1.xml
  def show
    @payment_form = PaymentForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_form }
    end
  end

  # GET /payment_forms/new
  # GET /payment_forms/new.xml
  def new
    @payment_form = PaymentForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_form }
    end
  end

  # GET /payment_forms/1/edit
  def edit
    @payment_form = PaymentForm.find(params[:id])
  end

  # POST /payment_forms
  # POST /payment_forms.xml
  def create
    @payment_form = PaymentForm.new(params[:payment_form])

    respond_to do |format|
      if @payment_form.save
        flash[:notice] = 'PaymentForm was successfully created.'
        format.html { redirect_to(payment_forms_path) }
        format.xml  { render :xml => @payment_form, :status => :created, :location => @payment_form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_forms/1
  # PUT /payment_forms/1.xml
  def update
    @payment_form = PaymentForm.find(params[:id])

    respond_to do |format|
      if @payment_form.update_attributes(params[:payment_form])
        flash[:notice] = 'PaymentForm was successfully updated.'
        format.html { redirect_to(payment_forms_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_forms/1
  # DELETE /payment_forms/1.xml
  def destroy
    if filters = params[:filters]
      filters.each do |filter|
        PaymentForm.find_by_id(filter).destroy
      end
      flash[:alert] = "Registros excluídos com sucesso!"
    else
      PaymentForm.find_by_id(params[:id]).destroy     
      flash[:alert] = "Registro excluído com sucesso!"
    end

    respond_to do |format|
      format.html { redirect_to(payment_forms_url) }
      format.xml  { head :ok }
    end
  end
end
