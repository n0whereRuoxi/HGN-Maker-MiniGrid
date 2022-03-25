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
    ( ( !UNLOAD-TRUCK ?auto_15215 ?auto_15216 ?auto_15214 ) )
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
      ( DELIVER-1PKG ?auto_15233 ?auto_15232 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15259 - OBJ
      ?auto_15258 - LOCATION
    )
    :vars
    (
      ?auto_15260 - TRUCK
      ?auto_15261 - LOCATION
      ?auto_15262 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15260 ?auto_15261 ) ( IN-CITY ?auto_15261 ?auto_15262 ) ( IN-CITY ?auto_15258 ?auto_15262 ) ( not ( = ?auto_15258 ?auto_15261 ) ) ( OBJ-AT ?auto_15259 ?auto_15261 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15259 ?auto_15260 ?auto_15261 )
      ( DELIVER-1PKG ?auto_15259 ?auto_15258 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15285 - OBJ
      ?auto_15284 - LOCATION
    )
    :vars
    (
      ?auto_15288 - LOCATION
      ?auto_15287 - CITY
      ?auto_15286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15288 ?auto_15287 ) ( IN-CITY ?auto_15284 ?auto_15287 ) ( not ( = ?auto_15284 ?auto_15288 ) ) ( OBJ-AT ?auto_15285 ?auto_15288 ) ( TRUCK-AT ?auto_15286 ?auto_15284 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15286 ?auto_15284 ?auto_15288 ?auto_15287 )
      ( DELIVER-1PKG ?auto_15285 ?auto_15284 ) )
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
    ( ( DELIVER-1PKG ?auto_15429 ?auto_15427 ) )
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
    ( ( DELIVER-1PKG ?auto_15432 ?auto_15431 ) )
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
    ( ( DELIVER-1PKG ?auto_15442 ?auto_15439 ) )
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
    ( ( DELIVER-1PKG ?auto_15446 ?auto_15444 ) )
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
    ( ( DELIVER-1PKG ?auto_15455 ?auto_15454 ) )
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
    ( ( DELIVER-1PKG ?auto_15478 ?auto_15474 ) )
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
    ( ( DELIVER-1PKG ?auto_15483 ?auto_15480 ) )
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
    ( ( DELIVER-1PKG ?auto_15494 ?auto_15492 ) )
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
    ( ( DELIVER-1PKG ?auto_15517 ?auto_15516 ) )
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
      ?auto_15574 - TRUCK
      ?auto_15572 - LOCATION
      ?auto_15573 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15571 ?auto_15574 ) ( TRUCK-AT ?auto_15574 ?auto_15572 ) ( IN-CITY ?auto_15572 ?auto_15573 ) ( IN-CITY ?auto_15569 ?auto_15573 ) ( not ( = ?auto_15569 ?auto_15572 ) ) ( OBJ-AT ?auto_15570 ?auto_15569 ) ( not ( = ?auto_15570 ?auto_15571 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15571 ?auto_15569 ) )
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
    ( ( DELIVER-2PKG ?auto_15577 ?auto_15576 ?auto_15575 ) )
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
    ( and ( IN-TRUCK ?auto_15591 ?auto_15592 ) ( TRUCK-AT ?auto_15592 ?auto_15593 ) ( IN-CITY ?auto_15593 ?auto_15594 ) ( IN-CITY ?auto_15588 ?auto_15594 ) ( not ( = ?auto_15588 ?auto_15593 ) ) ( OBJ-AT ?auto_15590 ?auto_15588 ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( OBJ-AT ?auto_15589 ?auto_15588 ) ( not ( = ?auto_15589 ?auto_15590 ) ) ( not ( = ?auto_15589 ?auto_15591 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15590 ?auto_15591 ?auto_15588 ) )
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
    ( ( DELIVER-2PKG ?auto_15596 ?auto_15597 ?auto_15595 ) )
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
    ( ( DELIVER-2PKG ?auto_15611 ?auto_15610 ?auto_15609 ) )
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
    ( ( DELIVER-2PKG ?auto_15640 ?auto_15642 ?auto_15638 ) )
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
    ( ( DELIVER-2PKG ?auto_15650 ?auto_15649 ?auto_15646 ) )
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
    ( and ( IN-TRUCK ?auto_15664 ?auto_15667 ) ( TRUCK-AT ?auto_15667 ?auto_15668 ) ( IN-CITY ?auto_15668 ?auto_15669 ) ( IN-CITY ?auto_15662 ?auto_15669 ) ( not ( = ?auto_15662 ?auto_15668 ) ) ( OBJ-AT ?auto_15665 ?auto_15662 ) ( not ( = ?auto_15665 ?auto_15664 ) ) ( OBJ-AT ?auto_15663 ?auto_15662 ) ( OBJ-AT ?auto_15666 ?auto_15662 ) ( not ( = ?auto_15663 ?auto_15664 ) ) ( not ( = ?auto_15663 ?auto_15665 ) ) ( not ( = ?auto_15663 ?auto_15666 ) ) ( not ( = ?auto_15664 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15665 ?auto_15664 ?auto_15662 ) )
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
    ( ( DELIVER-2PKG ?auto_15698 ?auto_15695 ?auto_15694 ) )
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
      ?auto_15763 - LOCATION
      ?auto_15764 - CITY
      ?auto_15762 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15761 ?auto_15763 ) ( IN-CITY ?auto_15763 ?auto_15764 ) ( IN-CITY ?auto_15759 ?auto_15764 ) ( not ( = ?auto_15759 ?auto_15763 ) ) ( OBJ-AT ?auto_15762 ?auto_15759 ) ( not ( = ?auto_15762 ?auto_15760 ) ) ( OBJ-AT ?auto_15760 ?auto_15763 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15760 ?auto_15761 ?auto_15763 )
      ( DELIVER-2PKG ?auto_15762 ?auto_15760 ?auto_15759 ) )
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
      ?auto_15769 - TRUCK
      ?auto_15768 - LOCATION
      ?auto_15770 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15769 ?auto_15768 ) ( IN-CITY ?auto_15768 ?auto_15770 ) ( IN-CITY ?auto_15765 ?auto_15770 ) ( not ( = ?auto_15765 ?auto_15768 ) ) ( OBJ-AT ?auto_15766 ?auto_15765 ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( OBJ-AT ?auto_15767 ?auto_15768 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15767 ?auto_15765 ) )
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
      ?auto_15774 - TRUCK
      ?auto_15775 - LOCATION
      ?auto_15776 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15774 ?auto_15775 ) ( IN-CITY ?auto_15775 ?auto_15776 ) ( IN-CITY ?auto_15771 ?auto_15776 ) ( not ( = ?auto_15771 ?auto_15775 ) ) ( OBJ-AT ?auto_15773 ?auto_15771 ) ( not ( = ?auto_15773 ?auto_15772 ) ) ( OBJ-AT ?auto_15772 ?auto_15775 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15773 ?auto_15772 ?auto_15771 ) )
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
      ?auto_15788 - TRUCK
      ?auto_15789 - LOCATION
      ?auto_15790 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15788 ?auto_15789 ) ( IN-CITY ?auto_15789 ?auto_15790 ) ( IN-CITY ?auto_15784 ?auto_15790 ) ( not ( = ?auto_15784 ?auto_15789 ) ) ( OBJ-AT ?auto_15785 ?auto_15784 ) ( not ( = ?auto_15785 ?auto_15787 ) ) ( OBJ-AT ?auto_15787 ?auto_15789 ) ( OBJ-AT ?auto_15786 ?auto_15784 ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15786 ?auto_15787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15785 ?auto_15787 ?auto_15784 ) )
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
      ?auto_15795 - TRUCK
      ?auto_15796 - LOCATION
      ?auto_15797 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15795 ?auto_15796 ) ( IN-CITY ?auto_15796 ?auto_15797 ) ( IN-CITY ?auto_15791 ?auto_15797 ) ( not ( = ?auto_15791 ?auto_15796 ) ) ( OBJ-AT ?auto_15792 ?auto_15791 ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( OBJ-AT ?auto_15793 ?auto_15796 ) ( OBJ-AT ?auto_15794 ?auto_15791 ) ( not ( = ?auto_15792 ?auto_15794 ) ) ( not ( = ?auto_15793 ?auto_15794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15792 ?auto_15793 ?auto_15791 ) )
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
      ?auto_15809 - TRUCK
      ?auto_15810 - LOCATION
      ?auto_15811 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15809 ?auto_15810 ) ( IN-CITY ?auto_15810 ?auto_15811 ) ( IN-CITY ?auto_15805 ?auto_15811 ) ( not ( = ?auto_15805 ?auto_15810 ) ) ( OBJ-AT ?auto_15807 ?auto_15805 ) ( not ( = ?auto_15807 ?auto_15806 ) ) ( OBJ-AT ?auto_15806 ?auto_15810 ) ( OBJ-AT ?auto_15808 ?auto_15805 ) ( not ( = ?auto_15806 ?auto_15808 ) ) ( not ( = ?auto_15807 ?auto_15808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15807 ?auto_15806 ?auto_15805 ) )
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
      ?auto_15839 - TRUCK
      ?auto_15840 - LOCATION
      ?auto_15841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15839 ?auto_15840 ) ( IN-CITY ?auto_15840 ?auto_15841 ) ( IN-CITY ?auto_15834 ?auto_15841 ) ( not ( = ?auto_15834 ?auto_15840 ) ) ( OBJ-AT ?auto_15835 ?auto_15834 ) ( not ( = ?auto_15835 ?auto_15838 ) ) ( OBJ-AT ?auto_15838 ?auto_15840 ) ( OBJ-AT ?auto_15836 ?auto_15834 ) ( OBJ-AT ?auto_15837 ?auto_15834 ) ( not ( = ?auto_15835 ?auto_15836 ) ) ( not ( = ?auto_15835 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15835 ?auto_15838 ?auto_15834 ) )
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
      ?auto_15847 - TRUCK
      ?auto_15848 - LOCATION
      ?auto_15849 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15847 ?auto_15848 ) ( IN-CITY ?auto_15848 ?auto_15849 ) ( IN-CITY ?auto_15842 ?auto_15849 ) ( not ( = ?auto_15842 ?auto_15848 ) ) ( OBJ-AT ?auto_15843 ?auto_15842 ) ( not ( = ?auto_15843 ?auto_15845 ) ) ( OBJ-AT ?auto_15845 ?auto_15848 ) ( OBJ-AT ?auto_15844 ?auto_15842 ) ( OBJ-AT ?auto_15846 ?auto_15842 ) ( not ( = ?auto_15843 ?auto_15844 ) ) ( not ( = ?auto_15843 ?auto_15846 ) ) ( not ( = ?auto_15844 ?auto_15845 ) ) ( not ( = ?auto_15844 ?auto_15846 ) ) ( not ( = ?auto_15845 ?auto_15846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15843 ?auto_15845 ?auto_15842 ) )
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
      ?auto_15863 - TRUCK
      ?auto_15864 - LOCATION
      ?auto_15865 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15863 ?auto_15864 ) ( IN-CITY ?auto_15864 ?auto_15865 ) ( IN-CITY ?auto_15858 ?auto_15865 ) ( not ( = ?auto_15858 ?auto_15864 ) ) ( OBJ-AT ?auto_15859 ?auto_15858 ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( OBJ-AT ?auto_15860 ?auto_15864 ) ( OBJ-AT ?auto_15861 ?auto_15858 ) ( OBJ-AT ?auto_15862 ?auto_15858 ) ( not ( = ?auto_15859 ?auto_15861 ) ) ( not ( = ?auto_15859 ?auto_15862 ) ) ( not ( = ?auto_15860 ?auto_15861 ) ) ( not ( = ?auto_15860 ?auto_15862 ) ) ( not ( = ?auto_15861 ?auto_15862 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15859 ?auto_15860 ?auto_15858 ) )
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
      ?auto_15895 - TRUCK
      ?auto_15896 - LOCATION
      ?auto_15897 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15895 ?auto_15896 ) ( IN-CITY ?auto_15896 ?auto_15897 ) ( IN-CITY ?auto_15890 ?auto_15897 ) ( not ( = ?auto_15890 ?auto_15896 ) ) ( OBJ-AT ?auto_15894 ?auto_15890 ) ( not ( = ?auto_15894 ?auto_15891 ) ) ( OBJ-AT ?auto_15891 ?auto_15896 ) ( OBJ-AT ?auto_15892 ?auto_15890 ) ( OBJ-AT ?auto_15893 ?auto_15890 ) ( not ( = ?auto_15891 ?auto_15892 ) ) ( not ( = ?auto_15891 ?auto_15893 ) ) ( not ( = ?auto_15892 ?auto_15893 ) ) ( not ( = ?auto_15892 ?auto_15894 ) ) ( not ( = ?auto_15893 ?auto_15894 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15894 ?auto_15891 ?auto_15890 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15956 - OBJ
      ?auto_15955 - LOCATION
    )
    :vars
    (
      ?auto_15958 - LOCATION
      ?auto_15959 - CITY
      ?auto_15960 - OBJ
      ?auto_15957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15958 ?auto_15959 ) ( IN-CITY ?auto_15955 ?auto_15959 ) ( not ( = ?auto_15955 ?auto_15958 ) ) ( OBJ-AT ?auto_15960 ?auto_15955 ) ( not ( = ?auto_15960 ?auto_15956 ) ) ( OBJ-AT ?auto_15956 ?auto_15958 ) ( TRUCK-AT ?auto_15957 ?auto_15955 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15957 ?auto_15955 ?auto_15958 ?auto_15959 )
      ( DELIVER-2PKG ?auto_15960 ?auto_15956 ?auto_15955 ) )
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
      ?auto_15966 - LOCATION
      ?auto_15965 - CITY
      ?auto_15964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15966 ?auto_15965 ) ( IN-CITY ?auto_15961 ?auto_15965 ) ( not ( = ?auto_15961 ?auto_15966 ) ) ( OBJ-AT ?auto_15962 ?auto_15961 ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( OBJ-AT ?auto_15963 ?auto_15966 ) ( TRUCK-AT ?auto_15964 ?auto_15961 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15963 ?auto_15961 ) )
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
      ?auto_15970 - LOCATION
      ?auto_15972 - CITY
      ?auto_15971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15970 ?auto_15972 ) ( IN-CITY ?auto_15967 ?auto_15972 ) ( not ( = ?auto_15967 ?auto_15970 ) ) ( OBJ-AT ?auto_15969 ?auto_15967 ) ( not ( = ?auto_15969 ?auto_15968 ) ) ( OBJ-AT ?auto_15968 ?auto_15970 ) ( TRUCK-AT ?auto_15971 ?auto_15967 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15969 ?auto_15968 ?auto_15967 ) )
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
      ?auto_15984 - LOCATION
      ?auto_15986 - CITY
      ?auto_15985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15984 ?auto_15986 ) ( IN-CITY ?auto_15980 ?auto_15986 ) ( not ( = ?auto_15980 ?auto_15984 ) ) ( OBJ-AT ?auto_15981 ?auto_15980 ) ( not ( = ?auto_15981 ?auto_15983 ) ) ( OBJ-AT ?auto_15983 ?auto_15984 ) ( TRUCK-AT ?auto_15985 ?auto_15980 ) ( OBJ-AT ?auto_15982 ?auto_15980 ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( not ( = ?auto_15982 ?auto_15983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15981 ?auto_15983 ?auto_15980 ) )
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
      ?auto_15991 - LOCATION
      ?auto_15993 - CITY
      ?auto_15992 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15991 ?auto_15993 ) ( IN-CITY ?auto_15987 ?auto_15993 ) ( not ( = ?auto_15987 ?auto_15991 ) ) ( OBJ-AT ?auto_15990 ?auto_15987 ) ( not ( = ?auto_15990 ?auto_15989 ) ) ( OBJ-AT ?auto_15989 ?auto_15991 ) ( TRUCK-AT ?auto_15992 ?auto_15987 ) ( OBJ-AT ?auto_15988 ?auto_15987 ) ( not ( = ?auto_15988 ?auto_15989 ) ) ( not ( = ?auto_15988 ?auto_15990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15990 ?auto_15989 ?auto_15987 ) )
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
      ?auto_16005 - LOCATION
      ?auto_16007 - CITY
      ?auto_16006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16005 ?auto_16007 ) ( IN-CITY ?auto_16001 ?auto_16007 ) ( not ( = ?auto_16001 ?auto_16005 ) ) ( OBJ-AT ?auto_16003 ?auto_16001 ) ( not ( = ?auto_16003 ?auto_16002 ) ) ( OBJ-AT ?auto_16002 ?auto_16005 ) ( TRUCK-AT ?auto_16006 ?auto_16001 ) ( OBJ-AT ?auto_16004 ?auto_16001 ) ( not ( = ?auto_16002 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16003 ?auto_16002 ?auto_16001 ) )
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
      ?auto_16035 - LOCATION
      ?auto_16037 - CITY
      ?auto_16036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16035 ?auto_16037 ) ( IN-CITY ?auto_16030 ?auto_16037 ) ( not ( = ?auto_16030 ?auto_16035 ) ) ( OBJ-AT ?auto_16031 ?auto_16030 ) ( not ( = ?auto_16031 ?auto_16034 ) ) ( OBJ-AT ?auto_16034 ?auto_16035 ) ( TRUCK-AT ?auto_16036 ?auto_16030 ) ( OBJ-AT ?auto_16032 ?auto_16030 ) ( OBJ-AT ?auto_16033 ?auto_16030 ) ( not ( = ?auto_16031 ?auto_16032 ) ) ( not ( = ?auto_16031 ?auto_16033 ) ) ( not ( = ?auto_16032 ?auto_16033 ) ) ( not ( = ?auto_16032 ?auto_16034 ) ) ( not ( = ?auto_16033 ?auto_16034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16031 ?auto_16034 ?auto_16030 ) )
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
      ?auto_16043 - LOCATION
      ?auto_16045 - CITY
      ?auto_16044 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16043 ?auto_16045 ) ( IN-CITY ?auto_16038 ?auto_16045 ) ( not ( = ?auto_16038 ?auto_16043 ) ) ( OBJ-AT ?auto_16042 ?auto_16038 ) ( not ( = ?auto_16042 ?auto_16041 ) ) ( OBJ-AT ?auto_16041 ?auto_16043 ) ( TRUCK-AT ?auto_16044 ?auto_16038 ) ( OBJ-AT ?auto_16039 ?auto_16038 ) ( OBJ-AT ?auto_16040 ?auto_16038 ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16041 ) ) ( not ( = ?auto_16039 ?auto_16042 ) ) ( not ( = ?auto_16040 ?auto_16041 ) ) ( not ( = ?auto_16040 ?auto_16042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16042 ?auto_16041 ?auto_16038 ) )
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
      ?auto_16059 - LOCATION
      ?auto_16061 - CITY
      ?auto_16060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16059 ?auto_16061 ) ( IN-CITY ?auto_16054 ?auto_16061 ) ( not ( = ?auto_16054 ?auto_16059 ) ) ( OBJ-AT ?auto_16055 ?auto_16054 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( OBJ-AT ?auto_16056 ?auto_16059 ) ( TRUCK-AT ?auto_16060 ?auto_16054 ) ( OBJ-AT ?auto_16057 ?auto_16054 ) ( OBJ-AT ?auto_16058 ?auto_16054 ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16055 ?auto_16056 ?auto_16054 ) )
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
      ?auto_16091 - LOCATION
      ?auto_16093 - CITY
      ?auto_16092 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16091 ?auto_16093 ) ( IN-CITY ?auto_16086 ?auto_16093 ) ( not ( = ?auto_16086 ?auto_16091 ) ) ( OBJ-AT ?auto_16090 ?auto_16086 ) ( not ( = ?auto_16090 ?auto_16087 ) ) ( OBJ-AT ?auto_16087 ?auto_16091 ) ( TRUCK-AT ?auto_16092 ?auto_16086 ) ( OBJ-AT ?auto_16088 ?auto_16086 ) ( OBJ-AT ?auto_16089 ?auto_16086 ) ( not ( = ?auto_16087 ?auto_16088 ) ) ( not ( = ?auto_16087 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16090 ) ) ( not ( = ?auto_16089 ?auto_16090 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16090 ?auto_16087 ?auto_16086 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16152 - OBJ
      ?auto_16151 - LOCATION
    )
    :vars
    (
      ?auto_16153 - LOCATION
      ?auto_16156 - CITY
      ?auto_16154 - OBJ
      ?auto_16155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16153 ?auto_16156 ) ( IN-CITY ?auto_16151 ?auto_16156 ) ( not ( = ?auto_16151 ?auto_16153 ) ) ( not ( = ?auto_16154 ?auto_16152 ) ) ( OBJ-AT ?auto_16152 ?auto_16153 ) ( TRUCK-AT ?auto_16155 ?auto_16151 ) ( IN-TRUCK ?auto_16154 ?auto_16155 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16154 ?auto_16151 )
      ( DELIVER-2PKG ?auto_16154 ?auto_16152 ?auto_16151 ) )
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
      ?auto_16162 - LOCATION
      ?auto_16160 - CITY
      ?auto_16161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16162 ?auto_16160 ) ( IN-CITY ?auto_16157 ?auto_16160 ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( OBJ-AT ?auto_16159 ?auto_16162 ) ( TRUCK-AT ?auto_16161 ?auto_16157 ) ( IN-TRUCK ?auto_16158 ?auto_16161 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16159 ?auto_16157 ) )
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
      ?auto_16166 - LOCATION
      ?auto_16167 - CITY
      ?auto_16168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16166 ?auto_16167 ) ( IN-CITY ?auto_16163 ?auto_16167 ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16165 ?auto_16164 ) ) ( OBJ-AT ?auto_16164 ?auto_16166 ) ( TRUCK-AT ?auto_16168 ?auto_16163 ) ( IN-TRUCK ?auto_16165 ?auto_16168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16165 ?auto_16164 ?auto_16163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16348 - OBJ
      ?auto_16347 - LOCATION
    )
    :vars
    (
      ?auto_16349 - LOCATION
      ?auto_16350 - CITY
      ?auto_16352 - OBJ
      ?auto_16351 - TRUCK
      ?auto_16353 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16349 ?auto_16350 ) ( IN-CITY ?auto_16347 ?auto_16350 ) ( not ( = ?auto_16347 ?auto_16349 ) ) ( not ( = ?auto_16352 ?auto_16348 ) ) ( OBJ-AT ?auto_16348 ?auto_16349 ) ( IN-TRUCK ?auto_16352 ?auto_16351 ) ( TRUCK-AT ?auto_16351 ?auto_16353 ) ( IN-CITY ?auto_16353 ?auto_16350 ) ( not ( = ?auto_16347 ?auto_16353 ) ) ( not ( = ?auto_16349 ?auto_16353 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16351 ?auto_16353 ?auto_16347 ?auto_16350 )
      ( DELIVER-2PKG ?auto_16352 ?auto_16348 ?auto_16347 ) )
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
      ?auto_16358 - LOCATION
      ?auto_16357 - CITY
      ?auto_16359 - TRUCK
      ?auto_16360 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16358 ?auto_16357 ) ( IN-CITY ?auto_16354 ?auto_16357 ) ( not ( = ?auto_16354 ?auto_16358 ) ) ( not ( = ?auto_16355 ?auto_16356 ) ) ( OBJ-AT ?auto_16356 ?auto_16358 ) ( IN-TRUCK ?auto_16355 ?auto_16359 ) ( TRUCK-AT ?auto_16359 ?auto_16360 ) ( IN-CITY ?auto_16360 ?auto_16357 ) ( not ( = ?auto_16354 ?auto_16360 ) ) ( not ( = ?auto_16358 ?auto_16360 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16356 ?auto_16354 ) )
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
      ?auto_16366 - LOCATION
      ?auto_16365 - CITY
      ?auto_16367 - TRUCK
      ?auto_16364 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16366 ?auto_16365 ) ( IN-CITY ?auto_16361 ?auto_16365 ) ( not ( = ?auto_16361 ?auto_16366 ) ) ( not ( = ?auto_16363 ?auto_16362 ) ) ( OBJ-AT ?auto_16362 ?auto_16366 ) ( IN-TRUCK ?auto_16363 ?auto_16367 ) ( TRUCK-AT ?auto_16367 ?auto_16364 ) ( IN-CITY ?auto_16364 ?auto_16365 ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16366 ?auto_16364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16363 ?auto_16362 ?auto_16361 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16570 - OBJ
      ?auto_16569 - LOCATION
    )
    :vars
    (
      ?auto_16573 - LOCATION
      ?auto_16572 - CITY
      ?auto_16575 - OBJ
      ?auto_16574 - TRUCK
      ?auto_16571 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16573 ?auto_16572 ) ( IN-CITY ?auto_16569 ?auto_16572 ) ( not ( = ?auto_16569 ?auto_16573 ) ) ( not ( = ?auto_16575 ?auto_16570 ) ) ( OBJ-AT ?auto_16570 ?auto_16573 ) ( TRUCK-AT ?auto_16574 ?auto_16571 ) ( IN-CITY ?auto_16571 ?auto_16572 ) ( not ( = ?auto_16569 ?auto_16571 ) ) ( not ( = ?auto_16573 ?auto_16571 ) ) ( OBJ-AT ?auto_16575 ?auto_16571 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16575 ?auto_16574 ?auto_16571 )
      ( DELIVER-2PKG ?auto_16575 ?auto_16570 ?auto_16569 ) )
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
      ?auto_16581 - LOCATION
      ?auto_16580 - CITY
      ?auto_16579 - TRUCK
      ?auto_16582 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16581 ?auto_16580 ) ( IN-CITY ?auto_16576 ?auto_16580 ) ( not ( = ?auto_16576 ?auto_16581 ) ) ( not ( = ?auto_16577 ?auto_16578 ) ) ( OBJ-AT ?auto_16578 ?auto_16581 ) ( TRUCK-AT ?auto_16579 ?auto_16582 ) ( IN-CITY ?auto_16582 ?auto_16580 ) ( not ( = ?auto_16576 ?auto_16582 ) ) ( not ( = ?auto_16581 ?auto_16582 ) ) ( OBJ-AT ?auto_16577 ?auto_16582 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16578 ?auto_16576 ) )
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
      ?auto_16586 - LOCATION
      ?auto_16589 - CITY
      ?auto_16588 - TRUCK
      ?auto_16587 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16586 ?auto_16589 ) ( IN-CITY ?auto_16583 ?auto_16589 ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16585 ?auto_16584 ) ) ( OBJ-AT ?auto_16584 ?auto_16586 ) ( TRUCK-AT ?auto_16588 ?auto_16587 ) ( IN-CITY ?auto_16587 ?auto_16589 ) ( not ( = ?auto_16583 ?auto_16587 ) ) ( not ( = ?auto_16586 ?auto_16587 ) ) ( OBJ-AT ?auto_16585 ?auto_16587 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16585 ?auto_16584 ?auto_16583 ) )
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
      ?auto_17934 - TRUCK
      ?auto_17932 - LOCATION
      ?auto_17933 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17931 ?auto_17934 ) ( TRUCK-AT ?auto_17934 ?auto_17932 ) ( IN-CITY ?auto_17932 ?auto_17933 ) ( IN-CITY ?auto_17928 ?auto_17933 ) ( not ( = ?auto_17928 ?auto_17932 ) ) ( OBJ-AT ?auto_17929 ?auto_17928 ) ( not ( = ?auto_17929 ?auto_17931 ) ) ( OBJ-AT ?auto_17930 ?auto_17928 ) ( not ( = ?auto_17929 ?auto_17930 ) ) ( not ( = ?auto_17930 ?auto_17931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17929 ?auto_17931 ?auto_17928 ) )
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
      ?auto_17967 - TRUCK
      ?auto_17965 - LOCATION
      ?auto_17966 - CITY
      ?auto_17968 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17964 ?auto_17967 ) ( TRUCK-AT ?auto_17967 ?auto_17965 ) ( IN-CITY ?auto_17965 ?auto_17966 ) ( IN-CITY ?auto_17961 ?auto_17966 ) ( not ( = ?auto_17961 ?auto_17965 ) ) ( OBJ-AT ?auto_17968 ?auto_17961 ) ( not ( = ?auto_17968 ?auto_17964 ) ) ( OBJ-AT ?auto_17962 ?auto_17961 ) ( OBJ-AT ?auto_17963 ?auto_17961 ) ( not ( = ?auto_17962 ?auto_17963 ) ) ( not ( = ?auto_17962 ?auto_17964 ) ) ( not ( = ?auto_17962 ?auto_17968 ) ) ( not ( = ?auto_17963 ?auto_17964 ) ) ( not ( = ?auto_17963 ?auto_17968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17968 ?auto_17964 ?auto_17961 ) )
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
      ?auto_17979 - TRUCK
      ?auto_17977 - LOCATION
      ?auto_17978 - CITY
      ?auto_17980 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17975 ?auto_17979 ) ( TRUCK-AT ?auto_17979 ?auto_17977 ) ( IN-CITY ?auto_17977 ?auto_17978 ) ( IN-CITY ?auto_17973 ?auto_17978 ) ( not ( = ?auto_17973 ?auto_17977 ) ) ( OBJ-AT ?auto_17980 ?auto_17973 ) ( not ( = ?auto_17980 ?auto_17975 ) ) ( OBJ-AT ?auto_17974 ?auto_17973 ) ( OBJ-AT ?auto_17976 ?auto_17973 ) ( not ( = ?auto_17974 ?auto_17975 ) ) ( not ( = ?auto_17974 ?auto_17976 ) ) ( not ( = ?auto_17974 ?auto_17980 ) ) ( not ( = ?auto_17975 ?auto_17976 ) ) ( not ( = ?auto_17976 ?auto_17980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17980 ?auto_17975 ?auto_17973 ) )
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
      ?auto_18017 - TRUCK
      ?auto_18015 - LOCATION
      ?auto_18016 - CITY
      ?auto_18018 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18012 ?auto_18017 ) ( TRUCK-AT ?auto_18017 ?auto_18015 ) ( IN-CITY ?auto_18015 ?auto_18016 ) ( IN-CITY ?auto_18011 ?auto_18016 ) ( not ( = ?auto_18011 ?auto_18015 ) ) ( OBJ-AT ?auto_18018 ?auto_18011 ) ( not ( = ?auto_18018 ?auto_18012 ) ) ( OBJ-AT ?auto_18013 ?auto_18011 ) ( OBJ-AT ?auto_18014 ?auto_18011 ) ( not ( = ?auto_18012 ?auto_18013 ) ) ( not ( = ?auto_18012 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18018 ) ) ( not ( = ?auto_18014 ?auto_18018 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18018 ?auto_18012 ?auto_18011 ) )
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
      ?auto_18057 - TRUCK
      ?auto_18055 - LOCATION
      ?auto_18056 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18054 ?auto_18057 ) ( TRUCK-AT ?auto_18057 ?auto_18055 ) ( IN-CITY ?auto_18055 ?auto_18056 ) ( IN-CITY ?auto_18050 ?auto_18056 ) ( not ( = ?auto_18050 ?auto_18055 ) ) ( OBJ-AT ?auto_18051 ?auto_18050 ) ( not ( = ?auto_18051 ?auto_18054 ) ) ( OBJ-AT ?auto_18052 ?auto_18050 ) ( OBJ-AT ?auto_18053 ?auto_18050 ) ( not ( = ?auto_18051 ?auto_18052 ) ) ( not ( = ?auto_18051 ?auto_18053 ) ) ( not ( = ?auto_18052 ?auto_18053 ) ) ( not ( = ?auto_18052 ?auto_18054 ) ) ( not ( = ?auto_18053 ?auto_18054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18051 ?auto_18054 ?auto_18050 ) )
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
      ?auto_18073 - TRUCK
      ?auto_18071 - LOCATION
      ?auto_18072 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18069 ?auto_18073 ) ( TRUCK-AT ?auto_18073 ?auto_18071 ) ( IN-CITY ?auto_18071 ?auto_18072 ) ( IN-CITY ?auto_18066 ?auto_18072 ) ( not ( = ?auto_18066 ?auto_18071 ) ) ( OBJ-AT ?auto_18068 ?auto_18066 ) ( not ( = ?auto_18068 ?auto_18069 ) ) ( OBJ-AT ?auto_18067 ?auto_18066 ) ( OBJ-AT ?auto_18070 ?auto_18066 ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18069 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18068 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18068 ?auto_18069 ?auto_18066 ) )
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
      ?auto_18113 - TRUCK
      ?auto_18111 - LOCATION
      ?auto_18112 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18109 ?auto_18113 ) ( TRUCK-AT ?auto_18113 ?auto_18111 ) ( IN-CITY ?auto_18111 ?auto_18112 ) ( IN-CITY ?auto_18106 ?auto_18112 ) ( not ( = ?auto_18106 ?auto_18111 ) ) ( OBJ-AT ?auto_18107 ?auto_18106 ) ( not ( = ?auto_18107 ?auto_18109 ) ) ( OBJ-AT ?auto_18108 ?auto_18106 ) ( OBJ-AT ?auto_18110 ?auto_18106 ) ( not ( = ?auto_18107 ?auto_18108 ) ) ( not ( = ?auto_18107 ?auto_18110 ) ) ( not ( = ?auto_18108 ?auto_18109 ) ) ( not ( = ?auto_18108 ?auto_18110 ) ) ( not ( = ?auto_18109 ?auto_18110 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18107 ?auto_18109 ?auto_18106 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18139 - OBJ
      ?auto_18140 - OBJ
      ?auto_18141 - OBJ
      ?auto_18142 - OBJ
      ?auto_18138 - LOCATION
    )
    :vars
    (
      ?auto_18145 - TRUCK
      ?auto_18143 - LOCATION
      ?auto_18144 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18140 ?auto_18145 ) ( TRUCK-AT ?auto_18145 ?auto_18143 ) ( IN-CITY ?auto_18143 ?auto_18144 ) ( IN-CITY ?auto_18138 ?auto_18144 ) ( not ( = ?auto_18138 ?auto_18143 ) ) ( OBJ-AT ?auto_18139 ?auto_18138 ) ( not ( = ?auto_18139 ?auto_18140 ) ) ( OBJ-AT ?auto_18141 ?auto_18138 ) ( OBJ-AT ?auto_18142 ?auto_18138 ) ( not ( = ?auto_18139 ?auto_18141 ) ) ( not ( = ?auto_18139 ?auto_18142 ) ) ( not ( = ?auto_18140 ?auto_18141 ) ) ( not ( = ?auto_18140 ?auto_18142 ) ) ( not ( = ?auto_18141 ?auto_18142 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18139 ?auto_18140 ?auto_18138 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18243 - OBJ
      ?auto_18244 - OBJ
      ?auto_18245 - OBJ
      ?auto_18246 - OBJ
      ?auto_18242 - LOCATION
    )
    :vars
    (
      ?auto_18249 - TRUCK
      ?auto_18247 - LOCATION
      ?auto_18248 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18246 ?auto_18249 ) ( TRUCK-AT ?auto_18249 ?auto_18247 ) ( IN-CITY ?auto_18247 ?auto_18248 ) ( IN-CITY ?auto_18242 ?auto_18248 ) ( not ( = ?auto_18242 ?auto_18247 ) ) ( OBJ-AT ?auto_18245 ?auto_18242 ) ( not ( = ?auto_18245 ?auto_18246 ) ) ( OBJ-AT ?auto_18243 ?auto_18242 ) ( OBJ-AT ?auto_18244 ?auto_18242 ) ( not ( = ?auto_18243 ?auto_18244 ) ) ( not ( = ?auto_18243 ?auto_18245 ) ) ( not ( = ?auto_18243 ?auto_18246 ) ) ( not ( = ?auto_18244 ?auto_18245 ) ) ( not ( = ?auto_18244 ?auto_18246 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18245 ?auto_18246 ?auto_18242 ) )
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
      ?auto_18257 - TRUCK
      ?auto_18255 - LOCATION
      ?auto_18256 - CITY
      ?auto_18258 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18254 ?auto_18257 ) ( TRUCK-AT ?auto_18257 ?auto_18255 ) ( IN-CITY ?auto_18255 ?auto_18256 ) ( IN-CITY ?auto_18250 ?auto_18256 ) ( not ( = ?auto_18250 ?auto_18255 ) ) ( OBJ-AT ?auto_18258 ?auto_18250 ) ( not ( = ?auto_18258 ?auto_18254 ) ) ( OBJ-AT ?auto_18251 ?auto_18250 ) ( OBJ-AT ?auto_18252 ?auto_18250 ) ( OBJ-AT ?auto_18253 ?auto_18250 ) ( not ( = ?auto_18251 ?auto_18252 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18254 ) ) ( not ( = ?auto_18251 ?auto_18258 ) ) ( not ( = ?auto_18252 ?auto_18253 ) ) ( not ( = ?auto_18252 ?auto_18254 ) ) ( not ( = ?auto_18252 ?auto_18258 ) ) ( not ( = ?auto_18253 ?auto_18254 ) ) ( not ( = ?auto_18253 ?auto_18258 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18258 ?auto_18254 ?auto_18250 ) )
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
      ?auto_18274 - TRUCK
      ?auto_18272 - LOCATION
      ?auto_18273 - CITY
      ?auto_18275 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18270 ?auto_18274 ) ( TRUCK-AT ?auto_18274 ?auto_18272 ) ( IN-CITY ?auto_18272 ?auto_18273 ) ( IN-CITY ?auto_18267 ?auto_18273 ) ( not ( = ?auto_18267 ?auto_18272 ) ) ( OBJ-AT ?auto_18275 ?auto_18267 ) ( not ( = ?auto_18275 ?auto_18270 ) ) ( OBJ-AT ?auto_18268 ?auto_18267 ) ( OBJ-AT ?auto_18269 ?auto_18267 ) ( OBJ-AT ?auto_18271 ?auto_18267 ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18271 ) ) ( not ( = ?auto_18268 ?auto_18275 ) ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( not ( = ?auto_18269 ?auto_18271 ) ) ( not ( = ?auto_18269 ?auto_18275 ) ) ( not ( = ?auto_18270 ?auto_18271 ) ) ( not ( = ?auto_18271 ?auto_18275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18275 ?auto_18270 ?auto_18267 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18310 - OBJ
      ?auto_18311 - OBJ
      ?auto_18312 - OBJ
      ?auto_18313 - OBJ
      ?auto_18309 - LOCATION
    )
    :vars
    (
      ?auto_18316 - TRUCK
      ?auto_18314 - LOCATION
      ?auto_18315 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18311 ?auto_18316 ) ( TRUCK-AT ?auto_18316 ?auto_18314 ) ( IN-CITY ?auto_18314 ?auto_18315 ) ( IN-CITY ?auto_18309 ?auto_18315 ) ( not ( = ?auto_18309 ?auto_18314 ) ) ( OBJ-AT ?auto_18313 ?auto_18309 ) ( not ( = ?auto_18313 ?auto_18311 ) ) ( OBJ-AT ?auto_18310 ?auto_18309 ) ( OBJ-AT ?auto_18312 ?auto_18309 ) ( not ( = ?auto_18310 ?auto_18311 ) ) ( not ( = ?auto_18310 ?auto_18312 ) ) ( not ( = ?auto_18310 ?auto_18313 ) ) ( not ( = ?auto_18311 ?auto_18312 ) ) ( not ( = ?auto_18312 ?auto_18313 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18313 ?auto_18311 ?auto_18309 ) )
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
      ?auto_18324 - TRUCK
      ?auto_18322 - LOCATION
      ?auto_18323 - CITY
      ?auto_18325 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18319 ?auto_18324 ) ( TRUCK-AT ?auto_18324 ?auto_18322 ) ( IN-CITY ?auto_18322 ?auto_18323 ) ( IN-CITY ?auto_18317 ?auto_18323 ) ( not ( = ?auto_18317 ?auto_18322 ) ) ( OBJ-AT ?auto_18325 ?auto_18317 ) ( not ( = ?auto_18325 ?auto_18319 ) ) ( OBJ-AT ?auto_18318 ?auto_18317 ) ( OBJ-AT ?auto_18320 ?auto_18317 ) ( OBJ-AT ?auto_18321 ?auto_18317 ) ( not ( = ?auto_18318 ?auto_18319 ) ) ( not ( = ?auto_18318 ?auto_18320 ) ) ( not ( = ?auto_18318 ?auto_18321 ) ) ( not ( = ?auto_18318 ?auto_18325 ) ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18321 ) ) ( not ( = ?auto_18320 ?auto_18321 ) ) ( not ( = ?auto_18320 ?auto_18325 ) ) ( not ( = ?auto_18321 ?auto_18325 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18325 ?auto_18319 ?auto_18317 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18370 - OBJ
      ?auto_18371 - OBJ
      ?auto_18372 - OBJ
      ?auto_18373 - OBJ
      ?auto_18369 - LOCATION
    )
    :vars
    (
      ?auto_18376 - TRUCK
      ?auto_18374 - LOCATION
      ?auto_18375 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18370 ?auto_18376 ) ( TRUCK-AT ?auto_18376 ?auto_18374 ) ( IN-CITY ?auto_18374 ?auto_18375 ) ( IN-CITY ?auto_18369 ?auto_18375 ) ( not ( = ?auto_18369 ?auto_18374 ) ) ( OBJ-AT ?auto_18371 ?auto_18369 ) ( not ( = ?auto_18371 ?auto_18370 ) ) ( OBJ-AT ?auto_18372 ?auto_18369 ) ( OBJ-AT ?auto_18373 ?auto_18369 ) ( not ( = ?auto_18370 ?auto_18372 ) ) ( not ( = ?auto_18370 ?auto_18373 ) ) ( not ( = ?auto_18371 ?auto_18372 ) ) ( not ( = ?auto_18371 ?auto_18373 ) ) ( not ( = ?auto_18372 ?auto_18373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18371 ?auto_18370 ?auto_18369 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18442 - OBJ
      ?auto_18443 - OBJ
      ?auto_18444 - OBJ
      ?auto_18445 - OBJ
      ?auto_18441 - LOCATION
    )
    :vars
    (
      ?auto_18448 - TRUCK
      ?auto_18446 - LOCATION
      ?auto_18447 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18442 ?auto_18448 ) ( TRUCK-AT ?auto_18448 ?auto_18446 ) ( IN-CITY ?auto_18446 ?auto_18447 ) ( IN-CITY ?auto_18441 ?auto_18447 ) ( not ( = ?auto_18441 ?auto_18446 ) ) ( OBJ-AT ?auto_18444 ?auto_18441 ) ( not ( = ?auto_18444 ?auto_18442 ) ) ( OBJ-AT ?auto_18443 ?auto_18441 ) ( OBJ-AT ?auto_18445 ?auto_18441 ) ( not ( = ?auto_18442 ?auto_18443 ) ) ( not ( = ?auto_18442 ?auto_18445 ) ) ( not ( = ?auto_18443 ?auto_18444 ) ) ( not ( = ?auto_18443 ?auto_18445 ) ) ( not ( = ?auto_18444 ?auto_18445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18444 ?auto_18442 ?auto_18441 ) )
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
      ?auto_18472 - TRUCK
      ?auto_18470 - LOCATION
      ?auto_18471 - CITY
      ?auto_18473 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18466 ?auto_18472 ) ( TRUCK-AT ?auto_18472 ?auto_18470 ) ( IN-CITY ?auto_18470 ?auto_18471 ) ( IN-CITY ?auto_18465 ?auto_18471 ) ( not ( = ?auto_18465 ?auto_18470 ) ) ( OBJ-AT ?auto_18473 ?auto_18465 ) ( not ( = ?auto_18473 ?auto_18466 ) ) ( OBJ-AT ?auto_18467 ?auto_18465 ) ( OBJ-AT ?auto_18468 ?auto_18465 ) ( OBJ-AT ?auto_18469 ?auto_18465 ) ( not ( = ?auto_18466 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18468 ) ) ( not ( = ?auto_18466 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18467 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18473 ) ) ( not ( = ?auto_18468 ?auto_18469 ) ) ( not ( = ?auto_18468 ?auto_18473 ) ) ( not ( = ?auto_18469 ?auto_18473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18473 ?auto_18466 ?auto_18465 ) )
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
      ?auto_18632 - TRUCK
      ?auto_18633 - LOCATION
      ?auto_18631 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18632 ?auto_18633 ) ( IN-CITY ?auto_18633 ?auto_18631 ) ( IN-CITY ?auto_18627 ?auto_18631 ) ( not ( = ?auto_18627 ?auto_18633 ) ) ( OBJ-AT ?auto_18630 ?auto_18627 ) ( not ( = ?auto_18630 ?auto_18629 ) ) ( OBJ-AT ?auto_18629 ?auto_18633 ) ( OBJ-AT ?auto_18628 ?auto_18627 ) ( not ( = ?auto_18628 ?auto_18629 ) ) ( not ( = ?auto_18628 ?auto_18630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18630 ?auto_18629 ?auto_18627 ) )
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
      ?auto_18654 - TRUCK
      ?auto_18656 - LOCATION
      ?auto_18653 - CITY
      ?auto_18655 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18654 ?auto_18656 ) ( IN-CITY ?auto_18656 ?auto_18653 ) ( IN-CITY ?auto_18649 ?auto_18653 ) ( not ( = ?auto_18649 ?auto_18656 ) ) ( OBJ-AT ?auto_18655 ?auto_18649 ) ( not ( = ?auto_18655 ?auto_18652 ) ) ( OBJ-AT ?auto_18652 ?auto_18656 ) ( OBJ-AT ?auto_18650 ?auto_18649 ) ( OBJ-AT ?auto_18651 ?auto_18649 ) ( not ( = ?auto_18650 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18650 ?auto_18655 ) ) ( not ( = ?auto_18651 ?auto_18652 ) ) ( not ( = ?auto_18651 ?auto_18655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18655 ?auto_18652 ?auto_18649 ) )
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
      ?auto_18666 - TRUCK
      ?auto_18668 - LOCATION
      ?auto_18665 - CITY
      ?auto_18667 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18666 ?auto_18668 ) ( IN-CITY ?auto_18668 ?auto_18665 ) ( IN-CITY ?auto_18661 ?auto_18665 ) ( not ( = ?auto_18661 ?auto_18668 ) ) ( OBJ-AT ?auto_18667 ?auto_18661 ) ( not ( = ?auto_18667 ?auto_18663 ) ) ( OBJ-AT ?auto_18663 ?auto_18668 ) ( OBJ-AT ?auto_18662 ?auto_18661 ) ( OBJ-AT ?auto_18664 ?auto_18661 ) ( not ( = ?auto_18662 ?auto_18663 ) ) ( not ( = ?auto_18662 ?auto_18664 ) ) ( not ( = ?auto_18662 ?auto_18667 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( not ( = ?auto_18664 ?auto_18667 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18667 ?auto_18663 ?auto_18661 ) )
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
      ?auto_18704 - TRUCK
      ?auto_18706 - LOCATION
      ?auto_18703 - CITY
      ?auto_18705 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18704 ?auto_18706 ) ( IN-CITY ?auto_18706 ?auto_18703 ) ( IN-CITY ?auto_18699 ?auto_18703 ) ( not ( = ?auto_18699 ?auto_18706 ) ) ( OBJ-AT ?auto_18705 ?auto_18699 ) ( not ( = ?auto_18705 ?auto_18700 ) ) ( OBJ-AT ?auto_18700 ?auto_18706 ) ( OBJ-AT ?auto_18701 ?auto_18699 ) ( OBJ-AT ?auto_18702 ?auto_18699 ) ( not ( = ?auto_18700 ?auto_18701 ) ) ( not ( = ?auto_18700 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18705 ) ) ( not ( = ?auto_18702 ?auto_18705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18705 ?auto_18700 ?auto_18699 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18739 - OBJ
      ?auto_18740 - OBJ
      ?auto_18741 - OBJ
      ?auto_18742 - OBJ
      ?auto_18738 - LOCATION
    )
    :vars
    (
      ?auto_18744 - TRUCK
      ?auto_18745 - LOCATION
      ?auto_18743 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18744 ?auto_18745 ) ( IN-CITY ?auto_18745 ?auto_18743 ) ( IN-CITY ?auto_18738 ?auto_18743 ) ( not ( = ?auto_18738 ?auto_18745 ) ) ( OBJ-AT ?auto_18740 ?auto_18738 ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( OBJ-AT ?auto_18742 ?auto_18745 ) ( OBJ-AT ?auto_18739 ?auto_18738 ) ( OBJ-AT ?auto_18741 ?auto_18738 ) ( not ( = ?auto_18739 ?auto_18740 ) ) ( not ( = ?auto_18739 ?auto_18741 ) ) ( not ( = ?auto_18739 ?auto_18742 ) ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( not ( = ?auto_18741 ?auto_18742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18740 ?auto_18742 ?auto_18738 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18779 - OBJ
      ?auto_18780 - OBJ
      ?auto_18781 - OBJ
      ?auto_18782 - OBJ
      ?auto_18778 - LOCATION
    )
    :vars
    (
      ?auto_18784 - TRUCK
      ?auto_18785 - LOCATION
      ?auto_18783 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18784 ?auto_18785 ) ( IN-CITY ?auto_18785 ?auto_18783 ) ( IN-CITY ?auto_18778 ?auto_18783 ) ( not ( = ?auto_18778 ?auto_18785 ) ) ( OBJ-AT ?auto_18781 ?auto_18778 ) ( not ( = ?auto_18781 ?auto_18782 ) ) ( OBJ-AT ?auto_18782 ?auto_18785 ) ( OBJ-AT ?auto_18779 ?auto_18778 ) ( OBJ-AT ?auto_18780 ?auto_18778 ) ( not ( = ?auto_18779 ?auto_18780 ) ) ( not ( = ?auto_18779 ?auto_18781 ) ) ( not ( = ?auto_18779 ?auto_18782 ) ) ( not ( = ?auto_18780 ?auto_18781 ) ) ( not ( = ?auto_18780 ?auto_18782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18781 ?auto_18782 ?auto_18778 ) )
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
      ?auto_18824 - TRUCK
      ?auto_18825 - LOCATION
      ?auto_18823 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18824 ?auto_18825 ) ( IN-CITY ?auto_18825 ?auto_18823 ) ( IN-CITY ?auto_18818 ?auto_18823 ) ( not ( = ?auto_18818 ?auto_18825 ) ) ( OBJ-AT ?auto_18822 ?auto_18818 ) ( not ( = ?auto_18822 ?auto_18820 ) ) ( OBJ-AT ?auto_18820 ?auto_18825 ) ( OBJ-AT ?auto_18819 ?auto_18818 ) ( OBJ-AT ?auto_18821 ?auto_18818 ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18822 ) ) ( not ( = ?auto_18820 ?auto_18821 ) ) ( not ( = ?auto_18821 ?auto_18822 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18822 ?auto_18820 ?auto_18818 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18907 - OBJ
      ?auto_18908 - OBJ
      ?auto_18909 - OBJ
      ?auto_18910 - OBJ
      ?auto_18906 - LOCATION
    )
    :vars
    (
      ?auto_18912 - TRUCK
      ?auto_18913 - LOCATION
      ?auto_18911 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18912 ?auto_18913 ) ( IN-CITY ?auto_18913 ?auto_18911 ) ( IN-CITY ?auto_18906 ?auto_18911 ) ( not ( = ?auto_18906 ?auto_18913 ) ) ( OBJ-AT ?auto_18908 ?auto_18906 ) ( not ( = ?auto_18908 ?auto_18909 ) ) ( OBJ-AT ?auto_18909 ?auto_18913 ) ( OBJ-AT ?auto_18907 ?auto_18906 ) ( OBJ-AT ?auto_18910 ?auto_18906 ) ( not ( = ?auto_18907 ?auto_18908 ) ) ( not ( = ?auto_18907 ?auto_18909 ) ) ( not ( = ?auto_18907 ?auto_18910 ) ) ( not ( = ?auto_18908 ?auto_18910 ) ) ( not ( = ?auto_18909 ?auto_18910 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18908 ?auto_18909 ?auto_18906 ) )
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
      ?auto_18944 - TRUCK
      ?auto_18946 - LOCATION
      ?auto_18943 - CITY
      ?auto_18945 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18944 ?auto_18946 ) ( IN-CITY ?auto_18946 ?auto_18943 ) ( IN-CITY ?auto_18938 ?auto_18943 ) ( not ( = ?auto_18938 ?auto_18946 ) ) ( OBJ-AT ?auto_18945 ?auto_18938 ) ( not ( = ?auto_18945 ?auto_18942 ) ) ( OBJ-AT ?auto_18942 ?auto_18946 ) ( OBJ-AT ?auto_18939 ?auto_18938 ) ( OBJ-AT ?auto_18940 ?auto_18938 ) ( OBJ-AT ?auto_18941 ?auto_18938 ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18942 ) ) ( not ( = ?auto_18939 ?auto_18945 ) ) ( not ( = ?auto_18940 ?auto_18941 ) ) ( not ( = ?auto_18940 ?auto_18942 ) ) ( not ( = ?auto_18940 ?auto_18945 ) ) ( not ( = ?auto_18941 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18945 ?auto_18942 ?auto_18938 ) )
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
      ?auto_18953 - TRUCK
      ?auto_18954 - LOCATION
      ?auto_18952 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18953 ?auto_18954 ) ( IN-CITY ?auto_18954 ?auto_18952 ) ( IN-CITY ?auto_18947 ?auto_18952 ) ( not ( = ?auto_18947 ?auto_18954 ) ) ( OBJ-AT ?auto_18951 ?auto_18947 ) ( not ( = ?auto_18951 ?auto_18950 ) ) ( OBJ-AT ?auto_18950 ?auto_18954 ) ( OBJ-AT ?auto_18948 ?auto_18947 ) ( OBJ-AT ?auto_18949 ?auto_18947 ) ( not ( = ?auto_18948 ?auto_18949 ) ) ( not ( = ?auto_18948 ?auto_18950 ) ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( not ( = ?auto_18949 ?auto_18950 ) ) ( not ( = ?auto_18949 ?auto_18951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18951 ?auto_18950 ?auto_18947 ) )
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
      ?auto_18961 - TRUCK
      ?auto_18963 - LOCATION
      ?auto_18960 - CITY
      ?auto_18962 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18961 ?auto_18963 ) ( IN-CITY ?auto_18963 ?auto_18960 ) ( IN-CITY ?auto_18955 ?auto_18960 ) ( not ( = ?auto_18955 ?auto_18963 ) ) ( OBJ-AT ?auto_18962 ?auto_18955 ) ( not ( = ?auto_18962 ?auto_18958 ) ) ( OBJ-AT ?auto_18958 ?auto_18963 ) ( OBJ-AT ?auto_18956 ?auto_18955 ) ( OBJ-AT ?auto_18957 ?auto_18955 ) ( OBJ-AT ?auto_18959 ?auto_18955 ) ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18956 ?auto_18958 ) ) ( not ( = ?auto_18956 ?auto_18959 ) ) ( not ( = ?auto_18956 ?auto_18962 ) ) ( not ( = ?auto_18957 ?auto_18958 ) ) ( not ( = ?auto_18957 ?auto_18959 ) ) ( not ( = ?auto_18957 ?auto_18962 ) ) ( not ( = ?auto_18958 ?auto_18959 ) ) ( not ( = ?auto_18959 ?auto_18962 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18962 ?auto_18958 ?auto_18955 ) )
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
      ?auto_18979 - TRUCK
      ?auto_18980 - LOCATION
      ?auto_18978 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18979 ?auto_18980 ) ( IN-CITY ?auto_18980 ?auto_18978 ) ( IN-CITY ?auto_18973 ?auto_18978 ) ( not ( = ?auto_18973 ?auto_18980 ) ) ( OBJ-AT ?auto_18976 ?auto_18973 ) ( not ( = ?auto_18976 ?auto_18975 ) ) ( OBJ-AT ?auto_18975 ?auto_18980 ) ( OBJ-AT ?auto_18974 ?auto_18973 ) ( OBJ-AT ?auto_18977 ?auto_18973 ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18976 ?auto_18975 ?auto_18973 ) )
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
      ?auto_19011 - TRUCK
      ?auto_19013 - LOCATION
      ?auto_19010 - CITY
      ?auto_19012 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19011 ?auto_19013 ) ( IN-CITY ?auto_19013 ?auto_19010 ) ( IN-CITY ?auto_19005 ?auto_19010 ) ( not ( = ?auto_19005 ?auto_19013 ) ) ( OBJ-AT ?auto_19012 ?auto_19005 ) ( not ( = ?auto_19012 ?auto_19007 ) ) ( OBJ-AT ?auto_19007 ?auto_19013 ) ( OBJ-AT ?auto_19006 ?auto_19005 ) ( OBJ-AT ?auto_19008 ?auto_19005 ) ( OBJ-AT ?auto_19009 ?auto_19005 ) ( not ( = ?auto_19006 ?auto_19007 ) ) ( not ( = ?auto_19006 ?auto_19008 ) ) ( not ( = ?auto_19006 ?auto_19009 ) ) ( not ( = ?auto_19006 ?auto_19012 ) ) ( not ( = ?auto_19007 ?auto_19008 ) ) ( not ( = ?auto_19007 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19012 ) ) ( not ( = ?auto_19009 ?auto_19012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19012 ?auto_19007 ?auto_19005 ) )
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
      ?auto_19055 - TRUCK
      ?auto_19056 - LOCATION
      ?auto_19054 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19055 ?auto_19056 ) ( IN-CITY ?auto_19056 ?auto_19054 ) ( IN-CITY ?auto_19049 ?auto_19054 ) ( not ( = ?auto_19049 ?auto_19056 ) ) ( OBJ-AT ?auto_19051 ?auto_19049 ) ( not ( = ?auto_19051 ?auto_19050 ) ) ( OBJ-AT ?auto_19050 ?auto_19056 ) ( OBJ-AT ?auto_19052 ?auto_19049 ) ( OBJ-AT ?auto_19053 ?auto_19049 ) ( not ( = ?auto_19050 ?auto_19052 ) ) ( not ( = ?auto_19050 ?auto_19053 ) ) ( not ( = ?auto_19051 ?auto_19052 ) ) ( not ( = ?auto_19051 ?auto_19053 ) ) ( not ( = ?auto_19052 ?auto_19053 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19051 ?auto_19050 ?auto_19049 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19130 - OBJ
      ?auto_19131 - OBJ
      ?auto_19132 - OBJ
      ?auto_19133 - OBJ
      ?auto_19129 - LOCATION
    )
    :vars
    (
      ?auto_19135 - TRUCK
      ?auto_19136 - LOCATION
      ?auto_19134 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19135 ?auto_19136 ) ( IN-CITY ?auto_19136 ?auto_19134 ) ( IN-CITY ?auto_19129 ?auto_19134 ) ( not ( = ?auto_19129 ?auto_19136 ) ) ( OBJ-AT ?auto_19132 ?auto_19129 ) ( not ( = ?auto_19132 ?auto_19130 ) ) ( OBJ-AT ?auto_19130 ?auto_19136 ) ( OBJ-AT ?auto_19131 ?auto_19129 ) ( OBJ-AT ?auto_19133 ?auto_19129 ) ( not ( = ?auto_19130 ?auto_19131 ) ) ( not ( = ?auto_19130 ?auto_19133 ) ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( not ( = ?auto_19131 ?auto_19133 ) ) ( not ( = ?auto_19132 ?auto_19133 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19132 ?auto_19130 ?auto_19129 ) )
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
      ?auto_19159 - TRUCK
      ?auto_19161 - LOCATION
      ?auto_19158 - CITY
      ?auto_19160 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19159 ?auto_19161 ) ( IN-CITY ?auto_19161 ?auto_19158 ) ( IN-CITY ?auto_19153 ?auto_19158 ) ( not ( = ?auto_19153 ?auto_19161 ) ) ( OBJ-AT ?auto_19160 ?auto_19153 ) ( not ( = ?auto_19160 ?auto_19154 ) ) ( OBJ-AT ?auto_19154 ?auto_19161 ) ( OBJ-AT ?auto_19155 ?auto_19153 ) ( OBJ-AT ?auto_19156 ?auto_19153 ) ( OBJ-AT ?auto_19157 ?auto_19153 ) ( not ( = ?auto_19154 ?auto_19155 ) ) ( not ( = ?auto_19154 ?auto_19156 ) ) ( not ( = ?auto_19154 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19156 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19160 ) ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( not ( = ?auto_19156 ?auto_19160 ) ) ( not ( = ?auto_19157 ?auto_19160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19160 ?auto_19154 ?auto_19153 ) )
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
      ?auto_19309 - CITY
      ?auto_19308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19310 ?auto_19309 ) ( IN-CITY ?auto_19304 ?auto_19309 ) ( not ( = ?auto_19304 ?auto_19310 ) ) ( OBJ-AT ?auto_19306 ?auto_19304 ) ( not ( = ?auto_19306 ?auto_19307 ) ) ( OBJ-AT ?auto_19307 ?auto_19310 ) ( TRUCK-AT ?auto_19308 ?auto_19304 ) ( OBJ-AT ?auto_19305 ?auto_19304 ) ( not ( = ?auto_19305 ?auto_19306 ) ) ( not ( = ?auto_19305 ?auto_19307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19306 ?auto_19307 ?auto_19304 ) )
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
      ?auto_19342 - CITY
      ?auto_19344 - OBJ
      ?auto_19341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19343 ?auto_19342 ) ( IN-CITY ?auto_19337 ?auto_19342 ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( OBJ-AT ?auto_19344 ?auto_19337 ) ( not ( = ?auto_19344 ?auto_19340 ) ) ( OBJ-AT ?auto_19340 ?auto_19343 ) ( TRUCK-AT ?auto_19341 ?auto_19337 ) ( OBJ-AT ?auto_19338 ?auto_19337 ) ( OBJ-AT ?auto_19339 ?auto_19337 ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19344 ) ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19344 ?auto_19340 ?auto_19337 ) )
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
      ?auto_19354 - CITY
      ?auto_19356 - OBJ
      ?auto_19353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19355 ?auto_19354 ) ( IN-CITY ?auto_19349 ?auto_19354 ) ( not ( = ?auto_19349 ?auto_19355 ) ) ( OBJ-AT ?auto_19356 ?auto_19349 ) ( not ( = ?auto_19356 ?auto_19351 ) ) ( OBJ-AT ?auto_19351 ?auto_19355 ) ( TRUCK-AT ?auto_19353 ?auto_19349 ) ( OBJ-AT ?auto_19350 ?auto_19349 ) ( OBJ-AT ?auto_19352 ?auto_19349 ) ( not ( = ?auto_19350 ?auto_19351 ) ) ( not ( = ?auto_19350 ?auto_19352 ) ) ( not ( = ?auto_19350 ?auto_19356 ) ) ( not ( = ?auto_19351 ?auto_19352 ) ) ( not ( = ?auto_19352 ?auto_19356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19356 ?auto_19351 ?auto_19349 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19366 - OBJ
      ?auto_19367 - OBJ
      ?auto_19368 - OBJ
      ?auto_19365 - LOCATION
    )
    :vars
    (
      ?auto_19371 - LOCATION
      ?auto_19370 - CITY
      ?auto_19369 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19371 ?auto_19370 ) ( IN-CITY ?auto_19365 ?auto_19370 ) ( not ( = ?auto_19365 ?auto_19371 ) ) ( OBJ-AT ?auto_19368 ?auto_19365 ) ( not ( = ?auto_19368 ?auto_19366 ) ) ( OBJ-AT ?auto_19366 ?auto_19371 ) ( TRUCK-AT ?auto_19369 ?auto_19365 ) ( OBJ-AT ?auto_19367 ?auto_19365 ) ( not ( = ?auto_19366 ?auto_19367 ) ) ( not ( = ?auto_19367 ?auto_19368 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19368 ?auto_19366 ?auto_19365 ) )
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
      ?auto_19392 - CITY
      ?auto_19394 - OBJ
      ?auto_19391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19393 ?auto_19392 ) ( IN-CITY ?auto_19387 ?auto_19392 ) ( not ( = ?auto_19387 ?auto_19393 ) ) ( OBJ-AT ?auto_19394 ?auto_19387 ) ( not ( = ?auto_19394 ?auto_19388 ) ) ( OBJ-AT ?auto_19388 ?auto_19393 ) ( TRUCK-AT ?auto_19391 ?auto_19387 ) ( OBJ-AT ?auto_19389 ?auto_19387 ) ( OBJ-AT ?auto_19390 ?auto_19387 ) ( not ( = ?auto_19388 ?auto_19389 ) ) ( not ( = ?auto_19388 ?auto_19390 ) ) ( not ( = ?auto_19389 ?auto_19390 ) ) ( not ( = ?auto_19389 ?auto_19394 ) ) ( not ( = ?auto_19390 ?auto_19394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19394 ?auto_19388 ?auto_19387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19427 - OBJ
      ?auto_19428 - OBJ
      ?auto_19429 - OBJ
      ?auto_19430 - OBJ
      ?auto_19426 - LOCATION
    )
    :vars
    (
      ?auto_19433 - LOCATION
      ?auto_19432 - CITY
      ?auto_19431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19433 ?auto_19432 ) ( IN-CITY ?auto_19426 ?auto_19432 ) ( not ( = ?auto_19426 ?auto_19433 ) ) ( OBJ-AT ?auto_19429 ?auto_19426 ) ( not ( = ?auto_19429 ?auto_19430 ) ) ( OBJ-AT ?auto_19430 ?auto_19433 ) ( TRUCK-AT ?auto_19431 ?auto_19426 ) ( OBJ-AT ?auto_19427 ?auto_19426 ) ( OBJ-AT ?auto_19428 ?auto_19426 ) ( not ( = ?auto_19427 ?auto_19428 ) ) ( not ( = ?auto_19427 ?auto_19429 ) ) ( not ( = ?auto_19427 ?auto_19430 ) ) ( not ( = ?auto_19428 ?auto_19429 ) ) ( not ( = ?auto_19428 ?auto_19430 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19429 ?auto_19430 ?auto_19426 ) )
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
      ?auto_19440 - CITY
      ?auto_19439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19441 ?auto_19440 ) ( IN-CITY ?auto_19434 ?auto_19440 ) ( not ( = ?auto_19434 ?auto_19441 ) ) ( OBJ-AT ?auto_19436 ?auto_19434 ) ( not ( = ?auto_19436 ?auto_19438 ) ) ( OBJ-AT ?auto_19438 ?auto_19441 ) ( TRUCK-AT ?auto_19439 ?auto_19434 ) ( OBJ-AT ?auto_19435 ?auto_19434 ) ( OBJ-AT ?auto_19437 ?auto_19434 ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19435 ?auto_19438 ) ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19437 ?auto_19438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19436 ?auto_19438 ?auto_19434 ) )
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
      ?auto_19456 - CITY
      ?auto_19455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19457 ?auto_19456 ) ( IN-CITY ?auto_19450 ?auto_19456 ) ( not ( = ?auto_19450 ?auto_19457 ) ) ( OBJ-AT ?auto_19451 ?auto_19450 ) ( not ( = ?auto_19451 ?auto_19453 ) ) ( OBJ-AT ?auto_19453 ?auto_19457 ) ( TRUCK-AT ?auto_19455 ?auto_19450 ) ( OBJ-AT ?auto_19452 ?auto_19450 ) ( OBJ-AT ?auto_19454 ?auto_19450 ) ( not ( = ?auto_19451 ?auto_19452 ) ) ( not ( = ?auto_19451 ?auto_19454 ) ) ( not ( = ?auto_19452 ?auto_19453 ) ) ( not ( = ?auto_19452 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19454 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19451 ?auto_19453 ?auto_19450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19595 - OBJ
      ?auto_19596 - OBJ
      ?auto_19597 - OBJ
      ?auto_19598 - OBJ
      ?auto_19594 - LOCATION
    )
    :vars
    (
      ?auto_19601 - LOCATION
      ?auto_19600 - CITY
      ?auto_19599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19601 ?auto_19600 ) ( IN-CITY ?auto_19594 ?auto_19600 ) ( not ( = ?auto_19594 ?auto_19601 ) ) ( OBJ-AT ?auto_19596 ?auto_19594 ) ( not ( = ?auto_19596 ?auto_19597 ) ) ( OBJ-AT ?auto_19597 ?auto_19601 ) ( TRUCK-AT ?auto_19599 ?auto_19594 ) ( OBJ-AT ?auto_19595 ?auto_19594 ) ( OBJ-AT ?auto_19598 ?auto_19594 ) ( not ( = ?auto_19595 ?auto_19596 ) ) ( not ( = ?auto_19595 ?auto_19597 ) ) ( not ( = ?auto_19595 ?auto_19598 ) ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19596 ?auto_19597 ?auto_19594 ) )
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
      ?auto_19632 - CITY
      ?auto_19634 - OBJ
      ?auto_19631 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19633 ?auto_19632 ) ( IN-CITY ?auto_19626 ?auto_19632 ) ( not ( = ?auto_19626 ?auto_19633 ) ) ( OBJ-AT ?auto_19634 ?auto_19626 ) ( not ( = ?auto_19634 ?auto_19630 ) ) ( OBJ-AT ?auto_19630 ?auto_19633 ) ( TRUCK-AT ?auto_19631 ?auto_19626 ) ( OBJ-AT ?auto_19627 ?auto_19626 ) ( OBJ-AT ?auto_19628 ?auto_19626 ) ( OBJ-AT ?auto_19629 ?auto_19626 ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19627 ?auto_19630 ) ) ( not ( = ?auto_19627 ?auto_19634 ) ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19630 ) ) ( not ( = ?auto_19628 ?auto_19634 ) ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19634 ?auto_19630 ?auto_19626 ) )
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
      ?auto_19649 - CITY
      ?auto_19651 - OBJ
      ?auto_19648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19650 ?auto_19649 ) ( IN-CITY ?auto_19643 ?auto_19649 ) ( not ( = ?auto_19643 ?auto_19650 ) ) ( OBJ-AT ?auto_19651 ?auto_19643 ) ( not ( = ?auto_19651 ?auto_19646 ) ) ( OBJ-AT ?auto_19646 ?auto_19650 ) ( TRUCK-AT ?auto_19648 ?auto_19643 ) ( OBJ-AT ?auto_19644 ?auto_19643 ) ( OBJ-AT ?auto_19645 ?auto_19643 ) ( OBJ-AT ?auto_19647 ?auto_19643 ) ( not ( = ?auto_19644 ?auto_19645 ) ) ( not ( = ?auto_19644 ?auto_19646 ) ) ( not ( = ?auto_19644 ?auto_19647 ) ) ( not ( = ?auto_19644 ?auto_19651 ) ) ( not ( = ?auto_19645 ?auto_19646 ) ) ( not ( = ?auto_19645 ?auto_19647 ) ) ( not ( = ?auto_19645 ?auto_19651 ) ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19647 ?auto_19651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19651 ?auto_19646 ?auto_19643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19662 - OBJ
      ?auto_19663 - OBJ
      ?auto_19664 - OBJ
      ?auto_19665 - OBJ
      ?auto_19661 - LOCATION
    )
    :vars
    (
      ?auto_19668 - LOCATION
      ?auto_19667 - CITY
      ?auto_19666 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19668 ?auto_19667 ) ( IN-CITY ?auto_19661 ?auto_19667 ) ( not ( = ?auto_19661 ?auto_19668 ) ) ( OBJ-AT ?auto_19664 ?auto_19661 ) ( not ( = ?auto_19664 ?auto_19663 ) ) ( OBJ-AT ?auto_19663 ?auto_19668 ) ( TRUCK-AT ?auto_19666 ?auto_19661 ) ( OBJ-AT ?auto_19662 ?auto_19661 ) ( OBJ-AT ?auto_19665 ?auto_19661 ) ( not ( = ?auto_19662 ?auto_19663 ) ) ( not ( = ?auto_19662 ?auto_19664 ) ) ( not ( = ?auto_19662 ?auto_19665 ) ) ( not ( = ?auto_19663 ?auto_19665 ) ) ( not ( = ?auto_19664 ?auto_19665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19664 ?auto_19663 ?auto_19661 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19686 - OBJ
      ?auto_19687 - OBJ
      ?auto_19688 - OBJ
      ?auto_19689 - OBJ
      ?auto_19685 - LOCATION
    )
    :vars
    (
      ?auto_19692 - LOCATION
      ?auto_19691 - CITY
      ?auto_19690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19692 ?auto_19691 ) ( IN-CITY ?auto_19685 ?auto_19691 ) ( not ( = ?auto_19685 ?auto_19692 ) ) ( OBJ-AT ?auto_19689 ?auto_19685 ) ( not ( = ?auto_19689 ?auto_19687 ) ) ( OBJ-AT ?auto_19687 ?auto_19692 ) ( TRUCK-AT ?auto_19690 ?auto_19685 ) ( OBJ-AT ?auto_19686 ?auto_19685 ) ( OBJ-AT ?auto_19688 ?auto_19685 ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19688 ) ) ( not ( = ?auto_19686 ?auto_19689 ) ) ( not ( = ?auto_19687 ?auto_19688 ) ) ( not ( = ?auto_19688 ?auto_19689 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19689 ?auto_19687 ?auto_19685 ) )
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
      ?auto_19699 - CITY
      ?auto_19701 - OBJ
      ?auto_19698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19700 ?auto_19699 ) ( IN-CITY ?auto_19693 ?auto_19699 ) ( not ( = ?auto_19693 ?auto_19700 ) ) ( OBJ-AT ?auto_19701 ?auto_19693 ) ( not ( = ?auto_19701 ?auto_19695 ) ) ( OBJ-AT ?auto_19695 ?auto_19700 ) ( TRUCK-AT ?auto_19698 ?auto_19693 ) ( OBJ-AT ?auto_19694 ?auto_19693 ) ( OBJ-AT ?auto_19696 ?auto_19693 ) ( OBJ-AT ?auto_19697 ?auto_19693 ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19694 ?auto_19697 ) ) ( not ( = ?auto_19694 ?auto_19701 ) ) ( not ( = ?auto_19695 ?auto_19696 ) ) ( not ( = ?auto_19695 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19701 ) ) ( not ( = ?auto_19697 ?auto_19701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19701 ?auto_19695 ?auto_19693 ) )
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
      ?auto_19743 - CITY
      ?auto_19742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19744 ?auto_19743 ) ( IN-CITY ?auto_19737 ?auto_19743 ) ( not ( = ?auto_19737 ?auto_19744 ) ) ( OBJ-AT ?auto_19739 ?auto_19737 ) ( not ( = ?auto_19739 ?auto_19738 ) ) ( OBJ-AT ?auto_19738 ?auto_19744 ) ( TRUCK-AT ?auto_19742 ?auto_19737 ) ( OBJ-AT ?auto_19740 ?auto_19737 ) ( OBJ-AT ?auto_19741 ?auto_19737 ) ( not ( = ?auto_19738 ?auto_19740 ) ) ( not ( = ?auto_19738 ?auto_19741 ) ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19741 ) ) ( not ( = ?auto_19740 ?auto_19741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19739 ?auto_19738 ?auto_19737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19810 - OBJ
      ?auto_19811 - OBJ
      ?auto_19812 - OBJ
      ?auto_19813 - OBJ
      ?auto_19809 - LOCATION
    )
    :vars
    (
      ?auto_19816 - LOCATION
      ?auto_19815 - CITY
      ?auto_19814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19816 ?auto_19815 ) ( IN-CITY ?auto_19809 ?auto_19815 ) ( not ( = ?auto_19809 ?auto_19816 ) ) ( OBJ-AT ?auto_19812 ?auto_19809 ) ( not ( = ?auto_19812 ?auto_19810 ) ) ( OBJ-AT ?auto_19810 ?auto_19816 ) ( TRUCK-AT ?auto_19814 ?auto_19809 ) ( OBJ-AT ?auto_19811 ?auto_19809 ) ( OBJ-AT ?auto_19813 ?auto_19809 ) ( not ( = ?auto_19810 ?auto_19811 ) ) ( not ( = ?auto_19810 ?auto_19813 ) ) ( not ( = ?auto_19811 ?auto_19812 ) ) ( not ( = ?auto_19811 ?auto_19813 ) ) ( not ( = ?auto_19812 ?auto_19813 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19812 ?auto_19810 ?auto_19809 ) )
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
      ?auto_19847 - CITY
      ?auto_19849 - OBJ
      ?auto_19846 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19848 ?auto_19847 ) ( IN-CITY ?auto_19841 ?auto_19847 ) ( not ( = ?auto_19841 ?auto_19848 ) ) ( OBJ-AT ?auto_19849 ?auto_19841 ) ( not ( = ?auto_19849 ?auto_19842 ) ) ( OBJ-AT ?auto_19842 ?auto_19848 ) ( TRUCK-AT ?auto_19846 ?auto_19841 ) ( OBJ-AT ?auto_19843 ?auto_19841 ) ( OBJ-AT ?auto_19844 ?auto_19841 ) ( OBJ-AT ?auto_19845 ?auto_19841 ) ( not ( = ?auto_19842 ?auto_19843 ) ) ( not ( = ?auto_19842 ?auto_19844 ) ) ( not ( = ?auto_19842 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19844 ) ) ( not ( = ?auto_19843 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19849 ) ) ( not ( = ?auto_19844 ?auto_19845 ) ) ( not ( = ?auto_19844 ?auto_19849 ) ) ( not ( = ?auto_19845 ?auto_19849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19849 ?auto_19842 ?auto_19841 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20666 - OBJ
      ?auto_20665 - LOCATION
    )
    :vars
    (
      ?auto_20669 - LOCATION
      ?auto_20670 - CITY
      ?auto_20667 - OBJ
      ?auto_20668 - TRUCK
      ?auto_20671 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20669 ?auto_20670 ) ( IN-CITY ?auto_20665 ?auto_20670 ) ( not ( = ?auto_20665 ?auto_20669 ) ) ( OBJ-AT ?auto_20667 ?auto_20665 ) ( not ( = ?auto_20667 ?auto_20666 ) ) ( OBJ-AT ?auto_20666 ?auto_20669 ) ( TRUCK-AT ?auto_20668 ?auto_20671 ) ( IN-CITY ?auto_20671 ?auto_20670 ) ( not ( = ?auto_20665 ?auto_20671 ) ) ( not ( = ?auto_20669 ?auto_20671 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20668 ?auto_20671 ?auto_20665 ?auto_20670 )
      ( DELIVER-2PKG ?auto_20667 ?auto_20666 ?auto_20665 ) )
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
      ?auto_20675 - LOCATION
      ?auto_20678 - CITY
      ?auto_20676 - TRUCK
      ?auto_20677 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20675 ?auto_20678 ) ( IN-CITY ?auto_20672 ?auto_20678 ) ( not ( = ?auto_20672 ?auto_20675 ) ) ( OBJ-AT ?auto_20673 ?auto_20672 ) ( not ( = ?auto_20673 ?auto_20674 ) ) ( OBJ-AT ?auto_20674 ?auto_20675 ) ( TRUCK-AT ?auto_20676 ?auto_20677 ) ( IN-CITY ?auto_20677 ?auto_20678 ) ( not ( = ?auto_20672 ?auto_20677 ) ) ( not ( = ?auto_20675 ?auto_20677 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20674 ?auto_20672 ) )
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
      ?auto_20693 - LOCATION
      ?auto_20692 - CITY
      ?auto_20690 - TRUCK
      ?auto_20691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20693 ?auto_20692 ) ( IN-CITY ?auto_20687 ?auto_20692 ) ( not ( = ?auto_20687 ?auto_20693 ) ) ( OBJ-AT ?auto_20689 ?auto_20687 ) ( not ( = ?auto_20689 ?auto_20688 ) ) ( OBJ-AT ?auto_20688 ?auto_20693 ) ( TRUCK-AT ?auto_20690 ?auto_20691 ) ( IN-CITY ?auto_20691 ?auto_20692 ) ( not ( = ?auto_20687 ?auto_20691 ) ) ( not ( = ?auto_20693 ?auto_20691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20689 ?auto_20688 ?auto_20687 ) )
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
      ?auto_20717 - LOCATION
      ?auto_20716 - CITY
      ?auto_20714 - TRUCK
      ?auto_20715 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20717 ?auto_20716 ) ( IN-CITY ?auto_20710 ?auto_20716 ) ( not ( = ?auto_20710 ?auto_20717 ) ) ( OBJ-AT ?auto_20711 ?auto_20710 ) ( not ( = ?auto_20711 ?auto_20713 ) ) ( OBJ-AT ?auto_20713 ?auto_20717 ) ( TRUCK-AT ?auto_20714 ?auto_20715 ) ( IN-CITY ?auto_20715 ?auto_20716 ) ( not ( = ?auto_20710 ?auto_20715 ) ) ( not ( = ?auto_20717 ?auto_20715 ) ) ( OBJ-AT ?auto_20712 ?auto_20710 ) ( not ( = ?auto_20711 ?auto_20712 ) ) ( not ( = ?auto_20712 ?auto_20713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20711 ?auto_20713 ?auto_20710 ) )
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
      ?auto_20733 - LOCATION
      ?auto_20732 - CITY
      ?auto_20730 - TRUCK
      ?auto_20731 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20733 ?auto_20732 ) ( IN-CITY ?auto_20726 ?auto_20732 ) ( not ( = ?auto_20726 ?auto_20733 ) ) ( OBJ-AT ?auto_20729 ?auto_20726 ) ( not ( = ?auto_20729 ?auto_20728 ) ) ( OBJ-AT ?auto_20728 ?auto_20733 ) ( TRUCK-AT ?auto_20730 ?auto_20731 ) ( IN-CITY ?auto_20731 ?auto_20732 ) ( not ( = ?auto_20726 ?auto_20731 ) ) ( not ( = ?auto_20733 ?auto_20731 ) ) ( OBJ-AT ?auto_20727 ?auto_20726 ) ( not ( = ?auto_20727 ?auto_20728 ) ) ( not ( = ?auto_20727 ?auto_20729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20729 ?auto_20728 ?auto_20726 ) )
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
      ?auto_20800 - LOCATION
      ?auto_20799 - CITY
      ?auto_20797 - TRUCK
      ?auto_20798 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20800 ?auto_20799 ) ( IN-CITY ?auto_20793 ?auto_20799 ) ( not ( = ?auto_20793 ?auto_20800 ) ) ( OBJ-AT ?auto_20795 ?auto_20793 ) ( not ( = ?auto_20795 ?auto_20794 ) ) ( OBJ-AT ?auto_20794 ?auto_20800 ) ( TRUCK-AT ?auto_20797 ?auto_20798 ) ( IN-CITY ?auto_20798 ?auto_20799 ) ( not ( = ?auto_20793 ?auto_20798 ) ) ( not ( = ?auto_20800 ?auto_20798 ) ) ( OBJ-AT ?auto_20796 ?auto_20793 ) ( not ( = ?auto_20794 ?auto_20796 ) ) ( not ( = ?auto_20795 ?auto_20796 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20795 ?auto_20794 ?auto_20793 ) )
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
      ?auto_20877 - LOCATION
      ?auto_20876 - CITY
      ?auto_20874 - TRUCK
      ?auto_20875 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20877 ?auto_20876 ) ( IN-CITY ?auto_20869 ?auto_20876 ) ( not ( = ?auto_20869 ?auto_20877 ) ) ( OBJ-AT ?auto_20870 ?auto_20869 ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( OBJ-AT ?auto_20873 ?auto_20877 ) ( TRUCK-AT ?auto_20874 ?auto_20875 ) ( IN-CITY ?auto_20875 ?auto_20876 ) ( not ( = ?auto_20869 ?auto_20875 ) ) ( not ( = ?auto_20877 ?auto_20875 ) ) ( OBJ-AT ?auto_20871 ?auto_20869 ) ( OBJ-AT ?auto_20872 ?auto_20869 ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20870 ?auto_20873 ?auto_20869 ) )
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
      ?auto_20895 - LOCATION
      ?auto_20894 - CITY
      ?auto_20892 - TRUCK
      ?auto_20893 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20895 ?auto_20894 ) ( IN-CITY ?auto_20887 ?auto_20894 ) ( not ( = ?auto_20887 ?auto_20895 ) ) ( OBJ-AT ?auto_20891 ?auto_20887 ) ( not ( = ?auto_20891 ?auto_20890 ) ) ( OBJ-AT ?auto_20890 ?auto_20895 ) ( TRUCK-AT ?auto_20892 ?auto_20893 ) ( IN-CITY ?auto_20893 ?auto_20894 ) ( not ( = ?auto_20887 ?auto_20893 ) ) ( not ( = ?auto_20895 ?auto_20893 ) ) ( OBJ-AT ?auto_20888 ?auto_20887 ) ( OBJ-AT ?auto_20889 ?auto_20887 ) ( not ( = ?auto_20888 ?auto_20889 ) ) ( not ( = ?auto_20888 ?auto_20890 ) ) ( not ( = ?auto_20888 ?auto_20891 ) ) ( not ( = ?auto_20889 ?auto_20890 ) ) ( not ( = ?auto_20889 ?auto_20891 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20891 ?auto_20890 ?auto_20887 ) )
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
      ?auto_20967 - LOCATION
      ?auto_20966 - CITY
      ?auto_20964 - TRUCK
      ?auto_20965 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20967 ?auto_20966 ) ( IN-CITY ?auto_20959 ?auto_20966 ) ( not ( = ?auto_20959 ?auto_20967 ) ) ( OBJ-AT ?auto_20960 ?auto_20959 ) ( not ( = ?auto_20960 ?auto_20961 ) ) ( OBJ-AT ?auto_20961 ?auto_20967 ) ( TRUCK-AT ?auto_20964 ?auto_20965 ) ( IN-CITY ?auto_20965 ?auto_20966 ) ( not ( = ?auto_20959 ?auto_20965 ) ) ( not ( = ?auto_20967 ?auto_20965 ) ) ( OBJ-AT ?auto_20962 ?auto_20959 ) ( OBJ-AT ?auto_20963 ?auto_20959 ) ( not ( = ?auto_20960 ?auto_20962 ) ) ( not ( = ?auto_20960 ?auto_20963 ) ) ( not ( = ?auto_20961 ?auto_20962 ) ) ( not ( = ?auto_20961 ?auto_20963 ) ) ( not ( = ?auto_20962 ?auto_20963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20960 ?auto_20961 ?auto_20959 ) )
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
      ?auto_21226 - LOCATION
      ?auto_21225 - CITY
      ?auto_21223 - TRUCK
      ?auto_21224 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21226 ?auto_21225 ) ( IN-CITY ?auto_21218 ?auto_21225 ) ( not ( = ?auto_21218 ?auto_21226 ) ) ( OBJ-AT ?auto_21221 ?auto_21218 ) ( not ( = ?auto_21221 ?auto_21219 ) ) ( OBJ-AT ?auto_21219 ?auto_21226 ) ( TRUCK-AT ?auto_21223 ?auto_21224 ) ( IN-CITY ?auto_21224 ?auto_21225 ) ( not ( = ?auto_21218 ?auto_21224 ) ) ( not ( = ?auto_21226 ?auto_21224 ) ) ( OBJ-AT ?auto_21220 ?auto_21218 ) ( OBJ-AT ?auto_21222 ?auto_21218 ) ( not ( = ?auto_21219 ?auto_21220 ) ) ( not ( = ?auto_21219 ?auto_21222 ) ) ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( not ( = ?auto_21221 ?auto_21222 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21221 ?auto_21219 ?auto_21218 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21679 - OBJ
      ?auto_21680 - OBJ
      ?auto_21681 - OBJ
      ?auto_21682 - OBJ
      ?auto_21678 - LOCATION
    )
    :vars
    (
      ?auto_21685 - LOCATION
      ?auto_21686 - CITY
      ?auto_21684 - TRUCK
      ?auto_21683 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21685 ?auto_21686 ) ( IN-CITY ?auto_21678 ?auto_21686 ) ( not ( = ?auto_21678 ?auto_21685 ) ) ( OBJ-AT ?auto_21680 ?auto_21678 ) ( not ( = ?auto_21680 ?auto_21681 ) ) ( OBJ-AT ?auto_21681 ?auto_21685 ) ( TRUCK-AT ?auto_21684 ?auto_21683 ) ( IN-CITY ?auto_21683 ?auto_21686 ) ( not ( = ?auto_21678 ?auto_21683 ) ) ( not ( = ?auto_21685 ?auto_21683 ) ) ( OBJ-AT ?auto_21679 ?auto_21678 ) ( OBJ-AT ?auto_21682 ?auto_21678 ) ( not ( = ?auto_21679 ?auto_21680 ) ) ( not ( = ?auto_21679 ?auto_21681 ) ) ( not ( = ?auto_21679 ?auto_21682 ) ) ( not ( = ?auto_21680 ?auto_21682 ) ) ( not ( = ?auto_21681 ?auto_21682 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21680 ?auto_21681 ?auto_21678 ) )
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
      ?auto_22016 - LOCATION
      ?auto_22017 - CITY
      ?auto_22015 - TRUCK
      ?auto_22014 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_22016 ?auto_22017 ) ( IN-CITY ?auto_22009 ?auto_22017 ) ( not ( = ?auto_22009 ?auto_22016 ) ) ( OBJ-AT ?auto_22011 ?auto_22009 ) ( not ( = ?auto_22011 ?auto_22010 ) ) ( OBJ-AT ?auto_22010 ?auto_22016 ) ( TRUCK-AT ?auto_22015 ?auto_22014 ) ( IN-CITY ?auto_22014 ?auto_22017 ) ( not ( = ?auto_22009 ?auto_22014 ) ) ( not ( = ?auto_22016 ?auto_22014 ) ) ( OBJ-AT ?auto_22012 ?auto_22009 ) ( OBJ-AT ?auto_22013 ?auto_22009 ) ( not ( = ?auto_22010 ?auto_22012 ) ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( not ( = ?auto_22011 ?auto_22012 ) ) ( not ( = ?auto_22011 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22011 ?auto_22010 ?auto_22009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_22304 - OBJ
      ?auto_22305 - OBJ
      ?auto_22306 - OBJ
      ?auto_22303 - LOCATION
    )
    :vars
    (
      ?auto_22307 - LOCATION
      ?auto_22308 - CITY
      ?auto_22309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_22307 ?auto_22308 ) ( IN-CITY ?auto_22303 ?auto_22308 ) ( not ( = ?auto_22303 ?auto_22307 ) ) ( OBJ-AT ?auto_22304 ?auto_22303 ) ( not ( = ?auto_22304 ?auto_22305 ) ) ( OBJ-AT ?auto_22305 ?auto_22307 ) ( TRUCK-AT ?auto_22309 ?auto_22303 ) ( OBJ-AT ?auto_22306 ?auto_22303 ) ( not ( = ?auto_22304 ?auto_22306 ) ) ( not ( = ?auto_22305 ?auto_22306 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_22304 ?auto_22305 ?auto_22303 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29886 - OBJ
      ?auto_29887 - OBJ
      ?auto_29888 - OBJ
      ?auto_29885 - LOCATION
    )
    :vars
    (
      ?auto_29891 - TRUCK
      ?auto_29890 - LOCATION
      ?auto_29889 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_29891 ?auto_29890 ) ( IN-CITY ?auto_29890 ?auto_29889 ) ( IN-CITY ?auto_29885 ?auto_29889 ) ( not ( = ?auto_29885 ?auto_29890 ) ) ( OBJ-AT ?auto_29887 ?auto_29885 ) ( not ( = ?auto_29887 ?auto_29888 ) ) ( OBJ-AT ?auto_29888 ?auto_29890 ) ( OBJ-AT ?auto_29886 ?auto_29885 ) ( not ( = ?auto_29886 ?auto_29887 ) ) ( not ( = ?auto_29886 ?auto_29888 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_29887 ?auto_29888 ?auto_29885 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_30003 - OBJ
      ?auto_30004 - OBJ
      ?auto_30005 - OBJ
      ?auto_30002 - LOCATION
    )
    :vars
    (
      ?auto_30008 - TRUCK
      ?auto_30007 - LOCATION
      ?auto_30006 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_30008 ?auto_30007 ) ( IN-CITY ?auto_30007 ?auto_30006 ) ( IN-CITY ?auto_30002 ?auto_30006 ) ( not ( = ?auto_30002 ?auto_30007 ) ) ( OBJ-AT ?auto_30005 ?auto_30002 ) ( not ( = ?auto_30005 ?auto_30003 ) ) ( OBJ-AT ?auto_30003 ?auto_30007 ) ( OBJ-AT ?auto_30004 ?auto_30002 ) ( not ( = ?auto_30003 ?auto_30004 ) ) ( not ( = ?auto_30004 ?auto_30005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_30005 ?auto_30003 ?auto_30002 ) )
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
      ?auto_42340 - LOCATION
      ?auto_42341 - CITY
      ?auto_42339 - TRUCK
      ?auto_42338 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42340 ?auto_42341 ) ( IN-CITY ?auto_42333 ?auto_42341 ) ( not ( = ?auto_42333 ?auto_42340 ) ) ( OBJ-AT ?auto_42335 ?auto_42333 ) ( not ( = ?auto_42335 ?auto_42337 ) ) ( OBJ-AT ?auto_42337 ?auto_42340 ) ( TRUCK-AT ?auto_42339 ?auto_42338 ) ( IN-CITY ?auto_42338 ?auto_42341 ) ( not ( = ?auto_42333 ?auto_42338 ) ) ( not ( = ?auto_42340 ?auto_42338 ) ) ( OBJ-AT ?auto_42334 ?auto_42333 ) ( OBJ-AT ?auto_42336 ?auto_42333 ) ( not ( = ?auto_42334 ?auto_42335 ) ) ( not ( = ?auto_42334 ?auto_42336 ) ) ( not ( = ?auto_42334 ?auto_42337 ) ) ( not ( = ?auto_42335 ?auto_42336 ) ) ( not ( = ?auto_42336 ?auto_42337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42335 ?auto_42337 ?auto_42333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42523 - OBJ
      ?auto_42524 - OBJ
      ?auto_42525 - OBJ
      ?auto_42526 - OBJ
      ?auto_42522 - LOCATION
    )
    :vars
    (
      ?auto_42529 - LOCATION
      ?auto_42530 - CITY
      ?auto_42528 - TRUCK
      ?auto_42527 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42529 ?auto_42530 ) ( IN-CITY ?auto_42522 ?auto_42530 ) ( not ( = ?auto_42522 ?auto_42529 ) ) ( OBJ-AT ?auto_42525 ?auto_42522 ) ( not ( = ?auto_42525 ?auto_42524 ) ) ( OBJ-AT ?auto_42524 ?auto_42529 ) ( TRUCK-AT ?auto_42528 ?auto_42527 ) ( IN-CITY ?auto_42527 ?auto_42530 ) ( not ( = ?auto_42522 ?auto_42527 ) ) ( not ( = ?auto_42529 ?auto_42527 ) ) ( OBJ-AT ?auto_42523 ?auto_42522 ) ( OBJ-AT ?auto_42526 ?auto_42522 ) ( not ( = ?auto_42523 ?auto_42524 ) ) ( not ( = ?auto_42523 ?auto_42525 ) ) ( not ( = ?auto_42523 ?auto_42526 ) ) ( not ( = ?auto_42524 ?auto_42526 ) ) ( not ( = ?auto_42525 ?auto_42526 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42525 ?auto_42524 ?auto_42522 ) )
  )

)

