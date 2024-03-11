ï
Ä/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Validators/RoomValidator.cs
	namespace 	
VisualAccess
 
. 
Business 
.  

Validators  *
{ 
public 

class 
RoomValidator 
:  
IRoomValidator! /
{ 
public		 
bool		 
VerifyPassword		 "
(		" #
Room		# '
room		( ,
,		, -
string		. 4
password		5 =
)		= >
{

 	
return 
BCrypt 
. 
Net 
. 
BCrypt $
.$ %
Verify% +
(+ ,
password, 4
,4 5
room6 :
.: ;
Password; C
)C D
;D E
} 	
} 
} ª
É/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Validators/AccountValidator.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  

Validators

  *
{ 
public 

partial 
class 
AccountValidator )
:* +
IAccountValidator, =
{ 
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
public 
AccountValidator 
(  
IAccountRepository  2
accountRepository3 D
)D E
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
} 	
public 
bool 
VerifyPassword "
(" #
Account# *
account+ 2
,2 3
string4 :
password; C
)C D
{ 	
return 
BCrypt 
. 
Net 
. 
BCrypt $
.$ %
Verify% +
(+ ,
password, 4
,4 5
account6 =
.= >
Password> F
)F G
;G H
} 	
[ 	
GeneratedRegex	 
( 
$str L
)L M
]M N
private 
static 
partial 
Regex $

EmailRegex% /
(/ 0
)0 1
;1 2
public 
bool 
IsValidEmail  
(  !
string! '
email( -
)- .
{ 	
return 

EmailRegex 
( 
) 
.  
IsMatch  '
(' (
email( -
)- .
;. /
}   	
["" 	
GeneratedRegex""	 
("" 
$str"" X
)""X Y
]""Y Z
private## 
static## 
partial## 
Regex## $
PhoneNumberRegex##% 5
(##5 6
)##6 7
;##7 8
public%% 
bool%% 
IsValidPhoneNumber%% &
(%%& '
string%%' -
phoneNumber%%. 9
)%%9 :
{&& 	
return'' 
PhoneNumberRegex'' #
(''# $
)''$ %
.''% &
IsMatch''& -
(''- .
phoneNumber''. 9
)''9 :
;'': ;
}(( 	
[** 	
GeneratedRegex**	 
(** 
$str** /
)**/ 0
]**0 1
private++ 
static++ 
partial++ 
Regex++ $
UsernameRegex++% 2
(++2 3
)++3 4
;++4 5
public-- 
bool-- 
IsValidUsername-- #
(--# $
string--$ *
username--+ 3
)--3 4
{.. 	
return// 
UsernameRegex//  
(//  !
)//! "
.//" #
IsMatch//# *
(//* +
username//+ 3
)//3 4
;//4 5
}00 	
public22 
async22 
Task22 
<22 
bool22 
>22  
UsernameAlreadyExist22  4
(224 5
string225 ;
username22< D
)22D E
{33 	
return44 
await44 
accountRepository44 *
.44* +
UsernameExist44+ 8
(448 9
username449 A
)44A B
;44B C
}55 	
public77 
async77 
Task77 
<77 
bool77 
>77 
EmailAlreadyExist77  1
(771 2
string772 8
email779 >
)77> ?
{88 	
return99 
await99 
accountRepository99 *
.99* +

EmailExist99+ 5
(995 6
email996 ;
)99; <
;99< =
}:: 	
};; 
}<< ∫
å/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RoomServices/GetRoomService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( )
RoomServices

) 5
{ 
public 

class 
GetRoomService 
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
(? @
GetRoomService@ N
)N O
)O P
;P Q
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
GetRoomService 
( 
IRoomRepository -
roomRepository. <
,< =
IGenericMapper> L
mapperM S
)S T
{ 	
this 
. 
roomRepository 
=  !
roomRepository" 0
;0 1
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
( 
ServiceResult (
,( )
Room* .
?. /
)/ 0
>0 1
Execute2 9
(9 :
string: @
roomNameA I
)I J
{ 	
RoomDto 
? 
roomDTO 
= 
(  
RoomDto  '
?' (
)( )
await) .
roomRepository/ =
.= >
GetRoom> E
(E F
roomNameF N
)N O
;O P
if 
( 
roomDTO 
is 
null 
)  
{ 
log 
. 
Warn 
( 
$" 
$str *
{* +
roomName+ 3
.3 4
ToLower4 ;
(; <
)< =
}= >
$str> L
"L M
)M N
;N O
return 
new 
( 
ServiceResult (
.( )
ROOM_NOT_FOUND) 7
,7 8
null9 =
)= >
;> ?
}   
Room!! 
room!! 
=!! 
mapper!! 
.!! 
Map!! "
<!!" #
RoomDto!!# *
,!!* +
Room!!, 0
>!!0 1
(!!1 2
roomDTO!!2 9
)!!9 :
;!!: ;
return## 
new## 
(## 
ServiceResult## $
.##$ %
OK##% '
,##' (
room##) -
)##- .
;##. /
}$$ 	
}%% 
}'' ∫ 
ì/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RoomServices/GetRoomsByPageService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )
RoomServices) 5
;5 6
public

 
class

 !
GetRoomsByPageService

 "
{ 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <!
GetRoomsByPageService< Q
)Q R
)R S
;S T
private 
readonly 
IRoomRepository $
roomRepository% 3
;3 4
private 
readonly 
IGenericMapper #
mapper$ *
;* +
public 
!
GetRoomsByPageService  
(  !
IRoomRepository! 0
roomRepository1 ?
,? @
IGenericMapperA O
mapperP V
)V W
{ 
this 
. 
roomRepository 
= 
roomRepository ,
;, -
this 
. 
mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
( 
ServiceResult $
,$ %
List& *
<* +
Room+ /
>/ 0
?0 1
,1 2
long3 7
)7 8
>8 9
Execute: A
(A B
intB E
pageF J
)J K
{ 
List 
< 
RoomDto 
> 
rooms 
= 
( 
List #
<# $
RoomDto$ +
>+ ,
), -
await- 2
roomRepository3 A
.A B
GetRoomsByPageB P
(P Q
pageQ U
)U V
;V W
long 

roomsCount 
= 
await 
roomRepository  .
.. /
GetRoomsCount/ <
(< =
)= >
;> ?
double 
pagesDouble 
= 
( 
double $
)$ %

roomsCount% /
/0 1
$num2 3
;3 4
long 
pages 
= 
( 
long 
) 
Math 
.  
Ceiling  '
(' (
pagesDouble( 3
)3 4
;4 5
if 

( 
rooms 
. 
Count 
== 
$num 
) 
{ 	
log 
. 
Warn 
( 
$" 
$str .
{. /
page/ 3
}3 4
"4 5
)5 6
;6 7
return   
new   
(   
ServiceResult   $
.  $ %
	NOT_FOUND  % .
,  . /
null  0 4
,  4 5
$num  6 7
)  7 8
;  8 9
}!! 	
log## 
.## 
Info## 
(## 
$"## 
$str## 
{## 
rooms## !
.##! "
Count##" '
}##' (
$str##( .
"##. /
)##/ 0
;##0 1
List$$ 
<$$ 
Room$$ 
>$$ 
	roomsList$$ 
=$$ 
mapper$$ %
.$$% &
Map$$& )
<$$) *
List$$* .
<$$. /
RoomDto$$/ 6
>$$6 7
,$$7 8
List$$9 =
<$$= >
Room$$> B
>$$B C
>$$C D
($$D E
rooms$$E J
)$$J K
;$$K L
return%% 
new%% 
(%% 
ServiceResult%%  
.%%  !
OK%%! #
,%%# $
	roomsList%%% .
,%%. /
pages%%0 5
)%%5 6
;%%6 7
}&& 
}'' Ú>
≤/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RequestRoomPermissionServices/RemoveRequestRoomPermissionsService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( ))
RequestRoomPermissionServices

) F
;

F G
public 
class .
"RemoveRequestRoomPermissionService /
{ 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <.
"RemoveRequestRoomPermissionService< ^
)^ _
)_ `
;` a
private 
readonly 
IAccountRepository '
accountRepository( 9
;9 :
private 
readonly ,
 IRequestRoomPermissionRepository 5+
requestRoomPermissionRepository6 U
;U V
private 
readonly  
INotificationFactory )
notificationFactory* =
;= >
private 
readonly '
IRequestDecisionsRepository 0&
requestDecisionsRepository1 K
;K L
private 
readonly 
IGenericMapper #
mapper$ *
;* +
public 
.
"RemoveRequestRoomPermissionService -
(- .
IAccountRepository. @
accountRepositoryA R
,R S,
 IRequestRoomPermissionRepositoryT t,
requestRoomPermissionRepository	u î
,
î ï"
INotificationFactory
ñ ™!
notificationFactory
´ æ
,
æ ø)
IRequestDecisionsRepository
¿ €(
requestDecisionsRepository
‹ ˆ
,
ˆ ˜
IGenericMapper
¯ Ü
mapper
á ç
)
ç é
{ 
this 
. 
accountRepository 
=  
accountRepository! 2
;2 3
this 
. +
requestRoomPermissionRepository ,
=- .+
requestRoomPermissionRepository/ N
;N O
this 
. 
notificationFactory  
=! "
notificationFactory# 6
;6 7
this 
. &
requestDecisionsRepository '
=( )&
requestDecisionsRepository* D
;D E
this 
. 
mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
ServiceResult #
># $
Execute% ,
(, -
Account- 4
approverAccount5 D
,D E
stringF L
	requestIDM V
)V W
{ $
RequestRoomPermissionDto    
?    !

requestDTO  " ,
=  - .
(  / 0$
RequestRoomPermissionDto  0 H
?  H I
)  I J
await  J O+
requestRoomPermissionRepository  P o
.  o p
GetById  p w
(  w x
	requestID	  x Å
)
  Å Ç
;
  Ç É
if!! 

(!! 

requestDTO!! 
is!! 
null!! 
)!! 
{"" 	
log## 
.## 
Warn## 
(## 
$"## 
$str## '
{##' (
	requestID##( 1
}##1 2
$str##2 @
"##@ A
)##A B
;##B C
return$$ 
ServiceResult$$  
.$$  !
REQUEST_NOT_FOUND$$! 2
;$$2 3
}%% 	
log'' 
.'' 
Info'' 
('' 
$"'' 
$str'' #
{''# $
	requestID''$ -
}''- .
$str''. ?
"''? @
)''@ A
;''A B!
RequestRoomPermission(( 
request(( %
=((& '
mapper((( .
.((. /
Map((/ 2
<((2 3$
RequestRoomPermissionDto((3 K
,((K L!
RequestRoomPermission((M b
>((b c
(((c d

requestDTO((d n
)((n o
;((o p

AccountDto** 
?** 

accountDTO** 
=**  
(**! "

AccountDto**" ,
?**, -
)**- .
await**. 3
accountRepository**4 E
.**E F

GetAccount**F P
(**P Q
request**Q X
.**X Y
Username**Y a
)**a b
;**b c
if++ 

(++ 

accountDTO++ 
is++ 
null++ 
)++ 
{,, 	
log-- 
.-- 
Warn-- 
(-- 
$"-- 
$str-- -
{--- .
request--. 5
.--5 6
Username--6 >
}--> ?
$str--? M
"--M N
)--N O
;--O P
_.. 
=.. +
requestRoomPermissionRepository.. /
.../ 0
DeleteRequest..0 =
(..= >
request..> E
)..E F
;..F G
return// 
ServiceResult//  
.//  !
ACCOUNT_NOT_FOUND//! 2
;//2 3
}00 	
Account22 
account22 
=22 
mapper22  
.22  !
Map22! $
<22$ %

AccountDto22% /
,22/ 0
Account221 8
>228 9
(229 :

accountDTO22: D
)22D E
;22E F
Notification33 
notification33 !
=33" #
notificationFactory33$ 7
.337 8
Create338 >
(33> ?
approverAccount33? N
.33N O
Username33O W
,33W X
$"33Y [
$str	33[ Ä
{
33Ä Å
request
33Å à
.
33à â
RoomName
33â ë
}
33ë í
$str
33í ù
"
33ù û
)
33û ü
;
33ü †
account44 
.44 
Notifications44 
.44 
Add44 !
(44! "
notification44" .
)44. /
;44/ 0
if55 

(55 
await55 
accountRepository55 #
.55# $
UpdateAccount55$ 1
(551 2
account552 9
)559 :
!=55; =
DatabaseResult55> L
.55L M
OK55M O
)55O P
{66 	
return77 
ServiceResult77  
.77  !
DATABASE_ERROR77! /
;77/ 0
}88 	
DatabaseResult:: 
result:: 
=:: 
await::  %+
requestRoomPermissionRepository::& E
.::E F
DeleteRequest::F S
(::S T
request::T [
)::[ \
;::\ ]
if;; 

(;; 
result;; 
==;; 
DatabaseResult;; $
.;;$ %
UNKNOWN_ERROR;;% 2
);;2 3
{<< 	
return== 
ServiceResult==  
.==  !
DATABASE_ERROR==! /
;==/ 0
}>> 	
RequestDecisions?? 
requestDecisions?? )
=??* +
new??, /
RequestDecisions??0 @
(??@ A
Guid??A E
.??E F
NewGuid??F M
(??M N
)??N O
.??O P
ToString??P X
(??X Y
)??Y Z
,??Z [
approverAccount??\ k
.??k l
Username??l t
,??t u
request??v }
.??} ~
Username	??~ Ü
,
??Ü á
request
??à è
.
??è ê
RoomName
??ê ò
,
??ò ô
request
??ö °
.
??° ¢
Type
??¢ ¶
,
??¶ ß
false
??® ≠
)
??≠ Æ
;
??Æ Ø
_@@ 	
=@@
 
await@@ &
requestDecisionsRepository@@ ,
.@@, -
AddRequestDecision@@- ?
(@@? @
requestDecisions@@@ P
)@@P Q
;@@Q R
returnAA 
ServiceResultAA 
.AA 
OKAA 
;AA  
}BB 
}CC »#
µ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RequestRoomPermissionServices/GetRequestRoomPermissionsByPageService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( ))
RequestRoomPermissionServices

) F
{ 
public 

class 2
&GetRequestRoomPermissionsByPageService 7
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
(? @2
&GetRequestRoomPermissionsByPageService@ f
)f g
)g h
;h i
private 
readonly ,
 IRequestRoomPermissionRepository 9+
requestRoomPermissionRepository: Y
;Y Z
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 2
&GetRequestRoomPermissionsByPageService 5
(5 6,
 IRequestRoomPermissionRepository6 V+
requestRoomPermissionRepositoryW v
,v w
IGenericMapper	x Ü
mapper
á ç
)
ç é
{ 	
this 
. +
requestRoomPermissionRepository 0
=1 2+
requestRoomPermissionRepository3 R
;R S
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
( 
ServiceResult (
,( )
List* .
<. /!
RequestRoomPermission/ D
>D E
?E F
,F G
longH L
)L M
>M N
ExecuteO V
(V W
intW Z
page[ _
)_ `
{ 	
List 
< $
RequestRoomPermissionDto )
>) *
requests+ 3
=4 5
(6 7
List7 ;
<; <$
RequestRoomPermissionDto< T
>T U
)U V
awaitV [+
requestRoomPermissionRepository\ {
.{ |
	GetByPage	| Ö
(
Ö Ü
page
Ü ä
)
ä ã
;
ã å
long 
requestsCount 
=  
await! &+
requestRoomPermissionRepository' F
.F G
GetRequestsCountG W
(W X
)X Y
;Y Z
double 
pagesDouble 
=  
(! "
double" (
)( )
requestsCount) 6
/7 8
$num9 :
;: ;
long 
pages 
= 
( 
long 
) 
Math #
.# $
Ceiling$ +
(+ ,
pagesDouble, 7
)7 8
;8 9
if 
( 
requests 
. 
Count 
== !
$num" #
)# $
{   
log!! 
.!! 
Warn!! 
(!! 
$"!! 
$str!! 5
{!!5 6
page!!6 :
}!!: ;
"!!; <
)!!< =
;!!= >
return"" 
new"" 
("" 
ServiceResult"" (
.""( )
	NOT_FOUND"") 2
,""2 3
null""4 8
,""8 9
$num"": ;
)""; <
;""< =
}## 
log%% 
.%% 
Info%% 
(%% 
$"%% 
$str%% 
{%%  
requests%%  (
.%%( )
Count%%) .
}%%. /
$str%%/ 8
"%%8 9
)%%9 :
;%%: ;
List&& 
<&& !
RequestRoomPermission&& &
>&&& '
requestsList&&( 4
=&&5 6
mapper&&7 =
.&&= >
Map&&> A
<&&A B
List&&B F
<&&F G$
RequestRoomPermissionDto&&G _
>&&_ `
,&&` a
List&&b f
<&&f g!
RequestRoomPermission&&g |
>&&| }
>&&} ~
(&&~ 
requests	&& á
)
&&á à
;
&&à â
return'' 
new'' 
('' 
ServiceResult'' $
.''$ %
OK''% '
,''' (
requestsList'') 5
,''5 6
pages''7 <
)''< =
;''= >
}(( 	
})) 
}** Ÿ+
±/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RequestRoomPermissionServices/CreateRequestRoomPermissionService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( ))
RequestRoomPermissionServices

) F
{ 
public 

class .
"CreateRequestRoomPermissionService 3
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
(? @.
"CreateRequestRoomPermissionService@ b
)b c
)c d
;d e
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly ,
 IRequestRoomPermissionRepository 9+
requestRoomPermissionRepository: Y
;Y Z
public .
"CreateRequestRoomPermissionService 1
(1 2
IRoomRepository2 A
roomRepositoryB P
,P Q,
 IRequestRoomPermissionRepositoryR r,
requestRoomPermissionRepository	s í
,
í ì
IGenericMapper
î ¢
mapper
£ ©
)
© ™
{ 	
this 
. 
roomRepository 
=  !
roomRepository" 0
;0 1
this 
. +
requestRoomPermissionRepository 0
=1 2+
requestRoomPermissionRepository3 R
;R S
} 	
public 
async 
Task 
< 
ServiceResult '
>' (
Execute) 0
(0 1!
RequestRoomPermission1 F!
requestRoomPermissionG \
,\ ]
Account^ e
accountf m
)m n
{ 	!
requestRoomPermission !
.! "
Username" *
=+ ,
account- 4
.4 5
Username5 =
;= >
if 
( 
account 
. 
AllowedRooms $
.$ %
Contains% -
(- .!
requestRoomPermission. C
.C D
RoomNameD L
)L M
||N P
accountQ X
.X Y$
TemporaryRoomPermissionsY q
.q r
Existsr x
(x y
tempy }
=>	~ Ä
temp
Å Ö
.
Ö Ü
Room
Ü ä
==
ã ç#
requestRoomPermission
é £
.
£ §
RoomName
§ ¨
)
¨ ≠
)
≠ Æ
{ 
log 
. 
Warn 
( 
$" 
$str #
{# $
account$ +
.+ ,
Username, 4
}4 5
$str5 V
{V W!
requestRoomPermissionW l
.l m
RoomNamem u
}u v
"v w
)w x
;x y
return 
ServiceResult $
.$ %)
ROOM_PERMISSION_ALREADY_EXIST% B
;B C
}   
if"" 
("" 
await"" 
roomRepository"" $
.""$ %
	RoomExist""% .
("". /!
requestRoomPermission""/ D
.""D E
RoomName""E M
)""M N
!=""O Q
DatabaseResult""R `
.""` a

ROOM_EXIST""a k
)""k l
{## 
log$$ 
.$$ 
Warn$$ 
($$ 
$"$$ 
$str$$ %
{$$% &!
requestRoomPermission$$& ;
.$$; <
RoomName$$< D
}$$D E
$str$$E S
"$$S T
)$$T U
;$$U V
return%% 
ServiceResult%% $
.%%$ %
ROOM_NOT_FOUND%%% 3
;%%3 4
}&& 
if(( 
((( 
await(( +
requestRoomPermissionRepository(( 5
.((5 6
RequestExists((6 C
(((C D
account((D K
.((K L
Username((L T
,((T U!
requestRoomPermission((V k
.((k l
RoomName((l t
)((t u
)((u v
{)) 
log** 
.** 
Warn** 
(** 
$"** 
$str** ?
{**? @
account**@ G
.**G H
Username**H P
}**P Q
$str**Q Z
{**Z [!
requestRoomPermission**[ p
.**p q
RoomName**q y
}**y z
$str	**z à
"
**à â
)
**â ä
;
**ä ã
return++ 
ServiceResult++ $
.++$ %!
REQUEST_ALREADY_EXIST++% :
;++: ;
},, 
var.. 
response.. 
=.. 
await..  +
requestRoomPermissionRepository..! @
...@ A
CreateRequest..A N
(..N O!
requestRoomPermission..O d
)..d e
;..e f
if00 
(00 
response00 
!=00 
DatabaseResult00 *
.00* +
OK00+ -
)00- .
{11 
return22 
ServiceResult22 $
.22$ %
DATABASE_ERROR22% 3
;223 4
}33 
log55 
.55 
Info55 
(55 
$"55 
$str55 A
"55A B
)55B C
;55C D
return66 
ServiceResult66  
.66  !
OK66! #
;66# $
}77 	
}88 
}99 íg
±/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RequestRoomPermissionServices/AcceptRequestRoomPermissionService.cs
	namespace		 	
VisualAccess		
 
.		 
Business		 
.		  
Services		  (
.		( ))
RequestRoomPermissionServices		) F
;		F G
public 
class .
"AcceptRequestRoomPermissionService /
{ 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <.
"AcceptRequestRoomPermissionService< ^
)^ _
)_ `
;` a
private 
readonly 
IAccountRepository '
accountRepository( 9
;9 :
private 
readonly ,
 IRequestRoomPermissionRepository 5+
requestRoomPermissionRepository6 U
;U V
private 
readonly +
ITemporaryRoomPermissionFactory 4*
temporaryRoomPermissionFactory5 S
;S T
private 
readonly  
INotificationFactory )
notificationFactory* =
;= >
private 
readonly '
IRequestDecisionsRepository 0&
requestDecisionsRepository1 K
;K L
private 
readonly 
IGenericMapper #
mapper$ *
;* +
public 
.
"AcceptRequestRoomPermissionService -
(- .
IAccountRepository. @
accountRepositoryA R
,R S,
 IRequestRoomPermissionRepositoryT t,
requestRoomPermissionRepository	u î
,
î ï-
ITemporaryRoomPermissionFactory
ñ µ,
temporaryRoomPermissionFactory
∂ ‘
,
‘ ’"
INotificationFactory
÷ Í!
notificationFactory
Î ˛
,
˛ ˇ)
IRequestDecisionsRepository
Ä õ(
requestDecisionsRepository
ú ∂
,
∂ ∑
IGenericMapper
∏ ∆
mapper
« Õ
)
Õ Œ
{ 
this 
. 
accountRepository 
=  
accountRepository! 2
;2 3
this 
. +
requestRoomPermissionRepository ,
=- .+
requestRoomPermissionRepository/ N
;N O
this 
. *
temporaryRoomPermissionFactory +
=, -*
temporaryRoomPermissionFactory. L
;L M
this 
. 
notificationFactory  
=! "
notificationFactory# 6
;6 7
this 
. &
requestDecisionsRepository '
=( )&
requestDecisionsRepository* D
;D E
this 
. 
mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
ServiceResult #
># $
Execute% ,
(, -
Account- 4
approverAccount5 D
,D E
stringF L
	requestIDM V
,V W
intX [
days\ `
)` a
{   $
RequestRoomPermissionDto!!  
?!!  !

requestDTO!!" ,
=!!- .
(!!/ 0$
RequestRoomPermissionDto!!0 H
?!!H I
)!!I J
await!!J O+
requestRoomPermissionRepository!!P o
.!!o p
GetById!!p w
(!!w x
	requestID	!!x Å
)
!!Å Ç
;
!!Ç É
if"" 

("" 

requestDTO"" 
is"" 
null"" 
)"" 
{## 	
log$$ 
.$$ 
Warn$$ 
($$ 
$"$$ 
$str$$ '
{$$' (
	requestID$$( 1
}$$1 2
$str$$2 @
"$$@ A
)$$A B
;$$B C
return%% 
ServiceResult%%  
.%%  !
REQUEST_NOT_FOUND%%! 2
;%%2 3
}&& 	
log(( 
.(( 
Info(( 
((( 
$"(( 
$str(( #
{((# $
	requestID(($ -
}((- .
$str((. ?
"((? @
)((@ A
;((A B!
RequestRoomPermission)) 
request)) %
=))& '
mapper))( .
.)). /
Map))/ 2
<))2 3$
RequestRoomPermissionDto))3 K
,))K L!
RequestRoomPermission))M b
>))b c
())c d

requestDTO))d n
)))n o
;))o p

AccountDto++ 
?++ 

accountDTO++ 
=++  
(++! "

AccountDto++" ,
?++, -
)++- .
await++. 3
accountRepository++4 E
.++E F

GetAccount++F P
(++P Q
request++Q X
.++X Y
Username++Y a
)++a b
;++b c
if,, 

(,, 

accountDTO,, 
is,, 
null,, 
),, 
{-- 	
log.. 
... 
Warn.. 
(.. 
$".. 
$str.. -
{..- .
request... 5
...5 6
Username..6 >
}..> ?
$str..? M
"..M N
)..N O
;..O P
_// 
=// +
requestRoomPermissionRepository// /
./// 0
DeleteRequest//0 =
(//= >
request//> E
)//E F
;//F G
return00 
ServiceResult00  
.00  !
ACCOUNT_NOT_FOUND00! 2
;002 3
}11 	
Account33 
account33 
=33 
mapper33  
.33  !
Map33! $
<33$ %

AccountDto33% /
,33/ 0
Account331 8
>338 9
(339 :

accountDTO33: D
)33D E
;33E F
if44 

(44 
request44 
.44 
Type44 
==44 %
RequestRoomPermissionType44 5
.445 6
	PERMANENT446 ?
)44? @
{55 	
Notification66 
notification66 %
=66& '
notificationFactory66( ;
.66; <
Create66< B
(66B C
approverAccount66C R
.66R S
Username66S [
,66[ \
$"66] _
$str	66_ Ä
{
66Ä Å
request
66Å à
.
66à â
RoomName
66â ë
}
66ë í
$str
66í û
"
66û ü
)
66ü †
;
66† °
account77 
.77 
AllowedRooms77  
.77  !
Add77! $
(77$ %
request77% ,
.77, -
RoomName77- 5
)775 6
;776 7
account88 
.88 
Notifications88 !
.88! "
Add88" %
(88% &
notification88& 2
)882 3
;883 4
if99 
(99 
await99 
accountRepository99 '
.99' (
UpdateAccount99( 5
(995 6
account996 =
)99= >
!=99? A
DatabaseResult99B P
.99P Q
OK99Q S
)99S T
{:: 
return;; 
ServiceResult;; $
.;;$ %
DATABASE_ERROR;;% 3
;;;3 4
}<< 
log>> 
.>> 
Info>> 
(>> 
$">> 
$str>> ?
{>>? @
account>>@ G
.>>G H
Username>>H P
}>>P Q
$str>>Q Z
{>>Z [
request>>[ b
.>>b c
RoomName>>c k
}>>k l
">>l m
)>>m n
;>>n o
RequestDecisions?? 
requestDecisions?? -
=??. /
new??0 3
RequestDecisions??4 D
(??D E
Guid??E I
.??I J
NewGuid??J Q
(??Q R
)??R S
.??S T
ToString??T \
(??\ ]
)??] ^
,??^ _
approverAccount??` o
.??o p
Username??p x
,??x y
request	??z Å
.
??Å Ç
Username
??Ç ä
,
??ä ã
request
??å ì
.
??ì î
RoomName
??î ú
,
??ú ù
request
??û •
.
??• ¶
Type
??¶ ™
,
??™ ´
true
??¨ ∞
)
??∞ ±
;
??± ≤
_@@ 
=@@ &
requestDecisionsRepository@@ *
.@@* +
AddRequestDecision@@+ =
(@@= >
requestDecisions@@> N
)@@N O
;@@O P
_AA 
=AA +
requestRoomPermissionRepositoryAA /
.AA/ 0
DeleteRequestAA0 =
(AA= >
requestAA> E
)AAE F
;AAF G
returnBB 
ServiceResultBB  
.BB  !
OKBB! #
;BB# $
}CC 	
elseEE 
ifEE 
(EE 
requestEE 
.EE 
TypeEE 
==EE  %
RequestRoomPermissionTypeEE! :
.EE: ;
	TEMPORARYEE; D
)EED E
{FF 	
ifGG 
(GG 
daysGG 
==GG 
$numGG 
)GG 
{HH 
logII 
.II 
WarnII 
(II 
$"II 
$strII D
{IID E
daysIIE I
}III J
$strIIJ O
"IIO P
)IIP Q
;IIQ R
returnJJ 
ServiceResultJJ $
.JJ$ %
INVALID_OPERATIONJJ% 6
;JJ6 7
}KK 
NotificationLL 
notificationLL %
=LL& '
notificationFactoryLL( ;
.LL; <
CreateLL< B
(LLB C
approverAccountLLC R
.LLR S
UsernameLLS [
,LL[ \
$"LL] _
$strLL_ {
{LL{ |
request	LL| É
.
LLÉ Ñ
RoomName
LLÑ å
}
LLå ç
$str
LLç û
{
LLû ü
days
LLü £
}
LL£ §
$str
LL§ ©
"
LL© ™
)
LL™ ´
;
LL´ ¨#
TemporaryRoomPermissionMM #

permissionMM$ .
=MM/ 0*
temporaryRoomPermissionFactoryMM1 O
.MMO P
CreateMMP V
(MMV W
requestMMW ^
.MM^ _
RoomNameMM_ g
,MMg h
DateTimeOffsetMMi w
.MMw x
NowMMx {
.MM{ |
ToUnixTimeSeconds	MM| ç
(
MMç é
)
MMé è
,
MMè ê
DateTimeOffset
MMë ü
.
MMü †
Now
MM† £
.
MM£ §
AddDays
MM§ ´
(
MM´ ¨
days
MM¨ ∞
)
MM∞ ±
.
MM± ≤
ToUnixTimeSeconds
MM≤ √
(
MM√ ƒ
)
MMƒ ≈
)
MM≈ ∆
;
MM∆ «
accountNN 
.NN $
TemporaryRoomPermissionsNN ,
.NN, -
AddNN- 0
(NN0 1

permissionNN1 ;
)NN; <
;NN< =
accountOO 
.OO 
NotificationsOO !
.OO! "
AddOO" %
(OO% &
notificationOO& 2
)OO2 3
;OO3 4
ifPP 
(PP 
awaitPP 
accountRepositoryPP '
.PP' (
UpdateAccountPP( 5
(PP5 6
accountPP6 =
)PP= >
!=PP? A
DatabaseResultPPB P
.PPP Q
OKPPQ S
)PPS T
{QQ 
returnRR 
ServiceResultRR $
.RR$ %
DATABASE_ERRORRR% 3
;RR3 4
}SS 
logUU 
.UU 
InfoUU 
(UU 
$"UU 
$strUU I
{UUI J
accountUUJ Q
.UUQ R
UsernameUUR Z
}UUZ [
$strUU[ d
{UUd e
requestUUe l
.UUl m
RoomNameUUm u
}UUu v
$strUUv {
{UU{ |
days	UU| Ä
}
UUÄ Å
$str
UUÅ Ü
"
UUÜ á
)
UUá à
;
UUà â
RequestDecisionsVV 
requestDecisionsVV -
=VV. /
newVV0 3
RequestDecisionsVV4 D
(VVD E
GuidVVE I
.VVI J
NewGuidVVJ Q
(VVQ R
)VVR S
.VVS T
ToStringVVT \
(VV\ ]
)VV] ^
,VV^ _
approverAccountVV` o
.VVo p
UsernameVVp x
,VVx y
request	VVz Å
.
VVÅ Ç
Username
VVÇ ä
,
VVä ã
request
VVå ì
.
VVì î
RoomName
VVî ú
,
VVú ù
request
VVû •
.
VV• ¶
Type
VV¶ ™
,
VV™ ´
true
VV¨ ∞
)
VV∞ ±
;
VV± ≤
_WW 
=WW &
requestDecisionsRepositoryWW *
.WW* +
AddRequestDecisionWW+ =
(WW= >
requestDecisionsWW> N
)WWN O
;WWO P
_XX 
=XX +
requestRoomPermissionRepositoryXX /
.XX/ 0
DeleteRequestXX0 =
(XX= >
requestXX> E
)XXE F
;XXF G
returnYY 
ServiceResultYY  
.YY  !
OKYY! #
;YY# $
}ZZ 	
return[[ 
ServiceResult[[ 
.[[ 
UNKNOWN_ERROR[[ *
;[[* +
}\\ 
}]] ‘"
™/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/RequestDecisionsServices/GetRequestDecisionsByPageService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )$
RequestDecisionsServices) A
;A B
public

 
class

 ,
 GetRequestDecisionsByPageService

 -
{ 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <,
 GetRequestDecisionsByPageService< \
)\ ]
)] ^
;^ _
private 
readonly '
IRequestDecisionsRepository 0&
requestDecisionsRepository1 K
;K L
private 
readonly 
IGenericMapper #
mapper$ *
;* +
public 
,
 GetRequestDecisionsByPageService +
(+ ,'
IRequestDecisionsRepository, G&
requestDecisionsRepositoryH b
,b c
IGenericMapperd r
mappers y
)y z
{ 
this 
. &
requestDecisionsRepository '
=( )&
requestDecisionsRepository* D
;D E
this 
. 
mapper 
= 
mapper 
; 
} 
public 

async 
Task 
< 
( 
ServiceResult $
,$ %
List& *
<* +
RequestDecisions+ ;
>; <
?< =
,= >
long? C
)C D
>D E
ExecuteF M
(M N
intN Q
pageR V
)V W
{ 
List 
< 
RequestDecisionsDto  
>  !
requests" *
=+ ,
(- .
List. 2
<2 3
RequestDecisionsDto3 F
>F G
)G H
awaitH M&
requestDecisionsRepositoryN h
.h i%
GetRequestDecisionByPage	i Å
(
Å Ç
page
Ç Ü
)
Ü á
;
á à
long 
requestsCount 
= 
await "&
requestDecisionsRepository# =
.= >
GetRequestsCount> N
(N O
)O P
;P Q
double 
pagesDouble 
= 
( 
double $
)$ %
requestsCount% 2
/3 4
$num5 6
;6 7
long 
pages 
= 
( 
long 
) 
Math 
.  
Ceiling  '
(' (
pagesDouble( 3
)3 4
;4 5
if 

( 
requests 
. 
Count 
== 
$num 
)  
{ 	
log 
. 
Warn 
( 
$" 
$str 1
{1 2
page2 6
}6 7
"7 8
)8 9
;9 :
return   
new   
(   
ServiceResult   $
.  $ %
	NOT_FOUND  % .
,  . /
null  0 4
,  4 5
$num  6 7
)  7 8
;  8 9
}!! 	
log## 
.## 
Info## 
(## 
$"## 
$str## 
{## 
requests## $
.##$ %
Count##% *
}##* +
$str##+ 4
"##4 5
)##5 6
;##6 7
List$$ 
<$$ 
RequestDecisions$$ 
>$$ 
requestsList$$ +
=$$, -
mapper$$. 4
.$$4 5
Map$$5 8
<$$8 9
List$$9 =
<$$= >
RequestDecisionsDto$$> Q
>$$Q R
,$$R S
List$$T X
<$$X Y
RequestDecisions$$Y i
>$$i j
>$$j k
($$k l
requests$$l t
)$$t u
;$$u v
return%% 
new%% 
(%% 
ServiceResult%%  
.%%  !
OK%%! #
,%%# $
requestsList%%% 1
,%%1 2
pages%%3 8
)%%8 9
;%%9 :
}&& 
}'' ¨
ü/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/NotificationServices/UpdateNotificationService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( ) 
NotificationServices) =
;= >
public		 
class		 %
UpdateNotificationService		 &
{

 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <%
UpdateNotificationService< U
)U V
)V W
;W X
private 
readonly 
Account 
account $
;$ %
private 
readonly 
IAccountRepository '
accountRepository( 9
;9 :
public 
%
UpdateNotificationService $
($ %
Account% ,
account- 4
,4 5
IAccountRepository6 H
accountRepositoryI Z
)Z [
{ 
this 
. 
account 
= 
account 
; 
this 
. 
accountRepository 
=  
accountRepository! 2
;2 3
} 
public 

async 
Task 
< 
ServiceResult #
># $
Execute% ,
(, -
string- 3
id4 6
,6 7
bool8 <
isRead= C
)C D
{ 
log 
. 
Info 
( 
$" 
$str 6
{6 7
id7 9
}9 :
$str: G
{G H
accountH O
.O P
UsernameP X
}X Y
$strY l
{l m
isReadm s
}s t
"t u
)u v
;v w
Notification 
? 
notification "
=# $
account% ,
., -
Notifications- :
.: ;
Find; ?
(? @
n@ A
=>B D
nE F
.F G
IdG I
==J L
idM O
)O P
;P Q
if 

( 
notification 
is 
null  
)  !
{ 	
return 
ServiceResult  
.  !
	NOT_FOUND! *
;* +
} 	
notification 
. 
IsRead 
= 
isRead $
;$ %
DatabaseResult 
result 
= 
await  %
accountRepository& 7
.7 8
UpdateAccount8 E
(E F
accountF M
)M N
;N O
switch   
(   
result   
)   
{!! 	
case"" 
DatabaseResult"" 
.""  
ACCOUNT_NOT_FOUND""  1
:""1 2
return## 
ServiceResult## $
.##$ %
ACCOUNT_NOT_FOUND##% 6
;##6 7
case$$ 
DatabaseResult$$ 
.$$  
UNKNOWN_ERROR$$  -
:$$- .
return%% 
ServiceResult%% $
.%%$ %
DATABASE_ERROR%%% 3
;%%3 4
default&& 
:&& 
return'' 
ServiceResult'' $
.''$ %
OK''% '
;''' (
}(( 	
})) 
}** ¶
£/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/NotificationServices/UpdateAllNotificationsService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( ) 
NotificationServices) =
;= >
public		 
class		 )
UpdateAllNotificationsService		 *
{

 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <)
UpdateAllNotificationsService< Y
)Y Z
)Z [
;[ \
private 
readonly 
Account 
account $
;$ %
private 
readonly 
IAccountRepository '
accountRepository( 9
;9 :
public 
)
UpdateAllNotificationsService (
(( )
Account) 0
account1 8
,8 9
IAccountRepository: L
accountRepositoryM ^
)^ _
{ 
this 
. 
account 
= 
account 
; 
this 
. 
accountRepository 
=  
accountRepository! 2
;2 3
} 
public 

async 
Task 
< 
ServiceResult #
># $
Execute% ,
(, -
bool- 1
isRead2 8
)8 9
{ 
log 
. 
Info 
( 
$" 
$str A
{A B
accountB I
.I J
UsernameJ R
}R S
$strS f
{f g
isReadg m
}m n
"n o
)o p
;p q
account 
. 
Notifications 
. 
ForEach %
(% &
n& '
=>( *
n+ ,
., -
IsRead- 3
=4 5
isRead6 <
)< =
;= >
DatabaseResult 
result 
= 
await  %
accountRepository& 7
.7 8
UpdateAccount8 E
(E F
accountF M
)M N
;N O
switch 
( 
result 
) 
{ 	
case 
DatabaseResult 
.  
ACCOUNT_NOT_FOUND  1
:1 2
return 
ServiceResult $
.$ %
ACCOUNT_NOT_FOUND% 6
;6 7
case 
DatabaseResult 
.  
UNKNOWN_ERROR  -
:- .
return   
ServiceResult   $
.  $ %
DATABASE_ERROR  % 3
;  3 4
default!! 
:!! 
return"" 
ServiceResult"" $
.""$ %
OK""% '
;""' (
}## 	
}$$ 
}%% ∑
ü/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/NotificationServices/RemoveNotificationService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( ) 
NotificationServices) =
;= >
public		 
class		 %
RemoveNotificationService		 &
{

 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <%
RemoveNotificationService< U
)U V
)V W
;W X
private 
readonly 
Account 
account $
;$ %
private 
readonly 
IAccountRepository '
accountRepository( 9
;9 :
public 
%
RemoveNotificationService $
($ %
Account% ,
account- 4
,4 5
IAccountRepository6 H
accountRepositoryI Z
)Z [
{ 
this 
. 
account 
= 
account 
; 
this 
. 
accountRepository 
=  
accountRepository! 2
;2 3
} 
public 

async 
Task 
< 
ServiceResult #
># $
Execute% ,
(, -
string- 3
id4 6
)6 7
{ 
log 
. 
Info 
( 
$" 
$str 1
{1 2
id2 4
}4 5
$str5 B
{B C
accountC J
.J K
UsernameK S
}S T
"T U
)U V
;V W
if 

( 
! 
account 
. 
Notifications "
." #
Exists# )
() *
n* +
=>, .
n/ 0
.0 1
Id1 3
==4 6
id7 9
)9 :
): ;
{ 	
return 
ServiceResult  
.  !
	NOT_FOUND! *
;* +
} 	
account 
. 
Notifications 
. 
	RemoveAll '
(' (
n( )
=>* ,
n- .
.. /
Id/ 1
==2 4
id5 7
)7 8
;8 9
DatabaseResult 
result 
= 
await  %
accountRepository& 7
.7 8
UpdateAccount8 E
(E F
accountF M
)M N
;N O
switch 
( 
result 
) 
{   	
case!! 
DatabaseResult!! 
.!!  
ACCOUNT_NOT_FOUND!!  1
:!!1 2
return"" 
ServiceResult"" $
.""$ %
ACCOUNT_NOT_FOUND""% 6
;""6 7
case## 
DatabaseResult## 
.##  
UNKNOWN_ERROR##  -
:##- .
return$$ 
ServiceResult$$ $
.$$$ %
DATABASE_ERROR$$% 3
;$$3 4
default%% 
:%% 
return&& 
ServiceResult&& $
.&&$ %
OK&&% '
;&&' (
}'' 	
}(( 
})) ∆
£/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/NotificationServices/RemoveAllNotificationsService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( ) 
NotificationServices) =
;= >
public		 
class		 )
RemoveAllNotificationsService		 *
{

 
private 
readonly 
ILog 
log 
= 

LogManager  *
.* +
	GetLogger+ 4
(4 5
typeof5 ;
(; <)
RemoveAllNotificationsService< Y
)Y Z
)Z [
;[ \
private 
readonly 
Account 
account $
;$ %
private 
readonly 
IAccountRepository '
accountRepository( 9
;9 :
public 
)
RemoveAllNotificationsService (
(( )
Account) 0
account1 8
,8 9
IAccountRepository: L
accountRepositoryM ^
)^ _
{ 
this 
. 
account 
= 
account 
; 
this 
. 
accountRepository 
=  
accountRepository! 2
;2 3
} 
public 

async 
Task 
< 
ServiceResult #
># $
Execute% ,
(, -
)- .
{ 
log 
. 
Info 
( 
$" 
$str A
{A B
accountB I
.I J
UsernameJ R
}R S
"S T
)T U
;U V
account 
. 
Notifications 
. 
Clear #
(# $
)$ %
;% &
DatabaseResult 
result 
= 
await  %
accountRepository& 7
.7 8
UpdateAccount8 E
(E F
accountF M
)M N
;N O
switch 
( 
result 
) 
{ 	
case 
DatabaseResult 
.  
ACCOUNT_NOT_FOUND  1
:1 2
return 
ServiceResult $
.$ %
ACCOUNT_NOT_FOUND% 6
;6 7
case 
DatabaseResult 
.  
UNKNOWN_ERROR  -
:- .
return   
ServiceResult   $
.  $ %
DATABASE_ERROR  % 3
;  3 4
default!! 
:!! 
return"" 
ServiceResult"" $
.""$ %
OK""% '
;""' (
}## 	
}$$ 
}%% ‡ 
ë/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageRoomServices/RemoveService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( )
ManageRoomServices

) ;
{ 
public 

class 
RemoveRoomService "
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
RemoveRoomService@ Q
)Q R
)R S
;S T
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
RemoveRoomService  
(  !
IRoomRepository! 0
roomRepository1 ?
,? @
IAccountRepositoryA S
accountRepositoryT e
,e f
IGenericMapperg u
mapperv |
)| }
{ 	
this 
. 
roomRepository 
=  !
roomRepository" 0
;0 1
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
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
< 
ServiceResult '
>' (
Execute) 0
(0 1
string1 7
roomName8 @
)@ A
{ 	
RoomDto 
? 
roomDTO 
= 
(  
RoomDto  '
?' (
)( )
await) .
roomRepository/ =
.= >
GetRoom> E
(E F
roomNameF N
)N O
;O P
if 
( 
roomDTO 
is 
null 
)  
{ 
log 
. 
Warn 
( 
$" 
$str *
{* +
roomName+ 3
.3 4
ToLower4 ;
(; <
)< =
}= >
$str> L
"L M
)M N
;N O
return   
ServiceResult   $
.  $ %
ROOM_NOT_FOUND  % 3
;  3 4
}!! 
Room"" 
room"" 
="" 
mapper"" 
."" 
Map"" "
<""" #
RoomDto""# *
,""* +
Room"", 0
>""0 1
(""1 2
roomDTO""2 9
)""9 :
;"": ;
DatabaseResult$$ 
removeResult$$ '
=$$( )
await$$* /
roomRepository$$0 >
.$$> ?

RemoveRoom$$? I
($$I J
room$$J N
)$$N O
;$$O P
if%% 
(%% 
removeResult%% 
==%% 
DatabaseResult%%  .
.%%. /
UNKNOWN_ERROR%%/ <
)%%< =
{&& 
return'' 
ServiceResult'' $
.''$ %
DATABASE_ERROR''% 3
;''3 4
}(( 
DatabaseResult** 
cleanupResult** (
=**) *
await**+ 0
accountRepository**1 B
.**B C.
"CleanupPermissionsAfterRoomRemoval**C e
(**e f
room**f j
.**j k
Name**k o
)**o p
;**p q
if++ 
(++ 
cleanupResult++ 
==++  
DatabaseResult++! /
.++/ 0
UNKNOWN_ERROR++0 =
)++= >
{,, 
return-- 
ServiceResult-- $
.--$ %
DATABASE_ERROR--% 3
;--3 4
}.. 
return// 
ServiceResult//  
.//  !
OK//! #
;//# $
}00 	
}11 
}22 è
ó/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageRoomServices/RegisterRoomService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )
ManageRoomServices) ;
{		 
public

 

class

 
RegisterRoomService

 $
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
(? @
RegisterRoomService@ S
)S T
)T U
;U V
private 
readonly 
IRoomRepository (

repository) 3
;3 4
public 
RegisterRoomService "
(" #
IRoomRepository# 2

repository3 =
)= >
{ 	
this 
. 

repository 
= 

repository (
;( )
} 	
public 
async 
Task 
< 
ServiceResult '
>' (
Execute) 0
(0 1
Room1 5
room6 :
): ;
{ 	
log 
. 
Info 
( 
$" 
$str /
{/ 0
room0 4
.4 5
Name5 9
}9 :
": ;
); <
;< =
DatabaseResult 
existResult &
=' (
await) .

repository/ 9
.9 :
	RoomExist: C
(C D
roomD H
.H I
NameI M
)M N
;N O
if 
( 
existResult 
== 
DatabaseResult -
.- .

ROOM_EXIST. 8
)8 9
{ 
return 
ServiceResult $
.$ %
ROOM_ALREADY_EXIST% 7
;7 8
} 
DatabaseResult 
result !
=" #
await$ )

repository* 4
.4 5

AddNewRoom5 ?
(? @
room@ D
)D E
;E F
if 
( 
result 
== 
DatabaseResult (
.( )
UNKNOWN_ERROR) 6
)6 7
{ 
return   
ServiceResult   $
.  $ %
DATABASE_ERROR  % 3
;  3 4
}!! 
return## 
ServiceResult##  
.##  !
OK##! #
;### $
}$$ 	
}%% 
}&& ¥*
¢/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageAccountServices/RemoveRoomPermissionService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( )!
ManageAccountServices

) >
{ 
public 

class '
RemoveRoomPermissionService ,
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
(? @'
RemoveRoomPermissionService@ [
)[ \
)\ ]
;] ^
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IGenericMapper '
mapper( .
;. /
public '
RemoveRoomPermissionService *
(* +
IAccountRepository+ =
accountRepository> O
,O P
IRoomRepositoryQ `
roomRepositorya o
,o p
IGenericMapperq 
mapper
Ä Ü
)
Ü á
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
roomRepository 
=  !
roomRepository" 0
;0 1
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
< 
ServiceResult '
>' (
Execute) 0
(0 1
string1 7
username8 @
,@ A
stringB H
roomNameI Q
)Q R
{ 	

AccountDto 
? 

accountDTO "
=# $
(% &

AccountDto& 0
?0 1
)1 2
await2 7
accountRepository8 I
.I J

GetAccountJ T
(T U
usernameU ]
)] ^
;^ _
if 
( 

accountDTO 
is 
null "
)" #
{ 
log 
. 
Warn 
( 
$" 
$str 1
{1 2
username2 :
.: ;
ToLower; B
(B C
)C D
}D E
$strE S
"S T
)T U
;U V
return   
ServiceResult   $
.  $ %
ACCOUNT_NOT_FOUND  % 6
;  6 7
}!! 
RoomDto## 
?## 
roomDTO## 
=## 
(##  
RoomDto##  '
?##' (
)##( )
await##) .
roomRepository##/ =
.##= >
GetRoom##> E
(##E F
roomName##F N
)##N O
;##O P
if$$ 
($$ 
roomDTO$$ 
is$$ 
null$$ 
)$$  
{%% 
log&& 
.&& 
Warn&& 
(&& 
$"&& 
$str&& *
{&&* +
roomName&&+ 3
.&&3 4
ToLower&&4 ;
(&&; <
)&&< =
}&&= >
$str&&> L
"&&L M
)&&M N
;&&N O
return'' 
ServiceResult'' $
.''$ %
ROOM_NOT_FOUND''% 3
;''3 4
}(( 
Account** 
account** 
=** 
mapper** $
.**$ %
Map**% (
<**( )

AccountDto**) 3
,**3 4
Account**5 <
>**< =
(**= >

accountDTO**> H
)**H I
;**I J
Room++ 
room++ 
=++ 
mapper++ 
.++ 
Map++ "
<++" #
RoomDto++# *
,++* +
Room++, 0
>++0 1
(++1 2
roomDTO++2 9
)++9 :
;++: ;
account-- 
.-- 
AllowedRooms--  
.--  !
Remove--! '
(--' (
room--( ,
.--, -
Name--- 1
)--1 2
;--2 3
DatabaseResult.. 
result.. !
=.." #
await..$ )
accountRepository..* ;
...; <
UpdateAccount..< I
(..I J
account..J Q
)..Q R
;..R S
if00 
(00 
result00 
!=00 
DatabaseResult00 (
.00( )
OK00) +
)00+ ,
{11 
switch22 
(22 
result22 
)22 
{33 
case44 
DatabaseResult44 '
.44' (
UNKNOWN_ERROR44( 5
:445 6
return55 
ServiceResult55 ,
.55, -
DATABASE_ERROR55- ;
;55; <
case66 
DatabaseResult66 '
.66' (%
ROOM_PERMISSION_NOT_FOUND66( A
:66A B
return77 
ServiceResult77 ,
.77, -
INVALID_OPERATION77- >
;77> ?
}88 
}99 
return;; 
ServiceResult;;  
.;;  !
OK;;! #
;;;# $
}<< 	
}== 
}>> ƒ4
õ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageAccountServices/RemoveAccountService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )!
ManageAccountServices) >
{ 
public 

class  
RemoveAccountService %
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
RemoveAccountService@ T
)T U
)U V
;V W
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IFaceRepository (
faceRepository) 7
;7 8
private 
readonly 
IGenericMapper '
mapper( .
;. /
private 
readonly )
IFaceRecognitionServiceClient 6
client7 =
;= >
public  
RemoveAccountService #
(# $
IAccountRepository$ 6
accountRepository7 H
,H I
IFaceRepositoryJ Y
faceRepositoryZ h
,h i
IGenericMapperj x
mappery 
,	 Ä+
IFaceRecognitionServiceClient
Å û
client
ü •
)
• ¶
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
faceRepository 
=  !
faceRepository" 0
;0 1
this 
. 
mapper 
= 
mapper  
;  !
this 
. 
client 
= 
client  
;  !
} 	
public 
async 
Task 
< 
ServiceResult '
>' (
Execute) 0
(0 1
Account1 8
currentAccount9 G
,G H
stringI O
usernameP X
)X Y
{ 	

AccountDto 
? 

accountDTO "
=# $
(% &

AccountDto& 0
?0 1
)1 2
await2 7
accountRepository8 I
.I J

GetAccountJ T
(T U
usernameU ]
)] ^
;^ _
if   
(   

accountDTO   
is   
null   "
)  " #
{!! 
log"" 
."" 
Warn"" 
("" 
$""" 
$str"" 1
{""1 2
username""2 :
."": ;
ToLower""; B
(""B C
)""C D
}""D E
$str""E S
"""S T
)""T U
;""U V
return## 
ServiceResult## $
.##$ %
ACCOUNT_NOT_FOUND##% 6
;##6 7
}$$ 
Account'' 
account'' 
='' 
mapper'' $
.''$ %
Map''% (
<''( )

AccountDto'') 3
,''3 4
Account''5 <
>''< =
(''= >

accountDTO''> H
)''H I
;''I J
if(( 
((( 
currentAccount(( 
.(( 
Role(( #
!=(($ &
Role((' +
.((+ ,
ADMIN((, 1
&&((2 4
account((5 <
.((< =
Role((= A
==((B D
Role((E I
.((I J
ADMIN((J O
)((O P
{)) 
log** 
.** 
Warn** 
(** 
$"** 
$str** -
{**- .
currentAccount**. <
.**< =
Role**= A
}**A B
$str**B a
"**a b
)**b c
;**c d
return++ 
ServiceResult++ $
.++$ %
INVALID_OPERATION++% 6
;++6 7
},, 
if.. 
(.. 
currentAccount.. 
... 
Username.. '
==..( *
username..+ 3
)..3 4
{// 
log00 
.00 
Warn00 
(00 
$"00 
$str00 1
{001 2
username002 :
}00: ;
$str00; Y
"00Y Z
)00Z [
;00[ \
return11 
ServiceResult11 $
.11$ %
INVALID_OPERATION11% 6
;116 7
}22 
if44 
(44 
await44 
accountRepository44 '
.44' (
RemoveAccount44( 5
(445 6
account446 =
)44= >
==44? A
DatabaseResult44B P
.44P Q
UNKNOWN_ERROR44Q ^
)44^ _
{55 
log66 
.66 
Error66 
(66 
$"66 
$str66 ]
{66] ^
username66^ f
}66f g
"66g h
)66h i
;66i j
return77 
ServiceResult77 $
.77$ %
DATABASE_ERROR77% 3
;773 4
}88 
if:: 
(:: 
account:: 
.:: 
FaceID:: 
is:: !
not::" %
null::& *
&&::+ -
account::. 5
.::5 6
FaceID::6 <
>::= >
$num::? @
)::@ A
{;; 
DatabaseResult<< 
dbResult<< '
=<<( )
await<<* /
faceRepository<<0 >
.<<> ?

RemoveFace<<? I
(<<I J
(<<J K
int<<K N
)<<N O
account<<O V
.<<V W
FaceID<<W ]
)<<] ^
;<<^ _
if== 
(== 
dbResult== 
==== 
DatabaseResult==  .
.==. /
UNKNOWN_ERROR==/ <
)==< =
{>> 
log?? 
.?? 
Error?? 
(?? 
$"??  
$str??  X
{??X Y
(??Y Z
int??Z ]
)??] ^
account??^ e
.??e f
FaceID??f l
}??l m
$str	??m Ü
{
??Ü á
username
??á è
}
??è ê
"
??ê ë
)
??ë í
;
??í ì
return@@ 
ServiceResult@@ (
.@@( )
DATABASE_ERROR@@) 7
;@@7 8
}AA 
_BB 
=BB 
clientBB 
.BB 
RefreshCacheBB '
(BB' (
)BB( )
;BB) *
}CC 
returnEE 
ServiceResultEE  
.EE  !
OKEE! #
;EE# $
}FF 	
}GG 
}HH È1
ù/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageAccountServices/RegisterAccountService.cs
	namespace

 	
VisualAccess


 
.

 
Business

 
.

  
Services

  (
.

( )!
ManageAccountServices

) >
{ 
public 

class "
RegisterAccountService '
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
(? @"
RegisterAccountService@ V
)V W
)W X
;X Y
private 
readonly 
IAccountRepository +

repository, 6
;6 7
private 
readonly 
IAccountValidator *
	validator+ 4
;4 5
public "
RegisterAccountService %
(% &
IAccountRepository& 8

repository9 C
,C D
IAccountValidatorE V
	validatorW `
)` a
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	validator 
= 
	validator &
;& '
} 	
public 
async 
Task 
< 
ServiceResult '
>' (
Execute) 0
(0 1
Account1 8
currentAccount9 G
,G H
AccountI P
accountQ X
)X Y
{ 	
if 
( 
currentAccount 
. 
Role #
!=$ &
Role' +
.+ ,
ADMIN, 1
&&2 4
account5 <
.< =
Role= A
==B D
RoleE I
.I J
ADMINJ O
)O P
{ 
log 
. 
Warn 
( 
$" 
$str -
{- .
currentAccount. <
.< =
Role= A
}A B
$strB c
"c d
)d e
;e f
return 
ServiceResult $
.$ %
INVALID_OPERATION% 6
;6 7
} 
if   
(   
!   
	validator   
.   
IsValidUsername   *
(  * +
account  + 2
.  2 3
Username  3 ;
)  ; <
)  < =
{!! 
log"" 
."" 
Warn"" 
("" 
$""" 
$str"" =
{""= >
account""> E
.""E F
Username""F N
}""N O
"""O P
)""P Q
;""Q R
return## 
ServiceResult## $
.##$ %
INVALID_USERNAME##% 5
;##5 6
}$$ 
if&& 
(&& 
!&& 
	validator&& 
.&& 
IsValidEmail&& '
(&&' (
account&&( /
.&&/ 0
Email&&0 5
)&&5 6
)&&6 7
{'' 
log(( 
.(( 
Warn(( 
((( 
$"(( 
$str(( :
{((: ;
account((; B
.((B C
Email((C H
}((H I
"((I J
)((J K
;((K L
return)) 
ServiceResult)) $
.))$ %
INVALID_EMAIL))% 2
;))2 3
}** 
if,, 
(,, 
!,, 
	validator,, 
.,, 
IsValidPhoneNumber,, -
(,,- .
account,,. 5
.,,5 6
PhoneNumber,,6 A
),,A B
),,B C
{-- 
log.. 
... 
Warn.. 
(.. 
$".. 
$str.. A
{..A B
account..B I
...I J
PhoneNumber..J U
}..U V
"..V W
)..W X
;..X Y
return// 
ServiceResult// $
.//$ % 
INVALID_PHONE_NUMBER//% 9
;//9 :
}00 
if22 
(22 
await22 
	validator22 
.22   
UsernameAlreadyExist22  4
(224 5
account225 <
.22< =
Username22= E
)22E F
)22F G
{33 
log44 
.44 
Warn44 
(44 
$"44 
$str44 :
{44: ;
account44; B
.44B C
Username44C K
}44K L
$str44L \
"44\ ]
)44] ^
;44^ _
return55 
ServiceResult55 $
.55$ %!
ACCOUNT_ALREADY_EXIST55% :
;55: ;
}66 
if88 
(88 
await88 
	validator88 
.88  
EmailAlreadyExist88  1
(881 2
account882 9
.889 :
Email88: ?
)88? @
)88@ A
{99 
log:: 
.:: 
Warn:: 
(:: 
$":: 
$str:: 7
{::7 8
account::8 ?
.::? @
Email::@ E
}::E F
$str::F V
"::V W
)::W X
;::X Y
return;; 
ServiceResult;; $
.;;$ %
EMAIL_ALREADY_EXIST;;% 8
;;;8 9
}<< 
DatabaseResult>> 
result>> !
=>>" #
await>>$ )

repository>>* 4
.>>4 5
CreateAccount>>5 B
(>>B C
account>>C J
)>>J K
;>>K L
if?? 
(?? 
result?? 
==?? 
DatabaseResult?? (
.??( )
UNKNOWN_ERROR??) 6
)??6 7
{@@ 
logAA 
.AA 
ErrorAA 
(AA 
$strAA T
)AAT U
;AAU V
returnBB 
ServiceResultBB $
.BB$ %
DATABASE_ERRORBB% 3
;BB3 4
}CC 
logEE 
.EE 
InfoEE 
(EE 
$"EE 
$strEE -
{EE- .
accountEE. 5
.EE5 6
UsernameEE6 >
}EE> ?
$strEE? [
"EE[ \
)EE\ ]
;EE] ^
returnFF 
ServiceResultFF  
.FF  !
OKFF! #
;FF# $
}GG 	
}HH 
}II ›!
ü/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageAccountServices/GetAccountsByPageService.cs
	namespace		 	
VisualAccess		
 
.		 
Business		 
.		  
Services		  (
.		( )!
ManageAccountServices		) >
{

 
public 

class $
GetAccountsByPageService )
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @$
GetAccountsByPageService@ X
)X Y
)Y Z
;Z [
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IGenericMapper '
mapper( .
;. /
public $
GetAccountsByPageService '
(' (
IAccountRepository( :
accountRepository; L
,L M
IGenericMapperN \
mapper] c
)c d
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
( 
ServiceResult (
,( )
List* .
<. /
Account/ 6
>6 7
?7 8
,8 9
long: >
pages? D
)D E
>E F
ExecuteG N
(N O
intO R
pageS W
)W X
{ 	
List 
< 

AccountDto 
> 
accountsDTOList ,
=- .
(/ 0
List0 4
<4 5

AccountDto5 ?
>? @
)@ A
awaitA F
accountRepositoryG X
.X Y
GetAccountsByPageY j
(j k
pagek o
)o p
;p q
long 
accountCount 
= 
await  %
accountRepository& 7
.7 8
GetAccountCount8 G
(G H
)H I
;I J
double 
pagesDouble 
=  
(! "
double" (
)( )
accountCount) 5
/6 7
$num8 9
;9 :
long 
pages 
= 
( 
long 
) 
Math #
.# $
Ceiling$ +
(+ ,
pagesDouble, 7
)7 8
;8 9
if 
( 
accountsDTOList 
.  
Count  %
==& (
$num) *
)* +
{ 
log   
.   
Warn   
(   
$"   
$str   6
{  6 7
page  7 ;
}  ; <
"  < =
)  = >
;  > ?
return!! 
new!! 
(!! 
ServiceResult!! (
.!!( )
	NOT_FOUND!!) 2
,!!2 3
null!!4 8
,!!8 9
$num!!: ;
)!!; <
;!!< =
}"" 
log$$ 
.$$ 
Info$$ 
($$ 
$"$$ 
$str$$ 
{$$  
accountsDTOList$$  /
.$$/ 0
Count$$0 5
}$$5 6
$str$$6 ?
"$$? @
)$$@ A
;$$A B
List%% 
<%% 
Account%% 
>%% 
accountsList%% &
=%%' (
mapper%%) /
.%%/ 0
Map%%0 3
<%%3 4
List%%4 8
<%%8 9

AccountDto%%9 C
>%%C D
,%%D E
List%%F J
<%%J K
Account%%K R
>%%R S
>%%S T
(%%T U
accountsDTOList%%U d
)%%d e
;%%e f
return&& 
new&& 
(&& 
ServiceResult&& $
.&&$ %
OK&&% '
,&&' (
accountsList&&) 5
,&&5 6
pages&&7 <
)&&< =
;&&= >
}(( 	
})) 
}** ®*
ü/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/ManageAccountServices/AddRoomPremissionService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )!
ManageAccountServices) >
{ 
public 

class $
AddRoomPremissionService )
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
(? @$
AddRoomPremissionService@ X
)X Y
)Y Z
;Z [
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IGenericMapper '
mapper( .
;. /
public $
AddRoomPremissionService '
(' (
IAccountRepository( :
accountRepository; L
,L M
IRoomRepositoryN ]
roomRepository^ l
,l m
IGenericMappern |
mapper	} É
)
É Ñ
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
roomRepository 
=  !
roomRepository" 0
;0 1
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
,@ A
stringB H
roomNameI Q
)Q R
{ 	

AccountDto 
? 

accountDTO "
=# $
(% &

AccountDto& 0
?0 1
)1 2
await2 7
accountRepository8 I
.I J

GetAccountJ T
(T U
usernameU ]
)] ^
;^ _
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
RoomDto$$ 
?$$ 
roomDTO$$ 
=$$ 
($$  
RoomDto$$  '
?$$' (
)$$( )
await$$) .
roomRepository$$/ =
.$$= >
GetRoom$$> E
($$E F
roomName$$F N
)$$N O
;$$O P
if%% 
(%% 
roomDTO%% 
is%% 
null%% 
)%%  
{&& 
log'' 
.'' 
Warn'' 
('' 
$"'' 
$str'' *
{''* +
roomName''+ 3
.''3 4
ToLower''4 ;
(''; <
)''< =
}''= >
$str''> L
"''L M
)''M N
;''N O
return(( 
ServiceResult(( $
.(($ %
ROOM_NOT_FOUND((% 3
;((3 4
})) 
Account++ 
account++ 
=++ 
mapper++ $
.++$ %
Map++% (
<++( )

AccountDto++) 3
,++3 4
Account++5 <
>++< =
(++= >

accountDTO++> H
)++H I
;++I J
Room,, 
room,, 
=,, 
mapper,, 
.,, 
Map,, "
<,," #
RoomDto,,# *
,,,* +
Room,,, 0
>,,0 1
(,,1 2
roomDTO,,2 9
),,9 :
;,,: ;
account.. 
... 
AllowedRooms..  
...  !
Add..! $
(..$ %
room..% )
...) *
Name..* .
)... /
;../ 0
DatabaseResult// 
result// !
=//" #
await//$ )
accountRepository//* ;
.//; <
UpdateAccount//< I
(//I J
account//J Q
)//Q R
;//R S
if11 
(11 
result11 
!=11 
DatabaseResult11 (
.11( )
OK11) +
)11+ ,
{22 
switch33 
(33 
result33 
)33 
{44 
case55 
DatabaseResult55 '
.55' (
UNKNOWN_ERROR55( 5
:555 6
return66 
ServiceResult66 ,
.66, -
DATABASE_ERROR66- ;
;66; <
case77 
DatabaseResult77 '
.77' ()
ROOM_PERMISSION_ALREADY_EXIST77( E
:77E F
return88 
ServiceResult88 ,
.88, -
INVALID_OPERATION88- >
;88> ?
}99 
}:: 
return<< 
ServiceResult<<  
.<<  !
OK<<! #
;<<# $
}== 	
}>> 
}?? è#
¶/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/EntranceRecordServices/GetEntranceRecordByPageService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )"
EntranceRecordServices) ?
{ 
public 

class *
GetEntranceRecordByPageService /
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
(? @*
GetEntranceRecordByPageService@ ^
)^ _
)_ `
;` a
private 
readonly %
IEntranceRecordRepository 2$
entranceRecordRepository3 K
;K L
private 
readonly 
IGenericMapper '
mapper( .
;. /
public *
GetEntranceRecordByPageService -
(- .%
IEntranceRecordRepository. G$
entranceRecordRepositoryH `
,` a
IGenericMapperb p
mapperq w
)w x
{ 	
this 
. $
entranceRecordRepository )
=* +$
entranceRecordRepository, D
;D E
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
( 
ServiceResult (
,( )
List* .
<. /
EntranceRecord/ =
>= >
?> ?
,? @
longA E
)E F
>F G
ExecuteH O
(O P
intP S
pageT X
)X Y
{ 	
List 
< 
EntranceRecordDto "
>" #"
entranceRecordsDTOList$ :
=; <
(= >
List> B
<B C
EntranceRecordDtoC T
>T U
)U V
awaitV [$
entranceRecordRepository\ t
.t u%
GetEntranceRecordsByPage	u ç
(
ç é
page
é í
)
í ì
;
ì î
long 
entranceCount 
=  
await! &$
entranceRecordRepository' ?
.? @#
GetEntranceRecordsCount@ W
(W X
)X Y
;Y Z
double 
pagesDouble 
=  
(! "
double" (
)( )
entranceCount) 6
/7 8
$num9 :
;: ;
long 
pages 
= 
( 
long 
) 
Math #
.# $
Ceiling$ +
(+ ,
pagesDouble, 7
)7 8
;8 9
if 
( "
entranceRecordsDTOList &
.& '
Count' ,
==- /
$num0 1
)1 2
{   
log!! 
.!! 
Warn!! 
(!! 
$"!! 
$str!! >
{!!> ?
page!!? C
}!!C D
"!!D E
)!!E F
;!!F G
return"" 
new"" 
("" 
ServiceResult"" (
.""( )
	NOT_FOUND"") 2
,""2 3
null""4 8
,""8 9
$num"": ;
)""; <
;""< =
}## 
log%% 
.%% 
Info%% 
(%% 
$"%% 
$str%% 
{%%  "
entranceRecordsDTOList%%  6
.%%6 7
Count%%7 <
}%%< =
$str%%= N
"%%N O
)%%O P
;%%P Q
List&& 
<&& 
EntranceRecord&& 
>&&  
entranceRecordsList&&! 4
=&&5 6
mapper&&7 =
.&&= >
Map&&> A
<&&A B
List&&B F
<&&F G
EntranceRecordDto&&G X
>&&X Y
,&&Y Z
List&&[ _
<&&_ `
EntranceRecord&&` n
>&&n o
>&&o p
(&&p q#
entranceRecordsDTOList	&&q á
)
&&á à
;
&&à â
return'' 
new'' 
('' 
ServiceResult'' $
.''$ %
OK''% '
,''' (
entranceRecordsList'') <
,''< =
pages''> C
)''C D
;''D E
}(( 	
})) 
}** ´$
ò/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/AuthenticationServices/LoginRoomService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )"
AuthenticationServices) ?
{ 
public 

class 
LoginRoomService !
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @
LoginRoomService@ P
)P Q
)Q R
;R S
private 
readonly 
IRoomRepository (

repository) 3
;3 4
private 
readonly 
IRoomValidator '
	validator( 1
;1 2
private 
readonly 
ITokenFactory &
factory' .
;. /
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
LoginRoomService 
(  
IRoomRepository  /

repository0 :
,: ;
IRoomValidator< J
	validatorK T
,T U
ITokenFactoryV c
factoryd k
,k l
IGenericMapperm {
mapper	| Ç
)
Ç É
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	validator 
= 
	validator &
;& '
this 
. 
factory 
= 
factory "
;" #
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
( 
ServiceResult (
,( )
string* 0
)0 1
>1 2
Execute3 :
(: ;
string; A
nameB F
,F G
stringH N
passwordO W
)W X
{ 	
RoomDto   
?   
roomDTO   
=   
(    
RoomDto    '
?  ' (
)  ( )
await  ) .

repository  / 9
.  9 :
GetRoom  : A
(  A B
name  B F
)  F G
;  G H
if!! 
(!! 
roomDTO!! 
is!! 
null!! 
)!!  
{"" 
log## 
.## 
Warn## 
(## 
$"## 
$str## *
{##* +
name##+ /
.##/ 0
ToLower##0 7
(##7 8
)##8 9
}##9 :
$str##: H
"##H I
)##I J
;##J K
return$$ 
new$$ 
($$ 
ServiceResult$$ (
.$$( )
ROOM_NOT_FOUND$$) 7
,$$7 8
$str$$9 ;
)$$; <
;$$< =
}%% 
Room&& 
room&& 
=&& 
mapper&& 
.&& 
Map&& "
<&&" #
RoomDto&&# *
,&&* +
Room&&, 0
>&&0 1
(&&1 2
roomDTO&&2 9
)&&9 :
;&&: ;
if(( 
((( 
!(( 
	validator(( 
.(( 
VerifyPassword(( )
((() *
room((* .
,((. /
password((0 8
)((8 9
)((9 :
{)) 
log** 
.** 
Warn** 
(** 
$"** 
$str** 7
{**7 8
room**8 <
.**< =
Name**= A
}**A B
"**B C
)**C D
;**D E
return++ 
new++ 
(++ 
ServiceResult++ (
.++( )
WRONG_PASSWORD++) 7
,++7 8
$str++9 ;
)++; <
;++< =
},, 
var.. 
token.. 
=.. 
factory.. 
...  
Create..  &
(..& '
room..' +
)..+ ,
;.., -
log// 
.// 
Info// 
(// 
$"// 
$str// =
{//= >
room//> B
.//B C
Name//C G
}//G H
"//H I
)//I J
;//J K
return00 
new00 
(00 
ServiceResult00 $
.00$ %
OK00% '
,00' (
token00) .
)00. /
;00/ 0
}11 	
}33 
}44 ≤$
õ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/AuthenticationServices/LoginAccountService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )"
AuthenticationServices) ?
{ 
public 

class 
LoginAccountService $
{ 
private 
readonly 
ILog 
log !
=" #

LogManager$ .
.. /
	GetLogger/ 8
(8 9
typeof9 ?
(? @
LoginAccountService@ S
)S T
)T U
;U V
private 
readonly 
IAccountRepository +

repository, 6
;6 7
private 
readonly 
IAccountValidator *
	validator+ 4
;4 5
private 
readonly 
ITokenFactory &
factory' .
;. /
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
LoginAccountService "
(" #
IAccountRepository# 5

repository6 @
,@ A
IAccountValidatorB S
	validatorT ]
,] ^
ITokenFactory_ l
factorym t
,t u
IGenericMapper	v Ñ
mapper
Ö ã
)
ã å
{ 	
this 
. 

repository 
= 

repository (
;( )
this 
. 
	validator 
= 
	validator &
;& '
this 
. 
factory 
= 
factory "
;" #
this 
. 
mapper 
= 
mapper  
;  !
} 	
public   
async   
Task   
<   
(   
ServiceResult   (
,  ( )
string  * 0
)  0 1
>  1 2
Execute  3 :
(  : ;
string  ; A
username  B J
,  J K
string  L R
password  S [
)  [ \
{!! 	

AccountDto"" 
?"" 

accountDTO"" "
=""# $
(""% &

AccountDto""& 0
?""0 1
)""1 2
await""2 7

repository""8 B
.""B C

GetAccount""C M
(""M N
username""N V
)""V W
;""W X
if$$ 
($$ 

accountDTO$$ 
is$$ 
null$$ "
)$$" #
{%% 
log&& 
.&& 
Warn&& 
(&& 
$"&& 
$str&& 5
{&&5 6
username&&6 >
}&&> ?
"&&? @
)&&@ A
;&&A B
return'' 
new'' 
('' 
ServiceResult'' (
.''( )
ACCOUNT_NOT_FOUND'') :
,'': ;
$str''< >
)''> ?
;''? @
}(( 
Account** 
account** 
=** 
mapper** $
.**$ %
Map**% (
<**( )

AccountDto**) 3
,**3 4
Account**5 <
>**< =
(**= >

accountDTO**> H
)**H I
;**I J
if,, 
(,, 
!,, 
	validator,, 
.,, 
VerifyPassword,, )
(,,) *
account,,* 1
,,,1 2
password,,3 ;
),,; <
),,< =
{-- 
log.. 
... 
Warn.. 
(.. 
$".. 
$str.. 7
{..7 8
account..8 ?
...? @
Username..@ H
}..H I
"..I J
)..J K
;..K L
return// 
new// 
(// 
ServiceResult// (
.//( )
WRONG_PASSWORD//) 7
,//7 8
$str//9 ;
)//; <
;//< =
}00 
var22 
token22 
=22 
factory22 
.22  
Create22  &
(22& '
account22' .
)22. /
;22/ 0
log33 
.33 
Info33 
(33 
$"33 
$str33 =
{33= >
account33> E
.33E F
Username33F N
}33N O
"33O P
)33P Q
;33Q R
return44 
new44 
(44 
ServiceResult44 $
.44$ %
OK44% '
,44' (
token44) .
)44. /
;44/ 0
}55 	
}66 
}77 ”!
ú/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/AccountServices/ResetAccountPasswordService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )
AccountServices) 8
{ 
public 

class '
ResetAccountPasswordService ,
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
(? @'
ResetAccountPasswordService@ [
)[ \
)\ ]
;] ^
private 
readonly 
Account  
account! (
;( )
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IAccountValidator *
accountValidator+ ;
;; <
public '
ResetAccountPasswordService *
(* +
Account+ 2
account3 :
,: ;
IAccountRepository< N
accountRepositoryO `
,` a
IAccountValidatorb s
accountValidator	t Ñ
,
Ñ Ö
IGenericMapper
Ü î
mapper
ï õ
)
õ ú
{ 	
this 
. 
account 
= 
account "
;" #
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
accountValidator !
=" #
accountValidator$ 4
;4 5
} 	
public 
async 
Task 
< 
ServiceResult '
>' (
Execute) 0
(0 1
string1 7
oldPassword8 C
,C D
stringE K
newParsswordL X
,X Y
stringZ `
confirmedPassworda r
)r s
{ 	
log 
. 
Info 
( 
$" 
$str :
{: ;
account; B
.B C
UsernameC K
}K L
"L M
)M N
;N O
if 
( 
newParssword 
!= 
confirmedPassword  1
)1 2
{ 
return   
ServiceResult   $
.  $ %
INVALID_OPERATION  % 6
;  6 7
}!! 
if"" 
("" 
newParssword"" 
=="" 
oldPassword""  +
)""+ ,
{## 
return$$ 
ServiceResult$$ $
.$$$ %
SAME_PASSWORD$$% 2
;$$2 3
}%% 
if&& 
(&& 
!&& 
accountValidator&& !
.&&! "
VerifyPassword&&" 0
(&&0 1
account&&1 8
,&&8 9
oldPassword&&: E
)&&E F
)&&F G
{'' 
return(( 
ServiceResult(( $
.(($ %
WRONG_PASSWORD((% 3
;((3 4
})) 
account++ 
.++ 
Password++ 
=++ 
BCrypt++ %
.++% &
Net++& )
.++) *
BCrypt++* 0
.++0 1
HashPassword++1 =
(++= >
newParssword++> J
)++J K
;++K L
switch-- 
(-- 
await-- 
accountRepository-- +
.--+ ,
UpdateAccount--, 9
(--9 :
account--: A
)--A B
)--B C
{.. 
case// 
DatabaseResult// #
.//# $
ACCOUNT_NOT_FOUND//$ 5
://5 6
return00 
ServiceResult00 (
.00( )
ACCOUNT_NOT_FOUND00) :
;00: ;
case11 
DatabaseResult11 #
.11# $
UNKNOWN_ERROR11$ 1
:111 2
return22 
ServiceResult22 (
.22( )
DATABASE_ERROR22) 7
;227 8
}33 
return55 
ServiceResult55  
.55  !
OK55! #
;55# $
}66 	
}77 
}88 ¬
í/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Services/AccountServices/GetAccountService.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Services  (
.( )
AccountServices) 8
{ 
public 

class 
GetAccountService "
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
(? @$
AddRoomPremissionService@ X
)X Y
)Y Z
;Z [
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
GetAccountService  
(  !
IAccountRepository! 3
accountRepository4 E
,E F
IGenericMapperG U
mapperV \
)\ ]
{ 	
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
mapper 
= 
mapper  
;  !
} 	
public 
async 
Task 
< 
( 
ServiceResult (
,( )
Account* 1
?1 2
)2 3
>3 4
Execute5 <
(< =
string= C
usernameD L
)L M
{ 	

AccountDto 
? 

accountDTO "
=# $
(% &

AccountDto& 0
?0 1
)1 2
await2 7
accountRepository8 I
.I J

GetAccountJ T
(T U
usernameU ]
)] ^
;^ _
if 
( 

accountDTO 
is 
null "
)" #
{ 
log 
. 
Warn 
( 
$" 
$str 1
{1 2
username2 :
.: ;
ToLower; B
(B C
)C D
}D E
$strE S
"S T
)T U
;U V
return 
new 
( 
ServiceResult (
.( )
ACCOUNT_NOT_FOUND) :
,: ;
null< @
)@ A
;A B
}   
Account"" 
account"" 
="" 
mapper"" $
.""$ %
Map""% (
<""( )

AccountDto"") 3
,""3 4
Account""5 <
>""< =
(""= >

accountDTO""> H
)""H I
;""I J
account$$ 
.$$ $
TemporaryRoomPermissions$$ ,
.$$, -
	RemoveAll$$- 6
($$6 7
temp$$7 ;
=>$$< >
temp$$? C
.$$C D
Until$$D I
<$$J K
DateTimeOffset$$L Z
.$$Z [
Now$$[ ^
.$$^ _
ToUnixTimeSeconds$$_ p
($$p q
)$$q r
)$$r s
;$$s t
_%% 
=%% 
accountRepository%% !
.%%! "
UpdateAccount%%" /
(%%/ 0
account%%0 7
)%%7 8
;%%8 9
return&& 
new&& 
(&& 
ServiceResult&& $
.&&$ %
OK&&% '
,&&' (
account&&) 0
)&&0 1
;&&1 2
}'' 	
}(( 
})) “!
}/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Mappers/GenericMapper.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
Mappers  '
{ 
public		 

class		 
GenericMapper		 
:		  
IGenericMapper		! /
{

 
private 
readonly 
IMapper  
mapper! '
;' (
public 
GenericMapper 
( 
) 
{ 	
var 
config 
= 
new 
MapperConfiguration 0
(0 1
cfg1 4
=>5 7
{ 
cfg 
. 
	CreateMap 
< 
Room "
," #
RoomDto$ +
>+ ,
(, -
)- .
;. /
cfg 
. 
	CreateMap 
< 
RoomDto %
,% &
Room' +
>+ ,
(, -
)- .
;. /
cfg 
. 
	CreateMap 
< 
Account %
,% &

AccountDto' 1
>1 2
(2 3
)3 4
;4 5
cfg 
. 
	CreateMap 
< 

AccountDto (
,( )
Account* 1
>1 2
(2 3
)3 4
;4 5
cfg 
. 
	CreateMap 
< 
EntranceRecord ,
,, -
EntranceRecordDto. ?
>? @
(@ A
)A B
;B C
cfg 
. 
	CreateMap 
< 
EntranceRecordDto /
,/ 0
EntranceRecord1 ?
>? @
(@ A
)A B
;B C
cfg 
. 
	CreateMap 
< 
Notification *
,* +
NotificationDto, ;
>; <
(< =
)= >
;> ?
cfg 
. 
	CreateMap 
< 
NotificationDto -
,- .
Notification/ ;
>; <
(< =
)= >
;> ?
cfg 
. 
	CreateMap 
< !
RequestRoomPermission 3
,3 4$
RequestRoomPermissionDto5 M
>M N
(N O
)O P
;P Q
cfg 
. 
	CreateMap 
< $
RequestRoomPermissionDto 6
,6 7!
RequestRoomPermission8 M
>M N
(N O
)O P
;P Q
cfg 
. 
	CreateMap 
< #
TemporaryRoomPermission 5
,5 6&
TemporaryRoomPermissionDto7 Q
>Q R
(R S
)S T
;T U
cfg 
. 
	CreateMap 
< &
TemporaryRoomPermissionDto 8
,8 9#
TemporaryRoomPermission: Q
>Q R
(R S
)S T
;T U
cfg 
. 
	CreateMap 
< 
RequestDecisions .
,. /
RequestDecisionsDto0 C
>C D
(D E
)E F
;F G
cfg 
. 
	CreateMap 
< 
RequestDecisionsDto 1
,1 2
RequestDecisions3 C
>C D
(D E
)E F
;F G
} 
) 
; 
mapper!! 
=!! 
config!! 
.!! 
CreateMapper!! (
(!!( )
)!!) *
;!!* +
}"" 	
public$$ 
TDestination$$ 
Map$$ 
<$$  
TSource$$  '
,$$' (
TDestination$$) 5
>$$5 6
($$6 7
TSource$$7 >
source$$? E
)$$E F
{%% 	
return&& 
mapper&& 
.&& 
Map&& 
<&& 
TSource&& %
,&&% &
TDestination&&' 3
>&&3 4
(&&4 5
source&&5 ;
)&&; <
;&&< =
}'' 	
}(( 
})) œ-
~/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Factories/TokenFactory.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
	Factories  )
{ 
public 

class 
TokenFactory 
: 
ITokenFactory  -
{ 
public 
string 
Create 
( 
Account $
account% ,
), -
{ 	
List 
< 
Claim 
> 
claims 
=  
new! $
List% )
<) *
Claim* /
>/ 0
{1 2
new 
Claim 
( 

ClaimTypes $
.$ %
Actor% *
,* +
$str, 5
)5 6
,6 7
new 
Claim 
( 

ClaimTypes $
.$ %
NameIdentifier% 3
,3 4
account5 <
.< =
Username= E
)E F
,F G
new 
Claim 
( 

ClaimTypes $
.$ %
Role% )
,) *
account+ 2
.2 3
Role3 7
.7 8
ToString8 @
(@ A
)A B
)B C
} 
; 
string 
	secretKey 
= 
Environment *
.* +"
GetEnvironmentVariable+ A
(A B
$strB R
)R S
!S T
;T U
string 
issuer 
= 
Environment '
.' ("
GetEnvironmentVariable( >
(> ?
$str? L
)L M
!M N
;N O
var 
key 
= 
new  
SymmetricSecurityKey .
(. /
Encoding/ 7
.7 8
UTF88 <
.< =
GetBytes= E
(E F
	secretKeyF O
)O P
)P Q
;Q R
var 
creds 
= 
new 
SigningCredentials .
(. /
key/ 2
,2 3
SecurityAlgorithms4 F
.F G
HmacSha256SignatureG Z
)Z [
;[ \
var 
token 
= 
new 
JwtSecurityToken ,
(, -
issuer 
: 
issuer "
," #
claims   
:   
claims   "
,  " #
expires!! 
:!! 
DateTime!! %
.!!% &
Now!!& )
.!!) *
AddDays!!* 1
(!!1 2
$num!!2 3
)!!3 4
,!!4 5
signingCredentials"" &
:""& '
creds""( -
)## 
;## 
var$$ 
jwtToken$$ 
=$$ 
new$$ #
JwtSecurityTokenHandler$$ 6
($$6 7
)$$7 8
.$$8 9

WriteToken$$9 C
($$C D
token$$D I
)$$I J
;$$J K
return&& 
jwtToken&& 
;&& 
}'' 	
public)) 
string)) 
Create)) 
()) 
Room)) !
room))" &
)))& '
{** 	
List++ 
<++ 
Claim++ 
>++ 
claims++ 
=++  
new++! $
List++% )
<++) *
Claim++* /
>++/ 0
{++1 2
new,, 
Claim,, 
(,, 

ClaimTypes,, $
.,,$ %
Actor,,% *
,,,* +
$str,,, 2
),,2 3
,,,3 4
new-- 
Claim-- 
(-- 

ClaimTypes-- $
.--$ %
NameIdentifier--% 3
,--3 4
room--5 9
.--9 :
Name--: >
)--> ?
,--? @
}.. 
;.. 
string00 
	secretKey00 
=00 
Environment00 *
.00* +"
GetEnvironmentVariable00+ A
(00A B
$str00B R
)00R S
!00S T
;00T U
string11 
issuer11 
=11 
Environment11 '
.11' ("
GetEnvironmentVariable11( >
(11> ?
$str11? L
)11L M
!11M N
;11N O
var33 
key33 
=33 
new33  
SymmetricSecurityKey33 .
(33. /
Encoding33/ 7
.337 8
UTF8338 <
.33< =
GetBytes33= E
(33E F
	secretKey33F O
)33O P
)33P Q
;33Q R
var55 
creds55 
=55 
new55 
SigningCredentials55 .
(55. /
key55/ 2
,552 3
SecurityAlgorithms554 F
.55F G
HmacSha256Signature55G Z
)55Z [
;55[ \
var77 
token77 
=77 
new77 
JwtSecurityToken77 ,
(77, -
issuer88 
:88 
issuer88 "
,88" #
claims99 
:99 
claims99 "
,99" #
expires:: 
::: 
DateTime:: %
.::% &
Now::& )
.::) *
AddDays::* 1
(::1 2
$num::2 3
)::3 4
,::4 5
signingCredentials;; &
:;;& '
creds;;( -
)<< 
;<< 
var== 
jwtToken== 
=== 
new== #
JwtSecurityTokenHandler== 6
(==6 7
)==7 8
.==8 9

WriteToken==9 C
(==C D
token==D I
)==I J
;==J K
return?? 
jwtToken?? 
;?? 
}@@ 	
}AA 
}BB ë
ê/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Factories/TemporaryRoomPermissionFactory.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
	Factories  )
;) *
public 
class *
TemporaryRoomPermissionFactory +
:, -+
ITemporaryRoomPermissionFactory. M
{ 
public 
#
TemporaryRoomPermission "
Create# )
() *
string* 0
roomName1 9
,9 :
long; ?
from@ D
,D E
longF J
untilK P
)P Q
{		 
return

 
new

 #
TemporaryRoomPermission

 *
{ 	
Room 
= 
roomName 
, 
From 
= 
from 
, 
Until 
= 
until 
} 	
;	 

} 
} ˘

}/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Factories/RoomFactory.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
	Factories  )
{ 
public 

class 
RoomFactory 
: 
IRoomFactory +
{ 
public		 
Room		 
Create		 
(		 
string		 !
name		" &
,		& '
string		( .
password		/ 7
,		7 8
long		9 =
	createdAt		> G
)		G H
{

 	
return 
new 
Room 
{ 
Id 
= 
Guid 
. 
NewGuid !
(! "
)" #
.# $
ToString$ ,
(, -
)- .
,. /
Name 
= 
name 
. 
ToLower #
(# $
)$ %
,% &
Password 
= 
BCrypt !
.! "
Net" %
.% &
BCrypt& ,
., -
HashPassword- 9
(9 :
password: B
)B C
,C D
	CreatedAt 
= 
	createdAt %
} 
; 
} 	
} 
} ¢

é/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Factories/RequestRoomPermissionFactory.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
	Factories  )
{ 
public 

class (
RequestRoomPermissionFactory -
:. /)
IRequestRoomPermissionFactory0 M
{ 
public		 !
RequestRoomPermission		 $
Create		% +
(		+ ,%
RequestRoomPermissionType		, E
type		F J
,		J K
string		L R
roomName		S [
,		[ \
string		] c
?		c d
requestMessage		e s
)		s t
{

 	
return 
new !
RequestRoomPermission ,
{ 
Id 
= 
Guid 
. 
NewGuid !
(! "
)" #
.# $
ToString$ ,
(, -
)- .
,. /
Type 
= 
type 
, 
RoomName 
= 
roomName #
,# $
RequestMessage 
=  
requestMessage! /
} 
; 
} 	
} 
} ˚
Ö/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Factories/NotificationFactory.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
	Factories  )
;) *
public 
class 
NotificationFactory  
:! " 
INotificationFactory# 7
{ 
public 

Notification 
Create 
( 
string %
from& *
,* +
string, 2
messageText3 >
)> ?
{		 
return

 
new

 
Notification

 
{ 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
.  
ToString  (
(( )
)) *
,* +
From 
= 
from 
, 
MessageText 
= 
messageText %
,% &
IsRead 
= 
false 
} 	
;	 

} 
} Ó
Ä/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Business/Factories/AccountFactory.cs
	namespace 	
VisualAccess
 
. 
Business 
.  
	Factories  )
{ 
public 

class 
AccountFactory 
:  !
IAccountFactory" 1
{		 
public

 
Account

 
Create

 
(

 
string

 $
	firstName

% .
,

. /
string

0 6
lastName

7 ?
,

? @
string

A G
username

H P
,

P Q
string

R X
email

Y ^
,

^ _
string

` f
password

g o
,

o p
string

q w
address

x 
,	

 Ä
string


Å á
phoneNumber


à ì
,


ì î
Role


ï ô
role


ö û
,


û ü
long


† §
	createdAt


• Æ
)


Æ Ø
{ 	
return 
new 
Account 
{ 
Id 
= 
Guid 
. 
NewGuid !
(! "
)" #
.# $
ToString$ ,
(, -
)- .
,. /
	FirstName 
= 
	firstName %
,% &
LastName 
= 
lastName #
,# $
Username 
= 
username #
.# $
ToLower$ +
(+ ,
), -
,- .
Email 
= 
email 
. 
ToLower %
(% &
)& '
,' (
Password 
= 
BCrypt !
.! "
Net" %
.% &
BCrypt& ,
., -
HashPassword- 9
(9 :
password: B
)B C
,C D
Address 
= 
address !
,! "
PhoneNumber 
= 
phoneNumber )
,) *
Role 
= 
role 
, 
	CreatedAt 
= 
	createdAt %
} 
; 
} 	
} 
} 