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
      ?auto_2477983 - OBJ
      ?auto_2477982 - LOCATION
    )
    :vars
    (
      ?auto_2477985 - LOCATION
      ?auto_2477986 - CITY
      ?auto_2477984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2477985 ?auto_2477986 ) ( IN-CITY ?auto_2477982 ?auto_2477986 ) ( not ( = ?auto_2477982 ?auto_2477985 ) ) ( OBJ-AT ?auto_2477983 ?auto_2477985 ) ( TRUCK-AT ?auto_2477984 ?auto_2477982 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2477984 ?auto_2477982 ?auto_2477985 ?auto_2477986 )
      ( !LOAD-TRUCK ?auto_2477983 ?auto_2477984 ?auto_2477985 )
      ( !DRIVE-TRUCK ?auto_2477984 ?auto_2477985 ?auto_2477982 ?auto_2477986 )
      ( !UNLOAD-TRUCK ?auto_2477983 ?auto_2477984 ?auto_2477982 )
      ( DELIVER-1PKG-VERIFY ?auto_2477983 ?auto_2477982 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2478004 - OBJ
      ?auto_2478005 - OBJ
      ?auto_2478003 - LOCATION
    )
    :vars
    (
      ?auto_2478006 - LOCATION
      ?auto_2478007 - CITY
      ?auto_2478008 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2478006 ?auto_2478007 ) ( IN-CITY ?auto_2478003 ?auto_2478007 ) ( not ( = ?auto_2478003 ?auto_2478006 ) ) ( OBJ-AT ?auto_2478005 ?auto_2478006 ) ( OBJ-AT ?auto_2478004 ?auto_2478006 ) ( TRUCK-AT ?auto_2478008 ?auto_2478003 ) ( not ( = ?auto_2478004 ?auto_2478005 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2478004 ?auto_2478003 )
      ( DELIVER-1PKG ?auto_2478005 ?auto_2478003 )
      ( DELIVER-2PKG-VERIFY ?auto_2478004 ?auto_2478005 ?auto_2478003 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2478112 - OBJ
      ?auto_2478113 - OBJ
      ?auto_2478114 - OBJ
      ?auto_2478111 - LOCATION
    )
    :vars
    (
      ?auto_2478115 - LOCATION
      ?auto_2478116 - CITY
      ?auto_2478118 - LOCATION
      ?auto_2478117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2478115 ?auto_2478116 ) ( IN-CITY ?auto_2478111 ?auto_2478116 ) ( not ( = ?auto_2478111 ?auto_2478115 ) ) ( OBJ-AT ?auto_2478114 ?auto_2478115 ) ( IN-CITY ?auto_2478118 ?auto_2478116 ) ( not ( = ?auto_2478111 ?auto_2478118 ) ) ( OBJ-AT ?auto_2478113 ?auto_2478118 ) ( OBJ-AT ?auto_2478112 ?auto_2478118 ) ( TRUCK-AT ?auto_2478117 ?auto_2478111 ) ( not ( = ?auto_2478112 ?auto_2478113 ) ) ( not ( = ?auto_2478112 ?auto_2478114 ) ) ( not ( = ?auto_2478113 ?auto_2478114 ) ) ( not ( = ?auto_2478115 ?auto_2478118 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2478112 ?auto_2478113 ?auto_2478111 )
      ( DELIVER-1PKG ?auto_2478114 ?auto_2478111 )
      ( DELIVER-3PKG-VERIFY ?auto_2478112 ?auto_2478113 ?auto_2478114 ?auto_2478111 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2478129 - OBJ
      ?auto_2478130 - OBJ
      ?auto_2478131 - OBJ
      ?auto_2478128 - LOCATION
    )
    :vars
    (
      ?auto_2478132 - LOCATION
      ?auto_2478133 - CITY
      ?auto_2478134 - LOCATION
      ?auto_2478135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2478132 ?auto_2478133 ) ( IN-CITY ?auto_2478128 ?auto_2478133 ) ( not ( = ?auto_2478128 ?auto_2478132 ) ) ( OBJ-AT ?auto_2478130 ?auto_2478132 ) ( IN-CITY ?auto_2478134 ?auto_2478133 ) ( not ( = ?auto_2478128 ?auto_2478134 ) ) ( OBJ-AT ?auto_2478131 ?auto_2478134 ) ( OBJ-AT ?auto_2478129 ?auto_2478134 ) ( TRUCK-AT ?auto_2478135 ?auto_2478128 ) ( not ( = ?auto_2478129 ?auto_2478131 ) ) ( not ( = ?auto_2478129 ?auto_2478130 ) ) ( not ( = ?auto_2478131 ?auto_2478130 ) ) ( not ( = ?auto_2478132 ?auto_2478134 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2478129 ?auto_2478131 ?auto_2478130 ?auto_2478128 )
      ( DELIVER-3PKG-VERIFY ?auto_2478129 ?auto_2478130 ?auto_2478131 ?auto_2478128 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2478190 - OBJ
      ?auto_2478191 - OBJ
      ?auto_2478192 - OBJ
      ?auto_2478189 - LOCATION
    )
    :vars
    (
      ?auto_2478195 - LOCATION
      ?auto_2478193 - CITY
      ?auto_2478194 - LOCATION
      ?auto_2478196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2478195 ?auto_2478193 ) ( IN-CITY ?auto_2478189 ?auto_2478193 ) ( not ( = ?auto_2478189 ?auto_2478195 ) ) ( OBJ-AT ?auto_2478190 ?auto_2478195 ) ( IN-CITY ?auto_2478194 ?auto_2478193 ) ( not ( = ?auto_2478189 ?auto_2478194 ) ) ( OBJ-AT ?auto_2478192 ?auto_2478194 ) ( OBJ-AT ?auto_2478191 ?auto_2478194 ) ( TRUCK-AT ?auto_2478196 ?auto_2478189 ) ( not ( = ?auto_2478191 ?auto_2478192 ) ) ( not ( = ?auto_2478191 ?auto_2478190 ) ) ( not ( = ?auto_2478192 ?auto_2478190 ) ) ( not ( = ?auto_2478195 ?auto_2478194 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2478191 ?auto_2478190 ?auto_2478192 ?auto_2478189 )
      ( DELIVER-3PKG-VERIFY ?auto_2478190 ?auto_2478191 ?auto_2478192 ?auto_2478189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2479241 - OBJ
      ?auto_2479242 - OBJ
      ?auto_2479243 - OBJ
      ?auto_2479244 - OBJ
      ?auto_2479240 - LOCATION
    )
    :vars
    (
      ?auto_2479247 - LOCATION
      ?auto_2479245 - CITY
      ?auto_2479249 - LOCATION
      ?auto_2479248 - LOCATION
      ?auto_2479246 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2479247 ?auto_2479245 ) ( IN-CITY ?auto_2479240 ?auto_2479245 ) ( not ( = ?auto_2479240 ?auto_2479247 ) ) ( OBJ-AT ?auto_2479244 ?auto_2479247 ) ( IN-CITY ?auto_2479249 ?auto_2479245 ) ( not ( = ?auto_2479240 ?auto_2479249 ) ) ( OBJ-AT ?auto_2479243 ?auto_2479249 ) ( IN-CITY ?auto_2479248 ?auto_2479245 ) ( not ( = ?auto_2479240 ?auto_2479248 ) ) ( OBJ-AT ?auto_2479242 ?auto_2479248 ) ( OBJ-AT ?auto_2479241 ?auto_2479248 ) ( TRUCK-AT ?auto_2479246 ?auto_2479240 ) ( not ( = ?auto_2479241 ?auto_2479242 ) ) ( not ( = ?auto_2479241 ?auto_2479243 ) ) ( not ( = ?auto_2479242 ?auto_2479243 ) ) ( not ( = ?auto_2479249 ?auto_2479248 ) ) ( not ( = ?auto_2479241 ?auto_2479244 ) ) ( not ( = ?auto_2479242 ?auto_2479244 ) ) ( not ( = ?auto_2479243 ?auto_2479244 ) ) ( not ( = ?auto_2479247 ?auto_2479249 ) ) ( not ( = ?auto_2479247 ?auto_2479248 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2479241 ?auto_2479243 ?auto_2479242 ?auto_2479240 )
      ( DELIVER-1PKG ?auto_2479244 ?auto_2479240 )
      ( DELIVER-4PKG-VERIFY ?auto_2479241 ?auto_2479242 ?auto_2479243 ?auto_2479244 ?auto_2479240 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2479300 - OBJ
      ?auto_2479301 - OBJ
      ?auto_2479302 - OBJ
      ?auto_2479303 - OBJ
      ?auto_2479299 - LOCATION
    )
    :vars
    (
      ?auto_2479308 - LOCATION
      ?auto_2479307 - CITY
      ?auto_2479304 - LOCATION
      ?auto_2479305 - LOCATION
      ?auto_2479306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2479308 ?auto_2479307 ) ( IN-CITY ?auto_2479299 ?auto_2479307 ) ( not ( = ?auto_2479299 ?auto_2479308 ) ) ( OBJ-AT ?auto_2479303 ?auto_2479308 ) ( IN-CITY ?auto_2479304 ?auto_2479307 ) ( not ( = ?auto_2479299 ?auto_2479304 ) ) ( OBJ-AT ?auto_2479301 ?auto_2479304 ) ( IN-CITY ?auto_2479305 ?auto_2479307 ) ( not ( = ?auto_2479299 ?auto_2479305 ) ) ( OBJ-AT ?auto_2479302 ?auto_2479305 ) ( OBJ-AT ?auto_2479300 ?auto_2479305 ) ( TRUCK-AT ?auto_2479306 ?auto_2479299 ) ( not ( = ?auto_2479300 ?auto_2479302 ) ) ( not ( = ?auto_2479300 ?auto_2479301 ) ) ( not ( = ?auto_2479302 ?auto_2479301 ) ) ( not ( = ?auto_2479304 ?auto_2479305 ) ) ( not ( = ?auto_2479300 ?auto_2479303 ) ) ( not ( = ?auto_2479302 ?auto_2479303 ) ) ( not ( = ?auto_2479301 ?auto_2479303 ) ) ( not ( = ?auto_2479308 ?auto_2479304 ) ) ( not ( = ?auto_2479308 ?auto_2479305 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2479300 ?auto_2479302 ?auto_2479301 ?auto_2479303 ?auto_2479299 )
      ( DELIVER-4PKG-VERIFY ?auto_2479300 ?auto_2479301 ?auto_2479302 ?auto_2479303 ?auto_2479299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2479332 - OBJ
      ?auto_2479333 - OBJ
      ?auto_2479334 - OBJ
      ?auto_2479335 - OBJ
      ?auto_2479331 - LOCATION
    )
    :vars
    (
      ?auto_2479336 - LOCATION
      ?auto_2479338 - CITY
      ?auto_2479339 - LOCATION
      ?auto_2479340 - LOCATION
      ?auto_2479337 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2479336 ?auto_2479338 ) ( IN-CITY ?auto_2479331 ?auto_2479338 ) ( not ( = ?auto_2479331 ?auto_2479336 ) ) ( OBJ-AT ?auto_2479334 ?auto_2479336 ) ( IN-CITY ?auto_2479339 ?auto_2479338 ) ( not ( = ?auto_2479331 ?auto_2479339 ) ) ( OBJ-AT ?auto_2479333 ?auto_2479339 ) ( IN-CITY ?auto_2479340 ?auto_2479338 ) ( not ( = ?auto_2479331 ?auto_2479340 ) ) ( OBJ-AT ?auto_2479335 ?auto_2479340 ) ( OBJ-AT ?auto_2479332 ?auto_2479340 ) ( TRUCK-AT ?auto_2479337 ?auto_2479331 ) ( not ( = ?auto_2479332 ?auto_2479335 ) ) ( not ( = ?auto_2479332 ?auto_2479333 ) ) ( not ( = ?auto_2479335 ?auto_2479333 ) ) ( not ( = ?auto_2479339 ?auto_2479340 ) ) ( not ( = ?auto_2479332 ?auto_2479334 ) ) ( not ( = ?auto_2479335 ?auto_2479334 ) ) ( not ( = ?auto_2479333 ?auto_2479334 ) ) ( not ( = ?auto_2479336 ?auto_2479339 ) ) ( not ( = ?auto_2479336 ?auto_2479340 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2479332 ?auto_2479333 ?auto_2479335 ?auto_2479334 ?auto_2479331 )
      ( DELIVER-4PKG-VERIFY ?auto_2479332 ?auto_2479333 ?auto_2479334 ?auto_2479335 ?auto_2479331 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2479921 - OBJ
      ?auto_2479922 - OBJ
      ?auto_2479923 - OBJ
      ?auto_2479924 - OBJ
      ?auto_2479920 - LOCATION
    )
    :vars
    (
      ?auto_2479925 - LOCATION
      ?auto_2479927 - CITY
      ?auto_2479928 - LOCATION
      ?auto_2479929 - LOCATION
      ?auto_2479926 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2479925 ?auto_2479927 ) ( IN-CITY ?auto_2479920 ?auto_2479927 ) ( not ( = ?auto_2479920 ?auto_2479925 ) ) ( OBJ-AT ?auto_2479924 ?auto_2479925 ) ( IN-CITY ?auto_2479928 ?auto_2479927 ) ( not ( = ?auto_2479920 ?auto_2479928 ) ) ( OBJ-AT ?auto_2479921 ?auto_2479928 ) ( IN-CITY ?auto_2479929 ?auto_2479927 ) ( not ( = ?auto_2479920 ?auto_2479929 ) ) ( OBJ-AT ?auto_2479923 ?auto_2479929 ) ( OBJ-AT ?auto_2479922 ?auto_2479929 ) ( TRUCK-AT ?auto_2479926 ?auto_2479920 ) ( not ( = ?auto_2479922 ?auto_2479923 ) ) ( not ( = ?auto_2479922 ?auto_2479921 ) ) ( not ( = ?auto_2479923 ?auto_2479921 ) ) ( not ( = ?auto_2479928 ?auto_2479929 ) ) ( not ( = ?auto_2479922 ?auto_2479924 ) ) ( not ( = ?auto_2479923 ?auto_2479924 ) ) ( not ( = ?auto_2479921 ?auto_2479924 ) ) ( not ( = ?auto_2479925 ?auto_2479928 ) ) ( not ( = ?auto_2479925 ?auto_2479929 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2479922 ?auto_2479921 ?auto_2479923 ?auto_2479924 ?auto_2479920 )
      ( DELIVER-4PKG-VERIFY ?auto_2479921 ?auto_2479922 ?auto_2479923 ?auto_2479924 ?auto_2479920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2479953 - OBJ
      ?auto_2479954 - OBJ
      ?auto_2479955 - OBJ
      ?auto_2479956 - OBJ
      ?auto_2479952 - LOCATION
    )
    :vars
    (
      ?auto_2479957 - LOCATION
      ?auto_2479959 - CITY
      ?auto_2479960 - LOCATION
      ?auto_2479961 - LOCATION
      ?auto_2479958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2479957 ?auto_2479959 ) ( IN-CITY ?auto_2479952 ?auto_2479959 ) ( not ( = ?auto_2479952 ?auto_2479957 ) ) ( OBJ-AT ?auto_2479955 ?auto_2479957 ) ( IN-CITY ?auto_2479960 ?auto_2479959 ) ( not ( = ?auto_2479952 ?auto_2479960 ) ) ( OBJ-AT ?auto_2479953 ?auto_2479960 ) ( IN-CITY ?auto_2479961 ?auto_2479959 ) ( not ( = ?auto_2479952 ?auto_2479961 ) ) ( OBJ-AT ?auto_2479956 ?auto_2479961 ) ( OBJ-AT ?auto_2479954 ?auto_2479961 ) ( TRUCK-AT ?auto_2479958 ?auto_2479952 ) ( not ( = ?auto_2479954 ?auto_2479956 ) ) ( not ( = ?auto_2479954 ?auto_2479953 ) ) ( not ( = ?auto_2479956 ?auto_2479953 ) ) ( not ( = ?auto_2479960 ?auto_2479961 ) ) ( not ( = ?auto_2479954 ?auto_2479955 ) ) ( not ( = ?auto_2479956 ?auto_2479955 ) ) ( not ( = ?auto_2479953 ?auto_2479955 ) ) ( not ( = ?auto_2479957 ?auto_2479960 ) ) ( not ( = ?auto_2479957 ?auto_2479961 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2479954 ?auto_2479953 ?auto_2479956 ?auto_2479955 ?auto_2479952 )
      ( DELIVER-4PKG-VERIFY ?auto_2479953 ?auto_2479954 ?auto_2479955 ?auto_2479956 ?auto_2479952 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2480141 - OBJ
      ?auto_2480142 - OBJ
      ?auto_2480143 - OBJ
      ?auto_2480144 - OBJ
      ?auto_2480140 - LOCATION
    )
    :vars
    (
      ?auto_2480145 - LOCATION
      ?auto_2480147 - CITY
      ?auto_2480148 - LOCATION
      ?auto_2480149 - LOCATION
      ?auto_2480146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2480145 ?auto_2480147 ) ( IN-CITY ?auto_2480140 ?auto_2480147 ) ( not ( = ?auto_2480140 ?auto_2480145 ) ) ( OBJ-AT ?auto_2480142 ?auto_2480145 ) ( IN-CITY ?auto_2480148 ?auto_2480147 ) ( not ( = ?auto_2480140 ?auto_2480148 ) ) ( OBJ-AT ?auto_2480141 ?auto_2480148 ) ( IN-CITY ?auto_2480149 ?auto_2480147 ) ( not ( = ?auto_2480140 ?auto_2480149 ) ) ( OBJ-AT ?auto_2480144 ?auto_2480149 ) ( OBJ-AT ?auto_2480143 ?auto_2480149 ) ( TRUCK-AT ?auto_2480146 ?auto_2480140 ) ( not ( = ?auto_2480143 ?auto_2480144 ) ) ( not ( = ?auto_2480143 ?auto_2480141 ) ) ( not ( = ?auto_2480144 ?auto_2480141 ) ) ( not ( = ?auto_2480148 ?auto_2480149 ) ) ( not ( = ?auto_2480143 ?auto_2480142 ) ) ( not ( = ?auto_2480144 ?auto_2480142 ) ) ( not ( = ?auto_2480141 ?auto_2480142 ) ) ( not ( = ?auto_2480145 ?auto_2480148 ) ) ( not ( = ?auto_2480145 ?auto_2480149 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2480143 ?auto_2480141 ?auto_2480144 ?auto_2480142 ?auto_2480140 )
      ( DELIVER-4PKG-VERIFY ?auto_2480141 ?auto_2480142 ?auto_2480143 ?auto_2480144 ?auto_2480140 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2494651 - OBJ
      ?auto_2494652 - OBJ
      ?auto_2494653 - OBJ
      ?auto_2494654 - OBJ
      ?auto_2494655 - OBJ
      ?auto_2494650 - LOCATION
    )
    :vars
    (
      ?auto_2494658 - LOCATION
      ?auto_2494657 - CITY
      ?auto_2494659 - LOCATION
      ?auto_2494660 - LOCATION
      ?auto_2494656 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2494658 ?auto_2494657 ) ( IN-CITY ?auto_2494650 ?auto_2494657 ) ( not ( = ?auto_2494650 ?auto_2494658 ) ) ( OBJ-AT ?auto_2494655 ?auto_2494658 ) ( IN-CITY ?auto_2494659 ?auto_2494657 ) ( not ( = ?auto_2494650 ?auto_2494659 ) ) ( OBJ-AT ?auto_2494654 ?auto_2494659 ) ( IN-CITY ?auto_2494660 ?auto_2494657 ) ( not ( = ?auto_2494650 ?auto_2494660 ) ) ( OBJ-AT ?auto_2494653 ?auto_2494660 ) ( OBJ-AT ?auto_2494652 ?auto_2494658 ) ( OBJ-AT ?auto_2494651 ?auto_2494658 ) ( TRUCK-AT ?auto_2494656 ?auto_2494650 ) ( not ( = ?auto_2494651 ?auto_2494652 ) ) ( not ( = ?auto_2494651 ?auto_2494653 ) ) ( not ( = ?auto_2494652 ?auto_2494653 ) ) ( not ( = ?auto_2494660 ?auto_2494658 ) ) ( not ( = ?auto_2494651 ?auto_2494654 ) ) ( not ( = ?auto_2494652 ?auto_2494654 ) ) ( not ( = ?auto_2494653 ?auto_2494654 ) ) ( not ( = ?auto_2494659 ?auto_2494660 ) ) ( not ( = ?auto_2494659 ?auto_2494658 ) ) ( not ( = ?auto_2494651 ?auto_2494655 ) ) ( not ( = ?auto_2494652 ?auto_2494655 ) ) ( not ( = ?auto_2494653 ?auto_2494655 ) ) ( not ( = ?auto_2494654 ?auto_2494655 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2494651 ?auto_2494653 ?auto_2494652 ?auto_2494654 ?auto_2494650 )
      ( DELIVER-1PKG ?auto_2494655 ?auto_2494650 )
      ( DELIVER-5PKG-VERIFY ?auto_2494651 ?auto_2494652 ?auto_2494653 ?auto_2494654 ?auto_2494655 ?auto_2494650 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2494698 - OBJ
      ?auto_2494699 - OBJ
      ?auto_2494700 - OBJ
      ?auto_2494701 - OBJ
      ?auto_2494702 - OBJ
      ?auto_2494697 - LOCATION
    )
    :vars
    (
      ?auto_2494707 - LOCATION
      ?auto_2494706 - CITY
      ?auto_2494705 - LOCATION
      ?auto_2494704 - LOCATION
      ?auto_2494703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2494707 ?auto_2494706 ) ( IN-CITY ?auto_2494697 ?auto_2494706 ) ( not ( = ?auto_2494697 ?auto_2494707 ) ) ( OBJ-AT ?auto_2494701 ?auto_2494707 ) ( IN-CITY ?auto_2494705 ?auto_2494706 ) ( not ( = ?auto_2494697 ?auto_2494705 ) ) ( OBJ-AT ?auto_2494702 ?auto_2494705 ) ( IN-CITY ?auto_2494704 ?auto_2494706 ) ( not ( = ?auto_2494697 ?auto_2494704 ) ) ( OBJ-AT ?auto_2494700 ?auto_2494704 ) ( OBJ-AT ?auto_2494699 ?auto_2494707 ) ( OBJ-AT ?auto_2494698 ?auto_2494707 ) ( TRUCK-AT ?auto_2494703 ?auto_2494697 ) ( not ( = ?auto_2494698 ?auto_2494699 ) ) ( not ( = ?auto_2494698 ?auto_2494700 ) ) ( not ( = ?auto_2494699 ?auto_2494700 ) ) ( not ( = ?auto_2494704 ?auto_2494707 ) ) ( not ( = ?auto_2494698 ?auto_2494702 ) ) ( not ( = ?auto_2494699 ?auto_2494702 ) ) ( not ( = ?auto_2494700 ?auto_2494702 ) ) ( not ( = ?auto_2494705 ?auto_2494704 ) ) ( not ( = ?auto_2494705 ?auto_2494707 ) ) ( not ( = ?auto_2494698 ?auto_2494701 ) ) ( not ( = ?auto_2494699 ?auto_2494701 ) ) ( not ( = ?auto_2494700 ?auto_2494701 ) ) ( not ( = ?auto_2494702 ?auto_2494701 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2494698 ?auto_2494699 ?auto_2494700 ?auto_2494702 ?auto_2494701 ?auto_2494697 )
      ( DELIVER-5PKG-VERIFY ?auto_2494698 ?auto_2494699 ?auto_2494700 ?auto_2494701 ?auto_2494702 ?auto_2494697 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2494979 - OBJ
      ?auto_2494980 - OBJ
      ?auto_2494981 - OBJ
      ?auto_2494982 - OBJ
      ?auto_2494983 - OBJ
      ?auto_2494978 - LOCATION
    )
    :vars
    (
      ?auto_2494988 - LOCATION
      ?auto_2494986 - CITY
      ?auto_2494987 - LOCATION
      ?auto_2494984 - LOCATION
      ?auto_2494985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2494988 ?auto_2494986 ) ( IN-CITY ?auto_2494978 ?auto_2494986 ) ( not ( = ?auto_2494978 ?auto_2494988 ) ) ( OBJ-AT ?auto_2494981 ?auto_2494988 ) ( IN-CITY ?auto_2494987 ?auto_2494986 ) ( not ( = ?auto_2494978 ?auto_2494987 ) ) ( OBJ-AT ?auto_2494983 ?auto_2494987 ) ( IN-CITY ?auto_2494984 ?auto_2494986 ) ( not ( = ?auto_2494978 ?auto_2494984 ) ) ( OBJ-AT ?auto_2494982 ?auto_2494984 ) ( OBJ-AT ?auto_2494980 ?auto_2494988 ) ( OBJ-AT ?auto_2494979 ?auto_2494988 ) ( TRUCK-AT ?auto_2494985 ?auto_2494978 ) ( not ( = ?auto_2494979 ?auto_2494980 ) ) ( not ( = ?auto_2494979 ?auto_2494982 ) ) ( not ( = ?auto_2494980 ?auto_2494982 ) ) ( not ( = ?auto_2494984 ?auto_2494988 ) ) ( not ( = ?auto_2494979 ?auto_2494983 ) ) ( not ( = ?auto_2494980 ?auto_2494983 ) ) ( not ( = ?auto_2494982 ?auto_2494983 ) ) ( not ( = ?auto_2494987 ?auto_2494984 ) ) ( not ( = ?auto_2494987 ?auto_2494988 ) ) ( not ( = ?auto_2494979 ?auto_2494981 ) ) ( not ( = ?auto_2494980 ?auto_2494981 ) ) ( not ( = ?auto_2494982 ?auto_2494981 ) ) ( not ( = ?auto_2494983 ?auto_2494981 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2494979 ?auto_2494980 ?auto_2494982 ?auto_2494981 ?auto_2494983 ?auto_2494978 )
      ( DELIVER-5PKG-VERIFY ?auto_2494979 ?auto_2494980 ?auto_2494981 ?auto_2494982 ?auto_2494983 ?auto_2494978 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2495268 - OBJ
      ?auto_2495269 - OBJ
      ?auto_2495270 - OBJ
      ?auto_2495271 - OBJ
      ?auto_2495272 - OBJ
      ?auto_2495267 - LOCATION
    )
    :vars
    (
      ?auto_2495277 - LOCATION
      ?auto_2495275 - CITY
      ?auto_2495276 - LOCATION
      ?auto_2495273 - LOCATION
      ?auto_2495274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2495277 ?auto_2495275 ) ( IN-CITY ?auto_2495267 ?auto_2495275 ) ( not ( = ?auto_2495267 ?auto_2495277 ) ) ( OBJ-AT ?auto_2495272 ?auto_2495277 ) ( IN-CITY ?auto_2495276 ?auto_2495275 ) ( not ( = ?auto_2495267 ?auto_2495276 ) ) ( OBJ-AT ?auto_2495271 ?auto_2495276 ) ( IN-CITY ?auto_2495273 ?auto_2495275 ) ( not ( = ?auto_2495267 ?auto_2495273 ) ) ( OBJ-AT ?auto_2495269 ?auto_2495273 ) ( OBJ-AT ?auto_2495270 ?auto_2495277 ) ( OBJ-AT ?auto_2495268 ?auto_2495277 ) ( TRUCK-AT ?auto_2495274 ?auto_2495267 ) ( not ( = ?auto_2495268 ?auto_2495270 ) ) ( not ( = ?auto_2495268 ?auto_2495269 ) ) ( not ( = ?auto_2495270 ?auto_2495269 ) ) ( not ( = ?auto_2495273 ?auto_2495277 ) ) ( not ( = ?auto_2495268 ?auto_2495271 ) ) ( not ( = ?auto_2495270 ?auto_2495271 ) ) ( not ( = ?auto_2495269 ?auto_2495271 ) ) ( not ( = ?auto_2495276 ?auto_2495273 ) ) ( not ( = ?auto_2495276 ?auto_2495277 ) ) ( not ( = ?auto_2495268 ?auto_2495272 ) ) ( not ( = ?auto_2495270 ?auto_2495272 ) ) ( not ( = ?auto_2495269 ?auto_2495272 ) ) ( not ( = ?auto_2495271 ?auto_2495272 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2495268 ?auto_2495270 ?auto_2495269 ?auto_2495272 ?auto_2495271 ?auto_2495267 )
      ( DELIVER-5PKG-VERIFY ?auto_2495268 ?auto_2495269 ?auto_2495270 ?auto_2495271 ?auto_2495272 ?auto_2495267 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2495315 - OBJ
      ?auto_2495316 - OBJ
      ?auto_2495317 - OBJ
      ?auto_2495318 - OBJ
      ?auto_2495319 - OBJ
      ?auto_2495314 - LOCATION
    )
    :vars
    (
      ?auto_2495324 - LOCATION
      ?auto_2495322 - CITY
      ?auto_2495323 - LOCATION
      ?auto_2495320 - LOCATION
      ?auto_2495321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2495324 ?auto_2495322 ) ( IN-CITY ?auto_2495314 ?auto_2495322 ) ( not ( = ?auto_2495314 ?auto_2495324 ) ) ( OBJ-AT ?auto_2495318 ?auto_2495324 ) ( IN-CITY ?auto_2495323 ?auto_2495322 ) ( not ( = ?auto_2495314 ?auto_2495323 ) ) ( OBJ-AT ?auto_2495319 ?auto_2495323 ) ( IN-CITY ?auto_2495320 ?auto_2495322 ) ( not ( = ?auto_2495314 ?auto_2495320 ) ) ( OBJ-AT ?auto_2495316 ?auto_2495320 ) ( OBJ-AT ?auto_2495317 ?auto_2495324 ) ( OBJ-AT ?auto_2495315 ?auto_2495324 ) ( TRUCK-AT ?auto_2495321 ?auto_2495314 ) ( not ( = ?auto_2495315 ?auto_2495317 ) ) ( not ( = ?auto_2495315 ?auto_2495316 ) ) ( not ( = ?auto_2495317 ?auto_2495316 ) ) ( not ( = ?auto_2495320 ?auto_2495324 ) ) ( not ( = ?auto_2495315 ?auto_2495319 ) ) ( not ( = ?auto_2495317 ?auto_2495319 ) ) ( not ( = ?auto_2495316 ?auto_2495319 ) ) ( not ( = ?auto_2495323 ?auto_2495320 ) ) ( not ( = ?auto_2495323 ?auto_2495324 ) ) ( not ( = ?auto_2495315 ?auto_2495318 ) ) ( not ( = ?auto_2495317 ?auto_2495318 ) ) ( not ( = ?auto_2495316 ?auto_2495318 ) ) ( not ( = ?auto_2495319 ?auto_2495318 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2495315 ?auto_2495317 ?auto_2495316 ?auto_2495318 ?auto_2495319 ?auto_2495314 )
      ( DELIVER-5PKG-VERIFY ?auto_2495315 ?auto_2495316 ?auto_2495317 ?auto_2495318 ?auto_2495319 ?auto_2495314 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2495463 - OBJ
      ?auto_2495464 - OBJ
      ?auto_2495465 - OBJ
      ?auto_2495466 - OBJ
      ?auto_2495467 - OBJ
      ?auto_2495462 - LOCATION
    )
    :vars
    (
      ?auto_2495472 - LOCATION
      ?auto_2495470 - CITY
      ?auto_2495471 - LOCATION
      ?auto_2495468 - LOCATION
      ?auto_2495469 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2495472 ?auto_2495470 ) ( IN-CITY ?auto_2495462 ?auto_2495470 ) ( not ( = ?auto_2495462 ?auto_2495472 ) ) ( OBJ-AT ?auto_2495467 ?auto_2495472 ) ( IN-CITY ?auto_2495471 ?auto_2495470 ) ( not ( = ?auto_2495462 ?auto_2495471 ) ) ( OBJ-AT ?auto_2495465 ?auto_2495471 ) ( IN-CITY ?auto_2495468 ?auto_2495470 ) ( not ( = ?auto_2495462 ?auto_2495468 ) ) ( OBJ-AT ?auto_2495464 ?auto_2495468 ) ( OBJ-AT ?auto_2495466 ?auto_2495472 ) ( OBJ-AT ?auto_2495463 ?auto_2495472 ) ( TRUCK-AT ?auto_2495469 ?auto_2495462 ) ( not ( = ?auto_2495463 ?auto_2495466 ) ) ( not ( = ?auto_2495463 ?auto_2495464 ) ) ( not ( = ?auto_2495466 ?auto_2495464 ) ) ( not ( = ?auto_2495468 ?auto_2495472 ) ) ( not ( = ?auto_2495463 ?auto_2495465 ) ) ( not ( = ?auto_2495466 ?auto_2495465 ) ) ( not ( = ?auto_2495464 ?auto_2495465 ) ) ( not ( = ?auto_2495471 ?auto_2495468 ) ) ( not ( = ?auto_2495471 ?auto_2495472 ) ) ( not ( = ?auto_2495463 ?auto_2495467 ) ) ( not ( = ?auto_2495466 ?auto_2495467 ) ) ( not ( = ?auto_2495464 ?auto_2495467 ) ) ( not ( = ?auto_2495465 ?auto_2495467 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2495463 ?auto_2495466 ?auto_2495464 ?auto_2495467 ?auto_2495465 ?auto_2495462 )
      ( DELIVER-5PKG-VERIFY ?auto_2495463 ?auto_2495464 ?auto_2495465 ?auto_2495466 ?auto_2495467 ?auto_2495462 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2502714 - OBJ
      ?auto_2502715 - OBJ
      ?auto_2502716 - OBJ
      ?auto_2502717 - OBJ
      ?auto_2502718 - OBJ
      ?auto_2502713 - LOCATION
    )
    :vars
    (
      ?auto_2502723 - LOCATION
      ?auto_2502721 - CITY
      ?auto_2502722 - LOCATION
      ?auto_2502719 - LOCATION
      ?auto_2502720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2502723 ?auto_2502721 ) ( IN-CITY ?auto_2502713 ?auto_2502721 ) ( not ( = ?auto_2502713 ?auto_2502723 ) ) ( OBJ-AT ?auto_2502718 ?auto_2502723 ) ( IN-CITY ?auto_2502722 ?auto_2502721 ) ( not ( = ?auto_2502713 ?auto_2502722 ) ) ( OBJ-AT ?auto_2502717 ?auto_2502722 ) ( IN-CITY ?auto_2502719 ?auto_2502721 ) ( not ( = ?auto_2502713 ?auto_2502719 ) ) ( OBJ-AT ?auto_2502714 ?auto_2502719 ) ( OBJ-AT ?auto_2502716 ?auto_2502723 ) ( OBJ-AT ?auto_2502715 ?auto_2502723 ) ( TRUCK-AT ?auto_2502720 ?auto_2502713 ) ( not ( = ?auto_2502715 ?auto_2502716 ) ) ( not ( = ?auto_2502715 ?auto_2502714 ) ) ( not ( = ?auto_2502716 ?auto_2502714 ) ) ( not ( = ?auto_2502719 ?auto_2502723 ) ) ( not ( = ?auto_2502715 ?auto_2502717 ) ) ( not ( = ?auto_2502716 ?auto_2502717 ) ) ( not ( = ?auto_2502714 ?auto_2502717 ) ) ( not ( = ?auto_2502722 ?auto_2502719 ) ) ( not ( = ?auto_2502722 ?auto_2502723 ) ) ( not ( = ?auto_2502715 ?auto_2502718 ) ) ( not ( = ?auto_2502716 ?auto_2502718 ) ) ( not ( = ?auto_2502714 ?auto_2502718 ) ) ( not ( = ?auto_2502717 ?auto_2502718 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2502715 ?auto_2502716 ?auto_2502714 ?auto_2502718 ?auto_2502717 ?auto_2502713 )
      ( DELIVER-5PKG-VERIFY ?auto_2502714 ?auto_2502715 ?auto_2502716 ?auto_2502717 ?auto_2502718 ?auto_2502713 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2502761 - OBJ
      ?auto_2502762 - OBJ
      ?auto_2502763 - OBJ
      ?auto_2502764 - OBJ
      ?auto_2502765 - OBJ
      ?auto_2502760 - LOCATION
    )
    :vars
    (
      ?auto_2502770 - LOCATION
      ?auto_2502768 - CITY
      ?auto_2502769 - LOCATION
      ?auto_2502766 - LOCATION
      ?auto_2502767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2502770 ?auto_2502768 ) ( IN-CITY ?auto_2502760 ?auto_2502768 ) ( not ( = ?auto_2502760 ?auto_2502770 ) ) ( OBJ-AT ?auto_2502764 ?auto_2502770 ) ( IN-CITY ?auto_2502769 ?auto_2502768 ) ( not ( = ?auto_2502760 ?auto_2502769 ) ) ( OBJ-AT ?auto_2502765 ?auto_2502769 ) ( IN-CITY ?auto_2502766 ?auto_2502768 ) ( not ( = ?auto_2502760 ?auto_2502766 ) ) ( OBJ-AT ?auto_2502761 ?auto_2502766 ) ( OBJ-AT ?auto_2502763 ?auto_2502770 ) ( OBJ-AT ?auto_2502762 ?auto_2502770 ) ( TRUCK-AT ?auto_2502767 ?auto_2502760 ) ( not ( = ?auto_2502762 ?auto_2502763 ) ) ( not ( = ?auto_2502762 ?auto_2502761 ) ) ( not ( = ?auto_2502763 ?auto_2502761 ) ) ( not ( = ?auto_2502766 ?auto_2502770 ) ) ( not ( = ?auto_2502762 ?auto_2502765 ) ) ( not ( = ?auto_2502763 ?auto_2502765 ) ) ( not ( = ?auto_2502761 ?auto_2502765 ) ) ( not ( = ?auto_2502769 ?auto_2502766 ) ) ( not ( = ?auto_2502769 ?auto_2502770 ) ) ( not ( = ?auto_2502762 ?auto_2502764 ) ) ( not ( = ?auto_2502763 ?auto_2502764 ) ) ( not ( = ?auto_2502761 ?auto_2502764 ) ) ( not ( = ?auto_2502765 ?auto_2502764 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2502762 ?auto_2502763 ?auto_2502761 ?auto_2502764 ?auto_2502765 ?auto_2502760 )
      ( DELIVER-5PKG-VERIFY ?auto_2502761 ?auto_2502762 ?auto_2502763 ?auto_2502764 ?auto_2502765 ?auto_2502760 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2502909 - OBJ
      ?auto_2502910 - OBJ
      ?auto_2502911 - OBJ
      ?auto_2502912 - OBJ
      ?auto_2502913 - OBJ
      ?auto_2502908 - LOCATION
    )
    :vars
    (
      ?auto_2502918 - LOCATION
      ?auto_2502916 - CITY
      ?auto_2502917 - LOCATION
      ?auto_2502914 - LOCATION
      ?auto_2502915 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2502918 ?auto_2502916 ) ( IN-CITY ?auto_2502908 ?auto_2502916 ) ( not ( = ?auto_2502908 ?auto_2502918 ) ) ( OBJ-AT ?auto_2502913 ?auto_2502918 ) ( IN-CITY ?auto_2502917 ?auto_2502916 ) ( not ( = ?auto_2502908 ?auto_2502917 ) ) ( OBJ-AT ?auto_2502911 ?auto_2502917 ) ( IN-CITY ?auto_2502914 ?auto_2502916 ) ( not ( = ?auto_2502908 ?auto_2502914 ) ) ( OBJ-AT ?auto_2502909 ?auto_2502914 ) ( OBJ-AT ?auto_2502912 ?auto_2502918 ) ( OBJ-AT ?auto_2502910 ?auto_2502918 ) ( TRUCK-AT ?auto_2502915 ?auto_2502908 ) ( not ( = ?auto_2502910 ?auto_2502912 ) ) ( not ( = ?auto_2502910 ?auto_2502909 ) ) ( not ( = ?auto_2502912 ?auto_2502909 ) ) ( not ( = ?auto_2502914 ?auto_2502918 ) ) ( not ( = ?auto_2502910 ?auto_2502911 ) ) ( not ( = ?auto_2502912 ?auto_2502911 ) ) ( not ( = ?auto_2502909 ?auto_2502911 ) ) ( not ( = ?auto_2502917 ?auto_2502914 ) ) ( not ( = ?auto_2502917 ?auto_2502918 ) ) ( not ( = ?auto_2502910 ?auto_2502913 ) ) ( not ( = ?auto_2502912 ?auto_2502913 ) ) ( not ( = ?auto_2502909 ?auto_2502913 ) ) ( not ( = ?auto_2502911 ?auto_2502913 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2502910 ?auto_2502912 ?auto_2502909 ?auto_2502913 ?auto_2502911 ?auto_2502908 )
      ( DELIVER-5PKG-VERIFY ?auto_2502909 ?auto_2502910 ?auto_2502911 ?auto_2502912 ?auto_2502913 ?auto_2502908 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2504804 - OBJ
      ?auto_2504805 - OBJ
      ?auto_2504806 - OBJ
      ?auto_2504807 - OBJ
      ?auto_2504808 - OBJ
      ?auto_2504803 - LOCATION
    )
    :vars
    (
      ?auto_2504813 - LOCATION
      ?auto_2504811 - CITY
      ?auto_2504812 - LOCATION
      ?auto_2504809 - LOCATION
      ?auto_2504810 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2504813 ?auto_2504811 ) ( IN-CITY ?auto_2504803 ?auto_2504811 ) ( not ( = ?auto_2504803 ?auto_2504813 ) ) ( OBJ-AT ?auto_2504808 ?auto_2504813 ) ( IN-CITY ?auto_2504812 ?auto_2504811 ) ( not ( = ?auto_2504803 ?auto_2504812 ) ) ( OBJ-AT ?auto_2504805 ?auto_2504812 ) ( IN-CITY ?auto_2504809 ?auto_2504811 ) ( not ( = ?auto_2504803 ?auto_2504809 ) ) ( OBJ-AT ?auto_2504804 ?auto_2504809 ) ( OBJ-AT ?auto_2504807 ?auto_2504813 ) ( OBJ-AT ?auto_2504806 ?auto_2504813 ) ( TRUCK-AT ?auto_2504810 ?auto_2504803 ) ( not ( = ?auto_2504806 ?auto_2504807 ) ) ( not ( = ?auto_2504806 ?auto_2504804 ) ) ( not ( = ?auto_2504807 ?auto_2504804 ) ) ( not ( = ?auto_2504809 ?auto_2504813 ) ) ( not ( = ?auto_2504806 ?auto_2504805 ) ) ( not ( = ?auto_2504807 ?auto_2504805 ) ) ( not ( = ?auto_2504804 ?auto_2504805 ) ) ( not ( = ?auto_2504812 ?auto_2504809 ) ) ( not ( = ?auto_2504812 ?auto_2504813 ) ) ( not ( = ?auto_2504806 ?auto_2504808 ) ) ( not ( = ?auto_2504807 ?auto_2504808 ) ) ( not ( = ?auto_2504804 ?auto_2504808 ) ) ( not ( = ?auto_2504805 ?auto_2504808 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2504806 ?auto_2504807 ?auto_2504804 ?auto_2504808 ?auto_2504805 ?auto_2504803 )
      ( DELIVER-5PKG-VERIFY ?auto_2504804 ?auto_2504805 ?auto_2504806 ?auto_2504807 ?auto_2504808 ?auto_2504803 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2749096 - OBJ
      ?auto_2749097 - OBJ
      ?auto_2749098 - OBJ
      ?auto_2749099 - OBJ
      ?auto_2749100 - OBJ
      ?auto_2749101 - OBJ
      ?auto_2749095 - LOCATION
    )
    :vars
    (
      ?auto_2749104 - LOCATION
      ?auto_2749102 - CITY
      ?auto_2749106 - LOCATION
      ?auto_2749105 - LOCATION
      ?auto_2749103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2749104 ?auto_2749102 ) ( IN-CITY ?auto_2749095 ?auto_2749102 ) ( not ( = ?auto_2749095 ?auto_2749104 ) ) ( OBJ-AT ?auto_2749101 ?auto_2749104 ) ( OBJ-AT ?auto_2749100 ?auto_2749104 ) ( IN-CITY ?auto_2749106 ?auto_2749102 ) ( not ( = ?auto_2749095 ?auto_2749106 ) ) ( OBJ-AT ?auto_2749099 ?auto_2749106 ) ( IN-CITY ?auto_2749105 ?auto_2749102 ) ( not ( = ?auto_2749095 ?auto_2749105 ) ) ( OBJ-AT ?auto_2749098 ?auto_2749105 ) ( OBJ-AT ?auto_2749097 ?auto_2749104 ) ( OBJ-AT ?auto_2749096 ?auto_2749104 ) ( TRUCK-AT ?auto_2749103 ?auto_2749095 ) ( not ( = ?auto_2749096 ?auto_2749097 ) ) ( not ( = ?auto_2749096 ?auto_2749098 ) ) ( not ( = ?auto_2749097 ?auto_2749098 ) ) ( not ( = ?auto_2749105 ?auto_2749104 ) ) ( not ( = ?auto_2749096 ?auto_2749099 ) ) ( not ( = ?auto_2749097 ?auto_2749099 ) ) ( not ( = ?auto_2749098 ?auto_2749099 ) ) ( not ( = ?auto_2749106 ?auto_2749105 ) ) ( not ( = ?auto_2749106 ?auto_2749104 ) ) ( not ( = ?auto_2749096 ?auto_2749100 ) ) ( not ( = ?auto_2749097 ?auto_2749100 ) ) ( not ( = ?auto_2749098 ?auto_2749100 ) ) ( not ( = ?auto_2749099 ?auto_2749100 ) ) ( not ( = ?auto_2749096 ?auto_2749101 ) ) ( not ( = ?auto_2749097 ?auto_2749101 ) ) ( not ( = ?auto_2749098 ?auto_2749101 ) ) ( not ( = ?auto_2749099 ?auto_2749101 ) ) ( not ( = ?auto_2749100 ?auto_2749101 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2749096 ?auto_2749097 ?auto_2749098 ?auto_2749100 ?auto_2749099 ?auto_2749095 )
      ( DELIVER-1PKG ?auto_2749101 ?auto_2749095 )
      ( DELIVER-6PKG-VERIFY ?auto_2749096 ?auto_2749097 ?auto_2749098 ?auto_2749099 ?auto_2749100 ?auto_2749101 ?auto_2749095 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2749219 - OBJ
      ?auto_2749220 - OBJ
      ?auto_2749221 - OBJ
      ?auto_2749222 - OBJ
      ?auto_2749223 - OBJ
      ?auto_2749224 - OBJ
      ?auto_2749218 - LOCATION
    )
    :vars
    (
      ?auto_2749228 - LOCATION
      ?auto_2749227 - CITY
      ?auto_2749229 - LOCATION
      ?auto_2749226 - LOCATION
      ?auto_2749225 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2749228 ?auto_2749227 ) ( IN-CITY ?auto_2749218 ?auto_2749227 ) ( not ( = ?auto_2749218 ?auto_2749228 ) ) ( OBJ-AT ?auto_2749224 ?auto_2749228 ) ( OBJ-AT ?auto_2749222 ?auto_2749228 ) ( IN-CITY ?auto_2749229 ?auto_2749227 ) ( not ( = ?auto_2749218 ?auto_2749229 ) ) ( OBJ-AT ?auto_2749223 ?auto_2749229 ) ( IN-CITY ?auto_2749226 ?auto_2749227 ) ( not ( = ?auto_2749218 ?auto_2749226 ) ) ( OBJ-AT ?auto_2749221 ?auto_2749226 ) ( OBJ-AT ?auto_2749220 ?auto_2749228 ) ( OBJ-AT ?auto_2749219 ?auto_2749228 ) ( TRUCK-AT ?auto_2749225 ?auto_2749218 ) ( not ( = ?auto_2749219 ?auto_2749220 ) ) ( not ( = ?auto_2749219 ?auto_2749221 ) ) ( not ( = ?auto_2749220 ?auto_2749221 ) ) ( not ( = ?auto_2749226 ?auto_2749228 ) ) ( not ( = ?auto_2749219 ?auto_2749223 ) ) ( not ( = ?auto_2749220 ?auto_2749223 ) ) ( not ( = ?auto_2749221 ?auto_2749223 ) ) ( not ( = ?auto_2749229 ?auto_2749226 ) ) ( not ( = ?auto_2749229 ?auto_2749228 ) ) ( not ( = ?auto_2749219 ?auto_2749222 ) ) ( not ( = ?auto_2749220 ?auto_2749222 ) ) ( not ( = ?auto_2749221 ?auto_2749222 ) ) ( not ( = ?auto_2749223 ?auto_2749222 ) ) ( not ( = ?auto_2749219 ?auto_2749224 ) ) ( not ( = ?auto_2749220 ?auto_2749224 ) ) ( not ( = ?auto_2749221 ?auto_2749224 ) ) ( not ( = ?auto_2749223 ?auto_2749224 ) ) ( not ( = ?auto_2749222 ?auto_2749224 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2749219 ?auto_2749220 ?auto_2749221 ?auto_2749223 ?auto_2749222 ?auto_2749224 ?auto_2749218 )
      ( DELIVER-6PKG-VERIFY ?auto_2749219 ?auto_2749220 ?auto_2749221 ?auto_2749222 ?auto_2749223 ?auto_2749224 ?auto_2749218 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2749283 - OBJ
      ?auto_2749284 - OBJ
      ?auto_2749285 - OBJ
      ?auto_2749286 - OBJ
      ?auto_2749287 - OBJ
      ?auto_2749288 - OBJ
      ?auto_2749282 - LOCATION
    )
    :vars
    (
      ?auto_2749290 - LOCATION
      ?auto_2749291 - CITY
      ?auto_2749293 - LOCATION
      ?auto_2749289 - LOCATION
      ?auto_2749292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2749290 ?auto_2749291 ) ( IN-CITY ?auto_2749282 ?auto_2749291 ) ( not ( = ?auto_2749282 ?auto_2749290 ) ) ( OBJ-AT ?auto_2749287 ?auto_2749290 ) ( OBJ-AT ?auto_2749286 ?auto_2749290 ) ( IN-CITY ?auto_2749293 ?auto_2749291 ) ( not ( = ?auto_2749282 ?auto_2749293 ) ) ( OBJ-AT ?auto_2749288 ?auto_2749293 ) ( IN-CITY ?auto_2749289 ?auto_2749291 ) ( not ( = ?auto_2749282 ?auto_2749289 ) ) ( OBJ-AT ?auto_2749285 ?auto_2749289 ) ( OBJ-AT ?auto_2749284 ?auto_2749290 ) ( OBJ-AT ?auto_2749283 ?auto_2749290 ) ( TRUCK-AT ?auto_2749292 ?auto_2749282 ) ( not ( = ?auto_2749283 ?auto_2749284 ) ) ( not ( = ?auto_2749283 ?auto_2749285 ) ) ( not ( = ?auto_2749284 ?auto_2749285 ) ) ( not ( = ?auto_2749289 ?auto_2749290 ) ) ( not ( = ?auto_2749283 ?auto_2749288 ) ) ( not ( = ?auto_2749284 ?auto_2749288 ) ) ( not ( = ?auto_2749285 ?auto_2749288 ) ) ( not ( = ?auto_2749293 ?auto_2749289 ) ) ( not ( = ?auto_2749293 ?auto_2749290 ) ) ( not ( = ?auto_2749283 ?auto_2749286 ) ) ( not ( = ?auto_2749284 ?auto_2749286 ) ) ( not ( = ?auto_2749285 ?auto_2749286 ) ) ( not ( = ?auto_2749288 ?auto_2749286 ) ) ( not ( = ?auto_2749283 ?auto_2749287 ) ) ( not ( = ?auto_2749284 ?auto_2749287 ) ) ( not ( = ?auto_2749285 ?auto_2749287 ) ) ( not ( = ?auto_2749288 ?auto_2749287 ) ) ( not ( = ?auto_2749286 ?auto_2749287 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2749283 ?auto_2749284 ?auto_2749285 ?auto_2749286 ?auto_2749288 ?auto_2749287 ?auto_2749282 )
      ( DELIVER-6PKG-VERIFY ?auto_2749283 ?auto_2749284 ?auto_2749285 ?auto_2749286 ?auto_2749287 ?auto_2749288 ?auto_2749282 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2751316 - OBJ
      ?auto_2751317 - OBJ
      ?auto_2751318 - OBJ
      ?auto_2751319 - OBJ
      ?auto_2751320 - OBJ
      ?auto_2751321 - OBJ
      ?auto_2751315 - LOCATION
    )
    :vars
    (
      ?auto_2751323 - LOCATION
      ?auto_2751324 - CITY
      ?auto_2751326 - LOCATION
      ?auto_2751322 - LOCATION
      ?auto_2751325 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2751323 ?auto_2751324 ) ( IN-CITY ?auto_2751315 ?auto_2751324 ) ( not ( = ?auto_2751315 ?auto_2751323 ) ) ( OBJ-AT ?auto_2751321 ?auto_2751323 ) ( OBJ-AT ?auto_2751318 ?auto_2751323 ) ( IN-CITY ?auto_2751326 ?auto_2751324 ) ( not ( = ?auto_2751315 ?auto_2751326 ) ) ( OBJ-AT ?auto_2751320 ?auto_2751326 ) ( IN-CITY ?auto_2751322 ?auto_2751324 ) ( not ( = ?auto_2751315 ?auto_2751322 ) ) ( OBJ-AT ?auto_2751319 ?auto_2751322 ) ( OBJ-AT ?auto_2751317 ?auto_2751323 ) ( OBJ-AT ?auto_2751316 ?auto_2751323 ) ( TRUCK-AT ?auto_2751325 ?auto_2751315 ) ( not ( = ?auto_2751316 ?auto_2751317 ) ) ( not ( = ?auto_2751316 ?auto_2751319 ) ) ( not ( = ?auto_2751317 ?auto_2751319 ) ) ( not ( = ?auto_2751322 ?auto_2751323 ) ) ( not ( = ?auto_2751316 ?auto_2751320 ) ) ( not ( = ?auto_2751317 ?auto_2751320 ) ) ( not ( = ?auto_2751319 ?auto_2751320 ) ) ( not ( = ?auto_2751326 ?auto_2751322 ) ) ( not ( = ?auto_2751326 ?auto_2751323 ) ) ( not ( = ?auto_2751316 ?auto_2751318 ) ) ( not ( = ?auto_2751317 ?auto_2751318 ) ) ( not ( = ?auto_2751319 ?auto_2751318 ) ) ( not ( = ?auto_2751320 ?auto_2751318 ) ) ( not ( = ?auto_2751316 ?auto_2751321 ) ) ( not ( = ?auto_2751317 ?auto_2751321 ) ) ( not ( = ?auto_2751319 ?auto_2751321 ) ) ( not ( = ?auto_2751320 ?auto_2751321 ) ) ( not ( = ?auto_2751318 ?auto_2751321 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2751316 ?auto_2751317 ?auto_2751319 ?auto_2751318 ?auto_2751320 ?auto_2751321 ?auto_2751315 )
      ( DELIVER-6PKG-VERIFY ?auto_2751316 ?auto_2751317 ?auto_2751318 ?auto_2751319 ?auto_2751320 ?auto_2751321 ?auto_2751315 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2751380 - OBJ
      ?auto_2751381 - OBJ
      ?auto_2751382 - OBJ
      ?auto_2751383 - OBJ
      ?auto_2751384 - OBJ
      ?auto_2751385 - OBJ
      ?auto_2751379 - LOCATION
    )
    :vars
    (
      ?auto_2751387 - LOCATION
      ?auto_2751388 - CITY
      ?auto_2751390 - LOCATION
      ?auto_2751386 - LOCATION
      ?auto_2751389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2751387 ?auto_2751388 ) ( IN-CITY ?auto_2751379 ?auto_2751388 ) ( not ( = ?auto_2751379 ?auto_2751387 ) ) ( OBJ-AT ?auto_2751384 ?auto_2751387 ) ( OBJ-AT ?auto_2751382 ?auto_2751387 ) ( IN-CITY ?auto_2751390 ?auto_2751388 ) ( not ( = ?auto_2751379 ?auto_2751390 ) ) ( OBJ-AT ?auto_2751385 ?auto_2751390 ) ( IN-CITY ?auto_2751386 ?auto_2751388 ) ( not ( = ?auto_2751379 ?auto_2751386 ) ) ( OBJ-AT ?auto_2751383 ?auto_2751386 ) ( OBJ-AT ?auto_2751381 ?auto_2751387 ) ( OBJ-AT ?auto_2751380 ?auto_2751387 ) ( TRUCK-AT ?auto_2751389 ?auto_2751379 ) ( not ( = ?auto_2751380 ?auto_2751381 ) ) ( not ( = ?auto_2751380 ?auto_2751383 ) ) ( not ( = ?auto_2751381 ?auto_2751383 ) ) ( not ( = ?auto_2751386 ?auto_2751387 ) ) ( not ( = ?auto_2751380 ?auto_2751385 ) ) ( not ( = ?auto_2751381 ?auto_2751385 ) ) ( not ( = ?auto_2751383 ?auto_2751385 ) ) ( not ( = ?auto_2751390 ?auto_2751386 ) ) ( not ( = ?auto_2751390 ?auto_2751387 ) ) ( not ( = ?auto_2751380 ?auto_2751382 ) ) ( not ( = ?auto_2751381 ?auto_2751382 ) ) ( not ( = ?auto_2751383 ?auto_2751382 ) ) ( not ( = ?auto_2751385 ?auto_2751382 ) ) ( not ( = ?auto_2751380 ?auto_2751384 ) ) ( not ( = ?auto_2751381 ?auto_2751384 ) ) ( not ( = ?auto_2751383 ?auto_2751384 ) ) ( not ( = ?auto_2751385 ?auto_2751384 ) ) ( not ( = ?auto_2751382 ?auto_2751384 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2751380 ?auto_2751381 ?auto_2751383 ?auto_2751382 ?auto_2751385 ?auto_2751384 ?auto_2751379 )
      ( DELIVER-6PKG-VERIFY ?auto_2751380 ?auto_2751381 ?auto_2751382 ?auto_2751383 ?auto_2751384 ?auto_2751385 ?auto_2751379 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2751902 - OBJ
      ?auto_2751903 - OBJ
      ?auto_2751904 - OBJ
      ?auto_2751905 - OBJ
      ?auto_2751906 - OBJ
      ?auto_2751907 - OBJ
      ?auto_2751901 - LOCATION
    )
    :vars
    (
      ?auto_2751909 - LOCATION
      ?auto_2751910 - CITY
      ?auto_2751912 - LOCATION
      ?auto_2751908 - LOCATION
      ?auto_2751911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2751909 ?auto_2751910 ) ( IN-CITY ?auto_2751901 ?auto_2751910 ) ( not ( = ?auto_2751901 ?auto_2751909 ) ) ( OBJ-AT ?auto_2751905 ?auto_2751909 ) ( OBJ-AT ?auto_2751904 ?auto_2751909 ) ( IN-CITY ?auto_2751912 ?auto_2751910 ) ( not ( = ?auto_2751901 ?auto_2751912 ) ) ( OBJ-AT ?auto_2751907 ?auto_2751912 ) ( IN-CITY ?auto_2751908 ?auto_2751910 ) ( not ( = ?auto_2751901 ?auto_2751908 ) ) ( OBJ-AT ?auto_2751906 ?auto_2751908 ) ( OBJ-AT ?auto_2751903 ?auto_2751909 ) ( OBJ-AT ?auto_2751902 ?auto_2751909 ) ( TRUCK-AT ?auto_2751911 ?auto_2751901 ) ( not ( = ?auto_2751902 ?auto_2751903 ) ) ( not ( = ?auto_2751902 ?auto_2751906 ) ) ( not ( = ?auto_2751903 ?auto_2751906 ) ) ( not ( = ?auto_2751908 ?auto_2751909 ) ) ( not ( = ?auto_2751902 ?auto_2751907 ) ) ( not ( = ?auto_2751903 ?auto_2751907 ) ) ( not ( = ?auto_2751906 ?auto_2751907 ) ) ( not ( = ?auto_2751912 ?auto_2751908 ) ) ( not ( = ?auto_2751912 ?auto_2751909 ) ) ( not ( = ?auto_2751902 ?auto_2751904 ) ) ( not ( = ?auto_2751903 ?auto_2751904 ) ) ( not ( = ?auto_2751906 ?auto_2751904 ) ) ( not ( = ?auto_2751907 ?auto_2751904 ) ) ( not ( = ?auto_2751902 ?auto_2751905 ) ) ( not ( = ?auto_2751903 ?auto_2751905 ) ) ( not ( = ?auto_2751906 ?auto_2751905 ) ) ( not ( = ?auto_2751907 ?auto_2751905 ) ) ( not ( = ?auto_2751904 ?auto_2751905 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2751902 ?auto_2751903 ?auto_2751906 ?auto_2751904 ?auto_2751907 ?auto_2751905 ?auto_2751901 )
      ( DELIVER-6PKG-VERIFY ?auto_2751902 ?auto_2751903 ?auto_2751904 ?auto_2751905 ?auto_2751906 ?auto_2751907 ?auto_2751901 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2756890 - OBJ
      ?auto_2756891 - OBJ
      ?auto_2756892 - OBJ
      ?auto_2756893 - OBJ
      ?auto_2756894 - OBJ
      ?auto_2756895 - OBJ
      ?auto_2756889 - LOCATION
    )
    :vars
    (
      ?auto_2756897 - LOCATION
      ?auto_2756898 - CITY
      ?auto_2756900 - LOCATION
      ?auto_2756896 - LOCATION
      ?auto_2756899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2756897 ?auto_2756898 ) ( IN-CITY ?auto_2756889 ?auto_2756898 ) ( not ( = ?auto_2756889 ?auto_2756897 ) ) ( OBJ-AT ?auto_2756895 ?auto_2756897 ) ( OBJ-AT ?auto_2756894 ?auto_2756897 ) ( IN-CITY ?auto_2756900 ?auto_2756898 ) ( not ( = ?auto_2756889 ?auto_2756900 ) ) ( OBJ-AT ?auto_2756893 ?auto_2756900 ) ( IN-CITY ?auto_2756896 ?auto_2756898 ) ( not ( = ?auto_2756889 ?auto_2756896 ) ) ( OBJ-AT ?auto_2756891 ?auto_2756896 ) ( OBJ-AT ?auto_2756892 ?auto_2756897 ) ( OBJ-AT ?auto_2756890 ?auto_2756897 ) ( TRUCK-AT ?auto_2756899 ?auto_2756889 ) ( not ( = ?auto_2756890 ?auto_2756892 ) ) ( not ( = ?auto_2756890 ?auto_2756891 ) ) ( not ( = ?auto_2756892 ?auto_2756891 ) ) ( not ( = ?auto_2756896 ?auto_2756897 ) ) ( not ( = ?auto_2756890 ?auto_2756893 ) ) ( not ( = ?auto_2756892 ?auto_2756893 ) ) ( not ( = ?auto_2756891 ?auto_2756893 ) ) ( not ( = ?auto_2756900 ?auto_2756896 ) ) ( not ( = ?auto_2756900 ?auto_2756897 ) ) ( not ( = ?auto_2756890 ?auto_2756894 ) ) ( not ( = ?auto_2756892 ?auto_2756894 ) ) ( not ( = ?auto_2756891 ?auto_2756894 ) ) ( not ( = ?auto_2756893 ?auto_2756894 ) ) ( not ( = ?auto_2756890 ?auto_2756895 ) ) ( not ( = ?auto_2756892 ?auto_2756895 ) ) ( not ( = ?auto_2756891 ?auto_2756895 ) ) ( not ( = ?auto_2756893 ?auto_2756895 ) ) ( not ( = ?auto_2756894 ?auto_2756895 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2756890 ?auto_2756892 ?auto_2756891 ?auto_2756894 ?auto_2756893 ?auto_2756895 ?auto_2756889 )
      ( DELIVER-6PKG-VERIFY ?auto_2756890 ?auto_2756891 ?auto_2756892 ?auto_2756893 ?auto_2756894 ?auto_2756895 ?auto_2756889 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2757013 - OBJ
      ?auto_2757014 - OBJ
      ?auto_2757015 - OBJ
      ?auto_2757016 - OBJ
      ?auto_2757017 - OBJ
      ?auto_2757018 - OBJ
      ?auto_2757012 - LOCATION
    )
    :vars
    (
      ?auto_2757020 - LOCATION
      ?auto_2757021 - CITY
      ?auto_2757023 - LOCATION
      ?auto_2757019 - LOCATION
      ?auto_2757022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2757020 ?auto_2757021 ) ( IN-CITY ?auto_2757012 ?auto_2757021 ) ( not ( = ?auto_2757012 ?auto_2757020 ) ) ( OBJ-AT ?auto_2757018 ?auto_2757020 ) ( OBJ-AT ?auto_2757016 ?auto_2757020 ) ( IN-CITY ?auto_2757023 ?auto_2757021 ) ( not ( = ?auto_2757012 ?auto_2757023 ) ) ( OBJ-AT ?auto_2757017 ?auto_2757023 ) ( IN-CITY ?auto_2757019 ?auto_2757021 ) ( not ( = ?auto_2757012 ?auto_2757019 ) ) ( OBJ-AT ?auto_2757014 ?auto_2757019 ) ( OBJ-AT ?auto_2757015 ?auto_2757020 ) ( OBJ-AT ?auto_2757013 ?auto_2757020 ) ( TRUCK-AT ?auto_2757022 ?auto_2757012 ) ( not ( = ?auto_2757013 ?auto_2757015 ) ) ( not ( = ?auto_2757013 ?auto_2757014 ) ) ( not ( = ?auto_2757015 ?auto_2757014 ) ) ( not ( = ?auto_2757019 ?auto_2757020 ) ) ( not ( = ?auto_2757013 ?auto_2757017 ) ) ( not ( = ?auto_2757015 ?auto_2757017 ) ) ( not ( = ?auto_2757014 ?auto_2757017 ) ) ( not ( = ?auto_2757023 ?auto_2757019 ) ) ( not ( = ?auto_2757023 ?auto_2757020 ) ) ( not ( = ?auto_2757013 ?auto_2757016 ) ) ( not ( = ?auto_2757015 ?auto_2757016 ) ) ( not ( = ?auto_2757014 ?auto_2757016 ) ) ( not ( = ?auto_2757017 ?auto_2757016 ) ) ( not ( = ?auto_2757013 ?auto_2757018 ) ) ( not ( = ?auto_2757015 ?auto_2757018 ) ) ( not ( = ?auto_2757014 ?auto_2757018 ) ) ( not ( = ?auto_2757017 ?auto_2757018 ) ) ( not ( = ?auto_2757016 ?auto_2757018 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2757013 ?auto_2757015 ?auto_2757014 ?auto_2757016 ?auto_2757017 ?auto_2757018 ?auto_2757012 )
      ( DELIVER-6PKG-VERIFY ?auto_2757013 ?auto_2757014 ?auto_2757015 ?auto_2757016 ?auto_2757017 ?auto_2757018 ?auto_2757012 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2757077 - OBJ
      ?auto_2757078 - OBJ
      ?auto_2757079 - OBJ
      ?auto_2757080 - OBJ
      ?auto_2757081 - OBJ
      ?auto_2757082 - OBJ
      ?auto_2757076 - LOCATION
    )
    :vars
    (
      ?auto_2757084 - LOCATION
      ?auto_2757085 - CITY
      ?auto_2757087 - LOCATION
      ?auto_2757083 - LOCATION
      ?auto_2757086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2757084 ?auto_2757085 ) ( IN-CITY ?auto_2757076 ?auto_2757085 ) ( not ( = ?auto_2757076 ?auto_2757084 ) ) ( OBJ-AT ?auto_2757081 ?auto_2757084 ) ( OBJ-AT ?auto_2757080 ?auto_2757084 ) ( IN-CITY ?auto_2757087 ?auto_2757085 ) ( not ( = ?auto_2757076 ?auto_2757087 ) ) ( OBJ-AT ?auto_2757082 ?auto_2757087 ) ( IN-CITY ?auto_2757083 ?auto_2757085 ) ( not ( = ?auto_2757076 ?auto_2757083 ) ) ( OBJ-AT ?auto_2757078 ?auto_2757083 ) ( OBJ-AT ?auto_2757079 ?auto_2757084 ) ( OBJ-AT ?auto_2757077 ?auto_2757084 ) ( TRUCK-AT ?auto_2757086 ?auto_2757076 ) ( not ( = ?auto_2757077 ?auto_2757079 ) ) ( not ( = ?auto_2757077 ?auto_2757078 ) ) ( not ( = ?auto_2757079 ?auto_2757078 ) ) ( not ( = ?auto_2757083 ?auto_2757084 ) ) ( not ( = ?auto_2757077 ?auto_2757082 ) ) ( not ( = ?auto_2757079 ?auto_2757082 ) ) ( not ( = ?auto_2757078 ?auto_2757082 ) ) ( not ( = ?auto_2757087 ?auto_2757083 ) ) ( not ( = ?auto_2757087 ?auto_2757084 ) ) ( not ( = ?auto_2757077 ?auto_2757080 ) ) ( not ( = ?auto_2757079 ?auto_2757080 ) ) ( not ( = ?auto_2757078 ?auto_2757080 ) ) ( not ( = ?auto_2757082 ?auto_2757080 ) ) ( not ( = ?auto_2757077 ?auto_2757081 ) ) ( not ( = ?auto_2757079 ?auto_2757081 ) ) ( not ( = ?auto_2757078 ?auto_2757081 ) ) ( not ( = ?auto_2757082 ?auto_2757081 ) ) ( not ( = ?auto_2757080 ?auto_2757081 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2757077 ?auto_2757079 ?auto_2757078 ?auto_2757080 ?auto_2757082 ?auto_2757081 ?auto_2757076 )
      ( DELIVER-6PKG-VERIFY ?auto_2757077 ?auto_2757078 ?auto_2757079 ?auto_2757080 ?auto_2757081 ?auto_2757082 ?auto_2757076 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2759064 - OBJ
      ?auto_2759065 - OBJ
      ?auto_2759066 - OBJ
      ?auto_2759067 - OBJ
      ?auto_2759068 - OBJ
      ?auto_2759069 - OBJ
      ?auto_2759063 - LOCATION
    )
    :vars
    (
      ?auto_2759071 - LOCATION
      ?auto_2759072 - CITY
      ?auto_2759074 - LOCATION
      ?auto_2759070 - LOCATION
      ?auto_2759073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2759071 ?auto_2759072 ) ( IN-CITY ?auto_2759063 ?auto_2759072 ) ( not ( = ?auto_2759063 ?auto_2759071 ) ) ( OBJ-AT ?auto_2759069 ?auto_2759071 ) ( OBJ-AT ?auto_2759068 ?auto_2759071 ) ( IN-CITY ?auto_2759074 ?auto_2759072 ) ( not ( = ?auto_2759063 ?auto_2759074 ) ) ( OBJ-AT ?auto_2759066 ?auto_2759074 ) ( IN-CITY ?auto_2759070 ?auto_2759072 ) ( not ( = ?auto_2759063 ?auto_2759070 ) ) ( OBJ-AT ?auto_2759065 ?auto_2759070 ) ( OBJ-AT ?auto_2759067 ?auto_2759071 ) ( OBJ-AT ?auto_2759064 ?auto_2759071 ) ( TRUCK-AT ?auto_2759073 ?auto_2759063 ) ( not ( = ?auto_2759064 ?auto_2759067 ) ) ( not ( = ?auto_2759064 ?auto_2759065 ) ) ( not ( = ?auto_2759067 ?auto_2759065 ) ) ( not ( = ?auto_2759070 ?auto_2759071 ) ) ( not ( = ?auto_2759064 ?auto_2759066 ) ) ( not ( = ?auto_2759067 ?auto_2759066 ) ) ( not ( = ?auto_2759065 ?auto_2759066 ) ) ( not ( = ?auto_2759074 ?auto_2759070 ) ) ( not ( = ?auto_2759074 ?auto_2759071 ) ) ( not ( = ?auto_2759064 ?auto_2759068 ) ) ( not ( = ?auto_2759067 ?auto_2759068 ) ) ( not ( = ?auto_2759065 ?auto_2759068 ) ) ( not ( = ?auto_2759066 ?auto_2759068 ) ) ( not ( = ?auto_2759064 ?auto_2759069 ) ) ( not ( = ?auto_2759067 ?auto_2759069 ) ) ( not ( = ?auto_2759065 ?auto_2759069 ) ) ( not ( = ?auto_2759066 ?auto_2759069 ) ) ( not ( = ?auto_2759068 ?auto_2759069 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2759064 ?auto_2759067 ?auto_2759065 ?auto_2759068 ?auto_2759066 ?auto_2759069 ?auto_2759063 )
      ( DELIVER-6PKG-VERIFY ?auto_2759064 ?auto_2759065 ?auto_2759066 ?auto_2759067 ?auto_2759068 ?auto_2759069 ?auto_2759063 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2865575 - OBJ
      ?auto_2865576 - OBJ
      ?auto_2865577 - OBJ
      ?auto_2865578 - OBJ
      ?auto_2865579 - OBJ
      ?auto_2865580 - OBJ
      ?auto_2865574 - LOCATION
    )
    :vars
    (
      ?auto_2865582 - LOCATION
      ?auto_2865583 - CITY
      ?auto_2865585 - LOCATION
      ?auto_2865581 - LOCATION
      ?auto_2865584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2865582 ?auto_2865583 ) ( IN-CITY ?auto_2865574 ?auto_2865583 ) ( not ( = ?auto_2865574 ?auto_2865582 ) ) ( OBJ-AT ?auto_2865580 ?auto_2865582 ) ( OBJ-AT ?auto_2865579 ?auto_2865582 ) ( IN-CITY ?auto_2865585 ?auto_2865583 ) ( not ( = ?auto_2865574 ?auto_2865585 ) ) ( OBJ-AT ?auto_2865578 ?auto_2865585 ) ( IN-CITY ?auto_2865581 ?auto_2865583 ) ( not ( = ?auto_2865574 ?auto_2865581 ) ) ( OBJ-AT ?auto_2865575 ?auto_2865581 ) ( OBJ-AT ?auto_2865577 ?auto_2865582 ) ( OBJ-AT ?auto_2865576 ?auto_2865582 ) ( TRUCK-AT ?auto_2865584 ?auto_2865574 ) ( not ( = ?auto_2865576 ?auto_2865577 ) ) ( not ( = ?auto_2865576 ?auto_2865575 ) ) ( not ( = ?auto_2865577 ?auto_2865575 ) ) ( not ( = ?auto_2865581 ?auto_2865582 ) ) ( not ( = ?auto_2865576 ?auto_2865578 ) ) ( not ( = ?auto_2865577 ?auto_2865578 ) ) ( not ( = ?auto_2865575 ?auto_2865578 ) ) ( not ( = ?auto_2865585 ?auto_2865581 ) ) ( not ( = ?auto_2865585 ?auto_2865582 ) ) ( not ( = ?auto_2865576 ?auto_2865579 ) ) ( not ( = ?auto_2865577 ?auto_2865579 ) ) ( not ( = ?auto_2865575 ?auto_2865579 ) ) ( not ( = ?auto_2865578 ?auto_2865579 ) ) ( not ( = ?auto_2865576 ?auto_2865580 ) ) ( not ( = ?auto_2865577 ?auto_2865580 ) ) ( not ( = ?auto_2865575 ?auto_2865580 ) ) ( not ( = ?auto_2865578 ?auto_2865580 ) ) ( not ( = ?auto_2865579 ?auto_2865580 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2865576 ?auto_2865577 ?auto_2865575 ?auto_2865579 ?auto_2865578 ?auto_2865580 ?auto_2865574 )
      ( DELIVER-6PKG-VERIFY ?auto_2865575 ?auto_2865576 ?auto_2865577 ?auto_2865578 ?auto_2865579 ?auto_2865580 ?auto_2865574 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2865698 - OBJ
      ?auto_2865699 - OBJ
      ?auto_2865700 - OBJ
      ?auto_2865701 - OBJ
      ?auto_2865702 - OBJ
      ?auto_2865703 - OBJ
      ?auto_2865697 - LOCATION
    )
    :vars
    (
      ?auto_2865705 - LOCATION
      ?auto_2865706 - CITY
      ?auto_2865708 - LOCATION
      ?auto_2865704 - LOCATION
      ?auto_2865707 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2865705 ?auto_2865706 ) ( IN-CITY ?auto_2865697 ?auto_2865706 ) ( not ( = ?auto_2865697 ?auto_2865705 ) ) ( OBJ-AT ?auto_2865703 ?auto_2865705 ) ( OBJ-AT ?auto_2865701 ?auto_2865705 ) ( IN-CITY ?auto_2865708 ?auto_2865706 ) ( not ( = ?auto_2865697 ?auto_2865708 ) ) ( OBJ-AT ?auto_2865702 ?auto_2865708 ) ( IN-CITY ?auto_2865704 ?auto_2865706 ) ( not ( = ?auto_2865697 ?auto_2865704 ) ) ( OBJ-AT ?auto_2865698 ?auto_2865704 ) ( OBJ-AT ?auto_2865700 ?auto_2865705 ) ( OBJ-AT ?auto_2865699 ?auto_2865705 ) ( TRUCK-AT ?auto_2865707 ?auto_2865697 ) ( not ( = ?auto_2865699 ?auto_2865700 ) ) ( not ( = ?auto_2865699 ?auto_2865698 ) ) ( not ( = ?auto_2865700 ?auto_2865698 ) ) ( not ( = ?auto_2865704 ?auto_2865705 ) ) ( not ( = ?auto_2865699 ?auto_2865702 ) ) ( not ( = ?auto_2865700 ?auto_2865702 ) ) ( not ( = ?auto_2865698 ?auto_2865702 ) ) ( not ( = ?auto_2865708 ?auto_2865704 ) ) ( not ( = ?auto_2865708 ?auto_2865705 ) ) ( not ( = ?auto_2865699 ?auto_2865701 ) ) ( not ( = ?auto_2865700 ?auto_2865701 ) ) ( not ( = ?auto_2865698 ?auto_2865701 ) ) ( not ( = ?auto_2865702 ?auto_2865701 ) ) ( not ( = ?auto_2865699 ?auto_2865703 ) ) ( not ( = ?auto_2865700 ?auto_2865703 ) ) ( not ( = ?auto_2865698 ?auto_2865703 ) ) ( not ( = ?auto_2865702 ?auto_2865703 ) ) ( not ( = ?auto_2865701 ?auto_2865703 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2865699 ?auto_2865700 ?auto_2865698 ?auto_2865701 ?auto_2865702 ?auto_2865703 ?auto_2865697 )
      ( DELIVER-6PKG-VERIFY ?auto_2865698 ?auto_2865699 ?auto_2865700 ?auto_2865701 ?auto_2865702 ?auto_2865703 ?auto_2865697 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2865762 - OBJ
      ?auto_2865763 - OBJ
      ?auto_2865764 - OBJ
      ?auto_2865765 - OBJ
      ?auto_2865766 - OBJ
      ?auto_2865767 - OBJ
      ?auto_2865761 - LOCATION
    )
    :vars
    (
      ?auto_2865769 - LOCATION
      ?auto_2865770 - CITY
      ?auto_2865772 - LOCATION
      ?auto_2865768 - LOCATION
      ?auto_2865771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2865769 ?auto_2865770 ) ( IN-CITY ?auto_2865761 ?auto_2865770 ) ( not ( = ?auto_2865761 ?auto_2865769 ) ) ( OBJ-AT ?auto_2865766 ?auto_2865769 ) ( OBJ-AT ?auto_2865765 ?auto_2865769 ) ( IN-CITY ?auto_2865772 ?auto_2865770 ) ( not ( = ?auto_2865761 ?auto_2865772 ) ) ( OBJ-AT ?auto_2865767 ?auto_2865772 ) ( IN-CITY ?auto_2865768 ?auto_2865770 ) ( not ( = ?auto_2865761 ?auto_2865768 ) ) ( OBJ-AT ?auto_2865762 ?auto_2865768 ) ( OBJ-AT ?auto_2865764 ?auto_2865769 ) ( OBJ-AT ?auto_2865763 ?auto_2865769 ) ( TRUCK-AT ?auto_2865771 ?auto_2865761 ) ( not ( = ?auto_2865763 ?auto_2865764 ) ) ( not ( = ?auto_2865763 ?auto_2865762 ) ) ( not ( = ?auto_2865764 ?auto_2865762 ) ) ( not ( = ?auto_2865768 ?auto_2865769 ) ) ( not ( = ?auto_2865763 ?auto_2865767 ) ) ( not ( = ?auto_2865764 ?auto_2865767 ) ) ( not ( = ?auto_2865762 ?auto_2865767 ) ) ( not ( = ?auto_2865772 ?auto_2865768 ) ) ( not ( = ?auto_2865772 ?auto_2865769 ) ) ( not ( = ?auto_2865763 ?auto_2865765 ) ) ( not ( = ?auto_2865764 ?auto_2865765 ) ) ( not ( = ?auto_2865762 ?auto_2865765 ) ) ( not ( = ?auto_2865767 ?auto_2865765 ) ) ( not ( = ?auto_2865763 ?auto_2865766 ) ) ( not ( = ?auto_2865764 ?auto_2865766 ) ) ( not ( = ?auto_2865762 ?auto_2865766 ) ) ( not ( = ?auto_2865767 ?auto_2865766 ) ) ( not ( = ?auto_2865765 ?auto_2865766 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2865763 ?auto_2865764 ?auto_2865762 ?auto_2865765 ?auto_2865767 ?auto_2865766 ?auto_2865761 )
      ( DELIVER-6PKG-VERIFY ?auto_2865762 ?auto_2865763 ?auto_2865764 ?auto_2865765 ?auto_2865766 ?auto_2865767 ?auto_2865761 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2867749 - OBJ
      ?auto_2867750 - OBJ
      ?auto_2867751 - OBJ
      ?auto_2867752 - OBJ
      ?auto_2867753 - OBJ
      ?auto_2867754 - OBJ
      ?auto_2867748 - LOCATION
    )
    :vars
    (
      ?auto_2867756 - LOCATION
      ?auto_2867757 - CITY
      ?auto_2867759 - LOCATION
      ?auto_2867755 - LOCATION
      ?auto_2867758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2867756 ?auto_2867757 ) ( IN-CITY ?auto_2867748 ?auto_2867757 ) ( not ( = ?auto_2867748 ?auto_2867756 ) ) ( OBJ-AT ?auto_2867754 ?auto_2867756 ) ( OBJ-AT ?auto_2867753 ?auto_2867756 ) ( IN-CITY ?auto_2867759 ?auto_2867757 ) ( not ( = ?auto_2867748 ?auto_2867759 ) ) ( OBJ-AT ?auto_2867751 ?auto_2867759 ) ( IN-CITY ?auto_2867755 ?auto_2867757 ) ( not ( = ?auto_2867748 ?auto_2867755 ) ) ( OBJ-AT ?auto_2867749 ?auto_2867755 ) ( OBJ-AT ?auto_2867752 ?auto_2867756 ) ( OBJ-AT ?auto_2867750 ?auto_2867756 ) ( TRUCK-AT ?auto_2867758 ?auto_2867748 ) ( not ( = ?auto_2867750 ?auto_2867752 ) ) ( not ( = ?auto_2867750 ?auto_2867749 ) ) ( not ( = ?auto_2867752 ?auto_2867749 ) ) ( not ( = ?auto_2867755 ?auto_2867756 ) ) ( not ( = ?auto_2867750 ?auto_2867751 ) ) ( not ( = ?auto_2867752 ?auto_2867751 ) ) ( not ( = ?auto_2867749 ?auto_2867751 ) ) ( not ( = ?auto_2867759 ?auto_2867755 ) ) ( not ( = ?auto_2867759 ?auto_2867756 ) ) ( not ( = ?auto_2867750 ?auto_2867753 ) ) ( not ( = ?auto_2867752 ?auto_2867753 ) ) ( not ( = ?auto_2867749 ?auto_2867753 ) ) ( not ( = ?auto_2867751 ?auto_2867753 ) ) ( not ( = ?auto_2867750 ?auto_2867754 ) ) ( not ( = ?auto_2867752 ?auto_2867754 ) ) ( not ( = ?auto_2867749 ?auto_2867754 ) ) ( not ( = ?auto_2867751 ?auto_2867754 ) ) ( not ( = ?auto_2867753 ?auto_2867754 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2867750 ?auto_2867752 ?auto_2867749 ?auto_2867753 ?auto_2867751 ?auto_2867754 ?auto_2867748 )
      ( DELIVER-6PKG-VERIFY ?auto_2867749 ?auto_2867750 ?auto_2867751 ?auto_2867752 ?auto_2867753 ?auto_2867754 ?auto_2867748 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2891626 - OBJ
      ?auto_2891627 - OBJ
      ?auto_2891628 - OBJ
      ?auto_2891629 - OBJ
      ?auto_2891630 - OBJ
      ?auto_2891631 - OBJ
      ?auto_2891625 - LOCATION
    )
    :vars
    (
      ?auto_2891633 - LOCATION
      ?auto_2891634 - CITY
      ?auto_2891636 - LOCATION
      ?auto_2891632 - LOCATION
      ?auto_2891635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2891633 ?auto_2891634 ) ( IN-CITY ?auto_2891625 ?auto_2891634 ) ( not ( = ?auto_2891625 ?auto_2891633 ) ) ( OBJ-AT ?auto_2891631 ?auto_2891633 ) ( OBJ-AT ?auto_2891630 ?auto_2891633 ) ( IN-CITY ?auto_2891636 ?auto_2891634 ) ( not ( = ?auto_2891625 ?auto_2891636 ) ) ( OBJ-AT ?auto_2891627 ?auto_2891636 ) ( IN-CITY ?auto_2891632 ?auto_2891634 ) ( not ( = ?auto_2891625 ?auto_2891632 ) ) ( OBJ-AT ?auto_2891626 ?auto_2891632 ) ( OBJ-AT ?auto_2891629 ?auto_2891633 ) ( OBJ-AT ?auto_2891628 ?auto_2891633 ) ( TRUCK-AT ?auto_2891635 ?auto_2891625 ) ( not ( = ?auto_2891628 ?auto_2891629 ) ) ( not ( = ?auto_2891628 ?auto_2891626 ) ) ( not ( = ?auto_2891629 ?auto_2891626 ) ) ( not ( = ?auto_2891632 ?auto_2891633 ) ) ( not ( = ?auto_2891628 ?auto_2891627 ) ) ( not ( = ?auto_2891629 ?auto_2891627 ) ) ( not ( = ?auto_2891626 ?auto_2891627 ) ) ( not ( = ?auto_2891636 ?auto_2891632 ) ) ( not ( = ?auto_2891636 ?auto_2891633 ) ) ( not ( = ?auto_2891628 ?auto_2891630 ) ) ( not ( = ?auto_2891629 ?auto_2891630 ) ) ( not ( = ?auto_2891626 ?auto_2891630 ) ) ( not ( = ?auto_2891627 ?auto_2891630 ) ) ( not ( = ?auto_2891628 ?auto_2891631 ) ) ( not ( = ?auto_2891629 ?auto_2891631 ) ) ( not ( = ?auto_2891626 ?auto_2891631 ) ) ( not ( = ?auto_2891627 ?auto_2891631 ) ) ( not ( = ?auto_2891630 ?auto_2891631 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2891628 ?auto_2891629 ?auto_2891626 ?auto_2891630 ?auto_2891627 ?auto_2891631 ?auto_2891625 )
      ( DELIVER-6PKG-VERIFY ?auto_2891626 ?auto_2891627 ?auto_2891628 ?auto_2891629 ?auto_2891630 ?auto_2891631 ?auto_2891625 ) )
  )

)

