while True:
    nome = input('Digite o nome: ')
    idade = int(input('Digite a idade: '))
    salario = float(input('Digite o salario: '))
    input()
    sexo = input('Digite o sexo: ')
    estado_civil = input('Digite o estado civil: ')
    if len(nome) > 3:
        if 0 < idade <= 150:
            if salario > 0.0:
                if sexo == 'f' or sexo == 'm':
                    if estado_civil in ['s', 'c', 'v', 'd']:
                        break
    else:
        print('algum dado foi digitado incorretamente...')
        continue
print('OS DADOS DIGITADOS')
print('-' * 20)
print(f'NOME - {nome}')
print(f'IDADE - {idade}')
print(f'SALARIO - {salario}')
print(f'SEXO - {sexo}')
print(f'ESTADO CIVIL - {estado_civil}')
print('-' * 20)
