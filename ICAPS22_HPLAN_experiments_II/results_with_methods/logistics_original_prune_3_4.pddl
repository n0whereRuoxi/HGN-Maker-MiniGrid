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
      ?auto_12408 - OBJ
      ?auto_12407 - LOCATION
    )
    :vars
    (
      ?auto_12409 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12409 ?auto_12407 ) ( IN-TRUCK ?auto_12408 ?auto_12409 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_12408 ?auto_12409 ?auto_12407 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12420 - OBJ
      ?auto_12419 - LOCATION
    )
    :vars
    (
      ?auto_12421 - TRUCK
      ?auto_12422 - LOCATION
      ?auto_12423 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12420 ?auto_12421 ) ( TRUCK-AT ?auto_12421 ?auto_12422 ) ( IN-CITY ?auto_12422 ?auto_12423 ) ( IN-CITY ?auto_12419 ?auto_12423 ) ( not ( = ?auto_12419 ?auto_12422 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12421 ?auto_12422 ?auto_12419 ?auto_12423 )
      ( DELIVER-1PKG ?auto_12420 ?auto_12419 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12438 - OBJ
      ?auto_12437 - LOCATION
    )
    :vars
    (
      ?auto_12439 - TRUCK
      ?auto_12441 - LOCATION
      ?auto_12440 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12439 ?auto_12441 ) ( IN-CITY ?auto_12441 ?auto_12440 ) ( IN-CITY ?auto_12437 ?auto_12440 ) ( not ( = ?auto_12437 ?auto_12441 ) ) ( OBJ-AT ?auto_12438 ?auto_12441 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12438 ?auto_12439 ?auto_12441 )
      ( DELIVER-1PKG ?auto_12438 ?auto_12437 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12456 - OBJ
      ?auto_12455 - LOCATION
    )
    :vars
    (
      ?auto_12459 - LOCATION
      ?auto_12457 - CITY
      ?auto_12458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12459 ?auto_12457 ) ( IN-CITY ?auto_12455 ?auto_12457 ) ( not ( = ?auto_12455 ?auto_12459 ) ) ( OBJ-AT ?auto_12456 ?auto_12459 ) ( TRUCK-AT ?auto_12458 ?auto_12455 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12458 ?auto_12455 ?auto_12459 ?auto_12457 )
      ( DELIVER-1PKG ?auto_12456 ?auto_12455 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12516 - OBJ
      ?auto_12517 - OBJ
      ?auto_12515 - LOCATION
    )
    :vars
    (
      ?auto_12518 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12518 ?auto_12515 ) ( IN-TRUCK ?auto_12517 ?auto_12518 ) ( OBJ-AT ?auto_12516 ?auto_12515 ) ( not ( = ?auto_12516 ?auto_12517 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12517 ?auto_12515 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12520 - OBJ
      ?auto_12521 - OBJ
      ?auto_12519 - LOCATION
    )
    :vars
    (
      ?auto_12522 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12522 ?auto_12519 ) ( IN-TRUCK ?auto_12520 ?auto_12522 ) ( OBJ-AT ?auto_12521 ?auto_12519 ) ( not ( = ?auto_12520 ?auto_12521 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12520 ?auto_12519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12528 - OBJ
      ?auto_12529 - OBJ
      ?auto_12530 - OBJ
      ?auto_12527 - LOCATION
    )
    :vars
    (
      ?auto_12531 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12531 ?auto_12527 ) ( IN-TRUCK ?auto_12530 ?auto_12531 ) ( OBJ-AT ?auto_12528 ?auto_12527 ) ( OBJ-AT ?auto_12529 ?auto_12527 ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( not ( = ?auto_12528 ?auto_12530 ) ) ( not ( = ?auto_12529 ?auto_12530 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12530 ?auto_12527 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12533 - OBJ
      ?auto_12534 - OBJ
      ?auto_12535 - OBJ
      ?auto_12532 - LOCATION
    )
    :vars
    (
      ?auto_12536 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12536 ?auto_12532 ) ( IN-TRUCK ?auto_12534 ?auto_12536 ) ( OBJ-AT ?auto_12533 ?auto_12532 ) ( OBJ-AT ?auto_12535 ?auto_12532 ) ( not ( = ?auto_12533 ?auto_12534 ) ) ( not ( = ?auto_12533 ?auto_12535 ) ) ( not ( = ?auto_12534 ?auto_12535 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12534 ?auto_12532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12543 - OBJ
      ?auto_12544 - OBJ
      ?auto_12545 - OBJ
      ?auto_12542 - LOCATION
    )
    :vars
    (
      ?auto_12546 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12546 ?auto_12542 ) ( IN-TRUCK ?auto_12543 ?auto_12546 ) ( OBJ-AT ?auto_12544 ?auto_12542 ) ( OBJ-AT ?auto_12545 ?auto_12542 ) ( not ( = ?auto_12543 ?auto_12544 ) ) ( not ( = ?auto_12543 ?auto_12545 ) ) ( not ( = ?auto_12544 ?auto_12545 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12543 ?auto_12542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12568 - OBJ
      ?auto_12569 - OBJ
      ?auto_12567 - LOCATION
    )
    :vars
    (
      ?auto_12570 - TRUCK
      ?auto_12572 - LOCATION
      ?auto_12571 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12569 ?auto_12570 ) ( TRUCK-AT ?auto_12570 ?auto_12572 ) ( IN-CITY ?auto_12572 ?auto_12571 ) ( IN-CITY ?auto_12567 ?auto_12571 ) ( not ( = ?auto_12567 ?auto_12572 ) ) ( OBJ-AT ?auto_12568 ?auto_12567 ) ( not ( = ?auto_12568 ?auto_12569 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12569 ?auto_12567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12574 - OBJ
      ?auto_12575 - OBJ
      ?auto_12573 - LOCATION
    )
    :vars
    (
      ?auto_12576 - TRUCK
      ?auto_12577 - LOCATION
      ?auto_12578 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12574 ?auto_12576 ) ( TRUCK-AT ?auto_12576 ?auto_12577 ) ( IN-CITY ?auto_12577 ?auto_12578 ) ( IN-CITY ?auto_12573 ?auto_12578 ) ( not ( = ?auto_12573 ?auto_12577 ) ) ( OBJ-AT ?auto_12575 ?auto_12573 ) ( not ( = ?auto_12575 ?auto_12574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12575 ?auto_12574 ?auto_12573 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12587 - OBJ
      ?auto_12588 - OBJ
      ?auto_12589 - OBJ
      ?auto_12586 - LOCATION
    )
    :vars
    (
      ?auto_12590 - TRUCK
      ?auto_12591 - LOCATION
      ?auto_12592 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12589 ?auto_12590 ) ( TRUCK-AT ?auto_12590 ?auto_12591 ) ( IN-CITY ?auto_12591 ?auto_12592 ) ( IN-CITY ?auto_12586 ?auto_12592 ) ( not ( = ?auto_12586 ?auto_12591 ) ) ( OBJ-AT ?auto_12588 ?auto_12586 ) ( not ( = ?auto_12588 ?auto_12589 ) ) ( OBJ-AT ?auto_12587 ?auto_12586 ) ( not ( = ?auto_12587 ?auto_12588 ) ) ( not ( = ?auto_12587 ?auto_12589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12588 ?auto_12589 ?auto_12586 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12594 - OBJ
      ?auto_12595 - OBJ
      ?auto_12596 - OBJ
      ?auto_12593 - LOCATION
    )
    :vars
    (
      ?auto_12597 - TRUCK
      ?auto_12598 - LOCATION
      ?auto_12599 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12595 ?auto_12597 ) ( TRUCK-AT ?auto_12597 ?auto_12598 ) ( IN-CITY ?auto_12598 ?auto_12599 ) ( IN-CITY ?auto_12593 ?auto_12599 ) ( not ( = ?auto_12593 ?auto_12598 ) ) ( OBJ-AT ?auto_12594 ?auto_12593 ) ( not ( = ?auto_12594 ?auto_12595 ) ) ( OBJ-AT ?auto_12596 ?auto_12593 ) ( not ( = ?auto_12594 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12594 ?auto_12595 ?auto_12593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12608 - OBJ
      ?auto_12609 - OBJ
      ?auto_12610 - OBJ
      ?auto_12607 - LOCATION
    )
    :vars
    (
      ?auto_12611 - TRUCK
      ?auto_12612 - LOCATION
      ?auto_12613 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12608 ?auto_12611 ) ( TRUCK-AT ?auto_12611 ?auto_12612 ) ( IN-CITY ?auto_12612 ?auto_12613 ) ( IN-CITY ?auto_12607 ?auto_12613 ) ( not ( = ?auto_12607 ?auto_12612 ) ) ( OBJ-AT ?auto_12609 ?auto_12607 ) ( not ( = ?auto_12609 ?auto_12608 ) ) ( OBJ-AT ?auto_12610 ?auto_12607 ) ( not ( = ?auto_12608 ?auto_12610 ) ) ( not ( = ?auto_12609 ?auto_12610 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12609 ?auto_12608 ?auto_12607 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12637 - OBJ
      ?auto_12636 - LOCATION
    )
    :vars
    (
      ?auto_12638 - TRUCK
      ?auto_12639 - LOCATION
      ?auto_12640 - CITY
      ?auto_12641 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12638 ?auto_12639 ) ( IN-CITY ?auto_12639 ?auto_12640 ) ( IN-CITY ?auto_12636 ?auto_12640 ) ( not ( = ?auto_12636 ?auto_12639 ) ) ( OBJ-AT ?auto_12641 ?auto_12636 ) ( not ( = ?auto_12641 ?auto_12637 ) ) ( OBJ-AT ?auto_12637 ?auto_12639 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12637 ?auto_12638 ?auto_12639 )
      ( DELIVER-2PKG ?auto_12641 ?auto_12637 ?auto_12636 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12643 - OBJ
      ?auto_12644 - OBJ
      ?auto_12642 - LOCATION
    )
    :vars
    (
      ?auto_12645 - TRUCK
      ?auto_12646 - LOCATION
      ?auto_12647 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12645 ?auto_12646 ) ( IN-CITY ?auto_12646 ?auto_12647 ) ( IN-CITY ?auto_12642 ?auto_12647 ) ( not ( = ?auto_12642 ?auto_12646 ) ) ( OBJ-AT ?auto_12643 ?auto_12642 ) ( not ( = ?auto_12643 ?auto_12644 ) ) ( OBJ-AT ?auto_12644 ?auto_12646 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12644 ?auto_12642 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12649 - OBJ
      ?auto_12650 - OBJ
      ?auto_12648 - LOCATION
    )
    :vars
    (
      ?auto_12652 - TRUCK
      ?auto_12651 - LOCATION
      ?auto_12653 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12652 ?auto_12651 ) ( IN-CITY ?auto_12651 ?auto_12653 ) ( IN-CITY ?auto_12648 ?auto_12653 ) ( not ( = ?auto_12648 ?auto_12651 ) ) ( OBJ-AT ?auto_12650 ?auto_12648 ) ( not ( = ?auto_12650 ?auto_12649 ) ) ( OBJ-AT ?auto_12649 ?auto_12651 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12650 ?auto_12649 ?auto_12648 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12662 - OBJ
      ?auto_12663 - OBJ
      ?auto_12664 - OBJ
      ?auto_12661 - LOCATION
    )
    :vars
    (
      ?auto_12666 - TRUCK
      ?auto_12665 - LOCATION
      ?auto_12667 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12666 ?auto_12665 ) ( IN-CITY ?auto_12665 ?auto_12667 ) ( IN-CITY ?auto_12661 ?auto_12667 ) ( not ( = ?auto_12661 ?auto_12665 ) ) ( OBJ-AT ?auto_12663 ?auto_12661 ) ( not ( = ?auto_12663 ?auto_12664 ) ) ( OBJ-AT ?auto_12664 ?auto_12665 ) ( OBJ-AT ?auto_12662 ?auto_12661 ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( not ( = ?auto_12662 ?auto_12664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12663 ?auto_12664 ?auto_12661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12669 - OBJ
      ?auto_12670 - OBJ
      ?auto_12671 - OBJ
      ?auto_12668 - LOCATION
    )
    :vars
    (
      ?auto_12673 - TRUCK
      ?auto_12672 - LOCATION
      ?auto_12674 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12673 ?auto_12672 ) ( IN-CITY ?auto_12672 ?auto_12674 ) ( IN-CITY ?auto_12668 ?auto_12674 ) ( not ( = ?auto_12668 ?auto_12672 ) ) ( OBJ-AT ?auto_12669 ?auto_12668 ) ( not ( = ?auto_12669 ?auto_12670 ) ) ( OBJ-AT ?auto_12670 ?auto_12672 ) ( OBJ-AT ?auto_12671 ?auto_12668 ) ( not ( = ?auto_12669 ?auto_12671 ) ) ( not ( = ?auto_12670 ?auto_12671 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12669 ?auto_12670 ?auto_12668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12683 - OBJ
      ?auto_12684 - OBJ
      ?auto_12685 - OBJ
      ?auto_12682 - LOCATION
    )
    :vars
    (
      ?auto_12687 - TRUCK
      ?auto_12686 - LOCATION
      ?auto_12688 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12687 ?auto_12686 ) ( IN-CITY ?auto_12686 ?auto_12688 ) ( IN-CITY ?auto_12682 ?auto_12688 ) ( not ( = ?auto_12682 ?auto_12686 ) ) ( OBJ-AT ?auto_12684 ?auto_12682 ) ( not ( = ?auto_12684 ?auto_12683 ) ) ( OBJ-AT ?auto_12683 ?auto_12686 ) ( OBJ-AT ?auto_12685 ?auto_12682 ) ( not ( = ?auto_12683 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12684 ?auto_12683 ?auto_12682 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12712 - OBJ
      ?auto_12711 - LOCATION
    )
    :vars
    (
      ?auto_12713 - LOCATION
      ?auto_12716 - CITY
      ?auto_12715 - OBJ
      ?auto_12714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12713 ?auto_12716 ) ( IN-CITY ?auto_12711 ?auto_12716 ) ( not ( = ?auto_12711 ?auto_12713 ) ) ( OBJ-AT ?auto_12715 ?auto_12711 ) ( not ( = ?auto_12715 ?auto_12712 ) ) ( OBJ-AT ?auto_12712 ?auto_12713 ) ( TRUCK-AT ?auto_12714 ?auto_12711 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12714 ?auto_12711 ?auto_12713 ?auto_12716 )
      ( DELIVER-2PKG ?auto_12715 ?auto_12712 ?auto_12711 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12718 - OBJ
      ?auto_12719 - OBJ
      ?auto_12717 - LOCATION
    )
    :vars
    (
      ?auto_12720 - LOCATION
      ?auto_12721 - CITY
      ?auto_12722 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12720 ?auto_12721 ) ( IN-CITY ?auto_12717 ?auto_12721 ) ( not ( = ?auto_12717 ?auto_12720 ) ) ( OBJ-AT ?auto_12718 ?auto_12717 ) ( not ( = ?auto_12718 ?auto_12719 ) ) ( OBJ-AT ?auto_12719 ?auto_12720 ) ( TRUCK-AT ?auto_12722 ?auto_12717 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12719 ?auto_12717 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12724 - OBJ
      ?auto_12725 - OBJ
      ?auto_12723 - LOCATION
    )
    :vars
    (
      ?auto_12728 - LOCATION
      ?auto_12726 - CITY
      ?auto_12727 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12728 ?auto_12726 ) ( IN-CITY ?auto_12723 ?auto_12726 ) ( not ( = ?auto_12723 ?auto_12728 ) ) ( OBJ-AT ?auto_12725 ?auto_12723 ) ( not ( = ?auto_12725 ?auto_12724 ) ) ( OBJ-AT ?auto_12724 ?auto_12728 ) ( TRUCK-AT ?auto_12727 ?auto_12723 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12725 ?auto_12724 ?auto_12723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12737 - OBJ
      ?auto_12738 - OBJ
      ?auto_12739 - OBJ
      ?auto_12736 - LOCATION
    )
    :vars
    (
      ?auto_12742 - LOCATION
      ?auto_12740 - CITY
      ?auto_12741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12742 ?auto_12740 ) ( IN-CITY ?auto_12736 ?auto_12740 ) ( not ( = ?auto_12736 ?auto_12742 ) ) ( OBJ-AT ?auto_12738 ?auto_12736 ) ( not ( = ?auto_12738 ?auto_12739 ) ) ( OBJ-AT ?auto_12739 ?auto_12742 ) ( TRUCK-AT ?auto_12741 ?auto_12736 ) ( OBJ-AT ?auto_12737 ?auto_12736 ) ( not ( = ?auto_12737 ?auto_12738 ) ) ( not ( = ?auto_12737 ?auto_12739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12738 ?auto_12739 ?auto_12736 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12744 - OBJ
      ?auto_12745 - OBJ
      ?auto_12746 - OBJ
      ?auto_12743 - LOCATION
    )
    :vars
    (
      ?auto_12749 - LOCATION
      ?auto_12747 - CITY
      ?auto_12748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12749 ?auto_12747 ) ( IN-CITY ?auto_12743 ?auto_12747 ) ( not ( = ?auto_12743 ?auto_12749 ) ) ( OBJ-AT ?auto_12746 ?auto_12743 ) ( not ( = ?auto_12746 ?auto_12745 ) ) ( OBJ-AT ?auto_12745 ?auto_12749 ) ( TRUCK-AT ?auto_12748 ?auto_12743 ) ( OBJ-AT ?auto_12744 ?auto_12743 ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( not ( = ?auto_12744 ?auto_12746 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12746 ?auto_12745 ?auto_12743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12758 - OBJ
      ?auto_12759 - OBJ
      ?auto_12760 - OBJ
      ?auto_12757 - LOCATION
    )
    :vars
    (
      ?auto_12763 - LOCATION
      ?auto_12761 - CITY
      ?auto_12762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12763 ?auto_12761 ) ( IN-CITY ?auto_12757 ?auto_12761 ) ( not ( = ?auto_12757 ?auto_12763 ) ) ( OBJ-AT ?auto_12759 ?auto_12757 ) ( not ( = ?auto_12759 ?auto_12758 ) ) ( OBJ-AT ?auto_12758 ?auto_12763 ) ( TRUCK-AT ?auto_12762 ?auto_12757 ) ( OBJ-AT ?auto_12760 ?auto_12757 ) ( not ( = ?auto_12758 ?auto_12760 ) ) ( not ( = ?auto_12759 ?auto_12760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12759 ?auto_12758 ?auto_12757 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12787 - OBJ
      ?auto_12786 - LOCATION
    )
    :vars
    (
      ?auto_12791 - LOCATION
      ?auto_12789 - CITY
      ?auto_12788 - OBJ
      ?auto_12790 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12791 ?auto_12789 ) ( IN-CITY ?auto_12786 ?auto_12789 ) ( not ( = ?auto_12786 ?auto_12791 ) ) ( not ( = ?auto_12788 ?auto_12787 ) ) ( OBJ-AT ?auto_12787 ?auto_12791 ) ( TRUCK-AT ?auto_12790 ?auto_12786 ) ( IN-TRUCK ?auto_12788 ?auto_12790 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12788 ?auto_12786 )
      ( DELIVER-2PKG ?auto_12788 ?auto_12787 ?auto_12786 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12793 - OBJ
      ?auto_12794 - OBJ
      ?auto_12792 - LOCATION
    )
    :vars
    (
      ?auto_12797 - LOCATION
      ?auto_12795 - CITY
      ?auto_12796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12797 ?auto_12795 ) ( IN-CITY ?auto_12792 ?auto_12795 ) ( not ( = ?auto_12792 ?auto_12797 ) ) ( not ( = ?auto_12793 ?auto_12794 ) ) ( OBJ-AT ?auto_12794 ?auto_12797 ) ( TRUCK-AT ?auto_12796 ?auto_12792 ) ( IN-TRUCK ?auto_12793 ?auto_12796 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12794 ?auto_12792 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12799 - OBJ
      ?auto_12800 - OBJ
      ?auto_12798 - LOCATION
    )
    :vars
    (
      ?auto_12803 - LOCATION
      ?auto_12801 - CITY
      ?auto_12802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12803 ?auto_12801 ) ( IN-CITY ?auto_12798 ?auto_12801 ) ( not ( = ?auto_12798 ?auto_12803 ) ) ( not ( = ?auto_12800 ?auto_12799 ) ) ( OBJ-AT ?auto_12799 ?auto_12803 ) ( TRUCK-AT ?auto_12802 ?auto_12798 ) ( IN-TRUCK ?auto_12800 ?auto_12802 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12800 ?auto_12799 ?auto_12798 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12862 - OBJ
      ?auto_12861 - LOCATION
    )
    :vars
    (
      ?auto_12866 - LOCATION
      ?auto_12863 - CITY
      ?auto_12864 - OBJ
      ?auto_12865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12866 ?auto_12863 ) ( IN-CITY ?auto_12861 ?auto_12863 ) ( not ( = ?auto_12861 ?auto_12866 ) ) ( not ( = ?auto_12864 ?auto_12862 ) ) ( OBJ-AT ?auto_12862 ?auto_12866 ) ( IN-TRUCK ?auto_12864 ?auto_12865 ) ( TRUCK-AT ?auto_12865 ?auto_12866 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12865 ?auto_12866 ?auto_12861 ?auto_12863 )
      ( DELIVER-2PKG ?auto_12864 ?auto_12862 ?auto_12861 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12868 - OBJ
      ?auto_12869 - OBJ
      ?auto_12867 - LOCATION
    )
    :vars
    (
      ?auto_12871 - LOCATION
      ?auto_12872 - CITY
      ?auto_12870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12871 ?auto_12872 ) ( IN-CITY ?auto_12867 ?auto_12872 ) ( not ( = ?auto_12867 ?auto_12871 ) ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( OBJ-AT ?auto_12869 ?auto_12871 ) ( IN-TRUCK ?auto_12868 ?auto_12870 ) ( TRUCK-AT ?auto_12870 ?auto_12871 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12869 ?auto_12867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12874 - OBJ
      ?auto_12875 - OBJ
      ?auto_12873 - LOCATION
    )
    :vars
    (
      ?auto_12877 - LOCATION
      ?auto_12878 - CITY
      ?auto_12876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12877 ?auto_12878 ) ( IN-CITY ?auto_12873 ?auto_12878 ) ( not ( = ?auto_12873 ?auto_12877 ) ) ( not ( = ?auto_12875 ?auto_12874 ) ) ( OBJ-AT ?auto_12874 ?auto_12877 ) ( IN-TRUCK ?auto_12875 ?auto_12876 ) ( TRUCK-AT ?auto_12876 ?auto_12877 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12875 ?auto_12874 ?auto_12873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13319 - OBJ
      ?auto_13320 - OBJ
      ?auto_13321 - OBJ
      ?auto_13318 - LOCATION
    )
    :vars
    (
      ?auto_13324 - TRUCK
      ?auto_13323 - LOCATION
      ?auto_13322 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13320 ?auto_13324 ) ( TRUCK-AT ?auto_13324 ?auto_13323 ) ( IN-CITY ?auto_13323 ?auto_13322 ) ( IN-CITY ?auto_13318 ?auto_13322 ) ( not ( = ?auto_13318 ?auto_13323 ) ) ( OBJ-AT ?auto_13321 ?auto_13318 ) ( not ( = ?auto_13321 ?auto_13320 ) ) ( OBJ-AT ?auto_13319 ?auto_13318 ) ( not ( = ?auto_13319 ?auto_13320 ) ) ( not ( = ?auto_13319 ?auto_13321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13321 ?auto_13320 ?auto_13318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13341 - OBJ
      ?auto_13342 - OBJ
      ?auto_13343 - OBJ
      ?auto_13340 - LOCATION
    )
    :vars
    (
      ?auto_13346 - TRUCK
      ?auto_13345 - LOCATION
      ?auto_13344 - CITY
      ?auto_13347 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13343 ?auto_13346 ) ( TRUCK-AT ?auto_13346 ?auto_13345 ) ( IN-CITY ?auto_13345 ?auto_13344 ) ( IN-CITY ?auto_13340 ?auto_13344 ) ( not ( = ?auto_13340 ?auto_13345 ) ) ( OBJ-AT ?auto_13347 ?auto_13340 ) ( not ( = ?auto_13347 ?auto_13343 ) ) ( OBJ-AT ?auto_13341 ?auto_13340 ) ( OBJ-AT ?auto_13342 ?auto_13340 ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13343 ) ) ( not ( = ?auto_13341 ?auto_13347 ) ) ( not ( = ?auto_13342 ?auto_13343 ) ) ( not ( = ?auto_13342 ?auto_13347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13347 ?auto_13343 ?auto_13340 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13353 - OBJ
      ?auto_13354 - OBJ
      ?auto_13355 - OBJ
      ?auto_13352 - LOCATION
    )
    :vars
    (
      ?auto_13358 - TRUCK
      ?auto_13357 - LOCATION
      ?auto_13356 - CITY
      ?auto_13359 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13354 ?auto_13358 ) ( TRUCK-AT ?auto_13358 ?auto_13357 ) ( IN-CITY ?auto_13357 ?auto_13356 ) ( IN-CITY ?auto_13352 ?auto_13356 ) ( not ( = ?auto_13352 ?auto_13357 ) ) ( OBJ-AT ?auto_13359 ?auto_13352 ) ( not ( = ?auto_13359 ?auto_13354 ) ) ( OBJ-AT ?auto_13353 ?auto_13352 ) ( OBJ-AT ?auto_13355 ?auto_13352 ) ( not ( = ?auto_13353 ?auto_13354 ) ) ( not ( = ?auto_13353 ?auto_13355 ) ) ( not ( = ?auto_13353 ?auto_13359 ) ) ( not ( = ?auto_13354 ?auto_13355 ) ) ( not ( = ?auto_13355 ?auto_13359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13359 ?auto_13354 ?auto_13352 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13369 - OBJ
      ?auto_13370 - OBJ
      ?auto_13371 - OBJ
      ?auto_13368 - LOCATION
    )
    :vars
    (
      ?auto_13374 - TRUCK
      ?auto_13373 - LOCATION
      ?auto_13372 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13369 ?auto_13374 ) ( TRUCK-AT ?auto_13374 ?auto_13373 ) ( IN-CITY ?auto_13373 ?auto_13372 ) ( IN-CITY ?auto_13368 ?auto_13372 ) ( not ( = ?auto_13368 ?auto_13373 ) ) ( OBJ-AT ?auto_13371 ?auto_13368 ) ( not ( = ?auto_13371 ?auto_13369 ) ) ( OBJ-AT ?auto_13370 ?auto_13368 ) ( not ( = ?auto_13369 ?auto_13370 ) ) ( not ( = ?auto_13370 ?auto_13371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13371 ?auto_13369 ?auto_13368 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13391 - OBJ
      ?auto_13392 - OBJ
      ?auto_13393 - OBJ
      ?auto_13390 - LOCATION
    )
    :vars
    (
      ?auto_13396 - TRUCK
      ?auto_13395 - LOCATION
      ?auto_13394 - CITY
      ?auto_13397 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13391 ?auto_13396 ) ( TRUCK-AT ?auto_13396 ?auto_13395 ) ( IN-CITY ?auto_13395 ?auto_13394 ) ( IN-CITY ?auto_13390 ?auto_13394 ) ( not ( = ?auto_13390 ?auto_13395 ) ) ( OBJ-AT ?auto_13397 ?auto_13390 ) ( not ( = ?auto_13397 ?auto_13391 ) ) ( OBJ-AT ?auto_13392 ?auto_13390 ) ( OBJ-AT ?auto_13393 ?auto_13390 ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( not ( = ?auto_13391 ?auto_13393 ) ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( not ( = ?auto_13392 ?auto_13397 ) ) ( not ( = ?auto_13393 ?auto_13397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13397 ?auto_13391 ?auto_13390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13461 - OBJ
      ?auto_13462 - OBJ
      ?auto_13463 - OBJ
      ?auto_13460 - LOCATION
    )
    :vars
    (
      ?auto_13464 - TRUCK
      ?auto_13466 - LOCATION
      ?auto_13465 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13464 ?auto_13466 ) ( IN-CITY ?auto_13466 ?auto_13465 ) ( IN-CITY ?auto_13460 ?auto_13465 ) ( not ( = ?auto_13460 ?auto_13466 ) ) ( OBJ-AT ?auto_13461 ?auto_13460 ) ( not ( = ?auto_13461 ?auto_13463 ) ) ( OBJ-AT ?auto_13463 ?auto_13466 ) ( OBJ-AT ?auto_13462 ?auto_13460 ) ( not ( = ?auto_13461 ?auto_13462 ) ) ( not ( = ?auto_13462 ?auto_13463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13461 ?auto_13463 ?auto_13460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13472 - OBJ
      ?auto_13473 - OBJ
      ?auto_13474 - OBJ
      ?auto_13471 - LOCATION
    )
    :vars
    (
      ?auto_13475 - TRUCK
      ?auto_13477 - LOCATION
      ?auto_13476 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13475 ?auto_13477 ) ( IN-CITY ?auto_13477 ?auto_13476 ) ( IN-CITY ?auto_13471 ?auto_13476 ) ( not ( = ?auto_13471 ?auto_13477 ) ) ( OBJ-AT ?auto_13474 ?auto_13471 ) ( not ( = ?auto_13474 ?auto_13473 ) ) ( OBJ-AT ?auto_13473 ?auto_13477 ) ( OBJ-AT ?auto_13472 ?auto_13471 ) ( not ( = ?auto_13472 ?auto_13473 ) ) ( not ( = ?auto_13472 ?auto_13474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13474 ?auto_13473 ?auto_13471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13494 - OBJ
      ?auto_13495 - OBJ
      ?auto_13496 - OBJ
      ?auto_13493 - LOCATION
    )
    :vars
    (
      ?auto_13497 - TRUCK
      ?auto_13500 - LOCATION
      ?auto_13498 - CITY
      ?auto_13499 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13497 ?auto_13500 ) ( IN-CITY ?auto_13500 ?auto_13498 ) ( IN-CITY ?auto_13493 ?auto_13498 ) ( not ( = ?auto_13493 ?auto_13500 ) ) ( OBJ-AT ?auto_13499 ?auto_13493 ) ( not ( = ?auto_13499 ?auto_13496 ) ) ( OBJ-AT ?auto_13496 ?auto_13500 ) ( OBJ-AT ?auto_13494 ?auto_13493 ) ( OBJ-AT ?auto_13495 ?auto_13493 ) ( not ( = ?auto_13494 ?auto_13495 ) ) ( not ( = ?auto_13494 ?auto_13496 ) ) ( not ( = ?auto_13494 ?auto_13499 ) ) ( not ( = ?auto_13495 ?auto_13496 ) ) ( not ( = ?auto_13495 ?auto_13499 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13499 ?auto_13496 ?auto_13493 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13506 - OBJ
      ?auto_13507 - OBJ
      ?auto_13508 - OBJ
      ?auto_13505 - LOCATION
    )
    :vars
    (
      ?auto_13509 - TRUCK
      ?auto_13512 - LOCATION
      ?auto_13510 - CITY
      ?auto_13511 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13509 ?auto_13512 ) ( IN-CITY ?auto_13512 ?auto_13510 ) ( IN-CITY ?auto_13505 ?auto_13510 ) ( not ( = ?auto_13505 ?auto_13512 ) ) ( OBJ-AT ?auto_13511 ?auto_13505 ) ( not ( = ?auto_13511 ?auto_13507 ) ) ( OBJ-AT ?auto_13507 ?auto_13512 ) ( OBJ-AT ?auto_13506 ?auto_13505 ) ( OBJ-AT ?auto_13508 ?auto_13505 ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13508 ) ) ( not ( = ?auto_13506 ?auto_13511 ) ) ( not ( = ?auto_13507 ?auto_13508 ) ) ( not ( = ?auto_13508 ?auto_13511 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13511 ?auto_13507 ?auto_13505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13544 - OBJ
      ?auto_13545 - OBJ
      ?auto_13546 - OBJ
      ?auto_13543 - LOCATION
    )
    :vars
    (
      ?auto_13547 - TRUCK
      ?auto_13550 - LOCATION
      ?auto_13548 - CITY
      ?auto_13549 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13547 ?auto_13550 ) ( IN-CITY ?auto_13550 ?auto_13548 ) ( IN-CITY ?auto_13543 ?auto_13548 ) ( not ( = ?auto_13543 ?auto_13550 ) ) ( OBJ-AT ?auto_13549 ?auto_13543 ) ( not ( = ?auto_13549 ?auto_13544 ) ) ( OBJ-AT ?auto_13544 ?auto_13550 ) ( OBJ-AT ?auto_13545 ?auto_13543 ) ( OBJ-AT ?auto_13546 ?auto_13543 ) ( not ( = ?auto_13544 ?auto_13545 ) ) ( not ( = ?auto_13544 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13549 ) ) ( not ( = ?auto_13546 ?auto_13549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13549 ?auto_13544 ?auto_13543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13647 - OBJ
      ?auto_13648 - OBJ
      ?auto_13649 - OBJ
      ?auto_13646 - LOCATION
    )
    :vars
    (
      ?auto_13652 - LOCATION
      ?auto_13650 - CITY
      ?auto_13653 - OBJ
      ?auto_13651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13652 ?auto_13650 ) ( IN-CITY ?auto_13646 ?auto_13650 ) ( not ( = ?auto_13646 ?auto_13652 ) ) ( OBJ-AT ?auto_13653 ?auto_13646 ) ( not ( = ?auto_13653 ?auto_13649 ) ) ( OBJ-AT ?auto_13649 ?auto_13652 ) ( TRUCK-AT ?auto_13651 ?auto_13646 ) ( OBJ-AT ?auto_13647 ?auto_13646 ) ( OBJ-AT ?auto_13648 ?auto_13646 ) ( not ( = ?auto_13647 ?auto_13648 ) ) ( not ( = ?auto_13647 ?auto_13649 ) ) ( not ( = ?auto_13647 ?auto_13653 ) ) ( not ( = ?auto_13648 ?auto_13649 ) ) ( not ( = ?auto_13648 ?auto_13653 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13653 ?auto_13649 ?auto_13646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13659 - OBJ
      ?auto_13660 - OBJ
      ?auto_13661 - OBJ
      ?auto_13658 - LOCATION
    )
    :vars
    (
      ?auto_13664 - LOCATION
      ?auto_13662 - CITY
      ?auto_13665 - OBJ
      ?auto_13663 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13664 ?auto_13662 ) ( IN-CITY ?auto_13658 ?auto_13662 ) ( not ( = ?auto_13658 ?auto_13664 ) ) ( OBJ-AT ?auto_13665 ?auto_13658 ) ( not ( = ?auto_13665 ?auto_13660 ) ) ( OBJ-AT ?auto_13660 ?auto_13664 ) ( TRUCK-AT ?auto_13663 ?auto_13658 ) ( OBJ-AT ?auto_13659 ?auto_13658 ) ( OBJ-AT ?auto_13661 ?auto_13658 ) ( not ( = ?auto_13659 ?auto_13660 ) ) ( not ( = ?auto_13659 ?auto_13661 ) ) ( not ( = ?auto_13659 ?auto_13665 ) ) ( not ( = ?auto_13660 ?auto_13661 ) ) ( not ( = ?auto_13661 ?auto_13665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13665 ?auto_13660 ?auto_13658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13675 - OBJ
      ?auto_13676 - OBJ
      ?auto_13677 - OBJ
      ?auto_13674 - LOCATION
    )
    :vars
    (
      ?auto_13680 - LOCATION
      ?auto_13678 - CITY
      ?auto_13679 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13680 ?auto_13678 ) ( IN-CITY ?auto_13674 ?auto_13678 ) ( not ( = ?auto_13674 ?auto_13680 ) ) ( OBJ-AT ?auto_13677 ?auto_13674 ) ( not ( = ?auto_13677 ?auto_13675 ) ) ( OBJ-AT ?auto_13675 ?auto_13680 ) ( TRUCK-AT ?auto_13679 ?auto_13674 ) ( OBJ-AT ?auto_13676 ?auto_13674 ) ( not ( = ?auto_13675 ?auto_13676 ) ) ( not ( = ?auto_13676 ?auto_13677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13677 ?auto_13675 ?auto_13674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13697 - OBJ
      ?auto_13698 - OBJ
      ?auto_13699 - OBJ
      ?auto_13696 - LOCATION
    )
    :vars
    (
      ?auto_13702 - LOCATION
      ?auto_13700 - CITY
      ?auto_13703 - OBJ
      ?auto_13701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13702 ?auto_13700 ) ( IN-CITY ?auto_13696 ?auto_13700 ) ( not ( = ?auto_13696 ?auto_13702 ) ) ( OBJ-AT ?auto_13703 ?auto_13696 ) ( not ( = ?auto_13703 ?auto_13697 ) ) ( OBJ-AT ?auto_13697 ?auto_13702 ) ( TRUCK-AT ?auto_13701 ?auto_13696 ) ( OBJ-AT ?auto_13698 ?auto_13696 ) ( OBJ-AT ?auto_13699 ?auto_13696 ) ( not ( = ?auto_13697 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13699 ) ) ( not ( = ?auto_13698 ?auto_13699 ) ) ( not ( = ?auto_13698 ?auto_13703 ) ) ( not ( = ?auto_13699 ?auto_13703 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13703 ?auto_13697 ?auto_13696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13765 - OBJ
      ?auto_13766 - OBJ
      ?auto_13767 - OBJ
      ?auto_13764 - LOCATION
    )
    :vars
    (
      ?auto_13770 - LOCATION
      ?auto_13769 - CITY
      ?auto_13768 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13770 ?auto_13769 ) ( IN-CITY ?auto_13764 ?auto_13769 ) ( not ( = ?auto_13764 ?auto_13770 ) ) ( OBJ-AT ?auto_13765 ?auto_13764 ) ( not ( = ?auto_13765 ?auto_13767 ) ) ( OBJ-AT ?auto_13767 ?auto_13770 ) ( TRUCK-AT ?auto_13768 ?auto_13764 ) ( OBJ-AT ?auto_13766 ?auto_13764 ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( not ( = ?auto_13766 ?auto_13767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13765 ?auto_13767 ?auto_13764 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13905 - OBJ
      ?auto_13904 - LOCATION
    )
    :vars
    (
      ?auto_13909 - LOCATION
      ?auto_13908 - CITY
      ?auto_13907 - OBJ
      ?auto_13906 - TRUCK
      ?auto_13910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13909 ?auto_13908 ) ( IN-CITY ?auto_13904 ?auto_13908 ) ( not ( = ?auto_13904 ?auto_13909 ) ) ( OBJ-AT ?auto_13907 ?auto_13904 ) ( not ( = ?auto_13907 ?auto_13905 ) ) ( OBJ-AT ?auto_13905 ?auto_13909 ) ( TRUCK-AT ?auto_13906 ?auto_13910 ) ( IN-CITY ?auto_13910 ?auto_13908 ) ( not ( = ?auto_13904 ?auto_13910 ) ) ( not ( = ?auto_13909 ?auto_13910 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13906 ?auto_13910 ?auto_13904 ?auto_13908 )
      ( DELIVER-2PKG ?auto_13907 ?auto_13905 ?auto_13904 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13912 - OBJ
      ?auto_13913 - OBJ
      ?auto_13911 - LOCATION
    )
    :vars
    (
      ?auto_13915 - LOCATION
      ?auto_13916 - CITY
      ?auto_13914 - TRUCK
      ?auto_13917 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13915 ?auto_13916 ) ( IN-CITY ?auto_13911 ?auto_13916 ) ( not ( = ?auto_13911 ?auto_13915 ) ) ( OBJ-AT ?auto_13912 ?auto_13911 ) ( not ( = ?auto_13912 ?auto_13913 ) ) ( OBJ-AT ?auto_13913 ?auto_13915 ) ( TRUCK-AT ?auto_13914 ?auto_13917 ) ( IN-CITY ?auto_13917 ?auto_13916 ) ( not ( = ?auto_13911 ?auto_13917 ) ) ( not ( = ?auto_13915 ?auto_13917 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13913 ?auto_13911 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13927 - OBJ
      ?auto_13928 - OBJ
      ?auto_13926 - LOCATION
    )
    :vars
    (
      ?auto_13931 - LOCATION
      ?auto_13930 - CITY
      ?auto_13932 - TRUCK
      ?auto_13929 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13931 ?auto_13930 ) ( IN-CITY ?auto_13926 ?auto_13930 ) ( not ( = ?auto_13926 ?auto_13931 ) ) ( OBJ-AT ?auto_13928 ?auto_13926 ) ( not ( = ?auto_13928 ?auto_13927 ) ) ( OBJ-AT ?auto_13927 ?auto_13931 ) ( TRUCK-AT ?auto_13932 ?auto_13929 ) ( IN-CITY ?auto_13929 ?auto_13930 ) ( not ( = ?auto_13926 ?auto_13929 ) ) ( not ( = ?auto_13931 ?auto_13929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13928 ?auto_13927 ?auto_13926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13950 - OBJ
      ?auto_13951 - OBJ
      ?auto_13952 - OBJ
      ?auto_13949 - LOCATION
    )
    :vars
    (
      ?auto_13955 - LOCATION
      ?auto_13954 - CITY
      ?auto_13956 - TRUCK
      ?auto_13953 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13955 ?auto_13954 ) ( IN-CITY ?auto_13949 ?auto_13954 ) ( not ( = ?auto_13949 ?auto_13955 ) ) ( OBJ-AT ?auto_13950 ?auto_13949 ) ( not ( = ?auto_13950 ?auto_13952 ) ) ( OBJ-AT ?auto_13952 ?auto_13955 ) ( TRUCK-AT ?auto_13956 ?auto_13953 ) ( IN-CITY ?auto_13953 ?auto_13954 ) ( not ( = ?auto_13949 ?auto_13953 ) ) ( not ( = ?auto_13955 ?auto_13953 ) ) ( OBJ-AT ?auto_13951 ?auto_13949 ) ( not ( = ?auto_13950 ?auto_13951 ) ) ( not ( = ?auto_13951 ?auto_13952 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13950 ?auto_13952 ?auto_13949 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13966 - OBJ
      ?auto_13967 - OBJ
      ?auto_13968 - OBJ
      ?auto_13965 - LOCATION
    )
    :vars
    (
      ?auto_13971 - LOCATION
      ?auto_13970 - CITY
      ?auto_13972 - TRUCK
      ?auto_13969 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13971 ?auto_13970 ) ( IN-CITY ?auto_13965 ?auto_13970 ) ( not ( = ?auto_13965 ?auto_13971 ) ) ( OBJ-AT ?auto_13968 ?auto_13965 ) ( not ( = ?auto_13968 ?auto_13967 ) ) ( OBJ-AT ?auto_13967 ?auto_13971 ) ( TRUCK-AT ?auto_13972 ?auto_13969 ) ( IN-CITY ?auto_13969 ?auto_13970 ) ( not ( = ?auto_13965 ?auto_13969 ) ) ( not ( = ?auto_13971 ?auto_13969 ) ) ( OBJ-AT ?auto_13966 ?auto_13965 ) ( not ( = ?auto_13966 ?auto_13967 ) ) ( not ( = ?auto_13966 ?auto_13968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13968 ?auto_13967 ?auto_13965 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14033 - OBJ
      ?auto_14034 - OBJ
      ?auto_14035 - OBJ
      ?auto_14032 - LOCATION
    )
    :vars
    (
      ?auto_14038 - LOCATION
      ?auto_14037 - CITY
      ?auto_14039 - TRUCK
      ?auto_14036 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14038 ?auto_14037 ) ( IN-CITY ?auto_14032 ?auto_14037 ) ( not ( = ?auto_14032 ?auto_14038 ) ) ( OBJ-AT ?auto_14034 ?auto_14032 ) ( not ( = ?auto_14034 ?auto_14033 ) ) ( OBJ-AT ?auto_14033 ?auto_14038 ) ( TRUCK-AT ?auto_14039 ?auto_14036 ) ( IN-CITY ?auto_14036 ?auto_14037 ) ( not ( = ?auto_14032 ?auto_14036 ) ) ( not ( = ?auto_14038 ?auto_14036 ) ) ( OBJ-AT ?auto_14035 ?auto_14032 ) ( not ( = ?auto_14033 ?auto_14035 ) ) ( not ( = ?auto_14034 ?auto_14035 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14034 ?auto_14033 ?auto_14032 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14638 - OBJ
      ?auto_14637 - LOCATION
    )
    :vars
    (
      ?auto_14642 - LOCATION
      ?auto_14640 - CITY
      ?auto_14639 - OBJ
      ?auto_14641 - TRUCK
      ?auto_14643 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14642 ?auto_14640 ) ( IN-CITY ?auto_14637 ?auto_14640 ) ( not ( = ?auto_14637 ?auto_14642 ) ) ( not ( = ?auto_14639 ?auto_14638 ) ) ( OBJ-AT ?auto_14638 ?auto_14642 ) ( IN-TRUCK ?auto_14639 ?auto_14641 ) ( TRUCK-AT ?auto_14641 ?auto_14643 ) ( IN-CITY ?auto_14643 ?auto_14640 ) ( not ( = ?auto_14637 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14643 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14641 ?auto_14643 ?auto_14637 ?auto_14640 )
      ( DELIVER-2PKG ?auto_14639 ?auto_14638 ?auto_14637 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14645 - OBJ
      ?auto_14646 - OBJ
      ?auto_14644 - LOCATION
    )
    :vars
    (
      ?auto_14648 - LOCATION
      ?auto_14650 - CITY
      ?auto_14647 - TRUCK
      ?auto_14649 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14648 ?auto_14650 ) ( IN-CITY ?auto_14644 ?auto_14650 ) ( not ( = ?auto_14644 ?auto_14648 ) ) ( not ( = ?auto_14645 ?auto_14646 ) ) ( OBJ-AT ?auto_14646 ?auto_14648 ) ( IN-TRUCK ?auto_14645 ?auto_14647 ) ( TRUCK-AT ?auto_14647 ?auto_14649 ) ( IN-CITY ?auto_14649 ?auto_14650 ) ( not ( = ?auto_14644 ?auto_14649 ) ) ( not ( = ?auto_14648 ?auto_14649 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14646 ?auto_14644 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14660 - OBJ
      ?auto_14661 - OBJ
      ?auto_14659 - LOCATION
    )
    :vars
    (
      ?auto_14665 - LOCATION
      ?auto_14663 - CITY
      ?auto_14664 - TRUCK
      ?auto_14662 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14665 ?auto_14663 ) ( IN-CITY ?auto_14659 ?auto_14663 ) ( not ( = ?auto_14659 ?auto_14665 ) ) ( not ( = ?auto_14661 ?auto_14660 ) ) ( OBJ-AT ?auto_14660 ?auto_14665 ) ( IN-TRUCK ?auto_14661 ?auto_14664 ) ( TRUCK-AT ?auto_14664 ?auto_14662 ) ( IN-CITY ?auto_14662 ?auto_14663 ) ( not ( = ?auto_14659 ?auto_14662 ) ) ( not ( = ?auto_14665 ?auto_14662 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14661 ?auto_14660 ?auto_14659 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14842 - OBJ
      ?auto_14841 - LOCATION
    )
    :vars
    (
      ?auto_14847 - LOCATION
      ?auto_14844 - CITY
      ?auto_14845 - OBJ
      ?auto_14846 - TRUCK
      ?auto_14843 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14847 ?auto_14844 ) ( IN-CITY ?auto_14841 ?auto_14844 ) ( not ( = ?auto_14841 ?auto_14847 ) ) ( not ( = ?auto_14845 ?auto_14842 ) ) ( OBJ-AT ?auto_14842 ?auto_14847 ) ( TRUCK-AT ?auto_14846 ?auto_14843 ) ( IN-CITY ?auto_14843 ?auto_14844 ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( not ( = ?auto_14847 ?auto_14843 ) ) ( OBJ-AT ?auto_14845 ?auto_14843 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14845 ?auto_14846 ?auto_14843 )
      ( DELIVER-2PKG ?auto_14845 ?auto_14842 ?auto_14841 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14849 - OBJ
      ?auto_14850 - OBJ
      ?auto_14848 - LOCATION
    )
    :vars
    (
      ?auto_14851 - LOCATION
      ?auto_14852 - CITY
      ?auto_14853 - TRUCK
      ?auto_14854 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14851 ?auto_14852 ) ( IN-CITY ?auto_14848 ?auto_14852 ) ( not ( = ?auto_14848 ?auto_14851 ) ) ( not ( = ?auto_14849 ?auto_14850 ) ) ( OBJ-AT ?auto_14850 ?auto_14851 ) ( TRUCK-AT ?auto_14853 ?auto_14854 ) ( IN-CITY ?auto_14854 ?auto_14852 ) ( not ( = ?auto_14848 ?auto_14854 ) ) ( not ( = ?auto_14851 ?auto_14854 ) ) ( OBJ-AT ?auto_14849 ?auto_14854 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14850 ?auto_14848 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14859 - OBJ
      ?auto_14860 - OBJ
      ?auto_14858 - LOCATION
    )
    :vars
    (
      ?auto_14864 - LOCATION
      ?auto_14861 - CITY
      ?auto_14863 - TRUCK
      ?auto_14862 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_14864 ?auto_14861 ) ( IN-CITY ?auto_14858 ?auto_14861 ) ( not ( = ?auto_14858 ?auto_14864 ) ) ( not ( = ?auto_14860 ?auto_14859 ) ) ( OBJ-AT ?auto_14859 ?auto_14864 ) ( TRUCK-AT ?auto_14863 ?auto_14862 ) ( IN-CITY ?auto_14862 ?auto_14861 ) ( not ( = ?auto_14858 ?auto_14862 ) ) ( not ( = ?auto_14864 ?auto_14862 ) ) ( OBJ-AT ?auto_14860 ?auto_14862 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14860 ?auto_14859 ?auto_14858 ) )
  )

)

