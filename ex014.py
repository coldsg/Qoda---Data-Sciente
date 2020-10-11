pais_A = 80000
pais_B = 2000000
crescimento_A = 0.030
crescimento_B = 0.015
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
