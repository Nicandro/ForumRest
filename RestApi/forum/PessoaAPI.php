<?php
include 'service/PessoasService.php';

$app->get('/pessoas/', function() {
	if ( !empty($_GET["com_a_skill"]) ) { $com_a_skill = $_GET["com_a_skill"]; } else { $com_a_skill = null; }
	if ( !empty($_GET["com_status"]) ) { $com_status = $_GET["com_status"]; } else { $com_status = null; }
	
	if ( !empty($_GET["off_set"]) ) { $off_set = $_GET["off_set"];} else { $off_set = OFF_SET_DEFAULT; }
	if ( !empty($_GET["page"]) ) 	{ $page = $_GET["page"]; 	  } else { $page = PAGE_DEFAULT; }
	
	if ( !is_numeric($off_set) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'off_set'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	if ( !is_numeric($page) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'page'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	if ( !empty($com_a_skill) && !is_numeric($com_a_skill) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'com_a_skill'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	if ( !empty($com_status) && !is_numeric($com_status) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'com_status'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	$off_set = Tools::verificarOffSet($off_set);
	
	if ( $com_a_skill == null && $com_status == null ) {
		Tools::formatJson( PessoasService::getAllPessoas($page, $off_set) );
		
	} else if ( $com_a_skill != null && $com_status == null ) {
		Tools::formatJson( PessoasService::getPessoasComSkill($com_a_skill, $page, $off_set) );
	
	} else if ( $com_a_skill == null && $com_status != null ) { 
		Tools::formatJson( PessoasService::getPessoasComStatus($com_status, $page, $off_set) );
	
	} else if ( $com_a_skill != null && $com_status != null ) {
		Tools::formatJson( PessoasService::getPessoasComSkilleStatus($com_a_skill, $com_status, $page, $off_set) );
	}
});

$app->get('/pessoas/:id', function($id) {
	if ( !is_numeric($id) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'id'", "O parametro deve ser do tipo numerico.") );
		return;
	}
		
	Tools::formatJson( PessoasService::getPessoaById($id) );
});

$app->post('/pessoas/', function() {
	if ( !empty($_GET["nome"]) ) { $nome = $_GET["nome"];} else { $nome = null; }
	if ( !empty($_GET["nivel"]) ) { $nivel = $_GET["nivel"];} else { $nivel = null; }

	if ( $nome == null || $nivel == null ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no cadastro da Pessoa.", "O nome ou o nivel da Pessoa não foi enviado na requisição.") );
		return;
	}

	Tools::formatJson( PessoasService::insertPessoa($nome, $nivel) );
});

$app->put('/pessoas/:id', function($id) {
	if ( !empty($_GET["nome"]) ) { $nome = $_GET["nome"];} else { $nome = null; }
	if ( !empty($_GET["nivel"]) ) { $nivel = $_GET["nivel"];} else { $nivel = null; }
	
	if ( $nome == null || $nivel == null ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro na atualização da pessoa.", "O nome ou o nivel da Pessoa não foi enviado na requisição.") );
		return;
	
	} else if ( !is_numeric($id) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'id'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	Tools::formatJson( PessoasService::updatePessoaById($id, $nome, $nivel) );
});

$app->delete('/pessoas/:id', function($id) {
	if ( !is_numeric($id) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'id'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	Tools::formatJson( PessoasService::deletePessoaById( $id ) );
});