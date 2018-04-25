<?

class ConfiguracaoSip extends InfraConfiguracao  {

 	private static $instance = null;

 	public static function getInstance(){
 	  if (ConfiguracaoSip::$instance == null) {
 	    ConfiguracaoSip::$instance = new ConfiguracaoSip();
 	  }
 	  return ConfiguracaoSip::$instance;
 	}

 	public function getArrConfiguracoes(){
 	  return array(
 	      'Sip' => array(
 	          'URL' => 'http://ANYURL/sip',
 	          'Producao' => false),
 	       
 	      'PaginaSip' => array('NomeSistema' => 'SIP'),

 	      'SessaoSip' => array(
 	          'SiglaOrgaoSistema' => 'ABC',
 	          'SiglaSistema' => 'SIP',
 	          'PaginaLogin' => 'http://ANYURL/sip/login.php',
 	          'SipWsdl' => 'http://ANYURL/sip/controlador_ws.php?servico=wsdl',
 	          'https' => false),
 	       
 	      'BancoSip'  => array(
 	          'Servidor' => 'mysql',
 	          'Porta' => '3306',
 	          'Banco' => 'sip',
 	          'Usuario' => 'sip_user',
 	          'Senha' => 'sip_user',
 	          'Tipo' => 'MySql'), //MySql, SqlServer ou Oracle

				'CacheSip' => array('Servidor' => 'memcache',
						                'Porta' => '11211'),

 	      'HostWebService' => array(
 	          'Replicacao' => array(''), //endereço ou IP da máquina que implementa o serviço de replicação de usuários
 	          'Pesquisa' => array(''), //endereços/IPs das máquinas do SEI
 	          'Autenticacao' => array('')), //endereços/IPs das máquinas do SEI

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
