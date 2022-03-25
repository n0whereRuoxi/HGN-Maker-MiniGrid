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
      ?auto_13908 - OBJ
      ?auto_13907 - LOCATION
    )
    :vars
    (
      ?auto_13910 - LOCATION
      ?auto_13911 - CITY
      ?auto_13909 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13910 ?auto_13911 ) ( IN-CITY ?auto_13907 ?auto_13911 ) ( not ( = ?auto_13907 ?auto_13910 ) ) ( OBJ-AT ?auto_13908 ?auto_13910 ) ( TRUCK-AT ?auto_13909 ?auto_13907 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13909 ?auto_13907 ?auto_13910 ?auto_13911 )
      ( !LOAD-TRUCK ?auto_13908 ?auto_13909 ?auto_13910 )
      ( !DRIVE-TRUCK ?auto_13909 ?auto_13910 ?auto_13907 ?auto_13911 )
      ( !UNLOAD-TRUCK ?auto_13908 ?auto_13909 ?auto_13907 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13929 - OBJ
      ?auto_13930 - OBJ
      ?auto_13928 - LOCATION
    )
    :vars
    (
      ?auto_13931 - LOCATION
      ?auto_13932 - CITY
      ?auto_13934 - LOCATION
      ?auto_13933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13931 ?auto_13932 ) ( IN-CITY ?auto_13928 ?auto_13932 ) ( not ( = ?auto_13928 ?auto_13931 ) ) ( OBJ-AT ?auto_13930 ?auto_13931 ) ( IN-CITY ?auto_13934 ?auto_13932 ) ( not ( = ?auto_13928 ?auto_13934 ) ) ( OBJ-AT ?auto_13929 ?auto_13934 ) ( TRUCK-AT ?auto_13933 ?auto_13928 ) ( not ( = ?auto_13929 ?auto_13930 ) ) ( not ( = ?auto_13931 ?auto_13934 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13929 ?auto_13928 )
      ( DELIVER-1PKG ?auto_13930 ?auto_13928 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14040 - OBJ
      ?auto_14041 - OBJ
      ?auto_14042 - OBJ
      ?auto_14039 - LOCATION
    )
    :vars
    (
      ?auto_14044 - LOCATION
      ?auto_14043 - CITY
      ?auto_14047 - LOCATION
      ?auto_14046 - LOCATION
      ?auto_14045 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14044 ?auto_14043 ) ( IN-CITY ?auto_14039 ?auto_14043 ) ( not ( = ?auto_14039 ?auto_14044 ) ) ( OBJ-AT ?auto_14042 ?auto_14044 ) ( IN-CITY ?auto_14047 ?auto_14043 ) ( not ( = ?auto_14039 ?auto_14047 ) ) ( OBJ-AT ?auto_14041 ?auto_14047 ) ( IN-CITY ?auto_14046 ?auto_14043 ) ( not ( = ?auto_14039 ?auto_14046 ) ) ( OBJ-AT ?auto_14040 ?auto_14046 ) ( TRUCK-AT ?auto_14045 ?auto_14039 ) ( not ( = ?auto_14040 ?auto_14041 ) ) ( not ( = ?auto_14047 ?auto_14046 ) ) ( not ( = ?auto_14040 ?auto_14042 ) ) ( not ( = ?auto_14041 ?auto_14042 ) ) ( not ( = ?auto_14044 ?auto_14047 ) ) ( not ( = ?auto_14044 ?auto_14046 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14040 ?auto_14041 ?auto_14039 )
      ( DELIVER-1PKG ?auto_14042 ?auto_14039 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15183 - OBJ
      ?auto_15184 - OBJ
      ?auto_15185 - OBJ
      ?auto_15186 - OBJ
      ?auto_15182 - LOCATION
    )
    :vars
    (
      ?auto_15189 - LOCATION
      ?auto_15187 - CITY
      ?auto_15191 - LOCATION
      ?auto_15192 - LOCATION
      ?auto_15190 - LOCATION
      ?auto_15188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15189 ?auto_15187 ) ( IN-CITY ?auto_15182 ?auto_15187 ) ( not ( = ?auto_15182 ?auto_15189 ) ) ( OBJ-AT ?auto_15186 ?auto_15189 ) ( IN-CITY ?auto_15191 ?auto_15187 ) ( not ( = ?auto_15182 ?auto_15191 ) ) ( OBJ-AT ?auto_15185 ?auto_15191 ) ( IN-CITY ?auto_15192 ?auto_15187 ) ( not ( = ?auto_15182 ?auto_15192 ) ) ( OBJ-AT ?auto_15184 ?auto_15192 ) ( IN-CITY ?auto_15190 ?auto_15187 ) ( not ( = ?auto_15182 ?auto_15190 ) ) ( OBJ-AT ?auto_15183 ?auto_15190 ) ( TRUCK-AT ?auto_15188 ?auto_15182 ) ( not ( = ?auto_15183 ?auto_15184 ) ) ( not ( = ?auto_15192 ?auto_15190 ) ) ( not ( = ?auto_15183 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15185 ) ) ( not ( = ?auto_15191 ?auto_15192 ) ) ( not ( = ?auto_15191 ?auto_15190 ) ) ( not ( = ?auto_15183 ?auto_15186 ) ) ( not ( = ?auto_15184 ?auto_15186 ) ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( not ( = ?auto_15189 ?auto_15191 ) ) ( not ( = ?auto_15189 ?auto_15192 ) ) ( not ( = ?auto_15189 ?auto_15190 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_15183 ?auto_15184 ?auto_15185 ?auto_15182 )
      ( DELIVER-1PKG ?auto_15186 ?auto_15182 ) )
  )

)

