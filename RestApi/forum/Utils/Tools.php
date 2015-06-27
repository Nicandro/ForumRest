<?php

class Tools {
	
	public static function formatJson($obj) {
		echo json_encode($obj);
	}
	
	/* Calcula e retorna o numero total de paginas dada uma consulta */
	public static function CalcularTotalDePaginas($sql, $off_set) {
		$stmt_totalPage = DB::prepare($sql);
		$stmt_totalPage->execute();
		$total_itens = $stmt_totalPage->fetchColumn(0);

		$total_paginas = $total_itens / $off_set;
		
		if ( $total_paginas < 1 ) {
			$total_paginas = number_format(1);
		
		} else {
			if ( $total_paginas > number_format($total_paginas, 0) ) {
				$total_paginas = number_format($total_paginas, 0) + 1;
			} else {
				$total_paginas = number_format($total_paginas, 0);
			}
		}
		
		return $total_paginas;
	}
	
	/* Verifica a pagina informada e altera seu valor caso a mesma esteja fora do range permitido */
	public static function verificarPaginaAtual( $total_paginas, $page ) {
		$page = number_format($page, 0);
		
		if ( $page < 1 ) {
			$page = 1;
		
		} else if ( $page > $total_paginas ) {
			// TODO: Utilizar o parseInt() no lugar do number_format
			$page = number_format($total_paginas, 0);
		}
		
		return $page;
	}
	
	public static function verificarOffSet( $off_set ) {
		if ( $off_set < 1 ) { $off_set = 1;	}
		return $off_set;
	}
	
	/* Formata o objeto de retorno quando tudo ocorre bem */
	public static function formatarObjetoRetorno( $data, $page, $total_paginas, $off_set ) {
		return array( 
			'response' => $data,
			'page' => $page,
			'max page'=> $total_paginas,
			'off set' => $off_set
		);
	}
	
	public static function formatarObjetoRetornoErro( $titulo, $msg ) {
		return array(
			'Erro'=>$titulo,
			'Detalhe'=>$msg
		);
	}
}