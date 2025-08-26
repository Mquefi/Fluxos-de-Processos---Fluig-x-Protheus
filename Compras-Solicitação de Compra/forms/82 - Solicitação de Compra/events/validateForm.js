function validateForm(form){

	var CURRENT_STATE = getValue('WKNumState');
	var NEXT_STATE = getValue("WKNextState");
	var COMPLETED_TASK = (getValue("WKCompletTask")=="true");
    var errorMsg = '';
	
	log.info('##### Solicitação de Compra - validateForm - CURRENT_STATE: ' + CURRENT_STATE + ' - NEXT_STATE: ' + NEXT_STATE + '- COMPLETED_TASK: ' + COMPLETED_TASK) 
	 
	if(COMPLETED_TASK){
		if(CURRENT_STATE == 3 || CURRENT_STATE == 6){
			if(form.getValue('gCusto') == "6" && (form.getValue('descMedicao') == "" || form.getValue('descMedicao') == null)){
				errorMsg += "O campo 'Desconta medição?' é obrigatório!<br />";
			}
			if(form.getValue('gCusto') == "6" && (form.getValue('numOS') == "" || form.getValue('numOS') == null)){
				errorMsg += "O campo 'N° Ordem Serviço' é obrigatório!<br />";
			}
	        if(form.getValue('gCusto') == "" || form.getValue('gCusto') == null){
	            errorMsg += "O campo 'Aplicação do Custo' é obrigatorio.\n";
	        }
	        /*
	        if(form.getValue('descMedicao') == "" || form.getValue('descMedicao') == null){
	            errorMsg += "O campo 'Desconta medição?' é obrigatorio.\n";
	        }
	        if(form.getValue('descMedicao') == "sim" && (form.getValue('descFor') == "" || form.getValue('descFor') == null)){
	            errorMsg += "O campo 'CNPJ Forn. à Descontar' é obrigatório!<br />";
	        }
	        if(form.getValue('tiposol') == "" || form.getValue('tiposol') == null){
	            errorMsg += "O campo Tipo é obrigatório!<br />";
	        }
	        if(form.getValue('modsol') == "" || form.getValue('modsol') == null){
	            errorMsg += "O campo Modalidade é obrigatório!<br />";
	        }*/
	        if(form.getValue('entrega') == "" || form.getValue('entrega') == null){
	            errorMsg += "O campo Local de Entrega é obrigatório!<br />";
	        }
		}
		
		if(errorMsg != ''){
			throw '\n'+ errorMsg
		}
	}
}