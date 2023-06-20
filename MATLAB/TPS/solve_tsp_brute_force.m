function [bestPath, minCost] = solve_tsp_brute_force(graph, numVertices, startVertex)
% Funcion para implementar el problema del viajante por fuerza bruta.
%INPUT:
% 	- Graph (Matrix[Num x Num]): Matriz de adyacencia nxn
%	- numVertices (Integer): Numero de vertices
%	- startVertex (Integer): Vertice por el que queremos empezar. 
%								Si selecionamos 0 empezara de manera indiferente
%Output:
%	- bestPath (Vector[Int]): Vector con el ciclo hamiltoniano solucion
%	- minCost (Numeric): Coste del ciclo hamiltoniano
    vertices = 1:numVertices;
    if startVertex == 0
        permutations = perms(vertices);
    else
        permutations = perms(vertices(vertices ~= startVertex));
        permutations = [repmat(startVertex, size(permutations, 1), 1), permutations];
    end
    minCost = Inf;
    bestPath = [];
    for i = 1:size(permutations, 1)
        permutation = [permutations(i, :), permutations(i, 1)];  % Añadir el primer vértice al final para cerrar el ciclo
        cost = 0;
        for j = 1:numVertices
            currentVertex = permutation(j);
            nextVertex = permutation(j + 1);
            cost = cost + graph(currentVertex, nextVertex);
        end
        if cost < minCost
            minCost = cost;
            bestPath = permutation;
        end
    end
end