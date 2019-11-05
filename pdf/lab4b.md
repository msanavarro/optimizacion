---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.1'
      jupytext_version: 1.1.7
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

<!-- #region -->
# Laboratorio 4

Supongamos un conjunto de datos con $p\gg m$ al que se quiere ajustar un modelo lineal. Para encontrar la solución *más simple* dentro de la infinidad posible, elegimos una que tenga el menor número de entradas no cero. Es decir, si definimos

\begin{equation}
    \|\beta\|_0 = \#\{j\in [p] : \beta_j\neq 0\}
\end{equation}

elegimos la beta que minimice $\|\beta\|_0$ y satisfaga $X'\beta=y$.

1. Primero, notar que $\|\beta\|_q \rightarrow \|\beta\|_0$ cuando $q\rightarrow 0^+$, pues las entradas que ya son cero lo siguen siendo sin importar el exponente y las que no son cero se van a uno cuando $q\rightarrow 0^+$. El resultado se sigue sumando límites.


2. Sin embargo, no es una norma porque por ejemplo, $\|(1, 0)\|_0=1$, $\|(-1, 0)\|=1$ y la norma cero de su suma es cero. 

3. Se necesitarían $2^p$ evaluaciones para hacerlo por fuerza bruta incluso sin considerar el error.
<!-- #endregion -->

4. Mostraremos que el problema es NP duro reduciendo el problema de *cubiertas exactas de 3-conjuntos* a uno de esta forma en tiempo polinomial.

Dados los conjuntos $S_j$, construimos una matriz $X\in M_{m\times p}(\mathbb{R})$ con columnas $(x_1 \mid \cdots \mid x_p)$ donde $(x_i)_j = 1$ si y sólo si $j \in S_i$. Esta construcción es $O(mp)$.

Sea $y \in \mathbb{R}^m$ el vector de unos. Si resolvemos el problema de minimizar $(1)$, obtendremos un vector $\beta$ con muchas entradas cero. Al multiplicar por nuestra matriz $X$, las columnas donde $\beta$ sea cero se van a cancelar. 

```python
p = 5
m = 3
```

```python
from scipy import optimize
```

```python
optimize.
```
