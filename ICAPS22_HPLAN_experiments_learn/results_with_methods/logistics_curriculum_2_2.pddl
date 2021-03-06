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
      ?auto_93 - OBJ
      ?auto_92 - LOCATION
    )
    :vars
    (
      ?auto_95 - LOCATION
      ?auto_96 - CITY
      ?auto_94 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95 ?auto_96 ) ( IN-CITY ?auto_92 ?auto_96 ) ( not ( = ?auto_92 ?auto_95 ) ) ( OBJ-AT ?auto_93 ?auto_95 ) ( TRUCK-AT ?auto_94 ?auto_92 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_94 ?auto_92 ?auto_95 ?auto_96 )
      ( !LOAD-TRUCK ?auto_93 ?auto_94 ?auto_95 )
      ( !DRIVE-TRUCK ?auto_94 ?auto_95 ?auto_92 ?auto_96 )
      ( !UNLOAD-TRUCK ?auto_93 ?auto_94 ?auto_92 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_100 - OBJ
      ?auto_99 - LOCATION
    )
    :vars
    (
      ?auto_102 - LOCATION
      ?auto_103 - CITY
      ?auto_101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102 ?auto_103 ) ( IN-CITY ?auto_99 ?auto_103 ) ( not ( = ?auto_99 ?auto_102 ) ) ( OBJ-AT ?auto_100 ?auto_102 ) ( TRUCK-AT ?auto_101 ?auto_99 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_101 ?auto_99 ?auto_102 ?auto_103 )
      ( !LOAD-TRUCK ?auto_100 ?auto_101 ?auto_102 )
      ( !DRIVE-TRUCK ?auto_101 ?auto_102 ?auto_99 ?auto_103 )
      ( !UNLOAD-TRUCK ?auto_100 ?auto_101 ?auto_99 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_114 - OBJ
      ?auto_115 - OBJ
      ?auto_113 - LOCATION
    )
    :vars
    (
      ?auto_118 - LOCATION
      ?auto_117 - CITY
      ?auto_116 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118 ?auto_117 ) ( IN-CITY ?auto_113 ?auto_117 ) ( not ( = ?auto_113 ?auto_118 ) ) ( OBJ-AT ?auto_115 ?auto_118 ) ( OBJ-AT ?auto_114 ?auto_118 ) ( TRUCK-AT ?auto_116 ?auto_113 ) ( not ( = ?auto_114 ?auto_115 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_114 ?auto_113 )
      ( DELIVER-1PKG ?auto_115 ?auto_113 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_120 - OBJ
      ?auto_121 - OBJ
      ?auto_119 - LOCATION
    )
    :vars
    (
      ?auto_123 - LOCATION
      ?auto_124 - CITY
      ?auto_122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123 ?auto_124 ) ( IN-CITY ?auto_119 ?auto_124 ) ( not ( = ?auto_119 ?auto_123 ) ) ( OBJ-AT ?auto_120 ?auto_123 ) ( OBJ-AT ?auto_121 ?auto_123 ) ( TRUCK-AT ?auto_122 ?auto_119 ) ( not ( = ?auto_121 ?auto_120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_121 ?auto_120 ?auto_119 ) )
  )

)

