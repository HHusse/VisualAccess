¯
ä/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Validators/IRoomValidator.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )

Validators) 3
{ 
public 

	interface 
IRoomValidator #
{ 
public 
bool 
VerifyPassword "
(" #
Room# '
room( ,
,, -
string. 4
password5 =
)= >
;> ?
}		 
}

 Í
ç/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Validators/IAccountValidator.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )

Validators) 3
{ 
public 

	interface 
IAccountValidator &
{ 
public 
bool 
VerifyPassword "
(" #
Account# *
account+ 2
,2 3
string4 :
password; C
)C D
;D E
public		 
bool		 
IsValidEmail		  
(		  !
string		! '
email		( -
)		- .
;		. /
public

 
bool

 
IsValidPhoneNumber

 &
(

& '
string

' -
phoneNumber

. 9
)

9 :
;

: ;
public 
bool 
IsValidUsername #
(# $
string$ *
username+ 3
)3 4
;4 5
public 
Task 
< 
bool 
>  
UsernameAlreadyExist .
(. /
string/ 5
username6 >
)> ?
;? @
public 
Task 
< 
bool 
> 
EmailAlreadyExist +
(+ ,
string, 2
email3 8
)8 9
;9 :
} 
} °	
ù/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/ServicesClient/IFaceRecognitionServiceClient.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
ServicesClient) 7
{ 
public 

	interface )
IFaceRecognitionServiceClient 2
{ 
public 
Task 
< 
( !
FaceRecognitionResult *
,* +
int, /
?/ 0
)0 1
>1 2
RegisterFaceAsync3 D
(D E
MemoryStreamE Q

faceStreamR \
)\ ]
;] ^
public		 
Task		 
<		 
(		 !
FaceRecognitionResult		 *
,		* +
int		, /
?		/ 0
)		0 1
>		1 2
VerifyFaceAsync		3 B
(		B C
MemoryStream		C O

faceStream		P Z
)		Z [
;		[ \
public

 
Task

 
RefreshCache

  
(

  !
)

! "
;

" #
} 
} ﬂ
ç/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Repositories/IRoomRepository.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Repositories) 5
{ 
public 

	interface 
IRoomRepository $
{ 
public		 
Task		 
<		 
DatabaseResult		 "
>		" #

AddNewRoom		$ .
(		. /
Room		/ 3
room		4 8
)		8 9
;		9 :
public

 
Task

 
<

 
DatabaseResult

 "
>

" #

RemoveRoom

$ .
(

. /
Room

/ 3
room

4 8
)

8 9
;

9 :
public 
Task 
< 
IDtoBase 
? 
> 
GetRoom &
(& '
string' -
roomName. 6
)6 7
;7 8
public 
Task 
< 
DatabaseResult "
>" #
	RoomExist$ -
(- .
string. 4
roomName5 =
)= >
;> ?
public 
Task 
< 
IEnumerable 
<  
IDtoBase  (
>( )
>) *
GetRoomsByPage+ 9
(9 :
int: =

pageNumber> H
,H I
intJ M
pageSizeN V
=W X
$numY Z
)Z [
;[ \
public 
Task 
< 
long 
> 
GetRoomsCount '
(' (
)( )
;) *
} 
} ˝
û/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Repositories/IRequestRoomPermissionRepository.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Repositories) 5
{ 
public 

	interface ,
 IRequestRoomPermissionRepository 5
{ 
public		 
Task		 
<		 
DatabaseResult		 "
>		" #
CreateRequest		$ 1
(		1 2!
RequestRoomPermission		2 G!
requestRoomPermission		H ]
)		] ^
;		^ _
public

 
Task

 
<

 
DatabaseResult

 "
>

" #
DeleteRequest

$ 1
(

1 2!
RequestRoomPermission

2 G!
requestRoomPermission

H ]
)

] ^
;

^ _
public 
Task 
< 
IDtoBase 
? 
> 
GetById &
(& '
string' -
	requestId. 7
)7 8
;8 9
public 
Task 
< 
IEnumerable 
<  
IDtoBase  (
>( )
>) *
	GetByPage+ 4
(4 5
int5 8

pageNumber9 C
,C D
intE H
pageSizeI Q
=R S
$numT U
)U V
;V W
public 
Task 
< 
bool 
> 
RequestExists '
(' (
string( .
username/ 7
,7 8
string9 ?
roomName@ H
)H I
;I J
public 
Task 
< 
long 
> 
GetRequestsCount *
(* +
)+ ,
;, -
} 
} ¶	
ô/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Repositories/IRequestDecisionsRepository.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Repositories) 5
;5 6
public 
	interface '
IRequestDecisionsRepository ,
{ 
public 

Task 
< 
DatabaseResult 
> 
AddRequestDecision  2
(2 3
RequestDecisions3 C
requestDecisionD S
)S T
;T U
public		 

Task		 
<		 
IEnumerable		 
<		 
IDtoBase		 $
>		$ %
>		% &$
GetRequestDecisionByPage		' ?
(		? @
int		@ C

pageNumber		D N
,		N O
int		P S
pageSize		T \
=		] ^
$num		_ `
)		` a
;		a b
public

 

Task

 
<

 
long

 
>

 
GetRequestsCount

 &
(

& '
)

' (
;

( )
} ¯
ç/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Repositories/IFaceRepository.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Repositories) 5
{ 
public 

	interface 
IFaceRepository $
{ 
public		 
Task		 
<		 
DatabaseResult		 "
>		" #

RemoveFace		$ .
(		. /
int		/ 2
id		3 5
)		5 6
;		6 7
}

 
} π	
ó/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Repositories/IEntranceRecordRepository.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Repositories) 5
{ 
public 

	interface %
IEntranceRecordRepository .
{ 
public		 
Task		 
<		 
DatabaseResult		 "
>		" # 
CreateEntranceRecord		$ 8
(		8 9
EntranceRecord		9 G
entranceRecord		H V
)		V W
;		W X
public

 
Task

 
<

 
IEnumerable

 
<

  
IDtoBase

  (
>

( )
>

) *$
GetEntranceRecordsByPage

+ C
(

C D
int

D G

pageNumber

H R
,

R S
int

T W
pageSize

X `
=

a b
$num

c d
)

d e
;

e f
public 
Task 
< 
long 
> #
GetEntranceRecordsCount 1
(1 2
)2 3
;3 4
} 
} í
ê/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Repositories/IAccountRepository.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Repositories) 5
{ 
public 

	interface 
IAccountRepository '
{ 
public		 
Task		 
<		 
DatabaseResult		 "
>		" #
CreateAccount		$ 1
(		1 2
Account		2 9
account		: A
)		A B
;		B C
public

 
Task

 
<

 
DatabaseResult

 "
>

" #
UpdateAccount

$ 1
(

1 2
Account

2 9
account

: A
)

A B
;

B C
public 
Task 
< 
DatabaseResult "
>" #
RemoveAccount$ 1
(1 2
Account2 9
account: A
)A B
;B C
public 
Task 
< 
IDtoBase 
? 
> 

GetAccount )
() *
string* 0
username1 9
)9 :
;: ;
public 
Task 
< 
IDtoBase 
? 
> 

GetAccount )
() *
int* -
faceId. 4
)4 5
;5 6
public 
Task 
< 
IEnumerable 
<  
IDtoBase  (
>( )
>) *
GetAccountsByPage+ <
(< =
int= @

pageNumberA K
,K L
intM P
pageSizeQ Y
=Z [
$num\ ]
)] ^
;^ _
public 
Task 
< 
long 
> 
GetAccountCount )
() *
)* +
;+ ,
public 
Task 
< 
bool 
> 
UsernameExist '
(' (
string( .
username/ 7
)7 8
;8 9
public 
Task 
< 
bool 
> 

EmailExist $
($ %
string% +
email, 1
)1 2
;2 3
public 
Task 
< 
bool 
> !
FaceAlreadyAssociated /
(/ 0
int0 3
faceId4 :
): ;
;; <
public 
Task 
< 
DatabaseResult "
>" #.
"CleanupPermissionsAfterRoomRemoval$ F
(F G
stringG M
roomNameN V
)V W
;W X
} 
} ó
á/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Mappers/IGenericMapper.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
Mappers) 0
{ 
public 

	interface 
IGenericMapper #
{ 
public 
TDestination 
Map 
<  
TSource  '
,' (
TDestination) 5
>5 6
(6 7
TSource7 >
source? E
)E F
;F G
} 
} »
à/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Factories/ITokenFactory.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
	Factories) 2
{ 
public 

	interface 
ITokenFactory "
{ 
public 
string 
Create 
( 
Account $
account% ,
), -
;- .
public		 
string		 
Create		 
(		 
Room		 !
room		" &
)		& '
;		' (
}

 
} ∆
ö/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Factories/ITemporaryRoomPermissionFactory.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
	Factories) 2
;2 3
public 
	interface +
ITemporaryRoomPermissionFactory 0
{ 
public 
#
TemporaryRoomPermission "
Create# )
() *
string* 0
roomName1 9
,9 :
long; ?
from@ D
,D E
longF J
untilK P
)P Q
;Q R
} §
á/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Factories/IRoomFactory.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
	Factories) 2
{ 
public 

	interface 
IRoomFactory !
{ 
public 
Room 
Create 
( 
string !
name" &
,& '
string( .
password/ 7
,7 8
long9 =
	createdAt> G
)G H
;H I
}

 
} Ä
ò/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Factories/IRequestRoomPermissionFactory.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
	Factories) 2
{ 
public 

	interface )
IRequestRoomPermissionFactory 2
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
;		t u
}

 
} ˆ
è/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Factories/INotificationFactory.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
	Factories) 2
;2 3
public 
	interface  
INotificationFactory %
{ 
public 

Notification 
Create 
( 
string %
from& *
,* +
string, 2
messageText3 >
)> ?
;? @
} ñ
ä/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Interfaces/Factories/IAccountFactory.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Interfaces (
.( )
	Factories) 2
{ 
public 

	interface 
IAccountFactory $
{ 
public		 
Account		 
Create		 
(		 
string		 $
	firstName		% .
,		. /
string		0 6
lastName		7 ?
,		? @
string		A G
username		H P
,		P Q
string		R X
email		Y ^
,		^ _
string		` f
password		g o
,		o p
string		q w
address		x 
,			 Ä
string
		Å á
phoneNumber
		à ì
,
		ì î
Role
		ï ô
role
		ö û
,
		û ü
long
		† §
	createdAt
		• Æ
)
		Æ Ø
;
		Ø ∞
}

 
} ™
}/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Exceptions/LogException.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 

Exceptions (
{ 
public 

static 
class 
ExceptionLogger '
{ 
public 
static 
void 
Log 
( 
ILog #
log$ '
,' (
	Exception) 2
e3 4
)4 5
{		 	
log

 
.

 
Error

 
(

 
$"

 
$str

 '
{

' (
e

( )
.

) *
Message

* 1
.

1 2
Trim

2 6
(

6 7
)

7 8
}

8 9
"

9 :
)

: ;
;

; <
if 
( 
e 
. 
InnerException  
is! #
not$ '
null( ,
), -
{ 
var !
innerExceptionMessage )
=* +
e, -
.- .
InnerException. <
.< =
Message= D
;D E
var 
detailIndex 
=  !!
innerExceptionMessage" 7
.7 8
IndexOf8 ?
(? @
$str@ I
)I J
;J K
if 
( 
detailIndex 
>=  "
$num# $
)$ %
{ !
innerExceptionMessage )
=* +!
innerExceptionMessage, A
.A B
	SubstringB K
(K L
$numL M
,M N
detailIndexO Z
)Z [
;[ \
} 
log 
. 
Error 
( 
$" 
$str 4
{4 5!
innerExceptionMessage5 J
.J K
TrimK O
(O P
)P Q
}Q R
"R S
)S T
;T U
} 
} 	
} 
} Ç
Ä/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Enumerations/ServiceResult.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Enumerations *
{ 
public 

enum 
ServiceResult 
{ 
OK 

,
 
INVALID_USERNAME 
, 
INVALID_EMAIL 
,  
INVALID_PHONE_NUMBER		 
,		 
INVALID_OPERATION

 
,

 !
ACCOUNT_ALREADY_EXIST 
, 
EMAIL_ALREADY_EXIST 
, 
ACCOUNT_NOT_FOUND 
, 
ROOM_NOT_FOUND 
, 
ROOM_ALREADY_EXIST 
, 
WRONG_PASSWORD 
, !
FACE_ASSOCIATION_FAIL 
, 
FACE_NOT_FOUND 
, 
FACE_ALREADY_EXIST 
, 
FACE_NOT_REGISTERD 
, %
ACCOUNT_HAS_NO_PERMISSION !
,! "
	NOT_FOUND 
, 
SAME_PASSWORD 
, )
ROOM_PERMISSION_ALREADY_EXIST %
,% &!
REQUEST_ALREADY_EXIST 
, 
REQUEST_NOT_FOUND 
, 
UNKNOWN_ERROR 
, 
DATABASE_ERROR 
} 
} π
w/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Enumerations/Role.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Enumerations *
{ 
public 

enum 
Role 
{ 
ADMIN 
, 
HR 

,
 
PERSON 
}		 
}

 Ã
å/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Enumerations/RequestRoomPermissionType.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Enumerations *
{ 
public 

enum %
RequestRoomPermissionType )
{ 
	PERMANENT 
, 
	TEMPORARY 
} 
}		 ª
à/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Enumerations/FaceRecognitionResult.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Enumerations *
{ 
public 

enum !
FaceRecognitionResult %
{ 
OK 

,
 
ALREADY_EXIST 
, 
	NOT_FOUND 
, 
NOT_REGISTERD		 
,		 
UNKNOWN_ERROR

 
} 
} Ó
Å/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Enumerations/DatabaseResult.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Enumerations *
{ 
public 

enum 
DatabaseResult 
{ 
OK 

,
 
ACCOUNT_NOT_FOUND 
, !
ACCOUNT_AlREADY_EXIST 
, 
NO_FACE_ASSOCIATED		 
,		 
FACE_NOT_FOUND

 
,

 #
FACE_ALREADY_ASSOCIATED 
,  
ROOM_ALREADY_EXIST 
, 

ROOM_EXIST 
, 
ROOM_NOT_FOUND 
, %
ROOM_PERMISSION_NOT_FOUND !
,! ")
ROOM_PERMISSION_ALREADY_EXIST %
,% &
REQUEST_NOT_FOUND 
, 
INVALID_OPERATION 
, 
UNKNOWN_ERROR 
} 
} ®
Ü/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/TemporaryRoomPermission.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

class #
TemporaryRoomPermission (
{ 
public 
string 
Room 
{ 
get  
;  !
set" %
;% &
}' (
=) *
new+ .
(. /
$str/ 1
)1 2
;2 3
public 
long 
From 
{ 
get 
; 
set  #
;# $
}% &
public 
long 
Until 
{ 
get 
;  
set! $
;$ %
}& '
}		 
}

 ﬂ	
s/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/Room.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

class 
Room 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
=' (
new) ,
(, -
$str- /
)/ 0
;0 1
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
new+ .
(. /
$str/ 1
)1 2
;2 3
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
(2 3
$str3 5
)5 6
;6 7
public		 
long		 
	CreatedAt		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
}

 
} Ë
v/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/DtoBase.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

	interface 
IDtoBase 
{ 
} 
} ˜

Ñ/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/RequestRoomPermission.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

class !
RequestRoomPermission &
{ 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
public		 %
RequestRoomPermissionType		 (
Type		) -
{		. /
get		0 3
;		3 4
set		5 8
;		8 9
}		: ;
public

 
string

 
Username

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
=

- .
new

/ 2
(

2 3
$str

3 5
)

5 6
;

6 7
public 
string 
RoomName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
(2 3
$str3 5
)5 6
;6 7
public 
string 
? 
RequestMessage %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} É
}/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/EntranceRecord.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

record 
EntranceRecord  
(  !
string! '
id( *
,* +
string, 2
username3 ;
,; <
string= C
roomNameD L
,L M
longN R
timeS W
,W X
boolY ]

hasEntered^ h
)h i
;i j
} …
/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/RequestDecisions.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
;& '
public 
record 
RequestDecisions 
( 
string %
id& (
,( )
string* 0
approver1 9
,9 :
string; A
usernameB J
,J K
stringL R
roomS W
,W X%
RequestRoomPermissionTypeY r
types w
,w x
booly }

isApproved	~ à
)
à â
;
â äü	
{/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/Notification.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

class 
Notification 
{ 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
From 
{ 
get  
;  !
set" %
;% &
}' (
=) *
new+ .
(. /
$str/ 1
)1 2
;2 3
public 
string 
MessageText !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
new2 5
(5 6
$str6 8
)8 9
;9 :
public		 
bool		 
IsRead		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} ∑
v/Users/hosseinvahidazari/Projects/GitHub/VisualAccess/visualaccess.backend/src/VisualAccess.Domain/Entities/Account.cs
	namespace 	
VisualAccess
 
. 
Domain 
. 
Entities &
{ 
public 

class 
Account 
{ 
public 
string 
? 
Id 
{ 
get 
;  
set! $
;$ %
}& '
public		 
string		 
	FirstName		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
=		. /
new		0 3
(		3 4
$str		4 6
)		6 7
;		7 8
public

 
string

 
LastName

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
=

- .
new

/ 2
(

2 3
$str

3 5
)

5 6
;

6 7
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
(2 3
$str3 5
)5 6
;6 7
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
new, /
(/ 0
$str0 2
)2 3
;3 4
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
new/ 2
(2 3
$str3 5
)5 6
;6 7
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
new. 1
(1 2
$str2 4
)4 5
;5 6
public 
string 
PhoneNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
new2 5
(5 6
$str6 8
)8 9
;9 :
public 
Role 
Role 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
? 
FaceID 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
string 
> 
AllowedRooms (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
=7 8
new9 <
(< =
)= >
;> ?
public 
List 
< 
Notification  
>  !
Notifications" /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
=> ?
new@ C
(C D
)D E
;E F
public 
List 
< #
TemporaryRoomPermission +
>+ ,$
TemporaryRoomPermissions- E
{F G
getH K
;K L
setM P
;P Q
}R S
=T U
newV Y
(Y Z
)Z [
;[ \
public 
long 
	CreatedAt 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 