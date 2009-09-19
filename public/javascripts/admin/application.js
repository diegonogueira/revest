/* funções globais */

//função que redireciona para outra página
function redireciona(url) {
	window.location.href = url;	
}

//exibe popup padrão para janelas
function exibirPopup(url, nome, centralizado, opcoes) {
	
	var posX, posY;
	
	posX = 0;
	posY = 0;
	
	if ( centralizado ) {
		posX = ((screen.width/2)-500);
		posY = ((screen.height/2)-350);	
	}
	
	if (opcoes == "" || opcoes == 0) {
		opcoes = ",status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,directories=no";	
	}
	
	window.open(url, nome, "height=650,width=900,left=" + posX + ",top=" + posY + ",status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,directories=no");	
}


//seleciona todas as checkbox
function selecionarTodos(contexto){
	$(contexto).each( function() {		  
	   this.checked = !this.checked;
	});
}

function pesquisar(){
	$("#formFilter").submit();
}

function submit(){
	$("#formSubmit").submit();
}


//excluir selecionados
function excluirItensSelecionados(form, contexto){
	
	var ctr = false;
	
	$(contexto).each( function() {		  
	   if (this.checked) {
			ctr = true;
	   }
	});
	
	if (ctr == true){
		if ( confirm("Tem certeza que deseja apagar os registros selecionados?") ) {
			$(form).submit();
		}		
	}else{
		alert('Nenhum registro selecionado para a exclusão!')
	}	

}


//executa funções quando o documento estiver pronto
$(document).ready(function(){					
/*
	$(".mascaraData").mask("99/99/9999", {placeholder:" "});
	$(".mascaraHora").mask("99:99", {placeholder:" "});
	$(".mascaraHoraCompleta").mask("99:99:99", {placeholder:" "});
	$(".mascaraTelefone").mask("(99)9999-9999", {placeholder:" "});
	$(".mascaraCPF").mask("999.999.999-99", {placeholder:" "});
	$(".mascaraCNPJ").mask("99.999.999/9999-99", {placeholder:" "});
	$(".mascaraCEP").mask("99999-999", {placeholder:" "});
	$(".marcaraFloat").maskMoney({symbol:"",decimal:",",thousands:"."});
	$(".mascaraDinheiro").maskMoney({symbol:"R$",decimal:",",thousands:"."});
	$(".mascaraFloatPrecisao1").maskMoney({symbol:"",decimal:",",thousands:"",precision:1});
	$(".mascaraFloatPrecisao2").maskMoney({symbol:"",decimal:",",thousands:"",precision:2});
	$(".mascaraFloatPrecisao3").maskMoney({symbol:"",decimal:",",thousands:"",precision:3});
	$(".mascaraFloatPrecisao4").maskMoney({symbol:"",decimal:",",thousands:"",precision:4});
	$(".mascaraFloatPrecisao5").maskMoney({symbol:"",decimal:",",thousands:"",precision:5});
	$(".mascaraFloatPrecisao6").maskMoney({symbol:"",decimal:",",thousands:"",precision:6});
*/
});