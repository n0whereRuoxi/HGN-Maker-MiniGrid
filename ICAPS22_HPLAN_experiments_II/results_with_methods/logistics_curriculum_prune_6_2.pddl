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

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1730311 - OBJ
      ?auto_1730310 - LOCATION
    )
    :vars
    (
      ?auto_1730313 - LOCATION
      ?auto_1730314 - CITY
      ?auto_1730312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1730313 ?auto_1730314 ) ( IN-CITY ?auto_1730310 ?auto_1730314 ) ( not ( = ?auto_1730310 ?auto_1730313 ) ) ( OBJ-AT ?auto_1730311 ?auto_1730313 ) ( TRUCK-AT ?auto_1730312 ?auto_1730310 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1730312 ?auto_1730310 ?auto_1730313 ?auto_1730314 )
      ( !LOAD-TRUCK ?auto_1730311 ?auto_1730312 ?auto_1730313 )
      ( !DRIVE-TRUCK ?auto_1730312 ?auto_1730313 ?auto_1730310 ?auto_1730314 )
      ( !UNLOAD-TRUCK ?auto_1730311 ?auto_1730312 ?auto_1730310 )
      ( DELIVER-1PKG-VERIFY ?auto_1730311 ?auto_1730310 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1730332 - OBJ
      ?auto_1730333 - OBJ
      ?auto_1730331 - LOCATION
    )
    :vars
    (
      ?auto_1730336 - LOCATION
      ?auto_1730334 - CITY
      ?auto_1730337 - LOCATION
      ?auto_1730335 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1730336 ?auto_1730334 ) ( IN-CITY ?auto_1730331 ?auto_1730334 ) ( not ( = ?auto_1730331 ?auto_1730336 ) ) ( OBJ-AT ?auto_1730333 ?auto_1730336 ) ( IN-CITY ?auto_1730337 ?auto_1730334 ) ( not ( = ?auto_1730331 ?auto_1730337 ) ) ( OBJ-AT ?auto_1730332 ?auto_1730337 ) ( TRUCK-AT ?auto_1730335 ?auto_1730331 ) ( not ( = ?auto_1730332 ?auto_1730333 ) ) ( not ( = ?auto_1730336 ?auto_1730337 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1730332 ?auto_1730331 )
      ( DELIVER-1PKG ?auto_1730333 ?auto_1730331 )
      ( DELIVER-2PKG-VERIFY ?auto_1730332 ?auto_1730333 ?auto_1730331 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1730442 - OBJ
      ?auto_1730443 - OBJ
      ?auto_1730444 - OBJ
      ?auto_1730441 - LOCATION
    )
    :vars
    (
      ?auto_1730446 - LOCATION
      ?auto_1730447 - CITY
      ?auto_1730448 - LOCATION
      ?auto_1730445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1730446 ?auto_1730447 ) ( IN-CITY ?auto_1730441 ?auto_1730447 ) ( not ( = ?auto_1730441 ?auto_1730446 ) ) ( OBJ-AT ?auto_1730444 ?auto_1730446 ) ( IN-CITY ?auto_1730448 ?auto_1730447 ) ( not ( = ?auto_1730441 ?auto_1730448 ) ) ( OBJ-AT ?auto_1730443 ?auto_1730448 ) ( OBJ-AT ?auto_1730442 ?auto_1730446 ) ( TRUCK-AT ?auto_1730445 ?auto_1730441 ) ( not ( = ?auto_1730442 ?auto_1730443 ) ) ( not ( = ?auto_1730448 ?auto_1730446 ) ) ( not ( = ?auto_1730442 ?auto_1730444 ) ) ( not ( = ?auto_1730443 ?auto_1730444 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1730442 ?auto_1730443 ?auto_1730441 )
      ( DELIVER-1PKG ?auto_1730444 ?auto_1730441 )
      ( DELIVER-3PKG-VERIFY ?auto_1730442 ?auto_1730443 ?auto_1730444 ?auto_1730441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1730459 - OBJ
      ?auto_1730460 - OBJ
      ?auto_1730461 - OBJ
      ?auto_1730458 - LOCATION
    )
    :vars
    (
      ?auto_1730465 - LOCATION
      ?auto_1730463 - CITY
      ?auto_1730462 - LOCATION
      ?auto_1730464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1730465 ?auto_1730463 ) ( IN-CITY ?auto_1730458 ?auto_1730463 ) ( not ( = ?auto_1730458 ?auto_1730465 ) ) ( OBJ-AT ?auto_1730460 ?auto_1730465 ) ( IN-CITY ?auto_1730462 ?auto_1730463 ) ( not ( = ?auto_1730458 ?auto_1730462 ) ) ( OBJ-AT ?auto_1730461 ?auto_1730462 ) ( OBJ-AT ?auto_1730459 ?auto_1730465 ) ( TRUCK-AT ?auto_1730464 ?auto_1730458 ) ( not ( = ?auto_1730459 ?auto_1730461 ) ) ( not ( = ?auto_1730462 ?auto_1730465 ) ) ( not ( = ?auto_1730459 ?auto_1730460 ) ) ( not ( = ?auto_1730461 ?auto_1730460 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1730459 ?auto_1730461 ?auto_1730460 ?auto_1730458 )
      ( DELIVER-3PKG-VERIFY ?auto_1730459 ?auto_1730460 ?auto_1730461 ?auto_1730458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1730476 - OBJ
      ?auto_1730477 - OBJ
      ?auto_1730478 - OBJ
      ?auto_1730475 - LOCATION
    )
    :vars
    (
      ?auto_1730482 - LOCATION
      ?auto_1730479 - CITY
      ?auto_1730480 - LOCATION
      ?auto_1730481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1730482 ?auto_1730479 ) ( IN-CITY ?auto_1730475 ?auto_1730479 ) ( not ( = ?auto_1730475 ?auto_1730482 ) ) ( OBJ-AT ?auto_1730478 ?auto_1730482 ) ( IN-CITY ?auto_1730480 ?auto_1730479 ) ( not ( = ?auto_1730475 ?auto_1730480 ) ) ( OBJ-AT ?auto_1730476 ?auto_1730480 ) ( OBJ-AT ?auto_1730477 ?auto_1730482 ) ( TRUCK-AT ?auto_1730481 ?auto_1730475 ) ( not ( = ?auto_1730477 ?auto_1730476 ) ) ( not ( = ?auto_1730480 ?auto_1730482 ) ) ( not ( = ?auto_1730477 ?auto_1730478 ) ) ( not ( = ?auto_1730476 ?auto_1730478 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1730477 ?auto_1730478 ?auto_1730476 ?auto_1730475 )
      ( DELIVER-3PKG-VERIFY ?auto_1730476 ?auto_1730477 ?auto_1730478 ?auto_1730475 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1731571 - OBJ
      ?auto_1731572 - OBJ
      ?auto_1731573 - OBJ
      ?auto_1731574 - OBJ
      ?auto_1731570 - LOCATION
    )
    :vars
    (
      ?auto_1731575 - LOCATION
      ?auto_1731576 - CITY
      ?auto_1731579 - LOCATION
      ?auto_1731578 - LOCATION
      ?auto_1731577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1731575 ?auto_1731576 ) ( IN-CITY ?auto_1731570 ?auto_1731576 ) ( not ( = ?auto_1731570 ?auto_1731575 ) ) ( OBJ-AT ?auto_1731574 ?auto_1731575 ) ( IN-CITY ?auto_1731579 ?auto_1731576 ) ( not ( = ?auto_1731570 ?auto_1731579 ) ) ( OBJ-AT ?auto_1731573 ?auto_1731579 ) ( IN-CITY ?auto_1731578 ?auto_1731576 ) ( not ( = ?auto_1731570 ?auto_1731578 ) ) ( OBJ-AT ?auto_1731572 ?auto_1731578 ) ( OBJ-AT ?auto_1731571 ?auto_1731579 ) ( TRUCK-AT ?auto_1731577 ?auto_1731570 ) ( not ( = ?auto_1731571 ?auto_1731572 ) ) ( not ( = ?auto_1731578 ?auto_1731579 ) ) ( not ( = ?auto_1731571 ?auto_1731573 ) ) ( not ( = ?auto_1731572 ?auto_1731573 ) ) ( not ( = ?auto_1731571 ?auto_1731574 ) ) ( not ( = ?auto_1731572 ?auto_1731574 ) ) ( not ( = ?auto_1731573 ?auto_1731574 ) ) ( not ( = ?auto_1731575 ?auto_1731579 ) ) ( not ( = ?auto_1731575 ?auto_1731578 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1731571 ?auto_1731573 ?auto_1731572 ?auto_1731570 )
      ( DELIVER-1PKG ?auto_1731574 ?auto_1731570 )
      ( DELIVER-4PKG-VERIFY ?auto_1731571 ?auto_1731572 ?auto_1731573 ?auto_1731574 ?auto_1731570 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1731603 - OBJ
      ?auto_1731604 - OBJ
      ?auto_1731605 - OBJ
      ?auto_1731606 - OBJ
      ?auto_1731602 - LOCATION
    )
    :vars
    (
      ?auto_1731609 - LOCATION
      ?auto_1731611 - CITY
      ?auto_1731607 - LOCATION
      ?auto_1731610 - LOCATION
      ?auto_1731608 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1731609 ?auto_1731611 ) ( IN-CITY ?auto_1731602 ?auto_1731611 ) ( not ( = ?auto_1731602 ?auto_1731609 ) ) ( OBJ-AT ?auto_1731605 ?auto_1731609 ) ( IN-CITY ?auto_1731607 ?auto_1731611 ) ( not ( = ?auto_1731602 ?auto_1731607 ) ) ( OBJ-AT ?auto_1731606 ?auto_1731607 ) ( IN-CITY ?auto_1731610 ?auto_1731611 ) ( not ( = ?auto_1731602 ?auto_1731610 ) ) ( OBJ-AT ?auto_1731604 ?auto_1731610 ) ( OBJ-AT ?auto_1731603 ?auto_1731607 ) ( TRUCK-AT ?auto_1731608 ?auto_1731602 ) ( not ( = ?auto_1731603 ?auto_1731604 ) ) ( not ( = ?auto_1731610 ?auto_1731607 ) ) ( not ( = ?auto_1731603 ?auto_1731606 ) ) ( not ( = ?auto_1731604 ?auto_1731606 ) ) ( not ( = ?auto_1731603 ?auto_1731605 ) ) ( not ( = ?auto_1731604 ?auto_1731605 ) ) ( not ( = ?auto_1731606 ?auto_1731605 ) ) ( not ( = ?auto_1731609 ?auto_1731607 ) ) ( not ( = ?auto_1731609 ?auto_1731610 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1731603 ?auto_1731604 ?auto_1731606 ?auto_1731605 ?auto_1731602 )
      ( DELIVER-4PKG-VERIFY ?auto_1731603 ?auto_1731604 ?auto_1731605 ?auto_1731606 ?auto_1731602 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1731635 - OBJ
      ?auto_1731636 - OBJ
      ?auto_1731637 - OBJ
      ?auto_1731638 - OBJ
      ?auto_1731634 - LOCATION
    )
    :vars
    (
      ?auto_1731640 - LOCATION
      ?auto_1731643 - CITY
      ?auto_1731639 - LOCATION
      ?auto_1731642 - LOCATION
      ?auto_1731641 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1731640 ?auto_1731643 ) ( IN-CITY ?auto_1731634 ?auto_1731643 ) ( not ( = ?auto_1731634 ?auto_1731640 ) ) ( OBJ-AT ?auto_1731638 ?auto_1731640 ) ( IN-CITY ?auto_1731639 ?auto_1731643 ) ( not ( = ?auto_1731634 ?auto_1731639 ) ) ( OBJ-AT ?auto_1731636 ?auto_1731639 ) ( IN-CITY ?auto_1731642 ?auto_1731643 ) ( not ( = ?auto_1731634 ?auto_1731642 ) ) ( OBJ-AT ?auto_1731637 ?auto_1731642 ) ( OBJ-AT ?auto_1731635 ?auto_1731639 ) ( TRUCK-AT ?auto_1731641 ?auto_1731634 ) ( not ( = ?auto_1731635 ?auto_1731637 ) ) ( not ( = ?auto_1731642 ?auto_1731639 ) ) ( not ( = ?auto_1731635 ?auto_1731636 ) ) ( not ( = ?auto_1731637 ?auto_1731636 ) ) ( not ( = ?auto_1731635 ?auto_1731638 ) ) ( not ( = ?auto_1731637 ?auto_1731638 ) ) ( not ( = ?auto_1731636 ?auto_1731638 ) ) ( not ( = ?auto_1731640 ?auto_1731639 ) ) ( not ( = ?auto_1731640 ?auto_1731642 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1731635 ?auto_1731637 ?auto_1731638 ?auto_1731636 ?auto_1731634 )
      ( DELIVER-4PKG-VERIFY ?auto_1731635 ?auto_1731636 ?auto_1731637 ?auto_1731638 ?auto_1731634 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1731884 - OBJ
      ?auto_1731885 - OBJ
      ?auto_1731886 - OBJ
      ?auto_1731887 - OBJ
      ?auto_1731883 - LOCATION
    )
    :vars
    (
      ?auto_1731889 - LOCATION
      ?auto_1731892 - CITY
      ?auto_1731888 - LOCATION
      ?auto_1731891 - LOCATION
      ?auto_1731890 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1731889 ?auto_1731892 ) ( IN-CITY ?auto_1731883 ?auto_1731892 ) ( not ( = ?auto_1731883 ?auto_1731889 ) ) ( OBJ-AT ?auto_1731887 ?auto_1731889 ) ( IN-CITY ?auto_1731888 ?auto_1731892 ) ( not ( = ?auto_1731883 ?auto_1731888 ) ) ( OBJ-AT ?auto_1731886 ?auto_1731888 ) ( IN-CITY ?auto_1731891 ?auto_1731892 ) ( not ( = ?auto_1731883 ?auto_1731891 ) ) ( OBJ-AT ?auto_1731884 ?auto_1731891 ) ( OBJ-AT ?auto_1731885 ?auto_1731888 ) ( TRUCK-AT ?auto_1731890 ?auto_1731883 ) ( not ( = ?auto_1731885 ?auto_1731884 ) ) ( not ( = ?auto_1731891 ?auto_1731888 ) ) ( not ( = ?auto_1731885 ?auto_1731886 ) ) ( not ( = ?auto_1731884 ?auto_1731886 ) ) ( not ( = ?auto_1731885 ?auto_1731887 ) ) ( not ( = ?auto_1731884 ?auto_1731887 ) ) ( not ( = ?auto_1731886 ?auto_1731887 ) ) ( not ( = ?auto_1731889 ?auto_1731888 ) ) ( not ( = ?auto_1731889 ?auto_1731891 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1731885 ?auto_1731884 ?auto_1731887 ?auto_1731886 ?auto_1731883 )
      ( DELIVER-4PKG-VERIFY ?auto_1731884 ?auto_1731885 ?auto_1731886 ?auto_1731887 ?auto_1731883 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1731916 - OBJ
      ?auto_1731917 - OBJ
      ?auto_1731918 - OBJ
      ?auto_1731919 - OBJ
      ?auto_1731915 - LOCATION
    )
    :vars
    (
      ?auto_1731921 - LOCATION
      ?auto_1731924 - CITY
      ?auto_1731920 - LOCATION
      ?auto_1731923 - LOCATION
      ?auto_1731922 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1731921 ?auto_1731924 ) ( IN-CITY ?auto_1731915 ?auto_1731924 ) ( not ( = ?auto_1731915 ?auto_1731921 ) ) ( OBJ-AT ?auto_1731918 ?auto_1731921 ) ( IN-CITY ?auto_1731920 ?auto_1731924 ) ( not ( = ?auto_1731915 ?auto_1731920 ) ) ( OBJ-AT ?auto_1731919 ?auto_1731920 ) ( IN-CITY ?auto_1731923 ?auto_1731924 ) ( not ( = ?auto_1731915 ?auto_1731923 ) ) ( OBJ-AT ?auto_1731916 ?auto_1731923 ) ( OBJ-AT ?auto_1731917 ?auto_1731920 ) ( TRUCK-AT ?auto_1731922 ?auto_1731915 ) ( not ( = ?auto_1731917 ?auto_1731916 ) ) ( not ( = ?auto_1731923 ?auto_1731920 ) ) ( not ( = ?auto_1731917 ?auto_1731919 ) ) ( not ( = ?auto_1731916 ?auto_1731919 ) ) ( not ( = ?auto_1731917 ?auto_1731918 ) ) ( not ( = ?auto_1731916 ?auto_1731918 ) ) ( not ( = ?auto_1731919 ?auto_1731918 ) ) ( not ( = ?auto_1731921 ?auto_1731920 ) ) ( not ( = ?auto_1731921 ?auto_1731923 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1731917 ?auto_1731916 ?auto_1731918 ?auto_1731919 ?auto_1731915 )
      ( DELIVER-4PKG-VERIFY ?auto_1731916 ?auto_1731917 ?auto_1731918 ?auto_1731919 ?auto_1731915 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1732104 - OBJ
      ?auto_1732105 - OBJ
      ?auto_1732106 - OBJ
      ?auto_1732107 - OBJ
      ?auto_1732103 - LOCATION
    )
    :vars
    (
      ?auto_1732109 - LOCATION
      ?auto_1732112 - CITY
      ?auto_1732108 - LOCATION
      ?auto_1732111 - LOCATION
      ?auto_1732110 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1732109 ?auto_1732112 ) ( IN-CITY ?auto_1732103 ?auto_1732112 ) ( not ( = ?auto_1732103 ?auto_1732109 ) ) ( OBJ-AT ?auto_1732105 ?auto_1732109 ) ( IN-CITY ?auto_1732108 ?auto_1732112 ) ( not ( = ?auto_1732103 ?auto_1732108 ) ) ( OBJ-AT ?auto_1732107 ?auto_1732108 ) ( IN-CITY ?auto_1732111 ?auto_1732112 ) ( not ( = ?auto_1732103 ?auto_1732111 ) ) ( OBJ-AT ?auto_1732104 ?auto_1732111 ) ( OBJ-AT ?auto_1732106 ?auto_1732108 ) ( TRUCK-AT ?auto_1732110 ?auto_1732103 ) ( not ( = ?auto_1732106 ?auto_1732104 ) ) ( not ( = ?auto_1732111 ?auto_1732108 ) ) ( not ( = ?auto_1732106 ?auto_1732107 ) ) ( not ( = ?auto_1732104 ?auto_1732107 ) ) ( not ( = ?auto_1732106 ?auto_1732105 ) ) ( not ( = ?auto_1732104 ?auto_1732105 ) ) ( not ( = ?auto_1732107 ?auto_1732105 ) ) ( not ( = ?auto_1732109 ?auto_1732108 ) ) ( not ( = ?auto_1732109 ?auto_1732111 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1732106 ?auto_1732104 ?auto_1732105 ?auto_1732107 ?auto_1732103 )
      ( DELIVER-4PKG-VERIFY ?auto_1732104 ?auto_1732105 ?auto_1732106 ?auto_1732107 ?auto_1732103 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1747063 - OBJ
      ?auto_1747064 - OBJ
      ?auto_1747065 - OBJ
      ?auto_1747066 - OBJ
      ?auto_1747067 - OBJ
      ?auto_1747062 - LOCATION
    )
    :vars
    (
      ?auto_1747070 - LOCATION
      ?auto_1747069 - CITY
      ?auto_1747072 - LOCATION
      ?auto_1747071 - LOCATION
      ?auto_1747073 - LOCATION
      ?auto_1747068 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1747070 ?auto_1747069 ) ( IN-CITY ?auto_1747062 ?auto_1747069 ) ( not ( = ?auto_1747062 ?auto_1747070 ) ) ( OBJ-AT ?auto_1747067 ?auto_1747070 ) ( IN-CITY ?auto_1747072 ?auto_1747069 ) ( not ( = ?auto_1747062 ?auto_1747072 ) ) ( OBJ-AT ?auto_1747066 ?auto_1747072 ) ( IN-CITY ?auto_1747071 ?auto_1747069 ) ( not ( = ?auto_1747062 ?auto_1747071 ) ) ( OBJ-AT ?auto_1747065 ?auto_1747071 ) ( IN-CITY ?auto_1747073 ?auto_1747069 ) ( not ( = ?auto_1747062 ?auto_1747073 ) ) ( OBJ-AT ?auto_1747064 ?auto_1747073 ) ( OBJ-AT ?auto_1747063 ?auto_1747071 ) ( TRUCK-AT ?auto_1747068 ?auto_1747062 ) ( not ( = ?auto_1747063 ?auto_1747064 ) ) ( not ( = ?auto_1747073 ?auto_1747071 ) ) ( not ( = ?auto_1747063 ?auto_1747065 ) ) ( not ( = ?auto_1747064 ?auto_1747065 ) ) ( not ( = ?auto_1747063 ?auto_1747066 ) ) ( not ( = ?auto_1747064 ?auto_1747066 ) ) ( not ( = ?auto_1747065 ?auto_1747066 ) ) ( not ( = ?auto_1747072 ?auto_1747071 ) ) ( not ( = ?auto_1747072 ?auto_1747073 ) ) ( not ( = ?auto_1747063 ?auto_1747067 ) ) ( not ( = ?auto_1747064 ?auto_1747067 ) ) ( not ( = ?auto_1747065 ?auto_1747067 ) ) ( not ( = ?auto_1747066 ?auto_1747067 ) ) ( not ( = ?auto_1747070 ?auto_1747072 ) ) ( not ( = ?auto_1747070 ?auto_1747071 ) ) ( not ( = ?auto_1747070 ?auto_1747073 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1747063 ?auto_1747064 ?auto_1747066 ?auto_1747065 ?auto_1747062 )
      ( DELIVER-1PKG ?auto_1747067 ?auto_1747062 )
      ( DELIVER-5PKG-VERIFY ?auto_1747063 ?auto_1747064 ?auto_1747065 ?auto_1747066 ?auto_1747067 ?auto_1747062 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1747159 - OBJ
      ?auto_1747160 - OBJ
      ?auto_1747161 - OBJ
      ?auto_1747162 - OBJ
      ?auto_1747163 - OBJ
      ?auto_1747158 - LOCATION
    )
    :vars
    (
      ?auto_1747165 - LOCATION
      ?auto_1747167 - CITY
      ?auto_1747168 - LOCATION
      ?auto_1747164 - LOCATION
      ?auto_1747166 - LOCATION
      ?auto_1747169 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1747165 ?auto_1747167 ) ( IN-CITY ?auto_1747158 ?auto_1747167 ) ( not ( = ?auto_1747158 ?auto_1747165 ) ) ( OBJ-AT ?auto_1747163 ?auto_1747165 ) ( IN-CITY ?auto_1747168 ?auto_1747167 ) ( not ( = ?auto_1747158 ?auto_1747168 ) ) ( OBJ-AT ?auto_1747161 ?auto_1747168 ) ( IN-CITY ?auto_1747164 ?auto_1747167 ) ( not ( = ?auto_1747158 ?auto_1747164 ) ) ( OBJ-AT ?auto_1747162 ?auto_1747164 ) ( IN-CITY ?auto_1747166 ?auto_1747167 ) ( not ( = ?auto_1747158 ?auto_1747166 ) ) ( OBJ-AT ?auto_1747160 ?auto_1747166 ) ( OBJ-AT ?auto_1747159 ?auto_1747164 ) ( TRUCK-AT ?auto_1747169 ?auto_1747158 ) ( not ( = ?auto_1747159 ?auto_1747160 ) ) ( not ( = ?auto_1747166 ?auto_1747164 ) ) ( not ( = ?auto_1747159 ?auto_1747162 ) ) ( not ( = ?auto_1747160 ?auto_1747162 ) ) ( not ( = ?auto_1747159 ?auto_1747161 ) ) ( not ( = ?auto_1747160 ?auto_1747161 ) ) ( not ( = ?auto_1747162 ?auto_1747161 ) ) ( not ( = ?auto_1747168 ?auto_1747164 ) ) ( not ( = ?auto_1747168 ?auto_1747166 ) ) ( not ( = ?auto_1747159 ?auto_1747163 ) ) ( not ( = ?auto_1747160 ?auto_1747163 ) ) ( not ( = ?auto_1747162 ?auto_1747163 ) ) ( not ( = ?auto_1747161 ?auto_1747163 ) ) ( not ( = ?auto_1747165 ?auto_1747168 ) ) ( not ( = ?auto_1747165 ?auto_1747164 ) ) ( not ( = ?auto_1747165 ?auto_1747166 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1747159 ?auto_1747160 ?auto_1747162 ?auto_1747161 ?auto_1747163 ?auto_1747158 )
      ( DELIVER-5PKG-VERIFY ?auto_1747159 ?auto_1747160 ?auto_1747161 ?auto_1747162 ?auto_1747163 ?auto_1747158 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1747210 - OBJ
      ?auto_1747211 - OBJ
      ?auto_1747212 - OBJ
      ?auto_1747213 - OBJ
      ?auto_1747214 - OBJ
      ?auto_1747209 - LOCATION
    )
    :vars
    (
      ?auto_1747218 - LOCATION
      ?auto_1747220 - CITY
      ?auto_1747217 - LOCATION
      ?auto_1747219 - LOCATION
      ?auto_1747215 - LOCATION
      ?auto_1747216 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1747218 ?auto_1747220 ) ( IN-CITY ?auto_1747209 ?auto_1747220 ) ( not ( = ?auto_1747209 ?auto_1747218 ) ) ( OBJ-AT ?auto_1747213 ?auto_1747218 ) ( IN-CITY ?auto_1747217 ?auto_1747220 ) ( not ( = ?auto_1747209 ?auto_1747217 ) ) ( OBJ-AT ?auto_1747212 ?auto_1747217 ) ( IN-CITY ?auto_1747219 ?auto_1747220 ) ( not ( = ?auto_1747209 ?auto_1747219 ) ) ( OBJ-AT ?auto_1747214 ?auto_1747219 ) ( IN-CITY ?auto_1747215 ?auto_1747220 ) ( not ( = ?auto_1747209 ?auto_1747215 ) ) ( OBJ-AT ?auto_1747211 ?auto_1747215 ) ( OBJ-AT ?auto_1747210 ?auto_1747219 ) ( TRUCK-AT ?auto_1747216 ?auto_1747209 ) ( not ( = ?auto_1747210 ?auto_1747211 ) ) ( not ( = ?auto_1747215 ?auto_1747219 ) ) ( not ( = ?auto_1747210 ?auto_1747214 ) ) ( not ( = ?auto_1747211 ?auto_1747214 ) ) ( not ( = ?auto_1747210 ?auto_1747212 ) ) ( not ( = ?auto_1747211 ?auto_1747212 ) ) ( not ( = ?auto_1747214 ?auto_1747212 ) ) ( not ( = ?auto_1747217 ?auto_1747219 ) ) ( not ( = ?auto_1747217 ?auto_1747215 ) ) ( not ( = ?auto_1747210 ?auto_1747213 ) ) ( not ( = ?auto_1747211 ?auto_1747213 ) ) ( not ( = ?auto_1747214 ?auto_1747213 ) ) ( not ( = ?auto_1747212 ?auto_1747213 ) ) ( not ( = ?auto_1747218 ?auto_1747217 ) ) ( not ( = ?auto_1747218 ?auto_1747219 ) ) ( not ( = ?auto_1747218 ?auto_1747215 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1747210 ?auto_1747211 ?auto_1747212 ?auto_1747214 ?auto_1747213 ?auto_1747209 )
      ( DELIVER-5PKG-VERIFY ?auto_1747210 ?auto_1747211 ?auto_1747212 ?auto_1747213 ?auto_1747214 ?auto_1747209 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1747729 - OBJ
      ?auto_1747730 - OBJ
      ?auto_1747731 - OBJ
      ?auto_1747732 - OBJ
      ?auto_1747733 - OBJ
      ?auto_1747728 - LOCATION
    )
    :vars
    (
      ?auto_1747737 - LOCATION
      ?auto_1747739 - CITY
      ?auto_1747736 - LOCATION
      ?auto_1747738 - LOCATION
      ?auto_1747734 - LOCATION
      ?auto_1747735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1747737 ?auto_1747739 ) ( IN-CITY ?auto_1747728 ?auto_1747739 ) ( not ( = ?auto_1747728 ?auto_1747737 ) ) ( OBJ-AT ?auto_1747733 ?auto_1747737 ) ( IN-CITY ?auto_1747736 ?auto_1747739 ) ( not ( = ?auto_1747728 ?auto_1747736 ) ) ( OBJ-AT ?auto_1747732 ?auto_1747736 ) ( IN-CITY ?auto_1747738 ?auto_1747739 ) ( not ( = ?auto_1747728 ?auto_1747738 ) ) ( OBJ-AT ?auto_1747730 ?auto_1747738 ) ( IN-CITY ?auto_1747734 ?auto_1747739 ) ( not ( = ?auto_1747728 ?auto_1747734 ) ) ( OBJ-AT ?auto_1747731 ?auto_1747734 ) ( OBJ-AT ?auto_1747729 ?auto_1747738 ) ( TRUCK-AT ?auto_1747735 ?auto_1747728 ) ( not ( = ?auto_1747729 ?auto_1747731 ) ) ( not ( = ?auto_1747734 ?auto_1747738 ) ) ( not ( = ?auto_1747729 ?auto_1747730 ) ) ( not ( = ?auto_1747731 ?auto_1747730 ) ) ( not ( = ?auto_1747729 ?auto_1747732 ) ) ( not ( = ?auto_1747731 ?auto_1747732 ) ) ( not ( = ?auto_1747730 ?auto_1747732 ) ) ( not ( = ?auto_1747736 ?auto_1747738 ) ) ( not ( = ?auto_1747736 ?auto_1747734 ) ) ( not ( = ?auto_1747729 ?auto_1747733 ) ) ( not ( = ?auto_1747731 ?auto_1747733 ) ) ( not ( = ?auto_1747730 ?auto_1747733 ) ) ( not ( = ?auto_1747732 ?auto_1747733 ) ) ( not ( = ?auto_1747737 ?auto_1747736 ) ) ( not ( = ?auto_1747737 ?auto_1747738 ) ) ( not ( = ?auto_1747737 ?auto_1747734 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1747729 ?auto_1747731 ?auto_1747732 ?auto_1747730 ?auto_1747733 ?auto_1747728 )
      ( DELIVER-5PKG-VERIFY ?auto_1747729 ?auto_1747730 ?auto_1747731 ?auto_1747732 ?auto_1747733 ?auto_1747728 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1751053 - OBJ
      ?auto_1751054 - OBJ
      ?auto_1751055 - OBJ
      ?auto_1751056 - OBJ
      ?auto_1751057 - OBJ
      ?auto_1751052 - LOCATION
    )
    :vars
    (
      ?auto_1751061 - LOCATION
      ?auto_1751063 - CITY
      ?auto_1751060 - LOCATION
      ?auto_1751062 - LOCATION
      ?auto_1751058 - LOCATION
      ?auto_1751059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1751061 ?auto_1751063 ) ( IN-CITY ?auto_1751052 ?auto_1751063 ) ( not ( = ?auto_1751052 ?auto_1751061 ) ) ( OBJ-AT ?auto_1751057 ?auto_1751061 ) ( IN-CITY ?auto_1751060 ?auto_1751063 ) ( not ( = ?auto_1751052 ?auto_1751060 ) ) ( OBJ-AT ?auto_1751056 ?auto_1751060 ) ( IN-CITY ?auto_1751062 ?auto_1751063 ) ( not ( = ?auto_1751052 ?auto_1751062 ) ) ( OBJ-AT ?auto_1751055 ?auto_1751062 ) ( IN-CITY ?auto_1751058 ?auto_1751063 ) ( not ( = ?auto_1751052 ?auto_1751058 ) ) ( OBJ-AT ?auto_1751053 ?auto_1751058 ) ( OBJ-AT ?auto_1751054 ?auto_1751062 ) ( TRUCK-AT ?auto_1751059 ?auto_1751052 ) ( not ( = ?auto_1751054 ?auto_1751053 ) ) ( not ( = ?auto_1751058 ?auto_1751062 ) ) ( not ( = ?auto_1751054 ?auto_1751055 ) ) ( not ( = ?auto_1751053 ?auto_1751055 ) ) ( not ( = ?auto_1751054 ?auto_1751056 ) ) ( not ( = ?auto_1751053 ?auto_1751056 ) ) ( not ( = ?auto_1751055 ?auto_1751056 ) ) ( not ( = ?auto_1751060 ?auto_1751062 ) ) ( not ( = ?auto_1751060 ?auto_1751058 ) ) ( not ( = ?auto_1751054 ?auto_1751057 ) ) ( not ( = ?auto_1751053 ?auto_1751057 ) ) ( not ( = ?auto_1751055 ?auto_1751057 ) ) ( not ( = ?auto_1751056 ?auto_1751057 ) ) ( not ( = ?auto_1751061 ?auto_1751060 ) ) ( not ( = ?auto_1751061 ?auto_1751062 ) ) ( not ( = ?auto_1751061 ?auto_1751058 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1751054 ?auto_1751053 ?auto_1751056 ?auto_1751055 ?auto_1751057 ?auto_1751052 )
      ( DELIVER-5PKG-VERIFY ?auto_1751053 ?auto_1751054 ?auto_1751055 ?auto_1751056 ?auto_1751057 ?auto_1751052 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1751149 - OBJ
      ?auto_1751150 - OBJ
      ?auto_1751151 - OBJ
      ?auto_1751152 - OBJ
      ?auto_1751153 - OBJ
      ?auto_1751148 - LOCATION
    )
    :vars
    (
      ?auto_1751157 - LOCATION
      ?auto_1751159 - CITY
      ?auto_1751156 - LOCATION
      ?auto_1751158 - LOCATION
      ?auto_1751154 - LOCATION
      ?auto_1751155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1751157 ?auto_1751159 ) ( IN-CITY ?auto_1751148 ?auto_1751159 ) ( not ( = ?auto_1751148 ?auto_1751157 ) ) ( OBJ-AT ?auto_1751153 ?auto_1751157 ) ( IN-CITY ?auto_1751156 ?auto_1751159 ) ( not ( = ?auto_1751148 ?auto_1751156 ) ) ( OBJ-AT ?auto_1751151 ?auto_1751156 ) ( IN-CITY ?auto_1751158 ?auto_1751159 ) ( not ( = ?auto_1751148 ?auto_1751158 ) ) ( OBJ-AT ?auto_1751152 ?auto_1751158 ) ( IN-CITY ?auto_1751154 ?auto_1751159 ) ( not ( = ?auto_1751148 ?auto_1751154 ) ) ( OBJ-AT ?auto_1751149 ?auto_1751154 ) ( OBJ-AT ?auto_1751150 ?auto_1751158 ) ( TRUCK-AT ?auto_1751155 ?auto_1751148 ) ( not ( = ?auto_1751150 ?auto_1751149 ) ) ( not ( = ?auto_1751154 ?auto_1751158 ) ) ( not ( = ?auto_1751150 ?auto_1751152 ) ) ( not ( = ?auto_1751149 ?auto_1751152 ) ) ( not ( = ?auto_1751150 ?auto_1751151 ) ) ( not ( = ?auto_1751149 ?auto_1751151 ) ) ( not ( = ?auto_1751152 ?auto_1751151 ) ) ( not ( = ?auto_1751156 ?auto_1751158 ) ) ( not ( = ?auto_1751156 ?auto_1751154 ) ) ( not ( = ?auto_1751150 ?auto_1751153 ) ) ( not ( = ?auto_1751149 ?auto_1751153 ) ) ( not ( = ?auto_1751152 ?auto_1751153 ) ) ( not ( = ?auto_1751151 ?auto_1751153 ) ) ( not ( = ?auto_1751157 ?auto_1751156 ) ) ( not ( = ?auto_1751157 ?auto_1751158 ) ) ( not ( = ?auto_1751157 ?auto_1751154 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1751150 ?auto_1751149 ?auto_1751151 ?auto_1751152 ?auto_1751153 ?auto_1751148 )
      ( DELIVER-5PKG-VERIFY ?auto_1751149 ?auto_1751150 ?auto_1751151 ?auto_1751152 ?auto_1751153 ?auto_1751148 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1751200 - OBJ
      ?auto_1751201 - OBJ
      ?auto_1751202 - OBJ
      ?auto_1751203 - OBJ
      ?auto_1751204 - OBJ
      ?auto_1751199 - LOCATION
    )
    :vars
    (
      ?auto_1751208 - LOCATION
      ?auto_1751210 - CITY
      ?auto_1751207 - LOCATION
      ?auto_1751209 - LOCATION
      ?auto_1751205 - LOCATION
      ?auto_1751206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1751208 ?auto_1751210 ) ( IN-CITY ?auto_1751199 ?auto_1751210 ) ( not ( = ?auto_1751199 ?auto_1751208 ) ) ( OBJ-AT ?auto_1751203 ?auto_1751208 ) ( IN-CITY ?auto_1751207 ?auto_1751210 ) ( not ( = ?auto_1751199 ?auto_1751207 ) ) ( OBJ-AT ?auto_1751202 ?auto_1751207 ) ( IN-CITY ?auto_1751209 ?auto_1751210 ) ( not ( = ?auto_1751199 ?auto_1751209 ) ) ( OBJ-AT ?auto_1751204 ?auto_1751209 ) ( IN-CITY ?auto_1751205 ?auto_1751210 ) ( not ( = ?auto_1751199 ?auto_1751205 ) ) ( OBJ-AT ?auto_1751200 ?auto_1751205 ) ( OBJ-AT ?auto_1751201 ?auto_1751209 ) ( TRUCK-AT ?auto_1751206 ?auto_1751199 ) ( not ( = ?auto_1751201 ?auto_1751200 ) ) ( not ( = ?auto_1751205 ?auto_1751209 ) ) ( not ( = ?auto_1751201 ?auto_1751204 ) ) ( not ( = ?auto_1751200 ?auto_1751204 ) ) ( not ( = ?auto_1751201 ?auto_1751202 ) ) ( not ( = ?auto_1751200 ?auto_1751202 ) ) ( not ( = ?auto_1751204 ?auto_1751202 ) ) ( not ( = ?auto_1751207 ?auto_1751209 ) ) ( not ( = ?auto_1751207 ?auto_1751205 ) ) ( not ( = ?auto_1751201 ?auto_1751203 ) ) ( not ( = ?auto_1751200 ?auto_1751203 ) ) ( not ( = ?auto_1751204 ?auto_1751203 ) ) ( not ( = ?auto_1751202 ?auto_1751203 ) ) ( not ( = ?auto_1751208 ?auto_1751207 ) ) ( not ( = ?auto_1751208 ?auto_1751209 ) ) ( not ( = ?auto_1751208 ?auto_1751205 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1751201 ?auto_1751200 ?auto_1751202 ?auto_1751204 ?auto_1751203 ?auto_1751199 )
      ( DELIVER-5PKG-VERIFY ?auto_1751200 ?auto_1751201 ?auto_1751202 ?auto_1751203 ?auto_1751204 ?auto_1751199 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1753197 - OBJ
      ?auto_1753198 - OBJ
      ?auto_1753199 - OBJ
      ?auto_1753200 - OBJ
      ?auto_1753201 - OBJ
      ?auto_1753196 - LOCATION
    )
    :vars
    (
      ?auto_1753205 - LOCATION
      ?auto_1753207 - CITY
      ?auto_1753204 - LOCATION
      ?auto_1753206 - LOCATION
      ?auto_1753202 - LOCATION
      ?auto_1753203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1753205 ?auto_1753207 ) ( IN-CITY ?auto_1753196 ?auto_1753207 ) ( not ( = ?auto_1753196 ?auto_1753205 ) ) ( OBJ-AT ?auto_1753201 ?auto_1753205 ) ( IN-CITY ?auto_1753204 ?auto_1753207 ) ( not ( = ?auto_1753196 ?auto_1753204 ) ) ( OBJ-AT ?auto_1753198 ?auto_1753204 ) ( IN-CITY ?auto_1753206 ?auto_1753207 ) ( not ( = ?auto_1753196 ?auto_1753206 ) ) ( OBJ-AT ?auto_1753200 ?auto_1753206 ) ( IN-CITY ?auto_1753202 ?auto_1753207 ) ( not ( = ?auto_1753196 ?auto_1753202 ) ) ( OBJ-AT ?auto_1753197 ?auto_1753202 ) ( OBJ-AT ?auto_1753199 ?auto_1753206 ) ( TRUCK-AT ?auto_1753203 ?auto_1753196 ) ( not ( = ?auto_1753199 ?auto_1753197 ) ) ( not ( = ?auto_1753202 ?auto_1753206 ) ) ( not ( = ?auto_1753199 ?auto_1753200 ) ) ( not ( = ?auto_1753197 ?auto_1753200 ) ) ( not ( = ?auto_1753199 ?auto_1753198 ) ) ( not ( = ?auto_1753197 ?auto_1753198 ) ) ( not ( = ?auto_1753200 ?auto_1753198 ) ) ( not ( = ?auto_1753204 ?auto_1753206 ) ) ( not ( = ?auto_1753204 ?auto_1753202 ) ) ( not ( = ?auto_1753199 ?auto_1753201 ) ) ( not ( = ?auto_1753197 ?auto_1753201 ) ) ( not ( = ?auto_1753200 ?auto_1753201 ) ) ( not ( = ?auto_1753198 ?auto_1753201 ) ) ( not ( = ?auto_1753205 ?auto_1753204 ) ) ( not ( = ?auto_1753205 ?auto_1753206 ) ) ( not ( = ?auto_1753205 ?auto_1753202 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1753199 ?auto_1753197 ?auto_1753198 ?auto_1753200 ?auto_1753201 ?auto_1753196 )
      ( DELIVER-5PKG-VERIFY ?auto_1753197 ?auto_1753198 ?auto_1753199 ?auto_1753200 ?auto_1753201 ?auto_1753196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1753248 - OBJ
      ?auto_1753249 - OBJ
      ?auto_1753250 - OBJ
      ?auto_1753251 - OBJ
      ?auto_1753252 - OBJ
      ?auto_1753247 - LOCATION
    )
    :vars
    (
      ?auto_1753256 - LOCATION
      ?auto_1753258 - CITY
      ?auto_1753255 - LOCATION
      ?auto_1753257 - LOCATION
      ?auto_1753253 - LOCATION
      ?auto_1753254 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1753256 ?auto_1753258 ) ( IN-CITY ?auto_1753247 ?auto_1753258 ) ( not ( = ?auto_1753247 ?auto_1753256 ) ) ( OBJ-AT ?auto_1753251 ?auto_1753256 ) ( IN-CITY ?auto_1753255 ?auto_1753258 ) ( not ( = ?auto_1753247 ?auto_1753255 ) ) ( OBJ-AT ?auto_1753249 ?auto_1753255 ) ( IN-CITY ?auto_1753257 ?auto_1753258 ) ( not ( = ?auto_1753247 ?auto_1753257 ) ) ( OBJ-AT ?auto_1753252 ?auto_1753257 ) ( IN-CITY ?auto_1753253 ?auto_1753258 ) ( not ( = ?auto_1753247 ?auto_1753253 ) ) ( OBJ-AT ?auto_1753248 ?auto_1753253 ) ( OBJ-AT ?auto_1753250 ?auto_1753257 ) ( TRUCK-AT ?auto_1753254 ?auto_1753247 ) ( not ( = ?auto_1753250 ?auto_1753248 ) ) ( not ( = ?auto_1753253 ?auto_1753257 ) ) ( not ( = ?auto_1753250 ?auto_1753252 ) ) ( not ( = ?auto_1753248 ?auto_1753252 ) ) ( not ( = ?auto_1753250 ?auto_1753249 ) ) ( not ( = ?auto_1753248 ?auto_1753249 ) ) ( not ( = ?auto_1753252 ?auto_1753249 ) ) ( not ( = ?auto_1753255 ?auto_1753257 ) ) ( not ( = ?auto_1753255 ?auto_1753253 ) ) ( not ( = ?auto_1753250 ?auto_1753251 ) ) ( not ( = ?auto_1753248 ?auto_1753251 ) ) ( not ( = ?auto_1753252 ?auto_1753251 ) ) ( not ( = ?auto_1753249 ?auto_1753251 ) ) ( not ( = ?auto_1753256 ?auto_1753255 ) ) ( not ( = ?auto_1753256 ?auto_1753257 ) ) ( not ( = ?auto_1753256 ?auto_1753253 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1753250 ?auto_1753248 ?auto_1753249 ?auto_1753252 ?auto_1753251 ?auto_1753247 )
      ( DELIVER-5PKG-VERIFY ?auto_1753248 ?auto_1753249 ?auto_1753250 ?auto_1753251 ?auto_1753252 ?auto_1753247 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1753659 - OBJ
      ?auto_1753660 - OBJ
      ?auto_1753661 - OBJ
      ?auto_1753662 - OBJ
      ?auto_1753663 - OBJ
      ?auto_1753658 - LOCATION
    )
    :vars
    (
      ?auto_1753667 - LOCATION
      ?auto_1753669 - CITY
      ?auto_1753666 - LOCATION
      ?auto_1753668 - LOCATION
      ?auto_1753664 - LOCATION
      ?auto_1753665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1753667 ?auto_1753669 ) ( IN-CITY ?auto_1753658 ?auto_1753669 ) ( not ( = ?auto_1753658 ?auto_1753667 ) ) ( OBJ-AT ?auto_1753661 ?auto_1753667 ) ( IN-CITY ?auto_1753666 ?auto_1753669 ) ( not ( = ?auto_1753658 ?auto_1753666 ) ) ( OBJ-AT ?auto_1753660 ?auto_1753666 ) ( IN-CITY ?auto_1753668 ?auto_1753669 ) ( not ( = ?auto_1753658 ?auto_1753668 ) ) ( OBJ-AT ?auto_1753663 ?auto_1753668 ) ( IN-CITY ?auto_1753664 ?auto_1753669 ) ( not ( = ?auto_1753658 ?auto_1753664 ) ) ( OBJ-AT ?auto_1753659 ?auto_1753664 ) ( OBJ-AT ?auto_1753662 ?auto_1753668 ) ( TRUCK-AT ?auto_1753665 ?auto_1753658 ) ( not ( = ?auto_1753662 ?auto_1753659 ) ) ( not ( = ?auto_1753664 ?auto_1753668 ) ) ( not ( = ?auto_1753662 ?auto_1753663 ) ) ( not ( = ?auto_1753659 ?auto_1753663 ) ) ( not ( = ?auto_1753662 ?auto_1753660 ) ) ( not ( = ?auto_1753659 ?auto_1753660 ) ) ( not ( = ?auto_1753663 ?auto_1753660 ) ) ( not ( = ?auto_1753666 ?auto_1753668 ) ) ( not ( = ?auto_1753666 ?auto_1753664 ) ) ( not ( = ?auto_1753662 ?auto_1753661 ) ) ( not ( = ?auto_1753659 ?auto_1753661 ) ) ( not ( = ?auto_1753663 ?auto_1753661 ) ) ( not ( = ?auto_1753660 ?auto_1753661 ) ) ( not ( = ?auto_1753667 ?auto_1753666 ) ) ( not ( = ?auto_1753667 ?auto_1753668 ) ) ( not ( = ?auto_1753667 ?auto_1753664 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1753662 ?auto_1753659 ?auto_1753660 ?auto_1753663 ?auto_1753661 ?auto_1753658 )
      ( DELIVER-5PKG-VERIFY ?auto_1753659 ?auto_1753660 ?auto_1753661 ?auto_1753662 ?auto_1753663 ?auto_1753658 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2005197 - OBJ
      ?auto_2005198 - OBJ
      ?auto_2005199 - OBJ
      ?auto_2005200 - OBJ
      ?auto_2005201 - OBJ
      ?auto_2005202 - OBJ
      ?auto_2005196 - LOCATION
    )
    :vars
    (
      ?auto_2005205 - LOCATION
      ?auto_2005204 - CITY
      ?auto_2005208 - LOCATION
      ?auto_2005207 - LOCATION
      ?auto_2005209 - LOCATION
      ?auto_2005206 - LOCATION
      ?auto_2005203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2005205 ?auto_2005204 ) ( IN-CITY ?auto_2005196 ?auto_2005204 ) ( not ( = ?auto_2005196 ?auto_2005205 ) ) ( OBJ-AT ?auto_2005202 ?auto_2005205 ) ( IN-CITY ?auto_2005208 ?auto_2005204 ) ( not ( = ?auto_2005196 ?auto_2005208 ) ) ( OBJ-AT ?auto_2005201 ?auto_2005208 ) ( IN-CITY ?auto_2005207 ?auto_2005204 ) ( not ( = ?auto_2005196 ?auto_2005207 ) ) ( OBJ-AT ?auto_2005200 ?auto_2005207 ) ( IN-CITY ?auto_2005209 ?auto_2005204 ) ( not ( = ?auto_2005196 ?auto_2005209 ) ) ( OBJ-AT ?auto_2005199 ?auto_2005209 ) ( IN-CITY ?auto_2005206 ?auto_2005204 ) ( not ( = ?auto_2005196 ?auto_2005206 ) ) ( OBJ-AT ?auto_2005198 ?auto_2005206 ) ( OBJ-AT ?auto_2005197 ?auto_2005209 ) ( TRUCK-AT ?auto_2005203 ?auto_2005196 ) ( not ( = ?auto_2005197 ?auto_2005198 ) ) ( not ( = ?auto_2005206 ?auto_2005209 ) ) ( not ( = ?auto_2005197 ?auto_2005199 ) ) ( not ( = ?auto_2005198 ?auto_2005199 ) ) ( not ( = ?auto_2005197 ?auto_2005200 ) ) ( not ( = ?auto_2005198 ?auto_2005200 ) ) ( not ( = ?auto_2005199 ?auto_2005200 ) ) ( not ( = ?auto_2005207 ?auto_2005209 ) ) ( not ( = ?auto_2005207 ?auto_2005206 ) ) ( not ( = ?auto_2005197 ?auto_2005201 ) ) ( not ( = ?auto_2005198 ?auto_2005201 ) ) ( not ( = ?auto_2005199 ?auto_2005201 ) ) ( not ( = ?auto_2005200 ?auto_2005201 ) ) ( not ( = ?auto_2005208 ?auto_2005207 ) ) ( not ( = ?auto_2005208 ?auto_2005209 ) ) ( not ( = ?auto_2005208 ?auto_2005206 ) ) ( not ( = ?auto_2005197 ?auto_2005202 ) ) ( not ( = ?auto_2005198 ?auto_2005202 ) ) ( not ( = ?auto_2005199 ?auto_2005202 ) ) ( not ( = ?auto_2005200 ?auto_2005202 ) ) ( not ( = ?auto_2005201 ?auto_2005202 ) ) ( not ( = ?auto_2005205 ?auto_2005208 ) ) ( not ( = ?auto_2005205 ?auto_2005207 ) ) ( not ( = ?auto_2005205 ?auto_2005209 ) ) ( not ( = ?auto_2005205 ?auto_2005206 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2005197 ?auto_2005198 ?auto_2005200 ?auto_2005199 ?auto_2005201 ?auto_2005196 )
      ( DELIVER-1PKG ?auto_2005202 ?auto_2005196 )
      ( DELIVER-6PKG-VERIFY ?auto_2005197 ?auto_2005198 ?auto_2005199 ?auto_2005200 ?auto_2005201 ?auto_2005202 ?auto_2005196 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2006386 - OBJ
      ?auto_2006387 - OBJ
      ?auto_2006388 - OBJ
      ?auto_2006389 - OBJ
      ?auto_2006390 - OBJ
      ?auto_2006391 - OBJ
      ?auto_2006385 - LOCATION
    )
    :vars
    (
      ?auto_2006398 - LOCATION
      ?auto_2006397 - CITY
      ?auto_2006394 - LOCATION
      ?auto_2006393 - LOCATION
      ?auto_2006392 - LOCATION
      ?auto_2006395 - LOCATION
      ?auto_2006396 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2006398 ?auto_2006397 ) ( IN-CITY ?auto_2006385 ?auto_2006397 ) ( not ( = ?auto_2006385 ?auto_2006398 ) ) ( OBJ-AT ?auto_2006391 ?auto_2006398 ) ( IN-CITY ?auto_2006394 ?auto_2006397 ) ( not ( = ?auto_2006385 ?auto_2006394 ) ) ( OBJ-AT ?auto_2006390 ?auto_2006394 ) ( IN-CITY ?auto_2006393 ?auto_2006397 ) ( not ( = ?auto_2006385 ?auto_2006393 ) ) ( OBJ-AT ?auto_2006388 ?auto_2006393 ) ( IN-CITY ?auto_2006392 ?auto_2006397 ) ( not ( = ?auto_2006385 ?auto_2006392 ) ) ( OBJ-AT ?auto_2006389 ?auto_2006392 ) ( IN-CITY ?auto_2006395 ?auto_2006397 ) ( not ( = ?auto_2006385 ?auto_2006395 ) ) ( OBJ-AT ?auto_2006387 ?auto_2006395 ) ( OBJ-AT ?auto_2006386 ?auto_2006392 ) ( TRUCK-AT ?auto_2006396 ?auto_2006385 ) ( not ( = ?auto_2006386 ?auto_2006387 ) ) ( not ( = ?auto_2006395 ?auto_2006392 ) ) ( not ( = ?auto_2006386 ?auto_2006389 ) ) ( not ( = ?auto_2006387 ?auto_2006389 ) ) ( not ( = ?auto_2006386 ?auto_2006388 ) ) ( not ( = ?auto_2006387 ?auto_2006388 ) ) ( not ( = ?auto_2006389 ?auto_2006388 ) ) ( not ( = ?auto_2006393 ?auto_2006392 ) ) ( not ( = ?auto_2006393 ?auto_2006395 ) ) ( not ( = ?auto_2006386 ?auto_2006390 ) ) ( not ( = ?auto_2006387 ?auto_2006390 ) ) ( not ( = ?auto_2006389 ?auto_2006390 ) ) ( not ( = ?auto_2006388 ?auto_2006390 ) ) ( not ( = ?auto_2006394 ?auto_2006393 ) ) ( not ( = ?auto_2006394 ?auto_2006392 ) ) ( not ( = ?auto_2006394 ?auto_2006395 ) ) ( not ( = ?auto_2006386 ?auto_2006391 ) ) ( not ( = ?auto_2006387 ?auto_2006391 ) ) ( not ( = ?auto_2006389 ?auto_2006391 ) ) ( not ( = ?auto_2006388 ?auto_2006391 ) ) ( not ( = ?auto_2006390 ?auto_2006391 ) ) ( not ( = ?auto_2006398 ?auto_2006394 ) ) ( not ( = ?auto_2006398 ?auto_2006393 ) ) ( not ( = ?auto_2006398 ?auto_2006392 ) ) ( not ( = ?auto_2006398 ?auto_2006395 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2006386 ?auto_2006387 ?auto_2006389 ?auto_2006388 ?auto_2006390 ?auto_2006391 ?auto_2006385 )
      ( DELIVER-6PKG-VERIFY ?auto_2006386 ?auto_2006387 ?auto_2006388 ?auto_2006389 ?auto_2006390 ?auto_2006391 ?auto_2006385 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2006684 - OBJ
      ?auto_2006685 - OBJ
      ?auto_2006686 - OBJ
      ?auto_2006687 - OBJ
      ?auto_2006688 - OBJ
      ?auto_2006689 - OBJ
      ?auto_2006683 - LOCATION
    )
    :vars
    (
      ?auto_2006694 - LOCATION
      ?auto_2006695 - CITY
      ?auto_2006692 - LOCATION
      ?auto_2006691 - LOCATION
      ?auto_2006696 - LOCATION
      ?auto_2006693 - LOCATION
      ?auto_2006690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2006694 ?auto_2006695 ) ( IN-CITY ?auto_2006683 ?auto_2006695 ) ( not ( = ?auto_2006683 ?auto_2006694 ) ) ( OBJ-AT ?auto_2006689 ?auto_2006694 ) ( IN-CITY ?auto_2006692 ?auto_2006695 ) ( not ( = ?auto_2006683 ?auto_2006692 ) ) ( OBJ-AT ?auto_2006687 ?auto_2006692 ) ( IN-CITY ?auto_2006691 ?auto_2006695 ) ( not ( = ?auto_2006683 ?auto_2006691 ) ) ( OBJ-AT ?auto_2006686 ?auto_2006691 ) ( IN-CITY ?auto_2006696 ?auto_2006695 ) ( not ( = ?auto_2006683 ?auto_2006696 ) ) ( OBJ-AT ?auto_2006688 ?auto_2006696 ) ( IN-CITY ?auto_2006693 ?auto_2006695 ) ( not ( = ?auto_2006683 ?auto_2006693 ) ) ( OBJ-AT ?auto_2006685 ?auto_2006693 ) ( OBJ-AT ?auto_2006684 ?auto_2006696 ) ( TRUCK-AT ?auto_2006690 ?auto_2006683 ) ( not ( = ?auto_2006684 ?auto_2006685 ) ) ( not ( = ?auto_2006693 ?auto_2006696 ) ) ( not ( = ?auto_2006684 ?auto_2006688 ) ) ( not ( = ?auto_2006685 ?auto_2006688 ) ) ( not ( = ?auto_2006684 ?auto_2006686 ) ) ( not ( = ?auto_2006685 ?auto_2006686 ) ) ( not ( = ?auto_2006688 ?auto_2006686 ) ) ( not ( = ?auto_2006691 ?auto_2006696 ) ) ( not ( = ?auto_2006691 ?auto_2006693 ) ) ( not ( = ?auto_2006684 ?auto_2006687 ) ) ( not ( = ?auto_2006685 ?auto_2006687 ) ) ( not ( = ?auto_2006688 ?auto_2006687 ) ) ( not ( = ?auto_2006686 ?auto_2006687 ) ) ( not ( = ?auto_2006692 ?auto_2006691 ) ) ( not ( = ?auto_2006692 ?auto_2006696 ) ) ( not ( = ?auto_2006692 ?auto_2006693 ) ) ( not ( = ?auto_2006684 ?auto_2006689 ) ) ( not ( = ?auto_2006685 ?auto_2006689 ) ) ( not ( = ?auto_2006688 ?auto_2006689 ) ) ( not ( = ?auto_2006686 ?auto_2006689 ) ) ( not ( = ?auto_2006687 ?auto_2006689 ) ) ( not ( = ?auto_2006694 ?auto_2006692 ) ) ( not ( = ?auto_2006694 ?auto_2006691 ) ) ( not ( = ?auto_2006694 ?auto_2006696 ) ) ( not ( = ?auto_2006694 ?auto_2006693 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2006684 ?auto_2006685 ?auto_2006686 ?auto_2006688 ?auto_2006687 ?auto_2006689 ?auto_2006683 )
      ( DELIVER-6PKG-VERIFY ?auto_2006684 ?auto_2006685 ?auto_2006686 ?auto_2006687 ?auto_2006688 ?auto_2006689 ?auto_2006683 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2006758 - OBJ
      ?auto_2006759 - OBJ
      ?auto_2006760 - OBJ
      ?auto_2006761 - OBJ
      ?auto_2006762 - OBJ
      ?auto_2006763 - OBJ
      ?auto_2006757 - LOCATION
    )
    :vars
    (
      ?auto_2006768 - LOCATION
      ?auto_2006769 - CITY
      ?auto_2006766 - LOCATION
      ?auto_2006765 - LOCATION
      ?auto_2006770 - LOCATION
      ?auto_2006767 - LOCATION
      ?auto_2006764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2006768 ?auto_2006769 ) ( IN-CITY ?auto_2006757 ?auto_2006769 ) ( not ( = ?auto_2006757 ?auto_2006768 ) ) ( OBJ-AT ?auto_2006762 ?auto_2006768 ) ( IN-CITY ?auto_2006766 ?auto_2006769 ) ( not ( = ?auto_2006757 ?auto_2006766 ) ) ( OBJ-AT ?auto_2006761 ?auto_2006766 ) ( IN-CITY ?auto_2006765 ?auto_2006769 ) ( not ( = ?auto_2006757 ?auto_2006765 ) ) ( OBJ-AT ?auto_2006760 ?auto_2006765 ) ( IN-CITY ?auto_2006770 ?auto_2006769 ) ( not ( = ?auto_2006757 ?auto_2006770 ) ) ( OBJ-AT ?auto_2006763 ?auto_2006770 ) ( IN-CITY ?auto_2006767 ?auto_2006769 ) ( not ( = ?auto_2006757 ?auto_2006767 ) ) ( OBJ-AT ?auto_2006759 ?auto_2006767 ) ( OBJ-AT ?auto_2006758 ?auto_2006770 ) ( TRUCK-AT ?auto_2006764 ?auto_2006757 ) ( not ( = ?auto_2006758 ?auto_2006759 ) ) ( not ( = ?auto_2006767 ?auto_2006770 ) ) ( not ( = ?auto_2006758 ?auto_2006763 ) ) ( not ( = ?auto_2006759 ?auto_2006763 ) ) ( not ( = ?auto_2006758 ?auto_2006760 ) ) ( not ( = ?auto_2006759 ?auto_2006760 ) ) ( not ( = ?auto_2006763 ?auto_2006760 ) ) ( not ( = ?auto_2006765 ?auto_2006770 ) ) ( not ( = ?auto_2006765 ?auto_2006767 ) ) ( not ( = ?auto_2006758 ?auto_2006761 ) ) ( not ( = ?auto_2006759 ?auto_2006761 ) ) ( not ( = ?auto_2006763 ?auto_2006761 ) ) ( not ( = ?auto_2006760 ?auto_2006761 ) ) ( not ( = ?auto_2006766 ?auto_2006765 ) ) ( not ( = ?auto_2006766 ?auto_2006770 ) ) ( not ( = ?auto_2006766 ?auto_2006767 ) ) ( not ( = ?auto_2006758 ?auto_2006762 ) ) ( not ( = ?auto_2006759 ?auto_2006762 ) ) ( not ( = ?auto_2006763 ?auto_2006762 ) ) ( not ( = ?auto_2006760 ?auto_2006762 ) ) ( not ( = ?auto_2006761 ?auto_2006762 ) ) ( not ( = ?auto_2006768 ?auto_2006766 ) ) ( not ( = ?auto_2006768 ?auto_2006765 ) ) ( not ( = ?auto_2006768 ?auto_2006770 ) ) ( not ( = ?auto_2006768 ?auto_2006767 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2006758 ?auto_2006759 ?auto_2006760 ?auto_2006763 ?auto_2006761 ?auto_2006762 ?auto_2006757 )
      ( DELIVER-6PKG-VERIFY ?auto_2006758 ?auto_2006759 ?auto_2006760 ?auto_2006761 ?auto_2006762 ?auto_2006763 ?auto_2006757 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2014101 - OBJ
      ?auto_2014102 - OBJ
      ?auto_2014103 - OBJ
      ?auto_2014104 - OBJ
      ?auto_2014105 - OBJ
      ?auto_2014106 - OBJ
      ?auto_2014100 - LOCATION
    )
    :vars
    (
      ?auto_2014111 - LOCATION
      ?auto_2014112 - CITY
      ?auto_2014109 - LOCATION
      ?auto_2014108 - LOCATION
      ?auto_2014113 - LOCATION
      ?auto_2014110 - LOCATION
      ?auto_2014107 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2014111 ?auto_2014112 ) ( IN-CITY ?auto_2014100 ?auto_2014112 ) ( not ( = ?auto_2014100 ?auto_2014111 ) ) ( OBJ-AT ?auto_2014106 ?auto_2014111 ) ( IN-CITY ?auto_2014109 ?auto_2014112 ) ( not ( = ?auto_2014100 ?auto_2014109 ) ) ( OBJ-AT ?auto_2014105 ?auto_2014109 ) ( IN-CITY ?auto_2014108 ?auto_2014112 ) ( not ( = ?auto_2014100 ?auto_2014108 ) ) ( OBJ-AT ?auto_2014104 ?auto_2014108 ) ( IN-CITY ?auto_2014113 ?auto_2014112 ) ( not ( = ?auto_2014100 ?auto_2014113 ) ) ( OBJ-AT ?auto_2014102 ?auto_2014113 ) ( IN-CITY ?auto_2014110 ?auto_2014112 ) ( not ( = ?auto_2014100 ?auto_2014110 ) ) ( OBJ-AT ?auto_2014103 ?auto_2014110 ) ( OBJ-AT ?auto_2014101 ?auto_2014113 ) ( TRUCK-AT ?auto_2014107 ?auto_2014100 ) ( not ( = ?auto_2014101 ?auto_2014103 ) ) ( not ( = ?auto_2014110 ?auto_2014113 ) ) ( not ( = ?auto_2014101 ?auto_2014102 ) ) ( not ( = ?auto_2014103 ?auto_2014102 ) ) ( not ( = ?auto_2014101 ?auto_2014104 ) ) ( not ( = ?auto_2014103 ?auto_2014104 ) ) ( not ( = ?auto_2014102 ?auto_2014104 ) ) ( not ( = ?auto_2014108 ?auto_2014113 ) ) ( not ( = ?auto_2014108 ?auto_2014110 ) ) ( not ( = ?auto_2014101 ?auto_2014105 ) ) ( not ( = ?auto_2014103 ?auto_2014105 ) ) ( not ( = ?auto_2014102 ?auto_2014105 ) ) ( not ( = ?auto_2014104 ?auto_2014105 ) ) ( not ( = ?auto_2014109 ?auto_2014108 ) ) ( not ( = ?auto_2014109 ?auto_2014113 ) ) ( not ( = ?auto_2014109 ?auto_2014110 ) ) ( not ( = ?auto_2014101 ?auto_2014106 ) ) ( not ( = ?auto_2014103 ?auto_2014106 ) ) ( not ( = ?auto_2014102 ?auto_2014106 ) ) ( not ( = ?auto_2014104 ?auto_2014106 ) ) ( not ( = ?auto_2014105 ?auto_2014106 ) ) ( not ( = ?auto_2014111 ?auto_2014109 ) ) ( not ( = ?auto_2014111 ?auto_2014108 ) ) ( not ( = ?auto_2014111 ?auto_2014113 ) ) ( not ( = ?auto_2014111 ?auto_2014110 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2014101 ?auto_2014103 ?auto_2014104 ?auto_2014102 ?auto_2014105 ?auto_2014106 ?auto_2014100 )
      ( DELIVER-6PKG-VERIFY ?auto_2014101 ?auto_2014102 ?auto_2014103 ?auto_2014104 ?auto_2014105 ?auto_2014106 ?auto_2014100 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2067040 - OBJ
      ?auto_2067041 - OBJ
      ?auto_2067042 - OBJ
      ?auto_2067043 - OBJ
      ?auto_2067044 - OBJ
      ?auto_2067045 - OBJ
      ?auto_2067039 - LOCATION
    )
    :vars
    (
      ?auto_2067050 - LOCATION
      ?auto_2067051 - CITY
      ?auto_2067048 - LOCATION
      ?auto_2067047 - LOCATION
      ?auto_2067052 - LOCATION
      ?auto_2067049 - LOCATION
      ?auto_2067046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2067050 ?auto_2067051 ) ( IN-CITY ?auto_2067039 ?auto_2067051 ) ( not ( = ?auto_2067039 ?auto_2067050 ) ) ( OBJ-AT ?auto_2067045 ?auto_2067050 ) ( IN-CITY ?auto_2067048 ?auto_2067051 ) ( not ( = ?auto_2067039 ?auto_2067048 ) ) ( OBJ-AT ?auto_2067044 ?auto_2067048 ) ( IN-CITY ?auto_2067047 ?auto_2067051 ) ( not ( = ?auto_2067039 ?auto_2067047 ) ) ( OBJ-AT ?auto_2067043 ?auto_2067047 ) ( IN-CITY ?auto_2067052 ?auto_2067051 ) ( not ( = ?auto_2067039 ?auto_2067052 ) ) ( OBJ-AT ?auto_2067042 ?auto_2067052 ) ( IN-CITY ?auto_2067049 ?auto_2067051 ) ( not ( = ?auto_2067039 ?auto_2067049 ) ) ( OBJ-AT ?auto_2067040 ?auto_2067049 ) ( OBJ-AT ?auto_2067041 ?auto_2067052 ) ( TRUCK-AT ?auto_2067046 ?auto_2067039 ) ( not ( = ?auto_2067041 ?auto_2067040 ) ) ( not ( = ?auto_2067049 ?auto_2067052 ) ) ( not ( = ?auto_2067041 ?auto_2067042 ) ) ( not ( = ?auto_2067040 ?auto_2067042 ) ) ( not ( = ?auto_2067041 ?auto_2067043 ) ) ( not ( = ?auto_2067040 ?auto_2067043 ) ) ( not ( = ?auto_2067042 ?auto_2067043 ) ) ( not ( = ?auto_2067047 ?auto_2067052 ) ) ( not ( = ?auto_2067047 ?auto_2067049 ) ) ( not ( = ?auto_2067041 ?auto_2067044 ) ) ( not ( = ?auto_2067040 ?auto_2067044 ) ) ( not ( = ?auto_2067042 ?auto_2067044 ) ) ( not ( = ?auto_2067043 ?auto_2067044 ) ) ( not ( = ?auto_2067048 ?auto_2067047 ) ) ( not ( = ?auto_2067048 ?auto_2067052 ) ) ( not ( = ?auto_2067048 ?auto_2067049 ) ) ( not ( = ?auto_2067041 ?auto_2067045 ) ) ( not ( = ?auto_2067040 ?auto_2067045 ) ) ( not ( = ?auto_2067042 ?auto_2067045 ) ) ( not ( = ?auto_2067043 ?auto_2067045 ) ) ( not ( = ?auto_2067044 ?auto_2067045 ) ) ( not ( = ?auto_2067050 ?auto_2067048 ) ) ( not ( = ?auto_2067050 ?auto_2067047 ) ) ( not ( = ?auto_2067050 ?auto_2067052 ) ) ( not ( = ?auto_2067050 ?auto_2067049 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2067041 ?auto_2067040 ?auto_2067043 ?auto_2067042 ?auto_2067044 ?auto_2067045 ?auto_2067039 )
      ( DELIVER-6PKG-VERIFY ?auto_2067040 ?auto_2067041 ?auto_2067042 ?auto_2067043 ?auto_2067044 ?auto_2067045 ?auto_2067039 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2068229 - OBJ
      ?auto_2068230 - OBJ
      ?auto_2068231 - OBJ
      ?auto_2068232 - OBJ
      ?auto_2068233 - OBJ
      ?auto_2068234 - OBJ
      ?auto_2068228 - LOCATION
    )
    :vars
    (
      ?auto_2068239 - LOCATION
      ?auto_2068240 - CITY
      ?auto_2068237 - LOCATION
      ?auto_2068236 - LOCATION
      ?auto_2068241 - LOCATION
      ?auto_2068238 - LOCATION
      ?auto_2068235 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2068239 ?auto_2068240 ) ( IN-CITY ?auto_2068228 ?auto_2068240 ) ( not ( = ?auto_2068228 ?auto_2068239 ) ) ( OBJ-AT ?auto_2068234 ?auto_2068239 ) ( IN-CITY ?auto_2068237 ?auto_2068240 ) ( not ( = ?auto_2068228 ?auto_2068237 ) ) ( OBJ-AT ?auto_2068233 ?auto_2068237 ) ( IN-CITY ?auto_2068236 ?auto_2068240 ) ( not ( = ?auto_2068228 ?auto_2068236 ) ) ( OBJ-AT ?auto_2068231 ?auto_2068236 ) ( IN-CITY ?auto_2068241 ?auto_2068240 ) ( not ( = ?auto_2068228 ?auto_2068241 ) ) ( OBJ-AT ?auto_2068232 ?auto_2068241 ) ( IN-CITY ?auto_2068238 ?auto_2068240 ) ( not ( = ?auto_2068228 ?auto_2068238 ) ) ( OBJ-AT ?auto_2068229 ?auto_2068238 ) ( OBJ-AT ?auto_2068230 ?auto_2068241 ) ( TRUCK-AT ?auto_2068235 ?auto_2068228 ) ( not ( = ?auto_2068230 ?auto_2068229 ) ) ( not ( = ?auto_2068238 ?auto_2068241 ) ) ( not ( = ?auto_2068230 ?auto_2068232 ) ) ( not ( = ?auto_2068229 ?auto_2068232 ) ) ( not ( = ?auto_2068230 ?auto_2068231 ) ) ( not ( = ?auto_2068229 ?auto_2068231 ) ) ( not ( = ?auto_2068232 ?auto_2068231 ) ) ( not ( = ?auto_2068236 ?auto_2068241 ) ) ( not ( = ?auto_2068236 ?auto_2068238 ) ) ( not ( = ?auto_2068230 ?auto_2068233 ) ) ( not ( = ?auto_2068229 ?auto_2068233 ) ) ( not ( = ?auto_2068232 ?auto_2068233 ) ) ( not ( = ?auto_2068231 ?auto_2068233 ) ) ( not ( = ?auto_2068237 ?auto_2068236 ) ) ( not ( = ?auto_2068237 ?auto_2068241 ) ) ( not ( = ?auto_2068237 ?auto_2068238 ) ) ( not ( = ?auto_2068230 ?auto_2068234 ) ) ( not ( = ?auto_2068229 ?auto_2068234 ) ) ( not ( = ?auto_2068232 ?auto_2068234 ) ) ( not ( = ?auto_2068231 ?auto_2068234 ) ) ( not ( = ?auto_2068233 ?auto_2068234 ) ) ( not ( = ?auto_2068239 ?auto_2068237 ) ) ( not ( = ?auto_2068239 ?auto_2068236 ) ) ( not ( = ?auto_2068239 ?auto_2068241 ) ) ( not ( = ?auto_2068239 ?auto_2068238 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2068230 ?auto_2068229 ?auto_2068231 ?auto_2068232 ?auto_2068233 ?auto_2068234 ?auto_2068228 )
      ( DELIVER-6PKG-VERIFY ?auto_2068229 ?auto_2068230 ?auto_2068231 ?auto_2068232 ?auto_2068233 ?auto_2068234 ?auto_2068228 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2068527 - OBJ
      ?auto_2068528 - OBJ
      ?auto_2068529 - OBJ
      ?auto_2068530 - OBJ
      ?auto_2068531 - OBJ
      ?auto_2068532 - OBJ
      ?auto_2068526 - LOCATION
    )
    :vars
    (
      ?auto_2068537 - LOCATION
      ?auto_2068538 - CITY
      ?auto_2068535 - LOCATION
      ?auto_2068534 - LOCATION
      ?auto_2068539 - LOCATION
      ?auto_2068536 - LOCATION
      ?auto_2068533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2068537 ?auto_2068538 ) ( IN-CITY ?auto_2068526 ?auto_2068538 ) ( not ( = ?auto_2068526 ?auto_2068537 ) ) ( OBJ-AT ?auto_2068532 ?auto_2068537 ) ( IN-CITY ?auto_2068535 ?auto_2068538 ) ( not ( = ?auto_2068526 ?auto_2068535 ) ) ( OBJ-AT ?auto_2068530 ?auto_2068535 ) ( IN-CITY ?auto_2068534 ?auto_2068538 ) ( not ( = ?auto_2068526 ?auto_2068534 ) ) ( OBJ-AT ?auto_2068529 ?auto_2068534 ) ( IN-CITY ?auto_2068539 ?auto_2068538 ) ( not ( = ?auto_2068526 ?auto_2068539 ) ) ( OBJ-AT ?auto_2068531 ?auto_2068539 ) ( IN-CITY ?auto_2068536 ?auto_2068538 ) ( not ( = ?auto_2068526 ?auto_2068536 ) ) ( OBJ-AT ?auto_2068527 ?auto_2068536 ) ( OBJ-AT ?auto_2068528 ?auto_2068539 ) ( TRUCK-AT ?auto_2068533 ?auto_2068526 ) ( not ( = ?auto_2068528 ?auto_2068527 ) ) ( not ( = ?auto_2068536 ?auto_2068539 ) ) ( not ( = ?auto_2068528 ?auto_2068531 ) ) ( not ( = ?auto_2068527 ?auto_2068531 ) ) ( not ( = ?auto_2068528 ?auto_2068529 ) ) ( not ( = ?auto_2068527 ?auto_2068529 ) ) ( not ( = ?auto_2068531 ?auto_2068529 ) ) ( not ( = ?auto_2068534 ?auto_2068539 ) ) ( not ( = ?auto_2068534 ?auto_2068536 ) ) ( not ( = ?auto_2068528 ?auto_2068530 ) ) ( not ( = ?auto_2068527 ?auto_2068530 ) ) ( not ( = ?auto_2068531 ?auto_2068530 ) ) ( not ( = ?auto_2068529 ?auto_2068530 ) ) ( not ( = ?auto_2068535 ?auto_2068534 ) ) ( not ( = ?auto_2068535 ?auto_2068539 ) ) ( not ( = ?auto_2068535 ?auto_2068536 ) ) ( not ( = ?auto_2068528 ?auto_2068532 ) ) ( not ( = ?auto_2068527 ?auto_2068532 ) ) ( not ( = ?auto_2068531 ?auto_2068532 ) ) ( not ( = ?auto_2068529 ?auto_2068532 ) ) ( not ( = ?auto_2068530 ?auto_2068532 ) ) ( not ( = ?auto_2068537 ?auto_2068535 ) ) ( not ( = ?auto_2068537 ?auto_2068534 ) ) ( not ( = ?auto_2068537 ?auto_2068539 ) ) ( not ( = ?auto_2068537 ?auto_2068536 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2068528 ?auto_2068527 ?auto_2068529 ?auto_2068531 ?auto_2068530 ?auto_2068532 ?auto_2068526 )
      ( DELIVER-6PKG-VERIFY ?auto_2068527 ?auto_2068528 ?auto_2068529 ?auto_2068530 ?auto_2068531 ?auto_2068532 ?auto_2068526 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2068601 - OBJ
      ?auto_2068602 - OBJ
      ?auto_2068603 - OBJ
      ?auto_2068604 - OBJ
      ?auto_2068605 - OBJ
      ?auto_2068606 - OBJ
      ?auto_2068600 - LOCATION
    )
    :vars
    (
      ?auto_2068611 - LOCATION
      ?auto_2068612 - CITY
      ?auto_2068609 - LOCATION
      ?auto_2068608 - LOCATION
      ?auto_2068613 - LOCATION
      ?auto_2068610 - LOCATION
      ?auto_2068607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2068611 ?auto_2068612 ) ( IN-CITY ?auto_2068600 ?auto_2068612 ) ( not ( = ?auto_2068600 ?auto_2068611 ) ) ( OBJ-AT ?auto_2068605 ?auto_2068611 ) ( IN-CITY ?auto_2068609 ?auto_2068612 ) ( not ( = ?auto_2068600 ?auto_2068609 ) ) ( OBJ-AT ?auto_2068604 ?auto_2068609 ) ( IN-CITY ?auto_2068608 ?auto_2068612 ) ( not ( = ?auto_2068600 ?auto_2068608 ) ) ( OBJ-AT ?auto_2068603 ?auto_2068608 ) ( IN-CITY ?auto_2068613 ?auto_2068612 ) ( not ( = ?auto_2068600 ?auto_2068613 ) ) ( OBJ-AT ?auto_2068606 ?auto_2068613 ) ( IN-CITY ?auto_2068610 ?auto_2068612 ) ( not ( = ?auto_2068600 ?auto_2068610 ) ) ( OBJ-AT ?auto_2068601 ?auto_2068610 ) ( OBJ-AT ?auto_2068602 ?auto_2068613 ) ( TRUCK-AT ?auto_2068607 ?auto_2068600 ) ( not ( = ?auto_2068602 ?auto_2068601 ) ) ( not ( = ?auto_2068610 ?auto_2068613 ) ) ( not ( = ?auto_2068602 ?auto_2068606 ) ) ( not ( = ?auto_2068601 ?auto_2068606 ) ) ( not ( = ?auto_2068602 ?auto_2068603 ) ) ( not ( = ?auto_2068601 ?auto_2068603 ) ) ( not ( = ?auto_2068606 ?auto_2068603 ) ) ( not ( = ?auto_2068608 ?auto_2068613 ) ) ( not ( = ?auto_2068608 ?auto_2068610 ) ) ( not ( = ?auto_2068602 ?auto_2068604 ) ) ( not ( = ?auto_2068601 ?auto_2068604 ) ) ( not ( = ?auto_2068606 ?auto_2068604 ) ) ( not ( = ?auto_2068603 ?auto_2068604 ) ) ( not ( = ?auto_2068609 ?auto_2068608 ) ) ( not ( = ?auto_2068609 ?auto_2068613 ) ) ( not ( = ?auto_2068609 ?auto_2068610 ) ) ( not ( = ?auto_2068602 ?auto_2068605 ) ) ( not ( = ?auto_2068601 ?auto_2068605 ) ) ( not ( = ?auto_2068606 ?auto_2068605 ) ) ( not ( = ?auto_2068603 ?auto_2068605 ) ) ( not ( = ?auto_2068604 ?auto_2068605 ) ) ( not ( = ?auto_2068611 ?auto_2068609 ) ) ( not ( = ?auto_2068611 ?auto_2068608 ) ) ( not ( = ?auto_2068611 ?auto_2068613 ) ) ( not ( = ?auto_2068611 ?auto_2068610 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2068602 ?auto_2068601 ?auto_2068603 ?auto_2068606 ?auto_2068604 ?auto_2068605 ?auto_2068600 )
      ( DELIVER-6PKG-VERIFY ?auto_2068601 ?auto_2068602 ?auto_2068603 ?auto_2068604 ?auto_2068605 ?auto_2068606 ?auto_2068600 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2095518 - OBJ
      ?auto_2095519 - OBJ
      ?auto_2095520 - OBJ
      ?auto_2095521 - OBJ
      ?auto_2095522 - OBJ
      ?auto_2095523 - OBJ
      ?auto_2095517 - LOCATION
    )
    :vars
    (
      ?auto_2095528 - LOCATION
      ?auto_2095529 - CITY
      ?auto_2095526 - LOCATION
      ?auto_2095525 - LOCATION
      ?auto_2095530 - LOCATION
      ?auto_2095527 - LOCATION
      ?auto_2095524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2095528 ?auto_2095529 ) ( IN-CITY ?auto_2095517 ?auto_2095529 ) ( not ( = ?auto_2095517 ?auto_2095528 ) ) ( OBJ-AT ?auto_2095523 ?auto_2095528 ) ( IN-CITY ?auto_2095526 ?auto_2095529 ) ( not ( = ?auto_2095517 ?auto_2095526 ) ) ( OBJ-AT ?auto_2095522 ?auto_2095526 ) ( IN-CITY ?auto_2095525 ?auto_2095529 ) ( not ( = ?auto_2095517 ?auto_2095525 ) ) ( OBJ-AT ?auto_2095519 ?auto_2095525 ) ( IN-CITY ?auto_2095530 ?auto_2095529 ) ( not ( = ?auto_2095517 ?auto_2095530 ) ) ( OBJ-AT ?auto_2095521 ?auto_2095530 ) ( IN-CITY ?auto_2095527 ?auto_2095529 ) ( not ( = ?auto_2095517 ?auto_2095527 ) ) ( OBJ-AT ?auto_2095518 ?auto_2095527 ) ( OBJ-AT ?auto_2095520 ?auto_2095530 ) ( TRUCK-AT ?auto_2095524 ?auto_2095517 ) ( not ( = ?auto_2095520 ?auto_2095518 ) ) ( not ( = ?auto_2095527 ?auto_2095530 ) ) ( not ( = ?auto_2095520 ?auto_2095521 ) ) ( not ( = ?auto_2095518 ?auto_2095521 ) ) ( not ( = ?auto_2095520 ?auto_2095519 ) ) ( not ( = ?auto_2095518 ?auto_2095519 ) ) ( not ( = ?auto_2095521 ?auto_2095519 ) ) ( not ( = ?auto_2095525 ?auto_2095530 ) ) ( not ( = ?auto_2095525 ?auto_2095527 ) ) ( not ( = ?auto_2095520 ?auto_2095522 ) ) ( not ( = ?auto_2095518 ?auto_2095522 ) ) ( not ( = ?auto_2095521 ?auto_2095522 ) ) ( not ( = ?auto_2095519 ?auto_2095522 ) ) ( not ( = ?auto_2095526 ?auto_2095525 ) ) ( not ( = ?auto_2095526 ?auto_2095530 ) ) ( not ( = ?auto_2095526 ?auto_2095527 ) ) ( not ( = ?auto_2095520 ?auto_2095523 ) ) ( not ( = ?auto_2095518 ?auto_2095523 ) ) ( not ( = ?auto_2095521 ?auto_2095523 ) ) ( not ( = ?auto_2095519 ?auto_2095523 ) ) ( not ( = ?auto_2095522 ?auto_2095523 ) ) ( not ( = ?auto_2095528 ?auto_2095526 ) ) ( not ( = ?auto_2095528 ?auto_2095525 ) ) ( not ( = ?auto_2095528 ?auto_2095530 ) ) ( not ( = ?auto_2095528 ?auto_2095527 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2095520 ?auto_2095518 ?auto_2095519 ?auto_2095521 ?auto_2095522 ?auto_2095523 ?auto_2095517 )
      ( DELIVER-6PKG-VERIFY ?auto_2095518 ?auto_2095519 ?auto_2095520 ?auto_2095521 ?auto_2095522 ?auto_2095523 ?auto_2095517 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2095816 - OBJ
      ?auto_2095817 - OBJ
      ?auto_2095818 - OBJ
      ?auto_2095819 - OBJ
      ?auto_2095820 - OBJ
      ?auto_2095821 - OBJ
      ?auto_2095815 - LOCATION
    )
    :vars
    (
      ?auto_2095826 - LOCATION
      ?auto_2095827 - CITY
      ?auto_2095824 - LOCATION
      ?auto_2095823 - LOCATION
      ?auto_2095828 - LOCATION
      ?auto_2095825 - LOCATION
      ?auto_2095822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2095826 ?auto_2095827 ) ( IN-CITY ?auto_2095815 ?auto_2095827 ) ( not ( = ?auto_2095815 ?auto_2095826 ) ) ( OBJ-AT ?auto_2095821 ?auto_2095826 ) ( IN-CITY ?auto_2095824 ?auto_2095827 ) ( not ( = ?auto_2095815 ?auto_2095824 ) ) ( OBJ-AT ?auto_2095819 ?auto_2095824 ) ( IN-CITY ?auto_2095823 ?auto_2095827 ) ( not ( = ?auto_2095815 ?auto_2095823 ) ) ( OBJ-AT ?auto_2095817 ?auto_2095823 ) ( IN-CITY ?auto_2095828 ?auto_2095827 ) ( not ( = ?auto_2095815 ?auto_2095828 ) ) ( OBJ-AT ?auto_2095820 ?auto_2095828 ) ( IN-CITY ?auto_2095825 ?auto_2095827 ) ( not ( = ?auto_2095815 ?auto_2095825 ) ) ( OBJ-AT ?auto_2095816 ?auto_2095825 ) ( OBJ-AT ?auto_2095818 ?auto_2095828 ) ( TRUCK-AT ?auto_2095822 ?auto_2095815 ) ( not ( = ?auto_2095818 ?auto_2095816 ) ) ( not ( = ?auto_2095825 ?auto_2095828 ) ) ( not ( = ?auto_2095818 ?auto_2095820 ) ) ( not ( = ?auto_2095816 ?auto_2095820 ) ) ( not ( = ?auto_2095818 ?auto_2095817 ) ) ( not ( = ?auto_2095816 ?auto_2095817 ) ) ( not ( = ?auto_2095820 ?auto_2095817 ) ) ( not ( = ?auto_2095823 ?auto_2095828 ) ) ( not ( = ?auto_2095823 ?auto_2095825 ) ) ( not ( = ?auto_2095818 ?auto_2095819 ) ) ( not ( = ?auto_2095816 ?auto_2095819 ) ) ( not ( = ?auto_2095820 ?auto_2095819 ) ) ( not ( = ?auto_2095817 ?auto_2095819 ) ) ( not ( = ?auto_2095824 ?auto_2095823 ) ) ( not ( = ?auto_2095824 ?auto_2095828 ) ) ( not ( = ?auto_2095824 ?auto_2095825 ) ) ( not ( = ?auto_2095818 ?auto_2095821 ) ) ( not ( = ?auto_2095816 ?auto_2095821 ) ) ( not ( = ?auto_2095820 ?auto_2095821 ) ) ( not ( = ?auto_2095817 ?auto_2095821 ) ) ( not ( = ?auto_2095819 ?auto_2095821 ) ) ( not ( = ?auto_2095826 ?auto_2095824 ) ) ( not ( = ?auto_2095826 ?auto_2095823 ) ) ( not ( = ?auto_2095826 ?auto_2095828 ) ) ( not ( = ?auto_2095826 ?auto_2095825 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2095818 ?auto_2095816 ?auto_2095817 ?auto_2095820 ?auto_2095819 ?auto_2095821 ?auto_2095815 )
      ( DELIVER-6PKG-VERIFY ?auto_2095816 ?auto_2095817 ?auto_2095818 ?auto_2095819 ?auto_2095820 ?auto_2095821 ?auto_2095815 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2095890 - OBJ
      ?auto_2095891 - OBJ
      ?auto_2095892 - OBJ
      ?auto_2095893 - OBJ
      ?auto_2095894 - OBJ
      ?auto_2095895 - OBJ
      ?auto_2095889 - LOCATION
    )
    :vars
    (
      ?auto_2095900 - LOCATION
      ?auto_2095901 - CITY
      ?auto_2095898 - LOCATION
      ?auto_2095897 - LOCATION
      ?auto_2095902 - LOCATION
      ?auto_2095899 - LOCATION
      ?auto_2095896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2095900 ?auto_2095901 ) ( IN-CITY ?auto_2095889 ?auto_2095901 ) ( not ( = ?auto_2095889 ?auto_2095900 ) ) ( OBJ-AT ?auto_2095894 ?auto_2095900 ) ( IN-CITY ?auto_2095898 ?auto_2095901 ) ( not ( = ?auto_2095889 ?auto_2095898 ) ) ( OBJ-AT ?auto_2095893 ?auto_2095898 ) ( IN-CITY ?auto_2095897 ?auto_2095901 ) ( not ( = ?auto_2095889 ?auto_2095897 ) ) ( OBJ-AT ?auto_2095891 ?auto_2095897 ) ( IN-CITY ?auto_2095902 ?auto_2095901 ) ( not ( = ?auto_2095889 ?auto_2095902 ) ) ( OBJ-AT ?auto_2095895 ?auto_2095902 ) ( IN-CITY ?auto_2095899 ?auto_2095901 ) ( not ( = ?auto_2095889 ?auto_2095899 ) ) ( OBJ-AT ?auto_2095890 ?auto_2095899 ) ( OBJ-AT ?auto_2095892 ?auto_2095902 ) ( TRUCK-AT ?auto_2095896 ?auto_2095889 ) ( not ( = ?auto_2095892 ?auto_2095890 ) ) ( not ( = ?auto_2095899 ?auto_2095902 ) ) ( not ( = ?auto_2095892 ?auto_2095895 ) ) ( not ( = ?auto_2095890 ?auto_2095895 ) ) ( not ( = ?auto_2095892 ?auto_2095891 ) ) ( not ( = ?auto_2095890 ?auto_2095891 ) ) ( not ( = ?auto_2095895 ?auto_2095891 ) ) ( not ( = ?auto_2095897 ?auto_2095902 ) ) ( not ( = ?auto_2095897 ?auto_2095899 ) ) ( not ( = ?auto_2095892 ?auto_2095893 ) ) ( not ( = ?auto_2095890 ?auto_2095893 ) ) ( not ( = ?auto_2095895 ?auto_2095893 ) ) ( not ( = ?auto_2095891 ?auto_2095893 ) ) ( not ( = ?auto_2095898 ?auto_2095897 ) ) ( not ( = ?auto_2095898 ?auto_2095902 ) ) ( not ( = ?auto_2095898 ?auto_2095899 ) ) ( not ( = ?auto_2095892 ?auto_2095894 ) ) ( not ( = ?auto_2095890 ?auto_2095894 ) ) ( not ( = ?auto_2095895 ?auto_2095894 ) ) ( not ( = ?auto_2095891 ?auto_2095894 ) ) ( not ( = ?auto_2095893 ?auto_2095894 ) ) ( not ( = ?auto_2095900 ?auto_2095898 ) ) ( not ( = ?auto_2095900 ?auto_2095897 ) ) ( not ( = ?auto_2095900 ?auto_2095902 ) ) ( not ( = ?auto_2095900 ?auto_2095899 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2095892 ?auto_2095890 ?auto_2095891 ?auto_2095895 ?auto_2095893 ?auto_2095894 ?auto_2095889 )
      ( DELIVER-6PKG-VERIFY ?auto_2095890 ?auto_2095891 ?auto_2095892 ?auto_2095893 ?auto_2095894 ?auto_2095895 ?auto_2095889 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2100787 - OBJ
      ?auto_2100788 - OBJ
      ?auto_2100789 - OBJ
      ?auto_2100790 - OBJ
      ?auto_2100791 - OBJ
      ?auto_2100792 - OBJ
      ?auto_2100786 - LOCATION
    )
    :vars
    (
      ?auto_2100797 - LOCATION
      ?auto_2100798 - CITY
      ?auto_2100795 - LOCATION
      ?auto_2100794 - LOCATION
      ?auto_2100799 - LOCATION
      ?auto_2100796 - LOCATION
      ?auto_2100793 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2100797 ?auto_2100798 ) ( IN-CITY ?auto_2100786 ?auto_2100798 ) ( not ( = ?auto_2100786 ?auto_2100797 ) ) ( OBJ-AT ?auto_2100792 ?auto_2100797 ) ( IN-CITY ?auto_2100795 ?auto_2100798 ) ( not ( = ?auto_2100786 ?auto_2100795 ) ) ( OBJ-AT ?auto_2100789 ?auto_2100795 ) ( IN-CITY ?auto_2100794 ?auto_2100798 ) ( not ( = ?auto_2100786 ?auto_2100794 ) ) ( OBJ-AT ?auto_2100788 ?auto_2100794 ) ( IN-CITY ?auto_2100799 ?auto_2100798 ) ( not ( = ?auto_2100786 ?auto_2100799 ) ) ( OBJ-AT ?auto_2100791 ?auto_2100799 ) ( IN-CITY ?auto_2100796 ?auto_2100798 ) ( not ( = ?auto_2100786 ?auto_2100796 ) ) ( OBJ-AT ?auto_2100787 ?auto_2100796 ) ( OBJ-AT ?auto_2100790 ?auto_2100799 ) ( TRUCK-AT ?auto_2100793 ?auto_2100786 ) ( not ( = ?auto_2100790 ?auto_2100787 ) ) ( not ( = ?auto_2100796 ?auto_2100799 ) ) ( not ( = ?auto_2100790 ?auto_2100791 ) ) ( not ( = ?auto_2100787 ?auto_2100791 ) ) ( not ( = ?auto_2100790 ?auto_2100788 ) ) ( not ( = ?auto_2100787 ?auto_2100788 ) ) ( not ( = ?auto_2100791 ?auto_2100788 ) ) ( not ( = ?auto_2100794 ?auto_2100799 ) ) ( not ( = ?auto_2100794 ?auto_2100796 ) ) ( not ( = ?auto_2100790 ?auto_2100789 ) ) ( not ( = ?auto_2100787 ?auto_2100789 ) ) ( not ( = ?auto_2100791 ?auto_2100789 ) ) ( not ( = ?auto_2100788 ?auto_2100789 ) ) ( not ( = ?auto_2100795 ?auto_2100794 ) ) ( not ( = ?auto_2100795 ?auto_2100799 ) ) ( not ( = ?auto_2100795 ?auto_2100796 ) ) ( not ( = ?auto_2100790 ?auto_2100792 ) ) ( not ( = ?auto_2100787 ?auto_2100792 ) ) ( not ( = ?auto_2100791 ?auto_2100792 ) ) ( not ( = ?auto_2100788 ?auto_2100792 ) ) ( not ( = ?auto_2100789 ?auto_2100792 ) ) ( not ( = ?auto_2100797 ?auto_2100795 ) ) ( not ( = ?auto_2100797 ?auto_2100794 ) ) ( not ( = ?auto_2100797 ?auto_2100799 ) ) ( not ( = ?auto_2100797 ?auto_2100796 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2100790 ?auto_2100787 ?auto_2100788 ?auto_2100791 ?auto_2100789 ?auto_2100792 ?auto_2100786 )
      ( DELIVER-6PKG-VERIFY ?auto_2100787 ?auto_2100788 ?auto_2100789 ?auto_2100790 ?auto_2100791 ?auto_2100792 ?auto_2100786 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2100861 - OBJ
      ?auto_2100862 - OBJ
      ?auto_2100863 - OBJ
      ?auto_2100864 - OBJ
      ?auto_2100865 - OBJ
      ?auto_2100866 - OBJ
      ?auto_2100860 - LOCATION
    )
    :vars
    (
      ?auto_2100871 - LOCATION
      ?auto_2100872 - CITY
      ?auto_2100869 - LOCATION
      ?auto_2100868 - LOCATION
      ?auto_2100873 - LOCATION
      ?auto_2100870 - LOCATION
      ?auto_2100867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2100871 ?auto_2100872 ) ( IN-CITY ?auto_2100860 ?auto_2100872 ) ( not ( = ?auto_2100860 ?auto_2100871 ) ) ( OBJ-AT ?auto_2100865 ?auto_2100871 ) ( IN-CITY ?auto_2100869 ?auto_2100872 ) ( not ( = ?auto_2100860 ?auto_2100869 ) ) ( OBJ-AT ?auto_2100863 ?auto_2100869 ) ( IN-CITY ?auto_2100868 ?auto_2100872 ) ( not ( = ?auto_2100860 ?auto_2100868 ) ) ( OBJ-AT ?auto_2100862 ?auto_2100868 ) ( IN-CITY ?auto_2100873 ?auto_2100872 ) ( not ( = ?auto_2100860 ?auto_2100873 ) ) ( OBJ-AT ?auto_2100866 ?auto_2100873 ) ( IN-CITY ?auto_2100870 ?auto_2100872 ) ( not ( = ?auto_2100860 ?auto_2100870 ) ) ( OBJ-AT ?auto_2100861 ?auto_2100870 ) ( OBJ-AT ?auto_2100864 ?auto_2100873 ) ( TRUCK-AT ?auto_2100867 ?auto_2100860 ) ( not ( = ?auto_2100864 ?auto_2100861 ) ) ( not ( = ?auto_2100870 ?auto_2100873 ) ) ( not ( = ?auto_2100864 ?auto_2100866 ) ) ( not ( = ?auto_2100861 ?auto_2100866 ) ) ( not ( = ?auto_2100864 ?auto_2100862 ) ) ( not ( = ?auto_2100861 ?auto_2100862 ) ) ( not ( = ?auto_2100866 ?auto_2100862 ) ) ( not ( = ?auto_2100868 ?auto_2100873 ) ) ( not ( = ?auto_2100868 ?auto_2100870 ) ) ( not ( = ?auto_2100864 ?auto_2100863 ) ) ( not ( = ?auto_2100861 ?auto_2100863 ) ) ( not ( = ?auto_2100866 ?auto_2100863 ) ) ( not ( = ?auto_2100862 ?auto_2100863 ) ) ( not ( = ?auto_2100869 ?auto_2100868 ) ) ( not ( = ?auto_2100869 ?auto_2100873 ) ) ( not ( = ?auto_2100869 ?auto_2100870 ) ) ( not ( = ?auto_2100864 ?auto_2100865 ) ) ( not ( = ?auto_2100861 ?auto_2100865 ) ) ( not ( = ?auto_2100866 ?auto_2100865 ) ) ( not ( = ?auto_2100862 ?auto_2100865 ) ) ( not ( = ?auto_2100863 ?auto_2100865 ) ) ( not ( = ?auto_2100871 ?auto_2100869 ) ) ( not ( = ?auto_2100871 ?auto_2100868 ) ) ( not ( = ?auto_2100871 ?auto_2100873 ) ) ( not ( = ?auto_2100871 ?auto_2100870 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2100864 ?auto_2100861 ?auto_2100862 ?auto_2100866 ?auto_2100863 ?auto_2100865 ?auto_2100860 )
      ( DELIVER-6PKG-VERIFY ?auto_2100861 ?auto_2100862 ?auto_2100863 ?auto_2100864 ?auto_2100865 ?auto_2100866 ?auto_2100860 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2101615 - OBJ
      ?auto_2101616 - OBJ
      ?auto_2101617 - OBJ
      ?auto_2101618 - OBJ
      ?auto_2101619 - OBJ
      ?auto_2101620 - OBJ
      ?auto_2101614 - LOCATION
    )
    :vars
    (
      ?auto_2101625 - LOCATION
      ?auto_2101626 - CITY
      ?auto_2101623 - LOCATION
      ?auto_2101622 - LOCATION
      ?auto_2101627 - LOCATION
      ?auto_2101624 - LOCATION
      ?auto_2101621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2101625 ?auto_2101626 ) ( IN-CITY ?auto_2101614 ?auto_2101626 ) ( not ( = ?auto_2101614 ?auto_2101625 ) ) ( OBJ-AT ?auto_2101618 ?auto_2101625 ) ( IN-CITY ?auto_2101623 ?auto_2101626 ) ( not ( = ?auto_2101614 ?auto_2101623 ) ) ( OBJ-AT ?auto_2101617 ?auto_2101623 ) ( IN-CITY ?auto_2101622 ?auto_2101626 ) ( not ( = ?auto_2101614 ?auto_2101622 ) ) ( OBJ-AT ?auto_2101616 ?auto_2101622 ) ( IN-CITY ?auto_2101627 ?auto_2101626 ) ( not ( = ?auto_2101614 ?auto_2101627 ) ) ( OBJ-AT ?auto_2101620 ?auto_2101627 ) ( IN-CITY ?auto_2101624 ?auto_2101626 ) ( not ( = ?auto_2101614 ?auto_2101624 ) ) ( OBJ-AT ?auto_2101615 ?auto_2101624 ) ( OBJ-AT ?auto_2101619 ?auto_2101627 ) ( TRUCK-AT ?auto_2101621 ?auto_2101614 ) ( not ( = ?auto_2101619 ?auto_2101615 ) ) ( not ( = ?auto_2101624 ?auto_2101627 ) ) ( not ( = ?auto_2101619 ?auto_2101620 ) ) ( not ( = ?auto_2101615 ?auto_2101620 ) ) ( not ( = ?auto_2101619 ?auto_2101616 ) ) ( not ( = ?auto_2101615 ?auto_2101616 ) ) ( not ( = ?auto_2101620 ?auto_2101616 ) ) ( not ( = ?auto_2101622 ?auto_2101627 ) ) ( not ( = ?auto_2101622 ?auto_2101624 ) ) ( not ( = ?auto_2101619 ?auto_2101617 ) ) ( not ( = ?auto_2101615 ?auto_2101617 ) ) ( not ( = ?auto_2101620 ?auto_2101617 ) ) ( not ( = ?auto_2101616 ?auto_2101617 ) ) ( not ( = ?auto_2101623 ?auto_2101622 ) ) ( not ( = ?auto_2101623 ?auto_2101627 ) ) ( not ( = ?auto_2101623 ?auto_2101624 ) ) ( not ( = ?auto_2101619 ?auto_2101618 ) ) ( not ( = ?auto_2101615 ?auto_2101618 ) ) ( not ( = ?auto_2101620 ?auto_2101618 ) ) ( not ( = ?auto_2101616 ?auto_2101618 ) ) ( not ( = ?auto_2101617 ?auto_2101618 ) ) ( not ( = ?auto_2101625 ?auto_2101623 ) ) ( not ( = ?auto_2101625 ?auto_2101622 ) ) ( not ( = ?auto_2101625 ?auto_2101627 ) ) ( not ( = ?auto_2101625 ?auto_2101624 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2101619 ?auto_2101615 ?auto_2101616 ?auto_2101620 ?auto_2101617 ?auto_2101618 ?auto_2101614 )
      ( DELIVER-6PKG-VERIFY ?auto_2101615 ?auto_2101616 ?auto_2101617 ?auto_2101618 ?auto_2101619 ?auto_2101620 ?auto_2101614 ) )
  )

)

