<?php
include 'service/SkillService.php';

$app->get('/skills/', function() {
	if ( !empty($_GET["nome"]) ) 	{ $nome = $_GET["nome"]; 	   } else { $nome = null; 	 }
	if ( !empty($_GET["dominio"]) ) { $dominio = $_GET["dominio"]; } else { $dominio = null; }

	if ( !empty($_GET["off_set"]) ) { $off_set = $_GET["off_set"];} else { $off_set = OFF_SET_DEFAULT; }
	if ( !empty($_GET["page"]) ) 	{ $page = $_GET["page"]; 	  } else { $page = PAGE_DEFAULT; }
	
	if ( !is_numeric($off_set) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'off_set'", "O parametro deve ser do tipo numerico.") );
		return;
	} else if ( !is_numeric($page) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'page'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	$off_set = Tools::verificarOffSet($off_set);
	
	if ( $nome == null && $dominio == null ) {
		Tools::formatJson( SkillService::getAllSkills( $off_set, $page) );
		
	} else if ( $nome != null && $dominio == null ) {
		Tools::formatJson( SkillService::getSkillsForName( $off_set, $page, $nome ) );
	
	} else if ( $nome == null && $dominio != null ) {
		Tools::formatJson( SkillService::getSkillsForDominio( $off_set, $page, $dominio) );
		
	} else if ( $nome != null && $dominio != null ) {
		Tools::formatJson( SkillService::getSkillForNameDominio( $off_set, $page, $nome, $dominio) );
	}
});

$app->get('/skills/:id', function($id) {
	if ( !empty($_GET["off_set"]) ) { $off_set = $_GET["off_set"];} else { $off_set = OFF_SET_DEFAULT; }
	if ( !empty($_GET["page"]) ) 	{ $page = $_GET["page"]; 	  } else { $page = PAGE_DEFAULT; }

	if ( !empty( $_GET["problemas_com_status"]) ) { $problemas_com_status = $_GET["problemas_com_status"]; } else { $problemas_com_status = null; }

	if ( !is_numeric($id) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'id'", "O parametro deve ser do tipo numerico.") );
		return;

	} else if ( !is_numeric($off_set) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'off_set'", "O parametro deve ser do tipo numerico.") );
		return;

	} else if ( !is_numeric($page) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'page'", "O parametro deve ser do tipo numerico.") );
		return;
	}

	$off_set = Tools::verificarOffSet($off_set);

	if ( $problemas_com_status != null && !( $problemas_com_status == "true" || $problemas_com_status == "false" ) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'problema_com_status'", "O parametro deve ser do tipo booleano.") );
		return;
	}

	if ( $problemas_com_status == null ) {
		Tools::formatJson(
				array(
						'data'=>SkillService::getSkillById( $id ),
						'Dominio'=>SkillService::getDominioByIdSkill( $id )
				)
		);

	} else if ( $problemas_com_status != null ) {
		Tools::formatJson(
				array(
						'data'=>SkillService::getSkillById( $id ),
						'Problemas envolvidos'=>SkillService::getProblemasComSkilleStatus( $id, $problemas_com_status, $page, $off_set )
				)
		);
	}
});

$app->post('/skills/', function() {
	if ( !empty($_GET["nome"]) ) { $nome = $_GET["nome"];} else { $nome = null; }
	if ( !empty($_GET["descricao"]) ) { $descricao = $_GET["descricao"];} else { $descricao = null; }
	
	if ( $nome == null || $descricao == null ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no cadastro da Skill.", "O nome ou a descrição da Skill não foi enviado na requisição.") );
		return;
	}
	
	Tools::formatJson( SkillService::insertSkill($nome, $descricao) );
});

$app->put('/skills/:id', function($id) {
	if ( !empty($_GET["nome"]) ) { $nome = $_GET["nome"];} else { $nome = null; }
	if ( !empty($_GET["descricao"]) ) { $descricao = $_GET["descricao"];} else { $descricao = null; }
	
	if ( $nome == null || $descricao == null ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro na atualização da Skill.", "O nome ou a descrição da Skill não foi enviado na requisição.") );
		return;
	
	} else if ( !is_numeric($id) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'id'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	Tools::formatJson( SkillService::updateSkillById($id, $nome, $descricao) );
});

$app->delete('/skills/:id', function($id) {
	if ( !is_numeric($id) ) {
		Tools::formatJson( Tools::formatarObjetoRetornoErro( "Erro no formato do parametro 'id'", "O parametro deve ser do tipo numerico.") );
		return;
	}
	
	Tools::formatJson( SkillService::deleteSkillById($id) );
});