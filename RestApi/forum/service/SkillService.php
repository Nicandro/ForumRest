<?php

class SkillService {
	public static function getAllSkills( $off_set, $page ) {
		$total_paginas = Tools::CalcularTotalDePaginas(Querys::getAllSkillsCount(), $off_set);
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getAllSkills($page, $off_set) );
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno($stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getSkillsForName( $off_set, $page, $nome ) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getSkillForNameCount($page, $off_set, $nome), $off_set );
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getSkillForName($page, $off_set, $nome) );
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno( $stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getSkillsForDominio( $off_set, $page, $dominio ) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getSkillForDominioCount($page, $off_set, $dominio), $off_set );
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getSkillForDominio($page, $off_set, $dominio));
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno( $stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getSkillForNameDominio( $off_set, $page, $nome, $dominio ) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getSkillForNameDiminioCount($off_set, $page, $nome, $dominio), $off_set );
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getSkillForNameDiminio($off_set, $page, $nome, $dominio));
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno( $stmt->fetchAll(), $page, $total_paginas, $off_set );
	}
	
	public static function getSkillById( $id ) {
		$stmt = DB::prepare( Querys::getSkillById($id) );
		$stmt->execute();
		
		return $stmt->fetchObject();
	}
	
	public static function getDominioByIdSkill( $id ) {
		$stmt = DB::prepare( Querys::getDominiosByIdSkill($id) );
		$stmt->execute();
		
		return $stmt->fetchAll();
	}
	
	public static function getProblemasComSkilleStatus( $id, $problemas_com_status, $page, $off_set ) {
		$total_paginas = Tools::CalcularTotalDePaginas( Querys::getProblemasComSkilleStatusCount($id, $problemas_com_status), $off_set );
		$page = Tools::verificarPaginaAtual($total_paginas, $page);
		
		$stmt = DB::prepare( Querys::getProblemasComSkilleStatus($id, $problemas_com_status, $page, $off_set) );
		$stmt->execute();
		
		return Tools::formatarObjetoRetorno($stmt->fetchAll(), $page, $total_paginas, $off_set);
	}
	
	public static function insertSkill($nome, $descricao) {
		$stmt = DB::prepare( Querys::getInsertSkill($nome, $descricao) );
		$stmt->execute();
		
		return SkillService::getSkillById( DB::lastInsertId() );
	}
	
	public static function updateSkillById($id, $nome, $descricao) {
		$skill = SkillService::getSkillById($id);
		
		if ( $skill == null ) {
			return array('Status:'=>'Nenhum skills foi encontrado na base de dados com o id informado.');
		}
		
		$stmt = DB::prepare( Querys::updateSkillById( $id, $nome, $descricao) );
		$stmt->execute();
		
		return SkillService::getSkillById( $id );
	}
	
	public static function deleteSkillById($id) {
		$skill = SkillService::getSkillById($id);
		
		if ( $skill == null ) {
			return array('Status:'=>'Nenhum skills foi encontrado na base de dados com o id informado.');
		}
		
		$stmt = DB::prepare( Querys::delete_SkillsDominios_ByIdSkill($id) ); $stmt->execute();
		$stmt = DB::prepare( Querys::delete_ProblemasSkills_ByIdSkill($id) ); $stmt->execute();
		$stmt = DB::prepare( Querys::delete_PessoaSkills_ByIdSkill($id) ); $stmt->execute();
		
		$stmt = DB::prepare( Querys::delete_Skill_ById($id) );
		$status_delete = $stmt->execute();
		
		if ( $status_delete ) {
			return array('Status:'=>'Objeto excluido.',
						 'Skills excluido'=>$skill
			);
		} else {
			return array('Status:'=>'O objeto excluido não pode ser excluido.',
					'Skills excluido'=>$skill
			);
		}
	}
}