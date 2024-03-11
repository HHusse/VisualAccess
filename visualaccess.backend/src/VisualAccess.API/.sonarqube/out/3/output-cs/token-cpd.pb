äW
ö/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.FaceRecognition/ServicesClient/FaceRecognitionServiceClient.cs
	namespace 	
VisualAccess
 
. 
FaceRecognition &
.& '
ServicesClient' 5
{ 
public 

class (
FaceRecognitionServiceClient -
:. /)
IFaceRecognitionServiceClient0 M
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @(
FaceRecognitionServiceClient@ \
)\ ]
.] ^
Name^ b
)b c
;c d
private 
readonly %
GrpcFaceRecognitionClient 2

grpcClient3 =
;= >
public (
FaceRecognitionServiceClient +
(+ ,
), -
{ 	
var 
channel 
= 
GrpcChannel %
.% &

ForAddress& 0
(0 1
Environment1 <
.< ="
GetEnvironmentVariable= S
(S T
$strT w
)w x
!x y
)y z
;z {

grpcClient 
= 
new %
GrpcFaceRecognitionClient 6
(6 7
channel7 >
)> ?
;? @
} 	
public 
async 
Task 
< 
( !
FaceRecognitionResult 0
,0 1
int2 5
?5 6
)6 7
>7 8
RegisterFaceAsync9 J
(J K
MemoryStreamK W

faceStreamX b
)b c
{ 	
var 
image 
= 
new 
Facerecognition +
.+ ,
Image, 1
{2 3
Content4 ;
=< =
Google> D
.D E
ProtobufE M
.M N

ByteStringN X
.X Y
CopyFromY a
(a b

faceStreamb l
.l m
ToArraym t
(t u
)u v
)v w
}x y
;y z
try 
{ 
var 
response 
= 
await $

grpcClient% /
./ 0
RegisterFaceAsync0 A
(A B
imageB G
)G H
;H I
log 
. 
Info 
( 
$" 
$str /
{/ 0
response0 8
.8 9
Id9 ;
}; <
$str< H
{H I
responseI Q
.Q R
MessageR Y
}Y Z
"Z [
)[ \
;\ ]
return   
new   
(   !
FaceRecognitionResult   0
.  0 1
OK  1 3
,  3 4
response  5 =
.  = >
Id  > @
)  @ A
;  A B
}!! 
catch"" 
("" 
RpcException"" 
e""  !
)""! "
{## 
log$$ 
.$$ 
Warn$$ 
($$ 
$"$$ 
$str$$ *
{$$* +
e$$+ ,
.$$, -
Status$$- 3
.$$3 4
Detail$$4 :
}$$: ;
"$$; <
)$$< =
;$$= >
switch%% 
(%% 
e%% 
.%% 

StatusCode%% $
)%%$ %
{&& 
case'' 

StatusCode'' #
.''# $
NotFound''$ ,
:'', -
log(( 
.(( 
Warn((  
(((  !
$"((! #
$str((# 2
{((2 3
e((3 4
.((4 5
Status((5 ;
.((; <
Detail((< B
}((B C
"((C D
)((D E
;((E F
return)) 
new)) "
())" #!
FaceRecognitionResult))# 8
.))8 9
	NOT_FOUND))9 B
,))B C
null))D H
)))H I
;))I J
case** 

StatusCode** #
.**# $
AlreadyExists**$ 1
:**1 2
log++ 
.++ 
Warn++  
(++  !
$"++! #
$str++# 2
{++2 3
e++3 4
.++4 5
Status++5 ;
.++; <
Detail++< B
}++B C
"++C D
)++D E
;++E F
return,, 
new,, "
(,," #!
FaceRecognitionResult,,# 8
.,,8 9
ALREADY_EXIST,,9 F
,,,F G
null,,H L
),,L M
;,,M N
default-- 
:-- 
log.. 
... 
Error.. !
(..! "
$".." $
$str..$ 3
{..3 4
e..4 5
...5 6
Status..6 <
...< =
Detail..= C
}..C D
"..D E
)..E F
;..F G
return// 
new// "
(//" #!
FaceRecognitionResult//# 8
.//8 9
UNKNOWN_ERROR//9 F
,//F G
null//H L
)//L M
;//M N
}11 
}22 
catch33 
(33 
	Exception33 
e33 
)33 
{44 
log55 
.55 
Error55 
(55 
$"55 
$str55 +
{55+ ,
e55, -
.55- .
Message55. 5
}555 6
"556 7
)557 8
;558 9
return66 
new66 
(66 !
FaceRecognitionResult66 0
.660 1
UNKNOWN_ERROR661 >
,66> ?
null66@ D
)66D E
;66E F
}77 
}88 	
public:: 
async:: 
Task:: 
<:: 
(:: !
FaceRecognitionResult:: 0
,::0 1
int::2 5
?::5 6
)::6 7
>::7 8
VerifyFaceAsync::9 H
(::H I
MemoryStream::I U

faceStream::V `
)::` a
{;; 	
var<< 
image<< 
=<< 
new<< 
Facerecognition<< +
.<<+ ,
Image<<, 1
{<<2 3
Content<<4 ;
=<<< =
Google<<> D
.<<D E
Protobuf<<E M
.<<M N

ByteString<<N X
.<<X Y
CopyFrom<<Y a
(<<a b

faceStream<<b l
.<<l m
ToArray<<m t
(<<t u
)<<u v
)<<v w
}<<x y
;<<y z
try== 
{>> 
var?? 
response?? 
=?? 
await?? $

grpcClient??% /
.??/ 0
VerifyFaceAsync??0 ?
(??? @
image??@ E
)??E F
;??F G
logAA 
.AA 
InfoAA 
(AA 
$"AA 
$strAA /
{AA/ 0
responseAA0 8
.AA8 9
IdAA9 ;
}AA; <
$strAA< H
{AAH I
responseAAI Q
.AAQ R
MessageAAR Y
}AAY Z
"AAZ [
)AA[ \
;AA\ ]
returnBB 
newBB 
(BB !
FaceRecognitionResultBB 0
.BB0 1
OKBB1 3
,BB3 4
responseBB5 =
.BB= >
IdBB> @
)BB@ A
;BBA B
}CC 
catchDD 
(DD 
RpcExceptionDD 
eDD  !
)DD! "
{EE 
switchFF 
(FF 
eFF 
.FF 

StatusCodeFF $
)FF$ %
{GG 
caseHH 

StatusCodeHH #
.HH# $
NotFoundHH$ ,
:HH, -
logII 
.II 
WarnII  
(II  !
$"II! #
$strII# 2
{II2 3
eII3 4
.II4 5
StatusII5 ;
.II; <
DetailII< B
}IIB C
"IIC D
)IID E
;IIE F
returnJJ 
newJJ "
(JJ" #!
FaceRecognitionResultJJ# 8
.JJ8 9
	NOT_FOUNDJJ9 B
,JJB C
nullJJD H
)JJH I
;JJI J
caseKK 

StatusCodeKK #
.KK# $

OutOfRangeKK$ .
:KK. /
logLL 
.LL 
WarnLL  
(LL  !
$"LL! #
$strLL# 2
{LL2 3
eLL3 4
.LL4 5
StatusLL5 ;
.LL; <
DetailLL< B
}LLB C
"LLC D
)LLD E
;LLE F
returnMM 
newMM "
(MM" #!
FaceRecognitionResultMM# 8
.MM8 9
NOT_REGISTERDMM9 F
,MMF G
nullMMH L
)MML M
;MMM N
defaultNN 
:NN 
logOO 
.OO 
ErrorOO !
(OO! "
$"OO" $
$strOO$ 3
{OO3 4
eOO4 5
.OO5 6
StatusOO6 <
.OO< =
DetailOO= C
}OOC D
"OOD E
)OOE F
;OOF G
returnPP 
newPP "
(PP" #!
FaceRecognitionResultPP# 8
.PP8 9
UNKNOWN_ERRORPP9 F
,PPF G
nullPPH L
)PPL M
;PPM N
}RR 
}SS 
catchTT 
(TT 
	ExceptionTT 
eTT 
)TT 
{UU 
logVV 
.VV 
ErrorVV 
(VV 
$"VV 
$strVV +
{VV+ ,
eVV, -
.VV- .
MessageVV. 5
}VV5 6
"VV6 7
)VV7 8
;VV8 9
returnWW 
newWW 
(WW !
FaceRecognitionResultWW 0
.WW0 1
UNKNOWN_ERRORWW1 >
,WW> ?
nullWW@ D
)WWD E
;WWE F
}XX 
}YY 	
public[[ 
async[[ 
Task[[ 
RefreshCache[[ &
([[& '
)[[' (
{\\ 	
var]] 

emptyParam]] 
=]] 
new]]  
Facerecognition]]! 0
.]]0 1
Empty]]1 6
(]]6 7
)]]7 8
;]]8 9
try^^ 
{__ 
_`` 
=`` 
await`` 

grpcClient`` $
.``$ %
RefreshCacheAsync``% 6
(``6 7

emptyParam``7 A
)``A B
;``B C
logaa 
.aa 
Infoaa 
(aa 
$"aa 
$straa B
"aaB C
)aaC D
;aaD E
}bb 
catchcc 
(cc 
RpcExceptioncc 
ecc  !
)cc! "
{dd 
logee 
.ee 
Erroree 
(ee 
$"ee 
$stree +
{ee+ ,
eee, -
.ee- .
Statusee. 4
.ee4 5
Detailee5 ;
}ee; <
"ee< =
)ee= >
;ee> ?
}ff 
catchgg 
(gg 
	Exceptiongg 
egg 
)gg 
{hh 
logii 
.ii 
Errorii 
(ii 
$"ii 
$strii +
{ii+ ,
eii, -
.ii- .
Messageii. 5
}ii5 6
"ii6 7
)ii7 8
;ii8 9
}jj 
}kk 	
}ll 
}mm ¶P
â/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.FaceRecognition/Services/VerifyFaceService.cs
	namespace

 	
VisualAccess


 
.

 
FaceRecognition

 &
.

& '
Services

' /
{ 
public 

class 
VerifyFaceService "
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @
RegisterFaceService@ S
)S T
)T U
;U V
private 
readonly 
Room 
room "
;" #
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly )
IFaceRecognitionServiceClient 6
client7 =
;= >
private 
readonly %
IEntranceRecordRepository 2$
entranceRecordRepository3 K
;K L
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
VerifyFaceService  
(  !
Room! %
room& *
,* +
IAccountRepository, >
accountRepository? P
,P Q)
IFaceRecognitionServiceClientR o
clientp v
,v w&
IEntranceRecordRepository	x ë&
entranceRecordRepository
í ™
,
™ ´
IGenericMapper
¨ ∫
mapper
ª ¡
)
¡ ¬
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
client 
= 
client  
;  !
this 
. $
entranceRecordRepository )
=* +$
entranceRecordRepository, D
;D E
this 
. 
mapper 
= 
mapper  
;  !
this 
. 
room 
= 
room 
; 
} 	
public 
async 
Task 
< 
ServiceResult '
>' (
Execute) 0
(0 1
MemoryStream1 =

faceStream> H
)H I
{ 	
var   !
faceRecognitionResult   %
=  & '
await  ( -
client  . 4
.  4 5
VerifyFaceAsync  5 D
(  D E

faceStream  E O
)  O P
;  P Q
if!! 
(!! !
faceRecognitionResult!! %
.!!% &
Item1!!& +
==!!, .!
FaceRecognitionResult!!/ D
.!!D E
OK!!E G
)!!G H
{"" 

AccountDto## 
?## 

accountDTO## &
=##' (
(##) *

AccountDto##* 4
?##4 5
)##5 6
await##6 ;
accountRepository##< M
.##M N

GetAccount##N X
(##X Y
(##Y Z
int##Z ]
)##] ^!
faceRecognitionResult##^ s
.##s t
Item2##t y
!##y z
)##z {
;##{ |
if$$ 
($$ 

accountDTO$$ 
is$$ !
null$$" &
)$$& '
{%% 
log&& 
.&& 
Warn&& 
(&& 
$"&& 
$str&& 9
{&&9 :!
faceRecognitionResult&&: O
.&&O P
Item2&&P U
}&&U V
"&&V W
)&&W X
;&&X Y
return'' 
ServiceResult'' (
.''( )
ACCOUNT_NOT_FOUND'') :
;'': ;
}(( 
Account** 
account** 
=**  !
mapper**" (
.**( )
Map**) ,
<**, -

AccountDto**- 7
,**7 8
Account**9 @
>**@ A
(**A B

accountDTO**B L
)**L M
;**M N
account++ 
.++ $
TemporaryRoomPermissions++ 0
.++0 1
	RemoveAll++1 :
(++: ;
temp++; ?
=>++@ B
temp++C G
.++G H
Until++H M
<++N O
DateTimeOffset++P ^
.++^ _
Now++_ b
.++b c
ToUnixTimeSeconds++c t
(++t u
)++u v
)++v w
;++w x
_,, 
=,, 
accountRepository,, %
.,,% &
UpdateAccount,,& 3
(,,3 4
account,,4 ;
),,; <
;,,< =
if-- 
(-- 
!-- 
account-- 
.-- 
AllowedRooms-- )
.--) *
Contains--* 2
(--2 3
room--3 7
.--7 8
Name--8 <
)--< =
&&--> @
!--A B
account--B I
.--I J$
TemporaryRoomPermissions--J b
.--b c
Exists--c i
(--i j
temp--j n
=>--o q
temp--r v
.--v w
Room--w {
==--| ~
room	-- É
.
--É Ñ
Name
--Ñ à
&&
--â ã
temp
--å ê
.
--ê ë
Until
--ë ñ
>
--ó ò
DateTimeOffset
--ô ß
.
--ß ®
Now
--® ´
.
--´ ¨
ToUnixTimeSeconds
--¨ Ω
(
--Ω æ
)
--æ ø
)
--ø ¿
)
--¿ ¡
{.. 
EntranceRecord// "
notAllowedRecord//# 3
=//4 5
new//6 9
(//9 :
Guid//: >
.//> ?
NewGuid//? F
(//F G
)//G H
.//H I
ToString//I Q
(//Q R
)//R S
,//S T
account//U \
.//\ ]
Username//] e
,//e f
room//g k
.//k l
Name//l p
,//p q
DateTimeOffset	//r Ä
.
//Ä Å
Now
//Å Ñ
.
//Ñ Ö
ToUnixTimeSeconds
//Ö ñ
(
//ñ ó
)
//ó ò
,
//ò ô
false
//ö ü
)
//ü †
;
//† °
log00 
.00 
Info00 
(00 
$"00 
$str00 '
{00' (
notAllowedRecord00( 8
.008 9
username009 A
}00A B
$str00B Z
{00Z [
notAllowedRecord00[ k
.00k l
roomName00l t
}00t u
$str00u ~
{00~ 
notAllowedRecord	00 è
.
00è ê
time
00ê î
}
00î ï
$str
00ï ´
"
00´ ¨
)
00¨ ≠
;
00≠ Æ
_11 
=11 $
entranceRecordRepository11 0
.110 1 
CreateEntranceRecord111 E
(11E F
notAllowedRecord11F V
)11V W
;11W X
return22 
ServiceResult22 (
.22( )%
ACCOUNT_HAS_NO_PERMISSION22) B
;22B C
}33 
EntranceRecord44 
record44 %
=44& '
new44( +
(44+ ,
Guid44, 0
.440 1
NewGuid441 8
(448 9
)449 :
.44: ;
ToString44; C
(44C D
)44D E
,44E F
account44G N
.44N O
Username44O W
,44W X
room44Y ]
.44] ^
Name44^ b
,44b c
DateTimeOffset44d r
.44r s
Now44s v
.44v w
ToUnixTimeSeconds	44w à
(
44à â
)
44â ä
,
44ä ã
true
44å ê
)
44ê ë
;
44ë í
log55 
.55 
Info55 
(55 
$"55 
$str55 #
{55# $
record55$ *
.55* +
username55+ 3
}553 4
$str554 L
{55L M
record55M S
.55S T
roomName55T \
}55\ ]
$str55] f
{55f g
record55g m
.55m n
time55n r
}55r s
$str55s ~
"55~ 
)	55 Ä
;
55Ä Å
_66 
=66 $
entranceRecordRepository66 ,
.66, - 
CreateEntranceRecord66- A
(66A B
record66B H
)66H I
;66I J
return77 
ServiceResult77 $
.77$ %
OK77% '
;77' (
}88 
if:: 
(:: !
faceRecognitionResult:: %
.::% &
Item1::& +
==::, .!
FaceRecognitionResult::/ D
.::D E
	NOT_FOUND::E N
)::N O
{;; 
return<< 
ServiceResult<< $
.<<$ %
FACE_NOT_FOUND<<% 3
;<<3 4
}== 
if?? 
(?? !
faceRecognitionResult?? %
.??% &
Item1??& +
==??, .!
FaceRecognitionResult??/ D
.??D E
NOT_REGISTERD??E R
)??R S
{@@ 
EntranceRecordAA 
notRegisteredRecordAA 2
=AA3 4
newAA5 8
(AA8 9
GuidAA9 =
.AA= >
NewGuidAA> E
(AAE F
)AAF G
.AAG H
ToStringAAH P
(AAP Q
)AAQ R
,AAR S
$strAAT ]
,AA] ^
roomAA_ c
.AAc d
NameAAd h
,AAh i
DateTimeOffsetAAj x
.AAx y
NowAAy |
.AA| }
ToUnixTimeSeconds	AA} é
(
AAé è
)
AAè ê
,
AAê ë
false
AAí ó
)
AAó ò
;
AAò ô
logBB 
.BB 
InfoBB 
(BB 
$"BB 
$strBB A
{BBA B
notRegisteredRecordBBB U
.BBU V
roomNameBBV ^
}BB^ _
$strBB_ h
{BBh i
notRegisteredRecordBBi |
.BB| }
time	BB} Å
}
BBÅ Ç
"
BBÇ É
)
BBÉ Ñ
;
BBÑ Ö
_CC 
=CC $
entranceRecordRepositoryCC ,
.CC, - 
CreateEntranceRecordCC- A
(CCA B
notRegisteredRecordCCB U
)CCU V
;CCV W
returnDD 
ServiceResultDD $
.DD$ %
FACE_NOT_REGISTERDDD% 7
;DD7 8
}EE 
returnGG 
ServiceResultGG  
.GG  !
UNKNOWN_ERRORGG! .
;GG. /
}HH 	
}JJ 
}KK …+
ã/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.FaceRecognition/Services/RegisterFaceService.cs
	namespace 	
VisualAccess
 
. 
FaceRecognition &
.& '
Services' /
{ 
public 

class 
RegisterFaceService $
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @
RegisterFaceService@ S
)S T
)T U
;U V
private 
readonly 
IAccountRepository +

repository, 6
;6 7
private 
readonly )
IFaceRecognitionServiceClient 6
client7 =
;= >
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
RegisterFaceService "
(" #
IAccountRepository# 5

repository6 @
,@ A)
IFaceRecognitionServiceClientB _
client` f
,f g
IGenericMapperh v
mapperw }
)} ~
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
client 
= 
client  
;  !
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
< 
ServiceResult '
>' (
Execute) 0
(0 1
string1 7
username8 @
,@ A
MemoryStreamB N

faceStreamO Y
)Y Z
{ 	

AccountDto 
? 

accountDTO "
=# $
(% &

AccountDto& 0
?0 1
)1 2
await2 7

repository8 B
.B C

GetAccountC M
(M N
usernameN V
)V W
;W X
if 
( 

accountDTO 
is 
null "
)" #
{ 
log   
.   
Warn   
(   
$"   
$str   1
{  1 2
username  2 :
.  : ;
ToLower  ; B
(  B C
)  C D
}  D E
$str  E S
"  S T
)  T U
;  U V
return!! 
ServiceResult!! $
.!!$ %
ACCOUNT_NOT_FOUND!!% 6
;!!6 7
}"" 
Account$$ 
account$$ 
=$$ 
mapper$$ $
.$$$ %
Map$$% (
<$$( )

AccountDto$$) 3
,$$3 4
Account$$5 <
>$$< =
($$= >

accountDTO$$> H
)$$H I
;$$I J
var%% !
faceRecognitionResult%% %
=%%& '
await%%( -
client%%. 4
.%%4 5
RegisterFaceAsync%%5 F
(%%F G

faceStream%%G Q
)%%Q R
;%%R S
if&& 
(&& !
faceRecognitionResult&& %
.&&% &
Item1&&& +
==&&, .!
FaceRecognitionResult&&/ D
.&&D E
OK&&E G
)&&G H
{'' 
account(( 
.(( 
FaceID(( 
=((  !
faceRecognitionResult((! 6
.((6 7
Item2((7 <
!((< =
;((= >
if)) 
()) 
await)) 

repository)) $
.))$ %
UpdateAccount))% 2
())2 3
account))3 :
))): ;
!=))< >
DatabaseResult))? M
.))M N
OK))N P
)))P Q
{** 
log++ 
.++ 
Error++ 
(++ 
$"++  
$str++  Y
{++Y Z!
faceRecognitionResult++Z o
.++o p
Item1++p u
}++u v
$str	++v Ü
{
++Ü á
username
++á è
}
++è ê
"
++ê ë
)
++ë í
;
++í ì
return,, 
ServiceResult,, (
.,,( )!
FACE_ASSOCIATION_FAIL,,) >
;,,> ?
}-- 
log// 
.// 
Info// 
(// 
$"// 
$str// F
{//F G
username//G O
}//O P
$str//P W
{//W X!
faceRecognitionResult//X m
.//m n
Item1//n s
}//s t
"//t u
)//u v
;//v w
return00 
ServiceResult00 $
.00$ %
OK00% '
;00' (
}22 
if44 
(44 !
faceRecognitionResult44 %
.44% &
Item144& +
==44, .!
FaceRecognitionResult44/ D
.44D E
	NOT_FOUND44E N
)44N O
{55 
return66 
ServiceResult66 $
.66$ %
FACE_NOT_FOUND66% 3
;663 4
}77 
if99 
(99 !
faceRecognitionResult99 %
.99% &
Item199& +
==99, .!
FaceRecognitionResult99/ D
.99D E
ALREADY_EXIST99E R
)99R S
{:: 
return;; 
ServiceResult;; $
.;;$ %
FACE_ALREADY_EXIST;;% 7
;;;7 8
}<< 
return>> 
ServiceResult>>  
.>>  !
UNKNOWN_ERROR>>! .
;>>. /
}?? 	
}@@ 
}AA 