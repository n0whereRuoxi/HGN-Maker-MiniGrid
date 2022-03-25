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
      ?auto_55366 - OBJ
      ?auto_55365 - LOCATION
    )
    :vars
    (
      ?auto_55367 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55367 ?auto_55365 ) ( IN-TRUCK ?auto_55366 ?auto_55367 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_55366 ?auto_55367 ?auto_55365 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55384 - OBJ
      ?auto_55383 - LOCATION
    )
    :vars
    (
      ?auto_55385 - TRUCK
      ?auto_55386 - LOCATION
      ?auto_55387 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55384 ?auto_55385 ) ( TRUCK-AT ?auto_55385 ?auto_55386 ) ( IN-CITY ?auto_55386 ?auto_55387 ) ( IN-CITY ?auto_55383 ?auto_55387 ) ( not ( = ?auto_55383 ?auto_55386 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55385 ?auto_55386 ?auto_55383 ?auto_55387 )
      ( DELIVER-1PKG ?auto_55384 ?auto_55383 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55410 - OBJ
      ?auto_55409 - LOCATION
    )
    :vars
    (
      ?auto_55412 - TRUCK
      ?auto_55411 - LOCATION
      ?auto_55413 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55412 ?auto_55411 ) ( IN-CITY ?auto_55411 ?auto_55413 ) ( IN-CITY ?auto_55409 ?auto_55413 ) ( not ( = ?auto_55409 ?auto_55411 ) ) ( OBJ-AT ?auto_55410 ?auto_55411 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55410 ?auto_55412 ?auto_55411 )
      ( DELIVER-1PKG ?auto_55410 ?auto_55409 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55436 - OBJ
      ?auto_55435 - LOCATION
    )
    :vars
    (
      ?auto_55437 - LOCATION
      ?auto_55438 - CITY
      ?auto_55439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55437 ?auto_55438 ) ( IN-CITY ?auto_55435 ?auto_55438 ) ( not ( = ?auto_55435 ?auto_55437 ) ) ( OBJ-AT ?auto_55436 ?auto_55437 ) ( TRUCK-AT ?auto_55439 ?auto_55435 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55439 ?auto_55435 ?auto_55437 ?auto_55438 )
      ( DELIVER-1PKG ?auto_55436 ?auto_55435 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55579 - OBJ
      ?auto_55580 - OBJ
      ?auto_55578 - LOCATION
    )
    :vars
    (
      ?auto_55581 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55581 ?auto_55578 ) ( IN-TRUCK ?auto_55580 ?auto_55581 ) ( OBJ-AT ?auto_55579 ?auto_55578 ) ( not ( = ?auto_55579 ?auto_55580 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55580 ?auto_55578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55583 - OBJ
      ?auto_55584 - OBJ
      ?auto_55582 - LOCATION
    )
    :vars
    (
      ?auto_55585 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55585 ?auto_55582 ) ( IN-TRUCK ?auto_55583 ?auto_55585 ) ( OBJ-AT ?auto_55584 ?auto_55582 ) ( not ( = ?auto_55583 ?auto_55584 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55583 ?auto_55582 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55591 - OBJ
      ?auto_55592 - OBJ
      ?auto_55593 - OBJ
      ?auto_55590 - LOCATION
    )
    :vars
    (
      ?auto_55594 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55594 ?auto_55590 ) ( IN-TRUCK ?auto_55593 ?auto_55594 ) ( OBJ-AT ?auto_55591 ?auto_55590 ) ( OBJ-AT ?auto_55592 ?auto_55590 ) ( not ( = ?auto_55591 ?auto_55592 ) ) ( not ( = ?auto_55591 ?auto_55593 ) ) ( not ( = ?auto_55592 ?auto_55593 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55593 ?auto_55590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55596 - OBJ
      ?auto_55597 - OBJ
      ?auto_55598 - OBJ
      ?auto_55595 - LOCATION
    )
    :vars
    (
      ?auto_55599 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55599 ?auto_55595 ) ( IN-TRUCK ?auto_55597 ?auto_55599 ) ( OBJ-AT ?auto_55596 ?auto_55595 ) ( OBJ-AT ?auto_55598 ?auto_55595 ) ( not ( = ?auto_55596 ?auto_55597 ) ) ( not ( = ?auto_55596 ?auto_55598 ) ) ( not ( = ?auto_55597 ?auto_55598 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55597 ?auto_55595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55606 - OBJ
      ?auto_55607 - OBJ
      ?auto_55608 - OBJ
      ?auto_55605 - LOCATION
    )
    :vars
    (
      ?auto_55609 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55609 ?auto_55605 ) ( IN-TRUCK ?auto_55606 ?auto_55609 ) ( OBJ-AT ?auto_55607 ?auto_55605 ) ( OBJ-AT ?auto_55608 ?auto_55605 ) ( not ( = ?auto_55606 ?auto_55607 ) ) ( not ( = ?auto_55606 ?auto_55608 ) ) ( not ( = ?auto_55607 ?auto_55608 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55606 ?auto_55605 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55626 - OBJ
      ?auto_55627 - OBJ
      ?auto_55628 - OBJ
      ?auto_55629 - OBJ
      ?auto_55625 - LOCATION
    )
    :vars
    (
      ?auto_55630 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55630 ?auto_55625 ) ( IN-TRUCK ?auto_55629 ?auto_55630 ) ( OBJ-AT ?auto_55626 ?auto_55625 ) ( OBJ-AT ?auto_55627 ?auto_55625 ) ( OBJ-AT ?auto_55628 ?auto_55625 ) ( not ( = ?auto_55626 ?auto_55627 ) ) ( not ( = ?auto_55626 ?auto_55628 ) ) ( not ( = ?auto_55626 ?auto_55629 ) ) ( not ( = ?auto_55627 ?auto_55628 ) ) ( not ( = ?auto_55627 ?auto_55629 ) ) ( not ( = ?auto_55628 ?auto_55629 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55629 ?auto_55625 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55632 - OBJ
      ?auto_55633 - OBJ
      ?auto_55634 - OBJ
      ?auto_55635 - OBJ
      ?auto_55631 - LOCATION
    )
    :vars
    (
      ?auto_55636 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55636 ?auto_55631 ) ( IN-TRUCK ?auto_55634 ?auto_55636 ) ( OBJ-AT ?auto_55632 ?auto_55631 ) ( OBJ-AT ?auto_55633 ?auto_55631 ) ( OBJ-AT ?auto_55635 ?auto_55631 ) ( not ( = ?auto_55632 ?auto_55633 ) ) ( not ( = ?auto_55632 ?auto_55634 ) ) ( not ( = ?auto_55632 ?auto_55635 ) ) ( not ( = ?auto_55633 ?auto_55634 ) ) ( not ( = ?auto_55633 ?auto_55635 ) ) ( not ( = ?auto_55634 ?auto_55635 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55634 ?auto_55631 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55644 - OBJ
      ?auto_55645 - OBJ
      ?auto_55646 - OBJ
      ?auto_55647 - OBJ
      ?auto_55643 - LOCATION
    )
    :vars
    (
      ?auto_55648 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55648 ?auto_55643 ) ( IN-TRUCK ?auto_55645 ?auto_55648 ) ( OBJ-AT ?auto_55644 ?auto_55643 ) ( OBJ-AT ?auto_55646 ?auto_55643 ) ( OBJ-AT ?auto_55647 ?auto_55643 ) ( not ( = ?auto_55644 ?auto_55645 ) ) ( not ( = ?auto_55644 ?auto_55646 ) ) ( not ( = ?auto_55644 ?auto_55647 ) ) ( not ( = ?auto_55645 ?auto_55646 ) ) ( not ( = ?auto_55645 ?auto_55647 ) ) ( not ( = ?auto_55646 ?auto_55647 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55645 ?auto_55643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55668 - OBJ
      ?auto_55669 - OBJ
      ?auto_55670 - OBJ
      ?auto_55671 - OBJ
      ?auto_55667 - LOCATION
    )
    :vars
    (
      ?auto_55672 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55672 ?auto_55667 ) ( IN-TRUCK ?auto_55668 ?auto_55672 ) ( OBJ-AT ?auto_55669 ?auto_55667 ) ( OBJ-AT ?auto_55670 ?auto_55667 ) ( OBJ-AT ?auto_55671 ?auto_55667 ) ( not ( = ?auto_55668 ?auto_55669 ) ) ( not ( = ?auto_55668 ?auto_55670 ) ) ( not ( = ?auto_55668 ?auto_55671 ) ) ( not ( = ?auto_55669 ?auto_55670 ) ) ( not ( = ?auto_55669 ?auto_55671 ) ) ( not ( = ?auto_55670 ?auto_55671 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55668 ?auto_55667 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55721 - OBJ
      ?auto_55722 - OBJ
      ?auto_55720 - LOCATION
    )
    :vars
    (
      ?auto_55725 - TRUCK
      ?auto_55724 - LOCATION
      ?auto_55723 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55722 ?auto_55725 ) ( TRUCK-AT ?auto_55725 ?auto_55724 ) ( IN-CITY ?auto_55724 ?auto_55723 ) ( IN-CITY ?auto_55720 ?auto_55723 ) ( not ( = ?auto_55720 ?auto_55724 ) ) ( OBJ-AT ?auto_55721 ?auto_55720 ) ( not ( = ?auto_55721 ?auto_55722 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55722 ?auto_55720 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55727 - OBJ
      ?auto_55728 - OBJ
      ?auto_55726 - LOCATION
    )
    :vars
    (
      ?auto_55730 - TRUCK
      ?auto_55729 - LOCATION
      ?auto_55731 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55727 ?auto_55730 ) ( TRUCK-AT ?auto_55730 ?auto_55729 ) ( IN-CITY ?auto_55729 ?auto_55731 ) ( IN-CITY ?auto_55726 ?auto_55731 ) ( not ( = ?auto_55726 ?auto_55729 ) ) ( OBJ-AT ?auto_55728 ?auto_55726 ) ( not ( = ?auto_55728 ?auto_55727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55728 ?auto_55727 ?auto_55726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55740 - OBJ
      ?auto_55741 - OBJ
      ?auto_55742 - OBJ
      ?auto_55739 - LOCATION
    )
    :vars
    (
      ?auto_55744 - TRUCK
      ?auto_55743 - LOCATION
      ?auto_55745 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55742 ?auto_55744 ) ( TRUCK-AT ?auto_55744 ?auto_55743 ) ( IN-CITY ?auto_55743 ?auto_55745 ) ( IN-CITY ?auto_55739 ?auto_55745 ) ( not ( = ?auto_55739 ?auto_55743 ) ) ( OBJ-AT ?auto_55741 ?auto_55739 ) ( not ( = ?auto_55741 ?auto_55742 ) ) ( OBJ-AT ?auto_55740 ?auto_55739 ) ( not ( = ?auto_55740 ?auto_55741 ) ) ( not ( = ?auto_55740 ?auto_55742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55741 ?auto_55742 ?auto_55739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55747 - OBJ
      ?auto_55748 - OBJ
      ?auto_55749 - OBJ
      ?auto_55746 - LOCATION
    )
    :vars
    (
      ?auto_55751 - TRUCK
      ?auto_55750 - LOCATION
      ?auto_55752 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55748 ?auto_55751 ) ( TRUCK-AT ?auto_55751 ?auto_55750 ) ( IN-CITY ?auto_55750 ?auto_55752 ) ( IN-CITY ?auto_55746 ?auto_55752 ) ( not ( = ?auto_55746 ?auto_55750 ) ) ( OBJ-AT ?auto_55749 ?auto_55746 ) ( not ( = ?auto_55749 ?auto_55748 ) ) ( OBJ-AT ?auto_55747 ?auto_55746 ) ( not ( = ?auto_55747 ?auto_55748 ) ) ( not ( = ?auto_55747 ?auto_55749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55749 ?auto_55748 ?auto_55746 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55761 - OBJ
      ?auto_55762 - OBJ
      ?auto_55763 - OBJ
      ?auto_55760 - LOCATION
    )
    :vars
    (
      ?auto_55765 - TRUCK
      ?auto_55764 - LOCATION
      ?auto_55766 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55761 ?auto_55765 ) ( TRUCK-AT ?auto_55765 ?auto_55764 ) ( IN-CITY ?auto_55764 ?auto_55766 ) ( IN-CITY ?auto_55760 ?auto_55766 ) ( not ( = ?auto_55760 ?auto_55764 ) ) ( OBJ-AT ?auto_55762 ?auto_55760 ) ( not ( = ?auto_55762 ?auto_55761 ) ) ( OBJ-AT ?auto_55763 ?auto_55760 ) ( not ( = ?auto_55761 ?auto_55763 ) ) ( not ( = ?auto_55762 ?auto_55763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55762 ?auto_55761 ?auto_55760 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55790 - OBJ
      ?auto_55791 - OBJ
      ?auto_55792 - OBJ
      ?auto_55793 - OBJ
      ?auto_55789 - LOCATION
    )
    :vars
    (
      ?auto_55795 - TRUCK
      ?auto_55794 - LOCATION
      ?auto_55796 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55793 ?auto_55795 ) ( TRUCK-AT ?auto_55795 ?auto_55794 ) ( IN-CITY ?auto_55794 ?auto_55796 ) ( IN-CITY ?auto_55789 ?auto_55796 ) ( not ( = ?auto_55789 ?auto_55794 ) ) ( OBJ-AT ?auto_55791 ?auto_55789 ) ( not ( = ?auto_55791 ?auto_55793 ) ) ( OBJ-AT ?auto_55790 ?auto_55789 ) ( OBJ-AT ?auto_55792 ?auto_55789 ) ( not ( = ?auto_55790 ?auto_55791 ) ) ( not ( = ?auto_55790 ?auto_55792 ) ) ( not ( = ?auto_55790 ?auto_55793 ) ) ( not ( = ?auto_55791 ?auto_55792 ) ) ( not ( = ?auto_55792 ?auto_55793 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55791 ?auto_55793 ?auto_55789 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55798 - OBJ
      ?auto_55799 - OBJ
      ?auto_55800 - OBJ
      ?auto_55801 - OBJ
      ?auto_55797 - LOCATION
    )
    :vars
    (
      ?auto_55803 - TRUCK
      ?auto_55802 - LOCATION
      ?auto_55804 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55800 ?auto_55803 ) ( TRUCK-AT ?auto_55803 ?auto_55802 ) ( IN-CITY ?auto_55802 ?auto_55804 ) ( IN-CITY ?auto_55797 ?auto_55804 ) ( not ( = ?auto_55797 ?auto_55802 ) ) ( OBJ-AT ?auto_55798 ?auto_55797 ) ( not ( = ?auto_55798 ?auto_55800 ) ) ( OBJ-AT ?auto_55799 ?auto_55797 ) ( OBJ-AT ?auto_55801 ?auto_55797 ) ( not ( = ?auto_55798 ?auto_55799 ) ) ( not ( = ?auto_55798 ?auto_55801 ) ) ( not ( = ?auto_55799 ?auto_55800 ) ) ( not ( = ?auto_55799 ?auto_55801 ) ) ( not ( = ?auto_55800 ?auto_55801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55798 ?auto_55800 ?auto_55797 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55814 - OBJ
      ?auto_55815 - OBJ
      ?auto_55816 - OBJ
      ?auto_55817 - OBJ
      ?auto_55813 - LOCATION
    )
    :vars
    (
      ?auto_55819 - TRUCK
      ?auto_55818 - LOCATION
      ?auto_55820 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55815 ?auto_55819 ) ( TRUCK-AT ?auto_55819 ?auto_55818 ) ( IN-CITY ?auto_55818 ?auto_55820 ) ( IN-CITY ?auto_55813 ?auto_55820 ) ( not ( = ?auto_55813 ?auto_55818 ) ) ( OBJ-AT ?auto_55816 ?auto_55813 ) ( not ( = ?auto_55816 ?auto_55815 ) ) ( OBJ-AT ?auto_55814 ?auto_55813 ) ( OBJ-AT ?auto_55817 ?auto_55813 ) ( not ( = ?auto_55814 ?auto_55815 ) ) ( not ( = ?auto_55814 ?auto_55816 ) ) ( not ( = ?auto_55814 ?auto_55817 ) ) ( not ( = ?auto_55815 ?auto_55817 ) ) ( not ( = ?auto_55816 ?auto_55817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55816 ?auto_55815 ?auto_55813 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55846 - OBJ
      ?auto_55847 - OBJ
      ?auto_55848 - OBJ
      ?auto_55849 - OBJ
      ?auto_55845 - LOCATION
    )
    :vars
    (
      ?auto_55851 - TRUCK
      ?auto_55850 - LOCATION
      ?auto_55852 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55846 ?auto_55851 ) ( TRUCK-AT ?auto_55851 ?auto_55850 ) ( IN-CITY ?auto_55850 ?auto_55852 ) ( IN-CITY ?auto_55845 ?auto_55852 ) ( not ( = ?auto_55845 ?auto_55850 ) ) ( OBJ-AT ?auto_55848 ?auto_55845 ) ( not ( = ?auto_55848 ?auto_55846 ) ) ( OBJ-AT ?auto_55847 ?auto_55845 ) ( OBJ-AT ?auto_55849 ?auto_55845 ) ( not ( = ?auto_55846 ?auto_55847 ) ) ( not ( = ?auto_55846 ?auto_55849 ) ) ( not ( = ?auto_55847 ?auto_55848 ) ) ( not ( = ?auto_55847 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55848 ?auto_55846 ?auto_55845 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55911 - OBJ
      ?auto_55910 - LOCATION
    )
    :vars
    (
      ?auto_55914 - TRUCK
      ?auto_55913 - LOCATION
      ?auto_55915 - CITY
      ?auto_55912 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55914 ?auto_55913 ) ( IN-CITY ?auto_55913 ?auto_55915 ) ( IN-CITY ?auto_55910 ?auto_55915 ) ( not ( = ?auto_55910 ?auto_55913 ) ) ( OBJ-AT ?auto_55912 ?auto_55910 ) ( not ( = ?auto_55912 ?auto_55911 ) ) ( OBJ-AT ?auto_55911 ?auto_55913 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55911 ?auto_55914 ?auto_55913 )
      ( DELIVER-2PKG ?auto_55912 ?auto_55911 ?auto_55910 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55917 - OBJ
      ?auto_55918 - OBJ
      ?auto_55916 - LOCATION
    )
    :vars
    (
      ?auto_55919 - TRUCK
      ?auto_55921 - LOCATION
      ?auto_55920 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55919 ?auto_55921 ) ( IN-CITY ?auto_55921 ?auto_55920 ) ( IN-CITY ?auto_55916 ?auto_55920 ) ( not ( = ?auto_55916 ?auto_55921 ) ) ( OBJ-AT ?auto_55917 ?auto_55916 ) ( not ( = ?auto_55917 ?auto_55918 ) ) ( OBJ-AT ?auto_55918 ?auto_55921 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55918 ?auto_55916 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55923 - OBJ
      ?auto_55924 - OBJ
      ?auto_55922 - LOCATION
    )
    :vars
    (
      ?auto_55926 - TRUCK
      ?auto_55927 - LOCATION
      ?auto_55925 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55926 ?auto_55927 ) ( IN-CITY ?auto_55927 ?auto_55925 ) ( IN-CITY ?auto_55922 ?auto_55925 ) ( not ( = ?auto_55922 ?auto_55927 ) ) ( OBJ-AT ?auto_55924 ?auto_55922 ) ( not ( = ?auto_55924 ?auto_55923 ) ) ( OBJ-AT ?auto_55923 ?auto_55927 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55924 ?auto_55923 ?auto_55922 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55936 - OBJ
      ?auto_55937 - OBJ
      ?auto_55938 - OBJ
      ?auto_55935 - LOCATION
    )
    :vars
    (
      ?auto_55940 - TRUCK
      ?auto_55941 - LOCATION
      ?auto_55939 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55940 ?auto_55941 ) ( IN-CITY ?auto_55941 ?auto_55939 ) ( IN-CITY ?auto_55935 ?auto_55939 ) ( not ( = ?auto_55935 ?auto_55941 ) ) ( OBJ-AT ?auto_55936 ?auto_55935 ) ( not ( = ?auto_55936 ?auto_55938 ) ) ( OBJ-AT ?auto_55938 ?auto_55941 ) ( OBJ-AT ?auto_55937 ?auto_55935 ) ( not ( = ?auto_55936 ?auto_55937 ) ) ( not ( = ?auto_55937 ?auto_55938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55936 ?auto_55938 ?auto_55935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55943 - OBJ
      ?auto_55944 - OBJ
      ?auto_55945 - OBJ
      ?auto_55942 - LOCATION
    )
    :vars
    (
      ?auto_55947 - TRUCK
      ?auto_55948 - LOCATION
      ?auto_55946 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55947 ?auto_55948 ) ( IN-CITY ?auto_55948 ?auto_55946 ) ( IN-CITY ?auto_55942 ?auto_55946 ) ( not ( = ?auto_55942 ?auto_55948 ) ) ( OBJ-AT ?auto_55943 ?auto_55942 ) ( not ( = ?auto_55943 ?auto_55944 ) ) ( OBJ-AT ?auto_55944 ?auto_55948 ) ( OBJ-AT ?auto_55945 ?auto_55942 ) ( not ( = ?auto_55943 ?auto_55945 ) ) ( not ( = ?auto_55944 ?auto_55945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55943 ?auto_55944 ?auto_55942 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55957 - OBJ
      ?auto_55958 - OBJ
      ?auto_55959 - OBJ
      ?auto_55956 - LOCATION
    )
    :vars
    (
      ?auto_55961 - TRUCK
      ?auto_55962 - LOCATION
      ?auto_55960 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55961 ?auto_55962 ) ( IN-CITY ?auto_55962 ?auto_55960 ) ( IN-CITY ?auto_55956 ?auto_55960 ) ( not ( = ?auto_55956 ?auto_55962 ) ) ( OBJ-AT ?auto_55959 ?auto_55956 ) ( not ( = ?auto_55959 ?auto_55957 ) ) ( OBJ-AT ?auto_55957 ?auto_55962 ) ( OBJ-AT ?auto_55958 ?auto_55956 ) ( not ( = ?auto_55957 ?auto_55958 ) ) ( not ( = ?auto_55958 ?auto_55959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55959 ?auto_55957 ?auto_55956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55986 - OBJ
      ?auto_55987 - OBJ
      ?auto_55988 - OBJ
      ?auto_55989 - OBJ
      ?auto_55985 - LOCATION
    )
    :vars
    (
      ?auto_55991 - TRUCK
      ?auto_55992 - LOCATION
      ?auto_55990 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55991 ?auto_55992 ) ( IN-CITY ?auto_55992 ?auto_55990 ) ( IN-CITY ?auto_55985 ?auto_55990 ) ( not ( = ?auto_55985 ?auto_55992 ) ) ( OBJ-AT ?auto_55988 ?auto_55985 ) ( not ( = ?auto_55988 ?auto_55989 ) ) ( OBJ-AT ?auto_55989 ?auto_55992 ) ( OBJ-AT ?auto_55986 ?auto_55985 ) ( OBJ-AT ?auto_55987 ?auto_55985 ) ( not ( = ?auto_55986 ?auto_55987 ) ) ( not ( = ?auto_55986 ?auto_55988 ) ) ( not ( = ?auto_55986 ?auto_55989 ) ) ( not ( = ?auto_55987 ?auto_55988 ) ) ( not ( = ?auto_55987 ?auto_55989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55988 ?auto_55989 ?auto_55985 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55994 - OBJ
      ?auto_55995 - OBJ
      ?auto_55996 - OBJ
      ?auto_55997 - OBJ
      ?auto_55993 - LOCATION
    )
    :vars
    (
      ?auto_55999 - TRUCK
      ?auto_56000 - LOCATION
      ?auto_55998 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55999 ?auto_56000 ) ( IN-CITY ?auto_56000 ?auto_55998 ) ( IN-CITY ?auto_55993 ?auto_55998 ) ( not ( = ?auto_55993 ?auto_56000 ) ) ( OBJ-AT ?auto_55994 ?auto_55993 ) ( not ( = ?auto_55994 ?auto_55996 ) ) ( OBJ-AT ?auto_55996 ?auto_56000 ) ( OBJ-AT ?auto_55995 ?auto_55993 ) ( OBJ-AT ?auto_55997 ?auto_55993 ) ( not ( = ?auto_55994 ?auto_55995 ) ) ( not ( = ?auto_55994 ?auto_55997 ) ) ( not ( = ?auto_55995 ?auto_55996 ) ) ( not ( = ?auto_55995 ?auto_55997 ) ) ( not ( = ?auto_55996 ?auto_55997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55994 ?auto_55996 ?auto_55993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56010 - OBJ
      ?auto_56011 - OBJ
      ?auto_56012 - OBJ
      ?auto_56013 - OBJ
      ?auto_56009 - LOCATION
    )
    :vars
    (
      ?auto_56015 - TRUCK
      ?auto_56016 - LOCATION
      ?auto_56014 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_56015 ?auto_56016 ) ( IN-CITY ?auto_56016 ?auto_56014 ) ( IN-CITY ?auto_56009 ?auto_56014 ) ( not ( = ?auto_56009 ?auto_56016 ) ) ( OBJ-AT ?auto_56013 ?auto_56009 ) ( not ( = ?auto_56013 ?auto_56011 ) ) ( OBJ-AT ?auto_56011 ?auto_56016 ) ( OBJ-AT ?auto_56010 ?auto_56009 ) ( OBJ-AT ?auto_56012 ?auto_56009 ) ( not ( = ?auto_56010 ?auto_56011 ) ) ( not ( = ?auto_56010 ?auto_56012 ) ) ( not ( = ?auto_56010 ?auto_56013 ) ) ( not ( = ?auto_56011 ?auto_56012 ) ) ( not ( = ?auto_56012 ?auto_56013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56013 ?auto_56011 ?auto_56009 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56042 - OBJ
      ?auto_56043 - OBJ
      ?auto_56044 - OBJ
      ?auto_56045 - OBJ
      ?auto_56041 - LOCATION
    )
    :vars
    (
      ?auto_56047 - TRUCK
      ?auto_56048 - LOCATION
      ?auto_56046 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_56047 ?auto_56048 ) ( IN-CITY ?auto_56048 ?auto_56046 ) ( IN-CITY ?auto_56041 ?auto_56046 ) ( not ( = ?auto_56041 ?auto_56048 ) ) ( OBJ-AT ?auto_56044 ?auto_56041 ) ( not ( = ?auto_56044 ?auto_56042 ) ) ( OBJ-AT ?auto_56042 ?auto_56048 ) ( OBJ-AT ?auto_56043 ?auto_56041 ) ( OBJ-AT ?auto_56045 ?auto_56041 ) ( not ( = ?auto_56042 ?auto_56043 ) ) ( not ( = ?auto_56042 ?auto_56045 ) ) ( not ( = ?auto_56043 ?auto_56044 ) ) ( not ( = ?auto_56043 ?auto_56045 ) ) ( not ( = ?auto_56044 ?auto_56045 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56044 ?auto_56042 ?auto_56041 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56107 - OBJ
      ?auto_56106 - LOCATION
    )
    :vars
    (
      ?auto_56110 - LOCATION
      ?auto_56108 - CITY
      ?auto_56111 - OBJ
      ?auto_56109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56110 ?auto_56108 ) ( IN-CITY ?auto_56106 ?auto_56108 ) ( not ( = ?auto_56106 ?auto_56110 ) ) ( OBJ-AT ?auto_56111 ?auto_56106 ) ( not ( = ?auto_56111 ?auto_56107 ) ) ( OBJ-AT ?auto_56107 ?auto_56110 ) ( TRUCK-AT ?auto_56109 ?auto_56106 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56109 ?auto_56106 ?auto_56110 ?auto_56108 )
      ( DELIVER-2PKG ?auto_56111 ?auto_56107 ?auto_56106 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56113 - OBJ
      ?auto_56114 - OBJ
      ?auto_56112 - LOCATION
    )
    :vars
    (
      ?auto_56116 - LOCATION
      ?auto_56115 - CITY
      ?auto_56117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56116 ?auto_56115 ) ( IN-CITY ?auto_56112 ?auto_56115 ) ( not ( = ?auto_56112 ?auto_56116 ) ) ( OBJ-AT ?auto_56113 ?auto_56112 ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( OBJ-AT ?auto_56114 ?auto_56116 ) ( TRUCK-AT ?auto_56117 ?auto_56112 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56114 ?auto_56112 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56119 - OBJ
      ?auto_56120 - OBJ
      ?auto_56118 - LOCATION
    )
    :vars
    (
      ?auto_56121 - LOCATION
      ?auto_56123 - CITY
      ?auto_56122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56121 ?auto_56123 ) ( IN-CITY ?auto_56118 ?auto_56123 ) ( not ( = ?auto_56118 ?auto_56121 ) ) ( OBJ-AT ?auto_56120 ?auto_56118 ) ( not ( = ?auto_56120 ?auto_56119 ) ) ( OBJ-AT ?auto_56119 ?auto_56121 ) ( TRUCK-AT ?auto_56122 ?auto_56118 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56120 ?auto_56119 ?auto_56118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56132 - OBJ
      ?auto_56133 - OBJ
      ?auto_56134 - OBJ
      ?auto_56131 - LOCATION
    )
    :vars
    (
      ?auto_56135 - LOCATION
      ?auto_56137 - CITY
      ?auto_56136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56135 ?auto_56137 ) ( IN-CITY ?auto_56131 ?auto_56137 ) ( not ( = ?auto_56131 ?auto_56135 ) ) ( OBJ-AT ?auto_56132 ?auto_56131 ) ( not ( = ?auto_56132 ?auto_56134 ) ) ( OBJ-AT ?auto_56134 ?auto_56135 ) ( TRUCK-AT ?auto_56136 ?auto_56131 ) ( OBJ-AT ?auto_56133 ?auto_56131 ) ( not ( = ?auto_56132 ?auto_56133 ) ) ( not ( = ?auto_56133 ?auto_56134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56132 ?auto_56134 ?auto_56131 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56139 - OBJ
      ?auto_56140 - OBJ
      ?auto_56141 - OBJ
      ?auto_56138 - LOCATION
    )
    :vars
    (
      ?auto_56142 - LOCATION
      ?auto_56144 - CITY
      ?auto_56143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56142 ?auto_56144 ) ( IN-CITY ?auto_56138 ?auto_56144 ) ( not ( = ?auto_56138 ?auto_56142 ) ) ( OBJ-AT ?auto_56139 ?auto_56138 ) ( not ( = ?auto_56139 ?auto_56140 ) ) ( OBJ-AT ?auto_56140 ?auto_56142 ) ( TRUCK-AT ?auto_56143 ?auto_56138 ) ( OBJ-AT ?auto_56141 ?auto_56138 ) ( not ( = ?auto_56139 ?auto_56141 ) ) ( not ( = ?auto_56140 ?auto_56141 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56139 ?auto_56140 ?auto_56138 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56153 - OBJ
      ?auto_56154 - OBJ
      ?auto_56155 - OBJ
      ?auto_56152 - LOCATION
    )
    :vars
    (
      ?auto_56156 - LOCATION
      ?auto_56158 - CITY
      ?auto_56157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56156 ?auto_56158 ) ( IN-CITY ?auto_56152 ?auto_56158 ) ( not ( = ?auto_56152 ?auto_56156 ) ) ( OBJ-AT ?auto_56155 ?auto_56152 ) ( not ( = ?auto_56155 ?auto_56153 ) ) ( OBJ-AT ?auto_56153 ?auto_56156 ) ( TRUCK-AT ?auto_56157 ?auto_56152 ) ( OBJ-AT ?auto_56154 ?auto_56152 ) ( not ( = ?auto_56153 ?auto_56154 ) ) ( not ( = ?auto_56154 ?auto_56155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56155 ?auto_56153 ?auto_56152 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56182 - OBJ
      ?auto_56183 - OBJ
      ?auto_56184 - OBJ
      ?auto_56185 - OBJ
      ?auto_56181 - LOCATION
    )
    :vars
    (
      ?auto_56186 - LOCATION
      ?auto_56188 - CITY
      ?auto_56187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56186 ?auto_56188 ) ( IN-CITY ?auto_56181 ?auto_56188 ) ( not ( = ?auto_56181 ?auto_56186 ) ) ( OBJ-AT ?auto_56184 ?auto_56181 ) ( not ( = ?auto_56184 ?auto_56185 ) ) ( OBJ-AT ?auto_56185 ?auto_56186 ) ( TRUCK-AT ?auto_56187 ?auto_56181 ) ( OBJ-AT ?auto_56182 ?auto_56181 ) ( OBJ-AT ?auto_56183 ?auto_56181 ) ( not ( = ?auto_56182 ?auto_56183 ) ) ( not ( = ?auto_56182 ?auto_56184 ) ) ( not ( = ?auto_56182 ?auto_56185 ) ) ( not ( = ?auto_56183 ?auto_56184 ) ) ( not ( = ?auto_56183 ?auto_56185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56184 ?auto_56185 ?auto_56181 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56190 - OBJ
      ?auto_56191 - OBJ
      ?auto_56192 - OBJ
      ?auto_56193 - OBJ
      ?auto_56189 - LOCATION
    )
    :vars
    (
      ?auto_56194 - LOCATION
      ?auto_56196 - CITY
      ?auto_56195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56194 ?auto_56196 ) ( IN-CITY ?auto_56189 ?auto_56196 ) ( not ( = ?auto_56189 ?auto_56194 ) ) ( OBJ-AT ?auto_56190 ?auto_56189 ) ( not ( = ?auto_56190 ?auto_56192 ) ) ( OBJ-AT ?auto_56192 ?auto_56194 ) ( TRUCK-AT ?auto_56195 ?auto_56189 ) ( OBJ-AT ?auto_56191 ?auto_56189 ) ( OBJ-AT ?auto_56193 ?auto_56189 ) ( not ( = ?auto_56190 ?auto_56191 ) ) ( not ( = ?auto_56190 ?auto_56193 ) ) ( not ( = ?auto_56191 ?auto_56192 ) ) ( not ( = ?auto_56191 ?auto_56193 ) ) ( not ( = ?auto_56192 ?auto_56193 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56190 ?auto_56192 ?auto_56189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56206 - OBJ
      ?auto_56207 - OBJ
      ?auto_56208 - OBJ
      ?auto_56209 - OBJ
      ?auto_56205 - LOCATION
    )
    :vars
    (
      ?auto_56210 - LOCATION
      ?auto_56212 - CITY
      ?auto_56211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56210 ?auto_56212 ) ( IN-CITY ?auto_56205 ?auto_56212 ) ( not ( = ?auto_56205 ?auto_56210 ) ) ( OBJ-AT ?auto_56206 ?auto_56205 ) ( not ( = ?auto_56206 ?auto_56207 ) ) ( OBJ-AT ?auto_56207 ?auto_56210 ) ( TRUCK-AT ?auto_56211 ?auto_56205 ) ( OBJ-AT ?auto_56208 ?auto_56205 ) ( OBJ-AT ?auto_56209 ?auto_56205 ) ( not ( = ?auto_56206 ?auto_56208 ) ) ( not ( = ?auto_56206 ?auto_56209 ) ) ( not ( = ?auto_56207 ?auto_56208 ) ) ( not ( = ?auto_56207 ?auto_56209 ) ) ( not ( = ?auto_56208 ?auto_56209 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56206 ?auto_56207 ?auto_56205 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56238 - OBJ
      ?auto_56239 - OBJ
      ?auto_56240 - OBJ
      ?auto_56241 - OBJ
      ?auto_56237 - LOCATION
    )
    :vars
    (
      ?auto_56242 - LOCATION
      ?auto_56244 - CITY
      ?auto_56243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56242 ?auto_56244 ) ( IN-CITY ?auto_56237 ?auto_56244 ) ( not ( = ?auto_56237 ?auto_56242 ) ) ( OBJ-AT ?auto_56240 ?auto_56237 ) ( not ( = ?auto_56240 ?auto_56238 ) ) ( OBJ-AT ?auto_56238 ?auto_56242 ) ( TRUCK-AT ?auto_56243 ?auto_56237 ) ( OBJ-AT ?auto_56239 ?auto_56237 ) ( OBJ-AT ?auto_56241 ?auto_56237 ) ( not ( = ?auto_56238 ?auto_56239 ) ) ( not ( = ?auto_56238 ?auto_56241 ) ) ( not ( = ?auto_56239 ?auto_56240 ) ) ( not ( = ?auto_56239 ?auto_56241 ) ) ( not ( = ?auto_56240 ?auto_56241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56240 ?auto_56238 ?auto_56237 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56303 - OBJ
      ?auto_56302 - LOCATION
    )
    :vars
    (
      ?auto_56304 - LOCATION
      ?auto_56306 - CITY
      ?auto_56307 - OBJ
      ?auto_56305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56304 ?auto_56306 ) ( IN-CITY ?auto_56302 ?auto_56306 ) ( not ( = ?auto_56302 ?auto_56304 ) ) ( not ( = ?auto_56307 ?auto_56303 ) ) ( OBJ-AT ?auto_56303 ?auto_56304 ) ( TRUCK-AT ?auto_56305 ?auto_56302 ) ( IN-TRUCK ?auto_56307 ?auto_56305 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56307 ?auto_56302 )
      ( DELIVER-2PKG ?auto_56307 ?auto_56303 ?auto_56302 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56309 - OBJ
      ?auto_56310 - OBJ
      ?auto_56308 - LOCATION
    )
    :vars
    (
      ?auto_56312 - LOCATION
      ?auto_56313 - CITY
      ?auto_56311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56312 ?auto_56313 ) ( IN-CITY ?auto_56308 ?auto_56313 ) ( not ( = ?auto_56308 ?auto_56312 ) ) ( not ( = ?auto_56309 ?auto_56310 ) ) ( OBJ-AT ?auto_56310 ?auto_56312 ) ( TRUCK-AT ?auto_56311 ?auto_56308 ) ( IN-TRUCK ?auto_56309 ?auto_56311 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56310 ?auto_56308 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56315 - OBJ
      ?auto_56316 - OBJ
      ?auto_56314 - LOCATION
    )
    :vars
    (
      ?auto_56318 - LOCATION
      ?auto_56317 - CITY
      ?auto_56319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56318 ?auto_56317 ) ( IN-CITY ?auto_56314 ?auto_56317 ) ( not ( = ?auto_56314 ?auto_56318 ) ) ( not ( = ?auto_56316 ?auto_56315 ) ) ( OBJ-AT ?auto_56315 ?auto_56318 ) ( TRUCK-AT ?auto_56319 ?auto_56314 ) ( IN-TRUCK ?auto_56316 ?auto_56319 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56316 ?auto_56315 ?auto_56314 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56499 - OBJ
      ?auto_56498 - LOCATION
    )
    :vars
    (
      ?auto_56501 - LOCATION
      ?auto_56500 - CITY
      ?auto_56503 - OBJ
      ?auto_56502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56501 ?auto_56500 ) ( IN-CITY ?auto_56498 ?auto_56500 ) ( not ( = ?auto_56498 ?auto_56501 ) ) ( not ( = ?auto_56503 ?auto_56499 ) ) ( OBJ-AT ?auto_56499 ?auto_56501 ) ( IN-TRUCK ?auto_56503 ?auto_56502 ) ( TRUCK-AT ?auto_56502 ?auto_56501 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56502 ?auto_56501 ?auto_56498 ?auto_56500 )
      ( DELIVER-2PKG ?auto_56503 ?auto_56499 ?auto_56498 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56505 - OBJ
      ?auto_56506 - OBJ
      ?auto_56504 - LOCATION
    )
    :vars
    (
      ?auto_56507 - LOCATION
      ?auto_56508 - CITY
      ?auto_56509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56507 ?auto_56508 ) ( IN-CITY ?auto_56504 ?auto_56508 ) ( not ( = ?auto_56504 ?auto_56507 ) ) ( not ( = ?auto_56505 ?auto_56506 ) ) ( OBJ-AT ?auto_56506 ?auto_56507 ) ( IN-TRUCK ?auto_56505 ?auto_56509 ) ( TRUCK-AT ?auto_56509 ?auto_56507 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56506 ?auto_56504 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56511 - OBJ
      ?auto_56512 - OBJ
      ?auto_56510 - LOCATION
    )
    :vars
    (
      ?auto_56513 - LOCATION
      ?auto_56514 - CITY
      ?auto_56515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56513 ?auto_56514 ) ( IN-CITY ?auto_56510 ?auto_56514 ) ( not ( = ?auto_56510 ?auto_56513 ) ) ( not ( = ?auto_56512 ?auto_56511 ) ) ( OBJ-AT ?auto_56511 ?auto_56513 ) ( IN-TRUCK ?auto_56512 ?auto_56515 ) ( TRUCK-AT ?auto_56515 ?auto_56513 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56512 ?auto_56511 ?auto_56510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58021 - OBJ
      ?auto_58022 - OBJ
      ?auto_58023 - OBJ
      ?auto_58020 - LOCATION
    )
    :vars
    (
      ?auto_58024 - TRUCK
      ?auto_58026 - LOCATION
      ?auto_58025 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58023 ?auto_58024 ) ( TRUCK-AT ?auto_58024 ?auto_58026 ) ( IN-CITY ?auto_58026 ?auto_58025 ) ( IN-CITY ?auto_58020 ?auto_58025 ) ( not ( = ?auto_58020 ?auto_58026 ) ) ( OBJ-AT ?auto_58021 ?auto_58020 ) ( not ( = ?auto_58021 ?auto_58023 ) ) ( OBJ-AT ?auto_58022 ?auto_58020 ) ( not ( = ?auto_58021 ?auto_58022 ) ) ( not ( = ?auto_58022 ?auto_58023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58021 ?auto_58023 ?auto_58020 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58032 - OBJ
      ?auto_58033 - OBJ
      ?auto_58034 - OBJ
      ?auto_58031 - LOCATION
    )
    :vars
    (
      ?auto_58035 - TRUCK
      ?auto_58037 - LOCATION
      ?auto_58036 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58033 ?auto_58035 ) ( TRUCK-AT ?auto_58035 ?auto_58037 ) ( IN-CITY ?auto_58037 ?auto_58036 ) ( IN-CITY ?auto_58031 ?auto_58036 ) ( not ( = ?auto_58031 ?auto_58037 ) ) ( OBJ-AT ?auto_58032 ?auto_58031 ) ( not ( = ?auto_58032 ?auto_58033 ) ) ( OBJ-AT ?auto_58034 ?auto_58031 ) ( not ( = ?auto_58032 ?auto_58034 ) ) ( not ( = ?auto_58033 ?auto_58034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58032 ?auto_58033 ?auto_58031 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58054 - OBJ
      ?auto_58055 - OBJ
      ?auto_58056 - OBJ
      ?auto_58053 - LOCATION
    )
    :vars
    (
      ?auto_58058 - TRUCK
      ?auto_58060 - LOCATION
      ?auto_58059 - CITY
      ?auto_58057 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58056 ?auto_58058 ) ( TRUCK-AT ?auto_58058 ?auto_58060 ) ( IN-CITY ?auto_58060 ?auto_58059 ) ( IN-CITY ?auto_58053 ?auto_58059 ) ( not ( = ?auto_58053 ?auto_58060 ) ) ( OBJ-AT ?auto_58057 ?auto_58053 ) ( not ( = ?auto_58057 ?auto_58056 ) ) ( OBJ-AT ?auto_58054 ?auto_58053 ) ( OBJ-AT ?auto_58055 ?auto_58053 ) ( not ( = ?auto_58054 ?auto_58055 ) ) ( not ( = ?auto_58054 ?auto_58056 ) ) ( not ( = ?auto_58054 ?auto_58057 ) ) ( not ( = ?auto_58055 ?auto_58056 ) ) ( not ( = ?auto_58055 ?auto_58057 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58057 ?auto_58056 ?auto_58053 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58066 - OBJ
      ?auto_58067 - OBJ
      ?auto_58068 - OBJ
      ?auto_58065 - LOCATION
    )
    :vars
    (
      ?auto_58070 - TRUCK
      ?auto_58072 - LOCATION
      ?auto_58071 - CITY
      ?auto_58069 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58067 ?auto_58070 ) ( TRUCK-AT ?auto_58070 ?auto_58072 ) ( IN-CITY ?auto_58072 ?auto_58071 ) ( IN-CITY ?auto_58065 ?auto_58071 ) ( not ( = ?auto_58065 ?auto_58072 ) ) ( OBJ-AT ?auto_58069 ?auto_58065 ) ( not ( = ?auto_58069 ?auto_58067 ) ) ( OBJ-AT ?auto_58066 ?auto_58065 ) ( OBJ-AT ?auto_58068 ?auto_58065 ) ( not ( = ?auto_58066 ?auto_58067 ) ) ( not ( = ?auto_58066 ?auto_58068 ) ) ( not ( = ?auto_58066 ?auto_58069 ) ) ( not ( = ?auto_58067 ?auto_58068 ) ) ( not ( = ?auto_58068 ?auto_58069 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58069 ?auto_58067 ?auto_58065 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58082 - OBJ
      ?auto_58083 - OBJ
      ?auto_58084 - OBJ
      ?auto_58081 - LOCATION
    )
    :vars
    (
      ?auto_58085 - TRUCK
      ?auto_58087 - LOCATION
      ?auto_58086 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58082 ?auto_58085 ) ( TRUCK-AT ?auto_58085 ?auto_58087 ) ( IN-CITY ?auto_58087 ?auto_58086 ) ( IN-CITY ?auto_58081 ?auto_58086 ) ( not ( = ?auto_58081 ?auto_58087 ) ) ( OBJ-AT ?auto_58084 ?auto_58081 ) ( not ( = ?auto_58084 ?auto_58082 ) ) ( OBJ-AT ?auto_58083 ?auto_58081 ) ( not ( = ?auto_58082 ?auto_58083 ) ) ( not ( = ?auto_58083 ?auto_58084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58084 ?auto_58082 ?auto_58081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58104 - OBJ
      ?auto_58105 - OBJ
      ?auto_58106 - OBJ
      ?auto_58103 - LOCATION
    )
    :vars
    (
      ?auto_58108 - TRUCK
      ?auto_58110 - LOCATION
      ?auto_58109 - CITY
      ?auto_58107 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58104 ?auto_58108 ) ( TRUCK-AT ?auto_58108 ?auto_58110 ) ( IN-CITY ?auto_58110 ?auto_58109 ) ( IN-CITY ?auto_58103 ?auto_58109 ) ( not ( = ?auto_58103 ?auto_58110 ) ) ( OBJ-AT ?auto_58107 ?auto_58103 ) ( not ( = ?auto_58107 ?auto_58104 ) ) ( OBJ-AT ?auto_58105 ?auto_58103 ) ( OBJ-AT ?auto_58106 ?auto_58103 ) ( not ( = ?auto_58104 ?auto_58105 ) ) ( not ( = ?auto_58104 ?auto_58106 ) ) ( not ( = ?auto_58105 ?auto_58106 ) ) ( not ( = ?auto_58105 ?auto_58107 ) ) ( not ( = ?auto_58106 ?auto_58107 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58107 ?auto_58104 ?auto_58103 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58143 - OBJ
      ?auto_58144 - OBJ
      ?auto_58145 - OBJ
      ?auto_58146 - OBJ
      ?auto_58142 - LOCATION
    )
    :vars
    (
      ?auto_58147 - TRUCK
      ?auto_58149 - LOCATION
      ?auto_58148 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58146 ?auto_58147 ) ( TRUCK-AT ?auto_58147 ?auto_58149 ) ( IN-CITY ?auto_58149 ?auto_58148 ) ( IN-CITY ?auto_58142 ?auto_58148 ) ( not ( = ?auto_58142 ?auto_58149 ) ) ( OBJ-AT ?auto_58143 ?auto_58142 ) ( not ( = ?auto_58143 ?auto_58146 ) ) ( OBJ-AT ?auto_58144 ?auto_58142 ) ( OBJ-AT ?auto_58145 ?auto_58142 ) ( not ( = ?auto_58143 ?auto_58144 ) ) ( not ( = ?auto_58143 ?auto_58145 ) ) ( not ( = ?auto_58144 ?auto_58145 ) ) ( not ( = ?auto_58144 ?auto_58146 ) ) ( not ( = ?auto_58145 ?auto_58146 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58143 ?auto_58146 ?auto_58142 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58159 - OBJ
      ?auto_58160 - OBJ
      ?auto_58161 - OBJ
      ?auto_58162 - OBJ
      ?auto_58158 - LOCATION
    )
    :vars
    (
      ?auto_58163 - TRUCK
      ?auto_58165 - LOCATION
      ?auto_58164 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58161 ?auto_58163 ) ( TRUCK-AT ?auto_58163 ?auto_58165 ) ( IN-CITY ?auto_58165 ?auto_58164 ) ( IN-CITY ?auto_58158 ?auto_58164 ) ( not ( = ?auto_58158 ?auto_58165 ) ) ( OBJ-AT ?auto_58162 ?auto_58158 ) ( not ( = ?auto_58162 ?auto_58161 ) ) ( OBJ-AT ?auto_58159 ?auto_58158 ) ( OBJ-AT ?auto_58160 ?auto_58158 ) ( not ( = ?auto_58159 ?auto_58160 ) ) ( not ( = ?auto_58159 ?auto_58161 ) ) ( not ( = ?auto_58159 ?auto_58162 ) ) ( not ( = ?auto_58160 ?auto_58161 ) ) ( not ( = ?auto_58160 ?auto_58162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58162 ?auto_58161 ?auto_58158 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58223 - OBJ
      ?auto_58224 - OBJ
      ?auto_58225 - OBJ
      ?auto_58226 - OBJ
      ?auto_58222 - LOCATION
    )
    :vars
    (
      ?auto_58227 - TRUCK
      ?auto_58229 - LOCATION
      ?auto_58228 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58224 ?auto_58227 ) ( TRUCK-AT ?auto_58227 ?auto_58229 ) ( IN-CITY ?auto_58229 ?auto_58228 ) ( IN-CITY ?auto_58222 ?auto_58228 ) ( not ( = ?auto_58222 ?auto_58229 ) ) ( OBJ-AT ?auto_58226 ?auto_58222 ) ( not ( = ?auto_58226 ?auto_58224 ) ) ( OBJ-AT ?auto_58223 ?auto_58222 ) ( OBJ-AT ?auto_58225 ?auto_58222 ) ( not ( = ?auto_58223 ?auto_58224 ) ) ( not ( = ?auto_58223 ?auto_58225 ) ) ( not ( = ?auto_58223 ?auto_58226 ) ) ( not ( = ?auto_58224 ?auto_58225 ) ) ( not ( = ?auto_58225 ?auto_58226 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58226 ?auto_58224 ?auto_58222 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58247 - OBJ
      ?auto_58248 - OBJ
      ?auto_58249 - OBJ
      ?auto_58250 - OBJ
      ?auto_58246 - LOCATION
    )
    :vars
    (
      ?auto_58251 - TRUCK
      ?auto_58253 - LOCATION
      ?auto_58252 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58248 ?auto_58251 ) ( TRUCK-AT ?auto_58251 ?auto_58253 ) ( IN-CITY ?auto_58253 ?auto_58252 ) ( IN-CITY ?auto_58246 ?auto_58252 ) ( not ( = ?auto_58246 ?auto_58253 ) ) ( OBJ-AT ?auto_58247 ?auto_58246 ) ( not ( = ?auto_58247 ?auto_58248 ) ) ( OBJ-AT ?auto_58249 ?auto_58246 ) ( OBJ-AT ?auto_58250 ?auto_58246 ) ( not ( = ?auto_58247 ?auto_58249 ) ) ( not ( = ?auto_58247 ?auto_58250 ) ) ( not ( = ?auto_58248 ?auto_58249 ) ) ( not ( = ?auto_58248 ?auto_58250 ) ) ( not ( = ?auto_58249 ?auto_58250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58247 ?auto_58248 ?auto_58246 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58311 - OBJ
      ?auto_58312 - OBJ
      ?auto_58313 - OBJ
      ?auto_58314 - OBJ
      ?auto_58310 - LOCATION
    )
    :vars
    (
      ?auto_58315 - TRUCK
      ?auto_58317 - LOCATION
      ?auto_58316 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58313 ?auto_58315 ) ( TRUCK-AT ?auto_58315 ?auto_58317 ) ( IN-CITY ?auto_58317 ?auto_58316 ) ( IN-CITY ?auto_58310 ?auto_58316 ) ( not ( = ?auto_58310 ?auto_58317 ) ) ( OBJ-AT ?auto_58312 ?auto_58310 ) ( not ( = ?auto_58312 ?auto_58313 ) ) ( OBJ-AT ?auto_58311 ?auto_58310 ) ( OBJ-AT ?auto_58314 ?auto_58310 ) ( not ( = ?auto_58311 ?auto_58312 ) ) ( not ( = ?auto_58311 ?auto_58313 ) ) ( not ( = ?auto_58311 ?auto_58314 ) ) ( not ( = ?auto_58312 ?auto_58314 ) ) ( not ( = ?auto_58313 ?auto_58314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58312 ?auto_58313 ?auto_58310 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58335 - OBJ
      ?auto_58336 - OBJ
      ?auto_58337 - OBJ
      ?auto_58338 - OBJ
      ?auto_58334 - LOCATION
    )
    :vars
    (
      ?auto_58339 - TRUCK
      ?auto_58341 - LOCATION
      ?auto_58340 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58338 ?auto_58339 ) ( TRUCK-AT ?auto_58339 ?auto_58341 ) ( IN-CITY ?auto_58341 ?auto_58340 ) ( IN-CITY ?auto_58334 ?auto_58340 ) ( not ( = ?auto_58334 ?auto_58341 ) ) ( OBJ-AT ?auto_58337 ?auto_58334 ) ( not ( = ?auto_58337 ?auto_58338 ) ) ( OBJ-AT ?auto_58335 ?auto_58334 ) ( OBJ-AT ?auto_58336 ?auto_58334 ) ( not ( = ?auto_58335 ?auto_58336 ) ) ( not ( = ?auto_58335 ?auto_58337 ) ) ( not ( = ?auto_58335 ?auto_58338 ) ) ( not ( = ?auto_58336 ?auto_58337 ) ) ( not ( = ?auto_58336 ?auto_58338 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58337 ?auto_58338 ?auto_58334 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58343 - OBJ
      ?auto_58344 - OBJ
      ?auto_58345 - OBJ
      ?auto_58346 - OBJ
      ?auto_58342 - LOCATION
    )
    :vars
    (
      ?auto_58348 - TRUCK
      ?auto_58350 - LOCATION
      ?auto_58349 - CITY
      ?auto_58347 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58346 ?auto_58348 ) ( TRUCK-AT ?auto_58348 ?auto_58350 ) ( IN-CITY ?auto_58350 ?auto_58349 ) ( IN-CITY ?auto_58342 ?auto_58349 ) ( not ( = ?auto_58342 ?auto_58350 ) ) ( OBJ-AT ?auto_58347 ?auto_58342 ) ( not ( = ?auto_58347 ?auto_58346 ) ) ( OBJ-AT ?auto_58343 ?auto_58342 ) ( OBJ-AT ?auto_58344 ?auto_58342 ) ( OBJ-AT ?auto_58345 ?auto_58342 ) ( not ( = ?auto_58343 ?auto_58344 ) ) ( not ( = ?auto_58343 ?auto_58345 ) ) ( not ( = ?auto_58343 ?auto_58346 ) ) ( not ( = ?auto_58343 ?auto_58347 ) ) ( not ( = ?auto_58344 ?auto_58345 ) ) ( not ( = ?auto_58344 ?auto_58346 ) ) ( not ( = ?auto_58344 ?auto_58347 ) ) ( not ( = ?auto_58345 ?auto_58346 ) ) ( not ( = ?auto_58345 ?auto_58347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58347 ?auto_58346 ?auto_58342 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58360 - OBJ
      ?auto_58361 - OBJ
      ?auto_58362 - OBJ
      ?auto_58363 - OBJ
      ?auto_58359 - LOCATION
    )
    :vars
    (
      ?auto_58365 - TRUCK
      ?auto_58367 - LOCATION
      ?auto_58366 - CITY
      ?auto_58364 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58362 ?auto_58365 ) ( TRUCK-AT ?auto_58365 ?auto_58367 ) ( IN-CITY ?auto_58367 ?auto_58366 ) ( IN-CITY ?auto_58359 ?auto_58366 ) ( not ( = ?auto_58359 ?auto_58367 ) ) ( OBJ-AT ?auto_58364 ?auto_58359 ) ( not ( = ?auto_58364 ?auto_58362 ) ) ( OBJ-AT ?auto_58360 ?auto_58359 ) ( OBJ-AT ?auto_58361 ?auto_58359 ) ( OBJ-AT ?auto_58363 ?auto_58359 ) ( not ( = ?auto_58360 ?auto_58361 ) ) ( not ( = ?auto_58360 ?auto_58362 ) ) ( not ( = ?auto_58360 ?auto_58363 ) ) ( not ( = ?auto_58360 ?auto_58364 ) ) ( not ( = ?auto_58361 ?auto_58362 ) ) ( not ( = ?auto_58361 ?auto_58363 ) ) ( not ( = ?auto_58361 ?auto_58364 ) ) ( not ( = ?auto_58362 ?auto_58363 ) ) ( not ( = ?auto_58363 ?auto_58364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58364 ?auto_58362 ?auto_58359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58410 - OBJ
      ?auto_58411 - OBJ
      ?auto_58412 - OBJ
      ?auto_58413 - OBJ
      ?auto_58409 - LOCATION
    )
    :vars
    (
      ?auto_58415 - TRUCK
      ?auto_58417 - LOCATION
      ?auto_58416 - CITY
      ?auto_58414 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58411 ?auto_58415 ) ( TRUCK-AT ?auto_58415 ?auto_58417 ) ( IN-CITY ?auto_58417 ?auto_58416 ) ( IN-CITY ?auto_58409 ?auto_58416 ) ( not ( = ?auto_58409 ?auto_58417 ) ) ( OBJ-AT ?auto_58414 ?auto_58409 ) ( not ( = ?auto_58414 ?auto_58411 ) ) ( OBJ-AT ?auto_58410 ?auto_58409 ) ( OBJ-AT ?auto_58412 ?auto_58409 ) ( OBJ-AT ?auto_58413 ?auto_58409 ) ( not ( = ?auto_58410 ?auto_58411 ) ) ( not ( = ?auto_58410 ?auto_58412 ) ) ( not ( = ?auto_58410 ?auto_58413 ) ) ( not ( = ?auto_58410 ?auto_58414 ) ) ( not ( = ?auto_58411 ?auto_58412 ) ) ( not ( = ?auto_58411 ?auto_58413 ) ) ( not ( = ?auto_58412 ?auto_58413 ) ) ( not ( = ?auto_58412 ?auto_58414 ) ) ( not ( = ?auto_58413 ?auto_58414 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58414 ?auto_58411 ?auto_58409 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58462 - OBJ
      ?auto_58463 - OBJ
      ?auto_58464 - OBJ
      ?auto_58465 - OBJ
      ?auto_58461 - LOCATION
    )
    :vars
    (
      ?auto_58466 - TRUCK
      ?auto_58468 - LOCATION
      ?auto_58467 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58462 ?auto_58466 ) ( TRUCK-AT ?auto_58466 ?auto_58468 ) ( IN-CITY ?auto_58468 ?auto_58467 ) ( IN-CITY ?auto_58461 ?auto_58467 ) ( not ( = ?auto_58461 ?auto_58468 ) ) ( OBJ-AT ?auto_58463 ?auto_58461 ) ( not ( = ?auto_58463 ?auto_58462 ) ) ( OBJ-AT ?auto_58464 ?auto_58461 ) ( OBJ-AT ?auto_58465 ?auto_58461 ) ( not ( = ?auto_58462 ?auto_58464 ) ) ( not ( = ?auto_58462 ?auto_58465 ) ) ( not ( = ?auto_58463 ?auto_58464 ) ) ( not ( = ?auto_58463 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58463 ?auto_58462 ?auto_58461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58550 - OBJ
      ?auto_58551 - OBJ
      ?auto_58552 - OBJ
      ?auto_58553 - OBJ
      ?auto_58549 - LOCATION
    )
    :vars
    (
      ?auto_58554 - TRUCK
      ?auto_58556 - LOCATION
      ?auto_58555 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58550 ?auto_58554 ) ( TRUCK-AT ?auto_58554 ?auto_58556 ) ( IN-CITY ?auto_58556 ?auto_58555 ) ( IN-CITY ?auto_58549 ?auto_58555 ) ( not ( = ?auto_58549 ?auto_58556 ) ) ( OBJ-AT ?auto_58553 ?auto_58549 ) ( not ( = ?auto_58553 ?auto_58550 ) ) ( OBJ-AT ?auto_58551 ?auto_58549 ) ( OBJ-AT ?auto_58552 ?auto_58549 ) ( not ( = ?auto_58550 ?auto_58551 ) ) ( not ( = ?auto_58550 ?auto_58552 ) ) ( not ( = ?auto_58551 ?auto_58552 ) ) ( not ( = ?auto_58551 ?auto_58553 ) ) ( not ( = ?auto_58552 ?auto_58553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58553 ?auto_58550 ?auto_58549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58558 - OBJ
      ?auto_58559 - OBJ
      ?auto_58560 - OBJ
      ?auto_58561 - OBJ
      ?auto_58557 - LOCATION
    )
    :vars
    (
      ?auto_58563 - TRUCK
      ?auto_58565 - LOCATION
      ?auto_58564 - CITY
      ?auto_58562 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58558 ?auto_58563 ) ( TRUCK-AT ?auto_58563 ?auto_58565 ) ( IN-CITY ?auto_58565 ?auto_58564 ) ( IN-CITY ?auto_58557 ?auto_58564 ) ( not ( = ?auto_58557 ?auto_58565 ) ) ( OBJ-AT ?auto_58562 ?auto_58557 ) ( not ( = ?auto_58562 ?auto_58558 ) ) ( OBJ-AT ?auto_58559 ?auto_58557 ) ( OBJ-AT ?auto_58560 ?auto_58557 ) ( OBJ-AT ?auto_58561 ?auto_58557 ) ( not ( = ?auto_58558 ?auto_58559 ) ) ( not ( = ?auto_58558 ?auto_58560 ) ) ( not ( = ?auto_58558 ?auto_58561 ) ) ( not ( = ?auto_58559 ?auto_58560 ) ) ( not ( = ?auto_58559 ?auto_58561 ) ) ( not ( = ?auto_58559 ?auto_58562 ) ) ( not ( = ?auto_58560 ?auto_58561 ) ) ( not ( = ?auto_58560 ?auto_58562 ) ) ( not ( = ?auto_58561 ?auto_58562 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58562 ?auto_58558 ?auto_58557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58720 - OBJ
      ?auto_58721 - OBJ
      ?auto_58722 - OBJ
      ?auto_58719 - LOCATION
    )
    :vars
    (
      ?auto_58723 - TRUCK
      ?auto_58724 - LOCATION
      ?auto_58725 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58723 ?auto_58724 ) ( IN-CITY ?auto_58724 ?auto_58725 ) ( IN-CITY ?auto_58719 ?auto_58725 ) ( not ( = ?auto_58719 ?auto_58724 ) ) ( OBJ-AT ?auto_58722 ?auto_58719 ) ( not ( = ?auto_58722 ?auto_58721 ) ) ( OBJ-AT ?auto_58721 ?auto_58724 ) ( OBJ-AT ?auto_58720 ?auto_58719 ) ( not ( = ?auto_58720 ?auto_58721 ) ) ( not ( = ?auto_58720 ?auto_58722 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58722 ?auto_58721 ?auto_58719 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58742 - OBJ
      ?auto_58743 - OBJ
      ?auto_58744 - OBJ
      ?auto_58741 - LOCATION
    )
    :vars
    (
      ?auto_58746 - TRUCK
      ?auto_58747 - LOCATION
      ?auto_58748 - CITY
      ?auto_58745 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58746 ?auto_58747 ) ( IN-CITY ?auto_58747 ?auto_58748 ) ( IN-CITY ?auto_58741 ?auto_58748 ) ( not ( = ?auto_58741 ?auto_58747 ) ) ( OBJ-AT ?auto_58745 ?auto_58741 ) ( not ( = ?auto_58745 ?auto_58744 ) ) ( OBJ-AT ?auto_58744 ?auto_58747 ) ( OBJ-AT ?auto_58742 ?auto_58741 ) ( OBJ-AT ?auto_58743 ?auto_58741 ) ( not ( = ?auto_58742 ?auto_58743 ) ) ( not ( = ?auto_58742 ?auto_58744 ) ) ( not ( = ?auto_58742 ?auto_58745 ) ) ( not ( = ?auto_58743 ?auto_58744 ) ) ( not ( = ?auto_58743 ?auto_58745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58745 ?auto_58744 ?auto_58741 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58754 - OBJ
      ?auto_58755 - OBJ
      ?auto_58756 - OBJ
      ?auto_58753 - LOCATION
    )
    :vars
    (
      ?auto_58758 - TRUCK
      ?auto_58759 - LOCATION
      ?auto_58760 - CITY
      ?auto_58757 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58758 ?auto_58759 ) ( IN-CITY ?auto_58759 ?auto_58760 ) ( IN-CITY ?auto_58753 ?auto_58760 ) ( not ( = ?auto_58753 ?auto_58759 ) ) ( OBJ-AT ?auto_58757 ?auto_58753 ) ( not ( = ?auto_58757 ?auto_58755 ) ) ( OBJ-AT ?auto_58755 ?auto_58759 ) ( OBJ-AT ?auto_58754 ?auto_58753 ) ( OBJ-AT ?auto_58756 ?auto_58753 ) ( not ( = ?auto_58754 ?auto_58755 ) ) ( not ( = ?auto_58754 ?auto_58756 ) ) ( not ( = ?auto_58754 ?auto_58757 ) ) ( not ( = ?auto_58755 ?auto_58756 ) ) ( not ( = ?auto_58756 ?auto_58757 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58757 ?auto_58755 ?auto_58753 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58770 - OBJ
      ?auto_58771 - OBJ
      ?auto_58772 - OBJ
      ?auto_58769 - LOCATION
    )
    :vars
    (
      ?auto_58773 - TRUCK
      ?auto_58774 - LOCATION
      ?auto_58775 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58773 ?auto_58774 ) ( IN-CITY ?auto_58774 ?auto_58775 ) ( IN-CITY ?auto_58769 ?auto_58775 ) ( not ( = ?auto_58769 ?auto_58774 ) ) ( OBJ-AT ?auto_58771 ?auto_58769 ) ( not ( = ?auto_58771 ?auto_58770 ) ) ( OBJ-AT ?auto_58770 ?auto_58774 ) ( OBJ-AT ?auto_58772 ?auto_58769 ) ( not ( = ?auto_58770 ?auto_58772 ) ) ( not ( = ?auto_58771 ?auto_58772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58771 ?auto_58770 ?auto_58769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58792 - OBJ
      ?auto_58793 - OBJ
      ?auto_58794 - OBJ
      ?auto_58791 - LOCATION
    )
    :vars
    (
      ?auto_58796 - TRUCK
      ?auto_58797 - LOCATION
      ?auto_58798 - CITY
      ?auto_58795 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58796 ?auto_58797 ) ( IN-CITY ?auto_58797 ?auto_58798 ) ( IN-CITY ?auto_58791 ?auto_58798 ) ( not ( = ?auto_58791 ?auto_58797 ) ) ( OBJ-AT ?auto_58795 ?auto_58791 ) ( not ( = ?auto_58795 ?auto_58792 ) ) ( OBJ-AT ?auto_58792 ?auto_58797 ) ( OBJ-AT ?auto_58793 ?auto_58791 ) ( OBJ-AT ?auto_58794 ?auto_58791 ) ( not ( = ?auto_58792 ?auto_58793 ) ) ( not ( = ?auto_58792 ?auto_58794 ) ) ( not ( = ?auto_58793 ?auto_58794 ) ) ( not ( = ?auto_58793 ?auto_58795 ) ) ( not ( = ?auto_58794 ?auto_58795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58795 ?auto_58792 ?auto_58791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58839 - OBJ
      ?auto_58840 - OBJ
      ?auto_58841 - OBJ
      ?auto_58842 - OBJ
      ?auto_58838 - LOCATION
    )
    :vars
    (
      ?auto_58843 - TRUCK
      ?auto_58844 - LOCATION
      ?auto_58845 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58843 ?auto_58844 ) ( IN-CITY ?auto_58844 ?auto_58845 ) ( IN-CITY ?auto_58838 ?auto_58845 ) ( not ( = ?auto_58838 ?auto_58844 ) ) ( OBJ-AT ?auto_58839 ?auto_58838 ) ( not ( = ?auto_58839 ?auto_58842 ) ) ( OBJ-AT ?auto_58842 ?auto_58844 ) ( OBJ-AT ?auto_58840 ?auto_58838 ) ( OBJ-AT ?auto_58841 ?auto_58838 ) ( not ( = ?auto_58839 ?auto_58840 ) ) ( not ( = ?auto_58839 ?auto_58841 ) ) ( not ( = ?auto_58840 ?auto_58841 ) ) ( not ( = ?auto_58840 ?auto_58842 ) ) ( not ( = ?auto_58841 ?auto_58842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58839 ?auto_58842 ?auto_58838 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58847 - OBJ
      ?auto_58848 - OBJ
      ?auto_58849 - OBJ
      ?auto_58850 - OBJ
      ?auto_58846 - LOCATION
    )
    :vars
    (
      ?auto_58851 - TRUCK
      ?auto_58852 - LOCATION
      ?auto_58853 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58851 ?auto_58852 ) ( IN-CITY ?auto_58852 ?auto_58853 ) ( IN-CITY ?auto_58846 ?auto_58853 ) ( not ( = ?auto_58846 ?auto_58852 ) ) ( OBJ-AT ?auto_58848 ?auto_58846 ) ( not ( = ?auto_58848 ?auto_58849 ) ) ( OBJ-AT ?auto_58849 ?auto_58852 ) ( OBJ-AT ?auto_58847 ?auto_58846 ) ( OBJ-AT ?auto_58850 ?auto_58846 ) ( not ( = ?auto_58847 ?auto_58848 ) ) ( not ( = ?auto_58847 ?auto_58849 ) ) ( not ( = ?auto_58847 ?auto_58850 ) ) ( not ( = ?auto_58848 ?auto_58850 ) ) ( not ( = ?auto_58849 ?auto_58850 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58848 ?auto_58849 ?auto_58846 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58911 - OBJ
      ?auto_58912 - OBJ
      ?auto_58913 - OBJ
      ?auto_58914 - OBJ
      ?auto_58910 - LOCATION
    )
    :vars
    (
      ?auto_58915 - TRUCK
      ?auto_58916 - LOCATION
      ?auto_58917 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58915 ?auto_58916 ) ( IN-CITY ?auto_58916 ?auto_58917 ) ( IN-CITY ?auto_58910 ?auto_58917 ) ( not ( = ?auto_58910 ?auto_58916 ) ) ( OBJ-AT ?auto_58913 ?auto_58910 ) ( not ( = ?auto_58913 ?auto_58912 ) ) ( OBJ-AT ?auto_58912 ?auto_58916 ) ( OBJ-AT ?auto_58911 ?auto_58910 ) ( OBJ-AT ?auto_58914 ?auto_58910 ) ( not ( = ?auto_58911 ?auto_58912 ) ) ( not ( = ?auto_58911 ?auto_58913 ) ) ( not ( = ?auto_58911 ?auto_58914 ) ) ( not ( = ?auto_58912 ?auto_58914 ) ) ( not ( = ?auto_58913 ?auto_58914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58913 ?auto_58912 ?auto_58910 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58943 - OBJ
      ?auto_58944 - OBJ
      ?auto_58945 - OBJ
      ?auto_58946 - OBJ
      ?auto_58942 - LOCATION
    )
    :vars
    (
      ?auto_58947 - TRUCK
      ?auto_58948 - LOCATION
      ?auto_58949 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58947 ?auto_58948 ) ( IN-CITY ?auto_58948 ?auto_58949 ) ( IN-CITY ?auto_58942 ?auto_58949 ) ( not ( = ?auto_58942 ?auto_58948 ) ) ( OBJ-AT ?auto_58943 ?auto_58942 ) ( not ( = ?auto_58943 ?auto_58944 ) ) ( OBJ-AT ?auto_58944 ?auto_58948 ) ( OBJ-AT ?auto_58945 ?auto_58942 ) ( OBJ-AT ?auto_58946 ?auto_58942 ) ( not ( = ?auto_58943 ?auto_58945 ) ) ( not ( = ?auto_58943 ?auto_58946 ) ) ( not ( = ?auto_58944 ?auto_58945 ) ) ( not ( = ?auto_58944 ?auto_58946 ) ) ( not ( = ?auto_58945 ?auto_58946 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58943 ?auto_58944 ?auto_58942 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58991 - OBJ
      ?auto_58992 - OBJ
      ?auto_58993 - OBJ
      ?auto_58994 - OBJ
      ?auto_58990 - LOCATION
    )
    :vars
    (
      ?auto_58995 - TRUCK
      ?auto_58996 - LOCATION
      ?auto_58997 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58995 ?auto_58996 ) ( IN-CITY ?auto_58996 ?auto_58997 ) ( IN-CITY ?auto_58990 ?auto_58997 ) ( not ( = ?auto_58990 ?auto_58996 ) ) ( OBJ-AT ?auto_58992 ?auto_58990 ) ( not ( = ?auto_58992 ?auto_58994 ) ) ( OBJ-AT ?auto_58994 ?auto_58996 ) ( OBJ-AT ?auto_58991 ?auto_58990 ) ( OBJ-AT ?auto_58993 ?auto_58990 ) ( not ( = ?auto_58991 ?auto_58992 ) ) ( not ( = ?auto_58991 ?auto_58993 ) ) ( not ( = ?auto_58991 ?auto_58994 ) ) ( not ( = ?auto_58992 ?auto_58993 ) ) ( not ( = ?auto_58993 ?auto_58994 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58992 ?auto_58994 ?auto_58990 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58999 - OBJ
      ?auto_59000 - OBJ
      ?auto_59001 - OBJ
      ?auto_59002 - OBJ
      ?auto_58998 - LOCATION
    )
    :vars
    (
      ?auto_59003 - TRUCK
      ?auto_59004 - LOCATION
      ?auto_59005 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59003 ?auto_59004 ) ( IN-CITY ?auto_59004 ?auto_59005 ) ( IN-CITY ?auto_58998 ?auto_59005 ) ( not ( = ?auto_58998 ?auto_59004 ) ) ( OBJ-AT ?auto_59002 ?auto_58998 ) ( not ( = ?auto_59002 ?auto_59001 ) ) ( OBJ-AT ?auto_59001 ?auto_59004 ) ( OBJ-AT ?auto_58999 ?auto_58998 ) ( OBJ-AT ?auto_59000 ?auto_58998 ) ( not ( = ?auto_58999 ?auto_59000 ) ) ( not ( = ?auto_58999 ?auto_59001 ) ) ( not ( = ?auto_58999 ?auto_59002 ) ) ( not ( = ?auto_59000 ?auto_59001 ) ) ( not ( = ?auto_59000 ?auto_59002 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59002 ?auto_59001 ?auto_58998 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59031 - OBJ
      ?auto_59032 - OBJ
      ?auto_59033 - OBJ
      ?auto_59034 - OBJ
      ?auto_59030 - LOCATION
    )
    :vars
    (
      ?auto_59036 - TRUCK
      ?auto_59037 - LOCATION
      ?auto_59038 - CITY
      ?auto_59035 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59036 ?auto_59037 ) ( IN-CITY ?auto_59037 ?auto_59038 ) ( IN-CITY ?auto_59030 ?auto_59038 ) ( not ( = ?auto_59030 ?auto_59037 ) ) ( OBJ-AT ?auto_59035 ?auto_59030 ) ( not ( = ?auto_59035 ?auto_59034 ) ) ( OBJ-AT ?auto_59034 ?auto_59037 ) ( OBJ-AT ?auto_59031 ?auto_59030 ) ( OBJ-AT ?auto_59032 ?auto_59030 ) ( OBJ-AT ?auto_59033 ?auto_59030 ) ( not ( = ?auto_59031 ?auto_59032 ) ) ( not ( = ?auto_59031 ?auto_59033 ) ) ( not ( = ?auto_59031 ?auto_59034 ) ) ( not ( = ?auto_59031 ?auto_59035 ) ) ( not ( = ?auto_59032 ?auto_59033 ) ) ( not ( = ?auto_59032 ?auto_59034 ) ) ( not ( = ?auto_59032 ?auto_59035 ) ) ( not ( = ?auto_59033 ?auto_59034 ) ) ( not ( = ?auto_59033 ?auto_59035 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59035 ?auto_59034 ?auto_59030 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59048 - OBJ
      ?auto_59049 - OBJ
      ?auto_59050 - OBJ
      ?auto_59051 - OBJ
      ?auto_59047 - LOCATION
    )
    :vars
    (
      ?auto_59053 - TRUCK
      ?auto_59054 - LOCATION
      ?auto_59055 - CITY
      ?auto_59052 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59053 ?auto_59054 ) ( IN-CITY ?auto_59054 ?auto_59055 ) ( IN-CITY ?auto_59047 ?auto_59055 ) ( not ( = ?auto_59047 ?auto_59054 ) ) ( OBJ-AT ?auto_59052 ?auto_59047 ) ( not ( = ?auto_59052 ?auto_59050 ) ) ( OBJ-AT ?auto_59050 ?auto_59054 ) ( OBJ-AT ?auto_59048 ?auto_59047 ) ( OBJ-AT ?auto_59049 ?auto_59047 ) ( OBJ-AT ?auto_59051 ?auto_59047 ) ( not ( = ?auto_59048 ?auto_59049 ) ) ( not ( = ?auto_59048 ?auto_59050 ) ) ( not ( = ?auto_59048 ?auto_59051 ) ) ( not ( = ?auto_59048 ?auto_59052 ) ) ( not ( = ?auto_59049 ?auto_59050 ) ) ( not ( = ?auto_59049 ?auto_59051 ) ) ( not ( = ?auto_59049 ?auto_59052 ) ) ( not ( = ?auto_59050 ?auto_59051 ) ) ( not ( = ?auto_59051 ?auto_59052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59052 ?auto_59050 ?auto_59047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59098 - OBJ
      ?auto_59099 - OBJ
      ?auto_59100 - OBJ
      ?auto_59101 - OBJ
      ?auto_59097 - LOCATION
    )
    :vars
    (
      ?auto_59103 - TRUCK
      ?auto_59104 - LOCATION
      ?auto_59105 - CITY
      ?auto_59102 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59103 ?auto_59104 ) ( IN-CITY ?auto_59104 ?auto_59105 ) ( IN-CITY ?auto_59097 ?auto_59105 ) ( not ( = ?auto_59097 ?auto_59104 ) ) ( OBJ-AT ?auto_59102 ?auto_59097 ) ( not ( = ?auto_59102 ?auto_59099 ) ) ( OBJ-AT ?auto_59099 ?auto_59104 ) ( OBJ-AT ?auto_59098 ?auto_59097 ) ( OBJ-AT ?auto_59100 ?auto_59097 ) ( OBJ-AT ?auto_59101 ?auto_59097 ) ( not ( = ?auto_59098 ?auto_59099 ) ) ( not ( = ?auto_59098 ?auto_59100 ) ) ( not ( = ?auto_59098 ?auto_59101 ) ) ( not ( = ?auto_59098 ?auto_59102 ) ) ( not ( = ?auto_59099 ?auto_59100 ) ) ( not ( = ?auto_59099 ?auto_59101 ) ) ( not ( = ?auto_59100 ?auto_59101 ) ) ( not ( = ?auto_59100 ?auto_59102 ) ) ( not ( = ?auto_59101 ?auto_59102 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59102 ?auto_59099 ?auto_59097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59142 - OBJ
      ?auto_59143 - OBJ
      ?auto_59144 - OBJ
      ?auto_59145 - OBJ
      ?auto_59141 - LOCATION
    )
    :vars
    (
      ?auto_59146 - TRUCK
      ?auto_59147 - LOCATION
      ?auto_59148 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59146 ?auto_59147 ) ( IN-CITY ?auto_59147 ?auto_59148 ) ( IN-CITY ?auto_59141 ?auto_59148 ) ( not ( = ?auto_59141 ?auto_59147 ) ) ( OBJ-AT ?auto_59145 ?auto_59141 ) ( not ( = ?auto_59145 ?auto_59142 ) ) ( OBJ-AT ?auto_59142 ?auto_59147 ) ( OBJ-AT ?auto_59143 ?auto_59141 ) ( OBJ-AT ?auto_59144 ?auto_59141 ) ( not ( = ?auto_59142 ?auto_59143 ) ) ( not ( = ?auto_59142 ?auto_59144 ) ) ( not ( = ?auto_59143 ?auto_59144 ) ) ( not ( = ?auto_59143 ?auto_59145 ) ) ( not ( = ?auto_59144 ?auto_59145 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59145 ?auto_59142 ?auto_59141 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59174 - OBJ
      ?auto_59175 - OBJ
      ?auto_59176 - OBJ
      ?auto_59177 - OBJ
      ?auto_59173 - LOCATION
    )
    :vars
    (
      ?auto_59178 - TRUCK
      ?auto_59179 - LOCATION
      ?auto_59180 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59178 ?auto_59179 ) ( IN-CITY ?auto_59179 ?auto_59180 ) ( IN-CITY ?auto_59173 ?auto_59180 ) ( not ( = ?auto_59173 ?auto_59179 ) ) ( OBJ-AT ?auto_59175 ?auto_59173 ) ( not ( = ?auto_59175 ?auto_59174 ) ) ( OBJ-AT ?auto_59174 ?auto_59179 ) ( OBJ-AT ?auto_59176 ?auto_59173 ) ( OBJ-AT ?auto_59177 ?auto_59173 ) ( not ( = ?auto_59174 ?auto_59176 ) ) ( not ( = ?auto_59174 ?auto_59177 ) ) ( not ( = ?auto_59175 ?auto_59176 ) ) ( not ( = ?auto_59175 ?auto_59177 ) ) ( not ( = ?auto_59176 ?auto_59177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59175 ?auto_59174 ?auto_59173 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59246 - OBJ
      ?auto_59247 - OBJ
      ?auto_59248 - OBJ
      ?auto_59249 - OBJ
      ?auto_59245 - LOCATION
    )
    :vars
    (
      ?auto_59251 - TRUCK
      ?auto_59252 - LOCATION
      ?auto_59253 - CITY
      ?auto_59250 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59251 ?auto_59252 ) ( IN-CITY ?auto_59252 ?auto_59253 ) ( IN-CITY ?auto_59245 ?auto_59253 ) ( not ( = ?auto_59245 ?auto_59252 ) ) ( OBJ-AT ?auto_59250 ?auto_59245 ) ( not ( = ?auto_59250 ?auto_59246 ) ) ( OBJ-AT ?auto_59246 ?auto_59252 ) ( OBJ-AT ?auto_59247 ?auto_59245 ) ( OBJ-AT ?auto_59248 ?auto_59245 ) ( OBJ-AT ?auto_59249 ?auto_59245 ) ( not ( = ?auto_59246 ?auto_59247 ) ) ( not ( = ?auto_59246 ?auto_59248 ) ) ( not ( = ?auto_59246 ?auto_59249 ) ) ( not ( = ?auto_59247 ?auto_59248 ) ) ( not ( = ?auto_59247 ?auto_59249 ) ) ( not ( = ?auto_59247 ?auto_59250 ) ) ( not ( = ?auto_59248 ?auto_59249 ) ) ( not ( = ?auto_59248 ?auto_59250 ) ) ( not ( = ?auto_59249 ?auto_59250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59250 ?auto_59246 ?auto_59245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59397 - OBJ
      ?auto_59398 - OBJ
      ?auto_59399 - OBJ
      ?auto_59396 - LOCATION
    )
    :vars
    (
      ?auto_59401 - LOCATION
      ?auto_59402 - CITY
      ?auto_59400 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59401 ?auto_59402 ) ( IN-CITY ?auto_59396 ?auto_59402 ) ( not ( = ?auto_59396 ?auto_59401 ) ) ( OBJ-AT ?auto_59398 ?auto_59396 ) ( not ( = ?auto_59398 ?auto_59399 ) ) ( OBJ-AT ?auto_59399 ?auto_59401 ) ( TRUCK-AT ?auto_59400 ?auto_59396 ) ( OBJ-AT ?auto_59397 ?auto_59396 ) ( not ( = ?auto_59397 ?auto_59398 ) ) ( not ( = ?auto_59397 ?auto_59399 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59398 ?auto_59399 ?auto_59396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59408 - OBJ
      ?auto_59409 - OBJ
      ?auto_59410 - OBJ
      ?auto_59407 - LOCATION
    )
    :vars
    (
      ?auto_59412 - LOCATION
      ?auto_59413 - CITY
      ?auto_59411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59412 ?auto_59413 ) ( IN-CITY ?auto_59407 ?auto_59413 ) ( not ( = ?auto_59407 ?auto_59412 ) ) ( OBJ-AT ?auto_59410 ?auto_59407 ) ( not ( = ?auto_59410 ?auto_59409 ) ) ( OBJ-AT ?auto_59409 ?auto_59412 ) ( TRUCK-AT ?auto_59411 ?auto_59407 ) ( OBJ-AT ?auto_59408 ?auto_59407 ) ( not ( = ?auto_59408 ?auto_59409 ) ) ( not ( = ?auto_59408 ?auto_59410 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59410 ?auto_59409 ?auto_59407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59430 - OBJ
      ?auto_59431 - OBJ
      ?auto_59432 - OBJ
      ?auto_59429 - LOCATION
    )
    :vars
    (
      ?auto_59434 - LOCATION
      ?auto_59436 - CITY
      ?auto_59435 - OBJ
      ?auto_59433 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59434 ?auto_59436 ) ( IN-CITY ?auto_59429 ?auto_59436 ) ( not ( = ?auto_59429 ?auto_59434 ) ) ( OBJ-AT ?auto_59435 ?auto_59429 ) ( not ( = ?auto_59435 ?auto_59432 ) ) ( OBJ-AT ?auto_59432 ?auto_59434 ) ( TRUCK-AT ?auto_59433 ?auto_59429 ) ( OBJ-AT ?auto_59430 ?auto_59429 ) ( OBJ-AT ?auto_59431 ?auto_59429 ) ( not ( = ?auto_59430 ?auto_59431 ) ) ( not ( = ?auto_59430 ?auto_59432 ) ) ( not ( = ?auto_59430 ?auto_59435 ) ) ( not ( = ?auto_59431 ?auto_59432 ) ) ( not ( = ?auto_59431 ?auto_59435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59435 ?auto_59432 ?auto_59429 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59442 - OBJ
      ?auto_59443 - OBJ
      ?auto_59444 - OBJ
      ?auto_59441 - LOCATION
    )
    :vars
    (
      ?auto_59446 - LOCATION
      ?auto_59448 - CITY
      ?auto_59447 - OBJ
      ?auto_59445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59446 ?auto_59448 ) ( IN-CITY ?auto_59441 ?auto_59448 ) ( not ( = ?auto_59441 ?auto_59446 ) ) ( OBJ-AT ?auto_59447 ?auto_59441 ) ( not ( = ?auto_59447 ?auto_59443 ) ) ( OBJ-AT ?auto_59443 ?auto_59446 ) ( TRUCK-AT ?auto_59445 ?auto_59441 ) ( OBJ-AT ?auto_59442 ?auto_59441 ) ( OBJ-AT ?auto_59444 ?auto_59441 ) ( not ( = ?auto_59442 ?auto_59443 ) ) ( not ( = ?auto_59442 ?auto_59444 ) ) ( not ( = ?auto_59442 ?auto_59447 ) ) ( not ( = ?auto_59443 ?auto_59444 ) ) ( not ( = ?auto_59444 ?auto_59447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59447 ?auto_59443 ?auto_59441 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59458 - OBJ
      ?auto_59459 - OBJ
      ?auto_59460 - OBJ
      ?auto_59457 - LOCATION
    )
    :vars
    (
      ?auto_59462 - LOCATION
      ?auto_59463 - CITY
      ?auto_59461 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59462 ?auto_59463 ) ( IN-CITY ?auto_59457 ?auto_59463 ) ( not ( = ?auto_59457 ?auto_59462 ) ) ( OBJ-AT ?auto_59459 ?auto_59457 ) ( not ( = ?auto_59459 ?auto_59458 ) ) ( OBJ-AT ?auto_59458 ?auto_59462 ) ( TRUCK-AT ?auto_59461 ?auto_59457 ) ( OBJ-AT ?auto_59460 ?auto_59457 ) ( not ( = ?auto_59458 ?auto_59460 ) ) ( not ( = ?auto_59459 ?auto_59460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59459 ?auto_59458 ?auto_59457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59480 - OBJ
      ?auto_59481 - OBJ
      ?auto_59482 - OBJ
      ?auto_59479 - LOCATION
    )
    :vars
    (
      ?auto_59484 - LOCATION
      ?auto_59486 - CITY
      ?auto_59485 - OBJ
      ?auto_59483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59484 ?auto_59486 ) ( IN-CITY ?auto_59479 ?auto_59486 ) ( not ( = ?auto_59479 ?auto_59484 ) ) ( OBJ-AT ?auto_59485 ?auto_59479 ) ( not ( = ?auto_59485 ?auto_59480 ) ) ( OBJ-AT ?auto_59480 ?auto_59484 ) ( TRUCK-AT ?auto_59483 ?auto_59479 ) ( OBJ-AT ?auto_59481 ?auto_59479 ) ( OBJ-AT ?auto_59482 ?auto_59479 ) ( not ( = ?auto_59480 ?auto_59481 ) ) ( not ( = ?auto_59480 ?auto_59482 ) ) ( not ( = ?auto_59481 ?auto_59482 ) ) ( not ( = ?auto_59481 ?auto_59485 ) ) ( not ( = ?auto_59482 ?auto_59485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59485 ?auto_59480 ?auto_59479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59519 - OBJ
      ?auto_59520 - OBJ
      ?auto_59521 - OBJ
      ?auto_59522 - OBJ
      ?auto_59518 - LOCATION
    )
    :vars
    (
      ?auto_59524 - LOCATION
      ?auto_59525 - CITY
      ?auto_59523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59524 ?auto_59525 ) ( IN-CITY ?auto_59518 ?auto_59525 ) ( not ( = ?auto_59518 ?auto_59524 ) ) ( OBJ-AT ?auto_59520 ?auto_59518 ) ( not ( = ?auto_59520 ?auto_59522 ) ) ( OBJ-AT ?auto_59522 ?auto_59524 ) ( TRUCK-AT ?auto_59523 ?auto_59518 ) ( OBJ-AT ?auto_59519 ?auto_59518 ) ( OBJ-AT ?auto_59521 ?auto_59518 ) ( not ( = ?auto_59519 ?auto_59520 ) ) ( not ( = ?auto_59519 ?auto_59521 ) ) ( not ( = ?auto_59519 ?auto_59522 ) ) ( not ( = ?auto_59520 ?auto_59521 ) ) ( not ( = ?auto_59521 ?auto_59522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59520 ?auto_59522 ?auto_59518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59527 - OBJ
      ?auto_59528 - OBJ
      ?auto_59529 - OBJ
      ?auto_59530 - OBJ
      ?auto_59526 - LOCATION
    )
    :vars
    (
      ?auto_59532 - LOCATION
      ?auto_59533 - CITY
      ?auto_59531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59532 ?auto_59533 ) ( IN-CITY ?auto_59526 ?auto_59533 ) ( not ( = ?auto_59526 ?auto_59532 ) ) ( OBJ-AT ?auto_59527 ?auto_59526 ) ( not ( = ?auto_59527 ?auto_59530 ) ) ( OBJ-AT ?auto_59530 ?auto_59532 ) ( TRUCK-AT ?auto_59531 ?auto_59526 ) ( OBJ-AT ?auto_59528 ?auto_59526 ) ( OBJ-AT ?auto_59529 ?auto_59526 ) ( not ( = ?auto_59527 ?auto_59528 ) ) ( not ( = ?auto_59527 ?auto_59529 ) ) ( not ( = ?auto_59528 ?auto_59529 ) ) ( not ( = ?auto_59528 ?auto_59530 ) ) ( not ( = ?auto_59529 ?auto_59530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59527 ?auto_59530 ?auto_59526 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59535 - OBJ
      ?auto_59536 - OBJ
      ?auto_59537 - OBJ
      ?auto_59538 - OBJ
      ?auto_59534 - LOCATION
    )
    :vars
    (
      ?auto_59540 - LOCATION
      ?auto_59541 - CITY
      ?auto_59539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59540 ?auto_59541 ) ( IN-CITY ?auto_59534 ?auto_59541 ) ( not ( = ?auto_59534 ?auto_59540 ) ) ( OBJ-AT ?auto_59538 ?auto_59534 ) ( not ( = ?auto_59538 ?auto_59537 ) ) ( OBJ-AT ?auto_59537 ?auto_59540 ) ( TRUCK-AT ?auto_59539 ?auto_59534 ) ( OBJ-AT ?auto_59535 ?auto_59534 ) ( OBJ-AT ?auto_59536 ?auto_59534 ) ( not ( = ?auto_59535 ?auto_59536 ) ) ( not ( = ?auto_59535 ?auto_59537 ) ) ( not ( = ?auto_59535 ?auto_59538 ) ) ( not ( = ?auto_59536 ?auto_59537 ) ) ( not ( = ?auto_59536 ?auto_59538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59538 ?auto_59537 ?auto_59534 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59599 - OBJ
      ?auto_59600 - OBJ
      ?auto_59601 - OBJ
      ?auto_59602 - OBJ
      ?auto_59598 - LOCATION
    )
    :vars
    (
      ?auto_59604 - LOCATION
      ?auto_59605 - CITY
      ?auto_59603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59604 ?auto_59605 ) ( IN-CITY ?auto_59598 ?auto_59605 ) ( not ( = ?auto_59598 ?auto_59604 ) ) ( OBJ-AT ?auto_59602 ?auto_59598 ) ( not ( = ?auto_59602 ?auto_59600 ) ) ( OBJ-AT ?auto_59600 ?auto_59604 ) ( TRUCK-AT ?auto_59603 ?auto_59598 ) ( OBJ-AT ?auto_59599 ?auto_59598 ) ( OBJ-AT ?auto_59601 ?auto_59598 ) ( not ( = ?auto_59599 ?auto_59600 ) ) ( not ( = ?auto_59599 ?auto_59601 ) ) ( not ( = ?auto_59599 ?auto_59602 ) ) ( not ( = ?auto_59600 ?auto_59601 ) ) ( not ( = ?auto_59601 ?auto_59602 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59602 ?auto_59600 ?auto_59598 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59607 - OBJ
      ?auto_59608 - OBJ
      ?auto_59609 - OBJ
      ?auto_59610 - OBJ
      ?auto_59606 - LOCATION
    )
    :vars
    (
      ?auto_59612 - LOCATION
      ?auto_59613 - CITY
      ?auto_59611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59612 ?auto_59613 ) ( IN-CITY ?auto_59606 ?auto_59613 ) ( not ( = ?auto_59606 ?auto_59612 ) ) ( OBJ-AT ?auto_59609 ?auto_59606 ) ( not ( = ?auto_59609 ?auto_59608 ) ) ( OBJ-AT ?auto_59608 ?auto_59612 ) ( TRUCK-AT ?auto_59611 ?auto_59606 ) ( OBJ-AT ?auto_59607 ?auto_59606 ) ( OBJ-AT ?auto_59610 ?auto_59606 ) ( not ( = ?auto_59607 ?auto_59608 ) ) ( not ( = ?auto_59607 ?auto_59609 ) ) ( not ( = ?auto_59607 ?auto_59610 ) ) ( not ( = ?auto_59608 ?auto_59610 ) ) ( not ( = ?auto_59609 ?auto_59610 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59609 ?auto_59608 ?auto_59606 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59687 - OBJ
      ?auto_59688 - OBJ
      ?auto_59689 - OBJ
      ?auto_59690 - OBJ
      ?auto_59686 - LOCATION
    )
    :vars
    (
      ?auto_59692 - LOCATION
      ?auto_59693 - CITY
      ?auto_59691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59692 ?auto_59693 ) ( IN-CITY ?auto_59686 ?auto_59693 ) ( not ( = ?auto_59686 ?auto_59692 ) ) ( OBJ-AT ?auto_59688 ?auto_59686 ) ( not ( = ?auto_59688 ?auto_59689 ) ) ( OBJ-AT ?auto_59689 ?auto_59692 ) ( TRUCK-AT ?auto_59691 ?auto_59686 ) ( OBJ-AT ?auto_59687 ?auto_59686 ) ( OBJ-AT ?auto_59690 ?auto_59686 ) ( not ( = ?auto_59687 ?auto_59688 ) ) ( not ( = ?auto_59687 ?auto_59689 ) ) ( not ( = ?auto_59687 ?auto_59690 ) ) ( not ( = ?auto_59688 ?auto_59690 ) ) ( not ( = ?auto_59689 ?auto_59690 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59688 ?auto_59689 ?auto_59686 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59719 - OBJ
      ?auto_59720 - OBJ
      ?auto_59721 - OBJ
      ?auto_59722 - OBJ
      ?auto_59718 - LOCATION
    )
    :vars
    (
      ?auto_59724 - LOCATION
      ?auto_59726 - CITY
      ?auto_59725 - OBJ
      ?auto_59723 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59724 ?auto_59726 ) ( IN-CITY ?auto_59718 ?auto_59726 ) ( not ( = ?auto_59718 ?auto_59724 ) ) ( OBJ-AT ?auto_59725 ?auto_59718 ) ( not ( = ?auto_59725 ?auto_59722 ) ) ( OBJ-AT ?auto_59722 ?auto_59724 ) ( TRUCK-AT ?auto_59723 ?auto_59718 ) ( OBJ-AT ?auto_59719 ?auto_59718 ) ( OBJ-AT ?auto_59720 ?auto_59718 ) ( OBJ-AT ?auto_59721 ?auto_59718 ) ( not ( = ?auto_59719 ?auto_59720 ) ) ( not ( = ?auto_59719 ?auto_59721 ) ) ( not ( = ?auto_59719 ?auto_59722 ) ) ( not ( = ?auto_59719 ?auto_59725 ) ) ( not ( = ?auto_59720 ?auto_59721 ) ) ( not ( = ?auto_59720 ?auto_59722 ) ) ( not ( = ?auto_59720 ?auto_59725 ) ) ( not ( = ?auto_59721 ?auto_59722 ) ) ( not ( = ?auto_59721 ?auto_59725 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59725 ?auto_59722 ?auto_59718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59736 - OBJ
      ?auto_59737 - OBJ
      ?auto_59738 - OBJ
      ?auto_59739 - OBJ
      ?auto_59735 - LOCATION
    )
    :vars
    (
      ?auto_59741 - LOCATION
      ?auto_59743 - CITY
      ?auto_59742 - OBJ
      ?auto_59740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59741 ?auto_59743 ) ( IN-CITY ?auto_59735 ?auto_59743 ) ( not ( = ?auto_59735 ?auto_59741 ) ) ( OBJ-AT ?auto_59742 ?auto_59735 ) ( not ( = ?auto_59742 ?auto_59738 ) ) ( OBJ-AT ?auto_59738 ?auto_59741 ) ( TRUCK-AT ?auto_59740 ?auto_59735 ) ( OBJ-AT ?auto_59736 ?auto_59735 ) ( OBJ-AT ?auto_59737 ?auto_59735 ) ( OBJ-AT ?auto_59739 ?auto_59735 ) ( not ( = ?auto_59736 ?auto_59737 ) ) ( not ( = ?auto_59736 ?auto_59738 ) ) ( not ( = ?auto_59736 ?auto_59739 ) ) ( not ( = ?auto_59736 ?auto_59742 ) ) ( not ( = ?auto_59737 ?auto_59738 ) ) ( not ( = ?auto_59737 ?auto_59739 ) ) ( not ( = ?auto_59737 ?auto_59742 ) ) ( not ( = ?auto_59738 ?auto_59739 ) ) ( not ( = ?auto_59739 ?auto_59742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59742 ?auto_59738 ?auto_59735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59786 - OBJ
      ?auto_59787 - OBJ
      ?auto_59788 - OBJ
      ?auto_59789 - OBJ
      ?auto_59785 - LOCATION
    )
    :vars
    (
      ?auto_59791 - LOCATION
      ?auto_59793 - CITY
      ?auto_59792 - OBJ
      ?auto_59790 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59791 ?auto_59793 ) ( IN-CITY ?auto_59785 ?auto_59793 ) ( not ( = ?auto_59785 ?auto_59791 ) ) ( OBJ-AT ?auto_59792 ?auto_59785 ) ( not ( = ?auto_59792 ?auto_59787 ) ) ( OBJ-AT ?auto_59787 ?auto_59791 ) ( TRUCK-AT ?auto_59790 ?auto_59785 ) ( OBJ-AT ?auto_59786 ?auto_59785 ) ( OBJ-AT ?auto_59788 ?auto_59785 ) ( OBJ-AT ?auto_59789 ?auto_59785 ) ( not ( = ?auto_59786 ?auto_59787 ) ) ( not ( = ?auto_59786 ?auto_59788 ) ) ( not ( = ?auto_59786 ?auto_59789 ) ) ( not ( = ?auto_59786 ?auto_59792 ) ) ( not ( = ?auto_59787 ?auto_59788 ) ) ( not ( = ?auto_59787 ?auto_59789 ) ) ( not ( = ?auto_59788 ?auto_59789 ) ) ( not ( = ?auto_59788 ?auto_59792 ) ) ( not ( = ?auto_59789 ?auto_59792 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59792 ?auto_59787 ?auto_59785 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59830 - OBJ
      ?auto_59831 - OBJ
      ?auto_59832 - OBJ
      ?auto_59833 - OBJ
      ?auto_59829 - LOCATION
    )
    :vars
    (
      ?auto_59835 - LOCATION
      ?auto_59836 - CITY
      ?auto_59834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59835 ?auto_59836 ) ( IN-CITY ?auto_59829 ?auto_59836 ) ( not ( = ?auto_59829 ?auto_59835 ) ) ( OBJ-AT ?auto_59833 ?auto_59829 ) ( not ( = ?auto_59833 ?auto_59830 ) ) ( OBJ-AT ?auto_59830 ?auto_59835 ) ( TRUCK-AT ?auto_59834 ?auto_59829 ) ( OBJ-AT ?auto_59831 ?auto_59829 ) ( OBJ-AT ?auto_59832 ?auto_59829 ) ( not ( = ?auto_59830 ?auto_59831 ) ) ( not ( = ?auto_59830 ?auto_59832 ) ) ( not ( = ?auto_59831 ?auto_59832 ) ) ( not ( = ?auto_59831 ?auto_59833 ) ) ( not ( = ?auto_59832 ?auto_59833 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59833 ?auto_59830 ?auto_59829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59862 - OBJ
      ?auto_59863 - OBJ
      ?auto_59864 - OBJ
      ?auto_59865 - OBJ
      ?auto_59861 - LOCATION
    )
    :vars
    (
      ?auto_59867 - LOCATION
      ?auto_59868 - CITY
      ?auto_59866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59867 ?auto_59868 ) ( IN-CITY ?auto_59861 ?auto_59868 ) ( not ( = ?auto_59861 ?auto_59867 ) ) ( OBJ-AT ?auto_59863 ?auto_59861 ) ( not ( = ?auto_59863 ?auto_59862 ) ) ( OBJ-AT ?auto_59862 ?auto_59867 ) ( TRUCK-AT ?auto_59866 ?auto_59861 ) ( OBJ-AT ?auto_59864 ?auto_59861 ) ( OBJ-AT ?auto_59865 ?auto_59861 ) ( not ( = ?auto_59862 ?auto_59864 ) ) ( not ( = ?auto_59862 ?auto_59865 ) ) ( not ( = ?auto_59863 ?auto_59864 ) ) ( not ( = ?auto_59863 ?auto_59865 ) ) ( not ( = ?auto_59864 ?auto_59865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59863 ?auto_59862 ?auto_59861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59934 - OBJ
      ?auto_59935 - OBJ
      ?auto_59936 - OBJ
      ?auto_59937 - OBJ
      ?auto_59933 - LOCATION
    )
    :vars
    (
      ?auto_59939 - LOCATION
      ?auto_59941 - CITY
      ?auto_59940 - OBJ
      ?auto_59938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59939 ?auto_59941 ) ( IN-CITY ?auto_59933 ?auto_59941 ) ( not ( = ?auto_59933 ?auto_59939 ) ) ( OBJ-AT ?auto_59940 ?auto_59933 ) ( not ( = ?auto_59940 ?auto_59934 ) ) ( OBJ-AT ?auto_59934 ?auto_59939 ) ( TRUCK-AT ?auto_59938 ?auto_59933 ) ( OBJ-AT ?auto_59935 ?auto_59933 ) ( OBJ-AT ?auto_59936 ?auto_59933 ) ( OBJ-AT ?auto_59937 ?auto_59933 ) ( not ( = ?auto_59934 ?auto_59935 ) ) ( not ( = ?auto_59934 ?auto_59936 ) ) ( not ( = ?auto_59934 ?auto_59937 ) ) ( not ( = ?auto_59935 ?auto_59936 ) ) ( not ( = ?auto_59935 ?auto_59937 ) ) ( not ( = ?auto_59935 ?auto_59940 ) ) ( not ( = ?auto_59936 ?auto_59937 ) ) ( not ( = ?auto_59936 ?auto_59940 ) ) ( not ( = ?auto_59937 ?auto_59940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59940 ?auto_59934 ?auto_59933 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60758 - OBJ
      ?auto_60757 - LOCATION
    )
    :vars
    (
      ?auto_60759 - LOCATION
      ?auto_60760 - CITY
      ?auto_60762 - OBJ
      ?auto_60761 - TRUCK
      ?auto_60763 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60759 ?auto_60760 ) ( IN-CITY ?auto_60757 ?auto_60760 ) ( not ( = ?auto_60757 ?auto_60759 ) ) ( OBJ-AT ?auto_60762 ?auto_60757 ) ( not ( = ?auto_60762 ?auto_60758 ) ) ( OBJ-AT ?auto_60758 ?auto_60759 ) ( TRUCK-AT ?auto_60761 ?auto_60763 ) ( IN-CITY ?auto_60763 ?auto_60760 ) ( not ( = ?auto_60757 ?auto_60763 ) ) ( not ( = ?auto_60759 ?auto_60763 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60761 ?auto_60763 ?auto_60757 ?auto_60760 )
      ( DELIVER-2PKG ?auto_60762 ?auto_60758 ?auto_60757 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60765 - OBJ
      ?auto_60766 - OBJ
      ?auto_60764 - LOCATION
    )
    :vars
    (
      ?auto_60768 - LOCATION
      ?auto_60769 - CITY
      ?auto_60767 - TRUCK
      ?auto_60770 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60768 ?auto_60769 ) ( IN-CITY ?auto_60764 ?auto_60769 ) ( not ( = ?auto_60764 ?auto_60768 ) ) ( OBJ-AT ?auto_60765 ?auto_60764 ) ( not ( = ?auto_60765 ?auto_60766 ) ) ( OBJ-AT ?auto_60766 ?auto_60768 ) ( TRUCK-AT ?auto_60767 ?auto_60770 ) ( IN-CITY ?auto_60770 ?auto_60769 ) ( not ( = ?auto_60764 ?auto_60770 ) ) ( not ( = ?auto_60768 ?auto_60770 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60766 ?auto_60764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60780 - OBJ
      ?auto_60781 - OBJ
      ?auto_60779 - LOCATION
    )
    :vars
    (
      ?auto_60782 - LOCATION
      ?auto_60783 - CITY
      ?auto_60784 - TRUCK
      ?auto_60785 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60782 ?auto_60783 ) ( IN-CITY ?auto_60779 ?auto_60783 ) ( not ( = ?auto_60779 ?auto_60782 ) ) ( OBJ-AT ?auto_60781 ?auto_60779 ) ( not ( = ?auto_60781 ?auto_60780 ) ) ( OBJ-AT ?auto_60780 ?auto_60782 ) ( TRUCK-AT ?auto_60784 ?auto_60785 ) ( IN-CITY ?auto_60785 ?auto_60783 ) ( not ( = ?auto_60779 ?auto_60785 ) ) ( not ( = ?auto_60782 ?auto_60785 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60781 ?auto_60780 ?auto_60779 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60803 - OBJ
      ?auto_60804 - OBJ
      ?auto_60805 - OBJ
      ?auto_60802 - LOCATION
    )
    :vars
    (
      ?auto_60806 - LOCATION
      ?auto_60807 - CITY
      ?auto_60808 - TRUCK
      ?auto_60809 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60806 ?auto_60807 ) ( IN-CITY ?auto_60802 ?auto_60807 ) ( not ( = ?auto_60802 ?auto_60806 ) ) ( OBJ-AT ?auto_60803 ?auto_60802 ) ( not ( = ?auto_60803 ?auto_60805 ) ) ( OBJ-AT ?auto_60805 ?auto_60806 ) ( TRUCK-AT ?auto_60808 ?auto_60809 ) ( IN-CITY ?auto_60809 ?auto_60807 ) ( not ( = ?auto_60802 ?auto_60809 ) ) ( not ( = ?auto_60806 ?auto_60809 ) ) ( OBJ-AT ?auto_60804 ?auto_60802 ) ( not ( = ?auto_60803 ?auto_60804 ) ) ( not ( = ?auto_60804 ?auto_60805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60803 ?auto_60805 ?auto_60802 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60819 - OBJ
      ?auto_60820 - OBJ
      ?auto_60821 - OBJ
      ?auto_60818 - LOCATION
    )
    :vars
    (
      ?auto_60822 - LOCATION
      ?auto_60823 - CITY
      ?auto_60824 - TRUCK
      ?auto_60825 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60822 ?auto_60823 ) ( IN-CITY ?auto_60818 ?auto_60823 ) ( not ( = ?auto_60818 ?auto_60822 ) ) ( OBJ-AT ?auto_60819 ?auto_60818 ) ( not ( = ?auto_60819 ?auto_60820 ) ) ( OBJ-AT ?auto_60820 ?auto_60822 ) ( TRUCK-AT ?auto_60824 ?auto_60825 ) ( IN-CITY ?auto_60825 ?auto_60823 ) ( not ( = ?auto_60818 ?auto_60825 ) ) ( not ( = ?auto_60822 ?auto_60825 ) ) ( OBJ-AT ?auto_60821 ?auto_60818 ) ( not ( = ?auto_60819 ?auto_60821 ) ) ( not ( = ?auto_60820 ?auto_60821 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60819 ?auto_60820 ?auto_60818 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60886 - OBJ
      ?auto_60887 - OBJ
      ?auto_60888 - OBJ
      ?auto_60885 - LOCATION
    )
    :vars
    (
      ?auto_60889 - LOCATION
      ?auto_60890 - CITY
      ?auto_60891 - TRUCK
      ?auto_60892 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60889 ?auto_60890 ) ( IN-CITY ?auto_60885 ?auto_60890 ) ( not ( = ?auto_60885 ?auto_60889 ) ) ( OBJ-AT ?auto_60888 ?auto_60885 ) ( not ( = ?auto_60888 ?auto_60886 ) ) ( OBJ-AT ?auto_60886 ?auto_60889 ) ( TRUCK-AT ?auto_60891 ?auto_60892 ) ( IN-CITY ?auto_60892 ?auto_60890 ) ( not ( = ?auto_60885 ?auto_60892 ) ) ( not ( = ?auto_60889 ?auto_60892 ) ) ( OBJ-AT ?auto_60887 ?auto_60885 ) ( not ( = ?auto_60886 ?auto_60887 ) ) ( not ( = ?auto_60887 ?auto_60888 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60888 ?auto_60886 ?auto_60885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60962 - OBJ
      ?auto_60963 - OBJ
      ?auto_60964 - OBJ
      ?auto_60965 - OBJ
      ?auto_60961 - LOCATION
    )
    :vars
    (
      ?auto_60966 - LOCATION
      ?auto_60967 - CITY
      ?auto_60968 - TRUCK
      ?auto_60969 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60966 ?auto_60967 ) ( IN-CITY ?auto_60961 ?auto_60967 ) ( not ( = ?auto_60961 ?auto_60966 ) ) ( OBJ-AT ?auto_60962 ?auto_60961 ) ( not ( = ?auto_60962 ?auto_60965 ) ) ( OBJ-AT ?auto_60965 ?auto_60966 ) ( TRUCK-AT ?auto_60968 ?auto_60969 ) ( IN-CITY ?auto_60969 ?auto_60967 ) ( not ( = ?auto_60961 ?auto_60969 ) ) ( not ( = ?auto_60966 ?auto_60969 ) ) ( OBJ-AT ?auto_60963 ?auto_60961 ) ( OBJ-AT ?auto_60964 ?auto_60961 ) ( not ( = ?auto_60962 ?auto_60963 ) ) ( not ( = ?auto_60962 ?auto_60964 ) ) ( not ( = ?auto_60963 ?auto_60964 ) ) ( not ( = ?auto_60963 ?auto_60965 ) ) ( not ( = ?auto_60964 ?auto_60965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60962 ?auto_60965 ?auto_60961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60980 - OBJ
      ?auto_60981 - OBJ
      ?auto_60982 - OBJ
      ?auto_60983 - OBJ
      ?auto_60979 - LOCATION
    )
    :vars
    (
      ?auto_60984 - LOCATION
      ?auto_60985 - CITY
      ?auto_60986 - TRUCK
      ?auto_60987 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60984 ?auto_60985 ) ( IN-CITY ?auto_60979 ?auto_60985 ) ( not ( = ?auto_60979 ?auto_60984 ) ) ( OBJ-AT ?auto_60983 ?auto_60979 ) ( not ( = ?auto_60983 ?auto_60982 ) ) ( OBJ-AT ?auto_60982 ?auto_60984 ) ( TRUCK-AT ?auto_60986 ?auto_60987 ) ( IN-CITY ?auto_60987 ?auto_60985 ) ( not ( = ?auto_60979 ?auto_60987 ) ) ( not ( = ?auto_60984 ?auto_60987 ) ) ( OBJ-AT ?auto_60980 ?auto_60979 ) ( OBJ-AT ?auto_60981 ?auto_60979 ) ( not ( = ?auto_60980 ?auto_60981 ) ) ( not ( = ?auto_60980 ?auto_60982 ) ) ( not ( = ?auto_60980 ?auto_60983 ) ) ( not ( = ?auto_60981 ?auto_60982 ) ) ( not ( = ?auto_60981 ?auto_60983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60983 ?auto_60982 ?auto_60979 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61052 - OBJ
      ?auto_61053 - OBJ
      ?auto_61054 - OBJ
      ?auto_61055 - OBJ
      ?auto_61051 - LOCATION
    )
    :vars
    (
      ?auto_61056 - LOCATION
      ?auto_61057 - CITY
      ?auto_61058 - TRUCK
      ?auto_61059 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61056 ?auto_61057 ) ( IN-CITY ?auto_61051 ?auto_61057 ) ( not ( = ?auto_61051 ?auto_61056 ) ) ( OBJ-AT ?auto_61052 ?auto_61051 ) ( not ( = ?auto_61052 ?auto_61053 ) ) ( OBJ-AT ?auto_61053 ?auto_61056 ) ( TRUCK-AT ?auto_61058 ?auto_61059 ) ( IN-CITY ?auto_61059 ?auto_61057 ) ( not ( = ?auto_61051 ?auto_61059 ) ) ( not ( = ?auto_61056 ?auto_61059 ) ) ( OBJ-AT ?auto_61054 ?auto_61051 ) ( OBJ-AT ?auto_61055 ?auto_61051 ) ( not ( = ?auto_61052 ?auto_61054 ) ) ( not ( = ?auto_61052 ?auto_61055 ) ) ( not ( = ?auto_61053 ?auto_61054 ) ) ( not ( = ?auto_61053 ?auto_61055 ) ) ( not ( = ?auto_61054 ?auto_61055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61052 ?auto_61053 ?auto_61051 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61311 - OBJ
      ?auto_61312 - OBJ
      ?auto_61313 - OBJ
      ?auto_61314 - OBJ
      ?auto_61310 - LOCATION
    )
    :vars
    (
      ?auto_61315 - LOCATION
      ?auto_61316 - CITY
      ?auto_61317 - TRUCK
      ?auto_61318 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61315 ?auto_61316 ) ( IN-CITY ?auto_61310 ?auto_61316 ) ( not ( = ?auto_61310 ?auto_61315 ) ) ( OBJ-AT ?auto_61313 ?auto_61310 ) ( not ( = ?auto_61313 ?auto_61311 ) ) ( OBJ-AT ?auto_61311 ?auto_61315 ) ( TRUCK-AT ?auto_61317 ?auto_61318 ) ( IN-CITY ?auto_61318 ?auto_61316 ) ( not ( = ?auto_61310 ?auto_61318 ) ) ( not ( = ?auto_61315 ?auto_61318 ) ) ( OBJ-AT ?auto_61312 ?auto_61310 ) ( OBJ-AT ?auto_61314 ?auto_61310 ) ( not ( = ?auto_61311 ?auto_61312 ) ) ( not ( = ?auto_61311 ?auto_61314 ) ) ( not ( = ?auto_61312 ?auto_61313 ) ) ( not ( = ?auto_61312 ?auto_61314 ) ) ( not ( = ?auto_61313 ?auto_61314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61313 ?auto_61311 ?auto_61310 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61610 - OBJ
      ?auto_61611 - OBJ
      ?auto_61612 - OBJ
      ?auto_61609 - LOCATION
    )
    :vars
    (
      ?auto_61613 - LOCATION
      ?auto_61615 - CITY
      ?auto_61616 - TRUCK
      ?auto_61614 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61613 ?auto_61615 ) ( IN-CITY ?auto_61609 ?auto_61615 ) ( not ( = ?auto_61609 ?auto_61613 ) ) ( OBJ-AT ?auto_61612 ?auto_61609 ) ( not ( = ?auto_61612 ?auto_61611 ) ) ( OBJ-AT ?auto_61611 ?auto_61613 ) ( TRUCK-AT ?auto_61616 ?auto_61614 ) ( IN-CITY ?auto_61614 ?auto_61615 ) ( not ( = ?auto_61609 ?auto_61614 ) ) ( not ( = ?auto_61613 ?auto_61614 ) ) ( OBJ-AT ?auto_61610 ?auto_61609 ) ( not ( = ?auto_61610 ?auto_61611 ) ) ( not ( = ?auto_61610 ?auto_61612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61612 ?auto_61611 ?auto_61609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62102 - OBJ
      ?auto_62103 - OBJ
      ?auto_62104 - OBJ
      ?auto_62105 - OBJ
      ?auto_62101 - LOCATION
    )
    :vars
    (
      ?auto_62106 - LOCATION
      ?auto_62108 - CITY
      ?auto_62109 - TRUCK
      ?auto_62107 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_62106 ?auto_62108 ) ( IN-CITY ?auto_62101 ?auto_62108 ) ( not ( = ?auto_62101 ?auto_62106 ) ) ( OBJ-AT ?auto_62103 ?auto_62101 ) ( not ( = ?auto_62103 ?auto_62102 ) ) ( OBJ-AT ?auto_62102 ?auto_62106 ) ( TRUCK-AT ?auto_62109 ?auto_62107 ) ( IN-CITY ?auto_62107 ?auto_62108 ) ( not ( = ?auto_62101 ?auto_62107 ) ) ( not ( = ?auto_62106 ?auto_62107 ) ) ( OBJ-AT ?auto_62104 ?auto_62101 ) ( OBJ-AT ?auto_62105 ?auto_62101 ) ( not ( = ?auto_62102 ?auto_62104 ) ) ( not ( = ?auto_62102 ?auto_62105 ) ) ( not ( = ?auto_62103 ?auto_62104 ) ) ( not ( = ?auto_62103 ?auto_62105 ) ) ( not ( = ?auto_62104 ?auto_62105 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62103 ?auto_62102 ?auto_62101 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63761 - OBJ
      ?auto_63760 - LOCATION
    )
    :vars
    (
      ?auto_63762 - LOCATION
      ?auto_63764 - CITY
      ?auto_63765 - OBJ
      ?auto_63763 - TRUCK
      ?auto_63766 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63762 ?auto_63764 ) ( IN-CITY ?auto_63760 ?auto_63764 ) ( not ( = ?auto_63760 ?auto_63762 ) ) ( not ( = ?auto_63765 ?auto_63761 ) ) ( OBJ-AT ?auto_63761 ?auto_63762 ) ( IN-TRUCK ?auto_63765 ?auto_63763 ) ( TRUCK-AT ?auto_63763 ?auto_63766 ) ( IN-CITY ?auto_63766 ?auto_63764 ) ( not ( = ?auto_63760 ?auto_63766 ) ) ( not ( = ?auto_63762 ?auto_63766 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_63763 ?auto_63766 ?auto_63760 ?auto_63764 )
      ( DELIVER-2PKG ?auto_63765 ?auto_63761 ?auto_63760 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63768 - OBJ
      ?auto_63769 - OBJ
      ?auto_63767 - LOCATION
    )
    :vars
    (
      ?auto_63773 - LOCATION
      ?auto_63770 - CITY
      ?auto_63772 - TRUCK
      ?auto_63771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63773 ?auto_63770 ) ( IN-CITY ?auto_63767 ?auto_63770 ) ( not ( = ?auto_63767 ?auto_63773 ) ) ( not ( = ?auto_63768 ?auto_63769 ) ) ( OBJ-AT ?auto_63769 ?auto_63773 ) ( IN-TRUCK ?auto_63768 ?auto_63772 ) ( TRUCK-AT ?auto_63772 ?auto_63771 ) ( IN-CITY ?auto_63771 ?auto_63770 ) ( not ( = ?auto_63767 ?auto_63771 ) ) ( not ( = ?auto_63773 ?auto_63771 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63769 ?auto_63767 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63783 - OBJ
      ?auto_63784 - OBJ
      ?auto_63782 - LOCATION
    )
    :vars
    (
      ?auto_63785 - LOCATION
      ?auto_63788 - CITY
      ?auto_63786 - TRUCK
      ?auto_63787 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63785 ?auto_63788 ) ( IN-CITY ?auto_63782 ?auto_63788 ) ( not ( = ?auto_63782 ?auto_63785 ) ) ( not ( = ?auto_63784 ?auto_63783 ) ) ( OBJ-AT ?auto_63783 ?auto_63785 ) ( IN-TRUCK ?auto_63784 ?auto_63786 ) ( TRUCK-AT ?auto_63786 ?auto_63787 ) ( IN-CITY ?auto_63787 ?auto_63788 ) ( not ( = ?auto_63782 ?auto_63787 ) ) ( not ( = ?auto_63785 ?auto_63787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63784 ?auto_63783 ?auto_63782 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_64565 - OBJ
      ?auto_64564 - LOCATION
    )
    :vars
    (
      ?auto_64566 - LOCATION
      ?auto_64570 - CITY
      ?auto_64567 - OBJ
      ?auto_64568 - TRUCK
      ?auto_64569 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64566 ?auto_64570 ) ( IN-CITY ?auto_64564 ?auto_64570 ) ( not ( = ?auto_64564 ?auto_64566 ) ) ( not ( = ?auto_64567 ?auto_64565 ) ) ( OBJ-AT ?auto_64565 ?auto_64566 ) ( TRUCK-AT ?auto_64568 ?auto_64569 ) ( IN-CITY ?auto_64569 ?auto_64570 ) ( not ( = ?auto_64564 ?auto_64569 ) ) ( not ( = ?auto_64566 ?auto_64569 ) ) ( OBJ-AT ?auto_64567 ?auto_64569 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_64567 ?auto_64568 ?auto_64569 )
      ( DELIVER-2PKG ?auto_64567 ?auto_64565 ?auto_64564 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64572 - OBJ
      ?auto_64573 - OBJ
      ?auto_64571 - LOCATION
    )
    :vars
    (
      ?auto_64574 - LOCATION
      ?auto_64577 - CITY
      ?auto_64575 - TRUCK
      ?auto_64576 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64574 ?auto_64577 ) ( IN-CITY ?auto_64571 ?auto_64577 ) ( not ( = ?auto_64571 ?auto_64574 ) ) ( not ( = ?auto_64572 ?auto_64573 ) ) ( OBJ-AT ?auto_64573 ?auto_64574 ) ( TRUCK-AT ?auto_64575 ?auto_64576 ) ( IN-CITY ?auto_64576 ?auto_64577 ) ( not ( = ?auto_64571 ?auto_64576 ) ) ( not ( = ?auto_64574 ?auto_64576 ) ) ( OBJ-AT ?auto_64572 ?auto_64576 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_64573 ?auto_64571 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64582 - OBJ
      ?auto_64583 - OBJ
      ?auto_64581 - LOCATION
    )
    :vars
    (
      ?auto_64584 - LOCATION
      ?auto_64587 - CITY
      ?auto_64585 - TRUCK
      ?auto_64586 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64584 ?auto_64587 ) ( IN-CITY ?auto_64581 ?auto_64587 ) ( not ( = ?auto_64581 ?auto_64584 ) ) ( not ( = ?auto_64583 ?auto_64582 ) ) ( OBJ-AT ?auto_64582 ?auto_64584 ) ( TRUCK-AT ?auto_64585 ?auto_64586 ) ( IN-CITY ?auto_64586 ?auto_64587 ) ( not ( = ?auto_64581 ?auto_64586 ) ) ( not ( = ?auto_64584 ?auto_64586 ) ) ( OBJ-AT ?auto_64583 ?auto_64586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64583 ?auto_64582 ?auto_64581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69994 - OBJ
      ?auto_69995 - OBJ
      ?auto_69996 - OBJ
      ?auto_69993 - LOCATION
    )
    :vars
    (
      ?auto_69998 - TRUCK
      ?auto_69999 - LOCATION
      ?auto_69997 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_69998 ?auto_69999 ) ( IN-CITY ?auto_69999 ?auto_69997 ) ( IN-CITY ?auto_69993 ?auto_69997 ) ( not ( = ?auto_69993 ?auto_69999 ) ) ( OBJ-AT ?auto_69995 ?auto_69993 ) ( not ( = ?auto_69995 ?auto_69996 ) ) ( OBJ-AT ?auto_69996 ?auto_69999 ) ( OBJ-AT ?auto_69994 ?auto_69993 ) ( not ( = ?auto_69994 ?auto_69995 ) ) ( not ( = ?auto_69994 ?auto_69996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69995 ?auto_69996 ?auto_69993 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75116 - OBJ
      ?auto_75117 - OBJ
      ?auto_75118 - OBJ
      ?auto_75115 - LOCATION
    )
    :vars
    (
      ?auto_75119 - LOCATION
      ?auto_75123 - CITY
      ?auto_75120 - OBJ
      ?auto_75121 - TRUCK
      ?auto_75122 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75119 ?auto_75123 ) ( IN-CITY ?auto_75115 ?auto_75123 ) ( not ( = ?auto_75115 ?auto_75119 ) ) ( OBJ-AT ?auto_75120 ?auto_75115 ) ( not ( = ?auto_75120 ?auto_75118 ) ) ( OBJ-AT ?auto_75118 ?auto_75119 ) ( TRUCK-AT ?auto_75121 ?auto_75122 ) ( IN-CITY ?auto_75122 ?auto_75123 ) ( not ( = ?auto_75115 ?auto_75122 ) ) ( not ( = ?auto_75119 ?auto_75122 ) ) ( OBJ-AT ?auto_75116 ?auto_75115 ) ( OBJ-AT ?auto_75117 ?auto_75115 ) ( not ( = ?auto_75116 ?auto_75117 ) ) ( not ( = ?auto_75116 ?auto_75118 ) ) ( not ( = ?auto_75116 ?auto_75120 ) ) ( not ( = ?auto_75117 ?auto_75118 ) ) ( not ( = ?auto_75117 ?auto_75120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75120 ?auto_75118 ?auto_75115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75138 - OBJ
      ?auto_75139 - OBJ
      ?auto_75140 - OBJ
      ?auto_75137 - LOCATION
    )
    :vars
    (
      ?auto_75141 - LOCATION
      ?auto_75145 - CITY
      ?auto_75142 - OBJ
      ?auto_75143 - TRUCK
      ?auto_75144 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75141 ?auto_75145 ) ( IN-CITY ?auto_75137 ?auto_75145 ) ( not ( = ?auto_75137 ?auto_75141 ) ) ( OBJ-AT ?auto_75142 ?auto_75137 ) ( not ( = ?auto_75142 ?auto_75139 ) ) ( OBJ-AT ?auto_75139 ?auto_75141 ) ( TRUCK-AT ?auto_75143 ?auto_75144 ) ( IN-CITY ?auto_75144 ?auto_75145 ) ( not ( = ?auto_75137 ?auto_75144 ) ) ( not ( = ?auto_75141 ?auto_75144 ) ) ( OBJ-AT ?auto_75138 ?auto_75137 ) ( OBJ-AT ?auto_75140 ?auto_75137 ) ( not ( = ?auto_75138 ?auto_75139 ) ) ( not ( = ?auto_75138 ?auto_75140 ) ) ( not ( = ?auto_75138 ?auto_75142 ) ) ( not ( = ?auto_75139 ?auto_75140 ) ) ( not ( = ?auto_75140 ?auto_75142 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75142 ?auto_75139 ?auto_75137 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75258 - OBJ
      ?auto_75259 - OBJ
      ?auto_75260 - OBJ
      ?auto_75257 - LOCATION
    )
    :vars
    (
      ?auto_75261 - LOCATION
      ?auto_75265 - CITY
      ?auto_75262 - OBJ
      ?auto_75263 - TRUCK
      ?auto_75264 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75261 ?auto_75265 ) ( IN-CITY ?auto_75257 ?auto_75265 ) ( not ( = ?auto_75257 ?auto_75261 ) ) ( OBJ-AT ?auto_75262 ?auto_75257 ) ( not ( = ?auto_75262 ?auto_75258 ) ) ( OBJ-AT ?auto_75258 ?auto_75261 ) ( TRUCK-AT ?auto_75263 ?auto_75264 ) ( IN-CITY ?auto_75264 ?auto_75265 ) ( not ( = ?auto_75257 ?auto_75264 ) ) ( not ( = ?auto_75261 ?auto_75264 ) ) ( OBJ-AT ?auto_75259 ?auto_75257 ) ( OBJ-AT ?auto_75260 ?auto_75257 ) ( not ( = ?auto_75258 ?auto_75259 ) ) ( not ( = ?auto_75258 ?auto_75260 ) ) ( not ( = ?auto_75259 ?auto_75260 ) ) ( not ( = ?auto_75259 ?auto_75262 ) ) ( not ( = ?auto_75260 ?auto_75262 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75262 ?auto_75258 ?auto_75257 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75355 - OBJ
      ?auto_75356 - OBJ
      ?auto_75357 - OBJ
      ?auto_75358 - OBJ
      ?auto_75354 - LOCATION
    )
    :vars
    (
      ?auto_75359 - LOCATION
      ?auto_75362 - CITY
      ?auto_75360 - TRUCK
      ?auto_75361 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75359 ?auto_75362 ) ( IN-CITY ?auto_75354 ?auto_75362 ) ( not ( = ?auto_75354 ?auto_75359 ) ) ( OBJ-AT ?auto_75357 ?auto_75354 ) ( not ( = ?auto_75357 ?auto_75358 ) ) ( OBJ-AT ?auto_75358 ?auto_75359 ) ( TRUCK-AT ?auto_75360 ?auto_75361 ) ( IN-CITY ?auto_75361 ?auto_75362 ) ( not ( = ?auto_75354 ?auto_75361 ) ) ( not ( = ?auto_75359 ?auto_75361 ) ) ( OBJ-AT ?auto_75355 ?auto_75354 ) ( OBJ-AT ?auto_75356 ?auto_75354 ) ( not ( = ?auto_75355 ?auto_75356 ) ) ( not ( = ?auto_75355 ?auto_75357 ) ) ( not ( = ?auto_75355 ?auto_75358 ) ) ( not ( = ?auto_75356 ?auto_75357 ) ) ( not ( = ?auto_75356 ?auto_75358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75357 ?auto_75358 ?auto_75354 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75391 - OBJ
      ?auto_75392 - OBJ
      ?auto_75393 - OBJ
      ?auto_75394 - OBJ
      ?auto_75390 - LOCATION
    )
    :vars
    (
      ?auto_75395 - LOCATION
      ?auto_75398 - CITY
      ?auto_75396 - TRUCK
      ?auto_75397 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75395 ?auto_75398 ) ( IN-CITY ?auto_75390 ?auto_75398 ) ( not ( = ?auto_75390 ?auto_75395 ) ) ( OBJ-AT ?auto_75392 ?auto_75390 ) ( not ( = ?auto_75392 ?auto_75393 ) ) ( OBJ-AT ?auto_75393 ?auto_75395 ) ( TRUCK-AT ?auto_75396 ?auto_75397 ) ( IN-CITY ?auto_75397 ?auto_75398 ) ( not ( = ?auto_75390 ?auto_75397 ) ) ( not ( = ?auto_75395 ?auto_75397 ) ) ( OBJ-AT ?auto_75391 ?auto_75390 ) ( OBJ-AT ?auto_75394 ?auto_75390 ) ( not ( = ?auto_75391 ?auto_75392 ) ) ( not ( = ?auto_75391 ?auto_75393 ) ) ( not ( = ?auto_75391 ?auto_75394 ) ) ( not ( = ?auto_75392 ?auto_75394 ) ) ( not ( = ?auto_75393 ?auto_75394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75392 ?auto_75393 ?auto_75390 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75445 - OBJ
      ?auto_75446 - OBJ
      ?auto_75447 - OBJ
      ?auto_75448 - OBJ
      ?auto_75444 - LOCATION
    )
    :vars
    (
      ?auto_75449 - LOCATION
      ?auto_75452 - CITY
      ?auto_75450 - TRUCK
      ?auto_75451 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75449 ?auto_75452 ) ( IN-CITY ?auto_75444 ?auto_75452 ) ( not ( = ?auto_75444 ?auto_75449 ) ) ( OBJ-AT ?auto_75445 ?auto_75444 ) ( not ( = ?auto_75445 ?auto_75447 ) ) ( OBJ-AT ?auto_75447 ?auto_75449 ) ( TRUCK-AT ?auto_75450 ?auto_75451 ) ( IN-CITY ?auto_75451 ?auto_75452 ) ( not ( = ?auto_75444 ?auto_75451 ) ) ( not ( = ?auto_75449 ?auto_75451 ) ) ( OBJ-AT ?auto_75446 ?auto_75444 ) ( OBJ-AT ?auto_75448 ?auto_75444 ) ( not ( = ?auto_75445 ?auto_75446 ) ) ( not ( = ?auto_75445 ?auto_75448 ) ) ( not ( = ?auto_75446 ?auto_75447 ) ) ( not ( = ?auto_75446 ?auto_75448 ) ) ( not ( = ?auto_75447 ?auto_75448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75445 ?auto_75447 ?auto_75444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75553 - OBJ
      ?auto_75554 - OBJ
      ?auto_75555 - OBJ
      ?auto_75556 - OBJ
      ?auto_75552 - LOCATION
    )
    :vars
    (
      ?auto_75557 - LOCATION
      ?auto_75560 - CITY
      ?auto_75558 - TRUCK
      ?auto_75559 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75557 ?auto_75560 ) ( IN-CITY ?auto_75552 ?auto_75560 ) ( not ( = ?auto_75552 ?auto_75557 ) ) ( OBJ-AT ?auto_75555 ?auto_75552 ) ( not ( = ?auto_75555 ?auto_75554 ) ) ( OBJ-AT ?auto_75554 ?auto_75557 ) ( TRUCK-AT ?auto_75558 ?auto_75559 ) ( IN-CITY ?auto_75559 ?auto_75560 ) ( not ( = ?auto_75552 ?auto_75559 ) ) ( not ( = ?auto_75557 ?auto_75559 ) ) ( OBJ-AT ?auto_75553 ?auto_75552 ) ( OBJ-AT ?auto_75556 ?auto_75552 ) ( not ( = ?auto_75553 ?auto_75554 ) ) ( not ( = ?auto_75553 ?auto_75555 ) ) ( not ( = ?auto_75553 ?auto_75556 ) ) ( not ( = ?auto_75554 ?auto_75556 ) ) ( not ( = ?auto_75555 ?auto_75556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75555 ?auto_75554 ?auto_75552 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75580 - OBJ
      ?auto_75581 - OBJ
      ?auto_75582 - OBJ
      ?auto_75583 - OBJ
      ?auto_75579 - LOCATION
    )
    :vars
    (
      ?auto_75584 - LOCATION
      ?auto_75587 - CITY
      ?auto_75585 - TRUCK
      ?auto_75586 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75584 ?auto_75587 ) ( IN-CITY ?auto_75579 ?auto_75587 ) ( not ( = ?auto_75579 ?auto_75584 ) ) ( OBJ-AT ?auto_75583 ?auto_75579 ) ( not ( = ?auto_75583 ?auto_75581 ) ) ( OBJ-AT ?auto_75581 ?auto_75584 ) ( TRUCK-AT ?auto_75585 ?auto_75586 ) ( IN-CITY ?auto_75586 ?auto_75587 ) ( not ( = ?auto_75579 ?auto_75586 ) ) ( not ( = ?auto_75584 ?auto_75586 ) ) ( OBJ-AT ?auto_75580 ?auto_75579 ) ( OBJ-AT ?auto_75582 ?auto_75579 ) ( not ( = ?auto_75580 ?auto_75581 ) ) ( not ( = ?auto_75580 ?auto_75582 ) ) ( not ( = ?auto_75580 ?auto_75583 ) ) ( not ( = ?auto_75581 ?auto_75582 ) ) ( not ( = ?auto_75582 ?auto_75583 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75583 ?auto_75581 ?auto_75579 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75697 - OBJ
      ?auto_75698 - OBJ
      ?auto_75699 - OBJ
      ?auto_75700 - OBJ
      ?auto_75696 - LOCATION
    )
    :vars
    (
      ?auto_75701 - LOCATION
      ?auto_75704 - CITY
      ?auto_75702 - TRUCK
      ?auto_75703 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75701 ?auto_75704 ) ( IN-CITY ?auto_75696 ?auto_75704 ) ( not ( = ?auto_75696 ?auto_75701 ) ) ( OBJ-AT ?auto_75698 ?auto_75696 ) ( not ( = ?auto_75698 ?auto_75700 ) ) ( OBJ-AT ?auto_75700 ?auto_75701 ) ( TRUCK-AT ?auto_75702 ?auto_75703 ) ( IN-CITY ?auto_75703 ?auto_75704 ) ( not ( = ?auto_75696 ?auto_75703 ) ) ( not ( = ?auto_75701 ?auto_75703 ) ) ( OBJ-AT ?auto_75697 ?auto_75696 ) ( OBJ-AT ?auto_75699 ?auto_75696 ) ( not ( = ?auto_75697 ?auto_75698 ) ) ( not ( = ?auto_75697 ?auto_75699 ) ) ( not ( = ?auto_75697 ?auto_75700 ) ) ( not ( = ?auto_75698 ?auto_75699 ) ) ( not ( = ?auto_75699 ?auto_75700 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75698 ?auto_75700 ?auto_75696 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75760 - OBJ
      ?auto_75761 - OBJ
      ?auto_75762 - OBJ
      ?auto_75763 - OBJ
      ?auto_75759 - LOCATION
    )
    :vars
    (
      ?auto_75764 - LOCATION
      ?auto_75768 - CITY
      ?auto_75765 - OBJ
      ?auto_75766 - TRUCK
      ?auto_75767 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75764 ?auto_75768 ) ( IN-CITY ?auto_75759 ?auto_75768 ) ( not ( = ?auto_75759 ?auto_75764 ) ) ( OBJ-AT ?auto_75765 ?auto_75759 ) ( not ( = ?auto_75765 ?auto_75763 ) ) ( OBJ-AT ?auto_75763 ?auto_75764 ) ( TRUCK-AT ?auto_75766 ?auto_75767 ) ( IN-CITY ?auto_75767 ?auto_75768 ) ( not ( = ?auto_75759 ?auto_75767 ) ) ( not ( = ?auto_75764 ?auto_75767 ) ) ( OBJ-AT ?auto_75760 ?auto_75759 ) ( OBJ-AT ?auto_75761 ?auto_75759 ) ( OBJ-AT ?auto_75762 ?auto_75759 ) ( not ( = ?auto_75760 ?auto_75761 ) ) ( not ( = ?auto_75760 ?auto_75762 ) ) ( not ( = ?auto_75760 ?auto_75763 ) ) ( not ( = ?auto_75760 ?auto_75765 ) ) ( not ( = ?auto_75761 ?auto_75762 ) ) ( not ( = ?auto_75761 ?auto_75763 ) ) ( not ( = ?auto_75761 ?auto_75765 ) ) ( not ( = ?auto_75762 ?auto_75763 ) ) ( not ( = ?auto_75762 ?auto_75765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75765 ?auto_75763 ?auto_75759 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75789 - OBJ
      ?auto_75790 - OBJ
      ?auto_75791 - OBJ
      ?auto_75792 - OBJ
      ?auto_75788 - LOCATION
    )
    :vars
    (
      ?auto_75793 - LOCATION
      ?auto_75797 - CITY
      ?auto_75794 - OBJ
      ?auto_75795 - TRUCK
      ?auto_75796 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75793 ?auto_75797 ) ( IN-CITY ?auto_75788 ?auto_75797 ) ( not ( = ?auto_75788 ?auto_75793 ) ) ( OBJ-AT ?auto_75794 ?auto_75788 ) ( not ( = ?auto_75794 ?auto_75791 ) ) ( OBJ-AT ?auto_75791 ?auto_75793 ) ( TRUCK-AT ?auto_75795 ?auto_75796 ) ( IN-CITY ?auto_75796 ?auto_75797 ) ( not ( = ?auto_75788 ?auto_75796 ) ) ( not ( = ?auto_75793 ?auto_75796 ) ) ( OBJ-AT ?auto_75789 ?auto_75788 ) ( OBJ-AT ?auto_75790 ?auto_75788 ) ( OBJ-AT ?auto_75792 ?auto_75788 ) ( not ( = ?auto_75789 ?auto_75790 ) ) ( not ( = ?auto_75789 ?auto_75791 ) ) ( not ( = ?auto_75789 ?auto_75792 ) ) ( not ( = ?auto_75789 ?auto_75794 ) ) ( not ( = ?auto_75790 ?auto_75791 ) ) ( not ( = ?auto_75790 ?auto_75792 ) ) ( not ( = ?auto_75790 ?auto_75794 ) ) ( not ( = ?auto_75791 ?auto_75792 ) ) ( not ( = ?auto_75792 ?auto_75794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75794 ?auto_75791 ?auto_75788 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75932 - OBJ
      ?auto_75933 - OBJ
      ?auto_75934 - OBJ
      ?auto_75935 - OBJ
      ?auto_75931 - LOCATION
    )
    :vars
    (
      ?auto_75936 - LOCATION
      ?auto_75940 - CITY
      ?auto_75937 - OBJ
      ?auto_75938 - TRUCK
      ?auto_75939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75936 ?auto_75940 ) ( IN-CITY ?auto_75931 ?auto_75940 ) ( not ( = ?auto_75931 ?auto_75936 ) ) ( OBJ-AT ?auto_75937 ?auto_75931 ) ( not ( = ?auto_75937 ?auto_75933 ) ) ( OBJ-AT ?auto_75933 ?auto_75936 ) ( TRUCK-AT ?auto_75938 ?auto_75939 ) ( IN-CITY ?auto_75939 ?auto_75940 ) ( not ( = ?auto_75931 ?auto_75939 ) ) ( not ( = ?auto_75936 ?auto_75939 ) ) ( OBJ-AT ?auto_75932 ?auto_75931 ) ( OBJ-AT ?auto_75934 ?auto_75931 ) ( OBJ-AT ?auto_75935 ?auto_75931 ) ( not ( = ?auto_75932 ?auto_75933 ) ) ( not ( = ?auto_75932 ?auto_75934 ) ) ( not ( = ?auto_75932 ?auto_75935 ) ) ( not ( = ?auto_75932 ?auto_75937 ) ) ( not ( = ?auto_75933 ?auto_75934 ) ) ( not ( = ?auto_75933 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75937 ) ) ( not ( = ?auto_75935 ?auto_75937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75937 ?auto_75933 ?auto_75931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76536 - OBJ
      ?auto_76537 - OBJ
      ?auto_76538 - OBJ
      ?auto_76539 - OBJ
      ?auto_76535 - LOCATION
    )
    :vars
    (
      ?auto_76540 - LOCATION
      ?auto_76543 - CITY
      ?auto_76541 - TRUCK
      ?auto_76542 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76540 ?auto_76543 ) ( IN-CITY ?auto_76535 ?auto_76543 ) ( not ( = ?auto_76535 ?auto_76540 ) ) ( OBJ-AT ?auto_76539 ?auto_76535 ) ( not ( = ?auto_76539 ?auto_76536 ) ) ( OBJ-AT ?auto_76536 ?auto_76540 ) ( TRUCK-AT ?auto_76541 ?auto_76542 ) ( IN-CITY ?auto_76542 ?auto_76543 ) ( not ( = ?auto_76535 ?auto_76542 ) ) ( not ( = ?auto_76540 ?auto_76542 ) ) ( OBJ-AT ?auto_76537 ?auto_76535 ) ( OBJ-AT ?auto_76538 ?auto_76535 ) ( not ( = ?auto_76536 ?auto_76537 ) ) ( not ( = ?auto_76536 ?auto_76538 ) ) ( not ( = ?auto_76537 ?auto_76538 ) ) ( not ( = ?auto_76537 ?auto_76539 ) ) ( not ( = ?auto_76538 ?auto_76539 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76539 ?auto_76536 ?auto_76535 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76581 - OBJ
      ?auto_76582 - OBJ
      ?auto_76583 - OBJ
      ?auto_76584 - OBJ
      ?auto_76580 - LOCATION
    )
    :vars
    (
      ?auto_76585 - LOCATION
      ?auto_76589 - CITY
      ?auto_76586 - OBJ
      ?auto_76587 - TRUCK
      ?auto_76588 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76585 ?auto_76589 ) ( IN-CITY ?auto_76580 ?auto_76589 ) ( not ( = ?auto_76580 ?auto_76585 ) ) ( OBJ-AT ?auto_76586 ?auto_76580 ) ( not ( = ?auto_76586 ?auto_76581 ) ) ( OBJ-AT ?auto_76581 ?auto_76585 ) ( TRUCK-AT ?auto_76587 ?auto_76588 ) ( IN-CITY ?auto_76588 ?auto_76589 ) ( not ( = ?auto_76580 ?auto_76588 ) ) ( not ( = ?auto_76585 ?auto_76588 ) ) ( OBJ-AT ?auto_76582 ?auto_76580 ) ( OBJ-AT ?auto_76583 ?auto_76580 ) ( OBJ-AT ?auto_76584 ?auto_76580 ) ( not ( = ?auto_76581 ?auto_76582 ) ) ( not ( = ?auto_76581 ?auto_76583 ) ) ( not ( = ?auto_76581 ?auto_76584 ) ) ( not ( = ?auto_76582 ?auto_76583 ) ) ( not ( = ?auto_76582 ?auto_76584 ) ) ( not ( = ?auto_76582 ?auto_76586 ) ) ( not ( = ?auto_76583 ?auto_76584 ) ) ( not ( = ?auto_76583 ?auto_76586 ) ) ( not ( = ?auto_76584 ?auto_76586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76586 ?auto_76581 ?auto_76580 ) )
  )

)

