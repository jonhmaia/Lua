
-- Função para ler alunos do teclado
function lerAlunos()
  local alunos = {} -- Array para armazenar os alunos

  print("Digite o nome dos alunos (digite 'fim' para encerrar):")
  local nome = io.read() -- Lê o nome do aluno do teclado

  while nome ~= "fim" do
    table.insert(alunos, nome) -- Insere o nome do aluno no array
    nome = io.read() -- Lê o próximo nome do aluno do teclado
  end

  return alunos -- Retorna o array de alunos
end

-- Chamada da função para ler os alunos
local listaAlunos = lerAlunos()

-- Imprime os alunos armazenados no array
print("Alunos digitados:")
for i, aluno in ipairs(listaAlunos) do
  print(i, aluno)
end
