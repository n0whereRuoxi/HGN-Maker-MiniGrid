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
      ?auto_101812 - OBJ
      ?auto_101811 - LOCATION
    )
    :vars
    (
      ?auto_101814 - LOCATION
      ?auto_101815 - CITY
      ?auto_101813 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101814 ?auto_101815 ) ( IN-CITY ?auto_101811 ?auto_101815 ) ( not ( = ?auto_101811 ?auto_101814 ) ) ( OBJ-AT ?auto_101812 ?auto_101814 ) ( TRUCK-AT ?auto_101813 ?auto_101811 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_101813 ?auto_101811 ?auto_101814 ?auto_101815 )
      ( !LOAD-TRUCK ?auto_101812 ?auto_101813 ?auto_101814 )
      ( !DRIVE-TRUCK ?auto_101813 ?auto_101814 ?auto_101811 ?auto_101815 )
      ( !UNLOAD-TRUCK ?auto_101812 ?auto_101813 ?auto_101811 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_101833 - OBJ
      ?auto_101834 - OBJ
      ?auto_101832 - LOCATION
    )
    :vars
    (
      ?auto_101837 - LOCATION
      ?auto_101836 - CITY
      ?auto_101838 - LOCATION
      ?auto_101835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101837 ?auto_101836 ) ( IN-CITY ?auto_101832 ?auto_101836 ) ( not ( = ?auto_101832 ?auto_101837 ) ) ( OBJ-AT ?auto_101834 ?auto_101837 ) ( IN-CITY ?auto_101838 ?auto_101836 ) ( not ( = ?auto_101832 ?auto_101838 ) ) ( OBJ-AT ?auto_101833 ?auto_101838 ) ( TRUCK-AT ?auto_101835 ?auto_101832 ) ( not ( = ?auto_101833 ?auto_101834 ) ) ( not ( = ?auto_101837 ?auto_101838 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_101833 ?auto_101832 )
      ( DELIVER-1PKG ?auto_101834 ?auto_101832 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101944 - OBJ
      ?auto_101945 - OBJ
      ?auto_101946 - OBJ
      ?auto_101943 - LOCATION
    )
    :vars
    (
      ?auto_101948 - LOCATION
      ?auto_101947 - CITY
      ?auto_101950 - LOCATION
      ?auto_101951 - LOCATION
      ?auto_101949 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101948 ?auto_101947 ) ( IN-CITY ?auto_101943 ?auto_101947 ) ( not ( = ?auto_101943 ?auto_101948 ) ) ( OBJ-AT ?auto_101946 ?auto_101948 ) ( IN-CITY ?auto_101950 ?auto_101947 ) ( not ( = ?auto_101943 ?auto_101950 ) ) ( OBJ-AT ?auto_101945 ?auto_101950 ) ( IN-CITY ?auto_101951 ?auto_101947 ) ( not ( = ?auto_101943 ?auto_101951 ) ) ( OBJ-AT ?auto_101944 ?auto_101951 ) ( TRUCK-AT ?auto_101949 ?auto_101943 ) ( not ( = ?auto_101944 ?auto_101945 ) ) ( not ( = ?auto_101950 ?auto_101951 ) ) ( not ( = ?auto_101944 ?auto_101946 ) ) ( not ( = ?auto_101945 ?auto_101946 ) ) ( not ( = ?auto_101948 ?auto_101950 ) ) ( not ( = ?auto_101948 ?auto_101951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101944 ?auto_101945 ?auto_101943 )
      ( DELIVER-1PKG ?auto_101946 ?auto_101943 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_103087 - OBJ
      ?auto_103088 - OBJ
      ?auto_103089 - OBJ
      ?auto_103090 - OBJ
      ?auto_103086 - LOCATION
    )
    :vars
    (
      ?auto_103091 - LOCATION
      ?auto_103092 - CITY
      ?auto_103094 - LOCATION
      ?auto_103095 - LOCATION
      ?auto_103096 - LOCATION
      ?auto_103093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103091 ?auto_103092 ) ( IN-CITY ?auto_103086 ?auto_103092 ) ( not ( = ?auto_103086 ?auto_103091 ) ) ( OBJ-AT ?auto_103090 ?auto_103091 ) ( IN-CITY ?auto_103094 ?auto_103092 ) ( not ( = ?auto_103086 ?auto_103094 ) ) ( OBJ-AT ?auto_103089 ?auto_103094 ) ( IN-CITY ?auto_103095 ?auto_103092 ) ( not ( = ?auto_103086 ?auto_103095 ) ) ( OBJ-AT ?auto_103088 ?auto_103095 ) ( IN-CITY ?auto_103096 ?auto_103092 ) ( not ( = ?auto_103086 ?auto_103096 ) ) ( OBJ-AT ?auto_103087 ?auto_103096 ) ( TRUCK-AT ?auto_103093 ?auto_103086 ) ( not ( = ?auto_103087 ?auto_103088 ) ) ( not ( = ?auto_103095 ?auto_103096 ) ) ( not ( = ?auto_103087 ?auto_103089 ) ) ( not ( = ?auto_103088 ?auto_103089 ) ) ( not ( = ?auto_103094 ?auto_103095 ) ) ( not ( = ?auto_103094 ?auto_103096 ) ) ( not ( = ?auto_103087 ?auto_103090 ) ) ( not ( = ?auto_103088 ?auto_103090 ) ) ( not ( = ?auto_103089 ?auto_103090 ) ) ( not ( = ?auto_103091 ?auto_103094 ) ) ( not ( = ?auto_103091 ?auto_103095 ) ) ( not ( = ?auto_103091 ?auto_103096 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103087 ?auto_103088 ?auto_103089 ?auto_103086 )
      ( DELIVER-1PKG ?auto_103090 ?auto_103086 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_118779 - OBJ
      ?auto_118780 - OBJ
      ?auto_118781 - OBJ
      ?auto_118782 - OBJ
      ?auto_118783 - OBJ
      ?auto_118778 - LOCATION
    )
    :vars
    (
      ?auto_118785 - LOCATION
      ?auto_118786 - CITY
      ?auto_118789 - LOCATION
      ?auto_118788 - LOCATION
      ?auto_118787 - LOCATION
      ?auto_118790 - LOCATION
      ?auto_118784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_118785 ?auto_118786 ) ( IN-CITY ?auto_118778 ?auto_118786 ) ( not ( = ?auto_118778 ?auto_118785 ) ) ( OBJ-AT ?auto_118783 ?auto_118785 ) ( IN-CITY ?auto_118789 ?auto_118786 ) ( not ( = ?auto_118778 ?auto_118789 ) ) ( OBJ-AT ?auto_118782 ?auto_118789 ) ( IN-CITY ?auto_118788 ?auto_118786 ) ( not ( = ?auto_118778 ?auto_118788 ) ) ( OBJ-AT ?auto_118781 ?auto_118788 ) ( IN-CITY ?auto_118787 ?auto_118786 ) ( not ( = ?auto_118778 ?auto_118787 ) ) ( OBJ-AT ?auto_118780 ?auto_118787 ) ( IN-CITY ?auto_118790 ?auto_118786 ) ( not ( = ?auto_118778 ?auto_118790 ) ) ( OBJ-AT ?auto_118779 ?auto_118790 ) ( TRUCK-AT ?auto_118784 ?auto_118778 ) ( not ( = ?auto_118779 ?auto_118780 ) ) ( not ( = ?auto_118787 ?auto_118790 ) ) ( not ( = ?auto_118779 ?auto_118781 ) ) ( not ( = ?auto_118780 ?auto_118781 ) ) ( not ( = ?auto_118788 ?auto_118787 ) ) ( not ( = ?auto_118788 ?auto_118790 ) ) ( not ( = ?auto_118779 ?auto_118782 ) ) ( not ( = ?auto_118780 ?auto_118782 ) ) ( not ( = ?auto_118781 ?auto_118782 ) ) ( not ( = ?auto_118789 ?auto_118788 ) ) ( not ( = ?auto_118789 ?auto_118787 ) ) ( not ( = ?auto_118789 ?auto_118790 ) ) ( not ( = ?auto_118779 ?auto_118783 ) ) ( not ( = ?auto_118780 ?auto_118783 ) ) ( not ( = ?auto_118781 ?auto_118783 ) ) ( not ( = ?auto_118782 ?auto_118783 ) ) ( not ( = ?auto_118785 ?auto_118789 ) ) ( not ( = ?auto_118785 ?auto_118788 ) ) ( not ( = ?auto_118785 ?auto_118787 ) ) ( not ( = ?auto_118785 ?auto_118790 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_118779 ?auto_118780 ?auto_118781 ?auto_118782 ?auto_118778 )
      ( DELIVER-1PKG ?auto_118783 ?auto_118778 ) )
  )

)

