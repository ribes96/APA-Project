# general.R

# 1. Llamar a data prepro
      #(Esto nos genera 2 datasets)
# 2. Dividir cada uno de estos 2 datasets en 2/3 de train, 1/3 de test
# 3. Generar 10 datasets usando esos 2/3. Estos tienen la misma proporción True/False
# 4. Para cada uno de los súper-modelos, de damos los 10 datasets, y nos retorna una lista con 10 modelos.
# 5. Para testear un súper-modelo, hacemos predecir a cada uno de sus 10 modelos y elegimos la mayoría.