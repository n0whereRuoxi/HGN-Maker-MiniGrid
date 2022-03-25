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
      ?auto_102850 - OBJ
      ?auto_102849 - LOCATION
    )
    :vars
    (
      ?auto_102852 - LOCATION
      ?auto_102853 - CITY
      ?auto_102851 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102852 ?auto_102853 ) ( IN-CITY ?auto_102849 ?auto_102853 ) ( not ( = ?auto_102849 ?auto_102852 ) ) ( OBJ-AT ?auto_102850 ?auto_102852 ) ( TRUCK-AT ?auto_102851 ?auto_102849 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_102851 ?auto_102849 ?auto_102852 ?auto_102853 )
      ( !LOAD-TRUCK ?auto_102850 ?auto_102851 ?auto_102852 )
      ( !DRIVE-TRUCK ?auto_102851 ?auto_102852 ?auto_102849 ?auto_102853 )
      ( !UNLOAD-TRUCK ?auto_102850 ?auto_102851 ?auto_102849 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_102871 - OBJ
      ?auto_102872 - OBJ
      ?auto_102870 - LOCATION
    )
    :vars
    (
      ?auto_102873 - LOCATION
      ?auto_102875 - CITY
      ?auto_102876 - LOCATION
      ?auto_102874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102873 ?auto_102875 ) ( IN-CITY ?auto_102870 ?auto_102875 ) ( not ( = ?auto_102870 ?auto_102873 ) ) ( OBJ-AT ?auto_102872 ?auto_102873 ) ( IN-CITY ?auto_102876 ?auto_102875 ) ( not ( = ?auto_102870 ?auto_102876 ) ) ( OBJ-AT ?auto_102871 ?auto_102876 ) ( TRUCK-AT ?auto_102874 ?auto_102870 ) ( not ( = ?auto_102871 ?auto_102872 ) ) ( not ( = ?auto_102873 ?auto_102876 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_102871 ?auto_102870 )
      ( DELIVER-1PKG ?auto_102872 ?auto_102870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102981 - OBJ
      ?auto_102982 - OBJ
      ?auto_102983 - OBJ
      ?auto_102980 - LOCATION
    )
    :vars
    (
      ?auto_102984 - LOCATION
      ?auto_102986 - CITY
      ?auto_102987 - LOCATION
      ?auto_102985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102984 ?auto_102986 ) ( IN-CITY ?auto_102980 ?auto_102986 ) ( not ( = ?auto_102980 ?auto_102984 ) ) ( OBJ-AT ?auto_102983 ?auto_102984 ) ( OBJ-AT ?auto_102982 ?auto_102984 ) ( IN-CITY ?auto_102987 ?auto_102986 ) ( not ( = ?auto_102980 ?auto_102987 ) ) ( OBJ-AT ?auto_102981 ?auto_102987 ) ( TRUCK-AT ?auto_102985 ?auto_102980 ) ( not ( = ?auto_102981 ?auto_102982 ) ) ( not ( = ?auto_102984 ?auto_102987 ) ) ( not ( = ?auto_102981 ?auto_102983 ) ) ( not ( = ?auto_102982 ?auto_102983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102981 ?auto_102982 ?auto_102980 )
      ( DELIVER-1PKG ?auto_102983 ?auto_102980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103011 - OBJ
      ?auto_103012 - OBJ
      ?auto_103013 - OBJ
      ?auto_103010 - LOCATION
    )
    :vars
    (
      ?auto_103017 - LOCATION
      ?auto_103014 - CITY
      ?auto_103016 - LOCATION
      ?auto_103015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103017 ?auto_103014 ) ( IN-CITY ?auto_103010 ?auto_103014 ) ( not ( = ?auto_103010 ?auto_103017 ) ) ( OBJ-AT ?auto_103013 ?auto_103017 ) ( OBJ-AT ?auto_103011 ?auto_103017 ) ( IN-CITY ?auto_103016 ?auto_103014 ) ( not ( = ?auto_103010 ?auto_103016 ) ) ( OBJ-AT ?auto_103012 ?auto_103016 ) ( TRUCK-AT ?auto_103015 ?auto_103010 ) ( not ( = ?auto_103012 ?auto_103011 ) ) ( not ( = ?auto_103017 ?auto_103016 ) ) ( not ( = ?auto_103012 ?auto_103013 ) ) ( not ( = ?auto_103011 ?auto_103013 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103012 ?auto_103011 ?auto_103013 ?auto_103010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_103028 - OBJ
      ?auto_103029 - OBJ
      ?auto_103030 - OBJ
      ?auto_103027 - LOCATION
    )
    :vars
    (
      ?auto_103034 - LOCATION
      ?auto_103033 - CITY
      ?auto_103032 - LOCATION
      ?auto_103031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_103034 ?auto_103033 ) ( IN-CITY ?auto_103027 ?auto_103033 ) ( not ( = ?auto_103027 ?auto_103034 ) ) ( OBJ-AT ?auto_103029 ?auto_103034 ) ( OBJ-AT ?auto_103028 ?auto_103034 ) ( IN-CITY ?auto_103032 ?auto_103033 ) ( not ( = ?auto_103027 ?auto_103032 ) ) ( OBJ-AT ?auto_103030 ?auto_103032 ) ( TRUCK-AT ?auto_103031 ?auto_103027 ) ( not ( = ?auto_103030 ?auto_103028 ) ) ( not ( = ?auto_103034 ?auto_103032 ) ) ( not ( = ?auto_103030 ?auto_103029 ) ) ( not ( = ?auto_103028 ?auto_103029 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_103028 ?auto_103030 ?auto_103029 ?auto_103027 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104110 - OBJ
      ?auto_104111 - OBJ
      ?auto_104112 - OBJ
      ?auto_104113 - OBJ
      ?auto_104109 - LOCATION
    )
    :vars
    (
      ?auto_104115 - LOCATION
      ?auto_104114 - CITY
      ?auto_104118 - LOCATION
      ?auto_104117 - LOCATION
      ?auto_104116 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104115 ?auto_104114 ) ( IN-CITY ?auto_104109 ?auto_104114 ) ( not ( = ?auto_104109 ?auto_104115 ) ) ( OBJ-AT ?auto_104113 ?auto_104115 ) ( IN-CITY ?auto_104118 ?auto_104114 ) ( not ( = ?auto_104109 ?auto_104118 ) ) ( OBJ-AT ?auto_104112 ?auto_104118 ) ( OBJ-AT ?auto_104111 ?auto_104118 ) ( IN-CITY ?auto_104117 ?auto_104114 ) ( not ( = ?auto_104109 ?auto_104117 ) ) ( OBJ-AT ?auto_104110 ?auto_104117 ) ( TRUCK-AT ?auto_104116 ?auto_104109 ) ( not ( = ?auto_104110 ?auto_104111 ) ) ( not ( = ?auto_104118 ?auto_104117 ) ) ( not ( = ?auto_104110 ?auto_104112 ) ) ( not ( = ?auto_104111 ?auto_104112 ) ) ( not ( = ?auto_104110 ?auto_104113 ) ) ( not ( = ?auto_104111 ?auto_104113 ) ) ( not ( = ?auto_104112 ?auto_104113 ) ) ( not ( = ?auto_104115 ?auto_104118 ) ) ( not ( = ?auto_104115 ?auto_104117 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104111 ?auto_104110 ?auto_104112 ?auto_104109 )
      ( DELIVER-1PKG ?auto_104113 ?auto_104109 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104142 - OBJ
      ?auto_104143 - OBJ
      ?auto_104144 - OBJ
      ?auto_104145 - OBJ
      ?auto_104141 - LOCATION
    )
    :vars
    (
      ?auto_104147 - LOCATION
      ?auto_104149 - CITY
      ?auto_104148 - LOCATION
      ?auto_104146 - LOCATION
      ?auto_104150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104147 ?auto_104149 ) ( IN-CITY ?auto_104141 ?auto_104149 ) ( not ( = ?auto_104141 ?auto_104147 ) ) ( OBJ-AT ?auto_104144 ?auto_104147 ) ( IN-CITY ?auto_104148 ?auto_104149 ) ( not ( = ?auto_104141 ?auto_104148 ) ) ( OBJ-AT ?auto_104145 ?auto_104148 ) ( OBJ-AT ?auto_104143 ?auto_104148 ) ( IN-CITY ?auto_104146 ?auto_104149 ) ( not ( = ?auto_104141 ?auto_104146 ) ) ( OBJ-AT ?auto_104142 ?auto_104146 ) ( TRUCK-AT ?auto_104150 ?auto_104141 ) ( not ( = ?auto_104142 ?auto_104143 ) ) ( not ( = ?auto_104148 ?auto_104146 ) ) ( not ( = ?auto_104142 ?auto_104145 ) ) ( not ( = ?auto_104143 ?auto_104145 ) ) ( not ( = ?auto_104142 ?auto_104144 ) ) ( not ( = ?auto_104143 ?auto_104144 ) ) ( not ( = ?auto_104145 ?auto_104144 ) ) ( not ( = ?auto_104147 ?auto_104148 ) ) ( not ( = ?auto_104147 ?auto_104146 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104142 ?auto_104143 ?auto_104145 ?auto_104144 ?auto_104141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104296 - OBJ
      ?auto_104297 - OBJ
      ?auto_104298 - OBJ
      ?auto_104299 - OBJ
      ?auto_104295 - LOCATION
    )
    :vars
    (
      ?auto_104302 - LOCATION
      ?auto_104303 - CITY
      ?auto_104304 - LOCATION
      ?auto_104300 - LOCATION
      ?auto_104301 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104302 ?auto_104303 ) ( IN-CITY ?auto_104295 ?auto_104303 ) ( not ( = ?auto_104295 ?auto_104302 ) ) ( OBJ-AT ?auto_104297 ?auto_104302 ) ( IN-CITY ?auto_104304 ?auto_104303 ) ( not ( = ?auto_104295 ?auto_104304 ) ) ( OBJ-AT ?auto_104299 ?auto_104304 ) ( OBJ-AT ?auto_104298 ?auto_104304 ) ( IN-CITY ?auto_104300 ?auto_104303 ) ( not ( = ?auto_104295 ?auto_104300 ) ) ( OBJ-AT ?auto_104296 ?auto_104300 ) ( TRUCK-AT ?auto_104301 ?auto_104295 ) ( not ( = ?auto_104296 ?auto_104298 ) ) ( not ( = ?auto_104304 ?auto_104300 ) ) ( not ( = ?auto_104296 ?auto_104299 ) ) ( not ( = ?auto_104298 ?auto_104299 ) ) ( not ( = ?auto_104296 ?auto_104297 ) ) ( not ( = ?auto_104298 ?auto_104297 ) ) ( not ( = ?auto_104299 ?auto_104297 ) ) ( not ( = ?auto_104302 ?auto_104304 ) ) ( not ( = ?auto_104302 ?auto_104300 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104296 ?auto_104298 ?auto_104297 ?auto_104299 ?auto_104295 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104423 - OBJ
      ?auto_104424 - OBJ
      ?auto_104425 - OBJ
      ?auto_104426 - OBJ
      ?auto_104422 - LOCATION
    )
    :vars
    (
      ?auto_104429 - LOCATION
      ?auto_104430 - CITY
      ?auto_104431 - LOCATION
      ?auto_104427 - LOCATION
      ?auto_104428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104429 ?auto_104430 ) ( IN-CITY ?auto_104422 ?auto_104430 ) ( not ( = ?auto_104422 ?auto_104429 ) ) ( OBJ-AT ?auto_104426 ?auto_104429 ) ( IN-CITY ?auto_104431 ?auto_104430 ) ( not ( = ?auto_104422 ?auto_104431 ) ) ( OBJ-AT ?auto_104425 ?auto_104431 ) ( OBJ-AT ?auto_104423 ?auto_104431 ) ( IN-CITY ?auto_104427 ?auto_104430 ) ( not ( = ?auto_104422 ?auto_104427 ) ) ( OBJ-AT ?auto_104424 ?auto_104427 ) ( TRUCK-AT ?auto_104428 ?auto_104422 ) ( not ( = ?auto_104424 ?auto_104423 ) ) ( not ( = ?auto_104431 ?auto_104427 ) ) ( not ( = ?auto_104424 ?auto_104425 ) ) ( not ( = ?auto_104423 ?auto_104425 ) ) ( not ( = ?auto_104424 ?auto_104426 ) ) ( not ( = ?auto_104423 ?auto_104426 ) ) ( not ( = ?auto_104425 ?auto_104426 ) ) ( not ( = ?auto_104429 ?auto_104431 ) ) ( not ( = ?auto_104429 ?auto_104427 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104424 ?auto_104423 ?auto_104426 ?auto_104425 ?auto_104422 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104455 - OBJ
      ?auto_104456 - OBJ
      ?auto_104457 - OBJ
      ?auto_104458 - OBJ
      ?auto_104454 - LOCATION
    )
    :vars
    (
      ?auto_104461 - LOCATION
      ?auto_104462 - CITY
      ?auto_104463 - LOCATION
      ?auto_104459 - LOCATION
      ?auto_104460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104461 ?auto_104462 ) ( IN-CITY ?auto_104454 ?auto_104462 ) ( not ( = ?auto_104454 ?auto_104461 ) ) ( OBJ-AT ?auto_104457 ?auto_104461 ) ( IN-CITY ?auto_104463 ?auto_104462 ) ( not ( = ?auto_104454 ?auto_104463 ) ) ( OBJ-AT ?auto_104458 ?auto_104463 ) ( OBJ-AT ?auto_104455 ?auto_104463 ) ( IN-CITY ?auto_104459 ?auto_104462 ) ( not ( = ?auto_104454 ?auto_104459 ) ) ( OBJ-AT ?auto_104456 ?auto_104459 ) ( TRUCK-AT ?auto_104460 ?auto_104454 ) ( not ( = ?auto_104456 ?auto_104455 ) ) ( not ( = ?auto_104463 ?auto_104459 ) ) ( not ( = ?auto_104456 ?auto_104458 ) ) ( not ( = ?auto_104455 ?auto_104458 ) ) ( not ( = ?auto_104456 ?auto_104457 ) ) ( not ( = ?auto_104455 ?auto_104457 ) ) ( not ( = ?auto_104458 ?auto_104457 ) ) ( not ( = ?auto_104461 ?auto_104463 ) ) ( not ( = ?auto_104461 ?auto_104459 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104456 ?auto_104455 ?auto_104457 ?auto_104458 ?auto_104454 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_104556 - OBJ
      ?auto_104557 - OBJ
      ?auto_104558 - OBJ
      ?auto_104559 - OBJ
      ?auto_104555 - LOCATION
    )
    :vars
    (
      ?auto_104562 - LOCATION
      ?auto_104563 - CITY
      ?auto_104564 - LOCATION
      ?auto_104560 - LOCATION
      ?auto_104561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104562 ?auto_104563 ) ( IN-CITY ?auto_104555 ?auto_104563 ) ( not ( = ?auto_104555 ?auto_104562 ) ) ( OBJ-AT ?auto_104559 ?auto_104562 ) ( IN-CITY ?auto_104564 ?auto_104563 ) ( not ( = ?auto_104555 ?auto_104564 ) ) ( OBJ-AT ?auto_104557 ?auto_104564 ) ( OBJ-AT ?auto_104556 ?auto_104564 ) ( IN-CITY ?auto_104560 ?auto_104563 ) ( not ( = ?auto_104555 ?auto_104560 ) ) ( OBJ-AT ?auto_104558 ?auto_104560 ) ( TRUCK-AT ?auto_104561 ?auto_104555 ) ( not ( = ?auto_104558 ?auto_104556 ) ) ( not ( = ?auto_104564 ?auto_104560 ) ) ( not ( = ?auto_104558 ?auto_104557 ) ) ( not ( = ?auto_104556 ?auto_104557 ) ) ( not ( = ?auto_104558 ?auto_104559 ) ) ( not ( = ?auto_104556 ?auto_104559 ) ) ( not ( = ?auto_104557 ?auto_104559 ) ) ( not ( = ?auto_104562 ?auto_104564 ) ) ( not ( = ?auto_104562 ?auto_104560 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_104558 ?auto_104556 ?auto_104559 ?auto_104557 ?auto_104555 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_119520 - OBJ
      ?auto_119521 - OBJ
      ?auto_119522 - OBJ
      ?auto_119523 - OBJ
      ?auto_119524 - OBJ
      ?auto_119519 - LOCATION
    )
    :vars
    (
      ?auto_119526 - LOCATION
      ?auto_119525 - CITY
      ?auto_119529 - LOCATION
      ?auto_119528 - LOCATION
      ?auto_119527 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_119526 ?auto_119525 ) ( IN-CITY ?auto_119519 ?auto_119525 ) ( not ( = ?auto_119519 ?auto_119526 ) ) ( OBJ-AT ?auto_119524 ?auto_119526 ) ( OBJ-AT ?auto_119523 ?auto_119526 ) ( IN-CITY ?auto_119529 ?auto_119525 ) ( not ( = ?auto_119519 ?auto_119529 ) ) ( OBJ-AT ?auto_119522 ?auto_119529 ) ( OBJ-AT ?auto_119521 ?auto_119529 ) ( IN-CITY ?auto_119528 ?auto_119525 ) ( not ( = ?auto_119519 ?auto_119528 ) ) ( OBJ-AT ?auto_119520 ?auto_119528 ) ( TRUCK-AT ?auto_119527 ?auto_119519 ) ( not ( = ?auto_119520 ?auto_119521 ) ) ( not ( = ?auto_119529 ?auto_119528 ) ) ( not ( = ?auto_119520 ?auto_119522 ) ) ( not ( = ?auto_119521 ?auto_119522 ) ) ( not ( = ?auto_119520 ?auto_119523 ) ) ( not ( = ?auto_119521 ?auto_119523 ) ) ( not ( = ?auto_119522 ?auto_119523 ) ) ( not ( = ?auto_119526 ?auto_119529 ) ) ( not ( = ?auto_119526 ?auto_119528 ) ) ( not ( = ?auto_119520 ?auto_119524 ) ) ( not ( = ?auto_119521 ?auto_119524 ) ) ( not ( = ?auto_119522 ?auto_119524 ) ) ( not ( = ?auto_119523 ?auto_119524 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_119520 ?auto_119521 ?auto_119523 ?auto_119522 ?auto_119519 )
      ( DELIVER-1PKG ?auto_119524 ?auto_119519 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_119609 - OBJ
      ?auto_119610 - OBJ
      ?auto_119611 - OBJ
      ?auto_119612 - OBJ
      ?auto_119613 - OBJ
      ?auto_119608 - LOCATION
    )
    :vars
    (
      ?auto_119617 - LOCATION
      ?auto_119615 - CITY
      ?auto_119616 - LOCATION
      ?auto_119618 - LOCATION
      ?auto_119614 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_119617 ?auto_119615 ) ( IN-CITY ?auto_119608 ?auto_119615 ) ( not ( = ?auto_119608 ?auto_119617 ) ) ( OBJ-AT ?auto_119613 ?auto_119617 ) ( OBJ-AT ?auto_119611 ?auto_119617 ) ( IN-CITY ?auto_119616 ?auto_119615 ) ( not ( = ?auto_119608 ?auto_119616 ) ) ( OBJ-AT ?auto_119612 ?auto_119616 ) ( OBJ-AT ?auto_119610 ?auto_119616 ) ( IN-CITY ?auto_119618 ?auto_119615 ) ( not ( = ?auto_119608 ?auto_119618 ) ) ( OBJ-AT ?auto_119609 ?auto_119618 ) ( TRUCK-AT ?auto_119614 ?auto_119608 ) ( not ( = ?auto_119609 ?auto_119610 ) ) ( not ( = ?auto_119616 ?auto_119618 ) ) ( not ( = ?auto_119609 ?auto_119612 ) ) ( not ( = ?auto_119610 ?auto_119612 ) ) ( not ( = ?auto_119609 ?auto_119611 ) ) ( not ( = ?auto_119610 ?auto_119611 ) ) ( not ( = ?auto_119612 ?auto_119611 ) ) ( not ( = ?auto_119617 ?auto_119616 ) ) ( not ( = ?auto_119617 ?auto_119618 ) ) ( not ( = ?auto_119609 ?auto_119613 ) ) ( not ( = ?auto_119610 ?auto_119613 ) ) ( not ( = ?auto_119612 ?auto_119613 ) ) ( not ( = ?auto_119611 ?auto_119613 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_119609 ?auto_119610 ?auto_119612 ?auto_119611 ?auto_119613 ?auto_119608 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_119656 - OBJ
      ?auto_119657 - OBJ
      ?auto_119658 - OBJ
      ?auto_119659 - OBJ
      ?auto_119660 - OBJ
      ?auto_119655 - LOCATION
    )
    :vars
    (
      ?auto_119661 - LOCATION
      ?auto_119662 - CITY
      ?auto_119664 - LOCATION
      ?auto_119663 - LOCATION
      ?auto_119665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_119661 ?auto_119662 ) ( IN-CITY ?auto_119655 ?auto_119662 ) ( not ( = ?auto_119655 ?auto_119661 ) ) ( OBJ-AT ?auto_119659 ?auto_119661 ) ( OBJ-AT ?auto_119658 ?auto_119661 ) ( IN-CITY ?auto_119664 ?auto_119662 ) ( not ( = ?auto_119655 ?auto_119664 ) ) ( OBJ-AT ?auto_119660 ?auto_119664 ) ( OBJ-AT ?auto_119657 ?auto_119664 ) ( IN-CITY ?auto_119663 ?auto_119662 ) ( not ( = ?auto_119655 ?auto_119663 ) ) ( OBJ-AT ?auto_119656 ?auto_119663 ) ( TRUCK-AT ?auto_119665 ?auto_119655 ) ( not ( = ?auto_119656 ?auto_119657 ) ) ( not ( = ?auto_119664 ?auto_119663 ) ) ( not ( = ?auto_119656 ?auto_119660 ) ) ( not ( = ?auto_119657 ?auto_119660 ) ) ( not ( = ?auto_119656 ?auto_119658 ) ) ( not ( = ?auto_119657 ?auto_119658 ) ) ( not ( = ?auto_119660 ?auto_119658 ) ) ( not ( = ?auto_119661 ?auto_119664 ) ) ( not ( = ?auto_119661 ?auto_119663 ) ) ( not ( = ?auto_119656 ?auto_119659 ) ) ( not ( = ?auto_119657 ?auto_119659 ) ) ( not ( = ?auto_119660 ?auto_119659 ) ) ( not ( = ?auto_119658 ?auto_119659 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_119656 ?auto_119657 ?auto_119658 ?auto_119660 ?auto_119659 ?auto_119655 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123217 - OBJ
      ?auto_123218 - OBJ
      ?auto_123219 - OBJ
      ?auto_123220 - OBJ
      ?auto_123221 - OBJ
      ?auto_123216 - LOCATION
    )
    :vars
    (
      ?auto_123222 - LOCATION
      ?auto_123223 - CITY
      ?auto_123225 - LOCATION
      ?auto_123224 - LOCATION
      ?auto_123226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123222 ?auto_123223 ) ( IN-CITY ?auto_123216 ?auto_123223 ) ( not ( = ?auto_123216 ?auto_123222 ) ) ( OBJ-AT ?auto_123221 ?auto_123222 ) ( OBJ-AT ?auto_123220 ?auto_123222 ) ( IN-CITY ?auto_123225 ?auto_123223 ) ( not ( = ?auto_123216 ?auto_123225 ) ) ( OBJ-AT ?auto_123219 ?auto_123225 ) ( OBJ-AT ?auto_123217 ?auto_123225 ) ( IN-CITY ?auto_123224 ?auto_123223 ) ( not ( = ?auto_123216 ?auto_123224 ) ) ( OBJ-AT ?auto_123218 ?auto_123224 ) ( TRUCK-AT ?auto_123226 ?auto_123216 ) ( not ( = ?auto_123218 ?auto_123217 ) ) ( not ( = ?auto_123225 ?auto_123224 ) ) ( not ( = ?auto_123218 ?auto_123219 ) ) ( not ( = ?auto_123217 ?auto_123219 ) ) ( not ( = ?auto_123218 ?auto_123220 ) ) ( not ( = ?auto_123217 ?auto_123220 ) ) ( not ( = ?auto_123219 ?auto_123220 ) ) ( not ( = ?auto_123222 ?auto_123225 ) ) ( not ( = ?auto_123222 ?auto_123224 ) ) ( not ( = ?auto_123218 ?auto_123221 ) ) ( not ( = ?auto_123217 ?auto_123221 ) ) ( not ( = ?auto_123219 ?auto_123221 ) ) ( not ( = ?auto_123220 ?auto_123221 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123218 ?auto_123217 ?auto_123220 ?auto_123219 ?auto_123221 ?auto_123216 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123306 - OBJ
      ?auto_123307 - OBJ
      ?auto_123308 - OBJ
      ?auto_123309 - OBJ
      ?auto_123310 - OBJ
      ?auto_123305 - LOCATION
    )
    :vars
    (
      ?auto_123311 - LOCATION
      ?auto_123312 - CITY
      ?auto_123314 - LOCATION
      ?auto_123313 - LOCATION
      ?auto_123315 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123311 ?auto_123312 ) ( IN-CITY ?auto_123305 ?auto_123312 ) ( not ( = ?auto_123305 ?auto_123311 ) ) ( OBJ-AT ?auto_123310 ?auto_123311 ) ( OBJ-AT ?auto_123308 ?auto_123311 ) ( IN-CITY ?auto_123314 ?auto_123312 ) ( not ( = ?auto_123305 ?auto_123314 ) ) ( OBJ-AT ?auto_123309 ?auto_123314 ) ( OBJ-AT ?auto_123306 ?auto_123314 ) ( IN-CITY ?auto_123313 ?auto_123312 ) ( not ( = ?auto_123305 ?auto_123313 ) ) ( OBJ-AT ?auto_123307 ?auto_123313 ) ( TRUCK-AT ?auto_123315 ?auto_123305 ) ( not ( = ?auto_123307 ?auto_123306 ) ) ( not ( = ?auto_123314 ?auto_123313 ) ) ( not ( = ?auto_123307 ?auto_123309 ) ) ( not ( = ?auto_123306 ?auto_123309 ) ) ( not ( = ?auto_123307 ?auto_123308 ) ) ( not ( = ?auto_123306 ?auto_123308 ) ) ( not ( = ?auto_123309 ?auto_123308 ) ) ( not ( = ?auto_123311 ?auto_123314 ) ) ( not ( = ?auto_123311 ?auto_123313 ) ) ( not ( = ?auto_123307 ?auto_123310 ) ) ( not ( = ?auto_123306 ?auto_123310 ) ) ( not ( = ?auto_123309 ?auto_123310 ) ) ( not ( = ?auto_123308 ?auto_123310 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123307 ?auto_123306 ?auto_123308 ?auto_123309 ?auto_123310 ?auto_123305 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123353 - OBJ
      ?auto_123354 - OBJ
      ?auto_123355 - OBJ
      ?auto_123356 - OBJ
      ?auto_123357 - OBJ
      ?auto_123352 - LOCATION
    )
    :vars
    (
      ?auto_123358 - LOCATION
      ?auto_123359 - CITY
      ?auto_123361 - LOCATION
      ?auto_123360 - LOCATION
      ?auto_123362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123358 ?auto_123359 ) ( IN-CITY ?auto_123352 ?auto_123359 ) ( not ( = ?auto_123352 ?auto_123358 ) ) ( OBJ-AT ?auto_123356 ?auto_123358 ) ( OBJ-AT ?auto_123355 ?auto_123358 ) ( IN-CITY ?auto_123361 ?auto_123359 ) ( not ( = ?auto_123352 ?auto_123361 ) ) ( OBJ-AT ?auto_123357 ?auto_123361 ) ( OBJ-AT ?auto_123353 ?auto_123361 ) ( IN-CITY ?auto_123360 ?auto_123359 ) ( not ( = ?auto_123352 ?auto_123360 ) ) ( OBJ-AT ?auto_123354 ?auto_123360 ) ( TRUCK-AT ?auto_123362 ?auto_123352 ) ( not ( = ?auto_123354 ?auto_123353 ) ) ( not ( = ?auto_123361 ?auto_123360 ) ) ( not ( = ?auto_123354 ?auto_123357 ) ) ( not ( = ?auto_123353 ?auto_123357 ) ) ( not ( = ?auto_123354 ?auto_123355 ) ) ( not ( = ?auto_123353 ?auto_123355 ) ) ( not ( = ?auto_123357 ?auto_123355 ) ) ( not ( = ?auto_123358 ?auto_123361 ) ) ( not ( = ?auto_123358 ?auto_123360 ) ) ( not ( = ?auto_123354 ?auto_123356 ) ) ( not ( = ?auto_123353 ?auto_123356 ) ) ( not ( = ?auto_123357 ?auto_123356 ) ) ( not ( = ?auto_123355 ?auto_123356 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123354 ?auto_123353 ?auto_123355 ?auto_123357 ?auto_123356 ?auto_123352 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124503 - OBJ
      ?auto_124504 - OBJ
      ?auto_124505 - OBJ
      ?auto_124506 - OBJ
      ?auto_124507 - OBJ
      ?auto_124502 - LOCATION
    )
    :vars
    (
      ?auto_124508 - LOCATION
      ?auto_124509 - CITY
      ?auto_124511 - LOCATION
      ?auto_124510 - LOCATION
      ?auto_124512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124508 ?auto_124509 ) ( IN-CITY ?auto_124502 ?auto_124509 ) ( not ( = ?auto_124502 ?auto_124508 ) ) ( OBJ-AT ?auto_124507 ?auto_124508 ) ( OBJ-AT ?auto_124506 ?auto_124508 ) ( IN-CITY ?auto_124511 ?auto_124509 ) ( not ( = ?auto_124502 ?auto_124511 ) ) ( OBJ-AT ?auto_124504 ?auto_124511 ) ( OBJ-AT ?auto_124503 ?auto_124511 ) ( IN-CITY ?auto_124510 ?auto_124509 ) ( not ( = ?auto_124502 ?auto_124510 ) ) ( OBJ-AT ?auto_124505 ?auto_124510 ) ( TRUCK-AT ?auto_124512 ?auto_124502 ) ( not ( = ?auto_124505 ?auto_124503 ) ) ( not ( = ?auto_124511 ?auto_124510 ) ) ( not ( = ?auto_124505 ?auto_124504 ) ) ( not ( = ?auto_124503 ?auto_124504 ) ) ( not ( = ?auto_124505 ?auto_124506 ) ) ( not ( = ?auto_124503 ?auto_124506 ) ) ( not ( = ?auto_124504 ?auto_124506 ) ) ( not ( = ?auto_124508 ?auto_124511 ) ) ( not ( = ?auto_124508 ?auto_124510 ) ) ( not ( = ?auto_124505 ?auto_124507 ) ) ( not ( = ?auto_124503 ?auto_124507 ) ) ( not ( = ?auto_124504 ?auto_124507 ) ) ( not ( = ?auto_124506 ?auto_124507 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124505 ?auto_124503 ?auto_124506 ?auto_124504 ?auto_124507 ?auto_124502 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124794 - OBJ
      ?auto_124795 - OBJ
      ?auto_124796 - OBJ
      ?auto_124797 - OBJ
      ?auto_124798 - OBJ
      ?auto_124793 - LOCATION
    )
    :vars
    (
      ?auto_124799 - LOCATION
      ?auto_124800 - CITY
      ?auto_124802 - LOCATION
      ?auto_124801 - LOCATION
      ?auto_124803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124799 ?auto_124800 ) ( IN-CITY ?auto_124793 ?auto_124800 ) ( not ( = ?auto_124793 ?auto_124799 ) ) ( OBJ-AT ?auto_124798 ?auto_124799 ) ( OBJ-AT ?auto_124796 ?auto_124799 ) ( IN-CITY ?auto_124802 ?auto_124800 ) ( not ( = ?auto_124793 ?auto_124802 ) ) ( OBJ-AT ?auto_124795 ?auto_124802 ) ( OBJ-AT ?auto_124794 ?auto_124802 ) ( IN-CITY ?auto_124801 ?auto_124800 ) ( not ( = ?auto_124793 ?auto_124801 ) ) ( OBJ-AT ?auto_124797 ?auto_124801 ) ( TRUCK-AT ?auto_124803 ?auto_124793 ) ( not ( = ?auto_124797 ?auto_124794 ) ) ( not ( = ?auto_124802 ?auto_124801 ) ) ( not ( = ?auto_124797 ?auto_124795 ) ) ( not ( = ?auto_124794 ?auto_124795 ) ) ( not ( = ?auto_124797 ?auto_124796 ) ) ( not ( = ?auto_124794 ?auto_124796 ) ) ( not ( = ?auto_124795 ?auto_124796 ) ) ( not ( = ?auto_124799 ?auto_124802 ) ) ( not ( = ?auto_124799 ?auto_124801 ) ) ( not ( = ?auto_124797 ?auto_124798 ) ) ( not ( = ?auto_124794 ?auto_124798 ) ) ( not ( = ?auto_124795 ?auto_124798 ) ) ( not ( = ?auto_124796 ?auto_124798 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124797 ?auto_124794 ?auto_124796 ?auto_124795 ?auto_124798 ?auto_124793 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124841 - OBJ
      ?auto_124842 - OBJ
      ?auto_124843 - OBJ
      ?auto_124844 - OBJ
      ?auto_124845 - OBJ
      ?auto_124840 - LOCATION
    )
    :vars
    (
      ?auto_124846 - LOCATION
      ?auto_124847 - CITY
      ?auto_124849 - LOCATION
      ?auto_124848 - LOCATION
      ?auto_124850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124846 ?auto_124847 ) ( IN-CITY ?auto_124840 ?auto_124847 ) ( not ( = ?auto_124840 ?auto_124846 ) ) ( OBJ-AT ?auto_124844 ?auto_124846 ) ( OBJ-AT ?auto_124843 ?auto_124846 ) ( IN-CITY ?auto_124849 ?auto_124847 ) ( not ( = ?auto_124840 ?auto_124849 ) ) ( OBJ-AT ?auto_124842 ?auto_124849 ) ( OBJ-AT ?auto_124841 ?auto_124849 ) ( IN-CITY ?auto_124848 ?auto_124847 ) ( not ( = ?auto_124840 ?auto_124848 ) ) ( OBJ-AT ?auto_124845 ?auto_124848 ) ( TRUCK-AT ?auto_124850 ?auto_124840 ) ( not ( = ?auto_124845 ?auto_124841 ) ) ( not ( = ?auto_124849 ?auto_124848 ) ) ( not ( = ?auto_124845 ?auto_124842 ) ) ( not ( = ?auto_124841 ?auto_124842 ) ) ( not ( = ?auto_124845 ?auto_124843 ) ) ( not ( = ?auto_124841 ?auto_124843 ) ) ( not ( = ?auto_124842 ?auto_124843 ) ) ( not ( = ?auto_124846 ?auto_124849 ) ) ( not ( = ?auto_124846 ?auto_124848 ) ) ( not ( = ?auto_124845 ?auto_124844 ) ) ( not ( = ?auto_124841 ?auto_124844 ) ) ( not ( = ?auto_124842 ?auto_124844 ) ) ( not ( = ?auto_124843 ?auto_124844 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124845 ?auto_124841 ?auto_124843 ?auto_124842 ?auto_124844 ?auto_124840 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125221 - OBJ
      ?auto_125222 - OBJ
      ?auto_125223 - OBJ
      ?auto_125224 - OBJ
      ?auto_125225 - OBJ
      ?auto_125220 - LOCATION
    )
    :vars
    (
      ?auto_125226 - LOCATION
      ?auto_125227 - CITY
      ?auto_125229 - LOCATION
      ?auto_125228 - LOCATION
      ?auto_125230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125226 ?auto_125227 ) ( IN-CITY ?auto_125220 ?auto_125227 ) ( not ( = ?auto_125220 ?auto_125226 ) ) ( OBJ-AT ?auto_125225 ?auto_125226 ) ( OBJ-AT ?auto_125222 ?auto_125226 ) ( IN-CITY ?auto_125229 ?auto_125227 ) ( not ( = ?auto_125220 ?auto_125229 ) ) ( OBJ-AT ?auto_125224 ?auto_125229 ) ( OBJ-AT ?auto_125221 ?auto_125229 ) ( IN-CITY ?auto_125228 ?auto_125227 ) ( not ( = ?auto_125220 ?auto_125228 ) ) ( OBJ-AT ?auto_125223 ?auto_125228 ) ( TRUCK-AT ?auto_125230 ?auto_125220 ) ( not ( = ?auto_125223 ?auto_125221 ) ) ( not ( = ?auto_125229 ?auto_125228 ) ) ( not ( = ?auto_125223 ?auto_125224 ) ) ( not ( = ?auto_125221 ?auto_125224 ) ) ( not ( = ?auto_125223 ?auto_125222 ) ) ( not ( = ?auto_125221 ?auto_125222 ) ) ( not ( = ?auto_125224 ?auto_125222 ) ) ( not ( = ?auto_125226 ?auto_125229 ) ) ( not ( = ?auto_125226 ?auto_125228 ) ) ( not ( = ?auto_125223 ?auto_125225 ) ) ( not ( = ?auto_125221 ?auto_125225 ) ) ( not ( = ?auto_125224 ?auto_125225 ) ) ( not ( = ?auto_125222 ?auto_125225 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125223 ?auto_125221 ?auto_125222 ?auto_125224 ?auto_125225 ?auto_125220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125268 - OBJ
      ?auto_125269 - OBJ
      ?auto_125270 - OBJ
      ?auto_125271 - OBJ
      ?auto_125272 - OBJ
      ?auto_125267 - LOCATION
    )
    :vars
    (
      ?auto_125273 - LOCATION
      ?auto_125274 - CITY
      ?auto_125276 - LOCATION
      ?auto_125275 - LOCATION
      ?auto_125277 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125273 ?auto_125274 ) ( IN-CITY ?auto_125267 ?auto_125274 ) ( not ( = ?auto_125267 ?auto_125273 ) ) ( OBJ-AT ?auto_125271 ?auto_125273 ) ( OBJ-AT ?auto_125269 ?auto_125273 ) ( IN-CITY ?auto_125276 ?auto_125274 ) ( not ( = ?auto_125267 ?auto_125276 ) ) ( OBJ-AT ?auto_125272 ?auto_125276 ) ( OBJ-AT ?auto_125268 ?auto_125276 ) ( IN-CITY ?auto_125275 ?auto_125274 ) ( not ( = ?auto_125267 ?auto_125275 ) ) ( OBJ-AT ?auto_125270 ?auto_125275 ) ( TRUCK-AT ?auto_125277 ?auto_125267 ) ( not ( = ?auto_125270 ?auto_125268 ) ) ( not ( = ?auto_125276 ?auto_125275 ) ) ( not ( = ?auto_125270 ?auto_125272 ) ) ( not ( = ?auto_125268 ?auto_125272 ) ) ( not ( = ?auto_125270 ?auto_125269 ) ) ( not ( = ?auto_125268 ?auto_125269 ) ) ( not ( = ?auto_125272 ?auto_125269 ) ) ( not ( = ?auto_125273 ?auto_125276 ) ) ( not ( = ?auto_125273 ?auto_125275 ) ) ( not ( = ?auto_125270 ?auto_125271 ) ) ( not ( = ?auto_125268 ?auto_125271 ) ) ( not ( = ?auto_125272 ?auto_125271 ) ) ( not ( = ?auto_125269 ?auto_125271 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125270 ?auto_125268 ?auto_125269 ?auto_125272 ?auto_125271 ?auto_125267 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125416 - OBJ
      ?auto_125417 - OBJ
      ?auto_125418 - OBJ
      ?auto_125419 - OBJ
      ?auto_125420 - OBJ
      ?auto_125415 - LOCATION
    )
    :vars
    (
      ?auto_125421 - LOCATION
      ?auto_125422 - CITY
      ?auto_125424 - LOCATION
      ?auto_125423 - LOCATION
      ?auto_125425 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125421 ?auto_125422 ) ( IN-CITY ?auto_125415 ?auto_125422 ) ( not ( = ?auto_125415 ?auto_125421 ) ) ( OBJ-AT ?auto_125420 ?auto_125421 ) ( OBJ-AT ?auto_125417 ?auto_125421 ) ( IN-CITY ?auto_125424 ?auto_125422 ) ( not ( = ?auto_125415 ?auto_125424 ) ) ( OBJ-AT ?auto_125418 ?auto_125424 ) ( OBJ-AT ?auto_125416 ?auto_125424 ) ( IN-CITY ?auto_125423 ?auto_125422 ) ( not ( = ?auto_125415 ?auto_125423 ) ) ( OBJ-AT ?auto_125419 ?auto_125423 ) ( TRUCK-AT ?auto_125425 ?auto_125415 ) ( not ( = ?auto_125419 ?auto_125416 ) ) ( not ( = ?auto_125424 ?auto_125423 ) ) ( not ( = ?auto_125419 ?auto_125418 ) ) ( not ( = ?auto_125416 ?auto_125418 ) ) ( not ( = ?auto_125419 ?auto_125417 ) ) ( not ( = ?auto_125416 ?auto_125417 ) ) ( not ( = ?auto_125418 ?auto_125417 ) ) ( not ( = ?auto_125421 ?auto_125424 ) ) ( not ( = ?auto_125421 ?auto_125423 ) ) ( not ( = ?auto_125419 ?auto_125420 ) ) ( not ( = ?auto_125416 ?auto_125420 ) ) ( not ( = ?auto_125418 ?auto_125420 ) ) ( not ( = ?auto_125417 ?auto_125420 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125419 ?auto_125416 ?auto_125417 ?auto_125418 ?auto_125420 ?auto_125415 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125463 - OBJ
      ?auto_125464 - OBJ
      ?auto_125465 - OBJ
      ?auto_125466 - OBJ
      ?auto_125467 - OBJ
      ?auto_125462 - LOCATION
    )
    :vars
    (
      ?auto_125468 - LOCATION
      ?auto_125469 - CITY
      ?auto_125471 - LOCATION
      ?auto_125470 - LOCATION
      ?auto_125472 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125468 ?auto_125469 ) ( IN-CITY ?auto_125462 ?auto_125469 ) ( not ( = ?auto_125462 ?auto_125468 ) ) ( OBJ-AT ?auto_125466 ?auto_125468 ) ( OBJ-AT ?auto_125464 ?auto_125468 ) ( IN-CITY ?auto_125471 ?auto_125469 ) ( not ( = ?auto_125462 ?auto_125471 ) ) ( OBJ-AT ?auto_125465 ?auto_125471 ) ( OBJ-AT ?auto_125463 ?auto_125471 ) ( IN-CITY ?auto_125470 ?auto_125469 ) ( not ( = ?auto_125462 ?auto_125470 ) ) ( OBJ-AT ?auto_125467 ?auto_125470 ) ( TRUCK-AT ?auto_125472 ?auto_125462 ) ( not ( = ?auto_125467 ?auto_125463 ) ) ( not ( = ?auto_125471 ?auto_125470 ) ) ( not ( = ?auto_125467 ?auto_125465 ) ) ( not ( = ?auto_125463 ?auto_125465 ) ) ( not ( = ?auto_125467 ?auto_125464 ) ) ( not ( = ?auto_125463 ?auto_125464 ) ) ( not ( = ?auto_125465 ?auto_125464 ) ) ( not ( = ?auto_125468 ?auto_125471 ) ) ( not ( = ?auto_125468 ?auto_125470 ) ) ( not ( = ?auto_125467 ?auto_125466 ) ) ( not ( = ?auto_125463 ?auto_125466 ) ) ( not ( = ?auto_125465 ?auto_125466 ) ) ( not ( = ?auto_125464 ?auto_125466 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125467 ?auto_125463 ?auto_125464 ?auto_125465 ?auto_125466 ?auto_125462 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125659 - OBJ
      ?auto_125660 - OBJ
      ?auto_125661 - OBJ
      ?auto_125662 - OBJ
      ?auto_125663 - OBJ
      ?auto_125658 - LOCATION
    )
    :vars
    (
      ?auto_125664 - LOCATION
      ?auto_125665 - CITY
      ?auto_125667 - LOCATION
      ?auto_125666 - LOCATION
      ?auto_125668 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125664 ?auto_125665 ) ( IN-CITY ?auto_125658 ?auto_125665 ) ( not ( = ?auto_125658 ?auto_125664 ) ) ( OBJ-AT ?auto_125661 ?auto_125664 ) ( OBJ-AT ?auto_125660 ?auto_125664 ) ( IN-CITY ?auto_125667 ?auto_125665 ) ( not ( = ?auto_125658 ?auto_125667 ) ) ( OBJ-AT ?auto_125663 ?auto_125667 ) ( OBJ-AT ?auto_125659 ?auto_125667 ) ( IN-CITY ?auto_125666 ?auto_125665 ) ( not ( = ?auto_125658 ?auto_125666 ) ) ( OBJ-AT ?auto_125662 ?auto_125666 ) ( TRUCK-AT ?auto_125668 ?auto_125658 ) ( not ( = ?auto_125662 ?auto_125659 ) ) ( not ( = ?auto_125667 ?auto_125666 ) ) ( not ( = ?auto_125662 ?auto_125663 ) ) ( not ( = ?auto_125659 ?auto_125663 ) ) ( not ( = ?auto_125662 ?auto_125660 ) ) ( not ( = ?auto_125659 ?auto_125660 ) ) ( not ( = ?auto_125663 ?auto_125660 ) ) ( not ( = ?auto_125664 ?auto_125667 ) ) ( not ( = ?auto_125664 ?auto_125666 ) ) ( not ( = ?auto_125662 ?auto_125661 ) ) ( not ( = ?auto_125659 ?auto_125661 ) ) ( not ( = ?auto_125663 ?auto_125661 ) ) ( not ( = ?auto_125660 ?auto_125661 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125662 ?auto_125659 ?auto_125660 ?auto_125663 ?auto_125661 ?auto_125658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125757 - OBJ
      ?auto_125758 - OBJ
      ?auto_125759 - OBJ
      ?auto_125760 - OBJ
      ?auto_125761 - OBJ
      ?auto_125756 - LOCATION
    )
    :vars
    (
      ?auto_125762 - LOCATION
      ?auto_125763 - CITY
      ?auto_125765 - LOCATION
      ?auto_125764 - LOCATION
      ?auto_125766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125762 ?auto_125763 ) ( IN-CITY ?auto_125756 ?auto_125763 ) ( not ( = ?auto_125756 ?auto_125762 ) ) ( OBJ-AT ?auto_125759 ?auto_125762 ) ( OBJ-AT ?auto_125758 ?auto_125762 ) ( IN-CITY ?auto_125765 ?auto_125763 ) ( not ( = ?auto_125756 ?auto_125765 ) ) ( OBJ-AT ?auto_125760 ?auto_125765 ) ( OBJ-AT ?auto_125757 ?auto_125765 ) ( IN-CITY ?auto_125764 ?auto_125763 ) ( not ( = ?auto_125756 ?auto_125764 ) ) ( OBJ-AT ?auto_125761 ?auto_125764 ) ( TRUCK-AT ?auto_125766 ?auto_125756 ) ( not ( = ?auto_125761 ?auto_125757 ) ) ( not ( = ?auto_125765 ?auto_125764 ) ) ( not ( = ?auto_125761 ?auto_125760 ) ) ( not ( = ?auto_125757 ?auto_125760 ) ) ( not ( = ?auto_125761 ?auto_125758 ) ) ( not ( = ?auto_125757 ?auto_125758 ) ) ( not ( = ?auto_125760 ?auto_125758 ) ) ( not ( = ?auto_125762 ?auto_125765 ) ) ( not ( = ?auto_125762 ?auto_125764 ) ) ( not ( = ?auto_125761 ?auto_125759 ) ) ( not ( = ?auto_125757 ?auto_125759 ) ) ( not ( = ?auto_125760 ?auto_125759 ) ) ( not ( = ?auto_125758 ?auto_125759 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125761 ?auto_125757 ?auto_125758 ?auto_125760 ?auto_125759 ?auto_125756 ) )
  )

)

