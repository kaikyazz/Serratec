programa{
	inclua biblioteca Calendario --> c
	inclua biblioteca Matematica --> m   
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> t
	inclua biblioteca Texto
  
	funcao inicio(){
		const inteiro LIN = 45, COL = 8
		cadeia opcao
		cadeia lista[LIN][COL]
		logico opcaoLetra = verdadeiro
		logico fimPrograma = falso
		inteiro mes = 0
		inteiro opcaoMenu
		saudacao()
		enquanto(nao fimPrograma){
			faca{
				exibirMenu()
				leia(opcao)
				limpa()
			}enquanto(validaMenu(opcao))

			opcaoMenu = t.cadeia_para_inteiro(opcao, 10)	
			escolha(opcaoMenu){
				caso 1://Cadastro
					cadastrarAluno(lista)
					pare
				caso 2://Situação
					cadeia turmaPesquisa
					real mediaTurma = 0.0
					escreva("Informe a Turma que deseja saber a média: ")
					leia(turmaPesquisa)
					limpa()
					turmaPesquisa = Texto.caixa_alta(turmaPesquisa)
					calculaMediaTurma(lista, turmaPesquisa)
					u.aguarde(2000)
					limpa()
					pare
				caso 3:
					cadeia nome
					escreva("Informe o nome do aluno: ")
					leia(nome)
					escreva(infoAluno(lista, nome))
					u.aguarde(2000)
					limpa()
					pare
				caso 4://Listar Todos
					tabelaAlunos(lista)
					pare
				caso 5:
					muralAniversario(lista, mes)
					u.aguarde(3000)
					limpa()
					pare
				caso 6:
					limpa()
					edicaoAluno(lista)
					pare
				caso 7:
					sobreNos()
					pare
				caso 8:
					fimPrograma = encerraPrograma(fimPrograma)
					pare
		}
	}	
}
     
     funcao saudacao(){
		
		escreva("  BBBBB   EEEEE  MM   MM        VV    VV  III  NN   NN  DDDDD    OOOO   \n")
		escreva("  BB  BB  EE     MM   MM         VV  VV   III  NNN  NN  DD  DD  OO  OO  \n")
		escreva("  BBBBB   EEEE   MMM MMM          VVVV    III  NN N NN  DD   DD OO  OO  \n")
		escreva("  BB  BB  EE     MM M MM           VV     III  NN  NNN  DD  DD  OO  OO  \n")
		escreva("  BBBBB   EEEEE  MM   MM           VV     III  NN   NN  DDDDD    OOOO   \n")
		u.aguarde(1500)
		limpa()
		
		escreva("  GGGGGG  EEEEE  RRRRR   EEEEE  N    N   CCCC  III  AAAAA  MMMMMMM EEEEE  N    N  TTTTT  OOOO \n")
		escreva(" G      G E      R    R  E      NN   N  C       I   A   A  M  M  M E      NN   N    T   O    O\n")
		escreva(" G        EEEE   RRRRR   EEEE   N N  N  C       I   AAAAA  M  M  M EEEE   N N  N    T   O    O\n")
		escreva(" G   GGGG E      R  R    E      N  N N  C       I   A   A  M  M  M E      N  N N    T   O    O\n")
		escreva("  GGGGG   EEEEE  R   R   EEEEE  N    N   CCCC  III  A   A  M  M  M EEEEE  N    N    T    OOOO \n")

		u.aguarde(1500)
		limpa()

		escreva("  DDDD   EEEEE \n")
		escreva("  D   D  E     \n")
		escreva("  D    D EEEE  \n")
		escreva("  D   D  E     \n")
		escreva("  DDDD   EEEEE \n")
		
		u.aguarde(1500)
		limpa()
		escreva("  AAAAA  L      U   U  N    N  OOO  \n")
		escreva("  A   A  L      U   U  NN   N O   O \n")
		escreva("  AAAAA  L      U   U  N N  N O   O \n")
		escreva("  A   A  L      U   U  N  N N O   O \n")
		escreva("  A   A  LLLLL   UUU   N    N  OOO  \n")
		u.aguarde(1500)
		limpa()
	}
		
     funcao exibirMenu(){
		escreva("				            SGA - Sistema de Gerenciamento de Alunos")
		escreva("\n\n\n1 - Cadastro de Alunos ")
		escreva("\n2 - Média da turma ")
		escreva("\n3 - Situação do Aluno")
		escreva("\n4 - Exibição de Alunos")
		escreva("\n5 - Aniversariantes do mês")
		escreva("\n6 - Editar um Aluno")
		escreva("\n7 - Sobre Nós")
		escreva("\n8 - Finalizar")
		escreva("\n\nEscolha uma opcao: ")
	}
	
	funcao cadastrarAluno(cadeia listaDeAlunos[][]){
    		inteiro linhas = Util.numero_linhas(listaDeAlunos)
		
		para(inteiro i=0; i<linhas; i++){
			cadeia nome, turma, situacao
			logico vTurma = falso
			logico validacaoNome = falso
			logico repeticaoNome = falso
			logico nomeEmBranco = falso
			real n1, n2, n3 
			inteiro mes_nasc
			real mediaAluno
			caracter parar

			faca{
				escreva("Nome completo do aluno: ")
				leia(nome)
				limpa()
				nomeEmBranco = nomeVazio(nome)
				validacaoNome = validaNome(nome)
				repeticaoNome = nomeRepetido(listaDeAlunos, nome)          
				limpa()

			}enquanto(validacaoNome ou repeticaoNome == falso ou nomeEmBranco == verdadeiro )       
			faca{   
				vTurma = falso
				escreva("Turma do aluno: ")
				leia(turma)
				limpa()
				validaTurma(turma)

			}enquanto(vTurma)

			faca{
				escreva("Mês de nascimento(1 até 12): ")
				leia(mes_nasc)
				limpa()
				validaMes(mes_nasc)
			}enquanto(mes_nasc < 1 ou mes_nasc > 12)
			faca{
				escreva("Nota 1: ")
				leia(n1)
				limpa()
				validaNota(n1)
			}enquanto(n1 < 0 ou n1 > 10)
			faca{
				escreva("Nota 2: ")
				leia(n2)
				limpa()
				validaNota(n2)
			}enquanto(n2 < 0 ou n2 > 10)
			faca{
				escreva("Nota 3: ")
				leia(n3)
				limpa()
				validaNota(n3)
			}enquanto(n3 < 0 ou n3 > 10)
			mediaAluno = ( n1 + n2 + n3 ) / 3
			se(mediaAluno >= 6){
				situacao = "Aprovado"
			}
			senao{
				situacao = "Reprovado"
			}
			verificaEpreencheMatriz(listaDeAlunos, nome, turma, mes_nasc, n1, n2, n3, mediaAluno, situacao)
			escreva("Deseja cadastrar mais algum aluno? Qualquer tecla(Sim) ou N(Não): ")
			leia(parar) 
			se(parar == 'N' ou parar == 'n')
				pare
				limpa()
		}
	}
	
	funcao validaTurma(cadeia turma){
		logico vturma
		cadeia cturma
		
		faca{   
			turma = Texto.caixa_alta(turma)
			vturma = falso
			se((turma != "A" e turma != "B" e turma != "C")){
				vturma = verdadeiro
				limpa()
				escreva("Turma inválida! Digite A, B ou C")
				u.aguarde(1500)
				limpa()
				escreva("Turma: ")
				leia(turma)
			}	
		}enquanto(vturma)
	}

	funcao logico validaMenu(cadeia opcaoMenu){
		const inteiro QTD = 89 
		caracter vetorAlgarismo[QTD] = {'Q','q','W','w','E','e','R','r','T','t','Y','y','U','u','I','i','O','o','P','p','A','a','S','s','D','d','F','f','G','g','H','h','J','j','K','k','L','l','Ç','ç','Z','z','X','x','C','c','V','v','B','b','N','n','M','m','`','´','~','^','0','°','º','ª','§','9','!','@','#','$','%','&','*','(',')','+','=','{','[',']','}','?','/',':',';','>','<',',','.','|','-'}
		caracter cNome
		inteiro numeroCaracter,valorInvalido = 0

		numeroCaracter = Texto.numero_caracteres(opcaoMenu)
		para (inteiro i = 0; i < numeroCaracter; i++){
			cNome = Texto.obter_caracter(opcaoMenu, i)
			para (inteiro j = 0; j < QTD ; j++){
				se (cNome == vetorAlgarismo[j]){
					valorInvalido++ 
				}
				se (valorInvalido > 0){
					escreva("OPÇÃO INVÁLIDA!" + "\nDIGITE NOVAMENTE!")
					u.aguarde(2500)
					limpa()
					retorne verdadeiro
				}
			}
		}
		retorne falso
	}

	funcao logico validaNome(cadeia nome){ 

		//Faltando verificar se nome = ''(vazio)
		const inteiro QTD = 48 
		caracter vetorAlgarismo[QTD] = {'0','1','2','3','4','5','6','7','8','9','!','@','#','$','%','&','*','(',')','+','=','{','[',']','}','?','/',':',';','>','<',',','.','|','-','^','`','´','~','°','º','¹','²','³','£','¬','ª','§'}    
		caracter cNome
		inteiro numeroCaracter,valorInvalido = 0

		numeroCaracter = Texto.numero_caracteres(nome)						
		para (inteiro i = 0; i < numeroCaracter; i++){           
			cNome = Texto.obter_caracter(nome, i) 
			para (inteiro j = 0; j < QTD ; j++){
				se (cNome == vetorAlgarismo[j]){
					valorInvalido++ 
				}
			}
		}
		se (valorInvalido > 0) {
			escreva("NOME CONTEM CARACTERES INVALIDOS!\nDIGITE NOVAMENTE!")
			u.aguarde(2500)
			retorne verdadeiro
		}
		retorne falso	
	}
	
	funcao logico nomeVazio(cadeia nome){
		se(nome == ""){
			escreva("Nome do aluno está em branco!")
			u.aguarde(1500)
			retorne verdadeiro
		}
		retorne falso
	}
	
	funcao validaMes(inteiro mes){
		se(mes < 1 ou mes > 12){
			limpa()
			escreva("Mês inválido! Escreva de 1 à 12!")
			u.aguarde(1500)
			limpa()
		}
	}
	
	funcao validaNota(real nota){
		se(nota < 0 ou nota > 10){
			limpa()
			escreva("Nota inválida! Escreva de 0 à 10!")
			u.aguarde(1500)
			limpa()
		}		
	}
	
	funcao logico nomeRepetido(cadeia listaDeAlunos[][],cadeia nome){	
		inteiro nLinhas = linhasTurmas(listaDeAlunos)
		cadeia nomeUP = Texto.caixa_alta(nome)

		para(inteiro i = 0; i < nLinhas; i++){
			listaDeAlunos[i][0] = Texto.caixa_alta(listaDeAlunos[i][0])
			se(listaDeAlunos[i][0] == nomeUP){
				escreva("ALUNO JÁ CADASTRADO!")
				u.aguarde(2000)
				retorne falso
			}	
		}
		retorne verdadeiro
	}	
	
	funcao calculaMediaTurma(cadeia listaDeAlunos[][], cadeia turmaPesquisa){
		real media = 0.0
		real mediaTurma = 0.0
		real somaMedias = 0.0
		inteiro linhas = u.numero_linhas(listaDeAlunos)
		cadeia turmaLoop = "" 
		real numAlunosTurma = 0.0
		inteiro nAlunos = 0

		nAlunos = linhasTurmas(listaDeAlunos)
		para(inteiro i = 0; i < nAlunos; i++){
			turmaLoop = listaDeAlunos[i][1]
			media = t.cadeia_para_real(listaDeAlunos[i][6])
			se(turmaPesquisa == turmaLoop){
				somaMedias += media 
				numAlunosTurma++
			}
		}
		se(numAlunosTurma > 0){
			mediaTurma = somaMedias / numAlunosTurma
			escreva("Media da turma " + turmaPesquisa + " é: " + mediaTurma)
			escreva("\nA situacao da turma " + turmaPesquisa + " é " + situacaoTurma(mediaTurma))
		} 
		senao se(numAlunosTurma == 0){
			escreva("ESSA TURMA NÃO POSSUI NENHUM ALUNO CADASTRADO!")
		}
	}

	funcao ordenaNotas(cadeia listaDeAlunos[][]){
		logico troca
		cadeia aux[8]
		inteiro linhas = linhasTurmas(listaDeAlunos)

		faca{
			troca = falso
			para(inteiro i = 0; i < linhas - 1; i++){
				real notaAtual = t.cadeia_para_real(listaDeAlunos[i][6])
				real proximaNota = 0.0
				se(listaDeAlunos[i+1][6] !=""){
					proximaNota = t.cadeia_para_real(listaDeAlunos[i+1][6])
				}
				se(notaAtual < proximaNota){
					para(inteiro j = 0; j < 8; j++){
						aux[j] = listaDeAlunos[i][j]
						listaDeAlunos[i][j] = listaDeAlunos[i+1][j]
						listaDeAlunos[i+1][j] = aux[j]
						troca = verdadeiro
					}
				}
			}
		}enquanto(troca)
	}
	
	funcao cadeia infoAluno(cadeia lista[][], cadeia nome){
		para(inteiro i = 0; i< u.numero_linhas(lista); i++){
			se(lista[i][0] == nome){	
				retorne "\nNome: " + lista[i][0] + "\nTurma: " + lista[i][1] + "\nMédia: " + lista[i][6] + "\nSituação: " + lista[i][7]	
			}
		}
		retorne "ALUNO NÃO ENCONTRADO!"
	}

	funcao inteiro linhasTurmas(cadeia listaDeAlunos[][]){
		inteiro contador = 0

		para(inteiro i = 0; i < 45; i++){
			se(listaDeAlunos[i][0] != ""){
				contador++
			}
		}
		retorne contador
	}

	funcao vazio tabelaAlunos(cadeia listaDeAlunos[][]){
		inteiro linhas = linhasTurmas(listaDeAlunos)
		ordenaNotas(listaDeAlunos)

		para(inteiro i = 0; i < linhas; i++){
			escreva("\n\nNome do Alunos: " + listaDeAlunos[i][0])
			escreva("\nTurma: " + listaDeAlunos[i][1])
			escreva("\nMes de nascimento: " + listaDeAlunos[i][2])
			escreva("\nNota 1: " + listaDeAlunos[i][3] + " | Nota 2: " + listaDeAlunos[i][4] + " | Nota 3: " + listaDeAlunos[i][5])
			escreva("\nMedia: " + listaDeAlunos[i][6])
			escreva("\nSituação Final: " + listaDeAlunos[i][7] + "\n\n ------------------------------------------------------------\n\n")

		}
	}

	funcao verificaEpreencheMatriz(cadeia listaDeAlunos[][], cadeia nome, cadeia turma, inteiro mes_nasc, real n1,real n2, real n3, real mediaAluno, cadeia situacao ){
		cadeia cturma, cmes, cmedia, cn1, cn2, cn3,turmaMaiusculo

		cmes = t.inteiro_para_cadeia(mes_nasc,10)
		cn1 = t.real_para_cadeia(n1)
		cn2 = t.real_para_cadeia(n2)
		cn3 = t.real_para_cadeia(n3)
		cmedia = t.real_para_cadeia(mediaAluno)
		turmaMaiusculo = Texto.caixa_alta(turma)

		para(inteiro i = 0; i < 45; i++){
			se(listaDeAlunos[i][0] == ""){
				listaDeAlunos[i][0] = nome
				listaDeAlunos[i][1] = turmaMaiusculo
				listaDeAlunos[i][2] = cmes
				listaDeAlunos[i][3] = cn1
				listaDeAlunos[i][4] = cn2
				listaDeAlunos[i][5] = cn3
				listaDeAlunos[i][6] = cmedia
				listaDeAlunos[i][7] = situacao
				pare
			}
		} 
	}

	funcao verificaEeditaMatriz(cadeia listaDeAlunos[][], cadeia nome, cadeia turma, inteiro mes_nasc, real n1,real n2, real n3, real mediaAluno, cadeia situacao ){
		cadeia cturma, cmes, cmedia, cn1, cn2, cn3,turmaMaiusculo

		cmes = t.inteiro_para_cadeia(mes_nasc,10)
		cn1 = t.real_para_cadeia(n1)
		cn2 = t.real_para_cadeia(n2)
		cn3 = t.real_para_cadeia(n3)
		cmedia = t.real_para_cadeia(mediaAluno)
		turmaMaiusculo = Texto.caixa_alta(turma)

		para(inteiro i = 0; i < 45; i++){
			se(listaDeAlunos[i][0] != ""){
				listaDeAlunos[i][0] = nome
				listaDeAlunos[i][1] = turmaMaiusculo
				listaDeAlunos[i][2] = cmes
				listaDeAlunos[i][3] = cn1
				listaDeAlunos[i][4] = cn2
				listaDeAlunos[i][5] = cn3
				listaDeAlunos[i][6] = cmedia
				listaDeAlunos[i][7] = situacao
				pare
			}
		} 
	}
	
	funcao cadeia buscarAluno(cadeia listaDeAluno[][]){
    		inteiro linhas = Util.numero_linhas(listaDeAluno)
		limpa()
		cadeia nome

		escreva("Qual nome do Aluno: ")
		leia(nome)
		para(inteiro i=0; i<linhas; i++){
			se(listaDeAluno[i][0] == nome){
				retorne listaDeAluno[i][0] + " - " + listaDeAluno[i][6]
			}
		}
		retorne "Não foi encontrado esse contato"
	}
    
	funcao cadeia situacaoTurma(real mediaTurma){
		se(mediaTurma < 6.0){
			retorne "Ruim!"
		}
		senao se(mediaTurma >= 6.0 e mediaTurma < 8.0){
			retorne "Médio!"
		}
		senao se(mediaTurma >= 8.0 e mediaTurma < 10.0){
			retorne "Bom!" 
		}
		senao se(mediaTurma == 10.0){
			retorne "Ótimo!"
		}
		retorne "SITUAÇÃO INDEFINIDA!"
	}

	funcao muralAniversario(cadeia listaDeAlunos[][], inteiro mes){
		inteiro linhas = linhasTurmas(listaDeAlunos)
		cadeia mesEscrito = ""
		cadeia meses[12] = {"Janeiro", "Fevereiro", "Março", "Abril", "Maior", "Junho", "Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"}
		
		faca{
			escreva("Informe o mês de aniversario que deseja consultar: ")
			leia(mes)
			limpa()
			para(inteiro i = 1; i <= 12; i++){
				se(i == mes){
					escreva("O aniversariante do mes de " + meses[i-1] + " é/são " )
				}
			}
			se(mes < 1 ou mes > 12){
				limpa()
				escreva("MÊS INVÁLIDO!\nDigite um número de 1 à 12!")
				u.aguarde(2000)
				limpa()
			}
			para(inteiro i = 0; i < linhas; i++){
				inteiro mesInt = t.cadeia_para_inteiro(listaDeAlunos[i][2], 10)
				se(mesInt == mes){
					escreva("\n• " + listaDeAlunos[i][0])
					escreva("\n\nParabéns!!")
					u.aguarde(2000)
				}	
			}

		}enquanto(mes <1 ou mes >12)
	}
	
     funcao edicaoAluno(cadeia listaDeAlunos[][]){
		const inteiro LIN = 45
     	cadeia nomePesquisa
     	cadeia nomeEdicao, turmaEdicao, situacaoEdicao
		inteiro mesInt
		logico validacaoNome = falso, validacaoNomeEmbranco = falso , validacaoNomeRepetido = falso 
		real n1Real, n2Real, n3Real, mediaReal
		caracter parar

		para(inteiro i=0; i<LIN; i++){
			escreva("Qual nome do aluno: ")
			leia(nomePesquisa)                       
			se(listaDeAlunos[i][0] != nomePesquisa){
				limpa()
				escreva("NOME INVÁLIDO OU NÃO CADASTRADO!")
				u.aguarde(2000)
				limpa()
				pare
			}
			se(listaDeAlunos[i][0] == nomePesquisa){ 
				faca{
					limpa()
					escreva("Nome do aluno: ")
					leia(nomeEdicao)
					validacaoNomeEmbranco = nomeVazio(nomeEdicao)
					validacaoNome = validaNome(nomeEdicao)
					validacaoNomeRepetido = nomeRepetido(listaDeAlunos, nomeEdicao)
					limpa()
				} enquanto(validacaoNome ou validacaoNomeEmbranco ou validacaoNomeRepetido == falso)
				escreva("Turma do aluno: ")
				leia(turmaEdicao) 
				validaTurma(turmaEdicao)
				faca{
					escreva("Mês de nascimento(1 até 12): ")
					leia(mesInt)
					validaMes(mesInt)
				}enquanto(mesInt < 1 ou mesInt > 12)
				limpa()
				faca{
				escreva("Nota 1: ")
				leia(n1Real)
				limpa()
				validaNota(n1Real)
			}enquanto(n1Real < 0 ou n1Real > 10)
			faca{
				escreva("Nota 2: ")
				leia(n2Real)
				limpa()
				validaNota(n2Real)
			}enquanto(n2Real < 0 ou n2Real > 10)
			faca{
				escreva("Nota 3: ")
				leia(n3Real)
				limpa()
				validaNota(n3Real)
			}enquanto(n3Real < 0 ou n3Real > 10)
				mediaReal = (n1Real + n2Real + n3Real)/ 3

				se(mediaReal >= 6){
					situacaoEdicao = "Aprovado"
				}
				senao{
					situacaoEdicao = "Reprovado"
				}
				
				verificaEeditaMatriz(listaDeAlunos, nomeEdicao, turmaEdicao,mesInt, n1Real, n2Real, n3Real, mediaReal, situacaoEdicao)
				escreva("Deseja editar mais algum aluno? Qualquer tecla(Sim) ou N(Não): ")
				leia(parar) 
				se(parar == 'N' ou parar == 'n')
					pare
					limpa()
			}
		}
	}
     
     funcao sobreNos() {
     	cadeia qualquerTecla
     	
		escreva("O Grupo 6 da disciplina de Lógica de Programação no Serratec é composto por estudantes dedicados e entusiasmados \nem aprender os fundamentos essenciais para a construção de algoritmos e programas computacionais.\n\n")
		escreva("Este grupo demonstra uma notável sinergia, colaborando de forma eficaz para resolver desafios e exercícios propostos\nem sala de aula.\n\n")
		escreva("Com uma mistura de habilidades e experiências, os membros do Grupo 6 trazem perspectivas únicas para as atividades\npráticas e discussões teóricas.\n\n")
		escreva("Eles se destacam pela sua capacidade de trabalhar em equipe, compartilhando conhecimentos e apoiando-se mutuamente\nna compreensão dos conceitos mais complexos da lógica de programação.\n\n")
		escreva("Ao longo do curso, o Grupo 6 tem mostrado um progresso significativo, demonstrando uma melhoria constante em suas\nhabilidades de programação e resolução de problemas.\n\n")
		escreva("Além disso, sua dedicação ao aprendizado e sua disposição para enfrentar desafios os destacam como um grupo promissor\nno campo da ciência da computação.\n\n")
		escreva("Com uma mentalidade colaborativa e uma paixão pelo aprendizado, o Grupo 6 da disciplina de Lógica de Programação no \nSerratec representa o potencial e a determinação dos futuros profissionais da área de tecnologia da informação.\n\n")
		escreva("\n                                                              Grupo 6: ")
		escreva("\n 									Emanuel - https://github.com/Leoncode-hub")
		escreva("\n 									Kaiky - https://github.com/kaikyazz")
		escreva("\n									Luiz Miele - https://github.com/luizmiele")
		escreva("\n 									Raphael - https://github.com/RaphaelDamico")
		escreva("\n\n\n 					APERTE QUALQUER TECLA PARA VOLTAR PRO MENU! ")
		leia(qualquerTecla)
		limpa()
	}
     
     funcao logico encerraPrograma(logico fimPrograma){
		 escreva("Encerrando programa! Em 3!\n")
           u.aguarde(1000)
           limpa()
           escreva("Encerrando programa! Em 2!\n")
           u.aguarde(1000)
           limpa()
           escreva("Encerrando programa! Em 1!\n")
           u.aguarde(1000)
           limpa()
			escreva("  AAAAA   TTTTT  EEEEE       L       OOOO   GGGGG   OOOO   \n")
			escreva(" A     A    T    E           L      O    O G     G O    O  \n")
			escreva(" AAAAAAA    T    EEEE        L      O    O G       O    O  \n")
			escreva(" A     A    T    E           L      O    O G   GGG O    O  \n")
			escreva(" A     A    T    EEEEE       LLLLL   OOOO   GGGGG   OOOO   \n")
           u.aguarde(2000)
           limpa()        
         	 retorne verdadeiro
    }

}	
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 368; 
 * @DOBRAMENTO-CODIGO = [69, 105, 118, 191, 210, 234, 259, 268, 277, 286, 301, 329, 354, 363, 374, 389, 414, 439, 454, 470, 502, 577, 597];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = vetor, matriz;
 */