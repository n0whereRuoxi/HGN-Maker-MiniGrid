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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215650 - OBJ
      ?auto_215649 - LOCATION
    )
    :vars
    (
      ?auto_215651 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_215651 ?auto_215649 ) ( IN-TRUCK ?auto_215650 ?auto_215651 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_215650 ?auto_215651 ?auto_215649 )
      ( DELIVER-1PKG-VERIFY ?auto_215650 ?auto_215649 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215675 - OBJ
      ?auto_215674 - LOCATION
    )
    :vars
    (
      ?auto_215676 - TRUCK
      ?auto_215677 - LOCATION
      ?auto_215678 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_215675 ?auto_215676 ) ( TRUCK-AT ?auto_215676 ?auto_215677 ) ( IN-CITY ?auto_215677 ?auto_215678 ) ( IN-CITY ?auto_215674 ?auto_215678 ) ( not ( = ?auto_215674 ?auto_215677 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_215676 ?auto_215677 ?auto_215674 ?auto_215678 )
      ( DELIVER-1PKG ?auto_215675 ?auto_215674 )
      ( DELIVER-1PKG-VERIFY ?auto_215675 ?auto_215674 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215710 - OBJ
      ?auto_215709 - LOCATION
    )
    :vars
    (
      ?auto_215712 - TRUCK
      ?auto_215713 - LOCATION
      ?auto_215711 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_215712 ?auto_215713 ) ( IN-CITY ?auto_215713 ?auto_215711 ) ( IN-CITY ?auto_215709 ?auto_215711 ) ( not ( = ?auto_215709 ?auto_215713 ) ) ( OBJ-AT ?auto_215710 ?auto_215713 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_215710 ?auto_215712 ?auto_215713 )
      ( DELIVER-1PKG ?auto_215710 ?auto_215709 )
      ( DELIVER-1PKG-VERIFY ?auto_215710 ?auto_215709 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_215745 - OBJ
      ?auto_215744 - LOCATION
    )
    :vars
    (
      ?auto_215746 - LOCATION
      ?auto_215748 - CITY
      ?auto_215747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215746 ?auto_215748 ) ( IN-CITY ?auto_215744 ?auto_215748 ) ( not ( = ?auto_215744 ?auto_215746 ) ) ( OBJ-AT ?auto_215745 ?auto_215746 ) ( TRUCK-AT ?auto_215747 ?auto_215744 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_215747 ?auto_215744 ?auto_215746 ?auto_215748 )
      ( DELIVER-1PKG ?auto_215745 ?auto_215744 )
      ( DELIVER-1PKG-VERIFY ?auto_215745 ?auto_215744 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216083 - OBJ
      ?auto_216084 - OBJ
      ?auto_216082 - LOCATION
    )
    :vars
    (
      ?auto_216085 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216085 ?auto_216082 ) ( IN-TRUCK ?auto_216084 ?auto_216085 ) ( OBJ-AT ?auto_216083 ?auto_216082 ) ( not ( = ?auto_216083 ?auto_216084 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216084 ?auto_216082 )
      ( DELIVER-2PKG-VERIFY ?auto_216083 ?auto_216084 ?auto_216082 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216087 - OBJ
      ?auto_216088 - OBJ
      ?auto_216086 - LOCATION
    )
    :vars
    (
      ?auto_216089 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216089 ?auto_216086 ) ( IN-TRUCK ?auto_216087 ?auto_216089 ) ( OBJ-AT ?auto_216088 ?auto_216086 ) ( not ( = ?auto_216087 ?auto_216088 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216087 ?auto_216086 )
      ( DELIVER-2PKG-VERIFY ?auto_216087 ?auto_216088 ?auto_216086 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216095 - OBJ
      ?auto_216096 - OBJ
      ?auto_216097 - OBJ
      ?auto_216094 - LOCATION
    )
    :vars
    (
      ?auto_216098 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216098 ?auto_216094 ) ( IN-TRUCK ?auto_216097 ?auto_216098 ) ( OBJ-AT ?auto_216095 ?auto_216094 ) ( OBJ-AT ?auto_216096 ?auto_216094 ) ( not ( = ?auto_216095 ?auto_216096 ) ) ( not ( = ?auto_216095 ?auto_216097 ) ) ( not ( = ?auto_216096 ?auto_216097 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216097 ?auto_216094 )
      ( DELIVER-3PKG-VERIFY ?auto_216095 ?auto_216096 ?auto_216097 ?auto_216094 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216100 - OBJ
      ?auto_216101 - OBJ
      ?auto_216102 - OBJ
      ?auto_216099 - LOCATION
    )
    :vars
    (
      ?auto_216103 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216103 ?auto_216099 ) ( IN-TRUCK ?auto_216101 ?auto_216103 ) ( OBJ-AT ?auto_216100 ?auto_216099 ) ( OBJ-AT ?auto_216102 ?auto_216099 ) ( not ( = ?auto_216100 ?auto_216101 ) ) ( not ( = ?auto_216100 ?auto_216102 ) ) ( not ( = ?auto_216101 ?auto_216102 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216101 ?auto_216099 )
      ( DELIVER-3PKG-VERIFY ?auto_216100 ?auto_216101 ?auto_216102 ?auto_216099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216110 - OBJ
      ?auto_216111 - OBJ
      ?auto_216112 - OBJ
      ?auto_216109 - LOCATION
    )
    :vars
    (
      ?auto_216113 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216113 ?auto_216109 ) ( IN-TRUCK ?auto_216110 ?auto_216113 ) ( OBJ-AT ?auto_216111 ?auto_216109 ) ( OBJ-AT ?auto_216112 ?auto_216109 ) ( not ( = ?auto_216110 ?auto_216111 ) ) ( not ( = ?auto_216110 ?auto_216112 ) ) ( not ( = ?auto_216111 ?auto_216112 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216110 ?auto_216109 )
      ( DELIVER-3PKG-VERIFY ?auto_216110 ?auto_216111 ?auto_216112 ?auto_216109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216130 - OBJ
      ?auto_216131 - OBJ
      ?auto_216132 - OBJ
      ?auto_216133 - OBJ
      ?auto_216129 - LOCATION
    )
    :vars
    (
      ?auto_216134 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216134 ?auto_216129 ) ( IN-TRUCK ?auto_216133 ?auto_216134 ) ( OBJ-AT ?auto_216130 ?auto_216129 ) ( OBJ-AT ?auto_216131 ?auto_216129 ) ( OBJ-AT ?auto_216132 ?auto_216129 ) ( not ( = ?auto_216130 ?auto_216131 ) ) ( not ( = ?auto_216130 ?auto_216132 ) ) ( not ( = ?auto_216130 ?auto_216133 ) ) ( not ( = ?auto_216131 ?auto_216132 ) ) ( not ( = ?auto_216131 ?auto_216133 ) ) ( not ( = ?auto_216132 ?auto_216133 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216133 ?auto_216129 )
      ( DELIVER-4PKG-VERIFY ?auto_216130 ?auto_216131 ?auto_216132 ?auto_216133 ?auto_216129 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216136 - OBJ
      ?auto_216137 - OBJ
      ?auto_216138 - OBJ
      ?auto_216139 - OBJ
      ?auto_216135 - LOCATION
    )
    :vars
    (
      ?auto_216140 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216140 ?auto_216135 ) ( IN-TRUCK ?auto_216138 ?auto_216140 ) ( OBJ-AT ?auto_216136 ?auto_216135 ) ( OBJ-AT ?auto_216137 ?auto_216135 ) ( OBJ-AT ?auto_216139 ?auto_216135 ) ( not ( = ?auto_216136 ?auto_216137 ) ) ( not ( = ?auto_216136 ?auto_216138 ) ) ( not ( = ?auto_216136 ?auto_216139 ) ) ( not ( = ?auto_216137 ?auto_216138 ) ) ( not ( = ?auto_216137 ?auto_216139 ) ) ( not ( = ?auto_216138 ?auto_216139 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216138 ?auto_216135 )
      ( DELIVER-4PKG-VERIFY ?auto_216136 ?auto_216137 ?auto_216138 ?auto_216139 ?auto_216135 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216148 - OBJ
      ?auto_216149 - OBJ
      ?auto_216150 - OBJ
      ?auto_216151 - OBJ
      ?auto_216147 - LOCATION
    )
    :vars
    (
      ?auto_216152 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216152 ?auto_216147 ) ( IN-TRUCK ?auto_216149 ?auto_216152 ) ( OBJ-AT ?auto_216148 ?auto_216147 ) ( OBJ-AT ?auto_216150 ?auto_216147 ) ( OBJ-AT ?auto_216151 ?auto_216147 ) ( not ( = ?auto_216148 ?auto_216149 ) ) ( not ( = ?auto_216148 ?auto_216150 ) ) ( not ( = ?auto_216148 ?auto_216151 ) ) ( not ( = ?auto_216149 ?auto_216150 ) ) ( not ( = ?auto_216149 ?auto_216151 ) ) ( not ( = ?auto_216150 ?auto_216151 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216149 ?auto_216147 )
      ( DELIVER-4PKG-VERIFY ?auto_216148 ?auto_216149 ?auto_216150 ?auto_216151 ?auto_216147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216172 - OBJ
      ?auto_216173 - OBJ
      ?auto_216174 - OBJ
      ?auto_216175 - OBJ
      ?auto_216171 - LOCATION
    )
    :vars
    (
      ?auto_216176 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216176 ?auto_216171 ) ( IN-TRUCK ?auto_216172 ?auto_216176 ) ( OBJ-AT ?auto_216173 ?auto_216171 ) ( OBJ-AT ?auto_216174 ?auto_216171 ) ( OBJ-AT ?auto_216175 ?auto_216171 ) ( not ( = ?auto_216172 ?auto_216173 ) ) ( not ( = ?auto_216172 ?auto_216174 ) ) ( not ( = ?auto_216172 ?auto_216175 ) ) ( not ( = ?auto_216173 ?auto_216174 ) ) ( not ( = ?auto_216173 ?auto_216175 ) ) ( not ( = ?auto_216174 ?auto_216175 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216172 ?auto_216171 )
      ( DELIVER-4PKG-VERIFY ?auto_216172 ?auto_216173 ?auto_216174 ?auto_216175 ?auto_216171 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216220 - OBJ
      ?auto_216221 - OBJ
      ?auto_216222 - OBJ
      ?auto_216223 - OBJ
      ?auto_216224 - OBJ
      ?auto_216219 - LOCATION
    )
    :vars
    (
      ?auto_216225 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216225 ?auto_216219 ) ( IN-TRUCK ?auto_216224 ?auto_216225 ) ( OBJ-AT ?auto_216220 ?auto_216219 ) ( OBJ-AT ?auto_216221 ?auto_216219 ) ( OBJ-AT ?auto_216222 ?auto_216219 ) ( OBJ-AT ?auto_216223 ?auto_216219 ) ( not ( = ?auto_216220 ?auto_216221 ) ) ( not ( = ?auto_216220 ?auto_216222 ) ) ( not ( = ?auto_216220 ?auto_216223 ) ) ( not ( = ?auto_216220 ?auto_216224 ) ) ( not ( = ?auto_216221 ?auto_216222 ) ) ( not ( = ?auto_216221 ?auto_216223 ) ) ( not ( = ?auto_216221 ?auto_216224 ) ) ( not ( = ?auto_216222 ?auto_216223 ) ) ( not ( = ?auto_216222 ?auto_216224 ) ) ( not ( = ?auto_216223 ?auto_216224 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216224 ?auto_216219 )
      ( DELIVER-5PKG-VERIFY ?auto_216220 ?auto_216221 ?auto_216222 ?auto_216223 ?auto_216224 ?auto_216219 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216227 - OBJ
      ?auto_216228 - OBJ
      ?auto_216229 - OBJ
      ?auto_216230 - OBJ
      ?auto_216231 - OBJ
      ?auto_216226 - LOCATION
    )
    :vars
    (
      ?auto_216232 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216232 ?auto_216226 ) ( IN-TRUCK ?auto_216230 ?auto_216232 ) ( OBJ-AT ?auto_216227 ?auto_216226 ) ( OBJ-AT ?auto_216228 ?auto_216226 ) ( OBJ-AT ?auto_216229 ?auto_216226 ) ( OBJ-AT ?auto_216231 ?auto_216226 ) ( not ( = ?auto_216227 ?auto_216228 ) ) ( not ( = ?auto_216227 ?auto_216229 ) ) ( not ( = ?auto_216227 ?auto_216230 ) ) ( not ( = ?auto_216227 ?auto_216231 ) ) ( not ( = ?auto_216228 ?auto_216229 ) ) ( not ( = ?auto_216228 ?auto_216230 ) ) ( not ( = ?auto_216228 ?auto_216231 ) ) ( not ( = ?auto_216229 ?auto_216230 ) ) ( not ( = ?auto_216229 ?auto_216231 ) ) ( not ( = ?auto_216230 ?auto_216231 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216230 ?auto_216226 )
      ( DELIVER-5PKG-VERIFY ?auto_216227 ?auto_216228 ?auto_216229 ?auto_216230 ?auto_216231 ?auto_216226 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216241 - OBJ
      ?auto_216242 - OBJ
      ?auto_216243 - OBJ
      ?auto_216244 - OBJ
      ?auto_216245 - OBJ
      ?auto_216240 - LOCATION
    )
    :vars
    (
      ?auto_216246 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216246 ?auto_216240 ) ( IN-TRUCK ?auto_216243 ?auto_216246 ) ( OBJ-AT ?auto_216241 ?auto_216240 ) ( OBJ-AT ?auto_216242 ?auto_216240 ) ( OBJ-AT ?auto_216244 ?auto_216240 ) ( OBJ-AT ?auto_216245 ?auto_216240 ) ( not ( = ?auto_216241 ?auto_216242 ) ) ( not ( = ?auto_216241 ?auto_216243 ) ) ( not ( = ?auto_216241 ?auto_216244 ) ) ( not ( = ?auto_216241 ?auto_216245 ) ) ( not ( = ?auto_216242 ?auto_216243 ) ) ( not ( = ?auto_216242 ?auto_216244 ) ) ( not ( = ?auto_216242 ?auto_216245 ) ) ( not ( = ?auto_216243 ?auto_216244 ) ) ( not ( = ?auto_216243 ?auto_216245 ) ) ( not ( = ?auto_216244 ?auto_216245 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216243 ?auto_216240 )
      ( DELIVER-5PKG-VERIFY ?auto_216241 ?auto_216242 ?auto_216243 ?auto_216244 ?auto_216245 ?auto_216240 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216269 - OBJ
      ?auto_216270 - OBJ
      ?auto_216271 - OBJ
      ?auto_216272 - OBJ
      ?auto_216273 - OBJ
      ?auto_216268 - LOCATION
    )
    :vars
    (
      ?auto_216274 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216274 ?auto_216268 ) ( IN-TRUCK ?auto_216270 ?auto_216274 ) ( OBJ-AT ?auto_216269 ?auto_216268 ) ( OBJ-AT ?auto_216271 ?auto_216268 ) ( OBJ-AT ?auto_216272 ?auto_216268 ) ( OBJ-AT ?auto_216273 ?auto_216268 ) ( not ( = ?auto_216269 ?auto_216270 ) ) ( not ( = ?auto_216269 ?auto_216271 ) ) ( not ( = ?auto_216269 ?auto_216272 ) ) ( not ( = ?auto_216269 ?auto_216273 ) ) ( not ( = ?auto_216270 ?auto_216271 ) ) ( not ( = ?auto_216270 ?auto_216272 ) ) ( not ( = ?auto_216270 ?auto_216273 ) ) ( not ( = ?auto_216271 ?auto_216272 ) ) ( not ( = ?auto_216271 ?auto_216273 ) ) ( not ( = ?auto_216272 ?auto_216273 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216270 ?auto_216268 )
      ( DELIVER-5PKG-VERIFY ?auto_216269 ?auto_216270 ?auto_216271 ?auto_216272 ?auto_216273 ?auto_216268 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216325 - OBJ
      ?auto_216326 - OBJ
      ?auto_216327 - OBJ
      ?auto_216328 - OBJ
      ?auto_216329 - OBJ
      ?auto_216324 - LOCATION
    )
    :vars
    (
      ?auto_216330 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216330 ?auto_216324 ) ( IN-TRUCK ?auto_216325 ?auto_216330 ) ( OBJ-AT ?auto_216326 ?auto_216324 ) ( OBJ-AT ?auto_216327 ?auto_216324 ) ( OBJ-AT ?auto_216328 ?auto_216324 ) ( OBJ-AT ?auto_216329 ?auto_216324 ) ( not ( = ?auto_216325 ?auto_216326 ) ) ( not ( = ?auto_216325 ?auto_216327 ) ) ( not ( = ?auto_216325 ?auto_216328 ) ) ( not ( = ?auto_216325 ?auto_216329 ) ) ( not ( = ?auto_216326 ?auto_216327 ) ) ( not ( = ?auto_216326 ?auto_216328 ) ) ( not ( = ?auto_216326 ?auto_216329 ) ) ( not ( = ?auto_216327 ?auto_216328 ) ) ( not ( = ?auto_216327 ?auto_216329 ) ) ( not ( = ?auto_216328 ?auto_216329 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216325 ?auto_216324 )
      ( DELIVER-5PKG-VERIFY ?auto_216325 ?auto_216326 ?auto_216327 ?auto_216328 ?auto_216329 ?auto_216324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216442 - OBJ
      ?auto_216443 - OBJ
      ?auto_216441 - LOCATION
    )
    :vars
    (
      ?auto_216445 - TRUCK
      ?auto_216444 - LOCATION
      ?auto_216446 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216443 ?auto_216445 ) ( TRUCK-AT ?auto_216445 ?auto_216444 ) ( IN-CITY ?auto_216444 ?auto_216446 ) ( IN-CITY ?auto_216441 ?auto_216446 ) ( not ( = ?auto_216441 ?auto_216444 ) ) ( OBJ-AT ?auto_216442 ?auto_216441 ) ( not ( = ?auto_216442 ?auto_216443 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216443 ?auto_216441 )
      ( DELIVER-2PKG-VERIFY ?auto_216442 ?auto_216443 ?auto_216441 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216448 - OBJ
      ?auto_216449 - OBJ
      ?auto_216447 - LOCATION
    )
    :vars
    (
      ?auto_216450 - TRUCK
      ?auto_216452 - LOCATION
      ?auto_216451 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216448 ?auto_216450 ) ( TRUCK-AT ?auto_216450 ?auto_216452 ) ( IN-CITY ?auto_216452 ?auto_216451 ) ( IN-CITY ?auto_216447 ?auto_216451 ) ( not ( = ?auto_216447 ?auto_216452 ) ) ( OBJ-AT ?auto_216449 ?auto_216447 ) ( not ( = ?auto_216449 ?auto_216448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216449 ?auto_216448 ?auto_216447 )
      ( DELIVER-2PKG-VERIFY ?auto_216448 ?auto_216449 ?auto_216447 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216461 - OBJ
      ?auto_216462 - OBJ
      ?auto_216463 - OBJ
      ?auto_216460 - LOCATION
    )
    :vars
    (
      ?auto_216464 - TRUCK
      ?auto_216466 - LOCATION
      ?auto_216465 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216463 ?auto_216464 ) ( TRUCK-AT ?auto_216464 ?auto_216466 ) ( IN-CITY ?auto_216466 ?auto_216465 ) ( IN-CITY ?auto_216460 ?auto_216465 ) ( not ( = ?auto_216460 ?auto_216466 ) ) ( OBJ-AT ?auto_216462 ?auto_216460 ) ( not ( = ?auto_216462 ?auto_216463 ) ) ( OBJ-AT ?auto_216461 ?auto_216460 ) ( not ( = ?auto_216461 ?auto_216462 ) ) ( not ( = ?auto_216461 ?auto_216463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216462 ?auto_216463 ?auto_216460 )
      ( DELIVER-3PKG-VERIFY ?auto_216461 ?auto_216462 ?auto_216463 ?auto_216460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216468 - OBJ
      ?auto_216469 - OBJ
      ?auto_216470 - OBJ
      ?auto_216467 - LOCATION
    )
    :vars
    (
      ?auto_216471 - TRUCK
      ?auto_216473 - LOCATION
      ?auto_216472 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216469 ?auto_216471 ) ( TRUCK-AT ?auto_216471 ?auto_216473 ) ( IN-CITY ?auto_216473 ?auto_216472 ) ( IN-CITY ?auto_216467 ?auto_216472 ) ( not ( = ?auto_216467 ?auto_216473 ) ) ( OBJ-AT ?auto_216468 ?auto_216467 ) ( not ( = ?auto_216468 ?auto_216469 ) ) ( OBJ-AT ?auto_216470 ?auto_216467 ) ( not ( = ?auto_216468 ?auto_216470 ) ) ( not ( = ?auto_216469 ?auto_216470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216468 ?auto_216469 ?auto_216467 )
      ( DELIVER-3PKG-VERIFY ?auto_216468 ?auto_216469 ?auto_216470 ?auto_216467 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216482 - OBJ
      ?auto_216483 - OBJ
      ?auto_216484 - OBJ
      ?auto_216481 - LOCATION
    )
    :vars
    (
      ?auto_216485 - TRUCK
      ?auto_216487 - LOCATION
      ?auto_216486 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216482 ?auto_216485 ) ( TRUCK-AT ?auto_216485 ?auto_216487 ) ( IN-CITY ?auto_216487 ?auto_216486 ) ( IN-CITY ?auto_216481 ?auto_216486 ) ( not ( = ?auto_216481 ?auto_216487 ) ) ( OBJ-AT ?auto_216484 ?auto_216481 ) ( not ( = ?auto_216484 ?auto_216482 ) ) ( OBJ-AT ?auto_216483 ?auto_216481 ) ( not ( = ?auto_216482 ?auto_216483 ) ) ( not ( = ?auto_216483 ?auto_216484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216484 ?auto_216482 ?auto_216481 )
      ( DELIVER-3PKG-VERIFY ?auto_216482 ?auto_216483 ?auto_216484 ?auto_216481 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216511 - OBJ
      ?auto_216512 - OBJ
      ?auto_216513 - OBJ
      ?auto_216514 - OBJ
      ?auto_216510 - LOCATION
    )
    :vars
    (
      ?auto_216515 - TRUCK
      ?auto_216517 - LOCATION
      ?auto_216516 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216514 ?auto_216515 ) ( TRUCK-AT ?auto_216515 ?auto_216517 ) ( IN-CITY ?auto_216517 ?auto_216516 ) ( IN-CITY ?auto_216510 ?auto_216516 ) ( not ( = ?auto_216510 ?auto_216517 ) ) ( OBJ-AT ?auto_216511 ?auto_216510 ) ( not ( = ?auto_216511 ?auto_216514 ) ) ( OBJ-AT ?auto_216512 ?auto_216510 ) ( OBJ-AT ?auto_216513 ?auto_216510 ) ( not ( = ?auto_216511 ?auto_216512 ) ) ( not ( = ?auto_216511 ?auto_216513 ) ) ( not ( = ?auto_216512 ?auto_216513 ) ) ( not ( = ?auto_216512 ?auto_216514 ) ) ( not ( = ?auto_216513 ?auto_216514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216511 ?auto_216514 ?auto_216510 )
      ( DELIVER-4PKG-VERIFY ?auto_216511 ?auto_216512 ?auto_216513 ?auto_216514 ?auto_216510 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216519 - OBJ
      ?auto_216520 - OBJ
      ?auto_216521 - OBJ
      ?auto_216522 - OBJ
      ?auto_216518 - LOCATION
    )
    :vars
    (
      ?auto_216523 - TRUCK
      ?auto_216525 - LOCATION
      ?auto_216524 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216521 ?auto_216523 ) ( TRUCK-AT ?auto_216523 ?auto_216525 ) ( IN-CITY ?auto_216525 ?auto_216524 ) ( IN-CITY ?auto_216518 ?auto_216524 ) ( not ( = ?auto_216518 ?auto_216525 ) ) ( OBJ-AT ?auto_216520 ?auto_216518 ) ( not ( = ?auto_216520 ?auto_216521 ) ) ( OBJ-AT ?auto_216519 ?auto_216518 ) ( OBJ-AT ?auto_216522 ?auto_216518 ) ( not ( = ?auto_216519 ?auto_216520 ) ) ( not ( = ?auto_216519 ?auto_216521 ) ) ( not ( = ?auto_216519 ?auto_216522 ) ) ( not ( = ?auto_216520 ?auto_216522 ) ) ( not ( = ?auto_216521 ?auto_216522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216520 ?auto_216521 ?auto_216518 )
      ( DELIVER-4PKG-VERIFY ?auto_216519 ?auto_216520 ?auto_216521 ?auto_216522 ?auto_216518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216535 - OBJ
      ?auto_216536 - OBJ
      ?auto_216537 - OBJ
      ?auto_216538 - OBJ
      ?auto_216534 - LOCATION
    )
    :vars
    (
      ?auto_216539 - TRUCK
      ?auto_216541 - LOCATION
      ?auto_216540 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216536 ?auto_216539 ) ( TRUCK-AT ?auto_216539 ?auto_216541 ) ( IN-CITY ?auto_216541 ?auto_216540 ) ( IN-CITY ?auto_216534 ?auto_216540 ) ( not ( = ?auto_216534 ?auto_216541 ) ) ( OBJ-AT ?auto_216537 ?auto_216534 ) ( not ( = ?auto_216537 ?auto_216536 ) ) ( OBJ-AT ?auto_216535 ?auto_216534 ) ( OBJ-AT ?auto_216538 ?auto_216534 ) ( not ( = ?auto_216535 ?auto_216536 ) ) ( not ( = ?auto_216535 ?auto_216537 ) ) ( not ( = ?auto_216535 ?auto_216538 ) ) ( not ( = ?auto_216536 ?auto_216538 ) ) ( not ( = ?auto_216537 ?auto_216538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216537 ?auto_216536 ?auto_216534 )
      ( DELIVER-4PKG-VERIFY ?auto_216535 ?auto_216536 ?auto_216537 ?auto_216538 ?auto_216534 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216567 - OBJ
      ?auto_216568 - OBJ
      ?auto_216569 - OBJ
      ?auto_216570 - OBJ
      ?auto_216566 - LOCATION
    )
    :vars
    (
      ?auto_216571 - TRUCK
      ?auto_216573 - LOCATION
      ?auto_216572 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216567 ?auto_216571 ) ( TRUCK-AT ?auto_216571 ?auto_216573 ) ( IN-CITY ?auto_216573 ?auto_216572 ) ( IN-CITY ?auto_216566 ?auto_216572 ) ( not ( = ?auto_216566 ?auto_216573 ) ) ( OBJ-AT ?auto_216570 ?auto_216566 ) ( not ( = ?auto_216570 ?auto_216567 ) ) ( OBJ-AT ?auto_216568 ?auto_216566 ) ( OBJ-AT ?auto_216569 ?auto_216566 ) ( not ( = ?auto_216567 ?auto_216568 ) ) ( not ( = ?auto_216567 ?auto_216569 ) ) ( not ( = ?auto_216568 ?auto_216569 ) ) ( not ( = ?auto_216568 ?auto_216570 ) ) ( not ( = ?auto_216569 ?auto_216570 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216570 ?auto_216567 ?auto_216566 )
      ( DELIVER-4PKG-VERIFY ?auto_216567 ?auto_216568 ?auto_216569 ?auto_216570 ?auto_216566 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216632 - OBJ
      ?auto_216633 - OBJ
      ?auto_216634 - OBJ
      ?auto_216635 - OBJ
      ?auto_216636 - OBJ
      ?auto_216631 - LOCATION
    )
    :vars
    (
      ?auto_216637 - TRUCK
      ?auto_216639 - LOCATION
      ?auto_216638 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216636 ?auto_216637 ) ( TRUCK-AT ?auto_216637 ?auto_216639 ) ( IN-CITY ?auto_216639 ?auto_216638 ) ( IN-CITY ?auto_216631 ?auto_216638 ) ( not ( = ?auto_216631 ?auto_216639 ) ) ( OBJ-AT ?auto_216634 ?auto_216631 ) ( not ( = ?auto_216634 ?auto_216636 ) ) ( OBJ-AT ?auto_216632 ?auto_216631 ) ( OBJ-AT ?auto_216633 ?auto_216631 ) ( OBJ-AT ?auto_216635 ?auto_216631 ) ( not ( = ?auto_216632 ?auto_216633 ) ) ( not ( = ?auto_216632 ?auto_216634 ) ) ( not ( = ?auto_216632 ?auto_216635 ) ) ( not ( = ?auto_216632 ?auto_216636 ) ) ( not ( = ?auto_216633 ?auto_216634 ) ) ( not ( = ?auto_216633 ?auto_216635 ) ) ( not ( = ?auto_216633 ?auto_216636 ) ) ( not ( = ?auto_216634 ?auto_216635 ) ) ( not ( = ?auto_216635 ?auto_216636 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216634 ?auto_216636 ?auto_216631 )
      ( DELIVER-5PKG-VERIFY ?auto_216632 ?auto_216633 ?auto_216634 ?auto_216635 ?auto_216636 ?auto_216631 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216641 - OBJ
      ?auto_216642 - OBJ
      ?auto_216643 - OBJ
      ?auto_216644 - OBJ
      ?auto_216645 - OBJ
      ?auto_216640 - LOCATION
    )
    :vars
    (
      ?auto_216646 - TRUCK
      ?auto_216648 - LOCATION
      ?auto_216647 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216644 ?auto_216646 ) ( TRUCK-AT ?auto_216646 ?auto_216648 ) ( IN-CITY ?auto_216648 ?auto_216647 ) ( IN-CITY ?auto_216640 ?auto_216647 ) ( not ( = ?auto_216640 ?auto_216648 ) ) ( OBJ-AT ?auto_216641 ?auto_216640 ) ( not ( = ?auto_216641 ?auto_216644 ) ) ( OBJ-AT ?auto_216642 ?auto_216640 ) ( OBJ-AT ?auto_216643 ?auto_216640 ) ( OBJ-AT ?auto_216645 ?auto_216640 ) ( not ( = ?auto_216641 ?auto_216642 ) ) ( not ( = ?auto_216641 ?auto_216643 ) ) ( not ( = ?auto_216641 ?auto_216645 ) ) ( not ( = ?auto_216642 ?auto_216643 ) ) ( not ( = ?auto_216642 ?auto_216644 ) ) ( not ( = ?auto_216642 ?auto_216645 ) ) ( not ( = ?auto_216643 ?auto_216644 ) ) ( not ( = ?auto_216643 ?auto_216645 ) ) ( not ( = ?auto_216644 ?auto_216645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216641 ?auto_216644 ?auto_216640 )
      ( DELIVER-5PKG-VERIFY ?auto_216641 ?auto_216642 ?auto_216643 ?auto_216644 ?auto_216645 ?auto_216640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216659 - OBJ
      ?auto_216660 - OBJ
      ?auto_216661 - OBJ
      ?auto_216662 - OBJ
      ?auto_216663 - OBJ
      ?auto_216658 - LOCATION
    )
    :vars
    (
      ?auto_216664 - TRUCK
      ?auto_216666 - LOCATION
      ?auto_216665 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216661 ?auto_216664 ) ( TRUCK-AT ?auto_216664 ?auto_216666 ) ( IN-CITY ?auto_216666 ?auto_216665 ) ( IN-CITY ?auto_216658 ?auto_216665 ) ( not ( = ?auto_216658 ?auto_216666 ) ) ( OBJ-AT ?auto_216659 ?auto_216658 ) ( not ( = ?auto_216659 ?auto_216661 ) ) ( OBJ-AT ?auto_216660 ?auto_216658 ) ( OBJ-AT ?auto_216662 ?auto_216658 ) ( OBJ-AT ?auto_216663 ?auto_216658 ) ( not ( = ?auto_216659 ?auto_216660 ) ) ( not ( = ?auto_216659 ?auto_216662 ) ) ( not ( = ?auto_216659 ?auto_216663 ) ) ( not ( = ?auto_216660 ?auto_216661 ) ) ( not ( = ?auto_216660 ?auto_216662 ) ) ( not ( = ?auto_216660 ?auto_216663 ) ) ( not ( = ?auto_216661 ?auto_216662 ) ) ( not ( = ?auto_216661 ?auto_216663 ) ) ( not ( = ?auto_216662 ?auto_216663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216659 ?auto_216661 ?auto_216658 )
      ( DELIVER-5PKG-VERIFY ?auto_216659 ?auto_216660 ?auto_216661 ?auto_216662 ?auto_216663 ?auto_216658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216695 - OBJ
      ?auto_216696 - OBJ
      ?auto_216697 - OBJ
      ?auto_216698 - OBJ
      ?auto_216699 - OBJ
      ?auto_216694 - LOCATION
    )
    :vars
    (
      ?auto_216700 - TRUCK
      ?auto_216702 - LOCATION
      ?auto_216701 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216696 ?auto_216700 ) ( TRUCK-AT ?auto_216700 ?auto_216702 ) ( IN-CITY ?auto_216702 ?auto_216701 ) ( IN-CITY ?auto_216694 ?auto_216701 ) ( not ( = ?auto_216694 ?auto_216702 ) ) ( OBJ-AT ?auto_216697 ?auto_216694 ) ( not ( = ?auto_216697 ?auto_216696 ) ) ( OBJ-AT ?auto_216695 ?auto_216694 ) ( OBJ-AT ?auto_216698 ?auto_216694 ) ( OBJ-AT ?auto_216699 ?auto_216694 ) ( not ( = ?auto_216695 ?auto_216696 ) ) ( not ( = ?auto_216695 ?auto_216697 ) ) ( not ( = ?auto_216695 ?auto_216698 ) ) ( not ( = ?auto_216695 ?auto_216699 ) ) ( not ( = ?auto_216696 ?auto_216698 ) ) ( not ( = ?auto_216696 ?auto_216699 ) ) ( not ( = ?auto_216697 ?auto_216698 ) ) ( not ( = ?auto_216697 ?auto_216699 ) ) ( not ( = ?auto_216698 ?auto_216699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216697 ?auto_216696 ?auto_216694 )
      ( DELIVER-5PKG-VERIFY ?auto_216695 ?auto_216696 ?auto_216697 ?auto_216698 ?auto_216699 ?auto_216694 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216767 - OBJ
      ?auto_216768 - OBJ
      ?auto_216769 - OBJ
      ?auto_216770 - OBJ
      ?auto_216771 - OBJ
      ?auto_216766 - LOCATION
    )
    :vars
    (
      ?auto_216772 - TRUCK
      ?auto_216774 - LOCATION
      ?auto_216773 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_216767 ?auto_216772 ) ( TRUCK-AT ?auto_216772 ?auto_216774 ) ( IN-CITY ?auto_216774 ?auto_216773 ) ( IN-CITY ?auto_216766 ?auto_216773 ) ( not ( = ?auto_216766 ?auto_216774 ) ) ( OBJ-AT ?auto_216771 ?auto_216766 ) ( not ( = ?auto_216771 ?auto_216767 ) ) ( OBJ-AT ?auto_216768 ?auto_216766 ) ( OBJ-AT ?auto_216769 ?auto_216766 ) ( OBJ-AT ?auto_216770 ?auto_216766 ) ( not ( = ?auto_216767 ?auto_216768 ) ) ( not ( = ?auto_216767 ?auto_216769 ) ) ( not ( = ?auto_216767 ?auto_216770 ) ) ( not ( = ?auto_216768 ?auto_216769 ) ) ( not ( = ?auto_216768 ?auto_216770 ) ) ( not ( = ?auto_216768 ?auto_216771 ) ) ( not ( = ?auto_216769 ?auto_216770 ) ) ( not ( = ?auto_216769 ?auto_216771 ) ) ( not ( = ?auto_216770 ?auto_216771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216771 ?auto_216767 ?auto_216766 )
      ( DELIVER-5PKG-VERIFY ?auto_216767 ?auto_216768 ?auto_216769 ?auto_216770 ?auto_216771 ?auto_216766 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_216912 - OBJ
      ?auto_216911 - LOCATION
    )
    :vars
    (
      ?auto_216913 - TRUCK
      ?auto_216915 - LOCATION
      ?auto_216914 - CITY
      ?auto_216916 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216913 ?auto_216915 ) ( IN-CITY ?auto_216915 ?auto_216914 ) ( IN-CITY ?auto_216911 ?auto_216914 ) ( not ( = ?auto_216911 ?auto_216915 ) ) ( OBJ-AT ?auto_216916 ?auto_216911 ) ( not ( = ?auto_216916 ?auto_216912 ) ) ( OBJ-AT ?auto_216912 ?auto_216915 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_216912 ?auto_216913 ?auto_216915 )
      ( DELIVER-2PKG ?auto_216916 ?auto_216912 ?auto_216911 )
      ( DELIVER-1PKG-VERIFY ?auto_216912 ?auto_216911 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216918 - OBJ
      ?auto_216919 - OBJ
      ?auto_216917 - LOCATION
    )
    :vars
    (
      ?auto_216922 - TRUCK
      ?auto_216920 - LOCATION
      ?auto_216921 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216922 ?auto_216920 ) ( IN-CITY ?auto_216920 ?auto_216921 ) ( IN-CITY ?auto_216917 ?auto_216921 ) ( not ( = ?auto_216917 ?auto_216920 ) ) ( OBJ-AT ?auto_216918 ?auto_216917 ) ( not ( = ?auto_216918 ?auto_216919 ) ) ( OBJ-AT ?auto_216919 ?auto_216920 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_216919 ?auto_216917 )
      ( DELIVER-2PKG-VERIFY ?auto_216918 ?auto_216919 ?auto_216917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_216924 - OBJ
      ?auto_216925 - OBJ
      ?auto_216923 - LOCATION
    )
    :vars
    (
      ?auto_216927 - TRUCK
      ?auto_216928 - LOCATION
      ?auto_216926 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216927 ?auto_216928 ) ( IN-CITY ?auto_216928 ?auto_216926 ) ( IN-CITY ?auto_216923 ?auto_216926 ) ( not ( = ?auto_216923 ?auto_216928 ) ) ( OBJ-AT ?auto_216925 ?auto_216923 ) ( not ( = ?auto_216925 ?auto_216924 ) ) ( OBJ-AT ?auto_216924 ?auto_216928 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216925 ?auto_216924 ?auto_216923 )
      ( DELIVER-2PKG-VERIFY ?auto_216924 ?auto_216925 ?auto_216923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216937 - OBJ
      ?auto_216938 - OBJ
      ?auto_216939 - OBJ
      ?auto_216936 - LOCATION
    )
    :vars
    (
      ?auto_216941 - TRUCK
      ?auto_216942 - LOCATION
      ?auto_216940 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216941 ?auto_216942 ) ( IN-CITY ?auto_216942 ?auto_216940 ) ( IN-CITY ?auto_216936 ?auto_216940 ) ( not ( = ?auto_216936 ?auto_216942 ) ) ( OBJ-AT ?auto_216938 ?auto_216936 ) ( not ( = ?auto_216938 ?auto_216939 ) ) ( OBJ-AT ?auto_216939 ?auto_216942 ) ( OBJ-AT ?auto_216937 ?auto_216936 ) ( not ( = ?auto_216937 ?auto_216938 ) ) ( not ( = ?auto_216937 ?auto_216939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216938 ?auto_216939 ?auto_216936 )
      ( DELIVER-3PKG-VERIFY ?auto_216937 ?auto_216938 ?auto_216939 ?auto_216936 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216944 - OBJ
      ?auto_216945 - OBJ
      ?auto_216946 - OBJ
      ?auto_216943 - LOCATION
    )
    :vars
    (
      ?auto_216948 - TRUCK
      ?auto_216949 - LOCATION
      ?auto_216947 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216948 ?auto_216949 ) ( IN-CITY ?auto_216949 ?auto_216947 ) ( IN-CITY ?auto_216943 ?auto_216947 ) ( not ( = ?auto_216943 ?auto_216949 ) ) ( OBJ-AT ?auto_216944 ?auto_216943 ) ( not ( = ?auto_216944 ?auto_216945 ) ) ( OBJ-AT ?auto_216945 ?auto_216949 ) ( OBJ-AT ?auto_216946 ?auto_216943 ) ( not ( = ?auto_216944 ?auto_216946 ) ) ( not ( = ?auto_216945 ?auto_216946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216944 ?auto_216945 ?auto_216943 )
      ( DELIVER-3PKG-VERIFY ?auto_216944 ?auto_216945 ?auto_216946 ?auto_216943 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_216958 - OBJ
      ?auto_216959 - OBJ
      ?auto_216960 - OBJ
      ?auto_216957 - LOCATION
    )
    :vars
    (
      ?auto_216962 - TRUCK
      ?auto_216963 - LOCATION
      ?auto_216961 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216962 ?auto_216963 ) ( IN-CITY ?auto_216963 ?auto_216961 ) ( IN-CITY ?auto_216957 ?auto_216961 ) ( not ( = ?auto_216957 ?auto_216963 ) ) ( OBJ-AT ?auto_216959 ?auto_216957 ) ( not ( = ?auto_216959 ?auto_216958 ) ) ( OBJ-AT ?auto_216958 ?auto_216963 ) ( OBJ-AT ?auto_216960 ?auto_216957 ) ( not ( = ?auto_216958 ?auto_216960 ) ) ( not ( = ?auto_216959 ?auto_216960 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216959 ?auto_216958 ?auto_216957 )
      ( DELIVER-3PKG-VERIFY ?auto_216958 ?auto_216959 ?auto_216960 ?auto_216957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216987 - OBJ
      ?auto_216988 - OBJ
      ?auto_216989 - OBJ
      ?auto_216990 - OBJ
      ?auto_216986 - LOCATION
    )
    :vars
    (
      ?auto_216992 - TRUCK
      ?auto_216993 - LOCATION
      ?auto_216991 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_216992 ?auto_216993 ) ( IN-CITY ?auto_216993 ?auto_216991 ) ( IN-CITY ?auto_216986 ?auto_216991 ) ( not ( = ?auto_216986 ?auto_216993 ) ) ( OBJ-AT ?auto_216988 ?auto_216986 ) ( not ( = ?auto_216988 ?auto_216990 ) ) ( OBJ-AT ?auto_216990 ?auto_216993 ) ( OBJ-AT ?auto_216987 ?auto_216986 ) ( OBJ-AT ?auto_216989 ?auto_216986 ) ( not ( = ?auto_216987 ?auto_216988 ) ) ( not ( = ?auto_216987 ?auto_216989 ) ) ( not ( = ?auto_216987 ?auto_216990 ) ) ( not ( = ?auto_216988 ?auto_216989 ) ) ( not ( = ?auto_216989 ?auto_216990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216988 ?auto_216990 ?auto_216986 )
      ( DELIVER-4PKG-VERIFY ?auto_216987 ?auto_216988 ?auto_216989 ?auto_216990 ?auto_216986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_216995 - OBJ
      ?auto_216996 - OBJ
      ?auto_216997 - OBJ
      ?auto_216998 - OBJ
      ?auto_216994 - LOCATION
    )
    :vars
    (
      ?auto_217000 - TRUCK
      ?auto_217001 - LOCATION
      ?auto_216999 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217000 ?auto_217001 ) ( IN-CITY ?auto_217001 ?auto_216999 ) ( IN-CITY ?auto_216994 ?auto_216999 ) ( not ( = ?auto_216994 ?auto_217001 ) ) ( OBJ-AT ?auto_216996 ?auto_216994 ) ( not ( = ?auto_216996 ?auto_216997 ) ) ( OBJ-AT ?auto_216997 ?auto_217001 ) ( OBJ-AT ?auto_216995 ?auto_216994 ) ( OBJ-AT ?auto_216998 ?auto_216994 ) ( not ( = ?auto_216995 ?auto_216996 ) ) ( not ( = ?auto_216995 ?auto_216997 ) ) ( not ( = ?auto_216995 ?auto_216998 ) ) ( not ( = ?auto_216996 ?auto_216998 ) ) ( not ( = ?auto_216997 ?auto_216998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_216996 ?auto_216997 ?auto_216994 )
      ( DELIVER-4PKG-VERIFY ?auto_216995 ?auto_216996 ?auto_216997 ?auto_216998 ?auto_216994 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217011 - OBJ
      ?auto_217012 - OBJ
      ?auto_217013 - OBJ
      ?auto_217014 - OBJ
      ?auto_217010 - LOCATION
    )
    :vars
    (
      ?auto_217016 - TRUCK
      ?auto_217017 - LOCATION
      ?auto_217015 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217016 ?auto_217017 ) ( IN-CITY ?auto_217017 ?auto_217015 ) ( IN-CITY ?auto_217010 ?auto_217015 ) ( not ( = ?auto_217010 ?auto_217017 ) ) ( OBJ-AT ?auto_217013 ?auto_217010 ) ( not ( = ?auto_217013 ?auto_217012 ) ) ( OBJ-AT ?auto_217012 ?auto_217017 ) ( OBJ-AT ?auto_217011 ?auto_217010 ) ( OBJ-AT ?auto_217014 ?auto_217010 ) ( not ( = ?auto_217011 ?auto_217012 ) ) ( not ( = ?auto_217011 ?auto_217013 ) ) ( not ( = ?auto_217011 ?auto_217014 ) ) ( not ( = ?auto_217012 ?auto_217014 ) ) ( not ( = ?auto_217013 ?auto_217014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217013 ?auto_217012 ?auto_217010 )
      ( DELIVER-4PKG-VERIFY ?auto_217011 ?auto_217012 ?auto_217013 ?auto_217014 ?auto_217010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217043 - OBJ
      ?auto_217044 - OBJ
      ?auto_217045 - OBJ
      ?auto_217046 - OBJ
      ?auto_217042 - LOCATION
    )
    :vars
    (
      ?auto_217048 - TRUCK
      ?auto_217049 - LOCATION
      ?auto_217047 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217048 ?auto_217049 ) ( IN-CITY ?auto_217049 ?auto_217047 ) ( IN-CITY ?auto_217042 ?auto_217047 ) ( not ( = ?auto_217042 ?auto_217049 ) ) ( OBJ-AT ?auto_217046 ?auto_217042 ) ( not ( = ?auto_217046 ?auto_217043 ) ) ( OBJ-AT ?auto_217043 ?auto_217049 ) ( OBJ-AT ?auto_217044 ?auto_217042 ) ( OBJ-AT ?auto_217045 ?auto_217042 ) ( not ( = ?auto_217043 ?auto_217044 ) ) ( not ( = ?auto_217043 ?auto_217045 ) ) ( not ( = ?auto_217044 ?auto_217045 ) ) ( not ( = ?auto_217044 ?auto_217046 ) ) ( not ( = ?auto_217045 ?auto_217046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217046 ?auto_217043 ?auto_217042 )
      ( DELIVER-4PKG-VERIFY ?auto_217043 ?auto_217044 ?auto_217045 ?auto_217046 ?auto_217042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217108 - OBJ
      ?auto_217109 - OBJ
      ?auto_217110 - OBJ
      ?auto_217111 - OBJ
      ?auto_217112 - OBJ
      ?auto_217107 - LOCATION
    )
    :vars
    (
      ?auto_217114 - TRUCK
      ?auto_217115 - LOCATION
      ?auto_217113 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217114 ?auto_217115 ) ( IN-CITY ?auto_217115 ?auto_217113 ) ( IN-CITY ?auto_217107 ?auto_217113 ) ( not ( = ?auto_217107 ?auto_217115 ) ) ( OBJ-AT ?auto_217110 ?auto_217107 ) ( not ( = ?auto_217110 ?auto_217112 ) ) ( OBJ-AT ?auto_217112 ?auto_217115 ) ( OBJ-AT ?auto_217108 ?auto_217107 ) ( OBJ-AT ?auto_217109 ?auto_217107 ) ( OBJ-AT ?auto_217111 ?auto_217107 ) ( not ( = ?auto_217108 ?auto_217109 ) ) ( not ( = ?auto_217108 ?auto_217110 ) ) ( not ( = ?auto_217108 ?auto_217111 ) ) ( not ( = ?auto_217108 ?auto_217112 ) ) ( not ( = ?auto_217109 ?auto_217110 ) ) ( not ( = ?auto_217109 ?auto_217111 ) ) ( not ( = ?auto_217109 ?auto_217112 ) ) ( not ( = ?auto_217110 ?auto_217111 ) ) ( not ( = ?auto_217111 ?auto_217112 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217110 ?auto_217112 ?auto_217107 )
      ( DELIVER-5PKG-VERIFY ?auto_217108 ?auto_217109 ?auto_217110 ?auto_217111 ?auto_217112 ?auto_217107 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217117 - OBJ
      ?auto_217118 - OBJ
      ?auto_217119 - OBJ
      ?auto_217120 - OBJ
      ?auto_217121 - OBJ
      ?auto_217116 - LOCATION
    )
    :vars
    (
      ?auto_217123 - TRUCK
      ?auto_217124 - LOCATION
      ?auto_217122 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217123 ?auto_217124 ) ( IN-CITY ?auto_217124 ?auto_217122 ) ( IN-CITY ?auto_217116 ?auto_217122 ) ( not ( = ?auto_217116 ?auto_217124 ) ) ( OBJ-AT ?auto_217121 ?auto_217116 ) ( not ( = ?auto_217121 ?auto_217120 ) ) ( OBJ-AT ?auto_217120 ?auto_217124 ) ( OBJ-AT ?auto_217117 ?auto_217116 ) ( OBJ-AT ?auto_217118 ?auto_217116 ) ( OBJ-AT ?auto_217119 ?auto_217116 ) ( not ( = ?auto_217117 ?auto_217118 ) ) ( not ( = ?auto_217117 ?auto_217119 ) ) ( not ( = ?auto_217117 ?auto_217120 ) ) ( not ( = ?auto_217117 ?auto_217121 ) ) ( not ( = ?auto_217118 ?auto_217119 ) ) ( not ( = ?auto_217118 ?auto_217120 ) ) ( not ( = ?auto_217118 ?auto_217121 ) ) ( not ( = ?auto_217119 ?auto_217120 ) ) ( not ( = ?auto_217119 ?auto_217121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217121 ?auto_217120 ?auto_217116 )
      ( DELIVER-5PKG-VERIFY ?auto_217117 ?auto_217118 ?auto_217119 ?auto_217120 ?auto_217121 ?auto_217116 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217135 - OBJ
      ?auto_217136 - OBJ
      ?auto_217137 - OBJ
      ?auto_217138 - OBJ
      ?auto_217139 - OBJ
      ?auto_217134 - LOCATION
    )
    :vars
    (
      ?auto_217141 - TRUCK
      ?auto_217142 - LOCATION
      ?auto_217140 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217141 ?auto_217142 ) ( IN-CITY ?auto_217142 ?auto_217140 ) ( IN-CITY ?auto_217134 ?auto_217140 ) ( not ( = ?auto_217134 ?auto_217142 ) ) ( OBJ-AT ?auto_217136 ?auto_217134 ) ( not ( = ?auto_217136 ?auto_217137 ) ) ( OBJ-AT ?auto_217137 ?auto_217142 ) ( OBJ-AT ?auto_217135 ?auto_217134 ) ( OBJ-AT ?auto_217138 ?auto_217134 ) ( OBJ-AT ?auto_217139 ?auto_217134 ) ( not ( = ?auto_217135 ?auto_217136 ) ) ( not ( = ?auto_217135 ?auto_217137 ) ) ( not ( = ?auto_217135 ?auto_217138 ) ) ( not ( = ?auto_217135 ?auto_217139 ) ) ( not ( = ?auto_217136 ?auto_217138 ) ) ( not ( = ?auto_217136 ?auto_217139 ) ) ( not ( = ?auto_217137 ?auto_217138 ) ) ( not ( = ?auto_217137 ?auto_217139 ) ) ( not ( = ?auto_217138 ?auto_217139 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217136 ?auto_217137 ?auto_217134 )
      ( DELIVER-5PKG-VERIFY ?auto_217135 ?auto_217136 ?auto_217137 ?auto_217138 ?auto_217139 ?auto_217134 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217171 - OBJ
      ?auto_217172 - OBJ
      ?auto_217173 - OBJ
      ?auto_217174 - OBJ
      ?auto_217175 - OBJ
      ?auto_217170 - LOCATION
    )
    :vars
    (
      ?auto_217177 - TRUCK
      ?auto_217178 - LOCATION
      ?auto_217176 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217177 ?auto_217178 ) ( IN-CITY ?auto_217178 ?auto_217176 ) ( IN-CITY ?auto_217170 ?auto_217176 ) ( not ( = ?auto_217170 ?auto_217178 ) ) ( OBJ-AT ?auto_217173 ?auto_217170 ) ( not ( = ?auto_217173 ?auto_217172 ) ) ( OBJ-AT ?auto_217172 ?auto_217178 ) ( OBJ-AT ?auto_217171 ?auto_217170 ) ( OBJ-AT ?auto_217174 ?auto_217170 ) ( OBJ-AT ?auto_217175 ?auto_217170 ) ( not ( = ?auto_217171 ?auto_217172 ) ) ( not ( = ?auto_217171 ?auto_217173 ) ) ( not ( = ?auto_217171 ?auto_217174 ) ) ( not ( = ?auto_217171 ?auto_217175 ) ) ( not ( = ?auto_217172 ?auto_217174 ) ) ( not ( = ?auto_217172 ?auto_217175 ) ) ( not ( = ?auto_217173 ?auto_217174 ) ) ( not ( = ?auto_217173 ?auto_217175 ) ) ( not ( = ?auto_217174 ?auto_217175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217173 ?auto_217172 ?auto_217170 )
      ( DELIVER-5PKG-VERIFY ?auto_217171 ?auto_217172 ?auto_217173 ?auto_217174 ?auto_217175 ?auto_217170 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217243 - OBJ
      ?auto_217244 - OBJ
      ?auto_217245 - OBJ
      ?auto_217246 - OBJ
      ?auto_217247 - OBJ
      ?auto_217242 - LOCATION
    )
    :vars
    (
      ?auto_217249 - TRUCK
      ?auto_217250 - LOCATION
      ?auto_217248 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_217249 ?auto_217250 ) ( IN-CITY ?auto_217250 ?auto_217248 ) ( IN-CITY ?auto_217242 ?auto_217248 ) ( not ( = ?auto_217242 ?auto_217250 ) ) ( OBJ-AT ?auto_217246 ?auto_217242 ) ( not ( = ?auto_217246 ?auto_217243 ) ) ( OBJ-AT ?auto_217243 ?auto_217250 ) ( OBJ-AT ?auto_217244 ?auto_217242 ) ( OBJ-AT ?auto_217245 ?auto_217242 ) ( OBJ-AT ?auto_217247 ?auto_217242 ) ( not ( = ?auto_217243 ?auto_217244 ) ) ( not ( = ?auto_217243 ?auto_217245 ) ) ( not ( = ?auto_217243 ?auto_217247 ) ) ( not ( = ?auto_217244 ?auto_217245 ) ) ( not ( = ?auto_217244 ?auto_217246 ) ) ( not ( = ?auto_217244 ?auto_217247 ) ) ( not ( = ?auto_217245 ?auto_217246 ) ) ( not ( = ?auto_217245 ?auto_217247 ) ) ( not ( = ?auto_217246 ?auto_217247 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217246 ?auto_217243 ?auto_217242 )
      ( DELIVER-5PKG-VERIFY ?auto_217243 ?auto_217244 ?auto_217245 ?auto_217246 ?auto_217247 ?auto_217242 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217388 - OBJ
      ?auto_217387 - LOCATION
    )
    :vars
    (
      ?auto_217392 - LOCATION
      ?auto_217389 - CITY
      ?auto_217390 - OBJ
      ?auto_217391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217392 ?auto_217389 ) ( IN-CITY ?auto_217387 ?auto_217389 ) ( not ( = ?auto_217387 ?auto_217392 ) ) ( OBJ-AT ?auto_217390 ?auto_217387 ) ( not ( = ?auto_217390 ?auto_217388 ) ) ( OBJ-AT ?auto_217388 ?auto_217392 ) ( TRUCK-AT ?auto_217391 ?auto_217387 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_217391 ?auto_217387 ?auto_217392 ?auto_217389 )
      ( DELIVER-2PKG ?auto_217390 ?auto_217388 ?auto_217387 )
      ( DELIVER-1PKG-VERIFY ?auto_217388 ?auto_217387 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217394 - OBJ
      ?auto_217395 - OBJ
      ?auto_217393 - LOCATION
    )
    :vars
    (
      ?auto_217397 - LOCATION
      ?auto_217396 - CITY
      ?auto_217398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217397 ?auto_217396 ) ( IN-CITY ?auto_217393 ?auto_217396 ) ( not ( = ?auto_217393 ?auto_217397 ) ) ( OBJ-AT ?auto_217394 ?auto_217393 ) ( not ( = ?auto_217394 ?auto_217395 ) ) ( OBJ-AT ?auto_217395 ?auto_217397 ) ( TRUCK-AT ?auto_217398 ?auto_217393 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217395 ?auto_217393 )
      ( DELIVER-2PKG-VERIFY ?auto_217394 ?auto_217395 ?auto_217393 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217400 - OBJ
      ?auto_217401 - OBJ
      ?auto_217399 - LOCATION
    )
    :vars
    (
      ?auto_217404 - LOCATION
      ?auto_217402 - CITY
      ?auto_217403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217404 ?auto_217402 ) ( IN-CITY ?auto_217399 ?auto_217402 ) ( not ( = ?auto_217399 ?auto_217404 ) ) ( OBJ-AT ?auto_217401 ?auto_217399 ) ( not ( = ?auto_217401 ?auto_217400 ) ) ( OBJ-AT ?auto_217400 ?auto_217404 ) ( TRUCK-AT ?auto_217403 ?auto_217399 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217401 ?auto_217400 ?auto_217399 )
      ( DELIVER-2PKG-VERIFY ?auto_217400 ?auto_217401 ?auto_217399 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217413 - OBJ
      ?auto_217414 - OBJ
      ?auto_217415 - OBJ
      ?auto_217412 - LOCATION
    )
    :vars
    (
      ?auto_217418 - LOCATION
      ?auto_217416 - CITY
      ?auto_217417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217418 ?auto_217416 ) ( IN-CITY ?auto_217412 ?auto_217416 ) ( not ( = ?auto_217412 ?auto_217418 ) ) ( OBJ-AT ?auto_217413 ?auto_217412 ) ( not ( = ?auto_217413 ?auto_217415 ) ) ( OBJ-AT ?auto_217415 ?auto_217418 ) ( TRUCK-AT ?auto_217417 ?auto_217412 ) ( OBJ-AT ?auto_217414 ?auto_217412 ) ( not ( = ?auto_217413 ?auto_217414 ) ) ( not ( = ?auto_217414 ?auto_217415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217413 ?auto_217415 ?auto_217412 )
      ( DELIVER-3PKG-VERIFY ?auto_217413 ?auto_217414 ?auto_217415 ?auto_217412 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217420 - OBJ
      ?auto_217421 - OBJ
      ?auto_217422 - OBJ
      ?auto_217419 - LOCATION
    )
    :vars
    (
      ?auto_217425 - LOCATION
      ?auto_217423 - CITY
      ?auto_217424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217425 ?auto_217423 ) ( IN-CITY ?auto_217419 ?auto_217423 ) ( not ( = ?auto_217419 ?auto_217425 ) ) ( OBJ-AT ?auto_217420 ?auto_217419 ) ( not ( = ?auto_217420 ?auto_217421 ) ) ( OBJ-AT ?auto_217421 ?auto_217425 ) ( TRUCK-AT ?auto_217424 ?auto_217419 ) ( OBJ-AT ?auto_217422 ?auto_217419 ) ( not ( = ?auto_217420 ?auto_217422 ) ) ( not ( = ?auto_217421 ?auto_217422 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217420 ?auto_217421 ?auto_217419 )
      ( DELIVER-3PKG-VERIFY ?auto_217420 ?auto_217421 ?auto_217422 ?auto_217419 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_217434 - OBJ
      ?auto_217435 - OBJ
      ?auto_217436 - OBJ
      ?auto_217433 - LOCATION
    )
    :vars
    (
      ?auto_217439 - LOCATION
      ?auto_217437 - CITY
      ?auto_217438 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217439 ?auto_217437 ) ( IN-CITY ?auto_217433 ?auto_217437 ) ( not ( = ?auto_217433 ?auto_217439 ) ) ( OBJ-AT ?auto_217435 ?auto_217433 ) ( not ( = ?auto_217435 ?auto_217434 ) ) ( OBJ-AT ?auto_217434 ?auto_217439 ) ( TRUCK-AT ?auto_217438 ?auto_217433 ) ( OBJ-AT ?auto_217436 ?auto_217433 ) ( not ( = ?auto_217434 ?auto_217436 ) ) ( not ( = ?auto_217435 ?auto_217436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217435 ?auto_217434 ?auto_217433 )
      ( DELIVER-3PKG-VERIFY ?auto_217434 ?auto_217435 ?auto_217436 ?auto_217433 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217463 - OBJ
      ?auto_217464 - OBJ
      ?auto_217465 - OBJ
      ?auto_217466 - OBJ
      ?auto_217462 - LOCATION
    )
    :vars
    (
      ?auto_217469 - LOCATION
      ?auto_217467 - CITY
      ?auto_217468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217469 ?auto_217467 ) ( IN-CITY ?auto_217462 ?auto_217467 ) ( not ( = ?auto_217462 ?auto_217469 ) ) ( OBJ-AT ?auto_217463 ?auto_217462 ) ( not ( = ?auto_217463 ?auto_217466 ) ) ( OBJ-AT ?auto_217466 ?auto_217469 ) ( TRUCK-AT ?auto_217468 ?auto_217462 ) ( OBJ-AT ?auto_217464 ?auto_217462 ) ( OBJ-AT ?auto_217465 ?auto_217462 ) ( not ( = ?auto_217463 ?auto_217464 ) ) ( not ( = ?auto_217463 ?auto_217465 ) ) ( not ( = ?auto_217464 ?auto_217465 ) ) ( not ( = ?auto_217464 ?auto_217466 ) ) ( not ( = ?auto_217465 ?auto_217466 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217463 ?auto_217466 ?auto_217462 )
      ( DELIVER-4PKG-VERIFY ?auto_217463 ?auto_217464 ?auto_217465 ?auto_217466 ?auto_217462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217471 - OBJ
      ?auto_217472 - OBJ
      ?auto_217473 - OBJ
      ?auto_217474 - OBJ
      ?auto_217470 - LOCATION
    )
    :vars
    (
      ?auto_217477 - LOCATION
      ?auto_217475 - CITY
      ?auto_217476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217477 ?auto_217475 ) ( IN-CITY ?auto_217470 ?auto_217475 ) ( not ( = ?auto_217470 ?auto_217477 ) ) ( OBJ-AT ?auto_217474 ?auto_217470 ) ( not ( = ?auto_217474 ?auto_217473 ) ) ( OBJ-AT ?auto_217473 ?auto_217477 ) ( TRUCK-AT ?auto_217476 ?auto_217470 ) ( OBJ-AT ?auto_217471 ?auto_217470 ) ( OBJ-AT ?auto_217472 ?auto_217470 ) ( not ( = ?auto_217471 ?auto_217472 ) ) ( not ( = ?auto_217471 ?auto_217473 ) ) ( not ( = ?auto_217471 ?auto_217474 ) ) ( not ( = ?auto_217472 ?auto_217473 ) ) ( not ( = ?auto_217472 ?auto_217474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217474 ?auto_217473 ?auto_217470 )
      ( DELIVER-4PKG-VERIFY ?auto_217471 ?auto_217472 ?auto_217473 ?auto_217474 ?auto_217470 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217487 - OBJ
      ?auto_217488 - OBJ
      ?auto_217489 - OBJ
      ?auto_217490 - OBJ
      ?auto_217486 - LOCATION
    )
    :vars
    (
      ?auto_217493 - LOCATION
      ?auto_217491 - CITY
      ?auto_217492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217493 ?auto_217491 ) ( IN-CITY ?auto_217486 ?auto_217491 ) ( not ( = ?auto_217486 ?auto_217493 ) ) ( OBJ-AT ?auto_217487 ?auto_217486 ) ( not ( = ?auto_217487 ?auto_217488 ) ) ( OBJ-AT ?auto_217488 ?auto_217493 ) ( TRUCK-AT ?auto_217492 ?auto_217486 ) ( OBJ-AT ?auto_217489 ?auto_217486 ) ( OBJ-AT ?auto_217490 ?auto_217486 ) ( not ( = ?auto_217487 ?auto_217489 ) ) ( not ( = ?auto_217487 ?auto_217490 ) ) ( not ( = ?auto_217488 ?auto_217489 ) ) ( not ( = ?auto_217488 ?auto_217490 ) ) ( not ( = ?auto_217489 ?auto_217490 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217487 ?auto_217488 ?auto_217486 )
      ( DELIVER-4PKG-VERIFY ?auto_217487 ?auto_217488 ?auto_217489 ?auto_217490 ?auto_217486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_217519 - OBJ
      ?auto_217520 - OBJ
      ?auto_217521 - OBJ
      ?auto_217522 - OBJ
      ?auto_217518 - LOCATION
    )
    :vars
    (
      ?auto_217525 - LOCATION
      ?auto_217523 - CITY
      ?auto_217524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217525 ?auto_217523 ) ( IN-CITY ?auto_217518 ?auto_217523 ) ( not ( = ?auto_217518 ?auto_217525 ) ) ( OBJ-AT ?auto_217521 ?auto_217518 ) ( not ( = ?auto_217521 ?auto_217519 ) ) ( OBJ-AT ?auto_217519 ?auto_217525 ) ( TRUCK-AT ?auto_217524 ?auto_217518 ) ( OBJ-AT ?auto_217520 ?auto_217518 ) ( OBJ-AT ?auto_217522 ?auto_217518 ) ( not ( = ?auto_217519 ?auto_217520 ) ) ( not ( = ?auto_217519 ?auto_217522 ) ) ( not ( = ?auto_217520 ?auto_217521 ) ) ( not ( = ?auto_217520 ?auto_217522 ) ) ( not ( = ?auto_217521 ?auto_217522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217521 ?auto_217519 ?auto_217518 )
      ( DELIVER-4PKG-VERIFY ?auto_217519 ?auto_217520 ?auto_217521 ?auto_217522 ?auto_217518 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217584 - OBJ
      ?auto_217585 - OBJ
      ?auto_217586 - OBJ
      ?auto_217587 - OBJ
      ?auto_217588 - OBJ
      ?auto_217583 - LOCATION
    )
    :vars
    (
      ?auto_217591 - LOCATION
      ?auto_217589 - CITY
      ?auto_217590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217591 ?auto_217589 ) ( IN-CITY ?auto_217583 ?auto_217589 ) ( not ( = ?auto_217583 ?auto_217591 ) ) ( OBJ-AT ?auto_217587 ?auto_217583 ) ( not ( = ?auto_217587 ?auto_217588 ) ) ( OBJ-AT ?auto_217588 ?auto_217591 ) ( TRUCK-AT ?auto_217590 ?auto_217583 ) ( OBJ-AT ?auto_217584 ?auto_217583 ) ( OBJ-AT ?auto_217585 ?auto_217583 ) ( OBJ-AT ?auto_217586 ?auto_217583 ) ( not ( = ?auto_217584 ?auto_217585 ) ) ( not ( = ?auto_217584 ?auto_217586 ) ) ( not ( = ?auto_217584 ?auto_217587 ) ) ( not ( = ?auto_217584 ?auto_217588 ) ) ( not ( = ?auto_217585 ?auto_217586 ) ) ( not ( = ?auto_217585 ?auto_217587 ) ) ( not ( = ?auto_217585 ?auto_217588 ) ) ( not ( = ?auto_217586 ?auto_217587 ) ) ( not ( = ?auto_217586 ?auto_217588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217587 ?auto_217588 ?auto_217583 )
      ( DELIVER-5PKG-VERIFY ?auto_217584 ?auto_217585 ?auto_217586 ?auto_217587 ?auto_217588 ?auto_217583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217593 - OBJ
      ?auto_217594 - OBJ
      ?auto_217595 - OBJ
      ?auto_217596 - OBJ
      ?auto_217597 - OBJ
      ?auto_217592 - LOCATION
    )
    :vars
    (
      ?auto_217600 - LOCATION
      ?auto_217598 - CITY
      ?auto_217599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217600 ?auto_217598 ) ( IN-CITY ?auto_217592 ?auto_217598 ) ( not ( = ?auto_217592 ?auto_217600 ) ) ( OBJ-AT ?auto_217594 ?auto_217592 ) ( not ( = ?auto_217594 ?auto_217596 ) ) ( OBJ-AT ?auto_217596 ?auto_217600 ) ( TRUCK-AT ?auto_217599 ?auto_217592 ) ( OBJ-AT ?auto_217593 ?auto_217592 ) ( OBJ-AT ?auto_217595 ?auto_217592 ) ( OBJ-AT ?auto_217597 ?auto_217592 ) ( not ( = ?auto_217593 ?auto_217594 ) ) ( not ( = ?auto_217593 ?auto_217595 ) ) ( not ( = ?auto_217593 ?auto_217596 ) ) ( not ( = ?auto_217593 ?auto_217597 ) ) ( not ( = ?auto_217594 ?auto_217595 ) ) ( not ( = ?auto_217594 ?auto_217597 ) ) ( not ( = ?auto_217595 ?auto_217596 ) ) ( not ( = ?auto_217595 ?auto_217597 ) ) ( not ( = ?auto_217596 ?auto_217597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217594 ?auto_217596 ?auto_217592 )
      ( DELIVER-5PKG-VERIFY ?auto_217593 ?auto_217594 ?auto_217595 ?auto_217596 ?auto_217597 ?auto_217592 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217611 - OBJ
      ?auto_217612 - OBJ
      ?auto_217613 - OBJ
      ?auto_217614 - OBJ
      ?auto_217615 - OBJ
      ?auto_217610 - LOCATION
    )
    :vars
    (
      ?auto_217618 - LOCATION
      ?auto_217616 - CITY
      ?auto_217617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217618 ?auto_217616 ) ( IN-CITY ?auto_217610 ?auto_217616 ) ( not ( = ?auto_217610 ?auto_217618 ) ) ( OBJ-AT ?auto_217611 ?auto_217610 ) ( not ( = ?auto_217611 ?auto_217613 ) ) ( OBJ-AT ?auto_217613 ?auto_217618 ) ( TRUCK-AT ?auto_217617 ?auto_217610 ) ( OBJ-AT ?auto_217612 ?auto_217610 ) ( OBJ-AT ?auto_217614 ?auto_217610 ) ( OBJ-AT ?auto_217615 ?auto_217610 ) ( not ( = ?auto_217611 ?auto_217612 ) ) ( not ( = ?auto_217611 ?auto_217614 ) ) ( not ( = ?auto_217611 ?auto_217615 ) ) ( not ( = ?auto_217612 ?auto_217613 ) ) ( not ( = ?auto_217612 ?auto_217614 ) ) ( not ( = ?auto_217612 ?auto_217615 ) ) ( not ( = ?auto_217613 ?auto_217614 ) ) ( not ( = ?auto_217613 ?auto_217615 ) ) ( not ( = ?auto_217614 ?auto_217615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217611 ?auto_217613 ?auto_217610 )
      ( DELIVER-5PKG-VERIFY ?auto_217611 ?auto_217612 ?auto_217613 ?auto_217614 ?auto_217615 ?auto_217610 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217647 - OBJ
      ?auto_217648 - OBJ
      ?auto_217649 - OBJ
      ?auto_217650 - OBJ
      ?auto_217651 - OBJ
      ?auto_217646 - LOCATION
    )
    :vars
    (
      ?auto_217654 - LOCATION
      ?auto_217652 - CITY
      ?auto_217653 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217654 ?auto_217652 ) ( IN-CITY ?auto_217646 ?auto_217652 ) ( not ( = ?auto_217646 ?auto_217654 ) ) ( OBJ-AT ?auto_217649 ?auto_217646 ) ( not ( = ?auto_217649 ?auto_217648 ) ) ( OBJ-AT ?auto_217648 ?auto_217654 ) ( TRUCK-AT ?auto_217653 ?auto_217646 ) ( OBJ-AT ?auto_217647 ?auto_217646 ) ( OBJ-AT ?auto_217650 ?auto_217646 ) ( OBJ-AT ?auto_217651 ?auto_217646 ) ( not ( = ?auto_217647 ?auto_217648 ) ) ( not ( = ?auto_217647 ?auto_217649 ) ) ( not ( = ?auto_217647 ?auto_217650 ) ) ( not ( = ?auto_217647 ?auto_217651 ) ) ( not ( = ?auto_217648 ?auto_217650 ) ) ( not ( = ?auto_217648 ?auto_217651 ) ) ( not ( = ?auto_217649 ?auto_217650 ) ) ( not ( = ?auto_217649 ?auto_217651 ) ) ( not ( = ?auto_217650 ?auto_217651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217649 ?auto_217648 ?auto_217646 )
      ( DELIVER-5PKG-VERIFY ?auto_217647 ?auto_217648 ?auto_217649 ?auto_217650 ?auto_217651 ?auto_217646 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217719 - OBJ
      ?auto_217720 - OBJ
      ?auto_217721 - OBJ
      ?auto_217722 - OBJ
      ?auto_217723 - OBJ
      ?auto_217718 - LOCATION
    )
    :vars
    (
      ?auto_217726 - LOCATION
      ?auto_217724 - CITY
      ?auto_217725 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217726 ?auto_217724 ) ( IN-CITY ?auto_217718 ?auto_217724 ) ( not ( = ?auto_217718 ?auto_217726 ) ) ( OBJ-AT ?auto_217722 ?auto_217718 ) ( not ( = ?auto_217722 ?auto_217719 ) ) ( OBJ-AT ?auto_217719 ?auto_217726 ) ( TRUCK-AT ?auto_217725 ?auto_217718 ) ( OBJ-AT ?auto_217720 ?auto_217718 ) ( OBJ-AT ?auto_217721 ?auto_217718 ) ( OBJ-AT ?auto_217723 ?auto_217718 ) ( not ( = ?auto_217719 ?auto_217720 ) ) ( not ( = ?auto_217719 ?auto_217721 ) ) ( not ( = ?auto_217719 ?auto_217723 ) ) ( not ( = ?auto_217720 ?auto_217721 ) ) ( not ( = ?auto_217720 ?auto_217722 ) ) ( not ( = ?auto_217720 ?auto_217723 ) ) ( not ( = ?auto_217721 ?auto_217722 ) ) ( not ( = ?auto_217721 ?auto_217723 ) ) ( not ( = ?auto_217722 ?auto_217723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217722 ?auto_217719 ?auto_217718 )
      ( DELIVER-5PKG-VERIFY ?auto_217719 ?auto_217720 ?auto_217721 ?auto_217722 ?auto_217723 ?auto_217718 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_217864 - OBJ
      ?auto_217863 - LOCATION
    )
    :vars
    (
      ?auto_217868 - LOCATION
      ?auto_217866 - CITY
      ?auto_217865 - OBJ
      ?auto_217867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217868 ?auto_217866 ) ( IN-CITY ?auto_217863 ?auto_217866 ) ( not ( = ?auto_217863 ?auto_217868 ) ) ( not ( = ?auto_217865 ?auto_217864 ) ) ( OBJ-AT ?auto_217864 ?auto_217868 ) ( TRUCK-AT ?auto_217867 ?auto_217863 ) ( IN-TRUCK ?auto_217865 ?auto_217867 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217865 ?auto_217863 )
      ( DELIVER-2PKG ?auto_217865 ?auto_217864 ?auto_217863 )
      ( DELIVER-1PKG-VERIFY ?auto_217864 ?auto_217863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217870 - OBJ
      ?auto_217871 - OBJ
      ?auto_217869 - LOCATION
    )
    :vars
    (
      ?auto_217873 - LOCATION
      ?auto_217872 - CITY
      ?auto_217874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217873 ?auto_217872 ) ( IN-CITY ?auto_217869 ?auto_217872 ) ( not ( = ?auto_217869 ?auto_217873 ) ) ( not ( = ?auto_217870 ?auto_217871 ) ) ( OBJ-AT ?auto_217871 ?auto_217873 ) ( TRUCK-AT ?auto_217874 ?auto_217869 ) ( IN-TRUCK ?auto_217870 ?auto_217874 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_217871 ?auto_217869 )
      ( DELIVER-2PKG-VERIFY ?auto_217870 ?auto_217871 ?auto_217869 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_217876 - OBJ
      ?auto_217877 - OBJ
      ?auto_217875 - LOCATION
    )
    :vars
    (
      ?auto_217878 - LOCATION
      ?auto_217880 - CITY
      ?auto_217879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217878 ?auto_217880 ) ( IN-CITY ?auto_217875 ?auto_217880 ) ( not ( = ?auto_217875 ?auto_217878 ) ) ( not ( = ?auto_217877 ?auto_217876 ) ) ( OBJ-AT ?auto_217876 ?auto_217878 ) ( TRUCK-AT ?auto_217879 ?auto_217875 ) ( IN-TRUCK ?auto_217877 ?auto_217879 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_217877 ?auto_217876 ?auto_217875 )
      ( DELIVER-2PKG-VERIFY ?auto_217876 ?auto_217877 ?auto_217875 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_218340 - OBJ
      ?auto_218339 - LOCATION
    )
    :vars
    (
      ?auto_218342 - LOCATION
      ?auto_218344 - CITY
      ?auto_218341 - OBJ
      ?auto_218343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218342 ?auto_218344 ) ( IN-CITY ?auto_218339 ?auto_218344 ) ( not ( = ?auto_218339 ?auto_218342 ) ) ( not ( = ?auto_218341 ?auto_218340 ) ) ( OBJ-AT ?auto_218340 ?auto_218342 ) ( IN-TRUCK ?auto_218341 ?auto_218343 ) ( TRUCK-AT ?auto_218343 ?auto_218342 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_218343 ?auto_218342 ?auto_218339 ?auto_218344 )
      ( DELIVER-2PKG ?auto_218341 ?auto_218340 ?auto_218339 )
      ( DELIVER-1PKG-VERIFY ?auto_218340 ?auto_218339 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218346 - OBJ
      ?auto_218347 - OBJ
      ?auto_218345 - LOCATION
    )
    :vars
    (
      ?auto_218348 - LOCATION
      ?auto_218350 - CITY
      ?auto_218349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218348 ?auto_218350 ) ( IN-CITY ?auto_218345 ?auto_218350 ) ( not ( = ?auto_218345 ?auto_218348 ) ) ( not ( = ?auto_218346 ?auto_218347 ) ) ( OBJ-AT ?auto_218347 ?auto_218348 ) ( IN-TRUCK ?auto_218346 ?auto_218349 ) ( TRUCK-AT ?auto_218349 ?auto_218348 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_218347 ?auto_218345 )
      ( DELIVER-2PKG-VERIFY ?auto_218346 ?auto_218347 ?auto_218345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_218352 - OBJ
      ?auto_218353 - OBJ
      ?auto_218351 - LOCATION
    )
    :vars
    (
      ?auto_218355 - LOCATION
      ?auto_218354 - CITY
      ?auto_218356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218355 ?auto_218354 ) ( IN-CITY ?auto_218351 ?auto_218354 ) ( not ( = ?auto_218351 ?auto_218355 ) ) ( not ( = ?auto_218353 ?auto_218352 ) ) ( OBJ-AT ?auto_218352 ?auto_218355 ) ( IN-TRUCK ?auto_218353 ?auto_218356 ) ( TRUCK-AT ?auto_218356 ?auto_218355 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_218353 ?auto_218352 ?auto_218351 )
      ( DELIVER-2PKG-VERIFY ?auto_218352 ?auto_218353 ?auto_218351 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223476 - OBJ
      ?auto_223477 - OBJ
      ?auto_223478 - OBJ
      ?auto_223475 - LOCATION
    )
    :vars
    (
      ?auto_223481 - TRUCK
      ?auto_223480 - LOCATION
      ?auto_223482 - CITY
      ?auto_223479 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223478 ?auto_223481 ) ( TRUCK-AT ?auto_223481 ?auto_223480 ) ( IN-CITY ?auto_223480 ?auto_223482 ) ( IN-CITY ?auto_223475 ?auto_223482 ) ( not ( = ?auto_223475 ?auto_223480 ) ) ( OBJ-AT ?auto_223479 ?auto_223475 ) ( not ( = ?auto_223479 ?auto_223478 ) ) ( OBJ-AT ?auto_223476 ?auto_223475 ) ( OBJ-AT ?auto_223477 ?auto_223475 ) ( not ( = ?auto_223476 ?auto_223477 ) ) ( not ( = ?auto_223476 ?auto_223478 ) ) ( not ( = ?auto_223476 ?auto_223479 ) ) ( not ( = ?auto_223477 ?auto_223478 ) ) ( not ( = ?auto_223477 ?auto_223479 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223479 ?auto_223478 ?auto_223475 )
      ( DELIVER-3PKG-VERIFY ?auto_223476 ?auto_223477 ?auto_223478 ?auto_223475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223488 - OBJ
      ?auto_223489 - OBJ
      ?auto_223490 - OBJ
      ?auto_223487 - LOCATION
    )
    :vars
    (
      ?auto_223493 - TRUCK
      ?auto_223492 - LOCATION
      ?auto_223494 - CITY
      ?auto_223491 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223489 ?auto_223493 ) ( TRUCK-AT ?auto_223493 ?auto_223492 ) ( IN-CITY ?auto_223492 ?auto_223494 ) ( IN-CITY ?auto_223487 ?auto_223494 ) ( not ( = ?auto_223487 ?auto_223492 ) ) ( OBJ-AT ?auto_223491 ?auto_223487 ) ( not ( = ?auto_223491 ?auto_223489 ) ) ( OBJ-AT ?auto_223488 ?auto_223487 ) ( OBJ-AT ?auto_223490 ?auto_223487 ) ( not ( = ?auto_223488 ?auto_223489 ) ) ( not ( = ?auto_223488 ?auto_223490 ) ) ( not ( = ?auto_223488 ?auto_223491 ) ) ( not ( = ?auto_223489 ?auto_223490 ) ) ( not ( = ?auto_223490 ?auto_223491 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223491 ?auto_223489 ?auto_223487 )
      ( DELIVER-3PKG-VERIFY ?auto_223488 ?auto_223489 ?auto_223490 ?auto_223487 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223504 - OBJ
      ?auto_223505 - OBJ
      ?auto_223506 - OBJ
      ?auto_223503 - LOCATION
    )
    :vars
    (
      ?auto_223508 - TRUCK
      ?auto_223507 - LOCATION
      ?auto_223509 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223504 ?auto_223508 ) ( TRUCK-AT ?auto_223508 ?auto_223507 ) ( IN-CITY ?auto_223507 ?auto_223509 ) ( IN-CITY ?auto_223503 ?auto_223509 ) ( not ( = ?auto_223503 ?auto_223507 ) ) ( OBJ-AT ?auto_223505 ?auto_223503 ) ( not ( = ?auto_223505 ?auto_223504 ) ) ( OBJ-AT ?auto_223506 ?auto_223503 ) ( not ( = ?auto_223504 ?auto_223506 ) ) ( not ( = ?auto_223505 ?auto_223506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223505 ?auto_223504 ?auto_223503 )
      ( DELIVER-3PKG-VERIFY ?auto_223504 ?auto_223505 ?auto_223506 ?auto_223503 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_223526 - OBJ
      ?auto_223527 - OBJ
      ?auto_223528 - OBJ
      ?auto_223525 - LOCATION
    )
    :vars
    (
      ?auto_223531 - TRUCK
      ?auto_223530 - LOCATION
      ?auto_223532 - CITY
      ?auto_223529 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223526 ?auto_223531 ) ( TRUCK-AT ?auto_223531 ?auto_223530 ) ( IN-CITY ?auto_223530 ?auto_223532 ) ( IN-CITY ?auto_223525 ?auto_223532 ) ( not ( = ?auto_223525 ?auto_223530 ) ) ( OBJ-AT ?auto_223529 ?auto_223525 ) ( not ( = ?auto_223529 ?auto_223526 ) ) ( OBJ-AT ?auto_223527 ?auto_223525 ) ( OBJ-AT ?auto_223528 ?auto_223525 ) ( not ( = ?auto_223526 ?auto_223527 ) ) ( not ( = ?auto_223526 ?auto_223528 ) ) ( not ( = ?auto_223527 ?auto_223528 ) ) ( not ( = ?auto_223527 ?auto_223529 ) ) ( not ( = ?auto_223528 ?auto_223529 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223529 ?auto_223526 ?auto_223525 )
      ( DELIVER-3PKG-VERIFY ?auto_223526 ?auto_223527 ?auto_223528 ?auto_223525 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223565 - OBJ
      ?auto_223566 - OBJ
      ?auto_223567 - OBJ
      ?auto_223568 - OBJ
      ?auto_223564 - LOCATION
    )
    :vars
    (
      ?auto_223570 - TRUCK
      ?auto_223569 - LOCATION
      ?auto_223571 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223568 ?auto_223570 ) ( TRUCK-AT ?auto_223570 ?auto_223569 ) ( IN-CITY ?auto_223569 ?auto_223571 ) ( IN-CITY ?auto_223564 ?auto_223571 ) ( not ( = ?auto_223564 ?auto_223569 ) ) ( OBJ-AT ?auto_223567 ?auto_223564 ) ( not ( = ?auto_223567 ?auto_223568 ) ) ( OBJ-AT ?auto_223565 ?auto_223564 ) ( OBJ-AT ?auto_223566 ?auto_223564 ) ( not ( = ?auto_223565 ?auto_223566 ) ) ( not ( = ?auto_223565 ?auto_223567 ) ) ( not ( = ?auto_223565 ?auto_223568 ) ) ( not ( = ?auto_223566 ?auto_223567 ) ) ( not ( = ?auto_223566 ?auto_223568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223567 ?auto_223568 ?auto_223564 )
      ( DELIVER-4PKG-VERIFY ?auto_223565 ?auto_223566 ?auto_223567 ?auto_223568 ?auto_223564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223621 - OBJ
      ?auto_223622 - OBJ
      ?auto_223623 - OBJ
      ?auto_223624 - OBJ
      ?auto_223620 - LOCATION
    )
    :vars
    (
      ?auto_223626 - TRUCK
      ?auto_223625 - LOCATION
      ?auto_223627 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223623 ?auto_223626 ) ( TRUCK-AT ?auto_223626 ?auto_223625 ) ( IN-CITY ?auto_223625 ?auto_223627 ) ( IN-CITY ?auto_223620 ?auto_223627 ) ( not ( = ?auto_223620 ?auto_223625 ) ) ( OBJ-AT ?auto_223621 ?auto_223620 ) ( not ( = ?auto_223621 ?auto_223623 ) ) ( OBJ-AT ?auto_223622 ?auto_223620 ) ( OBJ-AT ?auto_223624 ?auto_223620 ) ( not ( = ?auto_223621 ?auto_223622 ) ) ( not ( = ?auto_223621 ?auto_223624 ) ) ( not ( = ?auto_223622 ?auto_223623 ) ) ( not ( = ?auto_223622 ?auto_223624 ) ) ( not ( = ?auto_223623 ?auto_223624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223621 ?auto_223623 ?auto_223620 )
      ( DELIVER-4PKG-VERIFY ?auto_223621 ?auto_223622 ?auto_223623 ?auto_223624 ?auto_223620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223645 - OBJ
      ?auto_223646 - OBJ
      ?auto_223647 - OBJ
      ?auto_223648 - OBJ
      ?auto_223644 - LOCATION
    )
    :vars
    (
      ?auto_223650 - TRUCK
      ?auto_223649 - LOCATION
      ?auto_223651 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223646 ?auto_223650 ) ( TRUCK-AT ?auto_223650 ?auto_223649 ) ( IN-CITY ?auto_223649 ?auto_223651 ) ( IN-CITY ?auto_223644 ?auto_223651 ) ( not ( = ?auto_223644 ?auto_223649 ) ) ( OBJ-AT ?auto_223648 ?auto_223644 ) ( not ( = ?auto_223648 ?auto_223646 ) ) ( OBJ-AT ?auto_223645 ?auto_223644 ) ( OBJ-AT ?auto_223647 ?auto_223644 ) ( not ( = ?auto_223645 ?auto_223646 ) ) ( not ( = ?auto_223645 ?auto_223647 ) ) ( not ( = ?auto_223645 ?auto_223648 ) ) ( not ( = ?auto_223646 ?auto_223647 ) ) ( not ( = ?auto_223647 ?auto_223648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223648 ?auto_223646 ?auto_223644 )
      ( DELIVER-4PKG-VERIFY ?auto_223645 ?auto_223646 ?auto_223647 ?auto_223648 ?auto_223644 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223677 - OBJ
      ?auto_223678 - OBJ
      ?auto_223679 - OBJ
      ?auto_223680 - OBJ
      ?auto_223676 - LOCATION
    )
    :vars
    (
      ?auto_223682 - TRUCK
      ?auto_223681 - LOCATION
      ?auto_223683 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223678 ?auto_223682 ) ( TRUCK-AT ?auto_223682 ?auto_223681 ) ( IN-CITY ?auto_223681 ?auto_223683 ) ( IN-CITY ?auto_223676 ?auto_223683 ) ( not ( = ?auto_223676 ?auto_223681 ) ) ( OBJ-AT ?auto_223677 ?auto_223676 ) ( not ( = ?auto_223677 ?auto_223678 ) ) ( OBJ-AT ?auto_223679 ?auto_223676 ) ( OBJ-AT ?auto_223680 ?auto_223676 ) ( not ( = ?auto_223677 ?auto_223679 ) ) ( not ( = ?auto_223677 ?auto_223680 ) ) ( not ( = ?auto_223678 ?auto_223679 ) ) ( not ( = ?auto_223678 ?auto_223680 ) ) ( not ( = ?auto_223679 ?auto_223680 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223677 ?auto_223678 ?auto_223676 )
      ( DELIVER-4PKG-VERIFY ?auto_223677 ?auto_223678 ?auto_223679 ?auto_223680 ?auto_223676 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223725 - OBJ
      ?auto_223726 - OBJ
      ?auto_223727 - OBJ
      ?auto_223728 - OBJ
      ?auto_223724 - LOCATION
    )
    :vars
    (
      ?auto_223730 - TRUCK
      ?auto_223729 - LOCATION
      ?auto_223731 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223728 ?auto_223730 ) ( TRUCK-AT ?auto_223730 ?auto_223729 ) ( IN-CITY ?auto_223729 ?auto_223731 ) ( IN-CITY ?auto_223724 ?auto_223731 ) ( not ( = ?auto_223724 ?auto_223729 ) ) ( OBJ-AT ?auto_223726 ?auto_223724 ) ( not ( = ?auto_223726 ?auto_223728 ) ) ( OBJ-AT ?auto_223725 ?auto_223724 ) ( OBJ-AT ?auto_223727 ?auto_223724 ) ( not ( = ?auto_223725 ?auto_223726 ) ) ( not ( = ?auto_223725 ?auto_223727 ) ) ( not ( = ?auto_223725 ?auto_223728 ) ) ( not ( = ?auto_223726 ?auto_223727 ) ) ( not ( = ?auto_223727 ?auto_223728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223726 ?auto_223728 ?auto_223724 )
      ( DELIVER-4PKG-VERIFY ?auto_223725 ?auto_223726 ?auto_223727 ?auto_223728 ?auto_223724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223733 - OBJ
      ?auto_223734 - OBJ
      ?auto_223735 - OBJ
      ?auto_223736 - OBJ
      ?auto_223732 - LOCATION
    )
    :vars
    (
      ?auto_223738 - TRUCK
      ?auto_223737 - LOCATION
      ?auto_223739 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223735 ?auto_223738 ) ( TRUCK-AT ?auto_223738 ?auto_223737 ) ( IN-CITY ?auto_223737 ?auto_223739 ) ( IN-CITY ?auto_223732 ?auto_223739 ) ( not ( = ?auto_223732 ?auto_223737 ) ) ( OBJ-AT ?auto_223736 ?auto_223732 ) ( not ( = ?auto_223736 ?auto_223735 ) ) ( OBJ-AT ?auto_223733 ?auto_223732 ) ( OBJ-AT ?auto_223734 ?auto_223732 ) ( not ( = ?auto_223733 ?auto_223734 ) ) ( not ( = ?auto_223733 ?auto_223735 ) ) ( not ( = ?auto_223733 ?auto_223736 ) ) ( not ( = ?auto_223734 ?auto_223735 ) ) ( not ( = ?auto_223734 ?auto_223736 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223736 ?auto_223735 ?auto_223732 )
      ( DELIVER-4PKG-VERIFY ?auto_223733 ?auto_223734 ?auto_223735 ?auto_223736 ?auto_223732 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223765 - OBJ
      ?auto_223766 - OBJ
      ?auto_223767 - OBJ
      ?auto_223768 - OBJ
      ?auto_223764 - LOCATION
    )
    :vars
    (
      ?auto_223771 - TRUCK
      ?auto_223770 - LOCATION
      ?auto_223772 - CITY
      ?auto_223769 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223768 ?auto_223771 ) ( TRUCK-AT ?auto_223771 ?auto_223770 ) ( IN-CITY ?auto_223770 ?auto_223772 ) ( IN-CITY ?auto_223764 ?auto_223772 ) ( not ( = ?auto_223764 ?auto_223770 ) ) ( OBJ-AT ?auto_223769 ?auto_223764 ) ( not ( = ?auto_223769 ?auto_223768 ) ) ( OBJ-AT ?auto_223765 ?auto_223764 ) ( OBJ-AT ?auto_223766 ?auto_223764 ) ( OBJ-AT ?auto_223767 ?auto_223764 ) ( not ( = ?auto_223765 ?auto_223766 ) ) ( not ( = ?auto_223765 ?auto_223767 ) ) ( not ( = ?auto_223765 ?auto_223768 ) ) ( not ( = ?auto_223765 ?auto_223769 ) ) ( not ( = ?auto_223766 ?auto_223767 ) ) ( not ( = ?auto_223766 ?auto_223768 ) ) ( not ( = ?auto_223766 ?auto_223769 ) ) ( not ( = ?auto_223767 ?auto_223768 ) ) ( not ( = ?auto_223767 ?auto_223769 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223769 ?auto_223768 ?auto_223764 )
      ( DELIVER-4PKG-VERIFY ?auto_223765 ?auto_223766 ?auto_223767 ?auto_223768 ?auto_223764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223782 - OBJ
      ?auto_223783 - OBJ
      ?auto_223784 - OBJ
      ?auto_223785 - OBJ
      ?auto_223781 - LOCATION
    )
    :vars
    (
      ?auto_223788 - TRUCK
      ?auto_223787 - LOCATION
      ?auto_223789 - CITY
      ?auto_223786 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223784 ?auto_223788 ) ( TRUCK-AT ?auto_223788 ?auto_223787 ) ( IN-CITY ?auto_223787 ?auto_223789 ) ( IN-CITY ?auto_223781 ?auto_223789 ) ( not ( = ?auto_223781 ?auto_223787 ) ) ( OBJ-AT ?auto_223786 ?auto_223781 ) ( not ( = ?auto_223786 ?auto_223784 ) ) ( OBJ-AT ?auto_223782 ?auto_223781 ) ( OBJ-AT ?auto_223783 ?auto_223781 ) ( OBJ-AT ?auto_223785 ?auto_223781 ) ( not ( = ?auto_223782 ?auto_223783 ) ) ( not ( = ?auto_223782 ?auto_223784 ) ) ( not ( = ?auto_223782 ?auto_223785 ) ) ( not ( = ?auto_223782 ?auto_223786 ) ) ( not ( = ?auto_223783 ?auto_223784 ) ) ( not ( = ?auto_223783 ?auto_223785 ) ) ( not ( = ?auto_223783 ?auto_223786 ) ) ( not ( = ?auto_223784 ?auto_223785 ) ) ( not ( = ?auto_223785 ?auto_223786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223786 ?auto_223784 ?auto_223781 )
      ( DELIVER-4PKG-VERIFY ?auto_223782 ?auto_223783 ?auto_223784 ?auto_223785 ?auto_223781 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223832 - OBJ
      ?auto_223833 - OBJ
      ?auto_223834 - OBJ
      ?auto_223835 - OBJ
      ?auto_223831 - LOCATION
    )
    :vars
    (
      ?auto_223838 - TRUCK
      ?auto_223837 - LOCATION
      ?auto_223839 - CITY
      ?auto_223836 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223833 ?auto_223838 ) ( TRUCK-AT ?auto_223838 ?auto_223837 ) ( IN-CITY ?auto_223837 ?auto_223839 ) ( IN-CITY ?auto_223831 ?auto_223839 ) ( not ( = ?auto_223831 ?auto_223837 ) ) ( OBJ-AT ?auto_223836 ?auto_223831 ) ( not ( = ?auto_223836 ?auto_223833 ) ) ( OBJ-AT ?auto_223832 ?auto_223831 ) ( OBJ-AT ?auto_223834 ?auto_223831 ) ( OBJ-AT ?auto_223835 ?auto_223831 ) ( not ( = ?auto_223832 ?auto_223833 ) ) ( not ( = ?auto_223832 ?auto_223834 ) ) ( not ( = ?auto_223832 ?auto_223835 ) ) ( not ( = ?auto_223832 ?auto_223836 ) ) ( not ( = ?auto_223833 ?auto_223834 ) ) ( not ( = ?auto_223833 ?auto_223835 ) ) ( not ( = ?auto_223834 ?auto_223835 ) ) ( not ( = ?auto_223834 ?auto_223836 ) ) ( not ( = ?auto_223835 ?auto_223836 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223836 ?auto_223833 ?auto_223831 )
      ( DELIVER-4PKG-VERIFY ?auto_223832 ?auto_223833 ?auto_223834 ?auto_223835 ?auto_223831 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223884 - OBJ
      ?auto_223885 - OBJ
      ?auto_223886 - OBJ
      ?auto_223887 - OBJ
      ?auto_223883 - LOCATION
    )
    :vars
    (
      ?auto_223889 - TRUCK
      ?auto_223888 - LOCATION
      ?auto_223890 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223884 ?auto_223889 ) ( TRUCK-AT ?auto_223889 ?auto_223888 ) ( IN-CITY ?auto_223888 ?auto_223890 ) ( IN-CITY ?auto_223883 ?auto_223890 ) ( not ( = ?auto_223883 ?auto_223888 ) ) ( OBJ-AT ?auto_223885 ?auto_223883 ) ( not ( = ?auto_223885 ?auto_223884 ) ) ( OBJ-AT ?auto_223886 ?auto_223883 ) ( OBJ-AT ?auto_223887 ?auto_223883 ) ( not ( = ?auto_223884 ?auto_223886 ) ) ( not ( = ?auto_223884 ?auto_223887 ) ) ( not ( = ?auto_223885 ?auto_223886 ) ) ( not ( = ?auto_223885 ?auto_223887 ) ) ( not ( = ?auto_223886 ?auto_223887 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223885 ?auto_223884 ?auto_223883 )
      ( DELIVER-4PKG-VERIFY ?auto_223884 ?auto_223885 ?auto_223886 ?auto_223887 ?auto_223883 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223956 - OBJ
      ?auto_223957 - OBJ
      ?auto_223958 - OBJ
      ?auto_223959 - OBJ
      ?auto_223955 - LOCATION
    )
    :vars
    (
      ?auto_223961 - TRUCK
      ?auto_223960 - LOCATION
      ?auto_223962 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223956 ?auto_223961 ) ( TRUCK-AT ?auto_223961 ?auto_223960 ) ( IN-CITY ?auto_223960 ?auto_223962 ) ( IN-CITY ?auto_223955 ?auto_223962 ) ( not ( = ?auto_223955 ?auto_223960 ) ) ( OBJ-AT ?auto_223958 ?auto_223955 ) ( not ( = ?auto_223958 ?auto_223956 ) ) ( OBJ-AT ?auto_223957 ?auto_223955 ) ( OBJ-AT ?auto_223959 ?auto_223955 ) ( not ( = ?auto_223956 ?auto_223957 ) ) ( not ( = ?auto_223956 ?auto_223959 ) ) ( not ( = ?auto_223957 ?auto_223958 ) ) ( not ( = ?auto_223957 ?auto_223959 ) ) ( not ( = ?auto_223958 ?auto_223959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223958 ?auto_223956 ?auto_223955 )
      ( DELIVER-4PKG-VERIFY ?auto_223956 ?auto_223957 ?auto_223958 ?auto_223959 ?auto_223955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_223980 - OBJ
      ?auto_223981 - OBJ
      ?auto_223982 - OBJ
      ?auto_223983 - OBJ
      ?auto_223979 - LOCATION
    )
    :vars
    (
      ?auto_223986 - TRUCK
      ?auto_223985 - LOCATION
      ?auto_223987 - CITY
      ?auto_223984 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_223980 ?auto_223986 ) ( TRUCK-AT ?auto_223986 ?auto_223985 ) ( IN-CITY ?auto_223985 ?auto_223987 ) ( IN-CITY ?auto_223979 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223985 ) ) ( OBJ-AT ?auto_223984 ?auto_223979 ) ( not ( = ?auto_223984 ?auto_223980 ) ) ( OBJ-AT ?auto_223981 ?auto_223979 ) ( OBJ-AT ?auto_223982 ?auto_223979 ) ( OBJ-AT ?auto_223983 ?auto_223979 ) ( not ( = ?auto_223980 ?auto_223981 ) ) ( not ( = ?auto_223980 ?auto_223982 ) ) ( not ( = ?auto_223980 ?auto_223983 ) ) ( not ( = ?auto_223981 ?auto_223982 ) ) ( not ( = ?auto_223981 ?auto_223983 ) ) ( not ( = ?auto_223981 ?auto_223984 ) ) ( not ( = ?auto_223982 ?auto_223983 ) ) ( not ( = ?auto_223982 ?auto_223984 ) ) ( not ( = ?auto_223983 ?auto_223984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_223984 ?auto_223980 ?auto_223979 )
      ( DELIVER-4PKG-VERIFY ?auto_223980 ?auto_223981 ?auto_223982 ?auto_223983 ?auto_223979 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224100 - OBJ
      ?auto_224101 - OBJ
      ?auto_224102 - OBJ
      ?auto_224103 - OBJ
      ?auto_224104 - OBJ
      ?auto_224099 - LOCATION
    )
    :vars
    (
      ?auto_224106 - TRUCK
      ?auto_224105 - LOCATION
      ?auto_224107 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224104 ?auto_224106 ) ( TRUCK-AT ?auto_224106 ?auto_224105 ) ( IN-CITY ?auto_224105 ?auto_224107 ) ( IN-CITY ?auto_224099 ?auto_224107 ) ( not ( = ?auto_224099 ?auto_224105 ) ) ( OBJ-AT ?auto_224100 ?auto_224099 ) ( not ( = ?auto_224100 ?auto_224104 ) ) ( OBJ-AT ?auto_224101 ?auto_224099 ) ( OBJ-AT ?auto_224102 ?auto_224099 ) ( OBJ-AT ?auto_224103 ?auto_224099 ) ( not ( = ?auto_224100 ?auto_224101 ) ) ( not ( = ?auto_224100 ?auto_224102 ) ) ( not ( = ?auto_224100 ?auto_224103 ) ) ( not ( = ?auto_224101 ?auto_224102 ) ) ( not ( = ?auto_224101 ?auto_224103 ) ) ( not ( = ?auto_224101 ?auto_224104 ) ) ( not ( = ?auto_224102 ?auto_224103 ) ) ( not ( = ?auto_224102 ?auto_224104 ) ) ( not ( = ?auto_224103 ?auto_224104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224100 ?auto_224104 ?auto_224099 )
      ( DELIVER-5PKG-VERIFY ?auto_224100 ?auto_224101 ?auto_224102 ?auto_224103 ?auto_224104 ?auto_224099 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224118 - OBJ
      ?auto_224119 - OBJ
      ?auto_224120 - OBJ
      ?auto_224121 - OBJ
      ?auto_224122 - OBJ
      ?auto_224117 - LOCATION
    )
    :vars
    (
      ?auto_224124 - TRUCK
      ?auto_224123 - LOCATION
      ?auto_224125 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224121 ?auto_224124 ) ( TRUCK-AT ?auto_224124 ?auto_224123 ) ( IN-CITY ?auto_224123 ?auto_224125 ) ( IN-CITY ?auto_224117 ?auto_224125 ) ( not ( = ?auto_224117 ?auto_224123 ) ) ( OBJ-AT ?auto_224119 ?auto_224117 ) ( not ( = ?auto_224119 ?auto_224121 ) ) ( OBJ-AT ?auto_224118 ?auto_224117 ) ( OBJ-AT ?auto_224120 ?auto_224117 ) ( OBJ-AT ?auto_224122 ?auto_224117 ) ( not ( = ?auto_224118 ?auto_224119 ) ) ( not ( = ?auto_224118 ?auto_224120 ) ) ( not ( = ?auto_224118 ?auto_224121 ) ) ( not ( = ?auto_224118 ?auto_224122 ) ) ( not ( = ?auto_224119 ?auto_224120 ) ) ( not ( = ?auto_224119 ?auto_224122 ) ) ( not ( = ?auto_224120 ?auto_224121 ) ) ( not ( = ?auto_224120 ?auto_224122 ) ) ( not ( = ?auto_224121 ?auto_224122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224119 ?auto_224121 ?auto_224117 )
      ( DELIVER-5PKG-VERIFY ?auto_224118 ?auto_224119 ?auto_224120 ?auto_224121 ?auto_224122 ?auto_224117 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224154 - OBJ
      ?auto_224155 - OBJ
      ?auto_224156 - OBJ
      ?auto_224157 - OBJ
      ?auto_224158 - OBJ
      ?auto_224153 - LOCATION
    )
    :vars
    (
      ?auto_224160 - TRUCK
      ?auto_224159 - LOCATION
      ?auto_224161 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224158 ?auto_224160 ) ( TRUCK-AT ?auto_224160 ?auto_224159 ) ( IN-CITY ?auto_224159 ?auto_224161 ) ( IN-CITY ?auto_224153 ?auto_224161 ) ( not ( = ?auto_224153 ?auto_224159 ) ) ( OBJ-AT ?auto_224155 ?auto_224153 ) ( not ( = ?auto_224155 ?auto_224158 ) ) ( OBJ-AT ?auto_224154 ?auto_224153 ) ( OBJ-AT ?auto_224156 ?auto_224153 ) ( OBJ-AT ?auto_224157 ?auto_224153 ) ( not ( = ?auto_224154 ?auto_224155 ) ) ( not ( = ?auto_224154 ?auto_224156 ) ) ( not ( = ?auto_224154 ?auto_224157 ) ) ( not ( = ?auto_224154 ?auto_224158 ) ) ( not ( = ?auto_224155 ?auto_224156 ) ) ( not ( = ?auto_224155 ?auto_224157 ) ) ( not ( = ?auto_224156 ?auto_224157 ) ) ( not ( = ?auto_224156 ?auto_224158 ) ) ( not ( = ?auto_224157 ?auto_224158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224155 ?auto_224158 ?auto_224153 )
      ( DELIVER-5PKG-VERIFY ?auto_224154 ?auto_224155 ?auto_224156 ?auto_224157 ?auto_224158 ?auto_224153 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224190 - OBJ
      ?auto_224191 - OBJ
      ?auto_224192 - OBJ
      ?auto_224193 - OBJ
      ?auto_224194 - OBJ
      ?auto_224189 - LOCATION
    )
    :vars
    (
      ?auto_224196 - TRUCK
      ?auto_224195 - LOCATION
      ?auto_224197 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224192 ?auto_224196 ) ( TRUCK-AT ?auto_224196 ?auto_224195 ) ( IN-CITY ?auto_224195 ?auto_224197 ) ( IN-CITY ?auto_224189 ?auto_224197 ) ( not ( = ?auto_224189 ?auto_224195 ) ) ( OBJ-AT ?auto_224194 ?auto_224189 ) ( not ( = ?auto_224194 ?auto_224192 ) ) ( OBJ-AT ?auto_224190 ?auto_224189 ) ( OBJ-AT ?auto_224191 ?auto_224189 ) ( OBJ-AT ?auto_224193 ?auto_224189 ) ( not ( = ?auto_224190 ?auto_224191 ) ) ( not ( = ?auto_224190 ?auto_224192 ) ) ( not ( = ?auto_224190 ?auto_224193 ) ) ( not ( = ?auto_224190 ?auto_224194 ) ) ( not ( = ?auto_224191 ?auto_224192 ) ) ( not ( = ?auto_224191 ?auto_224193 ) ) ( not ( = ?auto_224191 ?auto_224194 ) ) ( not ( = ?auto_224192 ?auto_224193 ) ) ( not ( = ?auto_224193 ?auto_224194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224194 ?auto_224192 ?auto_224189 )
      ( DELIVER-5PKG-VERIFY ?auto_224190 ?auto_224191 ?auto_224192 ?auto_224193 ?auto_224194 ?auto_224189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224226 - OBJ
      ?auto_224227 - OBJ
      ?auto_224228 - OBJ
      ?auto_224229 - OBJ
      ?auto_224230 - OBJ
      ?auto_224225 - LOCATION
    )
    :vars
    (
      ?auto_224232 - TRUCK
      ?auto_224231 - LOCATION
      ?auto_224233 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224228 ?auto_224232 ) ( TRUCK-AT ?auto_224232 ?auto_224231 ) ( IN-CITY ?auto_224231 ?auto_224233 ) ( IN-CITY ?auto_224225 ?auto_224233 ) ( not ( = ?auto_224225 ?auto_224231 ) ) ( OBJ-AT ?auto_224227 ?auto_224225 ) ( not ( = ?auto_224227 ?auto_224228 ) ) ( OBJ-AT ?auto_224226 ?auto_224225 ) ( OBJ-AT ?auto_224229 ?auto_224225 ) ( OBJ-AT ?auto_224230 ?auto_224225 ) ( not ( = ?auto_224226 ?auto_224227 ) ) ( not ( = ?auto_224226 ?auto_224228 ) ) ( not ( = ?auto_224226 ?auto_224229 ) ) ( not ( = ?auto_224226 ?auto_224230 ) ) ( not ( = ?auto_224227 ?auto_224229 ) ) ( not ( = ?auto_224227 ?auto_224230 ) ) ( not ( = ?auto_224228 ?auto_224229 ) ) ( not ( = ?auto_224228 ?auto_224230 ) ) ( not ( = ?auto_224229 ?auto_224230 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224227 ?auto_224228 ?auto_224225 )
      ( DELIVER-5PKG-VERIFY ?auto_224226 ?auto_224227 ?auto_224228 ?auto_224229 ?auto_224230 ?auto_224225 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224316 - OBJ
      ?auto_224317 - OBJ
      ?auto_224318 - OBJ
      ?auto_224319 - OBJ
      ?auto_224320 - OBJ
      ?auto_224315 - LOCATION
    )
    :vars
    (
      ?auto_224322 - TRUCK
      ?auto_224321 - LOCATION
      ?auto_224323 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224320 ?auto_224322 ) ( TRUCK-AT ?auto_224322 ?auto_224321 ) ( IN-CITY ?auto_224321 ?auto_224323 ) ( IN-CITY ?auto_224315 ?auto_224323 ) ( not ( = ?auto_224315 ?auto_224321 ) ) ( OBJ-AT ?auto_224319 ?auto_224315 ) ( not ( = ?auto_224319 ?auto_224320 ) ) ( OBJ-AT ?auto_224316 ?auto_224315 ) ( OBJ-AT ?auto_224317 ?auto_224315 ) ( OBJ-AT ?auto_224318 ?auto_224315 ) ( not ( = ?auto_224316 ?auto_224317 ) ) ( not ( = ?auto_224316 ?auto_224318 ) ) ( not ( = ?auto_224316 ?auto_224319 ) ) ( not ( = ?auto_224316 ?auto_224320 ) ) ( not ( = ?auto_224317 ?auto_224318 ) ) ( not ( = ?auto_224317 ?auto_224319 ) ) ( not ( = ?auto_224317 ?auto_224320 ) ) ( not ( = ?auto_224318 ?auto_224319 ) ) ( not ( = ?auto_224318 ?auto_224320 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224319 ?auto_224320 ?auto_224315 )
      ( DELIVER-5PKG-VERIFY ?auto_224316 ?auto_224317 ?auto_224318 ?auto_224319 ?auto_224320 ?auto_224315 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224442 - OBJ
      ?auto_224443 - OBJ
      ?auto_224444 - OBJ
      ?auto_224445 - OBJ
      ?auto_224446 - OBJ
      ?auto_224441 - LOCATION
    )
    :vars
    (
      ?auto_224448 - TRUCK
      ?auto_224447 - LOCATION
      ?auto_224449 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224443 ?auto_224448 ) ( TRUCK-AT ?auto_224448 ?auto_224447 ) ( IN-CITY ?auto_224447 ?auto_224449 ) ( IN-CITY ?auto_224441 ?auto_224449 ) ( not ( = ?auto_224441 ?auto_224447 ) ) ( OBJ-AT ?auto_224445 ?auto_224441 ) ( not ( = ?auto_224445 ?auto_224443 ) ) ( OBJ-AT ?auto_224442 ?auto_224441 ) ( OBJ-AT ?auto_224444 ?auto_224441 ) ( OBJ-AT ?auto_224446 ?auto_224441 ) ( not ( = ?auto_224442 ?auto_224443 ) ) ( not ( = ?auto_224442 ?auto_224444 ) ) ( not ( = ?auto_224442 ?auto_224445 ) ) ( not ( = ?auto_224442 ?auto_224446 ) ) ( not ( = ?auto_224443 ?auto_224444 ) ) ( not ( = ?auto_224443 ?auto_224446 ) ) ( not ( = ?auto_224444 ?auto_224445 ) ) ( not ( = ?auto_224444 ?auto_224446 ) ) ( not ( = ?auto_224445 ?auto_224446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224445 ?auto_224443 ?auto_224441 )
      ( DELIVER-5PKG-VERIFY ?auto_224442 ?auto_224443 ?auto_224444 ?auto_224445 ?auto_224446 ?auto_224441 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224469 - OBJ
      ?auto_224470 - OBJ
      ?auto_224471 - OBJ
      ?auto_224472 - OBJ
      ?auto_224473 - OBJ
      ?auto_224468 - LOCATION
    )
    :vars
    (
      ?auto_224475 - TRUCK
      ?auto_224474 - LOCATION
      ?auto_224476 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224470 ?auto_224475 ) ( TRUCK-AT ?auto_224475 ?auto_224474 ) ( IN-CITY ?auto_224474 ?auto_224476 ) ( IN-CITY ?auto_224468 ?auto_224476 ) ( not ( = ?auto_224468 ?auto_224474 ) ) ( OBJ-AT ?auto_224469 ?auto_224468 ) ( not ( = ?auto_224469 ?auto_224470 ) ) ( OBJ-AT ?auto_224471 ?auto_224468 ) ( OBJ-AT ?auto_224472 ?auto_224468 ) ( OBJ-AT ?auto_224473 ?auto_224468 ) ( not ( = ?auto_224469 ?auto_224471 ) ) ( not ( = ?auto_224469 ?auto_224472 ) ) ( not ( = ?auto_224469 ?auto_224473 ) ) ( not ( = ?auto_224470 ?auto_224471 ) ) ( not ( = ?auto_224470 ?auto_224472 ) ) ( not ( = ?auto_224470 ?auto_224473 ) ) ( not ( = ?auto_224471 ?auto_224472 ) ) ( not ( = ?auto_224471 ?auto_224473 ) ) ( not ( = ?auto_224472 ?auto_224473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224469 ?auto_224470 ?auto_224468 )
      ( DELIVER-5PKG-VERIFY ?auto_224469 ?auto_224470 ?auto_224471 ?auto_224472 ?auto_224473 ?auto_224468 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224550 - OBJ
      ?auto_224551 - OBJ
      ?auto_224552 - OBJ
      ?auto_224553 - OBJ
      ?auto_224554 - OBJ
      ?auto_224549 - LOCATION
    )
    :vars
    (
      ?auto_224556 - TRUCK
      ?auto_224555 - LOCATION
      ?auto_224557 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224551 ?auto_224556 ) ( TRUCK-AT ?auto_224556 ?auto_224555 ) ( IN-CITY ?auto_224555 ?auto_224557 ) ( IN-CITY ?auto_224549 ?auto_224557 ) ( not ( = ?auto_224549 ?auto_224555 ) ) ( OBJ-AT ?auto_224554 ?auto_224549 ) ( not ( = ?auto_224554 ?auto_224551 ) ) ( OBJ-AT ?auto_224550 ?auto_224549 ) ( OBJ-AT ?auto_224552 ?auto_224549 ) ( OBJ-AT ?auto_224553 ?auto_224549 ) ( not ( = ?auto_224550 ?auto_224551 ) ) ( not ( = ?auto_224550 ?auto_224552 ) ) ( not ( = ?auto_224550 ?auto_224553 ) ) ( not ( = ?auto_224550 ?auto_224554 ) ) ( not ( = ?auto_224551 ?auto_224552 ) ) ( not ( = ?auto_224551 ?auto_224553 ) ) ( not ( = ?auto_224552 ?auto_224553 ) ) ( not ( = ?auto_224552 ?auto_224554 ) ) ( not ( = ?auto_224553 ?auto_224554 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224554 ?auto_224551 ?auto_224549 )
      ( DELIVER-5PKG-VERIFY ?auto_224550 ?auto_224551 ?auto_224552 ?auto_224553 ?auto_224554 ?auto_224549 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224775 - OBJ
      ?auto_224776 - OBJ
      ?auto_224777 - OBJ
      ?auto_224778 - OBJ
      ?auto_224779 - OBJ
      ?auto_224774 - LOCATION
    )
    :vars
    (
      ?auto_224781 - TRUCK
      ?auto_224780 - LOCATION
      ?auto_224782 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224777 ?auto_224781 ) ( TRUCK-AT ?auto_224781 ?auto_224780 ) ( IN-CITY ?auto_224780 ?auto_224782 ) ( IN-CITY ?auto_224774 ?auto_224782 ) ( not ( = ?auto_224774 ?auto_224780 ) ) ( OBJ-AT ?auto_224778 ?auto_224774 ) ( not ( = ?auto_224778 ?auto_224777 ) ) ( OBJ-AT ?auto_224775 ?auto_224774 ) ( OBJ-AT ?auto_224776 ?auto_224774 ) ( OBJ-AT ?auto_224779 ?auto_224774 ) ( not ( = ?auto_224775 ?auto_224776 ) ) ( not ( = ?auto_224775 ?auto_224777 ) ) ( not ( = ?auto_224775 ?auto_224778 ) ) ( not ( = ?auto_224775 ?auto_224779 ) ) ( not ( = ?auto_224776 ?auto_224777 ) ) ( not ( = ?auto_224776 ?auto_224778 ) ) ( not ( = ?auto_224776 ?auto_224779 ) ) ( not ( = ?auto_224777 ?auto_224779 ) ) ( not ( = ?auto_224778 ?auto_224779 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224778 ?auto_224777 ?auto_224774 )
      ( DELIVER-5PKG-VERIFY ?auto_224775 ?auto_224776 ?auto_224777 ?auto_224778 ?auto_224779 ?auto_224774 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224874 - OBJ
      ?auto_224875 - OBJ
      ?auto_224876 - OBJ
      ?auto_224877 - OBJ
      ?auto_224878 - OBJ
      ?auto_224873 - LOCATION
    )
    :vars
    (
      ?auto_224880 - TRUCK
      ?auto_224879 - LOCATION
      ?auto_224881 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224877 ?auto_224880 ) ( TRUCK-AT ?auto_224880 ?auto_224879 ) ( IN-CITY ?auto_224879 ?auto_224881 ) ( IN-CITY ?auto_224873 ?auto_224881 ) ( not ( = ?auto_224873 ?auto_224879 ) ) ( OBJ-AT ?auto_224876 ?auto_224873 ) ( not ( = ?auto_224876 ?auto_224877 ) ) ( OBJ-AT ?auto_224874 ?auto_224873 ) ( OBJ-AT ?auto_224875 ?auto_224873 ) ( OBJ-AT ?auto_224878 ?auto_224873 ) ( not ( = ?auto_224874 ?auto_224875 ) ) ( not ( = ?auto_224874 ?auto_224876 ) ) ( not ( = ?auto_224874 ?auto_224877 ) ) ( not ( = ?auto_224874 ?auto_224878 ) ) ( not ( = ?auto_224875 ?auto_224876 ) ) ( not ( = ?auto_224875 ?auto_224877 ) ) ( not ( = ?auto_224875 ?auto_224878 ) ) ( not ( = ?auto_224876 ?auto_224878 ) ) ( not ( = ?auto_224877 ?auto_224878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224876 ?auto_224877 ?auto_224873 )
      ( DELIVER-5PKG-VERIFY ?auto_224874 ?auto_224875 ?auto_224876 ?auto_224877 ?auto_224878 ?auto_224873 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224910 - OBJ
      ?auto_224911 - OBJ
      ?auto_224912 - OBJ
      ?auto_224913 - OBJ
      ?auto_224914 - OBJ
      ?auto_224909 - LOCATION
    )
    :vars
    (
      ?auto_224917 - TRUCK
      ?auto_224916 - LOCATION
      ?auto_224918 - CITY
      ?auto_224915 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224914 ?auto_224917 ) ( TRUCK-AT ?auto_224917 ?auto_224916 ) ( IN-CITY ?auto_224916 ?auto_224918 ) ( IN-CITY ?auto_224909 ?auto_224918 ) ( not ( = ?auto_224909 ?auto_224916 ) ) ( OBJ-AT ?auto_224915 ?auto_224909 ) ( not ( = ?auto_224915 ?auto_224914 ) ) ( OBJ-AT ?auto_224910 ?auto_224909 ) ( OBJ-AT ?auto_224911 ?auto_224909 ) ( OBJ-AT ?auto_224912 ?auto_224909 ) ( OBJ-AT ?auto_224913 ?auto_224909 ) ( not ( = ?auto_224910 ?auto_224911 ) ) ( not ( = ?auto_224910 ?auto_224912 ) ) ( not ( = ?auto_224910 ?auto_224913 ) ) ( not ( = ?auto_224910 ?auto_224914 ) ) ( not ( = ?auto_224910 ?auto_224915 ) ) ( not ( = ?auto_224911 ?auto_224912 ) ) ( not ( = ?auto_224911 ?auto_224913 ) ) ( not ( = ?auto_224911 ?auto_224914 ) ) ( not ( = ?auto_224911 ?auto_224915 ) ) ( not ( = ?auto_224912 ?auto_224913 ) ) ( not ( = ?auto_224912 ?auto_224914 ) ) ( not ( = ?auto_224912 ?auto_224915 ) ) ( not ( = ?auto_224913 ?auto_224914 ) ) ( not ( = ?auto_224913 ?auto_224915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224915 ?auto_224914 ?auto_224909 )
      ( DELIVER-5PKG-VERIFY ?auto_224910 ?auto_224911 ?auto_224912 ?auto_224913 ?auto_224914 ?auto_224909 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224920 - OBJ
      ?auto_224921 - OBJ
      ?auto_224922 - OBJ
      ?auto_224923 - OBJ
      ?auto_224924 - OBJ
      ?auto_224919 - LOCATION
    )
    :vars
    (
      ?auto_224926 - TRUCK
      ?auto_224925 - LOCATION
      ?auto_224927 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224923 ?auto_224926 ) ( TRUCK-AT ?auto_224926 ?auto_224925 ) ( IN-CITY ?auto_224925 ?auto_224927 ) ( IN-CITY ?auto_224919 ?auto_224927 ) ( not ( = ?auto_224919 ?auto_224925 ) ) ( OBJ-AT ?auto_224924 ?auto_224919 ) ( not ( = ?auto_224924 ?auto_224923 ) ) ( OBJ-AT ?auto_224920 ?auto_224919 ) ( OBJ-AT ?auto_224921 ?auto_224919 ) ( OBJ-AT ?auto_224922 ?auto_224919 ) ( not ( = ?auto_224920 ?auto_224921 ) ) ( not ( = ?auto_224920 ?auto_224922 ) ) ( not ( = ?auto_224920 ?auto_224923 ) ) ( not ( = ?auto_224920 ?auto_224924 ) ) ( not ( = ?auto_224921 ?auto_224922 ) ) ( not ( = ?auto_224921 ?auto_224923 ) ) ( not ( = ?auto_224921 ?auto_224924 ) ) ( not ( = ?auto_224922 ?auto_224923 ) ) ( not ( = ?auto_224922 ?auto_224924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224924 ?auto_224923 ?auto_224919 )
      ( DELIVER-5PKG-VERIFY ?auto_224920 ?auto_224921 ?auto_224922 ?auto_224923 ?auto_224924 ?auto_224919 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224929 - OBJ
      ?auto_224930 - OBJ
      ?auto_224931 - OBJ
      ?auto_224932 - OBJ
      ?auto_224933 - OBJ
      ?auto_224928 - LOCATION
    )
    :vars
    (
      ?auto_224936 - TRUCK
      ?auto_224935 - LOCATION
      ?auto_224937 - CITY
      ?auto_224934 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224932 ?auto_224936 ) ( TRUCK-AT ?auto_224936 ?auto_224935 ) ( IN-CITY ?auto_224935 ?auto_224937 ) ( IN-CITY ?auto_224928 ?auto_224937 ) ( not ( = ?auto_224928 ?auto_224935 ) ) ( OBJ-AT ?auto_224934 ?auto_224928 ) ( not ( = ?auto_224934 ?auto_224932 ) ) ( OBJ-AT ?auto_224929 ?auto_224928 ) ( OBJ-AT ?auto_224930 ?auto_224928 ) ( OBJ-AT ?auto_224931 ?auto_224928 ) ( OBJ-AT ?auto_224933 ?auto_224928 ) ( not ( = ?auto_224929 ?auto_224930 ) ) ( not ( = ?auto_224929 ?auto_224931 ) ) ( not ( = ?auto_224929 ?auto_224932 ) ) ( not ( = ?auto_224929 ?auto_224933 ) ) ( not ( = ?auto_224929 ?auto_224934 ) ) ( not ( = ?auto_224930 ?auto_224931 ) ) ( not ( = ?auto_224930 ?auto_224932 ) ) ( not ( = ?auto_224930 ?auto_224933 ) ) ( not ( = ?auto_224930 ?auto_224934 ) ) ( not ( = ?auto_224931 ?auto_224932 ) ) ( not ( = ?auto_224931 ?auto_224933 ) ) ( not ( = ?auto_224931 ?auto_224934 ) ) ( not ( = ?auto_224932 ?auto_224933 ) ) ( not ( = ?auto_224933 ?auto_224934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224934 ?auto_224932 ?auto_224928 )
      ( DELIVER-5PKG-VERIFY ?auto_224929 ?auto_224930 ?auto_224931 ?auto_224932 ?auto_224933 ?auto_224928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224985 - OBJ
      ?auto_224986 - OBJ
      ?auto_224987 - OBJ
      ?auto_224988 - OBJ
      ?auto_224989 - OBJ
      ?auto_224984 - LOCATION
    )
    :vars
    (
      ?auto_224992 - TRUCK
      ?auto_224991 - LOCATION
      ?auto_224993 - CITY
      ?auto_224990 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_224987 ?auto_224992 ) ( TRUCK-AT ?auto_224992 ?auto_224991 ) ( IN-CITY ?auto_224991 ?auto_224993 ) ( IN-CITY ?auto_224984 ?auto_224993 ) ( not ( = ?auto_224984 ?auto_224991 ) ) ( OBJ-AT ?auto_224990 ?auto_224984 ) ( not ( = ?auto_224990 ?auto_224987 ) ) ( OBJ-AT ?auto_224985 ?auto_224984 ) ( OBJ-AT ?auto_224986 ?auto_224984 ) ( OBJ-AT ?auto_224988 ?auto_224984 ) ( OBJ-AT ?auto_224989 ?auto_224984 ) ( not ( = ?auto_224985 ?auto_224986 ) ) ( not ( = ?auto_224985 ?auto_224987 ) ) ( not ( = ?auto_224985 ?auto_224988 ) ) ( not ( = ?auto_224985 ?auto_224989 ) ) ( not ( = ?auto_224985 ?auto_224990 ) ) ( not ( = ?auto_224986 ?auto_224987 ) ) ( not ( = ?auto_224986 ?auto_224988 ) ) ( not ( = ?auto_224986 ?auto_224989 ) ) ( not ( = ?auto_224986 ?auto_224990 ) ) ( not ( = ?auto_224987 ?auto_224988 ) ) ( not ( = ?auto_224987 ?auto_224989 ) ) ( not ( = ?auto_224988 ?auto_224989 ) ) ( not ( = ?auto_224988 ?auto_224990 ) ) ( not ( = ?auto_224989 ?auto_224990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_224990 ?auto_224987 ?auto_224984 )
      ( DELIVER-5PKG-VERIFY ?auto_224985 ?auto_224986 ?auto_224987 ?auto_224988 ?auto_224989 ?auto_224984 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225151 - OBJ
      ?auto_225152 - OBJ
      ?auto_225153 - OBJ
      ?auto_225154 - OBJ
      ?auto_225155 - OBJ
      ?auto_225150 - LOCATION
    )
    :vars
    (
      ?auto_225158 - TRUCK
      ?auto_225157 - LOCATION
      ?auto_225159 - CITY
      ?auto_225156 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225152 ?auto_225158 ) ( TRUCK-AT ?auto_225158 ?auto_225157 ) ( IN-CITY ?auto_225157 ?auto_225159 ) ( IN-CITY ?auto_225150 ?auto_225159 ) ( not ( = ?auto_225150 ?auto_225157 ) ) ( OBJ-AT ?auto_225156 ?auto_225150 ) ( not ( = ?auto_225156 ?auto_225152 ) ) ( OBJ-AT ?auto_225151 ?auto_225150 ) ( OBJ-AT ?auto_225153 ?auto_225150 ) ( OBJ-AT ?auto_225154 ?auto_225150 ) ( OBJ-AT ?auto_225155 ?auto_225150 ) ( not ( = ?auto_225151 ?auto_225152 ) ) ( not ( = ?auto_225151 ?auto_225153 ) ) ( not ( = ?auto_225151 ?auto_225154 ) ) ( not ( = ?auto_225151 ?auto_225155 ) ) ( not ( = ?auto_225151 ?auto_225156 ) ) ( not ( = ?auto_225152 ?auto_225153 ) ) ( not ( = ?auto_225152 ?auto_225154 ) ) ( not ( = ?auto_225152 ?auto_225155 ) ) ( not ( = ?auto_225153 ?auto_225154 ) ) ( not ( = ?auto_225153 ?auto_225155 ) ) ( not ( = ?auto_225153 ?auto_225156 ) ) ( not ( = ?auto_225154 ?auto_225155 ) ) ( not ( = ?auto_225154 ?auto_225156 ) ) ( not ( = ?auto_225155 ?auto_225156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225156 ?auto_225152 ?auto_225150 )
      ( DELIVER-5PKG-VERIFY ?auto_225151 ?auto_225152 ?auto_225153 ?auto_225154 ?auto_225155 ?auto_225150 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225285 - OBJ
      ?auto_225286 - OBJ
      ?auto_225287 - OBJ
      ?auto_225288 - OBJ
      ?auto_225289 - OBJ
      ?auto_225284 - LOCATION
    )
    :vars
    (
      ?auto_225291 - TRUCK
      ?auto_225290 - LOCATION
      ?auto_225292 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225285 ?auto_225291 ) ( TRUCK-AT ?auto_225291 ?auto_225290 ) ( IN-CITY ?auto_225290 ?auto_225292 ) ( IN-CITY ?auto_225284 ?auto_225292 ) ( not ( = ?auto_225284 ?auto_225290 ) ) ( OBJ-AT ?auto_225287 ?auto_225284 ) ( not ( = ?auto_225287 ?auto_225285 ) ) ( OBJ-AT ?auto_225286 ?auto_225284 ) ( OBJ-AT ?auto_225288 ?auto_225284 ) ( OBJ-AT ?auto_225289 ?auto_225284 ) ( not ( = ?auto_225285 ?auto_225286 ) ) ( not ( = ?auto_225285 ?auto_225288 ) ) ( not ( = ?auto_225285 ?auto_225289 ) ) ( not ( = ?auto_225286 ?auto_225287 ) ) ( not ( = ?auto_225286 ?auto_225288 ) ) ( not ( = ?auto_225286 ?auto_225289 ) ) ( not ( = ?auto_225287 ?auto_225288 ) ) ( not ( = ?auto_225287 ?auto_225289 ) ) ( not ( = ?auto_225288 ?auto_225289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225287 ?auto_225285 ?auto_225284 )
      ( DELIVER-5PKG-VERIFY ?auto_225285 ?auto_225286 ?auto_225287 ?auto_225288 ?auto_225289 ?auto_225284 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225294 - OBJ
      ?auto_225295 - OBJ
      ?auto_225296 - OBJ
      ?auto_225297 - OBJ
      ?auto_225298 - OBJ
      ?auto_225293 - LOCATION
    )
    :vars
    (
      ?auto_225300 - TRUCK
      ?auto_225299 - LOCATION
      ?auto_225301 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225294 ?auto_225300 ) ( TRUCK-AT ?auto_225300 ?auto_225299 ) ( IN-CITY ?auto_225299 ?auto_225301 ) ( IN-CITY ?auto_225293 ?auto_225301 ) ( not ( = ?auto_225293 ?auto_225299 ) ) ( OBJ-AT ?auto_225297 ?auto_225293 ) ( not ( = ?auto_225297 ?auto_225294 ) ) ( OBJ-AT ?auto_225295 ?auto_225293 ) ( OBJ-AT ?auto_225296 ?auto_225293 ) ( OBJ-AT ?auto_225298 ?auto_225293 ) ( not ( = ?auto_225294 ?auto_225295 ) ) ( not ( = ?auto_225294 ?auto_225296 ) ) ( not ( = ?auto_225294 ?auto_225298 ) ) ( not ( = ?auto_225295 ?auto_225296 ) ) ( not ( = ?auto_225295 ?auto_225297 ) ) ( not ( = ?auto_225295 ?auto_225298 ) ) ( not ( = ?auto_225296 ?auto_225297 ) ) ( not ( = ?auto_225296 ?auto_225298 ) ) ( not ( = ?auto_225297 ?auto_225298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225297 ?auto_225294 ?auto_225293 )
      ( DELIVER-5PKG-VERIFY ?auto_225294 ?auto_225295 ?auto_225296 ?auto_225297 ?auto_225298 ?auto_225293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225312 - OBJ
      ?auto_225313 - OBJ
      ?auto_225314 - OBJ
      ?auto_225315 - OBJ
      ?auto_225316 - OBJ
      ?auto_225311 - LOCATION
    )
    :vars
    (
      ?auto_225318 - TRUCK
      ?auto_225317 - LOCATION
      ?auto_225319 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225312 ?auto_225318 ) ( TRUCK-AT ?auto_225318 ?auto_225317 ) ( IN-CITY ?auto_225317 ?auto_225319 ) ( IN-CITY ?auto_225311 ?auto_225319 ) ( not ( = ?auto_225311 ?auto_225317 ) ) ( OBJ-AT ?auto_225313 ?auto_225311 ) ( not ( = ?auto_225313 ?auto_225312 ) ) ( OBJ-AT ?auto_225314 ?auto_225311 ) ( OBJ-AT ?auto_225315 ?auto_225311 ) ( OBJ-AT ?auto_225316 ?auto_225311 ) ( not ( = ?auto_225312 ?auto_225314 ) ) ( not ( = ?auto_225312 ?auto_225315 ) ) ( not ( = ?auto_225312 ?auto_225316 ) ) ( not ( = ?auto_225313 ?auto_225314 ) ) ( not ( = ?auto_225313 ?auto_225315 ) ) ( not ( = ?auto_225313 ?auto_225316 ) ) ( not ( = ?auto_225314 ?auto_225315 ) ) ( not ( = ?auto_225314 ?auto_225316 ) ) ( not ( = ?auto_225315 ?auto_225316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225313 ?auto_225312 ?auto_225311 )
      ( DELIVER-5PKG-VERIFY ?auto_225312 ?auto_225313 ?auto_225314 ?auto_225315 ?auto_225316 ?auto_225311 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225645 - OBJ
      ?auto_225646 - OBJ
      ?auto_225647 - OBJ
      ?auto_225648 - OBJ
      ?auto_225649 - OBJ
      ?auto_225644 - LOCATION
    )
    :vars
    (
      ?auto_225652 - TRUCK
      ?auto_225651 - LOCATION
      ?auto_225653 - CITY
      ?auto_225650 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_225645 ?auto_225652 ) ( TRUCK-AT ?auto_225652 ?auto_225651 ) ( IN-CITY ?auto_225651 ?auto_225653 ) ( IN-CITY ?auto_225644 ?auto_225653 ) ( not ( = ?auto_225644 ?auto_225651 ) ) ( OBJ-AT ?auto_225650 ?auto_225644 ) ( not ( = ?auto_225650 ?auto_225645 ) ) ( OBJ-AT ?auto_225646 ?auto_225644 ) ( OBJ-AT ?auto_225647 ?auto_225644 ) ( OBJ-AT ?auto_225648 ?auto_225644 ) ( OBJ-AT ?auto_225649 ?auto_225644 ) ( not ( = ?auto_225645 ?auto_225646 ) ) ( not ( = ?auto_225645 ?auto_225647 ) ) ( not ( = ?auto_225645 ?auto_225648 ) ) ( not ( = ?auto_225645 ?auto_225649 ) ) ( not ( = ?auto_225646 ?auto_225647 ) ) ( not ( = ?auto_225646 ?auto_225648 ) ) ( not ( = ?auto_225646 ?auto_225649 ) ) ( not ( = ?auto_225646 ?auto_225650 ) ) ( not ( = ?auto_225647 ?auto_225648 ) ) ( not ( = ?auto_225647 ?auto_225649 ) ) ( not ( = ?auto_225647 ?auto_225650 ) ) ( not ( = ?auto_225648 ?auto_225649 ) ) ( not ( = ?auto_225648 ?auto_225650 ) ) ( not ( = ?auto_225649 ?auto_225650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225650 ?auto_225645 ?auto_225644 )
      ( DELIVER-5PKG-VERIFY ?auto_225645 ?auto_225646 ?auto_225647 ?auto_225648 ?auto_225649 ?auto_225644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226094 - OBJ
      ?auto_226095 - OBJ
      ?auto_226096 - OBJ
      ?auto_226093 - LOCATION
    )
    :vars
    (
      ?auto_226097 - TRUCK
      ?auto_226100 - LOCATION
      ?auto_226099 - CITY
      ?auto_226098 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226097 ?auto_226100 ) ( IN-CITY ?auto_226100 ?auto_226099 ) ( IN-CITY ?auto_226093 ?auto_226099 ) ( not ( = ?auto_226093 ?auto_226100 ) ) ( OBJ-AT ?auto_226098 ?auto_226093 ) ( not ( = ?auto_226098 ?auto_226096 ) ) ( OBJ-AT ?auto_226096 ?auto_226100 ) ( OBJ-AT ?auto_226094 ?auto_226093 ) ( OBJ-AT ?auto_226095 ?auto_226093 ) ( not ( = ?auto_226094 ?auto_226095 ) ) ( not ( = ?auto_226094 ?auto_226096 ) ) ( not ( = ?auto_226094 ?auto_226098 ) ) ( not ( = ?auto_226095 ?auto_226096 ) ) ( not ( = ?auto_226095 ?auto_226098 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226098 ?auto_226096 ?auto_226093 )
      ( DELIVER-3PKG-VERIFY ?auto_226094 ?auto_226095 ?auto_226096 ?auto_226093 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226106 - OBJ
      ?auto_226107 - OBJ
      ?auto_226108 - OBJ
      ?auto_226105 - LOCATION
    )
    :vars
    (
      ?auto_226109 - TRUCK
      ?auto_226112 - LOCATION
      ?auto_226111 - CITY
      ?auto_226110 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226109 ?auto_226112 ) ( IN-CITY ?auto_226112 ?auto_226111 ) ( IN-CITY ?auto_226105 ?auto_226111 ) ( not ( = ?auto_226105 ?auto_226112 ) ) ( OBJ-AT ?auto_226110 ?auto_226105 ) ( not ( = ?auto_226110 ?auto_226107 ) ) ( OBJ-AT ?auto_226107 ?auto_226112 ) ( OBJ-AT ?auto_226106 ?auto_226105 ) ( OBJ-AT ?auto_226108 ?auto_226105 ) ( not ( = ?auto_226106 ?auto_226107 ) ) ( not ( = ?auto_226106 ?auto_226108 ) ) ( not ( = ?auto_226106 ?auto_226110 ) ) ( not ( = ?auto_226107 ?auto_226108 ) ) ( not ( = ?auto_226108 ?auto_226110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226110 ?auto_226107 ?auto_226105 )
      ( DELIVER-3PKG-VERIFY ?auto_226106 ?auto_226107 ?auto_226108 ?auto_226105 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226122 - OBJ
      ?auto_226123 - OBJ
      ?auto_226124 - OBJ
      ?auto_226121 - LOCATION
    )
    :vars
    (
      ?auto_226125 - TRUCK
      ?auto_226127 - LOCATION
      ?auto_226126 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226125 ?auto_226127 ) ( IN-CITY ?auto_226127 ?auto_226126 ) ( IN-CITY ?auto_226121 ?auto_226126 ) ( not ( = ?auto_226121 ?auto_226127 ) ) ( OBJ-AT ?auto_226124 ?auto_226121 ) ( not ( = ?auto_226124 ?auto_226122 ) ) ( OBJ-AT ?auto_226122 ?auto_226127 ) ( OBJ-AT ?auto_226123 ?auto_226121 ) ( not ( = ?auto_226122 ?auto_226123 ) ) ( not ( = ?auto_226123 ?auto_226124 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226124 ?auto_226122 ?auto_226121 )
      ( DELIVER-3PKG-VERIFY ?auto_226122 ?auto_226123 ?auto_226124 ?auto_226121 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_226144 - OBJ
      ?auto_226145 - OBJ
      ?auto_226146 - OBJ
      ?auto_226143 - LOCATION
    )
    :vars
    (
      ?auto_226147 - TRUCK
      ?auto_226150 - LOCATION
      ?auto_226149 - CITY
      ?auto_226148 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226147 ?auto_226150 ) ( IN-CITY ?auto_226150 ?auto_226149 ) ( IN-CITY ?auto_226143 ?auto_226149 ) ( not ( = ?auto_226143 ?auto_226150 ) ) ( OBJ-AT ?auto_226148 ?auto_226143 ) ( not ( = ?auto_226148 ?auto_226144 ) ) ( OBJ-AT ?auto_226144 ?auto_226150 ) ( OBJ-AT ?auto_226145 ?auto_226143 ) ( OBJ-AT ?auto_226146 ?auto_226143 ) ( not ( = ?auto_226144 ?auto_226145 ) ) ( not ( = ?auto_226144 ?auto_226146 ) ) ( not ( = ?auto_226145 ?auto_226146 ) ) ( not ( = ?auto_226145 ?auto_226148 ) ) ( not ( = ?auto_226146 ?auto_226148 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226148 ?auto_226144 ?auto_226143 )
      ( DELIVER-3PKG-VERIFY ?auto_226144 ?auto_226145 ?auto_226146 ?auto_226143 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226183 - OBJ
      ?auto_226184 - OBJ
      ?auto_226185 - OBJ
      ?auto_226186 - OBJ
      ?auto_226182 - LOCATION
    )
    :vars
    (
      ?auto_226187 - TRUCK
      ?auto_226189 - LOCATION
      ?auto_226188 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226187 ?auto_226189 ) ( IN-CITY ?auto_226189 ?auto_226188 ) ( IN-CITY ?auto_226182 ?auto_226188 ) ( not ( = ?auto_226182 ?auto_226189 ) ) ( OBJ-AT ?auto_226183 ?auto_226182 ) ( not ( = ?auto_226183 ?auto_226186 ) ) ( OBJ-AT ?auto_226186 ?auto_226189 ) ( OBJ-AT ?auto_226184 ?auto_226182 ) ( OBJ-AT ?auto_226185 ?auto_226182 ) ( not ( = ?auto_226183 ?auto_226184 ) ) ( not ( = ?auto_226183 ?auto_226185 ) ) ( not ( = ?auto_226184 ?auto_226185 ) ) ( not ( = ?auto_226184 ?auto_226186 ) ) ( not ( = ?auto_226185 ?auto_226186 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226183 ?auto_226186 ?auto_226182 )
      ( DELIVER-4PKG-VERIFY ?auto_226183 ?auto_226184 ?auto_226185 ?auto_226186 ?auto_226182 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226199 - OBJ
      ?auto_226200 - OBJ
      ?auto_226201 - OBJ
      ?auto_226202 - OBJ
      ?auto_226198 - LOCATION
    )
    :vars
    (
      ?auto_226203 - TRUCK
      ?auto_226205 - LOCATION
      ?auto_226204 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226203 ?auto_226205 ) ( IN-CITY ?auto_226205 ?auto_226204 ) ( IN-CITY ?auto_226198 ?auto_226204 ) ( not ( = ?auto_226198 ?auto_226205 ) ) ( OBJ-AT ?auto_226199 ?auto_226198 ) ( not ( = ?auto_226199 ?auto_226201 ) ) ( OBJ-AT ?auto_226201 ?auto_226205 ) ( OBJ-AT ?auto_226200 ?auto_226198 ) ( OBJ-AT ?auto_226202 ?auto_226198 ) ( not ( = ?auto_226199 ?auto_226200 ) ) ( not ( = ?auto_226199 ?auto_226202 ) ) ( not ( = ?auto_226200 ?auto_226201 ) ) ( not ( = ?auto_226200 ?auto_226202 ) ) ( not ( = ?auto_226201 ?auto_226202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226199 ?auto_226201 ?auto_226198 )
      ( DELIVER-4PKG-VERIFY ?auto_226199 ?auto_226200 ?auto_226201 ?auto_226202 ?auto_226198 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226271 - OBJ
      ?auto_226272 - OBJ
      ?auto_226273 - OBJ
      ?auto_226274 - OBJ
      ?auto_226270 - LOCATION
    )
    :vars
    (
      ?auto_226275 - TRUCK
      ?auto_226277 - LOCATION
      ?auto_226276 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226275 ?auto_226277 ) ( IN-CITY ?auto_226277 ?auto_226276 ) ( IN-CITY ?auto_226270 ?auto_226276 ) ( not ( = ?auto_226270 ?auto_226277 ) ) ( OBJ-AT ?auto_226271 ?auto_226270 ) ( not ( = ?auto_226271 ?auto_226272 ) ) ( OBJ-AT ?auto_226272 ?auto_226277 ) ( OBJ-AT ?auto_226273 ?auto_226270 ) ( OBJ-AT ?auto_226274 ?auto_226270 ) ( not ( = ?auto_226271 ?auto_226273 ) ) ( not ( = ?auto_226271 ?auto_226274 ) ) ( not ( = ?auto_226272 ?auto_226273 ) ) ( not ( = ?auto_226272 ?auto_226274 ) ) ( not ( = ?auto_226273 ?auto_226274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226271 ?auto_226272 ?auto_226270 )
      ( DELIVER-4PKG-VERIFY ?auto_226271 ?auto_226272 ?auto_226273 ?auto_226274 ?auto_226270 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226375 - OBJ
      ?auto_226376 - OBJ
      ?auto_226377 - OBJ
      ?auto_226378 - OBJ
      ?auto_226374 - LOCATION
    )
    :vars
    (
      ?auto_226379 - TRUCK
      ?auto_226381 - LOCATION
      ?auto_226380 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226379 ?auto_226381 ) ( IN-CITY ?auto_226381 ?auto_226380 ) ( IN-CITY ?auto_226374 ?auto_226380 ) ( not ( = ?auto_226374 ?auto_226381 ) ) ( OBJ-AT ?auto_226377 ?auto_226374 ) ( not ( = ?auto_226377 ?auto_226378 ) ) ( OBJ-AT ?auto_226378 ?auto_226381 ) ( OBJ-AT ?auto_226375 ?auto_226374 ) ( OBJ-AT ?auto_226376 ?auto_226374 ) ( not ( = ?auto_226375 ?auto_226376 ) ) ( not ( = ?auto_226375 ?auto_226377 ) ) ( not ( = ?auto_226375 ?auto_226378 ) ) ( not ( = ?auto_226376 ?auto_226377 ) ) ( not ( = ?auto_226376 ?auto_226378 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226377 ?auto_226378 ?auto_226374 )
      ( DELIVER-4PKG-VERIFY ?auto_226375 ?auto_226376 ?auto_226377 ?auto_226378 ?auto_226374 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226383 - OBJ
      ?auto_226384 - OBJ
      ?auto_226385 - OBJ
      ?auto_226386 - OBJ
      ?auto_226382 - LOCATION
    )
    :vars
    (
      ?auto_226387 - TRUCK
      ?auto_226390 - LOCATION
      ?auto_226389 - CITY
      ?auto_226388 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226387 ?auto_226390 ) ( IN-CITY ?auto_226390 ?auto_226389 ) ( IN-CITY ?auto_226382 ?auto_226389 ) ( not ( = ?auto_226382 ?auto_226390 ) ) ( OBJ-AT ?auto_226388 ?auto_226382 ) ( not ( = ?auto_226388 ?auto_226386 ) ) ( OBJ-AT ?auto_226386 ?auto_226390 ) ( OBJ-AT ?auto_226383 ?auto_226382 ) ( OBJ-AT ?auto_226384 ?auto_226382 ) ( OBJ-AT ?auto_226385 ?auto_226382 ) ( not ( = ?auto_226383 ?auto_226384 ) ) ( not ( = ?auto_226383 ?auto_226385 ) ) ( not ( = ?auto_226383 ?auto_226386 ) ) ( not ( = ?auto_226383 ?auto_226388 ) ) ( not ( = ?auto_226384 ?auto_226385 ) ) ( not ( = ?auto_226384 ?auto_226386 ) ) ( not ( = ?auto_226384 ?auto_226388 ) ) ( not ( = ?auto_226385 ?auto_226386 ) ) ( not ( = ?auto_226385 ?auto_226388 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226388 ?auto_226386 ?auto_226382 )
      ( DELIVER-4PKG-VERIFY ?auto_226383 ?auto_226384 ?auto_226385 ?auto_226386 ?auto_226382 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226392 - OBJ
      ?auto_226393 - OBJ
      ?auto_226394 - OBJ
      ?auto_226395 - OBJ
      ?auto_226391 - LOCATION
    )
    :vars
    (
      ?auto_226396 - TRUCK
      ?auto_226398 - LOCATION
      ?auto_226397 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226396 ?auto_226398 ) ( IN-CITY ?auto_226398 ?auto_226397 ) ( IN-CITY ?auto_226391 ?auto_226397 ) ( not ( = ?auto_226391 ?auto_226398 ) ) ( OBJ-AT ?auto_226395 ?auto_226391 ) ( not ( = ?auto_226395 ?auto_226394 ) ) ( OBJ-AT ?auto_226394 ?auto_226398 ) ( OBJ-AT ?auto_226392 ?auto_226391 ) ( OBJ-AT ?auto_226393 ?auto_226391 ) ( not ( = ?auto_226392 ?auto_226393 ) ) ( not ( = ?auto_226392 ?auto_226394 ) ) ( not ( = ?auto_226392 ?auto_226395 ) ) ( not ( = ?auto_226393 ?auto_226394 ) ) ( not ( = ?auto_226393 ?auto_226395 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226395 ?auto_226394 ?auto_226391 )
      ( DELIVER-4PKG-VERIFY ?auto_226392 ?auto_226393 ?auto_226394 ?auto_226395 ?auto_226391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226400 - OBJ
      ?auto_226401 - OBJ
      ?auto_226402 - OBJ
      ?auto_226403 - OBJ
      ?auto_226399 - LOCATION
    )
    :vars
    (
      ?auto_226404 - TRUCK
      ?auto_226407 - LOCATION
      ?auto_226406 - CITY
      ?auto_226405 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226404 ?auto_226407 ) ( IN-CITY ?auto_226407 ?auto_226406 ) ( IN-CITY ?auto_226399 ?auto_226406 ) ( not ( = ?auto_226399 ?auto_226407 ) ) ( OBJ-AT ?auto_226405 ?auto_226399 ) ( not ( = ?auto_226405 ?auto_226402 ) ) ( OBJ-AT ?auto_226402 ?auto_226407 ) ( OBJ-AT ?auto_226400 ?auto_226399 ) ( OBJ-AT ?auto_226401 ?auto_226399 ) ( OBJ-AT ?auto_226403 ?auto_226399 ) ( not ( = ?auto_226400 ?auto_226401 ) ) ( not ( = ?auto_226400 ?auto_226402 ) ) ( not ( = ?auto_226400 ?auto_226403 ) ) ( not ( = ?auto_226400 ?auto_226405 ) ) ( not ( = ?auto_226401 ?auto_226402 ) ) ( not ( = ?auto_226401 ?auto_226403 ) ) ( not ( = ?auto_226401 ?auto_226405 ) ) ( not ( = ?auto_226402 ?auto_226403 ) ) ( not ( = ?auto_226403 ?auto_226405 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226405 ?auto_226402 ?auto_226399 )
      ( DELIVER-4PKG-VERIFY ?auto_226400 ?auto_226401 ?auto_226402 ?auto_226403 ?auto_226399 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226442 - OBJ
      ?auto_226443 - OBJ
      ?auto_226444 - OBJ
      ?auto_226445 - OBJ
      ?auto_226441 - LOCATION
    )
    :vars
    (
      ?auto_226446 - TRUCK
      ?auto_226448 - LOCATION
      ?auto_226447 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226446 ?auto_226448 ) ( IN-CITY ?auto_226448 ?auto_226447 ) ( IN-CITY ?auto_226441 ?auto_226447 ) ( not ( = ?auto_226441 ?auto_226448 ) ) ( OBJ-AT ?auto_226445 ?auto_226441 ) ( not ( = ?auto_226445 ?auto_226443 ) ) ( OBJ-AT ?auto_226443 ?auto_226448 ) ( OBJ-AT ?auto_226442 ?auto_226441 ) ( OBJ-AT ?auto_226444 ?auto_226441 ) ( not ( = ?auto_226442 ?auto_226443 ) ) ( not ( = ?auto_226442 ?auto_226444 ) ) ( not ( = ?auto_226442 ?auto_226445 ) ) ( not ( = ?auto_226443 ?auto_226444 ) ) ( not ( = ?auto_226444 ?auto_226445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226445 ?auto_226443 ?auto_226441 )
      ( DELIVER-4PKG-VERIFY ?auto_226442 ?auto_226443 ?auto_226444 ?auto_226445 ?auto_226441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226450 - OBJ
      ?auto_226451 - OBJ
      ?auto_226452 - OBJ
      ?auto_226453 - OBJ
      ?auto_226449 - LOCATION
    )
    :vars
    (
      ?auto_226454 - TRUCK
      ?auto_226457 - LOCATION
      ?auto_226456 - CITY
      ?auto_226455 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226454 ?auto_226457 ) ( IN-CITY ?auto_226457 ?auto_226456 ) ( IN-CITY ?auto_226449 ?auto_226456 ) ( not ( = ?auto_226449 ?auto_226457 ) ) ( OBJ-AT ?auto_226455 ?auto_226449 ) ( not ( = ?auto_226455 ?auto_226451 ) ) ( OBJ-AT ?auto_226451 ?auto_226457 ) ( OBJ-AT ?auto_226450 ?auto_226449 ) ( OBJ-AT ?auto_226452 ?auto_226449 ) ( OBJ-AT ?auto_226453 ?auto_226449 ) ( not ( = ?auto_226450 ?auto_226451 ) ) ( not ( = ?auto_226450 ?auto_226452 ) ) ( not ( = ?auto_226450 ?auto_226453 ) ) ( not ( = ?auto_226450 ?auto_226455 ) ) ( not ( = ?auto_226451 ?auto_226452 ) ) ( not ( = ?auto_226451 ?auto_226453 ) ) ( not ( = ?auto_226452 ?auto_226453 ) ) ( not ( = ?auto_226452 ?auto_226455 ) ) ( not ( = ?auto_226453 ?auto_226455 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226455 ?auto_226451 ?auto_226449 )
      ( DELIVER-4PKG-VERIFY ?auto_226450 ?auto_226451 ?auto_226452 ?auto_226453 ?auto_226449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226494 - OBJ
      ?auto_226495 - OBJ
      ?auto_226496 - OBJ
      ?auto_226497 - OBJ
      ?auto_226493 - LOCATION
    )
    :vars
    (
      ?auto_226498 - TRUCK
      ?auto_226500 - LOCATION
      ?auto_226499 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226498 ?auto_226500 ) ( IN-CITY ?auto_226500 ?auto_226499 ) ( IN-CITY ?auto_226493 ?auto_226499 ) ( not ( = ?auto_226493 ?auto_226500 ) ) ( OBJ-AT ?auto_226496 ?auto_226493 ) ( not ( = ?auto_226496 ?auto_226494 ) ) ( OBJ-AT ?auto_226494 ?auto_226500 ) ( OBJ-AT ?auto_226495 ?auto_226493 ) ( OBJ-AT ?auto_226497 ?auto_226493 ) ( not ( = ?auto_226494 ?auto_226495 ) ) ( not ( = ?auto_226494 ?auto_226497 ) ) ( not ( = ?auto_226495 ?auto_226496 ) ) ( not ( = ?auto_226495 ?auto_226497 ) ) ( not ( = ?auto_226496 ?auto_226497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226496 ?auto_226494 ?auto_226493 )
      ( DELIVER-4PKG-VERIFY ?auto_226494 ?auto_226495 ?auto_226496 ?auto_226497 ?auto_226493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226518 - OBJ
      ?auto_226519 - OBJ
      ?auto_226520 - OBJ
      ?auto_226521 - OBJ
      ?auto_226517 - LOCATION
    )
    :vars
    (
      ?auto_226522 - TRUCK
      ?auto_226524 - LOCATION
      ?auto_226523 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226522 ?auto_226524 ) ( IN-CITY ?auto_226524 ?auto_226523 ) ( IN-CITY ?auto_226517 ?auto_226523 ) ( not ( = ?auto_226517 ?auto_226524 ) ) ( OBJ-AT ?auto_226519 ?auto_226517 ) ( not ( = ?auto_226519 ?auto_226518 ) ) ( OBJ-AT ?auto_226518 ?auto_226524 ) ( OBJ-AT ?auto_226520 ?auto_226517 ) ( OBJ-AT ?auto_226521 ?auto_226517 ) ( not ( = ?auto_226518 ?auto_226520 ) ) ( not ( = ?auto_226518 ?auto_226521 ) ) ( not ( = ?auto_226519 ?auto_226520 ) ) ( not ( = ?auto_226519 ?auto_226521 ) ) ( not ( = ?auto_226520 ?auto_226521 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226519 ?auto_226518 ?auto_226517 )
      ( DELIVER-4PKG-VERIFY ?auto_226518 ?auto_226519 ?auto_226520 ?auto_226521 ?auto_226517 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226598 - OBJ
      ?auto_226599 - OBJ
      ?auto_226600 - OBJ
      ?auto_226601 - OBJ
      ?auto_226597 - LOCATION
    )
    :vars
    (
      ?auto_226602 - TRUCK
      ?auto_226605 - LOCATION
      ?auto_226604 - CITY
      ?auto_226603 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226602 ?auto_226605 ) ( IN-CITY ?auto_226605 ?auto_226604 ) ( IN-CITY ?auto_226597 ?auto_226604 ) ( not ( = ?auto_226597 ?auto_226605 ) ) ( OBJ-AT ?auto_226603 ?auto_226597 ) ( not ( = ?auto_226603 ?auto_226598 ) ) ( OBJ-AT ?auto_226598 ?auto_226605 ) ( OBJ-AT ?auto_226599 ?auto_226597 ) ( OBJ-AT ?auto_226600 ?auto_226597 ) ( OBJ-AT ?auto_226601 ?auto_226597 ) ( not ( = ?auto_226598 ?auto_226599 ) ) ( not ( = ?auto_226598 ?auto_226600 ) ) ( not ( = ?auto_226598 ?auto_226601 ) ) ( not ( = ?auto_226599 ?auto_226600 ) ) ( not ( = ?auto_226599 ?auto_226601 ) ) ( not ( = ?auto_226599 ?auto_226603 ) ) ( not ( = ?auto_226600 ?auto_226601 ) ) ( not ( = ?auto_226600 ?auto_226603 ) ) ( not ( = ?auto_226601 ?auto_226603 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226603 ?auto_226598 ?auto_226597 )
      ( DELIVER-4PKG-VERIFY ?auto_226598 ?auto_226599 ?auto_226600 ?auto_226601 ?auto_226597 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226727 - OBJ
      ?auto_226728 - OBJ
      ?auto_226729 - OBJ
      ?auto_226730 - OBJ
      ?auto_226731 - OBJ
      ?auto_226726 - LOCATION
    )
    :vars
    (
      ?auto_226732 - TRUCK
      ?auto_226734 - LOCATION
      ?auto_226733 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226732 ?auto_226734 ) ( IN-CITY ?auto_226734 ?auto_226733 ) ( IN-CITY ?auto_226726 ?auto_226733 ) ( not ( = ?auto_226726 ?auto_226734 ) ) ( OBJ-AT ?auto_226727 ?auto_226726 ) ( not ( = ?auto_226727 ?auto_226731 ) ) ( OBJ-AT ?auto_226731 ?auto_226734 ) ( OBJ-AT ?auto_226728 ?auto_226726 ) ( OBJ-AT ?auto_226729 ?auto_226726 ) ( OBJ-AT ?auto_226730 ?auto_226726 ) ( not ( = ?auto_226727 ?auto_226728 ) ) ( not ( = ?auto_226727 ?auto_226729 ) ) ( not ( = ?auto_226727 ?auto_226730 ) ) ( not ( = ?auto_226728 ?auto_226729 ) ) ( not ( = ?auto_226728 ?auto_226730 ) ) ( not ( = ?auto_226728 ?auto_226731 ) ) ( not ( = ?auto_226729 ?auto_226730 ) ) ( not ( = ?auto_226729 ?auto_226731 ) ) ( not ( = ?auto_226730 ?auto_226731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226727 ?auto_226731 ?auto_226726 )
      ( DELIVER-5PKG-VERIFY ?auto_226727 ?auto_226728 ?auto_226729 ?auto_226730 ?auto_226731 ?auto_226726 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226745 - OBJ
      ?auto_226746 - OBJ
      ?auto_226747 - OBJ
      ?auto_226748 - OBJ
      ?auto_226749 - OBJ
      ?auto_226744 - LOCATION
    )
    :vars
    (
      ?auto_226750 - TRUCK
      ?auto_226752 - LOCATION
      ?auto_226751 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226750 ?auto_226752 ) ( IN-CITY ?auto_226752 ?auto_226751 ) ( IN-CITY ?auto_226744 ?auto_226751 ) ( not ( = ?auto_226744 ?auto_226752 ) ) ( OBJ-AT ?auto_226745 ?auto_226744 ) ( not ( = ?auto_226745 ?auto_226748 ) ) ( OBJ-AT ?auto_226748 ?auto_226752 ) ( OBJ-AT ?auto_226746 ?auto_226744 ) ( OBJ-AT ?auto_226747 ?auto_226744 ) ( OBJ-AT ?auto_226749 ?auto_226744 ) ( not ( = ?auto_226745 ?auto_226746 ) ) ( not ( = ?auto_226745 ?auto_226747 ) ) ( not ( = ?auto_226745 ?auto_226749 ) ) ( not ( = ?auto_226746 ?auto_226747 ) ) ( not ( = ?auto_226746 ?auto_226748 ) ) ( not ( = ?auto_226746 ?auto_226749 ) ) ( not ( = ?auto_226747 ?auto_226748 ) ) ( not ( = ?auto_226747 ?auto_226749 ) ) ( not ( = ?auto_226748 ?auto_226749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226745 ?auto_226748 ?auto_226744 )
      ( DELIVER-5PKG-VERIFY ?auto_226745 ?auto_226746 ?auto_226747 ?auto_226748 ?auto_226749 ?auto_226744 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226763 - OBJ
      ?auto_226764 - OBJ
      ?auto_226765 - OBJ
      ?auto_226766 - OBJ
      ?auto_226767 - OBJ
      ?auto_226762 - LOCATION
    )
    :vars
    (
      ?auto_226768 - TRUCK
      ?auto_226770 - LOCATION
      ?auto_226769 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226768 ?auto_226770 ) ( IN-CITY ?auto_226770 ?auto_226769 ) ( IN-CITY ?auto_226762 ?auto_226769 ) ( not ( = ?auto_226762 ?auto_226770 ) ) ( OBJ-AT ?auto_226764 ?auto_226762 ) ( not ( = ?auto_226764 ?auto_226767 ) ) ( OBJ-AT ?auto_226767 ?auto_226770 ) ( OBJ-AT ?auto_226763 ?auto_226762 ) ( OBJ-AT ?auto_226765 ?auto_226762 ) ( OBJ-AT ?auto_226766 ?auto_226762 ) ( not ( = ?auto_226763 ?auto_226764 ) ) ( not ( = ?auto_226763 ?auto_226765 ) ) ( not ( = ?auto_226763 ?auto_226766 ) ) ( not ( = ?auto_226763 ?auto_226767 ) ) ( not ( = ?auto_226764 ?auto_226765 ) ) ( not ( = ?auto_226764 ?auto_226766 ) ) ( not ( = ?auto_226765 ?auto_226766 ) ) ( not ( = ?auto_226765 ?auto_226767 ) ) ( not ( = ?auto_226766 ?auto_226767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226764 ?auto_226767 ?auto_226762 )
      ( DELIVER-5PKG-VERIFY ?auto_226763 ?auto_226764 ?auto_226765 ?auto_226766 ?auto_226767 ?auto_226762 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226808 - OBJ
      ?auto_226809 - OBJ
      ?auto_226810 - OBJ
      ?auto_226811 - OBJ
      ?auto_226812 - OBJ
      ?auto_226807 - LOCATION
    )
    :vars
    (
      ?auto_226813 - TRUCK
      ?auto_226815 - LOCATION
      ?auto_226814 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226813 ?auto_226815 ) ( IN-CITY ?auto_226815 ?auto_226814 ) ( IN-CITY ?auto_226807 ?auto_226814 ) ( not ( = ?auto_226807 ?auto_226815 ) ) ( OBJ-AT ?auto_226811 ?auto_226807 ) ( not ( = ?auto_226811 ?auto_226810 ) ) ( OBJ-AT ?auto_226810 ?auto_226815 ) ( OBJ-AT ?auto_226808 ?auto_226807 ) ( OBJ-AT ?auto_226809 ?auto_226807 ) ( OBJ-AT ?auto_226812 ?auto_226807 ) ( not ( = ?auto_226808 ?auto_226809 ) ) ( not ( = ?auto_226808 ?auto_226810 ) ) ( not ( = ?auto_226808 ?auto_226811 ) ) ( not ( = ?auto_226808 ?auto_226812 ) ) ( not ( = ?auto_226809 ?auto_226810 ) ) ( not ( = ?auto_226809 ?auto_226811 ) ) ( not ( = ?auto_226809 ?auto_226812 ) ) ( not ( = ?auto_226810 ?auto_226812 ) ) ( not ( = ?auto_226811 ?auto_226812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226811 ?auto_226810 ?auto_226807 )
      ( DELIVER-5PKG-VERIFY ?auto_226808 ?auto_226809 ?auto_226810 ?auto_226811 ?auto_226812 ?auto_226807 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226835 - OBJ
      ?auto_226836 - OBJ
      ?auto_226837 - OBJ
      ?auto_226838 - OBJ
      ?auto_226839 - OBJ
      ?auto_226834 - LOCATION
    )
    :vars
    (
      ?auto_226840 - TRUCK
      ?auto_226842 - LOCATION
      ?auto_226841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226840 ?auto_226842 ) ( IN-CITY ?auto_226842 ?auto_226841 ) ( IN-CITY ?auto_226834 ?auto_226841 ) ( not ( = ?auto_226834 ?auto_226842 ) ) ( OBJ-AT ?auto_226839 ?auto_226834 ) ( not ( = ?auto_226839 ?auto_226837 ) ) ( OBJ-AT ?auto_226837 ?auto_226842 ) ( OBJ-AT ?auto_226835 ?auto_226834 ) ( OBJ-AT ?auto_226836 ?auto_226834 ) ( OBJ-AT ?auto_226838 ?auto_226834 ) ( not ( = ?auto_226835 ?auto_226836 ) ) ( not ( = ?auto_226835 ?auto_226837 ) ) ( not ( = ?auto_226835 ?auto_226838 ) ) ( not ( = ?auto_226835 ?auto_226839 ) ) ( not ( = ?auto_226836 ?auto_226837 ) ) ( not ( = ?auto_226836 ?auto_226838 ) ) ( not ( = ?auto_226836 ?auto_226839 ) ) ( not ( = ?auto_226837 ?auto_226838 ) ) ( not ( = ?auto_226838 ?auto_226839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226839 ?auto_226837 ?auto_226834 )
      ( DELIVER-5PKG-VERIFY ?auto_226835 ?auto_226836 ?auto_226837 ?auto_226838 ?auto_226839 ?auto_226834 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226844 - OBJ
      ?auto_226845 - OBJ
      ?auto_226846 - OBJ
      ?auto_226847 - OBJ
      ?auto_226848 - OBJ
      ?auto_226843 - LOCATION
    )
    :vars
    (
      ?auto_226849 - TRUCK
      ?auto_226851 - LOCATION
      ?auto_226850 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226849 ?auto_226851 ) ( IN-CITY ?auto_226851 ?auto_226850 ) ( IN-CITY ?auto_226843 ?auto_226850 ) ( not ( = ?auto_226843 ?auto_226851 ) ) ( OBJ-AT ?auto_226844 ?auto_226843 ) ( not ( = ?auto_226844 ?auto_226846 ) ) ( OBJ-AT ?auto_226846 ?auto_226851 ) ( OBJ-AT ?auto_226845 ?auto_226843 ) ( OBJ-AT ?auto_226847 ?auto_226843 ) ( OBJ-AT ?auto_226848 ?auto_226843 ) ( not ( = ?auto_226844 ?auto_226845 ) ) ( not ( = ?auto_226844 ?auto_226847 ) ) ( not ( = ?auto_226844 ?auto_226848 ) ) ( not ( = ?auto_226845 ?auto_226846 ) ) ( not ( = ?auto_226845 ?auto_226847 ) ) ( not ( = ?auto_226845 ?auto_226848 ) ) ( not ( = ?auto_226846 ?auto_226847 ) ) ( not ( = ?auto_226846 ?auto_226848 ) ) ( not ( = ?auto_226847 ?auto_226848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226844 ?auto_226846 ?auto_226843 )
      ( DELIVER-5PKG-VERIFY ?auto_226844 ?auto_226845 ?auto_226846 ?auto_226847 ?auto_226848 ?auto_226843 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226889 - OBJ
      ?auto_226890 - OBJ
      ?auto_226891 - OBJ
      ?auto_226892 - OBJ
      ?auto_226893 - OBJ
      ?auto_226888 - LOCATION
    )
    :vars
    (
      ?auto_226894 - TRUCK
      ?auto_226896 - LOCATION
      ?auto_226895 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_226894 ?auto_226896 ) ( IN-CITY ?auto_226896 ?auto_226895 ) ( IN-CITY ?auto_226888 ?auto_226895 ) ( not ( = ?auto_226888 ?auto_226896 ) ) ( OBJ-AT ?auto_226892 ?auto_226888 ) ( not ( = ?auto_226892 ?auto_226893 ) ) ( OBJ-AT ?auto_226893 ?auto_226896 ) ( OBJ-AT ?auto_226889 ?auto_226888 ) ( OBJ-AT ?auto_226890 ?auto_226888 ) ( OBJ-AT ?auto_226891 ?auto_226888 ) ( not ( = ?auto_226889 ?auto_226890 ) ) ( not ( = ?auto_226889 ?auto_226891 ) ) ( not ( = ?auto_226889 ?auto_226892 ) ) ( not ( = ?auto_226889 ?auto_226893 ) ) ( not ( = ?auto_226890 ?auto_226891 ) ) ( not ( = ?auto_226890 ?auto_226892 ) ) ( not ( = ?auto_226890 ?auto_226893 ) ) ( not ( = ?auto_226891 ?auto_226892 ) ) ( not ( = ?auto_226891 ?auto_226893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_226892 ?auto_226893 ?auto_226888 )
      ( DELIVER-5PKG-VERIFY ?auto_226889 ?auto_226890 ?auto_226891 ?auto_226892 ?auto_226893 ?auto_226888 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227060 - OBJ
      ?auto_227061 - OBJ
      ?auto_227062 - OBJ
      ?auto_227063 - OBJ
      ?auto_227064 - OBJ
      ?auto_227059 - LOCATION
    )
    :vars
    (
      ?auto_227065 - TRUCK
      ?auto_227067 - LOCATION
      ?auto_227066 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227065 ?auto_227067 ) ( IN-CITY ?auto_227067 ?auto_227066 ) ( IN-CITY ?auto_227059 ?auto_227066 ) ( not ( = ?auto_227059 ?auto_227067 ) ) ( OBJ-AT ?auto_227064 ?auto_227059 ) ( not ( = ?auto_227064 ?auto_227061 ) ) ( OBJ-AT ?auto_227061 ?auto_227067 ) ( OBJ-AT ?auto_227060 ?auto_227059 ) ( OBJ-AT ?auto_227062 ?auto_227059 ) ( OBJ-AT ?auto_227063 ?auto_227059 ) ( not ( = ?auto_227060 ?auto_227061 ) ) ( not ( = ?auto_227060 ?auto_227062 ) ) ( not ( = ?auto_227060 ?auto_227063 ) ) ( not ( = ?auto_227060 ?auto_227064 ) ) ( not ( = ?auto_227061 ?auto_227062 ) ) ( not ( = ?auto_227061 ?auto_227063 ) ) ( not ( = ?auto_227062 ?auto_227063 ) ) ( not ( = ?auto_227062 ?auto_227064 ) ) ( not ( = ?auto_227063 ?auto_227064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227064 ?auto_227061 ?auto_227059 )
      ( DELIVER-5PKG-VERIFY ?auto_227060 ?auto_227061 ?auto_227062 ?auto_227063 ?auto_227064 ?auto_227059 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227096 - OBJ
      ?auto_227097 - OBJ
      ?auto_227098 - OBJ
      ?auto_227099 - OBJ
      ?auto_227100 - OBJ
      ?auto_227095 - LOCATION
    )
    :vars
    (
      ?auto_227101 - TRUCK
      ?auto_227103 - LOCATION
      ?auto_227102 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227101 ?auto_227103 ) ( IN-CITY ?auto_227103 ?auto_227102 ) ( IN-CITY ?auto_227095 ?auto_227102 ) ( not ( = ?auto_227095 ?auto_227103 ) ) ( OBJ-AT ?auto_227096 ?auto_227095 ) ( not ( = ?auto_227096 ?auto_227097 ) ) ( OBJ-AT ?auto_227097 ?auto_227103 ) ( OBJ-AT ?auto_227098 ?auto_227095 ) ( OBJ-AT ?auto_227099 ?auto_227095 ) ( OBJ-AT ?auto_227100 ?auto_227095 ) ( not ( = ?auto_227096 ?auto_227098 ) ) ( not ( = ?auto_227096 ?auto_227099 ) ) ( not ( = ?auto_227096 ?auto_227100 ) ) ( not ( = ?auto_227097 ?auto_227098 ) ) ( not ( = ?auto_227097 ?auto_227099 ) ) ( not ( = ?auto_227097 ?auto_227100 ) ) ( not ( = ?auto_227098 ?auto_227099 ) ) ( not ( = ?auto_227098 ?auto_227100 ) ) ( not ( = ?auto_227099 ?auto_227100 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227096 ?auto_227097 ?auto_227095 )
      ( DELIVER-5PKG-VERIFY ?auto_227096 ?auto_227097 ?auto_227098 ?auto_227099 ?auto_227100 ?auto_227095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227321 - OBJ
      ?auto_227322 - OBJ
      ?auto_227323 - OBJ
      ?auto_227324 - OBJ
      ?auto_227325 - OBJ
      ?auto_227320 - LOCATION
    )
    :vars
    (
      ?auto_227326 - TRUCK
      ?auto_227328 - LOCATION
      ?auto_227327 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227326 ?auto_227328 ) ( IN-CITY ?auto_227328 ?auto_227327 ) ( IN-CITY ?auto_227320 ?auto_227327 ) ( not ( = ?auto_227320 ?auto_227328 ) ) ( OBJ-AT ?auto_227322 ?auto_227320 ) ( not ( = ?auto_227322 ?auto_227324 ) ) ( OBJ-AT ?auto_227324 ?auto_227328 ) ( OBJ-AT ?auto_227321 ?auto_227320 ) ( OBJ-AT ?auto_227323 ?auto_227320 ) ( OBJ-AT ?auto_227325 ?auto_227320 ) ( not ( = ?auto_227321 ?auto_227322 ) ) ( not ( = ?auto_227321 ?auto_227323 ) ) ( not ( = ?auto_227321 ?auto_227324 ) ) ( not ( = ?auto_227321 ?auto_227325 ) ) ( not ( = ?auto_227322 ?auto_227323 ) ) ( not ( = ?auto_227322 ?auto_227325 ) ) ( not ( = ?auto_227323 ?auto_227324 ) ) ( not ( = ?auto_227323 ?auto_227325 ) ) ( not ( = ?auto_227324 ?auto_227325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227322 ?auto_227324 ?auto_227320 )
      ( DELIVER-5PKG-VERIFY ?auto_227321 ?auto_227322 ?auto_227323 ?auto_227324 ?auto_227325 ?auto_227320 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227492 - OBJ
      ?auto_227493 - OBJ
      ?auto_227494 - OBJ
      ?auto_227495 - OBJ
      ?auto_227496 - OBJ
      ?auto_227491 - LOCATION
    )
    :vars
    (
      ?auto_227497 - TRUCK
      ?auto_227499 - LOCATION
      ?auto_227498 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227497 ?auto_227499 ) ( IN-CITY ?auto_227499 ?auto_227498 ) ( IN-CITY ?auto_227491 ?auto_227498 ) ( not ( = ?auto_227491 ?auto_227499 ) ) ( OBJ-AT ?auto_227494 ?auto_227491 ) ( not ( = ?auto_227494 ?auto_227495 ) ) ( OBJ-AT ?auto_227495 ?auto_227499 ) ( OBJ-AT ?auto_227492 ?auto_227491 ) ( OBJ-AT ?auto_227493 ?auto_227491 ) ( OBJ-AT ?auto_227496 ?auto_227491 ) ( not ( = ?auto_227492 ?auto_227493 ) ) ( not ( = ?auto_227492 ?auto_227494 ) ) ( not ( = ?auto_227492 ?auto_227495 ) ) ( not ( = ?auto_227492 ?auto_227496 ) ) ( not ( = ?auto_227493 ?auto_227494 ) ) ( not ( = ?auto_227493 ?auto_227495 ) ) ( not ( = ?auto_227493 ?auto_227496 ) ) ( not ( = ?auto_227494 ?auto_227496 ) ) ( not ( = ?auto_227495 ?auto_227496 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227494 ?auto_227495 ?auto_227491 )
      ( DELIVER-5PKG-VERIFY ?auto_227492 ?auto_227493 ?auto_227494 ?auto_227495 ?auto_227496 ?auto_227491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227528 - OBJ
      ?auto_227529 - OBJ
      ?auto_227530 - OBJ
      ?auto_227531 - OBJ
      ?auto_227532 - OBJ
      ?auto_227527 - LOCATION
    )
    :vars
    (
      ?auto_227533 - TRUCK
      ?auto_227536 - LOCATION
      ?auto_227535 - CITY
      ?auto_227534 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227533 ?auto_227536 ) ( IN-CITY ?auto_227536 ?auto_227535 ) ( IN-CITY ?auto_227527 ?auto_227535 ) ( not ( = ?auto_227527 ?auto_227536 ) ) ( OBJ-AT ?auto_227534 ?auto_227527 ) ( not ( = ?auto_227534 ?auto_227532 ) ) ( OBJ-AT ?auto_227532 ?auto_227536 ) ( OBJ-AT ?auto_227528 ?auto_227527 ) ( OBJ-AT ?auto_227529 ?auto_227527 ) ( OBJ-AT ?auto_227530 ?auto_227527 ) ( OBJ-AT ?auto_227531 ?auto_227527 ) ( not ( = ?auto_227528 ?auto_227529 ) ) ( not ( = ?auto_227528 ?auto_227530 ) ) ( not ( = ?auto_227528 ?auto_227531 ) ) ( not ( = ?auto_227528 ?auto_227532 ) ) ( not ( = ?auto_227528 ?auto_227534 ) ) ( not ( = ?auto_227529 ?auto_227530 ) ) ( not ( = ?auto_227529 ?auto_227531 ) ) ( not ( = ?auto_227529 ?auto_227532 ) ) ( not ( = ?auto_227529 ?auto_227534 ) ) ( not ( = ?auto_227530 ?auto_227531 ) ) ( not ( = ?auto_227530 ?auto_227532 ) ) ( not ( = ?auto_227530 ?auto_227534 ) ) ( not ( = ?auto_227531 ?auto_227532 ) ) ( not ( = ?auto_227531 ?auto_227534 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227534 ?auto_227532 ?auto_227527 )
      ( DELIVER-5PKG-VERIFY ?auto_227528 ?auto_227529 ?auto_227530 ?auto_227531 ?auto_227532 ?auto_227527 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227547 - OBJ
      ?auto_227548 - OBJ
      ?auto_227549 - OBJ
      ?auto_227550 - OBJ
      ?auto_227551 - OBJ
      ?auto_227546 - LOCATION
    )
    :vars
    (
      ?auto_227552 - TRUCK
      ?auto_227555 - LOCATION
      ?auto_227554 - CITY
      ?auto_227553 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227552 ?auto_227555 ) ( IN-CITY ?auto_227555 ?auto_227554 ) ( IN-CITY ?auto_227546 ?auto_227554 ) ( not ( = ?auto_227546 ?auto_227555 ) ) ( OBJ-AT ?auto_227553 ?auto_227546 ) ( not ( = ?auto_227553 ?auto_227550 ) ) ( OBJ-AT ?auto_227550 ?auto_227555 ) ( OBJ-AT ?auto_227547 ?auto_227546 ) ( OBJ-AT ?auto_227548 ?auto_227546 ) ( OBJ-AT ?auto_227549 ?auto_227546 ) ( OBJ-AT ?auto_227551 ?auto_227546 ) ( not ( = ?auto_227547 ?auto_227548 ) ) ( not ( = ?auto_227547 ?auto_227549 ) ) ( not ( = ?auto_227547 ?auto_227550 ) ) ( not ( = ?auto_227547 ?auto_227551 ) ) ( not ( = ?auto_227547 ?auto_227553 ) ) ( not ( = ?auto_227548 ?auto_227549 ) ) ( not ( = ?auto_227548 ?auto_227550 ) ) ( not ( = ?auto_227548 ?auto_227551 ) ) ( not ( = ?auto_227548 ?auto_227553 ) ) ( not ( = ?auto_227549 ?auto_227550 ) ) ( not ( = ?auto_227549 ?auto_227551 ) ) ( not ( = ?auto_227549 ?auto_227553 ) ) ( not ( = ?auto_227550 ?auto_227551 ) ) ( not ( = ?auto_227551 ?auto_227553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227553 ?auto_227550 ?auto_227546 )
      ( DELIVER-5PKG-VERIFY ?auto_227547 ?auto_227548 ?auto_227549 ?auto_227550 ?auto_227551 ?auto_227546 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227603 - OBJ
      ?auto_227604 - OBJ
      ?auto_227605 - OBJ
      ?auto_227606 - OBJ
      ?auto_227607 - OBJ
      ?auto_227602 - LOCATION
    )
    :vars
    (
      ?auto_227608 - TRUCK
      ?auto_227611 - LOCATION
      ?auto_227610 - CITY
      ?auto_227609 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227608 ?auto_227611 ) ( IN-CITY ?auto_227611 ?auto_227610 ) ( IN-CITY ?auto_227602 ?auto_227610 ) ( not ( = ?auto_227602 ?auto_227611 ) ) ( OBJ-AT ?auto_227609 ?auto_227602 ) ( not ( = ?auto_227609 ?auto_227605 ) ) ( OBJ-AT ?auto_227605 ?auto_227611 ) ( OBJ-AT ?auto_227603 ?auto_227602 ) ( OBJ-AT ?auto_227604 ?auto_227602 ) ( OBJ-AT ?auto_227606 ?auto_227602 ) ( OBJ-AT ?auto_227607 ?auto_227602 ) ( not ( = ?auto_227603 ?auto_227604 ) ) ( not ( = ?auto_227603 ?auto_227605 ) ) ( not ( = ?auto_227603 ?auto_227606 ) ) ( not ( = ?auto_227603 ?auto_227607 ) ) ( not ( = ?auto_227603 ?auto_227609 ) ) ( not ( = ?auto_227604 ?auto_227605 ) ) ( not ( = ?auto_227604 ?auto_227606 ) ) ( not ( = ?auto_227604 ?auto_227607 ) ) ( not ( = ?auto_227604 ?auto_227609 ) ) ( not ( = ?auto_227605 ?auto_227606 ) ) ( not ( = ?auto_227605 ?auto_227607 ) ) ( not ( = ?auto_227606 ?auto_227607 ) ) ( not ( = ?auto_227606 ?auto_227609 ) ) ( not ( = ?auto_227607 ?auto_227609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227609 ?auto_227605 ?auto_227602 )
      ( DELIVER-5PKG-VERIFY ?auto_227603 ?auto_227604 ?auto_227605 ?auto_227606 ?auto_227607 ?auto_227602 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227652 - OBJ
      ?auto_227653 - OBJ
      ?auto_227654 - OBJ
      ?auto_227655 - OBJ
      ?auto_227656 - OBJ
      ?auto_227651 - LOCATION
    )
    :vars
    (
      ?auto_227657 - TRUCK
      ?auto_227659 - LOCATION
      ?auto_227658 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227657 ?auto_227659 ) ( IN-CITY ?auto_227659 ?auto_227658 ) ( IN-CITY ?auto_227651 ?auto_227658 ) ( not ( = ?auto_227651 ?auto_227659 ) ) ( OBJ-AT ?auto_227655 ?auto_227651 ) ( not ( = ?auto_227655 ?auto_227653 ) ) ( OBJ-AT ?auto_227653 ?auto_227659 ) ( OBJ-AT ?auto_227652 ?auto_227651 ) ( OBJ-AT ?auto_227654 ?auto_227651 ) ( OBJ-AT ?auto_227656 ?auto_227651 ) ( not ( = ?auto_227652 ?auto_227653 ) ) ( not ( = ?auto_227652 ?auto_227654 ) ) ( not ( = ?auto_227652 ?auto_227655 ) ) ( not ( = ?auto_227652 ?auto_227656 ) ) ( not ( = ?auto_227653 ?auto_227654 ) ) ( not ( = ?auto_227653 ?auto_227656 ) ) ( not ( = ?auto_227654 ?auto_227655 ) ) ( not ( = ?auto_227654 ?auto_227656 ) ) ( not ( = ?auto_227655 ?auto_227656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227655 ?auto_227653 ?auto_227651 )
      ( DELIVER-5PKG-VERIFY ?auto_227652 ?auto_227653 ?auto_227654 ?auto_227655 ?auto_227656 ?auto_227651 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227769 - OBJ
      ?auto_227770 - OBJ
      ?auto_227771 - OBJ
      ?auto_227772 - OBJ
      ?auto_227773 - OBJ
      ?auto_227768 - LOCATION
    )
    :vars
    (
      ?auto_227774 - TRUCK
      ?auto_227777 - LOCATION
      ?auto_227776 - CITY
      ?auto_227775 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227774 ?auto_227777 ) ( IN-CITY ?auto_227777 ?auto_227776 ) ( IN-CITY ?auto_227768 ?auto_227776 ) ( not ( = ?auto_227768 ?auto_227777 ) ) ( OBJ-AT ?auto_227775 ?auto_227768 ) ( not ( = ?auto_227775 ?auto_227770 ) ) ( OBJ-AT ?auto_227770 ?auto_227777 ) ( OBJ-AT ?auto_227769 ?auto_227768 ) ( OBJ-AT ?auto_227771 ?auto_227768 ) ( OBJ-AT ?auto_227772 ?auto_227768 ) ( OBJ-AT ?auto_227773 ?auto_227768 ) ( not ( = ?auto_227769 ?auto_227770 ) ) ( not ( = ?auto_227769 ?auto_227771 ) ) ( not ( = ?auto_227769 ?auto_227772 ) ) ( not ( = ?auto_227769 ?auto_227773 ) ) ( not ( = ?auto_227769 ?auto_227775 ) ) ( not ( = ?auto_227770 ?auto_227771 ) ) ( not ( = ?auto_227770 ?auto_227772 ) ) ( not ( = ?auto_227770 ?auto_227773 ) ) ( not ( = ?auto_227771 ?auto_227772 ) ) ( not ( = ?auto_227771 ?auto_227773 ) ) ( not ( = ?auto_227771 ?auto_227775 ) ) ( not ( = ?auto_227772 ?auto_227773 ) ) ( not ( = ?auto_227772 ?auto_227775 ) ) ( not ( = ?auto_227773 ?auto_227775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227775 ?auto_227770 ?auto_227768 )
      ( DELIVER-5PKG-VERIFY ?auto_227769 ?auto_227770 ?auto_227771 ?auto_227772 ?auto_227773 ?auto_227768 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227912 - OBJ
      ?auto_227913 - OBJ
      ?auto_227914 - OBJ
      ?auto_227915 - OBJ
      ?auto_227916 - OBJ
      ?auto_227911 - LOCATION
    )
    :vars
    (
      ?auto_227917 - TRUCK
      ?auto_227919 - LOCATION
      ?auto_227918 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_227917 ?auto_227919 ) ( IN-CITY ?auto_227919 ?auto_227918 ) ( IN-CITY ?auto_227911 ?auto_227918 ) ( not ( = ?auto_227911 ?auto_227919 ) ) ( OBJ-AT ?auto_227913 ?auto_227911 ) ( not ( = ?auto_227913 ?auto_227912 ) ) ( OBJ-AT ?auto_227912 ?auto_227919 ) ( OBJ-AT ?auto_227914 ?auto_227911 ) ( OBJ-AT ?auto_227915 ?auto_227911 ) ( OBJ-AT ?auto_227916 ?auto_227911 ) ( not ( = ?auto_227912 ?auto_227914 ) ) ( not ( = ?auto_227912 ?auto_227915 ) ) ( not ( = ?auto_227912 ?auto_227916 ) ) ( not ( = ?auto_227913 ?auto_227914 ) ) ( not ( = ?auto_227913 ?auto_227915 ) ) ( not ( = ?auto_227913 ?auto_227916 ) ) ( not ( = ?auto_227914 ?auto_227915 ) ) ( not ( = ?auto_227914 ?auto_227916 ) ) ( not ( = ?auto_227915 ?auto_227916 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_227913 ?auto_227912 ?auto_227911 )
      ( DELIVER-5PKG-VERIFY ?auto_227912 ?auto_227913 ?auto_227914 ?auto_227915 ?auto_227916 ?auto_227911 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228146 - OBJ
      ?auto_228147 - OBJ
      ?auto_228148 - OBJ
      ?auto_228149 - OBJ
      ?auto_228150 - OBJ
      ?auto_228145 - LOCATION
    )
    :vars
    (
      ?auto_228151 - TRUCK
      ?auto_228153 - LOCATION
      ?auto_228152 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228151 ?auto_228153 ) ( IN-CITY ?auto_228153 ?auto_228152 ) ( IN-CITY ?auto_228145 ?auto_228152 ) ( not ( = ?auto_228145 ?auto_228153 ) ) ( OBJ-AT ?auto_228148 ?auto_228145 ) ( not ( = ?auto_228148 ?auto_228146 ) ) ( OBJ-AT ?auto_228146 ?auto_228153 ) ( OBJ-AT ?auto_228147 ?auto_228145 ) ( OBJ-AT ?auto_228149 ?auto_228145 ) ( OBJ-AT ?auto_228150 ?auto_228145 ) ( not ( = ?auto_228146 ?auto_228147 ) ) ( not ( = ?auto_228146 ?auto_228149 ) ) ( not ( = ?auto_228146 ?auto_228150 ) ) ( not ( = ?auto_228147 ?auto_228148 ) ) ( not ( = ?auto_228147 ?auto_228149 ) ) ( not ( = ?auto_228147 ?auto_228150 ) ) ( not ( = ?auto_228148 ?auto_228149 ) ) ( not ( = ?auto_228148 ?auto_228150 ) ) ( not ( = ?auto_228149 ?auto_228150 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228148 ?auto_228146 ?auto_228145 )
      ( DELIVER-5PKG-VERIFY ?auto_228146 ?auto_228147 ?auto_228148 ?auto_228149 ?auto_228150 ?auto_228145 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228254 - OBJ
      ?auto_228255 - OBJ
      ?auto_228256 - OBJ
      ?auto_228257 - OBJ
      ?auto_228258 - OBJ
      ?auto_228253 - LOCATION
    )
    :vars
    (
      ?auto_228259 - TRUCK
      ?auto_228261 - LOCATION
      ?auto_228260 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228259 ?auto_228261 ) ( IN-CITY ?auto_228261 ?auto_228260 ) ( IN-CITY ?auto_228253 ?auto_228260 ) ( not ( = ?auto_228253 ?auto_228261 ) ) ( OBJ-AT ?auto_228258 ?auto_228253 ) ( not ( = ?auto_228258 ?auto_228254 ) ) ( OBJ-AT ?auto_228254 ?auto_228261 ) ( OBJ-AT ?auto_228255 ?auto_228253 ) ( OBJ-AT ?auto_228256 ?auto_228253 ) ( OBJ-AT ?auto_228257 ?auto_228253 ) ( not ( = ?auto_228254 ?auto_228255 ) ) ( not ( = ?auto_228254 ?auto_228256 ) ) ( not ( = ?auto_228254 ?auto_228257 ) ) ( not ( = ?auto_228255 ?auto_228256 ) ) ( not ( = ?auto_228255 ?auto_228257 ) ) ( not ( = ?auto_228255 ?auto_228258 ) ) ( not ( = ?auto_228256 ?auto_228257 ) ) ( not ( = ?auto_228256 ?auto_228258 ) ) ( not ( = ?auto_228257 ?auto_228258 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228258 ?auto_228254 ?auto_228253 )
      ( DELIVER-5PKG-VERIFY ?auto_228254 ?auto_228255 ?auto_228256 ?auto_228257 ?auto_228258 ?auto_228253 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228263 - OBJ
      ?auto_228264 - OBJ
      ?auto_228265 - OBJ
      ?auto_228266 - OBJ
      ?auto_228267 - OBJ
      ?auto_228262 - LOCATION
    )
    :vars
    (
      ?auto_228268 - TRUCK
      ?auto_228271 - LOCATION
      ?auto_228270 - CITY
      ?auto_228269 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_228268 ?auto_228271 ) ( IN-CITY ?auto_228271 ?auto_228270 ) ( IN-CITY ?auto_228262 ?auto_228270 ) ( not ( = ?auto_228262 ?auto_228271 ) ) ( OBJ-AT ?auto_228269 ?auto_228262 ) ( not ( = ?auto_228269 ?auto_228263 ) ) ( OBJ-AT ?auto_228263 ?auto_228271 ) ( OBJ-AT ?auto_228264 ?auto_228262 ) ( OBJ-AT ?auto_228265 ?auto_228262 ) ( OBJ-AT ?auto_228266 ?auto_228262 ) ( OBJ-AT ?auto_228267 ?auto_228262 ) ( not ( = ?auto_228263 ?auto_228264 ) ) ( not ( = ?auto_228263 ?auto_228265 ) ) ( not ( = ?auto_228263 ?auto_228266 ) ) ( not ( = ?auto_228263 ?auto_228267 ) ) ( not ( = ?auto_228264 ?auto_228265 ) ) ( not ( = ?auto_228264 ?auto_228266 ) ) ( not ( = ?auto_228264 ?auto_228267 ) ) ( not ( = ?auto_228264 ?auto_228269 ) ) ( not ( = ?auto_228265 ?auto_228266 ) ) ( not ( = ?auto_228265 ?auto_228267 ) ) ( not ( = ?auto_228265 ?auto_228269 ) ) ( not ( = ?auto_228266 ?auto_228267 ) ) ( not ( = ?auto_228266 ?auto_228269 ) ) ( not ( = ?auto_228267 ?auto_228269 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228269 ?auto_228263 ?auto_228262 )
      ( DELIVER-5PKG-VERIFY ?auto_228263 ?auto_228264 ?auto_228265 ?auto_228266 ?auto_228267 ?auto_228262 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228679 - OBJ
      ?auto_228680 - OBJ
      ?auto_228681 - OBJ
      ?auto_228678 - LOCATION
    )
    :vars
    (
      ?auto_228682 - LOCATION
      ?auto_228684 - CITY
      ?auto_228683 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228682 ?auto_228684 ) ( IN-CITY ?auto_228678 ?auto_228684 ) ( not ( = ?auto_228678 ?auto_228682 ) ) ( OBJ-AT ?auto_228680 ?auto_228678 ) ( not ( = ?auto_228680 ?auto_228681 ) ) ( OBJ-AT ?auto_228681 ?auto_228682 ) ( TRUCK-AT ?auto_228683 ?auto_228678 ) ( OBJ-AT ?auto_228679 ?auto_228678 ) ( not ( = ?auto_228679 ?auto_228680 ) ) ( not ( = ?auto_228679 ?auto_228681 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228680 ?auto_228681 ?auto_228678 )
      ( DELIVER-3PKG-VERIFY ?auto_228679 ?auto_228680 ?auto_228681 ?auto_228678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228712 - OBJ
      ?auto_228713 - OBJ
      ?auto_228714 - OBJ
      ?auto_228711 - LOCATION
    )
    :vars
    (
      ?auto_228715 - LOCATION
      ?auto_228717 - CITY
      ?auto_228718 - OBJ
      ?auto_228716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228715 ?auto_228717 ) ( IN-CITY ?auto_228711 ?auto_228717 ) ( not ( = ?auto_228711 ?auto_228715 ) ) ( OBJ-AT ?auto_228718 ?auto_228711 ) ( not ( = ?auto_228718 ?auto_228714 ) ) ( OBJ-AT ?auto_228714 ?auto_228715 ) ( TRUCK-AT ?auto_228716 ?auto_228711 ) ( OBJ-AT ?auto_228712 ?auto_228711 ) ( OBJ-AT ?auto_228713 ?auto_228711 ) ( not ( = ?auto_228712 ?auto_228713 ) ) ( not ( = ?auto_228712 ?auto_228714 ) ) ( not ( = ?auto_228712 ?auto_228718 ) ) ( not ( = ?auto_228713 ?auto_228714 ) ) ( not ( = ?auto_228713 ?auto_228718 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228718 ?auto_228714 ?auto_228711 )
      ( DELIVER-3PKG-VERIFY ?auto_228712 ?auto_228713 ?auto_228714 ?auto_228711 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228724 - OBJ
      ?auto_228725 - OBJ
      ?auto_228726 - OBJ
      ?auto_228723 - LOCATION
    )
    :vars
    (
      ?auto_228727 - LOCATION
      ?auto_228729 - CITY
      ?auto_228730 - OBJ
      ?auto_228728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228727 ?auto_228729 ) ( IN-CITY ?auto_228723 ?auto_228729 ) ( not ( = ?auto_228723 ?auto_228727 ) ) ( OBJ-AT ?auto_228730 ?auto_228723 ) ( not ( = ?auto_228730 ?auto_228725 ) ) ( OBJ-AT ?auto_228725 ?auto_228727 ) ( TRUCK-AT ?auto_228728 ?auto_228723 ) ( OBJ-AT ?auto_228724 ?auto_228723 ) ( OBJ-AT ?auto_228726 ?auto_228723 ) ( not ( = ?auto_228724 ?auto_228725 ) ) ( not ( = ?auto_228724 ?auto_228726 ) ) ( not ( = ?auto_228724 ?auto_228730 ) ) ( not ( = ?auto_228725 ?auto_228726 ) ) ( not ( = ?auto_228726 ?auto_228730 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228730 ?auto_228725 ?auto_228723 )
      ( DELIVER-3PKG-VERIFY ?auto_228724 ?auto_228725 ?auto_228726 ?auto_228723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_228762 - OBJ
      ?auto_228763 - OBJ
      ?auto_228764 - OBJ
      ?auto_228761 - LOCATION
    )
    :vars
    (
      ?auto_228765 - LOCATION
      ?auto_228767 - CITY
      ?auto_228768 - OBJ
      ?auto_228766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228765 ?auto_228767 ) ( IN-CITY ?auto_228761 ?auto_228767 ) ( not ( = ?auto_228761 ?auto_228765 ) ) ( OBJ-AT ?auto_228768 ?auto_228761 ) ( not ( = ?auto_228768 ?auto_228762 ) ) ( OBJ-AT ?auto_228762 ?auto_228765 ) ( TRUCK-AT ?auto_228766 ?auto_228761 ) ( OBJ-AT ?auto_228763 ?auto_228761 ) ( OBJ-AT ?auto_228764 ?auto_228761 ) ( not ( = ?auto_228762 ?auto_228763 ) ) ( not ( = ?auto_228762 ?auto_228764 ) ) ( not ( = ?auto_228763 ?auto_228764 ) ) ( not ( = ?auto_228763 ?auto_228768 ) ) ( not ( = ?auto_228764 ?auto_228768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228768 ?auto_228762 ?auto_228761 )
      ( DELIVER-3PKG-VERIFY ?auto_228762 ?auto_228763 ?auto_228764 ?auto_228761 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228801 - OBJ
      ?auto_228802 - OBJ
      ?auto_228803 - OBJ
      ?auto_228804 - OBJ
      ?auto_228800 - LOCATION
    )
    :vars
    (
      ?auto_228805 - LOCATION
      ?auto_228807 - CITY
      ?auto_228806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228805 ?auto_228807 ) ( IN-CITY ?auto_228800 ?auto_228807 ) ( not ( = ?auto_228800 ?auto_228805 ) ) ( OBJ-AT ?auto_228803 ?auto_228800 ) ( not ( = ?auto_228803 ?auto_228804 ) ) ( OBJ-AT ?auto_228804 ?auto_228805 ) ( TRUCK-AT ?auto_228806 ?auto_228800 ) ( OBJ-AT ?auto_228801 ?auto_228800 ) ( OBJ-AT ?auto_228802 ?auto_228800 ) ( not ( = ?auto_228801 ?auto_228802 ) ) ( not ( = ?auto_228801 ?auto_228803 ) ) ( not ( = ?auto_228801 ?auto_228804 ) ) ( not ( = ?auto_228802 ?auto_228803 ) ) ( not ( = ?auto_228802 ?auto_228804 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228803 ?auto_228804 ?auto_228800 )
      ( DELIVER-4PKG-VERIFY ?auto_228801 ?auto_228802 ?auto_228803 ?auto_228804 ?auto_228800 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228817 - OBJ
      ?auto_228818 - OBJ
      ?auto_228819 - OBJ
      ?auto_228820 - OBJ
      ?auto_228816 - LOCATION
    )
    :vars
    (
      ?auto_228821 - LOCATION
      ?auto_228823 - CITY
      ?auto_228822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228821 ?auto_228823 ) ( IN-CITY ?auto_228816 ?auto_228823 ) ( not ( = ?auto_228816 ?auto_228821 ) ) ( OBJ-AT ?auto_228817 ?auto_228816 ) ( not ( = ?auto_228817 ?auto_228819 ) ) ( OBJ-AT ?auto_228819 ?auto_228821 ) ( TRUCK-AT ?auto_228822 ?auto_228816 ) ( OBJ-AT ?auto_228818 ?auto_228816 ) ( OBJ-AT ?auto_228820 ?auto_228816 ) ( not ( = ?auto_228817 ?auto_228818 ) ) ( not ( = ?auto_228817 ?auto_228820 ) ) ( not ( = ?auto_228818 ?auto_228819 ) ) ( not ( = ?auto_228818 ?auto_228820 ) ) ( not ( = ?auto_228819 ?auto_228820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228817 ?auto_228819 ?auto_228816 )
      ( DELIVER-4PKG-VERIFY ?auto_228817 ?auto_228818 ?auto_228819 ?auto_228820 ?auto_228816 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228961 - OBJ
      ?auto_228962 - OBJ
      ?auto_228963 - OBJ
      ?auto_228964 - OBJ
      ?auto_228960 - LOCATION
    )
    :vars
    (
      ?auto_228965 - LOCATION
      ?auto_228967 - CITY
      ?auto_228966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228965 ?auto_228967 ) ( IN-CITY ?auto_228960 ?auto_228967 ) ( not ( = ?auto_228960 ?auto_228965 ) ) ( OBJ-AT ?auto_228962 ?auto_228960 ) ( not ( = ?auto_228962 ?auto_228964 ) ) ( OBJ-AT ?auto_228964 ?auto_228965 ) ( TRUCK-AT ?auto_228966 ?auto_228960 ) ( OBJ-AT ?auto_228961 ?auto_228960 ) ( OBJ-AT ?auto_228963 ?auto_228960 ) ( not ( = ?auto_228961 ?auto_228962 ) ) ( not ( = ?auto_228961 ?auto_228963 ) ) ( not ( = ?auto_228961 ?auto_228964 ) ) ( not ( = ?auto_228962 ?auto_228963 ) ) ( not ( = ?auto_228963 ?auto_228964 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228962 ?auto_228964 ?auto_228960 )
      ( DELIVER-4PKG-VERIFY ?auto_228961 ?auto_228962 ?auto_228963 ?auto_228964 ?auto_228960 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_228977 - OBJ
      ?auto_228978 - OBJ
      ?auto_228979 - OBJ
      ?auto_228980 - OBJ
      ?auto_228976 - LOCATION
    )
    :vars
    (
      ?auto_228981 - LOCATION
      ?auto_228983 - CITY
      ?auto_228982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228981 ?auto_228983 ) ( IN-CITY ?auto_228976 ?auto_228983 ) ( not ( = ?auto_228976 ?auto_228981 ) ) ( OBJ-AT ?auto_228978 ?auto_228976 ) ( not ( = ?auto_228978 ?auto_228979 ) ) ( OBJ-AT ?auto_228979 ?auto_228981 ) ( TRUCK-AT ?auto_228982 ?auto_228976 ) ( OBJ-AT ?auto_228977 ?auto_228976 ) ( OBJ-AT ?auto_228980 ?auto_228976 ) ( not ( = ?auto_228977 ?auto_228978 ) ) ( not ( = ?auto_228977 ?auto_228979 ) ) ( not ( = ?auto_228977 ?auto_228980 ) ) ( not ( = ?auto_228978 ?auto_228980 ) ) ( not ( = ?auto_228979 ?auto_228980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_228978 ?auto_228979 ?auto_228976 )
      ( DELIVER-4PKG-VERIFY ?auto_228977 ?auto_228978 ?auto_228979 ?auto_228980 ?auto_228976 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229001 - OBJ
      ?auto_229002 - OBJ
      ?auto_229003 - OBJ
      ?auto_229004 - OBJ
      ?auto_229000 - LOCATION
    )
    :vars
    (
      ?auto_229005 - LOCATION
      ?auto_229007 - CITY
      ?auto_229008 - OBJ
      ?auto_229006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229005 ?auto_229007 ) ( IN-CITY ?auto_229000 ?auto_229007 ) ( not ( = ?auto_229000 ?auto_229005 ) ) ( OBJ-AT ?auto_229008 ?auto_229000 ) ( not ( = ?auto_229008 ?auto_229004 ) ) ( OBJ-AT ?auto_229004 ?auto_229005 ) ( TRUCK-AT ?auto_229006 ?auto_229000 ) ( OBJ-AT ?auto_229001 ?auto_229000 ) ( OBJ-AT ?auto_229002 ?auto_229000 ) ( OBJ-AT ?auto_229003 ?auto_229000 ) ( not ( = ?auto_229001 ?auto_229002 ) ) ( not ( = ?auto_229001 ?auto_229003 ) ) ( not ( = ?auto_229001 ?auto_229004 ) ) ( not ( = ?auto_229001 ?auto_229008 ) ) ( not ( = ?auto_229002 ?auto_229003 ) ) ( not ( = ?auto_229002 ?auto_229004 ) ) ( not ( = ?auto_229002 ?auto_229008 ) ) ( not ( = ?auto_229003 ?auto_229004 ) ) ( not ( = ?auto_229003 ?auto_229008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229008 ?auto_229004 ?auto_229000 )
      ( DELIVER-4PKG-VERIFY ?auto_229001 ?auto_229002 ?auto_229003 ?auto_229004 ?auto_229000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229018 - OBJ
      ?auto_229019 - OBJ
      ?auto_229020 - OBJ
      ?auto_229021 - OBJ
      ?auto_229017 - LOCATION
    )
    :vars
    (
      ?auto_229022 - LOCATION
      ?auto_229024 - CITY
      ?auto_229025 - OBJ
      ?auto_229023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229022 ?auto_229024 ) ( IN-CITY ?auto_229017 ?auto_229024 ) ( not ( = ?auto_229017 ?auto_229022 ) ) ( OBJ-AT ?auto_229025 ?auto_229017 ) ( not ( = ?auto_229025 ?auto_229020 ) ) ( OBJ-AT ?auto_229020 ?auto_229022 ) ( TRUCK-AT ?auto_229023 ?auto_229017 ) ( OBJ-AT ?auto_229018 ?auto_229017 ) ( OBJ-AT ?auto_229019 ?auto_229017 ) ( OBJ-AT ?auto_229021 ?auto_229017 ) ( not ( = ?auto_229018 ?auto_229019 ) ) ( not ( = ?auto_229018 ?auto_229020 ) ) ( not ( = ?auto_229018 ?auto_229021 ) ) ( not ( = ?auto_229018 ?auto_229025 ) ) ( not ( = ?auto_229019 ?auto_229020 ) ) ( not ( = ?auto_229019 ?auto_229021 ) ) ( not ( = ?auto_229019 ?auto_229025 ) ) ( not ( = ?auto_229020 ?auto_229021 ) ) ( not ( = ?auto_229021 ?auto_229025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229025 ?auto_229020 ?auto_229017 )
      ( DELIVER-4PKG-VERIFY ?auto_229018 ?auto_229019 ?auto_229020 ?auto_229021 ?auto_229017 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229036 - OBJ
      ?auto_229037 - OBJ
      ?auto_229038 - OBJ
      ?auto_229039 - OBJ
      ?auto_229035 - LOCATION
    )
    :vars
    (
      ?auto_229040 - LOCATION
      ?auto_229042 - CITY
      ?auto_229041 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229040 ?auto_229042 ) ( IN-CITY ?auto_229035 ?auto_229042 ) ( not ( = ?auto_229035 ?auto_229040 ) ) ( OBJ-AT ?auto_229038 ?auto_229035 ) ( not ( = ?auto_229038 ?auto_229037 ) ) ( OBJ-AT ?auto_229037 ?auto_229040 ) ( TRUCK-AT ?auto_229041 ?auto_229035 ) ( OBJ-AT ?auto_229036 ?auto_229035 ) ( OBJ-AT ?auto_229039 ?auto_229035 ) ( not ( = ?auto_229036 ?auto_229037 ) ) ( not ( = ?auto_229036 ?auto_229038 ) ) ( not ( = ?auto_229036 ?auto_229039 ) ) ( not ( = ?auto_229037 ?auto_229039 ) ) ( not ( = ?auto_229038 ?auto_229039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229038 ?auto_229037 ?auto_229035 )
      ( DELIVER-4PKG-VERIFY ?auto_229036 ?auto_229037 ?auto_229038 ?auto_229039 ?auto_229035 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229060 - OBJ
      ?auto_229061 - OBJ
      ?auto_229062 - OBJ
      ?auto_229063 - OBJ
      ?auto_229059 - LOCATION
    )
    :vars
    (
      ?auto_229064 - LOCATION
      ?auto_229066 - CITY
      ?auto_229065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229064 ?auto_229066 ) ( IN-CITY ?auto_229059 ?auto_229066 ) ( not ( = ?auto_229059 ?auto_229064 ) ) ( OBJ-AT ?auto_229063 ?auto_229059 ) ( not ( = ?auto_229063 ?auto_229061 ) ) ( OBJ-AT ?auto_229061 ?auto_229064 ) ( TRUCK-AT ?auto_229065 ?auto_229059 ) ( OBJ-AT ?auto_229060 ?auto_229059 ) ( OBJ-AT ?auto_229062 ?auto_229059 ) ( not ( = ?auto_229060 ?auto_229061 ) ) ( not ( = ?auto_229060 ?auto_229062 ) ) ( not ( = ?auto_229060 ?auto_229063 ) ) ( not ( = ?auto_229061 ?auto_229062 ) ) ( not ( = ?auto_229062 ?auto_229063 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229063 ?auto_229061 ?auto_229059 )
      ( DELIVER-4PKG-VERIFY ?auto_229060 ?auto_229061 ?auto_229062 ?auto_229063 ?auto_229059 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229068 - OBJ
      ?auto_229069 - OBJ
      ?auto_229070 - OBJ
      ?auto_229071 - OBJ
      ?auto_229067 - LOCATION
    )
    :vars
    (
      ?auto_229072 - LOCATION
      ?auto_229074 - CITY
      ?auto_229075 - OBJ
      ?auto_229073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229072 ?auto_229074 ) ( IN-CITY ?auto_229067 ?auto_229074 ) ( not ( = ?auto_229067 ?auto_229072 ) ) ( OBJ-AT ?auto_229075 ?auto_229067 ) ( not ( = ?auto_229075 ?auto_229069 ) ) ( OBJ-AT ?auto_229069 ?auto_229072 ) ( TRUCK-AT ?auto_229073 ?auto_229067 ) ( OBJ-AT ?auto_229068 ?auto_229067 ) ( OBJ-AT ?auto_229070 ?auto_229067 ) ( OBJ-AT ?auto_229071 ?auto_229067 ) ( not ( = ?auto_229068 ?auto_229069 ) ) ( not ( = ?auto_229068 ?auto_229070 ) ) ( not ( = ?auto_229068 ?auto_229071 ) ) ( not ( = ?auto_229068 ?auto_229075 ) ) ( not ( = ?auto_229069 ?auto_229070 ) ) ( not ( = ?auto_229069 ?auto_229071 ) ) ( not ( = ?auto_229070 ?auto_229071 ) ) ( not ( = ?auto_229070 ?auto_229075 ) ) ( not ( = ?auto_229071 ?auto_229075 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229075 ?auto_229069 ?auto_229067 )
      ( DELIVER-4PKG-VERIFY ?auto_229068 ?auto_229069 ?auto_229070 ?auto_229071 ?auto_229067 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229112 - OBJ
      ?auto_229113 - OBJ
      ?auto_229114 - OBJ
      ?auto_229115 - OBJ
      ?auto_229111 - LOCATION
    )
    :vars
    (
      ?auto_229116 - LOCATION
      ?auto_229118 - CITY
      ?auto_229117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229116 ?auto_229118 ) ( IN-CITY ?auto_229111 ?auto_229118 ) ( not ( = ?auto_229111 ?auto_229116 ) ) ( OBJ-AT ?auto_229113 ?auto_229111 ) ( not ( = ?auto_229113 ?auto_229112 ) ) ( OBJ-AT ?auto_229112 ?auto_229116 ) ( TRUCK-AT ?auto_229117 ?auto_229111 ) ( OBJ-AT ?auto_229114 ?auto_229111 ) ( OBJ-AT ?auto_229115 ?auto_229111 ) ( not ( = ?auto_229112 ?auto_229114 ) ) ( not ( = ?auto_229112 ?auto_229115 ) ) ( not ( = ?auto_229113 ?auto_229114 ) ) ( not ( = ?auto_229113 ?auto_229115 ) ) ( not ( = ?auto_229114 ?auto_229115 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229113 ?auto_229112 ?auto_229111 )
      ( DELIVER-4PKG-VERIFY ?auto_229112 ?auto_229113 ?auto_229114 ?auto_229115 ?auto_229111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229208 - OBJ
      ?auto_229209 - OBJ
      ?auto_229210 - OBJ
      ?auto_229211 - OBJ
      ?auto_229207 - LOCATION
    )
    :vars
    (
      ?auto_229212 - LOCATION
      ?auto_229214 - CITY
      ?auto_229213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229212 ?auto_229214 ) ( IN-CITY ?auto_229207 ?auto_229214 ) ( not ( = ?auto_229207 ?auto_229212 ) ) ( OBJ-AT ?auto_229211 ?auto_229207 ) ( not ( = ?auto_229211 ?auto_229208 ) ) ( OBJ-AT ?auto_229208 ?auto_229212 ) ( TRUCK-AT ?auto_229213 ?auto_229207 ) ( OBJ-AT ?auto_229209 ?auto_229207 ) ( OBJ-AT ?auto_229210 ?auto_229207 ) ( not ( = ?auto_229208 ?auto_229209 ) ) ( not ( = ?auto_229208 ?auto_229210 ) ) ( not ( = ?auto_229209 ?auto_229210 ) ) ( not ( = ?auto_229209 ?auto_229211 ) ) ( not ( = ?auto_229210 ?auto_229211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229211 ?auto_229208 ?auto_229207 )
      ( DELIVER-4PKG-VERIFY ?auto_229208 ?auto_229209 ?auto_229210 ?auto_229211 ?auto_229207 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_229216 - OBJ
      ?auto_229217 - OBJ
      ?auto_229218 - OBJ
      ?auto_229219 - OBJ
      ?auto_229215 - LOCATION
    )
    :vars
    (
      ?auto_229220 - LOCATION
      ?auto_229222 - CITY
      ?auto_229223 - OBJ
      ?auto_229221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229220 ?auto_229222 ) ( IN-CITY ?auto_229215 ?auto_229222 ) ( not ( = ?auto_229215 ?auto_229220 ) ) ( OBJ-AT ?auto_229223 ?auto_229215 ) ( not ( = ?auto_229223 ?auto_229216 ) ) ( OBJ-AT ?auto_229216 ?auto_229220 ) ( TRUCK-AT ?auto_229221 ?auto_229215 ) ( OBJ-AT ?auto_229217 ?auto_229215 ) ( OBJ-AT ?auto_229218 ?auto_229215 ) ( OBJ-AT ?auto_229219 ?auto_229215 ) ( not ( = ?auto_229216 ?auto_229217 ) ) ( not ( = ?auto_229216 ?auto_229218 ) ) ( not ( = ?auto_229216 ?auto_229219 ) ) ( not ( = ?auto_229217 ?auto_229218 ) ) ( not ( = ?auto_229217 ?auto_229219 ) ) ( not ( = ?auto_229217 ?auto_229223 ) ) ( not ( = ?auto_229218 ?auto_229219 ) ) ( not ( = ?auto_229218 ?auto_229223 ) ) ( not ( = ?auto_229219 ?auto_229223 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229223 ?auto_229216 ?auto_229215 )
      ( DELIVER-4PKG-VERIFY ?auto_229216 ?auto_229217 ?auto_229218 ?auto_229219 ?auto_229215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229336 - OBJ
      ?auto_229337 - OBJ
      ?auto_229338 - OBJ
      ?auto_229339 - OBJ
      ?auto_229340 - OBJ
      ?auto_229335 - LOCATION
    )
    :vars
    (
      ?auto_229341 - LOCATION
      ?auto_229343 - CITY
      ?auto_229342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229341 ?auto_229343 ) ( IN-CITY ?auto_229335 ?auto_229343 ) ( not ( = ?auto_229335 ?auto_229341 ) ) ( OBJ-AT ?auto_229336 ?auto_229335 ) ( not ( = ?auto_229336 ?auto_229340 ) ) ( OBJ-AT ?auto_229340 ?auto_229341 ) ( TRUCK-AT ?auto_229342 ?auto_229335 ) ( OBJ-AT ?auto_229337 ?auto_229335 ) ( OBJ-AT ?auto_229338 ?auto_229335 ) ( OBJ-AT ?auto_229339 ?auto_229335 ) ( not ( = ?auto_229336 ?auto_229337 ) ) ( not ( = ?auto_229336 ?auto_229338 ) ) ( not ( = ?auto_229336 ?auto_229339 ) ) ( not ( = ?auto_229337 ?auto_229338 ) ) ( not ( = ?auto_229337 ?auto_229339 ) ) ( not ( = ?auto_229337 ?auto_229340 ) ) ( not ( = ?auto_229338 ?auto_229339 ) ) ( not ( = ?auto_229338 ?auto_229340 ) ) ( not ( = ?auto_229339 ?auto_229340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229336 ?auto_229340 ?auto_229335 )
      ( DELIVER-5PKG-VERIFY ?auto_229336 ?auto_229337 ?auto_229338 ?auto_229339 ?auto_229340 ?auto_229335 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229345 - OBJ
      ?auto_229346 - OBJ
      ?auto_229347 - OBJ
      ?auto_229348 - OBJ
      ?auto_229349 - OBJ
      ?auto_229344 - LOCATION
    )
    :vars
    (
      ?auto_229350 - LOCATION
      ?auto_229352 - CITY
      ?auto_229351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229350 ?auto_229352 ) ( IN-CITY ?auto_229344 ?auto_229352 ) ( not ( = ?auto_229344 ?auto_229350 ) ) ( OBJ-AT ?auto_229347 ?auto_229344 ) ( not ( = ?auto_229347 ?auto_229349 ) ) ( OBJ-AT ?auto_229349 ?auto_229350 ) ( TRUCK-AT ?auto_229351 ?auto_229344 ) ( OBJ-AT ?auto_229345 ?auto_229344 ) ( OBJ-AT ?auto_229346 ?auto_229344 ) ( OBJ-AT ?auto_229348 ?auto_229344 ) ( not ( = ?auto_229345 ?auto_229346 ) ) ( not ( = ?auto_229345 ?auto_229347 ) ) ( not ( = ?auto_229345 ?auto_229348 ) ) ( not ( = ?auto_229345 ?auto_229349 ) ) ( not ( = ?auto_229346 ?auto_229347 ) ) ( not ( = ?auto_229346 ?auto_229348 ) ) ( not ( = ?auto_229346 ?auto_229349 ) ) ( not ( = ?auto_229347 ?auto_229348 ) ) ( not ( = ?auto_229348 ?auto_229349 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229347 ?auto_229349 ?auto_229344 )
      ( DELIVER-5PKG-VERIFY ?auto_229345 ?auto_229346 ?auto_229347 ?auto_229348 ?auto_229349 ?auto_229344 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229354 - OBJ
      ?auto_229355 - OBJ
      ?auto_229356 - OBJ
      ?auto_229357 - OBJ
      ?auto_229358 - OBJ
      ?auto_229353 - LOCATION
    )
    :vars
    (
      ?auto_229359 - LOCATION
      ?auto_229361 - CITY
      ?auto_229360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229359 ?auto_229361 ) ( IN-CITY ?auto_229353 ?auto_229361 ) ( not ( = ?auto_229353 ?auto_229359 ) ) ( OBJ-AT ?auto_229358 ?auto_229353 ) ( not ( = ?auto_229358 ?auto_229357 ) ) ( OBJ-AT ?auto_229357 ?auto_229359 ) ( TRUCK-AT ?auto_229360 ?auto_229353 ) ( OBJ-AT ?auto_229354 ?auto_229353 ) ( OBJ-AT ?auto_229355 ?auto_229353 ) ( OBJ-AT ?auto_229356 ?auto_229353 ) ( not ( = ?auto_229354 ?auto_229355 ) ) ( not ( = ?auto_229354 ?auto_229356 ) ) ( not ( = ?auto_229354 ?auto_229357 ) ) ( not ( = ?auto_229354 ?auto_229358 ) ) ( not ( = ?auto_229355 ?auto_229356 ) ) ( not ( = ?auto_229355 ?auto_229357 ) ) ( not ( = ?auto_229355 ?auto_229358 ) ) ( not ( = ?auto_229356 ?auto_229357 ) ) ( not ( = ?auto_229356 ?auto_229358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229358 ?auto_229357 ?auto_229353 )
      ( DELIVER-5PKG-VERIFY ?auto_229354 ?auto_229355 ?auto_229356 ?auto_229357 ?auto_229358 ?auto_229353 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229363 - OBJ
      ?auto_229364 - OBJ
      ?auto_229365 - OBJ
      ?auto_229366 - OBJ
      ?auto_229367 - OBJ
      ?auto_229362 - LOCATION
    )
    :vars
    (
      ?auto_229368 - LOCATION
      ?auto_229370 - CITY
      ?auto_229369 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229368 ?auto_229370 ) ( IN-CITY ?auto_229362 ?auto_229370 ) ( not ( = ?auto_229362 ?auto_229368 ) ) ( OBJ-AT ?auto_229365 ?auto_229362 ) ( not ( = ?auto_229365 ?auto_229366 ) ) ( OBJ-AT ?auto_229366 ?auto_229368 ) ( TRUCK-AT ?auto_229369 ?auto_229362 ) ( OBJ-AT ?auto_229363 ?auto_229362 ) ( OBJ-AT ?auto_229364 ?auto_229362 ) ( OBJ-AT ?auto_229367 ?auto_229362 ) ( not ( = ?auto_229363 ?auto_229364 ) ) ( not ( = ?auto_229363 ?auto_229365 ) ) ( not ( = ?auto_229363 ?auto_229366 ) ) ( not ( = ?auto_229363 ?auto_229367 ) ) ( not ( = ?auto_229364 ?auto_229365 ) ) ( not ( = ?auto_229364 ?auto_229366 ) ) ( not ( = ?auto_229364 ?auto_229367 ) ) ( not ( = ?auto_229365 ?auto_229367 ) ) ( not ( = ?auto_229366 ?auto_229367 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229365 ?auto_229366 ?auto_229362 )
      ( DELIVER-5PKG-VERIFY ?auto_229363 ?auto_229364 ?auto_229365 ?auto_229366 ?auto_229367 ?auto_229362 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229381 - OBJ
      ?auto_229382 - OBJ
      ?auto_229383 - OBJ
      ?auto_229384 - OBJ
      ?auto_229385 - OBJ
      ?auto_229380 - LOCATION
    )
    :vars
    (
      ?auto_229386 - LOCATION
      ?auto_229388 - CITY
      ?auto_229387 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229386 ?auto_229388 ) ( IN-CITY ?auto_229380 ?auto_229388 ) ( not ( = ?auto_229380 ?auto_229386 ) ) ( OBJ-AT ?auto_229382 ?auto_229380 ) ( not ( = ?auto_229382 ?auto_229385 ) ) ( OBJ-AT ?auto_229385 ?auto_229386 ) ( TRUCK-AT ?auto_229387 ?auto_229380 ) ( OBJ-AT ?auto_229381 ?auto_229380 ) ( OBJ-AT ?auto_229383 ?auto_229380 ) ( OBJ-AT ?auto_229384 ?auto_229380 ) ( not ( = ?auto_229381 ?auto_229382 ) ) ( not ( = ?auto_229381 ?auto_229383 ) ) ( not ( = ?auto_229381 ?auto_229384 ) ) ( not ( = ?auto_229381 ?auto_229385 ) ) ( not ( = ?auto_229382 ?auto_229383 ) ) ( not ( = ?auto_229382 ?auto_229384 ) ) ( not ( = ?auto_229383 ?auto_229384 ) ) ( not ( = ?auto_229383 ?auto_229385 ) ) ( not ( = ?auto_229384 ?auto_229385 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229382 ?auto_229385 ?auto_229380 )
      ( DELIVER-5PKG-VERIFY ?auto_229381 ?auto_229382 ?auto_229383 ?auto_229384 ?auto_229385 ?auto_229380 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229399 - OBJ
      ?auto_229400 - OBJ
      ?auto_229401 - OBJ
      ?auto_229402 - OBJ
      ?auto_229403 - OBJ
      ?auto_229398 - LOCATION
    )
    :vars
    (
      ?auto_229404 - LOCATION
      ?auto_229406 - CITY
      ?auto_229405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229404 ?auto_229406 ) ( IN-CITY ?auto_229398 ?auto_229406 ) ( not ( = ?auto_229398 ?auto_229404 ) ) ( OBJ-AT ?auto_229399 ?auto_229398 ) ( not ( = ?auto_229399 ?auto_229402 ) ) ( OBJ-AT ?auto_229402 ?auto_229404 ) ( TRUCK-AT ?auto_229405 ?auto_229398 ) ( OBJ-AT ?auto_229400 ?auto_229398 ) ( OBJ-AT ?auto_229401 ?auto_229398 ) ( OBJ-AT ?auto_229403 ?auto_229398 ) ( not ( = ?auto_229399 ?auto_229400 ) ) ( not ( = ?auto_229399 ?auto_229401 ) ) ( not ( = ?auto_229399 ?auto_229403 ) ) ( not ( = ?auto_229400 ?auto_229401 ) ) ( not ( = ?auto_229400 ?auto_229402 ) ) ( not ( = ?auto_229400 ?auto_229403 ) ) ( not ( = ?auto_229401 ?auto_229402 ) ) ( not ( = ?auto_229401 ?auto_229403 ) ) ( not ( = ?auto_229402 ?auto_229403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229399 ?auto_229402 ?auto_229398 )
      ( DELIVER-5PKG-VERIFY ?auto_229399 ?auto_229400 ?auto_229401 ?auto_229402 ?auto_229403 ?auto_229398 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229426 - OBJ
      ?auto_229427 - OBJ
      ?auto_229428 - OBJ
      ?auto_229429 - OBJ
      ?auto_229430 - OBJ
      ?auto_229425 - LOCATION
    )
    :vars
    (
      ?auto_229431 - LOCATION
      ?auto_229433 - CITY
      ?auto_229432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229431 ?auto_229433 ) ( IN-CITY ?auto_229425 ?auto_229433 ) ( not ( = ?auto_229425 ?auto_229431 ) ) ( OBJ-AT ?auto_229427 ?auto_229425 ) ( not ( = ?auto_229427 ?auto_229428 ) ) ( OBJ-AT ?auto_229428 ?auto_229431 ) ( TRUCK-AT ?auto_229432 ?auto_229425 ) ( OBJ-AT ?auto_229426 ?auto_229425 ) ( OBJ-AT ?auto_229429 ?auto_229425 ) ( OBJ-AT ?auto_229430 ?auto_229425 ) ( not ( = ?auto_229426 ?auto_229427 ) ) ( not ( = ?auto_229426 ?auto_229428 ) ) ( not ( = ?auto_229426 ?auto_229429 ) ) ( not ( = ?auto_229426 ?auto_229430 ) ) ( not ( = ?auto_229427 ?auto_229429 ) ) ( not ( = ?auto_229427 ?auto_229430 ) ) ( not ( = ?auto_229428 ?auto_229429 ) ) ( not ( = ?auto_229428 ?auto_229430 ) ) ( not ( = ?auto_229429 ?auto_229430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229427 ?auto_229428 ?auto_229425 )
      ( DELIVER-5PKG-VERIFY ?auto_229426 ?auto_229427 ?auto_229428 ?auto_229429 ?auto_229430 ?auto_229425 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229435 - OBJ
      ?auto_229436 - OBJ
      ?auto_229437 - OBJ
      ?auto_229438 - OBJ
      ?auto_229439 - OBJ
      ?auto_229434 - LOCATION
    )
    :vars
    (
      ?auto_229440 - LOCATION
      ?auto_229442 - CITY
      ?auto_229441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229440 ?auto_229442 ) ( IN-CITY ?auto_229434 ?auto_229442 ) ( not ( = ?auto_229434 ?auto_229440 ) ) ( OBJ-AT ?auto_229438 ?auto_229434 ) ( not ( = ?auto_229438 ?auto_229437 ) ) ( OBJ-AT ?auto_229437 ?auto_229440 ) ( TRUCK-AT ?auto_229441 ?auto_229434 ) ( OBJ-AT ?auto_229435 ?auto_229434 ) ( OBJ-AT ?auto_229436 ?auto_229434 ) ( OBJ-AT ?auto_229439 ?auto_229434 ) ( not ( = ?auto_229435 ?auto_229436 ) ) ( not ( = ?auto_229435 ?auto_229437 ) ) ( not ( = ?auto_229435 ?auto_229438 ) ) ( not ( = ?auto_229435 ?auto_229439 ) ) ( not ( = ?auto_229436 ?auto_229437 ) ) ( not ( = ?auto_229436 ?auto_229438 ) ) ( not ( = ?auto_229436 ?auto_229439 ) ) ( not ( = ?auto_229437 ?auto_229439 ) ) ( not ( = ?auto_229438 ?auto_229439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229438 ?auto_229437 ?auto_229434 )
      ( DELIVER-5PKG-VERIFY ?auto_229435 ?auto_229436 ?auto_229437 ?auto_229438 ?auto_229439 ?auto_229434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229624 - OBJ
      ?auto_229625 - OBJ
      ?auto_229626 - OBJ
      ?auto_229627 - OBJ
      ?auto_229628 - OBJ
      ?auto_229623 - LOCATION
    )
    :vars
    (
      ?auto_229629 - LOCATION
      ?auto_229631 - CITY
      ?auto_229630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229629 ?auto_229631 ) ( IN-CITY ?auto_229623 ?auto_229631 ) ( not ( = ?auto_229623 ?auto_229629 ) ) ( OBJ-AT ?auto_229628 ?auto_229623 ) ( not ( = ?auto_229628 ?auto_229626 ) ) ( OBJ-AT ?auto_229626 ?auto_229629 ) ( TRUCK-AT ?auto_229630 ?auto_229623 ) ( OBJ-AT ?auto_229624 ?auto_229623 ) ( OBJ-AT ?auto_229625 ?auto_229623 ) ( OBJ-AT ?auto_229627 ?auto_229623 ) ( not ( = ?auto_229624 ?auto_229625 ) ) ( not ( = ?auto_229624 ?auto_229626 ) ) ( not ( = ?auto_229624 ?auto_229627 ) ) ( not ( = ?auto_229624 ?auto_229628 ) ) ( not ( = ?auto_229625 ?auto_229626 ) ) ( not ( = ?auto_229625 ?auto_229627 ) ) ( not ( = ?auto_229625 ?auto_229628 ) ) ( not ( = ?auto_229626 ?auto_229627 ) ) ( not ( = ?auto_229627 ?auto_229628 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229628 ?auto_229626 ?auto_229623 )
      ( DELIVER-5PKG-VERIFY ?auto_229624 ?auto_229625 ?auto_229626 ?auto_229627 ?auto_229628 ?auto_229623 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229678 - OBJ
      ?auto_229679 - OBJ
      ?auto_229680 - OBJ
      ?auto_229681 - OBJ
      ?auto_229682 - OBJ
      ?auto_229677 - LOCATION
    )
    :vars
    (
      ?auto_229683 - LOCATION
      ?auto_229685 - CITY
      ?auto_229684 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229683 ?auto_229685 ) ( IN-CITY ?auto_229677 ?auto_229685 ) ( not ( = ?auto_229677 ?auto_229683 ) ) ( OBJ-AT ?auto_229678 ?auto_229677 ) ( not ( = ?auto_229678 ?auto_229679 ) ) ( OBJ-AT ?auto_229679 ?auto_229683 ) ( TRUCK-AT ?auto_229684 ?auto_229677 ) ( OBJ-AT ?auto_229680 ?auto_229677 ) ( OBJ-AT ?auto_229681 ?auto_229677 ) ( OBJ-AT ?auto_229682 ?auto_229677 ) ( not ( = ?auto_229678 ?auto_229680 ) ) ( not ( = ?auto_229678 ?auto_229681 ) ) ( not ( = ?auto_229678 ?auto_229682 ) ) ( not ( = ?auto_229679 ?auto_229680 ) ) ( not ( = ?auto_229679 ?auto_229681 ) ) ( not ( = ?auto_229679 ?auto_229682 ) ) ( not ( = ?auto_229680 ?auto_229681 ) ) ( not ( = ?auto_229680 ?auto_229682 ) ) ( not ( = ?auto_229681 ?auto_229682 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229678 ?auto_229679 ?auto_229677 )
      ( DELIVER-5PKG-VERIFY ?auto_229678 ?auto_229679 ?auto_229680 ?auto_229681 ?auto_229682 ?auto_229677 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229687 - OBJ
      ?auto_229688 - OBJ
      ?auto_229689 - OBJ
      ?auto_229690 - OBJ
      ?auto_229691 - OBJ
      ?auto_229686 - LOCATION
    )
    :vars
    (
      ?auto_229692 - LOCATION
      ?auto_229694 - CITY
      ?auto_229693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229692 ?auto_229694 ) ( IN-CITY ?auto_229686 ?auto_229694 ) ( not ( = ?auto_229686 ?auto_229692 ) ) ( OBJ-AT ?auto_229690 ?auto_229686 ) ( not ( = ?auto_229690 ?auto_229688 ) ) ( OBJ-AT ?auto_229688 ?auto_229692 ) ( TRUCK-AT ?auto_229693 ?auto_229686 ) ( OBJ-AT ?auto_229687 ?auto_229686 ) ( OBJ-AT ?auto_229689 ?auto_229686 ) ( OBJ-AT ?auto_229691 ?auto_229686 ) ( not ( = ?auto_229687 ?auto_229688 ) ) ( not ( = ?auto_229687 ?auto_229689 ) ) ( not ( = ?auto_229687 ?auto_229690 ) ) ( not ( = ?auto_229687 ?auto_229691 ) ) ( not ( = ?auto_229688 ?auto_229689 ) ) ( not ( = ?auto_229688 ?auto_229691 ) ) ( not ( = ?auto_229689 ?auto_229690 ) ) ( not ( = ?auto_229689 ?auto_229691 ) ) ( not ( = ?auto_229690 ?auto_229691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229690 ?auto_229688 ?auto_229686 )
      ( DELIVER-5PKG-VERIFY ?auto_229687 ?auto_229688 ?auto_229689 ?auto_229690 ?auto_229691 ?auto_229686 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229786 - OBJ
      ?auto_229787 - OBJ
      ?auto_229788 - OBJ
      ?auto_229789 - OBJ
      ?auto_229790 - OBJ
      ?auto_229785 - LOCATION
    )
    :vars
    (
      ?auto_229791 - LOCATION
      ?auto_229793 - CITY
      ?auto_229792 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229791 ?auto_229793 ) ( IN-CITY ?auto_229785 ?auto_229793 ) ( not ( = ?auto_229785 ?auto_229791 ) ) ( OBJ-AT ?auto_229790 ?auto_229785 ) ( not ( = ?auto_229790 ?auto_229787 ) ) ( OBJ-AT ?auto_229787 ?auto_229791 ) ( TRUCK-AT ?auto_229792 ?auto_229785 ) ( OBJ-AT ?auto_229786 ?auto_229785 ) ( OBJ-AT ?auto_229788 ?auto_229785 ) ( OBJ-AT ?auto_229789 ?auto_229785 ) ( not ( = ?auto_229786 ?auto_229787 ) ) ( not ( = ?auto_229786 ?auto_229788 ) ) ( not ( = ?auto_229786 ?auto_229789 ) ) ( not ( = ?auto_229786 ?auto_229790 ) ) ( not ( = ?auto_229787 ?auto_229788 ) ) ( not ( = ?auto_229787 ?auto_229789 ) ) ( not ( = ?auto_229788 ?auto_229789 ) ) ( not ( = ?auto_229788 ?auto_229790 ) ) ( not ( = ?auto_229789 ?auto_229790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_229790 ?auto_229787 ?auto_229785 )
      ( DELIVER-5PKG-VERIFY ?auto_229786 ?auto_229787 ?auto_229788 ?auto_229789 ?auto_229790 ?auto_229785 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230146 - OBJ
      ?auto_230147 - OBJ
      ?auto_230148 - OBJ
      ?auto_230149 - OBJ
      ?auto_230150 - OBJ
      ?auto_230145 - LOCATION
    )
    :vars
    (
      ?auto_230151 - LOCATION
      ?auto_230153 - CITY
      ?auto_230154 - OBJ
      ?auto_230152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230151 ?auto_230153 ) ( IN-CITY ?auto_230145 ?auto_230153 ) ( not ( = ?auto_230145 ?auto_230151 ) ) ( OBJ-AT ?auto_230154 ?auto_230145 ) ( not ( = ?auto_230154 ?auto_230150 ) ) ( OBJ-AT ?auto_230150 ?auto_230151 ) ( TRUCK-AT ?auto_230152 ?auto_230145 ) ( OBJ-AT ?auto_230146 ?auto_230145 ) ( OBJ-AT ?auto_230147 ?auto_230145 ) ( OBJ-AT ?auto_230148 ?auto_230145 ) ( OBJ-AT ?auto_230149 ?auto_230145 ) ( not ( = ?auto_230146 ?auto_230147 ) ) ( not ( = ?auto_230146 ?auto_230148 ) ) ( not ( = ?auto_230146 ?auto_230149 ) ) ( not ( = ?auto_230146 ?auto_230150 ) ) ( not ( = ?auto_230146 ?auto_230154 ) ) ( not ( = ?auto_230147 ?auto_230148 ) ) ( not ( = ?auto_230147 ?auto_230149 ) ) ( not ( = ?auto_230147 ?auto_230150 ) ) ( not ( = ?auto_230147 ?auto_230154 ) ) ( not ( = ?auto_230148 ?auto_230149 ) ) ( not ( = ?auto_230148 ?auto_230150 ) ) ( not ( = ?auto_230148 ?auto_230154 ) ) ( not ( = ?auto_230149 ?auto_230150 ) ) ( not ( = ?auto_230149 ?auto_230154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230154 ?auto_230150 ?auto_230145 )
      ( DELIVER-5PKG-VERIFY ?auto_230146 ?auto_230147 ?auto_230148 ?auto_230149 ?auto_230150 ?auto_230145 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230165 - OBJ
      ?auto_230166 - OBJ
      ?auto_230167 - OBJ
      ?auto_230168 - OBJ
      ?auto_230169 - OBJ
      ?auto_230164 - LOCATION
    )
    :vars
    (
      ?auto_230170 - LOCATION
      ?auto_230172 - CITY
      ?auto_230173 - OBJ
      ?auto_230171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230170 ?auto_230172 ) ( IN-CITY ?auto_230164 ?auto_230172 ) ( not ( = ?auto_230164 ?auto_230170 ) ) ( OBJ-AT ?auto_230173 ?auto_230164 ) ( not ( = ?auto_230173 ?auto_230168 ) ) ( OBJ-AT ?auto_230168 ?auto_230170 ) ( TRUCK-AT ?auto_230171 ?auto_230164 ) ( OBJ-AT ?auto_230165 ?auto_230164 ) ( OBJ-AT ?auto_230166 ?auto_230164 ) ( OBJ-AT ?auto_230167 ?auto_230164 ) ( OBJ-AT ?auto_230169 ?auto_230164 ) ( not ( = ?auto_230165 ?auto_230166 ) ) ( not ( = ?auto_230165 ?auto_230167 ) ) ( not ( = ?auto_230165 ?auto_230168 ) ) ( not ( = ?auto_230165 ?auto_230169 ) ) ( not ( = ?auto_230165 ?auto_230173 ) ) ( not ( = ?auto_230166 ?auto_230167 ) ) ( not ( = ?auto_230166 ?auto_230168 ) ) ( not ( = ?auto_230166 ?auto_230169 ) ) ( not ( = ?auto_230166 ?auto_230173 ) ) ( not ( = ?auto_230167 ?auto_230168 ) ) ( not ( = ?auto_230167 ?auto_230169 ) ) ( not ( = ?auto_230167 ?auto_230173 ) ) ( not ( = ?auto_230168 ?auto_230169 ) ) ( not ( = ?auto_230169 ?auto_230173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230173 ?auto_230168 ?auto_230164 )
      ( DELIVER-5PKG-VERIFY ?auto_230165 ?auto_230166 ?auto_230167 ?auto_230168 ?auto_230169 ?auto_230164 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230221 - OBJ
      ?auto_230222 - OBJ
      ?auto_230223 - OBJ
      ?auto_230224 - OBJ
      ?auto_230225 - OBJ
      ?auto_230220 - LOCATION
    )
    :vars
    (
      ?auto_230226 - LOCATION
      ?auto_230228 - CITY
      ?auto_230229 - OBJ
      ?auto_230227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230226 ?auto_230228 ) ( IN-CITY ?auto_230220 ?auto_230228 ) ( not ( = ?auto_230220 ?auto_230226 ) ) ( OBJ-AT ?auto_230229 ?auto_230220 ) ( not ( = ?auto_230229 ?auto_230223 ) ) ( OBJ-AT ?auto_230223 ?auto_230226 ) ( TRUCK-AT ?auto_230227 ?auto_230220 ) ( OBJ-AT ?auto_230221 ?auto_230220 ) ( OBJ-AT ?auto_230222 ?auto_230220 ) ( OBJ-AT ?auto_230224 ?auto_230220 ) ( OBJ-AT ?auto_230225 ?auto_230220 ) ( not ( = ?auto_230221 ?auto_230222 ) ) ( not ( = ?auto_230221 ?auto_230223 ) ) ( not ( = ?auto_230221 ?auto_230224 ) ) ( not ( = ?auto_230221 ?auto_230225 ) ) ( not ( = ?auto_230221 ?auto_230229 ) ) ( not ( = ?auto_230222 ?auto_230223 ) ) ( not ( = ?auto_230222 ?auto_230224 ) ) ( not ( = ?auto_230222 ?auto_230225 ) ) ( not ( = ?auto_230222 ?auto_230229 ) ) ( not ( = ?auto_230223 ?auto_230224 ) ) ( not ( = ?auto_230223 ?auto_230225 ) ) ( not ( = ?auto_230224 ?auto_230225 ) ) ( not ( = ?auto_230224 ?auto_230229 ) ) ( not ( = ?auto_230225 ?auto_230229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230229 ?auto_230223 ?auto_230220 )
      ( DELIVER-5PKG-VERIFY ?auto_230221 ?auto_230222 ?auto_230223 ?auto_230224 ?auto_230225 ?auto_230220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230387 - OBJ
      ?auto_230388 - OBJ
      ?auto_230389 - OBJ
      ?auto_230390 - OBJ
      ?auto_230391 - OBJ
      ?auto_230386 - LOCATION
    )
    :vars
    (
      ?auto_230392 - LOCATION
      ?auto_230394 - CITY
      ?auto_230395 - OBJ
      ?auto_230393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230392 ?auto_230394 ) ( IN-CITY ?auto_230386 ?auto_230394 ) ( not ( = ?auto_230386 ?auto_230392 ) ) ( OBJ-AT ?auto_230395 ?auto_230386 ) ( not ( = ?auto_230395 ?auto_230388 ) ) ( OBJ-AT ?auto_230388 ?auto_230392 ) ( TRUCK-AT ?auto_230393 ?auto_230386 ) ( OBJ-AT ?auto_230387 ?auto_230386 ) ( OBJ-AT ?auto_230389 ?auto_230386 ) ( OBJ-AT ?auto_230390 ?auto_230386 ) ( OBJ-AT ?auto_230391 ?auto_230386 ) ( not ( = ?auto_230387 ?auto_230388 ) ) ( not ( = ?auto_230387 ?auto_230389 ) ) ( not ( = ?auto_230387 ?auto_230390 ) ) ( not ( = ?auto_230387 ?auto_230391 ) ) ( not ( = ?auto_230387 ?auto_230395 ) ) ( not ( = ?auto_230388 ?auto_230389 ) ) ( not ( = ?auto_230388 ?auto_230390 ) ) ( not ( = ?auto_230388 ?auto_230391 ) ) ( not ( = ?auto_230389 ?auto_230390 ) ) ( not ( = ?auto_230389 ?auto_230391 ) ) ( not ( = ?auto_230389 ?auto_230395 ) ) ( not ( = ?auto_230390 ?auto_230391 ) ) ( not ( = ?auto_230390 ?auto_230395 ) ) ( not ( = ?auto_230391 ?auto_230395 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230395 ?auto_230388 ?auto_230386 )
      ( DELIVER-5PKG-VERIFY ?auto_230387 ?auto_230388 ?auto_230389 ?auto_230390 ?auto_230391 ?auto_230386 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230521 - OBJ
      ?auto_230522 - OBJ
      ?auto_230523 - OBJ
      ?auto_230524 - OBJ
      ?auto_230525 - OBJ
      ?auto_230520 - LOCATION
    )
    :vars
    (
      ?auto_230526 - LOCATION
      ?auto_230528 - CITY
      ?auto_230527 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230526 ?auto_230528 ) ( IN-CITY ?auto_230520 ?auto_230528 ) ( not ( = ?auto_230520 ?auto_230526 ) ) ( OBJ-AT ?auto_230523 ?auto_230520 ) ( not ( = ?auto_230523 ?auto_230521 ) ) ( OBJ-AT ?auto_230521 ?auto_230526 ) ( TRUCK-AT ?auto_230527 ?auto_230520 ) ( OBJ-AT ?auto_230522 ?auto_230520 ) ( OBJ-AT ?auto_230524 ?auto_230520 ) ( OBJ-AT ?auto_230525 ?auto_230520 ) ( not ( = ?auto_230521 ?auto_230522 ) ) ( not ( = ?auto_230521 ?auto_230524 ) ) ( not ( = ?auto_230521 ?auto_230525 ) ) ( not ( = ?auto_230522 ?auto_230523 ) ) ( not ( = ?auto_230522 ?auto_230524 ) ) ( not ( = ?auto_230522 ?auto_230525 ) ) ( not ( = ?auto_230523 ?auto_230524 ) ) ( not ( = ?auto_230523 ?auto_230525 ) ) ( not ( = ?auto_230524 ?auto_230525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230523 ?auto_230521 ?auto_230520 )
      ( DELIVER-5PKG-VERIFY ?auto_230521 ?auto_230522 ?auto_230523 ?auto_230524 ?auto_230525 ?auto_230520 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230548 - OBJ
      ?auto_230549 - OBJ
      ?auto_230550 - OBJ
      ?auto_230551 - OBJ
      ?auto_230552 - OBJ
      ?auto_230547 - LOCATION
    )
    :vars
    (
      ?auto_230553 - LOCATION
      ?auto_230555 - CITY
      ?auto_230554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230553 ?auto_230555 ) ( IN-CITY ?auto_230547 ?auto_230555 ) ( not ( = ?auto_230547 ?auto_230553 ) ) ( OBJ-AT ?auto_230552 ?auto_230547 ) ( not ( = ?auto_230552 ?auto_230548 ) ) ( OBJ-AT ?auto_230548 ?auto_230553 ) ( TRUCK-AT ?auto_230554 ?auto_230547 ) ( OBJ-AT ?auto_230549 ?auto_230547 ) ( OBJ-AT ?auto_230550 ?auto_230547 ) ( OBJ-AT ?auto_230551 ?auto_230547 ) ( not ( = ?auto_230548 ?auto_230549 ) ) ( not ( = ?auto_230548 ?auto_230550 ) ) ( not ( = ?auto_230548 ?auto_230551 ) ) ( not ( = ?auto_230549 ?auto_230550 ) ) ( not ( = ?auto_230549 ?auto_230551 ) ) ( not ( = ?auto_230549 ?auto_230552 ) ) ( not ( = ?auto_230550 ?auto_230551 ) ) ( not ( = ?auto_230550 ?auto_230552 ) ) ( not ( = ?auto_230551 ?auto_230552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230552 ?auto_230548 ?auto_230547 )
      ( DELIVER-5PKG-VERIFY ?auto_230548 ?auto_230549 ?auto_230550 ?auto_230551 ?auto_230552 ?auto_230547 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230611 - OBJ
      ?auto_230612 - OBJ
      ?auto_230613 - OBJ
      ?auto_230614 - OBJ
      ?auto_230615 - OBJ
      ?auto_230610 - LOCATION
    )
    :vars
    (
      ?auto_230616 - LOCATION
      ?auto_230618 - CITY
      ?auto_230617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230616 ?auto_230618 ) ( IN-CITY ?auto_230610 ?auto_230618 ) ( not ( = ?auto_230610 ?auto_230616 ) ) ( OBJ-AT ?auto_230612 ?auto_230610 ) ( not ( = ?auto_230612 ?auto_230611 ) ) ( OBJ-AT ?auto_230611 ?auto_230616 ) ( TRUCK-AT ?auto_230617 ?auto_230610 ) ( OBJ-AT ?auto_230613 ?auto_230610 ) ( OBJ-AT ?auto_230614 ?auto_230610 ) ( OBJ-AT ?auto_230615 ?auto_230610 ) ( not ( = ?auto_230611 ?auto_230613 ) ) ( not ( = ?auto_230611 ?auto_230614 ) ) ( not ( = ?auto_230611 ?auto_230615 ) ) ( not ( = ?auto_230612 ?auto_230613 ) ) ( not ( = ?auto_230612 ?auto_230614 ) ) ( not ( = ?auto_230612 ?auto_230615 ) ) ( not ( = ?auto_230613 ?auto_230614 ) ) ( not ( = ?auto_230613 ?auto_230615 ) ) ( not ( = ?auto_230614 ?auto_230615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230612 ?auto_230611 ?auto_230610 )
      ( DELIVER-5PKG-VERIFY ?auto_230611 ?auto_230612 ?auto_230613 ?auto_230614 ?auto_230615 ?auto_230610 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230881 - OBJ
      ?auto_230882 - OBJ
      ?auto_230883 - OBJ
      ?auto_230884 - OBJ
      ?auto_230885 - OBJ
      ?auto_230880 - LOCATION
    )
    :vars
    (
      ?auto_230886 - LOCATION
      ?auto_230888 - CITY
      ?auto_230889 - OBJ
      ?auto_230887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230886 ?auto_230888 ) ( IN-CITY ?auto_230880 ?auto_230888 ) ( not ( = ?auto_230880 ?auto_230886 ) ) ( OBJ-AT ?auto_230889 ?auto_230880 ) ( not ( = ?auto_230889 ?auto_230881 ) ) ( OBJ-AT ?auto_230881 ?auto_230886 ) ( TRUCK-AT ?auto_230887 ?auto_230880 ) ( OBJ-AT ?auto_230882 ?auto_230880 ) ( OBJ-AT ?auto_230883 ?auto_230880 ) ( OBJ-AT ?auto_230884 ?auto_230880 ) ( OBJ-AT ?auto_230885 ?auto_230880 ) ( not ( = ?auto_230881 ?auto_230882 ) ) ( not ( = ?auto_230881 ?auto_230883 ) ) ( not ( = ?auto_230881 ?auto_230884 ) ) ( not ( = ?auto_230881 ?auto_230885 ) ) ( not ( = ?auto_230882 ?auto_230883 ) ) ( not ( = ?auto_230882 ?auto_230884 ) ) ( not ( = ?auto_230882 ?auto_230885 ) ) ( not ( = ?auto_230882 ?auto_230889 ) ) ( not ( = ?auto_230883 ?auto_230884 ) ) ( not ( = ?auto_230883 ?auto_230885 ) ) ( not ( = ?auto_230883 ?auto_230889 ) ) ( not ( = ?auto_230884 ?auto_230885 ) ) ( not ( = ?auto_230884 ?auto_230889 ) ) ( not ( = ?auto_230885 ?auto_230889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_230889 ?auto_230881 ?auto_230880 )
      ( DELIVER-5PKG-VERIFY ?auto_230881 ?auto_230882 ?auto_230883 ?auto_230884 ?auto_230885 ?auto_230880 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_233900 - OBJ
      ?auto_233899 - LOCATION
    )
    :vars
    (
      ?auto_233903 - LOCATION
      ?auto_233902 - CITY
      ?auto_233904 - OBJ
      ?auto_233901 - TRUCK
      ?auto_233905 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233903 ?auto_233902 ) ( IN-CITY ?auto_233899 ?auto_233902 ) ( not ( = ?auto_233899 ?auto_233903 ) ) ( OBJ-AT ?auto_233904 ?auto_233899 ) ( not ( = ?auto_233904 ?auto_233900 ) ) ( OBJ-AT ?auto_233900 ?auto_233903 ) ( TRUCK-AT ?auto_233901 ?auto_233905 ) ( IN-CITY ?auto_233905 ?auto_233902 ) ( not ( = ?auto_233899 ?auto_233905 ) ) ( not ( = ?auto_233903 ?auto_233905 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_233901 ?auto_233905 ?auto_233899 ?auto_233902 )
      ( DELIVER-2PKG ?auto_233904 ?auto_233900 ?auto_233899 )
      ( DELIVER-1PKG-VERIFY ?auto_233900 ?auto_233899 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_233907 - OBJ
      ?auto_233908 - OBJ
      ?auto_233906 - LOCATION
    )
    :vars
    (
      ?auto_233912 - LOCATION
      ?auto_233909 - CITY
      ?auto_233911 - TRUCK
      ?auto_233910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233912 ?auto_233909 ) ( IN-CITY ?auto_233906 ?auto_233909 ) ( not ( = ?auto_233906 ?auto_233912 ) ) ( OBJ-AT ?auto_233907 ?auto_233906 ) ( not ( = ?auto_233907 ?auto_233908 ) ) ( OBJ-AT ?auto_233908 ?auto_233912 ) ( TRUCK-AT ?auto_233911 ?auto_233910 ) ( IN-CITY ?auto_233910 ?auto_233909 ) ( not ( = ?auto_233906 ?auto_233910 ) ) ( not ( = ?auto_233912 ?auto_233910 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_233908 ?auto_233906 )
      ( DELIVER-2PKG-VERIFY ?auto_233907 ?auto_233908 ?auto_233906 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_233922 - OBJ
      ?auto_233923 - OBJ
      ?auto_233921 - LOCATION
    )
    :vars
    (
      ?auto_233924 - LOCATION
      ?auto_233925 - CITY
      ?auto_233927 - TRUCK
      ?auto_233926 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233924 ?auto_233925 ) ( IN-CITY ?auto_233921 ?auto_233925 ) ( not ( = ?auto_233921 ?auto_233924 ) ) ( OBJ-AT ?auto_233923 ?auto_233921 ) ( not ( = ?auto_233923 ?auto_233922 ) ) ( OBJ-AT ?auto_233922 ?auto_233924 ) ( TRUCK-AT ?auto_233927 ?auto_233926 ) ( IN-CITY ?auto_233926 ?auto_233925 ) ( not ( = ?auto_233921 ?auto_233926 ) ) ( not ( = ?auto_233924 ?auto_233926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233923 ?auto_233922 ?auto_233921 )
      ( DELIVER-2PKG-VERIFY ?auto_233922 ?auto_233923 ?auto_233921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233945 - OBJ
      ?auto_233946 - OBJ
      ?auto_233947 - OBJ
      ?auto_233944 - LOCATION
    )
    :vars
    (
      ?auto_233948 - LOCATION
      ?auto_233949 - CITY
      ?auto_233951 - TRUCK
      ?auto_233950 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233948 ?auto_233949 ) ( IN-CITY ?auto_233944 ?auto_233949 ) ( not ( = ?auto_233944 ?auto_233948 ) ) ( OBJ-AT ?auto_233946 ?auto_233944 ) ( not ( = ?auto_233946 ?auto_233947 ) ) ( OBJ-AT ?auto_233947 ?auto_233948 ) ( TRUCK-AT ?auto_233951 ?auto_233950 ) ( IN-CITY ?auto_233950 ?auto_233949 ) ( not ( = ?auto_233944 ?auto_233950 ) ) ( not ( = ?auto_233948 ?auto_233950 ) ) ( OBJ-AT ?auto_233945 ?auto_233944 ) ( not ( = ?auto_233945 ?auto_233946 ) ) ( not ( = ?auto_233945 ?auto_233947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233946 ?auto_233947 ?auto_233944 )
      ( DELIVER-3PKG-VERIFY ?auto_233945 ?auto_233946 ?auto_233947 ?auto_233944 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_233961 - OBJ
      ?auto_233962 - OBJ
      ?auto_233963 - OBJ
      ?auto_233960 - LOCATION
    )
    :vars
    (
      ?auto_233964 - LOCATION
      ?auto_233965 - CITY
      ?auto_233967 - TRUCK
      ?auto_233966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_233964 ?auto_233965 ) ( IN-CITY ?auto_233960 ?auto_233965 ) ( not ( = ?auto_233960 ?auto_233964 ) ) ( OBJ-AT ?auto_233963 ?auto_233960 ) ( not ( = ?auto_233963 ?auto_233962 ) ) ( OBJ-AT ?auto_233962 ?auto_233964 ) ( TRUCK-AT ?auto_233967 ?auto_233966 ) ( IN-CITY ?auto_233966 ?auto_233965 ) ( not ( = ?auto_233960 ?auto_233966 ) ) ( not ( = ?auto_233964 ?auto_233966 ) ) ( OBJ-AT ?auto_233961 ?auto_233960 ) ( not ( = ?auto_233961 ?auto_233962 ) ) ( not ( = ?auto_233961 ?auto_233963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_233963 ?auto_233962 ?auto_233960 )
      ( DELIVER-3PKG-VERIFY ?auto_233961 ?auto_233962 ?auto_233963 ?auto_233960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_234028 - OBJ
      ?auto_234029 - OBJ
      ?auto_234030 - OBJ
      ?auto_234027 - LOCATION
    )
    :vars
    (
      ?auto_234031 - LOCATION
      ?auto_234032 - CITY
      ?auto_234034 - TRUCK
      ?auto_234033 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234031 ?auto_234032 ) ( IN-CITY ?auto_234027 ?auto_234032 ) ( not ( = ?auto_234027 ?auto_234031 ) ) ( OBJ-AT ?auto_234030 ?auto_234027 ) ( not ( = ?auto_234030 ?auto_234028 ) ) ( OBJ-AT ?auto_234028 ?auto_234031 ) ( TRUCK-AT ?auto_234034 ?auto_234033 ) ( IN-CITY ?auto_234033 ?auto_234032 ) ( not ( = ?auto_234027 ?auto_234033 ) ) ( not ( = ?auto_234031 ?auto_234033 ) ) ( OBJ-AT ?auto_234029 ?auto_234027 ) ( not ( = ?auto_234028 ?auto_234029 ) ) ( not ( = ?auto_234029 ?auto_234030 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234030 ?auto_234028 ?auto_234027 )
      ( DELIVER-3PKG-VERIFY ?auto_234028 ?auto_234029 ?auto_234030 ?auto_234027 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234104 - OBJ
      ?auto_234105 - OBJ
      ?auto_234106 - OBJ
      ?auto_234107 - OBJ
      ?auto_234103 - LOCATION
    )
    :vars
    (
      ?auto_234108 - LOCATION
      ?auto_234109 - CITY
      ?auto_234111 - TRUCK
      ?auto_234110 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234108 ?auto_234109 ) ( IN-CITY ?auto_234103 ?auto_234109 ) ( not ( = ?auto_234103 ?auto_234108 ) ) ( OBJ-AT ?auto_234104 ?auto_234103 ) ( not ( = ?auto_234104 ?auto_234107 ) ) ( OBJ-AT ?auto_234107 ?auto_234108 ) ( TRUCK-AT ?auto_234111 ?auto_234110 ) ( IN-CITY ?auto_234110 ?auto_234109 ) ( not ( = ?auto_234103 ?auto_234110 ) ) ( not ( = ?auto_234108 ?auto_234110 ) ) ( OBJ-AT ?auto_234105 ?auto_234103 ) ( OBJ-AT ?auto_234106 ?auto_234103 ) ( not ( = ?auto_234104 ?auto_234105 ) ) ( not ( = ?auto_234104 ?auto_234106 ) ) ( not ( = ?auto_234105 ?auto_234106 ) ) ( not ( = ?auto_234105 ?auto_234107 ) ) ( not ( = ?auto_234106 ?auto_234107 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234104 ?auto_234107 ?auto_234103 )
      ( DELIVER-4PKG-VERIFY ?auto_234104 ?auto_234105 ?auto_234106 ?auto_234107 ?auto_234103 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234122 - OBJ
      ?auto_234123 - OBJ
      ?auto_234124 - OBJ
      ?auto_234125 - OBJ
      ?auto_234121 - LOCATION
    )
    :vars
    (
      ?auto_234126 - LOCATION
      ?auto_234127 - CITY
      ?auto_234129 - TRUCK
      ?auto_234128 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234126 ?auto_234127 ) ( IN-CITY ?auto_234121 ?auto_234127 ) ( not ( = ?auto_234121 ?auto_234126 ) ) ( OBJ-AT ?auto_234122 ?auto_234121 ) ( not ( = ?auto_234122 ?auto_234124 ) ) ( OBJ-AT ?auto_234124 ?auto_234126 ) ( TRUCK-AT ?auto_234129 ?auto_234128 ) ( IN-CITY ?auto_234128 ?auto_234127 ) ( not ( = ?auto_234121 ?auto_234128 ) ) ( not ( = ?auto_234126 ?auto_234128 ) ) ( OBJ-AT ?auto_234123 ?auto_234121 ) ( OBJ-AT ?auto_234125 ?auto_234121 ) ( not ( = ?auto_234122 ?auto_234123 ) ) ( not ( = ?auto_234122 ?auto_234125 ) ) ( not ( = ?auto_234123 ?auto_234124 ) ) ( not ( = ?auto_234123 ?auto_234125 ) ) ( not ( = ?auto_234124 ?auto_234125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234122 ?auto_234124 ?auto_234121 )
      ( DELIVER-4PKG-VERIFY ?auto_234122 ?auto_234123 ?auto_234124 ?auto_234125 ?auto_234121 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234194 - OBJ
      ?auto_234195 - OBJ
      ?auto_234196 - OBJ
      ?auto_234197 - OBJ
      ?auto_234193 - LOCATION
    )
    :vars
    (
      ?auto_234198 - LOCATION
      ?auto_234199 - CITY
      ?auto_234201 - TRUCK
      ?auto_234200 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234198 ?auto_234199 ) ( IN-CITY ?auto_234193 ?auto_234199 ) ( not ( = ?auto_234193 ?auto_234198 ) ) ( OBJ-AT ?auto_234194 ?auto_234193 ) ( not ( = ?auto_234194 ?auto_234195 ) ) ( OBJ-AT ?auto_234195 ?auto_234198 ) ( TRUCK-AT ?auto_234201 ?auto_234200 ) ( IN-CITY ?auto_234200 ?auto_234199 ) ( not ( = ?auto_234193 ?auto_234200 ) ) ( not ( = ?auto_234198 ?auto_234200 ) ) ( OBJ-AT ?auto_234196 ?auto_234193 ) ( OBJ-AT ?auto_234197 ?auto_234193 ) ( not ( = ?auto_234194 ?auto_234196 ) ) ( not ( = ?auto_234194 ?auto_234197 ) ) ( not ( = ?auto_234195 ?auto_234196 ) ) ( not ( = ?auto_234195 ?auto_234197 ) ) ( not ( = ?auto_234196 ?auto_234197 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234194 ?auto_234195 ?auto_234193 )
      ( DELIVER-4PKG-VERIFY ?auto_234194 ?auto_234195 ?auto_234196 ?auto_234197 ?auto_234193 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_234453 - OBJ
      ?auto_234454 - OBJ
      ?auto_234455 - OBJ
      ?auto_234456 - OBJ
      ?auto_234452 - LOCATION
    )
    :vars
    (
      ?auto_234457 - LOCATION
      ?auto_234458 - CITY
      ?auto_234460 - TRUCK
      ?auto_234459 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234457 ?auto_234458 ) ( IN-CITY ?auto_234452 ?auto_234458 ) ( not ( = ?auto_234452 ?auto_234457 ) ) ( OBJ-AT ?auto_234455 ?auto_234452 ) ( not ( = ?auto_234455 ?auto_234453 ) ) ( OBJ-AT ?auto_234453 ?auto_234457 ) ( TRUCK-AT ?auto_234460 ?auto_234459 ) ( IN-CITY ?auto_234459 ?auto_234458 ) ( not ( = ?auto_234452 ?auto_234459 ) ) ( not ( = ?auto_234457 ?auto_234459 ) ) ( OBJ-AT ?auto_234454 ?auto_234452 ) ( OBJ-AT ?auto_234456 ?auto_234452 ) ( not ( = ?auto_234453 ?auto_234454 ) ) ( not ( = ?auto_234453 ?auto_234456 ) ) ( not ( = ?auto_234454 ?auto_234455 ) ) ( not ( = ?auto_234454 ?auto_234456 ) ) ( not ( = ?auto_234455 ?auto_234456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234455 ?auto_234453 ?auto_234452 )
      ( DELIVER-4PKG-VERIFY ?auto_234453 ?auto_234454 ?auto_234455 ?auto_234456 ?auto_234452 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234704 - OBJ
      ?auto_234705 - OBJ
      ?auto_234706 - OBJ
      ?auto_234707 - OBJ
      ?auto_234708 - OBJ
      ?auto_234703 - LOCATION
    )
    :vars
    (
      ?auto_234709 - LOCATION
      ?auto_234710 - CITY
      ?auto_234712 - TRUCK
      ?auto_234711 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234709 ?auto_234710 ) ( IN-CITY ?auto_234703 ?auto_234710 ) ( not ( = ?auto_234703 ?auto_234709 ) ) ( OBJ-AT ?auto_234704 ?auto_234703 ) ( not ( = ?auto_234704 ?auto_234708 ) ) ( OBJ-AT ?auto_234708 ?auto_234709 ) ( TRUCK-AT ?auto_234712 ?auto_234711 ) ( IN-CITY ?auto_234711 ?auto_234710 ) ( not ( = ?auto_234703 ?auto_234711 ) ) ( not ( = ?auto_234709 ?auto_234711 ) ) ( OBJ-AT ?auto_234705 ?auto_234703 ) ( OBJ-AT ?auto_234706 ?auto_234703 ) ( OBJ-AT ?auto_234707 ?auto_234703 ) ( not ( = ?auto_234704 ?auto_234705 ) ) ( not ( = ?auto_234704 ?auto_234706 ) ) ( not ( = ?auto_234704 ?auto_234707 ) ) ( not ( = ?auto_234705 ?auto_234706 ) ) ( not ( = ?auto_234705 ?auto_234707 ) ) ( not ( = ?auto_234705 ?auto_234708 ) ) ( not ( = ?auto_234706 ?auto_234707 ) ) ( not ( = ?auto_234706 ?auto_234708 ) ) ( not ( = ?auto_234707 ?auto_234708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234704 ?auto_234708 ?auto_234703 )
      ( DELIVER-5PKG-VERIFY ?auto_234704 ?auto_234705 ?auto_234706 ?auto_234707 ?auto_234708 ?auto_234703 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234724 - OBJ
      ?auto_234725 - OBJ
      ?auto_234726 - OBJ
      ?auto_234727 - OBJ
      ?auto_234728 - OBJ
      ?auto_234723 - LOCATION
    )
    :vars
    (
      ?auto_234729 - LOCATION
      ?auto_234730 - CITY
      ?auto_234732 - TRUCK
      ?auto_234731 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234729 ?auto_234730 ) ( IN-CITY ?auto_234723 ?auto_234730 ) ( not ( = ?auto_234723 ?auto_234729 ) ) ( OBJ-AT ?auto_234724 ?auto_234723 ) ( not ( = ?auto_234724 ?auto_234727 ) ) ( OBJ-AT ?auto_234727 ?auto_234729 ) ( TRUCK-AT ?auto_234732 ?auto_234731 ) ( IN-CITY ?auto_234731 ?auto_234730 ) ( not ( = ?auto_234723 ?auto_234731 ) ) ( not ( = ?auto_234729 ?auto_234731 ) ) ( OBJ-AT ?auto_234725 ?auto_234723 ) ( OBJ-AT ?auto_234726 ?auto_234723 ) ( OBJ-AT ?auto_234728 ?auto_234723 ) ( not ( = ?auto_234724 ?auto_234725 ) ) ( not ( = ?auto_234724 ?auto_234726 ) ) ( not ( = ?auto_234724 ?auto_234728 ) ) ( not ( = ?auto_234725 ?auto_234726 ) ) ( not ( = ?auto_234725 ?auto_234727 ) ) ( not ( = ?auto_234725 ?auto_234728 ) ) ( not ( = ?auto_234726 ?auto_234727 ) ) ( not ( = ?auto_234726 ?auto_234728 ) ) ( not ( = ?auto_234727 ?auto_234728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234724 ?auto_234727 ?auto_234723 )
      ( DELIVER-5PKG-VERIFY ?auto_234724 ?auto_234725 ?auto_234726 ?auto_234727 ?auto_234728 ?auto_234723 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234804 - OBJ
      ?auto_234805 - OBJ
      ?auto_234806 - OBJ
      ?auto_234807 - OBJ
      ?auto_234808 - OBJ
      ?auto_234803 - LOCATION
    )
    :vars
    (
      ?auto_234809 - LOCATION
      ?auto_234810 - CITY
      ?auto_234812 - TRUCK
      ?auto_234811 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_234809 ?auto_234810 ) ( IN-CITY ?auto_234803 ?auto_234810 ) ( not ( = ?auto_234803 ?auto_234809 ) ) ( OBJ-AT ?auto_234804 ?auto_234803 ) ( not ( = ?auto_234804 ?auto_234806 ) ) ( OBJ-AT ?auto_234806 ?auto_234809 ) ( TRUCK-AT ?auto_234812 ?auto_234811 ) ( IN-CITY ?auto_234811 ?auto_234810 ) ( not ( = ?auto_234803 ?auto_234811 ) ) ( not ( = ?auto_234809 ?auto_234811 ) ) ( OBJ-AT ?auto_234805 ?auto_234803 ) ( OBJ-AT ?auto_234807 ?auto_234803 ) ( OBJ-AT ?auto_234808 ?auto_234803 ) ( not ( = ?auto_234804 ?auto_234805 ) ) ( not ( = ?auto_234804 ?auto_234807 ) ) ( not ( = ?auto_234804 ?auto_234808 ) ) ( not ( = ?auto_234805 ?auto_234806 ) ) ( not ( = ?auto_234805 ?auto_234807 ) ) ( not ( = ?auto_234805 ?auto_234808 ) ) ( not ( = ?auto_234806 ?auto_234807 ) ) ( not ( = ?auto_234806 ?auto_234808 ) ) ( not ( = ?auto_234807 ?auto_234808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_234804 ?auto_234806 ?auto_234803 )
      ( DELIVER-5PKG-VERIFY ?auto_234804 ?auto_234805 ?auto_234806 ?auto_234807 ?auto_234808 ?auto_234803 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_235084 - OBJ
      ?auto_235085 - OBJ
      ?auto_235086 - OBJ
      ?auto_235087 - OBJ
      ?auto_235088 - OBJ
      ?auto_235083 - LOCATION
    )
    :vars
    (
      ?auto_235089 - LOCATION
      ?auto_235090 - CITY
      ?auto_235092 - TRUCK
      ?auto_235091 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_235089 ?auto_235090 ) ( IN-CITY ?auto_235083 ?auto_235090 ) ( not ( = ?auto_235083 ?auto_235089 ) ) ( OBJ-AT ?auto_235084 ?auto_235083 ) ( not ( = ?auto_235084 ?auto_235085 ) ) ( OBJ-AT ?auto_235085 ?auto_235089 ) ( TRUCK-AT ?auto_235092 ?auto_235091 ) ( IN-CITY ?auto_235091 ?auto_235090 ) ( not ( = ?auto_235083 ?auto_235091 ) ) ( not ( = ?auto_235089 ?auto_235091 ) ) ( OBJ-AT ?auto_235086 ?auto_235083 ) ( OBJ-AT ?auto_235087 ?auto_235083 ) ( OBJ-AT ?auto_235088 ?auto_235083 ) ( not ( = ?auto_235084 ?auto_235086 ) ) ( not ( = ?auto_235084 ?auto_235087 ) ) ( not ( = ?auto_235084 ?auto_235088 ) ) ( not ( = ?auto_235085 ?auto_235086 ) ) ( not ( = ?auto_235085 ?auto_235087 ) ) ( not ( = ?auto_235085 ?auto_235088 ) ) ( not ( = ?auto_235086 ?auto_235087 ) ) ( not ( = ?auto_235086 ?auto_235088 ) ) ( not ( = ?auto_235087 ?auto_235088 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_235084 ?auto_235085 ?auto_235083 )
      ( DELIVER-5PKG-VERIFY ?auto_235084 ?auto_235085 ?auto_235086 ?auto_235087 ?auto_235088 ?auto_235083 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_236019 - OBJ
      ?auto_236020 - OBJ
      ?auto_236021 - OBJ
      ?auto_236022 - OBJ
      ?auto_236023 - OBJ
      ?auto_236018 - LOCATION
    )
    :vars
    (
      ?auto_236024 - LOCATION
      ?auto_236025 - CITY
      ?auto_236027 - TRUCK
      ?auto_236026 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236024 ?auto_236025 ) ( IN-CITY ?auto_236018 ?auto_236025 ) ( not ( = ?auto_236018 ?auto_236024 ) ) ( OBJ-AT ?auto_236021 ?auto_236018 ) ( not ( = ?auto_236021 ?auto_236019 ) ) ( OBJ-AT ?auto_236019 ?auto_236024 ) ( TRUCK-AT ?auto_236027 ?auto_236026 ) ( IN-CITY ?auto_236026 ?auto_236025 ) ( not ( = ?auto_236018 ?auto_236026 ) ) ( not ( = ?auto_236024 ?auto_236026 ) ) ( OBJ-AT ?auto_236020 ?auto_236018 ) ( OBJ-AT ?auto_236022 ?auto_236018 ) ( OBJ-AT ?auto_236023 ?auto_236018 ) ( not ( = ?auto_236019 ?auto_236020 ) ) ( not ( = ?auto_236019 ?auto_236022 ) ) ( not ( = ?auto_236019 ?auto_236023 ) ) ( not ( = ?auto_236020 ?auto_236021 ) ) ( not ( = ?auto_236020 ?auto_236022 ) ) ( not ( = ?auto_236020 ?auto_236023 ) ) ( not ( = ?auto_236021 ?auto_236022 ) ) ( not ( = ?auto_236021 ?auto_236023 ) ) ( not ( = ?auto_236022 ?auto_236023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236021 ?auto_236019 ?auto_236018 )
      ( DELIVER-5PKG-VERIFY ?auto_236019 ?auto_236020 ?auto_236021 ?auto_236022 ?auto_236023 ?auto_236018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_236877 - OBJ
      ?auto_236878 - OBJ
      ?auto_236879 - OBJ
      ?auto_236876 - LOCATION
    )
    :vars
    (
      ?auto_236881 - LOCATION
      ?auto_236880 - CITY
      ?auto_236883 - TRUCK
      ?auto_236882 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236881 ?auto_236880 ) ( IN-CITY ?auto_236876 ?auto_236880 ) ( not ( = ?auto_236876 ?auto_236881 ) ) ( OBJ-AT ?auto_236877 ?auto_236876 ) ( not ( = ?auto_236877 ?auto_236879 ) ) ( OBJ-AT ?auto_236879 ?auto_236881 ) ( TRUCK-AT ?auto_236883 ?auto_236882 ) ( IN-CITY ?auto_236882 ?auto_236880 ) ( not ( = ?auto_236876 ?auto_236882 ) ) ( not ( = ?auto_236881 ?auto_236882 ) ) ( OBJ-AT ?auto_236878 ?auto_236876 ) ( not ( = ?auto_236877 ?auto_236878 ) ) ( not ( = ?auto_236878 ?auto_236879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236877 ?auto_236879 ?auto_236876 )
      ( DELIVER-3PKG-VERIFY ?auto_236877 ?auto_236878 ?auto_236879 ?auto_236876 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_236960 - OBJ
      ?auto_236961 - OBJ
      ?auto_236962 - OBJ
      ?auto_236959 - LOCATION
    )
    :vars
    (
      ?auto_236964 - LOCATION
      ?auto_236963 - CITY
      ?auto_236966 - TRUCK
      ?auto_236965 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_236964 ?auto_236963 ) ( IN-CITY ?auto_236959 ?auto_236963 ) ( not ( = ?auto_236959 ?auto_236964 ) ) ( OBJ-AT ?auto_236961 ?auto_236959 ) ( not ( = ?auto_236961 ?auto_236960 ) ) ( OBJ-AT ?auto_236960 ?auto_236964 ) ( TRUCK-AT ?auto_236966 ?auto_236965 ) ( IN-CITY ?auto_236965 ?auto_236963 ) ( not ( = ?auto_236959 ?auto_236965 ) ) ( not ( = ?auto_236964 ?auto_236965 ) ) ( OBJ-AT ?auto_236962 ?auto_236959 ) ( not ( = ?auto_236960 ?auto_236962 ) ) ( not ( = ?auto_236961 ?auto_236962 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_236961 ?auto_236960 ?auto_236959 )
      ( DELIVER-3PKG-VERIFY ?auto_236960 ?auto_236961 ?auto_236962 ?auto_236959 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_237636 - OBJ
      ?auto_237637 - OBJ
      ?auto_237638 - OBJ
      ?auto_237639 - OBJ
      ?auto_237640 - OBJ
      ?auto_237635 - LOCATION
    )
    :vars
    (
      ?auto_237642 - LOCATION
      ?auto_237641 - CITY
      ?auto_237644 - TRUCK
      ?auto_237643 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237642 ?auto_237641 ) ( IN-CITY ?auto_237635 ?auto_237641 ) ( not ( = ?auto_237635 ?auto_237642 ) ) ( OBJ-AT ?auto_237637 ?auto_237635 ) ( not ( = ?auto_237637 ?auto_237640 ) ) ( OBJ-AT ?auto_237640 ?auto_237642 ) ( TRUCK-AT ?auto_237644 ?auto_237643 ) ( IN-CITY ?auto_237643 ?auto_237641 ) ( not ( = ?auto_237635 ?auto_237643 ) ) ( not ( = ?auto_237642 ?auto_237643 ) ) ( OBJ-AT ?auto_237636 ?auto_237635 ) ( OBJ-AT ?auto_237638 ?auto_237635 ) ( OBJ-AT ?auto_237639 ?auto_237635 ) ( not ( = ?auto_237636 ?auto_237637 ) ) ( not ( = ?auto_237636 ?auto_237638 ) ) ( not ( = ?auto_237636 ?auto_237639 ) ) ( not ( = ?auto_237636 ?auto_237640 ) ) ( not ( = ?auto_237637 ?auto_237638 ) ) ( not ( = ?auto_237637 ?auto_237639 ) ) ( not ( = ?auto_237638 ?auto_237639 ) ) ( not ( = ?auto_237638 ?auto_237640 ) ) ( not ( = ?auto_237639 ?auto_237640 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237637 ?auto_237640 ?auto_237635 )
      ( DELIVER-5PKG-VERIFY ?auto_237636 ?auto_237637 ?auto_237638 ?auto_237639 ?auto_237640 ?auto_237635 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_237736 - OBJ
      ?auto_237737 - OBJ
      ?auto_237738 - OBJ
      ?auto_237739 - OBJ
      ?auto_237740 - OBJ
      ?auto_237735 - LOCATION
    )
    :vars
    (
      ?auto_237742 - LOCATION
      ?auto_237741 - CITY
      ?auto_237744 - TRUCK
      ?auto_237743 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_237742 ?auto_237741 ) ( IN-CITY ?auto_237735 ?auto_237741 ) ( not ( = ?auto_237735 ?auto_237742 ) ) ( OBJ-AT ?auto_237740 ?auto_237735 ) ( not ( = ?auto_237740 ?auto_237738 ) ) ( OBJ-AT ?auto_237738 ?auto_237742 ) ( TRUCK-AT ?auto_237744 ?auto_237743 ) ( IN-CITY ?auto_237743 ?auto_237741 ) ( not ( = ?auto_237735 ?auto_237743 ) ) ( not ( = ?auto_237742 ?auto_237743 ) ) ( OBJ-AT ?auto_237736 ?auto_237735 ) ( OBJ-AT ?auto_237737 ?auto_237735 ) ( OBJ-AT ?auto_237739 ?auto_237735 ) ( not ( = ?auto_237736 ?auto_237737 ) ) ( not ( = ?auto_237736 ?auto_237738 ) ) ( not ( = ?auto_237736 ?auto_237739 ) ) ( not ( = ?auto_237736 ?auto_237740 ) ) ( not ( = ?auto_237737 ?auto_237738 ) ) ( not ( = ?auto_237737 ?auto_237739 ) ) ( not ( = ?auto_237737 ?auto_237740 ) ) ( not ( = ?auto_237738 ?auto_237739 ) ) ( not ( = ?auto_237739 ?auto_237740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_237740 ?auto_237738 ?auto_237735 )
      ( DELIVER-5PKG-VERIFY ?auto_237736 ?auto_237737 ?auto_237738 ?auto_237739 ?auto_237740 ?auto_237735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_239820 - OBJ
      ?auto_239821 - OBJ
      ?auto_239822 - OBJ
      ?auto_239819 - LOCATION
    )
    :vars
    (
      ?auto_239824 - LOCATION
      ?auto_239825 - CITY
      ?auto_239823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_239824 ?auto_239825 ) ( IN-CITY ?auto_239819 ?auto_239825 ) ( not ( = ?auto_239819 ?auto_239824 ) ) ( OBJ-AT ?auto_239822 ?auto_239819 ) ( not ( = ?auto_239822 ?auto_239821 ) ) ( OBJ-AT ?auto_239821 ?auto_239824 ) ( TRUCK-AT ?auto_239823 ?auto_239819 ) ( OBJ-AT ?auto_239820 ?auto_239819 ) ( not ( = ?auto_239820 ?auto_239821 ) ) ( not ( = ?auto_239820 ?auto_239822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_239822 ?auto_239821 ?auto_239819 )
      ( DELIVER-3PKG-VERIFY ?auto_239820 ?auto_239821 ?auto_239822 ?auto_239819 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_239879 - OBJ
      ?auto_239880 - OBJ
      ?auto_239881 - OBJ
      ?auto_239878 - LOCATION
    )
    :vars
    (
      ?auto_239883 - LOCATION
      ?auto_239884 - CITY
      ?auto_239882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_239883 ?auto_239884 ) ( IN-CITY ?auto_239878 ?auto_239884 ) ( not ( = ?auto_239878 ?auto_239883 ) ) ( OBJ-AT ?auto_239881 ?auto_239878 ) ( not ( = ?auto_239881 ?auto_239879 ) ) ( OBJ-AT ?auto_239879 ?auto_239883 ) ( TRUCK-AT ?auto_239882 ?auto_239878 ) ( OBJ-AT ?auto_239880 ?auto_239878 ) ( not ( = ?auto_239879 ?auto_239880 ) ) ( not ( = ?auto_239880 ?auto_239881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_239881 ?auto_239879 ?auto_239878 )
      ( DELIVER-3PKG-VERIFY ?auto_239879 ?auto_239880 ?auto_239881 ?auto_239878 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_245045 - OBJ
      ?auto_245044 - LOCATION
    )
    :vars
    (
      ?auto_245046 - LOCATION
      ?auto_245049 - CITY
      ?auto_245047 - OBJ
      ?auto_245048 - TRUCK
      ?auto_245050 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_245046 ?auto_245049 ) ( IN-CITY ?auto_245044 ?auto_245049 ) ( not ( = ?auto_245044 ?auto_245046 ) ) ( not ( = ?auto_245047 ?auto_245045 ) ) ( OBJ-AT ?auto_245045 ?auto_245046 ) ( IN-TRUCK ?auto_245047 ?auto_245048 ) ( TRUCK-AT ?auto_245048 ?auto_245050 ) ( IN-CITY ?auto_245050 ?auto_245049 ) ( not ( = ?auto_245044 ?auto_245050 ) ) ( not ( = ?auto_245046 ?auto_245050 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_245048 ?auto_245050 ?auto_245044 ?auto_245049 )
      ( DELIVER-2PKG ?auto_245047 ?auto_245045 ?auto_245044 )
      ( DELIVER-1PKG-VERIFY ?auto_245045 ?auto_245044 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_245052 - OBJ
      ?auto_245053 - OBJ
      ?auto_245051 - LOCATION
    )
    :vars
    (
      ?auto_245054 - LOCATION
      ?auto_245057 - CITY
      ?auto_245055 - TRUCK
      ?auto_245056 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_245054 ?auto_245057 ) ( IN-CITY ?auto_245051 ?auto_245057 ) ( not ( = ?auto_245051 ?auto_245054 ) ) ( not ( = ?auto_245052 ?auto_245053 ) ) ( OBJ-AT ?auto_245053 ?auto_245054 ) ( IN-TRUCK ?auto_245052 ?auto_245055 ) ( TRUCK-AT ?auto_245055 ?auto_245056 ) ( IN-CITY ?auto_245056 ?auto_245057 ) ( not ( = ?auto_245051 ?auto_245056 ) ) ( not ( = ?auto_245054 ?auto_245056 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_245053 ?auto_245051 )
      ( DELIVER-2PKG-VERIFY ?auto_245052 ?auto_245053 ?auto_245051 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_245067 - OBJ
      ?auto_245068 - OBJ
      ?auto_245066 - LOCATION
    )
    :vars
    (
      ?auto_245069 - LOCATION
      ?auto_245071 - CITY
      ?auto_245072 - TRUCK
      ?auto_245070 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_245069 ?auto_245071 ) ( IN-CITY ?auto_245066 ?auto_245071 ) ( not ( = ?auto_245066 ?auto_245069 ) ) ( not ( = ?auto_245068 ?auto_245067 ) ) ( OBJ-AT ?auto_245067 ?auto_245069 ) ( IN-TRUCK ?auto_245068 ?auto_245072 ) ( TRUCK-AT ?auto_245072 ?auto_245070 ) ( IN-CITY ?auto_245070 ?auto_245071 ) ( not ( = ?auto_245066 ?auto_245070 ) ) ( not ( = ?auto_245069 ?auto_245070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_245068 ?auto_245067 ?auto_245066 )
      ( DELIVER-2PKG-VERIFY ?auto_245067 ?auto_245068 ?auto_245066 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_247990 - OBJ
      ?auto_247989 - LOCATION
    )
    :vars
    (
      ?auto_247992 - LOCATION
      ?auto_247994 - CITY
      ?auto_247991 - OBJ
      ?auto_247995 - TRUCK
      ?auto_247993 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_247992 ?auto_247994 ) ( IN-CITY ?auto_247989 ?auto_247994 ) ( not ( = ?auto_247989 ?auto_247992 ) ) ( not ( = ?auto_247991 ?auto_247990 ) ) ( OBJ-AT ?auto_247990 ?auto_247992 ) ( TRUCK-AT ?auto_247995 ?auto_247993 ) ( IN-CITY ?auto_247993 ?auto_247994 ) ( not ( = ?auto_247989 ?auto_247993 ) ) ( not ( = ?auto_247992 ?auto_247993 ) ) ( OBJ-AT ?auto_247991 ?auto_247993 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_247991 ?auto_247995 ?auto_247993 )
      ( DELIVER-2PKG ?auto_247991 ?auto_247990 ?auto_247989 )
      ( DELIVER-1PKG-VERIFY ?auto_247990 ?auto_247989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_247997 - OBJ
      ?auto_247998 - OBJ
      ?auto_247996 - LOCATION
    )
    :vars
    (
      ?auto_248000 - LOCATION
      ?auto_248002 - CITY
      ?auto_247999 - TRUCK
      ?auto_248001 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_248000 ?auto_248002 ) ( IN-CITY ?auto_247996 ?auto_248002 ) ( not ( = ?auto_247996 ?auto_248000 ) ) ( not ( = ?auto_247997 ?auto_247998 ) ) ( OBJ-AT ?auto_247998 ?auto_248000 ) ( TRUCK-AT ?auto_247999 ?auto_248001 ) ( IN-CITY ?auto_248001 ?auto_248002 ) ( not ( = ?auto_247996 ?auto_248001 ) ) ( not ( = ?auto_248000 ?auto_248001 ) ) ( OBJ-AT ?auto_247997 ?auto_248001 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_247998 ?auto_247996 )
      ( DELIVER-2PKG-VERIFY ?auto_247997 ?auto_247998 ?auto_247996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_248007 - OBJ
      ?auto_248008 - OBJ
      ?auto_248006 - LOCATION
    )
    :vars
    (
      ?auto_248012 - LOCATION
      ?auto_248010 - CITY
      ?auto_248011 - TRUCK
      ?auto_248009 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_248012 ?auto_248010 ) ( IN-CITY ?auto_248006 ?auto_248010 ) ( not ( = ?auto_248006 ?auto_248012 ) ) ( not ( = ?auto_248008 ?auto_248007 ) ) ( OBJ-AT ?auto_248007 ?auto_248012 ) ( TRUCK-AT ?auto_248011 ?auto_248009 ) ( IN-CITY ?auto_248009 ?auto_248010 ) ( not ( = ?auto_248006 ?auto_248009 ) ) ( not ( = ?auto_248012 ?auto_248009 ) ) ( OBJ-AT ?auto_248008 ?auto_248009 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_248008 ?auto_248007 ?auto_248006 )
      ( DELIVER-2PKG-VERIFY ?auto_248007 ?auto_248008 ?auto_248006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_274852 - OBJ
      ?auto_274853 - OBJ
      ?auto_274854 - OBJ
      ?auto_274851 - LOCATION
    )
    :vars
    (
      ?auto_274855 - TRUCK
      ?auto_274857 - LOCATION
      ?auto_274856 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_274855 ?auto_274857 ) ( IN-CITY ?auto_274857 ?auto_274856 ) ( IN-CITY ?auto_274851 ?auto_274856 ) ( not ( = ?auto_274851 ?auto_274857 ) ) ( OBJ-AT ?auto_274852 ?auto_274851 ) ( not ( = ?auto_274852 ?auto_274854 ) ) ( OBJ-AT ?auto_274854 ?auto_274857 ) ( OBJ-AT ?auto_274853 ?auto_274851 ) ( not ( = ?auto_274852 ?auto_274853 ) ) ( not ( = ?auto_274853 ?auto_274854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_274852 ?auto_274854 ?auto_274851 )
      ( DELIVER-3PKG-VERIFY ?auto_274852 ?auto_274853 ?auto_274854 ?auto_274851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301694 - OBJ
      ?auto_301695 - OBJ
      ?auto_301696 - OBJ
      ?auto_301693 - LOCATION
    )
    :vars
    (
      ?auto_301698 - LOCATION
      ?auto_301700 - CITY
      ?auto_301697 - OBJ
      ?auto_301699 - TRUCK
      ?auto_301701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301698 ?auto_301700 ) ( IN-CITY ?auto_301693 ?auto_301700 ) ( not ( = ?auto_301693 ?auto_301698 ) ) ( OBJ-AT ?auto_301697 ?auto_301693 ) ( not ( = ?auto_301697 ?auto_301696 ) ) ( OBJ-AT ?auto_301696 ?auto_301698 ) ( TRUCK-AT ?auto_301699 ?auto_301701 ) ( IN-CITY ?auto_301701 ?auto_301700 ) ( not ( = ?auto_301693 ?auto_301701 ) ) ( not ( = ?auto_301698 ?auto_301701 ) ) ( OBJ-AT ?auto_301694 ?auto_301693 ) ( OBJ-AT ?auto_301695 ?auto_301693 ) ( not ( = ?auto_301694 ?auto_301695 ) ) ( not ( = ?auto_301694 ?auto_301696 ) ) ( not ( = ?auto_301694 ?auto_301697 ) ) ( not ( = ?auto_301695 ?auto_301696 ) ) ( not ( = ?auto_301695 ?auto_301697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301697 ?auto_301696 ?auto_301693 )
      ( DELIVER-3PKG-VERIFY ?auto_301694 ?auto_301695 ?auto_301696 ?auto_301693 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301716 - OBJ
      ?auto_301717 - OBJ
      ?auto_301718 - OBJ
      ?auto_301715 - LOCATION
    )
    :vars
    (
      ?auto_301720 - LOCATION
      ?auto_301722 - CITY
      ?auto_301719 - OBJ
      ?auto_301721 - TRUCK
      ?auto_301723 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301720 ?auto_301722 ) ( IN-CITY ?auto_301715 ?auto_301722 ) ( not ( = ?auto_301715 ?auto_301720 ) ) ( OBJ-AT ?auto_301719 ?auto_301715 ) ( not ( = ?auto_301719 ?auto_301717 ) ) ( OBJ-AT ?auto_301717 ?auto_301720 ) ( TRUCK-AT ?auto_301721 ?auto_301723 ) ( IN-CITY ?auto_301723 ?auto_301722 ) ( not ( = ?auto_301715 ?auto_301723 ) ) ( not ( = ?auto_301720 ?auto_301723 ) ) ( OBJ-AT ?auto_301716 ?auto_301715 ) ( OBJ-AT ?auto_301718 ?auto_301715 ) ( not ( = ?auto_301716 ?auto_301717 ) ) ( not ( = ?auto_301716 ?auto_301718 ) ) ( not ( = ?auto_301716 ?auto_301719 ) ) ( not ( = ?auto_301717 ?auto_301718 ) ) ( not ( = ?auto_301718 ?auto_301719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301719 ?auto_301717 ?auto_301715 )
      ( DELIVER-3PKG-VERIFY ?auto_301716 ?auto_301717 ?auto_301718 ?auto_301715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_301836 - OBJ
      ?auto_301837 - OBJ
      ?auto_301838 - OBJ
      ?auto_301835 - LOCATION
    )
    :vars
    (
      ?auto_301840 - LOCATION
      ?auto_301842 - CITY
      ?auto_301839 - OBJ
      ?auto_301841 - TRUCK
      ?auto_301843 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301840 ?auto_301842 ) ( IN-CITY ?auto_301835 ?auto_301842 ) ( not ( = ?auto_301835 ?auto_301840 ) ) ( OBJ-AT ?auto_301839 ?auto_301835 ) ( not ( = ?auto_301839 ?auto_301836 ) ) ( OBJ-AT ?auto_301836 ?auto_301840 ) ( TRUCK-AT ?auto_301841 ?auto_301843 ) ( IN-CITY ?auto_301843 ?auto_301842 ) ( not ( = ?auto_301835 ?auto_301843 ) ) ( not ( = ?auto_301840 ?auto_301843 ) ) ( OBJ-AT ?auto_301837 ?auto_301835 ) ( OBJ-AT ?auto_301838 ?auto_301835 ) ( not ( = ?auto_301836 ?auto_301837 ) ) ( not ( = ?auto_301836 ?auto_301838 ) ) ( not ( = ?auto_301837 ?auto_301838 ) ) ( not ( = ?auto_301837 ?auto_301839 ) ) ( not ( = ?auto_301838 ?auto_301839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301839 ?auto_301836 ?auto_301835 )
      ( DELIVER-3PKG-VERIFY ?auto_301836 ?auto_301837 ?auto_301838 ?auto_301835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_301942 - OBJ
      ?auto_301943 - OBJ
      ?auto_301944 - OBJ
      ?auto_301945 - OBJ
      ?auto_301941 - LOCATION
    )
    :vars
    (
      ?auto_301946 - LOCATION
      ?auto_301948 - CITY
      ?auto_301947 - TRUCK
      ?auto_301949 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301946 ?auto_301948 ) ( IN-CITY ?auto_301941 ?auto_301948 ) ( not ( = ?auto_301941 ?auto_301946 ) ) ( OBJ-AT ?auto_301943 ?auto_301941 ) ( not ( = ?auto_301943 ?auto_301945 ) ) ( OBJ-AT ?auto_301945 ?auto_301946 ) ( TRUCK-AT ?auto_301947 ?auto_301949 ) ( IN-CITY ?auto_301949 ?auto_301948 ) ( not ( = ?auto_301941 ?auto_301949 ) ) ( not ( = ?auto_301946 ?auto_301949 ) ) ( OBJ-AT ?auto_301942 ?auto_301941 ) ( OBJ-AT ?auto_301944 ?auto_301941 ) ( not ( = ?auto_301942 ?auto_301943 ) ) ( not ( = ?auto_301942 ?auto_301944 ) ) ( not ( = ?auto_301942 ?auto_301945 ) ) ( not ( = ?auto_301943 ?auto_301944 ) ) ( not ( = ?auto_301944 ?auto_301945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301943 ?auto_301945 ?auto_301941 )
      ( DELIVER-4PKG-VERIFY ?auto_301942 ?auto_301943 ?auto_301944 ?auto_301945 ?auto_301941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_301969 - OBJ
      ?auto_301970 - OBJ
      ?auto_301971 - OBJ
      ?auto_301972 - OBJ
      ?auto_301968 - LOCATION
    )
    :vars
    (
      ?auto_301973 - LOCATION
      ?auto_301975 - CITY
      ?auto_301974 - TRUCK
      ?auto_301976 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_301973 ?auto_301975 ) ( IN-CITY ?auto_301968 ?auto_301975 ) ( not ( = ?auto_301968 ?auto_301973 ) ) ( OBJ-AT ?auto_301970 ?auto_301968 ) ( not ( = ?auto_301970 ?auto_301971 ) ) ( OBJ-AT ?auto_301971 ?auto_301973 ) ( TRUCK-AT ?auto_301974 ?auto_301976 ) ( IN-CITY ?auto_301976 ?auto_301975 ) ( not ( = ?auto_301968 ?auto_301976 ) ) ( not ( = ?auto_301973 ?auto_301976 ) ) ( OBJ-AT ?auto_301969 ?auto_301968 ) ( OBJ-AT ?auto_301972 ?auto_301968 ) ( not ( = ?auto_301969 ?auto_301970 ) ) ( not ( = ?auto_301969 ?auto_301971 ) ) ( not ( = ?auto_301969 ?auto_301972 ) ) ( not ( = ?auto_301970 ?auto_301972 ) ) ( not ( = ?auto_301971 ?auto_301972 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301970 ?auto_301971 ?auto_301968 )
      ( DELIVER-4PKG-VERIFY ?auto_301969 ?auto_301970 ?auto_301971 ?auto_301972 ?auto_301968 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_301996 - OBJ
      ?auto_301997 - OBJ
      ?auto_301998 - OBJ
      ?auto_301999 - OBJ
      ?auto_301995 - LOCATION
    )
    :vars
    (
      ?auto_302000 - LOCATION
      ?auto_302002 - CITY
      ?auto_302001 - TRUCK
      ?auto_302003 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302000 ?auto_302002 ) ( IN-CITY ?auto_301995 ?auto_302002 ) ( not ( = ?auto_301995 ?auto_302000 ) ) ( OBJ-AT ?auto_301998 ?auto_301995 ) ( not ( = ?auto_301998 ?auto_301999 ) ) ( OBJ-AT ?auto_301999 ?auto_302000 ) ( TRUCK-AT ?auto_302001 ?auto_302003 ) ( IN-CITY ?auto_302003 ?auto_302002 ) ( not ( = ?auto_301995 ?auto_302003 ) ) ( not ( = ?auto_302000 ?auto_302003 ) ) ( OBJ-AT ?auto_301996 ?auto_301995 ) ( OBJ-AT ?auto_301997 ?auto_301995 ) ( not ( = ?auto_301996 ?auto_301997 ) ) ( not ( = ?auto_301996 ?auto_301998 ) ) ( not ( = ?auto_301996 ?auto_301999 ) ) ( not ( = ?auto_301997 ?auto_301998 ) ) ( not ( = ?auto_301997 ?auto_301999 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_301998 ?auto_301999 ?auto_301995 )
      ( DELIVER-4PKG-VERIFY ?auto_301996 ?auto_301997 ?auto_301998 ?auto_301999 ?auto_301995 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302131 - OBJ
      ?auto_302132 - OBJ
      ?auto_302133 - OBJ
      ?auto_302134 - OBJ
      ?auto_302130 - LOCATION
    )
    :vars
    (
      ?auto_302135 - LOCATION
      ?auto_302137 - CITY
      ?auto_302136 - TRUCK
      ?auto_302138 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302135 ?auto_302137 ) ( IN-CITY ?auto_302130 ?auto_302137 ) ( not ( = ?auto_302130 ?auto_302135 ) ) ( OBJ-AT ?auto_302133 ?auto_302130 ) ( not ( = ?auto_302133 ?auto_302132 ) ) ( OBJ-AT ?auto_302132 ?auto_302135 ) ( TRUCK-AT ?auto_302136 ?auto_302138 ) ( IN-CITY ?auto_302138 ?auto_302137 ) ( not ( = ?auto_302130 ?auto_302138 ) ) ( not ( = ?auto_302135 ?auto_302138 ) ) ( OBJ-AT ?auto_302131 ?auto_302130 ) ( OBJ-AT ?auto_302134 ?auto_302130 ) ( not ( = ?auto_302131 ?auto_302132 ) ) ( not ( = ?auto_302131 ?auto_302133 ) ) ( not ( = ?auto_302131 ?auto_302134 ) ) ( not ( = ?auto_302132 ?auto_302134 ) ) ( not ( = ?auto_302133 ?auto_302134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302133 ?auto_302132 ?auto_302130 )
      ( DELIVER-4PKG-VERIFY ?auto_302131 ?auto_302132 ?auto_302133 ?auto_302134 ?auto_302130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302158 - OBJ
      ?auto_302159 - OBJ
      ?auto_302160 - OBJ
      ?auto_302161 - OBJ
      ?auto_302157 - LOCATION
    )
    :vars
    (
      ?auto_302162 - LOCATION
      ?auto_302164 - CITY
      ?auto_302163 - TRUCK
      ?auto_302165 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302162 ?auto_302164 ) ( IN-CITY ?auto_302157 ?auto_302164 ) ( not ( = ?auto_302157 ?auto_302162 ) ) ( OBJ-AT ?auto_302161 ?auto_302157 ) ( not ( = ?auto_302161 ?auto_302159 ) ) ( OBJ-AT ?auto_302159 ?auto_302162 ) ( TRUCK-AT ?auto_302163 ?auto_302165 ) ( IN-CITY ?auto_302165 ?auto_302164 ) ( not ( = ?auto_302157 ?auto_302165 ) ) ( not ( = ?auto_302162 ?auto_302165 ) ) ( OBJ-AT ?auto_302158 ?auto_302157 ) ( OBJ-AT ?auto_302160 ?auto_302157 ) ( not ( = ?auto_302158 ?auto_302159 ) ) ( not ( = ?auto_302158 ?auto_302160 ) ) ( not ( = ?auto_302158 ?auto_302161 ) ) ( not ( = ?auto_302159 ?auto_302160 ) ) ( not ( = ?auto_302160 ?auto_302161 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302161 ?auto_302159 ?auto_302157 )
      ( DELIVER-4PKG-VERIFY ?auto_302158 ?auto_302159 ?auto_302160 ?auto_302161 ?auto_302157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302338 - OBJ
      ?auto_302339 - OBJ
      ?auto_302340 - OBJ
      ?auto_302341 - OBJ
      ?auto_302337 - LOCATION
    )
    :vars
    (
      ?auto_302343 - LOCATION
      ?auto_302345 - CITY
      ?auto_302342 - OBJ
      ?auto_302344 - TRUCK
      ?auto_302346 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302343 ?auto_302345 ) ( IN-CITY ?auto_302337 ?auto_302345 ) ( not ( = ?auto_302337 ?auto_302343 ) ) ( OBJ-AT ?auto_302342 ?auto_302337 ) ( not ( = ?auto_302342 ?auto_302341 ) ) ( OBJ-AT ?auto_302341 ?auto_302343 ) ( TRUCK-AT ?auto_302344 ?auto_302346 ) ( IN-CITY ?auto_302346 ?auto_302345 ) ( not ( = ?auto_302337 ?auto_302346 ) ) ( not ( = ?auto_302343 ?auto_302346 ) ) ( OBJ-AT ?auto_302338 ?auto_302337 ) ( OBJ-AT ?auto_302339 ?auto_302337 ) ( OBJ-AT ?auto_302340 ?auto_302337 ) ( not ( = ?auto_302338 ?auto_302339 ) ) ( not ( = ?auto_302338 ?auto_302340 ) ) ( not ( = ?auto_302338 ?auto_302341 ) ) ( not ( = ?auto_302338 ?auto_302342 ) ) ( not ( = ?auto_302339 ?auto_302340 ) ) ( not ( = ?auto_302339 ?auto_302341 ) ) ( not ( = ?auto_302339 ?auto_302342 ) ) ( not ( = ?auto_302340 ?auto_302341 ) ) ( not ( = ?auto_302340 ?auto_302342 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302342 ?auto_302341 ?auto_302337 )
      ( DELIVER-4PKG-VERIFY ?auto_302338 ?auto_302339 ?auto_302340 ?auto_302341 ?auto_302337 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302358 - OBJ
      ?auto_302359 - OBJ
      ?auto_302360 - OBJ
      ?auto_302361 - OBJ
      ?auto_302357 - LOCATION
    )
    :vars
    (
      ?auto_302362 - LOCATION
      ?auto_302364 - CITY
      ?auto_302363 - TRUCK
      ?auto_302365 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302362 ?auto_302364 ) ( IN-CITY ?auto_302357 ?auto_302364 ) ( not ( = ?auto_302357 ?auto_302362 ) ) ( OBJ-AT ?auto_302361 ?auto_302357 ) ( not ( = ?auto_302361 ?auto_302360 ) ) ( OBJ-AT ?auto_302360 ?auto_302362 ) ( TRUCK-AT ?auto_302363 ?auto_302365 ) ( IN-CITY ?auto_302365 ?auto_302364 ) ( not ( = ?auto_302357 ?auto_302365 ) ) ( not ( = ?auto_302362 ?auto_302365 ) ) ( OBJ-AT ?auto_302358 ?auto_302357 ) ( OBJ-AT ?auto_302359 ?auto_302357 ) ( not ( = ?auto_302358 ?auto_302359 ) ) ( not ( = ?auto_302358 ?auto_302360 ) ) ( not ( = ?auto_302358 ?auto_302361 ) ) ( not ( = ?auto_302359 ?auto_302360 ) ) ( not ( = ?auto_302359 ?auto_302361 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302361 ?auto_302360 ?auto_302357 )
      ( DELIVER-4PKG-VERIFY ?auto_302358 ?auto_302359 ?auto_302360 ?auto_302361 ?auto_302357 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302367 - OBJ
      ?auto_302368 - OBJ
      ?auto_302369 - OBJ
      ?auto_302370 - OBJ
      ?auto_302366 - LOCATION
    )
    :vars
    (
      ?auto_302372 - LOCATION
      ?auto_302374 - CITY
      ?auto_302371 - OBJ
      ?auto_302373 - TRUCK
      ?auto_302375 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302372 ?auto_302374 ) ( IN-CITY ?auto_302366 ?auto_302374 ) ( not ( = ?auto_302366 ?auto_302372 ) ) ( OBJ-AT ?auto_302371 ?auto_302366 ) ( not ( = ?auto_302371 ?auto_302369 ) ) ( OBJ-AT ?auto_302369 ?auto_302372 ) ( TRUCK-AT ?auto_302373 ?auto_302375 ) ( IN-CITY ?auto_302375 ?auto_302374 ) ( not ( = ?auto_302366 ?auto_302375 ) ) ( not ( = ?auto_302372 ?auto_302375 ) ) ( OBJ-AT ?auto_302367 ?auto_302366 ) ( OBJ-AT ?auto_302368 ?auto_302366 ) ( OBJ-AT ?auto_302370 ?auto_302366 ) ( not ( = ?auto_302367 ?auto_302368 ) ) ( not ( = ?auto_302367 ?auto_302369 ) ) ( not ( = ?auto_302367 ?auto_302370 ) ) ( not ( = ?auto_302367 ?auto_302371 ) ) ( not ( = ?auto_302368 ?auto_302369 ) ) ( not ( = ?auto_302368 ?auto_302370 ) ) ( not ( = ?auto_302368 ?auto_302371 ) ) ( not ( = ?auto_302369 ?auto_302370 ) ) ( not ( = ?auto_302370 ?auto_302371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302371 ?auto_302369 ?auto_302366 )
      ( DELIVER-4PKG-VERIFY ?auto_302367 ?auto_302368 ?auto_302369 ?auto_302370 ?auto_302366 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_302510 - OBJ
      ?auto_302511 - OBJ
      ?auto_302512 - OBJ
      ?auto_302513 - OBJ
      ?auto_302509 - LOCATION
    )
    :vars
    (
      ?auto_302515 - LOCATION
      ?auto_302517 - CITY
      ?auto_302514 - OBJ
      ?auto_302516 - TRUCK
      ?auto_302518 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_302515 ?auto_302517 ) ( IN-CITY ?auto_302509 ?auto_302517 ) ( not ( = ?auto_302509 ?auto_302515 ) ) ( OBJ-AT ?auto_302514 ?auto_302509 ) ( not ( = ?auto_302514 ?auto_302511 ) ) ( OBJ-AT ?auto_302511 ?auto_302515 ) ( TRUCK-AT ?auto_302516 ?auto_302518 ) ( IN-CITY ?auto_302518 ?auto_302517 ) ( not ( = ?auto_302509 ?auto_302518 ) ) ( not ( = ?auto_302515 ?auto_302518 ) ) ( OBJ-AT ?auto_302510 ?auto_302509 ) ( OBJ-AT ?auto_302512 ?auto_302509 ) ( OBJ-AT ?auto_302513 ?auto_302509 ) ( not ( = ?auto_302510 ?auto_302511 ) ) ( not ( = ?auto_302510 ?auto_302512 ) ) ( not ( = ?auto_302510 ?auto_302513 ) ) ( not ( = ?auto_302510 ?auto_302514 ) ) ( not ( = ?auto_302511 ?auto_302512 ) ) ( not ( = ?auto_302511 ?auto_302513 ) ) ( not ( = ?auto_302512 ?auto_302513 ) ) ( not ( = ?auto_302512 ?auto_302514 ) ) ( not ( = ?auto_302513 ?auto_302514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_302514 ?auto_302511 ?auto_302509 )
      ( DELIVER-4PKG-VERIFY ?auto_302510 ?auto_302511 ?auto_302512 ?auto_302513 ?auto_302509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303006 - OBJ
      ?auto_303007 - OBJ
      ?auto_303008 - OBJ
      ?auto_303009 - OBJ
      ?auto_303005 - LOCATION
    )
    :vars
    (
      ?auto_303010 - LOCATION
      ?auto_303012 - CITY
      ?auto_303011 - TRUCK
      ?auto_303013 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303010 ?auto_303012 ) ( IN-CITY ?auto_303005 ?auto_303012 ) ( not ( = ?auto_303005 ?auto_303010 ) ) ( OBJ-AT ?auto_303007 ?auto_303005 ) ( not ( = ?auto_303007 ?auto_303006 ) ) ( OBJ-AT ?auto_303006 ?auto_303010 ) ( TRUCK-AT ?auto_303011 ?auto_303013 ) ( IN-CITY ?auto_303013 ?auto_303012 ) ( not ( = ?auto_303005 ?auto_303013 ) ) ( not ( = ?auto_303010 ?auto_303013 ) ) ( OBJ-AT ?auto_303008 ?auto_303005 ) ( OBJ-AT ?auto_303009 ?auto_303005 ) ( not ( = ?auto_303006 ?auto_303008 ) ) ( not ( = ?auto_303006 ?auto_303009 ) ) ( not ( = ?auto_303007 ?auto_303008 ) ) ( not ( = ?auto_303007 ?auto_303009 ) ) ( not ( = ?auto_303008 ?auto_303009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303007 ?auto_303006 ?auto_303005 )
      ( DELIVER-4PKG-VERIFY ?auto_303006 ?auto_303007 ?auto_303008 ?auto_303009 ?auto_303005 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303114 - OBJ
      ?auto_303115 - OBJ
      ?auto_303116 - OBJ
      ?auto_303117 - OBJ
      ?auto_303113 - LOCATION
    )
    :vars
    (
      ?auto_303118 - LOCATION
      ?auto_303120 - CITY
      ?auto_303119 - TRUCK
      ?auto_303121 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303118 ?auto_303120 ) ( IN-CITY ?auto_303113 ?auto_303120 ) ( not ( = ?auto_303113 ?auto_303118 ) ) ( OBJ-AT ?auto_303117 ?auto_303113 ) ( not ( = ?auto_303117 ?auto_303114 ) ) ( OBJ-AT ?auto_303114 ?auto_303118 ) ( TRUCK-AT ?auto_303119 ?auto_303121 ) ( IN-CITY ?auto_303121 ?auto_303120 ) ( not ( = ?auto_303113 ?auto_303121 ) ) ( not ( = ?auto_303118 ?auto_303121 ) ) ( OBJ-AT ?auto_303115 ?auto_303113 ) ( OBJ-AT ?auto_303116 ?auto_303113 ) ( not ( = ?auto_303114 ?auto_303115 ) ) ( not ( = ?auto_303114 ?auto_303116 ) ) ( not ( = ?auto_303115 ?auto_303116 ) ) ( not ( = ?auto_303115 ?auto_303117 ) ) ( not ( = ?auto_303116 ?auto_303117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303117 ?auto_303114 ?auto_303113 )
      ( DELIVER-4PKG-VERIFY ?auto_303114 ?auto_303115 ?auto_303116 ?auto_303117 ?auto_303113 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_303159 - OBJ
      ?auto_303160 - OBJ
      ?auto_303161 - OBJ
      ?auto_303162 - OBJ
      ?auto_303158 - LOCATION
    )
    :vars
    (
      ?auto_303164 - LOCATION
      ?auto_303166 - CITY
      ?auto_303163 - OBJ
      ?auto_303165 - TRUCK
      ?auto_303167 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303164 ?auto_303166 ) ( IN-CITY ?auto_303158 ?auto_303166 ) ( not ( = ?auto_303158 ?auto_303164 ) ) ( OBJ-AT ?auto_303163 ?auto_303158 ) ( not ( = ?auto_303163 ?auto_303159 ) ) ( OBJ-AT ?auto_303159 ?auto_303164 ) ( TRUCK-AT ?auto_303165 ?auto_303167 ) ( IN-CITY ?auto_303167 ?auto_303166 ) ( not ( = ?auto_303158 ?auto_303167 ) ) ( not ( = ?auto_303164 ?auto_303167 ) ) ( OBJ-AT ?auto_303160 ?auto_303158 ) ( OBJ-AT ?auto_303161 ?auto_303158 ) ( OBJ-AT ?auto_303162 ?auto_303158 ) ( not ( = ?auto_303159 ?auto_303160 ) ) ( not ( = ?auto_303159 ?auto_303161 ) ) ( not ( = ?auto_303159 ?auto_303162 ) ) ( not ( = ?auto_303160 ?auto_303161 ) ) ( not ( = ?auto_303160 ?auto_303162 ) ) ( not ( = ?auto_303160 ?auto_303163 ) ) ( not ( = ?auto_303161 ?auto_303162 ) ) ( not ( = ?auto_303161 ?auto_303163 ) ) ( not ( = ?auto_303162 ?auto_303163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303163 ?auto_303159 ?auto_303158 )
      ( DELIVER-4PKG-VERIFY ?auto_303159 ?auto_303160 ?auto_303161 ?auto_303162 ?auto_303158 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303583 - OBJ
      ?auto_303584 - OBJ
      ?auto_303585 - OBJ
      ?auto_303586 - OBJ
      ?auto_303587 - OBJ
      ?auto_303582 - LOCATION
    )
    :vars
    (
      ?auto_303588 - LOCATION
      ?auto_303590 - CITY
      ?auto_303589 - TRUCK
      ?auto_303591 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303588 ?auto_303590 ) ( IN-CITY ?auto_303582 ?auto_303590 ) ( not ( = ?auto_303582 ?auto_303588 ) ) ( OBJ-AT ?auto_303585 ?auto_303582 ) ( not ( = ?auto_303585 ?auto_303587 ) ) ( OBJ-AT ?auto_303587 ?auto_303588 ) ( TRUCK-AT ?auto_303589 ?auto_303591 ) ( IN-CITY ?auto_303591 ?auto_303590 ) ( not ( = ?auto_303582 ?auto_303591 ) ) ( not ( = ?auto_303588 ?auto_303591 ) ) ( OBJ-AT ?auto_303583 ?auto_303582 ) ( OBJ-AT ?auto_303584 ?auto_303582 ) ( OBJ-AT ?auto_303586 ?auto_303582 ) ( not ( = ?auto_303583 ?auto_303584 ) ) ( not ( = ?auto_303583 ?auto_303585 ) ) ( not ( = ?auto_303583 ?auto_303586 ) ) ( not ( = ?auto_303583 ?auto_303587 ) ) ( not ( = ?auto_303584 ?auto_303585 ) ) ( not ( = ?auto_303584 ?auto_303586 ) ) ( not ( = ?auto_303584 ?auto_303587 ) ) ( not ( = ?auto_303585 ?auto_303586 ) ) ( not ( = ?auto_303586 ?auto_303587 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303585 ?auto_303587 ?auto_303582 )
      ( DELIVER-5PKG-VERIFY ?auto_303583 ?auto_303584 ?auto_303585 ?auto_303586 ?auto_303587 ?auto_303582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303613 - OBJ
      ?auto_303614 - OBJ
      ?auto_303615 - OBJ
      ?auto_303616 - OBJ
      ?auto_303617 - OBJ
      ?auto_303612 - LOCATION
    )
    :vars
    (
      ?auto_303618 - LOCATION
      ?auto_303620 - CITY
      ?auto_303619 - TRUCK
      ?auto_303621 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303618 ?auto_303620 ) ( IN-CITY ?auto_303612 ?auto_303620 ) ( not ( = ?auto_303612 ?auto_303618 ) ) ( OBJ-AT ?auto_303615 ?auto_303612 ) ( not ( = ?auto_303615 ?auto_303616 ) ) ( OBJ-AT ?auto_303616 ?auto_303618 ) ( TRUCK-AT ?auto_303619 ?auto_303621 ) ( IN-CITY ?auto_303621 ?auto_303620 ) ( not ( = ?auto_303612 ?auto_303621 ) ) ( not ( = ?auto_303618 ?auto_303621 ) ) ( OBJ-AT ?auto_303613 ?auto_303612 ) ( OBJ-AT ?auto_303614 ?auto_303612 ) ( OBJ-AT ?auto_303617 ?auto_303612 ) ( not ( = ?auto_303613 ?auto_303614 ) ) ( not ( = ?auto_303613 ?auto_303615 ) ) ( not ( = ?auto_303613 ?auto_303616 ) ) ( not ( = ?auto_303613 ?auto_303617 ) ) ( not ( = ?auto_303614 ?auto_303615 ) ) ( not ( = ?auto_303614 ?auto_303616 ) ) ( not ( = ?auto_303614 ?auto_303617 ) ) ( not ( = ?auto_303615 ?auto_303617 ) ) ( not ( = ?auto_303616 ?auto_303617 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303615 ?auto_303616 ?auto_303612 )
      ( DELIVER-5PKG-VERIFY ?auto_303613 ?auto_303614 ?auto_303615 ?auto_303616 ?auto_303617 ?auto_303612 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303673 - OBJ
      ?auto_303674 - OBJ
      ?auto_303675 - OBJ
      ?auto_303676 - OBJ
      ?auto_303677 - OBJ
      ?auto_303672 - LOCATION
    )
    :vars
    (
      ?auto_303678 - LOCATION
      ?auto_303680 - CITY
      ?auto_303679 - TRUCK
      ?auto_303681 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303678 ?auto_303680 ) ( IN-CITY ?auto_303672 ?auto_303680 ) ( not ( = ?auto_303672 ?auto_303678 ) ) ( OBJ-AT ?auto_303677 ?auto_303672 ) ( not ( = ?auto_303677 ?auto_303676 ) ) ( OBJ-AT ?auto_303676 ?auto_303678 ) ( TRUCK-AT ?auto_303679 ?auto_303681 ) ( IN-CITY ?auto_303681 ?auto_303680 ) ( not ( = ?auto_303672 ?auto_303681 ) ) ( not ( = ?auto_303678 ?auto_303681 ) ) ( OBJ-AT ?auto_303673 ?auto_303672 ) ( OBJ-AT ?auto_303674 ?auto_303672 ) ( OBJ-AT ?auto_303675 ?auto_303672 ) ( not ( = ?auto_303673 ?auto_303674 ) ) ( not ( = ?auto_303673 ?auto_303675 ) ) ( not ( = ?auto_303673 ?auto_303676 ) ) ( not ( = ?auto_303673 ?auto_303677 ) ) ( not ( = ?auto_303674 ?auto_303675 ) ) ( not ( = ?auto_303674 ?auto_303676 ) ) ( not ( = ?auto_303674 ?auto_303677 ) ) ( not ( = ?auto_303675 ?auto_303676 ) ) ( not ( = ?auto_303675 ?auto_303677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303677 ?auto_303676 ?auto_303672 )
      ( DELIVER-5PKG-VERIFY ?auto_303673 ?auto_303674 ?auto_303675 ?auto_303676 ?auto_303677 ?auto_303672 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303783 - OBJ
      ?auto_303784 - OBJ
      ?auto_303785 - OBJ
      ?auto_303786 - OBJ
      ?auto_303787 - OBJ
      ?auto_303782 - LOCATION
    )
    :vars
    (
      ?auto_303788 - LOCATION
      ?auto_303790 - CITY
      ?auto_303789 - TRUCK
      ?auto_303791 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303788 ?auto_303790 ) ( IN-CITY ?auto_303782 ?auto_303790 ) ( not ( = ?auto_303782 ?auto_303788 ) ) ( OBJ-AT ?auto_303784 ?auto_303782 ) ( not ( = ?auto_303784 ?auto_303785 ) ) ( OBJ-AT ?auto_303785 ?auto_303788 ) ( TRUCK-AT ?auto_303789 ?auto_303791 ) ( IN-CITY ?auto_303791 ?auto_303790 ) ( not ( = ?auto_303782 ?auto_303791 ) ) ( not ( = ?auto_303788 ?auto_303791 ) ) ( OBJ-AT ?auto_303783 ?auto_303782 ) ( OBJ-AT ?auto_303786 ?auto_303782 ) ( OBJ-AT ?auto_303787 ?auto_303782 ) ( not ( = ?auto_303783 ?auto_303784 ) ) ( not ( = ?auto_303783 ?auto_303785 ) ) ( not ( = ?auto_303783 ?auto_303786 ) ) ( not ( = ?auto_303783 ?auto_303787 ) ) ( not ( = ?auto_303784 ?auto_303786 ) ) ( not ( = ?auto_303784 ?auto_303787 ) ) ( not ( = ?auto_303785 ?auto_303786 ) ) ( not ( = ?auto_303785 ?auto_303787 ) ) ( not ( = ?auto_303786 ?auto_303787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303784 ?auto_303785 ?auto_303782 )
      ( DELIVER-5PKG-VERIFY ?auto_303783 ?auto_303784 ?auto_303785 ?auto_303786 ?auto_303787 ?auto_303782 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_303793 - OBJ
      ?auto_303794 - OBJ
      ?auto_303795 - OBJ
      ?auto_303796 - OBJ
      ?auto_303797 - OBJ
      ?auto_303792 - LOCATION
    )
    :vars
    (
      ?auto_303798 - LOCATION
      ?auto_303800 - CITY
      ?auto_303799 - TRUCK
      ?auto_303801 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_303798 ?auto_303800 ) ( IN-CITY ?auto_303792 ?auto_303800 ) ( not ( = ?auto_303792 ?auto_303798 ) ) ( OBJ-AT ?auto_303796 ?auto_303792 ) ( not ( = ?auto_303796 ?auto_303795 ) ) ( OBJ-AT ?auto_303795 ?auto_303798 ) ( TRUCK-AT ?auto_303799 ?auto_303801 ) ( IN-CITY ?auto_303801 ?auto_303800 ) ( not ( = ?auto_303792 ?auto_303801 ) ) ( not ( = ?auto_303798 ?auto_303801 ) ) ( OBJ-AT ?auto_303793 ?auto_303792 ) ( OBJ-AT ?auto_303794 ?auto_303792 ) ( OBJ-AT ?auto_303797 ?auto_303792 ) ( not ( = ?auto_303793 ?auto_303794 ) ) ( not ( = ?auto_303793 ?auto_303795 ) ) ( not ( = ?auto_303793 ?auto_303796 ) ) ( not ( = ?auto_303793 ?auto_303797 ) ) ( not ( = ?auto_303794 ?auto_303795 ) ) ( not ( = ?auto_303794 ?auto_303796 ) ) ( not ( = ?auto_303794 ?auto_303797 ) ) ( not ( = ?auto_303795 ?auto_303797 ) ) ( not ( = ?auto_303796 ?auto_303797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_303796 ?auto_303795 ?auto_303792 )
      ( DELIVER-5PKG-VERIFY ?auto_303793 ?auto_303794 ?auto_303795 ?auto_303796 ?auto_303797 ?auto_303792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304693 - OBJ
      ?auto_304694 - OBJ
      ?auto_304695 - OBJ
      ?auto_304696 - OBJ
      ?auto_304697 - OBJ
      ?auto_304692 - LOCATION
    )
    :vars
    (
      ?auto_304698 - LOCATION
      ?auto_304700 - CITY
      ?auto_304699 - TRUCK
      ?auto_304701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304698 ?auto_304700 ) ( IN-CITY ?auto_304692 ?auto_304700 ) ( not ( = ?auto_304692 ?auto_304698 ) ) ( OBJ-AT ?auto_304695 ?auto_304692 ) ( not ( = ?auto_304695 ?auto_304694 ) ) ( OBJ-AT ?auto_304694 ?auto_304698 ) ( TRUCK-AT ?auto_304699 ?auto_304701 ) ( IN-CITY ?auto_304701 ?auto_304700 ) ( not ( = ?auto_304692 ?auto_304701 ) ) ( not ( = ?auto_304698 ?auto_304701 ) ) ( OBJ-AT ?auto_304693 ?auto_304692 ) ( OBJ-AT ?auto_304696 ?auto_304692 ) ( OBJ-AT ?auto_304697 ?auto_304692 ) ( not ( = ?auto_304693 ?auto_304694 ) ) ( not ( = ?auto_304693 ?auto_304695 ) ) ( not ( = ?auto_304693 ?auto_304696 ) ) ( not ( = ?auto_304693 ?auto_304697 ) ) ( not ( = ?auto_304694 ?auto_304696 ) ) ( not ( = ?auto_304694 ?auto_304697 ) ) ( not ( = ?auto_304695 ?auto_304696 ) ) ( not ( = ?auto_304695 ?auto_304697 ) ) ( not ( = ?auto_304696 ?auto_304697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304695 ?auto_304694 ?auto_304692 )
      ( DELIVER-5PKG-VERIFY ?auto_304693 ?auto_304694 ?auto_304695 ?auto_304696 ?auto_304697 ?auto_304692 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_304843 - OBJ
      ?auto_304844 - OBJ
      ?auto_304845 - OBJ
      ?auto_304846 - OBJ
      ?auto_304847 - OBJ
      ?auto_304842 - LOCATION
    )
    :vars
    (
      ?auto_304848 - LOCATION
      ?auto_304850 - CITY
      ?auto_304849 - TRUCK
      ?auto_304851 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_304848 ?auto_304850 ) ( IN-CITY ?auto_304842 ?auto_304850 ) ( not ( = ?auto_304842 ?auto_304848 ) ) ( OBJ-AT ?auto_304847 ?auto_304842 ) ( not ( = ?auto_304847 ?auto_304844 ) ) ( OBJ-AT ?auto_304844 ?auto_304848 ) ( TRUCK-AT ?auto_304849 ?auto_304851 ) ( IN-CITY ?auto_304851 ?auto_304850 ) ( not ( = ?auto_304842 ?auto_304851 ) ) ( not ( = ?auto_304848 ?auto_304851 ) ) ( OBJ-AT ?auto_304843 ?auto_304842 ) ( OBJ-AT ?auto_304845 ?auto_304842 ) ( OBJ-AT ?auto_304846 ?auto_304842 ) ( not ( = ?auto_304843 ?auto_304844 ) ) ( not ( = ?auto_304843 ?auto_304845 ) ) ( not ( = ?auto_304843 ?auto_304846 ) ) ( not ( = ?auto_304843 ?auto_304847 ) ) ( not ( = ?auto_304844 ?auto_304845 ) ) ( not ( = ?auto_304844 ?auto_304846 ) ) ( not ( = ?auto_304845 ?auto_304846 ) ) ( not ( = ?auto_304845 ?auto_304847 ) ) ( not ( = ?auto_304846 ?auto_304847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_304847 ?auto_304844 ?auto_304842 )
      ( DELIVER-5PKG-VERIFY ?auto_304843 ?auto_304844 ?auto_304845 ?auto_304846 ?auto_304847 ?auto_304842 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305393 - OBJ
      ?auto_305394 - OBJ
      ?auto_305395 - OBJ
      ?auto_305396 - OBJ
      ?auto_305397 - OBJ
      ?auto_305392 - LOCATION
    )
    :vars
    (
      ?auto_305398 - LOCATION
      ?auto_305400 - CITY
      ?auto_305399 - TRUCK
      ?auto_305401 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305398 ?auto_305400 ) ( IN-CITY ?auto_305392 ?auto_305400 ) ( not ( = ?auto_305392 ?auto_305398 ) ) ( OBJ-AT ?auto_305396 ?auto_305392 ) ( not ( = ?auto_305396 ?auto_305397 ) ) ( OBJ-AT ?auto_305397 ?auto_305398 ) ( TRUCK-AT ?auto_305399 ?auto_305401 ) ( IN-CITY ?auto_305401 ?auto_305400 ) ( not ( = ?auto_305392 ?auto_305401 ) ) ( not ( = ?auto_305398 ?auto_305401 ) ) ( OBJ-AT ?auto_305393 ?auto_305392 ) ( OBJ-AT ?auto_305394 ?auto_305392 ) ( OBJ-AT ?auto_305395 ?auto_305392 ) ( not ( = ?auto_305393 ?auto_305394 ) ) ( not ( = ?auto_305393 ?auto_305395 ) ) ( not ( = ?auto_305393 ?auto_305396 ) ) ( not ( = ?auto_305393 ?auto_305397 ) ) ( not ( = ?auto_305394 ?auto_305395 ) ) ( not ( = ?auto_305394 ?auto_305396 ) ) ( not ( = ?auto_305394 ?auto_305397 ) ) ( not ( = ?auto_305395 ?auto_305396 ) ) ( not ( = ?auto_305395 ?auto_305397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305396 ?auto_305397 ?auto_305392 )
      ( DELIVER-5PKG-VERIFY ?auto_305393 ?auto_305394 ?auto_305395 ?auto_305396 ?auto_305397 ?auto_305392 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305423 - OBJ
      ?auto_305424 - OBJ
      ?auto_305425 - OBJ
      ?auto_305426 - OBJ
      ?auto_305427 - OBJ
      ?auto_305422 - LOCATION
    )
    :vars
    (
      ?auto_305428 - LOCATION
      ?auto_305430 - CITY
      ?auto_305429 - TRUCK
      ?auto_305431 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305428 ?auto_305430 ) ( IN-CITY ?auto_305422 ?auto_305430 ) ( not ( = ?auto_305422 ?auto_305428 ) ) ( OBJ-AT ?auto_305424 ?auto_305422 ) ( not ( = ?auto_305424 ?auto_305426 ) ) ( OBJ-AT ?auto_305426 ?auto_305428 ) ( TRUCK-AT ?auto_305429 ?auto_305431 ) ( IN-CITY ?auto_305431 ?auto_305430 ) ( not ( = ?auto_305422 ?auto_305431 ) ) ( not ( = ?auto_305428 ?auto_305431 ) ) ( OBJ-AT ?auto_305423 ?auto_305422 ) ( OBJ-AT ?auto_305425 ?auto_305422 ) ( OBJ-AT ?auto_305427 ?auto_305422 ) ( not ( = ?auto_305423 ?auto_305424 ) ) ( not ( = ?auto_305423 ?auto_305425 ) ) ( not ( = ?auto_305423 ?auto_305426 ) ) ( not ( = ?auto_305423 ?auto_305427 ) ) ( not ( = ?auto_305424 ?auto_305425 ) ) ( not ( = ?auto_305424 ?auto_305427 ) ) ( not ( = ?auto_305425 ?auto_305426 ) ) ( not ( = ?auto_305425 ?auto_305427 ) ) ( not ( = ?auto_305426 ?auto_305427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305424 ?auto_305426 ?auto_305422 )
      ( DELIVER-5PKG-VERIFY ?auto_305423 ?auto_305424 ?auto_305425 ?auto_305426 ?auto_305427 ?auto_305422 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305773 - OBJ
      ?auto_305774 - OBJ
      ?auto_305775 - OBJ
      ?auto_305776 - OBJ
      ?auto_305777 - OBJ
      ?auto_305772 - LOCATION
    )
    :vars
    (
      ?auto_305779 - LOCATION
      ?auto_305781 - CITY
      ?auto_305778 - OBJ
      ?auto_305780 - TRUCK
      ?auto_305782 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305779 ?auto_305781 ) ( IN-CITY ?auto_305772 ?auto_305781 ) ( not ( = ?auto_305772 ?auto_305779 ) ) ( OBJ-AT ?auto_305778 ?auto_305772 ) ( not ( = ?auto_305778 ?auto_305777 ) ) ( OBJ-AT ?auto_305777 ?auto_305779 ) ( TRUCK-AT ?auto_305780 ?auto_305782 ) ( IN-CITY ?auto_305782 ?auto_305781 ) ( not ( = ?auto_305772 ?auto_305782 ) ) ( not ( = ?auto_305779 ?auto_305782 ) ) ( OBJ-AT ?auto_305773 ?auto_305772 ) ( OBJ-AT ?auto_305774 ?auto_305772 ) ( OBJ-AT ?auto_305775 ?auto_305772 ) ( OBJ-AT ?auto_305776 ?auto_305772 ) ( not ( = ?auto_305773 ?auto_305774 ) ) ( not ( = ?auto_305773 ?auto_305775 ) ) ( not ( = ?auto_305773 ?auto_305776 ) ) ( not ( = ?auto_305773 ?auto_305777 ) ) ( not ( = ?auto_305773 ?auto_305778 ) ) ( not ( = ?auto_305774 ?auto_305775 ) ) ( not ( = ?auto_305774 ?auto_305776 ) ) ( not ( = ?auto_305774 ?auto_305777 ) ) ( not ( = ?auto_305774 ?auto_305778 ) ) ( not ( = ?auto_305775 ?auto_305776 ) ) ( not ( = ?auto_305775 ?auto_305777 ) ) ( not ( = ?auto_305775 ?auto_305778 ) ) ( not ( = ?auto_305776 ?auto_305777 ) ) ( not ( = ?auto_305776 ?auto_305778 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305778 ?auto_305777 ?auto_305772 )
      ( DELIVER-5PKG-VERIFY ?auto_305773 ?auto_305774 ?auto_305775 ?auto_305776 ?auto_305777 ?auto_305772 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305805 - OBJ
      ?auto_305806 - OBJ
      ?auto_305807 - OBJ
      ?auto_305808 - OBJ
      ?auto_305809 - OBJ
      ?auto_305804 - LOCATION
    )
    :vars
    (
      ?auto_305811 - LOCATION
      ?auto_305813 - CITY
      ?auto_305810 - OBJ
      ?auto_305812 - TRUCK
      ?auto_305814 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305811 ?auto_305813 ) ( IN-CITY ?auto_305804 ?auto_305813 ) ( not ( = ?auto_305804 ?auto_305811 ) ) ( OBJ-AT ?auto_305810 ?auto_305804 ) ( not ( = ?auto_305810 ?auto_305808 ) ) ( OBJ-AT ?auto_305808 ?auto_305811 ) ( TRUCK-AT ?auto_305812 ?auto_305814 ) ( IN-CITY ?auto_305814 ?auto_305813 ) ( not ( = ?auto_305804 ?auto_305814 ) ) ( not ( = ?auto_305811 ?auto_305814 ) ) ( OBJ-AT ?auto_305805 ?auto_305804 ) ( OBJ-AT ?auto_305806 ?auto_305804 ) ( OBJ-AT ?auto_305807 ?auto_305804 ) ( OBJ-AT ?auto_305809 ?auto_305804 ) ( not ( = ?auto_305805 ?auto_305806 ) ) ( not ( = ?auto_305805 ?auto_305807 ) ) ( not ( = ?auto_305805 ?auto_305808 ) ) ( not ( = ?auto_305805 ?auto_305809 ) ) ( not ( = ?auto_305805 ?auto_305810 ) ) ( not ( = ?auto_305806 ?auto_305807 ) ) ( not ( = ?auto_305806 ?auto_305808 ) ) ( not ( = ?auto_305806 ?auto_305809 ) ) ( not ( = ?auto_305806 ?auto_305810 ) ) ( not ( = ?auto_305807 ?auto_305808 ) ) ( not ( = ?auto_305807 ?auto_305809 ) ) ( not ( = ?auto_305807 ?auto_305810 ) ) ( not ( = ?auto_305808 ?auto_305809 ) ) ( not ( = ?auto_305809 ?auto_305810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305810 ?auto_305808 ?auto_305804 )
      ( DELIVER-5PKG-VERIFY ?auto_305805 ?auto_305806 ?auto_305807 ?auto_305808 ?auto_305809 ?auto_305804 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_305963 - OBJ
      ?auto_305964 - OBJ
      ?auto_305965 - OBJ
      ?auto_305966 - OBJ
      ?auto_305967 - OBJ
      ?auto_305962 - LOCATION
    )
    :vars
    (
      ?auto_305969 - LOCATION
      ?auto_305971 - CITY
      ?auto_305968 - OBJ
      ?auto_305970 - TRUCK
      ?auto_305972 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_305969 ?auto_305971 ) ( IN-CITY ?auto_305962 ?auto_305971 ) ( not ( = ?auto_305962 ?auto_305969 ) ) ( OBJ-AT ?auto_305968 ?auto_305962 ) ( not ( = ?auto_305968 ?auto_305965 ) ) ( OBJ-AT ?auto_305965 ?auto_305969 ) ( TRUCK-AT ?auto_305970 ?auto_305972 ) ( IN-CITY ?auto_305972 ?auto_305971 ) ( not ( = ?auto_305962 ?auto_305972 ) ) ( not ( = ?auto_305969 ?auto_305972 ) ) ( OBJ-AT ?auto_305963 ?auto_305962 ) ( OBJ-AT ?auto_305964 ?auto_305962 ) ( OBJ-AT ?auto_305966 ?auto_305962 ) ( OBJ-AT ?auto_305967 ?auto_305962 ) ( not ( = ?auto_305963 ?auto_305964 ) ) ( not ( = ?auto_305963 ?auto_305965 ) ) ( not ( = ?auto_305963 ?auto_305966 ) ) ( not ( = ?auto_305963 ?auto_305967 ) ) ( not ( = ?auto_305963 ?auto_305968 ) ) ( not ( = ?auto_305964 ?auto_305965 ) ) ( not ( = ?auto_305964 ?auto_305966 ) ) ( not ( = ?auto_305964 ?auto_305967 ) ) ( not ( = ?auto_305964 ?auto_305968 ) ) ( not ( = ?auto_305965 ?auto_305966 ) ) ( not ( = ?auto_305965 ?auto_305967 ) ) ( not ( = ?auto_305966 ?auto_305967 ) ) ( not ( = ?auto_305966 ?auto_305968 ) ) ( not ( = ?auto_305967 ?auto_305968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_305968 ?auto_305965 ?auto_305962 )
      ( DELIVER-5PKG-VERIFY ?auto_305963 ?auto_305964 ?auto_305965 ?auto_305966 ?auto_305967 ?auto_305962 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306641 - OBJ
      ?auto_306642 - OBJ
      ?auto_306643 - OBJ
      ?auto_306644 - OBJ
      ?auto_306645 - OBJ
      ?auto_306640 - LOCATION
    )
    :vars
    (
      ?auto_306646 - LOCATION
      ?auto_306648 - CITY
      ?auto_306647 - TRUCK
      ?auto_306649 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306646 ?auto_306648 ) ( IN-CITY ?auto_306640 ?auto_306648 ) ( not ( = ?auto_306640 ?auto_306646 ) ) ( OBJ-AT ?auto_306644 ?auto_306640 ) ( not ( = ?auto_306644 ?auto_306642 ) ) ( OBJ-AT ?auto_306642 ?auto_306646 ) ( TRUCK-AT ?auto_306647 ?auto_306649 ) ( IN-CITY ?auto_306649 ?auto_306648 ) ( not ( = ?auto_306640 ?auto_306649 ) ) ( not ( = ?auto_306646 ?auto_306649 ) ) ( OBJ-AT ?auto_306641 ?auto_306640 ) ( OBJ-AT ?auto_306643 ?auto_306640 ) ( OBJ-AT ?auto_306645 ?auto_306640 ) ( not ( = ?auto_306641 ?auto_306642 ) ) ( not ( = ?auto_306641 ?auto_306643 ) ) ( not ( = ?auto_306641 ?auto_306644 ) ) ( not ( = ?auto_306641 ?auto_306645 ) ) ( not ( = ?auto_306642 ?auto_306643 ) ) ( not ( = ?auto_306642 ?auto_306645 ) ) ( not ( = ?auto_306643 ?auto_306644 ) ) ( not ( = ?auto_306643 ?auto_306645 ) ) ( not ( = ?auto_306644 ?auto_306645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306644 ?auto_306642 ?auto_306640 )
      ( DELIVER-5PKG-VERIFY ?auto_306641 ?auto_306642 ?auto_306643 ?auto_306644 ?auto_306645 ?auto_306640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_306681 - OBJ
      ?auto_306682 - OBJ
      ?auto_306683 - OBJ
      ?auto_306684 - OBJ
      ?auto_306685 - OBJ
      ?auto_306680 - LOCATION
    )
    :vars
    (
      ?auto_306687 - LOCATION
      ?auto_306689 - CITY
      ?auto_306686 - OBJ
      ?auto_306688 - TRUCK
      ?auto_306690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_306687 ?auto_306689 ) ( IN-CITY ?auto_306680 ?auto_306689 ) ( not ( = ?auto_306680 ?auto_306687 ) ) ( OBJ-AT ?auto_306686 ?auto_306680 ) ( not ( = ?auto_306686 ?auto_306682 ) ) ( OBJ-AT ?auto_306682 ?auto_306687 ) ( TRUCK-AT ?auto_306688 ?auto_306690 ) ( IN-CITY ?auto_306690 ?auto_306689 ) ( not ( = ?auto_306680 ?auto_306690 ) ) ( not ( = ?auto_306687 ?auto_306690 ) ) ( OBJ-AT ?auto_306681 ?auto_306680 ) ( OBJ-AT ?auto_306683 ?auto_306680 ) ( OBJ-AT ?auto_306684 ?auto_306680 ) ( OBJ-AT ?auto_306685 ?auto_306680 ) ( not ( = ?auto_306681 ?auto_306682 ) ) ( not ( = ?auto_306681 ?auto_306683 ) ) ( not ( = ?auto_306681 ?auto_306684 ) ) ( not ( = ?auto_306681 ?auto_306685 ) ) ( not ( = ?auto_306681 ?auto_306686 ) ) ( not ( = ?auto_306682 ?auto_306683 ) ) ( not ( = ?auto_306682 ?auto_306684 ) ) ( not ( = ?auto_306682 ?auto_306685 ) ) ( not ( = ?auto_306683 ?auto_306684 ) ) ( not ( = ?auto_306683 ?auto_306685 ) ) ( not ( = ?auto_306683 ?auto_306686 ) ) ( not ( = ?auto_306684 ?auto_306685 ) ) ( not ( = ?auto_306684 ?auto_306686 ) ) ( not ( = ?auto_306685 ?auto_306686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_306686 ?auto_306682 ?auto_306680 )
      ( DELIVER-5PKG-VERIFY ?auto_306681 ?auto_306682 ?auto_306683 ?auto_306684 ?auto_306685 ?auto_306680 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309113 - OBJ
      ?auto_309114 - OBJ
      ?auto_309115 - OBJ
      ?auto_309116 - OBJ
      ?auto_309117 - OBJ
      ?auto_309112 - LOCATION
    )
    :vars
    (
      ?auto_309118 - LOCATION
      ?auto_309120 - CITY
      ?auto_309119 - TRUCK
      ?auto_309121 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309118 ?auto_309120 ) ( IN-CITY ?auto_309112 ?auto_309120 ) ( not ( = ?auto_309112 ?auto_309118 ) ) ( OBJ-AT ?auto_309114 ?auto_309112 ) ( not ( = ?auto_309114 ?auto_309113 ) ) ( OBJ-AT ?auto_309113 ?auto_309118 ) ( TRUCK-AT ?auto_309119 ?auto_309121 ) ( IN-CITY ?auto_309121 ?auto_309120 ) ( not ( = ?auto_309112 ?auto_309121 ) ) ( not ( = ?auto_309118 ?auto_309121 ) ) ( OBJ-AT ?auto_309115 ?auto_309112 ) ( OBJ-AT ?auto_309116 ?auto_309112 ) ( OBJ-AT ?auto_309117 ?auto_309112 ) ( not ( = ?auto_309113 ?auto_309115 ) ) ( not ( = ?auto_309113 ?auto_309116 ) ) ( not ( = ?auto_309113 ?auto_309117 ) ) ( not ( = ?auto_309114 ?auto_309115 ) ) ( not ( = ?auto_309114 ?auto_309116 ) ) ( not ( = ?auto_309114 ?auto_309117 ) ) ( not ( = ?auto_309115 ?auto_309116 ) ) ( not ( = ?auto_309115 ?auto_309117 ) ) ( not ( = ?auto_309116 ?auto_309117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309114 ?auto_309113 ?auto_309112 )
      ( DELIVER-5PKG-VERIFY ?auto_309113 ?auto_309114 ?auto_309115 ?auto_309116 ?auto_309117 ?auto_309112 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309123 - OBJ
      ?auto_309124 - OBJ
      ?auto_309125 - OBJ
      ?auto_309126 - OBJ
      ?auto_309127 - OBJ
      ?auto_309122 - LOCATION
    )
    :vars
    (
      ?auto_309128 - LOCATION
      ?auto_309130 - CITY
      ?auto_309129 - TRUCK
      ?auto_309131 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309128 ?auto_309130 ) ( IN-CITY ?auto_309122 ?auto_309130 ) ( not ( = ?auto_309122 ?auto_309128 ) ) ( OBJ-AT ?auto_309126 ?auto_309122 ) ( not ( = ?auto_309126 ?auto_309123 ) ) ( OBJ-AT ?auto_309123 ?auto_309128 ) ( TRUCK-AT ?auto_309129 ?auto_309131 ) ( IN-CITY ?auto_309131 ?auto_309130 ) ( not ( = ?auto_309122 ?auto_309131 ) ) ( not ( = ?auto_309128 ?auto_309131 ) ) ( OBJ-AT ?auto_309124 ?auto_309122 ) ( OBJ-AT ?auto_309125 ?auto_309122 ) ( OBJ-AT ?auto_309127 ?auto_309122 ) ( not ( = ?auto_309123 ?auto_309124 ) ) ( not ( = ?auto_309123 ?auto_309125 ) ) ( not ( = ?auto_309123 ?auto_309127 ) ) ( not ( = ?auto_309124 ?auto_309125 ) ) ( not ( = ?auto_309124 ?auto_309126 ) ) ( not ( = ?auto_309124 ?auto_309127 ) ) ( not ( = ?auto_309125 ?auto_309126 ) ) ( not ( = ?auto_309125 ?auto_309127 ) ) ( not ( = ?auto_309126 ?auto_309127 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309126 ?auto_309123 ?auto_309122 )
      ( DELIVER-5PKG-VERIFY ?auto_309123 ?auto_309124 ?auto_309125 ?auto_309126 ?auto_309127 ?auto_309122 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309153 - OBJ
      ?auto_309154 - OBJ
      ?auto_309155 - OBJ
      ?auto_309156 - OBJ
      ?auto_309157 - OBJ
      ?auto_309152 - LOCATION
    )
    :vars
    (
      ?auto_309158 - LOCATION
      ?auto_309160 - CITY
      ?auto_309159 - TRUCK
      ?auto_309161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309158 ?auto_309160 ) ( IN-CITY ?auto_309152 ?auto_309160 ) ( not ( = ?auto_309152 ?auto_309158 ) ) ( OBJ-AT ?auto_309157 ?auto_309152 ) ( not ( = ?auto_309157 ?auto_309153 ) ) ( OBJ-AT ?auto_309153 ?auto_309158 ) ( TRUCK-AT ?auto_309159 ?auto_309161 ) ( IN-CITY ?auto_309161 ?auto_309160 ) ( not ( = ?auto_309152 ?auto_309161 ) ) ( not ( = ?auto_309158 ?auto_309161 ) ) ( OBJ-AT ?auto_309154 ?auto_309152 ) ( OBJ-AT ?auto_309155 ?auto_309152 ) ( OBJ-AT ?auto_309156 ?auto_309152 ) ( not ( = ?auto_309153 ?auto_309154 ) ) ( not ( = ?auto_309153 ?auto_309155 ) ) ( not ( = ?auto_309153 ?auto_309156 ) ) ( not ( = ?auto_309154 ?auto_309155 ) ) ( not ( = ?auto_309154 ?auto_309156 ) ) ( not ( = ?auto_309154 ?auto_309157 ) ) ( not ( = ?auto_309155 ?auto_309156 ) ) ( not ( = ?auto_309155 ?auto_309157 ) ) ( not ( = ?auto_309156 ?auto_309157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309157 ?auto_309153 ?auto_309152 )
      ( DELIVER-5PKG-VERIFY ?auto_309153 ?auto_309154 ?auto_309155 ?auto_309156 ?auto_309157 ?auto_309152 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_309803 - OBJ
      ?auto_309804 - OBJ
      ?auto_309805 - OBJ
      ?auto_309806 - OBJ
      ?auto_309807 - OBJ
      ?auto_309802 - LOCATION
    )
    :vars
    (
      ?auto_309809 - LOCATION
      ?auto_309811 - CITY
      ?auto_309808 - OBJ
      ?auto_309810 - TRUCK
      ?auto_309812 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_309809 ?auto_309811 ) ( IN-CITY ?auto_309802 ?auto_309811 ) ( not ( = ?auto_309802 ?auto_309809 ) ) ( OBJ-AT ?auto_309808 ?auto_309802 ) ( not ( = ?auto_309808 ?auto_309803 ) ) ( OBJ-AT ?auto_309803 ?auto_309809 ) ( TRUCK-AT ?auto_309810 ?auto_309812 ) ( IN-CITY ?auto_309812 ?auto_309811 ) ( not ( = ?auto_309802 ?auto_309812 ) ) ( not ( = ?auto_309809 ?auto_309812 ) ) ( OBJ-AT ?auto_309804 ?auto_309802 ) ( OBJ-AT ?auto_309805 ?auto_309802 ) ( OBJ-AT ?auto_309806 ?auto_309802 ) ( OBJ-AT ?auto_309807 ?auto_309802 ) ( not ( = ?auto_309803 ?auto_309804 ) ) ( not ( = ?auto_309803 ?auto_309805 ) ) ( not ( = ?auto_309803 ?auto_309806 ) ) ( not ( = ?auto_309803 ?auto_309807 ) ) ( not ( = ?auto_309804 ?auto_309805 ) ) ( not ( = ?auto_309804 ?auto_309806 ) ) ( not ( = ?auto_309804 ?auto_309807 ) ) ( not ( = ?auto_309804 ?auto_309808 ) ) ( not ( = ?auto_309805 ?auto_309806 ) ) ( not ( = ?auto_309805 ?auto_309807 ) ) ( not ( = ?auto_309805 ?auto_309808 ) ) ( not ( = ?auto_309806 ?auto_309807 ) ) ( not ( = ?auto_309806 ?auto_309808 ) ) ( not ( = ?auto_309807 ?auto_309808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_309808 ?auto_309803 ?auto_309802 )
      ( DELIVER-5PKG-VERIFY ?auto_309803 ?auto_309804 ?auto_309805 ?auto_309806 ?auto_309807 ?auto_309802 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_311652 - OBJ
      ?auto_311653 - OBJ
      ?auto_311654 - OBJ
      ?auto_311651 - LOCATION
    )
    :vars
    (
      ?auto_311656 - LOCATION
      ?auto_311655 - CITY
      ?auto_311658 - TRUCK
      ?auto_311657 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_311656 ?auto_311655 ) ( IN-CITY ?auto_311651 ?auto_311655 ) ( not ( = ?auto_311651 ?auto_311656 ) ) ( OBJ-AT ?auto_311652 ?auto_311651 ) ( not ( = ?auto_311652 ?auto_311653 ) ) ( OBJ-AT ?auto_311653 ?auto_311656 ) ( TRUCK-AT ?auto_311658 ?auto_311657 ) ( IN-CITY ?auto_311657 ?auto_311655 ) ( not ( = ?auto_311651 ?auto_311657 ) ) ( not ( = ?auto_311656 ?auto_311657 ) ) ( OBJ-AT ?auto_311654 ?auto_311651 ) ( not ( = ?auto_311652 ?auto_311654 ) ) ( not ( = ?auto_311653 ?auto_311654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_311652 ?auto_311653 ?auto_311651 )
      ( DELIVER-3PKG-VERIFY ?auto_311652 ?auto_311653 ?auto_311654 ?auto_311651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_438253 - OBJ
      ?auto_438254 - OBJ
      ?auto_438255 - OBJ
      ?auto_438252 - LOCATION
    )
    :vars
    (
      ?auto_438256 - TRUCK
      ?auto_438258 - LOCATION
      ?auto_438257 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_438255 ?auto_438256 ) ( TRUCK-AT ?auto_438256 ?auto_438258 ) ( IN-CITY ?auto_438258 ?auto_438257 ) ( IN-CITY ?auto_438252 ?auto_438257 ) ( not ( = ?auto_438252 ?auto_438258 ) ) ( OBJ-AT ?auto_438253 ?auto_438252 ) ( not ( = ?auto_438253 ?auto_438255 ) ) ( OBJ-AT ?auto_438254 ?auto_438252 ) ( not ( = ?auto_438253 ?auto_438254 ) ) ( not ( = ?auto_438254 ?auto_438255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_438253 ?auto_438255 ?auto_438252 )
      ( DELIVER-3PKG-VERIFY ?auto_438253 ?auto_438254 ?auto_438255 ?auto_438252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_438272 - OBJ
      ?auto_438273 - OBJ
      ?auto_438274 - OBJ
      ?auto_438271 - LOCATION
    )
    :vars
    (
      ?auto_438275 - TRUCK
      ?auto_438277 - LOCATION
      ?auto_438276 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_438273 ?auto_438275 ) ( TRUCK-AT ?auto_438275 ?auto_438277 ) ( IN-CITY ?auto_438277 ?auto_438276 ) ( IN-CITY ?auto_438271 ?auto_438276 ) ( not ( = ?auto_438271 ?auto_438277 ) ) ( OBJ-AT ?auto_438274 ?auto_438271 ) ( not ( = ?auto_438274 ?auto_438273 ) ) ( OBJ-AT ?auto_438272 ?auto_438271 ) ( not ( = ?auto_438272 ?auto_438273 ) ) ( not ( = ?auto_438272 ?auto_438274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_438274 ?auto_438273 ?auto_438271 )
      ( DELIVER-3PKG-VERIFY ?auto_438272 ?auto_438273 ?auto_438274 ?auto_438271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_529041 - OBJ
      ?auto_529042 - OBJ
      ?auto_529043 - OBJ
      ?auto_529040 - LOCATION
    )
    :vars
    (
      ?auto_529046 - TRUCK
      ?auto_529045 - LOCATION
      ?auto_529044 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_529046 ?auto_529045 ) ( IN-CITY ?auto_529045 ?auto_529044 ) ( IN-CITY ?auto_529040 ?auto_529044 ) ( not ( = ?auto_529040 ?auto_529045 ) ) ( OBJ-AT ?auto_529043 ?auto_529040 ) ( not ( = ?auto_529043 ?auto_529042 ) ) ( OBJ-AT ?auto_529042 ?auto_529045 ) ( OBJ-AT ?auto_529041 ?auto_529040 ) ( not ( = ?auto_529041 ?auto_529042 ) ) ( not ( = ?auto_529041 ?auto_529043 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_529043 ?auto_529042 ?auto_529040 )
      ( DELIVER-3PKG-VERIFY ?auto_529041 ?auto_529042 ?auto_529043 ?auto_529040 ) )
  )

)

