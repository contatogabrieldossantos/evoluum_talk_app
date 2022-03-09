mixin FirebaseErrorHelper {

    
  final Map<String, String> errosMessages = { 
    'error_operation_not_allowed': 'Contas anônima não disponível (Operação indisponível)',
    'error_weak_password' : 'Senha muito fraca',
    'error_invalid_email' : 'E-mail mal formatado',  
    'error_email_already_in_use' : 'E-mail já utilizado por outra conta', 
    'error_invalid_credential' : 'Credencial inválida',
    'error_user_not_found' : 'Nenhum usuário encontrado para o e-mail informado',
    'error_wrong_password' : 'Senha incorreta',
    'rror_user_not_found' : 'Usuário não encontrado ou excluído',
    'error_user_disabled' : 'Usuário desabilitado',
    'error_too_many_requests' : 'Acesso bloqueado por excesso de tentativas',
    'too-many-requests' : 'Acesso bloqueado por excesso de tentativas',
    'too_many_requests' : 'Acesso bloqueado por excesso de tentativas',
    'error_account_exists_with_different_credential' : 'Endereço de e-mail já utilizado',
    'error_invalid_custom_token' : 'Token inválido',
    'error_custom_token_mismatch' : 'Configuração inválida, contate o administrador.',
    'expired_action_code' : 'Código expirado',
    'invalid_action_code' : 'Código de reset inválido',
    'user_disabled' : 'O usuário da senha em questão encontra-se desabilitado',
    'user_not_found' : 'Usuário não encontrado ou excluído',
    'weak_password' : 'A nova senha não é forte o suficiente',
    'invalid-verification-code': 'O código informado é inválido'
  };

  String handleException(String code) {

    print('========================= EXCEPTION CODE: $code');
    if (errosMessages.containsKey(code)) {
      return errosMessages[code]!;
    } else {
      return 'Algo deu errado, favor tentar novamente.';
    }

  }


}