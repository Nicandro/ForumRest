<?php
class Querys {
	
// SKILLS
	// COUNT
	public static function getAllSkillsCount() {
		return "SELECT count(*) as total FROM Skills";
	}
	
	public static function getSkillForNameCount($page, $off_set, $nome) {
		return "SELECT count(*) " .
				"FROM Skills " .
				"WHERE nome LIKE \"%".$nome."%\"";
	}
	
	public static function getSkillForDominioCount($page, $off_set, $dominio) {
		$sql = "SELECT COUNT(*) FROM (" .
				"SELECT count(*) " . Querys::Skills_Join_ListaDominios_Join_SkillsDominios();
	
		if ( is_numeric($dominio) ) {
			$sql = $sql."WHERE SkillsDominios.id_dominio = ".$dominio." ";
		} else {
			$sql = $sql."WHERE ListaDominios.nome_dominio Like \"%".$dominio."%\" ";
		}
	
		$sql = $sql . "GROUP BY Skills.id_skill" .
					  ") as getCount";
	
		return $sql;
	}
	
	public static function getSkillForNameDiminioCount( $off_set, $page, $nome, $dominio ) {
		$sql = 
			"SELECT COUNT(*) FROM (" .
				"SELECT count(*) " . Querys::Skills_Join_ListaDominios_Join_SkillsDominios();
	
				if ( is_numeric($dominio) ) {
					$sql = $sql."WHERE SkillsDominios.id_dominio = ".$dominio." ";
				} else {
					$sql = $sql."WHERE ListaDominios.nome_dominio Like \"%".$dominio."%\" ";
				}
			
				$sql = $sql."AND Skills.nome LIKE \"%".$nome."%\" " .
							"GROUP BY Skills.id_skill " . 
			") as getCount";
	
		return $sql;
	}
	
	//SELECT
	public static function getAllSkills($page, $off_set) {
		return  "SELECT Skills.id_skill, nome, descricao " .
				"FROM Skills " .
				"LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
	}
	
	public static function getSkillForName($page, $off_set, $nome) {
		return "SELECT Skills.id_skill, nome, descricao " .
			   "FROM Skills " .
			   "WHERE nome LIKE \"%".$nome."%\"" .
			   "LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
	}
	
	public static function getSkillForDominio($page, $off_set, $dominio) {
		$sql = "SELECT Skills.id_skill, nome, descricao " . Querys::Skills_Join_ListaDominios_Join_SkillsDominios();
		
		if ( is_numeric($dominio) ) {
			$sql = $sql."WHERE SkillsDominios.id_dominio = ".$dominio." ";
		} else {
			$sql = $sql."WHERE ListaDominios.nome_dominio Like \"%".$dominio."%\" ";
		}
		
		$sql = $sql . "GROUP BY Skills.id_skill " . 
					  "LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
		
		return $sql;
	}
	
	public static function getSkillForNameDiminio( $off_set, $page, $nome, $dominio ) {
		$sql = "SELECT Skills.id_skill, nome, descricao " . Querys::Skills_Join_ListaDominios_Join_SkillsDominios();
		
		if ( is_numeric($dominio) ) {
			$sql = $sql."WHERE SkillsDominios.id_dominio = ".$dominio." ";
		} else {
			$sql = $sql."WHERE ListaDominios.nome_dominio Like \"%".$dominio."%\" ";
		}
		
		$sql = $sql."AND Skills.nome LIKE \"%".$nome."%\" " .
					"group by Skills.id_skill " . 
					"LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
		
		return $sql;
	}
	
	public static function getSkillById( $id ) {
		return  "SELECT Skills.id_skill, nome, descricao " .
				"FROM Skills " .
				"WHERE id_skill = " . $id;
	}
	
	public static function getDominiosByIdSkill($id) {
		return "SELECT nome_dominio " .
				"FROM ListaDominios JOIN SkillsDominios ON ListaDominios.id_dominio = SkillsDominios.id_dominio " .
				"WHERE SkillsDominios.id_skill = " . $id;
	}
	
	//INSERT
	public static function getInsertSkill($nome, $descricao) {
		return "INSERT INTO Skills (nome, descricao) VALUES ('".$nome."', '".$descricao."')";
	}
	
	//UPDATE
	public static function updateSkillById($id, $nome, $descricao) {
		return "UPDATE Skills SET nome = '".$nome."', descricao = '".$descricao."' WHERE id_skill = ".$id;
	}
	
	//DELETE
	public static function delete_Skill_ById($id) {
		return "DELETE FROM Skills WHERE id_skill=".$id;
	}
	
	public static function delete_SkillsDominios_ByIdSkill($id) {
		return "DELETE FROM SkillsDominios WHERE id_skill=".$id;
	}
	
	public static function delete_ProblemasSkills_ByIdSkill($id) {
		return "DELETE FROM ProblemasSkills WHERE id_skill=".$id;
	}
	
	public static function delete_PessoaSkills_ByIdSkill($id) {
		return "DELETE FROM PessoaSkills WHERE id_skill=".$id;
	}
	
	// Abreviacao de SQL
	private static function Skills_Join_ListaDominios_Join_SkillsDominios() {
		return	"FROM Skills JOIN SkillsDominios ON Skills.id_skill = SkillsDominios.id_skill " .
							"JOIN ListaDominios ON ListaDominios.id_dominio = SkillsDominios.id_dominio ";
	}
	
// PROBLEMAS
	//COUNT
	public static function getProblemasComSkilleStatusCount($id, $problemas_com_status) {
		$sql = "SELECT count(*) FROM ( " . 
			Querys::Problemas_Join_ProblemasSkills() .
			"WHERE ProblemasSkills.id_skill = ".$id." AND Problemas.status = ".$problemas_com_status." " .
			"GROUP BY Problemas.id_problema " .
		") as total";
		return $sql;
	}
	
	//SELECT
	public static function getProblemasComSkilleStatus($id, $problemas_com_status, $page, $off_set) {
		$sql = Querys::Problemas_Join_ProblemasSkills();
		$sql = $sql . "WHERE ProblemasSkills.id_skill = ".$id." AND Problemas.status = ".$problemas_com_status." " .
					  "GROUP BY Problemas.id_problema " . 
					  "LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
		return $sql;
	}
	
	// Abreviacao de SQL
	public static function Problemas_Join_ProblemasSkills() {
		return "SELECT Problemas.id_problema, Problemas.titulo, Problemas.descricao, Problemas.status " .
			   "FROM Problemas JOIN ProblemasSkills ON Problemas.id_problema = ProblemasSkills.id_problema ";
	}
	
// PESSOAS
	//COUNT
	public static function getAllPessoasCount() {
		return "SELECT count(*) FROM Pessoas";
	}
	
	public static function getAllPessoasComSkillCount($id) {
		return "SELECT count(*) " .
			   "FROM Pessoas JOIN PessoaSkills ON Pessoas.id_pessoa = PessoaSkills.id_pessoa " .
			   "WHERE PessoaSkills.id_skill = " . $id;
	}
	
	public static function getAllPessoasComStatusCount($com_status) {
		return "SELECT count(*) FROM ( " .
				   "SELECT count(*) " .
				   "FROM Pessoas JOIN PessoaSkills ON Pessoas.id_pessoa = PessoaSkills.id_pessoa " .
				   "WHERE Pessoas.nivel = " . $com_status . " GROUP BY Pessoas.id_pessoa " .
				") as total;";
	}
	
	public static function getAllPessoasComSkilleStatusCount($com_a_skill, $com_status) {
		return Querys::getAllPessoasComSkillCount($com_a_skill) . " AND Pessoas.nivel = " . $com_status;
	}
	
	//SELECT
	public static function getAllPessoas($page, $off_set) {
		return "SELECT id_pessoa, nome, nivel FROM Pessoas " .
			   "LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
	}
	
	public static function getAllPessoasComSkill($com_a_skill, $page, $off_set) {
		return Querys::Pessoas_Join_PessoaSkills() .
			   "WHERE PessoaSkills.id_skill =".$com_a_skill ." ".
			   "LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
	}
	
	public static function getAllPessoasComStatus($com_status, $page, $off_set) {
		return Querys::Pessoas_Join_PessoaSkills() .
		"WHERE Pessoas.nivel = ".$com_status ." GROUP BY Pessoas.id_pessoa ".
		"LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
	}
	
	public static function getAllPessoasComSkilleStatus($com_a_skill, $com_status, $page, $off_set) {
		return Querys::Pessoas_Join_PessoaSkills() .
			   "WHERE PessoaSkills.id_skill =".$com_a_skill ." AND Pessoas.nivel = ". $com_status . " " . 
			   "LIMIT ".$off_set." OFFSET ".Querys::getOffSet($page, $off_set);
	}
	
	public static function getPessoaById($id) {
		return "SELECT id_pessoa, nome, nivel " .
			   "FROM Pessoas ".
			   "WHERE Pessoas.id_pessoa = " . $id;
	}
	
	public static function getSkillPessoaById($id) {
		return "SELECT nome, descricao ".
			   "FROM Skills JOIN PessoaSkills ON Skills.id_skill = PessoaSkills.id_skill " .
			   "WHERE PessoaSkills.id_pessoa = " . $id;
	}
	
	// INSERT
	public static function getInsertPessoa($nome, $nivel) {
		return "INSERT INTO Pessoas (nome, nivel) VALUES ('".$nome."', '".$nivel."')";
	}
	
	// UPDATE
	public static function updatePessoaById($id, $nome, $nivel) {
		return "UPDATE Pessoas SET nome = '".$nome."', nivel = '".$nivel."' WHERE id_pessoa = ".$id;
	}
	
	// DELETE
	public static function delete_PessoaSkills_byIdPessoa($id) {
		return "DELETE FROM PessoaSkills WHERE id_pessoa = " . $id;
	}
	
	public static function delete_Pessoa_ById($id) {
		return "DELETE FROM Pessoas WHERE id_pessoa = " . $id;
	}
	 
	// Abreviacao de SQL
	private static function Pessoas_Join_PessoaSkills() {
		return "SELECT Pessoas.id_pessoa, nome, nivel " .
			   "FROM Pessoas JOIN PessoaSkills ON Pessoas.id_pessoa = PessoaSkills.id_pessoa ";
	}
	
// Metodos privados
	private static function getOffSet($page, $off_set) {
		return ( $page -1 ) * $off_set;
	}
}