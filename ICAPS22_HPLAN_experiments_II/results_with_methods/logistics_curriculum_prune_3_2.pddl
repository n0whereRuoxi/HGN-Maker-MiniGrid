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
      ?auto_744 - OBJ
      ?auto_743 - LOCATION
    )
    :vars
    (
      ?auto_746 - LOCATION
      ?auto_747 - CITY
      ?auto_745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_746 ?auto_747 ) ( IN-CITY ?auto_743 ?auto_747 ) ( not ( = ?auto_743 ?auto_746 ) ) ( OBJ-AT ?auto_744 ?auto_746 ) ( TRUCK-AT ?auto_745 ?auto_743 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_745 ?auto_743 ?auto_746 ?auto_747 )
      ( !LOAD-TRUCK ?auto_744 ?auto_745 ?auto_746 )
      ( !DRIVE-TRUCK ?auto_745 ?auto_746 ?auto_743 ?auto_747 )
      ( !UNLOAD-TRUCK ?auto_744 ?auto_745 ?auto_743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_765 - OBJ
      ?auto_766 - OBJ
      ?auto_764 - LOCATION
    )
    :vars
    (
      ?auto_769 - LOCATION
      ?auto_767 - CITY
      ?auto_770 - LOCATION
      ?auto_768 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_769 ?auto_767 ) ( IN-CITY ?auto_764 ?auto_767 ) ( not ( = ?auto_764 ?auto_769 ) ) ( OBJ-AT ?auto_766 ?auto_769 ) ( IN-CITY ?auto_770 ?auto_767 ) ( not ( = ?auto_764 ?auto_770 ) ) ( OBJ-AT ?auto_765 ?auto_770 ) ( TRUCK-AT ?auto_768 ?auto_764 ) ( not ( = ?auto_765 ?auto_766 ) ) ( not ( = ?auto_769 ?auto_770 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_765 ?auto_764 )
      ( DELIVER-1PKG ?auto_766 ?auto_764 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_875 - OBJ
      ?auto_876 - OBJ
      ?auto_877 - OBJ
      ?auto_874 - LOCATION
    )
    :vars
    (
      ?auto_880 - LOCATION
      ?auto_878 - CITY
      ?auto_881 - LOCATION
      ?auto_879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_880 ?auto_878 ) ( IN-CITY ?auto_874 ?auto_878 ) ( not ( = ?auto_874 ?auto_880 ) ) ( OBJ-AT ?auto_877 ?auto_880 ) ( OBJ-AT ?auto_876 ?auto_880 ) ( IN-CITY ?auto_881 ?auto_878 ) ( not ( = ?auto_874 ?auto_881 ) ) ( OBJ-AT ?auto_875 ?auto_881 ) ( TRUCK-AT ?auto_879 ?auto_874 ) ( not ( = ?auto_875 ?auto_876 ) ) ( not ( = ?auto_880 ?auto_881 ) ) ( not ( = ?auto_875 ?auto_877 ) ) ( not ( = ?auto_876 ?auto_877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_875 ?auto_876 ?auto_874 )
      ( DELIVER-1PKG ?auto_877 ?auto_874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_905 - OBJ
      ?auto_906 - OBJ
      ?auto_907 - OBJ
      ?auto_904 - LOCATION
    )
    :vars
    (
      ?auto_908 - LOCATION
      ?auto_911 - CITY
      ?auto_910 - LOCATION
      ?auto_909 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_908 ?auto_911 ) ( IN-CITY ?auto_904 ?auto_911 ) ( not ( = ?auto_904 ?auto_908 ) ) ( OBJ-AT ?auto_907 ?auto_908 ) ( OBJ-AT ?auto_905 ?auto_908 ) ( IN-CITY ?auto_910 ?auto_911 ) ( not ( = ?auto_904 ?auto_910 ) ) ( OBJ-AT ?auto_906 ?auto_910 ) ( TRUCK-AT ?auto_909 ?auto_904 ) ( not ( = ?auto_906 ?auto_905 ) ) ( not ( = ?auto_908 ?auto_910 ) ) ( not ( = ?auto_906 ?auto_907 ) ) ( not ( = ?auto_905 ?auto_907 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_906 ?auto_905 ?auto_907 ?auto_904 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_922 - OBJ
      ?auto_923 - OBJ
      ?auto_924 - OBJ
      ?auto_921 - LOCATION
    )
    :vars
    (
      ?auto_928 - LOCATION
      ?auto_926 - CITY
      ?auto_927 - LOCATION
      ?auto_925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_928 ?auto_926 ) ( IN-CITY ?auto_921 ?auto_926 ) ( not ( = ?auto_921 ?auto_928 ) ) ( OBJ-AT ?auto_923 ?auto_928 ) ( OBJ-AT ?auto_922 ?auto_928 ) ( IN-CITY ?auto_927 ?auto_926 ) ( not ( = ?auto_921 ?auto_927 ) ) ( OBJ-AT ?auto_924 ?auto_927 ) ( TRUCK-AT ?auto_925 ?auto_921 ) ( not ( = ?auto_924 ?auto_922 ) ) ( not ( = ?auto_928 ?auto_927 ) ) ( not ( = ?auto_924 ?auto_923 ) ) ( not ( = ?auto_922 ?auto_923 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_922 ?auto_924 ?auto_923 ?auto_921 ) )
  )

)

