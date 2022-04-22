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
      ?auto_7612 - OBJ
      ?auto_7611 - LOCATION
    )
    :vars
    (
      ?auto_7614 - LOCATION
      ?auto_7615 - CITY
      ?auto_7613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7614 ?auto_7615 ) ( IN-CITY ?auto_7611 ?auto_7615 ) ( not ( = ?auto_7611 ?auto_7614 ) ) ( OBJ-AT ?auto_7612 ?auto_7614 ) ( TRUCK-AT ?auto_7613 ?auto_7611 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7613 ?auto_7611 ?auto_7614 ?auto_7615 )
      ( !LOAD-TRUCK ?auto_7612 ?auto_7613 ?auto_7614 )
      ( !DRIVE-TRUCK ?auto_7613 ?auto_7614 ?auto_7611 ?auto_7615 )
      ( !UNLOAD-TRUCK ?auto_7612 ?auto_7613 ?auto_7611 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7633 - OBJ
      ?auto_7634 - OBJ
      ?auto_7632 - LOCATION
    )
    :vars
    (
      ?auto_7635 - LOCATION
      ?auto_7636 - CITY
      ?auto_7638 - LOCATION
      ?auto_7637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7635 ?auto_7636 ) ( IN-CITY ?auto_7632 ?auto_7636 ) ( not ( = ?auto_7632 ?auto_7635 ) ) ( OBJ-AT ?auto_7634 ?auto_7635 ) ( IN-CITY ?auto_7638 ?auto_7636 ) ( not ( = ?auto_7632 ?auto_7638 ) ) ( OBJ-AT ?auto_7633 ?auto_7638 ) ( TRUCK-AT ?auto_7637 ?auto_7632 ) ( not ( = ?auto_7633 ?auto_7634 ) ) ( not ( = ?auto_7635 ?auto_7638 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7633 ?auto_7632 )
      ( DELIVER-1PKG ?auto_7634 ?auto_7632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7744 - OBJ
      ?auto_7745 - OBJ
      ?auto_7746 - OBJ
      ?auto_7743 - LOCATION
    )
    :vars
    (
      ?auto_7747 - LOCATION
      ?auto_7748 - CITY
      ?auto_7750 - LOCATION
      ?auto_7751 - LOCATION
      ?auto_7749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7747 ?auto_7748 ) ( IN-CITY ?auto_7743 ?auto_7748 ) ( not ( = ?auto_7743 ?auto_7747 ) ) ( OBJ-AT ?auto_7746 ?auto_7747 ) ( IN-CITY ?auto_7750 ?auto_7748 ) ( not ( = ?auto_7743 ?auto_7750 ) ) ( OBJ-AT ?auto_7745 ?auto_7750 ) ( IN-CITY ?auto_7751 ?auto_7748 ) ( not ( = ?auto_7743 ?auto_7751 ) ) ( OBJ-AT ?auto_7744 ?auto_7751 ) ( TRUCK-AT ?auto_7749 ?auto_7743 ) ( not ( = ?auto_7744 ?auto_7745 ) ) ( not ( = ?auto_7750 ?auto_7751 ) ) ( not ( = ?auto_7744 ?auto_7746 ) ) ( not ( = ?auto_7745 ?auto_7746 ) ) ( not ( = ?auto_7747 ?auto_7750 ) ) ( not ( = ?auto_7747 ?auto_7751 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7744 ?auto_7745 ?auto_7743 )
      ( DELIVER-1PKG ?auto_7746 ?auto_7743 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8887 - OBJ
      ?auto_8888 - OBJ
      ?auto_8889 - OBJ
      ?auto_8890 - OBJ
      ?auto_8886 - LOCATION
    )
    :vars
    (
      ?auto_8891 - LOCATION
      ?auto_8893 - CITY
      ?auto_8894 - LOCATION
      ?auto_8895 - LOCATION
      ?auto_8896 - LOCATION
      ?auto_8892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8891 ?auto_8893 ) ( IN-CITY ?auto_8886 ?auto_8893 ) ( not ( = ?auto_8886 ?auto_8891 ) ) ( OBJ-AT ?auto_8890 ?auto_8891 ) ( IN-CITY ?auto_8894 ?auto_8893 ) ( not ( = ?auto_8886 ?auto_8894 ) ) ( OBJ-AT ?auto_8889 ?auto_8894 ) ( IN-CITY ?auto_8895 ?auto_8893 ) ( not ( = ?auto_8886 ?auto_8895 ) ) ( OBJ-AT ?auto_8888 ?auto_8895 ) ( IN-CITY ?auto_8896 ?auto_8893 ) ( not ( = ?auto_8886 ?auto_8896 ) ) ( OBJ-AT ?auto_8887 ?auto_8896 ) ( TRUCK-AT ?auto_8892 ?auto_8886 ) ( not ( = ?auto_8887 ?auto_8888 ) ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( not ( = ?auto_8887 ?auto_8889 ) ) ( not ( = ?auto_8888 ?auto_8889 ) ) ( not ( = ?auto_8894 ?auto_8895 ) ) ( not ( = ?auto_8894 ?auto_8896 ) ) ( not ( = ?auto_8887 ?auto_8890 ) ) ( not ( = ?auto_8888 ?auto_8890 ) ) ( not ( = ?auto_8889 ?auto_8890 ) ) ( not ( = ?auto_8891 ?auto_8894 ) ) ( not ( = ?auto_8891 ?auto_8895 ) ) ( not ( = ?auto_8891 ?auto_8896 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8887 ?auto_8888 ?auto_8889 ?auto_8886 )
      ( DELIVER-1PKG ?auto_8890 ?auto_8886 ) )
  )

)

