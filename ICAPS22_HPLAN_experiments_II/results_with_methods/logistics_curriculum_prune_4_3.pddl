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
      ?auto_10319 - OBJ
      ?auto_10318 - LOCATION
    )
    :vars
    (
      ?auto_10321 - LOCATION
      ?auto_10322 - CITY
      ?auto_10320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10321 ?auto_10322 ) ( IN-CITY ?auto_10318 ?auto_10322 ) ( not ( = ?auto_10318 ?auto_10321 ) ) ( OBJ-AT ?auto_10319 ?auto_10321 ) ( TRUCK-AT ?auto_10320 ?auto_10318 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10320 ?auto_10318 ?auto_10321 ?auto_10322 )
      ( !LOAD-TRUCK ?auto_10319 ?auto_10320 ?auto_10321 )
      ( !DRIVE-TRUCK ?auto_10320 ?auto_10321 ?auto_10318 ?auto_10322 )
      ( !UNLOAD-TRUCK ?auto_10319 ?auto_10320 ?auto_10318 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10340 - OBJ
      ?auto_10341 - OBJ
      ?auto_10339 - LOCATION
    )
    :vars
    (
      ?auto_10344 - LOCATION
      ?auto_10343 - CITY
      ?auto_10342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10344 ?auto_10343 ) ( IN-CITY ?auto_10339 ?auto_10343 ) ( not ( = ?auto_10339 ?auto_10344 ) ) ( OBJ-AT ?auto_10341 ?auto_10344 ) ( OBJ-AT ?auto_10340 ?auto_10344 ) ( TRUCK-AT ?auto_10342 ?auto_10339 ) ( not ( = ?auto_10340 ?auto_10341 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10340 ?auto_10339 )
      ( DELIVER-1PKG ?auto_10341 ?auto_10339 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10447 - OBJ
      ?auto_10448 - OBJ
      ?auto_10449 - OBJ
      ?auto_10446 - LOCATION
    )
    :vars
    (
      ?auto_10452 - LOCATION
      ?auto_10450 - CITY
      ?auto_10451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10452 ?auto_10450 ) ( IN-CITY ?auto_10446 ?auto_10450 ) ( not ( = ?auto_10446 ?auto_10452 ) ) ( OBJ-AT ?auto_10449 ?auto_10452 ) ( OBJ-AT ?auto_10448 ?auto_10452 ) ( OBJ-AT ?auto_10447 ?auto_10452 ) ( TRUCK-AT ?auto_10451 ?auto_10446 ) ( not ( = ?auto_10447 ?auto_10448 ) ) ( not ( = ?auto_10447 ?auto_10449 ) ) ( not ( = ?auto_10448 ?auto_10449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10447 ?auto_10448 ?auto_10446 )
      ( DELIVER-1PKG ?auto_10449 ?auto_10446 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11546 - OBJ
      ?auto_11547 - OBJ
      ?auto_11548 - OBJ
      ?auto_11549 - OBJ
      ?auto_11545 - LOCATION
    )
    :vars
    (
      ?auto_11552 - LOCATION
      ?auto_11551 - CITY
      ?auto_11553 - LOCATION
      ?auto_11550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11552 ?auto_11551 ) ( IN-CITY ?auto_11545 ?auto_11551 ) ( not ( = ?auto_11545 ?auto_11552 ) ) ( OBJ-AT ?auto_11549 ?auto_11552 ) ( IN-CITY ?auto_11553 ?auto_11551 ) ( not ( = ?auto_11545 ?auto_11553 ) ) ( OBJ-AT ?auto_11548 ?auto_11553 ) ( OBJ-AT ?auto_11547 ?auto_11553 ) ( OBJ-AT ?auto_11546 ?auto_11553 ) ( TRUCK-AT ?auto_11550 ?auto_11545 ) ( not ( = ?auto_11546 ?auto_11547 ) ) ( not ( = ?auto_11546 ?auto_11548 ) ) ( not ( = ?auto_11547 ?auto_11548 ) ) ( not ( = ?auto_11546 ?auto_11549 ) ) ( not ( = ?auto_11547 ?auto_11549 ) ) ( not ( = ?auto_11548 ?auto_11549 ) ) ( not ( = ?auto_11552 ?auto_11553 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11546 ?auto_11547 ?auto_11548 ?auto_11545 )
      ( DELIVER-1PKG ?auto_11549 ?auto_11545 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11575 - OBJ
      ?auto_11576 - OBJ
      ?auto_11577 - OBJ
      ?auto_11578 - OBJ
      ?auto_11574 - LOCATION
    )
    :vars
    (
      ?auto_11582 - LOCATION
      ?auto_11581 - CITY
      ?auto_11579 - LOCATION
      ?auto_11580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11582 ?auto_11581 ) ( IN-CITY ?auto_11574 ?auto_11581 ) ( not ( = ?auto_11574 ?auto_11582 ) ) ( OBJ-AT ?auto_11577 ?auto_11582 ) ( IN-CITY ?auto_11579 ?auto_11581 ) ( not ( = ?auto_11574 ?auto_11579 ) ) ( OBJ-AT ?auto_11578 ?auto_11579 ) ( OBJ-AT ?auto_11576 ?auto_11579 ) ( OBJ-AT ?auto_11575 ?auto_11579 ) ( TRUCK-AT ?auto_11580 ?auto_11574 ) ( not ( = ?auto_11575 ?auto_11576 ) ) ( not ( = ?auto_11575 ?auto_11578 ) ) ( not ( = ?auto_11576 ?auto_11578 ) ) ( not ( = ?auto_11575 ?auto_11577 ) ) ( not ( = ?auto_11576 ?auto_11577 ) ) ( not ( = ?auto_11578 ?auto_11577 ) ) ( not ( = ?auto_11582 ?auto_11579 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_11575 ?auto_11576 ?auto_11578 ?auto_11577 ?auto_11574 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_11716 - OBJ
      ?auto_11717 - OBJ
      ?auto_11718 - OBJ
      ?auto_11719 - OBJ
      ?auto_11715 - LOCATION
    )
    :vars
    (
      ?auto_11721 - LOCATION
      ?auto_11723 - CITY
      ?auto_11722 - LOCATION
      ?auto_11720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11721 ?auto_11723 ) ( IN-CITY ?auto_11715 ?auto_11723 ) ( not ( = ?auto_11715 ?auto_11721 ) ) ( OBJ-AT ?auto_11717 ?auto_11721 ) ( IN-CITY ?auto_11722 ?auto_11723 ) ( not ( = ?auto_11715 ?auto_11722 ) ) ( OBJ-AT ?auto_11719 ?auto_11722 ) ( OBJ-AT ?auto_11718 ?auto_11722 ) ( OBJ-AT ?auto_11716 ?auto_11722 ) ( TRUCK-AT ?auto_11720 ?auto_11715 ) ( not ( = ?auto_11716 ?auto_11718 ) ) ( not ( = ?auto_11716 ?auto_11719 ) ) ( not ( = ?auto_11718 ?auto_11719 ) ) ( not ( = ?auto_11716 ?auto_11717 ) ) ( not ( = ?auto_11718 ?auto_11717 ) ) ( not ( = ?auto_11719 ?auto_11717 ) ) ( not ( = ?auto_11721 ?auto_11722 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_11716 ?auto_11718 ?auto_11717 ?auto_11719 ?auto_11715 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12568 - OBJ
      ?auto_12569 - OBJ
      ?auto_12570 - OBJ
      ?auto_12571 - OBJ
      ?auto_12567 - LOCATION
    )
    :vars
    (
      ?auto_12573 - LOCATION
      ?auto_12575 - CITY
      ?auto_12574 - LOCATION
      ?auto_12572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12573 ?auto_12575 ) ( IN-CITY ?auto_12567 ?auto_12575 ) ( not ( = ?auto_12567 ?auto_12573 ) ) ( OBJ-AT ?auto_12568 ?auto_12573 ) ( IN-CITY ?auto_12574 ?auto_12575 ) ( not ( = ?auto_12567 ?auto_12574 ) ) ( OBJ-AT ?auto_12571 ?auto_12574 ) ( OBJ-AT ?auto_12570 ?auto_12574 ) ( OBJ-AT ?auto_12569 ?auto_12574 ) ( TRUCK-AT ?auto_12572 ?auto_12567 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12569 ?auto_12568 ) ) ( not ( = ?auto_12570 ?auto_12568 ) ) ( not ( = ?auto_12571 ?auto_12568 ) ) ( not ( = ?auto_12573 ?auto_12574 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12569 ?auto_12570 ?auto_12568 ?auto_12571 ?auto_12567 ) )
  )

)

