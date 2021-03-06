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
      ?auto_10539 - OBJ
      ?auto_10538 - LOCATION
    )
    :vars
    (
      ?auto_10540 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10540 ?auto_10538 ) ( IN-TRUCK ?auto_10539 ?auto_10540 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10539 ?auto_10540 ?auto_10538 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10551 - OBJ
      ?auto_10550 - LOCATION
    )
    :vars
    (
      ?auto_10552 - TRUCK
      ?auto_10553 - LOCATION
      ?auto_10554 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10551 ?auto_10552 ) ( TRUCK-AT ?auto_10552 ?auto_10553 ) ( IN-CITY ?auto_10553 ?auto_10554 ) ( IN-CITY ?auto_10550 ?auto_10554 ) ( not ( = ?auto_10550 ?auto_10553 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10552 ?auto_10553 ?auto_10550 ?auto_10554 )
      ( DELIVER-1PKG ?auto_10551 ?auto_10550 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10569 - OBJ
      ?auto_10568 - LOCATION
    )
    :vars
    (
      ?auto_10571 - TRUCK
      ?auto_10570 - LOCATION
      ?auto_10572 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10571 ?auto_10570 ) ( IN-CITY ?auto_10570 ?auto_10572 ) ( IN-CITY ?auto_10568 ?auto_10572 ) ( not ( = ?auto_10568 ?auto_10570 ) ) ( OBJ-AT ?auto_10569 ?auto_10570 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10569 ?auto_10571 ?auto_10570 )
      ( DELIVER-1PKG ?auto_10569 ?auto_10568 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10587 - OBJ
      ?auto_10586 - LOCATION
    )
    :vars
    (
      ?auto_10590 - LOCATION
      ?auto_10589 - CITY
      ?auto_10588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10590 ?auto_10589 ) ( IN-CITY ?auto_10586 ?auto_10589 ) ( not ( = ?auto_10586 ?auto_10590 ) ) ( OBJ-AT ?auto_10587 ?auto_10590 ) ( TRUCK-AT ?auto_10588 ?auto_10586 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10588 ?auto_10586 ?auto_10590 ?auto_10589 )
      ( DELIVER-1PKG ?auto_10587 ?auto_10586 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10644 - OBJ
      ?auto_10643 - LOCATION
    )
    :vars
    (
      ?auto_10645 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10645 ?auto_10643 ) ( IN-TRUCK ?auto_10644 ?auto_10645 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10644 ?auto_10645 ?auto_10643 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10647 - OBJ
      ?auto_10648 - OBJ
      ?auto_10646 - LOCATION
    )
    :vars
    (
      ?auto_10649 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10649 ?auto_10646 ) ( IN-TRUCK ?auto_10648 ?auto_10649 ) ( OBJ-AT ?auto_10647 ?auto_10646 ) ( not ( = ?auto_10647 ?auto_10648 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10648 ?auto_10646 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10651 - OBJ
      ?auto_10652 - OBJ
      ?auto_10650 - LOCATION
    )
    :vars
    (
      ?auto_10653 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10653 ?auto_10650 ) ( IN-TRUCK ?auto_10651 ?auto_10653 ) ( OBJ-AT ?auto_10652 ?auto_10650 ) ( not ( = ?auto_10651 ?auto_10652 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10651 ?auto_10650 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10659 - OBJ
      ?auto_10660 - OBJ
      ?auto_10661 - OBJ
      ?auto_10658 - LOCATION
    )
    :vars
    (
      ?auto_10662 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10662 ?auto_10658 ) ( IN-TRUCK ?auto_10661 ?auto_10662 ) ( OBJ-AT ?auto_10659 ?auto_10658 ) ( OBJ-AT ?auto_10660 ?auto_10658 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( not ( = ?auto_10660 ?auto_10661 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10661 ?auto_10658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10664 - OBJ
      ?auto_10665 - OBJ
      ?auto_10666 - OBJ
      ?auto_10663 - LOCATION
    )
    :vars
    (
      ?auto_10667 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10667 ?auto_10663 ) ( IN-TRUCK ?auto_10665 ?auto_10667 ) ( OBJ-AT ?auto_10664 ?auto_10663 ) ( OBJ-AT ?auto_10666 ?auto_10663 ) ( not ( = ?auto_10664 ?auto_10665 ) ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10665 ?auto_10663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10674 - OBJ
      ?auto_10675 - OBJ
      ?auto_10676 - OBJ
      ?auto_10673 - LOCATION
    )
    :vars
    (
      ?auto_10677 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10677 ?auto_10673 ) ( IN-TRUCK ?auto_10674 ?auto_10677 ) ( OBJ-AT ?auto_10675 ?auto_10673 ) ( OBJ-AT ?auto_10676 ?auto_10673 ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10676 ) ) ( not ( = ?auto_10675 ?auto_10676 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10674 ?auto_10673 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10694 - OBJ
      ?auto_10693 - LOCATION
    )
    :vars
    (
      ?auto_10695 - TRUCK
      ?auto_10696 - LOCATION
      ?auto_10697 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10694 ?auto_10695 ) ( TRUCK-AT ?auto_10695 ?auto_10696 ) ( IN-CITY ?auto_10696 ?auto_10697 ) ( IN-CITY ?auto_10693 ?auto_10697 ) ( not ( = ?auto_10693 ?auto_10696 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10695 ?auto_10696 ?auto_10693 ?auto_10697 )
      ( DELIVER-1PKG ?auto_10694 ?auto_10693 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10699 - OBJ
      ?auto_10700 - OBJ
      ?auto_10698 - LOCATION
    )
    :vars
    (
      ?auto_10703 - TRUCK
      ?auto_10701 - LOCATION
      ?auto_10702 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10700 ?auto_10703 ) ( TRUCK-AT ?auto_10703 ?auto_10701 ) ( IN-CITY ?auto_10701 ?auto_10702 ) ( IN-CITY ?auto_10698 ?auto_10702 ) ( not ( = ?auto_10698 ?auto_10701 ) ) ( OBJ-AT ?auto_10699 ?auto_10698 ) ( not ( = ?auto_10699 ?auto_10700 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10700 ?auto_10698 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10705 - OBJ
      ?auto_10706 - OBJ
      ?auto_10704 - LOCATION
    )
    :vars
    (
      ?auto_10708 - TRUCK
      ?auto_10709 - LOCATION
      ?auto_10707 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10705 ?auto_10708 ) ( TRUCK-AT ?auto_10708 ?auto_10709 ) ( IN-CITY ?auto_10709 ?auto_10707 ) ( IN-CITY ?auto_10704 ?auto_10707 ) ( not ( = ?auto_10704 ?auto_10709 ) ) ( OBJ-AT ?auto_10706 ?auto_10704 ) ( not ( = ?auto_10706 ?auto_10705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10706 ?auto_10705 ?auto_10704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10718 - OBJ
      ?auto_10719 - OBJ
      ?auto_10720 - OBJ
      ?auto_10717 - LOCATION
    )
    :vars
    (
      ?auto_10722 - TRUCK
      ?auto_10723 - LOCATION
      ?auto_10721 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10720 ?auto_10722 ) ( TRUCK-AT ?auto_10722 ?auto_10723 ) ( IN-CITY ?auto_10723 ?auto_10721 ) ( IN-CITY ?auto_10717 ?auto_10721 ) ( not ( = ?auto_10717 ?auto_10723 ) ) ( OBJ-AT ?auto_10718 ?auto_10717 ) ( not ( = ?auto_10718 ?auto_10720 ) ) ( OBJ-AT ?auto_10719 ?auto_10717 ) ( not ( = ?auto_10718 ?auto_10719 ) ) ( not ( = ?auto_10719 ?auto_10720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10718 ?auto_10720 ?auto_10717 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10725 - OBJ
      ?auto_10726 - OBJ
      ?auto_10727 - OBJ
      ?auto_10724 - LOCATION
    )
    :vars
    (
      ?auto_10729 - TRUCK
      ?auto_10730 - LOCATION
      ?auto_10728 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10726 ?auto_10729 ) ( TRUCK-AT ?auto_10729 ?auto_10730 ) ( IN-CITY ?auto_10730 ?auto_10728 ) ( IN-CITY ?auto_10724 ?auto_10728 ) ( not ( = ?auto_10724 ?auto_10730 ) ) ( OBJ-AT ?auto_10727 ?auto_10724 ) ( not ( = ?auto_10727 ?auto_10726 ) ) ( OBJ-AT ?auto_10725 ?auto_10724 ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10727 ?auto_10726 ?auto_10724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10739 - OBJ
      ?auto_10740 - OBJ
      ?auto_10741 - OBJ
      ?auto_10738 - LOCATION
    )
    :vars
    (
      ?auto_10743 - TRUCK
      ?auto_10744 - LOCATION
      ?auto_10742 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10739 ?auto_10743 ) ( TRUCK-AT ?auto_10743 ?auto_10744 ) ( IN-CITY ?auto_10744 ?auto_10742 ) ( IN-CITY ?auto_10738 ?auto_10742 ) ( not ( = ?auto_10738 ?auto_10744 ) ) ( OBJ-AT ?auto_10741 ?auto_10738 ) ( not ( = ?auto_10741 ?auto_10739 ) ) ( OBJ-AT ?auto_10740 ?auto_10738 ) ( not ( = ?auto_10739 ?auto_10740 ) ) ( not ( = ?auto_10740 ?auto_10741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10741 ?auto_10739 ?auto_10738 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10768 - OBJ
      ?auto_10767 - LOCATION
    )
    :vars
    (
      ?auto_10770 - TRUCK
      ?auto_10772 - LOCATION
      ?auto_10769 - CITY
      ?auto_10771 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10770 ?auto_10772 ) ( IN-CITY ?auto_10772 ?auto_10769 ) ( IN-CITY ?auto_10767 ?auto_10769 ) ( not ( = ?auto_10767 ?auto_10772 ) ) ( OBJ-AT ?auto_10771 ?auto_10767 ) ( not ( = ?auto_10771 ?auto_10768 ) ) ( OBJ-AT ?auto_10768 ?auto_10772 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10768 ?auto_10770 ?auto_10772 )
      ( DELIVER-2PKG ?auto_10771 ?auto_10768 ?auto_10767 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10774 - OBJ
      ?auto_10775 - OBJ
      ?auto_10773 - LOCATION
    )
    :vars
    (
      ?auto_10777 - TRUCK
      ?auto_10778 - LOCATION
      ?auto_10776 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10777 ?auto_10778 ) ( IN-CITY ?auto_10778 ?auto_10776 ) ( IN-CITY ?auto_10773 ?auto_10776 ) ( not ( = ?auto_10773 ?auto_10778 ) ) ( OBJ-AT ?auto_10774 ?auto_10773 ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( OBJ-AT ?auto_10775 ?auto_10778 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10775 ?auto_10773 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10780 - OBJ
      ?auto_10781 - OBJ
      ?auto_10779 - LOCATION
    )
    :vars
    (
      ?auto_10784 - TRUCK
      ?auto_10783 - LOCATION
      ?auto_10782 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10784 ?auto_10783 ) ( IN-CITY ?auto_10783 ?auto_10782 ) ( IN-CITY ?auto_10779 ?auto_10782 ) ( not ( = ?auto_10779 ?auto_10783 ) ) ( OBJ-AT ?auto_10781 ?auto_10779 ) ( not ( = ?auto_10781 ?auto_10780 ) ) ( OBJ-AT ?auto_10780 ?auto_10783 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10781 ?auto_10780 ?auto_10779 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10793 - OBJ
      ?auto_10794 - OBJ
      ?auto_10795 - OBJ
      ?auto_10792 - LOCATION
    )
    :vars
    (
      ?auto_10798 - TRUCK
      ?auto_10797 - LOCATION
      ?auto_10796 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10798 ?auto_10797 ) ( IN-CITY ?auto_10797 ?auto_10796 ) ( IN-CITY ?auto_10792 ?auto_10796 ) ( not ( = ?auto_10792 ?auto_10797 ) ) ( OBJ-AT ?auto_10793 ?auto_10792 ) ( not ( = ?auto_10793 ?auto_10795 ) ) ( OBJ-AT ?auto_10795 ?auto_10797 ) ( OBJ-AT ?auto_10794 ?auto_10792 ) ( not ( = ?auto_10793 ?auto_10794 ) ) ( not ( = ?auto_10794 ?auto_10795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10793 ?auto_10795 ?auto_10792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10800 - OBJ
      ?auto_10801 - OBJ
      ?auto_10802 - OBJ
      ?auto_10799 - LOCATION
    )
    :vars
    (
      ?auto_10805 - TRUCK
      ?auto_10804 - LOCATION
      ?auto_10803 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10805 ?auto_10804 ) ( IN-CITY ?auto_10804 ?auto_10803 ) ( IN-CITY ?auto_10799 ?auto_10803 ) ( not ( = ?auto_10799 ?auto_10804 ) ) ( OBJ-AT ?auto_10802 ?auto_10799 ) ( not ( = ?auto_10802 ?auto_10801 ) ) ( OBJ-AT ?auto_10801 ?auto_10804 ) ( OBJ-AT ?auto_10800 ?auto_10799 ) ( not ( = ?auto_10800 ?auto_10801 ) ) ( not ( = ?auto_10800 ?auto_10802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10802 ?auto_10801 ?auto_10799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10814 - OBJ
      ?auto_10815 - OBJ
      ?auto_10816 - OBJ
      ?auto_10813 - LOCATION
    )
    :vars
    (
      ?auto_10819 - TRUCK
      ?auto_10818 - LOCATION
      ?auto_10817 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10819 ?auto_10818 ) ( IN-CITY ?auto_10818 ?auto_10817 ) ( IN-CITY ?auto_10813 ?auto_10817 ) ( not ( = ?auto_10813 ?auto_10818 ) ) ( OBJ-AT ?auto_10815 ?auto_10813 ) ( not ( = ?auto_10815 ?auto_10814 ) ) ( OBJ-AT ?auto_10814 ?auto_10818 ) ( OBJ-AT ?auto_10816 ?auto_10813 ) ( not ( = ?auto_10814 ?auto_10816 ) ) ( not ( = ?auto_10815 ?auto_10816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10815 ?auto_10814 ?auto_10813 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10843 - OBJ
      ?auto_10842 - LOCATION
    )
    :vars
    (
      ?auto_10846 - LOCATION
      ?auto_10845 - CITY
      ?auto_10844 - OBJ
      ?auto_10847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10846 ?auto_10845 ) ( IN-CITY ?auto_10842 ?auto_10845 ) ( not ( = ?auto_10842 ?auto_10846 ) ) ( OBJ-AT ?auto_10844 ?auto_10842 ) ( not ( = ?auto_10844 ?auto_10843 ) ) ( OBJ-AT ?auto_10843 ?auto_10846 ) ( TRUCK-AT ?auto_10847 ?auto_10842 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10847 ?auto_10842 ?auto_10846 ?auto_10845 )
      ( DELIVER-2PKG ?auto_10844 ?auto_10843 ?auto_10842 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10849 - OBJ
      ?auto_10850 - OBJ
      ?auto_10848 - LOCATION
    )
    :vars
    (
      ?auto_10851 - LOCATION
      ?auto_10852 - CITY
      ?auto_10853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10851 ?auto_10852 ) ( IN-CITY ?auto_10848 ?auto_10852 ) ( not ( = ?auto_10848 ?auto_10851 ) ) ( OBJ-AT ?auto_10849 ?auto_10848 ) ( not ( = ?auto_10849 ?auto_10850 ) ) ( OBJ-AT ?auto_10850 ?auto_10851 ) ( TRUCK-AT ?auto_10853 ?auto_10848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10850 ?auto_10848 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10855 - OBJ
      ?auto_10856 - OBJ
      ?auto_10854 - LOCATION
    )
    :vars
    (
      ?auto_10858 - LOCATION
      ?auto_10859 - CITY
      ?auto_10857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10858 ?auto_10859 ) ( IN-CITY ?auto_10854 ?auto_10859 ) ( not ( = ?auto_10854 ?auto_10858 ) ) ( OBJ-AT ?auto_10856 ?auto_10854 ) ( not ( = ?auto_10856 ?auto_10855 ) ) ( OBJ-AT ?auto_10855 ?auto_10858 ) ( TRUCK-AT ?auto_10857 ?auto_10854 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10856 ?auto_10855 ?auto_10854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10868 - OBJ
      ?auto_10869 - OBJ
      ?auto_10870 - OBJ
      ?auto_10867 - LOCATION
    )
    :vars
    (
      ?auto_10872 - LOCATION
      ?auto_10873 - CITY
      ?auto_10871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10872 ?auto_10873 ) ( IN-CITY ?auto_10867 ?auto_10873 ) ( not ( = ?auto_10867 ?auto_10872 ) ) ( OBJ-AT ?auto_10869 ?auto_10867 ) ( not ( = ?auto_10869 ?auto_10870 ) ) ( OBJ-AT ?auto_10870 ?auto_10872 ) ( TRUCK-AT ?auto_10871 ?auto_10867 ) ( OBJ-AT ?auto_10868 ?auto_10867 ) ( not ( = ?auto_10868 ?auto_10869 ) ) ( not ( = ?auto_10868 ?auto_10870 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10869 ?auto_10870 ?auto_10867 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10875 - OBJ
      ?auto_10876 - OBJ
      ?auto_10877 - OBJ
      ?auto_10874 - LOCATION
    )
    :vars
    (
      ?auto_10879 - LOCATION
      ?auto_10880 - CITY
      ?auto_10878 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10879 ?auto_10880 ) ( IN-CITY ?auto_10874 ?auto_10880 ) ( not ( = ?auto_10874 ?auto_10879 ) ) ( OBJ-AT ?auto_10875 ?auto_10874 ) ( not ( = ?auto_10875 ?auto_10876 ) ) ( OBJ-AT ?auto_10876 ?auto_10879 ) ( TRUCK-AT ?auto_10878 ?auto_10874 ) ( OBJ-AT ?auto_10877 ?auto_10874 ) ( not ( = ?auto_10875 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10875 ?auto_10876 ?auto_10874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10889 - OBJ
      ?auto_10890 - OBJ
      ?auto_10891 - OBJ
      ?auto_10888 - LOCATION
    )
    :vars
    (
      ?auto_10893 - LOCATION
      ?auto_10894 - CITY
      ?auto_10892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10893 ?auto_10894 ) ( IN-CITY ?auto_10888 ?auto_10894 ) ( not ( = ?auto_10888 ?auto_10893 ) ) ( OBJ-AT ?auto_10890 ?auto_10888 ) ( not ( = ?auto_10890 ?auto_10889 ) ) ( OBJ-AT ?auto_10889 ?auto_10893 ) ( TRUCK-AT ?auto_10892 ?auto_10888 ) ( OBJ-AT ?auto_10891 ?auto_10888 ) ( not ( = ?auto_10889 ?auto_10891 ) ) ( not ( = ?auto_10890 ?auto_10891 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10890 ?auto_10889 ?auto_10888 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10918 - OBJ
      ?auto_10917 - LOCATION
    )
    :vars
    (
      ?auto_10920 - LOCATION
      ?auto_10921 - CITY
      ?auto_10922 - OBJ
      ?auto_10919 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10920 ?auto_10921 ) ( IN-CITY ?auto_10917 ?auto_10921 ) ( not ( = ?auto_10917 ?auto_10920 ) ) ( not ( = ?auto_10922 ?auto_10918 ) ) ( OBJ-AT ?auto_10918 ?auto_10920 ) ( TRUCK-AT ?auto_10919 ?auto_10917 ) ( IN-TRUCK ?auto_10922 ?auto_10919 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10922 ?auto_10917 )
      ( DELIVER-2PKG ?auto_10922 ?auto_10918 ?auto_10917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10924 - OBJ
      ?auto_10925 - OBJ
      ?auto_10923 - LOCATION
    )
    :vars
    (
      ?auto_10926 - LOCATION
      ?auto_10927 - CITY
      ?auto_10928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10926 ?auto_10927 ) ( IN-CITY ?auto_10923 ?auto_10927 ) ( not ( = ?auto_10923 ?auto_10926 ) ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( OBJ-AT ?auto_10925 ?auto_10926 ) ( TRUCK-AT ?auto_10928 ?auto_10923 ) ( IN-TRUCK ?auto_10924 ?auto_10928 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10925 ?auto_10923 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10930 - OBJ
      ?auto_10931 - OBJ
      ?auto_10929 - LOCATION
    )
    :vars
    (
      ?auto_10933 - LOCATION
      ?auto_10932 - CITY
      ?auto_10934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10933 ?auto_10932 ) ( IN-CITY ?auto_10929 ?auto_10932 ) ( not ( = ?auto_10929 ?auto_10933 ) ) ( not ( = ?auto_10931 ?auto_10930 ) ) ( OBJ-AT ?auto_10930 ?auto_10933 ) ( TRUCK-AT ?auto_10934 ?auto_10929 ) ( IN-TRUCK ?auto_10931 ?auto_10934 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10931 ?auto_10930 ?auto_10929 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10993 - OBJ
      ?auto_10992 - LOCATION
    )
    :vars
    (
      ?auto_10996 - LOCATION
      ?auto_10994 - CITY
      ?auto_10995 - OBJ
      ?auto_10997 - TRUCK
      ?auto_10998 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_10996 ?auto_10994 ) ( IN-CITY ?auto_10992 ?auto_10994 ) ( not ( = ?auto_10992 ?auto_10996 ) ) ( not ( = ?auto_10995 ?auto_10993 ) ) ( OBJ-AT ?auto_10993 ?auto_10996 ) ( IN-TRUCK ?auto_10995 ?auto_10997 ) ( TRUCK-AT ?auto_10997 ?auto_10998 ) ( IN-CITY ?auto_10998 ?auto_10994 ) ( not ( = ?auto_10992 ?auto_10998 ) ) ( not ( = ?auto_10996 ?auto_10998 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10997 ?auto_10998 ?auto_10992 ?auto_10994 )
      ( DELIVER-2PKG ?auto_10995 ?auto_10993 ?auto_10992 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11000 - OBJ
      ?auto_11001 - OBJ
      ?auto_10999 - LOCATION
    )
    :vars
    (
      ?auto_11005 - LOCATION
      ?auto_11002 - CITY
      ?auto_11004 - TRUCK
      ?auto_11003 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11005 ?auto_11002 ) ( IN-CITY ?auto_10999 ?auto_11002 ) ( not ( = ?auto_10999 ?auto_11005 ) ) ( not ( = ?auto_11000 ?auto_11001 ) ) ( OBJ-AT ?auto_11001 ?auto_11005 ) ( IN-TRUCK ?auto_11000 ?auto_11004 ) ( TRUCK-AT ?auto_11004 ?auto_11003 ) ( IN-CITY ?auto_11003 ?auto_11002 ) ( not ( = ?auto_10999 ?auto_11003 ) ) ( not ( = ?auto_11005 ?auto_11003 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11001 ?auto_10999 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11007 - OBJ
      ?auto_11008 - OBJ
      ?auto_11006 - LOCATION
    )
    :vars
    (
      ?auto_11012 - LOCATION
      ?auto_11010 - CITY
      ?auto_11009 - TRUCK
      ?auto_11011 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11012 ?auto_11010 ) ( IN-CITY ?auto_11006 ?auto_11010 ) ( not ( = ?auto_11006 ?auto_11012 ) ) ( not ( = ?auto_11008 ?auto_11007 ) ) ( OBJ-AT ?auto_11007 ?auto_11012 ) ( IN-TRUCK ?auto_11008 ?auto_11009 ) ( TRUCK-AT ?auto_11009 ?auto_11011 ) ( IN-CITY ?auto_11011 ?auto_11010 ) ( not ( = ?auto_11006 ?auto_11011 ) ) ( not ( = ?auto_11012 ?auto_11011 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11008 ?auto_11007 ?auto_11006 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11079 - OBJ
      ?auto_11078 - LOCATION
    )
    :vars
    (
      ?auto_11084 - LOCATION
      ?auto_11081 - CITY
      ?auto_11083 - OBJ
      ?auto_11080 - TRUCK
      ?auto_11082 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11084 ?auto_11081 ) ( IN-CITY ?auto_11078 ?auto_11081 ) ( not ( = ?auto_11078 ?auto_11084 ) ) ( not ( = ?auto_11083 ?auto_11079 ) ) ( OBJ-AT ?auto_11079 ?auto_11084 ) ( TRUCK-AT ?auto_11080 ?auto_11082 ) ( IN-CITY ?auto_11082 ?auto_11081 ) ( not ( = ?auto_11078 ?auto_11082 ) ) ( not ( = ?auto_11084 ?auto_11082 ) ) ( OBJ-AT ?auto_11083 ?auto_11082 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11083 ?auto_11080 ?auto_11082 )
      ( DELIVER-2PKG ?auto_11083 ?auto_11079 ?auto_11078 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11086 - OBJ
      ?auto_11087 - OBJ
      ?auto_11085 - LOCATION
    )
    :vars
    (
      ?auto_11088 - LOCATION
      ?auto_11090 - CITY
      ?auto_11089 - TRUCK
      ?auto_11091 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11088 ?auto_11090 ) ( IN-CITY ?auto_11085 ?auto_11090 ) ( not ( = ?auto_11085 ?auto_11088 ) ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( OBJ-AT ?auto_11087 ?auto_11088 ) ( TRUCK-AT ?auto_11089 ?auto_11091 ) ( IN-CITY ?auto_11091 ?auto_11090 ) ( not ( = ?auto_11085 ?auto_11091 ) ) ( not ( = ?auto_11088 ?auto_11091 ) ) ( OBJ-AT ?auto_11086 ?auto_11091 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11087 ?auto_11085 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11093 - OBJ
      ?auto_11094 - OBJ
      ?auto_11092 - LOCATION
    )
    :vars
    (
      ?auto_11097 - LOCATION
      ?auto_11096 - CITY
      ?auto_11098 - TRUCK
      ?auto_11095 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11097 ?auto_11096 ) ( IN-CITY ?auto_11092 ?auto_11096 ) ( not ( = ?auto_11092 ?auto_11097 ) ) ( not ( = ?auto_11094 ?auto_11093 ) ) ( OBJ-AT ?auto_11093 ?auto_11097 ) ( TRUCK-AT ?auto_11098 ?auto_11095 ) ( IN-CITY ?auto_11095 ?auto_11096 ) ( not ( = ?auto_11092 ?auto_11095 ) ) ( not ( = ?auto_11097 ?auto_11095 ) ) ( OBJ-AT ?auto_11094 ?auto_11095 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11094 ?auto_11093 ?auto_11092 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11165 - OBJ
      ?auto_11164 - LOCATION
    )
    :vars
    (
      ?auto_11169 - LOCATION
      ?auto_11168 - CITY
      ?auto_11167 - OBJ
      ?auto_11166 - LOCATION
      ?auto_11170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11169 ?auto_11168 ) ( IN-CITY ?auto_11164 ?auto_11168 ) ( not ( = ?auto_11164 ?auto_11169 ) ) ( not ( = ?auto_11167 ?auto_11165 ) ) ( OBJ-AT ?auto_11165 ?auto_11169 ) ( IN-CITY ?auto_11166 ?auto_11168 ) ( not ( = ?auto_11164 ?auto_11166 ) ) ( not ( = ?auto_11169 ?auto_11166 ) ) ( OBJ-AT ?auto_11167 ?auto_11166 ) ( TRUCK-AT ?auto_11170 ?auto_11164 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11170 ?auto_11164 ?auto_11166 ?auto_11168 )
      ( DELIVER-2PKG ?auto_11167 ?auto_11165 ?auto_11164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11172 - OBJ
      ?auto_11173 - OBJ
      ?auto_11171 - LOCATION
    )
    :vars
    (
      ?auto_11174 - LOCATION
      ?auto_11176 - CITY
      ?auto_11175 - LOCATION
      ?auto_11177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11174 ?auto_11176 ) ( IN-CITY ?auto_11171 ?auto_11176 ) ( not ( = ?auto_11171 ?auto_11174 ) ) ( not ( = ?auto_11172 ?auto_11173 ) ) ( OBJ-AT ?auto_11173 ?auto_11174 ) ( IN-CITY ?auto_11175 ?auto_11176 ) ( not ( = ?auto_11171 ?auto_11175 ) ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( OBJ-AT ?auto_11172 ?auto_11175 ) ( TRUCK-AT ?auto_11177 ?auto_11171 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11173 ?auto_11171 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11179 - OBJ
      ?auto_11180 - OBJ
      ?auto_11178 - LOCATION
    )
    :vars
    (
      ?auto_11182 - LOCATION
      ?auto_11183 - CITY
      ?auto_11184 - LOCATION
      ?auto_11181 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11182 ?auto_11183 ) ( IN-CITY ?auto_11178 ?auto_11183 ) ( not ( = ?auto_11178 ?auto_11182 ) ) ( not ( = ?auto_11180 ?auto_11179 ) ) ( OBJ-AT ?auto_11179 ?auto_11182 ) ( IN-CITY ?auto_11184 ?auto_11183 ) ( not ( = ?auto_11178 ?auto_11184 ) ) ( not ( = ?auto_11182 ?auto_11184 ) ) ( OBJ-AT ?auto_11180 ?auto_11184 ) ( TRUCK-AT ?auto_11181 ?auto_11178 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11180 ?auto_11179 ?auto_11178 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11344 - OBJ
      ?auto_11343 - LOCATION
    )
    :vars
    (
      ?auto_11345 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11345 ?auto_11343 ) ( IN-TRUCK ?auto_11344 ?auto_11345 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_11344 ?auto_11345 ?auto_11343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11347 - OBJ
      ?auto_11348 - OBJ
      ?auto_11346 - LOCATION
    )
    :vars
    (
      ?auto_11349 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11349 ?auto_11346 ) ( IN-TRUCK ?auto_11348 ?auto_11349 ) ( OBJ-AT ?auto_11347 ?auto_11346 ) ( not ( = ?auto_11347 ?auto_11348 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11348 ?auto_11346 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11351 - OBJ
      ?auto_11352 - OBJ
      ?auto_11350 - LOCATION
    )
    :vars
    (
      ?auto_11353 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11353 ?auto_11350 ) ( IN-TRUCK ?auto_11352 ?auto_11353 ) ( OBJ-AT ?auto_11351 ?auto_11350 ) ( not ( = ?auto_11351 ?auto_11352 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11352 ?auto_11350 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11355 - OBJ
      ?auto_11356 - OBJ
      ?auto_11354 - LOCATION
    )
    :vars
    (
      ?auto_11357 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11357 ?auto_11354 ) ( IN-TRUCK ?auto_11355 ?auto_11357 ) ( OBJ-AT ?auto_11356 ?auto_11354 ) ( not ( = ?auto_11355 ?auto_11356 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11355 ?auto_11354 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11359 - OBJ
      ?auto_11360 - OBJ
      ?auto_11358 - LOCATION
    )
    :vars
    (
      ?auto_11361 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11361 ?auto_11358 ) ( IN-TRUCK ?auto_11359 ?auto_11361 ) ( OBJ-AT ?auto_11360 ?auto_11358 ) ( not ( = ?auto_11359 ?auto_11360 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11359 ?auto_11358 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11367 - OBJ
      ?auto_11368 - OBJ
      ?auto_11369 - OBJ
      ?auto_11366 - LOCATION
    )
    :vars
    (
      ?auto_11370 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11370 ?auto_11366 ) ( IN-TRUCK ?auto_11369 ?auto_11370 ) ( OBJ-AT ?auto_11367 ?auto_11366 ) ( OBJ-AT ?auto_11368 ?auto_11366 ) ( not ( = ?auto_11367 ?auto_11368 ) ) ( not ( = ?auto_11367 ?auto_11369 ) ) ( not ( = ?auto_11368 ?auto_11369 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11369 ?auto_11366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11372 - OBJ
      ?auto_11373 - OBJ
      ?auto_11374 - OBJ
      ?auto_11371 - LOCATION
    )
    :vars
    (
      ?auto_11375 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11375 ?auto_11371 ) ( IN-TRUCK ?auto_11374 ?auto_11375 ) ( OBJ-AT ?auto_11372 ?auto_11371 ) ( OBJ-AT ?auto_11373 ?auto_11371 ) ( not ( = ?auto_11372 ?auto_11373 ) ) ( not ( = ?auto_11372 ?auto_11374 ) ) ( not ( = ?auto_11373 ?auto_11374 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11374 ?auto_11371 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11377 - OBJ
      ?auto_11378 - OBJ
      ?auto_11379 - OBJ
      ?auto_11376 - LOCATION
    )
    :vars
    (
      ?auto_11380 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11380 ?auto_11376 ) ( IN-TRUCK ?auto_11378 ?auto_11380 ) ( OBJ-AT ?auto_11377 ?auto_11376 ) ( OBJ-AT ?auto_11379 ?auto_11376 ) ( not ( = ?auto_11377 ?auto_11378 ) ) ( not ( = ?auto_11377 ?auto_11379 ) ) ( not ( = ?auto_11378 ?auto_11379 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11378 ?auto_11376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11382 - OBJ
      ?auto_11383 - OBJ
      ?auto_11384 - OBJ
      ?auto_11381 - LOCATION
    )
    :vars
    (
      ?auto_11385 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11385 ?auto_11381 ) ( IN-TRUCK ?auto_11383 ?auto_11385 ) ( OBJ-AT ?auto_11382 ?auto_11381 ) ( OBJ-AT ?auto_11384 ?auto_11381 ) ( not ( = ?auto_11382 ?auto_11383 ) ) ( not ( = ?auto_11382 ?auto_11384 ) ) ( not ( = ?auto_11383 ?auto_11384 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11383 ?auto_11381 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11392 - OBJ
      ?auto_11393 - OBJ
      ?auto_11394 - OBJ
      ?auto_11391 - LOCATION
    )
    :vars
    (
      ?auto_11395 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11395 ?auto_11391 ) ( IN-TRUCK ?auto_11394 ?auto_11395 ) ( OBJ-AT ?auto_11392 ?auto_11391 ) ( OBJ-AT ?auto_11393 ?auto_11391 ) ( not ( = ?auto_11392 ?auto_11393 ) ) ( not ( = ?auto_11392 ?auto_11394 ) ) ( not ( = ?auto_11393 ?auto_11394 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11394 ?auto_11391 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11397 - OBJ
      ?auto_11398 - OBJ
      ?auto_11399 - OBJ
      ?auto_11396 - LOCATION
    )
    :vars
    (
      ?auto_11400 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11400 ?auto_11396 ) ( IN-TRUCK ?auto_11399 ?auto_11400 ) ( OBJ-AT ?auto_11397 ?auto_11396 ) ( OBJ-AT ?auto_11398 ?auto_11396 ) ( not ( = ?auto_11397 ?auto_11398 ) ) ( not ( = ?auto_11397 ?auto_11399 ) ) ( not ( = ?auto_11398 ?auto_11399 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11399 ?auto_11396 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11402 - OBJ
      ?auto_11403 - OBJ
      ?auto_11404 - OBJ
      ?auto_11401 - LOCATION
    )
    :vars
    (
      ?auto_11405 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11405 ?auto_11401 ) ( IN-TRUCK ?auto_11403 ?auto_11405 ) ( OBJ-AT ?auto_11402 ?auto_11401 ) ( OBJ-AT ?auto_11404 ?auto_11401 ) ( not ( = ?auto_11402 ?auto_11403 ) ) ( not ( = ?auto_11402 ?auto_11404 ) ) ( not ( = ?auto_11403 ?auto_11404 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11403 ?auto_11401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11407 - OBJ
      ?auto_11408 - OBJ
      ?auto_11409 - OBJ
      ?auto_11406 - LOCATION
    )
    :vars
    (
      ?auto_11410 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11410 ?auto_11406 ) ( IN-TRUCK ?auto_11408 ?auto_11410 ) ( OBJ-AT ?auto_11407 ?auto_11406 ) ( OBJ-AT ?auto_11409 ?auto_11406 ) ( not ( = ?auto_11407 ?auto_11408 ) ) ( not ( = ?auto_11407 ?auto_11409 ) ) ( not ( = ?auto_11408 ?auto_11409 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11408 ?auto_11406 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11417 - OBJ
      ?auto_11418 - OBJ
      ?auto_11419 - OBJ
      ?auto_11416 - LOCATION
    )
    :vars
    (
      ?auto_11420 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11420 ?auto_11416 ) ( IN-TRUCK ?auto_11417 ?auto_11420 ) ( OBJ-AT ?auto_11418 ?auto_11416 ) ( OBJ-AT ?auto_11419 ?auto_11416 ) ( not ( = ?auto_11417 ?auto_11418 ) ) ( not ( = ?auto_11417 ?auto_11419 ) ) ( not ( = ?auto_11418 ?auto_11419 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11417 ?auto_11416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11422 - OBJ
      ?auto_11423 - OBJ
      ?auto_11424 - OBJ
      ?auto_11421 - LOCATION
    )
    :vars
    (
      ?auto_11425 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11425 ?auto_11421 ) ( IN-TRUCK ?auto_11422 ?auto_11425 ) ( OBJ-AT ?auto_11423 ?auto_11421 ) ( OBJ-AT ?auto_11424 ?auto_11421 ) ( not ( = ?auto_11422 ?auto_11423 ) ) ( not ( = ?auto_11422 ?auto_11424 ) ) ( not ( = ?auto_11423 ?auto_11424 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11422 ?auto_11421 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11432 - OBJ
      ?auto_11433 - OBJ
      ?auto_11434 - OBJ
      ?auto_11431 - LOCATION
    )
    :vars
    (
      ?auto_11435 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11435 ?auto_11431 ) ( IN-TRUCK ?auto_11432 ?auto_11435 ) ( OBJ-AT ?auto_11433 ?auto_11431 ) ( OBJ-AT ?auto_11434 ?auto_11431 ) ( not ( = ?auto_11432 ?auto_11433 ) ) ( not ( = ?auto_11432 ?auto_11434 ) ) ( not ( = ?auto_11433 ?auto_11434 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11432 ?auto_11431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11437 - OBJ
      ?auto_11438 - OBJ
      ?auto_11439 - OBJ
      ?auto_11436 - LOCATION
    )
    :vars
    (
      ?auto_11440 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11440 ?auto_11436 ) ( IN-TRUCK ?auto_11437 ?auto_11440 ) ( OBJ-AT ?auto_11438 ?auto_11436 ) ( OBJ-AT ?auto_11439 ?auto_11436 ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( not ( = ?auto_11438 ?auto_11439 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11437 ?auto_11436 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11462 - OBJ
      ?auto_11461 - LOCATION
    )
    :vars
    (
      ?auto_11463 - TRUCK
      ?auto_11464 - LOCATION
      ?auto_11465 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11462 ?auto_11463 ) ( TRUCK-AT ?auto_11463 ?auto_11464 ) ( IN-CITY ?auto_11464 ?auto_11465 ) ( IN-CITY ?auto_11461 ?auto_11465 ) ( not ( = ?auto_11461 ?auto_11464 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11463 ?auto_11464 ?auto_11461 ?auto_11465 )
      ( DELIVER-1PKG ?auto_11462 ?auto_11461 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11467 - OBJ
      ?auto_11468 - OBJ
      ?auto_11466 - LOCATION
    )
    :vars
    (
      ?auto_11471 - TRUCK
      ?auto_11469 - LOCATION
      ?auto_11470 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11468 ?auto_11471 ) ( TRUCK-AT ?auto_11471 ?auto_11469 ) ( IN-CITY ?auto_11469 ?auto_11470 ) ( IN-CITY ?auto_11466 ?auto_11470 ) ( not ( = ?auto_11466 ?auto_11469 ) ) ( OBJ-AT ?auto_11467 ?auto_11466 ) ( not ( = ?auto_11467 ?auto_11468 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11468 ?auto_11466 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11473 - OBJ
      ?auto_11474 - OBJ
      ?auto_11472 - LOCATION
    )
    :vars
    (
      ?auto_11476 - TRUCK
      ?auto_11477 - LOCATION
      ?auto_11475 - CITY
      ?auto_11478 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11474 ?auto_11476 ) ( TRUCK-AT ?auto_11476 ?auto_11477 ) ( IN-CITY ?auto_11477 ?auto_11475 ) ( IN-CITY ?auto_11472 ?auto_11475 ) ( not ( = ?auto_11472 ?auto_11477 ) ) ( OBJ-AT ?auto_11478 ?auto_11472 ) ( not ( = ?auto_11478 ?auto_11474 ) ) ( OBJ-AT ?auto_11473 ?auto_11472 ) ( not ( = ?auto_11473 ?auto_11474 ) ) ( not ( = ?auto_11473 ?auto_11478 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11478 ?auto_11474 ?auto_11472 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11480 - OBJ
      ?auto_11481 - OBJ
      ?auto_11479 - LOCATION
    )
    :vars
    (
      ?auto_11483 - TRUCK
      ?auto_11484 - LOCATION
      ?auto_11482 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11480 ?auto_11483 ) ( TRUCK-AT ?auto_11483 ?auto_11484 ) ( IN-CITY ?auto_11484 ?auto_11482 ) ( IN-CITY ?auto_11479 ?auto_11482 ) ( not ( = ?auto_11479 ?auto_11484 ) ) ( OBJ-AT ?auto_11481 ?auto_11479 ) ( not ( = ?auto_11481 ?auto_11480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11481 ?auto_11480 ?auto_11479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11486 - OBJ
      ?auto_11487 - OBJ
      ?auto_11485 - LOCATION
    )
    :vars
    (
      ?auto_11489 - TRUCK
      ?auto_11490 - LOCATION
      ?auto_11488 - CITY
      ?auto_11491 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11486 ?auto_11489 ) ( TRUCK-AT ?auto_11489 ?auto_11490 ) ( IN-CITY ?auto_11490 ?auto_11488 ) ( IN-CITY ?auto_11485 ?auto_11488 ) ( not ( = ?auto_11485 ?auto_11490 ) ) ( OBJ-AT ?auto_11491 ?auto_11485 ) ( not ( = ?auto_11491 ?auto_11486 ) ) ( OBJ-AT ?auto_11487 ?auto_11485 ) ( not ( = ?auto_11486 ?auto_11487 ) ) ( not ( = ?auto_11487 ?auto_11491 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11491 ?auto_11486 ?auto_11485 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11500 - OBJ
      ?auto_11501 - OBJ
      ?auto_11502 - OBJ
      ?auto_11499 - LOCATION
    )
    :vars
    (
      ?auto_11504 - TRUCK
      ?auto_11505 - LOCATION
      ?auto_11503 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11502 ?auto_11504 ) ( TRUCK-AT ?auto_11504 ?auto_11505 ) ( IN-CITY ?auto_11505 ?auto_11503 ) ( IN-CITY ?auto_11499 ?auto_11503 ) ( not ( = ?auto_11499 ?auto_11505 ) ) ( OBJ-AT ?auto_11500 ?auto_11499 ) ( not ( = ?auto_11500 ?auto_11502 ) ) ( OBJ-AT ?auto_11501 ?auto_11499 ) ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11501 ?auto_11502 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11500 ?auto_11502 ?auto_11499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11507 - OBJ
      ?auto_11508 - OBJ
      ?auto_11509 - OBJ
      ?auto_11506 - LOCATION
    )
    :vars
    (
      ?auto_11511 - TRUCK
      ?auto_11512 - LOCATION
      ?auto_11510 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11509 ?auto_11511 ) ( TRUCK-AT ?auto_11511 ?auto_11512 ) ( IN-CITY ?auto_11512 ?auto_11510 ) ( IN-CITY ?auto_11506 ?auto_11510 ) ( not ( = ?auto_11506 ?auto_11512 ) ) ( OBJ-AT ?auto_11507 ?auto_11506 ) ( not ( = ?auto_11507 ?auto_11509 ) ) ( OBJ-AT ?auto_11508 ?auto_11506 ) ( not ( = ?auto_11507 ?auto_11508 ) ) ( not ( = ?auto_11508 ?auto_11509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11507 ?auto_11509 ?auto_11506 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11514 - OBJ
      ?auto_11515 - OBJ
      ?auto_11516 - OBJ
      ?auto_11513 - LOCATION
    )
    :vars
    (
      ?auto_11518 - TRUCK
      ?auto_11519 - LOCATION
      ?auto_11517 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11515 ?auto_11518 ) ( TRUCK-AT ?auto_11518 ?auto_11519 ) ( IN-CITY ?auto_11519 ?auto_11517 ) ( IN-CITY ?auto_11513 ?auto_11517 ) ( not ( = ?auto_11513 ?auto_11519 ) ) ( OBJ-AT ?auto_11516 ?auto_11513 ) ( not ( = ?auto_11516 ?auto_11515 ) ) ( OBJ-AT ?auto_11514 ?auto_11513 ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( not ( = ?auto_11514 ?auto_11516 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11516 ?auto_11515 ?auto_11513 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11521 - OBJ
      ?auto_11522 - OBJ
      ?auto_11523 - OBJ
      ?auto_11520 - LOCATION
    )
    :vars
    (
      ?auto_11525 - TRUCK
      ?auto_11526 - LOCATION
      ?auto_11524 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11522 ?auto_11525 ) ( TRUCK-AT ?auto_11525 ?auto_11526 ) ( IN-CITY ?auto_11526 ?auto_11524 ) ( IN-CITY ?auto_11520 ?auto_11524 ) ( not ( = ?auto_11520 ?auto_11526 ) ) ( OBJ-AT ?auto_11521 ?auto_11520 ) ( not ( = ?auto_11521 ?auto_11522 ) ) ( OBJ-AT ?auto_11523 ?auto_11520 ) ( not ( = ?auto_11521 ?auto_11523 ) ) ( not ( = ?auto_11522 ?auto_11523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11521 ?auto_11522 ?auto_11520 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11535 - OBJ
      ?auto_11536 - OBJ
      ?auto_11537 - OBJ
      ?auto_11534 - LOCATION
    )
    :vars
    (
      ?auto_11539 - TRUCK
      ?auto_11540 - LOCATION
      ?auto_11538 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11537 ?auto_11539 ) ( TRUCK-AT ?auto_11539 ?auto_11540 ) ( IN-CITY ?auto_11540 ?auto_11538 ) ( IN-CITY ?auto_11534 ?auto_11538 ) ( not ( = ?auto_11534 ?auto_11540 ) ) ( OBJ-AT ?auto_11536 ?auto_11534 ) ( not ( = ?auto_11536 ?auto_11537 ) ) ( OBJ-AT ?auto_11535 ?auto_11534 ) ( not ( = ?auto_11535 ?auto_11536 ) ) ( not ( = ?auto_11535 ?auto_11537 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11536 ?auto_11537 ?auto_11534 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11542 - OBJ
      ?auto_11543 - OBJ
      ?auto_11544 - OBJ
      ?auto_11541 - LOCATION
    )
    :vars
    (
      ?auto_11546 - TRUCK
      ?auto_11547 - LOCATION
      ?auto_11545 - CITY
      ?auto_11548 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11544 ?auto_11546 ) ( TRUCK-AT ?auto_11546 ?auto_11547 ) ( IN-CITY ?auto_11547 ?auto_11545 ) ( IN-CITY ?auto_11541 ?auto_11545 ) ( not ( = ?auto_11541 ?auto_11547 ) ) ( OBJ-AT ?auto_11548 ?auto_11541 ) ( not ( = ?auto_11548 ?auto_11544 ) ) ( OBJ-AT ?auto_11542 ?auto_11541 ) ( OBJ-AT ?auto_11543 ?auto_11541 ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( not ( = ?auto_11542 ?auto_11544 ) ) ( not ( = ?auto_11542 ?auto_11548 ) ) ( not ( = ?auto_11543 ?auto_11544 ) ) ( not ( = ?auto_11543 ?auto_11548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11548 ?auto_11544 ?auto_11541 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11550 - OBJ
      ?auto_11551 - OBJ
      ?auto_11552 - OBJ
      ?auto_11549 - LOCATION
    )
    :vars
    (
      ?auto_11554 - TRUCK
      ?auto_11555 - LOCATION
      ?auto_11553 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11551 ?auto_11554 ) ( TRUCK-AT ?auto_11554 ?auto_11555 ) ( IN-CITY ?auto_11555 ?auto_11553 ) ( IN-CITY ?auto_11549 ?auto_11553 ) ( not ( = ?auto_11549 ?auto_11555 ) ) ( OBJ-AT ?auto_11552 ?auto_11549 ) ( not ( = ?auto_11552 ?auto_11551 ) ) ( OBJ-AT ?auto_11550 ?auto_11549 ) ( not ( = ?auto_11550 ?auto_11551 ) ) ( not ( = ?auto_11550 ?auto_11552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11552 ?auto_11551 ?auto_11549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11557 - OBJ
      ?auto_11558 - OBJ
      ?auto_11559 - OBJ
      ?auto_11556 - LOCATION
    )
    :vars
    (
      ?auto_11561 - TRUCK
      ?auto_11562 - LOCATION
      ?auto_11560 - CITY
      ?auto_11563 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11558 ?auto_11561 ) ( TRUCK-AT ?auto_11561 ?auto_11562 ) ( IN-CITY ?auto_11562 ?auto_11560 ) ( IN-CITY ?auto_11556 ?auto_11560 ) ( not ( = ?auto_11556 ?auto_11562 ) ) ( OBJ-AT ?auto_11563 ?auto_11556 ) ( not ( = ?auto_11563 ?auto_11558 ) ) ( OBJ-AT ?auto_11557 ?auto_11556 ) ( OBJ-AT ?auto_11559 ?auto_11556 ) ( not ( = ?auto_11557 ?auto_11558 ) ) ( not ( = ?auto_11557 ?auto_11559 ) ) ( not ( = ?auto_11557 ?auto_11563 ) ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11559 ?auto_11563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11563 ?auto_11558 ?auto_11556 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11573 - OBJ
      ?auto_11574 - OBJ
      ?auto_11575 - OBJ
      ?auto_11572 - LOCATION
    )
    :vars
    (
      ?auto_11577 - TRUCK
      ?auto_11578 - LOCATION
      ?auto_11576 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11573 ?auto_11577 ) ( TRUCK-AT ?auto_11577 ?auto_11578 ) ( IN-CITY ?auto_11578 ?auto_11576 ) ( IN-CITY ?auto_11572 ?auto_11576 ) ( not ( = ?auto_11572 ?auto_11578 ) ) ( OBJ-AT ?auto_11574 ?auto_11572 ) ( not ( = ?auto_11574 ?auto_11573 ) ) ( OBJ-AT ?auto_11575 ?auto_11572 ) ( not ( = ?auto_11573 ?auto_11575 ) ) ( not ( = ?auto_11574 ?auto_11575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11574 ?auto_11573 ?auto_11572 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11580 - OBJ
      ?auto_11581 - OBJ
      ?auto_11582 - OBJ
      ?auto_11579 - LOCATION
    )
    :vars
    (
      ?auto_11584 - TRUCK
      ?auto_11585 - LOCATION
      ?auto_11583 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11580 ?auto_11584 ) ( TRUCK-AT ?auto_11584 ?auto_11585 ) ( IN-CITY ?auto_11585 ?auto_11583 ) ( IN-CITY ?auto_11579 ?auto_11583 ) ( not ( = ?auto_11579 ?auto_11585 ) ) ( OBJ-AT ?auto_11581 ?auto_11579 ) ( not ( = ?auto_11581 ?auto_11580 ) ) ( OBJ-AT ?auto_11582 ?auto_11579 ) ( not ( = ?auto_11580 ?auto_11582 ) ) ( not ( = ?auto_11581 ?auto_11582 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11581 ?auto_11580 ?auto_11579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11594 - OBJ
      ?auto_11595 - OBJ
      ?auto_11596 - OBJ
      ?auto_11593 - LOCATION
    )
    :vars
    (
      ?auto_11598 - TRUCK
      ?auto_11599 - LOCATION
      ?auto_11597 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11594 ?auto_11598 ) ( TRUCK-AT ?auto_11598 ?auto_11599 ) ( IN-CITY ?auto_11599 ?auto_11597 ) ( IN-CITY ?auto_11593 ?auto_11597 ) ( not ( = ?auto_11593 ?auto_11599 ) ) ( OBJ-AT ?auto_11596 ?auto_11593 ) ( not ( = ?auto_11596 ?auto_11594 ) ) ( OBJ-AT ?auto_11595 ?auto_11593 ) ( not ( = ?auto_11594 ?auto_11595 ) ) ( not ( = ?auto_11595 ?auto_11596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11596 ?auto_11594 ?auto_11593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11601 - OBJ
      ?auto_11602 - OBJ
      ?auto_11603 - OBJ
      ?auto_11600 - LOCATION
    )
    :vars
    (
      ?auto_11605 - TRUCK
      ?auto_11606 - LOCATION
      ?auto_11604 - CITY
      ?auto_11607 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11601 ?auto_11605 ) ( TRUCK-AT ?auto_11605 ?auto_11606 ) ( IN-CITY ?auto_11606 ?auto_11604 ) ( IN-CITY ?auto_11600 ?auto_11604 ) ( not ( = ?auto_11600 ?auto_11606 ) ) ( OBJ-AT ?auto_11607 ?auto_11600 ) ( not ( = ?auto_11607 ?auto_11601 ) ) ( OBJ-AT ?auto_11602 ?auto_11600 ) ( OBJ-AT ?auto_11603 ?auto_11600 ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11607 ) ) ( not ( = ?auto_11603 ?auto_11607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11607 ?auto_11601 ?auto_11600 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11640 - OBJ
      ?auto_11639 - LOCATION
    )
    :vars
    (
      ?auto_11642 - TRUCK
      ?auto_11643 - LOCATION
      ?auto_11641 - CITY
      ?auto_11644 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11642 ?auto_11643 ) ( IN-CITY ?auto_11643 ?auto_11641 ) ( IN-CITY ?auto_11639 ?auto_11641 ) ( not ( = ?auto_11639 ?auto_11643 ) ) ( OBJ-AT ?auto_11644 ?auto_11639 ) ( not ( = ?auto_11644 ?auto_11640 ) ) ( OBJ-AT ?auto_11640 ?auto_11643 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11640 ?auto_11642 ?auto_11643 )
      ( DELIVER-2PKG ?auto_11644 ?auto_11640 ?auto_11639 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11646 - OBJ
      ?auto_11647 - OBJ
      ?auto_11645 - LOCATION
    )
    :vars
    (
      ?auto_11650 - TRUCK
      ?auto_11649 - LOCATION
      ?auto_11648 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11650 ?auto_11649 ) ( IN-CITY ?auto_11649 ?auto_11648 ) ( IN-CITY ?auto_11645 ?auto_11648 ) ( not ( = ?auto_11645 ?auto_11649 ) ) ( OBJ-AT ?auto_11646 ?auto_11645 ) ( not ( = ?auto_11646 ?auto_11647 ) ) ( OBJ-AT ?auto_11647 ?auto_11649 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11647 ?auto_11645 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11652 - OBJ
      ?auto_11653 - OBJ
      ?auto_11651 - LOCATION
    )
    :vars
    (
      ?auto_11655 - TRUCK
      ?auto_11654 - LOCATION
      ?auto_11656 - CITY
      ?auto_11657 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11655 ?auto_11654 ) ( IN-CITY ?auto_11654 ?auto_11656 ) ( IN-CITY ?auto_11651 ?auto_11656 ) ( not ( = ?auto_11651 ?auto_11654 ) ) ( OBJ-AT ?auto_11657 ?auto_11651 ) ( not ( = ?auto_11657 ?auto_11653 ) ) ( OBJ-AT ?auto_11653 ?auto_11654 ) ( OBJ-AT ?auto_11652 ?auto_11651 ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11657 ?auto_11653 ?auto_11651 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11659 - OBJ
      ?auto_11660 - OBJ
      ?auto_11658 - LOCATION
    )
    :vars
    (
      ?auto_11662 - TRUCK
      ?auto_11661 - LOCATION
      ?auto_11663 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11662 ?auto_11661 ) ( IN-CITY ?auto_11661 ?auto_11663 ) ( IN-CITY ?auto_11658 ?auto_11663 ) ( not ( = ?auto_11658 ?auto_11661 ) ) ( OBJ-AT ?auto_11660 ?auto_11658 ) ( not ( = ?auto_11660 ?auto_11659 ) ) ( OBJ-AT ?auto_11659 ?auto_11661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11660 ?auto_11659 ?auto_11658 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11665 - OBJ
      ?auto_11666 - OBJ
      ?auto_11664 - LOCATION
    )
    :vars
    (
      ?auto_11668 - TRUCK
      ?auto_11667 - LOCATION
      ?auto_11669 - CITY
      ?auto_11670 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11668 ?auto_11667 ) ( IN-CITY ?auto_11667 ?auto_11669 ) ( IN-CITY ?auto_11664 ?auto_11669 ) ( not ( = ?auto_11664 ?auto_11667 ) ) ( OBJ-AT ?auto_11670 ?auto_11664 ) ( not ( = ?auto_11670 ?auto_11665 ) ) ( OBJ-AT ?auto_11665 ?auto_11667 ) ( OBJ-AT ?auto_11666 ?auto_11664 ) ( not ( = ?auto_11665 ?auto_11666 ) ) ( not ( = ?auto_11666 ?auto_11670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11670 ?auto_11665 ?auto_11664 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11679 - OBJ
      ?auto_11680 - OBJ
      ?auto_11681 - OBJ
      ?auto_11678 - LOCATION
    )
    :vars
    (
      ?auto_11683 - TRUCK
      ?auto_11682 - LOCATION
      ?auto_11684 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11683 ?auto_11682 ) ( IN-CITY ?auto_11682 ?auto_11684 ) ( IN-CITY ?auto_11678 ?auto_11684 ) ( not ( = ?auto_11678 ?auto_11682 ) ) ( OBJ-AT ?auto_11679 ?auto_11678 ) ( not ( = ?auto_11679 ?auto_11681 ) ) ( OBJ-AT ?auto_11681 ?auto_11682 ) ( OBJ-AT ?auto_11680 ?auto_11678 ) ( not ( = ?auto_11679 ?auto_11680 ) ) ( not ( = ?auto_11680 ?auto_11681 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11679 ?auto_11681 ?auto_11678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11686 - OBJ
      ?auto_11687 - OBJ
      ?auto_11688 - OBJ
      ?auto_11685 - LOCATION
    )
    :vars
    (
      ?auto_11690 - TRUCK
      ?auto_11689 - LOCATION
      ?auto_11691 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11690 ?auto_11689 ) ( IN-CITY ?auto_11689 ?auto_11691 ) ( IN-CITY ?auto_11685 ?auto_11691 ) ( not ( = ?auto_11685 ?auto_11689 ) ) ( OBJ-AT ?auto_11686 ?auto_11685 ) ( not ( = ?auto_11686 ?auto_11688 ) ) ( OBJ-AT ?auto_11688 ?auto_11689 ) ( OBJ-AT ?auto_11687 ?auto_11685 ) ( not ( = ?auto_11686 ?auto_11687 ) ) ( not ( = ?auto_11687 ?auto_11688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11686 ?auto_11688 ?auto_11685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11693 - OBJ
      ?auto_11694 - OBJ
      ?auto_11695 - OBJ
      ?auto_11692 - LOCATION
    )
    :vars
    (
      ?auto_11697 - TRUCK
      ?auto_11696 - LOCATION
      ?auto_11698 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11697 ?auto_11696 ) ( IN-CITY ?auto_11696 ?auto_11698 ) ( IN-CITY ?auto_11692 ?auto_11698 ) ( not ( = ?auto_11692 ?auto_11696 ) ) ( OBJ-AT ?auto_11695 ?auto_11692 ) ( not ( = ?auto_11695 ?auto_11694 ) ) ( OBJ-AT ?auto_11694 ?auto_11696 ) ( OBJ-AT ?auto_11693 ?auto_11692 ) ( not ( = ?auto_11693 ?auto_11694 ) ) ( not ( = ?auto_11693 ?auto_11695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11695 ?auto_11694 ?auto_11692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11700 - OBJ
      ?auto_11701 - OBJ
      ?auto_11702 - OBJ
      ?auto_11699 - LOCATION
    )
    :vars
    (
      ?auto_11704 - TRUCK
      ?auto_11703 - LOCATION
      ?auto_11705 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11704 ?auto_11703 ) ( IN-CITY ?auto_11703 ?auto_11705 ) ( IN-CITY ?auto_11699 ?auto_11705 ) ( not ( = ?auto_11699 ?auto_11703 ) ) ( OBJ-AT ?auto_11700 ?auto_11699 ) ( not ( = ?auto_11700 ?auto_11701 ) ) ( OBJ-AT ?auto_11701 ?auto_11703 ) ( OBJ-AT ?auto_11702 ?auto_11699 ) ( not ( = ?auto_11700 ?auto_11702 ) ) ( not ( = ?auto_11701 ?auto_11702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11700 ?auto_11701 ?auto_11699 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11714 - OBJ
      ?auto_11715 - OBJ
      ?auto_11716 - OBJ
      ?auto_11713 - LOCATION
    )
    :vars
    (
      ?auto_11718 - TRUCK
      ?auto_11717 - LOCATION
      ?auto_11719 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11718 ?auto_11717 ) ( IN-CITY ?auto_11717 ?auto_11719 ) ( IN-CITY ?auto_11713 ?auto_11719 ) ( not ( = ?auto_11713 ?auto_11717 ) ) ( OBJ-AT ?auto_11715 ?auto_11713 ) ( not ( = ?auto_11715 ?auto_11716 ) ) ( OBJ-AT ?auto_11716 ?auto_11717 ) ( OBJ-AT ?auto_11714 ?auto_11713 ) ( not ( = ?auto_11714 ?auto_11715 ) ) ( not ( = ?auto_11714 ?auto_11716 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11715 ?auto_11716 ?auto_11713 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11721 - OBJ
      ?auto_11722 - OBJ
      ?auto_11723 - OBJ
      ?auto_11720 - LOCATION
    )
    :vars
    (
      ?auto_11725 - TRUCK
      ?auto_11724 - LOCATION
      ?auto_11726 - CITY
      ?auto_11727 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11725 ?auto_11724 ) ( IN-CITY ?auto_11724 ?auto_11726 ) ( IN-CITY ?auto_11720 ?auto_11726 ) ( not ( = ?auto_11720 ?auto_11724 ) ) ( OBJ-AT ?auto_11727 ?auto_11720 ) ( not ( = ?auto_11727 ?auto_11723 ) ) ( OBJ-AT ?auto_11723 ?auto_11724 ) ( OBJ-AT ?auto_11721 ?auto_11720 ) ( OBJ-AT ?auto_11722 ?auto_11720 ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11723 ) ) ( not ( = ?auto_11721 ?auto_11727 ) ) ( not ( = ?auto_11722 ?auto_11723 ) ) ( not ( = ?auto_11722 ?auto_11727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11727 ?auto_11723 ?auto_11720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11729 - OBJ
      ?auto_11730 - OBJ
      ?auto_11731 - OBJ
      ?auto_11728 - LOCATION
    )
    :vars
    (
      ?auto_11733 - TRUCK
      ?auto_11732 - LOCATION
      ?auto_11734 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11733 ?auto_11732 ) ( IN-CITY ?auto_11732 ?auto_11734 ) ( IN-CITY ?auto_11728 ?auto_11734 ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( OBJ-AT ?auto_11731 ?auto_11728 ) ( not ( = ?auto_11731 ?auto_11730 ) ) ( OBJ-AT ?auto_11730 ?auto_11732 ) ( OBJ-AT ?auto_11729 ?auto_11728 ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11731 ?auto_11730 ?auto_11728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11736 - OBJ
      ?auto_11737 - OBJ
      ?auto_11738 - OBJ
      ?auto_11735 - LOCATION
    )
    :vars
    (
      ?auto_11740 - TRUCK
      ?auto_11739 - LOCATION
      ?auto_11741 - CITY
      ?auto_11742 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11740 ?auto_11739 ) ( IN-CITY ?auto_11739 ?auto_11741 ) ( IN-CITY ?auto_11735 ?auto_11741 ) ( not ( = ?auto_11735 ?auto_11739 ) ) ( OBJ-AT ?auto_11742 ?auto_11735 ) ( not ( = ?auto_11742 ?auto_11737 ) ) ( OBJ-AT ?auto_11737 ?auto_11739 ) ( OBJ-AT ?auto_11736 ?auto_11735 ) ( OBJ-AT ?auto_11738 ?auto_11735 ) ( not ( = ?auto_11736 ?auto_11737 ) ) ( not ( = ?auto_11736 ?auto_11738 ) ) ( not ( = ?auto_11736 ?auto_11742 ) ) ( not ( = ?auto_11737 ?auto_11738 ) ) ( not ( = ?auto_11738 ?auto_11742 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11742 ?auto_11737 ?auto_11735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11752 - OBJ
      ?auto_11753 - OBJ
      ?auto_11754 - OBJ
      ?auto_11751 - LOCATION
    )
    :vars
    (
      ?auto_11756 - TRUCK
      ?auto_11755 - LOCATION
      ?auto_11757 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11756 ?auto_11755 ) ( IN-CITY ?auto_11755 ?auto_11757 ) ( IN-CITY ?auto_11751 ?auto_11757 ) ( not ( = ?auto_11751 ?auto_11755 ) ) ( OBJ-AT ?auto_11753 ?auto_11751 ) ( not ( = ?auto_11753 ?auto_11752 ) ) ( OBJ-AT ?auto_11752 ?auto_11755 ) ( OBJ-AT ?auto_11754 ?auto_11751 ) ( not ( = ?auto_11752 ?auto_11754 ) ) ( not ( = ?auto_11753 ?auto_11754 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11753 ?auto_11752 ?auto_11751 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11759 - OBJ
      ?auto_11760 - OBJ
      ?auto_11761 - OBJ
      ?auto_11758 - LOCATION
    )
    :vars
    (
      ?auto_11763 - TRUCK
      ?auto_11762 - LOCATION
      ?auto_11764 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11763 ?auto_11762 ) ( IN-CITY ?auto_11762 ?auto_11764 ) ( IN-CITY ?auto_11758 ?auto_11764 ) ( not ( = ?auto_11758 ?auto_11762 ) ) ( OBJ-AT ?auto_11760 ?auto_11758 ) ( not ( = ?auto_11760 ?auto_11759 ) ) ( OBJ-AT ?auto_11759 ?auto_11762 ) ( OBJ-AT ?auto_11761 ?auto_11758 ) ( not ( = ?auto_11759 ?auto_11761 ) ) ( not ( = ?auto_11760 ?auto_11761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11760 ?auto_11759 ?auto_11758 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11773 - OBJ
      ?auto_11774 - OBJ
      ?auto_11775 - OBJ
      ?auto_11772 - LOCATION
    )
    :vars
    (
      ?auto_11777 - TRUCK
      ?auto_11776 - LOCATION
      ?auto_11778 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11777 ?auto_11776 ) ( IN-CITY ?auto_11776 ?auto_11778 ) ( IN-CITY ?auto_11772 ?auto_11778 ) ( not ( = ?auto_11772 ?auto_11776 ) ) ( OBJ-AT ?auto_11775 ?auto_11772 ) ( not ( = ?auto_11775 ?auto_11773 ) ) ( OBJ-AT ?auto_11773 ?auto_11776 ) ( OBJ-AT ?auto_11774 ?auto_11772 ) ( not ( = ?auto_11773 ?auto_11774 ) ) ( not ( = ?auto_11774 ?auto_11775 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11775 ?auto_11773 ?auto_11772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11780 - OBJ
      ?auto_11781 - OBJ
      ?auto_11782 - OBJ
      ?auto_11779 - LOCATION
    )
    :vars
    (
      ?auto_11784 - TRUCK
      ?auto_11783 - LOCATION
      ?auto_11785 - CITY
      ?auto_11786 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11784 ?auto_11783 ) ( IN-CITY ?auto_11783 ?auto_11785 ) ( IN-CITY ?auto_11779 ?auto_11785 ) ( not ( = ?auto_11779 ?auto_11783 ) ) ( OBJ-AT ?auto_11786 ?auto_11779 ) ( not ( = ?auto_11786 ?auto_11780 ) ) ( OBJ-AT ?auto_11780 ?auto_11783 ) ( OBJ-AT ?auto_11781 ?auto_11779 ) ( OBJ-AT ?auto_11782 ?auto_11779 ) ( not ( = ?auto_11780 ?auto_11781 ) ) ( not ( = ?auto_11780 ?auto_11782 ) ) ( not ( = ?auto_11781 ?auto_11782 ) ) ( not ( = ?auto_11781 ?auto_11786 ) ) ( not ( = ?auto_11782 ?auto_11786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11786 ?auto_11780 ?auto_11779 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11819 - OBJ
      ?auto_11818 - LOCATION
    )
    :vars
    (
      ?auto_11820 - LOCATION
      ?auto_11822 - CITY
      ?auto_11823 - OBJ
      ?auto_11821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11820 ?auto_11822 ) ( IN-CITY ?auto_11818 ?auto_11822 ) ( not ( = ?auto_11818 ?auto_11820 ) ) ( OBJ-AT ?auto_11823 ?auto_11818 ) ( not ( = ?auto_11823 ?auto_11819 ) ) ( OBJ-AT ?auto_11819 ?auto_11820 ) ( TRUCK-AT ?auto_11821 ?auto_11818 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11821 ?auto_11818 ?auto_11820 ?auto_11822 )
      ( DELIVER-2PKG ?auto_11823 ?auto_11819 ?auto_11818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11825 - OBJ
      ?auto_11826 - OBJ
      ?auto_11824 - LOCATION
    )
    :vars
    (
      ?auto_11827 - LOCATION
      ?auto_11828 - CITY
      ?auto_11829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11827 ?auto_11828 ) ( IN-CITY ?auto_11824 ?auto_11828 ) ( not ( = ?auto_11824 ?auto_11827 ) ) ( OBJ-AT ?auto_11825 ?auto_11824 ) ( not ( = ?auto_11825 ?auto_11826 ) ) ( OBJ-AT ?auto_11826 ?auto_11827 ) ( TRUCK-AT ?auto_11829 ?auto_11824 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11826 ?auto_11824 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11831 - OBJ
      ?auto_11832 - OBJ
      ?auto_11830 - LOCATION
    )
    :vars
    (
      ?auto_11835 - LOCATION
      ?auto_11836 - CITY
      ?auto_11834 - OBJ
      ?auto_11833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11835 ?auto_11836 ) ( IN-CITY ?auto_11830 ?auto_11836 ) ( not ( = ?auto_11830 ?auto_11835 ) ) ( OBJ-AT ?auto_11834 ?auto_11830 ) ( not ( = ?auto_11834 ?auto_11832 ) ) ( OBJ-AT ?auto_11832 ?auto_11835 ) ( TRUCK-AT ?auto_11833 ?auto_11830 ) ( OBJ-AT ?auto_11831 ?auto_11830 ) ( not ( = ?auto_11831 ?auto_11832 ) ) ( not ( = ?auto_11831 ?auto_11834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11834 ?auto_11832 ?auto_11830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11838 - OBJ
      ?auto_11839 - OBJ
      ?auto_11837 - LOCATION
    )
    :vars
    (
      ?auto_11841 - LOCATION
      ?auto_11842 - CITY
      ?auto_11840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11841 ?auto_11842 ) ( IN-CITY ?auto_11837 ?auto_11842 ) ( not ( = ?auto_11837 ?auto_11841 ) ) ( OBJ-AT ?auto_11839 ?auto_11837 ) ( not ( = ?auto_11839 ?auto_11838 ) ) ( OBJ-AT ?auto_11838 ?auto_11841 ) ( TRUCK-AT ?auto_11840 ?auto_11837 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11839 ?auto_11838 ?auto_11837 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11844 - OBJ
      ?auto_11845 - OBJ
      ?auto_11843 - LOCATION
    )
    :vars
    (
      ?auto_11848 - LOCATION
      ?auto_11849 - CITY
      ?auto_11847 - OBJ
      ?auto_11846 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11848 ?auto_11849 ) ( IN-CITY ?auto_11843 ?auto_11849 ) ( not ( = ?auto_11843 ?auto_11848 ) ) ( OBJ-AT ?auto_11847 ?auto_11843 ) ( not ( = ?auto_11847 ?auto_11844 ) ) ( OBJ-AT ?auto_11844 ?auto_11848 ) ( TRUCK-AT ?auto_11846 ?auto_11843 ) ( OBJ-AT ?auto_11845 ?auto_11843 ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11845 ?auto_11847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11847 ?auto_11844 ?auto_11843 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11858 - OBJ
      ?auto_11859 - OBJ
      ?auto_11860 - OBJ
      ?auto_11857 - LOCATION
    )
    :vars
    (
      ?auto_11862 - LOCATION
      ?auto_11863 - CITY
      ?auto_11861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11862 ?auto_11863 ) ( IN-CITY ?auto_11857 ?auto_11863 ) ( not ( = ?auto_11857 ?auto_11862 ) ) ( OBJ-AT ?auto_11858 ?auto_11857 ) ( not ( = ?auto_11858 ?auto_11860 ) ) ( OBJ-AT ?auto_11860 ?auto_11862 ) ( TRUCK-AT ?auto_11861 ?auto_11857 ) ( OBJ-AT ?auto_11859 ?auto_11857 ) ( not ( = ?auto_11858 ?auto_11859 ) ) ( not ( = ?auto_11859 ?auto_11860 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11858 ?auto_11860 ?auto_11857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11865 - OBJ
      ?auto_11866 - OBJ
      ?auto_11867 - OBJ
      ?auto_11864 - LOCATION
    )
    :vars
    (
      ?auto_11869 - LOCATION
      ?auto_11870 - CITY
      ?auto_11868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11869 ?auto_11870 ) ( IN-CITY ?auto_11864 ?auto_11870 ) ( not ( = ?auto_11864 ?auto_11869 ) ) ( OBJ-AT ?auto_11865 ?auto_11864 ) ( not ( = ?auto_11865 ?auto_11867 ) ) ( OBJ-AT ?auto_11867 ?auto_11869 ) ( TRUCK-AT ?auto_11868 ?auto_11864 ) ( OBJ-AT ?auto_11866 ?auto_11864 ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( not ( = ?auto_11866 ?auto_11867 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11865 ?auto_11867 ?auto_11864 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11872 - OBJ
      ?auto_11873 - OBJ
      ?auto_11874 - OBJ
      ?auto_11871 - LOCATION
    )
    :vars
    (
      ?auto_11876 - LOCATION
      ?auto_11877 - CITY
      ?auto_11875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11876 ?auto_11877 ) ( IN-CITY ?auto_11871 ?auto_11877 ) ( not ( = ?auto_11871 ?auto_11876 ) ) ( OBJ-AT ?auto_11874 ?auto_11871 ) ( not ( = ?auto_11874 ?auto_11873 ) ) ( OBJ-AT ?auto_11873 ?auto_11876 ) ( TRUCK-AT ?auto_11875 ?auto_11871 ) ( OBJ-AT ?auto_11872 ?auto_11871 ) ( not ( = ?auto_11872 ?auto_11873 ) ) ( not ( = ?auto_11872 ?auto_11874 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11874 ?auto_11873 ?auto_11871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11879 - OBJ
      ?auto_11880 - OBJ
      ?auto_11881 - OBJ
      ?auto_11878 - LOCATION
    )
    :vars
    (
      ?auto_11883 - LOCATION
      ?auto_11884 - CITY
      ?auto_11882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11883 ?auto_11884 ) ( IN-CITY ?auto_11878 ?auto_11884 ) ( not ( = ?auto_11878 ?auto_11883 ) ) ( OBJ-AT ?auto_11879 ?auto_11878 ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( OBJ-AT ?auto_11880 ?auto_11883 ) ( TRUCK-AT ?auto_11882 ?auto_11878 ) ( OBJ-AT ?auto_11881 ?auto_11878 ) ( not ( = ?auto_11879 ?auto_11881 ) ) ( not ( = ?auto_11880 ?auto_11881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11879 ?auto_11880 ?auto_11878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11893 - OBJ
      ?auto_11894 - OBJ
      ?auto_11895 - OBJ
      ?auto_11892 - LOCATION
    )
    :vars
    (
      ?auto_11897 - LOCATION
      ?auto_11898 - CITY
      ?auto_11896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11897 ?auto_11898 ) ( IN-CITY ?auto_11892 ?auto_11898 ) ( not ( = ?auto_11892 ?auto_11897 ) ) ( OBJ-AT ?auto_11894 ?auto_11892 ) ( not ( = ?auto_11894 ?auto_11895 ) ) ( OBJ-AT ?auto_11895 ?auto_11897 ) ( TRUCK-AT ?auto_11896 ?auto_11892 ) ( OBJ-AT ?auto_11893 ?auto_11892 ) ( not ( = ?auto_11893 ?auto_11894 ) ) ( not ( = ?auto_11893 ?auto_11895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11894 ?auto_11895 ?auto_11892 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11900 - OBJ
      ?auto_11901 - OBJ
      ?auto_11902 - OBJ
      ?auto_11899 - LOCATION
    )
    :vars
    (
      ?auto_11905 - LOCATION
      ?auto_11906 - CITY
      ?auto_11904 - OBJ
      ?auto_11903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11905 ?auto_11906 ) ( IN-CITY ?auto_11899 ?auto_11906 ) ( not ( = ?auto_11899 ?auto_11905 ) ) ( OBJ-AT ?auto_11904 ?auto_11899 ) ( not ( = ?auto_11904 ?auto_11902 ) ) ( OBJ-AT ?auto_11902 ?auto_11905 ) ( TRUCK-AT ?auto_11903 ?auto_11899 ) ( OBJ-AT ?auto_11900 ?auto_11899 ) ( OBJ-AT ?auto_11901 ?auto_11899 ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11902 ) ) ( not ( = ?auto_11900 ?auto_11904 ) ) ( not ( = ?auto_11901 ?auto_11902 ) ) ( not ( = ?auto_11901 ?auto_11904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11904 ?auto_11902 ?auto_11899 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11908 - OBJ
      ?auto_11909 - OBJ
      ?auto_11910 - OBJ
      ?auto_11907 - LOCATION
    )
    :vars
    (
      ?auto_11912 - LOCATION
      ?auto_11913 - CITY
      ?auto_11911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11912 ?auto_11913 ) ( IN-CITY ?auto_11907 ?auto_11913 ) ( not ( = ?auto_11907 ?auto_11912 ) ) ( OBJ-AT ?auto_11910 ?auto_11907 ) ( not ( = ?auto_11910 ?auto_11909 ) ) ( OBJ-AT ?auto_11909 ?auto_11912 ) ( TRUCK-AT ?auto_11911 ?auto_11907 ) ( OBJ-AT ?auto_11908 ?auto_11907 ) ( not ( = ?auto_11908 ?auto_11909 ) ) ( not ( = ?auto_11908 ?auto_11910 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11910 ?auto_11909 ?auto_11907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11915 - OBJ
      ?auto_11916 - OBJ
      ?auto_11917 - OBJ
      ?auto_11914 - LOCATION
    )
    :vars
    (
      ?auto_11920 - LOCATION
      ?auto_11921 - CITY
      ?auto_11919 - OBJ
      ?auto_11918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11920 ?auto_11921 ) ( IN-CITY ?auto_11914 ?auto_11921 ) ( not ( = ?auto_11914 ?auto_11920 ) ) ( OBJ-AT ?auto_11919 ?auto_11914 ) ( not ( = ?auto_11919 ?auto_11916 ) ) ( OBJ-AT ?auto_11916 ?auto_11920 ) ( TRUCK-AT ?auto_11918 ?auto_11914 ) ( OBJ-AT ?auto_11915 ?auto_11914 ) ( OBJ-AT ?auto_11917 ?auto_11914 ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) ( not ( = ?auto_11915 ?auto_11919 ) ) ( not ( = ?auto_11916 ?auto_11917 ) ) ( not ( = ?auto_11917 ?auto_11919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11919 ?auto_11916 ?auto_11914 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11931 - OBJ
      ?auto_11932 - OBJ
      ?auto_11933 - OBJ
      ?auto_11930 - LOCATION
    )
    :vars
    (
      ?auto_11935 - LOCATION
      ?auto_11936 - CITY
      ?auto_11934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11935 ?auto_11936 ) ( IN-CITY ?auto_11930 ?auto_11936 ) ( not ( = ?auto_11930 ?auto_11935 ) ) ( OBJ-AT ?auto_11932 ?auto_11930 ) ( not ( = ?auto_11932 ?auto_11931 ) ) ( OBJ-AT ?auto_11931 ?auto_11935 ) ( TRUCK-AT ?auto_11934 ?auto_11930 ) ( OBJ-AT ?auto_11933 ?auto_11930 ) ( not ( = ?auto_11931 ?auto_11933 ) ) ( not ( = ?auto_11932 ?auto_11933 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11932 ?auto_11931 ?auto_11930 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11938 - OBJ
      ?auto_11939 - OBJ
      ?auto_11940 - OBJ
      ?auto_11937 - LOCATION
    )
    :vars
    (
      ?auto_11942 - LOCATION
      ?auto_11943 - CITY
      ?auto_11941 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11942 ?auto_11943 ) ( IN-CITY ?auto_11937 ?auto_11943 ) ( not ( = ?auto_11937 ?auto_11942 ) ) ( OBJ-AT ?auto_11939 ?auto_11937 ) ( not ( = ?auto_11939 ?auto_11938 ) ) ( OBJ-AT ?auto_11938 ?auto_11942 ) ( TRUCK-AT ?auto_11941 ?auto_11937 ) ( OBJ-AT ?auto_11940 ?auto_11937 ) ( not ( = ?auto_11938 ?auto_11940 ) ) ( not ( = ?auto_11939 ?auto_11940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11939 ?auto_11938 ?auto_11937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11952 - OBJ
      ?auto_11953 - OBJ
      ?auto_11954 - OBJ
      ?auto_11951 - LOCATION
    )
    :vars
    (
      ?auto_11956 - LOCATION
      ?auto_11957 - CITY
      ?auto_11955 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11956 ?auto_11957 ) ( IN-CITY ?auto_11951 ?auto_11957 ) ( not ( = ?auto_11951 ?auto_11956 ) ) ( OBJ-AT ?auto_11954 ?auto_11951 ) ( not ( = ?auto_11954 ?auto_11952 ) ) ( OBJ-AT ?auto_11952 ?auto_11956 ) ( TRUCK-AT ?auto_11955 ?auto_11951 ) ( OBJ-AT ?auto_11953 ?auto_11951 ) ( not ( = ?auto_11952 ?auto_11953 ) ) ( not ( = ?auto_11953 ?auto_11954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11954 ?auto_11952 ?auto_11951 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11959 - OBJ
      ?auto_11960 - OBJ
      ?auto_11961 - OBJ
      ?auto_11958 - LOCATION
    )
    :vars
    (
      ?auto_11964 - LOCATION
      ?auto_11965 - CITY
      ?auto_11963 - OBJ
      ?auto_11962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11964 ?auto_11965 ) ( IN-CITY ?auto_11958 ?auto_11965 ) ( not ( = ?auto_11958 ?auto_11964 ) ) ( OBJ-AT ?auto_11963 ?auto_11958 ) ( not ( = ?auto_11963 ?auto_11959 ) ) ( OBJ-AT ?auto_11959 ?auto_11964 ) ( TRUCK-AT ?auto_11962 ?auto_11958 ) ( OBJ-AT ?auto_11960 ?auto_11958 ) ( OBJ-AT ?auto_11961 ?auto_11958 ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11963 ) ) ( not ( = ?auto_11961 ?auto_11963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11963 ?auto_11959 ?auto_11958 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11998 - OBJ
      ?auto_11997 - LOCATION
    )
    :vars
    (
      ?auto_12001 - LOCATION
      ?auto_12002 - CITY
      ?auto_12000 - OBJ
      ?auto_11999 - TRUCK
      ?auto_12003 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12001 ?auto_12002 ) ( IN-CITY ?auto_11997 ?auto_12002 ) ( not ( = ?auto_11997 ?auto_12001 ) ) ( OBJ-AT ?auto_12000 ?auto_11997 ) ( not ( = ?auto_12000 ?auto_11998 ) ) ( OBJ-AT ?auto_11998 ?auto_12001 ) ( TRUCK-AT ?auto_11999 ?auto_11997 ) ( IN-TRUCK ?auto_12003 ?auto_11999 ) ( not ( = ?auto_12000 ?auto_12003 ) ) ( not ( = ?auto_11998 ?auto_12003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12000 ?auto_12003 ?auto_11997 )
      ( DELIVER-2PKG ?auto_12000 ?auto_11998 ?auto_11997 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12005 - OBJ
      ?auto_12006 - OBJ
      ?auto_12004 - LOCATION
    )
    :vars
    (
      ?auto_12008 - LOCATION
      ?auto_12009 - CITY
      ?auto_12010 - TRUCK
      ?auto_12007 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12008 ?auto_12009 ) ( IN-CITY ?auto_12004 ?auto_12009 ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( OBJ-AT ?auto_12005 ?auto_12004 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( OBJ-AT ?auto_12006 ?auto_12008 ) ( TRUCK-AT ?auto_12010 ?auto_12004 ) ( IN-TRUCK ?auto_12007 ?auto_12010 ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12007 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12006 ?auto_12004 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12012 - OBJ
      ?auto_12013 - OBJ
      ?auto_12011 - LOCATION
    )
    :vars
    (
      ?auto_12016 - LOCATION
      ?auto_12014 - CITY
      ?auto_12015 - OBJ
      ?auto_12017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12016 ?auto_12014 ) ( IN-CITY ?auto_12011 ?auto_12014 ) ( not ( = ?auto_12011 ?auto_12016 ) ) ( OBJ-AT ?auto_12015 ?auto_12011 ) ( not ( = ?auto_12015 ?auto_12013 ) ) ( OBJ-AT ?auto_12013 ?auto_12016 ) ( TRUCK-AT ?auto_12017 ?auto_12011 ) ( IN-TRUCK ?auto_12012 ?auto_12017 ) ( not ( = ?auto_12015 ?auto_12012 ) ) ( not ( = ?auto_12013 ?auto_12012 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12015 ?auto_12013 ?auto_12011 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12019 - OBJ
      ?auto_12020 - OBJ
      ?auto_12018 - LOCATION
    )
    :vars
    (
      ?auto_12023 - LOCATION
      ?auto_12021 - CITY
      ?auto_12024 - TRUCK
      ?auto_12022 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12023 ?auto_12021 ) ( IN-CITY ?auto_12018 ?auto_12021 ) ( not ( = ?auto_12018 ?auto_12023 ) ) ( OBJ-AT ?auto_12020 ?auto_12018 ) ( not ( = ?auto_12020 ?auto_12019 ) ) ( OBJ-AT ?auto_12019 ?auto_12023 ) ( TRUCK-AT ?auto_12024 ?auto_12018 ) ( IN-TRUCK ?auto_12022 ?auto_12024 ) ( not ( = ?auto_12020 ?auto_12022 ) ) ( not ( = ?auto_12019 ?auto_12022 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12020 ?auto_12019 ?auto_12018 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12026 - OBJ
      ?auto_12027 - OBJ
      ?auto_12025 - LOCATION
    )
    :vars
    (
      ?auto_12030 - LOCATION
      ?auto_12028 - CITY
      ?auto_12029 - OBJ
      ?auto_12031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12030 ?auto_12028 ) ( IN-CITY ?auto_12025 ?auto_12028 ) ( not ( = ?auto_12025 ?auto_12030 ) ) ( OBJ-AT ?auto_12029 ?auto_12025 ) ( not ( = ?auto_12029 ?auto_12026 ) ) ( OBJ-AT ?auto_12026 ?auto_12030 ) ( TRUCK-AT ?auto_12031 ?auto_12025 ) ( IN-TRUCK ?auto_12027 ?auto_12031 ) ( not ( = ?auto_12029 ?auto_12027 ) ) ( not ( = ?auto_12026 ?auto_12027 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12029 ?auto_12026 ?auto_12025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12041 - OBJ
      ?auto_12042 - OBJ
      ?auto_12043 - OBJ
      ?auto_12040 - LOCATION
    )
    :vars
    (
      ?auto_12046 - LOCATION
      ?auto_12044 - CITY
      ?auto_12047 - TRUCK
      ?auto_12045 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12046 ?auto_12044 ) ( IN-CITY ?auto_12040 ?auto_12044 ) ( not ( = ?auto_12040 ?auto_12046 ) ) ( OBJ-AT ?auto_12041 ?auto_12040 ) ( not ( = ?auto_12041 ?auto_12043 ) ) ( OBJ-AT ?auto_12043 ?auto_12046 ) ( TRUCK-AT ?auto_12047 ?auto_12040 ) ( IN-TRUCK ?auto_12045 ?auto_12047 ) ( not ( = ?auto_12041 ?auto_12045 ) ) ( not ( = ?auto_12043 ?auto_12045 ) ) ( OBJ-AT ?auto_12042 ?auto_12040 ) ( not ( = ?auto_12041 ?auto_12042 ) ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12042 ?auto_12045 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12041 ?auto_12043 ?auto_12040 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12049 - OBJ
      ?auto_12050 - OBJ
      ?auto_12051 - OBJ
      ?auto_12048 - LOCATION
    )
    :vars
    (
      ?auto_12053 - LOCATION
      ?auto_12052 - CITY
      ?auto_12054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12053 ?auto_12052 ) ( IN-CITY ?auto_12048 ?auto_12052 ) ( not ( = ?auto_12048 ?auto_12053 ) ) ( OBJ-AT ?auto_12049 ?auto_12048 ) ( not ( = ?auto_12049 ?auto_12051 ) ) ( OBJ-AT ?auto_12051 ?auto_12053 ) ( TRUCK-AT ?auto_12054 ?auto_12048 ) ( IN-TRUCK ?auto_12050 ?auto_12054 ) ( not ( = ?auto_12049 ?auto_12050 ) ) ( not ( = ?auto_12051 ?auto_12050 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12049 ?auto_12051 ?auto_12048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12056 - OBJ
      ?auto_12057 - OBJ
      ?auto_12058 - OBJ
      ?auto_12055 - LOCATION
    )
    :vars
    (
      ?auto_12061 - LOCATION
      ?auto_12059 - CITY
      ?auto_12062 - TRUCK
      ?auto_12060 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12061 ?auto_12059 ) ( IN-CITY ?auto_12055 ?auto_12059 ) ( not ( = ?auto_12055 ?auto_12061 ) ) ( OBJ-AT ?auto_12058 ?auto_12055 ) ( not ( = ?auto_12058 ?auto_12057 ) ) ( OBJ-AT ?auto_12057 ?auto_12061 ) ( TRUCK-AT ?auto_12062 ?auto_12055 ) ( IN-TRUCK ?auto_12060 ?auto_12062 ) ( not ( = ?auto_12058 ?auto_12060 ) ) ( not ( = ?auto_12057 ?auto_12060 ) ) ( OBJ-AT ?auto_12056 ?auto_12055 ) ( not ( = ?auto_12056 ?auto_12057 ) ) ( not ( = ?auto_12056 ?auto_12058 ) ) ( not ( = ?auto_12056 ?auto_12060 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12058 ?auto_12057 ?auto_12055 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12064 - OBJ
      ?auto_12065 - OBJ
      ?auto_12066 - OBJ
      ?auto_12063 - LOCATION
    )
    :vars
    (
      ?auto_12068 - LOCATION
      ?auto_12067 - CITY
      ?auto_12069 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12068 ?auto_12067 ) ( IN-CITY ?auto_12063 ?auto_12067 ) ( not ( = ?auto_12063 ?auto_12068 ) ) ( OBJ-AT ?auto_12064 ?auto_12063 ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( OBJ-AT ?auto_12065 ?auto_12068 ) ( TRUCK-AT ?auto_12069 ?auto_12063 ) ( IN-TRUCK ?auto_12066 ?auto_12069 ) ( not ( = ?auto_12064 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12064 ?auto_12065 ?auto_12063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12079 - OBJ
      ?auto_12080 - OBJ
      ?auto_12081 - OBJ
      ?auto_12078 - LOCATION
    )
    :vars
    (
      ?auto_12083 - LOCATION
      ?auto_12082 - CITY
      ?auto_12084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12083 ?auto_12082 ) ( IN-CITY ?auto_12078 ?auto_12082 ) ( not ( = ?auto_12078 ?auto_12083 ) ) ( OBJ-AT ?auto_12080 ?auto_12078 ) ( not ( = ?auto_12080 ?auto_12081 ) ) ( OBJ-AT ?auto_12081 ?auto_12083 ) ( TRUCK-AT ?auto_12084 ?auto_12078 ) ( IN-TRUCK ?auto_12079 ?auto_12084 ) ( not ( = ?auto_12080 ?auto_12079 ) ) ( not ( = ?auto_12081 ?auto_12079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12080 ?auto_12081 ?auto_12078 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12094 - OBJ
      ?auto_12095 - OBJ
      ?auto_12096 - OBJ
      ?auto_12093 - LOCATION
    )
    :vars
    (
      ?auto_12098 - LOCATION
      ?auto_12097 - CITY
      ?auto_12099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12098 ?auto_12097 ) ( IN-CITY ?auto_12093 ?auto_12097 ) ( not ( = ?auto_12093 ?auto_12098 ) ) ( OBJ-AT ?auto_12096 ?auto_12093 ) ( not ( = ?auto_12096 ?auto_12095 ) ) ( OBJ-AT ?auto_12095 ?auto_12098 ) ( TRUCK-AT ?auto_12099 ?auto_12093 ) ( IN-TRUCK ?auto_12094 ?auto_12099 ) ( not ( = ?auto_12096 ?auto_12094 ) ) ( not ( = ?auto_12095 ?auto_12094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12096 ?auto_12095 ?auto_12093 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12117 - OBJ
      ?auto_12118 - OBJ
      ?auto_12119 - OBJ
      ?auto_12116 - LOCATION
    )
    :vars
    (
      ?auto_12122 - LOCATION
      ?auto_12120 - CITY
      ?auto_12123 - TRUCK
      ?auto_12121 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12122 ?auto_12120 ) ( IN-CITY ?auto_12116 ?auto_12120 ) ( not ( = ?auto_12116 ?auto_12122 ) ) ( OBJ-AT ?auto_12118 ?auto_12116 ) ( not ( = ?auto_12118 ?auto_12117 ) ) ( OBJ-AT ?auto_12117 ?auto_12122 ) ( TRUCK-AT ?auto_12123 ?auto_12116 ) ( IN-TRUCK ?auto_12121 ?auto_12123 ) ( not ( = ?auto_12118 ?auto_12121 ) ) ( not ( = ?auto_12117 ?auto_12121 ) ) ( OBJ-AT ?auto_12119 ?auto_12116 ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12119 ?auto_12121 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12118 ?auto_12117 ?auto_12116 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12125 - OBJ
      ?auto_12126 - OBJ
      ?auto_12127 - OBJ
      ?auto_12124 - LOCATION
    )
    :vars
    (
      ?auto_12129 - LOCATION
      ?auto_12128 - CITY
      ?auto_12130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12129 ?auto_12128 ) ( IN-CITY ?auto_12124 ?auto_12128 ) ( not ( = ?auto_12124 ?auto_12129 ) ) ( OBJ-AT ?auto_12126 ?auto_12124 ) ( not ( = ?auto_12126 ?auto_12125 ) ) ( OBJ-AT ?auto_12125 ?auto_12129 ) ( TRUCK-AT ?auto_12130 ?auto_12124 ) ( IN-TRUCK ?auto_12127 ?auto_12130 ) ( not ( = ?auto_12126 ?auto_12127 ) ) ( not ( = ?auto_12125 ?auto_12127 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12126 ?auto_12125 ?auto_12124 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12140 - OBJ
      ?auto_12141 - OBJ
      ?auto_12142 - OBJ
      ?auto_12139 - LOCATION
    )
    :vars
    (
      ?auto_12144 - LOCATION
      ?auto_12143 - CITY
      ?auto_12145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12144 ?auto_12143 ) ( IN-CITY ?auto_12139 ?auto_12143 ) ( not ( = ?auto_12139 ?auto_12144 ) ) ( OBJ-AT ?auto_12142 ?auto_12139 ) ( not ( = ?auto_12142 ?auto_12140 ) ) ( OBJ-AT ?auto_12140 ?auto_12144 ) ( TRUCK-AT ?auto_12145 ?auto_12139 ) ( IN-TRUCK ?auto_12141 ?auto_12145 ) ( not ( = ?auto_12142 ?auto_12141 ) ) ( not ( = ?auto_12140 ?auto_12141 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12142 ?auto_12140 ?auto_12139 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12188 - OBJ
      ?auto_12187 - LOCATION
    )
    :vars
    (
      ?auto_12192 - LOCATION
      ?auto_12189 - CITY
      ?auto_12190 - OBJ
      ?auto_12191 - OBJ
      ?auto_12193 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12192 ?auto_12189 ) ( IN-CITY ?auto_12187 ?auto_12189 ) ( not ( = ?auto_12187 ?auto_12192 ) ) ( OBJ-AT ?auto_12190 ?auto_12187 ) ( not ( = ?auto_12190 ?auto_12188 ) ) ( OBJ-AT ?auto_12188 ?auto_12192 ) ( IN-TRUCK ?auto_12191 ?auto_12193 ) ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12188 ?auto_12191 ) ) ( TRUCK-AT ?auto_12193 ?auto_12192 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12193 ?auto_12192 ?auto_12187 ?auto_12189 )
      ( DELIVER-2PKG ?auto_12190 ?auto_12188 ?auto_12187 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12195 - OBJ
      ?auto_12196 - OBJ
      ?auto_12194 - LOCATION
    )
    :vars
    (
      ?auto_12200 - LOCATION
      ?auto_12199 - CITY
      ?auto_12198 - OBJ
      ?auto_12197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12200 ?auto_12199 ) ( IN-CITY ?auto_12194 ?auto_12199 ) ( not ( = ?auto_12194 ?auto_12200 ) ) ( OBJ-AT ?auto_12195 ?auto_12194 ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( OBJ-AT ?auto_12196 ?auto_12200 ) ( IN-TRUCK ?auto_12198 ?auto_12197 ) ( not ( = ?auto_12195 ?auto_12198 ) ) ( not ( = ?auto_12196 ?auto_12198 ) ) ( TRUCK-AT ?auto_12197 ?auto_12200 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12196 ?auto_12194 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12202 - OBJ
      ?auto_12203 - OBJ
      ?auto_12201 - LOCATION
    )
    :vars
    (
      ?auto_12204 - LOCATION
      ?auto_12206 - CITY
      ?auto_12207 - OBJ
      ?auto_12205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12204 ?auto_12206 ) ( IN-CITY ?auto_12201 ?auto_12206 ) ( not ( = ?auto_12201 ?auto_12204 ) ) ( OBJ-AT ?auto_12207 ?auto_12201 ) ( not ( = ?auto_12207 ?auto_12203 ) ) ( OBJ-AT ?auto_12203 ?auto_12204 ) ( IN-TRUCK ?auto_12202 ?auto_12205 ) ( not ( = ?auto_12207 ?auto_12202 ) ) ( not ( = ?auto_12203 ?auto_12202 ) ) ( TRUCK-AT ?auto_12205 ?auto_12204 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12207 ?auto_12203 ?auto_12201 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12209 - OBJ
      ?auto_12210 - OBJ
      ?auto_12208 - LOCATION
    )
    :vars
    (
      ?auto_12212 - LOCATION
      ?auto_12214 - CITY
      ?auto_12211 - OBJ
      ?auto_12213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12212 ?auto_12214 ) ( IN-CITY ?auto_12208 ?auto_12214 ) ( not ( = ?auto_12208 ?auto_12212 ) ) ( OBJ-AT ?auto_12210 ?auto_12208 ) ( not ( = ?auto_12210 ?auto_12209 ) ) ( OBJ-AT ?auto_12209 ?auto_12212 ) ( IN-TRUCK ?auto_12211 ?auto_12213 ) ( not ( = ?auto_12210 ?auto_12211 ) ) ( not ( = ?auto_12209 ?auto_12211 ) ) ( TRUCK-AT ?auto_12213 ?auto_12212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12210 ?auto_12209 ?auto_12208 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12216 - OBJ
      ?auto_12217 - OBJ
      ?auto_12215 - LOCATION
    )
    :vars
    (
      ?auto_12218 - LOCATION
      ?auto_12220 - CITY
      ?auto_12221 - OBJ
      ?auto_12219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12218 ?auto_12220 ) ( IN-CITY ?auto_12215 ?auto_12220 ) ( not ( = ?auto_12215 ?auto_12218 ) ) ( OBJ-AT ?auto_12221 ?auto_12215 ) ( not ( = ?auto_12221 ?auto_12216 ) ) ( OBJ-AT ?auto_12216 ?auto_12218 ) ( IN-TRUCK ?auto_12217 ?auto_12219 ) ( not ( = ?auto_12221 ?auto_12217 ) ) ( not ( = ?auto_12216 ?auto_12217 ) ) ( TRUCK-AT ?auto_12219 ?auto_12218 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12221 ?auto_12216 ?auto_12215 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12231 - OBJ
      ?auto_12232 - OBJ
      ?auto_12233 - OBJ
      ?auto_12230 - LOCATION
    )
    :vars
    (
      ?auto_12235 - LOCATION
      ?auto_12237 - CITY
      ?auto_12234 - OBJ
      ?auto_12236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12235 ?auto_12237 ) ( IN-CITY ?auto_12230 ?auto_12237 ) ( not ( = ?auto_12230 ?auto_12235 ) ) ( OBJ-AT ?auto_12231 ?auto_12230 ) ( not ( = ?auto_12231 ?auto_12233 ) ) ( OBJ-AT ?auto_12233 ?auto_12235 ) ( IN-TRUCK ?auto_12234 ?auto_12236 ) ( not ( = ?auto_12231 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( TRUCK-AT ?auto_12236 ?auto_12235 ) ( OBJ-AT ?auto_12232 ?auto_12230 ) ( not ( = ?auto_12231 ?auto_12232 ) ) ( not ( = ?auto_12232 ?auto_12233 ) ) ( not ( = ?auto_12232 ?auto_12234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12231 ?auto_12233 ?auto_12230 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12239 - OBJ
      ?auto_12240 - OBJ
      ?auto_12241 - OBJ
      ?auto_12238 - LOCATION
    )
    :vars
    (
      ?auto_12242 - LOCATION
      ?auto_12244 - CITY
      ?auto_12243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12242 ?auto_12244 ) ( IN-CITY ?auto_12238 ?auto_12244 ) ( not ( = ?auto_12238 ?auto_12242 ) ) ( OBJ-AT ?auto_12239 ?auto_12238 ) ( not ( = ?auto_12239 ?auto_12241 ) ) ( OBJ-AT ?auto_12241 ?auto_12242 ) ( IN-TRUCK ?auto_12240 ?auto_12243 ) ( not ( = ?auto_12239 ?auto_12240 ) ) ( not ( = ?auto_12241 ?auto_12240 ) ) ( TRUCK-AT ?auto_12243 ?auto_12242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12239 ?auto_12241 ?auto_12238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12246 - OBJ
      ?auto_12247 - OBJ
      ?auto_12248 - OBJ
      ?auto_12245 - LOCATION
    )
    :vars
    (
      ?auto_12250 - LOCATION
      ?auto_12252 - CITY
      ?auto_12249 - OBJ
      ?auto_12251 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12250 ?auto_12252 ) ( IN-CITY ?auto_12245 ?auto_12252 ) ( not ( = ?auto_12245 ?auto_12250 ) ) ( OBJ-AT ?auto_12248 ?auto_12245 ) ( not ( = ?auto_12248 ?auto_12247 ) ) ( OBJ-AT ?auto_12247 ?auto_12250 ) ( IN-TRUCK ?auto_12249 ?auto_12251 ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( not ( = ?auto_12247 ?auto_12249 ) ) ( TRUCK-AT ?auto_12251 ?auto_12250 ) ( OBJ-AT ?auto_12246 ?auto_12245 ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12248 ?auto_12247 ?auto_12245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12254 - OBJ
      ?auto_12255 - OBJ
      ?auto_12256 - OBJ
      ?auto_12253 - LOCATION
    )
    :vars
    (
      ?auto_12257 - LOCATION
      ?auto_12259 - CITY
      ?auto_12258 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12257 ?auto_12259 ) ( IN-CITY ?auto_12253 ?auto_12259 ) ( not ( = ?auto_12253 ?auto_12257 ) ) ( OBJ-AT ?auto_12254 ?auto_12253 ) ( not ( = ?auto_12254 ?auto_12255 ) ) ( OBJ-AT ?auto_12255 ?auto_12257 ) ( IN-TRUCK ?auto_12256 ?auto_12258 ) ( not ( = ?auto_12254 ?auto_12256 ) ) ( not ( = ?auto_12255 ?auto_12256 ) ) ( TRUCK-AT ?auto_12258 ?auto_12257 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12254 ?auto_12255 ?auto_12253 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12269 - OBJ
      ?auto_12270 - OBJ
      ?auto_12271 - OBJ
      ?auto_12268 - LOCATION
    )
    :vars
    (
      ?auto_12272 - LOCATION
      ?auto_12274 - CITY
      ?auto_12273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12272 ?auto_12274 ) ( IN-CITY ?auto_12268 ?auto_12274 ) ( not ( = ?auto_12268 ?auto_12272 ) ) ( OBJ-AT ?auto_12270 ?auto_12268 ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( OBJ-AT ?auto_12271 ?auto_12272 ) ( IN-TRUCK ?auto_12269 ?auto_12273 ) ( not ( = ?auto_12270 ?auto_12269 ) ) ( not ( = ?auto_12271 ?auto_12269 ) ) ( TRUCK-AT ?auto_12273 ?auto_12272 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12270 ?auto_12271 ?auto_12268 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12284 - OBJ
      ?auto_12285 - OBJ
      ?auto_12286 - OBJ
      ?auto_12283 - LOCATION
    )
    :vars
    (
      ?auto_12287 - LOCATION
      ?auto_12289 - CITY
      ?auto_12288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12287 ?auto_12289 ) ( IN-CITY ?auto_12283 ?auto_12289 ) ( not ( = ?auto_12283 ?auto_12287 ) ) ( OBJ-AT ?auto_12286 ?auto_12283 ) ( not ( = ?auto_12286 ?auto_12285 ) ) ( OBJ-AT ?auto_12285 ?auto_12287 ) ( IN-TRUCK ?auto_12284 ?auto_12288 ) ( not ( = ?auto_12286 ?auto_12284 ) ) ( not ( = ?auto_12285 ?auto_12284 ) ) ( TRUCK-AT ?auto_12288 ?auto_12287 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12286 ?auto_12285 ?auto_12283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12307 - OBJ
      ?auto_12308 - OBJ
      ?auto_12309 - OBJ
      ?auto_12306 - LOCATION
    )
    :vars
    (
      ?auto_12311 - LOCATION
      ?auto_12313 - CITY
      ?auto_12310 - OBJ
      ?auto_12312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12311 ?auto_12313 ) ( IN-CITY ?auto_12306 ?auto_12313 ) ( not ( = ?auto_12306 ?auto_12311 ) ) ( OBJ-AT ?auto_12308 ?auto_12306 ) ( not ( = ?auto_12308 ?auto_12307 ) ) ( OBJ-AT ?auto_12307 ?auto_12311 ) ( IN-TRUCK ?auto_12310 ?auto_12312 ) ( not ( = ?auto_12308 ?auto_12310 ) ) ( not ( = ?auto_12307 ?auto_12310 ) ) ( TRUCK-AT ?auto_12312 ?auto_12311 ) ( OBJ-AT ?auto_12309 ?auto_12306 ) ( not ( = ?auto_12307 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( not ( = ?auto_12309 ?auto_12310 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12308 ?auto_12307 ?auto_12306 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12315 - OBJ
      ?auto_12316 - OBJ
      ?auto_12317 - OBJ
      ?auto_12314 - LOCATION
    )
    :vars
    (
      ?auto_12318 - LOCATION
      ?auto_12320 - CITY
      ?auto_12319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12318 ?auto_12320 ) ( IN-CITY ?auto_12314 ?auto_12320 ) ( not ( = ?auto_12314 ?auto_12318 ) ) ( OBJ-AT ?auto_12316 ?auto_12314 ) ( not ( = ?auto_12316 ?auto_12315 ) ) ( OBJ-AT ?auto_12315 ?auto_12318 ) ( IN-TRUCK ?auto_12317 ?auto_12319 ) ( not ( = ?auto_12316 ?auto_12317 ) ) ( not ( = ?auto_12315 ?auto_12317 ) ) ( TRUCK-AT ?auto_12319 ?auto_12318 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12316 ?auto_12315 ?auto_12314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12330 - OBJ
      ?auto_12331 - OBJ
      ?auto_12332 - OBJ
      ?auto_12329 - LOCATION
    )
    :vars
    (
      ?auto_12333 - LOCATION
      ?auto_12335 - CITY
      ?auto_12334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12333 ?auto_12335 ) ( IN-CITY ?auto_12329 ?auto_12335 ) ( not ( = ?auto_12329 ?auto_12333 ) ) ( OBJ-AT ?auto_12332 ?auto_12329 ) ( not ( = ?auto_12332 ?auto_12330 ) ) ( OBJ-AT ?auto_12330 ?auto_12333 ) ( IN-TRUCK ?auto_12331 ?auto_12334 ) ( not ( = ?auto_12332 ?auto_12331 ) ) ( not ( = ?auto_12330 ?auto_12331 ) ) ( TRUCK-AT ?auto_12334 ?auto_12333 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12332 ?auto_12330 ?auto_12329 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12378 - OBJ
      ?auto_12377 - LOCATION
    )
    :vars
    (
      ?auto_12380 - LOCATION
      ?auto_12382 - CITY
      ?auto_12383 - OBJ
      ?auto_12379 - OBJ
      ?auto_12381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12380 ?auto_12382 ) ( IN-CITY ?auto_12377 ?auto_12382 ) ( not ( = ?auto_12377 ?auto_12380 ) ) ( OBJ-AT ?auto_12383 ?auto_12377 ) ( not ( = ?auto_12383 ?auto_12378 ) ) ( OBJ-AT ?auto_12378 ?auto_12380 ) ( not ( = ?auto_12383 ?auto_12379 ) ) ( not ( = ?auto_12378 ?auto_12379 ) ) ( TRUCK-AT ?auto_12381 ?auto_12380 ) ( OBJ-AT ?auto_12379 ?auto_12380 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12379 ?auto_12381 ?auto_12380 )
      ( DELIVER-2PKG ?auto_12383 ?auto_12378 ?auto_12377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12385 - OBJ
      ?auto_12386 - OBJ
      ?auto_12384 - LOCATION
    )
    :vars
    (
      ?auto_12389 - LOCATION
      ?auto_12390 - CITY
      ?auto_12387 - OBJ
      ?auto_12388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12389 ?auto_12390 ) ( IN-CITY ?auto_12384 ?auto_12390 ) ( not ( = ?auto_12384 ?auto_12389 ) ) ( OBJ-AT ?auto_12385 ?auto_12384 ) ( not ( = ?auto_12385 ?auto_12386 ) ) ( OBJ-AT ?auto_12386 ?auto_12389 ) ( not ( = ?auto_12385 ?auto_12387 ) ) ( not ( = ?auto_12386 ?auto_12387 ) ) ( TRUCK-AT ?auto_12388 ?auto_12389 ) ( OBJ-AT ?auto_12387 ?auto_12389 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12386 ?auto_12384 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12392 - OBJ
      ?auto_12393 - OBJ
      ?auto_12391 - LOCATION
    )
    :vars
    (
      ?auto_12395 - LOCATION
      ?auto_12394 - CITY
      ?auto_12396 - OBJ
      ?auto_12397 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12395 ?auto_12394 ) ( IN-CITY ?auto_12391 ?auto_12394 ) ( not ( = ?auto_12391 ?auto_12395 ) ) ( OBJ-AT ?auto_12396 ?auto_12391 ) ( not ( = ?auto_12396 ?auto_12393 ) ) ( OBJ-AT ?auto_12393 ?auto_12395 ) ( not ( = ?auto_12396 ?auto_12392 ) ) ( not ( = ?auto_12393 ?auto_12392 ) ) ( TRUCK-AT ?auto_12397 ?auto_12395 ) ( OBJ-AT ?auto_12392 ?auto_12395 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12396 ?auto_12393 ?auto_12391 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12399 - OBJ
      ?auto_12400 - OBJ
      ?auto_12398 - LOCATION
    )
    :vars
    (
      ?auto_12402 - LOCATION
      ?auto_12401 - CITY
      ?auto_12404 - OBJ
      ?auto_12403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12402 ?auto_12401 ) ( IN-CITY ?auto_12398 ?auto_12401 ) ( not ( = ?auto_12398 ?auto_12402 ) ) ( OBJ-AT ?auto_12400 ?auto_12398 ) ( not ( = ?auto_12400 ?auto_12399 ) ) ( OBJ-AT ?auto_12399 ?auto_12402 ) ( not ( = ?auto_12400 ?auto_12404 ) ) ( not ( = ?auto_12399 ?auto_12404 ) ) ( TRUCK-AT ?auto_12403 ?auto_12402 ) ( OBJ-AT ?auto_12404 ?auto_12402 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12400 ?auto_12399 ?auto_12398 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12406 - OBJ
      ?auto_12407 - OBJ
      ?auto_12405 - LOCATION
    )
    :vars
    (
      ?auto_12409 - LOCATION
      ?auto_12408 - CITY
      ?auto_12410 - OBJ
      ?auto_12411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12409 ?auto_12408 ) ( IN-CITY ?auto_12405 ?auto_12408 ) ( not ( = ?auto_12405 ?auto_12409 ) ) ( OBJ-AT ?auto_12410 ?auto_12405 ) ( not ( = ?auto_12410 ?auto_12406 ) ) ( OBJ-AT ?auto_12406 ?auto_12409 ) ( not ( = ?auto_12410 ?auto_12407 ) ) ( not ( = ?auto_12406 ?auto_12407 ) ) ( TRUCK-AT ?auto_12411 ?auto_12409 ) ( OBJ-AT ?auto_12407 ?auto_12409 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12410 ?auto_12406 ?auto_12405 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12421 - OBJ
      ?auto_12422 - OBJ
      ?auto_12423 - OBJ
      ?auto_12420 - LOCATION
    )
    :vars
    (
      ?auto_12425 - LOCATION
      ?auto_12424 - CITY
      ?auto_12427 - OBJ
      ?auto_12426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12425 ?auto_12424 ) ( IN-CITY ?auto_12420 ?auto_12424 ) ( not ( = ?auto_12420 ?auto_12425 ) ) ( OBJ-AT ?auto_12421 ?auto_12420 ) ( not ( = ?auto_12421 ?auto_12423 ) ) ( OBJ-AT ?auto_12423 ?auto_12425 ) ( not ( = ?auto_12421 ?auto_12427 ) ) ( not ( = ?auto_12423 ?auto_12427 ) ) ( TRUCK-AT ?auto_12426 ?auto_12425 ) ( OBJ-AT ?auto_12427 ?auto_12425 ) ( OBJ-AT ?auto_12422 ?auto_12420 ) ( not ( = ?auto_12421 ?auto_12422 ) ) ( not ( = ?auto_12422 ?auto_12423 ) ) ( not ( = ?auto_12422 ?auto_12427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12421 ?auto_12423 ?auto_12420 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12429 - OBJ
      ?auto_12430 - OBJ
      ?auto_12431 - OBJ
      ?auto_12428 - LOCATION
    )
    :vars
    (
      ?auto_12433 - LOCATION
      ?auto_12432 - CITY
      ?auto_12434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12433 ?auto_12432 ) ( IN-CITY ?auto_12428 ?auto_12432 ) ( not ( = ?auto_12428 ?auto_12433 ) ) ( OBJ-AT ?auto_12429 ?auto_12428 ) ( not ( = ?auto_12429 ?auto_12431 ) ) ( OBJ-AT ?auto_12431 ?auto_12433 ) ( not ( = ?auto_12429 ?auto_12430 ) ) ( not ( = ?auto_12431 ?auto_12430 ) ) ( TRUCK-AT ?auto_12434 ?auto_12433 ) ( OBJ-AT ?auto_12430 ?auto_12433 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12429 ?auto_12431 ?auto_12428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12436 - OBJ
      ?auto_12437 - OBJ
      ?auto_12438 - OBJ
      ?auto_12435 - LOCATION
    )
    :vars
    (
      ?auto_12440 - LOCATION
      ?auto_12439 - CITY
      ?auto_12442 - OBJ
      ?auto_12441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12440 ?auto_12439 ) ( IN-CITY ?auto_12435 ?auto_12439 ) ( not ( = ?auto_12435 ?auto_12440 ) ) ( OBJ-AT ?auto_12438 ?auto_12435 ) ( not ( = ?auto_12438 ?auto_12437 ) ) ( OBJ-AT ?auto_12437 ?auto_12440 ) ( not ( = ?auto_12438 ?auto_12442 ) ) ( not ( = ?auto_12437 ?auto_12442 ) ) ( TRUCK-AT ?auto_12441 ?auto_12440 ) ( OBJ-AT ?auto_12442 ?auto_12440 ) ( OBJ-AT ?auto_12436 ?auto_12435 ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12438 ) ) ( not ( = ?auto_12436 ?auto_12442 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12438 ?auto_12437 ?auto_12435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12444 - OBJ
      ?auto_12445 - OBJ
      ?auto_12446 - OBJ
      ?auto_12443 - LOCATION
    )
    :vars
    (
      ?auto_12448 - LOCATION
      ?auto_12447 - CITY
      ?auto_12449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12448 ?auto_12447 ) ( IN-CITY ?auto_12443 ?auto_12447 ) ( not ( = ?auto_12443 ?auto_12448 ) ) ( OBJ-AT ?auto_12444 ?auto_12443 ) ( not ( = ?auto_12444 ?auto_12445 ) ) ( OBJ-AT ?auto_12445 ?auto_12448 ) ( not ( = ?auto_12444 ?auto_12446 ) ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( TRUCK-AT ?auto_12449 ?auto_12448 ) ( OBJ-AT ?auto_12446 ?auto_12448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12444 ?auto_12445 ?auto_12443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12459 - OBJ
      ?auto_12460 - OBJ
      ?auto_12461 - OBJ
      ?auto_12458 - LOCATION
    )
    :vars
    (
      ?auto_12463 - LOCATION
      ?auto_12462 - CITY
      ?auto_12464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12463 ?auto_12462 ) ( IN-CITY ?auto_12458 ?auto_12462 ) ( not ( = ?auto_12458 ?auto_12463 ) ) ( OBJ-AT ?auto_12460 ?auto_12458 ) ( not ( = ?auto_12460 ?auto_12461 ) ) ( OBJ-AT ?auto_12461 ?auto_12463 ) ( not ( = ?auto_12460 ?auto_12459 ) ) ( not ( = ?auto_12461 ?auto_12459 ) ) ( TRUCK-AT ?auto_12464 ?auto_12463 ) ( OBJ-AT ?auto_12459 ?auto_12463 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12460 ?auto_12461 ?auto_12458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12474 - OBJ
      ?auto_12475 - OBJ
      ?auto_12476 - OBJ
      ?auto_12473 - LOCATION
    )
    :vars
    (
      ?auto_12478 - LOCATION
      ?auto_12477 - CITY
      ?auto_12479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12478 ?auto_12477 ) ( IN-CITY ?auto_12473 ?auto_12477 ) ( not ( = ?auto_12473 ?auto_12478 ) ) ( OBJ-AT ?auto_12476 ?auto_12473 ) ( not ( = ?auto_12476 ?auto_12475 ) ) ( OBJ-AT ?auto_12475 ?auto_12478 ) ( not ( = ?auto_12476 ?auto_12474 ) ) ( not ( = ?auto_12475 ?auto_12474 ) ) ( TRUCK-AT ?auto_12479 ?auto_12478 ) ( OBJ-AT ?auto_12474 ?auto_12478 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12476 ?auto_12475 ?auto_12473 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12497 - OBJ
      ?auto_12498 - OBJ
      ?auto_12499 - OBJ
      ?auto_12496 - LOCATION
    )
    :vars
    (
      ?auto_12501 - LOCATION
      ?auto_12500 - CITY
      ?auto_12503 - OBJ
      ?auto_12502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12501 ?auto_12500 ) ( IN-CITY ?auto_12496 ?auto_12500 ) ( not ( = ?auto_12496 ?auto_12501 ) ) ( OBJ-AT ?auto_12498 ?auto_12496 ) ( not ( = ?auto_12498 ?auto_12497 ) ) ( OBJ-AT ?auto_12497 ?auto_12501 ) ( not ( = ?auto_12498 ?auto_12503 ) ) ( not ( = ?auto_12497 ?auto_12503 ) ) ( TRUCK-AT ?auto_12502 ?auto_12501 ) ( OBJ-AT ?auto_12503 ?auto_12501 ) ( OBJ-AT ?auto_12499 ?auto_12496 ) ( not ( = ?auto_12497 ?auto_12499 ) ) ( not ( = ?auto_12498 ?auto_12499 ) ) ( not ( = ?auto_12499 ?auto_12503 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12498 ?auto_12497 ?auto_12496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12505 - OBJ
      ?auto_12506 - OBJ
      ?auto_12507 - OBJ
      ?auto_12504 - LOCATION
    )
    :vars
    (
      ?auto_12509 - LOCATION
      ?auto_12508 - CITY
      ?auto_12510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12509 ?auto_12508 ) ( IN-CITY ?auto_12504 ?auto_12508 ) ( not ( = ?auto_12504 ?auto_12509 ) ) ( OBJ-AT ?auto_12506 ?auto_12504 ) ( not ( = ?auto_12506 ?auto_12505 ) ) ( OBJ-AT ?auto_12505 ?auto_12509 ) ( not ( = ?auto_12506 ?auto_12507 ) ) ( not ( = ?auto_12505 ?auto_12507 ) ) ( TRUCK-AT ?auto_12510 ?auto_12509 ) ( OBJ-AT ?auto_12507 ?auto_12509 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12506 ?auto_12505 ?auto_12504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12520 - OBJ
      ?auto_12521 - OBJ
      ?auto_12522 - OBJ
      ?auto_12519 - LOCATION
    )
    :vars
    (
      ?auto_12524 - LOCATION
      ?auto_12523 - CITY
      ?auto_12525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12524 ?auto_12523 ) ( IN-CITY ?auto_12519 ?auto_12523 ) ( not ( = ?auto_12519 ?auto_12524 ) ) ( OBJ-AT ?auto_12522 ?auto_12519 ) ( not ( = ?auto_12522 ?auto_12520 ) ) ( OBJ-AT ?auto_12520 ?auto_12524 ) ( not ( = ?auto_12522 ?auto_12521 ) ) ( not ( = ?auto_12520 ?auto_12521 ) ) ( TRUCK-AT ?auto_12525 ?auto_12524 ) ( OBJ-AT ?auto_12521 ?auto_12524 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12522 ?auto_12520 ?auto_12519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12568 - OBJ
      ?auto_12567 - LOCATION
    )
    :vars
    (
      ?auto_12570 - LOCATION
      ?auto_12569 - CITY
      ?auto_12571 - OBJ
      ?auto_12573 - OBJ
      ?auto_12572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12570 ?auto_12569 ) ( IN-CITY ?auto_12567 ?auto_12569 ) ( not ( = ?auto_12567 ?auto_12570 ) ) ( OBJ-AT ?auto_12571 ?auto_12567 ) ( not ( = ?auto_12571 ?auto_12568 ) ) ( OBJ-AT ?auto_12568 ?auto_12570 ) ( not ( = ?auto_12571 ?auto_12573 ) ) ( not ( = ?auto_12568 ?auto_12573 ) ) ( OBJ-AT ?auto_12573 ?auto_12570 ) ( TRUCK-AT ?auto_12572 ?auto_12567 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12572 ?auto_12567 ?auto_12570 ?auto_12569 )
      ( DELIVER-2PKG ?auto_12571 ?auto_12568 ?auto_12567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12575 - OBJ
      ?auto_12576 - OBJ
      ?auto_12574 - LOCATION
    )
    :vars
    (
      ?auto_12579 - LOCATION
      ?auto_12580 - CITY
      ?auto_12577 - OBJ
      ?auto_12578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12579 ?auto_12580 ) ( IN-CITY ?auto_12574 ?auto_12580 ) ( not ( = ?auto_12574 ?auto_12579 ) ) ( OBJ-AT ?auto_12575 ?auto_12574 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( OBJ-AT ?auto_12576 ?auto_12579 ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( OBJ-AT ?auto_12577 ?auto_12579 ) ( TRUCK-AT ?auto_12578 ?auto_12574 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12576 ?auto_12574 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12582 - OBJ
      ?auto_12583 - OBJ
      ?auto_12581 - LOCATION
    )
    :vars
    (
      ?auto_12585 - LOCATION
      ?auto_12584 - CITY
      ?auto_12587 - OBJ
      ?auto_12586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12585 ?auto_12584 ) ( IN-CITY ?auto_12581 ?auto_12584 ) ( not ( = ?auto_12581 ?auto_12585 ) ) ( OBJ-AT ?auto_12587 ?auto_12581 ) ( not ( = ?auto_12587 ?auto_12583 ) ) ( OBJ-AT ?auto_12583 ?auto_12585 ) ( not ( = ?auto_12587 ?auto_12582 ) ) ( not ( = ?auto_12583 ?auto_12582 ) ) ( OBJ-AT ?auto_12582 ?auto_12585 ) ( TRUCK-AT ?auto_12586 ?auto_12581 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12587 ?auto_12583 ?auto_12581 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12589 - OBJ
      ?auto_12590 - OBJ
      ?auto_12588 - LOCATION
    )
    :vars
    (
      ?auto_12593 - LOCATION
      ?auto_12591 - CITY
      ?auto_12592 - OBJ
      ?auto_12594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12593 ?auto_12591 ) ( IN-CITY ?auto_12588 ?auto_12591 ) ( not ( = ?auto_12588 ?auto_12593 ) ) ( OBJ-AT ?auto_12590 ?auto_12588 ) ( not ( = ?auto_12590 ?auto_12589 ) ) ( OBJ-AT ?auto_12589 ?auto_12593 ) ( not ( = ?auto_12590 ?auto_12592 ) ) ( not ( = ?auto_12589 ?auto_12592 ) ) ( OBJ-AT ?auto_12592 ?auto_12593 ) ( TRUCK-AT ?auto_12594 ?auto_12588 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12590 ?auto_12589 ?auto_12588 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12596 - OBJ
      ?auto_12597 - OBJ
      ?auto_12595 - LOCATION
    )
    :vars
    (
      ?auto_12599 - LOCATION
      ?auto_12598 - CITY
      ?auto_12601 - OBJ
      ?auto_12600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12599 ?auto_12598 ) ( IN-CITY ?auto_12595 ?auto_12598 ) ( not ( = ?auto_12595 ?auto_12599 ) ) ( OBJ-AT ?auto_12601 ?auto_12595 ) ( not ( = ?auto_12601 ?auto_12596 ) ) ( OBJ-AT ?auto_12596 ?auto_12599 ) ( not ( = ?auto_12601 ?auto_12597 ) ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( OBJ-AT ?auto_12597 ?auto_12599 ) ( TRUCK-AT ?auto_12600 ?auto_12595 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12601 ?auto_12596 ?auto_12595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12611 - OBJ
      ?auto_12612 - OBJ
      ?auto_12613 - OBJ
      ?auto_12610 - LOCATION
    )
    :vars
    (
      ?auto_12616 - LOCATION
      ?auto_12614 - CITY
      ?auto_12615 - OBJ
      ?auto_12617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12616 ?auto_12614 ) ( IN-CITY ?auto_12610 ?auto_12614 ) ( not ( = ?auto_12610 ?auto_12616 ) ) ( OBJ-AT ?auto_12611 ?auto_12610 ) ( not ( = ?auto_12611 ?auto_12613 ) ) ( OBJ-AT ?auto_12613 ?auto_12616 ) ( not ( = ?auto_12611 ?auto_12615 ) ) ( not ( = ?auto_12613 ?auto_12615 ) ) ( OBJ-AT ?auto_12615 ?auto_12616 ) ( TRUCK-AT ?auto_12617 ?auto_12610 ) ( OBJ-AT ?auto_12612 ?auto_12610 ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12612 ?auto_12613 ) ) ( not ( = ?auto_12612 ?auto_12615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12611 ?auto_12613 ?auto_12610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12619 - OBJ
      ?auto_12620 - OBJ
      ?auto_12621 - OBJ
      ?auto_12618 - LOCATION
    )
    :vars
    (
      ?auto_12623 - LOCATION
      ?auto_12622 - CITY
      ?auto_12624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12623 ?auto_12622 ) ( IN-CITY ?auto_12618 ?auto_12622 ) ( not ( = ?auto_12618 ?auto_12623 ) ) ( OBJ-AT ?auto_12619 ?auto_12618 ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( OBJ-AT ?auto_12621 ?auto_12623 ) ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12621 ?auto_12620 ) ) ( OBJ-AT ?auto_12620 ?auto_12623 ) ( TRUCK-AT ?auto_12624 ?auto_12618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12619 ?auto_12621 ?auto_12618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12626 - OBJ
      ?auto_12627 - OBJ
      ?auto_12628 - OBJ
      ?auto_12625 - LOCATION
    )
    :vars
    (
      ?auto_12631 - LOCATION
      ?auto_12629 - CITY
      ?auto_12630 - OBJ
      ?auto_12632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12631 ?auto_12629 ) ( IN-CITY ?auto_12625 ?auto_12629 ) ( not ( = ?auto_12625 ?auto_12631 ) ) ( OBJ-AT ?auto_12628 ?auto_12625 ) ( not ( = ?auto_12628 ?auto_12627 ) ) ( OBJ-AT ?auto_12627 ?auto_12631 ) ( not ( = ?auto_12628 ?auto_12630 ) ) ( not ( = ?auto_12627 ?auto_12630 ) ) ( OBJ-AT ?auto_12630 ?auto_12631 ) ( TRUCK-AT ?auto_12632 ?auto_12625 ) ( OBJ-AT ?auto_12626 ?auto_12625 ) ( not ( = ?auto_12626 ?auto_12627 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12628 ?auto_12627 ?auto_12625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12634 - OBJ
      ?auto_12635 - OBJ
      ?auto_12636 - OBJ
      ?auto_12633 - LOCATION
    )
    :vars
    (
      ?auto_12638 - LOCATION
      ?auto_12637 - CITY
      ?auto_12639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12638 ?auto_12637 ) ( IN-CITY ?auto_12633 ?auto_12637 ) ( not ( = ?auto_12633 ?auto_12638 ) ) ( OBJ-AT ?auto_12634 ?auto_12633 ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( OBJ-AT ?auto_12635 ?auto_12638 ) ( not ( = ?auto_12634 ?auto_12636 ) ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( OBJ-AT ?auto_12636 ?auto_12638 ) ( TRUCK-AT ?auto_12639 ?auto_12633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12634 ?auto_12635 ?auto_12633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12649 - OBJ
      ?auto_12650 - OBJ
      ?auto_12651 - OBJ
      ?auto_12648 - LOCATION
    )
    :vars
    (
      ?auto_12653 - LOCATION
      ?auto_12652 - CITY
      ?auto_12654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12653 ?auto_12652 ) ( IN-CITY ?auto_12648 ?auto_12652 ) ( not ( = ?auto_12648 ?auto_12653 ) ) ( OBJ-AT ?auto_12650 ?auto_12648 ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( OBJ-AT ?auto_12651 ?auto_12653 ) ( not ( = ?auto_12650 ?auto_12649 ) ) ( not ( = ?auto_12651 ?auto_12649 ) ) ( OBJ-AT ?auto_12649 ?auto_12653 ) ( TRUCK-AT ?auto_12654 ?auto_12648 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12650 ?auto_12651 ?auto_12648 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12664 - OBJ
      ?auto_12665 - OBJ
      ?auto_12666 - OBJ
      ?auto_12663 - LOCATION
    )
    :vars
    (
      ?auto_12668 - LOCATION
      ?auto_12667 - CITY
      ?auto_12669 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12668 ?auto_12667 ) ( IN-CITY ?auto_12663 ?auto_12667 ) ( not ( = ?auto_12663 ?auto_12668 ) ) ( OBJ-AT ?auto_12666 ?auto_12663 ) ( not ( = ?auto_12666 ?auto_12665 ) ) ( OBJ-AT ?auto_12665 ?auto_12668 ) ( not ( = ?auto_12666 ?auto_12664 ) ) ( not ( = ?auto_12665 ?auto_12664 ) ) ( OBJ-AT ?auto_12664 ?auto_12668 ) ( TRUCK-AT ?auto_12669 ?auto_12663 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12666 ?auto_12665 ?auto_12663 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12687 - OBJ
      ?auto_12688 - OBJ
      ?auto_12689 - OBJ
      ?auto_12686 - LOCATION
    )
    :vars
    (
      ?auto_12692 - LOCATION
      ?auto_12690 - CITY
      ?auto_12691 - OBJ
      ?auto_12693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12692 ?auto_12690 ) ( IN-CITY ?auto_12686 ?auto_12690 ) ( not ( = ?auto_12686 ?auto_12692 ) ) ( OBJ-AT ?auto_12688 ?auto_12686 ) ( not ( = ?auto_12688 ?auto_12687 ) ) ( OBJ-AT ?auto_12687 ?auto_12692 ) ( not ( = ?auto_12688 ?auto_12691 ) ) ( not ( = ?auto_12687 ?auto_12691 ) ) ( OBJ-AT ?auto_12691 ?auto_12692 ) ( TRUCK-AT ?auto_12693 ?auto_12686 ) ( OBJ-AT ?auto_12689 ?auto_12686 ) ( not ( = ?auto_12687 ?auto_12689 ) ) ( not ( = ?auto_12688 ?auto_12689 ) ) ( not ( = ?auto_12689 ?auto_12691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12688 ?auto_12687 ?auto_12686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12695 - OBJ
      ?auto_12696 - OBJ
      ?auto_12697 - OBJ
      ?auto_12694 - LOCATION
    )
    :vars
    (
      ?auto_12699 - LOCATION
      ?auto_12698 - CITY
      ?auto_12700 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12699 ?auto_12698 ) ( IN-CITY ?auto_12694 ?auto_12698 ) ( not ( = ?auto_12694 ?auto_12699 ) ) ( OBJ-AT ?auto_12696 ?auto_12694 ) ( not ( = ?auto_12696 ?auto_12695 ) ) ( OBJ-AT ?auto_12695 ?auto_12699 ) ( not ( = ?auto_12696 ?auto_12697 ) ) ( not ( = ?auto_12695 ?auto_12697 ) ) ( OBJ-AT ?auto_12697 ?auto_12699 ) ( TRUCK-AT ?auto_12700 ?auto_12694 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12696 ?auto_12695 ?auto_12694 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12710 - OBJ
      ?auto_12711 - OBJ
      ?auto_12712 - OBJ
      ?auto_12709 - LOCATION
    )
    :vars
    (
      ?auto_12714 - LOCATION
      ?auto_12713 - CITY
      ?auto_12715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12714 ?auto_12713 ) ( IN-CITY ?auto_12709 ?auto_12713 ) ( not ( = ?auto_12709 ?auto_12714 ) ) ( OBJ-AT ?auto_12712 ?auto_12709 ) ( not ( = ?auto_12712 ?auto_12710 ) ) ( OBJ-AT ?auto_12710 ?auto_12714 ) ( not ( = ?auto_12712 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( OBJ-AT ?auto_12711 ?auto_12714 ) ( TRUCK-AT ?auto_12715 ?auto_12709 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12712 ?auto_12710 ?auto_12709 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12758 - OBJ
      ?auto_12757 - LOCATION
    )
    :vars
    (
      ?auto_12761 - LOCATION
      ?auto_12759 - CITY
      ?auto_12763 - OBJ
      ?auto_12760 - OBJ
      ?auto_12762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12761 ?auto_12759 ) ( IN-CITY ?auto_12757 ?auto_12759 ) ( not ( = ?auto_12757 ?auto_12761 ) ) ( not ( = ?auto_12763 ?auto_12758 ) ) ( OBJ-AT ?auto_12758 ?auto_12761 ) ( not ( = ?auto_12763 ?auto_12760 ) ) ( not ( = ?auto_12758 ?auto_12760 ) ) ( OBJ-AT ?auto_12760 ?auto_12761 ) ( TRUCK-AT ?auto_12762 ?auto_12757 ) ( IN-TRUCK ?auto_12763 ?auto_12762 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12763 ?auto_12757 )
      ( DELIVER-2PKG ?auto_12763 ?auto_12758 ?auto_12757 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12765 - OBJ
      ?auto_12766 - OBJ
      ?auto_12764 - LOCATION
    )
    :vars
    (
      ?auto_12768 - LOCATION
      ?auto_12770 - CITY
      ?auto_12767 - OBJ
      ?auto_12769 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12768 ?auto_12770 ) ( IN-CITY ?auto_12764 ?auto_12770 ) ( not ( = ?auto_12764 ?auto_12768 ) ) ( not ( = ?auto_12765 ?auto_12766 ) ) ( OBJ-AT ?auto_12766 ?auto_12768 ) ( not ( = ?auto_12765 ?auto_12767 ) ) ( not ( = ?auto_12766 ?auto_12767 ) ) ( OBJ-AT ?auto_12767 ?auto_12768 ) ( TRUCK-AT ?auto_12769 ?auto_12764 ) ( IN-TRUCK ?auto_12765 ?auto_12769 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12766 ?auto_12764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12772 - OBJ
      ?auto_12773 - OBJ
      ?auto_12771 - LOCATION
    )
    :vars
    (
      ?auto_12776 - LOCATION
      ?auto_12775 - CITY
      ?auto_12777 - OBJ
      ?auto_12774 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12776 ?auto_12775 ) ( IN-CITY ?auto_12771 ?auto_12775 ) ( not ( = ?auto_12771 ?auto_12776 ) ) ( not ( = ?auto_12777 ?auto_12773 ) ) ( OBJ-AT ?auto_12773 ?auto_12776 ) ( not ( = ?auto_12777 ?auto_12772 ) ) ( not ( = ?auto_12773 ?auto_12772 ) ) ( OBJ-AT ?auto_12772 ?auto_12776 ) ( TRUCK-AT ?auto_12774 ?auto_12771 ) ( IN-TRUCK ?auto_12777 ?auto_12774 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12777 ?auto_12773 ?auto_12771 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12779 - OBJ
      ?auto_12780 - OBJ
      ?auto_12778 - LOCATION
    )
    :vars
    (
      ?auto_12783 - LOCATION
      ?auto_12782 - CITY
      ?auto_12784 - OBJ
      ?auto_12781 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12783 ?auto_12782 ) ( IN-CITY ?auto_12778 ?auto_12782 ) ( not ( = ?auto_12778 ?auto_12783 ) ) ( not ( = ?auto_12780 ?auto_12779 ) ) ( OBJ-AT ?auto_12779 ?auto_12783 ) ( not ( = ?auto_12780 ?auto_12784 ) ) ( not ( = ?auto_12779 ?auto_12784 ) ) ( OBJ-AT ?auto_12784 ?auto_12783 ) ( TRUCK-AT ?auto_12781 ?auto_12778 ) ( IN-TRUCK ?auto_12780 ?auto_12781 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12780 ?auto_12779 ?auto_12778 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12786 - OBJ
      ?auto_12787 - OBJ
      ?auto_12785 - LOCATION
    )
    :vars
    (
      ?auto_12790 - LOCATION
      ?auto_12789 - CITY
      ?auto_12791 - OBJ
      ?auto_12788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12790 ?auto_12789 ) ( IN-CITY ?auto_12785 ?auto_12789 ) ( not ( = ?auto_12785 ?auto_12790 ) ) ( not ( = ?auto_12791 ?auto_12786 ) ) ( OBJ-AT ?auto_12786 ?auto_12790 ) ( not ( = ?auto_12791 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( OBJ-AT ?auto_12787 ?auto_12790 ) ( TRUCK-AT ?auto_12788 ?auto_12785 ) ( IN-TRUCK ?auto_12791 ?auto_12788 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12791 ?auto_12786 ?auto_12785 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12809 - OBJ
      ?auto_12810 - OBJ
      ?auto_12811 - OBJ
      ?auto_12808 - LOCATION
    )
    :vars
    (
      ?auto_12814 - LOCATION
      ?auto_12813 - CITY
      ?auto_12812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12814 ?auto_12813 ) ( IN-CITY ?auto_12808 ?auto_12813 ) ( not ( = ?auto_12808 ?auto_12814 ) ) ( not ( = ?auto_12809 ?auto_12811 ) ) ( OBJ-AT ?auto_12811 ?auto_12814 ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( not ( = ?auto_12811 ?auto_12810 ) ) ( OBJ-AT ?auto_12810 ?auto_12814 ) ( TRUCK-AT ?auto_12812 ?auto_12808 ) ( IN-TRUCK ?auto_12809 ?auto_12812 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12809 ?auto_12811 ?auto_12808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12824 - OBJ
      ?auto_12825 - OBJ
      ?auto_12826 - OBJ
      ?auto_12823 - LOCATION
    )
    :vars
    (
      ?auto_12829 - LOCATION
      ?auto_12828 - CITY
      ?auto_12827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12829 ?auto_12828 ) ( IN-CITY ?auto_12823 ?auto_12828 ) ( not ( = ?auto_12823 ?auto_12829 ) ) ( not ( = ?auto_12824 ?auto_12825 ) ) ( OBJ-AT ?auto_12825 ?auto_12829 ) ( not ( = ?auto_12824 ?auto_12826 ) ) ( not ( = ?auto_12825 ?auto_12826 ) ) ( OBJ-AT ?auto_12826 ?auto_12829 ) ( TRUCK-AT ?auto_12827 ?auto_12823 ) ( IN-TRUCK ?auto_12824 ?auto_12827 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12824 ?auto_12825 ?auto_12823 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12839 - OBJ
      ?auto_12840 - OBJ
      ?auto_12841 - OBJ
      ?auto_12838 - LOCATION
    )
    :vars
    (
      ?auto_12844 - LOCATION
      ?auto_12843 - CITY
      ?auto_12842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12844 ?auto_12843 ) ( IN-CITY ?auto_12838 ?auto_12843 ) ( not ( = ?auto_12838 ?auto_12844 ) ) ( not ( = ?auto_12840 ?auto_12841 ) ) ( OBJ-AT ?auto_12841 ?auto_12844 ) ( not ( = ?auto_12840 ?auto_12839 ) ) ( not ( = ?auto_12841 ?auto_12839 ) ) ( OBJ-AT ?auto_12839 ?auto_12844 ) ( TRUCK-AT ?auto_12842 ?auto_12838 ) ( IN-TRUCK ?auto_12840 ?auto_12842 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12840 ?auto_12841 ?auto_12838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12854 - OBJ
      ?auto_12855 - OBJ
      ?auto_12856 - OBJ
      ?auto_12853 - LOCATION
    )
    :vars
    (
      ?auto_12859 - LOCATION
      ?auto_12858 - CITY
      ?auto_12857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12859 ?auto_12858 ) ( IN-CITY ?auto_12853 ?auto_12858 ) ( not ( = ?auto_12853 ?auto_12859 ) ) ( not ( = ?auto_12856 ?auto_12855 ) ) ( OBJ-AT ?auto_12855 ?auto_12859 ) ( not ( = ?auto_12856 ?auto_12854 ) ) ( not ( = ?auto_12855 ?auto_12854 ) ) ( OBJ-AT ?auto_12854 ?auto_12859 ) ( TRUCK-AT ?auto_12857 ?auto_12853 ) ( IN-TRUCK ?auto_12856 ?auto_12857 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12856 ?auto_12855 ?auto_12853 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12885 - OBJ
      ?auto_12886 - OBJ
      ?auto_12887 - OBJ
      ?auto_12884 - LOCATION
    )
    :vars
    (
      ?auto_12890 - LOCATION
      ?auto_12889 - CITY
      ?auto_12888 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12890 ?auto_12889 ) ( IN-CITY ?auto_12884 ?auto_12889 ) ( not ( = ?auto_12884 ?auto_12890 ) ) ( not ( = ?auto_12886 ?auto_12885 ) ) ( OBJ-AT ?auto_12885 ?auto_12890 ) ( not ( = ?auto_12886 ?auto_12887 ) ) ( not ( = ?auto_12885 ?auto_12887 ) ) ( OBJ-AT ?auto_12887 ?auto_12890 ) ( TRUCK-AT ?auto_12888 ?auto_12884 ) ( IN-TRUCK ?auto_12886 ?auto_12888 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12886 ?auto_12885 ?auto_12884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12900 - OBJ
      ?auto_12901 - OBJ
      ?auto_12902 - OBJ
      ?auto_12899 - LOCATION
    )
    :vars
    (
      ?auto_12905 - LOCATION
      ?auto_12904 - CITY
      ?auto_12903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12905 ?auto_12904 ) ( IN-CITY ?auto_12899 ?auto_12904 ) ( not ( = ?auto_12899 ?auto_12905 ) ) ( not ( = ?auto_12902 ?auto_12900 ) ) ( OBJ-AT ?auto_12900 ?auto_12905 ) ( not ( = ?auto_12902 ?auto_12901 ) ) ( not ( = ?auto_12900 ?auto_12901 ) ) ( OBJ-AT ?auto_12901 ?auto_12905 ) ( TRUCK-AT ?auto_12903 ?auto_12899 ) ( IN-TRUCK ?auto_12902 ?auto_12903 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12902 ?auto_12900 ?auto_12899 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12948 - OBJ
      ?auto_12947 - LOCATION
    )
    :vars
    (
      ?auto_12951 - LOCATION
      ?auto_12950 - CITY
      ?auto_12953 - OBJ
      ?auto_12952 - OBJ
      ?auto_12949 - TRUCK
      ?auto_12954 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12951 ?auto_12950 ) ( IN-CITY ?auto_12947 ?auto_12950 ) ( not ( = ?auto_12947 ?auto_12951 ) ) ( not ( = ?auto_12953 ?auto_12948 ) ) ( OBJ-AT ?auto_12948 ?auto_12951 ) ( not ( = ?auto_12953 ?auto_12952 ) ) ( not ( = ?auto_12948 ?auto_12952 ) ) ( OBJ-AT ?auto_12952 ?auto_12951 ) ( IN-TRUCK ?auto_12953 ?auto_12949 ) ( TRUCK-AT ?auto_12949 ?auto_12954 ) ( IN-CITY ?auto_12954 ?auto_12950 ) ( not ( = ?auto_12947 ?auto_12954 ) ) ( not ( = ?auto_12951 ?auto_12954 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12949 ?auto_12954 ?auto_12947 ?auto_12950 )
      ( DELIVER-2PKG ?auto_12953 ?auto_12948 ?auto_12947 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12956 - OBJ
      ?auto_12957 - OBJ
      ?auto_12955 - LOCATION
    )
    :vars
    (
      ?auto_12958 - LOCATION
      ?auto_12959 - CITY
      ?auto_12962 - OBJ
      ?auto_12960 - TRUCK
      ?auto_12961 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12958 ?auto_12959 ) ( IN-CITY ?auto_12955 ?auto_12959 ) ( not ( = ?auto_12955 ?auto_12958 ) ) ( not ( = ?auto_12956 ?auto_12957 ) ) ( OBJ-AT ?auto_12957 ?auto_12958 ) ( not ( = ?auto_12956 ?auto_12962 ) ) ( not ( = ?auto_12957 ?auto_12962 ) ) ( OBJ-AT ?auto_12962 ?auto_12958 ) ( IN-TRUCK ?auto_12956 ?auto_12960 ) ( TRUCK-AT ?auto_12960 ?auto_12961 ) ( IN-CITY ?auto_12961 ?auto_12959 ) ( not ( = ?auto_12955 ?auto_12961 ) ) ( not ( = ?auto_12958 ?auto_12961 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12957 ?auto_12955 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12964 - OBJ
      ?auto_12965 - OBJ
      ?auto_12963 - LOCATION
    )
    :vars
    (
      ?auto_12969 - LOCATION
      ?auto_12967 - CITY
      ?auto_12970 - OBJ
      ?auto_12966 - TRUCK
      ?auto_12968 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12969 ?auto_12967 ) ( IN-CITY ?auto_12963 ?auto_12967 ) ( not ( = ?auto_12963 ?auto_12969 ) ) ( not ( = ?auto_12970 ?auto_12965 ) ) ( OBJ-AT ?auto_12965 ?auto_12969 ) ( not ( = ?auto_12970 ?auto_12964 ) ) ( not ( = ?auto_12965 ?auto_12964 ) ) ( OBJ-AT ?auto_12964 ?auto_12969 ) ( IN-TRUCK ?auto_12970 ?auto_12966 ) ( TRUCK-AT ?auto_12966 ?auto_12968 ) ( IN-CITY ?auto_12968 ?auto_12967 ) ( not ( = ?auto_12963 ?auto_12968 ) ) ( not ( = ?auto_12969 ?auto_12968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12970 ?auto_12965 ?auto_12963 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12972 - OBJ
      ?auto_12973 - OBJ
      ?auto_12971 - LOCATION
    )
    :vars
    (
      ?auto_12978 - LOCATION
      ?auto_12976 - CITY
      ?auto_12974 - OBJ
      ?auto_12975 - TRUCK
      ?auto_12977 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12978 ?auto_12976 ) ( IN-CITY ?auto_12971 ?auto_12976 ) ( not ( = ?auto_12971 ?auto_12978 ) ) ( not ( = ?auto_12973 ?auto_12972 ) ) ( OBJ-AT ?auto_12972 ?auto_12978 ) ( not ( = ?auto_12973 ?auto_12974 ) ) ( not ( = ?auto_12972 ?auto_12974 ) ) ( OBJ-AT ?auto_12974 ?auto_12978 ) ( IN-TRUCK ?auto_12973 ?auto_12975 ) ( TRUCK-AT ?auto_12975 ?auto_12977 ) ( IN-CITY ?auto_12977 ?auto_12976 ) ( not ( = ?auto_12971 ?auto_12977 ) ) ( not ( = ?auto_12978 ?auto_12977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12973 ?auto_12972 ?auto_12971 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12980 - OBJ
      ?auto_12981 - OBJ
      ?auto_12979 - LOCATION
    )
    :vars
    (
      ?auto_12985 - LOCATION
      ?auto_12983 - CITY
      ?auto_12986 - OBJ
      ?auto_12982 - TRUCK
      ?auto_12984 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12985 ?auto_12983 ) ( IN-CITY ?auto_12979 ?auto_12983 ) ( not ( = ?auto_12979 ?auto_12985 ) ) ( not ( = ?auto_12986 ?auto_12980 ) ) ( OBJ-AT ?auto_12980 ?auto_12985 ) ( not ( = ?auto_12986 ?auto_12981 ) ) ( not ( = ?auto_12980 ?auto_12981 ) ) ( OBJ-AT ?auto_12981 ?auto_12985 ) ( IN-TRUCK ?auto_12986 ?auto_12982 ) ( TRUCK-AT ?auto_12982 ?auto_12984 ) ( IN-CITY ?auto_12984 ?auto_12983 ) ( not ( = ?auto_12979 ?auto_12984 ) ) ( not ( = ?auto_12985 ?auto_12984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12986 ?auto_12980 ?auto_12979 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13006 - OBJ
      ?auto_13007 - OBJ
      ?auto_13008 - OBJ
      ?auto_13005 - LOCATION
    )
    :vars
    (
      ?auto_13012 - LOCATION
      ?auto_13010 - CITY
      ?auto_13009 - TRUCK
      ?auto_13011 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13012 ?auto_13010 ) ( IN-CITY ?auto_13005 ?auto_13010 ) ( not ( = ?auto_13005 ?auto_13012 ) ) ( not ( = ?auto_13006 ?auto_13008 ) ) ( OBJ-AT ?auto_13008 ?auto_13012 ) ( not ( = ?auto_13006 ?auto_13007 ) ) ( not ( = ?auto_13008 ?auto_13007 ) ) ( OBJ-AT ?auto_13007 ?auto_13012 ) ( IN-TRUCK ?auto_13006 ?auto_13009 ) ( TRUCK-AT ?auto_13009 ?auto_13011 ) ( IN-CITY ?auto_13011 ?auto_13010 ) ( not ( = ?auto_13005 ?auto_13011 ) ) ( not ( = ?auto_13012 ?auto_13011 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13006 ?auto_13008 ?auto_13005 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13023 - OBJ
      ?auto_13024 - OBJ
      ?auto_13025 - OBJ
      ?auto_13022 - LOCATION
    )
    :vars
    (
      ?auto_13029 - LOCATION
      ?auto_13027 - CITY
      ?auto_13026 - TRUCK
      ?auto_13028 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13029 ?auto_13027 ) ( IN-CITY ?auto_13022 ?auto_13027 ) ( not ( = ?auto_13022 ?auto_13029 ) ) ( not ( = ?auto_13023 ?auto_13024 ) ) ( OBJ-AT ?auto_13024 ?auto_13029 ) ( not ( = ?auto_13023 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( OBJ-AT ?auto_13025 ?auto_13029 ) ( IN-TRUCK ?auto_13023 ?auto_13026 ) ( TRUCK-AT ?auto_13026 ?auto_13028 ) ( IN-CITY ?auto_13028 ?auto_13027 ) ( not ( = ?auto_13022 ?auto_13028 ) ) ( not ( = ?auto_13029 ?auto_13028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13023 ?auto_13024 ?auto_13022 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13040 - OBJ
      ?auto_13041 - OBJ
      ?auto_13042 - OBJ
      ?auto_13039 - LOCATION
    )
    :vars
    (
      ?auto_13046 - LOCATION
      ?auto_13044 - CITY
      ?auto_13043 - TRUCK
      ?auto_13045 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13046 ?auto_13044 ) ( IN-CITY ?auto_13039 ?auto_13044 ) ( not ( = ?auto_13039 ?auto_13046 ) ) ( not ( = ?auto_13041 ?auto_13042 ) ) ( OBJ-AT ?auto_13042 ?auto_13046 ) ( not ( = ?auto_13041 ?auto_13040 ) ) ( not ( = ?auto_13042 ?auto_13040 ) ) ( OBJ-AT ?auto_13040 ?auto_13046 ) ( IN-TRUCK ?auto_13041 ?auto_13043 ) ( TRUCK-AT ?auto_13043 ?auto_13045 ) ( IN-CITY ?auto_13045 ?auto_13044 ) ( not ( = ?auto_13039 ?auto_13045 ) ) ( not ( = ?auto_13046 ?auto_13045 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13041 ?auto_13042 ?auto_13039 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13057 - OBJ
      ?auto_13058 - OBJ
      ?auto_13059 - OBJ
      ?auto_13056 - LOCATION
    )
    :vars
    (
      ?auto_13063 - LOCATION
      ?auto_13061 - CITY
      ?auto_13060 - TRUCK
      ?auto_13062 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13063 ?auto_13061 ) ( IN-CITY ?auto_13056 ?auto_13061 ) ( not ( = ?auto_13056 ?auto_13063 ) ) ( not ( = ?auto_13059 ?auto_13058 ) ) ( OBJ-AT ?auto_13058 ?auto_13063 ) ( not ( = ?auto_13059 ?auto_13057 ) ) ( not ( = ?auto_13058 ?auto_13057 ) ) ( OBJ-AT ?auto_13057 ?auto_13063 ) ( IN-TRUCK ?auto_13059 ?auto_13060 ) ( TRUCK-AT ?auto_13060 ?auto_13062 ) ( IN-CITY ?auto_13062 ?auto_13061 ) ( not ( = ?auto_13056 ?auto_13062 ) ) ( not ( = ?auto_13063 ?auto_13062 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13059 ?auto_13058 ?auto_13056 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13092 - OBJ
      ?auto_13093 - OBJ
      ?auto_13094 - OBJ
      ?auto_13091 - LOCATION
    )
    :vars
    (
      ?auto_13098 - LOCATION
      ?auto_13096 - CITY
      ?auto_13095 - TRUCK
      ?auto_13097 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13098 ?auto_13096 ) ( IN-CITY ?auto_13091 ?auto_13096 ) ( not ( = ?auto_13091 ?auto_13098 ) ) ( not ( = ?auto_13093 ?auto_13092 ) ) ( OBJ-AT ?auto_13092 ?auto_13098 ) ( not ( = ?auto_13093 ?auto_13094 ) ) ( not ( = ?auto_13092 ?auto_13094 ) ) ( OBJ-AT ?auto_13094 ?auto_13098 ) ( IN-TRUCK ?auto_13093 ?auto_13095 ) ( TRUCK-AT ?auto_13095 ?auto_13097 ) ( IN-CITY ?auto_13097 ?auto_13096 ) ( not ( = ?auto_13091 ?auto_13097 ) ) ( not ( = ?auto_13098 ?auto_13097 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13093 ?auto_13092 ?auto_13091 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13109 - OBJ
      ?auto_13110 - OBJ
      ?auto_13111 - OBJ
      ?auto_13108 - LOCATION
    )
    :vars
    (
      ?auto_13115 - LOCATION
      ?auto_13113 - CITY
      ?auto_13112 - TRUCK
      ?auto_13114 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13115 ?auto_13113 ) ( IN-CITY ?auto_13108 ?auto_13113 ) ( not ( = ?auto_13108 ?auto_13115 ) ) ( not ( = ?auto_13111 ?auto_13109 ) ) ( OBJ-AT ?auto_13109 ?auto_13115 ) ( not ( = ?auto_13111 ?auto_13110 ) ) ( not ( = ?auto_13109 ?auto_13110 ) ) ( OBJ-AT ?auto_13110 ?auto_13115 ) ( IN-TRUCK ?auto_13111 ?auto_13112 ) ( TRUCK-AT ?auto_13112 ?auto_13114 ) ( IN-CITY ?auto_13114 ?auto_13113 ) ( not ( = ?auto_13108 ?auto_13114 ) ) ( not ( = ?auto_13115 ?auto_13114 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13111 ?auto_13109 ?auto_13108 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13163 - OBJ
      ?auto_13162 - LOCATION
    )
    :vars
    (
      ?auto_13168 - LOCATION
      ?auto_13166 - CITY
      ?auto_13169 - OBJ
      ?auto_13164 - OBJ
      ?auto_13165 - TRUCK
      ?auto_13167 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13168 ?auto_13166 ) ( IN-CITY ?auto_13162 ?auto_13166 ) ( not ( = ?auto_13162 ?auto_13168 ) ) ( not ( = ?auto_13169 ?auto_13163 ) ) ( OBJ-AT ?auto_13163 ?auto_13168 ) ( not ( = ?auto_13169 ?auto_13164 ) ) ( not ( = ?auto_13163 ?auto_13164 ) ) ( OBJ-AT ?auto_13164 ?auto_13168 ) ( TRUCK-AT ?auto_13165 ?auto_13167 ) ( IN-CITY ?auto_13167 ?auto_13166 ) ( not ( = ?auto_13162 ?auto_13167 ) ) ( not ( = ?auto_13168 ?auto_13167 ) ) ( OBJ-AT ?auto_13169 ?auto_13167 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13169 ?auto_13165 ?auto_13167 )
      ( DELIVER-2PKG ?auto_13169 ?auto_13163 ?auto_13162 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13171 - OBJ
      ?auto_13172 - OBJ
      ?auto_13170 - LOCATION
    )
    :vars
    (
      ?auto_13177 - LOCATION
      ?auto_13173 - CITY
      ?auto_13176 - OBJ
      ?auto_13175 - TRUCK
      ?auto_13174 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13177 ?auto_13173 ) ( IN-CITY ?auto_13170 ?auto_13173 ) ( not ( = ?auto_13170 ?auto_13177 ) ) ( not ( = ?auto_13171 ?auto_13172 ) ) ( OBJ-AT ?auto_13172 ?auto_13177 ) ( not ( = ?auto_13171 ?auto_13176 ) ) ( not ( = ?auto_13172 ?auto_13176 ) ) ( OBJ-AT ?auto_13176 ?auto_13177 ) ( TRUCK-AT ?auto_13175 ?auto_13174 ) ( IN-CITY ?auto_13174 ?auto_13173 ) ( not ( = ?auto_13170 ?auto_13174 ) ) ( not ( = ?auto_13177 ?auto_13174 ) ) ( OBJ-AT ?auto_13171 ?auto_13174 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13172 ?auto_13170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13179 - OBJ
      ?auto_13180 - OBJ
      ?auto_13178 - LOCATION
    )
    :vars
    (
      ?auto_13183 - LOCATION
      ?auto_13184 - CITY
      ?auto_13185 - OBJ
      ?auto_13182 - TRUCK
      ?auto_13181 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13183 ?auto_13184 ) ( IN-CITY ?auto_13178 ?auto_13184 ) ( not ( = ?auto_13178 ?auto_13183 ) ) ( not ( = ?auto_13185 ?auto_13180 ) ) ( OBJ-AT ?auto_13180 ?auto_13183 ) ( not ( = ?auto_13185 ?auto_13179 ) ) ( not ( = ?auto_13180 ?auto_13179 ) ) ( OBJ-AT ?auto_13179 ?auto_13183 ) ( TRUCK-AT ?auto_13182 ?auto_13181 ) ( IN-CITY ?auto_13181 ?auto_13184 ) ( not ( = ?auto_13178 ?auto_13181 ) ) ( not ( = ?auto_13183 ?auto_13181 ) ) ( OBJ-AT ?auto_13185 ?auto_13181 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13185 ?auto_13180 ?auto_13178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13187 - OBJ
      ?auto_13188 - OBJ
      ?auto_13186 - LOCATION
    )
    :vars
    (
      ?auto_13192 - LOCATION
      ?auto_13193 - CITY
      ?auto_13189 - OBJ
      ?auto_13191 - TRUCK
      ?auto_13190 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13192 ?auto_13193 ) ( IN-CITY ?auto_13186 ?auto_13193 ) ( not ( = ?auto_13186 ?auto_13192 ) ) ( not ( = ?auto_13188 ?auto_13187 ) ) ( OBJ-AT ?auto_13187 ?auto_13192 ) ( not ( = ?auto_13188 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13189 ) ) ( OBJ-AT ?auto_13189 ?auto_13192 ) ( TRUCK-AT ?auto_13191 ?auto_13190 ) ( IN-CITY ?auto_13190 ?auto_13193 ) ( not ( = ?auto_13186 ?auto_13190 ) ) ( not ( = ?auto_13192 ?auto_13190 ) ) ( OBJ-AT ?auto_13188 ?auto_13190 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13188 ?auto_13187 ?auto_13186 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13195 - OBJ
      ?auto_13196 - OBJ
      ?auto_13194 - LOCATION
    )
    :vars
    (
      ?auto_13199 - LOCATION
      ?auto_13200 - CITY
      ?auto_13201 - OBJ
      ?auto_13198 - TRUCK
      ?auto_13197 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13199 ?auto_13200 ) ( IN-CITY ?auto_13194 ?auto_13200 ) ( not ( = ?auto_13194 ?auto_13199 ) ) ( not ( = ?auto_13201 ?auto_13195 ) ) ( OBJ-AT ?auto_13195 ?auto_13199 ) ( not ( = ?auto_13201 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13196 ) ) ( OBJ-AT ?auto_13196 ?auto_13199 ) ( TRUCK-AT ?auto_13198 ?auto_13197 ) ( IN-CITY ?auto_13197 ?auto_13200 ) ( not ( = ?auto_13194 ?auto_13197 ) ) ( not ( = ?auto_13199 ?auto_13197 ) ) ( OBJ-AT ?auto_13201 ?auto_13197 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13201 ?auto_13195 ?auto_13194 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13221 - OBJ
      ?auto_13222 - OBJ
      ?auto_13223 - OBJ
      ?auto_13220 - LOCATION
    )
    :vars
    (
      ?auto_13226 - LOCATION
      ?auto_13227 - CITY
      ?auto_13225 - TRUCK
      ?auto_13224 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13226 ?auto_13227 ) ( IN-CITY ?auto_13220 ?auto_13227 ) ( not ( = ?auto_13220 ?auto_13226 ) ) ( not ( = ?auto_13221 ?auto_13223 ) ) ( OBJ-AT ?auto_13223 ?auto_13226 ) ( not ( = ?auto_13221 ?auto_13222 ) ) ( not ( = ?auto_13223 ?auto_13222 ) ) ( OBJ-AT ?auto_13222 ?auto_13226 ) ( TRUCK-AT ?auto_13225 ?auto_13224 ) ( IN-CITY ?auto_13224 ?auto_13227 ) ( not ( = ?auto_13220 ?auto_13224 ) ) ( not ( = ?auto_13226 ?auto_13224 ) ) ( OBJ-AT ?auto_13221 ?auto_13224 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13221 ?auto_13223 ?auto_13220 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13238 - OBJ
      ?auto_13239 - OBJ
      ?auto_13240 - OBJ
      ?auto_13237 - LOCATION
    )
    :vars
    (
      ?auto_13243 - LOCATION
      ?auto_13244 - CITY
      ?auto_13242 - TRUCK
      ?auto_13241 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13243 ?auto_13244 ) ( IN-CITY ?auto_13237 ?auto_13244 ) ( not ( = ?auto_13237 ?auto_13243 ) ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( OBJ-AT ?auto_13239 ?auto_13243 ) ( not ( = ?auto_13238 ?auto_13240 ) ) ( not ( = ?auto_13239 ?auto_13240 ) ) ( OBJ-AT ?auto_13240 ?auto_13243 ) ( TRUCK-AT ?auto_13242 ?auto_13241 ) ( IN-CITY ?auto_13241 ?auto_13244 ) ( not ( = ?auto_13237 ?auto_13241 ) ) ( not ( = ?auto_13243 ?auto_13241 ) ) ( OBJ-AT ?auto_13238 ?auto_13241 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13238 ?auto_13239 ?auto_13237 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13255 - OBJ
      ?auto_13256 - OBJ
      ?auto_13257 - OBJ
      ?auto_13254 - LOCATION
    )
    :vars
    (
      ?auto_13260 - LOCATION
      ?auto_13261 - CITY
      ?auto_13259 - TRUCK
      ?auto_13258 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13260 ?auto_13261 ) ( IN-CITY ?auto_13254 ?auto_13261 ) ( not ( = ?auto_13254 ?auto_13260 ) ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( OBJ-AT ?auto_13257 ?auto_13260 ) ( not ( = ?auto_13256 ?auto_13255 ) ) ( not ( = ?auto_13257 ?auto_13255 ) ) ( OBJ-AT ?auto_13255 ?auto_13260 ) ( TRUCK-AT ?auto_13259 ?auto_13258 ) ( IN-CITY ?auto_13258 ?auto_13261 ) ( not ( = ?auto_13254 ?auto_13258 ) ) ( not ( = ?auto_13260 ?auto_13258 ) ) ( OBJ-AT ?auto_13256 ?auto_13258 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13256 ?auto_13257 ?auto_13254 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13272 - OBJ
      ?auto_13273 - OBJ
      ?auto_13274 - OBJ
      ?auto_13271 - LOCATION
    )
    :vars
    (
      ?auto_13277 - LOCATION
      ?auto_13278 - CITY
      ?auto_13276 - TRUCK
      ?auto_13275 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13277 ?auto_13278 ) ( IN-CITY ?auto_13271 ?auto_13278 ) ( not ( = ?auto_13271 ?auto_13277 ) ) ( not ( = ?auto_13274 ?auto_13273 ) ) ( OBJ-AT ?auto_13273 ?auto_13277 ) ( not ( = ?auto_13274 ?auto_13272 ) ) ( not ( = ?auto_13273 ?auto_13272 ) ) ( OBJ-AT ?auto_13272 ?auto_13277 ) ( TRUCK-AT ?auto_13276 ?auto_13275 ) ( IN-CITY ?auto_13275 ?auto_13278 ) ( not ( = ?auto_13271 ?auto_13275 ) ) ( not ( = ?auto_13277 ?auto_13275 ) ) ( OBJ-AT ?auto_13274 ?auto_13275 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13274 ?auto_13273 ?auto_13271 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13307 - OBJ
      ?auto_13308 - OBJ
      ?auto_13309 - OBJ
      ?auto_13306 - LOCATION
    )
    :vars
    (
      ?auto_13312 - LOCATION
      ?auto_13313 - CITY
      ?auto_13311 - TRUCK
      ?auto_13310 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13312 ?auto_13313 ) ( IN-CITY ?auto_13306 ?auto_13313 ) ( not ( = ?auto_13306 ?auto_13312 ) ) ( not ( = ?auto_13308 ?auto_13307 ) ) ( OBJ-AT ?auto_13307 ?auto_13312 ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13307 ?auto_13309 ) ) ( OBJ-AT ?auto_13309 ?auto_13312 ) ( TRUCK-AT ?auto_13311 ?auto_13310 ) ( IN-CITY ?auto_13310 ?auto_13313 ) ( not ( = ?auto_13306 ?auto_13310 ) ) ( not ( = ?auto_13312 ?auto_13310 ) ) ( OBJ-AT ?auto_13308 ?auto_13310 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13308 ?auto_13307 ?auto_13306 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13324 - OBJ
      ?auto_13325 - OBJ
      ?auto_13326 - OBJ
      ?auto_13323 - LOCATION
    )
    :vars
    (
      ?auto_13329 - LOCATION
      ?auto_13330 - CITY
      ?auto_13328 - TRUCK
      ?auto_13327 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13329 ?auto_13330 ) ( IN-CITY ?auto_13323 ?auto_13330 ) ( not ( = ?auto_13323 ?auto_13329 ) ) ( not ( = ?auto_13326 ?auto_13324 ) ) ( OBJ-AT ?auto_13324 ?auto_13329 ) ( not ( = ?auto_13326 ?auto_13325 ) ) ( not ( = ?auto_13324 ?auto_13325 ) ) ( OBJ-AT ?auto_13325 ?auto_13329 ) ( TRUCK-AT ?auto_13328 ?auto_13327 ) ( IN-CITY ?auto_13327 ?auto_13330 ) ( not ( = ?auto_13323 ?auto_13327 ) ) ( not ( = ?auto_13329 ?auto_13327 ) ) ( OBJ-AT ?auto_13326 ?auto_13327 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13326 ?auto_13324 ?auto_13323 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13378 - OBJ
      ?auto_13377 - LOCATION
    )
    :vars
    (
      ?auto_13382 - LOCATION
      ?auto_13383 - CITY
      ?auto_13384 - OBJ
      ?auto_13379 - OBJ
      ?auto_13380 - LOCATION
      ?auto_13381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13382 ?auto_13383 ) ( IN-CITY ?auto_13377 ?auto_13383 ) ( not ( = ?auto_13377 ?auto_13382 ) ) ( not ( = ?auto_13384 ?auto_13378 ) ) ( OBJ-AT ?auto_13378 ?auto_13382 ) ( not ( = ?auto_13384 ?auto_13379 ) ) ( not ( = ?auto_13378 ?auto_13379 ) ) ( OBJ-AT ?auto_13379 ?auto_13382 ) ( IN-CITY ?auto_13380 ?auto_13383 ) ( not ( = ?auto_13377 ?auto_13380 ) ) ( not ( = ?auto_13382 ?auto_13380 ) ) ( OBJ-AT ?auto_13384 ?auto_13380 ) ( TRUCK-AT ?auto_13381 ?auto_13377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13381 ?auto_13377 ?auto_13380 ?auto_13383 )
      ( DELIVER-2PKG ?auto_13384 ?auto_13378 ?auto_13377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13386 - OBJ
      ?auto_13387 - OBJ
      ?auto_13385 - LOCATION
    )
    :vars
    (
      ?auto_13391 - LOCATION
      ?auto_13390 - CITY
      ?auto_13388 - OBJ
      ?auto_13392 - LOCATION
      ?auto_13389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13391 ?auto_13390 ) ( IN-CITY ?auto_13385 ?auto_13390 ) ( not ( = ?auto_13385 ?auto_13391 ) ) ( not ( = ?auto_13386 ?auto_13387 ) ) ( OBJ-AT ?auto_13387 ?auto_13391 ) ( not ( = ?auto_13386 ?auto_13388 ) ) ( not ( = ?auto_13387 ?auto_13388 ) ) ( OBJ-AT ?auto_13388 ?auto_13391 ) ( IN-CITY ?auto_13392 ?auto_13390 ) ( not ( = ?auto_13385 ?auto_13392 ) ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( OBJ-AT ?auto_13386 ?auto_13392 ) ( TRUCK-AT ?auto_13389 ?auto_13385 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13387 ?auto_13385 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13394 - OBJ
      ?auto_13395 - OBJ
      ?auto_13393 - LOCATION
    )
    :vars
    (
      ?auto_13398 - LOCATION
      ?auto_13396 - CITY
      ?auto_13400 - OBJ
      ?auto_13397 - LOCATION
      ?auto_13399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13398 ?auto_13396 ) ( IN-CITY ?auto_13393 ?auto_13396 ) ( not ( = ?auto_13393 ?auto_13398 ) ) ( not ( = ?auto_13400 ?auto_13395 ) ) ( OBJ-AT ?auto_13395 ?auto_13398 ) ( not ( = ?auto_13400 ?auto_13394 ) ) ( not ( = ?auto_13395 ?auto_13394 ) ) ( OBJ-AT ?auto_13394 ?auto_13398 ) ( IN-CITY ?auto_13397 ?auto_13396 ) ( not ( = ?auto_13393 ?auto_13397 ) ) ( not ( = ?auto_13398 ?auto_13397 ) ) ( OBJ-AT ?auto_13400 ?auto_13397 ) ( TRUCK-AT ?auto_13399 ?auto_13393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13400 ?auto_13395 ?auto_13393 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13402 - OBJ
      ?auto_13403 - OBJ
      ?auto_13401 - LOCATION
    )
    :vars
    (
      ?auto_13407 - LOCATION
      ?auto_13404 - CITY
      ?auto_13405 - OBJ
      ?auto_13406 - LOCATION
      ?auto_13408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13407 ?auto_13404 ) ( IN-CITY ?auto_13401 ?auto_13404 ) ( not ( = ?auto_13401 ?auto_13407 ) ) ( not ( = ?auto_13403 ?auto_13402 ) ) ( OBJ-AT ?auto_13402 ?auto_13407 ) ( not ( = ?auto_13403 ?auto_13405 ) ) ( not ( = ?auto_13402 ?auto_13405 ) ) ( OBJ-AT ?auto_13405 ?auto_13407 ) ( IN-CITY ?auto_13406 ?auto_13404 ) ( not ( = ?auto_13401 ?auto_13406 ) ) ( not ( = ?auto_13407 ?auto_13406 ) ) ( OBJ-AT ?auto_13403 ?auto_13406 ) ( TRUCK-AT ?auto_13408 ?auto_13401 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13403 ?auto_13402 ?auto_13401 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13410 - OBJ
      ?auto_13411 - OBJ
      ?auto_13409 - LOCATION
    )
    :vars
    (
      ?auto_13414 - LOCATION
      ?auto_13412 - CITY
      ?auto_13416 - OBJ
      ?auto_13413 - LOCATION
      ?auto_13415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13414 ?auto_13412 ) ( IN-CITY ?auto_13409 ?auto_13412 ) ( not ( = ?auto_13409 ?auto_13414 ) ) ( not ( = ?auto_13416 ?auto_13410 ) ) ( OBJ-AT ?auto_13410 ?auto_13414 ) ( not ( = ?auto_13416 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( OBJ-AT ?auto_13411 ?auto_13414 ) ( IN-CITY ?auto_13413 ?auto_13412 ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( not ( = ?auto_13414 ?auto_13413 ) ) ( OBJ-AT ?auto_13416 ?auto_13413 ) ( TRUCK-AT ?auto_13415 ?auto_13409 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13416 ?auto_13410 ?auto_13409 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13436 - OBJ
      ?auto_13437 - OBJ
      ?auto_13438 - OBJ
      ?auto_13435 - LOCATION
    )
    :vars
    (
      ?auto_13441 - LOCATION
      ?auto_13439 - CITY
      ?auto_13440 - LOCATION
      ?auto_13442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13441 ?auto_13439 ) ( IN-CITY ?auto_13435 ?auto_13439 ) ( not ( = ?auto_13435 ?auto_13441 ) ) ( not ( = ?auto_13436 ?auto_13438 ) ) ( OBJ-AT ?auto_13438 ?auto_13441 ) ( not ( = ?auto_13436 ?auto_13437 ) ) ( not ( = ?auto_13438 ?auto_13437 ) ) ( OBJ-AT ?auto_13437 ?auto_13441 ) ( IN-CITY ?auto_13440 ?auto_13439 ) ( not ( = ?auto_13435 ?auto_13440 ) ) ( not ( = ?auto_13441 ?auto_13440 ) ) ( OBJ-AT ?auto_13436 ?auto_13440 ) ( TRUCK-AT ?auto_13442 ?auto_13435 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13436 ?auto_13438 ?auto_13435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13453 - OBJ
      ?auto_13454 - OBJ
      ?auto_13455 - OBJ
      ?auto_13452 - LOCATION
    )
    :vars
    (
      ?auto_13458 - LOCATION
      ?auto_13456 - CITY
      ?auto_13457 - LOCATION
      ?auto_13459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13458 ?auto_13456 ) ( IN-CITY ?auto_13452 ?auto_13456 ) ( not ( = ?auto_13452 ?auto_13458 ) ) ( not ( = ?auto_13453 ?auto_13454 ) ) ( OBJ-AT ?auto_13454 ?auto_13458 ) ( not ( = ?auto_13453 ?auto_13455 ) ) ( not ( = ?auto_13454 ?auto_13455 ) ) ( OBJ-AT ?auto_13455 ?auto_13458 ) ( IN-CITY ?auto_13457 ?auto_13456 ) ( not ( = ?auto_13452 ?auto_13457 ) ) ( not ( = ?auto_13458 ?auto_13457 ) ) ( OBJ-AT ?auto_13453 ?auto_13457 ) ( TRUCK-AT ?auto_13459 ?auto_13452 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13453 ?auto_13454 ?auto_13452 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13470 - OBJ
      ?auto_13471 - OBJ
      ?auto_13472 - OBJ
      ?auto_13469 - LOCATION
    )
    :vars
    (
      ?auto_13475 - LOCATION
      ?auto_13473 - CITY
      ?auto_13474 - LOCATION
      ?auto_13476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13475 ?auto_13473 ) ( IN-CITY ?auto_13469 ?auto_13473 ) ( not ( = ?auto_13469 ?auto_13475 ) ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( OBJ-AT ?auto_13472 ?auto_13475 ) ( not ( = ?auto_13471 ?auto_13470 ) ) ( not ( = ?auto_13472 ?auto_13470 ) ) ( OBJ-AT ?auto_13470 ?auto_13475 ) ( IN-CITY ?auto_13474 ?auto_13473 ) ( not ( = ?auto_13469 ?auto_13474 ) ) ( not ( = ?auto_13475 ?auto_13474 ) ) ( OBJ-AT ?auto_13471 ?auto_13474 ) ( TRUCK-AT ?auto_13476 ?auto_13469 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13471 ?auto_13472 ?auto_13469 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13487 - OBJ
      ?auto_13488 - OBJ
      ?auto_13489 - OBJ
      ?auto_13486 - LOCATION
    )
    :vars
    (
      ?auto_13492 - LOCATION
      ?auto_13490 - CITY
      ?auto_13491 - LOCATION
      ?auto_13493 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13492 ?auto_13490 ) ( IN-CITY ?auto_13486 ?auto_13490 ) ( not ( = ?auto_13486 ?auto_13492 ) ) ( not ( = ?auto_13489 ?auto_13488 ) ) ( OBJ-AT ?auto_13488 ?auto_13492 ) ( not ( = ?auto_13489 ?auto_13487 ) ) ( not ( = ?auto_13488 ?auto_13487 ) ) ( OBJ-AT ?auto_13487 ?auto_13492 ) ( IN-CITY ?auto_13491 ?auto_13490 ) ( not ( = ?auto_13486 ?auto_13491 ) ) ( not ( = ?auto_13492 ?auto_13491 ) ) ( OBJ-AT ?auto_13489 ?auto_13491 ) ( TRUCK-AT ?auto_13493 ?auto_13486 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13489 ?auto_13488 ?auto_13486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13522 - OBJ
      ?auto_13523 - OBJ
      ?auto_13524 - OBJ
      ?auto_13521 - LOCATION
    )
    :vars
    (
      ?auto_13527 - LOCATION
      ?auto_13525 - CITY
      ?auto_13526 - LOCATION
      ?auto_13528 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13527 ?auto_13525 ) ( IN-CITY ?auto_13521 ?auto_13525 ) ( not ( = ?auto_13521 ?auto_13527 ) ) ( not ( = ?auto_13523 ?auto_13522 ) ) ( OBJ-AT ?auto_13522 ?auto_13527 ) ( not ( = ?auto_13523 ?auto_13524 ) ) ( not ( = ?auto_13522 ?auto_13524 ) ) ( OBJ-AT ?auto_13524 ?auto_13527 ) ( IN-CITY ?auto_13526 ?auto_13525 ) ( not ( = ?auto_13521 ?auto_13526 ) ) ( not ( = ?auto_13527 ?auto_13526 ) ) ( OBJ-AT ?auto_13523 ?auto_13526 ) ( TRUCK-AT ?auto_13528 ?auto_13521 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13523 ?auto_13522 ?auto_13521 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13539 - OBJ
      ?auto_13540 - OBJ
      ?auto_13541 - OBJ
      ?auto_13538 - LOCATION
    )
    :vars
    (
      ?auto_13544 - LOCATION
      ?auto_13542 - CITY
      ?auto_13543 - LOCATION
      ?auto_13545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13544 ?auto_13542 ) ( IN-CITY ?auto_13538 ?auto_13542 ) ( not ( = ?auto_13538 ?auto_13544 ) ) ( not ( = ?auto_13541 ?auto_13539 ) ) ( OBJ-AT ?auto_13539 ?auto_13544 ) ( not ( = ?auto_13541 ?auto_13540 ) ) ( not ( = ?auto_13539 ?auto_13540 ) ) ( OBJ-AT ?auto_13540 ?auto_13544 ) ( IN-CITY ?auto_13543 ?auto_13542 ) ( not ( = ?auto_13538 ?auto_13543 ) ) ( not ( = ?auto_13544 ?auto_13543 ) ) ( OBJ-AT ?auto_13541 ?auto_13543 ) ( TRUCK-AT ?auto_13545 ?auto_13538 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13541 ?auto_13539 ?auto_13538 ) )
  )

)

