*** Variables ***
# URLs
${BASE_URL}             https://www.saucedemo.com

# Credenciais válidas
${VALID_USER}           standard_user
${VALID_PASSWORD}       secret_sauce

# Credenciais inválidas
${INVALID_USER}         invalid_user
${INVALID_PASSWORD}     wrong_password

# Usuários especiais
${LOCKED_USER}          locked_out_user
${PERFORMANCE_USER}     performance_glitch_user

# Tempo de espera padrão
${TIMEOUT}              20s
${IMPLICIT_WAIT}        5s

# Mensagens esperadas
${MSG_LOGIN_ERROR}      Epic sadface: Username and password do not match any user in this service
${MSG_LOCKED_ERROR}     Epic sadface: Sorry, this user has been locked out.
${MSG_CHECKOUT_DONE}    Thank you for your order!
