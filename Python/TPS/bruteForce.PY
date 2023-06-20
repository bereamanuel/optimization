import numpy as np

def bruteForce(graph, numVertices):
#  Funcion para implementar el problema del viajante por fuerza bruta.
# INPUT:
#  	- Graph (Matrix[Num x Num]): Matriz de adyacencia nxn
# 	- numVertices (Integer): Numero de vertices
# 	- startVertex (Integer): Vertice por el que queremos empezar. 
# 								Si selecionamos 0 empezara de manera indiferente
# Output:
# 	- bestPath (Vector[Int]): Vector con el ciclo hamiltoniano solucion
# 	- minCost (Numeric): Coste del ciclo hamiltoniano
    import numpy as np
    from itertools import permutations
    from math import inf

    minCost = inf
    bestPath = []

    for i in permutations(range(numVertices)):
        permutation = [j for j in i]  + [i[0]]
        cost = 0
        for j in range(numVertices):

            currentVertex = permutation[j]
            nextVertex = permutation[j + 1]
            
            cost = cost + graph[currentVertex][nextVertex]
        if cost < minCost :
            minCost = cost
            bestPath = permutation
    
    return([bestPath,minCost])




graph = np.array([[0,3,3,4,99,4],[3,0,2,99,3,6],[3,2,0,1,2,99],[4,99,1,0,6,99],[99,3,2,6,0,2],[4,6,99,99,2,0]])
numVertices = 6

A = bruteForce(graph, numVertices)

print(A)