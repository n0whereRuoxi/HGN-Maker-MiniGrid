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
      ?auto_55413 - TRUCK
      ?auto_55412 - LOCATION
      ?auto_55411 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55413 ?auto_55412 ) ( IN-CITY ?auto_55412 ?auto_55411 ) ( IN-CITY ?auto_55409 ?auto_55411 ) ( not ( = ?auto_55409 ?auto_55412 ) ) ( OBJ-AT ?auto_55410 ?auto_55412 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55410 ?auto_55413 ?auto_55412 )
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
      ?auto_55438 - LOCATION
      ?auto_55437 - CITY
      ?auto_55439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55438 ?auto_55437 ) ( IN-CITY ?auto_55435 ?auto_55437 ) ( not ( = ?auto_55435 ?auto_55438 ) ) ( OBJ-AT ?auto_55436 ?auto_55438 ) ( TRUCK-AT ?auto_55439 ?auto_55435 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55439 ?auto_55435 ?auto_55438 ?auto_55437 )
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
      ?auto_55723 - TRUCK
      ?auto_55724 - LOCATION
      ?auto_55725 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55722 ?auto_55723 ) ( TRUCK-AT ?auto_55723 ?auto_55724 ) ( IN-CITY ?auto_55724 ?auto_55725 ) ( IN-CITY ?auto_55720 ?auto_55725 ) ( not ( = ?auto_55720 ?auto_55724 ) ) ( OBJ-AT ?auto_55721 ?auto_55720 ) ( not ( = ?auto_55721 ?auto_55722 ) ) )
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
    ( and ( IN-TRUCK ?auto_55800 ?auto_55803 ) ( TRUCK-AT ?auto_55803 ?auto_55802 ) ( IN-CITY ?auto_55802 ?auto_55804 ) ( IN-CITY ?auto_55797 ?auto_55804 ) ( not ( = ?auto_55797 ?auto_55802 ) ) ( OBJ-AT ?auto_55799 ?auto_55797 ) ( not ( = ?auto_55799 ?auto_55800 ) ) ( OBJ-AT ?auto_55798 ?auto_55797 ) ( OBJ-AT ?auto_55801 ?auto_55797 ) ( not ( = ?auto_55798 ?auto_55799 ) ) ( not ( = ?auto_55798 ?auto_55800 ) ) ( not ( = ?auto_55798 ?auto_55801 ) ) ( not ( = ?auto_55799 ?auto_55801 ) ) ( not ( = ?auto_55800 ?auto_55801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55799 ?auto_55800 ?auto_55797 ) )
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
    ( and ( IN-TRUCK ?auto_55815 ?auto_55819 ) ( TRUCK-AT ?auto_55819 ?auto_55818 ) ( IN-CITY ?auto_55818 ?auto_55820 ) ( IN-CITY ?auto_55813 ?auto_55820 ) ( not ( = ?auto_55813 ?auto_55818 ) ) ( OBJ-AT ?auto_55817 ?auto_55813 ) ( not ( = ?auto_55817 ?auto_55815 ) ) ( OBJ-AT ?auto_55814 ?auto_55813 ) ( OBJ-AT ?auto_55816 ?auto_55813 ) ( not ( = ?auto_55814 ?auto_55815 ) ) ( not ( = ?auto_55814 ?auto_55816 ) ) ( not ( = ?auto_55814 ?auto_55817 ) ) ( not ( = ?auto_55815 ?auto_55816 ) ) ( not ( = ?auto_55816 ?auto_55817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55817 ?auto_55815 ?auto_55813 ) )
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
    ( and ( IN-TRUCK ?auto_55846 ?auto_55851 ) ( TRUCK-AT ?auto_55851 ?auto_55850 ) ( IN-CITY ?auto_55850 ?auto_55852 ) ( IN-CITY ?auto_55845 ?auto_55852 ) ( not ( = ?auto_55845 ?auto_55850 ) ) ( OBJ-AT ?auto_55849 ?auto_55845 ) ( not ( = ?auto_55849 ?auto_55846 ) ) ( OBJ-AT ?auto_55847 ?auto_55845 ) ( OBJ-AT ?auto_55848 ?auto_55845 ) ( not ( = ?auto_55846 ?auto_55847 ) ) ( not ( = ?auto_55846 ?auto_55848 ) ) ( not ( = ?auto_55847 ?auto_55848 ) ) ( not ( = ?auto_55847 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55849 ?auto_55846 ?auto_55845 ) )
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
      ?auto_55920 - TRUCK
      ?auto_55921 - LOCATION
      ?auto_55919 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55920 ?auto_55921 ) ( IN-CITY ?auto_55921 ?auto_55919 ) ( IN-CITY ?auto_55916 ?auto_55919 ) ( not ( = ?auto_55916 ?auto_55921 ) ) ( OBJ-AT ?auto_55917 ?auto_55916 ) ( not ( = ?auto_55917 ?auto_55918 ) ) ( OBJ-AT ?auto_55918 ?auto_55921 ) )
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
      ?auto_55925 - LOCATION
      ?auto_55927 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55926 ?auto_55925 ) ( IN-CITY ?auto_55925 ?auto_55927 ) ( IN-CITY ?auto_55922 ?auto_55927 ) ( not ( = ?auto_55922 ?auto_55925 ) ) ( OBJ-AT ?auto_55924 ?auto_55922 ) ( not ( = ?auto_55924 ?auto_55923 ) ) ( OBJ-AT ?auto_55923 ?auto_55925 ) )
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
      ?auto_55939 - LOCATION
      ?auto_55941 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55940 ?auto_55939 ) ( IN-CITY ?auto_55939 ?auto_55941 ) ( IN-CITY ?auto_55935 ?auto_55941 ) ( not ( = ?auto_55935 ?auto_55939 ) ) ( OBJ-AT ?auto_55937 ?auto_55935 ) ( not ( = ?auto_55937 ?auto_55938 ) ) ( OBJ-AT ?auto_55938 ?auto_55939 ) ( OBJ-AT ?auto_55936 ?auto_55935 ) ( not ( = ?auto_55936 ?auto_55937 ) ) ( not ( = ?auto_55936 ?auto_55938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55937 ?auto_55938 ?auto_55935 ) )
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
      ?auto_55946 - LOCATION
      ?auto_55948 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55947 ?auto_55946 ) ( IN-CITY ?auto_55946 ?auto_55948 ) ( IN-CITY ?auto_55942 ?auto_55948 ) ( not ( = ?auto_55942 ?auto_55946 ) ) ( OBJ-AT ?auto_55945 ?auto_55942 ) ( not ( = ?auto_55945 ?auto_55944 ) ) ( OBJ-AT ?auto_55944 ?auto_55946 ) ( OBJ-AT ?auto_55943 ?auto_55942 ) ( not ( = ?auto_55943 ?auto_55944 ) ) ( not ( = ?auto_55943 ?auto_55945 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55945 ?auto_55944 ?auto_55942 ) )
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
      ?auto_55960 - LOCATION
      ?auto_55962 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55961 ?auto_55960 ) ( IN-CITY ?auto_55960 ?auto_55962 ) ( IN-CITY ?auto_55956 ?auto_55962 ) ( not ( = ?auto_55956 ?auto_55960 ) ) ( OBJ-AT ?auto_55958 ?auto_55956 ) ( not ( = ?auto_55958 ?auto_55957 ) ) ( OBJ-AT ?auto_55957 ?auto_55960 ) ( OBJ-AT ?auto_55959 ?auto_55956 ) ( not ( = ?auto_55957 ?auto_55959 ) ) ( not ( = ?auto_55958 ?auto_55959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55958 ?auto_55957 ?auto_55956 ) )
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
      ?auto_55990 - LOCATION
      ?auto_55992 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55991 ?auto_55990 ) ( IN-CITY ?auto_55990 ?auto_55992 ) ( IN-CITY ?auto_55985 ?auto_55992 ) ( not ( = ?auto_55985 ?auto_55990 ) ) ( OBJ-AT ?auto_55988 ?auto_55985 ) ( not ( = ?auto_55988 ?auto_55989 ) ) ( OBJ-AT ?auto_55989 ?auto_55990 ) ( OBJ-AT ?auto_55986 ?auto_55985 ) ( OBJ-AT ?auto_55987 ?auto_55985 ) ( not ( = ?auto_55986 ?auto_55987 ) ) ( not ( = ?auto_55986 ?auto_55988 ) ) ( not ( = ?auto_55986 ?auto_55989 ) ) ( not ( = ?auto_55987 ?auto_55988 ) ) ( not ( = ?auto_55987 ?auto_55989 ) ) )
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
      ?auto_55998 - LOCATION
      ?auto_56000 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55999 ?auto_55998 ) ( IN-CITY ?auto_55998 ?auto_56000 ) ( IN-CITY ?auto_55993 ?auto_56000 ) ( not ( = ?auto_55993 ?auto_55998 ) ) ( OBJ-AT ?auto_55994 ?auto_55993 ) ( not ( = ?auto_55994 ?auto_55996 ) ) ( OBJ-AT ?auto_55996 ?auto_55998 ) ( OBJ-AT ?auto_55995 ?auto_55993 ) ( OBJ-AT ?auto_55997 ?auto_55993 ) ( not ( = ?auto_55994 ?auto_55995 ) ) ( not ( = ?auto_55994 ?auto_55997 ) ) ( not ( = ?auto_55995 ?auto_55996 ) ) ( not ( = ?auto_55995 ?auto_55997 ) ) ( not ( = ?auto_55996 ?auto_55997 ) ) )
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
      ?auto_56014 - LOCATION
      ?auto_56016 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_56015 ?auto_56014 ) ( IN-CITY ?auto_56014 ?auto_56016 ) ( IN-CITY ?auto_56009 ?auto_56016 ) ( not ( = ?auto_56009 ?auto_56014 ) ) ( OBJ-AT ?auto_56010 ?auto_56009 ) ( not ( = ?auto_56010 ?auto_56011 ) ) ( OBJ-AT ?auto_56011 ?auto_56014 ) ( OBJ-AT ?auto_56012 ?auto_56009 ) ( OBJ-AT ?auto_56013 ?auto_56009 ) ( not ( = ?auto_56010 ?auto_56012 ) ) ( not ( = ?auto_56010 ?auto_56013 ) ) ( not ( = ?auto_56011 ?auto_56012 ) ) ( not ( = ?auto_56011 ?auto_56013 ) ) ( not ( = ?auto_56012 ?auto_56013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56010 ?auto_56011 ?auto_56009 ) )
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
      ?auto_56046 - LOCATION
      ?auto_56048 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_56047 ?auto_56046 ) ( IN-CITY ?auto_56046 ?auto_56048 ) ( IN-CITY ?auto_56041 ?auto_56048 ) ( not ( = ?auto_56041 ?auto_56046 ) ) ( OBJ-AT ?auto_56044 ?auto_56041 ) ( not ( = ?auto_56044 ?auto_56042 ) ) ( OBJ-AT ?auto_56042 ?auto_56046 ) ( OBJ-AT ?auto_56043 ?auto_56041 ) ( OBJ-AT ?auto_56045 ?auto_56041 ) ( not ( = ?auto_56042 ?auto_56043 ) ) ( not ( = ?auto_56042 ?auto_56045 ) ) ( not ( = ?auto_56043 ?auto_56044 ) ) ( not ( = ?auto_56043 ?auto_56045 ) ) ( not ( = ?auto_56044 ?auto_56045 ) ) )
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
      ?auto_56108 - LOCATION
      ?auto_56110 - CITY
      ?auto_56111 - OBJ
      ?auto_56109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56108 ?auto_56110 ) ( IN-CITY ?auto_56106 ?auto_56110 ) ( not ( = ?auto_56106 ?auto_56108 ) ) ( OBJ-AT ?auto_56111 ?auto_56106 ) ( not ( = ?auto_56111 ?auto_56107 ) ) ( OBJ-AT ?auto_56107 ?auto_56108 ) ( TRUCK-AT ?auto_56109 ?auto_56106 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56109 ?auto_56106 ?auto_56108 ?auto_56110 )
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
      ?auto_56115 - LOCATION
      ?auto_56116 - CITY
      ?auto_56117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56115 ?auto_56116 ) ( IN-CITY ?auto_56112 ?auto_56116 ) ( not ( = ?auto_56112 ?auto_56115 ) ) ( OBJ-AT ?auto_56113 ?auto_56112 ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( OBJ-AT ?auto_56114 ?auto_56115 ) ( TRUCK-AT ?auto_56117 ?auto_56112 ) )
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
      ?auto_56122 - LOCATION
      ?auto_56121 - CITY
      ?auto_56123 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56122 ?auto_56121 ) ( IN-CITY ?auto_56118 ?auto_56121 ) ( not ( = ?auto_56118 ?auto_56122 ) ) ( OBJ-AT ?auto_56120 ?auto_56118 ) ( not ( = ?auto_56120 ?auto_56119 ) ) ( OBJ-AT ?auto_56119 ?auto_56122 ) ( TRUCK-AT ?auto_56123 ?auto_56118 ) )
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
      ?auto_56136 - LOCATION
      ?auto_56135 - CITY
      ?auto_56137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56136 ?auto_56135 ) ( IN-CITY ?auto_56131 ?auto_56135 ) ( not ( = ?auto_56131 ?auto_56136 ) ) ( OBJ-AT ?auto_56133 ?auto_56131 ) ( not ( = ?auto_56133 ?auto_56134 ) ) ( OBJ-AT ?auto_56134 ?auto_56136 ) ( TRUCK-AT ?auto_56137 ?auto_56131 ) ( OBJ-AT ?auto_56132 ?auto_56131 ) ( not ( = ?auto_56132 ?auto_56133 ) ) ( not ( = ?auto_56132 ?auto_56134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56133 ?auto_56134 ?auto_56131 ) )
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
      ?auto_56143 - LOCATION
      ?auto_56142 - CITY
      ?auto_56144 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56143 ?auto_56142 ) ( IN-CITY ?auto_56138 ?auto_56142 ) ( not ( = ?auto_56138 ?auto_56143 ) ) ( OBJ-AT ?auto_56139 ?auto_56138 ) ( not ( = ?auto_56139 ?auto_56140 ) ) ( OBJ-AT ?auto_56140 ?auto_56143 ) ( TRUCK-AT ?auto_56144 ?auto_56138 ) ( OBJ-AT ?auto_56141 ?auto_56138 ) ( not ( = ?auto_56139 ?auto_56141 ) ) ( not ( = ?auto_56140 ?auto_56141 ) ) )
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
      ?auto_56157 - LOCATION
      ?auto_56156 - CITY
      ?auto_56158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56157 ?auto_56156 ) ( IN-CITY ?auto_56152 ?auto_56156 ) ( not ( = ?auto_56152 ?auto_56157 ) ) ( OBJ-AT ?auto_56155 ?auto_56152 ) ( not ( = ?auto_56155 ?auto_56153 ) ) ( OBJ-AT ?auto_56153 ?auto_56157 ) ( TRUCK-AT ?auto_56158 ?auto_56152 ) ( OBJ-AT ?auto_56154 ?auto_56152 ) ( not ( = ?auto_56153 ?auto_56154 ) ) ( not ( = ?auto_56154 ?auto_56155 ) ) )
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
      ?auto_56187 - LOCATION
      ?auto_56186 - CITY
      ?auto_56188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56187 ?auto_56186 ) ( IN-CITY ?auto_56181 ?auto_56186 ) ( not ( = ?auto_56181 ?auto_56187 ) ) ( OBJ-AT ?auto_56183 ?auto_56181 ) ( not ( = ?auto_56183 ?auto_56185 ) ) ( OBJ-AT ?auto_56185 ?auto_56187 ) ( TRUCK-AT ?auto_56188 ?auto_56181 ) ( OBJ-AT ?auto_56182 ?auto_56181 ) ( OBJ-AT ?auto_56184 ?auto_56181 ) ( not ( = ?auto_56182 ?auto_56183 ) ) ( not ( = ?auto_56182 ?auto_56184 ) ) ( not ( = ?auto_56182 ?auto_56185 ) ) ( not ( = ?auto_56183 ?auto_56184 ) ) ( not ( = ?auto_56184 ?auto_56185 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56183 ?auto_56185 ?auto_56181 ) )
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
      ?auto_56195 - LOCATION
      ?auto_56194 - CITY
      ?auto_56196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56195 ?auto_56194 ) ( IN-CITY ?auto_56189 ?auto_56194 ) ( not ( = ?auto_56189 ?auto_56195 ) ) ( OBJ-AT ?auto_56190 ?auto_56189 ) ( not ( = ?auto_56190 ?auto_56192 ) ) ( OBJ-AT ?auto_56192 ?auto_56195 ) ( TRUCK-AT ?auto_56196 ?auto_56189 ) ( OBJ-AT ?auto_56191 ?auto_56189 ) ( OBJ-AT ?auto_56193 ?auto_56189 ) ( not ( = ?auto_56190 ?auto_56191 ) ) ( not ( = ?auto_56190 ?auto_56193 ) ) ( not ( = ?auto_56191 ?auto_56192 ) ) ( not ( = ?auto_56191 ?auto_56193 ) ) ( not ( = ?auto_56192 ?auto_56193 ) ) )
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
      ?auto_56211 - LOCATION
      ?auto_56210 - CITY
      ?auto_56212 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56211 ?auto_56210 ) ( IN-CITY ?auto_56205 ?auto_56210 ) ( not ( = ?auto_56205 ?auto_56211 ) ) ( OBJ-AT ?auto_56208 ?auto_56205 ) ( not ( = ?auto_56208 ?auto_56207 ) ) ( OBJ-AT ?auto_56207 ?auto_56211 ) ( TRUCK-AT ?auto_56212 ?auto_56205 ) ( OBJ-AT ?auto_56206 ?auto_56205 ) ( OBJ-AT ?auto_56209 ?auto_56205 ) ( not ( = ?auto_56206 ?auto_56207 ) ) ( not ( = ?auto_56206 ?auto_56208 ) ) ( not ( = ?auto_56206 ?auto_56209 ) ) ( not ( = ?auto_56207 ?auto_56209 ) ) ( not ( = ?auto_56208 ?auto_56209 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56208 ?auto_56207 ?auto_56205 ) )
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
      ?auto_56243 - LOCATION
      ?auto_56242 - CITY
      ?auto_56244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56243 ?auto_56242 ) ( IN-CITY ?auto_56237 ?auto_56242 ) ( not ( = ?auto_56237 ?auto_56243 ) ) ( OBJ-AT ?auto_56239 ?auto_56237 ) ( not ( = ?auto_56239 ?auto_56238 ) ) ( OBJ-AT ?auto_56238 ?auto_56243 ) ( TRUCK-AT ?auto_56244 ?auto_56237 ) ( OBJ-AT ?auto_56240 ?auto_56237 ) ( OBJ-AT ?auto_56241 ?auto_56237 ) ( not ( = ?auto_56238 ?auto_56240 ) ) ( not ( = ?auto_56238 ?auto_56241 ) ) ( not ( = ?auto_56239 ?auto_56240 ) ) ( not ( = ?auto_56239 ?auto_56241 ) ) ( not ( = ?auto_56240 ?auto_56241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56239 ?auto_56238 ?auto_56237 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56303 - OBJ
      ?auto_56302 - LOCATION
    )
    :vars
    (
      ?auto_56306 - LOCATION
      ?auto_56304 - CITY
      ?auto_56305 - OBJ
      ?auto_56307 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56306 ?auto_56304 ) ( IN-CITY ?auto_56302 ?auto_56304 ) ( not ( = ?auto_56302 ?auto_56306 ) ) ( not ( = ?auto_56305 ?auto_56303 ) ) ( OBJ-AT ?auto_56303 ?auto_56306 ) ( TRUCK-AT ?auto_56307 ?auto_56302 ) ( IN-TRUCK ?auto_56305 ?auto_56307 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56305 ?auto_56302 )
      ( DELIVER-2PKG ?auto_56305 ?auto_56303 ?auto_56302 ) )
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
      ?auto_56514 - LOCATION
      ?auto_56515 - CITY
      ?auto_56513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56514 ?auto_56515 ) ( IN-CITY ?auto_56510 ?auto_56515 ) ( not ( = ?auto_56510 ?auto_56514 ) ) ( not ( = ?auto_56512 ?auto_56511 ) ) ( OBJ-AT ?auto_56511 ?auto_56514 ) ( IN-TRUCK ?auto_56512 ?auto_56513 ) ( TRUCK-AT ?auto_56513 ?auto_56514 ) )
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
      ?auto_58025 - TRUCK
      ?auto_58024 - LOCATION
      ?auto_58026 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58023 ?auto_58025 ) ( TRUCK-AT ?auto_58025 ?auto_58024 ) ( IN-CITY ?auto_58024 ?auto_58026 ) ( IN-CITY ?auto_58020 ?auto_58026 ) ( not ( = ?auto_58020 ?auto_58024 ) ) ( OBJ-AT ?auto_58021 ?auto_58020 ) ( not ( = ?auto_58021 ?auto_58023 ) ) ( OBJ-AT ?auto_58022 ?auto_58020 ) ( not ( = ?auto_58021 ?auto_58022 ) ) ( not ( = ?auto_58022 ?auto_58023 ) ) )
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
      ?auto_58036 - TRUCK
      ?auto_58035 - LOCATION
      ?auto_58037 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58033 ?auto_58036 ) ( TRUCK-AT ?auto_58036 ?auto_58035 ) ( IN-CITY ?auto_58035 ?auto_58037 ) ( IN-CITY ?auto_58031 ?auto_58037 ) ( not ( = ?auto_58031 ?auto_58035 ) ) ( OBJ-AT ?auto_58032 ?auto_58031 ) ( not ( = ?auto_58032 ?auto_58033 ) ) ( OBJ-AT ?auto_58034 ?auto_58031 ) ( not ( = ?auto_58032 ?auto_58034 ) ) ( not ( = ?auto_58033 ?auto_58034 ) ) )
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
      ?auto_58059 - TRUCK
      ?auto_58057 - LOCATION
      ?auto_58060 - CITY
      ?auto_58058 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58056 ?auto_58059 ) ( TRUCK-AT ?auto_58059 ?auto_58057 ) ( IN-CITY ?auto_58057 ?auto_58060 ) ( IN-CITY ?auto_58053 ?auto_58060 ) ( not ( = ?auto_58053 ?auto_58057 ) ) ( OBJ-AT ?auto_58058 ?auto_58053 ) ( not ( = ?auto_58058 ?auto_58056 ) ) ( OBJ-AT ?auto_58054 ?auto_58053 ) ( OBJ-AT ?auto_58055 ?auto_58053 ) ( not ( = ?auto_58054 ?auto_58055 ) ) ( not ( = ?auto_58054 ?auto_58056 ) ) ( not ( = ?auto_58054 ?auto_58058 ) ) ( not ( = ?auto_58055 ?auto_58056 ) ) ( not ( = ?auto_58055 ?auto_58058 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58058 ?auto_58056 ?auto_58053 ) )
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
      ?auto_58071 - TRUCK
      ?auto_58069 - LOCATION
      ?auto_58072 - CITY
      ?auto_58070 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58067 ?auto_58071 ) ( TRUCK-AT ?auto_58071 ?auto_58069 ) ( IN-CITY ?auto_58069 ?auto_58072 ) ( IN-CITY ?auto_58065 ?auto_58072 ) ( not ( = ?auto_58065 ?auto_58069 ) ) ( OBJ-AT ?auto_58070 ?auto_58065 ) ( not ( = ?auto_58070 ?auto_58067 ) ) ( OBJ-AT ?auto_58066 ?auto_58065 ) ( OBJ-AT ?auto_58068 ?auto_58065 ) ( not ( = ?auto_58066 ?auto_58067 ) ) ( not ( = ?auto_58066 ?auto_58068 ) ) ( not ( = ?auto_58066 ?auto_58070 ) ) ( not ( = ?auto_58067 ?auto_58068 ) ) ( not ( = ?auto_58068 ?auto_58070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58070 ?auto_58067 ?auto_58065 ) )
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
      ?auto_58086 - TRUCK
      ?auto_58085 - LOCATION
      ?auto_58087 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58082 ?auto_58086 ) ( TRUCK-AT ?auto_58086 ?auto_58085 ) ( IN-CITY ?auto_58085 ?auto_58087 ) ( IN-CITY ?auto_58081 ?auto_58087 ) ( not ( = ?auto_58081 ?auto_58085 ) ) ( OBJ-AT ?auto_58084 ?auto_58081 ) ( not ( = ?auto_58084 ?auto_58082 ) ) ( OBJ-AT ?auto_58083 ?auto_58081 ) ( not ( = ?auto_58082 ?auto_58083 ) ) ( not ( = ?auto_58083 ?auto_58084 ) ) )
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
      ?auto_58109 - TRUCK
      ?auto_58107 - LOCATION
      ?auto_58110 - CITY
      ?auto_58108 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58104 ?auto_58109 ) ( TRUCK-AT ?auto_58109 ?auto_58107 ) ( IN-CITY ?auto_58107 ?auto_58110 ) ( IN-CITY ?auto_58103 ?auto_58110 ) ( not ( = ?auto_58103 ?auto_58107 ) ) ( OBJ-AT ?auto_58108 ?auto_58103 ) ( not ( = ?auto_58108 ?auto_58104 ) ) ( OBJ-AT ?auto_58105 ?auto_58103 ) ( OBJ-AT ?auto_58106 ?auto_58103 ) ( not ( = ?auto_58104 ?auto_58105 ) ) ( not ( = ?auto_58104 ?auto_58106 ) ) ( not ( = ?auto_58105 ?auto_58106 ) ) ( not ( = ?auto_58105 ?auto_58108 ) ) ( not ( = ?auto_58106 ?auto_58108 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58108 ?auto_58104 ?auto_58103 ) )
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
      ?auto_58148 - TRUCK
      ?auto_58147 - LOCATION
      ?auto_58149 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58146 ?auto_58148 ) ( TRUCK-AT ?auto_58148 ?auto_58147 ) ( IN-CITY ?auto_58147 ?auto_58149 ) ( IN-CITY ?auto_58142 ?auto_58149 ) ( not ( = ?auto_58142 ?auto_58147 ) ) ( OBJ-AT ?auto_58145 ?auto_58142 ) ( not ( = ?auto_58145 ?auto_58146 ) ) ( OBJ-AT ?auto_58143 ?auto_58142 ) ( OBJ-AT ?auto_58144 ?auto_58142 ) ( not ( = ?auto_58143 ?auto_58144 ) ) ( not ( = ?auto_58143 ?auto_58145 ) ) ( not ( = ?auto_58143 ?auto_58146 ) ) ( not ( = ?auto_58144 ?auto_58145 ) ) ( not ( = ?auto_58144 ?auto_58146 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58145 ?auto_58146 ?auto_58142 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58151 - OBJ
      ?auto_58152 - OBJ
      ?auto_58153 - OBJ
      ?auto_58154 - OBJ
      ?auto_58150 - LOCATION
    )
    :vars
    (
      ?auto_58156 - TRUCK
      ?auto_58155 - LOCATION
      ?auto_58157 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58154 ?auto_58156 ) ( TRUCK-AT ?auto_58156 ?auto_58155 ) ( IN-CITY ?auto_58155 ?auto_58157 ) ( IN-CITY ?auto_58150 ?auto_58157 ) ( not ( = ?auto_58150 ?auto_58155 ) ) ( OBJ-AT ?auto_58151 ?auto_58150 ) ( not ( = ?auto_58151 ?auto_58154 ) ) ( OBJ-AT ?auto_58152 ?auto_58150 ) ( OBJ-AT ?auto_58153 ?auto_58150 ) ( not ( = ?auto_58151 ?auto_58152 ) ) ( not ( = ?auto_58151 ?auto_58153 ) ) ( not ( = ?auto_58152 ?auto_58153 ) ) ( not ( = ?auto_58152 ?auto_58154 ) ) ( not ( = ?auto_58153 ?auto_58154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58151 ?auto_58154 ?auto_58150 ) )
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
      ?auto_58164 - TRUCK
      ?auto_58163 - LOCATION
      ?auto_58165 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58161 ?auto_58164 ) ( TRUCK-AT ?auto_58164 ?auto_58163 ) ( IN-CITY ?auto_58163 ?auto_58165 ) ( IN-CITY ?auto_58158 ?auto_58165 ) ( not ( = ?auto_58158 ?auto_58163 ) ) ( OBJ-AT ?auto_58162 ?auto_58158 ) ( not ( = ?auto_58162 ?auto_58161 ) ) ( OBJ-AT ?auto_58159 ?auto_58158 ) ( OBJ-AT ?auto_58160 ?auto_58158 ) ( not ( = ?auto_58159 ?auto_58160 ) ) ( not ( = ?auto_58159 ?auto_58161 ) ) ( not ( = ?auto_58159 ?auto_58162 ) ) ( not ( = ?auto_58160 ?auto_58161 ) ) ( not ( = ?auto_58160 ?auto_58162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58162 ?auto_58161 ?auto_58158 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58167 - OBJ
      ?auto_58168 - OBJ
      ?auto_58169 - OBJ
      ?auto_58170 - OBJ
      ?auto_58166 - LOCATION
    )
    :vars
    (
      ?auto_58172 - TRUCK
      ?auto_58171 - LOCATION
      ?auto_58173 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58169 ?auto_58172 ) ( TRUCK-AT ?auto_58172 ?auto_58171 ) ( IN-CITY ?auto_58171 ?auto_58173 ) ( IN-CITY ?auto_58166 ?auto_58173 ) ( not ( = ?auto_58166 ?auto_58171 ) ) ( OBJ-AT ?auto_58167 ?auto_58166 ) ( not ( = ?auto_58167 ?auto_58169 ) ) ( OBJ-AT ?auto_58168 ?auto_58166 ) ( OBJ-AT ?auto_58170 ?auto_58166 ) ( not ( = ?auto_58167 ?auto_58168 ) ) ( not ( = ?auto_58167 ?auto_58170 ) ) ( not ( = ?auto_58168 ?auto_58169 ) ) ( not ( = ?auto_58168 ?auto_58170 ) ) ( not ( = ?auto_58169 ?auto_58170 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58167 ?auto_58169 ?auto_58166 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58231 - OBJ
      ?auto_58232 - OBJ
      ?auto_58233 - OBJ
      ?auto_58234 - OBJ
      ?auto_58230 - LOCATION
    )
    :vars
    (
      ?auto_58236 - TRUCK
      ?auto_58235 - LOCATION
      ?auto_58237 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58232 ?auto_58236 ) ( TRUCK-AT ?auto_58236 ?auto_58235 ) ( IN-CITY ?auto_58235 ?auto_58237 ) ( IN-CITY ?auto_58230 ?auto_58237 ) ( not ( = ?auto_58230 ?auto_58235 ) ) ( OBJ-AT ?auto_58231 ?auto_58230 ) ( not ( = ?auto_58231 ?auto_58232 ) ) ( OBJ-AT ?auto_58233 ?auto_58230 ) ( OBJ-AT ?auto_58234 ?auto_58230 ) ( not ( = ?auto_58231 ?auto_58233 ) ) ( not ( = ?auto_58231 ?auto_58234 ) ) ( not ( = ?auto_58232 ?auto_58233 ) ) ( not ( = ?auto_58232 ?auto_58234 ) ) ( not ( = ?auto_58233 ?auto_58234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58231 ?auto_58232 ?auto_58230 ) )
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
      ?auto_58349 - TRUCK
      ?auto_58347 - LOCATION
      ?auto_58350 - CITY
      ?auto_58348 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58346 ?auto_58349 ) ( TRUCK-AT ?auto_58349 ?auto_58347 ) ( IN-CITY ?auto_58347 ?auto_58350 ) ( IN-CITY ?auto_58342 ?auto_58350 ) ( not ( = ?auto_58342 ?auto_58347 ) ) ( OBJ-AT ?auto_58348 ?auto_58342 ) ( not ( = ?auto_58348 ?auto_58346 ) ) ( OBJ-AT ?auto_58343 ?auto_58342 ) ( OBJ-AT ?auto_58344 ?auto_58342 ) ( OBJ-AT ?auto_58345 ?auto_58342 ) ( not ( = ?auto_58343 ?auto_58344 ) ) ( not ( = ?auto_58343 ?auto_58345 ) ) ( not ( = ?auto_58343 ?auto_58346 ) ) ( not ( = ?auto_58343 ?auto_58348 ) ) ( not ( = ?auto_58344 ?auto_58345 ) ) ( not ( = ?auto_58344 ?auto_58346 ) ) ( not ( = ?auto_58344 ?auto_58348 ) ) ( not ( = ?auto_58345 ?auto_58346 ) ) ( not ( = ?auto_58345 ?auto_58348 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58348 ?auto_58346 ?auto_58342 ) )
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
      ?auto_58366 - TRUCK
      ?auto_58364 - LOCATION
      ?auto_58367 - CITY
      ?auto_58365 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58362 ?auto_58366 ) ( TRUCK-AT ?auto_58366 ?auto_58364 ) ( IN-CITY ?auto_58364 ?auto_58367 ) ( IN-CITY ?auto_58359 ?auto_58367 ) ( not ( = ?auto_58359 ?auto_58364 ) ) ( OBJ-AT ?auto_58365 ?auto_58359 ) ( not ( = ?auto_58365 ?auto_58362 ) ) ( OBJ-AT ?auto_58360 ?auto_58359 ) ( OBJ-AT ?auto_58361 ?auto_58359 ) ( OBJ-AT ?auto_58363 ?auto_58359 ) ( not ( = ?auto_58360 ?auto_58361 ) ) ( not ( = ?auto_58360 ?auto_58362 ) ) ( not ( = ?auto_58360 ?auto_58363 ) ) ( not ( = ?auto_58360 ?auto_58365 ) ) ( not ( = ?auto_58361 ?auto_58362 ) ) ( not ( = ?auto_58361 ?auto_58363 ) ) ( not ( = ?auto_58361 ?auto_58365 ) ) ( not ( = ?auto_58362 ?auto_58363 ) ) ( not ( = ?auto_58363 ?auto_58365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58365 ?auto_58362 ?auto_58359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58378 - OBJ
      ?auto_58379 - OBJ
      ?auto_58380 - OBJ
      ?auto_58381 - OBJ
      ?auto_58377 - LOCATION
    )
    :vars
    (
      ?auto_58383 - TRUCK
      ?auto_58382 - LOCATION
      ?auto_58384 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58379 ?auto_58383 ) ( TRUCK-AT ?auto_58383 ?auto_58382 ) ( IN-CITY ?auto_58382 ?auto_58384 ) ( IN-CITY ?auto_58377 ?auto_58384 ) ( not ( = ?auto_58377 ?auto_58382 ) ) ( OBJ-AT ?auto_58380 ?auto_58377 ) ( not ( = ?auto_58380 ?auto_58379 ) ) ( OBJ-AT ?auto_58378 ?auto_58377 ) ( OBJ-AT ?auto_58381 ?auto_58377 ) ( not ( = ?auto_58378 ?auto_58379 ) ) ( not ( = ?auto_58378 ?auto_58380 ) ) ( not ( = ?auto_58378 ?auto_58381 ) ) ( not ( = ?auto_58379 ?auto_58381 ) ) ( not ( = ?auto_58380 ?auto_58381 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58380 ?auto_58379 ?auto_58377 ) )
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
      ?auto_58416 - TRUCK
      ?auto_58414 - LOCATION
      ?auto_58417 - CITY
      ?auto_58415 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58411 ?auto_58416 ) ( TRUCK-AT ?auto_58416 ?auto_58414 ) ( IN-CITY ?auto_58414 ?auto_58417 ) ( IN-CITY ?auto_58409 ?auto_58417 ) ( not ( = ?auto_58409 ?auto_58414 ) ) ( OBJ-AT ?auto_58415 ?auto_58409 ) ( not ( = ?auto_58415 ?auto_58411 ) ) ( OBJ-AT ?auto_58410 ?auto_58409 ) ( OBJ-AT ?auto_58412 ?auto_58409 ) ( OBJ-AT ?auto_58413 ?auto_58409 ) ( not ( = ?auto_58410 ?auto_58411 ) ) ( not ( = ?auto_58410 ?auto_58412 ) ) ( not ( = ?auto_58410 ?auto_58413 ) ) ( not ( = ?auto_58410 ?auto_58415 ) ) ( not ( = ?auto_58411 ?auto_58412 ) ) ( not ( = ?auto_58411 ?auto_58413 ) ) ( not ( = ?auto_58412 ?auto_58413 ) ) ( not ( = ?auto_58412 ?auto_58415 ) ) ( not ( = ?auto_58413 ?auto_58415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58415 ?auto_58411 ?auto_58409 ) )
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
      ?auto_58467 - TRUCK
      ?auto_58466 - LOCATION
      ?auto_58468 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58462 ?auto_58467 ) ( TRUCK-AT ?auto_58467 ?auto_58466 ) ( IN-CITY ?auto_58466 ?auto_58468 ) ( IN-CITY ?auto_58461 ?auto_58468 ) ( not ( = ?auto_58461 ?auto_58466 ) ) ( OBJ-AT ?auto_58464 ?auto_58461 ) ( not ( = ?auto_58464 ?auto_58462 ) ) ( OBJ-AT ?auto_58463 ?auto_58461 ) ( OBJ-AT ?auto_58465 ?auto_58461 ) ( not ( = ?auto_58462 ?auto_58463 ) ) ( not ( = ?auto_58462 ?auto_58465 ) ) ( not ( = ?auto_58463 ?auto_58464 ) ) ( not ( = ?auto_58463 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58464 ?auto_58462 ?auto_58461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58478 - OBJ
      ?auto_58479 - OBJ
      ?auto_58480 - OBJ
      ?auto_58481 - OBJ
      ?auto_58477 - LOCATION
    )
    :vars
    (
      ?auto_58483 - TRUCK
      ?auto_58482 - LOCATION
      ?auto_58484 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58478 ?auto_58483 ) ( TRUCK-AT ?auto_58483 ?auto_58482 ) ( IN-CITY ?auto_58482 ?auto_58484 ) ( IN-CITY ?auto_58477 ?auto_58484 ) ( not ( = ?auto_58477 ?auto_58482 ) ) ( OBJ-AT ?auto_58479 ?auto_58477 ) ( not ( = ?auto_58479 ?auto_58478 ) ) ( OBJ-AT ?auto_58480 ?auto_58477 ) ( OBJ-AT ?auto_58481 ?auto_58477 ) ( not ( = ?auto_58478 ?auto_58480 ) ) ( not ( = ?auto_58478 ?auto_58481 ) ) ( not ( = ?auto_58479 ?auto_58480 ) ) ( not ( = ?auto_58479 ?auto_58481 ) ) ( not ( = ?auto_58480 ?auto_58481 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58479 ?auto_58478 ?auto_58477 ) )
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
      ?auto_58564 - TRUCK
      ?auto_58562 - LOCATION
      ?auto_58565 - CITY
      ?auto_58563 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58558 ?auto_58564 ) ( TRUCK-AT ?auto_58564 ?auto_58562 ) ( IN-CITY ?auto_58562 ?auto_58565 ) ( IN-CITY ?auto_58557 ?auto_58565 ) ( not ( = ?auto_58557 ?auto_58562 ) ) ( OBJ-AT ?auto_58563 ?auto_58557 ) ( not ( = ?auto_58563 ?auto_58558 ) ) ( OBJ-AT ?auto_58559 ?auto_58557 ) ( OBJ-AT ?auto_58560 ?auto_58557 ) ( OBJ-AT ?auto_58561 ?auto_58557 ) ( not ( = ?auto_58558 ?auto_58559 ) ) ( not ( = ?auto_58558 ?auto_58560 ) ) ( not ( = ?auto_58558 ?auto_58561 ) ) ( not ( = ?auto_58559 ?auto_58560 ) ) ( not ( = ?auto_58559 ?auto_58561 ) ) ( not ( = ?auto_58559 ?auto_58563 ) ) ( not ( = ?auto_58560 ?auto_58561 ) ) ( not ( = ?auto_58560 ?auto_58563 ) ) ( not ( = ?auto_58561 ?auto_58563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58563 ?auto_58558 ?auto_58557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58709 - OBJ
      ?auto_58710 - OBJ
      ?auto_58711 - OBJ
      ?auto_58708 - LOCATION
    )
    :vars
    (
      ?auto_58713 - TRUCK
      ?auto_58714 - LOCATION
      ?auto_58712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58713 ?auto_58714 ) ( IN-CITY ?auto_58714 ?auto_58712 ) ( IN-CITY ?auto_58708 ?auto_58712 ) ( not ( = ?auto_58708 ?auto_58714 ) ) ( OBJ-AT ?auto_58709 ?auto_58708 ) ( not ( = ?auto_58709 ?auto_58711 ) ) ( OBJ-AT ?auto_58711 ?auto_58714 ) ( OBJ-AT ?auto_58710 ?auto_58708 ) ( not ( = ?auto_58709 ?auto_58710 ) ) ( not ( = ?auto_58710 ?auto_58711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58709 ?auto_58711 ?auto_58708 ) )
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
      ?auto_58748 - LOCATION
      ?auto_58745 - CITY
      ?auto_58747 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58746 ?auto_58748 ) ( IN-CITY ?auto_58748 ?auto_58745 ) ( IN-CITY ?auto_58741 ?auto_58745 ) ( not ( = ?auto_58741 ?auto_58748 ) ) ( OBJ-AT ?auto_58747 ?auto_58741 ) ( not ( = ?auto_58747 ?auto_58744 ) ) ( OBJ-AT ?auto_58744 ?auto_58748 ) ( OBJ-AT ?auto_58742 ?auto_58741 ) ( OBJ-AT ?auto_58743 ?auto_58741 ) ( not ( = ?auto_58742 ?auto_58743 ) ) ( not ( = ?auto_58742 ?auto_58744 ) ) ( not ( = ?auto_58742 ?auto_58747 ) ) ( not ( = ?auto_58743 ?auto_58744 ) ) ( not ( = ?auto_58743 ?auto_58747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58747 ?auto_58744 ?auto_58741 ) )
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
      ?auto_58760 - LOCATION
      ?auto_58757 - CITY
      ?auto_58759 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58758 ?auto_58760 ) ( IN-CITY ?auto_58760 ?auto_58757 ) ( IN-CITY ?auto_58753 ?auto_58757 ) ( not ( = ?auto_58753 ?auto_58760 ) ) ( OBJ-AT ?auto_58759 ?auto_58753 ) ( not ( = ?auto_58759 ?auto_58755 ) ) ( OBJ-AT ?auto_58755 ?auto_58760 ) ( OBJ-AT ?auto_58754 ?auto_58753 ) ( OBJ-AT ?auto_58756 ?auto_58753 ) ( not ( = ?auto_58754 ?auto_58755 ) ) ( not ( = ?auto_58754 ?auto_58756 ) ) ( not ( = ?auto_58754 ?auto_58759 ) ) ( not ( = ?auto_58755 ?auto_58756 ) ) ( not ( = ?auto_58756 ?auto_58759 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58759 ?auto_58755 ?auto_58753 ) )
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
      ?auto_58798 - LOCATION
      ?auto_58795 - CITY
      ?auto_58797 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58796 ?auto_58798 ) ( IN-CITY ?auto_58798 ?auto_58795 ) ( IN-CITY ?auto_58791 ?auto_58795 ) ( not ( = ?auto_58791 ?auto_58798 ) ) ( OBJ-AT ?auto_58797 ?auto_58791 ) ( not ( = ?auto_58797 ?auto_58792 ) ) ( OBJ-AT ?auto_58792 ?auto_58798 ) ( OBJ-AT ?auto_58793 ?auto_58791 ) ( OBJ-AT ?auto_58794 ?auto_58791 ) ( not ( = ?auto_58792 ?auto_58793 ) ) ( not ( = ?auto_58792 ?auto_58794 ) ) ( not ( = ?auto_58793 ?auto_58794 ) ) ( not ( = ?auto_58793 ?auto_58797 ) ) ( not ( = ?auto_58794 ?auto_58797 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58797 ?auto_58792 ?auto_58791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58831 - OBJ
      ?auto_58832 - OBJ
      ?auto_58833 - OBJ
      ?auto_58834 - OBJ
      ?auto_58830 - LOCATION
    )
    :vars
    (
      ?auto_58836 - TRUCK
      ?auto_58837 - LOCATION
      ?auto_58835 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58836 ?auto_58837 ) ( IN-CITY ?auto_58837 ?auto_58835 ) ( IN-CITY ?auto_58830 ?auto_58835 ) ( not ( = ?auto_58830 ?auto_58837 ) ) ( OBJ-AT ?auto_58832 ?auto_58830 ) ( not ( = ?auto_58832 ?auto_58834 ) ) ( OBJ-AT ?auto_58834 ?auto_58837 ) ( OBJ-AT ?auto_58831 ?auto_58830 ) ( OBJ-AT ?auto_58833 ?auto_58830 ) ( not ( = ?auto_58831 ?auto_58832 ) ) ( not ( = ?auto_58831 ?auto_58833 ) ) ( not ( = ?auto_58831 ?auto_58834 ) ) ( not ( = ?auto_58832 ?auto_58833 ) ) ( not ( = ?auto_58833 ?auto_58834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58832 ?auto_58834 ?auto_58830 ) )
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
      ?auto_58844 - TRUCK
      ?auto_58845 - LOCATION
      ?auto_58843 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58844 ?auto_58845 ) ( IN-CITY ?auto_58845 ?auto_58843 ) ( IN-CITY ?auto_58838 ?auto_58843 ) ( not ( = ?auto_58838 ?auto_58845 ) ) ( OBJ-AT ?auto_58839 ?auto_58838 ) ( not ( = ?auto_58839 ?auto_58842 ) ) ( OBJ-AT ?auto_58842 ?auto_58845 ) ( OBJ-AT ?auto_58840 ?auto_58838 ) ( OBJ-AT ?auto_58841 ?auto_58838 ) ( not ( = ?auto_58839 ?auto_58840 ) ) ( not ( = ?auto_58839 ?auto_58841 ) ) ( not ( = ?auto_58840 ?auto_58841 ) ) ( not ( = ?auto_58840 ?auto_58842 ) ) ( not ( = ?auto_58841 ?auto_58842 ) ) )
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
      ?auto_58852 - TRUCK
      ?auto_58853 - LOCATION
      ?auto_58851 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58852 ?auto_58853 ) ( IN-CITY ?auto_58853 ?auto_58851 ) ( IN-CITY ?auto_58846 ?auto_58851 ) ( not ( = ?auto_58846 ?auto_58853 ) ) ( OBJ-AT ?auto_58850 ?auto_58846 ) ( not ( = ?auto_58850 ?auto_58849 ) ) ( OBJ-AT ?auto_58849 ?auto_58853 ) ( OBJ-AT ?auto_58847 ?auto_58846 ) ( OBJ-AT ?auto_58848 ?auto_58846 ) ( not ( = ?auto_58847 ?auto_58848 ) ) ( not ( = ?auto_58847 ?auto_58849 ) ) ( not ( = ?auto_58847 ?auto_58850 ) ) ( not ( = ?auto_58848 ?auto_58849 ) ) ( not ( = ?auto_58848 ?auto_58850 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58850 ?auto_58849 ?auto_58846 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58935 - OBJ
      ?auto_58936 - OBJ
      ?auto_58937 - OBJ
      ?auto_58938 - OBJ
      ?auto_58934 - LOCATION
    )
    :vars
    (
      ?auto_58940 - TRUCK
      ?auto_58941 - LOCATION
      ?auto_58939 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58940 ?auto_58941 ) ( IN-CITY ?auto_58941 ?auto_58939 ) ( IN-CITY ?auto_58934 ?auto_58939 ) ( not ( = ?auto_58934 ?auto_58941 ) ) ( OBJ-AT ?auto_58938 ?auto_58934 ) ( not ( = ?auto_58938 ?auto_58936 ) ) ( OBJ-AT ?auto_58936 ?auto_58941 ) ( OBJ-AT ?auto_58935 ?auto_58934 ) ( OBJ-AT ?auto_58937 ?auto_58934 ) ( not ( = ?auto_58935 ?auto_58936 ) ) ( not ( = ?auto_58935 ?auto_58937 ) ) ( not ( = ?auto_58935 ?auto_58938 ) ) ( not ( = ?auto_58936 ?auto_58937 ) ) ( not ( = ?auto_58937 ?auto_58938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58938 ?auto_58936 ?auto_58934 ) )
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
      ?auto_59004 - TRUCK
      ?auto_59005 - LOCATION
      ?auto_59003 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59004 ?auto_59005 ) ( IN-CITY ?auto_59005 ?auto_59003 ) ( IN-CITY ?auto_58998 ?auto_59003 ) ( not ( = ?auto_58998 ?auto_59005 ) ) ( OBJ-AT ?auto_59000 ?auto_58998 ) ( not ( = ?auto_59000 ?auto_59001 ) ) ( OBJ-AT ?auto_59001 ?auto_59005 ) ( OBJ-AT ?auto_58999 ?auto_58998 ) ( OBJ-AT ?auto_59002 ?auto_58998 ) ( not ( = ?auto_58999 ?auto_59000 ) ) ( not ( = ?auto_58999 ?auto_59001 ) ) ( not ( = ?auto_58999 ?auto_59002 ) ) ( not ( = ?auto_59000 ?auto_59002 ) ) ( not ( = ?auto_59001 ?auto_59002 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59000 ?auto_59001 ?auto_58998 ) )
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
      ?auto_59038 - LOCATION
      ?auto_59035 - CITY
      ?auto_59037 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59036 ?auto_59038 ) ( IN-CITY ?auto_59038 ?auto_59035 ) ( IN-CITY ?auto_59030 ?auto_59035 ) ( not ( = ?auto_59030 ?auto_59038 ) ) ( OBJ-AT ?auto_59037 ?auto_59030 ) ( not ( = ?auto_59037 ?auto_59034 ) ) ( OBJ-AT ?auto_59034 ?auto_59038 ) ( OBJ-AT ?auto_59031 ?auto_59030 ) ( OBJ-AT ?auto_59032 ?auto_59030 ) ( OBJ-AT ?auto_59033 ?auto_59030 ) ( not ( = ?auto_59031 ?auto_59032 ) ) ( not ( = ?auto_59031 ?auto_59033 ) ) ( not ( = ?auto_59031 ?auto_59034 ) ) ( not ( = ?auto_59031 ?auto_59037 ) ) ( not ( = ?auto_59032 ?auto_59033 ) ) ( not ( = ?auto_59032 ?auto_59034 ) ) ( not ( = ?auto_59032 ?auto_59037 ) ) ( not ( = ?auto_59033 ?auto_59034 ) ) ( not ( = ?auto_59033 ?auto_59037 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59037 ?auto_59034 ?auto_59030 ) )
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
      ?auto_59055 - LOCATION
      ?auto_59052 - CITY
      ?auto_59054 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59053 ?auto_59055 ) ( IN-CITY ?auto_59055 ?auto_59052 ) ( IN-CITY ?auto_59047 ?auto_59052 ) ( not ( = ?auto_59047 ?auto_59055 ) ) ( OBJ-AT ?auto_59054 ?auto_59047 ) ( not ( = ?auto_59054 ?auto_59050 ) ) ( OBJ-AT ?auto_59050 ?auto_59055 ) ( OBJ-AT ?auto_59048 ?auto_59047 ) ( OBJ-AT ?auto_59049 ?auto_59047 ) ( OBJ-AT ?auto_59051 ?auto_59047 ) ( not ( = ?auto_59048 ?auto_59049 ) ) ( not ( = ?auto_59048 ?auto_59050 ) ) ( not ( = ?auto_59048 ?auto_59051 ) ) ( not ( = ?auto_59048 ?auto_59054 ) ) ( not ( = ?auto_59049 ?auto_59050 ) ) ( not ( = ?auto_59049 ?auto_59051 ) ) ( not ( = ?auto_59049 ?auto_59054 ) ) ( not ( = ?auto_59050 ?auto_59051 ) ) ( not ( = ?auto_59051 ?auto_59054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59054 ?auto_59050 ?auto_59047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59066 - OBJ
      ?auto_59067 - OBJ
      ?auto_59068 - OBJ
      ?auto_59069 - OBJ
      ?auto_59065 - LOCATION
    )
    :vars
    (
      ?auto_59071 - TRUCK
      ?auto_59072 - LOCATION
      ?auto_59070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59071 ?auto_59072 ) ( IN-CITY ?auto_59072 ?auto_59070 ) ( IN-CITY ?auto_59065 ?auto_59070 ) ( not ( = ?auto_59065 ?auto_59072 ) ) ( OBJ-AT ?auto_59068 ?auto_59065 ) ( not ( = ?auto_59068 ?auto_59067 ) ) ( OBJ-AT ?auto_59067 ?auto_59072 ) ( OBJ-AT ?auto_59066 ?auto_59065 ) ( OBJ-AT ?auto_59069 ?auto_59065 ) ( not ( = ?auto_59066 ?auto_59067 ) ) ( not ( = ?auto_59066 ?auto_59068 ) ) ( not ( = ?auto_59066 ?auto_59069 ) ) ( not ( = ?auto_59067 ?auto_59069 ) ) ( not ( = ?auto_59068 ?auto_59069 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59068 ?auto_59067 ?auto_59065 ) )
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
      ?auto_59105 - LOCATION
      ?auto_59102 - CITY
      ?auto_59104 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59103 ?auto_59105 ) ( IN-CITY ?auto_59105 ?auto_59102 ) ( IN-CITY ?auto_59097 ?auto_59102 ) ( not ( = ?auto_59097 ?auto_59105 ) ) ( OBJ-AT ?auto_59104 ?auto_59097 ) ( not ( = ?auto_59104 ?auto_59099 ) ) ( OBJ-AT ?auto_59099 ?auto_59105 ) ( OBJ-AT ?auto_59098 ?auto_59097 ) ( OBJ-AT ?auto_59100 ?auto_59097 ) ( OBJ-AT ?auto_59101 ?auto_59097 ) ( not ( = ?auto_59098 ?auto_59099 ) ) ( not ( = ?auto_59098 ?auto_59100 ) ) ( not ( = ?auto_59098 ?auto_59101 ) ) ( not ( = ?auto_59098 ?auto_59104 ) ) ( not ( = ?auto_59099 ?auto_59100 ) ) ( not ( = ?auto_59099 ?auto_59101 ) ) ( not ( = ?auto_59100 ?auto_59101 ) ) ( not ( = ?auto_59100 ?auto_59104 ) ) ( not ( = ?auto_59101 ?auto_59104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59104 ?auto_59099 ?auto_59097 ) )
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
      ?auto_59147 - TRUCK
      ?auto_59148 - LOCATION
      ?auto_59146 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59147 ?auto_59148 ) ( IN-CITY ?auto_59148 ?auto_59146 ) ( IN-CITY ?auto_59141 ?auto_59146 ) ( not ( = ?auto_59141 ?auto_59148 ) ) ( OBJ-AT ?auto_59145 ?auto_59141 ) ( not ( = ?auto_59145 ?auto_59142 ) ) ( OBJ-AT ?auto_59142 ?auto_59148 ) ( OBJ-AT ?auto_59143 ?auto_59141 ) ( OBJ-AT ?auto_59144 ?auto_59141 ) ( not ( = ?auto_59142 ?auto_59143 ) ) ( not ( = ?auto_59142 ?auto_59144 ) ) ( not ( = ?auto_59143 ?auto_59144 ) ) ( not ( = ?auto_59143 ?auto_59145 ) ) ( not ( = ?auto_59144 ?auto_59145 ) ) )
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
      ?auto_59179 - TRUCK
      ?auto_59180 - LOCATION
      ?auto_59178 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59179 ?auto_59180 ) ( IN-CITY ?auto_59180 ?auto_59178 ) ( IN-CITY ?auto_59173 ?auto_59178 ) ( not ( = ?auto_59173 ?auto_59180 ) ) ( OBJ-AT ?auto_59175 ?auto_59173 ) ( not ( = ?auto_59175 ?auto_59174 ) ) ( OBJ-AT ?auto_59174 ?auto_59180 ) ( OBJ-AT ?auto_59176 ?auto_59173 ) ( OBJ-AT ?auto_59177 ?auto_59173 ) ( not ( = ?auto_59174 ?auto_59176 ) ) ( not ( = ?auto_59174 ?auto_59177 ) ) ( not ( = ?auto_59175 ?auto_59176 ) ) ( not ( = ?auto_59175 ?auto_59177 ) ) ( not ( = ?auto_59176 ?auto_59177 ) ) )
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
      ?auto_59253 - LOCATION
      ?auto_59250 - CITY
      ?auto_59252 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59251 ?auto_59253 ) ( IN-CITY ?auto_59253 ?auto_59250 ) ( IN-CITY ?auto_59245 ?auto_59250 ) ( not ( = ?auto_59245 ?auto_59253 ) ) ( OBJ-AT ?auto_59252 ?auto_59245 ) ( not ( = ?auto_59252 ?auto_59246 ) ) ( OBJ-AT ?auto_59246 ?auto_59253 ) ( OBJ-AT ?auto_59247 ?auto_59245 ) ( OBJ-AT ?auto_59248 ?auto_59245 ) ( OBJ-AT ?auto_59249 ?auto_59245 ) ( not ( = ?auto_59246 ?auto_59247 ) ) ( not ( = ?auto_59246 ?auto_59248 ) ) ( not ( = ?auto_59246 ?auto_59249 ) ) ( not ( = ?auto_59247 ?auto_59248 ) ) ( not ( = ?auto_59247 ?auto_59249 ) ) ( not ( = ?auto_59247 ?auto_59252 ) ) ( not ( = ?auto_59248 ?auto_59249 ) ) ( not ( = ?auto_59248 ?auto_59252 ) ) ( not ( = ?auto_59249 ?auto_59252 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59252 ?auto_59246 ?auto_59245 ) )
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
      ?auto_59435 - LOCATION
      ?auto_59436 - CITY
      ?auto_59433 - OBJ
      ?auto_59434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59435 ?auto_59436 ) ( IN-CITY ?auto_59429 ?auto_59436 ) ( not ( = ?auto_59429 ?auto_59435 ) ) ( OBJ-AT ?auto_59433 ?auto_59429 ) ( not ( = ?auto_59433 ?auto_59432 ) ) ( OBJ-AT ?auto_59432 ?auto_59435 ) ( TRUCK-AT ?auto_59434 ?auto_59429 ) ( OBJ-AT ?auto_59430 ?auto_59429 ) ( OBJ-AT ?auto_59431 ?auto_59429 ) ( not ( = ?auto_59430 ?auto_59431 ) ) ( not ( = ?auto_59430 ?auto_59432 ) ) ( not ( = ?auto_59430 ?auto_59433 ) ) ( not ( = ?auto_59431 ?auto_59432 ) ) ( not ( = ?auto_59431 ?auto_59433 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59433 ?auto_59432 ?auto_59429 ) )
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
      ?auto_59447 - LOCATION
      ?auto_59448 - CITY
      ?auto_59445 - OBJ
      ?auto_59446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59447 ?auto_59448 ) ( IN-CITY ?auto_59441 ?auto_59448 ) ( not ( = ?auto_59441 ?auto_59447 ) ) ( OBJ-AT ?auto_59445 ?auto_59441 ) ( not ( = ?auto_59445 ?auto_59443 ) ) ( OBJ-AT ?auto_59443 ?auto_59447 ) ( TRUCK-AT ?auto_59446 ?auto_59441 ) ( OBJ-AT ?auto_59442 ?auto_59441 ) ( OBJ-AT ?auto_59444 ?auto_59441 ) ( not ( = ?auto_59442 ?auto_59443 ) ) ( not ( = ?auto_59442 ?auto_59444 ) ) ( not ( = ?auto_59442 ?auto_59445 ) ) ( not ( = ?auto_59443 ?auto_59444 ) ) ( not ( = ?auto_59444 ?auto_59445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59445 ?auto_59443 ?auto_59441 ) )
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
      ?auto_59485 - LOCATION
      ?auto_59486 - CITY
      ?auto_59483 - OBJ
      ?auto_59484 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59485 ?auto_59486 ) ( IN-CITY ?auto_59479 ?auto_59486 ) ( not ( = ?auto_59479 ?auto_59485 ) ) ( OBJ-AT ?auto_59483 ?auto_59479 ) ( not ( = ?auto_59483 ?auto_59480 ) ) ( OBJ-AT ?auto_59480 ?auto_59485 ) ( TRUCK-AT ?auto_59484 ?auto_59479 ) ( OBJ-AT ?auto_59481 ?auto_59479 ) ( OBJ-AT ?auto_59482 ?auto_59479 ) ( not ( = ?auto_59480 ?auto_59481 ) ) ( not ( = ?auto_59480 ?auto_59482 ) ) ( not ( = ?auto_59481 ?auto_59482 ) ) ( not ( = ?auto_59481 ?auto_59483 ) ) ( not ( = ?auto_59482 ?auto_59483 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59483 ?auto_59480 ?auto_59479 ) )
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
    ( and ( IN-CITY ?auto_59540 ?auto_59541 ) ( IN-CITY ?auto_59534 ?auto_59541 ) ( not ( = ?auto_59534 ?auto_59540 ) ) ( OBJ-AT ?auto_59536 ?auto_59534 ) ( not ( = ?auto_59536 ?auto_59537 ) ) ( OBJ-AT ?auto_59537 ?auto_59540 ) ( TRUCK-AT ?auto_59539 ?auto_59534 ) ( OBJ-AT ?auto_59535 ?auto_59534 ) ( OBJ-AT ?auto_59538 ?auto_59534 ) ( not ( = ?auto_59535 ?auto_59536 ) ) ( not ( = ?auto_59535 ?auto_59537 ) ) ( not ( = ?auto_59535 ?auto_59538 ) ) ( not ( = ?auto_59536 ?auto_59538 ) ) ( not ( = ?auto_59537 ?auto_59538 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59536 ?auto_59537 ?auto_59534 ) )
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
    ( and ( IN-CITY ?auto_59612 ?auto_59613 ) ( IN-CITY ?auto_59606 ?auto_59613 ) ( not ( = ?auto_59606 ?auto_59612 ) ) ( OBJ-AT ?auto_59607 ?auto_59606 ) ( not ( = ?auto_59607 ?auto_59608 ) ) ( OBJ-AT ?auto_59608 ?auto_59612 ) ( TRUCK-AT ?auto_59611 ?auto_59606 ) ( OBJ-AT ?auto_59609 ?auto_59606 ) ( OBJ-AT ?auto_59610 ?auto_59606 ) ( not ( = ?auto_59607 ?auto_59609 ) ) ( not ( = ?auto_59607 ?auto_59610 ) ) ( not ( = ?auto_59608 ?auto_59609 ) ) ( not ( = ?auto_59608 ?auto_59610 ) ) ( not ( = ?auto_59609 ?auto_59610 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59607 ?auto_59608 ?auto_59606 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59671 - OBJ
      ?auto_59672 - OBJ
      ?auto_59673 - OBJ
      ?auto_59674 - OBJ
      ?auto_59670 - LOCATION
    )
    :vars
    (
      ?auto_59676 - LOCATION
      ?auto_59677 - CITY
      ?auto_59675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59676 ?auto_59677 ) ( IN-CITY ?auto_59670 ?auto_59677 ) ( not ( = ?auto_59670 ?auto_59676 ) ) ( OBJ-AT ?auto_59673 ?auto_59670 ) ( not ( = ?auto_59673 ?auto_59674 ) ) ( OBJ-AT ?auto_59674 ?auto_59676 ) ( TRUCK-AT ?auto_59675 ?auto_59670 ) ( OBJ-AT ?auto_59671 ?auto_59670 ) ( OBJ-AT ?auto_59672 ?auto_59670 ) ( not ( = ?auto_59671 ?auto_59672 ) ) ( not ( = ?auto_59671 ?auto_59673 ) ) ( not ( = ?auto_59671 ?auto_59674 ) ) ( not ( = ?auto_59672 ?auto_59673 ) ) ( not ( = ?auto_59672 ?auto_59674 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59673 ?auto_59674 ?auto_59670 ) )
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
      ?auto_59725 - LOCATION
      ?auto_59726 - CITY
      ?auto_59723 - OBJ
      ?auto_59724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59725 ?auto_59726 ) ( IN-CITY ?auto_59718 ?auto_59726 ) ( not ( = ?auto_59718 ?auto_59725 ) ) ( OBJ-AT ?auto_59723 ?auto_59718 ) ( not ( = ?auto_59723 ?auto_59722 ) ) ( OBJ-AT ?auto_59722 ?auto_59725 ) ( TRUCK-AT ?auto_59724 ?auto_59718 ) ( OBJ-AT ?auto_59719 ?auto_59718 ) ( OBJ-AT ?auto_59720 ?auto_59718 ) ( OBJ-AT ?auto_59721 ?auto_59718 ) ( not ( = ?auto_59719 ?auto_59720 ) ) ( not ( = ?auto_59719 ?auto_59721 ) ) ( not ( = ?auto_59719 ?auto_59722 ) ) ( not ( = ?auto_59719 ?auto_59723 ) ) ( not ( = ?auto_59720 ?auto_59721 ) ) ( not ( = ?auto_59720 ?auto_59722 ) ) ( not ( = ?auto_59720 ?auto_59723 ) ) ( not ( = ?auto_59721 ?auto_59722 ) ) ( not ( = ?auto_59721 ?auto_59723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59723 ?auto_59722 ?auto_59718 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59728 - OBJ
      ?auto_59729 - OBJ
      ?auto_59730 - OBJ
      ?auto_59731 - OBJ
      ?auto_59727 - LOCATION
    )
    :vars
    (
      ?auto_59733 - LOCATION
      ?auto_59734 - CITY
      ?auto_59732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59733 ?auto_59734 ) ( IN-CITY ?auto_59727 ?auto_59734 ) ( not ( = ?auto_59727 ?auto_59733 ) ) ( OBJ-AT ?auto_59731 ?auto_59727 ) ( not ( = ?auto_59731 ?auto_59730 ) ) ( OBJ-AT ?auto_59730 ?auto_59733 ) ( TRUCK-AT ?auto_59732 ?auto_59727 ) ( OBJ-AT ?auto_59728 ?auto_59727 ) ( OBJ-AT ?auto_59729 ?auto_59727 ) ( not ( = ?auto_59728 ?auto_59729 ) ) ( not ( = ?auto_59728 ?auto_59730 ) ) ( not ( = ?auto_59728 ?auto_59731 ) ) ( not ( = ?auto_59729 ?auto_59730 ) ) ( not ( = ?auto_59729 ?auto_59731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59731 ?auto_59730 ?auto_59727 ) )
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
      ?auto_59742 - LOCATION
      ?auto_59743 - CITY
      ?auto_59740 - OBJ
      ?auto_59741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59742 ?auto_59743 ) ( IN-CITY ?auto_59735 ?auto_59743 ) ( not ( = ?auto_59735 ?auto_59742 ) ) ( OBJ-AT ?auto_59740 ?auto_59735 ) ( not ( = ?auto_59740 ?auto_59738 ) ) ( OBJ-AT ?auto_59738 ?auto_59742 ) ( TRUCK-AT ?auto_59741 ?auto_59735 ) ( OBJ-AT ?auto_59736 ?auto_59735 ) ( OBJ-AT ?auto_59737 ?auto_59735 ) ( OBJ-AT ?auto_59739 ?auto_59735 ) ( not ( = ?auto_59736 ?auto_59737 ) ) ( not ( = ?auto_59736 ?auto_59738 ) ) ( not ( = ?auto_59736 ?auto_59739 ) ) ( not ( = ?auto_59736 ?auto_59740 ) ) ( not ( = ?auto_59737 ?auto_59738 ) ) ( not ( = ?auto_59737 ?auto_59739 ) ) ( not ( = ?auto_59737 ?auto_59740 ) ) ( not ( = ?auto_59738 ?auto_59739 ) ) ( not ( = ?auto_59739 ?auto_59740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59740 ?auto_59738 ?auto_59735 ) )
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
      ?auto_59792 - LOCATION
      ?auto_59793 - CITY
      ?auto_59790 - OBJ
      ?auto_59791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59792 ?auto_59793 ) ( IN-CITY ?auto_59785 ?auto_59793 ) ( not ( = ?auto_59785 ?auto_59792 ) ) ( OBJ-AT ?auto_59790 ?auto_59785 ) ( not ( = ?auto_59790 ?auto_59787 ) ) ( OBJ-AT ?auto_59787 ?auto_59792 ) ( TRUCK-AT ?auto_59791 ?auto_59785 ) ( OBJ-AT ?auto_59786 ?auto_59785 ) ( OBJ-AT ?auto_59788 ?auto_59785 ) ( OBJ-AT ?auto_59789 ?auto_59785 ) ( not ( = ?auto_59786 ?auto_59787 ) ) ( not ( = ?auto_59786 ?auto_59788 ) ) ( not ( = ?auto_59786 ?auto_59789 ) ) ( not ( = ?auto_59786 ?auto_59790 ) ) ( not ( = ?auto_59787 ?auto_59788 ) ) ( not ( = ?auto_59787 ?auto_59789 ) ) ( not ( = ?auto_59788 ?auto_59789 ) ) ( not ( = ?auto_59788 ?auto_59790 ) ) ( not ( = ?auto_59789 ?auto_59790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59790 ?auto_59787 ?auto_59785 ) )
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
      ?auto_59838 - OBJ
      ?auto_59839 - OBJ
      ?auto_59840 - OBJ
      ?auto_59841 - OBJ
      ?auto_59837 - LOCATION
    )
    :vars
    (
      ?auto_59843 - LOCATION
      ?auto_59844 - CITY
      ?auto_59842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59843 ?auto_59844 ) ( IN-CITY ?auto_59837 ?auto_59844 ) ( not ( = ?auto_59837 ?auto_59843 ) ) ( OBJ-AT ?auto_59840 ?auto_59837 ) ( not ( = ?auto_59840 ?auto_59838 ) ) ( OBJ-AT ?auto_59838 ?auto_59843 ) ( TRUCK-AT ?auto_59842 ?auto_59837 ) ( OBJ-AT ?auto_59839 ?auto_59837 ) ( OBJ-AT ?auto_59841 ?auto_59837 ) ( not ( = ?auto_59838 ?auto_59839 ) ) ( not ( = ?auto_59838 ?auto_59841 ) ) ( not ( = ?auto_59839 ?auto_59840 ) ) ( not ( = ?auto_59839 ?auto_59841 ) ) ( not ( = ?auto_59840 ?auto_59841 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59840 ?auto_59838 ?auto_59837 ) )
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
      ?auto_59940 - LOCATION
      ?auto_59941 - CITY
      ?auto_59938 - OBJ
      ?auto_59939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59940 ?auto_59941 ) ( IN-CITY ?auto_59933 ?auto_59941 ) ( not ( = ?auto_59933 ?auto_59940 ) ) ( OBJ-AT ?auto_59938 ?auto_59933 ) ( not ( = ?auto_59938 ?auto_59934 ) ) ( OBJ-AT ?auto_59934 ?auto_59940 ) ( TRUCK-AT ?auto_59939 ?auto_59933 ) ( OBJ-AT ?auto_59935 ?auto_59933 ) ( OBJ-AT ?auto_59936 ?auto_59933 ) ( OBJ-AT ?auto_59937 ?auto_59933 ) ( not ( = ?auto_59934 ?auto_59935 ) ) ( not ( = ?auto_59934 ?auto_59936 ) ) ( not ( = ?auto_59934 ?auto_59937 ) ) ( not ( = ?auto_59935 ?auto_59936 ) ) ( not ( = ?auto_59935 ?auto_59937 ) ) ( not ( = ?auto_59935 ?auto_59938 ) ) ( not ( = ?auto_59936 ?auto_59937 ) ) ( not ( = ?auto_59936 ?auto_59938 ) ) ( not ( = ?auto_59937 ?auto_59938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59938 ?auto_59934 ?auto_59933 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60083 - OBJ
      ?auto_60084 - OBJ
      ?auto_60085 - OBJ
      ?auto_60082 - LOCATION
    )
    :vars
    (
      ?auto_60087 - LOCATION
      ?auto_60086 - CITY
      ?auto_60088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60087 ?auto_60086 ) ( IN-CITY ?auto_60082 ?auto_60086 ) ( not ( = ?auto_60082 ?auto_60087 ) ) ( OBJ-AT ?auto_60083 ?auto_60082 ) ( not ( = ?auto_60083 ?auto_60085 ) ) ( OBJ-AT ?auto_60085 ?auto_60087 ) ( TRUCK-AT ?auto_60088 ?auto_60082 ) ( OBJ-AT ?auto_60084 ?auto_60082 ) ( not ( = ?auto_60083 ?auto_60084 ) ) ( not ( = ?auto_60084 ?auto_60085 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60083 ?auto_60085 ?auto_60082 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60758 - OBJ
      ?auto_60757 - LOCATION
    )
    :vars
    (
      ?auto_60760 - LOCATION
      ?auto_60759 - CITY
      ?auto_60761 - OBJ
      ?auto_60762 - TRUCK
      ?auto_60763 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60760 ?auto_60759 ) ( IN-CITY ?auto_60757 ?auto_60759 ) ( not ( = ?auto_60757 ?auto_60760 ) ) ( OBJ-AT ?auto_60761 ?auto_60757 ) ( not ( = ?auto_60761 ?auto_60758 ) ) ( OBJ-AT ?auto_60758 ?auto_60760 ) ( TRUCK-AT ?auto_60762 ?auto_60763 ) ( IN-CITY ?auto_60763 ?auto_60759 ) ( not ( = ?auto_60757 ?auto_60763 ) ) ( not ( = ?auto_60760 ?auto_60763 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60762 ?auto_60763 ?auto_60757 ?auto_60759 )
      ( DELIVER-2PKG ?auto_60761 ?auto_60758 ?auto_60757 ) )
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
      ?auto_60767 - LOCATION
      ?auto_60768 - CITY
      ?auto_60770 - TRUCK
      ?auto_60769 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60767 ?auto_60768 ) ( IN-CITY ?auto_60764 ?auto_60768 ) ( not ( = ?auto_60764 ?auto_60767 ) ) ( OBJ-AT ?auto_60765 ?auto_60764 ) ( not ( = ?auto_60765 ?auto_60766 ) ) ( OBJ-AT ?auto_60766 ?auto_60767 ) ( TRUCK-AT ?auto_60770 ?auto_60769 ) ( IN-CITY ?auto_60769 ?auto_60768 ) ( not ( = ?auto_60764 ?auto_60769 ) ) ( not ( = ?auto_60767 ?auto_60769 ) ) )
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
      ?auto_60784 - LOCATION
      ?auto_60783 - CITY
      ?auto_60785 - TRUCK
      ?auto_60782 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60784 ?auto_60783 ) ( IN-CITY ?auto_60779 ?auto_60783 ) ( not ( = ?auto_60779 ?auto_60784 ) ) ( OBJ-AT ?auto_60781 ?auto_60779 ) ( not ( = ?auto_60781 ?auto_60780 ) ) ( OBJ-AT ?auto_60780 ?auto_60784 ) ( TRUCK-AT ?auto_60785 ?auto_60782 ) ( IN-CITY ?auto_60782 ?auto_60783 ) ( not ( = ?auto_60779 ?auto_60782 ) ) ( not ( = ?auto_60784 ?auto_60782 ) ) )
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
      ?auto_60808 - LOCATION
      ?auto_60807 - CITY
      ?auto_60809 - TRUCK
      ?auto_60806 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60808 ?auto_60807 ) ( IN-CITY ?auto_60802 ?auto_60807 ) ( not ( = ?auto_60802 ?auto_60808 ) ) ( OBJ-AT ?auto_60803 ?auto_60802 ) ( not ( = ?auto_60803 ?auto_60805 ) ) ( OBJ-AT ?auto_60805 ?auto_60808 ) ( TRUCK-AT ?auto_60809 ?auto_60806 ) ( IN-CITY ?auto_60806 ?auto_60807 ) ( not ( = ?auto_60802 ?auto_60806 ) ) ( not ( = ?auto_60808 ?auto_60806 ) ) ( OBJ-AT ?auto_60804 ?auto_60802 ) ( not ( = ?auto_60803 ?auto_60804 ) ) ( not ( = ?auto_60804 ?auto_60805 ) ) )
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
      ?auto_60824 - LOCATION
      ?auto_60823 - CITY
      ?auto_60825 - TRUCK
      ?auto_60822 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60824 ?auto_60823 ) ( IN-CITY ?auto_60818 ?auto_60823 ) ( not ( = ?auto_60818 ?auto_60824 ) ) ( OBJ-AT ?auto_60819 ?auto_60818 ) ( not ( = ?auto_60819 ?auto_60820 ) ) ( OBJ-AT ?auto_60820 ?auto_60824 ) ( TRUCK-AT ?auto_60825 ?auto_60822 ) ( IN-CITY ?auto_60822 ?auto_60823 ) ( not ( = ?auto_60818 ?auto_60822 ) ) ( not ( = ?auto_60824 ?auto_60822 ) ) ( OBJ-AT ?auto_60821 ?auto_60818 ) ( not ( = ?auto_60819 ?auto_60821 ) ) ( not ( = ?auto_60820 ?auto_60821 ) ) )
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
      ?auto_60891 - LOCATION
      ?auto_60890 - CITY
      ?auto_60892 - TRUCK
      ?auto_60889 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60891 ?auto_60890 ) ( IN-CITY ?auto_60885 ?auto_60890 ) ( not ( = ?auto_60885 ?auto_60891 ) ) ( OBJ-AT ?auto_60888 ?auto_60885 ) ( not ( = ?auto_60888 ?auto_60886 ) ) ( OBJ-AT ?auto_60886 ?auto_60891 ) ( TRUCK-AT ?auto_60892 ?auto_60889 ) ( IN-CITY ?auto_60889 ?auto_60890 ) ( not ( = ?auto_60885 ?auto_60889 ) ) ( not ( = ?auto_60891 ?auto_60889 ) ) ( OBJ-AT ?auto_60887 ?auto_60885 ) ( not ( = ?auto_60886 ?auto_60887 ) ) ( not ( = ?auto_60887 ?auto_60888 ) ) )
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
      ?auto_60968 - LOCATION
      ?auto_60967 - CITY
      ?auto_60969 - TRUCK
      ?auto_60966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60968 ?auto_60967 ) ( IN-CITY ?auto_60961 ?auto_60967 ) ( not ( = ?auto_60961 ?auto_60968 ) ) ( OBJ-AT ?auto_60962 ?auto_60961 ) ( not ( = ?auto_60962 ?auto_60965 ) ) ( OBJ-AT ?auto_60965 ?auto_60968 ) ( TRUCK-AT ?auto_60969 ?auto_60966 ) ( IN-CITY ?auto_60966 ?auto_60967 ) ( not ( = ?auto_60961 ?auto_60966 ) ) ( not ( = ?auto_60968 ?auto_60966 ) ) ( OBJ-AT ?auto_60963 ?auto_60961 ) ( OBJ-AT ?auto_60964 ?auto_60961 ) ( not ( = ?auto_60962 ?auto_60963 ) ) ( not ( = ?auto_60962 ?auto_60964 ) ) ( not ( = ?auto_60963 ?auto_60964 ) ) ( not ( = ?auto_60963 ?auto_60965 ) ) ( not ( = ?auto_60964 ?auto_60965 ) ) )
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
      ?auto_60986 - LOCATION
      ?auto_60985 - CITY
      ?auto_60987 - TRUCK
      ?auto_60984 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60986 ?auto_60985 ) ( IN-CITY ?auto_60979 ?auto_60985 ) ( not ( = ?auto_60979 ?auto_60986 ) ) ( OBJ-AT ?auto_60983 ?auto_60979 ) ( not ( = ?auto_60983 ?auto_60982 ) ) ( OBJ-AT ?auto_60982 ?auto_60986 ) ( TRUCK-AT ?auto_60987 ?auto_60984 ) ( IN-CITY ?auto_60984 ?auto_60985 ) ( not ( = ?auto_60979 ?auto_60984 ) ) ( not ( = ?auto_60986 ?auto_60984 ) ) ( OBJ-AT ?auto_60980 ?auto_60979 ) ( OBJ-AT ?auto_60981 ?auto_60979 ) ( not ( = ?auto_60980 ?auto_60981 ) ) ( not ( = ?auto_60980 ?auto_60982 ) ) ( not ( = ?auto_60980 ?auto_60983 ) ) ( not ( = ?auto_60981 ?auto_60982 ) ) ( not ( = ?auto_60981 ?auto_60983 ) ) )
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
      ?auto_61058 - LOCATION
      ?auto_61057 - CITY
      ?auto_61059 - TRUCK
      ?auto_61056 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61058 ?auto_61057 ) ( IN-CITY ?auto_61051 ?auto_61057 ) ( not ( = ?auto_61051 ?auto_61058 ) ) ( OBJ-AT ?auto_61052 ?auto_61051 ) ( not ( = ?auto_61052 ?auto_61053 ) ) ( OBJ-AT ?auto_61053 ?auto_61058 ) ( TRUCK-AT ?auto_61059 ?auto_61056 ) ( IN-CITY ?auto_61056 ?auto_61057 ) ( not ( = ?auto_61051 ?auto_61056 ) ) ( not ( = ?auto_61058 ?auto_61056 ) ) ( OBJ-AT ?auto_61054 ?auto_61051 ) ( OBJ-AT ?auto_61055 ?auto_61051 ) ( not ( = ?auto_61052 ?auto_61054 ) ) ( not ( = ?auto_61052 ?auto_61055 ) ) ( not ( = ?auto_61053 ?auto_61054 ) ) ( not ( = ?auto_61053 ?auto_61055 ) ) ( not ( = ?auto_61054 ?auto_61055 ) ) )
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
      ?auto_61317 - LOCATION
      ?auto_61316 - CITY
      ?auto_61318 - TRUCK
      ?auto_61315 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61317 ?auto_61316 ) ( IN-CITY ?auto_61310 ?auto_61316 ) ( not ( = ?auto_61310 ?auto_61317 ) ) ( OBJ-AT ?auto_61313 ?auto_61310 ) ( not ( = ?auto_61313 ?auto_61311 ) ) ( OBJ-AT ?auto_61311 ?auto_61317 ) ( TRUCK-AT ?auto_61318 ?auto_61315 ) ( IN-CITY ?auto_61315 ?auto_61316 ) ( not ( = ?auto_61310 ?auto_61315 ) ) ( not ( = ?auto_61317 ?auto_61315 ) ) ( OBJ-AT ?auto_61312 ?auto_61310 ) ( OBJ-AT ?auto_61314 ?auto_61310 ) ( not ( = ?auto_61311 ?auto_61312 ) ) ( not ( = ?auto_61311 ?auto_61314 ) ) ( not ( = ?auto_61312 ?auto_61313 ) ) ( not ( = ?auto_61312 ?auto_61314 ) ) ( not ( = ?auto_61313 ?auto_61314 ) ) )
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
      ?auto_61616 - LOCATION
      ?auto_61615 - CITY
      ?auto_61614 - TRUCK
      ?auto_61613 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61616 ?auto_61615 ) ( IN-CITY ?auto_61609 ?auto_61615 ) ( not ( = ?auto_61609 ?auto_61616 ) ) ( OBJ-AT ?auto_61612 ?auto_61609 ) ( not ( = ?auto_61612 ?auto_61611 ) ) ( OBJ-AT ?auto_61611 ?auto_61616 ) ( TRUCK-AT ?auto_61614 ?auto_61613 ) ( IN-CITY ?auto_61613 ?auto_61615 ) ( not ( = ?auto_61609 ?auto_61613 ) ) ( not ( = ?auto_61616 ?auto_61613 ) ) ( OBJ-AT ?auto_61610 ?auto_61609 ) ( not ( = ?auto_61610 ?auto_61611 ) ) ( not ( = ?auto_61610 ?auto_61612 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61612 ?auto_61611 ?auto_61609 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61843 - OBJ
      ?auto_61844 - OBJ
      ?auto_61845 - OBJ
      ?auto_61846 - OBJ
      ?auto_61842 - LOCATION
    )
    :vars
    (
      ?auto_61850 - LOCATION
      ?auto_61849 - CITY
      ?auto_61848 - TRUCK
      ?auto_61847 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61850 ?auto_61849 ) ( IN-CITY ?auto_61842 ?auto_61849 ) ( not ( = ?auto_61842 ?auto_61850 ) ) ( OBJ-AT ?auto_61845 ?auto_61842 ) ( not ( = ?auto_61845 ?auto_61844 ) ) ( OBJ-AT ?auto_61844 ?auto_61850 ) ( TRUCK-AT ?auto_61848 ?auto_61847 ) ( IN-CITY ?auto_61847 ?auto_61849 ) ( not ( = ?auto_61842 ?auto_61847 ) ) ( not ( = ?auto_61850 ?auto_61847 ) ) ( OBJ-AT ?auto_61843 ?auto_61842 ) ( OBJ-AT ?auto_61846 ?auto_61842 ) ( not ( = ?auto_61843 ?auto_61844 ) ) ( not ( = ?auto_61843 ?auto_61845 ) ) ( not ( = ?auto_61843 ?auto_61846 ) ) ( not ( = ?auto_61844 ?auto_61846 ) ) ( not ( = ?auto_61845 ?auto_61846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61845 ?auto_61844 ?auto_61842 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63761 - OBJ
      ?auto_63760 - LOCATION
    )
    :vars
    (
      ?auto_63764 - LOCATION
      ?auto_63763 - CITY
      ?auto_63765 - OBJ
      ?auto_63762 - TRUCK
      ?auto_63766 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63764 ?auto_63763 ) ( IN-CITY ?auto_63760 ?auto_63763 ) ( not ( = ?auto_63760 ?auto_63764 ) ) ( not ( = ?auto_63765 ?auto_63761 ) ) ( OBJ-AT ?auto_63761 ?auto_63764 ) ( IN-TRUCK ?auto_63765 ?auto_63762 ) ( TRUCK-AT ?auto_63762 ?auto_63766 ) ( IN-CITY ?auto_63766 ?auto_63763 ) ( not ( = ?auto_63760 ?auto_63766 ) ) ( not ( = ?auto_63764 ?auto_63766 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_63762 ?auto_63766 ?auto_63760 ?auto_63763 )
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
      ?auto_63770 - LOCATION
      ?auto_63772 - CITY
      ?auto_63773 - TRUCK
      ?auto_63771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63770 ?auto_63772 ) ( IN-CITY ?auto_63767 ?auto_63772 ) ( not ( = ?auto_63767 ?auto_63770 ) ) ( not ( = ?auto_63768 ?auto_63769 ) ) ( OBJ-AT ?auto_63769 ?auto_63770 ) ( IN-TRUCK ?auto_63768 ?auto_63773 ) ( TRUCK-AT ?auto_63773 ?auto_63771 ) ( IN-CITY ?auto_63771 ?auto_63772 ) ( not ( = ?auto_63767 ?auto_63771 ) ) ( not ( = ?auto_63770 ?auto_63771 ) ) )
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
      ?auto_63788 - LOCATION
      ?auto_63786 - CITY
      ?auto_63785 - TRUCK
      ?auto_63787 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63788 ?auto_63786 ) ( IN-CITY ?auto_63782 ?auto_63786 ) ( not ( = ?auto_63782 ?auto_63788 ) ) ( not ( = ?auto_63784 ?auto_63783 ) ) ( OBJ-AT ?auto_63783 ?auto_63788 ) ( IN-TRUCK ?auto_63784 ?auto_63785 ) ( TRUCK-AT ?auto_63785 ?auto_63787 ) ( IN-CITY ?auto_63787 ?auto_63786 ) ( not ( = ?auto_63782 ?auto_63787 ) ) ( not ( = ?auto_63788 ?auto_63787 ) ) )
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
      ?auto_64570 - LOCATION
      ?auto_64568 - CITY
      ?auto_64567 - OBJ
      ?auto_64566 - TRUCK
      ?auto_64569 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64570 ?auto_64568 ) ( IN-CITY ?auto_64564 ?auto_64568 ) ( not ( = ?auto_64564 ?auto_64570 ) ) ( not ( = ?auto_64567 ?auto_64565 ) ) ( OBJ-AT ?auto_64565 ?auto_64570 ) ( TRUCK-AT ?auto_64566 ?auto_64569 ) ( IN-CITY ?auto_64569 ?auto_64568 ) ( not ( = ?auto_64564 ?auto_64569 ) ) ( not ( = ?auto_64570 ?auto_64569 ) ) ( OBJ-AT ?auto_64567 ?auto_64569 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_64567 ?auto_64566 ?auto_64569 )
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
      ?auto_64577 - LOCATION
      ?auto_64574 - CITY
      ?auto_64576 - TRUCK
      ?auto_64575 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64577 ?auto_64574 ) ( IN-CITY ?auto_64571 ?auto_64574 ) ( not ( = ?auto_64571 ?auto_64577 ) ) ( not ( = ?auto_64572 ?auto_64573 ) ) ( OBJ-AT ?auto_64573 ?auto_64577 ) ( TRUCK-AT ?auto_64576 ?auto_64575 ) ( IN-CITY ?auto_64575 ?auto_64574 ) ( not ( = ?auto_64571 ?auto_64575 ) ) ( not ( = ?auto_64577 ?auto_64575 ) ) ( OBJ-AT ?auto_64572 ?auto_64575 ) )
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
      ?auto_64587 - LOCATION
      ?auto_64585 - CITY
      ?auto_64584 - TRUCK
      ?auto_64586 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64587 ?auto_64585 ) ( IN-CITY ?auto_64581 ?auto_64585 ) ( not ( = ?auto_64581 ?auto_64587 ) ) ( not ( = ?auto_64583 ?auto_64582 ) ) ( OBJ-AT ?auto_64582 ?auto_64587 ) ( TRUCK-AT ?auto_64584 ?auto_64586 ) ( IN-CITY ?auto_64586 ?auto_64585 ) ( not ( = ?auto_64581 ?auto_64586 ) ) ( not ( = ?auto_64587 ?auto_64586 ) ) ( OBJ-AT ?auto_64583 ?auto_64586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64583 ?auto_64582 ?auto_64581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70111 - OBJ
      ?auto_70112 - OBJ
      ?auto_70113 - OBJ
      ?auto_70110 - LOCATION
    )
    :vars
    (
      ?auto_70114 - TRUCK
      ?auto_70116 - LOCATION
      ?auto_70115 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_70114 ?auto_70116 ) ( IN-CITY ?auto_70116 ?auto_70115 ) ( IN-CITY ?auto_70110 ?auto_70115 ) ( not ( = ?auto_70110 ?auto_70116 ) ) ( OBJ-AT ?auto_70113 ?auto_70110 ) ( not ( = ?auto_70113 ?auto_70111 ) ) ( OBJ-AT ?auto_70111 ?auto_70116 ) ( OBJ-AT ?auto_70112 ?auto_70110 ) ( not ( = ?auto_70111 ?auto_70112 ) ) ( not ( = ?auto_70112 ?auto_70113 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70113 ?auto_70111 ?auto_70110 ) )
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
      ?auto_75121 - LOCATION
      ?auto_75123 - CITY
      ?auto_75120 - OBJ
      ?auto_75119 - TRUCK
      ?auto_75122 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75121 ?auto_75123 ) ( IN-CITY ?auto_75115 ?auto_75123 ) ( not ( = ?auto_75115 ?auto_75121 ) ) ( OBJ-AT ?auto_75120 ?auto_75115 ) ( not ( = ?auto_75120 ?auto_75118 ) ) ( OBJ-AT ?auto_75118 ?auto_75121 ) ( TRUCK-AT ?auto_75119 ?auto_75122 ) ( IN-CITY ?auto_75122 ?auto_75123 ) ( not ( = ?auto_75115 ?auto_75122 ) ) ( not ( = ?auto_75121 ?auto_75122 ) ) ( OBJ-AT ?auto_75116 ?auto_75115 ) ( OBJ-AT ?auto_75117 ?auto_75115 ) ( not ( = ?auto_75116 ?auto_75117 ) ) ( not ( = ?auto_75116 ?auto_75118 ) ) ( not ( = ?auto_75116 ?auto_75120 ) ) ( not ( = ?auto_75117 ?auto_75118 ) ) ( not ( = ?auto_75117 ?auto_75120 ) ) )
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
      ?auto_75143 - LOCATION
      ?auto_75145 - CITY
      ?auto_75142 - OBJ
      ?auto_75141 - TRUCK
      ?auto_75144 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75143 ?auto_75145 ) ( IN-CITY ?auto_75137 ?auto_75145 ) ( not ( = ?auto_75137 ?auto_75143 ) ) ( OBJ-AT ?auto_75142 ?auto_75137 ) ( not ( = ?auto_75142 ?auto_75139 ) ) ( OBJ-AT ?auto_75139 ?auto_75143 ) ( TRUCK-AT ?auto_75141 ?auto_75144 ) ( IN-CITY ?auto_75144 ?auto_75145 ) ( not ( = ?auto_75137 ?auto_75144 ) ) ( not ( = ?auto_75143 ?auto_75144 ) ) ( OBJ-AT ?auto_75138 ?auto_75137 ) ( OBJ-AT ?auto_75140 ?auto_75137 ) ( not ( = ?auto_75138 ?auto_75139 ) ) ( not ( = ?auto_75138 ?auto_75140 ) ) ( not ( = ?auto_75138 ?auto_75142 ) ) ( not ( = ?auto_75139 ?auto_75140 ) ) ( not ( = ?auto_75140 ?auto_75142 ) ) )
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
      ?auto_75263 - LOCATION
      ?auto_75265 - CITY
      ?auto_75262 - OBJ
      ?auto_75261 - TRUCK
      ?auto_75264 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75263 ?auto_75265 ) ( IN-CITY ?auto_75257 ?auto_75265 ) ( not ( = ?auto_75257 ?auto_75263 ) ) ( OBJ-AT ?auto_75262 ?auto_75257 ) ( not ( = ?auto_75262 ?auto_75258 ) ) ( OBJ-AT ?auto_75258 ?auto_75263 ) ( TRUCK-AT ?auto_75261 ?auto_75264 ) ( IN-CITY ?auto_75264 ?auto_75265 ) ( not ( = ?auto_75257 ?auto_75264 ) ) ( not ( = ?auto_75263 ?auto_75264 ) ) ( OBJ-AT ?auto_75259 ?auto_75257 ) ( OBJ-AT ?auto_75260 ?auto_75257 ) ( not ( = ?auto_75258 ?auto_75259 ) ) ( not ( = ?auto_75258 ?auto_75260 ) ) ( not ( = ?auto_75259 ?auto_75260 ) ) ( not ( = ?auto_75259 ?auto_75262 ) ) ( not ( = ?auto_75260 ?auto_75262 ) ) )
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
      ?auto_75360 - LOCATION
      ?auto_75362 - CITY
      ?auto_75359 - TRUCK
      ?auto_75361 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75360 ?auto_75362 ) ( IN-CITY ?auto_75354 ?auto_75362 ) ( not ( = ?auto_75354 ?auto_75360 ) ) ( OBJ-AT ?auto_75357 ?auto_75354 ) ( not ( = ?auto_75357 ?auto_75358 ) ) ( OBJ-AT ?auto_75358 ?auto_75360 ) ( TRUCK-AT ?auto_75359 ?auto_75361 ) ( IN-CITY ?auto_75361 ?auto_75362 ) ( not ( = ?auto_75354 ?auto_75361 ) ) ( not ( = ?auto_75360 ?auto_75361 ) ) ( OBJ-AT ?auto_75355 ?auto_75354 ) ( OBJ-AT ?auto_75356 ?auto_75354 ) ( not ( = ?auto_75355 ?auto_75356 ) ) ( not ( = ?auto_75355 ?auto_75357 ) ) ( not ( = ?auto_75355 ?auto_75358 ) ) ( not ( = ?auto_75356 ?auto_75357 ) ) ( not ( = ?auto_75356 ?auto_75358 ) ) )
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
      ?auto_75396 - LOCATION
      ?auto_75398 - CITY
      ?auto_75395 - TRUCK
      ?auto_75397 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75396 ?auto_75398 ) ( IN-CITY ?auto_75390 ?auto_75398 ) ( not ( = ?auto_75390 ?auto_75396 ) ) ( OBJ-AT ?auto_75392 ?auto_75390 ) ( not ( = ?auto_75392 ?auto_75393 ) ) ( OBJ-AT ?auto_75393 ?auto_75396 ) ( TRUCK-AT ?auto_75395 ?auto_75397 ) ( IN-CITY ?auto_75397 ?auto_75398 ) ( not ( = ?auto_75390 ?auto_75397 ) ) ( not ( = ?auto_75396 ?auto_75397 ) ) ( OBJ-AT ?auto_75391 ?auto_75390 ) ( OBJ-AT ?auto_75394 ?auto_75390 ) ( not ( = ?auto_75391 ?auto_75392 ) ) ( not ( = ?auto_75391 ?auto_75393 ) ) ( not ( = ?auto_75391 ?auto_75394 ) ) ( not ( = ?auto_75392 ?auto_75394 ) ) ( not ( = ?auto_75393 ?auto_75394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75392 ?auto_75393 ?auto_75390 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75454 - OBJ
      ?auto_75455 - OBJ
      ?auto_75456 - OBJ
      ?auto_75457 - OBJ
      ?auto_75453 - LOCATION
    )
    :vars
    (
      ?auto_75459 - LOCATION
      ?auto_75461 - CITY
      ?auto_75458 - TRUCK
      ?auto_75460 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75459 ?auto_75461 ) ( IN-CITY ?auto_75453 ?auto_75461 ) ( not ( = ?auto_75453 ?auto_75459 ) ) ( OBJ-AT ?auto_75454 ?auto_75453 ) ( not ( = ?auto_75454 ?auto_75456 ) ) ( OBJ-AT ?auto_75456 ?auto_75459 ) ( TRUCK-AT ?auto_75458 ?auto_75460 ) ( IN-CITY ?auto_75460 ?auto_75461 ) ( not ( = ?auto_75453 ?auto_75460 ) ) ( not ( = ?auto_75459 ?auto_75460 ) ) ( OBJ-AT ?auto_75455 ?auto_75453 ) ( OBJ-AT ?auto_75457 ?auto_75453 ) ( not ( = ?auto_75454 ?auto_75455 ) ) ( not ( = ?auto_75454 ?auto_75457 ) ) ( not ( = ?auto_75455 ?auto_75456 ) ) ( not ( = ?auto_75455 ?auto_75457 ) ) ( not ( = ?auto_75456 ?auto_75457 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75454 ?auto_75456 ?auto_75453 ) )
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
      ?auto_75585 - LOCATION
      ?auto_75587 - CITY
      ?auto_75584 - TRUCK
      ?auto_75586 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75585 ?auto_75587 ) ( IN-CITY ?auto_75579 ?auto_75587 ) ( not ( = ?auto_75579 ?auto_75585 ) ) ( OBJ-AT ?auto_75583 ?auto_75579 ) ( not ( = ?auto_75583 ?auto_75581 ) ) ( OBJ-AT ?auto_75581 ?auto_75585 ) ( TRUCK-AT ?auto_75584 ?auto_75586 ) ( IN-CITY ?auto_75586 ?auto_75587 ) ( not ( = ?auto_75579 ?auto_75586 ) ) ( not ( = ?auto_75585 ?auto_75586 ) ) ( OBJ-AT ?auto_75580 ?auto_75579 ) ( OBJ-AT ?auto_75582 ?auto_75579 ) ( not ( = ?auto_75580 ?auto_75581 ) ) ( not ( = ?auto_75580 ?auto_75582 ) ) ( not ( = ?auto_75580 ?auto_75583 ) ) ( not ( = ?auto_75581 ?auto_75582 ) ) ( not ( = ?auto_75582 ?auto_75583 ) ) )
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
      ?auto_75702 - LOCATION
      ?auto_75704 - CITY
      ?auto_75701 - TRUCK
      ?auto_75703 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75702 ?auto_75704 ) ( IN-CITY ?auto_75696 ?auto_75704 ) ( not ( = ?auto_75696 ?auto_75702 ) ) ( OBJ-AT ?auto_75698 ?auto_75696 ) ( not ( = ?auto_75698 ?auto_75700 ) ) ( OBJ-AT ?auto_75700 ?auto_75702 ) ( TRUCK-AT ?auto_75701 ?auto_75703 ) ( IN-CITY ?auto_75703 ?auto_75704 ) ( not ( = ?auto_75696 ?auto_75703 ) ) ( not ( = ?auto_75702 ?auto_75703 ) ) ( OBJ-AT ?auto_75697 ?auto_75696 ) ( OBJ-AT ?auto_75699 ?auto_75696 ) ( not ( = ?auto_75697 ?auto_75698 ) ) ( not ( = ?auto_75697 ?auto_75699 ) ) ( not ( = ?auto_75697 ?auto_75700 ) ) ( not ( = ?auto_75698 ?auto_75699 ) ) ( not ( = ?auto_75699 ?auto_75700 ) ) )
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
      ?auto_75766 - LOCATION
      ?auto_75768 - CITY
      ?auto_75765 - OBJ
      ?auto_75764 - TRUCK
      ?auto_75767 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75766 ?auto_75768 ) ( IN-CITY ?auto_75759 ?auto_75768 ) ( not ( = ?auto_75759 ?auto_75766 ) ) ( OBJ-AT ?auto_75765 ?auto_75759 ) ( not ( = ?auto_75765 ?auto_75763 ) ) ( OBJ-AT ?auto_75763 ?auto_75766 ) ( TRUCK-AT ?auto_75764 ?auto_75767 ) ( IN-CITY ?auto_75767 ?auto_75768 ) ( not ( = ?auto_75759 ?auto_75767 ) ) ( not ( = ?auto_75766 ?auto_75767 ) ) ( OBJ-AT ?auto_75760 ?auto_75759 ) ( OBJ-AT ?auto_75761 ?auto_75759 ) ( OBJ-AT ?auto_75762 ?auto_75759 ) ( not ( = ?auto_75760 ?auto_75761 ) ) ( not ( = ?auto_75760 ?auto_75762 ) ) ( not ( = ?auto_75760 ?auto_75763 ) ) ( not ( = ?auto_75760 ?auto_75765 ) ) ( not ( = ?auto_75761 ?auto_75762 ) ) ( not ( = ?auto_75761 ?auto_75763 ) ) ( not ( = ?auto_75761 ?auto_75765 ) ) ( not ( = ?auto_75762 ?auto_75763 ) ) ( not ( = ?auto_75762 ?auto_75765 ) ) )
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
      ?auto_75795 - LOCATION
      ?auto_75797 - CITY
      ?auto_75794 - OBJ
      ?auto_75793 - TRUCK
      ?auto_75796 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75795 ?auto_75797 ) ( IN-CITY ?auto_75788 ?auto_75797 ) ( not ( = ?auto_75788 ?auto_75795 ) ) ( OBJ-AT ?auto_75794 ?auto_75788 ) ( not ( = ?auto_75794 ?auto_75791 ) ) ( OBJ-AT ?auto_75791 ?auto_75795 ) ( TRUCK-AT ?auto_75793 ?auto_75796 ) ( IN-CITY ?auto_75796 ?auto_75797 ) ( not ( = ?auto_75788 ?auto_75796 ) ) ( not ( = ?auto_75795 ?auto_75796 ) ) ( OBJ-AT ?auto_75789 ?auto_75788 ) ( OBJ-AT ?auto_75790 ?auto_75788 ) ( OBJ-AT ?auto_75792 ?auto_75788 ) ( not ( = ?auto_75789 ?auto_75790 ) ) ( not ( = ?auto_75789 ?auto_75791 ) ) ( not ( = ?auto_75789 ?auto_75792 ) ) ( not ( = ?auto_75789 ?auto_75794 ) ) ( not ( = ?auto_75790 ?auto_75791 ) ) ( not ( = ?auto_75790 ?auto_75792 ) ) ( not ( = ?auto_75790 ?auto_75794 ) ) ( not ( = ?auto_75791 ?auto_75792 ) ) ( not ( = ?auto_75792 ?auto_75794 ) ) )
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
      ?auto_75938 - LOCATION
      ?auto_75940 - CITY
      ?auto_75937 - OBJ
      ?auto_75936 - TRUCK
      ?auto_75939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75938 ?auto_75940 ) ( IN-CITY ?auto_75931 ?auto_75940 ) ( not ( = ?auto_75931 ?auto_75938 ) ) ( OBJ-AT ?auto_75937 ?auto_75931 ) ( not ( = ?auto_75937 ?auto_75933 ) ) ( OBJ-AT ?auto_75933 ?auto_75938 ) ( TRUCK-AT ?auto_75936 ?auto_75939 ) ( IN-CITY ?auto_75939 ?auto_75940 ) ( not ( = ?auto_75931 ?auto_75939 ) ) ( not ( = ?auto_75938 ?auto_75939 ) ) ( OBJ-AT ?auto_75932 ?auto_75931 ) ( OBJ-AT ?auto_75934 ?auto_75931 ) ( OBJ-AT ?auto_75935 ?auto_75931 ) ( not ( = ?auto_75932 ?auto_75933 ) ) ( not ( = ?auto_75932 ?auto_75934 ) ) ( not ( = ?auto_75932 ?auto_75935 ) ) ( not ( = ?auto_75932 ?auto_75937 ) ) ( not ( = ?auto_75933 ?auto_75934 ) ) ( not ( = ?auto_75933 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75937 ) ) ( not ( = ?auto_75935 ?auto_75937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75937 ?auto_75933 ?auto_75931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76428 - OBJ
      ?auto_76429 - OBJ
      ?auto_76430 - OBJ
      ?auto_76431 - OBJ
      ?auto_76427 - LOCATION
    )
    :vars
    (
      ?auto_76433 - LOCATION
      ?auto_76435 - CITY
      ?auto_76432 - TRUCK
      ?auto_76434 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76433 ?auto_76435 ) ( IN-CITY ?auto_76427 ?auto_76435 ) ( not ( = ?auto_76427 ?auto_76433 ) ) ( OBJ-AT ?auto_76431 ?auto_76427 ) ( not ( = ?auto_76431 ?auto_76428 ) ) ( OBJ-AT ?auto_76428 ?auto_76433 ) ( TRUCK-AT ?auto_76432 ?auto_76434 ) ( IN-CITY ?auto_76434 ?auto_76435 ) ( not ( = ?auto_76427 ?auto_76434 ) ) ( not ( = ?auto_76433 ?auto_76434 ) ) ( OBJ-AT ?auto_76429 ?auto_76427 ) ( OBJ-AT ?auto_76430 ?auto_76427 ) ( not ( = ?auto_76428 ?auto_76429 ) ) ( not ( = ?auto_76428 ?auto_76430 ) ) ( not ( = ?auto_76429 ?auto_76430 ) ) ( not ( = ?auto_76429 ?auto_76431 ) ) ( not ( = ?auto_76430 ?auto_76431 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76431 ?auto_76428 ?auto_76427 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76437 - OBJ
      ?auto_76438 - OBJ
      ?auto_76439 - OBJ
      ?auto_76440 - OBJ
      ?auto_76436 - LOCATION
    )
    :vars
    (
      ?auto_76442 - LOCATION
      ?auto_76444 - CITY
      ?auto_76441 - TRUCK
      ?auto_76443 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76442 ?auto_76444 ) ( IN-CITY ?auto_76436 ?auto_76444 ) ( not ( = ?auto_76436 ?auto_76442 ) ) ( OBJ-AT ?auto_76438 ?auto_76436 ) ( not ( = ?auto_76438 ?auto_76437 ) ) ( OBJ-AT ?auto_76437 ?auto_76442 ) ( TRUCK-AT ?auto_76441 ?auto_76443 ) ( IN-CITY ?auto_76443 ?auto_76444 ) ( not ( = ?auto_76436 ?auto_76443 ) ) ( not ( = ?auto_76442 ?auto_76443 ) ) ( OBJ-AT ?auto_76439 ?auto_76436 ) ( OBJ-AT ?auto_76440 ?auto_76436 ) ( not ( = ?auto_76437 ?auto_76439 ) ) ( not ( = ?auto_76437 ?auto_76440 ) ) ( not ( = ?auto_76438 ?auto_76439 ) ) ( not ( = ?auto_76438 ?auto_76440 ) ) ( not ( = ?auto_76439 ?auto_76440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76438 ?auto_76437 ?auto_76436 ) )
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
      ?auto_76587 - LOCATION
      ?auto_76589 - CITY
      ?auto_76586 - OBJ
      ?auto_76585 - TRUCK
      ?auto_76588 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76587 ?auto_76589 ) ( IN-CITY ?auto_76580 ?auto_76589 ) ( not ( = ?auto_76580 ?auto_76587 ) ) ( OBJ-AT ?auto_76586 ?auto_76580 ) ( not ( = ?auto_76586 ?auto_76581 ) ) ( OBJ-AT ?auto_76581 ?auto_76587 ) ( TRUCK-AT ?auto_76585 ?auto_76588 ) ( IN-CITY ?auto_76588 ?auto_76589 ) ( not ( = ?auto_76580 ?auto_76588 ) ) ( not ( = ?auto_76587 ?auto_76588 ) ) ( OBJ-AT ?auto_76582 ?auto_76580 ) ( OBJ-AT ?auto_76583 ?auto_76580 ) ( OBJ-AT ?auto_76584 ?auto_76580 ) ( not ( = ?auto_76581 ?auto_76582 ) ) ( not ( = ?auto_76581 ?auto_76583 ) ) ( not ( = ?auto_76581 ?auto_76584 ) ) ( not ( = ?auto_76582 ?auto_76583 ) ) ( not ( = ?auto_76582 ?auto_76584 ) ) ( not ( = ?auto_76582 ?auto_76586 ) ) ( not ( = ?auto_76583 ?auto_76584 ) ) ( not ( = ?auto_76583 ?auto_76586 ) ) ( not ( = ?auto_76584 ?auto_76586 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76586 ?auto_76581 ?auto_76580 ) )
  )

)

