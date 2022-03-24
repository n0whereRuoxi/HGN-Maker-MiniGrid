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
      ?auto_150512 - OBJ
      ?auto_150511 - LOCATION
    )
    :vars
    (
      ?auto_150514 - LOCATION
      ?auto_150515 - CITY
      ?auto_150513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150514 ?auto_150515 ) ( IN-CITY ?auto_150511 ?auto_150515 ) ( not ( = ?auto_150511 ?auto_150514 ) ) ( OBJ-AT ?auto_150512 ?auto_150514 ) ( TRUCK-AT ?auto_150513 ?auto_150511 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_150513 ?auto_150511 ?auto_150514 ?auto_150515 )
      ( !LOAD-TRUCK ?auto_150512 ?auto_150513 ?auto_150514 )
      ( !DRIVE-TRUCK ?auto_150513 ?auto_150514 ?auto_150511 ?auto_150515 )
      ( !UNLOAD-TRUCK ?auto_150512 ?auto_150513 ?auto_150511 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_150519 - OBJ
      ?auto_150518 - LOCATION
    )
    :vars
    (
      ?auto_150521 - LOCATION
      ?auto_150522 - CITY
      ?auto_150520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150521 ?auto_150522 ) ( IN-CITY ?auto_150518 ?auto_150522 ) ( not ( = ?auto_150518 ?auto_150521 ) ) ( OBJ-AT ?auto_150519 ?auto_150521 ) ( TRUCK-AT ?auto_150520 ?auto_150518 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_150520 ?auto_150518 ?auto_150521 ?auto_150522 )
      ( !LOAD-TRUCK ?auto_150519 ?auto_150520 ?auto_150521 )
      ( !DRIVE-TRUCK ?auto_150520 ?auto_150521 ?auto_150518 ?auto_150522 )
      ( !UNLOAD-TRUCK ?auto_150519 ?auto_150520 ?auto_150518 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_150533 - OBJ
      ?auto_150534 - OBJ
      ?auto_150532 - LOCATION
    )
    :vars
    (
      ?auto_150535 - LOCATION
      ?auto_150536 - CITY
      ?auto_150537 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150535 ?auto_150536 ) ( IN-CITY ?auto_150532 ?auto_150536 ) ( not ( = ?auto_150532 ?auto_150535 ) ) ( OBJ-AT ?auto_150534 ?auto_150535 ) ( OBJ-AT ?auto_150533 ?auto_150535 ) ( TRUCK-AT ?auto_150537 ?auto_150532 ) ( not ( = ?auto_150533 ?auto_150534 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_150533 ?auto_150532 )
      ( DELIVER-1PKG ?auto_150534 ?auto_150532 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_150539 - OBJ
      ?auto_150540 - OBJ
      ?auto_150538 - LOCATION
    )
    :vars
    (
      ?auto_150543 - LOCATION
      ?auto_150541 - CITY
      ?auto_150542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150543 ?auto_150541 ) ( IN-CITY ?auto_150538 ?auto_150541 ) ( not ( = ?auto_150538 ?auto_150543 ) ) ( OBJ-AT ?auto_150539 ?auto_150543 ) ( OBJ-AT ?auto_150540 ?auto_150543 ) ( TRUCK-AT ?auto_150542 ?auto_150538 ) ( not ( = ?auto_150540 ?auto_150539 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150540 ?auto_150539 ?auto_150538 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_150554 - OBJ
      ?auto_150553 - LOCATION
    )
    :vars
    (
      ?auto_150556 - LOCATION
      ?auto_150557 - CITY
      ?auto_150555 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150556 ?auto_150557 ) ( IN-CITY ?auto_150553 ?auto_150557 ) ( not ( = ?auto_150553 ?auto_150556 ) ) ( OBJ-AT ?auto_150554 ?auto_150556 ) ( TRUCK-AT ?auto_150555 ?auto_150553 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_150555 ?auto_150553 ?auto_150556 ?auto_150557 )
      ( !LOAD-TRUCK ?auto_150554 ?auto_150555 ?auto_150556 )
      ( !DRIVE-TRUCK ?auto_150555 ?auto_150556 ?auto_150553 ?auto_150557 )
      ( !UNLOAD-TRUCK ?auto_150554 ?auto_150555 ?auto_150553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150644 - OBJ
      ?auto_150645 - OBJ
      ?auto_150646 - OBJ
      ?auto_150643 - LOCATION
    )
    :vars
    (
      ?auto_150647 - LOCATION
      ?auto_150649 - CITY
      ?auto_150650 - LOCATION
      ?auto_150648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150647 ?auto_150649 ) ( IN-CITY ?auto_150643 ?auto_150649 ) ( not ( = ?auto_150643 ?auto_150647 ) ) ( OBJ-AT ?auto_150646 ?auto_150647 ) ( IN-CITY ?auto_150650 ?auto_150649 ) ( not ( = ?auto_150643 ?auto_150650 ) ) ( OBJ-AT ?auto_150645 ?auto_150650 ) ( OBJ-AT ?auto_150644 ?auto_150650 ) ( TRUCK-AT ?auto_150648 ?auto_150643 ) ( not ( = ?auto_150644 ?auto_150645 ) ) ( not ( = ?auto_150644 ?auto_150646 ) ) ( not ( = ?auto_150645 ?auto_150646 ) ) ( not ( = ?auto_150647 ?auto_150650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_150645 ?auto_150644 ?auto_150643 )
      ( DELIVER-1PKG ?auto_150646 ?auto_150643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150661 - OBJ
      ?auto_150662 - OBJ
      ?auto_150663 - OBJ
      ?auto_150660 - LOCATION
    )
    :vars
    (
      ?auto_150664 - LOCATION
      ?auto_150665 - CITY
      ?auto_150667 - LOCATION
      ?auto_150666 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150664 ?auto_150665 ) ( IN-CITY ?auto_150660 ?auto_150665 ) ( not ( = ?auto_150660 ?auto_150664 ) ) ( OBJ-AT ?auto_150662 ?auto_150664 ) ( IN-CITY ?auto_150667 ?auto_150665 ) ( not ( = ?auto_150660 ?auto_150667 ) ) ( OBJ-AT ?auto_150663 ?auto_150667 ) ( OBJ-AT ?auto_150661 ?auto_150667 ) ( TRUCK-AT ?auto_150666 ?auto_150660 ) ( not ( = ?auto_150661 ?auto_150663 ) ) ( not ( = ?auto_150661 ?auto_150662 ) ) ( not ( = ?auto_150663 ?auto_150662 ) ) ( not ( = ?auto_150664 ?auto_150667 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_150661 ?auto_150663 ?auto_150662 ?auto_150660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150678 - OBJ
      ?auto_150679 - OBJ
      ?auto_150680 - OBJ
      ?auto_150677 - LOCATION
    )
    :vars
    (
      ?auto_150683 - LOCATION
      ?auto_150682 - CITY
      ?auto_150684 - LOCATION
      ?auto_150681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150683 ?auto_150682 ) ( IN-CITY ?auto_150677 ?auto_150682 ) ( not ( = ?auto_150677 ?auto_150683 ) ) ( OBJ-AT ?auto_150680 ?auto_150683 ) ( IN-CITY ?auto_150684 ?auto_150682 ) ( not ( = ?auto_150677 ?auto_150684 ) ) ( OBJ-AT ?auto_150678 ?auto_150684 ) ( OBJ-AT ?auto_150679 ?auto_150684 ) ( TRUCK-AT ?auto_150681 ?auto_150677 ) ( not ( = ?auto_150679 ?auto_150678 ) ) ( not ( = ?auto_150679 ?auto_150680 ) ) ( not ( = ?auto_150678 ?auto_150680 ) ) ( not ( = ?auto_150683 ?auto_150684 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_150679 ?auto_150680 ?auto_150678 ?auto_150677 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150695 - OBJ
      ?auto_150696 - OBJ
      ?auto_150697 - OBJ
      ?auto_150694 - LOCATION
    )
    :vars
    (
      ?auto_150700 - LOCATION
      ?auto_150699 - CITY
      ?auto_150701 - LOCATION
      ?auto_150698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150700 ?auto_150699 ) ( IN-CITY ?auto_150694 ?auto_150699 ) ( not ( = ?auto_150694 ?auto_150700 ) ) ( OBJ-AT ?auto_150696 ?auto_150700 ) ( IN-CITY ?auto_150701 ?auto_150699 ) ( not ( = ?auto_150694 ?auto_150701 ) ) ( OBJ-AT ?auto_150695 ?auto_150701 ) ( OBJ-AT ?auto_150697 ?auto_150701 ) ( TRUCK-AT ?auto_150698 ?auto_150694 ) ( not ( = ?auto_150697 ?auto_150695 ) ) ( not ( = ?auto_150697 ?auto_150696 ) ) ( not ( = ?auto_150695 ?auto_150696 ) ) ( not ( = ?auto_150700 ?auto_150701 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_150697 ?auto_150696 ?auto_150695 ?auto_150694 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150730 - OBJ
      ?auto_150731 - OBJ
      ?auto_150732 - OBJ
      ?auto_150729 - LOCATION
    )
    :vars
    (
      ?auto_150735 - LOCATION
      ?auto_150734 - CITY
      ?auto_150736 - LOCATION
      ?auto_150733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150735 ?auto_150734 ) ( IN-CITY ?auto_150729 ?auto_150734 ) ( not ( = ?auto_150729 ?auto_150735 ) ) ( OBJ-AT ?auto_150730 ?auto_150735 ) ( IN-CITY ?auto_150736 ?auto_150734 ) ( not ( = ?auto_150729 ?auto_150736 ) ) ( OBJ-AT ?auto_150732 ?auto_150736 ) ( OBJ-AT ?auto_150731 ?auto_150736 ) ( TRUCK-AT ?auto_150733 ?auto_150729 ) ( not ( = ?auto_150731 ?auto_150732 ) ) ( not ( = ?auto_150731 ?auto_150730 ) ) ( not ( = ?auto_150732 ?auto_150730 ) ) ( not ( = ?auto_150735 ?auto_150736 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_150731 ?auto_150730 ?auto_150732 ?auto_150729 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_150747 - OBJ
      ?auto_150748 - OBJ
      ?auto_150749 - OBJ
      ?auto_150746 - LOCATION
    )
    :vars
    (
      ?auto_150752 - LOCATION
      ?auto_150751 - CITY
      ?auto_150753 - LOCATION
      ?auto_150750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150752 ?auto_150751 ) ( IN-CITY ?auto_150746 ?auto_150751 ) ( not ( = ?auto_150746 ?auto_150752 ) ) ( OBJ-AT ?auto_150747 ?auto_150752 ) ( IN-CITY ?auto_150753 ?auto_150751 ) ( not ( = ?auto_150746 ?auto_150753 ) ) ( OBJ-AT ?auto_150748 ?auto_150753 ) ( OBJ-AT ?auto_150749 ?auto_150753 ) ( TRUCK-AT ?auto_150750 ?auto_150746 ) ( not ( = ?auto_150749 ?auto_150748 ) ) ( not ( = ?auto_150749 ?auto_150747 ) ) ( not ( = ?auto_150748 ?auto_150747 ) ) ( not ( = ?auto_150752 ?auto_150753 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_150749 ?auto_150747 ?auto_150748 ?auto_150746 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_150803 - OBJ
      ?auto_150802 - LOCATION
    )
    :vars
    (
      ?auto_150805 - LOCATION
      ?auto_150806 - CITY
      ?auto_150804 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150805 ?auto_150806 ) ( IN-CITY ?auto_150802 ?auto_150806 ) ( not ( = ?auto_150802 ?auto_150805 ) ) ( OBJ-AT ?auto_150803 ?auto_150805 ) ( TRUCK-AT ?auto_150804 ?auto_150802 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_150804 ?auto_150802 ?auto_150805 ?auto_150806 )
      ( !LOAD-TRUCK ?auto_150803 ?auto_150804 ?auto_150805 )
      ( !DRIVE-TRUCK ?auto_150804 ?auto_150805 ?auto_150802 ?auto_150806 )
      ( !UNLOAD-TRUCK ?auto_150803 ?auto_150804 ?auto_150802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151776 - OBJ
      ?auto_151777 - OBJ
      ?auto_151778 - OBJ
      ?auto_151779 - OBJ
      ?auto_151775 - LOCATION
    )
    :vars
    (
      ?auto_151780 - LOCATION
      ?auto_151782 - CITY
      ?auto_151783 - LOCATION
      ?auto_151781 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_151780 ?auto_151782 ) ( IN-CITY ?auto_151775 ?auto_151782 ) ( not ( = ?auto_151775 ?auto_151780 ) ) ( OBJ-AT ?auto_151779 ?auto_151780 ) ( IN-CITY ?auto_151783 ?auto_151782 ) ( not ( = ?auto_151775 ?auto_151783 ) ) ( OBJ-AT ?auto_151778 ?auto_151783 ) ( OBJ-AT ?auto_151777 ?auto_151780 ) ( OBJ-AT ?auto_151776 ?auto_151780 ) ( TRUCK-AT ?auto_151781 ?auto_151775 ) ( not ( = ?auto_151776 ?auto_151777 ) ) ( not ( = ?auto_151776 ?auto_151778 ) ) ( not ( = ?auto_151777 ?auto_151778 ) ) ( not ( = ?auto_151783 ?auto_151780 ) ) ( not ( = ?auto_151776 ?auto_151779 ) ) ( not ( = ?auto_151777 ?auto_151779 ) ) ( not ( = ?auto_151778 ?auto_151779 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_151776 ?auto_151778 ?auto_151777 ?auto_151775 )
      ( DELIVER-1PKG ?auto_151779 ?auto_151775 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151805 - OBJ
      ?auto_151806 - OBJ
      ?auto_151807 - OBJ
      ?auto_151808 - OBJ
      ?auto_151804 - LOCATION
    )
    :vars
    (
      ?auto_151811 - LOCATION
      ?auto_151810 - CITY
      ?auto_151812 - LOCATION
      ?auto_151809 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_151811 ?auto_151810 ) ( IN-CITY ?auto_151804 ?auto_151810 ) ( not ( = ?auto_151804 ?auto_151811 ) ) ( OBJ-AT ?auto_151807 ?auto_151811 ) ( IN-CITY ?auto_151812 ?auto_151810 ) ( not ( = ?auto_151804 ?auto_151812 ) ) ( OBJ-AT ?auto_151808 ?auto_151812 ) ( OBJ-AT ?auto_151806 ?auto_151811 ) ( OBJ-AT ?auto_151805 ?auto_151811 ) ( TRUCK-AT ?auto_151809 ?auto_151804 ) ( not ( = ?auto_151805 ?auto_151806 ) ) ( not ( = ?auto_151805 ?auto_151808 ) ) ( not ( = ?auto_151806 ?auto_151808 ) ) ( not ( = ?auto_151812 ?auto_151811 ) ) ( not ( = ?auto_151805 ?auto_151807 ) ) ( not ( = ?auto_151806 ?auto_151807 ) ) ( not ( = ?auto_151808 ?auto_151807 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_151805 ?auto_151806 ?auto_151808 ?auto_151807 ?auto_151804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151834 - OBJ
      ?auto_151835 - OBJ
      ?auto_151836 - OBJ
      ?auto_151837 - OBJ
      ?auto_151833 - LOCATION
    )
    :vars
    (
      ?auto_151839 - LOCATION
      ?auto_151840 - CITY
      ?auto_151838 - LOCATION
      ?auto_151841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_151839 ?auto_151840 ) ( IN-CITY ?auto_151833 ?auto_151840 ) ( not ( = ?auto_151833 ?auto_151839 ) ) ( OBJ-AT ?auto_151837 ?auto_151839 ) ( IN-CITY ?auto_151838 ?auto_151840 ) ( not ( = ?auto_151833 ?auto_151838 ) ) ( OBJ-AT ?auto_151835 ?auto_151838 ) ( OBJ-AT ?auto_151836 ?auto_151839 ) ( OBJ-AT ?auto_151834 ?auto_151839 ) ( TRUCK-AT ?auto_151841 ?auto_151833 ) ( not ( = ?auto_151834 ?auto_151836 ) ) ( not ( = ?auto_151834 ?auto_151835 ) ) ( not ( = ?auto_151836 ?auto_151835 ) ) ( not ( = ?auto_151838 ?auto_151839 ) ) ( not ( = ?auto_151834 ?auto_151837 ) ) ( not ( = ?auto_151836 ?auto_151837 ) ) ( not ( = ?auto_151835 ?auto_151837 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_151834 ?auto_151836 ?auto_151837 ?auto_151835 ?auto_151833 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151863 - OBJ
      ?auto_151864 - OBJ
      ?auto_151865 - OBJ
      ?auto_151866 - OBJ
      ?auto_151862 - LOCATION
    )
    :vars
    (
      ?auto_151868 - LOCATION
      ?auto_151869 - CITY
      ?auto_151867 - LOCATION
      ?auto_151870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_151868 ?auto_151869 ) ( IN-CITY ?auto_151862 ?auto_151869 ) ( not ( = ?auto_151862 ?auto_151868 ) ) ( OBJ-AT ?auto_151865 ?auto_151868 ) ( IN-CITY ?auto_151867 ?auto_151869 ) ( not ( = ?auto_151862 ?auto_151867 ) ) ( OBJ-AT ?auto_151864 ?auto_151867 ) ( OBJ-AT ?auto_151866 ?auto_151868 ) ( OBJ-AT ?auto_151863 ?auto_151868 ) ( TRUCK-AT ?auto_151870 ?auto_151862 ) ( not ( = ?auto_151863 ?auto_151866 ) ) ( not ( = ?auto_151863 ?auto_151864 ) ) ( not ( = ?auto_151866 ?auto_151864 ) ) ( not ( = ?auto_151867 ?auto_151868 ) ) ( not ( = ?auto_151863 ?auto_151865 ) ) ( not ( = ?auto_151866 ?auto_151865 ) ) ( not ( = ?auto_151864 ?auto_151865 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_151863 ?auto_151866 ?auto_151865 ?auto_151864 ?auto_151862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151954 - OBJ
      ?auto_151955 - OBJ
      ?auto_151956 - OBJ
      ?auto_151957 - OBJ
      ?auto_151953 - LOCATION
    )
    :vars
    (
      ?auto_151959 - LOCATION
      ?auto_151960 - CITY
      ?auto_151958 - LOCATION
      ?auto_151961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_151959 ?auto_151960 ) ( IN-CITY ?auto_151953 ?auto_151960 ) ( not ( = ?auto_151953 ?auto_151959 ) ) ( OBJ-AT ?auto_151955 ?auto_151959 ) ( IN-CITY ?auto_151958 ?auto_151960 ) ( not ( = ?auto_151953 ?auto_151958 ) ) ( OBJ-AT ?auto_151957 ?auto_151958 ) ( OBJ-AT ?auto_151956 ?auto_151959 ) ( OBJ-AT ?auto_151954 ?auto_151959 ) ( TRUCK-AT ?auto_151961 ?auto_151953 ) ( not ( = ?auto_151954 ?auto_151956 ) ) ( not ( = ?auto_151954 ?auto_151957 ) ) ( not ( = ?auto_151956 ?auto_151957 ) ) ( not ( = ?auto_151958 ?auto_151959 ) ) ( not ( = ?auto_151954 ?auto_151955 ) ) ( not ( = ?auto_151956 ?auto_151955 ) ) ( not ( = ?auto_151957 ?auto_151955 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_151954 ?auto_151956 ?auto_151955 ?auto_151957 ?auto_151953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_151983 - OBJ
      ?auto_151984 - OBJ
      ?auto_151985 - OBJ
      ?auto_151986 - OBJ
      ?auto_151982 - LOCATION
    )
    :vars
    (
      ?auto_151988 - LOCATION
      ?auto_151989 - CITY
      ?auto_151987 - LOCATION
      ?auto_151990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_151988 ?auto_151989 ) ( IN-CITY ?auto_151982 ?auto_151989 ) ( not ( = ?auto_151982 ?auto_151988 ) ) ( OBJ-AT ?auto_151984 ?auto_151988 ) ( IN-CITY ?auto_151987 ?auto_151989 ) ( not ( = ?auto_151982 ?auto_151987 ) ) ( OBJ-AT ?auto_151985 ?auto_151987 ) ( OBJ-AT ?auto_151986 ?auto_151988 ) ( OBJ-AT ?auto_151983 ?auto_151988 ) ( TRUCK-AT ?auto_151990 ?auto_151982 ) ( not ( = ?auto_151983 ?auto_151986 ) ) ( not ( = ?auto_151983 ?auto_151985 ) ) ( not ( = ?auto_151986 ?auto_151985 ) ) ( not ( = ?auto_151987 ?auto_151988 ) ) ( not ( = ?auto_151983 ?auto_151984 ) ) ( not ( = ?auto_151986 ?auto_151984 ) ) ( not ( = ?auto_151985 ?auto_151984 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_151983 ?auto_151986 ?auto_151984 ?auto_151985 ?auto_151982 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152074 - OBJ
      ?auto_152075 - OBJ
      ?auto_152076 - OBJ
      ?auto_152077 - OBJ
      ?auto_152073 - LOCATION
    )
    :vars
    (
      ?auto_152079 - LOCATION
      ?auto_152080 - CITY
      ?auto_152078 - LOCATION
      ?auto_152081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152079 ?auto_152080 ) ( IN-CITY ?auto_152073 ?auto_152080 ) ( not ( = ?auto_152073 ?auto_152079 ) ) ( OBJ-AT ?auto_152077 ?auto_152079 ) ( IN-CITY ?auto_152078 ?auto_152080 ) ( not ( = ?auto_152073 ?auto_152078 ) ) ( OBJ-AT ?auto_152076 ?auto_152078 ) ( OBJ-AT ?auto_152074 ?auto_152079 ) ( OBJ-AT ?auto_152075 ?auto_152079 ) ( TRUCK-AT ?auto_152081 ?auto_152073 ) ( not ( = ?auto_152075 ?auto_152074 ) ) ( not ( = ?auto_152075 ?auto_152076 ) ) ( not ( = ?auto_152074 ?auto_152076 ) ) ( not ( = ?auto_152078 ?auto_152079 ) ) ( not ( = ?auto_152075 ?auto_152077 ) ) ( not ( = ?auto_152074 ?auto_152077 ) ) ( not ( = ?auto_152076 ?auto_152077 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152075 ?auto_152074 ?auto_152077 ?auto_152076 ?auto_152073 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152103 - OBJ
      ?auto_152104 - OBJ
      ?auto_152105 - OBJ
      ?auto_152106 - OBJ
      ?auto_152102 - LOCATION
    )
    :vars
    (
      ?auto_152108 - LOCATION
      ?auto_152109 - CITY
      ?auto_152107 - LOCATION
      ?auto_152110 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152108 ?auto_152109 ) ( IN-CITY ?auto_152102 ?auto_152109 ) ( not ( = ?auto_152102 ?auto_152108 ) ) ( OBJ-AT ?auto_152105 ?auto_152108 ) ( IN-CITY ?auto_152107 ?auto_152109 ) ( not ( = ?auto_152102 ?auto_152107 ) ) ( OBJ-AT ?auto_152106 ?auto_152107 ) ( OBJ-AT ?auto_152103 ?auto_152108 ) ( OBJ-AT ?auto_152104 ?auto_152108 ) ( TRUCK-AT ?auto_152110 ?auto_152102 ) ( not ( = ?auto_152104 ?auto_152103 ) ) ( not ( = ?auto_152104 ?auto_152106 ) ) ( not ( = ?auto_152103 ?auto_152106 ) ) ( not ( = ?auto_152107 ?auto_152108 ) ) ( not ( = ?auto_152104 ?auto_152105 ) ) ( not ( = ?auto_152103 ?auto_152105 ) ) ( not ( = ?auto_152106 ?auto_152105 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152104 ?auto_152103 ?auto_152105 ?auto_152106 ?auto_152102 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152195 - OBJ
      ?auto_152196 - OBJ
      ?auto_152197 - OBJ
      ?auto_152198 - OBJ
      ?auto_152194 - LOCATION
    )
    :vars
    (
      ?auto_152200 - LOCATION
      ?auto_152201 - CITY
      ?auto_152199 - LOCATION
      ?auto_152202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152200 ?auto_152201 ) ( IN-CITY ?auto_152194 ?auto_152201 ) ( not ( = ?auto_152194 ?auto_152200 ) ) ( OBJ-AT ?auto_152198 ?auto_152200 ) ( IN-CITY ?auto_152199 ?auto_152201 ) ( not ( = ?auto_152194 ?auto_152199 ) ) ( OBJ-AT ?auto_152196 ?auto_152199 ) ( OBJ-AT ?auto_152195 ?auto_152200 ) ( OBJ-AT ?auto_152197 ?auto_152200 ) ( TRUCK-AT ?auto_152202 ?auto_152194 ) ( not ( = ?auto_152197 ?auto_152195 ) ) ( not ( = ?auto_152197 ?auto_152196 ) ) ( not ( = ?auto_152195 ?auto_152196 ) ) ( not ( = ?auto_152199 ?auto_152200 ) ) ( not ( = ?auto_152197 ?auto_152198 ) ) ( not ( = ?auto_152195 ?auto_152198 ) ) ( not ( = ?auto_152196 ?auto_152198 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152197 ?auto_152195 ?auto_152198 ?auto_152196 ?auto_152194 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152224 - OBJ
      ?auto_152225 - OBJ
      ?auto_152226 - OBJ
      ?auto_152227 - OBJ
      ?auto_152223 - LOCATION
    )
    :vars
    (
      ?auto_152229 - LOCATION
      ?auto_152230 - CITY
      ?auto_152228 - LOCATION
      ?auto_152231 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152229 ?auto_152230 ) ( IN-CITY ?auto_152223 ?auto_152230 ) ( not ( = ?auto_152223 ?auto_152229 ) ) ( OBJ-AT ?auto_152226 ?auto_152229 ) ( IN-CITY ?auto_152228 ?auto_152230 ) ( not ( = ?auto_152223 ?auto_152228 ) ) ( OBJ-AT ?auto_152225 ?auto_152228 ) ( OBJ-AT ?auto_152224 ?auto_152229 ) ( OBJ-AT ?auto_152227 ?auto_152229 ) ( TRUCK-AT ?auto_152231 ?auto_152223 ) ( not ( = ?auto_152227 ?auto_152224 ) ) ( not ( = ?auto_152227 ?auto_152225 ) ) ( not ( = ?auto_152224 ?auto_152225 ) ) ( not ( = ?auto_152228 ?auto_152229 ) ) ( not ( = ?auto_152227 ?auto_152226 ) ) ( not ( = ?auto_152224 ?auto_152226 ) ) ( not ( = ?auto_152225 ?auto_152226 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152227 ?auto_152224 ?auto_152226 ?auto_152225 ?auto_152223 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152283 - OBJ
      ?auto_152284 - OBJ
      ?auto_152285 - OBJ
      ?auto_152286 - OBJ
      ?auto_152282 - LOCATION
    )
    :vars
    (
      ?auto_152288 - LOCATION
      ?auto_152289 - CITY
      ?auto_152287 - LOCATION
      ?auto_152290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152288 ?auto_152289 ) ( IN-CITY ?auto_152282 ?auto_152289 ) ( not ( = ?auto_152282 ?auto_152288 ) ) ( OBJ-AT ?auto_152284 ?auto_152288 ) ( IN-CITY ?auto_152287 ?auto_152289 ) ( not ( = ?auto_152282 ?auto_152287 ) ) ( OBJ-AT ?auto_152286 ?auto_152287 ) ( OBJ-AT ?auto_152283 ?auto_152288 ) ( OBJ-AT ?auto_152285 ?auto_152288 ) ( TRUCK-AT ?auto_152290 ?auto_152282 ) ( not ( = ?auto_152285 ?auto_152283 ) ) ( not ( = ?auto_152285 ?auto_152286 ) ) ( not ( = ?auto_152283 ?auto_152286 ) ) ( not ( = ?auto_152287 ?auto_152288 ) ) ( not ( = ?auto_152285 ?auto_152284 ) ) ( not ( = ?auto_152283 ?auto_152284 ) ) ( not ( = ?auto_152286 ?auto_152284 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152285 ?auto_152283 ?auto_152284 ?auto_152286 ?auto_152282 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152344 - OBJ
      ?auto_152345 - OBJ
      ?auto_152346 - OBJ
      ?auto_152347 - OBJ
      ?auto_152343 - LOCATION
    )
    :vars
    (
      ?auto_152349 - LOCATION
      ?auto_152350 - CITY
      ?auto_152348 - LOCATION
      ?auto_152351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152349 ?auto_152350 ) ( IN-CITY ?auto_152343 ?auto_152350 ) ( not ( = ?auto_152343 ?auto_152349 ) ) ( OBJ-AT ?auto_152345 ?auto_152349 ) ( IN-CITY ?auto_152348 ?auto_152350 ) ( not ( = ?auto_152343 ?auto_152348 ) ) ( OBJ-AT ?auto_152346 ?auto_152348 ) ( OBJ-AT ?auto_152344 ?auto_152349 ) ( OBJ-AT ?auto_152347 ?auto_152349 ) ( TRUCK-AT ?auto_152351 ?auto_152343 ) ( not ( = ?auto_152347 ?auto_152344 ) ) ( not ( = ?auto_152347 ?auto_152346 ) ) ( not ( = ?auto_152344 ?auto_152346 ) ) ( not ( = ?auto_152348 ?auto_152349 ) ) ( not ( = ?auto_152347 ?auto_152345 ) ) ( not ( = ?auto_152344 ?auto_152345 ) ) ( not ( = ?auto_152346 ?auto_152345 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152347 ?auto_152344 ?auto_152345 ?auto_152346 ?auto_152343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152435 - OBJ
      ?auto_152436 - OBJ
      ?auto_152437 - OBJ
      ?auto_152438 - OBJ
      ?auto_152434 - LOCATION
    )
    :vars
    (
      ?auto_152440 - LOCATION
      ?auto_152441 - CITY
      ?auto_152439 - LOCATION
      ?auto_152442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152440 ?auto_152441 ) ( IN-CITY ?auto_152434 ?auto_152441 ) ( not ( = ?auto_152434 ?auto_152440 ) ) ( OBJ-AT ?auto_152438 ?auto_152440 ) ( IN-CITY ?auto_152439 ?auto_152441 ) ( not ( = ?auto_152434 ?auto_152439 ) ) ( OBJ-AT ?auto_152435 ?auto_152439 ) ( OBJ-AT ?auto_152437 ?auto_152440 ) ( OBJ-AT ?auto_152436 ?auto_152440 ) ( TRUCK-AT ?auto_152442 ?auto_152434 ) ( not ( = ?auto_152436 ?auto_152437 ) ) ( not ( = ?auto_152436 ?auto_152435 ) ) ( not ( = ?auto_152437 ?auto_152435 ) ) ( not ( = ?auto_152439 ?auto_152440 ) ) ( not ( = ?auto_152436 ?auto_152438 ) ) ( not ( = ?auto_152437 ?auto_152438 ) ) ( not ( = ?auto_152435 ?auto_152438 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152436 ?auto_152437 ?auto_152438 ?auto_152435 ?auto_152434 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152464 - OBJ
      ?auto_152465 - OBJ
      ?auto_152466 - OBJ
      ?auto_152467 - OBJ
      ?auto_152463 - LOCATION
    )
    :vars
    (
      ?auto_152469 - LOCATION
      ?auto_152470 - CITY
      ?auto_152468 - LOCATION
      ?auto_152471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152469 ?auto_152470 ) ( IN-CITY ?auto_152463 ?auto_152470 ) ( not ( = ?auto_152463 ?auto_152469 ) ) ( OBJ-AT ?auto_152466 ?auto_152469 ) ( IN-CITY ?auto_152468 ?auto_152470 ) ( not ( = ?auto_152463 ?auto_152468 ) ) ( OBJ-AT ?auto_152464 ?auto_152468 ) ( OBJ-AT ?auto_152467 ?auto_152469 ) ( OBJ-AT ?auto_152465 ?auto_152469 ) ( TRUCK-AT ?auto_152471 ?auto_152463 ) ( not ( = ?auto_152465 ?auto_152467 ) ) ( not ( = ?auto_152465 ?auto_152464 ) ) ( not ( = ?auto_152467 ?auto_152464 ) ) ( not ( = ?auto_152468 ?auto_152469 ) ) ( not ( = ?auto_152465 ?auto_152466 ) ) ( not ( = ?auto_152467 ?auto_152466 ) ) ( not ( = ?auto_152464 ?auto_152466 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152465 ?auto_152467 ?auto_152466 ?auto_152464 ?auto_152463 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152493 - OBJ
      ?auto_152494 - OBJ
      ?auto_152495 - OBJ
      ?auto_152496 - OBJ
      ?auto_152492 - LOCATION
    )
    :vars
    (
      ?auto_152498 - LOCATION
      ?auto_152499 - CITY
      ?auto_152497 - LOCATION
      ?auto_152500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152498 ?auto_152499 ) ( IN-CITY ?auto_152492 ?auto_152499 ) ( not ( = ?auto_152492 ?auto_152498 ) ) ( OBJ-AT ?auto_152496 ?auto_152498 ) ( IN-CITY ?auto_152497 ?auto_152499 ) ( not ( = ?auto_152492 ?auto_152497 ) ) ( OBJ-AT ?auto_152493 ?auto_152497 ) ( OBJ-AT ?auto_152494 ?auto_152498 ) ( OBJ-AT ?auto_152495 ?auto_152498 ) ( TRUCK-AT ?auto_152500 ?auto_152492 ) ( not ( = ?auto_152495 ?auto_152494 ) ) ( not ( = ?auto_152495 ?auto_152493 ) ) ( not ( = ?auto_152494 ?auto_152493 ) ) ( not ( = ?auto_152497 ?auto_152498 ) ) ( not ( = ?auto_152495 ?auto_152496 ) ) ( not ( = ?auto_152494 ?auto_152496 ) ) ( not ( = ?auto_152493 ?auto_152496 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152495 ?auto_152494 ?auto_152496 ?auto_152493 ?auto_152492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152522 - OBJ
      ?auto_152523 - OBJ
      ?auto_152524 - OBJ
      ?auto_152525 - OBJ
      ?auto_152521 - LOCATION
    )
    :vars
    (
      ?auto_152527 - LOCATION
      ?auto_152528 - CITY
      ?auto_152526 - LOCATION
      ?auto_152529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152527 ?auto_152528 ) ( IN-CITY ?auto_152521 ?auto_152528 ) ( not ( = ?auto_152521 ?auto_152527 ) ) ( OBJ-AT ?auto_152524 ?auto_152527 ) ( IN-CITY ?auto_152526 ?auto_152528 ) ( not ( = ?auto_152521 ?auto_152526 ) ) ( OBJ-AT ?auto_152522 ?auto_152526 ) ( OBJ-AT ?auto_152523 ?auto_152527 ) ( OBJ-AT ?auto_152525 ?auto_152527 ) ( TRUCK-AT ?auto_152529 ?auto_152521 ) ( not ( = ?auto_152525 ?auto_152523 ) ) ( not ( = ?auto_152525 ?auto_152522 ) ) ( not ( = ?auto_152523 ?auto_152522 ) ) ( not ( = ?auto_152526 ?auto_152527 ) ) ( not ( = ?auto_152525 ?auto_152524 ) ) ( not ( = ?auto_152523 ?auto_152524 ) ) ( not ( = ?auto_152522 ?auto_152524 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152525 ?auto_152523 ?auto_152524 ?auto_152522 ?auto_152521 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152644 - OBJ
      ?auto_152645 - OBJ
      ?auto_152646 - OBJ
      ?auto_152647 - OBJ
      ?auto_152643 - LOCATION
    )
    :vars
    (
      ?auto_152649 - LOCATION
      ?auto_152650 - CITY
      ?auto_152648 - LOCATION
      ?auto_152651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152649 ?auto_152650 ) ( IN-CITY ?auto_152643 ?auto_152650 ) ( not ( = ?auto_152643 ?auto_152649 ) ) ( OBJ-AT ?auto_152645 ?auto_152649 ) ( IN-CITY ?auto_152648 ?auto_152650 ) ( not ( = ?auto_152643 ?auto_152648 ) ) ( OBJ-AT ?auto_152644 ?auto_152648 ) ( OBJ-AT ?auto_152647 ?auto_152649 ) ( OBJ-AT ?auto_152646 ?auto_152649 ) ( TRUCK-AT ?auto_152651 ?auto_152643 ) ( not ( = ?auto_152646 ?auto_152647 ) ) ( not ( = ?auto_152646 ?auto_152644 ) ) ( not ( = ?auto_152647 ?auto_152644 ) ) ( not ( = ?auto_152648 ?auto_152649 ) ) ( not ( = ?auto_152646 ?auto_152645 ) ) ( not ( = ?auto_152647 ?auto_152645 ) ) ( not ( = ?auto_152644 ?auto_152645 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152646 ?auto_152647 ?auto_152645 ?auto_152644 ?auto_152643 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152673 - OBJ
      ?auto_152674 - OBJ
      ?auto_152675 - OBJ
      ?auto_152676 - OBJ
      ?auto_152672 - LOCATION
    )
    :vars
    (
      ?auto_152678 - LOCATION
      ?auto_152679 - CITY
      ?auto_152677 - LOCATION
      ?auto_152680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152678 ?auto_152679 ) ( IN-CITY ?auto_152672 ?auto_152679 ) ( not ( = ?auto_152672 ?auto_152678 ) ) ( OBJ-AT ?auto_152674 ?auto_152678 ) ( IN-CITY ?auto_152677 ?auto_152679 ) ( not ( = ?auto_152672 ?auto_152677 ) ) ( OBJ-AT ?auto_152673 ?auto_152677 ) ( OBJ-AT ?auto_152675 ?auto_152678 ) ( OBJ-AT ?auto_152676 ?auto_152678 ) ( TRUCK-AT ?auto_152680 ?auto_152672 ) ( not ( = ?auto_152676 ?auto_152675 ) ) ( not ( = ?auto_152676 ?auto_152673 ) ) ( not ( = ?auto_152675 ?auto_152673 ) ) ( not ( = ?auto_152677 ?auto_152678 ) ) ( not ( = ?auto_152676 ?auto_152674 ) ) ( not ( = ?auto_152675 ?auto_152674 ) ) ( not ( = ?auto_152673 ?auto_152674 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152676 ?auto_152675 ?auto_152674 ?auto_152673 ?auto_152672 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152858 - OBJ
      ?auto_152859 - OBJ
      ?auto_152860 - OBJ
      ?auto_152861 - OBJ
      ?auto_152857 - LOCATION
    )
    :vars
    (
      ?auto_152863 - LOCATION
      ?auto_152864 - CITY
      ?auto_152862 - LOCATION
      ?auto_152865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152863 ?auto_152864 ) ( IN-CITY ?auto_152857 ?auto_152864 ) ( not ( = ?auto_152857 ?auto_152863 ) ) ( OBJ-AT ?auto_152858 ?auto_152863 ) ( IN-CITY ?auto_152862 ?auto_152864 ) ( not ( = ?auto_152857 ?auto_152862 ) ) ( OBJ-AT ?auto_152861 ?auto_152862 ) ( OBJ-AT ?auto_152860 ?auto_152863 ) ( OBJ-AT ?auto_152859 ?auto_152863 ) ( TRUCK-AT ?auto_152865 ?auto_152857 ) ( not ( = ?auto_152859 ?auto_152860 ) ) ( not ( = ?auto_152859 ?auto_152861 ) ) ( not ( = ?auto_152860 ?auto_152861 ) ) ( not ( = ?auto_152862 ?auto_152863 ) ) ( not ( = ?auto_152859 ?auto_152858 ) ) ( not ( = ?auto_152860 ?auto_152858 ) ) ( not ( = ?auto_152861 ?auto_152858 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152859 ?auto_152860 ?auto_152858 ?auto_152861 ?auto_152857 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152887 - OBJ
      ?auto_152888 - OBJ
      ?auto_152889 - OBJ
      ?auto_152890 - OBJ
      ?auto_152886 - LOCATION
    )
    :vars
    (
      ?auto_152892 - LOCATION
      ?auto_152893 - CITY
      ?auto_152891 - LOCATION
      ?auto_152894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152892 ?auto_152893 ) ( IN-CITY ?auto_152886 ?auto_152893 ) ( not ( = ?auto_152886 ?auto_152892 ) ) ( OBJ-AT ?auto_152887 ?auto_152892 ) ( IN-CITY ?auto_152891 ?auto_152893 ) ( not ( = ?auto_152886 ?auto_152891 ) ) ( OBJ-AT ?auto_152889 ?auto_152891 ) ( OBJ-AT ?auto_152890 ?auto_152892 ) ( OBJ-AT ?auto_152888 ?auto_152892 ) ( TRUCK-AT ?auto_152894 ?auto_152886 ) ( not ( = ?auto_152888 ?auto_152890 ) ) ( not ( = ?auto_152888 ?auto_152889 ) ) ( not ( = ?auto_152890 ?auto_152889 ) ) ( not ( = ?auto_152891 ?auto_152892 ) ) ( not ( = ?auto_152888 ?auto_152887 ) ) ( not ( = ?auto_152890 ?auto_152887 ) ) ( not ( = ?auto_152889 ?auto_152887 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152888 ?auto_152890 ?auto_152887 ?auto_152889 ?auto_152886 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_152978 - OBJ
      ?auto_152979 - OBJ
      ?auto_152980 - OBJ
      ?auto_152981 - OBJ
      ?auto_152977 - LOCATION
    )
    :vars
    (
      ?auto_152983 - LOCATION
      ?auto_152984 - CITY
      ?auto_152982 - LOCATION
      ?auto_152985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_152983 ?auto_152984 ) ( IN-CITY ?auto_152977 ?auto_152984 ) ( not ( = ?auto_152977 ?auto_152983 ) ) ( OBJ-AT ?auto_152978 ?auto_152983 ) ( IN-CITY ?auto_152982 ?auto_152984 ) ( not ( = ?auto_152977 ?auto_152982 ) ) ( OBJ-AT ?auto_152981 ?auto_152982 ) ( OBJ-AT ?auto_152979 ?auto_152983 ) ( OBJ-AT ?auto_152980 ?auto_152983 ) ( TRUCK-AT ?auto_152985 ?auto_152977 ) ( not ( = ?auto_152980 ?auto_152979 ) ) ( not ( = ?auto_152980 ?auto_152981 ) ) ( not ( = ?auto_152979 ?auto_152981 ) ) ( not ( = ?auto_152982 ?auto_152983 ) ) ( not ( = ?auto_152980 ?auto_152978 ) ) ( not ( = ?auto_152979 ?auto_152978 ) ) ( not ( = ?auto_152981 ?auto_152978 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_152980 ?auto_152979 ?auto_152978 ?auto_152981 ?auto_152977 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_153039 - OBJ
      ?auto_153040 - OBJ
      ?auto_153041 - OBJ
      ?auto_153042 - OBJ
      ?auto_153038 - LOCATION
    )
    :vars
    (
      ?auto_153044 - LOCATION
      ?auto_153045 - CITY
      ?auto_153043 - LOCATION
      ?auto_153046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_153044 ?auto_153045 ) ( IN-CITY ?auto_153038 ?auto_153045 ) ( not ( = ?auto_153038 ?auto_153044 ) ) ( OBJ-AT ?auto_153039 ?auto_153044 ) ( IN-CITY ?auto_153043 ?auto_153045 ) ( not ( = ?auto_153038 ?auto_153043 ) ) ( OBJ-AT ?auto_153041 ?auto_153043 ) ( OBJ-AT ?auto_153040 ?auto_153044 ) ( OBJ-AT ?auto_153042 ?auto_153044 ) ( TRUCK-AT ?auto_153046 ?auto_153038 ) ( not ( = ?auto_153042 ?auto_153040 ) ) ( not ( = ?auto_153042 ?auto_153041 ) ) ( not ( = ?auto_153040 ?auto_153041 ) ) ( not ( = ?auto_153043 ?auto_153044 ) ) ( not ( = ?auto_153042 ?auto_153039 ) ) ( not ( = ?auto_153040 ?auto_153039 ) ) ( not ( = ?auto_153041 ?auto_153039 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_153042 ?auto_153040 ?auto_153039 ?auto_153041 ?auto_153038 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_153130 - OBJ
      ?auto_153131 - OBJ
      ?auto_153132 - OBJ
      ?auto_153133 - OBJ
      ?auto_153129 - LOCATION
    )
    :vars
    (
      ?auto_153135 - LOCATION
      ?auto_153136 - CITY
      ?auto_153134 - LOCATION
      ?auto_153137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_153135 ?auto_153136 ) ( IN-CITY ?auto_153129 ?auto_153136 ) ( not ( = ?auto_153129 ?auto_153135 ) ) ( OBJ-AT ?auto_153130 ?auto_153135 ) ( IN-CITY ?auto_153134 ?auto_153136 ) ( not ( = ?auto_153129 ?auto_153134 ) ) ( OBJ-AT ?auto_153131 ?auto_153134 ) ( OBJ-AT ?auto_153133 ?auto_153135 ) ( OBJ-AT ?auto_153132 ?auto_153135 ) ( TRUCK-AT ?auto_153137 ?auto_153129 ) ( not ( = ?auto_153132 ?auto_153133 ) ) ( not ( = ?auto_153132 ?auto_153131 ) ) ( not ( = ?auto_153133 ?auto_153131 ) ) ( not ( = ?auto_153134 ?auto_153135 ) ) ( not ( = ?auto_153132 ?auto_153130 ) ) ( not ( = ?auto_153133 ?auto_153130 ) ) ( not ( = ?auto_153131 ?auto_153130 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_153132 ?auto_153133 ?auto_153130 ?auto_153131 ?auto_153129 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_153159 - OBJ
      ?auto_153160 - OBJ
      ?auto_153161 - OBJ
      ?auto_153162 - OBJ
      ?auto_153158 - LOCATION
    )
    :vars
    (
      ?auto_153164 - LOCATION
      ?auto_153165 - CITY
      ?auto_153163 - LOCATION
      ?auto_153166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_153164 ?auto_153165 ) ( IN-CITY ?auto_153158 ?auto_153165 ) ( not ( = ?auto_153158 ?auto_153164 ) ) ( OBJ-AT ?auto_153159 ?auto_153164 ) ( IN-CITY ?auto_153163 ?auto_153165 ) ( not ( = ?auto_153158 ?auto_153163 ) ) ( OBJ-AT ?auto_153160 ?auto_153163 ) ( OBJ-AT ?auto_153161 ?auto_153164 ) ( OBJ-AT ?auto_153162 ?auto_153164 ) ( TRUCK-AT ?auto_153166 ?auto_153158 ) ( not ( = ?auto_153162 ?auto_153161 ) ) ( not ( = ?auto_153162 ?auto_153160 ) ) ( not ( = ?auto_153161 ?auto_153160 ) ) ( not ( = ?auto_153163 ?auto_153164 ) ) ( not ( = ?auto_153162 ?auto_153159 ) ) ( not ( = ?auto_153161 ?auto_153159 ) ) ( not ( = ?auto_153160 ?auto_153159 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_153162 ?auto_153161 ?auto_153159 ?auto_153160 ?auto_153158 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_153455 - OBJ
      ?auto_153454 - LOCATION
    )
    :vars
    (
      ?auto_153457 - LOCATION
      ?auto_153458 - CITY
      ?auto_153456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_153457 ?auto_153458 ) ( IN-CITY ?auto_153454 ?auto_153458 ) ( not ( = ?auto_153454 ?auto_153457 ) ) ( OBJ-AT ?auto_153455 ?auto_153457 ) ( TRUCK-AT ?auto_153456 ?auto_153454 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_153456 ?auto_153454 ?auto_153457 ?auto_153458 )
      ( !LOAD-TRUCK ?auto_153455 ?auto_153456 ?auto_153457 )
      ( !DRIVE-TRUCK ?auto_153456 ?auto_153457 ?auto_153454 ?auto_153458 )
      ( !UNLOAD-TRUCK ?auto_153455 ?auto_153456 ?auto_153454 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167028 - OBJ
      ?auto_167029 - OBJ
      ?auto_167030 - OBJ
      ?auto_167031 - OBJ
      ?auto_167032 - OBJ
      ?auto_167027 - LOCATION
    )
    :vars
    (
      ?auto_167033 - LOCATION
      ?auto_167034 - CITY
      ?auto_167036 - LOCATION
      ?auto_167035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167033 ?auto_167034 ) ( IN-CITY ?auto_167027 ?auto_167034 ) ( not ( = ?auto_167027 ?auto_167033 ) ) ( OBJ-AT ?auto_167032 ?auto_167033 ) ( IN-CITY ?auto_167036 ?auto_167034 ) ( not ( = ?auto_167027 ?auto_167036 ) ) ( OBJ-AT ?auto_167031 ?auto_167036 ) ( OBJ-AT ?auto_167030 ?auto_167033 ) ( OBJ-AT ?auto_167029 ?auto_167036 ) ( OBJ-AT ?auto_167028 ?auto_167036 ) ( TRUCK-AT ?auto_167035 ?auto_167027 ) ( not ( = ?auto_167028 ?auto_167029 ) ) ( not ( = ?auto_167028 ?auto_167030 ) ) ( not ( = ?auto_167029 ?auto_167030 ) ) ( not ( = ?auto_167033 ?auto_167036 ) ) ( not ( = ?auto_167028 ?auto_167031 ) ) ( not ( = ?auto_167029 ?auto_167031 ) ) ( not ( = ?auto_167030 ?auto_167031 ) ) ( not ( = ?auto_167028 ?auto_167032 ) ) ( not ( = ?auto_167029 ?auto_167032 ) ) ( not ( = ?auto_167030 ?auto_167032 ) ) ( not ( = ?auto_167031 ?auto_167032 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_167028 ?auto_167029 ?auto_167031 ?auto_167030 ?auto_167027 )
      ( DELIVER-1PKG ?auto_167032 ?auto_167027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167071 - OBJ
      ?auto_167072 - OBJ
      ?auto_167073 - OBJ
      ?auto_167074 - OBJ
      ?auto_167075 - OBJ
      ?auto_167070 - LOCATION
    )
    :vars
    (
      ?auto_167078 - LOCATION
      ?auto_167076 - CITY
      ?auto_167077 - LOCATION
      ?auto_167079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167078 ?auto_167076 ) ( IN-CITY ?auto_167070 ?auto_167076 ) ( not ( = ?auto_167070 ?auto_167078 ) ) ( OBJ-AT ?auto_167074 ?auto_167078 ) ( IN-CITY ?auto_167077 ?auto_167076 ) ( not ( = ?auto_167070 ?auto_167077 ) ) ( OBJ-AT ?auto_167075 ?auto_167077 ) ( OBJ-AT ?auto_167073 ?auto_167078 ) ( OBJ-AT ?auto_167072 ?auto_167077 ) ( OBJ-AT ?auto_167071 ?auto_167077 ) ( TRUCK-AT ?auto_167079 ?auto_167070 ) ( not ( = ?auto_167071 ?auto_167072 ) ) ( not ( = ?auto_167071 ?auto_167073 ) ) ( not ( = ?auto_167072 ?auto_167073 ) ) ( not ( = ?auto_167078 ?auto_167077 ) ) ( not ( = ?auto_167071 ?auto_167075 ) ) ( not ( = ?auto_167072 ?auto_167075 ) ) ( not ( = ?auto_167073 ?auto_167075 ) ) ( not ( = ?auto_167071 ?auto_167074 ) ) ( not ( = ?auto_167072 ?auto_167074 ) ) ( not ( = ?auto_167073 ?auto_167074 ) ) ( not ( = ?auto_167075 ?auto_167074 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167071 ?auto_167072 ?auto_167073 ?auto_167075 ?auto_167074 ?auto_167070 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167114 - OBJ
      ?auto_167115 - OBJ
      ?auto_167116 - OBJ
      ?auto_167117 - OBJ
      ?auto_167118 - OBJ
      ?auto_167113 - LOCATION
    )
    :vars
    (
      ?auto_167119 - LOCATION
      ?auto_167120 - CITY
      ?auto_167122 - LOCATION
      ?auto_167121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167119 ?auto_167120 ) ( IN-CITY ?auto_167113 ?auto_167120 ) ( not ( = ?auto_167113 ?auto_167119 ) ) ( OBJ-AT ?auto_167118 ?auto_167119 ) ( IN-CITY ?auto_167122 ?auto_167120 ) ( not ( = ?auto_167113 ?auto_167122 ) ) ( OBJ-AT ?auto_167116 ?auto_167122 ) ( OBJ-AT ?auto_167117 ?auto_167119 ) ( OBJ-AT ?auto_167115 ?auto_167122 ) ( OBJ-AT ?auto_167114 ?auto_167122 ) ( TRUCK-AT ?auto_167121 ?auto_167113 ) ( not ( = ?auto_167114 ?auto_167115 ) ) ( not ( = ?auto_167114 ?auto_167117 ) ) ( not ( = ?auto_167115 ?auto_167117 ) ) ( not ( = ?auto_167119 ?auto_167122 ) ) ( not ( = ?auto_167114 ?auto_167116 ) ) ( not ( = ?auto_167115 ?auto_167116 ) ) ( not ( = ?auto_167117 ?auto_167116 ) ) ( not ( = ?auto_167114 ?auto_167118 ) ) ( not ( = ?auto_167115 ?auto_167118 ) ) ( not ( = ?auto_167117 ?auto_167118 ) ) ( not ( = ?auto_167116 ?auto_167118 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167114 ?auto_167115 ?auto_167117 ?auto_167118 ?auto_167116 ?auto_167113 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167157 - OBJ
      ?auto_167158 - OBJ
      ?auto_167159 - OBJ
      ?auto_167160 - OBJ
      ?auto_167161 - OBJ
      ?auto_167156 - LOCATION
    )
    :vars
    (
      ?auto_167162 - LOCATION
      ?auto_167163 - CITY
      ?auto_167165 - LOCATION
      ?auto_167164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167162 ?auto_167163 ) ( IN-CITY ?auto_167156 ?auto_167163 ) ( not ( = ?auto_167156 ?auto_167162 ) ) ( OBJ-AT ?auto_167160 ?auto_167162 ) ( IN-CITY ?auto_167165 ?auto_167163 ) ( not ( = ?auto_167156 ?auto_167165 ) ) ( OBJ-AT ?auto_167159 ?auto_167165 ) ( OBJ-AT ?auto_167161 ?auto_167162 ) ( OBJ-AT ?auto_167158 ?auto_167165 ) ( OBJ-AT ?auto_167157 ?auto_167165 ) ( TRUCK-AT ?auto_167164 ?auto_167156 ) ( not ( = ?auto_167157 ?auto_167158 ) ) ( not ( = ?auto_167157 ?auto_167161 ) ) ( not ( = ?auto_167158 ?auto_167161 ) ) ( not ( = ?auto_167162 ?auto_167165 ) ) ( not ( = ?auto_167157 ?auto_167159 ) ) ( not ( = ?auto_167158 ?auto_167159 ) ) ( not ( = ?auto_167161 ?auto_167159 ) ) ( not ( = ?auto_167157 ?auto_167160 ) ) ( not ( = ?auto_167158 ?auto_167160 ) ) ( not ( = ?auto_167161 ?auto_167160 ) ) ( not ( = ?auto_167159 ?auto_167160 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167157 ?auto_167158 ?auto_167161 ?auto_167160 ?auto_167159 ?auto_167156 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167338 - OBJ
      ?auto_167339 - OBJ
      ?auto_167340 - OBJ
      ?auto_167341 - OBJ
      ?auto_167342 - OBJ
      ?auto_167337 - LOCATION
    )
    :vars
    (
      ?auto_167343 - LOCATION
      ?auto_167344 - CITY
      ?auto_167346 - LOCATION
      ?auto_167345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167343 ?auto_167344 ) ( IN-CITY ?auto_167337 ?auto_167344 ) ( not ( = ?auto_167337 ?auto_167343 ) ) ( OBJ-AT ?auto_167340 ?auto_167343 ) ( IN-CITY ?auto_167346 ?auto_167344 ) ( not ( = ?auto_167337 ?auto_167346 ) ) ( OBJ-AT ?auto_167342 ?auto_167346 ) ( OBJ-AT ?auto_167341 ?auto_167343 ) ( OBJ-AT ?auto_167339 ?auto_167346 ) ( OBJ-AT ?auto_167338 ?auto_167346 ) ( TRUCK-AT ?auto_167345 ?auto_167337 ) ( not ( = ?auto_167338 ?auto_167339 ) ) ( not ( = ?auto_167338 ?auto_167341 ) ) ( not ( = ?auto_167339 ?auto_167341 ) ) ( not ( = ?auto_167343 ?auto_167346 ) ) ( not ( = ?auto_167338 ?auto_167342 ) ) ( not ( = ?auto_167339 ?auto_167342 ) ) ( not ( = ?auto_167341 ?auto_167342 ) ) ( not ( = ?auto_167338 ?auto_167340 ) ) ( not ( = ?auto_167339 ?auto_167340 ) ) ( not ( = ?auto_167341 ?auto_167340 ) ) ( not ( = ?auto_167342 ?auto_167340 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167338 ?auto_167339 ?auto_167341 ?auto_167340 ?auto_167342 ?auto_167337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167381 - OBJ
      ?auto_167382 - OBJ
      ?auto_167383 - OBJ
      ?auto_167384 - OBJ
      ?auto_167385 - OBJ
      ?auto_167380 - LOCATION
    )
    :vars
    (
      ?auto_167386 - LOCATION
      ?auto_167387 - CITY
      ?auto_167389 - LOCATION
      ?auto_167388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167386 ?auto_167387 ) ( IN-CITY ?auto_167380 ?auto_167387 ) ( not ( = ?auto_167380 ?auto_167386 ) ) ( OBJ-AT ?auto_167383 ?auto_167386 ) ( IN-CITY ?auto_167389 ?auto_167387 ) ( not ( = ?auto_167380 ?auto_167389 ) ) ( OBJ-AT ?auto_167384 ?auto_167389 ) ( OBJ-AT ?auto_167385 ?auto_167386 ) ( OBJ-AT ?auto_167382 ?auto_167389 ) ( OBJ-AT ?auto_167381 ?auto_167389 ) ( TRUCK-AT ?auto_167388 ?auto_167380 ) ( not ( = ?auto_167381 ?auto_167382 ) ) ( not ( = ?auto_167381 ?auto_167385 ) ) ( not ( = ?auto_167382 ?auto_167385 ) ) ( not ( = ?auto_167386 ?auto_167389 ) ) ( not ( = ?auto_167381 ?auto_167384 ) ) ( not ( = ?auto_167382 ?auto_167384 ) ) ( not ( = ?auto_167385 ?auto_167384 ) ) ( not ( = ?auto_167381 ?auto_167383 ) ) ( not ( = ?auto_167382 ?auto_167383 ) ) ( not ( = ?auto_167385 ?auto_167383 ) ) ( not ( = ?auto_167384 ?auto_167383 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167381 ?auto_167382 ?auto_167385 ?auto_167383 ?auto_167384 ?auto_167380 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167608 - OBJ
      ?auto_167609 - OBJ
      ?auto_167610 - OBJ
      ?auto_167611 - OBJ
      ?auto_167612 - OBJ
      ?auto_167607 - LOCATION
    )
    :vars
    (
      ?auto_167613 - LOCATION
      ?auto_167614 - CITY
      ?auto_167616 - LOCATION
      ?auto_167615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167613 ?auto_167614 ) ( IN-CITY ?auto_167607 ?auto_167614 ) ( not ( = ?auto_167607 ?auto_167613 ) ) ( OBJ-AT ?auto_167612 ?auto_167613 ) ( IN-CITY ?auto_167616 ?auto_167614 ) ( not ( = ?auto_167607 ?auto_167616 ) ) ( OBJ-AT ?auto_167611 ?auto_167616 ) ( OBJ-AT ?auto_167609 ?auto_167613 ) ( OBJ-AT ?auto_167610 ?auto_167616 ) ( OBJ-AT ?auto_167608 ?auto_167616 ) ( TRUCK-AT ?auto_167615 ?auto_167607 ) ( not ( = ?auto_167608 ?auto_167610 ) ) ( not ( = ?auto_167608 ?auto_167609 ) ) ( not ( = ?auto_167610 ?auto_167609 ) ) ( not ( = ?auto_167613 ?auto_167616 ) ) ( not ( = ?auto_167608 ?auto_167611 ) ) ( not ( = ?auto_167610 ?auto_167611 ) ) ( not ( = ?auto_167609 ?auto_167611 ) ) ( not ( = ?auto_167608 ?auto_167612 ) ) ( not ( = ?auto_167610 ?auto_167612 ) ) ( not ( = ?auto_167609 ?auto_167612 ) ) ( not ( = ?auto_167611 ?auto_167612 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167608 ?auto_167610 ?auto_167609 ?auto_167612 ?auto_167611 ?auto_167607 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167651 - OBJ
      ?auto_167652 - OBJ
      ?auto_167653 - OBJ
      ?auto_167654 - OBJ
      ?auto_167655 - OBJ
      ?auto_167650 - LOCATION
    )
    :vars
    (
      ?auto_167656 - LOCATION
      ?auto_167657 - CITY
      ?auto_167659 - LOCATION
      ?auto_167658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167656 ?auto_167657 ) ( IN-CITY ?auto_167650 ?auto_167657 ) ( not ( = ?auto_167650 ?auto_167656 ) ) ( OBJ-AT ?auto_167654 ?auto_167656 ) ( IN-CITY ?auto_167659 ?auto_167657 ) ( not ( = ?auto_167650 ?auto_167659 ) ) ( OBJ-AT ?auto_167655 ?auto_167659 ) ( OBJ-AT ?auto_167652 ?auto_167656 ) ( OBJ-AT ?auto_167653 ?auto_167659 ) ( OBJ-AT ?auto_167651 ?auto_167659 ) ( TRUCK-AT ?auto_167658 ?auto_167650 ) ( not ( = ?auto_167651 ?auto_167653 ) ) ( not ( = ?auto_167651 ?auto_167652 ) ) ( not ( = ?auto_167653 ?auto_167652 ) ) ( not ( = ?auto_167656 ?auto_167659 ) ) ( not ( = ?auto_167651 ?auto_167655 ) ) ( not ( = ?auto_167653 ?auto_167655 ) ) ( not ( = ?auto_167652 ?auto_167655 ) ) ( not ( = ?auto_167651 ?auto_167654 ) ) ( not ( = ?auto_167653 ?auto_167654 ) ) ( not ( = ?auto_167652 ?auto_167654 ) ) ( not ( = ?auto_167655 ?auto_167654 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167651 ?auto_167653 ?auto_167652 ?auto_167654 ?auto_167655 ?auto_167650 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167787 - OBJ
      ?auto_167788 - OBJ
      ?auto_167789 - OBJ
      ?auto_167790 - OBJ
      ?auto_167791 - OBJ
      ?auto_167786 - LOCATION
    )
    :vars
    (
      ?auto_167792 - LOCATION
      ?auto_167793 - CITY
      ?auto_167795 - LOCATION
      ?auto_167794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167792 ?auto_167793 ) ( IN-CITY ?auto_167786 ?auto_167793 ) ( not ( = ?auto_167786 ?auto_167792 ) ) ( OBJ-AT ?auto_167791 ?auto_167792 ) ( IN-CITY ?auto_167795 ?auto_167793 ) ( not ( = ?auto_167786 ?auto_167795 ) ) ( OBJ-AT ?auto_167789 ?auto_167795 ) ( OBJ-AT ?auto_167788 ?auto_167792 ) ( OBJ-AT ?auto_167790 ?auto_167795 ) ( OBJ-AT ?auto_167787 ?auto_167795 ) ( TRUCK-AT ?auto_167794 ?auto_167786 ) ( not ( = ?auto_167787 ?auto_167790 ) ) ( not ( = ?auto_167787 ?auto_167788 ) ) ( not ( = ?auto_167790 ?auto_167788 ) ) ( not ( = ?auto_167792 ?auto_167795 ) ) ( not ( = ?auto_167787 ?auto_167789 ) ) ( not ( = ?auto_167790 ?auto_167789 ) ) ( not ( = ?auto_167788 ?auto_167789 ) ) ( not ( = ?auto_167787 ?auto_167791 ) ) ( not ( = ?auto_167790 ?auto_167791 ) ) ( not ( = ?auto_167788 ?auto_167791 ) ) ( not ( = ?auto_167789 ?auto_167791 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167787 ?auto_167790 ?auto_167788 ?auto_167791 ?auto_167789 ?auto_167786 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167830 - OBJ
      ?auto_167831 - OBJ
      ?auto_167832 - OBJ
      ?auto_167833 - OBJ
      ?auto_167834 - OBJ
      ?auto_167829 - LOCATION
    )
    :vars
    (
      ?auto_167835 - LOCATION
      ?auto_167836 - CITY
      ?auto_167838 - LOCATION
      ?auto_167837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167835 ?auto_167836 ) ( IN-CITY ?auto_167829 ?auto_167836 ) ( not ( = ?auto_167829 ?auto_167835 ) ) ( OBJ-AT ?auto_167833 ?auto_167835 ) ( IN-CITY ?auto_167838 ?auto_167836 ) ( not ( = ?auto_167829 ?auto_167838 ) ) ( OBJ-AT ?auto_167832 ?auto_167838 ) ( OBJ-AT ?auto_167831 ?auto_167835 ) ( OBJ-AT ?auto_167834 ?auto_167838 ) ( OBJ-AT ?auto_167830 ?auto_167838 ) ( TRUCK-AT ?auto_167837 ?auto_167829 ) ( not ( = ?auto_167830 ?auto_167834 ) ) ( not ( = ?auto_167830 ?auto_167831 ) ) ( not ( = ?auto_167834 ?auto_167831 ) ) ( not ( = ?auto_167835 ?auto_167838 ) ) ( not ( = ?auto_167830 ?auto_167832 ) ) ( not ( = ?auto_167834 ?auto_167832 ) ) ( not ( = ?auto_167831 ?auto_167832 ) ) ( not ( = ?auto_167830 ?auto_167833 ) ) ( not ( = ?auto_167834 ?auto_167833 ) ) ( not ( = ?auto_167831 ?auto_167833 ) ) ( not ( = ?auto_167832 ?auto_167833 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167830 ?auto_167834 ?auto_167831 ?auto_167833 ?auto_167832 ?auto_167829 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167964 - OBJ
      ?auto_167965 - OBJ
      ?auto_167966 - OBJ
      ?auto_167967 - OBJ
      ?auto_167968 - OBJ
      ?auto_167963 - LOCATION
    )
    :vars
    (
      ?auto_167969 - LOCATION
      ?auto_167970 - CITY
      ?auto_167972 - LOCATION
      ?auto_167971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167969 ?auto_167970 ) ( IN-CITY ?auto_167963 ?auto_167970 ) ( not ( = ?auto_167963 ?auto_167969 ) ) ( OBJ-AT ?auto_167966 ?auto_167969 ) ( IN-CITY ?auto_167972 ?auto_167970 ) ( not ( = ?auto_167963 ?auto_167972 ) ) ( OBJ-AT ?auto_167968 ?auto_167972 ) ( OBJ-AT ?auto_167965 ?auto_167969 ) ( OBJ-AT ?auto_167967 ?auto_167972 ) ( OBJ-AT ?auto_167964 ?auto_167972 ) ( TRUCK-AT ?auto_167971 ?auto_167963 ) ( not ( = ?auto_167964 ?auto_167967 ) ) ( not ( = ?auto_167964 ?auto_167965 ) ) ( not ( = ?auto_167967 ?auto_167965 ) ) ( not ( = ?auto_167969 ?auto_167972 ) ) ( not ( = ?auto_167964 ?auto_167968 ) ) ( not ( = ?auto_167967 ?auto_167968 ) ) ( not ( = ?auto_167965 ?auto_167968 ) ) ( not ( = ?auto_167964 ?auto_167966 ) ) ( not ( = ?auto_167967 ?auto_167966 ) ) ( not ( = ?auto_167965 ?auto_167966 ) ) ( not ( = ?auto_167968 ?auto_167966 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167964 ?auto_167967 ?auto_167965 ?auto_167966 ?auto_167968 ?auto_167963 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168054 - OBJ
      ?auto_168055 - OBJ
      ?auto_168056 - OBJ
      ?auto_168057 - OBJ
      ?auto_168058 - OBJ
      ?auto_168053 - LOCATION
    )
    :vars
    (
      ?auto_168059 - LOCATION
      ?auto_168060 - CITY
      ?auto_168062 - LOCATION
      ?auto_168061 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168059 ?auto_168060 ) ( IN-CITY ?auto_168053 ?auto_168060 ) ( not ( = ?auto_168053 ?auto_168059 ) ) ( OBJ-AT ?auto_168056 ?auto_168059 ) ( IN-CITY ?auto_168062 ?auto_168060 ) ( not ( = ?auto_168053 ?auto_168062 ) ) ( OBJ-AT ?auto_168057 ?auto_168062 ) ( OBJ-AT ?auto_168055 ?auto_168059 ) ( OBJ-AT ?auto_168058 ?auto_168062 ) ( OBJ-AT ?auto_168054 ?auto_168062 ) ( TRUCK-AT ?auto_168061 ?auto_168053 ) ( not ( = ?auto_168054 ?auto_168058 ) ) ( not ( = ?auto_168054 ?auto_168055 ) ) ( not ( = ?auto_168058 ?auto_168055 ) ) ( not ( = ?auto_168059 ?auto_168062 ) ) ( not ( = ?auto_168054 ?auto_168057 ) ) ( not ( = ?auto_168058 ?auto_168057 ) ) ( not ( = ?auto_168055 ?auto_168057 ) ) ( not ( = ?auto_168054 ?auto_168056 ) ) ( not ( = ?auto_168058 ?auto_168056 ) ) ( not ( = ?auto_168055 ?auto_168056 ) ) ( not ( = ?auto_168057 ?auto_168056 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168054 ?auto_168058 ?auto_168055 ?auto_168056 ?auto_168057 ?auto_168053 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168281 - OBJ
      ?auto_168282 - OBJ
      ?auto_168283 - OBJ
      ?auto_168284 - OBJ
      ?auto_168285 - OBJ
      ?auto_168280 - LOCATION
    )
    :vars
    (
      ?auto_168286 - LOCATION
      ?auto_168287 - CITY
      ?auto_168289 - LOCATION
      ?auto_168288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168286 ?auto_168287 ) ( IN-CITY ?auto_168280 ?auto_168287 ) ( not ( = ?auto_168280 ?auto_168286 ) ) ( OBJ-AT ?auto_168285 ?auto_168286 ) ( IN-CITY ?auto_168289 ?auto_168287 ) ( not ( = ?auto_168280 ?auto_168289 ) ) ( OBJ-AT ?auto_168282 ?auto_168289 ) ( OBJ-AT ?auto_168284 ?auto_168286 ) ( OBJ-AT ?auto_168283 ?auto_168289 ) ( OBJ-AT ?auto_168281 ?auto_168289 ) ( TRUCK-AT ?auto_168288 ?auto_168280 ) ( not ( = ?auto_168281 ?auto_168283 ) ) ( not ( = ?auto_168281 ?auto_168284 ) ) ( not ( = ?auto_168283 ?auto_168284 ) ) ( not ( = ?auto_168286 ?auto_168289 ) ) ( not ( = ?auto_168281 ?auto_168282 ) ) ( not ( = ?auto_168283 ?auto_168282 ) ) ( not ( = ?auto_168284 ?auto_168282 ) ) ( not ( = ?auto_168281 ?auto_168285 ) ) ( not ( = ?auto_168283 ?auto_168285 ) ) ( not ( = ?auto_168284 ?auto_168285 ) ) ( not ( = ?auto_168282 ?auto_168285 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168281 ?auto_168283 ?auto_168284 ?auto_168285 ?auto_168282 ?auto_168280 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168324 - OBJ
      ?auto_168325 - OBJ
      ?auto_168326 - OBJ
      ?auto_168327 - OBJ
      ?auto_168328 - OBJ
      ?auto_168323 - LOCATION
    )
    :vars
    (
      ?auto_168329 - LOCATION
      ?auto_168330 - CITY
      ?auto_168332 - LOCATION
      ?auto_168331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168329 ?auto_168330 ) ( IN-CITY ?auto_168323 ?auto_168330 ) ( not ( = ?auto_168323 ?auto_168329 ) ) ( OBJ-AT ?auto_168327 ?auto_168329 ) ( IN-CITY ?auto_168332 ?auto_168330 ) ( not ( = ?auto_168323 ?auto_168332 ) ) ( OBJ-AT ?auto_168325 ?auto_168332 ) ( OBJ-AT ?auto_168328 ?auto_168329 ) ( OBJ-AT ?auto_168326 ?auto_168332 ) ( OBJ-AT ?auto_168324 ?auto_168332 ) ( TRUCK-AT ?auto_168331 ?auto_168323 ) ( not ( = ?auto_168324 ?auto_168326 ) ) ( not ( = ?auto_168324 ?auto_168328 ) ) ( not ( = ?auto_168326 ?auto_168328 ) ) ( not ( = ?auto_168329 ?auto_168332 ) ) ( not ( = ?auto_168324 ?auto_168325 ) ) ( not ( = ?auto_168326 ?auto_168325 ) ) ( not ( = ?auto_168328 ?auto_168325 ) ) ( not ( = ?auto_168324 ?auto_168327 ) ) ( not ( = ?auto_168326 ?auto_168327 ) ) ( not ( = ?auto_168328 ?auto_168327 ) ) ( not ( = ?auto_168325 ?auto_168327 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168324 ?auto_168326 ?auto_168328 ?auto_168327 ?auto_168325 ?auto_168323 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168367 - OBJ
      ?auto_168368 - OBJ
      ?auto_168369 - OBJ
      ?auto_168370 - OBJ
      ?auto_168371 - OBJ
      ?auto_168366 - LOCATION
    )
    :vars
    (
      ?auto_168372 - LOCATION
      ?auto_168373 - CITY
      ?auto_168375 - LOCATION
      ?auto_168374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168372 ?auto_168373 ) ( IN-CITY ?auto_168366 ?auto_168373 ) ( not ( = ?auto_168366 ?auto_168372 ) ) ( OBJ-AT ?auto_168371 ?auto_168372 ) ( IN-CITY ?auto_168375 ?auto_168373 ) ( not ( = ?auto_168366 ?auto_168375 ) ) ( OBJ-AT ?auto_168368 ?auto_168375 ) ( OBJ-AT ?auto_168369 ?auto_168372 ) ( OBJ-AT ?auto_168370 ?auto_168375 ) ( OBJ-AT ?auto_168367 ?auto_168375 ) ( TRUCK-AT ?auto_168374 ?auto_168366 ) ( not ( = ?auto_168367 ?auto_168370 ) ) ( not ( = ?auto_168367 ?auto_168369 ) ) ( not ( = ?auto_168370 ?auto_168369 ) ) ( not ( = ?auto_168372 ?auto_168375 ) ) ( not ( = ?auto_168367 ?auto_168368 ) ) ( not ( = ?auto_168370 ?auto_168368 ) ) ( not ( = ?auto_168369 ?auto_168368 ) ) ( not ( = ?auto_168367 ?auto_168371 ) ) ( not ( = ?auto_168370 ?auto_168371 ) ) ( not ( = ?auto_168369 ?auto_168371 ) ) ( not ( = ?auto_168368 ?auto_168371 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168367 ?auto_168370 ?auto_168369 ?auto_168371 ?auto_168368 ?auto_168366 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168410 - OBJ
      ?auto_168411 - OBJ
      ?auto_168412 - OBJ
      ?auto_168413 - OBJ
      ?auto_168414 - OBJ
      ?auto_168409 - LOCATION
    )
    :vars
    (
      ?auto_168415 - LOCATION
      ?auto_168416 - CITY
      ?auto_168418 - LOCATION
      ?auto_168417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168415 ?auto_168416 ) ( IN-CITY ?auto_168409 ?auto_168416 ) ( not ( = ?auto_168409 ?auto_168415 ) ) ( OBJ-AT ?auto_168413 ?auto_168415 ) ( IN-CITY ?auto_168418 ?auto_168416 ) ( not ( = ?auto_168409 ?auto_168418 ) ) ( OBJ-AT ?auto_168411 ?auto_168418 ) ( OBJ-AT ?auto_168412 ?auto_168415 ) ( OBJ-AT ?auto_168414 ?auto_168418 ) ( OBJ-AT ?auto_168410 ?auto_168418 ) ( TRUCK-AT ?auto_168417 ?auto_168409 ) ( not ( = ?auto_168410 ?auto_168414 ) ) ( not ( = ?auto_168410 ?auto_168412 ) ) ( not ( = ?auto_168414 ?auto_168412 ) ) ( not ( = ?auto_168415 ?auto_168418 ) ) ( not ( = ?auto_168410 ?auto_168411 ) ) ( not ( = ?auto_168414 ?auto_168411 ) ) ( not ( = ?auto_168412 ?auto_168411 ) ) ( not ( = ?auto_168410 ?auto_168413 ) ) ( not ( = ?auto_168414 ?auto_168413 ) ) ( not ( = ?auto_168412 ?auto_168413 ) ) ( not ( = ?auto_168411 ?auto_168413 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168410 ?auto_168414 ?auto_168412 ?auto_168413 ?auto_168411 ?auto_168409 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168637 - OBJ
      ?auto_168638 - OBJ
      ?auto_168639 - OBJ
      ?auto_168640 - OBJ
      ?auto_168641 - OBJ
      ?auto_168636 - LOCATION
    )
    :vars
    (
      ?auto_168642 - LOCATION
      ?auto_168643 - CITY
      ?auto_168645 - LOCATION
      ?auto_168644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168642 ?auto_168643 ) ( IN-CITY ?auto_168636 ?auto_168643 ) ( not ( = ?auto_168636 ?auto_168642 ) ) ( OBJ-AT ?auto_168639 ?auto_168642 ) ( IN-CITY ?auto_168645 ?auto_168643 ) ( not ( = ?auto_168636 ?auto_168645 ) ) ( OBJ-AT ?auto_168638 ?auto_168645 ) ( OBJ-AT ?auto_168641 ?auto_168642 ) ( OBJ-AT ?auto_168640 ?auto_168645 ) ( OBJ-AT ?auto_168637 ?auto_168645 ) ( TRUCK-AT ?auto_168644 ?auto_168636 ) ( not ( = ?auto_168637 ?auto_168640 ) ) ( not ( = ?auto_168637 ?auto_168641 ) ) ( not ( = ?auto_168640 ?auto_168641 ) ) ( not ( = ?auto_168642 ?auto_168645 ) ) ( not ( = ?auto_168637 ?auto_168638 ) ) ( not ( = ?auto_168640 ?auto_168638 ) ) ( not ( = ?auto_168641 ?auto_168638 ) ) ( not ( = ?auto_168637 ?auto_168639 ) ) ( not ( = ?auto_168640 ?auto_168639 ) ) ( not ( = ?auto_168641 ?auto_168639 ) ) ( not ( = ?auto_168638 ?auto_168639 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168637 ?auto_168640 ?auto_168641 ?auto_168639 ?auto_168638 ?auto_168636 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168680 - OBJ
      ?auto_168681 - OBJ
      ?auto_168682 - OBJ
      ?auto_168683 - OBJ
      ?auto_168684 - OBJ
      ?auto_168679 - LOCATION
    )
    :vars
    (
      ?auto_168685 - LOCATION
      ?auto_168686 - CITY
      ?auto_168688 - LOCATION
      ?auto_168687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168685 ?auto_168686 ) ( IN-CITY ?auto_168679 ?auto_168686 ) ( not ( = ?auto_168679 ?auto_168685 ) ) ( OBJ-AT ?auto_168682 ?auto_168685 ) ( IN-CITY ?auto_168688 ?auto_168686 ) ( not ( = ?auto_168679 ?auto_168688 ) ) ( OBJ-AT ?auto_168681 ?auto_168688 ) ( OBJ-AT ?auto_168683 ?auto_168685 ) ( OBJ-AT ?auto_168684 ?auto_168688 ) ( OBJ-AT ?auto_168680 ?auto_168688 ) ( TRUCK-AT ?auto_168687 ?auto_168679 ) ( not ( = ?auto_168680 ?auto_168684 ) ) ( not ( = ?auto_168680 ?auto_168683 ) ) ( not ( = ?auto_168684 ?auto_168683 ) ) ( not ( = ?auto_168685 ?auto_168688 ) ) ( not ( = ?auto_168680 ?auto_168681 ) ) ( not ( = ?auto_168684 ?auto_168681 ) ) ( not ( = ?auto_168683 ?auto_168681 ) ) ( not ( = ?auto_168680 ?auto_168682 ) ) ( not ( = ?auto_168684 ?auto_168682 ) ) ( not ( = ?auto_168683 ?auto_168682 ) ) ( not ( = ?auto_168681 ?auto_168682 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168680 ?auto_168684 ?auto_168683 ?auto_168682 ?auto_168681 ?auto_168679 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169286 - OBJ
      ?auto_169287 - OBJ
      ?auto_169288 - OBJ
      ?auto_169289 - OBJ
      ?auto_169290 - OBJ
      ?auto_169285 - LOCATION
    )
    :vars
    (
      ?auto_169291 - LOCATION
      ?auto_169292 - CITY
      ?auto_169294 - LOCATION
      ?auto_169293 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169291 ?auto_169292 ) ( IN-CITY ?auto_169285 ?auto_169292 ) ( not ( = ?auto_169285 ?auto_169291 ) ) ( OBJ-AT ?auto_169287 ?auto_169291 ) ( IN-CITY ?auto_169294 ?auto_169292 ) ( not ( = ?auto_169285 ?auto_169294 ) ) ( OBJ-AT ?auto_169290 ?auto_169294 ) ( OBJ-AT ?auto_169289 ?auto_169291 ) ( OBJ-AT ?auto_169288 ?auto_169294 ) ( OBJ-AT ?auto_169286 ?auto_169294 ) ( TRUCK-AT ?auto_169293 ?auto_169285 ) ( not ( = ?auto_169286 ?auto_169288 ) ) ( not ( = ?auto_169286 ?auto_169289 ) ) ( not ( = ?auto_169288 ?auto_169289 ) ) ( not ( = ?auto_169291 ?auto_169294 ) ) ( not ( = ?auto_169286 ?auto_169290 ) ) ( not ( = ?auto_169288 ?auto_169290 ) ) ( not ( = ?auto_169289 ?auto_169290 ) ) ( not ( = ?auto_169286 ?auto_169287 ) ) ( not ( = ?auto_169288 ?auto_169287 ) ) ( not ( = ?auto_169289 ?auto_169287 ) ) ( not ( = ?auto_169290 ?auto_169287 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169286 ?auto_169288 ?auto_169289 ?auto_169287 ?auto_169290 ?auto_169285 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169329 - OBJ
      ?auto_169330 - OBJ
      ?auto_169331 - OBJ
      ?auto_169332 - OBJ
      ?auto_169333 - OBJ
      ?auto_169328 - LOCATION
    )
    :vars
    (
      ?auto_169334 - LOCATION
      ?auto_169335 - CITY
      ?auto_169337 - LOCATION
      ?auto_169336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169334 ?auto_169335 ) ( IN-CITY ?auto_169328 ?auto_169335 ) ( not ( = ?auto_169328 ?auto_169334 ) ) ( OBJ-AT ?auto_169330 ?auto_169334 ) ( IN-CITY ?auto_169337 ?auto_169335 ) ( not ( = ?auto_169328 ?auto_169337 ) ) ( OBJ-AT ?auto_169332 ?auto_169337 ) ( OBJ-AT ?auto_169333 ?auto_169334 ) ( OBJ-AT ?auto_169331 ?auto_169337 ) ( OBJ-AT ?auto_169329 ?auto_169337 ) ( TRUCK-AT ?auto_169336 ?auto_169328 ) ( not ( = ?auto_169329 ?auto_169331 ) ) ( not ( = ?auto_169329 ?auto_169333 ) ) ( not ( = ?auto_169331 ?auto_169333 ) ) ( not ( = ?auto_169334 ?auto_169337 ) ) ( not ( = ?auto_169329 ?auto_169332 ) ) ( not ( = ?auto_169331 ?auto_169332 ) ) ( not ( = ?auto_169333 ?auto_169332 ) ) ( not ( = ?auto_169329 ?auto_169330 ) ) ( not ( = ?auto_169331 ?auto_169330 ) ) ( not ( = ?auto_169333 ?auto_169330 ) ) ( not ( = ?auto_169332 ?auto_169330 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169329 ?auto_169331 ?auto_169333 ?auto_169330 ?auto_169332 ?auto_169328 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169510 - OBJ
      ?auto_169511 - OBJ
      ?auto_169512 - OBJ
      ?auto_169513 - OBJ
      ?auto_169514 - OBJ
      ?auto_169509 - LOCATION
    )
    :vars
    (
      ?auto_169515 - LOCATION
      ?auto_169516 - CITY
      ?auto_169518 - LOCATION
      ?auto_169517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169515 ?auto_169516 ) ( IN-CITY ?auto_169509 ?auto_169516 ) ( not ( = ?auto_169509 ?auto_169515 ) ) ( OBJ-AT ?auto_169511 ?auto_169515 ) ( IN-CITY ?auto_169518 ?auto_169516 ) ( not ( = ?auto_169509 ?auto_169518 ) ) ( OBJ-AT ?auto_169514 ?auto_169518 ) ( OBJ-AT ?auto_169512 ?auto_169515 ) ( OBJ-AT ?auto_169513 ?auto_169518 ) ( OBJ-AT ?auto_169510 ?auto_169518 ) ( TRUCK-AT ?auto_169517 ?auto_169509 ) ( not ( = ?auto_169510 ?auto_169513 ) ) ( not ( = ?auto_169510 ?auto_169512 ) ) ( not ( = ?auto_169513 ?auto_169512 ) ) ( not ( = ?auto_169515 ?auto_169518 ) ) ( not ( = ?auto_169510 ?auto_169514 ) ) ( not ( = ?auto_169513 ?auto_169514 ) ) ( not ( = ?auto_169512 ?auto_169514 ) ) ( not ( = ?auto_169510 ?auto_169511 ) ) ( not ( = ?auto_169513 ?auto_169511 ) ) ( not ( = ?auto_169512 ?auto_169511 ) ) ( not ( = ?auto_169514 ?auto_169511 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169510 ?auto_169513 ?auto_169512 ?auto_169511 ?auto_169514 ?auto_169509 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169600 - OBJ
      ?auto_169601 - OBJ
      ?auto_169602 - OBJ
      ?auto_169603 - OBJ
      ?auto_169604 - OBJ
      ?auto_169599 - LOCATION
    )
    :vars
    (
      ?auto_169605 - LOCATION
      ?auto_169606 - CITY
      ?auto_169608 - LOCATION
      ?auto_169607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169605 ?auto_169606 ) ( IN-CITY ?auto_169599 ?auto_169606 ) ( not ( = ?auto_169599 ?auto_169605 ) ) ( OBJ-AT ?auto_169601 ?auto_169605 ) ( IN-CITY ?auto_169608 ?auto_169606 ) ( not ( = ?auto_169599 ?auto_169608 ) ) ( OBJ-AT ?auto_169603 ?auto_169608 ) ( OBJ-AT ?auto_169602 ?auto_169605 ) ( OBJ-AT ?auto_169604 ?auto_169608 ) ( OBJ-AT ?auto_169600 ?auto_169608 ) ( TRUCK-AT ?auto_169607 ?auto_169599 ) ( not ( = ?auto_169600 ?auto_169604 ) ) ( not ( = ?auto_169600 ?auto_169602 ) ) ( not ( = ?auto_169604 ?auto_169602 ) ) ( not ( = ?auto_169605 ?auto_169608 ) ) ( not ( = ?auto_169600 ?auto_169603 ) ) ( not ( = ?auto_169604 ?auto_169603 ) ) ( not ( = ?auto_169602 ?auto_169603 ) ) ( not ( = ?auto_169600 ?auto_169601 ) ) ( not ( = ?auto_169604 ?auto_169601 ) ) ( not ( = ?auto_169602 ?auto_169601 ) ) ( not ( = ?auto_169603 ?auto_169601 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169600 ?auto_169604 ?auto_169602 ?auto_169601 ?auto_169603 ?auto_169599 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169781 - OBJ
      ?auto_169782 - OBJ
      ?auto_169783 - OBJ
      ?auto_169784 - OBJ
      ?auto_169785 - OBJ
      ?auto_169780 - LOCATION
    )
    :vars
    (
      ?auto_169786 - LOCATION
      ?auto_169787 - CITY
      ?auto_169789 - LOCATION
      ?auto_169788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169786 ?auto_169787 ) ( IN-CITY ?auto_169780 ?auto_169787 ) ( not ( = ?auto_169780 ?auto_169786 ) ) ( OBJ-AT ?auto_169782 ?auto_169786 ) ( IN-CITY ?auto_169789 ?auto_169787 ) ( not ( = ?auto_169780 ?auto_169789 ) ) ( OBJ-AT ?auto_169783 ?auto_169789 ) ( OBJ-AT ?auto_169785 ?auto_169786 ) ( OBJ-AT ?auto_169784 ?auto_169789 ) ( OBJ-AT ?auto_169781 ?auto_169789 ) ( TRUCK-AT ?auto_169788 ?auto_169780 ) ( not ( = ?auto_169781 ?auto_169784 ) ) ( not ( = ?auto_169781 ?auto_169785 ) ) ( not ( = ?auto_169784 ?auto_169785 ) ) ( not ( = ?auto_169786 ?auto_169789 ) ) ( not ( = ?auto_169781 ?auto_169783 ) ) ( not ( = ?auto_169784 ?auto_169783 ) ) ( not ( = ?auto_169785 ?auto_169783 ) ) ( not ( = ?auto_169781 ?auto_169782 ) ) ( not ( = ?auto_169784 ?auto_169782 ) ) ( not ( = ?auto_169785 ?auto_169782 ) ) ( not ( = ?auto_169783 ?auto_169782 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169781 ?auto_169784 ?auto_169785 ?auto_169782 ?auto_169783 ?auto_169780 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169824 - OBJ
      ?auto_169825 - OBJ
      ?auto_169826 - OBJ
      ?auto_169827 - OBJ
      ?auto_169828 - OBJ
      ?auto_169823 - LOCATION
    )
    :vars
    (
      ?auto_169829 - LOCATION
      ?auto_169830 - CITY
      ?auto_169832 - LOCATION
      ?auto_169831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169829 ?auto_169830 ) ( IN-CITY ?auto_169823 ?auto_169830 ) ( not ( = ?auto_169823 ?auto_169829 ) ) ( OBJ-AT ?auto_169825 ?auto_169829 ) ( IN-CITY ?auto_169832 ?auto_169830 ) ( not ( = ?auto_169823 ?auto_169832 ) ) ( OBJ-AT ?auto_169826 ?auto_169832 ) ( OBJ-AT ?auto_169827 ?auto_169829 ) ( OBJ-AT ?auto_169828 ?auto_169832 ) ( OBJ-AT ?auto_169824 ?auto_169832 ) ( TRUCK-AT ?auto_169831 ?auto_169823 ) ( not ( = ?auto_169824 ?auto_169828 ) ) ( not ( = ?auto_169824 ?auto_169827 ) ) ( not ( = ?auto_169828 ?auto_169827 ) ) ( not ( = ?auto_169829 ?auto_169832 ) ) ( not ( = ?auto_169824 ?auto_169826 ) ) ( not ( = ?auto_169828 ?auto_169826 ) ) ( not ( = ?auto_169827 ?auto_169826 ) ) ( not ( = ?auto_169824 ?auto_169825 ) ) ( not ( = ?auto_169828 ?auto_169825 ) ) ( not ( = ?auto_169827 ?auto_169825 ) ) ( not ( = ?auto_169826 ?auto_169825 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169824 ?auto_169828 ?auto_169827 ?auto_169825 ?auto_169826 ?auto_169823 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170522 - OBJ
      ?auto_170523 - OBJ
      ?auto_170524 - OBJ
      ?auto_170525 - OBJ
      ?auto_170526 - OBJ
      ?auto_170521 - LOCATION
    )
    :vars
    (
      ?auto_170527 - LOCATION
      ?auto_170528 - CITY
      ?auto_170530 - LOCATION
      ?auto_170529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170527 ?auto_170528 ) ( IN-CITY ?auto_170521 ?auto_170528 ) ( not ( = ?auto_170521 ?auto_170527 ) ) ( OBJ-AT ?auto_170526 ?auto_170527 ) ( IN-CITY ?auto_170530 ?auto_170528 ) ( not ( = ?auto_170521 ?auto_170530 ) ) ( OBJ-AT ?auto_170525 ?auto_170530 ) ( OBJ-AT ?auto_170524 ?auto_170527 ) ( OBJ-AT ?auto_170522 ?auto_170530 ) ( OBJ-AT ?auto_170523 ?auto_170530 ) ( TRUCK-AT ?auto_170529 ?auto_170521 ) ( not ( = ?auto_170523 ?auto_170522 ) ) ( not ( = ?auto_170523 ?auto_170524 ) ) ( not ( = ?auto_170522 ?auto_170524 ) ) ( not ( = ?auto_170527 ?auto_170530 ) ) ( not ( = ?auto_170523 ?auto_170525 ) ) ( not ( = ?auto_170522 ?auto_170525 ) ) ( not ( = ?auto_170524 ?auto_170525 ) ) ( not ( = ?auto_170523 ?auto_170526 ) ) ( not ( = ?auto_170522 ?auto_170526 ) ) ( not ( = ?auto_170524 ?auto_170526 ) ) ( not ( = ?auto_170525 ?auto_170526 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170523 ?auto_170522 ?auto_170524 ?auto_170526 ?auto_170525 ?auto_170521 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170565 - OBJ
      ?auto_170566 - OBJ
      ?auto_170567 - OBJ
      ?auto_170568 - OBJ
      ?auto_170569 - OBJ
      ?auto_170564 - LOCATION
    )
    :vars
    (
      ?auto_170570 - LOCATION
      ?auto_170571 - CITY
      ?auto_170573 - LOCATION
      ?auto_170572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170570 ?auto_170571 ) ( IN-CITY ?auto_170564 ?auto_170571 ) ( not ( = ?auto_170564 ?auto_170570 ) ) ( OBJ-AT ?auto_170568 ?auto_170570 ) ( IN-CITY ?auto_170573 ?auto_170571 ) ( not ( = ?auto_170564 ?auto_170573 ) ) ( OBJ-AT ?auto_170569 ?auto_170573 ) ( OBJ-AT ?auto_170567 ?auto_170570 ) ( OBJ-AT ?auto_170565 ?auto_170573 ) ( OBJ-AT ?auto_170566 ?auto_170573 ) ( TRUCK-AT ?auto_170572 ?auto_170564 ) ( not ( = ?auto_170566 ?auto_170565 ) ) ( not ( = ?auto_170566 ?auto_170567 ) ) ( not ( = ?auto_170565 ?auto_170567 ) ) ( not ( = ?auto_170570 ?auto_170573 ) ) ( not ( = ?auto_170566 ?auto_170569 ) ) ( not ( = ?auto_170565 ?auto_170569 ) ) ( not ( = ?auto_170567 ?auto_170569 ) ) ( not ( = ?auto_170566 ?auto_170568 ) ) ( not ( = ?auto_170565 ?auto_170568 ) ) ( not ( = ?auto_170567 ?auto_170568 ) ) ( not ( = ?auto_170569 ?auto_170568 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170566 ?auto_170565 ?auto_170567 ?auto_170568 ?auto_170569 ?auto_170564 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170608 - OBJ
      ?auto_170609 - OBJ
      ?auto_170610 - OBJ
      ?auto_170611 - OBJ
      ?auto_170612 - OBJ
      ?auto_170607 - LOCATION
    )
    :vars
    (
      ?auto_170613 - LOCATION
      ?auto_170614 - CITY
      ?auto_170616 - LOCATION
      ?auto_170615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170613 ?auto_170614 ) ( IN-CITY ?auto_170607 ?auto_170614 ) ( not ( = ?auto_170607 ?auto_170613 ) ) ( OBJ-AT ?auto_170612 ?auto_170613 ) ( IN-CITY ?auto_170616 ?auto_170614 ) ( not ( = ?auto_170607 ?auto_170616 ) ) ( OBJ-AT ?auto_170610 ?auto_170616 ) ( OBJ-AT ?auto_170611 ?auto_170613 ) ( OBJ-AT ?auto_170608 ?auto_170616 ) ( OBJ-AT ?auto_170609 ?auto_170616 ) ( TRUCK-AT ?auto_170615 ?auto_170607 ) ( not ( = ?auto_170609 ?auto_170608 ) ) ( not ( = ?auto_170609 ?auto_170611 ) ) ( not ( = ?auto_170608 ?auto_170611 ) ) ( not ( = ?auto_170613 ?auto_170616 ) ) ( not ( = ?auto_170609 ?auto_170610 ) ) ( not ( = ?auto_170608 ?auto_170610 ) ) ( not ( = ?auto_170611 ?auto_170610 ) ) ( not ( = ?auto_170609 ?auto_170612 ) ) ( not ( = ?auto_170608 ?auto_170612 ) ) ( not ( = ?auto_170611 ?auto_170612 ) ) ( not ( = ?auto_170610 ?auto_170612 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170609 ?auto_170608 ?auto_170611 ?auto_170612 ?auto_170610 ?auto_170607 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170651 - OBJ
      ?auto_170652 - OBJ
      ?auto_170653 - OBJ
      ?auto_170654 - OBJ
      ?auto_170655 - OBJ
      ?auto_170650 - LOCATION
    )
    :vars
    (
      ?auto_170656 - LOCATION
      ?auto_170657 - CITY
      ?auto_170659 - LOCATION
      ?auto_170658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170656 ?auto_170657 ) ( IN-CITY ?auto_170650 ?auto_170657 ) ( not ( = ?auto_170650 ?auto_170656 ) ) ( OBJ-AT ?auto_170654 ?auto_170656 ) ( IN-CITY ?auto_170659 ?auto_170657 ) ( not ( = ?auto_170650 ?auto_170659 ) ) ( OBJ-AT ?auto_170653 ?auto_170659 ) ( OBJ-AT ?auto_170655 ?auto_170656 ) ( OBJ-AT ?auto_170651 ?auto_170659 ) ( OBJ-AT ?auto_170652 ?auto_170659 ) ( TRUCK-AT ?auto_170658 ?auto_170650 ) ( not ( = ?auto_170652 ?auto_170651 ) ) ( not ( = ?auto_170652 ?auto_170655 ) ) ( not ( = ?auto_170651 ?auto_170655 ) ) ( not ( = ?auto_170656 ?auto_170659 ) ) ( not ( = ?auto_170652 ?auto_170653 ) ) ( not ( = ?auto_170651 ?auto_170653 ) ) ( not ( = ?auto_170655 ?auto_170653 ) ) ( not ( = ?auto_170652 ?auto_170654 ) ) ( not ( = ?auto_170651 ?auto_170654 ) ) ( not ( = ?auto_170655 ?auto_170654 ) ) ( not ( = ?auto_170653 ?auto_170654 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170652 ?auto_170651 ?auto_170655 ?auto_170654 ?auto_170653 ?auto_170650 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170832 - OBJ
      ?auto_170833 - OBJ
      ?auto_170834 - OBJ
      ?auto_170835 - OBJ
      ?auto_170836 - OBJ
      ?auto_170831 - LOCATION
    )
    :vars
    (
      ?auto_170837 - LOCATION
      ?auto_170838 - CITY
      ?auto_170840 - LOCATION
      ?auto_170839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170837 ?auto_170838 ) ( IN-CITY ?auto_170831 ?auto_170838 ) ( not ( = ?auto_170831 ?auto_170837 ) ) ( OBJ-AT ?auto_170834 ?auto_170837 ) ( IN-CITY ?auto_170840 ?auto_170838 ) ( not ( = ?auto_170831 ?auto_170840 ) ) ( OBJ-AT ?auto_170836 ?auto_170840 ) ( OBJ-AT ?auto_170835 ?auto_170837 ) ( OBJ-AT ?auto_170832 ?auto_170840 ) ( OBJ-AT ?auto_170833 ?auto_170840 ) ( TRUCK-AT ?auto_170839 ?auto_170831 ) ( not ( = ?auto_170833 ?auto_170832 ) ) ( not ( = ?auto_170833 ?auto_170835 ) ) ( not ( = ?auto_170832 ?auto_170835 ) ) ( not ( = ?auto_170837 ?auto_170840 ) ) ( not ( = ?auto_170833 ?auto_170836 ) ) ( not ( = ?auto_170832 ?auto_170836 ) ) ( not ( = ?auto_170835 ?auto_170836 ) ) ( not ( = ?auto_170833 ?auto_170834 ) ) ( not ( = ?auto_170832 ?auto_170834 ) ) ( not ( = ?auto_170835 ?auto_170834 ) ) ( not ( = ?auto_170836 ?auto_170834 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170833 ?auto_170832 ?auto_170835 ?auto_170834 ?auto_170836 ?auto_170831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170875 - OBJ
      ?auto_170876 - OBJ
      ?auto_170877 - OBJ
      ?auto_170878 - OBJ
      ?auto_170879 - OBJ
      ?auto_170874 - LOCATION
    )
    :vars
    (
      ?auto_170880 - LOCATION
      ?auto_170881 - CITY
      ?auto_170883 - LOCATION
      ?auto_170882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170880 ?auto_170881 ) ( IN-CITY ?auto_170874 ?auto_170881 ) ( not ( = ?auto_170874 ?auto_170880 ) ) ( OBJ-AT ?auto_170877 ?auto_170880 ) ( IN-CITY ?auto_170883 ?auto_170881 ) ( not ( = ?auto_170874 ?auto_170883 ) ) ( OBJ-AT ?auto_170878 ?auto_170883 ) ( OBJ-AT ?auto_170879 ?auto_170880 ) ( OBJ-AT ?auto_170875 ?auto_170883 ) ( OBJ-AT ?auto_170876 ?auto_170883 ) ( TRUCK-AT ?auto_170882 ?auto_170874 ) ( not ( = ?auto_170876 ?auto_170875 ) ) ( not ( = ?auto_170876 ?auto_170879 ) ) ( not ( = ?auto_170875 ?auto_170879 ) ) ( not ( = ?auto_170880 ?auto_170883 ) ) ( not ( = ?auto_170876 ?auto_170878 ) ) ( not ( = ?auto_170875 ?auto_170878 ) ) ( not ( = ?auto_170879 ?auto_170878 ) ) ( not ( = ?auto_170876 ?auto_170877 ) ) ( not ( = ?auto_170875 ?auto_170877 ) ) ( not ( = ?auto_170879 ?auto_170877 ) ) ( not ( = ?auto_170878 ?auto_170877 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170876 ?auto_170875 ?auto_170879 ?auto_170877 ?auto_170878 ?auto_170874 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171719 - OBJ
      ?auto_171720 - OBJ
      ?auto_171721 - OBJ
      ?auto_171722 - OBJ
      ?auto_171723 - OBJ
      ?auto_171718 - LOCATION
    )
    :vars
    (
      ?auto_171724 - LOCATION
      ?auto_171725 - CITY
      ?auto_171727 - LOCATION
      ?auto_171726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171724 ?auto_171725 ) ( IN-CITY ?auto_171718 ?auto_171725 ) ( not ( = ?auto_171718 ?auto_171724 ) ) ( OBJ-AT ?auto_171723 ?auto_171724 ) ( IN-CITY ?auto_171727 ?auto_171725 ) ( not ( = ?auto_171718 ?auto_171727 ) ) ( OBJ-AT ?auto_171722 ?auto_171727 ) ( OBJ-AT ?auto_171720 ?auto_171724 ) ( OBJ-AT ?auto_171719 ?auto_171727 ) ( OBJ-AT ?auto_171721 ?auto_171727 ) ( TRUCK-AT ?auto_171726 ?auto_171718 ) ( not ( = ?auto_171721 ?auto_171719 ) ) ( not ( = ?auto_171721 ?auto_171720 ) ) ( not ( = ?auto_171719 ?auto_171720 ) ) ( not ( = ?auto_171724 ?auto_171727 ) ) ( not ( = ?auto_171721 ?auto_171722 ) ) ( not ( = ?auto_171719 ?auto_171722 ) ) ( not ( = ?auto_171720 ?auto_171722 ) ) ( not ( = ?auto_171721 ?auto_171723 ) ) ( not ( = ?auto_171719 ?auto_171723 ) ) ( not ( = ?auto_171720 ?auto_171723 ) ) ( not ( = ?auto_171722 ?auto_171723 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171721 ?auto_171719 ?auto_171720 ?auto_171723 ?auto_171722 ?auto_171718 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171762 - OBJ
      ?auto_171763 - OBJ
      ?auto_171764 - OBJ
      ?auto_171765 - OBJ
      ?auto_171766 - OBJ
      ?auto_171761 - LOCATION
    )
    :vars
    (
      ?auto_171767 - LOCATION
      ?auto_171768 - CITY
      ?auto_171770 - LOCATION
      ?auto_171769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171767 ?auto_171768 ) ( IN-CITY ?auto_171761 ?auto_171768 ) ( not ( = ?auto_171761 ?auto_171767 ) ) ( OBJ-AT ?auto_171765 ?auto_171767 ) ( IN-CITY ?auto_171770 ?auto_171768 ) ( not ( = ?auto_171761 ?auto_171770 ) ) ( OBJ-AT ?auto_171766 ?auto_171770 ) ( OBJ-AT ?auto_171763 ?auto_171767 ) ( OBJ-AT ?auto_171762 ?auto_171770 ) ( OBJ-AT ?auto_171764 ?auto_171770 ) ( TRUCK-AT ?auto_171769 ?auto_171761 ) ( not ( = ?auto_171764 ?auto_171762 ) ) ( not ( = ?auto_171764 ?auto_171763 ) ) ( not ( = ?auto_171762 ?auto_171763 ) ) ( not ( = ?auto_171767 ?auto_171770 ) ) ( not ( = ?auto_171764 ?auto_171766 ) ) ( not ( = ?auto_171762 ?auto_171766 ) ) ( not ( = ?auto_171763 ?auto_171766 ) ) ( not ( = ?auto_171764 ?auto_171765 ) ) ( not ( = ?auto_171762 ?auto_171765 ) ) ( not ( = ?auto_171763 ?auto_171765 ) ) ( not ( = ?auto_171766 ?auto_171765 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171764 ?auto_171762 ?auto_171763 ?auto_171765 ?auto_171766 ?auto_171761 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171991 - OBJ
      ?auto_171992 - OBJ
      ?auto_171993 - OBJ
      ?auto_171994 - OBJ
      ?auto_171995 - OBJ
      ?auto_171990 - LOCATION
    )
    :vars
    (
      ?auto_171996 - LOCATION
      ?auto_171997 - CITY
      ?auto_171999 - LOCATION
      ?auto_171998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171996 ?auto_171997 ) ( IN-CITY ?auto_171990 ?auto_171997 ) ( not ( = ?auto_171990 ?auto_171996 ) ) ( OBJ-AT ?auto_171995 ?auto_171996 ) ( IN-CITY ?auto_171999 ?auto_171997 ) ( not ( = ?auto_171990 ?auto_171999 ) ) ( OBJ-AT ?auto_171993 ?auto_171999 ) ( OBJ-AT ?auto_171992 ?auto_171996 ) ( OBJ-AT ?auto_171991 ?auto_171999 ) ( OBJ-AT ?auto_171994 ?auto_171999 ) ( TRUCK-AT ?auto_171998 ?auto_171990 ) ( not ( = ?auto_171994 ?auto_171991 ) ) ( not ( = ?auto_171994 ?auto_171992 ) ) ( not ( = ?auto_171991 ?auto_171992 ) ) ( not ( = ?auto_171996 ?auto_171999 ) ) ( not ( = ?auto_171994 ?auto_171993 ) ) ( not ( = ?auto_171991 ?auto_171993 ) ) ( not ( = ?auto_171992 ?auto_171993 ) ) ( not ( = ?auto_171994 ?auto_171995 ) ) ( not ( = ?auto_171991 ?auto_171995 ) ) ( not ( = ?auto_171992 ?auto_171995 ) ) ( not ( = ?auto_171993 ?auto_171995 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171994 ?auto_171991 ?auto_171992 ?auto_171995 ?auto_171993 ?auto_171990 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172034 - OBJ
      ?auto_172035 - OBJ
      ?auto_172036 - OBJ
      ?auto_172037 - OBJ
      ?auto_172038 - OBJ
      ?auto_172033 - LOCATION
    )
    :vars
    (
      ?auto_172039 - LOCATION
      ?auto_172040 - CITY
      ?auto_172042 - LOCATION
      ?auto_172041 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172039 ?auto_172040 ) ( IN-CITY ?auto_172033 ?auto_172040 ) ( not ( = ?auto_172033 ?auto_172039 ) ) ( OBJ-AT ?auto_172037 ?auto_172039 ) ( IN-CITY ?auto_172042 ?auto_172040 ) ( not ( = ?auto_172033 ?auto_172042 ) ) ( OBJ-AT ?auto_172036 ?auto_172042 ) ( OBJ-AT ?auto_172035 ?auto_172039 ) ( OBJ-AT ?auto_172034 ?auto_172042 ) ( OBJ-AT ?auto_172038 ?auto_172042 ) ( TRUCK-AT ?auto_172041 ?auto_172033 ) ( not ( = ?auto_172038 ?auto_172034 ) ) ( not ( = ?auto_172038 ?auto_172035 ) ) ( not ( = ?auto_172034 ?auto_172035 ) ) ( not ( = ?auto_172039 ?auto_172042 ) ) ( not ( = ?auto_172038 ?auto_172036 ) ) ( not ( = ?auto_172034 ?auto_172036 ) ) ( not ( = ?auto_172035 ?auto_172036 ) ) ( not ( = ?auto_172038 ?auto_172037 ) ) ( not ( = ?auto_172034 ?auto_172037 ) ) ( not ( = ?auto_172035 ?auto_172037 ) ) ( not ( = ?auto_172036 ?auto_172037 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172038 ?auto_172034 ?auto_172035 ?auto_172037 ?auto_172036 ?auto_172033 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172121 - OBJ
      ?auto_172122 - OBJ
      ?auto_172123 - OBJ
      ?auto_172124 - OBJ
      ?auto_172125 - OBJ
      ?auto_172120 - LOCATION
    )
    :vars
    (
      ?auto_172126 - LOCATION
      ?auto_172127 - CITY
      ?auto_172129 - LOCATION
      ?auto_172128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172126 ?auto_172127 ) ( IN-CITY ?auto_172120 ?auto_172127 ) ( not ( = ?auto_172120 ?auto_172126 ) ) ( OBJ-AT ?auto_172123 ?auto_172126 ) ( IN-CITY ?auto_172129 ?auto_172127 ) ( not ( = ?auto_172120 ?auto_172129 ) ) ( OBJ-AT ?auto_172125 ?auto_172129 ) ( OBJ-AT ?auto_172122 ?auto_172126 ) ( OBJ-AT ?auto_172121 ?auto_172129 ) ( OBJ-AT ?auto_172124 ?auto_172129 ) ( TRUCK-AT ?auto_172128 ?auto_172120 ) ( not ( = ?auto_172124 ?auto_172121 ) ) ( not ( = ?auto_172124 ?auto_172122 ) ) ( not ( = ?auto_172121 ?auto_172122 ) ) ( not ( = ?auto_172126 ?auto_172129 ) ) ( not ( = ?auto_172124 ?auto_172125 ) ) ( not ( = ?auto_172121 ?auto_172125 ) ) ( not ( = ?auto_172122 ?auto_172125 ) ) ( not ( = ?auto_172124 ?auto_172123 ) ) ( not ( = ?auto_172121 ?auto_172123 ) ) ( not ( = ?auto_172122 ?auto_172123 ) ) ( not ( = ?auto_172125 ?auto_172123 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172124 ?auto_172121 ?auto_172122 ?auto_172123 ?auto_172125 ?auto_172120 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172258 - OBJ
      ?auto_172259 - OBJ
      ?auto_172260 - OBJ
      ?auto_172261 - OBJ
      ?auto_172262 - OBJ
      ?auto_172257 - LOCATION
    )
    :vars
    (
      ?auto_172263 - LOCATION
      ?auto_172264 - CITY
      ?auto_172266 - LOCATION
      ?auto_172265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172263 ?auto_172264 ) ( IN-CITY ?auto_172257 ?auto_172264 ) ( not ( = ?auto_172257 ?auto_172263 ) ) ( OBJ-AT ?auto_172260 ?auto_172263 ) ( IN-CITY ?auto_172266 ?auto_172264 ) ( not ( = ?auto_172257 ?auto_172266 ) ) ( OBJ-AT ?auto_172261 ?auto_172266 ) ( OBJ-AT ?auto_172259 ?auto_172263 ) ( OBJ-AT ?auto_172258 ?auto_172266 ) ( OBJ-AT ?auto_172262 ?auto_172266 ) ( TRUCK-AT ?auto_172265 ?auto_172257 ) ( not ( = ?auto_172262 ?auto_172258 ) ) ( not ( = ?auto_172262 ?auto_172259 ) ) ( not ( = ?auto_172258 ?auto_172259 ) ) ( not ( = ?auto_172263 ?auto_172266 ) ) ( not ( = ?auto_172262 ?auto_172261 ) ) ( not ( = ?auto_172258 ?auto_172261 ) ) ( not ( = ?auto_172259 ?auto_172261 ) ) ( not ( = ?auto_172262 ?auto_172260 ) ) ( not ( = ?auto_172258 ?auto_172260 ) ) ( not ( = ?auto_172259 ?auto_172260 ) ) ( not ( = ?auto_172261 ?auto_172260 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172262 ?auto_172258 ?auto_172259 ?auto_172260 ?auto_172261 ?auto_172257 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172392 - OBJ
      ?auto_172393 - OBJ
      ?auto_172394 - OBJ
      ?auto_172395 - OBJ
      ?auto_172396 - OBJ
      ?auto_172391 - LOCATION
    )
    :vars
    (
      ?auto_172397 - LOCATION
      ?auto_172398 - CITY
      ?auto_172400 - LOCATION
      ?auto_172399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172397 ?auto_172398 ) ( IN-CITY ?auto_172391 ?auto_172398 ) ( not ( = ?auto_172391 ?auto_172397 ) ) ( OBJ-AT ?auto_172396 ?auto_172397 ) ( IN-CITY ?auto_172400 ?auto_172398 ) ( not ( = ?auto_172391 ?auto_172400 ) ) ( OBJ-AT ?auto_172393 ?auto_172400 ) ( OBJ-AT ?auto_172395 ?auto_172397 ) ( OBJ-AT ?auto_172392 ?auto_172400 ) ( OBJ-AT ?auto_172394 ?auto_172400 ) ( TRUCK-AT ?auto_172399 ?auto_172391 ) ( not ( = ?auto_172394 ?auto_172392 ) ) ( not ( = ?auto_172394 ?auto_172395 ) ) ( not ( = ?auto_172392 ?auto_172395 ) ) ( not ( = ?auto_172397 ?auto_172400 ) ) ( not ( = ?auto_172394 ?auto_172393 ) ) ( not ( = ?auto_172392 ?auto_172393 ) ) ( not ( = ?auto_172395 ?auto_172393 ) ) ( not ( = ?auto_172394 ?auto_172396 ) ) ( not ( = ?auto_172392 ?auto_172396 ) ) ( not ( = ?auto_172395 ?auto_172396 ) ) ( not ( = ?auto_172393 ?auto_172396 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172394 ?auto_172392 ?auto_172395 ?auto_172396 ?auto_172393 ?auto_172391 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172435 - OBJ
      ?auto_172436 - OBJ
      ?auto_172437 - OBJ
      ?auto_172438 - OBJ
      ?auto_172439 - OBJ
      ?auto_172434 - LOCATION
    )
    :vars
    (
      ?auto_172440 - LOCATION
      ?auto_172441 - CITY
      ?auto_172443 - LOCATION
      ?auto_172442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172440 ?auto_172441 ) ( IN-CITY ?auto_172434 ?auto_172441 ) ( not ( = ?auto_172434 ?auto_172440 ) ) ( OBJ-AT ?auto_172438 ?auto_172440 ) ( IN-CITY ?auto_172443 ?auto_172441 ) ( not ( = ?auto_172434 ?auto_172443 ) ) ( OBJ-AT ?auto_172436 ?auto_172443 ) ( OBJ-AT ?auto_172439 ?auto_172440 ) ( OBJ-AT ?auto_172435 ?auto_172443 ) ( OBJ-AT ?auto_172437 ?auto_172443 ) ( TRUCK-AT ?auto_172442 ?auto_172434 ) ( not ( = ?auto_172437 ?auto_172435 ) ) ( not ( = ?auto_172437 ?auto_172439 ) ) ( not ( = ?auto_172435 ?auto_172439 ) ) ( not ( = ?auto_172440 ?auto_172443 ) ) ( not ( = ?auto_172437 ?auto_172436 ) ) ( not ( = ?auto_172435 ?auto_172436 ) ) ( not ( = ?auto_172439 ?auto_172436 ) ) ( not ( = ?auto_172437 ?auto_172438 ) ) ( not ( = ?auto_172435 ?auto_172438 ) ) ( not ( = ?auto_172439 ?auto_172438 ) ) ( not ( = ?auto_172436 ?auto_172438 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172437 ?auto_172435 ?auto_172439 ?auto_172438 ?auto_172436 ?auto_172434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172571 - OBJ
      ?auto_172572 - OBJ
      ?auto_172573 - OBJ
      ?auto_172574 - OBJ
      ?auto_172575 - OBJ
      ?auto_172570 - LOCATION
    )
    :vars
    (
      ?auto_172576 - LOCATION
      ?auto_172577 - CITY
      ?auto_172579 - LOCATION
      ?auto_172578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172576 ?auto_172577 ) ( IN-CITY ?auto_172570 ?auto_172577 ) ( not ( = ?auto_172570 ?auto_172576 ) ) ( OBJ-AT ?auto_172575 ?auto_172576 ) ( IN-CITY ?auto_172579 ?auto_172577 ) ( not ( = ?auto_172570 ?auto_172579 ) ) ( OBJ-AT ?auto_172572 ?auto_172579 ) ( OBJ-AT ?auto_172573 ?auto_172576 ) ( OBJ-AT ?auto_172571 ?auto_172579 ) ( OBJ-AT ?auto_172574 ?auto_172579 ) ( TRUCK-AT ?auto_172578 ?auto_172570 ) ( not ( = ?auto_172574 ?auto_172571 ) ) ( not ( = ?auto_172574 ?auto_172573 ) ) ( not ( = ?auto_172571 ?auto_172573 ) ) ( not ( = ?auto_172576 ?auto_172579 ) ) ( not ( = ?auto_172574 ?auto_172572 ) ) ( not ( = ?auto_172571 ?auto_172572 ) ) ( not ( = ?auto_172573 ?auto_172572 ) ) ( not ( = ?auto_172574 ?auto_172575 ) ) ( not ( = ?auto_172571 ?auto_172575 ) ) ( not ( = ?auto_172573 ?auto_172575 ) ) ( not ( = ?auto_172572 ?auto_172575 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172574 ?auto_172571 ?auto_172573 ?auto_172575 ?auto_172572 ?auto_172570 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172614 - OBJ
      ?auto_172615 - OBJ
      ?auto_172616 - OBJ
      ?auto_172617 - OBJ
      ?auto_172618 - OBJ
      ?auto_172613 - LOCATION
    )
    :vars
    (
      ?auto_172619 - LOCATION
      ?auto_172620 - CITY
      ?auto_172622 - LOCATION
      ?auto_172621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172619 ?auto_172620 ) ( IN-CITY ?auto_172613 ?auto_172620 ) ( not ( = ?auto_172613 ?auto_172619 ) ) ( OBJ-AT ?auto_172617 ?auto_172619 ) ( IN-CITY ?auto_172622 ?auto_172620 ) ( not ( = ?auto_172613 ?auto_172622 ) ) ( OBJ-AT ?auto_172615 ?auto_172622 ) ( OBJ-AT ?auto_172616 ?auto_172619 ) ( OBJ-AT ?auto_172614 ?auto_172622 ) ( OBJ-AT ?auto_172618 ?auto_172622 ) ( TRUCK-AT ?auto_172621 ?auto_172613 ) ( not ( = ?auto_172618 ?auto_172614 ) ) ( not ( = ?auto_172618 ?auto_172616 ) ) ( not ( = ?auto_172614 ?auto_172616 ) ) ( not ( = ?auto_172619 ?auto_172622 ) ) ( not ( = ?auto_172618 ?auto_172615 ) ) ( not ( = ?auto_172614 ?auto_172615 ) ) ( not ( = ?auto_172616 ?auto_172615 ) ) ( not ( = ?auto_172618 ?auto_172617 ) ) ( not ( = ?auto_172614 ?auto_172617 ) ) ( not ( = ?auto_172616 ?auto_172617 ) ) ( not ( = ?auto_172615 ?auto_172617 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172618 ?auto_172614 ?auto_172616 ?auto_172617 ?auto_172615 ?auto_172613 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172794 - OBJ
      ?auto_172795 - OBJ
      ?auto_172796 - OBJ
      ?auto_172797 - OBJ
      ?auto_172798 - OBJ
      ?auto_172793 - LOCATION
    )
    :vars
    (
      ?auto_172799 - LOCATION
      ?auto_172800 - CITY
      ?auto_172802 - LOCATION
      ?auto_172801 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172799 ?auto_172800 ) ( IN-CITY ?auto_172793 ?auto_172800 ) ( not ( = ?auto_172793 ?auto_172799 ) ) ( OBJ-AT ?auto_172796 ?auto_172799 ) ( IN-CITY ?auto_172802 ?auto_172800 ) ( not ( = ?auto_172793 ?auto_172802 ) ) ( OBJ-AT ?auto_172795 ?auto_172802 ) ( OBJ-AT ?auto_172798 ?auto_172799 ) ( OBJ-AT ?auto_172794 ?auto_172802 ) ( OBJ-AT ?auto_172797 ?auto_172802 ) ( TRUCK-AT ?auto_172801 ?auto_172793 ) ( not ( = ?auto_172797 ?auto_172794 ) ) ( not ( = ?auto_172797 ?auto_172798 ) ) ( not ( = ?auto_172794 ?auto_172798 ) ) ( not ( = ?auto_172799 ?auto_172802 ) ) ( not ( = ?auto_172797 ?auto_172795 ) ) ( not ( = ?auto_172794 ?auto_172795 ) ) ( not ( = ?auto_172798 ?auto_172795 ) ) ( not ( = ?auto_172797 ?auto_172796 ) ) ( not ( = ?auto_172794 ?auto_172796 ) ) ( not ( = ?auto_172798 ?auto_172796 ) ) ( not ( = ?auto_172795 ?auto_172796 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172797 ?auto_172794 ?auto_172798 ?auto_172796 ?auto_172795 ?auto_172793 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172884 - OBJ
      ?auto_172885 - OBJ
      ?auto_172886 - OBJ
      ?auto_172887 - OBJ
      ?auto_172888 - OBJ
      ?auto_172883 - LOCATION
    )
    :vars
    (
      ?auto_172889 - LOCATION
      ?auto_172890 - CITY
      ?auto_172892 - LOCATION
      ?auto_172891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172889 ?auto_172890 ) ( IN-CITY ?auto_172883 ?auto_172890 ) ( not ( = ?auto_172883 ?auto_172889 ) ) ( OBJ-AT ?auto_172886 ?auto_172889 ) ( IN-CITY ?auto_172892 ?auto_172890 ) ( not ( = ?auto_172883 ?auto_172892 ) ) ( OBJ-AT ?auto_172885 ?auto_172892 ) ( OBJ-AT ?auto_172887 ?auto_172889 ) ( OBJ-AT ?auto_172884 ?auto_172892 ) ( OBJ-AT ?auto_172888 ?auto_172892 ) ( TRUCK-AT ?auto_172891 ?auto_172883 ) ( not ( = ?auto_172888 ?auto_172884 ) ) ( not ( = ?auto_172888 ?auto_172887 ) ) ( not ( = ?auto_172884 ?auto_172887 ) ) ( not ( = ?auto_172889 ?auto_172892 ) ) ( not ( = ?auto_172888 ?auto_172885 ) ) ( not ( = ?auto_172884 ?auto_172885 ) ) ( not ( = ?auto_172887 ?auto_172885 ) ) ( not ( = ?auto_172888 ?auto_172886 ) ) ( not ( = ?auto_172884 ?auto_172886 ) ) ( not ( = ?auto_172887 ?auto_172886 ) ) ( not ( = ?auto_172885 ?auto_172886 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172888 ?auto_172884 ?auto_172887 ?auto_172886 ?auto_172885 ?auto_172883 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173203 - OBJ
      ?auto_173204 - OBJ
      ?auto_173205 - OBJ
      ?auto_173206 - OBJ
      ?auto_173207 - OBJ
      ?auto_173202 - LOCATION
    )
    :vars
    (
      ?auto_173208 - LOCATION
      ?auto_173209 - CITY
      ?auto_173211 - LOCATION
      ?auto_173210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173208 ?auto_173209 ) ( IN-CITY ?auto_173202 ?auto_173209 ) ( not ( = ?auto_173202 ?auto_173208 ) ) ( OBJ-AT ?auto_173204 ?auto_173208 ) ( IN-CITY ?auto_173211 ?auto_173209 ) ( not ( = ?auto_173202 ?auto_173211 ) ) ( OBJ-AT ?auto_173207 ?auto_173211 ) ( OBJ-AT ?auto_173206 ?auto_173208 ) ( OBJ-AT ?auto_173203 ?auto_173211 ) ( OBJ-AT ?auto_173205 ?auto_173211 ) ( TRUCK-AT ?auto_173210 ?auto_173202 ) ( not ( = ?auto_173205 ?auto_173203 ) ) ( not ( = ?auto_173205 ?auto_173206 ) ) ( not ( = ?auto_173203 ?auto_173206 ) ) ( not ( = ?auto_173208 ?auto_173211 ) ) ( not ( = ?auto_173205 ?auto_173207 ) ) ( not ( = ?auto_173203 ?auto_173207 ) ) ( not ( = ?auto_173206 ?auto_173207 ) ) ( not ( = ?auto_173205 ?auto_173204 ) ) ( not ( = ?auto_173203 ?auto_173204 ) ) ( not ( = ?auto_173206 ?auto_173204 ) ) ( not ( = ?auto_173207 ?auto_173204 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173205 ?auto_173203 ?auto_173206 ?auto_173204 ?auto_173207 ?auto_173202 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173246 - OBJ
      ?auto_173247 - OBJ
      ?auto_173248 - OBJ
      ?auto_173249 - OBJ
      ?auto_173250 - OBJ
      ?auto_173245 - LOCATION
    )
    :vars
    (
      ?auto_173251 - LOCATION
      ?auto_173252 - CITY
      ?auto_173254 - LOCATION
      ?auto_173253 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173251 ?auto_173252 ) ( IN-CITY ?auto_173245 ?auto_173252 ) ( not ( = ?auto_173245 ?auto_173251 ) ) ( OBJ-AT ?auto_173247 ?auto_173251 ) ( IN-CITY ?auto_173254 ?auto_173252 ) ( not ( = ?auto_173245 ?auto_173254 ) ) ( OBJ-AT ?auto_173249 ?auto_173254 ) ( OBJ-AT ?auto_173250 ?auto_173251 ) ( OBJ-AT ?auto_173246 ?auto_173254 ) ( OBJ-AT ?auto_173248 ?auto_173254 ) ( TRUCK-AT ?auto_173253 ?auto_173245 ) ( not ( = ?auto_173248 ?auto_173246 ) ) ( not ( = ?auto_173248 ?auto_173250 ) ) ( not ( = ?auto_173246 ?auto_173250 ) ) ( not ( = ?auto_173251 ?auto_173254 ) ) ( not ( = ?auto_173248 ?auto_173249 ) ) ( not ( = ?auto_173246 ?auto_173249 ) ) ( not ( = ?auto_173250 ?auto_173249 ) ) ( not ( = ?auto_173248 ?auto_173247 ) ) ( not ( = ?auto_173246 ?auto_173247 ) ) ( not ( = ?auto_173250 ?auto_173247 ) ) ( not ( = ?auto_173249 ?auto_173247 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173248 ?auto_173246 ?auto_173250 ?auto_173247 ?auto_173249 ?auto_173245 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173667 - OBJ
      ?auto_173668 - OBJ
      ?auto_173669 - OBJ
      ?auto_173670 - OBJ
      ?auto_173671 - OBJ
      ?auto_173666 - LOCATION
    )
    :vars
    (
      ?auto_173672 - LOCATION
      ?auto_173673 - CITY
      ?auto_173675 - LOCATION
      ?auto_173674 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173672 ?auto_173673 ) ( IN-CITY ?auto_173666 ?auto_173673 ) ( not ( = ?auto_173666 ?auto_173672 ) ) ( OBJ-AT ?auto_173668 ?auto_173672 ) ( IN-CITY ?auto_173675 ?auto_173673 ) ( not ( = ?auto_173666 ?auto_173675 ) ) ( OBJ-AT ?auto_173671 ?auto_173675 ) ( OBJ-AT ?auto_173669 ?auto_173672 ) ( OBJ-AT ?auto_173667 ?auto_173675 ) ( OBJ-AT ?auto_173670 ?auto_173675 ) ( TRUCK-AT ?auto_173674 ?auto_173666 ) ( not ( = ?auto_173670 ?auto_173667 ) ) ( not ( = ?auto_173670 ?auto_173669 ) ) ( not ( = ?auto_173667 ?auto_173669 ) ) ( not ( = ?auto_173672 ?auto_173675 ) ) ( not ( = ?auto_173670 ?auto_173671 ) ) ( not ( = ?auto_173667 ?auto_173671 ) ) ( not ( = ?auto_173669 ?auto_173671 ) ) ( not ( = ?auto_173670 ?auto_173668 ) ) ( not ( = ?auto_173667 ?auto_173668 ) ) ( not ( = ?auto_173669 ?auto_173668 ) ) ( not ( = ?auto_173671 ?auto_173668 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173670 ?auto_173667 ?auto_173669 ?auto_173668 ?auto_173671 ?auto_173666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173804 - OBJ
      ?auto_173805 - OBJ
      ?auto_173806 - OBJ
      ?auto_173807 - OBJ
      ?auto_173808 - OBJ
      ?auto_173803 - LOCATION
    )
    :vars
    (
      ?auto_173809 - LOCATION
      ?auto_173810 - CITY
      ?auto_173812 - LOCATION
      ?auto_173811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173809 ?auto_173810 ) ( IN-CITY ?auto_173803 ?auto_173810 ) ( not ( = ?auto_173803 ?auto_173809 ) ) ( OBJ-AT ?auto_173805 ?auto_173809 ) ( IN-CITY ?auto_173812 ?auto_173810 ) ( not ( = ?auto_173803 ?auto_173812 ) ) ( OBJ-AT ?auto_173807 ?auto_173812 ) ( OBJ-AT ?auto_173806 ?auto_173809 ) ( OBJ-AT ?auto_173804 ?auto_173812 ) ( OBJ-AT ?auto_173808 ?auto_173812 ) ( TRUCK-AT ?auto_173811 ?auto_173803 ) ( not ( = ?auto_173808 ?auto_173804 ) ) ( not ( = ?auto_173808 ?auto_173806 ) ) ( not ( = ?auto_173804 ?auto_173806 ) ) ( not ( = ?auto_173809 ?auto_173812 ) ) ( not ( = ?auto_173808 ?auto_173807 ) ) ( not ( = ?auto_173804 ?auto_173807 ) ) ( not ( = ?auto_173806 ?auto_173807 ) ) ( not ( = ?auto_173808 ?auto_173805 ) ) ( not ( = ?auto_173804 ?auto_173805 ) ) ( not ( = ?auto_173806 ?auto_173805 ) ) ( not ( = ?auto_173807 ?auto_173805 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173808 ?auto_173804 ?auto_173806 ?auto_173805 ?auto_173807 ?auto_173803 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173938 - OBJ
      ?auto_173939 - OBJ
      ?auto_173940 - OBJ
      ?auto_173941 - OBJ
      ?auto_173942 - OBJ
      ?auto_173937 - LOCATION
    )
    :vars
    (
      ?auto_173943 - LOCATION
      ?auto_173944 - CITY
      ?auto_173946 - LOCATION
      ?auto_173945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173943 ?auto_173944 ) ( IN-CITY ?auto_173937 ?auto_173944 ) ( not ( = ?auto_173937 ?auto_173943 ) ) ( OBJ-AT ?auto_173939 ?auto_173943 ) ( IN-CITY ?auto_173946 ?auto_173944 ) ( not ( = ?auto_173937 ?auto_173946 ) ) ( OBJ-AT ?auto_173940 ?auto_173946 ) ( OBJ-AT ?auto_173942 ?auto_173943 ) ( OBJ-AT ?auto_173938 ?auto_173946 ) ( OBJ-AT ?auto_173941 ?auto_173946 ) ( TRUCK-AT ?auto_173945 ?auto_173937 ) ( not ( = ?auto_173941 ?auto_173938 ) ) ( not ( = ?auto_173941 ?auto_173942 ) ) ( not ( = ?auto_173938 ?auto_173942 ) ) ( not ( = ?auto_173943 ?auto_173946 ) ) ( not ( = ?auto_173941 ?auto_173940 ) ) ( not ( = ?auto_173938 ?auto_173940 ) ) ( not ( = ?auto_173942 ?auto_173940 ) ) ( not ( = ?auto_173941 ?auto_173939 ) ) ( not ( = ?auto_173938 ?auto_173939 ) ) ( not ( = ?auto_173942 ?auto_173939 ) ) ( not ( = ?auto_173940 ?auto_173939 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173941 ?auto_173938 ?auto_173942 ?auto_173939 ?auto_173940 ?auto_173937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174028 - OBJ
      ?auto_174029 - OBJ
      ?auto_174030 - OBJ
      ?auto_174031 - OBJ
      ?auto_174032 - OBJ
      ?auto_174027 - LOCATION
    )
    :vars
    (
      ?auto_174033 - LOCATION
      ?auto_174034 - CITY
      ?auto_174036 - LOCATION
      ?auto_174035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174033 ?auto_174034 ) ( IN-CITY ?auto_174027 ?auto_174034 ) ( not ( = ?auto_174027 ?auto_174033 ) ) ( OBJ-AT ?auto_174029 ?auto_174033 ) ( IN-CITY ?auto_174036 ?auto_174034 ) ( not ( = ?auto_174027 ?auto_174036 ) ) ( OBJ-AT ?auto_174030 ?auto_174036 ) ( OBJ-AT ?auto_174031 ?auto_174033 ) ( OBJ-AT ?auto_174028 ?auto_174036 ) ( OBJ-AT ?auto_174032 ?auto_174036 ) ( TRUCK-AT ?auto_174035 ?auto_174027 ) ( not ( = ?auto_174032 ?auto_174028 ) ) ( not ( = ?auto_174032 ?auto_174031 ) ) ( not ( = ?auto_174028 ?auto_174031 ) ) ( not ( = ?auto_174033 ?auto_174036 ) ) ( not ( = ?auto_174032 ?auto_174030 ) ) ( not ( = ?auto_174028 ?auto_174030 ) ) ( not ( = ?auto_174031 ?auto_174030 ) ) ( not ( = ?auto_174032 ?auto_174029 ) ) ( not ( = ?auto_174028 ?auto_174029 ) ) ( not ( = ?auto_174031 ?auto_174029 ) ) ( not ( = ?auto_174030 ?auto_174029 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174032 ?auto_174028 ?auto_174031 ?auto_174029 ?auto_174030 ?auto_174027 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174633 - OBJ
      ?auto_174634 - OBJ
      ?auto_174635 - OBJ
      ?auto_174636 - OBJ
      ?auto_174637 - OBJ
      ?auto_174632 - LOCATION
    )
    :vars
    (
      ?auto_174638 - LOCATION
      ?auto_174639 - CITY
      ?auto_174641 - LOCATION
      ?auto_174640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174638 ?auto_174639 ) ( IN-CITY ?auto_174632 ?auto_174639 ) ( not ( = ?auto_174632 ?auto_174638 ) ) ( OBJ-AT ?auto_174637 ?auto_174638 ) ( IN-CITY ?auto_174641 ?auto_174639 ) ( not ( = ?auto_174632 ?auto_174641 ) ) ( OBJ-AT ?auto_174636 ?auto_174641 ) ( OBJ-AT ?auto_174633 ?auto_174638 ) ( OBJ-AT ?auto_174635 ?auto_174641 ) ( OBJ-AT ?auto_174634 ?auto_174641 ) ( TRUCK-AT ?auto_174640 ?auto_174632 ) ( not ( = ?auto_174634 ?auto_174635 ) ) ( not ( = ?auto_174634 ?auto_174633 ) ) ( not ( = ?auto_174635 ?auto_174633 ) ) ( not ( = ?auto_174638 ?auto_174641 ) ) ( not ( = ?auto_174634 ?auto_174636 ) ) ( not ( = ?auto_174635 ?auto_174636 ) ) ( not ( = ?auto_174633 ?auto_174636 ) ) ( not ( = ?auto_174634 ?auto_174637 ) ) ( not ( = ?auto_174635 ?auto_174637 ) ) ( not ( = ?auto_174633 ?auto_174637 ) ) ( not ( = ?auto_174636 ?auto_174637 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174634 ?auto_174635 ?auto_174633 ?auto_174637 ?auto_174636 ?auto_174632 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174676 - OBJ
      ?auto_174677 - OBJ
      ?auto_174678 - OBJ
      ?auto_174679 - OBJ
      ?auto_174680 - OBJ
      ?auto_174675 - LOCATION
    )
    :vars
    (
      ?auto_174681 - LOCATION
      ?auto_174682 - CITY
      ?auto_174684 - LOCATION
      ?auto_174683 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174681 ?auto_174682 ) ( IN-CITY ?auto_174675 ?auto_174682 ) ( not ( = ?auto_174675 ?auto_174681 ) ) ( OBJ-AT ?auto_174679 ?auto_174681 ) ( IN-CITY ?auto_174684 ?auto_174682 ) ( not ( = ?auto_174675 ?auto_174684 ) ) ( OBJ-AT ?auto_174680 ?auto_174684 ) ( OBJ-AT ?auto_174676 ?auto_174681 ) ( OBJ-AT ?auto_174678 ?auto_174684 ) ( OBJ-AT ?auto_174677 ?auto_174684 ) ( TRUCK-AT ?auto_174683 ?auto_174675 ) ( not ( = ?auto_174677 ?auto_174678 ) ) ( not ( = ?auto_174677 ?auto_174676 ) ) ( not ( = ?auto_174678 ?auto_174676 ) ) ( not ( = ?auto_174681 ?auto_174684 ) ) ( not ( = ?auto_174677 ?auto_174680 ) ) ( not ( = ?auto_174678 ?auto_174680 ) ) ( not ( = ?auto_174676 ?auto_174680 ) ) ( not ( = ?auto_174677 ?auto_174679 ) ) ( not ( = ?auto_174678 ?auto_174679 ) ) ( not ( = ?auto_174676 ?auto_174679 ) ) ( not ( = ?auto_174680 ?auto_174679 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174677 ?auto_174678 ?auto_174676 ?auto_174679 ?auto_174680 ?auto_174675 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174812 - OBJ
      ?auto_174813 - OBJ
      ?auto_174814 - OBJ
      ?auto_174815 - OBJ
      ?auto_174816 - OBJ
      ?auto_174811 - LOCATION
    )
    :vars
    (
      ?auto_174817 - LOCATION
      ?auto_174818 - CITY
      ?auto_174820 - LOCATION
      ?auto_174819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174817 ?auto_174818 ) ( IN-CITY ?auto_174811 ?auto_174818 ) ( not ( = ?auto_174811 ?auto_174817 ) ) ( OBJ-AT ?auto_174816 ?auto_174817 ) ( IN-CITY ?auto_174820 ?auto_174818 ) ( not ( = ?auto_174811 ?auto_174820 ) ) ( OBJ-AT ?auto_174814 ?auto_174820 ) ( OBJ-AT ?auto_174812 ?auto_174817 ) ( OBJ-AT ?auto_174815 ?auto_174820 ) ( OBJ-AT ?auto_174813 ?auto_174820 ) ( TRUCK-AT ?auto_174819 ?auto_174811 ) ( not ( = ?auto_174813 ?auto_174815 ) ) ( not ( = ?auto_174813 ?auto_174812 ) ) ( not ( = ?auto_174815 ?auto_174812 ) ) ( not ( = ?auto_174817 ?auto_174820 ) ) ( not ( = ?auto_174813 ?auto_174814 ) ) ( not ( = ?auto_174815 ?auto_174814 ) ) ( not ( = ?auto_174812 ?auto_174814 ) ) ( not ( = ?auto_174813 ?auto_174816 ) ) ( not ( = ?auto_174815 ?auto_174816 ) ) ( not ( = ?auto_174812 ?auto_174816 ) ) ( not ( = ?auto_174814 ?auto_174816 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174813 ?auto_174815 ?auto_174812 ?auto_174816 ?auto_174814 ?auto_174811 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174855 - OBJ
      ?auto_174856 - OBJ
      ?auto_174857 - OBJ
      ?auto_174858 - OBJ
      ?auto_174859 - OBJ
      ?auto_174854 - LOCATION
    )
    :vars
    (
      ?auto_174860 - LOCATION
      ?auto_174861 - CITY
      ?auto_174863 - LOCATION
      ?auto_174862 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174860 ?auto_174861 ) ( IN-CITY ?auto_174854 ?auto_174861 ) ( not ( = ?auto_174854 ?auto_174860 ) ) ( OBJ-AT ?auto_174858 ?auto_174860 ) ( IN-CITY ?auto_174863 ?auto_174861 ) ( not ( = ?auto_174854 ?auto_174863 ) ) ( OBJ-AT ?auto_174857 ?auto_174863 ) ( OBJ-AT ?auto_174855 ?auto_174860 ) ( OBJ-AT ?auto_174859 ?auto_174863 ) ( OBJ-AT ?auto_174856 ?auto_174863 ) ( TRUCK-AT ?auto_174862 ?auto_174854 ) ( not ( = ?auto_174856 ?auto_174859 ) ) ( not ( = ?auto_174856 ?auto_174855 ) ) ( not ( = ?auto_174859 ?auto_174855 ) ) ( not ( = ?auto_174860 ?auto_174863 ) ) ( not ( = ?auto_174856 ?auto_174857 ) ) ( not ( = ?auto_174859 ?auto_174857 ) ) ( not ( = ?auto_174855 ?auto_174857 ) ) ( not ( = ?auto_174856 ?auto_174858 ) ) ( not ( = ?auto_174859 ?auto_174858 ) ) ( not ( = ?auto_174855 ?auto_174858 ) ) ( not ( = ?auto_174857 ?auto_174858 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174856 ?auto_174859 ?auto_174855 ?auto_174858 ?auto_174857 ?auto_174854 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174989 - OBJ
      ?auto_174990 - OBJ
      ?auto_174991 - OBJ
      ?auto_174992 - OBJ
      ?auto_174993 - OBJ
      ?auto_174988 - LOCATION
    )
    :vars
    (
      ?auto_174994 - LOCATION
      ?auto_174995 - CITY
      ?auto_174997 - LOCATION
      ?auto_174996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174994 ?auto_174995 ) ( IN-CITY ?auto_174988 ?auto_174995 ) ( not ( = ?auto_174988 ?auto_174994 ) ) ( OBJ-AT ?auto_174991 ?auto_174994 ) ( IN-CITY ?auto_174997 ?auto_174995 ) ( not ( = ?auto_174988 ?auto_174997 ) ) ( OBJ-AT ?auto_174993 ?auto_174997 ) ( OBJ-AT ?auto_174989 ?auto_174994 ) ( OBJ-AT ?auto_174992 ?auto_174997 ) ( OBJ-AT ?auto_174990 ?auto_174997 ) ( TRUCK-AT ?auto_174996 ?auto_174988 ) ( not ( = ?auto_174990 ?auto_174992 ) ) ( not ( = ?auto_174990 ?auto_174989 ) ) ( not ( = ?auto_174992 ?auto_174989 ) ) ( not ( = ?auto_174994 ?auto_174997 ) ) ( not ( = ?auto_174990 ?auto_174993 ) ) ( not ( = ?auto_174992 ?auto_174993 ) ) ( not ( = ?auto_174989 ?auto_174993 ) ) ( not ( = ?auto_174990 ?auto_174991 ) ) ( not ( = ?auto_174992 ?auto_174991 ) ) ( not ( = ?auto_174989 ?auto_174991 ) ) ( not ( = ?auto_174993 ?auto_174991 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174990 ?auto_174992 ?auto_174989 ?auto_174991 ?auto_174993 ?auto_174988 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175079 - OBJ
      ?auto_175080 - OBJ
      ?auto_175081 - OBJ
      ?auto_175082 - OBJ
      ?auto_175083 - OBJ
      ?auto_175078 - LOCATION
    )
    :vars
    (
      ?auto_175084 - LOCATION
      ?auto_175085 - CITY
      ?auto_175087 - LOCATION
      ?auto_175086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175084 ?auto_175085 ) ( IN-CITY ?auto_175078 ?auto_175085 ) ( not ( = ?auto_175078 ?auto_175084 ) ) ( OBJ-AT ?auto_175081 ?auto_175084 ) ( IN-CITY ?auto_175087 ?auto_175085 ) ( not ( = ?auto_175078 ?auto_175087 ) ) ( OBJ-AT ?auto_175082 ?auto_175087 ) ( OBJ-AT ?auto_175079 ?auto_175084 ) ( OBJ-AT ?auto_175083 ?auto_175087 ) ( OBJ-AT ?auto_175080 ?auto_175087 ) ( TRUCK-AT ?auto_175086 ?auto_175078 ) ( not ( = ?auto_175080 ?auto_175083 ) ) ( not ( = ?auto_175080 ?auto_175079 ) ) ( not ( = ?auto_175083 ?auto_175079 ) ) ( not ( = ?auto_175084 ?auto_175087 ) ) ( not ( = ?auto_175080 ?auto_175082 ) ) ( not ( = ?auto_175083 ?auto_175082 ) ) ( not ( = ?auto_175079 ?auto_175082 ) ) ( not ( = ?auto_175080 ?auto_175081 ) ) ( not ( = ?auto_175083 ?auto_175081 ) ) ( not ( = ?auto_175079 ?auto_175081 ) ) ( not ( = ?auto_175082 ?auto_175081 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175080 ?auto_175083 ?auto_175079 ?auto_175081 ?auto_175082 ?auto_175078 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175213 - OBJ
      ?auto_175214 - OBJ
      ?auto_175215 - OBJ
      ?auto_175216 - OBJ
      ?auto_175217 - OBJ
      ?auto_175212 - LOCATION
    )
    :vars
    (
      ?auto_175218 - LOCATION
      ?auto_175219 - CITY
      ?auto_175221 - LOCATION
      ?auto_175220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175218 ?auto_175219 ) ( IN-CITY ?auto_175212 ?auto_175219 ) ( not ( = ?auto_175212 ?auto_175218 ) ) ( OBJ-AT ?auto_175217 ?auto_175218 ) ( IN-CITY ?auto_175221 ?auto_175219 ) ( not ( = ?auto_175212 ?auto_175221 ) ) ( OBJ-AT ?auto_175216 ?auto_175221 ) ( OBJ-AT ?auto_175213 ?auto_175218 ) ( OBJ-AT ?auto_175214 ?auto_175221 ) ( OBJ-AT ?auto_175215 ?auto_175221 ) ( TRUCK-AT ?auto_175220 ?auto_175212 ) ( not ( = ?auto_175215 ?auto_175214 ) ) ( not ( = ?auto_175215 ?auto_175213 ) ) ( not ( = ?auto_175214 ?auto_175213 ) ) ( not ( = ?auto_175218 ?auto_175221 ) ) ( not ( = ?auto_175215 ?auto_175216 ) ) ( not ( = ?auto_175214 ?auto_175216 ) ) ( not ( = ?auto_175213 ?auto_175216 ) ) ( not ( = ?auto_175215 ?auto_175217 ) ) ( not ( = ?auto_175214 ?auto_175217 ) ) ( not ( = ?auto_175213 ?auto_175217 ) ) ( not ( = ?auto_175216 ?auto_175217 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175215 ?auto_175214 ?auto_175213 ?auto_175217 ?auto_175216 ?auto_175212 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175256 - OBJ
      ?auto_175257 - OBJ
      ?auto_175258 - OBJ
      ?auto_175259 - OBJ
      ?auto_175260 - OBJ
      ?auto_175255 - LOCATION
    )
    :vars
    (
      ?auto_175261 - LOCATION
      ?auto_175262 - CITY
      ?auto_175264 - LOCATION
      ?auto_175263 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175261 ?auto_175262 ) ( IN-CITY ?auto_175255 ?auto_175262 ) ( not ( = ?auto_175255 ?auto_175261 ) ) ( OBJ-AT ?auto_175259 ?auto_175261 ) ( IN-CITY ?auto_175264 ?auto_175262 ) ( not ( = ?auto_175255 ?auto_175264 ) ) ( OBJ-AT ?auto_175260 ?auto_175264 ) ( OBJ-AT ?auto_175256 ?auto_175261 ) ( OBJ-AT ?auto_175257 ?auto_175264 ) ( OBJ-AT ?auto_175258 ?auto_175264 ) ( TRUCK-AT ?auto_175263 ?auto_175255 ) ( not ( = ?auto_175258 ?auto_175257 ) ) ( not ( = ?auto_175258 ?auto_175256 ) ) ( not ( = ?auto_175257 ?auto_175256 ) ) ( not ( = ?auto_175261 ?auto_175264 ) ) ( not ( = ?auto_175258 ?auto_175260 ) ) ( not ( = ?auto_175257 ?auto_175260 ) ) ( not ( = ?auto_175256 ?auto_175260 ) ) ( not ( = ?auto_175258 ?auto_175259 ) ) ( not ( = ?auto_175257 ?auto_175259 ) ) ( not ( = ?auto_175256 ?auto_175259 ) ) ( not ( = ?auto_175260 ?auto_175259 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175258 ?auto_175257 ?auto_175256 ?auto_175259 ?auto_175260 ?auto_175255 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175485 - OBJ
      ?auto_175486 - OBJ
      ?auto_175487 - OBJ
      ?auto_175488 - OBJ
      ?auto_175489 - OBJ
      ?auto_175484 - LOCATION
    )
    :vars
    (
      ?auto_175490 - LOCATION
      ?auto_175491 - CITY
      ?auto_175493 - LOCATION
      ?auto_175492 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175490 ?auto_175491 ) ( IN-CITY ?auto_175484 ?auto_175491 ) ( not ( = ?auto_175484 ?auto_175490 ) ) ( OBJ-AT ?auto_175489 ?auto_175490 ) ( IN-CITY ?auto_175493 ?auto_175491 ) ( not ( = ?auto_175484 ?auto_175493 ) ) ( OBJ-AT ?auto_175487 ?auto_175493 ) ( OBJ-AT ?auto_175485 ?auto_175490 ) ( OBJ-AT ?auto_175486 ?auto_175493 ) ( OBJ-AT ?auto_175488 ?auto_175493 ) ( TRUCK-AT ?auto_175492 ?auto_175484 ) ( not ( = ?auto_175488 ?auto_175486 ) ) ( not ( = ?auto_175488 ?auto_175485 ) ) ( not ( = ?auto_175486 ?auto_175485 ) ) ( not ( = ?auto_175490 ?auto_175493 ) ) ( not ( = ?auto_175488 ?auto_175487 ) ) ( not ( = ?auto_175486 ?auto_175487 ) ) ( not ( = ?auto_175485 ?auto_175487 ) ) ( not ( = ?auto_175488 ?auto_175489 ) ) ( not ( = ?auto_175486 ?auto_175489 ) ) ( not ( = ?auto_175485 ?auto_175489 ) ) ( not ( = ?auto_175487 ?auto_175489 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175488 ?auto_175486 ?auto_175485 ?auto_175489 ?auto_175487 ?auto_175484 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175528 - OBJ
      ?auto_175529 - OBJ
      ?auto_175530 - OBJ
      ?auto_175531 - OBJ
      ?auto_175532 - OBJ
      ?auto_175527 - LOCATION
    )
    :vars
    (
      ?auto_175533 - LOCATION
      ?auto_175534 - CITY
      ?auto_175536 - LOCATION
      ?auto_175535 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175533 ?auto_175534 ) ( IN-CITY ?auto_175527 ?auto_175534 ) ( not ( = ?auto_175527 ?auto_175533 ) ) ( OBJ-AT ?auto_175531 ?auto_175533 ) ( IN-CITY ?auto_175536 ?auto_175534 ) ( not ( = ?auto_175527 ?auto_175536 ) ) ( OBJ-AT ?auto_175530 ?auto_175536 ) ( OBJ-AT ?auto_175528 ?auto_175533 ) ( OBJ-AT ?auto_175529 ?auto_175536 ) ( OBJ-AT ?auto_175532 ?auto_175536 ) ( TRUCK-AT ?auto_175535 ?auto_175527 ) ( not ( = ?auto_175532 ?auto_175529 ) ) ( not ( = ?auto_175532 ?auto_175528 ) ) ( not ( = ?auto_175529 ?auto_175528 ) ) ( not ( = ?auto_175533 ?auto_175536 ) ) ( not ( = ?auto_175532 ?auto_175530 ) ) ( not ( = ?auto_175529 ?auto_175530 ) ) ( not ( = ?auto_175528 ?auto_175530 ) ) ( not ( = ?auto_175532 ?auto_175531 ) ) ( not ( = ?auto_175529 ?auto_175531 ) ) ( not ( = ?auto_175528 ?auto_175531 ) ) ( not ( = ?auto_175530 ?auto_175531 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175532 ?auto_175529 ?auto_175528 ?auto_175531 ?auto_175530 ?auto_175527 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175615 - OBJ
      ?auto_175616 - OBJ
      ?auto_175617 - OBJ
      ?auto_175618 - OBJ
      ?auto_175619 - OBJ
      ?auto_175614 - LOCATION
    )
    :vars
    (
      ?auto_175620 - LOCATION
      ?auto_175621 - CITY
      ?auto_175623 - LOCATION
      ?auto_175622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175620 ?auto_175621 ) ( IN-CITY ?auto_175614 ?auto_175621 ) ( not ( = ?auto_175614 ?auto_175620 ) ) ( OBJ-AT ?auto_175617 ?auto_175620 ) ( IN-CITY ?auto_175623 ?auto_175621 ) ( not ( = ?auto_175614 ?auto_175623 ) ) ( OBJ-AT ?auto_175619 ?auto_175623 ) ( OBJ-AT ?auto_175615 ?auto_175620 ) ( OBJ-AT ?auto_175616 ?auto_175623 ) ( OBJ-AT ?auto_175618 ?auto_175623 ) ( TRUCK-AT ?auto_175622 ?auto_175614 ) ( not ( = ?auto_175618 ?auto_175616 ) ) ( not ( = ?auto_175618 ?auto_175615 ) ) ( not ( = ?auto_175616 ?auto_175615 ) ) ( not ( = ?auto_175620 ?auto_175623 ) ) ( not ( = ?auto_175618 ?auto_175619 ) ) ( not ( = ?auto_175616 ?auto_175619 ) ) ( not ( = ?auto_175615 ?auto_175619 ) ) ( not ( = ?auto_175618 ?auto_175617 ) ) ( not ( = ?auto_175616 ?auto_175617 ) ) ( not ( = ?auto_175615 ?auto_175617 ) ) ( not ( = ?auto_175619 ?auto_175617 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175618 ?auto_175616 ?auto_175615 ?auto_175617 ?auto_175619 ?auto_175614 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175752 - OBJ
      ?auto_175753 - OBJ
      ?auto_175754 - OBJ
      ?auto_175755 - OBJ
      ?auto_175756 - OBJ
      ?auto_175751 - LOCATION
    )
    :vars
    (
      ?auto_175757 - LOCATION
      ?auto_175758 - CITY
      ?auto_175760 - LOCATION
      ?auto_175759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175757 ?auto_175758 ) ( IN-CITY ?auto_175751 ?auto_175758 ) ( not ( = ?auto_175751 ?auto_175757 ) ) ( OBJ-AT ?auto_175754 ?auto_175757 ) ( IN-CITY ?auto_175760 ?auto_175758 ) ( not ( = ?auto_175751 ?auto_175760 ) ) ( OBJ-AT ?auto_175755 ?auto_175760 ) ( OBJ-AT ?auto_175752 ?auto_175757 ) ( OBJ-AT ?auto_175753 ?auto_175760 ) ( OBJ-AT ?auto_175756 ?auto_175760 ) ( TRUCK-AT ?auto_175759 ?auto_175751 ) ( not ( = ?auto_175756 ?auto_175753 ) ) ( not ( = ?auto_175756 ?auto_175752 ) ) ( not ( = ?auto_175753 ?auto_175752 ) ) ( not ( = ?auto_175757 ?auto_175760 ) ) ( not ( = ?auto_175756 ?auto_175755 ) ) ( not ( = ?auto_175753 ?auto_175755 ) ) ( not ( = ?auto_175752 ?auto_175755 ) ) ( not ( = ?auto_175756 ?auto_175754 ) ) ( not ( = ?auto_175753 ?auto_175754 ) ) ( not ( = ?auto_175752 ?auto_175754 ) ) ( not ( = ?auto_175755 ?auto_175754 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175756 ?auto_175753 ?auto_175752 ?auto_175754 ?auto_175755 ?auto_175751 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176596 - OBJ
      ?auto_176597 - OBJ
      ?auto_176598 - OBJ
      ?auto_176599 - OBJ
      ?auto_176600 - OBJ
      ?auto_176595 - LOCATION
    )
    :vars
    (
      ?auto_176601 - LOCATION
      ?auto_176602 - CITY
      ?auto_176604 - LOCATION
      ?auto_176603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176601 ?auto_176602 ) ( IN-CITY ?auto_176595 ?auto_176602 ) ( not ( = ?auto_176595 ?auto_176601 ) ) ( OBJ-AT ?auto_176600 ?auto_176601 ) ( IN-CITY ?auto_176604 ?auto_176602 ) ( not ( = ?auto_176595 ?auto_176604 ) ) ( OBJ-AT ?auto_176597 ?auto_176604 ) ( OBJ-AT ?auto_176596 ?auto_176601 ) ( OBJ-AT ?auto_176599 ?auto_176604 ) ( OBJ-AT ?auto_176598 ?auto_176604 ) ( TRUCK-AT ?auto_176603 ?auto_176595 ) ( not ( = ?auto_176598 ?auto_176599 ) ) ( not ( = ?auto_176598 ?auto_176596 ) ) ( not ( = ?auto_176599 ?auto_176596 ) ) ( not ( = ?auto_176601 ?auto_176604 ) ) ( not ( = ?auto_176598 ?auto_176597 ) ) ( not ( = ?auto_176599 ?auto_176597 ) ) ( not ( = ?auto_176596 ?auto_176597 ) ) ( not ( = ?auto_176598 ?auto_176600 ) ) ( not ( = ?auto_176599 ?auto_176600 ) ) ( not ( = ?auto_176596 ?auto_176600 ) ) ( not ( = ?auto_176597 ?auto_176600 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176598 ?auto_176599 ?auto_176596 ?auto_176600 ?auto_176597 ?auto_176595 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176639 - OBJ
      ?auto_176640 - OBJ
      ?auto_176641 - OBJ
      ?auto_176642 - OBJ
      ?auto_176643 - OBJ
      ?auto_176638 - LOCATION
    )
    :vars
    (
      ?auto_176644 - LOCATION
      ?auto_176645 - CITY
      ?auto_176647 - LOCATION
      ?auto_176646 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176644 ?auto_176645 ) ( IN-CITY ?auto_176638 ?auto_176645 ) ( not ( = ?auto_176638 ?auto_176644 ) ) ( OBJ-AT ?auto_176642 ?auto_176644 ) ( IN-CITY ?auto_176647 ?auto_176645 ) ( not ( = ?auto_176638 ?auto_176647 ) ) ( OBJ-AT ?auto_176640 ?auto_176647 ) ( OBJ-AT ?auto_176639 ?auto_176644 ) ( OBJ-AT ?auto_176643 ?auto_176647 ) ( OBJ-AT ?auto_176641 ?auto_176647 ) ( TRUCK-AT ?auto_176646 ?auto_176638 ) ( not ( = ?auto_176641 ?auto_176643 ) ) ( not ( = ?auto_176641 ?auto_176639 ) ) ( not ( = ?auto_176643 ?auto_176639 ) ) ( not ( = ?auto_176644 ?auto_176647 ) ) ( not ( = ?auto_176641 ?auto_176640 ) ) ( not ( = ?auto_176643 ?auto_176640 ) ) ( not ( = ?auto_176639 ?auto_176640 ) ) ( not ( = ?auto_176641 ?auto_176642 ) ) ( not ( = ?auto_176643 ?auto_176642 ) ) ( not ( = ?auto_176639 ?auto_176642 ) ) ( not ( = ?auto_176640 ?auto_176642 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176641 ?auto_176643 ?auto_176639 ?auto_176642 ?auto_176640 ?auto_176638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176682 - OBJ
      ?auto_176683 - OBJ
      ?auto_176684 - OBJ
      ?auto_176685 - OBJ
      ?auto_176686 - OBJ
      ?auto_176681 - LOCATION
    )
    :vars
    (
      ?auto_176687 - LOCATION
      ?auto_176688 - CITY
      ?auto_176690 - LOCATION
      ?auto_176689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176687 ?auto_176688 ) ( IN-CITY ?auto_176681 ?auto_176688 ) ( not ( = ?auto_176681 ?auto_176687 ) ) ( OBJ-AT ?auto_176686 ?auto_176687 ) ( IN-CITY ?auto_176690 ?auto_176688 ) ( not ( = ?auto_176681 ?auto_176690 ) ) ( OBJ-AT ?auto_176683 ?auto_176690 ) ( OBJ-AT ?auto_176682 ?auto_176687 ) ( OBJ-AT ?auto_176684 ?auto_176690 ) ( OBJ-AT ?auto_176685 ?auto_176690 ) ( TRUCK-AT ?auto_176689 ?auto_176681 ) ( not ( = ?auto_176685 ?auto_176684 ) ) ( not ( = ?auto_176685 ?auto_176682 ) ) ( not ( = ?auto_176684 ?auto_176682 ) ) ( not ( = ?auto_176687 ?auto_176690 ) ) ( not ( = ?auto_176685 ?auto_176683 ) ) ( not ( = ?auto_176684 ?auto_176683 ) ) ( not ( = ?auto_176682 ?auto_176683 ) ) ( not ( = ?auto_176685 ?auto_176686 ) ) ( not ( = ?auto_176684 ?auto_176686 ) ) ( not ( = ?auto_176682 ?auto_176686 ) ) ( not ( = ?auto_176683 ?auto_176686 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176685 ?auto_176684 ?auto_176682 ?auto_176686 ?auto_176683 ?auto_176681 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176725 - OBJ
      ?auto_176726 - OBJ
      ?auto_176727 - OBJ
      ?auto_176728 - OBJ
      ?auto_176729 - OBJ
      ?auto_176724 - LOCATION
    )
    :vars
    (
      ?auto_176730 - LOCATION
      ?auto_176731 - CITY
      ?auto_176733 - LOCATION
      ?auto_176732 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176730 ?auto_176731 ) ( IN-CITY ?auto_176724 ?auto_176731 ) ( not ( = ?auto_176724 ?auto_176730 ) ) ( OBJ-AT ?auto_176728 ?auto_176730 ) ( IN-CITY ?auto_176733 ?auto_176731 ) ( not ( = ?auto_176724 ?auto_176733 ) ) ( OBJ-AT ?auto_176726 ?auto_176733 ) ( OBJ-AT ?auto_176725 ?auto_176730 ) ( OBJ-AT ?auto_176727 ?auto_176733 ) ( OBJ-AT ?auto_176729 ?auto_176733 ) ( TRUCK-AT ?auto_176732 ?auto_176724 ) ( not ( = ?auto_176729 ?auto_176727 ) ) ( not ( = ?auto_176729 ?auto_176725 ) ) ( not ( = ?auto_176727 ?auto_176725 ) ) ( not ( = ?auto_176730 ?auto_176733 ) ) ( not ( = ?auto_176729 ?auto_176726 ) ) ( not ( = ?auto_176727 ?auto_176726 ) ) ( not ( = ?auto_176725 ?auto_176726 ) ) ( not ( = ?auto_176729 ?auto_176728 ) ) ( not ( = ?auto_176727 ?auto_176728 ) ) ( not ( = ?auto_176725 ?auto_176728 ) ) ( not ( = ?auto_176726 ?auto_176728 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176729 ?auto_176727 ?auto_176725 ?auto_176728 ?auto_176726 ?auto_176724 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176998 - OBJ
      ?auto_176999 - OBJ
      ?auto_177000 - OBJ
      ?auto_177001 - OBJ
      ?auto_177002 - OBJ
      ?auto_176997 - LOCATION
    )
    :vars
    (
      ?auto_177003 - LOCATION
      ?auto_177004 - CITY
      ?auto_177006 - LOCATION
      ?auto_177005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177003 ?auto_177004 ) ( IN-CITY ?auto_176997 ?auto_177004 ) ( not ( = ?auto_176997 ?auto_177003 ) ) ( OBJ-AT ?auto_177000 ?auto_177003 ) ( IN-CITY ?auto_177006 ?auto_177004 ) ( not ( = ?auto_176997 ?auto_177006 ) ) ( OBJ-AT ?auto_176999 ?auto_177006 ) ( OBJ-AT ?auto_176998 ?auto_177003 ) ( OBJ-AT ?auto_177002 ?auto_177006 ) ( OBJ-AT ?auto_177001 ?auto_177006 ) ( TRUCK-AT ?auto_177005 ?auto_176997 ) ( not ( = ?auto_177001 ?auto_177002 ) ) ( not ( = ?auto_177001 ?auto_176998 ) ) ( not ( = ?auto_177002 ?auto_176998 ) ) ( not ( = ?auto_177003 ?auto_177006 ) ) ( not ( = ?auto_177001 ?auto_176999 ) ) ( not ( = ?auto_177002 ?auto_176999 ) ) ( not ( = ?auto_176998 ?auto_176999 ) ) ( not ( = ?auto_177001 ?auto_177000 ) ) ( not ( = ?auto_177002 ?auto_177000 ) ) ( not ( = ?auto_176998 ?auto_177000 ) ) ( not ( = ?auto_176999 ?auto_177000 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177001 ?auto_177002 ?auto_176998 ?auto_177000 ?auto_176999 ?auto_176997 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177041 - OBJ
      ?auto_177042 - OBJ
      ?auto_177043 - OBJ
      ?auto_177044 - OBJ
      ?auto_177045 - OBJ
      ?auto_177040 - LOCATION
    )
    :vars
    (
      ?auto_177046 - LOCATION
      ?auto_177047 - CITY
      ?auto_177049 - LOCATION
      ?auto_177048 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177046 ?auto_177047 ) ( IN-CITY ?auto_177040 ?auto_177047 ) ( not ( = ?auto_177040 ?auto_177046 ) ) ( OBJ-AT ?auto_177043 ?auto_177046 ) ( IN-CITY ?auto_177049 ?auto_177047 ) ( not ( = ?auto_177040 ?auto_177049 ) ) ( OBJ-AT ?auto_177042 ?auto_177049 ) ( OBJ-AT ?auto_177041 ?auto_177046 ) ( OBJ-AT ?auto_177044 ?auto_177049 ) ( OBJ-AT ?auto_177045 ?auto_177049 ) ( TRUCK-AT ?auto_177048 ?auto_177040 ) ( not ( = ?auto_177045 ?auto_177044 ) ) ( not ( = ?auto_177045 ?auto_177041 ) ) ( not ( = ?auto_177044 ?auto_177041 ) ) ( not ( = ?auto_177046 ?auto_177049 ) ) ( not ( = ?auto_177045 ?auto_177042 ) ) ( not ( = ?auto_177044 ?auto_177042 ) ) ( not ( = ?auto_177041 ?auto_177042 ) ) ( not ( = ?auto_177045 ?auto_177043 ) ) ( not ( = ?auto_177044 ?auto_177043 ) ) ( not ( = ?auto_177041 ?auto_177043 ) ) ( not ( = ?auto_177042 ?auto_177043 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177045 ?auto_177044 ?auto_177041 ?auto_177043 ?auto_177042 ?auto_177040 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177360 - OBJ
      ?auto_177361 - OBJ
      ?auto_177362 - OBJ
      ?auto_177363 - OBJ
      ?auto_177364 - OBJ
      ?auto_177359 - LOCATION
    )
    :vars
    (
      ?auto_177365 - LOCATION
      ?auto_177366 - CITY
      ?auto_177368 - LOCATION
      ?auto_177367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177365 ?auto_177366 ) ( IN-CITY ?auto_177359 ?auto_177366 ) ( not ( = ?auto_177359 ?auto_177365 ) ) ( OBJ-AT ?auto_177361 ?auto_177365 ) ( IN-CITY ?auto_177368 ?auto_177366 ) ( not ( = ?auto_177359 ?auto_177368 ) ) ( OBJ-AT ?auto_177364 ?auto_177368 ) ( OBJ-AT ?auto_177360 ?auto_177365 ) ( OBJ-AT ?auto_177363 ?auto_177368 ) ( OBJ-AT ?auto_177362 ?auto_177368 ) ( TRUCK-AT ?auto_177367 ?auto_177359 ) ( not ( = ?auto_177362 ?auto_177363 ) ) ( not ( = ?auto_177362 ?auto_177360 ) ) ( not ( = ?auto_177363 ?auto_177360 ) ) ( not ( = ?auto_177365 ?auto_177368 ) ) ( not ( = ?auto_177362 ?auto_177364 ) ) ( not ( = ?auto_177363 ?auto_177364 ) ) ( not ( = ?auto_177360 ?auto_177364 ) ) ( not ( = ?auto_177362 ?auto_177361 ) ) ( not ( = ?auto_177363 ?auto_177361 ) ) ( not ( = ?auto_177360 ?auto_177361 ) ) ( not ( = ?auto_177364 ?auto_177361 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177362 ?auto_177363 ?auto_177360 ?auto_177361 ?auto_177364 ?auto_177359 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177450 - OBJ
      ?auto_177451 - OBJ
      ?auto_177452 - OBJ
      ?auto_177453 - OBJ
      ?auto_177454 - OBJ
      ?auto_177449 - LOCATION
    )
    :vars
    (
      ?auto_177455 - LOCATION
      ?auto_177456 - CITY
      ?auto_177458 - LOCATION
      ?auto_177457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177455 ?auto_177456 ) ( IN-CITY ?auto_177449 ?auto_177456 ) ( not ( = ?auto_177449 ?auto_177455 ) ) ( OBJ-AT ?auto_177451 ?auto_177455 ) ( IN-CITY ?auto_177458 ?auto_177456 ) ( not ( = ?auto_177449 ?auto_177458 ) ) ( OBJ-AT ?auto_177453 ?auto_177458 ) ( OBJ-AT ?auto_177450 ?auto_177455 ) ( OBJ-AT ?auto_177454 ?auto_177458 ) ( OBJ-AT ?auto_177452 ?auto_177458 ) ( TRUCK-AT ?auto_177457 ?auto_177449 ) ( not ( = ?auto_177452 ?auto_177454 ) ) ( not ( = ?auto_177452 ?auto_177450 ) ) ( not ( = ?auto_177454 ?auto_177450 ) ) ( not ( = ?auto_177455 ?auto_177458 ) ) ( not ( = ?auto_177452 ?auto_177453 ) ) ( not ( = ?auto_177454 ?auto_177453 ) ) ( not ( = ?auto_177450 ?auto_177453 ) ) ( not ( = ?auto_177452 ?auto_177451 ) ) ( not ( = ?auto_177454 ?auto_177451 ) ) ( not ( = ?auto_177450 ?auto_177451 ) ) ( not ( = ?auto_177453 ?auto_177451 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177452 ?auto_177454 ?auto_177450 ?auto_177451 ?auto_177453 ?auto_177449 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177584 - OBJ
      ?auto_177585 - OBJ
      ?auto_177586 - OBJ
      ?auto_177587 - OBJ
      ?auto_177588 - OBJ
      ?auto_177583 - LOCATION
    )
    :vars
    (
      ?auto_177589 - LOCATION
      ?auto_177590 - CITY
      ?auto_177592 - LOCATION
      ?auto_177591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177589 ?auto_177590 ) ( IN-CITY ?auto_177583 ?auto_177590 ) ( not ( = ?auto_177583 ?auto_177589 ) ) ( OBJ-AT ?auto_177585 ?auto_177589 ) ( IN-CITY ?auto_177592 ?auto_177590 ) ( not ( = ?auto_177583 ?auto_177592 ) ) ( OBJ-AT ?auto_177588 ?auto_177592 ) ( OBJ-AT ?auto_177584 ?auto_177589 ) ( OBJ-AT ?auto_177586 ?auto_177592 ) ( OBJ-AT ?auto_177587 ?auto_177592 ) ( TRUCK-AT ?auto_177591 ?auto_177583 ) ( not ( = ?auto_177587 ?auto_177586 ) ) ( not ( = ?auto_177587 ?auto_177584 ) ) ( not ( = ?auto_177586 ?auto_177584 ) ) ( not ( = ?auto_177589 ?auto_177592 ) ) ( not ( = ?auto_177587 ?auto_177588 ) ) ( not ( = ?auto_177586 ?auto_177588 ) ) ( not ( = ?auto_177584 ?auto_177588 ) ) ( not ( = ?auto_177587 ?auto_177585 ) ) ( not ( = ?auto_177586 ?auto_177585 ) ) ( not ( = ?auto_177584 ?auto_177585 ) ) ( not ( = ?auto_177588 ?auto_177585 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177587 ?auto_177586 ?auto_177584 ?auto_177585 ?auto_177588 ?auto_177583 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177721 - OBJ
      ?auto_177722 - OBJ
      ?auto_177723 - OBJ
      ?auto_177724 - OBJ
      ?auto_177725 - OBJ
      ?auto_177720 - LOCATION
    )
    :vars
    (
      ?auto_177726 - LOCATION
      ?auto_177727 - CITY
      ?auto_177729 - LOCATION
      ?auto_177728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177726 ?auto_177727 ) ( IN-CITY ?auto_177720 ?auto_177727 ) ( not ( = ?auto_177720 ?auto_177726 ) ) ( OBJ-AT ?auto_177722 ?auto_177726 ) ( IN-CITY ?auto_177729 ?auto_177727 ) ( not ( = ?auto_177720 ?auto_177729 ) ) ( OBJ-AT ?auto_177724 ?auto_177729 ) ( OBJ-AT ?auto_177721 ?auto_177726 ) ( OBJ-AT ?auto_177723 ?auto_177729 ) ( OBJ-AT ?auto_177725 ?auto_177729 ) ( TRUCK-AT ?auto_177728 ?auto_177720 ) ( not ( = ?auto_177725 ?auto_177723 ) ) ( not ( = ?auto_177725 ?auto_177721 ) ) ( not ( = ?auto_177723 ?auto_177721 ) ) ( not ( = ?auto_177726 ?auto_177729 ) ) ( not ( = ?auto_177725 ?auto_177724 ) ) ( not ( = ?auto_177723 ?auto_177724 ) ) ( not ( = ?auto_177721 ?auto_177724 ) ) ( not ( = ?auto_177725 ?auto_177722 ) ) ( not ( = ?auto_177723 ?auto_177722 ) ) ( not ( = ?auto_177721 ?auto_177722 ) ) ( not ( = ?auto_177724 ?auto_177722 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177725 ?auto_177723 ?auto_177721 ?auto_177722 ?auto_177724 ?auto_177720 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178142 - OBJ
      ?auto_178143 - OBJ
      ?auto_178144 - OBJ
      ?auto_178145 - OBJ
      ?auto_178146 - OBJ
      ?auto_178141 - LOCATION
    )
    :vars
    (
      ?auto_178147 - LOCATION
      ?auto_178148 - CITY
      ?auto_178150 - LOCATION
      ?auto_178149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178147 ?auto_178148 ) ( IN-CITY ?auto_178141 ?auto_178148 ) ( not ( = ?auto_178141 ?auto_178147 ) ) ( OBJ-AT ?auto_178143 ?auto_178147 ) ( IN-CITY ?auto_178150 ?auto_178148 ) ( not ( = ?auto_178141 ?auto_178150 ) ) ( OBJ-AT ?auto_178144 ?auto_178150 ) ( OBJ-AT ?auto_178142 ?auto_178147 ) ( OBJ-AT ?auto_178146 ?auto_178150 ) ( OBJ-AT ?auto_178145 ?auto_178150 ) ( TRUCK-AT ?auto_178149 ?auto_178141 ) ( not ( = ?auto_178145 ?auto_178146 ) ) ( not ( = ?auto_178145 ?auto_178142 ) ) ( not ( = ?auto_178146 ?auto_178142 ) ) ( not ( = ?auto_178147 ?auto_178150 ) ) ( not ( = ?auto_178145 ?auto_178144 ) ) ( not ( = ?auto_178146 ?auto_178144 ) ) ( not ( = ?auto_178142 ?auto_178144 ) ) ( not ( = ?auto_178145 ?auto_178143 ) ) ( not ( = ?auto_178146 ?auto_178143 ) ) ( not ( = ?auto_178142 ?auto_178143 ) ) ( not ( = ?auto_178144 ?auto_178143 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178145 ?auto_178146 ?auto_178142 ?auto_178143 ?auto_178144 ?auto_178141 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178185 - OBJ
      ?auto_178186 - OBJ
      ?auto_178187 - OBJ
      ?auto_178188 - OBJ
      ?auto_178189 - OBJ
      ?auto_178184 - LOCATION
    )
    :vars
    (
      ?auto_178190 - LOCATION
      ?auto_178191 - CITY
      ?auto_178193 - LOCATION
      ?auto_178192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178190 ?auto_178191 ) ( IN-CITY ?auto_178184 ?auto_178191 ) ( not ( = ?auto_178184 ?auto_178190 ) ) ( OBJ-AT ?auto_178186 ?auto_178190 ) ( IN-CITY ?auto_178193 ?auto_178191 ) ( not ( = ?auto_178184 ?auto_178193 ) ) ( OBJ-AT ?auto_178187 ?auto_178193 ) ( OBJ-AT ?auto_178185 ?auto_178190 ) ( OBJ-AT ?auto_178188 ?auto_178193 ) ( OBJ-AT ?auto_178189 ?auto_178193 ) ( TRUCK-AT ?auto_178192 ?auto_178184 ) ( not ( = ?auto_178189 ?auto_178188 ) ) ( not ( = ?auto_178189 ?auto_178185 ) ) ( not ( = ?auto_178188 ?auto_178185 ) ) ( not ( = ?auto_178190 ?auto_178193 ) ) ( not ( = ?auto_178189 ?auto_178187 ) ) ( not ( = ?auto_178188 ?auto_178187 ) ) ( not ( = ?auto_178185 ?auto_178187 ) ) ( not ( = ?auto_178189 ?auto_178186 ) ) ( not ( = ?auto_178188 ?auto_178186 ) ) ( not ( = ?auto_178185 ?auto_178186 ) ) ( not ( = ?auto_178187 ?auto_178186 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178189 ?auto_178188 ?auto_178185 ?auto_178186 ?auto_178187 ?auto_178184 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178837 - OBJ
      ?auto_178838 - OBJ
      ?auto_178839 - OBJ
      ?auto_178840 - OBJ
      ?auto_178841 - OBJ
      ?auto_178836 - LOCATION
    )
    :vars
    (
      ?auto_178842 - LOCATION
      ?auto_178843 - CITY
      ?auto_178845 - LOCATION
      ?auto_178844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178842 ?auto_178843 ) ( IN-CITY ?auto_178836 ?auto_178843 ) ( not ( = ?auto_178836 ?auto_178842 ) ) ( OBJ-AT ?auto_178841 ?auto_178842 ) ( IN-CITY ?auto_178845 ?auto_178843 ) ( not ( = ?auto_178836 ?auto_178845 ) ) ( OBJ-AT ?auto_178837 ?auto_178845 ) ( OBJ-AT ?auto_178840 ?auto_178842 ) ( OBJ-AT ?auto_178839 ?auto_178845 ) ( OBJ-AT ?auto_178838 ?auto_178845 ) ( TRUCK-AT ?auto_178844 ?auto_178836 ) ( not ( = ?auto_178838 ?auto_178839 ) ) ( not ( = ?auto_178838 ?auto_178840 ) ) ( not ( = ?auto_178839 ?auto_178840 ) ) ( not ( = ?auto_178842 ?auto_178845 ) ) ( not ( = ?auto_178838 ?auto_178837 ) ) ( not ( = ?auto_178839 ?auto_178837 ) ) ( not ( = ?auto_178840 ?auto_178837 ) ) ( not ( = ?auto_178838 ?auto_178841 ) ) ( not ( = ?auto_178839 ?auto_178841 ) ) ( not ( = ?auto_178840 ?auto_178841 ) ) ( not ( = ?auto_178837 ?auto_178841 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178838 ?auto_178839 ?auto_178840 ?auto_178841 ?auto_178837 ?auto_178836 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178880 - OBJ
      ?auto_178881 - OBJ
      ?auto_178882 - OBJ
      ?auto_178883 - OBJ
      ?auto_178884 - OBJ
      ?auto_178879 - LOCATION
    )
    :vars
    (
      ?auto_178885 - LOCATION
      ?auto_178886 - CITY
      ?auto_178888 - LOCATION
      ?auto_178887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178885 ?auto_178886 ) ( IN-CITY ?auto_178879 ?auto_178886 ) ( not ( = ?auto_178879 ?auto_178885 ) ) ( OBJ-AT ?auto_178883 ?auto_178885 ) ( IN-CITY ?auto_178888 ?auto_178886 ) ( not ( = ?auto_178879 ?auto_178888 ) ) ( OBJ-AT ?auto_178880 ?auto_178888 ) ( OBJ-AT ?auto_178884 ?auto_178885 ) ( OBJ-AT ?auto_178882 ?auto_178888 ) ( OBJ-AT ?auto_178881 ?auto_178888 ) ( TRUCK-AT ?auto_178887 ?auto_178879 ) ( not ( = ?auto_178881 ?auto_178882 ) ) ( not ( = ?auto_178881 ?auto_178884 ) ) ( not ( = ?auto_178882 ?auto_178884 ) ) ( not ( = ?auto_178885 ?auto_178888 ) ) ( not ( = ?auto_178881 ?auto_178880 ) ) ( not ( = ?auto_178882 ?auto_178880 ) ) ( not ( = ?auto_178884 ?auto_178880 ) ) ( not ( = ?auto_178881 ?auto_178883 ) ) ( not ( = ?auto_178882 ?auto_178883 ) ) ( not ( = ?auto_178884 ?auto_178883 ) ) ( not ( = ?auto_178880 ?auto_178883 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178881 ?auto_178882 ?auto_178884 ?auto_178883 ?auto_178880 ?auto_178879 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178923 - OBJ
      ?auto_178924 - OBJ
      ?auto_178925 - OBJ
      ?auto_178926 - OBJ
      ?auto_178927 - OBJ
      ?auto_178922 - LOCATION
    )
    :vars
    (
      ?auto_178928 - LOCATION
      ?auto_178929 - CITY
      ?auto_178931 - LOCATION
      ?auto_178930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178928 ?auto_178929 ) ( IN-CITY ?auto_178922 ?auto_178929 ) ( not ( = ?auto_178922 ?auto_178928 ) ) ( OBJ-AT ?auto_178927 ?auto_178928 ) ( IN-CITY ?auto_178931 ?auto_178929 ) ( not ( = ?auto_178922 ?auto_178931 ) ) ( OBJ-AT ?auto_178923 ?auto_178931 ) ( OBJ-AT ?auto_178925 ?auto_178928 ) ( OBJ-AT ?auto_178926 ?auto_178931 ) ( OBJ-AT ?auto_178924 ?auto_178931 ) ( TRUCK-AT ?auto_178930 ?auto_178922 ) ( not ( = ?auto_178924 ?auto_178926 ) ) ( not ( = ?auto_178924 ?auto_178925 ) ) ( not ( = ?auto_178926 ?auto_178925 ) ) ( not ( = ?auto_178928 ?auto_178931 ) ) ( not ( = ?auto_178924 ?auto_178923 ) ) ( not ( = ?auto_178926 ?auto_178923 ) ) ( not ( = ?auto_178925 ?auto_178923 ) ) ( not ( = ?auto_178924 ?auto_178927 ) ) ( not ( = ?auto_178926 ?auto_178927 ) ) ( not ( = ?auto_178925 ?auto_178927 ) ) ( not ( = ?auto_178923 ?auto_178927 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178924 ?auto_178926 ?auto_178925 ?auto_178927 ?auto_178923 ?auto_178922 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178966 - OBJ
      ?auto_178967 - OBJ
      ?auto_178968 - OBJ
      ?auto_178969 - OBJ
      ?auto_178970 - OBJ
      ?auto_178965 - LOCATION
    )
    :vars
    (
      ?auto_178971 - LOCATION
      ?auto_178972 - CITY
      ?auto_178974 - LOCATION
      ?auto_178973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178971 ?auto_178972 ) ( IN-CITY ?auto_178965 ?auto_178972 ) ( not ( = ?auto_178965 ?auto_178971 ) ) ( OBJ-AT ?auto_178969 ?auto_178971 ) ( IN-CITY ?auto_178974 ?auto_178972 ) ( not ( = ?auto_178965 ?auto_178974 ) ) ( OBJ-AT ?auto_178966 ?auto_178974 ) ( OBJ-AT ?auto_178968 ?auto_178971 ) ( OBJ-AT ?auto_178970 ?auto_178974 ) ( OBJ-AT ?auto_178967 ?auto_178974 ) ( TRUCK-AT ?auto_178973 ?auto_178965 ) ( not ( = ?auto_178967 ?auto_178970 ) ) ( not ( = ?auto_178967 ?auto_178968 ) ) ( not ( = ?auto_178970 ?auto_178968 ) ) ( not ( = ?auto_178971 ?auto_178974 ) ) ( not ( = ?auto_178967 ?auto_178966 ) ) ( not ( = ?auto_178970 ?auto_178966 ) ) ( not ( = ?auto_178968 ?auto_178966 ) ) ( not ( = ?auto_178967 ?auto_178969 ) ) ( not ( = ?auto_178970 ?auto_178969 ) ) ( not ( = ?auto_178968 ?auto_178969 ) ) ( not ( = ?auto_178966 ?auto_178969 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178967 ?auto_178970 ?auto_178968 ?auto_178969 ?auto_178966 ?auto_178965 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179193 - OBJ
      ?auto_179194 - OBJ
      ?auto_179195 - OBJ
      ?auto_179196 - OBJ
      ?auto_179197 - OBJ
      ?auto_179192 - LOCATION
    )
    :vars
    (
      ?auto_179198 - LOCATION
      ?auto_179199 - CITY
      ?auto_179201 - LOCATION
      ?auto_179200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179198 ?auto_179199 ) ( IN-CITY ?auto_179192 ?auto_179199 ) ( not ( = ?auto_179192 ?auto_179198 ) ) ( OBJ-AT ?auto_179195 ?auto_179198 ) ( IN-CITY ?auto_179201 ?auto_179199 ) ( not ( = ?auto_179192 ?auto_179201 ) ) ( OBJ-AT ?auto_179193 ?auto_179201 ) ( OBJ-AT ?auto_179197 ?auto_179198 ) ( OBJ-AT ?auto_179196 ?auto_179201 ) ( OBJ-AT ?auto_179194 ?auto_179201 ) ( TRUCK-AT ?auto_179200 ?auto_179192 ) ( not ( = ?auto_179194 ?auto_179196 ) ) ( not ( = ?auto_179194 ?auto_179197 ) ) ( not ( = ?auto_179196 ?auto_179197 ) ) ( not ( = ?auto_179198 ?auto_179201 ) ) ( not ( = ?auto_179194 ?auto_179193 ) ) ( not ( = ?auto_179196 ?auto_179193 ) ) ( not ( = ?auto_179197 ?auto_179193 ) ) ( not ( = ?auto_179194 ?auto_179195 ) ) ( not ( = ?auto_179196 ?auto_179195 ) ) ( not ( = ?auto_179197 ?auto_179195 ) ) ( not ( = ?auto_179193 ?auto_179195 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179194 ?auto_179196 ?auto_179197 ?auto_179195 ?auto_179193 ?auto_179192 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179236 - OBJ
      ?auto_179237 - OBJ
      ?auto_179238 - OBJ
      ?auto_179239 - OBJ
      ?auto_179240 - OBJ
      ?auto_179235 - LOCATION
    )
    :vars
    (
      ?auto_179241 - LOCATION
      ?auto_179242 - CITY
      ?auto_179244 - LOCATION
      ?auto_179243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179241 ?auto_179242 ) ( IN-CITY ?auto_179235 ?auto_179242 ) ( not ( = ?auto_179235 ?auto_179241 ) ) ( OBJ-AT ?auto_179238 ?auto_179241 ) ( IN-CITY ?auto_179244 ?auto_179242 ) ( not ( = ?auto_179235 ?auto_179244 ) ) ( OBJ-AT ?auto_179236 ?auto_179244 ) ( OBJ-AT ?auto_179239 ?auto_179241 ) ( OBJ-AT ?auto_179240 ?auto_179244 ) ( OBJ-AT ?auto_179237 ?auto_179244 ) ( TRUCK-AT ?auto_179243 ?auto_179235 ) ( not ( = ?auto_179237 ?auto_179240 ) ) ( not ( = ?auto_179237 ?auto_179239 ) ) ( not ( = ?auto_179240 ?auto_179239 ) ) ( not ( = ?auto_179241 ?auto_179244 ) ) ( not ( = ?auto_179237 ?auto_179236 ) ) ( not ( = ?auto_179240 ?auto_179236 ) ) ( not ( = ?auto_179239 ?auto_179236 ) ) ( not ( = ?auto_179237 ?auto_179238 ) ) ( not ( = ?auto_179240 ?auto_179238 ) ) ( not ( = ?auto_179239 ?auto_179238 ) ) ( not ( = ?auto_179236 ?auto_179238 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179237 ?auto_179240 ?auto_179239 ?auto_179238 ?auto_179236 ?auto_179235 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179417 - OBJ
      ?auto_179418 - OBJ
      ?auto_179419 - OBJ
      ?auto_179420 - OBJ
      ?auto_179421 - OBJ
      ?auto_179416 - LOCATION
    )
    :vars
    (
      ?auto_179422 - LOCATION
      ?auto_179423 - CITY
      ?auto_179425 - LOCATION
      ?auto_179424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179422 ?auto_179423 ) ( IN-CITY ?auto_179416 ?auto_179423 ) ( not ( = ?auto_179416 ?auto_179422 ) ) ( OBJ-AT ?auto_179421 ?auto_179422 ) ( IN-CITY ?auto_179425 ?auto_179423 ) ( not ( = ?auto_179416 ?auto_179425 ) ) ( OBJ-AT ?auto_179417 ?auto_179425 ) ( OBJ-AT ?auto_179420 ?auto_179422 ) ( OBJ-AT ?auto_179418 ?auto_179425 ) ( OBJ-AT ?auto_179419 ?auto_179425 ) ( TRUCK-AT ?auto_179424 ?auto_179416 ) ( not ( = ?auto_179419 ?auto_179418 ) ) ( not ( = ?auto_179419 ?auto_179420 ) ) ( not ( = ?auto_179418 ?auto_179420 ) ) ( not ( = ?auto_179422 ?auto_179425 ) ) ( not ( = ?auto_179419 ?auto_179417 ) ) ( not ( = ?auto_179418 ?auto_179417 ) ) ( not ( = ?auto_179420 ?auto_179417 ) ) ( not ( = ?auto_179419 ?auto_179421 ) ) ( not ( = ?auto_179418 ?auto_179421 ) ) ( not ( = ?auto_179420 ?auto_179421 ) ) ( not ( = ?auto_179417 ?auto_179421 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179419 ?auto_179418 ?auto_179420 ?auto_179421 ?auto_179417 ?auto_179416 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179460 - OBJ
      ?auto_179461 - OBJ
      ?auto_179462 - OBJ
      ?auto_179463 - OBJ
      ?auto_179464 - OBJ
      ?auto_179459 - LOCATION
    )
    :vars
    (
      ?auto_179465 - LOCATION
      ?auto_179466 - CITY
      ?auto_179468 - LOCATION
      ?auto_179467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179465 ?auto_179466 ) ( IN-CITY ?auto_179459 ?auto_179466 ) ( not ( = ?auto_179459 ?auto_179465 ) ) ( OBJ-AT ?auto_179463 ?auto_179465 ) ( IN-CITY ?auto_179468 ?auto_179466 ) ( not ( = ?auto_179459 ?auto_179468 ) ) ( OBJ-AT ?auto_179460 ?auto_179468 ) ( OBJ-AT ?auto_179464 ?auto_179465 ) ( OBJ-AT ?auto_179461 ?auto_179468 ) ( OBJ-AT ?auto_179462 ?auto_179468 ) ( TRUCK-AT ?auto_179467 ?auto_179459 ) ( not ( = ?auto_179462 ?auto_179461 ) ) ( not ( = ?auto_179462 ?auto_179464 ) ) ( not ( = ?auto_179461 ?auto_179464 ) ) ( not ( = ?auto_179465 ?auto_179468 ) ) ( not ( = ?auto_179462 ?auto_179460 ) ) ( not ( = ?auto_179461 ?auto_179460 ) ) ( not ( = ?auto_179464 ?auto_179460 ) ) ( not ( = ?auto_179462 ?auto_179463 ) ) ( not ( = ?auto_179461 ?auto_179463 ) ) ( not ( = ?auto_179464 ?auto_179463 ) ) ( not ( = ?auto_179460 ?auto_179463 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179462 ?auto_179461 ?auto_179464 ?auto_179463 ?auto_179460 ?auto_179459 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179596 - OBJ
      ?auto_179597 - OBJ
      ?auto_179598 - OBJ
      ?auto_179599 - OBJ
      ?auto_179600 - OBJ
      ?auto_179595 - LOCATION
    )
    :vars
    (
      ?auto_179601 - LOCATION
      ?auto_179602 - CITY
      ?auto_179604 - LOCATION
      ?auto_179603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179601 ?auto_179602 ) ( IN-CITY ?auto_179595 ?auto_179602 ) ( not ( = ?auto_179595 ?auto_179601 ) ) ( OBJ-AT ?auto_179600 ?auto_179601 ) ( IN-CITY ?auto_179604 ?auto_179602 ) ( not ( = ?auto_179595 ?auto_179604 ) ) ( OBJ-AT ?auto_179596 ?auto_179604 ) ( OBJ-AT ?auto_179598 ?auto_179601 ) ( OBJ-AT ?auto_179597 ?auto_179604 ) ( OBJ-AT ?auto_179599 ?auto_179604 ) ( TRUCK-AT ?auto_179603 ?auto_179595 ) ( not ( = ?auto_179599 ?auto_179597 ) ) ( not ( = ?auto_179599 ?auto_179598 ) ) ( not ( = ?auto_179597 ?auto_179598 ) ) ( not ( = ?auto_179601 ?auto_179604 ) ) ( not ( = ?auto_179599 ?auto_179596 ) ) ( not ( = ?auto_179597 ?auto_179596 ) ) ( not ( = ?auto_179598 ?auto_179596 ) ) ( not ( = ?auto_179599 ?auto_179600 ) ) ( not ( = ?auto_179597 ?auto_179600 ) ) ( not ( = ?auto_179598 ?auto_179600 ) ) ( not ( = ?auto_179596 ?auto_179600 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179599 ?auto_179597 ?auto_179598 ?auto_179600 ?auto_179596 ?auto_179595 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179639 - OBJ
      ?auto_179640 - OBJ
      ?auto_179641 - OBJ
      ?auto_179642 - OBJ
      ?auto_179643 - OBJ
      ?auto_179638 - LOCATION
    )
    :vars
    (
      ?auto_179644 - LOCATION
      ?auto_179645 - CITY
      ?auto_179647 - LOCATION
      ?auto_179646 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179644 ?auto_179645 ) ( IN-CITY ?auto_179638 ?auto_179645 ) ( not ( = ?auto_179638 ?auto_179644 ) ) ( OBJ-AT ?auto_179642 ?auto_179644 ) ( IN-CITY ?auto_179647 ?auto_179645 ) ( not ( = ?auto_179638 ?auto_179647 ) ) ( OBJ-AT ?auto_179639 ?auto_179647 ) ( OBJ-AT ?auto_179641 ?auto_179644 ) ( OBJ-AT ?auto_179640 ?auto_179647 ) ( OBJ-AT ?auto_179643 ?auto_179647 ) ( TRUCK-AT ?auto_179646 ?auto_179638 ) ( not ( = ?auto_179643 ?auto_179640 ) ) ( not ( = ?auto_179643 ?auto_179641 ) ) ( not ( = ?auto_179640 ?auto_179641 ) ) ( not ( = ?auto_179644 ?auto_179647 ) ) ( not ( = ?auto_179643 ?auto_179639 ) ) ( not ( = ?auto_179640 ?auto_179639 ) ) ( not ( = ?auto_179641 ?auto_179639 ) ) ( not ( = ?auto_179643 ?auto_179642 ) ) ( not ( = ?auto_179640 ?auto_179642 ) ) ( not ( = ?auto_179641 ?auto_179642 ) ) ( not ( = ?auto_179639 ?auto_179642 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179643 ?auto_179640 ?auto_179641 ?auto_179642 ?auto_179639 ?auto_179638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179819 - OBJ
      ?auto_179820 - OBJ
      ?auto_179821 - OBJ
      ?auto_179822 - OBJ
      ?auto_179823 - OBJ
      ?auto_179818 - LOCATION
    )
    :vars
    (
      ?auto_179824 - LOCATION
      ?auto_179825 - CITY
      ?auto_179827 - LOCATION
      ?auto_179826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179824 ?auto_179825 ) ( IN-CITY ?auto_179818 ?auto_179825 ) ( not ( = ?auto_179818 ?auto_179824 ) ) ( OBJ-AT ?auto_179821 ?auto_179824 ) ( IN-CITY ?auto_179827 ?auto_179825 ) ( not ( = ?auto_179818 ?auto_179827 ) ) ( OBJ-AT ?auto_179819 ?auto_179827 ) ( OBJ-AT ?auto_179823 ?auto_179824 ) ( OBJ-AT ?auto_179820 ?auto_179827 ) ( OBJ-AT ?auto_179822 ?auto_179827 ) ( TRUCK-AT ?auto_179826 ?auto_179818 ) ( not ( = ?auto_179822 ?auto_179820 ) ) ( not ( = ?auto_179822 ?auto_179823 ) ) ( not ( = ?auto_179820 ?auto_179823 ) ) ( not ( = ?auto_179824 ?auto_179827 ) ) ( not ( = ?auto_179822 ?auto_179819 ) ) ( not ( = ?auto_179820 ?auto_179819 ) ) ( not ( = ?auto_179823 ?auto_179819 ) ) ( not ( = ?auto_179822 ?auto_179821 ) ) ( not ( = ?auto_179820 ?auto_179821 ) ) ( not ( = ?auto_179823 ?auto_179821 ) ) ( not ( = ?auto_179819 ?auto_179821 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179822 ?auto_179820 ?auto_179823 ?auto_179821 ?auto_179819 ?auto_179818 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179909 - OBJ
      ?auto_179910 - OBJ
      ?auto_179911 - OBJ
      ?auto_179912 - OBJ
      ?auto_179913 - OBJ
      ?auto_179908 - LOCATION
    )
    :vars
    (
      ?auto_179914 - LOCATION
      ?auto_179915 - CITY
      ?auto_179917 - LOCATION
      ?auto_179916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179914 ?auto_179915 ) ( IN-CITY ?auto_179908 ?auto_179915 ) ( not ( = ?auto_179908 ?auto_179914 ) ) ( OBJ-AT ?auto_179911 ?auto_179914 ) ( IN-CITY ?auto_179917 ?auto_179915 ) ( not ( = ?auto_179908 ?auto_179917 ) ) ( OBJ-AT ?auto_179909 ?auto_179917 ) ( OBJ-AT ?auto_179912 ?auto_179914 ) ( OBJ-AT ?auto_179910 ?auto_179917 ) ( OBJ-AT ?auto_179913 ?auto_179917 ) ( TRUCK-AT ?auto_179916 ?auto_179908 ) ( not ( = ?auto_179913 ?auto_179910 ) ) ( not ( = ?auto_179913 ?auto_179912 ) ) ( not ( = ?auto_179910 ?auto_179912 ) ) ( not ( = ?auto_179914 ?auto_179917 ) ) ( not ( = ?auto_179913 ?auto_179909 ) ) ( not ( = ?auto_179910 ?auto_179909 ) ) ( not ( = ?auto_179912 ?auto_179909 ) ) ( not ( = ?auto_179913 ?auto_179911 ) ) ( not ( = ?auto_179910 ?auto_179911 ) ) ( not ( = ?auto_179912 ?auto_179911 ) ) ( not ( = ?auto_179909 ?auto_179911 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179913 ?auto_179910 ?auto_179912 ?auto_179911 ?auto_179909 ?auto_179908 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180090 - OBJ
      ?auto_180091 - OBJ
      ?auto_180092 - OBJ
      ?auto_180093 - OBJ
      ?auto_180094 - OBJ
      ?auto_180089 - LOCATION
    )
    :vars
    (
      ?auto_180095 - LOCATION
      ?auto_180096 - CITY
      ?auto_180098 - LOCATION
      ?auto_180097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180095 ?auto_180096 ) ( IN-CITY ?auto_180089 ?auto_180096 ) ( not ( = ?auto_180089 ?auto_180095 ) ) ( OBJ-AT ?auto_180094 ?auto_180095 ) ( IN-CITY ?auto_180098 ?auto_180096 ) ( not ( = ?auto_180089 ?auto_180098 ) ) ( OBJ-AT ?auto_180090 ?auto_180098 ) ( OBJ-AT ?auto_180091 ?auto_180095 ) ( OBJ-AT ?auto_180093 ?auto_180098 ) ( OBJ-AT ?auto_180092 ?auto_180098 ) ( TRUCK-AT ?auto_180097 ?auto_180089 ) ( not ( = ?auto_180092 ?auto_180093 ) ) ( not ( = ?auto_180092 ?auto_180091 ) ) ( not ( = ?auto_180093 ?auto_180091 ) ) ( not ( = ?auto_180095 ?auto_180098 ) ) ( not ( = ?auto_180092 ?auto_180090 ) ) ( not ( = ?auto_180093 ?auto_180090 ) ) ( not ( = ?auto_180091 ?auto_180090 ) ) ( not ( = ?auto_180092 ?auto_180094 ) ) ( not ( = ?auto_180093 ?auto_180094 ) ) ( not ( = ?auto_180091 ?auto_180094 ) ) ( not ( = ?auto_180090 ?auto_180094 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180092 ?auto_180093 ?auto_180091 ?auto_180094 ?auto_180090 ?auto_180089 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180133 - OBJ
      ?auto_180134 - OBJ
      ?auto_180135 - OBJ
      ?auto_180136 - OBJ
      ?auto_180137 - OBJ
      ?auto_180132 - LOCATION
    )
    :vars
    (
      ?auto_180138 - LOCATION
      ?auto_180139 - CITY
      ?auto_180141 - LOCATION
      ?auto_180140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180138 ?auto_180139 ) ( IN-CITY ?auto_180132 ?auto_180139 ) ( not ( = ?auto_180132 ?auto_180138 ) ) ( OBJ-AT ?auto_180136 ?auto_180138 ) ( IN-CITY ?auto_180141 ?auto_180139 ) ( not ( = ?auto_180132 ?auto_180141 ) ) ( OBJ-AT ?auto_180133 ?auto_180141 ) ( OBJ-AT ?auto_180134 ?auto_180138 ) ( OBJ-AT ?auto_180137 ?auto_180141 ) ( OBJ-AT ?auto_180135 ?auto_180141 ) ( TRUCK-AT ?auto_180140 ?auto_180132 ) ( not ( = ?auto_180135 ?auto_180137 ) ) ( not ( = ?auto_180135 ?auto_180134 ) ) ( not ( = ?auto_180137 ?auto_180134 ) ) ( not ( = ?auto_180138 ?auto_180141 ) ) ( not ( = ?auto_180135 ?auto_180133 ) ) ( not ( = ?auto_180137 ?auto_180133 ) ) ( not ( = ?auto_180134 ?auto_180133 ) ) ( not ( = ?auto_180135 ?auto_180136 ) ) ( not ( = ?auto_180137 ?auto_180136 ) ) ( not ( = ?auto_180134 ?auto_180136 ) ) ( not ( = ?auto_180133 ?auto_180136 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180135 ?auto_180137 ?auto_180134 ?auto_180136 ?auto_180133 ?auto_180132 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180176 - OBJ
      ?auto_180177 - OBJ
      ?auto_180178 - OBJ
      ?auto_180179 - OBJ
      ?auto_180180 - OBJ
      ?auto_180175 - LOCATION
    )
    :vars
    (
      ?auto_180181 - LOCATION
      ?auto_180182 - CITY
      ?auto_180184 - LOCATION
      ?auto_180183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180181 ?auto_180182 ) ( IN-CITY ?auto_180175 ?auto_180182 ) ( not ( = ?auto_180175 ?auto_180181 ) ) ( OBJ-AT ?auto_180180 ?auto_180181 ) ( IN-CITY ?auto_180184 ?auto_180182 ) ( not ( = ?auto_180175 ?auto_180184 ) ) ( OBJ-AT ?auto_180176 ?auto_180184 ) ( OBJ-AT ?auto_180177 ?auto_180181 ) ( OBJ-AT ?auto_180178 ?auto_180184 ) ( OBJ-AT ?auto_180179 ?auto_180184 ) ( TRUCK-AT ?auto_180183 ?auto_180175 ) ( not ( = ?auto_180179 ?auto_180178 ) ) ( not ( = ?auto_180179 ?auto_180177 ) ) ( not ( = ?auto_180178 ?auto_180177 ) ) ( not ( = ?auto_180181 ?auto_180184 ) ) ( not ( = ?auto_180179 ?auto_180176 ) ) ( not ( = ?auto_180178 ?auto_180176 ) ) ( not ( = ?auto_180177 ?auto_180176 ) ) ( not ( = ?auto_180179 ?auto_180180 ) ) ( not ( = ?auto_180178 ?auto_180180 ) ) ( not ( = ?auto_180177 ?auto_180180 ) ) ( not ( = ?auto_180176 ?auto_180180 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180179 ?auto_180178 ?auto_180177 ?auto_180180 ?auto_180176 ?auto_180175 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180219 - OBJ
      ?auto_180220 - OBJ
      ?auto_180221 - OBJ
      ?auto_180222 - OBJ
      ?auto_180223 - OBJ
      ?auto_180218 - LOCATION
    )
    :vars
    (
      ?auto_180224 - LOCATION
      ?auto_180225 - CITY
      ?auto_180227 - LOCATION
      ?auto_180226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180224 ?auto_180225 ) ( IN-CITY ?auto_180218 ?auto_180225 ) ( not ( = ?auto_180218 ?auto_180224 ) ) ( OBJ-AT ?auto_180222 ?auto_180224 ) ( IN-CITY ?auto_180227 ?auto_180225 ) ( not ( = ?auto_180218 ?auto_180227 ) ) ( OBJ-AT ?auto_180219 ?auto_180227 ) ( OBJ-AT ?auto_180220 ?auto_180224 ) ( OBJ-AT ?auto_180221 ?auto_180227 ) ( OBJ-AT ?auto_180223 ?auto_180227 ) ( TRUCK-AT ?auto_180226 ?auto_180218 ) ( not ( = ?auto_180223 ?auto_180221 ) ) ( not ( = ?auto_180223 ?auto_180220 ) ) ( not ( = ?auto_180221 ?auto_180220 ) ) ( not ( = ?auto_180224 ?auto_180227 ) ) ( not ( = ?auto_180223 ?auto_180219 ) ) ( not ( = ?auto_180221 ?auto_180219 ) ) ( not ( = ?auto_180220 ?auto_180219 ) ) ( not ( = ?auto_180223 ?auto_180222 ) ) ( not ( = ?auto_180221 ?auto_180222 ) ) ( not ( = ?auto_180220 ?auto_180222 ) ) ( not ( = ?auto_180219 ?auto_180222 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180223 ?auto_180221 ?auto_180220 ?auto_180222 ?auto_180219 ?auto_180218 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180492 - OBJ
      ?auto_180493 - OBJ
      ?auto_180494 - OBJ
      ?auto_180495 - OBJ
      ?auto_180496 - OBJ
      ?auto_180491 - LOCATION
    )
    :vars
    (
      ?auto_180497 - LOCATION
      ?auto_180498 - CITY
      ?auto_180500 - LOCATION
      ?auto_180499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180497 ?auto_180498 ) ( IN-CITY ?auto_180491 ?auto_180498 ) ( not ( = ?auto_180491 ?auto_180497 ) ) ( OBJ-AT ?auto_180494 ?auto_180497 ) ( IN-CITY ?auto_180500 ?auto_180498 ) ( not ( = ?auto_180491 ?auto_180500 ) ) ( OBJ-AT ?auto_180492 ?auto_180500 ) ( OBJ-AT ?auto_180493 ?auto_180497 ) ( OBJ-AT ?auto_180496 ?auto_180500 ) ( OBJ-AT ?auto_180495 ?auto_180500 ) ( TRUCK-AT ?auto_180499 ?auto_180491 ) ( not ( = ?auto_180495 ?auto_180496 ) ) ( not ( = ?auto_180495 ?auto_180493 ) ) ( not ( = ?auto_180496 ?auto_180493 ) ) ( not ( = ?auto_180497 ?auto_180500 ) ) ( not ( = ?auto_180495 ?auto_180492 ) ) ( not ( = ?auto_180496 ?auto_180492 ) ) ( not ( = ?auto_180493 ?auto_180492 ) ) ( not ( = ?auto_180495 ?auto_180494 ) ) ( not ( = ?auto_180496 ?auto_180494 ) ) ( not ( = ?auto_180493 ?auto_180494 ) ) ( not ( = ?auto_180492 ?auto_180494 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180495 ?auto_180496 ?auto_180493 ?auto_180494 ?auto_180492 ?auto_180491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_180535 - OBJ
      ?auto_180536 - OBJ
      ?auto_180537 - OBJ
      ?auto_180538 - OBJ
      ?auto_180539 - OBJ
      ?auto_180534 - LOCATION
    )
    :vars
    (
      ?auto_180540 - LOCATION
      ?auto_180541 - CITY
      ?auto_180543 - LOCATION
      ?auto_180542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180540 ?auto_180541 ) ( IN-CITY ?auto_180534 ?auto_180541 ) ( not ( = ?auto_180534 ?auto_180540 ) ) ( OBJ-AT ?auto_180537 ?auto_180540 ) ( IN-CITY ?auto_180543 ?auto_180541 ) ( not ( = ?auto_180534 ?auto_180543 ) ) ( OBJ-AT ?auto_180535 ?auto_180543 ) ( OBJ-AT ?auto_180536 ?auto_180540 ) ( OBJ-AT ?auto_180538 ?auto_180543 ) ( OBJ-AT ?auto_180539 ?auto_180543 ) ( TRUCK-AT ?auto_180542 ?auto_180534 ) ( not ( = ?auto_180539 ?auto_180538 ) ) ( not ( = ?auto_180539 ?auto_180536 ) ) ( not ( = ?auto_180538 ?auto_180536 ) ) ( not ( = ?auto_180540 ?auto_180543 ) ) ( not ( = ?auto_180539 ?auto_180535 ) ) ( not ( = ?auto_180538 ?auto_180535 ) ) ( not ( = ?auto_180536 ?auto_180535 ) ) ( not ( = ?auto_180539 ?auto_180537 ) ) ( not ( = ?auto_180538 ?auto_180537 ) ) ( not ( = ?auto_180536 ?auto_180537 ) ) ( not ( = ?auto_180535 ?auto_180537 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_180539 ?auto_180538 ?auto_180536 ?auto_180537 ?auto_180535 ?auto_180534 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181564 - OBJ
      ?auto_181565 - OBJ
      ?auto_181566 - OBJ
      ?auto_181567 - OBJ
      ?auto_181568 - OBJ
      ?auto_181563 - LOCATION
    )
    :vars
    (
      ?auto_181569 - LOCATION
      ?auto_181570 - CITY
      ?auto_181572 - LOCATION
      ?auto_181571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181569 ?auto_181570 ) ( IN-CITY ?auto_181563 ?auto_181570 ) ( not ( = ?auto_181563 ?auto_181569 ) ) ( OBJ-AT ?auto_181565 ?auto_181569 ) ( IN-CITY ?auto_181572 ?auto_181570 ) ( not ( = ?auto_181563 ?auto_181572 ) ) ( OBJ-AT ?auto_181564 ?auto_181572 ) ( OBJ-AT ?auto_181568 ?auto_181569 ) ( OBJ-AT ?auto_181567 ?auto_181572 ) ( OBJ-AT ?auto_181566 ?auto_181572 ) ( TRUCK-AT ?auto_181571 ?auto_181563 ) ( not ( = ?auto_181566 ?auto_181567 ) ) ( not ( = ?auto_181566 ?auto_181568 ) ) ( not ( = ?auto_181567 ?auto_181568 ) ) ( not ( = ?auto_181569 ?auto_181572 ) ) ( not ( = ?auto_181566 ?auto_181564 ) ) ( not ( = ?auto_181567 ?auto_181564 ) ) ( not ( = ?auto_181568 ?auto_181564 ) ) ( not ( = ?auto_181566 ?auto_181565 ) ) ( not ( = ?auto_181567 ?auto_181565 ) ) ( not ( = ?auto_181568 ?auto_181565 ) ) ( not ( = ?auto_181564 ?auto_181565 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181566 ?auto_181567 ?auto_181568 ?auto_181565 ?auto_181564 ?auto_181563 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181607 - OBJ
      ?auto_181608 - OBJ
      ?auto_181609 - OBJ
      ?auto_181610 - OBJ
      ?auto_181611 - OBJ
      ?auto_181606 - LOCATION
    )
    :vars
    (
      ?auto_181612 - LOCATION
      ?auto_181613 - CITY
      ?auto_181615 - LOCATION
      ?auto_181614 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181612 ?auto_181613 ) ( IN-CITY ?auto_181606 ?auto_181613 ) ( not ( = ?auto_181606 ?auto_181612 ) ) ( OBJ-AT ?auto_181608 ?auto_181612 ) ( IN-CITY ?auto_181615 ?auto_181613 ) ( not ( = ?auto_181606 ?auto_181615 ) ) ( OBJ-AT ?auto_181607 ?auto_181615 ) ( OBJ-AT ?auto_181610 ?auto_181612 ) ( OBJ-AT ?auto_181611 ?auto_181615 ) ( OBJ-AT ?auto_181609 ?auto_181615 ) ( TRUCK-AT ?auto_181614 ?auto_181606 ) ( not ( = ?auto_181609 ?auto_181611 ) ) ( not ( = ?auto_181609 ?auto_181610 ) ) ( not ( = ?auto_181611 ?auto_181610 ) ) ( not ( = ?auto_181612 ?auto_181615 ) ) ( not ( = ?auto_181609 ?auto_181607 ) ) ( not ( = ?auto_181611 ?auto_181607 ) ) ( not ( = ?auto_181610 ?auto_181607 ) ) ( not ( = ?auto_181609 ?auto_181608 ) ) ( not ( = ?auto_181611 ?auto_181608 ) ) ( not ( = ?auto_181610 ?auto_181608 ) ) ( not ( = ?auto_181607 ?auto_181608 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181609 ?auto_181611 ?auto_181610 ?auto_181608 ?auto_181607 ?auto_181606 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181788 - OBJ
      ?auto_181789 - OBJ
      ?auto_181790 - OBJ
      ?auto_181791 - OBJ
      ?auto_181792 - OBJ
      ?auto_181787 - LOCATION
    )
    :vars
    (
      ?auto_181793 - LOCATION
      ?auto_181794 - CITY
      ?auto_181796 - LOCATION
      ?auto_181795 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181793 ?auto_181794 ) ( IN-CITY ?auto_181787 ?auto_181794 ) ( not ( = ?auto_181787 ?auto_181793 ) ) ( OBJ-AT ?auto_181789 ?auto_181793 ) ( IN-CITY ?auto_181796 ?auto_181794 ) ( not ( = ?auto_181787 ?auto_181796 ) ) ( OBJ-AT ?auto_181788 ?auto_181796 ) ( OBJ-AT ?auto_181792 ?auto_181793 ) ( OBJ-AT ?auto_181790 ?auto_181796 ) ( OBJ-AT ?auto_181791 ?auto_181796 ) ( TRUCK-AT ?auto_181795 ?auto_181787 ) ( not ( = ?auto_181791 ?auto_181790 ) ) ( not ( = ?auto_181791 ?auto_181792 ) ) ( not ( = ?auto_181790 ?auto_181792 ) ) ( not ( = ?auto_181793 ?auto_181796 ) ) ( not ( = ?auto_181791 ?auto_181788 ) ) ( not ( = ?auto_181790 ?auto_181788 ) ) ( not ( = ?auto_181792 ?auto_181788 ) ) ( not ( = ?auto_181791 ?auto_181789 ) ) ( not ( = ?auto_181790 ?auto_181789 ) ) ( not ( = ?auto_181792 ?auto_181789 ) ) ( not ( = ?auto_181788 ?auto_181789 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181791 ?auto_181790 ?auto_181792 ?auto_181789 ?auto_181788 ?auto_181787 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181878 - OBJ
      ?auto_181879 - OBJ
      ?auto_181880 - OBJ
      ?auto_181881 - OBJ
      ?auto_181882 - OBJ
      ?auto_181877 - LOCATION
    )
    :vars
    (
      ?auto_181883 - LOCATION
      ?auto_181884 - CITY
      ?auto_181886 - LOCATION
      ?auto_181885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181883 ?auto_181884 ) ( IN-CITY ?auto_181877 ?auto_181884 ) ( not ( = ?auto_181877 ?auto_181883 ) ) ( OBJ-AT ?auto_181879 ?auto_181883 ) ( IN-CITY ?auto_181886 ?auto_181884 ) ( not ( = ?auto_181877 ?auto_181886 ) ) ( OBJ-AT ?auto_181878 ?auto_181886 ) ( OBJ-AT ?auto_181881 ?auto_181883 ) ( OBJ-AT ?auto_181880 ?auto_181886 ) ( OBJ-AT ?auto_181882 ?auto_181886 ) ( TRUCK-AT ?auto_181885 ?auto_181877 ) ( not ( = ?auto_181882 ?auto_181880 ) ) ( not ( = ?auto_181882 ?auto_181881 ) ) ( not ( = ?auto_181880 ?auto_181881 ) ) ( not ( = ?auto_181883 ?auto_181886 ) ) ( not ( = ?auto_181882 ?auto_181878 ) ) ( not ( = ?auto_181880 ?auto_181878 ) ) ( not ( = ?auto_181881 ?auto_181878 ) ) ( not ( = ?auto_181882 ?auto_181879 ) ) ( not ( = ?auto_181880 ?auto_181879 ) ) ( not ( = ?auto_181881 ?auto_181879 ) ) ( not ( = ?auto_181878 ?auto_181879 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181882 ?auto_181880 ?auto_181881 ?auto_181879 ?auto_181878 ?auto_181877 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_182059 - OBJ
      ?auto_182060 - OBJ
      ?auto_182061 - OBJ
      ?auto_182062 - OBJ
      ?auto_182063 - OBJ
      ?auto_182058 - LOCATION
    )
    :vars
    (
      ?auto_182064 - LOCATION
      ?auto_182065 - CITY
      ?auto_182067 - LOCATION
      ?auto_182066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_182064 ?auto_182065 ) ( IN-CITY ?auto_182058 ?auto_182065 ) ( not ( = ?auto_182058 ?auto_182064 ) ) ( OBJ-AT ?auto_182060 ?auto_182064 ) ( IN-CITY ?auto_182067 ?auto_182065 ) ( not ( = ?auto_182058 ?auto_182067 ) ) ( OBJ-AT ?auto_182059 ?auto_182067 ) ( OBJ-AT ?auto_182061 ?auto_182064 ) ( OBJ-AT ?auto_182063 ?auto_182067 ) ( OBJ-AT ?auto_182062 ?auto_182067 ) ( TRUCK-AT ?auto_182066 ?auto_182058 ) ( not ( = ?auto_182062 ?auto_182063 ) ) ( not ( = ?auto_182062 ?auto_182061 ) ) ( not ( = ?auto_182063 ?auto_182061 ) ) ( not ( = ?auto_182064 ?auto_182067 ) ) ( not ( = ?auto_182062 ?auto_182059 ) ) ( not ( = ?auto_182063 ?auto_182059 ) ) ( not ( = ?auto_182061 ?auto_182059 ) ) ( not ( = ?auto_182062 ?auto_182060 ) ) ( not ( = ?auto_182063 ?auto_182060 ) ) ( not ( = ?auto_182061 ?auto_182060 ) ) ( not ( = ?auto_182059 ?auto_182060 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_182062 ?auto_182063 ?auto_182061 ?auto_182060 ?auto_182059 ?auto_182058 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_182102 - OBJ
      ?auto_182103 - OBJ
      ?auto_182104 - OBJ
      ?auto_182105 - OBJ
      ?auto_182106 - OBJ
      ?auto_182101 - LOCATION
    )
    :vars
    (
      ?auto_182107 - LOCATION
      ?auto_182108 - CITY
      ?auto_182110 - LOCATION
      ?auto_182109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_182107 ?auto_182108 ) ( IN-CITY ?auto_182101 ?auto_182108 ) ( not ( = ?auto_182101 ?auto_182107 ) ) ( OBJ-AT ?auto_182103 ?auto_182107 ) ( IN-CITY ?auto_182110 ?auto_182108 ) ( not ( = ?auto_182101 ?auto_182110 ) ) ( OBJ-AT ?auto_182102 ?auto_182110 ) ( OBJ-AT ?auto_182104 ?auto_182107 ) ( OBJ-AT ?auto_182105 ?auto_182110 ) ( OBJ-AT ?auto_182106 ?auto_182110 ) ( TRUCK-AT ?auto_182109 ?auto_182101 ) ( not ( = ?auto_182106 ?auto_182105 ) ) ( not ( = ?auto_182106 ?auto_182104 ) ) ( not ( = ?auto_182105 ?auto_182104 ) ) ( not ( = ?auto_182107 ?auto_182110 ) ) ( not ( = ?auto_182106 ?auto_182102 ) ) ( not ( = ?auto_182105 ?auto_182102 ) ) ( not ( = ?auto_182104 ?auto_182102 ) ) ( not ( = ?auto_182106 ?auto_182103 ) ) ( not ( = ?auto_182105 ?auto_182103 ) ) ( not ( = ?auto_182104 ?auto_182103 ) ) ( not ( = ?auto_182102 ?auto_182103 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_182106 ?auto_182105 ?auto_182104 ?auto_182103 ?auto_182102 ?auto_182101 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183373 - OBJ
      ?auto_183374 - OBJ
      ?auto_183375 - OBJ
      ?auto_183376 - OBJ
      ?auto_183377 - OBJ
      ?auto_183372 - LOCATION
    )
    :vars
    (
      ?auto_183378 - LOCATION
      ?auto_183379 - CITY
      ?auto_183381 - LOCATION
      ?auto_183380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183378 ?auto_183379 ) ( IN-CITY ?auto_183372 ?auto_183379 ) ( not ( = ?auto_183372 ?auto_183378 ) ) ( OBJ-AT ?auto_183373 ?auto_183378 ) ( IN-CITY ?auto_183381 ?auto_183379 ) ( not ( = ?auto_183372 ?auto_183381 ) ) ( OBJ-AT ?auto_183377 ?auto_183381 ) ( OBJ-AT ?auto_183376 ?auto_183378 ) ( OBJ-AT ?auto_183375 ?auto_183381 ) ( OBJ-AT ?auto_183374 ?auto_183381 ) ( TRUCK-AT ?auto_183380 ?auto_183372 ) ( not ( = ?auto_183374 ?auto_183375 ) ) ( not ( = ?auto_183374 ?auto_183376 ) ) ( not ( = ?auto_183375 ?auto_183376 ) ) ( not ( = ?auto_183378 ?auto_183381 ) ) ( not ( = ?auto_183374 ?auto_183377 ) ) ( not ( = ?auto_183375 ?auto_183377 ) ) ( not ( = ?auto_183376 ?auto_183377 ) ) ( not ( = ?auto_183374 ?auto_183373 ) ) ( not ( = ?auto_183375 ?auto_183373 ) ) ( not ( = ?auto_183376 ?auto_183373 ) ) ( not ( = ?auto_183377 ?auto_183373 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183374 ?auto_183375 ?auto_183376 ?auto_183373 ?auto_183377 ?auto_183372 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183416 - OBJ
      ?auto_183417 - OBJ
      ?auto_183418 - OBJ
      ?auto_183419 - OBJ
      ?auto_183420 - OBJ
      ?auto_183415 - LOCATION
    )
    :vars
    (
      ?auto_183421 - LOCATION
      ?auto_183422 - CITY
      ?auto_183424 - LOCATION
      ?auto_183423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183421 ?auto_183422 ) ( IN-CITY ?auto_183415 ?auto_183422 ) ( not ( = ?auto_183415 ?auto_183421 ) ) ( OBJ-AT ?auto_183416 ?auto_183421 ) ( IN-CITY ?auto_183424 ?auto_183422 ) ( not ( = ?auto_183415 ?auto_183424 ) ) ( OBJ-AT ?auto_183419 ?auto_183424 ) ( OBJ-AT ?auto_183420 ?auto_183421 ) ( OBJ-AT ?auto_183418 ?auto_183424 ) ( OBJ-AT ?auto_183417 ?auto_183424 ) ( TRUCK-AT ?auto_183423 ?auto_183415 ) ( not ( = ?auto_183417 ?auto_183418 ) ) ( not ( = ?auto_183417 ?auto_183420 ) ) ( not ( = ?auto_183418 ?auto_183420 ) ) ( not ( = ?auto_183421 ?auto_183424 ) ) ( not ( = ?auto_183417 ?auto_183419 ) ) ( not ( = ?auto_183418 ?auto_183419 ) ) ( not ( = ?auto_183420 ?auto_183419 ) ) ( not ( = ?auto_183417 ?auto_183416 ) ) ( not ( = ?auto_183418 ?auto_183416 ) ) ( not ( = ?auto_183420 ?auto_183416 ) ) ( not ( = ?auto_183419 ?auto_183416 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183417 ?auto_183418 ?auto_183420 ?auto_183416 ?auto_183419 ?auto_183415 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183597 - OBJ
      ?auto_183598 - OBJ
      ?auto_183599 - OBJ
      ?auto_183600 - OBJ
      ?auto_183601 - OBJ
      ?auto_183596 - LOCATION
    )
    :vars
    (
      ?auto_183602 - LOCATION
      ?auto_183603 - CITY
      ?auto_183605 - LOCATION
      ?auto_183604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183602 ?auto_183603 ) ( IN-CITY ?auto_183596 ?auto_183603 ) ( not ( = ?auto_183596 ?auto_183602 ) ) ( OBJ-AT ?auto_183597 ?auto_183602 ) ( IN-CITY ?auto_183605 ?auto_183603 ) ( not ( = ?auto_183596 ?auto_183605 ) ) ( OBJ-AT ?auto_183601 ?auto_183605 ) ( OBJ-AT ?auto_183599 ?auto_183602 ) ( OBJ-AT ?auto_183600 ?auto_183605 ) ( OBJ-AT ?auto_183598 ?auto_183605 ) ( TRUCK-AT ?auto_183604 ?auto_183596 ) ( not ( = ?auto_183598 ?auto_183600 ) ) ( not ( = ?auto_183598 ?auto_183599 ) ) ( not ( = ?auto_183600 ?auto_183599 ) ) ( not ( = ?auto_183602 ?auto_183605 ) ) ( not ( = ?auto_183598 ?auto_183601 ) ) ( not ( = ?auto_183600 ?auto_183601 ) ) ( not ( = ?auto_183599 ?auto_183601 ) ) ( not ( = ?auto_183598 ?auto_183597 ) ) ( not ( = ?auto_183600 ?auto_183597 ) ) ( not ( = ?auto_183599 ?auto_183597 ) ) ( not ( = ?auto_183601 ?auto_183597 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183598 ?auto_183600 ?auto_183599 ?auto_183597 ?auto_183601 ?auto_183596 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183687 - OBJ
      ?auto_183688 - OBJ
      ?auto_183689 - OBJ
      ?auto_183690 - OBJ
      ?auto_183691 - OBJ
      ?auto_183686 - LOCATION
    )
    :vars
    (
      ?auto_183692 - LOCATION
      ?auto_183693 - CITY
      ?auto_183695 - LOCATION
      ?auto_183694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183692 ?auto_183693 ) ( IN-CITY ?auto_183686 ?auto_183693 ) ( not ( = ?auto_183686 ?auto_183692 ) ) ( OBJ-AT ?auto_183687 ?auto_183692 ) ( IN-CITY ?auto_183695 ?auto_183693 ) ( not ( = ?auto_183686 ?auto_183695 ) ) ( OBJ-AT ?auto_183690 ?auto_183695 ) ( OBJ-AT ?auto_183689 ?auto_183692 ) ( OBJ-AT ?auto_183691 ?auto_183695 ) ( OBJ-AT ?auto_183688 ?auto_183695 ) ( TRUCK-AT ?auto_183694 ?auto_183686 ) ( not ( = ?auto_183688 ?auto_183691 ) ) ( not ( = ?auto_183688 ?auto_183689 ) ) ( not ( = ?auto_183691 ?auto_183689 ) ) ( not ( = ?auto_183692 ?auto_183695 ) ) ( not ( = ?auto_183688 ?auto_183690 ) ) ( not ( = ?auto_183691 ?auto_183690 ) ) ( not ( = ?auto_183689 ?auto_183690 ) ) ( not ( = ?auto_183688 ?auto_183687 ) ) ( not ( = ?auto_183691 ?auto_183687 ) ) ( not ( = ?auto_183689 ?auto_183687 ) ) ( not ( = ?auto_183690 ?auto_183687 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183688 ?auto_183691 ?auto_183689 ?auto_183687 ?auto_183690 ?auto_183686 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183868 - OBJ
      ?auto_183869 - OBJ
      ?auto_183870 - OBJ
      ?auto_183871 - OBJ
      ?auto_183872 - OBJ
      ?auto_183867 - LOCATION
    )
    :vars
    (
      ?auto_183873 - LOCATION
      ?auto_183874 - CITY
      ?auto_183876 - LOCATION
      ?auto_183875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183873 ?auto_183874 ) ( IN-CITY ?auto_183867 ?auto_183874 ) ( not ( = ?auto_183867 ?auto_183873 ) ) ( OBJ-AT ?auto_183868 ?auto_183873 ) ( IN-CITY ?auto_183876 ?auto_183874 ) ( not ( = ?auto_183867 ?auto_183876 ) ) ( OBJ-AT ?auto_183870 ?auto_183876 ) ( OBJ-AT ?auto_183872 ?auto_183873 ) ( OBJ-AT ?auto_183871 ?auto_183876 ) ( OBJ-AT ?auto_183869 ?auto_183876 ) ( TRUCK-AT ?auto_183875 ?auto_183867 ) ( not ( = ?auto_183869 ?auto_183871 ) ) ( not ( = ?auto_183869 ?auto_183872 ) ) ( not ( = ?auto_183871 ?auto_183872 ) ) ( not ( = ?auto_183873 ?auto_183876 ) ) ( not ( = ?auto_183869 ?auto_183870 ) ) ( not ( = ?auto_183871 ?auto_183870 ) ) ( not ( = ?auto_183872 ?auto_183870 ) ) ( not ( = ?auto_183869 ?auto_183868 ) ) ( not ( = ?auto_183871 ?auto_183868 ) ) ( not ( = ?auto_183872 ?auto_183868 ) ) ( not ( = ?auto_183870 ?auto_183868 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183869 ?auto_183871 ?auto_183872 ?auto_183868 ?auto_183870 ?auto_183867 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183911 - OBJ
      ?auto_183912 - OBJ
      ?auto_183913 - OBJ
      ?auto_183914 - OBJ
      ?auto_183915 - OBJ
      ?auto_183910 - LOCATION
    )
    :vars
    (
      ?auto_183916 - LOCATION
      ?auto_183917 - CITY
      ?auto_183919 - LOCATION
      ?auto_183918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183916 ?auto_183917 ) ( IN-CITY ?auto_183910 ?auto_183917 ) ( not ( = ?auto_183910 ?auto_183916 ) ) ( OBJ-AT ?auto_183911 ?auto_183916 ) ( IN-CITY ?auto_183919 ?auto_183917 ) ( not ( = ?auto_183910 ?auto_183919 ) ) ( OBJ-AT ?auto_183913 ?auto_183919 ) ( OBJ-AT ?auto_183914 ?auto_183916 ) ( OBJ-AT ?auto_183915 ?auto_183919 ) ( OBJ-AT ?auto_183912 ?auto_183919 ) ( TRUCK-AT ?auto_183918 ?auto_183910 ) ( not ( = ?auto_183912 ?auto_183915 ) ) ( not ( = ?auto_183912 ?auto_183914 ) ) ( not ( = ?auto_183915 ?auto_183914 ) ) ( not ( = ?auto_183916 ?auto_183919 ) ) ( not ( = ?auto_183912 ?auto_183913 ) ) ( not ( = ?auto_183915 ?auto_183913 ) ) ( not ( = ?auto_183914 ?auto_183913 ) ) ( not ( = ?auto_183912 ?auto_183911 ) ) ( not ( = ?auto_183915 ?auto_183911 ) ) ( not ( = ?auto_183914 ?auto_183911 ) ) ( not ( = ?auto_183913 ?auto_183911 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183912 ?auto_183915 ?auto_183914 ?auto_183911 ?auto_183913 ?auto_183910 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184517 - OBJ
      ?auto_184518 - OBJ
      ?auto_184519 - OBJ
      ?auto_184520 - OBJ
      ?auto_184521 - OBJ
      ?auto_184516 - LOCATION
    )
    :vars
    (
      ?auto_184522 - LOCATION
      ?auto_184523 - CITY
      ?auto_184525 - LOCATION
      ?auto_184524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184522 ?auto_184523 ) ( IN-CITY ?auto_184516 ?auto_184523 ) ( not ( = ?auto_184516 ?auto_184522 ) ) ( OBJ-AT ?auto_184517 ?auto_184522 ) ( IN-CITY ?auto_184525 ?auto_184523 ) ( not ( = ?auto_184516 ?auto_184525 ) ) ( OBJ-AT ?auto_184521 ?auto_184525 ) ( OBJ-AT ?auto_184520 ?auto_184522 ) ( OBJ-AT ?auto_184518 ?auto_184525 ) ( OBJ-AT ?auto_184519 ?auto_184525 ) ( TRUCK-AT ?auto_184524 ?auto_184516 ) ( not ( = ?auto_184519 ?auto_184518 ) ) ( not ( = ?auto_184519 ?auto_184520 ) ) ( not ( = ?auto_184518 ?auto_184520 ) ) ( not ( = ?auto_184522 ?auto_184525 ) ) ( not ( = ?auto_184519 ?auto_184521 ) ) ( not ( = ?auto_184518 ?auto_184521 ) ) ( not ( = ?auto_184520 ?auto_184521 ) ) ( not ( = ?auto_184519 ?auto_184517 ) ) ( not ( = ?auto_184518 ?auto_184517 ) ) ( not ( = ?auto_184520 ?auto_184517 ) ) ( not ( = ?auto_184521 ?auto_184517 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184519 ?auto_184518 ?auto_184520 ?auto_184517 ?auto_184521 ?auto_184516 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184560 - OBJ
      ?auto_184561 - OBJ
      ?auto_184562 - OBJ
      ?auto_184563 - OBJ
      ?auto_184564 - OBJ
      ?auto_184559 - LOCATION
    )
    :vars
    (
      ?auto_184565 - LOCATION
      ?auto_184566 - CITY
      ?auto_184568 - LOCATION
      ?auto_184567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184565 ?auto_184566 ) ( IN-CITY ?auto_184559 ?auto_184566 ) ( not ( = ?auto_184559 ?auto_184565 ) ) ( OBJ-AT ?auto_184560 ?auto_184565 ) ( IN-CITY ?auto_184568 ?auto_184566 ) ( not ( = ?auto_184559 ?auto_184568 ) ) ( OBJ-AT ?auto_184563 ?auto_184568 ) ( OBJ-AT ?auto_184564 ?auto_184565 ) ( OBJ-AT ?auto_184561 ?auto_184568 ) ( OBJ-AT ?auto_184562 ?auto_184568 ) ( TRUCK-AT ?auto_184567 ?auto_184559 ) ( not ( = ?auto_184562 ?auto_184561 ) ) ( not ( = ?auto_184562 ?auto_184564 ) ) ( not ( = ?auto_184561 ?auto_184564 ) ) ( not ( = ?auto_184565 ?auto_184568 ) ) ( not ( = ?auto_184562 ?auto_184563 ) ) ( not ( = ?auto_184561 ?auto_184563 ) ) ( not ( = ?auto_184564 ?auto_184563 ) ) ( not ( = ?auto_184562 ?auto_184560 ) ) ( not ( = ?auto_184561 ?auto_184560 ) ) ( not ( = ?auto_184564 ?auto_184560 ) ) ( not ( = ?auto_184563 ?auto_184560 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184562 ?auto_184561 ?auto_184564 ?auto_184560 ?auto_184563 ?auto_184559 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184981 - OBJ
      ?auto_184982 - OBJ
      ?auto_184983 - OBJ
      ?auto_184984 - OBJ
      ?auto_184985 - OBJ
      ?auto_184980 - LOCATION
    )
    :vars
    (
      ?auto_184986 - LOCATION
      ?auto_184987 - CITY
      ?auto_184989 - LOCATION
      ?auto_184988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184986 ?auto_184987 ) ( IN-CITY ?auto_184980 ?auto_184987 ) ( not ( = ?auto_184980 ?auto_184986 ) ) ( OBJ-AT ?auto_184981 ?auto_184986 ) ( IN-CITY ?auto_184989 ?auto_184987 ) ( not ( = ?auto_184980 ?auto_184989 ) ) ( OBJ-AT ?auto_184985 ?auto_184989 ) ( OBJ-AT ?auto_184983 ?auto_184986 ) ( OBJ-AT ?auto_184982 ?auto_184989 ) ( OBJ-AT ?auto_184984 ?auto_184989 ) ( TRUCK-AT ?auto_184988 ?auto_184980 ) ( not ( = ?auto_184984 ?auto_184982 ) ) ( not ( = ?auto_184984 ?auto_184983 ) ) ( not ( = ?auto_184982 ?auto_184983 ) ) ( not ( = ?auto_184986 ?auto_184989 ) ) ( not ( = ?auto_184984 ?auto_184985 ) ) ( not ( = ?auto_184982 ?auto_184985 ) ) ( not ( = ?auto_184983 ?auto_184985 ) ) ( not ( = ?auto_184984 ?auto_184981 ) ) ( not ( = ?auto_184982 ?auto_184981 ) ) ( not ( = ?auto_184983 ?auto_184981 ) ) ( not ( = ?auto_184985 ?auto_184981 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184984 ?auto_184982 ?auto_184983 ?auto_184981 ?auto_184985 ?auto_184980 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185118 - OBJ
      ?auto_185119 - OBJ
      ?auto_185120 - OBJ
      ?auto_185121 - OBJ
      ?auto_185122 - OBJ
      ?auto_185117 - LOCATION
    )
    :vars
    (
      ?auto_185123 - LOCATION
      ?auto_185124 - CITY
      ?auto_185126 - LOCATION
      ?auto_185125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185123 ?auto_185124 ) ( IN-CITY ?auto_185117 ?auto_185124 ) ( not ( = ?auto_185117 ?auto_185123 ) ) ( OBJ-AT ?auto_185118 ?auto_185123 ) ( IN-CITY ?auto_185126 ?auto_185124 ) ( not ( = ?auto_185117 ?auto_185126 ) ) ( OBJ-AT ?auto_185121 ?auto_185126 ) ( OBJ-AT ?auto_185120 ?auto_185123 ) ( OBJ-AT ?auto_185119 ?auto_185126 ) ( OBJ-AT ?auto_185122 ?auto_185126 ) ( TRUCK-AT ?auto_185125 ?auto_185117 ) ( not ( = ?auto_185122 ?auto_185119 ) ) ( not ( = ?auto_185122 ?auto_185120 ) ) ( not ( = ?auto_185119 ?auto_185120 ) ) ( not ( = ?auto_185123 ?auto_185126 ) ) ( not ( = ?auto_185122 ?auto_185121 ) ) ( not ( = ?auto_185119 ?auto_185121 ) ) ( not ( = ?auto_185120 ?auto_185121 ) ) ( not ( = ?auto_185122 ?auto_185118 ) ) ( not ( = ?auto_185119 ?auto_185118 ) ) ( not ( = ?auto_185120 ?auto_185118 ) ) ( not ( = ?auto_185121 ?auto_185118 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185122 ?auto_185119 ?auto_185120 ?auto_185118 ?auto_185121 ?auto_185117 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185252 - OBJ
      ?auto_185253 - OBJ
      ?auto_185254 - OBJ
      ?auto_185255 - OBJ
      ?auto_185256 - OBJ
      ?auto_185251 - LOCATION
    )
    :vars
    (
      ?auto_185257 - LOCATION
      ?auto_185258 - CITY
      ?auto_185260 - LOCATION
      ?auto_185259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185257 ?auto_185258 ) ( IN-CITY ?auto_185251 ?auto_185258 ) ( not ( = ?auto_185251 ?auto_185257 ) ) ( OBJ-AT ?auto_185252 ?auto_185257 ) ( IN-CITY ?auto_185260 ?auto_185258 ) ( not ( = ?auto_185251 ?auto_185260 ) ) ( OBJ-AT ?auto_185254 ?auto_185260 ) ( OBJ-AT ?auto_185256 ?auto_185257 ) ( OBJ-AT ?auto_185253 ?auto_185260 ) ( OBJ-AT ?auto_185255 ?auto_185260 ) ( TRUCK-AT ?auto_185259 ?auto_185251 ) ( not ( = ?auto_185255 ?auto_185253 ) ) ( not ( = ?auto_185255 ?auto_185256 ) ) ( not ( = ?auto_185253 ?auto_185256 ) ) ( not ( = ?auto_185257 ?auto_185260 ) ) ( not ( = ?auto_185255 ?auto_185254 ) ) ( not ( = ?auto_185253 ?auto_185254 ) ) ( not ( = ?auto_185256 ?auto_185254 ) ) ( not ( = ?auto_185255 ?auto_185252 ) ) ( not ( = ?auto_185253 ?auto_185252 ) ) ( not ( = ?auto_185256 ?auto_185252 ) ) ( not ( = ?auto_185254 ?auto_185252 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185255 ?auto_185253 ?auto_185256 ?auto_185252 ?auto_185254 ?auto_185251 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185342 - OBJ
      ?auto_185343 - OBJ
      ?auto_185344 - OBJ
      ?auto_185345 - OBJ
      ?auto_185346 - OBJ
      ?auto_185341 - LOCATION
    )
    :vars
    (
      ?auto_185347 - LOCATION
      ?auto_185348 - CITY
      ?auto_185350 - LOCATION
      ?auto_185349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185347 ?auto_185348 ) ( IN-CITY ?auto_185341 ?auto_185348 ) ( not ( = ?auto_185341 ?auto_185347 ) ) ( OBJ-AT ?auto_185342 ?auto_185347 ) ( IN-CITY ?auto_185350 ?auto_185348 ) ( not ( = ?auto_185341 ?auto_185350 ) ) ( OBJ-AT ?auto_185344 ?auto_185350 ) ( OBJ-AT ?auto_185345 ?auto_185347 ) ( OBJ-AT ?auto_185343 ?auto_185350 ) ( OBJ-AT ?auto_185346 ?auto_185350 ) ( TRUCK-AT ?auto_185349 ?auto_185341 ) ( not ( = ?auto_185346 ?auto_185343 ) ) ( not ( = ?auto_185346 ?auto_185345 ) ) ( not ( = ?auto_185343 ?auto_185345 ) ) ( not ( = ?auto_185347 ?auto_185350 ) ) ( not ( = ?auto_185346 ?auto_185344 ) ) ( not ( = ?auto_185343 ?auto_185344 ) ) ( not ( = ?auto_185345 ?auto_185344 ) ) ( not ( = ?auto_185346 ?auto_185342 ) ) ( not ( = ?auto_185343 ?auto_185342 ) ) ( not ( = ?auto_185345 ?auto_185342 ) ) ( not ( = ?auto_185344 ?auto_185342 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185346 ?auto_185343 ?auto_185345 ?auto_185342 ?auto_185344 ?auto_185341 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185901 - OBJ
      ?auto_185902 - OBJ
      ?auto_185903 - OBJ
      ?auto_185904 - OBJ
      ?auto_185905 - OBJ
      ?auto_185900 - LOCATION
    )
    :vars
    (
      ?auto_185906 - LOCATION
      ?auto_185907 - CITY
      ?auto_185909 - LOCATION
      ?auto_185908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185906 ?auto_185907 ) ( IN-CITY ?auto_185900 ?auto_185907 ) ( not ( = ?auto_185900 ?auto_185906 ) ) ( OBJ-AT ?auto_185901 ?auto_185906 ) ( IN-CITY ?auto_185909 ?auto_185907 ) ( not ( = ?auto_185900 ?auto_185909 ) ) ( OBJ-AT ?auto_185905 ?auto_185909 ) ( OBJ-AT ?auto_185902 ?auto_185906 ) ( OBJ-AT ?auto_185904 ?auto_185909 ) ( OBJ-AT ?auto_185903 ?auto_185909 ) ( TRUCK-AT ?auto_185908 ?auto_185900 ) ( not ( = ?auto_185903 ?auto_185904 ) ) ( not ( = ?auto_185903 ?auto_185902 ) ) ( not ( = ?auto_185904 ?auto_185902 ) ) ( not ( = ?auto_185906 ?auto_185909 ) ) ( not ( = ?auto_185903 ?auto_185905 ) ) ( not ( = ?auto_185904 ?auto_185905 ) ) ( not ( = ?auto_185902 ?auto_185905 ) ) ( not ( = ?auto_185903 ?auto_185901 ) ) ( not ( = ?auto_185904 ?auto_185901 ) ) ( not ( = ?auto_185902 ?auto_185901 ) ) ( not ( = ?auto_185905 ?auto_185901 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185903 ?auto_185904 ?auto_185902 ?auto_185901 ?auto_185905 ?auto_185900 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185991 - OBJ
      ?auto_185992 - OBJ
      ?auto_185993 - OBJ
      ?auto_185994 - OBJ
      ?auto_185995 - OBJ
      ?auto_185990 - LOCATION
    )
    :vars
    (
      ?auto_185996 - LOCATION
      ?auto_185997 - CITY
      ?auto_185999 - LOCATION
      ?auto_185998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185996 ?auto_185997 ) ( IN-CITY ?auto_185990 ?auto_185997 ) ( not ( = ?auto_185990 ?auto_185996 ) ) ( OBJ-AT ?auto_185991 ?auto_185996 ) ( IN-CITY ?auto_185999 ?auto_185997 ) ( not ( = ?auto_185990 ?auto_185999 ) ) ( OBJ-AT ?auto_185994 ?auto_185999 ) ( OBJ-AT ?auto_185992 ?auto_185996 ) ( OBJ-AT ?auto_185995 ?auto_185999 ) ( OBJ-AT ?auto_185993 ?auto_185999 ) ( TRUCK-AT ?auto_185998 ?auto_185990 ) ( not ( = ?auto_185993 ?auto_185995 ) ) ( not ( = ?auto_185993 ?auto_185992 ) ) ( not ( = ?auto_185995 ?auto_185992 ) ) ( not ( = ?auto_185996 ?auto_185999 ) ) ( not ( = ?auto_185993 ?auto_185994 ) ) ( not ( = ?auto_185995 ?auto_185994 ) ) ( not ( = ?auto_185992 ?auto_185994 ) ) ( not ( = ?auto_185993 ?auto_185991 ) ) ( not ( = ?auto_185995 ?auto_185991 ) ) ( not ( = ?auto_185992 ?auto_185991 ) ) ( not ( = ?auto_185994 ?auto_185991 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185993 ?auto_185995 ?auto_185992 ?auto_185991 ?auto_185994 ?auto_185990 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186125 - OBJ
      ?auto_186126 - OBJ
      ?auto_186127 - OBJ
      ?auto_186128 - OBJ
      ?auto_186129 - OBJ
      ?auto_186124 - LOCATION
    )
    :vars
    (
      ?auto_186130 - LOCATION
      ?auto_186131 - CITY
      ?auto_186133 - LOCATION
      ?auto_186132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186130 ?auto_186131 ) ( IN-CITY ?auto_186124 ?auto_186131 ) ( not ( = ?auto_186124 ?auto_186130 ) ) ( OBJ-AT ?auto_186125 ?auto_186130 ) ( IN-CITY ?auto_186133 ?auto_186131 ) ( not ( = ?auto_186124 ?auto_186133 ) ) ( OBJ-AT ?auto_186129 ?auto_186133 ) ( OBJ-AT ?auto_186126 ?auto_186130 ) ( OBJ-AT ?auto_186127 ?auto_186133 ) ( OBJ-AT ?auto_186128 ?auto_186133 ) ( TRUCK-AT ?auto_186132 ?auto_186124 ) ( not ( = ?auto_186128 ?auto_186127 ) ) ( not ( = ?auto_186128 ?auto_186126 ) ) ( not ( = ?auto_186127 ?auto_186126 ) ) ( not ( = ?auto_186130 ?auto_186133 ) ) ( not ( = ?auto_186128 ?auto_186129 ) ) ( not ( = ?auto_186127 ?auto_186129 ) ) ( not ( = ?auto_186126 ?auto_186129 ) ) ( not ( = ?auto_186128 ?auto_186125 ) ) ( not ( = ?auto_186127 ?auto_186125 ) ) ( not ( = ?auto_186126 ?auto_186125 ) ) ( not ( = ?auto_186129 ?auto_186125 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186128 ?auto_186127 ?auto_186126 ?auto_186125 ?auto_186129 ?auto_186124 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186262 - OBJ
      ?auto_186263 - OBJ
      ?auto_186264 - OBJ
      ?auto_186265 - OBJ
      ?auto_186266 - OBJ
      ?auto_186261 - LOCATION
    )
    :vars
    (
      ?auto_186267 - LOCATION
      ?auto_186268 - CITY
      ?auto_186270 - LOCATION
      ?auto_186269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186267 ?auto_186268 ) ( IN-CITY ?auto_186261 ?auto_186268 ) ( not ( = ?auto_186261 ?auto_186267 ) ) ( OBJ-AT ?auto_186262 ?auto_186267 ) ( IN-CITY ?auto_186270 ?auto_186268 ) ( not ( = ?auto_186261 ?auto_186270 ) ) ( OBJ-AT ?auto_186265 ?auto_186270 ) ( OBJ-AT ?auto_186263 ?auto_186267 ) ( OBJ-AT ?auto_186264 ?auto_186270 ) ( OBJ-AT ?auto_186266 ?auto_186270 ) ( TRUCK-AT ?auto_186269 ?auto_186261 ) ( not ( = ?auto_186266 ?auto_186264 ) ) ( not ( = ?auto_186266 ?auto_186263 ) ) ( not ( = ?auto_186264 ?auto_186263 ) ) ( not ( = ?auto_186267 ?auto_186270 ) ) ( not ( = ?auto_186266 ?auto_186265 ) ) ( not ( = ?auto_186264 ?auto_186265 ) ) ( not ( = ?auto_186263 ?auto_186265 ) ) ( not ( = ?auto_186266 ?auto_186262 ) ) ( not ( = ?auto_186264 ?auto_186262 ) ) ( not ( = ?auto_186263 ?auto_186262 ) ) ( not ( = ?auto_186265 ?auto_186262 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186266 ?auto_186264 ?auto_186263 ?auto_186262 ?auto_186265 ?auto_186261 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186683 - OBJ
      ?auto_186684 - OBJ
      ?auto_186685 - OBJ
      ?auto_186686 - OBJ
      ?auto_186687 - OBJ
      ?auto_186682 - LOCATION
    )
    :vars
    (
      ?auto_186688 - LOCATION
      ?auto_186689 - CITY
      ?auto_186691 - LOCATION
      ?auto_186690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186688 ?auto_186689 ) ( IN-CITY ?auto_186682 ?auto_186689 ) ( not ( = ?auto_186682 ?auto_186688 ) ) ( OBJ-AT ?auto_186683 ?auto_186688 ) ( IN-CITY ?auto_186691 ?auto_186689 ) ( not ( = ?auto_186682 ?auto_186691 ) ) ( OBJ-AT ?auto_186685 ?auto_186691 ) ( OBJ-AT ?auto_186684 ?auto_186688 ) ( OBJ-AT ?auto_186687 ?auto_186691 ) ( OBJ-AT ?auto_186686 ?auto_186691 ) ( TRUCK-AT ?auto_186690 ?auto_186682 ) ( not ( = ?auto_186686 ?auto_186687 ) ) ( not ( = ?auto_186686 ?auto_186684 ) ) ( not ( = ?auto_186687 ?auto_186684 ) ) ( not ( = ?auto_186688 ?auto_186691 ) ) ( not ( = ?auto_186686 ?auto_186685 ) ) ( not ( = ?auto_186687 ?auto_186685 ) ) ( not ( = ?auto_186684 ?auto_186685 ) ) ( not ( = ?auto_186686 ?auto_186683 ) ) ( not ( = ?auto_186687 ?auto_186683 ) ) ( not ( = ?auto_186684 ?auto_186683 ) ) ( not ( = ?auto_186685 ?auto_186683 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186686 ?auto_186687 ?auto_186684 ?auto_186683 ?auto_186685 ?auto_186682 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186726 - OBJ
      ?auto_186727 - OBJ
      ?auto_186728 - OBJ
      ?auto_186729 - OBJ
      ?auto_186730 - OBJ
      ?auto_186725 - LOCATION
    )
    :vars
    (
      ?auto_186731 - LOCATION
      ?auto_186732 - CITY
      ?auto_186734 - LOCATION
      ?auto_186733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186731 ?auto_186732 ) ( IN-CITY ?auto_186725 ?auto_186732 ) ( not ( = ?auto_186725 ?auto_186731 ) ) ( OBJ-AT ?auto_186726 ?auto_186731 ) ( IN-CITY ?auto_186734 ?auto_186732 ) ( not ( = ?auto_186725 ?auto_186734 ) ) ( OBJ-AT ?auto_186728 ?auto_186734 ) ( OBJ-AT ?auto_186727 ?auto_186731 ) ( OBJ-AT ?auto_186729 ?auto_186734 ) ( OBJ-AT ?auto_186730 ?auto_186734 ) ( TRUCK-AT ?auto_186733 ?auto_186725 ) ( not ( = ?auto_186730 ?auto_186729 ) ) ( not ( = ?auto_186730 ?auto_186727 ) ) ( not ( = ?auto_186729 ?auto_186727 ) ) ( not ( = ?auto_186731 ?auto_186734 ) ) ( not ( = ?auto_186730 ?auto_186728 ) ) ( not ( = ?auto_186729 ?auto_186728 ) ) ( not ( = ?auto_186727 ?auto_186728 ) ) ( not ( = ?auto_186730 ?auto_186726 ) ) ( not ( = ?auto_186729 ?auto_186726 ) ) ( not ( = ?auto_186727 ?auto_186726 ) ) ( not ( = ?auto_186728 ?auto_186726 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186730 ?auto_186729 ?auto_186727 ?auto_186726 ?auto_186728 ?auto_186725 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187332 - OBJ
      ?auto_187333 - OBJ
      ?auto_187334 - OBJ
      ?auto_187335 - OBJ
      ?auto_187336 - OBJ
      ?auto_187331 - LOCATION
    )
    :vars
    (
      ?auto_187337 - LOCATION
      ?auto_187338 - CITY
      ?auto_187340 - LOCATION
      ?auto_187339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187337 ?auto_187338 ) ( IN-CITY ?auto_187331 ?auto_187338 ) ( not ( = ?auto_187331 ?auto_187337 ) ) ( OBJ-AT ?auto_187332 ?auto_187337 ) ( IN-CITY ?auto_187340 ?auto_187338 ) ( not ( = ?auto_187331 ?auto_187340 ) ) ( OBJ-AT ?auto_187333 ?auto_187340 ) ( OBJ-AT ?auto_187336 ?auto_187337 ) ( OBJ-AT ?auto_187335 ?auto_187340 ) ( OBJ-AT ?auto_187334 ?auto_187340 ) ( TRUCK-AT ?auto_187339 ?auto_187331 ) ( not ( = ?auto_187334 ?auto_187335 ) ) ( not ( = ?auto_187334 ?auto_187336 ) ) ( not ( = ?auto_187335 ?auto_187336 ) ) ( not ( = ?auto_187337 ?auto_187340 ) ) ( not ( = ?auto_187334 ?auto_187333 ) ) ( not ( = ?auto_187335 ?auto_187333 ) ) ( not ( = ?auto_187336 ?auto_187333 ) ) ( not ( = ?auto_187334 ?auto_187332 ) ) ( not ( = ?auto_187335 ?auto_187332 ) ) ( not ( = ?auto_187336 ?auto_187332 ) ) ( not ( = ?auto_187333 ?auto_187332 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187334 ?auto_187335 ?auto_187336 ?auto_187332 ?auto_187333 ?auto_187331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187375 - OBJ
      ?auto_187376 - OBJ
      ?auto_187377 - OBJ
      ?auto_187378 - OBJ
      ?auto_187379 - OBJ
      ?auto_187374 - LOCATION
    )
    :vars
    (
      ?auto_187380 - LOCATION
      ?auto_187381 - CITY
      ?auto_187383 - LOCATION
      ?auto_187382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187380 ?auto_187381 ) ( IN-CITY ?auto_187374 ?auto_187381 ) ( not ( = ?auto_187374 ?auto_187380 ) ) ( OBJ-AT ?auto_187375 ?auto_187380 ) ( IN-CITY ?auto_187383 ?auto_187381 ) ( not ( = ?auto_187374 ?auto_187383 ) ) ( OBJ-AT ?auto_187376 ?auto_187383 ) ( OBJ-AT ?auto_187378 ?auto_187380 ) ( OBJ-AT ?auto_187379 ?auto_187383 ) ( OBJ-AT ?auto_187377 ?auto_187383 ) ( TRUCK-AT ?auto_187382 ?auto_187374 ) ( not ( = ?auto_187377 ?auto_187379 ) ) ( not ( = ?auto_187377 ?auto_187378 ) ) ( not ( = ?auto_187379 ?auto_187378 ) ) ( not ( = ?auto_187380 ?auto_187383 ) ) ( not ( = ?auto_187377 ?auto_187376 ) ) ( not ( = ?auto_187379 ?auto_187376 ) ) ( not ( = ?auto_187378 ?auto_187376 ) ) ( not ( = ?auto_187377 ?auto_187375 ) ) ( not ( = ?auto_187379 ?auto_187375 ) ) ( not ( = ?auto_187378 ?auto_187375 ) ) ( not ( = ?auto_187376 ?auto_187375 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187377 ?auto_187379 ?auto_187378 ?auto_187375 ?auto_187376 ?auto_187374 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187556 - OBJ
      ?auto_187557 - OBJ
      ?auto_187558 - OBJ
      ?auto_187559 - OBJ
      ?auto_187560 - OBJ
      ?auto_187555 - LOCATION
    )
    :vars
    (
      ?auto_187561 - LOCATION
      ?auto_187562 - CITY
      ?auto_187564 - LOCATION
      ?auto_187563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187561 ?auto_187562 ) ( IN-CITY ?auto_187555 ?auto_187562 ) ( not ( = ?auto_187555 ?auto_187561 ) ) ( OBJ-AT ?auto_187556 ?auto_187561 ) ( IN-CITY ?auto_187564 ?auto_187562 ) ( not ( = ?auto_187555 ?auto_187564 ) ) ( OBJ-AT ?auto_187557 ?auto_187564 ) ( OBJ-AT ?auto_187560 ?auto_187561 ) ( OBJ-AT ?auto_187558 ?auto_187564 ) ( OBJ-AT ?auto_187559 ?auto_187564 ) ( TRUCK-AT ?auto_187563 ?auto_187555 ) ( not ( = ?auto_187559 ?auto_187558 ) ) ( not ( = ?auto_187559 ?auto_187560 ) ) ( not ( = ?auto_187558 ?auto_187560 ) ) ( not ( = ?auto_187561 ?auto_187564 ) ) ( not ( = ?auto_187559 ?auto_187557 ) ) ( not ( = ?auto_187558 ?auto_187557 ) ) ( not ( = ?auto_187560 ?auto_187557 ) ) ( not ( = ?auto_187559 ?auto_187556 ) ) ( not ( = ?auto_187558 ?auto_187556 ) ) ( not ( = ?auto_187560 ?auto_187556 ) ) ( not ( = ?auto_187557 ?auto_187556 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187559 ?auto_187558 ?auto_187560 ?auto_187556 ?auto_187557 ?auto_187555 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187646 - OBJ
      ?auto_187647 - OBJ
      ?auto_187648 - OBJ
      ?auto_187649 - OBJ
      ?auto_187650 - OBJ
      ?auto_187645 - LOCATION
    )
    :vars
    (
      ?auto_187651 - LOCATION
      ?auto_187652 - CITY
      ?auto_187654 - LOCATION
      ?auto_187653 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187651 ?auto_187652 ) ( IN-CITY ?auto_187645 ?auto_187652 ) ( not ( = ?auto_187645 ?auto_187651 ) ) ( OBJ-AT ?auto_187646 ?auto_187651 ) ( IN-CITY ?auto_187654 ?auto_187652 ) ( not ( = ?auto_187645 ?auto_187654 ) ) ( OBJ-AT ?auto_187647 ?auto_187654 ) ( OBJ-AT ?auto_187649 ?auto_187651 ) ( OBJ-AT ?auto_187648 ?auto_187654 ) ( OBJ-AT ?auto_187650 ?auto_187654 ) ( TRUCK-AT ?auto_187653 ?auto_187645 ) ( not ( = ?auto_187650 ?auto_187648 ) ) ( not ( = ?auto_187650 ?auto_187649 ) ) ( not ( = ?auto_187648 ?auto_187649 ) ) ( not ( = ?auto_187651 ?auto_187654 ) ) ( not ( = ?auto_187650 ?auto_187647 ) ) ( not ( = ?auto_187648 ?auto_187647 ) ) ( not ( = ?auto_187649 ?auto_187647 ) ) ( not ( = ?auto_187650 ?auto_187646 ) ) ( not ( = ?auto_187648 ?auto_187646 ) ) ( not ( = ?auto_187649 ?auto_187646 ) ) ( not ( = ?auto_187647 ?auto_187646 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187650 ?auto_187648 ?auto_187649 ?auto_187646 ?auto_187647 ?auto_187645 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187827 - OBJ
      ?auto_187828 - OBJ
      ?auto_187829 - OBJ
      ?auto_187830 - OBJ
      ?auto_187831 - OBJ
      ?auto_187826 - LOCATION
    )
    :vars
    (
      ?auto_187832 - LOCATION
      ?auto_187833 - CITY
      ?auto_187835 - LOCATION
      ?auto_187834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187832 ?auto_187833 ) ( IN-CITY ?auto_187826 ?auto_187833 ) ( not ( = ?auto_187826 ?auto_187832 ) ) ( OBJ-AT ?auto_187827 ?auto_187832 ) ( IN-CITY ?auto_187835 ?auto_187833 ) ( not ( = ?auto_187826 ?auto_187835 ) ) ( OBJ-AT ?auto_187828 ?auto_187835 ) ( OBJ-AT ?auto_187829 ?auto_187832 ) ( OBJ-AT ?auto_187831 ?auto_187835 ) ( OBJ-AT ?auto_187830 ?auto_187835 ) ( TRUCK-AT ?auto_187834 ?auto_187826 ) ( not ( = ?auto_187830 ?auto_187831 ) ) ( not ( = ?auto_187830 ?auto_187829 ) ) ( not ( = ?auto_187831 ?auto_187829 ) ) ( not ( = ?auto_187832 ?auto_187835 ) ) ( not ( = ?auto_187830 ?auto_187828 ) ) ( not ( = ?auto_187831 ?auto_187828 ) ) ( not ( = ?auto_187829 ?auto_187828 ) ) ( not ( = ?auto_187830 ?auto_187827 ) ) ( not ( = ?auto_187831 ?auto_187827 ) ) ( not ( = ?auto_187829 ?auto_187827 ) ) ( not ( = ?auto_187828 ?auto_187827 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187830 ?auto_187831 ?auto_187829 ?auto_187827 ?auto_187828 ?auto_187826 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187870 - OBJ
      ?auto_187871 - OBJ
      ?auto_187872 - OBJ
      ?auto_187873 - OBJ
      ?auto_187874 - OBJ
      ?auto_187869 - LOCATION
    )
    :vars
    (
      ?auto_187875 - LOCATION
      ?auto_187876 - CITY
      ?auto_187878 - LOCATION
      ?auto_187877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187875 ?auto_187876 ) ( IN-CITY ?auto_187869 ?auto_187876 ) ( not ( = ?auto_187869 ?auto_187875 ) ) ( OBJ-AT ?auto_187870 ?auto_187875 ) ( IN-CITY ?auto_187878 ?auto_187876 ) ( not ( = ?auto_187869 ?auto_187878 ) ) ( OBJ-AT ?auto_187871 ?auto_187878 ) ( OBJ-AT ?auto_187872 ?auto_187875 ) ( OBJ-AT ?auto_187873 ?auto_187878 ) ( OBJ-AT ?auto_187874 ?auto_187878 ) ( TRUCK-AT ?auto_187877 ?auto_187869 ) ( not ( = ?auto_187874 ?auto_187873 ) ) ( not ( = ?auto_187874 ?auto_187872 ) ) ( not ( = ?auto_187873 ?auto_187872 ) ) ( not ( = ?auto_187875 ?auto_187878 ) ) ( not ( = ?auto_187874 ?auto_187871 ) ) ( not ( = ?auto_187873 ?auto_187871 ) ) ( not ( = ?auto_187872 ?auto_187871 ) ) ( not ( = ?auto_187874 ?auto_187870 ) ) ( not ( = ?auto_187873 ?auto_187870 ) ) ( not ( = ?auto_187872 ?auto_187870 ) ) ( not ( = ?auto_187871 ?auto_187870 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187874 ?auto_187873 ?auto_187872 ?auto_187870 ?auto_187871 ?auto_187869 ) )
  )

)

