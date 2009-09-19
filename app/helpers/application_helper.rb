# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def return_error(model_symbol, msg="Erro na tentativa de salvar os registros.")
    "<style>.errorExplanation{margin-left:10px;} .errorExplanation ul{list-style:none;margin-top:5px} .errorExplanation li{margin-top:5px}</style><div class='msgError'>#{error_messages_for(model_symbol.to_sym, :header_message => msg, :message => '')}</div>" unless eval("@#{model_symbol}").errors.size==0
  end
  
  #select_options_tag(‘name’,[[‘valor1’,’um’],[‘valor2’,’dois’]],:value=>’dois’) 
  def select_options_tag(name='',select_options={},options={})
      #set selected from value
      selected = ''
      unless options[:value].blank?
        selected = options[:value]
        options.delete(:value)
      end
      select_tag(name,options_for_select(select_options,selected),options)
  end
  
  def page_entries_info(collection, options = {})  
      entry_name = options[:entry_name] || (collection.empty? ? 'entry' : collection.first.class.name.underscore.sub('_', ' '))  
    if collection.total_entries < 2  
      case collection.size  
        when 0; "Nenhum registro encontrado"  
        when 1; "Exibindo <b>1</b> #{entry_name}"  
        else;   "Exibindo <b>todos(as) #{collection.size}</b>"  
      end  
    else  
      %{Total %d #{entry_name}s, Exibindo de <b>%d a %d</b>} % [  
      collection.total_entries,
      collection.offset + 1,  
      collection.offset + collection.length]  
    end  
  end      
  
  #nested attributes
  def nested_attributes_for(form_builder, *args)
    content_for :javascripts do
      content = ""
      args.each do |association|
        content << "var #{association.to_s.singularize}='#{generate_template(form_builder, association.to_sym)}';"
      end
      content
    end
  end

  def generate_html(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    
    form_builder.fields_for(method, options[:object], :child_index => 'NEW_RECORD') do |f|
      locals = { options[:form_builder_local] => f }      
      render(:partial => options[:partial], :locals => locals)
    end 
  end
  
  def generate_template(form_builder, method, options = {})
    escape_javascript generate_html(form_builder, method, options)
  end
  
  def remove_link_unless_new_record(form_builder)
    unless form_builder.object.new_record?
      form_builder.check_box(:_delete) + form_builder.label(:_delete, 'Excluir')
    else    	
		link_to_function(image_tag("admin/ico_cancelar.png"), "$(this).parents('tr').remove();",:alt=>"Remover",:title=>"Remover")		
    end
  end
  # fim nested attributes
  
  #retorna os meses
  def mounths
    [["Janeiro",1],["Fevereiro",2],["Março",3],["Abril",4],["Maio",5],["Junho",6],["Julho",7],["Agosto",8],["Setembro",9],
     ["Outubro",10],["Novembro",11],["Dezembro",12]]
  end 
  
  def type_sale(value)
	  case value
		  when 1
			  "Sem faturamento"
		  when 2
			  "Faturamento incompleto"
		  when 3
			  "Faturado"
	  end  
  end    
  
end
