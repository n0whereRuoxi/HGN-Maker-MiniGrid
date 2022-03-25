( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3163010 - OBJ
      ?auto_3163009 - LOCATION
    )
    :vars
    (
      ?auto_3163012 - LOCATION
      ?auto_3163013 - CITY
      ?auto_3163011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3163012 ?auto_3163013 ) ( IN-CITY ?auto_3163009 ?auto_3163013 ) ( not ( = ?auto_3163009 ?auto_3163012 ) ) ( OBJ-AT ?auto_3163010 ?auto_3163012 ) ( TRUCK-AT ?auto_3163011 ?auto_3163009 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3163011 ?auto_3163009 ?auto_3163012 ?auto_3163013 )
      ( !LOAD-TRUCK ?auto_3163010 ?auto_3163011 ?auto_3163012 )
      ( !DRIVE-TRUCK ?auto_3163011 ?auto_3163012 ?auto_3163009 ?auto_3163013 )
      ( !UNLOAD-TRUCK ?auto_3163010 ?auto_3163011 ?auto_3163009 )
      ( DELIVER-1PKG-VERIFY ?auto_3163010 ?auto_3163009 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3163031 - OBJ
      ?auto_3163032 - OBJ
      ?auto_3163030 - LOCATION
    )
    :vars
    (
      ?auto_3163034 - LOCATION
      ?auto_3163033 - CITY
      ?auto_3163036 - LOCATION
      ?auto_3163035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3163034 ?auto_3163033 ) ( IN-CITY ?auto_3163030 ?auto_3163033 ) ( not ( = ?auto_3163030 ?auto_3163034 ) ) ( OBJ-AT ?auto_3163032 ?auto_3163034 ) ( IN-CITY ?auto_3163036 ?auto_3163033 ) ( not ( = ?auto_3163030 ?auto_3163036 ) ) ( OBJ-AT ?auto_3163031 ?auto_3163036 ) ( TRUCK-AT ?auto_3163035 ?auto_3163030 ) ( not ( = ?auto_3163031 ?auto_3163032 ) ) ( not ( = ?auto_3163034 ?auto_3163036 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3163031 ?auto_3163030 )
      ( DELIVER-1PKG ?auto_3163032 ?auto_3163030 )
      ( DELIVER-2PKG-VERIFY ?auto_3163031 ?auto_3163032 ?auto_3163030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3163142 - OBJ
      ?auto_3163143 - OBJ
      ?auto_3163144 - OBJ
      ?auto_3163141 - LOCATION
    )
    :vars
    (
      ?auto_3163147 - LOCATION
      ?auto_3163146 - CITY
      ?auto_3163148 - LOCATION
      ?auto_3163149 - LOCATION
      ?auto_3163145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3163147 ?auto_3163146 ) ( IN-CITY ?auto_3163141 ?auto_3163146 ) ( not ( = ?auto_3163141 ?auto_3163147 ) ) ( OBJ-AT ?auto_3163144 ?auto_3163147 ) ( IN-CITY ?auto_3163148 ?auto_3163146 ) ( not ( = ?auto_3163141 ?auto_3163148 ) ) ( OBJ-AT ?auto_3163143 ?auto_3163148 ) ( IN-CITY ?auto_3163149 ?auto_3163146 ) ( not ( = ?auto_3163141 ?auto_3163149 ) ) ( OBJ-AT ?auto_3163142 ?auto_3163149 ) ( TRUCK-AT ?auto_3163145 ?auto_3163141 ) ( not ( = ?auto_3163142 ?auto_3163143 ) ) ( not ( = ?auto_3163148 ?auto_3163149 ) ) ( not ( = ?auto_3163142 ?auto_3163144 ) ) ( not ( = ?auto_3163143 ?auto_3163144 ) ) ( not ( = ?auto_3163147 ?auto_3163148 ) ) ( not ( = ?auto_3163147 ?auto_3163149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3163142 ?auto_3163143 ?auto_3163141 )
      ( DELIVER-1PKG ?auto_3163144 ?auto_3163141 )
      ( DELIVER-3PKG-VERIFY ?auto_3163142 ?auto_3163143 ?auto_3163144 ?auto_3163141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3164276 - OBJ
      ?auto_3164277 - OBJ
      ?auto_3164278 - OBJ
      ?auto_3164279 - OBJ
      ?auto_3164275 - LOCATION
    )
    :vars
    (
      ?auto_3164282 - LOCATION
      ?auto_3164280 - CITY
      ?auto_3164283 - LOCATION
      ?auto_3164284 - LOCATION
      ?auto_3164281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3164282 ?auto_3164280 ) ( IN-CITY ?auto_3164275 ?auto_3164280 ) ( not ( = ?auto_3164275 ?auto_3164282 ) ) ( OBJ-AT ?auto_3164279 ?auto_3164282 ) ( OBJ-AT ?auto_3164278 ?auto_3164282 ) ( IN-CITY ?auto_3164283 ?auto_3164280 ) ( not ( = ?auto_3164275 ?auto_3164283 ) ) ( OBJ-AT ?auto_3164277 ?auto_3164283 ) ( IN-CITY ?auto_3164284 ?auto_3164280 ) ( not ( = ?auto_3164275 ?auto_3164284 ) ) ( OBJ-AT ?auto_3164276 ?auto_3164284 ) ( TRUCK-AT ?auto_3164281 ?auto_3164275 ) ( not ( = ?auto_3164276 ?auto_3164277 ) ) ( not ( = ?auto_3164283 ?auto_3164284 ) ) ( not ( = ?auto_3164276 ?auto_3164278 ) ) ( not ( = ?auto_3164277 ?auto_3164278 ) ) ( not ( = ?auto_3164282 ?auto_3164283 ) ) ( not ( = ?auto_3164282 ?auto_3164284 ) ) ( not ( = ?auto_3164276 ?auto_3164279 ) ) ( not ( = ?auto_3164277 ?auto_3164279 ) ) ( not ( = ?auto_3164278 ?auto_3164279 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3164276 ?auto_3164277 ?auto_3164278 ?auto_3164275 )
      ( DELIVER-1PKG ?auto_3164279 ?auto_3164275 )
      ( DELIVER-4PKG-VERIFY ?auto_3164276 ?auto_3164277 ?auto_3164278 ?auto_3164279 ?auto_3164275 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3164335 - OBJ
      ?auto_3164336 - OBJ
      ?auto_3164337 - OBJ
      ?auto_3164338 - OBJ
      ?auto_3164334 - LOCATION
    )
    :vars
    (
      ?auto_3164342 - LOCATION
      ?auto_3164339 - CITY
      ?auto_3164341 - LOCATION
      ?auto_3164343 - LOCATION
      ?auto_3164340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3164342 ?auto_3164339 ) ( IN-CITY ?auto_3164334 ?auto_3164339 ) ( not ( = ?auto_3164334 ?auto_3164342 ) ) ( OBJ-AT ?auto_3164338 ?auto_3164342 ) ( OBJ-AT ?auto_3164336 ?auto_3164342 ) ( IN-CITY ?auto_3164341 ?auto_3164339 ) ( not ( = ?auto_3164334 ?auto_3164341 ) ) ( OBJ-AT ?auto_3164337 ?auto_3164341 ) ( IN-CITY ?auto_3164343 ?auto_3164339 ) ( not ( = ?auto_3164334 ?auto_3164343 ) ) ( OBJ-AT ?auto_3164335 ?auto_3164343 ) ( TRUCK-AT ?auto_3164340 ?auto_3164334 ) ( not ( = ?auto_3164335 ?auto_3164337 ) ) ( not ( = ?auto_3164341 ?auto_3164343 ) ) ( not ( = ?auto_3164335 ?auto_3164336 ) ) ( not ( = ?auto_3164337 ?auto_3164336 ) ) ( not ( = ?auto_3164342 ?auto_3164341 ) ) ( not ( = ?auto_3164342 ?auto_3164343 ) ) ( not ( = ?auto_3164335 ?auto_3164338 ) ) ( not ( = ?auto_3164337 ?auto_3164338 ) ) ( not ( = ?auto_3164336 ?auto_3164338 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3164335 ?auto_3164337 ?auto_3164336 ?auto_3164338 ?auto_3164334 )
      ( DELIVER-4PKG-VERIFY ?auto_3164335 ?auto_3164336 ?auto_3164337 ?auto_3164338 ?auto_3164334 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3164367 - OBJ
      ?auto_3164368 - OBJ
      ?auto_3164369 - OBJ
      ?auto_3164370 - OBJ
      ?auto_3164366 - LOCATION
    )
    :vars
    (
      ?auto_3164371 - LOCATION
      ?auto_3164374 - CITY
      ?auto_3164372 - LOCATION
      ?auto_3164373 - LOCATION
      ?auto_3164375 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3164371 ?auto_3164374 ) ( IN-CITY ?auto_3164366 ?auto_3164374 ) ( not ( = ?auto_3164366 ?auto_3164371 ) ) ( OBJ-AT ?auto_3164369 ?auto_3164371 ) ( OBJ-AT ?auto_3164368 ?auto_3164371 ) ( IN-CITY ?auto_3164372 ?auto_3164374 ) ( not ( = ?auto_3164366 ?auto_3164372 ) ) ( OBJ-AT ?auto_3164370 ?auto_3164372 ) ( IN-CITY ?auto_3164373 ?auto_3164374 ) ( not ( = ?auto_3164366 ?auto_3164373 ) ) ( OBJ-AT ?auto_3164367 ?auto_3164373 ) ( TRUCK-AT ?auto_3164375 ?auto_3164366 ) ( not ( = ?auto_3164367 ?auto_3164370 ) ) ( not ( = ?auto_3164372 ?auto_3164373 ) ) ( not ( = ?auto_3164367 ?auto_3164368 ) ) ( not ( = ?auto_3164370 ?auto_3164368 ) ) ( not ( = ?auto_3164371 ?auto_3164372 ) ) ( not ( = ?auto_3164371 ?auto_3164373 ) ) ( not ( = ?auto_3164367 ?auto_3164369 ) ) ( not ( = ?auto_3164370 ?auto_3164369 ) ) ( not ( = ?auto_3164368 ?auto_3164369 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3164367 ?auto_3164368 ?auto_3164370 ?auto_3164369 ?auto_3164366 )
      ( DELIVER-4PKG-VERIFY ?auto_3164367 ?auto_3164368 ?auto_3164369 ?auto_3164370 ?auto_3164366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3164956 - OBJ
      ?auto_3164957 - OBJ
      ?auto_3164958 - OBJ
      ?auto_3164959 - OBJ
      ?auto_3164955 - LOCATION
    )
    :vars
    (
      ?auto_3164960 - LOCATION
      ?auto_3164963 - CITY
      ?auto_3164961 - LOCATION
      ?auto_3164962 - LOCATION
      ?auto_3164964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3164960 ?auto_3164963 ) ( IN-CITY ?auto_3164955 ?auto_3164963 ) ( not ( = ?auto_3164955 ?auto_3164960 ) ) ( OBJ-AT ?auto_3164959 ?auto_3164960 ) ( OBJ-AT ?auto_3164956 ?auto_3164960 ) ( IN-CITY ?auto_3164961 ?auto_3164963 ) ( not ( = ?auto_3164955 ?auto_3164961 ) ) ( OBJ-AT ?auto_3164958 ?auto_3164961 ) ( IN-CITY ?auto_3164962 ?auto_3164963 ) ( not ( = ?auto_3164955 ?auto_3164962 ) ) ( OBJ-AT ?auto_3164957 ?auto_3164962 ) ( TRUCK-AT ?auto_3164964 ?auto_3164955 ) ( not ( = ?auto_3164957 ?auto_3164958 ) ) ( not ( = ?auto_3164961 ?auto_3164962 ) ) ( not ( = ?auto_3164957 ?auto_3164956 ) ) ( not ( = ?auto_3164958 ?auto_3164956 ) ) ( not ( = ?auto_3164960 ?auto_3164961 ) ) ( not ( = ?auto_3164960 ?auto_3164962 ) ) ( not ( = ?auto_3164957 ?auto_3164959 ) ) ( not ( = ?auto_3164958 ?auto_3164959 ) ) ( not ( = ?auto_3164956 ?auto_3164959 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3164957 ?auto_3164956 ?auto_3164958 ?auto_3164959 ?auto_3164955 )
      ( DELIVER-4PKG-VERIFY ?auto_3164956 ?auto_3164957 ?auto_3164958 ?auto_3164959 ?auto_3164955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3164988 - OBJ
      ?auto_3164989 - OBJ
      ?auto_3164990 - OBJ
      ?auto_3164991 - OBJ
      ?auto_3164987 - LOCATION
    )
    :vars
    (
      ?auto_3164992 - LOCATION
      ?auto_3164995 - CITY
      ?auto_3164993 - LOCATION
      ?auto_3164994 - LOCATION
      ?auto_3164996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3164992 ?auto_3164995 ) ( IN-CITY ?auto_3164987 ?auto_3164995 ) ( not ( = ?auto_3164987 ?auto_3164992 ) ) ( OBJ-AT ?auto_3164990 ?auto_3164992 ) ( OBJ-AT ?auto_3164988 ?auto_3164992 ) ( IN-CITY ?auto_3164993 ?auto_3164995 ) ( not ( = ?auto_3164987 ?auto_3164993 ) ) ( OBJ-AT ?auto_3164991 ?auto_3164993 ) ( IN-CITY ?auto_3164994 ?auto_3164995 ) ( not ( = ?auto_3164987 ?auto_3164994 ) ) ( OBJ-AT ?auto_3164989 ?auto_3164994 ) ( TRUCK-AT ?auto_3164996 ?auto_3164987 ) ( not ( = ?auto_3164989 ?auto_3164991 ) ) ( not ( = ?auto_3164993 ?auto_3164994 ) ) ( not ( = ?auto_3164989 ?auto_3164988 ) ) ( not ( = ?auto_3164991 ?auto_3164988 ) ) ( not ( = ?auto_3164992 ?auto_3164993 ) ) ( not ( = ?auto_3164992 ?auto_3164994 ) ) ( not ( = ?auto_3164989 ?auto_3164990 ) ) ( not ( = ?auto_3164991 ?auto_3164990 ) ) ( not ( = ?auto_3164988 ?auto_3164990 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3164989 ?auto_3164988 ?auto_3164991 ?auto_3164990 ?auto_3164987 )
      ( DELIVER-4PKG-VERIFY ?auto_3164988 ?auto_3164989 ?auto_3164990 ?auto_3164991 ?auto_3164987 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3165176 - OBJ
      ?auto_3165177 - OBJ
      ?auto_3165178 - OBJ
      ?auto_3165179 - OBJ
      ?auto_3165175 - LOCATION
    )
    :vars
    (
      ?auto_3165180 - LOCATION
      ?auto_3165183 - CITY
      ?auto_3165181 - LOCATION
      ?auto_3165182 - LOCATION
      ?auto_3165184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3165180 ?auto_3165183 ) ( IN-CITY ?auto_3165175 ?auto_3165183 ) ( not ( = ?auto_3165175 ?auto_3165180 ) ) ( OBJ-AT ?auto_3165177 ?auto_3165180 ) ( OBJ-AT ?auto_3165176 ?auto_3165180 ) ( IN-CITY ?auto_3165181 ?auto_3165183 ) ( not ( = ?auto_3165175 ?auto_3165181 ) ) ( OBJ-AT ?auto_3165179 ?auto_3165181 ) ( IN-CITY ?auto_3165182 ?auto_3165183 ) ( not ( = ?auto_3165175 ?auto_3165182 ) ) ( OBJ-AT ?auto_3165178 ?auto_3165182 ) ( TRUCK-AT ?auto_3165184 ?auto_3165175 ) ( not ( = ?auto_3165178 ?auto_3165179 ) ) ( not ( = ?auto_3165181 ?auto_3165182 ) ) ( not ( = ?auto_3165178 ?auto_3165176 ) ) ( not ( = ?auto_3165179 ?auto_3165176 ) ) ( not ( = ?auto_3165180 ?auto_3165181 ) ) ( not ( = ?auto_3165180 ?auto_3165182 ) ) ( not ( = ?auto_3165178 ?auto_3165177 ) ) ( not ( = ?auto_3165179 ?auto_3165177 ) ) ( not ( = ?auto_3165176 ?auto_3165177 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3165178 ?auto_3165176 ?auto_3165179 ?auto_3165177 ?auto_3165175 )
      ( DELIVER-4PKG-VERIFY ?auto_3165176 ?auto_3165177 ?auto_3165178 ?auto_3165179 ?auto_3165175 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3179768 - OBJ
      ?auto_3179769 - OBJ
      ?auto_3179770 - OBJ
      ?auto_3179771 - OBJ
      ?auto_3179772 - OBJ
      ?auto_3179767 - LOCATION
    )
    :vars
    (
      ?auto_3179774 - LOCATION
      ?auto_3179775 - CITY
      ?auto_3179776 - LOCATION
      ?auto_3179777 - LOCATION
      ?auto_3179778 - LOCATION
      ?auto_3179773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3179774 ?auto_3179775 ) ( IN-CITY ?auto_3179767 ?auto_3179775 ) ( not ( = ?auto_3179767 ?auto_3179774 ) ) ( OBJ-AT ?auto_3179772 ?auto_3179774 ) ( IN-CITY ?auto_3179776 ?auto_3179775 ) ( not ( = ?auto_3179767 ?auto_3179776 ) ) ( OBJ-AT ?auto_3179771 ?auto_3179776 ) ( OBJ-AT ?auto_3179770 ?auto_3179776 ) ( IN-CITY ?auto_3179777 ?auto_3179775 ) ( not ( = ?auto_3179767 ?auto_3179777 ) ) ( OBJ-AT ?auto_3179769 ?auto_3179777 ) ( IN-CITY ?auto_3179778 ?auto_3179775 ) ( not ( = ?auto_3179767 ?auto_3179778 ) ) ( OBJ-AT ?auto_3179768 ?auto_3179778 ) ( TRUCK-AT ?auto_3179773 ?auto_3179767 ) ( not ( = ?auto_3179768 ?auto_3179769 ) ) ( not ( = ?auto_3179777 ?auto_3179778 ) ) ( not ( = ?auto_3179768 ?auto_3179770 ) ) ( not ( = ?auto_3179769 ?auto_3179770 ) ) ( not ( = ?auto_3179776 ?auto_3179777 ) ) ( not ( = ?auto_3179776 ?auto_3179778 ) ) ( not ( = ?auto_3179768 ?auto_3179771 ) ) ( not ( = ?auto_3179769 ?auto_3179771 ) ) ( not ( = ?auto_3179770 ?auto_3179771 ) ) ( not ( = ?auto_3179768 ?auto_3179772 ) ) ( not ( = ?auto_3179769 ?auto_3179772 ) ) ( not ( = ?auto_3179770 ?auto_3179772 ) ) ( not ( = ?auto_3179771 ?auto_3179772 ) ) ( not ( = ?auto_3179774 ?auto_3179776 ) ) ( not ( = ?auto_3179774 ?auto_3179777 ) ) ( not ( = ?auto_3179774 ?auto_3179778 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3179768 ?auto_3179770 ?auto_3179769 ?auto_3179771 ?auto_3179767 )
      ( DELIVER-1PKG ?auto_3179772 ?auto_3179767 )
      ( DELIVER-5PKG-VERIFY ?auto_3179768 ?auto_3179769 ?auto_3179770 ?auto_3179771 ?auto_3179772 ?auto_3179767 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3179819 - OBJ
      ?auto_3179820 - OBJ
      ?auto_3179821 - OBJ
      ?auto_3179822 - OBJ
      ?auto_3179823 - OBJ
      ?auto_3179818 - LOCATION
    )
    :vars
    (
      ?auto_3179829 - LOCATION
      ?auto_3179824 - CITY
      ?auto_3179826 - LOCATION
      ?auto_3179827 - LOCATION
      ?auto_3179828 - LOCATION
      ?auto_3179825 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3179829 ?auto_3179824 ) ( IN-CITY ?auto_3179818 ?auto_3179824 ) ( not ( = ?auto_3179818 ?auto_3179829 ) ) ( OBJ-AT ?auto_3179822 ?auto_3179829 ) ( IN-CITY ?auto_3179826 ?auto_3179824 ) ( not ( = ?auto_3179818 ?auto_3179826 ) ) ( OBJ-AT ?auto_3179823 ?auto_3179826 ) ( OBJ-AT ?auto_3179821 ?auto_3179826 ) ( IN-CITY ?auto_3179827 ?auto_3179824 ) ( not ( = ?auto_3179818 ?auto_3179827 ) ) ( OBJ-AT ?auto_3179820 ?auto_3179827 ) ( IN-CITY ?auto_3179828 ?auto_3179824 ) ( not ( = ?auto_3179818 ?auto_3179828 ) ) ( OBJ-AT ?auto_3179819 ?auto_3179828 ) ( TRUCK-AT ?auto_3179825 ?auto_3179818 ) ( not ( = ?auto_3179819 ?auto_3179820 ) ) ( not ( = ?auto_3179827 ?auto_3179828 ) ) ( not ( = ?auto_3179819 ?auto_3179821 ) ) ( not ( = ?auto_3179820 ?auto_3179821 ) ) ( not ( = ?auto_3179826 ?auto_3179827 ) ) ( not ( = ?auto_3179826 ?auto_3179828 ) ) ( not ( = ?auto_3179819 ?auto_3179823 ) ) ( not ( = ?auto_3179820 ?auto_3179823 ) ) ( not ( = ?auto_3179821 ?auto_3179823 ) ) ( not ( = ?auto_3179819 ?auto_3179822 ) ) ( not ( = ?auto_3179820 ?auto_3179822 ) ) ( not ( = ?auto_3179821 ?auto_3179822 ) ) ( not ( = ?auto_3179823 ?auto_3179822 ) ) ( not ( = ?auto_3179829 ?auto_3179826 ) ) ( not ( = ?auto_3179829 ?auto_3179827 ) ) ( not ( = ?auto_3179829 ?auto_3179828 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3179819 ?auto_3179820 ?auto_3179821 ?auto_3179823 ?auto_3179822 ?auto_3179818 )
      ( DELIVER-5PKG-VERIFY ?auto_3179819 ?auto_3179820 ?auto_3179821 ?auto_3179822 ?auto_3179823 ?auto_3179818 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3180122 - OBJ
      ?auto_3180123 - OBJ
      ?auto_3180124 - OBJ
      ?auto_3180125 - OBJ
      ?auto_3180126 - OBJ
      ?auto_3180121 - LOCATION
    )
    :vars
    (
      ?auto_3180129 - LOCATION
      ?auto_3180127 - CITY
      ?auto_3180131 - LOCATION
      ?auto_3180130 - LOCATION
      ?auto_3180128 - LOCATION
      ?auto_3180132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3180129 ?auto_3180127 ) ( IN-CITY ?auto_3180121 ?auto_3180127 ) ( not ( = ?auto_3180121 ?auto_3180129 ) ) ( OBJ-AT ?auto_3180124 ?auto_3180129 ) ( IN-CITY ?auto_3180131 ?auto_3180127 ) ( not ( = ?auto_3180121 ?auto_3180131 ) ) ( OBJ-AT ?auto_3180126 ?auto_3180131 ) ( OBJ-AT ?auto_3180125 ?auto_3180131 ) ( IN-CITY ?auto_3180130 ?auto_3180127 ) ( not ( = ?auto_3180121 ?auto_3180130 ) ) ( OBJ-AT ?auto_3180123 ?auto_3180130 ) ( IN-CITY ?auto_3180128 ?auto_3180127 ) ( not ( = ?auto_3180121 ?auto_3180128 ) ) ( OBJ-AT ?auto_3180122 ?auto_3180128 ) ( TRUCK-AT ?auto_3180132 ?auto_3180121 ) ( not ( = ?auto_3180122 ?auto_3180123 ) ) ( not ( = ?auto_3180130 ?auto_3180128 ) ) ( not ( = ?auto_3180122 ?auto_3180125 ) ) ( not ( = ?auto_3180123 ?auto_3180125 ) ) ( not ( = ?auto_3180131 ?auto_3180130 ) ) ( not ( = ?auto_3180131 ?auto_3180128 ) ) ( not ( = ?auto_3180122 ?auto_3180126 ) ) ( not ( = ?auto_3180123 ?auto_3180126 ) ) ( not ( = ?auto_3180125 ?auto_3180126 ) ) ( not ( = ?auto_3180122 ?auto_3180124 ) ) ( not ( = ?auto_3180123 ?auto_3180124 ) ) ( not ( = ?auto_3180125 ?auto_3180124 ) ) ( not ( = ?auto_3180126 ?auto_3180124 ) ) ( not ( = ?auto_3180129 ?auto_3180131 ) ) ( not ( = ?auto_3180129 ?auto_3180130 ) ) ( not ( = ?auto_3180129 ?auto_3180128 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3180122 ?auto_3180123 ?auto_3180125 ?auto_3180124 ?auto_3180126 ?auto_3180121 )
      ( DELIVER-5PKG-VERIFY ?auto_3180122 ?auto_3180123 ?auto_3180124 ?auto_3180125 ?auto_3180126 ?auto_3180121 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3180434 - OBJ
      ?auto_3180435 - OBJ
      ?auto_3180436 - OBJ
      ?auto_3180437 - OBJ
      ?auto_3180438 - OBJ
      ?auto_3180433 - LOCATION
    )
    :vars
    (
      ?auto_3180441 - LOCATION
      ?auto_3180439 - CITY
      ?auto_3180443 - LOCATION
      ?auto_3180442 - LOCATION
      ?auto_3180440 - LOCATION
      ?auto_3180444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3180441 ?auto_3180439 ) ( IN-CITY ?auto_3180433 ?auto_3180439 ) ( not ( = ?auto_3180433 ?auto_3180441 ) ) ( OBJ-AT ?auto_3180438 ?auto_3180441 ) ( IN-CITY ?auto_3180443 ?auto_3180439 ) ( not ( = ?auto_3180433 ?auto_3180443 ) ) ( OBJ-AT ?auto_3180437 ?auto_3180443 ) ( OBJ-AT ?auto_3180435 ?auto_3180443 ) ( IN-CITY ?auto_3180442 ?auto_3180439 ) ( not ( = ?auto_3180433 ?auto_3180442 ) ) ( OBJ-AT ?auto_3180436 ?auto_3180442 ) ( IN-CITY ?auto_3180440 ?auto_3180439 ) ( not ( = ?auto_3180433 ?auto_3180440 ) ) ( OBJ-AT ?auto_3180434 ?auto_3180440 ) ( TRUCK-AT ?auto_3180444 ?auto_3180433 ) ( not ( = ?auto_3180434 ?auto_3180436 ) ) ( not ( = ?auto_3180442 ?auto_3180440 ) ) ( not ( = ?auto_3180434 ?auto_3180435 ) ) ( not ( = ?auto_3180436 ?auto_3180435 ) ) ( not ( = ?auto_3180443 ?auto_3180442 ) ) ( not ( = ?auto_3180443 ?auto_3180440 ) ) ( not ( = ?auto_3180434 ?auto_3180437 ) ) ( not ( = ?auto_3180436 ?auto_3180437 ) ) ( not ( = ?auto_3180435 ?auto_3180437 ) ) ( not ( = ?auto_3180434 ?auto_3180438 ) ) ( not ( = ?auto_3180436 ?auto_3180438 ) ) ( not ( = ?auto_3180435 ?auto_3180438 ) ) ( not ( = ?auto_3180437 ?auto_3180438 ) ) ( not ( = ?auto_3180441 ?auto_3180443 ) ) ( not ( = ?auto_3180441 ?auto_3180442 ) ) ( not ( = ?auto_3180441 ?auto_3180440 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3180434 ?auto_3180436 ?auto_3180435 ?auto_3180438 ?auto_3180437 ?auto_3180433 )
      ( DELIVER-5PKG-VERIFY ?auto_3180434 ?auto_3180435 ?auto_3180436 ?auto_3180437 ?auto_3180438 ?auto_3180433 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3180485 - OBJ
      ?auto_3180486 - OBJ
      ?auto_3180487 - OBJ
      ?auto_3180488 - OBJ
      ?auto_3180489 - OBJ
      ?auto_3180484 - LOCATION
    )
    :vars
    (
      ?auto_3180492 - LOCATION
      ?auto_3180490 - CITY
      ?auto_3180494 - LOCATION
      ?auto_3180493 - LOCATION
      ?auto_3180491 - LOCATION
      ?auto_3180495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3180492 ?auto_3180490 ) ( IN-CITY ?auto_3180484 ?auto_3180490 ) ( not ( = ?auto_3180484 ?auto_3180492 ) ) ( OBJ-AT ?auto_3180488 ?auto_3180492 ) ( IN-CITY ?auto_3180494 ?auto_3180490 ) ( not ( = ?auto_3180484 ?auto_3180494 ) ) ( OBJ-AT ?auto_3180489 ?auto_3180494 ) ( OBJ-AT ?auto_3180486 ?auto_3180494 ) ( IN-CITY ?auto_3180493 ?auto_3180490 ) ( not ( = ?auto_3180484 ?auto_3180493 ) ) ( OBJ-AT ?auto_3180487 ?auto_3180493 ) ( IN-CITY ?auto_3180491 ?auto_3180490 ) ( not ( = ?auto_3180484 ?auto_3180491 ) ) ( OBJ-AT ?auto_3180485 ?auto_3180491 ) ( TRUCK-AT ?auto_3180495 ?auto_3180484 ) ( not ( = ?auto_3180485 ?auto_3180487 ) ) ( not ( = ?auto_3180493 ?auto_3180491 ) ) ( not ( = ?auto_3180485 ?auto_3180486 ) ) ( not ( = ?auto_3180487 ?auto_3180486 ) ) ( not ( = ?auto_3180494 ?auto_3180493 ) ) ( not ( = ?auto_3180494 ?auto_3180491 ) ) ( not ( = ?auto_3180485 ?auto_3180489 ) ) ( not ( = ?auto_3180487 ?auto_3180489 ) ) ( not ( = ?auto_3180486 ?auto_3180489 ) ) ( not ( = ?auto_3180485 ?auto_3180488 ) ) ( not ( = ?auto_3180487 ?auto_3180488 ) ) ( not ( = ?auto_3180486 ?auto_3180488 ) ) ( not ( = ?auto_3180489 ?auto_3180488 ) ) ( not ( = ?auto_3180492 ?auto_3180494 ) ) ( not ( = ?auto_3180492 ?auto_3180493 ) ) ( not ( = ?auto_3180492 ?auto_3180491 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3180485 ?auto_3180487 ?auto_3180486 ?auto_3180488 ?auto_3180489 ?auto_3180484 )
      ( DELIVER-5PKG-VERIFY ?auto_3180485 ?auto_3180486 ?auto_3180487 ?auto_3180488 ?auto_3180489 ?auto_3180484 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3180645 - OBJ
      ?auto_3180646 - OBJ
      ?auto_3180647 - OBJ
      ?auto_3180648 - OBJ
      ?auto_3180649 - OBJ
      ?auto_3180644 - LOCATION
    )
    :vars
    (
      ?auto_3180652 - LOCATION
      ?auto_3180650 - CITY
      ?auto_3180654 - LOCATION
      ?auto_3180653 - LOCATION
      ?auto_3180651 - LOCATION
      ?auto_3180655 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3180652 ?auto_3180650 ) ( IN-CITY ?auto_3180644 ?auto_3180650 ) ( not ( = ?auto_3180644 ?auto_3180652 ) ) ( OBJ-AT ?auto_3180649 ?auto_3180652 ) ( IN-CITY ?auto_3180654 ?auto_3180650 ) ( not ( = ?auto_3180644 ?auto_3180654 ) ) ( OBJ-AT ?auto_3180647 ?auto_3180654 ) ( OBJ-AT ?auto_3180646 ?auto_3180654 ) ( IN-CITY ?auto_3180653 ?auto_3180650 ) ( not ( = ?auto_3180644 ?auto_3180653 ) ) ( OBJ-AT ?auto_3180648 ?auto_3180653 ) ( IN-CITY ?auto_3180651 ?auto_3180650 ) ( not ( = ?auto_3180644 ?auto_3180651 ) ) ( OBJ-AT ?auto_3180645 ?auto_3180651 ) ( TRUCK-AT ?auto_3180655 ?auto_3180644 ) ( not ( = ?auto_3180645 ?auto_3180648 ) ) ( not ( = ?auto_3180653 ?auto_3180651 ) ) ( not ( = ?auto_3180645 ?auto_3180646 ) ) ( not ( = ?auto_3180648 ?auto_3180646 ) ) ( not ( = ?auto_3180654 ?auto_3180653 ) ) ( not ( = ?auto_3180654 ?auto_3180651 ) ) ( not ( = ?auto_3180645 ?auto_3180647 ) ) ( not ( = ?auto_3180648 ?auto_3180647 ) ) ( not ( = ?auto_3180646 ?auto_3180647 ) ) ( not ( = ?auto_3180645 ?auto_3180649 ) ) ( not ( = ?auto_3180648 ?auto_3180649 ) ) ( not ( = ?auto_3180646 ?auto_3180649 ) ) ( not ( = ?auto_3180647 ?auto_3180649 ) ) ( not ( = ?auto_3180652 ?auto_3180654 ) ) ( not ( = ?auto_3180652 ?auto_3180653 ) ) ( not ( = ?auto_3180652 ?auto_3180651 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3180645 ?auto_3180648 ?auto_3180646 ?auto_3180649 ?auto_3180647 ?auto_3180644 )
      ( DELIVER-5PKG-VERIFY ?auto_3180645 ?auto_3180646 ?auto_3180647 ?auto_3180648 ?auto_3180649 ?auto_3180644 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3188457 - OBJ
      ?auto_3188458 - OBJ
      ?auto_3188459 - OBJ
      ?auto_3188460 - OBJ
      ?auto_3188461 - OBJ
      ?auto_3188456 - LOCATION
    )
    :vars
    (
      ?auto_3188464 - LOCATION
      ?auto_3188462 - CITY
      ?auto_3188466 - LOCATION
      ?auto_3188465 - LOCATION
      ?auto_3188463 - LOCATION
      ?auto_3188467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3188464 ?auto_3188462 ) ( IN-CITY ?auto_3188456 ?auto_3188462 ) ( not ( = ?auto_3188456 ?auto_3188464 ) ) ( OBJ-AT ?auto_3188461 ?auto_3188464 ) ( IN-CITY ?auto_3188466 ?auto_3188462 ) ( not ( = ?auto_3188456 ?auto_3188466 ) ) ( OBJ-AT ?auto_3188460 ?auto_3188466 ) ( OBJ-AT ?auto_3188457 ?auto_3188466 ) ( IN-CITY ?auto_3188465 ?auto_3188462 ) ( not ( = ?auto_3188456 ?auto_3188465 ) ) ( OBJ-AT ?auto_3188459 ?auto_3188465 ) ( IN-CITY ?auto_3188463 ?auto_3188462 ) ( not ( = ?auto_3188456 ?auto_3188463 ) ) ( OBJ-AT ?auto_3188458 ?auto_3188463 ) ( TRUCK-AT ?auto_3188467 ?auto_3188456 ) ( not ( = ?auto_3188458 ?auto_3188459 ) ) ( not ( = ?auto_3188465 ?auto_3188463 ) ) ( not ( = ?auto_3188458 ?auto_3188457 ) ) ( not ( = ?auto_3188459 ?auto_3188457 ) ) ( not ( = ?auto_3188466 ?auto_3188465 ) ) ( not ( = ?auto_3188466 ?auto_3188463 ) ) ( not ( = ?auto_3188458 ?auto_3188460 ) ) ( not ( = ?auto_3188459 ?auto_3188460 ) ) ( not ( = ?auto_3188457 ?auto_3188460 ) ) ( not ( = ?auto_3188458 ?auto_3188461 ) ) ( not ( = ?auto_3188459 ?auto_3188461 ) ) ( not ( = ?auto_3188457 ?auto_3188461 ) ) ( not ( = ?auto_3188460 ?auto_3188461 ) ) ( not ( = ?auto_3188464 ?auto_3188466 ) ) ( not ( = ?auto_3188464 ?auto_3188465 ) ) ( not ( = ?auto_3188464 ?auto_3188463 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3188458 ?auto_3188459 ?auto_3188457 ?auto_3188461 ?auto_3188460 ?auto_3188456 )
      ( DELIVER-5PKG-VERIFY ?auto_3188457 ?auto_3188458 ?auto_3188459 ?auto_3188460 ?auto_3188461 ?auto_3188456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3188508 - OBJ
      ?auto_3188509 - OBJ
      ?auto_3188510 - OBJ
      ?auto_3188511 - OBJ
      ?auto_3188512 - OBJ
      ?auto_3188507 - LOCATION
    )
    :vars
    (
      ?auto_3188515 - LOCATION
      ?auto_3188513 - CITY
      ?auto_3188517 - LOCATION
      ?auto_3188516 - LOCATION
      ?auto_3188514 - LOCATION
      ?auto_3188518 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3188515 ?auto_3188513 ) ( IN-CITY ?auto_3188507 ?auto_3188513 ) ( not ( = ?auto_3188507 ?auto_3188515 ) ) ( OBJ-AT ?auto_3188511 ?auto_3188515 ) ( IN-CITY ?auto_3188517 ?auto_3188513 ) ( not ( = ?auto_3188507 ?auto_3188517 ) ) ( OBJ-AT ?auto_3188512 ?auto_3188517 ) ( OBJ-AT ?auto_3188508 ?auto_3188517 ) ( IN-CITY ?auto_3188516 ?auto_3188513 ) ( not ( = ?auto_3188507 ?auto_3188516 ) ) ( OBJ-AT ?auto_3188510 ?auto_3188516 ) ( IN-CITY ?auto_3188514 ?auto_3188513 ) ( not ( = ?auto_3188507 ?auto_3188514 ) ) ( OBJ-AT ?auto_3188509 ?auto_3188514 ) ( TRUCK-AT ?auto_3188518 ?auto_3188507 ) ( not ( = ?auto_3188509 ?auto_3188510 ) ) ( not ( = ?auto_3188516 ?auto_3188514 ) ) ( not ( = ?auto_3188509 ?auto_3188508 ) ) ( not ( = ?auto_3188510 ?auto_3188508 ) ) ( not ( = ?auto_3188517 ?auto_3188516 ) ) ( not ( = ?auto_3188517 ?auto_3188514 ) ) ( not ( = ?auto_3188509 ?auto_3188512 ) ) ( not ( = ?auto_3188510 ?auto_3188512 ) ) ( not ( = ?auto_3188508 ?auto_3188512 ) ) ( not ( = ?auto_3188509 ?auto_3188511 ) ) ( not ( = ?auto_3188510 ?auto_3188511 ) ) ( not ( = ?auto_3188508 ?auto_3188511 ) ) ( not ( = ?auto_3188512 ?auto_3188511 ) ) ( not ( = ?auto_3188515 ?auto_3188517 ) ) ( not ( = ?auto_3188515 ?auto_3188516 ) ) ( not ( = ?auto_3188515 ?auto_3188514 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3188509 ?auto_3188510 ?auto_3188508 ?auto_3188511 ?auto_3188512 ?auto_3188507 )
      ( DELIVER-5PKG-VERIFY ?auto_3188508 ?auto_3188509 ?auto_3188510 ?auto_3188511 ?auto_3188512 ?auto_3188507 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3188668 - OBJ
      ?auto_3188669 - OBJ
      ?auto_3188670 - OBJ
      ?auto_3188671 - OBJ
      ?auto_3188672 - OBJ
      ?auto_3188667 - LOCATION
    )
    :vars
    (
      ?auto_3188675 - LOCATION
      ?auto_3188673 - CITY
      ?auto_3188677 - LOCATION
      ?auto_3188676 - LOCATION
      ?auto_3188674 - LOCATION
      ?auto_3188678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3188675 ?auto_3188673 ) ( IN-CITY ?auto_3188667 ?auto_3188673 ) ( not ( = ?auto_3188667 ?auto_3188675 ) ) ( OBJ-AT ?auto_3188672 ?auto_3188675 ) ( IN-CITY ?auto_3188677 ?auto_3188673 ) ( not ( = ?auto_3188667 ?auto_3188677 ) ) ( OBJ-AT ?auto_3188670 ?auto_3188677 ) ( OBJ-AT ?auto_3188668 ?auto_3188677 ) ( IN-CITY ?auto_3188676 ?auto_3188673 ) ( not ( = ?auto_3188667 ?auto_3188676 ) ) ( OBJ-AT ?auto_3188671 ?auto_3188676 ) ( IN-CITY ?auto_3188674 ?auto_3188673 ) ( not ( = ?auto_3188667 ?auto_3188674 ) ) ( OBJ-AT ?auto_3188669 ?auto_3188674 ) ( TRUCK-AT ?auto_3188678 ?auto_3188667 ) ( not ( = ?auto_3188669 ?auto_3188671 ) ) ( not ( = ?auto_3188676 ?auto_3188674 ) ) ( not ( = ?auto_3188669 ?auto_3188668 ) ) ( not ( = ?auto_3188671 ?auto_3188668 ) ) ( not ( = ?auto_3188677 ?auto_3188676 ) ) ( not ( = ?auto_3188677 ?auto_3188674 ) ) ( not ( = ?auto_3188669 ?auto_3188670 ) ) ( not ( = ?auto_3188671 ?auto_3188670 ) ) ( not ( = ?auto_3188668 ?auto_3188670 ) ) ( not ( = ?auto_3188669 ?auto_3188672 ) ) ( not ( = ?auto_3188671 ?auto_3188672 ) ) ( not ( = ?auto_3188668 ?auto_3188672 ) ) ( not ( = ?auto_3188670 ?auto_3188672 ) ) ( not ( = ?auto_3188675 ?auto_3188677 ) ) ( not ( = ?auto_3188675 ?auto_3188676 ) ) ( not ( = ?auto_3188675 ?auto_3188674 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3188669 ?auto_3188671 ?auto_3188668 ?auto_3188672 ?auto_3188670 ?auto_3188667 )
      ( DELIVER-5PKG-VERIFY ?auto_3188668 ?auto_3188669 ?auto_3188670 ?auto_3188671 ?auto_3188672 ?auto_3188667 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_3190710 - OBJ
      ?auto_3190711 - OBJ
      ?auto_3190712 - OBJ
      ?auto_3190713 - OBJ
      ?auto_3190714 - OBJ
      ?auto_3190709 - LOCATION
    )
    :vars
    (
      ?auto_3190717 - LOCATION
      ?auto_3190715 - CITY
      ?auto_3190719 - LOCATION
      ?auto_3190718 - LOCATION
      ?auto_3190716 - LOCATION
      ?auto_3190720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3190717 ?auto_3190715 ) ( IN-CITY ?auto_3190709 ?auto_3190715 ) ( not ( = ?auto_3190709 ?auto_3190717 ) ) ( OBJ-AT ?auto_3190714 ?auto_3190717 ) ( IN-CITY ?auto_3190719 ?auto_3190715 ) ( not ( = ?auto_3190709 ?auto_3190719 ) ) ( OBJ-AT ?auto_3190711 ?auto_3190719 ) ( OBJ-AT ?auto_3190710 ?auto_3190719 ) ( IN-CITY ?auto_3190718 ?auto_3190715 ) ( not ( = ?auto_3190709 ?auto_3190718 ) ) ( OBJ-AT ?auto_3190713 ?auto_3190718 ) ( IN-CITY ?auto_3190716 ?auto_3190715 ) ( not ( = ?auto_3190709 ?auto_3190716 ) ) ( OBJ-AT ?auto_3190712 ?auto_3190716 ) ( TRUCK-AT ?auto_3190720 ?auto_3190709 ) ( not ( = ?auto_3190712 ?auto_3190713 ) ) ( not ( = ?auto_3190718 ?auto_3190716 ) ) ( not ( = ?auto_3190712 ?auto_3190710 ) ) ( not ( = ?auto_3190713 ?auto_3190710 ) ) ( not ( = ?auto_3190719 ?auto_3190718 ) ) ( not ( = ?auto_3190719 ?auto_3190716 ) ) ( not ( = ?auto_3190712 ?auto_3190711 ) ) ( not ( = ?auto_3190713 ?auto_3190711 ) ) ( not ( = ?auto_3190710 ?auto_3190711 ) ) ( not ( = ?auto_3190712 ?auto_3190714 ) ) ( not ( = ?auto_3190713 ?auto_3190714 ) ) ( not ( = ?auto_3190710 ?auto_3190714 ) ) ( not ( = ?auto_3190711 ?auto_3190714 ) ) ( not ( = ?auto_3190717 ?auto_3190719 ) ) ( not ( = ?auto_3190717 ?auto_3190718 ) ) ( not ( = ?auto_3190717 ?auto_3190716 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3190712 ?auto_3190713 ?auto_3190710 ?auto_3190714 ?auto_3190711 ?auto_3190709 )
      ( DELIVER-5PKG-VERIFY ?auto_3190710 ?auto_3190711 ?auto_3190712 ?auto_3190713 ?auto_3190714 ?auto_3190709 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3437012 - OBJ
      ?auto_3437013 - OBJ
      ?auto_3437014 - OBJ
      ?auto_3437015 - OBJ
      ?auto_3437016 - OBJ
      ?auto_3437017 - OBJ
      ?auto_3437011 - LOCATION
    )
    :vars
    (
      ?auto_3437018 - LOCATION
      ?auto_3437020 - CITY
      ?auto_3437023 - LOCATION
      ?auto_3437022 - LOCATION
      ?auto_3437021 - LOCATION
      ?auto_3437019 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3437018 ?auto_3437020 ) ( IN-CITY ?auto_3437011 ?auto_3437020 ) ( not ( = ?auto_3437011 ?auto_3437018 ) ) ( OBJ-AT ?auto_3437017 ?auto_3437018 ) ( OBJ-AT ?auto_3437016 ?auto_3437018 ) ( IN-CITY ?auto_3437023 ?auto_3437020 ) ( not ( = ?auto_3437011 ?auto_3437023 ) ) ( OBJ-AT ?auto_3437015 ?auto_3437023 ) ( OBJ-AT ?auto_3437014 ?auto_3437023 ) ( IN-CITY ?auto_3437022 ?auto_3437020 ) ( not ( = ?auto_3437011 ?auto_3437022 ) ) ( OBJ-AT ?auto_3437013 ?auto_3437022 ) ( IN-CITY ?auto_3437021 ?auto_3437020 ) ( not ( = ?auto_3437011 ?auto_3437021 ) ) ( OBJ-AT ?auto_3437012 ?auto_3437021 ) ( TRUCK-AT ?auto_3437019 ?auto_3437011 ) ( not ( = ?auto_3437012 ?auto_3437013 ) ) ( not ( = ?auto_3437022 ?auto_3437021 ) ) ( not ( = ?auto_3437012 ?auto_3437014 ) ) ( not ( = ?auto_3437013 ?auto_3437014 ) ) ( not ( = ?auto_3437023 ?auto_3437022 ) ) ( not ( = ?auto_3437023 ?auto_3437021 ) ) ( not ( = ?auto_3437012 ?auto_3437015 ) ) ( not ( = ?auto_3437013 ?auto_3437015 ) ) ( not ( = ?auto_3437014 ?auto_3437015 ) ) ( not ( = ?auto_3437012 ?auto_3437016 ) ) ( not ( = ?auto_3437013 ?auto_3437016 ) ) ( not ( = ?auto_3437014 ?auto_3437016 ) ) ( not ( = ?auto_3437015 ?auto_3437016 ) ) ( not ( = ?auto_3437018 ?auto_3437023 ) ) ( not ( = ?auto_3437018 ?auto_3437022 ) ) ( not ( = ?auto_3437018 ?auto_3437021 ) ) ( not ( = ?auto_3437012 ?auto_3437017 ) ) ( not ( = ?auto_3437013 ?auto_3437017 ) ) ( not ( = ?auto_3437014 ?auto_3437017 ) ) ( not ( = ?auto_3437015 ?auto_3437017 ) ) ( not ( = ?auto_3437016 ?auto_3437017 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_3437012 ?auto_3437013 ?auto_3437014 ?auto_3437016 ?auto_3437015 ?auto_3437011 )
      ( DELIVER-1PKG ?auto_3437017 ?auto_3437011 )
      ( DELIVER-6PKG-VERIFY ?auto_3437012 ?auto_3437013 ?auto_3437014 ?auto_3437015 ?auto_3437016 ?auto_3437017 ?auto_3437011 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3437144 - OBJ
      ?auto_3437145 - OBJ
      ?auto_3437146 - OBJ
      ?auto_3437147 - OBJ
      ?auto_3437148 - OBJ
      ?auto_3437149 - OBJ
      ?auto_3437143 - LOCATION
    )
    :vars
    (
      ?auto_3437150 - LOCATION
      ?auto_3437155 - CITY
      ?auto_3437152 - LOCATION
      ?auto_3437153 - LOCATION
      ?auto_3437154 - LOCATION
      ?auto_3437151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3437150 ?auto_3437155 ) ( IN-CITY ?auto_3437143 ?auto_3437155 ) ( not ( = ?auto_3437143 ?auto_3437150 ) ) ( OBJ-AT ?auto_3437149 ?auto_3437150 ) ( OBJ-AT ?auto_3437147 ?auto_3437150 ) ( IN-CITY ?auto_3437152 ?auto_3437155 ) ( not ( = ?auto_3437143 ?auto_3437152 ) ) ( OBJ-AT ?auto_3437148 ?auto_3437152 ) ( OBJ-AT ?auto_3437146 ?auto_3437152 ) ( IN-CITY ?auto_3437153 ?auto_3437155 ) ( not ( = ?auto_3437143 ?auto_3437153 ) ) ( OBJ-AT ?auto_3437145 ?auto_3437153 ) ( IN-CITY ?auto_3437154 ?auto_3437155 ) ( not ( = ?auto_3437143 ?auto_3437154 ) ) ( OBJ-AT ?auto_3437144 ?auto_3437154 ) ( TRUCK-AT ?auto_3437151 ?auto_3437143 ) ( not ( = ?auto_3437144 ?auto_3437145 ) ) ( not ( = ?auto_3437153 ?auto_3437154 ) ) ( not ( = ?auto_3437144 ?auto_3437146 ) ) ( not ( = ?auto_3437145 ?auto_3437146 ) ) ( not ( = ?auto_3437152 ?auto_3437153 ) ) ( not ( = ?auto_3437152 ?auto_3437154 ) ) ( not ( = ?auto_3437144 ?auto_3437148 ) ) ( not ( = ?auto_3437145 ?auto_3437148 ) ) ( not ( = ?auto_3437146 ?auto_3437148 ) ) ( not ( = ?auto_3437144 ?auto_3437147 ) ) ( not ( = ?auto_3437145 ?auto_3437147 ) ) ( not ( = ?auto_3437146 ?auto_3437147 ) ) ( not ( = ?auto_3437148 ?auto_3437147 ) ) ( not ( = ?auto_3437150 ?auto_3437152 ) ) ( not ( = ?auto_3437150 ?auto_3437153 ) ) ( not ( = ?auto_3437150 ?auto_3437154 ) ) ( not ( = ?auto_3437144 ?auto_3437149 ) ) ( not ( = ?auto_3437145 ?auto_3437149 ) ) ( not ( = ?auto_3437146 ?auto_3437149 ) ) ( not ( = ?auto_3437148 ?auto_3437149 ) ) ( not ( = ?auto_3437147 ?auto_3437149 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3437144 ?auto_3437145 ?auto_3437146 ?auto_3437148 ?auto_3437147 ?auto_3437149 ?auto_3437143 )
      ( DELIVER-6PKG-VERIFY ?auto_3437144 ?auto_3437145 ?auto_3437146 ?auto_3437147 ?auto_3437148 ?auto_3437149 ?auto_3437143 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3437213 - OBJ
      ?auto_3437214 - OBJ
      ?auto_3437215 - OBJ
      ?auto_3437216 - OBJ
      ?auto_3437217 - OBJ
      ?auto_3437218 - OBJ
      ?auto_3437212 - LOCATION
    )
    :vars
    (
      ?auto_3437220 - LOCATION
      ?auto_3437222 - CITY
      ?auto_3437219 - LOCATION
      ?auto_3437223 - LOCATION
      ?auto_3437224 - LOCATION
      ?auto_3437221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3437220 ?auto_3437222 ) ( IN-CITY ?auto_3437212 ?auto_3437222 ) ( not ( = ?auto_3437212 ?auto_3437220 ) ) ( OBJ-AT ?auto_3437217 ?auto_3437220 ) ( OBJ-AT ?auto_3437216 ?auto_3437220 ) ( IN-CITY ?auto_3437219 ?auto_3437222 ) ( not ( = ?auto_3437212 ?auto_3437219 ) ) ( OBJ-AT ?auto_3437218 ?auto_3437219 ) ( OBJ-AT ?auto_3437215 ?auto_3437219 ) ( IN-CITY ?auto_3437223 ?auto_3437222 ) ( not ( = ?auto_3437212 ?auto_3437223 ) ) ( OBJ-AT ?auto_3437214 ?auto_3437223 ) ( IN-CITY ?auto_3437224 ?auto_3437222 ) ( not ( = ?auto_3437212 ?auto_3437224 ) ) ( OBJ-AT ?auto_3437213 ?auto_3437224 ) ( TRUCK-AT ?auto_3437221 ?auto_3437212 ) ( not ( = ?auto_3437213 ?auto_3437214 ) ) ( not ( = ?auto_3437223 ?auto_3437224 ) ) ( not ( = ?auto_3437213 ?auto_3437215 ) ) ( not ( = ?auto_3437214 ?auto_3437215 ) ) ( not ( = ?auto_3437219 ?auto_3437223 ) ) ( not ( = ?auto_3437219 ?auto_3437224 ) ) ( not ( = ?auto_3437213 ?auto_3437218 ) ) ( not ( = ?auto_3437214 ?auto_3437218 ) ) ( not ( = ?auto_3437215 ?auto_3437218 ) ) ( not ( = ?auto_3437213 ?auto_3437216 ) ) ( not ( = ?auto_3437214 ?auto_3437216 ) ) ( not ( = ?auto_3437215 ?auto_3437216 ) ) ( not ( = ?auto_3437218 ?auto_3437216 ) ) ( not ( = ?auto_3437220 ?auto_3437219 ) ) ( not ( = ?auto_3437220 ?auto_3437223 ) ) ( not ( = ?auto_3437220 ?auto_3437224 ) ) ( not ( = ?auto_3437213 ?auto_3437217 ) ) ( not ( = ?auto_3437214 ?auto_3437217 ) ) ( not ( = ?auto_3437215 ?auto_3437217 ) ) ( not ( = ?auto_3437218 ?auto_3437217 ) ) ( not ( = ?auto_3437216 ?auto_3437217 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3437213 ?auto_3437214 ?auto_3437215 ?auto_3437216 ?auto_3437218 ?auto_3437217 ?auto_3437212 )
      ( DELIVER-6PKG-VERIFY ?auto_3437213 ?auto_3437214 ?auto_3437215 ?auto_3437216 ?auto_3437217 ?auto_3437218 ?auto_3437212 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3445350 - OBJ
      ?auto_3445351 - OBJ
      ?auto_3445352 - OBJ
      ?auto_3445353 - OBJ
      ?auto_3445354 - OBJ
      ?auto_3445355 - OBJ
      ?auto_3445349 - LOCATION
    )
    :vars
    (
      ?auto_3445357 - LOCATION
      ?auto_3445359 - CITY
      ?auto_3445356 - LOCATION
      ?auto_3445360 - LOCATION
      ?auto_3445361 - LOCATION
      ?auto_3445358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3445357 ?auto_3445359 ) ( IN-CITY ?auto_3445349 ?auto_3445359 ) ( not ( = ?auto_3445349 ?auto_3445357 ) ) ( OBJ-AT ?auto_3445355 ?auto_3445357 ) ( OBJ-AT ?auto_3445354 ?auto_3445357 ) ( IN-CITY ?auto_3445356 ?auto_3445359 ) ( not ( = ?auto_3445349 ?auto_3445356 ) ) ( OBJ-AT ?auto_3445353 ?auto_3445356 ) ( OBJ-AT ?auto_3445351 ?auto_3445356 ) ( IN-CITY ?auto_3445360 ?auto_3445359 ) ( not ( = ?auto_3445349 ?auto_3445360 ) ) ( OBJ-AT ?auto_3445352 ?auto_3445360 ) ( IN-CITY ?auto_3445361 ?auto_3445359 ) ( not ( = ?auto_3445349 ?auto_3445361 ) ) ( OBJ-AT ?auto_3445350 ?auto_3445361 ) ( TRUCK-AT ?auto_3445358 ?auto_3445349 ) ( not ( = ?auto_3445350 ?auto_3445352 ) ) ( not ( = ?auto_3445360 ?auto_3445361 ) ) ( not ( = ?auto_3445350 ?auto_3445351 ) ) ( not ( = ?auto_3445352 ?auto_3445351 ) ) ( not ( = ?auto_3445356 ?auto_3445360 ) ) ( not ( = ?auto_3445356 ?auto_3445361 ) ) ( not ( = ?auto_3445350 ?auto_3445353 ) ) ( not ( = ?auto_3445352 ?auto_3445353 ) ) ( not ( = ?auto_3445351 ?auto_3445353 ) ) ( not ( = ?auto_3445350 ?auto_3445354 ) ) ( not ( = ?auto_3445352 ?auto_3445354 ) ) ( not ( = ?auto_3445351 ?auto_3445354 ) ) ( not ( = ?auto_3445353 ?auto_3445354 ) ) ( not ( = ?auto_3445357 ?auto_3445356 ) ) ( not ( = ?auto_3445357 ?auto_3445360 ) ) ( not ( = ?auto_3445357 ?auto_3445361 ) ) ( not ( = ?auto_3445350 ?auto_3445355 ) ) ( not ( = ?auto_3445352 ?auto_3445355 ) ) ( not ( = ?auto_3445351 ?auto_3445355 ) ) ( not ( = ?auto_3445353 ?auto_3445355 ) ) ( not ( = ?auto_3445354 ?auto_3445355 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3445350 ?auto_3445352 ?auto_3445351 ?auto_3445354 ?auto_3445353 ?auto_3445355 ?auto_3445349 )
      ( DELIVER-6PKG-VERIFY ?auto_3445350 ?auto_3445351 ?auto_3445352 ?auto_3445353 ?auto_3445354 ?auto_3445355 ?auto_3445349 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3445482 - OBJ
      ?auto_3445483 - OBJ
      ?auto_3445484 - OBJ
      ?auto_3445485 - OBJ
      ?auto_3445486 - OBJ
      ?auto_3445487 - OBJ
      ?auto_3445481 - LOCATION
    )
    :vars
    (
      ?auto_3445489 - LOCATION
      ?auto_3445491 - CITY
      ?auto_3445488 - LOCATION
      ?auto_3445492 - LOCATION
      ?auto_3445493 - LOCATION
      ?auto_3445490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3445489 ?auto_3445491 ) ( IN-CITY ?auto_3445481 ?auto_3445491 ) ( not ( = ?auto_3445481 ?auto_3445489 ) ) ( OBJ-AT ?auto_3445487 ?auto_3445489 ) ( OBJ-AT ?auto_3445485 ?auto_3445489 ) ( IN-CITY ?auto_3445488 ?auto_3445491 ) ( not ( = ?auto_3445481 ?auto_3445488 ) ) ( OBJ-AT ?auto_3445486 ?auto_3445488 ) ( OBJ-AT ?auto_3445483 ?auto_3445488 ) ( IN-CITY ?auto_3445492 ?auto_3445491 ) ( not ( = ?auto_3445481 ?auto_3445492 ) ) ( OBJ-AT ?auto_3445484 ?auto_3445492 ) ( IN-CITY ?auto_3445493 ?auto_3445491 ) ( not ( = ?auto_3445481 ?auto_3445493 ) ) ( OBJ-AT ?auto_3445482 ?auto_3445493 ) ( TRUCK-AT ?auto_3445490 ?auto_3445481 ) ( not ( = ?auto_3445482 ?auto_3445484 ) ) ( not ( = ?auto_3445492 ?auto_3445493 ) ) ( not ( = ?auto_3445482 ?auto_3445483 ) ) ( not ( = ?auto_3445484 ?auto_3445483 ) ) ( not ( = ?auto_3445488 ?auto_3445492 ) ) ( not ( = ?auto_3445488 ?auto_3445493 ) ) ( not ( = ?auto_3445482 ?auto_3445486 ) ) ( not ( = ?auto_3445484 ?auto_3445486 ) ) ( not ( = ?auto_3445483 ?auto_3445486 ) ) ( not ( = ?auto_3445482 ?auto_3445485 ) ) ( not ( = ?auto_3445484 ?auto_3445485 ) ) ( not ( = ?auto_3445483 ?auto_3445485 ) ) ( not ( = ?auto_3445486 ?auto_3445485 ) ) ( not ( = ?auto_3445489 ?auto_3445488 ) ) ( not ( = ?auto_3445489 ?auto_3445492 ) ) ( not ( = ?auto_3445489 ?auto_3445493 ) ) ( not ( = ?auto_3445482 ?auto_3445487 ) ) ( not ( = ?auto_3445484 ?auto_3445487 ) ) ( not ( = ?auto_3445483 ?auto_3445487 ) ) ( not ( = ?auto_3445486 ?auto_3445487 ) ) ( not ( = ?auto_3445485 ?auto_3445487 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3445482 ?auto_3445484 ?auto_3445483 ?auto_3445485 ?auto_3445486 ?auto_3445487 ?auto_3445481 )
      ( DELIVER-6PKG-VERIFY ?auto_3445482 ?auto_3445483 ?auto_3445484 ?auto_3445485 ?auto_3445486 ?auto_3445487 ?auto_3445481 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3445551 - OBJ
      ?auto_3445552 - OBJ
      ?auto_3445553 - OBJ
      ?auto_3445554 - OBJ
      ?auto_3445555 - OBJ
      ?auto_3445556 - OBJ
      ?auto_3445550 - LOCATION
    )
    :vars
    (
      ?auto_3445558 - LOCATION
      ?auto_3445560 - CITY
      ?auto_3445557 - LOCATION
      ?auto_3445561 - LOCATION
      ?auto_3445562 - LOCATION
      ?auto_3445559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3445558 ?auto_3445560 ) ( IN-CITY ?auto_3445550 ?auto_3445560 ) ( not ( = ?auto_3445550 ?auto_3445558 ) ) ( OBJ-AT ?auto_3445555 ?auto_3445558 ) ( OBJ-AT ?auto_3445554 ?auto_3445558 ) ( IN-CITY ?auto_3445557 ?auto_3445560 ) ( not ( = ?auto_3445550 ?auto_3445557 ) ) ( OBJ-AT ?auto_3445556 ?auto_3445557 ) ( OBJ-AT ?auto_3445552 ?auto_3445557 ) ( IN-CITY ?auto_3445561 ?auto_3445560 ) ( not ( = ?auto_3445550 ?auto_3445561 ) ) ( OBJ-AT ?auto_3445553 ?auto_3445561 ) ( IN-CITY ?auto_3445562 ?auto_3445560 ) ( not ( = ?auto_3445550 ?auto_3445562 ) ) ( OBJ-AT ?auto_3445551 ?auto_3445562 ) ( TRUCK-AT ?auto_3445559 ?auto_3445550 ) ( not ( = ?auto_3445551 ?auto_3445553 ) ) ( not ( = ?auto_3445561 ?auto_3445562 ) ) ( not ( = ?auto_3445551 ?auto_3445552 ) ) ( not ( = ?auto_3445553 ?auto_3445552 ) ) ( not ( = ?auto_3445557 ?auto_3445561 ) ) ( not ( = ?auto_3445557 ?auto_3445562 ) ) ( not ( = ?auto_3445551 ?auto_3445556 ) ) ( not ( = ?auto_3445553 ?auto_3445556 ) ) ( not ( = ?auto_3445552 ?auto_3445556 ) ) ( not ( = ?auto_3445551 ?auto_3445554 ) ) ( not ( = ?auto_3445553 ?auto_3445554 ) ) ( not ( = ?auto_3445552 ?auto_3445554 ) ) ( not ( = ?auto_3445556 ?auto_3445554 ) ) ( not ( = ?auto_3445558 ?auto_3445557 ) ) ( not ( = ?auto_3445558 ?auto_3445561 ) ) ( not ( = ?auto_3445558 ?auto_3445562 ) ) ( not ( = ?auto_3445551 ?auto_3445555 ) ) ( not ( = ?auto_3445553 ?auto_3445555 ) ) ( not ( = ?auto_3445552 ?auto_3445555 ) ) ( not ( = ?auto_3445556 ?auto_3445555 ) ) ( not ( = ?auto_3445554 ?auto_3445555 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3445551 ?auto_3445553 ?auto_3445552 ?auto_3445554 ?auto_3445556 ?auto_3445555 ?auto_3445550 )
      ( DELIVER-6PKG-VERIFY ?auto_3445551 ?auto_3445552 ?auto_3445553 ?auto_3445554 ?auto_3445555 ?auto_3445556 ?auto_3445550 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3447681 - OBJ
      ?auto_3447682 - OBJ
      ?auto_3447683 - OBJ
      ?auto_3447684 - OBJ
      ?auto_3447685 - OBJ
      ?auto_3447686 - OBJ
      ?auto_3447680 - LOCATION
    )
    :vars
    (
      ?auto_3447688 - LOCATION
      ?auto_3447690 - CITY
      ?auto_3447687 - LOCATION
      ?auto_3447691 - LOCATION
      ?auto_3447692 - LOCATION
      ?auto_3447689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3447688 ?auto_3447690 ) ( IN-CITY ?auto_3447680 ?auto_3447690 ) ( not ( = ?auto_3447680 ?auto_3447688 ) ) ( OBJ-AT ?auto_3447686 ?auto_3447688 ) ( OBJ-AT ?auto_3447685 ?auto_3447688 ) ( IN-CITY ?auto_3447687 ?auto_3447690 ) ( not ( = ?auto_3447680 ?auto_3447687 ) ) ( OBJ-AT ?auto_3447683 ?auto_3447687 ) ( OBJ-AT ?auto_3447682 ?auto_3447687 ) ( IN-CITY ?auto_3447691 ?auto_3447690 ) ( not ( = ?auto_3447680 ?auto_3447691 ) ) ( OBJ-AT ?auto_3447684 ?auto_3447691 ) ( IN-CITY ?auto_3447692 ?auto_3447690 ) ( not ( = ?auto_3447680 ?auto_3447692 ) ) ( OBJ-AT ?auto_3447681 ?auto_3447692 ) ( TRUCK-AT ?auto_3447689 ?auto_3447680 ) ( not ( = ?auto_3447681 ?auto_3447684 ) ) ( not ( = ?auto_3447691 ?auto_3447692 ) ) ( not ( = ?auto_3447681 ?auto_3447682 ) ) ( not ( = ?auto_3447684 ?auto_3447682 ) ) ( not ( = ?auto_3447687 ?auto_3447691 ) ) ( not ( = ?auto_3447687 ?auto_3447692 ) ) ( not ( = ?auto_3447681 ?auto_3447683 ) ) ( not ( = ?auto_3447684 ?auto_3447683 ) ) ( not ( = ?auto_3447682 ?auto_3447683 ) ) ( not ( = ?auto_3447681 ?auto_3447685 ) ) ( not ( = ?auto_3447684 ?auto_3447685 ) ) ( not ( = ?auto_3447682 ?auto_3447685 ) ) ( not ( = ?auto_3447683 ?auto_3447685 ) ) ( not ( = ?auto_3447688 ?auto_3447687 ) ) ( not ( = ?auto_3447688 ?auto_3447691 ) ) ( not ( = ?auto_3447688 ?auto_3447692 ) ) ( not ( = ?auto_3447681 ?auto_3447686 ) ) ( not ( = ?auto_3447684 ?auto_3447686 ) ) ( not ( = ?auto_3447682 ?auto_3447686 ) ) ( not ( = ?auto_3447683 ?auto_3447686 ) ) ( not ( = ?auto_3447685 ?auto_3447686 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3447681 ?auto_3447684 ?auto_3447682 ?auto_3447685 ?auto_3447683 ?auto_3447686 ?auto_3447680 )
      ( DELIVER-6PKG-VERIFY ?auto_3447681 ?auto_3447682 ?auto_3447683 ?auto_3447684 ?auto_3447685 ?auto_3447686 ?auto_3447680 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3448107 - OBJ
      ?auto_3448108 - OBJ
      ?auto_3448109 - OBJ
      ?auto_3448110 - OBJ
      ?auto_3448111 - OBJ
      ?auto_3448112 - OBJ
      ?auto_3448106 - LOCATION
    )
    :vars
    (
      ?auto_3448114 - LOCATION
      ?auto_3448116 - CITY
      ?auto_3448113 - LOCATION
      ?auto_3448117 - LOCATION
      ?auto_3448118 - LOCATION
      ?auto_3448115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3448114 ?auto_3448116 ) ( IN-CITY ?auto_3448106 ?auto_3448116 ) ( not ( = ?auto_3448106 ?auto_3448114 ) ) ( OBJ-AT ?auto_3448112 ?auto_3448114 ) ( OBJ-AT ?auto_3448110 ?auto_3448114 ) ( IN-CITY ?auto_3448113 ?auto_3448116 ) ( not ( = ?auto_3448106 ?auto_3448113 ) ) ( OBJ-AT ?auto_3448109 ?auto_3448113 ) ( OBJ-AT ?auto_3448108 ?auto_3448113 ) ( IN-CITY ?auto_3448117 ?auto_3448116 ) ( not ( = ?auto_3448106 ?auto_3448117 ) ) ( OBJ-AT ?auto_3448111 ?auto_3448117 ) ( IN-CITY ?auto_3448118 ?auto_3448116 ) ( not ( = ?auto_3448106 ?auto_3448118 ) ) ( OBJ-AT ?auto_3448107 ?auto_3448118 ) ( TRUCK-AT ?auto_3448115 ?auto_3448106 ) ( not ( = ?auto_3448107 ?auto_3448111 ) ) ( not ( = ?auto_3448117 ?auto_3448118 ) ) ( not ( = ?auto_3448107 ?auto_3448108 ) ) ( not ( = ?auto_3448111 ?auto_3448108 ) ) ( not ( = ?auto_3448113 ?auto_3448117 ) ) ( not ( = ?auto_3448113 ?auto_3448118 ) ) ( not ( = ?auto_3448107 ?auto_3448109 ) ) ( not ( = ?auto_3448111 ?auto_3448109 ) ) ( not ( = ?auto_3448108 ?auto_3448109 ) ) ( not ( = ?auto_3448107 ?auto_3448110 ) ) ( not ( = ?auto_3448111 ?auto_3448110 ) ) ( not ( = ?auto_3448108 ?auto_3448110 ) ) ( not ( = ?auto_3448109 ?auto_3448110 ) ) ( not ( = ?auto_3448114 ?auto_3448113 ) ) ( not ( = ?auto_3448114 ?auto_3448117 ) ) ( not ( = ?auto_3448114 ?auto_3448118 ) ) ( not ( = ?auto_3448107 ?auto_3448112 ) ) ( not ( = ?auto_3448111 ?auto_3448112 ) ) ( not ( = ?auto_3448108 ?auto_3448112 ) ) ( not ( = ?auto_3448109 ?auto_3448112 ) ) ( not ( = ?auto_3448110 ?auto_3448112 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3448107 ?auto_3448111 ?auto_3448108 ?auto_3448110 ?auto_3448109 ?auto_3448112 ?auto_3448106 )
      ( DELIVER-6PKG-VERIFY ?auto_3448107 ?auto_3448108 ?auto_3448109 ?auto_3448110 ?auto_3448111 ?auto_3448112 ?auto_3448106 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3448176 - OBJ
      ?auto_3448177 - OBJ
      ?auto_3448178 - OBJ
      ?auto_3448179 - OBJ
      ?auto_3448180 - OBJ
      ?auto_3448181 - OBJ
      ?auto_3448175 - LOCATION
    )
    :vars
    (
      ?auto_3448183 - LOCATION
      ?auto_3448185 - CITY
      ?auto_3448182 - LOCATION
      ?auto_3448186 - LOCATION
      ?auto_3448187 - LOCATION
      ?auto_3448184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3448183 ?auto_3448185 ) ( IN-CITY ?auto_3448175 ?auto_3448185 ) ( not ( = ?auto_3448175 ?auto_3448183 ) ) ( OBJ-AT ?auto_3448180 ?auto_3448183 ) ( OBJ-AT ?auto_3448179 ?auto_3448183 ) ( IN-CITY ?auto_3448182 ?auto_3448185 ) ( not ( = ?auto_3448175 ?auto_3448182 ) ) ( OBJ-AT ?auto_3448178 ?auto_3448182 ) ( OBJ-AT ?auto_3448177 ?auto_3448182 ) ( IN-CITY ?auto_3448186 ?auto_3448185 ) ( not ( = ?auto_3448175 ?auto_3448186 ) ) ( OBJ-AT ?auto_3448181 ?auto_3448186 ) ( IN-CITY ?auto_3448187 ?auto_3448185 ) ( not ( = ?auto_3448175 ?auto_3448187 ) ) ( OBJ-AT ?auto_3448176 ?auto_3448187 ) ( TRUCK-AT ?auto_3448184 ?auto_3448175 ) ( not ( = ?auto_3448176 ?auto_3448181 ) ) ( not ( = ?auto_3448186 ?auto_3448187 ) ) ( not ( = ?auto_3448176 ?auto_3448177 ) ) ( not ( = ?auto_3448181 ?auto_3448177 ) ) ( not ( = ?auto_3448182 ?auto_3448186 ) ) ( not ( = ?auto_3448182 ?auto_3448187 ) ) ( not ( = ?auto_3448176 ?auto_3448178 ) ) ( not ( = ?auto_3448181 ?auto_3448178 ) ) ( not ( = ?auto_3448177 ?auto_3448178 ) ) ( not ( = ?auto_3448176 ?auto_3448179 ) ) ( not ( = ?auto_3448181 ?auto_3448179 ) ) ( not ( = ?auto_3448177 ?auto_3448179 ) ) ( not ( = ?auto_3448178 ?auto_3448179 ) ) ( not ( = ?auto_3448183 ?auto_3448182 ) ) ( not ( = ?auto_3448183 ?auto_3448186 ) ) ( not ( = ?auto_3448183 ?auto_3448187 ) ) ( not ( = ?auto_3448176 ?auto_3448180 ) ) ( not ( = ?auto_3448181 ?auto_3448180 ) ) ( not ( = ?auto_3448177 ?auto_3448180 ) ) ( not ( = ?auto_3448178 ?auto_3448180 ) ) ( not ( = ?auto_3448179 ?auto_3448180 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3448176 ?auto_3448181 ?auto_3448177 ?auto_3448179 ?auto_3448178 ?auto_3448180 ?auto_3448175 )
      ( DELIVER-6PKG-VERIFY ?auto_3448176 ?auto_3448177 ?auto_3448178 ?auto_3448179 ?auto_3448180 ?auto_3448181 ?auto_3448175 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3448954 - OBJ
      ?auto_3448955 - OBJ
      ?auto_3448956 - OBJ
      ?auto_3448957 - OBJ
      ?auto_3448958 - OBJ
      ?auto_3448959 - OBJ
      ?auto_3448953 - LOCATION
    )
    :vars
    (
      ?auto_3448961 - LOCATION
      ?auto_3448963 - CITY
      ?auto_3448960 - LOCATION
      ?auto_3448964 - LOCATION
      ?auto_3448965 - LOCATION
      ?auto_3448962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3448961 ?auto_3448963 ) ( IN-CITY ?auto_3448953 ?auto_3448963 ) ( not ( = ?auto_3448953 ?auto_3448961 ) ) ( OBJ-AT ?auto_3448959 ?auto_3448961 ) ( OBJ-AT ?auto_3448956 ?auto_3448961 ) ( IN-CITY ?auto_3448960 ?auto_3448963 ) ( not ( = ?auto_3448953 ?auto_3448960 ) ) ( OBJ-AT ?auto_3448958 ?auto_3448960 ) ( OBJ-AT ?auto_3448955 ?auto_3448960 ) ( IN-CITY ?auto_3448964 ?auto_3448963 ) ( not ( = ?auto_3448953 ?auto_3448964 ) ) ( OBJ-AT ?auto_3448957 ?auto_3448964 ) ( IN-CITY ?auto_3448965 ?auto_3448963 ) ( not ( = ?auto_3448953 ?auto_3448965 ) ) ( OBJ-AT ?auto_3448954 ?auto_3448965 ) ( TRUCK-AT ?auto_3448962 ?auto_3448953 ) ( not ( = ?auto_3448954 ?auto_3448957 ) ) ( not ( = ?auto_3448964 ?auto_3448965 ) ) ( not ( = ?auto_3448954 ?auto_3448955 ) ) ( not ( = ?auto_3448957 ?auto_3448955 ) ) ( not ( = ?auto_3448960 ?auto_3448964 ) ) ( not ( = ?auto_3448960 ?auto_3448965 ) ) ( not ( = ?auto_3448954 ?auto_3448958 ) ) ( not ( = ?auto_3448957 ?auto_3448958 ) ) ( not ( = ?auto_3448955 ?auto_3448958 ) ) ( not ( = ?auto_3448954 ?auto_3448956 ) ) ( not ( = ?auto_3448957 ?auto_3448956 ) ) ( not ( = ?auto_3448955 ?auto_3448956 ) ) ( not ( = ?auto_3448958 ?auto_3448956 ) ) ( not ( = ?auto_3448961 ?auto_3448960 ) ) ( not ( = ?auto_3448961 ?auto_3448964 ) ) ( not ( = ?auto_3448961 ?auto_3448965 ) ) ( not ( = ?auto_3448954 ?auto_3448959 ) ) ( not ( = ?auto_3448957 ?auto_3448959 ) ) ( not ( = ?auto_3448955 ?auto_3448959 ) ) ( not ( = ?auto_3448958 ?auto_3448959 ) ) ( not ( = ?auto_3448956 ?auto_3448959 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3448954 ?auto_3448957 ?auto_3448955 ?auto_3448956 ?auto_3448958 ?auto_3448959 ?auto_3448953 )
      ( DELIVER-6PKG-VERIFY ?auto_3448954 ?auto_3448955 ?auto_3448956 ?auto_3448957 ?auto_3448958 ?auto_3448959 ?auto_3448953 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3449023 - OBJ
      ?auto_3449024 - OBJ
      ?auto_3449025 - OBJ
      ?auto_3449026 - OBJ
      ?auto_3449027 - OBJ
      ?auto_3449028 - OBJ
      ?auto_3449022 - LOCATION
    )
    :vars
    (
      ?auto_3449030 - LOCATION
      ?auto_3449032 - CITY
      ?auto_3449029 - LOCATION
      ?auto_3449033 - LOCATION
      ?auto_3449034 - LOCATION
      ?auto_3449031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3449030 ?auto_3449032 ) ( IN-CITY ?auto_3449022 ?auto_3449032 ) ( not ( = ?auto_3449022 ?auto_3449030 ) ) ( OBJ-AT ?auto_3449027 ?auto_3449030 ) ( OBJ-AT ?auto_3449025 ?auto_3449030 ) ( IN-CITY ?auto_3449029 ?auto_3449032 ) ( not ( = ?auto_3449022 ?auto_3449029 ) ) ( OBJ-AT ?auto_3449028 ?auto_3449029 ) ( OBJ-AT ?auto_3449024 ?auto_3449029 ) ( IN-CITY ?auto_3449033 ?auto_3449032 ) ( not ( = ?auto_3449022 ?auto_3449033 ) ) ( OBJ-AT ?auto_3449026 ?auto_3449033 ) ( IN-CITY ?auto_3449034 ?auto_3449032 ) ( not ( = ?auto_3449022 ?auto_3449034 ) ) ( OBJ-AT ?auto_3449023 ?auto_3449034 ) ( TRUCK-AT ?auto_3449031 ?auto_3449022 ) ( not ( = ?auto_3449023 ?auto_3449026 ) ) ( not ( = ?auto_3449033 ?auto_3449034 ) ) ( not ( = ?auto_3449023 ?auto_3449024 ) ) ( not ( = ?auto_3449026 ?auto_3449024 ) ) ( not ( = ?auto_3449029 ?auto_3449033 ) ) ( not ( = ?auto_3449029 ?auto_3449034 ) ) ( not ( = ?auto_3449023 ?auto_3449028 ) ) ( not ( = ?auto_3449026 ?auto_3449028 ) ) ( not ( = ?auto_3449024 ?auto_3449028 ) ) ( not ( = ?auto_3449023 ?auto_3449025 ) ) ( not ( = ?auto_3449026 ?auto_3449025 ) ) ( not ( = ?auto_3449024 ?auto_3449025 ) ) ( not ( = ?auto_3449028 ?auto_3449025 ) ) ( not ( = ?auto_3449030 ?auto_3449029 ) ) ( not ( = ?auto_3449030 ?auto_3449033 ) ) ( not ( = ?auto_3449030 ?auto_3449034 ) ) ( not ( = ?auto_3449023 ?auto_3449027 ) ) ( not ( = ?auto_3449026 ?auto_3449027 ) ) ( not ( = ?auto_3449024 ?auto_3449027 ) ) ( not ( = ?auto_3449028 ?auto_3449027 ) ) ( not ( = ?auto_3449025 ?auto_3449027 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3449023 ?auto_3449026 ?auto_3449024 ?auto_3449025 ?auto_3449028 ?auto_3449027 ?auto_3449022 )
      ( DELIVER-6PKG-VERIFY ?auto_3449023 ?auto_3449024 ?auto_3449025 ?auto_3449026 ?auto_3449027 ?auto_3449028 ?auto_3449022 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3449239 - OBJ
      ?auto_3449240 - OBJ
      ?auto_3449241 - OBJ
      ?auto_3449242 - OBJ
      ?auto_3449243 - OBJ
      ?auto_3449244 - OBJ
      ?auto_3449238 - LOCATION
    )
    :vars
    (
      ?auto_3449246 - LOCATION
      ?auto_3449248 - CITY
      ?auto_3449245 - LOCATION
      ?auto_3449249 - LOCATION
      ?auto_3449250 - LOCATION
      ?auto_3449247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3449246 ?auto_3449248 ) ( IN-CITY ?auto_3449238 ?auto_3449248 ) ( not ( = ?auto_3449238 ?auto_3449246 ) ) ( OBJ-AT ?auto_3449244 ?auto_3449246 ) ( OBJ-AT ?auto_3449241 ?auto_3449246 ) ( IN-CITY ?auto_3449245 ?auto_3449248 ) ( not ( = ?auto_3449238 ?auto_3449245 ) ) ( OBJ-AT ?auto_3449242 ?auto_3449245 ) ( OBJ-AT ?auto_3449240 ?auto_3449245 ) ( IN-CITY ?auto_3449249 ?auto_3449248 ) ( not ( = ?auto_3449238 ?auto_3449249 ) ) ( OBJ-AT ?auto_3449243 ?auto_3449249 ) ( IN-CITY ?auto_3449250 ?auto_3449248 ) ( not ( = ?auto_3449238 ?auto_3449250 ) ) ( OBJ-AT ?auto_3449239 ?auto_3449250 ) ( TRUCK-AT ?auto_3449247 ?auto_3449238 ) ( not ( = ?auto_3449239 ?auto_3449243 ) ) ( not ( = ?auto_3449249 ?auto_3449250 ) ) ( not ( = ?auto_3449239 ?auto_3449240 ) ) ( not ( = ?auto_3449243 ?auto_3449240 ) ) ( not ( = ?auto_3449245 ?auto_3449249 ) ) ( not ( = ?auto_3449245 ?auto_3449250 ) ) ( not ( = ?auto_3449239 ?auto_3449242 ) ) ( not ( = ?auto_3449243 ?auto_3449242 ) ) ( not ( = ?auto_3449240 ?auto_3449242 ) ) ( not ( = ?auto_3449239 ?auto_3449241 ) ) ( not ( = ?auto_3449243 ?auto_3449241 ) ) ( not ( = ?auto_3449240 ?auto_3449241 ) ) ( not ( = ?auto_3449242 ?auto_3449241 ) ) ( not ( = ?auto_3449246 ?auto_3449245 ) ) ( not ( = ?auto_3449246 ?auto_3449249 ) ) ( not ( = ?auto_3449246 ?auto_3449250 ) ) ( not ( = ?auto_3449239 ?auto_3449244 ) ) ( not ( = ?auto_3449243 ?auto_3449244 ) ) ( not ( = ?auto_3449240 ?auto_3449244 ) ) ( not ( = ?auto_3449242 ?auto_3449244 ) ) ( not ( = ?auto_3449241 ?auto_3449244 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3449239 ?auto_3449243 ?auto_3449240 ?auto_3449241 ?auto_3449242 ?auto_3449244 ?auto_3449238 )
      ( DELIVER-6PKG-VERIFY ?auto_3449239 ?auto_3449240 ?auto_3449241 ?auto_3449242 ?auto_3449243 ?auto_3449244 ?auto_3449238 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3449308 - OBJ
      ?auto_3449309 - OBJ
      ?auto_3449310 - OBJ
      ?auto_3449311 - OBJ
      ?auto_3449312 - OBJ
      ?auto_3449313 - OBJ
      ?auto_3449307 - LOCATION
    )
    :vars
    (
      ?auto_3449315 - LOCATION
      ?auto_3449317 - CITY
      ?auto_3449314 - LOCATION
      ?auto_3449318 - LOCATION
      ?auto_3449319 - LOCATION
      ?auto_3449316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3449315 ?auto_3449317 ) ( IN-CITY ?auto_3449307 ?auto_3449317 ) ( not ( = ?auto_3449307 ?auto_3449315 ) ) ( OBJ-AT ?auto_3449312 ?auto_3449315 ) ( OBJ-AT ?auto_3449310 ?auto_3449315 ) ( IN-CITY ?auto_3449314 ?auto_3449317 ) ( not ( = ?auto_3449307 ?auto_3449314 ) ) ( OBJ-AT ?auto_3449311 ?auto_3449314 ) ( OBJ-AT ?auto_3449309 ?auto_3449314 ) ( IN-CITY ?auto_3449318 ?auto_3449317 ) ( not ( = ?auto_3449307 ?auto_3449318 ) ) ( OBJ-AT ?auto_3449313 ?auto_3449318 ) ( IN-CITY ?auto_3449319 ?auto_3449317 ) ( not ( = ?auto_3449307 ?auto_3449319 ) ) ( OBJ-AT ?auto_3449308 ?auto_3449319 ) ( TRUCK-AT ?auto_3449316 ?auto_3449307 ) ( not ( = ?auto_3449308 ?auto_3449313 ) ) ( not ( = ?auto_3449318 ?auto_3449319 ) ) ( not ( = ?auto_3449308 ?auto_3449309 ) ) ( not ( = ?auto_3449313 ?auto_3449309 ) ) ( not ( = ?auto_3449314 ?auto_3449318 ) ) ( not ( = ?auto_3449314 ?auto_3449319 ) ) ( not ( = ?auto_3449308 ?auto_3449311 ) ) ( not ( = ?auto_3449313 ?auto_3449311 ) ) ( not ( = ?auto_3449309 ?auto_3449311 ) ) ( not ( = ?auto_3449308 ?auto_3449310 ) ) ( not ( = ?auto_3449313 ?auto_3449310 ) ) ( not ( = ?auto_3449309 ?auto_3449310 ) ) ( not ( = ?auto_3449311 ?auto_3449310 ) ) ( not ( = ?auto_3449315 ?auto_3449314 ) ) ( not ( = ?auto_3449315 ?auto_3449318 ) ) ( not ( = ?auto_3449315 ?auto_3449319 ) ) ( not ( = ?auto_3449308 ?auto_3449312 ) ) ( not ( = ?auto_3449313 ?auto_3449312 ) ) ( not ( = ?auto_3449309 ?auto_3449312 ) ) ( not ( = ?auto_3449311 ?auto_3449312 ) ) ( not ( = ?auto_3449310 ?auto_3449312 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3449308 ?auto_3449313 ?auto_3449309 ?auto_3449310 ?auto_3449311 ?auto_3449312 ?auto_3449307 )
      ( DELIVER-6PKG-VERIFY ?auto_3449308 ?auto_3449309 ?auto_3449310 ?auto_3449311 ?auto_3449312 ?auto_3449313 ?auto_3449307 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3449668 - OBJ
      ?auto_3449669 - OBJ
      ?auto_3449670 - OBJ
      ?auto_3449671 - OBJ
      ?auto_3449672 - OBJ
      ?auto_3449673 - OBJ
      ?auto_3449667 - LOCATION
    )
    :vars
    (
      ?auto_3449675 - LOCATION
      ?auto_3449677 - CITY
      ?auto_3449674 - LOCATION
      ?auto_3449678 - LOCATION
      ?auto_3449679 - LOCATION
      ?auto_3449676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3449675 ?auto_3449677 ) ( IN-CITY ?auto_3449667 ?auto_3449677 ) ( not ( = ?auto_3449667 ?auto_3449675 ) ) ( OBJ-AT ?auto_3449671 ?auto_3449675 ) ( OBJ-AT ?auto_3449670 ?auto_3449675 ) ( IN-CITY ?auto_3449674 ?auto_3449677 ) ( not ( = ?auto_3449667 ?auto_3449674 ) ) ( OBJ-AT ?auto_3449673 ?auto_3449674 ) ( OBJ-AT ?auto_3449669 ?auto_3449674 ) ( IN-CITY ?auto_3449678 ?auto_3449677 ) ( not ( = ?auto_3449667 ?auto_3449678 ) ) ( OBJ-AT ?auto_3449672 ?auto_3449678 ) ( IN-CITY ?auto_3449679 ?auto_3449677 ) ( not ( = ?auto_3449667 ?auto_3449679 ) ) ( OBJ-AT ?auto_3449668 ?auto_3449679 ) ( TRUCK-AT ?auto_3449676 ?auto_3449667 ) ( not ( = ?auto_3449668 ?auto_3449672 ) ) ( not ( = ?auto_3449678 ?auto_3449679 ) ) ( not ( = ?auto_3449668 ?auto_3449669 ) ) ( not ( = ?auto_3449672 ?auto_3449669 ) ) ( not ( = ?auto_3449674 ?auto_3449678 ) ) ( not ( = ?auto_3449674 ?auto_3449679 ) ) ( not ( = ?auto_3449668 ?auto_3449673 ) ) ( not ( = ?auto_3449672 ?auto_3449673 ) ) ( not ( = ?auto_3449669 ?auto_3449673 ) ) ( not ( = ?auto_3449668 ?auto_3449670 ) ) ( not ( = ?auto_3449672 ?auto_3449670 ) ) ( not ( = ?auto_3449669 ?auto_3449670 ) ) ( not ( = ?auto_3449673 ?auto_3449670 ) ) ( not ( = ?auto_3449675 ?auto_3449674 ) ) ( not ( = ?auto_3449675 ?auto_3449678 ) ) ( not ( = ?auto_3449675 ?auto_3449679 ) ) ( not ( = ?auto_3449668 ?auto_3449671 ) ) ( not ( = ?auto_3449672 ?auto_3449671 ) ) ( not ( = ?auto_3449669 ?auto_3449671 ) ) ( not ( = ?auto_3449673 ?auto_3449671 ) ) ( not ( = ?auto_3449670 ?auto_3449671 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3449668 ?auto_3449672 ?auto_3449669 ?auto_3449670 ?auto_3449673 ?auto_3449671 ?auto_3449667 )
      ( DELIVER-6PKG-VERIFY ?auto_3449668 ?auto_3449669 ?auto_3449670 ?auto_3449671 ?auto_3449672 ?auto_3449673 ?auto_3449667 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3449811 - OBJ
      ?auto_3449812 - OBJ
      ?auto_3449813 - OBJ
      ?auto_3449814 - OBJ
      ?auto_3449815 - OBJ
      ?auto_3449816 - OBJ
      ?auto_3449810 - LOCATION
    )
    :vars
    (
      ?auto_3449818 - LOCATION
      ?auto_3449820 - CITY
      ?auto_3449817 - LOCATION
      ?auto_3449821 - LOCATION
      ?auto_3449822 - LOCATION
      ?auto_3449819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3449818 ?auto_3449820 ) ( IN-CITY ?auto_3449810 ?auto_3449820 ) ( not ( = ?auto_3449810 ?auto_3449818 ) ) ( OBJ-AT ?auto_3449814 ?auto_3449818 ) ( OBJ-AT ?auto_3449813 ?auto_3449818 ) ( IN-CITY ?auto_3449817 ?auto_3449820 ) ( not ( = ?auto_3449810 ?auto_3449817 ) ) ( OBJ-AT ?auto_3449815 ?auto_3449817 ) ( OBJ-AT ?auto_3449812 ?auto_3449817 ) ( IN-CITY ?auto_3449821 ?auto_3449820 ) ( not ( = ?auto_3449810 ?auto_3449821 ) ) ( OBJ-AT ?auto_3449816 ?auto_3449821 ) ( IN-CITY ?auto_3449822 ?auto_3449820 ) ( not ( = ?auto_3449810 ?auto_3449822 ) ) ( OBJ-AT ?auto_3449811 ?auto_3449822 ) ( TRUCK-AT ?auto_3449819 ?auto_3449810 ) ( not ( = ?auto_3449811 ?auto_3449816 ) ) ( not ( = ?auto_3449821 ?auto_3449822 ) ) ( not ( = ?auto_3449811 ?auto_3449812 ) ) ( not ( = ?auto_3449816 ?auto_3449812 ) ) ( not ( = ?auto_3449817 ?auto_3449821 ) ) ( not ( = ?auto_3449817 ?auto_3449822 ) ) ( not ( = ?auto_3449811 ?auto_3449815 ) ) ( not ( = ?auto_3449816 ?auto_3449815 ) ) ( not ( = ?auto_3449812 ?auto_3449815 ) ) ( not ( = ?auto_3449811 ?auto_3449813 ) ) ( not ( = ?auto_3449816 ?auto_3449813 ) ) ( not ( = ?auto_3449812 ?auto_3449813 ) ) ( not ( = ?auto_3449815 ?auto_3449813 ) ) ( not ( = ?auto_3449818 ?auto_3449817 ) ) ( not ( = ?auto_3449818 ?auto_3449821 ) ) ( not ( = ?auto_3449818 ?auto_3449822 ) ) ( not ( = ?auto_3449811 ?auto_3449814 ) ) ( not ( = ?auto_3449816 ?auto_3449814 ) ) ( not ( = ?auto_3449812 ?auto_3449814 ) ) ( not ( = ?auto_3449815 ?auto_3449814 ) ) ( not ( = ?auto_3449813 ?auto_3449814 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3449811 ?auto_3449816 ?auto_3449812 ?auto_3449813 ?auto_3449815 ?auto_3449814 ?auto_3449810 )
      ( DELIVER-6PKG-VERIFY ?auto_3449811 ?auto_3449812 ?auto_3449813 ?auto_3449814 ?auto_3449815 ?auto_3449816 ?auto_3449810 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3561831 - OBJ
      ?auto_3561832 - OBJ
      ?auto_3561833 - OBJ
      ?auto_3561834 - OBJ
      ?auto_3561835 - OBJ
      ?auto_3561836 - OBJ
      ?auto_3561830 - LOCATION
    )
    :vars
    (
      ?auto_3561838 - LOCATION
      ?auto_3561840 - CITY
      ?auto_3561837 - LOCATION
      ?auto_3561841 - LOCATION
      ?auto_3561842 - LOCATION
      ?auto_3561839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3561838 ?auto_3561840 ) ( IN-CITY ?auto_3561830 ?auto_3561840 ) ( not ( = ?auto_3561830 ?auto_3561838 ) ) ( OBJ-AT ?auto_3561836 ?auto_3561838 ) ( OBJ-AT ?auto_3561835 ?auto_3561838 ) ( IN-CITY ?auto_3561837 ?auto_3561840 ) ( not ( = ?auto_3561830 ?auto_3561837 ) ) ( OBJ-AT ?auto_3561834 ?auto_3561837 ) ( OBJ-AT ?auto_3561831 ?auto_3561837 ) ( IN-CITY ?auto_3561841 ?auto_3561840 ) ( not ( = ?auto_3561830 ?auto_3561841 ) ) ( OBJ-AT ?auto_3561833 ?auto_3561841 ) ( IN-CITY ?auto_3561842 ?auto_3561840 ) ( not ( = ?auto_3561830 ?auto_3561842 ) ) ( OBJ-AT ?auto_3561832 ?auto_3561842 ) ( TRUCK-AT ?auto_3561839 ?auto_3561830 ) ( not ( = ?auto_3561832 ?auto_3561833 ) ) ( not ( = ?auto_3561841 ?auto_3561842 ) ) ( not ( = ?auto_3561832 ?auto_3561831 ) ) ( not ( = ?auto_3561833 ?auto_3561831 ) ) ( not ( = ?auto_3561837 ?auto_3561841 ) ) ( not ( = ?auto_3561837 ?auto_3561842 ) ) ( not ( = ?auto_3561832 ?auto_3561834 ) ) ( not ( = ?auto_3561833 ?auto_3561834 ) ) ( not ( = ?auto_3561831 ?auto_3561834 ) ) ( not ( = ?auto_3561832 ?auto_3561835 ) ) ( not ( = ?auto_3561833 ?auto_3561835 ) ) ( not ( = ?auto_3561831 ?auto_3561835 ) ) ( not ( = ?auto_3561834 ?auto_3561835 ) ) ( not ( = ?auto_3561838 ?auto_3561837 ) ) ( not ( = ?auto_3561838 ?auto_3561841 ) ) ( not ( = ?auto_3561838 ?auto_3561842 ) ) ( not ( = ?auto_3561832 ?auto_3561836 ) ) ( not ( = ?auto_3561833 ?auto_3561836 ) ) ( not ( = ?auto_3561831 ?auto_3561836 ) ) ( not ( = ?auto_3561834 ?auto_3561836 ) ) ( not ( = ?auto_3561835 ?auto_3561836 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3561832 ?auto_3561833 ?auto_3561831 ?auto_3561835 ?auto_3561834 ?auto_3561836 ?auto_3561830 )
      ( DELIVER-6PKG-VERIFY ?auto_3561831 ?auto_3561832 ?auto_3561833 ?auto_3561834 ?auto_3561835 ?auto_3561836 ?auto_3561830 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3561963 - OBJ
      ?auto_3561964 - OBJ
      ?auto_3561965 - OBJ
      ?auto_3561966 - OBJ
      ?auto_3561967 - OBJ
      ?auto_3561968 - OBJ
      ?auto_3561962 - LOCATION
    )
    :vars
    (
      ?auto_3561970 - LOCATION
      ?auto_3561972 - CITY
      ?auto_3561969 - LOCATION
      ?auto_3561973 - LOCATION
      ?auto_3561974 - LOCATION
      ?auto_3561971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3561970 ?auto_3561972 ) ( IN-CITY ?auto_3561962 ?auto_3561972 ) ( not ( = ?auto_3561962 ?auto_3561970 ) ) ( OBJ-AT ?auto_3561968 ?auto_3561970 ) ( OBJ-AT ?auto_3561966 ?auto_3561970 ) ( IN-CITY ?auto_3561969 ?auto_3561972 ) ( not ( = ?auto_3561962 ?auto_3561969 ) ) ( OBJ-AT ?auto_3561967 ?auto_3561969 ) ( OBJ-AT ?auto_3561963 ?auto_3561969 ) ( IN-CITY ?auto_3561973 ?auto_3561972 ) ( not ( = ?auto_3561962 ?auto_3561973 ) ) ( OBJ-AT ?auto_3561965 ?auto_3561973 ) ( IN-CITY ?auto_3561974 ?auto_3561972 ) ( not ( = ?auto_3561962 ?auto_3561974 ) ) ( OBJ-AT ?auto_3561964 ?auto_3561974 ) ( TRUCK-AT ?auto_3561971 ?auto_3561962 ) ( not ( = ?auto_3561964 ?auto_3561965 ) ) ( not ( = ?auto_3561973 ?auto_3561974 ) ) ( not ( = ?auto_3561964 ?auto_3561963 ) ) ( not ( = ?auto_3561965 ?auto_3561963 ) ) ( not ( = ?auto_3561969 ?auto_3561973 ) ) ( not ( = ?auto_3561969 ?auto_3561974 ) ) ( not ( = ?auto_3561964 ?auto_3561967 ) ) ( not ( = ?auto_3561965 ?auto_3561967 ) ) ( not ( = ?auto_3561963 ?auto_3561967 ) ) ( not ( = ?auto_3561964 ?auto_3561966 ) ) ( not ( = ?auto_3561965 ?auto_3561966 ) ) ( not ( = ?auto_3561963 ?auto_3561966 ) ) ( not ( = ?auto_3561967 ?auto_3561966 ) ) ( not ( = ?auto_3561970 ?auto_3561969 ) ) ( not ( = ?auto_3561970 ?auto_3561973 ) ) ( not ( = ?auto_3561970 ?auto_3561974 ) ) ( not ( = ?auto_3561964 ?auto_3561968 ) ) ( not ( = ?auto_3561965 ?auto_3561968 ) ) ( not ( = ?auto_3561963 ?auto_3561968 ) ) ( not ( = ?auto_3561967 ?auto_3561968 ) ) ( not ( = ?auto_3561966 ?auto_3561968 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3561964 ?auto_3561965 ?auto_3561963 ?auto_3561966 ?auto_3561967 ?auto_3561968 ?auto_3561962 )
      ( DELIVER-6PKG-VERIFY ?auto_3561963 ?auto_3561964 ?auto_3561965 ?auto_3561966 ?auto_3561967 ?auto_3561968 ?auto_3561962 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3562032 - OBJ
      ?auto_3562033 - OBJ
      ?auto_3562034 - OBJ
      ?auto_3562035 - OBJ
      ?auto_3562036 - OBJ
      ?auto_3562037 - OBJ
      ?auto_3562031 - LOCATION
    )
    :vars
    (
      ?auto_3562039 - LOCATION
      ?auto_3562041 - CITY
      ?auto_3562038 - LOCATION
      ?auto_3562042 - LOCATION
      ?auto_3562043 - LOCATION
      ?auto_3562040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3562039 ?auto_3562041 ) ( IN-CITY ?auto_3562031 ?auto_3562041 ) ( not ( = ?auto_3562031 ?auto_3562039 ) ) ( OBJ-AT ?auto_3562036 ?auto_3562039 ) ( OBJ-AT ?auto_3562035 ?auto_3562039 ) ( IN-CITY ?auto_3562038 ?auto_3562041 ) ( not ( = ?auto_3562031 ?auto_3562038 ) ) ( OBJ-AT ?auto_3562037 ?auto_3562038 ) ( OBJ-AT ?auto_3562032 ?auto_3562038 ) ( IN-CITY ?auto_3562042 ?auto_3562041 ) ( not ( = ?auto_3562031 ?auto_3562042 ) ) ( OBJ-AT ?auto_3562034 ?auto_3562042 ) ( IN-CITY ?auto_3562043 ?auto_3562041 ) ( not ( = ?auto_3562031 ?auto_3562043 ) ) ( OBJ-AT ?auto_3562033 ?auto_3562043 ) ( TRUCK-AT ?auto_3562040 ?auto_3562031 ) ( not ( = ?auto_3562033 ?auto_3562034 ) ) ( not ( = ?auto_3562042 ?auto_3562043 ) ) ( not ( = ?auto_3562033 ?auto_3562032 ) ) ( not ( = ?auto_3562034 ?auto_3562032 ) ) ( not ( = ?auto_3562038 ?auto_3562042 ) ) ( not ( = ?auto_3562038 ?auto_3562043 ) ) ( not ( = ?auto_3562033 ?auto_3562037 ) ) ( not ( = ?auto_3562034 ?auto_3562037 ) ) ( not ( = ?auto_3562032 ?auto_3562037 ) ) ( not ( = ?auto_3562033 ?auto_3562035 ) ) ( not ( = ?auto_3562034 ?auto_3562035 ) ) ( not ( = ?auto_3562032 ?auto_3562035 ) ) ( not ( = ?auto_3562037 ?auto_3562035 ) ) ( not ( = ?auto_3562039 ?auto_3562038 ) ) ( not ( = ?auto_3562039 ?auto_3562042 ) ) ( not ( = ?auto_3562039 ?auto_3562043 ) ) ( not ( = ?auto_3562033 ?auto_3562036 ) ) ( not ( = ?auto_3562034 ?auto_3562036 ) ) ( not ( = ?auto_3562032 ?auto_3562036 ) ) ( not ( = ?auto_3562037 ?auto_3562036 ) ) ( not ( = ?auto_3562035 ?auto_3562036 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3562033 ?auto_3562034 ?auto_3562032 ?auto_3562035 ?auto_3562037 ?auto_3562036 ?auto_3562031 )
      ( DELIVER-6PKG-VERIFY ?auto_3562032 ?auto_3562033 ?auto_3562034 ?auto_3562035 ?auto_3562036 ?auto_3562037 ?auto_3562031 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3564162 - OBJ
      ?auto_3564163 - OBJ
      ?auto_3564164 - OBJ
      ?auto_3564165 - OBJ
      ?auto_3564166 - OBJ
      ?auto_3564167 - OBJ
      ?auto_3564161 - LOCATION
    )
    :vars
    (
      ?auto_3564169 - LOCATION
      ?auto_3564171 - CITY
      ?auto_3564168 - LOCATION
      ?auto_3564172 - LOCATION
      ?auto_3564173 - LOCATION
      ?auto_3564170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3564169 ?auto_3564171 ) ( IN-CITY ?auto_3564161 ?auto_3564171 ) ( not ( = ?auto_3564161 ?auto_3564169 ) ) ( OBJ-AT ?auto_3564167 ?auto_3564169 ) ( OBJ-AT ?auto_3564166 ?auto_3564169 ) ( IN-CITY ?auto_3564168 ?auto_3564171 ) ( not ( = ?auto_3564161 ?auto_3564168 ) ) ( OBJ-AT ?auto_3564164 ?auto_3564168 ) ( OBJ-AT ?auto_3564162 ?auto_3564168 ) ( IN-CITY ?auto_3564172 ?auto_3564171 ) ( not ( = ?auto_3564161 ?auto_3564172 ) ) ( OBJ-AT ?auto_3564165 ?auto_3564172 ) ( IN-CITY ?auto_3564173 ?auto_3564171 ) ( not ( = ?auto_3564161 ?auto_3564173 ) ) ( OBJ-AT ?auto_3564163 ?auto_3564173 ) ( TRUCK-AT ?auto_3564170 ?auto_3564161 ) ( not ( = ?auto_3564163 ?auto_3564165 ) ) ( not ( = ?auto_3564172 ?auto_3564173 ) ) ( not ( = ?auto_3564163 ?auto_3564162 ) ) ( not ( = ?auto_3564165 ?auto_3564162 ) ) ( not ( = ?auto_3564168 ?auto_3564172 ) ) ( not ( = ?auto_3564168 ?auto_3564173 ) ) ( not ( = ?auto_3564163 ?auto_3564164 ) ) ( not ( = ?auto_3564165 ?auto_3564164 ) ) ( not ( = ?auto_3564162 ?auto_3564164 ) ) ( not ( = ?auto_3564163 ?auto_3564166 ) ) ( not ( = ?auto_3564165 ?auto_3564166 ) ) ( not ( = ?auto_3564162 ?auto_3564166 ) ) ( not ( = ?auto_3564164 ?auto_3564166 ) ) ( not ( = ?auto_3564169 ?auto_3564168 ) ) ( not ( = ?auto_3564169 ?auto_3564172 ) ) ( not ( = ?auto_3564169 ?auto_3564173 ) ) ( not ( = ?auto_3564163 ?auto_3564167 ) ) ( not ( = ?auto_3564165 ?auto_3564167 ) ) ( not ( = ?auto_3564162 ?auto_3564167 ) ) ( not ( = ?auto_3564164 ?auto_3564167 ) ) ( not ( = ?auto_3564166 ?auto_3564167 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3564163 ?auto_3564165 ?auto_3564162 ?auto_3564166 ?auto_3564164 ?auto_3564167 ?auto_3564161 )
      ( DELIVER-6PKG-VERIFY ?auto_3564162 ?auto_3564163 ?auto_3564164 ?auto_3564165 ?auto_3564166 ?auto_3564167 ?auto_3564161 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3564588 - OBJ
      ?auto_3564589 - OBJ
      ?auto_3564590 - OBJ
      ?auto_3564591 - OBJ
      ?auto_3564592 - OBJ
      ?auto_3564593 - OBJ
      ?auto_3564587 - LOCATION
    )
    :vars
    (
      ?auto_3564595 - LOCATION
      ?auto_3564597 - CITY
      ?auto_3564594 - LOCATION
      ?auto_3564598 - LOCATION
      ?auto_3564599 - LOCATION
      ?auto_3564596 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3564595 ?auto_3564597 ) ( IN-CITY ?auto_3564587 ?auto_3564597 ) ( not ( = ?auto_3564587 ?auto_3564595 ) ) ( OBJ-AT ?auto_3564593 ?auto_3564595 ) ( OBJ-AT ?auto_3564591 ?auto_3564595 ) ( IN-CITY ?auto_3564594 ?auto_3564597 ) ( not ( = ?auto_3564587 ?auto_3564594 ) ) ( OBJ-AT ?auto_3564590 ?auto_3564594 ) ( OBJ-AT ?auto_3564588 ?auto_3564594 ) ( IN-CITY ?auto_3564598 ?auto_3564597 ) ( not ( = ?auto_3564587 ?auto_3564598 ) ) ( OBJ-AT ?auto_3564592 ?auto_3564598 ) ( IN-CITY ?auto_3564599 ?auto_3564597 ) ( not ( = ?auto_3564587 ?auto_3564599 ) ) ( OBJ-AT ?auto_3564589 ?auto_3564599 ) ( TRUCK-AT ?auto_3564596 ?auto_3564587 ) ( not ( = ?auto_3564589 ?auto_3564592 ) ) ( not ( = ?auto_3564598 ?auto_3564599 ) ) ( not ( = ?auto_3564589 ?auto_3564588 ) ) ( not ( = ?auto_3564592 ?auto_3564588 ) ) ( not ( = ?auto_3564594 ?auto_3564598 ) ) ( not ( = ?auto_3564594 ?auto_3564599 ) ) ( not ( = ?auto_3564589 ?auto_3564590 ) ) ( not ( = ?auto_3564592 ?auto_3564590 ) ) ( not ( = ?auto_3564588 ?auto_3564590 ) ) ( not ( = ?auto_3564589 ?auto_3564591 ) ) ( not ( = ?auto_3564592 ?auto_3564591 ) ) ( not ( = ?auto_3564588 ?auto_3564591 ) ) ( not ( = ?auto_3564590 ?auto_3564591 ) ) ( not ( = ?auto_3564595 ?auto_3564594 ) ) ( not ( = ?auto_3564595 ?auto_3564598 ) ) ( not ( = ?auto_3564595 ?auto_3564599 ) ) ( not ( = ?auto_3564589 ?auto_3564593 ) ) ( not ( = ?auto_3564592 ?auto_3564593 ) ) ( not ( = ?auto_3564588 ?auto_3564593 ) ) ( not ( = ?auto_3564590 ?auto_3564593 ) ) ( not ( = ?auto_3564591 ?auto_3564593 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3564589 ?auto_3564592 ?auto_3564588 ?auto_3564591 ?auto_3564590 ?auto_3564593 ?auto_3564587 )
      ( DELIVER-6PKG-VERIFY ?auto_3564588 ?auto_3564589 ?auto_3564590 ?auto_3564591 ?auto_3564592 ?auto_3564593 ?auto_3564587 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3564657 - OBJ
      ?auto_3564658 - OBJ
      ?auto_3564659 - OBJ
      ?auto_3564660 - OBJ
      ?auto_3564661 - OBJ
      ?auto_3564662 - OBJ
      ?auto_3564656 - LOCATION
    )
    :vars
    (
      ?auto_3564664 - LOCATION
      ?auto_3564666 - CITY
      ?auto_3564663 - LOCATION
      ?auto_3564667 - LOCATION
      ?auto_3564668 - LOCATION
      ?auto_3564665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3564664 ?auto_3564666 ) ( IN-CITY ?auto_3564656 ?auto_3564666 ) ( not ( = ?auto_3564656 ?auto_3564664 ) ) ( OBJ-AT ?auto_3564661 ?auto_3564664 ) ( OBJ-AT ?auto_3564660 ?auto_3564664 ) ( IN-CITY ?auto_3564663 ?auto_3564666 ) ( not ( = ?auto_3564656 ?auto_3564663 ) ) ( OBJ-AT ?auto_3564659 ?auto_3564663 ) ( OBJ-AT ?auto_3564657 ?auto_3564663 ) ( IN-CITY ?auto_3564667 ?auto_3564666 ) ( not ( = ?auto_3564656 ?auto_3564667 ) ) ( OBJ-AT ?auto_3564662 ?auto_3564667 ) ( IN-CITY ?auto_3564668 ?auto_3564666 ) ( not ( = ?auto_3564656 ?auto_3564668 ) ) ( OBJ-AT ?auto_3564658 ?auto_3564668 ) ( TRUCK-AT ?auto_3564665 ?auto_3564656 ) ( not ( = ?auto_3564658 ?auto_3564662 ) ) ( not ( = ?auto_3564667 ?auto_3564668 ) ) ( not ( = ?auto_3564658 ?auto_3564657 ) ) ( not ( = ?auto_3564662 ?auto_3564657 ) ) ( not ( = ?auto_3564663 ?auto_3564667 ) ) ( not ( = ?auto_3564663 ?auto_3564668 ) ) ( not ( = ?auto_3564658 ?auto_3564659 ) ) ( not ( = ?auto_3564662 ?auto_3564659 ) ) ( not ( = ?auto_3564657 ?auto_3564659 ) ) ( not ( = ?auto_3564658 ?auto_3564660 ) ) ( not ( = ?auto_3564662 ?auto_3564660 ) ) ( not ( = ?auto_3564657 ?auto_3564660 ) ) ( not ( = ?auto_3564659 ?auto_3564660 ) ) ( not ( = ?auto_3564664 ?auto_3564663 ) ) ( not ( = ?auto_3564664 ?auto_3564667 ) ) ( not ( = ?auto_3564664 ?auto_3564668 ) ) ( not ( = ?auto_3564658 ?auto_3564661 ) ) ( not ( = ?auto_3564662 ?auto_3564661 ) ) ( not ( = ?auto_3564657 ?auto_3564661 ) ) ( not ( = ?auto_3564659 ?auto_3564661 ) ) ( not ( = ?auto_3564660 ?auto_3564661 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3564658 ?auto_3564662 ?auto_3564657 ?auto_3564660 ?auto_3564659 ?auto_3564661 ?auto_3564656 )
      ( DELIVER-6PKG-VERIFY ?auto_3564657 ?auto_3564658 ?auto_3564659 ?auto_3564660 ?auto_3564661 ?auto_3564662 ?auto_3564656 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3565435 - OBJ
      ?auto_3565436 - OBJ
      ?auto_3565437 - OBJ
      ?auto_3565438 - OBJ
      ?auto_3565439 - OBJ
      ?auto_3565440 - OBJ
      ?auto_3565434 - LOCATION
    )
    :vars
    (
      ?auto_3565442 - LOCATION
      ?auto_3565444 - CITY
      ?auto_3565441 - LOCATION
      ?auto_3565445 - LOCATION
      ?auto_3565446 - LOCATION
      ?auto_3565443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3565442 ?auto_3565444 ) ( IN-CITY ?auto_3565434 ?auto_3565444 ) ( not ( = ?auto_3565434 ?auto_3565442 ) ) ( OBJ-AT ?auto_3565440 ?auto_3565442 ) ( OBJ-AT ?auto_3565437 ?auto_3565442 ) ( IN-CITY ?auto_3565441 ?auto_3565444 ) ( not ( = ?auto_3565434 ?auto_3565441 ) ) ( OBJ-AT ?auto_3565439 ?auto_3565441 ) ( OBJ-AT ?auto_3565435 ?auto_3565441 ) ( IN-CITY ?auto_3565445 ?auto_3565444 ) ( not ( = ?auto_3565434 ?auto_3565445 ) ) ( OBJ-AT ?auto_3565438 ?auto_3565445 ) ( IN-CITY ?auto_3565446 ?auto_3565444 ) ( not ( = ?auto_3565434 ?auto_3565446 ) ) ( OBJ-AT ?auto_3565436 ?auto_3565446 ) ( TRUCK-AT ?auto_3565443 ?auto_3565434 ) ( not ( = ?auto_3565436 ?auto_3565438 ) ) ( not ( = ?auto_3565445 ?auto_3565446 ) ) ( not ( = ?auto_3565436 ?auto_3565435 ) ) ( not ( = ?auto_3565438 ?auto_3565435 ) ) ( not ( = ?auto_3565441 ?auto_3565445 ) ) ( not ( = ?auto_3565441 ?auto_3565446 ) ) ( not ( = ?auto_3565436 ?auto_3565439 ) ) ( not ( = ?auto_3565438 ?auto_3565439 ) ) ( not ( = ?auto_3565435 ?auto_3565439 ) ) ( not ( = ?auto_3565436 ?auto_3565437 ) ) ( not ( = ?auto_3565438 ?auto_3565437 ) ) ( not ( = ?auto_3565435 ?auto_3565437 ) ) ( not ( = ?auto_3565439 ?auto_3565437 ) ) ( not ( = ?auto_3565442 ?auto_3565441 ) ) ( not ( = ?auto_3565442 ?auto_3565445 ) ) ( not ( = ?auto_3565442 ?auto_3565446 ) ) ( not ( = ?auto_3565436 ?auto_3565440 ) ) ( not ( = ?auto_3565438 ?auto_3565440 ) ) ( not ( = ?auto_3565435 ?auto_3565440 ) ) ( not ( = ?auto_3565439 ?auto_3565440 ) ) ( not ( = ?auto_3565437 ?auto_3565440 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3565436 ?auto_3565438 ?auto_3565435 ?auto_3565437 ?auto_3565439 ?auto_3565440 ?auto_3565434 )
      ( DELIVER-6PKG-VERIFY ?auto_3565435 ?auto_3565436 ?auto_3565437 ?auto_3565438 ?auto_3565439 ?auto_3565440 ?auto_3565434 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3565504 - OBJ
      ?auto_3565505 - OBJ
      ?auto_3565506 - OBJ
      ?auto_3565507 - OBJ
      ?auto_3565508 - OBJ
      ?auto_3565509 - OBJ
      ?auto_3565503 - LOCATION
    )
    :vars
    (
      ?auto_3565511 - LOCATION
      ?auto_3565513 - CITY
      ?auto_3565510 - LOCATION
      ?auto_3565514 - LOCATION
      ?auto_3565515 - LOCATION
      ?auto_3565512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3565511 ?auto_3565513 ) ( IN-CITY ?auto_3565503 ?auto_3565513 ) ( not ( = ?auto_3565503 ?auto_3565511 ) ) ( OBJ-AT ?auto_3565508 ?auto_3565511 ) ( OBJ-AT ?auto_3565506 ?auto_3565511 ) ( IN-CITY ?auto_3565510 ?auto_3565513 ) ( not ( = ?auto_3565503 ?auto_3565510 ) ) ( OBJ-AT ?auto_3565509 ?auto_3565510 ) ( OBJ-AT ?auto_3565504 ?auto_3565510 ) ( IN-CITY ?auto_3565514 ?auto_3565513 ) ( not ( = ?auto_3565503 ?auto_3565514 ) ) ( OBJ-AT ?auto_3565507 ?auto_3565514 ) ( IN-CITY ?auto_3565515 ?auto_3565513 ) ( not ( = ?auto_3565503 ?auto_3565515 ) ) ( OBJ-AT ?auto_3565505 ?auto_3565515 ) ( TRUCK-AT ?auto_3565512 ?auto_3565503 ) ( not ( = ?auto_3565505 ?auto_3565507 ) ) ( not ( = ?auto_3565514 ?auto_3565515 ) ) ( not ( = ?auto_3565505 ?auto_3565504 ) ) ( not ( = ?auto_3565507 ?auto_3565504 ) ) ( not ( = ?auto_3565510 ?auto_3565514 ) ) ( not ( = ?auto_3565510 ?auto_3565515 ) ) ( not ( = ?auto_3565505 ?auto_3565509 ) ) ( not ( = ?auto_3565507 ?auto_3565509 ) ) ( not ( = ?auto_3565504 ?auto_3565509 ) ) ( not ( = ?auto_3565505 ?auto_3565506 ) ) ( not ( = ?auto_3565507 ?auto_3565506 ) ) ( not ( = ?auto_3565504 ?auto_3565506 ) ) ( not ( = ?auto_3565509 ?auto_3565506 ) ) ( not ( = ?auto_3565511 ?auto_3565510 ) ) ( not ( = ?auto_3565511 ?auto_3565514 ) ) ( not ( = ?auto_3565511 ?auto_3565515 ) ) ( not ( = ?auto_3565505 ?auto_3565508 ) ) ( not ( = ?auto_3565507 ?auto_3565508 ) ) ( not ( = ?auto_3565504 ?auto_3565508 ) ) ( not ( = ?auto_3565509 ?auto_3565508 ) ) ( not ( = ?auto_3565506 ?auto_3565508 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3565505 ?auto_3565507 ?auto_3565504 ?auto_3565506 ?auto_3565509 ?auto_3565508 ?auto_3565503 )
      ( DELIVER-6PKG-VERIFY ?auto_3565504 ?auto_3565505 ?auto_3565506 ?auto_3565507 ?auto_3565508 ?auto_3565509 ?auto_3565503 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3565720 - OBJ
      ?auto_3565721 - OBJ
      ?auto_3565722 - OBJ
      ?auto_3565723 - OBJ
      ?auto_3565724 - OBJ
      ?auto_3565725 - OBJ
      ?auto_3565719 - LOCATION
    )
    :vars
    (
      ?auto_3565727 - LOCATION
      ?auto_3565729 - CITY
      ?auto_3565726 - LOCATION
      ?auto_3565730 - LOCATION
      ?auto_3565731 - LOCATION
      ?auto_3565728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3565727 ?auto_3565729 ) ( IN-CITY ?auto_3565719 ?auto_3565729 ) ( not ( = ?auto_3565719 ?auto_3565727 ) ) ( OBJ-AT ?auto_3565725 ?auto_3565727 ) ( OBJ-AT ?auto_3565722 ?auto_3565727 ) ( IN-CITY ?auto_3565726 ?auto_3565729 ) ( not ( = ?auto_3565719 ?auto_3565726 ) ) ( OBJ-AT ?auto_3565723 ?auto_3565726 ) ( OBJ-AT ?auto_3565720 ?auto_3565726 ) ( IN-CITY ?auto_3565730 ?auto_3565729 ) ( not ( = ?auto_3565719 ?auto_3565730 ) ) ( OBJ-AT ?auto_3565724 ?auto_3565730 ) ( IN-CITY ?auto_3565731 ?auto_3565729 ) ( not ( = ?auto_3565719 ?auto_3565731 ) ) ( OBJ-AT ?auto_3565721 ?auto_3565731 ) ( TRUCK-AT ?auto_3565728 ?auto_3565719 ) ( not ( = ?auto_3565721 ?auto_3565724 ) ) ( not ( = ?auto_3565730 ?auto_3565731 ) ) ( not ( = ?auto_3565721 ?auto_3565720 ) ) ( not ( = ?auto_3565724 ?auto_3565720 ) ) ( not ( = ?auto_3565726 ?auto_3565730 ) ) ( not ( = ?auto_3565726 ?auto_3565731 ) ) ( not ( = ?auto_3565721 ?auto_3565723 ) ) ( not ( = ?auto_3565724 ?auto_3565723 ) ) ( not ( = ?auto_3565720 ?auto_3565723 ) ) ( not ( = ?auto_3565721 ?auto_3565722 ) ) ( not ( = ?auto_3565724 ?auto_3565722 ) ) ( not ( = ?auto_3565720 ?auto_3565722 ) ) ( not ( = ?auto_3565723 ?auto_3565722 ) ) ( not ( = ?auto_3565727 ?auto_3565726 ) ) ( not ( = ?auto_3565727 ?auto_3565730 ) ) ( not ( = ?auto_3565727 ?auto_3565731 ) ) ( not ( = ?auto_3565721 ?auto_3565725 ) ) ( not ( = ?auto_3565724 ?auto_3565725 ) ) ( not ( = ?auto_3565720 ?auto_3565725 ) ) ( not ( = ?auto_3565723 ?auto_3565725 ) ) ( not ( = ?auto_3565722 ?auto_3565725 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3565721 ?auto_3565724 ?auto_3565720 ?auto_3565722 ?auto_3565723 ?auto_3565725 ?auto_3565719 )
      ( DELIVER-6PKG-VERIFY ?auto_3565720 ?auto_3565721 ?auto_3565722 ?auto_3565723 ?auto_3565724 ?auto_3565725 ?auto_3565719 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3565789 - OBJ
      ?auto_3565790 - OBJ
      ?auto_3565791 - OBJ
      ?auto_3565792 - OBJ
      ?auto_3565793 - OBJ
      ?auto_3565794 - OBJ
      ?auto_3565788 - LOCATION
    )
    :vars
    (
      ?auto_3565796 - LOCATION
      ?auto_3565798 - CITY
      ?auto_3565795 - LOCATION
      ?auto_3565799 - LOCATION
      ?auto_3565800 - LOCATION
      ?auto_3565797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3565796 ?auto_3565798 ) ( IN-CITY ?auto_3565788 ?auto_3565798 ) ( not ( = ?auto_3565788 ?auto_3565796 ) ) ( OBJ-AT ?auto_3565793 ?auto_3565796 ) ( OBJ-AT ?auto_3565791 ?auto_3565796 ) ( IN-CITY ?auto_3565795 ?auto_3565798 ) ( not ( = ?auto_3565788 ?auto_3565795 ) ) ( OBJ-AT ?auto_3565792 ?auto_3565795 ) ( OBJ-AT ?auto_3565789 ?auto_3565795 ) ( IN-CITY ?auto_3565799 ?auto_3565798 ) ( not ( = ?auto_3565788 ?auto_3565799 ) ) ( OBJ-AT ?auto_3565794 ?auto_3565799 ) ( IN-CITY ?auto_3565800 ?auto_3565798 ) ( not ( = ?auto_3565788 ?auto_3565800 ) ) ( OBJ-AT ?auto_3565790 ?auto_3565800 ) ( TRUCK-AT ?auto_3565797 ?auto_3565788 ) ( not ( = ?auto_3565790 ?auto_3565794 ) ) ( not ( = ?auto_3565799 ?auto_3565800 ) ) ( not ( = ?auto_3565790 ?auto_3565789 ) ) ( not ( = ?auto_3565794 ?auto_3565789 ) ) ( not ( = ?auto_3565795 ?auto_3565799 ) ) ( not ( = ?auto_3565795 ?auto_3565800 ) ) ( not ( = ?auto_3565790 ?auto_3565792 ) ) ( not ( = ?auto_3565794 ?auto_3565792 ) ) ( not ( = ?auto_3565789 ?auto_3565792 ) ) ( not ( = ?auto_3565790 ?auto_3565791 ) ) ( not ( = ?auto_3565794 ?auto_3565791 ) ) ( not ( = ?auto_3565789 ?auto_3565791 ) ) ( not ( = ?auto_3565792 ?auto_3565791 ) ) ( not ( = ?auto_3565796 ?auto_3565795 ) ) ( not ( = ?auto_3565796 ?auto_3565799 ) ) ( not ( = ?auto_3565796 ?auto_3565800 ) ) ( not ( = ?auto_3565790 ?auto_3565793 ) ) ( not ( = ?auto_3565794 ?auto_3565793 ) ) ( not ( = ?auto_3565789 ?auto_3565793 ) ) ( not ( = ?auto_3565792 ?auto_3565793 ) ) ( not ( = ?auto_3565791 ?auto_3565793 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3565790 ?auto_3565794 ?auto_3565789 ?auto_3565791 ?auto_3565792 ?auto_3565793 ?auto_3565788 )
      ( DELIVER-6PKG-VERIFY ?auto_3565789 ?auto_3565790 ?auto_3565791 ?auto_3565792 ?auto_3565793 ?auto_3565794 ?auto_3565788 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3566149 - OBJ
      ?auto_3566150 - OBJ
      ?auto_3566151 - OBJ
      ?auto_3566152 - OBJ
      ?auto_3566153 - OBJ
      ?auto_3566154 - OBJ
      ?auto_3566148 - LOCATION
    )
    :vars
    (
      ?auto_3566156 - LOCATION
      ?auto_3566158 - CITY
      ?auto_3566155 - LOCATION
      ?auto_3566159 - LOCATION
      ?auto_3566160 - LOCATION
      ?auto_3566157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3566156 ?auto_3566158 ) ( IN-CITY ?auto_3566148 ?auto_3566158 ) ( not ( = ?auto_3566148 ?auto_3566156 ) ) ( OBJ-AT ?auto_3566152 ?auto_3566156 ) ( OBJ-AT ?auto_3566151 ?auto_3566156 ) ( IN-CITY ?auto_3566155 ?auto_3566158 ) ( not ( = ?auto_3566148 ?auto_3566155 ) ) ( OBJ-AT ?auto_3566154 ?auto_3566155 ) ( OBJ-AT ?auto_3566149 ?auto_3566155 ) ( IN-CITY ?auto_3566159 ?auto_3566158 ) ( not ( = ?auto_3566148 ?auto_3566159 ) ) ( OBJ-AT ?auto_3566153 ?auto_3566159 ) ( IN-CITY ?auto_3566160 ?auto_3566158 ) ( not ( = ?auto_3566148 ?auto_3566160 ) ) ( OBJ-AT ?auto_3566150 ?auto_3566160 ) ( TRUCK-AT ?auto_3566157 ?auto_3566148 ) ( not ( = ?auto_3566150 ?auto_3566153 ) ) ( not ( = ?auto_3566159 ?auto_3566160 ) ) ( not ( = ?auto_3566150 ?auto_3566149 ) ) ( not ( = ?auto_3566153 ?auto_3566149 ) ) ( not ( = ?auto_3566155 ?auto_3566159 ) ) ( not ( = ?auto_3566155 ?auto_3566160 ) ) ( not ( = ?auto_3566150 ?auto_3566154 ) ) ( not ( = ?auto_3566153 ?auto_3566154 ) ) ( not ( = ?auto_3566149 ?auto_3566154 ) ) ( not ( = ?auto_3566150 ?auto_3566151 ) ) ( not ( = ?auto_3566153 ?auto_3566151 ) ) ( not ( = ?auto_3566149 ?auto_3566151 ) ) ( not ( = ?auto_3566154 ?auto_3566151 ) ) ( not ( = ?auto_3566156 ?auto_3566155 ) ) ( not ( = ?auto_3566156 ?auto_3566159 ) ) ( not ( = ?auto_3566156 ?auto_3566160 ) ) ( not ( = ?auto_3566150 ?auto_3566152 ) ) ( not ( = ?auto_3566153 ?auto_3566152 ) ) ( not ( = ?auto_3566149 ?auto_3566152 ) ) ( not ( = ?auto_3566154 ?auto_3566152 ) ) ( not ( = ?auto_3566151 ?auto_3566152 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3566150 ?auto_3566153 ?auto_3566149 ?auto_3566151 ?auto_3566154 ?auto_3566152 ?auto_3566148 )
      ( DELIVER-6PKG-VERIFY ?auto_3566149 ?auto_3566150 ?auto_3566151 ?auto_3566152 ?auto_3566153 ?auto_3566154 ?auto_3566148 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3566292 - OBJ
      ?auto_3566293 - OBJ
      ?auto_3566294 - OBJ
      ?auto_3566295 - OBJ
      ?auto_3566296 - OBJ
      ?auto_3566297 - OBJ
      ?auto_3566291 - LOCATION
    )
    :vars
    (
      ?auto_3566299 - LOCATION
      ?auto_3566301 - CITY
      ?auto_3566298 - LOCATION
      ?auto_3566302 - LOCATION
      ?auto_3566303 - LOCATION
      ?auto_3566300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3566299 ?auto_3566301 ) ( IN-CITY ?auto_3566291 ?auto_3566301 ) ( not ( = ?auto_3566291 ?auto_3566299 ) ) ( OBJ-AT ?auto_3566295 ?auto_3566299 ) ( OBJ-AT ?auto_3566294 ?auto_3566299 ) ( IN-CITY ?auto_3566298 ?auto_3566301 ) ( not ( = ?auto_3566291 ?auto_3566298 ) ) ( OBJ-AT ?auto_3566296 ?auto_3566298 ) ( OBJ-AT ?auto_3566292 ?auto_3566298 ) ( IN-CITY ?auto_3566302 ?auto_3566301 ) ( not ( = ?auto_3566291 ?auto_3566302 ) ) ( OBJ-AT ?auto_3566297 ?auto_3566302 ) ( IN-CITY ?auto_3566303 ?auto_3566301 ) ( not ( = ?auto_3566291 ?auto_3566303 ) ) ( OBJ-AT ?auto_3566293 ?auto_3566303 ) ( TRUCK-AT ?auto_3566300 ?auto_3566291 ) ( not ( = ?auto_3566293 ?auto_3566297 ) ) ( not ( = ?auto_3566302 ?auto_3566303 ) ) ( not ( = ?auto_3566293 ?auto_3566292 ) ) ( not ( = ?auto_3566297 ?auto_3566292 ) ) ( not ( = ?auto_3566298 ?auto_3566302 ) ) ( not ( = ?auto_3566298 ?auto_3566303 ) ) ( not ( = ?auto_3566293 ?auto_3566296 ) ) ( not ( = ?auto_3566297 ?auto_3566296 ) ) ( not ( = ?auto_3566292 ?auto_3566296 ) ) ( not ( = ?auto_3566293 ?auto_3566294 ) ) ( not ( = ?auto_3566297 ?auto_3566294 ) ) ( not ( = ?auto_3566292 ?auto_3566294 ) ) ( not ( = ?auto_3566296 ?auto_3566294 ) ) ( not ( = ?auto_3566299 ?auto_3566298 ) ) ( not ( = ?auto_3566299 ?auto_3566302 ) ) ( not ( = ?auto_3566299 ?auto_3566303 ) ) ( not ( = ?auto_3566293 ?auto_3566295 ) ) ( not ( = ?auto_3566297 ?auto_3566295 ) ) ( not ( = ?auto_3566292 ?auto_3566295 ) ) ( not ( = ?auto_3566296 ?auto_3566295 ) ) ( not ( = ?auto_3566294 ?auto_3566295 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3566293 ?auto_3566297 ?auto_3566292 ?auto_3566294 ?auto_3566296 ?auto_3566295 ?auto_3566291 )
      ( DELIVER-6PKG-VERIFY ?auto_3566292 ?auto_3566293 ?auto_3566294 ?auto_3566295 ?auto_3566296 ?auto_3566297 ?auto_3566291 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3589786 - OBJ
      ?auto_3589787 - OBJ
      ?auto_3589788 - OBJ
      ?auto_3589789 - OBJ
      ?auto_3589790 - OBJ
      ?auto_3589791 - OBJ
      ?auto_3589785 - LOCATION
    )
    :vars
    (
      ?auto_3589793 - LOCATION
      ?auto_3589795 - CITY
      ?auto_3589792 - LOCATION
      ?auto_3589796 - LOCATION
      ?auto_3589797 - LOCATION
      ?auto_3589794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3589793 ?auto_3589795 ) ( IN-CITY ?auto_3589785 ?auto_3589795 ) ( not ( = ?auto_3589785 ?auto_3589793 ) ) ( OBJ-AT ?auto_3589791 ?auto_3589793 ) ( OBJ-AT ?auto_3589790 ?auto_3589793 ) ( IN-CITY ?auto_3589792 ?auto_3589795 ) ( not ( = ?auto_3589785 ?auto_3589792 ) ) ( OBJ-AT ?auto_3589787 ?auto_3589792 ) ( OBJ-AT ?auto_3589786 ?auto_3589792 ) ( IN-CITY ?auto_3589796 ?auto_3589795 ) ( not ( = ?auto_3589785 ?auto_3589796 ) ) ( OBJ-AT ?auto_3589789 ?auto_3589796 ) ( IN-CITY ?auto_3589797 ?auto_3589795 ) ( not ( = ?auto_3589785 ?auto_3589797 ) ) ( OBJ-AT ?auto_3589788 ?auto_3589797 ) ( TRUCK-AT ?auto_3589794 ?auto_3589785 ) ( not ( = ?auto_3589788 ?auto_3589789 ) ) ( not ( = ?auto_3589796 ?auto_3589797 ) ) ( not ( = ?auto_3589788 ?auto_3589786 ) ) ( not ( = ?auto_3589789 ?auto_3589786 ) ) ( not ( = ?auto_3589792 ?auto_3589796 ) ) ( not ( = ?auto_3589792 ?auto_3589797 ) ) ( not ( = ?auto_3589788 ?auto_3589787 ) ) ( not ( = ?auto_3589789 ?auto_3589787 ) ) ( not ( = ?auto_3589786 ?auto_3589787 ) ) ( not ( = ?auto_3589788 ?auto_3589790 ) ) ( not ( = ?auto_3589789 ?auto_3589790 ) ) ( not ( = ?auto_3589786 ?auto_3589790 ) ) ( not ( = ?auto_3589787 ?auto_3589790 ) ) ( not ( = ?auto_3589793 ?auto_3589792 ) ) ( not ( = ?auto_3589793 ?auto_3589796 ) ) ( not ( = ?auto_3589793 ?auto_3589797 ) ) ( not ( = ?auto_3589788 ?auto_3589791 ) ) ( not ( = ?auto_3589789 ?auto_3589791 ) ) ( not ( = ?auto_3589786 ?auto_3589791 ) ) ( not ( = ?auto_3589787 ?auto_3589791 ) ) ( not ( = ?auto_3589790 ?auto_3589791 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3589788 ?auto_3589789 ?auto_3589786 ?auto_3589790 ?auto_3589787 ?auto_3589791 ?auto_3589785 )
      ( DELIVER-6PKG-VERIFY ?auto_3589786 ?auto_3589787 ?auto_3589788 ?auto_3589789 ?auto_3589790 ?auto_3589791 ?auto_3589785 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3590212 - OBJ
      ?auto_3590213 - OBJ
      ?auto_3590214 - OBJ
      ?auto_3590215 - OBJ
      ?auto_3590216 - OBJ
      ?auto_3590217 - OBJ
      ?auto_3590211 - LOCATION
    )
    :vars
    (
      ?auto_3590219 - LOCATION
      ?auto_3590221 - CITY
      ?auto_3590218 - LOCATION
      ?auto_3590222 - LOCATION
      ?auto_3590223 - LOCATION
      ?auto_3590220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3590219 ?auto_3590221 ) ( IN-CITY ?auto_3590211 ?auto_3590221 ) ( not ( = ?auto_3590211 ?auto_3590219 ) ) ( OBJ-AT ?auto_3590217 ?auto_3590219 ) ( OBJ-AT ?auto_3590215 ?auto_3590219 ) ( IN-CITY ?auto_3590218 ?auto_3590221 ) ( not ( = ?auto_3590211 ?auto_3590218 ) ) ( OBJ-AT ?auto_3590213 ?auto_3590218 ) ( OBJ-AT ?auto_3590212 ?auto_3590218 ) ( IN-CITY ?auto_3590222 ?auto_3590221 ) ( not ( = ?auto_3590211 ?auto_3590222 ) ) ( OBJ-AT ?auto_3590216 ?auto_3590222 ) ( IN-CITY ?auto_3590223 ?auto_3590221 ) ( not ( = ?auto_3590211 ?auto_3590223 ) ) ( OBJ-AT ?auto_3590214 ?auto_3590223 ) ( TRUCK-AT ?auto_3590220 ?auto_3590211 ) ( not ( = ?auto_3590214 ?auto_3590216 ) ) ( not ( = ?auto_3590222 ?auto_3590223 ) ) ( not ( = ?auto_3590214 ?auto_3590212 ) ) ( not ( = ?auto_3590216 ?auto_3590212 ) ) ( not ( = ?auto_3590218 ?auto_3590222 ) ) ( not ( = ?auto_3590218 ?auto_3590223 ) ) ( not ( = ?auto_3590214 ?auto_3590213 ) ) ( not ( = ?auto_3590216 ?auto_3590213 ) ) ( not ( = ?auto_3590212 ?auto_3590213 ) ) ( not ( = ?auto_3590214 ?auto_3590215 ) ) ( not ( = ?auto_3590216 ?auto_3590215 ) ) ( not ( = ?auto_3590212 ?auto_3590215 ) ) ( not ( = ?auto_3590213 ?auto_3590215 ) ) ( not ( = ?auto_3590219 ?auto_3590218 ) ) ( not ( = ?auto_3590219 ?auto_3590222 ) ) ( not ( = ?auto_3590219 ?auto_3590223 ) ) ( not ( = ?auto_3590214 ?auto_3590217 ) ) ( not ( = ?auto_3590216 ?auto_3590217 ) ) ( not ( = ?auto_3590212 ?auto_3590217 ) ) ( not ( = ?auto_3590213 ?auto_3590217 ) ) ( not ( = ?auto_3590215 ?auto_3590217 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3590214 ?auto_3590216 ?auto_3590212 ?auto_3590215 ?auto_3590213 ?auto_3590217 ?auto_3590211 )
      ( DELIVER-6PKG-VERIFY ?auto_3590212 ?auto_3590213 ?auto_3590214 ?auto_3590215 ?auto_3590216 ?auto_3590217 ?auto_3590211 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3590281 - OBJ
      ?auto_3590282 - OBJ
      ?auto_3590283 - OBJ
      ?auto_3590284 - OBJ
      ?auto_3590285 - OBJ
      ?auto_3590286 - OBJ
      ?auto_3590280 - LOCATION
    )
    :vars
    (
      ?auto_3590288 - LOCATION
      ?auto_3590290 - CITY
      ?auto_3590287 - LOCATION
      ?auto_3590291 - LOCATION
      ?auto_3590292 - LOCATION
      ?auto_3590289 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3590288 ?auto_3590290 ) ( IN-CITY ?auto_3590280 ?auto_3590290 ) ( not ( = ?auto_3590280 ?auto_3590288 ) ) ( OBJ-AT ?auto_3590285 ?auto_3590288 ) ( OBJ-AT ?auto_3590284 ?auto_3590288 ) ( IN-CITY ?auto_3590287 ?auto_3590290 ) ( not ( = ?auto_3590280 ?auto_3590287 ) ) ( OBJ-AT ?auto_3590282 ?auto_3590287 ) ( OBJ-AT ?auto_3590281 ?auto_3590287 ) ( IN-CITY ?auto_3590291 ?auto_3590290 ) ( not ( = ?auto_3590280 ?auto_3590291 ) ) ( OBJ-AT ?auto_3590286 ?auto_3590291 ) ( IN-CITY ?auto_3590292 ?auto_3590290 ) ( not ( = ?auto_3590280 ?auto_3590292 ) ) ( OBJ-AT ?auto_3590283 ?auto_3590292 ) ( TRUCK-AT ?auto_3590289 ?auto_3590280 ) ( not ( = ?auto_3590283 ?auto_3590286 ) ) ( not ( = ?auto_3590291 ?auto_3590292 ) ) ( not ( = ?auto_3590283 ?auto_3590281 ) ) ( not ( = ?auto_3590286 ?auto_3590281 ) ) ( not ( = ?auto_3590287 ?auto_3590291 ) ) ( not ( = ?auto_3590287 ?auto_3590292 ) ) ( not ( = ?auto_3590283 ?auto_3590282 ) ) ( not ( = ?auto_3590286 ?auto_3590282 ) ) ( not ( = ?auto_3590281 ?auto_3590282 ) ) ( not ( = ?auto_3590283 ?auto_3590284 ) ) ( not ( = ?auto_3590286 ?auto_3590284 ) ) ( not ( = ?auto_3590281 ?auto_3590284 ) ) ( not ( = ?auto_3590282 ?auto_3590284 ) ) ( not ( = ?auto_3590288 ?auto_3590287 ) ) ( not ( = ?auto_3590288 ?auto_3590291 ) ) ( not ( = ?auto_3590288 ?auto_3590292 ) ) ( not ( = ?auto_3590283 ?auto_3590285 ) ) ( not ( = ?auto_3590286 ?auto_3590285 ) ) ( not ( = ?auto_3590281 ?auto_3590285 ) ) ( not ( = ?auto_3590282 ?auto_3590285 ) ) ( not ( = ?auto_3590284 ?auto_3590285 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3590283 ?auto_3590286 ?auto_3590281 ?auto_3590284 ?auto_3590282 ?auto_3590285 ?auto_3590280 )
      ( DELIVER-6PKG-VERIFY ?auto_3590281 ?auto_3590282 ?auto_3590283 ?auto_3590284 ?auto_3590285 ?auto_3590286 ?auto_3590280 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3594871 - OBJ
      ?auto_3594872 - OBJ
      ?auto_3594873 - OBJ
      ?auto_3594874 - OBJ
      ?auto_3594875 - OBJ
      ?auto_3594876 - OBJ
      ?auto_3594870 - LOCATION
    )
    :vars
    (
      ?auto_3594878 - LOCATION
      ?auto_3594880 - CITY
      ?auto_3594877 - LOCATION
      ?auto_3594881 - LOCATION
      ?auto_3594882 - LOCATION
      ?auto_3594879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3594878 ?auto_3594880 ) ( IN-CITY ?auto_3594870 ?auto_3594880 ) ( not ( = ?auto_3594870 ?auto_3594878 ) ) ( OBJ-AT ?auto_3594876 ?auto_3594878 ) ( OBJ-AT ?auto_3594873 ?auto_3594878 ) ( IN-CITY ?auto_3594877 ?auto_3594880 ) ( not ( = ?auto_3594870 ?auto_3594877 ) ) ( OBJ-AT ?auto_3594872 ?auto_3594877 ) ( OBJ-AT ?auto_3594871 ?auto_3594877 ) ( IN-CITY ?auto_3594881 ?auto_3594880 ) ( not ( = ?auto_3594870 ?auto_3594881 ) ) ( OBJ-AT ?auto_3594875 ?auto_3594881 ) ( IN-CITY ?auto_3594882 ?auto_3594880 ) ( not ( = ?auto_3594870 ?auto_3594882 ) ) ( OBJ-AT ?auto_3594874 ?auto_3594882 ) ( TRUCK-AT ?auto_3594879 ?auto_3594870 ) ( not ( = ?auto_3594874 ?auto_3594875 ) ) ( not ( = ?auto_3594881 ?auto_3594882 ) ) ( not ( = ?auto_3594874 ?auto_3594871 ) ) ( not ( = ?auto_3594875 ?auto_3594871 ) ) ( not ( = ?auto_3594877 ?auto_3594881 ) ) ( not ( = ?auto_3594877 ?auto_3594882 ) ) ( not ( = ?auto_3594874 ?auto_3594872 ) ) ( not ( = ?auto_3594875 ?auto_3594872 ) ) ( not ( = ?auto_3594871 ?auto_3594872 ) ) ( not ( = ?auto_3594874 ?auto_3594873 ) ) ( not ( = ?auto_3594875 ?auto_3594873 ) ) ( not ( = ?auto_3594871 ?auto_3594873 ) ) ( not ( = ?auto_3594872 ?auto_3594873 ) ) ( not ( = ?auto_3594878 ?auto_3594877 ) ) ( not ( = ?auto_3594878 ?auto_3594881 ) ) ( not ( = ?auto_3594878 ?auto_3594882 ) ) ( not ( = ?auto_3594874 ?auto_3594876 ) ) ( not ( = ?auto_3594875 ?auto_3594876 ) ) ( not ( = ?auto_3594871 ?auto_3594876 ) ) ( not ( = ?auto_3594872 ?auto_3594876 ) ) ( not ( = ?auto_3594873 ?auto_3594876 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3594874 ?auto_3594875 ?auto_3594871 ?auto_3594873 ?auto_3594872 ?auto_3594876 ?auto_3594870 )
      ( DELIVER-6PKG-VERIFY ?auto_3594871 ?auto_3594872 ?auto_3594873 ?auto_3594874 ?auto_3594875 ?auto_3594876 ?auto_3594870 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3594940 - OBJ
      ?auto_3594941 - OBJ
      ?auto_3594942 - OBJ
      ?auto_3594943 - OBJ
      ?auto_3594944 - OBJ
      ?auto_3594945 - OBJ
      ?auto_3594939 - LOCATION
    )
    :vars
    (
      ?auto_3594947 - LOCATION
      ?auto_3594949 - CITY
      ?auto_3594946 - LOCATION
      ?auto_3594950 - LOCATION
      ?auto_3594951 - LOCATION
      ?auto_3594948 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3594947 ?auto_3594949 ) ( IN-CITY ?auto_3594939 ?auto_3594949 ) ( not ( = ?auto_3594939 ?auto_3594947 ) ) ( OBJ-AT ?auto_3594944 ?auto_3594947 ) ( OBJ-AT ?auto_3594942 ?auto_3594947 ) ( IN-CITY ?auto_3594946 ?auto_3594949 ) ( not ( = ?auto_3594939 ?auto_3594946 ) ) ( OBJ-AT ?auto_3594941 ?auto_3594946 ) ( OBJ-AT ?auto_3594940 ?auto_3594946 ) ( IN-CITY ?auto_3594950 ?auto_3594949 ) ( not ( = ?auto_3594939 ?auto_3594950 ) ) ( OBJ-AT ?auto_3594945 ?auto_3594950 ) ( IN-CITY ?auto_3594951 ?auto_3594949 ) ( not ( = ?auto_3594939 ?auto_3594951 ) ) ( OBJ-AT ?auto_3594943 ?auto_3594951 ) ( TRUCK-AT ?auto_3594948 ?auto_3594939 ) ( not ( = ?auto_3594943 ?auto_3594945 ) ) ( not ( = ?auto_3594950 ?auto_3594951 ) ) ( not ( = ?auto_3594943 ?auto_3594940 ) ) ( not ( = ?auto_3594945 ?auto_3594940 ) ) ( not ( = ?auto_3594946 ?auto_3594950 ) ) ( not ( = ?auto_3594946 ?auto_3594951 ) ) ( not ( = ?auto_3594943 ?auto_3594941 ) ) ( not ( = ?auto_3594945 ?auto_3594941 ) ) ( not ( = ?auto_3594940 ?auto_3594941 ) ) ( not ( = ?auto_3594943 ?auto_3594942 ) ) ( not ( = ?auto_3594945 ?auto_3594942 ) ) ( not ( = ?auto_3594940 ?auto_3594942 ) ) ( not ( = ?auto_3594941 ?auto_3594942 ) ) ( not ( = ?auto_3594947 ?auto_3594946 ) ) ( not ( = ?auto_3594947 ?auto_3594950 ) ) ( not ( = ?auto_3594947 ?auto_3594951 ) ) ( not ( = ?auto_3594943 ?auto_3594944 ) ) ( not ( = ?auto_3594945 ?auto_3594944 ) ) ( not ( = ?auto_3594940 ?auto_3594944 ) ) ( not ( = ?auto_3594941 ?auto_3594944 ) ) ( not ( = ?auto_3594942 ?auto_3594944 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3594943 ?auto_3594945 ?auto_3594940 ?auto_3594942 ?auto_3594941 ?auto_3594944 ?auto_3594939 )
      ( DELIVER-6PKG-VERIFY ?auto_3594940 ?auto_3594941 ?auto_3594942 ?auto_3594943 ?auto_3594944 ?auto_3594945 ?auto_3594939 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3595646 - OBJ
      ?auto_3595647 - OBJ
      ?auto_3595648 - OBJ
      ?auto_3595649 - OBJ
      ?auto_3595650 - OBJ
      ?auto_3595651 - OBJ
      ?auto_3595645 - LOCATION
    )
    :vars
    (
      ?auto_3595653 - LOCATION
      ?auto_3595655 - CITY
      ?auto_3595652 - LOCATION
      ?auto_3595656 - LOCATION
      ?auto_3595657 - LOCATION
      ?auto_3595654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3595653 ?auto_3595655 ) ( IN-CITY ?auto_3595645 ?auto_3595655 ) ( not ( = ?auto_3595645 ?auto_3595653 ) ) ( OBJ-AT ?auto_3595649 ?auto_3595653 ) ( OBJ-AT ?auto_3595648 ?auto_3595653 ) ( IN-CITY ?auto_3595652 ?auto_3595655 ) ( not ( = ?auto_3595645 ?auto_3595652 ) ) ( OBJ-AT ?auto_3595647 ?auto_3595652 ) ( OBJ-AT ?auto_3595646 ?auto_3595652 ) ( IN-CITY ?auto_3595656 ?auto_3595655 ) ( not ( = ?auto_3595645 ?auto_3595656 ) ) ( OBJ-AT ?auto_3595651 ?auto_3595656 ) ( IN-CITY ?auto_3595657 ?auto_3595655 ) ( not ( = ?auto_3595645 ?auto_3595657 ) ) ( OBJ-AT ?auto_3595650 ?auto_3595657 ) ( TRUCK-AT ?auto_3595654 ?auto_3595645 ) ( not ( = ?auto_3595650 ?auto_3595651 ) ) ( not ( = ?auto_3595656 ?auto_3595657 ) ) ( not ( = ?auto_3595650 ?auto_3595646 ) ) ( not ( = ?auto_3595651 ?auto_3595646 ) ) ( not ( = ?auto_3595652 ?auto_3595656 ) ) ( not ( = ?auto_3595652 ?auto_3595657 ) ) ( not ( = ?auto_3595650 ?auto_3595647 ) ) ( not ( = ?auto_3595651 ?auto_3595647 ) ) ( not ( = ?auto_3595646 ?auto_3595647 ) ) ( not ( = ?auto_3595650 ?auto_3595648 ) ) ( not ( = ?auto_3595651 ?auto_3595648 ) ) ( not ( = ?auto_3595646 ?auto_3595648 ) ) ( not ( = ?auto_3595647 ?auto_3595648 ) ) ( not ( = ?auto_3595653 ?auto_3595652 ) ) ( not ( = ?auto_3595653 ?auto_3595656 ) ) ( not ( = ?auto_3595653 ?auto_3595657 ) ) ( not ( = ?auto_3595650 ?auto_3595649 ) ) ( not ( = ?auto_3595651 ?auto_3595649 ) ) ( not ( = ?auto_3595646 ?auto_3595649 ) ) ( not ( = ?auto_3595647 ?auto_3595649 ) ) ( not ( = ?auto_3595648 ?auto_3595649 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3595650 ?auto_3595651 ?auto_3595646 ?auto_3595648 ?auto_3595647 ?auto_3595649 ?auto_3595645 )
      ( DELIVER-6PKG-VERIFY ?auto_3595646 ?auto_3595647 ?auto_3595648 ?auto_3595649 ?auto_3595650 ?auto_3595651 ?auto_3595645 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3599494 - OBJ
      ?auto_3599495 - OBJ
      ?auto_3599496 - OBJ
      ?auto_3599497 - OBJ
      ?auto_3599498 - OBJ
      ?auto_3599499 - OBJ
      ?auto_3599493 - LOCATION
    )
    :vars
    (
      ?auto_3599501 - LOCATION
      ?auto_3599503 - CITY
      ?auto_3599500 - LOCATION
      ?auto_3599504 - LOCATION
      ?auto_3599505 - LOCATION
      ?auto_3599502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3599501 ?auto_3599503 ) ( IN-CITY ?auto_3599493 ?auto_3599503 ) ( not ( = ?auto_3599493 ?auto_3599501 ) ) ( OBJ-AT ?auto_3599499 ?auto_3599501 ) ( OBJ-AT ?auto_3599495 ?auto_3599501 ) ( IN-CITY ?auto_3599500 ?auto_3599503 ) ( not ( = ?auto_3599493 ?auto_3599500 ) ) ( OBJ-AT ?auto_3599498 ?auto_3599500 ) ( OBJ-AT ?auto_3599494 ?auto_3599500 ) ( IN-CITY ?auto_3599504 ?auto_3599503 ) ( not ( = ?auto_3599493 ?auto_3599504 ) ) ( OBJ-AT ?auto_3599497 ?auto_3599504 ) ( IN-CITY ?auto_3599505 ?auto_3599503 ) ( not ( = ?auto_3599493 ?auto_3599505 ) ) ( OBJ-AT ?auto_3599496 ?auto_3599505 ) ( TRUCK-AT ?auto_3599502 ?auto_3599493 ) ( not ( = ?auto_3599496 ?auto_3599497 ) ) ( not ( = ?auto_3599504 ?auto_3599505 ) ) ( not ( = ?auto_3599496 ?auto_3599494 ) ) ( not ( = ?auto_3599497 ?auto_3599494 ) ) ( not ( = ?auto_3599500 ?auto_3599504 ) ) ( not ( = ?auto_3599500 ?auto_3599505 ) ) ( not ( = ?auto_3599496 ?auto_3599498 ) ) ( not ( = ?auto_3599497 ?auto_3599498 ) ) ( not ( = ?auto_3599494 ?auto_3599498 ) ) ( not ( = ?auto_3599496 ?auto_3599495 ) ) ( not ( = ?auto_3599497 ?auto_3599495 ) ) ( not ( = ?auto_3599494 ?auto_3599495 ) ) ( not ( = ?auto_3599498 ?auto_3599495 ) ) ( not ( = ?auto_3599501 ?auto_3599500 ) ) ( not ( = ?auto_3599501 ?auto_3599504 ) ) ( not ( = ?auto_3599501 ?auto_3599505 ) ) ( not ( = ?auto_3599496 ?auto_3599499 ) ) ( not ( = ?auto_3599497 ?auto_3599499 ) ) ( not ( = ?auto_3599494 ?auto_3599499 ) ) ( not ( = ?auto_3599498 ?auto_3599499 ) ) ( not ( = ?auto_3599495 ?auto_3599499 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3599496 ?auto_3599497 ?auto_3599494 ?auto_3599495 ?auto_3599498 ?auto_3599499 ?auto_3599493 )
      ( DELIVER-6PKG-VERIFY ?auto_3599494 ?auto_3599495 ?auto_3599496 ?auto_3599497 ?auto_3599498 ?auto_3599499 ?auto_3599493 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3599563 - OBJ
      ?auto_3599564 - OBJ
      ?auto_3599565 - OBJ
      ?auto_3599566 - OBJ
      ?auto_3599567 - OBJ
      ?auto_3599568 - OBJ
      ?auto_3599562 - LOCATION
    )
    :vars
    (
      ?auto_3599570 - LOCATION
      ?auto_3599572 - CITY
      ?auto_3599569 - LOCATION
      ?auto_3599573 - LOCATION
      ?auto_3599574 - LOCATION
      ?auto_3599571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3599570 ?auto_3599572 ) ( IN-CITY ?auto_3599562 ?auto_3599572 ) ( not ( = ?auto_3599562 ?auto_3599570 ) ) ( OBJ-AT ?auto_3599567 ?auto_3599570 ) ( OBJ-AT ?auto_3599564 ?auto_3599570 ) ( IN-CITY ?auto_3599569 ?auto_3599572 ) ( not ( = ?auto_3599562 ?auto_3599569 ) ) ( OBJ-AT ?auto_3599568 ?auto_3599569 ) ( OBJ-AT ?auto_3599563 ?auto_3599569 ) ( IN-CITY ?auto_3599573 ?auto_3599572 ) ( not ( = ?auto_3599562 ?auto_3599573 ) ) ( OBJ-AT ?auto_3599566 ?auto_3599573 ) ( IN-CITY ?auto_3599574 ?auto_3599572 ) ( not ( = ?auto_3599562 ?auto_3599574 ) ) ( OBJ-AT ?auto_3599565 ?auto_3599574 ) ( TRUCK-AT ?auto_3599571 ?auto_3599562 ) ( not ( = ?auto_3599565 ?auto_3599566 ) ) ( not ( = ?auto_3599573 ?auto_3599574 ) ) ( not ( = ?auto_3599565 ?auto_3599563 ) ) ( not ( = ?auto_3599566 ?auto_3599563 ) ) ( not ( = ?auto_3599569 ?auto_3599573 ) ) ( not ( = ?auto_3599569 ?auto_3599574 ) ) ( not ( = ?auto_3599565 ?auto_3599568 ) ) ( not ( = ?auto_3599566 ?auto_3599568 ) ) ( not ( = ?auto_3599563 ?auto_3599568 ) ) ( not ( = ?auto_3599565 ?auto_3599564 ) ) ( not ( = ?auto_3599566 ?auto_3599564 ) ) ( not ( = ?auto_3599563 ?auto_3599564 ) ) ( not ( = ?auto_3599568 ?auto_3599564 ) ) ( not ( = ?auto_3599570 ?auto_3599569 ) ) ( not ( = ?auto_3599570 ?auto_3599573 ) ) ( not ( = ?auto_3599570 ?auto_3599574 ) ) ( not ( = ?auto_3599565 ?auto_3599567 ) ) ( not ( = ?auto_3599566 ?auto_3599567 ) ) ( not ( = ?auto_3599563 ?auto_3599567 ) ) ( not ( = ?auto_3599568 ?auto_3599567 ) ) ( not ( = ?auto_3599564 ?auto_3599567 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3599565 ?auto_3599566 ?auto_3599563 ?auto_3599564 ?auto_3599568 ?auto_3599567 ?auto_3599562 )
      ( DELIVER-6PKG-VERIFY ?auto_3599563 ?auto_3599564 ?auto_3599565 ?auto_3599566 ?auto_3599567 ?auto_3599568 ?auto_3599562 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3599779 - OBJ
      ?auto_3599780 - OBJ
      ?auto_3599781 - OBJ
      ?auto_3599782 - OBJ
      ?auto_3599783 - OBJ
      ?auto_3599784 - OBJ
      ?auto_3599778 - LOCATION
    )
    :vars
    (
      ?auto_3599786 - LOCATION
      ?auto_3599788 - CITY
      ?auto_3599785 - LOCATION
      ?auto_3599789 - LOCATION
      ?auto_3599790 - LOCATION
      ?auto_3599787 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3599786 ?auto_3599788 ) ( IN-CITY ?auto_3599778 ?auto_3599788 ) ( not ( = ?auto_3599778 ?auto_3599786 ) ) ( OBJ-AT ?auto_3599784 ?auto_3599786 ) ( OBJ-AT ?auto_3599780 ?auto_3599786 ) ( IN-CITY ?auto_3599785 ?auto_3599788 ) ( not ( = ?auto_3599778 ?auto_3599785 ) ) ( OBJ-AT ?auto_3599782 ?auto_3599785 ) ( OBJ-AT ?auto_3599779 ?auto_3599785 ) ( IN-CITY ?auto_3599789 ?auto_3599788 ) ( not ( = ?auto_3599778 ?auto_3599789 ) ) ( OBJ-AT ?auto_3599783 ?auto_3599789 ) ( IN-CITY ?auto_3599790 ?auto_3599788 ) ( not ( = ?auto_3599778 ?auto_3599790 ) ) ( OBJ-AT ?auto_3599781 ?auto_3599790 ) ( TRUCK-AT ?auto_3599787 ?auto_3599778 ) ( not ( = ?auto_3599781 ?auto_3599783 ) ) ( not ( = ?auto_3599789 ?auto_3599790 ) ) ( not ( = ?auto_3599781 ?auto_3599779 ) ) ( not ( = ?auto_3599783 ?auto_3599779 ) ) ( not ( = ?auto_3599785 ?auto_3599789 ) ) ( not ( = ?auto_3599785 ?auto_3599790 ) ) ( not ( = ?auto_3599781 ?auto_3599782 ) ) ( not ( = ?auto_3599783 ?auto_3599782 ) ) ( not ( = ?auto_3599779 ?auto_3599782 ) ) ( not ( = ?auto_3599781 ?auto_3599780 ) ) ( not ( = ?auto_3599783 ?auto_3599780 ) ) ( not ( = ?auto_3599779 ?auto_3599780 ) ) ( not ( = ?auto_3599782 ?auto_3599780 ) ) ( not ( = ?auto_3599786 ?auto_3599785 ) ) ( not ( = ?auto_3599786 ?auto_3599789 ) ) ( not ( = ?auto_3599786 ?auto_3599790 ) ) ( not ( = ?auto_3599781 ?auto_3599784 ) ) ( not ( = ?auto_3599783 ?auto_3599784 ) ) ( not ( = ?auto_3599779 ?auto_3599784 ) ) ( not ( = ?auto_3599782 ?auto_3599784 ) ) ( not ( = ?auto_3599780 ?auto_3599784 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3599781 ?auto_3599783 ?auto_3599779 ?auto_3599780 ?auto_3599782 ?auto_3599784 ?auto_3599778 )
      ( DELIVER-6PKG-VERIFY ?auto_3599779 ?auto_3599780 ?auto_3599781 ?auto_3599782 ?auto_3599783 ?auto_3599784 ?auto_3599778 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3599848 - OBJ
      ?auto_3599849 - OBJ
      ?auto_3599850 - OBJ
      ?auto_3599851 - OBJ
      ?auto_3599852 - OBJ
      ?auto_3599853 - OBJ
      ?auto_3599847 - LOCATION
    )
    :vars
    (
      ?auto_3599855 - LOCATION
      ?auto_3599857 - CITY
      ?auto_3599854 - LOCATION
      ?auto_3599858 - LOCATION
      ?auto_3599859 - LOCATION
      ?auto_3599856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3599855 ?auto_3599857 ) ( IN-CITY ?auto_3599847 ?auto_3599857 ) ( not ( = ?auto_3599847 ?auto_3599855 ) ) ( OBJ-AT ?auto_3599852 ?auto_3599855 ) ( OBJ-AT ?auto_3599849 ?auto_3599855 ) ( IN-CITY ?auto_3599854 ?auto_3599857 ) ( not ( = ?auto_3599847 ?auto_3599854 ) ) ( OBJ-AT ?auto_3599851 ?auto_3599854 ) ( OBJ-AT ?auto_3599848 ?auto_3599854 ) ( IN-CITY ?auto_3599858 ?auto_3599857 ) ( not ( = ?auto_3599847 ?auto_3599858 ) ) ( OBJ-AT ?auto_3599853 ?auto_3599858 ) ( IN-CITY ?auto_3599859 ?auto_3599857 ) ( not ( = ?auto_3599847 ?auto_3599859 ) ) ( OBJ-AT ?auto_3599850 ?auto_3599859 ) ( TRUCK-AT ?auto_3599856 ?auto_3599847 ) ( not ( = ?auto_3599850 ?auto_3599853 ) ) ( not ( = ?auto_3599858 ?auto_3599859 ) ) ( not ( = ?auto_3599850 ?auto_3599848 ) ) ( not ( = ?auto_3599853 ?auto_3599848 ) ) ( not ( = ?auto_3599854 ?auto_3599858 ) ) ( not ( = ?auto_3599854 ?auto_3599859 ) ) ( not ( = ?auto_3599850 ?auto_3599851 ) ) ( not ( = ?auto_3599853 ?auto_3599851 ) ) ( not ( = ?auto_3599848 ?auto_3599851 ) ) ( not ( = ?auto_3599850 ?auto_3599849 ) ) ( not ( = ?auto_3599853 ?auto_3599849 ) ) ( not ( = ?auto_3599848 ?auto_3599849 ) ) ( not ( = ?auto_3599851 ?auto_3599849 ) ) ( not ( = ?auto_3599855 ?auto_3599854 ) ) ( not ( = ?auto_3599855 ?auto_3599858 ) ) ( not ( = ?auto_3599855 ?auto_3599859 ) ) ( not ( = ?auto_3599850 ?auto_3599852 ) ) ( not ( = ?auto_3599853 ?auto_3599852 ) ) ( not ( = ?auto_3599848 ?auto_3599852 ) ) ( not ( = ?auto_3599851 ?auto_3599852 ) ) ( not ( = ?auto_3599849 ?auto_3599852 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3599850 ?auto_3599853 ?auto_3599848 ?auto_3599849 ?auto_3599851 ?auto_3599852 ?auto_3599847 )
      ( DELIVER-6PKG-VERIFY ?auto_3599848 ?auto_3599849 ?auto_3599850 ?auto_3599851 ?auto_3599852 ?auto_3599853 ?auto_3599847 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3600208 - OBJ
      ?auto_3600209 - OBJ
      ?auto_3600210 - OBJ
      ?auto_3600211 - OBJ
      ?auto_3600212 - OBJ
      ?auto_3600213 - OBJ
      ?auto_3600207 - LOCATION
    )
    :vars
    (
      ?auto_3600215 - LOCATION
      ?auto_3600217 - CITY
      ?auto_3600214 - LOCATION
      ?auto_3600218 - LOCATION
      ?auto_3600219 - LOCATION
      ?auto_3600216 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3600215 ?auto_3600217 ) ( IN-CITY ?auto_3600207 ?auto_3600217 ) ( not ( = ?auto_3600207 ?auto_3600215 ) ) ( OBJ-AT ?auto_3600211 ?auto_3600215 ) ( OBJ-AT ?auto_3600209 ?auto_3600215 ) ( IN-CITY ?auto_3600214 ?auto_3600217 ) ( not ( = ?auto_3600207 ?auto_3600214 ) ) ( OBJ-AT ?auto_3600213 ?auto_3600214 ) ( OBJ-AT ?auto_3600208 ?auto_3600214 ) ( IN-CITY ?auto_3600218 ?auto_3600217 ) ( not ( = ?auto_3600207 ?auto_3600218 ) ) ( OBJ-AT ?auto_3600212 ?auto_3600218 ) ( IN-CITY ?auto_3600219 ?auto_3600217 ) ( not ( = ?auto_3600207 ?auto_3600219 ) ) ( OBJ-AT ?auto_3600210 ?auto_3600219 ) ( TRUCK-AT ?auto_3600216 ?auto_3600207 ) ( not ( = ?auto_3600210 ?auto_3600212 ) ) ( not ( = ?auto_3600218 ?auto_3600219 ) ) ( not ( = ?auto_3600210 ?auto_3600208 ) ) ( not ( = ?auto_3600212 ?auto_3600208 ) ) ( not ( = ?auto_3600214 ?auto_3600218 ) ) ( not ( = ?auto_3600214 ?auto_3600219 ) ) ( not ( = ?auto_3600210 ?auto_3600213 ) ) ( not ( = ?auto_3600212 ?auto_3600213 ) ) ( not ( = ?auto_3600208 ?auto_3600213 ) ) ( not ( = ?auto_3600210 ?auto_3600209 ) ) ( not ( = ?auto_3600212 ?auto_3600209 ) ) ( not ( = ?auto_3600208 ?auto_3600209 ) ) ( not ( = ?auto_3600213 ?auto_3600209 ) ) ( not ( = ?auto_3600215 ?auto_3600214 ) ) ( not ( = ?auto_3600215 ?auto_3600218 ) ) ( not ( = ?auto_3600215 ?auto_3600219 ) ) ( not ( = ?auto_3600210 ?auto_3600211 ) ) ( not ( = ?auto_3600212 ?auto_3600211 ) ) ( not ( = ?auto_3600208 ?auto_3600211 ) ) ( not ( = ?auto_3600213 ?auto_3600211 ) ) ( not ( = ?auto_3600209 ?auto_3600211 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3600210 ?auto_3600212 ?auto_3600208 ?auto_3600209 ?auto_3600213 ?auto_3600211 ?auto_3600207 )
      ( DELIVER-6PKG-VERIFY ?auto_3600208 ?auto_3600209 ?auto_3600210 ?auto_3600211 ?auto_3600212 ?auto_3600213 ?auto_3600207 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3600351 - OBJ
      ?auto_3600352 - OBJ
      ?auto_3600353 - OBJ
      ?auto_3600354 - OBJ
      ?auto_3600355 - OBJ
      ?auto_3600356 - OBJ
      ?auto_3600350 - LOCATION
    )
    :vars
    (
      ?auto_3600358 - LOCATION
      ?auto_3600360 - CITY
      ?auto_3600357 - LOCATION
      ?auto_3600361 - LOCATION
      ?auto_3600362 - LOCATION
      ?auto_3600359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3600358 ?auto_3600360 ) ( IN-CITY ?auto_3600350 ?auto_3600360 ) ( not ( = ?auto_3600350 ?auto_3600358 ) ) ( OBJ-AT ?auto_3600354 ?auto_3600358 ) ( OBJ-AT ?auto_3600352 ?auto_3600358 ) ( IN-CITY ?auto_3600357 ?auto_3600360 ) ( not ( = ?auto_3600350 ?auto_3600357 ) ) ( OBJ-AT ?auto_3600355 ?auto_3600357 ) ( OBJ-AT ?auto_3600351 ?auto_3600357 ) ( IN-CITY ?auto_3600361 ?auto_3600360 ) ( not ( = ?auto_3600350 ?auto_3600361 ) ) ( OBJ-AT ?auto_3600356 ?auto_3600361 ) ( IN-CITY ?auto_3600362 ?auto_3600360 ) ( not ( = ?auto_3600350 ?auto_3600362 ) ) ( OBJ-AT ?auto_3600353 ?auto_3600362 ) ( TRUCK-AT ?auto_3600359 ?auto_3600350 ) ( not ( = ?auto_3600353 ?auto_3600356 ) ) ( not ( = ?auto_3600361 ?auto_3600362 ) ) ( not ( = ?auto_3600353 ?auto_3600351 ) ) ( not ( = ?auto_3600356 ?auto_3600351 ) ) ( not ( = ?auto_3600357 ?auto_3600361 ) ) ( not ( = ?auto_3600357 ?auto_3600362 ) ) ( not ( = ?auto_3600353 ?auto_3600355 ) ) ( not ( = ?auto_3600356 ?auto_3600355 ) ) ( not ( = ?auto_3600351 ?auto_3600355 ) ) ( not ( = ?auto_3600353 ?auto_3600352 ) ) ( not ( = ?auto_3600356 ?auto_3600352 ) ) ( not ( = ?auto_3600351 ?auto_3600352 ) ) ( not ( = ?auto_3600355 ?auto_3600352 ) ) ( not ( = ?auto_3600358 ?auto_3600357 ) ) ( not ( = ?auto_3600358 ?auto_3600361 ) ) ( not ( = ?auto_3600358 ?auto_3600362 ) ) ( not ( = ?auto_3600353 ?auto_3600354 ) ) ( not ( = ?auto_3600356 ?auto_3600354 ) ) ( not ( = ?auto_3600351 ?auto_3600354 ) ) ( not ( = ?auto_3600355 ?auto_3600354 ) ) ( not ( = ?auto_3600352 ?auto_3600354 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3600353 ?auto_3600356 ?auto_3600351 ?auto_3600352 ?auto_3600355 ?auto_3600354 ?auto_3600350 )
      ( DELIVER-6PKG-VERIFY ?auto_3600351 ?auto_3600352 ?auto_3600353 ?auto_3600354 ?auto_3600355 ?auto_3600356 ?auto_3600350 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3603245 - OBJ
      ?auto_3603246 - OBJ
      ?auto_3603247 - OBJ
      ?auto_3603248 - OBJ
      ?auto_3603249 - OBJ
      ?auto_3603250 - OBJ
      ?auto_3603244 - LOCATION
    )
    :vars
    (
      ?auto_3603252 - LOCATION
      ?auto_3603254 - CITY
      ?auto_3603251 - LOCATION
      ?auto_3603255 - LOCATION
      ?auto_3603256 - LOCATION
      ?auto_3603253 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3603252 ?auto_3603254 ) ( IN-CITY ?auto_3603244 ?auto_3603254 ) ( not ( = ?auto_3603244 ?auto_3603252 ) ) ( OBJ-AT ?auto_3603250 ?auto_3603252 ) ( OBJ-AT ?auto_3603246 ?auto_3603252 ) ( IN-CITY ?auto_3603251 ?auto_3603254 ) ( not ( = ?auto_3603244 ?auto_3603251 ) ) ( OBJ-AT ?auto_3603247 ?auto_3603251 ) ( OBJ-AT ?auto_3603245 ?auto_3603251 ) ( IN-CITY ?auto_3603255 ?auto_3603254 ) ( not ( = ?auto_3603244 ?auto_3603255 ) ) ( OBJ-AT ?auto_3603249 ?auto_3603255 ) ( IN-CITY ?auto_3603256 ?auto_3603254 ) ( not ( = ?auto_3603244 ?auto_3603256 ) ) ( OBJ-AT ?auto_3603248 ?auto_3603256 ) ( TRUCK-AT ?auto_3603253 ?auto_3603244 ) ( not ( = ?auto_3603248 ?auto_3603249 ) ) ( not ( = ?auto_3603255 ?auto_3603256 ) ) ( not ( = ?auto_3603248 ?auto_3603245 ) ) ( not ( = ?auto_3603249 ?auto_3603245 ) ) ( not ( = ?auto_3603251 ?auto_3603255 ) ) ( not ( = ?auto_3603251 ?auto_3603256 ) ) ( not ( = ?auto_3603248 ?auto_3603247 ) ) ( not ( = ?auto_3603249 ?auto_3603247 ) ) ( not ( = ?auto_3603245 ?auto_3603247 ) ) ( not ( = ?auto_3603248 ?auto_3603246 ) ) ( not ( = ?auto_3603249 ?auto_3603246 ) ) ( not ( = ?auto_3603245 ?auto_3603246 ) ) ( not ( = ?auto_3603247 ?auto_3603246 ) ) ( not ( = ?auto_3603252 ?auto_3603251 ) ) ( not ( = ?auto_3603252 ?auto_3603255 ) ) ( not ( = ?auto_3603252 ?auto_3603256 ) ) ( not ( = ?auto_3603248 ?auto_3603250 ) ) ( not ( = ?auto_3603249 ?auto_3603250 ) ) ( not ( = ?auto_3603245 ?auto_3603250 ) ) ( not ( = ?auto_3603247 ?auto_3603250 ) ) ( not ( = ?auto_3603246 ?auto_3603250 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3603248 ?auto_3603249 ?auto_3603245 ?auto_3603246 ?auto_3603247 ?auto_3603250 ?auto_3603244 )
      ( DELIVER-6PKG-VERIFY ?auto_3603245 ?auto_3603246 ?auto_3603247 ?auto_3603248 ?auto_3603249 ?auto_3603250 ?auto_3603244 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3603314 - OBJ
      ?auto_3603315 - OBJ
      ?auto_3603316 - OBJ
      ?auto_3603317 - OBJ
      ?auto_3603318 - OBJ
      ?auto_3603319 - OBJ
      ?auto_3603313 - LOCATION
    )
    :vars
    (
      ?auto_3603321 - LOCATION
      ?auto_3603323 - CITY
      ?auto_3603320 - LOCATION
      ?auto_3603324 - LOCATION
      ?auto_3603325 - LOCATION
      ?auto_3603322 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3603321 ?auto_3603323 ) ( IN-CITY ?auto_3603313 ?auto_3603323 ) ( not ( = ?auto_3603313 ?auto_3603321 ) ) ( OBJ-AT ?auto_3603318 ?auto_3603321 ) ( OBJ-AT ?auto_3603315 ?auto_3603321 ) ( IN-CITY ?auto_3603320 ?auto_3603323 ) ( not ( = ?auto_3603313 ?auto_3603320 ) ) ( OBJ-AT ?auto_3603316 ?auto_3603320 ) ( OBJ-AT ?auto_3603314 ?auto_3603320 ) ( IN-CITY ?auto_3603324 ?auto_3603323 ) ( not ( = ?auto_3603313 ?auto_3603324 ) ) ( OBJ-AT ?auto_3603319 ?auto_3603324 ) ( IN-CITY ?auto_3603325 ?auto_3603323 ) ( not ( = ?auto_3603313 ?auto_3603325 ) ) ( OBJ-AT ?auto_3603317 ?auto_3603325 ) ( TRUCK-AT ?auto_3603322 ?auto_3603313 ) ( not ( = ?auto_3603317 ?auto_3603319 ) ) ( not ( = ?auto_3603324 ?auto_3603325 ) ) ( not ( = ?auto_3603317 ?auto_3603314 ) ) ( not ( = ?auto_3603319 ?auto_3603314 ) ) ( not ( = ?auto_3603320 ?auto_3603324 ) ) ( not ( = ?auto_3603320 ?auto_3603325 ) ) ( not ( = ?auto_3603317 ?auto_3603316 ) ) ( not ( = ?auto_3603319 ?auto_3603316 ) ) ( not ( = ?auto_3603314 ?auto_3603316 ) ) ( not ( = ?auto_3603317 ?auto_3603315 ) ) ( not ( = ?auto_3603319 ?auto_3603315 ) ) ( not ( = ?auto_3603314 ?auto_3603315 ) ) ( not ( = ?auto_3603316 ?auto_3603315 ) ) ( not ( = ?auto_3603321 ?auto_3603320 ) ) ( not ( = ?auto_3603321 ?auto_3603324 ) ) ( not ( = ?auto_3603321 ?auto_3603325 ) ) ( not ( = ?auto_3603317 ?auto_3603318 ) ) ( not ( = ?auto_3603319 ?auto_3603318 ) ) ( not ( = ?auto_3603314 ?auto_3603318 ) ) ( not ( = ?auto_3603316 ?auto_3603318 ) ) ( not ( = ?auto_3603315 ?auto_3603318 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3603317 ?auto_3603319 ?auto_3603314 ?auto_3603315 ?auto_3603316 ?auto_3603318 ?auto_3603313 )
      ( DELIVER-6PKG-VERIFY ?auto_3603314 ?auto_3603315 ?auto_3603316 ?auto_3603317 ?auto_3603318 ?auto_3603319 ?auto_3603313 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3604020 - OBJ
      ?auto_3604021 - OBJ
      ?auto_3604022 - OBJ
      ?auto_3604023 - OBJ
      ?auto_3604024 - OBJ
      ?auto_3604025 - OBJ
      ?auto_3604019 - LOCATION
    )
    :vars
    (
      ?auto_3604027 - LOCATION
      ?auto_3604029 - CITY
      ?auto_3604026 - LOCATION
      ?auto_3604030 - LOCATION
      ?auto_3604031 - LOCATION
      ?auto_3604028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3604027 ?auto_3604029 ) ( IN-CITY ?auto_3604019 ?auto_3604029 ) ( not ( = ?auto_3604019 ?auto_3604027 ) ) ( OBJ-AT ?auto_3604023 ?auto_3604027 ) ( OBJ-AT ?auto_3604021 ?auto_3604027 ) ( IN-CITY ?auto_3604026 ?auto_3604029 ) ( not ( = ?auto_3604019 ?auto_3604026 ) ) ( OBJ-AT ?auto_3604022 ?auto_3604026 ) ( OBJ-AT ?auto_3604020 ?auto_3604026 ) ( IN-CITY ?auto_3604030 ?auto_3604029 ) ( not ( = ?auto_3604019 ?auto_3604030 ) ) ( OBJ-AT ?auto_3604025 ?auto_3604030 ) ( IN-CITY ?auto_3604031 ?auto_3604029 ) ( not ( = ?auto_3604019 ?auto_3604031 ) ) ( OBJ-AT ?auto_3604024 ?auto_3604031 ) ( TRUCK-AT ?auto_3604028 ?auto_3604019 ) ( not ( = ?auto_3604024 ?auto_3604025 ) ) ( not ( = ?auto_3604030 ?auto_3604031 ) ) ( not ( = ?auto_3604024 ?auto_3604020 ) ) ( not ( = ?auto_3604025 ?auto_3604020 ) ) ( not ( = ?auto_3604026 ?auto_3604030 ) ) ( not ( = ?auto_3604026 ?auto_3604031 ) ) ( not ( = ?auto_3604024 ?auto_3604022 ) ) ( not ( = ?auto_3604025 ?auto_3604022 ) ) ( not ( = ?auto_3604020 ?auto_3604022 ) ) ( not ( = ?auto_3604024 ?auto_3604021 ) ) ( not ( = ?auto_3604025 ?auto_3604021 ) ) ( not ( = ?auto_3604020 ?auto_3604021 ) ) ( not ( = ?auto_3604022 ?auto_3604021 ) ) ( not ( = ?auto_3604027 ?auto_3604026 ) ) ( not ( = ?auto_3604027 ?auto_3604030 ) ) ( not ( = ?auto_3604027 ?auto_3604031 ) ) ( not ( = ?auto_3604024 ?auto_3604023 ) ) ( not ( = ?auto_3604025 ?auto_3604023 ) ) ( not ( = ?auto_3604020 ?auto_3604023 ) ) ( not ( = ?auto_3604022 ?auto_3604023 ) ) ( not ( = ?auto_3604021 ?auto_3604023 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3604024 ?auto_3604025 ?auto_3604020 ?auto_3604021 ?auto_3604022 ?auto_3604023 ?auto_3604019 )
      ( DELIVER-6PKG-VERIFY ?auto_3604020 ?auto_3604021 ?auto_3604022 ?auto_3604023 ?auto_3604024 ?auto_3604025 ?auto_3604019 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3606014 - OBJ
      ?auto_3606015 - OBJ
      ?auto_3606016 - OBJ
      ?auto_3606017 - OBJ
      ?auto_3606018 - OBJ
      ?auto_3606019 - OBJ
      ?auto_3606013 - LOCATION
    )
    :vars
    (
      ?auto_3606021 - LOCATION
      ?auto_3606023 - CITY
      ?auto_3606020 - LOCATION
      ?auto_3606024 - LOCATION
      ?auto_3606025 - LOCATION
      ?auto_3606022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3606021 ?auto_3606023 ) ( IN-CITY ?auto_3606013 ?auto_3606023 ) ( not ( = ?auto_3606013 ?auto_3606021 ) ) ( OBJ-AT ?auto_3606016 ?auto_3606021 ) ( OBJ-AT ?auto_3606015 ?auto_3606021 ) ( IN-CITY ?auto_3606020 ?auto_3606023 ) ( not ( = ?auto_3606013 ?auto_3606020 ) ) ( OBJ-AT ?auto_3606019 ?auto_3606020 ) ( OBJ-AT ?auto_3606014 ?auto_3606020 ) ( IN-CITY ?auto_3606024 ?auto_3606023 ) ( not ( = ?auto_3606013 ?auto_3606024 ) ) ( OBJ-AT ?auto_3606018 ?auto_3606024 ) ( IN-CITY ?auto_3606025 ?auto_3606023 ) ( not ( = ?auto_3606013 ?auto_3606025 ) ) ( OBJ-AT ?auto_3606017 ?auto_3606025 ) ( TRUCK-AT ?auto_3606022 ?auto_3606013 ) ( not ( = ?auto_3606017 ?auto_3606018 ) ) ( not ( = ?auto_3606024 ?auto_3606025 ) ) ( not ( = ?auto_3606017 ?auto_3606014 ) ) ( not ( = ?auto_3606018 ?auto_3606014 ) ) ( not ( = ?auto_3606020 ?auto_3606024 ) ) ( not ( = ?auto_3606020 ?auto_3606025 ) ) ( not ( = ?auto_3606017 ?auto_3606019 ) ) ( not ( = ?auto_3606018 ?auto_3606019 ) ) ( not ( = ?auto_3606014 ?auto_3606019 ) ) ( not ( = ?auto_3606017 ?auto_3606015 ) ) ( not ( = ?auto_3606018 ?auto_3606015 ) ) ( not ( = ?auto_3606014 ?auto_3606015 ) ) ( not ( = ?auto_3606019 ?auto_3606015 ) ) ( not ( = ?auto_3606021 ?auto_3606020 ) ) ( not ( = ?auto_3606021 ?auto_3606024 ) ) ( not ( = ?auto_3606021 ?auto_3606025 ) ) ( not ( = ?auto_3606017 ?auto_3606016 ) ) ( not ( = ?auto_3606018 ?auto_3606016 ) ) ( not ( = ?auto_3606014 ?auto_3606016 ) ) ( not ( = ?auto_3606019 ?auto_3606016 ) ) ( not ( = ?auto_3606015 ?auto_3606016 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3606017 ?auto_3606018 ?auto_3606014 ?auto_3606015 ?auto_3606019 ?auto_3606016 ?auto_3606013 )
      ( DELIVER-6PKG-VERIFY ?auto_3606014 ?auto_3606015 ?auto_3606016 ?auto_3606017 ?auto_3606018 ?auto_3606019 ?auto_3606013 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3606157 - OBJ
      ?auto_3606158 - OBJ
      ?auto_3606159 - OBJ
      ?auto_3606160 - OBJ
      ?auto_3606161 - OBJ
      ?auto_3606162 - OBJ
      ?auto_3606156 - LOCATION
    )
    :vars
    (
      ?auto_3606164 - LOCATION
      ?auto_3606166 - CITY
      ?auto_3606163 - LOCATION
      ?auto_3606167 - LOCATION
      ?auto_3606168 - LOCATION
      ?auto_3606165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3606164 ?auto_3606166 ) ( IN-CITY ?auto_3606156 ?auto_3606166 ) ( not ( = ?auto_3606156 ?auto_3606164 ) ) ( OBJ-AT ?auto_3606159 ?auto_3606164 ) ( OBJ-AT ?auto_3606158 ?auto_3606164 ) ( IN-CITY ?auto_3606163 ?auto_3606166 ) ( not ( = ?auto_3606156 ?auto_3606163 ) ) ( OBJ-AT ?auto_3606161 ?auto_3606163 ) ( OBJ-AT ?auto_3606157 ?auto_3606163 ) ( IN-CITY ?auto_3606167 ?auto_3606166 ) ( not ( = ?auto_3606156 ?auto_3606167 ) ) ( OBJ-AT ?auto_3606162 ?auto_3606167 ) ( IN-CITY ?auto_3606168 ?auto_3606166 ) ( not ( = ?auto_3606156 ?auto_3606168 ) ) ( OBJ-AT ?auto_3606160 ?auto_3606168 ) ( TRUCK-AT ?auto_3606165 ?auto_3606156 ) ( not ( = ?auto_3606160 ?auto_3606162 ) ) ( not ( = ?auto_3606167 ?auto_3606168 ) ) ( not ( = ?auto_3606160 ?auto_3606157 ) ) ( not ( = ?auto_3606162 ?auto_3606157 ) ) ( not ( = ?auto_3606163 ?auto_3606167 ) ) ( not ( = ?auto_3606163 ?auto_3606168 ) ) ( not ( = ?auto_3606160 ?auto_3606161 ) ) ( not ( = ?auto_3606162 ?auto_3606161 ) ) ( not ( = ?auto_3606157 ?auto_3606161 ) ) ( not ( = ?auto_3606160 ?auto_3606158 ) ) ( not ( = ?auto_3606162 ?auto_3606158 ) ) ( not ( = ?auto_3606157 ?auto_3606158 ) ) ( not ( = ?auto_3606161 ?auto_3606158 ) ) ( not ( = ?auto_3606164 ?auto_3606163 ) ) ( not ( = ?auto_3606164 ?auto_3606167 ) ) ( not ( = ?auto_3606164 ?auto_3606168 ) ) ( not ( = ?auto_3606160 ?auto_3606159 ) ) ( not ( = ?auto_3606162 ?auto_3606159 ) ) ( not ( = ?auto_3606157 ?auto_3606159 ) ) ( not ( = ?auto_3606161 ?auto_3606159 ) ) ( not ( = ?auto_3606158 ?auto_3606159 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3606160 ?auto_3606162 ?auto_3606157 ?auto_3606158 ?auto_3606161 ?auto_3606159 ?auto_3606156 )
      ( DELIVER-6PKG-VERIFY ?auto_3606157 ?auto_3606158 ?auto_3606159 ?auto_3606160 ?auto_3606161 ?auto_3606162 ?auto_3606156 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_3607465 - OBJ
      ?auto_3607466 - OBJ
      ?auto_3607467 - OBJ
      ?auto_3607468 - OBJ
      ?auto_3607469 - OBJ
      ?auto_3607470 - OBJ
      ?auto_3607464 - LOCATION
    )
    :vars
    (
      ?auto_3607472 - LOCATION
      ?auto_3607474 - CITY
      ?auto_3607471 - LOCATION
      ?auto_3607475 - LOCATION
      ?auto_3607476 - LOCATION
      ?auto_3607473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3607472 ?auto_3607474 ) ( IN-CITY ?auto_3607464 ?auto_3607474 ) ( not ( = ?auto_3607464 ?auto_3607472 ) ) ( OBJ-AT ?auto_3607467 ?auto_3607472 ) ( OBJ-AT ?auto_3607466 ?auto_3607472 ) ( IN-CITY ?auto_3607471 ?auto_3607474 ) ( not ( = ?auto_3607464 ?auto_3607471 ) ) ( OBJ-AT ?auto_3607468 ?auto_3607471 ) ( OBJ-AT ?auto_3607465 ?auto_3607471 ) ( IN-CITY ?auto_3607475 ?auto_3607474 ) ( not ( = ?auto_3607464 ?auto_3607475 ) ) ( OBJ-AT ?auto_3607470 ?auto_3607475 ) ( IN-CITY ?auto_3607476 ?auto_3607474 ) ( not ( = ?auto_3607464 ?auto_3607476 ) ) ( OBJ-AT ?auto_3607469 ?auto_3607476 ) ( TRUCK-AT ?auto_3607473 ?auto_3607464 ) ( not ( = ?auto_3607469 ?auto_3607470 ) ) ( not ( = ?auto_3607475 ?auto_3607476 ) ) ( not ( = ?auto_3607469 ?auto_3607465 ) ) ( not ( = ?auto_3607470 ?auto_3607465 ) ) ( not ( = ?auto_3607471 ?auto_3607475 ) ) ( not ( = ?auto_3607471 ?auto_3607476 ) ) ( not ( = ?auto_3607469 ?auto_3607468 ) ) ( not ( = ?auto_3607470 ?auto_3607468 ) ) ( not ( = ?auto_3607465 ?auto_3607468 ) ) ( not ( = ?auto_3607469 ?auto_3607466 ) ) ( not ( = ?auto_3607470 ?auto_3607466 ) ) ( not ( = ?auto_3607465 ?auto_3607466 ) ) ( not ( = ?auto_3607468 ?auto_3607466 ) ) ( not ( = ?auto_3607472 ?auto_3607471 ) ) ( not ( = ?auto_3607472 ?auto_3607475 ) ) ( not ( = ?auto_3607472 ?auto_3607476 ) ) ( not ( = ?auto_3607469 ?auto_3607467 ) ) ( not ( = ?auto_3607470 ?auto_3607467 ) ) ( not ( = ?auto_3607465 ?auto_3607467 ) ) ( not ( = ?auto_3607468 ?auto_3607467 ) ) ( not ( = ?auto_3607466 ?auto_3607467 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_3607469 ?auto_3607470 ?auto_3607465 ?auto_3607466 ?auto_3607468 ?auto_3607467 ?auto_3607464 )
      ( DELIVER-6PKG-VERIFY ?auto_3607465 ?auto_3607466 ?auto_3607467 ?auto_3607468 ?auto_3607469 ?auto_3607470 ?auto_3607464 ) )
  )

)

