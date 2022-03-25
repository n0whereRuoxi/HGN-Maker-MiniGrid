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
      ?auto_175375 - OBJ
      ?auto_175374 - LOCATION
    )
    :vars
    (
      ?auto_175376 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175376 ?auto_175374 ) ( IN-TRUCK ?auto_175375 ?auto_175376 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_175375 ?auto_175376 ?auto_175374 )
      ( DELIVER-1PKG-VERIFY ?auto_175375 ?auto_175374 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175393 - OBJ
      ?auto_175392 - LOCATION
    )
    :vars
    (
      ?auto_175394 - TRUCK
      ?auto_175395 - LOCATION
      ?auto_175396 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175393 ?auto_175394 ) ( TRUCK-AT ?auto_175394 ?auto_175395 ) ( IN-CITY ?auto_175395 ?auto_175396 ) ( IN-CITY ?auto_175392 ?auto_175396 ) ( not ( = ?auto_175392 ?auto_175395 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175394 ?auto_175395 ?auto_175392 ?auto_175396 )
      ( DELIVER-1PKG ?auto_175393 ?auto_175392 )
      ( DELIVER-1PKG-VERIFY ?auto_175393 ?auto_175392 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175419 - OBJ
      ?auto_175418 - LOCATION
    )
    :vars
    (
      ?auto_175421 - TRUCK
      ?auto_175420 - LOCATION
      ?auto_175422 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175421 ?auto_175420 ) ( IN-CITY ?auto_175420 ?auto_175422 ) ( IN-CITY ?auto_175418 ?auto_175422 ) ( not ( = ?auto_175418 ?auto_175420 ) ) ( OBJ-AT ?auto_175419 ?auto_175420 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_175419 ?auto_175421 ?auto_175420 )
      ( DELIVER-1PKG ?auto_175419 ?auto_175418 )
      ( DELIVER-1PKG-VERIFY ?auto_175419 ?auto_175418 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175445 - OBJ
      ?auto_175444 - LOCATION
    )
    :vars
    (
      ?auto_175448 - LOCATION
      ?auto_175446 - CITY
      ?auto_175447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175448 ?auto_175446 ) ( IN-CITY ?auto_175444 ?auto_175446 ) ( not ( = ?auto_175444 ?auto_175448 ) ) ( OBJ-AT ?auto_175445 ?auto_175448 ) ( TRUCK-AT ?auto_175447 ?auto_175444 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_175447 ?auto_175444 ?auto_175448 ?auto_175446 )
      ( DELIVER-1PKG ?auto_175445 ?auto_175444 )
      ( DELIVER-1PKG-VERIFY ?auto_175445 ?auto_175444 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175588 - OBJ
      ?auto_175589 - OBJ
      ?auto_175587 - LOCATION
    )
    :vars
    (
      ?auto_175590 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175590 ?auto_175587 ) ( IN-TRUCK ?auto_175589 ?auto_175590 ) ( OBJ-AT ?auto_175588 ?auto_175587 ) ( not ( = ?auto_175588 ?auto_175589 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175589 ?auto_175587 )
      ( DELIVER-2PKG-VERIFY ?auto_175588 ?auto_175589 ?auto_175587 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175592 - OBJ
      ?auto_175593 - OBJ
      ?auto_175591 - LOCATION
    )
    :vars
    (
      ?auto_175594 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175594 ?auto_175591 ) ( IN-TRUCK ?auto_175592 ?auto_175594 ) ( OBJ-AT ?auto_175593 ?auto_175591 ) ( not ( = ?auto_175592 ?auto_175593 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175592 ?auto_175591 )
      ( DELIVER-2PKG-VERIFY ?auto_175592 ?auto_175593 ?auto_175591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175600 - OBJ
      ?auto_175601 - OBJ
      ?auto_175602 - OBJ
      ?auto_175599 - LOCATION
    )
    :vars
    (
      ?auto_175603 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175603 ?auto_175599 ) ( IN-TRUCK ?auto_175602 ?auto_175603 ) ( OBJ-AT ?auto_175600 ?auto_175599 ) ( OBJ-AT ?auto_175601 ?auto_175599 ) ( not ( = ?auto_175600 ?auto_175601 ) ) ( not ( = ?auto_175600 ?auto_175602 ) ) ( not ( = ?auto_175601 ?auto_175602 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175602 ?auto_175599 )
      ( DELIVER-3PKG-VERIFY ?auto_175600 ?auto_175601 ?auto_175602 ?auto_175599 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175605 - OBJ
      ?auto_175606 - OBJ
      ?auto_175607 - OBJ
      ?auto_175604 - LOCATION
    )
    :vars
    (
      ?auto_175608 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175608 ?auto_175604 ) ( IN-TRUCK ?auto_175606 ?auto_175608 ) ( OBJ-AT ?auto_175605 ?auto_175604 ) ( OBJ-AT ?auto_175607 ?auto_175604 ) ( not ( = ?auto_175605 ?auto_175606 ) ) ( not ( = ?auto_175605 ?auto_175607 ) ) ( not ( = ?auto_175606 ?auto_175607 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175606 ?auto_175604 )
      ( DELIVER-3PKG-VERIFY ?auto_175605 ?auto_175606 ?auto_175607 ?auto_175604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175615 - OBJ
      ?auto_175616 - OBJ
      ?auto_175617 - OBJ
      ?auto_175614 - LOCATION
    )
    :vars
    (
      ?auto_175618 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175618 ?auto_175614 ) ( IN-TRUCK ?auto_175615 ?auto_175618 ) ( OBJ-AT ?auto_175616 ?auto_175614 ) ( OBJ-AT ?auto_175617 ?auto_175614 ) ( not ( = ?auto_175615 ?auto_175616 ) ) ( not ( = ?auto_175615 ?auto_175617 ) ) ( not ( = ?auto_175616 ?auto_175617 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175615 ?auto_175614 )
      ( DELIVER-3PKG-VERIFY ?auto_175615 ?auto_175616 ?auto_175617 ?auto_175614 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175635 - OBJ
      ?auto_175636 - OBJ
      ?auto_175637 - OBJ
      ?auto_175638 - OBJ
      ?auto_175634 - LOCATION
    )
    :vars
    (
      ?auto_175639 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175639 ?auto_175634 ) ( IN-TRUCK ?auto_175638 ?auto_175639 ) ( OBJ-AT ?auto_175635 ?auto_175634 ) ( OBJ-AT ?auto_175636 ?auto_175634 ) ( OBJ-AT ?auto_175637 ?auto_175634 ) ( not ( = ?auto_175635 ?auto_175636 ) ) ( not ( = ?auto_175635 ?auto_175637 ) ) ( not ( = ?auto_175635 ?auto_175638 ) ) ( not ( = ?auto_175636 ?auto_175637 ) ) ( not ( = ?auto_175636 ?auto_175638 ) ) ( not ( = ?auto_175637 ?auto_175638 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175638 ?auto_175634 )
      ( DELIVER-4PKG-VERIFY ?auto_175635 ?auto_175636 ?auto_175637 ?auto_175638 ?auto_175634 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175641 - OBJ
      ?auto_175642 - OBJ
      ?auto_175643 - OBJ
      ?auto_175644 - OBJ
      ?auto_175640 - LOCATION
    )
    :vars
    (
      ?auto_175645 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175645 ?auto_175640 ) ( IN-TRUCK ?auto_175643 ?auto_175645 ) ( OBJ-AT ?auto_175641 ?auto_175640 ) ( OBJ-AT ?auto_175642 ?auto_175640 ) ( OBJ-AT ?auto_175644 ?auto_175640 ) ( not ( = ?auto_175641 ?auto_175642 ) ) ( not ( = ?auto_175641 ?auto_175643 ) ) ( not ( = ?auto_175641 ?auto_175644 ) ) ( not ( = ?auto_175642 ?auto_175643 ) ) ( not ( = ?auto_175642 ?auto_175644 ) ) ( not ( = ?auto_175643 ?auto_175644 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175643 ?auto_175640 )
      ( DELIVER-4PKG-VERIFY ?auto_175641 ?auto_175642 ?auto_175643 ?auto_175644 ?auto_175640 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175653 - OBJ
      ?auto_175654 - OBJ
      ?auto_175655 - OBJ
      ?auto_175656 - OBJ
      ?auto_175652 - LOCATION
    )
    :vars
    (
      ?auto_175657 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175657 ?auto_175652 ) ( IN-TRUCK ?auto_175654 ?auto_175657 ) ( OBJ-AT ?auto_175653 ?auto_175652 ) ( OBJ-AT ?auto_175655 ?auto_175652 ) ( OBJ-AT ?auto_175656 ?auto_175652 ) ( not ( = ?auto_175653 ?auto_175654 ) ) ( not ( = ?auto_175653 ?auto_175655 ) ) ( not ( = ?auto_175653 ?auto_175656 ) ) ( not ( = ?auto_175654 ?auto_175655 ) ) ( not ( = ?auto_175654 ?auto_175656 ) ) ( not ( = ?auto_175655 ?auto_175656 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175654 ?auto_175652 )
      ( DELIVER-4PKG-VERIFY ?auto_175653 ?auto_175654 ?auto_175655 ?auto_175656 ?auto_175652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175677 - OBJ
      ?auto_175678 - OBJ
      ?auto_175679 - OBJ
      ?auto_175680 - OBJ
      ?auto_175676 - LOCATION
    )
    :vars
    (
      ?auto_175681 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175681 ?auto_175676 ) ( IN-TRUCK ?auto_175677 ?auto_175681 ) ( OBJ-AT ?auto_175678 ?auto_175676 ) ( OBJ-AT ?auto_175679 ?auto_175676 ) ( OBJ-AT ?auto_175680 ?auto_175676 ) ( not ( = ?auto_175677 ?auto_175678 ) ) ( not ( = ?auto_175677 ?auto_175679 ) ) ( not ( = ?auto_175677 ?auto_175680 ) ) ( not ( = ?auto_175678 ?auto_175679 ) ) ( not ( = ?auto_175678 ?auto_175680 ) ) ( not ( = ?auto_175679 ?auto_175680 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175677 ?auto_175676 )
      ( DELIVER-4PKG-VERIFY ?auto_175677 ?auto_175678 ?auto_175679 ?auto_175680 ?auto_175676 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175730 - OBJ
      ?auto_175731 - OBJ
      ?auto_175729 - LOCATION
    )
    :vars
    (
      ?auto_175732 - TRUCK
      ?auto_175733 - LOCATION
      ?auto_175734 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175731 ?auto_175732 ) ( TRUCK-AT ?auto_175732 ?auto_175733 ) ( IN-CITY ?auto_175733 ?auto_175734 ) ( IN-CITY ?auto_175729 ?auto_175734 ) ( not ( = ?auto_175729 ?auto_175733 ) ) ( OBJ-AT ?auto_175730 ?auto_175729 ) ( not ( = ?auto_175730 ?auto_175731 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175731 ?auto_175729 )
      ( DELIVER-2PKG-VERIFY ?auto_175730 ?auto_175731 ?auto_175729 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175736 - OBJ
      ?auto_175737 - OBJ
      ?auto_175735 - LOCATION
    )
    :vars
    (
      ?auto_175738 - TRUCK
      ?auto_175739 - LOCATION
      ?auto_175740 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175736 ?auto_175738 ) ( TRUCK-AT ?auto_175738 ?auto_175739 ) ( IN-CITY ?auto_175739 ?auto_175740 ) ( IN-CITY ?auto_175735 ?auto_175740 ) ( not ( = ?auto_175735 ?auto_175739 ) ) ( OBJ-AT ?auto_175737 ?auto_175735 ) ( not ( = ?auto_175737 ?auto_175736 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175737 ?auto_175736 ?auto_175735 )
      ( DELIVER-2PKG-VERIFY ?auto_175736 ?auto_175737 ?auto_175735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175749 - OBJ
      ?auto_175750 - OBJ
      ?auto_175751 - OBJ
      ?auto_175748 - LOCATION
    )
    :vars
    (
      ?auto_175752 - TRUCK
      ?auto_175753 - LOCATION
      ?auto_175754 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175751 ?auto_175752 ) ( TRUCK-AT ?auto_175752 ?auto_175753 ) ( IN-CITY ?auto_175753 ?auto_175754 ) ( IN-CITY ?auto_175748 ?auto_175754 ) ( not ( = ?auto_175748 ?auto_175753 ) ) ( OBJ-AT ?auto_175750 ?auto_175748 ) ( not ( = ?auto_175750 ?auto_175751 ) ) ( OBJ-AT ?auto_175749 ?auto_175748 ) ( not ( = ?auto_175749 ?auto_175750 ) ) ( not ( = ?auto_175749 ?auto_175751 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175750 ?auto_175751 ?auto_175748 )
      ( DELIVER-3PKG-VERIFY ?auto_175749 ?auto_175750 ?auto_175751 ?auto_175748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175756 - OBJ
      ?auto_175757 - OBJ
      ?auto_175758 - OBJ
      ?auto_175755 - LOCATION
    )
    :vars
    (
      ?auto_175759 - TRUCK
      ?auto_175760 - LOCATION
      ?auto_175761 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175757 ?auto_175759 ) ( TRUCK-AT ?auto_175759 ?auto_175760 ) ( IN-CITY ?auto_175760 ?auto_175761 ) ( IN-CITY ?auto_175755 ?auto_175761 ) ( not ( = ?auto_175755 ?auto_175760 ) ) ( OBJ-AT ?auto_175758 ?auto_175755 ) ( not ( = ?auto_175758 ?auto_175757 ) ) ( OBJ-AT ?auto_175756 ?auto_175755 ) ( not ( = ?auto_175756 ?auto_175757 ) ) ( not ( = ?auto_175756 ?auto_175758 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175758 ?auto_175757 ?auto_175755 )
      ( DELIVER-3PKG-VERIFY ?auto_175756 ?auto_175757 ?auto_175758 ?auto_175755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175770 - OBJ
      ?auto_175771 - OBJ
      ?auto_175772 - OBJ
      ?auto_175769 - LOCATION
    )
    :vars
    (
      ?auto_175773 - TRUCK
      ?auto_175774 - LOCATION
      ?auto_175775 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175770 ?auto_175773 ) ( TRUCK-AT ?auto_175773 ?auto_175774 ) ( IN-CITY ?auto_175774 ?auto_175775 ) ( IN-CITY ?auto_175769 ?auto_175775 ) ( not ( = ?auto_175769 ?auto_175774 ) ) ( OBJ-AT ?auto_175771 ?auto_175769 ) ( not ( = ?auto_175771 ?auto_175770 ) ) ( OBJ-AT ?auto_175772 ?auto_175769 ) ( not ( = ?auto_175770 ?auto_175772 ) ) ( not ( = ?auto_175771 ?auto_175772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175771 ?auto_175770 ?auto_175769 )
      ( DELIVER-3PKG-VERIFY ?auto_175770 ?auto_175771 ?auto_175772 ?auto_175769 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175799 - OBJ
      ?auto_175800 - OBJ
      ?auto_175801 - OBJ
      ?auto_175802 - OBJ
      ?auto_175798 - LOCATION
    )
    :vars
    (
      ?auto_175803 - TRUCK
      ?auto_175804 - LOCATION
      ?auto_175805 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175802 ?auto_175803 ) ( TRUCK-AT ?auto_175803 ?auto_175804 ) ( IN-CITY ?auto_175804 ?auto_175805 ) ( IN-CITY ?auto_175798 ?auto_175805 ) ( not ( = ?auto_175798 ?auto_175804 ) ) ( OBJ-AT ?auto_175801 ?auto_175798 ) ( not ( = ?auto_175801 ?auto_175802 ) ) ( OBJ-AT ?auto_175799 ?auto_175798 ) ( OBJ-AT ?auto_175800 ?auto_175798 ) ( not ( = ?auto_175799 ?auto_175800 ) ) ( not ( = ?auto_175799 ?auto_175801 ) ) ( not ( = ?auto_175799 ?auto_175802 ) ) ( not ( = ?auto_175800 ?auto_175801 ) ) ( not ( = ?auto_175800 ?auto_175802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175801 ?auto_175802 ?auto_175798 )
      ( DELIVER-4PKG-VERIFY ?auto_175799 ?auto_175800 ?auto_175801 ?auto_175802 ?auto_175798 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175807 - OBJ
      ?auto_175808 - OBJ
      ?auto_175809 - OBJ
      ?auto_175810 - OBJ
      ?auto_175806 - LOCATION
    )
    :vars
    (
      ?auto_175811 - TRUCK
      ?auto_175812 - LOCATION
      ?auto_175813 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175809 ?auto_175811 ) ( TRUCK-AT ?auto_175811 ?auto_175812 ) ( IN-CITY ?auto_175812 ?auto_175813 ) ( IN-CITY ?auto_175806 ?auto_175813 ) ( not ( = ?auto_175806 ?auto_175812 ) ) ( OBJ-AT ?auto_175808 ?auto_175806 ) ( not ( = ?auto_175808 ?auto_175809 ) ) ( OBJ-AT ?auto_175807 ?auto_175806 ) ( OBJ-AT ?auto_175810 ?auto_175806 ) ( not ( = ?auto_175807 ?auto_175808 ) ) ( not ( = ?auto_175807 ?auto_175809 ) ) ( not ( = ?auto_175807 ?auto_175810 ) ) ( not ( = ?auto_175808 ?auto_175810 ) ) ( not ( = ?auto_175809 ?auto_175810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175808 ?auto_175809 ?auto_175806 )
      ( DELIVER-4PKG-VERIFY ?auto_175807 ?auto_175808 ?auto_175809 ?auto_175810 ?auto_175806 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175823 - OBJ
      ?auto_175824 - OBJ
      ?auto_175825 - OBJ
      ?auto_175826 - OBJ
      ?auto_175822 - LOCATION
    )
    :vars
    (
      ?auto_175827 - TRUCK
      ?auto_175828 - LOCATION
      ?auto_175829 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175824 ?auto_175827 ) ( TRUCK-AT ?auto_175827 ?auto_175828 ) ( IN-CITY ?auto_175828 ?auto_175829 ) ( IN-CITY ?auto_175822 ?auto_175829 ) ( not ( = ?auto_175822 ?auto_175828 ) ) ( OBJ-AT ?auto_175823 ?auto_175822 ) ( not ( = ?auto_175823 ?auto_175824 ) ) ( OBJ-AT ?auto_175825 ?auto_175822 ) ( OBJ-AT ?auto_175826 ?auto_175822 ) ( not ( = ?auto_175823 ?auto_175825 ) ) ( not ( = ?auto_175823 ?auto_175826 ) ) ( not ( = ?auto_175824 ?auto_175825 ) ) ( not ( = ?auto_175824 ?auto_175826 ) ) ( not ( = ?auto_175825 ?auto_175826 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175823 ?auto_175824 ?auto_175822 )
      ( DELIVER-4PKG-VERIFY ?auto_175823 ?auto_175824 ?auto_175825 ?auto_175826 ?auto_175822 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175855 - OBJ
      ?auto_175856 - OBJ
      ?auto_175857 - OBJ
      ?auto_175858 - OBJ
      ?auto_175854 - LOCATION
    )
    :vars
    (
      ?auto_175859 - TRUCK
      ?auto_175860 - LOCATION
      ?auto_175861 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_175855 ?auto_175859 ) ( TRUCK-AT ?auto_175859 ?auto_175860 ) ( IN-CITY ?auto_175860 ?auto_175861 ) ( IN-CITY ?auto_175854 ?auto_175861 ) ( not ( = ?auto_175854 ?auto_175860 ) ) ( OBJ-AT ?auto_175857 ?auto_175854 ) ( not ( = ?auto_175857 ?auto_175855 ) ) ( OBJ-AT ?auto_175856 ?auto_175854 ) ( OBJ-AT ?auto_175858 ?auto_175854 ) ( not ( = ?auto_175855 ?auto_175856 ) ) ( not ( = ?auto_175855 ?auto_175858 ) ) ( not ( = ?auto_175856 ?auto_175857 ) ) ( not ( = ?auto_175856 ?auto_175858 ) ) ( not ( = ?auto_175857 ?auto_175858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175857 ?auto_175855 ?auto_175854 )
      ( DELIVER-4PKG-VERIFY ?auto_175855 ?auto_175856 ?auto_175857 ?auto_175858 ?auto_175854 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_175920 - OBJ
      ?auto_175919 - LOCATION
    )
    :vars
    (
      ?auto_175921 - TRUCK
      ?auto_175922 - LOCATION
      ?auto_175923 - CITY
      ?auto_175924 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175921 ?auto_175922 ) ( IN-CITY ?auto_175922 ?auto_175923 ) ( IN-CITY ?auto_175919 ?auto_175923 ) ( not ( = ?auto_175919 ?auto_175922 ) ) ( OBJ-AT ?auto_175924 ?auto_175919 ) ( not ( = ?auto_175924 ?auto_175920 ) ) ( OBJ-AT ?auto_175920 ?auto_175922 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_175920 ?auto_175921 ?auto_175922 )
      ( DELIVER-2PKG ?auto_175924 ?auto_175920 ?auto_175919 )
      ( DELIVER-1PKG-VERIFY ?auto_175920 ?auto_175919 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175926 - OBJ
      ?auto_175927 - OBJ
      ?auto_175925 - LOCATION
    )
    :vars
    (
      ?auto_175930 - TRUCK
      ?auto_175928 - LOCATION
      ?auto_175929 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175930 ?auto_175928 ) ( IN-CITY ?auto_175928 ?auto_175929 ) ( IN-CITY ?auto_175925 ?auto_175929 ) ( not ( = ?auto_175925 ?auto_175928 ) ) ( OBJ-AT ?auto_175926 ?auto_175925 ) ( not ( = ?auto_175926 ?auto_175927 ) ) ( OBJ-AT ?auto_175927 ?auto_175928 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_175927 ?auto_175925 )
      ( DELIVER-2PKG-VERIFY ?auto_175926 ?auto_175927 ?auto_175925 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_175932 - OBJ
      ?auto_175933 - OBJ
      ?auto_175931 - LOCATION
    )
    :vars
    (
      ?auto_175934 - TRUCK
      ?auto_175935 - LOCATION
      ?auto_175936 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175934 ?auto_175935 ) ( IN-CITY ?auto_175935 ?auto_175936 ) ( IN-CITY ?auto_175931 ?auto_175936 ) ( not ( = ?auto_175931 ?auto_175935 ) ) ( OBJ-AT ?auto_175933 ?auto_175931 ) ( not ( = ?auto_175933 ?auto_175932 ) ) ( OBJ-AT ?auto_175932 ?auto_175935 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175933 ?auto_175932 ?auto_175931 )
      ( DELIVER-2PKG-VERIFY ?auto_175932 ?auto_175933 ?auto_175931 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175945 - OBJ
      ?auto_175946 - OBJ
      ?auto_175947 - OBJ
      ?auto_175944 - LOCATION
    )
    :vars
    (
      ?auto_175948 - TRUCK
      ?auto_175949 - LOCATION
      ?auto_175950 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175948 ?auto_175949 ) ( IN-CITY ?auto_175949 ?auto_175950 ) ( IN-CITY ?auto_175944 ?auto_175950 ) ( not ( = ?auto_175944 ?auto_175949 ) ) ( OBJ-AT ?auto_175945 ?auto_175944 ) ( not ( = ?auto_175945 ?auto_175947 ) ) ( OBJ-AT ?auto_175947 ?auto_175949 ) ( OBJ-AT ?auto_175946 ?auto_175944 ) ( not ( = ?auto_175945 ?auto_175946 ) ) ( not ( = ?auto_175946 ?auto_175947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175945 ?auto_175947 ?auto_175944 )
      ( DELIVER-3PKG-VERIFY ?auto_175945 ?auto_175946 ?auto_175947 ?auto_175944 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175952 - OBJ
      ?auto_175953 - OBJ
      ?auto_175954 - OBJ
      ?auto_175951 - LOCATION
    )
    :vars
    (
      ?auto_175955 - TRUCK
      ?auto_175956 - LOCATION
      ?auto_175957 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175955 ?auto_175956 ) ( IN-CITY ?auto_175956 ?auto_175957 ) ( IN-CITY ?auto_175951 ?auto_175957 ) ( not ( = ?auto_175951 ?auto_175956 ) ) ( OBJ-AT ?auto_175952 ?auto_175951 ) ( not ( = ?auto_175952 ?auto_175953 ) ) ( OBJ-AT ?auto_175953 ?auto_175956 ) ( OBJ-AT ?auto_175954 ?auto_175951 ) ( not ( = ?auto_175952 ?auto_175954 ) ) ( not ( = ?auto_175953 ?auto_175954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175952 ?auto_175953 ?auto_175951 )
      ( DELIVER-3PKG-VERIFY ?auto_175952 ?auto_175953 ?auto_175954 ?auto_175951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_175966 - OBJ
      ?auto_175967 - OBJ
      ?auto_175968 - OBJ
      ?auto_175965 - LOCATION
    )
    :vars
    (
      ?auto_175969 - TRUCK
      ?auto_175970 - LOCATION
      ?auto_175971 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175969 ?auto_175970 ) ( IN-CITY ?auto_175970 ?auto_175971 ) ( IN-CITY ?auto_175965 ?auto_175971 ) ( not ( = ?auto_175965 ?auto_175970 ) ) ( OBJ-AT ?auto_175968 ?auto_175965 ) ( not ( = ?auto_175968 ?auto_175966 ) ) ( OBJ-AT ?auto_175966 ?auto_175970 ) ( OBJ-AT ?auto_175967 ?auto_175965 ) ( not ( = ?auto_175966 ?auto_175967 ) ) ( not ( = ?auto_175967 ?auto_175968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175968 ?auto_175966 ?auto_175965 )
      ( DELIVER-3PKG-VERIFY ?auto_175966 ?auto_175967 ?auto_175968 ?auto_175965 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_175995 - OBJ
      ?auto_175996 - OBJ
      ?auto_175997 - OBJ
      ?auto_175998 - OBJ
      ?auto_175994 - LOCATION
    )
    :vars
    (
      ?auto_175999 - TRUCK
      ?auto_176000 - LOCATION
      ?auto_176001 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_175999 ?auto_176000 ) ( IN-CITY ?auto_176000 ?auto_176001 ) ( IN-CITY ?auto_175994 ?auto_176001 ) ( not ( = ?auto_175994 ?auto_176000 ) ) ( OBJ-AT ?auto_175995 ?auto_175994 ) ( not ( = ?auto_175995 ?auto_175998 ) ) ( OBJ-AT ?auto_175998 ?auto_176000 ) ( OBJ-AT ?auto_175996 ?auto_175994 ) ( OBJ-AT ?auto_175997 ?auto_175994 ) ( not ( = ?auto_175995 ?auto_175996 ) ) ( not ( = ?auto_175995 ?auto_175997 ) ) ( not ( = ?auto_175996 ?auto_175997 ) ) ( not ( = ?auto_175996 ?auto_175998 ) ) ( not ( = ?auto_175997 ?auto_175998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_175995 ?auto_175998 ?auto_175994 )
      ( DELIVER-4PKG-VERIFY ?auto_175995 ?auto_175996 ?auto_175997 ?auto_175998 ?auto_175994 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176003 - OBJ
      ?auto_176004 - OBJ
      ?auto_176005 - OBJ
      ?auto_176006 - OBJ
      ?auto_176002 - LOCATION
    )
    :vars
    (
      ?auto_176007 - TRUCK
      ?auto_176008 - LOCATION
      ?auto_176009 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176007 ?auto_176008 ) ( IN-CITY ?auto_176008 ?auto_176009 ) ( IN-CITY ?auto_176002 ?auto_176009 ) ( not ( = ?auto_176002 ?auto_176008 ) ) ( OBJ-AT ?auto_176004 ?auto_176002 ) ( not ( = ?auto_176004 ?auto_176005 ) ) ( OBJ-AT ?auto_176005 ?auto_176008 ) ( OBJ-AT ?auto_176003 ?auto_176002 ) ( OBJ-AT ?auto_176006 ?auto_176002 ) ( not ( = ?auto_176003 ?auto_176004 ) ) ( not ( = ?auto_176003 ?auto_176005 ) ) ( not ( = ?auto_176003 ?auto_176006 ) ) ( not ( = ?auto_176004 ?auto_176006 ) ) ( not ( = ?auto_176005 ?auto_176006 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176004 ?auto_176005 ?auto_176002 )
      ( DELIVER-4PKG-VERIFY ?auto_176003 ?auto_176004 ?auto_176005 ?auto_176006 ?auto_176002 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176019 - OBJ
      ?auto_176020 - OBJ
      ?auto_176021 - OBJ
      ?auto_176022 - OBJ
      ?auto_176018 - LOCATION
    )
    :vars
    (
      ?auto_176023 - TRUCK
      ?auto_176024 - LOCATION
      ?auto_176025 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176023 ?auto_176024 ) ( IN-CITY ?auto_176024 ?auto_176025 ) ( IN-CITY ?auto_176018 ?auto_176025 ) ( not ( = ?auto_176018 ?auto_176024 ) ) ( OBJ-AT ?auto_176021 ?auto_176018 ) ( not ( = ?auto_176021 ?auto_176020 ) ) ( OBJ-AT ?auto_176020 ?auto_176024 ) ( OBJ-AT ?auto_176019 ?auto_176018 ) ( OBJ-AT ?auto_176022 ?auto_176018 ) ( not ( = ?auto_176019 ?auto_176020 ) ) ( not ( = ?auto_176019 ?auto_176021 ) ) ( not ( = ?auto_176019 ?auto_176022 ) ) ( not ( = ?auto_176020 ?auto_176022 ) ) ( not ( = ?auto_176021 ?auto_176022 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176021 ?auto_176020 ?auto_176018 )
      ( DELIVER-4PKG-VERIFY ?auto_176019 ?auto_176020 ?auto_176021 ?auto_176022 ?auto_176018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176051 - OBJ
      ?auto_176052 - OBJ
      ?auto_176053 - OBJ
      ?auto_176054 - OBJ
      ?auto_176050 - LOCATION
    )
    :vars
    (
      ?auto_176055 - TRUCK
      ?auto_176056 - LOCATION
      ?auto_176057 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176055 ?auto_176056 ) ( IN-CITY ?auto_176056 ?auto_176057 ) ( IN-CITY ?auto_176050 ?auto_176057 ) ( not ( = ?auto_176050 ?auto_176056 ) ) ( OBJ-AT ?auto_176053 ?auto_176050 ) ( not ( = ?auto_176053 ?auto_176051 ) ) ( OBJ-AT ?auto_176051 ?auto_176056 ) ( OBJ-AT ?auto_176052 ?auto_176050 ) ( OBJ-AT ?auto_176054 ?auto_176050 ) ( not ( = ?auto_176051 ?auto_176052 ) ) ( not ( = ?auto_176051 ?auto_176054 ) ) ( not ( = ?auto_176052 ?auto_176053 ) ) ( not ( = ?auto_176052 ?auto_176054 ) ) ( not ( = ?auto_176053 ?auto_176054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176053 ?auto_176051 ?auto_176050 )
      ( DELIVER-4PKG-VERIFY ?auto_176051 ?auto_176052 ?auto_176053 ?auto_176054 ?auto_176050 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176116 - OBJ
      ?auto_176115 - LOCATION
    )
    :vars
    (
      ?auto_176119 - LOCATION
      ?auto_176120 - CITY
      ?auto_176117 - OBJ
      ?auto_176118 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176119 ?auto_176120 ) ( IN-CITY ?auto_176115 ?auto_176120 ) ( not ( = ?auto_176115 ?auto_176119 ) ) ( OBJ-AT ?auto_176117 ?auto_176115 ) ( not ( = ?auto_176117 ?auto_176116 ) ) ( OBJ-AT ?auto_176116 ?auto_176119 ) ( TRUCK-AT ?auto_176118 ?auto_176115 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176118 ?auto_176115 ?auto_176119 ?auto_176120 )
      ( DELIVER-2PKG ?auto_176117 ?auto_176116 ?auto_176115 )
      ( DELIVER-1PKG-VERIFY ?auto_176116 ?auto_176115 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176122 - OBJ
      ?auto_176123 - OBJ
      ?auto_176121 - LOCATION
    )
    :vars
    (
      ?auto_176124 - LOCATION
      ?auto_176126 - CITY
      ?auto_176125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176124 ?auto_176126 ) ( IN-CITY ?auto_176121 ?auto_176126 ) ( not ( = ?auto_176121 ?auto_176124 ) ) ( OBJ-AT ?auto_176122 ?auto_176121 ) ( not ( = ?auto_176122 ?auto_176123 ) ) ( OBJ-AT ?auto_176123 ?auto_176124 ) ( TRUCK-AT ?auto_176125 ?auto_176121 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176123 ?auto_176121 )
      ( DELIVER-2PKG-VERIFY ?auto_176122 ?auto_176123 ?auto_176121 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176128 - OBJ
      ?auto_176129 - OBJ
      ?auto_176127 - LOCATION
    )
    :vars
    (
      ?auto_176132 - LOCATION
      ?auto_176130 - CITY
      ?auto_176131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176132 ?auto_176130 ) ( IN-CITY ?auto_176127 ?auto_176130 ) ( not ( = ?auto_176127 ?auto_176132 ) ) ( OBJ-AT ?auto_176129 ?auto_176127 ) ( not ( = ?auto_176129 ?auto_176128 ) ) ( OBJ-AT ?auto_176128 ?auto_176132 ) ( TRUCK-AT ?auto_176131 ?auto_176127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176129 ?auto_176128 ?auto_176127 )
      ( DELIVER-2PKG-VERIFY ?auto_176128 ?auto_176129 ?auto_176127 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176141 - OBJ
      ?auto_176142 - OBJ
      ?auto_176143 - OBJ
      ?auto_176140 - LOCATION
    )
    :vars
    (
      ?auto_176146 - LOCATION
      ?auto_176144 - CITY
      ?auto_176145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176146 ?auto_176144 ) ( IN-CITY ?auto_176140 ?auto_176144 ) ( not ( = ?auto_176140 ?auto_176146 ) ) ( OBJ-AT ?auto_176141 ?auto_176140 ) ( not ( = ?auto_176141 ?auto_176143 ) ) ( OBJ-AT ?auto_176143 ?auto_176146 ) ( TRUCK-AT ?auto_176145 ?auto_176140 ) ( OBJ-AT ?auto_176142 ?auto_176140 ) ( not ( = ?auto_176141 ?auto_176142 ) ) ( not ( = ?auto_176142 ?auto_176143 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176141 ?auto_176143 ?auto_176140 )
      ( DELIVER-3PKG-VERIFY ?auto_176141 ?auto_176142 ?auto_176143 ?auto_176140 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176148 - OBJ
      ?auto_176149 - OBJ
      ?auto_176150 - OBJ
      ?auto_176147 - LOCATION
    )
    :vars
    (
      ?auto_176153 - LOCATION
      ?auto_176151 - CITY
      ?auto_176152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176153 ?auto_176151 ) ( IN-CITY ?auto_176147 ?auto_176151 ) ( not ( = ?auto_176147 ?auto_176153 ) ) ( OBJ-AT ?auto_176148 ?auto_176147 ) ( not ( = ?auto_176148 ?auto_176149 ) ) ( OBJ-AT ?auto_176149 ?auto_176153 ) ( TRUCK-AT ?auto_176152 ?auto_176147 ) ( OBJ-AT ?auto_176150 ?auto_176147 ) ( not ( = ?auto_176148 ?auto_176150 ) ) ( not ( = ?auto_176149 ?auto_176150 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176148 ?auto_176149 ?auto_176147 )
      ( DELIVER-3PKG-VERIFY ?auto_176148 ?auto_176149 ?auto_176150 ?auto_176147 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_176162 - OBJ
      ?auto_176163 - OBJ
      ?auto_176164 - OBJ
      ?auto_176161 - LOCATION
    )
    :vars
    (
      ?auto_176167 - LOCATION
      ?auto_176165 - CITY
      ?auto_176166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176167 ?auto_176165 ) ( IN-CITY ?auto_176161 ?auto_176165 ) ( not ( = ?auto_176161 ?auto_176167 ) ) ( OBJ-AT ?auto_176163 ?auto_176161 ) ( not ( = ?auto_176163 ?auto_176162 ) ) ( OBJ-AT ?auto_176162 ?auto_176167 ) ( TRUCK-AT ?auto_176166 ?auto_176161 ) ( OBJ-AT ?auto_176164 ?auto_176161 ) ( not ( = ?auto_176162 ?auto_176164 ) ) ( not ( = ?auto_176163 ?auto_176164 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176163 ?auto_176162 ?auto_176161 )
      ( DELIVER-3PKG-VERIFY ?auto_176162 ?auto_176163 ?auto_176164 ?auto_176161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176191 - OBJ
      ?auto_176192 - OBJ
      ?auto_176193 - OBJ
      ?auto_176194 - OBJ
      ?auto_176190 - LOCATION
    )
    :vars
    (
      ?auto_176197 - LOCATION
      ?auto_176195 - CITY
      ?auto_176196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176197 ?auto_176195 ) ( IN-CITY ?auto_176190 ?auto_176195 ) ( not ( = ?auto_176190 ?auto_176197 ) ) ( OBJ-AT ?auto_176193 ?auto_176190 ) ( not ( = ?auto_176193 ?auto_176194 ) ) ( OBJ-AT ?auto_176194 ?auto_176197 ) ( TRUCK-AT ?auto_176196 ?auto_176190 ) ( OBJ-AT ?auto_176191 ?auto_176190 ) ( OBJ-AT ?auto_176192 ?auto_176190 ) ( not ( = ?auto_176191 ?auto_176192 ) ) ( not ( = ?auto_176191 ?auto_176193 ) ) ( not ( = ?auto_176191 ?auto_176194 ) ) ( not ( = ?auto_176192 ?auto_176193 ) ) ( not ( = ?auto_176192 ?auto_176194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176193 ?auto_176194 ?auto_176190 )
      ( DELIVER-4PKG-VERIFY ?auto_176191 ?auto_176192 ?auto_176193 ?auto_176194 ?auto_176190 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176199 - OBJ
      ?auto_176200 - OBJ
      ?auto_176201 - OBJ
      ?auto_176202 - OBJ
      ?auto_176198 - LOCATION
    )
    :vars
    (
      ?auto_176205 - LOCATION
      ?auto_176203 - CITY
      ?auto_176204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176205 ?auto_176203 ) ( IN-CITY ?auto_176198 ?auto_176203 ) ( not ( = ?auto_176198 ?auto_176205 ) ) ( OBJ-AT ?auto_176200 ?auto_176198 ) ( not ( = ?auto_176200 ?auto_176201 ) ) ( OBJ-AT ?auto_176201 ?auto_176205 ) ( TRUCK-AT ?auto_176204 ?auto_176198 ) ( OBJ-AT ?auto_176199 ?auto_176198 ) ( OBJ-AT ?auto_176202 ?auto_176198 ) ( not ( = ?auto_176199 ?auto_176200 ) ) ( not ( = ?auto_176199 ?auto_176201 ) ) ( not ( = ?auto_176199 ?auto_176202 ) ) ( not ( = ?auto_176200 ?auto_176202 ) ) ( not ( = ?auto_176201 ?auto_176202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176200 ?auto_176201 ?auto_176198 )
      ( DELIVER-4PKG-VERIFY ?auto_176199 ?auto_176200 ?auto_176201 ?auto_176202 ?auto_176198 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176215 - OBJ
      ?auto_176216 - OBJ
      ?auto_176217 - OBJ
      ?auto_176218 - OBJ
      ?auto_176214 - LOCATION
    )
    :vars
    (
      ?auto_176221 - LOCATION
      ?auto_176219 - CITY
      ?auto_176220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176221 ?auto_176219 ) ( IN-CITY ?auto_176214 ?auto_176219 ) ( not ( = ?auto_176214 ?auto_176221 ) ) ( OBJ-AT ?auto_176218 ?auto_176214 ) ( not ( = ?auto_176218 ?auto_176216 ) ) ( OBJ-AT ?auto_176216 ?auto_176221 ) ( TRUCK-AT ?auto_176220 ?auto_176214 ) ( OBJ-AT ?auto_176215 ?auto_176214 ) ( OBJ-AT ?auto_176217 ?auto_176214 ) ( not ( = ?auto_176215 ?auto_176216 ) ) ( not ( = ?auto_176215 ?auto_176217 ) ) ( not ( = ?auto_176215 ?auto_176218 ) ) ( not ( = ?auto_176216 ?auto_176217 ) ) ( not ( = ?auto_176217 ?auto_176218 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176218 ?auto_176216 ?auto_176214 )
      ( DELIVER-4PKG-VERIFY ?auto_176215 ?auto_176216 ?auto_176217 ?auto_176218 ?auto_176214 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_176247 - OBJ
      ?auto_176248 - OBJ
      ?auto_176249 - OBJ
      ?auto_176250 - OBJ
      ?auto_176246 - LOCATION
    )
    :vars
    (
      ?auto_176253 - LOCATION
      ?auto_176251 - CITY
      ?auto_176252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176253 ?auto_176251 ) ( IN-CITY ?auto_176246 ?auto_176251 ) ( not ( = ?auto_176246 ?auto_176253 ) ) ( OBJ-AT ?auto_176250 ?auto_176246 ) ( not ( = ?auto_176250 ?auto_176247 ) ) ( OBJ-AT ?auto_176247 ?auto_176253 ) ( TRUCK-AT ?auto_176252 ?auto_176246 ) ( OBJ-AT ?auto_176248 ?auto_176246 ) ( OBJ-AT ?auto_176249 ?auto_176246 ) ( not ( = ?auto_176247 ?auto_176248 ) ) ( not ( = ?auto_176247 ?auto_176249 ) ) ( not ( = ?auto_176248 ?auto_176249 ) ) ( not ( = ?auto_176248 ?auto_176250 ) ) ( not ( = ?auto_176249 ?auto_176250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176250 ?auto_176247 ?auto_176246 )
      ( DELIVER-4PKG-VERIFY ?auto_176247 ?auto_176248 ?auto_176249 ?auto_176250 ?auto_176246 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176312 - OBJ
      ?auto_176311 - LOCATION
    )
    :vars
    (
      ?auto_176316 - LOCATION
      ?auto_176314 - CITY
      ?auto_176313 - OBJ
      ?auto_176315 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176316 ?auto_176314 ) ( IN-CITY ?auto_176311 ?auto_176314 ) ( not ( = ?auto_176311 ?auto_176316 ) ) ( not ( = ?auto_176313 ?auto_176312 ) ) ( OBJ-AT ?auto_176312 ?auto_176316 ) ( TRUCK-AT ?auto_176315 ?auto_176311 ) ( IN-TRUCK ?auto_176313 ?auto_176315 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176313 ?auto_176311 )
      ( DELIVER-2PKG ?auto_176313 ?auto_176312 ?auto_176311 )
      ( DELIVER-1PKG-VERIFY ?auto_176312 ?auto_176311 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176318 - OBJ
      ?auto_176319 - OBJ
      ?auto_176317 - LOCATION
    )
    :vars
    (
      ?auto_176321 - LOCATION
      ?auto_176322 - CITY
      ?auto_176320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176321 ?auto_176322 ) ( IN-CITY ?auto_176317 ?auto_176322 ) ( not ( = ?auto_176317 ?auto_176321 ) ) ( not ( = ?auto_176318 ?auto_176319 ) ) ( OBJ-AT ?auto_176319 ?auto_176321 ) ( TRUCK-AT ?auto_176320 ?auto_176317 ) ( IN-TRUCK ?auto_176318 ?auto_176320 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176319 ?auto_176317 )
      ( DELIVER-2PKG-VERIFY ?auto_176318 ?auto_176319 ?auto_176317 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176324 - OBJ
      ?auto_176325 - OBJ
      ?auto_176323 - LOCATION
    )
    :vars
    (
      ?auto_176326 - LOCATION
      ?auto_176328 - CITY
      ?auto_176327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176326 ?auto_176328 ) ( IN-CITY ?auto_176323 ?auto_176328 ) ( not ( = ?auto_176323 ?auto_176326 ) ) ( not ( = ?auto_176325 ?auto_176324 ) ) ( OBJ-AT ?auto_176324 ?auto_176326 ) ( TRUCK-AT ?auto_176327 ?auto_176323 ) ( IN-TRUCK ?auto_176325 ?auto_176327 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176325 ?auto_176324 ?auto_176323 )
      ( DELIVER-2PKG-VERIFY ?auto_176324 ?auto_176325 ?auto_176323 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176508 - OBJ
      ?auto_176507 - LOCATION
    )
    :vars
    (
      ?auto_176510 - LOCATION
      ?auto_176512 - CITY
      ?auto_176509 - OBJ
      ?auto_176511 - TRUCK
      ?auto_176513 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_176510 ?auto_176512 ) ( IN-CITY ?auto_176507 ?auto_176512 ) ( not ( = ?auto_176507 ?auto_176510 ) ) ( not ( = ?auto_176509 ?auto_176508 ) ) ( OBJ-AT ?auto_176508 ?auto_176510 ) ( IN-TRUCK ?auto_176509 ?auto_176511 ) ( TRUCK-AT ?auto_176511 ?auto_176513 ) ( IN-CITY ?auto_176513 ?auto_176512 ) ( not ( = ?auto_176507 ?auto_176513 ) ) ( not ( = ?auto_176510 ?auto_176513 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176511 ?auto_176513 ?auto_176507 ?auto_176512 )
      ( DELIVER-2PKG ?auto_176509 ?auto_176508 ?auto_176507 )
      ( DELIVER-1PKG-VERIFY ?auto_176508 ?auto_176507 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176515 - OBJ
      ?auto_176516 - OBJ
      ?auto_176514 - LOCATION
    )
    :vars
    (
      ?auto_176518 - LOCATION
      ?auto_176519 - CITY
      ?auto_176520 - TRUCK
      ?auto_176517 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_176518 ?auto_176519 ) ( IN-CITY ?auto_176514 ?auto_176519 ) ( not ( = ?auto_176514 ?auto_176518 ) ) ( not ( = ?auto_176515 ?auto_176516 ) ) ( OBJ-AT ?auto_176516 ?auto_176518 ) ( IN-TRUCK ?auto_176515 ?auto_176520 ) ( TRUCK-AT ?auto_176520 ?auto_176517 ) ( IN-CITY ?auto_176517 ?auto_176519 ) ( not ( = ?auto_176514 ?auto_176517 ) ) ( not ( = ?auto_176518 ?auto_176517 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176516 ?auto_176514 )
      ( DELIVER-2PKG-VERIFY ?auto_176515 ?auto_176516 ?auto_176514 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176522 - OBJ
      ?auto_176523 - OBJ
      ?auto_176521 - LOCATION
    )
    :vars
    (
      ?auto_176527 - LOCATION
      ?auto_176524 - CITY
      ?auto_176526 - TRUCK
      ?auto_176525 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_176527 ?auto_176524 ) ( IN-CITY ?auto_176521 ?auto_176524 ) ( not ( = ?auto_176521 ?auto_176527 ) ) ( not ( = ?auto_176523 ?auto_176522 ) ) ( OBJ-AT ?auto_176522 ?auto_176527 ) ( IN-TRUCK ?auto_176523 ?auto_176526 ) ( TRUCK-AT ?auto_176526 ?auto_176525 ) ( IN-CITY ?auto_176525 ?auto_176524 ) ( not ( = ?auto_176521 ?auto_176525 ) ) ( not ( = ?auto_176527 ?auto_176525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176523 ?auto_176522 ?auto_176521 )
      ( DELIVER-2PKG-VERIFY ?auto_176522 ?auto_176523 ?auto_176521 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176730 - OBJ
      ?auto_176729 - LOCATION
    )
    :vars
    (
      ?auto_176735 - LOCATION
      ?auto_176731 - CITY
      ?auto_176733 - OBJ
      ?auto_176734 - TRUCK
      ?auto_176732 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_176735 ?auto_176731 ) ( IN-CITY ?auto_176729 ?auto_176731 ) ( not ( = ?auto_176729 ?auto_176735 ) ) ( not ( = ?auto_176733 ?auto_176730 ) ) ( OBJ-AT ?auto_176730 ?auto_176735 ) ( TRUCK-AT ?auto_176734 ?auto_176732 ) ( IN-CITY ?auto_176732 ?auto_176731 ) ( not ( = ?auto_176729 ?auto_176732 ) ) ( not ( = ?auto_176735 ?auto_176732 ) ) ( OBJ-AT ?auto_176733 ?auto_176732 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_176733 ?auto_176734 ?auto_176732 )
      ( DELIVER-2PKG ?auto_176733 ?auto_176730 ?auto_176729 )
      ( DELIVER-1PKG-VERIFY ?auto_176730 ?auto_176729 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176737 - OBJ
      ?auto_176738 - OBJ
      ?auto_176736 - LOCATION
    )
    :vars
    (
      ?auto_176739 - LOCATION
      ?auto_176741 - CITY
      ?auto_176742 - TRUCK
      ?auto_176740 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_176739 ?auto_176741 ) ( IN-CITY ?auto_176736 ?auto_176741 ) ( not ( = ?auto_176736 ?auto_176739 ) ) ( not ( = ?auto_176737 ?auto_176738 ) ) ( OBJ-AT ?auto_176738 ?auto_176739 ) ( TRUCK-AT ?auto_176742 ?auto_176740 ) ( IN-CITY ?auto_176740 ?auto_176741 ) ( not ( = ?auto_176736 ?auto_176740 ) ) ( not ( = ?auto_176739 ?auto_176740 ) ) ( OBJ-AT ?auto_176737 ?auto_176740 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176738 ?auto_176736 )
      ( DELIVER-2PKG-VERIFY ?auto_176737 ?auto_176738 ?auto_176736 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176744 - OBJ
      ?auto_176745 - OBJ
      ?auto_176743 - LOCATION
    )
    :vars
    (
      ?auto_176748 - LOCATION
      ?auto_176746 - CITY
      ?auto_176747 - TRUCK
      ?auto_176749 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_176748 ?auto_176746 ) ( IN-CITY ?auto_176743 ?auto_176746 ) ( not ( = ?auto_176743 ?auto_176748 ) ) ( not ( = ?auto_176745 ?auto_176744 ) ) ( OBJ-AT ?auto_176744 ?auto_176748 ) ( TRUCK-AT ?auto_176747 ?auto_176749 ) ( IN-CITY ?auto_176749 ?auto_176746 ) ( not ( = ?auto_176743 ?auto_176749 ) ) ( not ( = ?auto_176748 ?auto_176749 ) ) ( OBJ-AT ?auto_176745 ?auto_176749 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_176745 ?auto_176744 ?auto_176743 )
      ( DELIVER-2PKG-VERIFY ?auto_176744 ?auto_176745 ?auto_176743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178100 - OBJ
      ?auto_178101 - OBJ
      ?auto_178102 - OBJ
      ?auto_178099 - LOCATION
    )
    :vars
    (
      ?auto_178103 - TRUCK
      ?auto_178105 - LOCATION
      ?auto_178104 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178101 ?auto_178103 ) ( TRUCK-AT ?auto_178103 ?auto_178105 ) ( IN-CITY ?auto_178105 ?auto_178104 ) ( IN-CITY ?auto_178099 ?auto_178104 ) ( not ( = ?auto_178099 ?auto_178105 ) ) ( OBJ-AT ?auto_178100 ?auto_178099 ) ( not ( = ?auto_178100 ?auto_178101 ) ) ( OBJ-AT ?auto_178102 ?auto_178099 ) ( not ( = ?auto_178100 ?auto_178102 ) ) ( not ( = ?auto_178101 ?auto_178102 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178100 ?auto_178101 ?auto_178099 )
      ( DELIVER-3PKG-VERIFY ?auto_178100 ?auto_178101 ?auto_178102 ?auto_178099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178122 - OBJ
      ?auto_178123 - OBJ
      ?auto_178124 - OBJ
      ?auto_178121 - LOCATION
    )
    :vars
    (
      ?auto_178125 - TRUCK
      ?auto_178127 - LOCATION
      ?auto_178126 - CITY
      ?auto_178128 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178124 ?auto_178125 ) ( TRUCK-AT ?auto_178125 ?auto_178127 ) ( IN-CITY ?auto_178127 ?auto_178126 ) ( IN-CITY ?auto_178121 ?auto_178126 ) ( not ( = ?auto_178121 ?auto_178127 ) ) ( OBJ-AT ?auto_178128 ?auto_178121 ) ( not ( = ?auto_178128 ?auto_178124 ) ) ( OBJ-AT ?auto_178122 ?auto_178121 ) ( OBJ-AT ?auto_178123 ?auto_178121 ) ( not ( = ?auto_178122 ?auto_178123 ) ) ( not ( = ?auto_178122 ?auto_178124 ) ) ( not ( = ?auto_178122 ?auto_178128 ) ) ( not ( = ?auto_178123 ?auto_178124 ) ) ( not ( = ?auto_178123 ?auto_178128 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178128 ?auto_178124 ?auto_178121 )
      ( DELIVER-3PKG-VERIFY ?auto_178122 ?auto_178123 ?auto_178124 ?auto_178121 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178134 - OBJ
      ?auto_178135 - OBJ
      ?auto_178136 - OBJ
      ?auto_178133 - LOCATION
    )
    :vars
    (
      ?auto_178137 - TRUCK
      ?auto_178139 - LOCATION
      ?auto_178138 - CITY
      ?auto_178140 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178135 ?auto_178137 ) ( TRUCK-AT ?auto_178137 ?auto_178139 ) ( IN-CITY ?auto_178139 ?auto_178138 ) ( IN-CITY ?auto_178133 ?auto_178138 ) ( not ( = ?auto_178133 ?auto_178139 ) ) ( OBJ-AT ?auto_178140 ?auto_178133 ) ( not ( = ?auto_178140 ?auto_178135 ) ) ( OBJ-AT ?auto_178134 ?auto_178133 ) ( OBJ-AT ?auto_178136 ?auto_178133 ) ( not ( = ?auto_178134 ?auto_178135 ) ) ( not ( = ?auto_178134 ?auto_178136 ) ) ( not ( = ?auto_178134 ?auto_178140 ) ) ( not ( = ?auto_178135 ?auto_178136 ) ) ( not ( = ?auto_178136 ?auto_178140 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178140 ?auto_178135 ?auto_178133 )
      ( DELIVER-3PKG-VERIFY ?auto_178134 ?auto_178135 ?auto_178136 ?auto_178133 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178172 - OBJ
      ?auto_178173 - OBJ
      ?auto_178174 - OBJ
      ?auto_178171 - LOCATION
    )
    :vars
    (
      ?auto_178175 - TRUCK
      ?auto_178177 - LOCATION
      ?auto_178176 - CITY
      ?auto_178178 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178172 ?auto_178175 ) ( TRUCK-AT ?auto_178175 ?auto_178177 ) ( IN-CITY ?auto_178177 ?auto_178176 ) ( IN-CITY ?auto_178171 ?auto_178176 ) ( not ( = ?auto_178171 ?auto_178177 ) ) ( OBJ-AT ?auto_178178 ?auto_178171 ) ( not ( = ?auto_178178 ?auto_178172 ) ) ( OBJ-AT ?auto_178173 ?auto_178171 ) ( OBJ-AT ?auto_178174 ?auto_178171 ) ( not ( = ?auto_178172 ?auto_178173 ) ) ( not ( = ?auto_178172 ?auto_178174 ) ) ( not ( = ?auto_178173 ?auto_178174 ) ) ( not ( = ?auto_178173 ?auto_178178 ) ) ( not ( = ?auto_178174 ?auto_178178 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178178 ?auto_178172 ?auto_178171 )
      ( DELIVER-3PKG-VERIFY ?auto_178172 ?auto_178173 ?auto_178174 ?auto_178171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178211 - OBJ
      ?auto_178212 - OBJ
      ?auto_178213 - OBJ
      ?auto_178214 - OBJ
      ?auto_178210 - LOCATION
    )
    :vars
    (
      ?auto_178215 - TRUCK
      ?auto_178217 - LOCATION
      ?auto_178216 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178214 ?auto_178215 ) ( TRUCK-AT ?auto_178215 ?auto_178217 ) ( IN-CITY ?auto_178217 ?auto_178216 ) ( IN-CITY ?auto_178210 ?auto_178216 ) ( not ( = ?auto_178210 ?auto_178217 ) ) ( OBJ-AT ?auto_178212 ?auto_178210 ) ( not ( = ?auto_178212 ?auto_178214 ) ) ( OBJ-AT ?auto_178211 ?auto_178210 ) ( OBJ-AT ?auto_178213 ?auto_178210 ) ( not ( = ?auto_178211 ?auto_178212 ) ) ( not ( = ?auto_178211 ?auto_178213 ) ) ( not ( = ?auto_178211 ?auto_178214 ) ) ( not ( = ?auto_178212 ?auto_178213 ) ) ( not ( = ?auto_178213 ?auto_178214 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178212 ?auto_178214 ?auto_178210 )
      ( DELIVER-4PKG-VERIFY ?auto_178211 ?auto_178212 ?auto_178213 ?auto_178214 ?auto_178210 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178219 - OBJ
      ?auto_178220 - OBJ
      ?auto_178221 - OBJ
      ?auto_178222 - OBJ
      ?auto_178218 - LOCATION
    )
    :vars
    (
      ?auto_178223 - TRUCK
      ?auto_178225 - LOCATION
      ?auto_178224 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178222 ?auto_178223 ) ( TRUCK-AT ?auto_178223 ?auto_178225 ) ( IN-CITY ?auto_178225 ?auto_178224 ) ( IN-CITY ?auto_178218 ?auto_178224 ) ( not ( = ?auto_178218 ?auto_178225 ) ) ( OBJ-AT ?auto_178219 ?auto_178218 ) ( not ( = ?auto_178219 ?auto_178222 ) ) ( OBJ-AT ?auto_178220 ?auto_178218 ) ( OBJ-AT ?auto_178221 ?auto_178218 ) ( not ( = ?auto_178219 ?auto_178220 ) ) ( not ( = ?auto_178219 ?auto_178221 ) ) ( not ( = ?auto_178220 ?auto_178221 ) ) ( not ( = ?auto_178220 ?auto_178222 ) ) ( not ( = ?auto_178221 ?auto_178222 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178219 ?auto_178222 ?auto_178218 )
      ( DELIVER-4PKG-VERIFY ?auto_178219 ?auto_178220 ?auto_178221 ?auto_178222 ?auto_178218 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178227 - OBJ
      ?auto_178228 - OBJ
      ?auto_178229 - OBJ
      ?auto_178230 - OBJ
      ?auto_178226 - LOCATION
    )
    :vars
    (
      ?auto_178231 - TRUCK
      ?auto_178233 - LOCATION
      ?auto_178232 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178229 ?auto_178231 ) ( TRUCK-AT ?auto_178231 ?auto_178233 ) ( IN-CITY ?auto_178233 ?auto_178232 ) ( IN-CITY ?auto_178226 ?auto_178232 ) ( not ( = ?auto_178226 ?auto_178233 ) ) ( OBJ-AT ?auto_178230 ?auto_178226 ) ( not ( = ?auto_178230 ?auto_178229 ) ) ( OBJ-AT ?auto_178227 ?auto_178226 ) ( OBJ-AT ?auto_178228 ?auto_178226 ) ( not ( = ?auto_178227 ?auto_178228 ) ) ( not ( = ?auto_178227 ?auto_178229 ) ) ( not ( = ?auto_178227 ?auto_178230 ) ) ( not ( = ?auto_178228 ?auto_178229 ) ) ( not ( = ?auto_178228 ?auto_178230 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178230 ?auto_178229 ?auto_178226 )
      ( DELIVER-4PKG-VERIFY ?auto_178227 ?auto_178228 ?auto_178229 ?auto_178230 ?auto_178226 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178235 - OBJ
      ?auto_178236 - OBJ
      ?auto_178237 - OBJ
      ?auto_178238 - OBJ
      ?auto_178234 - LOCATION
    )
    :vars
    (
      ?auto_178239 - TRUCK
      ?auto_178241 - LOCATION
      ?auto_178240 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178237 ?auto_178239 ) ( TRUCK-AT ?auto_178239 ?auto_178241 ) ( IN-CITY ?auto_178241 ?auto_178240 ) ( IN-CITY ?auto_178234 ?auto_178240 ) ( not ( = ?auto_178234 ?auto_178241 ) ) ( OBJ-AT ?auto_178235 ?auto_178234 ) ( not ( = ?auto_178235 ?auto_178237 ) ) ( OBJ-AT ?auto_178236 ?auto_178234 ) ( OBJ-AT ?auto_178238 ?auto_178234 ) ( not ( = ?auto_178235 ?auto_178236 ) ) ( not ( = ?auto_178235 ?auto_178238 ) ) ( not ( = ?auto_178236 ?auto_178237 ) ) ( not ( = ?auto_178236 ?auto_178238 ) ) ( not ( = ?auto_178237 ?auto_178238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178235 ?auto_178237 ?auto_178234 )
      ( DELIVER-4PKG-VERIFY ?auto_178235 ?auto_178236 ?auto_178237 ?auto_178238 ?auto_178234 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178291 - OBJ
      ?auto_178292 - OBJ
      ?auto_178293 - OBJ
      ?auto_178294 - OBJ
      ?auto_178290 - LOCATION
    )
    :vars
    (
      ?auto_178295 - TRUCK
      ?auto_178297 - LOCATION
      ?auto_178296 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178292 ?auto_178295 ) ( TRUCK-AT ?auto_178295 ?auto_178297 ) ( IN-CITY ?auto_178297 ?auto_178296 ) ( IN-CITY ?auto_178290 ?auto_178296 ) ( not ( = ?auto_178290 ?auto_178297 ) ) ( OBJ-AT ?auto_178294 ?auto_178290 ) ( not ( = ?auto_178294 ?auto_178292 ) ) ( OBJ-AT ?auto_178291 ?auto_178290 ) ( OBJ-AT ?auto_178293 ?auto_178290 ) ( not ( = ?auto_178291 ?auto_178292 ) ) ( not ( = ?auto_178291 ?auto_178293 ) ) ( not ( = ?auto_178291 ?auto_178294 ) ) ( not ( = ?auto_178292 ?auto_178293 ) ) ( not ( = ?auto_178293 ?auto_178294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178294 ?auto_178292 ?auto_178290 )
      ( DELIVER-4PKG-VERIFY ?auto_178291 ?auto_178292 ?auto_178293 ?auto_178294 ?auto_178290 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178411 - OBJ
      ?auto_178412 - OBJ
      ?auto_178413 - OBJ
      ?auto_178414 - OBJ
      ?auto_178410 - LOCATION
    )
    :vars
    (
      ?auto_178415 - TRUCK
      ?auto_178417 - LOCATION
      ?auto_178416 - CITY
      ?auto_178418 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178414 ?auto_178415 ) ( TRUCK-AT ?auto_178415 ?auto_178417 ) ( IN-CITY ?auto_178417 ?auto_178416 ) ( IN-CITY ?auto_178410 ?auto_178416 ) ( not ( = ?auto_178410 ?auto_178417 ) ) ( OBJ-AT ?auto_178418 ?auto_178410 ) ( not ( = ?auto_178418 ?auto_178414 ) ) ( OBJ-AT ?auto_178411 ?auto_178410 ) ( OBJ-AT ?auto_178412 ?auto_178410 ) ( OBJ-AT ?auto_178413 ?auto_178410 ) ( not ( = ?auto_178411 ?auto_178412 ) ) ( not ( = ?auto_178411 ?auto_178413 ) ) ( not ( = ?auto_178411 ?auto_178414 ) ) ( not ( = ?auto_178411 ?auto_178418 ) ) ( not ( = ?auto_178412 ?auto_178413 ) ) ( not ( = ?auto_178412 ?auto_178414 ) ) ( not ( = ?auto_178412 ?auto_178418 ) ) ( not ( = ?auto_178413 ?auto_178414 ) ) ( not ( = ?auto_178413 ?auto_178418 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178418 ?auto_178414 ?auto_178410 )
      ( DELIVER-4PKG-VERIFY ?auto_178411 ?auto_178412 ?auto_178413 ?auto_178414 ?auto_178410 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178428 - OBJ
      ?auto_178429 - OBJ
      ?auto_178430 - OBJ
      ?auto_178431 - OBJ
      ?auto_178427 - LOCATION
    )
    :vars
    (
      ?auto_178432 - TRUCK
      ?auto_178434 - LOCATION
      ?auto_178433 - CITY
      ?auto_178435 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178430 ?auto_178432 ) ( TRUCK-AT ?auto_178432 ?auto_178434 ) ( IN-CITY ?auto_178434 ?auto_178433 ) ( IN-CITY ?auto_178427 ?auto_178433 ) ( not ( = ?auto_178427 ?auto_178434 ) ) ( OBJ-AT ?auto_178435 ?auto_178427 ) ( not ( = ?auto_178435 ?auto_178430 ) ) ( OBJ-AT ?auto_178428 ?auto_178427 ) ( OBJ-AT ?auto_178429 ?auto_178427 ) ( OBJ-AT ?auto_178431 ?auto_178427 ) ( not ( = ?auto_178428 ?auto_178429 ) ) ( not ( = ?auto_178428 ?auto_178430 ) ) ( not ( = ?auto_178428 ?auto_178431 ) ) ( not ( = ?auto_178428 ?auto_178435 ) ) ( not ( = ?auto_178429 ?auto_178430 ) ) ( not ( = ?auto_178429 ?auto_178431 ) ) ( not ( = ?auto_178429 ?auto_178435 ) ) ( not ( = ?auto_178430 ?auto_178431 ) ) ( not ( = ?auto_178431 ?auto_178435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178435 ?auto_178430 ?auto_178427 )
      ( DELIVER-4PKG-VERIFY ?auto_178428 ?auto_178429 ?auto_178430 ?auto_178431 ?auto_178427 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178446 - OBJ
      ?auto_178447 - OBJ
      ?auto_178448 - OBJ
      ?auto_178449 - OBJ
      ?auto_178445 - LOCATION
    )
    :vars
    (
      ?auto_178450 - TRUCK
      ?auto_178452 - LOCATION
      ?auto_178451 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178447 ?auto_178450 ) ( TRUCK-AT ?auto_178450 ?auto_178452 ) ( IN-CITY ?auto_178452 ?auto_178451 ) ( IN-CITY ?auto_178445 ?auto_178451 ) ( not ( = ?auto_178445 ?auto_178452 ) ) ( OBJ-AT ?auto_178448 ?auto_178445 ) ( not ( = ?auto_178448 ?auto_178447 ) ) ( OBJ-AT ?auto_178446 ?auto_178445 ) ( OBJ-AT ?auto_178449 ?auto_178445 ) ( not ( = ?auto_178446 ?auto_178447 ) ) ( not ( = ?auto_178446 ?auto_178448 ) ) ( not ( = ?auto_178446 ?auto_178449 ) ) ( not ( = ?auto_178447 ?auto_178449 ) ) ( not ( = ?auto_178448 ?auto_178449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178448 ?auto_178447 ?auto_178445 )
      ( DELIVER-4PKG-VERIFY ?auto_178446 ?auto_178447 ?auto_178448 ?auto_178449 ?auto_178445 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178478 - OBJ
      ?auto_178479 - OBJ
      ?auto_178480 - OBJ
      ?auto_178481 - OBJ
      ?auto_178477 - LOCATION
    )
    :vars
    (
      ?auto_178482 - TRUCK
      ?auto_178484 - LOCATION
      ?auto_178483 - CITY
      ?auto_178485 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178479 ?auto_178482 ) ( TRUCK-AT ?auto_178482 ?auto_178484 ) ( IN-CITY ?auto_178484 ?auto_178483 ) ( IN-CITY ?auto_178477 ?auto_178483 ) ( not ( = ?auto_178477 ?auto_178484 ) ) ( OBJ-AT ?auto_178485 ?auto_178477 ) ( not ( = ?auto_178485 ?auto_178479 ) ) ( OBJ-AT ?auto_178478 ?auto_178477 ) ( OBJ-AT ?auto_178480 ?auto_178477 ) ( OBJ-AT ?auto_178481 ?auto_178477 ) ( not ( = ?auto_178478 ?auto_178479 ) ) ( not ( = ?auto_178478 ?auto_178480 ) ) ( not ( = ?auto_178478 ?auto_178481 ) ) ( not ( = ?auto_178478 ?auto_178485 ) ) ( not ( = ?auto_178479 ?auto_178480 ) ) ( not ( = ?auto_178479 ?auto_178481 ) ) ( not ( = ?auto_178480 ?auto_178481 ) ) ( not ( = ?auto_178480 ?auto_178485 ) ) ( not ( = ?auto_178481 ?auto_178485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178485 ?auto_178479 ?auto_178477 )
      ( DELIVER-4PKG-VERIFY ?auto_178478 ?auto_178479 ?auto_178480 ?auto_178481 ?auto_178477 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178522 - OBJ
      ?auto_178523 - OBJ
      ?auto_178524 - OBJ
      ?auto_178525 - OBJ
      ?auto_178521 - LOCATION
    )
    :vars
    (
      ?auto_178526 - TRUCK
      ?auto_178528 - LOCATION
      ?auto_178527 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178522 ?auto_178526 ) ( TRUCK-AT ?auto_178526 ?auto_178528 ) ( IN-CITY ?auto_178528 ?auto_178527 ) ( IN-CITY ?auto_178521 ?auto_178527 ) ( not ( = ?auto_178521 ?auto_178528 ) ) ( OBJ-AT ?auto_178525 ?auto_178521 ) ( not ( = ?auto_178525 ?auto_178522 ) ) ( OBJ-AT ?auto_178523 ?auto_178521 ) ( OBJ-AT ?auto_178524 ?auto_178521 ) ( not ( = ?auto_178522 ?auto_178523 ) ) ( not ( = ?auto_178522 ?auto_178524 ) ) ( not ( = ?auto_178523 ?auto_178524 ) ) ( not ( = ?auto_178523 ?auto_178525 ) ) ( not ( = ?auto_178524 ?auto_178525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178525 ?auto_178522 ?auto_178521 )
      ( DELIVER-4PKG-VERIFY ?auto_178522 ?auto_178523 ?auto_178524 ?auto_178525 ?auto_178521 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178530 - OBJ
      ?auto_178531 - OBJ
      ?auto_178532 - OBJ
      ?auto_178533 - OBJ
      ?auto_178529 - LOCATION
    )
    :vars
    (
      ?auto_178534 - TRUCK
      ?auto_178536 - LOCATION
      ?auto_178535 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178530 ?auto_178534 ) ( TRUCK-AT ?auto_178534 ?auto_178536 ) ( IN-CITY ?auto_178536 ?auto_178535 ) ( IN-CITY ?auto_178529 ?auto_178535 ) ( not ( = ?auto_178529 ?auto_178536 ) ) ( OBJ-AT ?auto_178531 ?auto_178529 ) ( not ( = ?auto_178531 ?auto_178530 ) ) ( OBJ-AT ?auto_178532 ?auto_178529 ) ( OBJ-AT ?auto_178533 ?auto_178529 ) ( not ( = ?auto_178530 ?auto_178532 ) ) ( not ( = ?auto_178530 ?auto_178533 ) ) ( not ( = ?auto_178531 ?auto_178532 ) ) ( not ( = ?auto_178531 ?auto_178533 ) ) ( not ( = ?auto_178532 ?auto_178533 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178531 ?auto_178530 ?auto_178529 )
      ( DELIVER-4PKG-VERIFY ?auto_178530 ?auto_178531 ?auto_178532 ?auto_178533 ?auto_178529 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178626 - OBJ
      ?auto_178627 - OBJ
      ?auto_178628 - OBJ
      ?auto_178629 - OBJ
      ?auto_178625 - LOCATION
    )
    :vars
    (
      ?auto_178630 - TRUCK
      ?auto_178632 - LOCATION
      ?auto_178631 - CITY
      ?auto_178633 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_178626 ?auto_178630 ) ( TRUCK-AT ?auto_178630 ?auto_178632 ) ( IN-CITY ?auto_178632 ?auto_178631 ) ( IN-CITY ?auto_178625 ?auto_178631 ) ( not ( = ?auto_178625 ?auto_178632 ) ) ( OBJ-AT ?auto_178633 ?auto_178625 ) ( not ( = ?auto_178633 ?auto_178626 ) ) ( OBJ-AT ?auto_178627 ?auto_178625 ) ( OBJ-AT ?auto_178628 ?auto_178625 ) ( OBJ-AT ?auto_178629 ?auto_178625 ) ( not ( = ?auto_178626 ?auto_178627 ) ) ( not ( = ?auto_178626 ?auto_178628 ) ) ( not ( = ?auto_178626 ?auto_178629 ) ) ( not ( = ?auto_178627 ?auto_178628 ) ) ( not ( = ?auto_178627 ?auto_178629 ) ) ( not ( = ?auto_178627 ?auto_178633 ) ) ( not ( = ?auto_178628 ?auto_178629 ) ) ( not ( = ?auto_178628 ?auto_178633 ) ) ( not ( = ?auto_178629 ?auto_178633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178633 ?auto_178626 ?auto_178625 )
      ( DELIVER-4PKG-VERIFY ?auto_178626 ?auto_178627 ?auto_178628 ?auto_178629 ?auto_178625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178777 - OBJ
      ?auto_178778 - OBJ
      ?auto_178779 - OBJ
      ?auto_178776 - LOCATION
    )
    :vars
    (
      ?auto_178781 - TRUCK
      ?auto_178782 - LOCATION
      ?auto_178780 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178781 ?auto_178782 ) ( IN-CITY ?auto_178782 ?auto_178780 ) ( IN-CITY ?auto_178776 ?auto_178780 ) ( not ( = ?auto_178776 ?auto_178782 ) ) ( OBJ-AT ?auto_178778 ?auto_178776 ) ( not ( = ?auto_178778 ?auto_178779 ) ) ( OBJ-AT ?auto_178779 ?auto_178782 ) ( OBJ-AT ?auto_178777 ?auto_178776 ) ( not ( = ?auto_178777 ?auto_178778 ) ) ( not ( = ?auto_178777 ?auto_178779 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178778 ?auto_178779 ?auto_178776 )
      ( DELIVER-3PKG-VERIFY ?auto_178777 ?auto_178778 ?auto_178779 ?auto_178776 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178810 - OBJ
      ?auto_178811 - OBJ
      ?auto_178812 - OBJ
      ?auto_178809 - LOCATION
    )
    :vars
    (
      ?auto_178814 - TRUCK
      ?auto_178815 - LOCATION
      ?auto_178813 - CITY
      ?auto_178816 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178814 ?auto_178815 ) ( IN-CITY ?auto_178815 ?auto_178813 ) ( IN-CITY ?auto_178809 ?auto_178813 ) ( not ( = ?auto_178809 ?auto_178815 ) ) ( OBJ-AT ?auto_178816 ?auto_178809 ) ( not ( = ?auto_178816 ?auto_178812 ) ) ( OBJ-AT ?auto_178812 ?auto_178815 ) ( OBJ-AT ?auto_178810 ?auto_178809 ) ( OBJ-AT ?auto_178811 ?auto_178809 ) ( not ( = ?auto_178810 ?auto_178811 ) ) ( not ( = ?auto_178810 ?auto_178812 ) ) ( not ( = ?auto_178810 ?auto_178816 ) ) ( not ( = ?auto_178811 ?auto_178812 ) ) ( not ( = ?auto_178811 ?auto_178816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178816 ?auto_178812 ?auto_178809 )
      ( DELIVER-3PKG-VERIFY ?auto_178810 ?auto_178811 ?auto_178812 ?auto_178809 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178822 - OBJ
      ?auto_178823 - OBJ
      ?auto_178824 - OBJ
      ?auto_178821 - LOCATION
    )
    :vars
    (
      ?auto_178826 - TRUCK
      ?auto_178827 - LOCATION
      ?auto_178825 - CITY
      ?auto_178828 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178826 ?auto_178827 ) ( IN-CITY ?auto_178827 ?auto_178825 ) ( IN-CITY ?auto_178821 ?auto_178825 ) ( not ( = ?auto_178821 ?auto_178827 ) ) ( OBJ-AT ?auto_178828 ?auto_178821 ) ( not ( = ?auto_178828 ?auto_178823 ) ) ( OBJ-AT ?auto_178823 ?auto_178827 ) ( OBJ-AT ?auto_178822 ?auto_178821 ) ( OBJ-AT ?auto_178824 ?auto_178821 ) ( not ( = ?auto_178822 ?auto_178823 ) ) ( not ( = ?auto_178822 ?auto_178824 ) ) ( not ( = ?auto_178822 ?auto_178828 ) ) ( not ( = ?auto_178823 ?auto_178824 ) ) ( not ( = ?auto_178824 ?auto_178828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178828 ?auto_178823 ?auto_178821 )
      ( DELIVER-3PKG-VERIFY ?auto_178822 ?auto_178823 ?auto_178824 ?auto_178821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178838 - OBJ
      ?auto_178839 - OBJ
      ?auto_178840 - OBJ
      ?auto_178837 - LOCATION
    )
    :vars
    (
      ?auto_178842 - TRUCK
      ?auto_178843 - LOCATION
      ?auto_178841 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178842 ?auto_178843 ) ( IN-CITY ?auto_178843 ?auto_178841 ) ( IN-CITY ?auto_178837 ?auto_178841 ) ( not ( = ?auto_178837 ?auto_178843 ) ) ( OBJ-AT ?auto_178839 ?auto_178837 ) ( not ( = ?auto_178839 ?auto_178838 ) ) ( OBJ-AT ?auto_178838 ?auto_178843 ) ( OBJ-AT ?auto_178840 ?auto_178837 ) ( not ( = ?auto_178838 ?auto_178840 ) ) ( not ( = ?auto_178839 ?auto_178840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178839 ?auto_178838 ?auto_178837 )
      ( DELIVER-3PKG-VERIFY ?auto_178838 ?auto_178839 ?auto_178840 ?auto_178837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_178860 - OBJ
      ?auto_178861 - OBJ
      ?auto_178862 - OBJ
      ?auto_178859 - LOCATION
    )
    :vars
    (
      ?auto_178864 - TRUCK
      ?auto_178865 - LOCATION
      ?auto_178863 - CITY
      ?auto_178866 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178864 ?auto_178865 ) ( IN-CITY ?auto_178865 ?auto_178863 ) ( IN-CITY ?auto_178859 ?auto_178863 ) ( not ( = ?auto_178859 ?auto_178865 ) ) ( OBJ-AT ?auto_178866 ?auto_178859 ) ( not ( = ?auto_178866 ?auto_178860 ) ) ( OBJ-AT ?auto_178860 ?auto_178865 ) ( OBJ-AT ?auto_178861 ?auto_178859 ) ( OBJ-AT ?auto_178862 ?auto_178859 ) ( not ( = ?auto_178860 ?auto_178861 ) ) ( not ( = ?auto_178860 ?auto_178862 ) ) ( not ( = ?auto_178861 ?auto_178862 ) ) ( not ( = ?auto_178861 ?auto_178866 ) ) ( not ( = ?auto_178862 ?auto_178866 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178866 ?auto_178860 ?auto_178859 )
      ( DELIVER-3PKG-VERIFY ?auto_178860 ?auto_178861 ?auto_178862 ?auto_178859 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178899 - OBJ
      ?auto_178900 - OBJ
      ?auto_178901 - OBJ
      ?auto_178902 - OBJ
      ?auto_178898 - LOCATION
    )
    :vars
    (
      ?auto_178904 - TRUCK
      ?auto_178905 - LOCATION
      ?auto_178903 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178904 ?auto_178905 ) ( IN-CITY ?auto_178905 ?auto_178903 ) ( IN-CITY ?auto_178898 ?auto_178903 ) ( not ( = ?auto_178898 ?auto_178905 ) ) ( OBJ-AT ?auto_178901 ?auto_178898 ) ( not ( = ?auto_178901 ?auto_178902 ) ) ( OBJ-AT ?auto_178902 ?auto_178905 ) ( OBJ-AT ?auto_178899 ?auto_178898 ) ( OBJ-AT ?auto_178900 ?auto_178898 ) ( not ( = ?auto_178899 ?auto_178900 ) ) ( not ( = ?auto_178899 ?auto_178901 ) ) ( not ( = ?auto_178899 ?auto_178902 ) ) ( not ( = ?auto_178900 ?auto_178901 ) ) ( not ( = ?auto_178900 ?auto_178902 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178901 ?auto_178902 ?auto_178898 )
      ( DELIVER-4PKG-VERIFY ?auto_178899 ?auto_178900 ?auto_178901 ?auto_178902 ?auto_178898 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178915 - OBJ
      ?auto_178916 - OBJ
      ?auto_178917 - OBJ
      ?auto_178918 - OBJ
      ?auto_178914 - LOCATION
    )
    :vars
    (
      ?auto_178920 - TRUCK
      ?auto_178921 - LOCATION
      ?auto_178919 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178920 ?auto_178921 ) ( IN-CITY ?auto_178921 ?auto_178919 ) ( IN-CITY ?auto_178914 ?auto_178919 ) ( not ( = ?auto_178914 ?auto_178921 ) ) ( OBJ-AT ?auto_178915 ?auto_178914 ) ( not ( = ?auto_178915 ?auto_178917 ) ) ( OBJ-AT ?auto_178917 ?auto_178921 ) ( OBJ-AT ?auto_178916 ?auto_178914 ) ( OBJ-AT ?auto_178918 ?auto_178914 ) ( not ( = ?auto_178915 ?auto_178916 ) ) ( not ( = ?auto_178915 ?auto_178918 ) ) ( not ( = ?auto_178916 ?auto_178917 ) ) ( not ( = ?auto_178916 ?auto_178918 ) ) ( not ( = ?auto_178917 ?auto_178918 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178915 ?auto_178917 ?auto_178914 )
      ( DELIVER-4PKG-VERIFY ?auto_178915 ?auto_178916 ?auto_178917 ?auto_178918 ?auto_178914 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_178979 - OBJ
      ?auto_178980 - OBJ
      ?auto_178981 - OBJ
      ?auto_178982 - OBJ
      ?auto_178978 - LOCATION
    )
    :vars
    (
      ?auto_178984 - TRUCK
      ?auto_178985 - LOCATION
      ?auto_178983 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_178984 ?auto_178985 ) ( IN-CITY ?auto_178985 ?auto_178983 ) ( IN-CITY ?auto_178978 ?auto_178983 ) ( not ( = ?auto_178978 ?auto_178985 ) ) ( OBJ-AT ?auto_178982 ?auto_178978 ) ( not ( = ?auto_178982 ?auto_178980 ) ) ( OBJ-AT ?auto_178980 ?auto_178985 ) ( OBJ-AT ?auto_178979 ?auto_178978 ) ( OBJ-AT ?auto_178981 ?auto_178978 ) ( not ( = ?auto_178979 ?auto_178980 ) ) ( not ( = ?auto_178979 ?auto_178981 ) ) ( not ( = ?auto_178979 ?auto_178982 ) ) ( not ( = ?auto_178980 ?auto_178981 ) ) ( not ( = ?auto_178981 ?auto_178982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178982 ?auto_178980 ?auto_178978 )
      ( DELIVER-4PKG-VERIFY ?auto_178979 ?auto_178980 ?auto_178981 ?auto_178982 ?auto_178978 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179011 - OBJ
      ?auto_179012 - OBJ
      ?auto_179013 - OBJ
      ?auto_179014 - OBJ
      ?auto_179010 - LOCATION
    )
    :vars
    (
      ?auto_179016 - TRUCK
      ?auto_179017 - LOCATION
      ?auto_179015 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179016 ?auto_179017 ) ( IN-CITY ?auto_179017 ?auto_179015 ) ( IN-CITY ?auto_179010 ?auto_179015 ) ( not ( = ?auto_179010 ?auto_179017 ) ) ( OBJ-AT ?auto_179011 ?auto_179010 ) ( not ( = ?auto_179011 ?auto_179012 ) ) ( OBJ-AT ?auto_179012 ?auto_179017 ) ( OBJ-AT ?auto_179013 ?auto_179010 ) ( OBJ-AT ?auto_179014 ?auto_179010 ) ( not ( = ?auto_179011 ?auto_179013 ) ) ( not ( = ?auto_179011 ?auto_179014 ) ) ( not ( = ?auto_179012 ?auto_179013 ) ) ( not ( = ?auto_179012 ?auto_179014 ) ) ( not ( = ?auto_179013 ?auto_179014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179011 ?auto_179012 ?auto_179010 )
      ( DELIVER-4PKG-VERIFY ?auto_179011 ?auto_179012 ?auto_179013 ?auto_179014 ?auto_179010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179059 - OBJ
      ?auto_179060 - OBJ
      ?auto_179061 - OBJ
      ?auto_179062 - OBJ
      ?auto_179058 - LOCATION
    )
    :vars
    (
      ?auto_179064 - TRUCK
      ?auto_179065 - LOCATION
      ?auto_179063 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179064 ?auto_179065 ) ( IN-CITY ?auto_179065 ?auto_179063 ) ( IN-CITY ?auto_179058 ?auto_179063 ) ( not ( = ?auto_179058 ?auto_179065 ) ) ( OBJ-AT ?auto_179060 ?auto_179058 ) ( not ( = ?auto_179060 ?auto_179062 ) ) ( OBJ-AT ?auto_179062 ?auto_179065 ) ( OBJ-AT ?auto_179059 ?auto_179058 ) ( OBJ-AT ?auto_179061 ?auto_179058 ) ( not ( = ?auto_179059 ?auto_179060 ) ) ( not ( = ?auto_179059 ?auto_179061 ) ) ( not ( = ?auto_179059 ?auto_179062 ) ) ( not ( = ?auto_179060 ?auto_179061 ) ) ( not ( = ?auto_179061 ?auto_179062 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179060 ?auto_179062 ?auto_179058 )
      ( DELIVER-4PKG-VERIFY ?auto_179059 ?auto_179060 ?auto_179061 ?auto_179062 ?auto_179058 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179067 - OBJ
      ?auto_179068 - OBJ
      ?auto_179069 - OBJ
      ?auto_179070 - OBJ
      ?auto_179066 - LOCATION
    )
    :vars
    (
      ?auto_179072 - TRUCK
      ?auto_179073 - LOCATION
      ?auto_179071 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179072 ?auto_179073 ) ( IN-CITY ?auto_179073 ?auto_179071 ) ( IN-CITY ?auto_179066 ?auto_179071 ) ( not ( = ?auto_179066 ?auto_179073 ) ) ( OBJ-AT ?auto_179070 ?auto_179066 ) ( not ( = ?auto_179070 ?auto_179069 ) ) ( OBJ-AT ?auto_179069 ?auto_179073 ) ( OBJ-AT ?auto_179067 ?auto_179066 ) ( OBJ-AT ?auto_179068 ?auto_179066 ) ( not ( = ?auto_179067 ?auto_179068 ) ) ( not ( = ?auto_179067 ?auto_179069 ) ) ( not ( = ?auto_179067 ?auto_179070 ) ) ( not ( = ?auto_179068 ?auto_179069 ) ) ( not ( = ?auto_179068 ?auto_179070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179070 ?auto_179069 ?auto_179066 )
      ( DELIVER-4PKG-VERIFY ?auto_179067 ?auto_179068 ?auto_179069 ?auto_179070 ?auto_179066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179099 - OBJ
      ?auto_179100 - OBJ
      ?auto_179101 - OBJ
      ?auto_179102 - OBJ
      ?auto_179098 - LOCATION
    )
    :vars
    (
      ?auto_179104 - TRUCK
      ?auto_179105 - LOCATION
      ?auto_179103 - CITY
      ?auto_179106 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179104 ?auto_179105 ) ( IN-CITY ?auto_179105 ?auto_179103 ) ( IN-CITY ?auto_179098 ?auto_179103 ) ( not ( = ?auto_179098 ?auto_179105 ) ) ( OBJ-AT ?auto_179106 ?auto_179098 ) ( not ( = ?auto_179106 ?auto_179102 ) ) ( OBJ-AT ?auto_179102 ?auto_179105 ) ( OBJ-AT ?auto_179099 ?auto_179098 ) ( OBJ-AT ?auto_179100 ?auto_179098 ) ( OBJ-AT ?auto_179101 ?auto_179098 ) ( not ( = ?auto_179099 ?auto_179100 ) ) ( not ( = ?auto_179099 ?auto_179101 ) ) ( not ( = ?auto_179099 ?auto_179102 ) ) ( not ( = ?auto_179099 ?auto_179106 ) ) ( not ( = ?auto_179100 ?auto_179101 ) ) ( not ( = ?auto_179100 ?auto_179102 ) ) ( not ( = ?auto_179100 ?auto_179106 ) ) ( not ( = ?auto_179101 ?auto_179102 ) ) ( not ( = ?auto_179101 ?auto_179106 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179106 ?auto_179102 ?auto_179098 )
      ( DELIVER-4PKG-VERIFY ?auto_179099 ?auto_179100 ?auto_179101 ?auto_179102 ?auto_179098 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179116 - OBJ
      ?auto_179117 - OBJ
      ?auto_179118 - OBJ
      ?auto_179119 - OBJ
      ?auto_179115 - LOCATION
    )
    :vars
    (
      ?auto_179121 - TRUCK
      ?auto_179122 - LOCATION
      ?auto_179120 - CITY
      ?auto_179123 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179121 ?auto_179122 ) ( IN-CITY ?auto_179122 ?auto_179120 ) ( IN-CITY ?auto_179115 ?auto_179120 ) ( not ( = ?auto_179115 ?auto_179122 ) ) ( OBJ-AT ?auto_179123 ?auto_179115 ) ( not ( = ?auto_179123 ?auto_179118 ) ) ( OBJ-AT ?auto_179118 ?auto_179122 ) ( OBJ-AT ?auto_179116 ?auto_179115 ) ( OBJ-AT ?auto_179117 ?auto_179115 ) ( OBJ-AT ?auto_179119 ?auto_179115 ) ( not ( = ?auto_179116 ?auto_179117 ) ) ( not ( = ?auto_179116 ?auto_179118 ) ) ( not ( = ?auto_179116 ?auto_179119 ) ) ( not ( = ?auto_179116 ?auto_179123 ) ) ( not ( = ?auto_179117 ?auto_179118 ) ) ( not ( = ?auto_179117 ?auto_179119 ) ) ( not ( = ?auto_179117 ?auto_179123 ) ) ( not ( = ?auto_179118 ?auto_179119 ) ) ( not ( = ?auto_179119 ?auto_179123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179123 ?auto_179118 ?auto_179115 )
      ( DELIVER-4PKG-VERIFY ?auto_179116 ?auto_179117 ?auto_179118 ?auto_179119 ?auto_179115 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179166 - OBJ
      ?auto_179167 - OBJ
      ?auto_179168 - OBJ
      ?auto_179169 - OBJ
      ?auto_179165 - LOCATION
    )
    :vars
    (
      ?auto_179171 - TRUCK
      ?auto_179172 - LOCATION
      ?auto_179170 - CITY
      ?auto_179173 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179171 ?auto_179172 ) ( IN-CITY ?auto_179172 ?auto_179170 ) ( IN-CITY ?auto_179165 ?auto_179170 ) ( not ( = ?auto_179165 ?auto_179172 ) ) ( OBJ-AT ?auto_179173 ?auto_179165 ) ( not ( = ?auto_179173 ?auto_179167 ) ) ( OBJ-AT ?auto_179167 ?auto_179172 ) ( OBJ-AT ?auto_179166 ?auto_179165 ) ( OBJ-AT ?auto_179168 ?auto_179165 ) ( OBJ-AT ?auto_179169 ?auto_179165 ) ( not ( = ?auto_179166 ?auto_179167 ) ) ( not ( = ?auto_179166 ?auto_179168 ) ) ( not ( = ?auto_179166 ?auto_179169 ) ) ( not ( = ?auto_179166 ?auto_179173 ) ) ( not ( = ?auto_179167 ?auto_179168 ) ) ( not ( = ?auto_179167 ?auto_179169 ) ) ( not ( = ?auto_179168 ?auto_179169 ) ) ( not ( = ?auto_179168 ?auto_179173 ) ) ( not ( = ?auto_179169 ?auto_179173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179173 ?auto_179167 ?auto_179165 )
      ( DELIVER-4PKG-VERIFY ?auto_179166 ?auto_179167 ?auto_179168 ?auto_179169 ?auto_179165 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179218 - OBJ
      ?auto_179219 - OBJ
      ?auto_179220 - OBJ
      ?auto_179221 - OBJ
      ?auto_179217 - LOCATION
    )
    :vars
    (
      ?auto_179223 - TRUCK
      ?auto_179224 - LOCATION
      ?auto_179222 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179223 ?auto_179224 ) ( IN-CITY ?auto_179224 ?auto_179222 ) ( IN-CITY ?auto_179217 ?auto_179222 ) ( not ( = ?auto_179217 ?auto_179224 ) ) ( OBJ-AT ?auto_179219 ?auto_179217 ) ( not ( = ?auto_179219 ?auto_179218 ) ) ( OBJ-AT ?auto_179218 ?auto_179224 ) ( OBJ-AT ?auto_179220 ?auto_179217 ) ( OBJ-AT ?auto_179221 ?auto_179217 ) ( not ( = ?auto_179218 ?auto_179220 ) ) ( not ( = ?auto_179218 ?auto_179221 ) ) ( not ( = ?auto_179219 ?auto_179220 ) ) ( not ( = ?auto_179219 ?auto_179221 ) ) ( not ( = ?auto_179220 ?auto_179221 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179219 ?auto_179218 ?auto_179217 )
      ( DELIVER-4PKG-VERIFY ?auto_179218 ?auto_179219 ?auto_179220 ?auto_179221 ?auto_179217 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179234 - OBJ
      ?auto_179235 - OBJ
      ?auto_179236 - OBJ
      ?auto_179237 - OBJ
      ?auto_179233 - LOCATION
    )
    :vars
    (
      ?auto_179239 - TRUCK
      ?auto_179240 - LOCATION
      ?auto_179238 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179239 ?auto_179240 ) ( IN-CITY ?auto_179240 ?auto_179238 ) ( IN-CITY ?auto_179233 ?auto_179238 ) ( not ( = ?auto_179233 ?auto_179240 ) ) ( OBJ-AT ?auto_179237 ?auto_179233 ) ( not ( = ?auto_179237 ?auto_179234 ) ) ( OBJ-AT ?auto_179234 ?auto_179240 ) ( OBJ-AT ?auto_179235 ?auto_179233 ) ( OBJ-AT ?auto_179236 ?auto_179233 ) ( not ( = ?auto_179234 ?auto_179235 ) ) ( not ( = ?auto_179234 ?auto_179236 ) ) ( not ( = ?auto_179235 ?auto_179236 ) ) ( not ( = ?auto_179235 ?auto_179237 ) ) ( not ( = ?auto_179236 ?auto_179237 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179237 ?auto_179234 ?auto_179233 )
      ( DELIVER-4PKG-VERIFY ?auto_179234 ?auto_179235 ?auto_179236 ?auto_179237 ?auto_179233 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179314 - OBJ
      ?auto_179315 - OBJ
      ?auto_179316 - OBJ
      ?auto_179317 - OBJ
      ?auto_179313 - LOCATION
    )
    :vars
    (
      ?auto_179319 - TRUCK
      ?auto_179320 - LOCATION
      ?auto_179318 - CITY
      ?auto_179321 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_179319 ?auto_179320 ) ( IN-CITY ?auto_179320 ?auto_179318 ) ( IN-CITY ?auto_179313 ?auto_179318 ) ( not ( = ?auto_179313 ?auto_179320 ) ) ( OBJ-AT ?auto_179321 ?auto_179313 ) ( not ( = ?auto_179321 ?auto_179314 ) ) ( OBJ-AT ?auto_179314 ?auto_179320 ) ( OBJ-AT ?auto_179315 ?auto_179313 ) ( OBJ-AT ?auto_179316 ?auto_179313 ) ( OBJ-AT ?auto_179317 ?auto_179313 ) ( not ( = ?auto_179314 ?auto_179315 ) ) ( not ( = ?auto_179314 ?auto_179316 ) ) ( not ( = ?auto_179314 ?auto_179317 ) ) ( not ( = ?auto_179315 ?auto_179316 ) ) ( not ( = ?auto_179315 ?auto_179317 ) ) ( not ( = ?auto_179315 ?auto_179321 ) ) ( not ( = ?auto_179316 ?auto_179317 ) ) ( not ( = ?auto_179316 ?auto_179321 ) ) ( not ( = ?auto_179317 ?auto_179321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179321 ?auto_179314 ?auto_179313 )
      ( DELIVER-4PKG-VERIFY ?auto_179314 ?auto_179315 ?auto_179316 ?auto_179317 ?auto_179313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179465 - OBJ
      ?auto_179466 - OBJ
      ?auto_179467 - OBJ
      ?auto_179464 - LOCATION
    )
    :vars
    (
      ?auto_179469 - LOCATION
      ?auto_179468 - CITY
      ?auto_179470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179469 ?auto_179468 ) ( IN-CITY ?auto_179464 ?auto_179468 ) ( not ( = ?auto_179464 ?auto_179469 ) ) ( OBJ-AT ?auto_179466 ?auto_179464 ) ( not ( = ?auto_179466 ?auto_179467 ) ) ( OBJ-AT ?auto_179467 ?auto_179469 ) ( TRUCK-AT ?auto_179470 ?auto_179464 ) ( OBJ-AT ?auto_179465 ?auto_179464 ) ( not ( = ?auto_179465 ?auto_179466 ) ) ( not ( = ?auto_179465 ?auto_179467 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179466 ?auto_179467 ?auto_179464 )
      ( DELIVER-3PKG-VERIFY ?auto_179465 ?auto_179466 ?auto_179467 ?auto_179464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179476 - OBJ
      ?auto_179477 - OBJ
      ?auto_179478 - OBJ
      ?auto_179475 - LOCATION
    )
    :vars
    (
      ?auto_179480 - LOCATION
      ?auto_179479 - CITY
      ?auto_179481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179480 ?auto_179479 ) ( IN-CITY ?auto_179475 ?auto_179479 ) ( not ( = ?auto_179475 ?auto_179480 ) ) ( OBJ-AT ?auto_179478 ?auto_179475 ) ( not ( = ?auto_179478 ?auto_179477 ) ) ( OBJ-AT ?auto_179477 ?auto_179480 ) ( TRUCK-AT ?auto_179481 ?auto_179475 ) ( OBJ-AT ?auto_179476 ?auto_179475 ) ( not ( = ?auto_179476 ?auto_179477 ) ) ( not ( = ?auto_179476 ?auto_179478 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179478 ?auto_179477 ?auto_179475 )
      ( DELIVER-3PKG-VERIFY ?auto_179476 ?auto_179477 ?auto_179478 ?auto_179475 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179498 - OBJ
      ?auto_179499 - OBJ
      ?auto_179500 - OBJ
      ?auto_179497 - LOCATION
    )
    :vars
    (
      ?auto_179503 - LOCATION
      ?auto_179502 - CITY
      ?auto_179501 - OBJ
      ?auto_179504 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179503 ?auto_179502 ) ( IN-CITY ?auto_179497 ?auto_179502 ) ( not ( = ?auto_179497 ?auto_179503 ) ) ( OBJ-AT ?auto_179501 ?auto_179497 ) ( not ( = ?auto_179501 ?auto_179500 ) ) ( OBJ-AT ?auto_179500 ?auto_179503 ) ( TRUCK-AT ?auto_179504 ?auto_179497 ) ( OBJ-AT ?auto_179498 ?auto_179497 ) ( OBJ-AT ?auto_179499 ?auto_179497 ) ( not ( = ?auto_179498 ?auto_179499 ) ) ( not ( = ?auto_179498 ?auto_179500 ) ) ( not ( = ?auto_179498 ?auto_179501 ) ) ( not ( = ?auto_179499 ?auto_179500 ) ) ( not ( = ?auto_179499 ?auto_179501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179501 ?auto_179500 ?auto_179497 )
      ( DELIVER-3PKG-VERIFY ?auto_179498 ?auto_179499 ?auto_179500 ?auto_179497 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179510 - OBJ
      ?auto_179511 - OBJ
      ?auto_179512 - OBJ
      ?auto_179509 - LOCATION
    )
    :vars
    (
      ?auto_179515 - LOCATION
      ?auto_179514 - CITY
      ?auto_179513 - OBJ
      ?auto_179516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179515 ?auto_179514 ) ( IN-CITY ?auto_179509 ?auto_179514 ) ( not ( = ?auto_179509 ?auto_179515 ) ) ( OBJ-AT ?auto_179513 ?auto_179509 ) ( not ( = ?auto_179513 ?auto_179511 ) ) ( OBJ-AT ?auto_179511 ?auto_179515 ) ( TRUCK-AT ?auto_179516 ?auto_179509 ) ( OBJ-AT ?auto_179510 ?auto_179509 ) ( OBJ-AT ?auto_179512 ?auto_179509 ) ( not ( = ?auto_179510 ?auto_179511 ) ) ( not ( = ?auto_179510 ?auto_179512 ) ) ( not ( = ?auto_179510 ?auto_179513 ) ) ( not ( = ?auto_179511 ?auto_179512 ) ) ( not ( = ?auto_179512 ?auto_179513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179513 ?auto_179511 ?auto_179509 )
      ( DELIVER-3PKG-VERIFY ?auto_179510 ?auto_179511 ?auto_179512 ?auto_179509 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179526 - OBJ
      ?auto_179527 - OBJ
      ?auto_179528 - OBJ
      ?auto_179525 - LOCATION
    )
    :vars
    (
      ?auto_179530 - LOCATION
      ?auto_179529 - CITY
      ?auto_179531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179530 ?auto_179529 ) ( IN-CITY ?auto_179525 ?auto_179529 ) ( not ( = ?auto_179525 ?auto_179530 ) ) ( OBJ-AT ?auto_179528 ?auto_179525 ) ( not ( = ?auto_179528 ?auto_179526 ) ) ( OBJ-AT ?auto_179526 ?auto_179530 ) ( TRUCK-AT ?auto_179531 ?auto_179525 ) ( OBJ-AT ?auto_179527 ?auto_179525 ) ( not ( = ?auto_179526 ?auto_179527 ) ) ( not ( = ?auto_179527 ?auto_179528 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179528 ?auto_179526 ?auto_179525 )
      ( DELIVER-3PKG-VERIFY ?auto_179526 ?auto_179527 ?auto_179528 ?auto_179525 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179548 - OBJ
      ?auto_179549 - OBJ
      ?auto_179550 - OBJ
      ?auto_179547 - LOCATION
    )
    :vars
    (
      ?auto_179553 - LOCATION
      ?auto_179552 - CITY
      ?auto_179551 - OBJ
      ?auto_179554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179553 ?auto_179552 ) ( IN-CITY ?auto_179547 ?auto_179552 ) ( not ( = ?auto_179547 ?auto_179553 ) ) ( OBJ-AT ?auto_179551 ?auto_179547 ) ( not ( = ?auto_179551 ?auto_179548 ) ) ( OBJ-AT ?auto_179548 ?auto_179553 ) ( TRUCK-AT ?auto_179554 ?auto_179547 ) ( OBJ-AT ?auto_179549 ?auto_179547 ) ( OBJ-AT ?auto_179550 ?auto_179547 ) ( not ( = ?auto_179548 ?auto_179549 ) ) ( not ( = ?auto_179548 ?auto_179550 ) ) ( not ( = ?auto_179549 ?auto_179550 ) ) ( not ( = ?auto_179549 ?auto_179551 ) ) ( not ( = ?auto_179550 ?auto_179551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179551 ?auto_179548 ?auto_179547 )
      ( DELIVER-3PKG-VERIFY ?auto_179548 ?auto_179549 ?auto_179550 ?auto_179547 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179595 - OBJ
      ?auto_179596 - OBJ
      ?auto_179597 - OBJ
      ?auto_179598 - OBJ
      ?auto_179594 - LOCATION
    )
    :vars
    (
      ?auto_179600 - LOCATION
      ?auto_179599 - CITY
      ?auto_179601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179600 ?auto_179599 ) ( IN-CITY ?auto_179594 ?auto_179599 ) ( not ( = ?auto_179594 ?auto_179600 ) ) ( OBJ-AT ?auto_179595 ?auto_179594 ) ( not ( = ?auto_179595 ?auto_179598 ) ) ( OBJ-AT ?auto_179598 ?auto_179600 ) ( TRUCK-AT ?auto_179601 ?auto_179594 ) ( OBJ-AT ?auto_179596 ?auto_179594 ) ( OBJ-AT ?auto_179597 ?auto_179594 ) ( not ( = ?auto_179595 ?auto_179596 ) ) ( not ( = ?auto_179595 ?auto_179597 ) ) ( not ( = ?auto_179596 ?auto_179597 ) ) ( not ( = ?auto_179596 ?auto_179598 ) ) ( not ( = ?auto_179597 ?auto_179598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179595 ?auto_179598 ?auto_179594 )
      ( DELIVER-4PKG-VERIFY ?auto_179595 ?auto_179596 ?auto_179597 ?auto_179598 ?auto_179594 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179603 - OBJ
      ?auto_179604 - OBJ
      ?auto_179605 - OBJ
      ?auto_179606 - OBJ
      ?auto_179602 - LOCATION
    )
    :vars
    (
      ?auto_179608 - LOCATION
      ?auto_179607 - CITY
      ?auto_179609 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179608 ?auto_179607 ) ( IN-CITY ?auto_179602 ?auto_179607 ) ( not ( = ?auto_179602 ?auto_179608 ) ) ( OBJ-AT ?auto_179606 ?auto_179602 ) ( not ( = ?auto_179606 ?auto_179605 ) ) ( OBJ-AT ?auto_179605 ?auto_179608 ) ( TRUCK-AT ?auto_179609 ?auto_179602 ) ( OBJ-AT ?auto_179603 ?auto_179602 ) ( OBJ-AT ?auto_179604 ?auto_179602 ) ( not ( = ?auto_179603 ?auto_179604 ) ) ( not ( = ?auto_179603 ?auto_179605 ) ) ( not ( = ?auto_179603 ?auto_179606 ) ) ( not ( = ?auto_179604 ?auto_179605 ) ) ( not ( = ?auto_179604 ?auto_179606 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179606 ?auto_179605 ?auto_179602 )
      ( DELIVER-4PKG-VERIFY ?auto_179603 ?auto_179604 ?auto_179605 ?auto_179606 ?auto_179602 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179611 - OBJ
      ?auto_179612 - OBJ
      ?auto_179613 - OBJ
      ?auto_179614 - OBJ
      ?auto_179610 - LOCATION
    )
    :vars
    (
      ?auto_179616 - LOCATION
      ?auto_179615 - CITY
      ?auto_179617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179616 ?auto_179615 ) ( IN-CITY ?auto_179610 ?auto_179615 ) ( not ( = ?auto_179610 ?auto_179616 ) ) ( OBJ-AT ?auto_179611 ?auto_179610 ) ( not ( = ?auto_179611 ?auto_179613 ) ) ( OBJ-AT ?auto_179613 ?auto_179616 ) ( TRUCK-AT ?auto_179617 ?auto_179610 ) ( OBJ-AT ?auto_179612 ?auto_179610 ) ( OBJ-AT ?auto_179614 ?auto_179610 ) ( not ( = ?auto_179611 ?auto_179612 ) ) ( not ( = ?auto_179611 ?auto_179614 ) ) ( not ( = ?auto_179612 ?auto_179613 ) ) ( not ( = ?auto_179612 ?auto_179614 ) ) ( not ( = ?auto_179613 ?auto_179614 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179611 ?auto_179613 ?auto_179610 )
      ( DELIVER-4PKG-VERIFY ?auto_179611 ?auto_179612 ?auto_179613 ?auto_179614 ?auto_179610 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179667 - OBJ
      ?auto_179668 - OBJ
      ?auto_179669 - OBJ
      ?auto_179670 - OBJ
      ?auto_179666 - LOCATION
    )
    :vars
    (
      ?auto_179672 - LOCATION
      ?auto_179671 - CITY
      ?auto_179673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179672 ?auto_179671 ) ( IN-CITY ?auto_179666 ?auto_179671 ) ( not ( = ?auto_179666 ?auto_179672 ) ) ( OBJ-AT ?auto_179667 ?auto_179666 ) ( not ( = ?auto_179667 ?auto_179668 ) ) ( OBJ-AT ?auto_179668 ?auto_179672 ) ( TRUCK-AT ?auto_179673 ?auto_179666 ) ( OBJ-AT ?auto_179669 ?auto_179666 ) ( OBJ-AT ?auto_179670 ?auto_179666 ) ( not ( = ?auto_179667 ?auto_179669 ) ) ( not ( = ?auto_179667 ?auto_179670 ) ) ( not ( = ?auto_179668 ?auto_179669 ) ) ( not ( = ?auto_179668 ?auto_179670 ) ) ( not ( = ?auto_179669 ?auto_179670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179667 ?auto_179668 ?auto_179666 )
      ( DELIVER-4PKG-VERIFY ?auto_179667 ?auto_179668 ?auto_179669 ?auto_179670 ?auto_179666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179675 - OBJ
      ?auto_179676 - OBJ
      ?auto_179677 - OBJ
      ?auto_179678 - OBJ
      ?auto_179674 - LOCATION
    )
    :vars
    (
      ?auto_179680 - LOCATION
      ?auto_179679 - CITY
      ?auto_179681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179680 ?auto_179679 ) ( IN-CITY ?auto_179674 ?auto_179679 ) ( not ( = ?auto_179674 ?auto_179680 ) ) ( OBJ-AT ?auto_179677 ?auto_179674 ) ( not ( = ?auto_179677 ?auto_179676 ) ) ( OBJ-AT ?auto_179676 ?auto_179680 ) ( TRUCK-AT ?auto_179681 ?auto_179674 ) ( OBJ-AT ?auto_179675 ?auto_179674 ) ( OBJ-AT ?auto_179678 ?auto_179674 ) ( not ( = ?auto_179675 ?auto_179676 ) ) ( not ( = ?auto_179675 ?auto_179677 ) ) ( not ( = ?auto_179675 ?auto_179678 ) ) ( not ( = ?auto_179676 ?auto_179678 ) ) ( not ( = ?auto_179677 ?auto_179678 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179677 ?auto_179676 ?auto_179674 )
      ( DELIVER-4PKG-VERIFY ?auto_179675 ?auto_179676 ?auto_179677 ?auto_179678 ?auto_179674 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179739 - OBJ
      ?auto_179740 - OBJ
      ?auto_179741 - OBJ
      ?auto_179742 - OBJ
      ?auto_179738 - LOCATION
    )
    :vars
    (
      ?auto_179744 - LOCATION
      ?auto_179743 - CITY
      ?auto_179745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179744 ?auto_179743 ) ( IN-CITY ?auto_179738 ?auto_179743 ) ( not ( = ?auto_179738 ?auto_179744 ) ) ( OBJ-AT ?auto_179740 ?auto_179738 ) ( not ( = ?auto_179740 ?auto_179742 ) ) ( OBJ-AT ?auto_179742 ?auto_179744 ) ( TRUCK-AT ?auto_179745 ?auto_179738 ) ( OBJ-AT ?auto_179739 ?auto_179738 ) ( OBJ-AT ?auto_179741 ?auto_179738 ) ( not ( = ?auto_179739 ?auto_179740 ) ) ( not ( = ?auto_179739 ?auto_179741 ) ) ( not ( = ?auto_179739 ?auto_179742 ) ) ( not ( = ?auto_179740 ?auto_179741 ) ) ( not ( = ?auto_179741 ?auto_179742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179740 ?auto_179742 ?auto_179738 )
      ( DELIVER-4PKG-VERIFY ?auto_179739 ?auto_179740 ?auto_179741 ?auto_179742 ?auto_179738 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179787 - OBJ
      ?auto_179788 - OBJ
      ?auto_179789 - OBJ
      ?auto_179790 - OBJ
      ?auto_179786 - LOCATION
    )
    :vars
    (
      ?auto_179793 - LOCATION
      ?auto_179792 - CITY
      ?auto_179791 - OBJ
      ?auto_179794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179793 ?auto_179792 ) ( IN-CITY ?auto_179786 ?auto_179792 ) ( not ( = ?auto_179786 ?auto_179793 ) ) ( OBJ-AT ?auto_179791 ?auto_179786 ) ( not ( = ?auto_179791 ?auto_179790 ) ) ( OBJ-AT ?auto_179790 ?auto_179793 ) ( TRUCK-AT ?auto_179794 ?auto_179786 ) ( OBJ-AT ?auto_179787 ?auto_179786 ) ( OBJ-AT ?auto_179788 ?auto_179786 ) ( OBJ-AT ?auto_179789 ?auto_179786 ) ( not ( = ?auto_179787 ?auto_179788 ) ) ( not ( = ?auto_179787 ?auto_179789 ) ) ( not ( = ?auto_179787 ?auto_179790 ) ) ( not ( = ?auto_179787 ?auto_179791 ) ) ( not ( = ?auto_179788 ?auto_179789 ) ) ( not ( = ?auto_179788 ?auto_179790 ) ) ( not ( = ?auto_179788 ?auto_179791 ) ) ( not ( = ?auto_179789 ?auto_179790 ) ) ( not ( = ?auto_179789 ?auto_179791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179791 ?auto_179790 ?auto_179786 )
      ( DELIVER-4PKG-VERIFY ?auto_179787 ?auto_179788 ?auto_179789 ?auto_179790 ?auto_179786 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179804 - OBJ
      ?auto_179805 - OBJ
      ?auto_179806 - OBJ
      ?auto_179807 - OBJ
      ?auto_179803 - LOCATION
    )
    :vars
    (
      ?auto_179810 - LOCATION
      ?auto_179809 - CITY
      ?auto_179808 - OBJ
      ?auto_179811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179810 ?auto_179809 ) ( IN-CITY ?auto_179803 ?auto_179809 ) ( not ( = ?auto_179803 ?auto_179810 ) ) ( OBJ-AT ?auto_179808 ?auto_179803 ) ( not ( = ?auto_179808 ?auto_179806 ) ) ( OBJ-AT ?auto_179806 ?auto_179810 ) ( TRUCK-AT ?auto_179811 ?auto_179803 ) ( OBJ-AT ?auto_179804 ?auto_179803 ) ( OBJ-AT ?auto_179805 ?auto_179803 ) ( OBJ-AT ?auto_179807 ?auto_179803 ) ( not ( = ?auto_179804 ?auto_179805 ) ) ( not ( = ?auto_179804 ?auto_179806 ) ) ( not ( = ?auto_179804 ?auto_179807 ) ) ( not ( = ?auto_179804 ?auto_179808 ) ) ( not ( = ?auto_179805 ?auto_179806 ) ) ( not ( = ?auto_179805 ?auto_179807 ) ) ( not ( = ?auto_179805 ?auto_179808 ) ) ( not ( = ?auto_179806 ?auto_179807 ) ) ( not ( = ?auto_179807 ?auto_179808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179808 ?auto_179806 ?auto_179803 )
      ( DELIVER-4PKG-VERIFY ?auto_179804 ?auto_179805 ?auto_179806 ?auto_179807 ?auto_179803 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179854 - OBJ
      ?auto_179855 - OBJ
      ?auto_179856 - OBJ
      ?auto_179857 - OBJ
      ?auto_179853 - LOCATION
    )
    :vars
    (
      ?auto_179860 - LOCATION
      ?auto_179859 - CITY
      ?auto_179858 - OBJ
      ?auto_179861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179860 ?auto_179859 ) ( IN-CITY ?auto_179853 ?auto_179859 ) ( not ( = ?auto_179853 ?auto_179860 ) ) ( OBJ-AT ?auto_179858 ?auto_179853 ) ( not ( = ?auto_179858 ?auto_179855 ) ) ( OBJ-AT ?auto_179855 ?auto_179860 ) ( TRUCK-AT ?auto_179861 ?auto_179853 ) ( OBJ-AT ?auto_179854 ?auto_179853 ) ( OBJ-AT ?auto_179856 ?auto_179853 ) ( OBJ-AT ?auto_179857 ?auto_179853 ) ( not ( = ?auto_179854 ?auto_179855 ) ) ( not ( = ?auto_179854 ?auto_179856 ) ) ( not ( = ?auto_179854 ?auto_179857 ) ) ( not ( = ?auto_179854 ?auto_179858 ) ) ( not ( = ?auto_179855 ?auto_179856 ) ) ( not ( = ?auto_179855 ?auto_179857 ) ) ( not ( = ?auto_179856 ?auto_179857 ) ) ( not ( = ?auto_179856 ?auto_179858 ) ) ( not ( = ?auto_179857 ?auto_179858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179858 ?auto_179855 ?auto_179853 )
      ( DELIVER-4PKG-VERIFY ?auto_179854 ?auto_179855 ?auto_179856 ?auto_179857 ?auto_179853 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179898 - OBJ
      ?auto_179899 - OBJ
      ?auto_179900 - OBJ
      ?auto_179901 - OBJ
      ?auto_179897 - LOCATION
    )
    :vars
    (
      ?auto_179903 - LOCATION
      ?auto_179902 - CITY
      ?auto_179904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179903 ?auto_179902 ) ( IN-CITY ?auto_179897 ?auto_179902 ) ( not ( = ?auto_179897 ?auto_179903 ) ) ( OBJ-AT ?auto_179899 ?auto_179897 ) ( not ( = ?auto_179899 ?auto_179898 ) ) ( OBJ-AT ?auto_179898 ?auto_179903 ) ( TRUCK-AT ?auto_179904 ?auto_179897 ) ( OBJ-AT ?auto_179900 ?auto_179897 ) ( OBJ-AT ?auto_179901 ?auto_179897 ) ( not ( = ?auto_179898 ?auto_179900 ) ) ( not ( = ?auto_179898 ?auto_179901 ) ) ( not ( = ?auto_179899 ?auto_179900 ) ) ( not ( = ?auto_179899 ?auto_179901 ) ) ( not ( = ?auto_179900 ?auto_179901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179899 ?auto_179898 ?auto_179897 )
      ( DELIVER-4PKG-VERIFY ?auto_179898 ?auto_179899 ?auto_179900 ?auto_179901 ?auto_179897 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179906 - OBJ
      ?auto_179907 - OBJ
      ?auto_179908 - OBJ
      ?auto_179909 - OBJ
      ?auto_179905 - LOCATION
    )
    :vars
    (
      ?auto_179911 - LOCATION
      ?auto_179910 - CITY
      ?auto_179912 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179911 ?auto_179910 ) ( IN-CITY ?auto_179905 ?auto_179910 ) ( not ( = ?auto_179905 ?auto_179911 ) ) ( OBJ-AT ?auto_179908 ?auto_179905 ) ( not ( = ?auto_179908 ?auto_179906 ) ) ( OBJ-AT ?auto_179906 ?auto_179911 ) ( TRUCK-AT ?auto_179912 ?auto_179905 ) ( OBJ-AT ?auto_179907 ?auto_179905 ) ( OBJ-AT ?auto_179909 ?auto_179905 ) ( not ( = ?auto_179906 ?auto_179907 ) ) ( not ( = ?auto_179906 ?auto_179909 ) ) ( not ( = ?auto_179907 ?auto_179908 ) ) ( not ( = ?auto_179907 ?auto_179909 ) ) ( not ( = ?auto_179908 ?auto_179909 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179908 ?auto_179906 ?auto_179905 )
      ( DELIVER-4PKG-VERIFY ?auto_179906 ?auto_179907 ?auto_179908 ?auto_179909 ?auto_179905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180002 - OBJ
      ?auto_180003 - OBJ
      ?auto_180004 - OBJ
      ?auto_180005 - OBJ
      ?auto_180001 - LOCATION
    )
    :vars
    (
      ?auto_180008 - LOCATION
      ?auto_180007 - CITY
      ?auto_180006 - OBJ
      ?auto_180009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180008 ?auto_180007 ) ( IN-CITY ?auto_180001 ?auto_180007 ) ( not ( = ?auto_180001 ?auto_180008 ) ) ( OBJ-AT ?auto_180006 ?auto_180001 ) ( not ( = ?auto_180006 ?auto_180002 ) ) ( OBJ-AT ?auto_180002 ?auto_180008 ) ( TRUCK-AT ?auto_180009 ?auto_180001 ) ( OBJ-AT ?auto_180003 ?auto_180001 ) ( OBJ-AT ?auto_180004 ?auto_180001 ) ( OBJ-AT ?auto_180005 ?auto_180001 ) ( not ( = ?auto_180002 ?auto_180003 ) ) ( not ( = ?auto_180002 ?auto_180004 ) ) ( not ( = ?auto_180002 ?auto_180005 ) ) ( not ( = ?auto_180003 ?auto_180004 ) ) ( not ( = ?auto_180003 ?auto_180005 ) ) ( not ( = ?auto_180003 ?auto_180006 ) ) ( not ( = ?auto_180004 ?auto_180005 ) ) ( not ( = ?auto_180004 ?auto_180006 ) ) ( not ( = ?auto_180005 ?auto_180006 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180006 ?auto_180002 ?auto_180001 )
      ( DELIVER-4PKG-VERIFY ?auto_180002 ?auto_180003 ?auto_180004 ?auto_180005 ?auto_180001 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_180826 - OBJ
      ?auto_180825 - LOCATION
    )
    :vars
    (
      ?auto_180828 - LOCATION
      ?auto_180830 - CITY
      ?auto_180827 - OBJ
      ?auto_180829 - TRUCK
      ?auto_180831 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180828 ?auto_180830 ) ( IN-CITY ?auto_180825 ?auto_180830 ) ( not ( = ?auto_180825 ?auto_180828 ) ) ( OBJ-AT ?auto_180827 ?auto_180825 ) ( not ( = ?auto_180827 ?auto_180826 ) ) ( OBJ-AT ?auto_180826 ?auto_180828 ) ( TRUCK-AT ?auto_180829 ?auto_180831 ) ( IN-CITY ?auto_180831 ?auto_180830 ) ( not ( = ?auto_180825 ?auto_180831 ) ) ( not ( = ?auto_180828 ?auto_180831 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_180829 ?auto_180831 ?auto_180825 ?auto_180830 )
      ( DELIVER-2PKG ?auto_180827 ?auto_180826 ?auto_180825 )
      ( DELIVER-1PKG-VERIFY ?auto_180826 ?auto_180825 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180833 - OBJ
      ?auto_180834 - OBJ
      ?auto_180832 - LOCATION
    )
    :vars
    (
      ?auto_180838 - LOCATION
      ?auto_180836 - CITY
      ?auto_180835 - TRUCK
      ?auto_180837 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180838 ?auto_180836 ) ( IN-CITY ?auto_180832 ?auto_180836 ) ( not ( = ?auto_180832 ?auto_180838 ) ) ( OBJ-AT ?auto_180833 ?auto_180832 ) ( not ( = ?auto_180833 ?auto_180834 ) ) ( OBJ-AT ?auto_180834 ?auto_180838 ) ( TRUCK-AT ?auto_180835 ?auto_180837 ) ( IN-CITY ?auto_180837 ?auto_180836 ) ( not ( = ?auto_180832 ?auto_180837 ) ) ( not ( = ?auto_180838 ?auto_180837 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_180834 ?auto_180832 )
      ( DELIVER-2PKG-VERIFY ?auto_180833 ?auto_180834 ?auto_180832 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_180848 - OBJ
      ?auto_180849 - OBJ
      ?auto_180847 - LOCATION
    )
    :vars
    (
      ?auto_180853 - LOCATION
      ?auto_180850 - CITY
      ?auto_180852 - TRUCK
      ?auto_180851 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180853 ?auto_180850 ) ( IN-CITY ?auto_180847 ?auto_180850 ) ( not ( = ?auto_180847 ?auto_180853 ) ) ( OBJ-AT ?auto_180849 ?auto_180847 ) ( not ( = ?auto_180849 ?auto_180848 ) ) ( OBJ-AT ?auto_180848 ?auto_180853 ) ( TRUCK-AT ?auto_180852 ?auto_180851 ) ( IN-CITY ?auto_180851 ?auto_180850 ) ( not ( = ?auto_180847 ?auto_180851 ) ) ( not ( = ?auto_180853 ?auto_180851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180849 ?auto_180848 ?auto_180847 )
      ( DELIVER-2PKG-VERIFY ?auto_180848 ?auto_180849 ?auto_180847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180871 - OBJ
      ?auto_180872 - OBJ
      ?auto_180873 - OBJ
      ?auto_180870 - LOCATION
    )
    :vars
    (
      ?auto_180877 - LOCATION
      ?auto_180874 - CITY
      ?auto_180876 - TRUCK
      ?auto_180875 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180877 ?auto_180874 ) ( IN-CITY ?auto_180870 ?auto_180874 ) ( not ( = ?auto_180870 ?auto_180877 ) ) ( OBJ-AT ?auto_180872 ?auto_180870 ) ( not ( = ?auto_180872 ?auto_180873 ) ) ( OBJ-AT ?auto_180873 ?auto_180877 ) ( TRUCK-AT ?auto_180876 ?auto_180875 ) ( IN-CITY ?auto_180875 ?auto_180874 ) ( not ( = ?auto_180870 ?auto_180875 ) ) ( not ( = ?auto_180877 ?auto_180875 ) ) ( OBJ-AT ?auto_180871 ?auto_180870 ) ( not ( = ?auto_180871 ?auto_180872 ) ) ( not ( = ?auto_180871 ?auto_180873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180872 ?auto_180873 ?auto_180870 )
      ( DELIVER-3PKG-VERIFY ?auto_180871 ?auto_180872 ?auto_180873 ?auto_180870 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180887 - OBJ
      ?auto_180888 - OBJ
      ?auto_180889 - OBJ
      ?auto_180886 - LOCATION
    )
    :vars
    (
      ?auto_180893 - LOCATION
      ?auto_180890 - CITY
      ?auto_180892 - TRUCK
      ?auto_180891 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180893 ?auto_180890 ) ( IN-CITY ?auto_180886 ?auto_180890 ) ( not ( = ?auto_180886 ?auto_180893 ) ) ( OBJ-AT ?auto_180889 ?auto_180886 ) ( not ( = ?auto_180889 ?auto_180888 ) ) ( OBJ-AT ?auto_180888 ?auto_180893 ) ( TRUCK-AT ?auto_180892 ?auto_180891 ) ( IN-CITY ?auto_180891 ?auto_180890 ) ( not ( = ?auto_180886 ?auto_180891 ) ) ( not ( = ?auto_180893 ?auto_180891 ) ) ( OBJ-AT ?auto_180887 ?auto_180886 ) ( not ( = ?auto_180887 ?auto_180888 ) ) ( not ( = ?auto_180887 ?auto_180889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180889 ?auto_180888 ?auto_180886 )
      ( DELIVER-3PKG-VERIFY ?auto_180887 ?auto_180888 ?auto_180889 ?auto_180886 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180954 - OBJ
      ?auto_180955 - OBJ
      ?auto_180956 - OBJ
      ?auto_180953 - LOCATION
    )
    :vars
    (
      ?auto_180960 - LOCATION
      ?auto_180957 - CITY
      ?auto_180959 - TRUCK
      ?auto_180958 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_180960 ?auto_180957 ) ( IN-CITY ?auto_180953 ?auto_180957 ) ( not ( = ?auto_180953 ?auto_180960 ) ) ( OBJ-AT ?auto_180956 ?auto_180953 ) ( not ( = ?auto_180956 ?auto_180954 ) ) ( OBJ-AT ?auto_180954 ?auto_180960 ) ( TRUCK-AT ?auto_180959 ?auto_180958 ) ( IN-CITY ?auto_180958 ?auto_180957 ) ( not ( = ?auto_180953 ?auto_180958 ) ) ( not ( = ?auto_180960 ?auto_180958 ) ) ( OBJ-AT ?auto_180955 ?auto_180953 ) ( not ( = ?auto_180954 ?auto_180955 ) ) ( not ( = ?auto_180955 ?auto_180956 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180956 ?auto_180954 ?auto_180953 )
      ( DELIVER-3PKG-VERIFY ?auto_180954 ?auto_180955 ?auto_180956 ?auto_180953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181030 - OBJ
      ?auto_181031 - OBJ
      ?auto_181032 - OBJ
      ?auto_181033 - OBJ
      ?auto_181029 - LOCATION
    )
    :vars
    (
      ?auto_181037 - LOCATION
      ?auto_181034 - CITY
      ?auto_181036 - TRUCK
      ?auto_181035 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181037 ?auto_181034 ) ( IN-CITY ?auto_181029 ?auto_181034 ) ( not ( = ?auto_181029 ?auto_181037 ) ) ( OBJ-AT ?auto_181030 ?auto_181029 ) ( not ( = ?auto_181030 ?auto_181033 ) ) ( OBJ-AT ?auto_181033 ?auto_181037 ) ( TRUCK-AT ?auto_181036 ?auto_181035 ) ( IN-CITY ?auto_181035 ?auto_181034 ) ( not ( = ?auto_181029 ?auto_181035 ) ) ( not ( = ?auto_181037 ?auto_181035 ) ) ( OBJ-AT ?auto_181031 ?auto_181029 ) ( OBJ-AT ?auto_181032 ?auto_181029 ) ( not ( = ?auto_181030 ?auto_181031 ) ) ( not ( = ?auto_181030 ?auto_181032 ) ) ( not ( = ?auto_181031 ?auto_181032 ) ) ( not ( = ?auto_181031 ?auto_181033 ) ) ( not ( = ?auto_181032 ?auto_181033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181030 ?auto_181033 ?auto_181029 )
      ( DELIVER-4PKG-VERIFY ?auto_181030 ?auto_181031 ?auto_181032 ?auto_181033 ?auto_181029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181048 - OBJ
      ?auto_181049 - OBJ
      ?auto_181050 - OBJ
      ?auto_181051 - OBJ
      ?auto_181047 - LOCATION
    )
    :vars
    (
      ?auto_181055 - LOCATION
      ?auto_181052 - CITY
      ?auto_181054 - TRUCK
      ?auto_181053 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181055 ?auto_181052 ) ( IN-CITY ?auto_181047 ?auto_181052 ) ( not ( = ?auto_181047 ?auto_181055 ) ) ( OBJ-AT ?auto_181048 ?auto_181047 ) ( not ( = ?auto_181048 ?auto_181050 ) ) ( OBJ-AT ?auto_181050 ?auto_181055 ) ( TRUCK-AT ?auto_181054 ?auto_181053 ) ( IN-CITY ?auto_181053 ?auto_181052 ) ( not ( = ?auto_181047 ?auto_181053 ) ) ( not ( = ?auto_181055 ?auto_181053 ) ) ( OBJ-AT ?auto_181049 ?auto_181047 ) ( OBJ-AT ?auto_181051 ?auto_181047 ) ( not ( = ?auto_181048 ?auto_181049 ) ) ( not ( = ?auto_181048 ?auto_181051 ) ) ( not ( = ?auto_181049 ?auto_181050 ) ) ( not ( = ?auto_181049 ?auto_181051 ) ) ( not ( = ?auto_181050 ?auto_181051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181048 ?auto_181050 ?auto_181047 )
      ( DELIVER-4PKG-VERIFY ?auto_181048 ?auto_181049 ?auto_181050 ?auto_181051 ?auto_181047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181120 - OBJ
      ?auto_181121 - OBJ
      ?auto_181122 - OBJ
      ?auto_181123 - OBJ
      ?auto_181119 - LOCATION
    )
    :vars
    (
      ?auto_181127 - LOCATION
      ?auto_181124 - CITY
      ?auto_181126 - TRUCK
      ?auto_181125 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181127 ?auto_181124 ) ( IN-CITY ?auto_181119 ?auto_181124 ) ( not ( = ?auto_181119 ?auto_181127 ) ) ( OBJ-AT ?auto_181120 ?auto_181119 ) ( not ( = ?auto_181120 ?auto_181121 ) ) ( OBJ-AT ?auto_181121 ?auto_181127 ) ( TRUCK-AT ?auto_181126 ?auto_181125 ) ( IN-CITY ?auto_181125 ?auto_181124 ) ( not ( = ?auto_181119 ?auto_181125 ) ) ( not ( = ?auto_181127 ?auto_181125 ) ) ( OBJ-AT ?auto_181122 ?auto_181119 ) ( OBJ-AT ?auto_181123 ?auto_181119 ) ( not ( = ?auto_181120 ?auto_181122 ) ) ( not ( = ?auto_181120 ?auto_181123 ) ) ( not ( = ?auto_181121 ?auto_181122 ) ) ( not ( = ?auto_181121 ?auto_181123 ) ) ( not ( = ?auto_181122 ?auto_181123 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181120 ?auto_181121 ?auto_181119 )
      ( DELIVER-4PKG-VERIFY ?auto_181120 ?auto_181121 ?auto_181122 ?auto_181123 ?auto_181119 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181379 - OBJ
      ?auto_181380 - OBJ
      ?auto_181381 - OBJ
      ?auto_181382 - OBJ
      ?auto_181378 - LOCATION
    )
    :vars
    (
      ?auto_181386 - LOCATION
      ?auto_181383 - CITY
      ?auto_181385 - TRUCK
      ?auto_181384 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181386 ?auto_181383 ) ( IN-CITY ?auto_181378 ?auto_181383 ) ( not ( = ?auto_181378 ?auto_181386 ) ) ( OBJ-AT ?auto_181381 ?auto_181378 ) ( not ( = ?auto_181381 ?auto_181379 ) ) ( OBJ-AT ?auto_181379 ?auto_181386 ) ( TRUCK-AT ?auto_181385 ?auto_181384 ) ( IN-CITY ?auto_181384 ?auto_181383 ) ( not ( = ?auto_181378 ?auto_181384 ) ) ( not ( = ?auto_181386 ?auto_181384 ) ) ( OBJ-AT ?auto_181380 ?auto_181378 ) ( OBJ-AT ?auto_181382 ?auto_181378 ) ( not ( = ?auto_181379 ?auto_181380 ) ) ( not ( = ?auto_181379 ?auto_181382 ) ) ( not ( = ?auto_181380 ?auto_181381 ) ) ( not ( = ?auto_181380 ?auto_181382 ) ) ( not ( = ?auto_181381 ?auto_181382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181381 ?auto_181379 ?auto_181378 )
      ( DELIVER-4PKG-VERIFY ?auto_181379 ?auto_181380 ?auto_181381 ?auto_181382 ?auto_181378 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181662 - OBJ
      ?auto_181663 - OBJ
      ?auto_181664 - OBJ
      ?auto_181661 - LOCATION
    )
    :vars
    (
      ?auto_181668 - LOCATION
      ?auto_181667 - CITY
      ?auto_181665 - TRUCK
      ?auto_181666 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181668 ?auto_181667 ) ( IN-CITY ?auto_181661 ?auto_181667 ) ( not ( = ?auto_181661 ?auto_181668 ) ) ( OBJ-AT ?auto_181662 ?auto_181661 ) ( not ( = ?auto_181662 ?auto_181664 ) ) ( OBJ-AT ?auto_181664 ?auto_181668 ) ( TRUCK-AT ?auto_181665 ?auto_181666 ) ( IN-CITY ?auto_181666 ?auto_181667 ) ( not ( = ?auto_181661 ?auto_181666 ) ) ( not ( = ?auto_181668 ?auto_181666 ) ) ( OBJ-AT ?auto_181663 ?auto_181661 ) ( not ( = ?auto_181662 ?auto_181663 ) ) ( not ( = ?auto_181663 ?auto_181664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181662 ?auto_181664 ?auto_181661 )
      ( DELIVER-3PKG-VERIFY ?auto_181662 ?auto_181663 ?auto_181664 ?auto_181661 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_181745 - OBJ
      ?auto_181746 - OBJ
      ?auto_181747 - OBJ
      ?auto_181744 - LOCATION
    )
    :vars
    (
      ?auto_181751 - LOCATION
      ?auto_181750 - CITY
      ?auto_181748 - TRUCK
      ?auto_181749 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181751 ?auto_181750 ) ( IN-CITY ?auto_181744 ?auto_181750 ) ( not ( = ?auto_181744 ?auto_181751 ) ) ( OBJ-AT ?auto_181746 ?auto_181744 ) ( not ( = ?auto_181746 ?auto_181745 ) ) ( OBJ-AT ?auto_181745 ?auto_181751 ) ( TRUCK-AT ?auto_181748 ?auto_181749 ) ( IN-CITY ?auto_181749 ?auto_181750 ) ( not ( = ?auto_181744 ?auto_181749 ) ) ( not ( = ?auto_181751 ?auto_181749 ) ) ( OBJ-AT ?auto_181747 ?auto_181744 ) ( not ( = ?auto_181745 ?auto_181747 ) ) ( not ( = ?auto_181746 ?auto_181747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181746 ?auto_181745 ?auto_181744 )
      ( DELIVER-3PKG-VERIFY ?auto_181745 ?auto_181746 ?auto_181747 ?auto_181744 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181911 - OBJ
      ?auto_181912 - OBJ
      ?auto_181913 - OBJ
      ?auto_181914 - OBJ
      ?auto_181910 - LOCATION
    )
    :vars
    (
      ?auto_181918 - LOCATION
      ?auto_181917 - CITY
      ?auto_181915 - TRUCK
      ?auto_181916 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_181918 ?auto_181917 ) ( IN-CITY ?auto_181910 ?auto_181917 ) ( not ( = ?auto_181910 ?auto_181918 ) ) ( OBJ-AT ?auto_181914 ?auto_181910 ) ( not ( = ?auto_181914 ?auto_181912 ) ) ( OBJ-AT ?auto_181912 ?auto_181918 ) ( TRUCK-AT ?auto_181915 ?auto_181916 ) ( IN-CITY ?auto_181916 ?auto_181917 ) ( not ( = ?auto_181910 ?auto_181916 ) ) ( not ( = ?auto_181918 ?auto_181916 ) ) ( OBJ-AT ?auto_181911 ?auto_181910 ) ( OBJ-AT ?auto_181913 ?auto_181910 ) ( not ( = ?auto_181911 ?auto_181912 ) ) ( not ( = ?auto_181911 ?auto_181913 ) ) ( not ( = ?auto_181911 ?auto_181914 ) ) ( not ( = ?auto_181912 ?auto_181913 ) ) ( not ( = ?auto_181913 ?auto_181914 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181914 ?auto_181912 ?auto_181910 )
      ( DELIVER-4PKG-VERIFY ?auto_181911 ?auto_181912 ?auto_181913 ?auto_181914 ?auto_181910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190061 - OBJ
      ?auto_190062 - OBJ
      ?auto_190063 - OBJ
      ?auto_190060 - LOCATION
    )
    :vars
    (
      ?auto_190064 - TRUCK
      ?auto_190066 - LOCATION
      ?auto_190065 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_190064 ?auto_190066 ) ( IN-CITY ?auto_190066 ?auto_190065 ) ( IN-CITY ?auto_190060 ?auto_190065 ) ( not ( = ?auto_190060 ?auto_190066 ) ) ( OBJ-AT ?auto_190063 ?auto_190060 ) ( not ( = ?auto_190063 ?auto_190062 ) ) ( OBJ-AT ?auto_190062 ?auto_190066 ) ( OBJ-AT ?auto_190061 ?auto_190060 ) ( not ( = ?auto_190061 ?auto_190062 ) ) ( not ( = ?auto_190061 ?auto_190063 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190063 ?auto_190062 ?auto_190060 )
      ( DELIVER-3PKG-VERIFY ?auto_190061 ?auto_190062 ?auto_190063 ?auto_190060 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195136 - OBJ
      ?auto_195137 - OBJ
      ?auto_195138 - OBJ
      ?auto_195135 - LOCATION
    )
    :vars
    (
      ?auto_195141 - LOCATION
      ?auto_195139 - CITY
      ?auto_195140 - TRUCK
      ?auto_195142 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195141 ?auto_195139 ) ( IN-CITY ?auto_195135 ?auto_195139 ) ( not ( = ?auto_195135 ?auto_195141 ) ) ( OBJ-AT ?auto_195136 ?auto_195135 ) ( not ( = ?auto_195136 ?auto_195137 ) ) ( OBJ-AT ?auto_195137 ?auto_195141 ) ( TRUCK-AT ?auto_195140 ?auto_195142 ) ( IN-CITY ?auto_195142 ?auto_195139 ) ( not ( = ?auto_195135 ?auto_195142 ) ) ( not ( = ?auto_195141 ?auto_195142 ) ) ( OBJ-AT ?auto_195138 ?auto_195135 ) ( not ( = ?auto_195136 ?auto_195138 ) ) ( not ( = ?auto_195137 ?auto_195138 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195136 ?auto_195137 ?auto_195135 )
      ( DELIVER-3PKG-VERIFY ?auto_195136 ?auto_195137 ?auto_195138 ?auto_195135 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195168 - OBJ
      ?auto_195169 - OBJ
      ?auto_195170 - OBJ
      ?auto_195167 - LOCATION
    )
    :vars
    (
      ?auto_195174 - LOCATION
      ?auto_195171 - CITY
      ?auto_195172 - OBJ
      ?auto_195173 - TRUCK
      ?auto_195175 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195174 ?auto_195171 ) ( IN-CITY ?auto_195167 ?auto_195171 ) ( not ( = ?auto_195167 ?auto_195174 ) ) ( OBJ-AT ?auto_195172 ?auto_195167 ) ( not ( = ?auto_195172 ?auto_195170 ) ) ( OBJ-AT ?auto_195170 ?auto_195174 ) ( TRUCK-AT ?auto_195173 ?auto_195175 ) ( IN-CITY ?auto_195175 ?auto_195171 ) ( not ( = ?auto_195167 ?auto_195175 ) ) ( not ( = ?auto_195174 ?auto_195175 ) ) ( OBJ-AT ?auto_195168 ?auto_195167 ) ( OBJ-AT ?auto_195169 ?auto_195167 ) ( not ( = ?auto_195168 ?auto_195169 ) ) ( not ( = ?auto_195168 ?auto_195170 ) ) ( not ( = ?auto_195168 ?auto_195172 ) ) ( not ( = ?auto_195169 ?auto_195170 ) ) ( not ( = ?auto_195169 ?auto_195172 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195172 ?auto_195170 ?auto_195167 )
      ( DELIVER-3PKG-VERIFY ?auto_195168 ?auto_195169 ?auto_195170 ?auto_195167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195190 - OBJ
      ?auto_195191 - OBJ
      ?auto_195192 - OBJ
      ?auto_195189 - LOCATION
    )
    :vars
    (
      ?auto_195196 - LOCATION
      ?auto_195193 - CITY
      ?auto_195194 - OBJ
      ?auto_195195 - TRUCK
      ?auto_195197 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195196 ?auto_195193 ) ( IN-CITY ?auto_195189 ?auto_195193 ) ( not ( = ?auto_195189 ?auto_195196 ) ) ( OBJ-AT ?auto_195194 ?auto_195189 ) ( not ( = ?auto_195194 ?auto_195191 ) ) ( OBJ-AT ?auto_195191 ?auto_195196 ) ( TRUCK-AT ?auto_195195 ?auto_195197 ) ( IN-CITY ?auto_195197 ?auto_195193 ) ( not ( = ?auto_195189 ?auto_195197 ) ) ( not ( = ?auto_195196 ?auto_195197 ) ) ( OBJ-AT ?auto_195190 ?auto_195189 ) ( OBJ-AT ?auto_195192 ?auto_195189 ) ( not ( = ?auto_195190 ?auto_195191 ) ) ( not ( = ?auto_195190 ?auto_195192 ) ) ( not ( = ?auto_195190 ?auto_195194 ) ) ( not ( = ?auto_195191 ?auto_195192 ) ) ( not ( = ?auto_195192 ?auto_195194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195194 ?auto_195191 ?auto_195189 )
      ( DELIVER-3PKG-VERIFY ?auto_195190 ?auto_195191 ?auto_195192 ?auto_195189 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_195310 - OBJ
      ?auto_195311 - OBJ
      ?auto_195312 - OBJ
      ?auto_195309 - LOCATION
    )
    :vars
    (
      ?auto_195316 - LOCATION
      ?auto_195313 - CITY
      ?auto_195314 - OBJ
      ?auto_195315 - TRUCK
      ?auto_195317 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195316 ?auto_195313 ) ( IN-CITY ?auto_195309 ?auto_195313 ) ( not ( = ?auto_195309 ?auto_195316 ) ) ( OBJ-AT ?auto_195314 ?auto_195309 ) ( not ( = ?auto_195314 ?auto_195310 ) ) ( OBJ-AT ?auto_195310 ?auto_195316 ) ( TRUCK-AT ?auto_195315 ?auto_195317 ) ( IN-CITY ?auto_195317 ?auto_195313 ) ( not ( = ?auto_195309 ?auto_195317 ) ) ( not ( = ?auto_195316 ?auto_195317 ) ) ( OBJ-AT ?auto_195311 ?auto_195309 ) ( OBJ-AT ?auto_195312 ?auto_195309 ) ( not ( = ?auto_195310 ?auto_195311 ) ) ( not ( = ?auto_195310 ?auto_195312 ) ) ( not ( = ?auto_195311 ?auto_195312 ) ) ( not ( = ?auto_195311 ?auto_195314 ) ) ( not ( = ?auto_195312 ?auto_195314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195314 ?auto_195310 ?auto_195309 )
      ( DELIVER-3PKG-VERIFY ?auto_195310 ?auto_195311 ?auto_195312 ?auto_195309 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195416 - OBJ
      ?auto_195417 - OBJ
      ?auto_195418 - OBJ
      ?auto_195419 - OBJ
      ?auto_195415 - LOCATION
    )
    :vars
    (
      ?auto_195422 - LOCATION
      ?auto_195420 - CITY
      ?auto_195421 - TRUCK
      ?auto_195423 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195422 ?auto_195420 ) ( IN-CITY ?auto_195415 ?auto_195420 ) ( not ( = ?auto_195415 ?auto_195422 ) ) ( OBJ-AT ?auto_195417 ?auto_195415 ) ( not ( = ?auto_195417 ?auto_195419 ) ) ( OBJ-AT ?auto_195419 ?auto_195422 ) ( TRUCK-AT ?auto_195421 ?auto_195423 ) ( IN-CITY ?auto_195423 ?auto_195420 ) ( not ( = ?auto_195415 ?auto_195423 ) ) ( not ( = ?auto_195422 ?auto_195423 ) ) ( OBJ-AT ?auto_195416 ?auto_195415 ) ( OBJ-AT ?auto_195418 ?auto_195415 ) ( not ( = ?auto_195416 ?auto_195417 ) ) ( not ( = ?auto_195416 ?auto_195418 ) ) ( not ( = ?auto_195416 ?auto_195419 ) ) ( not ( = ?auto_195417 ?auto_195418 ) ) ( not ( = ?auto_195418 ?auto_195419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195417 ?auto_195419 ?auto_195415 )
      ( DELIVER-4PKG-VERIFY ?auto_195416 ?auto_195417 ?auto_195418 ?auto_195419 ?auto_195415 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195443 - OBJ
      ?auto_195444 - OBJ
      ?auto_195445 - OBJ
      ?auto_195446 - OBJ
      ?auto_195442 - LOCATION
    )
    :vars
    (
      ?auto_195449 - LOCATION
      ?auto_195447 - CITY
      ?auto_195448 - TRUCK
      ?auto_195450 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195449 ?auto_195447 ) ( IN-CITY ?auto_195442 ?auto_195447 ) ( not ( = ?auto_195442 ?auto_195449 ) ) ( OBJ-AT ?auto_195444 ?auto_195442 ) ( not ( = ?auto_195444 ?auto_195445 ) ) ( OBJ-AT ?auto_195445 ?auto_195449 ) ( TRUCK-AT ?auto_195448 ?auto_195450 ) ( IN-CITY ?auto_195450 ?auto_195447 ) ( not ( = ?auto_195442 ?auto_195450 ) ) ( not ( = ?auto_195449 ?auto_195450 ) ) ( OBJ-AT ?auto_195443 ?auto_195442 ) ( OBJ-AT ?auto_195446 ?auto_195442 ) ( not ( = ?auto_195443 ?auto_195444 ) ) ( not ( = ?auto_195443 ?auto_195445 ) ) ( not ( = ?auto_195443 ?auto_195446 ) ) ( not ( = ?auto_195444 ?auto_195446 ) ) ( not ( = ?auto_195445 ?auto_195446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195444 ?auto_195445 ?auto_195442 )
      ( DELIVER-4PKG-VERIFY ?auto_195443 ?auto_195444 ?auto_195445 ?auto_195446 ?auto_195442 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195470 - OBJ
      ?auto_195471 - OBJ
      ?auto_195472 - OBJ
      ?auto_195473 - OBJ
      ?auto_195469 - LOCATION
    )
    :vars
    (
      ?auto_195476 - LOCATION
      ?auto_195474 - CITY
      ?auto_195475 - TRUCK
      ?auto_195477 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195476 ?auto_195474 ) ( IN-CITY ?auto_195469 ?auto_195474 ) ( not ( = ?auto_195469 ?auto_195476 ) ) ( OBJ-AT ?auto_195472 ?auto_195469 ) ( not ( = ?auto_195472 ?auto_195473 ) ) ( OBJ-AT ?auto_195473 ?auto_195476 ) ( TRUCK-AT ?auto_195475 ?auto_195477 ) ( IN-CITY ?auto_195477 ?auto_195474 ) ( not ( = ?auto_195469 ?auto_195477 ) ) ( not ( = ?auto_195476 ?auto_195477 ) ) ( OBJ-AT ?auto_195470 ?auto_195469 ) ( OBJ-AT ?auto_195471 ?auto_195469 ) ( not ( = ?auto_195470 ?auto_195471 ) ) ( not ( = ?auto_195470 ?auto_195472 ) ) ( not ( = ?auto_195470 ?auto_195473 ) ) ( not ( = ?auto_195471 ?auto_195472 ) ) ( not ( = ?auto_195471 ?auto_195473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195472 ?auto_195473 ?auto_195469 )
      ( DELIVER-4PKG-VERIFY ?auto_195470 ?auto_195471 ?auto_195472 ?auto_195473 ?auto_195469 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195605 - OBJ
      ?auto_195606 - OBJ
      ?auto_195607 - OBJ
      ?auto_195608 - OBJ
      ?auto_195604 - LOCATION
    )
    :vars
    (
      ?auto_195611 - LOCATION
      ?auto_195609 - CITY
      ?auto_195610 - TRUCK
      ?auto_195612 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195611 ?auto_195609 ) ( IN-CITY ?auto_195604 ?auto_195609 ) ( not ( = ?auto_195604 ?auto_195611 ) ) ( OBJ-AT ?auto_195607 ?auto_195604 ) ( not ( = ?auto_195607 ?auto_195606 ) ) ( OBJ-AT ?auto_195606 ?auto_195611 ) ( TRUCK-AT ?auto_195610 ?auto_195612 ) ( IN-CITY ?auto_195612 ?auto_195609 ) ( not ( = ?auto_195604 ?auto_195612 ) ) ( not ( = ?auto_195611 ?auto_195612 ) ) ( OBJ-AT ?auto_195605 ?auto_195604 ) ( OBJ-AT ?auto_195608 ?auto_195604 ) ( not ( = ?auto_195605 ?auto_195606 ) ) ( not ( = ?auto_195605 ?auto_195607 ) ) ( not ( = ?auto_195605 ?auto_195608 ) ) ( not ( = ?auto_195606 ?auto_195608 ) ) ( not ( = ?auto_195607 ?auto_195608 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195607 ?auto_195606 ?auto_195604 )
      ( DELIVER-4PKG-VERIFY ?auto_195605 ?auto_195606 ?auto_195607 ?auto_195608 ?auto_195604 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195767 - OBJ
      ?auto_195768 - OBJ
      ?auto_195769 - OBJ
      ?auto_195770 - OBJ
      ?auto_195766 - LOCATION
    )
    :vars
    (
      ?auto_195773 - LOCATION
      ?auto_195771 - CITY
      ?auto_195772 - TRUCK
      ?auto_195774 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195773 ?auto_195771 ) ( IN-CITY ?auto_195766 ?auto_195771 ) ( not ( = ?auto_195766 ?auto_195773 ) ) ( OBJ-AT ?auto_195770 ?auto_195766 ) ( not ( = ?auto_195770 ?auto_195769 ) ) ( OBJ-AT ?auto_195769 ?auto_195773 ) ( TRUCK-AT ?auto_195772 ?auto_195774 ) ( IN-CITY ?auto_195774 ?auto_195771 ) ( not ( = ?auto_195766 ?auto_195774 ) ) ( not ( = ?auto_195773 ?auto_195774 ) ) ( OBJ-AT ?auto_195767 ?auto_195766 ) ( OBJ-AT ?auto_195768 ?auto_195766 ) ( not ( = ?auto_195767 ?auto_195768 ) ) ( not ( = ?auto_195767 ?auto_195769 ) ) ( not ( = ?auto_195767 ?auto_195770 ) ) ( not ( = ?auto_195768 ?auto_195769 ) ) ( not ( = ?auto_195768 ?auto_195770 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195770 ?auto_195769 ?auto_195766 )
      ( DELIVER-4PKG-VERIFY ?auto_195767 ?auto_195768 ?auto_195769 ?auto_195770 ?auto_195766 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195812 - OBJ
      ?auto_195813 - OBJ
      ?auto_195814 - OBJ
      ?auto_195815 - OBJ
      ?auto_195811 - LOCATION
    )
    :vars
    (
      ?auto_195819 - LOCATION
      ?auto_195816 - CITY
      ?auto_195817 - OBJ
      ?auto_195818 - TRUCK
      ?auto_195820 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195819 ?auto_195816 ) ( IN-CITY ?auto_195811 ?auto_195816 ) ( not ( = ?auto_195811 ?auto_195819 ) ) ( OBJ-AT ?auto_195817 ?auto_195811 ) ( not ( = ?auto_195817 ?auto_195815 ) ) ( OBJ-AT ?auto_195815 ?auto_195819 ) ( TRUCK-AT ?auto_195818 ?auto_195820 ) ( IN-CITY ?auto_195820 ?auto_195816 ) ( not ( = ?auto_195811 ?auto_195820 ) ) ( not ( = ?auto_195819 ?auto_195820 ) ) ( OBJ-AT ?auto_195812 ?auto_195811 ) ( OBJ-AT ?auto_195813 ?auto_195811 ) ( OBJ-AT ?auto_195814 ?auto_195811 ) ( not ( = ?auto_195812 ?auto_195813 ) ) ( not ( = ?auto_195812 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195815 ) ) ( not ( = ?auto_195812 ?auto_195817 ) ) ( not ( = ?auto_195813 ?auto_195814 ) ) ( not ( = ?auto_195813 ?auto_195815 ) ) ( not ( = ?auto_195813 ?auto_195817 ) ) ( not ( = ?auto_195814 ?auto_195815 ) ) ( not ( = ?auto_195814 ?auto_195817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195817 ?auto_195815 ?auto_195811 )
      ( DELIVER-4PKG-VERIFY ?auto_195812 ?auto_195813 ?auto_195814 ?auto_195815 ?auto_195811 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195841 - OBJ
      ?auto_195842 - OBJ
      ?auto_195843 - OBJ
      ?auto_195844 - OBJ
      ?auto_195840 - LOCATION
    )
    :vars
    (
      ?auto_195848 - LOCATION
      ?auto_195845 - CITY
      ?auto_195846 - OBJ
      ?auto_195847 - TRUCK
      ?auto_195849 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195848 ?auto_195845 ) ( IN-CITY ?auto_195840 ?auto_195845 ) ( not ( = ?auto_195840 ?auto_195848 ) ) ( OBJ-AT ?auto_195846 ?auto_195840 ) ( not ( = ?auto_195846 ?auto_195843 ) ) ( OBJ-AT ?auto_195843 ?auto_195848 ) ( TRUCK-AT ?auto_195847 ?auto_195849 ) ( IN-CITY ?auto_195849 ?auto_195845 ) ( not ( = ?auto_195840 ?auto_195849 ) ) ( not ( = ?auto_195848 ?auto_195849 ) ) ( OBJ-AT ?auto_195841 ?auto_195840 ) ( OBJ-AT ?auto_195842 ?auto_195840 ) ( OBJ-AT ?auto_195844 ?auto_195840 ) ( not ( = ?auto_195841 ?auto_195842 ) ) ( not ( = ?auto_195841 ?auto_195843 ) ) ( not ( = ?auto_195841 ?auto_195844 ) ) ( not ( = ?auto_195841 ?auto_195846 ) ) ( not ( = ?auto_195842 ?auto_195843 ) ) ( not ( = ?auto_195842 ?auto_195844 ) ) ( not ( = ?auto_195842 ?auto_195846 ) ) ( not ( = ?auto_195843 ?auto_195844 ) ) ( not ( = ?auto_195844 ?auto_195846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195846 ?auto_195843 ?auto_195840 )
      ( DELIVER-4PKG-VERIFY ?auto_195841 ?auto_195842 ?auto_195843 ?auto_195844 ?auto_195840 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_195984 - OBJ
      ?auto_195985 - OBJ
      ?auto_195986 - OBJ
      ?auto_195987 - OBJ
      ?auto_195983 - LOCATION
    )
    :vars
    (
      ?auto_195991 - LOCATION
      ?auto_195988 - CITY
      ?auto_195989 - OBJ
      ?auto_195990 - TRUCK
      ?auto_195992 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_195991 ?auto_195988 ) ( IN-CITY ?auto_195983 ?auto_195988 ) ( not ( = ?auto_195983 ?auto_195991 ) ) ( OBJ-AT ?auto_195989 ?auto_195983 ) ( not ( = ?auto_195989 ?auto_195985 ) ) ( OBJ-AT ?auto_195985 ?auto_195991 ) ( TRUCK-AT ?auto_195990 ?auto_195992 ) ( IN-CITY ?auto_195992 ?auto_195988 ) ( not ( = ?auto_195983 ?auto_195992 ) ) ( not ( = ?auto_195991 ?auto_195992 ) ) ( OBJ-AT ?auto_195984 ?auto_195983 ) ( OBJ-AT ?auto_195986 ?auto_195983 ) ( OBJ-AT ?auto_195987 ?auto_195983 ) ( not ( = ?auto_195984 ?auto_195985 ) ) ( not ( = ?auto_195984 ?auto_195986 ) ) ( not ( = ?auto_195984 ?auto_195987 ) ) ( not ( = ?auto_195984 ?auto_195989 ) ) ( not ( = ?auto_195985 ?auto_195986 ) ) ( not ( = ?auto_195985 ?auto_195987 ) ) ( not ( = ?auto_195986 ?auto_195987 ) ) ( not ( = ?auto_195986 ?auto_195989 ) ) ( not ( = ?auto_195987 ?auto_195989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_195989 ?auto_195985 ?auto_195983 )
      ( DELIVER-4PKG-VERIFY ?auto_195984 ?auto_195985 ?auto_195986 ?auto_195987 ?auto_195983 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196480 - OBJ
      ?auto_196481 - OBJ
      ?auto_196482 - OBJ
      ?auto_196483 - OBJ
      ?auto_196479 - LOCATION
    )
    :vars
    (
      ?auto_196486 - LOCATION
      ?auto_196484 - CITY
      ?auto_196485 - TRUCK
      ?auto_196487 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196486 ?auto_196484 ) ( IN-CITY ?auto_196479 ?auto_196484 ) ( not ( = ?auto_196479 ?auto_196486 ) ) ( OBJ-AT ?auto_196483 ?auto_196479 ) ( not ( = ?auto_196483 ?auto_196480 ) ) ( OBJ-AT ?auto_196480 ?auto_196486 ) ( TRUCK-AT ?auto_196485 ?auto_196487 ) ( IN-CITY ?auto_196487 ?auto_196484 ) ( not ( = ?auto_196479 ?auto_196487 ) ) ( not ( = ?auto_196486 ?auto_196487 ) ) ( OBJ-AT ?auto_196481 ?auto_196479 ) ( OBJ-AT ?auto_196482 ?auto_196479 ) ( not ( = ?auto_196480 ?auto_196481 ) ) ( not ( = ?auto_196480 ?auto_196482 ) ) ( not ( = ?auto_196481 ?auto_196482 ) ) ( not ( = ?auto_196481 ?auto_196483 ) ) ( not ( = ?auto_196482 ?auto_196483 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196483 ?auto_196480 ?auto_196479 )
      ( DELIVER-4PKG-VERIFY ?auto_196480 ?auto_196481 ?auto_196482 ?auto_196483 ?auto_196479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196489 - OBJ
      ?auto_196490 - OBJ
      ?auto_196491 - OBJ
      ?auto_196492 - OBJ
      ?auto_196488 - LOCATION
    )
    :vars
    (
      ?auto_196495 - LOCATION
      ?auto_196493 - CITY
      ?auto_196494 - TRUCK
      ?auto_196496 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196495 ?auto_196493 ) ( IN-CITY ?auto_196488 ?auto_196493 ) ( not ( = ?auto_196488 ?auto_196495 ) ) ( OBJ-AT ?auto_196490 ?auto_196488 ) ( not ( = ?auto_196490 ?auto_196489 ) ) ( OBJ-AT ?auto_196489 ?auto_196495 ) ( TRUCK-AT ?auto_196494 ?auto_196496 ) ( IN-CITY ?auto_196496 ?auto_196493 ) ( not ( = ?auto_196488 ?auto_196496 ) ) ( not ( = ?auto_196495 ?auto_196496 ) ) ( OBJ-AT ?auto_196491 ?auto_196488 ) ( OBJ-AT ?auto_196492 ?auto_196488 ) ( not ( = ?auto_196489 ?auto_196491 ) ) ( not ( = ?auto_196489 ?auto_196492 ) ) ( not ( = ?auto_196490 ?auto_196491 ) ) ( not ( = ?auto_196490 ?auto_196492 ) ) ( not ( = ?auto_196491 ?auto_196492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196490 ?auto_196489 ?auto_196488 )
      ( DELIVER-4PKG-VERIFY ?auto_196489 ?auto_196490 ?auto_196491 ?auto_196492 ?auto_196488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196633 - OBJ
      ?auto_196634 - OBJ
      ?auto_196635 - OBJ
      ?auto_196636 - OBJ
      ?auto_196632 - LOCATION
    )
    :vars
    (
      ?auto_196640 - LOCATION
      ?auto_196637 - CITY
      ?auto_196638 - OBJ
      ?auto_196639 - TRUCK
      ?auto_196641 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196640 ?auto_196637 ) ( IN-CITY ?auto_196632 ?auto_196637 ) ( not ( = ?auto_196632 ?auto_196640 ) ) ( OBJ-AT ?auto_196638 ?auto_196632 ) ( not ( = ?auto_196638 ?auto_196633 ) ) ( OBJ-AT ?auto_196633 ?auto_196640 ) ( TRUCK-AT ?auto_196639 ?auto_196641 ) ( IN-CITY ?auto_196641 ?auto_196637 ) ( not ( = ?auto_196632 ?auto_196641 ) ) ( not ( = ?auto_196640 ?auto_196641 ) ) ( OBJ-AT ?auto_196634 ?auto_196632 ) ( OBJ-AT ?auto_196635 ?auto_196632 ) ( OBJ-AT ?auto_196636 ?auto_196632 ) ( not ( = ?auto_196633 ?auto_196634 ) ) ( not ( = ?auto_196633 ?auto_196635 ) ) ( not ( = ?auto_196633 ?auto_196636 ) ) ( not ( = ?auto_196634 ?auto_196635 ) ) ( not ( = ?auto_196634 ?auto_196636 ) ) ( not ( = ?auto_196634 ?auto_196638 ) ) ( not ( = ?auto_196635 ?auto_196636 ) ) ( not ( = ?auto_196635 ?auto_196638 ) ) ( not ( = ?auto_196636 ?auto_196638 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196638 ?auto_196633 ?auto_196632 )
      ( DELIVER-4PKG-VERIFY ?auto_196633 ?auto_196634 ?auto_196635 ?auto_196636 ?auto_196632 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_210140 - OBJ
      ?auto_210139 - LOCATION
    )
    :vars
    (
      ?auto_210142 - LOCATION
      ?auto_210144 - CITY
      ?auto_210141 - OBJ
      ?auto_210143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210142 ?auto_210144 ) ( IN-CITY ?auto_210139 ?auto_210144 ) ( not ( = ?auto_210139 ?auto_210142 ) ) ( not ( = ?auto_210141 ?auto_210140 ) ) ( OBJ-AT ?auto_210140 ?auto_210142 ) ( IN-TRUCK ?auto_210141 ?auto_210143 ) ( TRUCK-AT ?auto_210143 ?auto_210142 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_210143 ?auto_210142 ?auto_210139 ?auto_210144 )
      ( DELIVER-2PKG ?auto_210141 ?auto_210140 ?auto_210139 )
      ( DELIVER-1PKG-VERIFY ?auto_210140 ?auto_210139 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_210146 - OBJ
      ?auto_210147 - OBJ
      ?auto_210145 - LOCATION
    )
    :vars
    (
      ?auto_210148 - LOCATION
      ?auto_210150 - CITY
      ?auto_210149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210148 ?auto_210150 ) ( IN-CITY ?auto_210145 ?auto_210150 ) ( not ( = ?auto_210145 ?auto_210148 ) ) ( not ( = ?auto_210146 ?auto_210147 ) ) ( OBJ-AT ?auto_210147 ?auto_210148 ) ( IN-TRUCK ?auto_210146 ?auto_210149 ) ( TRUCK-AT ?auto_210149 ?auto_210148 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_210147 ?auto_210145 )
      ( DELIVER-2PKG-VERIFY ?auto_210146 ?auto_210147 ?auto_210145 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_210166 - OBJ
      ?auto_210167 - OBJ
      ?auto_210165 - LOCATION
    )
    :vars
    (
      ?auto_210170 - LOCATION
      ?auto_210169 - CITY
      ?auto_210168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210170 ?auto_210169 ) ( IN-CITY ?auto_210165 ?auto_210169 ) ( not ( = ?auto_210165 ?auto_210170 ) ) ( not ( = ?auto_210167 ?auto_210166 ) ) ( OBJ-AT ?auto_210166 ?auto_210170 ) ( IN-TRUCK ?auto_210167 ?auto_210168 ) ( TRUCK-AT ?auto_210168 ?auto_210170 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_210167 ?auto_210166 ?auto_210165 )
      ( DELIVER-2PKG-VERIFY ?auto_210166 ?auto_210167 ?auto_210165 ) )
  )

)

