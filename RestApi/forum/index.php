<?php
	require '../Slim/Slim/Slim.php';
	\Slim\Slim::registerAutoloader();
	$app = new \Slim\Slim();
	$app->response()->header('Content-Type', 'application/json;charset=utf-8');
	
	include 'config.php';
	include 'DB.php';
	include 'Utils/Tools.php';
	include 'Utils/Querys.php';
	include 'SkillAPI.php';
	include 'PessoaAPI.php';
	
	$app->get('/get_token', function() {
		Tools::formatJson( ACCESS_TOKEN );
	});
	
	$app->run();
	$teste = $app;