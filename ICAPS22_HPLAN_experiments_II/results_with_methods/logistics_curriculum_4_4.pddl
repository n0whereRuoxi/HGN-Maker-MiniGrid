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
      ?auto_14580 - OBJ
      ?auto_14579 - LOCATION
    )
    :vars
    (
      ?auto_14582 - LOCATION
      ?auto_14583 - CITY
      ?auto_14581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14582 ?auto_14583 ) ( IN-CITY ?auto_14579 ?auto_14583 ) ( not ( = ?auto_14579 ?auto_14582 ) ) ( OBJ-AT ?auto_14580 ?auto_14582 ) ( TRUCK-AT ?auto_14581 ?auto_14579 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14581 ?auto_14579 ?auto_14582 ?auto_14583 )
      ( !LOAD-TRUCK ?auto_14580 ?auto_14581 ?auto_14582 )
      ( !DRIVE-TRUCK ?auto_14581 ?auto_14582 ?auto_14579 ?auto_14583 )
      ( !UNLOAD-TRUCK ?auto_14580 ?auto_14581 ?auto_14579 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14587 - OBJ
      ?auto_14586 - LOCATION
    )
    :vars
    (
      ?auto_14589 - LOCATION
      ?auto_14590 - CITY
      ?auto_14588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14589 ?auto_14590 ) ( IN-CITY ?auto_14586 ?auto_14590 ) ( not ( = ?auto_14586 ?auto_14589 ) ) ( OBJ-AT ?auto_14587 ?auto_14589 ) ( TRUCK-AT ?auto_14588 ?auto_14586 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14588 ?auto_14586 ?auto_14589 ?auto_14590 )
      ( !LOAD-TRUCK ?auto_14587 ?auto_14588 ?auto_14589 )
      ( !DRIVE-TRUCK ?auto_14588 ?auto_14589 ?auto_14586 ?auto_14590 )
      ( !UNLOAD-TRUCK ?auto_14587 ?auto_14588 ?auto_14586 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14601 - OBJ
      ?auto_14602 - OBJ
      ?auto_14600 - LOCATION
    )
    :vars
    (
      ?auto_14603 - LOCATION
      ?auto_14605 - CITY
      ?auto_14606 - LOCATION
      ?auto_14604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14603 ?auto_14605 ) ( IN-CITY ?auto_14600 ?auto_14605 ) ( not ( = ?auto_14600 ?auto_14603 ) ) ( OBJ-AT ?auto_14602 ?auto_14603 ) ( IN-CITY ?auto_14606 ?auto_14605 ) ( not ( = ?auto_14600 ?auto_14606 ) ) ( OBJ-AT ?auto_14601 ?auto_14606 ) ( TRUCK-AT ?auto_14604 ?auto_14600 ) ( not ( = ?auto_14601 ?auto_14602 ) ) ( not ( = ?auto_14603 ?auto_14606 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14601 ?auto_14600 )
      ( DELIVER-1PKG ?auto_14602 ?auto_14600 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14608 - OBJ
      ?auto_14609 - OBJ
      ?auto_14607 - LOCATION
    )
    :vars
    (
      ?auto_14612 - LOCATION
      ?auto_14610 - CITY
      ?auto_14611 - LOCATION
      ?auto_14613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14612 ?auto_14610 ) ( IN-CITY ?auto_14607 ?auto_14610 ) ( not ( = ?auto_14607 ?auto_14612 ) ) ( OBJ-AT ?auto_14608 ?auto_14612 ) ( IN-CITY ?auto_14611 ?auto_14610 ) ( not ( = ?auto_14607 ?auto_14611 ) ) ( OBJ-AT ?auto_14609 ?auto_14611 ) ( TRUCK-AT ?auto_14613 ?auto_14607 ) ( not ( = ?auto_14609 ?auto_14608 ) ) ( not ( = ?auto_14612 ?auto_14611 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14609 ?auto_14608 ?auto_14607 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14625 - OBJ
      ?auto_14624 - LOCATION
    )
    :vars
    (
      ?auto_14627 - LOCATION
      ?auto_14628 - CITY
      ?auto_14626 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14627 ?auto_14628 ) ( IN-CITY ?auto_14624 ?auto_14628 ) ( not ( = ?auto_14624 ?auto_14627 ) ) ( OBJ-AT ?auto_14625 ?auto_14627 ) ( TRUCK-AT ?auto_14626 ?auto_14624 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14626 ?auto_14624 ?auto_14627 ?auto_14628 )
      ( !LOAD-TRUCK ?auto_14625 ?auto_14626 ?auto_14627 )
      ( !DRIVE-TRUCK ?auto_14626 ?auto_14627 ?auto_14624 ?auto_14628 )
      ( !UNLOAD-TRUCK ?auto_14625 ?auto_14626 ?auto_14624 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14716 - OBJ
      ?auto_14717 - OBJ
      ?auto_14718 - OBJ
      ?auto_14715 - LOCATION
    )
    :vars
    (
      ?auto_14721 - LOCATION
      ?auto_14719 - CITY
      ?auto_14722 - LOCATION
      ?auto_14723 - LOCATION
      ?auto_14720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14721 ?auto_14719 ) ( IN-CITY ?auto_14715 ?auto_14719 ) ( not ( = ?auto_14715 ?auto_14721 ) ) ( OBJ-AT ?auto_14718 ?auto_14721 ) ( IN-CITY ?auto_14722 ?auto_14719 ) ( not ( = ?auto_14715 ?auto_14722 ) ) ( OBJ-AT ?auto_14717 ?auto_14722 ) ( IN-CITY ?auto_14723 ?auto_14719 ) ( not ( = ?auto_14715 ?auto_14723 ) ) ( OBJ-AT ?auto_14716 ?auto_14723 ) ( TRUCK-AT ?auto_14720 ?auto_14715 ) ( not ( = ?auto_14716 ?auto_14717 ) ) ( not ( = ?auto_14722 ?auto_14723 ) ) ( not ( = ?auto_14716 ?auto_14718 ) ) ( not ( = ?auto_14717 ?auto_14718 ) ) ( not ( = ?auto_14721 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14717 ?auto_14716 ?auto_14715 )
      ( DELIVER-1PKG ?auto_14718 ?auto_14715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14735 - OBJ
      ?auto_14736 - OBJ
      ?auto_14737 - OBJ
      ?auto_14734 - LOCATION
    )
    :vars
    (
      ?auto_14742 - LOCATION
      ?auto_14738 - CITY
      ?auto_14741 - LOCATION
      ?auto_14740 - LOCATION
      ?auto_14739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14742 ?auto_14738 ) ( IN-CITY ?auto_14734 ?auto_14738 ) ( not ( = ?auto_14734 ?auto_14742 ) ) ( OBJ-AT ?auto_14736 ?auto_14742 ) ( IN-CITY ?auto_14741 ?auto_14738 ) ( not ( = ?auto_14734 ?auto_14741 ) ) ( OBJ-AT ?auto_14737 ?auto_14741 ) ( IN-CITY ?auto_14740 ?auto_14738 ) ( not ( = ?auto_14734 ?auto_14740 ) ) ( OBJ-AT ?auto_14735 ?auto_14740 ) ( TRUCK-AT ?auto_14739 ?auto_14734 ) ( not ( = ?auto_14735 ?auto_14737 ) ) ( not ( = ?auto_14741 ?auto_14740 ) ) ( not ( = ?auto_14735 ?auto_14736 ) ) ( not ( = ?auto_14737 ?auto_14736 ) ) ( not ( = ?auto_14742 ?auto_14741 ) ) ( not ( = ?auto_14742 ?auto_14740 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14735 ?auto_14737 ?auto_14736 ?auto_14734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14754 - OBJ
      ?auto_14755 - OBJ
      ?auto_14756 - OBJ
      ?auto_14753 - LOCATION
    )
    :vars
    (
      ?auto_14760 - LOCATION
      ?auto_14758 - CITY
      ?auto_14761 - LOCATION
      ?auto_14757 - LOCATION
      ?auto_14759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14760 ?auto_14758 ) ( IN-CITY ?auto_14753 ?auto_14758 ) ( not ( = ?auto_14753 ?auto_14760 ) ) ( OBJ-AT ?auto_14756 ?auto_14760 ) ( IN-CITY ?auto_14761 ?auto_14758 ) ( not ( = ?auto_14753 ?auto_14761 ) ) ( OBJ-AT ?auto_14754 ?auto_14761 ) ( IN-CITY ?auto_14757 ?auto_14758 ) ( not ( = ?auto_14753 ?auto_14757 ) ) ( OBJ-AT ?auto_14755 ?auto_14757 ) ( TRUCK-AT ?auto_14759 ?auto_14753 ) ( not ( = ?auto_14755 ?auto_14754 ) ) ( not ( = ?auto_14761 ?auto_14757 ) ) ( not ( = ?auto_14755 ?auto_14756 ) ) ( not ( = ?auto_14754 ?auto_14756 ) ) ( not ( = ?auto_14760 ?auto_14761 ) ) ( not ( = ?auto_14760 ?auto_14757 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14755 ?auto_14756 ?auto_14754 ?auto_14753 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14773 - OBJ
      ?auto_14774 - OBJ
      ?auto_14775 - OBJ
      ?auto_14772 - LOCATION
    )
    :vars
    (
      ?auto_14779 - LOCATION
      ?auto_14777 - CITY
      ?auto_14780 - LOCATION
      ?auto_14776 - LOCATION
      ?auto_14778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14779 ?auto_14777 ) ( IN-CITY ?auto_14772 ?auto_14777 ) ( not ( = ?auto_14772 ?auto_14779 ) ) ( OBJ-AT ?auto_14774 ?auto_14779 ) ( IN-CITY ?auto_14780 ?auto_14777 ) ( not ( = ?auto_14772 ?auto_14780 ) ) ( OBJ-AT ?auto_14773 ?auto_14780 ) ( IN-CITY ?auto_14776 ?auto_14777 ) ( not ( = ?auto_14772 ?auto_14776 ) ) ( OBJ-AT ?auto_14775 ?auto_14776 ) ( TRUCK-AT ?auto_14778 ?auto_14772 ) ( not ( = ?auto_14775 ?auto_14773 ) ) ( not ( = ?auto_14780 ?auto_14776 ) ) ( not ( = ?auto_14775 ?auto_14774 ) ) ( not ( = ?auto_14773 ?auto_14774 ) ) ( not ( = ?auto_14779 ?auto_14780 ) ) ( not ( = ?auto_14779 ?auto_14776 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14775 ?auto_14774 ?auto_14773 ?auto_14772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14812 - OBJ
      ?auto_14813 - OBJ
      ?auto_14814 - OBJ
      ?auto_14811 - LOCATION
    )
    :vars
    (
      ?auto_14818 - LOCATION
      ?auto_14816 - CITY
      ?auto_14819 - LOCATION
      ?auto_14815 - LOCATION
      ?auto_14817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14818 ?auto_14816 ) ( IN-CITY ?auto_14811 ?auto_14816 ) ( not ( = ?auto_14811 ?auto_14818 ) ) ( OBJ-AT ?auto_14812 ?auto_14818 ) ( IN-CITY ?auto_14819 ?auto_14816 ) ( not ( = ?auto_14811 ?auto_14819 ) ) ( OBJ-AT ?auto_14814 ?auto_14819 ) ( IN-CITY ?auto_14815 ?auto_14816 ) ( not ( = ?auto_14811 ?auto_14815 ) ) ( OBJ-AT ?auto_14813 ?auto_14815 ) ( TRUCK-AT ?auto_14817 ?auto_14811 ) ( not ( = ?auto_14813 ?auto_14814 ) ) ( not ( = ?auto_14819 ?auto_14815 ) ) ( not ( = ?auto_14813 ?auto_14812 ) ) ( not ( = ?auto_14814 ?auto_14812 ) ) ( not ( = ?auto_14818 ?auto_14819 ) ) ( not ( = ?auto_14818 ?auto_14815 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14813 ?auto_14812 ?auto_14814 ?auto_14811 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14831 - OBJ
      ?auto_14832 - OBJ
      ?auto_14833 - OBJ
      ?auto_14830 - LOCATION
    )
    :vars
    (
      ?auto_14837 - LOCATION
      ?auto_14835 - CITY
      ?auto_14838 - LOCATION
      ?auto_14834 - LOCATION
      ?auto_14836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14837 ?auto_14835 ) ( IN-CITY ?auto_14830 ?auto_14835 ) ( not ( = ?auto_14830 ?auto_14837 ) ) ( OBJ-AT ?auto_14831 ?auto_14837 ) ( IN-CITY ?auto_14838 ?auto_14835 ) ( not ( = ?auto_14830 ?auto_14838 ) ) ( OBJ-AT ?auto_14832 ?auto_14838 ) ( IN-CITY ?auto_14834 ?auto_14835 ) ( not ( = ?auto_14830 ?auto_14834 ) ) ( OBJ-AT ?auto_14833 ?auto_14834 ) ( TRUCK-AT ?auto_14836 ?auto_14830 ) ( not ( = ?auto_14833 ?auto_14832 ) ) ( not ( = ?auto_14838 ?auto_14834 ) ) ( not ( = ?auto_14833 ?auto_14831 ) ) ( not ( = ?auto_14832 ?auto_14831 ) ) ( not ( = ?auto_14837 ?auto_14838 ) ) ( not ( = ?auto_14837 ?auto_14834 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14833 ?auto_14831 ?auto_14832 ?auto_14830 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14893 - OBJ
      ?auto_14892 - LOCATION
    )
    :vars
    (
      ?auto_14895 - LOCATION
      ?auto_14896 - CITY
      ?auto_14894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14895 ?auto_14896 ) ( IN-CITY ?auto_14892 ?auto_14896 ) ( not ( = ?auto_14892 ?auto_14895 ) ) ( OBJ-AT ?auto_14893 ?auto_14895 ) ( TRUCK-AT ?auto_14894 ?auto_14892 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14894 ?auto_14892 ?auto_14895 ?auto_14896 )
      ( !LOAD-TRUCK ?auto_14893 ?auto_14894 ?auto_14895 )
      ( !DRIVE-TRUCK ?auto_14894 ?auto_14895 ?auto_14892 ?auto_14896 )
      ( !UNLOAD-TRUCK ?auto_14893 ?auto_14894 ?auto_14892 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15884 - OBJ
      ?auto_15885 - OBJ
      ?auto_15886 - OBJ
      ?auto_15887 - OBJ
      ?auto_15883 - LOCATION
    )
    :vars
    (
      ?auto_15890 - LOCATION
      ?auto_15888 - CITY
      ?auto_15892 - LOCATION
      ?auto_15893 - LOCATION
      ?auto_15891 - LOCATION
      ?auto_15889 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15890 ?auto_15888 ) ( IN-CITY ?auto_15883 ?auto_15888 ) ( not ( = ?auto_15883 ?auto_15890 ) ) ( OBJ-AT ?auto_15887 ?auto_15890 ) ( IN-CITY ?auto_15892 ?auto_15888 ) ( not ( = ?auto_15883 ?auto_15892 ) ) ( OBJ-AT ?auto_15886 ?auto_15892 ) ( IN-CITY ?auto_15893 ?auto_15888 ) ( not ( = ?auto_15883 ?auto_15893 ) ) ( OBJ-AT ?auto_15885 ?auto_15893 ) ( IN-CITY ?auto_15891 ?auto_15888 ) ( not ( = ?auto_15883 ?auto_15891 ) ) ( OBJ-AT ?auto_15884 ?auto_15891 ) ( TRUCK-AT ?auto_15889 ?auto_15883 ) ( not ( = ?auto_15884 ?auto_15885 ) ) ( not ( = ?auto_15893 ?auto_15891 ) ) ( not ( = ?auto_15884 ?auto_15886 ) ) ( not ( = ?auto_15885 ?auto_15886 ) ) ( not ( = ?auto_15892 ?auto_15893 ) ) ( not ( = ?auto_15892 ?auto_15891 ) ) ( not ( = ?auto_15884 ?auto_15887 ) ) ( not ( = ?auto_15885 ?auto_15887 ) ) ( not ( = ?auto_15886 ?auto_15887 ) ) ( not ( = ?auto_15890 ?auto_15892 ) ) ( not ( = ?auto_15890 ?auto_15893 ) ) ( not ( = ?auto_15890 ?auto_15891 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_15884 ?auto_15886 ?auto_15885 ?auto_15883 )
      ( DELIVER-1PKG ?auto_15887 ?auto_15883 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15919 - OBJ
      ?auto_15920 - OBJ
      ?auto_15921 - OBJ
      ?auto_15922 - OBJ
      ?auto_15918 - LOCATION
    )
    :vars
    (
      ?auto_15925 - LOCATION
      ?auto_15928 - CITY
      ?auto_15924 - LOCATION
      ?auto_15926 - LOCATION
      ?auto_15927 - LOCATION
      ?auto_15923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15925 ?auto_15928 ) ( IN-CITY ?auto_15918 ?auto_15928 ) ( not ( = ?auto_15918 ?auto_15925 ) ) ( OBJ-AT ?auto_15921 ?auto_15925 ) ( IN-CITY ?auto_15924 ?auto_15928 ) ( not ( = ?auto_15918 ?auto_15924 ) ) ( OBJ-AT ?auto_15922 ?auto_15924 ) ( IN-CITY ?auto_15926 ?auto_15928 ) ( not ( = ?auto_15918 ?auto_15926 ) ) ( OBJ-AT ?auto_15920 ?auto_15926 ) ( IN-CITY ?auto_15927 ?auto_15928 ) ( not ( = ?auto_15918 ?auto_15927 ) ) ( OBJ-AT ?auto_15919 ?auto_15927 ) ( TRUCK-AT ?auto_15923 ?auto_15918 ) ( not ( = ?auto_15919 ?auto_15920 ) ) ( not ( = ?auto_15926 ?auto_15927 ) ) ( not ( = ?auto_15919 ?auto_15922 ) ) ( not ( = ?auto_15920 ?auto_15922 ) ) ( not ( = ?auto_15924 ?auto_15926 ) ) ( not ( = ?auto_15924 ?auto_15927 ) ) ( not ( = ?auto_15919 ?auto_15921 ) ) ( not ( = ?auto_15920 ?auto_15921 ) ) ( not ( = ?auto_15922 ?auto_15921 ) ) ( not ( = ?auto_15925 ?auto_15924 ) ) ( not ( = ?auto_15925 ?auto_15926 ) ) ( not ( = ?auto_15925 ?auto_15927 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15919 ?auto_15920 ?auto_15922 ?auto_15921 ?auto_15918 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15954 - OBJ
      ?auto_15955 - OBJ
      ?auto_15956 - OBJ
      ?auto_15957 - OBJ
      ?auto_15953 - LOCATION
    )
    :vars
    (
      ?auto_15960 - LOCATION
      ?auto_15961 - CITY
      ?auto_15959 - LOCATION
      ?auto_15962 - LOCATION
      ?auto_15963 - LOCATION
      ?auto_15958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15960 ?auto_15961 ) ( IN-CITY ?auto_15953 ?auto_15961 ) ( not ( = ?auto_15953 ?auto_15960 ) ) ( OBJ-AT ?auto_15957 ?auto_15960 ) ( IN-CITY ?auto_15959 ?auto_15961 ) ( not ( = ?auto_15953 ?auto_15959 ) ) ( OBJ-AT ?auto_15955 ?auto_15959 ) ( IN-CITY ?auto_15962 ?auto_15961 ) ( not ( = ?auto_15953 ?auto_15962 ) ) ( OBJ-AT ?auto_15956 ?auto_15962 ) ( IN-CITY ?auto_15963 ?auto_15961 ) ( not ( = ?auto_15953 ?auto_15963 ) ) ( OBJ-AT ?auto_15954 ?auto_15963 ) ( TRUCK-AT ?auto_15958 ?auto_15953 ) ( not ( = ?auto_15954 ?auto_15956 ) ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( not ( = ?auto_15954 ?auto_15955 ) ) ( not ( = ?auto_15956 ?auto_15955 ) ) ( not ( = ?auto_15959 ?auto_15962 ) ) ( not ( = ?auto_15959 ?auto_15963 ) ) ( not ( = ?auto_15954 ?auto_15957 ) ) ( not ( = ?auto_15956 ?auto_15957 ) ) ( not ( = ?auto_15955 ?auto_15957 ) ) ( not ( = ?auto_15960 ?auto_15959 ) ) ( not ( = ?auto_15960 ?auto_15962 ) ) ( not ( = ?auto_15960 ?auto_15963 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15954 ?auto_15956 ?auto_15957 ?auto_15955 ?auto_15953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15989 - OBJ
      ?auto_15990 - OBJ
      ?auto_15991 - OBJ
      ?auto_15992 - OBJ
      ?auto_15988 - LOCATION
    )
    :vars
    (
      ?auto_15995 - LOCATION
      ?auto_15996 - CITY
      ?auto_15994 - LOCATION
      ?auto_15997 - LOCATION
      ?auto_15998 - LOCATION
      ?auto_15993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15995 ?auto_15996 ) ( IN-CITY ?auto_15988 ?auto_15996 ) ( not ( = ?auto_15988 ?auto_15995 ) ) ( OBJ-AT ?auto_15991 ?auto_15995 ) ( IN-CITY ?auto_15994 ?auto_15996 ) ( not ( = ?auto_15988 ?auto_15994 ) ) ( OBJ-AT ?auto_15990 ?auto_15994 ) ( IN-CITY ?auto_15997 ?auto_15996 ) ( not ( = ?auto_15988 ?auto_15997 ) ) ( OBJ-AT ?auto_15992 ?auto_15997 ) ( IN-CITY ?auto_15998 ?auto_15996 ) ( not ( = ?auto_15988 ?auto_15998 ) ) ( OBJ-AT ?auto_15989 ?auto_15998 ) ( TRUCK-AT ?auto_15993 ?auto_15988 ) ( not ( = ?auto_15989 ?auto_15992 ) ) ( not ( = ?auto_15997 ?auto_15998 ) ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( not ( = ?auto_15992 ?auto_15990 ) ) ( not ( = ?auto_15994 ?auto_15997 ) ) ( not ( = ?auto_15994 ?auto_15998 ) ) ( not ( = ?auto_15989 ?auto_15991 ) ) ( not ( = ?auto_15992 ?auto_15991 ) ) ( not ( = ?auto_15990 ?auto_15991 ) ) ( not ( = ?auto_15995 ?auto_15994 ) ) ( not ( = ?auto_15995 ?auto_15997 ) ) ( not ( = ?auto_15995 ?auto_15998 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_15989 ?auto_15992 ?auto_15991 ?auto_15990 ?auto_15988 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16098 - OBJ
      ?auto_16099 - OBJ
      ?auto_16100 - OBJ
      ?auto_16101 - OBJ
      ?auto_16097 - LOCATION
    )
    :vars
    (
      ?auto_16104 - LOCATION
      ?auto_16105 - CITY
      ?auto_16103 - LOCATION
      ?auto_16106 - LOCATION
      ?auto_16107 - LOCATION
      ?auto_16102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16104 ?auto_16105 ) ( IN-CITY ?auto_16097 ?auto_16105 ) ( not ( = ?auto_16097 ?auto_16104 ) ) ( OBJ-AT ?auto_16099 ?auto_16104 ) ( IN-CITY ?auto_16103 ?auto_16105 ) ( not ( = ?auto_16097 ?auto_16103 ) ) ( OBJ-AT ?auto_16101 ?auto_16103 ) ( IN-CITY ?auto_16106 ?auto_16105 ) ( not ( = ?auto_16097 ?auto_16106 ) ) ( OBJ-AT ?auto_16100 ?auto_16106 ) ( IN-CITY ?auto_16107 ?auto_16105 ) ( not ( = ?auto_16097 ?auto_16107 ) ) ( OBJ-AT ?auto_16098 ?auto_16107 ) ( TRUCK-AT ?auto_16102 ?auto_16097 ) ( not ( = ?auto_16098 ?auto_16100 ) ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16098 ?auto_16101 ) ) ( not ( = ?auto_16100 ?auto_16101 ) ) ( not ( = ?auto_16103 ?auto_16106 ) ) ( not ( = ?auto_16103 ?auto_16107 ) ) ( not ( = ?auto_16098 ?auto_16099 ) ) ( not ( = ?auto_16100 ?auto_16099 ) ) ( not ( = ?auto_16101 ?auto_16099 ) ) ( not ( = ?auto_16104 ?auto_16103 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16107 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16098 ?auto_16100 ?auto_16099 ?auto_16101 ?auto_16097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16133 - OBJ
      ?auto_16134 - OBJ
      ?auto_16135 - OBJ
      ?auto_16136 - OBJ
      ?auto_16132 - LOCATION
    )
    :vars
    (
      ?auto_16139 - LOCATION
      ?auto_16140 - CITY
      ?auto_16138 - LOCATION
      ?auto_16141 - LOCATION
      ?auto_16142 - LOCATION
      ?auto_16137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16139 ?auto_16140 ) ( IN-CITY ?auto_16132 ?auto_16140 ) ( not ( = ?auto_16132 ?auto_16139 ) ) ( OBJ-AT ?auto_16134 ?auto_16139 ) ( IN-CITY ?auto_16138 ?auto_16140 ) ( not ( = ?auto_16132 ?auto_16138 ) ) ( OBJ-AT ?auto_16135 ?auto_16138 ) ( IN-CITY ?auto_16141 ?auto_16140 ) ( not ( = ?auto_16132 ?auto_16141 ) ) ( OBJ-AT ?auto_16136 ?auto_16141 ) ( IN-CITY ?auto_16142 ?auto_16140 ) ( not ( = ?auto_16132 ?auto_16142 ) ) ( OBJ-AT ?auto_16133 ?auto_16142 ) ( TRUCK-AT ?auto_16137 ?auto_16132 ) ( not ( = ?auto_16133 ?auto_16136 ) ) ( not ( = ?auto_16141 ?auto_16142 ) ) ( not ( = ?auto_16133 ?auto_16135 ) ) ( not ( = ?auto_16136 ?auto_16135 ) ) ( not ( = ?auto_16138 ?auto_16141 ) ) ( not ( = ?auto_16138 ?auto_16142 ) ) ( not ( = ?auto_16133 ?auto_16134 ) ) ( not ( = ?auto_16136 ?auto_16134 ) ) ( not ( = ?auto_16135 ?auto_16134 ) ) ( not ( = ?auto_16139 ?auto_16138 ) ) ( not ( = ?auto_16139 ?auto_16141 ) ) ( not ( = ?auto_16139 ?auto_16142 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16133 ?auto_16136 ?auto_16134 ?auto_16135 ?auto_16132 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16242 - OBJ
      ?auto_16243 - OBJ
      ?auto_16244 - OBJ
      ?auto_16245 - OBJ
      ?auto_16241 - LOCATION
    )
    :vars
    (
      ?auto_16248 - LOCATION
      ?auto_16249 - CITY
      ?auto_16247 - LOCATION
      ?auto_16250 - LOCATION
      ?auto_16251 - LOCATION
      ?auto_16246 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16248 ?auto_16249 ) ( IN-CITY ?auto_16241 ?auto_16249 ) ( not ( = ?auto_16241 ?auto_16248 ) ) ( OBJ-AT ?auto_16245 ?auto_16248 ) ( IN-CITY ?auto_16247 ?auto_16249 ) ( not ( = ?auto_16241 ?auto_16247 ) ) ( OBJ-AT ?auto_16244 ?auto_16247 ) ( IN-CITY ?auto_16250 ?auto_16249 ) ( not ( = ?auto_16241 ?auto_16250 ) ) ( OBJ-AT ?auto_16242 ?auto_16250 ) ( IN-CITY ?auto_16251 ?auto_16249 ) ( not ( = ?auto_16241 ?auto_16251 ) ) ( OBJ-AT ?auto_16243 ?auto_16251 ) ( TRUCK-AT ?auto_16246 ?auto_16241 ) ( not ( = ?auto_16243 ?auto_16242 ) ) ( not ( = ?auto_16250 ?auto_16251 ) ) ( not ( = ?auto_16243 ?auto_16244 ) ) ( not ( = ?auto_16242 ?auto_16244 ) ) ( not ( = ?auto_16247 ?auto_16250 ) ) ( not ( = ?auto_16247 ?auto_16251 ) ) ( not ( = ?auto_16243 ?auto_16245 ) ) ( not ( = ?auto_16242 ?auto_16245 ) ) ( not ( = ?auto_16244 ?auto_16245 ) ) ( not ( = ?auto_16248 ?auto_16247 ) ) ( not ( = ?auto_16248 ?auto_16250 ) ) ( not ( = ?auto_16248 ?auto_16251 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16243 ?auto_16242 ?auto_16245 ?auto_16244 ?auto_16241 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16277 - OBJ
      ?auto_16278 - OBJ
      ?auto_16279 - OBJ
      ?auto_16280 - OBJ
      ?auto_16276 - LOCATION
    )
    :vars
    (
      ?auto_16283 - LOCATION
      ?auto_16284 - CITY
      ?auto_16282 - LOCATION
      ?auto_16285 - LOCATION
      ?auto_16286 - LOCATION
      ?auto_16281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16283 ?auto_16284 ) ( IN-CITY ?auto_16276 ?auto_16284 ) ( not ( = ?auto_16276 ?auto_16283 ) ) ( OBJ-AT ?auto_16279 ?auto_16283 ) ( IN-CITY ?auto_16282 ?auto_16284 ) ( not ( = ?auto_16276 ?auto_16282 ) ) ( OBJ-AT ?auto_16280 ?auto_16282 ) ( IN-CITY ?auto_16285 ?auto_16284 ) ( not ( = ?auto_16276 ?auto_16285 ) ) ( OBJ-AT ?auto_16277 ?auto_16285 ) ( IN-CITY ?auto_16286 ?auto_16284 ) ( not ( = ?auto_16276 ?auto_16286 ) ) ( OBJ-AT ?auto_16278 ?auto_16286 ) ( TRUCK-AT ?auto_16281 ?auto_16276 ) ( not ( = ?auto_16278 ?auto_16277 ) ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( not ( = ?auto_16277 ?auto_16280 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16278 ?auto_16279 ) ) ( not ( = ?auto_16277 ?auto_16279 ) ) ( not ( = ?auto_16280 ?auto_16279 ) ) ( not ( = ?auto_16283 ?auto_16282 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16278 ?auto_16277 ?auto_16279 ?auto_16280 ?auto_16276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16387 - OBJ
      ?auto_16388 - OBJ
      ?auto_16389 - OBJ
      ?auto_16390 - OBJ
      ?auto_16386 - LOCATION
    )
    :vars
    (
      ?auto_16393 - LOCATION
      ?auto_16394 - CITY
      ?auto_16392 - LOCATION
      ?auto_16395 - LOCATION
      ?auto_16396 - LOCATION
      ?auto_16391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16393 ?auto_16394 ) ( IN-CITY ?auto_16386 ?auto_16394 ) ( not ( = ?auto_16386 ?auto_16393 ) ) ( OBJ-AT ?auto_16390 ?auto_16393 ) ( IN-CITY ?auto_16392 ?auto_16394 ) ( not ( = ?auto_16386 ?auto_16392 ) ) ( OBJ-AT ?auto_16388 ?auto_16392 ) ( IN-CITY ?auto_16395 ?auto_16394 ) ( not ( = ?auto_16386 ?auto_16395 ) ) ( OBJ-AT ?auto_16387 ?auto_16395 ) ( IN-CITY ?auto_16396 ?auto_16394 ) ( not ( = ?auto_16386 ?auto_16396 ) ) ( OBJ-AT ?auto_16389 ?auto_16396 ) ( TRUCK-AT ?auto_16391 ?auto_16386 ) ( not ( = ?auto_16389 ?auto_16387 ) ) ( not ( = ?auto_16395 ?auto_16396 ) ) ( not ( = ?auto_16389 ?auto_16388 ) ) ( not ( = ?auto_16387 ?auto_16388 ) ) ( not ( = ?auto_16392 ?auto_16395 ) ) ( not ( = ?auto_16392 ?auto_16396 ) ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( not ( = ?auto_16387 ?auto_16390 ) ) ( not ( = ?auto_16388 ?auto_16390 ) ) ( not ( = ?auto_16393 ?auto_16392 ) ) ( not ( = ?auto_16393 ?auto_16395 ) ) ( not ( = ?auto_16393 ?auto_16396 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16389 ?auto_16387 ?auto_16390 ?auto_16388 ?auto_16386 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16422 - OBJ
      ?auto_16423 - OBJ
      ?auto_16424 - OBJ
      ?auto_16425 - OBJ
      ?auto_16421 - LOCATION
    )
    :vars
    (
      ?auto_16428 - LOCATION
      ?auto_16429 - CITY
      ?auto_16427 - LOCATION
      ?auto_16430 - LOCATION
      ?auto_16431 - LOCATION
      ?auto_16426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16428 ?auto_16429 ) ( IN-CITY ?auto_16421 ?auto_16429 ) ( not ( = ?auto_16421 ?auto_16428 ) ) ( OBJ-AT ?auto_16424 ?auto_16428 ) ( IN-CITY ?auto_16427 ?auto_16429 ) ( not ( = ?auto_16421 ?auto_16427 ) ) ( OBJ-AT ?auto_16423 ?auto_16427 ) ( IN-CITY ?auto_16430 ?auto_16429 ) ( not ( = ?auto_16421 ?auto_16430 ) ) ( OBJ-AT ?auto_16422 ?auto_16430 ) ( IN-CITY ?auto_16431 ?auto_16429 ) ( not ( = ?auto_16421 ?auto_16431 ) ) ( OBJ-AT ?auto_16425 ?auto_16431 ) ( TRUCK-AT ?auto_16426 ?auto_16421 ) ( not ( = ?auto_16425 ?auto_16422 ) ) ( not ( = ?auto_16430 ?auto_16431 ) ) ( not ( = ?auto_16425 ?auto_16423 ) ) ( not ( = ?auto_16422 ?auto_16423 ) ) ( not ( = ?auto_16427 ?auto_16430 ) ) ( not ( = ?auto_16427 ?auto_16431 ) ) ( not ( = ?auto_16425 ?auto_16424 ) ) ( not ( = ?auto_16422 ?auto_16424 ) ) ( not ( = ?auto_16423 ?auto_16424 ) ) ( not ( = ?auto_16428 ?auto_16427 ) ) ( not ( = ?auto_16428 ?auto_16430 ) ) ( not ( = ?auto_16428 ?auto_16431 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16425 ?auto_16422 ?auto_16424 ?auto_16423 ?auto_16421 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16493 - OBJ
      ?auto_16494 - OBJ
      ?auto_16495 - OBJ
      ?auto_16496 - OBJ
      ?auto_16492 - LOCATION
    )
    :vars
    (
      ?auto_16499 - LOCATION
      ?auto_16500 - CITY
      ?auto_16498 - LOCATION
      ?auto_16501 - LOCATION
      ?auto_16502 - LOCATION
      ?auto_16497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16499 ?auto_16500 ) ( IN-CITY ?auto_16492 ?auto_16500 ) ( not ( = ?auto_16492 ?auto_16499 ) ) ( OBJ-AT ?auto_16494 ?auto_16499 ) ( IN-CITY ?auto_16498 ?auto_16500 ) ( not ( = ?auto_16492 ?auto_16498 ) ) ( OBJ-AT ?auto_16496 ?auto_16498 ) ( IN-CITY ?auto_16501 ?auto_16500 ) ( not ( = ?auto_16492 ?auto_16501 ) ) ( OBJ-AT ?auto_16493 ?auto_16501 ) ( IN-CITY ?auto_16502 ?auto_16500 ) ( not ( = ?auto_16492 ?auto_16502 ) ) ( OBJ-AT ?auto_16495 ?auto_16502 ) ( TRUCK-AT ?auto_16497 ?auto_16492 ) ( not ( = ?auto_16495 ?auto_16493 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) ( not ( = ?auto_16495 ?auto_16496 ) ) ( not ( = ?auto_16493 ?auto_16496 ) ) ( not ( = ?auto_16498 ?auto_16501 ) ) ( not ( = ?auto_16498 ?auto_16502 ) ) ( not ( = ?auto_16495 ?auto_16494 ) ) ( not ( = ?auto_16493 ?auto_16494 ) ) ( not ( = ?auto_16496 ?auto_16494 ) ) ( not ( = ?auto_16499 ?auto_16498 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16502 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16495 ?auto_16493 ?auto_16494 ?auto_16496 ?auto_16492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16566 - OBJ
      ?auto_16567 - OBJ
      ?auto_16568 - OBJ
      ?auto_16569 - OBJ
      ?auto_16565 - LOCATION
    )
    :vars
    (
      ?auto_16572 - LOCATION
      ?auto_16573 - CITY
      ?auto_16571 - LOCATION
      ?auto_16574 - LOCATION
      ?auto_16575 - LOCATION
      ?auto_16570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16572 ?auto_16573 ) ( IN-CITY ?auto_16565 ?auto_16573 ) ( not ( = ?auto_16565 ?auto_16572 ) ) ( OBJ-AT ?auto_16567 ?auto_16572 ) ( IN-CITY ?auto_16571 ?auto_16573 ) ( not ( = ?auto_16565 ?auto_16571 ) ) ( OBJ-AT ?auto_16568 ?auto_16571 ) ( IN-CITY ?auto_16574 ?auto_16573 ) ( not ( = ?auto_16565 ?auto_16574 ) ) ( OBJ-AT ?auto_16566 ?auto_16574 ) ( IN-CITY ?auto_16575 ?auto_16573 ) ( not ( = ?auto_16565 ?auto_16575 ) ) ( OBJ-AT ?auto_16569 ?auto_16575 ) ( TRUCK-AT ?auto_16570 ?auto_16565 ) ( not ( = ?auto_16569 ?auto_16566 ) ) ( not ( = ?auto_16574 ?auto_16575 ) ) ( not ( = ?auto_16569 ?auto_16568 ) ) ( not ( = ?auto_16566 ?auto_16568 ) ) ( not ( = ?auto_16571 ?auto_16574 ) ) ( not ( = ?auto_16571 ?auto_16575 ) ) ( not ( = ?auto_16569 ?auto_16567 ) ) ( not ( = ?auto_16566 ?auto_16567 ) ) ( not ( = ?auto_16568 ?auto_16567 ) ) ( not ( = ?auto_16572 ?auto_16571 ) ) ( not ( = ?auto_16572 ?auto_16574 ) ) ( not ( = ?auto_16572 ?auto_16575 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16569 ?auto_16566 ?auto_16567 ?auto_16568 ?auto_16565 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16675 - OBJ
      ?auto_16676 - OBJ
      ?auto_16677 - OBJ
      ?auto_16678 - OBJ
      ?auto_16674 - LOCATION
    )
    :vars
    (
      ?auto_16681 - LOCATION
      ?auto_16682 - CITY
      ?auto_16680 - LOCATION
      ?auto_16683 - LOCATION
      ?auto_16684 - LOCATION
      ?auto_16679 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16681 ?auto_16682 ) ( IN-CITY ?auto_16674 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16681 ) ) ( OBJ-AT ?auto_16678 ?auto_16681 ) ( IN-CITY ?auto_16680 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16680 ) ) ( OBJ-AT ?auto_16675 ?auto_16680 ) ( IN-CITY ?auto_16683 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16683 ) ) ( OBJ-AT ?auto_16677 ?auto_16683 ) ( IN-CITY ?auto_16684 ?auto_16682 ) ( not ( = ?auto_16674 ?auto_16684 ) ) ( OBJ-AT ?auto_16676 ?auto_16684 ) ( TRUCK-AT ?auto_16679 ?auto_16674 ) ( not ( = ?auto_16676 ?auto_16677 ) ) ( not ( = ?auto_16683 ?auto_16684 ) ) ( not ( = ?auto_16676 ?auto_16675 ) ) ( not ( = ?auto_16677 ?auto_16675 ) ) ( not ( = ?auto_16680 ?auto_16683 ) ) ( not ( = ?auto_16680 ?auto_16684 ) ) ( not ( = ?auto_16676 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16678 ) ) ( not ( = ?auto_16675 ?auto_16678 ) ) ( not ( = ?auto_16681 ?auto_16680 ) ) ( not ( = ?auto_16681 ?auto_16683 ) ) ( not ( = ?auto_16681 ?auto_16684 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16676 ?auto_16677 ?auto_16678 ?auto_16675 ?auto_16674 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16710 - OBJ
      ?auto_16711 - OBJ
      ?auto_16712 - OBJ
      ?auto_16713 - OBJ
      ?auto_16709 - LOCATION
    )
    :vars
    (
      ?auto_16716 - LOCATION
      ?auto_16717 - CITY
      ?auto_16715 - LOCATION
      ?auto_16718 - LOCATION
      ?auto_16719 - LOCATION
      ?auto_16714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16716 ?auto_16717 ) ( IN-CITY ?auto_16709 ?auto_16717 ) ( not ( = ?auto_16709 ?auto_16716 ) ) ( OBJ-AT ?auto_16712 ?auto_16716 ) ( IN-CITY ?auto_16715 ?auto_16717 ) ( not ( = ?auto_16709 ?auto_16715 ) ) ( OBJ-AT ?auto_16710 ?auto_16715 ) ( IN-CITY ?auto_16718 ?auto_16717 ) ( not ( = ?auto_16709 ?auto_16718 ) ) ( OBJ-AT ?auto_16713 ?auto_16718 ) ( IN-CITY ?auto_16719 ?auto_16717 ) ( not ( = ?auto_16709 ?auto_16719 ) ) ( OBJ-AT ?auto_16711 ?auto_16719 ) ( TRUCK-AT ?auto_16714 ?auto_16709 ) ( not ( = ?auto_16711 ?auto_16713 ) ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( not ( = ?auto_16711 ?auto_16710 ) ) ( not ( = ?auto_16713 ?auto_16710 ) ) ( not ( = ?auto_16715 ?auto_16718 ) ) ( not ( = ?auto_16715 ?auto_16719 ) ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( not ( = ?auto_16713 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16716 ?auto_16715 ) ) ( not ( = ?auto_16716 ?auto_16718 ) ) ( not ( = ?auto_16716 ?auto_16719 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16711 ?auto_16713 ?auto_16712 ?auto_16710 ?auto_16709 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16745 - OBJ
      ?auto_16746 - OBJ
      ?auto_16747 - OBJ
      ?auto_16748 - OBJ
      ?auto_16744 - LOCATION
    )
    :vars
    (
      ?auto_16751 - LOCATION
      ?auto_16752 - CITY
      ?auto_16750 - LOCATION
      ?auto_16753 - LOCATION
      ?auto_16754 - LOCATION
      ?auto_16749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16751 ?auto_16752 ) ( IN-CITY ?auto_16744 ?auto_16752 ) ( not ( = ?auto_16744 ?auto_16751 ) ) ( OBJ-AT ?auto_16748 ?auto_16751 ) ( IN-CITY ?auto_16750 ?auto_16752 ) ( not ( = ?auto_16744 ?auto_16750 ) ) ( OBJ-AT ?auto_16745 ?auto_16750 ) ( IN-CITY ?auto_16753 ?auto_16752 ) ( not ( = ?auto_16744 ?auto_16753 ) ) ( OBJ-AT ?auto_16746 ?auto_16753 ) ( IN-CITY ?auto_16754 ?auto_16752 ) ( not ( = ?auto_16744 ?auto_16754 ) ) ( OBJ-AT ?auto_16747 ?auto_16754 ) ( TRUCK-AT ?auto_16749 ?auto_16744 ) ( not ( = ?auto_16747 ?auto_16746 ) ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16747 ?auto_16745 ) ) ( not ( = ?auto_16746 ?auto_16745 ) ) ( not ( = ?auto_16750 ?auto_16753 ) ) ( not ( = ?auto_16750 ?auto_16754 ) ) ( not ( = ?auto_16747 ?auto_16748 ) ) ( not ( = ?auto_16746 ?auto_16748 ) ) ( not ( = ?auto_16745 ?auto_16748 ) ) ( not ( = ?auto_16751 ?auto_16750 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16754 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16747 ?auto_16746 ?auto_16748 ?auto_16745 ?auto_16744 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16780 - OBJ
      ?auto_16781 - OBJ
      ?auto_16782 - OBJ
      ?auto_16783 - OBJ
      ?auto_16779 - LOCATION
    )
    :vars
    (
      ?auto_16786 - LOCATION
      ?auto_16787 - CITY
      ?auto_16785 - LOCATION
      ?auto_16788 - LOCATION
      ?auto_16789 - LOCATION
      ?auto_16784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16786 ?auto_16787 ) ( IN-CITY ?auto_16779 ?auto_16787 ) ( not ( = ?auto_16779 ?auto_16786 ) ) ( OBJ-AT ?auto_16782 ?auto_16786 ) ( IN-CITY ?auto_16785 ?auto_16787 ) ( not ( = ?auto_16779 ?auto_16785 ) ) ( OBJ-AT ?auto_16780 ?auto_16785 ) ( IN-CITY ?auto_16788 ?auto_16787 ) ( not ( = ?auto_16779 ?auto_16788 ) ) ( OBJ-AT ?auto_16781 ?auto_16788 ) ( IN-CITY ?auto_16789 ?auto_16787 ) ( not ( = ?auto_16779 ?auto_16789 ) ) ( OBJ-AT ?auto_16783 ?auto_16789 ) ( TRUCK-AT ?auto_16784 ?auto_16779 ) ( not ( = ?auto_16783 ?auto_16781 ) ) ( not ( = ?auto_16788 ?auto_16789 ) ) ( not ( = ?auto_16783 ?auto_16780 ) ) ( not ( = ?auto_16781 ?auto_16780 ) ) ( not ( = ?auto_16785 ?auto_16788 ) ) ( not ( = ?auto_16785 ?auto_16789 ) ) ( not ( = ?auto_16783 ?auto_16782 ) ) ( not ( = ?auto_16781 ?auto_16782 ) ) ( not ( = ?auto_16780 ?auto_16782 ) ) ( not ( = ?auto_16786 ?auto_16785 ) ) ( not ( = ?auto_16786 ?auto_16788 ) ) ( not ( = ?auto_16786 ?auto_16789 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16783 ?auto_16781 ?auto_16782 ?auto_16780 ?auto_16779 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16926 - OBJ
      ?auto_16927 - OBJ
      ?auto_16928 - OBJ
      ?auto_16929 - OBJ
      ?auto_16925 - LOCATION
    )
    :vars
    (
      ?auto_16932 - LOCATION
      ?auto_16933 - CITY
      ?auto_16931 - LOCATION
      ?auto_16934 - LOCATION
      ?auto_16935 - LOCATION
      ?auto_16930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16932 ?auto_16933 ) ( IN-CITY ?auto_16925 ?auto_16933 ) ( not ( = ?auto_16925 ?auto_16932 ) ) ( OBJ-AT ?auto_16927 ?auto_16932 ) ( IN-CITY ?auto_16931 ?auto_16933 ) ( not ( = ?auto_16925 ?auto_16931 ) ) ( OBJ-AT ?auto_16926 ?auto_16931 ) ( IN-CITY ?auto_16934 ?auto_16933 ) ( not ( = ?auto_16925 ?auto_16934 ) ) ( OBJ-AT ?auto_16929 ?auto_16934 ) ( IN-CITY ?auto_16935 ?auto_16933 ) ( not ( = ?auto_16925 ?auto_16935 ) ) ( OBJ-AT ?auto_16928 ?auto_16935 ) ( TRUCK-AT ?auto_16930 ?auto_16925 ) ( not ( = ?auto_16928 ?auto_16929 ) ) ( not ( = ?auto_16934 ?auto_16935 ) ) ( not ( = ?auto_16928 ?auto_16926 ) ) ( not ( = ?auto_16929 ?auto_16926 ) ) ( not ( = ?auto_16931 ?auto_16934 ) ) ( not ( = ?auto_16931 ?auto_16935 ) ) ( not ( = ?auto_16928 ?auto_16927 ) ) ( not ( = ?auto_16929 ?auto_16927 ) ) ( not ( = ?auto_16926 ?auto_16927 ) ) ( not ( = ?auto_16932 ?auto_16931 ) ) ( not ( = ?auto_16932 ?auto_16934 ) ) ( not ( = ?auto_16932 ?auto_16935 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16928 ?auto_16929 ?auto_16927 ?auto_16926 ?auto_16925 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_16961 - OBJ
      ?auto_16962 - OBJ
      ?auto_16963 - OBJ
      ?auto_16964 - OBJ
      ?auto_16960 - LOCATION
    )
    :vars
    (
      ?auto_16967 - LOCATION
      ?auto_16968 - CITY
      ?auto_16966 - LOCATION
      ?auto_16969 - LOCATION
      ?auto_16970 - LOCATION
      ?auto_16965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16967 ?auto_16968 ) ( IN-CITY ?auto_16960 ?auto_16968 ) ( not ( = ?auto_16960 ?auto_16967 ) ) ( OBJ-AT ?auto_16962 ?auto_16967 ) ( IN-CITY ?auto_16966 ?auto_16968 ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( OBJ-AT ?auto_16961 ?auto_16966 ) ( IN-CITY ?auto_16969 ?auto_16968 ) ( not ( = ?auto_16960 ?auto_16969 ) ) ( OBJ-AT ?auto_16963 ?auto_16969 ) ( IN-CITY ?auto_16970 ?auto_16968 ) ( not ( = ?auto_16960 ?auto_16970 ) ) ( OBJ-AT ?auto_16964 ?auto_16970 ) ( TRUCK-AT ?auto_16965 ?auto_16960 ) ( not ( = ?auto_16964 ?auto_16963 ) ) ( not ( = ?auto_16969 ?auto_16970 ) ) ( not ( = ?auto_16964 ?auto_16961 ) ) ( not ( = ?auto_16963 ?auto_16961 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16966 ?auto_16970 ) ) ( not ( = ?auto_16964 ?auto_16962 ) ) ( not ( = ?auto_16963 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16967 ?auto_16966 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16970 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_16964 ?auto_16963 ?auto_16962 ?auto_16961 ?auto_16960 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17182 - OBJ
      ?auto_17183 - OBJ
      ?auto_17184 - OBJ
      ?auto_17185 - OBJ
      ?auto_17181 - LOCATION
    )
    :vars
    (
      ?auto_17188 - LOCATION
      ?auto_17189 - CITY
      ?auto_17187 - LOCATION
      ?auto_17190 - LOCATION
      ?auto_17191 - LOCATION
      ?auto_17186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17188 ?auto_17189 ) ( IN-CITY ?auto_17181 ?auto_17189 ) ( not ( = ?auto_17181 ?auto_17188 ) ) ( OBJ-AT ?auto_17182 ?auto_17188 ) ( IN-CITY ?auto_17187 ?auto_17189 ) ( not ( = ?auto_17181 ?auto_17187 ) ) ( OBJ-AT ?auto_17185 ?auto_17187 ) ( IN-CITY ?auto_17190 ?auto_17189 ) ( not ( = ?auto_17181 ?auto_17190 ) ) ( OBJ-AT ?auto_17184 ?auto_17190 ) ( IN-CITY ?auto_17191 ?auto_17189 ) ( not ( = ?auto_17181 ?auto_17191 ) ) ( OBJ-AT ?auto_17183 ?auto_17191 ) ( TRUCK-AT ?auto_17186 ?auto_17181 ) ( not ( = ?auto_17183 ?auto_17184 ) ) ( not ( = ?auto_17190 ?auto_17191 ) ) ( not ( = ?auto_17183 ?auto_17185 ) ) ( not ( = ?auto_17184 ?auto_17185 ) ) ( not ( = ?auto_17187 ?auto_17190 ) ) ( not ( = ?auto_17187 ?auto_17191 ) ) ( not ( = ?auto_17183 ?auto_17182 ) ) ( not ( = ?auto_17184 ?auto_17182 ) ) ( not ( = ?auto_17185 ?auto_17182 ) ) ( not ( = ?auto_17188 ?auto_17187 ) ) ( not ( = ?auto_17188 ?auto_17190 ) ) ( not ( = ?auto_17188 ?auto_17191 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17183 ?auto_17184 ?auto_17182 ?auto_17185 ?auto_17181 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17217 - OBJ
      ?auto_17218 - OBJ
      ?auto_17219 - OBJ
      ?auto_17220 - OBJ
      ?auto_17216 - LOCATION
    )
    :vars
    (
      ?auto_17223 - LOCATION
      ?auto_17224 - CITY
      ?auto_17222 - LOCATION
      ?auto_17225 - LOCATION
      ?auto_17226 - LOCATION
      ?auto_17221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17223 ?auto_17224 ) ( IN-CITY ?auto_17216 ?auto_17224 ) ( not ( = ?auto_17216 ?auto_17223 ) ) ( OBJ-AT ?auto_17217 ?auto_17223 ) ( IN-CITY ?auto_17222 ?auto_17224 ) ( not ( = ?auto_17216 ?auto_17222 ) ) ( OBJ-AT ?auto_17219 ?auto_17222 ) ( IN-CITY ?auto_17225 ?auto_17224 ) ( not ( = ?auto_17216 ?auto_17225 ) ) ( OBJ-AT ?auto_17220 ?auto_17225 ) ( IN-CITY ?auto_17226 ?auto_17224 ) ( not ( = ?auto_17216 ?auto_17226 ) ) ( OBJ-AT ?auto_17218 ?auto_17226 ) ( TRUCK-AT ?auto_17221 ?auto_17216 ) ( not ( = ?auto_17218 ?auto_17220 ) ) ( not ( = ?auto_17225 ?auto_17226 ) ) ( not ( = ?auto_17218 ?auto_17219 ) ) ( not ( = ?auto_17220 ?auto_17219 ) ) ( not ( = ?auto_17222 ?auto_17225 ) ) ( not ( = ?auto_17222 ?auto_17226 ) ) ( not ( = ?auto_17218 ?auto_17217 ) ) ( not ( = ?auto_17220 ?auto_17217 ) ) ( not ( = ?auto_17219 ?auto_17217 ) ) ( not ( = ?auto_17223 ?auto_17222 ) ) ( not ( = ?auto_17223 ?auto_17225 ) ) ( not ( = ?auto_17223 ?auto_17226 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17218 ?auto_17220 ?auto_17217 ?auto_17219 ?auto_17216 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17326 - OBJ
      ?auto_17327 - OBJ
      ?auto_17328 - OBJ
      ?auto_17329 - OBJ
      ?auto_17325 - LOCATION
    )
    :vars
    (
      ?auto_17332 - LOCATION
      ?auto_17333 - CITY
      ?auto_17331 - LOCATION
      ?auto_17334 - LOCATION
      ?auto_17335 - LOCATION
      ?auto_17330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17332 ?auto_17333 ) ( IN-CITY ?auto_17325 ?auto_17333 ) ( not ( = ?auto_17325 ?auto_17332 ) ) ( OBJ-AT ?auto_17326 ?auto_17332 ) ( IN-CITY ?auto_17331 ?auto_17333 ) ( not ( = ?auto_17325 ?auto_17331 ) ) ( OBJ-AT ?auto_17329 ?auto_17331 ) ( IN-CITY ?auto_17334 ?auto_17333 ) ( not ( = ?auto_17325 ?auto_17334 ) ) ( OBJ-AT ?auto_17327 ?auto_17334 ) ( IN-CITY ?auto_17335 ?auto_17333 ) ( not ( = ?auto_17325 ?auto_17335 ) ) ( OBJ-AT ?auto_17328 ?auto_17335 ) ( TRUCK-AT ?auto_17330 ?auto_17325 ) ( not ( = ?auto_17328 ?auto_17327 ) ) ( not ( = ?auto_17334 ?auto_17335 ) ) ( not ( = ?auto_17328 ?auto_17329 ) ) ( not ( = ?auto_17327 ?auto_17329 ) ) ( not ( = ?auto_17331 ?auto_17334 ) ) ( not ( = ?auto_17331 ?auto_17335 ) ) ( not ( = ?auto_17328 ?auto_17326 ) ) ( not ( = ?auto_17327 ?auto_17326 ) ) ( not ( = ?auto_17329 ?auto_17326 ) ) ( not ( = ?auto_17332 ?auto_17331 ) ) ( not ( = ?auto_17332 ?auto_17334 ) ) ( not ( = ?auto_17332 ?auto_17335 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17328 ?auto_17327 ?auto_17326 ?auto_17329 ?auto_17325 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17399 - OBJ
      ?auto_17400 - OBJ
      ?auto_17401 - OBJ
      ?auto_17402 - OBJ
      ?auto_17398 - LOCATION
    )
    :vars
    (
      ?auto_17405 - LOCATION
      ?auto_17406 - CITY
      ?auto_17404 - LOCATION
      ?auto_17407 - LOCATION
      ?auto_17408 - LOCATION
      ?auto_17403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17405 ?auto_17406 ) ( IN-CITY ?auto_17398 ?auto_17406 ) ( not ( = ?auto_17398 ?auto_17405 ) ) ( OBJ-AT ?auto_17399 ?auto_17405 ) ( IN-CITY ?auto_17404 ?auto_17406 ) ( not ( = ?auto_17398 ?auto_17404 ) ) ( OBJ-AT ?auto_17401 ?auto_17404 ) ( IN-CITY ?auto_17407 ?auto_17406 ) ( not ( = ?auto_17398 ?auto_17407 ) ) ( OBJ-AT ?auto_17400 ?auto_17407 ) ( IN-CITY ?auto_17408 ?auto_17406 ) ( not ( = ?auto_17398 ?auto_17408 ) ) ( OBJ-AT ?auto_17402 ?auto_17408 ) ( TRUCK-AT ?auto_17403 ?auto_17398 ) ( not ( = ?auto_17402 ?auto_17400 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( not ( = ?auto_17402 ?auto_17401 ) ) ( not ( = ?auto_17400 ?auto_17401 ) ) ( not ( = ?auto_17404 ?auto_17407 ) ) ( not ( = ?auto_17404 ?auto_17408 ) ) ( not ( = ?auto_17402 ?auto_17399 ) ) ( not ( = ?auto_17400 ?auto_17399 ) ) ( not ( = ?auto_17401 ?auto_17399 ) ) ( not ( = ?auto_17405 ?auto_17404 ) ) ( not ( = ?auto_17405 ?auto_17407 ) ) ( not ( = ?auto_17405 ?auto_17408 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17402 ?auto_17400 ?auto_17399 ?auto_17401 ?auto_17398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17508 - OBJ
      ?auto_17509 - OBJ
      ?auto_17510 - OBJ
      ?auto_17511 - OBJ
      ?auto_17507 - LOCATION
    )
    :vars
    (
      ?auto_17514 - LOCATION
      ?auto_17515 - CITY
      ?auto_17513 - LOCATION
      ?auto_17516 - LOCATION
      ?auto_17517 - LOCATION
      ?auto_17512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17514 ?auto_17515 ) ( IN-CITY ?auto_17507 ?auto_17515 ) ( not ( = ?auto_17507 ?auto_17514 ) ) ( OBJ-AT ?auto_17508 ?auto_17514 ) ( IN-CITY ?auto_17513 ?auto_17515 ) ( not ( = ?auto_17507 ?auto_17513 ) ) ( OBJ-AT ?auto_17509 ?auto_17513 ) ( IN-CITY ?auto_17516 ?auto_17515 ) ( not ( = ?auto_17507 ?auto_17516 ) ) ( OBJ-AT ?auto_17511 ?auto_17516 ) ( IN-CITY ?auto_17517 ?auto_17515 ) ( not ( = ?auto_17507 ?auto_17517 ) ) ( OBJ-AT ?auto_17510 ?auto_17517 ) ( TRUCK-AT ?auto_17512 ?auto_17507 ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( not ( = ?auto_17510 ?auto_17509 ) ) ( not ( = ?auto_17511 ?auto_17509 ) ) ( not ( = ?auto_17513 ?auto_17516 ) ) ( not ( = ?auto_17513 ?auto_17517 ) ) ( not ( = ?auto_17510 ?auto_17508 ) ) ( not ( = ?auto_17511 ?auto_17508 ) ) ( not ( = ?auto_17509 ?auto_17508 ) ) ( not ( = ?auto_17514 ?auto_17513 ) ) ( not ( = ?auto_17514 ?auto_17516 ) ) ( not ( = ?auto_17514 ?auto_17517 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17510 ?auto_17511 ?auto_17508 ?auto_17509 ?auto_17507 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17543 - OBJ
      ?auto_17544 - OBJ
      ?auto_17545 - OBJ
      ?auto_17546 - OBJ
      ?auto_17542 - LOCATION
    )
    :vars
    (
      ?auto_17549 - LOCATION
      ?auto_17550 - CITY
      ?auto_17548 - LOCATION
      ?auto_17551 - LOCATION
      ?auto_17552 - LOCATION
      ?auto_17547 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17549 ?auto_17550 ) ( IN-CITY ?auto_17542 ?auto_17550 ) ( not ( = ?auto_17542 ?auto_17549 ) ) ( OBJ-AT ?auto_17543 ?auto_17549 ) ( IN-CITY ?auto_17548 ?auto_17550 ) ( not ( = ?auto_17542 ?auto_17548 ) ) ( OBJ-AT ?auto_17544 ?auto_17548 ) ( IN-CITY ?auto_17551 ?auto_17550 ) ( not ( = ?auto_17542 ?auto_17551 ) ) ( OBJ-AT ?auto_17545 ?auto_17551 ) ( IN-CITY ?auto_17552 ?auto_17550 ) ( not ( = ?auto_17542 ?auto_17552 ) ) ( OBJ-AT ?auto_17546 ?auto_17552 ) ( TRUCK-AT ?auto_17547 ?auto_17542 ) ( not ( = ?auto_17546 ?auto_17545 ) ) ( not ( = ?auto_17551 ?auto_17552 ) ) ( not ( = ?auto_17546 ?auto_17544 ) ) ( not ( = ?auto_17545 ?auto_17544 ) ) ( not ( = ?auto_17548 ?auto_17551 ) ) ( not ( = ?auto_17548 ?auto_17552 ) ) ( not ( = ?auto_17546 ?auto_17543 ) ) ( not ( = ?auto_17545 ?auto_17543 ) ) ( not ( = ?auto_17544 ?auto_17543 ) ) ( not ( = ?auto_17549 ?auto_17548 ) ) ( not ( = ?auto_17549 ?auto_17551 ) ) ( not ( = ?auto_17549 ?auto_17552 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_17546 ?auto_17545 ?auto_17543 ?auto_17544 ?auto_17542 ) )
  )

)

