
descrição das três etapas de normalização de tabelas

1ª Forma Normal (1NF)

Objetivo: Eliminar grupos repetidos.
Regras:
Cada tabela deve ter uma chave primária.
Todos os valores das colunas devem ser atômicos (ou seja, indivisíveis).
Cada coluna deve conter apenas um valor por linha.
Todos os valores em uma coluna devem ser do mesmo tipo de dados.
Exemplo:
Se uma tabela armazena múltiplos números de telefone em uma célula, 
ela deve ser dividida para que cada número esteja em uma linha separada.

2ª Forma Normal (2NF)

Objetivo: Eliminar dependências parciais.
Regras:
A tabela deve estar na 1ª Forma Normal.
Todos os atributos não-chave devem depender da chave primária inteira, não apenas parte dela.
As dependências parciais ocorrem apenas em tabelas com chaves compostas.
Exemplo:
Se uma tabela de vendas tem OrderID e ProductID como chave composta, 
mas o nome do produto depende apenas de ProductID, essa dependência parcial deve ser removida dividindo a tabela.

3ª Forma Normal (3NF)

Objetivo: Eliminar dependências transitivas.
Regras:
A tabela deve estar na 2ª Forma Normal.
Nenhum atributo não-chave deve depender de outro atributo não-chave (dependência transitiva).
Todos os atributos não-chave devem depender apenas da chave primária.
Exemplo:
Se uma tabela de empregados inclui colunas para EmployeeID, DepartmentID, DepartmentName, e EmployeeName, 
e DepartmentName depende de DepartmentID, DepartmentName deve ser movido para uma tabela separada de departamentos.

Resumo

1NF: Elimina grupos repetidos, garante atomicidade.
2NF: Elimina dependências parciais, assegura que todos os atributos dependem da chave primária completa.
3NF: Elimina dependências transitivas, assegura que os atributos não dependem de outros atributos não-chave.

Essas etapas ajudam a reduzir redundâncias e anomalias, melhorando a integridade dos dados.

