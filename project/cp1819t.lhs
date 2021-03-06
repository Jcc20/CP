\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1819t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp1819t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "

%---------------------------------------------------------------------------

\title{
       	    C??lculo de Programas
\\
       	Trabalho Pr??tico
\\
       	MiEI+LCC --- 2018/19
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 038
\\\hline
a83631 & Filipa Alves dos Santos	
\\
a85006 & Hugo Andr?? Coelho Cardoso
\\
a84775 & Jo??o da Cunha e Costa
\end{tabular}
\end{center}

\section{Pre??mbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-ma????o de computadores como uma disciplina cient??fica. Para isso
parte-se de um repert??rio de \emph{combinadores} que formam uma ??lgebra da
programa????o (conjunto de leis universais e seus corol??rios) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto ??,
agregando programas j?? existentes.
  
Na sequ??ncia pedag??gica dos planos de estudo dos dois cursos que t??m
esta disciplina, restringe-se a aplica????o deste m??todo ?? programa????o
funcional em \Haskell. Assim, o presente trabalho pr??tico coloca os
alunos perante problemas concretos que dever??o ser implementados em
\Haskell.  H?? ainda um outro objectivo: o de ensinar a documentar
programas, valid??-los, e a produzir textos t??cnico-cient??ficos de
qualidade.

\section{Documenta????o} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma t??cnica de programa\-????o dita
``\litp{liter??ria}'' \cite{Kn92}, cujo princ??pio base ?? o seguinte:
\begin{quote}\em Um programa e a sua documenta????o devem coincidir.
\end{quote} Por outras palavras, o c??digo fonte e a documenta????o de um
programa dever??o estar no mesmo ficheiro.

O ficheiro \texttt{cp1819t.pdf} que est?? a ler ?? j?? um exemplo de \litp{programa????o
liter??ria}: foi gerado a partir do texto fonte \texttt{cp1819t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrar??
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1819t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1819t.lhs > cp1819t.tex
    $ pdflatex cp1819t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} ??
um pre-processador que faz ``pretty printing''
de c??digo Haskell em \Latex\ e que deve desde j?? instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1819t.lhs} ?? execut??vel e cont??m
o ``kit'' b??sico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1819t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Cp1819t where 
import Cp
import List  hiding (fac)
import Nat  
import Data.List hiding (find)
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import System.Process
import GHC.IO.Exception
import qualified Graphics.Gloss as G
import Control.Monad
import Control.Applicative hiding ((<|>))
import Data.Either
import Exp
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1819t.lhs} no seu editor de texto preferido
e verifique que assim ??: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho te??rico-pr??tico deve ser realizado por grupos de tr??s alunos.
Os detalhes da avalia????o (datas para submiss??o do relat??rio e sua defesa
oral) s??o os que forem publicados na \cp{p??gina da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder ??s quest??es que ser??o colocadas
na \emph{defesa oral} do relat??rio.

Em que consiste, ent??o, o \emph{relat??rio} a que se refere o par??grafo anterior?
?? a edi????o do texto que est?? a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relat??rio dever?? conter ainda a identifica????o dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relat??rio deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o ??ndice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1819t.aux
    $ makeindex cp1819t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-?? ainda instalar o utilit??rio
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
gera????o de gr??ficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invoc??-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

Qualquer programador tem, na vida real, de ler e analisar (muito!) c??digo
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
c??digo \Haskell\ relativo aos problemas que se seguem. Esse anexo dever??
ser consultado e analisado ?? medida que isso for necess??rio.

\Problema

Um compilador ?? um programa que traduz uma linguagem dita de
\emph{alto n??vel} numa linguagem (dita de \emph{baixo n??vel}) que
seja execut??vel por uma m??quina.
Por exemplo, o \gcc{GCC} compila C/C++ em c??digo objecto que
corre numa variedade de arquitecturas.

Compiladores s??o normalmente programas complexos.
Constam essencialmente de duas partes:
o \emph{analisador sint??tico} que l?? o texto de entrada
(o programa \emph{fonte} a compilar) e cria uma sua representa????o
interna, estruturada em ??rvore;
e o \emph{gerador de c??digo} que converte essa representa????o interna
em c??digo execut??vel.
Note-se que tal representa????o interm??dia pode ser usada para outros fins,
por exemplo,
para gerar uma listagem de qualidade (\uk{pretty print}) do programa fonte.

O projecto de compiladores ?? um assunto complexo que
ser?? assunto de outras disciplinas.
Neste trabalho pretende-se apenas fazer uma introdu????o ao assunto,
mostrando como tais programas se podem construir funcionalmente ?? custa de
cata/ana/hilo-morfismos da linguagem em causa.

Para cumprirmos o nosso objectivo, a linguagem desta quest??o ter?? que ser, naturalmente,
muito simples: escolheu-se a das express??es aritm??ticas com inteiros,
\eg\ \( 1 + 2 \), \( 3 * (4 + 5) \) etc.
Como representa????o interna adopta-se o seguinte tipo polinomial, igualmente simples:
%
\begin{spec}
data Expr = Num Int | Bop Expr Op Expr 
data Op = Op String
\end{spec}

\begin{enumerate}
\item
Escreva as defini????es dos \{cata, ana e hilo\}-morfismos deste tipo de dados
segundo o m??todo ensinado nesta disciplina (recorde m??dulos como \eg\ |BTree| etc).
\item
Como aplica????o do m??dulo desenvolvido no ponto 1,
defina como \{cata, ana ou hilo\}-morfismo a fun????o seguinte:
\begin{itemize}
\item |calcula :: Expr -> Int| que calcula o valor
de uma express??o;
\begin{propriedade}
O valor zero ?? um elemento neutro da adi????o.
\begin{code}
prop_neutro1 :: Expr -> Bool
prop_neutro1 = calcula . addZero .==. calcula where
            addZero e = Bop (Num 0) (Op "+") e
prop_neutro2 :: Expr -> Bool
prop_neutro2 = calcula . addZero .==. calcula where
            addZero e = Bop e (Op "+") (Num 0) 
\end{code}
\end{propriedade}  
\begin{propriedade}
As opera????es de soma e multiplica????o s??o comutativas.
\begin{code}
prop_comuta = calcula . mirror .==. calcula where
            mirror = cataExpr (either Num g2)
            g2 = (uncurry (uncurry Bop)) . (swap >< id) . assocl . (id >< swap)
\end{code}
\end{propriedade}  
\end{itemize}
\item
Defina como \{cata, ana ou hilo\}-morfismos as fun????es
\begin{itemize}
\item |compile :: String -> Codigo| - trata-se do compilador propriamente
      dito. Dever?? ser gerado c??digo posfixo para uma m??quina elementar
      de \pda{stack}. O tipo |Codigo| pode ser definido ?? escolha.
      D??o-se a seguir exemplos de comportamentos aceit??veis para esta
      fun????o:
\begin{verbatim}
Tp4> compile "2+4"
["PUSH 2", "PUSH 4", "ADD"]
Tp4> compile "3*(2+4)"
["PUSH 3", "PUSH 2", "PUSH 4", "ADD", "MUL"]
Tp4> compile "(3*2)+4"
["PUSH 3", "PUSH 2", "MUL", "PUSH 4", "ADD"]
Tp4> 
\end{verbatim}
\item |show' :: Expr -> String| - gera a representa????o textual
      de uma |Expr| pode encarar-se como o \uk{pretty printer}
      associado ao nosso compilador
\begin{propriedade}
Em anexo, ?? fornecido o c??digo da fun????o |readExp|, que ?? ``inversa" da fun????o |show'|,
tal como a propriedade seguinte descreve:
\begin{code}
prop_inv :: Expr -> Bool
prop_inv = p1 . head . readExp . show' .==. id
\end{code}
\end{propriedade}  
\end{itemize}
%% \item Generalize o tipo |Expr| de forma a admitir operadores
%% un??rios (\eg\ \(-5\)) e repita os exerc??cios dos pontos anteriores.
\end{enumerate}

\paragraph{Valoriza????o}
Em anexo ?? apresentado c??digo \Haskell\ que permite declarar
|Expr| como inst??ncia da classe |Read|. Neste contexto,  
|read| pode ser vista como o analisador
sint??tico do nosso min??sculo compilador de express??es aritm??ticas.

Analise o c??digo apresentado, corra-o e escreva no seu relat??rio uma explica????o
\textbf{breve} do seu funcionamento, que dever?? saber defender aquando da
apresenta????o oral do relat??rio.

Exprima ainda o analisador sint??tico |readExp| como um anamorfismo.

\Problema

Pretende-se neste problema definir uma linguagem gr??fica \aspas{brinquedo}
a duas dimens??es (2D) capaz de especificar e desenhar agrega????es de
caixas que cont??m informa????o textual.
Vamos designar essa linguagem por |L2D| e vamos defini-la como um tipo
 em \Haskell:
\begin{code}
type L2D = X Caixa Tipo 
\end{code}
onde |X| ?? a estrutura de dados
\begin{code}
data X a b = Unid a | Comp b (X a b) (X a b) deriving Show
\end{code}
e onde:
\begin{code}
type Caixa = ((Int,Int),(Texto,G.Color))
type Texto = String
\end{code}
Assim, cada caixa de texto ?? especificada pela sua largura, altura, o seu
texto e a sua c??r.\footnote{Pode relacionar |Caixa| com as caixas de texto usadas
nos jornais ou com \uk{frames} da linguagem \Html\ usada na Internet.}
Por exemplo,
\begin{spec}
((200,200),("Caixa azul",col_blue))
\end{spec}
designa a caixa da esquerda da figura \ref{fig:L2D}.

O que a linguagem |L2D| faz ?? agregar tais caixas tipogr??ficas
umas com as outras segundo padr??es especificados por v??rios
\aspas{tipos}, a saber,
\begin{code}
data Tipo = V | Vd | Ve | H | Ht | Hb 
\end{code}
com o seguinte significado:
\begin{itemize}
\item[|V|] - agrega????o vertical alinhada ao centro
\item[|Vd|] - agrega????o vertical justificada ?? direita
\item[|Ve|] - agrega????o vertical justificada ?? esquerda
\item[|H|] - agrega????o horizontal alinhada ao centro
\item[|Hb|] - agrega????o horizontal alinhada pela base
\item[|Ht|] - agrega????o horizontal alinhada pelo topo
\end{itemize}
Como |L2D| instancia o par??metro |b| de |X| com
|Tipo|, ?? f??cil de ver que cada \aspas{frase} da linguagem
|L2D| ?? representada por uma ??rvore bin??ria em que cada n??
indica qual o tipo de agrega????o a aplicar ??s suas duas sub-??rvores.
%
Por exemplo, a frase
\begin{code}
ex2= Comp Hb  (Unid ((100,200),("A",col_blue)))
              (Unid ((50,50),("B",col_green)))
\end{code}
dever?? corresponder ?? imagem da direita da figura \ref{fig:L2D}.
E poder-se-?? ir t??o longe quando a linguagem o permita. Por exemplo, pense na
estrutura da frase que representa o \uk{layout} da figura \ref{fig:L2D1}.

\begin{figure}
\centering
\begin{picture}(190.00,130.00)(-15,-15)
\put(00.00,0.00){$(0,0)$}
\put(80.00,50.00){$(200,200)$}
\put(20.00,-10.00){
	\includegraphics[width=70\unitlength]{cp1819t_media/ex3.png}
}
\end{picture}
%
\includegraphics[width=0.2\textwidth]{cp1819t_media/ex2.png}
%
\caption{Caixa simples e caixa composta.\label{fig:L2D}}
\end{figure}

\begin{figure}
\centering
\includegraphics[width=0.6\textwidth]{cp1819t_media/ex.png}
\caption{\uk{Layout} feito de v??rias caixas coloridas.\label{fig:L2D1}}
\end{figure}

?? importante notar que cada ``caixa'' n??o disp??e informa????o relativa
ao seu posicionamento final na figura. De facto, ?? a posi????o relativa
que deve ocupar face ??s restantes caixas que ir?? determinar a sua
posi????o final. Este ?? um dos objectivos deste trabalho:
\emph{calcular o posicionamento absoluto de cada uma das caixas por forma a
respeitar as restri????es impostas pelas diversas agrega????es}. Para isso vamos
considerar um tipo de dados que comporta a informa????o de todas as
caixas devidamente posicionadas (i.e. com a informa????o adicional da
origem onde a caixa deve ser colocada).

\begin{spec}
type Fig = [(Origem,Caixa)]
type Origem = (Float, Float)
\end{spec}
%
A informa????o mais relevante deste tipo ?? a referente ?? lista de
``caixas posicionadas'' (tipo |(Origem,Caixa)|). Regista-se a?? a origem
da caixa que, com a informa????o da sua altura e comprimento, permite
definir todos os seus pontos (consideramos as caixas sempre paralelas
aos eixos). 

\begin{enumerate}
\item Forne??a a defini????o da fun????o |calc_origems|, que calcula as
coordenadas iniciais das caixas no plano:
\begin{spec}
calc_origems :: (L2D,Origem) -> X (Caixa,Origem) ()
\end{spec}
\item Forne??a agora a defini????o da fun????o |agrup_caixas|, que agrupa
todas as caixas e respectivas origens numa s?? lista:
\begin{spec}
agrup_caixas :: X (Caixa,Origem) () -> Fig
\end{spec}
\end{enumerate}

Um segundo problema neste projecto ?? \emph{descobrir como visualizar a
informa????o gr??fica calculada por |desenho|}. A nossa estrat??gia para
superar o problema baseia-se na biblioteca \gloss{Gloss}, que permite a gera????o
de gr??ficos 2D. Para tal disponibiliza-se a fun????o
\begin{spec}
crCaixa :: Origem  -> Float -> Float -> String -> G.Color -> G.Picture
\end{spec}
que cria um rect??ngulo com base numa coordenada, um valor para a largura, um valor
para a altura, um texto que ir?? servir de etiqueta, e a cor pretendida.
Disponibiliza-se tamb??m a fun????o
\begin{spec}
display :: G.Picture -> IO ()
\end{spec}
que dado um valor do tipo |G.picture| abre uma janela com esse valor desenhado. O objectivo
final deste exerc??cio ?? implementar ent??o uma fun????o 
\begin{spec}
mostra_caixas :: (L2D,Origem) -> IO ()
\end{spec}
que dada uma frase da linguagem |L2D| e coordenadas iniciais apresenta
o respectivo desenho no ecr??.
%
\textbf{Sugest??o}: 
Use a fun????o |G.pictures| disponibilizada na biblioteca \gloss{Gloss}.

\Problema

Nesta disciplina estudou-se como fazer \pd{programa????o din??mica} por c??lculo,
recorrendo ?? lei de recursividade m??tua.\footnote{Lei (\ref{eq:fokkinga})
em \cite{Ol18}, p??gina \pageref{eq:fokkinga}.}

Para o caso de fun????es sobre os n??meros naturais (|Nat0|, com functor |fF
X = 1 + X|) ?? f??cil derivar-se da lei que foi estudada uma
	\emph{regra de algibeira}
	\label{pg:regra}
que se pode ensinar a programadores que n??o tenham estudado
\cp{C??lculo de Programas}. Apresenta-se de seguida essa regra, tomando como exemplo o
c??lculo do ciclo-\textsf{for} que implementa a fun????o de Fibonacci, recordar
o sistema
\begin{spec}
fib 0 = 1
fib(n+1) = f n

f 0 = 1
f (n+1) = fib n + f n
\end{spec}
Obter-se-?? de imediato
\begin{code}
fib' = p1 . for loop init where
   loop(fib,f)=(f,fib+f)
   init = (1,1)
\end{code}
usando as regras seguintes:
\begin{itemize}
\item	O corpo do ciclo |loop| ter?? tantos argumentos quanto o n??mero de fun????es mutuamente recursivas.
\item	Para as vari??veis escolhem-se os pr??prios nomes das fun????es, pela ordem
que se achar conveniente.\footnote{Podem obviamente usar-se outros s??mbolos, mas numa primeiraleitura
d?? jeito usarem-se tais nomes.}
\item	Para os resultados v??o-se buscar as express??es respectivas, retirando a vari??vel |n|.
\item	Em |init| coleccionam-se os resultados dos casos de base das fun????es, pela mesma ordem.
\end{itemize}
Mais um exemplo, envolvendo polin??mios no segundo grau a $(quad x 2) + b x + c$ em |Nat0|.
Seguindo o m??todo estudado nas aulas\footnote{Sec????o 3.17 de \cite{Ol18}.},
de $f\ x = a (quad x 2) + b x + c$ derivam-se duas fun????es mutuamente recursivas:
\begin{spec}
f 0 = c
f (n+1) = f n + k n

k 0 = a + b
k(n+1) = k n + 2 a
\end{spec}
Seguindo a regra acima, calcula-se de imediato a seguinte implementa????o, em Haskell:
\begin{code}
f' a b c = p1 . for loop init where
  loop(f,k) = (f+k,k+2*a)
  init = (c,a+b) 
\end{code}

Qual ?? o assunto desta quest??o, ent??o? Considerem f??rmula que d?? a s??rie de Taylor da
fun????o coseno:
\begin{eqnarray*}
	cos\ x = \sum_{i=0}^\infty \frac{(-1)^i}{(2i)!} x^{2i}
\end{eqnarray*}
Pretende-se o ciclo-\textsf{for} que implementa a fun????o 
|cos' x n| que d?? o valor dessa s??rie tomando |i| at?? |n| inclusiv??:
\begin{spec}
cos' x = cdots . for loop init where cdots
\end{spec}
%
\textbf{Sugest??o}: Come??ar por estudar muito bem o processo de c??lculo dado
no anexo \ref{sec:recmul} para o problema (semelhante) da fun????o exponencial.

\begin{propriedade}
Testes de que |cos' x| calcula bem o coseno de |pi| e o coseno de |pi/2|:
\begin{code}
prop_cos1 n = n >= 10 ==> abs(cos pi - cos' pi n) < 0.001
prop_cos2 n = n >= 10 ==> abs(cos (pi/2) - cos' (pi/2) n) < 0.001
\end{code}
\end{propriedade}

\paragraph{Valoriza????o} Transliterar |cos'| para a linguagem C; compilar
e testar o c??digo. Conseguia, por intui????o apenas, chegar a esta fun????o?

\Problema

Pretende-se nesta quest??o desenvolver uma biblioteca de fun????es para
manipular \emph{sistemas de ficheiros} gen??ricos.
Um sistema de ficheiros ser?? visto como uma associa????o de \emph{nomes}
a ficheiros ou \emph{directorias}.
Estas ??ltimas ser??o vistas como sub-sistemas de ficheiros e assim
recursivamente.
Assumindo que |a| ?? o tipo dos identificadores dos ficheiros e
directorias, e que |b| ?? o tipo do conte??do dos ficheiros,
podemos definir um tipo indutivo de dados para representar sistemas de
ficheiros da seguinte forma:
\begin{code}
data FS a b = FS [(a,Node a b)] deriving (Eq,Show)
data Node a b = File b | Dir (FS a b) deriving (Eq,Show)
\end{code}
Um caminho (\emph{path}) neste sistema de ficheiros pode ser representado pelo
seguinte tipo de dados:
\begin{code}
type Path a = [a]
\end{code}
Assumindo estes tipos de dados, o seguinte termo
\begin{spec}
FS [("f1", File "Ola"),
    ("d1", Dir (FS [("f2", File "Ole"),
                    ("f3", File "Ole")
                   ]))
   ]
\end{spec}
representar?? um sistema de ficheiros em cuja ra??z temos um ficheiro chamado
|f1| com conte??do |"Ola"| e uma directoria chamada |"d1"| constitu??da por dois
ficheiros, um chamado |"f2"| e outro chamado |"f3"|, ambos com conte??do |"Ole"|.
%
Neste caso, tanto o tipo dos identificadores como o tipo do conte??do dos
ficheiros ?? |String|. No caso geral, o conte??do de um ficheiro ?? arbitr??rio:
pode ser um bin??rio, um texto, uma colec????o de dados, etc.

A defini????o das usuais fun????es |inFS| e |recFS| para este tipo ?? a seguinte:
\begin{code}
inFS = FS . map (id >< inNode) 
inNode = either File Dir

recFS f = baseFS id id f
\end{code}
Suponha que se pretende definir como um |catamorfismo| a fun????o que
conta o n??mero de ficheiros existentes num sistema de ficheiros. Uma
poss??vel defini????o para esta fun????o seria:
\begin{code}
conta :: FS a b -> Int
conta = cataFS (sum . map ((either (const 1) id) . snd))
\end{code}
O que ?? para fazer:
\begin{enumerate}
\item Definir as fun????es |outFS|, |baseFS|, |cataFS|, |anaFS| e |hyloFS|.

\item Apresentar, no relat??rio, o diagrama de |cataFS|.

\item Definir as seguintes fun????es para manipula????o de sistemas de
  ficheiros usando, obrigatoriamente, catamorfismos, anamorfismos ou
  hilomorfismos:

  \begin{enumerate}
  \item Verifica????o da integridade do sistema de ficheiros (i.e. verificar
    que n??o existem identificadores repetidos dentro da mesma directoria). \\
    |check :: FS a b -> Bool|
  \begin{propriedade}
    A integridade de um sistema de ficheiros n??o depende da ordem em que os    
    ??ltimos s??o listados na sua directoria:
\begin{code}
prop_check :: FS String String -> Bool
prop_check = check . (cataFS (inFS . reverse)).==. check
\end{code}
  \end{propriedade}  
  \item Recolha do conte??do de todos os ficheiros num arquivo indexado pelo \emph{path}.\\
    |tar :: FS a b -> [(Path a, b)]|
  \begin{propriedade}
    O n??mero de ficheiros no sistema deve ser igual ao n??mero de ficheiros
    listados pela fun????o |tar|.
\begin{code}
prop_tar :: FS String String -> Bool
prop_tar = length . tar .==. conta 
\end{code}
  \end{propriedade}  
  \item Transforma????o de um arquivo com o conte??do dos ficheiros
    indexado pelo \emph{path} num sistema de ficheiros.\\
    |untar :: [(Path a, b)] -> FS a b| \\
  \textbf{Sugest??o}: Use a fun????o |joinDupDirs| para juntar directorias que estejam na mesma
  pasta e que possuam o mesmo identificador.
  \begin{propriedade}
    A composi????o |tar . untar| preserva o n??mero de ficheiros no sistema.
\begin{code}
prop_untar :: [(Path String, String)] -> Property
prop_untar = validPaths .==>. ((length . tar . untar) .==. length)
validPaths :: [(Path String, String)] -> Bool
validPaths = (== 0) . length . (filter (\(a,_) -> length a == 0))
\end{code}
\end{propriedade}  
  \item Localiza????o de todos os \emph{paths} onde existe um
    determinado ficheiro.\\
    |find :: a -> FS a b -> [Path a]|
  \begin{propriedade}
    A composi????o |tar . untar| preserva todos os ficheiros no sistema.
\begin{code}
prop_find :: String -> FS String String -> Bool
prop_find = curry $ 
      length . (uncurry find) .==. length . (uncurry find) . (id >< (untar . tar))
\end{code}
  \end{propriedade}  
  \item Cria????o de um novo ficheiro num determinado \emph{path}.\\
    |new :: Path a -> b -> FS a b -> FS a b|
  \begin{propriedade}
A adi????o de um ficheiro n??o existente no sistema n??o origina ficheiros duplicados.
\begin{code}
prop_new :: ((Path String,String), FS String String) -> Property
prop_new = ((validPath .&&&. notDup) .&&&. (check . p2)) .==>. 
      (checkFiles . (uncurry (uncurry new)))  where
      validPath = (/=0) . length . p1 . p1
      notDup = not . (uncurry elem) . (p1 >< ((fmap p1) . tar))
\end{code}
\textbf{Quest??o}: Supondo-se que no c??digo acima se substitui a propriedade
|checkFiles| pela propriedade mais fraca |check|, ser?? que a propriedade
|prop_new| ainda ?? v??lida? Justifique a sua resposta. 
\end{propriedade}
 
\begin{propriedade}
	A listagem de ficheiros logo ap??s uma adi????o nunca poder?? ser menor que a listagem
	de ficheiros antes dessa mesma adi????o.
\begin{code}
prop_new2 :: ((Path String,String), FS String String) -> Property
prop_new2 = validPath .==>. ((length . tar . p2) .<=. (length . tar . (uncurry (uncurry new)))) where
      validPath = (/=0) . length . p1 . p1
\end{code}
  \end{propriedade}  
  \item Duplica????o de um ficheiro.\\
    |cp :: Path a -> Path a -> FS a b -> FS a b|
  \begin{propriedade}
    A listagem de ficheiros com um dado nome n??o diminui ap??s uma duplica????o.
\begin{code}
prop_cp :: ((Path String, Path String),  FS String String) -> Bool
prop_cp =   length . tar . p2 .<=. length . tar . (uncurry (uncurry cp))
\end{code}
  \end{propriedade}  
  \item Elimina????o de um ficheiro.\\
    |rm :: Path a -> FS a b -> FS a b|

  \textbf{Sugest??o}: Construir um anamorfismo |nav :: (Path a, FS a b) -> FS a b|
  que navegue por um sistema de ficheiros tendo como base o |path| dado como argumento.
    \begin{propriedade}
    Remover duas vezes o mesmo ficheiro tem o mesmo efeito que o remover apenas uma vez.
\begin{code}
prop_rm :: (Path String, FS String String) -> Bool
prop_rm = (uncurry rm ) . (split p1 (uncurry rm)) .==. (uncurry rm)
\end{code}
\end{propriedade}
\begin{propriedade}
Adicionar um ficheiro e de seguida remover o mesmo n??o origina novos ficheiros no sistema.
\begin{code}
prop_rm2 :: ((Path String,String), FS String String) -> Property
prop_rm2 = validPath  .==>. ((length . tar . (uncurry rm) . (split (p1. p1) (uncurry (uncurry new)))) 
         .<=. (length . tar . p2)) where
         validPath = (/=0) . length . p1 . p1
\end{code}
\end{propriedade}  
  \end{enumerate}
\end{enumerate}

\paragraph{Valoriza????o} 

Definir uma fun????o para visualizar em \graphviz{Graphviz}
a estrutura de um sistema de ficheiros. A Figura~\ref{ex_prob1}, por exemplo,
apresenta a estrutura de um sistema com precisamente dois ficheiros dentro
de uma directoria chamada |"d1"|. 

Para realizar este exerc??cio ser?? necess??rio apenas  escrever o anamorfismo
\begin{quote}
|cFS2Exp :: (a, FS a b) -> (Exp () a)| 
\end{quote}
que converte a estrutura de um sistema de ficheiros numa ??rvore de express??es
descrita em \href{http://wiki.di.uminho.pt/twiki/pub/Education/CP/MaterialPedagogico/Exp.hs}{Exp.hs}.
A fun????o |dotFS| depois tratar?? de passar a estrutura do sistema de ficheiros para o visualizador.
\begin{figure}
\centering
\includegraphics[scale=0.5]{cp1819t_media/fs.png}
\caption{Exemplo de um sistema de ficheiros visualizado em \graphviz{Graphviz}.}
\label{ex_prob1}
\end{figure}

%----------------- Programa, bibliotecas e c??digo auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir c??lculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo ?? \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Programa????o din??mica por recursividade m??ltipla}\label{sec:recmul}
Neste anexo d??o-se os detalhes da resolu????o do Exerc??cio \ref{ex:exp} dos apontamentos da
disciplina\footnote{Cf.\ \cite{Ol18}, p??gina \pageref{ex:exp}.},
onde se pretende implementar um ciclo que implemente
o c??lculo da aproxima????o at?? |i=n| da fun????o exponencial $exp\ x = e^x$
via s??rie de Taylor:
\begin{eqnarray}
	exp\ x 
& = &
	\sum_{i=0}^{\infty} \frac {x^i} {i!}
\end{eqnarray}
Seja $e\ x\ n = \sum_{i=0}^{n} \frac {x^i} {i!}$ a fun????o que d?? essa aproxima????o.
?? f??cil de ver que |e x 0 = 1| e que $|e x (n+1)| = |e x n| + \frac {x^{n+1}} {(n+1)!}$.
Se definirmos $|h x n| = \frac {x^{n+1}} {(n+1)!}$ teremos |e x| e |h x| em recursividade
m??tua. Se repetirmos o processo para |h x n| etc obteremos no total tr??s fun????es nessa mesma
situa????o:
\begin{spec}
e x 0 = 1
e x (n+1) = h x n + e x n

h x 0 = x
h x (n+1) = x/(s n) * h x n

s 0 = 2
s (n+1) = 1 + s n
\end{spec}
Segundo a \emph{regra de algibeira} descrita na p??gina \ref{pg:regra} deste enunciado,
ter-se-??, de imediato:
\begin{code}
e' x = prj . for loop init where
     init = (1,x,2)
     loop(e,h,s)=(h+e,x/s*h,1+s)
     prj(e,h,s) = e
\end{code}

\section{C??digo fornecido}\label{sec:codigo}

\subsection*{Problema 1}
Tipos:
\begin{code}
data Expr = Num Int 
               | Bop Expr Op Expr  deriving  (Eq,Show)

data Op = Op String deriving (Eq,Show)

type Codigo = [String]
\end{code}
Functor de base:
\begin{code}
baseExpr f g = id -|- (f >< (g >< g))
\end{code}
Inst??ncias:
\begin{code}
instance Read Expr where
   readsPrec _ = readExp
\end{code}
Read para Exp's:
\begin{code}
readOp :: String -> [(Op,String)]
readOp input = do 
                 (x,y) <- lex input
                 return ((Op x),y)

readNum :: ReadS Expr
readNum  = (map (\ (x,y) -> ((Num x), y))).reads

readBinOp :: ReadS Expr
readBinOp = (map (\ ((x,(y,z)),t) -> ((Bop x y z),t))) .
                   ((readNum `ou` (pcurvos readExp))
                    `depois` (readOp `depois` readExp))

readExp :: ReadS Expr
readExp = readBinOp `ou` (
          readNum `ou` (
          pcurvos readExp))
\end{code}
Combinadores:
\begin{code}

depois :: (ReadS a) -> (ReadS b) -> ReadS (a,b)
depois _ _ [] = []
depois r1 r2 input = [((x,y),i2) | (x,i1) <- r1 input , 
                                   (y,i2) <- r2 i1]

readSeq :: (ReadS a) -> ReadS [a]
readSeq r input 
  = case (r input) of
    [] -> [([],input)]
    l -> concat (map continua l)
         where continua (a,i) = map (c a) (readSeq r i)
               c x (xs,i) = ((x:xs),i)                     

ou :: (ReadS a) -> (ReadS a) -> ReadS a
ou r1 r2 input = (r1 input) ++ (r2 input)

senao :: (ReadS a) -> (ReadS a) -> ReadS a
senao r1 r2 input = case (r1 input) of
                     [] -> r2 input
                     l  -> l

readConst :: String -> ReadS String
readConst c = (filter ((== c).fst)) . lex

pcurvos = parentesis '(' ')'
prectos = parentesis '[' ']'
chavetas = parentesis '{' '}'

parentesis :: Char -> Char -> (ReadS a) -> ReadS a
parentesis _ _ _ [] = []
parentesis ap pa r input 
  = do 
      ((_,(x,_)),c) <- ((readConst [ap]) `depois` (
                        r                `depois` (
                        readConst [pa])))           input
      return (x,c)
\end{code}

\subsection*{Problema 2}
Tipos:
\begin{code}
type Fig = [(Origem,Caixa)]
type Origem = (Float, Float)
\end{code}
``Helpers":
\begin{code}
col_blue = G.azure
col_green = darkgreen

darkgreen = G.dark (G.dark G.green)
\end{code}
Exemplos:
\begin{code}
ex1Caixas = G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white $
          crCaixa (0,0) 200 200 "Caixa azul" col_blue

ex2Caixas =  G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white $
          caixasAndOrigin2Pict ((Comp Hb bbox gbox),(0.0,0.0)) where
          bbox = Unid ((100,200),("A",col_blue))
          gbox = Unid ((50,50),("B",col_green))

ex3Caixas = G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white mtest where
          mtest = caixasAndOrigin2Pict $ (Comp Hb (Comp Ve bot top) (Comp Ve gbox2 ybox2), (0.0,0.0))
          bbox1 = Unid ((100,200),("A",col_blue))
          bbox2 = Unid ((150,200),("E",col_blue))
          gbox1 = Unid ((50,50),("B",col_green))
          gbox2 = Unid ((100,300),("F",col_green))
          rbox1 = Unid ((300,50),("C",G.red))
          rbox2 = Unid ((200,100),("G",G.red))
          wbox1 = Unid ((450,200),("",G.white)) 
          ybox1 = Unid ((100,200),("D",G.yellow))
          ybox2 = Unid ((100,300),("H",G.yellow))
          bot = Comp Hb wbox1 bbox2 
          top = (Comp Ve (Comp Hb bbox1 gbox1) (Comp Hb rbox1 (Comp H ybox1 rbox2)))
\end{code}
A seguinte fun????o cria uma caixa a partir dos seguintes par??metros: origem,
largura, altura, etiqueta e c??r de preenchimento.
\begin{code}
crCaixa :: Origem  -> Float -> Float -> String -> G.Color -> G.Picture
crCaixa (x,y) w h l c = G.Translate (x+(w/2)) (y+(h/2)) $  G.pictures [caixa, etiqueta] where
                    caixa = G.color c (G.rectangleSolid w h)
                    etiqueta = G.translate calc_trans_x calc_trans_y $ 
                             G.Scale calc_scale calc_scale $ G.color G.black $ G.Text l
                    calc_trans_x = (- ((fromIntegral (length l)) * calc_scale) / 2 )*base_shift_x
                    calc_trans_y = (- calc_scale / 2)*base_shift_y
                    calc_scale = bscale * (min h w) 
                    bscale = 1/700
                    base_shift_y = 100
                    base_shift_x = 64
\end{code}
Fun????o para visualizar resultados gr??ficos:
\begin{code}
display = G.display (G.InWindow "Problema 4" (400, 400) (40, 40)) G.white 
\end{code}

\subsection*{Problema 4}
Fun????es para gest??o de sistemas de ficheiros:
\begin{code}
concatFS = inFS . (uncurry (++)) . (outFS >< outFS)
mkdir (x,y) = FS [(x, Dir y)]
mkfile (x,y) = FS [(x, File y)]

joinDupDirs :: (Eq a) => (FS a b) -> (FS a b)
joinDupDirs  = anaFS (prepOut . (id >< proc) . prepIn) where 
         prepIn = (id >< (map (id >< outFS))) . sls . (map distr) . outFS
         prepOut = (map undistr) . (uncurry (++)) . ((map i1) >< (map i2)) . (id >< (map (id >< inFS)))
         proc = concat . (map joinDup) . groupByName
         sls = split lefts rights

joinDup :: [(a,[b])] -> [(a,[b])]
joinDup = cataList (either nil g) where g = return . (split (p1 . p1) (concat . (map p2) . (uncurry (:))))

createFSfromFile :: (Path a, b) -> (FS a b)
createFSfromFile ([a],b) = mkfile(a,b)
createFSfromFile (a:as,b) = mkdir(a, createFSfromFile (as,b))
\end{code}
Fun????es auxiliares:
\begin{code}
checkFiles :: (Eq a) => FS a b -> Bool
checkFiles = cataFS ((uncurry (&&)) . (split f g)) where
           f = nr . (fmap p1) . lefts . (fmap distr)
           g = and . rights . (fmap p2)

groupByName :: (Eq a) => [(a,[b])] -> [[(a,[b])]]
groupByName = (groupBy (curry p)) where
            p = (uncurry (==)) . (p1 >< p1)

filterPath :: (Eq a) => Path a -> [(Path a, b)] -> [(Path a, b)]
filterPath = filter . (\p -> \(a,b) -> p == a)
\end{code}
Dados para testes:
\begin{itemize}
\item Sistema de ficheiros vazio:
\begin{code}
efs = FS []
\end{code}
\item N??vel 0
\begin{code}
f1 = FS [("f1", File "hello world")]
f2 = FS [("f2", File "more content")]
f00 = concatFS (f1,f2)
f01 = concatFS (f1, mkdir("d1", efs))
f02 = mkdir("d1",efs)
\end{code}
\item N??vel 1
\begin{code}
f10 = mkdir("d1", f00)
f11 = concatFS(mkdir("d1", f00), mkdir("d2", f00))
f12 = concatFS(mkdir("d1", f00), mkdir("d2", f01))
f13 = concatFS(mkdir("d1", f00), mkdir("d2", efs))
\end{code}
\item N??vel 2
\begin{code}
f20 = mkdir("d1", f10)
f21 = mkdir("d1", f11)
f22 = mkdir("d1", f12)
f23 = mkdir("d1", f13)
f24 = concatFS(mkdir("d1",f10), mkdir("d2",f12))
\end{code}
\item Sistemas de ficheiros inv??lidos:
\begin{code}
ifs0 = concatFS (f1,f1)
ifs1 = concatFS (f1, mkdir("f1", efs))
ifs2 = mkdir("d1", ifs0)
ifs3 = mkdir("d1", ifs1)
ifs4 = concatFS(mkdir("d1",ifs1), mkdir("d2",f12))
ifs5 = concatFS(mkdir("d1",f1), mkdir("d1",f2))
ifs6 = mkdir("d1",ifs5)
ifs7 = concatFS(mkdir("d1",f02),mkdir("d1",f02))
\end{code}
\end{itemize}
Visualiza????o em \graphviz{Graphviz}:
\begin{code}
dotFS :: FS String b -> IO ExitCode
dotFS = dotpict . bmap (const "") id . (cFS2Exp "root")
\end{code}
\def\omitted{``Automagically" generated:
\begin{code}
instance (Arbitrary a, Arbitrary b) => Arbitrary (FS a b) where
   arbitrary = sized genfs  where
             genfs 0 = liftM (inFS . (map (id >< (i1)))) QuickCheck.arbitrary
             genfs n = oneof [liftM (inFS . (map (id >< (i1)))) QuickCheck.arbitrary,
                     liftM (inFS . return . (id >< (i2))) (liftM2 (,) 
                     QuickCheck.arbitrary (genfs (n - 1))),
                     liftM3 genAux QuickCheck.arbitrary (genfs (n - 1)) (genfs (n - 1))]
             genAux a x y = inFS [(a, i2 x), (a, i2 y)]

instance Arbitrary Expr where
   arbitrary = (genExpr 10)  where
             genExpr 0 = liftM (inExpr . i1) QuickCheck.arbitrary
             genExpr n = oneof [liftM (inExpr . i1) QuickCheck.arbitrary,
                       liftM (inExpr . i2 . (uncurry genAux1)) 
                       $ liftM2 (,)  (genExpr (n-1)) (genExpr (n-1)),
                       liftM (inExpr . i2 . (uncurry genAux2)) 
                       $ liftM2 (,)  (genExpr (n-1)) (genExpr (n-1))
                     ]
             genAux1 x y = (Op "+",(x,y))
             genAux2 x y = (Op "*",(x,y))
\end{code}}

\subsection*{Outras fun????es auxiliares}
%----------------- Outras defini????es auxiliares -------------------------------------------%
L??gicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}
Compila????o e execu????o dentro do interpretador:\footnote{Pode ser ??til em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma fun????o
|main|.}
\begin{code}

run = do { system "ghc cp1819t" ; system "./cp1819t" }
\end{code}

%----------------- Solu????es dos alunos -----------------------------------------%
%format (quad (a) (n)) = "{" a "}^{" n "}"
%format (anaNat (g)) = "\ana{" g "}"
%format (expl (a)) = "{" a "}^*"

\section{Solu????es dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas solu????es aos exerc??cios
propostos, de acordo com o "layout" que se fornece. N??o podem ser
alterados os nomes ou tipos das fun????es dadas, mas pode ser adicionado texto e/ou 
outras fun????es auxiliares que sejam necess??rias.

\subsection*{Problema 1}

\paragraph{Diagrama de inExpr}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
&
    |Int + (Op >< (Expr >< Expr))|
           \ar[l]_-{|inExpr|}
}
\end{eqnarray*}

\begin{code}

inExpr :: Either Int (Op,(Expr,Expr)) -> Expr
inExpr = either Num (\(a,(b,c)) -> Bop b a c)

\end{code}

\paragraph{Diagrama de outExpr}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
           \ar[r]_-{|outExpr|}
&
    |Int + (Op >< (Expr >< Expr))|
}
\end{eqnarray*}

\begin{code}

outExpr :: Expr -> Either Int (Op,(Expr,Expr))
outExpr (Num a)     = i1 a
outExpr (Bop a b c) = i2 (b,(a,c))

recExpr f = baseExpr id f

\end{code}

\paragraph{Diagrama de cataExpr}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
           \ar[d]_-{|cataNat g|}
           \ar[r]_-{|outExpr|}
&
    |Int + (Op >< (Expr >< Expr))|
           \ar[d]^{|id + id >< (quad (cataNat g) 2)|}
\\
     |A|
&
     |Int + (Op >< (A >< A))|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\begin{code}

cataExpr g = g . recExpr (cataExpr g) . outExpr

\end{code}

\paragraph{Diagrama de anaExpr}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
&
    |Int + (Op >< (Expr >< Expr))|
           \ar[l]_-{|inExpr|}
\\
     |A|
           \ar[u]^-{|anaNat g|}
           \ar[r]^-{|g|}
&
     |Int + (Op >< (A >< A))|
           \ar[u]_{|id + id >< (quad (anaNat g) 2)|}
}
\end{eqnarray*}

\begin{code}

anaExpr g = inExpr . recExpr (anaExpr g) . g

hyloExpr f g = cataExpr f . anaExpr g 

\end{code}

\paragraph{Fun????o calcula}
\paragraph{}
A |calcula| devolve o valor da opera????o representada pela express??o. Resolvemos atrav??s de um catamorfismo que devolve o pr??prio valor (|id|) caso a |Expr| seja um |Num|, ou calcula o valor da express??o (|operation|) caso seja um |Bop|, obtendo a opera????o correspondente ?? |Op| (string) atrav??s da fun????o |op|.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
           \ar[d]_-{|calcula|}
           \ar[r]_-{|outExpr|}
&
    |Int + (Op >< (Expr >< Expr))|
           \ar[d]^{|id + id >< (quad calcula 2)|}
\\
     |Int|
&
     |Int + (Op >< (Int >< Int))|
           \ar[l]^-{|either id operation|}
}
\end{eqnarray*}

\begin{code}

calcula :: Expr -> Int
calcula = cataExpr (either id operation) where
        operation ((Op b),(a,c)) = (op b) a c
        op "+" = (+)
        op "-" = (-)
        op "*" = (*)
        op "/" = div

\end{code}

\paragraph{Fun????o show'}
\paragraph{}

A |show'| recebe uma |Expr| e traduz para uma string leg??vel correspondente ?? express??o em quest??o. Se |Expr| for um inteiro, faz |show| do mesmo, caso contr??rio concatena as strings das |Expr| do |Bop| com a da opera????o entre elas atrav??s da |bopToString|.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
           \ar[d]_-{|show'|}
           \ar[r]_-{|outExpr|}
&
    |Int + (Op >< (Expr >< Expr))|
           \ar[d]^{|id + id >< (quad show' 2)|}
\\
     |String|
&
     |Int + (Op >< (String >< String))|
           \ar[l]^-{|either show bopToString|}
}
\end{eqnarray*}

\begin{code}

show' = cataExpr (either show bopToString)
  where bopToString ((Op b),(a,c)) = "(" ++ a ++ " " ++ b ++ " " ++ c ++ ")"

\end{code}

\paragraph{Fun????o compile}
\paragraph{}

A |compile| gera c??digo posfixo para uma m??quina elementar de stack. Recorremos ?? |readExp| facultada pelos docentes que retorna uma lista cujo primeiro elemento do par da cabe??a ?? a |Expr| correspondente ?? string argumento.

\begin{code}
compile :: String -> Codigo
compile = stack . fst . head . readExp
\end{code}

Para traduzir essa |Expr| em instru????es de stack (|Codigo|) recorremos a um catamorfismo. Se for um inteiro, usa |push| para o converter numa instru????o de push, caso contr??rio concatena as instru????es das |Expr| do |Bop| com a instru????o correspondente ?? opera????o entre elas atrav??s de |bop|.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Expr|
           \ar[d]_-{|stack|}
           \ar[r]_-{|outExpr|}
&
    |Int + (Op >< (Expr >< Expr))|
           \ar[d]^{|id + id >< (quad stack 2)|}
\\
     |Codigo|
&
     |Int + (Op >< (Codigo >< Codigo))|
           \ar[l]^-{|either push bop|}
}
\end{eqnarray*}

\begin{code}

stack :: Expr -> Codigo
stack = cataExpr (either push bop) where
        push (a) = ["PUSH " ++ (show a)]
        bop ((Op b),(a,c)) = a ++ c ++ (op b)
        op "+" = ["ADD"]
        op "-" = ["SUB"]
        op "*" = ["MUL"]
        op "/" = ["DIV"]
\end{code}

\subsection*{Problema 2}

\paragraph{Diagrama de inL2D}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X a b|
&
    |a + (b >< (X a b >< X a b))|
           \ar[l]_-{|inL2D|}
}
\end{eqnarray*}

\begin{code}
inL2D :: Either a (b, (X a b,X a b)) -> X a b
inL2D = either Unid (\(b,(a,c)) -> Comp b a c)

\end{code}

\paragraph{Diagrama de outL2D}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X a b|
           \ar[r]_-{|outL2D|}
&
    |a + (b >< (X a b >< X a b))|
}
\end{eqnarray*}

\begin{code}

outL2D :: X a b -> Either a (b, (X a b,X a b))
outL2D (Unid a) = i1 a
outL2D (Comp b a c) = i2 (b,(a,c))

baseL2D f g = id -|- (f >< (g >< g))

recL2D f = baseL2D id f

\end{code}

\paragraph{Diagrama de cataL2D}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X a b|
           \ar[d]_-{|cataNat g|}
           \ar[r]_-{|outL2D|}
&
    |a + (b >< (X a b >< X a b))|
           \ar[d]^{|id + id >< (quad (cataNat g) 2)|}
\\
     |C|
&
     |a + (b >< (C >< C))|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\begin{code}

cataL2D g = g . recL2D (cataL2D g) . outL2D

\end{code}

\paragraph{Diagrama de anaL2D}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X a b|
&
    |a + (b >< (X a b >< X a b))|
           \ar[l]_-{|inL2D|}
\\
     |C|
           \ar[u]^-{|anaNat g|}
           \ar[r]^-{|g|}
&
     |a + (b >< (C >< C))|
           \ar[u]_{|id + id >< (quad (anaNat g) 2)|}
}
\end{eqnarray*}

\begin{code}

anaL2D g = inL2D . recL2D (anaL2D g) . g

hyloL2D f g = cataL2D f . anaL2D g

\end{code}

\paragraph{Fun????o collectLeafs}
\paragraph{}

A |collectLeafs| recolhe todas as "folhas" de uma estrutura L2D recorrendo a um catamorfismo, ou seja, as caixas (|type L2D = X Caixa Tipo|). A |outL2D| devolve algo do tipo |Caixa + (Tipo >< (L2D >< L2D))| que ?? processado pelo funtor e obtemos |Caixa + (Tipo >< ([Caixa*] >< [Caixa*]))|, sendo |Caixa*| representativo de uma caixa com os argumentos trocados. Caso se trate de uma caixa, coloca-a numa lista, trocando-lhe a ordem dos pares de argumentos (fun????o |caixa|). Caso contr??rio, ignora o tipo e concatena as listas j?? processadas atrav??s de |listas|.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X (a,b) t|
           \ar[d]_-{|cataNat collectLeafs|}
           \ar[r]_-{|outL2D|}
&
    |(a,b) + (t >< (X (a,b) t >< X (a,b) t))|
           \ar[d]^{|id + id >< (quad (cataNat collectLeafs) 2)|}
\\
     |[(b,a)]|
&
     |(a,b) + (Tipo >< ([(b,a)] >< [(b,a)]))|
           \ar[l]^-{|either caixa listas|}
}
\end{eqnarray*}

\begin{code}

collectLeafs = cataL2D (either caixa listas) where
        caixa a = [swap a]
        listas (b,(a,c)) = a ++ c

\end{code}

\paragraph{Fun????o dimen}
\paragraph{}

A |dimen| calcula as dimens??es de um elemento do tipo L2D, com base nas suas caixas e o posicionamente relativo das ??ltimas, usando um catamorfismo. Caso o L2D seja uma caixa, devolve as suas dimens??es convertidas a double - fun????o |caixa|. Caso contr??rio, conforme o alinhamento das caixas em quest??o, calcula as dimens??es da menor caixa que as englobaria atrav??s de |pares|.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X Caixa Tipo|
           \ar[d]_-{|cataNat dimen|}
           \ar[r]_-{|outL2D|}
&
    |Caixa + (Tipo >< (X Caixa Tipo >< X Caixa Tipo))|
           \ar[d]^{|id + id >< (quad (cataNat dimen) 2)|}
\\
     |(Float,Float)|
&
     |Caixa + (Tipo >< ((Float,Float) >< (Float,Float)))|
           \ar[l]^-{|either caixa pares|}
}
\end{eqnarray*}

\begin{code}

dimen :: X Caixa Tipo -> (Float, Float)
dimen = cataL2D (either caixa pares) where
        caixa ((a1,a2),b) = (fromIntegral a1, fromIntegral a2)
        pares (V ,((x1,y1),(x2,y2))) = if (x1 > x2) then (x1,y1+y2) else (x2,y1+y2)
        pares (Vd,((x1,y1),(x2,y2))) = if (x1 > x2) then (x1,y1+y2) else (x2,y1+y2)
        pares (Ve,((x1,y1),(x2,y2))) = if (x1 > x2) then (x1,y1+y2) else (x2,y1+y2)
        pares (H ,((x1,y1),(x2,y2))) = if (y1 > y2) then (x1+x2,y1) else (x1+x2,y2)
        pares (Hb,((x1,y1),(x2,y2))) = if (y1 > y2) then (x1+x2,y1) else (x1+x2,y2)
        pares (Ht,((x1,y1),(x2,y2))) = if (y1 > y2) then (x1+x2,y1) else (x1+x2,y2)

\end{code}

\paragraph{Fun????o calc}
\paragraph{}

A |calc|, sabendo a posi????o absoluta de uma caixa a), as suas dimens??es e a posi????o relativa de outra caixa b) em rela????o a a), determina a posi????o absoluta da caixa b), realizando c??lculos simples.

\begin{code}

calc :: Tipo -> Origem -> (Float, Float) -> Origem
calc V  (x,y) (d1,d2) = (x+d1/2,y+d2)
calc Vd (x,y) (d1,d2) = (x+d1,y+d2)
calc Ve (x,y) (d1,d2) = (x,y+d2)
calc H  (x,y) (d1,d2) = (x+d1,y+d2/2)
calc Hb (x,y) (d1,d2) = (x+d1,y)
calc Ht (x,y) (d1,d2) = (x+d1,y+d2)

\end{code}

\paragraph{}
\paragraph{}
\paragraph{}
\paragraph{Fun????o calcOrigins}
\paragraph{}

A |calcOrigins| calcula as posi????es fixas de todas as caixas de uma estrutura L2D a partir da origem da primeira caixa em quest??o. 

Caso o |gene| do anamorfismo receba uma caixa, a posi????o acompanhante ?? j?? a sua origem. Caso contr??rio, a posi????o ?? a origem da primeira caixa da estrutura L2D da esquerda, e calcula-se a origem da primeira caixa da estrutura L2D da direita usando a |calc| em rela????o ?? primeira L2D.

No seguinte diagrama, C = Caixa, O = Origem e T = Tipo.

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |X (C,O) ()|
&
    |(C,O) + (() >< (X (C,O) () >< X (C,O) ()))|
           \ar[l]_-{|inL2D|}
\\
     |(X C T >< O)|
           \ar[u]^-{|anaNat calcOrigins|}
           \ar[r]_-{|gene|}
&
     |(C,O) + (() >< ((X C T >< O) >< (X C T >< O)))|
           \ar[u]_{|id + id >< (quad (anaNat calcOrigins) 2)|}
}
\end{eqnarray*}

\begin{code}

calcOrigins :: ((X Caixa Tipo),Origem) -> X (Caixa,Origem) ()
calcOrigins = anaL2D (gene) where
        gene ((Unid a),o) = i1 (a,o)
        gene ((Comp b a c),o) = i2 ((),((a,o),(c, calc b o (dimen a))))

\end{code}

\paragraph{Fun????o para agrupar as caixas}
\paragraph{}

A |calcOrigins| devolve um tipo |X (Caixa,Origem) ()| e a |agrup_caixas| devolve |Fig = [(Origem, Caixa)]|. Assim, podemos realizar isto apenas invocando a |collectLeafs|.

\begin{code}

agrup_caixas = collectLeafs

\end{code}

\paragraph{Fun????o para mostrar as caixas}
\paragraph{}

A |mostra_caixas| ?? tipada assim: |(X Caixa Tipo, Origem) -> IO ()|. Assim, calculamos as origens das caixas (|calcOrigins|) e agrupamo-las (|agrup_caixas|). De seguida, para cada elemento da lista (|map myfunc|) criamos um ret??ngulo segundo os respetivos par??metros (|crCaixa|) e juntamo-los todos numa ??nica G.Picture (|G.Pictures|), a qual representamos no ecr?? atrav??s da |display|.

\begin{code}

caixasAndOrigin2Pict = G.pictures . (map myfunc) . agrup_caixas . calcOrigins
  where myfunc (o,((x,y),(t,c))) = crCaixa o (fromIntegral x) (fromIntegral y) t c

mostra_caixas = display . caixasAndOrigin2Pict
\end{code}

\subsection*{Problema 3}

Seguindo o racioc??nio do anexo B obtemos as seguintes express??es em recursividade m??tua:

\begin{eqnarray*}
  cos\ x\ n = \sum_{i=0}^{n} \frac{(-1)^i}{(2i)!} x^{2i} 
\end{eqnarray*}
\begin{spec}
cos x 0 = 1
cos x (n+1) = h x n + cos x n
\end{spec}
\begin{eqnarray*}
  h\ x\ n = \frac{(-1)^n^+^1}{(2(n+1))!} x^{2(n+1)} 
\end{eqnarray*}
\begin{spec}
h x 0 = quad (-x) 2/2
h x (n+1) = quad (-x) 2/(s n) * h x n
\end{spec}
\begin{spec}
s 0 = 12
s (n+1) = p n + s n
\end{spec}
\begin{eqnarray*}
  p\ n = 8n + 18
\end{eqnarray*}
\begin{spec}
p 0 = 18
p (n+1) = 8 + p n
\end{spec}

Solu????o:
\begin{code}
cos' x = prj . for loop init where
   init = (1, -(quad x 2)/2, 12, 18)
   loop (cos,h,s,p) = (cos+h, -((quad x 2)/s)*h, p+s, 8+p)
   prj (cos,h,s,p) = cos
\end{code}

\paragraph{Valoriza????o}

De seguida ?? apresentada a translitera????o do c??digo para a linguagem C:

\begin{spec}
float cos(float x, int n)
{
  float cos=1; float h=-(quad x 2)/2; int s=12; int p=18; int i;
  for ((i=0;i<n+1;i++)) {cos=cos+h;h=-(quad x 2)/s*h;s=p+s;p+=8}
  return cos;
};
\end{spec}

\subsection*{Problema 4}
Triologia ``ana-cata-hilo":

\paragraph{Diagrama de outNode}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Node a b|
           \ar[r]_-{|outNode|}
&
    |a + b|
}
\end{eqnarray*}

\begin{code}
outNode (File a) = i1 a
outNode (Dir a) = i2 a
\end{code}

\paragraph{Diagrama de outFS}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |FS a b|
           \ar[r]_-{|outFS|}
&
    |expl ((a >< (b + FS a b)))|
}
\end{eqnarray*}

\begin{code}
outFS (FS l) = map (id >< outNode) l

baseFS f g h = map (f >< (g -|- h))

\end{code}

\paragraph{Diagrama de cataFS}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |FS a b|
           \ar[d]_-{|cataNat g|}
           \ar[r]_-{|outFS|}
&
    |expl ((a >< (b + FS a b)))|
           \ar[d]^{|map (id >< id + cataNat g)|}
\\
     |C|
&
     |expl ((a >< (b + C)))|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\begin{code}

cataFS :: ([(a, Either b c)] -> c) -> FS a b -> c
cataFS g = g . recFS (cataFS g) . outFS

\end{code}

\paragraph{Diagrama de anaFS}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |FS a b|
&
    |expl ((a >< (b + FS a b)))|
           \ar[l]_-{|inFS|}
\\
     |C|
           \ar[u]^-{|anaNat g|}
           \ar[r]_-{|g|}
&
     |expl ((a >< (b + C)))|
           \ar[u]_{|map (id >< id + anaNat g)|}
}
\end{eqnarray*}

\begin{code}

anaFS :: (c -> [(a, Either b c)]) -> c -> FS a b
anaFS g = inFS . recFS (anaFS g) . g

hyloFS g h = cataFS g . anaFS h
\end{code}
Outras fun????es pedidas:
\begin{code}
check :: (Eq a) => FS a b -> Bool
check = undefined

tar :: FS a b -> [(Path a, b)]
tar = undefined

untar :: (Eq a) => [(Path a, b)] -> FS a b
untar = undefined

find :: (Eq a) => a -> FS a b -> [Path a]
find = undefined

\end{code}

\paragraph{(e)}

A |checkFiles| verifica se existem ficheiros (File) com o mesmo nome, enquanto que a |check|, para al??m disto, averigua tamb??m se todas as diretorias (Dir) t??m nomes diferentes. Contudo, a |new| apenas adiciona ficheiros novos, logo a propriedade |prop_new| ?? v??lida em ambos os casos.

\begin{code}

new :: (Eq a) => Path a -> b -> FS a b -> FS a b
new = undefined

cp :: (Eq a) => Path a -> Path a -> FS a b -> FS a b
cp = undefined

rm :: (Eq a) => (Path a) -> (FS a b) -> FS a b
rm = undefined

auxJoin :: ([(a, Either b c)],d) -> [(a, Either b (d,c))]
auxJoin = undefined

cFS2Exp :: a -> FS a b -> (Exp () a)
cFS2Exp = undefined
\end{code}

%----------------- Fim do anexo com solu????es dos alunos ------------------------%

%----------------- ??ndice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1819t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
