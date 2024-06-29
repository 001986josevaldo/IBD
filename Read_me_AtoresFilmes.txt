SELECT A.ActorsName, MD.MoviesName, SD.SeriesData
FROM ActorMovies AM
JOIN Actors A ON A.ActorsID = AM.ActorsID
JOIN MoviesData MD ON MD.MoviesID = AM.MoviesID
JOIN ActorSeries ASR ON A.ActorsID = ASR.ActorsID
JOIN SeriesData SD ON SD.SeriesID = ASR.SeriesID;


Este SELECT combina informações de duas tabelas relacionadas, 
ActorMovies e ActorSeries, para obter os nomes dos atores, 
os nomes dos filmes e os nomes das séries em que os atores estão envolvidos. Aqui está a explicação detalhada:

Seleção das Colunas:

A.ActorsName: Seleciona o nome do ator da tabela Actors, utilizando o alias A para referenciar a tabela.
MD.MoviesName: Seleciona o nome do filme da tabela MoviesData, utilizando o alias MD para referenciar a tabela.
SD.SeriesData: Seleciona o nome da série da tabela SeriesData, utilizando o alias SD para referenciar a tabela.
Cláusula FROM e JOINs:

FROM ActorMovies AM: Define a tabela principal a partir da qual os dados serão selecionados.
JOIN Actors A ON A.ActorsID = AM.ActorsID: Liga a tabela Actors à ActorMovies usando a chave estrangeira ActorsID, 
garantindo que cada ator tenha uma correspondência na tabela de associação de atores a filmes.
JOIN MoviesData MD ON MD.MoviesID = AM.MoviesID: Liga a tabela MoviesData à ActorMovies usando a chave estrangeira MoviesID, 
garantindo que cada filme tenha uma correspondência na tabela de associação de atores a filmes.
JOIN ActorSeries ASR ON A.ActorsID = ASR.ActorsID: Liga a tabela ActorSeries à Actors usando a chave estrangeira ActorsID,
garantindo que cada ator tenha uma correspondência na tabela de associação de atores a séries.
JOIN SeriesData SD ON SD.SeriesID = ASR.SeriesID: Liga a tabela SeriesData à ActorSeries usando a chave estrangeira SeriesID, 
garantindo que cada série tenha uma correspondência na tabela de associação de atores a séries.

Propósito:

Este SELECT combina dados de duas tabelas de muitos-para-muitos (ActorMovies e ActorSeries) 
com suas respectivas tabelas de referência (MoviesData e SeriesData) para obter uma lista de atores, 
junto com os títulos dos filmes e das séries em que eles participam.
Ele é útil para consultas que exigem informações detalhadas sobre a participação de atores em filmes e séries, 
permitindo uma visão abrangente dos projetos em que cada ator está envolvido.
Essa consulta é essencial para análises que envolvem relacionamentos complexos entre atores, filmes e séries, 
fornecendo uma visão integrada dos dados armazenados nas tabelas relacionadas do banco de dados.


SELECT A.ActorsName, MD.MoviesName AS WorkName
FROM ActorMovies AM
JOIN Actors A ON A.ActorsID = AM.ActorsID
JOIN MoviesData MD ON MD.MoviesID = AM.MoviesID
UNION
SELECT A.ActorsName, SD.SeriesData AS WorkName
FROM ActorSeries ASR
JOIN Actors A ON A.ActorsID = ASR.ActorsID
JOIN SeriesData SD ON SD.SeriesID = ASR.SeriesID;

O SELECT mostra o nome do ator, o nome do filme na tabela de filmes (MoviesData), 
e o nome da série na tabela de séries (SeriesData). Aqui está o SELECT corrigido e explicado:
A.ActorsName: É o nome do ator, obtido da tabela Actors.
MD.MoviesName AS WorkName: É o nome do filme, obtido da tabela MoviesData. 
O AS WorkName é um alias opcional para renomear a coluna resultante na consulta.
SD.SeriesData AS WorkName: É o nome da série, obtido da tabela SeriesData. 
Também é renomeado como WorkName para consistência na união dos resultados.
Portanto, o SELECT combina os dados das tabelas ActorMovies e ActorSeries para listar os atores e o título dos filmes e séries 
em que eles atuam, respectivamente.