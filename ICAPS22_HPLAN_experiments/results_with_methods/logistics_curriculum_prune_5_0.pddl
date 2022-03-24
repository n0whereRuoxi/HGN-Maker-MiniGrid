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
      ?auto_17056 - OBJ
      ?auto_17055 - LOCATION
    )
    :vars
    (
      ?auto_17058 - LOCATION
      ?auto_17059 - CITY
      ?auto_17057 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17058 ?auto_17059 ) ( IN-CITY ?auto_17055 ?auto_17059 ) ( not ( = ?auto_17055 ?auto_17058 ) ) ( OBJ-AT ?auto_17056 ?auto_17058 ) ( TRUCK-AT ?auto_17057 ?auto_17055 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17057 ?auto_17055 ?auto_17058 ?auto_17059 )
      ( !LOAD-TRUCK ?auto_17056 ?auto_17057 ?auto_17058 )
      ( !DRIVE-TRUCK ?auto_17057 ?auto_17058 ?auto_17055 ?auto_17059 )
      ( !UNLOAD-TRUCK ?auto_17056 ?auto_17057 ?auto_17055 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_17077 - OBJ
      ?auto_17078 - OBJ
      ?auto_17076 - LOCATION
    )
    :vars
    (
      ?auto_17080 - LOCATION
      ?auto_17079 - CITY
      ?auto_17082 - LOCATION
      ?auto_17081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17080 ?auto_17079 ) ( IN-CITY ?auto_17076 ?auto_17079 ) ( not ( = ?auto_17076 ?auto_17080 ) ) ( OBJ-AT ?auto_17078 ?auto_17080 ) ( IN-CITY ?auto_17082 ?auto_17079 ) ( not ( = ?auto_17076 ?auto_17082 ) ) ( OBJ-AT ?auto_17077 ?auto_17082 ) ( TRUCK-AT ?auto_17081 ?auto_17076 ) ( not ( = ?auto_17077 ?auto_17078 ) ) ( not ( = ?auto_17080 ?auto_17082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_17077 ?auto_17076 )
      ( DELIVER-1PKG ?auto_17078 ?auto_17076 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17188 - OBJ
      ?auto_17189 - OBJ
      ?auto_17190 - OBJ
      ?auto_17187 - LOCATION
    )
    :vars
    (
      ?auto_17193 - LOCATION
      ?auto_17192 - CITY
      ?auto_17195 - LOCATION
      ?auto_17194 - LOCATION
      ?auto_17191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17193 ?auto_17192 ) ( IN-CITY ?auto_17187 ?auto_17192 ) ( not ( = ?auto_17187 ?auto_17193 ) ) ( OBJ-AT ?auto_17190 ?auto_17193 ) ( IN-CITY ?auto_17195 ?auto_17192 ) ( not ( = ?auto_17187 ?auto_17195 ) ) ( OBJ-AT ?auto_17189 ?auto_17195 ) ( IN-CITY ?auto_17194 ?auto_17192 ) ( not ( = ?auto_17187 ?auto_17194 ) ) ( OBJ-AT ?auto_17188 ?auto_17194 ) ( TRUCK-AT ?auto_17191 ?auto_17187 ) ( not ( = ?auto_17188 ?auto_17189 ) ) ( not ( = ?auto_17195 ?auto_17194 ) ) ( not ( = ?auto_17188 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17190 ) ) ( not ( = ?auto_17193 ?auto_17195 ) ) ( not ( = ?auto_17193 ?auto_17194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17188 ?auto_17189 ?auto_17187 )
      ( DELIVER-1PKG ?auto_17190 ?auto_17187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18322 - OBJ
      ?auto_18323 - OBJ
      ?auto_18324 - OBJ
      ?auto_18325 - OBJ
      ?auto_18321 - LOCATION
    )
    :vars
    (
      ?auto_18327 - LOCATION
      ?auto_18326 - CITY
      ?auto_18330 - LOCATION
      ?auto_18329 - LOCATION
      ?auto_18328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18327 ?auto_18326 ) ( IN-CITY ?auto_18321 ?auto_18326 ) ( not ( = ?auto_18321 ?auto_18327 ) ) ( OBJ-AT ?auto_18325 ?auto_18327 ) ( IN-CITY ?auto_18330 ?auto_18326 ) ( not ( = ?auto_18321 ?auto_18330 ) ) ( OBJ-AT ?auto_18324 ?auto_18330 ) ( OBJ-AT ?auto_18323 ?auto_18327 ) ( IN-CITY ?auto_18329 ?auto_18326 ) ( not ( = ?auto_18321 ?auto_18329 ) ) ( OBJ-AT ?auto_18322 ?auto_18329 ) ( TRUCK-AT ?auto_18328 ?auto_18321 ) ( not ( = ?auto_18322 ?auto_18323 ) ) ( not ( = ?auto_18327 ?auto_18329 ) ) ( not ( = ?auto_18322 ?auto_18324 ) ) ( not ( = ?auto_18323 ?auto_18324 ) ) ( not ( = ?auto_18330 ?auto_18327 ) ) ( not ( = ?auto_18330 ?auto_18329 ) ) ( not ( = ?auto_18322 ?auto_18325 ) ) ( not ( = ?auto_18323 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18325 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18322 ?auto_18323 ?auto_18324 ?auto_18321 )
      ( DELIVER-1PKG ?auto_18325 ?auto_18321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18354 - OBJ
      ?auto_18355 - OBJ
      ?auto_18356 - OBJ
      ?auto_18357 - OBJ
      ?auto_18353 - LOCATION
    )
    :vars
    (
      ?auto_18360 - LOCATION
      ?auto_18359 - CITY
      ?auto_18361 - LOCATION
      ?auto_18362 - LOCATION
      ?auto_18358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18360 ?auto_18359 ) ( IN-CITY ?auto_18353 ?auto_18359 ) ( not ( = ?auto_18353 ?auto_18360 ) ) ( OBJ-AT ?auto_18356 ?auto_18360 ) ( IN-CITY ?auto_18361 ?auto_18359 ) ( not ( = ?auto_18353 ?auto_18361 ) ) ( OBJ-AT ?auto_18357 ?auto_18361 ) ( OBJ-AT ?auto_18355 ?auto_18360 ) ( IN-CITY ?auto_18362 ?auto_18359 ) ( not ( = ?auto_18353 ?auto_18362 ) ) ( OBJ-AT ?auto_18354 ?auto_18362 ) ( TRUCK-AT ?auto_18358 ?auto_18353 ) ( not ( = ?auto_18354 ?auto_18355 ) ) ( not ( = ?auto_18360 ?auto_18362 ) ) ( not ( = ?auto_18354 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18361 ?auto_18360 ) ) ( not ( = ?auto_18361 ?auto_18362 ) ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( not ( = ?auto_18355 ?auto_18356 ) ) ( not ( = ?auto_18357 ?auto_18356 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18354 ?auto_18355 ?auto_18357 ?auto_18356 ?auto_18353 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18386 - OBJ
      ?auto_18387 - OBJ
      ?auto_18388 - OBJ
      ?auto_18389 - OBJ
      ?auto_18385 - LOCATION
    )
    :vars
    (
      ?auto_18390 - LOCATION
      ?auto_18392 - CITY
      ?auto_18393 - LOCATION
      ?auto_18394 - LOCATION
      ?auto_18391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18390 ?auto_18392 ) ( IN-CITY ?auto_18385 ?auto_18392 ) ( not ( = ?auto_18385 ?auto_18390 ) ) ( OBJ-AT ?auto_18389 ?auto_18390 ) ( IN-CITY ?auto_18393 ?auto_18392 ) ( not ( = ?auto_18385 ?auto_18393 ) ) ( OBJ-AT ?auto_18387 ?auto_18393 ) ( OBJ-AT ?auto_18388 ?auto_18390 ) ( IN-CITY ?auto_18394 ?auto_18392 ) ( not ( = ?auto_18385 ?auto_18394 ) ) ( OBJ-AT ?auto_18386 ?auto_18394 ) ( TRUCK-AT ?auto_18391 ?auto_18385 ) ( not ( = ?auto_18386 ?auto_18388 ) ) ( not ( = ?auto_18390 ?auto_18394 ) ) ( not ( = ?auto_18386 ?auto_18387 ) ) ( not ( = ?auto_18388 ?auto_18387 ) ) ( not ( = ?auto_18393 ?auto_18390 ) ) ( not ( = ?auto_18393 ?auto_18394 ) ) ( not ( = ?auto_18386 ?auto_18389 ) ) ( not ( = ?auto_18388 ?auto_18389 ) ) ( not ( = ?auto_18387 ?auto_18389 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18386 ?auto_18388 ?auto_18389 ?auto_18387 ?auto_18385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18635 - OBJ
      ?auto_18636 - OBJ
      ?auto_18637 - OBJ
      ?auto_18638 - OBJ
      ?auto_18634 - LOCATION
    )
    :vars
    (
      ?auto_18639 - LOCATION
      ?auto_18641 - CITY
      ?auto_18642 - LOCATION
      ?auto_18643 - LOCATION
      ?auto_18640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18639 ?auto_18641 ) ( IN-CITY ?auto_18634 ?auto_18641 ) ( not ( = ?auto_18634 ?auto_18639 ) ) ( OBJ-AT ?auto_18638 ?auto_18639 ) ( IN-CITY ?auto_18642 ?auto_18641 ) ( not ( = ?auto_18634 ?auto_18642 ) ) ( OBJ-AT ?auto_18637 ?auto_18642 ) ( OBJ-AT ?auto_18635 ?auto_18639 ) ( IN-CITY ?auto_18643 ?auto_18641 ) ( not ( = ?auto_18634 ?auto_18643 ) ) ( OBJ-AT ?auto_18636 ?auto_18643 ) ( TRUCK-AT ?auto_18640 ?auto_18634 ) ( not ( = ?auto_18636 ?auto_18635 ) ) ( not ( = ?auto_18639 ?auto_18643 ) ) ( not ( = ?auto_18636 ?auto_18637 ) ) ( not ( = ?auto_18635 ?auto_18637 ) ) ( not ( = ?auto_18642 ?auto_18639 ) ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( not ( = ?auto_18636 ?auto_18638 ) ) ( not ( = ?auto_18635 ?auto_18638 ) ) ( not ( = ?auto_18637 ?auto_18638 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18636 ?auto_18635 ?auto_18638 ?auto_18637 ?auto_18634 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18667 - OBJ
      ?auto_18668 - OBJ
      ?auto_18669 - OBJ
      ?auto_18670 - OBJ
      ?auto_18666 - LOCATION
    )
    :vars
    (
      ?auto_18671 - LOCATION
      ?auto_18673 - CITY
      ?auto_18674 - LOCATION
      ?auto_18675 - LOCATION
      ?auto_18672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18671 ?auto_18673 ) ( IN-CITY ?auto_18666 ?auto_18673 ) ( not ( = ?auto_18666 ?auto_18671 ) ) ( OBJ-AT ?auto_18669 ?auto_18671 ) ( IN-CITY ?auto_18674 ?auto_18673 ) ( not ( = ?auto_18666 ?auto_18674 ) ) ( OBJ-AT ?auto_18670 ?auto_18674 ) ( OBJ-AT ?auto_18667 ?auto_18671 ) ( IN-CITY ?auto_18675 ?auto_18673 ) ( not ( = ?auto_18666 ?auto_18675 ) ) ( OBJ-AT ?auto_18668 ?auto_18675 ) ( TRUCK-AT ?auto_18672 ?auto_18666 ) ( not ( = ?auto_18668 ?auto_18667 ) ) ( not ( = ?auto_18671 ?auto_18675 ) ) ( not ( = ?auto_18668 ?auto_18670 ) ) ( not ( = ?auto_18667 ?auto_18670 ) ) ( not ( = ?auto_18674 ?auto_18671 ) ) ( not ( = ?auto_18674 ?auto_18675 ) ) ( not ( = ?auto_18668 ?auto_18669 ) ) ( not ( = ?auto_18667 ?auto_18669 ) ) ( not ( = ?auto_18670 ?auto_18669 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18668 ?auto_18667 ?auto_18669 ?auto_18670 ?auto_18666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18855 - OBJ
      ?auto_18856 - OBJ
      ?auto_18857 - OBJ
      ?auto_18858 - OBJ
      ?auto_18854 - LOCATION
    )
    :vars
    (
      ?auto_18859 - LOCATION
      ?auto_18861 - CITY
      ?auto_18862 - LOCATION
      ?auto_18863 - LOCATION
      ?auto_18860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18859 ?auto_18861 ) ( IN-CITY ?auto_18854 ?auto_18861 ) ( not ( = ?auto_18854 ?auto_18859 ) ) ( OBJ-AT ?auto_18856 ?auto_18859 ) ( IN-CITY ?auto_18862 ?auto_18861 ) ( not ( = ?auto_18854 ?auto_18862 ) ) ( OBJ-AT ?auto_18858 ?auto_18862 ) ( OBJ-AT ?auto_18855 ?auto_18859 ) ( IN-CITY ?auto_18863 ?auto_18861 ) ( not ( = ?auto_18854 ?auto_18863 ) ) ( OBJ-AT ?auto_18857 ?auto_18863 ) ( TRUCK-AT ?auto_18860 ?auto_18854 ) ( not ( = ?auto_18857 ?auto_18855 ) ) ( not ( = ?auto_18859 ?auto_18863 ) ) ( not ( = ?auto_18857 ?auto_18858 ) ) ( not ( = ?auto_18855 ?auto_18858 ) ) ( not ( = ?auto_18862 ?auto_18859 ) ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18857 ?auto_18856 ) ) ( not ( = ?auto_18855 ?auto_18856 ) ) ( not ( = ?auto_18858 ?auto_18856 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18857 ?auto_18855 ?auto_18856 ?auto_18858 ?auto_18854 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33732 - OBJ
      ?auto_33733 - OBJ
      ?auto_33734 - OBJ
      ?auto_33735 - OBJ
      ?auto_33736 - OBJ
      ?auto_33731 - LOCATION
    )
    :vars
    (
      ?auto_33738 - LOCATION
      ?auto_33737 - CITY
      ?auto_33740 - LOCATION
      ?auto_33741 - LOCATION
      ?auto_33739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33738 ?auto_33737 ) ( IN-CITY ?auto_33731 ?auto_33737 ) ( not ( = ?auto_33731 ?auto_33738 ) ) ( OBJ-AT ?auto_33736 ?auto_33738 ) ( OBJ-AT ?auto_33735 ?auto_33738 ) ( IN-CITY ?auto_33740 ?auto_33737 ) ( not ( = ?auto_33731 ?auto_33740 ) ) ( OBJ-AT ?auto_33734 ?auto_33740 ) ( OBJ-AT ?auto_33733 ?auto_33738 ) ( IN-CITY ?auto_33741 ?auto_33737 ) ( not ( = ?auto_33731 ?auto_33741 ) ) ( OBJ-AT ?auto_33732 ?auto_33741 ) ( TRUCK-AT ?auto_33739 ?auto_33731 ) ( not ( = ?auto_33732 ?auto_33733 ) ) ( not ( = ?auto_33738 ?auto_33741 ) ) ( not ( = ?auto_33732 ?auto_33734 ) ) ( not ( = ?auto_33733 ?auto_33734 ) ) ( not ( = ?auto_33740 ?auto_33738 ) ) ( not ( = ?auto_33740 ?auto_33741 ) ) ( not ( = ?auto_33732 ?auto_33735 ) ) ( not ( = ?auto_33733 ?auto_33735 ) ) ( not ( = ?auto_33734 ?auto_33735 ) ) ( not ( = ?auto_33732 ?auto_33736 ) ) ( not ( = ?auto_33733 ?auto_33736 ) ) ( not ( = ?auto_33734 ?auto_33736 ) ) ( not ( = ?auto_33735 ?auto_33736 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_33732 ?auto_33733 ?auto_33735 ?auto_33734 ?auto_33731 )
      ( DELIVER-1PKG ?auto_33736 ?auto_33731 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33821 - OBJ
      ?auto_33822 - OBJ
      ?auto_33823 - OBJ
      ?auto_33824 - OBJ
      ?auto_33825 - OBJ
      ?auto_33820 - LOCATION
    )
    :vars
    (
      ?auto_33829 - LOCATION
      ?auto_33827 - CITY
      ?auto_33830 - LOCATION
      ?auto_33828 - LOCATION
      ?auto_33826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33829 ?auto_33827 ) ( IN-CITY ?auto_33820 ?auto_33827 ) ( not ( = ?auto_33820 ?auto_33829 ) ) ( OBJ-AT ?auto_33825 ?auto_33829 ) ( OBJ-AT ?auto_33823 ?auto_33829 ) ( IN-CITY ?auto_33830 ?auto_33827 ) ( not ( = ?auto_33820 ?auto_33830 ) ) ( OBJ-AT ?auto_33824 ?auto_33830 ) ( OBJ-AT ?auto_33822 ?auto_33829 ) ( IN-CITY ?auto_33828 ?auto_33827 ) ( not ( = ?auto_33820 ?auto_33828 ) ) ( OBJ-AT ?auto_33821 ?auto_33828 ) ( TRUCK-AT ?auto_33826 ?auto_33820 ) ( not ( = ?auto_33821 ?auto_33822 ) ) ( not ( = ?auto_33829 ?auto_33828 ) ) ( not ( = ?auto_33821 ?auto_33824 ) ) ( not ( = ?auto_33822 ?auto_33824 ) ) ( not ( = ?auto_33830 ?auto_33829 ) ) ( not ( = ?auto_33830 ?auto_33828 ) ) ( not ( = ?auto_33821 ?auto_33823 ) ) ( not ( = ?auto_33822 ?auto_33823 ) ) ( not ( = ?auto_33824 ?auto_33823 ) ) ( not ( = ?auto_33821 ?auto_33825 ) ) ( not ( = ?auto_33822 ?auto_33825 ) ) ( not ( = ?auto_33824 ?auto_33825 ) ) ( not ( = ?auto_33823 ?auto_33825 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33821 ?auto_33822 ?auto_33824 ?auto_33823 ?auto_33825 ?auto_33820 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33868 - OBJ
      ?auto_33869 - OBJ
      ?auto_33870 - OBJ
      ?auto_33871 - OBJ
      ?auto_33872 - OBJ
      ?auto_33867 - LOCATION
    )
    :vars
    (
      ?auto_33873 - LOCATION
      ?auto_33876 - CITY
      ?auto_33874 - LOCATION
      ?auto_33877 - LOCATION
      ?auto_33875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33873 ?auto_33876 ) ( IN-CITY ?auto_33867 ?auto_33876 ) ( not ( = ?auto_33867 ?auto_33873 ) ) ( OBJ-AT ?auto_33871 ?auto_33873 ) ( OBJ-AT ?auto_33870 ?auto_33873 ) ( IN-CITY ?auto_33874 ?auto_33876 ) ( not ( = ?auto_33867 ?auto_33874 ) ) ( OBJ-AT ?auto_33872 ?auto_33874 ) ( OBJ-AT ?auto_33869 ?auto_33873 ) ( IN-CITY ?auto_33877 ?auto_33876 ) ( not ( = ?auto_33867 ?auto_33877 ) ) ( OBJ-AT ?auto_33868 ?auto_33877 ) ( TRUCK-AT ?auto_33875 ?auto_33867 ) ( not ( = ?auto_33868 ?auto_33869 ) ) ( not ( = ?auto_33873 ?auto_33877 ) ) ( not ( = ?auto_33868 ?auto_33872 ) ) ( not ( = ?auto_33869 ?auto_33872 ) ) ( not ( = ?auto_33874 ?auto_33873 ) ) ( not ( = ?auto_33874 ?auto_33877 ) ) ( not ( = ?auto_33868 ?auto_33870 ) ) ( not ( = ?auto_33869 ?auto_33870 ) ) ( not ( = ?auto_33872 ?auto_33870 ) ) ( not ( = ?auto_33868 ?auto_33871 ) ) ( not ( = ?auto_33869 ?auto_33871 ) ) ( not ( = ?auto_33872 ?auto_33871 ) ) ( not ( = ?auto_33870 ?auto_33871 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33868 ?auto_33869 ?auto_33870 ?auto_33872 ?auto_33871 ?auto_33867 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34349 - OBJ
      ?auto_34350 - OBJ
      ?auto_34351 - OBJ
      ?auto_34352 - OBJ
      ?auto_34353 - OBJ
      ?auto_34348 - LOCATION
    )
    :vars
    (
      ?auto_34354 - LOCATION
      ?auto_34357 - CITY
      ?auto_34355 - LOCATION
      ?auto_34358 - LOCATION
      ?auto_34356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34354 ?auto_34357 ) ( IN-CITY ?auto_34348 ?auto_34357 ) ( not ( = ?auto_34348 ?auto_34354 ) ) ( OBJ-AT ?auto_34353 ?auto_34354 ) ( OBJ-AT ?auto_34352 ?auto_34354 ) ( IN-CITY ?auto_34355 ?auto_34357 ) ( not ( = ?auto_34348 ?auto_34355 ) ) ( OBJ-AT ?auto_34350 ?auto_34355 ) ( OBJ-AT ?auto_34351 ?auto_34354 ) ( IN-CITY ?auto_34358 ?auto_34357 ) ( not ( = ?auto_34348 ?auto_34358 ) ) ( OBJ-AT ?auto_34349 ?auto_34358 ) ( TRUCK-AT ?auto_34356 ?auto_34348 ) ( not ( = ?auto_34349 ?auto_34351 ) ) ( not ( = ?auto_34354 ?auto_34358 ) ) ( not ( = ?auto_34349 ?auto_34350 ) ) ( not ( = ?auto_34351 ?auto_34350 ) ) ( not ( = ?auto_34355 ?auto_34354 ) ) ( not ( = ?auto_34355 ?auto_34358 ) ) ( not ( = ?auto_34349 ?auto_34352 ) ) ( not ( = ?auto_34351 ?auto_34352 ) ) ( not ( = ?auto_34350 ?auto_34352 ) ) ( not ( = ?auto_34349 ?auto_34353 ) ) ( not ( = ?auto_34351 ?auto_34353 ) ) ( not ( = ?auto_34350 ?auto_34353 ) ) ( not ( = ?auto_34352 ?auto_34353 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34349 ?auto_34351 ?auto_34352 ?auto_34350 ?auto_34353 ?auto_34348 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37434 - OBJ
      ?auto_37435 - OBJ
      ?auto_37436 - OBJ
      ?auto_37437 - OBJ
      ?auto_37438 - OBJ
      ?auto_37433 - LOCATION
    )
    :vars
    (
      ?auto_37439 - LOCATION
      ?auto_37442 - CITY
      ?auto_37440 - LOCATION
      ?auto_37443 - LOCATION
      ?auto_37441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37439 ?auto_37442 ) ( IN-CITY ?auto_37433 ?auto_37442 ) ( not ( = ?auto_37433 ?auto_37439 ) ) ( OBJ-AT ?auto_37438 ?auto_37439 ) ( OBJ-AT ?auto_37437 ?auto_37439 ) ( IN-CITY ?auto_37440 ?auto_37442 ) ( not ( = ?auto_37433 ?auto_37440 ) ) ( OBJ-AT ?auto_37436 ?auto_37440 ) ( OBJ-AT ?auto_37434 ?auto_37439 ) ( IN-CITY ?auto_37443 ?auto_37442 ) ( not ( = ?auto_37433 ?auto_37443 ) ) ( OBJ-AT ?auto_37435 ?auto_37443 ) ( TRUCK-AT ?auto_37441 ?auto_37433 ) ( not ( = ?auto_37435 ?auto_37434 ) ) ( not ( = ?auto_37439 ?auto_37443 ) ) ( not ( = ?auto_37435 ?auto_37436 ) ) ( not ( = ?auto_37434 ?auto_37436 ) ) ( not ( = ?auto_37440 ?auto_37439 ) ) ( not ( = ?auto_37440 ?auto_37443 ) ) ( not ( = ?auto_37435 ?auto_37437 ) ) ( not ( = ?auto_37434 ?auto_37437 ) ) ( not ( = ?auto_37436 ?auto_37437 ) ) ( not ( = ?auto_37435 ?auto_37438 ) ) ( not ( = ?auto_37434 ?auto_37438 ) ) ( not ( = ?auto_37436 ?auto_37438 ) ) ( not ( = ?auto_37437 ?auto_37438 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37435 ?auto_37434 ?auto_37437 ?auto_37436 ?auto_37438 ?auto_37433 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37523 - OBJ
      ?auto_37524 - OBJ
      ?auto_37525 - OBJ
      ?auto_37526 - OBJ
      ?auto_37527 - OBJ
      ?auto_37522 - LOCATION
    )
    :vars
    (
      ?auto_37528 - LOCATION
      ?auto_37531 - CITY
      ?auto_37529 - LOCATION
      ?auto_37532 - LOCATION
      ?auto_37530 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37528 ?auto_37531 ) ( IN-CITY ?auto_37522 ?auto_37531 ) ( not ( = ?auto_37522 ?auto_37528 ) ) ( OBJ-AT ?auto_37527 ?auto_37528 ) ( OBJ-AT ?auto_37525 ?auto_37528 ) ( IN-CITY ?auto_37529 ?auto_37531 ) ( not ( = ?auto_37522 ?auto_37529 ) ) ( OBJ-AT ?auto_37526 ?auto_37529 ) ( OBJ-AT ?auto_37523 ?auto_37528 ) ( IN-CITY ?auto_37532 ?auto_37531 ) ( not ( = ?auto_37522 ?auto_37532 ) ) ( OBJ-AT ?auto_37524 ?auto_37532 ) ( TRUCK-AT ?auto_37530 ?auto_37522 ) ( not ( = ?auto_37524 ?auto_37523 ) ) ( not ( = ?auto_37528 ?auto_37532 ) ) ( not ( = ?auto_37524 ?auto_37526 ) ) ( not ( = ?auto_37523 ?auto_37526 ) ) ( not ( = ?auto_37529 ?auto_37528 ) ) ( not ( = ?auto_37529 ?auto_37532 ) ) ( not ( = ?auto_37524 ?auto_37525 ) ) ( not ( = ?auto_37523 ?auto_37525 ) ) ( not ( = ?auto_37526 ?auto_37525 ) ) ( not ( = ?auto_37524 ?auto_37527 ) ) ( not ( = ?auto_37523 ?auto_37527 ) ) ( not ( = ?auto_37526 ?auto_37527 ) ) ( not ( = ?auto_37525 ?auto_37527 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37524 ?auto_37523 ?auto_37525 ?auto_37526 ?auto_37527 ?auto_37522 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37570 - OBJ
      ?auto_37571 - OBJ
      ?auto_37572 - OBJ
      ?auto_37573 - OBJ
      ?auto_37574 - OBJ
      ?auto_37569 - LOCATION
    )
    :vars
    (
      ?auto_37575 - LOCATION
      ?auto_37578 - CITY
      ?auto_37576 - LOCATION
      ?auto_37579 - LOCATION
      ?auto_37577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37575 ?auto_37578 ) ( IN-CITY ?auto_37569 ?auto_37578 ) ( not ( = ?auto_37569 ?auto_37575 ) ) ( OBJ-AT ?auto_37573 ?auto_37575 ) ( OBJ-AT ?auto_37572 ?auto_37575 ) ( IN-CITY ?auto_37576 ?auto_37578 ) ( not ( = ?auto_37569 ?auto_37576 ) ) ( OBJ-AT ?auto_37574 ?auto_37576 ) ( OBJ-AT ?auto_37570 ?auto_37575 ) ( IN-CITY ?auto_37579 ?auto_37578 ) ( not ( = ?auto_37569 ?auto_37579 ) ) ( OBJ-AT ?auto_37571 ?auto_37579 ) ( TRUCK-AT ?auto_37577 ?auto_37569 ) ( not ( = ?auto_37571 ?auto_37570 ) ) ( not ( = ?auto_37575 ?auto_37579 ) ) ( not ( = ?auto_37571 ?auto_37574 ) ) ( not ( = ?auto_37570 ?auto_37574 ) ) ( not ( = ?auto_37576 ?auto_37575 ) ) ( not ( = ?auto_37576 ?auto_37579 ) ) ( not ( = ?auto_37571 ?auto_37572 ) ) ( not ( = ?auto_37570 ?auto_37572 ) ) ( not ( = ?auto_37574 ?auto_37572 ) ) ( not ( = ?auto_37571 ?auto_37573 ) ) ( not ( = ?auto_37570 ?auto_37573 ) ) ( not ( = ?auto_37574 ?auto_37573 ) ) ( not ( = ?auto_37572 ?auto_37573 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37571 ?auto_37570 ?auto_37572 ?auto_37574 ?auto_37573 ?auto_37569 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39423 - OBJ
      ?auto_39424 - OBJ
      ?auto_39425 - OBJ
      ?auto_39426 - OBJ
      ?auto_39427 - OBJ
      ?auto_39422 - LOCATION
    )
    :vars
    (
      ?auto_39428 - LOCATION
      ?auto_39431 - CITY
      ?auto_39429 - LOCATION
      ?auto_39432 - LOCATION
      ?auto_39430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39428 ?auto_39431 ) ( IN-CITY ?auto_39422 ?auto_39431 ) ( not ( = ?auto_39422 ?auto_39428 ) ) ( OBJ-AT ?auto_39427 ?auto_39428 ) ( OBJ-AT ?auto_39424 ?auto_39428 ) ( IN-CITY ?auto_39429 ?auto_39431 ) ( not ( = ?auto_39422 ?auto_39429 ) ) ( OBJ-AT ?auto_39426 ?auto_39429 ) ( OBJ-AT ?auto_39423 ?auto_39428 ) ( IN-CITY ?auto_39432 ?auto_39431 ) ( not ( = ?auto_39422 ?auto_39432 ) ) ( OBJ-AT ?auto_39425 ?auto_39432 ) ( TRUCK-AT ?auto_39430 ?auto_39422 ) ( not ( = ?auto_39425 ?auto_39423 ) ) ( not ( = ?auto_39428 ?auto_39432 ) ) ( not ( = ?auto_39425 ?auto_39426 ) ) ( not ( = ?auto_39423 ?auto_39426 ) ) ( not ( = ?auto_39429 ?auto_39428 ) ) ( not ( = ?auto_39429 ?auto_39432 ) ) ( not ( = ?auto_39425 ?auto_39424 ) ) ( not ( = ?auto_39423 ?auto_39424 ) ) ( not ( = ?auto_39426 ?auto_39424 ) ) ( not ( = ?auto_39425 ?auto_39427 ) ) ( not ( = ?auto_39423 ?auto_39427 ) ) ( not ( = ?auto_39426 ?auto_39427 ) ) ( not ( = ?auto_39424 ?auto_39427 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39425 ?auto_39423 ?auto_39424 ?auto_39426 ?auto_39427 ?auto_39422 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39470 - OBJ
      ?auto_39471 - OBJ
      ?auto_39472 - OBJ
      ?auto_39473 - OBJ
      ?auto_39474 - OBJ
      ?auto_39469 - LOCATION
    )
    :vars
    (
      ?auto_39475 - LOCATION
      ?auto_39478 - CITY
      ?auto_39476 - LOCATION
      ?auto_39479 - LOCATION
      ?auto_39477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39475 ?auto_39478 ) ( IN-CITY ?auto_39469 ?auto_39478 ) ( not ( = ?auto_39469 ?auto_39475 ) ) ( OBJ-AT ?auto_39473 ?auto_39475 ) ( OBJ-AT ?auto_39471 ?auto_39475 ) ( IN-CITY ?auto_39476 ?auto_39478 ) ( not ( = ?auto_39469 ?auto_39476 ) ) ( OBJ-AT ?auto_39474 ?auto_39476 ) ( OBJ-AT ?auto_39470 ?auto_39475 ) ( IN-CITY ?auto_39479 ?auto_39478 ) ( not ( = ?auto_39469 ?auto_39479 ) ) ( OBJ-AT ?auto_39472 ?auto_39479 ) ( TRUCK-AT ?auto_39477 ?auto_39469 ) ( not ( = ?auto_39472 ?auto_39470 ) ) ( not ( = ?auto_39475 ?auto_39479 ) ) ( not ( = ?auto_39472 ?auto_39474 ) ) ( not ( = ?auto_39470 ?auto_39474 ) ) ( not ( = ?auto_39476 ?auto_39475 ) ) ( not ( = ?auto_39476 ?auto_39479 ) ) ( not ( = ?auto_39472 ?auto_39471 ) ) ( not ( = ?auto_39470 ?auto_39471 ) ) ( not ( = ?auto_39474 ?auto_39471 ) ) ( not ( = ?auto_39472 ?auto_39473 ) ) ( not ( = ?auto_39470 ?auto_39473 ) ) ( not ( = ?auto_39474 ?auto_39473 ) ) ( not ( = ?auto_39471 ?auto_39473 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39472 ?auto_39470 ?auto_39471 ?auto_39474 ?auto_39473 ?auto_39469 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39851 - OBJ
      ?auto_39852 - OBJ
      ?auto_39853 - OBJ
      ?auto_39854 - OBJ
      ?auto_39855 - OBJ
      ?auto_39850 - LOCATION
    )
    :vars
    (
      ?auto_39856 - LOCATION
      ?auto_39859 - CITY
      ?auto_39857 - LOCATION
      ?auto_39860 - LOCATION
      ?auto_39858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39856 ?auto_39859 ) ( IN-CITY ?auto_39850 ?auto_39859 ) ( not ( = ?auto_39850 ?auto_39856 ) ) ( OBJ-AT ?auto_39853 ?auto_39856 ) ( OBJ-AT ?auto_39852 ?auto_39856 ) ( IN-CITY ?auto_39857 ?auto_39859 ) ( not ( = ?auto_39850 ?auto_39857 ) ) ( OBJ-AT ?auto_39855 ?auto_39857 ) ( OBJ-AT ?auto_39851 ?auto_39856 ) ( IN-CITY ?auto_39860 ?auto_39859 ) ( not ( = ?auto_39850 ?auto_39860 ) ) ( OBJ-AT ?auto_39854 ?auto_39860 ) ( TRUCK-AT ?auto_39858 ?auto_39850 ) ( not ( = ?auto_39854 ?auto_39851 ) ) ( not ( = ?auto_39856 ?auto_39860 ) ) ( not ( = ?auto_39854 ?auto_39855 ) ) ( not ( = ?auto_39851 ?auto_39855 ) ) ( not ( = ?auto_39857 ?auto_39856 ) ) ( not ( = ?auto_39857 ?auto_39860 ) ) ( not ( = ?auto_39854 ?auto_39852 ) ) ( not ( = ?auto_39851 ?auto_39852 ) ) ( not ( = ?auto_39855 ?auto_39852 ) ) ( not ( = ?auto_39854 ?auto_39853 ) ) ( not ( = ?auto_39851 ?auto_39853 ) ) ( not ( = ?auto_39855 ?auto_39853 ) ) ( not ( = ?auto_39852 ?auto_39853 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39854 ?auto_39851 ?auto_39852 ?auto_39855 ?auto_39853 ?auto_39850 ) )
  )

)

