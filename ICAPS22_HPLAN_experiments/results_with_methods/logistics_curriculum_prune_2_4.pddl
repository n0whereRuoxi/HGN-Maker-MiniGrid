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
      ?auto_165 - OBJ
      ?auto_164 - LOCATION
    )
    :vars
    (
      ?auto_167 - LOCATION
      ?auto_168 - CITY
      ?auto_166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167 ?auto_168 ) ( IN-CITY ?auto_164 ?auto_168 ) ( not ( = ?auto_164 ?auto_167 ) ) ( OBJ-AT ?auto_165 ?auto_167 ) ( TRUCK-AT ?auto_166 ?auto_164 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_166 ?auto_164 ?auto_167 ?auto_168 )
      ( !LOAD-TRUCK ?auto_165 ?auto_166 ?auto_167 )
      ( !DRIVE-TRUCK ?auto_166 ?auto_167 ?auto_164 ?auto_168 )
      ( !UNLOAD-TRUCK ?auto_165 ?auto_166 ?auto_164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_186 - OBJ
      ?auto_187 - OBJ
      ?auto_185 - LOCATION
    )
    :vars
    (
      ?auto_190 - LOCATION
      ?auto_189 - CITY
      ?auto_191 - LOCATION
      ?auto_188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190 ?auto_189 ) ( IN-CITY ?auto_185 ?auto_189 ) ( not ( = ?auto_185 ?auto_190 ) ) ( OBJ-AT ?auto_187 ?auto_190 ) ( IN-CITY ?auto_191 ?auto_189 ) ( not ( = ?auto_185 ?auto_191 ) ) ( OBJ-AT ?auto_186 ?auto_191 ) ( TRUCK-AT ?auto_188 ?auto_185 ) ( not ( = ?auto_186 ?auto_187 ) ) ( not ( = ?auto_190 ?auto_191 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_186 ?auto_185 )
      ( DELIVER-1PKG ?auto_187 ?auto_185 ) )
  )

)

