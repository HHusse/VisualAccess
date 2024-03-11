™
’/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/RoomModels/RoomAccessRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )

RoomModels) 3
{ 
public 

class "
RoomAccessRequestModel '
{ 
[ 	
Required	 
] 
public		 
	IFormFile		 
?		 
FaceImg		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} χ
°/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/RequestRoomPermissionModels/ValidRequestRoomPermissionAttribute.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )'
RequestRoomPermissionModels) D
{ 
public 

class /
#ValidRequestRoomPermissionAttribute 4
:5 6
ValidationAttribute7 J
{ 
	protected		 
override		 
ValidationResult		 +
?		+ ,
IsValid		- 4
(		4 5
object		5 ;
?		; <
value		= B
,		B C
ValidationContext		D U
validationContext		V g
)		g h
{

 	
if 
( 
value 
is 
string 
stringValue  +
&&, .
Enum/ 3
.3 4
TryParse4 <
<< =%
RequestRoomPermissionType= V
>V W
(W X
stringValueX c
,c d
oute h
_i j
)j k
)k l
{ 
return 
ValidationResult '
.' (
Success( /
;/ 0
} 
else 
{ 
return 
new 
ValidationResult +
(+ ,
$str, A
)A B
;B C
} 
} 	
} 
} ½
­/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/RequestRoomPermissionModels/DeniedRequestRoomPermissionModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )'
RequestRoomPermissionModels) D
;D E
public 
class ,
 DeniedRequestRoomPermissionModel -
{ 
[ 
Required 
] 
public 

string 
? 
	RequestId 
{ 
get "
;" #
set$ '
;' (
}) *
}		 ¦	
΄/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/RequestRoomPermissionModels/CreateRequestRoomPermissionRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )'
RequestRoomPermissionModels) D
{ 
public 

class 3
'CreateRequestRoomPermissionRequestModel 8
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
RoomName		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
[ 	
Required	 
] 
[ 	&
ValidRequestRoomPermission	 #
]# $
public 
string 
? 
Type 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
? 
Message 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ΰ
΄/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/RequestRoomPermissionModels/AcceptRequestRoomPermissionRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )'
RequestRoomPermissionModels) D
;D E
public 
class 3
'AcceptRequestRoomPermissionRequestModel 4
{ 
[ 
Required 
] 
public 

string 
? 
	RequestId 
{ 
get "
;" #
set$ '
;' (
}) *
public		 

int		 
Days		 
{		 
get		 
;		 
set		 
;		 
}		  !
}

 
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageRoomModels/RemoveRoomRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageRoomModels) 9
{ 
public 

class "
RemoveRoomRequestModel '
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Name		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} ‚
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageRoomModels/RegisterRoomRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageRoomModels) 9
{ 
public 

class $
RegisterRoomRequestModel )
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Name		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
[ 	
Required	 
] 
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} °
—/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageAccountModels/ValidRoleAttribute.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageAccountModels) <
{ 
public 

class 
ValidRoleAttribute #
:$ %
ValidationAttribute& 9
{ 
	protected		 
override		 
ValidationResult		 +
?		+ ,
IsValid		- 4
(		4 5
object		5 ;
?		; <
value		= B
,		B C
ValidationContext		D U
validationContext		V g
)		g h
{

 	
if 
( 
value 
is 
string 
stringValue  +
&&, .
Enum/ 3
.3 4
TryParse4 <
<< =
Role= A
>A B
(B C
stringValueC N
,N O
outP S
_T U
)U V
)V W
{ 
return 
ValidationResult '
.' (
Success( /
;/ 0
} 
else 
{ 
return 
new 
ValidationResult +
(+ ,
$str, A
)A B
;B C
} 
} 	
} 
} ΅
—/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageAccountModels/RemoveRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageAccountModels) <
{ 
public 

class 
RemoveRequestModel #
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Username		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
}

 
} ί
™/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageAccountModels/RegisterRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageAccountModels) <
{ 
public 

class '
RegisterAccountRequestModel ,
{ 
[		 	
Required			 
]		 
public

 
string

 
?

 
	FirstName

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
[ 	
Required	 
] 
public 
string 
? 
LastName 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
] 
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
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public 
string 
? 
Email 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
] 
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
Phone	 
] 
public 
string 
? 
PhoneNumber "
{# $
get% (
;( )
set* -
;- .
}/ 0
[   	
Required  	 
]   
[!! 	
	ValidRole!!	 
]!! 
public"" 
string"" 
?"" 
Role"" 
{"" 
get"" !
;""! "
set""# &
;""& '
}""( )
}## 
}$$ 
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageAccountModels/RegisterFaceRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageAccountModels) <
{ 
public 

class $
RegisterFaceRequestModel )
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Username		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
[ 	
Required	 
] 
public 
	IFormFile 
? 
FaceImg !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ©
›/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageAccountModels/GetAccountRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageAccountModels) <
{ 
public 

class "
GetAccountRequestModel '
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Username		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
}

 
} 
΅/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/ManageAccountModels/AddRoomPermisionRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
ManageAccountModels) <
{ 
public 

class 1
%AddOrRemoveRoomPermissionRequestModel 6
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Username		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
[

 	
Required

	 
]

 
public 
string 
? 
RoomName 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} „
›/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/AuthenticationModels/LoginRoomRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( ) 
AuthenticationModels) =
{ 
public 

class !
LoginRoomRequestModel &
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Name		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
[ 	
Required	 
] 
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} 
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/AuthenticationModels/LoginAccountRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( ) 
AuthenticationModels) =
{ 
public 

class $
LoginAccountRequestModel )
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
Username		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
[ 	
Required	 
] 
public 
string 
? 
Password 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} 
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/AccountModels/UpdateNotificationRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
; 
public 
class *
UpdateNotificationRequestModel +
{ 
[ 
Required 
] 
public 

string 
? 
Id 
{ 
get 
; 
set  
;  !
}" #
[

 
Required

 
]

 
public 

bool 
IsRead 
{ 
get 
; 
set !
;! "
}# $
} ½
΅/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/AccountModels/UpdateAllNotificationsRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
; 
public 
class .
"UpdateAllNotificationsRequestModel /
{ 
[ 
Required 
] 
public 

bool 
IsRead 
{ 
get 
; 
set !
;! "
}# $
}		 π
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/AccountModels/ResetPasswordRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
AccountModels) 6
{ 
public 

class %
ResetPasswordRequestModel *
{ 
[ 	
Required	 
] 
public		 
string		 
?		 
OldPassword		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
[ 	
Required	 
] 
public 
string 
? 
NewPassword "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
public 
string 
? 
ConfirmedPassword (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
} 
} –
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/RequestModels/AccountModels/RemoveNotificationRequestModel.cs
	namespace 	
VisualAccess
 
. 
API 
. 
RequestModels (
.( )
AccountModels) 6
;6 7
public 
class *
RemoveNotificationRequestModel +
{ 
[ 
Required 
] 
public 

string 
? 
Id 
{ 
get 
; 
set  
;  !
}" #
}		 ,
j/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Program.cs
XmlConfigurator 
. 
	Configure 
( 
new 
FileInfo &
(& '
$str' 7
)7 8
)8 9
;9 :
LogicalThreadContext		 
.		 

Properties		 
[		  
$str		  /
]		/ 0
=		1 2
Guid		3 7
.		7 8
NewGuid		8 ?
(		? @
)		@ A
.		A B
ToString		B J
(		J K
)		K L
;		L M
ILog

 
log

 
=

	 


LogManager

 
.

 
	GetLogger

 
(

  
$str

  %
)

% &
;

& '
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Logging 
. 
ClearProviders 
( 
)  
;  !
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
	AddConfig 
( 
) 
; 
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
using 
( 
var 

scope 
= 
app 
. 
Services 
.  
CreateScope  +
(+ ,
), -
)- .
{ 
var 
services 
= 
scope 
. 
ServiceProvider (
;( )
var 
dbContextPgSQL 
= 
services !
.! "
GetRequiredService" 4
<4 5&
VisualAccessDbContextPgSql5 O
>O P
(P Q
)Q R
;R S
dbContextPgSQL 
. 
Database 
. 
Migrate #
(# $
)$ %
;% &
var 
dbContextMongoDB 
= 
services #
.# $
GetRequiredService$ 6
<6 7(
VisualAccessDbContextMongoDB7 S
>S T
(T U
)U V
;V W
dbContextMongoDB 
. 
	Configure 
( 
)  
;  !
}   
app"" 
."" 
UseCors"" 
("" 
)"" 
;"" 
if$$ 
($$ 
app$$ 
.$$ 
Environment$$ 
.$$ 
IsDevelopment$$ !
($$! "
)$$" #
)$$# $
{%% 
app&& 
.&& 

UseSwagger&& 
(&& 
)&& 
;&& 
app'' 
.'' 
UseSwaggerUI'' 
('' 
)'' 
;'' 
}(( 
app** 
.** 
UseMiddleware** 
<** #
CorrelationIdMiddleware** )
>**) *
(*** +
)**+ ,
;**, -
app,, 
.,, 
UseMiddleware,, 
<,, "
StartRequestMiddleware,, (
>,,( )
(,,) *
),,* +
;,,+ ,
app.. 
... 
UseMiddleware.. 
<..  
ExtractionMiddleware.. &
>..& '
(..' (
)..( )
;..) *
app00 
.00 
UseMiddleware00 
<00  
EndRequestMiddleware00 &
>00& '
(00' (
)00( )
;00) *
app22 
.22 
UseHttpsRedirection22 
(22 
)22 
;22 
app44 
.44 
UseAuthorization44 
(44 
)44 
;44 
app66 
.66 
MapControllers66 
(66 
)66 
;66 
log88 
.88 
Info88 
(88 	
$str88	 
)88 
;88 
var:: 
cancellationToken:: 
=:: 
new:: #
CancellationTokenSource:: 3
(::3 4
)::4 5
;::5 6
Console<< 
.<< 
CancelKeyPress<< 
+=<< 
(<< 
sender<< !
,<<! "
e<<# $
)<<$ %
=><<& (
{== 
e>> 
.>> 
Cancel>> 
=>> 
true>> 
;>> 
cancellationToken?? 
.?? 
Cancel?? 
(?? 
)?? 
;?? 
log@@ 
.@@ 
Info@@ 
(@@ 
$str@@ $
)@@$ %
;@@% &
}AA 
;AA 
awaitCC 
appCC 	
.CC	 

RunAsyncCC
 
(CC 
cancellationTokenCC $
.CC$ %
TokenCC% *
)CC* +
;CC+ ,
cancellationTokenEE 
.EE 
DisposeEE 
(EE 
)EE 
;EE 
logFF 
.FF 
InfoFF 
(FF 	
$strFF	 
)FF 
;FF ¶
…/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Middlewares/StartRequestMiddleware.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Middlewares &
{ 
public 

class "
StartRequestMiddleware '
{ 
private 
readonly 
RequestDelegate (
next) -
;- .
private		 
readonly		 
ILog		 
log		 !
;		! "
public "
StartRequestMiddleware %
(% &
RequestDelegate& 5
next6 :
,: ;
ILog< @
logA D
)D E
{ 	
this 
. 
next 
= 
next 
; 
this 
. 
log 
= 
log 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
var 
forwardedFor 
= 
context &
.& '
Request' .
.. /
Headers/ 6
[6 7
$str7 H
]H I
.I J
FirstOrDefaultJ X
(X Y
)Y Z
;Z [
var 
	ipAddress 
= 
forwardedFor (
??) +
context, 3
.3 4

Connection4 >
.> ?
RemoteIpAddress? N
?N O
.O P
ToStringP X
(X Y
)Y Z
;Z [
log 
. 
Info 
( 
$" 
$str  
{  !
context! (
.( )
Request) 0
.0 1
Protocol1 9
}9 :
$str: ;
{; <
context< C
.C D
RequestD K
.K L
MethodL R
}R S
$strS T
{T U
contextU \
.\ ]
Request] d
.d e
Pathe i
}i j
$strj t
{t u
	ipAddressu ~
}~ 
"	 €
)
€ 
;
 ‚
await 
next 
( 
context 
) 
;  
} 	
} 
} F
ƒ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Middlewares/ExtractionMiddleware.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Middlewares &
{ 
public 

class  
ExtractionMiddleware %
{ 
private 
readonly 
RequestDelegate (
next) -
;- .
private 
readonly 
ILog 
log !
;! "
public  
ExtractionMiddleware #
(# $
RequestDelegate$ 3
next4 8
,8 9
ILog: >
log? B
)B C
{ 	
this 
. 
next 
= 
next 
; 
this 
. 
log 
= 
log 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
,4 5
IAccountRepository6 H
accountRepositoryI Z
,Z [
IRoomRepository\ k
roomRepositoryl z
,z {
IGenericMapper	| 
mapper
‹ ‘
)
‘ ’
{ 	
if 
( 
context 
. 
User 
. 
Identity %
is& (
null) -
||. 0
!1 2
context2 9
.9 :
User: >
.> ?
Identity? G
.G H
IsAuthenticatedH W
)W X
{ 
await 
next 
( 
context "
)" #
;# $
return 
; 
} 
await!! 
ProcessClaims!! 
(!!  
context!!  '
,!!' (
accountRepository!!) :
,!!: ;
roomRepository!!< J
,!!J K
mapper!!L R
)!!R S
;!!S T
await"" 
next"" 
("" 
context"" 
)"" 
;""  
}## 	
private%% 
async%% 
Task%% 
ProcessClaims%% (
(%%( )
HttpContext%%) 4
context%%5 <
,%%< =
IAccountRepository%%> P
accountRepository%%Q b
,%%b c
IRoomRepository%%d s
roomRepository	%%t ‚
,
%%‚ ƒ
IGenericMapper
%%„ ’
mapper
%%“ ™
)
%%™ 
{&& 	
var'' 
user'' 
='' 
context'' 
.'' 
User'' #
;''# $
var(( 
	claimType(( 
=(( 
user((  
.((  !
Claims((! '
.((' (
FirstOrDefault((( 6
(((6 7
c((7 8
=>((9 ;
c((< =
.((= >
Type((> B
==((C E

ClaimTypes((F P
.((P Q
Actor((Q V
)((V W
?((W X
.((X Y
Value((Y ^
;((^ _
switch** 
(** 
	claimType** 
)** 
{++ 
case,, 
$str,, 
:,, 
await-- 
HandleAccountClaim-- ,
(--, -
user--- 1
,--1 2
context--3 :
,--: ;
accountRepository--< M
,--M N
mapper--O U
)--U V
;--V W
break.. 
;.. 
case// 
$str// 
:// 
await00 
HandleRoomClaim00 )
(00) *
user00* .
,00. /
context000 7
,007 8
roomRepository009 G
,00G H
mapper00I O
)00O P
;00P Q
break11 
;11 
}22 
}33 	
private55 
async55 
Task55 
HandleAccountClaim55 -
(55- .
ClaimsPrincipal55. =
user55> B
,55B C
HttpContext55D O
context55P W
,55W X
IAccountRepository55Y k
accountRepository55l }
,55} ~
IGenericMapper	55 
mapper
55 ”
)
55” •
{66 	
var77 
usernameClaim77 
=77 
GetClaim77  (
(77( )
user77) -
,77- .

ClaimTypes77/ 9
.779 :
NameIdentifier77: H
)77H I
;77I J
if88 
(88 
usernameClaim88 
==88  
null88! %
)88% &
{99 
LogError:: 
(:: 
$str:: ;
)::; <
;::< =
return;; 
;;; 
}<< 
var>> 
serviceResponse>> 
=>>  !
await>>" '
new>>( +
GetAccountService>>, =
(>>= >
accountRepository>>> O
,>>O P
mapper>>Q W
)>>W X
.>>X Y
Execute>>Y `
(>>` a
usernameClaim>>a n
)>>n o
;>>o p
if?? 
(?? 
serviceResponse?? 
.??  
Item2??  %
is??& (
not??) ,
null??- 1
)??1 2
{@@ 
LogInfoAA 
(AA 
$"AA 
$strAA 6
{AA6 7
serviceResponseAA7 F
.AAF G
Item2AAG L
.AAL M
UsernameAAM U
}AAU V
"AAV W
)AAW X
;AAX Y
contextBB 
.BB 

SetAccountBB "
(BB" #
serviceResponseBB# 2
.BB2 3
Item2BB3 8
)BB8 9
;BB9 :
}CC 
elseDD 
{EE 
LogErrorFF 
(FF 
$"FF 
$strFF 1
{FF1 2
usernameClaimFF2 ?
}FF? @
$strFF@ R
"FFR S
)FFS T
;FFT U
}GG 
}HH 	
privateJJ 
asyncJJ 
TaskJJ 
HandleRoomClaimJJ *
(JJ* +
ClaimsPrincipalJJ+ :
userJJ; ?
,JJ? @
HttpContextJJA L
contextJJM T
,JJT U
IRoomRepositoryJJV e
roomRepositoryJJf t
,JJt u
IGenericMapper	JJv „
mapper
JJ… ‹
)
JJ‹ 
{KK 	
varLL 
roomNameClaimLL 
=LL 
GetClaimLL  (
(LL( )
userLL) -
,LL- .

ClaimTypesLL/ 9
.LL9 :
NameIdentifierLL: H
)LLH I
;LLI J
ifMM 
(MM 
roomNameClaimMM 
==MM  
nullMM! %
)MM% &
{NN 
LogErrorOO 
(OO 
$strOO ;
)OO; <
;OO< =
returnPP 
;PP 
}QQ 
varSS 
serviceResponseSS 
=SS  !
awaitSS" '
newSS( +
GetRoomServiceSS, :
(SS: ;
roomRepositorySS; I
,SSI J
mapperSSK Q
)SSQ R
.SSR S
ExecuteSSS Z
(SSZ [
roomNameClaimSS[ h
)SSh i
;SSi j
ifTT 
(TT 
serviceResponseTT 
.TT  
Item2TT  %
isTT& (
notTT) ,
nullTT- 1
)TT1 2
{UU 
LogInfoVV 
(VV 
$"VV 
$strVV 3
{VV3 4
serviceResponseVV4 C
.VVC D
Item2VVD I
.VVI J
NameVVJ N
}VVN O
"VVO P
)VVP Q
;VVQ R
contextWW 
.WW 
SetRoomWW 
(WW  
serviceResponseWW  /
.WW/ 0
Item2WW0 5
)WW5 6
;WW6 7
}XX 
elseYY 
{ZZ 
LogError[[ 
([[ 
$"[[ 
$str[[ *
{[[* +
roomNameClaim[[+ 8
}[[8 9
$str[[9 K
"[[K L
)[[L M
;[[M N
}\\ 
}]] 	
private__ 
static__ 
string__ 
?__ 
GetClaim__ '
(__' (
ClaimsPrincipal__( 7
user__8 <
,__< =
string__> D
	claimType__E N
)__N O
{`` 	
returnaa 
useraa 
.aa 
	FindFirstaa !
(aa! "
	claimTypeaa" +
)aa+ ,
?aa, -
.aa- .
Valueaa. 3
;aa3 4
}bb 	
privatedd 
voiddd 
LogInfodd 
(dd 
stringdd #
messagedd$ +
)dd+ ,
=>dd- /
logdd0 3
.dd3 4
Infodd4 8
(dd8 9
messagedd9 @
)dd@ A
;ddA B
privateff 
voidff 
LogErrorff 
(ff 
stringff $
messageff% ,
)ff, -
=>ff. 0
logff1 4
.ff4 5
Errorff5 :
(ff: ;
messageff; B
)ffB C
;ffC D
}gg 
}hh φ
ƒ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Middlewares/EndRequestMiddleware.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Middlewares &
{ 
public		 

class		  
EndRequestMiddleware		 %
{

 
private 
readonly 
RequestDelegate (
next) -
;- .
private 
readonly 
ILog 
log !
;! "
public  
EndRequestMiddleware #
(# $
RequestDelegate$ 3
next4 8
,8 9
ILog: >
log? B
)B C
{ 	
this 
. 
next 
= 
next 
; 
this 
. 
log 
= 
log 
; 
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
var 
	stopwatch 
= 
	Stopwatch %
.% &
StartNew& .
(. /
)/ 0
;0 1
try 
{ 
await 
next 
( 
context "
)" #
;# $
} 
catch 
( 
	Exception 
e 
) 
{ 
ExceptionLogger 
.  
Log  #
(# $
log$ '
,' (
e) *
)* +
;+ ,
context 
. 
Response  
.  !
Clear! &
(& '
)' (
;( )
var!! 
errorMessage!!  
=!!! "
new!!# &
{!!' (
message!!) 0
=!!1 2
$str!!3 U
}!!V W
;!!W X
var"" 
jsonErrorMessage"" $
=""% &
JsonSerializer""' 5
.""5 6
	Serialize""6 ?
(""? @
errorMessage""@ L
)""L M
;""M N
context## 
.## 
Response##  
.##  !
ContentType##! ,
=##- .
$str##/ A
;##A B
await$$ 
context$$ 
.$$ 
Response$$ &
.$$& '

WriteAsync$$' 1
($$1 2
jsonErrorMessage$$2 B
)$$B C
;$$C D
context%% 
.%% 
Response%%  
.%%  !

StatusCode%%! +
=%%, -
$num%%. 1
;%%1 2
}&& 
finally'' 
{(( 
	stopwatch)) 
.)) 
Stop)) 
()) 
)))  
;))  !
log** 
.** 
Info** 
(** 
$"** 
$str** 2
{**2 3
context**3 :
.**: ;
Response**; C
?**C D
.**D E

StatusCode**E O
}**O P
$str**P [
{**[ \
	stopwatch**\ e
.**e f
ElapsedMilliseconds**f y
}**y z
$str**z }
"**} ~
)**~ 
;	** €
}++ 
},, 	
}.. 
}// –
†/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Middlewares/CorrelationIdMiddleware.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Middlewares &
;& '
public 
class #
CorrelationIdMiddleware $
{		 
private

 
readonly

 
RequestDelegate

 $
_next

% *
;

* +
public 
#
CorrelationIdMiddleware "
(" #
RequestDelegate# 2
next3 7
)7 8
{ 
_next 
= 
next 
; 
} 
public 

async 
Task 
Invoke 
( 
HttpContext (
context) 0
)0 1
{ 
var 
correlationId 
= 
Guid  
.  !
NewGuid! (
(( )
)) *
.* +
ToString+ 3
(3 4
)4 5
;5 6 
LogicalThreadContext 
. 

Properties '
[' (
$str( 7
]7 8
=9 :
correlationId; H
;H I
context 
. 
Response 
. 

OnStarting #
(# $
($ %
)% &
=>' )
{ 	
context 
. 
Response 
. 
Headers $
.$ %
Add% (
(( )
$str) ;
,; <
correlationId= J
)J K
;K L
return 
Task 
. 
CompletedTask %
;% &
} 	
)	 

;
 
await 
_next 
( 
context 
) 
; 
} 
} α6
}/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/RoomController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
	Authorize 
( 
Policy 
= 
$str %
)% &
]& '
public 

class 
RoomController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ILog 
log !
;! "
private 
readonly %
IEntranceRecordRepository 2$
entranceRecordRepository3 K
;K L
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly )
IFaceRecognitionServiceClient 6!
faceRecognitionClient7 L
;L M
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
RoomController 
( 
ILog "
log# &
,& '%
IEntranceRecordRepository( A$
entranceRecordRepositoryB Z
,Z [
IAccountRepository\ n
accountRepository	o €
,
€ +
IFaceRecognitionServiceClient
‚ #
faceRecognitionClient
  µ
,
µ ¶
IGenericMapper
· Ε
mapper
Ζ Μ
)
Μ Ν
{   	
this!! 
.!! 
log!! 
=!! 
log!! 
;!! 
this"" 
."" $
entranceRecordRepository"" )
=""* +$
entranceRecordRepository"", D
;""D E
this## 
.## 
accountRepository## "
=### $
accountRepository##% 6
;##6 7
this$$ 
.$$ !
faceRecognitionClient$$ &
=$$' (!
faceRecognitionClient$$) >
;$$> ?
this%% 
.%% 
mapper%% 
=%% 
mapper%%  
;%%  !
}&& 	
[(( 	
HttpPost((	 
((( 
$str(( 
)(( 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
Access))) /
())/ 0
[))0 1
FromForm))1 9
]))9 :"
RoomAccessRequestModel)); Q
requestModel))R ^
)))^ _
{** 	
if++ 
(++ 
!++ 

ModelState++ 
.++ 
IsValid++ #
)++# $
{,, 
log-- 
.-- 
Error-- 
(-- 
$"-- 
$str-- .
"--. /
)--/ 0
;--0 1
return.. 

BadRequest.. !
(..! "

ModelState.." ,
).., -
;..- .
}// 
Room11 
?11 
room11 
=11 
HttpContext11 $
.11$ %
GetRoom11% ,
(11, -
)11- .
;11. /
if22 
(22 
room22 
is22 
null22 
)22 
{33 
log44 
.44 
Error44 
(44 
$str44 ?
)44? @
;44@ A
return55 

StatusCode55 !
(55! "
$num55" %
,55% &
new55' *
{55+ ,
message55- 4
=555 6
$str557 F
}55G H
)55H I
;55I J
}66 
var88 

faceStream88 
=88 
new88  
MemoryStream88! -
(88- .
)88. /
;88/ 0
await99 
requestModel99 
.99 
FaceImg99 &
!99& '
.99' (
CopyToAsync99( 3
(993 4

faceStream994 >
)99> ?
;99? @

faceStream:: 
.:: 
Position:: 
=::  !
$num::" #
;::# $
VerifyFaceService<< 
service<< %
=<<& '
new<<( +
(<<+ ,
room<<, 0
,<<0 1
accountRepository<<2 C
,<<C D!
faceRecognitionClient<<E Z
,<<Z [$
entranceRecordRepository<<\ t
,<<t u
mapper<<v |
)<<| }
;<<} ~
ServiceResult== 
result==  
===! "
await==# (
service==) 0
.==0 1
Execute==1 8
(==8 9

faceStream==9 C
)==C D
;==D E
switch?? 
(?? 
result?? 
)?? 
{@@ 
caseAA 
ServiceResultAA "
.AA" #
ROOM_NOT_FOUNDAA# 1
:AA1 2
returnBB 

StatusCodeBB %
(BB% &
$numBB& )
,BB) *
newBB+ .
{BB/ 0
messageBB1 8
=BB9 :
$strBB; ^
}BB_ `
)BB` a
;BBa b
caseCC 
ServiceResultCC "
.CC" #
ACCOUNT_NOT_FOUNDCC# 4
:CC4 5
returnDD 

StatusCodeDD %
(DD% &
$numDD& )
,DD) *
newDD+ .
{DD/ 0
messageDD1 8
=DD9 :
$strDD; ]
}DD^ _
)DD_ `
;DD` a
caseEE 
ServiceResultEE "
.EE" #
FACE_NOT_FOUNDEE# 1
:EE1 2
returnFF 

StatusCodeFF %
(FF% &
$numFF& )
,FF) *
newFF+ .
{FF/ 0
messageFF1 8
=FF9 :
$strFF; [
}FF\ ]
)FF] ^
;FF^ _
caseGG 
ServiceResultGG "
.GG" #
FACE_NOT_REGISTERDGG# 5
:GG5 6
returnHH 

StatusCodeHH %
(HH% &
$numHH& )
,HH) *
newHH+ .
{HH/ 0
messageHH1 8
=HH9 :
$strHH; O
}HHP Q
)HHQ R
;HHR S
caseII 
ServiceResultII "
.II" #%
ACCOUNT_HAS_NO_PERMISSIONII# <
:II< =
returnJJ 

StatusCodeJJ %
(JJ% &
$numJJ& )
,JJ) *
newJJ+ .
{JJ/ 0
messageJJ1 8
=JJ9 :
$strJJ; c
}JJd e
)JJe f
;JJf g
caseKK 
ServiceResultKK "
.KK" #
UNKNOWN_ERRORKK# 0
:KK0 1
returnLL 

StatusCodeLL %
(LL% &
$numLL& )
,LL) *
newLL+ .
{LL/ 0
messageLL1 8
=LL9 :
$strLL; Q
}LLR S
)LLS T
;LLT U
}MM 
returnNN 

StatusCodeNN 
(NN 
$numNN !
,NN! "
newNN# &
{NN' (
}NN) *
)NN* +
;NN+ ,
}OO 	
}PP 
}QQ –
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/RequestRoomPermissionController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str +
)+ ,
], -
[ 
	Authorize 
( 
Policy 
= 
$str (
)( )
]) *
public 

class +
RequestRoomPermissionController 0
:1 2
ControllerBase3 A
{ 
private 
readonly 
ILog 
log !
;! "
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly ,
 IRequestRoomPermissionRepository 9+
requestRoomPermissionRepository: Y
;Y Z
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly )
IRequestRoomPermissionFactory 6
factory7 >
;> ?
private 
readonly +
ITemporaryRoomPermissionFactory 8*
temporaryRoomPermissionFactory9 W
;W X
private   
readonly    
INotificationFactory   -
notificationFactory  . A
;  A B
private!! 
readonly!! '
IRequestDecisionsRepository!! 4&
requestDecisionsRepository!!5 O
;!!O P
private"" 
readonly"" 
IGenericMapper"" '
mapper""( .
;"". /
public$$ +
RequestRoomPermissionController$$ .
($$. /
ILog$$/ 3
log$$4 7
,$$7 8
IAccountRepository$$9 K
accountRepository$$L ]
,$$] ^,
 IRequestRoomPermissionRepository$$_ -
requestRoomPermissionRepository
$$€ 
,
$$  
IRoomRepository
$$΅ °
roomRepository
$$± Ώ
,
$$Ώ ΐ+
IRequestRoomPermissionFactory
$$Α ή
factory
$$ί ζ
,
$$ζ η-
ITemporaryRoomPermissionFactory
$$θ ‡,
temporaryRoomPermissionFactory
$$ ¦
,
$$¦ §"
INotificationFactory
$$¨ Ό!
notificationFactory
$$½ Π
,
$$Π Ρ)
IRequestDecisionsRepository
$$Ò ν(
requestDecisionsRepository
$$ξ 
,
$$ ‰
IGenericMapper
$$ 
mapper
$$™ 
)
$$  
{%% 	
this&& 
.&& 
log&& 
=&& 
log&& 
;&& 
this'' 
.'' 
accountRepository'' "
=''# $
accountRepository''% 6
;''6 7
this(( 
.(( +
requestRoomPermissionRepository(( 0
=((1 2+
requestRoomPermissionRepository((3 R
;((R S
this)) 
.)) 
roomRepository)) 
=))  !
roomRepository))" 0
;))0 1
this** 
.** 
factory** 
=** 
factory** "
;**" #
this++ 
.++ *
temporaryRoomPermissionFactory++ /
=++0 1*
temporaryRoomPermissionFactory++2 P
;++P Q
this,, 
.,, 
notificationFactory,, $
=,,% &
notificationFactory,,' :
;,,: ;
this-- 
.-- &
requestDecisionsRepository-- +
=--, -&
requestDecisionsRepository--. H
;--H I
this.. 
... 
mapper.. 
=.. 
mapper..  
;..  !
}// 	
[11 	
HttpPost11	 
(11 
$str11 
)11 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' ('
CreateRequestRoomPermission22) D
(22D E
[22E F
FromBody22F N
]22N O3
'CreateRequestRoomPermissionRequestModel22P w
request22x 
)	22 €
{33 	
if44 
(44 
!44 

ModelState44 
.44 
IsValid44 #
)44# $
{55 
log66 
.66 
Error66 
(66 
$"66 
$str66 .
"66. /
)66/ 0
;660 1
return77 

BadRequest77 !
(77! "

ModelState77" ,
)77, -
;77- .
}88 
Account:: 
?:: 
account:: 
=:: 
HttpContext:: *
.::* +

GetAccount::+ 5
(::5 6
)::6 7
;::7 8
if;; 
(;; 
account;; 
is;; 
null;; 
);;  
{<< 
log== 
.== 
Error== 
(== 
$str== B
)==B C
;==C D
return>> 

StatusCode>> !
(>>! "
$num>>" %
,>>% &
new>>' *
{>>+ ,
message>>- 4
=>>5 6
$str>>7 F
}>>G H
)>>H I
;>>I J
}?? 
if@@ 
(@@ 
!@@ 
Enum@@ 
.@@ 
TryParse@@ 
<@@ %
RequestRoomPermissionType@@ 8
>@@8 9
(@@9 :
request@@: A
.@@A B
Type@@B F
,@@F G
out@@H K
var@@L O
type@@P T
)@@T U
)@@U V
{AA 
returnBB 

StatusCodeBB !
(BB! "
$numBB" %
,BB% &
newBB' *
{BB+ ,
messageBB- 4
=BB5 6
$strBB7 K
}BBL M
)BBM N
;BBN O
}CC !
RequestRoomPermissionEE !!
requestRoomPermissionEE" 7
=EE8 9
factoryEE: A
.EEA B
CreateEEB H
(EEH I
typeEEI M
,EEM N
requestEEO V
.EEV W
RoomNameEEW _
!EE_ `
,EE` a
requestEEb i
.EEi j
MessageEEj q
)EEq r
;EEr s.
"CreateRequestRoomPermissionServiceFF .
serviceFF/ 6
=FF7 8
newFF9 <
(FF< =
roomRepositoryFF= K
,FFK L+
requestRoomPermissionRepositoryFFM l
,FFl m
mapperFFn t
)FFt u
;FFu v
varGG 
responseGG 
=GG 
awaitGG  
serviceGG! (
.GG( )
ExecuteGG) 0
(GG0 1!
requestRoomPermissionGG1 F
,GGF G
accountGGH O
)GGO P
;GGP Q
switchII 
(II 
responseII 
)II 
{JJ 
caseKK 
ServiceResultKK "
.KK" #!
REQUEST_ALREADY_EXISTKK# 8
:KK8 9
returnLL 

StatusCodeLL %
(LL% &
$numLL& )
,LL) *
newLL+ .
{LL/ 0
messageLL1 8
=LL9 :
$strLL; b
}LLc d
)LLd e
;LLe f
caseMM 
ServiceResultMM "
.MM" #
ROOM_NOT_FOUNDMM# 1
:MM1 2
returnNN 

StatusCodeNN %
(NN% &
$numNN& )
,NN) *
newNN+ .
{NN/ 0
messageNN1 8
=NN9 :
$strNN; b
}NNc d
)NNd e
;NNe f
caseOO 
ServiceResultOO "
.OO" #)
ROOM_PERMISSION_ALREADY_EXISTOO# @
:OO@ A
returnPP 

StatusCodePP %
(PP% &
$numPP& )
,PP) *
newPP+ .
{PP/ 0
messagePP1 8
=PP9 :
$strPP; Y
}PPZ [
)PP[ \
;PP\ ]
caseQQ 
ServiceResultQQ "
.QQ" #
DATABASE_ERRORQQ# 1
:QQ1 2
returnRR 

StatusCodeRR %
(RR% &
$numRR& )
,RR) *
newRR+ .
{RR/ 0
messageRR1 8
=RR9 :
$strRR; P
}RRQ R
)RRR S
;RRS T
}SS 
returnUU 

StatusCodeUU 
(UU 
$numUU !
,UU! "
newUU# &
{UU' (
}UU) *
)UU* +
;UU+ ,
}VV 	
[XX 	
HttpGetXX	 
(XX 
$strXX :
)XX: ;
]XX; <
[YY 	
	AuthorizeYY	 
(YY 
RolesYY 
=YY 
$strYY %
)YY% &
]YY& '
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
GetRequestsZZ) 4
(ZZ4 5
[ZZ5 6
	FromRouteZZ6 ?
]ZZ? @
intZZA D
pageZZE I
)ZZI J
{[[ 	2
&GetRequestRoomPermissionsByPageService\\ 2
service\\3 :
=\\; <
new\\= @
(\\@ A+
requestRoomPermissionRepository\\A `
,\\` a
mapper\\b h
)\\h i
;\\i j
var]] 
result]] 
=]] 
await]] 
service]] &
.]]& '
Execute]]' .
(]]. /
page]]/ 3
)]]3 4
;]]4 5
switch__ 
(__ 
result__ 
.__ 
Item1__  
)__  !
{`` 
caseaa 
ServiceResultaa "
.aa" #
	NOT_FOUNDaa# ,
:aa, -
returnbb 

StatusCodebb %
(bb% &
$numbb& )
,bb) *
newbb+ .
{bb/ 0
messagebb1 8
=bb9 :
$strbb; e
}bbf g
)bbg h
;bbh i
}cc 
varee 
requestsee 
=ee 
resultee !
.ee! "
Item2ee" '
!ee' (
.ee( )
Selectee) /
(ee/ 0
requestee0 7
=>ee8 :
newee; >
{ff 
requestgg 
.gg 
Idgg 
,gg 
typehh 
=hh 
requesthh 
.hh 
Typehh #
.hh# $
ToStringhh$ ,
(hh, -
)hh- .
,hh. /
requestii 
.ii 
Usernameii  
,ii  !
requestjj 
.jj 
RoomNamejj  
,jj  !
requestkk 
.kk 
RequestMessagekk &
}ll 
)ll 
;ll 
varnn 
responsenn 
=nn 
newnn 
{oo 
maxPagespp 
=pp 
resultpp !
.pp! "
Item3pp" '
,pp' (
requestsqq 
}rr 
;rr 
returnss 

StatusCodess 
(ss 
$numss !
,ss! "
responsess# +
)ss+ ,
;ss, -
}tt 	
[vv 	
HttpPostvv	 
]vv 
[ww 	
	Authorizeww	 
(ww 
Rolesww 
=ww 
$strww %
)ww% &
]ww& '
publicxx 
asyncxx 
Taskxx 
<xx 
IActionResultxx '
>xx' (
AcceptRequestxx) 6
(xx6 7
[xx7 8
FromBodyxx8 @
]xx@ A3
'AcceptRequestRoomPermissionRequestModelxxB i
requestModelxxj v
)xxv w
{yy 	
ifzz 
(zz 
!zz 

ModelStatezz 
.zz 
IsValidzz #
)zz# $
{{{ 
log|| 
.|| 
Error|| 
(|| 
$"|| 
$str|| .
"||. /
)||/ 0
;||0 1
return}} 

BadRequest}} !
(}}! "

ModelState}}" ,
)}}, -
;}}- .
}~~ 
Account
€€ 
?
€€ 
account
€€ 
=
€€ 
HttpContext
€€ *
.
€€* +

GetAccount
€€+ 5
(
€€5 6
)
€€6 7
;
€€7 8
if
 
(
 
account
 
is
 
null
 
)
  
{
‚‚ 
log
ƒƒ 
.
ƒƒ 
Error
ƒƒ 
(
ƒƒ 
$str
ƒƒ B
)
ƒƒB C
;
ƒƒC D
return
„„ 

StatusCode
„„ !
(
„„! "
$num
„„" %
,
„„% &
new
„„' *
{
„„+ ,
message
„„- 4
=
„„5 6
$str
„„7 F
}
„„G H
)
„„H I
;
„„I J
}
…… 0
"AcceptRequestRoomPermissionService
‡‡ .
service
‡‡/ 6
=
‡‡7 8
new
‡‡9 <
(
‡‡< =
accountRepository
‡‡= N
,
‡‡N O-
requestRoomPermissionRepository
‡‡P o
,
‡‡o p-
temporaryRoomPermissionFactory‡‡q 
,‡‡ #
notificationFactory‡‡‘ ¤
,‡‡¤ ¥*
requestDecisionsRepository‡‡¦ ΐ
,‡‡ΐ Α
mapper‡‡Β Θ
)‡‡Θ Ι
;‡‡Ι Κ
ServiceResult
 
response
 "
=
# $
await
% *
service
+ 2
.
2 3
Execute
3 :
(
: ;
account
; B
,
B C
requestModel
D P
.
P Q
	RequestId
Q Z
!
Z [
,
[ \
requestModel
] i
.
i j
Days
j n
)
n o
;
o p
switch
‰‰ 
(
‰‰ 
response
‰‰ 
)
‰‰ 
{
 
case
‹‹ 
ServiceResult
‹‹ "
.
‹‹" #
REQUEST_NOT_FOUND
‹‹# 4
:
‹‹4 5
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; ^
}
_ `
)
` a
;
a b
case
 
ServiceResult
 "
.
" #
ACCOUNT_NOT_FOUND
# 4
:
4 5
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; y
}
z {
)
{ |
;
| }
case
 
ServiceResult
 "
.
" #
INVALID_OPERATION
# 4
:
4 5
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str; ΅
}Ά £
)£ ¤
;¤ ¥
case
‘‘ 
ServiceResult
‘‘ "
.
‘‘" #
DATABASE_ERROR
‘‘# 1
:
‘‘1 2
case
’’ 
ServiceResult
’’ "
.
’’" #
UNKNOWN_ERROR
’’# 0
:
’’0 1
return
““ 

StatusCode
““ %
(
““% &
$num
““& )
,
““) *
new
““+ .
{
““/ 0
message
““1 8
=
““9 :
$str
““; P
}
““Q R
)
““R S
;
““S T
}
”” 
return
–– 

StatusCode
–– 
(
–– 
$num
–– !
,
––! "
new
––# &
{
––' (
}
––) *
)
––* +
;
––+ ,
}
—— 	
[
™™ 	

HttpDelete
™™	 
]
™™ 
[
 	
	Authorize
	 
(
 
Roles
 
=
 
$str
 %
)
% &
]
& '
public
›› 
async
›› 
Task
›› 
<
›› 
IActionResult
›› '
>
››' (
DeniedRequest
››) 6
(
››6 7
[
››7 8
FromBody
››8 @
]
››@ A.
 DeniedRequestRoomPermissionModel
››B b
requestModel
››c o
)
››o p
{
 	
if
 
(
 
!
 

ModelState
 
.
 
IsValid
 #
)
# $
{
 
log
 
.
 
Error
 
(
 
$"
 
$str
 .
"
. /
)
/ 0
;
0 1
return
   

BadRequest
   !
(
  ! "

ModelState
  " ,
)
  , -
;
  - .
}
΅΅ 
Account
££ 
?
££ 
account
££ 
=
££ 
HttpContext
££ *
.
££* +

GetAccount
££+ 5
(
££5 6
)
££6 7
;
££7 8
if
¤¤ 
(
¤¤ 
account
¤¤ 
is
¤¤ 
null
¤¤ 
)
¤¤  
{
¥¥ 
log
¦¦ 
.
¦¦ 
Error
¦¦ 
(
¦¦ 
$str
¦¦ B
)
¦¦B C
;
¦¦C D
return
§§ 

StatusCode
§§ !
(
§§! "
$num
§§" %
,
§§% &
new
§§' *
{
§§+ ,
message
§§- 4
=
§§5 6
$str
§§7 F
}
§§G H
)
§§H I
;
§§I J
}
¨¨ 0
"RemoveRequestRoomPermissionService
ªª .
service
ªª/ 6
=
ªª7 8
new
ªª9 <
(
ªª< =
accountRepository
ªª= N
,
ªªN O-
requestRoomPermissionRepository
ªªP o
,
ªªo p"
notificationFactoryªªq „
,ªª„ …*
requestDecisionsRepositoryªª†  
,ªª  ΅
mapperªªΆ ¨
)ªª¨ ©
;ªª© ª
ServiceResult
«« 
response
«« "
=
««# $
await
««% *
service
««+ 2
.
««2 3
Execute
««3 :
(
««: ;
account
««; B
,
««B C
requestModel
««D P
.
««P Q
	RequestId
««Q Z
!
««Z [
)
««[ \
;
««\ ]
switch
¬¬ 
(
¬¬ 
response
¬¬ 
)
¬¬ 
{
­­ 
case
®® 
ServiceResult
®® "
.
®®" #
REQUEST_NOT_FOUND
®®# 4
:
®®4 5
return
―― 

StatusCode
―― %
(
――% &
$num
――& )
,
――) *
new
――+ .
{
――/ 0
message
――1 8
=
――9 :
$str
――; f
}
――g h
)
――h i
;
――i j
case
°° 
ServiceResult
°° "
.
°°" #
ACCOUNT_NOT_FOUND
°°# 4
:
°°4 5
return
±± 

StatusCode
±± %
(
±±% &
$num
±±& )
,
±±) *
new
±±+ .
{
±±/ 0
message
±±1 8
=
±±9 :
$str±±; 
}±±‚ ƒ
)±±ƒ „
;±±„ …
case
²² 
ServiceResult
²² "
.
²²" #
DATABASE_ERROR
²²# 1
:
²²1 2
return
³³ 

StatusCode
³³ %
(
³³% &
$num
³³& )
,
³³) *
new
³³+ .
{
³³/ 0
message
³³1 8
=
³³9 :
$str
³³; P
}
³³Q R
)
³³R S
;
³³S T
}
΄΄ 
return
¶¶ 

StatusCode
¶¶ 
(
¶¶ 
$num
¶¶ !
,
¶¶! "
new
¶¶# &
{
¶¶' (
}
¶¶) *
)
¶¶* +
;
¶¶+ ,
}
·· 	
}
ΈΈ 
}ΉΉ 
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/RequestDecisionsControllers.cs
	namespace		 	
VisualAccess		
 
.		 
API		 
.		 
Controllers		 &
;		& '
[ 
Route 
( 
$str  
)  !
]! "
[ 
	Authorize 

(
 
Policy 
= 
$str $
)$ %
]% &
public 
class '
RequestDecisionsControllers (
:) *
ControllerBase+ 9
{ 
private 
readonly '
IRequestDecisionsRepository 0&
requestDecisionsRepository1 K
;K L
private 
readonly 
IGenericMapper #
mapper$ *
;* +
public 
'
RequestDecisionsControllers &
(& ''
IRequestDecisionsRepository' B&
requestDecisionsRepositoryC ]
,] ^
IGenericMapper_ m
mappern t
)t u
{ 
this 
. &
requestDecisionsRepository '
=( )&
requestDecisionsRepository* D
;D E
this 
. 
mapper 
= 
mapper 
; 
} 
[ 
HttpGet 
( 
$str /
)/ 0
]0 1
[ 
	Authorize 
( 
Roles 
= 
$str 
) 
]  
public 

async 
Task 
< 
IActionResult #
># $%
GetRequestDecisionsByPage% >
(> ?
[? @
	FromRoute@ I
]I J
intK N
pageO S
)S T
{ 
var 
service 
= 
new ,
 GetRequestDecisionsByPageService :
(: ;&
requestDecisionsRepository; U
,U V
mapperW ]
)] ^
;^ _
var 
( 
result 
, 
requests 
, 
maxPages '
)' (
=) *
await+ 0
service1 8
.8 9
Execute9 @
(@ A
pageA E
)E F
;F G
switch 
( 
result 
) 
{   	
case!! 
ServiceResult!! 
.!! 
	NOT_FOUND!! (
:!!( )
return"" 

StatusCode"" !
(""! "
$num""" %
,""% &
new""' *
{""+ ,
message""- 4
=""5 6
$str""7 a
}""b c
)""c d
;""d e
}## 	
var%% 
requestsResponse%% 
=%% 
requests%% '
!%%' (
.%%( )
Select%%) /
(%%/ 0
req%%0 3
=>%%4 6
new%%7 :
{&& 	
req'' 
.'' 
approver'' 
,'' 
req(( 
.(( 
username(( 
,(( 
req)) 
.)) 
room)) 
,)) 
type** 
=** 
req** 
.** 
type** 
.** 
ToString** $
(**$ %
)**% &
,**& '
req++ 
.++ 

isApproved++ 
},, 	
),,	 

;,,
 
return.. 

StatusCode.. 
(.. 
$num.. 
,.. 
new.. "
{..# $
maxPages..% -
,..- .
requests../ 7
=..8 9
requestsResponse..: J
}..K L
)..L M
;..M N
}// 
}00 “H
ƒ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/ManageRoomController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str 
)  
]  !
[ 
	Authorize 
( 
Policy 
= 
$str (
)( )
]) *
public 

class  
ManageRoomController %
:& '
ControllerBase( 6
{ 
private 
readonly 
ILog 
log !
;! "
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IRoomFactory %
roomFactory& 1
;1 2
private 
readonly 
IGenericMapper '
mapper( .
;. /
public  
ManageRoomController #
(# $
ILog$ (
log) ,
,, -
IRoomRepository. =
roomRepository> L
,L M
IAccountRepositoryN `
accountRepositorya r
,r s
IRoomFactory	t €
roomFactory
 
,
 
IGenericMapper
 
mapper
 £
)
£ ¤
{ 	
this 
. 
log 
= 
log 
; 
this 
. 
roomRepository 
=  !
roomRepository" 0
;0 1
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
roomFactory 
= 
roomFactory *
;* +
this   
.   
mapper   
=   
mapper    
;    !
}!! 	
[## 	
HttpPost##	 
(## 
$str## 
)## 
]## 
[$$ 	
	Authorize$$	 
($$ 
Roles$$ 
=$$ 
$str$$ "
)$$" #
]$$# $
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Register%%) 1
(%%1 2
[%%2 3
FromBody%%3 ;
]%%; <$
RegisterRoomRequestModel%%= U
requestModel%%V b
)%%b c
{&& 	
if'' 
('' 
!'' 

ModelState'' 
.'' 
IsValid'' #
)''# $
{(( 
log)) 
.)) 
Error)) 
()) 
$")) 
$str)) .
")). /
)))/ 0
;))0 1
return** 

BadRequest** !
(**! "

ModelState**" ,
)**, -
;**- .
}++ 
Room,, 
newRoom,, 
=,, 
roomFactory,, &
.,,& '
Create,,' -
(,,- .
requestModel,,. :
.,,: ;
Name,,; ?
!,,? @
,,,@ A
requestModel,,B N
.,,N O
Password,,O W
!,,W X
,,,X Y
DateTimeOffset,,Z h
.,,h i
Now,,i l
.,,l m
ToUnixTimeSeconds,,m ~
(,,~ 
)	,, €
)
,,€ 
;
,, ‚
RegisterRoomService-- 
service--  '
=--( )
new--* -
(--- .
roomRepository--. <
)--< =
;--= >
ServiceResult.. 
result..  
=..! "
await..# (
service..) 0
...0 1
Execute..1 8
(..8 9
newRoom..9 @
)..@ A
;..A B
switch00 
(00 
result00 
)00 
{11 
case22 
ServiceResult22 "
.22" #
ROOM_ALREADY_EXIST22# 5
:225 6
return33 

StatusCode33 %
(33% &
$num33& )
,33) *
new33+ .
{33/ 0
message331 8
=339 :
$str33; b
}33c d
)33d e
;33e f
case44 
ServiceResult44 "
.44" #
DATABASE_ERROR44# 1
:441 2
return55 

StatusCode55 %
(55% &
$num55& )
,55) *
new55+ .
{55/ 0
message551 8
=559 :
$str55; Q
}55R S
)55S T
;55T U
}66 
return77 

StatusCode77 
(77 
$num77 !
,77! "
new77# &
{77' (
}77) *
)77* +
;77+ ,
}88 	
[:: 	

HttpDelete::	 
]:: 
[;; 	
	Authorize;;	 
(;; 
Roles;; 
=;; 
$str;; "
);;" #
];;# $
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
Remove<<) /
(<</ 0
[<<0 1
FromBody<<1 9
]<<9 :"
RemoveRoomRequestModel<<; Q
requestModel<<R ^
)<<^ _
{== 	
if>> 
(>> 
!>> 

ModelState>> 
.>> 
IsValid>> #
)>># $
{?? 
log@@ 
.@@ 
Error@@ 
(@@ 
$"@@ 
$str@@ .
"@@. /
)@@/ 0
;@@0 1
returnAA 

BadRequestAA !
(AA! "

ModelStateAA" ,
)AA, -
;AA- .
}BB 
RemoveRoomServiceDD 
serviceDD %
=DD& '
newDD( +
(DD+ ,
roomRepositoryDD, :
,DD: ;
accountRepositoryDD< M
,DDM N
mapperDDO U
)DDU V
;DDV W
ServiceResultEE 
resultEE  
=EE! "
awaitEE# (
serviceEE) 0
.EE0 1
ExecuteEE1 8
(EE8 9
requestModelEE9 E
.EEE F
NameEEF J
!EEJ K
)EEK L
;EEL M
switchGG 
(GG 
resultGG 
)GG 
{HH 
caseII 
ServiceResultII "
.II" #
ROOM_NOT_FOUNDII# 1
:II1 2
returnJJ 

StatusCodeJJ %
(JJ% &
$numJJ& )
,JJ) *
newJJ+ .
{JJ/ 0
messageJJ1 8
=JJ9 :
$strJJ; ^
}JJ_ `
)JJ` a
;JJa b
caseKK 
ServiceResultKK "
.KK" #
DATABASE_ERRORKK# 1
:KK1 2
returnLL 

StatusCodeLL %
(LL% &
$numLL& )
,LL) *
newLL+ .
{LL/ 0
messageLL1 8
=LL9 :
$strLL; Q
}LLR S
)LLS T
;LLT U
}MM 
returnNN 

StatusCodeNN 
(NN 
$numNN !
,NN! "
newNN# &
{NN' (
}NN) *
)NN* +
;NN+ ,
}OO 	
[QQ 	
HttpGetQQ	 
(QQ 
$strQQ .
)QQ. /
]QQ/ 0
[RR 	
	AuthorizeRR	 
(RR 
RolesRR 
=RR 
$strRR "
)RR" #
]RR# $
publicSS 
asyncSS 
TaskSS 
<SS 
IActionResultSS '
>SS' (
GetRoomsByPageSS) 7
(SS7 8
intSS8 ;
pageSS< @
)SS@ A
{TT 	!
GetRoomsByPageServiceUU !
serviceUU" )
=UU* +
newUU, /
(UU/ 0
roomRepositoryUU0 >
,UU> ?
mapperUU@ F
)UUF G
;UUG H
varVV 
(VV 
resultVV 
,VV 
roomsVV 
,VV 
maxPagesVV  (
)VV( )
=VV* +
awaitVV, 1
serviceVV2 9
.VV9 :
ExecuteVV: A
(VVA B
pageVVB F
)VVF G
;VVG H
switchXX 
(XX 
resultXX 
)XX 
{YY 
caseZZ 
ServiceResultZZ "
.ZZ" #
	NOT_FOUNDZZ# ,
:ZZ, -
return[[ 

StatusCode[[ %
([[% &
$num[[& )
,[[) *
new[[+ .
{[[/ 0
message[[1 8
=[[9 :
$str[[; b
}[[c d
)[[d e
;[[e f
}\\ 
var^^ 
roomsResponse^^ 
=^^ 
rooms^^  %
!^^% &
.^^& '
Select^^' -
(^^- .
room^^. 2
=>^^3 5
new^^6 9
{__ 
roomName`` 
=`` 
room`` 
.``  
Name``  $
}aa 
)aa 
;aa 
returncc 

StatusCodecc 
(cc 
$numcc !
,cc! "
newcc# &
{cc' (
maxPagescc) 1
,cc1 2
roomscc3 8
=cc9 :
roomsResponsecc; H
}ccI J
)ccJ K
;ccK L
}dd 	
}ee 
}ff ής
†/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/ManageAccountController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str "
)" #
]# $
[ 
	Authorize 
( 
Policy 
= 
$str (
)( )
]) *
public 

class #
ManageAccountController (
:) *
ControllerBase+ 9
{ 
private 
readonly 
ILog 
log !
;! "
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IAccountValidator *
accountValidator+ ;
;; <
private 
readonly )
IFaceRecognitionServiceClient 6!
faceRecognitionClient7 L
;L M
private 
readonly 
IFaceRepository (
faceRepository) 7
;7 8
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IAccountFactory (
accountFactory) 7
;7 8
private 
readonly 
IGenericMapper '
mapper( .
;. /
public!! #
ManageAccountController!! &
(!!& '
ILog!!' +
log!!, /
,!!/ 0
IAccountRepository!!1 C
accountRepository!!D U
,!!U V
IAccountValidator!!W h
accountValidator!!i y
,!!y z*
IFaceRecognitionServiceClient	!!{ #
faceRecognitionClient
!!™ ®
,
!!® ―
IFaceRepository
!!° Ώ
faceRepository
!!ΐ Ξ
,
!!Ξ Ο
IRoomRepository
!!Π ί
roomRepository
!!ΰ ξ
,
!!ξ ο
IAccountFactory
!!π ÿ
accountFactory
!!€ 
,
!! 
IGenericMapper
!! 
mapper
!! ¥
)
!!¥ ¦
{"" 	
this## 
.## 
log## 
=## 
log## 
;## 
this$$ 
.$$ 
accountRepository$$ "
=$$# $
accountRepository$$% 6
;$$6 7
this%% 
.%% 
accountValidator%% !
=%%" #
accountValidator%%$ 4
;%%4 5
this&& 
.&& !
faceRecognitionClient&& &
=&&' (!
faceRecognitionClient&&) >
;&&> ?
this'' 
.'' 
faceRepository'' 
=''  !
faceRepository''" 0
;''0 1
this(( 
.(( 
roomRepository(( 
=((  !
roomRepository((" 0
;((0 1
this)) 
.)) 
accountFactory)) 
=))  !
accountFactory))" 0
;))0 1
this** 
.** 
mapper** 
=** 
mapper**  
;**  !
}++ 	
[-- 	
HttpPost--	 
(-- 
$str-- 
)-- 
]-- 
[.. 	
	Authorize..	 
(.. 
Roles.. 
=.. 
$str.. %
)..% &
]..& '
public// 
async// 
Task// 
<// 
IActionResult// '
>//' (
Register//) 1
(//1 2
[//2 3
FromBody//3 ;
]//; <'
RegisterAccountRequestModel//= X
requestModel//Y e
)//e f
{00 	
if11 
(11 
!11 

ModelState11 
.11 
IsValid11 #
)11# $
{22 
log33 
.33 
Error33 
(33 
$"33 
$str33 .
"33. /
)33/ 0
;330 1
return44 

BadRequest44 !
(44! "

ModelState44" ,
)44, -
;44- .
}55 
if77 
(77 
!77 
Enum77 
.77 
TryParse77 
<77 
Role77 #
>77# $
(77$ %
requestModel77% 1
.771 2
Role772 6
,776 7
out778 ;
var77< ?
accountRole77@ K
)77K L
)77L M
{88 
return99 

StatusCode99 !
(99! "
$num99" %
,99% &
new99' *
{99+ ,
message99- 4
=995 6
$str997 K
}99L M
)99M N
;99N O
}:: 
Account<< 
?<< 
account<< 
=<< 
HttpContext<< *
.<<* +

GetAccount<<+ 5
(<<5 6
)<<6 7
;<<7 8
if== 
(== 
account== 
is== 
null== 
)==  
{>> 
log?? 
.?? 
Error?? 
(?? 
$str?? B
)??B C
;??C D
return@@ 

StatusCode@@ !
(@@! "
$num@@" %
,@@% &
new@@' *
{@@+ ,
message@@- 4
=@@5 6
$str@@7 F
}@@G H
)@@H I
;@@I J
}AA 
AccountCC 

newAccountCC 
=CC  
accountFactoryCC! /
.CC/ 0
CreateCC0 6
(CC6 7
requestModelCC7 C
.CCC D
	FirstNameCCD M
!CCM N
,CCN O
requestModelCCP \
.CC\ ]
LastNameCC] e
!CCe f
,CCf g
requestModelCCh t
.CCt u
UsernameCCu }
!CC} ~
,CC~ 
requestModel
CC€ 
.
CC 
Email
CC ’
!
CC’ “
,
CC“ ”
requestModel
CC• ΅
.
CC΅ Ά
Password
CCΆ ª
!
CCª «
,
CC« ¬
requestModel
CC­ Ή
.
CCΉ Ί
Address
CCΊ Α
!
CCΑ Β
,
CCΒ Γ
requestModel
CCΔ Π
.
CCΠ Ρ
PhoneNumber
CCΡ ά
!
CCά έ
,
CCέ ή
accountRole
CCί κ
,
CCκ λ
DateTimeOffset
CCμ ϊ
.
CCϊ ϋ
Now
CCϋ ώ
.
CCώ ÿ
ToUnixTimeSeconds
CCÿ 
(
CC ‘
)
CC‘ ’
)
CC’ “
;
CC“ ”"
RegisterAccountServiceDD "
serviceDD# *
=DD+ ,
newDD- 0
(DD0 1
accountRepositoryDD1 B
,DDB C
accountValidatorDDD T
)DDT U
;DDU V
ServiceResultEE 
resultEE  
=EE! "
awaitEE# (
serviceEE) 0
.EE0 1
ExecuteEE1 8
(EE8 9
accountEE9 @
,EE@ A

newAccountEEB L
)EEL M
;EEM N
switchFF 
(FF 
resultFF 
)FF 
{GG 
caseHH 
ServiceResultHH "
.HH" #
INVALID_OPERATIONHH# 4
:HH4 5
returnII 

StatusCodeII %
(II% &
$numII& )
,II) *
newII+ .
{II/ 0
messageII1 8
=II9 :
$strII; o
}IIp q
)IIq r
;IIr s
caseJJ 
ServiceResultJJ "
.JJ" #
INVALID_USERNAMEJJ# 3
:JJ3 4
returnKK 

StatusCodeKK %
(KK% &
$numKK& )
,KK) *
newKK+ .
{KK/ 0
messageKK1 8
=KK9 :
$strKK; M
}KKN O
)KKO P
;KKP Q
caseLL 
ServiceResultLL "
.LL" #
INVALID_EMAILLL# 0
:LL0 1
returnMM 

StatusCodeMM %
(MM% &
$numMM& )
,MM) *
newMM+ .
{MM/ 0
messageMM1 8
=MM9 :
$strMM; R
}MMS T
)MMT U
;MMU V
caseNN 
ServiceResultNN "
.NN" # 
INVALID_PHONE_NUMBERNN# 7
:NN7 8
returnOO 

StatusCodeOO %
(OO% &
$numOO& )
,OO) *
newOO+ .
{OO/ 0
messageOO1 8
=OO9 :
$strOO; Q
}OOR S
)OOS T
;OOT U
casePP 
ServiceResultPP "
.PP" #!
ACCOUNT_ALREADY_EXISTPP# 8
:PP8 9
returnQQ 

StatusCodeQQ %
(QQ% &
$numQQ& )
,QQ) *
newQQ+ .
{QQ/ 0
messageQQ1 8
=QQ9 :
$strQQ; i
}QQj k
)QQk l
;QQl m
caseRR 
ServiceResultRR "
.RR" #
EMAIL_ALREADY_EXISTRR# 6
:RR6 7
returnSS 

StatusCodeSS %
(SS% &
$numSS& )
,SS) *
newSS+ .
{SS/ 0
messageSS1 8
=SS9 :
$strSS; f
}SSg h
)SSh i
;SSi j
caseTT 
ServiceResultTT "
.TT" #
DATABASE_ERRORTT# 1
:TT1 2
returnUU 

StatusCodeUU %
(UU% &
$numUU& )
,UU) *
newUU+ .
{UU/ 0
messageUU1 8
=UU9 :
$strUU; P
}UUQ R
)UUR S
;UUS T
}WW 
returnYY 

StatusCodeYY 
(YY 
$numYY !
,YY! "
newYY# &
{YY' (
}YY) *
)YY* +
;YY+ ,
}ZZ 	
[\\ 	
HttpPost\\	 
(\\ 
$str\\ !
)\\! "
]\\" #
[]] 	
	Authorize]]	 
(]] 
Roles]] 
=]] 
$str]] %
)]]% &
]]]& '
public^^ 
async^^ 
Task^^ 
<^^ 
IActionResult^^ '
>^^' (
RegisterFace^^) 5
(^^5 6
[^^6 7
FromForm^^7 ?
]^^? @$
RegisterFaceRequestModel^^A Y
requestModel^^Z f
)^^f g
{__ 	
if`` 
(`` 
!`` 

ModelState`` 
.`` 
IsValid`` #
)``# $
{aa 
logbb 
.bb 
Errorbb 
(bb 
$"bb 
$strbb .
"bb. /
)bb/ 0
;bb0 1
returncc 

BadRequestcc !
(cc! "

ModelStatecc" ,
)cc, -
;cc- .
}dd 
varff 

faceStreamff 
=ff 
newff  
MemoryStreamff! -
(ff- .
)ff. /
;ff/ 0
awaitgg 
requestModelgg 
.gg 
FaceImggg &
!gg& '
.gg' (
CopyToAsyncgg( 3
(gg3 4

faceStreamgg4 >
)gg> ?
;gg? @

faceStreamhh 
.hh 
Positionhh 
=hh  !
$numhh" #
;hh# $
RegisterFaceServicejj 
servicejj  '
=jj( )
newjj* -
(jj- .
accountRepositoryjj. ?
,jj? @!
faceRecognitionClientjjA V
,jjV W
mapperjjX ^
)jj^ _
;jj_ `
ServiceResultkk 
resultkk  
=kk! "
awaitkk# (
servicekk) 0
.kk0 1
Executekk1 8
(kk8 9
requestModelkk9 E
.kkE F
UsernamekkF N
!kkN O
,kkO P

faceStreamkkQ [
)kk[ \
;kk\ ]
switchll 
(ll 
resultll 
)ll 
{mm 
casenn 
ServiceResultnn "
.nn" #
ACCOUNT_NOT_FOUNDnn# 4
:nn4 5
returnoo 

StatusCodeoo %
(oo% &
$numoo& )
,oo) *
newoo+ .
{oo/ 0
messageoo1 8
=oo9 :
$stroo; e
}oof g
)oog h
;ooh i
casepp 
ServiceResultpp "
.pp" #!
FACE_ASSOCIATION_FAILpp# 8
:pp8 9
returnqq 

StatusCodeqq %
(qq% &
$numqq& )
,qq) *
$strqq+ x
)qqx y
;qqy z
caserr 
ServiceResultrr "
.rr" #
FACE_NOT_FOUNDrr# 1
:rr1 2
returnss 

StatusCodess %
(ss% &
$numss& )
,ss) *
newss+ .
{ss/ 0
messagess1 8
=ss9 :
$strss; V
}ssW X
)ssX Y
;ssY Z
casett 
ServiceResulttt "
.tt" #
FACE_ALREADY_EXISTtt# 5
:tt5 6
returnuu 

StatusCodeuu %
(uu% &
$numuu& )
,uu) *
newuu+ .
{uu/ 0
messageuu1 8
=uu9 :
$struu; T
}uuU V
)uuV W
;uuW X
casevv 
ServiceResultvv "
.vv" #
UNKNOWN_ERRORvv# 0
:vv0 1
returnww 

StatusCodeww %
(ww% &
$numww& )
,ww) *
newww+ .
{ww/ 0
messageww1 8
=ww9 :
$strww; Q
}wwR S
)wwS T
;wwT U
}xx 
returnzz 

StatusCodezz 
(zz 
$numzz !
,zz! "
newzz# &
{zz' (
}zz) *
)zz* +
;zz+ ,
}{{ 	
[}} 	

HttpDelete}}	 
]}} 
[~~ 	
	Authorize~~	 
(~~ 
Roles~~ 
=~~ 
$str~~ %
)~~% &
]~~& '
public 
async 
Task 
< 
IActionResult '
>' (
RemoveAccount) 6
(6 7
[7 8
FromBody8 @
]@ A
RemoveRequestModelB T
requestModelU a
)a b
{
€€ 	
if
 
(
 
!
 

ModelState
 
.
 
IsValid
 #
)
# $
{
‚‚ 
log
ƒƒ 
.
ƒƒ 
Error
ƒƒ 
(
ƒƒ 
$"
ƒƒ 
$str
ƒƒ .
"
ƒƒ. /
)
ƒƒ/ 0
;
ƒƒ0 1
return
„„ 

BadRequest
„„ !
(
„„! "

ModelState
„„" ,
)
„„, -
;
„„- .
}
…… 
Account
‡‡ 
?
‡‡ 
account
‡‡ 
=
‡‡ 
HttpContext
‡‡ *
.
‡‡* +

GetAccount
‡‡+ 5
(
‡‡5 6
)
‡‡6 7
;
‡‡7 8
if
 
(
 
account
 
is
 
null
 
)
  
{
‰‰ 
log
 
.
 
Error
 
(
 
$str
 B
)
B C
;
C D
return
‹‹ 

StatusCode
‹‹ !
(
‹‹! "
$num
‹‹" %
,
‹‹% &
new
‹‹' *
{
‹‹+ ,
message
‹‹- 4
=
‹‹5 6
$str
‹‹7 F
}
‹‹G H
)
‹‹H I
;
‹‹I J
}
 "
RemoveAccountService
  
service
! (
=
) *
new
+ .
(
. /
accountRepository
/ @
,
@ A
faceRepository
B P
,
P Q
mapper
R X
,
X Y#
faceRecognitionClient
Z o
)
o p
;
p q
ServiceResult
 
result
  
=
! "
await
# (
service
) 0
.
0 1
Execute
1 8
(
8 9
account
9 @
,
@ A
requestModel
B N
.
N O
Username
O W
!
W X
)
X Y
;
Y Z
if
‘‘ 
(
‘‘ 
result
‘‘ 
!=
‘‘ 
ServiceResult
‘‘ '
.
‘‘' (
OK
‘‘( *
)
‘‘* +
{
’’ 
switch
““ 
(
““ 
result
““ 
)
““ 
{
”” 
case
•• 
ServiceResult
•• &
.
••& '
INVALID_OPERATION
••' 8
:
••8 9
return
–– 

StatusCode
–– )
(
––) *
$num
––* -
,
––- .
new
––/ 2
{
––3 4
message
––5 <
=
––= >
$str
––? q
}
––r s
)
––s t
;
––t u
case
—— 
ServiceResult
—— &
.
——& '
ACCOUNT_NOT_FOUND
——' 8
:
——8 9
return
 

StatusCode
 )
(
) *
$num
* -
,
- .
new
/ 2
{
3 4
message
5 <
=
= >
$str
? i
}
j k
)
k l
;
l m
case
™™ 
ServiceResult
™™ &
.
™™& '
DATABASE_ERROR
™™' 5
:
™™5 6
return
 

StatusCode
 )
(
) *
$num
* -
,
- .
new
/ 2
{
3 4
message
5 <
=
= >
$str
? U
}
V W
)
W X
;
X Y
}
›› 
}
 
return
 

StatusCode
 
(
 
$num
 !
,
! "
new
# &
{
' (
}
) *
)
* +
;
+ ,
}
 	
[
   	
HttpPost
  	 
(
   
$str
   #
)
  # $
]
  $ %
[
΅΅ 	
	Authorize
΅΅	 
(
΅΅ 
Roles
΅΅ 
=
΅΅ 
$str
΅΅ %
)
΅΅% &
]
΅΅& '
public
ΆΆ 
async
ΆΆ 
Task
ΆΆ 
<
ΆΆ 
IActionResult
ΆΆ '
>
ΆΆ' (
AddRoomPermision
ΆΆ) 9
(
ΆΆ9 :
[
ΆΆ: ;
FromBody
ΆΆ; C
]
ΆΆC D3
%AddOrRemoveRoomPermissionRequestModel
ΆΆE j
requestModel
ΆΆk w
)
ΆΆw x
{
££ 	
if
¤¤ 
(
¤¤ 
!
¤¤ 

ModelState
¤¤ 
.
¤¤ 
IsValid
¤¤ #
)
¤¤# $
{
¥¥ 
log
¦¦ 
.
¦¦ 
Error
¦¦ 
(
¦¦ 
$"
¦¦ 
$str
¦¦ .
"
¦¦. /
)
¦¦/ 0
;
¦¦0 1
return
§§ 

BadRequest
§§ !
(
§§! "

ModelState
§§" ,
)
§§, -
;
§§- .
}
¨¨ &
AddRoomPremissionService
ªª $
service
ªª% ,
=
ªª- .
new
ªª/ 2
(
ªª2 3
accountRepository
ªª3 D
,
ªªD E
roomRepository
ªªF T
,
ªªT U
mapper
ªªV \
)
ªª\ ]
;
ªª] ^
ServiceResult
«« 
result
««  
=
««! "
await
««# (
service
««) 0
.
««0 1
Execute
««1 8
(
««8 9
requestModel
««9 E
.
««E F
Username
««F N
!
««N O
,
««O P
requestModel
««Q ]
.
««] ^
RoomName
««^ f
!
««f g
)
««g h
;
««h i
switch
­­ 
(
­­ 
result
­­ 
)
­­ 
{
®® 
case
―― 
ServiceResult
―― "
.
――" #
ACCOUNT_NOT_FOUND
――# 4
:
――4 5
return
°° 

StatusCode
°° %
(
°°% &
$num
°°& )
,
°°) *
new
°°+ .
{
°°/ 0
message
°°1 8
=
°°9 :
$str
°°; i
}
°°j k
)
°°k l
;
°°l m
case
±± 
ServiceResult
±± "
.
±±" #
ROOM_NOT_FOUND
±±# 1
:
±±1 2
return
²² 

StatusCode
²² %
(
²²% &
$num
²²& )
,
²²) *
new
²²+ .
{
²²/ 0
message
²²1 8
=
²²9 :
$str
²²; b
}
²²c d
)
²²d e
;
²²e f
case
³³ 
ServiceResult
³³ "
.
³³" #
DATABASE_ERROR
³³# 1
:
³³1 2
return
΄΄ 

StatusCode
΄΄ %
(
΄΄% &
$num
΄΄& )
,
΄΄) *
new
΄΄+ .
{
΄΄/ 0
message
΄΄1 8
=
΄΄9 :
$str
΄΄; Q
}
΄΄R S
)
΄΄S T
;
΄΄T U
case
µµ 
ServiceResult
µµ "
.
µµ" #
INVALID_OPERATION
µµ# 4
:
µµ4 5
return
¶¶ 

StatusCode
¶¶ %
(
¶¶% &
$num
¶¶& )
,
¶¶) *
new
¶¶+ .
{
¶¶/ 0
message
¶¶1 8
=
¶¶9 :
$str
¶¶; N
}
¶¶O P
)
¶¶P Q
;
¶¶Q R
}
·· 
return
ΈΈ 

StatusCode
ΈΈ 
(
ΈΈ 
$num
ΈΈ !
,
ΈΈ! "
new
ΈΈ# &
{
ΈΈ' (
}
ΈΈ) *
)
ΈΈ* +
;
ΈΈ+ ,
}
ΉΉ 	
[
»» 	

HttpDelete
»»	 
(
»» 
$str
»» %
)
»»% &
]
»»& '
[
ΌΌ 	
	Authorize
ΌΌ	 
(
ΌΌ 
Roles
ΌΌ 
=
ΌΌ 
$str
ΌΌ %
)
ΌΌ% &
]
ΌΌ& '
public
½½ 
async
½½ 
Task
½½ 
<
½½ 
IActionResult
½½ '
>
½½' (!
RemoveRoomPermision
½½) <
(
½½< =
[
½½= >
FromBody
½½> F
]
½½F G3
%AddOrRemoveRoomPermissionRequestModel
½½H m
requestModel
½½n z
)
½½z {
{
ΎΎ 	
if
ΏΏ 
(
ΏΏ 
!
ΏΏ 

ModelState
ΏΏ 
.
ΏΏ 
IsValid
ΏΏ #
)
ΏΏ# $
{
ΐΐ 
log
ΑΑ 
.
ΑΑ 
Error
ΑΑ 
(
ΑΑ 
$"
ΑΑ 
$str
ΑΑ .
"
ΑΑ. /
)
ΑΑ/ 0
;
ΑΑ0 1
return
ΒΒ 

BadRequest
ΒΒ !
(
ΒΒ! "

ModelState
ΒΒ" ,
)
ΒΒ, -
;
ΒΒ- .
}
ΓΓ )
RemoveRoomPermissionService
ΕΕ '
service
ΕΕ( /
=
ΕΕ0 1
new
ΕΕ2 5
(
ΕΕ5 6
accountRepository
ΕΕ6 G
,
ΕΕG H
roomRepository
ΕΕI W
,
ΕΕW X
mapper
ΕΕY _
)
ΕΕ_ `
;
ΕΕ` a
ServiceResult
ΖΖ 
result
ΖΖ  
=
ΖΖ! "
await
ΖΖ# (
service
ΖΖ) 0
.
ΖΖ0 1
Execute
ΖΖ1 8
(
ΖΖ8 9
requestModel
ΖΖ9 E
.
ΖΖE F
Username
ΖΖF N
!
ΖΖN O
,
ΖΖO P
requestModel
ΖΖQ ]
.
ΖΖ] ^
RoomName
ΖΖ^ f
!
ΖΖf g
)
ΖΖg h
;
ΖΖh i
switch
ΘΘ 
(
ΘΘ 
result
ΘΘ 
)
ΘΘ 
{
ΙΙ 
case
ΚΚ 
ServiceResult
ΚΚ "
.
ΚΚ" #
ACCOUNT_NOT_FOUND
ΚΚ# 4
:
ΚΚ4 5
return
ΛΛ 

StatusCode
ΛΛ %
(
ΛΛ% &
$num
ΛΛ& )
,
ΛΛ) *
new
ΛΛ+ .
{
ΛΛ/ 0
message
ΛΛ1 8
=
ΛΛ9 :
$str
ΛΛ; i
}
ΛΛj k
)
ΛΛk l
;
ΛΛl m
case
ΜΜ 
ServiceResult
ΜΜ "
.
ΜΜ" #
ROOM_NOT_FOUND
ΜΜ# 1
:
ΜΜ1 2
return
ΝΝ 

StatusCode
ΝΝ %
(
ΝΝ% &
$num
ΝΝ& )
,
ΝΝ) *
new
ΝΝ+ .
{
ΝΝ/ 0
message
ΝΝ1 8
=
ΝΝ9 :
$str
ΝΝ; b
}
ΝΝc d
)
ΝΝd e
;
ΝΝe f
case
ΞΞ 
ServiceResult
ΞΞ "
.
ΞΞ" #
DATABASE_ERROR
ΞΞ# 1
:
ΞΞ1 2
return
ΟΟ 

StatusCode
ΟΟ %
(
ΟΟ% &
$num
ΟΟ& )
,
ΟΟ) *
new
ΟΟ+ .
{
ΟΟ/ 0
message
ΟΟ1 8
=
ΟΟ9 :
$str
ΟΟ; Q
}
ΟΟR S
)
ΟΟS T
;
ΟΟT U
case
ΠΠ 
ServiceResult
ΠΠ "
.
ΠΠ" #
INVALID_OPERATION
ΠΠ# 4
:
ΠΠ4 5
return
ΡΡ 

StatusCode
ΡΡ %
(
ΡΡ% &
$num
ΡΡ& )
,
ΡΡ) *
new
ΡΡ+ .
{
ΡΡ/ 0
message
ΡΡ1 8
=
ΡΡ9 :
$str
ΡΡ; N
}
ΡΡO P
)
ΡΡP Q
;
ΡΡQ R
}
ÒÒ 
return
ΣΣ 

StatusCode
ΣΣ 
(
ΣΣ 
$num
ΣΣ !
,
ΣΣ! "
new
ΣΣ# &
{
ΣΣ' (
}
ΣΣ) *
)
ΣΣ* +
;
ΣΣ+ ,
}
ΤΤ 	
[
ΦΦ 	
HttpGet
ΦΦ	 
(
ΦΦ 
$str
ΦΦ 1
)
ΦΦ1 2
]
ΦΦ2 3
[
ΧΧ 	
	Authorize
ΧΧ	 
(
ΧΧ 
Roles
ΧΧ 
=
ΧΧ 
$str
ΧΧ %
)
ΧΧ% &
]
ΧΧ& '
public
ΨΨ 
async
ΨΨ 
Task
ΨΨ 
<
ΨΨ 
IActionResult
ΨΨ '
>
ΨΨ' (
GetAccounts
ΨΨ) 4
(
ΨΨ4 5
[
ΨΨ5 6
	FromRoute
ΨΨ6 ?
]
ΨΨ? @
int
ΨΨA D
page
ΨΨE I
)
ΨΨI J
{
ΩΩ 	&
GetAccountsByPageService
ΫΫ $
service
ΫΫ% ,
=
ΫΫ- .
new
ΫΫ/ 2
(
ΫΫ2 3
accountRepository
ΫΫ3 D
,
ΫΫD E
mapper
ΫΫF L
)
ΫΫL M
;
ΫΫM N
var
άά 
result
άά 
=
άά 
await
άά 
service
άά &
.
άά& '
Execute
άά' .
(
άά. /
page
άά/ 3
)
άά3 4
;
άά4 5
switch
ήή 
(
ήή 
result
ήή 
.
ήή 
Item1
ήή  
)
ήή  !
{
ίί 
case
ΰΰ 
ServiceResult
ΰΰ "
.
ΰΰ" #
	NOT_FOUND
ΰΰ# ,
:
ΰΰ, -
return
αα 

StatusCode
αα %
(
αα% &
$num
αα& )
,
αα) *
new
αα+ .
{
αα/ 0
message
αα1 8
=
αα9 :
$str
αα; e
}
ααf g
)
ααg h
;
ααh i
}
ββ 
var
δδ 
accounts
δδ 
=
δδ 
result
δδ !
.
δδ! "
Item2
δδ" '
!
δδ' (
.
δδ( )
Select
δδ) /
(
δδ/ 0
account
δδ0 7
=>
δδ8 :
new
δδ; >
{
εε 
account
ζζ 
.
ζζ 
Username
ζζ  
,
ζζ  !
account
ηη 
.
ηη 
	FirstName
ηη !
,
ηη! "
account
θθ 
.
θθ 
LastName
θθ  
,
θθ  !
account
ιι 
.
ιι 
Email
ιι 
,
ιι 
account
κκ 
.
κκ 
Address
κκ 
,
κκ  
account
λλ 
.
λλ 
PhoneNumber
λλ #
,
λλ# $
account
μμ 
.
μμ 
FaceID
μμ 
,
μμ 
account
νν 
.
νν 
AllowedRooms
νν $
,
νν$ %
account
ξξ 
.
ξξ &
TemporaryRoomPermissions
ξξ 0
,
ξξ0 1
role
οο 
=
οο 
account
οο 
.
οο 
Role
οο #
.
οο# $
ToString
οο$ ,
(
οο, -
)
οο- .
}
ππ 
)
ππ 
;
ππ 
var
ςς 
response
ςς 
=
ςς 
new
ςς 
{
σσ 
maxPages
ττ 
=
ττ 
result
ττ !
.
ττ! "
Item3
ττ" '
,
ττ' (
accounts
υυ 
}
φφ 
;
φφ 
return
χχ 

StatusCode
χχ 
(
χχ 
$num
χχ !
,
χχ! "
response
χχ# +
)
χχ+ ,
;
χχ, -
}
ψψ 	
[
ϊϊ 	
HttpGet
ϊϊ	 
]
ϊϊ 
[
ϋϋ 	
	Authorize
ϋϋ	 
(
ϋϋ 
Roles
ϋϋ 
=
ϋϋ 
$str
ϋϋ %
)
ϋϋ% &
]
ϋϋ& '
public
όό 
async
όό 
Task
όό 
<
όό 
IActionResult
όό '
>
όό' (

GetAccount
όό) 3
(
όό3 4
[
όό4 5
	FromQuery
όό5 >
]
όό> ?$
GetAccountRequestModel
όό@ V
requestModel
όόW c
)
όόc d
{
ύύ 	
if
ώώ 
(
ώώ 
!
ώώ 

ModelState
ώώ 
.
ώώ 
IsValid
ώώ #
)
ώώ# $
{
ÿÿ 
log
€€ 
.
€€ 
Error
€€ 
(
€€ 
$"
€€ 
$str
€€ .
"
€€. /
)
€€/ 0
;
€€0 1
return
 

BadRequest
 !
(
! "

ModelState
" ,
)
, -
;
- .
}
‚‚ 
GetAccountService
„„ 
service
„„ %
=
„„& '
new
„„( +
(
„„+ ,
accountRepository
„„, =
,
„„= >
mapper
„„? E
)
„„E F
;
„„F G
var
…… 
result
…… 
=
…… 
await
…… 
service
…… &
.
……& '
Execute
……' .
(
……. /
requestModel
……/ ;
.
……; <
Username
……< D
!
……D E
)
……E F
;
……F G
switch
‡‡ 
(
‡‡ 
result
‡‡ 
.
‡‡ 
Item1
‡‡  
)
‡‡  !
{
 
case
‰‰ 
ServiceResult
‰‰ "
.
‰‰" #
ACCOUNT_NOT_FOUND
‰‰# 4
:
‰‰4 5
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; e
}
f g
)
g h
;
h i
case
‹‹ 
ServiceResult
‹‹ "
.
‹‹" #
DATABASE_ERROR
‹‹# 1
:
‹‹1 2
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; Q
}
R S
)
S T
;
T U
}
 
Account
 
account
 
=
 
result
 $
.
$ %
Item2
% *
!
* +
;
+ ,
var
 
response
 
=
 
new
 
{
‘‘ 
account
’’ 
.
’’ 
Username
’’  
,
’’  !
account
““ 
.
““ 
	FirstName
““ !
,
““! "
account
”” 
.
”” 
LastName
””  
,
””  !
account
•• 
.
•• 
Email
•• 
,
•• 
account
–– 
.
–– 
Address
–– 
,
––  
account
—— 
.
—— 
PhoneNumber
—— #
,
——# $
account
 
.
 
FaceID
 
,
 
account
™™ 
.
™™ 
AllowedRooms
™™ $
,
™™$ %
role
 
=
 
account
 
.
 
Role
 #
.
# $
ToString
$ ,
(
, -
)
- .
}
›› 
;
›› 
return
 

StatusCode
 
(
 
$num
 !
,
! "
response
# +
)
+ ,
;
, -
}
 	
}
 
} π"
‡/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/EntranceRecordController.cs
	namespace

 	
VisualAccess


 
.

 
API

 
.

 
Controllers

 &
;

& '
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public 
class $
EntranceRecordController %
:& '
ControllerBase( 6
{ 
public 

readonly 
ILog 
log 
; 
public 

readonly %
IEntranceRecordRepository -$
entranceRecordRepository. F
;F G
public 

readonly 
IGenericMapper "
mapper# )
;) *
public 
$
EntranceRecordController #
(# $
ILog$ (
log) ,
,, -%
IEntranceRecordRepository. G$
entranceRecordRepositoryH `
,` a
IGenericMapperb p
mapperq w
)w x
{ 
this 
. 
log 
= 
log 
; 
this 
. $
entranceRecordRepository %
=& '$
entranceRecordRepository( @
;@ A
this 
. 
mapper 
= 
mapper 
; 
} 
[ 
HttpGet 
( 
$str *
)* +
]+ ,
[ 
	Authorize 
( 
Roles 
= 
$str !
)! "
]" #
public 

async 
Task 
< 
IActionResult #
># $$
GetEntranceRecordsByPage% =
(= >
[> ?
	FromRoute? H
]H I
intJ M
pageN R
)R S
{ 
log 
. 
Info 
( 
$" 
$str 6
{6 7
page7 ;
}; <
"< =
)= >
;> ?*
GetEntranceRecordByPageService   &+
getEntranceRecordsByPageService  ' F
=  G H
new  I L
(  L M$
entranceRecordRepository  M e
,  e f
mapper  g m
)  m n
;  n o
(!! 	
ServiceResult!!	 
,!! 
List!! 
<!! 
EntranceRecord!! +
>!!+ ,
?!!, -
,!!- .
long!!/ 3
)!!3 4
result!!5 ;
=!!< =
await!!> C+
getEntranceRecordsByPageService!!D c
.!!c d
Execute!!d k
(!!k l
page!!l p
)!!p q
;!!q r
return"" 
result"" 
."" 
Item1"" 
switch"" "
{## 	
ServiceResult$$ 
.$$ 
OK$$ 
=>$$ 

StatusCode$$  *
($$* +
$num$$+ .
,$$. /
new$$0 3
{%% 
maxPages&& 
=&& 
result&& !
.&&! "
Item3&&" '
,&&' (
records'' 
='' 
result''  
.''  !
Item2''! &
!''& '
.''' (
Select''( .
(''. /
record''/ 5
=>''6 8
new''9 <
{(( 
record)) 
.)) 
id)) 
,)) 
record** 
.** 
username** #
,**# $
record++ 
.++ 
roomName++ #
,++# $
record,, 
.,, 
time,, 
,,,  
record-- 
.-- 

hasEntered-- %
}.. 
).. 
}// 
)// 
,// 
ServiceResult00 
.00 
	NOT_FOUND00 #
=>00$ &

StatusCode00' 1
(001 2
$num002 5
,005 6
new007 :
{00; <
message00= D
=00E F
$str00G y
}00z {
)00{ |
,00| }
_11 
=>11 

StatusCode11 
(11 
$num11 
,11  
new11! $
{11% &
message11' .
=11/ 0
$str111 G
}11H I
)11I J
}22 	
;22	 

}44 
}55 Α9
‡/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/AuthenticationController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class $
AuthenticationController )
:* +
ControllerBase, :
{ 
private 
readonly 
ILog 
log !
;! "
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IAccountValidator *
accountValidator+ ;
;; <
private 
readonly 
ITokenFactory &
tokenFactory' 3
;3 4
private 
readonly 
IRoomRepository (
roomRepository) 7
;7 8
private 
readonly 
IRoomValidator '
roomValidator( 5
;5 6
private 
readonly 
IGenericMapper '
mapper( .
;. /
public $
AuthenticationController '
(' (
ILog( ,
log- 0
,0 1
IAccountRepository2 D
accountRepositoryE V
,V W
IAccountValidatorX i
accountValidatorj z
,z {
ITokenFactory	| ‰
tokenFactory
 –
,
– —
IRoomRepository
 §
roomRepository
¨ ¶
,
¶ ·
IRoomValidator
Έ Ζ
roomValidator
Η Τ
,
Τ Υ
IGenericMapper
Φ δ
mapper
ε λ
)
λ μ
{ 	
this 
. 
log 
= 
log 
; 
this   
.   
accountRepository   "
=  # $
accountRepository  % 6
;  6 7
this!! 
.!! 
accountValidator!! !
=!!" #
accountValidator!!$ 4
;!!4 5
this"" 
."" 
tokenFactory"" 
="" 
tokenFactory""  ,
;"", -
this## 
.## 
roomRepository## 
=##  !
roomRepository##" 0
;##0 1
this$$ 
.$$ 
roomValidator$$ 
=$$  
roomValidator$$! .
;$$. /
this%% 
.%% 
mapper%% 
=%% 
mapper%%  
;%%  !
}&& 	
[(( 	
HttpPost((	 
((( 
$str(( !
)((! "
]((" #
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
LoginAccount))) 5
())5 6
[))6 7
FromBody))7 ?
]))? @$
LoginAccountRequestModel))A Y
requestModel))Z f
)))f g
{** 	
if++ 
(++ 
!++ 

ModelState++ 
.++ 
IsValid++ #
)++# $
{,, 
log-- 
.-- 
Error-- 
(-- 
$"-- 
$str-- .
"--. /
)--/ 0
;--0 1
return.. 

BadRequest.. !
(..! "

ModelState.." ,
).., -
;..- .
}// 
LoginAccountService11 
service11  '
=11( )
new11* -
(11- .
accountRepository11. ?
,11? @
accountValidator11A Q
,11Q R
tokenFactory11S _
,11_ `
mapper11a g
)11g h
;11h i
var22 
result22 
=22 
await22 
service22 &
.22& '
Execute22' .
(22. /
requestModel22/ ;
.22; <
Username22< D
!22D E
,22E F
requestModel22G S
.22S T
Password22T \
!22\ ]
)22] ^
;22^ _
ServiceResult33 
serviceResult33 '
=33( )
result33* 0
.330 1
Item1331 6
;336 7
if44 
(44 
serviceResult44 
!=44  
ServiceResult44! .
.44. /
OK44/ 1
)441 2
{55 
return66 

StatusCode66 !
(66! "
$num66" %
,66% &
new66' *
{66+ ,
message66- 4
=665 6
$str667 L
}66M N
)66N O
;66O P
}77 
string99 
token99 
=99 
result99 !
.99! "
Item299" '
;99' (
return:: 

StatusCode:: 
(:: 
$num:: !
,::! "
new::# &
{::' (
token::) .
=::/ 0
token::1 6
}::7 8
)::8 9
;::9 :
};; 	
[== 	
HttpPost==	 
(== 
$str== 
)== 
]==  
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
	LoginRoom>>) 2
(>>2 3
[>>3 4
FromBody>>4 <
]>>< =!
LoginRoomRequestModel>>> S
requestModel>>T `
)>>` a
{?? 	
if@@ 
(@@ 
!@@ 

ModelState@@ 
.@@ 
IsValid@@ #
)@@# $
{AA 
logBB 
.BB 
ErrorBB 
(BB 
$"BB 
$strBB .
"BB. /
)BB/ 0
;BB0 1
returnCC 

BadRequestCC !
(CC! "

ModelStateCC" ,
)CC, -
;CC- .
}DD 
LoginRoomServiceFF 
serviceFF $
=FF% &
newFF' *
(FF* +
roomRepositoryFF+ 9
,FF9 :
roomValidatorFF; H
,FFH I
tokenFactoryFFJ V
,FFV W
mapperFFX ^
)FF^ _
;FF_ `
varGG 
resultGG 
=GG 
awaitGG 
serviceGG &
.GG& '
ExecuteGG' .
(GG. /
requestModelGG/ ;
.GG; <
NameGG< @
!GG@ A
,GGA B
requestModelGGC O
.GGO P
PasswordGGP X
!GGX Y
)GGY Z
;GGZ [
ServiceResultHH 
serviceResultHH '
=HH( )
resultHH* 0
.HH0 1
Item1HH1 6
;HH6 7
ifII 
(II 
serviceResultII 
!=II  
ServiceResultII! .
.II. /
OKII/ 1
)II1 2
{JJ 
returnKK 

StatusCodeKK !
(KK! "
$numKK" %
,KK% &
newKK' *
{KK+ ,
messageKK- 4
=KK5 6
$strKK7 L
}KKM N
)KKN O
;KKO P
}LL 
stringNN 
tokenNN 
=NN 
resultNN !
.NN! "
Item2NN" '
;NN' (
returnOO 

StatusCodeOO 
(OO 
$numOO !
,OO! "
newOO# &
{OO' (
tokenOO) .
=OO/ 0
tokenOO1 6
}OO7 8
)OO8 9
;OO9 :
}PP 	
}QQ 
}RR ά

|/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/ApiController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
ApiController 
:  
ControllerBase! /
{		 
[

 	
HttpGet

	 
(

 
$str

 
)

 
]

 
public 
Task 
< 
IActionResult !
>! "
GetApiVersion# 0
(0 1
)1 2
{ 	
var 
response 
= 
new 
{ 
name 
= 
$str &
,& '

apiVersion 
= 
$str !
} 
; 
return 
Task 
. 

FromResult "
<" #
IActionResult# 0
>0 1
(1 2

StatusCode2 <
(< =
$num= @
,@ A
responseB J
)J K
)K L
;L M
} 	
} 
} ΰ¶
€/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Controllers/AccountController.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Controllers &
{ 
[ 
Route 

(
 
$str  
)  !
]! "
[ 
	Authorize 
( 
Policy 
= 
$str (
)( )
]) *
public 

class 
AccountController "
:# $
ControllerBase% 3
{ 
private 
readonly 
ILog 
log !
;! "
private 
readonly 
IAccountRepository +
accountRepository, =
;= >
private 
readonly 
IAccountValidator *
accountValidator+ ;
;; <
private 
readonly 
IGenericMapper '
mapper( .
;. /
public 
AccountController  
(  !
ILog! %
log& )
,) *
IAccountRepository+ =
accountRepository> O
,O P
IAccountValidatorQ b
accountValidatorc s
,s t
IGenericMapper	u ƒ
mapper
„ 
)
 ‹
{ 	
this 
. 
log 
= 
log 
; 
this 
. 
accountRepository "
=# $
accountRepository% 6
;6 7
this 
. 
accountValidator !
=" #
accountValidator$ 4
;4 5
this   
.   
mapper   
=   
mapper    
;    !
}!! 	
[## 	
HttpGet##	 
(## 
$str## 
)## 
]## 
public$$ 
Task$$ 
<$$ 
IActionResult$$ !
>$$! "
Get$$# &
($$& '
)$$' (
{%% 	
Account&& 
?&& 
account&& 
=&& 
HttpContext&& *
.&&* +

GetAccount&&+ 5
(&&5 6
)&&6 7
;&&7 8
if'' 
('' 
account'' 
is'' 
null'' 
)''  
{(( 
log)) 
.)) 
Error)) 
()) 
$str)) B
)))B C
;))C D
return** 
Task** 
.** 

FromResult** &
<**& '
IActionResult**' 4
>**4 5
(**5 6

StatusCode**6 @
(**@ A
$num**A D
,**D E
new**F I
{**J K
message**L S
=**T U
$str**V e
}**f g
)**g h
)**h i
;**i j
}++ 
var-- 
response-- 
=-- 
new-- 
{.. 
account// 
.// 
Username//  
,//  !
account00 
.00 
	FirstName00 !
,00! "
account11 
.11 
LastName11  
,11  !
account22 
.22 
Email22 
,22 
account33 
.33 
Address33 
,33  
account44 
.44 
PhoneNumber44 #
,44# $
account55 
.55 
FaceID55 
,55 
account66 
.66 
AllowedRooms66 $
,66$ %
account77 
.77 $
TemporaryRoomPermissions77 0
,770 1
role88 
=88 
account88 
.88 
Role88 #
.88# $
ToString88$ ,
(88, -
)88- .
,88. /
}99 
;99 
return;; 
Task;; 
.;; 

FromResult;; "
<;;" #
IActionResult;;# 0
>;;0 1
(;;1 2

StatusCode;;2 <
(;;< =
$num;;= @
,;;@ A
response;;B J
);;J K
);;K L
;;;L M
}<< 	
[>> 	
HttpGet>>	 
(>> 
$str>>  
)>>  !
]>>! "
public?? 
Task?? 
<?? 
IActionResult?? !
>??! "
Notifications??# 0
(??0 1
)??1 2
{@@ 	
AccountAA 
?AA 
accountAA 
=AA 
HttpContextAA *
.AA* +

GetAccountAA+ 5
(AA5 6
)AA6 7
;AA7 8
ifBB 
(BB 
accountBB 
isBB 
nullBB 
)BB  
{CC 
logDD 
.DD 
ErrorDD 
(DD 
$strDD B
)DDB C
;DDC D
returnEE 
TaskEE 
.EE 

FromResultEE &
<EE& '
IActionResultEE' 4
>EE4 5
(EE5 6

StatusCodeEE6 @
(EE@ A
$numEEA D
,EED E
newEEF I
{EEJ K
messageEEL S
=EET U
$strEEV e
}EEf g
)EEg h
)EEh i
;EEi j
}FF 
returnHH 
TaskHH 
.HH 

FromResultHH "
<HH" #
IActionResultHH# 0
>HH0 1
(HH1 2

StatusCodeHH2 <
(HH< =
$numHH= @
,HH@ A
newHHB E
{HHF G
notificationsHHH U
=HHV W
accountHHX _
.HH_ `
NotificationsHH` m
}HHn o
)HHo p
)HHp q
;HHq r
}II 	
[KK 	

HttpDeleteKK	 
(KK 
$strKK "
)KK" #
]KK# $
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
RemoveNotificationLL) ;
(LL; <
[LL< =
FromBodyLL= E
]LLE F*
RemoveNotificationRequestModelLLG e
requestLLf m
)LLm n
{MM 	
ifNN 
(NN 
!NN 

ModelStateNN 
.NN 
IsValidNN #
)NN# $
{OO 
logPP 
.PP 
ErrorPP 
(PP 
$"PP 
$strPP .
"PP. /
)PP/ 0
;PP0 1
returnQQ 

BadRequestQQ !
(QQ! "

ModelStateQQ" ,
)QQ, -
;QQ- .
}RR 
AccountTT 
?TT 
accountTT 
=TT 
HttpContextTT *
.TT* +

GetAccountTT+ 5
(TT5 6
)TT6 7
;TT7 8
ifUU 
(UU 
accountUU 
isUU 
nullUU 
)UU  
{VV 
logWW 
.WW 
ErrorWW 
(WW 
$strWW B
)WWB C
;WWC D
returnXX 

StatusCodeXX !
(XX! "
$numXX" %
,XX% &
newXX' *
{XX+ ,
messageXX- 4
=XX5 6
$strXX7 F
}XXG H
)XXH I
;XXI J
}YY %
RemoveNotificationService[[ %
service[[& -
=[[. /
new[[0 3
([[3 4
account[[4 ;
,[[; <
accountRepository[[= N
)[[N O
;[[O P
var\\ 
response\\ 
=\\ 
await\\  
service\\! (
.\\( )
Execute\\) 0
(\\0 1
request\\1 8
.\\8 9
Id\\9 ;
!\\; <
)\\< =
;\\= >
switch]] 
(]] 
response]] 
)]] 
{^^ 
case__ 
ServiceResult__ "
.__" #
	NOT_FOUND__# ,
:__, -
return`` 

StatusCode`` %
(``% &
$num``& )
,``) *
new``+ .
{``/ 0
message``1 8
=``9 :
$str``; l
}``m n
)``n o
;``o p
caseaa 
ServiceResultaa "
.aa" #
DATABASE_ERRORaa# 1
:aa1 2
returnbb 

StatusCodebb %
(bb% &
$numbb& )
,bb) *
newbb+ .
{bb/ 0
messagebb1 8
=bb9 :
$strbb; P
}bbQ R
)bbR S
;bbS T
casecc 
ServiceResultcc "
.cc" #
ACCOUNT_NOT_FOUNDcc# 4
:cc4 5
returndd 

StatusCodedd %
(dd% &
$numdd& )
,dd) *
newdd+ .
{dd/ 0
messagedd1 8
=dd9 :
$strdd; J
}ddK L
)ddL M
;ddM N
defaultee 
:ee 
returnff 

StatusCodeff %
(ff% &
$numff& )
,ff) *
newff+ .
{ff/ 0
}ff1 2
)ff2 3
;ff3 4
}gg 
}hh 	
[jj 	
	HttpPatchjj	 
(jj 
$strjj !
)jj! "
]jj" #
publickk 
asynckk 
Taskkk 
<kk 
IActionResultkk '
>kk' (
UpdateNotificationkk) ;
(kk; <
[kk< =
FromBodykk= E
]kkE F*
UpdateNotificationRequestModelkkG e
requestkkf m
)kkm n
{ll 	
ifmm 
(mm 
!mm 

ModelStatemm 
.mm 
IsValidmm #
)mm# $
{nn 
logoo 
.oo 
Erroroo 
(oo 
$"oo 
$stroo .
"oo. /
)oo/ 0
;oo0 1
returnpp 

BadRequestpp !
(pp! "

ModelStatepp" ,
)pp, -
;pp- .
}qq 
Accountss 
?ss 
accountss 
=ss 
HttpContextss *
.ss* +

GetAccountss+ 5
(ss5 6
)ss6 7
;ss7 8
iftt 
(tt 
accounttt 
istt 
nulltt 
)tt  
{uu 
logvv 
.vv 
Errorvv 
(vv 
$strvv B
)vvB C
;vvC D
returnww 

StatusCodeww !
(ww! "
$numww" %
,ww% &
newww' *
{ww+ ,
messageww- 4
=ww5 6
$strww7 F
}wwG H
)wwH I
;wwI J
}xx %
UpdateNotificationServicezz %
servicezz& -
=zz. /
newzz0 3
(zz3 4
accountzz4 ;
,zz; <
accountRepositoryzz= N
)zzN O
;zzO P
var{{ 
response{{ 
={{ 
await{{  
service{{! (
.{{( )
Execute{{) 0
({{0 1
request{{1 8
.{{8 9
Id{{9 ;
!{{; <
,{{< =
request{{> E
.{{E F
IsRead{{F L
){{L M
;{{M N
switch|| 
(|| 
response|| 
)|| 
{}} 
case~~ 
ServiceResult~~ "
.~~" #
	NOT_FOUND~~# ,
:~~, -
return 

StatusCode %
(% &
$num& )
,) *
new+ .
{/ 0
message1 8
=9 :
$str; l
}m n
)n o
;o p
case
€€ 
ServiceResult
€€ "
.
€€" #
DATABASE_ERROR
€€# 1
:
€€1 2
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; P
}
Q R
)
R S
;
S T
case
‚‚ 
ServiceResult
‚‚ "
.
‚‚" #
ACCOUNT_NOT_FOUND
‚‚# 4
:
‚‚4 5
return
ƒƒ 

StatusCode
ƒƒ %
(
ƒƒ% &
$num
ƒƒ& )
,
ƒƒ) *
new
ƒƒ+ .
{
ƒƒ/ 0
message
ƒƒ1 8
=
ƒƒ9 :
$str
ƒƒ; J
}
ƒƒK L
)
ƒƒL M
;
ƒƒM N
default
„„ 
:
„„ 
return
…… 

StatusCode
…… %
(
……% &
$num
……& )
,
……) *
new
……+ .
{
……/ 0
}
……1 2
)
……2 3
;
……3 4
}
†† 
}
‡‡ 	
[
‰‰ 	

HttpDelete
‰‰	 
(
‰‰ 
$str
‰‰ #
)
‰‰# $
]
‰‰$ %
public
 
async
 
Task
 
<
 
IActionResult
 '
>
' ($
RemoveAllNotifications
) ?
(
? @
)
@ A
{
‹‹ 	
Account
 
?
 
account
 
=
 
HttpContext
 *
.
* +

GetAccount
+ 5
(
5 6
)
6 7
;
7 8
if
 
(
 
account
 
is
 
null
 
)
  
{
 
log
 
.
 
Error
 
(
 
$str
 B
)
B C
;
C D
return
 

StatusCode
 !
(
! "
$num
" %
,
% &
new
' *
{
+ ,
message
- 4
=
5 6
$str
7 F
}
G H
)
H I
;
I J
}
‘‘ +
RemoveAllNotificationsService
““ )
service
““* 1
=
““2 3
new
““4 7
(
““7 8
account
““8 ?
,
““? @
accountRepository
““A R
)
““R S
;
““S T
var
”” 
response
”” 
=
”” 
await
””  
service
””! (
.
””( )
Execute
””) 0
(
””0 1
)
””1 2
;
””2 3
switch
•• 
(
•• 
response
•• 
)
•• 
{
–– 
case
—— 
ServiceResult
—— "
.
——" #
	NOT_FOUND
——# ,
:
——, -
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; l
}
m n
)
n o
;
o p
case
™™ 
ServiceResult
™™ "
.
™™" #
DATABASE_ERROR
™™# 1
:
™™1 2
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; P
}
Q R
)
R S
;
S T
case
›› 
ServiceResult
›› "
.
››" #
ACCOUNT_NOT_FOUND
››# 4
:
››4 5
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
message
1 8
=
9 :
$str
; J
}
K L
)
L M
;
M N
default
 
:
 
return
 

StatusCode
 %
(
% &
$num
& )
,
) *
new
+ .
{
/ 0
}
1 2
)
2 3
;
3 4
}
 
}
   	
[
ΆΆ 	
	HttpPatch
ΆΆ	 
(
ΆΆ 
$str
ΆΆ "
)
ΆΆ" #
]
ΆΆ# $
public
££ 
async
££ 
Task
££ 
<
££ 
IActionResult
££ '
>
££' ($
UpdateAllNotifications
££) ?
(
££? @
[
££@ A
FromBody
££A I
]
££I J0
"UpdateAllNotificationsRequestModel
££K m
request
££n u
)
££u v
{
¤¤ 	
if
¥¥ 
(
¥¥ 
!
¥¥ 

ModelState
¥¥ 
.
¥¥ 
IsValid
¥¥ #
)
¥¥# $
{
¦¦ 
log
§§ 
.
§§ 
Error
§§ 
(
§§ 
$"
§§ 
$str
§§ .
"
§§. /
)
§§/ 0
;
§§0 1
return
¨¨ 

BadRequest
¨¨ !
(
¨¨! "

ModelState
¨¨" ,
)
¨¨, -
;
¨¨- .
}
©© 
Account
«« 
?
«« 
account
«« 
=
«« 
HttpContext
«« *
.
««* +

GetAccount
««+ 5
(
««5 6
)
««6 7
;
««7 8
if
¬¬ 
(
¬¬ 
account
¬¬ 
is
¬¬ 
null
¬¬ 
)
¬¬  
{
­­ 
log
®® 
.
®® 
Error
®® 
(
®® 
$str
®® B
)
®®B C
;
®®C D
return
―― 

StatusCode
―― !
(
――! "
$num
――" %
,
――% &
new
――' *
{
――+ ,
message
――- 4
=
――5 6
$str
――7 F
}
――G H
)
――H I
;
――I J
}
°° +
UpdateAllNotificationsService
²² )
service
²²* 1
=
²²2 3
new
²²4 7
(
²²7 8
account
²²8 ?
,
²²? @
accountRepository
²²A R
)
²²R S
;
²²S T
var
³³ 
response
³³ 
=
³³ 
await
³³  
service
³³! (
.
³³( )
Execute
³³) 0
(
³³0 1
request
³³1 8
.
³³8 9
IsRead
³³9 ?
)
³³? @
;
³³@ A
switch
΄΄ 
(
΄΄ 
response
΄΄ 
)
΄΄ 
{
µµ 
case
¶¶ 
ServiceResult
¶¶ "
.
¶¶" #
	NOT_FOUND
¶¶# ,
:
¶¶, -
return
·· 

StatusCode
·· %
(
··% &
$num
··& )
,
··) *
new
··+ .
{
··/ 0
message
··1 8
=
··9 :
$str
··; l
}
··m n
)
··n o
;
··o p
case
ΈΈ 
ServiceResult
ΈΈ "
.
ΈΈ" #
DATABASE_ERROR
ΈΈ# 1
:
ΈΈ1 2
return
ΉΉ 

StatusCode
ΉΉ %
(
ΉΉ% &
$num
ΉΉ& )
,
ΉΉ) *
new
ΉΉ+ .
{
ΉΉ/ 0
message
ΉΉ1 8
=
ΉΉ9 :
$str
ΉΉ; P
}
ΉΉQ R
)
ΉΉR S
;
ΉΉS T
case
ΊΊ 
ServiceResult
ΊΊ "
.
ΊΊ" #
ACCOUNT_NOT_FOUND
ΊΊ# 4
:
ΊΊ4 5
return
»» 

StatusCode
»» %
(
»»% &
$num
»»& )
,
»») *
new
»»+ .
{
»»/ 0
message
»»1 8
=
»»9 :
$str
»»; J
}
»»K L
)
»»L M
;
»»M N
default
ΌΌ 
:
ΌΌ 
return
½½ 

StatusCode
½½ %
(
½½% &
$num
½½& )
,
½½) *
new
½½+ .
{
½½/ 0
}
½½1 2
)
½½2 3
;
½½3 4
}
ΎΎ 
}
ΏΏ 	
[
ΑΑ 	
	HttpPatch
ΑΑ	 
(
ΑΑ 
$str
ΑΑ 
)
ΑΑ 
]
ΑΑ 
public
ΒΒ 
async
ΒΒ 
Task
ΒΒ 
<
ΒΒ 
IActionResult
ΒΒ '
>
ΒΒ' (
ResetPassword
ΒΒ) 6
(
ΒΒ6 7
[
ΒΒ7 8
FromBody
ΒΒ8 @
]
ΒΒ@ A'
ResetPasswordRequestModel
ΒΒB [
request
ΒΒ\ c
)
ΒΒc d
{
ΓΓ 	
if
ΔΔ 
(
ΔΔ 
!
ΔΔ 

ModelState
ΔΔ 
.
ΔΔ 
IsValid
ΔΔ #
)
ΔΔ# $
{
ΕΕ 
log
ΖΖ 
.
ΖΖ 
Error
ΖΖ 
(
ΖΖ 
$"
ΖΖ 
$str
ΖΖ .
"
ΖΖ. /
)
ΖΖ/ 0
;
ΖΖ0 1
return
ΗΗ 

BadRequest
ΗΗ !
(
ΗΗ! "

ModelState
ΗΗ" ,
)
ΗΗ, -
;
ΗΗ- .
}
ΘΘ 
Account
ΚΚ 
?
ΚΚ 
account
ΚΚ 
=
ΚΚ 
HttpContext
ΚΚ *
.
ΚΚ* +

GetAccount
ΚΚ+ 5
(
ΚΚ5 6
)
ΚΚ6 7
;
ΚΚ7 8
if
ΛΛ 
(
ΛΛ 
account
ΛΛ 
is
ΛΛ 
null
ΛΛ 
)
ΛΛ  
{
ΜΜ 
log
ΝΝ 
.
ΝΝ 
Error
ΝΝ 
(
ΝΝ 
$str
ΝΝ B
)
ΝΝB C
;
ΝΝC D
return
ΞΞ 

StatusCode
ΞΞ !
(
ΞΞ! "
$num
ΞΞ" %
,
ΞΞ% &
new
ΞΞ' *
{
ΞΞ+ ,
message
ΞΞ- 4
=
ΞΞ5 6
$str
ΞΞ7 F
}
ΞΞG H
)
ΞΞH I
;
ΞΞI J
}
ΟΟ )
ResetAccountPasswordService
ΡΡ '"
resetPasswordService
ΡΡ( <
=
ΡΡ= >
new
ΡΡ? B
(
ΡΡB C
account
ΡΡC J
,
ΡΡJ K
accountRepository
ΡΡL ]
,
ΡΡ] ^
accountValidator
ΡΡ_ o
,
ΡΡo p
mapper
ΡΡq w
)
ΡΡw x
;
ΡΡx y
var
ÒÒ 
response
ÒÒ 
=
ÒÒ 
await
ÒÒ  "
resetPasswordService
ÒÒ! 5
.
ÒÒ5 6
Execute
ÒÒ6 =
(
ÒÒ= >
request
ÒÒ> E
.
ÒÒE F
OldPassword
ÒÒF Q
!
ÒÒQ R
,
ÒÒR S
request
ÒÒT [
.
ÒÒ[ \
NewPassword
ÒÒ\ g
!
ÒÒg h
,
ÒÒh i
request
ÒÒj q
.
ÒÒq r 
ConfirmedPasswordÒÒr ƒ
!ÒÒƒ „
)ÒÒ„ …
;ÒÒ… †
switch
ΤΤ 
(
ΤΤ 
response
ΤΤ 
)
ΤΤ 
{
ΥΥ 
case
ΦΦ 
ServiceResult
ΦΦ "
.
ΦΦ" #
INVALID_OPERATION
ΦΦ# 4
:
ΦΦ4 5
return
ΧΧ 

StatusCode
ΧΧ %
(
ΧΧ% &
$num
ΧΧ& )
,
ΧΧ) *
new
ΧΧ+ .
{
ΧΧ/ 0
message
ΧΧ1 8
=
ΧΧ9 :
$str
ΧΧ; n
}
ΧΧo p
)
ΧΧp q
;
ΧΧq r
case
ΨΨ 
ServiceResult
ΨΨ "
.
ΨΨ" #
SAME_PASSWORD
ΨΨ# 0
:
ΨΨ0 1
return
ΩΩ 

StatusCode
ΩΩ %
(
ΩΩ% &
$num
ΩΩ& )
,
ΩΩ) *
new
ΩΩ+ .
{
ΩΩ/ 0
message
ΩΩ1 8
=
ΩΩ9 :
$str
ΩΩ; n
}
ΩΩo p
)
ΩΩp q
;
ΩΩq r
case
ΪΪ 
ServiceResult
ΪΪ "
.
ΪΪ" #
WRONG_PASSWORD
ΪΪ# 1
:
ΪΪ1 2
return
ΫΫ 

StatusCode
ΫΫ %
(
ΫΫ% &
$num
ΫΫ& )
,
ΫΫ) *
new
ΫΫ+ .
{
ΫΫ/ 0
message
ΫΫ1 8
=
ΫΫ9 :
$str
ΫΫ; O
}
ΫΫP Q
)
ΫΫQ R
;
ΫΫR S
case
άά 
ServiceResult
άά "
.
άά" #
ACCOUNT_NOT_FOUND
άά# 4
:
άά4 5
return
έέ 

StatusCode
έέ %
(
έέ% &
$num
έέ& )
,
έέ) *
new
έέ+ .
{
έέ/ 0
message
έέ1 8
=
έέ9 :
$str
έέ; J
}
έέK L
)
έέL M
;
έέM N
case
ήή 
ServiceResult
ήή "
.
ήή" #
DATABASE_ERROR
ήή# 1
:
ήή1 2
return
ίί 

StatusCode
ίί %
(
ίί% &
$num
ίί& )
,
ίί) *
new
ίί+ .
{
ίί/ 0
message
ίί1 8
=
ίί9 :
$str
ίί; P
}
ίίQ R
)
ίίR S
;
ίίS T
}
ΰΰ 
return
ββ 

StatusCode
ββ 
(
ββ 
$num
ββ !
,
ββ! "
new
ββ# &
{
ββ' (
}
ββ) *
)
ββ* +
;
ββ+ ,
}
γγ 	
}
δδ 
}εε ε
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/Contexts/HttpContextExtensions.cs
	namespace 	
VisualAccess
 
. 
API 
. 
Contexts #
{ 
public 

static 
class !
HttpContextExtensions -
{ 
private 
static 
readonly 
string  &

AccountKey' 1
=2 3
$str4 H
;H I
private		 
static		 
readonly		 
string		  &
RoomKey		' .
=		/ 0
$str		1 >
;		> ?
public 
static 
void 

SetAccount %
(% &
this& *
HttpContext+ 6
context7 >
,> ?
Account@ G
accountH O
)O P
{ 	
if 
( 
context 
== 
null 
)  
throw! &
new' *!
ArgumentNullException+ @
(@ A
nameofA G
(G H
contextH O
)O P
)P Q
;Q R
context 
. 
Items 
[ 

AccountKey $
]$ %
=& '
account( /
;/ 0
} 	
public 
static 
Account 
? 

GetAccount )
() *
this* .
HttpContext/ :
context; B
)B C
{ 	
return 
context 
. 
Items  
.  !
ContainsKey! ,
(, -

AccountKey- 7
)7 8
?9 :
context; B
.B C
ItemsC H
[H I

AccountKeyI S
]S T
asU W
AccountX _
:` a
nullb f
;f g
} 	
public 
static 
void 
SetRoom "
(" #
this# '
HttpContext( 3
context4 ;
,; <
Room= A
roomB F
)F G
{ 	
if 
( 
context 
== 
null 
)  
throw! &
new' *!
ArgumentNullException+ @
(@ A
nameofA G
(G H
contextH O
)O P
)P Q
;Q R
context 
. 
Items 
[ 
RoomKey !
]! "
=# $
room% )
;) *
} 	
public 
static 
Room 
? 
GetRoom #
(# $
this$ (
HttpContext) 4
context5 <
)< =
{ 	
return 
context 
. 
Items  
.  !
ContainsKey! ,
(, -
RoomKey- 4
)4 5
?6 7
context8 ?
.? @
Items@ E
[E F
RoomKeyF M
]M N
asO Q
RoomR V
:W X
nullY ]
;] ^
} 	
}   
}!! †A
q/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.API/ConfigServices.cs
	namespace 	
VisualAccess
 
. 
API 
{ 
public 

static 
class 
ConfigServices &
{ 
public 
static 
void 
	AddConfig $
($ %
this% )
IServiceCollection* <
services= E
)E F
{ 	
var 
mongoClient 
= 
new !
MongoClient" -
(- .
Environment. 9
.9 :"
GetEnvironmentVariable: P
(P Q
$strQ q
)q r
)r s
;s t
var 
mongoDatabase 
= 
mongoClient  +
.+ ,
GetDatabase, 7
(7 8
Environment8 C
.C D"
GetEnvironmentVariableD Z
(Z [
$str[ w
)w x
)x y
;y z
services 
. 
AddCors 
( 
options $
=>% '
{ 
options 
. 
AddDefaultPolicy (
(( )
builder) 0
=>1 3
{   
builder!! 
.!! 
AllowAnyOrigin!! *
(!!* +
)!!+ ,
."" 
AllowAnyHeader"" *
(""* +
)""+ ,
.## 
AllowAnyMethod## *
(##* +
)##+ ,
;##, -
}$$ 
)$$ 
;$$ 
}%% 
)%% 
;%% 
services&& 
.&& 
AddAuthentication&& &
(&&& '
)&&' (
.&&( )
AddJwtBearer&&) 5
(&&5 6
optional&&6 >
=>&&? A
optional'' 
.'' %
TokenValidationParameters'' 2
=''3 4
new''5 8%
TokenValidationParameters''9 R
{(( $
ValidateIssuerSigningKey)) ,
=))- .
true))/ 3
,))3 4
ValidIssuer** 
=**  !
Environment**" -
.**- ."
GetEnvironmentVariable**. D
(**D E
$str**E R
)**R S
!**S T
,**T U
ValidateAudience++ $
=++% &
false++' ,
,++, -
IssuerSigningKey,, $
=,,% &
new,,' * 
SymmetricSecurityKey,,+ ?
(,,? @
Encoding,,@ H
.,,H I
UTF8,,I M
.,,M N
GetBytes,,N V
(,,V W
Environment,,W b
.,,b c"
GetEnvironmentVariable,,c y
(,,y z
$str	,,z 
)
,, ‹
!
,,‹ 
)
,, 
)
,, 
}-- 
).. 
;.. 
services// 
.// 
AddAuthorization// %
(//% &
options//& -
=>//. 0
{00 
options11 
.11 
	AddPolicy11 !
(11! "
$str11" /
,11/ 0
policy111 7
=>118 :
policy22 
.22 
RequireClaim22 '
(22' (

ClaimTypes22( 2
.222 3
Actor223 8
,228 9
$str22: @
)22@ A
)22A B
;22B C
options33 
.33 
	AddPolicy33 !
(33! "
$str33" 2
,332 3
policy334 :
=>33; =
policy44 
.44 
RequireClaim44 '
(44' (

ClaimTypes44( 2
.442 3
Actor443 8
,448 9
$str44: C
)44C D
)44D E
;44E F
}55 
)55 
;55 
services77 
.77 
AddHttpClient77 "
(77" #
)77# $
;77$ %
services88 
.88 
AddSingleton88 !
(88! "
mongoDatabase88" /
)88/ 0
;880 1
services99 
.99 
AddDbContext99 !
<99! "&
VisualAccessDbContextPgSql99" <
>99< =
(99= >
opt99> A
=>99B D
opt99E H
.99H I
	UseNpgsql99I R
(99R S
Environment99S ^
.99^ _"
GetEnvironmentVariable99_ u
(99u v
$str	99v ‚
)
99‚ ƒ
!
99ƒ „
)
99„ …
)
99… †
;
99† ‡
services:: 
.:: 
AddSingleton:: !
(::! "

LogManager::" ,
.::, -
	GetLogger::- 6
(::6 7
$str::7 <
)::< =
)::= >
;::> ?
services;; 
.;; 
	AddScoped;; 
<;; 
IAccountRepository;; 1
,;;1 2
AccountRepository;;3 D
>;;D E
(;;E F
);;F G
;;;G H
services<< 
.<< 
	AddScoped<< 
<<< 
IAccountValidator<< 0
,<<0 1
AccountValidator<<2 B
><<B C
(<<C D
)<<D E
;<<E F
services== 
.== 
	AddScoped== 
<== 
IRoomValidator== -
,==- .
RoomValidator==/ <
>==< =
(=== >
)==> ?
;==? @
services>> 
.>> 
	AddScoped>> 
<>> 
IFaceRepository>> .
,>>. /
FaceRepository>>0 >
>>>> ?
(>>? @
)>>@ A
;>>A B
services?? 
.?? 
	AddScoped?? 
<?? 
IRoomRepository?? .
,??. /
RoomRepository??0 >
>??> ?
(??? @
)??@ A
;??A B
services@@ 
.@@ 
	AddScoped@@ 
<@@ %
IEntranceRecordRepository@@ 8
,@@8 9$
EntranceRecordRepository@@: R
>@@R S
(@@S T
)@@T U
;@@U V
servicesAA 
.AA 
	AddScopedAA 
<AA ,
 IRequestRoomPermissionRepositoryAA ?
,AA? @+
RequestRoomPermissionRepositoryAAA `
>AA` a
(AAa b
)AAb c
;AAc d
servicesBB 
.BB 
	AddScopedBB 
<BB '
IRequestDecisionsRepositoryBB :
,BB: ;&
RequestDecisionsRepositoryBB< V
>BBV W
(BBW X
)BBX Y
;BBY Z
servicesCC 
.CC 
	AddScopedCC 
<CC 
ITokenFactoryCC ,
,CC, -
TokenFactoryCC. :
>CC: ;
(CC; <
)CC< =
;CC= >
servicesDD 
.DD 
	AddScopedDD 
<DD 
IAccountFactoryDD .
,DD. /
AccountFactoryDD0 >
>DD> ?
(DD? @
)DD@ A
;DDA B
servicesEE 
.EE 
	AddScopedEE 
<EE +
ITemporaryRoomPermissionFactoryEE >
,EE> ?*
TemporaryRoomPermissionFactoryEE@ ^
>EE^ _
(EE_ `
)EE` a
;EEa b
servicesFF 
.FF 
	AddScopedFF 
<FF  
INotificationFactoryFF 3
,FF3 4
NotificationFactoryFF5 H
>FFH I
(FFI J
)FFJ K
;FFK L
servicesGG 
.GG 
	AddScopedGG 
<GG )
IRequestRoomPermissionFactoryGG <
,GG< =(
RequestRoomPermissionFactoryGG> Z
>GGZ [
(GG[ \
)GG\ ]
;GG] ^
servicesHH 
.HH 
	AddScopedHH 
<HH 
IRoomFactoryHH +
,HH+ ,
RoomFactoryHH- 8
>HH8 9
(HH9 :
)HH: ;
;HH; <
servicesII 
.II 
	AddScopedII 
<II )
IFaceRecognitionServiceClientII <
,II< =(
FaceRecognitionServiceClientII> Z
>IIZ [
(II[ \
)II\ ]
;II] ^
servicesJJ 
.JJ 
	AddScopedJJ 
<JJ 
IGenericMapperJJ -
,JJ- .
GenericMapperJJ/ <
>JJ< =
(JJ= >
)JJ> ?
;JJ? @
servicesKK 
.KK 
	AddScopedKK 
<KK (
VisualAccessDbContextMongoDBKK ;
>KK; <
(KK< =
)KK= >
;KK> ?
}MM 	
}NN 
}OO 