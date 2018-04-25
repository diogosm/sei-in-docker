<?

class ConfiguracaoSEI extends InfraConfiguracao  {

 	private static $instance = null;

 	public static function getInstance(){
 	  if (ConfiguracaoSEI::$instance == null) {
 	    ConfiguracaoSEI::$instance = new ConfiguracaoSEI();
 	  }
 	  return ConfiguracaoSEI::$instance;
 	}

 	public function getArrConfiguracoes(){
 	  return array(

 	      'SEI' => array(
 	          'URL' => 'http://ANYURL/sei',
 	          'Producao' => false,
 	          'RepositorioArquivos' => '/opt/dados'),

 	      'PaginaSEI' => array(
 	          'NomeSistema' => 'SEI',
 	          'NomeSistemaComplemento' => '',
 	          'LogoMenu' => ''),
 	       
 	      'SessaoSEI' => array(
 	          'SiglaOrgaoSistema' => 'ABC',
 	          'SiglaSistema' => 'SEI',
 	          'PaginaLogin' => 'http://ANYURL/sip/login.php',
 	          'SipWsdl' => 'http://ANYURL/sip/controlador_ws.php?servico=wsdl',
 	          'https' => false),
 	       
 	      'BancoSEI'  => array(
 	          'Servidor' => 'mysql',
 	          'Porta' => '3306',
 	          'Banco' => 'sei',
 	          'Usuario' => 'sei_user',
 	          'Senha' => 'sei_user',
 	          'Tipo' => 'MySql'), //MySql, SqlServer ou Oracle

				'CacheSEI' => array('Servidor' => 'memcache',
					                	'Porta' => '11211'),

 	      'JODConverter' => array('Servidor' => 'http://jod:8080/converter/service'),

 	      'Edoc' => array('Servidor' => 'http://[Servidor .NET]'),
 	       
 	      'Solr' => array(
 	          'Servidor' => 'http://[Servidor Solr]:8080/solr',
 	          'CoreProtocolos' => 'sei-protocolos',
 	          'CoreBasesConhecimento' => 'sei-bases-conhecimento',
 	          'CorePublicacoes' => 'sei-publicacoes'),

				'HostWebService' => array(
						'Edoc' => array('[Servidor .NET]'),
						'Sip' => array('[Servidor PHP]'), //Referências (IP e nome na rede) de todas as máquinas que executam o SIP.
						'Publicacao' => array(), //Referências (IP e nome na rede) das máquinas de veículos de publicação externos cadastrados no SEI.
						'Ouvidoria' => array(), //Referências (IP e nome na rede) da máquina que hospeda o formulário de Ouvidoria personalizado. Se utilizar o formulário padrão do SEI, então configurar com as máquinas dos nós de aplicação do SEI.
				),
 	       
 	      'InfraMail' => array(
						'Tipo' => '1', //1 = sendmail (neste caso não é necessário configurar os atributos abaixo), 2 = SMTP
						'Servidor' => '[Servidor E-Mail]',
						'Porta' => '25',
						'Codificacao' => '8bit', //8bit, 7bit, binary, base64, quoted-printable
						'MaxDestinatarios' => 999, //numero maximo de destinatarios por mensagem
						'MaxTamAnexosMb' => 999, //tamanho maximo dos anexos em Mb por mensagem
						'Seguranca' => 'TLS', //TLS, SSL ou vazio
						'Autenticar' => false, //se true então informar Usuario e Senha
						'Usuario' => 'aaa',
						'Senha' => 'aaa',
						'Protegido' => '' //campo usado em desenvolvimento, se tiver um email preenchido entao todos os emails enviados terao o destinatario ignorado e substituído por este valor (evita envio incorreto de email)
				)
 	  );
 	}
}
?>
