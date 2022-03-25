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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_138 - OBJ
      ?auto_137 - LOCATION
    )
    :vars
    (
      ?auto_140 - LOCATION
      ?auto_141 - CITY
      ?auto_139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140 ?auto_141 ) ( IN-CITY ?auto_137 ?auto_141 ) ( not ( = ?auto_137 ?auto_140 ) ) ( OBJ-AT ?auto_138 ?auto_140 ) ( TRUCK-AT ?auto_139 ?auto_137 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_139 ?auto_137 ?auto_140 ?auto_141 )
      ( !LOAD-TRUCK ?auto_138 ?auto_139 ?auto_140 )
      ( !DRIVE-TRUCK ?auto_139 ?auto_140 ?auto_137 ?auto_141 )
      ( !UNLOAD-TRUCK ?auto_138 ?auto_139 ?auto_137 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_145 - OBJ
      ?auto_144 - LOCATION
    )
    :vars
    (
      ?auto_147 - LOCATION
      ?auto_148 - CITY
      ?auto_146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147 ?auto_148 ) ( IN-CITY ?auto_144 ?auto_148 ) ( not ( = ?auto_144 ?auto_147 ) ) ( OBJ-AT ?auto_145 ?auto_147 ) ( TRUCK-AT ?auto_146 ?auto_144 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_146 ?auto_144 ?auto_147 ?auto_148 )
      ( !LOAD-TRUCK ?auto_145 ?auto_146 ?auto_147 )
      ( !DRIVE-TRUCK ?auto_146 ?auto_147 ?auto_144 ?auto_148 )
      ( !UNLOAD-TRUCK ?auto_145 ?auto_146 ?auto_144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_159 - OBJ
      ?auto_160 - OBJ
      ?auto_158 - LOCATION
    )
    :vars
    (
      ?auto_161 - LOCATION
      ?auto_163 - CITY
      ?auto_162 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161 ?auto_163 ) ( IN-CITY ?auto_158 ?auto_163 ) ( not ( = ?auto_158 ?auto_161 ) ) ( OBJ-AT ?auto_160 ?auto_161 ) ( OBJ-AT ?auto_159 ?auto_161 ) ( TRUCK-AT ?auto_162 ?auto_158 ) ( not ( = ?auto_159 ?auto_160 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_159 ?auto_158 )
      ( DELIVER-1PKG ?auto_160 ?auto_158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_165 - OBJ
      ?auto_166 - OBJ
      ?auto_164 - LOCATION
    )
    :vars
    (
      ?auto_167 - LOCATION
      ?auto_168 - CITY
      ?auto_169 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167 ?auto_168 ) ( IN-CITY ?auto_164 ?auto_168 ) ( not ( = ?auto_164 ?auto_167 ) ) ( OBJ-AT ?auto_165 ?auto_167 ) ( OBJ-AT ?auto_166 ?auto_167 ) ( TRUCK-AT ?auto_169 ?auto_164 ) ( not ( = ?auto_166 ?auto_165 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_166 ?auto_165 ?auto_164 ) )
  )

)

