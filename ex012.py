nome = senha = ''
cont = 0
while True:
    if cont >= 1:
        print('Você digitou usuário e senha iguais')
    nome = input('Digite o nome do usuário: ')
    senha = input('Digite a senha: ')
    if nome != senha:
        break
    cont += 1
print('Senha aceita')
