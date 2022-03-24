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
      ?auto_180 - OBJ
      ?auto_179 - LOCATION
    )
    :vars
    (
      ?auto_182 - LOCATION
      ?auto_183 - CITY
      ?auto_181 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_182 ?auto_183 ) ( IN-CITY ?auto_179 ?auto_183 ) ( not ( = ?auto_179 ?auto_182 ) ) ( OBJ-AT ?auto_180 ?auto_182 ) ( TRUCK-AT ?auto_181 ?auto_179 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_181 ?auto_179 ?auto_182 ?auto_183 )
      ( !LOAD-TRUCK ?auto_180 ?auto_181 ?auto_182 )
      ( !DRIVE-TRUCK ?auto_181 ?auto_182 ?auto_179 ?auto_183 )
      ( !UNLOAD-TRUCK ?auto_180 ?auto_181 ?auto_179 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_187 - OBJ
      ?auto_186 - LOCATION
    )
    :vars
    (
      ?auto_189 - LOCATION
      ?auto_190 - CITY
      ?auto_188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_189 ?auto_190 ) ( IN-CITY ?auto_186 ?auto_190 ) ( not ( = ?auto_186 ?auto_189 ) ) ( OBJ-AT ?auto_187 ?auto_189 ) ( TRUCK-AT ?auto_188 ?auto_186 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_188 ?auto_186 ?auto_189 ?auto_190 )
      ( !LOAD-TRUCK ?auto_187 ?auto_188 ?auto_189 )
      ( !DRIVE-TRUCK ?auto_188 ?auto_189 ?auto_186 ?auto_190 )
      ( !UNLOAD-TRUCK ?auto_187 ?auto_188 ?auto_186 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_201 - OBJ
      ?auto_202 - OBJ
      ?auto_200 - LOCATION
    )
    :vars
    (
      ?auto_203 - LOCATION
      ?auto_204 - CITY
      ?auto_206 - LOCATION
      ?auto_205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_203 ?auto_204 ) ( IN-CITY ?auto_200 ?auto_204 ) ( not ( = ?auto_200 ?auto_203 ) ) ( OBJ-AT ?auto_202 ?auto_203 ) ( IN-CITY ?auto_206 ?auto_204 ) ( not ( = ?auto_200 ?auto_206 ) ) ( OBJ-AT ?auto_201 ?auto_206 ) ( TRUCK-AT ?auto_205 ?auto_200 ) ( not ( = ?auto_201 ?auto_202 ) ) ( not ( = ?auto_203 ?auto_206 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_201 ?auto_200 )
      ( DELIVER-1PKG ?auto_202 ?auto_200 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_208 - OBJ
      ?auto_209 - OBJ
      ?auto_207 - LOCATION
    )
    :vars
    (
      ?auto_211 - LOCATION
      ?auto_212 - CITY
      ?auto_213 - LOCATION
      ?auto_210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211 ?auto_212 ) ( IN-CITY ?auto_207 ?auto_212 ) ( not ( = ?auto_207 ?auto_211 ) ) ( OBJ-AT ?auto_208 ?auto_211 ) ( IN-CITY ?auto_213 ?auto_212 ) ( not ( = ?auto_207 ?auto_213 ) ) ( OBJ-AT ?auto_209 ?auto_213 ) ( TRUCK-AT ?auto_210 ?auto_207 ) ( not ( = ?auto_209 ?auto_208 ) ) ( not ( = ?auto_211 ?auto_213 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_209 ?auto_208 ?auto_207 ) )
  )

)

