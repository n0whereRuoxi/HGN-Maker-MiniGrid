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
      ?auto_135 - OBJ
      ?auto_134 - LOCATION
    )
    :vars
    (
      ?auto_137 - LOCATION
      ?auto_138 - CITY
      ?auto_136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137 ?auto_138 ) ( IN-CITY ?auto_134 ?auto_138 ) ( not ( = ?auto_134 ?auto_137 ) ) ( OBJ-AT ?auto_135 ?auto_137 ) ( TRUCK-AT ?auto_136 ?auto_134 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136 ?auto_134 ?auto_137 ?auto_138 )
      ( !LOAD-TRUCK ?auto_135 ?auto_136 ?auto_137 )
      ( !DRIVE-TRUCK ?auto_136 ?auto_137 ?auto_134 ?auto_138 )
      ( !UNLOAD-TRUCK ?auto_135 ?auto_136 ?auto_134 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_142 - OBJ
      ?auto_141 - LOCATION
    )
    :vars
    (
      ?auto_144 - LOCATION
      ?auto_145 - CITY
      ?auto_143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144 ?auto_145 ) ( IN-CITY ?auto_141 ?auto_145 ) ( not ( = ?auto_141 ?auto_144 ) ) ( OBJ-AT ?auto_142 ?auto_144 ) ( TRUCK-AT ?auto_143 ?auto_141 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_143 ?auto_141 ?auto_144 ?auto_145 )
      ( !LOAD-TRUCK ?auto_142 ?auto_143 ?auto_144 )
      ( !DRIVE-TRUCK ?auto_143 ?auto_144 ?auto_141 ?auto_145 )
      ( !UNLOAD-TRUCK ?auto_142 ?auto_143 ?auto_141 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_156 - OBJ
      ?auto_157 - OBJ
      ?auto_155 - LOCATION
    )
    :vars
    (
      ?auto_159 - LOCATION
      ?auto_160 - CITY
      ?auto_161 - LOCATION
      ?auto_158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_159 ?auto_160 ) ( IN-CITY ?auto_155 ?auto_160 ) ( not ( = ?auto_155 ?auto_159 ) ) ( OBJ-AT ?auto_157 ?auto_159 ) ( IN-CITY ?auto_161 ?auto_160 ) ( not ( = ?auto_155 ?auto_161 ) ) ( OBJ-AT ?auto_156 ?auto_161 ) ( TRUCK-AT ?auto_158 ?auto_155 ) ( not ( = ?auto_156 ?auto_157 ) ) ( not ( = ?auto_159 ?auto_161 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_156 ?auto_155 )
      ( DELIVER-1PKG ?auto_157 ?auto_155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_163 - OBJ
      ?auto_164 - OBJ
      ?auto_162 - LOCATION
    )
    :vars
    (
      ?auto_167 - LOCATION
      ?auto_166 - CITY
      ?auto_168 - LOCATION
      ?auto_165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167 ?auto_166 ) ( IN-CITY ?auto_162 ?auto_166 ) ( not ( = ?auto_162 ?auto_167 ) ) ( OBJ-AT ?auto_163 ?auto_167 ) ( IN-CITY ?auto_168 ?auto_166 ) ( not ( = ?auto_162 ?auto_168 ) ) ( OBJ-AT ?auto_164 ?auto_168 ) ( TRUCK-AT ?auto_165 ?auto_162 ) ( not ( = ?auto_164 ?auto_163 ) ) ( not ( = ?auto_167 ?auto_168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_164 ?auto_163 ?auto_162 ) )
  )

)

