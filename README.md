# Geospatial analyses and cartography with R

This presentation was developed for the Quebec Center for Biodiversity Science (QCBS) R Symposium.

Workshop slides : https://mhbrice.github.io/Rspatial/

Workshop script : https://mhbrice.github.io/Rspatial/Rspatial_script.html

# Abstract

The processing and analysis of spatial data under R goes back more than a decade ago. With a wide range of packages, R enables advanced geospatial statistics, modeling and visualization. But, why use R to manipulate spatial objects when there are very powerful and specialized tools (like ArcGIS or QGIS)? The answer lies in task automation and reproducibility of the entire workflow (importation, modification of geometry, statistical analysis, cartography, exportation).

Until recently, spatial analysis in R has largely relied on the package `sp` and its helper packages, `rgdal` and `rgeos`. Recently, the `sf` package allows R users to implement the ISO standard for access and manipulation of spatial vector data, simple features. One of the advantages of sf over the `sp` family is the use of data.frames and the simplification of data structures for spatial geometries, making spatial data handling easier and faster. The `sf` package does not support yet raster data. However, the `raster` package has functions for creating, reading, manipulating, and writing raster data and can also handle massive datasets. During this workshop, we will see how to use the different packages of R (notably `sf` and `raster`) to manipulate and analyze spatial objects and create nice and informative maps. The workshop is intended as an overview of R's functionalities in the field of spatial analysis, with the aim of making the analysis of geospatial data more accessible to all within the framework of a reproducible workflow.

# Résumé

La prise en charge du traitement et de l'analyse des données spatiales sous R remonte à plus d’une dizaine d’années. Avec une large gamme de packages, R permet de réaliser des statistiques géospatiales avancées, de la modélisation et de la visualisation. Mais, pourquoi utiliser R pour manipuler des objets spatiaux quand il existe des outils spécialisés très puissants (comme ArcGIS ou QGIS) ? La réponse se trouve dans l’automatisation des tâches et la reproductibilité de l’ensemble du flux de travail (importation, modification de la géométrie, analyse statistique, cartographie, exportation).

Jusqu’à aujourd’hui, l’analyse spatiale en R a largement reposé sur le package `sp` et ses associés, `rgdal` et `rgeos`. Depuis peu, le package `sf` permet d’implémenter le standard ISO pour l'accès et l'échange de données spatiales, les simple features. Un des avantages de `sf` sur la famille `sp` est l'utilisation de data.frames et la simplification des structures de données pour les géométries spatiales, rendant la manipulation plus facile et plus rapides. Le package `sf` ne supporte pas encore les données raster. Cependant, le package `raster` offre des fonctions pour créer, lire, manipuler et écrire des données raster et peut également gérer des objects très volumineux. Durant cet atelier, nous verrons comment utiliser les différents packages de R (notamment `sf`et `raster`) pour manipuler et analyser des objets spatiaux, puis créer de belles cartes informatives. L’atelier se propose comme un survol des fonctionnalités de R dans le domaine des analyses spatiales, avec pour objectif de rendre l'analyse des données géographiques plus accessible à tous dans le cadre d'un flux de travail reproductible.

# Tout-doux list

[] add an example of raster extraction for categorical data
