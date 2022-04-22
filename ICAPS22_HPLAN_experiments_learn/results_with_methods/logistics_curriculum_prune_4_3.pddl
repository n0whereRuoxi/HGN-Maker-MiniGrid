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
      ?auto_10760 - OBJ
      ?auto_10759 - LOCATION
    )
    :vars
    (
      ?auto_10762 - LOCATION
      ?auto_10763 - CITY
      ?auto_10761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10762 ?auto_10763 ) ( IN-CITY ?auto_10759 ?auto_10763 ) ( not ( = ?auto_10759 ?auto_10762 ) ) ( OBJ-AT ?auto_10760 ?auto_10762 ) ( TRUCK-AT ?auto_10761 ?auto_10759 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10761 ?auto_10759 ?auto_10762 ?auto_10763 )
      ( !LOAD-TRUCK ?auto_10760 ?auto_10761 ?auto_10762 )
      ( !DRIVE-TRUCK ?auto_10761 ?auto_10762 ?auto_10759 ?auto_10763 )
      ( !UNLOAD-TRUCK ?auto_10760 ?auto_10761 ?auto_10759 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10781 - OBJ
      ?auto_10782 - OBJ
      ?auto_10780 - LOCATION
    )
    :vars
    (
      ?auto_10783 - LOCATION
      ?auto_10785 - CITY
      ?auto_10786 - LOCATION
      ?auto_10784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10783 ?auto_10785 ) ( IN-CITY ?auto_10780 ?auto_10785 ) ( not ( = ?auto_10780 ?auto_10783 ) ) ( OBJ-AT ?auto_10782 ?auto_10783 ) ( IN-CITY ?auto_10786 ?auto_10785 ) ( not ( = ?auto_10780 ?auto_10786 ) ) ( OBJ-AT ?auto_10781 ?auto_10786 ) ( TRUCK-AT ?auto_10784 ?auto_10780 ) ( not ( = ?auto_10781 ?auto_10782 ) ) ( not ( = ?auto_10783 ?auto_10786 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10781 ?auto_10780 )
      ( DELIVER-1PKG ?auto_10782 ?auto_10780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10892 - OBJ
      ?auto_10893 - OBJ
      ?auto_10894 - OBJ
      ?auto_10891 - LOCATION
    )
    :vars
    (
      ?auto_10897 - LOCATION
      ?auto_10896 - CITY
      ?auto_10898 - LOCATION
      ?auto_10899 - LOCATION
      ?auto_10895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10897 ?auto_10896 ) ( IN-CITY ?auto_10891 ?auto_10896 ) ( not ( = ?auto_10891 ?auto_10897 ) ) ( OBJ-AT ?auto_10894 ?auto_10897 ) ( IN-CITY ?auto_10898 ?auto_10896 ) ( not ( = ?auto_10891 ?auto_10898 ) ) ( OBJ-AT ?auto_10893 ?auto_10898 ) ( IN-CITY ?auto_10899 ?auto_10896 ) ( not ( = ?auto_10891 ?auto_10899 ) ) ( OBJ-AT ?auto_10892 ?auto_10899 ) ( TRUCK-AT ?auto_10895 ?auto_10891 ) ( not ( = ?auto_10892 ?auto_10893 ) ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10892 ?auto_10894 ) ) ( not ( = ?auto_10893 ?auto_10894 ) ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10892 ?auto_10893 ?auto_10891 )
      ( DELIVER-1PKG ?auto_10894 ?auto_10891 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12035 - OBJ
      ?auto_12036 - OBJ
      ?auto_12037 - OBJ
      ?auto_12038 - OBJ
      ?auto_12034 - LOCATION
    )
    :vars
    (
      ?auto_12039 - LOCATION
      ?auto_12041 - CITY
      ?auto_12043 - LOCATION
      ?auto_12042 - LOCATION
      ?auto_12044 - LOCATION
      ?auto_12040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12039 ?auto_12041 ) ( IN-CITY ?auto_12034 ?auto_12041 ) ( not ( = ?auto_12034 ?auto_12039 ) ) ( OBJ-AT ?auto_12038 ?auto_12039 ) ( IN-CITY ?auto_12043 ?auto_12041 ) ( not ( = ?auto_12034 ?auto_12043 ) ) ( OBJ-AT ?auto_12037 ?auto_12043 ) ( IN-CITY ?auto_12042 ?auto_12041 ) ( not ( = ?auto_12034 ?auto_12042 ) ) ( OBJ-AT ?auto_12036 ?auto_12042 ) ( IN-CITY ?auto_12044 ?auto_12041 ) ( not ( = ?auto_12034 ?auto_12044 ) ) ( OBJ-AT ?auto_12035 ?auto_12044 ) ( TRUCK-AT ?auto_12040 ?auto_12034 ) ( not ( = ?auto_12035 ?auto_12036 ) ) ( not ( = ?auto_12042 ?auto_12044 ) ) ( not ( = ?auto_12035 ?auto_12037 ) ) ( not ( = ?auto_12036 ?auto_12037 ) ) ( not ( = ?auto_12043 ?auto_12042 ) ) ( not ( = ?auto_12043 ?auto_12044 ) ) ( not ( = ?auto_12035 ?auto_12038 ) ) ( not ( = ?auto_12036 ?auto_12038 ) ) ( not ( = ?auto_12037 ?auto_12038 ) ) ( not ( = ?auto_12039 ?auto_12043 ) ) ( not ( = ?auto_12039 ?auto_12042 ) ) ( not ( = ?auto_12039 ?auto_12044 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_12035 ?auto_12036 ?auto_12037 ?auto_12034 )
      ( DELIVER-1PKG ?auto_12038 ?auto_12034 ) )
  )

)

