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
      ?auto_7469 - OBJ
      ?auto_7468 - LOCATION
    )
    :vars
    (
      ?auto_7471 - LOCATION
      ?auto_7472 - CITY
      ?auto_7470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7471 ?auto_7472 ) ( IN-CITY ?auto_7468 ?auto_7472 ) ( not ( = ?auto_7468 ?auto_7471 ) ) ( OBJ-AT ?auto_7469 ?auto_7471 ) ( TRUCK-AT ?auto_7470 ?auto_7468 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7470 ?auto_7468 ?auto_7471 ?auto_7472 )
      ( !LOAD-TRUCK ?auto_7469 ?auto_7470 ?auto_7471 )
      ( !DRIVE-TRUCK ?auto_7470 ?auto_7471 ?auto_7468 ?auto_7472 )
      ( !UNLOAD-TRUCK ?auto_7469 ?auto_7470 ?auto_7468 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7490 - OBJ
      ?auto_7491 - OBJ
      ?auto_7489 - LOCATION
    )
    :vars
    (
      ?auto_7494 - LOCATION
      ?auto_7493 - CITY
      ?auto_7495 - LOCATION
      ?auto_7492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7494 ?auto_7493 ) ( IN-CITY ?auto_7489 ?auto_7493 ) ( not ( = ?auto_7489 ?auto_7494 ) ) ( OBJ-AT ?auto_7491 ?auto_7494 ) ( IN-CITY ?auto_7495 ?auto_7493 ) ( not ( = ?auto_7489 ?auto_7495 ) ) ( OBJ-AT ?auto_7490 ?auto_7495 ) ( TRUCK-AT ?auto_7492 ?auto_7489 ) ( not ( = ?auto_7490 ?auto_7491 ) ) ( not ( = ?auto_7494 ?auto_7495 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7490 ?auto_7489 )
      ( DELIVER-1PKG ?auto_7491 ?auto_7489 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7600 - OBJ
      ?auto_7601 - OBJ
      ?auto_7602 - OBJ
      ?auto_7599 - LOCATION
    )
    :vars
    (
      ?auto_7604 - LOCATION
      ?auto_7605 - CITY
      ?auto_7606 - LOCATION
      ?auto_7603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7604 ?auto_7605 ) ( IN-CITY ?auto_7599 ?auto_7605 ) ( not ( = ?auto_7599 ?auto_7604 ) ) ( OBJ-AT ?auto_7602 ?auto_7604 ) ( OBJ-AT ?auto_7601 ?auto_7604 ) ( IN-CITY ?auto_7606 ?auto_7605 ) ( not ( = ?auto_7599 ?auto_7606 ) ) ( OBJ-AT ?auto_7600 ?auto_7606 ) ( TRUCK-AT ?auto_7603 ?auto_7599 ) ( not ( = ?auto_7600 ?auto_7601 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7600 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7602 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7600 ?auto_7601 ?auto_7599 )
      ( DELIVER-1PKG ?auto_7602 ?auto_7599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7630 - OBJ
      ?auto_7631 - OBJ
      ?auto_7632 - OBJ
      ?auto_7629 - LOCATION
    )
    :vars
    (
      ?auto_7634 - LOCATION
      ?auto_7633 - CITY
      ?auto_7635 - LOCATION
      ?auto_7636 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7634 ?auto_7633 ) ( IN-CITY ?auto_7629 ?auto_7633 ) ( not ( = ?auto_7629 ?auto_7634 ) ) ( OBJ-AT ?auto_7632 ?auto_7634 ) ( OBJ-AT ?auto_7630 ?auto_7634 ) ( IN-CITY ?auto_7635 ?auto_7633 ) ( not ( = ?auto_7629 ?auto_7635 ) ) ( OBJ-AT ?auto_7631 ?auto_7635 ) ( TRUCK-AT ?auto_7636 ?auto_7629 ) ( not ( = ?auto_7631 ?auto_7630 ) ) ( not ( = ?auto_7634 ?auto_7635 ) ) ( not ( = ?auto_7631 ?auto_7632 ) ) ( not ( = ?auto_7630 ?auto_7632 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7631 ?auto_7630 ?auto_7632 ?auto_7629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7647 - OBJ
      ?auto_7648 - OBJ
      ?auto_7649 - OBJ
      ?auto_7646 - LOCATION
    )
    :vars
    (
      ?auto_7652 - LOCATION
      ?auto_7650 - CITY
      ?auto_7653 - LOCATION
      ?auto_7651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7652 ?auto_7650 ) ( IN-CITY ?auto_7646 ?auto_7650 ) ( not ( = ?auto_7646 ?auto_7652 ) ) ( OBJ-AT ?auto_7648 ?auto_7652 ) ( OBJ-AT ?auto_7647 ?auto_7652 ) ( IN-CITY ?auto_7653 ?auto_7650 ) ( not ( = ?auto_7646 ?auto_7653 ) ) ( OBJ-AT ?auto_7649 ?auto_7653 ) ( TRUCK-AT ?auto_7651 ?auto_7646 ) ( not ( = ?auto_7649 ?auto_7647 ) ) ( not ( = ?auto_7652 ?auto_7653 ) ) ( not ( = ?auto_7649 ?auto_7648 ) ) ( not ( = ?auto_7647 ?auto_7648 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7647 ?auto_7649 ?auto_7648 ?auto_7646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8720 - OBJ
      ?auto_8721 - OBJ
      ?auto_8722 - OBJ
      ?auto_8723 - OBJ
      ?auto_8719 - LOCATION
    )
    :vars
    (
      ?auto_8725 - LOCATION
      ?auto_8726 - CITY
      ?auto_8727 - LOCATION
      ?auto_8724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8725 ?auto_8726 ) ( IN-CITY ?auto_8719 ?auto_8726 ) ( not ( = ?auto_8719 ?auto_8725 ) ) ( OBJ-AT ?auto_8723 ?auto_8725 ) ( OBJ-AT ?auto_8722 ?auto_8725 ) ( OBJ-AT ?auto_8721 ?auto_8725 ) ( IN-CITY ?auto_8727 ?auto_8726 ) ( not ( = ?auto_8719 ?auto_8727 ) ) ( OBJ-AT ?auto_8720 ?auto_8727 ) ( TRUCK-AT ?auto_8724 ?auto_8719 ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8725 ?auto_8727 ) ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8721 ?auto_8722 ) ) ( not ( = ?auto_8720 ?auto_8723 ) ) ( not ( = ?auto_8721 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8723 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8721 ?auto_8720 ?auto_8722 ?auto_8719 )
      ( DELIVER-1PKG ?auto_8723 ?auto_8719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_8998 - OBJ
      ?auto_8999 - OBJ
      ?auto_9000 - OBJ
      ?auto_9001 - OBJ
      ?auto_8997 - LOCATION
    )
    :vars
    (
      ?auto_9004 - LOCATION
      ?auto_9002 - CITY
      ?auto_9005 - LOCATION
      ?auto_9003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9004 ?auto_9002 ) ( IN-CITY ?auto_8997 ?auto_9002 ) ( not ( = ?auto_8997 ?auto_9004 ) ) ( OBJ-AT ?auto_9001 ?auto_9004 ) ( OBJ-AT ?auto_9000 ?auto_9004 ) ( OBJ-AT ?auto_8998 ?auto_9004 ) ( IN-CITY ?auto_9005 ?auto_9002 ) ( not ( = ?auto_8997 ?auto_9005 ) ) ( OBJ-AT ?auto_8999 ?auto_9005 ) ( TRUCK-AT ?auto_9003 ?auto_8997 ) ( not ( = ?auto_8999 ?auto_8998 ) ) ( not ( = ?auto_9004 ?auto_9005 ) ) ( not ( = ?auto_8999 ?auto_9000 ) ) ( not ( = ?auto_8998 ?auto_9000 ) ) ( not ( = ?auto_8999 ?auto_9001 ) ) ( not ( = ?auto_8998 ?auto_9001 ) ) ( not ( = ?auto_9000 ?auto_9001 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_8999 ?auto_8998 ?auto_9000 ?auto_9001 ?auto_8997 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9115 - OBJ
      ?auto_9116 - OBJ
      ?auto_9117 - OBJ
      ?auto_9118 - OBJ
      ?auto_9114 - LOCATION
    )
    :vars
    (
      ?auto_9122 - LOCATION
      ?auto_9119 - CITY
      ?auto_9121 - LOCATION
      ?auto_9120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9122 ?auto_9119 ) ( IN-CITY ?auto_9114 ?auto_9119 ) ( not ( = ?auto_9114 ?auto_9122 ) ) ( OBJ-AT ?auto_9118 ?auto_9122 ) ( OBJ-AT ?auto_9116 ?auto_9122 ) ( OBJ-AT ?auto_9115 ?auto_9122 ) ( IN-CITY ?auto_9121 ?auto_9119 ) ( not ( = ?auto_9114 ?auto_9121 ) ) ( OBJ-AT ?auto_9117 ?auto_9121 ) ( TRUCK-AT ?auto_9120 ?auto_9114 ) ( not ( = ?auto_9117 ?auto_9115 ) ) ( not ( = ?auto_9122 ?auto_9121 ) ) ( not ( = ?auto_9117 ?auto_9116 ) ) ( not ( = ?auto_9115 ?auto_9116 ) ) ( not ( = ?auto_9117 ?auto_9118 ) ) ( not ( = ?auto_9115 ?auto_9118 ) ) ( not ( = ?auto_9116 ?auto_9118 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9115 ?auto_9117 ?auto_9116 ?auto_9118 ?auto_9114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9144 - OBJ
      ?auto_9145 - OBJ
      ?auto_9146 - OBJ
      ?auto_9147 - OBJ
      ?auto_9143 - LOCATION
    )
    :vars
    (
      ?auto_9151 - LOCATION
      ?auto_9148 - CITY
      ?auto_9150 - LOCATION
      ?auto_9149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9151 ?auto_9148 ) ( IN-CITY ?auto_9143 ?auto_9148 ) ( not ( = ?auto_9143 ?auto_9151 ) ) ( OBJ-AT ?auto_9146 ?auto_9151 ) ( OBJ-AT ?auto_9145 ?auto_9151 ) ( OBJ-AT ?auto_9144 ?auto_9151 ) ( IN-CITY ?auto_9150 ?auto_9148 ) ( not ( = ?auto_9143 ?auto_9150 ) ) ( OBJ-AT ?auto_9147 ?auto_9150 ) ( TRUCK-AT ?auto_9149 ?auto_9143 ) ( not ( = ?auto_9147 ?auto_9144 ) ) ( not ( = ?auto_9151 ?auto_9150 ) ) ( not ( = ?auto_9147 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9147 ?auto_9146 ) ) ( not ( = ?auto_9144 ?auto_9146 ) ) ( not ( = ?auto_9145 ?auto_9146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9144 ?auto_9147 ?auto_9145 ?auto_9146 ?auto_9143 ) )
  )

)

