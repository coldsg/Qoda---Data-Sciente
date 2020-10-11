def somaImposto(taxaImposto=0.0, valor=0.0):
    res = valor + (taxaImposto * valor)
    return res


print(somaImposto(0.1, 200))
