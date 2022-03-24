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
      ?auto_225485 - OBJ
      ?auto_225484 - LOCATION
    )
    :vars
    (
      ?auto_225487 - LOCATION
      ?auto_225488 - CITY
      ?auto_225486 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225487 ?auto_225488 ) ( IN-CITY ?auto_225484 ?auto_225488 ) ( not ( = ?auto_225484 ?auto_225487 ) ) ( OBJ-AT ?auto_225485 ?auto_225487 ) ( TRUCK-AT ?auto_225486 ?auto_225484 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_225486 ?auto_225484 ?auto_225487 ?auto_225488 )
      ( !LOAD-TRUCK ?auto_225485 ?auto_225486 ?auto_225487 )
      ( !DRIVE-TRUCK ?auto_225486 ?auto_225487 ?auto_225484 ?auto_225488 )
      ( !UNLOAD-TRUCK ?auto_225485 ?auto_225486 ?auto_225484 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_225506 - OBJ
      ?auto_225507 - OBJ
      ?auto_225505 - LOCATION
    )
    :vars
    (
      ?auto_225509 - LOCATION
      ?auto_225510 - CITY
      ?auto_225511 - LOCATION
      ?auto_225508 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225509 ?auto_225510 ) ( IN-CITY ?auto_225505 ?auto_225510 ) ( not ( = ?auto_225505 ?auto_225509 ) ) ( OBJ-AT ?auto_225507 ?auto_225509 ) ( IN-CITY ?auto_225511 ?auto_225510 ) ( not ( = ?auto_225505 ?auto_225511 ) ) ( OBJ-AT ?auto_225506 ?auto_225511 ) ( TRUCK-AT ?auto_225508 ?auto_225505 ) ( not ( = ?auto_225506 ?auto_225507 ) ) ( not ( = ?auto_225509 ?auto_225511 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_225506 ?auto_225505 )
      ( DELIVER-1PKG ?auto_225507 ?auto_225505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_225617 - OBJ
      ?auto_225618 - OBJ
      ?auto_225619 - OBJ
      ?auto_225616 - LOCATION
    )
    :vars
    (
      ?auto_225621 - LOCATION
      ?auto_225620 - CITY
      ?auto_225623 - LOCATION
      ?auto_225624 - LOCATION
      ?auto_225622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225621 ?auto_225620 ) ( IN-CITY ?auto_225616 ?auto_225620 ) ( not ( = ?auto_225616 ?auto_225621 ) ) ( OBJ-AT ?auto_225619 ?auto_225621 ) ( IN-CITY ?auto_225623 ?auto_225620 ) ( not ( = ?auto_225616 ?auto_225623 ) ) ( OBJ-AT ?auto_225618 ?auto_225623 ) ( IN-CITY ?auto_225624 ?auto_225620 ) ( not ( = ?auto_225616 ?auto_225624 ) ) ( OBJ-AT ?auto_225617 ?auto_225624 ) ( TRUCK-AT ?auto_225622 ?auto_225616 ) ( not ( = ?auto_225617 ?auto_225618 ) ) ( not ( = ?auto_225623 ?auto_225624 ) ) ( not ( = ?auto_225617 ?auto_225619 ) ) ( not ( = ?auto_225618 ?auto_225619 ) ) ( not ( = ?auto_225621 ?auto_225623 ) ) ( not ( = ?auto_225621 ?auto_225624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_225617 ?auto_225618 ?auto_225616 )
      ( DELIVER-1PKG ?auto_225619 ?auto_225616 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226751 - OBJ
      ?auto_226752 - OBJ
      ?auto_226753 - OBJ
      ?auto_226754 - OBJ
      ?auto_226750 - LOCATION
    )
    :vars
    (
      ?auto_226756 - LOCATION
      ?auto_226757 - CITY
      ?auto_226759 - LOCATION
      ?auto_226758 - LOCATION
      ?auto_226755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226756 ?auto_226757 ) ( IN-CITY ?auto_226750 ?auto_226757 ) ( not ( = ?auto_226750 ?auto_226756 ) ) ( OBJ-AT ?auto_226754 ?auto_226756 ) ( OBJ-AT ?auto_226753 ?auto_226756 ) ( IN-CITY ?auto_226759 ?auto_226757 ) ( not ( = ?auto_226750 ?auto_226759 ) ) ( OBJ-AT ?auto_226752 ?auto_226759 ) ( IN-CITY ?auto_226758 ?auto_226757 ) ( not ( = ?auto_226750 ?auto_226758 ) ) ( OBJ-AT ?auto_226751 ?auto_226758 ) ( TRUCK-AT ?auto_226755 ?auto_226750 ) ( not ( = ?auto_226751 ?auto_226752 ) ) ( not ( = ?auto_226759 ?auto_226758 ) ) ( not ( = ?auto_226751 ?auto_226753 ) ) ( not ( = ?auto_226752 ?auto_226753 ) ) ( not ( = ?auto_226756 ?auto_226759 ) ) ( not ( = ?auto_226756 ?auto_226758 ) ) ( not ( = ?auto_226751 ?auto_226754 ) ) ( not ( = ?auto_226752 ?auto_226754 ) ) ( not ( = ?auto_226753 ?auto_226754 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_226751 ?auto_226752 ?auto_226753 ?auto_226750 )
      ( DELIVER-1PKG ?auto_226754 ?auto_226750 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226810 - OBJ
      ?auto_226811 - OBJ
      ?auto_226812 - OBJ
      ?auto_226813 - OBJ
      ?auto_226809 - LOCATION
    )
    :vars
    (
      ?auto_226818 - LOCATION
      ?auto_226815 - CITY
      ?auto_226817 - LOCATION
      ?auto_226816 - LOCATION
      ?auto_226814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226818 ?auto_226815 ) ( IN-CITY ?auto_226809 ?auto_226815 ) ( not ( = ?auto_226809 ?auto_226818 ) ) ( OBJ-AT ?auto_226813 ?auto_226818 ) ( OBJ-AT ?auto_226811 ?auto_226818 ) ( IN-CITY ?auto_226817 ?auto_226815 ) ( not ( = ?auto_226809 ?auto_226817 ) ) ( OBJ-AT ?auto_226812 ?auto_226817 ) ( IN-CITY ?auto_226816 ?auto_226815 ) ( not ( = ?auto_226809 ?auto_226816 ) ) ( OBJ-AT ?auto_226810 ?auto_226816 ) ( TRUCK-AT ?auto_226814 ?auto_226809 ) ( not ( = ?auto_226810 ?auto_226812 ) ) ( not ( = ?auto_226817 ?auto_226816 ) ) ( not ( = ?auto_226810 ?auto_226811 ) ) ( not ( = ?auto_226812 ?auto_226811 ) ) ( not ( = ?auto_226818 ?auto_226817 ) ) ( not ( = ?auto_226818 ?auto_226816 ) ) ( not ( = ?auto_226810 ?auto_226813 ) ) ( not ( = ?auto_226812 ?auto_226813 ) ) ( not ( = ?auto_226811 ?auto_226813 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_226810 ?auto_226812 ?auto_226811 ?auto_226813 ?auto_226809 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_226842 - OBJ
      ?auto_226843 - OBJ
      ?auto_226844 - OBJ
      ?auto_226845 - OBJ
      ?auto_226841 - LOCATION
    )
    :vars
    (
      ?auto_226848 - LOCATION
      ?auto_226847 - CITY
      ?auto_226846 - LOCATION
      ?auto_226849 - LOCATION
      ?auto_226850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226848 ?auto_226847 ) ( IN-CITY ?auto_226841 ?auto_226847 ) ( not ( = ?auto_226841 ?auto_226848 ) ) ( OBJ-AT ?auto_226844 ?auto_226848 ) ( OBJ-AT ?auto_226843 ?auto_226848 ) ( IN-CITY ?auto_226846 ?auto_226847 ) ( not ( = ?auto_226841 ?auto_226846 ) ) ( OBJ-AT ?auto_226845 ?auto_226846 ) ( IN-CITY ?auto_226849 ?auto_226847 ) ( not ( = ?auto_226841 ?auto_226849 ) ) ( OBJ-AT ?auto_226842 ?auto_226849 ) ( TRUCK-AT ?auto_226850 ?auto_226841 ) ( not ( = ?auto_226842 ?auto_226845 ) ) ( not ( = ?auto_226846 ?auto_226849 ) ) ( not ( = ?auto_226842 ?auto_226843 ) ) ( not ( = ?auto_226845 ?auto_226843 ) ) ( not ( = ?auto_226848 ?auto_226846 ) ) ( not ( = ?auto_226848 ?auto_226849 ) ) ( not ( = ?auto_226842 ?auto_226844 ) ) ( not ( = ?auto_226845 ?auto_226844 ) ) ( not ( = ?auto_226843 ?auto_226844 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_226842 ?auto_226843 ?auto_226845 ?auto_226844 ?auto_226841 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_227431 - OBJ
      ?auto_227432 - OBJ
      ?auto_227433 - OBJ
      ?auto_227434 - OBJ
      ?auto_227430 - LOCATION
    )
    :vars
    (
      ?auto_227437 - LOCATION
      ?auto_227436 - CITY
      ?auto_227435 - LOCATION
      ?auto_227438 - LOCATION
      ?auto_227439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227437 ?auto_227436 ) ( IN-CITY ?auto_227430 ?auto_227436 ) ( not ( = ?auto_227430 ?auto_227437 ) ) ( OBJ-AT ?auto_227434 ?auto_227437 ) ( OBJ-AT ?auto_227431 ?auto_227437 ) ( IN-CITY ?auto_227435 ?auto_227436 ) ( not ( = ?auto_227430 ?auto_227435 ) ) ( OBJ-AT ?auto_227433 ?auto_227435 ) ( IN-CITY ?auto_227438 ?auto_227436 ) ( not ( = ?auto_227430 ?auto_227438 ) ) ( OBJ-AT ?auto_227432 ?auto_227438 ) ( TRUCK-AT ?auto_227439 ?auto_227430 ) ( not ( = ?auto_227432 ?auto_227433 ) ) ( not ( = ?auto_227435 ?auto_227438 ) ) ( not ( = ?auto_227432 ?auto_227431 ) ) ( not ( = ?auto_227433 ?auto_227431 ) ) ( not ( = ?auto_227437 ?auto_227435 ) ) ( not ( = ?auto_227437 ?auto_227438 ) ) ( not ( = ?auto_227432 ?auto_227434 ) ) ( not ( = ?auto_227433 ?auto_227434 ) ) ( not ( = ?auto_227431 ?auto_227434 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_227432 ?auto_227431 ?auto_227433 ?auto_227434 ?auto_227430 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_227463 - OBJ
      ?auto_227464 - OBJ
      ?auto_227465 - OBJ
      ?auto_227466 - OBJ
      ?auto_227462 - LOCATION
    )
    :vars
    (
      ?auto_227469 - LOCATION
      ?auto_227468 - CITY
      ?auto_227467 - LOCATION
      ?auto_227470 - LOCATION
      ?auto_227471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227469 ?auto_227468 ) ( IN-CITY ?auto_227462 ?auto_227468 ) ( not ( = ?auto_227462 ?auto_227469 ) ) ( OBJ-AT ?auto_227465 ?auto_227469 ) ( OBJ-AT ?auto_227463 ?auto_227469 ) ( IN-CITY ?auto_227467 ?auto_227468 ) ( not ( = ?auto_227462 ?auto_227467 ) ) ( OBJ-AT ?auto_227466 ?auto_227467 ) ( IN-CITY ?auto_227470 ?auto_227468 ) ( not ( = ?auto_227462 ?auto_227470 ) ) ( OBJ-AT ?auto_227464 ?auto_227470 ) ( TRUCK-AT ?auto_227471 ?auto_227462 ) ( not ( = ?auto_227464 ?auto_227466 ) ) ( not ( = ?auto_227467 ?auto_227470 ) ) ( not ( = ?auto_227464 ?auto_227463 ) ) ( not ( = ?auto_227466 ?auto_227463 ) ) ( not ( = ?auto_227469 ?auto_227467 ) ) ( not ( = ?auto_227469 ?auto_227470 ) ) ( not ( = ?auto_227464 ?auto_227465 ) ) ( not ( = ?auto_227466 ?auto_227465 ) ) ( not ( = ?auto_227463 ?auto_227465 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_227464 ?auto_227463 ?auto_227466 ?auto_227465 ?auto_227462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_227651 - OBJ
      ?auto_227652 - OBJ
      ?auto_227653 - OBJ
      ?auto_227654 - OBJ
      ?auto_227650 - LOCATION
    )
    :vars
    (
      ?auto_227657 - LOCATION
      ?auto_227656 - CITY
      ?auto_227655 - LOCATION
      ?auto_227658 - LOCATION
      ?auto_227659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227657 ?auto_227656 ) ( IN-CITY ?auto_227650 ?auto_227656 ) ( not ( = ?auto_227650 ?auto_227657 ) ) ( OBJ-AT ?auto_227652 ?auto_227657 ) ( OBJ-AT ?auto_227651 ?auto_227657 ) ( IN-CITY ?auto_227655 ?auto_227656 ) ( not ( = ?auto_227650 ?auto_227655 ) ) ( OBJ-AT ?auto_227654 ?auto_227655 ) ( IN-CITY ?auto_227658 ?auto_227656 ) ( not ( = ?auto_227650 ?auto_227658 ) ) ( OBJ-AT ?auto_227653 ?auto_227658 ) ( TRUCK-AT ?auto_227659 ?auto_227650 ) ( not ( = ?auto_227653 ?auto_227654 ) ) ( not ( = ?auto_227655 ?auto_227658 ) ) ( not ( = ?auto_227653 ?auto_227651 ) ) ( not ( = ?auto_227654 ?auto_227651 ) ) ( not ( = ?auto_227657 ?auto_227655 ) ) ( not ( = ?auto_227657 ?auto_227658 ) ) ( not ( = ?auto_227653 ?auto_227652 ) ) ( not ( = ?auto_227654 ?auto_227652 ) ) ( not ( = ?auto_227651 ?auto_227652 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_227653 ?auto_227651 ?auto_227654 ?auto_227652 ?auto_227650 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_242161 - OBJ
      ?auto_242162 - OBJ
      ?auto_242163 - OBJ
      ?auto_242164 - OBJ
      ?auto_242165 - OBJ
      ?auto_242160 - LOCATION
    )
    :vars
    (
      ?auto_242168 - LOCATION
      ?auto_242166 - CITY
      ?auto_242169 - LOCATION
      ?auto_242170 - LOCATION
      ?auto_242167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_242168 ?auto_242166 ) ( IN-CITY ?auto_242160 ?auto_242166 ) ( not ( = ?auto_242160 ?auto_242168 ) ) ( OBJ-AT ?auto_242165 ?auto_242168 ) ( OBJ-AT ?auto_242164 ?auto_242168 ) ( OBJ-AT ?auto_242163 ?auto_242168 ) ( IN-CITY ?auto_242169 ?auto_242166 ) ( not ( = ?auto_242160 ?auto_242169 ) ) ( OBJ-AT ?auto_242162 ?auto_242169 ) ( IN-CITY ?auto_242170 ?auto_242166 ) ( not ( = ?auto_242160 ?auto_242170 ) ) ( OBJ-AT ?auto_242161 ?auto_242170 ) ( TRUCK-AT ?auto_242167 ?auto_242160 ) ( not ( = ?auto_242161 ?auto_242162 ) ) ( not ( = ?auto_242169 ?auto_242170 ) ) ( not ( = ?auto_242161 ?auto_242163 ) ) ( not ( = ?auto_242162 ?auto_242163 ) ) ( not ( = ?auto_242168 ?auto_242169 ) ) ( not ( = ?auto_242168 ?auto_242170 ) ) ( not ( = ?auto_242161 ?auto_242164 ) ) ( not ( = ?auto_242162 ?auto_242164 ) ) ( not ( = ?auto_242163 ?auto_242164 ) ) ( not ( = ?auto_242161 ?auto_242165 ) ) ( not ( = ?auto_242162 ?auto_242165 ) ) ( not ( = ?auto_242163 ?auto_242165 ) ) ( not ( = ?auto_242164 ?auto_242165 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_242161 ?auto_242163 ?auto_242162 ?auto_242164 ?auto_242160 )
      ( DELIVER-1PKG ?auto_242165 ?auto_242160 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_242768 - OBJ
      ?auto_242769 - OBJ
      ?auto_242770 - OBJ
      ?auto_242771 - OBJ
      ?auto_242772 - OBJ
      ?auto_242767 - LOCATION
    )
    :vars
    (
      ?auto_242773 - LOCATION
      ?auto_242775 - CITY
      ?auto_242777 - LOCATION
      ?auto_242774 - LOCATION
      ?auto_242776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_242773 ?auto_242775 ) ( IN-CITY ?auto_242767 ?auto_242775 ) ( not ( = ?auto_242767 ?auto_242773 ) ) ( OBJ-AT ?auto_242772 ?auto_242773 ) ( OBJ-AT ?auto_242771 ?auto_242773 ) ( OBJ-AT ?auto_242769 ?auto_242773 ) ( IN-CITY ?auto_242777 ?auto_242775 ) ( not ( = ?auto_242767 ?auto_242777 ) ) ( OBJ-AT ?auto_242770 ?auto_242777 ) ( IN-CITY ?auto_242774 ?auto_242775 ) ( not ( = ?auto_242767 ?auto_242774 ) ) ( OBJ-AT ?auto_242768 ?auto_242774 ) ( TRUCK-AT ?auto_242776 ?auto_242767 ) ( not ( = ?auto_242768 ?auto_242770 ) ) ( not ( = ?auto_242777 ?auto_242774 ) ) ( not ( = ?auto_242768 ?auto_242769 ) ) ( not ( = ?auto_242770 ?auto_242769 ) ) ( not ( = ?auto_242773 ?auto_242777 ) ) ( not ( = ?auto_242773 ?auto_242774 ) ) ( not ( = ?auto_242768 ?auto_242771 ) ) ( not ( = ?auto_242770 ?auto_242771 ) ) ( not ( = ?auto_242769 ?auto_242771 ) ) ( not ( = ?auto_242768 ?auto_242772 ) ) ( not ( = ?auto_242770 ?auto_242772 ) ) ( not ( = ?auto_242769 ?auto_242772 ) ) ( not ( = ?auto_242771 ?auto_242772 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_242768 ?auto_242770 ?auto_242769 ?auto_242771 ?auto_242772 ?auto_242767 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_242958 - OBJ
      ?auto_242959 - OBJ
      ?auto_242960 - OBJ
      ?auto_242961 - OBJ
      ?auto_242962 - OBJ
      ?auto_242957 - LOCATION
    )
    :vars
    (
      ?auto_242965 - LOCATION
      ?auto_242964 - CITY
      ?auto_242963 - LOCATION
      ?auto_242966 - LOCATION
      ?auto_242967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_242965 ?auto_242964 ) ( IN-CITY ?auto_242957 ?auto_242964 ) ( not ( = ?auto_242957 ?auto_242965 ) ) ( OBJ-AT ?auto_242962 ?auto_242965 ) ( OBJ-AT ?auto_242960 ?auto_242965 ) ( OBJ-AT ?auto_242959 ?auto_242965 ) ( IN-CITY ?auto_242963 ?auto_242964 ) ( not ( = ?auto_242957 ?auto_242963 ) ) ( OBJ-AT ?auto_242961 ?auto_242963 ) ( IN-CITY ?auto_242966 ?auto_242964 ) ( not ( = ?auto_242957 ?auto_242966 ) ) ( OBJ-AT ?auto_242958 ?auto_242966 ) ( TRUCK-AT ?auto_242967 ?auto_242957 ) ( not ( = ?auto_242958 ?auto_242961 ) ) ( not ( = ?auto_242963 ?auto_242966 ) ) ( not ( = ?auto_242958 ?auto_242959 ) ) ( not ( = ?auto_242961 ?auto_242959 ) ) ( not ( = ?auto_242965 ?auto_242963 ) ) ( not ( = ?auto_242965 ?auto_242966 ) ) ( not ( = ?auto_242958 ?auto_242960 ) ) ( not ( = ?auto_242961 ?auto_242960 ) ) ( not ( = ?auto_242959 ?auto_242960 ) ) ( not ( = ?auto_242958 ?auto_242962 ) ) ( not ( = ?auto_242961 ?auto_242962 ) ) ( not ( = ?auto_242959 ?auto_242962 ) ) ( not ( = ?auto_242960 ?auto_242962 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_242958 ?auto_242959 ?auto_242961 ?auto_242960 ?auto_242962 ?auto_242957 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_243005 - OBJ
      ?auto_243006 - OBJ
      ?auto_243007 - OBJ
      ?auto_243008 - OBJ
      ?auto_243009 - OBJ
      ?auto_243004 - LOCATION
    )
    :vars
    (
      ?auto_243012 - LOCATION
      ?auto_243011 - CITY
      ?auto_243010 - LOCATION
      ?auto_243013 - LOCATION
      ?auto_243014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_243012 ?auto_243011 ) ( IN-CITY ?auto_243004 ?auto_243011 ) ( not ( = ?auto_243004 ?auto_243012 ) ) ( OBJ-AT ?auto_243008 ?auto_243012 ) ( OBJ-AT ?auto_243007 ?auto_243012 ) ( OBJ-AT ?auto_243006 ?auto_243012 ) ( IN-CITY ?auto_243010 ?auto_243011 ) ( not ( = ?auto_243004 ?auto_243010 ) ) ( OBJ-AT ?auto_243009 ?auto_243010 ) ( IN-CITY ?auto_243013 ?auto_243011 ) ( not ( = ?auto_243004 ?auto_243013 ) ) ( OBJ-AT ?auto_243005 ?auto_243013 ) ( TRUCK-AT ?auto_243014 ?auto_243004 ) ( not ( = ?auto_243005 ?auto_243009 ) ) ( not ( = ?auto_243010 ?auto_243013 ) ) ( not ( = ?auto_243005 ?auto_243006 ) ) ( not ( = ?auto_243009 ?auto_243006 ) ) ( not ( = ?auto_243012 ?auto_243010 ) ) ( not ( = ?auto_243012 ?auto_243013 ) ) ( not ( = ?auto_243005 ?auto_243007 ) ) ( not ( = ?auto_243009 ?auto_243007 ) ) ( not ( = ?auto_243006 ?auto_243007 ) ) ( not ( = ?auto_243005 ?auto_243008 ) ) ( not ( = ?auto_243009 ?auto_243008 ) ) ( not ( = ?auto_243006 ?auto_243008 ) ) ( not ( = ?auto_243007 ?auto_243008 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_243005 ?auto_243006 ?auto_243009 ?auto_243007 ?auto_243008 ?auto_243004 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250214 - OBJ
      ?auto_250215 - OBJ
      ?auto_250216 - OBJ
      ?auto_250217 - OBJ
      ?auto_250218 - OBJ
      ?auto_250213 - LOCATION
    )
    :vars
    (
      ?auto_250221 - LOCATION
      ?auto_250220 - CITY
      ?auto_250219 - LOCATION
      ?auto_250222 - LOCATION
      ?auto_250223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250221 ?auto_250220 ) ( IN-CITY ?auto_250213 ?auto_250220 ) ( not ( = ?auto_250213 ?auto_250221 ) ) ( OBJ-AT ?auto_250218 ?auto_250221 ) ( OBJ-AT ?auto_250217 ?auto_250221 ) ( OBJ-AT ?auto_250214 ?auto_250221 ) ( IN-CITY ?auto_250219 ?auto_250220 ) ( not ( = ?auto_250213 ?auto_250219 ) ) ( OBJ-AT ?auto_250216 ?auto_250219 ) ( IN-CITY ?auto_250222 ?auto_250220 ) ( not ( = ?auto_250213 ?auto_250222 ) ) ( OBJ-AT ?auto_250215 ?auto_250222 ) ( TRUCK-AT ?auto_250223 ?auto_250213 ) ( not ( = ?auto_250215 ?auto_250216 ) ) ( not ( = ?auto_250219 ?auto_250222 ) ) ( not ( = ?auto_250215 ?auto_250214 ) ) ( not ( = ?auto_250216 ?auto_250214 ) ) ( not ( = ?auto_250221 ?auto_250219 ) ) ( not ( = ?auto_250221 ?auto_250222 ) ) ( not ( = ?auto_250215 ?auto_250217 ) ) ( not ( = ?auto_250216 ?auto_250217 ) ) ( not ( = ?auto_250214 ?auto_250217 ) ) ( not ( = ?auto_250215 ?auto_250218 ) ) ( not ( = ?auto_250216 ?auto_250218 ) ) ( not ( = ?auto_250214 ?auto_250218 ) ) ( not ( = ?auto_250217 ?auto_250218 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250215 ?auto_250214 ?auto_250216 ?auto_250217 ?auto_250218 ?auto_250213 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250404 - OBJ
      ?auto_250405 - OBJ
      ?auto_250406 - OBJ
      ?auto_250407 - OBJ
      ?auto_250408 - OBJ
      ?auto_250403 - LOCATION
    )
    :vars
    (
      ?auto_250411 - LOCATION
      ?auto_250410 - CITY
      ?auto_250409 - LOCATION
      ?auto_250412 - LOCATION
      ?auto_250413 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250411 ?auto_250410 ) ( IN-CITY ?auto_250403 ?auto_250410 ) ( not ( = ?auto_250403 ?auto_250411 ) ) ( OBJ-AT ?auto_250408 ?auto_250411 ) ( OBJ-AT ?auto_250406 ?auto_250411 ) ( OBJ-AT ?auto_250404 ?auto_250411 ) ( IN-CITY ?auto_250409 ?auto_250410 ) ( not ( = ?auto_250403 ?auto_250409 ) ) ( OBJ-AT ?auto_250407 ?auto_250409 ) ( IN-CITY ?auto_250412 ?auto_250410 ) ( not ( = ?auto_250403 ?auto_250412 ) ) ( OBJ-AT ?auto_250405 ?auto_250412 ) ( TRUCK-AT ?auto_250413 ?auto_250403 ) ( not ( = ?auto_250405 ?auto_250407 ) ) ( not ( = ?auto_250409 ?auto_250412 ) ) ( not ( = ?auto_250405 ?auto_250404 ) ) ( not ( = ?auto_250407 ?auto_250404 ) ) ( not ( = ?auto_250411 ?auto_250409 ) ) ( not ( = ?auto_250411 ?auto_250412 ) ) ( not ( = ?auto_250405 ?auto_250406 ) ) ( not ( = ?auto_250407 ?auto_250406 ) ) ( not ( = ?auto_250404 ?auto_250406 ) ) ( not ( = ?auto_250405 ?auto_250408 ) ) ( not ( = ?auto_250407 ?auto_250408 ) ) ( not ( = ?auto_250404 ?auto_250408 ) ) ( not ( = ?auto_250406 ?auto_250408 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250405 ?auto_250404 ?auto_250407 ?auto_250406 ?auto_250408 ?auto_250403 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_250451 - OBJ
      ?auto_250452 - OBJ
      ?auto_250453 - OBJ
      ?auto_250454 - OBJ
      ?auto_250455 - OBJ
      ?auto_250450 - LOCATION
    )
    :vars
    (
      ?auto_250458 - LOCATION
      ?auto_250457 - CITY
      ?auto_250456 - LOCATION
      ?auto_250459 - LOCATION
      ?auto_250460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250458 ?auto_250457 ) ( IN-CITY ?auto_250450 ?auto_250457 ) ( not ( = ?auto_250450 ?auto_250458 ) ) ( OBJ-AT ?auto_250454 ?auto_250458 ) ( OBJ-AT ?auto_250453 ?auto_250458 ) ( OBJ-AT ?auto_250451 ?auto_250458 ) ( IN-CITY ?auto_250456 ?auto_250457 ) ( not ( = ?auto_250450 ?auto_250456 ) ) ( OBJ-AT ?auto_250455 ?auto_250456 ) ( IN-CITY ?auto_250459 ?auto_250457 ) ( not ( = ?auto_250450 ?auto_250459 ) ) ( OBJ-AT ?auto_250452 ?auto_250459 ) ( TRUCK-AT ?auto_250460 ?auto_250450 ) ( not ( = ?auto_250452 ?auto_250455 ) ) ( not ( = ?auto_250456 ?auto_250459 ) ) ( not ( = ?auto_250452 ?auto_250451 ) ) ( not ( = ?auto_250455 ?auto_250451 ) ) ( not ( = ?auto_250458 ?auto_250456 ) ) ( not ( = ?auto_250458 ?auto_250459 ) ) ( not ( = ?auto_250452 ?auto_250453 ) ) ( not ( = ?auto_250455 ?auto_250453 ) ) ( not ( = ?auto_250451 ?auto_250453 ) ) ( not ( = ?auto_250452 ?auto_250454 ) ) ( not ( = ?auto_250455 ?auto_250454 ) ) ( not ( = ?auto_250451 ?auto_250454 ) ) ( not ( = ?auto_250453 ?auto_250454 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_250452 ?auto_250451 ?auto_250455 ?auto_250453 ?auto_250454 ?auto_250450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_252304 - OBJ
      ?auto_252305 - OBJ
      ?auto_252306 - OBJ
      ?auto_252307 - OBJ
      ?auto_252308 - OBJ
      ?auto_252303 - LOCATION
    )
    :vars
    (
      ?auto_252311 - LOCATION
      ?auto_252310 - CITY
      ?auto_252309 - LOCATION
      ?auto_252312 - LOCATION
      ?auto_252313 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_252311 ?auto_252310 ) ( IN-CITY ?auto_252303 ?auto_252310 ) ( not ( = ?auto_252303 ?auto_252311 ) ) ( OBJ-AT ?auto_252308 ?auto_252311 ) ( OBJ-AT ?auto_252305 ?auto_252311 ) ( OBJ-AT ?auto_252304 ?auto_252311 ) ( IN-CITY ?auto_252309 ?auto_252310 ) ( not ( = ?auto_252303 ?auto_252309 ) ) ( OBJ-AT ?auto_252307 ?auto_252309 ) ( IN-CITY ?auto_252312 ?auto_252310 ) ( not ( = ?auto_252303 ?auto_252312 ) ) ( OBJ-AT ?auto_252306 ?auto_252312 ) ( TRUCK-AT ?auto_252313 ?auto_252303 ) ( not ( = ?auto_252306 ?auto_252307 ) ) ( not ( = ?auto_252309 ?auto_252312 ) ) ( not ( = ?auto_252306 ?auto_252304 ) ) ( not ( = ?auto_252307 ?auto_252304 ) ) ( not ( = ?auto_252311 ?auto_252309 ) ) ( not ( = ?auto_252311 ?auto_252312 ) ) ( not ( = ?auto_252306 ?auto_252305 ) ) ( not ( = ?auto_252307 ?auto_252305 ) ) ( not ( = ?auto_252304 ?auto_252305 ) ) ( not ( = ?auto_252306 ?auto_252308 ) ) ( not ( = ?auto_252307 ?auto_252308 ) ) ( not ( = ?auto_252304 ?auto_252308 ) ) ( not ( = ?auto_252305 ?auto_252308 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_252306 ?auto_252304 ?auto_252307 ?auto_252305 ?auto_252308 ?auto_252303 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_252351 - OBJ
      ?auto_252352 - OBJ
      ?auto_252353 - OBJ
      ?auto_252354 - OBJ
      ?auto_252355 - OBJ
      ?auto_252350 - LOCATION
    )
    :vars
    (
      ?auto_252358 - LOCATION
      ?auto_252357 - CITY
      ?auto_252356 - LOCATION
      ?auto_252359 - LOCATION
      ?auto_252360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_252358 ?auto_252357 ) ( IN-CITY ?auto_252350 ?auto_252357 ) ( not ( = ?auto_252350 ?auto_252358 ) ) ( OBJ-AT ?auto_252354 ?auto_252358 ) ( OBJ-AT ?auto_252352 ?auto_252358 ) ( OBJ-AT ?auto_252351 ?auto_252358 ) ( IN-CITY ?auto_252356 ?auto_252357 ) ( not ( = ?auto_252350 ?auto_252356 ) ) ( OBJ-AT ?auto_252355 ?auto_252356 ) ( IN-CITY ?auto_252359 ?auto_252357 ) ( not ( = ?auto_252350 ?auto_252359 ) ) ( OBJ-AT ?auto_252353 ?auto_252359 ) ( TRUCK-AT ?auto_252360 ?auto_252350 ) ( not ( = ?auto_252353 ?auto_252355 ) ) ( not ( = ?auto_252356 ?auto_252359 ) ) ( not ( = ?auto_252353 ?auto_252351 ) ) ( not ( = ?auto_252355 ?auto_252351 ) ) ( not ( = ?auto_252358 ?auto_252356 ) ) ( not ( = ?auto_252358 ?auto_252359 ) ) ( not ( = ?auto_252353 ?auto_252352 ) ) ( not ( = ?auto_252355 ?auto_252352 ) ) ( not ( = ?auto_252351 ?auto_252352 ) ) ( not ( = ?auto_252353 ?auto_252354 ) ) ( not ( = ?auto_252355 ?auto_252354 ) ) ( not ( = ?auto_252351 ?auto_252354 ) ) ( not ( = ?auto_252352 ?auto_252354 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_252353 ?auto_252351 ?auto_252355 ?auto_252352 ?auto_252354 ?auto_252350 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_252732 - OBJ
      ?auto_252733 - OBJ
      ?auto_252734 - OBJ
      ?auto_252735 - OBJ
      ?auto_252736 - OBJ
      ?auto_252731 - LOCATION
    )
    :vars
    (
      ?auto_252739 - LOCATION
      ?auto_252738 - CITY
      ?auto_252737 - LOCATION
      ?auto_252740 - LOCATION
      ?auto_252741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_252739 ?auto_252738 ) ( IN-CITY ?auto_252731 ?auto_252738 ) ( not ( = ?auto_252731 ?auto_252739 ) ) ( OBJ-AT ?auto_252734 ?auto_252739 ) ( OBJ-AT ?auto_252733 ?auto_252739 ) ( OBJ-AT ?auto_252732 ?auto_252739 ) ( IN-CITY ?auto_252737 ?auto_252738 ) ( not ( = ?auto_252731 ?auto_252737 ) ) ( OBJ-AT ?auto_252736 ?auto_252737 ) ( IN-CITY ?auto_252740 ?auto_252738 ) ( not ( = ?auto_252731 ?auto_252740 ) ) ( OBJ-AT ?auto_252735 ?auto_252740 ) ( TRUCK-AT ?auto_252741 ?auto_252731 ) ( not ( = ?auto_252735 ?auto_252736 ) ) ( not ( = ?auto_252737 ?auto_252740 ) ) ( not ( = ?auto_252735 ?auto_252732 ) ) ( not ( = ?auto_252736 ?auto_252732 ) ) ( not ( = ?auto_252739 ?auto_252737 ) ) ( not ( = ?auto_252739 ?auto_252740 ) ) ( not ( = ?auto_252735 ?auto_252733 ) ) ( not ( = ?auto_252736 ?auto_252733 ) ) ( not ( = ?auto_252732 ?auto_252733 ) ) ( not ( = ?auto_252735 ?auto_252734 ) ) ( not ( = ?auto_252736 ?auto_252734 ) ) ( not ( = ?auto_252732 ?auto_252734 ) ) ( not ( = ?auto_252733 ?auto_252734 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_252735 ?auto_252732 ?auto_252736 ?auto_252733 ?auto_252734 ?auto_252731 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_496606 - OBJ
      ?auto_496607 - OBJ
      ?auto_496608 - OBJ
      ?auto_496609 - OBJ
      ?auto_496610 - OBJ
      ?auto_496611 - OBJ
      ?auto_496605 - LOCATION
    )
    :vars
    (
      ?auto_496612 - LOCATION
      ?auto_496614 - CITY
      ?auto_496615 - LOCATION
      ?auto_496616 - LOCATION
      ?auto_496613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_496612 ?auto_496614 ) ( IN-CITY ?auto_496605 ?auto_496614 ) ( not ( = ?auto_496605 ?auto_496612 ) ) ( OBJ-AT ?auto_496611 ?auto_496612 ) ( IN-CITY ?auto_496615 ?auto_496614 ) ( not ( = ?auto_496605 ?auto_496615 ) ) ( OBJ-AT ?auto_496610 ?auto_496615 ) ( OBJ-AT ?auto_496609 ?auto_496615 ) ( OBJ-AT ?auto_496608 ?auto_496615 ) ( OBJ-AT ?auto_496607 ?auto_496612 ) ( IN-CITY ?auto_496616 ?auto_496614 ) ( not ( = ?auto_496605 ?auto_496616 ) ) ( OBJ-AT ?auto_496606 ?auto_496616 ) ( TRUCK-AT ?auto_496613 ?auto_496605 ) ( not ( = ?auto_496606 ?auto_496607 ) ) ( not ( = ?auto_496612 ?auto_496616 ) ) ( not ( = ?auto_496606 ?auto_496608 ) ) ( not ( = ?auto_496607 ?auto_496608 ) ) ( not ( = ?auto_496615 ?auto_496612 ) ) ( not ( = ?auto_496615 ?auto_496616 ) ) ( not ( = ?auto_496606 ?auto_496609 ) ) ( not ( = ?auto_496607 ?auto_496609 ) ) ( not ( = ?auto_496608 ?auto_496609 ) ) ( not ( = ?auto_496606 ?auto_496610 ) ) ( not ( = ?auto_496607 ?auto_496610 ) ) ( not ( = ?auto_496608 ?auto_496610 ) ) ( not ( = ?auto_496609 ?auto_496610 ) ) ( not ( = ?auto_496606 ?auto_496611 ) ) ( not ( = ?auto_496607 ?auto_496611 ) ) ( not ( = ?auto_496608 ?auto_496611 ) ) ( not ( = ?auto_496609 ?auto_496611 ) ) ( not ( = ?auto_496610 ?auto_496611 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_496606 ?auto_496608 ?auto_496607 ?auto_496609 ?auto_496610 ?auto_496605 )
      ( DELIVER-1PKG ?auto_496611 ?auto_496605 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_496670 - OBJ
      ?auto_496671 - OBJ
      ?auto_496672 - OBJ
      ?auto_496673 - OBJ
      ?auto_496674 - OBJ
      ?auto_496675 - OBJ
      ?auto_496669 - LOCATION
    )
    :vars
    (
      ?auto_496676 - LOCATION
      ?auto_496679 - CITY
      ?auto_496680 - LOCATION
      ?auto_496677 - LOCATION
      ?auto_496678 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_496676 ?auto_496679 ) ( IN-CITY ?auto_496669 ?auto_496679 ) ( not ( = ?auto_496669 ?auto_496676 ) ) ( OBJ-AT ?auto_496674 ?auto_496676 ) ( IN-CITY ?auto_496680 ?auto_496679 ) ( not ( = ?auto_496669 ?auto_496680 ) ) ( OBJ-AT ?auto_496675 ?auto_496680 ) ( OBJ-AT ?auto_496673 ?auto_496680 ) ( OBJ-AT ?auto_496672 ?auto_496680 ) ( OBJ-AT ?auto_496671 ?auto_496676 ) ( IN-CITY ?auto_496677 ?auto_496679 ) ( not ( = ?auto_496669 ?auto_496677 ) ) ( OBJ-AT ?auto_496670 ?auto_496677 ) ( TRUCK-AT ?auto_496678 ?auto_496669 ) ( not ( = ?auto_496670 ?auto_496671 ) ) ( not ( = ?auto_496676 ?auto_496677 ) ) ( not ( = ?auto_496670 ?auto_496672 ) ) ( not ( = ?auto_496671 ?auto_496672 ) ) ( not ( = ?auto_496680 ?auto_496676 ) ) ( not ( = ?auto_496680 ?auto_496677 ) ) ( not ( = ?auto_496670 ?auto_496673 ) ) ( not ( = ?auto_496671 ?auto_496673 ) ) ( not ( = ?auto_496672 ?auto_496673 ) ) ( not ( = ?auto_496670 ?auto_496675 ) ) ( not ( = ?auto_496671 ?auto_496675 ) ) ( not ( = ?auto_496672 ?auto_496675 ) ) ( not ( = ?auto_496673 ?auto_496675 ) ) ( not ( = ?auto_496670 ?auto_496674 ) ) ( not ( = ?auto_496671 ?auto_496674 ) ) ( not ( = ?auto_496672 ?auto_496674 ) ) ( not ( = ?auto_496673 ?auto_496674 ) ) ( not ( = ?auto_496675 ?auto_496674 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_496670 ?auto_496671 ?auto_496672 ?auto_496673 ?auto_496675 ?auto_496674 ?auto_496669 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_497124 - OBJ
      ?auto_497125 - OBJ
      ?auto_497126 - OBJ
      ?auto_497127 - OBJ
      ?auto_497128 - OBJ
      ?auto_497129 - OBJ
      ?auto_497123 - LOCATION
    )
    :vars
    (
      ?auto_497131 - LOCATION
      ?auto_497132 - CITY
      ?auto_497133 - LOCATION
      ?auto_497134 - LOCATION
      ?auto_497130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_497131 ?auto_497132 ) ( IN-CITY ?auto_497123 ?auto_497132 ) ( not ( = ?auto_497123 ?auto_497131 ) ) ( OBJ-AT ?auto_497127 ?auto_497131 ) ( IN-CITY ?auto_497133 ?auto_497132 ) ( not ( = ?auto_497123 ?auto_497133 ) ) ( OBJ-AT ?auto_497129 ?auto_497133 ) ( OBJ-AT ?auto_497128 ?auto_497133 ) ( OBJ-AT ?auto_497126 ?auto_497133 ) ( OBJ-AT ?auto_497125 ?auto_497131 ) ( IN-CITY ?auto_497134 ?auto_497132 ) ( not ( = ?auto_497123 ?auto_497134 ) ) ( OBJ-AT ?auto_497124 ?auto_497134 ) ( TRUCK-AT ?auto_497130 ?auto_497123 ) ( not ( = ?auto_497124 ?auto_497125 ) ) ( not ( = ?auto_497131 ?auto_497134 ) ) ( not ( = ?auto_497124 ?auto_497126 ) ) ( not ( = ?auto_497125 ?auto_497126 ) ) ( not ( = ?auto_497133 ?auto_497131 ) ) ( not ( = ?auto_497133 ?auto_497134 ) ) ( not ( = ?auto_497124 ?auto_497128 ) ) ( not ( = ?auto_497125 ?auto_497128 ) ) ( not ( = ?auto_497126 ?auto_497128 ) ) ( not ( = ?auto_497124 ?auto_497129 ) ) ( not ( = ?auto_497125 ?auto_497129 ) ) ( not ( = ?auto_497126 ?auto_497129 ) ) ( not ( = ?auto_497128 ?auto_497129 ) ) ( not ( = ?auto_497124 ?auto_497127 ) ) ( not ( = ?auto_497125 ?auto_497127 ) ) ( not ( = ?auto_497126 ?auto_497127 ) ) ( not ( = ?auto_497128 ?auto_497127 ) ) ( not ( = ?auto_497129 ?auto_497127 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_497124 ?auto_497125 ?auto_497126 ?auto_497128 ?auto_497127 ?auto_497129 ?auto_497123 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_500983 - OBJ
      ?auto_500984 - OBJ
      ?auto_500985 - OBJ
      ?auto_500986 - OBJ
      ?auto_500987 - OBJ
      ?auto_500988 - OBJ
      ?auto_500982 - LOCATION
    )
    :vars
    (
      ?auto_500990 - LOCATION
      ?auto_500991 - CITY
      ?auto_500992 - LOCATION
      ?auto_500993 - LOCATION
      ?auto_500989 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_500990 ?auto_500991 ) ( IN-CITY ?auto_500982 ?auto_500991 ) ( not ( = ?auto_500982 ?auto_500990 ) ) ( OBJ-AT ?auto_500985 ?auto_500990 ) ( IN-CITY ?auto_500992 ?auto_500991 ) ( not ( = ?auto_500982 ?auto_500992 ) ) ( OBJ-AT ?auto_500988 ?auto_500992 ) ( OBJ-AT ?auto_500987 ?auto_500992 ) ( OBJ-AT ?auto_500986 ?auto_500992 ) ( OBJ-AT ?auto_500984 ?auto_500990 ) ( IN-CITY ?auto_500993 ?auto_500991 ) ( not ( = ?auto_500982 ?auto_500993 ) ) ( OBJ-AT ?auto_500983 ?auto_500993 ) ( TRUCK-AT ?auto_500989 ?auto_500982 ) ( not ( = ?auto_500983 ?auto_500984 ) ) ( not ( = ?auto_500990 ?auto_500993 ) ) ( not ( = ?auto_500983 ?auto_500986 ) ) ( not ( = ?auto_500984 ?auto_500986 ) ) ( not ( = ?auto_500992 ?auto_500990 ) ) ( not ( = ?auto_500992 ?auto_500993 ) ) ( not ( = ?auto_500983 ?auto_500987 ) ) ( not ( = ?auto_500984 ?auto_500987 ) ) ( not ( = ?auto_500986 ?auto_500987 ) ) ( not ( = ?auto_500983 ?auto_500988 ) ) ( not ( = ?auto_500984 ?auto_500988 ) ) ( not ( = ?auto_500986 ?auto_500988 ) ) ( not ( = ?auto_500987 ?auto_500988 ) ) ( not ( = ?auto_500983 ?auto_500985 ) ) ( not ( = ?auto_500984 ?auto_500985 ) ) ( not ( = ?auto_500986 ?auto_500985 ) ) ( not ( = ?auto_500987 ?auto_500985 ) ) ( not ( = ?auto_500988 ?auto_500985 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_500983 ?auto_500984 ?auto_500986 ?auto_500987 ?auto_500985 ?auto_500988 ?auto_500982 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_504390 - OBJ
      ?auto_504391 - OBJ
      ?auto_504392 - OBJ
      ?auto_504393 - OBJ
      ?auto_504394 - OBJ
      ?auto_504395 - OBJ
      ?auto_504389 - LOCATION
    )
    :vars
    (
      ?auto_504397 - LOCATION
      ?auto_504398 - CITY
      ?auto_504399 - LOCATION
      ?auto_504400 - LOCATION
      ?auto_504396 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_504397 ?auto_504398 ) ( IN-CITY ?auto_504389 ?auto_504398 ) ( not ( = ?auto_504389 ?auto_504397 ) ) ( OBJ-AT ?auto_504395 ?auto_504397 ) ( IN-CITY ?auto_504399 ?auto_504398 ) ( not ( = ?auto_504389 ?auto_504399 ) ) ( OBJ-AT ?auto_504394 ?auto_504399 ) ( OBJ-AT ?auto_504393 ?auto_504399 ) ( OBJ-AT ?auto_504391 ?auto_504399 ) ( OBJ-AT ?auto_504392 ?auto_504397 ) ( IN-CITY ?auto_504400 ?auto_504398 ) ( not ( = ?auto_504389 ?auto_504400 ) ) ( OBJ-AT ?auto_504390 ?auto_504400 ) ( TRUCK-AT ?auto_504396 ?auto_504389 ) ( not ( = ?auto_504390 ?auto_504392 ) ) ( not ( = ?auto_504397 ?auto_504400 ) ) ( not ( = ?auto_504390 ?auto_504391 ) ) ( not ( = ?auto_504392 ?auto_504391 ) ) ( not ( = ?auto_504399 ?auto_504397 ) ) ( not ( = ?auto_504399 ?auto_504400 ) ) ( not ( = ?auto_504390 ?auto_504393 ) ) ( not ( = ?auto_504392 ?auto_504393 ) ) ( not ( = ?auto_504391 ?auto_504393 ) ) ( not ( = ?auto_504390 ?auto_504394 ) ) ( not ( = ?auto_504392 ?auto_504394 ) ) ( not ( = ?auto_504391 ?auto_504394 ) ) ( not ( = ?auto_504393 ?auto_504394 ) ) ( not ( = ?auto_504390 ?auto_504395 ) ) ( not ( = ?auto_504392 ?auto_504395 ) ) ( not ( = ?auto_504391 ?auto_504395 ) ) ( not ( = ?auto_504393 ?auto_504395 ) ) ( not ( = ?auto_504394 ?auto_504395 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_504390 ?auto_504392 ?auto_504391 ?auto_504393 ?auto_504395 ?auto_504394 ?auto_504389 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_504454 - OBJ
      ?auto_504455 - OBJ
      ?auto_504456 - OBJ
      ?auto_504457 - OBJ
      ?auto_504458 - OBJ
      ?auto_504459 - OBJ
      ?auto_504453 - LOCATION
    )
    :vars
    (
      ?auto_504461 - LOCATION
      ?auto_504462 - CITY
      ?auto_504463 - LOCATION
      ?auto_504464 - LOCATION
      ?auto_504460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_504461 ?auto_504462 ) ( IN-CITY ?auto_504453 ?auto_504462 ) ( not ( = ?auto_504453 ?auto_504461 ) ) ( OBJ-AT ?auto_504458 ?auto_504461 ) ( IN-CITY ?auto_504463 ?auto_504462 ) ( not ( = ?auto_504453 ?auto_504463 ) ) ( OBJ-AT ?auto_504459 ?auto_504463 ) ( OBJ-AT ?auto_504457 ?auto_504463 ) ( OBJ-AT ?auto_504455 ?auto_504463 ) ( OBJ-AT ?auto_504456 ?auto_504461 ) ( IN-CITY ?auto_504464 ?auto_504462 ) ( not ( = ?auto_504453 ?auto_504464 ) ) ( OBJ-AT ?auto_504454 ?auto_504464 ) ( TRUCK-AT ?auto_504460 ?auto_504453 ) ( not ( = ?auto_504454 ?auto_504456 ) ) ( not ( = ?auto_504461 ?auto_504464 ) ) ( not ( = ?auto_504454 ?auto_504455 ) ) ( not ( = ?auto_504456 ?auto_504455 ) ) ( not ( = ?auto_504463 ?auto_504461 ) ) ( not ( = ?auto_504463 ?auto_504464 ) ) ( not ( = ?auto_504454 ?auto_504457 ) ) ( not ( = ?auto_504456 ?auto_504457 ) ) ( not ( = ?auto_504455 ?auto_504457 ) ) ( not ( = ?auto_504454 ?auto_504459 ) ) ( not ( = ?auto_504456 ?auto_504459 ) ) ( not ( = ?auto_504455 ?auto_504459 ) ) ( not ( = ?auto_504457 ?auto_504459 ) ) ( not ( = ?auto_504454 ?auto_504458 ) ) ( not ( = ?auto_504456 ?auto_504458 ) ) ( not ( = ?auto_504455 ?auto_504458 ) ) ( not ( = ?auto_504457 ?auto_504458 ) ) ( not ( = ?auto_504459 ?auto_504458 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_504454 ?auto_504456 ?auto_504455 ?auto_504457 ?auto_504458 ?auto_504459 ?auto_504453 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_504908 - OBJ
      ?auto_504909 - OBJ
      ?auto_504910 - OBJ
      ?auto_504911 - OBJ
      ?auto_504912 - OBJ
      ?auto_504913 - OBJ
      ?auto_504907 - LOCATION
    )
    :vars
    (
      ?auto_504915 - LOCATION
      ?auto_504916 - CITY
      ?auto_504917 - LOCATION
      ?auto_504918 - LOCATION
      ?auto_504914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_504915 ?auto_504916 ) ( IN-CITY ?auto_504907 ?auto_504916 ) ( not ( = ?auto_504907 ?auto_504915 ) ) ( OBJ-AT ?auto_504911 ?auto_504915 ) ( IN-CITY ?auto_504917 ?auto_504916 ) ( not ( = ?auto_504907 ?auto_504917 ) ) ( OBJ-AT ?auto_504913 ?auto_504917 ) ( OBJ-AT ?auto_504912 ?auto_504917 ) ( OBJ-AT ?auto_504909 ?auto_504917 ) ( OBJ-AT ?auto_504910 ?auto_504915 ) ( IN-CITY ?auto_504918 ?auto_504916 ) ( not ( = ?auto_504907 ?auto_504918 ) ) ( OBJ-AT ?auto_504908 ?auto_504918 ) ( TRUCK-AT ?auto_504914 ?auto_504907 ) ( not ( = ?auto_504908 ?auto_504910 ) ) ( not ( = ?auto_504915 ?auto_504918 ) ) ( not ( = ?auto_504908 ?auto_504909 ) ) ( not ( = ?auto_504910 ?auto_504909 ) ) ( not ( = ?auto_504917 ?auto_504915 ) ) ( not ( = ?auto_504917 ?auto_504918 ) ) ( not ( = ?auto_504908 ?auto_504912 ) ) ( not ( = ?auto_504910 ?auto_504912 ) ) ( not ( = ?auto_504909 ?auto_504912 ) ) ( not ( = ?auto_504908 ?auto_504913 ) ) ( not ( = ?auto_504910 ?auto_504913 ) ) ( not ( = ?auto_504909 ?auto_504913 ) ) ( not ( = ?auto_504912 ?auto_504913 ) ) ( not ( = ?auto_504908 ?auto_504911 ) ) ( not ( = ?auto_504910 ?auto_504911 ) ) ( not ( = ?auto_504909 ?auto_504911 ) ) ( not ( = ?auto_504912 ?auto_504911 ) ) ( not ( = ?auto_504913 ?auto_504911 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_504908 ?auto_504910 ?auto_504909 ?auto_504912 ?auto_504911 ?auto_504913 ?auto_504907 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_506564 - OBJ
      ?auto_506565 - OBJ
      ?auto_506566 - OBJ
      ?auto_506567 - OBJ
      ?auto_506568 - OBJ
      ?auto_506569 - OBJ
      ?auto_506563 - LOCATION
    )
    :vars
    (
      ?auto_506571 - LOCATION
      ?auto_506572 - CITY
      ?auto_506573 - LOCATION
      ?auto_506574 - LOCATION
      ?auto_506570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_506571 ?auto_506572 ) ( IN-CITY ?auto_506563 ?auto_506572 ) ( not ( = ?auto_506563 ?auto_506571 ) ) ( OBJ-AT ?auto_506569 ?auto_506571 ) ( IN-CITY ?auto_506573 ?auto_506572 ) ( not ( = ?auto_506563 ?auto_506573 ) ) ( OBJ-AT ?auto_506568 ?auto_506573 ) ( OBJ-AT ?auto_506566 ?auto_506573 ) ( OBJ-AT ?auto_506565 ?auto_506573 ) ( OBJ-AT ?auto_506567 ?auto_506571 ) ( IN-CITY ?auto_506574 ?auto_506572 ) ( not ( = ?auto_506563 ?auto_506574 ) ) ( OBJ-AT ?auto_506564 ?auto_506574 ) ( TRUCK-AT ?auto_506570 ?auto_506563 ) ( not ( = ?auto_506564 ?auto_506567 ) ) ( not ( = ?auto_506571 ?auto_506574 ) ) ( not ( = ?auto_506564 ?auto_506565 ) ) ( not ( = ?auto_506567 ?auto_506565 ) ) ( not ( = ?auto_506573 ?auto_506571 ) ) ( not ( = ?auto_506573 ?auto_506574 ) ) ( not ( = ?auto_506564 ?auto_506566 ) ) ( not ( = ?auto_506567 ?auto_506566 ) ) ( not ( = ?auto_506565 ?auto_506566 ) ) ( not ( = ?auto_506564 ?auto_506568 ) ) ( not ( = ?auto_506567 ?auto_506568 ) ) ( not ( = ?auto_506565 ?auto_506568 ) ) ( not ( = ?auto_506566 ?auto_506568 ) ) ( not ( = ?auto_506564 ?auto_506569 ) ) ( not ( = ?auto_506567 ?auto_506569 ) ) ( not ( = ?auto_506565 ?auto_506569 ) ) ( not ( = ?auto_506566 ?auto_506569 ) ) ( not ( = ?auto_506568 ?auto_506569 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_506564 ?auto_506567 ?auto_506565 ?auto_506566 ?auto_506569 ?auto_506568 ?auto_506563 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_506628 - OBJ
      ?auto_506629 - OBJ
      ?auto_506630 - OBJ
      ?auto_506631 - OBJ
      ?auto_506632 - OBJ
      ?auto_506633 - OBJ
      ?auto_506627 - LOCATION
    )
    :vars
    (
      ?auto_506635 - LOCATION
      ?auto_506636 - CITY
      ?auto_506637 - LOCATION
      ?auto_506638 - LOCATION
      ?auto_506634 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_506635 ?auto_506636 ) ( IN-CITY ?auto_506627 ?auto_506636 ) ( not ( = ?auto_506627 ?auto_506635 ) ) ( OBJ-AT ?auto_506632 ?auto_506635 ) ( IN-CITY ?auto_506637 ?auto_506636 ) ( not ( = ?auto_506627 ?auto_506637 ) ) ( OBJ-AT ?auto_506633 ?auto_506637 ) ( OBJ-AT ?auto_506630 ?auto_506637 ) ( OBJ-AT ?auto_506629 ?auto_506637 ) ( OBJ-AT ?auto_506631 ?auto_506635 ) ( IN-CITY ?auto_506638 ?auto_506636 ) ( not ( = ?auto_506627 ?auto_506638 ) ) ( OBJ-AT ?auto_506628 ?auto_506638 ) ( TRUCK-AT ?auto_506634 ?auto_506627 ) ( not ( = ?auto_506628 ?auto_506631 ) ) ( not ( = ?auto_506635 ?auto_506638 ) ) ( not ( = ?auto_506628 ?auto_506629 ) ) ( not ( = ?auto_506631 ?auto_506629 ) ) ( not ( = ?auto_506637 ?auto_506635 ) ) ( not ( = ?auto_506637 ?auto_506638 ) ) ( not ( = ?auto_506628 ?auto_506630 ) ) ( not ( = ?auto_506631 ?auto_506630 ) ) ( not ( = ?auto_506629 ?auto_506630 ) ) ( not ( = ?auto_506628 ?auto_506633 ) ) ( not ( = ?auto_506631 ?auto_506633 ) ) ( not ( = ?auto_506629 ?auto_506633 ) ) ( not ( = ?auto_506630 ?auto_506633 ) ) ( not ( = ?auto_506628 ?auto_506632 ) ) ( not ( = ?auto_506631 ?auto_506632 ) ) ( not ( = ?auto_506629 ?auto_506632 ) ) ( not ( = ?auto_506630 ?auto_506632 ) ) ( not ( = ?auto_506633 ?auto_506632 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_506628 ?auto_506631 ?auto_506629 ?auto_506630 ?auto_506632 ?auto_506633 ?auto_506627 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_506966 - OBJ
      ?auto_506967 - OBJ
      ?auto_506968 - OBJ
      ?auto_506969 - OBJ
      ?auto_506970 - OBJ
      ?auto_506971 - OBJ
      ?auto_506965 - LOCATION
    )
    :vars
    (
      ?auto_506973 - LOCATION
      ?auto_506974 - CITY
      ?auto_506975 - LOCATION
      ?auto_506976 - LOCATION
      ?auto_506972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_506973 ?auto_506974 ) ( IN-CITY ?auto_506965 ?auto_506974 ) ( not ( = ?auto_506965 ?auto_506973 ) ) ( OBJ-AT ?auto_506971 ?auto_506973 ) ( IN-CITY ?auto_506975 ?auto_506974 ) ( not ( = ?auto_506965 ?auto_506975 ) ) ( OBJ-AT ?auto_506969 ?auto_506975 ) ( OBJ-AT ?auto_506968 ?auto_506975 ) ( OBJ-AT ?auto_506967 ?auto_506975 ) ( OBJ-AT ?auto_506970 ?auto_506973 ) ( IN-CITY ?auto_506976 ?auto_506974 ) ( not ( = ?auto_506965 ?auto_506976 ) ) ( OBJ-AT ?auto_506966 ?auto_506976 ) ( TRUCK-AT ?auto_506972 ?auto_506965 ) ( not ( = ?auto_506966 ?auto_506970 ) ) ( not ( = ?auto_506973 ?auto_506976 ) ) ( not ( = ?auto_506966 ?auto_506967 ) ) ( not ( = ?auto_506970 ?auto_506967 ) ) ( not ( = ?auto_506975 ?auto_506973 ) ) ( not ( = ?auto_506975 ?auto_506976 ) ) ( not ( = ?auto_506966 ?auto_506968 ) ) ( not ( = ?auto_506970 ?auto_506968 ) ) ( not ( = ?auto_506967 ?auto_506968 ) ) ( not ( = ?auto_506966 ?auto_506969 ) ) ( not ( = ?auto_506970 ?auto_506969 ) ) ( not ( = ?auto_506967 ?auto_506969 ) ) ( not ( = ?auto_506968 ?auto_506969 ) ) ( not ( = ?auto_506966 ?auto_506971 ) ) ( not ( = ?auto_506970 ?auto_506971 ) ) ( not ( = ?auto_506967 ?auto_506971 ) ) ( not ( = ?auto_506968 ?auto_506971 ) ) ( not ( = ?auto_506969 ?auto_506971 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_506966 ?auto_506970 ?auto_506967 ?auto_506968 ?auto_506971 ?auto_506969 ?auto_506965 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_550744 - OBJ
      ?auto_550745 - OBJ
      ?auto_550746 - OBJ
      ?auto_550747 - OBJ
      ?auto_550748 - OBJ
      ?auto_550749 - OBJ
      ?auto_550743 - LOCATION
    )
    :vars
    (
      ?auto_550751 - LOCATION
      ?auto_550752 - CITY
      ?auto_550753 - LOCATION
      ?auto_550754 - LOCATION
      ?auto_550750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_550751 ?auto_550752 ) ( IN-CITY ?auto_550743 ?auto_550752 ) ( not ( = ?auto_550743 ?auto_550751 ) ) ( OBJ-AT ?auto_550749 ?auto_550751 ) ( IN-CITY ?auto_550753 ?auto_550752 ) ( not ( = ?auto_550743 ?auto_550753 ) ) ( OBJ-AT ?auto_550748 ?auto_550753 ) ( OBJ-AT ?auto_550747 ?auto_550753 ) ( OBJ-AT ?auto_550746 ?auto_550753 ) ( OBJ-AT ?auto_550744 ?auto_550751 ) ( IN-CITY ?auto_550754 ?auto_550752 ) ( not ( = ?auto_550743 ?auto_550754 ) ) ( OBJ-AT ?auto_550745 ?auto_550754 ) ( TRUCK-AT ?auto_550750 ?auto_550743 ) ( not ( = ?auto_550745 ?auto_550744 ) ) ( not ( = ?auto_550751 ?auto_550754 ) ) ( not ( = ?auto_550745 ?auto_550746 ) ) ( not ( = ?auto_550744 ?auto_550746 ) ) ( not ( = ?auto_550753 ?auto_550751 ) ) ( not ( = ?auto_550753 ?auto_550754 ) ) ( not ( = ?auto_550745 ?auto_550747 ) ) ( not ( = ?auto_550744 ?auto_550747 ) ) ( not ( = ?auto_550746 ?auto_550747 ) ) ( not ( = ?auto_550745 ?auto_550748 ) ) ( not ( = ?auto_550744 ?auto_550748 ) ) ( not ( = ?auto_550746 ?auto_550748 ) ) ( not ( = ?auto_550747 ?auto_550748 ) ) ( not ( = ?auto_550745 ?auto_550749 ) ) ( not ( = ?auto_550744 ?auto_550749 ) ) ( not ( = ?auto_550746 ?auto_550749 ) ) ( not ( = ?auto_550747 ?auto_550749 ) ) ( not ( = ?auto_550748 ?auto_550749 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_550745 ?auto_550744 ?auto_550746 ?auto_550747 ?auto_550749 ?auto_550748 ?auto_550743 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_550808 - OBJ
      ?auto_550809 - OBJ
      ?auto_550810 - OBJ
      ?auto_550811 - OBJ
      ?auto_550812 - OBJ
      ?auto_550813 - OBJ
      ?auto_550807 - LOCATION
    )
    :vars
    (
      ?auto_550815 - LOCATION
      ?auto_550816 - CITY
      ?auto_550817 - LOCATION
      ?auto_550818 - LOCATION
      ?auto_550814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_550815 ?auto_550816 ) ( IN-CITY ?auto_550807 ?auto_550816 ) ( not ( = ?auto_550807 ?auto_550815 ) ) ( OBJ-AT ?auto_550812 ?auto_550815 ) ( IN-CITY ?auto_550817 ?auto_550816 ) ( not ( = ?auto_550807 ?auto_550817 ) ) ( OBJ-AT ?auto_550813 ?auto_550817 ) ( OBJ-AT ?auto_550811 ?auto_550817 ) ( OBJ-AT ?auto_550810 ?auto_550817 ) ( OBJ-AT ?auto_550808 ?auto_550815 ) ( IN-CITY ?auto_550818 ?auto_550816 ) ( not ( = ?auto_550807 ?auto_550818 ) ) ( OBJ-AT ?auto_550809 ?auto_550818 ) ( TRUCK-AT ?auto_550814 ?auto_550807 ) ( not ( = ?auto_550809 ?auto_550808 ) ) ( not ( = ?auto_550815 ?auto_550818 ) ) ( not ( = ?auto_550809 ?auto_550810 ) ) ( not ( = ?auto_550808 ?auto_550810 ) ) ( not ( = ?auto_550817 ?auto_550815 ) ) ( not ( = ?auto_550817 ?auto_550818 ) ) ( not ( = ?auto_550809 ?auto_550811 ) ) ( not ( = ?auto_550808 ?auto_550811 ) ) ( not ( = ?auto_550810 ?auto_550811 ) ) ( not ( = ?auto_550809 ?auto_550813 ) ) ( not ( = ?auto_550808 ?auto_550813 ) ) ( not ( = ?auto_550810 ?auto_550813 ) ) ( not ( = ?auto_550811 ?auto_550813 ) ) ( not ( = ?auto_550809 ?auto_550812 ) ) ( not ( = ?auto_550808 ?auto_550812 ) ) ( not ( = ?auto_550810 ?auto_550812 ) ) ( not ( = ?auto_550811 ?auto_550812 ) ) ( not ( = ?auto_550813 ?auto_550812 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_550809 ?auto_550808 ?auto_550810 ?auto_550811 ?auto_550812 ?auto_550813 ?auto_550807 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_551262 - OBJ
      ?auto_551263 - OBJ
      ?auto_551264 - OBJ
      ?auto_551265 - OBJ
      ?auto_551266 - OBJ
      ?auto_551267 - OBJ
      ?auto_551261 - LOCATION
    )
    :vars
    (
      ?auto_551269 - LOCATION
      ?auto_551270 - CITY
      ?auto_551271 - LOCATION
      ?auto_551272 - LOCATION
      ?auto_551268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_551269 ?auto_551270 ) ( IN-CITY ?auto_551261 ?auto_551270 ) ( not ( = ?auto_551261 ?auto_551269 ) ) ( OBJ-AT ?auto_551265 ?auto_551269 ) ( IN-CITY ?auto_551271 ?auto_551270 ) ( not ( = ?auto_551261 ?auto_551271 ) ) ( OBJ-AT ?auto_551267 ?auto_551271 ) ( OBJ-AT ?auto_551266 ?auto_551271 ) ( OBJ-AT ?auto_551264 ?auto_551271 ) ( OBJ-AT ?auto_551262 ?auto_551269 ) ( IN-CITY ?auto_551272 ?auto_551270 ) ( not ( = ?auto_551261 ?auto_551272 ) ) ( OBJ-AT ?auto_551263 ?auto_551272 ) ( TRUCK-AT ?auto_551268 ?auto_551261 ) ( not ( = ?auto_551263 ?auto_551262 ) ) ( not ( = ?auto_551269 ?auto_551272 ) ) ( not ( = ?auto_551263 ?auto_551264 ) ) ( not ( = ?auto_551262 ?auto_551264 ) ) ( not ( = ?auto_551271 ?auto_551269 ) ) ( not ( = ?auto_551271 ?auto_551272 ) ) ( not ( = ?auto_551263 ?auto_551266 ) ) ( not ( = ?auto_551262 ?auto_551266 ) ) ( not ( = ?auto_551264 ?auto_551266 ) ) ( not ( = ?auto_551263 ?auto_551267 ) ) ( not ( = ?auto_551262 ?auto_551267 ) ) ( not ( = ?auto_551264 ?auto_551267 ) ) ( not ( = ?auto_551266 ?auto_551267 ) ) ( not ( = ?auto_551263 ?auto_551265 ) ) ( not ( = ?auto_551262 ?auto_551265 ) ) ( not ( = ?auto_551264 ?auto_551265 ) ) ( not ( = ?auto_551266 ?auto_551265 ) ) ( not ( = ?auto_551267 ?auto_551265 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_551263 ?auto_551262 ?auto_551264 ?auto_551266 ?auto_551265 ?auto_551267 ?auto_551261 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_555121 - OBJ
      ?auto_555122 - OBJ
      ?auto_555123 - OBJ
      ?auto_555124 - OBJ
      ?auto_555125 - OBJ
      ?auto_555126 - OBJ
      ?auto_555120 - LOCATION
    )
    :vars
    (
      ?auto_555128 - LOCATION
      ?auto_555129 - CITY
      ?auto_555130 - LOCATION
      ?auto_555131 - LOCATION
      ?auto_555127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_555128 ?auto_555129 ) ( IN-CITY ?auto_555120 ?auto_555129 ) ( not ( = ?auto_555120 ?auto_555128 ) ) ( OBJ-AT ?auto_555123 ?auto_555128 ) ( IN-CITY ?auto_555130 ?auto_555129 ) ( not ( = ?auto_555120 ?auto_555130 ) ) ( OBJ-AT ?auto_555126 ?auto_555130 ) ( OBJ-AT ?auto_555125 ?auto_555130 ) ( OBJ-AT ?auto_555124 ?auto_555130 ) ( OBJ-AT ?auto_555121 ?auto_555128 ) ( IN-CITY ?auto_555131 ?auto_555129 ) ( not ( = ?auto_555120 ?auto_555131 ) ) ( OBJ-AT ?auto_555122 ?auto_555131 ) ( TRUCK-AT ?auto_555127 ?auto_555120 ) ( not ( = ?auto_555122 ?auto_555121 ) ) ( not ( = ?auto_555128 ?auto_555131 ) ) ( not ( = ?auto_555122 ?auto_555124 ) ) ( not ( = ?auto_555121 ?auto_555124 ) ) ( not ( = ?auto_555130 ?auto_555128 ) ) ( not ( = ?auto_555130 ?auto_555131 ) ) ( not ( = ?auto_555122 ?auto_555125 ) ) ( not ( = ?auto_555121 ?auto_555125 ) ) ( not ( = ?auto_555124 ?auto_555125 ) ) ( not ( = ?auto_555122 ?auto_555126 ) ) ( not ( = ?auto_555121 ?auto_555126 ) ) ( not ( = ?auto_555124 ?auto_555126 ) ) ( not ( = ?auto_555125 ?auto_555126 ) ) ( not ( = ?auto_555122 ?auto_555123 ) ) ( not ( = ?auto_555121 ?auto_555123 ) ) ( not ( = ?auto_555124 ?auto_555123 ) ) ( not ( = ?auto_555125 ?auto_555123 ) ) ( not ( = ?auto_555126 ?auto_555123 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_555122 ?auto_555121 ?auto_555124 ?auto_555125 ?auto_555123 ?auto_555126 ?auto_555120 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_566781 - OBJ
      ?auto_566782 - OBJ
      ?auto_566783 - OBJ
      ?auto_566784 - OBJ
      ?auto_566785 - OBJ
      ?auto_566786 - OBJ
      ?auto_566780 - LOCATION
    )
    :vars
    (
      ?auto_566788 - LOCATION
      ?auto_566789 - CITY
      ?auto_566790 - LOCATION
      ?auto_566791 - LOCATION
      ?auto_566787 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_566788 ?auto_566789 ) ( IN-CITY ?auto_566780 ?auto_566789 ) ( not ( = ?auto_566780 ?auto_566788 ) ) ( OBJ-AT ?auto_566786 ?auto_566788 ) ( IN-CITY ?auto_566790 ?auto_566789 ) ( not ( = ?auto_566780 ?auto_566790 ) ) ( OBJ-AT ?auto_566785 ?auto_566790 ) ( OBJ-AT ?auto_566784 ?auto_566790 ) ( OBJ-AT ?auto_566782 ?auto_566790 ) ( OBJ-AT ?auto_566781 ?auto_566788 ) ( IN-CITY ?auto_566791 ?auto_566789 ) ( not ( = ?auto_566780 ?auto_566791 ) ) ( OBJ-AT ?auto_566783 ?auto_566791 ) ( TRUCK-AT ?auto_566787 ?auto_566780 ) ( not ( = ?auto_566783 ?auto_566781 ) ) ( not ( = ?auto_566788 ?auto_566791 ) ) ( not ( = ?auto_566783 ?auto_566782 ) ) ( not ( = ?auto_566781 ?auto_566782 ) ) ( not ( = ?auto_566790 ?auto_566788 ) ) ( not ( = ?auto_566790 ?auto_566791 ) ) ( not ( = ?auto_566783 ?auto_566784 ) ) ( not ( = ?auto_566781 ?auto_566784 ) ) ( not ( = ?auto_566782 ?auto_566784 ) ) ( not ( = ?auto_566783 ?auto_566785 ) ) ( not ( = ?auto_566781 ?auto_566785 ) ) ( not ( = ?auto_566782 ?auto_566785 ) ) ( not ( = ?auto_566784 ?auto_566785 ) ) ( not ( = ?auto_566783 ?auto_566786 ) ) ( not ( = ?auto_566781 ?auto_566786 ) ) ( not ( = ?auto_566782 ?auto_566786 ) ) ( not ( = ?auto_566784 ?auto_566786 ) ) ( not ( = ?auto_566785 ?auto_566786 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_566783 ?auto_566781 ?auto_566782 ?auto_566784 ?auto_566786 ?auto_566785 ?auto_566780 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_566845 - OBJ
      ?auto_566846 - OBJ
      ?auto_566847 - OBJ
      ?auto_566848 - OBJ
      ?auto_566849 - OBJ
      ?auto_566850 - OBJ
      ?auto_566844 - LOCATION
    )
    :vars
    (
      ?auto_566852 - LOCATION
      ?auto_566853 - CITY
      ?auto_566854 - LOCATION
      ?auto_566855 - LOCATION
      ?auto_566851 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_566852 ?auto_566853 ) ( IN-CITY ?auto_566844 ?auto_566853 ) ( not ( = ?auto_566844 ?auto_566852 ) ) ( OBJ-AT ?auto_566849 ?auto_566852 ) ( IN-CITY ?auto_566854 ?auto_566853 ) ( not ( = ?auto_566844 ?auto_566854 ) ) ( OBJ-AT ?auto_566850 ?auto_566854 ) ( OBJ-AT ?auto_566848 ?auto_566854 ) ( OBJ-AT ?auto_566846 ?auto_566854 ) ( OBJ-AT ?auto_566845 ?auto_566852 ) ( IN-CITY ?auto_566855 ?auto_566853 ) ( not ( = ?auto_566844 ?auto_566855 ) ) ( OBJ-AT ?auto_566847 ?auto_566855 ) ( TRUCK-AT ?auto_566851 ?auto_566844 ) ( not ( = ?auto_566847 ?auto_566845 ) ) ( not ( = ?auto_566852 ?auto_566855 ) ) ( not ( = ?auto_566847 ?auto_566846 ) ) ( not ( = ?auto_566845 ?auto_566846 ) ) ( not ( = ?auto_566854 ?auto_566852 ) ) ( not ( = ?auto_566854 ?auto_566855 ) ) ( not ( = ?auto_566847 ?auto_566848 ) ) ( not ( = ?auto_566845 ?auto_566848 ) ) ( not ( = ?auto_566846 ?auto_566848 ) ) ( not ( = ?auto_566847 ?auto_566850 ) ) ( not ( = ?auto_566845 ?auto_566850 ) ) ( not ( = ?auto_566846 ?auto_566850 ) ) ( not ( = ?auto_566848 ?auto_566850 ) ) ( not ( = ?auto_566847 ?auto_566849 ) ) ( not ( = ?auto_566845 ?auto_566849 ) ) ( not ( = ?auto_566846 ?auto_566849 ) ) ( not ( = ?auto_566848 ?auto_566849 ) ) ( not ( = ?auto_566850 ?auto_566849 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_566847 ?auto_566845 ?auto_566846 ?auto_566848 ?auto_566849 ?auto_566850 ?auto_566844 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_567299 - OBJ
      ?auto_567300 - OBJ
      ?auto_567301 - OBJ
      ?auto_567302 - OBJ
      ?auto_567303 - OBJ
      ?auto_567304 - OBJ
      ?auto_567298 - LOCATION
    )
    :vars
    (
      ?auto_567306 - LOCATION
      ?auto_567307 - CITY
      ?auto_567308 - LOCATION
      ?auto_567309 - LOCATION
      ?auto_567305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_567306 ?auto_567307 ) ( IN-CITY ?auto_567298 ?auto_567307 ) ( not ( = ?auto_567298 ?auto_567306 ) ) ( OBJ-AT ?auto_567302 ?auto_567306 ) ( IN-CITY ?auto_567308 ?auto_567307 ) ( not ( = ?auto_567298 ?auto_567308 ) ) ( OBJ-AT ?auto_567304 ?auto_567308 ) ( OBJ-AT ?auto_567303 ?auto_567308 ) ( OBJ-AT ?auto_567300 ?auto_567308 ) ( OBJ-AT ?auto_567299 ?auto_567306 ) ( IN-CITY ?auto_567309 ?auto_567307 ) ( not ( = ?auto_567298 ?auto_567309 ) ) ( OBJ-AT ?auto_567301 ?auto_567309 ) ( TRUCK-AT ?auto_567305 ?auto_567298 ) ( not ( = ?auto_567301 ?auto_567299 ) ) ( not ( = ?auto_567306 ?auto_567309 ) ) ( not ( = ?auto_567301 ?auto_567300 ) ) ( not ( = ?auto_567299 ?auto_567300 ) ) ( not ( = ?auto_567308 ?auto_567306 ) ) ( not ( = ?auto_567308 ?auto_567309 ) ) ( not ( = ?auto_567301 ?auto_567303 ) ) ( not ( = ?auto_567299 ?auto_567303 ) ) ( not ( = ?auto_567300 ?auto_567303 ) ) ( not ( = ?auto_567301 ?auto_567304 ) ) ( not ( = ?auto_567299 ?auto_567304 ) ) ( not ( = ?auto_567300 ?auto_567304 ) ) ( not ( = ?auto_567303 ?auto_567304 ) ) ( not ( = ?auto_567301 ?auto_567302 ) ) ( not ( = ?auto_567299 ?auto_567302 ) ) ( not ( = ?auto_567300 ?auto_567302 ) ) ( not ( = ?auto_567303 ?auto_567302 ) ) ( not ( = ?auto_567304 ?auto_567302 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_567301 ?auto_567299 ?auto_567300 ?auto_567303 ?auto_567302 ?auto_567304 ?auto_567298 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_570080 - OBJ
      ?auto_570081 - OBJ
      ?auto_570082 - OBJ
      ?auto_570083 - OBJ
      ?auto_570084 - OBJ
      ?auto_570085 - OBJ
      ?auto_570079 - LOCATION
    )
    :vars
    (
      ?auto_570087 - LOCATION
      ?auto_570088 - CITY
      ?auto_570089 - LOCATION
      ?auto_570090 - LOCATION
      ?auto_570086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_570087 ?auto_570088 ) ( IN-CITY ?auto_570079 ?auto_570088 ) ( not ( = ?auto_570079 ?auto_570087 ) ) ( OBJ-AT ?auto_570085 ?auto_570087 ) ( IN-CITY ?auto_570089 ?auto_570088 ) ( not ( = ?auto_570079 ?auto_570089 ) ) ( OBJ-AT ?auto_570084 ?auto_570089 ) ( OBJ-AT ?auto_570082 ?auto_570089 ) ( OBJ-AT ?auto_570081 ?auto_570089 ) ( OBJ-AT ?auto_570080 ?auto_570087 ) ( IN-CITY ?auto_570090 ?auto_570088 ) ( not ( = ?auto_570079 ?auto_570090 ) ) ( OBJ-AT ?auto_570083 ?auto_570090 ) ( TRUCK-AT ?auto_570086 ?auto_570079 ) ( not ( = ?auto_570083 ?auto_570080 ) ) ( not ( = ?auto_570087 ?auto_570090 ) ) ( not ( = ?auto_570083 ?auto_570081 ) ) ( not ( = ?auto_570080 ?auto_570081 ) ) ( not ( = ?auto_570089 ?auto_570087 ) ) ( not ( = ?auto_570089 ?auto_570090 ) ) ( not ( = ?auto_570083 ?auto_570082 ) ) ( not ( = ?auto_570080 ?auto_570082 ) ) ( not ( = ?auto_570081 ?auto_570082 ) ) ( not ( = ?auto_570083 ?auto_570084 ) ) ( not ( = ?auto_570080 ?auto_570084 ) ) ( not ( = ?auto_570081 ?auto_570084 ) ) ( not ( = ?auto_570082 ?auto_570084 ) ) ( not ( = ?auto_570083 ?auto_570085 ) ) ( not ( = ?auto_570080 ?auto_570085 ) ) ( not ( = ?auto_570081 ?auto_570085 ) ) ( not ( = ?auto_570082 ?auto_570085 ) ) ( not ( = ?auto_570084 ?auto_570085 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_570083 ?auto_570080 ?auto_570081 ?auto_570082 ?auto_570085 ?auto_570084 ?auto_570079 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_570144 - OBJ
      ?auto_570145 - OBJ
      ?auto_570146 - OBJ
      ?auto_570147 - OBJ
      ?auto_570148 - OBJ
      ?auto_570149 - OBJ
      ?auto_570143 - LOCATION
    )
    :vars
    (
      ?auto_570151 - LOCATION
      ?auto_570152 - CITY
      ?auto_570153 - LOCATION
      ?auto_570154 - LOCATION
      ?auto_570150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_570151 ?auto_570152 ) ( IN-CITY ?auto_570143 ?auto_570152 ) ( not ( = ?auto_570143 ?auto_570151 ) ) ( OBJ-AT ?auto_570148 ?auto_570151 ) ( IN-CITY ?auto_570153 ?auto_570152 ) ( not ( = ?auto_570143 ?auto_570153 ) ) ( OBJ-AT ?auto_570149 ?auto_570153 ) ( OBJ-AT ?auto_570146 ?auto_570153 ) ( OBJ-AT ?auto_570145 ?auto_570153 ) ( OBJ-AT ?auto_570144 ?auto_570151 ) ( IN-CITY ?auto_570154 ?auto_570152 ) ( not ( = ?auto_570143 ?auto_570154 ) ) ( OBJ-AT ?auto_570147 ?auto_570154 ) ( TRUCK-AT ?auto_570150 ?auto_570143 ) ( not ( = ?auto_570147 ?auto_570144 ) ) ( not ( = ?auto_570151 ?auto_570154 ) ) ( not ( = ?auto_570147 ?auto_570145 ) ) ( not ( = ?auto_570144 ?auto_570145 ) ) ( not ( = ?auto_570153 ?auto_570151 ) ) ( not ( = ?auto_570153 ?auto_570154 ) ) ( not ( = ?auto_570147 ?auto_570146 ) ) ( not ( = ?auto_570144 ?auto_570146 ) ) ( not ( = ?auto_570145 ?auto_570146 ) ) ( not ( = ?auto_570147 ?auto_570149 ) ) ( not ( = ?auto_570144 ?auto_570149 ) ) ( not ( = ?auto_570145 ?auto_570149 ) ) ( not ( = ?auto_570146 ?auto_570149 ) ) ( not ( = ?auto_570147 ?auto_570148 ) ) ( not ( = ?auto_570144 ?auto_570148 ) ) ( not ( = ?auto_570145 ?auto_570148 ) ) ( not ( = ?auto_570146 ?auto_570148 ) ) ( not ( = ?auto_570149 ?auto_570148 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_570147 ?auto_570144 ?auto_570145 ?auto_570146 ?auto_570148 ?auto_570149 ?auto_570143 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_570619 - OBJ
      ?auto_570620 - OBJ
      ?auto_570621 - OBJ
      ?auto_570622 - OBJ
      ?auto_570623 - OBJ
      ?auto_570624 - OBJ
      ?auto_570618 - LOCATION
    )
    :vars
    (
      ?auto_570626 - LOCATION
      ?auto_570627 - CITY
      ?auto_570628 - LOCATION
      ?auto_570629 - LOCATION
      ?auto_570625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_570626 ?auto_570627 ) ( IN-CITY ?auto_570618 ?auto_570627 ) ( not ( = ?auto_570618 ?auto_570626 ) ) ( OBJ-AT ?auto_570624 ?auto_570626 ) ( IN-CITY ?auto_570628 ?auto_570627 ) ( not ( = ?auto_570618 ?auto_570628 ) ) ( OBJ-AT ?auto_570622 ?auto_570628 ) ( OBJ-AT ?auto_570621 ?auto_570628 ) ( OBJ-AT ?auto_570620 ?auto_570628 ) ( OBJ-AT ?auto_570619 ?auto_570626 ) ( IN-CITY ?auto_570629 ?auto_570627 ) ( not ( = ?auto_570618 ?auto_570629 ) ) ( OBJ-AT ?auto_570623 ?auto_570629 ) ( TRUCK-AT ?auto_570625 ?auto_570618 ) ( not ( = ?auto_570623 ?auto_570619 ) ) ( not ( = ?auto_570626 ?auto_570629 ) ) ( not ( = ?auto_570623 ?auto_570620 ) ) ( not ( = ?auto_570619 ?auto_570620 ) ) ( not ( = ?auto_570628 ?auto_570626 ) ) ( not ( = ?auto_570628 ?auto_570629 ) ) ( not ( = ?auto_570623 ?auto_570621 ) ) ( not ( = ?auto_570619 ?auto_570621 ) ) ( not ( = ?auto_570620 ?auto_570621 ) ) ( not ( = ?auto_570623 ?auto_570622 ) ) ( not ( = ?auto_570619 ?auto_570622 ) ) ( not ( = ?auto_570620 ?auto_570622 ) ) ( not ( = ?auto_570621 ?auto_570622 ) ) ( not ( = ?auto_570623 ?auto_570624 ) ) ( not ( = ?auto_570619 ?auto_570624 ) ) ( not ( = ?auto_570620 ?auto_570624 ) ) ( not ( = ?auto_570621 ?auto_570624 ) ) ( not ( = ?auto_570622 ?auto_570624 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_570623 ?auto_570619 ?auto_570620 ?auto_570621 ?auto_570624 ?auto_570622 ?auto_570618 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_570683 - OBJ
      ?auto_570684 - OBJ
      ?auto_570685 - OBJ
      ?auto_570686 - OBJ
      ?auto_570687 - OBJ
      ?auto_570688 - OBJ
      ?auto_570682 - LOCATION
    )
    :vars
    (
      ?auto_570690 - LOCATION
      ?auto_570691 - CITY
      ?auto_570692 - LOCATION
      ?auto_570693 - LOCATION
      ?auto_570689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_570690 ?auto_570691 ) ( IN-CITY ?auto_570682 ?auto_570691 ) ( not ( = ?auto_570682 ?auto_570690 ) ) ( OBJ-AT ?auto_570687 ?auto_570690 ) ( IN-CITY ?auto_570692 ?auto_570691 ) ( not ( = ?auto_570682 ?auto_570692 ) ) ( OBJ-AT ?auto_570686 ?auto_570692 ) ( OBJ-AT ?auto_570685 ?auto_570692 ) ( OBJ-AT ?auto_570684 ?auto_570692 ) ( OBJ-AT ?auto_570683 ?auto_570690 ) ( IN-CITY ?auto_570693 ?auto_570691 ) ( not ( = ?auto_570682 ?auto_570693 ) ) ( OBJ-AT ?auto_570688 ?auto_570693 ) ( TRUCK-AT ?auto_570689 ?auto_570682 ) ( not ( = ?auto_570688 ?auto_570683 ) ) ( not ( = ?auto_570690 ?auto_570693 ) ) ( not ( = ?auto_570688 ?auto_570684 ) ) ( not ( = ?auto_570683 ?auto_570684 ) ) ( not ( = ?auto_570692 ?auto_570690 ) ) ( not ( = ?auto_570692 ?auto_570693 ) ) ( not ( = ?auto_570688 ?auto_570685 ) ) ( not ( = ?auto_570683 ?auto_570685 ) ) ( not ( = ?auto_570684 ?auto_570685 ) ) ( not ( = ?auto_570688 ?auto_570686 ) ) ( not ( = ?auto_570683 ?auto_570686 ) ) ( not ( = ?auto_570684 ?auto_570686 ) ) ( not ( = ?auto_570685 ?auto_570686 ) ) ( not ( = ?auto_570688 ?auto_570687 ) ) ( not ( = ?auto_570683 ?auto_570687 ) ) ( not ( = ?auto_570684 ?auto_570687 ) ) ( not ( = ?auto_570685 ?auto_570687 ) ) ( not ( = ?auto_570686 ?auto_570687 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_570688 ?auto_570683 ?auto_570684 ?auto_570685 ?auto_570687 ?auto_570686 ?auto_570682 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_570812 - OBJ
      ?auto_570813 - OBJ
      ?auto_570814 - OBJ
      ?auto_570815 - OBJ
      ?auto_570816 - OBJ
      ?auto_570817 - OBJ
      ?auto_570811 - LOCATION
    )
    :vars
    (
      ?auto_570819 - LOCATION
      ?auto_570820 - CITY
      ?auto_570821 - LOCATION
      ?auto_570822 - LOCATION
      ?auto_570818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_570819 ?auto_570820 ) ( IN-CITY ?auto_570811 ?auto_570820 ) ( not ( = ?auto_570811 ?auto_570819 ) ) ( OBJ-AT ?auto_570815 ?auto_570819 ) ( IN-CITY ?auto_570821 ?auto_570820 ) ( not ( = ?auto_570811 ?auto_570821 ) ) ( OBJ-AT ?auto_570817 ?auto_570821 ) ( OBJ-AT ?auto_570814 ?auto_570821 ) ( OBJ-AT ?auto_570813 ?auto_570821 ) ( OBJ-AT ?auto_570812 ?auto_570819 ) ( IN-CITY ?auto_570822 ?auto_570820 ) ( not ( = ?auto_570811 ?auto_570822 ) ) ( OBJ-AT ?auto_570816 ?auto_570822 ) ( TRUCK-AT ?auto_570818 ?auto_570811 ) ( not ( = ?auto_570816 ?auto_570812 ) ) ( not ( = ?auto_570819 ?auto_570822 ) ) ( not ( = ?auto_570816 ?auto_570813 ) ) ( not ( = ?auto_570812 ?auto_570813 ) ) ( not ( = ?auto_570821 ?auto_570819 ) ) ( not ( = ?auto_570821 ?auto_570822 ) ) ( not ( = ?auto_570816 ?auto_570814 ) ) ( not ( = ?auto_570812 ?auto_570814 ) ) ( not ( = ?auto_570813 ?auto_570814 ) ) ( not ( = ?auto_570816 ?auto_570817 ) ) ( not ( = ?auto_570812 ?auto_570817 ) ) ( not ( = ?auto_570813 ?auto_570817 ) ) ( not ( = ?auto_570814 ?auto_570817 ) ) ( not ( = ?auto_570816 ?auto_570815 ) ) ( not ( = ?auto_570812 ?auto_570815 ) ) ( not ( = ?auto_570813 ?auto_570815 ) ) ( not ( = ?auto_570814 ?auto_570815 ) ) ( not ( = ?auto_570817 ?auto_570815 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_570816 ?auto_570812 ?auto_570813 ?auto_570814 ?auto_570815 ?auto_570817 ?auto_570811 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_571083 - OBJ
      ?auto_571084 - OBJ
      ?auto_571085 - OBJ
      ?auto_571086 - OBJ
      ?auto_571087 - OBJ
      ?auto_571088 - OBJ
      ?auto_571082 - LOCATION
    )
    :vars
    (
      ?auto_571090 - LOCATION
      ?auto_571091 - CITY
      ?auto_571092 - LOCATION
      ?auto_571093 - LOCATION
      ?auto_571089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_571090 ?auto_571091 ) ( IN-CITY ?auto_571082 ?auto_571091 ) ( not ( = ?auto_571082 ?auto_571090 ) ) ( OBJ-AT ?auto_571086 ?auto_571090 ) ( IN-CITY ?auto_571092 ?auto_571091 ) ( not ( = ?auto_571082 ?auto_571092 ) ) ( OBJ-AT ?auto_571087 ?auto_571092 ) ( OBJ-AT ?auto_571085 ?auto_571092 ) ( OBJ-AT ?auto_571084 ?auto_571092 ) ( OBJ-AT ?auto_571083 ?auto_571090 ) ( IN-CITY ?auto_571093 ?auto_571091 ) ( not ( = ?auto_571082 ?auto_571093 ) ) ( OBJ-AT ?auto_571088 ?auto_571093 ) ( TRUCK-AT ?auto_571089 ?auto_571082 ) ( not ( = ?auto_571088 ?auto_571083 ) ) ( not ( = ?auto_571090 ?auto_571093 ) ) ( not ( = ?auto_571088 ?auto_571084 ) ) ( not ( = ?auto_571083 ?auto_571084 ) ) ( not ( = ?auto_571092 ?auto_571090 ) ) ( not ( = ?auto_571092 ?auto_571093 ) ) ( not ( = ?auto_571088 ?auto_571085 ) ) ( not ( = ?auto_571083 ?auto_571085 ) ) ( not ( = ?auto_571084 ?auto_571085 ) ) ( not ( = ?auto_571088 ?auto_571087 ) ) ( not ( = ?auto_571083 ?auto_571087 ) ) ( not ( = ?auto_571084 ?auto_571087 ) ) ( not ( = ?auto_571085 ?auto_571087 ) ) ( not ( = ?auto_571088 ?auto_571086 ) ) ( not ( = ?auto_571083 ?auto_571086 ) ) ( not ( = ?auto_571084 ?auto_571086 ) ) ( not ( = ?auto_571085 ?auto_571086 ) ) ( not ( = ?auto_571087 ?auto_571086 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_571088 ?auto_571083 ?auto_571084 ?auto_571085 ?auto_571086 ?auto_571087 ?auto_571082 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_572724 - OBJ
      ?auto_572725 - OBJ
      ?auto_572726 - OBJ
      ?auto_572727 - OBJ
      ?auto_572728 - OBJ
      ?auto_572729 - OBJ
      ?auto_572723 - LOCATION
    )
    :vars
    (
      ?auto_572731 - LOCATION
      ?auto_572732 - CITY
      ?auto_572733 - LOCATION
      ?auto_572734 - LOCATION
      ?auto_572730 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_572731 ?auto_572732 ) ( IN-CITY ?auto_572723 ?auto_572732 ) ( not ( = ?auto_572723 ?auto_572731 ) ) ( OBJ-AT ?auto_572726 ?auto_572731 ) ( IN-CITY ?auto_572733 ?auto_572732 ) ( not ( = ?auto_572723 ?auto_572733 ) ) ( OBJ-AT ?auto_572729 ?auto_572733 ) ( OBJ-AT ?auto_572728 ?auto_572733 ) ( OBJ-AT ?auto_572725 ?auto_572733 ) ( OBJ-AT ?auto_572724 ?auto_572731 ) ( IN-CITY ?auto_572734 ?auto_572732 ) ( not ( = ?auto_572723 ?auto_572734 ) ) ( OBJ-AT ?auto_572727 ?auto_572734 ) ( TRUCK-AT ?auto_572730 ?auto_572723 ) ( not ( = ?auto_572727 ?auto_572724 ) ) ( not ( = ?auto_572731 ?auto_572734 ) ) ( not ( = ?auto_572727 ?auto_572725 ) ) ( not ( = ?auto_572724 ?auto_572725 ) ) ( not ( = ?auto_572733 ?auto_572731 ) ) ( not ( = ?auto_572733 ?auto_572734 ) ) ( not ( = ?auto_572727 ?auto_572728 ) ) ( not ( = ?auto_572724 ?auto_572728 ) ) ( not ( = ?auto_572725 ?auto_572728 ) ) ( not ( = ?auto_572727 ?auto_572729 ) ) ( not ( = ?auto_572724 ?auto_572729 ) ) ( not ( = ?auto_572725 ?auto_572729 ) ) ( not ( = ?auto_572728 ?auto_572729 ) ) ( not ( = ?auto_572727 ?auto_572726 ) ) ( not ( = ?auto_572724 ?auto_572726 ) ) ( not ( = ?auto_572725 ?auto_572726 ) ) ( not ( = ?auto_572728 ?auto_572726 ) ) ( not ( = ?auto_572729 ?auto_572726 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_572727 ?auto_572724 ?auto_572725 ?auto_572728 ?auto_572726 ?auto_572729 ?auto_572723 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_573969 - OBJ
      ?auto_573970 - OBJ
      ?auto_573971 - OBJ
      ?auto_573972 - OBJ
      ?auto_573973 - OBJ
      ?auto_573974 - OBJ
      ?auto_573968 - LOCATION
    )
    :vars
    (
      ?auto_573976 - LOCATION
      ?auto_573977 - CITY
      ?auto_573978 - LOCATION
      ?auto_573979 - LOCATION
      ?auto_573975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_573976 ?auto_573977 ) ( IN-CITY ?auto_573968 ?auto_573977 ) ( not ( = ?auto_573968 ?auto_573976 ) ) ( OBJ-AT ?auto_573971 ?auto_573976 ) ( IN-CITY ?auto_573978 ?auto_573977 ) ( not ( = ?auto_573968 ?auto_573978 ) ) ( OBJ-AT ?auto_573974 ?auto_573978 ) ( OBJ-AT ?auto_573972 ?auto_573978 ) ( OBJ-AT ?auto_573970 ?auto_573978 ) ( OBJ-AT ?auto_573969 ?auto_573976 ) ( IN-CITY ?auto_573979 ?auto_573977 ) ( not ( = ?auto_573968 ?auto_573979 ) ) ( OBJ-AT ?auto_573973 ?auto_573979 ) ( TRUCK-AT ?auto_573975 ?auto_573968 ) ( not ( = ?auto_573973 ?auto_573969 ) ) ( not ( = ?auto_573976 ?auto_573979 ) ) ( not ( = ?auto_573973 ?auto_573970 ) ) ( not ( = ?auto_573969 ?auto_573970 ) ) ( not ( = ?auto_573978 ?auto_573976 ) ) ( not ( = ?auto_573978 ?auto_573979 ) ) ( not ( = ?auto_573973 ?auto_573972 ) ) ( not ( = ?auto_573969 ?auto_573972 ) ) ( not ( = ?auto_573970 ?auto_573972 ) ) ( not ( = ?auto_573973 ?auto_573974 ) ) ( not ( = ?auto_573969 ?auto_573974 ) ) ( not ( = ?auto_573970 ?auto_573974 ) ) ( not ( = ?auto_573972 ?auto_573974 ) ) ( not ( = ?auto_573973 ?auto_573971 ) ) ( not ( = ?auto_573969 ?auto_573971 ) ) ( not ( = ?auto_573970 ?auto_573971 ) ) ( not ( = ?auto_573972 ?auto_573971 ) ) ( not ( = ?auto_573974 ?auto_573971 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_573973 ?auto_573969 ?auto_573970 ?auto_573972 ?auto_573971 ?auto_573974 ?auto_573968 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_574240 - OBJ
      ?auto_574241 - OBJ
      ?auto_574242 - OBJ
      ?auto_574243 - OBJ
      ?auto_574244 - OBJ
      ?auto_574245 - OBJ
      ?auto_574239 - LOCATION
    )
    :vars
    (
      ?auto_574247 - LOCATION
      ?auto_574248 - CITY
      ?auto_574249 - LOCATION
      ?auto_574250 - LOCATION
      ?auto_574246 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_574247 ?auto_574248 ) ( IN-CITY ?auto_574239 ?auto_574248 ) ( not ( = ?auto_574239 ?auto_574247 ) ) ( OBJ-AT ?auto_574242 ?auto_574247 ) ( IN-CITY ?auto_574249 ?auto_574248 ) ( not ( = ?auto_574239 ?auto_574249 ) ) ( OBJ-AT ?auto_574244 ?auto_574249 ) ( OBJ-AT ?auto_574243 ?auto_574249 ) ( OBJ-AT ?auto_574241 ?auto_574249 ) ( OBJ-AT ?auto_574240 ?auto_574247 ) ( IN-CITY ?auto_574250 ?auto_574248 ) ( not ( = ?auto_574239 ?auto_574250 ) ) ( OBJ-AT ?auto_574245 ?auto_574250 ) ( TRUCK-AT ?auto_574246 ?auto_574239 ) ( not ( = ?auto_574245 ?auto_574240 ) ) ( not ( = ?auto_574247 ?auto_574250 ) ) ( not ( = ?auto_574245 ?auto_574241 ) ) ( not ( = ?auto_574240 ?auto_574241 ) ) ( not ( = ?auto_574249 ?auto_574247 ) ) ( not ( = ?auto_574249 ?auto_574250 ) ) ( not ( = ?auto_574245 ?auto_574243 ) ) ( not ( = ?auto_574240 ?auto_574243 ) ) ( not ( = ?auto_574241 ?auto_574243 ) ) ( not ( = ?auto_574245 ?auto_574244 ) ) ( not ( = ?auto_574240 ?auto_574244 ) ) ( not ( = ?auto_574241 ?auto_574244 ) ) ( not ( = ?auto_574243 ?auto_574244 ) ) ( not ( = ?auto_574245 ?auto_574242 ) ) ( not ( = ?auto_574240 ?auto_574242 ) ) ( not ( = ?auto_574241 ?auto_574242 ) ) ( not ( = ?auto_574243 ?auto_574242 ) ) ( not ( = ?auto_574244 ?auto_574242 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_574245 ?auto_574240 ?auto_574241 ?auto_574243 ?auto_574242 ?auto_574244 ?auto_574239 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_594768 - OBJ
      ?auto_594769 - OBJ
      ?auto_594770 - OBJ
      ?auto_594771 - OBJ
      ?auto_594772 - OBJ
      ?auto_594773 - OBJ
      ?auto_594767 - LOCATION
    )
    :vars
    (
      ?auto_594775 - LOCATION
      ?auto_594776 - CITY
      ?auto_594777 - LOCATION
      ?auto_594778 - LOCATION
      ?auto_594774 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_594775 ?auto_594776 ) ( IN-CITY ?auto_594767 ?auto_594776 ) ( not ( = ?auto_594767 ?auto_594775 ) ) ( OBJ-AT ?auto_594769 ?auto_594775 ) ( IN-CITY ?auto_594777 ?auto_594776 ) ( not ( = ?auto_594767 ?auto_594777 ) ) ( OBJ-AT ?auto_594773 ?auto_594777 ) ( OBJ-AT ?auto_594772 ?auto_594777 ) ( OBJ-AT ?auto_594771 ?auto_594777 ) ( OBJ-AT ?auto_594768 ?auto_594775 ) ( IN-CITY ?auto_594778 ?auto_594776 ) ( not ( = ?auto_594767 ?auto_594778 ) ) ( OBJ-AT ?auto_594770 ?auto_594778 ) ( TRUCK-AT ?auto_594774 ?auto_594767 ) ( not ( = ?auto_594770 ?auto_594768 ) ) ( not ( = ?auto_594775 ?auto_594778 ) ) ( not ( = ?auto_594770 ?auto_594771 ) ) ( not ( = ?auto_594768 ?auto_594771 ) ) ( not ( = ?auto_594777 ?auto_594775 ) ) ( not ( = ?auto_594777 ?auto_594778 ) ) ( not ( = ?auto_594770 ?auto_594772 ) ) ( not ( = ?auto_594768 ?auto_594772 ) ) ( not ( = ?auto_594771 ?auto_594772 ) ) ( not ( = ?auto_594770 ?auto_594773 ) ) ( not ( = ?auto_594768 ?auto_594773 ) ) ( not ( = ?auto_594771 ?auto_594773 ) ) ( not ( = ?auto_594772 ?auto_594773 ) ) ( not ( = ?auto_594770 ?auto_594769 ) ) ( not ( = ?auto_594768 ?auto_594769 ) ) ( not ( = ?auto_594771 ?auto_594769 ) ) ( not ( = ?auto_594772 ?auto_594769 ) ) ( not ( = ?auto_594773 ?auto_594769 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_594770 ?auto_594768 ?auto_594771 ?auto_594772 ?auto_594769 ?auto_594773 ?auto_594767 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_599788 - OBJ
      ?auto_599789 - OBJ
      ?auto_599790 - OBJ
      ?auto_599791 - OBJ
      ?auto_599792 - OBJ
      ?auto_599793 - OBJ
      ?auto_599787 - LOCATION
    )
    :vars
    (
      ?auto_599795 - LOCATION
      ?auto_599796 - CITY
      ?auto_599797 - LOCATION
      ?auto_599798 - LOCATION
      ?auto_599794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_599795 ?auto_599796 ) ( IN-CITY ?auto_599787 ?auto_599796 ) ( not ( = ?auto_599787 ?auto_599795 ) ) ( OBJ-AT ?auto_599789 ?auto_599795 ) ( IN-CITY ?auto_599797 ?auto_599796 ) ( not ( = ?auto_599787 ?auto_599797 ) ) ( OBJ-AT ?auto_599793 ?auto_599797 ) ( OBJ-AT ?auto_599792 ?auto_599797 ) ( OBJ-AT ?auto_599790 ?auto_599797 ) ( OBJ-AT ?auto_599788 ?auto_599795 ) ( IN-CITY ?auto_599798 ?auto_599796 ) ( not ( = ?auto_599787 ?auto_599798 ) ) ( OBJ-AT ?auto_599791 ?auto_599798 ) ( TRUCK-AT ?auto_599794 ?auto_599787 ) ( not ( = ?auto_599791 ?auto_599788 ) ) ( not ( = ?auto_599795 ?auto_599798 ) ) ( not ( = ?auto_599791 ?auto_599790 ) ) ( not ( = ?auto_599788 ?auto_599790 ) ) ( not ( = ?auto_599797 ?auto_599795 ) ) ( not ( = ?auto_599797 ?auto_599798 ) ) ( not ( = ?auto_599791 ?auto_599792 ) ) ( not ( = ?auto_599788 ?auto_599792 ) ) ( not ( = ?auto_599790 ?auto_599792 ) ) ( not ( = ?auto_599791 ?auto_599793 ) ) ( not ( = ?auto_599788 ?auto_599793 ) ) ( not ( = ?auto_599790 ?auto_599793 ) ) ( not ( = ?auto_599792 ?auto_599793 ) ) ( not ( = ?auto_599791 ?auto_599789 ) ) ( not ( = ?auto_599788 ?auto_599789 ) ) ( not ( = ?auto_599790 ?auto_599789 ) ) ( not ( = ?auto_599792 ?auto_599789 ) ) ( not ( = ?auto_599793 ?auto_599789 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_599791 ?auto_599788 ?auto_599790 ?auto_599792 ?auto_599789 ?auto_599793 ?auto_599787 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_601033 - OBJ
      ?auto_601034 - OBJ
      ?auto_601035 - OBJ
      ?auto_601036 - OBJ
      ?auto_601037 - OBJ
      ?auto_601038 - OBJ
      ?auto_601032 - LOCATION
    )
    :vars
    (
      ?auto_601040 - LOCATION
      ?auto_601041 - CITY
      ?auto_601042 - LOCATION
      ?auto_601043 - LOCATION
      ?auto_601039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_601040 ?auto_601041 ) ( IN-CITY ?auto_601032 ?auto_601041 ) ( not ( = ?auto_601032 ?auto_601040 ) ) ( OBJ-AT ?auto_601034 ?auto_601040 ) ( IN-CITY ?auto_601042 ?auto_601041 ) ( not ( = ?auto_601032 ?auto_601042 ) ) ( OBJ-AT ?auto_601038 ?auto_601042 ) ( OBJ-AT ?auto_601036 ?auto_601042 ) ( OBJ-AT ?auto_601035 ?auto_601042 ) ( OBJ-AT ?auto_601033 ?auto_601040 ) ( IN-CITY ?auto_601043 ?auto_601041 ) ( not ( = ?auto_601032 ?auto_601043 ) ) ( OBJ-AT ?auto_601037 ?auto_601043 ) ( TRUCK-AT ?auto_601039 ?auto_601032 ) ( not ( = ?auto_601037 ?auto_601033 ) ) ( not ( = ?auto_601040 ?auto_601043 ) ) ( not ( = ?auto_601037 ?auto_601035 ) ) ( not ( = ?auto_601033 ?auto_601035 ) ) ( not ( = ?auto_601042 ?auto_601040 ) ) ( not ( = ?auto_601042 ?auto_601043 ) ) ( not ( = ?auto_601037 ?auto_601036 ) ) ( not ( = ?auto_601033 ?auto_601036 ) ) ( not ( = ?auto_601035 ?auto_601036 ) ) ( not ( = ?auto_601037 ?auto_601038 ) ) ( not ( = ?auto_601033 ?auto_601038 ) ) ( not ( = ?auto_601035 ?auto_601038 ) ) ( not ( = ?auto_601036 ?auto_601038 ) ) ( not ( = ?auto_601037 ?auto_601034 ) ) ( not ( = ?auto_601033 ?auto_601034 ) ) ( not ( = ?auto_601035 ?auto_601034 ) ) ( not ( = ?auto_601036 ?auto_601034 ) ) ( not ( = ?auto_601038 ?auto_601034 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_601037 ?auto_601033 ?auto_601035 ?auto_601036 ?auto_601034 ?auto_601038 ?auto_601032 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_601304 - OBJ
      ?auto_601305 - OBJ
      ?auto_601306 - OBJ
      ?auto_601307 - OBJ
      ?auto_601308 - OBJ
      ?auto_601309 - OBJ
      ?auto_601303 - LOCATION
    )
    :vars
    (
      ?auto_601311 - LOCATION
      ?auto_601312 - CITY
      ?auto_601313 - LOCATION
      ?auto_601314 - LOCATION
      ?auto_601310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_601311 ?auto_601312 ) ( IN-CITY ?auto_601303 ?auto_601312 ) ( not ( = ?auto_601303 ?auto_601311 ) ) ( OBJ-AT ?auto_601305 ?auto_601311 ) ( IN-CITY ?auto_601313 ?auto_601312 ) ( not ( = ?auto_601303 ?auto_601313 ) ) ( OBJ-AT ?auto_601308 ?auto_601313 ) ( OBJ-AT ?auto_601307 ?auto_601313 ) ( OBJ-AT ?auto_601306 ?auto_601313 ) ( OBJ-AT ?auto_601304 ?auto_601311 ) ( IN-CITY ?auto_601314 ?auto_601312 ) ( not ( = ?auto_601303 ?auto_601314 ) ) ( OBJ-AT ?auto_601309 ?auto_601314 ) ( TRUCK-AT ?auto_601310 ?auto_601303 ) ( not ( = ?auto_601309 ?auto_601304 ) ) ( not ( = ?auto_601311 ?auto_601314 ) ) ( not ( = ?auto_601309 ?auto_601306 ) ) ( not ( = ?auto_601304 ?auto_601306 ) ) ( not ( = ?auto_601313 ?auto_601311 ) ) ( not ( = ?auto_601313 ?auto_601314 ) ) ( not ( = ?auto_601309 ?auto_601307 ) ) ( not ( = ?auto_601304 ?auto_601307 ) ) ( not ( = ?auto_601306 ?auto_601307 ) ) ( not ( = ?auto_601309 ?auto_601308 ) ) ( not ( = ?auto_601304 ?auto_601308 ) ) ( not ( = ?auto_601306 ?auto_601308 ) ) ( not ( = ?auto_601307 ?auto_601308 ) ) ( not ( = ?auto_601309 ?auto_601305 ) ) ( not ( = ?auto_601304 ?auto_601305 ) ) ( not ( = ?auto_601306 ?auto_601305 ) ) ( not ( = ?auto_601307 ?auto_601305 ) ) ( not ( = ?auto_601308 ?auto_601305 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_601309 ?auto_601304 ?auto_601306 ?auto_601307 ?auto_601305 ?auto_601308 ?auto_601303 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_613185 - OBJ
      ?auto_613186 - OBJ
      ?auto_613187 - OBJ
      ?auto_613188 - OBJ
      ?auto_613189 - OBJ
      ?auto_613190 - OBJ
      ?auto_613184 - LOCATION
    )
    :vars
    (
      ?auto_613192 - LOCATION
      ?auto_613193 - CITY
      ?auto_613194 - LOCATION
      ?auto_613195 - LOCATION
      ?auto_613191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_613192 ?auto_613193 ) ( IN-CITY ?auto_613184 ?auto_613193 ) ( not ( = ?auto_613184 ?auto_613192 ) ) ( OBJ-AT ?auto_613190 ?auto_613192 ) ( IN-CITY ?auto_613194 ?auto_613193 ) ( not ( = ?auto_613184 ?auto_613194 ) ) ( OBJ-AT ?auto_613189 ?auto_613194 ) ( OBJ-AT ?auto_613188 ?auto_613194 ) ( OBJ-AT ?auto_613185 ?auto_613194 ) ( OBJ-AT ?auto_613187 ?auto_613192 ) ( IN-CITY ?auto_613195 ?auto_613193 ) ( not ( = ?auto_613184 ?auto_613195 ) ) ( OBJ-AT ?auto_613186 ?auto_613195 ) ( TRUCK-AT ?auto_613191 ?auto_613184 ) ( not ( = ?auto_613186 ?auto_613187 ) ) ( not ( = ?auto_613192 ?auto_613195 ) ) ( not ( = ?auto_613186 ?auto_613185 ) ) ( not ( = ?auto_613187 ?auto_613185 ) ) ( not ( = ?auto_613194 ?auto_613192 ) ) ( not ( = ?auto_613194 ?auto_613195 ) ) ( not ( = ?auto_613186 ?auto_613188 ) ) ( not ( = ?auto_613187 ?auto_613188 ) ) ( not ( = ?auto_613185 ?auto_613188 ) ) ( not ( = ?auto_613186 ?auto_613189 ) ) ( not ( = ?auto_613187 ?auto_613189 ) ) ( not ( = ?auto_613185 ?auto_613189 ) ) ( not ( = ?auto_613188 ?auto_613189 ) ) ( not ( = ?auto_613186 ?auto_613190 ) ) ( not ( = ?auto_613187 ?auto_613190 ) ) ( not ( = ?auto_613185 ?auto_613190 ) ) ( not ( = ?auto_613188 ?auto_613190 ) ) ( not ( = ?auto_613189 ?auto_613190 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_613186 ?auto_613187 ?auto_613185 ?auto_613188 ?auto_613190 ?auto_613189 ?auto_613184 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_613249 - OBJ
      ?auto_613250 - OBJ
      ?auto_613251 - OBJ
      ?auto_613252 - OBJ
      ?auto_613253 - OBJ
      ?auto_613254 - OBJ
      ?auto_613248 - LOCATION
    )
    :vars
    (
      ?auto_613256 - LOCATION
      ?auto_613257 - CITY
      ?auto_613258 - LOCATION
      ?auto_613259 - LOCATION
      ?auto_613255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_613256 ?auto_613257 ) ( IN-CITY ?auto_613248 ?auto_613257 ) ( not ( = ?auto_613248 ?auto_613256 ) ) ( OBJ-AT ?auto_613253 ?auto_613256 ) ( IN-CITY ?auto_613258 ?auto_613257 ) ( not ( = ?auto_613248 ?auto_613258 ) ) ( OBJ-AT ?auto_613254 ?auto_613258 ) ( OBJ-AT ?auto_613252 ?auto_613258 ) ( OBJ-AT ?auto_613249 ?auto_613258 ) ( OBJ-AT ?auto_613251 ?auto_613256 ) ( IN-CITY ?auto_613259 ?auto_613257 ) ( not ( = ?auto_613248 ?auto_613259 ) ) ( OBJ-AT ?auto_613250 ?auto_613259 ) ( TRUCK-AT ?auto_613255 ?auto_613248 ) ( not ( = ?auto_613250 ?auto_613251 ) ) ( not ( = ?auto_613256 ?auto_613259 ) ) ( not ( = ?auto_613250 ?auto_613249 ) ) ( not ( = ?auto_613251 ?auto_613249 ) ) ( not ( = ?auto_613258 ?auto_613256 ) ) ( not ( = ?auto_613258 ?auto_613259 ) ) ( not ( = ?auto_613250 ?auto_613252 ) ) ( not ( = ?auto_613251 ?auto_613252 ) ) ( not ( = ?auto_613249 ?auto_613252 ) ) ( not ( = ?auto_613250 ?auto_613254 ) ) ( not ( = ?auto_613251 ?auto_613254 ) ) ( not ( = ?auto_613249 ?auto_613254 ) ) ( not ( = ?auto_613252 ?auto_613254 ) ) ( not ( = ?auto_613250 ?auto_613253 ) ) ( not ( = ?auto_613251 ?auto_613253 ) ) ( not ( = ?auto_613249 ?auto_613253 ) ) ( not ( = ?auto_613252 ?auto_613253 ) ) ( not ( = ?auto_613254 ?auto_613253 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_613250 ?auto_613251 ?auto_613249 ?auto_613252 ?auto_613253 ?auto_613254 ?auto_613248 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_613703 - OBJ
      ?auto_613704 - OBJ
      ?auto_613705 - OBJ
      ?auto_613706 - OBJ
      ?auto_613707 - OBJ
      ?auto_613708 - OBJ
      ?auto_613702 - LOCATION
    )
    :vars
    (
      ?auto_613710 - LOCATION
      ?auto_613711 - CITY
      ?auto_613712 - LOCATION
      ?auto_613713 - LOCATION
      ?auto_613709 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_613710 ?auto_613711 ) ( IN-CITY ?auto_613702 ?auto_613711 ) ( not ( = ?auto_613702 ?auto_613710 ) ) ( OBJ-AT ?auto_613706 ?auto_613710 ) ( IN-CITY ?auto_613712 ?auto_613711 ) ( not ( = ?auto_613702 ?auto_613712 ) ) ( OBJ-AT ?auto_613708 ?auto_613712 ) ( OBJ-AT ?auto_613707 ?auto_613712 ) ( OBJ-AT ?auto_613703 ?auto_613712 ) ( OBJ-AT ?auto_613705 ?auto_613710 ) ( IN-CITY ?auto_613713 ?auto_613711 ) ( not ( = ?auto_613702 ?auto_613713 ) ) ( OBJ-AT ?auto_613704 ?auto_613713 ) ( TRUCK-AT ?auto_613709 ?auto_613702 ) ( not ( = ?auto_613704 ?auto_613705 ) ) ( not ( = ?auto_613710 ?auto_613713 ) ) ( not ( = ?auto_613704 ?auto_613703 ) ) ( not ( = ?auto_613705 ?auto_613703 ) ) ( not ( = ?auto_613712 ?auto_613710 ) ) ( not ( = ?auto_613712 ?auto_613713 ) ) ( not ( = ?auto_613704 ?auto_613707 ) ) ( not ( = ?auto_613705 ?auto_613707 ) ) ( not ( = ?auto_613703 ?auto_613707 ) ) ( not ( = ?auto_613704 ?auto_613708 ) ) ( not ( = ?auto_613705 ?auto_613708 ) ) ( not ( = ?auto_613703 ?auto_613708 ) ) ( not ( = ?auto_613707 ?auto_613708 ) ) ( not ( = ?auto_613704 ?auto_613706 ) ) ( not ( = ?auto_613705 ?auto_613706 ) ) ( not ( = ?auto_613703 ?auto_613706 ) ) ( not ( = ?auto_613707 ?auto_613706 ) ) ( not ( = ?auto_613708 ?auto_613706 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_613704 ?auto_613705 ?auto_613703 ?auto_613707 ?auto_613706 ?auto_613708 ?auto_613702 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_615359 - OBJ
      ?auto_615360 - OBJ
      ?auto_615361 - OBJ
      ?auto_615362 - OBJ
      ?auto_615363 - OBJ
      ?auto_615364 - OBJ
      ?auto_615358 - LOCATION
    )
    :vars
    (
      ?auto_615366 - LOCATION
      ?auto_615367 - CITY
      ?auto_615368 - LOCATION
      ?auto_615369 - LOCATION
      ?auto_615365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_615366 ?auto_615367 ) ( IN-CITY ?auto_615358 ?auto_615367 ) ( not ( = ?auto_615358 ?auto_615366 ) ) ( OBJ-AT ?auto_615364 ?auto_615366 ) ( IN-CITY ?auto_615368 ?auto_615367 ) ( not ( = ?auto_615358 ?auto_615368 ) ) ( OBJ-AT ?auto_615363 ?auto_615368 ) ( OBJ-AT ?auto_615361 ?auto_615368 ) ( OBJ-AT ?auto_615359 ?auto_615368 ) ( OBJ-AT ?auto_615362 ?auto_615366 ) ( IN-CITY ?auto_615369 ?auto_615367 ) ( not ( = ?auto_615358 ?auto_615369 ) ) ( OBJ-AT ?auto_615360 ?auto_615369 ) ( TRUCK-AT ?auto_615365 ?auto_615358 ) ( not ( = ?auto_615360 ?auto_615362 ) ) ( not ( = ?auto_615366 ?auto_615369 ) ) ( not ( = ?auto_615360 ?auto_615359 ) ) ( not ( = ?auto_615362 ?auto_615359 ) ) ( not ( = ?auto_615368 ?auto_615366 ) ) ( not ( = ?auto_615368 ?auto_615369 ) ) ( not ( = ?auto_615360 ?auto_615361 ) ) ( not ( = ?auto_615362 ?auto_615361 ) ) ( not ( = ?auto_615359 ?auto_615361 ) ) ( not ( = ?auto_615360 ?auto_615363 ) ) ( not ( = ?auto_615362 ?auto_615363 ) ) ( not ( = ?auto_615359 ?auto_615363 ) ) ( not ( = ?auto_615361 ?auto_615363 ) ) ( not ( = ?auto_615360 ?auto_615364 ) ) ( not ( = ?auto_615362 ?auto_615364 ) ) ( not ( = ?auto_615359 ?auto_615364 ) ) ( not ( = ?auto_615361 ?auto_615364 ) ) ( not ( = ?auto_615363 ?auto_615364 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_615360 ?auto_615362 ?auto_615359 ?auto_615361 ?auto_615364 ?auto_615363 ?auto_615358 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_615423 - OBJ
      ?auto_615424 - OBJ
      ?auto_615425 - OBJ
      ?auto_615426 - OBJ
      ?auto_615427 - OBJ
      ?auto_615428 - OBJ
      ?auto_615422 - LOCATION
    )
    :vars
    (
      ?auto_615430 - LOCATION
      ?auto_615431 - CITY
      ?auto_615432 - LOCATION
      ?auto_615433 - LOCATION
      ?auto_615429 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_615430 ?auto_615431 ) ( IN-CITY ?auto_615422 ?auto_615431 ) ( not ( = ?auto_615422 ?auto_615430 ) ) ( OBJ-AT ?auto_615427 ?auto_615430 ) ( IN-CITY ?auto_615432 ?auto_615431 ) ( not ( = ?auto_615422 ?auto_615432 ) ) ( OBJ-AT ?auto_615428 ?auto_615432 ) ( OBJ-AT ?auto_615425 ?auto_615432 ) ( OBJ-AT ?auto_615423 ?auto_615432 ) ( OBJ-AT ?auto_615426 ?auto_615430 ) ( IN-CITY ?auto_615433 ?auto_615431 ) ( not ( = ?auto_615422 ?auto_615433 ) ) ( OBJ-AT ?auto_615424 ?auto_615433 ) ( TRUCK-AT ?auto_615429 ?auto_615422 ) ( not ( = ?auto_615424 ?auto_615426 ) ) ( not ( = ?auto_615430 ?auto_615433 ) ) ( not ( = ?auto_615424 ?auto_615423 ) ) ( not ( = ?auto_615426 ?auto_615423 ) ) ( not ( = ?auto_615432 ?auto_615430 ) ) ( not ( = ?auto_615432 ?auto_615433 ) ) ( not ( = ?auto_615424 ?auto_615425 ) ) ( not ( = ?auto_615426 ?auto_615425 ) ) ( not ( = ?auto_615423 ?auto_615425 ) ) ( not ( = ?auto_615424 ?auto_615428 ) ) ( not ( = ?auto_615426 ?auto_615428 ) ) ( not ( = ?auto_615423 ?auto_615428 ) ) ( not ( = ?auto_615425 ?auto_615428 ) ) ( not ( = ?auto_615424 ?auto_615427 ) ) ( not ( = ?auto_615426 ?auto_615427 ) ) ( not ( = ?auto_615423 ?auto_615427 ) ) ( not ( = ?auto_615425 ?auto_615427 ) ) ( not ( = ?auto_615428 ?auto_615427 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_615424 ?auto_615426 ?auto_615423 ?auto_615425 ?auto_615427 ?auto_615428 ?auto_615422 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_615761 - OBJ
      ?auto_615762 - OBJ
      ?auto_615763 - OBJ
      ?auto_615764 - OBJ
      ?auto_615765 - OBJ
      ?auto_615766 - OBJ
      ?auto_615760 - LOCATION
    )
    :vars
    (
      ?auto_615768 - LOCATION
      ?auto_615769 - CITY
      ?auto_615770 - LOCATION
      ?auto_615771 - LOCATION
      ?auto_615767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_615768 ?auto_615769 ) ( IN-CITY ?auto_615760 ?auto_615769 ) ( not ( = ?auto_615760 ?auto_615768 ) ) ( OBJ-AT ?auto_615766 ?auto_615768 ) ( IN-CITY ?auto_615770 ?auto_615769 ) ( not ( = ?auto_615760 ?auto_615770 ) ) ( OBJ-AT ?auto_615764 ?auto_615770 ) ( OBJ-AT ?auto_615763 ?auto_615770 ) ( OBJ-AT ?auto_615761 ?auto_615770 ) ( OBJ-AT ?auto_615765 ?auto_615768 ) ( IN-CITY ?auto_615771 ?auto_615769 ) ( not ( = ?auto_615760 ?auto_615771 ) ) ( OBJ-AT ?auto_615762 ?auto_615771 ) ( TRUCK-AT ?auto_615767 ?auto_615760 ) ( not ( = ?auto_615762 ?auto_615765 ) ) ( not ( = ?auto_615768 ?auto_615771 ) ) ( not ( = ?auto_615762 ?auto_615761 ) ) ( not ( = ?auto_615765 ?auto_615761 ) ) ( not ( = ?auto_615770 ?auto_615768 ) ) ( not ( = ?auto_615770 ?auto_615771 ) ) ( not ( = ?auto_615762 ?auto_615763 ) ) ( not ( = ?auto_615765 ?auto_615763 ) ) ( not ( = ?auto_615761 ?auto_615763 ) ) ( not ( = ?auto_615762 ?auto_615764 ) ) ( not ( = ?auto_615765 ?auto_615764 ) ) ( not ( = ?auto_615761 ?auto_615764 ) ) ( not ( = ?auto_615763 ?auto_615764 ) ) ( not ( = ?auto_615762 ?auto_615766 ) ) ( not ( = ?auto_615765 ?auto_615766 ) ) ( not ( = ?auto_615761 ?auto_615766 ) ) ( not ( = ?auto_615763 ?auto_615766 ) ) ( not ( = ?auto_615764 ?auto_615766 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_615762 ?auto_615765 ?auto_615761 ?auto_615763 ?auto_615766 ?auto_615764 ?auto_615760 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_620979 - OBJ
      ?auto_620980 - OBJ
      ?auto_620981 - OBJ
      ?auto_620982 - OBJ
      ?auto_620983 - OBJ
      ?auto_620984 - OBJ
      ?auto_620978 - LOCATION
    )
    :vars
    (
      ?auto_620986 - LOCATION
      ?auto_620987 - CITY
      ?auto_620988 - LOCATION
      ?auto_620989 - LOCATION
      ?auto_620985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_620986 ?auto_620987 ) ( IN-CITY ?auto_620978 ?auto_620987 ) ( not ( = ?auto_620978 ?auto_620986 ) ) ( OBJ-AT ?auto_620984 ?auto_620986 ) ( IN-CITY ?auto_620988 ?auto_620987 ) ( not ( = ?auto_620978 ?auto_620988 ) ) ( OBJ-AT ?auto_620983 ?auto_620988 ) ( OBJ-AT ?auto_620982 ?auto_620988 ) ( OBJ-AT ?auto_620979 ?auto_620988 ) ( OBJ-AT ?auto_620980 ?auto_620986 ) ( IN-CITY ?auto_620989 ?auto_620987 ) ( not ( = ?auto_620978 ?auto_620989 ) ) ( OBJ-AT ?auto_620981 ?auto_620989 ) ( TRUCK-AT ?auto_620985 ?auto_620978 ) ( not ( = ?auto_620981 ?auto_620980 ) ) ( not ( = ?auto_620986 ?auto_620989 ) ) ( not ( = ?auto_620981 ?auto_620979 ) ) ( not ( = ?auto_620980 ?auto_620979 ) ) ( not ( = ?auto_620988 ?auto_620986 ) ) ( not ( = ?auto_620988 ?auto_620989 ) ) ( not ( = ?auto_620981 ?auto_620982 ) ) ( not ( = ?auto_620980 ?auto_620982 ) ) ( not ( = ?auto_620979 ?auto_620982 ) ) ( not ( = ?auto_620981 ?auto_620983 ) ) ( not ( = ?auto_620980 ?auto_620983 ) ) ( not ( = ?auto_620979 ?auto_620983 ) ) ( not ( = ?auto_620982 ?auto_620983 ) ) ( not ( = ?auto_620981 ?auto_620984 ) ) ( not ( = ?auto_620980 ?auto_620984 ) ) ( not ( = ?auto_620979 ?auto_620984 ) ) ( not ( = ?auto_620982 ?auto_620984 ) ) ( not ( = ?auto_620983 ?auto_620984 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_620981 ?auto_620980 ?auto_620979 ?auto_620982 ?auto_620984 ?auto_620983 ?auto_620978 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_621043 - OBJ
      ?auto_621044 - OBJ
      ?auto_621045 - OBJ
      ?auto_621046 - OBJ
      ?auto_621047 - OBJ
      ?auto_621048 - OBJ
      ?auto_621042 - LOCATION
    )
    :vars
    (
      ?auto_621050 - LOCATION
      ?auto_621051 - CITY
      ?auto_621052 - LOCATION
      ?auto_621053 - LOCATION
      ?auto_621049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_621050 ?auto_621051 ) ( IN-CITY ?auto_621042 ?auto_621051 ) ( not ( = ?auto_621042 ?auto_621050 ) ) ( OBJ-AT ?auto_621047 ?auto_621050 ) ( IN-CITY ?auto_621052 ?auto_621051 ) ( not ( = ?auto_621042 ?auto_621052 ) ) ( OBJ-AT ?auto_621048 ?auto_621052 ) ( OBJ-AT ?auto_621046 ?auto_621052 ) ( OBJ-AT ?auto_621043 ?auto_621052 ) ( OBJ-AT ?auto_621044 ?auto_621050 ) ( IN-CITY ?auto_621053 ?auto_621051 ) ( not ( = ?auto_621042 ?auto_621053 ) ) ( OBJ-AT ?auto_621045 ?auto_621053 ) ( TRUCK-AT ?auto_621049 ?auto_621042 ) ( not ( = ?auto_621045 ?auto_621044 ) ) ( not ( = ?auto_621050 ?auto_621053 ) ) ( not ( = ?auto_621045 ?auto_621043 ) ) ( not ( = ?auto_621044 ?auto_621043 ) ) ( not ( = ?auto_621052 ?auto_621050 ) ) ( not ( = ?auto_621052 ?auto_621053 ) ) ( not ( = ?auto_621045 ?auto_621046 ) ) ( not ( = ?auto_621044 ?auto_621046 ) ) ( not ( = ?auto_621043 ?auto_621046 ) ) ( not ( = ?auto_621045 ?auto_621048 ) ) ( not ( = ?auto_621044 ?auto_621048 ) ) ( not ( = ?auto_621043 ?auto_621048 ) ) ( not ( = ?auto_621046 ?auto_621048 ) ) ( not ( = ?auto_621045 ?auto_621047 ) ) ( not ( = ?auto_621044 ?auto_621047 ) ) ( not ( = ?auto_621043 ?auto_621047 ) ) ( not ( = ?auto_621046 ?auto_621047 ) ) ( not ( = ?auto_621048 ?auto_621047 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_621045 ?auto_621044 ?auto_621043 ?auto_621046 ?auto_621047 ?auto_621048 ?auto_621042 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_621497 - OBJ
      ?auto_621498 - OBJ
      ?auto_621499 - OBJ
      ?auto_621500 - OBJ
      ?auto_621501 - OBJ
      ?auto_621502 - OBJ
      ?auto_621496 - LOCATION
    )
    :vars
    (
      ?auto_621504 - LOCATION
      ?auto_621505 - CITY
      ?auto_621506 - LOCATION
      ?auto_621507 - LOCATION
      ?auto_621503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_621504 ?auto_621505 ) ( IN-CITY ?auto_621496 ?auto_621505 ) ( not ( = ?auto_621496 ?auto_621504 ) ) ( OBJ-AT ?auto_621500 ?auto_621504 ) ( IN-CITY ?auto_621506 ?auto_621505 ) ( not ( = ?auto_621496 ?auto_621506 ) ) ( OBJ-AT ?auto_621502 ?auto_621506 ) ( OBJ-AT ?auto_621501 ?auto_621506 ) ( OBJ-AT ?auto_621497 ?auto_621506 ) ( OBJ-AT ?auto_621498 ?auto_621504 ) ( IN-CITY ?auto_621507 ?auto_621505 ) ( not ( = ?auto_621496 ?auto_621507 ) ) ( OBJ-AT ?auto_621499 ?auto_621507 ) ( TRUCK-AT ?auto_621503 ?auto_621496 ) ( not ( = ?auto_621499 ?auto_621498 ) ) ( not ( = ?auto_621504 ?auto_621507 ) ) ( not ( = ?auto_621499 ?auto_621497 ) ) ( not ( = ?auto_621498 ?auto_621497 ) ) ( not ( = ?auto_621506 ?auto_621504 ) ) ( not ( = ?auto_621506 ?auto_621507 ) ) ( not ( = ?auto_621499 ?auto_621501 ) ) ( not ( = ?auto_621498 ?auto_621501 ) ) ( not ( = ?auto_621497 ?auto_621501 ) ) ( not ( = ?auto_621499 ?auto_621502 ) ) ( not ( = ?auto_621498 ?auto_621502 ) ) ( not ( = ?auto_621497 ?auto_621502 ) ) ( not ( = ?auto_621501 ?auto_621502 ) ) ( not ( = ?auto_621499 ?auto_621500 ) ) ( not ( = ?auto_621498 ?auto_621500 ) ) ( not ( = ?auto_621497 ?auto_621500 ) ) ( not ( = ?auto_621501 ?auto_621500 ) ) ( not ( = ?auto_621502 ?auto_621500 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_621499 ?auto_621498 ?auto_621497 ?auto_621501 ?auto_621500 ?auto_621502 ?auto_621496 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_624278 - OBJ
      ?auto_624279 - OBJ
      ?auto_624280 - OBJ
      ?auto_624281 - OBJ
      ?auto_624282 - OBJ
      ?auto_624283 - OBJ
      ?auto_624277 - LOCATION
    )
    :vars
    (
      ?auto_624285 - LOCATION
      ?auto_624286 - CITY
      ?auto_624287 - LOCATION
      ?auto_624288 - LOCATION
      ?auto_624284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_624285 ?auto_624286 ) ( IN-CITY ?auto_624277 ?auto_624286 ) ( not ( = ?auto_624277 ?auto_624285 ) ) ( OBJ-AT ?auto_624283 ?auto_624285 ) ( IN-CITY ?auto_624287 ?auto_624286 ) ( not ( = ?auto_624277 ?auto_624287 ) ) ( OBJ-AT ?auto_624282 ?auto_624287 ) ( OBJ-AT ?auto_624280 ?auto_624287 ) ( OBJ-AT ?auto_624278 ?auto_624287 ) ( OBJ-AT ?auto_624279 ?auto_624285 ) ( IN-CITY ?auto_624288 ?auto_624286 ) ( not ( = ?auto_624277 ?auto_624288 ) ) ( OBJ-AT ?auto_624281 ?auto_624288 ) ( TRUCK-AT ?auto_624284 ?auto_624277 ) ( not ( = ?auto_624281 ?auto_624279 ) ) ( not ( = ?auto_624285 ?auto_624288 ) ) ( not ( = ?auto_624281 ?auto_624278 ) ) ( not ( = ?auto_624279 ?auto_624278 ) ) ( not ( = ?auto_624287 ?auto_624285 ) ) ( not ( = ?auto_624287 ?auto_624288 ) ) ( not ( = ?auto_624281 ?auto_624280 ) ) ( not ( = ?auto_624279 ?auto_624280 ) ) ( not ( = ?auto_624278 ?auto_624280 ) ) ( not ( = ?auto_624281 ?auto_624282 ) ) ( not ( = ?auto_624279 ?auto_624282 ) ) ( not ( = ?auto_624278 ?auto_624282 ) ) ( not ( = ?auto_624280 ?auto_624282 ) ) ( not ( = ?auto_624281 ?auto_624283 ) ) ( not ( = ?auto_624279 ?auto_624283 ) ) ( not ( = ?auto_624278 ?auto_624283 ) ) ( not ( = ?auto_624280 ?auto_624283 ) ) ( not ( = ?auto_624282 ?auto_624283 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_624281 ?auto_624279 ?auto_624278 ?auto_624280 ?auto_624283 ?auto_624282 ?auto_624277 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_624342 - OBJ
      ?auto_624343 - OBJ
      ?auto_624344 - OBJ
      ?auto_624345 - OBJ
      ?auto_624346 - OBJ
      ?auto_624347 - OBJ
      ?auto_624341 - LOCATION
    )
    :vars
    (
      ?auto_624349 - LOCATION
      ?auto_624350 - CITY
      ?auto_624351 - LOCATION
      ?auto_624352 - LOCATION
      ?auto_624348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_624349 ?auto_624350 ) ( IN-CITY ?auto_624341 ?auto_624350 ) ( not ( = ?auto_624341 ?auto_624349 ) ) ( OBJ-AT ?auto_624346 ?auto_624349 ) ( IN-CITY ?auto_624351 ?auto_624350 ) ( not ( = ?auto_624341 ?auto_624351 ) ) ( OBJ-AT ?auto_624347 ?auto_624351 ) ( OBJ-AT ?auto_624344 ?auto_624351 ) ( OBJ-AT ?auto_624342 ?auto_624351 ) ( OBJ-AT ?auto_624343 ?auto_624349 ) ( IN-CITY ?auto_624352 ?auto_624350 ) ( not ( = ?auto_624341 ?auto_624352 ) ) ( OBJ-AT ?auto_624345 ?auto_624352 ) ( TRUCK-AT ?auto_624348 ?auto_624341 ) ( not ( = ?auto_624345 ?auto_624343 ) ) ( not ( = ?auto_624349 ?auto_624352 ) ) ( not ( = ?auto_624345 ?auto_624342 ) ) ( not ( = ?auto_624343 ?auto_624342 ) ) ( not ( = ?auto_624351 ?auto_624349 ) ) ( not ( = ?auto_624351 ?auto_624352 ) ) ( not ( = ?auto_624345 ?auto_624344 ) ) ( not ( = ?auto_624343 ?auto_624344 ) ) ( not ( = ?auto_624342 ?auto_624344 ) ) ( not ( = ?auto_624345 ?auto_624347 ) ) ( not ( = ?auto_624343 ?auto_624347 ) ) ( not ( = ?auto_624342 ?auto_624347 ) ) ( not ( = ?auto_624344 ?auto_624347 ) ) ( not ( = ?auto_624345 ?auto_624346 ) ) ( not ( = ?auto_624343 ?auto_624346 ) ) ( not ( = ?auto_624342 ?auto_624346 ) ) ( not ( = ?auto_624344 ?auto_624346 ) ) ( not ( = ?auto_624347 ?auto_624346 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_624345 ?auto_624343 ?auto_624342 ?auto_624344 ?auto_624346 ?auto_624347 ?auto_624341 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_624817 - OBJ
      ?auto_624818 - OBJ
      ?auto_624819 - OBJ
      ?auto_624820 - OBJ
      ?auto_624821 - OBJ
      ?auto_624822 - OBJ
      ?auto_624816 - LOCATION
    )
    :vars
    (
      ?auto_624824 - LOCATION
      ?auto_624825 - CITY
      ?auto_624826 - LOCATION
      ?auto_624827 - LOCATION
      ?auto_624823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_624824 ?auto_624825 ) ( IN-CITY ?auto_624816 ?auto_624825 ) ( not ( = ?auto_624816 ?auto_624824 ) ) ( OBJ-AT ?auto_624822 ?auto_624824 ) ( IN-CITY ?auto_624826 ?auto_624825 ) ( not ( = ?auto_624816 ?auto_624826 ) ) ( OBJ-AT ?auto_624820 ?auto_624826 ) ( OBJ-AT ?auto_624819 ?auto_624826 ) ( OBJ-AT ?auto_624817 ?auto_624826 ) ( OBJ-AT ?auto_624818 ?auto_624824 ) ( IN-CITY ?auto_624827 ?auto_624825 ) ( not ( = ?auto_624816 ?auto_624827 ) ) ( OBJ-AT ?auto_624821 ?auto_624827 ) ( TRUCK-AT ?auto_624823 ?auto_624816 ) ( not ( = ?auto_624821 ?auto_624818 ) ) ( not ( = ?auto_624824 ?auto_624827 ) ) ( not ( = ?auto_624821 ?auto_624817 ) ) ( not ( = ?auto_624818 ?auto_624817 ) ) ( not ( = ?auto_624826 ?auto_624824 ) ) ( not ( = ?auto_624826 ?auto_624827 ) ) ( not ( = ?auto_624821 ?auto_624819 ) ) ( not ( = ?auto_624818 ?auto_624819 ) ) ( not ( = ?auto_624817 ?auto_624819 ) ) ( not ( = ?auto_624821 ?auto_624820 ) ) ( not ( = ?auto_624818 ?auto_624820 ) ) ( not ( = ?auto_624817 ?auto_624820 ) ) ( not ( = ?auto_624819 ?auto_624820 ) ) ( not ( = ?auto_624821 ?auto_624822 ) ) ( not ( = ?auto_624818 ?auto_624822 ) ) ( not ( = ?auto_624817 ?auto_624822 ) ) ( not ( = ?auto_624819 ?auto_624822 ) ) ( not ( = ?auto_624820 ?auto_624822 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_624821 ?auto_624818 ?auto_624817 ?auto_624819 ?auto_624822 ?auto_624820 ?auto_624816 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_624881 - OBJ
      ?auto_624882 - OBJ
      ?auto_624883 - OBJ
      ?auto_624884 - OBJ
      ?auto_624885 - OBJ
      ?auto_624886 - OBJ
      ?auto_624880 - LOCATION
    )
    :vars
    (
      ?auto_624888 - LOCATION
      ?auto_624889 - CITY
      ?auto_624890 - LOCATION
      ?auto_624891 - LOCATION
      ?auto_624887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_624888 ?auto_624889 ) ( IN-CITY ?auto_624880 ?auto_624889 ) ( not ( = ?auto_624880 ?auto_624888 ) ) ( OBJ-AT ?auto_624885 ?auto_624888 ) ( IN-CITY ?auto_624890 ?auto_624889 ) ( not ( = ?auto_624880 ?auto_624890 ) ) ( OBJ-AT ?auto_624884 ?auto_624890 ) ( OBJ-AT ?auto_624883 ?auto_624890 ) ( OBJ-AT ?auto_624881 ?auto_624890 ) ( OBJ-AT ?auto_624882 ?auto_624888 ) ( IN-CITY ?auto_624891 ?auto_624889 ) ( not ( = ?auto_624880 ?auto_624891 ) ) ( OBJ-AT ?auto_624886 ?auto_624891 ) ( TRUCK-AT ?auto_624887 ?auto_624880 ) ( not ( = ?auto_624886 ?auto_624882 ) ) ( not ( = ?auto_624888 ?auto_624891 ) ) ( not ( = ?auto_624886 ?auto_624881 ) ) ( not ( = ?auto_624882 ?auto_624881 ) ) ( not ( = ?auto_624890 ?auto_624888 ) ) ( not ( = ?auto_624890 ?auto_624891 ) ) ( not ( = ?auto_624886 ?auto_624883 ) ) ( not ( = ?auto_624882 ?auto_624883 ) ) ( not ( = ?auto_624881 ?auto_624883 ) ) ( not ( = ?auto_624886 ?auto_624884 ) ) ( not ( = ?auto_624882 ?auto_624884 ) ) ( not ( = ?auto_624881 ?auto_624884 ) ) ( not ( = ?auto_624883 ?auto_624884 ) ) ( not ( = ?auto_624886 ?auto_624885 ) ) ( not ( = ?auto_624882 ?auto_624885 ) ) ( not ( = ?auto_624881 ?auto_624885 ) ) ( not ( = ?auto_624883 ?auto_624885 ) ) ( not ( = ?auto_624884 ?auto_624885 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_624886 ?auto_624882 ?auto_624881 ?auto_624883 ?auto_624885 ?auto_624884 ?auto_624880 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_625010 - OBJ
      ?auto_625011 - OBJ
      ?auto_625012 - OBJ
      ?auto_625013 - OBJ
      ?auto_625014 - OBJ
      ?auto_625015 - OBJ
      ?auto_625009 - LOCATION
    )
    :vars
    (
      ?auto_625017 - LOCATION
      ?auto_625018 - CITY
      ?auto_625019 - LOCATION
      ?auto_625020 - LOCATION
      ?auto_625016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_625017 ?auto_625018 ) ( IN-CITY ?auto_625009 ?auto_625018 ) ( not ( = ?auto_625009 ?auto_625017 ) ) ( OBJ-AT ?auto_625013 ?auto_625017 ) ( IN-CITY ?auto_625019 ?auto_625018 ) ( not ( = ?auto_625009 ?auto_625019 ) ) ( OBJ-AT ?auto_625015 ?auto_625019 ) ( OBJ-AT ?auto_625012 ?auto_625019 ) ( OBJ-AT ?auto_625010 ?auto_625019 ) ( OBJ-AT ?auto_625011 ?auto_625017 ) ( IN-CITY ?auto_625020 ?auto_625018 ) ( not ( = ?auto_625009 ?auto_625020 ) ) ( OBJ-AT ?auto_625014 ?auto_625020 ) ( TRUCK-AT ?auto_625016 ?auto_625009 ) ( not ( = ?auto_625014 ?auto_625011 ) ) ( not ( = ?auto_625017 ?auto_625020 ) ) ( not ( = ?auto_625014 ?auto_625010 ) ) ( not ( = ?auto_625011 ?auto_625010 ) ) ( not ( = ?auto_625019 ?auto_625017 ) ) ( not ( = ?auto_625019 ?auto_625020 ) ) ( not ( = ?auto_625014 ?auto_625012 ) ) ( not ( = ?auto_625011 ?auto_625012 ) ) ( not ( = ?auto_625010 ?auto_625012 ) ) ( not ( = ?auto_625014 ?auto_625015 ) ) ( not ( = ?auto_625011 ?auto_625015 ) ) ( not ( = ?auto_625010 ?auto_625015 ) ) ( not ( = ?auto_625012 ?auto_625015 ) ) ( not ( = ?auto_625014 ?auto_625013 ) ) ( not ( = ?auto_625011 ?auto_625013 ) ) ( not ( = ?auto_625010 ?auto_625013 ) ) ( not ( = ?auto_625012 ?auto_625013 ) ) ( not ( = ?auto_625015 ?auto_625013 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_625014 ?auto_625011 ?auto_625010 ?auto_625012 ?auto_625013 ?auto_625015 ?auto_625009 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_625281 - OBJ
      ?auto_625282 - OBJ
      ?auto_625283 - OBJ
      ?auto_625284 - OBJ
      ?auto_625285 - OBJ
      ?auto_625286 - OBJ
      ?auto_625280 - LOCATION
    )
    :vars
    (
      ?auto_625288 - LOCATION
      ?auto_625289 - CITY
      ?auto_625290 - LOCATION
      ?auto_625291 - LOCATION
      ?auto_625287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_625288 ?auto_625289 ) ( IN-CITY ?auto_625280 ?auto_625289 ) ( not ( = ?auto_625280 ?auto_625288 ) ) ( OBJ-AT ?auto_625284 ?auto_625288 ) ( IN-CITY ?auto_625290 ?auto_625289 ) ( not ( = ?auto_625280 ?auto_625290 ) ) ( OBJ-AT ?auto_625285 ?auto_625290 ) ( OBJ-AT ?auto_625283 ?auto_625290 ) ( OBJ-AT ?auto_625281 ?auto_625290 ) ( OBJ-AT ?auto_625282 ?auto_625288 ) ( IN-CITY ?auto_625291 ?auto_625289 ) ( not ( = ?auto_625280 ?auto_625291 ) ) ( OBJ-AT ?auto_625286 ?auto_625291 ) ( TRUCK-AT ?auto_625287 ?auto_625280 ) ( not ( = ?auto_625286 ?auto_625282 ) ) ( not ( = ?auto_625288 ?auto_625291 ) ) ( not ( = ?auto_625286 ?auto_625281 ) ) ( not ( = ?auto_625282 ?auto_625281 ) ) ( not ( = ?auto_625290 ?auto_625288 ) ) ( not ( = ?auto_625290 ?auto_625291 ) ) ( not ( = ?auto_625286 ?auto_625283 ) ) ( not ( = ?auto_625282 ?auto_625283 ) ) ( not ( = ?auto_625281 ?auto_625283 ) ) ( not ( = ?auto_625286 ?auto_625285 ) ) ( not ( = ?auto_625282 ?auto_625285 ) ) ( not ( = ?auto_625281 ?auto_625285 ) ) ( not ( = ?auto_625283 ?auto_625285 ) ) ( not ( = ?auto_625286 ?auto_625284 ) ) ( not ( = ?auto_625282 ?auto_625284 ) ) ( not ( = ?auto_625281 ?auto_625284 ) ) ( not ( = ?auto_625283 ?auto_625284 ) ) ( not ( = ?auto_625285 ?auto_625284 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_625286 ?auto_625282 ?auto_625281 ?auto_625283 ?auto_625284 ?auto_625285 ?auto_625280 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_626922 - OBJ
      ?auto_626923 - OBJ
      ?auto_626924 - OBJ
      ?auto_626925 - OBJ
      ?auto_626926 - OBJ
      ?auto_626927 - OBJ
      ?auto_626921 - LOCATION
    )
    :vars
    (
      ?auto_626929 - LOCATION
      ?auto_626930 - CITY
      ?auto_626931 - LOCATION
      ?auto_626932 - LOCATION
      ?auto_626928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_626929 ?auto_626930 ) ( IN-CITY ?auto_626921 ?auto_626930 ) ( not ( = ?auto_626921 ?auto_626929 ) ) ( OBJ-AT ?auto_626924 ?auto_626929 ) ( IN-CITY ?auto_626931 ?auto_626930 ) ( not ( = ?auto_626921 ?auto_626931 ) ) ( OBJ-AT ?auto_626927 ?auto_626931 ) ( OBJ-AT ?auto_626926 ?auto_626931 ) ( OBJ-AT ?auto_626922 ?auto_626931 ) ( OBJ-AT ?auto_626923 ?auto_626929 ) ( IN-CITY ?auto_626932 ?auto_626930 ) ( not ( = ?auto_626921 ?auto_626932 ) ) ( OBJ-AT ?auto_626925 ?auto_626932 ) ( TRUCK-AT ?auto_626928 ?auto_626921 ) ( not ( = ?auto_626925 ?auto_626923 ) ) ( not ( = ?auto_626929 ?auto_626932 ) ) ( not ( = ?auto_626925 ?auto_626922 ) ) ( not ( = ?auto_626923 ?auto_626922 ) ) ( not ( = ?auto_626931 ?auto_626929 ) ) ( not ( = ?auto_626931 ?auto_626932 ) ) ( not ( = ?auto_626925 ?auto_626926 ) ) ( not ( = ?auto_626923 ?auto_626926 ) ) ( not ( = ?auto_626922 ?auto_626926 ) ) ( not ( = ?auto_626925 ?auto_626927 ) ) ( not ( = ?auto_626923 ?auto_626927 ) ) ( not ( = ?auto_626922 ?auto_626927 ) ) ( not ( = ?auto_626926 ?auto_626927 ) ) ( not ( = ?auto_626925 ?auto_626924 ) ) ( not ( = ?auto_626923 ?auto_626924 ) ) ( not ( = ?auto_626922 ?auto_626924 ) ) ( not ( = ?auto_626926 ?auto_626924 ) ) ( not ( = ?auto_626927 ?auto_626924 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_626925 ?auto_626923 ?auto_626922 ?auto_626926 ?auto_626924 ?auto_626927 ?auto_626921 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_628167 - OBJ
      ?auto_628168 - OBJ
      ?auto_628169 - OBJ
      ?auto_628170 - OBJ
      ?auto_628171 - OBJ
      ?auto_628172 - OBJ
      ?auto_628166 - LOCATION
    )
    :vars
    (
      ?auto_628174 - LOCATION
      ?auto_628175 - CITY
      ?auto_628176 - LOCATION
      ?auto_628177 - LOCATION
      ?auto_628173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_628174 ?auto_628175 ) ( IN-CITY ?auto_628166 ?auto_628175 ) ( not ( = ?auto_628166 ?auto_628174 ) ) ( OBJ-AT ?auto_628169 ?auto_628174 ) ( IN-CITY ?auto_628176 ?auto_628175 ) ( not ( = ?auto_628166 ?auto_628176 ) ) ( OBJ-AT ?auto_628172 ?auto_628176 ) ( OBJ-AT ?auto_628170 ?auto_628176 ) ( OBJ-AT ?auto_628167 ?auto_628176 ) ( OBJ-AT ?auto_628168 ?auto_628174 ) ( IN-CITY ?auto_628177 ?auto_628175 ) ( not ( = ?auto_628166 ?auto_628177 ) ) ( OBJ-AT ?auto_628171 ?auto_628177 ) ( TRUCK-AT ?auto_628173 ?auto_628166 ) ( not ( = ?auto_628171 ?auto_628168 ) ) ( not ( = ?auto_628174 ?auto_628177 ) ) ( not ( = ?auto_628171 ?auto_628167 ) ) ( not ( = ?auto_628168 ?auto_628167 ) ) ( not ( = ?auto_628176 ?auto_628174 ) ) ( not ( = ?auto_628176 ?auto_628177 ) ) ( not ( = ?auto_628171 ?auto_628170 ) ) ( not ( = ?auto_628168 ?auto_628170 ) ) ( not ( = ?auto_628167 ?auto_628170 ) ) ( not ( = ?auto_628171 ?auto_628172 ) ) ( not ( = ?auto_628168 ?auto_628172 ) ) ( not ( = ?auto_628167 ?auto_628172 ) ) ( not ( = ?auto_628170 ?auto_628172 ) ) ( not ( = ?auto_628171 ?auto_628169 ) ) ( not ( = ?auto_628168 ?auto_628169 ) ) ( not ( = ?auto_628167 ?auto_628169 ) ) ( not ( = ?auto_628170 ?auto_628169 ) ) ( not ( = ?auto_628172 ?auto_628169 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_628171 ?auto_628168 ?auto_628167 ?auto_628170 ?auto_628169 ?auto_628172 ?auto_628166 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_628438 - OBJ
      ?auto_628439 - OBJ
      ?auto_628440 - OBJ
      ?auto_628441 - OBJ
      ?auto_628442 - OBJ
      ?auto_628443 - OBJ
      ?auto_628437 - LOCATION
    )
    :vars
    (
      ?auto_628445 - LOCATION
      ?auto_628446 - CITY
      ?auto_628447 - LOCATION
      ?auto_628448 - LOCATION
      ?auto_628444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_628445 ?auto_628446 ) ( IN-CITY ?auto_628437 ?auto_628446 ) ( not ( = ?auto_628437 ?auto_628445 ) ) ( OBJ-AT ?auto_628440 ?auto_628445 ) ( IN-CITY ?auto_628447 ?auto_628446 ) ( not ( = ?auto_628437 ?auto_628447 ) ) ( OBJ-AT ?auto_628442 ?auto_628447 ) ( OBJ-AT ?auto_628441 ?auto_628447 ) ( OBJ-AT ?auto_628438 ?auto_628447 ) ( OBJ-AT ?auto_628439 ?auto_628445 ) ( IN-CITY ?auto_628448 ?auto_628446 ) ( not ( = ?auto_628437 ?auto_628448 ) ) ( OBJ-AT ?auto_628443 ?auto_628448 ) ( TRUCK-AT ?auto_628444 ?auto_628437 ) ( not ( = ?auto_628443 ?auto_628439 ) ) ( not ( = ?auto_628445 ?auto_628448 ) ) ( not ( = ?auto_628443 ?auto_628438 ) ) ( not ( = ?auto_628439 ?auto_628438 ) ) ( not ( = ?auto_628447 ?auto_628445 ) ) ( not ( = ?auto_628447 ?auto_628448 ) ) ( not ( = ?auto_628443 ?auto_628441 ) ) ( not ( = ?auto_628439 ?auto_628441 ) ) ( not ( = ?auto_628438 ?auto_628441 ) ) ( not ( = ?auto_628443 ?auto_628442 ) ) ( not ( = ?auto_628439 ?auto_628442 ) ) ( not ( = ?auto_628438 ?auto_628442 ) ) ( not ( = ?auto_628441 ?auto_628442 ) ) ( not ( = ?auto_628443 ?auto_628440 ) ) ( not ( = ?auto_628439 ?auto_628440 ) ) ( not ( = ?auto_628438 ?auto_628440 ) ) ( not ( = ?auto_628441 ?auto_628440 ) ) ( not ( = ?auto_628442 ?auto_628440 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_628443 ?auto_628439 ?auto_628438 ?auto_628441 ?auto_628440 ?auto_628442 ?auto_628437 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_639306 - OBJ
      ?auto_639307 - OBJ
      ?auto_639308 - OBJ
      ?auto_639309 - OBJ
      ?auto_639310 - OBJ
      ?auto_639311 - OBJ
      ?auto_639305 - LOCATION
    )
    :vars
    (
      ?auto_639313 - LOCATION
      ?auto_639314 - CITY
      ?auto_639315 - LOCATION
      ?auto_639316 - LOCATION
      ?auto_639312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_639313 ?auto_639314 ) ( IN-CITY ?auto_639305 ?auto_639314 ) ( not ( = ?auto_639305 ?auto_639313 ) ) ( OBJ-AT ?auto_639311 ?auto_639313 ) ( IN-CITY ?auto_639315 ?auto_639314 ) ( not ( = ?auto_639305 ?auto_639315 ) ) ( OBJ-AT ?auto_639310 ?auto_639315 ) ( OBJ-AT ?auto_639307 ?auto_639315 ) ( OBJ-AT ?auto_639306 ?auto_639315 ) ( OBJ-AT ?auto_639309 ?auto_639313 ) ( IN-CITY ?auto_639316 ?auto_639314 ) ( not ( = ?auto_639305 ?auto_639316 ) ) ( OBJ-AT ?auto_639308 ?auto_639316 ) ( TRUCK-AT ?auto_639312 ?auto_639305 ) ( not ( = ?auto_639308 ?auto_639309 ) ) ( not ( = ?auto_639313 ?auto_639316 ) ) ( not ( = ?auto_639308 ?auto_639306 ) ) ( not ( = ?auto_639309 ?auto_639306 ) ) ( not ( = ?auto_639315 ?auto_639313 ) ) ( not ( = ?auto_639315 ?auto_639316 ) ) ( not ( = ?auto_639308 ?auto_639307 ) ) ( not ( = ?auto_639309 ?auto_639307 ) ) ( not ( = ?auto_639306 ?auto_639307 ) ) ( not ( = ?auto_639308 ?auto_639310 ) ) ( not ( = ?auto_639309 ?auto_639310 ) ) ( not ( = ?auto_639306 ?auto_639310 ) ) ( not ( = ?auto_639307 ?auto_639310 ) ) ( not ( = ?auto_639308 ?auto_639311 ) ) ( not ( = ?auto_639309 ?auto_639311 ) ) ( not ( = ?auto_639306 ?auto_639311 ) ) ( not ( = ?auto_639307 ?auto_639311 ) ) ( not ( = ?auto_639310 ?auto_639311 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_639308 ?auto_639309 ?auto_639306 ?auto_639307 ?auto_639311 ?auto_639310 ?auto_639305 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_639370 - OBJ
      ?auto_639371 - OBJ
      ?auto_639372 - OBJ
      ?auto_639373 - OBJ
      ?auto_639374 - OBJ
      ?auto_639375 - OBJ
      ?auto_639369 - LOCATION
    )
    :vars
    (
      ?auto_639377 - LOCATION
      ?auto_639378 - CITY
      ?auto_639379 - LOCATION
      ?auto_639380 - LOCATION
      ?auto_639376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_639377 ?auto_639378 ) ( IN-CITY ?auto_639369 ?auto_639378 ) ( not ( = ?auto_639369 ?auto_639377 ) ) ( OBJ-AT ?auto_639374 ?auto_639377 ) ( IN-CITY ?auto_639379 ?auto_639378 ) ( not ( = ?auto_639369 ?auto_639379 ) ) ( OBJ-AT ?auto_639375 ?auto_639379 ) ( OBJ-AT ?auto_639371 ?auto_639379 ) ( OBJ-AT ?auto_639370 ?auto_639379 ) ( OBJ-AT ?auto_639373 ?auto_639377 ) ( IN-CITY ?auto_639380 ?auto_639378 ) ( not ( = ?auto_639369 ?auto_639380 ) ) ( OBJ-AT ?auto_639372 ?auto_639380 ) ( TRUCK-AT ?auto_639376 ?auto_639369 ) ( not ( = ?auto_639372 ?auto_639373 ) ) ( not ( = ?auto_639377 ?auto_639380 ) ) ( not ( = ?auto_639372 ?auto_639370 ) ) ( not ( = ?auto_639373 ?auto_639370 ) ) ( not ( = ?auto_639379 ?auto_639377 ) ) ( not ( = ?auto_639379 ?auto_639380 ) ) ( not ( = ?auto_639372 ?auto_639371 ) ) ( not ( = ?auto_639373 ?auto_639371 ) ) ( not ( = ?auto_639370 ?auto_639371 ) ) ( not ( = ?auto_639372 ?auto_639375 ) ) ( not ( = ?auto_639373 ?auto_639375 ) ) ( not ( = ?auto_639370 ?auto_639375 ) ) ( not ( = ?auto_639371 ?auto_639375 ) ) ( not ( = ?auto_639372 ?auto_639374 ) ) ( not ( = ?auto_639373 ?auto_639374 ) ) ( not ( = ?auto_639370 ?auto_639374 ) ) ( not ( = ?auto_639371 ?auto_639374 ) ) ( not ( = ?auto_639375 ?auto_639374 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_639372 ?auto_639373 ?auto_639370 ?auto_639371 ?auto_639374 ?auto_639375 ?auto_639369 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_639708 - OBJ
      ?auto_639709 - OBJ
      ?auto_639710 - OBJ
      ?auto_639711 - OBJ
      ?auto_639712 - OBJ
      ?auto_639713 - OBJ
      ?auto_639707 - LOCATION
    )
    :vars
    (
      ?auto_639715 - LOCATION
      ?auto_639716 - CITY
      ?auto_639717 - LOCATION
      ?auto_639718 - LOCATION
      ?auto_639714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_639715 ?auto_639716 ) ( IN-CITY ?auto_639707 ?auto_639716 ) ( not ( = ?auto_639707 ?auto_639715 ) ) ( OBJ-AT ?auto_639713 ?auto_639715 ) ( IN-CITY ?auto_639717 ?auto_639716 ) ( not ( = ?auto_639707 ?auto_639717 ) ) ( OBJ-AT ?auto_639711 ?auto_639717 ) ( OBJ-AT ?auto_639709 ?auto_639717 ) ( OBJ-AT ?auto_639708 ?auto_639717 ) ( OBJ-AT ?auto_639712 ?auto_639715 ) ( IN-CITY ?auto_639718 ?auto_639716 ) ( not ( = ?auto_639707 ?auto_639718 ) ) ( OBJ-AT ?auto_639710 ?auto_639718 ) ( TRUCK-AT ?auto_639714 ?auto_639707 ) ( not ( = ?auto_639710 ?auto_639712 ) ) ( not ( = ?auto_639715 ?auto_639718 ) ) ( not ( = ?auto_639710 ?auto_639708 ) ) ( not ( = ?auto_639712 ?auto_639708 ) ) ( not ( = ?auto_639717 ?auto_639715 ) ) ( not ( = ?auto_639717 ?auto_639718 ) ) ( not ( = ?auto_639710 ?auto_639709 ) ) ( not ( = ?auto_639712 ?auto_639709 ) ) ( not ( = ?auto_639708 ?auto_639709 ) ) ( not ( = ?auto_639710 ?auto_639711 ) ) ( not ( = ?auto_639712 ?auto_639711 ) ) ( not ( = ?auto_639708 ?auto_639711 ) ) ( not ( = ?auto_639709 ?auto_639711 ) ) ( not ( = ?auto_639710 ?auto_639713 ) ) ( not ( = ?auto_639712 ?auto_639713 ) ) ( not ( = ?auto_639708 ?auto_639713 ) ) ( not ( = ?auto_639709 ?auto_639713 ) ) ( not ( = ?auto_639711 ?auto_639713 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_639710 ?auto_639712 ?auto_639708 ?auto_639709 ?auto_639713 ?auto_639711 ?auto_639707 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_640355 - OBJ
      ?auto_640356 - OBJ
      ?auto_640357 - OBJ
      ?auto_640358 - OBJ
      ?auto_640359 - OBJ
      ?auto_640360 - OBJ
      ?auto_640354 - LOCATION
    )
    :vars
    (
      ?auto_640362 - LOCATION
      ?auto_640363 - CITY
      ?auto_640364 - LOCATION
      ?auto_640365 - LOCATION
      ?auto_640361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_640362 ?auto_640363 ) ( IN-CITY ?auto_640354 ?auto_640363 ) ( not ( = ?auto_640354 ?auto_640362 ) ) ( OBJ-AT ?auto_640360 ?auto_640362 ) ( IN-CITY ?auto_640364 ?auto_640363 ) ( not ( = ?auto_640354 ?auto_640364 ) ) ( OBJ-AT ?auto_640359 ?auto_640364 ) ( OBJ-AT ?auto_640356 ?auto_640364 ) ( OBJ-AT ?auto_640355 ?auto_640364 ) ( OBJ-AT ?auto_640357 ?auto_640362 ) ( IN-CITY ?auto_640365 ?auto_640363 ) ( not ( = ?auto_640354 ?auto_640365 ) ) ( OBJ-AT ?auto_640358 ?auto_640365 ) ( TRUCK-AT ?auto_640361 ?auto_640354 ) ( not ( = ?auto_640358 ?auto_640357 ) ) ( not ( = ?auto_640362 ?auto_640365 ) ) ( not ( = ?auto_640358 ?auto_640355 ) ) ( not ( = ?auto_640357 ?auto_640355 ) ) ( not ( = ?auto_640364 ?auto_640362 ) ) ( not ( = ?auto_640364 ?auto_640365 ) ) ( not ( = ?auto_640358 ?auto_640356 ) ) ( not ( = ?auto_640357 ?auto_640356 ) ) ( not ( = ?auto_640355 ?auto_640356 ) ) ( not ( = ?auto_640358 ?auto_640359 ) ) ( not ( = ?auto_640357 ?auto_640359 ) ) ( not ( = ?auto_640355 ?auto_640359 ) ) ( not ( = ?auto_640356 ?auto_640359 ) ) ( not ( = ?auto_640358 ?auto_640360 ) ) ( not ( = ?auto_640357 ?auto_640360 ) ) ( not ( = ?auto_640355 ?auto_640360 ) ) ( not ( = ?auto_640356 ?auto_640360 ) ) ( not ( = ?auto_640359 ?auto_640360 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_640358 ?auto_640357 ?auto_640355 ?auto_640356 ?auto_640360 ?auto_640359 ?auto_640354 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_640419 - OBJ
      ?auto_640420 - OBJ
      ?auto_640421 - OBJ
      ?auto_640422 - OBJ
      ?auto_640423 - OBJ
      ?auto_640424 - OBJ
      ?auto_640418 - LOCATION
    )
    :vars
    (
      ?auto_640426 - LOCATION
      ?auto_640427 - CITY
      ?auto_640428 - LOCATION
      ?auto_640429 - LOCATION
      ?auto_640425 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_640426 ?auto_640427 ) ( IN-CITY ?auto_640418 ?auto_640427 ) ( not ( = ?auto_640418 ?auto_640426 ) ) ( OBJ-AT ?auto_640423 ?auto_640426 ) ( IN-CITY ?auto_640428 ?auto_640427 ) ( not ( = ?auto_640418 ?auto_640428 ) ) ( OBJ-AT ?auto_640424 ?auto_640428 ) ( OBJ-AT ?auto_640420 ?auto_640428 ) ( OBJ-AT ?auto_640419 ?auto_640428 ) ( OBJ-AT ?auto_640421 ?auto_640426 ) ( IN-CITY ?auto_640429 ?auto_640427 ) ( not ( = ?auto_640418 ?auto_640429 ) ) ( OBJ-AT ?auto_640422 ?auto_640429 ) ( TRUCK-AT ?auto_640425 ?auto_640418 ) ( not ( = ?auto_640422 ?auto_640421 ) ) ( not ( = ?auto_640426 ?auto_640429 ) ) ( not ( = ?auto_640422 ?auto_640419 ) ) ( not ( = ?auto_640421 ?auto_640419 ) ) ( not ( = ?auto_640428 ?auto_640426 ) ) ( not ( = ?auto_640428 ?auto_640429 ) ) ( not ( = ?auto_640422 ?auto_640420 ) ) ( not ( = ?auto_640421 ?auto_640420 ) ) ( not ( = ?auto_640419 ?auto_640420 ) ) ( not ( = ?auto_640422 ?auto_640424 ) ) ( not ( = ?auto_640421 ?auto_640424 ) ) ( not ( = ?auto_640419 ?auto_640424 ) ) ( not ( = ?auto_640420 ?auto_640424 ) ) ( not ( = ?auto_640422 ?auto_640423 ) ) ( not ( = ?auto_640421 ?auto_640423 ) ) ( not ( = ?auto_640419 ?auto_640423 ) ) ( not ( = ?auto_640420 ?auto_640423 ) ) ( not ( = ?auto_640424 ?auto_640423 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_640422 ?auto_640421 ?auto_640419 ?auto_640420 ?auto_640423 ?auto_640424 ?auto_640418 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_640894 - OBJ
      ?auto_640895 - OBJ
      ?auto_640896 - OBJ
      ?auto_640897 - OBJ
      ?auto_640898 - OBJ
      ?auto_640899 - OBJ
      ?auto_640893 - LOCATION
    )
    :vars
    (
      ?auto_640901 - LOCATION
      ?auto_640902 - CITY
      ?auto_640903 - LOCATION
      ?auto_640904 - LOCATION
      ?auto_640900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_640901 ?auto_640902 ) ( IN-CITY ?auto_640893 ?auto_640902 ) ( not ( = ?auto_640893 ?auto_640901 ) ) ( OBJ-AT ?auto_640899 ?auto_640901 ) ( IN-CITY ?auto_640903 ?auto_640902 ) ( not ( = ?auto_640893 ?auto_640903 ) ) ( OBJ-AT ?auto_640897 ?auto_640903 ) ( OBJ-AT ?auto_640895 ?auto_640903 ) ( OBJ-AT ?auto_640894 ?auto_640903 ) ( OBJ-AT ?auto_640896 ?auto_640901 ) ( IN-CITY ?auto_640904 ?auto_640902 ) ( not ( = ?auto_640893 ?auto_640904 ) ) ( OBJ-AT ?auto_640898 ?auto_640904 ) ( TRUCK-AT ?auto_640900 ?auto_640893 ) ( not ( = ?auto_640898 ?auto_640896 ) ) ( not ( = ?auto_640901 ?auto_640904 ) ) ( not ( = ?auto_640898 ?auto_640894 ) ) ( not ( = ?auto_640896 ?auto_640894 ) ) ( not ( = ?auto_640903 ?auto_640901 ) ) ( not ( = ?auto_640903 ?auto_640904 ) ) ( not ( = ?auto_640898 ?auto_640895 ) ) ( not ( = ?auto_640896 ?auto_640895 ) ) ( not ( = ?auto_640894 ?auto_640895 ) ) ( not ( = ?auto_640898 ?auto_640897 ) ) ( not ( = ?auto_640896 ?auto_640897 ) ) ( not ( = ?auto_640894 ?auto_640897 ) ) ( not ( = ?auto_640895 ?auto_640897 ) ) ( not ( = ?auto_640898 ?auto_640899 ) ) ( not ( = ?auto_640896 ?auto_640899 ) ) ( not ( = ?auto_640894 ?auto_640899 ) ) ( not ( = ?auto_640895 ?auto_640899 ) ) ( not ( = ?auto_640897 ?auto_640899 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_640898 ?auto_640896 ?auto_640894 ?auto_640895 ?auto_640899 ?auto_640897 ?auto_640893 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_640958 - OBJ
      ?auto_640959 - OBJ
      ?auto_640960 - OBJ
      ?auto_640961 - OBJ
      ?auto_640962 - OBJ
      ?auto_640963 - OBJ
      ?auto_640957 - LOCATION
    )
    :vars
    (
      ?auto_640965 - LOCATION
      ?auto_640966 - CITY
      ?auto_640967 - LOCATION
      ?auto_640968 - LOCATION
      ?auto_640964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_640965 ?auto_640966 ) ( IN-CITY ?auto_640957 ?auto_640966 ) ( not ( = ?auto_640957 ?auto_640965 ) ) ( OBJ-AT ?auto_640962 ?auto_640965 ) ( IN-CITY ?auto_640967 ?auto_640966 ) ( not ( = ?auto_640957 ?auto_640967 ) ) ( OBJ-AT ?auto_640961 ?auto_640967 ) ( OBJ-AT ?auto_640959 ?auto_640967 ) ( OBJ-AT ?auto_640958 ?auto_640967 ) ( OBJ-AT ?auto_640960 ?auto_640965 ) ( IN-CITY ?auto_640968 ?auto_640966 ) ( not ( = ?auto_640957 ?auto_640968 ) ) ( OBJ-AT ?auto_640963 ?auto_640968 ) ( TRUCK-AT ?auto_640964 ?auto_640957 ) ( not ( = ?auto_640963 ?auto_640960 ) ) ( not ( = ?auto_640965 ?auto_640968 ) ) ( not ( = ?auto_640963 ?auto_640958 ) ) ( not ( = ?auto_640960 ?auto_640958 ) ) ( not ( = ?auto_640967 ?auto_640965 ) ) ( not ( = ?auto_640967 ?auto_640968 ) ) ( not ( = ?auto_640963 ?auto_640959 ) ) ( not ( = ?auto_640960 ?auto_640959 ) ) ( not ( = ?auto_640958 ?auto_640959 ) ) ( not ( = ?auto_640963 ?auto_640961 ) ) ( not ( = ?auto_640960 ?auto_640961 ) ) ( not ( = ?auto_640958 ?auto_640961 ) ) ( not ( = ?auto_640959 ?auto_640961 ) ) ( not ( = ?auto_640963 ?auto_640962 ) ) ( not ( = ?auto_640960 ?auto_640962 ) ) ( not ( = ?auto_640958 ?auto_640962 ) ) ( not ( = ?auto_640959 ?auto_640962 ) ) ( not ( = ?auto_640961 ?auto_640962 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_640963 ?auto_640960 ?auto_640958 ?auto_640959 ?auto_640962 ?auto_640961 ?auto_640957 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_641087 - OBJ
      ?auto_641088 - OBJ
      ?auto_641089 - OBJ
      ?auto_641090 - OBJ
      ?auto_641091 - OBJ
      ?auto_641092 - OBJ
      ?auto_641086 - LOCATION
    )
    :vars
    (
      ?auto_641094 - LOCATION
      ?auto_641095 - CITY
      ?auto_641096 - LOCATION
      ?auto_641097 - LOCATION
      ?auto_641093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_641094 ?auto_641095 ) ( IN-CITY ?auto_641086 ?auto_641095 ) ( not ( = ?auto_641086 ?auto_641094 ) ) ( OBJ-AT ?auto_641090 ?auto_641094 ) ( IN-CITY ?auto_641096 ?auto_641095 ) ( not ( = ?auto_641086 ?auto_641096 ) ) ( OBJ-AT ?auto_641092 ?auto_641096 ) ( OBJ-AT ?auto_641088 ?auto_641096 ) ( OBJ-AT ?auto_641087 ?auto_641096 ) ( OBJ-AT ?auto_641089 ?auto_641094 ) ( IN-CITY ?auto_641097 ?auto_641095 ) ( not ( = ?auto_641086 ?auto_641097 ) ) ( OBJ-AT ?auto_641091 ?auto_641097 ) ( TRUCK-AT ?auto_641093 ?auto_641086 ) ( not ( = ?auto_641091 ?auto_641089 ) ) ( not ( = ?auto_641094 ?auto_641097 ) ) ( not ( = ?auto_641091 ?auto_641087 ) ) ( not ( = ?auto_641089 ?auto_641087 ) ) ( not ( = ?auto_641096 ?auto_641094 ) ) ( not ( = ?auto_641096 ?auto_641097 ) ) ( not ( = ?auto_641091 ?auto_641088 ) ) ( not ( = ?auto_641089 ?auto_641088 ) ) ( not ( = ?auto_641087 ?auto_641088 ) ) ( not ( = ?auto_641091 ?auto_641092 ) ) ( not ( = ?auto_641089 ?auto_641092 ) ) ( not ( = ?auto_641087 ?auto_641092 ) ) ( not ( = ?auto_641088 ?auto_641092 ) ) ( not ( = ?auto_641091 ?auto_641090 ) ) ( not ( = ?auto_641089 ?auto_641090 ) ) ( not ( = ?auto_641087 ?auto_641090 ) ) ( not ( = ?auto_641088 ?auto_641090 ) ) ( not ( = ?auto_641092 ?auto_641090 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_641091 ?auto_641089 ?auto_641087 ?auto_641088 ?auto_641090 ?auto_641092 ?auto_641086 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_641358 - OBJ
      ?auto_641359 - OBJ
      ?auto_641360 - OBJ
      ?auto_641361 - OBJ
      ?auto_641362 - OBJ
      ?auto_641363 - OBJ
      ?auto_641357 - LOCATION
    )
    :vars
    (
      ?auto_641365 - LOCATION
      ?auto_641366 - CITY
      ?auto_641367 - LOCATION
      ?auto_641368 - LOCATION
      ?auto_641364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_641365 ?auto_641366 ) ( IN-CITY ?auto_641357 ?auto_641366 ) ( not ( = ?auto_641357 ?auto_641365 ) ) ( OBJ-AT ?auto_641361 ?auto_641365 ) ( IN-CITY ?auto_641367 ?auto_641366 ) ( not ( = ?auto_641357 ?auto_641367 ) ) ( OBJ-AT ?auto_641362 ?auto_641367 ) ( OBJ-AT ?auto_641359 ?auto_641367 ) ( OBJ-AT ?auto_641358 ?auto_641367 ) ( OBJ-AT ?auto_641360 ?auto_641365 ) ( IN-CITY ?auto_641368 ?auto_641366 ) ( not ( = ?auto_641357 ?auto_641368 ) ) ( OBJ-AT ?auto_641363 ?auto_641368 ) ( TRUCK-AT ?auto_641364 ?auto_641357 ) ( not ( = ?auto_641363 ?auto_641360 ) ) ( not ( = ?auto_641365 ?auto_641368 ) ) ( not ( = ?auto_641363 ?auto_641358 ) ) ( not ( = ?auto_641360 ?auto_641358 ) ) ( not ( = ?auto_641367 ?auto_641365 ) ) ( not ( = ?auto_641367 ?auto_641368 ) ) ( not ( = ?auto_641363 ?auto_641359 ) ) ( not ( = ?auto_641360 ?auto_641359 ) ) ( not ( = ?auto_641358 ?auto_641359 ) ) ( not ( = ?auto_641363 ?auto_641362 ) ) ( not ( = ?auto_641360 ?auto_641362 ) ) ( not ( = ?auto_641358 ?auto_641362 ) ) ( not ( = ?auto_641359 ?auto_641362 ) ) ( not ( = ?auto_641363 ?auto_641361 ) ) ( not ( = ?auto_641360 ?auto_641361 ) ) ( not ( = ?auto_641358 ?auto_641361 ) ) ( not ( = ?auto_641359 ?auto_641361 ) ) ( not ( = ?auto_641362 ?auto_641361 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_641363 ?auto_641360 ?auto_641358 ?auto_641359 ?auto_641361 ?auto_641362 ?auto_641357 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_644080 - OBJ
      ?auto_644081 - OBJ
      ?auto_644082 - OBJ
      ?auto_644083 - OBJ
      ?auto_644084 - OBJ
      ?auto_644085 - OBJ
      ?auto_644079 - LOCATION
    )
    :vars
    (
      ?auto_644087 - LOCATION
      ?auto_644088 - CITY
      ?auto_644089 - LOCATION
      ?auto_644090 - LOCATION
      ?auto_644086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_644087 ?auto_644088 ) ( IN-CITY ?auto_644079 ?auto_644088 ) ( not ( = ?auto_644079 ?auto_644087 ) ) ( OBJ-AT ?auto_644085 ?auto_644087 ) ( IN-CITY ?auto_644089 ?auto_644088 ) ( not ( = ?auto_644079 ?auto_644089 ) ) ( OBJ-AT ?auto_644082 ?auto_644089 ) ( OBJ-AT ?auto_644081 ?auto_644089 ) ( OBJ-AT ?auto_644080 ?auto_644089 ) ( OBJ-AT ?auto_644084 ?auto_644087 ) ( IN-CITY ?auto_644090 ?auto_644088 ) ( not ( = ?auto_644079 ?auto_644090 ) ) ( OBJ-AT ?auto_644083 ?auto_644090 ) ( TRUCK-AT ?auto_644086 ?auto_644079 ) ( not ( = ?auto_644083 ?auto_644084 ) ) ( not ( = ?auto_644087 ?auto_644090 ) ) ( not ( = ?auto_644083 ?auto_644080 ) ) ( not ( = ?auto_644084 ?auto_644080 ) ) ( not ( = ?auto_644089 ?auto_644087 ) ) ( not ( = ?auto_644089 ?auto_644090 ) ) ( not ( = ?auto_644083 ?auto_644081 ) ) ( not ( = ?auto_644084 ?auto_644081 ) ) ( not ( = ?auto_644080 ?auto_644081 ) ) ( not ( = ?auto_644083 ?auto_644082 ) ) ( not ( = ?auto_644084 ?auto_644082 ) ) ( not ( = ?auto_644080 ?auto_644082 ) ) ( not ( = ?auto_644081 ?auto_644082 ) ) ( not ( = ?auto_644083 ?auto_644085 ) ) ( not ( = ?auto_644084 ?auto_644085 ) ) ( not ( = ?auto_644080 ?auto_644085 ) ) ( not ( = ?auto_644081 ?auto_644085 ) ) ( not ( = ?auto_644082 ?auto_644085 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_644083 ?auto_644084 ?auto_644080 ?auto_644081 ?auto_644085 ?auto_644082 ?auto_644079 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_644203 - OBJ
      ?auto_644204 - OBJ
      ?auto_644205 - OBJ
      ?auto_644206 - OBJ
      ?auto_644207 - OBJ
      ?auto_644208 - OBJ
      ?auto_644202 - LOCATION
    )
    :vars
    (
      ?auto_644210 - LOCATION
      ?auto_644211 - CITY
      ?auto_644212 - LOCATION
      ?auto_644213 - LOCATION
      ?auto_644209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_644210 ?auto_644211 ) ( IN-CITY ?auto_644202 ?auto_644211 ) ( not ( = ?auto_644202 ?auto_644210 ) ) ( OBJ-AT ?auto_644208 ?auto_644210 ) ( IN-CITY ?auto_644212 ?auto_644211 ) ( not ( = ?auto_644202 ?auto_644212 ) ) ( OBJ-AT ?auto_644205 ?auto_644212 ) ( OBJ-AT ?auto_644204 ?auto_644212 ) ( OBJ-AT ?auto_644203 ?auto_644212 ) ( OBJ-AT ?auto_644206 ?auto_644210 ) ( IN-CITY ?auto_644213 ?auto_644211 ) ( not ( = ?auto_644202 ?auto_644213 ) ) ( OBJ-AT ?auto_644207 ?auto_644213 ) ( TRUCK-AT ?auto_644209 ?auto_644202 ) ( not ( = ?auto_644207 ?auto_644206 ) ) ( not ( = ?auto_644210 ?auto_644213 ) ) ( not ( = ?auto_644207 ?auto_644203 ) ) ( not ( = ?auto_644206 ?auto_644203 ) ) ( not ( = ?auto_644212 ?auto_644210 ) ) ( not ( = ?auto_644212 ?auto_644213 ) ) ( not ( = ?auto_644207 ?auto_644204 ) ) ( not ( = ?auto_644206 ?auto_644204 ) ) ( not ( = ?auto_644203 ?auto_644204 ) ) ( not ( = ?auto_644207 ?auto_644205 ) ) ( not ( = ?auto_644206 ?auto_644205 ) ) ( not ( = ?auto_644203 ?auto_644205 ) ) ( not ( = ?auto_644204 ?auto_644205 ) ) ( not ( = ?auto_644207 ?auto_644208 ) ) ( not ( = ?auto_644206 ?auto_644208 ) ) ( not ( = ?auto_644203 ?auto_644208 ) ) ( not ( = ?auto_644204 ?auto_644208 ) ) ( not ( = ?auto_644205 ?auto_644208 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_644207 ?auto_644206 ?auto_644203 ?auto_644204 ?auto_644208 ?auto_644205 ?auto_644202 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_644267 - OBJ
      ?auto_644268 - OBJ
      ?auto_644269 - OBJ
      ?auto_644270 - OBJ
      ?auto_644271 - OBJ
      ?auto_644272 - OBJ
      ?auto_644266 - LOCATION
    )
    :vars
    (
      ?auto_644274 - LOCATION
      ?auto_644275 - CITY
      ?auto_644276 - LOCATION
      ?auto_644277 - LOCATION
      ?auto_644273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_644274 ?auto_644275 ) ( IN-CITY ?auto_644266 ?auto_644275 ) ( not ( = ?auto_644266 ?auto_644274 ) ) ( OBJ-AT ?auto_644271 ?auto_644274 ) ( IN-CITY ?auto_644276 ?auto_644275 ) ( not ( = ?auto_644266 ?auto_644276 ) ) ( OBJ-AT ?auto_644269 ?auto_644276 ) ( OBJ-AT ?auto_644268 ?auto_644276 ) ( OBJ-AT ?auto_644267 ?auto_644276 ) ( OBJ-AT ?auto_644270 ?auto_644274 ) ( IN-CITY ?auto_644277 ?auto_644275 ) ( not ( = ?auto_644266 ?auto_644277 ) ) ( OBJ-AT ?auto_644272 ?auto_644277 ) ( TRUCK-AT ?auto_644273 ?auto_644266 ) ( not ( = ?auto_644272 ?auto_644270 ) ) ( not ( = ?auto_644274 ?auto_644277 ) ) ( not ( = ?auto_644272 ?auto_644267 ) ) ( not ( = ?auto_644270 ?auto_644267 ) ) ( not ( = ?auto_644276 ?auto_644274 ) ) ( not ( = ?auto_644276 ?auto_644277 ) ) ( not ( = ?auto_644272 ?auto_644268 ) ) ( not ( = ?auto_644270 ?auto_644268 ) ) ( not ( = ?auto_644267 ?auto_644268 ) ) ( not ( = ?auto_644272 ?auto_644269 ) ) ( not ( = ?auto_644270 ?auto_644269 ) ) ( not ( = ?auto_644267 ?auto_644269 ) ) ( not ( = ?auto_644268 ?auto_644269 ) ) ( not ( = ?auto_644272 ?auto_644271 ) ) ( not ( = ?auto_644270 ?auto_644271 ) ) ( not ( = ?auto_644267 ?auto_644271 ) ) ( not ( = ?auto_644268 ?auto_644271 ) ) ( not ( = ?auto_644269 ?auto_644271 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_644272 ?auto_644270 ?auto_644267 ?auto_644268 ?auto_644271 ?auto_644269 ?auto_644266 ) )
  )

)

