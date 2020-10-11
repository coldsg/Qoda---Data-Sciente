n1 = float(input('Digite a primeira nota: '))
n2 = float(input('Digite a segunda nota: '))
media = (n1 + n2) / 2
if media >= 7:
    print(f'Media {media} aluno aprovado ')
elif media == 10:
    print(f'Media {media} aluno aprovado com distinção ')
else:
    print(f'Media {media} aluno reprovado')

