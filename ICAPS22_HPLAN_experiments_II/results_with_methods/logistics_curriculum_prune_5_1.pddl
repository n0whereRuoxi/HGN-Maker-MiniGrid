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
      ?auto_58375 - OBJ
      ?auto_58374 - LOCATION
    )
    :vars
    (
      ?auto_58377 - LOCATION
      ?auto_58378 - CITY
      ?auto_58376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58377 ?auto_58378 ) ( IN-CITY ?auto_58374 ?auto_58378 ) ( not ( = ?auto_58374 ?auto_58377 ) ) ( OBJ-AT ?auto_58375 ?auto_58377 ) ( TRUCK-AT ?auto_58376 ?auto_58374 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_58376 ?auto_58374 ?auto_58377 ?auto_58378 )
      ( !LOAD-TRUCK ?auto_58375 ?auto_58376 ?auto_58377 )
      ( !DRIVE-TRUCK ?auto_58376 ?auto_58377 ?auto_58374 ?auto_58378 )
      ( !UNLOAD-TRUCK ?auto_58375 ?auto_58376 ?auto_58374 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58396 - OBJ
      ?auto_58397 - OBJ
      ?auto_58395 - LOCATION
    )
    :vars
    (
      ?auto_58398 - LOCATION
      ?auto_58399 - CITY
      ?auto_58401 - LOCATION
      ?auto_58400 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58398 ?auto_58399 ) ( IN-CITY ?auto_58395 ?auto_58399 ) ( not ( = ?auto_58395 ?auto_58398 ) ) ( OBJ-AT ?auto_58397 ?auto_58398 ) ( IN-CITY ?auto_58401 ?auto_58399 ) ( not ( = ?auto_58395 ?auto_58401 ) ) ( OBJ-AT ?auto_58396 ?auto_58401 ) ( TRUCK-AT ?auto_58400 ?auto_58395 ) ( not ( = ?auto_58396 ?auto_58397 ) ) ( not ( = ?auto_58398 ?auto_58401 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_58396 ?auto_58395 )
      ( DELIVER-1PKG ?auto_58397 ?auto_58395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58507 - OBJ
      ?auto_58508 - OBJ
      ?auto_58509 - OBJ
      ?auto_58506 - LOCATION
    )
    :vars
    (
      ?auto_58511 - LOCATION
      ?auto_58512 - CITY
      ?auto_58514 - LOCATION
      ?auto_58513 - LOCATION
      ?auto_58510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58511 ?auto_58512 ) ( IN-CITY ?auto_58506 ?auto_58512 ) ( not ( = ?auto_58506 ?auto_58511 ) ) ( OBJ-AT ?auto_58509 ?auto_58511 ) ( IN-CITY ?auto_58514 ?auto_58512 ) ( not ( = ?auto_58506 ?auto_58514 ) ) ( OBJ-AT ?auto_58508 ?auto_58514 ) ( IN-CITY ?auto_58513 ?auto_58512 ) ( not ( = ?auto_58506 ?auto_58513 ) ) ( OBJ-AT ?auto_58507 ?auto_58513 ) ( TRUCK-AT ?auto_58510 ?auto_58506 ) ( not ( = ?auto_58507 ?auto_58508 ) ) ( not ( = ?auto_58514 ?auto_58513 ) ) ( not ( = ?auto_58507 ?auto_58509 ) ) ( not ( = ?auto_58508 ?auto_58509 ) ) ( not ( = ?auto_58511 ?auto_58514 ) ) ( not ( = ?auto_58511 ?auto_58513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58507 ?auto_58508 ?auto_58506 )
      ( DELIVER-1PKG ?auto_58509 ?auto_58506 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59650 - OBJ
      ?auto_59651 - OBJ
      ?auto_59652 - OBJ
      ?auto_59653 - OBJ
      ?auto_59649 - LOCATION
    )
    :vars
    (
      ?auto_59654 - LOCATION
      ?auto_59656 - CITY
      ?auto_59657 - LOCATION
      ?auto_59659 - LOCATION
      ?auto_59658 - LOCATION
      ?auto_59655 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59654 ?auto_59656 ) ( IN-CITY ?auto_59649 ?auto_59656 ) ( not ( = ?auto_59649 ?auto_59654 ) ) ( OBJ-AT ?auto_59653 ?auto_59654 ) ( IN-CITY ?auto_59657 ?auto_59656 ) ( not ( = ?auto_59649 ?auto_59657 ) ) ( OBJ-AT ?auto_59652 ?auto_59657 ) ( IN-CITY ?auto_59659 ?auto_59656 ) ( not ( = ?auto_59649 ?auto_59659 ) ) ( OBJ-AT ?auto_59651 ?auto_59659 ) ( IN-CITY ?auto_59658 ?auto_59656 ) ( not ( = ?auto_59649 ?auto_59658 ) ) ( OBJ-AT ?auto_59650 ?auto_59658 ) ( TRUCK-AT ?auto_59655 ?auto_59649 ) ( not ( = ?auto_59650 ?auto_59651 ) ) ( not ( = ?auto_59659 ?auto_59658 ) ) ( not ( = ?auto_59650 ?auto_59652 ) ) ( not ( = ?auto_59651 ?auto_59652 ) ) ( not ( = ?auto_59657 ?auto_59659 ) ) ( not ( = ?auto_59657 ?auto_59658 ) ) ( not ( = ?auto_59650 ?auto_59653 ) ) ( not ( = ?auto_59651 ?auto_59653 ) ) ( not ( = ?auto_59652 ?auto_59653 ) ) ( not ( = ?auto_59654 ?auto_59657 ) ) ( not ( = ?auto_59654 ?auto_59659 ) ) ( not ( = ?auto_59654 ?auto_59658 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59650 ?auto_59651 ?auto_59652 ?auto_59649 )
      ( DELIVER-1PKG ?auto_59653 ?auto_59649 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75260 - OBJ
      ?auto_75261 - OBJ
      ?auto_75262 - OBJ
      ?auto_75263 - OBJ
      ?auto_75264 - OBJ
      ?auto_75259 - LOCATION
    )
    :vars
    (
      ?auto_75266 - LOCATION
      ?auto_75267 - CITY
      ?auto_75269 - LOCATION
      ?auto_75270 - LOCATION
      ?auto_75268 - LOCATION
      ?auto_75265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75266 ?auto_75267 ) ( IN-CITY ?auto_75259 ?auto_75267 ) ( not ( = ?auto_75259 ?auto_75266 ) ) ( OBJ-AT ?auto_75264 ?auto_75266 ) ( IN-CITY ?auto_75269 ?auto_75267 ) ( not ( = ?auto_75259 ?auto_75269 ) ) ( OBJ-AT ?auto_75263 ?auto_75269 ) ( IN-CITY ?auto_75270 ?auto_75267 ) ( not ( = ?auto_75259 ?auto_75270 ) ) ( OBJ-AT ?auto_75262 ?auto_75270 ) ( IN-CITY ?auto_75268 ?auto_75267 ) ( not ( = ?auto_75259 ?auto_75268 ) ) ( OBJ-AT ?auto_75261 ?auto_75268 ) ( OBJ-AT ?auto_75260 ?auto_75266 ) ( TRUCK-AT ?auto_75265 ?auto_75259 ) ( not ( = ?auto_75260 ?auto_75261 ) ) ( not ( = ?auto_75268 ?auto_75266 ) ) ( not ( = ?auto_75260 ?auto_75262 ) ) ( not ( = ?auto_75261 ?auto_75262 ) ) ( not ( = ?auto_75270 ?auto_75268 ) ) ( not ( = ?auto_75270 ?auto_75266 ) ) ( not ( = ?auto_75260 ?auto_75263 ) ) ( not ( = ?auto_75261 ?auto_75263 ) ) ( not ( = ?auto_75262 ?auto_75263 ) ) ( not ( = ?auto_75269 ?auto_75270 ) ) ( not ( = ?auto_75269 ?auto_75268 ) ) ( not ( = ?auto_75269 ?auto_75266 ) ) ( not ( = ?auto_75260 ?auto_75264 ) ) ( not ( = ?auto_75261 ?auto_75264 ) ) ( not ( = ?auto_75262 ?auto_75264 ) ) ( not ( = ?auto_75263 ?auto_75264 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_75260 ?auto_75261 ?auto_75262 ?auto_75263 ?auto_75259 )
      ( DELIVER-1PKG ?auto_75264 ?auto_75259 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75311 - OBJ
      ?auto_75312 - OBJ
      ?auto_75313 - OBJ
      ?auto_75314 - OBJ
      ?auto_75315 - OBJ
      ?auto_75310 - LOCATION
    )
    :vars
    (
      ?auto_75317 - LOCATION
      ?auto_75321 - CITY
      ?auto_75319 - LOCATION
      ?auto_75320 - LOCATION
      ?auto_75318 - LOCATION
      ?auto_75316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75317 ?auto_75321 ) ( IN-CITY ?auto_75310 ?auto_75321 ) ( not ( = ?auto_75310 ?auto_75317 ) ) ( OBJ-AT ?auto_75314 ?auto_75317 ) ( IN-CITY ?auto_75319 ?auto_75321 ) ( not ( = ?auto_75310 ?auto_75319 ) ) ( OBJ-AT ?auto_75315 ?auto_75319 ) ( IN-CITY ?auto_75320 ?auto_75321 ) ( not ( = ?auto_75310 ?auto_75320 ) ) ( OBJ-AT ?auto_75313 ?auto_75320 ) ( IN-CITY ?auto_75318 ?auto_75321 ) ( not ( = ?auto_75310 ?auto_75318 ) ) ( OBJ-AT ?auto_75312 ?auto_75318 ) ( OBJ-AT ?auto_75311 ?auto_75317 ) ( TRUCK-AT ?auto_75316 ?auto_75310 ) ( not ( = ?auto_75311 ?auto_75312 ) ) ( not ( = ?auto_75318 ?auto_75317 ) ) ( not ( = ?auto_75311 ?auto_75313 ) ) ( not ( = ?auto_75312 ?auto_75313 ) ) ( not ( = ?auto_75320 ?auto_75318 ) ) ( not ( = ?auto_75320 ?auto_75317 ) ) ( not ( = ?auto_75311 ?auto_75315 ) ) ( not ( = ?auto_75312 ?auto_75315 ) ) ( not ( = ?auto_75313 ?auto_75315 ) ) ( not ( = ?auto_75319 ?auto_75320 ) ) ( not ( = ?auto_75319 ?auto_75318 ) ) ( not ( = ?auto_75319 ?auto_75317 ) ) ( not ( = ?auto_75311 ?auto_75314 ) ) ( not ( = ?auto_75312 ?auto_75314 ) ) ( not ( = ?auto_75313 ?auto_75314 ) ) ( not ( = ?auto_75315 ?auto_75314 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75311 ?auto_75312 ?auto_75313 ?auto_75315 ?auto_75314 ?auto_75310 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75614 - OBJ
      ?auto_75615 - OBJ
      ?auto_75616 - OBJ
      ?auto_75617 - OBJ
      ?auto_75618 - OBJ
      ?auto_75613 - LOCATION
    )
    :vars
    (
      ?auto_75624 - LOCATION
      ?auto_75620 - CITY
      ?auto_75622 - LOCATION
      ?auto_75619 - LOCATION
      ?auto_75623 - LOCATION
      ?auto_75621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75624 ?auto_75620 ) ( IN-CITY ?auto_75613 ?auto_75620 ) ( not ( = ?auto_75613 ?auto_75624 ) ) ( OBJ-AT ?auto_75616 ?auto_75624 ) ( IN-CITY ?auto_75622 ?auto_75620 ) ( not ( = ?auto_75613 ?auto_75622 ) ) ( OBJ-AT ?auto_75618 ?auto_75622 ) ( IN-CITY ?auto_75619 ?auto_75620 ) ( not ( = ?auto_75613 ?auto_75619 ) ) ( OBJ-AT ?auto_75617 ?auto_75619 ) ( IN-CITY ?auto_75623 ?auto_75620 ) ( not ( = ?auto_75613 ?auto_75623 ) ) ( OBJ-AT ?auto_75615 ?auto_75623 ) ( OBJ-AT ?auto_75614 ?auto_75624 ) ( TRUCK-AT ?auto_75621 ?auto_75613 ) ( not ( = ?auto_75614 ?auto_75615 ) ) ( not ( = ?auto_75623 ?auto_75624 ) ) ( not ( = ?auto_75614 ?auto_75617 ) ) ( not ( = ?auto_75615 ?auto_75617 ) ) ( not ( = ?auto_75619 ?auto_75623 ) ) ( not ( = ?auto_75619 ?auto_75624 ) ) ( not ( = ?auto_75614 ?auto_75618 ) ) ( not ( = ?auto_75615 ?auto_75618 ) ) ( not ( = ?auto_75617 ?auto_75618 ) ) ( not ( = ?auto_75622 ?auto_75619 ) ) ( not ( = ?auto_75622 ?auto_75623 ) ) ( not ( = ?auto_75622 ?auto_75624 ) ) ( not ( = ?auto_75614 ?auto_75616 ) ) ( not ( = ?auto_75615 ?auto_75616 ) ) ( not ( = ?auto_75617 ?auto_75616 ) ) ( not ( = ?auto_75618 ?auto_75616 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75614 ?auto_75615 ?auto_75617 ?auto_75616 ?auto_75618 ?auto_75613 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77828 - OBJ
      ?auto_77829 - OBJ
      ?auto_77830 - OBJ
      ?auto_77831 - OBJ
      ?auto_77832 - OBJ
      ?auto_77827 - LOCATION
    )
    :vars
    (
      ?auto_77838 - LOCATION
      ?auto_77834 - CITY
      ?auto_77836 - LOCATION
      ?auto_77833 - LOCATION
      ?auto_77837 - LOCATION
      ?auto_77835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77838 ?auto_77834 ) ( IN-CITY ?auto_77827 ?auto_77834 ) ( not ( = ?auto_77827 ?auto_77838 ) ) ( OBJ-AT ?auto_77829 ?auto_77838 ) ( IN-CITY ?auto_77836 ?auto_77834 ) ( not ( = ?auto_77827 ?auto_77836 ) ) ( OBJ-AT ?auto_77832 ?auto_77836 ) ( IN-CITY ?auto_77833 ?auto_77834 ) ( not ( = ?auto_77827 ?auto_77833 ) ) ( OBJ-AT ?auto_77831 ?auto_77833 ) ( IN-CITY ?auto_77837 ?auto_77834 ) ( not ( = ?auto_77827 ?auto_77837 ) ) ( OBJ-AT ?auto_77830 ?auto_77837 ) ( OBJ-AT ?auto_77828 ?auto_77838 ) ( TRUCK-AT ?auto_77835 ?auto_77827 ) ( not ( = ?auto_77828 ?auto_77830 ) ) ( not ( = ?auto_77837 ?auto_77838 ) ) ( not ( = ?auto_77828 ?auto_77831 ) ) ( not ( = ?auto_77830 ?auto_77831 ) ) ( not ( = ?auto_77833 ?auto_77837 ) ) ( not ( = ?auto_77833 ?auto_77838 ) ) ( not ( = ?auto_77828 ?auto_77832 ) ) ( not ( = ?auto_77830 ?auto_77832 ) ) ( not ( = ?auto_77831 ?auto_77832 ) ) ( not ( = ?auto_77836 ?auto_77833 ) ) ( not ( = ?auto_77836 ?auto_77837 ) ) ( not ( = ?auto_77836 ?auto_77838 ) ) ( not ( = ?auto_77828 ?auto_77829 ) ) ( not ( = ?auto_77830 ?auto_77829 ) ) ( not ( = ?auto_77831 ?auto_77829 ) ) ( not ( = ?auto_77832 ?auto_77829 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77828 ?auto_77830 ?auto_77831 ?auto_77829 ?auto_77832 ?auto_77827 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79250 - OBJ
      ?auto_79251 - OBJ
      ?auto_79252 - OBJ
      ?auto_79253 - OBJ
      ?auto_79254 - OBJ
      ?auto_79249 - LOCATION
    )
    :vars
    (
      ?auto_79260 - LOCATION
      ?auto_79256 - CITY
      ?auto_79258 - LOCATION
      ?auto_79255 - LOCATION
      ?auto_79259 - LOCATION
      ?auto_79257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79260 ?auto_79256 ) ( IN-CITY ?auto_79249 ?auto_79256 ) ( not ( = ?auto_79249 ?auto_79260 ) ) ( OBJ-AT ?auto_79254 ?auto_79260 ) ( IN-CITY ?auto_79258 ?auto_79256 ) ( not ( = ?auto_79249 ?auto_79258 ) ) ( OBJ-AT ?auto_79253 ?auto_79258 ) ( IN-CITY ?auto_79255 ?auto_79256 ) ( not ( = ?auto_79249 ?auto_79255 ) ) ( OBJ-AT ?auto_79252 ?auto_79255 ) ( IN-CITY ?auto_79259 ?auto_79256 ) ( not ( = ?auto_79249 ?auto_79259 ) ) ( OBJ-AT ?auto_79250 ?auto_79259 ) ( OBJ-AT ?auto_79251 ?auto_79260 ) ( TRUCK-AT ?auto_79257 ?auto_79249 ) ( not ( = ?auto_79251 ?auto_79250 ) ) ( not ( = ?auto_79259 ?auto_79260 ) ) ( not ( = ?auto_79251 ?auto_79252 ) ) ( not ( = ?auto_79250 ?auto_79252 ) ) ( not ( = ?auto_79255 ?auto_79259 ) ) ( not ( = ?auto_79255 ?auto_79260 ) ) ( not ( = ?auto_79251 ?auto_79253 ) ) ( not ( = ?auto_79250 ?auto_79253 ) ) ( not ( = ?auto_79252 ?auto_79253 ) ) ( not ( = ?auto_79258 ?auto_79255 ) ) ( not ( = ?auto_79258 ?auto_79259 ) ) ( not ( = ?auto_79258 ?auto_79260 ) ) ( not ( = ?auto_79251 ?auto_79254 ) ) ( not ( = ?auto_79250 ?auto_79254 ) ) ( not ( = ?auto_79252 ?auto_79254 ) ) ( not ( = ?auto_79253 ?auto_79254 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79251 ?auto_79250 ?auto_79252 ?auto_79254 ?auto_79253 ?auto_79249 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79301 - OBJ
      ?auto_79302 - OBJ
      ?auto_79303 - OBJ
      ?auto_79304 - OBJ
      ?auto_79305 - OBJ
      ?auto_79300 - LOCATION
    )
    :vars
    (
      ?auto_79311 - LOCATION
      ?auto_79307 - CITY
      ?auto_79309 - LOCATION
      ?auto_79306 - LOCATION
      ?auto_79310 - LOCATION
      ?auto_79308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79311 ?auto_79307 ) ( IN-CITY ?auto_79300 ?auto_79307 ) ( not ( = ?auto_79300 ?auto_79311 ) ) ( OBJ-AT ?auto_79304 ?auto_79311 ) ( IN-CITY ?auto_79309 ?auto_79307 ) ( not ( = ?auto_79300 ?auto_79309 ) ) ( OBJ-AT ?auto_79305 ?auto_79309 ) ( IN-CITY ?auto_79306 ?auto_79307 ) ( not ( = ?auto_79300 ?auto_79306 ) ) ( OBJ-AT ?auto_79303 ?auto_79306 ) ( IN-CITY ?auto_79310 ?auto_79307 ) ( not ( = ?auto_79300 ?auto_79310 ) ) ( OBJ-AT ?auto_79301 ?auto_79310 ) ( OBJ-AT ?auto_79302 ?auto_79311 ) ( TRUCK-AT ?auto_79308 ?auto_79300 ) ( not ( = ?auto_79302 ?auto_79301 ) ) ( not ( = ?auto_79310 ?auto_79311 ) ) ( not ( = ?auto_79302 ?auto_79303 ) ) ( not ( = ?auto_79301 ?auto_79303 ) ) ( not ( = ?auto_79306 ?auto_79310 ) ) ( not ( = ?auto_79306 ?auto_79311 ) ) ( not ( = ?auto_79302 ?auto_79305 ) ) ( not ( = ?auto_79301 ?auto_79305 ) ) ( not ( = ?auto_79303 ?auto_79305 ) ) ( not ( = ?auto_79309 ?auto_79306 ) ) ( not ( = ?auto_79309 ?auto_79310 ) ) ( not ( = ?auto_79309 ?auto_79311 ) ) ( not ( = ?auto_79302 ?auto_79304 ) ) ( not ( = ?auto_79301 ?auto_79304 ) ) ( not ( = ?auto_79303 ?auto_79304 ) ) ( not ( = ?auto_79305 ?auto_79304 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79302 ?auto_79301 ?auto_79303 ?auto_79304 ?auto_79305 ?auto_79300 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79604 - OBJ
      ?auto_79605 - OBJ
      ?auto_79606 - OBJ
      ?auto_79607 - OBJ
      ?auto_79608 - OBJ
      ?auto_79603 - LOCATION
    )
    :vars
    (
      ?auto_79614 - LOCATION
      ?auto_79610 - CITY
      ?auto_79612 - LOCATION
      ?auto_79609 - LOCATION
      ?auto_79613 - LOCATION
      ?auto_79611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79614 ?auto_79610 ) ( IN-CITY ?auto_79603 ?auto_79610 ) ( not ( = ?auto_79603 ?auto_79614 ) ) ( OBJ-AT ?auto_79606 ?auto_79614 ) ( IN-CITY ?auto_79612 ?auto_79610 ) ( not ( = ?auto_79603 ?auto_79612 ) ) ( OBJ-AT ?auto_79608 ?auto_79612 ) ( IN-CITY ?auto_79609 ?auto_79610 ) ( not ( = ?auto_79603 ?auto_79609 ) ) ( OBJ-AT ?auto_79607 ?auto_79609 ) ( IN-CITY ?auto_79613 ?auto_79610 ) ( not ( = ?auto_79603 ?auto_79613 ) ) ( OBJ-AT ?auto_79604 ?auto_79613 ) ( OBJ-AT ?auto_79605 ?auto_79614 ) ( TRUCK-AT ?auto_79611 ?auto_79603 ) ( not ( = ?auto_79605 ?auto_79604 ) ) ( not ( = ?auto_79613 ?auto_79614 ) ) ( not ( = ?auto_79605 ?auto_79607 ) ) ( not ( = ?auto_79604 ?auto_79607 ) ) ( not ( = ?auto_79609 ?auto_79613 ) ) ( not ( = ?auto_79609 ?auto_79614 ) ) ( not ( = ?auto_79605 ?auto_79608 ) ) ( not ( = ?auto_79604 ?auto_79608 ) ) ( not ( = ?auto_79607 ?auto_79608 ) ) ( not ( = ?auto_79612 ?auto_79609 ) ) ( not ( = ?auto_79612 ?auto_79613 ) ) ( not ( = ?auto_79612 ?auto_79614 ) ) ( not ( = ?auto_79605 ?auto_79606 ) ) ( not ( = ?auto_79604 ?auto_79606 ) ) ( not ( = ?auto_79607 ?auto_79606 ) ) ( not ( = ?auto_79608 ?auto_79606 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79605 ?auto_79604 ?auto_79607 ?auto_79606 ?auto_79608 ?auto_79603 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80637 - OBJ
      ?auto_80638 - OBJ
      ?auto_80639 - OBJ
      ?auto_80640 - OBJ
      ?auto_80641 - OBJ
      ?auto_80636 - LOCATION
    )
    :vars
    (
      ?auto_80647 - LOCATION
      ?auto_80643 - CITY
      ?auto_80645 - LOCATION
      ?auto_80642 - LOCATION
      ?auto_80646 - LOCATION
      ?auto_80644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80647 ?auto_80643 ) ( IN-CITY ?auto_80636 ?auto_80643 ) ( not ( = ?auto_80636 ?auto_80647 ) ) ( OBJ-AT ?auto_80641 ?auto_80647 ) ( IN-CITY ?auto_80645 ?auto_80643 ) ( not ( = ?auto_80636 ?auto_80645 ) ) ( OBJ-AT ?auto_80640 ?auto_80645 ) ( IN-CITY ?auto_80642 ?auto_80643 ) ( not ( = ?auto_80636 ?auto_80642 ) ) ( OBJ-AT ?auto_80638 ?auto_80642 ) ( IN-CITY ?auto_80646 ?auto_80643 ) ( not ( = ?auto_80636 ?auto_80646 ) ) ( OBJ-AT ?auto_80637 ?auto_80646 ) ( OBJ-AT ?auto_80639 ?auto_80647 ) ( TRUCK-AT ?auto_80644 ?auto_80636 ) ( not ( = ?auto_80639 ?auto_80637 ) ) ( not ( = ?auto_80646 ?auto_80647 ) ) ( not ( = ?auto_80639 ?auto_80638 ) ) ( not ( = ?auto_80637 ?auto_80638 ) ) ( not ( = ?auto_80642 ?auto_80646 ) ) ( not ( = ?auto_80642 ?auto_80647 ) ) ( not ( = ?auto_80639 ?auto_80640 ) ) ( not ( = ?auto_80637 ?auto_80640 ) ) ( not ( = ?auto_80638 ?auto_80640 ) ) ( not ( = ?auto_80645 ?auto_80642 ) ) ( not ( = ?auto_80645 ?auto_80646 ) ) ( not ( = ?auto_80645 ?auto_80647 ) ) ( not ( = ?auto_80639 ?auto_80641 ) ) ( not ( = ?auto_80637 ?auto_80641 ) ) ( not ( = ?auto_80638 ?auto_80641 ) ) ( not ( = ?auto_80640 ?auto_80641 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80639 ?auto_80637 ?auto_80638 ?auto_80641 ?auto_80640 ?auto_80636 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80688 - OBJ
      ?auto_80689 - OBJ
      ?auto_80690 - OBJ
      ?auto_80691 - OBJ
      ?auto_80692 - OBJ
      ?auto_80687 - LOCATION
    )
    :vars
    (
      ?auto_80698 - LOCATION
      ?auto_80694 - CITY
      ?auto_80696 - LOCATION
      ?auto_80693 - LOCATION
      ?auto_80697 - LOCATION
      ?auto_80695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80698 ?auto_80694 ) ( IN-CITY ?auto_80687 ?auto_80694 ) ( not ( = ?auto_80687 ?auto_80698 ) ) ( OBJ-AT ?auto_80691 ?auto_80698 ) ( IN-CITY ?auto_80696 ?auto_80694 ) ( not ( = ?auto_80687 ?auto_80696 ) ) ( OBJ-AT ?auto_80692 ?auto_80696 ) ( IN-CITY ?auto_80693 ?auto_80694 ) ( not ( = ?auto_80687 ?auto_80693 ) ) ( OBJ-AT ?auto_80689 ?auto_80693 ) ( IN-CITY ?auto_80697 ?auto_80694 ) ( not ( = ?auto_80687 ?auto_80697 ) ) ( OBJ-AT ?auto_80688 ?auto_80697 ) ( OBJ-AT ?auto_80690 ?auto_80698 ) ( TRUCK-AT ?auto_80695 ?auto_80687 ) ( not ( = ?auto_80690 ?auto_80688 ) ) ( not ( = ?auto_80697 ?auto_80698 ) ) ( not ( = ?auto_80690 ?auto_80689 ) ) ( not ( = ?auto_80688 ?auto_80689 ) ) ( not ( = ?auto_80693 ?auto_80697 ) ) ( not ( = ?auto_80693 ?auto_80698 ) ) ( not ( = ?auto_80690 ?auto_80692 ) ) ( not ( = ?auto_80688 ?auto_80692 ) ) ( not ( = ?auto_80689 ?auto_80692 ) ) ( not ( = ?auto_80696 ?auto_80693 ) ) ( not ( = ?auto_80696 ?auto_80697 ) ) ( not ( = ?auto_80696 ?auto_80698 ) ) ( not ( = ?auto_80690 ?auto_80691 ) ) ( not ( = ?auto_80688 ?auto_80691 ) ) ( not ( = ?auto_80689 ?auto_80691 ) ) ( not ( = ?auto_80692 ?auto_80691 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80690 ?auto_80688 ?auto_80689 ?auto_80691 ?auto_80692 ?auto_80687 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80957 - OBJ
      ?auto_80958 - OBJ
      ?auto_80959 - OBJ
      ?auto_80960 - OBJ
      ?auto_80961 - OBJ
      ?auto_80956 - LOCATION
    )
    :vars
    (
      ?auto_80967 - LOCATION
      ?auto_80963 - CITY
      ?auto_80965 - LOCATION
      ?auto_80962 - LOCATION
      ?auto_80966 - LOCATION
      ?auto_80964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80967 ?auto_80963 ) ( IN-CITY ?auto_80956 ?auto_80963 ) ( not ( = ?auto_80956 ?auto_80967 ) ) ( OBJ-AT ?auto_80961 ?auto_80967 ) ( IN-CITY ?auto_80965 ?auto_80963 ) ( not ( = ?auto_80956 ?auto_80965 ) ) ( OBJ-AT ?auto_80959 ?auto_80965 ) ( IN-CITY ?auto_80962 ?auto_80963 ) ( not ( = ?auto_80956 ?auto_80962 ) ) ( OBJ-AT ?auto_80958 ?auto_80962 ) ( IN-CITY ?auto_80966 ?auto_80963 ) ( not ( = ?auto_80956 ?auto_80966 ) ) ( OBJ-AT ?auto_80957 ?auto_80966 ) ( OBJ-AT ?auto_80960 ?auto_80967 ) ( TRUCK-AT ?auto_80964 ?auto_80956 ) ( not ( = ?auto_80960 ?auto_80957 ) ) ( not ( = ?auto_80966 ?auto_80967 ) ) ( not ( = ?auto_80960 ?auto_80958 ) ) ( not ( = ?auto_80957 ?auto_80958 ) ) ( not ( = ?auto_80962 ?auto_80966 ) ) ( not ( = ?auto_80962 ?auto_80967 ) ) ( not ( = ?auto_80960 ?auto_80959 ) ) ( not ( = ?auto_80957 ?auto_80959 ) ) ( not ( = ?auto_80958 ?auto_80959 ) ) ( not ( = ?auto_80965 ?auto_80962 ) ) ( not ( = ?auto_80965 ?auto_80966 ) ) ( not ( = ?auto_80965 ?auto_80967 ) ) ( not ( = ?auto_80960 ?auto_80961 ) ) ( not ( = ?auto_80957 ?auto_80961 ) ) ( not ( = ?auto_80958 ?auto_80961 ) ) ( not ( = ?auto_80959 ?auto_80961 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80960 ?auto_80957 ?auto_80958 ?auto_80961 ?auto_80959 ?auto_80956 ) )
  )

)

