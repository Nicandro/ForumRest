<?php
class PessoasService {
	public static function getAllPessoas( $page, $off_set ) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getAllPessoasCount(), $off_set);
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
	
		$stmt = DB::prepare( Querys::getAllPessoas($page, $off_set) );
		$stmt->execute();
	
		return Tools::formatarObjetoRetorno($stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getPessoasComSkill( $com_a_skill, $page, $off_set ) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getAllPessoasComSkillCount($com_a_skill), $off_set);
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getAllPessoasComSkill($com_a_skill, $page, $off_set) );
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno($stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getPessoasComStatus($com_status, $page, $off_set) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getAllPessoasComStatusCount($com_status), $off_set);
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getAllPessoasComStatus($com_status, $page, $off_set) );
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno($stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getPessoasComSkilleStatus($com_a_skill, $com_status, $page, $off_set) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getAllPessoasComSkilleStatusCount($com_a_skill, $com_status), $off_set);
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getAllPessoasComSkilleStatus($com_a_skill, $com_status, $page, $off_set) );
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno($stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getPessoaById($id) {
		$stmt_pessoa = DB::prepare( Querys::getPessoaById($id) );
		$stmt_pessoa->execute();
		
		$pessoa = $stmt_pessoa->fetchObject();
		
		if ( $pessoa == null ) {
			return Tools::formatarObjetoRetornoErro( "Pessoa não encontrada.", "O id de pessoa informado não existe na base de dados.");
		}
		
		$stmt_skills_pessoa = DB::prepare( Querys::getSkillPessoaById($id) );
		$stmt_skills_pessoa->execute();
		
		$skill = $stmt_skills_pessoa->fetchAll();
		
		return array('Pessoa'=>$pessoa, 'Skills'=>$skill);
	}
	
	public static function insertPessoa($nome, $nivel) {
		$stmt = DB::prepare( Querys::getInsertPessoa($nome, $nivel) );
		$stmt->execute();
		
		return PessoasService::getPessoaById( DB::lastInsertId() );
	}
	
	public static function deletePessoaById( $id ) {
		$pessoa = PessoasService::getPessoaById($id);

		if ( $pessoa == null ) {
			return array('Status:'=>'Nenhuma Pessoa foi encontrado na base de dados com o id informado.');
		}
		
		$stmt = DB::prepare( Querys::delete_PessoaSkills_byIdPessoa($id) ); $stmt->execute();
		
		$stmt = DB::prepare( Querys::delete_Pessoa_ById($id) );
		$status_delete = $stmt->execute();
		
		if ( $status_delete ) {
			return array('Status:'=>'Done.',
					'Pessoa excluido'=>$pessoa
			);
		} else {
			return array('Status:'=>'O objeto excluido não pode ser excluido.',
					'Pessoa excluido'=>$pessoa
			);
		}
	}
	
	public static function updatePessoaById($id, $nome, $nivel) {
		$pessoa = PessoasService::getPessoaById($id);
		
		if ( $pessoa == null ) {
			return array('Status:'=>'Nenhum pessoa foi encontrado na base de dados com o id informado.');
		}
		
		$stmt = DB::prepare( Querys::updatePessoaById($id, $nome, $nivel) );
		$stmt->execute();
		
		return PessoasService::getPessoaById($id);
	}
}