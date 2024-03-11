ÔY
Ö/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Repositories/RoomRepository.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Repositories" .
{ 
public 

class 
RoomRepository 
:  !
IRoomRepository" 1
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
$str9 C
)C D
;D E
private 
readonly (
VisualAccessDbContextMongoDB 5
	dbContext6 ?
;? @
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
RoomRepository 
( (
VisualAccessDbContextMongoDB :
	dbContext; D
,D E
IGenericMapperF T
mapperU [
)[ \
{ 	
this 
. 
	dbContext 
= 
	dbContext &
;& '
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
DatabaseResult (
>( )

AddNewRoom* 4
(4 5
Room5 9
room: >
)> ?
{ 	
RoomDto 
newRoom 
= 
mapper $
.$ %
Map% (
<( )
Room) -
,- .
RoomDto/ 6
>6 7
(7 8
room8 <
)< =
;= >
try   
{!! 
await"" 
	dbContext"" 
.""  
RoomsCollection""  /
.""/ 0
InsertOneAsync""0 >
(""> ?
newRoom""? F
)""F G
;""G H
log## 
.## 
Info## 
(## 
$"## 
$str## *
{##* +
newRoom##+ 2
.##2 3
Name##3 7
}##7 8
$str##8 N
"##N O
)##O P
;##P Q
return$$ 
DatabaseResult$$ %
.$$% &
OK$$& (
;$$( )
}%% 
catch&& 
(&& 
MongoWriteException&& &
ex&&' )
)&&) *
when&&+ /
(&&0 1
ex&&1 3
.&&3 4

WriteError&&4 >
.&&> ?
Category&&? G
==&&H J
ServerErrorCategory&&K ^
.&&^ _
DuplicateKey&&_ k
)&&k l
{'' 
log(( 
.(( 
Warn(( 
((( 
$"(( 
$str(( *
{((* +
newRoom((+ 2
.((2 3
Name((3 7
}((7 8
$str((8 G
"((G H
)((H I
;((I J
return)) 
DatabaseResult)) %
.))% &!
ACCOUNT_AlREADY_EXIST))& ;
;)); <
}** 
catch++ 
(++ 
	Exception++ 
e++ 
)++ 
{,, 
ExceptionLogger-- 
.--  
Log--  #
(--# $
log--$ '
,--' (
e--) *
)--* +
;--+ ,
return.. 
DatabaseResult.. %
...% &
UNKNOWN_ERROR..& 3
;..3 4
}// 
}00 	
public22 
async22 
Task22 
<22 
IDtoBase22 "
?22" #
>22# $
GetRoom22% ,
(22, -
string22- 3
roomName224 <
)22< =
{33 	
var44 
filter44 
=44 
Builders44 !
<44! "
RoomDto44" )
>44) *
.44* +
Filter44+ 1
.441 2
Eq442 4
(444 5
r445 6
=>447 9
r44: ;
.44; <
Name44< @
,44@ A
roomName44B J
.44J K
ToLower44K R
(44R S
)44S T
)44T U
;44U V
try55 
{66 
var77 
roomDTO77 
=77 
await77 #
	dbContext77$ -
.77- .
RoomsCollection77. =
.77= >
Find77> B
(77B C
filter77C I
)77I J
.77J K
FirstOrDefaultAsync77K ^
(77^ _
)77_ `
;77` a
if88 
(88 
roomDTO88 
==88 
null88 #
)88# $
{99 
log:: 
.:: 
Info:: 
(:: 
$":: 
$str:: .
{::. /
roomName::/ 7
}::7 8
$str::8 C
"::C D
)::D E
;::E F
return;; 
null;; 
;;;  
}<< 
log>> 
.>> 
Info>> 
(>> 
$">> 
$str>> *
{>>* +
roomName>>+ 3
}>>3 4
$str>>4 L
">>L M
)>>M N
;>>N O
return?? 
roomDTO?? 
;?? 
}@@ 
catchAA 
(AA 
	ExceptionAA 
eAA 
)AA 
{BB 
ExceptionLoggerCC 
.CC  
LogCC  #
(CC# $
logCC$ '
,CC' (
eCC) *
)CC* +
;CC+ ,
returnDD 
nullDD 
;DD 
}EE 
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
DatabaseResultHH (
>HH( )

RemoveRoomHH* 4
(HH4 5
RoomHH5 9
roomHH: >
)HH> ?
{II 	
varJJ 
filterJJ 
=JJ 
BuildersJJ !
<JJ! "
RoomDtoJJ" )
>JJ) *
.JJ* +
FilterJJ+ 1
.JJ1 2
EqJJ2 4
(JJ4 5
rJJ5 6
=>JJ7 9
rJJ: ;
.JJ; <
IdJJ< >
,JJ> ?
roomJJ@ D
.JJD E
IdJJE G
)JJG H
;JJH I
tryLL 
{MM 
varNN 
resultNN 
=NN 
awaitNN "
	dbContextNN# ,
.NN, -
RoomsCollectionNN- <
.NN< =
DeleteOneAsyncNN= K
(NNK L
filterNNL R
)NNR S
;NNS T
ifOO 
(OO 
resultOO 
.OO 
DeletedCountOO '
==OO( *
$numOO+ ,
)OO, -
{PP 
returnQQ 
DatabaseResultQQ )
.QQ) *
ROOM_NOT_FOUNDQQ* 8
;QQ8 9
}RR 
logTT 
.TT 
InfoTT 
(TT 
$"TT 
$strTT (
{TT( )
roomTT) -
.TT- .
IdTT. 0
}TT0 1
$strTT1 G
"TTG H
)TTH I
;TTI J
returnUU 
DatabaseResultUU %
.UU% &
OKUU& (
;UU( )
}VV 
catchWW 
(WW 
	ExceptionWW 
eWW 
)WW 
{XX 
ExceptionLoggerYY 
.YY  
LogYY  #
(YY# $
logYY$ '
,YY' (
eYY) *
)YY* +
;YY+ ,
returnZZ 
DatabaseResultZZ %
.ZZ% &
UNKNOWN_ERRORZZ& 3
;ZZ3 4
}[[ 
}\\ 	
public^^ 
async^^ 
Task^^ 
<^^ 
DatabaseResult^^ (
>^^( )
	RoomExist^^* 3
(^^3 4
string^^4 :
roomName^^; C
)^^C D
{__ 	
var`` 
filter`` 
=`` 
Builders`` !
<``! "
RoomDto``" )
>``) *
.``* +
Filter``+ 1
.``1 2
Eq``2 4
(``4 5
r``5 6
=>``7 9
r``: ;
.``; <
Name``< @
,``@ A
roomName``B J
.``J K
ToLower``K R
(``R S
)``S T
)``T U
;``U V
varaa 
countaa 
=aa 
awaitaa 
	dbContextaa '
.aa' (
RoomsCollectionaa( 7
.aa7 8
CountDocumentsAsyncaa8 K
(aaK L
filteraaL R
)aaR S
;aaS T
returnbb 
countbb 
>bb 
$numbb 
?bb 
DatabaseResultbb -
.bb- .

ROOM_EXISTbb. 8
:bb9 :
DatabaseResultbb; I
.bbI J
ROOM_NOT_FOUNDbbJ X
;bbX Y
}cc 	
publicee 
asyncee 
Taskee 
<ee 
IEnumerableee %
<ee% &
IDtoBaseee& .
>ee. /
>ee/ 0
GetRoomsByPageee1 ?
(ee? @
intee@ C

pageNumbereeD N
,eeN O
inteeP S
pageSizeeeT \
=ee] ^
$numee_ `
)ee` a
{ff 	
trygg 
{hh 
intii 
skipii 
=ii 
(ii 

pageNumberii &
-ii' (
$numii) *
)ii* +
*ii, -
pageSizeii. 6
;ii6 7
varkk 
filterkk 
=kk 
Builderskk %
<kk% &
RoomDtokk& -
>kk- .
.kk. /
Filterkk/ 5
.kk5 6
Emptykk6 ;
;kk; <
varmm 
roomsmm 
=mm 
awaitmm !
	dbContextmm" +
.mm+ ,
RoomsCollectionmm, ;
.nn 
Findnn 
(nn 
filternn  
)nn  !
.oo 
Skipoo 
(oo 
skipoo 
)oo 
.pp 
Limitpp 
(pp 
pageSizepp #
)pp# $
.qq 
ToListAsyncqq  
(qq  !
)qq! "
;qq" #
logss 
.ss 
Infoss 
(ss 
$"ss 
$strss !
{ss! "
roomsss" '
.ss' (
Countss( -
}ss- .
$strss. =
{ss= >

pageNumberss> H
}ssH I
$strssI J
"ssJ K
)ssK L
;ssL M
returnuu 
roomsuu 
;uu 
}vv 
catchww 
(ww 
	Exceptionww 
eww 
)ww 
{xx 
ExceptionLoggeryy 
.yy  
Logyy  #
(yy# $
logyy$ '
,yy' (
eyy) *
)yy* +
;yy+ ,
throwzz 
;zz 
}{{ 
}|| 	
public~~ 
async~~ 
Task~~ 
<~~ 
long~~ 
>~~ 
GetRoomsCount~~  -
(~~- .
)~~. /
{ 	
try
ÄÄ 
{
ÅÅ 
return
ÇÇ 
await
ÇÇ 
	dbContext
ÇÇ &
.
ÇÇ& '
RoomsCollection
ÇÇ' 6
.
ÇÇ6 7!
CountDocumentsAsync
ÇÇ7 J
(
ÇÇJ K
Builders
ÇÇK S
<
ÇÇS T
RoomDto
ÇÇT [
>
ÇÇ[ \
.
ÇÇ\ ]
Filter
ÇÇ] c
.
ÇÇc d
Empty
ÇÇd i
)
ÇÇi j
;
ÇÇj k
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
	Exception
ÑÑ 
e
ÑÑ 
)
ÑÑ 
{
ÖÖ 
ExceptionLogger
ÜÜ 
.
ÜÜ  
Log
ÜÜ  #
(
ÜÜ# $
log
ÜÜ$ '
,
ÜÜ' (
e
ÜÜ) *
)
ÜÜ* +
;
ÜÜ+ ,
throw
áá 
;
áá 
}
àà 
}
ââ 	
}
ää 
}ãã ¥[
ñ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Repositories/RequestRoomPermissionRepository.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Repositories" .
{ 
public 

class +
RequestRoomPermissionRepository 0
:1 2,
 IRequestRoomPermissionRepository3 S
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
$str9 C
)C D
;D E
private 
readonly (
VisualAccessDbContextMongoDB 5
	dbContext6 ?
;? @
private 
readonly 
IGenericMapper '
mapper( .
;. /
public +
RequestRoomPermissionRepository .
(. /(
VisualAccessDbContextMongoDB/ K
	dbContextL U
,U V
IGenericMapperW e
mapperf l
)l m
{ 	
this 
. 
	dbContext 
= 
	dbContext &
;& '
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
DatabaseResult (
>( )
CreateRequest* 7
(7 8!
RequestRoomPermission8 M!
requestRoomPermissionN c
)c d
{ 	$
RequestRoomPermissionDto $

newRequest% /
=0 1
mapper2 8
.8 9
Map9 <
<< =!
RequestRoomPermission= R
,R S$
RequestRoomPermissionDtoT l
>l m
(m n"
requestRoomPermission	n É
)
É Ñ
;
Ñ Ö
try 
{ 
await   
	dbContext   
.    +
RequestRoomPermissionCollection    ?
.  ? @
InsertOneAsync  @ N
(  N O

newRequest  O Y
)  Y Z
;  Z [
log!! 
.!! 
Info!! 
(!! 
$"!! 
$str!! ?
{!!? @

newRequest!!@ J
.!!J K
Username!!K S
}!!S T
$str!!T ]
{!!] ^

newRequest!!^ h
.!!h i
RoomName!!i q
}!!q r
$str	!!r à
"
!!à â
)
!!â ä
;
!!ä ã
return"" 
DatabaseResult"" %
.""% &
OK""& (
;""( )
}## 
catch$$ 
($$ 
	Exception$$ 
e$$ 
)$$ 
{%% 
ExceptionLogger&& 
.&&  
Log&&  #
(&&# $
log&&$ '
,&&' (
e&&) *
)&&* +
;&&+ ,
return'' 
DatabaseResult'' %
.''% &
UNKNOWN_ERROR''& 3
;''3 4
}(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
DatabaseResult++ (
>++( )
DeleteRequest++* 7
(++7 8!
RequestRoomPermission++8 M!
requestRoomPermission++N c
)++c d
{,, 	
try-- 
{.. 
var// 
deleteResult//  
=//! "
await//# (
	dbContext//) 2
.//2 3+
RequestRoomPermissionCollection//3 R
.//R S
DeleteOneAsync//S a
(//a b
r//b c
=>//d f
r//g h
.//h i
Id//i k
==//l n"
requestRoomPermission	//o Ñ
.
//Ñ Ö
Id
//Ö á
)
//á à
;
//à â
if11 
(11 
deleteResult11  
.11  !
DeletedCount11! -
<=11. 0
$num111 2
)112 3
{22 
log33 
.33 
Warn33 
(33 
$"33 
$str33 ?
{33? @!
requestRoomPermission33@ U
.33U V
Id33V X
}33X Y
$str33Y h
"33h i
)33i j
;33j k
return44 
DatabaseResult44 )
.44) *
REQUEST_NOT_FOUND44* ;
;44; <
}55 
log77 
.77 
Info77 
(77 
$"77 
$str77 ;
{77; <!
requestRoomPermission77< Q
.77Q R
Id77R T
}77T U
$str77U o
"77o p
)77p q
;77q r
return88 
DatabaseResult88 %
.88% &
OK88& (
;88( )
}99 
catch:: 
(:: 
	Exception:: 
e:: 
):: 
{;; 
ExceptionLogger<< 
.<<  
Log<<  #
(<<# $
log<<$ '
,<<' (
e<<) *
)<<* +
;<<+ ,
return== 
DatabaseResult== %
.==% &
UNKNOWN_ERROR==& 3
;==3 4
}>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
IDtoBaseAA "
?AA" #
>AA# $
GetByIdAA% ,
(AA, -
stringAA- 3
	requestIdAA4 =
)AA= >
{BB 	
tryCC 
{DD 
varEE 
filterEE 
=EE 
BuildersEE %
<EE% &$
RequestRoomPermissionDtoEE& >
>EE> ?
.EE? @
FilterEE@ F
.EEF G
EqEEG I
(EEI J
rEEJ K
=>EEL N
rEEO P
.EEP Q
IdEEQ S
,EES T
	requestIdEEU ^
)EE^ _
;EE_ `
varFF 

requestDtoFF 
=FF  
awaitFF! &
	dbContextFF' 0
.FF0 1+
RequestRoomPermissionCollectionFF1 P
.FFP Q
FindFFQ U
(FFU V
filterFFV \
)FF\ ]
.FF] ^
FirstOrDefaultAsyncFF^ q
(FFq r
)FFr s
;FFs t
ifHH 
(HH 

requestDtoHH 
isHH !
nullHH" &
)HH& '
{II 
logJJ 
.JJ 
WarnJJ 
(JJ 
$"JJ 
$strJJ ?
{JJ? @
	requestIdJJ@ I
}JJI J
$strJJJ Y
"JJY Z
)JJZ [
;JJ[ \
returnKK 
nullKK 
;KK  
}LL 
logNN 
.NN 
InfoNN 
(NN 
$"NN 
$strNN A
{NNA B
	requestIdNNB K
}NNK L
$strNNL M
"NNM N
)NNN O
;NNO P
returnOO 

requestDtoOO !
;OO! "
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
eQQ 
)QQ 
{RR 
ExceptionLoggerSS 
.SS  
LogSS  #
(SS# $
logSS$ '
,SS' (
eSS) *
)SS* +
;SS+ ,
throwTT 
;TT 
}UU 
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX 
IEnumerableXX %
<XX% &
IDtoBaseXX& .
>XX. /
>XX/ 0
	GetByPageXX1 :
(XX: ;
intXX; >

pageNumberXX? I
,XXI J
intXXK N
pageSizeXXO W
=XXX Y
$numXXZ [
)XX[ \
{YY 	
tryZZ 
{[[ 
int\\ 
skip\\ 
=\\ 
(\\ 

pageNumber\\ &
-\\' (
$num\\) *
)\\* +
*\\, -
pageSize\\. 6
;\\6 7
var^^ 
filter^^ 
=^^ 
Builders^^ %
<^^% &$
RequestRoomPermissionDto^^& >
>^^> ?
.^^? @
Filter^^@ F
.^^F G
Empty^^G L
;^^L M
var`` 
requests`` 
=`` 
await`` $
	dbContext``% .
.``. /+
RequestRoomPermissionCollection``/ N
.aa 
Findaa 
(aa 
filteraa  
)aa  !
.bb 
Skipbb 
(bb 
skipbb 
)bb 
.cc 
Limitcc 
(cc 
pageSizecc #
)cc# $
.dd 
ToListAsyncdd  
(dd  !
)dd! "
;dd" #
logff 
.ff 
Infoff 
(ff 
$"ff 
$strff !
{ff! "
requestsff" *
.ff* +
Countff+ 0
}ff0 1
$strff1 S
{ffS T

pageNumberffT ^
}ff^ _
$strff_ `
"ff` a
)ffa b
;ffb c
returnhh 
requestshh 
;hh  
}ii 
catchjj 
(jj 
	Exceptionjj 
ejj 
)jj 
{kk 
ExceptionLoggerll 
.ll  
Logll  #
(ll# $
logll$ '
,ll' (
ell) *
)ll* +
;ll+ ,
throwmm 
;mm 
}nn 
}oo 	
publicqq 
asyncqq 
Taskqq 
<qq 
boolqq 
>qq 
RequestExistsqq  -
(qq- .
stringqq. 4
usernameqq5 =
,qq= >
stringqq? E
roomNameqqF N
)qqN O
{rr 	
tryss 
{tt 
varuu 
filteruu 
=uu 
Buildersuu %
<uu% &$
RequestRoomPermissionDtouu& >
>uu> ?
.uu? @
Filteruu@ F
.uuF G
AnduuG J
(uuJ K
Buildersvv 
<vv $
RequestRoomPermissionDtovv 5
>vv5 6
.vv6 7
Filtervv7 =
.vv= >
Eqvv> @
(vv@ A
rvvA B
=>vvC E
rvvF G
.vvG H
UsernamevvH P
,vvP Q
usernamevvR Z
)vvZ [
,vv[ \
Buildersww 
<ww $
RequestRoomPermissionDtoww 5
>ww5 6
.ww6 7
Filterww7 =
.ww= >
Eqww> @
(ww@ A
rwwA B
=>wwC E
rwwF G
.wwG H
RoomNamewwH P
,wwP Q
roomNamewwR Z
)wwZ [
)ww[ \
;ww\ ]
varyy 
countyy 
=yy 
awaityy !
	dbContextyy" +
.yy+ ,+
RequestRoomPermissionCollectionyy, K
.yyK L
CountDocumentsAsyncyyL _
(yy_ `
filteryy` f
)yyf g
;yyg h
return{{ 
count{{ 
>{{ 
$num{{  
;{{  !
}|| 
catch}} 
(}} 
	Exception}} 
e}} 
)}} 
{~~ 
ExceptionLogger 
.  
Log  #
(# $
log$ '
,' (
e) *
)* +
;+ ,
throw
ÄÄ 
;
ÄÄ 
}
ÅÅ 
}
ÇÇ 	
public
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ 
long
ÑÑ 
>
ÑÑ 
GetRequestsCount
ÑÑ  0
(
ÑÑ0 1
)
ÑÑ1 2
{
ÖÖ 	
var
ÜÜ 
filter
ÜÜ 
=
ÜÜ 
Builders
ÜÜ !
<
ÜÜ! "&
RequestRoomPermissionDto
ÜÜ" :
>
ÜÜ: ;
.
ÜÜ; <
Filter
ÜÜ< B
.
ÜÜB C
Empty
ÜÜC H
;
ÜÜH I
return
áá 
await
áá 
	dbContext
áá "
.
áá" #-
RequestRoomPermissionCollection
áá# B
.
ááB C!
CountDocumentsAsync
ááC V
(
ááV W
filter
ááW ]
)
áá] ^
;
áá^ _
}
àà 	
}
ää 
}ãã †
Ö/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Repositories/FaceRepository.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Repositories" .
{ 
public 

class 
FaceRepository 
:  !
IFaceRepository" 1
{ 
private 
readonly &
VisualAccessDbContextPgSql 3
	dbContext4 =
;= >
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
$str9 C
)C D
;D E
public 
FaceRepository 
( &
VisualAccessDbContextPgSql 8
	dbContext9 B
)B C
{ 	
this 
. 
	dbContext 
= 
	dbContext &
;& '
} 	
public 
async 
Task 
< 
DatabaseResult (
>( )

RemoveFace* 4
(4 5
int5 8
id9 ;
); <
{ 	
var 
faceId 
= 
await 
	dbContext (
.( )
Faces) .
.. /
FirstOrDefaultAsync/ B
(B C
fC D
=>E G
fH I
.I J
IdJ L
==M O
idP R
)R S
;S T
if 
( 
faceId 
is 
null 
) 
{ 
log 
. 
Error 
( 
$" 
$str -
{- .
id. 0
}0 1
$str1 K
"K L
)L M
;M N
return 
DatabaseResult %
.% &
FACE_NOT_FOUND& 4
;4 5
} 
try!! 
{"" 
	dbContext## 
.## 
Faces## 
.##  
Remove##  &
(##& '
faceId##' -
)##- .
;##. /
await$$ 
	dbContext$$ 
.$$  
SaveChangesAsync$$  0
($$0 1
)$$1 2
;$$2 3
log%% 
.%% 
Info%% 
(%% 
$"%% 
$str%% ?
{%%? @
faceId%%@ F
.%%F G
Id%%G I
}%%I J
$str%%J X
"%%X Y
)%%Y Z
;%%Z [
return&& 
DatabaseResult&& %
.&&% &
OK&&& (
;&&( )
}'' 
catch(( 
((( 
	Exception(( 
e(( 
)(( 
{)) 
ExceptionLogger** 
.**  
Log**  #
(**# $
log**$ '
,**' (
e**) *
)*** +
;**+ ,
return++ 
DatabaseResult++ %
.++% &
UNKNOWN_ERROR++& 3
;++3 4
},, 
}-- 	
}.. 
}// ⁄.
ë/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Repositories/RequestDecisionsRepository.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Repositories" .
;. /
public 
class &
RequestDecisionsRepository '
:( )'
IRequestDecisionsRepository* E
{ 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
$str5 ?
)? @
;@ A
private 
readonly (
VisualAccessDbContextMongoDB 1
	dbContext2 ;
;; <
private 
readonly 
IGenericMapper #
mapper$ *
;* +
public 
&
RequestDecisionsRepository %
(% &(
VisualAccessDbContextMongoDB& B
	dbContextC L
,L M
IGenericMapperN \
mapper] c
)c d
{ 
this 
. 
	dbContext 
= 
	dbContext "
;" #
this 
. 
mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
DatabaseResult $
>$ %
AddRequestDecision& 8
(8 9
RequestDecisions9 I
requestDecisionJ Y
)Y Z
{ 
try 
{ 	
var 
requestDecisionDTO "
=# $
mapper% +
.+ ,
Map, /
</ 0
RequestDecisions0 @
,@ A
RequestDecisionsDtoB U
>U V
(V W
requestDecisionW f
)f g
;g h
await 
	dbContext 
. &
RequestDecisionsCollection 6
.6 7
InsertOneAsync7 E
(E F
requestDecisionDTOF X
)X Y
;Y Z
return 
DatabaseResult !
.! "
OK" $
;$ %
}   	
catch!! 
(!! 
	Exception!! 
ex!! 
)!! 
{"" 	
log## 
.## 
Error## 
(## 
$"## 
$str## 7
{##7 8
ex##8 :
.##: ;
Message##; B
}##B C
"##C D
)##D E
;##E F
return$$ 
DatabaseResult$$ !
.$$! "
UNKNOWN_ERROR$$" /
;$$/ 0
}%% 	
}&& 
public(( 

async(( 
Task(( 
<(( 
IEnumerable(( !
<((! "
IDtoBase((" *
>((* +
>((+ ,$
GetRequestDecisionByPage((- E
(((E F
int((F I

pageNumber((J T
,((T U
int((V Y
pageSize((Z b
=((c d
$num((e f
)((f g
{)) 
try** 
{++ 	
int,, 
skip,, 
=,, 
(,, 

pageNumber,, "
-,,# $
$num,,% &
),,& '
*,,( )
pageSize,,* 2
;,,2 3
var.. 
filter.. 
=.. 
Builders.. !
<..! "
RequestDecisionsDto.." 5
>..5 6
...6 7
Filter..7 =
...= >
Empty..> C
;..C D
var00 
requestDecisions00  
=00! "
await00# (
	dbContext00) 2
.002 3&
RequestDecisionsCollection003 M
.11 
Find11 
(11 
filter11 
)11 
.22 
Skip22 
(22 
skip22 
)22 
.33 
Limit33 
(33 
pageSize33 
)33  
.44 
ToListAsync44 
(44 
)44 
;44 
log66 
.66 
Info66 
(66 
$"66 
$str66 
{66 
requestDecisions66 .
.66. /
Count66/ 4
}664 5
$str665 P
{66P Q

pageNumber66Q [
}66[ \
$str66\ ]
"66] ^
)66^ _
;66_ `
return88 
requestDecisions88 #
;88# $
}99 	
catch:: 
(:: 
	Exception:: 
e:: 
):: 
{;; 	
ExceptionLogger<< 
.<< 
Log<< 
(<<  
log<<  #
,<<# $
e<<% &
)<<& '
;<<' (
throw== 
;== 
}>> 	
}?? 
publicAA 

asyncAA 
TaskAA 
<AA 
longAA 
>AA 
GetRequestsCountAA ,
(AA, -
)AA- .
{BB 
tryCC 
{DD 	
longEE 
countEE 
=EE 
awaitEE 
	dbContextEE (
.EE( )&
RequestDecisionsCollectionEE) C
.EEC D
CountDocumentsAsyncEED W
(EEW X
BuildersEEX `
<EE` a
RequestDecisionsDtoEEa t
>EEt u
.EEu v
FilterEEv |
.EE| }
Empty	EE} Ç
)
EEÇ É
;
EEÉ Ñ
logFF 
.FF 
InfoFF 
(FF 
$"FF 
$strFF 
{FF 
countFF #
}FF# $
$strFF$ 7
"FF7 8
)FF8 9
;FF9 :
returnGG 
countGG 
;GG 
}HH 	
catchII 
(II 
	ExceptionII 
eII 
)II 
{JJ 	
ExceptionLoggerKK 
.KK 
LogKK 
(KK  
logKK  #
,KK# $
eKK% &
)KK& '
;KK' (
throwLL 
;LL 
}MM 	
}NN 
}OO ä(
è/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Repositories/EntranceRecordRepository.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Repositories" .
{ 
public 

class $
EntranceRecordRepository )
:* +%
IEntranceRecordRepository, E
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
$str9 C
)C D
;D E
private 
readonly (
VisualAccessDbContextMongoDB 5
	dbContext6 ?
;? @
private 
readonly 
IGenericMapper '
mapper( .
;. /
public $
EntranceRecordRepository '
(' ((
VisualAccessDbContextMongoDB( D
	dbContextE N
,N O
IGenericMapperP ^
mapper_ e
)e f
{ 	
this 
. 
	dbContext 
= 
	dbContext &
;& '
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
DatabaseResult (
>( ) 
CreateEntranceRecord* >
(> ?
EntranceRecord? M
entranceRecordN \
)\ ]
{ 	
EntranceRecordDto 
newEntranceRecord /
=0 1
mapper2 8
.8 9
Map9 <
<< =
EntranceRecord= K
,K L
EntranceRecordDtoM ^
>^ _
(_ `
entranceRecord` n
)n o
;o p
await 
	dbContext 
. %
EntranceRecordsCollection 5
.5 6
InsertOneAsync6 D
(D E
newEntranceRecordE V
)V W
;W X
log 
. 
Info 
( 
$" 
$str <
"< =
)= >
;> ?
return   
DatabaseResult   !
.  ! "
OK  " $
;  $ %
}!! 	
public## 
async## 
Task## 
<## 
IEnumerable## %
<##% &
IDtoBase##& .
>##. /
>##/ 0$
GetEntranceRecordsByPage##1 I
(##I J
int##J M

pageNumber##N X
,##X Y
int##Z ]
pageSize##^ f
=##g h
$num##i j
)##j k
{$$ 	
try%% 
{&& 
int'' 
skip'' 
='' 
('' 

pageNumber'' &
-''' (
$num'') *
)''* +
*'', -
pageSize''. 6
;''6 7
var)) 
filter)) 
=)) 
Builders)) %
<))% &
EntranceRecordDto))& 7
>))7 8
.))8 9
Filter))9 ?
.))? @
Empty))@ E
;))E F
var** 
entranceRecords** #
=**$ %
await**& +
	dbContext**, 5
.**5 6%
EntranceRecordsCollection**6 O
.++ 
Find++ 
(++ 
filter++  
)++  !
.,, 
SortByDescending,, %
(,,% &
record,,& ,
=>,,- /
record,,0 6
.,,6 7
Time,,7 ;
),,; <
.-- 
Skip-- 
(-- 
skip-- 
)-- 
... 
Limit.. 
(.. 
pageSize.. #
)..# $
.// 
ToListAsync//  
(//  !
)//! "
;//" #
log11 
.11 
Info11 
(11 
$"11 
$str11 !
{11! "
entranceRecords11" 1
.111 2
Count112 7
}117 8
$str118 R
{11R S

pageNumber11S ]
}11] ^
"11^ _
)11_ `
;11` a
return22 
entranceRecords22 &
;22& '
}33 
catch44 
(44 
	Exception44 
e44 
)44 
{55 
ExceptionLogger66 
.66  
Log66  #
(66# $
log66$ '
,66' (
e66) *
)66* +
;66+ ,
throw77 
;77 
}88 
}99 	
public;; 
async;; 
Task;; 
<;; 
long;; 
>;; #
GetEntranceRecordsCount;;  7
(;;7 8
);;8 9
{<< 	
return== 
await== 
	dbContext== "
.==" #%
EntranceRecordsCollection==# <
.==< =
CountDocumentsAsync=== P
(==P Q
Builders==Q Y
<==Y Z
EntranceRecordDto==Z k
>==k l
.==l m
Filter==m s
.==s t
Empty==t y
)==y z
;==z {
}>> 	
}?? 
}@@ ˛í
à/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Repositories/AccountRepository.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Repositories" .
{ 
public 

class 
AccountRepository "
:# $
IAccountRepository% 7
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
$str9 C
)C D
;D E
private 
readonly (
VisualAccessDbContextMongoDB 5
	dbContext6 ?
;? @
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
AccountRepository  
(  !(
VisualAccessDbContextMongoDB! =
	dbContext> G
,G H
IGenericMapperI W
mapperX ^
)^ _
{ 	
this 
. 
	dbContext 
= 
	dbContext &
;& '
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
DatabaseResult (
>( )
CreateAccount* 7
(7 8
Account8 ?
account@ G
)G H
{ 	

AccountDto 

newAccount !
=" #
mapper$ *
.* +
Map+ .
<. /
Account/ 6
,6 7

AccountDto8 B
>B C
(C D
accountD K
)K L
;L M
try   
{!! 
await"" 
	dbContext"" 
.""  
AccountsCollection""  2
.""2 3
InsertOneAsync""3 A
(""A B

newAccount""B L
)""L M
;""M N
log## 
.## 
Info## 
(## 
$"## 
$str## 1
{##1 2

newAccount##2 <
.##< =
Username##= E
}##E F
$str##F \
"##\ ]
)##] ^
;##^ _
return$$ 
DatabaseResult$$ %
.$$% &
OK$$& (
;$$( )
}%% 
catch&& 
(&& 
MongoWriteException&& &
ex&&' )
)&&) *
when&&+ /
(&&0 1
ex&&1 3
.&&3 4

WriteError&&4 >
.&&> ?
Category&&? G
==&&H J
ServerErrorCategory&&K ^
.&&^ _
DuplicateKey&&_ k
)&&k l
{'' 
log(( 
.(( 
Warn(( 
((( 
$"(( 
$str(( 1
{((1 2

newAccount((2 <
.((< =
Username((= E
}((E F
$str((F U
"((U V
)((V W
;((W X
return)) 
DatabaseResult)) %
.))% &!
ACCOUNT_AlREADY_EXIST))& ;
;)); <
}** 
catch++ 
(++ 
	Exception++ 
e++ 
)++ 
{,, 
ExceptionLogger-- 
.--  
Log--  #
(--# $
log--$ '
,--' (
e--) *
)--* +
;--+ ,
return.. 
DatabaseResult.. %
...% &
UNKNOWN_ERROR..& 3
;..3 4
}// 
}00 	
public22 
async22 
Task22 
<22 
DatabaseResult22 (
>22( )
UpdateAccount22* 7
(227 8
Account228 ?
account22@ G
)22G H
{33 	

AccountDto44 
updatedAccountDto44 (
=44) *
mapper44+ 1
.441 2
Map442 5
<445 6
Account446 =
,44= >

AccountDto44? I
>44I J
(44J K
account44K R
)44R S
;44S T
updatedAccountDto66 
.66 
Id66  
=66! "
account66# *
.66* +
Id66+ -
;66- .
var88 
filter88 
=88 
Builders88 !
<88! "

AccountDto88" ,
>88, -
.88- .
Filter88. 4
.884 5
Eq885 7
(887 8
a888 9
=>88: <
a88= >
.88> ?
Id88? A
,88A B
updatedAccountDto88C T
.88T U
Id88U W
)88W X
;88X Y
try:: 
{;; 
var<< 
replaceResult<< !
=<<" #
await<<$ )
	dbContext<<* 3
.<<3 4
AccountsCollection<<4 F
.<<F G
ReplaceOneAsync<<G V
(<<V W
filter<<W ]
,<<] ^
updatedAccountDto<<_ p
,<<p q
new<<r u
ReplaceOptions	<<v Ñ
{
<<Ö Ü
IsUpsert
<<á è
=
<<ê ë
false
<<í ó
}
<<ò ô
)
<<ô ö
;
<<ö õ
if>> 
(>> 
replaceResult>> !
.>>! "
MatchedCount>>" .
==>>/ 1
$num>>2 3
)>>3 4
{?? 
log@@ 
.@@ 
Warn@@ 
(@@ 
$"@@ 
$str@@ /
{@@/ 0
account@@0 7
.@@7 8
Id@@8 :
}@@: ;
$str@@; Q
"@@Q R
)@@R S
;@@S T
returnAA 
DatabaseResultAA )
.AA) *
ACCOUNT_NOT_FOUNDAA* ;
;AA; <
}BB 
logDD 
.DD 
InfoDD 
(DD 
$"DD 
$strDD 1
{DD1 2
accountDD2 9
.DD9 :
UsernameDD: B
}DDB C
$strDDC Y
"DDY Z
)DDZ [
;DD[ \
returnEE 
DatabaseResultEE %
.EE% &
OKEE& (
;EE( )
}FF 
catchGG 
(GG 
	ExceptionGG 
eGG 
)GG 
{HH 
ExceptionLoggerII 
.II  
LogII  #
(II# $
logII$ '
,II' (
eII) *
)II* +
;II+ ,
returnJJ 
DatabaseResultJJ %
.JJ% &
UNKNOWN_ERRORJJ& 3
;JJ3 4
}KK 
}LL 	
publicNN 
asyncNN 
TaskNN 
<NN 
DatabaseResultNN (
>NN( )
RemoveAccountNN* 7
(NN7 8
AccountNN8 ?
accountNN@ G
)NNG H
{OO 	
varPP 
filterPP 
=PP 
BuildersPP !
<PP! "

AccountDtoPP" ,
>PP, -
.PP- .
FilterPP. 4
.PP4 5
EqPP5 7
(PP7 8
aPP8 9
=>PP: <
aPP= >
.PP> ?
IdPP? A
,PPA B
accountPPC J
.PPJ K
IdPPK M
)PPM N
;PPN O
tryRR 
{SS 
varTT 
resultTT 
=TT 
awaitTT "
	dbContextTT# ,
.TT, -
AccountsCollectionTT- ?
.TT? @
DeleteOneAsyncTT@ N
(TTN O
filterTTO U
)TTU V
;TTV W
ifUU 
(UU 
resultUU 
.UU 
DeletedCountUU '
==UU( *
$numUU+ ,
)UU, -
{VV 
returnWW 
DatabaseResultWW )
.WW) *
ACCOUNT_NOT_FOUNDWW* ;
;WW; <
}XX 
logZZ 
.ZZ 
InfoZZ 
(ZZ 
$"ZZ 
$strZZ 1
{ZZ1 2
accountZZ2 9
.ZZ9 :
UsernameZZ: B
}ZZB C
$strZZC Y
"ZZY Z
)ZZZ [
;ZZ[ \
return[[ 
DatabaseResult[[ %
.[[% &
OK[[& (
;[[( )
}\\ 
catch]] 
(]] 
	Exception]] 
e]] 
)]] 
{^^ 
ExceptionLogger__ 
.__  
Log__  #
(__# $
log__$ '
,__' (
e__) *
)__* +
;__+ ,
return`` 
DatabaseResult`` %
.``% &
UNKNOWN_ERROR``& 3
;``3 4
}aa 
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
IDtoBasedd "
?dd" #
>dd# $

GetAccountdd% /
(dd/ 0
stringdd0 6
usernamedd7 ?
)dd? @
{ee 	
varff 
filterff 
=ff 
Buildersff !
<ff! "

AccountDtoff" ,
>ff, -
.ff- .
Filterff. 4
.ff4 5
Eqff5 7
(ff7 8
aff8 9
=>ff: <
aff= >
.ff> ?
Usernameff? G
,ffG H
usernameffI Q
.ffQ R
ToLowerffR Y
(ffY Z
)ffZ [
)ff[ \
;ff\ ]
returngg 
awaitgg 
	dbContextgg "
.gg" #
AccountsCollectiongg# 5
.gg5 6
Findgg6 :
(gg: ;
filtergg; A
)ggA B
.ggB C
FirstOrDefaultAsyncggC V
(ggV W
)ggW X
;ggX Y
}hh 	
publicjj 
asyncjj 
Taskjj 
<jj 
IDtoBasejj "
?jj" #
>jj# $

GetAccountjj% /
(jj/ 0
intjj0 3
faceIdjj4 :
)jj: ;
{kk 	
varll 
filterll 
=ll 
Buildersll !
<ll! "

AccountDtoll" ,
>ll, -
.ll- .
Filterll. 4
.ll4 5
Eqll5 7
(ll7 8
all8 9
=>ll: <
all= >
.ll> ?
FaceIDll? E
,llE F
faceIdllG M
)llM N
;llN O
returnmm 
awaitmm 
	dbContextmm "
.mm" #
AccountsCollectionmm# 5
.mm5 6
Findmm6 :
(mm: ;
filtermm; A
)mmA B
.mmB C
FirstOrDefaultAsyncmmC V
(mmV W
)mmW X
;mmX Y
}nn 	
publicpp 
asyncpp 
Taskpp 
<pp 
IEnumerablepp %
<pp% &
IDtoBasepp& .
>pp. /
>pp/ 0
GetAccountsByPagepp1 B
(ppB C
intppC F

pageNumberppG Q
,ppQ R
intppS V
pageSizeppW _
=pp` a
$numppb c
)ppc d
{qq 	
tryrr 
{ss 
inttt 
skiptt 
=tt 
(tt 

pageNumbertt &
-tt' (
$numtt) *
)tt* +
*tt, -
pageSizett. 6
;tt6 7
varvv 
filtervv 
=vv 
Buildersvv %
<vv% &

AccountDtovv& 0
>vv0 1
.vv1 2
Filtervv2 8
.vv8 9
Emptyvv9 >
;vv> ?
varxx 
accountsxx 
=xx 
awaitxx $
	dbContextxx% .
.xx. /
AccountsCollectionxx/ A
.yy 
Findyy 
(yy 
filteryy  
)yy  !
.zz 
Skipzz 
(zz 
skipzz 
)zz 
.{{ 
Limit{{ 
({{ 
pageSize{{ #
){{# $
.|| 
ToListAsync||  
(||  !
)||! "
;||" #
log~~ 
.~~ 
Info~~ 
(~~ 
$"~~ 
$str~~ !
{~~! "
accounts~~" *
.~~* +
Count~~+ 0
}~~0 1
$str~~1 B
{~~B C

pageNumber~~C M
}~~M N
"~~N O
)~~O P
;~~P Q
return 
accounts 
;  
}
ÄÄ 
catch
ÅÅ 
(
ÅÅ 
	Exception
ÅÅ 
e
ÅÅ 
)
ÅÅ 
{
ÇÇ 
ExceptionLogger
ÉÉ 
.
ÉÉ  
Log
ÉÉ  #
(
ÉÉ# $
log
ÉÉ$ '
,
ÉÉ' (
e
ÉÉ) *
)
ÉÉ* +
;
ÉÉ+ ,
throw
ÑÑ 
;
ÑÑ 
}
ÖÖ 
}
ÜÜ 	
public
àà 
async
àà 
Task
àà 
<
àà 
long
àà 
>
àà 
GetAccountCount
àà  /
(
àà/ 0
)
àà0 1
{
ââ 	
var
ää 
filter
ää 
=
ää 
Builders
ää !
<
ää! "

AccountDto
ää" ,
>
ää, -
.
ää- .
Filter
ää. 4
.
ää4 5
Empty
ää5 :
;
ää: ;
return
ãã 
await
ãã 
	dbContext
ãã "
.
ãã" # 
AccountsCollection
ãã# 5
.
ãã5 6!
CountDocumentsAsync
ãã6 I
(
ããI J
filter
ããJ P
)
ããP Q
;
ããQ R
}
åå 	
public
éé 
async
éé 
Task
éé 
<
éé 
bool
éé 
>
éé 
UsernameExist
éé  -
(
éé- .
string
éé. 4
username
éé5 =
)
éé= >
{
èè 	
var
êê 
filter
êê 
=
êê 
Builders
êê !
<
êê! "

AccountDto
êê" ,
>
êê, -
.
êê- .
Filter
êê. 4
.
êê4 5
Eq
êê5 7
(
êê7 8
a
êê8 9
=>
êê: <
a
êê= >
.
êê> ?
Username
êê? G
,
êêG H
username
êêI Q
.
êêQ R
ToLower
êêR Y
(
êêY Z
)
êêZ [
)
êê[ \
;
êê\ ]
var
ëë 
count
ëë 
=
ëë 
await
ëë 
	dbContext
ëë '
.
ëë' ( 
AccountsCollection
ëë( :
.
ëë: ;!
CountDocumentsAsync
ëë; N
(
ëëN O
filter
ëëO U
)
ëëU V
;
ëëV W
return
íí 
count
íí 
>
íí 
$num
íí 
;
íí 
}
ìì 	
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
bool
ïï 
>
ïï 

EmailExist
ïï  *
(
ïï* +
string
ïï+ 1
email
ïï2 7
)
ïï7 8
{
ññ 	
var
óó 
filter
óó 
=
óó 
Builders
óó !
<
óó! "

AccountDto
óó" ,
>
óó, -
.
óó- .
Filter
óó. 4
.
óó4 5
Eq
óó5 7
(
óó7 8
a
óó8 9
=>
óó: <
a
óó= >
.
óó> ?
Email
óó? D
,
óóD E
email
óóF K
)
óóK L
;
óóL M
var
òò 
count
òò 
=
òò 
await
òò 
	dbContext
òò '
.
òò' ( 
AccountsCollection
òò( :
.
òò: ;!
CountDocumentsAsync
òò; N
(
òòN O
filter
òòO U
)
òòU V
;
òòV W
return
ôô 
count
ôô 
>
ôô 
$num
ôô 
;
ôô 
}
öö 	
public
úú 
async
úú 
Task
úú 
<
úú 
bool
úú 
>
úú #
FaceAlreadyAssociated
úú  5
(
úú5 6
int
úú6 9
faceId
úú: @
)
úú@ A
{
ùù 	
var
ûû 
filter
ûû 
=
ûû 
Builders
ûû !
<
ûû! "

AccountDto
ûû" ,
>
ûû, -
.
ûû- .
Filter
ûû. 4
.
ûû4 5
Eq
ûû5 7
(
ûû7 8
a
ûû8 9
=>
ûû: <
a
ûû= >
.
ûû> ?
FaceID
ûû? E
,
ûûE F
faceId
ûûG M
)
ûûM N
;
ûûN O
var
üü 
count
üü 
=
üü 
await
üü 
	dbContext
üü '
.
üü' ( 
AccountsCollection
üü( :
.
üü: ;!
CountDocumentsAsync
üü; N
(
üüN O
filter
üüO U
)
üüU V
;
üüV W
return
†† 
count
†† 
>
†† 
$num
†† 
;
†† 
}
°° 	
public
££ 
async
££ 
Task
££ 
<
££ 
DatabaseResult
££ (
>
££( )0
"CleanupPermissionsAfterRoomRemoval
££* L
(
££L M
string
££M S
roomName
££T \
)
££\ ]
{
§§ 	
var
•• 
filter
•• 
=
•• 
Builders
•• !
<
••! "

AccountDto
••" ,
>
••, -
.
••- .
Filter
••. 4
.
••4 5
AnyEq
••5 :
(
••: ;
a
••; <
=>
••= ?
a
••@ A
.
••A B
AllowedRooms
••B N
,
••N O
roomName
••P X
)
••X Y
;
••Y Z
var
¶¶ 
update
¶¶ 
=
¶¶ 
Builders
¶¶ !
<
¶¶! "

AccountDto
¶¶" ,
>
¶¶, -
.
¶¶- .
Update
¶¶. 4
.
¶¶4 5
Pull
¶¶5 9
(
¶¶9 :
a
¶¶: ;
=>
¶¶< >
a
¶¶? @
.
¶¶@ A
AllowedRooms
¶¶A M
,
¶¶M N
roomName
¶¶O W
)
¶¶W X
;
¶¶X Y
try
®® 
{
©© 
var
™™ 
updateResult
™™  
=
™™! "
await
™™# (
	dbContext
™™) 2
.
™™2 3 
AccountsCollection
™™3 E
.
™™E F
UpdateManyAsync
™™F U
(
™™U V
filter
™™V \
,
™™\ ]
update
™™^ d
)
™™d e
;
™™e f
if
¨¨ 
(
¨¨ 
updateResult
¨¨  
.
¨¨  !
MatchedCount
¨¨! -
==
¨¨. 0
$num
¨¨1 2
)
¨¨2 3
{
≠≠ 
log
ÆÆ 
.
ÆÆ 
Warn
ÆÆ 
(
ÆÆ 
$"
ÆÆ 
$str
ÆÆ J
{
ÆÆJ K
roomName
ÆÆK S
}
ÆÆS T
$str
ÆÆT _
"
ÆÆ_ `
)
ÆÆ` a
;
ÆÆa b
return
ØØ 
DatabaseResult
ØØ )
.
ØØ) *
ACCOUNT_NOT_FOUND
ØØ* ;
;
ØØ; <
}
∞∞ 
log
≤≤ 
.
≤≤ 
Info
≤≤ 
(
≤≤ 
$"
≤≤ 
$str
≤≤ /
{
≤≤/ 0
roomName
≤≤0 8
}
≤≤8 9
$str
≤≤9 T
"
≤≤T U
)
≤≤U V
;
≤≤V W
return
≥≥ 
DatabaseResult
≥≥ %
.
≥≥% &
OK
≥≥& (
;
≥≥( )
}
¥¥ 
catch
µµ 
(
µµ 
	Exception
µµ 
e
µµ 
)
µµ 
{
∂∂ 
ExceptionLogger
∑∑ 
.
∑∑  
Log
∑∑  #
(
∑∑# $
log
∑∑$ '
,
∑∑' (
e
∑∑) *
)
∑∑* +
;
∑∑+ ,
return
∏∏ 
DatabaseResult
∏∏ %
.
∏∏% &
UNKNOWN_ERROR
∏∏& 3
;
∏∏3 4
}
ππ 
}
∫∫ 	
}
ΩΩ 
}ææ ¥
ã/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/TemporaryRoomPermissionDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public 

class &
TemporaryRoomPermissionDto +
:, -
IDtoBase. 6
{		 
[

 	
BsonElement

	 
(

 
$str

 
)

 
]

 
[ 	
BsonRequired	 
] 
public 
string 
Room 
{ 
get  
;  !
set" %
;% &
}' (
=) *
new+ .
(. /
$str/ 1
)1 2
;2 3
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
long 
From 
{ 
get 
; 
set  #
;# $
}% &
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
long 
Until 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ö
x/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/RoomDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public 

class 
RoomDto 
: 
IDtoBase #
{		 
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str  
)  !
]! "
[ 	
BsonRequired	 
] 
public 
long 
	CreatedAt 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ¶
â/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/RequestRoomPermissionDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public		 

class		 $
RequestRoomPermissionDto		 )
:		* +
IDtoBase		, 4
{

 
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
=' (
new) ,
(, -
$str- /
)/ 0
;0 1
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
String% +
)+ ,
], -
public %
RequestRoomPermissionType (
Type) -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
(2 3
$str3 5
)5 6
;6 7
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
RoomName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
(2 3
$str3 5
)5 6
;6 7
[ 	
BsonElement	 
( 
$str %
)% &
]& '
[ 	
BsonRequired	 
] 
public 
string 
? 
RequestMessage %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
}   Ï
Ñ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/RequestDecisionsDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public 

class 
RequestDecisionsDto $
:% &
IDtoBase' /
{		 
[

 	
BsonElement

	 
(

 
$str

 
)

 
]

 
[ 	
BsonRequired	 
] 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
Approver 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
Username 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
? 
Room 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
String% +
)+ ,
], -
public %
RequestRoomPermissionType (
?( )
Type* .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
[ 	
BsonElement	 
( 
$str !
)! "
]" #
[ 	
BsonRequired	 
] 
public 
bool 

IsApproved 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} õ
Ä/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/NotificationDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public 

class 
NotificationDto  
:! "
IDtoBase# +
{		 
[

 	
BsonElement

	 
(

 
$str

 
)

 
]

 
[ 	
BsonRequired	 
] 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
=' (
new) ,
(, -
$str- /
)/ 0
;0 1
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
From 
{ 
get  
;  !
set" %
;% &
}' (
=) *
new+ .
(. /
$str/ 1
)1 2
;2 3
[ 	
BsonElement	 
( 
$str 
) 
]  
[ 	
BsonRequired	 
] 
public 
string 
MessageText !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
new2 5
(5 6
$str6 8
)8 9
;9 :
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
bool 
IsRead 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ç
x/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/FaceDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public 

class 
FaceDto 
: 
IDtoBase #
{ 
public 
FaceDto 
( 
int 
id 
, 
string %
encoding& .
). /
{		 	
Id

 
=

 
id

 
;

 
Encoding 
= 
encoding 
;  
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Encoding 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} È
Ç/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/EntranceRecordDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public 

class 
EntranceRecordDto "
:# $
IDtoBase% -
{		 
[

 	
BsonElement

	 
(

 
$str

 
)

 
]

 
[ 	
BsonRequired	 
] 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
Username 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
RoomName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
long 
Time 
{ 
get 
; 
set  #
;# $
}% &
[ 	
BsonElement	 
( 
$str !
)! "
]" #
[ 	
BsonRequired	 
] 
public 
bool 

hasEntered 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} £)
{/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Models/AccountDto.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Models" (
{ 
public		 

class		 

AccountDto		 
:		 
IDtoBase		 &
{

 
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
[ 	
BsonElement	 
( 
$str  
)  !
]! "
[ 	
BsonRequired	 
] 
public 
string 
? 
	FirstName  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
LastName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str 
)  
]  !
[ 	
BsonRequired	 
] 
public 
string 
? 
Username 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
BsonElement	 
( 
$str 
) 
] 
[ 	
BsonRequired	 
] 
public 
string 
? 
Email 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
BsonElement	 
( 
$str 
)  
]  !
[   	
BsonRequired  	 
]   
public!! 
string!! 
?!! 
Password!! 
{!!  !
get!!" %
;!!% &
set!!' *
;!!* +
}!!, -
[## 	
BsonElement##	 
(## 
$str## 
)## 
]##  
[$$ 	
BsonRequired$$	 
]$$ 
public%% 
string%% 
?%% 
Address%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
['' 	
BsonElement''	 
('' 
$str'' "
)''" #
]''# $
[(( 	
BsonRequired((	 
](( 
public)) 
string)) 
?)) 
PhoneNumber)) "
{))# $
get))% (
;))( )
set))* -
;))- .
}))/ 0
[++ 	
BsonElement++	 
(++ 
$str++ 
)++ 
]++ 
[,, 	
BsonRequired,,	 
],, 
[-- 	
BsonRepresentation--	 
(-- 
BsonType-- $
.--$ %
String--% +
)--+ ,
]--, -
public.. 
Role.. 
Role.. 
{.. 
get.. 
;.. 
set..  #
;..# $
}..% &
[00 	
BsonElement00	 
(00 
$str00 
)00 
]00 
public11 
int11 
?11 
FaceID11 
{11 
get11  
;11  !
set11" %
;11% &
}11' (
[33 	
BsonElement33	 
(33 
$str33 #
)33# $
]33$ %
public44 
List44 
<44 
string44 
>44 
AllowedRooms44 (
{44) *
get44+ .
;44. /
set440 3
;443 4
}445 6
=447 8
new449 <
(44< =
)44= >
;44> ?
[66 	
BsonElement66	 
(66 
$str66 $
)66$ %
]66% &
public77 
List77 
<77 
NotificationDto77 #
>77# $
Notifications77% 2
{773 4
get775 8
;778 9
set77: =
;77= >
}77? @
=77A B
new77C F
(77F G
)77G H
;77H I
[99 	
BsonElement99	 
(99 
$str99 /
)99/ 0
]990 1
public:: 
List:: 
<:: &
TemporaryRoomPermissionDto:: .
>::. /$
TemporaryRoomPermissions::0 H
{::I J
get::K N
;::N O
set::P S
;::S T
}::U V
=::W X
new::Y \
(::\ ]
)::] ^
;::^ _
[<< 	
BsonElement<<	 
(<< 
$str<<  
)<<  !
]<<! "
[== 	
BsonRequired==	 
]== 
public>> 
long>> 
	CreatedAt>> 
{>> 
get>>  #
;>># $
set>>% (
;>>( )
}>>* +
}?? 
}@@ ˛
î/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Migrations/20240206194418_InitialMigration.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "

Migrations" ,
{ 
public		 

partial		 
class		 
InitialMigration		 )
:		* +
	Migration		, 5
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ D
,D E)
NpgsqlValueGenerationStrategyF c
.c d#
IdentityByDefaultColumnd {
){ |
,| }
Encoding 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
falseL Q
)Q R
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
migrationBuilder 
. 
CreateIndex (
(( )
name 
: 
$str #
,# $
table 
: 
$str 
, 
column 
: 
$str 
, 
unique 
: 
true 
) 
; 
}   	
	protected## 
override## 
void## 
Down##  $
(##$ %
MigrationBuilder##% 5
migrationBuilder##6 F
)##F G
{$$ 	
migrationBuilder%% 
.%% 
	DropTable%% &
(%%& '
name&& 
:&& 
$str&& 
)&& 
;&& 
}'' 	
}(( 
})) ﬂ
ç/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Contexts/VisualAccessDbContextPgSQL.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Contexts" *
{ 
public 

class &
VisualAccessDbContextPgSql +
:, -
	DbContext. 7
{		 
public

 
DbSet

 
<

 
FaceDto

 
>

 
Faces

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public &
VisualAccessDbContextPgSql )
() *
)* +
{ 	
} 	
public &
VisualAccessDbContextPgSql )
() *
DbContextOptions* :
<: ;&
VisualAccessDbContextPgSql; U
>U V
optionsW ^
)^ _
: 	
base
 
( 
options 
) 
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
FaceDto  '
>' (
(( )
)) *
.* +
ToTable+ 2
(2 3
$str3 :
): ;
.; <
HasKey< B
(B C
fC D
=>E G
fH I
.I J
IdJ L
)L M
;M N
modelBuilder 
. 
Entity 
<  
FaceDto  '
>' (
(( )
)) *
. 
HasIndex 
( 
f 
=> 
f  
.  !
Id! #
)# $
. 
IsUnique 
( 
) 
; 
modelBuilder 
. 
Entity 
<  
FaceDto  '
>' (
(( )
)) *
.* +
Property+ 3
(3 4
f4 5
=>6 8
f9 :
.: ;
Id; =
)= >
.> ?
ValueGeneratedOnAdd? R
(R S
)S T
;T U
modelBuilder 
. 
Entity 
<  
FaceDto  '
>' (
(( )
)) *
.* +
Property+ 3
(3 4
f4 5
=>6 8
f9 :
.: ;
Encoding; C
)C D
.D E

IsRequiredE O
(O P
)P Q
;Q R
} 	
	protected 
override 
void 
OnConfiguring  -
(- .#
DbContextOptionsBuilder. E
optionsBuilderF T
)T U
{   	
if!! 
(!! 
!!! 
optionsBuilder!! 
.!!  
IsConfigured!!  ,
)!!, -
{"" 
optionsBuilder## 
.## 
	UseNpgsql## (
(##( )
Environment##) 4
.##4 5"
GetEnvironmentVariable##5 K
(##K L
$str##L X
)##X Y
!##Y Z
)##Z [
;##[ \
}$$ 
}%% 	
}'' 
}(( é=
è/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.DataAccess/Contexts/VisualAccessDbContextMongoDB.cs
	namespace 	
VisualAccess
 
. 

DataAccess !
.! "
Contexts" *
{		 
public

 

class

 (
VisualAccessDbContextMongoDB

 -
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @(
VisualAccessDbContextMongoDB@ \
)\ ]
)] ^
;^ _
public 
IMongoCollection 
<  

AccountDto  *
>* +
AccountsCollection, >
{? @
getA D
;D E
setF I
;I J
}K L
public 
IMongoCollection 
<  
RoomDto  '
>' (
RoomsCollection) 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
IMongoCollection 
<  
EntranceRecordDto  1
>1 2%
EntranceRecordsCollection3 L
{M N
getO R
;R S
setT W
;W X
}Y Z
public 
IMongoCollection 
<  $
RequestRoomPermissionDto  8
>8 9+
RequestRoomPermissionCollection: Y
{Z [
get\ _
;_ `
seta d
;d e
}f g
public 
IMongoCollection 
<  
RequestDecisionsDto  3
>3 4&
RequestDecisionsCollection5 O
{P Q
getR U
;U V
setW Z
;Z [
}\ ]
public (
VisualAccessDbContextMongoDB +
(+ ,
IMongoDatabase, :
database; C
)C D
{ 	
AccountsCollection 
=  
database! )
.) *
GetCollection* 7
<7 8

AccountDto8 B
>B C
(C D
$strD N
)N O
;O P
RoomsCollection 
= 
database &
.& '
GetCollection' 4
<4 5
RoomDto5 <
>< =
(= >
$str> E
)E F
;F G%
EntranceRecordsCollection %
=& '
database( 0
.0 1
GetCollection1 >
<> ?
EntranceRecordDto? P
>P Q
(Q R
$strR c
)c d
;d e+
RequestRoomPermissionCollection +
=, -
database. 6
.6 7
GetCollection7 D
<D E$
RequestRoomPermissionDtoE ]
>] ^
(^ _
$str_ v
)v w
;w x&
RequestDecisionsCollection &
=' (
database) 1
.1 2
GetCollection2 ?
<? @
RequestDecisionsDto@ S
>S T
(T U
$strU g
)g h
;h i
} 	
public 
void 
	Configure 
( 
) 
{ 	
var 
usernameIndexModel "
=# $
new% (
CreateIndexModel) 9
<9 :

AccountDto: D
>D E
(E F
Builders   
<   

AccountDto   #
>  # $
.  $ %
	IndexKeys  % .
.  . /
	Ascending  / 8
(  8 9
x  9 :
=>  ; =
x  > ?
.  ? @
Username  @ H
)  H I
,  I J
new!! 
CreateIndexOptions!! &
{!!' (
Unique!!) /
=!!0 1
true!!2 6
}!!7 8
)!!8 9
;!!9 :
var## 
emailIndexModel## 
=##  !
new##" %
CreateIndexModel##& 6
<##6 7

AccountDto##7 A
>##A B
(##B C
Builders$$ 
<$$ 

AccountDto$$ #
>$$# $
.$$$ %
	IndexKeys$$% .
.$$. /
	Ascending$$/ 8
($$8 9
x$$9 :
=>$$; =
x$$> ?
.$$? @
Email$$@ E
)$$E F
,$$F G
new%% 
CreateIndexOptions%% &
{%%' (
Unique%%) /
=%%0 1
true%%2 6
}%%7 8
)%%8 9
;%%9 :
AccountsCollection'' 
.'' 
Indexes'' &
.''& '
	CreateOne''' 0
(''0 1
usernameIndexModel''1 C
)''C D
;''D E
AccountsCollection(( 
.(( 
Indexes(( &
.((& '
	CreateOne((' 0
(((0 1
emailIndexModel((1 @
)((@ A
;((A B
var** 
roomNameIndexModel** "
=**# $
new**% (
CreateIndexModel**) 9
<**9 :
RoomDto**: A
>**A B
(**B C
Builders++ 
<++ 
RoomDto++  
>++  !
.++! "
	IndexKeys++" +
.+++ ,
	Ascending++, 5
(++5 6
x++6 7
=>++8 :
x++; <
.++< =
Name++= A
)++A B
,++B C
new,, 
CreateIndexOptions,, &
{,,' (
Unique,,) /
=,,0 1
true,,2 6
},,7 8
),,8 9
;,,9 :
RoomsCollection.. 
... 
Indexes.. #
...# $
	CreateOne..$ -
(..- .
roomNameIndexModel... @
)..@ A
;..A B

AccountDto00 
defaultAccount00 %
=00& '
new00( +

AccountDto00, 6
{11 
Id22 
=22 
Guid22 
.22 
NewGuid22 !
(22! "
)22" #
.22# $
ToString22$ ,
(22, -
)22- .
,22. /
	FirstName33 
=33 
$str33 
,33 
LastName44 
=44 
$str44 
,44 
Username55 
=55 
$str55 "
,55" #
Password66 
=66 
BCrypt66 !
.66! "
Net66" %
.66% &
BCrypt66& ,
.66, -
HashPassword66- 9
(669 :
$str66: H
)66H I
,66I J
Email77 
=77 
$str77 
,77 
PhoneNumber88 
=88 
$str88  
,88  !
Role99 
=99 
Domain99 
.99 
Enumerations99 *
.99* +
Role99+ /
.99/ 0
ADMIN990 5
,995 6
	CreatedAt:: 
=:: 
DateTimeOffset:: *
.::* +
Now::+ .
.::. /
ToUnixTimeSeconds::/ @
(::@ A
)::A B
};; 
;;; 
try<< 
{== 
if>> 
(>> 
AccountsCollection>> &
.>>& '
CountDocuments>>' 5
(>>5 6
Builders>>6 >
<>>> ?

AccountDto>>? I
>>>I J
.>>J K
Filter>>K Q
.>>Q R
Empty>>R W
)>>W X
==>>Y [
$num>>\ ]
)>>] ^
{?? 
AccountsCollection@@ &
.@@& '
	InsertOne@@' 0
(@@0 1
defaultAccount@@1 ?
)@@? @
;@@@ A
}AA 
}BB 
catchCC 
(CC 
	ExceptionCC 
)CC 
{DD 
logEE 
.EE 
WarnEE 
(EE 
$strEE >
)EE> ?
;EE? @
}FF 
}GG 	
}HH 
}II 