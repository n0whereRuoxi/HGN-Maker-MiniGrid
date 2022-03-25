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
      ?auto_187490 - OBJ
      ?auto_187489 - LOCATION
    )
    :vars
    (
      ?auto_187492 - LOCATION
      ?auto_187493 - CITY
      ?auto_187491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187492 ?auto_187493 ) ( IN-CITY ?auto_187489 ?auto_187493 ) ( not ( = ?auto_187489 ?auto_187492 ) ) ( OBJ-AT ?auto_187490 ?auto_187492 ) ( TRUCK-AT ?auto_187491 ?auto_187489 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_187491 ?auto_187489 ?auto_187492 ?auto_187493 )
      ( !LOAD-TRUCK ?auto_187490 ?auto_187491 ?auto_187492 )
      ( !DRIVE-TRUCK ?auto_187491 ?auto_187492 ?auto_187489 ?auto_187493 )
      ( !UNLOAD-TRUCK ?auto_187490 ?auto_187491 ?auto_187489 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_187511 - OBJ
      ?auto_187512 - OBJ
      ?auto_187510 - LOCATION
    )
    :vars
    (
      ?auto_187514 - LOCATION
      ?auto_187513 - CITY
      ?auto_187516 - LOCATION
      ?auto_187515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187514 ?auto_187513 ) ( IN-CITY ?auto_187510 ?auto_187513 ) ( not ( = ?auto_187510 ?auto_187514 ) ) ( OBJ-AT ?auto_187512 ?auto_187514 ) ( IN-CITY ?auto_187516 ?auto_187513 ) ( not ( = ?auto_187510 ?auto_187516 ) ) ( OBJ-AT ?auto_187511 ?auto_187516 ) ( TRUCK-AT ?auto_187515 ?auto_187510 ) ( not ( = ?auto_187511 ?auto_187512 ) ) ( not ( = ?auto_187514 ?auto_187516 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_187511 ?auto_187510 )
      ( DELIVER-1PKG ?auto_187512 ?auto_187510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_187622 - OBJ
      ?auto_187623 - OBJ
      ?auto_187624 - OBJ
      ?auto_187621 - LOCATION
    )
    :vars
    (
      ?auto_187627 - LOCATION
      ?auto_187626 - CITY
      ?auto_187629 - LOCATION
      ?auto_187628 - LOCATION
      ?auto_187625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187627 ?auto_187626 ) ( IN-CITY ?auto_187621 ?auto_187626 ) ( not ( = ?auto_187621 ?auto_187627 ) ) ( OBJ-AT ?auto_187624 ?auto_187627 ) ( IN-CITY ?auto_187629 ?auto_187626 ) ( not ( = ?auto_187621 ?auto_187629 ) ) ( OBJ-AT ?auto_187623 ?auto_187629 ) ( IN-CITY ?auto_187628 ?auto_187626 ) ( not ( = ?auto_187621 ?auto_187628 ) ) ( OBJ-AT ?auto_187622 ?auto_187628 ) ( TRUCK-AT ?auto_187625 ?auto_187621 ) ( not ( = ?auto_187622 ?auto_187623 ) ) ( not ( = ?auto_187629 ?auto_187628 ) ) ( not ( = ?auto_187622 ?auto_187624 ) ) ( not ( = ?auto_187623 ?auto_187624 ) ) ( not ( = ?auto_187627 ?auto_187629 ) ) ( not ( = ?auto_187627 ?auto_187628 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_187622 ?auto_187623 ?auto_187621 )
      ( DELIVER-1PKG ?auto_187624 ?auto_187621 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_188765 - OBJ
      ?auto_188766 - OBJ
      ?auto_188767 - OBJ
      ?auto_188768 - OBJ
      ?auto_188764 - LOCATION
    )
    :vars
    (
      ?auto_188771 - LOCATION
      ?auto_188770 - CITY
      ?auto_188772 - LOCATION
      ?auto_188773 - LOCATION
      ?auto_188774 - LOCATION
      ?auto_188769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188771 ?auto_188770 ) ( IN-CITY ?auto_188764 ?auto_188770 ) ( not ( = ?auto_188764 ?auto_188771 ) ) ( OBJ-AT ?auto_188768 ?auto_188771 ) ( IN-CITY ?auto_188772 ?auto_188770 ) ( not ( = ?auto_188764 ?auto_188772 ) ) ( OBJ-AT ?auto_188767 ?auto_188772 ) ( IN-CITY ?auto_188773 ?auto_188770 ) ( not ( = ?auto_188764 ?auto_188773 ) ) ( OBJ-AT ?auto_188766 ?auto_188773 ) ( IN-CITY ?auto_188774 ?auto_188770 ) ( not ( = ?auto_188764 ?auto_188774 ) ) ( OBJ-AT ?auto_188765 ?auto_188774 ) ( TRUCK-AT ?auto_188769 ?auto_188764 ) ( not ( = ?auto_188765 ?auto_188766 ) ) ( not ( = ?auto_188773 ?auto_188774 ) ) ( not ( = ?auto_188765 ?auto_188767 ) ) ( not ( = ?auto_188766 ?auto_188767 ) ) ( not ( = ?auto_188772 ?auto_188773 ) ) ( not ( = ?auto_188772 ?auto_188774 ) ) ( not ( = ?auto_188765 ?auto_188768 ) ) ( not ( = ?auto_188766 ?auto_188768 ) ) ( not ( = ?auto_188767 ?auto_188768 ) ) ( not ( = ?auto_188771 ?auto_188772 ) ) ( not ( = ?auto_188771 ?auto_188773 ) ) ( not ( = ?auto_188771 ?auto_188774 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_188765 ?auto_188766 ?auto_188767 ?auto_188764 )
      ( DELIVER-1PKG ?auto_188768 ?auto_188764 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_204457 - OBJ
      ?auto_204458 - OBJ
      ?auto_204459 - OBJ
      ?auto_204460 - OBJ
      ?auto_204461 - OBJ
      ?auto_204456 - LOCATION
    )
    :vars
    (
      ?auto_204463 - LOCATION
      ?auto_204464 - CITY
      ?auto_204468 - LOCATION
      ?auto_204467 - LOCATION
      ?auto_204465 - LOCATION
      ?auto_204466 - LOCATION
      ?auto_204462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_204463 ?auto_204464 ) ( IN-CITY ?auto_204456 ?auto_204464 ) ( not ( = ?auto_204456 ?auto_204463 ) ) ( OBJ-AT ?auto_204461 ?auto_204463 ) ( IN-CITY ?auto_204468 ?auto_204464 ) ( not ( = ?auto_204456 ?auto_204468 ) ) ( OBJ-AT ?auto_204460 ?auto_204468 ) ( IN-CITY ?auto_204467 ?auto_204464 ) ( not ( = ?auto_204456 ?auto_204467 ) ) ( OBJ-AT ?auto_204459 ?auto_204467 ) ( IN-CITY ?auto_204465 ?auto_204464 ) ( not ( = ?auto_204456 ?auto_204465 ) ) ( OBJ-AT ?auto_204458 ?auto_204465 ) ( IN-CITY ?auto_204466 ?auto_204464 ) ( not ( = ?auto_204456 ?auto_204466 ) ) ( OBJ-AT ?auto_204457 ?auto_204466 ) ( TRUCK-AT ?auto_204462 ?auto_204456 ) ( not ( = ?auto_204457 ?auto_204458 ) ) ( not ( = ?auto_204465 ?auto_204466 ) ) ( not ( = ?auto_204457 ?auto_204459 ) ) ( not ( = ?auto_204458 ?auto_204459 ) ) ( not ( = ?auto_204467 ?auto_204465 ) ) ( not ( = ?auto_204467 ?auto_204466 ) ) ( not ( = ?auto_204457 ?auto_204460 ) ) ( not ( = ?auto_204458 ?auto_204460 ) ) ( not ( = ?auto_204459 ?auto_204460 ) ) ( not ( = ?auto_204468 ?auto_204467 ) ) ( not ( = ?auto_204468 ?auto_204465 ) ) ( not ( = ?auto_204468 ?auto_204466 ) ) ( not ( = ?auto_204457 ?auto_204461 ) ) ( not ( = ?auto_204458 ?auto_204461 ) ) ( not ( = ?auto_204459 ?auto_204461 ) ) ( not ( = ?auto_204460 ?auto_204461 ) ) ( not ( = ?auto_204463 ?auto_204468 ) ) ( not ( = ?auto_204463 ?auto_204467 ) ) ( not ( = ?auto_204463 ?auto_204465 ) ) ( not ( = ?auto_204463 ?auto_204466 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_204457 ?auto_204458 ?auto_204459 ?auto_204460 ?auto_204456 )
      ( DELIVER-1PKG ?auto_204461 ?auto_204456 ) )
  )

)

