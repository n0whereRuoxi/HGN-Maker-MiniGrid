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
      ?auto_135410 - OBJ
      ?auto_135409 - LOCATION
    )
    :vars
    (
      ?auto_135411 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135411 ?auto_135409 ) ( IN-TRUCK ?auto_135410 ?auto_135411 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_135410 ?auto_135411 ?auto_135409 )
      ( DELIVER-1PKG-VERIFY ?auto_135410 ?auto_135409 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135428 - OBJ
      ?auto_135427 - LOCATION
    )
    :vars
    (
      ?auto_135429 - TRUCK
      ?auto_135430 - LOCATION
      ?auto_135431 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135428 ?auto_135429 ) ( TRUCK-AT ?auto_135429 ?auto_135430 ) ( IN-CITY ?auto_135430 ?auto_135431 ) ( IN-CITY ?auto_135427 ?auto_135431 ) ( not ( = ?auto_135427 ?auto_135430 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135429 ?auto_135430 ?auto_135427 ?auto_135431 )
      ( DELIVER-1PKG ?auto_135428 ?auto_135427 )
      ( DELIVER-1PKG-VERIFY ?auto_135428 ?auto_135427 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135454 - OBJ
      ?auto_135453 - LOCATION
    )
    :vars
    (
      ?auto_135455 - TRUCK
      ?auto_135457 - LOCATION
      ?auto_135456 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135455 ?auto_135457 ) ( IN-CITY ?auto_135457 ?auto_135456 ) ( IN-CITY ?auto_135453 ?auto_135456 ) ( not ( = ?auto_135453 ?auto_135457 ) ) ( OBJ-AT ?auto_135454 ?auto_135457 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135454 ?auto_135455 ?auto_135457 )
      ( DELIVER-1PKG ?auto_135454 ?auto_135453 )
      ( DELIVER-1PKG-VERIFY ?auto_135454 ?auto_135453 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135480 - OBJ
      ?auto_135479 - LOCATION
    )
    :vars
    (
      ?auto_135482 - LOCATION
      ?auto_135483 - CITY
      ?auto_135481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135482 ?auto_135483 ) ( IN-CITY ?auto_135479 ?auto_135483 ) ( not ( = ?auto_135479 ?auto_135482 ) ) ( OBJ-AT ?auto_135480 ?auto_135482 ) ( TRUCK-AT ?auto_135481 ?auto_135479 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_135481 ?auto_135479 ?auto_135482 ?auto_135483 )
      ( DELIVER-1PKG ?auto_135480 ?auto_135479 )
      ( DELIVER-1PKG-VERIFY ?auto_135480 ?auto_135479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135623 - OBJ
      ?auto_135624 - OBJ
      ?auto_135622 - LOCATION
    )
    :vars
    (
      ?auto_135625 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135625 ?auto_135622 ) ( IN-TRUCK ?auto_135624 ?auto_135625 ) ( OBJ-AT ?auto_135623 ?auto_135622 ) ( not ( = ?auto_135623 ?auto_135624 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135624 ?auto_135622 )
      ( DELIVER-2PKG-VERIFY ?auto_135623 ?auto_135624 ?auto_135622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135627 - OBJ
      ?auto_135628 - OBJ
      ?auto_135626 - LOCATION
    )
    :vars
    (
      ?auto_135629 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135629 ?auto_135626 ) ( IN-TRUCK ?auto_135627 ?auto_135629 ) ( OBJ-AT ?auto_135628 ?auto_135626 ) ( not ( = ?auto_135627 ?auto_135628 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135627 ?auto_135626 )
      ( DELIVER-2PKG-VERIFY ?auto_135627 ?auto_135628 ?auto_135626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135635 - OBJ
      ?auto_135636 - OBJ
      ?auto_135637 - OBJ
      ?auto_135634 - LOCATION
    )
    :vars
    (
      ?auto_135638 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135638 ?auto_135634 ) ( IN-TRUCK ?auto_135637 ?auto_135638 ) ( OBJ-AT ?auto_135635 ?auto_135634 ) ( OBJ-AT ?auto_135636 ?auto_135634 ) ( not ( = ?auto_135635 ?auto_135636 ) ) ( not ( = ?auto_135635 ?auto_135637 ) ) ( not ( = ?auto_135636 ?auto_135637 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135637 ?auto_135634 )
      ( DELIVER-3PKG-VERIFY ?auto_135635 ?auto_135636 ?auto_135637 ?auto_135634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135640 - OBJ
      ?auto_135641 - OBJ
      ?auto_135642 - OBJ
      ?auto_135639 - LOCATION
    )
    :vars
    (
      ?auto_135643 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135643 ?auto_135639 ) ( IN-TRUCK ?auto_135641 ?auto_135643 ) ( OBJ-AT ?auto_135640 ?auto_135639 ) ( OBJ-AT ?auto_135642 ?auto_135639 ) ( not ( = ?auto_135640 ?auto_135641 ) ) ( not ( = ?auto_135640 ?auto_135642 ) ) ( not ( = ?auto_135641 ?auto_135642 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135641 ?auto_135639 )
      ( DELIVER-3PKG-VERIFY ?auto_135640 ?auto_135641 ?auto_135642 ?auto_135639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135650 - OBJ
      ?auto_135651 - OBJ
      ?auto_135652 - OBJ
      ?auto_135649 - LOCATION
    )
    :vars
    (
      ?auto_135653 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135653 ?auto_135649 ) ( IN-TRUCK ?auto_135650 ?auto_135653 ) ( OBJ-AT ?auto_135651 ?auto_135649 ) ( OBJ-AT ?auto_135652 ?auto_135649 ) ( not ( = ?auto_135650 ?auto_135651 ) ) ( not ( = ?auto_135650 ?auto_135652 ) ) ( not ( = ?auto_135651 ?auto_135652 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135650 ?auto_135649 )
      ( DELIVER-3PKG-VERIFY ?auto_135650 ?auto_135651 ?auto_135652 ?auto_135649 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135670 - OBJ
      ?auto_135671 - OBJ
      ?auto_135672 - OBJ
      ?auto_135673 - OBJ
      ?auto_135669 - LOCATION
    )
    :vars
    (
      ?auto_135674 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135674 ?auto_135669 ) ( IN-TRUCK ?auto_135673 ?auto_135674 ) ( OBJ-AT ?auto_135670 ?auto_135669 ) ( OBJ-AT ?auto_135671 ?auto_135669 ) ( OBJ-AT ?auto_135672 ?auto_135669 ) ( not ( = ?auto_135670 ?auto_135671 ) ) ( not ( = ?auto_135670 ?auto_135672 ) ) ( not ( = ?auto_135670 ?auto_135673 ) ) ( not ( = ?auto_135671 ?auto_135672 ) ) ( not ( = ?auto_135671 ?auto_135673 ) ) ( not ( = ?auto_135672 ?auto_135673 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135673 ?auto_135669 )
      ( DELIVER-4PKG-VERIFY ?auto_135670 ?auto_135671 ?auto_135672 ?auto_135673 ?auto_135669 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135676 - OBJ
      ?auto_135677 - OBJ
      ?auto_135678 - OBJ
      ?auto_135679 - OBJ
      ?auto_135675 - LOCATION
    )
    :vars
    (
      ?auto_135680 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135680 ?auto_135675 ) ( IN-TRUCK ?auto_135678 ?auto_135680 ) ( OBJ-AT ?auto_135676 ?auto_135675 ) ( OBJ-AT ?auto_135677 ?auto_135675 ) ( OBJ-AT ?auto_135679 ?auto_135675 ) ( not ( = ?auto_135676 ?auto_135677 ) ) ( not ( = ?auto_135676 ?auto_135678 ) ) ( not ( = ?auto_135676 ?auto_135679 ) ) ( not ( = ?auto_135677 ?auto_135678 ) ) ( not ( = ?auto_135677 ?auto_135679 ) ) ( not ( = ?auto_135678 ?auto_135679 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135678 ?auto_135675 )
      ( DELIVER-4PKG-VERIFY ?auto_135676 ?auto_135677 ?auto_135678 ?auto_135679 ?auto_135675 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135688 - OBJ
      ?auto_135689 - OBJ
      ?auto_135690 - OBJ
      ?auto_135691 - OBJ
      ?auto_135687 - LOCATION
    )
    :vars
    (
      ?auto_135692 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135692 ?auto_135687 ) ( IN-TRUCK ?auto_135689 ?auto_135692 ) ( OBJ-AT ?auto_135688 ?auto_135687 ) ( OBJ-AT ?auto_135690 ?auto_135687 ) ( OBJ-AT ?auto_135691 ?auto_135687 ) ( not ( = ?auto_135688 ?auto_135689 ) ) ( not ( = ?auto_135688 ?auto_135690 ) ) ( not ( = ?auto_135688 ?auto_135691 ) ) ( not ( = ?auto_135689 ?auto_135690 ) ) ( not ( = ?auto_135689 ?auto_135691 ) ) ( not ( = ?auto_135690 ?auto_135691 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135689 ?auto_135687 )
      ( DELIVER-4PKG-VERIFY ?auto_135688 ?auto_135689 ?auto_135690 ?auto_135691 ?auto_135687 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135712 - OBJ
      ?auto_135713 - OBJ
      ?auto_135714 - OBJ
      ?auto_135715 - OBJ
      ?auto_135711 - LOCATION
    )
    :vars
    (
      ?auto_135716 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135716 ?auto_135711 ) ( IN-TRUCK ?auto_135712 ?auto_135716 ) ( OBJ-AT ?auto_135713 ?auto_135711 ) ( OBJ-AT ?auto_135714 ?auto_135711 ) ( OBJ-AT ?auto_135715 ?auto_135711 ) ( not ( = ?auto_135712 ?auto_135713 ) ) ( not ( = ?auto_135712 ?auto_135714 ) ) ( not ( = ?auto_135712 ?auto_135715 ) ) ( not ( = ?auto_135713 ?auto_135714 ) ) ( not ( = ?auto_135713 ?auto_135715 ) ) ( not ( = ?auto_135714 ?auto_135715 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135712 ?auto_135711 )
      ( DELIVER-4PKG-VERIFY ?auto_135712 ?auto_135713 ?auto_135714 ?auto_135715 ?auto_135711 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135765 - OBJ
      ?auto_135766 - OBJ
      ?auto_135764 - LOCATION
    )
    :vars
    (
      ?auto_135768 - TRUCK
      ?auto_135769 - LOCATION
      ?auto_135767 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135766 ?auto_135768 ) ( TRUCK-AT ?auto_135768 ?auto_135769 ) ( IN-CITY ?auto_135769 ?auto_135767 ) ( IN-CITY ?auto_135764 ?auto_135767 ) ( not ( = ?auto_135764 ?auto_135769 ) ) ( OBJ-AT ?auto_135765 ?auto_135764 ) ( not ( = ?auto_135765 ?auto_135766 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135766 ?auto_135764 )
      ( DELIVER-2PKG-VERIFY ?auto_135765 ?auto_135766 ?auto_135764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135771 - OBJ
      ?auto_135772 - OBJ
      ?auto_135770 - LOCATION
    )
    :vars
    (
      ?auto_135773 - TRUCK
      ?auto_135775 - LOCATION
      ?auto_135774 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135771 ?auto_135773 ) ( TRUCK-AT ?auto_135773 ?auto_135775 ) ( IN-CITY ?auto_135775 ?auto_135774 ) ( IN-CITY ?auto_135770 ?auto_135774 ) ( not ( = ?auto_135770 ?auto_135775 ) ) ( OBJ-AT ?auto_135772 ?auto_135770 ) ( not ( = ?auto_135772 ?auto_135771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135772 ?auto_135771 ?auto_135770 )
      ( DELIVER-2PKG-VERIFY ?auto_135771 ?auto_135772 ?auto_135770 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135784 - OBJ
      ?auto_135785 - OBJ
      ?auto_135786 - OBJ
      ?auto_135783 - LOCATION
    )
    :vars
    (
      ?auto_135787 - TRUCK
      ?auto_135789 - LOCATION
      ?auto_135788 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135786 ?auto_135787 ) ( TRUCK-AT ?auto_135787 ?auto_135789 ) ( IN-CITY ?auto_135789 ?auto_135788 ) ( IN-CITY ?auto_135783 ?auto_135788 ) ( not ( = ?auto_135783 ?auto_135789 ) ) ( OBJ-AT ?auto_135784 ?auto_135783 ) ( not ( = ?auto_135784 ?auto_135786 ) ) ( OBJ-AT ?auto_135785 ?auto_135783 ) ( not ( = ?auto_135784 ?auto_135785 ) ) ( not ( = ?auto_135785 ?auto_135786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135784 ?auto_135786 ?auto_135783 )
      ( DELIVER-3PKG-VERIFY ?auto_135784 ?auto_135785 ?auto_135786 ?auto_135783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135791 - OBJ
      ?auto_135792 - OBJ
      ?auto_135793 - OBJ
      ?auto_135790 - LOCATION
    )
    :vars
    (
      ?auto_135794 - TRUCK
      ?auto_135796 - LOCATION
      ?auto_135795 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135792 ?auto_135794 ) ( TRUCK-AT ?auto_135794 ?auto_135796 ) ( IN-CITY ?auto_135796 ?auto_135795 ) ( IN-CITY ?auto_135790 ?auto_135795 ) ( not ( = ?auto_135790 ?auto_135796 ) ) ( OBJ-AT ?auto_135793 ?auto_135790 ) ( not ( = ?auto_135793 ?auto_135792 ) ) ( OBJ-AT ?auto_135791 ?auto_135790 ) ( not ( = ?auto_135791 ?auto_135792 ) ) ( not ( = ?auto_135791 ?auto_135793 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135793 ?auto_135792 ?auto_135790 )
      ( DELIVER-3PKG-VERIFY ?auto_135791 ?auto_135792 ?auto_135793 ?auto_135790 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135805 - OBJ
      ?auto_135806 - OBJ
      ?auto_135807 - OBJ
      ?auto_135804 - LOCATION
    )
    :vars
    (
      ?auto_135808 - TRUCK
      ?auto_135810 - LOCATION
      ?auto_135809 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135805 ?auto_135808 ) ( TRUCK-AT ?auto_135808 ?auto_135810 ) ( IN-CITY ?auto_135810 ?auto_135809 ) ( IN-CITY ?auto_135804 ?auto_135809 ) ( not ( = ?auto_135804 ?auto_135810 ) ) ( OBJ-AT ?auto_135807 ?auto_135804 ) ( not ( = ?auto_135807 ?auto_135805 ) ) ( OBJ-AT ?auto_135806 ?auto_135804 ) ( not ( = ?auto_135805 ?auto_135806 ) ) ( not ( = ?auto_135806 ?auto_135807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135807 ?auto_135805 ?auto_135804 )
      ( DELIVER-3PKG-VERIFY ?auto_135805 ?auto_135806 ?auto_135807 ?auto_135804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135834 - OBJ
      ?auto_135835 - OBJ
      ?auto_135836 - OBJ
      ?auto_135837 - OBJ
      ?auto_135833 - LOCATION
    )
    :vars
    (
      ?auto_135838 - TRUCK
      ?auto_135840 - LOCATION
      ?auto_135839 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135837 ?auto_135838 ) ( TRUCK-AT ?auto_135838 ?auto_135840 ) ( IN-CITY ?auto_135840 ?auto_135839 ) ( IN-CITY ?auto_135833 ?auto_135839 ) ( not ( = ?auto_135833 ?auto_135840 ) ) ( OBJ-AT ?auto_135835 ?auto_135833 ) ( not ( = ?auto_135835 ?auto_135837 ) ) ( OBJ-AT ?auto_135834 ?auto_135833 ) ( OBJ-AT ?auto_135836 ?auto_135833 ) ( not ( = ?auto_135834 ?auto_135835 ) ) ( not ( = ?auto_135834 ?auto_135836 ) ) ( not ( = ?auto_135834 ?auto_135837 ) ) ( not ( = ?auto_135835 ?auto_135836 ) ) ( not ( = ?auto_135836 ?auto_135837 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135835 ?auto_135837 ?auto_135833 )
      ( DELIVER-4PKG-VERIFY ?auto_135834 ?auto_135835 ?auto_135836 ?auto_135837 ?auto_135833 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135842 - OBJ
      ?auto_135843 - OBJ
      ?auto_135844 - OBJ
      ?auto_135845 - OBJ
      ?auto_135841 - LOCATION
    )
    :vars
    (
      ?auto_135846 - TRUCK
      ?auto_135848 - LOCATION
      ?auto_135847 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135844 ?auto_135846 ) ( TRUCK-AT ?auto_135846 ?auto_135848 ) ( IN-CITY ?auto_135848 ?auto_135847 ) ( IN-CITY ?auto_135841 ?auto_135847 ) ( not ( = ?auto_135841 ?auto_135848 ) ) ( OBJ-AT ?auto_135845 ?auto_135841 ) ( not ( = ?auto_135845 ?auto_135844 ) ) ( OBJ-AT ?auto_135842 ?auto_135841 ) ( OBJ-AT ?auto_135843 ?auto_135841 ) ( not ( = ?auto_135842 ?auto_135843 ) ) ( not ( = ?auto_135842 ?auto_135844 ) ) ( not ( = ?auto_135842 ?auto_135845 ) ) ( not ( = ?auto_135843 ?auto_135844 ) ) ( not ( = ?auto_135843 ?auto_135845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135845 ?auto_135844 ?auto_135841 )
      ( DELIVER-4PKG-VERIFY ?auto_135842 ?auto_135843 ?auto_135844 ?auto_135845 ?auto_135841 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135858 - OBJ
      ?auto_135859 - OBJ
      ?auto_135860 - OBJ
      ?auto_135861 - OBJ
      ?auto_135857 - LOCATION
    )
    :vars
    (
      ?auto_135862 - TRUCK
      ?auto_135864 - LOCATION
      ?auto_135863 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135859 ?auto_135862 ) ( TRUCK-AT ?auto_135862 ?auto_135864 ) ( IN-CITY ?auto_135864 ?auto_135863 ) ( IN-CITY ?auto_135857 ?auto_135863 ) ( not ( = ?auto_135857 ?auto_135864 ) ) ( OBJ-AT ?auto_135858 ?auto_135857 ) ( not ( = ?auto_135858 ?auto_135859 ) ) ( OBJ-AT ?auto_135860 ?auto_135857 ) ( OBJ-AT ?auto_135861 ?auto_135857 ) ( not ( = ?auto_135858 ?auto_135860 ) ) ( not ( = ?auto_135858 ?auto_135861 ) ) ( not ( = ?auto_135859 ?auto_135860 ) ) ( not ( = ?auto_135859 ?auto_135861 ) ) ( not ( = ?auto_135860 ?auto_135861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135858 ?auto_135859 ?auto_135857 )
      ( DELIVER-4PKG-VERIFY ?auto_135858 ?auto_135859 ?auto_135860 ?auto_135861 ?auto_135857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_135890 - OBJ
      ?auto_135891 - OBJ
      ?auto_135892 - OBJ
      ?auto_135893 - OBJ
      ?auto_135889 - LOCATION
    )
    :vars
    (
      ?auto_135894 - TRUCK
      ?auto_135896 - LOCATION
      ?auto_135895 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_135890 ?auto_135894 ) ( TRUCK-AT ?auto_135894 ?auto_135896 ) ( IN-CITY ?auto_135896 ?auto_135895 ) ( IN-CITY ?auto_135889 ?auto_135895 ) ( not ( = ?auto_135889 ?auto_135896 ) ) ( OBJ-AT ?auto_135892 ?auto_135889 ) ( not ( = ?auto_135892 ?auto_135890 ) ) ( OBJ-AT ?auto_135891 ?auto_135889 ) ( OBJ-AT ?auto_135893 ?auto_135889 ) ( not ( = ?auto_135890 ?auto_135891 ) ) ( not ( = ?auto_135890 ?auto_135893 ) ) ( not ( = ?auto_135891 ?auto_135892 ) ) ( not ( = ?auto_135891 ?auto_135893 ) ) ( not ( = ?auto_135892 ?auto_135893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135892 ?auto_135890 ?auto_135889 )
      ( DELIVER-4PKG-VERIFY ?auto_135890 ?auto_135891 ?auto_135892 ?auto_135893 ?auto_135889 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_135955 - OBJ
      ?auto_135954 - LOCATION
    )
    :vars
    (
      ?auto_135956 - TRUCK
      ?auto_135958 - LOCATION
      ?auto_135957 - CITY
      ?auto_135959 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135956 ?auto_135958 ) ( IN-CITY ?auto_135958 ?auto_135957 ) ( IN-CITY ?auto_135954 ?auto_135957 ) ( not ( = ?auto_135954 ?auto_135958 ) ) ( OBJ-AT ?auto_135959 ?auto_135954 ) ( not ( = ?auto_135959 ?auto_135955 ) ) ( OBJ-AT ?auto_135955 ?auto_135958 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_135955 ?auto_135956 ?auto_135958 )
      ( DELIVER-2PKG ?auto_135959 ?auto_135955 ?auto_135954 )
      ( DELIVER-1PKG-VERIFY ?auto_135955 ?auto_135954 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135961 - OBJ
      ?auto_135962 - OBJ
      ?auto_135960 - LOCATION
    )
    :vars
    (
      ?auto_135963 - TRUCK
      ?auto_135964 - LOCATION
      ?auto_135965 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135963 ?auto_135964 ) ( IN-CITY ?auto_135964 ?auto_135965 ) ( IN-CITY ?auto_135960 ?auto_135965 ) ( not ( = ?auto_135960 ?auto_135964 ) ) ( OBJ-AT ?auto_135961 ?auto_135960 ) ( not ( = ?auto_135961 ?auto_135962 ) ) ( OBJ-AT ?auto_135962 ?auto_135964 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_135962 ?auto_135960 )
      ( DELIVER-2PKG-VERIFY ?auto_135961 ?auto_135962 ?auto_135960 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_135967 - OBJ
      ?auto_135968 - OBJ
      ?auto_135966 - LOCATION
    )
    :vars
    (
      ?auto_135971 - TRUCK
      ?auto_135970 - LOCATION
      ?auto_135969 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135971 ?auto_135970 ) ( IN-CITY ?auto_135970 ?auto_135969 ) ( IN-CITY ?auto_135966 ?auto_135969 ) ( not ( = ?auto_135966 ?auto_135970 ) ) ( OBJ-AT ?auto_135968 ?auto_135966 ) ( not ( = ?auto_135968 ?auto_135967 ) ) ( OBJ-AT ?auto_135967 ?auto_135970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135968 ?auto_135967 ?auto_135966 )
      ( DELIVER-2PKG-VERIFY ?auto_135967 ?auto_135968 ?auto_135966 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135980 - OBJ
      ?auto_135981 - OBJ
      ?auto_135982 - OBJ
      ?auto_135979 - LOCATION
    )
    :vars
    (
      ?auto_135985 - TRUCK
      ?auto_135984 - LOCATION
      ?auto_135983 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135985 ?auto_135984 ) ( IN-CITY ?auto_135984 ?auto_135983 ) ( IN-CITY ?auto_135979 ?auto_135983 ) ( not ( = ?auto_135979 ?auto_135984 ) ) ( OBJ-AT ?auto_135981 ?auto_135979 ) ( not ( = ?auto_135981 ?auto_135982 ) ) ( OBJ-AT ?auto_135982 ?auto_135984 ) ( OBJ-AT ?auto_135980 ?auto_135979 ) ( not ( = ?auto_135980 ?auto_135981 ) ) ( not ( = ?auto_135980 ?auto_135982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135981 ?auto_135982 ?auto_135979 )
      ( DELIVER-3PKG-VERIFY ?auto_135980 ?auto_135981 ?auto_135982 ?auto_135979 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_135987 - OBJ
      ?auto_135988 - OBJ
      ?auto_135989 - OBJ
      ?auto_135986 - LOCATION
    )
    :vars
    (
      ?auto_135992 - TRUCK
      ?auto_135991 - LOCATION
      ?auto_135990 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_135992 ?auto_135991 ) ( IN-CITY ?auto_135991 ?auto_135990 ) ( IN-CITY ?auto_135986 ?auto_135990 ) ( not ( = ?auto_135986 ?auto_135991 ) ) ( OBJ-AT ?auto_135989 ?auto_135986 ) ( not ( = ?auto_135989 ?auto_135988 ) ) ( OBJ-AT ?auto_135988 ?auto_135991 ) ( OBJ-AT ?auto_135987 ?auto_135986 ) ( not ( = ?auto_135987 ?auto_135988 ) ) ( not ( = ?auto_135987 ?auto_135989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_135989 ?auto_135988 ?auto_135986 )
      ( DELIVER-3PKG-VERIFY ?auto_135987 ?auto_135988 ?auto_135989 ?auto_135986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136001 - OBJ
      ?auto_136002 - OBJ
      ?auto_136003 - OBJ
      ?auto_136000 - LOCATION
    )
    :vars
    (
      ?auto_136006 - TRUCK
      ?auto_136005 - LOCATION
      ?auto_136004 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136006 ?auto_136005 ) ( IN-CITY ?auto_136005 ?auto_136004 ) ( IN-CITY ?auto_136000 ?auto_136004 ) ( not ( = ?auto_136000 ?auto_136005 ) ) ( OBJ-AT ?auto_136003 ?auto_136000 ) ( not ( = ?auto_136003 ?auto_136001 ) ) ( OBJ-AT ?auto_136001 ?auto_136005 ) ( OBJ-AT ?auto_136002 ?auto_136000 ) ( not ( = ?auto_136001 ?auto_136002 ) ) ( not ( = ?auto_136002 ?auto_136003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136003 ?auto_136001 ?auto_136000 )
      ( DELIVER-3PKG-VERIFY ?auto_136001 ?auto_136002 ?auto_136003 ?auto_136000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136030 - OBJ
      ?auto_136031 - OBJ
      ?auto_136032 - OBJ
      ?auto_136033 - OBJ
      ?auto_136029 - LOCATION
    )
    :vars
    (
      ?auto_136036 - TRUCK
      ?auto_136035 - LOCATION
      ?auto_136034 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136036 ?auto_136035 ) ( IN-CITY ?auto_136035 ?auto_136034 ) ( IN-CITY ?auto_136029 ?auto_136034 ) ( not ( = ?auto_136029 ?auto_136035 ) ) ( OBJ-AT ?auto_136031 ?auto_136029 ) ( not ( = ?auto_136031 ?auto_136033 ) ) ( OBJ-AT ?auto_136033 ?auto_136035 ) ( OBJ-AT ?auto_136030 ?auto_136029 ) ( OBJ-AT ?auto_136032 ?auto_136029 ) ( not ( = ?auto_136030 ?auto_136031 ) ) ( not ( = ?auto_136030 ?auto_136032 ) ) ( not ( = ?auto_136030 ?auto_136033 ) ) ( not ( = ?auto_136031 ?auto_136032 ) ) ( not ( = ?auto_136032 ?auto_136033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136031 ?auto_136033 ?auto_136029 )
      ( DELIVER-4PKG-VERIFY ?auto_136030 ?auto_136031 ?auto_136032 ?auto_136033 ?auto_136029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136038 - OBJ
      ?auto_136039 - OBJ
      ?auto_136040 - OBJ
      ?auto_136041 - OBJ
      ?auto_136037 - LOCATION
    )
    :vars
    (
      ?auto_136044 - TRUCK
      ?auto_136043 - LOCATION
      ?auto_136042 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136044 ?auto_136043 ) ( IN-CITY ?auto_136043 ?auto_136042 ) ( IN-CITY ?auto_136037 ?auto_136042 ) ( not ( = ?auto_136037 ?auto_136043 ) ) ( OBJ-AT ?auto_136041 ?auto_136037 ) ( not ( = ?auto_136041 ?auto_136040 ) ) ( OBJ-AT ?auto_136040 ?auto_136043 ) ( OBJ-AT ?auto_136038 ?auto_136037 ) ( OBJ-AT ?auto_136039 ?auto_136037 ) ( not ( = ?auto_136038 ?auto_136039 ) ) ( not ( = ?auto_136038 ?auto_136040 ) ) ( not ( = ?auto_136038 ?auto_136041 ) ) ( not ( = ?auto_136039 ?auto_136040 ) ) ( not ( = ?auto_136039 ?auto_136041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136041 ?auto_136040 ?auto_136037 )
      ( DELIVER-4PKG-VERIFY ?auto_136038 ?auto_136039 ?auto_136040 ?auto_136041 ?auto_136037 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136054 - OBJ
      ?auto_136055 - OBJ
      ?auto_136056 - OBJ
      ?auto_136057 - OBJ
      ?auto_136053 - LOCATION
    )
    :vars
    (
      ?auto_136060 - TRUCK
      ?auto_136059 - LOCATION
      ?auto_136058 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136060 ?auto_136059 ) ( IN-CITY ?auto_136059 ?auto_136058 ) ( IN-CITY ?auto_136053 ?auto_136058 ) ( not ( = ?auto_136053 ?auto_136059 ) ) ( OBJ-AT ?auto_136057 ?auto_136053 ) ( not ( = ?auto_136057 ?auto_136055 ) ) ( OBJ-AT ?auto_136055 ?auto_136059 ) ( OBJ-AT ?auto_136054 ?auto_136053 ) ( OBJ-AT ?auto_136056 ?auto_136053 ) ( not ( = ?auto_136054 ?auto_136055 ) ) ( not ( = ?auto_136054 ?auto_136056 ) ) ( not ( = ?auto_136054 ?auto_136057 ) ) ( not ( = ?auto_136055 ?auto_136056 ) ) ( not ( = ?auto_136056 ?auto_136057 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136057 ?auto_136055 ?auto_136053 )
      ( DELIVER-4PKG-VERIFY ?auto_136054 ?auto_136055 ?auto_136056 ?auto_136057 ?auto_136053 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136086 - OBJ
      ?auto_136087 - OBJ
      ?auto_136088 - OBJ
      ?auto_136089 - OBJ
      ?auto_136085 - LOCATION
    )
    :vars
    (
      ?auto_136092 - TRUCK
      ?auto_136091 - LOCATION
      ?auto_136090 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136092 ?auto_136091 ) ( IN-CITY ?auto_136091 ?auto_136090 ) ( IN-CITY ?auto_136085 ?auto_136090 ) ( not ( = ?auto_136085 ?auto_136091 ) ) ( OBJ-AT ?auto_136087 ?auto_136085 ) ( not ( = ?auto_136087 ?auto_136086 ) ) ( OBJ-AT ?auto_136086 ?auto_136091 ) ( OBJ-AT ?auto_136088 ?auto_136085 ) ( OBJ-AT ?auto_136089 ?auto_136085 ) ( not ( = ?auto_136086 ?auto_136088 ) ) ( not ( = ?auto_136086 ?auto_136089 ) ) ( not ( = ?auto_136087 ?auto_136088 ) ) ( not ( = ?auto_136087 ?auto_136089 ) ) ( not ( = ?auto_136088 ?auto_136089 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136087 ?auto_136086 ?auto_136085 )
      ( DELIVER-4PKG-VERIFY ?auto_136086 ?auto_136087 ?auto_136088 ?auto_136089 ?auto_136085 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136151 - OBJ
      ?auto_136150 - LOCATION
    )
    :vars
    (
      ?auto_136154 - LOCATION
      ?auto_136152 - CITY
      ?auto_136153 - OBJ
      ?auto_136155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136154 ?auto_136152 ) ( IN-CITY ?auto_136150 ?auto_136152 ) ( not ( = ?auto_136150 ?auto_136154 ) ) ( OBJ-AT ?auto_136153 ?auto_136150 ) ( not ( = ?auto_136153 ?auto_136151 ) ) ( OBJ-AT ?auto_136151 ?auto_136154 ) ( TRUCK-AT ?auto_136155 ?auto_136150 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136155 ?auto_136150 ?auto_136154 ?auto_136152 )
      ( DELIVER-2PKG ?auto_136153 ?auto_136151 ?auto_136150 )
      ( DELIVER-1PKG-VERIFY ?auto_136151 ?auto_136150 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136157 - OBJ
      ?auto_136158 - OBJ
      ?auto_136156 - LOCATION
    )
    :vars
    (
      ?auto_136159 - LOCATION
      ?auto_136161 - CITY
      ?auto_136160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136159 ?auto_136161 ) ( IN-CITY ?auto_136156 ?auto_136161 ) ( not ( = ?auto_136156 ?auto_136159 ) ) ( OBJ-AT ?auto_136157 ?auto_136156 ) ( not ( = ?auto_136157 ?auto_136158 ) ) ( OBJ-AT ?auto_136158 ?auto_136159 ) ( TRUCK-AT ?auto_136160 ?auto_136156 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136158 ?auto_136156 )
      ( DELIVER-2PKG-VERIFY ?auto_136157 ?auto_136158 ?auto_136156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136163 - OBJ
      ?auto_136164 - OBJ
      ?auto_136162 - LOCATION
    )
    :vars
    (
      ?auto_136167 - LOCATION
      ?auto_136165 - CITY
      ?auto_136166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136167 ?auto_136165 ) ( IN-CITY ?auto_136162 ?auto_136165 ) ( not ( = ?auto_136162 ?auto_136167 ) ) ( OBJ-AT ?auto_136164 ?auto_136162 ) ( not ( = ?auto_136164 ?auto_136163 ) ) ( OBJ-AT ?auto_136163 ?auto_136167 ) ( TRUCK-AT ?auto_136166 ?auto_136162 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136164 ?auto_136163 ?auto_136162 )
      ( DELIVER-2PKG-VERIFY ?auto_136163 ?auto_136164 ?auto_136162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136176 - OBJ
      ?auto_136177 - OBJ
      ?auto_136178 - OBJ
      ?auto_136175 - LOCATION
    )
    :vars
    (
      ?auto_136181 - LOCATION
      ?auto_136179 - CITY
      ?auto_136180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136181 ?auto_136179 ) ( IN-CITY ?auto_136175 ?auto_136179 ) ( not ( = ?auto_136175 ?auto_136181 ) ) ( OBJ-AT ?auto_136176 ?auto_136175 ) ( not ( = ?auto_136176 ?auto_136178 ) ) ( OBJ-AT ?auto_136178 ?auto_136181 ) ( TRUCK-AT ?auto_136180 ?auto_136175 ) ( OBJ-AT ?auto_136177 ?auto_136175 ) ( not ( = ?auto_136176 ?auto_136177 ) ) ( not ( = ?auto_136177 ?auto_136178 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136176 ?auto_136178 ?auto_136175 )
      ( DELIVER-3PKG-VERIFY ?auto_136176 ?auto_136177 ?auto_136178 ?auto_136175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136183 - OBJ
      ?auto_136184 - OBJ
      ?auto_136185 - OBJ
      ?auto_136182 - LOCATION
    )
    :vars
    (
      ?auto_136188 - LOCATION
      ?auto_136186 - CITY
      ?auto_136187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136188 ?auto_136186 ) ( IN-CITY ?auto_136182 ?auto_136186 ) ( not ( = ?auto_136182 ?auto_136188 ) ) ( OBJ-AT ?auto_136185 ?auto_136182 ) ( not ( = ?auto_136185 ?auto_136184 ) ) ( OBJ-AT ?auto_136184 ?auto_136188 ) ( TRUCK-AT ?auto_136187 ?auto_136182 ) ( OBJ-AT ?auto_136183 ?auto_136182 ) ( not ( = ?auto_136183 ?auto_136184 ) ) ( not ( = ?auto_136183 ?auto_136185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136185 ?auto_136184 ?auto_136182 )
      ( DELIVER-3PKG-VERIFY ?auto_136183 ?auto_136184 ?auto_136185 ?auto_136182 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136197 - OBJ
      ?auto_136198 - OBJ
      ?auto_136199 - OBJ
      ?auto_136196 - LOCATION
    )
    :vars
    (
      ?auto_136202 - LOCATION
      ?auto_136200 - CITY
      ?auto_136201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136202 ?auto_136200 ) ( IN-CITY ?auto_136196 ?auto_136200 ) ( not ( = ?auto_136196 ?auto_136202 ) ) ( OBJ-AT ?auto_136199 ?auto_136196 ) ( not ( = ?auto_136199 ?auto_136197 ) ) ( OBJ-AT ?auto_136197 ?auto_136202 ) ( TRUCK-AT ?auto_136201 ?auto_136196 ) ( OBJ-AT ?auto_136198 ?auto_136196 ) ( not ( = ?auto_136197 ?auto_136198 ) ) ( not ( = ?auto_136198 ?auto_136199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136199 ?auto_136197 ?auto_136196 )
      ( DELIVER-3PKG-VERIFY ?auto_136197 ?auto_136198 ?auto_136199 ?auto_136196 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136226 - OBJ
      ?auto_136227 - OBJ
      ?auto_136228 - OBJ
      ?auto_136229 - OBJ
      ?auto_136225 - LOCATION
    )
    :vars
    (
      ?auto_136232 - LOCATION
      ?auto_136230 - CITY
      ?auto_136231 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136232 ?auto_136230 ) ( IN-CITY ?auto_136225 ?auto_136230 ) ( not ( = ?auto_136225 ?auto_136232 ) ) ( OBJ-AT ?auto_136227 ?auto_136225 ) ( not ( = ?auto_136227 ?auto_136229 ) ) ( OBJ-AT ?auto_136229 ?auto_136232 ) ( TRUCK-AT ?auto_136231 ?auto_136225 ) ( OBJ-AT ?auto_136226 ?auto_136225 ) ( OBJ-AT ?auto_136228 ?auto_136225 ) ( not ( = ?auto_136226 ?auto_136227 ) ) ( not ( = ?auto_136226 ?auto_136228 ) ) ( not ( = ?auto_136226 ?auto_136229 ) ) ( not ( = ?auto_136227 ?auto_136228 ) ) ( not ( = ?auto_136228 ?auto_136229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136227 ?auto_136229 ?auto_136225 )
      ( DELIVER-4PKG-VERIFY ?auto_136226 ?auto_136227 ?auto_136228 ?auto_136229 ?auto_136225 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136234 - OBJ
      ?auto_136235 - OBJ
      ?auto_136236 - OBJ
      ?auto_136237 - OBJ
      ?auto_136233 - LOCATION
    )
    :vars
    (
      ?auto_136240 - LOCATION
      ?auto_136238 - CITY
      ?auto_136239 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136240 ?auto_136238 ) ( IN-CITY ?auto_136233 ?auto_136238 ) ( not ( = ?auto_136233 ?auto_136240 ) ) ( OBJ-AT ?auto_136237 ?auto_136233 ) ( not ( = ?auto_136237 ?auto_136236 ) ) ( OBJ-AT ?auto_136236 ?auto_136240 ) ( TRUCK-AT ?auto_136239 ?auto_136233 ) ( OBJ-AT ?auto_136234 ?auto_136233 ) ( OBJ-AT ?auto_136235 ?auto_136233 ) ( not ( = ?auto_136234 ?auto_136235 ) ) ( not ( = ?auto_136234 ?auto_136236 ) ) ( not ( = ?auto_136234 ?auto_136237 ) ) ( not ( = ?auto_136235 ?auto_136236 ) ) ( not ( = ?auto_136235 ?auto_136237 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136237 ?auto_136236 ?auto_136233 )
      ( DELIVER-4PKG-VERIFY ?auto_136234 ?auto_136235 ?auto_136236 ?auto_136237 ?auto_136233 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136250 - OBJ
      ?auto_136251 - OBJ
      ?auto_136252 - OBJ
      ?auto_136253 - OBJ
      ?auto_136249 - LOCATION
    )
    :vars
    (
      ?auto_136256 - LOCATION
      ?auto_136254 - CITY
      ?auto_136255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136256 ?auto_136254 ) ( IN-CITY ?auto_136249 ?auto_136254 ) ( not ( = ?auto_136249 ?auto_136256 ) ) ( OBJ-AT ?auto_136253 ?auto_136249 ) ( not ( = ?auto_136253 ?auto_136251 ) ) ( OBJ-AT ?auto_136251 ?auto_136256 ) ( TRUCK-AT ?auto_136255 ?auto_136249 ) ( OBJ-AT ?auto_136250 ?auto_136249 ) ( OBJ-AT ?auto_136252 ?auto_136249 ) ( not ( = ?auto_136250 ?auto_136251 ) ) ( not ( = ?auto_136250 ?auto_136252 ) ) ( not ( = ?auto_136250 ?auto_136253 ) ) ( not ( = ?auto_136251 ?auto_136252 ) ) ( not ( = ?auto_136252 ?auto_136253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136253 ?auto_136251 ?auto_136249 )
      ( DELIVER-4PKG-VERIFY ?auto_136250 ?auto_136251 ?auto_136252 ?auto_136253 ?auto_136249 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136282 - OBJ
      ?auto_136283 - OBJ
      ?auto_136284 - OBJ
      ?auto_136285 - OBJ
      ?auto_136281 - LOCATION
    )
    :vars
    (
      ?auto_136288 - LOCATION
      ?auto_136286 - CITY
      ?auto_136287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136288 ?auto_136286 ) ( IN-CITY ?auto_136281 ?auto_136286 ) ( not ( = ?auto_136281 ?auto_136288 ) ) ( OBJ-AT ?auto_136285 ?auto_136281 ) ( not ( = ?auto_136285 ?auto_136282 ) ) ( OBJ-AT ?auto_136282 ?auto_136288 ) ( TRUCK-AT ?auto_136287 ?auto_136281 ) ( OBJ-AT ?auto_136283 ?auto_136281 ) ( OBJ-AT ?auto_136284 ?auto_136281 ) ( not ( = ?auto_136282 ?auto_136283 ) ) ( not ( = ?auto_136282 ?auto_136284 ) ) ( not ( = ?auto_136283 ?auto_136284 ) ) ( not ( = ?auto_136283 ?auto_136285 ) ) ( not ( = ?auto_136284 ?auto_136285 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136285 ?auto_136282 ?auto_136281 )
      ( DELIVER-4PKG-VERIFY ?auto_136282 ?auto_136283 ?auto_136284 ?auto_136285 ?auto_136281 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136347 - OBJ
      ?auto_136346 - LOCATION
    )
    :vars
    (
      ?auto_136351 - LOCATION
      ?auto_136349 - CITY
      ?auto_136348 - OBJ
      ?auto_136350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136351 ?auto_136349 ) ( IN-CITY ?auto_136346 ?auto_136349 ) ( not ( = ?auto_136346 ?auto_136351 ) ) ( not ( = ?auto_136348 ?auto_136347 ) ) ( OBJ-AT ?auto_136347 ?auto_136351 ) ( TRUCK-AT ?auto_136350 ?auto_136346 ) ( IN-TRUCK ?auto_136348 ?auto_136350 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136348 ?auto_136346 )
      ( DELIVER-2PKG ?auto_136348 ?auto_136347 ?auto_136346 )
      ( DELIVER-1PKG-VERIFY ?auto_136347 ?auto_136346 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136353 - OBJ
      ?auto_136354 - OBJ
      ?auto_136352 - LOCATION
    )
    :vars
    (
      ?auto_136357 - LOCATION
      ?auto_136356 - CITY
      ?auto_136355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136357 ?auto_136356 ) ( IN-CITY ?auto_136352 ?auto_136356 ) ( not ( = ?auto_136352 ?auto_136357 ) ) ( not ( = ?auto_136353 ?auto_136354 ) ) ( OBJ-AT ?auto_136354 ?auto_136357 ) ( TRUCK-AT ?auto_136355 ?auto_136352 ) ( IN-TRUCK ?auto_136353 ?auto_136355 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136354 ?auto_136352 )
      ( DELIVER-2PKG-VERIFY ?auto_136353 ?auto_136354 ?auto_136352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136359 - OBJ
      ?auto_136360 - OBJ
      ?auto_136358 - LOCATION
    )
    :vars
    (
      ?auto_136363 - LOCATION
      ?auto_136361 - CITY
      ?auto_136362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136363 ?auto_136361 ) ( IN-CITY ?auto_136358 ?auto_136361 ) ( not ( = ?auto_136358 ?auto_136363 ) ) ( not ( = ?auto_136360 ?auto_136359 ) ) ( OBJ-AT ?auto_136359 ?auto_136363 ) ( TRUCK-AT ?auto_136362 ?auto_136358 ) ( IN-TRUCK ?auto_136360 ?auto_136362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136360 ?auto_136359 ?auto_136358 )
      ( DELIVER-2PKG-VERIFY ?auto_136359 ?auto_136360 ?auto_136358 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136543 - OBJ
      ?auto_136542 - LOCATION
    )
    :vars
    (
      ?auto_136547 - LOCATION
      ?auto_136544 - CITY
      ?auto_136545 - OBJ
      ?auto_136546 - TRUCK
      ?auto_136548 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136547 ?auto_136544 ) ( IN-CITY ?auto_136542 ?auto_136544 ) ( not ( = ?auto_136542 ?auto_136547 ) ) ( not ( = ?auto_136545 ?auto_136543 ) ) ( OBJ-AT ?auto_136543 ?auto_136547 ) ( IN-TRUCK ?auto_136545 ?auto_136546 ) ( TRUCK-AT ?auto_136546 ?auto_136548 ) ( IN-CITY ?auto_136548 ?auto_136544 ) ( not ( = ?auto_136542 ?auto_136548 ) ) ( not ( = ?auto_136547 ?auto_136548 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136546 ?auto_136548 ?auto_136542 ?auto_136544 )
      ( DELIVER-2PKG ?auto_136545 ?auto_136543 ?auto_136542 )
      ( DELIVER-1PKG-VERIFY ?auto_136543 ?auto_136542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136550 - OBJ
      ?auto_136551 - OBJ
      ?auto_136549 - LOCATION
    )
    :vars
    (
      ?auto_136553 - LOCATION
      ?auto_136552 - CITY
      ?auto_136554 - TRUCK
      ?auto_136555 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136553 ?auto_136552 ) ( IN-CITY ?auto_136549 ?auto_136552 ) ( not ( = ?auto_136549 ?auto_136553 ) ) ( not ( = ?auto_136550 ?auto_136551 ) ) ( OBJ-AT ?auto_136551 ?auto_136553 ) ( IN-TRUCK ?auto_136550 ?auto_136554 ) ( TRUCK-AT ?auto_136554 ?auto_136555 ) ( IN-CITY ?auto_136555 ?auto_136552 ) ( not ( = ?auto_136549 ?auto_136555 ) ) ( not ( = ?auto_136553 ?auto_136555 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136551 ?auto_136549 )
      ( DELIVER-2PKG-VERIFY ?auto_136550 ?auto_136551 ?auto_136549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136557 - OBJ
      ?auto_136558 - OBJ
      ?auto_136556 - LOCATION
    )
    :vars
    (
      ?auto_136560 - LOCATION
      ?auto_136562 - CITY
      ?auto_136559 - TRUCK
      ?auto_136561 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136560 ?auto_136562 ) ( IN-CITY ?auto_136556 ?auto_136562 ) ( not ( = ?auto_136556 ?auto_136560 ) ) ( not ( = ?auto_136558 ?auto_136557 ) ) ( OBJ-AT ?auto_136557 ?auto_136560 ) ( IN-TRUCK ?auto_136558 ?auto_136559 ) ( TRUCK-AT ?auto_136559 ?auto_136561 ) ( IN-CITY ?auto_136561 ?auto_136562 ) ( not ( = ?auto_136556 ?auto_136561 ) ) ( not ( = ?auto_136560 ?auto_136561 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136558 ?auto_136557 ?auto_136556 )
      ( DELIVER-2PKG-VERIFY ?auto_136557 ?auto_136558 ?auto_136556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136765 - OBJ
      ?auto_136764 - LOCATION
    )
    :vars
    (
      ?auto_136767 - LOCATION
      ?auto_136770 - CITY
      ?auto_136768 - OBJ
      ?auto_136766 - TRUCK
      ?auto_136769 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136767 ?auto_136770 ) ( IN-CITY ?auto_136764 ?auto_136770 ) ( not ( = ?auto_136764 ?auto_136767 ) ) ( not ( = ?auto_136768 ?auto_136765 ) ) ( OBJ-AT ?auto_136765 ?auto_136767 ) ( TRUCK-AT ?auto_136766 ?auto_136769 ) ( IN-CITY ?auto_136769 ?auto_136770 ) ( not ( = ?auto_136764 ?auto_136769 ) ) ( not ( = ?auto_136767 ?auto_136769 ) ) ( OBJ-AT ?auto_136768 ?auto_136769 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136768 ?auto_136766 ?auto_136769 )
      ( DELIVER-2PKG ?auto_136768 ?auto_136765 ?auto_136764 )
      ( DELIVER-1PKG-VERIFY ?auto_136765 ?auto_136764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136772 - OBJ
      ?auto_136773 - OBJ
      ?auto_136771 - LOCATION
    )
    :vars
    (
      ?auto_136776 - LOCATION
      ?auto_136774 - CITY
      ?auto_136775 - TRUCK
      ?auto_136777 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136776 ?auto_136774 ) ( IN-CITY ?auto_136771 ?auto_136774 ) ( not ( = ?auto_136771 ?auto_136776 ) ) ( not ( = ?auto_136772 ?auto_136773 ) ) ( OBJ-AT ?auto_136773 ?auto_136776 ) ( TRUCK-AT ?auto_136775 ?auto_136777 ) ( IN-CITY ?auto_136777 ?auto_136774 ) ( not ( = ?auto_136771 ?auto_136777 ) ) ( not ( = ?auto_136776 ?auto_136777 ) ) ( OBJ-AT ?auto_136772 ?auto_136777 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136773 ?auto_136771 )
      ( DELIVER-2PKG-VERIFY ?auto_136772 ?auto_136773 ?auto_136771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136779 - OBJ
      ?auto_136780 - OBJ
      ?auto_136778 - LOCATION
    )
    :vars
    (
      ?auto_136782 - LOCATION
      ?auto_136781 - CITY
      ?auto_136784 - TRUCK
      ?auto_136783 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_136782 ?auto_136781 ) ( IN-CITY ?auto_136778 ?auto_136781 ) ( not ( = ?auto_136778 ?auto_136782 ) ) ( not ( = ?auto_136780 ?auto_136779 ) ) ( OBJ-AT ?auto_136779 ?auto_136782 ) ( TRUCK-AT ?auto_136784 ?auto_136783 ) ( IN-CITY ?auto_136783 ?auto_136781 ) ( not ( = ?auto_136778 ?auto_136783 ) ) ( not ( = ?auto_136782 ?auto_136783 ) ) ( OBJ-AT ?auto_136780 ?auto_136783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136780 ?auto_136779 ?auto_136778 )
      ( DELIVER-2PKG-VERIFY ?auto_136779 ?auto_136780 ?auto_136778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138124 - OBJ
      ?auto_138125 - OBJ
      ?auto_138126 - OBJ
      ?auto_138123 - LOCATION
    )
    :vars
    (
      ?auto_138128 - TRUCK
      ?auto_138129 - LOCATION
      ?auto_138127 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138126 ?auto_138128 ) ( TRUCK-AT ?auto_138128 ?auto_138129 ) ( IN-CITY ?auto_138129 ?auto_138127 ) ( IN-CITY ?auto_138123 ?auto_138127 ) ( not ( = ?auto_138123 ?auto_138129 ) ) ( OBJ-AT ?auto_138125 ?auto_138123 ) ( not ( = ?auto_138125 ?auto_138126 ) ) ( OBJ-AT ?auto_138124 ?auto_138123 ) ( not ( = ?auto_138124 ?auto_138125 ) ) ( not ( = ?auto_138124 ?auto_138126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138125 ?auto_138126 ?auto_138123 )
      ( DELIVER-3PKG-VERIFY ?auto_138124 ?auto_138125 ?auto_138126 ?auto_138123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138135 - OBJ
      ?auto_138136 - OBJ
      ?auto_138137 - OBJ
      ?auto_138134 - LOCATION
    )
    :vars
    (
      ?auto_138139 - TRUCK
      ?auto_138140 - LOCATION
      ?auto_138138 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138136 ?auto_138139 ) ( TRUCK-AT ?auto_138139 ?auto_138140 ) ( IN-CITY ?auto_138140 ?auto_138138 ) ( IN-CITY ?auto_138134 ?auto_138138 ) ( not ( = ?auto_138134 ?auto_138140 ) ) ( OBJ-AT ?auto_138135 ?auto_138134 ) ( not ( = ?auto_138135 ?auto_138136 ) ) ( OBJ-AT ?auto_138137 ?auto_138134 ) ( not ( = ?auto_138135 ?auto_138137 ) ) ( not ( = ?auto_138136 ?auto_138137 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138135 ?auto_138136 ?auto_138134 )
      ( DELIVER-3PKG-VERIFY ?auto_138135 ?auto_138136 ?auto_138137 ?auto_138134 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138157 - OBJ
      ?auto_138158 - OBJ
      ?auto_138159 - OBJ
      ?auto_138156 - LOCATION
    )
    :vars
    (
      ?auto_138162 - TRUCK
      ?auto_138163 - LOCATION
      ?auto_138160 - CITY
      ?auto_138161 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138159 ?auto_138162 ) ( TRUCK-AT ?auto_138162 ?auto_138163 ) ( IN-CITY ?auto_138163 ?auto_138160 ) ( IN-CITY ?auto_138156 ?auto_138160 ) ( not ( = ?auto_138156 ?auto_138163 ) ) ( OBJ-AT ?auto_138161 ?auto_138156 ) ( not ( = ?auto_138161 ?auto_138159 ) ) ( OBJ-AT ?auto_138157 ?auto_138156 ) ( OBJ-AT ?auto_138158 ?auto_138156 ) ( not ( = ?auto_138157 ?auto_138158 ) ) ( not ( = ?auto_138157 ?auto_138159 ) ) ( not ( = ?auto_138157 ?auto_138161 ) ) ( not ( = ?auto_138158 ?auto_138159 ) ) ( not ( = ?auto_138158 ?auto_138161 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138161 ?auto_138159 ?auto_138156 )
      ( DELIVER-3PKG-VERIFY ?auto_138157 ?auto_138158 ?auto_138159 ?auto_138156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138169 - OBJ
      ?auto_138170 - OBJ
      ?auto_138171 - OBJ
      ?auto_138168 - LOCATION
    )
    :vars
    (
      ?auto_138174 - TRUCK
      ?auto_138175 - LOCATION
      ?auto_138172 - CITY
      ?auto_138173 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138170 ?auto_138174 ) ( TRUCK-AT ?auto_138174 ?auto_138175 ) ( IN-CITY ?auto_138175 ?auto_138172 ) ( IN-CITY ?auto_138168 ?auto_138172 ) ( not ( = ?auto_138168 ?auto_138175 ) ) ( OBJ-AT ?auto_138173 ?auto_138168 ) ( not ( = ?auto_138173 ?auto_138170 ) ) ( OBJ-AT ?auto_138169 ?auto_138168 ) ( OBJ-AT ?auto_138171 ?auto_138168 ) ( not ( = ?auto_138169 ?auto_138170 ) ) ( not ( = ?auto_138169 ?auto_138171 ) ) ( not ( = ?auto_138169 ?auto_138173 ) ) ( not ( = ?auto_138170 ?auto_138171 ) ) ( not ( = ?auto_138171 ?auto_138173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138173 ?auto_138170 ?auto_138168 )
      ( DELIVER-3PKG-VERIFY ?auto_138169 ?auto_138170 ?auto_138171 ?auto_138168 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138207 - OBJ
      ?auto_138208 - OBJ
      ?auto_138209 - OBJ
      ?auto_138206 - LOCATION
    )
    :vars
    (
      ?auto_138212 - TRUCK
      ?auto_138213 - LOCATION
      ?auto_138210 - CITY
      ?auto_138211 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138207 ?auto_138212 ) ( TRUCK-AT ?auto_138212 ?auto_138213 ) ( IN-CITY ?auto_138213 ?auto_138210 ) ( IN-CITY ?auto_138206 ?auto_138210 ) ( not ( = ?auto_138206 ?auto_138213 ) ) ( OBJ-AT ?auto_138211 ?auto_138206 ) ( not ( = ?auto_138211 ?auto_138207 ) ) ( OBJ-AT ?auto_138208 ?auto_138206 ) ( OBJ-AT ?auto_138209 ?auto_138206 ) ( not ( = ?auto_138207 ?auto_138208 ) ) ( not ( = ?auto_138207 ?auto_138209 ) ) ( not ( = ?auto_138208 ?auto_138209 ) ) ( not ( = ?auto_138208 ?auto_138211 ) ) ( not ( = ?auto_138209 ?auto_138211 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138211 ?auto_138207 ?auto_138206 )
      ( DELIVER-3PKG-VERIFY ?auto_138207 ?auto_138208 ?auto_138209 ?auto_138206 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138246 - OBJ
      ?auto_138247 - OBJ
      ?auto_138248 - OBJ
      ?auto_138249 - OBJ
      ?auto_138245 - LOCATION
    )
    :vars
    (
      ?auto_138251 - TRUCK
      ?auto_138252 - LOCATION
      ?auto_138250 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138249 ?auto_138251 ) ( TRUCK-AT ?auto_138251 ?auto_138252 ) ( IN-CITY ?auto_138252 ?auto_138250 ) ( IN-CITY ?auto_138245 ?auto_138250 ) ( not ( = ?auto_138245 ?auto_138252 ) ) ( OBJ-AT ?auto_138248 ?auto_138245 ) ( not ( = ?auto_138248 ?auto_138249 ) ) ( OBJ-AT ?auto_138246 ?auto_138245 ) ( OBJ-AT ?auto_138247 ?auto_138245 ) ( not ( = ?auto_138246 ?auto_138247 ) ) ( not ( = ?auto_138246 ?auto_138248 ) ) ( not ( = ?auto_138246 ?auto_138249 ) ) ( not ( = ?auto_138247 ?auto_138248 ) ) ( not ( = ?auto_138247 ?auto_138249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138248 ?auto_138249 ?auto_138245 )
      ( DELIVER-4PKG-VERIFY ?auto_138246 ?auto_138247 ?auto_138248 ?auto_138249 ?auto_138245 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138254 - OBJ
      ?auto_138255 - OBJ
      ?auto_138256 - OBJ
      ?auto_138257 - OBJ
      ?auto_138253 - LOCATION
    )
    :vars
    (
      ?auto_138259 - TRUCK
      ?auto_138260 - LOCATION
      ?auto_138258 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138257 ?auto_138259 ) ( TRUCK-AT ?auto_138259 ?auto_138260 ) ( IN-CITY ?auto_138260 ?auto_138258 ) ( IN-CITY ?auto_138253 ?auto_138258 ) ( not ( = ?auto_138253 ?auto_138260 ) ) ( OBJ-AT ?auto_138254 ?auto_138253 ) ( not ( = ?auto_138254 ?auto_138257 ) ) ( OBJ-AT ?auto_138255 ?auto_138253 ) ( OBJ-AT ?auto_138256 ?auto_138253 ) ( not ( = ?auto_138254 ?auto_138255 ) ) ( not ( = ?auto_138254 ?auto_138256 ) ) ( not ( = ?auto_138255 ?auto_138256 ) ) ( not ( = ?auto_138255 ?auto_138257 ) ) ( not ( = ?auto_138256 ?auto_138257 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138254 ?auto_138257 ?auto_138253 )
      ( DELIVER-4PKG-VERIFY ?auto_138254 ?auto_138255 ?auto_138256 ?auto_138257 ?auto_138253 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138270 - OBJ
      ?auto_138271 - OBJ
      ?auto_138272 - OBJ
      ?auto_138273 - OBJ
      ?auto_138269 - LOCATION
    )
    :vars
    (
      ?auto_138275 - TRUCK
      ?auto_138276 - LOCATION
      ?auto_138274 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138272 ?auto_138275 ) ( TRUCK-AT ?auto_138275 ?auto_138276 ) ( IN-CITY ?auto_138276 ?auto_138274 ) ( IN-CITY ?auto_138269 ?auto_138274 ) ( not ( = ?auto_138269 ?auto_138276 ) ) ( OBJ-AT ?auto_138270 ?auto_138269 ) ( not ( = ?auto_138270 ?auto_138272 ) ) ( OBJ-AT ?auto_138271 ?auto_138269 ) ( OBJ-AT ?auto_138273 ?auto_138269 ) ( not ( = ?auto_138270 ?auto_138271 ) ) ( not ( = ?auto_138270 ?auto_138273 ) ) ( not ( = ?auto_138271 ?auto_138272 ) ) ( not ( = ?auto_138271 ?auto_138273 ) ) ( not ( = ?auto_138272 ?auto_138273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138270 ?auto_138272 ?auto_138269 )
      ( DELIVER-4PKG-VERIFY ?auto_138270 ?auto_138271 ?auto_138272 ?auto_138273 ?auto_138269 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138326 - OBJ
      ?auto_138327 - OBJ
      ?auto_138328 - OBJ
      ?auto_138329 - OBJ
      ?auto_138325 - LOCATION
    )
    :vars
    (
      ?auto_138331 - TRUCK
      ?auto_138332 - LOCATION
      ?auto_138330 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138327 ?auto_138331 ) ( TRUCK-AT ?auto_138331 ?auto_138332 ) ( IN-CITY ?auto_138332 ?auto_138330 ) ( IN-CITY ?auto_138325 ?auto_138330 ) ( not ( = ?auto_138325 ?auto_138332 ) ) ( OBJ-AT ?auto_138328 ?auto_138325 ) ( not ( = ?auto_138328 ?auto_138327 ) ) ( OBJ-AT ?auto_138326 ?auto_138325 ) ( OBJ-AT ?auto_138329 ?auto_138325 ) ( not ( = ?auto_138326 ?auto_138327 ) ) ( not ( = ?auto_138326 ?auto_138328 ) ) ( not ( = ?auto_138326 ?auto_138329 ) ) ( not ( = ?auto_138327 ?auto_138329 ) ) ( not ( = ?auto_138328 ?auto_138329 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138328 ?auto_138327 ?auto_138325 )
      ( DELIVER-4PKG-VERIFY ?auto_138326 ?auto_138327 ?auto_138328 ?auto_138329 ?auto_138325 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138350 - OBJ
      ?auto_138351 - OBJ
      ?auto_138352 - OBJ
      ?auto_138353 - OBJ
      ?auto_138349 - LOCATION
    )
    :vars
    (
      ?auto_138355 - TRUCK
      ?auto_138356 - LOCATION
      ?auto_138354 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138351 ?auto_138355 ) ( TRUCK-AT ?auto_138355 ?auto_138356 ) ( IN-CITY ?auto_138356 ?auto_138354 ) ( IN-CITY ?auto_138349 ?auto_138354 ) ( not ( = ?auto_138349 ?auto_138356 ) ) ( OBJ-AT ?auto_138353 ?auto_138349 ) ( not ( = ?auto_138353 ?auto_138351 ) ) ( OBJ-AT ?auto_138350 ?auto_138349 ) ( OBJ-AT ?auto_138352 ?auto_138349 ) ( not ( = ?auto_138350 ?auto_138351 ) ) ( not ( = ?auto_138350 ?auto_138352 ) ) ( not ( = ?auto_138350 ?auto_138353 ) ) ( not ( = ?auto_138351 ?auto_138352 ) ) ( not ( = ?auto_138352 ?auto_138353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138353 ?auto_138351 ?auto_138349 )
      ( DELIVER-4PKG-VERIFY ?auto_138350 ?auto_138351 ?auto_138352 ?auto_138353 ?auto_138349 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138414 - OBJ
      ?auto_138415 - OBJ
      ?auto_138416 - OBJ
      ?auto_138417 - OBJ
      ?auto_138413 - LOCATION
    )
    :vars
    (
      ?auto_138419 - TRUCK
      ?auto_138420 - LOCATION
      ?auto_138418 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138416 ?auto_138419 ) ( TRUCK-AT ?auto_138419 ?auto_138420 ) ( IN-CITY ?auto_138420 ?auto_138418 ) ( IN-CITY ?auto_138413 ?auto_138418 ) ( not ( = ?auto_138413 ?auto_138420 ) ) ( OBJ-AT ?auto_138415 ?auto_138413 ) ( not ( = ?auto_138415 ?auto_138416 ) ) ( OBJ-AT ?auto_138414 ?auto_138413 ) ( OBJ-AT ?auto_138417 ?auto_138413 ) ( not ( = ?auto_138414 ?auto_138415 ) ) ( not ( = ?auto_138414 ?auto_138416 ) ) ( not ( = ?auto_138414 ?auto_138417 ) ) ( not ( = ?auto_138415 ?auto_138417 ) ) ( not ( = ?auto_138416 ?auto_138417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138415 ?auto_138416 ?auto_138413 )
      ( DELIVER-4PKG-VERIFY ?auto_138414 ?auto_138415 ?auto_138416 ?auto_138417 ?auto_138413 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138446 - OBJ
      ?auto_138447 - OBJ
      ?auto_138448 - OBJ
      ?auto_138449 - OBJ
      ?auto_138445 - LOCATION
    )
    :vars
    (
      ?auto_138452 - TRUCK
      ?auto_138453 - LOCATION
      ?auto_138450 - CITY
      ?auto_138451 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138449 ?auto_138452 ) ( TRUCK-AT ?auto_138452 ?auto_138453 ) ( IN-CITY ?auto_138453 ?auto_138450 ) ( IN-CITY ?auto_138445 ?auto_138450 ) ( not ( = ?auto_138445 ?auto_138453 ) ) ( OBJ-AT ?auto_138451 ?auto_138445 ) ( not ( = ?auto_138451 ?auto_138449 ) ) ( OBJ-AT ?auto_138446 ?auto_138445 ) ( OBJ-AT ?auto_138447 ?auto_138445 ) ( OBJ-AT ?auto_138448 ?auto_138445 ) ( not ( = ?auto_138446 ?auto_138447 ) ) ( not ( = ?auto_138446 ?auto_138448 ) ) ( not ( = ?auto_138446 ?auto_138449 ) ) ( not ( = ?auto_138446 ?auto_138451 ) ) ( not ( = ?auto_138447 ?auto_138448 ) ) ( not ( = ?auto_138447 ?auto_138449 ) ) ( not ( = ?auto_138447 ?auto_138451 ) ) ( not ( = ?auto_138448 ?auto_138449 ) ) ( not ( = ?auto_138448 ?auto_138451 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138451 ?auto_138449 ?auto_138445 )
      ( DELIVER-4PKG-VERIFY ?auto_138446 ?auto_138447 ?auto_138448 ?auto_138449 ?auto_138445 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138463 - OBJ
      ?auto_138464 - OBJ
      ?auto_138465 - OBJ
      ?auto_138466 - OBJ
      ?auto_138462 - LOCATION
    )
    :vars
    (
      ?auto_138469 - TRUCK
      ?auto_138470 - LOCATION
      ?auto_138467 - CITY
      ?auto_138468 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138465 ?auto_138469 ) ( TRUCK-AT ?auto_138469 ?auto_138470 ) ( IN-CITY ?auto_138470 ?auto_138467 ) ( IN-CITY ?auto_138462 ?auto_138467 ) ( not ( = ?auto_138462 ?auto_138470 ) ) ( OBJ-AT ?auto_138468 ?auto_138462 ) ( not ( = ?auto_138468 ?auto_138465 ) ) ( OBJ-AT ?auto_138463 ?auto_138462 ) ( OBJ-AT ?auto_138464 ?auto_138462 ) ( OBJ-AT ?auto_138466 ?auto_138462 ) ( not ( = ?auto_138463 ?auto_138464 ) ) ( not ( = ?auto_138463 ?auto_138465 ) ) ( not ( = ?auto_138463 ?auto_138466 ) ) ( not ( = ?auto_138463 ?auto_138468 ) ) ( not ( = ?auto_138464 ?auto_138465 ) ) ( not ( = ?auto_138464 ?auto_138466 ) ) ( not ( = ?auto_138464 ?auto_138468 ) ) ( not ( = ?auto_138465 ?auto_138466 ) ) ( not ( = ?auto_138466 ?auto_138468 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138468 ?auto_138465 ?auto_138462 )
      ( DELIVER-4PKG-VERIFY ?auto_138463 ?auto_138464 ?auto_138465 ?auto_138466 ?auto_138462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138513 - OBJ
      ?auto_138514 - OBJ
      ?auto_138515 - OBJ
      ?auto_138516 - OBJ
      ?auto_138512 - LOCATION
    )
    :vars
    (
      ?auto_138519 - TRUCK
      ?auto_138520 - LOCATION
      ?auto_138517 - CITY
      ?auto_138518 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138514 ?auto_138519 ) ( TRUCK-AT ?auto_138519 ?auto_138520 ) ( IN-CITY ?auto_138520 ?auto_138517 ) ( IN-CITY ?auto_138512 ?auto_138517 ) ( not ( = ?auto_138512 ?auto_138520 ) ) ( OBJ-AT ?auto_138518 ?auto_138512 ) ( not ( = ?auto_138518 ?auto_138514 ) ) ( OBJ-AT ?auto_138513 ?auto_138512 ) ( OBJ-AT ?auto_138515 ?auto_138512 ) ( OBJ-AT ?auto_138516 ?auto_138512 ) ( not ( = ?auto_138513 ?auto_138514 ) ) ( not ( = ?auto_138513 ?auto_138515 ) ) ( not ( = ?auto_138513 ?auto_138516 ) ) ( not ( = ?auto_138513 ?auto_138518 ) ) ( not ( = ?auto_138514 ?auto_138515 ) ) ( not ( = ?auto_138514 ?auto_138516 ) ) ( not ( = ?auto_138515 ?auto_138516 ) ) ( not ( = ?auto_138515 ?auto_138518 ) ) ( not ( = ?auto_138516 ?auto_138518 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138518 ?auto_138514 ?auto_138512 )
      ( DELIVER-4PKG-VERIFY ?auto_138513 ?auto_138514 ?auto_138515 ?auto_138516 ?auto_138512 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138565 - OBJ
      ?auto_138566 - OBJ
      ?auto_138567 - OBJ
      ?auto_138568 - OBJ
      ?auto_138564 - LOCATION
    )
    :vars
    (
      ?auto_138570 - TRUCK
      ?auto_138571 - LOCATION
      ?auto_138569 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138565 ?auto_138570 ) ( TRUCK-AT ?auto_138570 ?auto_138571 ) ( IN-CITY ?auto_138571 ?auto_138569 ) ( IN-CITY ?auto_138564 ?auto_138569 ) ( not ( = ?auto_138564 ?auto_138571 ) ) ( OBJ-AT ?auto_138566 ?auto_138564 ) ( not ( = ?auto_138566 ?auto_138565 ) ) ( OBJ-AT ?auto_138567 ?auto_138564 ) ( OBJ-AT ?auto_138568 ?auto_138564 ) ( not ( = ?auto_138565 ?auto_138567 ) ) ( not ( = ?auto_138565 ?auto_138568 ) ) ( not ( = ?auto_138566 ?auto_138567 ) ) ( not ( = ?auto_138566 ?auto_138568 ) ) ( not ( = ?auto_138567 ?auto_138568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138566 ?auto_138565 ?auto_138564 )
      ( DELIVER-4PKG-VERIFY ?auto_138565 ?auto_138566 ?auto_138567 ?auto_138568 ?auto_138564 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138653 - OBJ
      ?auto_138654 - OBJ
      ?auto_138655 - OBJ
      ?auto_138656 - OBJ
      ?auto_138652 - LOCATION
    )
    :vars
    (
      ?auto_138658 - TRUCK
      ?auto_138659 - LOCATION
      ?auto_138657 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138653 ?auto_138658 ) ( TRUCK-AT ?auto_138658 ?auto_138659 ) ( IN-CITY ?auto_138659 ?auto_138657 ) ( IN-CITY ?auto_138652 ?auto_138657 ) ( not ( = ?auto_138652 ?auto_138659 ) ) ( OBJ-AT ?auto_138656 ?auto_138652 ) ( not ( = ?auto_138656 ?auto_138653 ) ) ( OBJ-AT ?auto_138654 ?auto_138652 ) ( OBJ-AT ?auto_138655 ?auto_138652 ) ( not ( = ?auto_138653 ?auto_138654 ) ) ( not ( = ?auto_138653 ?auto_138655 ) ) ( not ( = ?auto_138654 ?auto_138655 ) ) ( not ( = ?auto_138654 ?auto_138656 ) ) ( not ( = ?auto_138655 ?auto_138656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138656 ?auto_138653 ?auto_138652 )
      ( DELIVER-4PKG-VERIFY ?auto_138653 ?auto_138654 ?auto_138655 ?auto_138656 ?auto_138652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138661 - OBJ
      ?auto_138662 - OBJ
      ?auto_138663 - OBJ
      ?auto_138664 - OBJ
      ?auto_138660 - LOCATION
    )
    :vars
    (
      ?auto_138667 - TRUCK
      ?auto_138668 - LOCATION
      ?auto_138665 - CITY
      ?auto_138666 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_138661 ?auto_138667 ) ( TRUCK-AT ?auto_138667 ?auto_138668 ) ( IN-CITY ?auto_138668 ?auto_138665 ) ( IN-CITY ?auto_138660 ?auto_138665 ) ( not ( = ?auto_138660 ?auto_138668 ) ) ( OBJ-AT ?auto_138666 ?auto_138660 ) ( not ( = ?auto_138666 ?auto_138661 ) ) ( OBJ-AT ?auto_138662 ?auto_138660 ) ( OBJ-AT ?auto_138663 ?auto_138660 ) ( OBJ-AT ?auto_138664 ?auto_138660 ) ( not ( = ?auto_138661 ?auto_138662 ) ) ( not ( = ?auto_138661 ?auto_138663 ) ) ( not ( = ?auto_138661 ?auto_138664 ) ) ( not ( = ?auto_138662 ?auto_138663 ) ) ( not ( = ?auto_138662 ?auto_138664 ) ) ( not ( = ?auto_138662 ?auto_138666 ) ) ( not ( = ?auto_138663 ?auto_138664 ) ) ( not ( = ?auto_138663 ?auto_138666 ) ) ( not ( = ?auto_138664 ?auto_138666 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138666 ?auto_138661 ?auto_138660 )
      ( DELIVER-4PKG-VERIFY ?auto_138661 ?auto_138662 ?auto_138663 ?auto_138664 ?auto_138660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138823 - OBJ
      ?auto_138824 - OBJ
      ?auto_138825 - OBJ
      ?auto_138822 - LOCATION
    )
    :vars
    (
      ?auto_138828 - TRUCK
      ?auto_138827 - LOCATION
      ?auto_138826 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138828 ?auto_138827 ) ( IN-CITY ?auto_138827 ?auto_138826 ) ( IN-CITY ?auto_138822 ?auto_138826 ) ( not ( = ?auto_138822 ?auto_138827 ) ) ( OBJ-AT ?auto_138823 ?auto_138822 ) ( not ( = ?auto_138823 ?auto_138824 ) ) ( OBJ-AT ?auto_138824 ?auto_138827 ) ( OBJ-AT ?auto_138825 ?auto_138822 ) ( not ( = ?auto_138823 ?auto_138825 ) ) ( not ( = ?auto_138824 ?auto_138825 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138823 ?auto_138824 ?auto_138822 )
      ( DELIVER-3PKG-VERIFY ?auto_138823 ?auto_138824 ?auto_138825 ?auto_138822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138845 - OBJ
      ?auto_138846 - OBJ
      ?auto_138847 - OBJ
      ?auto_138844 - LOCATION
    )
    :vars
    (
      ?auto_138850 - TRUCK
      ?auto_138849 - LOCATION
      ?auto_138848 - CITY
      ?auto_138851 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138850 ?auto_138849 ) ( IN-CITY ?auto_138849 ?auto_138848 ) ( IN-CITY ?auto_138844 ?auto_138848 ) ( not ( = ?auto_138844 ?auto_138849 ) ) ( OBJ-AT ?auto_138851 ?auto_138844 ) ( not ( = ?auto_138851 ?auto_138847 ) ) ( OBJ-AT ?auto_138847 ?auto_138849 ) ( OBJ-AT ?auto_138845 ?auto_138844 ) ( OBJ-AT ?auto_138846 ?auto_138844 ) ( not ( = ?auto_138845 ?auto_138846 ) ) ( not ( = ?auto_138845 ?auto_138847 ) ) ( not ( = ?auto_138845 ?auto_138851 ) ) ( not ( = ?auto_138846 ?auto_138847 ) ) ( not ( = ?auto_138846 ?auto_138851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138851 ?auto_138847 ?auto_138844 )
      ( DELIVER-3PKG-VERIFY ?auto_138845 ?auto_138846 ?auto_138847 ?auto_138844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138857 - OBJ
      ?auto_138858 - OBJ
      ?auto_138859 - OBJ
      ?auto_138856 - LOCATION
    )
    :vars
    (
      ?auto_138862 - TRUCK
      ?auto_138861 - LOCATION
      ?auto_138860 - CITY
      ?auto_138863 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138862 ?auto_138861 ) ( IN-CITY ?auto_138861 ?auto_138860 ) ( IN-CITY ?auto_138856 ?auto_138860 ) ( not ( = ?auto_138856 ?auto_138861 ) ) ( OBJ-AT ?auto_138863 ?auto_138856 ) ( not ( = ?auto_138863 ?auto_138858 ) ) ( OBJ-AT ?auto_138858 ?auto_138861 ) ( OBJ-AT ?auto_138857 ?auto_138856 ) ( OBJ-AT ?auto_138859 ?auto_138856 ) ( not ( = ?auto_138857 ?auto_138858 ) ) ( not ( = ?auto_138857 ?auto_138859 ) ) ( not ( = ?auto_138857 ?auto_138863 ) ) ( not ( = ?auto_138858 ?auto_138859 ) ) ( not ( = ?auto_138859 ?auto_138863 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138863 ?auto_138858 ?auto_138856 )
      ( DELIVER-3PKG-VERIFY ?auto_138857 ?auto_138858 ?auto_138859 ?auto_138856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_138895 - OBJ
      ?auto_138896 - OBJ
      ?auto_138897 - OBJ
      ?auto_138894 - LOCATION
    )
    :vars
    (
      ?auto_138900 - TRUCK
      ?auto_138899 - LOCATION
      ?auto_138898 - CITY
      ?auto_138901 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138900 ?auto_138899 ) ( IN-CITY ?auto_138899 ?auto_138898 ) ( IN-CITY ?auto_138894 ?auto_138898 ) ( not ( = ?auto_138894 ?auto_138899 ) ) ( OBJ-AT ?auto_138901 ?auto_138894 ) ( not ( = ?auto_138901 ?auto_138895 ) ) ( OBJ-AT ?auto_138895 ?auto_138899 ) ( OBJ-AT ?auto_138896 ?auto_138894 ) ( OBJ-AT ?auto_138897 ?auto_138894 ) ( not ( = ?auto_138895 ?auto_138896 ) ) ( not ( = ?auto_138895 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138901 ) ) ( not ( = ?auto_138897 ?auto_138901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138901 ?auto_138895 ?auto_138894 )
      ( DELIVER-3PKG-VERIFY ?auto_138895 ?auto_138896 ?auto_138897 ?auto_138894 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138934 - OBJ
      ?auto_138935 - OBJ
      ?auto_138936 - OBJ
      ?auto_138937 - OBJ
      ?auto_138933 - LOCATION
    )
    :vars
    (
      ?auto_138940 - TRUCK
      ?auto_138939 - LOCATION
      ?auto_138938 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138940 ?auto_138939 ) ( IN-CITY ?auto_138939 ?auto_138938 ) ( IN-CITY ?auto_138933 ?auto_138938 ) ( not ( = ?auto_138933 ?auto_138939 ) ) ( OBJ-AT ?auto_138936 ?auto_138933 ) ( not ( = ?auto_138936 ?auto_138937 ) ) ( OBJ-AT ?auto_138937 ?auto_138939 ) ( OBJ-AT ?auto_138934 ?auto_138933 ) ( OBJ-AT ?auto_138935 ?auto_138933 ) ( not ( = ?auto_138934 ?auto_138935 ) ) ( not ( = ?auto_138934 ?auto_138936 ) ) ( not ( = ?auto_138934 ?auto_138937 ) ) ( not ( = ?auto_138935 ?auto_138936 ) ) ( not ( = ?auto_138935 ?auto_138937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138936 ?auto_138937 ?auto_138933 )
      ( DELIVER-4PKG-VERIFY ?auto_138934 ?auto_138935 ?auto_138936 ?auto_138937 ?auto_138933 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138942 - OBJ
      ?auto_138943 - OBJ
      ?auto_138944 - OBJ
      ?auto_138945 - OBJ
      ?auto_138941 - LOCATION
    )
    :vars
    (
      ?auto_138948 - TRUCK
      ?auto_138947 - LOCATION
      ?auto_138946 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138948 ?auto_138947 ) ( IN-CITY ?auto_138947 ?auto_138946 ) ( IN-CITY ?auto_138941 ?auto_138946 ) ( not ( = ?auto_138941 ?auto_138947 ) ) ( OBJ-AT ?auto_138942 ?auto_138941 ) ( not ( = ?auto_138942 ?auto_138945 ) ) ( OBJ-AT ?auto_138945 ?auto_138947 ) ( OBJ-AT ?auto_138943 ?auto_138941 ) ( OBJ-AT ?auto_138944 ?auto_138941 ) ( not ( = ?auto_138942 ?auto_138943 ) ) ( not ( = ?auto_138942 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138945 ) ) ( not ( = ?auto_138944 ?auto_138945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138942 ?auto_138945 ?auto_138941 )
      ( DELIVER-4PKG-VERIFY ?auto_138942 ?auto_138943 ?auto_138944 ?auto_138945 ?auto_138941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_138958 - OBJ
      ?auto_138959 - OBJ
      ?auto_138960 - OBJ
      ?auto_138961 - OBJ
      ?auto_138957 - LOCATION
    )
    :vars
    (
      ?auto_138964 - TRUCK
      ?auto_138963 - LOCATION
      ?auto_138962 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_138964 ?auto_138963 ) ( IN-CITY ?auto_138963 ?auto_138962 ) ( IN-CITY ?auto_138957 ?auto_138962 ) ( not ( = ?auto_138957 ?auto_138963 ) ) ( OBJ-AT ?auto_138958 ?auto_138957 ) ( not ( = ?auto_138958 ?auto_138960 ) ) ( OBJ-AT ?auto_138960 ?auto_138963 ) ( OBJ-AT ?auto_138959 ?auto_138957 ) ( OBJ-AT ?auto_138961 ?auto_138957 ) ( not ( = ?auto_138958 ?auto_138959 ) ) ( not ( = ?auto_138958 ?auto_138961 ) ) ( not ( = ?auto_138959 ?auto_138960 ) ) ( not ( = ?auto_138959 ?auto_138961 ) ) ( not ( = ?auto_138960 ?auto_138961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_138958 ?auto_138960 ?auto_138957 )
      ( DELIVER-4PKG-VERIFY ?auto_138958 ?auto_138959 ?auto_138960 ?auto_138961 ?auto_138957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139022 - OBJ
      ?auto_139023 - OBJ
      ?auto_139024 - OBJ
      ?auto_139025 - OBJ
      ?auto_139021 - LOCATION
    )
    :vars
    (
      ?auto_139028 - TRUCK
      ?auto_139027 - LOCATION
      ?auto_139026 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139028 ?auto_139027 ) ( IN-CITY ?auto_139027 ?auto_139026 ) ( IN-CITY ?auto_139021 ?auto_139026 ) ( not ( = ?auto_139021 ?auto_139027 ) ) ( OBJ-AT ?auto_139022 ?auto_139021 ) ( not ( = ?auto_139022 ?auto_139023 ) ) ( OBJ-AT ?auto_139023 ?auto_139027 ) ( OBJ-AT ?auto_139024 ?auto_139021 ) ( OBJ-AT ?auto_139025 ?auto_139021 ) ( not ( = ?auto_139022 ?auto_139024 ) ) ( not ( = ?auto_139022 ?auto_139025 ) ) ( not ( = ?auto_139023 ?auto_139024 ) ) ( not ( = ?auto_139023 ?auto_139025 ) ) ( not ( = ?auto_139024 ?auto_139025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139022 ?auto_139023 ?auto_139021 )
      ( DELIVER-4PKG-VERIFY ?auto_139022 ?auto_139023 ?auto_139024 ?auto_139025 ?auto_139021 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139102 - OBJ
      ?auto_139103 - OBJ
      ?auto_139104 - OBJ
      ?auto_139105 - OBJ
      ?auto_139101 - LOCATION
    )
    :vars
    (
      ?auto_139108 - TRUCK
      ?auto_139107 - LOCATION
      ?auto_139106 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139108 ?auto_139107 ) ( IN-CITY ?auto_139107 ?auto_139106 ) ( IN-CITY ?auto_139101 ?auto_139106 ) ( not ( = ?auto_139101 ?auto_139107 ) ) ( OBJ-AT ?auto_139103 ?auto_139101 ) ( not ( = ?auto_139103 ?auto_139104 ) ) ( OBJ-AT ?auto_139104 ?auto_139107 ) ( OBJ-AT ?auto_139102 ?auto_139101 ) ( OBJ-AT ?auto_139105 ?auto_139101 ) ( not ( = ?auto_139102 ?auto_139103 ) ) ( not ( = ?auto_139102 ?auto_139104 ) ) ( not ( = ?auto_139102 ?auto_139105 ) ) ( not ( = ?auto_139103 ?auto_139105 ) ) ( not ( = ?auto_139104 ?auto_139105 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139103 ?auto_139104 ?auto_139101 )
      ( DELIVER-4PKG-VERIFY ?auto_139102 ?auto_139103 ?auto_139104 ?auto_139105 ?auto_139101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139134 - OBJ
      ?auto_139135 - OBJ
      ?auto_139136 - OBJ
      ?auto_139137 - OBJ
      ?auto_139133 - LOCATION
    )
    :vars
    (
      ?auto_139140 - TRUCK
      ?auto_139139 - LOCATION
      ?auto_139138 - CITY
      ?auto_139141 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139140 ?auto_139139 ) ( IN-CITY ?auto_139139 ?auto_139138 ) ( IN-CITY ?auto_139133 ?auto_139138 ) ( not ( = ?auto_139133 ?auto_139139 ) ) ( OBJ-AT ?auto_139141 ?auto_139133 ) ( not ( = ?auto_139141 ?auto_139137 ) ) ( OBJ-AT ?auto_139137 ?auto_139139 ) ( OBJ-AT ?auto_139134 ?auto_139133 ) ( OBJ-AT ?auto_139135 ?auto_139133 ) ( OBJ-AT ?auto_139136 ?auto_139133 ) ( not ( = ?auto_139134 ?auto_139135 ) ) ( not ( = ?auto_139134 ?auto_139136 ) ) ( not ( = ?auto_139134 ?auto_139137 ) ) ( not ( = ?auto_139134 ?auto_139141 ) ) ( not ( = ?auto_139135 ?auto_139136 ) ) ( not ( = ?auto_139135 ?auto_139137 ) ) ( not ( = ?auto_139135 ?auto_139141 ) ) ( not ( = ?auto_139136 ?auto_139137 ) ) ( not ( = ?auto_139136 ?auto_139141 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139141 ?auto_139137 ?auto_139133 )
      ( DELIVER-4PKG-VERIFY ?auto_139134 ?auto_139135 ?auto_139136 ?auto_139137 ?auto_139133 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139151 - OBJ
      ?auto_139152 - OBJ
      ?auto_139153 - OBJ
      ?auto_139154 - OBJ
      ?auto_139150 - LOCATION
    )
    :vars
    (
      ?auto_139157 - TRUCK
      ?auto_139156 - LOCATION
      ?auto_139155 - CITY
      ?auto_139158 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139157 ?auto_139156 ) ( IN-CITY ?auto_139156 ?auto_139155 ) ( IN-CITY ?auto_139150 ?auto_139155 ) ( not ( = ?auto_139150 ?auto_139156 ) ) ( OBJ-AT ?auto_139158 ?auto_139150 ) ( not ( = ?auto_139158 ?auto_139153 ) ) ( OBJ-AT ?auto_139153 ?auto_139156 ) ( OBJ-AT ?auto_139151 ?auto_139150 ) ( OBJ-AT ?auto_139152 ?auto_139150 ) ( OBJ-AT ?auto_139154 ?auto_139150 ) ( not ( = ?auto_139151 ?auto_139152 ) ) ( not ( = ?auto_139151 ?auto_139153 ) ) ( not ( = ?auto_139151 ?auto_139154 ) ) ( not ( = ?auto_139151 ?auto_139158 ) ) ( not ( = ?auto_139152 ?auto_139153 ) ) ( not ( = ?auto_139152 ?auto_139154 ) ) ( not ( = ?auto_139152 ?auto_139158 ) ) ( not ( = ?auto_139153 ?auto_139154 ) ) ( not ( = ?auto_139154 ?auto_139158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139158 ?auto_139153 ?auto_139150 )
      ( DELIVER-4PKG-VERIFY ?auto_139151 ?auto_139152 ?auto_139153 ?auto_139154 ?auto_139150 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139177 - OBJ
      ?auto_139178 - OBJ
      ?auto_139179 - OBJ
      ?auto_139180 - OBJ
      ?auto_139176 - LOCATION
    )
    :vars
    (
      ?auto_139183 - TRUCK
      ?auto_139182 - LOCATION
      ?auto_139181 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139183 ?auto_139182 ) ( IN-CITY ?auto_139182 ?auto_139181 ) ( IN-CITY ?auto_139176 ?auto_139181 ) ( not ( = ?auto_139176 ?auto_139182 ) ) ( OBJ-AT ?auto_139179 ?auto_139176 ) ( not ( = ?auto_139179 ?auto_139178 ) ) ( OBJ-AT ?auto_139178 ?auto_139182 ) ( OBJ-AT ?auto_139177 ?auto_139176 ) ( OBJ-AT ?auto_139180 ?auto_139176 ) ( not ( = ?auto_139177 ?auto_139178 ) ) ( not ( = ?auto_139177 ?auto_139179 ) ) ( not ( = ?auto_139177 ?auto_139180 ) ) ( not ( = ?auto_139178 ?auto_139180 ) ) ( not ( = ?auto_139179 ?auto_139180 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139179 ?auto_139178 ?auto_139176 )
      ( DELIVER-4PKG-VERIFY ?auto_139177 ?auto_139178 ?auto_139179 ?auto_139180 ?auto_139176 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139201 - OBJ
      ?auto_139202 - OBJ
      ?auto_139203 - OBJ
      ?auto_139204 - OBJ
      ?auto_139200 - LOCATION
    )
    :vars
    (
      ?auto_139207 - TRUCK
      ?auto_139206 - LOCATION
      ?auto_139205 - CITY
      ?auto_139208 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139207 ?auto_139206 ) ( IN-CITY ?auto_139206 ?auto_139205 ) ( IN-CITY ?auto_139200 ?auto_139205 ) ( not ( = ?auto_139200 ?auto_139206 ) ) ( OBJ-AT ?auto_139208 ?auto_139200 ) ( not ( = ?auto_139208 ?auto_139202 ) ) ( OBJ-AT ?auto_139202 ?auto_139206 ) ( OBJ-AT ?auto_139201 ?auto_139200 ) ( OBJ-AT ?auto_139203 ?auto_139200 ) ( OBJ-AT ?auto_139204 ?auto_139200 ) ( not ( = ?auto_139201 ?auto_139202 ) ) ( not ( = ?auto_139201 ?auto_139203 ) ) ( not ( = ?auto_139201 ?auto_139204 ) ) ( not ( = ?auto_139201 ?auto_139208 ) ) ( not ( = ?auto_139202 ?auto_139203 ) ) ( not ( = ?auto_139202 ?auto_139204 ) ) ( not ( = ?auto_139203 ?auto_139204 ) ) ( not ( = ?auto_139203 ?auto_139208 ) ) ( not ( = ?auto_139204 ?auto_139208 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139208 ?auto_139202 ?auto_139200 )
      ( DELIVER-4PKG-VERIFY ?auto_139201 ?auto_139202 ?auto_139203 ?auto_139204 ?auto_139200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139245 - OBJ
      ?auto_139246 - OBJ
      ?auto_139247 - OBJ
      ?auto_139248 - OBJ
      ?auto_139244 - LOCATION
    )
    :vars
    (
      ?auto_139251 - TRUCK
      ?auto_139250 - LOCATION
      ?auto_139249 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139251 ?auto_139250 ) ( IN-CITY ?auto_139250 ?auto_139249 ) ( IN-CITY ?auto_139244 ?auto_139249 ) ( not ( = ?auto_139244 ?auto_139250 ) ) ( OBJ-AT ?auto_139248 ?auto_139244 ) ( not ( = ?auto_139248 ?auto_139245 ) ) ( OBJ-AT ?auto_139245 ?auto_139250 ) ( OBJ-AT ?auto_139246 ?auto_139244 ) ( OBJ-AT ?auto_139247 ?auto_139244 ) ( not ( = ?auto_139245 ?auto_139246 ) ) ( not ( = ?auto_139245 ?auto_139247 ) ) ( not ( = ?auto_139246 ?auto_139247 ) ) ( not ( = ?auto_139246 ?auto_139248 ) ) ( not ( = ?auto_139247 ?auto_139248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139248 ?auto_139245 ?auto_139244 )
      ( DELIVER-4PKG-VERIFY ?auto_139245 ?auto_139246 ?auto_139247 ?auto_139248 ?auto_139244 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139253 - OBJ
      ?auto_139254 - OBJ
      ?auto_139255 - OBJ
      ?auto_139256 - OBJ
      ?auto_139252 - LOCATION
    )
    :vars
    (
      ?auto_139259 - TRUCK
      ?auto_139258 - LOCATION
      ?auto_139257 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139259 ?auto_139258 ) ( IN-CITY ?auto_139258 ?auto_139257 ) ( IN-CITY ?auto_139252 ?auto_139257 ) ( not ( = ?auto_139252 ?auto_139258 ) ) ( OBJ-AT ?auto_139255 ?auto_139252 ) ( not ( = ?auto_139255 ?auto_139253 ) ) ( OBJ-AT ?auto_139253 ?auto_139258 ) ( OBJ-AT ?auto_139254 ?auto_139252 ) ( OBJ-AT ?auto_139256 ?auto_139252 ) ( not ( = ?auto_139253 ?auto_139254 ) ) ( not ( = ?auto_139253 ?auto_139256 ) ) ( not ( = ?auto_139254 ?auto_139255 ) ) ( not ( = ?auto_139254 ?auto_139256 ) ) ( not ( = ?auto_139255 ?auto_139256 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139255 ?auto_139253 ?auto_139252 )
      ( DELIVER-4PKG-VERIFY ?auto_139253 ?auto_139254 ?auto_139255 ?auto_139256 ?auto_139252 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139349 - OBJ
      ?auto_139350 - OBJ
      ?auto_139351 - OBJ
      ?auto_139352 - OBJ
      ?auto_139348 - LOCATION
    )
    :vars
    (
      ?auto_139355 - TRUCK
      ?auto_139354 - LOCATION
      ?auto_139353 - CITY
      ?auto_139356 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139355 ?auto_139354 ) ( IN-CITY ?auto_139354 ?auto_139353 ) ( IN-CITY ?auto_139348 ?auto_139353 ) ( not ( = ?auto_139348 ?auto_139354 ) ) ( OBJ-AT ?auto_139356 ?auto_139348 ) ( not ( = ?auto_139356 ?auto_139349 ) ) ( OBJ-AT ?auto_139349 ?auto_139354 ) ( OBJ-AT ?auto_139350 ?auto_139348 ) ( OBJ-AT ?auto_139351 ?auto_139348 ) ( OBJ-AT ?auto_139352 ?auto_139348 ) ( not ( = ?auto_139349 ?auto_139350 ) ) ( not ( = ?auto_139349 ?auto_139351 ) ) ( not ( = ?auto_139349 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139351 ) ) ( not ( = ?auto_139350 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139356 ) ) ( not ( = ?auto_139351 ?auto_139352 ) ) ( not ( = ?auto_139351 ?auto_139356 ) ) ( not ( = ?auto_139352 ?auto_139356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139356 ?auto_139349 ?auto_139348 )
      ( DELIVER-4PKG-VERIFY ?auto_139349 ?auto_139350 ?auto_139351 ?auto_139352 ?auto_139348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139500 - OBJ
      ?auto_139501 - OBJ
      ?auto_139502 - OBJ
      ?auto_139499 - LOCATION
    )
    :vars
    (
      ?auto_139505 - LOCATION
      ?auto_139504 - CITY
      ?auto_139503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139505 ?auto_139504 ) ( IN-CITY ?auto_139499 ?auto_139504 ) ( not ( = ?auto_139499 ?auto_139505 ) ) ( OBJ-AT ?auto_139501 ?auto_139499 ) ( not ( = ?auto_139501 ?auto_139502 ) ) ( OBJ-AT ?auto_139502 ?auto_139505 ) ( TRUCK-AT ?auto_139503 ?auto_139499 ) ( OBJ-AT ?auto_139500 ?auto_139499 ) ( not ( = ?auto_139500 ?auto_139501 ) ) ( not ( = ?auto_139500 ?auto_139502 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139501 ?auto_139502 ?auto_139499 )
      ( DELIVER-3PKG-VERIFY ?auto_139500 ?auto_139501 ?auto_139502 ?auto_139499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139533 - OBJ
      ?auto_139534 - OBJ
      ?auto_139535 - OBJ
      ?auto_139532 - LOCATION
    )
    :vars
    (
      ?auto_139539 - LOCATION
      ?auto_139537 - CITY
      ?auto_139538 - OBJ
      ?auto_139536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139539 ?auto_139537 ) ( IN-CITY ?auto_139532 ?auto_139537 ) ( not ( = ?auto_139532 ?auto_139539 ) ) ( OBJ-AT ?auto_139538 ?auto_139532 ) ( not ( = ?auto_139538 ?auto_139535 ) ) ( OBJ-AT ?auto_139535 ?auto_139539 ) ( TRUCK-AT ?auto_139536 ?auto_139532 ) ( OBJ-AT ?auto_139533 ?auto_139532 ) ( OBJ-AT ?auto_139534 ?auto_139532 ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( not ( = ?auto_139533 ?auto_139535 ) ) ( not ( = ?auto_139533 ?auto_139538 ) ) ( not ( = ?auto_139534 ?auto_139535 ) ) ( not ( = ?auto_139534 ?auto_139538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139538 ?auto_139535 ?auto_139532 )
      ( DELIVER-3PKG-VERIFY ?auto_139533 ?auto_139534 ?auto_139535 ?auto_139532 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139545 - OBJ
      ?auto_139546 - OBJ
      ?auto_139547 - OBJ
      ?auto_139544 - LOCATION
    )
    :vars
    (
      ?auto_139551 - LOCATION
      ?auto_139549 - CITY
      ?auto_139550 - OBJ
      ?auto_139548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139551 ?auto_139549 ) ( IN-CITY ?auto_139544 ?auto_139549 ) ( not ( = ?auto_139544 ?auto_139551 ) ) ( OBJ-AT ?auto_139550 ?auto_139544 ) ( not ( = ?auto_139550 ?auto_139546 ) ) ( OBJ-AT ?auto_139546 ?auto_139551 ) ( TRUCK-AT ?auto_139548 ?auto_139544 ) ( OBJ-AT ?auto_139545 ?auto_139544 ) ( OBJ-AT ?auto_139547 ?auto_139544 ) ( not ( = ?auto_139545 ?auto_139546 ) ) ( not ( = ?auto_139545 ?auto_139547 ) ) ( not ( = ?auto_139545 ?auto_139550 ) ) ( not ( = ?auto_139546 ?auto_139547 ) ) ( not ( = ?auto_139547 ?auto_139550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139550 ?auto_139546 ?auto_139544 )
      ( DELIVER-3PKG-VERIFY ?auto_139545 ?auto_139546 ?auto_139547 ?auto_139544 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139583 - OBJ
      ?auto_139584 - OBJ
      ?auto_139585 - OBJ
      ?auto_139582 - LOCATION
    )
    :vars
    (
      ?auto_139589 - LOCATION
      ?auto_139587 - CITY
      ?auto_139588 - OBJ
      ?auto_139586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139589 ?auto_139587 ) ( IN-CITY ?auto_139582 ?auto_139587 ) ( not ( = ?auto_139582 ?auto_139589 ) ) ( OBJ-AT ?auto_139588 ?auto_139582 ) ( not ( = ?auto_139588 ?auto_139583 ) ) ( OBJ-AT ?auto_139583 ?auto_139589 ) ( TRUCK-AT ?auto_139586 ?auto_139582 ) ( OBJ-AT ?auto_139584 ?auto_139582 ) ( OBJ-AT ?auto_139585 ?auto_139582 ) ( not ( = ?auto_139583 ?auto_139584 ) ) ( not ( = ?auto_139583 ?auto_139585 ) ) ( not ( = ?auto_139584 ?auto_139585 ) ) ( not ( = ?auto_139584 ?auto_139588 ) ) ( not ( = ?auto_139585 ?auto_139588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139588 ?auto_139583 ?auto_139582 )
      ( DELIVER-3PKG-VERIFY ?auto_139583 ?auto_139584 ?auto_139585 ?auto_139582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139630 - OBJ
      ?auto_139631 - OBJ
      ?auto_139632 - OBJ
      ?auto_139633 - OBJ
      ?auto_139629 - LOCATION
    )
    :vars
    (
      ?auto_139636 - LOCATION
      ?auto_139635 - CITY
      ?auto_139634 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139636 ?auto_139635 ) ( IN-CITY ?auto_139629 ?auto_139635 ) ( not ( = ?auto_139629 ?auto_139636 ) ) ( OBJ-AT ?auto_139630 ?auto_139629 ) ( not ( = ?auto_139630 ?auto_139633 ) ) ( OBJ-AT ?auto_139633 ?auto_139636 ) ( TRUCK-AT ?auto_139634 ?auto_139629 ) ( OBJ-AT ?auto_139631 ?auto_139629 ) ( OBJ-AT ?auto_139632 ?auto_139629 ) ( not ( = ?auto_139630 ?auto_139631 ) ) ( not ( = ?auto_139630 ?auto_139632 ) ) ( not ( = ?auto_139631 ?auto_139632 ) ) ( not ( = ?auto_139631 ?auto_139633 ) ) ( not ( = ?auto_139632 ?auto_139633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139630 ?auto_139633 ?auto_139629 )
      ( DELIVER-4PKG-VERIFY ?auto_139630 ?auto_139631 ?auto_139632 ?auto_139633 ?auto_139629 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139638 - OBJ
      ?auto_139639 - OBJ
      ?auto_139640 - OBJ
      ?auto_139641 - OBJ
      ?auto_139637 - LOCATION
    )
    :vars
    (
      ?auto_139644 - LOCATION
      ?auto_139643 - CITY
      ?auto_139642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139644 ?auto_139643 ) ( IN-CITY ?auto_139637 ?auto_139643 ) ( not ( = ?auto_139637 ?auto_139644 ) ) ( OBJ-AT ?auto_139638 ?auto_139637 ) ( not ( = ?auto_139638 ?auto_139640 ) ) ( OBJ-AT ?auto_139640 ?auto_139644 ) ( TRUCK-AT ?auto_139642 ?auto_139637 ) ( OBJ-AT ?auto_139639 ?auto_139637 ) ( OBJ-AT ?auto_139641 ?auto_139637 ) ( not ( = ?auto_139638 ?auto_139639 ) ) ( not ( = ?auto_139638 ?auto_139641 ) ) ( not ( = ?auto_139639 ?auto_139640 ) ) ( not ( = ?auto_139639 ?auto_139641 ) ) ( not ( = ?auto_139640 ?auto_139641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139638 ?auto_139640 ?auto_139637 )
      ( DELIVER-4PKG-VERIFY ?auto_139638 ?auto_139639 ?auto_139640 ?auto_139641 ?auto_139637 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139646 - OBJ
      ?auto_139647 - OBJ
      ?auto_139648 - OBJ
      ?auto_139649 - OBJ
      ?auto_139645 - LOCATION
    )
    :vars
    (
      ?auto_139652 - LOCATION
      ?auto_139651 - CITY
      ?auto_139650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139652 ?auto_139651 ) ( IN-CITY ?auto_139645 ?auto_139651 ) ( not ( = ?auto_139645 ?auto_139652 ) ) ( OBJ-AT ?auto_139647 ?auto_139645 ) ( not ( = ?auto_139647 ?auto_139648 ) ) ( OBJ-AT ?auto_139648 ?auto_139652 ) ( TRUCK-AT ?auto_139650 ?auto_139645 ) ( OBJ-AT ?auto_139646 ?auto_139645 ) ( OBJ-AT ?auto_139649 ?auto_139645 ) ( not ( = ?auto_139646 ?auto_139647 ) ) ( not ( = ?auto_139646 ?auto_139648 ) ) ( not ( = ?auto_139646 ?auto_139649 ) ) ( not ( = ?auto_139647 ?auto_139649 ) ) ( not ( = ?auto_139648 ?auto_139649 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139647 ?auto_139648 ?auto_139645 )
      ( DELIVER-4PKG-VERIFY ?auto_139646 ?auto_139647 ?auto_139648 ?auto_139649 ?auto_139645 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139702 - OBJ
      ?auto_139703 - OBJ
      ?auto_139704 - OBJ
      ?auto_139705 - OBJ
      ?auto_139701 - LOCATION
    )
    :vars
    (
      ?auto_139708 - LOCATION
      ?auto_139707 - CITY
      ?auto_139706 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139708 ?auto_139707 ) ( IN-CITY ?auto_139701 ?auto_139707 ) ( not ( = ?auto_139701 ?auto_139708 ) ) ( OBJ-AT ?auto_139704 ?auto_139701 ) ( not ( = ?auto_139704 ?auto_139703 ) ) ( OBJ-AT ?auto_139703 ?auto_139708 ) ( TRUCK-AT ?auto_139706 ?auto_139701 ) ( OBJ-AT ?auto_139702 ?auto_139701 ) ( OBJ-AT ?auto_139705 ?auto_139701 ) ( not ( = ?auto_139702 ?auto_139703 ) ) ( not ( = ?auto_139702 ?auto_139704 ) ) ( not ( = ?auto_139702 ?auto_139705 ) ) ( not ( = ?auto_139703 ?auto_139705 ) ) ( not ( = ?auto_139704 ?auto_139705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139704 ?auto_139703 ?auto_139701 )
      ( DELIVER-4PKG-VERIFY ?auto_139702 ?auto_139703 ?auto_139704 ?auto_139705 ?auto_139701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139710 - OBJ
      ?auto_139711 - OBJ
      ?auto_139712 - OBJ
      ?auto_139713 - OBJ
      ?auto_139709 - LOCATION
    )
    :vars
    (
      ?auto_139716 - LOCATION
      ?auto_139715 - CITY
      ?auto_139714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139716 ?auto_139715 ) ( IN-CITY ?auto_139709 ?auto_139715 ) ( not ( = ?auto_139709 ?auto_139716 ) ) ( OBJ-AT ?auto_139710 ?auto_139709 ) ( not ( = ?auto_139710 ?auto_139711 ) ) ( OBJ-AT ?auto_139711 ?auto_139716 ) ( TRUCK-AT ?auto_139714 ?auto_139709 ) ( OBJ-AT ?auto_139712 ?auto_139709 ) ( OBJ-AT ?auto_139713 ?auto_139709 ) ( not ( = ?auto_139710 ?auto_139712 ) ) ( not ( = ?auto_139710 ?auto_139713 ) ) ( not ( = ?auto_139711 ?auto_139712 ) ) ( not ( = ?auto_139711 ?auto_139713 ) ) ( not ( = ?auto_139712 ?auto_139713 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139710 ?auto_139711 ?auto_139709 )
      ( DELIVER-4PKG-VERIFY ?auto_139710 ?auto_139711 ?auto_139712 ?auto_139713 ?auto_139709 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139774 - OBJ
      ?auto_139775 - OBJ
      ?auto_139776 - OBJ
      ?auto_139777 - OBJ
      ?auto_139773 - LOCATION
    )
    :vars
    (
      ?auto_139780 - LOCATION
      ?auto_139779 - CITY
      ?auto_139778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139780 ?auto_139779 ) ( IN-CITY ?auto_139773 ?auto_139779 ) ( not ( = ?auto_139773 ?auto_139780 ) ) ( OBJ-AT ?auto_139776 ?auto_139773 ) ( not ( = ?auto_139776 ?auto_139777 ) ) ( OBJ-AT ?auto_139777 ?auto_139780 ) ( TRUCK-AT ?auto_139778 ?auto_139773 ) ( OBJ-AT ?auto_139774 ?auto_139773 ) ( OBJ-AT ?auto_139775 ?auto_139773 ) ( not ( = ?auto_139774 ?auto_139775 ) ) ( not ( = ?auto_139774 ?auto_139776 ) ) ( not ( = ?auto_139774 ?auto_139777 ) ) ( not ( = ?auto_139775 ?auto_139776 ) ) ( not ( = ?auto_139775 ?auto_139777 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139776 ?auto_139777 ?auto_139773 )
      ( DELIVER-4PKG-VERIFY ?auto_139774 ?auto_139775 ?auto_139776 ?auto_139777 ?auto_139773 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139822 - OBJ
      ?auto_139823 - OBJ
      ?auto_139824 - OBJ
      ?auto_139825 - OBJ
      ?auto_139821 - LOCATION
    )
    :vars
    (
      ?auto_139829 - LOCATION
      ?auto_139827 - CITY
      ?auto_139828 - OBJ
      ?auto_139826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139829 ?auto_139827 ) ( IN-CITY ?auto_139821 ?auto_139827 ) ( not ( = ?auto_139821 ?auto_139829 ) ) ( OBJ-AT ?auto_139828 ?auto_139821 ) ( not ( = ?auto_139828 ?auto_139825 ) ) ( OBJ-AT ?auto_139825 ?auto_139829 ) ( TRUCK-AT ?auto_139826 ?auto_139821 ) ( OBJ-AT ?auto_139822 ?auto_139821 ) ( OBJ-AT ?auto_139823 ?auto_139821 ) ( OBJ-AT ?auto_139824 ?auto_139821 ) ( not ( = ?auto_139822 ?auto_139823 ) ) ( not ( = ?auto_139822 ?auto_139824 ) ) ( not ( = ?auto_139822 ?auto_139825 ) ) ( not ( = ?auto_139822 ?auto_139828 ) ) ( not ( = ?auto_139823 ?auto_139824 ) ) ( not ( = ?auto_139823 ?auto_139825 ) ) ( not ( = ?auto_139823 ?auto_139828 ) ) ( not ( = ?auto_139824 ?auto_139825 ) ) ( not ( = ?auto_139824 ?auto_139828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139828 ?auto_139825 ?auto_139821 )
      ( DELIVER-4PKG-VERIFY ?auto_139822 ?auto_139823 ?auto_139824 ?auto_139825 ?auto_139821 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139839 - OBJ
      ?auto_139840 - OBJ
      ?auto_139841 - OBJ
      ?auto_139842 - OBJ
      ?auto_139838 - LOCATION
    )
    :vars
    (
      ?auto_139846 - LOCATION
      ?auto_139844 - CITY
      ?auto_139845 - OBJ
      ?auto_139843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139846 ?auto_139844 ) ( IN-CITY ?auto_139838 ?auto_139844 ) ( not ( = ?auto_139838 ?auto_139846 ) ) ( OBJ-AT ?auto_139845 ?auto_139838 ) ( not ( = ?auto_139845 ?auto_139841 ) ) ( OBJ-AT ?auto_139841 ?auto_139846 ) ( TRUCK-AT ?auto_139843 ?auto_139838 ) ( OBJ-AT ?auto_139839 ?auto_139838 ) ( OBJ-AT ?auto_139840 ?auto_139838 ) ( OBJ-AT ?auto_139842 ?auto_139838 ) ( not ( = ?auto_139839 ?auto_139840 ) ) ( not ( = ?auto_139839 ?auto_139841 ) ) ( not ( = ?auto_139839 ?auto_139842 ) ) ( not ( = ?auto_139839 ?auto_139845 ) ) ( not ( = ?auto_139840 ?auto_139841 ) ) ( not ( = ?auto_139840 ?auto_139842 ) ) ( not ( = ?auto_139840 ?auto_139845 ) ) ( not ( = ?auto_139841 ?auto_139842 ) ) ( not ( = ?auto_139842 ?auto_139845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139845 ?auto_139841 ?auto_139838 )
      ( DELIVER-4PKG-VERIFY ?auto_139839 ?auto_139840 ?auto_139841 ?auto_139842 ?auto_139838 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139889 - OBJ
      ?auto_139890 - OBJ
      ?auto_139891 - OBJ
      ?auto_139892 - OBJ
      ?auto_139888 - LOCATION
    )
    :vars
    (
      ?auto_139896 - LOCATION
      ?auto_139894 - CITY
      ?auto_139895 - OBJ
      ?auto_139893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139896 ?auto_139894 ) ( IN-CITY ?auto_139888 ?auto_139894 ) ( not ( = ?auto_139888 ?auto_139896 ) ) ( OBJ-AT ?auto_139895 ?auto_139888 ) ( not ( = ?auto_139895 ?auto_139890 ) ) ( OBJ-AT ?auto_139890 ?auto_139896 ) ( TRUCK-AT ?auto_139893 ?auto_139888 ) ( OBJ-AT ?auto_139889 ?auto_139888 ) ( OBJ-AT ?auto_139891 ?auto_139888 ) ( OBJ-AT ?auto_139892 ?auto_139888 ) ( not ( = ?auto_139889 ?auto_139890 ) ) ( not ( = ?auto_139889 ?auto_139891 ) ) ( not ( = ?auto_139889 ?auto_139892 ) ) ( not ( = ?auto_139889 ?auto_139895 ) ) ( not ( = ?auto_139890 ?auto_139891 ) ) ( not ( = ?auto_139890 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139895 ) ) ( not ( = ?auto_139892 ?auto_139895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139895 ?auto_139890 ?auto_139888 )
      ( DELIVER-4PKG-VERIFY ?auto_139889 ?auto_139890 ?auto_139891 ?auto_139892 ?auto_139888 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139941 - OBJ
      ?auto_139942 - OBJ
      ?auto_139943 - OBJ
      ?auto_139944 - OBJ
      ?auto_139940 - LOCATION
    )
    :vars
    (
      ?auto_139947 - LOCATION
      ?auto_139946 - CITY
      ?auto_139945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139947 ?auto_139946 ) ( IN-CITY ?auto_139940 ?auto_139946 ) ( not ( = ?auto_139940 ?auto_139947 ) ) ( OBJ-AT ?auto_139942 ?auto_139940 ) ( not ( = ?auto_139942 ?auto_139941 ) ) ( OBJ-AT ?auto_139941 ?auto_139947 ) ( TRUCK-AT ?auto_139945 ?auto_139940 ) ( OBJ-AT ?auto_139943 ?auto_139940 ) ( OBJ-AT ?auto_139944 ?auto_139940 ) ( not ( = ?auto_139941 ?auto_139943 ) ) ( not ( = ?auto_139941 ?auto_139944 ) ) ( not ( = ?auto_139942 ?auto_139943 ) ) ( not ( = ?auto_139942 ?auto_139944 ) ) ( not ( = ?auto_139943 ?auto_139944 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139942 ?auto_139941 ?auto_139940 )
      ( DELIVER-4PKG-VERIFY ?auto_139941 ?auto_139942 ?auto_139943 ?auto_139944 ?auto_139940 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140013 - OBJ
      ?auto_140014 - OBJ
      ?auto_140015 - OBJ
      ?auto_140016 - OBJ
      ?auto_140012 - LOCATION
    )
    :vars
    (
      ?auto_140019 - LOCATION
      ?auto_140018 - CITY
      ?auto_140017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140019 ?auto_140018 ) ( IN-CITY ?auto_140012 ?auto_140018 ) ( not ( = ?auto_140012 ?auto_140019 ) ) ( OBJ-AT ?auto_140015 ?auto_140012 ) ( not ( = ?auto_140015 ?auto_140013 ) ) ( OBJ-AT ?auto_140013 ?auto_140019 ) ( TRUCK-AT ?auto_140017 ?auto_140012 ) ( OBJ-AT ?auto_140014 ?auto_140012 ) ( OBJ-AT ?auto_140016 ?auto_140012 ) ( not ( = ?auto_140013 ?auto_140014 ) ) ( not ( = ?auto_140013 ?auto_140016 ) ) ( not ( = ?auto_140014 ?auto_140015 ) ) ( not ( = ?auto_140014 ?auto_140016 ) ) ( not ( = ?auto_140015 ?auto_140016 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140015 ?auto_140013 ?auto_140012 )
      ( DELIVER-4PKG-VERIFY ?auto_140013 ?auto_140014 ?auto_140015 ?auto_140016 ?auto_140012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140037 - OBJ
      ?auto_140038 - OBJ
      ?auto_140039 - OBJ
      ?auto_140040 - OBJ
      ?auto_140036 - LOCATION
    )
    :vars
    (
      ?auto_140044 - LOCATION
      ?auto_140042 - CITY
      ?auto_140043 - OBJ
      ?auto_140041 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140044 ?auto_140042 ) ( IN-CITY ?auto_140036 ?auto_140042 ) ( not ( = ?auto_140036 ?auto_140044 ) ) ( OBJ-AT ?auto_140043 ?auto_140036 ) ( not ( = ?auto_140043 ?auto_140037 ) ) ( OBJ-AT ?auto_140037 ?auto_140044 ) ( TRUCK-AT ?auto_140041 ?auto_140036 ) ( OBJ-AT ?auto_140038 ?auto_140036 ) ( OBJ-AT ?auto_140039 ?auto_140036 ) ( OBJ-AT ?auto_140040 ?auto_140036 ) ( not ( = ?auto_140037 ?auto_140038 ) ) ( not ( = ?auto_140037 ?auto_140039 ) ) ( not ( = ?auto_140037 ?auto_140040 ) ) ( not ( = ?auto_140038 ?auto_140039 ) ) ( not ( = ?auto_140038 ?auto_140040 ) ) ( not ( = ?auto_140038 ?auto_140043 ) ) ( not ( = ?auto_140039 ?auto_140040 ) ) ( not ( = ?auto_140039 ?auto_140043 ) ) ( not ( = ?auto_140040 ?auto_140043 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140043 ?auto_140037 ?auto_140036 )
      ( DELIVER-4PKG-VERIFY ?auto_140037 ?auto_140038 ?auto_140039 ?auto_140040 ?auto_140036 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140200 - OBJ
      ?auto_140201 - OBJ
      ?auto_140202 - OBJ
      ?auto_140199 - LOCATION
    )
    :vars
    (
      ?auto_140205 - LOCATION
      ?auto_140204 - CITY
      ?auto_140203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140205 ?auto_140204 ) ( IN-CITY ?auto_140199 ?auto_140204 ) ( not ( = ?auto_140199 ?auto_140205 ) ) ( OBJ-AT ?auto_140200 ?auto_140199 ) ( not ( = ?auto_140200 ?auto_140201 ) ) ( OBJ-AT ?auto_140201 ?auto_140205 ) ( TRUCK-AT ?auto_140203 ?auto_140199 ) ( OBJ-AT ?auto_140202 ?auto_140199 ) ( not ( = ?auto_140200 ?auto_140202 ) ) ( not ( = ?auto_140201 ?auto_140202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140200 ?auto_140201 ?auto_140199 )
      ( DELIVER-3PKG-VERIFY ?auto_140200 ?auto_140201 ?auto_140202 ?auto_140199 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_140861 - OBJ
      ?auto_140860 - LOCATION
    )
    :vars
    (
      ?auto_140865 - LOCATION
      ?auto_140863 - CITY
      ?auto_140864 - OBJ
      ?auto_140862 - TRUCK
      ?auto_140866 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140865 ?auto_140863 ) ( IN-CITY ?auto_140860 ?auto_140863 ) ( not ( = ?auto_140860 ?auto_140865 ) ) ( OBJ-AT ?auto_140864 ?auto_140860 ) ( not ( = ?auto_140864 ?auto_140861 ) ) ( OBJ-AT ?auto_140861 ?auto_140865 ) ( TRUCK-AT ?auto_140862 ?auto_140866 ) ( IN-CITY ?auto_140866 ?auto_140863 ) ( not ( = ?auto_140860 ?auto_140866 ) ) ( not ( = ?auto_140865 ?auto_140866 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_140862 ?auto_140866 ?auto_140860 ?auto_140863 )
      ( DELIVER-2PKG ?auto_140864 ?auto_140861 ?auto_140860 )
      ( DELIVER-1PKG-VERIFY ?auto_140861 ?auto_140860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_140868 - OBJ
      ?auto_140869 - OBJ
      ?auto_140867 - LOCATION
    )
    :vars
    (
      ?auto_140870 - LOCATION
      ?auto_140872 - CITY
      ?auto_140873 - TRUCK
      ?auto_140871 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140870 ?auto_140872 ) ( IN-CITY ?auto_140867 ?auto_140872 ) ( not ( = ?auto_140867 ?auto_140870 ) ) ( OBJ-AT ?auto_140868 ?auto_140867 ) ( not ( = ?auto_140868 ?auto_140869 ) ) ( OBJ-AT ?auto_140869 ?auto_140870 ) ( TRUCK-AT ?auto_140873 ?auto_140871 ) ( IN-CITY ?auto_140871 ?auto_140872 ) ( not ( = ?auto_140867 ?auto_140871 ) ) ( not ( = ?auto_140870 ?auto_140871 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_140869 ?auto_140867 )
      ( DELIVER-2PKG-VERIFY ?auto_140868 ?auto_140869 ?auto_140867 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_140883 - OBJ
      ?auto_140884 - OBJ
      ?auto_140882 - LOCATION
    )
    :vars
    (
      ?auto_140885 - LOCATION
      ?auto_140887 - CITY
      ?auto_140888 - TRUCK
      ?auto_140886 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140885 ?auto_140887 ) ( IN-CITY ?auto_140882 ?auto_140887 ) ( not ( = ?auto_140882 ?auto_140885 ) ) ( OBJ-AT ?auto_140884 ?auto_140882 ) ( not ( = ?auto_140884 ?auto_140883 ) ) ( OBJ-AT ?auto_140883 ?auto_140885 ) ( TRUCK-AT ?auto_140888 ?auto_140886 ) ( IN-CITY ?auto_140886 ?auto_140887 ) ( not ( = ?auto_140882 ?auto_140886 ) ) ( not ( = ?auto_140885 ?auto_140886 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140884 ?auto_140883 ?auto_140882 )
      ( DELIVER-2PKG-VERIFY ?auto_140883 ?auto_140884 ?auto_140882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140906 - OBJ
      ?auto_140907 - OBJ
      ?auto_140908 - OBJ
      ?auto_140905 - LOCATION
    )
    :vars
    (
      ?auto_140909 - LOCATION
      ?auto_140911 - CITY
      ?auto_140912 - TRUCK
      ?auto_140910 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140909 ?auto_140911 ) ( IN-CITY ?auto_140905 ?auto_140911 ) ( not ( = ?auto_140905 ?auto_140909 ) ) ( OBJ-AT ?auto_140907 ?auto_140905 ) ( not ( = ?auto_140907 ?auto_140908 ) ) ( OBJ-AT ?auto_140908 ?auto_140909 ) ( TRUCK-AT ?auto_140912 ?auto_140910 ) ( IN-CITY ?auto_140910 ?auto_140911 ) ( not ( = ?auto_140905 ?auto_140910 ) ) ( not ( = ?auto_140909 ?auto_140910 ) ) ( OBJ-AT ?auto_140906 ?auto_140905 ) ( not ( = ?auto_140906 ?auto_140907 ) ) ( not ( = ?auto_140906 ?auto_140908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140907 ?auto_140908 ?auto_140905 )
      ( DELIVER-3PKG-VERIFY ?auto_140906 ?auto_140907 ?auto_140908 ?auto_140905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140922 - OBJ
      ?auto_140923 - OBJ
      ?auto_140924 - OBJ
      ?auto_140921 - LOCATION
    )
    :vars
    (
      ?auto_140925 - LOCATION
      ?auto_140927 - CITY
      ?auto_140928 - TRUCK
      ?auto_140926 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140925 ?auto_140927 ) ( IN-CITY ?auto_140921 ?auto_140927 ) ( not ( = ?auto_140921 ?auto_140925 ) ) ( OBJ-AT ?auto_140924 ?auto_140921 ) ( not ( = ?auto_140924 ?auto_140923 ) ) ( OBJ-AT ?auto_140923 ?auto_140925 ) ( TRUCK-AT ?auto_140928 ?auto_140926 ) ( IN-CITY ?auto_140926 ?auto_140927 ) ( not ( = ?auto_140921 ?auto_140926 ) ) ( not ( = ?auto_140925 ?auto_140926 ) ) ( OBJ-AT ?auto_140922 ?auto_140921 ) ( not ( = ?auto_140922 ?auto_140923 ) ) ( not ( = ?auto_140922 ?auto_140924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140924 ?auto_140923 ?auto_140921 )
      ( DELIVER-3PKG-VERIFY ?auto_140922 ?auto_140923 ?auto_140924 ?auto_140921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140989 - OBJ
      ?auto_140990 - OBJ
      ?auto_140991 - OBJ
      ?auto_140988 - LOCATION
    )
    :vars
    (
      ?auto_140992 - LOCATION
      ?auto_140994 - CITY
      ?auto_140995 - TRUCK
      ?auto_140993 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_140992 ?auto_140994 ) ( IN-CITY ?auto_140988 ?auto_140994 ) ( not ( = ?auto_140988 ?auto_140992 ) ) ( OBJ-AT ?auto_140991 ?auto_140988 ) ( not ( = ?auto_140991 ?auto_140989 ) ) ( OBJ-AT ?auto_140989 ?auto_140992 ) ( TRUCK-AT ?auto_140995 ?auto_140993 ) ( IN-CITY ?auto_140993 ?auto_140994 ) ( not ( = ?auto_140988 ?auto_140993 ) ) ( not ( = ?auto_140992 ?auto_140993 ) ) ( OBJ-AT ?auto_140990 ?auto_140988 ) ( not ( = ?auto_140989 ?auto_140990 ) ) ( not ( = ?auto_140990 ?auto_140991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140991 ?auto_140989 ?auto_140988 )
      ( DELIVER-3PKG-VERIFY ?auto_140989 ?auto_140990 ?auto_140991 ?auto_140988 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141065 - OBJ
      ?auto_141066 - OBJ
      ?auto_141067 - OBJ
      ?auto_141068 - OBJ
      ?auto_141064 - LOCATION
    )
    :vars
    (
      ?auto_141069 - LOCATION
      ?auto_141071 - CITY
      ?auto_141072 - TRUCK
      ?auto_141070 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141069 ?auto_141071 ) ( IN-CITY ?auto_141064 ?auto_141071 ) ( not ( = ?auto_141064 ?auto_141069 ) ) ( OBJ-AT ?auto_141065 ?auto_141064 ) ( not ( = ?auto_141065 ?auto_141068 ) ) ( OBJ-AT ?auto_141068 ?auto_141069 ) ( TRUCK-AT ?auto_141072 ?auto_141070 ) ( IN-CITY ?auto_141070 ?auto_141071 ) ( not ( = ?auto_141064 ?auto_141070 ) ) ( not ( = ?auto_141069 ?auto_141070 ) ) ( OBJ-AT ?auto_141066 ?auto_141064 ) ( OBJ-AT ?auto_141067 ?auto_141064 ) ( not ( = ?auto_141065 ?auto_141066 ) ) ( not ( = ?auto_141065 ?auto_141067 ) ) ( not ( = ?auto_141066 ?auto_141067 ) ) ( not ( = ?auto_141066 ?auto_141068 ) ) ( not ( = ?auto_141067 ?auto_141068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141065 ?auto_141068 ?auto_141064 )
      ( DELIVER-4PKG-VERIFY ?auto_141065 ?auto_141066 ?auto_141067 ?auto_141068 ?auto_141064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141083 - OBJ
      ?auto_141084 - OBJ
      ?auto_141085 - OBJ
      ?auto_141086 - OBJ
      ?auto_141082 - LOCATION
    )
    :vars
    (
      ?auto_141087 - LOCATION
      ?auto_141089 - CITY
      ?auto_141090 - TRUCK
      ?auto_141088 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141087 ?auto_141089 ) ( IN-CITY ?auto_141082 ?auto_141089 ) ( not ( = ?auto_141082 ?auto_141087 ) ) ( OBJ-AT ?auto_141083 ?auto_141082 ) ( not ( = ?auto_141083 ?auto_141085 ) ) ( OBJ-AT ?auto_141085 ?auto_141087 ) ( TRUCK-AT ?auto_141090 ?auto_141088 ) ( IN-CITY ?auto_141088 ?auto_141089 ) ( not ( = ?auto_141082 ?auto_141088 ) ) ( not ( = ?auto_141087 ?auto_141088 ) ) ( OBJ-AT ?auto_141084 ?auto_141082 ) ( OBJ-AT ?auto_141086 ?auto_141082 ) ( not ( = ?auto_141083 ?auto_141084 ) ) ( not ( = ?auto_141083 ?auto_141086 ) ) ( not ( = ?auto_141084 ?auto_141085 ) ) ( not ( = ?auto_141084 ?auto_141086 ) ) ( not ( = ?auto_141085 ?auto_141086 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141083 ?auto_141085 ?auto_141082 )
      ( DELIVER-4PKG-VERIFY ?auto_141083 ?auto_141084 ?auto_141085 ?auto_141086 ?auto_141082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141155 - OBJ
      ?auto_141156 - OBJ
      ?auto_141157 - OBJ
      ?auto_141158 - OBJ
      ?auto_141154 - LOCATION
    )
    :vars
    (
      ?auto_141159 - LOCATION
      ?auto_141161 - CITY
      ?auto_141162 - TRUCK
      ?auto_141160 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141159 ?auto_141161 ) ( IN-CITY ?auto_141154 ?auto_141161 ) ( not ( = ?auto_141154 ?auto_141159 ) ) ( OBJ-AT ?auto_141155 ?auto_141154 ) ( not ( = ?auto_141155 ?auto_141156 ) ) ( OBJ-AT ?auto_141156 ?auto_141159 ) ( TRUCK-AT ?auto_141162 ?auto_141160 ) ( IN-CITY ?auto_141160 ?auto_141161 ) ( not ( = ?auto_141154 ?auto_141160 ) ) ( not ( = ?auto_141159 ?auto_141160 ) ) ( OBJ-AT ?auto_141157 ?auto_141154 ) ( OBJ-AT ?auto_141158 ?auto_141154 ) ( not ( = ?auto_141155 ?auto_141157 ) ) ( not ( = ?auto_141155 ?auto_141158 ) ) ( not ( = ?auto_141156 ?auto_141157 ) ) ( not ( = ?auto_141156 ?auto_141158 ) ) ( not ( = ?auto_141157 ?auto_141158 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141155 ?auto_141156 ?auto_141154 )
      ( DELIVER-4PKG-VERIFY ?auto_141155 ?auto_141156 ?auto_141157 ?auto_141158 ?auto_141154 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141414 - OBJ
      ?auto_141415 - OBJ
      ?auto_141416 - OBJ
      ?auto_141417 - OBJ
      ?auto_141413 - LOCATION
    )
    :vars
    (
      ?auto_141418 - LOCATION
      ?auto_141420 - CITY
      ?auto_141421 - TRUCK
      ?auto_141419 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141418 ?auto_141420 ) ( IN-CITY ?auto_141413 ?auto_141420 ) ( not ( = ?auto_141413 ?auto_141418 ) ) ( OBJ-AT ?auto_141416 ?auto_141413 ) ( not ( = ?auto_141416 ?auto_141414 ) ) ( OBJ-AT ?auto_141414 ?auto_141418 ) ( TRUCK-AT ?auto_141421 ?auto_141419 ) ( IN-CITY ?auto_141419 ?auto_141420 ) ( not ( = ?auto_141413 ?auto_141419 ) ) ( not ( = ?auto_141418 ?auto_141419 ) ) ( OBJ-AT ?auto_141415 ?auto_141413 ) ( OBJ-AT ?auto_141417 ?auto_141413 ) ( not ( = ?auto_141414 ?auto_141415 ) ) ( not ( = ?auto_141414 ?auto_141417 ) ) ( not ( = ?auto_141415 ?auto_141416 ) ) ( not ( = ?auto_141415 ?auto_141417 ) ) ( not ( = ?auto_141416 ?auto_141417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141416 ?auto_141414 ?auto_141413 )
      ( DELIVER-4PKG-VERIFY ?auto_141414 ?auto_141415 ?auto_141416 ?auto_141417 ?auto_141413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141697 - OBJ
      ?auto_141698 - OBJ
      ?auto_141699 - OBJ
      ?auto_141696 - LOCATION
    )
    :vars
    (
      ?auto_141702 - LOCATION
      ?auto_141700 - CITY
      ?auto_141703 - TRUCK
      ?auto_141701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141702 ?auto_141700 ) ( IN-CITY ?auto_141696 ?auto_141700 ) ( not ( = ?auto_141696 ?auto_141702 ) ) ( OBJ-AT ?auto_141697 ?auto_141696 ) ( not ( = ?auto_141697 ?auto_141699 ) ) ( OBJ-AT ?auto_141699 ?auto_141702 ) ( TRUCK-AT ?auto_141703 ?auto_141701 ) ( IN-CITY ?auto_141701 ?auto_141700 ) ( not ( = ?auto_141696 ?auto_141701 ) ) ( not ( = ?auto_141702 ?auto_141701 ) ) ( OBJ-AT ?auto_141698 ?auto_141696 ) ( not ( = ?auto_141697 ?auto_141698 ) ) ( not ( = ?auto_141698 ?auto_141699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141697 ?auto_141699 ?auto_141696 )
      ( DELIVER-3PKG-VERIFY ?auto_141697 ?auto_141698 ?auto_141699 ?auto_141696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141780 - OBJ
      ?auto_141781 - OBJ
      ?auto_141782 - OBJ
      ?auto_141779 - LOCATION
    )
    :vars
    (
      ?auto_141785 - LOCATION
      ?auto_141783 - CITY
      ?auto_141786 - TRUCK
      ?auto_141784 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141785 ?auto_141783 ) ( IN-CITY ?auto_141779 ?auto_141783 ) ( not ( = ?auto_141779 ?auto_141785 ) ) ( OBJ-AT ?auto_141781 ?auto_141779 ) ( not ( = ?auto_141781 ?auto_141780 ) ) ( OBJ-AT ?auto_141780 ?auto_141785 ) ( TRUCK-AT ?auto_141786 ?auto_141784 ) ( IN-CITY ?auto_141784 ?auto_141783 ) ( not ( = ?auto_141779 ?auto_141784 ) ) ( not ( = ?auto_141785 ?auto_141784 ) ) ( OBJ-AT ?auto_141782 ?auto_141779 ) ( not ( = ?auto_141780 ?auto_141782 ) ) ( not ( = ?auto_141781 ?auto_141782 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141781 ?auto_141780 ?auto_141779 )
      ( DELIVER-3PKG-VERIFY ?auto_141780 ?auto_141781 ?auto_141782 ?auto_141779 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141946 - OBJ
      ?auto_141947 - OBJ
      ?auto_141948 - OBJ
      ?auto_141949 - OBJ
      ?auto_141945 - LOCATION
    )
    :vars
    (
      ?auto_141952 - LOCATION
      ?auto_141950 - CITY
      ?auto_141953 - TRUCK
      ?auto_141951 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141952 ?auto_141950 ) ( IN-CITY ?auto_141945 ?auto_141950 ) ( not ( = ?auto_141945 ?auto_141952 ) ) ( OBJ-AT ?auto_141949 ?auto_141945 ) ( not ( = ?auto_141949 ?auto_141947 ) ) ( OBJ-AT ?auto_141947 ?auto_141952 ) ( TRUCK-AT ?auto_141953 ?auto_141951 ) ( IN-CITY ?auto_141951 ?auto_141950 ) ( not ( = ?auto_141945 ?auto_141951 ) ) ( not ( = ?auto_141952 ?auto_141951 ) ) ( OBJ-AT ?auto_141946 ?auto_141945 ) ( OBJ-AT ?auto_141948 ?auto_141945 ) ( not ( = ?auto_141946 ?auto_141947 ) ) ( not ( = ?auto_141946 ?auto_141948 ) ) ( not ( = ?auto_141946 ?auto_141949 ) ) ( not ( = ?auto_141947 ?auto_141948 ) ) ( not ( = ?auto_141948 ?auto_141949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141949 ?auto_141947 ?auto_141945 )
      ( DELIVER-4PKG-VERIFY ?auto_141946 ?auto_141947 ?auto_141948 ?auto_141949 ?auto_141945 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_143864 - OBJ
      ?auto_143863 - LOCATION
    )
    :vars
    (
      ?auto_143868 - LOCATION
      ?auto_143866 - CITY
      ?auto_143865 - OBJ
      ?auto_143867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143868 ?auto_143866 ) ( IN-CITY ?auto_143863 ?auto_143866 ) ( not ( = ?auto_143863 ?auto_143868 ) ) ( not ( = ?auto_143865 ?auto_143864 ) ) ( OBJ-AT ?auto_143864 ?auto_143868 ) ( IN-TRUCK ?auto_143865 ?auto_143867 ) ( TRUCK-AT ?auto_143867 ?auto_143868 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_143867 ?auto_143868 ?auto_143863 ?auto_143866 )
      ( DELIVER-2PKG ?auto_143865 ?auto_143864 ?auto_143863 )
      ( DELIVER-1PKG-VERIFY ?auto_143864 ?auto_143863 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_143870 - OBJ
      ?auto_143871 - OBJ
      ?auto_143869 - LOCATION
    )
    :vars
    (
      ?auto_143872 - LOCATION
      ?auto_143874 - CITY
      ?auto_143873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143872 ?auto_143874 ) ( IN-CITY ?auto_143869 ?auto_143874 ) ( not ( = ?auto_143869 ?auto_143872 ) ) ( not ( = ?auto_143870 ?auto_143871 ) ) ( OBJ-AT ?auto_143871 ?auto_143872 ) ( IN-TRUCK ?auto_143870 ?auto_143873 ) ( TRUCK-AT ?auto_143873 ?auto_143872 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_143871 ?auto_143869 )
      ( DELIVER-2PKG-VERIFY ?auto_143870 ?auto_143871 ?auto_143869 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_143883 - OBJ
      ?auto_143884 - OBJ
      ?auto_143882 - LOCATION
    )
    :vars
    (
      ?auto_143887 - LOCATION
      ?auto_143886 - CITY
      ?auto_143885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143887 ?auto_143886 ) ( IN-CITY ?auto_143882 ?auto_143886 ) ( not ( = ?auto_143882 ?auto_143887 ) ) ( not ( = ?auto_143884 ?auto_143883 ) ) ( OBJ-AT ?auto_143883 ?auto_143887 ) ( IN-TRUCK ?auto_143884 ?auto_143885 ) ( TRUCK-AT ?auto_143885 ?auto_143887 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_143884 ?auto_143883 ?auto_143882 )
      ( DELIVER-2PKG-VERIFY ?auto_143883 ?auto_143884 ?auto_143882 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_148471 - OBJ
      ?auto_148472 - OBJ
      ?auto_148473 - OBJ
      ?auto_148470 - LOCATION
    )
    :vars
    (
      ?auto_148474 - TRUCK
      ?auto_148475 - LOCATION
      ?auto_148476 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_148471 ?auto_148474 ) ( TRUCK-AT ?auto_148474 ?auto_148475 ) ( IN-CITY ?auto_148475 ?auto_148476 ) ( IN-CITY ?auto_148470 ?auto_148476 ) ( not ( = ?auto_148470 ?auto_148475 ) ) ( OBJ-AT ?auto_148472 ?auto_148470 ) ( not ( = ?auto_148472 ?auto_148471 ) ) ( OBJ-AT ?auto_148473 ?auto_148470 ) ( not ( = ?auto_148471 ?auto_148473 ) ) ( not ( = ?auto_148472 ?auto_148473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_148472 ?auto_148471 ?auto_148470 )
      ( DELIVER-3PKG-VERIFY ?auto_148471 ?auto_148472 ?auto_148473 ?auto_148470 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150002 - OBJ
      ?auto_150003 - OBJ
      ?auto_150004 - OBJ
      ?auto_150001 - LOCATION
    )
    :vars
    (
      ?auto_150006 - TRUCK
      ?auto_150007 - LOCATION
      ?auto_150005 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_150006 ?auto_150007 ) ( IN-CITY ?auto_150007 ?auto_150005 ) ( IN-CITY ?auto_150001 ?auto_150005 ) ( not ( = ?auto_150001 ?auto_150007 ) ) ( OBJ-AT ?auto_150002 ?auto_150001 ) ( not ( = ?auto_150002 ?auto_150004 ) ) ( OBJ-AT ?auto_150004 ?auto_150007 ) ( OBJ-AT ?auto_150003 ?auto_150001 ) ( not ( = ?auto_150002 ?auto_150003 ) ) ( not ( = ?auto_150003 ?auto_150004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150002 ?auto_150004 ?auto_150001 )
      ( DELIVER-3PKG-VERIFY ?auto_150002 ?auto_150003 ?auto_150004 ?auto_150001 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155092 - OBJ
      ?auto_155093 - OBJ
      ?auto_155094 - OBJ
      ?auto_155091 - LOCATION
    )
    :vars
    (
      ?auto_155097 - LOCATION
      ?auto_155095 - CITY
      ?auto_155096 - TRUCK
      ?auto_155098 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155097 ?auto_155095 ) ( IN-CITY ?auto_155091 ?auto_155095 ) ( not ( = ?auto_155091 ?auto_155097 ) ) ( OBJ-AT ?auto_155092 ?auto_155091 ) ( not ( = ?auto_155092 ?auto_155093 ) ) ( OBJ-AT ?auto_155093 ?auto_155097 ) ( TRUCK-AT ?auto_155096 ?auto_155098 ) ( IN-CITY ?auto_155098 ?auto_155095 ) ( not ( = ?auto_155091 ?auto_155098 ) ) ( not ( = ?auto_155097 ?auto_155098 ) ) ( OBJ-AT ?auto_155094 ?auto_155091 ) ( not ( = ?auto_155092 ?auto_155094 ) ) ( not ( = ?auto_155093 ?auto_155094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155092 ?auto_155093 ?auto_155091 )
      ( DELIVER-3PKG-VERIFY ?auto_155092 ?auto_155093 ?auto_155094 ?auto_155091 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155124 - OBJ
      ?auto_155125 - OBJ
      ?auto_155126 - OBJ
      ?auto_155123 - LOCATION
    )
    :vars
    (
      ?auto_155130 - LOCATION
      ?auto_155127 - CITY
      ?auto_155128 - OBJ
      ?auto_155129 - TRUCK
      ?auto_155131 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155130 ?auto_155127 ) ( IN-CITY ?auto_155123 ?auto_155127 ) ( not ( = ?auto_155123 ?auto_155130 ) ) ( OBJ-AT ?auto_155128 ?auto_155123 ) ( not ( = ?auto_155128 ?auto_155126 ) ) ( OBJ-AT ?auto_155126 ?auto_155130 ) ( TRUCK-AT ?auto_155129 ?auto_155131 ) ( IN-CITY ?auto_155131 ?auto_155127 ) ( not ( = ?auto_155123 ?auto_155131 ) ) ( not ( = ?auto_155130 ?auto_155131 ) ) ( OBJ-AT ?auto_155124 ?auto_155123 ) ( OBJ-AT ?auto_155125 ?auto_155123 ) ( not ( = ?auto_155124 ?auto_155125 ) ) ( not ( = ?auto_155124 ?auto_155126 ) ) ( not ( = ?auto_155124 ?auto_155128 ) ) ( not ( = ?auto_155125 ?auto_155126 ) ) ( not ( = ?auto_155125 ?auto_155128 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155128 ?auto_155126 ?auto_155123 )
      ( DELIVER-3PKG-VERIFY ?auto_155124 ?auto_155125 ?auto_155126 ?auto_155123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155146 - OBJ
      ?auto_155147 - OBJ
      ?auto_155148 - OBJ
      ?auto_155145 - LOCATION
    )
    :vars
    (
      ?auto_155152 - LOCATION
      ?auto_155149 - CITY
      ?auto_155150 - OBJ
      ?auto_155151 - TRUCK
      ?auto_155153 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155152 ?auto_155149 ) ( IN-CITY ?auto_155145 ?auto_155149 ) ( not ( = ?auto_155145 ?auto_155152 ) ) ( OBJ-AT ?auto_155150 ?auto_155145 ) ( not ( = ?auto_155150 ?auto_155147 ) ) ( OBJ-AT ?auto_155147 ?auto_155152 ) ( TRUCK-AT ?auto_155151 ?auto_155153 ) ( IN-CITY ?auto_155153 ?auto_155149 ) ( not ( = ?auto_155145 ?auto_155153 ) ) ( not ( = ?auto_155152 ?auto_155153 ) ) ( OBJ-AT ?auto_155146 ?auto_155145 ) ( OBJ-AT ?auto_155148 ?auto_155145 ) ( not ( = ?auto_155146 ?auto_155147 ) ) ( not ( = ?auto_155146 ?auto_155148 ) ) ( not ( = ?auto_155146 ?auto_155150 ) ) ( not ( = ?auto_155147 ?auto_155148 ) ) ( not ( = ?auto_155148 ?auto_155150 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155150 ?auto_155147 ?auto_155145 )
      ( DELIVER-3PKG-VERIFY ?auto_155146 ?auto_155147 ?auto_155148 ?auto_155145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_155266 - OBJ
      ?auto_155267 - OBJ
      ?auto_155268 - OBJ
      ?auto_155265 - LOCATION
    )
    :vars
    (
      ?auto_155272 - LOCATION
      ?auto_155269 - CITY
      ?auto_155270 - OBJ
      ?auto_155271 - TRUCK
      ?auto_155273 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155272 ?auto_155269 ) ( IN-CITY ?auto_155265 ?auto_155269 ) ( not ( = ?auto_155265 ?auto_155272 ) ) ( OBJ-AT ?auto_155270 ?auto_155265 ) ( not ( = ?auto_155270 ?auto_155266 ) ) ( OBJ-AT ?auto_155266 ?auto_155272 ) ( TRUCK-AT ?auto_155271 ?auto_155273 ) ( IN-CITY ?auto_155273 ?auto_155269 ) ( not ( = ?auto_155265 ?auto_155273 ) ) ( not ( = ?auto_155272 ?auto_155273 ) ) ( OBJ-AT ?auto_155267 ?auto_155265 ) ( OBJ-AT ?auto_155268 ?auto_155265 ) ( not ( = ?auto_155266 ?auto_155267 ) ) ( not ( = ?auto_155266 ?auto_155268 ) ) ( not ( = ?auto_155267 ?auto_155268 ) ) ( not ( = ?auto_155267 ?auto_155270 ) ) ( not ( = ?auto_155268 ?auto_155270 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155270 ?auto_155266 ?auto_155265 )
      ( DELIVER-3PKG-VERIFY ?auto_155266 ?auto_155267 ?auto_155268 ?auto_155265 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155372 - OBJ
      ?auto_155373 - OBJ
      ?auto_155374 - OBJ
      ?auto_155375 - OBJ
      ?auto_155371 - LOCATION
    )
    :vars
    (
      ?auto_155378 - LOCATION
      ?auto_155376 - CITY
      ?auto_155377 - TRUCK
      ?auto_155379 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155378 ?auto_155376 ) ( IN-CITY ?auto_155371 ?auto_155376 ) ( not ( = ?auto_155371 ?auto_155378 ) ) ( OBJ-AT ?auto_155373 ?auto_155371 ) ( not ( = ?auto_155373 ?auto_155375 ) ) ( OBJ-AT ?auto_155375 ?auto_155378 ) ( TRUCK-AT ?auto_155377 ?auto_155379 ) ( IN-CITY ?auto_155379 ?auto_155376 ) ( not ( = ?auto_155371 ?auto_155379 ) ) ( not ( = ?auto_155378 ?auto_155379 ) ) ( OBJ-AT ?auto_155372 ?auto_155371 ) ( OBJ-AT ?auto_155374 ?auto_155371 ) ( not ( = ?auto_155372 ?auto_155373 ) ) ( not ( = ?auto_155372 ?auto_155374 ) ) ( not ( = ?auto_155372 ?auto_155375 ) ) ( not ( = ?auto_155373 ?auto_155374 ) ) ( not ( = ?auto_155374 ?auto_155375 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155373 ?auto_155375 ?auto_155371 )
      ( DELIVER-4PKG-VERIFY ?auto_155372 ?auto_155373 ?auto_155374 ?auto_155375 ?auto_155371 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155399 - OBJ
      ?auto_155400 - OBJ
      ?auto_155401 - OBJ
      ?auto_155402 - OBJ
      ?auto_155398 - LOCATION
    )
    :vars
    (
      ?auto_155405 - LOCATION
      ?auto_155403 - CITY
      ?auto_155404 - TRUCK
      ?auto_155406 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155405 ?auto_155403 ) ( IN-CITY ?auto_155398 ?auto_155403 ) ( not ( = ?auto_155398 ?auto_155405 ) ) ( OBJ-AT ?auto_155400 ?auto_155398 ) ( not ( = ?auto_155400 ?auto_155401 ) ) ( OBJ-AT ?auto_155401 ?auto_155405 ) ( TRUCK-AT ?auto_155404 ?auto_155406 ) ( IN-CITY ?auto_155406 ?auto_155403 ) ( not ( = ?auto_155398 ?auto_155406 ) ) ( not ( = ?auto_155405 ?auto_155406 ) ) ( OBJ-AT ?auto_155399 ?auto_155398 ) ( OBJ-AT ?auto_155402 ?auto_155398 ) ( not ( = ?auto_155399 ?auto_155400 ) ) ( not ( = ?auto_155399 ?auto_155401 ) ) ( not ( = ?auto_155399 ?auto_155402 ) ) ( not ( = ?auto_155400 ?auto_155402 ) ) ( not ( = ?auto_155401 ?auto_155402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155400 ?auto_155401 ?auto_155398 )
      ( DELIVER-4PKG-VERIFY ?auto_155399 ?auto_155400 ?auto_155401 ?auto_155402 ?auto_155398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155426 - OBJ
      ?auto_155427 - OBJ
      ?auto_155428 - OBJ
      ?auto_155429 - OBJ
      ?auto_155425 - LOCATION
    )
    :vars
    (
      ?auto_155432 - LOCATION
      ?auto_155430 - CITY
      ?auto_155431 - TRUCK
      ?auto_155433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155432 ?auto_155430 ) ( IN-CITY ?auto_155425 ?auto_155430 ) ( not ( = ?auto_155425 ?auto_155432 ) ) ( OBJ-AT ?auto_155428 ?auto_155425 ) ( not ( = ?auto_155428 ?auto_155429 ) ) ( OBJ-AT ?auto_155429 ?auto_155432 ) ( TRUCK-AT ?auto_155431 ?auto_155433 ) ( IN-CITY ?auto_155433 ?auto_155430 ) ( not ( = ?auto_155425 ?auto_155433 ) ) ( not ( = ?auto_155432 ?auto_155433 ) ) ( OBJ-AT ?auto_155426 ?auto_155425 ) ( OBJ-AT ?auto_155427 ?auto_155425 ) ( not ( = ?auto_155426 ?auto_155427 ) ) ( not ( = ?auto_155426 ?auto_155428 ) ) ( not ( = ?auto_155426 ?auto_155429 ) ) ( not ( = ?auto_155427 ?auto_155428 ) ) ( not ( = ?auto_155427 ?auto_155429 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155428 ?auto_155429 ?auto_155425 )
      ( DELIVER-4PKG-VERIFY ?auto_155426 ?auto_155427 ?auto_155428 ?auto_155429 ?auto_155425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155561 - OBJ
      ?auto_155562 - OBJ
      ?auto_155563 - OBJ
      ?auto_155564 - OBJ
      ?auto_155560 - LOCATION
    )
    :vars
    (
      ?auto_155567 - LOCATION
      ?auto_155565 - CITY
      ?auto_155566 - TRUCK
      ?auto_155568 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155567 ?auto_155565 ) ( IN-CITY ?auto_155560 ?auto_155565 ) ( not ( = ?auto_155560 ?auto_155567 ) ) ( OBJ-AT ?auto_155563 ?auto_155560 ) ( not ( = ?auto_155563 ?auto_155562 ) ) ( OBJ-AT ?auto_155562 ?auto_155567 ) ( TRUCK-AT ?auto_155566 ?auto_155568 ) ( IN-CITY ?auto_155568 ?auto_155565 ) ( not ( = ?auto_155560 ?auto_155568 ) ) ( not ( = ?auto_155567 ?auto_155568 ) ) ( OBJ-AT ?auto_155561 ?auto_155560 ) ( OBJ-AT ?auto_155564 ?auto_155560 ) ( not ( = ?auto_155561 ?auto_155562 ) ) ( not ( = ?auto_155561 ?auto_155563 ) ) ( not ( = ?auto_155561 ?auto_155564 ) ) ( not ( = ?auto_155562 ?auto_155564 ) ) ( not ( = ?auto_155563 ?auto_155564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155563 ?auto_155562 ?auto_155560 )
      ( DELIVER-4PKG-VERIFY ?auto_155561 ?auto_155562 ?auto_155563 ?auto_155564 ?auto_155560 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155768 - OBJ
      ?auto_155769 - OBJ
      ?auto_155770 - OBJ
      ?auto_155771 - OBJ
      ?auto_155767 - LOCATION
    )
    :vars
    (
      ?auto_155775 - LOCATION
      ?auto_155772 - CITY
      ?auto_155773 - OBJ
      ?auto_155774 - TRUCK
      ?auto_155776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155775 ?auto_155772 ) ( IN-CITY ?auto_155767 ?auto_155772 ) ( not ( = ?auto_155767 ?auto_155775 ) ) ( OBJ-AT ?auto_155773 ?auto_155767 ) ( not ( = ?auto_155773 ?auto_155771 ) ) ( OBJ-AT ?auto_155771 ?auto_155775 ) ( TRUCK-AT ?auto_155774 ?auto_155776 ) ( IN-CITY ?auto_155776 ?auto_155772 ) ( not ( = ?auto_155767 ?auto_155776 ) ) ( not ( = ?auto_155775 ?auto_155776 ) ) ( OBJ-AT ?auto_155768 ?auto_155767 ) ( OBJ-AT ?auto_155769 ?auto_155767 ) ( OBJ-AT ?auto_155770 ?auto_155767 ) ( not ( = ?auto_155768 ?auto_155769 ) ) ( not ( = ?auto_155768 ?auto_155770 ) ) ( not ( = ?auto_155768 ?auto_155771 ) ) ( not ( = ?auto_155768 ?auto_155773 ) ) ( not ( = ?auto_155769 ?auto_155770 ) ) ( not ( = ?auto_155769 ?auto_155771 ) ) ( not ( = ?auto_155769 ?auto_155773 ) ) ( not ( = ?auto_155770 ?auto_155771 ) ) ( not ( = ?auto_155770 ?auto_155773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155773 ?auto_155771 ?auto_155767 )
      ( DELIVER-4PKG-VERIFY ?auto_155768 ?auto_155769 ?auto_155770 ?auto_155771 ?auto_155767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155788 - OBJ
      ?auto_155789 - OBJ
      ?auto_155790 - OBJ
      ?auto_155791 - OBJ
      ?auto_155787 - LOCATION
    )
    :vars
    (
      ?auto_155794 - LOCATION
      ?auto_155792 - CITY
      ?auto_155793 - TRUCK
      ?auto_155795 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155794 ?auto_155792 ) ( IN-CITY ?auto_155787 ?auto_155792 ) ( not ( = ?auto_155787 ?auto_155794 ) ) ( OBJ-AT ?auto_155791 ?auto_155787 ) ( not ( = ?auto_155791 ?auto_155790 ) ) ( OBJ-AT ?auto_155790 ?auto_155794 ) ( TRUCK-AT ?auto_155793 ?auto_155795 ) ( IN-CITY ?auto_155795 ?auto_155792 ) ( not ( = ?auto_155787 ?auto_155795 ) ) ( not ( = ?auto_155794 ?auto_155795 ) ) ( OBJ-AT ?auto_155788 ?auto_155787 ) ( OBJ-AT ?auto_155789 ?auto_155787 ) ( not ( = ?auto_155788 ?auto_155789 ) ) ( not ( = ?auto_155788 ?auto_155790 ) ) ( not ( = ?auto_155788 ?auto_155791 ) ) ( not ( = ?auto_155789 ?auto_155790 ) ) ( not ( = ?auto_155789 ?auto_155791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155791 ?auto_155790 ?auto_155787 )
      ( DELIVER-4PKG-VERIFY ?auto_155788 ?auto_155789 ?auto_155790 ?auto_155791 ?auto_155787 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155797 - OBJ
      ?auto_155798 - OBJ
      ?auto_155799 - OBJ
      ?auto_155800 - OBJ
      ?auto_155796 - LOCATION
    )
    :vars
    (
      ?auto_155804 - LOCATION
      ?auto_155801 - CITY
      ?auto_155802 - OBJ
      ?auto_155803 - TRUCK
      ?auto_155805 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155804 ?auto_155801 ) ( IN-CITY ?auto_155796 ?auto_155801 ) ( not ( = ?auto_155796 ?auto_155804 ) ) ( OBJ-AT ?auto_155802 ?auto_155796 ) ( not ( = ?auto_155802 ?auto_155799 ) ) ( OBJ-AT ?auto_155799 ?auto_155804 ) ( TRUCK-AT ?auto_155803 ?auto_155805 ) ( IN-CITY ?auto_155805 ?auto_155801 ) ( not ( = ?auto_155796 ?auto_155805 ) ) ( not ( = ?auto_155804 ?auto_155805 ) ) ( OBJ-AT ?auto_155797 ?auto_155796 ) ( OBJ-AT ?auto_155798 ?auto_155796 ) ( OBJ-AT ?auto_155800 ?auto_155796 ) ( not ( = ?auto_155797 ?auto_155798 ) ) ( not ( = ?auto_155797 ?auto_155799 ) ) ( not ( = ?auto_155797 ?auto_155800 ) ) ( not ( = ?auto_155797 ?auto_155802 ) ) ( not ( = ?auto_155798 ?auto_155799 ) ) ( not ( = ?auto_155798 ?auto_155800 ) ) ( not ( = ?auto_155798 ?auto_155802 ) ) ( not ( = ?auto_155799 ?auto_155800 ) ) ( not ( = ?auto_155800 ?auto_155802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155802 ?auto_155799 ?auto_155796 )
      ( DELIVER-4PKG-VERIFY ?auto_155797 ?auto_155798 ?auto_155799 ?auto_155800 ?auto_155796 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_155940 - OBJ
      ?auto_155941 - OBJ
      ?auto_155942 - OBJ
      ?auto_155943 - OBJ
      ?auto_155939 - LOCATION
    )
    :vars
    (
      ?auto_155947 - LOCATION
      ?auto_155944 - CITY
      ?auto_155945 - OBJ
      ?auto_155946 - TRUCK
      ?auto_155948 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_155947 ?auto_155944 ) ( IN-CITY ?auto_155939 ?auto_155944 ) ( not ( = ?auto_155939 ?auto_155947 ) ) ( OBJ-AT ?auto_155945 ?auto_155939 ) ( not ( = ?auto_155945 ?auto_155941 ) ) ( OBJ-AT ?auto_155941 ?auto_155947 ) ( TRUCK-AT ?auto_155946 ?auto_155948 ) ( IN-CITY ?auto_155948 ?auto_155944 ) ( not ( = ?auto_155939 ?auto_155948 ) ) ( not ( = ?auto_155947 ?auto_155948 ) ) ( OBJ-AT ?auto_155940 ?auto_155939 ) ( OBJ-AT ?auto_155942 ?auto_155939 ) ( OBJ-AT ?auto_155943 ?auto_155939 ) ( not ( = ?auto_155940 ?auto_155941 ) ) ( not ( = ?auto_155940 ?auto_155942 ) ) ( not ( = ?auto_155940 ?auto_155943 ) ) ( not ( = ?auto_155940 ?auto_155945 ) ) ( not ( = ?auto_155941 ?auto_155942 ) ) ( not ( = ?auto_155941 ?auto_155943 ) ) ( not ( = ?auto_155942 ?auto_155943 ) ) ( not ( = ?auto_155942 ?auto_155945 ) ) ( not ( = ?auto_155943 ?auto_155945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_155945 ?auto_155941 ?auto_155939 )
      ( DELIVER-4PKG-VERIFY ?auto_155940 ?auto_155941 ?auto_155942 ?auto_155943 ?auto_155939 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156436 - OBJ
      ?auto_156437 - OBJ
      ?auto_156438 - OBJ
      ?auto_156439 - OBJ
      ?auto_156435 - LOCATION
    )
    :vars
    (
      ?auto_156442 - LOCATION
      ?auto_156440 - CITY
      ?auto_156441 - TRUCK
      ?auto_156443 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156442 ?auto_156440 ) ( IN-CITY ?auto_156435 ?auto_156440 ) ( not ( = ?auto_156435 ?auto_156442 ) ) ( OBJ-AT ?auto_156439 ?auto_156435 ) ( not ( = ?auto_156439 ?auto_156436 ) ) ( OBJ-AT ?auto_156436 ?auto_156442 ) ( TRUCK-AT ?auto_156441 ?auto_156443 ) ( IN-CITY ?auto_156443 ?auto_156440 ) ( not ( = ?auto_156435 ?auto_156443 ) ) ( not ( = ?auto_156442 ?auto_156443 ) ) ( OBJ-AT ?auto_156437 ?auto_156435 ) ( OBJ-AT ?auto_156438 ?auto_156435 ) ( not ( = ?auto_156436 ?auto_156437 ) ) ( not ( = ?auto_156436 ?auto_156438 ) ) ( not ( = ?auto_156437 ?auto_156438 ) ) ( not ( = ?auto_156437 ?auto_156439 ) ) ( not ( = ?auto_156438 ?auto_156439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156439 ?auto_156436 ?auto_156435 )
      ( DELIVER-4PKG-VERIFY ?auto_156436 ?auto_156437 ?auto_156438 ?auto_156439 ?auto_156435 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156445 - OBJ
      ?auto_156446 - OBJ
      ?auto_156447 - OBJ
      ?auto_156448 - OBJ
      ?auto_156444 - LOCATION
    )
    :vars
    (
      ?auto_156451 - LOCATION
      ?auto_156449 - CITY
      ?auto_156450 - TRUCK
      ?auto_156452 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156451 ?auto_156449 ) ( IN-CITY ?auto_156444 ?auto_156449 ) ( not ( = ?auto_156444 ?auto_156451 ) ) ( OBJ-AT ?auto_156446 ?auto_156444 ) ( not ( = ?auto_156446 ?auto_156445 ) ) ( OBJ-AT ?auto_156445 ?auto_156451 ) ( TRUCK-AT ?auto_156450 ?auto_156452 ) ( IN-CITY ?auto_156452 ?auto_156449 ) ( not ( = ?auto_156444 ?auto_156452 ) ) ( not ( = ?auto_156451 ?auto_156452 ) ) ( OBJ-AT ?auto_156447 ?auto_156444 ) ( OBJ-AT ?auto_156448 ?auto_156444 ) ( not ( = ?auto_156445 ?auto_156447 ) ) ( not ( = ?auto_156445 ?auto_156448 ) ) ( not ( = ?auto_156446 ?auto_156447 ) ) ( not ( = ?auto_156446 ?auto_156448 ) ) ( not ( = ?auto_156447 ?auto_156448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156446 ?auto_156445 ?auto_156444 )
      ( DELIVER-4PKG-VERIFY ?auto_156445 ?auto_156446 ?auto_156447 ?auto_156448 ?auto_156444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156589 - OBJ
      ?auto_156590 - OBJ
      ?auto_156591 - OBJ
      ?auto_156592 - OBJ
      ?auto_156588 - LOCATION
    )
    :vars
    (
      ?auto_156596 - LOCATION
      ?auto_156593 - CITY
      ?auto_156594 - OBJ
      ?auto_156595 - TRUCK
      ?auto_156597 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156596 ?auto_156593 ) ( IN-CITY ?auto_156588 ?auto_156593 ) ( not ( = ?auto_156588 ?auto_156596 ) ) ( OBJ-AT ?auto_156594 ?auto_156588 ) ( not ( = ?auto_156594 ?auto_156589 ) ) ( OBJ-AT ?auto_156589 ?auto_156596 ) ( TRUCK-AT ?auto_156595 ?auto_156597 ) ( IN-CITY ?auto_156597 ?auto_156593 ) ( not ( = ?auto_156588 ?auto_156597 ) ) ( not ( = ?auto_156596 ?auto_156597 ) ) ( OBJ-AT ?auto_156590 ?auto_156588 ) ( OBJ-AT ?auto_156591 ?auto_156588 ) ( OBJ-AT ?auto_156592 ?auto_156588 ) ( not ( = ?auto_156589 ?auto_156590 ) ) ( not ( = ?auto_156589 ?auto_156591 ) ) ( not ( = ?auto_156589 ?auto_156592 ) ) ( not ( = ?auto_156590 ?auto_156591 ) ) ( not ( = ?auto_156590 ?auto_156592 ) ) ( not ( = ?auto_156590 ?auto_156594 ) ) ( not ( = ?auto_156591 ?auto_156592 ) ) ( not ( = ?auto_156591 ?auto_156594 ) ) ( not ( = ?auto_156592 ?auto_156594 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156594 ?auto_156589 ?auto_156588 )
      ( DELIVER-4PKG-VERIFY ?auto_156589 ?auto_156590 ?auto_156591 ?auto_156592 ?auto_156588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_159152 - OBJ
      ?auto_159153 - OBJ
      ?auto_159154 - OBJ
      ?auto_159151 - LOCATION
    )
    :vars
    (
      ?auto_159157 - LOCATION
      ?auto_159155 - CITY
      ?auto_159156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_159157 ?auto_159155 ) ( IN-CITY ?auto_159151 ?auto_159155 ) ( not ( = ?auto_159151 ?auto_159157 ) ) ( OBJ-AT ?auto_159153 ?auto_159151 ) ( not ( = ?auto_159153 ?auto_159152 ) ) ( OBJ-AT ?auto_159152 ?auto_159157 ) ( TRUCK-AT ?auto_159156 ?auto_159151 ) ( OBJ-AT ?auto_159154 ?auto_159151 ) ( not ( = ?auto_159152 ?auto_159154 ) ) ( not ( = ?auto_159153 ?auto_159154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_159153 ?auto_159152 ?auto_159151 )
      ( DELIVER-3PKG-VERIFY ?auto_159152 ?auto_159153 ?auto_159154 ?auto_159151 ) )
  )

)

