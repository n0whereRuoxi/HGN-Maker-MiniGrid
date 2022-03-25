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
      ?auto_762 - OBJ
      ?auto_761 - LOCATION
    )
    :vars
    (
      ?auto_764 - LOCATION
      ?auto_765 - CITY
      ?auto_763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_764 ?auto_765 ) ( IN-CITY ?auto_761 ?auto_765 ) ( not ( = ?auto_761 ?auto_764 ) ) ( OBJ-AT ?auto_762 ?auto_764 ) ( TRUCK-AT ?auto_763 ?auto_761 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_763 ?auto_761 ?auto_764 ?auto_765 )
      ( !LOAD-TRUCK ?auto_762 ?auto_763 ?auto_764 )
      ( !DRIVE-TRUCK ?auto_763 ?auto_764 ?auto_761 ?auto_765 )
      ( !UNLOAD-TRUCK ?auto_762 ?auto_763 ?auto_761 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_783 - OBJ
      ?auto_784 - OBJ
      ?auto_782 - LOCATION
    )
    :vars
    (
      ?auto_786 - LOCATION
      ?auto_785 - CITY
      ?auto_788 - LOCATION
      ?auto_787 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_786 ?auto_785 ) ( IN-CITY ?auto_782 ?auto_785 ) ( not ( = ?auto_782 ?auto_786 ) ) ( OBJ-AT ?auto_784 ?auto_786 ) ( IN-CITY ?auto_788 ?auto_785 ) ( not ( = ?auto_782 ?auto_788 ) ) ( OBJ-AT ?auto_783 ?auto_788 ) ( TRUCK-AT ?auto_787 ?auto_782 ) ( not ( = ?auto_783 ?auto_784 ) ) ( not ( = ?auto_786 ?auto_788 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_783 ?auto_782 )
      ( DELIVER-1PKG ?auto_784 ?auto_782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_893 - OBJ
      ?auto_894 - OBJ
      ?auto_895 - OBJ
      ?auto_892 - LOCATION
    )
    :vars
    (
      ?auto_896 - LOCATION
      ?auto_898 - CITY
      ?auto_899 - LOCATION
      ?auto_897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_896 ?auto_898 ) ( IN-CITY ?auto_892 ?auto_898 ) ( not ( = ?auto_892 ?auto_896 ) ) ( OBJ-AT ?auto_895 ?auto_896 ) ( OBJ-AT ?auto_894 ?auto_896 ) ( IN-CITY ?auto_899 ?auto_898 ) ( not ( = ?auto_892 ?auto_899 ) ) ( OBJ-AT ?auto_893 ?auto_899 ) ( TRUCK-AT ?auto_897 ?auto_892 ) ( not ( = ?auto_893 ?auto_894 ) ) ( not ( = ?auto_896 ?auto_899 ) ) ( not ( = ?auto_893 ?auto_895 ) ) ( not ( = ?auto_894 ?auto_895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893 ?auto_894 ?auto_892 )
      ( DELIVER-1PKG ?auto_895 ?auto_892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_923 - OBJ
      ?auto_924 - OBJ
      ?auto_925 - OBJ
      ?auto_922 - LOCATION
    )
    :vars
    (
      ?auto_929 - LOCATION
      ?auto_926 - CITY
      ?auto_928 - LOCATION
      ?auto_927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_929 ?auto_926 ) ( IN-CITY ?auto_922 ?auto_926 ) ( not ( = ?auto_922 ?auto_929 ) ) ( OBJ-AT ?auto_925 ?auto_929 ) ( OBJ-AT ?auto_923 ?auto_929 ) ( IN-CITY ?auto_928 ?auto_926 ) ( not ( = ?auto_922 ?auto_928 ) ) ( OBJ-AT ?auto_924 ?auto_928 ) ( TRUCK-AT ?auto_927 ?auto_922 ) ( not ( = ?auto_924 ?auto_923 ) ) ( not ( = ?auto_929 ?auto_928 ) ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_923 ?auto_925 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_924 ?auto_923 ?auto_925 ?auto_922 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_940 - OBJ
      ?auto_941 - OBJ
      ?auto_942 - OBJ
      ?auto_939 - LOCATION
    )
    :vars
    (
      ?auto_944 - LOCATION
      ?auto_946 - CITY
      ?auto_945 - LOCATION
      ?auto_943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_944 ?auto_946 ) ( IN-CITY ?auto_939 ?auto_946 ) ( not ( = ?auto_939 ?auto_944 ) ) ( OBJ-AT ?auto_941 ?auto_944 ) ( OBJ-AT ?auto_940 ?auto_944 ) ( IN-CITY ?auto_945 ?auto_946 ) ( not ( = ?auto_939 ?auto_945 ) ) ( OBJ-AT ?auto_942 ?auto_945 ) ( TRUCK-AT ?auto_943 ?auto_939 ) ( not ( = ?auto_942 ?auto_940 ) ) ( not ( = ?auto_944 ?auto_945 ) ) ( not ( = ?auto_942 ?auto_941 ) ) ( not ( = ?auto_940 ?auto_941 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_940 ?auto_942 ?auto_941 ?auto_939 ) )
  )

)

