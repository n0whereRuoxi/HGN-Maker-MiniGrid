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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15215 - OBJ
      ?auto_15214 - LOCATION
    )
    :vars
    (
      ?auto_15216 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15216 ?auto_15214 ) ( IN-TRUCK ?auto_15215 ?auto_15216 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_15215 ?auto_15216 ?auto_15214 )
      ( DELIVER-1PKG-VERIFY ?auto_15215 ?auto_15214 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15233 - OBJ
      ?auto_15232 - LOCATION
    )
    :vars
    (
      ?auto_15234 - TRUCK
      ?auto_15235 - LOCATION
      ?auto_15236 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15233 ?auto_15234 ) ( TRUCK-AT ?auto_15234 ?auto_15235 ) ( IN-CITY ?auto_15235 ?auto_15236 ) ( IN-CITY ?auto_15232 ?auto_15236 ) ( not ( = ?auto_15232 ?auto_15235 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15234 ?auto_15235 ?auto_15232 ?auto_15236 )
      ( DELIVER-1PKG ?auto_15233 ?auto_15232 )
      ( DELIVER-1PKG-VERIFY ?auto_15233 ?auto_15232 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15259 - OBJ
      ?auto_15258 - LOCATION
    )
    :vars
    (
      ?auto_15262 - TRUCK
      ?auto_15261 - LOCATION
      ?auto_15260 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15262 ?auto_15261 ) ( IN-CITY ?auto_15261 ?auto_15260 ) ( IN-CITY ?auto_15258 ?auto_15260 ) ( not ( = ?auto_15258 ?auto_15261 ) ) ( OBJ-AT ?auto_15259 ?auto_15261 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15259 ?auto_15262 ?auto_15261 )
      ( DELIVER-1PKG ?auto_15259 ?auto_15258 )
      ( DELIVER-1PKG-VERIFY ?auto_15259 ?auto_15258 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15285 - OBJ
      ?auto_15284 - LOCATION
    )
    :vars
    (
      ?auto_15287 - LOCATION
      ?auto_15286 - CITY
      ?auto_15288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15287 ?auto_15286 ) ( IN-CITY ?auto_15284 ?auto_15286 ) ( not ( = ?auto_15284 ?auto_15287 ) ) ( OBJ-AT ?auto_15285 ?auto_15287 ) ( TRUCK-AT ?auto_15288 ?auto_15284 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15288 ?auto_15284 ?auto_15287 ?auto_15286 )
      ( DELIVER-1PKG ?auto_15285 ?auto_15284 )
      ( DELIVER-1PKG-VERIFY ?auto_15285 ?auto_15284 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15428 - OBJ
      ?auto_15429 - OBJ
      ?auto_15427 - LOCATION
    )
    :vars
    (
      ?auto_15430 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15430 ?auto_15427 ) ( IN-TRUCK ?auto_15429 ?auto_15430 ) ( OBJ-AT ?auto_15428 ?auto_15427 ) ( not ( = ?auto_15428 ?auto_15429 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15429 ?auto_15427 )
      ( DELIVER-2PKG-VERIFY ?auto_15428 ?auto_15429 ?auto_15427 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15432 - OBJ
      ?auto_15433 - OBJ
      ?auto_15431 - LOCATION
    )
    :vars
    (
      ?auto_15434 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15434 ?auto_15431 ) ( IN-TRUCK ?auto_15432 ?auto_15434 ) ( OBJ-AT ?auto_15433 ?auto_15431 ) ( not ( = ?auto_15432 ?auto_15433 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15432 ?auto_15431 )
      ( DELIVER-2PKG-VERIFY ?auto_15432 ?auto_15433 ?auto_15431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15440 - OBJ
      ?auto_15441 - OBJ
      ?auto_15442 - OBJ
      ?auto_15439 - LOCATION
    )
    :vars
    (
      ?auto_15443 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15443 ?auto_15439 ) ( IN-TRUCK ?auto_15442 ?auto_15443 ) ( OBJ-AT ?auto_15440 ?auto_15439 ) ( OBJ-AT ?auto_15441 ?auto_15439 ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( not ( = ?auto_15440 ?auto_15442 ) ) ( not ( = ?auto_15441 ?auto_15442 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15442 ?auto_15439 )
      ( DELIVER-3PKG-VERIFY ?auto_15440 ?auto_15441 ?auto_15442 ?auto_15439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15445 - OBJ
      ?auto_15446 - OBJ
      ?auto_15447 - OBJ
      ?auto_15444 - LOCATION
    )
    :vars
    (
      ?auto_15448 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15448 ?auto_15444 ) ( IN-TRUCK ?auto_15446 ?auto_15448 ) ( OBJ-AT ?auto_15445 ?auto_15444 ) ( OBJ-AT ?auto_15447 ?auto_15444 ) ( not ( = ?auto_15445 ?auto_15446 ) ) ( not ( = ?auto_15445 ?auto_15447 ) ) ( not ( = ?auto_15446 ?auto_15447 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15446 ?auto_15444 )
      ( DELIVER-3PKG-VERIFY ?auto_15445 ?auto_15446 ?auto_15447 ?auto_15444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15455 - OBJ
      ?auto_15456 - OBJ
      ?auto_15457 - OBJ
      ?auto_15454 - LOCATION
    )
    :vars
    (
      ?auto_15458 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15458 ?auto_15454 ) ( IN-TRUCK ?auto_15455 ?auto_15458 ) ( OBJ-AT ?auto_15456 ?auto_15454 ) ( OBJ-AT ?auto_15457 ?auto_15454 ) ( not ( = ?auto_15455 ?auto_15456 ) ) ( not ( = ?auto_15455 ?auto_15457 ) ) ( not ( = ?auto_15456 ?auto_15457 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15455 ?auto_15454 )
      ( DELIVER-3PKG-VERIFY ?auto_15455 ?auto_15456 ?auto_15457 ?auto_15454 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15475 - OBJ
      ?auto_15476 - OBJ
      ?auto_15477 - OBJ
      ?auto_15478 - OBJ
      ?auto_15474 - LOCATION
    )
    :vars
    (
      ?auto_15479 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15479 ?auto_15474 ) ( IN-TRUCK ?auto_15478 ?auto_15479 ) ( OBJ-AT ?auto_15475 ?auto_15474 ) ( OBJ-AT ?auto_15476 ?auto_15474 ) ( OBJ-AT ?auto_15477 ?auto_15474 ) ( not ( = ?auto_15475 ?auto_15476 ) ) ( not ( = ?auto_15475 ?auto_15477 ) ) ( not ( = ?auto_15475 ?auto_15478 ) ) ( not ( = ?auto_15476 ?auto_15477 ) ) ( not ( = ?auto_15476 ?auto_15478 ) ) ( not ( = ?auto_15477 ?auto_15478 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15478 ?auto_15474 )
      ( DELIVER-4PKG-VERIFY ?auto_15475 ?auto_15476 ?auto_15477 ?auto_15478 ?auto_15474 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15481 - OBJ
      ?auto_15482 - OBJ
      ?auto_15483 - OBJ
      ?auto_15484 - OBJ
      ?auto_15480 - LOCATION
    )
    :vars
    (
      ?auto_15485 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15485 ?auto_15480 ) ( IN-TRUCK ?auto_15483 ?auto_15485 ) ( OBJ-AT ?auto_15481 ?auto_15480 ) ( OBJ-AT ?auto_15482 ?auto_15480 ) ( OBJ-AT ?auto_15484 ?auto_15480 ) ( not ( = ?auto_15481 ?auto_15482 ) ) ( not ( = ?auto_15481 ?auto_15483 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15482 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15483 ?auto_15480 )
      ( DELIVER-4PKG-VERIFY ?auto_15481 ?auto_15482 ?auto_15483 ?auto_15484 ?auto_15480 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15493 - OBJ
      ?auto_15494 - OBJ
      ?auto_15495 - OBJ
      ?auto_15496 - OBJ
      ?auto_15492 - LOCATION
    )
    :vars
    (
      ?auto_15497 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15497 ?auto_15492 ) ( IN-TRUCK ?auto_15494 ?auto_15497 ) ( OBJ-AT ?auto_15493 ?auto_15492 ) ( OBJ-AT ?auto_15495 ?auto_15492 ) ( OBJ-AT ?auto_15496 ?auto_15492 ) ( not ( = ?auto_15493 ?auto_15494 ) ) ( not ( = ?auto_15493 ?auto_15495 ) ) ( not ( = ?auto_15493 ?auto_15496 ) ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( not ( = ?auto_15495 ?auto_15496 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15494 ?auto_15492 )
      ( DELIVER-4PKG-VERIFY ?auto_15493 ?auto_15494 ?auto_15495 ?auto_15496 ?auto_15492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15517 - OBJ
      ?auto_15518 - OBJ
      ?auto_15519 - OBJ
      ?auto_15520 - OBJ
      ?auto_15516 - LOCATION
    )
    :vars
    (
      ?auto_15521 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15521 ?auto_15516 ) ( IN-TRUCK ?auto_15517 ?auto_15521 ) ( OBJ-AT ?auto_15518 ?auto_15516 ) ( OBJ-AT ?auto_15519 ?auto_15516 ) ( OBJ-AT ?auto_15520 ?auto_15516 ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( not ( = ?auto_15517 ?auto_15519 ) ) ( not ( = ?auto_15517 ?auto_15520 ) ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15520 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15517 ?auto_15516 )
      ( DELIVER-4PKG-VERIFY ?auto_15517 ?auto_15518 ?auto_15519 ?auto_15520 ?auto_15516 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15570 - OBJ
      ?auto_15571 - OBJ
      ?auto_15569 - LOCATION
    )
    :vars
    (
      ?auto_15572 - TRUCK
      ?auto_15573 - LOCATION
      ?auto_15574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15571 ?auto_15572 ) ( TRUCK-AT ?auto_15572 ?auto_15573 ) ( IN-CITY ?auto_15573 ?auto_15574 ) ( IN-CITY ?auto_15569 ?auto_15574 ) ( not ( = ?auto_15569 ?auto_15573 ) ) ( OBJ-AT ?auto_15570 ?auto_15569 ) ( not ( = ?auto_15570 ?auto_15571 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15571 ?auto_15569 )
      ( DELIVER-2PKG-VERIFY ?auto_15570 ?auto_15571 ?auto_15569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15576 - OBJ
      ?auto_15577 - OBJ
      ?auto_15575 - LOCATION
    )
    :vars
    (
      ?auto_15578 - TRUCK
      ?auto_15579 - LOCATION
      ?auto_15580 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15576 ?auto_15578 ) ( TRUCK-AT ?auto_15578 ?auto_15579 ) ( IN-CITY ?auto_15579 ?auto_15580 ) ( IN-CITY ?auto_15575 ?auto_15580 ) ( not ( = ?auto_15575 ?auto_15579 ) ) ( OBJ-AT ?auto_15577 ?auto_15575 ) ( not ( = ?auto_15577 ?auto_15576 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15577 ?auto_15576 ?auto_15575 )
      ( DELIVER-2PKG-VERIFY ?auto_15576 ?auto_15577 ?auto_15575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15589 - OBJ
      ?auto_15590 - OBJ
      ?auto_15591 - OBJ
      ?auto_15588 - LOCATION
    )
    :vars
    (
      ?auto_15592 - TRUCK
      ?auto_15593 - LOCATION
      ?auto_15594 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15591 ?auto_15592 ) ( TRUCK-AT ?auto_15592 ?auto_15593 ) ( IN-CITY ?auto_15593 ?auto_15594 ) ( IN-CITY ?auto_15588 ?auto_15594 ) ( not ( = ?auto_15588 ?auto_15593 ) ) ( OBJ-AT ?auto_15589 ?auto_15588 ) ( not ( = ?auto_15589 ?auto_15591 ) ) ( OBJ-AT ?auto_15590 ?auto_15588 ) ( not ( = ?auto_15589 ?auto_15590 ) ) ( not ( = ?auto_15590 ?auto_15591 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15589 ?auto_15591 ?auto_15588 )
      ( DELIVER-3PKG-VERIFY ?auto_15589 ?auto_15590 ?auto_15591 ?auto_15588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15596 - OBJ
      ?auto_15597 - OBJ
      ?auto_15598 - OBJ
      ?auto_15595 - LOCATION
    )
    :vars
    (
      ?auto_15599 - TRUCK
      ?auto_15600 - LOCATION
      ?auto_15601 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15597 ?auto_15599 ) ( TRUCK-AT ?auto_15599 ?auto_15600 ) ( IN-CITY ?auto_15600 ?auto_15601 ) ( IN-CITY ?auto_15595 ?auto_15601 ) ( not ( = ?auto_15595 ?auto_15600 ) ) ( OBJ-AT ?auto_15596 ?auto_15595 ) ( not ( = ?auto_15596 ?auto_15597 ) ) ( OBJ-AT ?auto_15598 ?auto_15595 ) ( not ( = ?auto_15596 ?auto_15598 ) ) ( not ( = ?auto_15597 ?auto_15598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15596 ?auto_15597 ?auto_15595 )
      ( DELIVER-3PKG-VERIFY ?auto_15596 ?auto_15597 ?auto_15598 ?auto_15595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15610 - OBJ
      ?auto_15611 - OBJ
      ?auto_15612 - OBJ
      ?auto_15609 - LOCATION
    )
    :vars
    (
      ?auto_15613 - TRUCK
      ?auto_15614 - LOCATION
      ?auto_15615 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15610 ?auto_15613 ) ( TRUCK-AT ?auto_15613 ?auto_15614 ) ( IN-CITY ?auto_15614 ?auto_15615 ) ( IN-CITY ?auto_15609 ?auto_15615 ) ( not ( = ?auto_15609 ?auto_15614 ) ) ( OBJ-AT ?auto_15611 ?auto_15609 ) ( not ( = ?auto_15611 ?auto_15610 ) ) ( OBJ-AT ?auto_15612 ?auto_15609 ) ( not ( = ?auto_15610 ?auto_15612 ) ) ( not ( = ?auto_15611 ?auto_15612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15611 ?auto_15610 ?auto_15609 )
      ( DELIVER-3PKG-VERIFY ?auto_15610 ?auto_15611 ?auto_15612 ?auto_15609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15639 - OBJ
      ?auto_15640 - OBJ
      ?auto_15641 - OBJ
      ?auto_15642 - OBJ
      ?auto_15638 - LOCATION
    )
    :vars
    (
      ?auto_15643 - TRUCK
      ?auto_15644 - LOCATION
      ?auto_15645 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15642 ?auto_15643 ) ( TRUCK-AT ?auto_15643 ?auto_15644 ) ( IN-CITY ?auto_15644 ?auto_15645 ) ( IN-CITY ?auto_15638 ?auto_15645 ) ( not ( = ?auto_15638 ?auto_15644 ) ) ( OBJ-AT ?auto_15640 ?auto_15638 ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( OBJ-AT ?auto_15639 ?auto_15638 ) ( OBJ-AT ?auto_15641 ?auto_15638 ) ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15641 ) ) ( not ( = ?auto_15639 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15641 ) ) ( not ( = ?auto_15641 ?auto_15642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15640 ?auto_15642 ?auto_15638 )
      ( DELIVER-4PKG-VERIFY ?auto_15639 ?auto_15640 ?auto_15641 ?auto_15642 ?auto_15638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15647 - OBJ
      ?auto_15648 - OBJ
      ?auto_15649 - OBJ
      ?auto_15650 - OBJ
      ?auto_15646 - LOCATION
    )
    :vars
    (
      ?auto_15651 - TRUCK
      ?auto_15652 - LOCATION
      ?auto_15653 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15649 ?auto_15651 ) ( TRUCK-AT ?auto_15651 ?auto_15652 ) ( IN-CITY ?auto_15652 ?auto_15653 ) ( IN-CITY ?auto_15646 ?auto_15653 ) ( not ( = ?auto_15646 ?auto_15652 ) ) ( OBJ-AT ?auto_15650 ?auto_15646 ) ( not ( = ?auto_15650 ?auto_15649 ) ) ( OBJ-AT ?auto_15647 ?auto_15646 ) ( OBJ-AT ?auto_15648 ?auto_15646 ) ( not ( = ?auto_15647 ?auto_15648 ) ) ( not ( = ?auto_15647 ?auto_15649 ) ) ( not ( = ?auto_15647 ?auto_15650 ) ) ( not ( = ?auto_15648 ?auto_15649 ) ) ( not ( = ?auto_15648 ?auto_15650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15650 ?auto_15649 ?auto_15646 )
      ( DELIVER-4PKG-VERIFY ?auto_15647 ?auto_15648 ?auto_15649 ?auto_15650 ?auto_15646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15663 - OBJ
      ?auto_15664 - OBJ
      ?auto_15665 - OBJ
      ?auto_15666 - OBJ
      ?auto_15662 - LOCATION
    )
    :vars
    (
      ?auto_15667 - TRUCK
      ?auto_15668 - LOCATION
      ?auto_15669 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15664 ?auto_15667 ) ( TRUCK-AT ?auto_15667 ?auto_15668 ) ( IN-CITY ?auto_15668 ?auto_15669 ) ( IN-CITY ?auto_15662 ?auto_15669 ) ( not ( = ?auto_15662 ?auto_15668 ) ) ( OBJ-AT ?auto_15663 ?auto_15662 ) ( not ( = ?auto_15663 ?auto_15664 ) ) ( OBJ-AT ?auto_15665 ?auto_15662 ) ( OBJ-AT ?auto_15666 ?auto_15662 ) ( not ( = ?auto_15663 ?auto_15665 ) ) ( not ( = ?auto_15663 ?auto_15666 ) ) ( not ( = ?auto_15664 ?auto_15665 ) ) ( not ( = ?auto_15664 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15663 ?auto_15664 ?auto_15662 )
      ( DELIVER-4PKG-VERIFY ?auto_15663 ?auto_15664 ?auto_15665 ?auto_15666 ?auto_15662 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15695 - OBJ
      ?auto_15696 - OBJ
      ?auto_15697 - OBJ
      ?auto_15698 - OBJ
      ?auto_15694 - LOCATION
    )
    :vars
    (
      ?auto_15699 - TRUCK
      ?auto_15700 - LOCATION
      ?auto_15701 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15695 ?auto_15699 ) ( TRUCK-AT ?auto_15699 ?auto_15700 ) ( IN-CITY ?auto_15700 ?auto_15701 ) ( IN-CITY ?auto_15694 ?auto_15701 ) ( not ( = ?auto_15694 ?auto_15700 ) ) ( OBJ-AT ?auto_15698 ?auto_15694 ) ( not ( = ?auto_15698 ?auto_15695 ) ) ( OBJ-AT ?auto_15696 ?auto_15694 ) ( OBJ-AT ?auto_15697 ?auto_15694 ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15697 ) ) ( not ( = ?auto_15696 ?auto_15697 ) ) ( not ( = ?auto_15696 ?auto_15698 ) ) ( not ( = ?auto_15697 ?auto_15698 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15698 ?auto_15695 ?auto_15694 )
      ( DELIVER-4PKG-VERIFY ?auto_15695 ?auto_15696 ?auto_15697 ?auto_15698 ?auto_15694 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15760 - OBJ
      ?auto_15759 - LOCATION
    )
    :vars
    (
      ?auto_15761 - TRUCK
      ?auto_15762 - LOCATION
      ?auto_15763 - CITY
      ?auto_15764 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15761 ?auto_15762 ) ( IN-CITY ?auto_15762 ?auto_15763 ) ( IN-CITY ?auto_15759 ?auto_15763 ) ( not ( = ?auto_15759 ?auto_15762 ) ) ( OBJ-AT ?auto_15764 ?auto_15759 ) ( not ( = ?auto_15764 ?auto_15760 ) ) ( OBJ-AT ?auto_15760 ?auto_15762 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15760 ?auto_15761 ?auto_15762 )
      ( DELIVER-2PKG ?auto_15764 ?auto_15760 ?auto_15759 )
      ( DELIVER-1PKG-VERIFY ?auto_15760 ?auto_15759 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15766 - OBJ
      ?auto_15767 - OBJ
      ?auto_15765 - LOCATION
    )
    :vars
    (
      ?auto_15768 - TRUCK
      ?auto_15769 - LOCATION
      ?auto_15770 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15768 ?auto_15769 ) ( IN-CITY ?auto_15769 ?auto_15770 ) ( IN-CITY ?auto_15765 ?auto_15770 ) ( not ( = ?auto_15765 ?auto_15769 ) ) ( OBJ-AT ?auto_15766 ?auto_15765 ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( OBJ-AT ?auto_15767 ?auto_15769 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15767 ?auto_15765 )
      ( DELIVER-2PKG-VERIFY ?auto_15766 ?auto_15767 ?auto_15765 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15772 - OBJ
      ?auto_15773 - OBJ
      ?auto_15771 - LOCATION
    )
    :vars
    (
      ?auto_15776 - TRUCK
      ?auto_15774 - LOCATION
      ?auto_15775 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15776 ?auto_15774 ) ( IN-CITY ?auto_15774 ?auto_15775 ) ( IN-CITY ?auto_15771 ?auto_15775 ) ( not ( = ?auto_15771 ?auto_15774 ) ) ( OBJ-AT ?auto_15773 ?auto_15771 ) ( not ( = ?auto_15773 ?auto_15772 ) ) ( OBJ-AT ?auto_15772 ?auto_15774 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15773 ?auto_15772 ?auto_15771 )
      ( DELIVER-2PKG-VERIFY ?auto_15772 ?auto_15773 ?auto_15771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15785 - OBJ
      ?auto_15786 - OBJ
      ?auto_15787 - OBJ
      ?auto_15784 - LOCATION
    )
    :vars
    (
      ?auto_15790 - TRUCK
      ?auto_15788 - LOCATION
      ?auto_15789 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15790 ?auto_15788 ) ( IN-CITY ?auto_15788 ?auto_15789 ) ( IN-CITY ?auto_15784 ?auto_15789 ) ( not ( = ?auto_15784 ?auto_15788 ) ) ( OBJ-AT ?auto_15786 ?auto_15784 ) ( not ( = ?auto_15786 ?auto_15787 ) ) ( OBJ-AT ?auto_15787 ?auto_15788 ) ( OBJ-AT ?auto_15785 ?auto_15784 ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15785 ?auto_15787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15786 ?auto_15787 ?auto_15784 )
      ( DELIVER-3PKG-VERIFY ?auto_15785 ?auto_15786 ?auto_15787 ?auto_15784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15792 - OBJ
      ?auto_15793 - OBJ
      ?auto_15794 - OBJ
      ?auto_15791 - LOCATION
    )
    :vars
    (
      ?auto_15797 - TRUCK
      ?auto_15795 - LOCATION
      ?auto_15796 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15797 ?auto_15795 ) ( IN-CITY ?auto_15795 ?auto_15796 ) ( IN-CITY ?auto_15791 ?auto_15796 ) ( not ( = ?auto_15791 ?auto_15795 ) ) ( OBJ-AT ?auto_15792 ?auto_15791 ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( OBJ-AT ?auto_15793 ?auto_15795 ) ( OBJ-AT ?auto_15794 ?auto_15791 ) ( not ( = ?auto_15792 ?auto_15794 ) ) ( not ( = ?auto_15793 ?auto_15794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15792 ?auto_15793 ?auto_15791 )
      ( DELIVER-3PKG-VERIFY ?auto_15792 ?auto_15793 ?auto_15794 ?auto_15791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15806 - OBJ
      ?auto_15807 - OBJ
      ?auto_15808 - OBJ
      ?auto_15805 - LOCATION
    )
    :vars
    (
      ?auto_15811 - TRUCK
      ?auto_15809 - LOCATION
      ?auto_15810 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15811 ?auto_15809 ) ( IN-CITY ?auto_15809 ?auto_15810 ) ( IN-CITY ?auto_15805 ?auto_15810 ) ( not ( = ?auto_15805 ?auto_15809 ) ) ( OBJ-AT ?auto_15807 ?auto_15805 ) ( not ( = ?auto_15807 ?auto_15806 ) ) ( OBJ-AT ?auto_15806 ?auto_15809 ) ( OBJ-AT ?auto_15808 ?auto_15805 ) ( not ( = ?auto_15806 ?auto_15808 ) ) ( not ( = ?auto_15807 ?auto_15808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15807 ?auto_15806 ?auto_15805 )
      ( DELIVER-3PKG-VERIFY ?auto_15806 ?auto_15807 ?auto_15808 ?auto_15805 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15835 - OBJ
      ?auto_15836 - OBJ
      ?auto_15837 - OBJ
      ?auto_15838 - OBJ
      ?auto_15834 - LOCATION
    )
    :vars
    (
      ?auto_15841 - TRUCK
      ?auto_15839 - LOCATION
      ?auto_15840 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15841 ?auto_15839 ) ( IN-CITY ?auto_15839 ?auto_15840 ) ( IN-CITY ?auto_15834 ?auto_15840 ) ( not ( = ?auto_15834 ?auto_15839 ) ) ( OBJ-AT ?auto_15836 ?auto_15834 ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( OBJ-AT ?auto_15838 ?auto_15839 ) ( OBJ-AT ?auto_15835 ?auto_15834 ) ( OBJ-AT ?auto_15837 ?auto_15834 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15835 ?auto_15838 ) ) ( not ( = ?auto_15836 ?auto_15837 ) ) ( not ( = ?auto_15837 ?auto_15838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15836 ?auto_15838 ?auto_15834 )
      ( DELIVER-4PKG-VERIFY ?auto_15835 ?auto_15836 ?auto_15837 ?auto_15838 ?auto_15834 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15843 - OBJ
      ?auto_15844 - OBJ
      ?auto_15845 - OBJ
      ?auto_15846 - OBJ
      ?auto_15842 - LOCATION
    )
    :vars
    (
      ?auto_15849 - TRUCK
      ?auto_15847 - LOCATION
      ?auto_15848 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15849 ?auto_15847 ) ( IN-CITY ?auto_15847 ?auto_15848 ) ( IN-CITY ?auto_15842 ?auto_15848 ) ( not ( = ?auto_15842 ?auto_15847 ) ) ( OBJ-AT ?auto_15844 ?auto_15842 ) ( not ( = ?auto_15844 ?auto_15845 ) ) ( OBJ-AT ?auto_15845 ?auto_15847 ) ( OBJ-AT ?auto_15843 ?auto_15842 ) ( OBJ-AT ?auto_15846 ?auto_15842 ) ( not ( = ?auto_15843 ?auto_15844 ) ) ( not ( = ?auto_15843 ?auto_15845 ) ) ( not ( = ?auto_15843 ?auto_15846 ) ) ( not ( = ?auto_15844 ?auto_15846 ) ) ( not ( = ?auto_15845 ?auto_15846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15844 ?auto_15845 ?auto_15842 )
      ( DELIVER-4PKG-VERIFY ?auto_15843 ?auto_15844 ?auto_15845 ?auto_15846 ?auto_15842 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15859 - OBJ
      ?auto_15860 - OBJ
      ?auto_15861 - OBJ
      ?auto_15862 - OBJ
      ?auto_15858 - LOCATION
    )
    :vars
    (
      ?auto_15865 - TRUCK
      ?auto_15863 - LOCATION
      ?auto_15864 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15865 ?auto_15863 ) ( IN-CITY ?auto_15863 ?auto_15864 ) ( IN-CITY ?auto_15858 ?auto_15864 ) ( not ( = ?auto_15858 ?auto_15863 ) ) ( OBJ-AT ?auto_15862 ?auto_15858 ) ( not ( = ?auto_15862 ?auto_15860 ) ) ( OBJ-AT ?auto_15860 ?auto_15863 ) ( OBJ-AT ?auto_15859 ?auto_15858 ) ( OBJ-AT ?auto_15861 ?auto_15858 ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( not ( = ?auto_15859 ?auto_15861 ) ) ( not ( = ?auto_15859 ?auto_15862 ) ) ( not ( = ?auto_15860 ?auto_15861 ) ) ( not ( = ?auto_15861 ?auto_15862 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15862 ?auto_15860 ?auto_15858 )
      ( DELIVER-4PKG-VERIFY ?auto_15859 ?auto_15860 ?auto_15861 ?auto_15862 ?auto_15858 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15891 - OBJ
      ?auto_15892 - OBJ
      ?auto_15893 - OBJ
      ?auto_15894 - OBJ
      ?auto_15890 - LOCATION
    )
    :vars
    (
      ?auto_15897 - TRUCK
      ?auto_15895 - LOCATION
      ?auto_15896 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15897 ?auto_15895 ) ( IN-CITY ?auto_15895 ?auto_15896 ) ( IN-CITY ?auto_15890 ?auto_15896 ) ( not ( = ?auto_15890 ?auto_15895 ) ) ( OBJ-AT ?auto_15893 ?auto_15890 ) ( not ( = ?auto_15893 ?auto_15891 ) ) ( OBJ-AT ?auto_15891 ?auto_15895 ) ( OBJ-AT ?auto_15892 ?auto_15890 ) ( OBJ-AT ?auto_15894 ?auto_15890 ) ( not ( = ?auto_15891 ?auto_15892 ) ) ( not ( = ?auto_15891 ?auto_15894 ) ) ( not ( = ?auto_15892 ?auto_15893 ) ) ( not ( = ?auto_15892 ?auto_15894 ) ) ( not ( = ?auto_15893 ?auto_15894 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15893 ?auto_15891 ?auto_15890 )
      ( DELIVER-4PKG-VERIFY ?auto_15891 ?auto_15892 ?auto_15893 ?auto_15894 ?auto_15890 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15956 - OBJ
      ?auto_15955 - LOCATION
    )
    :vars
    (
      ?auto_15957 - LOCATION
      ?auto_15958 - CITY
      ?auto_15960 - OBJ
      ?auto_15959 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15957 ?auto_15958 ) ( IN-CITY ?auto_15955 ?auto_15958 ) ( not ( = ?auto_15955 ?auto_15957 ) ) ( OBJ-AT ?auto_15960 ?auto_15955 ) ( not ( = ?auto_15960 ?auto_15956 ) ) ( OBJ-AT ?auto_15956 ?auto_15957 ) ( TRUCK-AT ?auto_15959 ?auto_15955 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15959 ?auto_15955 ?auto_15957 ?auto_15958 )
      ( DELIVER-2PKG ?auto_15960 ?auto_15956 ?auto_15955 )
      ( DELIVER-1PKG-VERIFY ?auto_15956 ?auto_15955 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15962 - OBJ
      ?auto_15963 - OBJ
      ?auto_15961 - LOCATION
    )
    :vars
    (
      ?auto_15964 - LOCATION
      ?auto_15966 - CITY
      ?auto_15965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15964 ?auto_15966 ) ( IN-CITY ?auto_15961 ?auto_15966 ) ( not ( = ?auto_15961 ?auto_15964 ) ) ( OBJ-AT ?auto_15962 ?auto_15961 ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( OBJ-AT ?auto_15963 ?auto_15964 ) ( TRUCK-AT ?auto_15965 ?auto_15961 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15963 ?auto_15961 )
      ( DELIVER-2PKG-VERIFY ?auto_15962 ?auto_15963 ?auto_15961 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15968 - OBJ
      ?auto_15969 - OBJ
      ?auto_15967 - LOCATION
    )
    :vars
    (
      ?auto_15972 - LOCATION
      ?auto_15971 - CITY
      ?auto_15970 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15972 ?auto_15971 ) ( IN-CITY ?auto_15967 ?auto_15971 ) ( not ( = ?auto_15967 ?auto_15972 ) ) ( OBJ-AT ?auto_15969 ?auto_15967 ) ( not ( = ?auto_15969 ?auto_15968 ) ) ( OBJ-AT ?auto_15968 ?auto_15972 ) ( TRUCK-AT ?auto_15970 ?auto_15967 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15969 ?auto_15968 ?auto_15967 )
      ( DELIVER-2PKG-VERIFY ?auto_15968 ?auto_15969 ?auto_15967 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15981 - OBJ
      ?auto_15982 - OBJ
      ?auto_15983 - OBJ
      ?auto_15980 - LOCATION
    )
    :vars
    (
      ?auto_15986 - LOCATION
      ?auto_15985 - CITY
      ?auto_15984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15986 ?auto_15985 ) ( IN-CITY ?auto_15980 ?auto_15985 ) ( not ( = ?auto_15980 ?auto_15986 ) ) ( OBJ-AT ?auto_15982 ?auto_15980 ) ( not ( = ?auto_15982 ?auto_15983 ) ) ( OBJ-AT ?auto_15983 ?auto_15986 ) ( TRUCK-AT ?auto_15984 ?auto_15980 ) ( OBJ-AT ?auto_15981 ?auto_15980 ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( not ( = ?auto_15981 ?auto_15983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15982 ?auto_15983 ?auto_15980 )
      ( DELIVER-3PKG-VERIFY ?auto_15981 ?auto_15982 ?auto_15983 ?auto_15980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15988 - OBJ
      ?auto_15989 - OBJ
      ?auto_15990 - OBJ
      ?auto_15987 - LOCATION
    )
    :vars
    (
      ?auto_15993 - LOCATION
      ?auto_15992 - CITY
      ?auto_15991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15993 ?auto_15992 ) ( IN-CITY ?auto_15987 ?auto_15992 ) ( not ( = ?auto_15987 ?auto_15993 ) ) ( OBJ-AT ?auto_15988 ?auto_15987 ) ( not ( = ?auto_15988 ?auto_15989 ) ) ( OBJ-AT ?auto_15989 ?auto_15993 ) ( TRUCK-AT ?auto_15991 ?auto_15987 ) ( OBJ-AT ?auto_15990 ?auto_15987 ) ( not ( = ?auto_15988 ?auto_15990 ) ) ( not ( = ?auto_15989 ?auto_15990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15988 ?auto_15989 ?auto_15987 )
      ( DELIVER-3PKG-VERIFY ?auto_15988 ?auto_15989 ?auto_15990 ?auto_15987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16002 - OBJ
      ?auto_16003 - OBJ
      ?auto_16004 - OBJ
      ?auto_16001 - LOCATION
    )
    :vars
    (
      ?auto_16007 - LOCATION
      ?auto_16006 - CITY
      ?auto_16005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16007 ?auto_16006 ) ( IN-CITY ?auto_16001 ?auto_16006 ) ( not ( = ?auto_16001 ?auto_16007 ) ) ( OBJ-AT ?auto_16003 ?auto_16001 ) ( not ( = ?auto_16003 ?auto_16002 ) ) ( OBJ-AT ?auto_16002 ?auto_16007 ) ( TRUCK-AT ?auto_16005 ?auto_16001 ) ( OBJ-AT ?auto_16004 ?auto_16001 ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16003 ?auto_16002 ?auto_16001 )
      ( DELIVER-3PKG-VERIFY ?auto_16002 ?auto_16003 ?auto_16004 ?auto_16001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16031 - OBJ
      ?auto_16032 - OBJ
      ?auto_16033 - OBJ
      ?auto_16034 - OBJ
      ?auto_16030 - LOCATION
    )
    :vars
    (
      ?auto_16037 - LOCATION
      ?auto_16036 - CITY
      ?auto_16035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16037 ?auto_16036 ) ( IN-CITY ?auto_16030 ?auto_16036 ) ( not ( = ?auto_16030 ?auto_16037 ) ) ( OBJ-AT ?auto_16033 ?auto_16030 ) ( not ( = ?auto_16033 ?auto_16034 ) ) ( OBJ-AT ?auto_16034 ?auto_16037 ) ( TRUCK-AT ?auto_16035 ?auto_16030 ) ( OBJ-AT ?auto_16031 ?auto_16030 ) ( OBJ-AT ?auto_16032 ?auto_16030 ) ( not ( = ?auto_16031 ?auto_16032 ) ) ( not ( = ?auto_16031 ?auto_16033 ) ) ( not ( = ?auto_16031 ?auto_16034 ) ) ( not ( = ?auto_16032 ?auto_16033 ) ) ( not ( = ?auto_16032 ?auto_16034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16033 ?auto_16034 ?auto_16030 )
      ( DELIVER-4PKG-VERIFY ?auto_16031 ?auto_16032 ?auto_16033 ?auto_16034 ?auto_16030 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16039 - OBJ
      ?auto_16040 - OBJ
      ?auto_16041 - OBJ
      ?auto_16042 - OBJ
      ?auto_16038 - LOCATION
    )
    :vars
    (
      ?auto_16045 - LOCATION
      ?auto_16044 - CITY
      ?auto_16043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16045 ?auto_16044 ) ( IN-CITY ?auto_16038 ?auto_16044 ) ( not ( = ?auto_16038 ?auto_16045 ) ) ( OBJ-AT ?auto_16042 ?auto_16038 ) ( not ( = ?auto_16042 ?auto_16041 ) ) ( OBJ-AT ?auto_16041 ?auto_16045 ) ( TRUCK-AT ?auto_16043 ?auto_16038 ) ( OBJ-AT ?auto_16039 ?auto_16038 ) ( OBJ-AT ?auto_16040 ?auto_16038 ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16041 ) ) ( not ( = ?auto_16039 ?auto_16042 ) ) ( not ( = ?auto_16040 ?auto_16041 ) ) ( not ( = ?auto_16040 ?auto_16042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16042 ?auto_16041 ?auto_16038 )
      ( DELIVER-4PKG-VERIFY ?auto_16039 ?auto_16040 ?auto_16041 ?auto_16042 ?auto_16038 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16055 - OBJ
      ?auto_16056 - OBJ
      ?auto_16057 - OBJ
      ?auto_16058 - OBJ
      ?auto_16054 - LOCATION
    )
    :vars
    (
      ?auto_16061 - LOCATION
      ?auto_16060 - CITY
      ?auto_16059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16061 ?auto_16060 ) ( IN-CITY ?auto_16054 ?auto_16060 ) ( not ( = ?auto_16054 ?auto_16061 ) ) ( OBJ-AT ?auto_16058 ?auto_16054 ) ( not ( = ?auto_16058 ?auto_16056 ) ) ( OBJ-AT ?auto_16056 ?auto_16061 ) ( TRUCK-AT ?auto_16059 ?auto_16054 ) ( OBJ-AT ?auto_16055 ?auto_16054 ) ( OBJ-AT ?auto_16057 ?auto_16054 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16058 ?auto_16056 ?auto_16054 )
      ( DELIVER-4PKG-VERIFY ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16087 - OBJ
      ?auto_16088 - OBJ
      ?auto_16089 - OBJ
      ?auto_16090 - OBJ
      ?auto_16086 - LOCATION
    )
    :vars
    (
      ?auto_16093 - LOCATION
      ?auto_16092 - CITY
      ?auto_16091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16093 ?auto_16092 ) ( IN-CITY ?auto_16086 ?auto_16092 ) ( not ( = ?auto_16086 ?auto_16093 ) ) ( OBJ-AT ?auto_16089 ?auto_16086 ) ( not ( = ?auto_16089 ?auto_16087 ) ) ( OBJ-AT ?auto_16087 ?auto_16093 ) ( TRUCK-AT ?auto_16091 ?auto_16086 ) ( OBJ-AT ?auto_16088 ?auto_16086 ) ( OBJ-AT ?auto_16090 ?auto_16086 ) ( not ( = ?auto_16087 ?auto_16088 ) ) ( not ( = ?auto_16087 ?auto_16090 ) ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16090 ) ) ( not ( = ?auto_16089 ?auto_16090 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16089 ?auto_16087 ?auto_16086 )
      ( DELIVER-4PKG-VERIFY ?auto_16087 ?auto_16088 ?auto_16089 ?auto_16090 ?auto_16086 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16152 - OBJ
      ?auto_16151 - LOCATION
    )
    :vars
    (
      ?auto_16156 - LOCATION
      ?auto_16154 - CITY
      ?auto_16155 - OBJ
      ?auto_16153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16156 ?auto_16154 ) ( IN-CITY ?auto_16151 ?auto_16154 ) ( not ( = ?auto_16151 ?auto_16156 ) ) ( not ( = ?auto_16155 ?auto_16152 ) ) ( OBJ-AT ?auto_16152 ?auto_16156 ) ( TRUCK-AT ?auto_16153 ?auto_16151 ) ( IN-TRUCK ?auto_16155 ?auto_16153 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16155 ?auto_16151 )
      ( DELIVER-2PKG ?auto_16155 ?auto_16152 ?auto_16151 )
      ( DELIVER-1PKG-VERIFY ?auto_16152 ?auto_16151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16158 - OBJ
      ?auto_16159 - OBJ
      ?auto_16157 - LOCATION
    )
    :vars
    (
      ?auto_16160 - LOCATION
      ?auto_16161 - CITY
      ?auto_16162 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16160 ?auto_16161 ) ( IN-CITY ?auto_16157 ?auto_16161 ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( OBJ-AT ?auto_16159 ?auto_16160 ) ( TRUCK-AT ?auto_16162 ?auto_16157 ) ( IN-TRUCK ?auto_16158 ?auto_16162 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16159 ?auto_16157 )
      ( DELIVER-2PKG-VERIFY ?auto_16158 ?auto_16159 ?auto_16157 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16164 - OBJ
      ?auto_16165 - OBJ
      ?auto_16163 - LOCATION
    )
    :vars
    (
      ?auto_16167 - LOCATION
      ?auto_16168 - CITY
      ?auto_16166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16167 ?auto_16168 ) ( IN-CITY ?auto_16163 ?auto_16168 ) ( not ( = ?auto_16163 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16164 ) ) ( OBJ-AT ?auto_16164 ?auto_16167 ) ( TRUCK-AT ?auto_16166 ?auto_16163 ) ( IN-TRUCK ?auto_16165 ?auto_16166 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16165 ?auto_16164 ?auto_16163 )
      ( DELIVER-2PKG-VERIFY ?auto_16164 ?auto_16165 ?auto_16163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16348 - OBJ
      ?auto_16347 - LOCATION
    )
    :vars
    (
      ?auto_16350 - LOCATION
      ?auto_16351 - CITY
      ?auto_16352 - OBJ
      ?auto_16349 - TRUCK
      ?auto_16353 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16350 ?auto_16351 ) ( IN-CITY ?auto_16347 ?auto_16351 ) ( not ( = ?auto_16347 ?auto_16350 ) ) ( not ( = ?auto_16352 ?auto_16348 ) ) ( OBJ-AT ?auto_16348 ?auto_16350 ) ( IN-TRUCK ?auto_16352 ?auto_16349 ) ( TRUCK-AT ?auto_16349 ?auto_16353 ) ( IN-CITY ?auto_16353 ?auto_16351 ) ( not ( = ?auto_16347 ?auto_16353 ) ) ( not ( = ?auto_16350 ?auto_16353 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16349 ?auto_16353 ?auto_16347 ?auto_16351 )
      ( DELIVER-2PKG ?auto_16352 ?auto_16348 ?auto_16347 )
      ( DELIVER-1PKG-VERIFY ?auto_16348 ?auto_16347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16355 - OBJ
      ?auto_16356 - OBJ
      ?auto_16354 - LOCATION
    )
    :vars
    (
      ?auto_16359 - LOCATION
      ?auto_16357 - CITY
      ?auto_16358 - TRUCK
      ?auto_16360 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16359 ?auto_16357 ) ( IN-CITY ?auto_16354 ?auto_16357 ) ( not ( = ?auto_16354 ?auto_16359 ) ) ( not ( = ?auto_16355 ?auto_16356 ) ) ( OBJ-AT ?auto_16356 ?auto_16359 ) ( IN-TRUCK ?auto_16355 ?auto_16358 ) ( TRUCK-AT ?auto_16358 ?auto_16360 ) ( IN-CITY ?auto_16360 ?auto_16357 ) ( not ( = ?auto_16354 ?auto_16360 ) ) ( not ( = ?auto_16359 ?auto_16360 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16356 ?auto_16354 )
      ( DELIVER-2PKG-VERIFY ?auto_16355 ?auto_16356 ?auto_16354 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16362 - OBJ
      ?auto_16363 - OBJ
      ?auto_16361 - LOCATION
    )
    :vars
    (
      ?auto_16367 - LOCATION
      ?auto_16365 - CITY
      ?auto_16366 - TRUCK
      ?auto_16364 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16367 ?auto_16365 ) ( IN-CITY ?auto_16361 ?auto_16365 ) ( not ( = ?auto_16361 ?auto_16367 ) ) ( not ( = ?auto_16363 ?auto_16362 ) ) ( OBJ-AT ?auto_16362 ?auto_16367 ) ( IN-TRUCK ?auto_16363 ?auto_16366 ) ( TRUCK-AT ?auto_16366 ?auto_16364 ) ( IN-CITY ?auto_16364 ?auto_16365 ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16367 ?auto_16364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16363 ?auto_16362 ?auto_16361 )
      ( DELIVER-2PKG-VERIFY ?auto_16362 ?auto_16363 ?auto_16361 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16570 - OBJ
      ?auto_16569 - LOCATION
    )
    :vars
    (
      ?auto_16574 - LOCATION
      ?auto_16572 - CITY
      ?auto_16575 - OBJ
      ?auto_16573 - TRUCK
      ?auto_16571 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16574 ?auto_16572 ) ( IN-CITY ?auto_16569 ?auto_16572 ) ( not ( = ?auto_16569 ?auto_16574 ) ) ( not ( = ?auto_16575 ?auto_16570 ) ) ( OBJ-AT ?auto_16570 ?auto_16574 ) ( TRUCK-AT ?auto_16573 ?auto_16571 ) ( IN-CITY ?auto_16571 ?auto_16572 ) ( not ( = ?auto_16569 ?auto_16571 ) ) ( not ( = ?auto_16574 ?auto_16571 ) ) ( OBJ-AT ?auto_16575 ?auto_16571 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16575 ?auto_16573 ?auto_16571 )
      ( DELIVER-2PKG ?auto_16575 ?auto_16570 ?auto_16569 )
      ( DELIVER-1PKG-VERIFY ?auto_16570 ?auto_16569 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16577 - OBJ
      ?auto_16578 - OBJ
      ?auto_16576 - LOCATION
    )
    :vars
    (
      ?auto_16582 - LOCATION
      ?auto_16581 - CITY
      ?auto_16580 - TRUCK
      ?auto_16579 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16582 ?auto_16581 ) ( IN-CITY ?auto_16576 ?auto_16581 ) ( not ( = ?auto_16576 ?auto_16582 ) ) ( not ( = ?auto_16577 ?auto_16578 ) ) ( OBJ-AT ?auto_16578 ?auto_16582 ) ( TRUCK-AT ?auto_16580 ?auto_16579 ) ( IN-CITY ?auto_16579 ?auto_16581 ) ( not ( = ?auto_16576 ?auto_16579 ) ) ( not ( = ?auto_16582 ?auto_16579 ) ) ( OBJ-AT ?auto_16577 ?auto_16579 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16578 ?auto_16576 )
      ( DELIVER-2PKG-VERIFY ?auto_16577 ?auto_16578 ?auto_16576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16584 - OBJ
      ?auto_16585 - OBJ
      ?auto_16583 - LOCATION
    )
    :vars
    (
      ?auto_16587 - LOCATION
      ?auto_16586 - CITY
      ?auto_16589 - TRUCK
      ?auto_16588 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16587 ?auto_16586 ) ( IN-CITY ?auto_16583 ?auto_16586 ) ( not ( = ?auto_16583 ?auto_16587 ) ) ( not ( = ?auto_16585 ?auto_16584 ) ) ( OBJ-AT ?auto_16584 ?auto_16587 ) ( TRUCK-AT ?auto_16589 ?auto_16588 ) ( IN-CITY ?auto_16588 ?auto_16586 ) ( not ( = ?auto_16583 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16588 ) ) ( OBJ-AT ?auto_16585 ?auto_16588 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16585 ?auto_16584 ?auto_16583 )
      ( DELIVER-2PKG-VERIFY ?auto_16584 ?auto_16585 ?auto_16583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17929 - OBJ
      ?auto_17930 - OBJ
      ?auto_17931 - OBJ
      ?auto_17928 - LOCATION
    )
    :vars
    (
      ?auto_17932 - TRUCK
      ?auto_17933 - LOCATION
      ?auto_17934 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17931 ?auto_17932 ) ( TRUCK-AT ?auto_17932 ?auto_17933 ) ( IN-CITY ?auto_17933 ?auto_17934 ) ( IN-CITY ?auto_17928 ?auto_17934 ) ( not ( = ?auto_17928 ?auto_17933 ) ) ( OBJ-AT ?auto_17930 ?auto_17928 ) ( not ( = ?auto_17930 ?auto_17931 ) ) ( OBJ-AT ?auto_17929 ?auto_17928 ) ( not ( = ?auto_17929 ?auto_17930 ) ) ( not ( = ?auto_17929 ?auto_17931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17930 ?auto_17931 ?auto_17928 )
      ( DELIVER-3PKG-VERIFY ?auto_17929 ?auto_17930 ?auto_17931 ?auto_17928 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17962 - OBJ
      ?auto_17963 - OBJ
      ?auto_17964 - OBJ
      ?auto_17961 - LOCATION
    )
    :vars
    (
      ?auto_17966 - TRUCK
      ?auto_17967 - LOCATION
      ?auto_17968 - CITY
      ?auto_17965 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17964 ?auto_17966 ) ( TRUCK-AT ?auto_17966 ?auto_17967 ) ( IN-CITY ?auto_17967 ?auto_17968 ) ( IN-CITY ?auto_17961 ?auto_17968 ) ( not ( = ?auto_17961 ?auto_17967 ) ) ( OBJ-AT ?auto_17965 ?auto_17961 ) ( not ( = ?auto_17965 ?auto_17964 ) ) ( OBJ-AT ?auto_17962 ?auto_17961 ) ( OBJ-AT ?auto_17963 ?auto_17961 ) ( not ( = ?auto_17962 ?auto_17963 ) ) ( not ( = ?auto_17962 ?auto_17964 ) ) ( not ( = ?auto_17962 ?auto_17965 ) ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17963 ?auto_17965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17965 ?auto_17964 ?auto_17961 )
      ( DELIVER-3PKG-VERIFY ?auto_17962 ?auto_17963 ?auto_17964 ?auto_17961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17974 - OBJ
      ?auto_17975 - OBJ
      ?auto_17976 - OBJ
      ?auto_17973 - LOCATION
    )
    :vars
    (
      ?auto_17978 - TRUCK
      ?auto_17979 - LOCATION
      ?auto_17980 - CITY
      ?auto_17977 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17975 ?auto_17978 ) ( TRUCK-AT ?auto_17978 ?auto_17979 ) ( IN-CITY ?auto_17979 ?auto_17980 ) ( IN-CITY ?auto_17973 ?auto_17980 ) ( not ( = ?auto_17973 ?auto_17979 ) ) ( OBJ-AT ?auto_17977 ?auto_17973 ) ( not ( = ?auto_17977 ?auto_17975 ) ) ( OBJ-AT ?auto_17974 ?auto_17973 ) ( OBJ-AT ?auto_17976 ?auto_17973 ) ( not ( = ?auto_17974 ?auto_17975 ) ) ( not ( = ?auto_17974 ?auto_17976 ) ) ( not ( = ?auto_17974 ?auto_17977 ) ) ( not ( = ?auto_17975 ?auto_17976 ) ) ( not ( = ?auto_17976 ?auto_17977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17977 ?auto_17975 ?auto_17973 )
      ( DELIVER-3PKG-VERIFY ?auto_17974 ?auto_17975 ?auto_17976 ?auto_17973 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18012 - OBJ
      ?auto_18013 - OBJ
      ?auto_18014 - OBJ
      ?auto_18011 - LOCATION
    )
    :vars
    (
      ?auto_18016 - TRUCK
      ?auto_18017 - LOCATION
      ?auto_18018 - CITY
      ?auto_18015 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18012 ?auto_18016 ) ( TRUCK-AT ?auto_18016 ?auto_18017 ) ( IN-CITY ?auto_18017 ?auto_18018 ) ( IN-CITY ?auto_18011 ?auto_18018 ) ( not ( = ?auto_18011 ?auto_18017 ) ) ( OBJ-AT ?auto_18015 ?auto_18011 ) ( not ( = ?auto_18015 ?auto_18012 ) ) ( OBJ-AT ?auto_18013 ?auto_18011 ) ( OBJ-AT ?auto_18014 ?auto_18011 ) ( not ( = ?auto_18012 ?auto_18013 ) ) ( not ( = ?auto_18012 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18015 ?auto_18012 ?auto_18011 )
      ( DELIVER-3PKG-VERIFY ?auto_18012 ?auto_18013 ?auto_18014 ?auto_18011 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18051 - OBJ
      ?auto_18052 - OBJ
      ?auto_18053 - OBJ
      ?auto_18054 - OBJ
      ?auto_18050 - LOCATION
    )
    :vars
    (
      ?auto_18055 - TRUCK
      ?auto_18056 - LOCATION
      ?auto_18057 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18054 ?auto_18055 ) ( TRUCK-AT ?auto_18055 ?auto_18056 ) ( IN-CITY ?auto_18056 ?auto_18057 ) ( IN-CITY ?auto_18050 ?auto_18057 ) ( not ( = ?auto_18050 ?auto_18056 ) ) ( OBJ-AT ?auto_18053 ?auto_18050 ) ( not ( = ?auto_18053 ?auto_18054 ) ) ( OBJ-AT ?auto_18051 ?auto_18050 ) ( OBJ-AT ?auto_18052 ?auto_18050 ) ( not ( = ?auto_18051 ?auto_18052 ) ) ( not ( = ?auto_18051 ?auto_18053 ) ) ( not ( = ?auto_18051 ?auto_18054 ) ) ( not ( = ?auto_18052 ?auto_18053 ) ) ( not ( = ?auto_18052 ?auto_18054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18053 ?auto_18054 ?auto_18050 )
      ( DELIVER-4PKG-VERIFY ?auto_18051 ?auto_18052 ?auto_18053 ?auto_18054 ?auto_18050 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18067 - OBJ
      ?auto_18068 - OBJ
      ?auto_18069 - OBJ
      ?auto_18070 - OBJ
      ?auto_18066 - LOCATION
    )
    :vars
    (
      ?auto_18071 - TRUCK
      ?auto_18072 - LOCATION
      ?auto_18073 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18069 ?auto_18071 ) ( TRUCK-AT ?auto_18071 ?auto_18072 ) ( IN-CITY ?auto_18072 ?auto_18073 ) ( IN-CITY ?auto_18066 ?auto_18073 ) ( not ( = ?auto_18066 ?auto_18072 ) ) ( OBJ-AT ?auto_18068 ?auto_18066 ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( OBJ-AT ?auto_18067 ?auto_18066 ) ( OBJ-AT ?auto_18070 ?auto_18066 ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18069 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18068 ?auto_18069 ?auto_18066 )
      ( DELIVER-4PKG-VERIFY ?auto_18067 ?auto_18068 ?auto_18069 ?auto_18070 ?auto_18066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18091 - OBJ
      ?auto_18092 - OBJ
      ?auto_18093 - OBJ
      ?auto_18094 - OBJ
      ?auto_18090 - LOCATION
    )
    :vars
    (
      ?auto_18095 - TRUCK
      ?auto_18096 - LOCATION
      ?auto_18097 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18094 ?auto_18095 ) ( TRUCK-AT ?auto_18095 ?auto_18096 ) ( IN-CITY ?auto_18096 ?auto_18097 ) ( IN-CITY ?auto_18090 ?auto_18097 ) ( not ( = ?auto_18090 ?auto_18096 ) ) ( OBJ-AT ?auto_18091 ?auto_18090 ) ( not ( = ?auto_18091 ?auto_18094 ) ) ( OBJ-AT ?auto_18092 ?auto_18090 ) ( OBJ-AT ?auto_18093 ?auto_18090 ) ( not ( = ?auto_18091 ?auto_18092 ) ) ( not ( = ?auto_18091 ?auto_18093 ) ) ( not ( = ?auto_18092 ?auto_18093 ) ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( not ( = ?auto_18093 ?auto_18094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18091 ?auto_18094 ?auto_18090 )
      ( DELIVER-4PKG-VERIFY ?auto_18091 ?auto_18092 ?auto_18093 ?auto_18094 ?auto_18090 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18107 - OBJ
      ?auto_18108 - OBJ
      ?auto_18109 - OBJ
      ?auto_18110 - OBJ
      ?auto_18106 - LOCATION
    )
    :vars
    (
      ?auto_18111 - TRUCK
      ?auto_18112 - LOCATION
      ?auto_18113 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18109 ?auto_18111 ) ( TRUCK-AT ?auto_18111 ?auto_18112 ) ( IN-CITY ?auto_18112 ?auto_18113 ) ( IN-CITY ?auto_18106 ?auto_18113 ) ( not ( = ?auto_18106 ?auto_18112 ) ) ( OBJ-AT ?auto_18107 ?auto_18106 ) ( not ( = ?auto_18107 ?auto_18109 ) ) ( OBJ-AT ?auto_18108 ?auto_18106 ) ( OBJ-AT ?auto_18110 ?auto_18106 ) ( not ( = ?auto_18107 ?auto_18108 ) ) ( not ( = ?auto_18107 ?auto_18110 ) ) ( not ( = ?auto_18108 ?auto_18109 ) ) ( not ( = ?auto_18108 ?auto_18110 ) ) ( not ( = ?auto_18109 ?auto_18110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18107 ?auto_18109 ?auto_18106 )
      ( DELIVER-4PKG-VERIFY ?auto_18107 ?auto_18108 ?auto_18109 ?auto_18110 ?auto_18106 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18131 - OBJ
      ?auto_18132 - OBJ
      ?auto_18133 - OBJ
      ?auto_18134 - OBJ
      ?auto_18130 - LOCATION
    )
    :vars
    (
      ?auto_18135 - TRUCK
      ?auto_18136 - LOCATION
      ?auto_18137 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18132 ?auto_18135 ) ( TRUCK-AT ?auto_18135 ?auto_18136 ) ( IN-CITY ?auto_18136 ?auto_18137 ) ( IN-CITY ?auto_18130 ?auto_18137 ) ( not ( = ?auto_18130 ?auto_18136 ) ) ( OBJ-AT ?auto_18134 ?auto_18130 ) ( not ( = ?auto_18134 ?auto_18132 ) ) ( OBJ-AT ?auto_18131 ?auto_18130 ) ( OBJ-AT ?auto_18133 ?auto_18130 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18133 ?auto_18134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18134 ?auto_18132 ?auto_18130 )
      ( DELIVER-4PKG-VERIFY ?auto_18131 ?auto_18132 ?auto_18133 ?auto_18134 ?auto_18130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18251 - OBJ
      ?auto_18252 - OBJ
      ?auto_18253 - OBJ
      ?auto_18254 - OBJ
      ?auto_18250 - LOCATION
    )
    :vars
    (
      ?auto_18256 - TRUCK
      ?auto_18257 - LOCATION
      ?auto_18258 - CITY
      ?auto_18255 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18254 ?auto_18256 ) ( TRUCK-AT ?auto_18256 ?auto_18257 ) ( IN-CITY ?auto_18257 ?auto_18258 ) ( IN-CITY ?auto_18250 ?auto_18258 ) ( not ( = ?auto_18250 ?auto_18257 ) ) ( OBJ-AT ?auto_18255 ?auto_18250 ) ( not ( = ?auto_18255 ?auto_18254 ) ) ( OBJ-AT ?auto_18251 ?auto_18250 ) ( OBJ-AT ?auto_18252 ?auto_18250 ) ( OBJ-AT ?auto_18253 ?auto_18250 ) ( not ( = ?auto_18251 ?auto_18252 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18254 ) ) ( not ( = ?auto_18251 ?auto_18255 ) ) ( not ( = ?auto_18252 ?auto_18253 ) ) ( not ( = ?auto_18252 ?auto_18254 ) ) ( not ( = ?auto_18252 ?auto_18255 ) ) ( not ( = ?auto_18253 ?auto_18254 ) ) ( not ( = ?auto_18253 ?auto_18255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18255 ?auto_18254 ?auto_18250 )
      ( DELIVER-4PKG-VERIFY ?auto_18251 ?auto_18252 ?auto_18253 ?auto_18254 ?auto_18250 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18268 - OBJ
      ?auto_18269 - OBJ
      ?auto_18270 - OBJ
      ?auto_18271 - OBJ
      ?auto_18267 - LOCATION
    )
    :vars
    (
      ?auto_18273 - TRUCK
      ?auto_18274 - LOCATION
      ?auto_18275 - CITY
      ?auto_18272 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18270 ?auto_18273 ) ( TRUCK-AT ?auto_18273 ?auto_18274 ) ( IN-CITY ?auto_18274 ?auto_18275 ) ( IN-CITY ?auto_18267 ?auto_18275 ) ( not ( = ?auto_18267 ?auto_18274 ) ) ( OBJ-AT ?auto_18272 ?auto_18267 ) ( not ( = ?auto_18272 ?auto_18270 ) ) ( OBJ-AT ?auto_18268 ?auto_18267 ) ( OBJ-AT ?auto_18269 ?auto_18267 ) ( OBJ-AT ?auto_18271 ?auto_18267 ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18271 ) ) ( not ( = ?auto_18268 ?auto_18272 ) ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( not ( = ?auto_18269 ?auto_18271 ) ) ( not ( = ?auto_18269 ?auto_18272 ) ) ( not ( = ?auto_18270 ?auto_18271 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18272 ?auto_18270 ?auto_18267 )
      ( DELIVER-4PKG-VERIFY ?auto_18268 ?auto_18269 ?auto_18270 ?auto_18271 ?auto_18267 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18286 - OBJ
      ?auto_18287 - OBJ
      ?auto_18288 - OBJ
      ?auto_18289 - OBJ
      ?auto_18285 - LOCATION
    )
    :vars
    (
      ?auto_18290 - TRUCK
      ?auto_18291 - LOCATION
      ?auto_18292 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18287 ?auto_18290 ) ( TRUCK-AT ?auto_18290 ?auto_18291 ) ( IN-CITY ?auto_18291 ?auto_18292 ) ( IN-CITY ?auto_18285 ?auto_18292 ) ( not ( = ?auto_18285 ?auto_18291 ) ) ( OBJ-AT ?auto_18288 ?auto_18285 ) ( not ( = ?auto_18288 ?auto_18287 ) ) ( OBJ-AT ?auto_18286 ?auto_18285 ) ( OBJ-AT ?auto_18289 ?auto_18285 ) ( not ( = ?auto_18286 ?auto_18287 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18289 ) ) ( not ( = ?auto_18287 ?auto_18289 ) ) ( not ( = ?auto_18288 ?auto_18289 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18288 ?auto_18287 ?auto_18285 )
      ( DELIVER-4PKG-VERIFY ?auto_18286 ?auto_18287 ?auto_18288 ?auto_18289 ?auto_18285 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18318 - OBJ
      ?auto_18319 - OBJ
      ?auto_18320 - OBJ
      ?auto_18321 - OBJ
      ?auto_18317 - LOCATION
    )
    :vars
    (
      ?auto_18323 - TRUCK
      ?auto_18324 - LOCATION
      ?auto_18325 - CITY
      ?auto_18322 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18319 ?auto_18323 ) ( TRUCK-AT ?auto_18323 ?auto_18324 ) ( IN-CITY ?auto_18324 ?auto_18325 ) ( IN-CITY ?auto_18317 ?auto_18325 ) ( not ( = ?auto_18317 ?auto_18324 ) ) ( OBJ-AT ?auto_18322 ?auto_18317 ) ( not ( = ?auto_18322 ?auto_18319 ) ) ( OBJ-AT ?auto_18318 ?auto_18317 ) ( OBJ-AT ?auto_18320 ?auto_18317 ) ( OBJ-AT ?auto_18321 ?auto_18317 ) ( not ( = ?auto_18318 ?auto_18319 ) ) ( not ( = ?auto_18318 ?auto_18320 ) ) ( not ( = ?auto_18318 ?auto_18321 ) ) ( not ( = ?auto_18318 ?auto_18322 ) ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18321 ) ) ( not ( = ?auto_18320 ?auto_18321 ) ) ( not ( = ?auto_18320 ?auto_18322 ) ) ( not ( = ?auto_18321 ?auto_18322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18322 ?auto_18319 ?auto_18317 )
      ( DELIVER-4PKG-VERIFY ?auto_18318 ?auto_18319 ?auto_18320 ?auto_18321 ?auto_18317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18362 - OBJ
      ?auto_18363 - OBJ
      ?auto_18364 - OBJ
      ?auto_18365 - OBJ
      ?auto_18361 - LOCATION
    )
    :vars
    (
      ?auto_18366 - TRUCK
      ?auto_18367 - LOCATION
      ?auto_18368 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18362 ?auto_18366 ) ( TRUCK-AT ?auto_18366 ?auto_18367 ) ( IN-CITY ?auto_18367 ?auto_18368 ) ( IN-CITY ?auto_18361 ?auto_18368 ) ( not ( = ?auto_18361 ?auto_18367 ) ) ( OBJ-AT ?auto_18363 ?auto_18361 ) ( not ( = ?auto_18363 ?auto_18362 ) ) ( OBJ-AT ?auto_18364 ?auto_18361 ) ( OBJ-AT ?auto_18365 ?auto_18361 ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18365 ) ) ( not ( = ?auto_18363 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18365 ) ) ( not ( = ?auto_18364 ?auto_18365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18363 ?auto_18362 ?auto_18361 )
      ( DELIVER-4PKG-VERIFY ?auto_18362 ?auto_18363 ?auto_18364 ?auto_18365 ?auto_18361 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18434 - OBJ
      ?auto_18435 - OBJ
      ?auto_18436 - OBJ
      ?auto_18437 - OBJ
      ?auto_18433 - LOCATION
    )
    :vars
    (
      ?auto_18438 - TRUCK
      ?auto_18439 - LOCATION
      ?auto_18440 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18434 ?auto_18438 ) ( TRUCK-AT ?auto_18438 ?auto_18439 ) ( IN-CITY ?auto_18439 ?auto_18440 ) ( IN-CITY ?auto_18433 ?auto_18440 ) ( not ( = ?auto_18433 ?auto_18439 ) ) ( OBJ-AT ?auto_18436 ?auto_18433 ) ( not ( = ?auto_18436 ?auto_18434 ) ) ( OBJ-AT ?auto_18435 ?auto_18433 ) ( OBJ-AT ?auto_18437 ?auto_18433 ) ( not ( = ?auto_18434 ?auto_18435 ) ) ( not ( = ?auto_18434 ?auto_18437 ) ) ( not ( = ?auto_18435 ?auto_18436 ) ) ( not ( = ?auto_18435 ?auto_18437 ) ) ( not ( = ?auto_18436 ?auto_18437 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18436 ?auto_18434 ?auto_18433 )
      ( DELIVER-4PKG-VERIFY ?auto_18434 ?auto_18435 ?auto_18436 ?auto_18437 ?auto_18433 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18466 - OBJ
      ?auto_18467 - OBJ
      ?auto_18468 - OBJ
      ?auto_18469 - OBJ
      ?auto_18465 - LOCATION
    )
    :vars
    (
      ?auto_18471 - TRUCK
      ?auto_18472 - LOCATION
      ?auto_18473 - CITY
      ?auto_18470 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18466 ?auto_18471 ) ( TRUCK-AT ?auto_18471 ?auto_18472 ) ( IN-CITY ?auto_18472 ?auto_18473 ) ( IN-CITY ?auto_18465 ?auto_18473 ) ( not ( = ?auto_18465 ?auto_18472 ) ) ( OBJ-AT ?auto_18470 ?auto_18465 ) ( not ( = ?auto_18470 ?auto_18466 ) ) ( OBJ-AT ?auto_18467 ?auto_18465 ) ( OBJ-AT ?auto_18468 ?auto_18465 ) ( OBJ-AT ?auto_18469 ?auto_18465 ) ( not ( = ?auto_18466 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18468 ) ) ( not ( = ?auto_18466 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18467 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18470 ) ) ( not ( = ?auto_18468 ?auto_18469 ) ) ( not ( = ?auto_18468 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18470 ?auto_18466 ?auto_18465 )
      ( DELIVER-4PKG-VERIFY ?auto_18466 ?auto_18467 ?auto_18468 ?auto_18469 ?auto_18465 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18617 - OBJ
      ?auto_18618 - OBJ
      ?auto_18619 - OBJ
      ?auto_18616 - LOCATION
    )
    :vars
    (
      ?auto_18622 - TRUCK
      ?auto_18620 - LOCATION
      ?auto_18621 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18622 ?auto_18620 ) ( IN-CITY ?auto_18620 ?auto_18621 ) ( IN-CITY ?auto_18616 ?auto_18621 ) ( not ( = ?auto_18616 ?auto_18620 ) ) ( OBJ-AT ?auto_18617 ?auto_18616 ) ( not ( = ?auto_18617 ?auto_18619 ) ) ( OBJ-AT ?auto_18619 ?auto_18620 ) ( OBJ-AT ?auto_18618 ?auto_18616 ) ( not ( = ?auto_18617 ?auto_18618 ) ) ( not ( = ?auto_18618 ?auto_18619 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18617 ?auto_18619 ?auto_18616 )
      ( DELIVER-3PKG-VERIFY ?auto_18617 ?auto_18618 ?auto_18619 ?auto_18616 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18628 - OBJ
      ?auto_18629 - OBJ
      ?auto_18630 - OBJ
      ?auto_18627 - LOCATION
    )
    :vars
    (
      ?auto_18633 - TRUCK
      ?auto_18631 - LOCATION
      ?auto_18632 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18633 ?auto_18631 ) ( IN-CITY ?auto_18631 ?auto_18632 ) ( IN-CITY ?auto_18627 ?auto_18632 ) ( not ( = ?auto_18627 ?auto_18631 ) ) ( OBJ-AT ?auto_18630 ?auto_18627 ) ( not ( = ?auto_18630 ?auto_18629 ) ) ( OBJ-AT ?auto_18629 ?auto_18631 ) ( OBJ-AT ?auto_18628 ?auto_18627 ) ( not ( = ?auto_18628 ?auto_18629 ) ) ( not ( = ?auto_18628 ?auto_18630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18630 ?auto_18629 ?auto_18627 )
      ( DELIVER-3PKG-VERIFY ?auto_18628 ?auto_18629 ?auto_18630 ?auto_18627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18650 - OBJ
      ?auto_18651 - OBJ
      ?auto_18652 - OBJ
      ?auto_18649 - LOCATION
    )
    :vars
    (
      ?auto_18655 - TRUCK
      ?auto_18653 - LOCATION
      ?auto_18654 - CITY
      ?auto_18656 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18655 ?auto_18653 ) ( IN-CITY ?auto_18653 ?auto_18654 ) ( IN-CITY ?auto_18649 ?auto_18654 ) ( not ( = ?auto_18649 ?auto_18653 ) ) ( OBJ-AT ?auto_18656 ?auto_18649 ) ( not ( = ?auto_18656 ?auto_18652 ) ) ( OBJ-AT ?auto_18652 ?auto_18653 ) ( OBJ-AT ?auto_18650 ?auto_18649 ) ( OBJ-AT ?auto_18651 ?auto_18649 ) ( not ( = ?auto_18650 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18650 ?auto_18656 ) ) ( not ( = ?auto_18651 ?auto_18652 ) ) ( not ( = ?auto_18651 ?auto_18656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18656 ?auto_18652 ?auto_18649 )
      ( DELIVER-3PKG-VERIFY ?auto_18650 ?auto_18651 ?auto_18652 ?auto_18649 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18662 - OBJ
      ?auto_18663 - OBJ
      ?auto_18664 - OBJ
      ?auto_18661 - LOCATION
    )
    :vars
    (
      ?auto_18667 - TRUCK
      ?auto_18665 - LOCATION
      ?auto_18666 - CITY
      ?auto_18668 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18667 ?auto_18665 ) ( IN-CITY ?auto_18665 ?auto_18666 ) ( IN-CITY ?auto_18661 ?auto_18666 ) ( not ( = ?auto_18661 ?auto_18665 ) ) ( OBJ-AT ?auto_18668 ?auto_18661 ) ( not ( = ?auto_18668 ?auto_18663 ) ) ( OBJ-AT ?auto_18663 ?auto_18665 ) ( OBJ-AT ?auto_18662 ?auto_18661 ) ( OBJ-AT ?auto_18664 ?auto_18661 ) ( not ( = ?auto_18662 ?auto_18663 ) ) ( not ( = ?auto_18662 ?auto_18664 ) ) ( not ( = ?auto_18662 ?auto_18668 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( not ( = ?auto_18664 ?auto_18668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18668 ?auto_18663 ?auto_18661 )
      ( DELIVER-3PKG-VERIFY ?auto_18662 ?auto_18663 ?auto_18664 ?auto_18661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18700 - OBJ
      ?auto_18701 - OBJ
      ?auto_18702 - OBJ
      ?auto_18699 - LOCATION
    )
    :vars
    (
      ?auto_18705 - TRUCK
      ?auto_18703 - LOCATION
      ?auto_18704 - CITY
      ?auto_18706 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18705 ?auto_18703 ) ( IN-CITY ?auto_18703 ?auto_18704 ) ( IN-CITY ?auto_18699 ?auto_18704 ) ( not ( = ?auto_18699 ?auto_18703 ) ) ( OBJ-AT ?auto_18706 ?auto_18699 ) ( not ( = ?auto_18706 ?auto_18700 ) ) ( OBJ-AT ?auto_18700 ?auto_18703 ) ( OBJ-AT ?auto_18701 ?auto_18699 ) ( OBJ-AT ?auto_18702 ?auto_18699 ) ( not ( = ?auto_18700 ?auto_18701 ) ) ( not ( = ?auto_18700 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18706 ) ) ( not ( = ?auto_18702 ?auto_18706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18706 ?auto_18700 ?auto_18699 )
      ( DELIVER-3PKG-VERIFY ?auto_18700 ?auto_18701 ?auto_18702 ?auto_18699 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18747 - OBJ
      ?auto_18748 - OBJ
      ?auto_18749 - OBJ
      ?auto_18750 - OBJ
      ?auto_18746 - LOCATION
    )
    :vars
    (
      ?auto_18753 - TRUCK
      ?auto_18751 - LOCATION
      ?auto_18752 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18753 ?auto_18751 ) ( IN-CITY ?auto_18751 ?auto_18752 ) ( IN-CITY ?auto_18746 ?auto_18752 ) ( not ( = ?auto_18746 ?auto_18751 ) ) ( OBJ-AT ?auto_18747 ?auto_18746 ) ( not ( = ?auto_18747 ?auto_18750 ) ) ( OBJ-AT ?auto_18750 ?auto_18751 ) ( OBJ-AT ?auto_18748 ?auto_18746 ) ( OBJ-AT ?auto_18749 ?auto_18746 ) ( not ( = ?auto_18747 ?auto_18748 ) ) ( not ( = ?auto_18747 ?auto_18749 ) ) ( not ( = ?auto_18748 ?auto_18749 ) ) ( not ( = ?auto_18748 ?auto_18750 ) ) ( not ( = ?auto_18749 ?auto_18750 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18747 ?auto_18750 ?auto_18746 )
      ( DELIVER-4PKG-VERIFY ?auto_18747 ?auto_18748 ?auto_18749 ?auto_18750 ?auto_18746 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18755 - OBJ
      ?auto_18756 - OBJ
      ?auto_18757 - OBJ
      ?auto_18758 - OBJ
      ?auto_18754 - LOCATION
    )
    :vars
    (
      ?auto_18761 - TRUCK
      ?auto_18759 - LOCATION
      ?auto_18760 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18761 ?auto_18759 ) ( IN-CITY ?auto_18759 ?auto_18760 ) ( IN-CITY ?auto_18754 ?auto_18760 ) ( not ( = ?auto_18754 ?auto_18759 ) ) ( OBJ-AT ?auto_18755 ?auto_18754 ) ( not ( = ?auto_18755 ?auto_18757 ) ) ( OBJ-AT ?auto_18757 ?auto_18759 ) ( OBJ-AT ?auto_18756 ?auto_18754 ) ( OBJ-AT ?auto_18758 ?auto_18754 ) ( not ( = ?auto_18755 ?auto_18756 ) ) ( not ( = ?auto_18755 ?auto_18758 ) ) ( not ( = ?auto_18756 ?auto_18757 ) ) ( not ( = ?auto_18756 ?auto_18758 ) ) ( not ( = ?auto_18757 ?auto_18758 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18755 ?auto_18757 ?auto_18754 )
      ( DELIVER-4PKG-VERIFY ?auto_18755 ?auto_18756 ?auto_18757 ?auto_18758 ?auto_18754 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18819 - OBJ
      ?auto_18820 - OBJ
      ?auto_18821 - OBJ
      ?auto_18822 - OBJ
      ?auto_18818 - LOCATION
    )
    :vars
    (
      ?auto_18825 - TRUCK
      ?auto_18823 - LOCATION
      ?auto_18824 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18825 ?auto_18823 ) ( IN-CITY ?auto_18823 ?auto_18824 ) ( IN-CITY ?auto_18818 ?auto_18824 ) ( not ( = ?auto_18818 ?auto_18823 ) ) ( OBJ-AT ?auto_18819 ?auto_18818 ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( OBJ-AT ?auto_18820 ?auto_18823 ) ( OBJ-AT ?auto_18821 ?auto_18818 ) ( OBJ-AT ?auto_18822 ?auto_18818 ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18822 ) ) ( not ( = ?auto_18820 ?auto_18821 ) ) ( not ( = ?auto_18820 ?auto_18822 ) ) ( not ( = ?auto_18821 ?auto_18822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18819 ?auto_18820 ?auto_18818 )
      ( DELIVER-4PKG-VERIFY ?auto_18819 ?auto_18820 ?auto_18821 ?auto_18822 ?auto_18818 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18931 - OBJ
      ?auto_18932 - OBJ
      ?auto_18933 - OBJ
      ?auto_18934 - OBJ
      ?auto_18930 - LOCATION
    )
    :vars
    (
      ?auto_18937 - TRUCK
      ?auto_18935 - LOCATION
      ?auto_18936 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18937 ?auto_18935 ) ( IN-CITY ?auto_18935 ?auto_18936 ) ( IN-CITY ?auto_18930 ?auto_18936 ) ( not ( = ?auto_18930 ?auto_18935 ) ) ( OBJ-AT ?auto_18933 ?auto_18930 ) ( not ( = ?auto_18933 ?auto_18934 ) ) ( OBJ-AT ?auto_18934 ?auto_18935 ) ( OBJ-AT ?auto_18931 ?auto_18930 ) ( OBJ-AT ?auto_18932 ?auto_18930 ) ( not ( = ?auto_18931 ?auto_18932 ) ) ( not ( = ?auto_18931 ?auto_18933 ) ) ( not ( = ?auto_18931 ?auto_18934 ) ) ( not ( = ?auto_18932 ?auto_18933 ) ) ( not ( = ?auto_18932 ?auto_18934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18933 ?auto_18934 ?auto_18930 )
      ( DELIVER-4PKG-VERIFY ?auto_18931 ?auto_18932 ?auto_18933 ?auto_18934 ?auto_18930 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18939 - OBJ
      ?auto_18940 - OBJ
      ?auto_18941 - OBJ
      ?auto_18942 - OBJ
      ?auto_18938 - LOCATION
    )
    :vars
    (
      ?auto_18945 - TRUCK
      ?auto_18943 - LOCATION
      ?auto_18944 - CITY
      ?auto_18946 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18945 ?auto_18943 ) ( IN-CITY ?auto_18943 ?auto_18944 ) ( IN-CITY ?auto_18938 ?auto_18944 ) ( not ( = ?auto_18938 ?auto_18943 ) ) ( OBJ-AT ?auto_18946 ?auto_18938 ) ( not ( = ?auto_18946 ?auto_18942 ) ) ( OBJ-AT ?auto_18942 ?auto_18943 ) ( OBJ-AT ?auto_18939 ?auto_18938 ) ( OBJ-AT ?auto_18940 ?auto_18938 ) ( OBJ-AT ?auto_18941 ?auto_18938 ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18942 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( not ( = ?auto_18940 ?auto_18941 ) ) ( not ( = ?auto_18940 ?auto_18942 ) ) ( not ( = ?auto_18940 ?auto_18946 ) ) ( not ( = ?auto_18941 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18946 ?auto_18942 ?auto_18938 )
      ( DELIVER-4PKG-VERIFY ?auto_18939 ?auto_18940 ?auto_18941 ?auto_18942 ?auto_18938 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18948 - OBJ
      ?auto_18949 - OBJ
      ?auto_18950 - OBJ
      ?auto_18951 - OBJ
      ?auto_18947 - LOCATION
    )
    :vars
    (
      ?auto_18954 - TRUCK
      ?auto_18952 - LOCATION
      ?auto_18953 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18954 ?auto_18952 ) ( IN-CITY ?auto_18952 ?auto_18953 ) ( IN-CITY ?auto_18947 ?auto_18953 ) ( not ( = ?auto_18947 ?auto_18952 ) ) ( OBJ-AT ?auto_18951 ?auto_18947 ) ( not ( = ?auto_18951 ?auto_18950 ) ) ( OBJ-AT ?auto_18950 ?auto_18952 ) ( OBJ-AT ?auto_18948 ?auto_18947 ) ( OBJ-AT ?auto_18949 ?auto_18947 ) ( not ( = ?auto_18948 ?auto_18949 ) ) ( not ( = ?auto_18948 ?auto_18950 ) ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( not ( = ?auto_18949 ?auto_18950 ) ) ( not ( = ?auto_18949 ?auto_18951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18951 ?auto_18950 ?auto_18947 )
      ( DELIVER-4PKG-VERIFY ?auto_18948 ?auto_18949 ?auto_18950 ?auto_18951 ?auto_18947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18956 - OBJ
      ?auto_18957 - OBJ
      ?auto_18958 - OBJ
      ?auto_18959 - OBJ
      ?auto_18955 - LOCATION
    )
    :vars
    (
      ?auto_18962 - TRUCK
      ?auto_18960 - LOCATION
      ?auto_18961 - CITY
      ?auto_18963 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18962 ?auto_18960 ) ( IN-CITY ?auto_18960 ?auto_18961 ) ( IN-CITY ?auto_18955 ?auto_18961 ) ( not ( = ?auto_18955 ?auto_18960 ) ) ( OBJ-AT ?auto_18963 ?auto_18955 ) ( not ( = ?auto_18963 ?auto_18958 ) ) ( OBJ-AT ?auto_18958 ?auto_18960 ) ( OBJ-AT ?auto_18956 ?auto_18955 ) ( OBJ-AT ?auto_18957 ?auto_18955 ) ( OBJ-AT ?auto_18959 ?auto_18955 ) ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18956 ?auto_18958 ) ) ( not ( = ?auto_18956 ?auto_18959 ) ) ( not ( = ?auto_18956 ?auto_18963 ) ) ( not ( = ?auto_18957 ?auto_18958 ) ) ( not ( = ?auto_18957 ?auto_18959 ) ) ( not ( = ?auto_18957 ?auto_18963 ) ) ( not ( = ?auto_18958 ?auto_18959 ) ) ( not ( = ?auto_18959 ?auto_18963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18963 ?auto_18958 ?auto_18955 )
      ( DELIVER-4PKG-VERIFY ?auto_18956 ?auto_18957 ?auto_18958 ?auto_18959 ?auto_18955 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18974 - OBJ
      ?auto_18975 - OBJ
      ?auto_18976 - OBJ
      ?auto_18977 - OBJ
      ?auto_18973 - LOCATION
    )
    :vars
    (
      ?auto_18980 - TRUCK
      ?auto_18978 - LOCATION
      ?auto_18979 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18980 ?auto_18978 ) ( IN-CITY ?auto_18978 ?auto_18979 ) ( IN-CITY ?auto_18973 ?auto_18979 ) ( not ( = ?auto_18973 ?auto_18978 ) ) ( OBJ-AT ?auto_18976 ?auto_18973 ) ( not ( = ?auto_18976 ?auto_18975 ) ) ( OBJ-AT ?auto_18975 ?auto_18978 ) ( OBJ-AT ?auto_18974 ?auto_18973 ) ( OBJ-AT ?auto_18977 ?auto_18973 ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18976 ?auto_18975 ?auto_18973 )
      ( DELIVER-4PKG-VERIFY ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19006 - OBJ
      ?auto_19007 - OBJ
      ?auto_19008 - OBJ
      ?auto_19009 - OBJ
      ?auto_19005 - LOCATION
    )
    :vars
    (
      ?auto_19012 - TRUCK
      ?auto_19010 - LOCATION
      ?auto_19011 - CITY
      ?auto_19013 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19012 ?auto_19010 ) ( IN-CITY ?auto_19010 ?auto_19011 ) ( IN-CITY ?auto_19005 ?auto_19011 ) ( not ( = ?auto_19005 ?auto_19010 ) ) ( OBJ-AT ?auto_19013 ?auto_19005 ) ( not ( = ?auto_19013 ?auto_19007 ) ) ( OBJ-AT ?auto_19007 ?auto_19010 ) ( OBJ-AT ?auto_19006 ?auto_19005 ) ( OBJ-AT ?auto_19008 ?auto_19005 ) ( OBJ-AT ?auto_19009 ?auto_19005 ) ( not ( = ?auto_19006 ?auto_19007 ) ) ( not ( = ?auto_19006 ?auto_19008 ) ) ( not ( = ?auto_19006 ?auto_19009 ) ) ( not ( = ?auto_19006 ?auto_19013 ) ) ( not ( = ?auto_19007 ?auto_19008 ) ) ( not ( = ?auto_19007 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19013 ) ) ( not ( = ?auto_19009 ?auto_19013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19013 ?auto_19007 ?auto_19005 )
      ( DELIVER-4PKG-VERIFY ?auto_19006 ?auto_19007 ?auto_19008 ?auto_19009 ?auto_19005 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19050 - OBJ
      ?auto_19051 - OBJ
      ?auto_19052 - OBJ
      ?auto_19053 - OBJ
      ?auto_19049 - LOCATION
    )
    :vars
    (
      ?auto_19056 - TRUCK
      ?auto_19054 - LOCATION
      ?auto_19055 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19056 ?auto_19054 ) ( IN-CITY ?auto_19054 ?auto_19055 ) ( IN-CITY ?auto_19049 ?auto_19055 ) ( not ( = ?auto_19049 ?auto_19054 ) ) ( OBJ-AT ?auto_19051 ?auto_19049 ) ( not ( = ?auto_19051 ?auto_19050 ) ) ( OBJ-AT ?auto_19050 ?auto_19054 ) ( OBJ-AT ?auto_19052 ?auto_19049 ) ( OBJ-AT ?auto_19053 ?auto_19049 ) ( not ( = ?auto_19050 ?auto_19052 ) ) ( not ( = ?auto_19050 ?auto_19053 ) ) ( not ( = ?auto_19051 ?auto_19052 ) ) ( not ( = ?auto_19051 ?auto_19053 ) ) ( not ( = ?auto_19052 ?auto_19053 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19051 ?auto_19050 ?auto_19049 )
      ( DELIVER-4PKG-VERIFY ?auto_19050 ?auto_19051 ?auto_19052 ?auto_19053 ?auto_19049 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19122 - OBJ
      ?auto_19123 - OBJ
      ?auto_19124 - OBJ
      ?auto_19125 - OBJ
      ?auto_19121 - LOCATION
    )
    :vars
    (
      ?auto_19128 - TRUCK
      ?auto_19126 - LOCATION
      ?auto_19127 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19128 ?auto_19126 ) ( IN-CITY ?auto_19126 ?auto_19127 ) ( IN-CITY ?auto_19121 ?auto_19127 ) ( not ( = ?auto_19121 ?auto_19126 ) ) ( OBJ-AT ?auto_19125 ?auto_19121 ) ( not ( = ?auto_19125 ?auto_19122 ) ) ( OBJ-AT ?auto_19122 ?auto_19126 ) ( OBJ-AT ?auto_19123 ?auto_19121 ) ( OBJ-AT ?auto_19124 ?auto_19121 ) ( not ( = ?auto_19122 ?auto_19123 ) ) ( not ( = ?auto_19122 ?auto_19124 ) ) ( not ( = ?auto_19123 ?auto_19124 ) ) ( not ( = ?auto_19123 ?auto_19125 ) ) ( not ( = ?auto_19124 ?auto_19125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19125 ?auto_19122 ?auto_19121 )
      ( DELIVER-4PKG-VERIFY ?auto_19122 ?auto_19123 ?auto_19124 ?auto_19125 ?auto_19121 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19154 - OBJ
      ?auto_19155 - OBJ
      ?auto_19156 - OBJ
      ?auto_19157 - OBJ
      ?auto_19153 - LOCATION
    )
    :vars
    (
      ?auto_19160 - TRUCK
      ?auto_19158 - LOCATION
      ?auto_19159 - CITY
      ?auto_19161 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19160 ?auto_19158 ) ( IN-CITY ?auto_19158 ?auto_19159 ) ( IN-CITY ?auto_19153 ?auto_19159 ) ( not ( = ?auto_19153 ?auto_19158 ) ) ( OBJ-AT ?auto_19161 ?auto_19153 ) ( not ( = ?auto_19161 ?auto_19154 ) ) ( OBJ-AT ?auto_19154 ?auto_19158 ) ( OBJ-AT ?auto_19155 ?auto_19153 ) ( OBJ-AT ?auto_19156 ?auto_19153 ) ( OBJ-AT ?auto_19157 ?auto_19153 ) ( not ( = ?auto_19154 ?auto_19155 ) ) ( not ( = ?auto_19154 ?auto_19156 ) ) ( not ( = ?auto_19154 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19156 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19161 ) ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( not ( = ?auto_19156 ?auto_19161 ) ) ( not ( = ?auto_19157 ?auto_19161 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19161 ?auto_19154 ?auto_19153 )
      ( DELIVER-4PKG-VERIFY ?auto_19154 ?auto_19155 ?auto_19156 ?auto_19157 ?auto_19153 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19305 - OBJ
      ?auto_19306 - OBJ
      ?auto_19307 - OBJ
      ?auto_19304 - LOCATION
    )
    :vars
    (
      ?auto_19310 - LOCATION
      ?auto_19308 - CITY
      ?auto_19309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19310 ?auto_19308 ) ( IN-CITY ?auto_19304 ?auto_19308 ) ( not ( = ?auto_19304 ?auto_19310 ) ) ( OBJ-AT ?auto_19305 ?auto_19304 ) ( not ( = ?auto_19305 ?auto_19307 ) ) ( OBJ-AT ?auto_19307 ?auto_19310 ) ( TRUCK-AT ?auto_19309 ?auto_19304 ) ( OBJ-AT ?auto_19306 ?auto_19304 ) ( not ( = ?auto_19305 ?auto_19306 ) ) ( not ( = ?auto_19306 ?auto_19307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19305 ?auto_19307 ?auto_19304 )
      ( DELIVER-3PKG-VERIFY ?auto_19305 ?auto_19306 ?auto_19307 ?auto_19304 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19316 - OBJ
      ?auto_19317 - OBJ
      ?auto_19318 - OBJ
      ?auto_19315 - LOCATION
    )
    :vars
    (
      ?auto_19321 - LOCATION
      ?auto_19319 - CITY
      ?auto_19320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19321 ?auto_19319 ) ( IN-CITY ?auto_19315 ?auto_19319 ) ( not ( = ?auto_19315 ?auto_19321 ) ) ( OBJ-AT ?auto_19318 ?auto_19315 ) ( not ( = ?auto_19318 ?auto_19317 ) ) ( OBJ-AT ?auto_19317 ?auto_19321 ) ( TRUCK-AT ?auto_19320 ?auto_19315 ) ( OBJ-AT ?auto_19316 ?auto_19315 ) ( not ( = ?auto_19316 ?auto_19317 ) ) ( not ( = ?auto_19316 ?auto_19318 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19318 ?auto_19317 ?auto_19315 )
      ( DELIVER-3PKG-VERIFY ?auto_19316 ?auto_19317 ?auto_19318 ?auto_19315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19338 - OBJ
      ?auto_19339 - OBJ
      ?auto_19340 - OBJ
      ?auto_19337 - LOCATION
    )
    :vars
    (
      ?auto_19343 - LOCATION
      ?auto_19341 - CITY
      ?auto_19344 - OBJ
      ?auto_19342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19343 ?auto_19341 ) ( IN-CITY ?auto_19337 ?auto_19341 ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( OBJ-AT ?auto_19344 ?auto_19337 ) ( not ( = ?auto_19344 ?auto_19340 ) ) ( OBJ-AT ?auto_19340 ?auto_19343 ) ( TRUCK-AT ?auto_19342 ?auto_19337 ) ( OBJ-AT ?auto_19338 ?auto_19337 ) ( OBJ-AT ?auto_19339 ?auto_19337 ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19344 ) ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19344 ?auto_19340 ?auto_19337 )
      ( DELIVER-3PKG-VERIFY ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19337 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19350 - OBJ
      ?auto_19351 - OBJ
      ?auto_19352 - OBJ
      ?auto_19349 - LOCATION
    )
    :vars
    (
      ?auto_19355 - LOCATION
      ?auto_19353 - CITY
      ?auto_19356 - OBJ
      ?auto_19354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19355 ?auto_19353 ) ( IN-CITY ?auto_19349 ?auto_19353 ) ( not ( = ?auto_19349 ?auto_19355 ) ) ( OBJ-AT ?auto_19356 ?auto_19349 ) ( not ( = ?auto_19356 ?auto_19351 ) ) ( OBJ-AT ?auto_19351 ?auto_19355 ) ( TRUCK-AT ?auto_19354 ?auto_19349 ) ( OBJ-AT ?auto_19350 ?auto_19349 ) ( OBJ-AT ?auto_19352 ?auto_19349 ) ( not ( = ?auto_19350 ?auto_19351 ) ) ( not ( = ?auto_19350 ?auto_19352 ) ) ( not ( = ?auto_19350 ?auto_19356 ) ) ( not ( = ?auto_19351 ?auto_19352 ) ) ( not ( = ?auto_19352 ?auto_19356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19356 ?auto_19351 ?auto_19349 )
      ( DELIVER-3PKG-VERIFY ?auto_19350 ?auto_19351 ?auto_19352 ?auto_19349 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19388 - OBJ
      ?auto_19389 - OBJ
      ?auto_19390 - OBJ
      ?auto_19387 - LOCATION
    )
    :vars
    (
      ?auto_19393 - LOCATION
      ?auto_19391 - CITY
      ?auto_19394 - OBJ
      ?auto_19392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19393 ?auto_19391 ) ( IN-CITY ?auto_19387 ?auto_19391 ) ( not ( = ?auto_19387 ?auto_19393 ) ) ( OBJ-AT ?auto_19394 ?auto_19387 ) ( not ( = ?auto_19394 ?auto_19388 ) ) ( OBJ-AT ?auto_19388 ?auto_19393 ) ( TRUCK-AT ?auto_19392 ?auto_19387 ) ( OBJ-AT ?auto_19389 ?auto_19387 ) ( OBJ-AT ?auto_19390 ?auto_19387 ) ( not ( = ?auto_19388 ?auto_19389 ) ) ( not ( = ?auto_19388 ?auto_19390 ) ) ( not ( = ?auto_19389 ?auto_19390 ) ) ( not ( = ?auto_19389 ?auto_19394 ) ) ( not ( = ?auto_19390 ?auto_19394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19394 ?auto_19388 ?auto_19387 )
      ( DELIVER-3PKG-VERIFY ?auto_19388 ?auto_19389 ?auto_19390 ?auto_19387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19435 - OBJ
      ?auto_19436 - OBJ
      ?auto_19437 - OBJ
      ?auto_19438 - OBJ
      ?auto_19434 - LOCATION
    )
    :vars
    (
      ?auto_19441 - LOCATION
      ?auto_19439 - CITY
      ?auto_19440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19441 ?auto_19439 ) ( IN-CITY ?auto_19434 ?auto_19439 ) ( not ( = ?auto_19434 ?auto_19441 ) ) ( OBJ-AT ?auto_19435 ?auto_19434 ) ( not ( = ?auto_19435 ?auto_19438 ) ) ( OBJ-AT ?auto_19438 ?auto_19441 ) ( TRUCK-AT ?auto_19440 ?auto_19434 ) ( OBJ-AT ?auto_19436 ?auto_19434 ) ( OBJ-AT ?auto_19437 ?auto_19434 ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19436 ?auto_19438 ) ) ( not ( = ?auto_19437 ?auto_19438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19435 ?auto_19438 ?auto_19434 )
      ( DELIVER-4PKG-VERIFY ?auto_19435 ?auto_19436 ?auto_19437 ?auto_19438 ?auto_19434 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19443 - OBJ
      ?auto_19444 - OBJ
      ?auto_19445 - OBJ
      ?auto_19446 - OBJ
      ?auto_19442 - LOCATION
    )
    :vars
    (
      ?auto_19449 - LOCATION
      ?auto_19447 - CITY
      ?auto_19448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19449 ?auto_19447 ) ( IN-CITY ?auto_19442 ?auto_19447 ) ( not ( = ?auto_19442 ?auto_19449 ) ) ( OBJ-AT ?auto_19443 ?auto_19442 ) ( not ( = ?auto_19443 ?auto_19445 ) ) ( OBJ-AT ?auto_19445 ?auto_19449 ) ( TRUCK-AT ?auto_19448 ?auto_19442 ) ( OBJ-AT ?auto_19444 ?auto_19442 ) ( OBJ-AT ?auto_19446 ?auto_19442 ) ( not ( = ?auto_19443 ?auto_19444 ) ) ( not ( = ?auto_19443 ?auto_19446 ) ) ( not ( = ?auto_19444 ?auto_19445 ) ) ( not ( = ?auto_19444 ?auto_19446 ) ) ( not ( = ?auto_19445 ?auto_19446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19443 ?auto_19445 ?auto_19442 )
      ( DELIVER-4PKG-VERIFY ?auto_19443 ?auto_19444 ?auto_19445 ?auto_19446 ?auto_19442 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19451 - OBJ
      ?auto_19452 - OBJ
      ?auto_19453 - OBJ
      ?auto_19454 - OBJ
      ?auto_19450 - LOCATION
    )
    :vars
    (
      ?auto_19457 - LOCATION
      ?auto_19455 - CITY
      ?auto_19456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19457 ?auto_19455 ) ( IN-CITY ?auto_19450 ?auto_19455 ) ( not ( = ?auto_19450 ?auto_19457 ) ) ( OBJ-AT ?auto_19452 ?auto_19450 ) ( not ( = ?auto_19452 ?auto_19453 ) ) ( OBJ-AT ?auto_19453 ?auto_19457 ) ( TRUCK-AT ?auto_19456 ?auto_19450 ) ( OBJ-AT ?auto_19451 ?auto_19450 ) ( OBJ-AT ?auto_19454 ?auto_19450 ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( not ( = ?auto_19451 ?auto_19453 ) ) ( not ( = ?auto_19451 ?auto_19454 ) ) ( not ( = ?auto_19452 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19452 ?auto_19453 ?auto_19450 )
      ( DELIVER-4PKG-VERIFY ?auto_19451 ?auto_19452 ?auto_19453 ?auto_19454 ?auto_19450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19507 - OBJ
      ?auto_19508 - OBJ
      ?auto_19509 - OBJ
      ?auto_19510 - OBJ
      ?auto_19506 - LOCATION
    )
    :vars
    (
      ?auto_19513 - LOCATION
      ?auto_19511 - CITY
      ?auto_19512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19513 ?auto_19511 ) ( IN-CITY ?auto_19506 ?auto_19511 ) ( not ( = ?auto_19506 ?auto_19513 ) ) ( OBJ-AT ?auto_19509 ?auto_19506 ) ( not ( = ?auto_19509 ?auto_19508 ) ) ( OBJ-AT ?auto_19508 ?auto_19513 ) ( TRUCK-AT ?auto_19512 ?auto_19506 ) ( OBJ-AT ?auto_19507 ?auto_19506 ) ( OBJ-AT ?auto_19510 ?auto_19506 ) ( not ( = ?auto_19507 ?auto_19508 ) ) ( not ( = ?auto_19507 ?auto_19509 ) ) ( not ( = ?auto_19507 ?auto_19510 ) ) ( not ( = ?auto_19508 ?auto_19510 ) ) ( not ( = ?auto_19509 ?auto_19510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19509 ?auto_19508 ?auto_19506 )
      ( DELIVER-4PKG-VERIFY ?auto_19507 ?auto_19508 ?auto_19509 ?auto_19510 ?auto_19506 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19531 - OBJ
      ?auto_19532 - OBJ
      ?auto_19533 - OBJ
      ?auto_19534 - OBJ
      ?auto_19530 - LOCATION
    )
    :vars
    (
      ?auto_19537 - LOCATION
      ?auto_19535 - CITY
      ?auto_19536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19537 ?auto_19535 ) ( IN-CITY ?auto_19530 ?auto_19535 ) ( not ( = ?auto_19530 ?auto_19537 ) ) ( OBJ-AT ?auto_19531 ?auto_19530 ) ( not ( = ?auto_19531 ?auto_19532 ) ) ( OBJ-AT ?auto_19532 ?auto_19537 ) ( TRUCK-AT ?auto_19536 ?auto_19530 ) ( OBJ-AT ?auto_19533 ?auto_19530 ) ( OBJ-AT ?auto_19534 ?auto_19530 ) ( not ( = ?auto_19531 ?auto_19533 ) ) ( not ( = ?auto_19531 ?auto_19534 ) ) ( not ( = ?auto_19532 ?auto_19533 ) ) ( not ( = ?auto_19532 ?auto_19534 ) ) ( not ( = ?auto_19533 ?auto_19534 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19531 ?auto_19532 ?auto_19530 )
      ( DELIVER-4PKG-VERIFY ?auto_19531 ?auto_19532 ?auto_19533 ?auto_19534 ?auto_19530 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19579 - OBJ
      ?auto_19580 - OBJ
      ?auto_19581 - OBJ
      ?auto_19582 - OBJ
      ?auto_19578 - LOCATION
    )
    :vars
    (
      ?auto_19585 - LOCATION
      ?auto_19583 - CITY
      ?auto_19584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19585 ?auto_19583 ) ( IN-CITY ?auto_19578 ?auto_19583 ) ( not ( = ?auto_19578 ?auto_19585 ) ) ( OBJ-AT ?auto_19580 ?auto_19578 ) ( not ( = ?auto_19580 ?auto_19582 ) ) ( OBJ-AT ?auto_19582 ?auto_19585 ) ( TRUCK-AT ?auto_19584 ?auto_19578 ) ( OBJ-AT ?auto_19579 ?auto_19578 ) ( OBJ-AT ?auto_19581 ?auto_19578 ) ( not ( = ?auto_19579 ?auto_19580 ) ) ( not ( = ?auto_19579 ?auto_19581 ) ) ( not ( = ?auto_19579 ?auto_19582 ) ) ( not ( = ?auto_19580 ?auto_19581 ) ) ( not ( = ?auto_19581 ?auto_19582 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19580 ?auto_19582 ?auto_19578 )
      ( DELIVER-4PKG-VERIFY ?auto_19579 ?auto_19580 ?auto_19581 ?auto_19582 ?auto_19578 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19627 - OBJ
      ?auto_19628 - OBJ
      ?auto_19629 - OBJ
      ?auto_19630 - OBJ
      ?auto_19626 - LOCATION
    )
    :vars
    (
      ?auto_19633 - LOCATION
      ?auto_19631 - CITY
      ?auto_19634 - OBJ
      ?auto_19632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19633 ?auto_19631 ) ( IN-CITY ?auto_19626 ?auto_19631 ) ( not ( = ?auto_19626 ?auto_19633 ) ) ( OBJ-AT ?auto_19634 ?auto_19626 ) ( not ( = ?auto_19634 ?auto_19630 ) ) ( OBJ-AT ?auto_19630 ?auto_19633 ) ( TRUCK-AT ?auto_19632 ?auto_19626 ) ( OBJ-AT ?auto_19627 ?auto_19626 ) ( OBJ-AT ?auto_19628 ?auto_19626 ) ( OBJ-AT ?auto_19629 ?auto_19626 ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19627 ?auto_19630 ) ) ( not ( = ?auto_19627 ?auto_19634 ) ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19630 ) ) ( not ( = ?auto_19628 ?auto_19634 ) ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19634 ?auto_19630 ?auto_19626 )
      ( DELIVER-4PKG-VERIFY ?auto_19627 ?auto_19628 ?auto_19629 ?auto_19630 ?auto_19626 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19644 - OBJ
      ?auto_19645 - OBJ
      ?auto_19646 - OBJ
      ?auto_19647 - OBJ
      ?auto_19643 - LOCATION
    )
    :vars
    (
      ?auto_19650 - LOCATION
      ?auto_19648 - CITY
      ?auto_19651 - OBJ
      ?auto_19649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19650 ?auto_19648 ) ( IN-CITY ?auto_19643 ?auto_19648 ) ( not ( = ?auto_19643 ?auto_19650 ) ) ( OBJ-AT ?auto_19651 ?auto_19643 ) ( not ( = ?auto_19651 ?auto_19646 ) ) ( OBJ-AT ?auto_19646 ?auto_19650 ) ( TRUCK-AT ?auto_19649 ?auto_19643 ) ( OBJ-AT ?auto_19644 ?auto_19643 ) ( OBJ-AT ?auto_19645 ?auto_19643 ) ( OBJ-AT ?auto_19647 ?auto_19643 ) ( not ( = ?auto_19644 ?auto_19645 ) ) ( not ( = ?auto_19644 ?auto_19646 ) ) ( not ( = ?auto_19644 ?auto_19647 ) ) ( not ( = ?auto_19644 ?auto_19651 ) ) ( not ( = ?auto_19645 ?auto_19646 ) ) ( not ( = ?auto_19645 ?auto_19647 ) ) ( not ( = ?auto_19645 ?auto_19651 ) ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19647 ?auto_19651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19651 ?auto_19646 ?auto_19643 )
      ( DELIVER-4PKG-VERIFY ?auto_19644 ?auto_19645 ?auto_19646 ?auto_19647 ?auto_19643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19694 - OBJ
      ?auto_19695 - OBJ
      ?auto_19696 - OBJ
      ?auto_19697 - OBJ
      ?auto_19693 - LOCATION
    )
    :vars
    (
      ?auto_19700 - LOCATION
      ?auto_19698 - CITY
      ?auto_19701 - OBJ
      ?auto_19699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19700 ?auto_19698 ) ( IN-CITY ?auto_19693 ?auto_19698 ) ( not ( = ?auto_19693 ?auto_19700 ) ) ( OBJ-AT ?auto_19701 ?auto_19693 ) ( not ( = ?auto_19701 ?auto_19695 ) ) ( OBJ-AT ?auto_19695 ?auto_19700 ) ( TRUCK-AT ?auto_19699 ?auto_19693 ) ( OBJ-AT ?auto_19694 ?auto_19693 ) ( OBJ-AT ?auto_19696 ?auto_19693 ) ( OBJ-AT ?auto_19697 ?auto_19693 ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19694 ?auto_19697 ) ) ( not ( = ?auto_19694 ?auto_19701 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19701 ) ) ( not ( = ?auto_19697 ?auto_19701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19701 ?auto_19695 ?auto_19693 )
      ( DELIVER-4PKG-VERIFY ?auto_19694 ?auto_19695 ?auto_19696 ?auto_19697 ?auto_19693 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19738 - OBJ
      ?auto_19739 - OBJ
      ?auto_19740 - OBJ
      ?auto_19741 - OBJ
      ?auto_19737 - LOCATION
    )
    :vars
    (
      ?auto_19744 - LOCATION
      ?auto_19742 - CITY
      ?auto_19743 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19744 ?auto_19742 ) ( IN-CITY ?auto_19737 ?auto_19742 ) ( not ( = ?auto_19737 ?auto_19744 ) ) ( OBJ-AT ?auto_19741 ?auto_19737 ) ( not ( = ?auto_19741 ?auto_19738 ) ) ( OBJ-AT ?auto_19738 ?auto_19744 ) ( TRUCK-AT ?auto_19743 ?auto_19737 ) ( OBJ-AT ?auto_19739 ?auto_19737 ) ( OBJ-AT ?auto_19740 ?auto_19737 ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19741 ) ) ( not ( = ?auto_19740 ?auto_19741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19741 ?auto_19738 ?auto_19737 )
      ( DELIVER-4PKG-VERIFY ?auto_19738 ?auto_19739 ?auto_19740 ?auto_19741 ?auto_19737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19746 - OBJ
      ?auto_19747 - OBJ
      ?auto_19748 - OBJ
      ?auto_19749 - OBJ
      ?auto_19745 - LOCATION
    )
    :vars
    (
      ?auto_19752 - LOCATION
      ?auto_19750 - CITY
      ?auto_19751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19752 ?auto_19750 ) ( IN-CITY ?auto_19745 ?auto_19750 ) ( not ( = ?auto_19745 ?auto_19752 ) ) ( OBJ-AT ?auto_19747 ?auto_19745 ) ( not ( = ?auto_19747 ?auto_19746 ) ) ( OBJ-AT ?auto_19746 ?auto_19752 ) ( TRUCK-AT ?auto_19751 ?auto_19745 ) ( OBJ-AT ?auto_19748 ?auto_19745 ) ( OBJ-AT ?auto_19749 ?auto_19745 ) ( not ( = ?auto_19746 ?auto_19748 ) ) ( not ( = ?auto_19746 ?auto_19749 ) ) ( not ( = ?auto_19747 ?auto_19748 ) ) ( not ( = ?auto_19747 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19747 ?auto_19746 ?auto_19745 )
      ( DELIVER-4PKG-VERIFY ?auto_19746 ?auto_19747 ?auto_19748 ?auto_19749 ?auto_19745 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19842 - OBJ
      ?auto_19843 - OBJ
      ?auto_19844 - OBJ
      ?auto_19845 - OBJ
      ?auto_19841 - LOCATION
    )
    :vars
    (
      ?auto_19848 - LOCATION
      ?auto_19846 - CITY
      ?auto_19849 - OBJ
      ?auto_19847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19848 ?auto_19846 ) ( IN-CITY ?auto_19841 ?auto_19846 ) ( not ( = ?auto_19841 ?auto_19848 ) ) ( OBJ-AT ?auto_19849 ?auto_19841 ) ( not ( = ?auto_19849 ?auto_19842 ) ) ( OBJ-AT ?auto_19842 ?auto_19848 ) ( TRUCK-AT ?auto_19847 ?auto_19841 ) ( OBJ-AT ?auto_19843 ?auto_19841 ) ( OBJ-AT ?auto_19844 ?auto_19841 ) ( OBJ-AT ?auto_19845 ?auto_19841 ) ( not ( = ?auto_19842 ?auto_19843 ) ) ( not ( = ?auto_19842 ?auto_19844 ) ) ( not ( = ?auto_19842 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19844 ) ) ( not ( = ?auto_19843 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19849 ) ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19844 ?auto_19849 ) ) ( not ( = ?auto_19845 ?auto_19849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19849 ?auto_19842 ?auto_19841 )
      ( DELIVER-4PKG-VERIFY ?auto_19842 ?auto_19843 ?auto_19844 ?auto_19845 ?auto_19841 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20666 - OBJ
      ?auto_20665 - LOCATION
    )
    :vars
    (
      ?auto_20670 - LOCATION
      ?auto_20667 - CITY
      ?auto_20669 - OBJ
      ?auto_20668 - TRUCK
      ?auto_20671 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20670 ?auto_20667 ) ( IN-CITY ?auto_20665 ?auto_20667 ) ( not ( = ?auto_20665 ?auto_20670 ) ) ( OBJ-AT ?auto_20669 ?auto_20665 ) ( not ( = ?auto_20669 ?auto_20666 ) ) ( OBJ-AT ?auto_20666 ?auto_20670 ) ( TRUCK-AT ?auto_20668 ?auto_20671 ) ( IN-CITY ?auto_20671 ?auto_20667 ) ( not ( = ?auto_20665 ?auto_20671 ) ) ( not ( = ?auto_20670 ?auto_20671 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20668 ?auto_20671 ?auto_20665 ?auto_20667 )
      ( DELIVER-2PKG ?auto_20669 ?auto_20666 ?auto_20665 )
      ( DELIVER-1PKG-VERIFY ?auto_20666 ?auto_20665 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20673 - OBJ
      ?auto_20674 - OBJ
      ?auto_20672 - LOCATION
    )
    :vars
    (
      ?auto_20677 - LOCATION
      ?auto_20676 - CITY
      ?auto_20675 - TRUCK
      ?auto_20678 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20677 ?auto_20676 ) ( IN-CITY ?auto_20672 ?auto_20676 ) ( not ( = ?auto_20672 ?auto_20677 ) ) ( OBJ-AT ?auto_20673 ?auto_20672 ) ( not ( = ?auto_20673 ?auto_20674 ) ) ( OBJ-AT ?auto_20674 ?auto_20677 ) ( TRUCK-AT ?auto_20675 ?auto_20678 ) ( IN-CITY ?auto_20678 ?auto_20676 ) ( not ( = ?auto_20672 ?auto_20678 ) ) ( not ( = ?auto_20677 ?auto_20678 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20674 ?auto_20672 )
      ( DELIVER-2PKG-VERIFY ?auto_20673 ?auto_20674 ?auto_20672 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20688 - OBJ
      ?auto_20689 - OBJ
      ?auto_20687 - LOCATION
    )
    :vars
    (
      ?auto_20691 - LOCATION
      ?auto_20690 - CITY
      ?auto_20693 - TRUCK
      ?auto_20692 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20691 ?auto_20690 ) ( IN-CITY ?auto_20687 ?auto_20690 ) ( not ( = ?auto_20687 ?auto_20691 ) ) ( OBJ-AT ?auto_20689 ?auto_20687 ) ( not ( = ?auto_20689 ?auto_20688 ) ) ( OBJ-AT ?auto_20688 ?auto_20691 ) ( TRUCK-AT ?auto_20693 ?auto_20692 ) ( IN-CITY ?auto_20692 ?auto_20690 ) ( not ( = ?auto_20687 ?auto_20692 ) ) ( not ( = ?auto_20691 ?auto_20692 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20689 ?auto_20688 ?auto_20687 )
      ( DELIVER-2PKG-VERIFY ?auto_20688 ?auto_20689 ?auto_20687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20711 - OBJ
      ?auto_20712 - OBJ
      ?auto_20713 - OBJ
      ?auto_20710 - LOCATION
    )
    :vars
    (
      ?auto_20715 - LOCATION
      ?auto_20714 - CITY
      ?auto_20717 - TRUCK
      ?auto_20716 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20715 ?auto_20714 ) ( IN-CITY ?auto_20710 ?auto_20714 ) ( not ( = ?auto_20710 ?auto_20715 ) ) ( OBJ-AT ?auto_20712 ?auto_20710 ) ( not ( = ?auto_20712 ?auto_20713 ) ) ( OBJ-AT ?auto_20713 ?auto_20715 ) ( TRUCK-AT ?auto_20717 ?auto_20716 ) ( IN-CITY ?auto_20716 ?auto_20714 ) ( not ( = ?auto_20710 ?auto_20716 ) ) ( not ( = ?auto_20715 ?auto_20716 ) ) ( OBJ-AT ?auto_20711 ?auto_20710 ) ( not ( = ?auto_20711 ?auto_20712 ) ) ( not ( = ?auto_20711 ?auto_20713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20712 ?auto_20713 ?auto_20710 )
      ( DELIVER-3PKG-VERIFY ?auto_20711 ?auto_20712 ?auto_20713 ?auto_20710 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20727 - OBJ
      ?auto_20728 - OBJ
      ?auto_20729 - OBJ
      ?auto_20726 - LOCATION
    )
    :vars
    (
      ?auto_20731 - LOCATION
      ?auto_20730 - CITY
      ?auto_20733 - TRUCK
      ?auto_20732 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20731 ?auto_20730 ) ( IN-CITY ?auto_20726 ?auto_20730 ) ( not ( = ?auto_20726 ?auto_20731 ) ) ( OBJ-AT ?auto_20729 ?auto_20726 ) ( not ( = ?auto_20729 ?auto_20728 ) ) ( OBJ-AT ?auto_20728 ?auto_20731 ) ( TRUCK-AT ?auto_20733 ?auto_20732 ) ( IN-CITY ?auto_20732 ?auto_20730 ) ( not ( = ?auto_20726 ?auto_20732 ) ) ( not ( = ?auto_20731 ?auto_20732 ) ) ( OBJ-AT ?auto_20727 ?auto_20726 ) ( not ( = ?auto_20727 ?auto_20728 ) ) ( not ( = ?auto_20727 ?auto_20729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20729 ?auto_20728 ?auto_20726 )
      ( DELIVER-3PKG-VERIFY ?auto_20727 ?auto_20728 ?auto_20729 ?auto_20726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20794 - OBJ
      ?auto_20795 - OBJ
      ?auto_20796 - OBJ
      ?auto_20793 - LOCATION
    )
    :vars
    (
      ?auto_20798 - LOCATION
      ?auto_20797 - CITY
      ?auto_20800 - TRUCK
      ?auto_20799 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20798 ?auto_20797 ) ( IN-CITY ?auto_20793 ?auto_20797 ) ( not ( = ?auto_20793 ?auto_20798 ) ) ( OBJ-AT ?auto_20796 ?auto_20793 ) ( not ( = ?auto_20796 ?auto_20794 ) ) ( OBJ-AT ?auto_20794 ?auto_20798 ) ( TRUCK-AT ?auto_20800 ?auto_20799 ) ( IN-CITY ?auto_20799 ?auto_20797 ) ( not ( = ?auto_20793 ?auto_20799 ) ) ( not ( = ?auto_20798 ?auto_20799 ) ) ( OBJ-AT ?auto_20795 ?auto_20793 ) ( not ( = ?auto_20794 ?auto_20795 ) ) ( not ( = ?auto_20795 ?auto_20796 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20796 ?auto_20794 ?auto_20793 )
      ( DELIVER-3PKG-VERIFY ?auto_20794 ?auto_20795 ?auto_20796 ?auto_20793 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20870 - OBJ
      ?auto_20871 - OBJ
      ?auto_20872 - OBJ
      ?auto_20873 - OBJ
      ?auto_20869 - LOCATION
    )
    :vars
    (
      ?auto_20875 - LOCATION
      ?auto_20874 - CITY
      ?auto_20877 - TRUCK
      ?auto_20876 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20875 ?auto_20874 ) ( IN-CITY ?auto_20869 ?auto_20874 ) ( not ( = ?auto_20869 ?auto_20875 ) ) ( OBJ-AT ?auto_20870 ?auto_20869 ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( OBJ-AT ?auto_20873 ?auto_20875 ) ( TRUCK-AT ?auto_20877 ?auto_20876 ) ( IN-CITY ?auto_20876 ?auto_20874 ) ( not ( = ?auto_20869 ?auto_20876 ) ) ( not ( = ?auto_20875 ?auto_20876 ) ) ( OBJ-AT ?auto_20871 ?auto_20869 ) ( OBJ-AT ?auto_20872 ?auto_20869 ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20870 ?auto_20873 ?auto_20869 )
      ( DELIVER-4PKG-VERIFY ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20869 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20888 - OBJ
      ?auto_20889 - OBJ
      ?auto_20890 - OBJ
      ?auto_20891 - OBJ
      ?auto_20887 - LOCATION
    )
    :vars
    (
      ?auto_20893 - LOCATION
      ?auto_20892 - CITY
      ?auto_20895 - TRUCK
      ?auto_20894 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20893 ?auto_20892 ) ( IN-CITY ?auto_20887 ?auto_20892 ) ( not ( = ?auto_20887 ?auto_20893 ) ) ( OBJ-AT ?auto_20888 ?auto_20887 ) ( not ( = ?auto_20888 ?auto_20890 ) ) ( OBJ-AT ?auto_20890 ?auto_20893 ) ( TRUCK-AT ?auto_20895 ?auto_20894 ) ( IN-CITY ?auto_20894 ?auto_20892 ) ( not ( = ?auto_20887 ?auto_20894 ) ) ( not ( = ?auto_20893 ?auto_20894 ) ) ( OBJ-AT ?auto_20889 ?auto_20887 ) ( OBJ-AT ?auto_20891 ?auto_20887 ) ( not ( = ?auto_20888 ?auto_20889 ) ) ( not ( = ?auto_20888 ?auto_20891 ) ) ( not ( = ?auto_20889 ?auto_20890 ) ) ( not ( = ?auto_20889 ?auto_20891 ) ) ( not ( = ?auto_20890 ?auto_20891 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20888 ?auto_20890 ?auto_20887 )
      ( DELIVER-4PKG-VERIFY ?auto_20888 ?auto_20889 ?auto_20890 ?auto_20891 ?auto_20887 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20960 - OBJ
      ?auto_20961 - OBJ
      ?auto_20962 - OBJ
      ?auto_20963 - OBJ
      ?auto_20959 - LOCATION
    )
    :vars
    (
      ?auto_20965 - LOCATION
      ?auto_20964 - CITY
      ?auto_20967 - TRUCK
      ?auto_20966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20965 ?auto_20964 ) ( IN-CITY ?auto_20959 ?auto_20964 ) ( not ( = ?auto_20959 ?auto_20965 ) ) ( OBJ-AT ?auto_20960 ?auto_20959 ) ( not ( = ?auto_20960 ?auto_20961 ) ) ( OBJ-AT ?auto_20961 ?auto_20965 ) ( TRUCK-AT ?auto_20967 ?auto_20966 ) ( IN-CITY ?auto_20966 ?auto_20964 ) ( not ( = ?auto_20959 ?auto_20966 ) ) ( not ( = ?auto_20965 ?auto_20966 ) ) ( OBJ-AT ?auto_20962 ?auto_20959 ) ( OBJ-AT ?auto_20963 ?auto_20959 ) ( not ( = ?auto_20960 ?auto_20962 ) ) ( not ( = ?auto_20960 ?auto_20963 ) ) ( not ( = ?auto_20961 ?auto_20962 ) ) ( not ( = ?auto_20961 ?auto_20963 ) ) ( not ( = ?auto_20962 ?auto_20963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20960 ?auto_20961 ?auto_20959 )
      ( DELIVER-4PKG-VERIFY ?auto_20960 ?auto_20961 ?auto_20962 ?auto_20963 ?auto_20959 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21219 - OBJ
      ?auto_21220 - OBJ
      ?auto_21221 - OBJ
      ?auto_21222 - OBJ
      ?auto_21218 - LOCATION
    )
    :vars
    (
      ?auto_21224 - LOCATION
      ?auto_21223 - CITY
      ?auto_21226 - TRUCK
      ?auto_21225 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21224 ?auto_21223 ) ( IN-CITY ?auto_21218 ?auto_21223 ) ( not ( = ?auto_21218 ?auto_21224 ) ) ( OBJ-AT ?auto_21221 ?auto_21218 ) ( not ( = ?auto_21221 ?auto_21219 ) ) ( OBJ-AT ?auto_21219 ?auto_21224 ) ( TRUCK-AT ?auto_21226 ?auto_21225 ) ( IN-CITY ?auto_21225 ?auto_21223 ) ( not ( = ?auto_21218 ?auto_21225 ) ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( OBJ-AT ?auto_21220 ?auto_21218 ) ( OBJ-AT ?auto_21222 ?auto_21218 ) ( not ( = ?auto_21219 ?auto_21220 ) ) ( not ( = ?auto_21219 ?auto_21222 ) ) ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( not ( = ?auto_21221 ?auto_21222 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21221 ?auto_21219 ?auto_21218 )
      ( DELIVER-4PKG-VERIFY ?auto_21219 ?auto_21220 ?auto_21221 ?auto_21222 ?auto_21218 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21502 - OBJ
      ?auto_21503 - OBJ
      ?auto_21504 - OBJ
      ?auto_21501 - LOCATION
    )
    :vars
    (
      ?auto_21505 - LOCATION
      ?auto_21506 - CITY
      ?auto_21507 - TRUCK
      ?auto_21508 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21505 ?auto_21506 ) ( IN-CITY ?auto_21501 ?auto_21506 ) ( not ( = ?auto_21501 ?auto_21505 ) ) ( OBJ-AT ?auto_21502 ?auto_21501 ) ( not ( = ?auto_21502 ?auto_21504 ) ) ( OBJ-AT ?auto_21504 ?auto_21505 ) ( TRUCK-AT ?auto_21507 ?auto_21508 ) ( IN-CITY ?auto_21508 ?auto_21506 ) ( not ( = ?auto_21501 ?auto_21508 ) ) ( not ( = ?auto_21505 ?auto_21508 ) ) ( OBJ-AT ?auto_21503 ?auto_21501 ) ( not ( = ?auto_21502 ?auto_21503 ) ) ( not ( = ?auto_21503 ?auto_21504 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21502 ?auto_21504 ?auto_21501 )
      ( DELIVER-3PKG-VERIFY ?auto_21502 ?auto_21503 ?auto_21504 ?auto_21501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21585 - OBJ
      ?auto_21586 - OBJ
      ?auto_21587 - OBJ
      ?auto_21584 - LOCATION
    )
    :vars
    (
      ?auto_21588 - LOCATION
      ?auto_21589 - CITY
      ?auto_21590 - TRUCK
      ?auto_21591 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21588 ?auto_21589 ) ( IN-CITY ?auto_21584 ?auto_21589 ) ( not ( = ?auto_21584 ?auto_21588 ) ) ( OBJ-AT ?auto_21586 ?auto_21584 ) ( not ( = ?auto_21586 ?auto_21585 ) ) ( OBJ-AT ?auto_21585 ?auto_21588 ) ( TRUCK-AT ?auto_21590 ?auto_21591 ) ( IN-CITY ?auto_21591 ?auto_21589 ) ( not ( = ?auto_21584 ?auto_21591 ) ) ( not ( = ?auto_21588 ?auto_21591 ) ) ( OBJ-AT ?auto_21587 ?auto_21584 ) ( not ( = ?auto_21585 ?auto_21587 ) ) ( not ( = ?auto_21586 ?auto_21587 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21586 ?auto_21585 ?auto_21584 )
      ( DELIVER-3PKG-VERIFY ?auto_21585 ?auto_21586 ?auto_21587 ?auto_21584 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_22010 - OBJ
      ?auto_22011 - OBJ
      ?auto_22012 - OBJ
      ?auto_22013 - OBJ
      ?auto_22009 - LOCATION
    )
    :vars
    (
      ?auto_22014 - LOCATION
      ?auto_22015 - CITY
      ?auto_22016 - TRUCK
      ?auto_22017 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_22014 ?auto_22015 ) ( IN-CITY ?auto_22009 ?auto_22015 ) ( not ( = ?auto_22009 ?auto_22014 ) ) ( OBJ-AT ?auto_22011 ?auto_22009 ) ( not ( = ?auto_22011 ?auto_22010 ) ) ( OBJ-AT ?auto_22010 ?auto_22014 ) ( TRUCK-AT ?auto_22016 ?auto_22017 ) ( IN-CITY ?auto_22017 ?auto_22015 ) ( not ( = ?auto_22009 ?auto_22017 ) ) ( not ( = ?auto_22014 ?auto_22017 ) ) ( OBJ-AT ?auto_22012 ?auto_22009 ) ( OBJ-AT ?auto_22013 ?auto_22009 ) ( not ( = ?auto_22010 ?auto_22012 ) ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( not ( = ?auto_22011 ?auto_22012 ) ) ( not ( = ?auto_22011 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22011 ?auto_22010 ?auto_22009 )
      ( DELIVER-4PKG-VERIFY ?auto_22010 ?auto_22011 ?auto_22012 ?auto_22013 ?auto_22009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_28253 - OBJ
      ?auto_28254 - OBJ
      ?auto_28255 - OBJ
      ?auto_28252 - LOCATION
    )
    :vars
    (
      ?auto_28256 - TRUCK
      ?auto_28257 - LOCATION
      ?auto_28258 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_28254 ?auto_28256 ) ( TRUCK-AT ?auto_28256 ?auto_28257 ) ( IN-CITY ?auto_28257 ?auto_28258 ) ( IN-CITY ?auto_28252 ?auto_28258 ) ( not ( = ?auto_28252 ?auto_28257 ) ) ( OBJ-AT ?auto_28255 ?auto_28252 ) ( not ( = ?auto_28255 ?auto_28254 ) ) ( OBJ-AT ?auto_28253 ?auto_28252 ) ( not ( = ?auto_28253 ?auto_28254 ) ) ( not ( = ?auto_28253 ?auto_28255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_28255 ?auto_28254 ?auto_28252 )
      ( DELIVER-3PKG-VERIFY ?auto_28253 ?auto_28254 ?auto_28255 ?auto_28252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_28355 - OBJ
      ?auto_28356 - OBJ
      ?auto_28357 - OBJ
      ?auto_28354 - LOCATION
    )
    :vars
    (
      ?auto_28358 - TRUCK
      ?auto_28359 - LOCATION
      ?auto_28360 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_28355 ?auto_28358 ) ( TRUCK-AT ?auto_28358 ?auto_28359 ) ( IN-CITY ?auto_28359 ?auto_28360 ) ( IN-CITY ?auto_28354 ?auto_28360 ) ( not ( = ?auto_28354 ?auto_28359 ) ) ( OBJ-AT ?auto_28357 ?auto_28354 ) ( not ( = ?auto_28357 ?auto_28355 ) ) ( OBJ-AT ?auto_28356 ?auto_28354 ) ( not ( = ?auto_28355 ?auto_28356 ) ) ( not ( = ?auto_28356 ?auto_28357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_28357 ?auto_28355 ?auto_28354 )
      ( DELIVER-3PKG-VERIFY ?auto_28355 ?auto_28356 ?auto_28357 ?auto_28354 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_31651 - OBJ
      ?auto_31652 - OBJ
      ?auto_31653 - OBJ
      ?auto_31650 - LOCATION
    )
    :vars
    (
      ?auto_31655 - LOCATION
      ?auto_31656 - CITY
      ?auto_31654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_31655 ?auto_31656 ) ( IN-CITY ?auto_31650 ?auto_31656 ) ( not ( = ?auto_31650 ?auto_31655 ) ) ( OBJ-AT ?auto_31653 ?auto_31650 ) ( not ( = ?auto_31653 ?auto_31651 ) ) ( OBJ-AT ?auto_31651 ?auto_31655 ) ( TRUCK-AT ?auto_31654 ?auto_31650 ) ( OBJ-AT ?auto_31652 ?auto_31650 ) ( not ( = ?auto_31651 ?auto_31652 ) ) ( not ( = ?auto_31652 ?auto_31653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_31653 ?auto_31651 ?auto_31650 )
      ( DELIVER-3PKG-VERIFY ?auto_31651 ?auto_31652 ?auto_31653 ?auto_31650 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_35085 - OBJ
      ?auto_35086 - OBJ
      ?auto_35087 - OBJ
      ?auto_35084 - LOCATION
    )
    :vars
    (
      ?auto_35089 - TRUCK
      ?auto_35090 - LOCATION
      ?auto_35088 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_35089 ?auto_35090 ) ( IN-CITY ?auto_35090 ?auto_35088 ) ( IN-CITY ?auto_35084 ?auto_35088 ) ( not ( = ?auto_35084 ?auto_35090 ) ) ( OBJ-AT ?auto_35087 ?auto_35084 ) ( not ( = ?auto_35087 ?auto_35085 ) ) ( OBJ-AT ?auto_35085 ?auto_35090 ) ( OBJ-AT ?auto_35086 ?auto_35084 ) ( not ( = ?auto_35085 ?auto_35086 ) ) ( not ( = ?auto_35086 ?auto_35087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35087 ?auto_35085 ?auto_35084 )
      ( DELIVER-3PKG-VERIFY ?auto_35085 ?auto_35086 ?auto_35087 ?auto_35084 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42334 - OBJ
      ?auto_42335 - OBJ
      ?auto_42336 - OBJ
      ?auto_42337 - OBJ
      ?auto_42333 - LOCATION
    )
    :vars
    (
      ?auto_42338 - LOCATION
      ?auto_42339 - CITY
      ?auto_42340 - TRUCK
      ?auto_42341 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42338 ?auto_42339 ) ( IN-CITY ?auto_42333 ?auto_42339 ) ( not ( = ?auto_42333 ?auto_42338 ) ) ( OBJ-AT ?auto_42335 ?auto_42333 ) ( not ( = ?auto_42335 ?auto_42337 ) ) ( OBJ-AT ?auto_42337 ?auto_42338 ) ( TRUCK-AT ?auto_42340 ?auto_42341 ) ( IN-CITY ?auto_42341 ?auto_42339 ) ( not ( = ?auto_42333 ?auto_42341 ) ) ( not ( = ?auto_42338 ?auto_42341 ) ) ( OBJ-AT ?auto_42334 ?auto_42333 ) ( OBJ-AT ?auto_42336 ?auto_42333 ) ( not ( = ?auto_42334 ?auto_42335 ) ) ( not ( = ?auto_42334 ?auto_42336 ) ) ( not ( = ?auto_42334 ?auto_42337 ) ) ( not ( = ?auto_42335 ?auto_42336 ) ) ( not ( = ?auto_42336 ?auto_42337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42335 ?auto_42337 ?auto_42333 )
      ( DELIVER-4PKG-VERIFY ?auto_42334 ?auto_42335 ?auto_42336 ?auto_42337 ?auto_42333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42361 - OBJ
      ?auto_42362 - OBJ
      ?auto_42363 - OBJ
      ?auto_42364 - OBJ
      ?auto_42360 - LOCATION
    )
    :vars
    (
      ?auto_42365 - LOCATION
      ?auto_42366 - CITY
      ?auto_42367 - TRUCK
      ?auto_42368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42365 ?auto_42366 ) ( IN-CITY ?auto_42360 ?auto_42366 ) ( not ( = ?auto_42360 ?auto_42365 ) ) ( OBJ-AT ?auto_42364 ?auto_42360 ) ( not ( = ?auto_42364 ?auto_42363 ) ) ( OBJ-AT ?auto_42363 ?auto_42365 ) ( TRUCK-AT ?auto_42367 ?auto_42368 ) ( IN-CITY ?auto_42368 ?auto_42366 ) ( not ( = ?auto_42360 ?auto_42368 ) ) ( not ( = ?auto_42365 ?auto_42368 ) ) ( OBJ-AT ?auto_42361 ?auto_42360 ) ( OBJ-AT ?auto_42362 ?auto_42360 ) ( not ( = ?auto_42361 ?auto_42362 ) ) ( not ( = ?auto_42361 ?auto_42363 ) ) ( not ( = ?auto_42361 ?auto_42364 ) ) ( not ( = ?auto_42362 ?auto_42363 ) ) ( not ( = ?auto_42362 ?auto_42364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42364 ?auto_42363 ?auto_42360 )
      ( DELIVER-4PKG-VERIFY ?auto_42361 ?auto_42362 ?auto_42363 ?auto_42364 ?auto_42360 ) )
  )

)

