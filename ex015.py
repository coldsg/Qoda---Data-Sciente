pais_A = int(input('Digite a população da cidade A: '))
pais_B = int(input('Digite a população da cidade B: '))
crescimento_A = float(input('Digite a taxa de crescimento A: '))
crescimento_B = float(input('Digite a taxa de crescimento B: '))
anos = 0
while True:
    pais_A = pais_A + (pais_A * crescimento_A)
    pais_B = pais_B + (pais_B * crescimento_B)
    anos += 1
    if pais_A >= pais_B:
        break
    else:
        continue
print(f'O pais A passou o pais B com {pais_A:.0f} habitantes em {anos} anos')
print(f'Enquanto o pais B ficou com {pais_B:.0f} habitantes ')
