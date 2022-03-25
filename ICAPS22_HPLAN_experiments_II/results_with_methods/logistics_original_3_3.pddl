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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10672 - OBJ
      ?auto_10671 - LOCATION
    )
    :vars
    (
      ?auto_10673 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10673 ?auto_10671 ) ( IN-TRUCK ?auto_10672 ?auto_10673 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10672 ?auto_10673 ?auto_10671 )
      ( DELIVER-1PKG-VERIFY ?auto_10672 ?auto_10671 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10684 - OBJ
      ?auto_10683 - LOCATION
    )
    :vars
    (
      ?auto_10685 - TRUCK
      ?auto_10686 - LOCATION
      ?auto_10687 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10684 ?auto_10685 ) ( TRUCK-AT ?auto_10685 ?auto_10686 ) ( IN-CITY ?auto_10686 ?auto_10687 ) ( IN-CITY ?auto_10683 ?auto_10687 ) ( not ( = ?auto_10683 ?auto_10686 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10685 ?auto_10686 ?auto_10683 ?auto_10687 )
      ( DELIVER-1PKG ?auto_10684 ?auto_10683 )
      ( DELIVER-1PKG-VERIFY ?auto_10684 ?auto_10683 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10702 - OBJ
      ?auto_10701 - LOCATION
    )
    :vars
    (
      ?auto_10705 - TRUCK
      ?auto_10703 - LOCATION
      ?auto_10704 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10705 ?auto_10703 ) ( IN-CITY ?auto_10703 ?auto_10704 ) ( IN-CITY ?auto_10701 ?auto_10704 ) ( not ( = ?auto_10701 ?auto_10703 ) ) ( OBJ-AT ?auto_10702 ?auto_10703 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10702 ?auto_10705 ?auto_10703 )
      ( DELIVER-1PKG ?auto_10702 ?auto_10701 )
      ( DELIVER-1PKG-VERIFY ?auto_10702 ?auto_10701 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10720 - OBJ
      ?auto_10719 - LOCATION
    )
    :vars
    (
      ?auto_10723 - LOCATION
      ?auto_10722 - CITY
      ?auto_10721 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10723 ?auto_10722 ) ( IN-CITY ?auto_10719 ?auto_10722 ) ( not ( = ?auto_10719 ?auto_10723 ) ) ( OBJ-AT ?auto_10720 ?auto_10723 ) ( TRUCK-AT ?auto_10721 ?auto_10719 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10721 ?auto_10719 ?auto_10723 ?auto_10722 )
      ( DELIVER-1PKG ?auto_10720 ?auto_10719 )
      ( DELIVER-1PKG-VERIFY ?auto_10720 ?auto_10719 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10777 - OBJ
      ?auto_10776 - LOCATION
    )
    :vars
    (
      ?auto_10778 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10778 ?auto_10776 ) ( IN-TRUCK ?auto_10777 ?auto_10778 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_10777 ?auto_10778 ?auto_10776 )
      ( DELIVER-1PKG-VERIFY ?auto_10777 ?auto_10776 ) )
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
      ?auto_10782 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10782 ?auto_10779 ) ( IN-TRUCK ?auto_10781 ?auto_10782 ) ( OBJ-AT ?auto_10780 ?auto_10779 ) ( not ( = ?auto_10780 ?auto_10781 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10781 ?auto_10779 )
      ( DELIVER-2PKG-VERIFY ?auto_10780 ?auto_10781 ?auto_10779 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10784 - OBJ
      ?auto_10785 - OBJ
      ?auto_10783 - LOCATION
    )
    :vars
    (
      ?auto_10786 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10786 ?auto_10783 ) ( IN-TRUCK ?auto_10784 ?auto_10786 ) ( OBJ-AT ?auto_10785 ?auto_10783 ) ( not ( = ?auto_10784 ?auto_10785 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10784 ?auto_10783 )
      ( DELIVER-2PKG-VERIFY ?auto_10784 ?auto_10785 ?auto_10783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10792 - OBJ
      ?auto_10793 - OBJ
      ?auto_10794 - OBJ
      ?auto_10791 - LOCATION
    )
    :vars
    (
      ?auto_10795 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10795 ?auto_10791 ) ( IN-TRUCK ?auto_10794 ?auto_10795 ) ( OBJ-AT ?auto_10792 ?auto_10791 ) ( OBJ-AT ?auto_10793 ?auto_10791 ) ( not ( = ?auto_10792 ?auto_10793 ) ) ( not ( = ?auto_10792 ?auto_10794 ) ) ( not ( = ?auto_10793 ?auto_10794 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10794 ?auto_10791 )
      ( DELIVER-3PKG-VERIFY ?auto_10792 ?auto_10793 ?auto_10794 ?auto_10791 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10797 - OBJ
      ?auto_10798 - OBJ
      ?auto_10799 - OBJ
      ?auto_10796 - LOCATION
    )
    :vars
    (
      ?auto_10800 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10800 ?auto_10796 ) ( IN-TRUCK ?auto_10798 ?auto_10800 ) ( OBJ-AT ?auto_10797 ?auto_10796 ) ( OBJ-AT ?auto_10799 ?auto_10796 ) ( not ( = ?auto_10797 ?auto_10798 ) ) ( not ( = ?auto_10797 ?auto_10799 ) ) ( not ( = ?auto_10798 ?auto_10799 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10798 ?auto_10796 )
      ( DELIVER-3PKG-VERIFY ?auto_10797 ?auto_10798 ?auto_10799 ?auto_10796 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10807 - OBJ
      ?auto_10808 - OBJ
      ?auto_10809 - OBJ
      ?auto_10806 - LOCATION
    )
    :vars
    (
      ?auto_10810 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10810 ?auto_10806 ) ( IN-TRUCK ?auto_10807 ?auto_10810 ) ( OBJ-AT ?auto_10808 ?auto_10806 ) ( OBJ-AT ?auto_10809 ?auto_10806 ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10809 ) ) ( not ( = ?auto_10808 ?auto_10809 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10807 ?auto_10806 )
      ( DELIVER-3PKG-VERIFY ?auto_10807 ?auto_10808 ?auto_10809 ?auto_10806 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10827 - OBJ
      ?auto_10826 - LOCATION
    )
    :vars
    (
      ?auto_10828 - TRUCK
      ?auto_10829 - LOCATION
      ?auto_10830 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10827 ?auto_10828 ) ( TRUCK-AT ?auto_10828 ?auto_10829 ) ( IN-CITY ?auto_10829 ?auto_10830 ) ( IN-CITY ?auto_10826 ?auto_10830 ) ( not ( = ?auto_10826 ?auto_10829 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10828 ?auto_10829 ?auto_10826 ?auto_10830 )
      ( DELIVER-1PKG ?auto_10827 ?auto_10826 )
      ( DELIVER-1PKG-VERIFY ?auto_10827 ?auto_10826 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10832 - OBJ
      ?auto_10833 - OBJ
      ?auto_10831 - LOCATION
    )
    :vars
    (
      ?auto_10835 - TRUCK
      ?auto_10834 - LOCATION
      ?auto_10836 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10833 ?auto_10835 ) ( TRUCK-AT ?auto_10835 ?auto_10834 ) ( IN-CITY ?auto_10834 ?auto_10836 ) ( IN-CITY ?auto_10831 ?auto_10836 ) ( not ( = ?auto_10831 ?auto_10834 ) ) ( OBJ-AT ?auto_10832 ?auto_10831 ) ( not ( = ?auto_10832 ?auto_10833 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10833 ?auto_10831 )
      ( DELIVER-2PKG-VERIFY ?auto_10832 ?auto_10833 ?auto_10831 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10838 - OBJ
      ?auto_10839 - OBJ
      ?auto_10837 - LOCATION
    )
    :vars
    (
      ?auto_10840 - TRUCK
      ?auto_10841 - LOCATION
      ?auto_10842 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10838 ?auto_10840 ) ( TRUCK-AT ?auto_10840 ?auto_10841 ) ( IN-CITY ?auto_10841 ?auto_10842 ) ( IN-CITY ?auto_10837 ?auto_10842 ) ( not ( = ?auto_10837 ?auto_10841 ) ) ( OBJ-AT ?auto_10839 ?auto_10837 ) ( not ( = ?auto_10839 ?auto_10838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10839 ?auto_10838 ?auto_10837 )
      ( DELIVER-2PKG-VERIFY ?auto_10838 ?auto_10839 ?auto_10837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10851 - OBJ
      ?auto_10852 - OBJ
      ?auto_10853 - OBJ
      ?auto_10850 - LOCATION
    )
    :vars
    (
      ?auto_10854 - TRUCK
      ?auto_10855 - LOCATION
      ?auto_10856 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10853 ?auto_10854 ) ( TRUCK-AT ?auto_10854 ?auto_10855 ) ( IN-CITY ?auto_10855 ?auto_10856 ) ( IN-CITY ?auto_10850 ?auto_10856 ) ( not ( = ?auto_10850 ?auto_10855 ) ) ( OBJ-AT ?auto_10851 ?auto_10850 ) ( not ( = ?auto_10851 ?auto_10853 ) ) ( OBJ-AT ?auto_10852 ?auto_10850 ) ( not ( = ?auto_10851 ?auto_10852 ) ) ( not ( = ?auto_10852 ?auto_10853 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10851 ?auto_10853 ?auto_10850 )
      ( DELIVER-3PKG-VERIFY ?auto_10851 ?auto_10852 ?auto_10853 ?auto_10850 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10858 - OBJ
      ?auto_10859 - OBJ
      ?auto_10860 - OBJ
      ?auto_10857 - LOCATION
    )
    :vars
    (
      ?auto_10861 - TRUCK
      ?auto_10862 - LOCATION
      ?auto_10863 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10859 ?auto_10861 ) ( TRUCK-AT ?auto_10861 ?auto_10862 ) ( IN-CITY ?auto_10862 ?auto_10863 ) ( IN-CITY ?auto_10857 ?auto_10863 ) ( not ( = ?auto_10857 ?auto_10862 ) ) ( OBJ-AT ?auto_10858 ?auto_10857 ) ( not ( = ?auto_10858 ?auto_10859 ) ) ( OBJ-AT ?auto_10860 ?auto_10857 ) ( not ( = ?auto_10858 ?auto_10860 ) ) ( not ( = ?auto_10859 ?auto_10860 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10858 ?auto_10859 ?auto_10857 )
      ( DELIVER-3PKG-VERIFY ?auto_10858 ?auto_10859 ?auto_10860 ?auto_10857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10872 - OBJ
      ?auto_10873 - OBJ
      ?auto_10874 - OBJ
      ?auto_10871 - LOCATION
    )
    :vars
    (
      ?auto_10875 - TRUCK
      ?auto_10876 - LOCATION
      ?auto_10877 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_10872 ?auto_10875 ) ( TRUCK-AT ?auto_10875 ?auto_10876 ) ( IN-CITY ?auto_10876 ?auto_10877 ) ( IN-CITY ?auto_10871 ?auto_10877 ) ( not ( = ?auto_10871 ?auto_10876 ) ) ( OBJ-AT ?auto_10874 ?auto_10871 ) ( not ( = ?auto_10874 ?auto_10872 ) ) ( OBJ-AT ?auto_10873 ?auto_10871 ) ( not ( = ?auto_10872 ?auto_10873 ) ) ( not ( = ?auto_10873 ?auto_10874 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10874 ?auto_10872 ?auto_10871 )
      ( DELIVER-3PKG-VERIFY ?auto_10872 ?auto_10873 ?auto_10874 ?auto_10871 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10901 - OBJ
      ?auto_10900 - LOCATION
    )
    :vars
    (
      ?auto_10902 - TRUCK
      ?auto_10903 - LOCATION
      ?auto_10905 - CITY
      ?auto_10904 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10902 ?auto_10903 ) ( IN-CITY ?auto_10903 ?auto_10905 ) ( IN-CITY ?auto_10900 ?auto_10905 ) ( not ( = ?auto_10900 ?auto_10903 ) ) ( OBJ-AT ?auto_10904 ?auto_10900 ) ( not ( = ?auto_10904 ?auto_10901 ) ) ( OBJ-AT ?auto_10901 ?auto_10903 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_10901 ?auto_10902 ?auto_10903 )
      ( DELIVER-2PKG ?auto_10904 ?auto_10901 ?auto_10900 )
      ( DELIVER-1PKG-VERIFY ?auto_10901 ?auto_10900 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10907 - OBJ
      ?auto_10908 - OBJ
      ?auto_10906 - LOCATION
    )
    :vars
    (
      ?auto_10911 - TRUCK
      ?auto_10910 - LOCATION
      ?auto_10909 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10911 ?auto_10910 ) ( IN-CITY ?auto_10910 ?auto_10909 ) ( IN-CITY ?auto_10906 ?auto_10909 ) ( not ( = ?auto_10906 ?auto_10910 ) ) ( OBJ-AT ?auto_10907 ?auto_10906 ) ( not ( = ?auto_10907 ?auto_10908 ) ) ( OBJ-AT ?auto_10908 ?auto_10910 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10908 ?auto_10906 )
      ( DELIVER-2PKG-VERIFY ?auto_10907 ?auto_10908 ?auto_10906 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10913 - OBJ
      ?auto_10914 - OBJ
      ?auto_10912 - LOCATION
    )
    :vars
    (
      ?auto_10915 - TRUCK
      ?auto_10916 - LOCATION
      ?auto_10917 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10915 ?auto_10916 ) ( IN-CITY ?auto_10916 ?auto_10917 ) ( IN-CITY ?auto_10912 ?auto_10917 ) ( not ( = ?auto_10912 ?auto_10916 ) ) ( OBJ-AT ?auto_10914 ?auto_10912 ) ( not ( = ?auto_10914 ?auto_10913 ) ) ( OBJ-AT ?auto_10913 ?auto_10916 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10914 ?auto_10913 ?auto_10912 )
      ( DELIVER-2PKG-VERIFY ?auto_10913 ?auto_10914 ?auto_10912 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10926 - OBJ
      ?auto_10927 - OBJ
      ?auto_10928 - OBJ
      ?auto_10925 - LOCATION
    )
    :vars
    (
      ?auto_10929 - TRUCK
      ?auto_10930 - LOCATION
      ?auto_10931 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10929 ?auto_10930 ) ( IN-CITY ?auto_10930 ?auto_10931 ) ( IN-CITY ?auto_10925 ?auto_10931 ) ( not ( = ?auto_10925 ?auto_10930 ) ) ( OBJ-AT ?auto_10926 ?auto_10925 ) ( not ( = ?auto_10926 ?auto_10928 ) ) ( OBJ-AT ?auto_10928 ?auto_10930 ) ( OBJ-AT ?auto_10927 ?auto_10925 ) ( not ( = ?auto_10926 ?auto_10927 ) ) ( not ( = ?auto_10927 ?auto_10928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10926 ?auto_10928 ?auto_10925 )
      ( DELIVER-3PKG-VERIFY ?auto_10926 ?auto_10927 ?auto_10928 ?auto_10925 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10933 - OBJ
      ?auto_10934 - OBJ
      ?auto_10935 - OBJ
      ?auto_10932 - LOCATION
    )
    :vars
    (
      ?auto_10936 - TRUCK
      ?auto_10937 - LOCATION
      ?auto_10938 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10936 ?auto_10937 ) ( IN-CITY ?auto_10937 ?auto_10938 ) ( IN-CITY ?auto_10932 ?auto_10938 ) ( not ( = ?auto_10932 ?auto_10937 ) ) ( OBJ-AT ?auto_10935 ?auto_10932 ) ( not ( = ?auto_10935 ?auto_10934 ) ) ( OBJ-AT ?auto_10934 ?auto_10937 ) ( OBJ-AT ?auto_10933 ?auto_10932 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10933 ?auto_10935 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10935 ?auto_10934 ?auto_10932 )
      ( DELIVER-3PKG-VERIFY ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10932 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_10947 - OBJ
      ?auto_10948 - OBJ
      ?auto_10949 - OBJ
      ?auto_10946 - LOCATION
    )
    :vars
    (
      ?auto_10950 - TRUCK
      ?auto_10951 - LOCATION
      ?auto_10952 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_10950 ?auto_10951 ) ( IN-CITY ?auto_10951 ?auto_10952 ) ( IN-CITY ?auto_10946 ?auto_10952 ) ( not ( = ?auto_10946 ?auto_10951 ) ) ( OBJ-AT ?auto_10949 ?auto_10946 ) ( not ( = ?auto_10949 ?auto_10947 ) ) ( OBJ-AT ?auto_10947 ?auto_10951 ) ( OBJ-AT ?auto_10948 ?auto_10946 ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10948 ?auto_10949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10949 ?auto_10947 ?auto_10946 )
      ( DELIVER-3PKG-VERIFY ?auto_10947 ?auto_10948 ?auto_10949 ?auto_10946 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10976 - OBJ
      ?auto_10975 - LOCATION
    )
    :vars
    (
      ?auto_10979 - LOCATION
      ?auto_10980 - CITY
      ?auto_10978 - OBJ
      ?auto_10977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10979 ?auto_10980 ) ( IN-CITY ?auto_10975 ?auto_10980 ) ( not ( = ?auto_10975 ?auto_10979 ) ) ( OBJ-AT ?auto_10978 ?auto_10975 ) ( not ( = ?auto_10978 ?auto_10976 ) ) ( OBJ-AT ?auto_10976 ?auto_10979 ) ( TRUCK-AT ?auto_10977 ?auto_10975 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_10977 ?auto_10975 ?auto_10979 ?auto_10980 )
      ( DELIVER-2PKG ?auto_10978 ?auto_10976 ?auto_10975 )
      ( DELIVER-1PKG-VERIFY ?auto_10976 ?auto_10975 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10982 - OBJ
      ?auto_10983 - OBJ
      ?auto_10981 - LOCATION
    )
    :vars
    (
      ?auto_10984 - LOCATION
      ?auto_10985 - CITY
      ?auto_10986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10984 ?auto_10985 ) ( IN-CITY ?auto_10981 ?auto_10985 ) ( not ( = ?auto_10981 ?auto_10984 ) ) ( OBJ-AT ?auto_10982 ?auto_10981 ) ( not ( = ?auto_10982 ?auto_10983 ) ) ( OBJ-AT ?auto_10983 ?auto_10984 ) ( TRUCK-AT ?auto_10986 ?auto_10981 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_10983 ?auto_10981 )
      ( DELIVER-2PKG-VERIFY ?auto_10982 ?auto_10983 ?auto_10981 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_10988 - OBJ
      ?auto_10989 - OBJ
      ?auto_10987 - LOCATION
    )
    :vars
    (
      ?auto_10992 - LOCATION
      ?auto_10991 - CITY
      ?auto_10990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10992 ?auto_10991 ) ( IN-CITY ?auto_10987 ?auto_10991 ) ( not ( = ?auto_10987 ?auto_10992 ) ) ( OBJ-AT ?auto_10989 ?auto_10987 ) ( not ( = ?auto_10989 ?auto_10988 ) ) ( OBJ-AT ?auto_10988 ?auto_10992 ) ( TRUCK-AT ?auto_10990 ?auto_10987 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_10989 ?auto_10988 ?auto_10987 )
      ( DELIVER-2PKG-VERIFY ?auto_10988 ?auto_10989 ?auto_10987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11001 - OBJ
      ?auto_11002 - OBJ
      ?auto_11003 - OBJ
      ?auto_11000 - LOCATION
    )
    :vars
    (
      ?auto_11006 - LOCATION
      ?auto_11005 - CITY
      ?auto_11004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11006 ?auto_11005 ) ( IN-CITY ?auto_11000 ?auto_11005 ) ( not ( = ?auto_11000 ?auto_11006 ) ) ( OBJ-AT ?auto_11002 ?auto_11000 ) ( not ( = ?auto_11002 ?auto_11003 ) ) ( OBJ-AT ?auto_11003 ?auto_11006 ) ( TRUCK-AT ?auto_11004 ?auto_11000 ) ( OBJ-AT ?auto_11001 ?auto_11000 ) ( not ( = ?auto_11001 ?auto_11002 ) ) ( not ( = ?auto_11001 ?auto_11003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11002 ?auto_11003 ?auto_11000 )
      ( DELIVER-3PKG-VERIFY ?auto_11001 ?auto_11002 ?auto_11003 ?auto_11000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11008 - OBJ
      ?auto_11009 - OBJ
      ?auto_11010 - OBJ
      ?auto_11007 - LOCATION
    )
    :vars
    (
      ?auto_11013 - LOCATION
      ?auto_11012 - CITY
      ?auto_11011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11013 ?auto_11012 ) ( IN-CITY ?auto_11007 ?auto_11012 ) ( not ( = ?auto_11007 ?auto_11013 ) ) ( OBJ-AT ?auto_11010 ?auto_11007 ) ( not ( = ?auto_11010 ?auto_11009 ) ) ( OBJ-AT ?auto_11009 ?auto_11013 ) ( TRUCK-AT ?auto_11011 ?auto_11007 ) ( OBJ-AT ?auto_11008 ?auto_11007 ) ( not ( = ?auto_11008 ?auto_11009 ) ) ( not ( = ?auto_11008 ?auto_11010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11010 ?auto_11009 ?auto_11007 )
      ( DELIVER-3PKG-VERIFY ?auto_11008 ?auto_11009 ?auto_11010 ?auto_11007 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11022 - OBJ
      ?auto_11023 - OBJ
      ?auto_11024 - OBJ
      ?auto_11021 - LOCATION
    )
    :vars
    (
      ?auto_11027 - LOCATION
      ?auto_11026 - CITY
      ?auto_11025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11027 ?auto_11026 ) ( IN-CITY ?auto_11021 ?auto_11026 ) ( not ( = ?auto_11021 ?auto_11027 ) ) ( OBJ-AT ?auto_11024 ?auto_11021 ) ( not ( = ?auto_11024 ?auto_11022 ) ) ( OBJ-AT ?auto_11022 ?auto_11027 ) ( TRUCK-AT ?auto_11025 ?auto_11021 ) ( OBJ-AT ?auto_11023 ?auto_11021 ) ( not ( = ?auto_11022 ?auto_11023 ) ) ( not ( = ?auto_11023 ?auto_11024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11024 ?auto_11022 ?auto_11021 )
      ( DELIVER-3PKG-VERIFY ?auto_11022 ?auto_11023 ?auto_11024 ?auto_11021 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11051 - OBJ
      ?auto_11050 - LOCATION
    )
    :vars
    (
      ?auto_11055 - LOCATION
      ?auto_11053 - CITY
      ?auto_11054 - OBJ
      ?auto_11052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11055 ?auto_11053 ) ( IN-CITY ?auto_11050 ?auto_11053 ) ( not ( = ?auto_11050 ?auto_11055 ) ) ( not ( = ?auto_11054 ?auto_11051 ) ) ( OBJ-AT ?auto_11051 ?auto_11055 ) ( TRUCK-AT ?auto_11052 ?auto_11050 ) ( IN-TRUCK ?auto_11054 ?auto_11052 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11054 ?auto_11050 )
      ( DELIVER-2PKG ?auto_11054 ?auto_11051 ?auto_11050 )
      ( DELIVER-1PKG-VERIFY ?auto_11051 ?auto_11050 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11057 - OBJ
      ?auto_11058 - OBJ
      ?auto_11056 - LOCATION
    )
    :vars
    (
      ?auto_11061 - LOCATION
      ?auto_11060 - CITY
      ?auto_11059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11061 ?auto_11060 ) ( IN-CITY ?auto_11056 ?auto_11060 ) ( not ( = ?auto_11056 ?auto_11061 ) ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( OBJ-AT ?auto_11058 ?auto_11061 ) ( TRUCK-AT ?auto_11059 ?auto_11056 ) ( IN-TRUCK ?auto_11057 ?auto_11059 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11058 ?auto_11056 )
      ( DELIVER-2PKG-VERIFY ?auto_11057 ?auto_11058 ?auto_11056 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11063 - OBJ
      ?auto_11064 - OBJ
      ?auto_11062 - LOCATION
    )
    :vars
    (
      ?auto_11067 - LOCATION
      ?auto_11065 - CITY
      ?auto_11066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11067 ?auto_11065 ) ( IN-CITY ?auto_11062 ?auto_11065 ) ( not ( = ?auto_11062 ?auto_11067 ) ) ( not ( = ?auto_11064 ?auto_11063 ) ) ( OBJ-AT ?auto_11063 ?auto_11067 ) ( TRUCK-AT ?auto_11066 ?auto_11062 ) ( IN-TRUCK ?auto_11064 ?auto_11066 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11064 ?auto_11063 ?auto_11062 )
      ( DELIVER-2PKG-VERIFY ?auto_11063 ?auto_11064 ?auto_11062 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11126 - OBJ
      ?auto_11125 - LOCATION
    )
    :vars
    (
      ?auto_11130 - LOCATION
      ?auto_11127 - CITY
      ?auto_11128 - OBJ
      ?auto_11129 - TRUCK
      ?auto_11131 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11130 ?auto_11127 ) ( IN-CITY ?auto_11125 ?auto_11127 ) ( not ( = ?auto_11125 ?auto_11130 ) ) ( not ( = ?auto_11128 ?auto_11126 ) ) ( OBJ-AT ?auto_11126 ?auto_11130 ) ( IN-TRUCK ?auto_11128 ?auto_11129 ) ( TRUCK-AT ?auto_11129 ?auto_11131 ) ( IN-CITY ?auto_11131 ?auto_11127 ) ( not ( = ?auto_11125 ?auto_11131 ) ) ( not ( = ?auto_11130 ?auto_11131 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11129 ?auto_11131 ?auto_11125 ?auto_11127 )
      ( DELIVER-2PKG ?auto_11128 ?auto_11126 ?auto_11125 )
      ( DELIVER-1PKG-VERIFY ?auto_11126 ?auto_11125 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11133 - OBJ
      ?auto_11134 - OBJ
      ?auto_11132 - LOCATION
    )
    :vars
    (
      ?auto_11138 - LOCATION
      ?auto_11137 - CITY
      ?auto_11136 - TRUCK
      ?auto_11135 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11138 ?auto_11137 ) ( IN-CITY ?auto_11132 ?auto_11137 ) ( not ( = ?auto_11132 ?auto_11138 ) ) ( not ( = ?auto_11133 ?auto_11134 ) ) ( OBJ-AT ?auto_11134 ?auto_11138 ) ( IN-TRUCK ?auto_11133 ?auto_11136 ) ( TRUCK-AT ?auto_11136 ?auto_11135 ) ( IN-CITY ?auto_11135 ?auto_11137 ) ( not ( = ?auto_11132 ?auto_11135 ) ) ( not ( = ?auto_11138 ?auto_11135 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11134 ?auto_11132 )
      ( DELIVER-2PKG-VERIFY ?auto_11133 ?auto_11134 ?auto_11132 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11140 - OBJ
      ?auto_11141 - OBJ
      ?auto_11139 - LOCATION
    )
    :vars
    (
      ?auto_11145 - LOCATION
      ?auto_11142 - CITY
      ?auto_11143 - TRUCK
      ?auto_11144 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11145 ?auto_11142 ) ( IN-CITY ?auto_11139 ?auto_11142 ) ( not ( = ?auto_11139 ?auto_11145 ) ) ( not ( = ?auto_11141 ?auto_11140 ) ) ( OBJ-AT ?auto_11140 ?auto_11145 ) ( IN-TRUCK ?auto_11141 ?auto_11143 ) ( TRUCK-AT ?auto_11143 ?auto_11144 ) ( IN-CITY ?auto_11144 ?auto_11142 ) ( not ( = ?auto_11139 ?auto_11144 ) ) ( not ( = ?auto_11145 ?auto_11144 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11141 ?auto_11140 ?auto_11139 )
      ( DELIVER-2PKG-VERIFY ?auto_11140 ?auto_11141 ?auto_11139 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11212 - OBJ
      ?auto_11211 - LOCATION
    )
    :vars
    (
      ?auto_11217 - LOCATION
      ?auto_11214 - CITY
      ?auto_11213 - OBJ
      ?auto_11215 - TRUCK
      ?auto_11216 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11217 ?auto_11214 ) ( IN-CITY ?auto_11211 ?auto_11214 ) ( not ( = ?auto_11211 ?auto_11217 ) ) ( not ( = ?auto_11213 ?auto_11212 ) ) ( OBJ-AT ?auto_11212 ?auto_11217 ) ( TRUCK-AT ?auto_11215 ?auto_11216 ) ( IN-CITY ?auto_11216 ?auto_11214 ) ( not ( = ?auto_11211 ?auto_11216 ) ) ( not ( = ?auto_11217 ?auto_11216 ) ) ( OBJ-AT ?auto_11213 ?auto_11216 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11213 ?auto_11215 ?auto_11216 )
      ( DELIVER-2PKG ?auto_11213 ?auto_11212 ?auto_11211 )
      ( DELIVER-1PKG-VERIFY ?auto_11212 ?auto_11211 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11219 - OBJ
      ?auto_11220 - OBJ
      ?auto_11218 - LOCATION
    )
    :vars
    (
      ?auto_11223 - LOCATION
      ?auto_11221 - CITY
      ?auto_11222 - TRUCK
      ?auto_11224 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11223 ?auto_11221 ) ( IN-CITY ?auto_11218 ?auto_11221 ) ( not ( = ?auto_11218 ?auto_11223 ) ) ( not ( = ?auto_11219 ?auto_11220 ) ) ( OBJ-AT ?auto_11220 ?auto_11223 ) ( TRUCK-AT ?auto_11222 ?auto_11224 ) ( IN-CITY ?auto_11224 ?auto_11221 ) ( not ( = ?auto_11218 ?auto_11224 ) ) ( not ( = ?auto_11223 ?auto_11224 ) ) ( OBJ-AT ?auto_11219 ?auto_11224 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11220 ?auto_11218 )
      ( DELIVER-2PKG-VERIFY ?auto_11219 ?auto_11220 ?auto_11218 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11226 - OBJ
      ?auto_11227 - OBJ
      ?auto_11225 - LOCATION
    )
    :vars
    (
      ?auto_11229 - LOCATION
      ?auto_11230 - CITY
      ?auto_11231 - TRUCK
      ?auto_11228 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_11229 ?auto_11230 ) ( IN-CITY ?auto_11225 ?auto_11230 ) ( not ( = ?auto_11225 ?auto_11229 ) ) ( not ( = ?auto_11227 ?auto_11226 ) ) ( OBJ-AT ?auto_11226 ?auto_11229 ) ( TRUCK-AT ?auto_11231 ?auto_11228 ) ( IN-CITY ?auto_11228 ?auto_11230 ) ( not ( = ?auto_11225 ?auto_11228 ) ) ( not ( = ?auto_11229 ?auto_11228 ) ) ( OBJ-AT ?auto_11227 ?auto_11228 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11227 ?auto_11226 ?auto_11225 )
      ( DELIVER-2PKG-VERIFY ?auto_11226 ?auto_11227 ?auto_11225 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11298 - OBJ
      ?auto_11297 - LOCATION
    )
    :vars
    (
      ?auto_11300 - LOCATION
      ?auto_11301 - CITY
      ?auto_11303 - OBJ
      ?auto_11299 - LOCATION
      ?auto_11302 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11300 ?auto_11301 ) ( IN-CITY ?auto_11297 ?auto_11301 ) ( not ( = ?auto_11297 ?auto_11300 ) ) ( not ( = ?auto_11303 ?auto_11298 ) ) ( OBJ-AT ?auto_11298 ?auto_11300 ) ( IN-CITY ?auto_11299 ?auto_11301 ) ( not ( = ?auto_11297 ?auto_11299 ) ) ( not ( = ?auto_11300 ?auto_11299 ) ) ( OBJ-AT ?auto_11303 ?auto_11299 ) ( TRUCK-AT ?auto_11302 ?auto_11297 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11302 ?auto_11297 ?auto_11299 ?auto_11301 )
      ( DELIVER-2PKG ?auto_11303 ?auto_11298 ?auto_11297 )
      ( DELIVER-1PKG-VERIFY ?auto_11298 ?auto_11297 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11305 - OBJ
      ?auto_11306 - OBJ
      ?auto_11304 - LOCATION
    )
    :vars
    (
      ?auto_11307 - LOCATION
      ?auto_11309 - CITY
      ?auto_11310 - LOCATION
      ?auto_11308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11307 ?auto_11309 ) ( IN-CITY ?auto_11304 ?auto_11309 ) ( not ( = ?auto_11304 ?auto_11307 ) ) ( not ( = ?auto_11305 ?auto_11306 ) ) ( OBJ-AT ?auto_11306 ?auto_11307 ) ( IN-CITY ?auto_11310 ?auto_11309 ) ( not ( = ?auto_11304 ?auto_11310 ) ) ( not ( = ?auto_11307 ?auto_11310 ) ) ( OBJ-AT ?auto_11305 ?auto_11310 ) ( TRUCK-AT ?auto_11308 ?auto_11304 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11306 ?auto_11304 )
      ( DELIVER-2PKG-VERIFY ?auto_11305 ?auto_11306 ?auto_11304 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11312 - OBJ
      ?auto_11313 - OBJ
      ?auto_11311 - LOCATION
    )
    :vars
    (
      ?auto_11316 - LOCATION
      ?auto_11315 - CITY
      ?auto_11317 - LOCATION
      ?auto_11314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11316 ?auto_11315 ) ( IN-CITY ?auto_11311 ?auto_11315 ) ( not ( = ?auto_11311 ?auto_11316 ) ) ( not ( = ?auto_11313 ?auto_11312 ) ) ( OBJ-AT ?auto_11312 ?auto_11316 ) ( IN-CITY ?auto_11317 ?auto_11315 ) ( not ( = ?auto_11311 ?auto_11317 ) ) ( not ( = ?auto_11316 ?auto_11317 ) ) ( OBJ-AT ?auto_11313 ?auto_11317 ) ( TRUCK-AT ?auto_11314 ?auto_11311 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11313 ?auto_11312 ?auto_11311 )
      ( DELIVER-2PKG-VERIFY ?auto_11312 ?auto_11313 ?auto_11311 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11477 - OBJ
      ?auto_11476 - LOCATION
    )
    :vars
    (
      ?auto_11478 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11478 ?auto_11476 ) ( IN-TRUCK ?auto_11477 ?auto_11478 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_11477 ?auto_11478 ?auto_11476 )
      ( DELIVER-1PKG-VERIFY ?auto_11477 ?auto_11476 ) )
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
      ?auto_11482 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11482 ?auto_11479 ) ( IN-TRUCK ?auto_11481 ?auto_11482 ) ( OBJ-AT ?auto_11480 ?auto_11479 ) ( not ( = ?auto_11480 ?auto_11481 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11481 ?auto_11479 )
      ( DELIVER-2PKG-VERIFY ?auto_11480 ?auto_11481 ?auto_11479 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11484 - OBJ
      ?auto_11485 - OBJ
      ?auto_11483 - LOCATION
    )
    :vars
    (
      ?auto_11486 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11486 ?auto_11483 ) ( IN-TRUCK ?auto_11485 ?auto_11486 ) ( OBJ-AT ?auto_11484 ?auto_11483 ) ( not ( = ?auto_11484 ?auto_11485 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11485 ?auto_11483 )
      ( DELIVER-2PKG-VERIFY ?auto_11484 ?auto_11485 ?auto_11483 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11488 - OBJ
      ?auto_11489 - OBJ
      ?auto_11487 - LOCATION
    )
    :vars
    (
      ?auto_11490 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11490 ?auto_11487 ) ( IN-TRUCK ?auto_11488 ?auto_11490 ) ( OBJ-AT ?auto_11489 ?auto_11487 ) ( not ( = ?auto_11488 ?auto_11489 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11488 ?auto_11487 )
      ( DELIVER-2PKG-VERIFY ?auto_11488 ?auto_11489 ?auto_11487 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11492 - OBJ
      ?auto_11493 - OBJ
      ?auto_11491 - LOCATION
    )
    :vars
    (
      ?auto_11494 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11494 ?auto_11491 ) ( IN-TRUCK ?auto_11492 ?auto_11494 ) ( OBJ-AT ?auto_11493 ?auto_11491 ) ( not ( = ?auto_11492 ?auto_11493 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11492 ?auto_11491 )
      ( DELIVER-2PKG-VERIFY ?auto_11492 ?auto_11493 ?auto_11491 ) )
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
      ?auto_11503 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11503 ?auto_11499 ) ( IN-TRUCK ?auto_11502 ?auto_11503 ) ( OBJ-AT ?auto_11500 ?auto_11499 ) ( OBJ-AT ?auto_11501 ?auto_11499 ) ( not ( = ?auto_11500 ?auto_11501 ) ) ( not ( = ?auto_11500 ?auto_11502 ) ) ( not ( = ?auto_11501 ?auto_11502 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11502 ?auto_11499 )
      ( DELIVER-3PKG-VERIFY ?auto_11500 ?auto_11501 ?auto_11502 ?auto_11499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11505 - OBJ
      ?auto_11506 - OBJ
      ?auto_11507 - OBJ
      ?auto_11504 - LOCATION
    )
    :vars
    (
      ?auto_11508 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11508 ?auto_11504 ) ( IN-TRUCK ?auto_11507 ?auto_11508 ) ( OBJ-AT ?auto_11505 ?auto_11504 ) ( OBJ-AT ?auto_11506 ?auto_11504 ) ( not ( = ?auto_11505 ?auto_11506 ) ) ( not ( = ?auto_11505 ?auto_11507 ) ) ( not ( = ?auto_11506 ?auto_11507 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11507 ?auto_11504 )
      ( DELIVER-3PKG-VERIFY ?auto_11505 ?auto_11506 ?auto_11507 ?auto_11504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11510 - OBJ
      ?auto_11511 - OBJ
      ?auto_11512 - OBJ
      ?auto_11509 - LOCATION
    )
    :vars
    (
      ?auto_11513 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11513 ?auto_11509 ) ( IN-TRUCK ?auto_11511 ?auto_11513 ) ( OBJ-AT ?auto_11510 ?auto_11509 ) ( OBJ-AT ?auto_11512 ?auto_11509 ) ( not ( = ?auto_11510 ?auto_11511 ) ) ( not ( = ?auto_11510 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11512 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11511 ?auto_11509 )
      ( DELIVER-3PKG-VERIFY ?auto_11510 ?auto_11511 ?auto_11512 ?auto_11509 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11515 - OBJ
      ?auto_11516 - OBJ
      ?auto_11517 - OBJ
      ?auto_11514 - LOCATION
    )
    :vars
    (
      ?auto_11518 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11518 ?auto_11514 ) ( IN-TRUCK ?auto_11516 ?auto_11518 ) ( OBJ-AT ?auto_11515 ?auto_11514 ) ( OBJ-AT ?auto_11517 ?auto_11514 ) ( not ( = ?auto_11515 ?auto_11516 ) ) ( not ( = ?auto_11515 ?auto_11517 ) ) ( not ( = ?auto_11516 ?auto_11517 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11516 ?auto_11514 )
      ( DELIVER-3PKG-VERIFY ?auto_11515 ?auto_11516 ?auto_11517 ?auto_11514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11525 - OBJ
      ?auto_11526 - OBJ
      ?auto_11527 - OBJ
      ?auto_11524 - LOCATION
    )
    :vars
    (
      ?auto_11528 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11528 ?auto_11524 ) ( IN-TRUCK ?auto_11527 ?auto_11528 ) ( OBJ-AT ?auto_11525 ?auto_11524 ) ( OBJ-AT ?auto_11526 ?auto_11524 ) ( not ( = ?auto_11525 ?auto_11526 ) ) ( not ( = ?auto_11525 ?auto_11527 ) ) ( not ( = ?auto_11526 ?auto_11527 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11527 ?auto_11524 )
      ( DELIVER-3PKG-VERIFY ?auto_11525 ?auto_11526 ?auto_11527 ?auto_11524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11530 - OBJ
      ?auto_11531 - OBJ
      ?auto_11532 - OBJ
      ?auto_11529 - LOCATION
    )
    :vars
    (
      ?auto_11533 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11533 ?auto_11529 ) ( IN-TRUCK ?auto_11532 ?auto_11533 ) ( OBJ-AT ?auto_11530 ?auto_11529 ) ( OBJ-AT ?auto_11531 ?auto_11529 ) ( not ( = ?auto_11530 ?auto_11531 ) ) ( not ( = ?auto_11530 ?auto_11532 ) ) ( not ( = ?auto_11531 ?auto_11532 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11532 ?auto_11529 )
      ( DELIVER-3PKG-VERIFY ?auto_11530 ?auto_11531 ?auto_11532 ?auto_11529 ) )
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
      ?auto_11538 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11538 ?auto_11534 ) ( IN-TRUCK ?auto_11536 ?auto_11538 ) ( OBJ-AT ?auto_11535 ?auto_11534 ) ( OBJ-AT ?auto_11537 ?auto_11534 ) ( not ( = ?auto_11535 ?auto_11536 ) ) ( not ( = ?auto_11535 ?auto_11537 ) ) ( not ( = ?auto_11536 ?auto_11537 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11536 ?auto_11534 )
      ( DELIVER-3PKG-VERIFY ?auto_11535 ?auto_11536 ?auto_11537 ?auto_11534 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11540 - OBJ
      ?auto_11541 - OBJ
      ?auto_11542 - OBJ
      ?auto_11539 - LOCATION
    )
    :vars
    (
      ?auto_11543 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11543 ?auto_11539 ) ( IN-TRUCK ?auto_11541 ?auto_11543 ) ( OBJ-AT ?auto_11540 ?auto_11539 ) ( OBJ-AT ?auto_11542 ?auto_11539 ) ( not ( = ?auto_11540 ?auto_11541 ) ) ( not ( = ?auto_11540 ?auto_11542 ) ) ( not ( = ?auto_11541 ?auto_11542 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11541 ?auto_11539 )
      ( DELIVER-3PKG-VERIFY ?auto_11540 ?auto_11541 ?auto_11542 ?auto_11539 ) )
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
      ?auto_11553 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11553 ?auto_11549 ) ( IN-TRUCK ?auto_11550 ?auto_11553 ) ( OBJ-AT ?auto_11551 ?auto_11549 ) ( OBJ-AT ?auto_11552 ?auto_11549 ) ( not ( = ?auto_11550 ?auto_11551 ) ) ( not ( = ?auto_11550 ?auto_11552 ) ) ( not ( = ?auto_11551 ?auto_11552 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11550 ?auto_11549 )
      ( DELIVER-3PKG-VERIFY ?auto_11550 ?auto_11551 ?auto_11552 ?auto_11549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11555 - OBJ
      ?auto_11556 - OBJ
      ?auto_11557 - OBJ
      ?auto_11554 - LOCATION
    )
    :vars
    (
      ?auto_11558 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11558 ?auto_11554 ) ( IN-TRUCK ?auto_11555 ?auto_11558 ) ( OBJ-AT ?auto_11556 ?auto_11554 ) ( OBJ-AT ?auto_11557 ?auto_11554 ) ( not ( = ?auto_11555 ?auto_11556 ) ) ( not ( = ?auto_11555 ?auto_11557 ) ) ( not ( = ?auto_11556 ?auto_11557 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11555 ?auto_11554 )
      ( DELIVER-3PKG-VERIFY ?auto_11555 ?auto_11556 ?auto_11557 ?auto_11554 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11565 - OBJ
      ?auto_11566 - OBJ
      ?auto_11567 - OBJ
      ?auto_11564 - LOCATION
    )
    :vars
    (
      ?auto_11568 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11568 ?auto_11564 ) ( IN-TRUCK ?auto_11565 ?auto_11568 ) ( OBJ-AT ?auto_11566 ?auto_11564 ) ( OBJ-AT ?auto_11567 ?auto_11564 ) ( not ( = ?auto_11565 ?auto_11566 ) ) ( not ( = ?auto_11565 ?auto_11567 ) ) ( not ( = ?auto_11566 ?auto_11567 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11565 ?auto_11564 )
      ( DELIVER-3PKG-VERIFY ?auto_11565 ?auto_11566 ?auto_11567 ?auto_11564 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11570 - OBJ
      ?auto_11571 - OBJ
      ?auto_11572 - OBJ
      ?auto_11569 - LOCATION
    )
    :vars
    (
      ?auto_11573 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11573 ?auto_11569 ) ( IN-TRUCK ?auto_11570 ?auto_11573 ) ( OBJ-AT ?auto_11571 ?auto_11569 ) ( OBJ-AT ?auto_11572 ?auto_11569 ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( not ( = ?auto_11570 ?auto_11572 ) ) ( not ( = ?auto_11571 ?auto_11572 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11570 ?auto_11569 )
      ( DELIVER-3PKG-VERIFY ?auto_11570 ?auto_11571 ?auto_11572 ?auto_11569 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11595 - OBJ
      ?auto_11594 - LOCATION
    )
    :vars
    (
      ?auto_11596 - TRUCK
      ?auto_11597 - LOCATION
      ?auto_11598 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11595 ?auto_11596 ) ( TRUCK-AT ?auto_11596 ?auto_11597 ) ( IN-CITY ?auto_11597 ?auto_11598 ) ( IN-CITY ?auto_11594 ?auto_11598 ) ( not ( = ?auto_11594 ?auto_11597 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11596 ?auto_11597 ?auto_11594 ?auto_11598 )
      ( DELIVER-1PKG ?auto_11595 ?auto_11594 )
      ( DELIVER-1PKG-VERIFY ?auto_11595 ?auto_11594 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11600 - OBJ
      ?auto_11601 - OBJ
      ?auto_11599 - LOCATION
    )
    :vars
    (
      ?auto_11604 - TRUCK
      ?auto_11603 - LOCATION
      ?auto_11602 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11601 ?auto_11604 ) ( TRUCK-AT ?auto_11604 ?auto_11603 ) ( IN-CITY ?auto_11603 ?auto_11602 ) ( IN-CITY ?auto_11599 ?auto_11602 ) ( not ( = ?auto_11599 ?auto_11603 ) ) ( OBJ-AT ?auto_11600 ?auto_11599 ) ( not ( = ?auto_11600 ?auto_11601 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11601 ?auto_11599 )
      ( DELIVER-2PKG-VERIFY ?auto_11600 ?auto_11601 ?auto_11599 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11606 - OBJ
      ?auto_11607 - OBJ
      ?auto_11605 - LOCATION
    )
    :vars
    (
      ?auto_11611 - TRUCK
      ?auto_11609 - LOCATION
      ?auto_11608 - CITY
      ?auto_11610 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11607 ?auto_11611 ) ( TRUCK-AT ?auto_11611 ?auto_11609 ) ( IN-CITY ?auto_11609 ?auto_11608 ) ( IN-CITY ?auto_11605 ?auto_11608 ) ( not ( = ?auto_11605 ?auto_11609 ) ) ( OBJ-AT ?auto_11610 ?auto_11605 ) ( not ( = ?auto_11610 ?auto_11607 ) ) ( OBJ-AT ?auto_11606 ?auto_11605 ) ( not ( = ?auto_11606 ?auto_11607 ) ) ( not ( = ?auto_11606 ?auto_11610 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11610 ?auto_11607 ?auto_11605 )
      ( DELIVER-2PKG-VERIFY ?auto_11606 ?auto_11607 ?auto_11605 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11613 - OBJ
      ?auto_11614 - OBJ
      ?auto_11612 - LOCATION
    )
    :vars
    (
      ?auto_11617 - TRUCK
      ?auto_11616 - LOCATION
      ?auto_11615 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11613 ?auto_11617 ) ( TRUCK-AT ?auto_11617 ?auto_11616 ) ( IN-CITY ?auto_11616 ?auto_11615 ) ( IN-CITY ?auto_11612 ?auto_11615 ) ( not ( = ?auto_11612 ?auto_11616 ) ) ( OBJ-AT ?auto_11614 ?auto_11612 ) ( not ( = ?auto_11614 ?auto_11613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11614 ?auto_11613 ?auto_11612 )
      ( DELIVER-2PKG-VERIFY ?auto_11613 ?auto_11614 ?auto_11612 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11619 - OBJ
      ?auto_11620 - OBJ
      ?auto_11618 - LOCATION
    )
    :vars
    (
      ?auto_11624 - TRUCK
      ?auto_11622 - LOCATION
      ?auto_11621 - CITY
      ?auto_11623 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11619 ?auto_11624 ) ( TRUCK-AT ?auto_11624 ?auto_11622 ) ( IN-CITY ?auto_11622 ?auto_11621 ) ( IN-CITY ?auto_11618 ?auto_11621 ) ( not ( = ?auto_11618 ?auto_11622 ) ) ( OBJ-AT ?auto_11623 ?auto_11618 ) ( not ( = ?auto_11623 ?auto_11619 ) ) ( OBJ-AT ?auto_11620 ?auto_11618 ) ( not ( = ?auto_11619 ?auto_11620 ) ) ( not ( = ?auto_11620 ?auto_11623 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11623 ?auto_11619 ?auto_11618 )
      ( DELIVER-2PKG-VERIFY ?auto_11619 ?auto_11620 ?auto_11618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11633 - OBJ
      ?auto_11634 - OBJ
      ?auto_11635 - OBJ
      ?auto_11632 - LOCATION
    )
    :vars
    (
      ?auto_11638 - TRUCK
      ?auto_11637 - LOCATION
      ?auto_11636 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11635 ?auto_11638 ) ( TRUCK-AT ?auto_11638 ?auto_11637 ) ( IN-CITY ?auto_11637 ?auto_11636 ) ( IN-CITY ?auto_11632 ?auto_11636 ) ( not ( = ?auto_11632 ?auto_11637 ) ) ( OBJ-AT ?auto_11634 ?auto_11632 ) ( not ( = ?auto_11634 ?auto_11635 ) ) ( OBJ-AT ?auto_11633 ?auto_11632 ) ( not ( = ?auto_11633 ?auto_11634 ) ) ( not ( = ?auto_11633 ?auto_11635 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11634 ?auto_11635 ?auto_11632 )
      ( DELIVER-3PKG-VERIFY ?auto_11633 ?auto_11634 ?auto_11635 ?auto_11632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11640 - OBJ
      ?auto_11641 - OBJ
      ?auto_11642 - OBJ
      ?auto_11639 - LOCATION
    )
    :vars
    (
      ?auto_11645 - TRUCK
      ?auto_11644 - LOCATION
      ?auto_11643 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11642 ?auto_11645 ) ( TRUCK-AT ?auto_11645 ?auto_11644 ) ( IN-CITY ?auto_11644 ?auto_11643 ) ( IN-CITY ?auto_11639 ?auto_11643 ) ( not ( = ?auto_11639 ?auto_11644 ) ) ( OBJ-AT ?auto_11640 ?auto_11639 ) ( not ( = ?auto_11640 ?auto_11642 ) ) ( OBJ-AT ?auto_11641 ?auto_11639 ) ( not ( = ?auto_11640 ?auto_11641 ) ) ( not ( = ?auto_11641 ?auto_11642 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11640 ?auto_11642 ?auto_11639 )
      ( DELIVER-3PKG-VERIFY ?auto_11640 ?auto_11641 ?auto_11642 ?auto_11639 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11647 - OBJ
      ?auto_11648 - OBJ
      ?auto_11649 - OBJ
      ?auto_11646 - LOCATION
    )
    :vars
    (
      ?auto_11652 - TRUCK
      ?auto_11651 - LOCATION
      ?auto_11650 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11648 ?auto_11652 ) ( TRUCK-AT ?auto_11652 ?auto_11651 ) ( IN-CITY ?auto_11651 ?auto_11650 ) ( IN-CITY ?auto_11646 ?auto_11650 ) ( not ( = ?auto_11646 ?auto_11651 ) ) ( OBJ-AT ?auto_11649 ?auto_11646 ) ( not ( = ?auto_11649 ?auto_11648 ) ) ( OBJ-AT ?auto_11647 ?auto_11646 ) ( not ( = ?auto_11647 ?auto_11648 ) ) ( not ( = ?auto_11647 ?auto_11649 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11649 ?auto_11648 ?auto_11646 )
      ( DELIVER-3PKG-VERIFY ?auto_11647 ?auto_11648 ?auto_11649 ?auto_11646 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11654 - OBJ
      ?auto_11655 - OBJ
      ?auto_11656 - OBJ
      ?auto_11653 - LOCATION
    )
    :vars
    (
      ?auto_11659 - TRUCK
      ?auto_11658 - LOCATION
      ?auto_11657 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11655 ?auto_11659 ) ( TRUCK-AT ?auto_11659 ?auto_11658 ) ( IN-CITY ?auto_11658 ?auto_11657 ) ( IN-CITY ?auto_11653 ?auto_11657 ) ( not ( = ?auto_11653 ?auto_11658 ) ) ( OBJ-AT ?auto_11654 ?auto_11653 ) ( not ( = ?auto_11654 ?auto_11655 ) ) ( OBJ-AT ?auto_11656 ?auto_11653 ) ( not ( = ?auto_11654 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11654 ?auto_11655 ?auto_11653 )
      ( DELIVER-3PKG-VERIFY ?auto_11654 ?auto_11655 ?auto_11656 ?auto_11653 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11668 - OBJ
      ?auto_11669 - OBJ
      ?auto_11670 - OBJ
      ?auto_11667 - LOCATION
    )
    :vars
    (
      ?auto_11673 - TRUCK
      ?auto_11672 - LOCATION
      ?auto_11671 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11670 ?auto_11673 ) ( TRUCK-AT ?auto_11673 ?auto_11672 ) ( IN-CITY ?auto_11672 ?auto_11671 ) ( IN-CITY ?auto_11667 ?auto_11671 ) ( not ( = ?auto_11667 ?auto_11672 ) ) ( OBJ-AT ?auto_11669 ?auto_11667 ) ( not ( = ?auto_11669 ?auto_11670 ) ) ( OBJ-AT ?auto_11668 ?auto_11667 ) ( not ( = ?auto_11668 ?auto_11669 ) ) ( not ( = ?auto_11668 ?auto_11670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11669 ?auto_11670 ?auto_11667 )
      ( DELIVER-3PKG-VERIFY ?auto_11668 ?auto_11669 ?auto_11670 ?auto_11667 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11675 - OBJ
      ?auto_11676 - OBJ
      ?auto_11677 - OBJ
      ?auto_11674 - LOCATION
    )
    :vars
    (
      ?auto_11681 - TRUCK
      ?auto_11679 - LOCATION
      ?auto_11678 - CITY
      ?auto_11680 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11677 ?auto_11681 ) ( TRUCK-AT ?auto_11681 ?auto_11679 ) ( IN-CITY ?auto_11679 ?auto_11678 ) ( IN-CITY ?auto_11674 ?auto_11678 ) ( not ( = ?auto_11674 ?auto_11679 ) ) ( OBJ-AT ?auto_11680 ?auto_11674 ) ( not ( = ?auto_11680 ?auto_11677 ) ) ( OBJ-AT ?auto_11675 ?auto_11674 ) ( OBJ-AT ?auto_11676 ?auto_11674 ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11677 ) ) ( not ( = ?auto_11675 ?auto_11680 ) ) ( not ( = ?auto_11676 ?auto_11677 ) ) ( not ( = ?auto_11676 ?auto_11680 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11680 ?auto_11677 ?auto_11674 )
      ( DELIVER-3PKG-VERIFY ?auto_11675 ?auto_11676 ?auto_11677 ?auto_11674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11683 - OBJ
      ?auto_11684 - OBJ
      ?auto_11685 - OBJ
      ?auto_11682 - LOCATION
    )
    :vars
    (
      ?auto_11688 - TRUCK
      ?auto_11687 - LOCATION
      ?auto_11686 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11684 ?auto_11688 ) ( TRUCK-AT ?auto_11688 ?auto_11687 ) ( IN-CITY ?auto_11687 ?auto_11686 ) ( IN-CITY ?auto_11682 ?auto_11686 ) ( not ( = ?auto_11682 ?auto_11687 ) ) ( OBJ-AT ?auto_11685 ?auto_11682 ) ( not ( = ?auto_11685 ?auto_11684 ) ) ( OBJ-AT ?auto_11683 ?auto_11682 ) ( not ( = ?auto_11683 ?auto_11684 ) ) ( not ( = ?auto_11683 ?auto_11685 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11685 ?auto_11684 ?auto_11682 )
      ( DELIVER-3PKG-VERIFY ?auto_11683 ?auto_11684 ?auto_11685 ?auto_11682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11690 - OBJ
      ?auto_11691 - OBJ
      ?auto_11692 - OBJ
      ?auto_11689 - LOCATION
    )
    :vars
    (
      ?auto_11696 - TRUCK
      ?auto_11694 - LOCATION
      ?auto_11693 - CITY
      ?auto_11695 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11691 ?auto_11696 ) ( TRUCK-AT ?auto_11696 ?auto_11694 ) ( IN-CITY ?auto_11694 ?auto_11693 ) ( IN-CITY ?auto_11689 ?auto_11693 ) ( not ( = ?auto_11689 ?auto_11694 ) ) ( OBJ-AT ?auto_11695 ?auto_11689 ) ( not ( = ?auto_11695 ?auto_11691 ) ) ( OBJ-AT ?auto_11690 ?auto_11689 ) ( OBJ-AT ?auto_11692 ?auto_11689 ) ( not ( = ?auto_11690 ?auto_11691 ) ) ( not ( = ?auto_11690 ?auto_11692 ) ) ( not ( = ?auto_11690 ?auto_11695 ) ) ( not ( = ?auto_11691 ?auto_11692 ) ) ( not ( = ?auto_11692 ?auto_11695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11695 ?auto_11691 ?auto_11689 )
      ( DELIVER-3PKG-VERIFY ?auto_11690 ?auto_11691 ?auto_11692 ?auto_11689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11706 - OBJ
      ?auto_11707 - OBJ
      ?auto_11708 - OBJ
      ?auto_11705 - LOCATION
    )
    :vars
    (
      ?auto_11711 - TRUCK
      ?auto_11710 - LOCATION
      ?auto_11709 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11706 ?auto_11711 ) ( TRUCK-AT ?auto_11711 ?auto_11710 ) ( IN-CITY ?auto_11710 ?auto_11709 ) ( IN-CITY ?auto_11705 ?auto_11709 ) ( not ( = ?auto_11705 ?auto_11710 ) ) ( OBJ-AT ?auto_11708 ?auto_11705 ) ( not ( = ?auto_11708 ?auto_11706 ) ) ( OBJ-AT ?auto_11707 ?auto_11705 ) ( not ( = ?auto_11706 ?auto_11707 ) ) ( not ( = ?auto_11707 ?auto_11708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11708 ?auto_11706 ?auto_11705 )
      ( DELIVER-3PKG-VERIFY ?auto_11706 ?auto_11707 ?auto_11708 ?auto_11705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11713 - OBJ
      ?auto_11714 - OBJ
      ?auto_11715 - OBJ
      ?auto_11712 - LOCATION
    )
    :vars
    (
      ?auto_11718 - TRUCK
      ?auto_11717 - LOCATION
      ?auto_11716 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11713 ?auto_11718 ) ( TRUCK-AT ?auto_11718 ?auto_11717 ) ( IN-CITY ?auto_11717 ?auto_11716 ) ( IN-CITY ?auto_11712 ?auto_11716 ) ( not ( = ?auto_11712 ?auto_11717 ) ) ( OBJ-AT ?auto_11714 ?auto_11712 ) ( not ( = ?auto_11714 ?auto_11713 ) ) ( OBJ-AT ?auto_11715 ?auto_11712 ) ( not ( = ?auto_11713 ?auto_11715 ) ) ( not ( = ?auto_11714 ?auto_11715 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11714 ?auto_11713 ?auto_11712 )
      ( DELIVER-3PKG-VERIFY ?auto_11713 ?auto_11714 ?auto_11715 ?auto_11712 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11727 - OBJ
      ?auto_11728 - OBJ
      ?auto_11729 - OBJ
      ?auto_11726 - LOCATION
    )
    :vars
    (
      ?auto_11732 - TRUCK
      ?auto_11731 - LOCATION
      ?auto_11730 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11727 ?auto_11732 ) ( TRUCK-AT ?auto_11732 ?auto_11731 ) ( IN-CITY ?auto_11731 ?auto_11730 ) ( IN-CITY ?auto_11726 ?auto_11730 ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( OBJ-AT ?auto_11729 ?auto_11726 ) ( not ( = ?auto_11729 ?auto_11727 ) ) ( OBJ-AT ?auto_11728 ?auto_11726 ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11728 ?auto_11729 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11729 ?auto_11727 ?auto_11726 )
      ( DELIVER-3PKG-VERIFY ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11726 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11734 - OBJ
      ?auto_11735 - OBJ
      ?auto_11736 - OBJ
      ?auto_11733 - LOCATION
    )
    :vars
    (
      ?auto_11740 - TRUCK
      ?auto_11738 - LOCATION
      ?auto_11737 - CITY
      ?auto_11739 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_11734 ?auto_11740 ) ( TRUCK-AT ?auto_11740 ?auto_11738 ) ( IN-CITY ?auto_11738 ?auto_11737 ) ( IN-CITY ?auto_11733 ?auto_11737 ) ( not ( = ?auto_11733 ?auto_11738 ) ) ( OBJ-AT ?auto_11739 ?auto_11733 ) ( not ( = ?auto_11739 ?auto_11734 ) ) ( OBJ-AT ?auto_11735 ?auto_11733 ) ( OBJ-AT ?auto_11736 ?auto_11733 ) ( not ( = ?auto_11734 ?auto_11735 ) ) ( not ( = ?auto_11734 ?auto_11736 ) ) ( not ( = ?auto_11735 ?auto_11736 ) ) ( not ( = ?auto_11735 ?auto_11739 ) ) ( not ( = ?auto_11736 ?auto_11739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11739 ?auto_11734 ?auto_11733 )
      ( DELIVER-3PKG-VERIFY ?auto_11734 ?auto_11735 ?auto_11736 ?auto_11733 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11773 - OBJ
      ?auto_11772 - LOCATION
    )
    :vars
    (
      ?auto_11777 - TRUCK
      ?auto_11775 - LOCATION
      ?auto_11774 - CITY
      ?auto_11776 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11777 ?auto_11775 ) ( IN-CITY ?auto_11775 ?auto_11774 ) ( IN-CITY ?auto_11772 ?auto_11774 ) ( not ( = ?auto_11772 ?auto_11775 ) ) ( OBJ-AT ?auto_11776 ?auto_11772 ) ( not ( = ?auto_11776 ?auto_11773 ) ) ( OBJ-AT ?auto_11773 ?auto_11775 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_11773 ?auto_11777 ?auto_11775 )
      ( DELIVER-2PKG ?auto_11776 ?auto_11773 ?auto_11772 )
      ( DELIVER-1PKG-VERIFY ?auto_11773 ?auto_11772 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11779 - OBJ
      ?auto_11780 - OBJ
      ?auto_11778 - LOCATION
    )
    :vars
    (
      ?auto_11782 - TRUCK
      ?auto_11783 - LOCATION
      ?auto_11781 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11782 ?auto_11783 ) ( IN-CITY ?auto_11783 ?auto_11781 ) ( IN-CITY ?auto_11778 ?auto_11781 ) ( not ( = ?auto_11778 ?auto_11783 ) ) ( OBJ-AT ?auto_11779 ?auto_11778 ) ( not ( = ?auto_11779 ?auto_11780 ) ) ( OBJ-AT ?auto_11780 ?auto_11783 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11780 ?auto_11778 )
      ( DELIVER-2PKG-VERIFY ?auto_11779 ?auto_11780 ?auto_11778 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11785 - OBJ
      ?auto_11786 - OBJ
      ?auto_11784 - LOCATION
    )
    :vars
    (
      ?auto_11789 - TRUCK
      ?auto_11790 - LOCATION
      ?auto_11787 - CITY
      ?auto_11788 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11789 ?auto_11790 ) ( IN-CITY ?auto_11790 ?auto_11787 ) ( IN-CITY ?auto_11784 ?auto_11787 ) ( not ( = ?auto_11784 ?auto_11790 ) ) ( OBJ-AT ?auto_11788 ?auto_11784 ) ( not ( = ?auto_11788 ?auto_11786 ) ) ( OBJ-AT ?auto_11786 ?auto_11790 ) ( OBJ-AT ?auto_11785 ?auto_11784 ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11788 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11788 ?auto_11786 ?auto_11784 )
      ( DELIVER-2PKG-VERIFY ?auto_11785 ?auto_11786 ?auto_11784 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11792 - OBJ
      ?auto_11793 - OBJ
      ?auto_11791 - LOCATION
    )
    :vars
    (
      ?auto_11795 - TRUCK
      ?auto_11796 - LOCATION
      ?auto_11794 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11795 ?auto_11796 ) ( IN-CITY ?auto_11796 ?auto_11794 ) ( IN-CITY ?auto_11791 ?auto_11794 ) ( not ( = ?auto_11791 ?auto_11796 ) ) ( OBJ-AT ?auto_11793 ?auto_11791 ) ( not ( = ?auto_11793 ?auto_11792 ) ) ( OBJ-AT ?auto_11792 ?auto_11796 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11793 ?auto_11792 ?auto_11791 )
      ( DELIVER-2PKG-VERIFY ?auto_11792 ?auto_11793 ?auto_11791 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11798 - OBJ
      ?auto_11799 - OBJ
      ?auto_11797 - LOCATION
    )
    :vars
    (
      ?auto_11802 - TRUCK
      ?auto_11803 - LOCATION
      ?auto_11800 - CITY
      ?auto_11801 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11802 ?auto_11803 ) ( IN-CITY ?auto_11803 ?auto_11800 ) ( IN-CITY ?auto_11797 ?auto_11800 ) ( not ( = ?auto_11797 ?auto_11803 ) ) ( OBJ-AT ?auto_11801 ?auto_11797 ) ( not ( = ?auto_11801 ?auto_11798 ) ) ( OBJ-AT ?auto_11798 ?auto_11803 ) ( OBJ-AT ?auto_11799 ?auto_11797 ) ( not ( = ?auto_11798 ?auto_11799 ) ) ( not ( = ?auto_11799 ?auto_11801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11801 ?auto_11798 ?auto_11797 )
      ( DELIVER-2PKG-VERIFY ?auto_11798 ?auto_11799 ?auto_11797 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11812 - OBJ
      ?auto_11813 - OBJ
      ?auto_11814 - OBJ
      ?auto_11811 - LOCATION
    )
    :vars
    (
      ?auto_11816 - TRUCK
      ?auto_11817 - LOCATION
      ?auto_11815 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11816 ?auto_11817 ) ( IN-CITY ?auto_11817 ?auto_11815 ) ( IN-CITY ?auto_11811 ?auto_11815 ) ( not ( = ?auto_11811 ?auto_11817 ) ) ( OBJ-AT ?auto_11813 ?auto_11811 ) ( not ( = ?auto_11813 ?auto_11814 ) ) ( OBJ-AT ?auto_11814 ?auto_11817 ) ( OBJ-AT ?auto_11812 ?auto_11811 ) ( not ( = ?auto_11812 ?auto_11813 ) ) ( not ( = ?auto_11812 ?auto_11814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11813 ?auto_11814 ?auto_11811 )
      ( DELIVER-3PKG-VERIFY ?auto_11812 ?auto_11813 ?auto_11814 ?auto_11811 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11819 - OBJ
      ?auto_11820 - OBJ
      ?auto_11821 - OBJ
      ?auto_11818 - LOCATION
    )
    :vars
    (
      ?auto_11823 - TRUCK
      ?auto_11824 - LOCATION
      ?auto_11822 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11823 ?auto_11824 ) ( IN-CITY ?auto_11824 ?auto_11822 ) ( IN-CITY ?auto_11818 ?auto_11822 ) ( not ( = ?auto_11818 ?auto_11824 ) ) ( OBJ-AT ?auto_11819 ?auto_11818 ) ( not ( = ?auto_11819 ?auto_11821 ) ) ( OBJ-AT ?auto_11821 ?auto_11824 ) ( OBJ-AT ?auto_11820 ?auto_11818 ) ( not ( = ?auto_11819 ?auto_11820 ) ) ( not ( = ?auto_11820 ?auto_11821 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11819 ?auto_11821 ?auto_11818 )
      ( DELIVER-3PKG-VERIFY ?auto_11819 ?auto_11820 ?auto_11821 ?auto_11818 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11826 - OBJ
      ?auto_11827 - OBJ
      ?auto_11828 - OBJ
      ?auto_11825 - LOCATION
    )
    :vars
    (
      ?auto_11830 - TRUCK
      ?auto_11831 - LOCATION
      ?auto_11829 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11830 ?auto_11831 ) ( IN-CITY ?auto_11831 ?auto_11829 ) ( IN-CITY ?auto_11825 ?auto_11829 ) ( not ( = ?auto_11825 ?auto_11831 ) ) ( OBJ-AT ?auto_11828 ?auto_11825 ) ( not ( = ?auto_11828 ?auto_11827 ) ) ( OBJ-AT ?auto_11827 ?auto_11831 ) ( OBJ-AT ?auto_11826 ?auto_11825 ) ( not ( = ?auto_11826 ?auto_11827 ) ) ( not ( = ?auto_11826 ?auto_11828 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11828 ?auto_11827 ?auto_11825 )
      ( DELIVER-3PKG-VERIFY ?auto_11826 ?auto_11827 ?auto_11828 ?auto_11825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11833 - OBJ
      ?auto_11834 - OBJ
      ?auto_11835 - OBJ
      ?auto_11832 - LOCATION
    )
    :vars
    (
      ?auto_11837 - TRUCK
      ?auto_11838 - LOCATION
      ?auto_11836 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11837 ?auto_11838 ) ( IN-CITY ?auto_11838 ?auto_11836 ) ( IN-CITY ?auto_11832 ?auto_11836 ) ( not ( = ?auto_11832 ?auto_11838 ) ) ( OBJ-AT ?auto_11833 ?auto_11832 ) ( not ( = ?auto_11833 ?auto_11834 ) ) ( OBJ-AT ?auto_11834 ?auto_11838 ) ( OBJ-AT ?auto_11835 ?auto_11832 ) ( not ( = ?auto_11833 ?auto_11835 ) ) ( not ( = ?auto_11834 ?auto_11835 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11833 ?auto_11834 ?auto_11832 )
      ( DELIVER-3PKG-VERIFY ?auto_11833 ?auto_11834 ?auto_11835 ?auto_11832 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11847 - OBJ
      ?auto_11848 - OBJ
      ?auto_11849 - OBJ
      ?auto_11846 - LOCATION
    )
    :vars
    (
      ?auto_11851 - TRUCK
      ?auto_11852 - LOCATION
      ?auto_11850 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11851 ?auto_11852 ) ( IN-CITY ?auto_11852 ?auto_11850 ) ( IN-CITY ?auto_11846 ?auto_11850 ) ( not ( = ?auto_11846 ?auto_11852 ) ) ( OBJ-AT ?auto_11848 ?auto_11846 ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( OBJ-AT ?auto_11849 ?auto_11852 ) ( OBJ-AT ?auto_11847 ?auto_11846 ) ( not ( = ?auto_11847 ?auto_11848 ) ) ( not ( = ?auto_11847 ?auto_11849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11848 ?auto_11849 ?auto_11846 )
      ( DELIVER-3PKG-VERIFY ?auto_11847 ?auto_11848 ?auto_11849 ?auto_11846 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11854 - OBJ
      ?auto_11855 - OBJ
      ?auto_11856 - OBJ
      ?auto_11853 - LOCATION
    )
    :vars
    (
      ?auto_11859 - TRUCK
      ?auto_11860 - LOCATION
      ?auto_11857 - CITY
      ?auto_11858 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11859 ?auto_11860 ) ( IN-CITY ?auto_11860 ?auto_11857 ) ( IN-CITY ?auto_11853 ?auto_11857 ) ( not ( = ?auto_11853 ?auto_11860 ) ) ( OBJ-AT ?auto_11858 ?auto_11853 ) ( not ( = ?auto_11858 ?auto_11856 ) ) ( OBJ-AT ?auto_11856 ?auto_11860 ) ( OBJ-AT ?auto_11854 ?auto_11853 ) ( OBJ-AT ?auto_11855 ?auto_11853 ) ( not ( = ?auto_11854 ?auto_11855 ) ) ( not ( = ?auto_11854 ?auto_11856 ) ) ( not ( = ?auto_11854 ?auto_11858 ) ) ( not ( = ?auto_11855 ?auto_11856 ) ) ( not ( = ?auto_11855 ?auto_11858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11858 ?auto_11856 ?auto_11853 )
      ( DELIVER-3PKG-VERIFY ?auto_11854 ?auto_11855 ?auto_11856 ?auto_11853 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11862 - OBJ
      ?auto_11863 - OBJ
      ?auto_11864 - OBJ
      ?auto_11861 - LOCATION
    )
    :vars
    (
      ?auto_11866 - TRUCK
      ?auto_11867 - LOCATION
      ?auto_11865 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11866 ?auto_11867 ) ( IN-CITY ?auto_11867 ?auto_11865 ) ( IN-CITY ?auto_11861 ?auto_11865 ) ( not ( = ?auto_11861 ?auto_11867 ) ) ( OBJ-AT ?auto_11864 ?auto_11861 ) ( not ( = ?auto_11864 ?auto_11863 ) ) ( OBJ-AT ?auto_11863 ?auto_11867 ) ( OBJ-AT ?auto_11862 ?auto_11861 ) ( not ( = ?auto_11862 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11864 ?auto_11863 ?auto_11861 )
      ( DELIVER-3PKG-VERIFY ?auto_11862 ?auto_11863 ?auto_11864 ?auto_11861 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11869 - OBJ
      ?auto_11870 - OBJ
      ?auto_11871 - OBJ
      ?auto_11868 - LOCATION
    )
    :vars
    (
      ?auto_11874 - TRUCK
      ?auto_11875 - LOCATION
      ?auto_11872 - CITY
      ?auto_11873 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11874 ?auto_11875 ) ( IN-CITY ?auto_11875 ?auto_11872 ) ( IN-CITY ?auto_11868 ?auto_11872 ) ( not ( = ?auto_11868 ?auto_11875 ) ) ( OBJ-AT ?auto_11873 ?auto_11868 ) ( not ( = ?auto_11873 ?auto_11870 ) ) ( OBJ-AT ?auto_11870 ?auto_11875 ) ( OBJ-AT ?auto_11869 ?auto_11868 ) ( OBJ-AT ?auto_11871 ?auto_11868 ) ( not ( = ?auto_11869 ?auto_11870 ) ) ( not ( = ?auto_11869 ?auto_11871 ) ) ( not ( = ?auto_11869 ?auto_11873 ) ) ( not ( = ?auto_11870 ?auto_11871 ) ) ( not ( = ?auto_11871 ?auto_11873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11873 ?auto_11870 ?auto_11868 )
      ( DELIVER-3PKG-VERIFY ?auto_11869 ?auto_11870 ?auto_11871 ?auto_11868 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11885 - OBJ
      ?auto_11886 - OBJ
      ?auto_11887 - OBJ
      ?auto_11884 - LOCATION
    )
    :vars
    (
      ?auto_11889 - TRUCK
      ?auto_11890 - LOCATION
      ?auto_11888 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11889 ?auto_11890 ) ( IN-CITY ?auto_11890 ?auto_11888 ) ( IN-CITY ?auto_11884 ?auto_11888 ) ( not ( = ?auto_11884 ?auto_11890 ) ) ( OBJ-AT ?auto_11887 ?auto_11884 ) ( not ( = ?auto_11887 ?auto_11885 ) ) ( OBJ-AT ?auto_11885 ?auto_11890 ) ( OBJ-AT ?auto_11886 ?auto_11884 ) ( not ( = ?auto_11885 ?auto_11886 ) ) ( not ( = ?auto_11886 ?auto_11887 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11887 ?auto_11885 ?auto_11884 )
      ( DELIVER-3PKG-VERIFY ?auto_11885 ?auto_11886 ?auto_11887 ?auto_11884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11892 - OBJ
      ?auto_11893 - OBJ
      ?auto_11894 - OBJ
      ?auto_11891 - LOCATION
    )
    :vars
    (
      ?auto_11896 - TRUCK
      ?auto_11897 - LOCATION
      ?auto_11895 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11896 ?auto_11897 ) ( IN-CITY ?auto_11897 ?auto_11895 ) ( IN-CITY ?auto_11891 ?auto_11895 ) ( not ( = ?auto_11891 ?auto_11897 ) ) ( OBJ-AT ?auto_11893 ?auto_11891 ) ( not ( = ?auto_11893 ?auto_11892 ) ) ( OBJ-AT ?auto_11892 ?auto_11897 ) ( OBJ-AT ?auto_11894 ?auto_11891 ) ( not ( = ?auto_11892 ?auto_11894 ) ) ( not ( = ?auto_11893 ?auto_11894 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11893 ?auto_11892 ?auto_11891 )
      ( DELIVER-3PKG-VERIFY ?auto_11892 ?auto_11893 ?auto_11894 ?auto_11891 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11906 - OBJ
      ?auto_11907 - OBJ
      ?auto_11908 - OBJ
      ?auto_11905 - LOCATION
    )
    :vars
    (
      ?auto_11910 - TRUCK
      ?auto_11911 - LOCATION
      ?auto_11909 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11910 ?auto_11911 ) ( IN-CITY ?auto_11911 ?auto_11909 ) ( IN-CITY ?auto_11905 ?auto_11909 ) ( not ( = ?auto_11905 ?auto_11911 ) ) ( OBJ-AT ?auto_11908 ?auto_11905 ) ( not ( = ?auto_11908 ?auto_11906 ) ) ( OBJ-AT ?auto_11906 ?auto_11911 ) ( OBJ-AT ?auto_11907 ?auto_11905 ) ( not ( = ?auto_11906 ?auto_11907 ) ) ( not ( = ?auto_11907 ?auto_11908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11908 ?auto_11906 ?auto_11905 )
      ( DELIVER-3PKG-VERIFY ?auto_11906 ?auto_11907 ?auto_11908 ?auto_11905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11913 - OBJ
      ?auto_11914 - OBJ
      ?auto_11915 - OBJ
      ?auto_11912 - LOCATION
    )
    :vars
    (
      ?auto_11918 - TRUCK
      ?auto_11919 - LOCATION
      ?auto_11916 - CITY
      ?auto_11917 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_11918 ?auto_11919 ) ( IN-CITY ?auto_11919 ?auto_11916 ) ( IN-CITY ?auto_11912 ?auto_11916 ) ( not ( = ?auto_11912 ?auto_11919 ) ) ( OBJ-AT ?auto_11917 ?auto_11912 ) ( not ( = ?auto_11917 ?auto_11913 ) ) ( OBJ-AT ?auto_11913 ?auto_11919 ) ( OBJ-AT ?auto_11914 ?auto_11912 ) ( OBJ-AT ?auto_11915 ?auto_11912 ) ( not ( = ?auto_11913 ?auto_11914 ) ) ( not ( = ?auto_11913 ?auto_11915 ) ) ( not ( = ?auto_11914 ?auto_11915 ) ) ( not ( = ?auto_11914 ?auto_11917 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11917 ?auto_11913 ?auto_11912 )
      ( DELIVER-3PKG-VERIFY ?auto_11913 ?auto_11914 ?auto_11915 ?auto_11912 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11952 - OBJ
      ?auto_11951 - LOCATION
    )
    :vars
    (
      ?auto_11956 - LOCATION
      ?auto_11953 - CITY
      ?auto_11954 - OBJ
      ?auto_11955 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11956 ?auto_11953 ) ( IN-CITY ?auto_11951 ?auto_11953 ) ( not ( = ?auto_11951 ?auto_11956 ) ) ( OBJ-AT ?auto_11954 ?auto_11951 ) ( not ( = ?auto_11954 ?auto_11952 ) ) ( OBJ-AT ?auto_11952 ?auto_11956 ) ( TRUCK-AT ?auto_11955 ?auto_11951 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11955 ?auto_11951 ?auto_11956 ?auto_11953 )
      ( DELIVER-2PKG ?auto_11954 ?auto_11952 ?auto_11951 )
      ( DELIVER-1PKG-VERIFY ?auto_11952 ?auto_11951 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11958 - OBJ
      ?auto_11959 - OBJ
      ?auto_11957 - LOCATION
    )
    :vars
    (
      ?auto_11960 - LOCATION
      ?auto_11962 - CITY
      ?auto_11961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11960 ?auto_11962 ) ( IN-CITY ?auto_11957 ?auto_11962 ) ( not ( = ?auto_11957 ?auto_11960 ) ) ( OBJ-AT ?auto_11958 ?auto_11957 ) ( not ( = ?auto_11958 ?auto_11959 ) ) ( OBJ-AT ?auto_11959 ?auto_11960 ) ( TRUCK-AT ?auto_11961 ?auto_11957 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11959 ?auto_11957 )
      ( DELIVER-2PKG-VERIFY ?auto_11958 ?auto_11959 ?auto_11957 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11964 - OBJ
      ?auto_11965 - OBJ
      ?auto_11963 - LOCATION
    )
    :vars
    (
      ?auto_11966 - LOCATION
      ?auto_11967 - CITY
      ?auto_11969 - OBJ
      ?auto_11968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11966 ?auto_11967 ) ( IN-CITY ?auto_11963 ?auto_11967 ) ( not ( = ?auto_11963 ?auto_11966 ) ) ( OBJ-AT ?auto_11969 ?auto_11963 ) ( not ( = ?auto_11969 ?auto_11965 ) ) ( OBJ-AT ?auto_11965 ?auto_11966 ) ( TRUCK-AT ?auto_11968 ?auto_11963 ) ( OBJ-AT ?auto_11964 ?auto_11963 ) ( not ( = ?auto_11964 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11969 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11969 ?auto_11965 ?auto_11963 )
      ( DELIVER-2PKG-VERIFY ?auto_11964 ?auto_11965 ?auto_11963 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11971 - OBJ
      ?auto_11972 - OBJ
      ?auto_11970 - LOCATION
    )
    :vars
    (
      ?auto_11973 - LOCATION
      ?auto_11974 - CITY
      ?auto_11975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11973 ?auto_11974 ) ( IN-CITY ?auto_11970 ?auto_11974 ) ( not ( = ?auto_11970 ?auto_11973 ) ) ( OBJ-AT ?auto_11972 ?auto_11970 ) ( not ( = ?auto_11972 ?auto_11971 ) ) ( OBJ-AT ?auto_11971 ?auto_11973 ) ( TRUCK-AT ?auto_11975 ?auto_11970 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11972 ?auto_11971 ?auto_11970 )
      ( DELIVER-2PKG-VERIFY ?auto_11971 ?auto_11972 ?auto_11970 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11977 - OBJ
      ?auto_11978 - OBJ
      ?auto_11976 - LOCATION
    )
    :vars
    (
      ?auto_11979 - LOCATION
      ?auto_11980 - CITY
      ?auto_11982 - OBJ
      ?auto_11981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11979 ?auto_11980 ) ( IN-CITY ?auto_11976 ?auto_11980 ) ( not ( = ?auto_11976 ?auto_11979 ) ) ( OBJ-AT ?auto_11982 ?auto_11976 ) ( not ( = ?auto_11982 ?auto_11977 ) ) ( OBJ-AT ?auto_11977 ?auto_11979 ) ( TRUCK-AT ?auto_11981 ?auto_11976 ) ( OBJ-AT ?auto_11978 ?auto_11976 ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( not ( = ?auto_11978 ?auto_11982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11982 ?auto_11977 ?auto_11976 )
      ( DELIVER-2PKG-VERIFY ?auto_11977 ?auto_11978 ?auto_11976 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11991 - OBJ
      ?auto_11992 - OBJ
      ?auto_11993 - OBJ
      ?auto_11990 - LOCATION
    )
    :vars
    (
      ?auto_11994 - LOCATION
      ?auto_11995 - CITY
      ?auto_11996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11994 ?auto_11995 ) ( IN-CITY ?auto_11990 ?auto_11995 ) ( not ( = ?auto_11990 ?auto_11994 ) ) ( OBJ-AT ?auto_11992 ?auto_11990 ) ( not ( = ?auto_11992 ?auto_11993 ) ) ( OBJ-AT ?auto_11993 ?auto_11994 ) ( TRUCK-AT ?auto_11996 ?auto_11990 ) ( OBJ-AT ?auto_11991 ?auto_11990 ) ( not ( = ?auto_11991 ?auto_11992 ) ) ( not ( = ?auto_11991 ?auto_11993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11992 ?auto_11993 ?auto_11990 )
      ( DELIVER-3PKG-VERIFY ?auto_11991 ?auto_11992 ?auto_11993 ?auto_11990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11998 - OBJ
      ?auto_11999 - OBJ
      ?auto_12000 - OBJ
      ?auto_11997 - LOCATION
    )
    :vars
    (
      ?auto_12001 - LOCATION
      ?auto_12002 - CITY
      ?auto_12003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12001 ?auto_12002 ) ( IN-CITY ?auto_11997 ?auto_12002 ) ( not ( = ?auto_11997 ?auto_12001 ) ) ( OBJ-AT ?auto_11998 ?auto_11997 ) ( not ( = ?auto_11998 ?auto_12000 ) ) ( OBJ-AT ?auto_12000 ?auto_12001 ) ( TRUCK-AT ?auto_12003 ?auto_11997 ) ( OBJ-AT ?auto_11999 ?auto_11997 ) ( not ( = ?auto_11998 ?auto_11999 ) ) ( not ( = ?auto_11999 ?auto_12000 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11998 ?auto_12000 ?auto_11997 )
      ( DELIVER-3PKG-VERIFY ?auto_11998 ?auto_11999 ?auto_12000 ?auto_11997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12005 - OBJ
      ?auto_12006 - OBJ
      ?auto_12007 - OBJ
      ?auto_12004 - LOCATION
    )
    :vars
    (
      ?auto_12008 - LOCATION
      ?auto_12009 - CITY
      ?auto_12010 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12008 ?auto_12009 ) ( IN-CITY ?auto_12004 ?auto_12009 ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( OBJ-AT ?auto_12007 ?auto_12004 ) ( not ( = ?auto_12007 ?auto_12006 ) ) ( OBJ-AT ?auto_12006 ?auto_12008 ) ( TRUCK-AT ?auto_12010 ?auto_12004 ) ( OBJ-AT ?auto_12005 ?auto_12004 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12005 ?auto_12007 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12007 ?auto_12006 ?auto_12004 )
      ( DELIVER-3PKG-VERIFY ?auto_12005 ?auto_12006 ?auto_12007 ?auto_12004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12012 - OBJ
      ?auto_12013 - OBJ
      ?auto_12014 - OBJ
      ?auto_12011 - LOCATION
    )
    :vars
    (
      ?auto_12015 - LOCATION
      ?auto_12016 - CITY
      ?auto_12017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12015 ?auto_12016 ) ( IN-CITY ?auto_12011 ?auto_12016 ) ( not ( = ?auto_12011 ?auto_12015 ) ) ( OBJ-AT ?auto_12012 ?auto_12011 ) ( not ( = ?auto_12012 ?auto_12013 ) ) ( OBJ-AT ?auto_12013 ?auto_12015 ) ( TRUCK-AT ?auto_12017 ?auto_12011 ) ( OBJ-AT ?auto_12014 ?auto_12011 ) ( not ( = ?auto_12012 ?auto_12014 ) ) ( not ( = ?auto_12013 ?auto_12014 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12012 ?auto_12013 ?auto_12011 )
      ( DELIVER-3PKG-VERIFY ?auto_12012 ?auto_12013 ?auto_12014 ?auto_12011 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12026 - OBJ
      ?auto_12027 - OBJ
      ?auto_12028 - OBJ
      ?auto_12025 - LOCATION
    )
    :vars
    (
      ?auto_12029 - LOCATION
      ?auto_12030 - CITY
      ?auto_12031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12029 ?auto_12030 ) ( IN-CITY ?auto_12025 ?auto_12030 ) ( not ( = ?auto_12025 ?auto_12029 ) ) ( OBJ-AT ?auto_12027 ?auto_12025 ) ( not ( = ?auto_12027 ?auto_12028 ) ) ( OBJ-AT ?auto_12028 ?auto_12029 ) ( TRUCK-AT ?auto_12031 ?auto_12025 ) ( OBJ-AT ?auto_12026 ?auto_12025 ) ( not ( = ?auto_12026 ?auto_12027 ) ) ( not ( = ?auto_12026 ?auto_12028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12027 ?auto_12028 ?auto_12025 )
      ( DELIVER-3PKG-VERIFY ?auto_12026 ?auto_12027 ?auto_12028 ?auto_12025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12033 - OBJ
      ?auto_12034 - OBJ
      ?auto_12035 - OBJ
      ?auto_12032 - LOCATION
    )
    :vars
    (
      ?auto_12036 - LOCATION
      ?auto_12037 - CITY
      ?auto_12039 - OBJ
      ?auto_12038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12036 ?auto_12037 ) ( IN-CITY ?auto_12032 ?auto_12037 ) ( not ( = ?auto_12032 ?auto_12036 ) ) ( OBJ-AT ?auto_12039 ?auto_12032 ) ( not ( = ?auto_12039 ?auto_12035 ) ) ( OBJ-AT ?auto_12035 ?auto_12036 ) ( TRUCK-AT ?auto_12038 ?auto_12032 ) ( OBJ-AT ?auto_12033 ?auto_12032 ) ( OBJ-AT ?auto_12034 ?auto_12032 ) ( not ( = ?auto_12033 ?auto_12034 ) ) ( not ( = ?auto_12033 ?auto_12035 ) ) ( not ( = ?auto_12033 ?auto_12039 ) ) ( not ( = ?auto_12034 ?auto_12035 ) ) ( not ( = ?auto_12034 ?auto_12039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12039 ?auto_12035 ?auto_12032 )
      ( DELIVER-3PKG-VERIFY ?auto_12033 ?auto_12034 ?auto_12035 ?auto_12032 ) )
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
      ?auto_12044 - LOCATION
      ?auto_12045 - CITY
      ?auto_12046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12044 ?auto_12045 ) ( IN-CITY ?auto_12040 ?auto_12045 ) ( not ( = ?auto_12040 ?auto_12044 ) ) ( OBJ-AT ?auto_12043 ?auto_12040 ) ( not ( = ?auto_12043 ?auto_12042 ) ) ( OBJ-AT ?auto_12042 ?auto_12044 ) ( TRUCK-AT ?auto_12046 ?auto_12040 ) ( OBJ-AT ?auto_12041 ?auto_12040 ) ( not ( = ?auto_12041 ?auto_12042 ) ) ( not ( = ?auto_12041 ?auto_12043 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12043 ?auto_12042 ?auto_12040 )
      ( DELIVER-3PKG-VERIFY ?auto_12041 ?auto_12042 ?auto_12043 ?auto_12040 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12048 - OBJ
      ?auto_12049 - OBJ
      ?auto_12050 - OBJ
      ?auto_12047 - LOCATION
    )
    :vars
    (
      ?auto_12051 - LOCATION
      ?auto_12052 - CITY
      ?auto_12054 - OBJ
      ?auto_12053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12051 ?auto_12052 ) ( IN-CITY ?auto_12047 ?auto_12052 ) ( not ( = ?auto_12047 ?auto_12051 ) ) ( OBJ-AT ?auto_12054 ?auto_12047 ) ( not ( = ?auto_12054 ?auto_12049 ) ) ( OBJ-AT ?auto_12049 ?auto_12051 ) ( TRUCK-AT ?auto_12053 ?auto_12047 ) ( OBJ-AT ?auto_12048 ?auto_12047 ) ( OBJ-AT ?auto_12050 ?auto_12047 ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( not ( = ?auto_12048 ?auto_12050 ) ) ( not ( = ?auto_12048 ?auto_12054 ) ) ( not ( = ?auto_12049 ?auto_12050 ) ) ( not ( = ?auto_12050 ?auto_12054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12054 ?auto_12049 ?auto_12047 )
      ( DELIVER-3PKG-VERIFY ?auto_12048 ?auto_12049 ?auto_12050 ?auto_12047 ) )
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
      ?auto_12067 - LOCATION
      ?auto_12068 - CITY
      ?auto_12069 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12067 ?auto_12068 ) ( IN-CITY ?auto_12063 ?auto_12068 ) ( not ( = ?auto_12063 ?auto_12067 ) ) ( OBJ-AT ?auto_12065 ?auto_12063 ) ( not ( = ?auto_12065 ?auto_12064 ) ) ( OBJ-AT ?auto_12064 ?auto_12067 ) ( TRUCK-AT ?auto_12069 ?auto_12063 ) ( OBJ-AT ?auto_12066 ?auto_12063 ) ( not ( = ?auto_12064 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12065 ?auto_12064 ?auto_12063 )
      ( DELIVER-3PKG-VERIFY ?auto_12064 ?auto_12065 ?auto_12066 ?auto_12063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12071 - OBJ
      ?auto_12072 - OBJ
      ?auto_12073 - OBJ
      ?auto_12070 - LOCATION
    )
    :vars
    (
      ?auto_12074 - LOCATION
      ?auto_12075 - CITY
      ?auto_12076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12074 ?auto_12075 ) ( IN-CITY ?auto_12070 ?auto_12075 ) ( not ( = ?auto_12070 ?auto_12074 ) ) ( OBJ-AT ?auto_12072 ?auto_12070 ) ( not ( = ?auto_12072 ?auto_12071 ) ) ( OBJ-AT ?auto_12071 ?auto_12074 ) ( TRUCK-AT ?auto_12076 ?auto_12070 ) ( OBJ-AT ?auto_12073 ?auto_12070 ) ( not ( = ?auto_12071 ?auto_12073 ) ) ( not ( = ?auto_12072 ?auto_12073 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12072 ?auto_12071 ?auto_12070 )
      ( DELIVER-3PKG-VERIFY ?auto_12071 ?auto_12072 ?auto_12073 ?auto_12070 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12085 - OBJ
      ?auto_12086 - OBJ
      ?auto_12087 - OBJ
      ?auto_12084 - LOCATION
    )
    :vars
    (
      ?auto_12088 - LOCATION
      ?auto_12089 - CITY
      ?auto_12090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12088 ?auto_12089 ) ( IN-CITY ?auto_12084 ?auto_12089 ) ( not ( = ?auto_12084 ?auto_12088 ) ) ( OBJ-AT ?auto_12087 ?auto_12084 ) ( not ( = ?auto_12087 ?auto_12085 ) ) ( OBJ-AT ?auto_12085 ?auto_12088 ) ( TRUCK-AT ?auto_12090 ?auto_12084 ) ( OBJ-AT ?auto_12086 ?auto_12084 ) ( not ( = ?auto_12085 ?auto_12086 ) ) ( not ( = ?auto_12086 ?auto_12087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12087 ?auto_12085 ?auto_12084 )
      ( DELIVER-3PKG-VERIFY ?auto_12085 ?auto_12086 ?auto_12087 ?auto_12084 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12092 - OBJ
      ?auto_12093 - OBJ
      ?auto_12094 - OBJ
      ?auto_12091 - LOCATION
    )
    :vars
    (
      ?auto_12095 - LOCATION
      ?auto_12096 - CITY
      ?auto_12098 - OBJ
      ?auto_12097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12095 ?auto_12096 ) ( IN-CITY ?auto_12091 ?auto_12096 ) ( not ( = ?auto_12091 ?auto_12095 ) ) ( OBJ-AT ?auto_12098 ?auto_12091 ) ( not ( = ?auto_12098 ?auto_12092 ) ) ( OBJ-AT ?auto_12092 ?auto_12095 ) ( TRUCK-AT ?auto_12097 ?auto_12091 ) ( OBJ-AT ?auto_12093 ?auto_12091 ) ( OBJ-AT ?auto_12094 ?auto_12091 ) ( not ( = ?auto_12092 ?auto_12093 ) ) ( not ( = ?auto_12092 ?auto_12094 ) ) ( not ( = ?auto_12093 ?auto_12094 ) ) ( not ( = ?auto_12093 ?auto_12098 ) ) ( not ( = ?auto_12094 ?auto_12098 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12098 ?auto_12092 ?auto_12091 )
      ( DELIVER-3PKG-VERIFY ?auto_12092 ?auto_12093 ?auto_12094 ?auto_12091 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12131 - OBJ
      ?auto_12130 - LOCATION
    )
    :vars
    (
      ?auto_12132 - LOCATION
      ?auto_12133 - CITY
      ?auto_12135 - OBJ
      ?auto_12134 - TRUCK
      ?auto_12136 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12132 ?auto_12133 ) ( IN-CITY ?auto_12130 ?auto_12133 ) ( not ( = ?auto_12130 ?auto_12132 ) ) ( OBJ-AT ?auto_12135 ?auto_12130 ) ( not ( = ?auto_12135 ?auto_12131 ) ) ( OBJ-AT ?auto_12131 ?auto_12132 ) ( TRUCK-AT ?auto_12134 ?auto_12130 ) ( IN-TRUCK ?auto_12136 ?auto_12134 ) ( not ( = ?auto_12135 ?auto_12136 ) ) ( not ( = ?auto_12131 ?auto_12136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12135 ?auto_12136 ?auto_12130 )
      ( DELIVER-2PKG ?auto_12135 ?auto_12131 ?auto_12130 )
      ( DELIVER-1PKG-VERIFY ?auto_12131 ?auto_12130 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12138 - OBJ
      ?auto_12139 - OBJ
      ?auto_12137 - LOCATION
    )
    :vars
    (
      ?auto_12142 - LOCATION
      ?auto_12140 - CITY
      ?auto_12141 - TRUCK
      ?auto_12143 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12142 ?auto_12140 ) ( IN-CITY ?auto_12137 ?auto_12140 ) ( not ( = ?auto_12137 ?auto_12142 ) ) ( OBJ-AT ?auto_12138 ?auto_12137 ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( OBJ-AT ?auto_12139 ?auto_12142 ) ( TRUCK-AT ?auto_12141 ?auto_12137 ) ( IN-TRUCK ?auto_12143 ?auto_12141 ) ( not ( = ?auto_12138 ?auto_12143 ) ) ( not ( = ?auto_12139 ?auto_12143 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12139 ?auto_12137 )
      ( DELIVER-2PKG-VERIFY ?auto_12138 ?auto_12139 ?auto_12137 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12145 - OBJ
      ?auto_12146 - OBJ
      ?auto_12144 - LOCATION
    )
    :vars
    (
      ?auto_12147 - LOCATION
      ?auto_12149 - CITY
      ?auto_12148 - OBJ
      ?auto_12150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12147 ?auto_12149 ) ( IN-CITY ?auto_12144 ?auto_12149 ) ( not ( = ?auto_12144 ?auto_12147 ) ) ( OBJ-AT ?auto_12148 ?auto_12144 ) ( not ( = ?auto_12148 ?auto_12146 ) ) ( OBJ-AT ?auto_12146 ?auto_12147 ) ( TRUCK-AT ?auto_12150 ?auto_12144 ) ( IN-TRUCK ?auto_12145 ?auto_12150 ) ( not ( = ?auto_12148 ?auto_12145 ) ) ( not ( = ?auto_12146 ?auto_12145 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12148 ?auto_12146 ?auto_12144 )
      ( DELIVER-2PKG-VERIFY ?auto_12145 ?auto_12146 ?auto_12144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12152 - OBJ
      ?auto_12153 - OBJ
      ?auto_12151 - LOCATION
    )
    :vars
    (
      ?auto_12154 - LOCATION
      ?auto_12155 - CITY
      ?auto_12156 - TRUCK
      ?auto_12157 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12154 ?auto_12155 ) ( IN-CITY ?auto_12151 ?auto_12155 ) ( not ( = ?auto_12151 ?auto_12154 ) ) ( OBJ-AT ?auto_12153 ?auto_12151 ) ( not ( = ?auto_12153 ?auto_12152 ) ) ( OBJ-AT ?auto_12152 ?auto_12154 ) ( TRUCK-AT ?auto_12156 ?auto_12151 ) ( IN-TRUCK ?auto_12157 ?auto_12156 ) ( not ( = ?auto_12153 ?auto_12157 ) ) ( not ( = ?auto_12152 ?auto_12157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12153 ?auto_12152 ?auto_12151 )
      ( DELIVER-2PKG-VERIFY ?auto_12152 ?auto_12153 ?auto_12151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12159 - OBJ
      ?auto_12160 - OBJ
      ?auto_12158 - LOCATION
    )
    :vars
    (
      ?auto_12161 - LOCATION
      ?auto_12163 - CITY
      ?auto_12162 - OBJ
      ?auto_12164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12161 ?auto_12163 ) ( IN-CITY ?auto_12158 ?auto_12163 ) ( not ( = ?auto_12158 ?auto_12161 ) ) ( OBJ-AT ?auto_12162 ?auto_12158 ) ( not ( = ?auto_12162 ?auto_12159 ) ) ( OBJ-AT ?auto_12159 ?auto_12161 ) ( TRUCK-AT ?auto_12164 ?auto_12158 ) ( IN-TRUCK ?auto_12160 ?auto_12164 ) ( not ( = ?auto_12162 ?auto_12160 ) ) ( not ( = ?auto_12159 ?auto_12160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12162 ?auto_12159 ?auto_12158 )
      ( DELIVER-2PKG-VERIFY ?auto_12159 ?auto_12160 ?auto_12158 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12174 - OBJ
      ?auto_12175 - OBJ
      ?auto_12176 - OBJ
      ?auto_12173 - LOCATION
    )
    :vars
    (
      ?auto_12177 - LOCATION
      ?auto_12178 - CITY
      ?auto_12179 - TRUCK
      ?auto_12180 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12177 ?auto_12178 ) ( IN-CITY ?auto_12173 ?auto_12178 ) ( not ( = ?auto_12173 ?auto_12177 ) ) ( OBJ-AT ?auto_12174 ?auto_12173 ) ( not ( = ?auto_12174 ?auto_12176 ) ) ( OBJ-AT ?auto_12176 ?auto_12177 ) ( TRUCK-AT ?auto_12179 ?auto_12173 ) ( IN-TRUCK ?auto_12180 ?auto_12179 ) ( not ( = ?auto_12174 ?auto_12180 ) ) ( not ( = ?auto_12176 ?auto_12180 ) ) ( OBJ-AT ?auto_12175 ?auto_12173 ) ( not ( = ?auto_12174 ?auto_12175 ) ) ( not ( = ?auto_12175 ?auto_12176 ) ) ( not ( = ?auto_12175 ?auto_12180 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12174 ?auto_12176 ?auto_12173 )
      ( DELIVER-3PKG-VERIFY ?auto_12174 ?auto_12175 ?auto_12176 ?auto_12173 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12182 - OBJ
      ?auto_12183 - OBJ
      ?auto_12184 - OBJ
      ?auto_12181 - LOCATION
    )
    :vars
    (
      ?auto_12185 - LOCATION
      ?auto_12186 - CITY
      ?auto_12187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12185 ?auto_12186 ) ( IN-CITY ?auto_12181 ?auto_12186 ) ( not ( = ?auto_12181 ?auto_12185 ) ) ( OBJ-AT ?auto_12182 ?auto_12181 ) ( not ( = ?auto_12182 ?auto_12184 ) ) ( OBJ-AT ?auto_12184 ?auto_12185 ) ( TRUCK-AT ?auto_12187 ?auto_12181 ) ( IN-TRUCK ?auto_12183 ?auto_12187 ) ( not ( = ?auto_12182 ?auto_12183 ) ) ( not ( = ?auto_12184 ?auto_12183 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12182 ?auto_12184 ?auto_12181 )
      ( DELIVER-3PKG-VERIFY ?auto_12182 ?auto_12183 ?auto_12184 ?auto_12181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12189 - OBJ
      ?auto_12190 - OBJ
      ?auto_12191 - OBJ
      ?auto_12188 - LOCATION
    )
    :vars
    (
      ?auto_12192 - LOCATION
      ?auto_12193 - CITY
      ?auto_12194 - TRUCK
      ?auto_12195 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12192 ?auto_12193 ) ( IN-CITY ?auto_12188 ?auto_12193 ) ( not ( = ?auto_12188 ?auto_12192 ) ) ( OBJ-AT ?auto_12189 ?auto_12188 ) ( not ( = ?auto_12189 ?auto_12190 ) ) ( OBJ-AT ?auto_12190 ?auto_12192 ) ( TRUCK-AT ?auto_12194 ?auto_12188 ) ( IN-TRUCK ?auto_12195 ?auto_12194 ) ( not ( = ?auto_12189 ?auto_12195 ) ) ( not ( = ?auto_12190 ?auto_12195 ) ) ( OBJ-AT ?auto_12191 ?auto_12188 ) ( not ( = ?auto_12189 ?auto_12191 ) ) ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12191 ?auto_12195 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12189 ?auto_12190 ?auto_12188 )
      ( DELIVER-3PKG-VERIFY ?auto_12189 ?auto_12190 ?auto_12191 ?auto_12188 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12197 - OBJ
      ?auto_12198 - OBJ
      ?auto_12199 - OBJ
      ?auto_12196 - LOCATION
    )
    :vars
    (
      ?auto_12200 - LOCATION
      ?auto_12201 - CITY
      ?auto_12202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12200 ?auto_12201 ) ( IN-CITY ?auto_12196 ?auto_12201 ) ( not ( = ?auto_12196 ?auto_12200 ) ) ( OBJ-AT ?auto_12197 ?auto_12196 ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( OBJ-AT ?auto_12198 ?auto_12200 ) ( TRUCK-AT ?auto_12202 ?auto_12196 ) ( IN-TRUCK ?auto_12199 ?auto_12202 ) ( not ( = ?auto_12197 ?auto_12199 ) ) ( not ( = ?auto_12198 ?auto_12199 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12197 ?auto_12198 ?auto_12196 )
      ( DELIVER-3PKG-VERIFY ?auto_12197 ?auto_12198 ?auto_12199 ?auto_12196 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12212 - OBJ
      ?auto_12213 - OBJ
      ?auto_12214 - OBJ
      ?auto_12211 - LOCATION
    )
    :vars
    (
      ?auto_12215 - LOCATION
      ?auto_12216 - CITY
      ?auto_12217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12215 ?auto_12216 ) ( IN-CITY ?auto_12211 ?auto_12216 ) ( not ( = ?auto_12211 ?auto_12215 ) ) ( OBJ-AT ?auto_12213 ?auto_12211 ) ( not ( = ?auto_12213 ?auto_12214 ) ) ( OBJ-AT ?auto_12214 ?auto_12215 ) ( TRUCK-AT ?auto_12217 ?auto_12211 ) ( IN-TRUCK ?auto_12212 ?auto_12217 ) ( not ( = ?auto_12213 ?auto_12212 ) ) ( not ( = ?auto_12214 ?auto_12212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12213 ?auto_12214 ?auto_12211 )
      ( DELIVER-3PKG-VERIFY ?auto_12212 ?auto_12213 ?auto_12214 ?auto_12211 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12227 - OBJ
      ?auto_12228 - OBJ
      ?auto_12229 - OBJ
      ?auto_12226 - LOCATION
    )
    :vars
    (
      ?auto_12230 - LOCATION
      ?auto_12231 - CITY
      ?auto_12232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12230 ?auto_12231 ) ( IN-CITY ?auto_12226 ?auto_12231 ) ( not ( = ?auto_12226 ?auto_12230 ) ) ( OBJ-AT ?auto_12229 ?auto_12226 ) ( not ( = ?auto_12229 ?auto_12228 ) ) ( OBJ-AT ?auto_12228 ?auto_12230 ) ( TRUCK-AT ?auto_12232 ?auto_12226 ) ( IN-TRUCK ?auto_12227 ?auto_12232 ) ( not ( = ?auto_12229 ?auto_12227 ) ) ( not ( = ?auto_12228 ?auto_12227 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12229 ?auto_12228 ?auto_12226 )
      ( DELIVER-3PKG-VERIFY ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12250 - OBJ
      ?auto_12251 - OBJ
      ?auto_12252 - OBJ
      ?auto_12249 - LOCATION
    )
    :vars
    (
      ?auto_12253 - LOCATION
      ?auto_12254 - CITY
      ?auto_12255 - TRUCK
      ?auto_12256 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_12253 ?auto_12254 ) ( IN-CITY ?auto_12249 ?auto_12254 ) ( not ( = ?auto_12249 ?auto_12253 ) ) ( OBJ-AT ?auto_12251 ?auto_12249 ) ( not ( = ?auto_12251 ?auto_12250 ) ) ( OBJ-AT ?auto_12250 ?auto_12253 ) ( TRUCK-AT ?auto_12255 ?auto_12249 ) ( IN-TRUCK ?auto_12256 ?auto_12255 ) ( not ( = ?auto_12251 ?auto_12256 ) ) ( not ( = ?auto_12250 ?auto_12256 ) ) ( OBJ-AT ?auto_12252 ?auto_12249 ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12252 ?auto_12256 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12251 ?auto_12250 ?auto_12249 )
      ( DELIVER-3PKG-VERIFY ?auto_12250 ?auto_12251 ?auto_12252 ?auto_12249 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12258 - OBJ
      ?auto_12259 - OBJ
      ?auto_12260 - OBJ
      ?auto_12257 - LOCATION
    )
    :vars
    (
      ?auto_12261 - LOCATION
      ?auto_12262 - CITY
      ?auto_12263 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12261 ?auto_12262 ) ( IN-CITY ?auto_12257 ?auto_12262 ) ( not ( = ?auto_12257 ?auto_12261 ) ) ( OBJ-AT ?auto_12259 ?auto_12257 ) ( not ( = ?auto_12259 ?auto_12258 ) ) ( OBJ-AT ?auto_12258 ?auto_12261 ) ( TRUCK-AT ?auto_12263 ?auto_12257 ) ( IN-TRUCK ?auto_12260 ?auto_12263 ) ( not ( = ?auto_12259 ?auto_12260 ) ) ( not ( = ?auto_12258 ?auto_12260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12259 ?auto_12258 ?auto_12257 )
      ( DELIVER-3PKG-VERIFY ?auto_12258 ?auto_12259 ?auto_12260 ?auto_12257 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12273 - OBJ
      ?auto_12274 - OBJ
      ?auto_12275 - OBJ
      ?auto_12272 - LOCATION
    )
    :vars
    (
      ?auto_12276 - LOCATION
      ?auto_12277 - CITY
      ?auto_12278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12276 ?auto_12277 ) ( IN-CITY ?auto_12272 ?auto_12277 ) ( not ( = ?auto_12272 ?auto_12276 ) ) ( OBJ-AT ?auto_12275 ?auto_12272 ) ( not ( = ?auto_12275 ?auto_12273 ) ) ( OBJ-AT ?auto_12273 ?auto_12276 ) ( TRUCK-AT ?auto_12278 ?auto_12272 ) ( IN-TRUCK ?auto_12274 ?auto_12278 ) ( not ( = ?auto_12275 ?auto_12274 ) ) ( not ( = ?auto_12273 ?auto_12274 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12275 ?auto_12273 ?auto_12272 )
      ( DELIVER-3PKG-VERIFY ?auto_12273 ?auto_12274 ?auto_12275 ?auto_12272 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12321 - OBJ
      ?auto_12320 - LOCATION
    )
    :vars
    (
      ?auto_12322 - LOCATION
      ?auto_12324 - CITY
      ?auto_12323 - OBJ
      ?auto_12326 - OBJ
      ?auto_12325 - TRUCK
      ?auto_12327 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12322 ?auto_12324 ) ( IN-CITY ?auto_12320 ?auto_12324 ) ( not ( = ?auto_12320 ?auto_12322 ) ) ( OBJ-AT ?auto_12323 ?auto_12320 ) ( not ( = ?auto_12323 ?auto_12321 ) ) ( OBJ-AT ?auto_12321 ?auto_12322 ) ( IN-TRUCK ?auto_12326 ?auto_12325 ) ( not ( = ?auto_12323 ?auto_12326 ) ) ( not ( = ?auto_12321 ?auto_12326 ) ) ( TRUCK-AT ?auto_12325 ?auto_12327 ) ( IN-CITY ?auto_12327 ?auto_12324 ) ( not ( = ?auto_12320 ?auto_12327 ) ) ( not ( = ?auto_12322 ?auto_12327 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12325 ?auto_12327 ?auto_12320 ?auto_12324 )
      ( DELIVER-2PKG ?auto_12323 ?auto_12321 ?auto_12320 )
      ( DELIVER-1PKG-VERIFY ?auto_12321 ?auto_12320 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12329 - OBJ
      ?auto_12330 - OBJ
      ?auto_12328 - LOCATION
    )
    :vars
    (
      ?auto_12334 - LOCATION
      ?auto_12332 - CITY
      ?auto_12335 - OBJ
      ?auto_12331 - TRUCK
      ?auto_12333 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12334 ?auto_12332 ) ( IN-CITY ?auto_12328 ?auto_12332 ) ( not ( = ?auto_12328 ?auto_12334 ) ) ( OBJ-AT ?auto_12329 ?auto_12328 ) ( not ( = ?auto_12329 ?auto_12330 ) ) ( OBJ-AT ?auto_12330 ?auto_12334 ) ( IN-TRUCK ?auto_12335 ?auto_12331 ) ( not ( = ?auto_12329 ?auto_12335 ) ) ( not ( = ?auto_12330 ?auto_12335 ) ) ( TRUCK-AT ?auto_12331 ?auto_12333 ) ( IN-CITY ?auto_12333 ?auto_12332 ) ( not ( = ?auto_12328 ?auto_12333 ) ) ( not ( = ?auto_12334 ?auto_12333 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12330 ?auto_12328 )
      ( DELIVER-2PKG-VERIFY ?auto_12329 ?auto_12330 ?auto_12328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12337 - OBJ
      ?auto_12338 - OBJ
      ?auto_12336 - LOCATION
    )
    :vars
    (
      ?auto_12341 - LOCATION
      ?auto_12342 - CITY
      ?auto_12340 - OBJ
      ?auto_12339 - TRUCK
      ?auto_12343 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12341 ?auto_12342 ) ( IN-CITY ?auto_12336 ?auto_12342 ) ( not ( = ?auto_12336 ?auto_12341 ) ) ( OBJ-AT ?auto_12340 ?auto_12336 ) ( not ( = ?auto_12340 ?auto_12338 ) ) ( OBJ-AT ?auto_12338 ?auto_12341 ) ( IN-TRUCK ?auto_12337 ?auto_12339 ) ( not ( = ?auto_12340 ?auto_12337 ) ) ( not ( = ?auto_12338 ?auto_12337 ) ) ( TRUCK-AT ?auto_12339 ?auto_12343 ) ( IN-CITY ?auto_12343 ?auto_12342 ) ( not ( = ?auto_12336 ?auto_12343 ) ) ( not ( = ?auto_12341 ?auto_12343 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12340 ?auto_12338 ?auto_12336 )
      ( DELIVER-2PKG-VERIFY ?auto_12337 ?auto_12338 ?auto_12336 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12345 - OBJ
      ?auto_12346 - OBJ
      ?auto_12344 - LOCATION
    )
    :vars
    (
      ?auto_12349 - LOCATION
      ?auto_12350 - CITY
      ?auto_12348 - OBJ
      ?auto_12347 - TRUCK
      ?auto_12351 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12349 ?auto_12350 ) ( IN-CITY ?auto_12344 ?auto_12350 ) ( not ( = ?auto_12344 ?auto_12349 ) ) ( OBJ-AT ?auto_12346 ?auto_12344 ) ( not ( = ?auto_12346 ?auto_12345 ) ) ( OBJ-AT ?auto_12345 ?auto_12349 ) ( IN-TRUCK ?auto_12348 ?auto_12347 ) ( not ( = ?auto_12346 ?auto_12348 ) ) ( not ( = ?auto_12345 ?auto_12348 ) ) ( TRUCK-AT ?auto_12347 ?auto_12351 ) ( IN-CITY ?auto_12351 ?auto_12350 ) ( not ( = ?auto_12344 ?auto_12351 ) ) ( not ( = ?auto_12349 ?auto_12351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12346 ?auto_12345 ?auto_12344 )
      ( DELIVER-2PKG-VERIFY ?auto_12345 ?auto_12346 ?auto_12344 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12353 - OBJ
      ?auto_12354 - OBJ
      ?auto_12352 - LOCATION
    )
    :vars
    (
      ?auto_12357 - LOCATION
      ?auto_12358 - CITY
      ?auto_12356 - OBJ
      ?auto_12355 - TRUCK
      ?auto_12359 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12357 ?auto_12358 ) ( IN-CITY ?auto_12352 ?auto_12358 ) ( not ( = ?auto_12352 ?auto_12357 ) ) ( OBJ-AT ?auto_12356 ?auto_12352 ) ( not ( = ?auto_12356 ?auto_12353 ) ) ( OBJ-AT ?auto_12353 ?auto_12357 ) ( IN-TRUCK ?auto_12354 ?auto_12355 ) ( not ( = ?auto_12356 ?auto_12354 ) ) ( not ( = ?auto_12353 ?auto_12354 ) ) ( TRUCK-AT ?auto_12355 ?auto_12359 ) ( IN-CITY ?auto_12359 ?auto_12358 ) ( not ( = ?auto_12352 ?auto_12359 ) ) ( not ( = ?auto_12357 ?auto_12359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12356 ?auto_12353 ?auto_12352 )
      ( DELIVER-2PKG-VERIFY ?auto_12353 ?auto_12354 ?auto_12352 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12370 - OBJ
      ?auto_12371 - OBJ
      ?auto_12372 - OBJ
      ?auto_12369 - LOCATION
    )
    :vars
    (
      ?auto_12375 - LOCATION
      ?auto_12376 - CITY
      ?auto_12374 - OBJ
      ?auto_12373 - TRUCK
      ?auto_12377 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12375 ?auto_12376 ) ( IN-CITY ?auto_12369 ?auto_12376 ) ( not ( = ?auto_12369 ?auto_12375 ) ) ( OBJ-AT ?auto_12371 ?auto_12369 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( OBJ-AT ?auto_12372 ?auto_12375 ) ( IN-TRUCK ?auto_12374 ?auto_12373 ) ( not ( = ?auto_12371 ?auto_12374 ) ) ( not ( = ?auto_12372 ?auto_12374 ) ) ( TRUCK-AT ?auto_12373 ?auto_12377 ) ( IN-CITY ?auto_12377 ?auto_12376 ) ( not ( = ?auto_12369 ?auto_12377 ) ) ( not ( = ?auto_12375 ?auto_12377 ) ) ( OBJ-AT ?auto_12370 ?auto_12369 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12374 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12371 ?auto_12372 ?auto_12369 )
      ( DELIVER-3PKG-VERIFY ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12369 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12379 - OBJ
      ?auto_12380 - OBJ
      ?auto_12381 - OBJ
      ?auto_12378 - LOCATION
    )
    :vars
    (
      ?auto_12383 - LOCATION
      ?auto_12384 - CITY
      ?auto_12382 - TRUCK
      ?auto_12385 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12383 ?auto_12384 ) ( IN-CITY ?auto_12378 ?auto_12384 ) ( not ( = ?auto_12378 ?auto_12383 ) ) ( OBJ-AT ?auto_12379 ?auto_12378 ) ( not ( = ?auto_12379 ?auto_12381 ) ) ( OBJ-AT ?auto_12381 ?auto_12383 ) ( IN-TRUCK ?auto_12380 ?auto_12382 ) ( not ( = ?auto_12379 ?auto_12380 ) ) ( not ( = ?auto_12381 ?auto_12380 ) ) ( TRUCK-AT ?auto_12382 ?auto_12385 ) ( IN-CITY ?auto_12385 ?auto_12384 ) ( not ( = ?auto_12378 ?auto_12385 ) ) ( not ( = ?auto_12383 ?auto_12385 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12379 ?auto_12381 ?auto_12378 )
      ( DELIVER-3PKG-VERIFY ?auto_12379 ?auto_12380 ?auto_12381 ?auto_12378 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12387 - OBJ
      ?auto_12388 - OBJ
      ?auto_12389 - OBJ
      ?auto_12386 - LOCATION
    )
    :vars
    (
      ?auto_12392 - LOCATION
      ?auto_12393 - CITY
      ?auto_12391 - OBJ
      ?auto_12390 - TRUCK
      ?auto_12394 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12392 ?auto_12393 ) ( IN-CITY ?auto_12386 ?auto_12393 ) ( not ( = ?auto_12386 ?auto_12392 ) ) ( OBJ-AT ?auto_12389 ?auto_12386 ) ( not ( = ?auto_12389 ?auto_12388 ) ) ( OBJ-AT ?auto_12388 ?auto_12392 ) ( IN-TRUCK ?auto_12391 ?auto_12390 ) ( not ( = ?auto_12389 ?auto_12391 ) ) ( not ( = ?auto_12388 ?auto_12391 ) ) ( TRUCK-AT ?auto_12390 ?auto_12394 ) ( IN-CITY ?auto_12394 ?auto_12393 ) ( not ( = ?auto_12386 ?auto_12394 ) ) ( not ( = ?auto_12392 ?auto_12394 ) ) ( OBJ-AT ?auto_12387 ?auto_12386 ) ( not ( = ?auto_12387 ?auto_12388 ) ) ( not ( = ?auto_12387 ?auto_12389 ) ) ( not ( = ?auto_12387 ?auto_12391 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12389 ?auto_12388 ?auto_12386 )
      ( DELIVER-3PKG-VERIFY ?auto_12387 ?auto_12388 ?auto_12389 ?auto_12386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12396 - OBJ
      ?auto_12397 - OBJ
      ?auto_12398 - OBJ
      ?auto_12395 - LOCATION
    )
    :vars
    (
      ?auto_12400 - LOCATION
      ?auto_12401 - CITY
      ?auto_12399 - TRUCK
      ?auto_12402 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12400 ?auto_12401 ) ( IN-CITY ?auto_12395 ?auto_12401 ) ( not ( = ?auto_12395 ?auto_12400 ) ) ( OBJ-AT ?auto_12396 ?auto_12395 ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( OBJ-AT ?auto_12397 ?auto_12400 ) ( IN-TRUCK ?auto_12398 ?auto_12399 ) ( not ( = ?auto_12396 ?auto_12398 ) ) ( not ( = ?auto_12397 ?auto_12398 ) ) ( TRUCK-AT ?auto_12399 ?auto_12402 ) ( IN-CITY ?auto_12402 ?auto_12401 ) ( not ( = ?auto_12395 ?auto_12402 ) ) ( not ( = ?auto_12400 ?auto_12402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12396 ?auto_12397 ?auto_12395 )
      ( DELIVER-3PKG-VERIFY ?auto_12396 ?auto_12397 ?auto_12398 ?auto_12395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12413 - OBJ
      ?auto_12414 - OBJ
      ?auto_12415 - OBJ
      ?auto_12412 - LOCATION
    )
    :vars
    (
      ?auto_12417 - LOCATION
      ?auto_12418 - CITY
      ?auto_12416 - TRUCK
      ?auto_12419 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12417 ?auto_12418 ) ( IN-CITY ?auto_12412 ?auto_12418 ) ( not ( = ?auto_12412 ?auto_12417 ) ) ( OBJ-AT ?auto_12414 ?auto_12412 ) ( not ( = ?auto_12414 ?auto_12415 ) ) ( OBJ-AT ?auto_12415 ?auto_12417 ) ( IN-TRUCK ?auto_12413 ?auto_12416 ) ( not ( = ?auto_12414 ?auto_12413 ) ) ( not ( = ?auto_12415 ?auto_12413 ) ) ( TRUCK-AT ?auto_12416 ?auto_12419 ) ( IN-CITY ?auto_12419 ?auto_12418 ) ( not ( = ?auto_12412 ?auto_12419 ) ) ( not ( = ?auto_12417 ?auto_12419 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12414 ?auto_12415 ?auto_12412 )
      ( DELIVER-3PKG-VERIFY ?auto_12413 ?auto_12414 ?auto_12415 ?auto_12412 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12430 - OBJ
      ?auto_12431 - OBJ
      ?auto_12432 - OBJ
      ?auto_12429 - LOCATION
    )
    :vars
    (
      ?auto_12434 - LOCATION
      ?auto_12435 - CITY
      ?auto_12433 - TRUCK
      ?auto_12436 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12434 ?auto_12435 ) ( IN-CITY ?auto_12429 ?auto_12435 ) ( not ( = ?auto_12429 ?auto_12434 ) ) ( OBJ-AT ?auto_12432 ?auto_12429 ) ( not ( = ?auto_12432 ?auto_12431 ) ) ( OBJ-AT ?auto_12431 ?auto_12434 ) ( IN-TRUCK ?auto_12430 ?auto_12433 ) ( not ( = ?auto_12432 ?auto_12430 ) ) ( not ( = ?auto_12431 ?auto_12430 ) ) ( TRUCK-AT ?auto_12433 ?auto_12436 ) ( IN-CITY ?auto_12436 ?auto_12435 ) ( not ( = ?auto_12429 ?auto_12436 ) ) ( not ( = ?auto_12434 ?auto_12436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12432 ?auto_12431 ?auto_12429 )
      ( DELIVER-3PKG-VERIFY ?auto_12430 ?auto_12431 ?auto_12432 ?auto_12429 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12456 - OBJ
      ?auto_12457 - OBJ
      ?auto_12458 - OBJ
      ?auto_12455 - LOCATION
    )
    :vars
    (
      ?auto_12461 - LOCATION
      ?auto_12462 - CITY
      ?auto_12460 - OBJ
      ?auto_12459 - TRUCK
      ?auto_12463 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12461 ?auto_12462 ) ( IN-CITY ?auto_12455 ?auto_12462 ) ( not ( = ?auto_12455 ?auto_12461 ) ) ( OBJ-AT ?auto_12458 ?auto_12455 ) ( not ( = ?auto_12458 ?auto_12456 ) ) ( OBJ-AT ?auto_12456 ?auto_12461 ) ( IN-TRUCK ?auto_12460 ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12460 ) ) ( not ( = ?auto_12456 ?auto_12460 ) ) ( TRUCK-AT ?auto_12459 ?auto_12463 ) ( IN-CITY ?auto_12463 ?auto_12462 ) ( not ( = ?auto_12455 ?auto_12463 ) ) ( not ( = ?auto_12461 ?auto_12463 ) ) ( OBJ-AT ?auto_12457 ?auto_12455 ) ( not ( = ?auto_12456 ?auto_12457 ) ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( not ( = ?auto_12457 ?auto_12460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12458 ?auto_12456 ?auto_12455 )
      ( DELIVER-3PKG-VERIFY ?auto_12456 ?auto_12457 ?auto_12458 ?auto_12455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12465 - OBJ
      ?auto_12466 - OBJ
      ?auto_12467 - OBJ
      ?auto_12464 - LOCATION
    )
    :vars
    (
      ?auto_12469 - LOCATION
      ?auto_12470 - CITY
      ?auto_12468 - TRUCK
      ?auto_12471 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12469 ?auto_12470 ) ( IN-CITY ?auto_12464 ?auto_12470 ) ( not ( = ?auto_12464 ?auto_12469 ) ) ( OBJ-AT ?auto_12466 ?auto_12464 ) ( not ( = ?auto_12466 ?auto_12465 ) ) ( OBJ-AT ?auto_12465 ?auto_12469 ) ( IN-TRUCK ?auto_12467 ?auto_12468 ) ( not ( = ?auto_12466 ?auto_12467 ) ) ( not ( = ?auto_12465 ?auto_12467 ) ) ( TRUCK-AT ?auto_12468 ?auto_12471 ) ( IN-CITY ?auto_12471 ?auto_12470 ) ( not ( = ?auto_12464 ?auto_12471 ) ) ( not ( = ?auto_12469 ?auto_12471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12466 ?auto_12465 ?auto_12464 )
      ( DELIVER-3PKG-VERIFY ?auto_12465 ?auto_12466 ?auto_12467 ?auto_12464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12482 - OBJ
      ?auto_12483 - OBJ
      ?auto_12484 - OBJ
      ?auto_12481 - LOCATION
    )
    :vars
    (
      ?auto_12486 - LOCATION
      ?auto_12487 - CITY
      ?auto_12485 - TRUCK
      ?auto_12488 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12486 ?auto_12487 ) ( IN-CITY ?auto_12481 ?auto_12487 ) ( not ( = ?auto_12481 ?auto_12486 ) ) ( OBJ-AT ?auto_12484 ?auto_12481 ) ( not ( = ?auto_12484 ?auto_12482 ) ) ( OBJ-AT ?auto_12482 ?auto_12486 ) ( IN-TRUCK ?auto_12483 ?auto_12485 ) ( not ( = ?auto_12484 ?auto_12483 ) ) ( not ( = ?auto_12482 ?auto_12483 ) ) ( TRUCK-AT ?auto_12485 ?auto_12488 ) ( IN-CITY ?auto_12488 ?auto_12487 ) ( not ( = ?auto_12481 ?auto_12488 ) ) ( not ( = ?auto_12486 ?auto_12488 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12484 ?auto_12482 ?auto_12481 )
      ( DELIVER-3PKG-VERIFY ?auto_12482 ?auto_12483 ?auto_12484 ?auto_12481 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12536 - OBJ
      ?auto_12535 - LOCATION
    )
    :vars
    (
      ?auto_12540 - LOCATION
      ?auto_12541 - CITY
      ?auto_12539 - OBJ
      ?auto_12538 - OBJ
      ?auto_12537 - TRUCK
      ?auto_12542 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12540 ?auto_12541 ) ( IN-CITY ?auto_12535 ?auto_12541 ) ( not ( = ?auto_12535 ?auto_12540 ) ) ( OBJ-AT ?auto_12539 ?auto_12535 ) ( not ( = ?auto_12539 ?auto_12536 ) ) ( OBJ-AT ?auto_12536 ?auto_12540 ) ( not ( = ?auto_12539 ?auto_12538 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( TRUCK-AT ?auto_12537 ?auto_12542 ) ( IN-CITY ?auto_12542 ?auto_12541 ) ( not ( = ?auto_12535 ?auto_12542 ) ) ( not ( = ?auto_12540 ?auto_12542 ) ) ( OBJ-AT ?auto_12538 ?auto_12542 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12538 ?auto_12537 ?auto_12542 )
      ( DELIVER-2PKG ?auto_12539 ?auto_12536 ?auto_12535 )
      ( DELIVER-1PKG-VERIFY ?auto_12536 ?auto_12535 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12544 - OBJ
      ?auto_12545 - OBJ
      ?auto_12543 - LOCATION
    )
    :vars
    (
      ?auto_12550 - LOCATION
      ?auto_12549 - CITY
      ?auto_12548 - OBJ
      ?auto_12547 - TRUCK
      ?auto_12546 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12550 ?auto_12549 ) ( IN-CITY ?auto_12543 ?auto_12549 ) ( not ( = ?auto_12543 ?auto_12550 ) ) ( OBJ-AT ?auto_12544 ?auto_12543 ) ( not ( = ?auto_12544 ?auto_12545 ) ) ( OBJ-AT ?auto_12545 ?auto_12550 ) ( not ( = ?auto_12544 ?auto_12548 ) ) ( not ( = ?auto_12545 ?auto_12548 ) ) ( TRUCK-AT ?auto_12547 ?auto_12546 ) ( IN-CITY ?auto_12546 ?auto_12549 ) ( not ( = ?auto_12543 ?auto_12546 ) ) ( not ( = ?auto_12550 ?auto_12546 ) ) ( OBJ-AT ?auto_12548 ?auto_12546 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12545 ?auto_12543 )
      ( DELIVER-2PKG-VERIFY ?auto_12544 ?auto_12545 ?auto_12543 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12552 - OBJ
      ?auto_12553 - OBJ
      ?auto_12551 - LOCATION
    )
    :vars
    (
      ?auto_12556 - LOCATION
      ?auto_12558 - CITY
      ?auto_12554 - OBJ
      ?auto_12555 - TRUCK
      ?auto_12557 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12556 ?auto_12558 ) ( IN-CITY ?auto_12551 ?auto_12558 ) ( not ( = ?auto_12551 ?auto_12556 ) ) ( OBJ-AT ?auto_12554 ?auto_12551 ) ( not ( = ?auto_12554 ?auto_12553 ) ) ( OBJ-AT ?auto_12553 ?auto_12556 ) ( not ( = ?auto_12554 ?auto_12552 ) ) ( not ( = ?auto_12553 ?auto_12552 ) ) ( TRUCK-AT ?auto_12555 ?auto_12557 ) ( IN-CITY ?auto_12557 ?auto_12558 ) ( not ( = ?auto_12551 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( OBJ-AT ?auto_12552 ?auto_12557 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12554 ?auto_12553 ?auto_12551 )
      ( DELIVER-2PKG-VERIFY ?auto_12552 ?auto_12553 ?auto_12551 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12560 - OBJ
      ?auto_12561 - OBJ
      ?auto_12559 - LOCATION
    )
    :vars
    (
      ?auto_12563 - LOCATION
      ?auto_12566 - CITY
      ?auto_12564 - OBJ
      ?auto_12562 - TRUCK
      ?auto_12565 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12563 ?auto_12566 ) ( IN-CITY ?auto_12559 ?auto_12566 ) ( not ( = ?auto_12559 ?auto_12563 ) ) ( OBJ-AT ?auto_12561 ?auto_12559 ) ( not ( = ?auto_12561 ?auto_12560 ) ) ( OBJ-AT ?auto_12560 ?auto_12563 ) ( not ( = ?auto_12561 ?auto_12564 ) ) ( not ( = ?auto_12560 ?auto_12564 ) ) ( TRUCK-AT ?auto_12562 ?auto_12565 ) ( IN-CITY ?auto_12565 ?auto_12566 ) ( not ( = ?auto_12559 ?auto_12565 ) ) ( not ( = ?auto_12563 ?auto_12565 ) ) ( OBJ-AT ?auto_12564 ?auto_12565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12561 ?auto_12560 ?auto_12559 )
      ( DELIVER-2PKG-VERIFY ?auto_12560 ?auto_12561 ?auto_12559 ) )
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
      ?auto_12572 - LOCATION
      ?auto_12574 - CITY
      ?auto_12570 - OBJ
      ?auto_12571 - TRUCK
      ?auto_12573 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12572 ?auto_12574 ) ( IN-CITY ?auto_12567 ?auto_12574 ) ( not ( = ?auto_12567 ?auto_12572 ) ) ( OBJ-AT ?auto_12570 ?auto_12567 ) ( not ( = ?auto_12570 ?auto_12568 ) ) ( OBJ-AT ?auto_12568 ?auto_12572 ) ( not ( = ?auto_12570 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( TRUCK-AT ?auto_12571 ?auto_12573 ) ( IN-CITY ?auto_12573 ?auto_12574 ) ( not ( = ?auto_12567 ?auto_12573 ) ) ( not ( = ?auto_12572 ?auto_12573 ) ) ( OBJ-AT ?auto_12569 ?auto_12573 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12570 ?auto_12568 ?auto_12567 )
      ( DELIVER-2PKG-VERIFY ?auto_12568 ?auto_12569 ?auto_12567 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12585 - OBJ
      ?auto_12586 - OBJ
      ?auto_12587 - OBJ
      ?auto_12584 - LOCATION
    )
    :vars
    (
      ?auto_12589 - LOCATION
      ?auto_12592 - CITY
      ?auto_12590 - OBJ
      ?auto_12588 - TRUCK
      ?auto_12591 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12589 ?auto_12592 ) ( IN-CITY ?auto_12584 ?auto_12592 ) ( not ( = ?auto_12584 ?auto_12589 ) ) ( OBJ-AT ?auto_12586 ?auto_12584 ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( OBJ-AT ?auto_12587 ?auto_12589 ) ( not ( = ?auto_12586 ?auto_12590 ) ) ( not ( = ?auto_12587 ?auto_12590 ) ) ( TRUCK-AT ?auto_12588 ?auto_12591 ) ( IN-CITY ?auto_12591 ?auto_12592 ) ( not ( = ?auto_12584 ?auto_12591 ) ) ( not ( = ?auto_12589 ?auto_12591 ) ) ( OBJ-AT ?auto_12590 ?auto_12591 ) ( OBJ-AT ?auto_12585 ?auto_12584 ) ( not ( = ?auto_12585 ?auto_12586 ) ) ( not ( = ?auto_12585 ?auto_12587 ) ) ( not ( = ?auto_12585 ?auto_12590 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12586 ?auto_12587 ?auto_12584 )
      ( DELIVER-3PKG-VERIFY ?auto_12585 ?auto_12586 ?auto_12587 ?auto_12584 ) )
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
      ?auto_12598 - LOCATION
      ?auto_12600 - CITY
      ?auto_12597 - TRUCK
      ?auto_12599 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12598 ?auto_12600 ) ( IN-CITY ?auto_12593 ?auto_12600 ) ( not ( = ?auto_12593 ?auto_12598 ) ) ( OBJ-AT ?auto_12594 ?auto_12593 ) ( not ( = ?auto_12594 ?auto_12596 ) ) ( OBJ-AT ?auto_12596 ?auto_12598 ) ( not ( = ?auto_12594 ?auto_12595 ) ) ( not ( = ?auto_12596 ?auto_12595 ) ) ( TRUCK-AT ?auto_12597 ?auto_12599 ) ( IN-CITY ?auto_12599 ?auto_12600 ) ( not ( = ?auto_12593 ?auto_12599 ) ) ( not ( = ?auto_12598 ?auto_12599 ) ) ( OBJ-AT ?auto_12595 ?auto_12599 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12594 ?auto_12596 ?auto_12593 )
      ( DELIVER-3PKG-VERIFY ?auto_12594 ?auto_12595 ?auto_12596 ?auto_12593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12602 - OBJ
      ?auto_12603 - OBJ
      ?auto_12604 - OBJ
      ?auto_12601 - LOCATION
    )
    :vars
    (
      ?auto_12606 - LOCATION
      ?auto_12609 - CITY
      ?auto_12607 - OBJ
      ?auto_12605 - TRUCK
      ?auto_12608 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12606 ?auto_12609 ) ( IN-CITY ?auto_12601 ?auto_12609 ) ( not ( = ?auto_12601 ?auto_12606 ) ) ( OBJ-AT ?auto_12604 ?auto_12601 ) ( not ( = ?auto_12604 ?auto_12603 ) ) ( OBJ-AT ?auto_12603 ?auto_12606 ) ( not ( = ?auto_12604 ?auto_12607 ) ) ( not ( = ?auto_12603 ?auto_12607 ) ) ( TRUCK-AT ?auto_12605 ?auto_12608 ) ( IN-CITY ?auto_12608 ?auto_12609 ) ( not ( = ?auto_12601 ?auto_12608 ) ) ( not ( = ?auto_12606 ?auto_12608 ) ) ( OBJ-AT ?auto_12607 ?auto_12608 ) ( OBJ-AT ?auto_12602 ?auto_12601 ) ( not ( = ?auto_12602 ?auto_12603 ) ) ( not ( = ?auto_12602 ?auto_12604 ) ) ( not ( = ?auto_12602 ?auto_12607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12604 ?auto_12603 ?auto_12601 )
      ( DELIVER-3PKG-VERIFY ?auto_12602 ?auto_12603 ?auto_12604 ?auto_12601 ) )
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
      ?auto_12615 - LOCATION
      ?auto_12617 - CITY
      ?auto_12614 - TRUCK
      ?auto_12616 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12615 ?auto_12617 ) ( IN-CITY ?auto_12610 ?auto_12617 ) ( not ( = ?auto_12610 ?auto_12615 ) ) ( OBJ-AT ?auto_12611 ?auto_12610 ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( OBJ-AT ?auto_12612 ?auto_12615 ) ( not ( = ?auto_12611 ?auto_12613 ) ) ( not ( = ?auto_12612 ?auto_12613 ) ) ( TRUCK-AT ?auto_12614 ?auto_12616 ) ( IN-CITY ?auto_12616 ?auto_12617 ) ( not ( = ?auto_12610 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( OBJ-AT ?auto_12613 ?auto_12616 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12611 ?auto_12612 ?auto_12610 )
      ( DELIVER-3PKG-VERIFY ?auto_12611 ?auto_12612 ?auto_12613 ?auto_12610 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12628 - OBJ
      ?auto_12629 - OBJ
      ?auto_12630 - OBJ
      ?auto_12627 - LOCATION
    )
    :vars
    (
      ?auto_12632 - LOCATION
      ?auto_12634 - CITY
      ?auto_12631 - TRUCK
      ?auto_12633 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12632 ?auto_12634 ) ( IN-CITY ?auto_12627 ?auto_12634 ) ( not ( = ?auto_12627 ?auto_12632 ) ) ( OBJ-AT ?auto_12629 ?auto_12627 ) ( not ( = ?auto_12629 ?auto_12630 ) ) ( OBJ-AT ?auto_12630 ?auto_12632 ) ( not ( = ?auto_12629 ?auto_12628 ) ) ( not ( = ?auto_12630 ?auto_12628 ) ) ( TRUCK-AT ?auto_12631 ?auto_12633 ) ( IN-CITY ?auto_12633 ?auto_12634 ) ( not ( = ?auto_12627 ?auto_12633 ) ) ( not ( = ?auto_12632 ?auto_12633 ) ) ( OBJ-AT ?auto_12628 ?auto_12633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12629 ?auto_12630 ?auto_12627 )
      ( DELIVER-3PKG-VERIFY ?auto_12628 ?auto_12629 ?auto_12630 ?auto_12627 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12645 - OBJ
      ?auto_12646 - OBJ
      ?auto_12647 - OBJ
      ?auto_12644 - LOCATION
    )
    :vars
    (
      ?auto_12649 - LOCATION
      ?auto_12651 - CITY
      ?auto_12648 - TRUCK
      ?auto_12650 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12649 ?auto_12651 ) ( IN-CITY ?auto_12644 ?auto_12651 ) ( not ( = ?auto_12644 ?auto_12649 ) ) ( OBJ-AT ?auto_12647 ?auto_12644 ) ( not ( = ?auto_12647 ?auto_12646 ) ) ( OBJ-AT ?auto_12646 ?auto_12649 ) ( not ( = ?auto_12647 ?auto_12645 ) ) ( not ( = ?auto_12646 ?auto_12645 ) ) ( TRUCK-AT ?auto_12648 ?auto_12650 ) ( IN-CITY ?auto_12650 ?auto_12651 ) ( not ( = ?auto_12644 ?auto_12650 ) ) ( not ( = ?auto_12649 ?auto_12650 ) ) ( OBJ-AT ?auto_12645 ?auto_12650 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12647 ?auto_12646 ?auto_12644 )
      ( DELIVER-3PKG-VERIFY ?auto_12645 ?auto_12646 ?auto_12647 ?auto_12644 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12671 - OBJ
      ?auto_12672 - OBJ
      ?auto_12673 - OBJ
      ?auto_12670 - LOCATION
    )
    :vars
    (
      ?auto_12675 - LOCATION
      ?auto_12678 - CITY
      ?auto_12676 - OBJ
      ?auto_12674 - TRUCK
      ?auto_12677 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12675 ?auto_12678 ) ( IN-CITY ?auto_12670 ?auto_12678 ) ( not ( = ?auto_12670 ?auto_12675 ) ) ( OBJ-AT ?auto_12673 ?auto_12670 ) ( not ( = ?auto_12673 ?auto_12671 ) ) ( OBJ-AT ?auto_12671 ?auto_12675 ) ( not ( = ?auto_12673 ?auto_12676 ) ) ( not ( = ?auto_12671 ?auto_12676 ) ) ( TRUCK-AT ?auto_12674 ?auto_12677 ) ( IN-CITY ?auto_12677 ?auto_12678 ) ( not ( = ?auto_12670 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12677 ) ) ( OBJ-AT ?auto_12676 ?auto_12677 ) ( OBJ-AT ?auto_12672 ?auto_12670 ) ( not ( = ?auto_12671 ?auto_12672 ) ) ( not ( = ?auto_12672 ?auto_12673 ) ) ( not ( = ?auto_12672 ?auto_12676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12673 ?auto_12671 ?auto_12670 )
      ( DELIVER-3PKG-VERIFY ?auto_12671 ?auto_12672 ?auto_12673 ?auto_12670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12680 - OBJ
      ?auto_12681 - OBJ
      ?auto_12682 - OBJ
      ?auto_12679 - LOCATION
    )
    :vars
    (
      ?auto_12684 - LOCATION
      ?auto_12686 - CITY
      ?auto_12683 - TRUCK
      ?auto_12685 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12684 ?auto_12686 ) ( IN-CITY ?auto_12679 ?auto_12686 ) ( not ( = ?auto_12679 ?auto_12684 ) ) ( OBJ-AT ?auto_12681 ?auto_12679 ) ( not ( = ?auto_12681 ?auto_12680 ) ) ( OBJ-AT ?auto_12680 ?auto_12684 ) ( not ( = ?auto_12681 ?auto_12682 ) ) ( not ( = ?auto_12680 ?auto_12682 ) ) ( TRUCK-AT ?auto_12683 ?auto_12685 ) ( IN-CITY ?auto_12685 ?auto_12686 ) ( not ( = ?auto_12679 ?auto_12685 ) ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( OBJ-AT ?auto_12682 ?auto_12685 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12681 ?auto_12680 ?auto_12679 )
      ( DELIVER-3PKG-VERIFY ?auto_12680 ?auto_12681 ?auto_12682 ?auto_12679 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12697 - OBJ
      ?auto_12698 - OBJ
      ?auto_12699 - OBJ
      ?auto_12696 - LOCATION
    )
    :vars
    (
      ?auto_12701 - LOCATION
      ?auto_12703 - CITY
      ?auto_12700 - TRUCK
      ?auto_12702 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12701 ?auto_12703 ) ( IN-CITY ?auto_12696 ?auto_12703 ) ( not ( = ?auto_12696 ?auto_12701 ) ) ( OBJ-AT ?auto_12699 ?auto_12696 ) ( not ( = ?auto_12699 ?auto_12697 ) ) ( OBJ-AT ?auto_12697 ?auto_12701 ) ( not ( = ?auto_12699 ?auto_12698 ) ) ( not ( = ?auto_12697 ?auto_12698 ) ) ( TRUCK-AT ?auto_12700 ?auto_12702 ) ( IN-CITY ?auto_12702 ?auto_12703 ) ( not ( = ?auto_12696 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( OBJ-AT ?auto_12698 ?auto_12702 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12699 ?auto_12697 ?auto_12696 )
      ( DELIVER-3PKG-VERIFY ?auto_12697 ?auto_12698 ?auto_12699 ?auto_12696 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12751 - OBJ
      ?auto_12750 - LOCATION
    )
    :vars
    (
      ?auto_12754 - LOCATION
      ?auto_12757 - CITY
      ?auto_12752 - OBJ
      ?auto_12755 - OBJ
      ?auto_12756 - LOCATION
      ?auto_12753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12754 ?auto_12757 ) ( IN-CITY ?auto_12750 ?auto_12757 ) ( not ( = ?auto_12750 ?auto_12754 ) ) ( OBJ-AT ?auto_12752 ?auto_12750 ) ( not ( = ?auto_12752 ?auto_12751 ) ) ( OBJ-AT ?auto_12751 ?auto_12754 ) ( not ( = ?auto_12752 ?auto_12755 ) ) ( not ( = ?auto_12751 ?auto_12755 ) ) ( IN-CITY ?auto_12756 ?auto_12757 ) ( not ( = ?auto_12750 ?auto_12756 ) ) ( not ( = ?auto_12754 ?auto_12756 ) ) ( OBJ-AT ?auto_12755 ?auto_12756 ) ( TRUCK-AT ?auto_12753 ?auto_12750 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12753 ?auto_12750 ?auto_12756 ?auto_12757 )
      ( DELIVER-2PKG ?auto_12752 ?auto_12751 ?auto_12750 )
      ( DELIVER-1PKG-VERIFY ?auto_12751 ?auto_12750 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12759 - OBJ
      ?auto_12760 - OBJ
      ?auto_12758 - LOCATION
    )
    :vars
    (
      ?auto_12761 - LOCATION
      ?auto_12765 - CITY
      ?auto_12763 - OBJ
      ?auto_12762 - LOCATION
      ?auto_12764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12761 ?auto_12765 ) ( IN-CITY ?auto_12758 ?auto_12765 ) ( not ( = ?auto_12758 ?auto_12761 ) ) ( OBJ-AT ?auto_12759 ?auto_12758 ) ( not ( = ?auto_12759 ?auto_12760 ) ) ( OBJ-AT ?auto_12760 ?auto_12761 ) ( not ( = ?auto_12759 ?auto_12763 ) ) ( not ( = ?auto_12760 ?auto_12763 ) ) ( IN-CITY ?auto_12762 ?auto_12765 ) ( not ( = ?auto_12758 ?auto_12762 ) ) ( not ( = ?auto_12761 ?auto_12762 ) ) ( OBJ-AT ?auto_12763 ?auto_12762 ) ( TRUCK-AT ?auto_12764 ?auto_12758 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12760 ?auto_12758 )
      ( DELIVER-2PKG-VERIFY ?auto_12759 ?auto_12760 ?auto_12758 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12767 - OBJ
      ?auto_12768 - OBJ
      ?auto_12766 - LOCATION
    )
    :vars
    (
      ?auto_12769 - LOCATION
      ?auto_12770 - CITY
      ?auto_12773 - OBJ
      ?auto_12771 - LOCATION
      ?auto_12772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12769 ?auto_12770 ) ( IN-CITY ?auto_12766 ?auto_12770 ) ( not ( = ?auto_12766 ?auto_12769 ) ) ( OBJ-AT ?auto_12773 ?auto_12766 ) ( not ( = ?auto_12773 ?auto_12768 ) ) ( OBJ-AT ?auto_12768 ?auto_12769 ) ( not ( = ?auto_12773 ?auto_12767 ) ) ( not ( = ?auto_12768 ?auto_12767 ) ) ( IN-CITY ?auto_12771 ?auto_12770 ) ( not ( = ?auto_12766 ?auto_12771 ) ) ( not ( = ?auto_12769 ?auto_12771 ) ) ( OBJ-AT ?auto_12767 ?auto_12771 ) ( TRUCK-AT ?auto_12772 ?auto_12766 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12773 ?auto_12768 ?auto_12766 )
      ( DELIVER-2PKG-VERIFY ?auto_12767 ?auto_12768 ?auto_12766 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12775 - OBJ
      ?auto_12776 - OBJ
      ?auto_12774 - LOCATION
    )
    :vars
    (
      ?auto_12777 - LOCATION
      ?auto_12778 - CITY
      ?auto_12780 - OBJ
      ?auto_12779 - LOCATION
      ?auto_12781 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12777 ?auto_12778 ) ( IN-CITY ?auto_12774 ?auto_12778 ) ( not ( = ?auto_12774 ?auto_12777 ) ) ( OBJ-AT ?auto_12776 ?auto_12774 ) ( not ( = ?auto_12776 ?auto_12775 ) ) ( OBJ-AT ?auto_12775 ?auto_12777 ) ( not ( = ?auto_12776 ?auto_12780 ) ) ( not ( = ?auto_12775 ?auto_12780 ) ) ( IN-CITY ?auto_12779 ?auto_12778 ) ( not ( = ?auto_12774 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( OBJ-AT ?auto_12780 ?auto_12779 ) ( TRUCK-AT ?auto_12781 ?auto_12774 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12776 ?auto_12775 ?auto_12774 )
      ( DELIVER-2PKG-VERIFY ?auto_12775 ?auto_12776 ?auto_12774 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12783 - OBJ
      ?auto_12784 - OBJ
      ?auto_12782 - LOCATION
    )
    :vars
    (
      ?auto_12785 - LOCATION
      ?auto_12786 - CITY
      ?auto_12789 - OBJ
      ?auto_12787 - LOCATION
      ?auto_12788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12785 ?auto_12786 ) ( IN-CITY ?auto_12782 ?auto_12786 ) ( not ( = ?auto_12782 ?auto_12785 ) ) ( OBJ-AT ?auto_12789 ?auto_12782 ) ( not ( = ?auto_12789 ?auto_12783 ) ) ( OBJ-AT ?auto_12783 ?auto_12785 ) ( not ( = ?auto_12789 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( IN-CITY ?auto_12787 ?auto_12786 ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( OBJ-AT ?auto_12784 ?auto_12787 ) ( TRUCK-AT ?auto_12788 ?auto_12782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12789 ?auto_12783 ?auto_12782 )
      ( DELIVER-2PKG-VERIFY ?auto_12783 ?auto_12784 ?auto_12782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12800 - OBJ
      ?auto_12801 - OBJ
      ?auto_12802 - OBJ
      ?auto_12799 - LOCATION
    )
    :vars
    (
      ?auto_12803 - LOCATION
      ?auto_12804 - CITY
      ?auto_12806 - OBJ
      ?auto_12805 - LOCATION
      ?auto_12807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12803 ?auto_12804 ) ( IN-CITY ?auto_12799 ?auto_12804 ) ( not ( = ?auto_12799 ?auto_12803 ) ) ( OBJ-AT ?auto_12801 ?auto_12799 ) ( not ( = ?auto_12801 ?auto_12802 ) ) ( OBJ-AT ?auto_12802 ?auto_12803 ) ( not ( = ?auto_12801 ?auto_12806 ) ) ( not ( = ?auto_12802 ?auto_12806 ) ) ( IN-CITY ?auto_12805 ?auto_12804 ) ( not ( = ?auto_12799 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( OBJ-AT ?auto_12806 ?auto_12805 ) ( TRUCK-AT ?auto_12807 ?auto_12799 ) ( OBJ-AT ?auto_12800 ?auto_12799 ) ( not ( = ?auto_12800 ?auto_12801 ) ) ( not ( = ?auto_12800 ?auto_12802 ) ) ( not ( = ?auto_12800 ?auto_12806 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12801 ?auto_12802 ?auto_12799 )
      ( DELIVER-3PKG-VERIFY ?auto_12800 ?auto_12801 ?auto_12802 ?auto_12799 ) )
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
      ?auto_12812 - LOCATION
      ?auto_12813 - CITY
      ?auto_12814 - LOCATION
      ?auto_12815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12812 ?auto_12813 ) ( IN-CITY ?auto_12808 ?auto_12813 ) ( not ( = ?auto_12808 ?auto_12812 ) ) ( OBJ-AT ?auto_12809 ?auto_12808 ) ( not ( = ?auto_12809 ?auto_12811 ) ) ( OBJ-AT ?auto_12811 ?auto_12812 ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( not ( = ?auto_12811 ?auto_12810 ) ) ( IN-CITY ?auto_12814 ?auto_12813 ) ( not ( = ?auto_12808 ?auto_12814 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( OBJ-AT ?auto_12810 ?auto_12814 ) ( TRUCK-AT ?auto_12815 ?auto_12808 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12809 ?auto_12811 ?auto_12808 )
      ( DELIVER-3PKG-VERIFY ?auto_12809 ?auto_12810 ?auto_12811 ?auto_12808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12817 - OBJ
      ?auto_12818 - OBJ
      ?auto_12819 - OBJ
      ?auto_12816 - LOCATION
    )
    :vars
    (
      ?auto_12820 - LOCATION
      ?auto_12821 - CITY
      ?auto_12823 - OBJ
      ?auto_12822 - LOCATION
      ?auto_12824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12820 ?auto_12821 ) ( IN-CITY ?auto_12816 ?auto_12821 ) ( not ( = ?auto_12816 ?auto_12820 ) ) ( OBJ-AT ?auto_12819 ?auto_12816 ) ( not ( = ?auto_12819 ?auto_12818 ) ) ( OBJ-AT ?auto_12818 ?auto_12820 ) ( not ( = ?auto_12819 ?auto_12823 ) ) ( not ( = ?auto_12818 ?auto_12823 ) ) ( IN-CITY ?auto_12822 ?auto_12821 ) ( not ( = ?auto_12816 ?auto_12822 ) ) ( not ( = ?auto_12820 ?auto_12822 ) ) ( OBJ-AT ?auto_12823 ?auto_12822 ) ( TRUCK-AT ?auto_12824 ?auto_12816 ) ( OBJ-AT ?auto_12817 ?auto_12816 ) ( not ( = ?auto_12817 ?auto_12818 ) ) ( not ( = ?auto_12817 ?auto_12819 ) ) ( not ( = ?auto_12817 ?auto_12823 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12819 ?auto_12818 ?auto_12816 )
      ( DELIVER-3PKG-VERIFY ?auto_12817 ?auto_12818 ?auto_12819 ?auto_12816 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12826 - OBJ
      ?auto_12827 - OBJ
      ?auto_12828 - OBJ
      ?auto_12825 - LOCATION
    )
    :vars
    (
      ?auto_12829 - LOCATION
      ?auto_12830 - CITY
      ?auto_12831 - LOCATION
      ?auto_12832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12829 ?auto_12830 ) ( IN-CITY ?auto_12825 ?auto_12830 ) ( not ( = ?auto_12825 ?auto_12829 ) ) ( OBJ-AT ?auto_12826 ?auto_12825 ) ( not ( = ?auto_12826 ?auto_12827 ) ) ( OBJ-AT ?auto_12827 ?auto_12829 ) ( not ( = ?auto_12826 ?auto_12828 ) ) ( not ( = ?auto_12827 ?auto_12828 ) ) ( IN-CITY ?auto_12831 ?auto_12830 ) ( not ( = ?auto_12825 ?auto_12831 ) ) ( not ( = ?auto_12829 ?auto_12831 ) ) ( OBJ-AT ?auto_12828 ?auto_12831 ) ( TRUCK-AT ?auto_12832 ?auto_12825 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12826 ?auto_12827 ?auto_12825 )
      ( DELIVER-3PKG-VERIFY ?auto_12826 ?auto_12827 ?auto_12828 ?auto_12825 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12843 - OBJ
      ?auto_12844 - OBJ
      ?auto_12845 - OBJ
      ?auto_12842 - LOCATION
    )
    :vars
    (
      ?auto_12846 - LOCATION
      ?auto_12847 - CITY
      ?auto_12848 - LOCATION
      ?auto_12849 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12846 ?auto_12847 ) ( IN-CITY ?auto_12842 ?auto_12847 ) ( not ( = ?auto_12842 ?auto_12846 ) ) ( OBJ-AT ?auto_12844 ?auto_12842 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( OBJ-AT ?auto_12845 ?auto_12846 ) ( not ( = ?auto_12844 ?auto_12843 ) ) ( not ( = ?auto_12845 ?auto_12843 ) ) ( IN-CITY ?auto_12848 ?auto_12847 ) ( not ( = ?auto_12842 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( OBJ-AT ?auto_12843 ?auto_12848 ) ( TRUCK-AT ?auto_12849 ?auto_12842 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12844 ?auto_12845 ?auto_12842 )
      ( DELIVER-3PKG-VERIFY ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12860 - OBJ
      ?auto_12861 - OBJ
      ?auto_12862 - OBJ
      ?auto_12859 - LOCATION
    )
    :vars
    (
      ?auto_12863 - LOCATION
      ?auto_12864 - CITY
      ?auto_12865 - LOCATION
      ?auto_12866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12863 ?auto_12864 ) ( IN-CITY ?auto_12859 ?auto_12864 ) ( not ( = ?auto_12859 ?auto_12863 ) ) ( OBJ-AT ?auto_12862 ?auto_12859 ) ( not ( = ?auto_12862 ?auto_12861 ) ) ( OBJ-AT ?auto_12861 ?auto_12863 ) ( not ( = ?auto_12862 ?auto_12860 ) ) ( not ( = ?auto_12861 ?auto_12860 ) ) ( IN-CITY ?auto_12865 ?auto_12864 ) ( not ( = ?auto_12859 ?auto_12865 ) ) ( not ( = ?auto_12863 ?auto_12865 ) ) ( OBJ-AT ?auto_12860 ?auto_12865 ) ( TRUCK-AT ?auto_12866 ?auto_12859 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12862 ?auto_12861 ?auto_12859 )
      ( DELIVER-3PKG-VERIFY ?auto_12860 ?auto_12861 ?auto_12862 ?auto_12859 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12886 - OBJ
      ?auto_12887 - OBJ
      ?auto_12888 - OBJ
      ?auto_12885 - LOCATION
    )
    :vars
    (
      ?auto_12889 - LOCATION
      ?auto_12890 - CITY
      ?auto_12892 - OBJ
      ?auto_12891 - LOCATION
      ?auto_12893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12889 ?auto_12890 ) ( IN-CITY ?auto_12885 ?auto_12890 ) ( not ( = ?auto_12885 ?auto_12889 ) ) ( OBJ-AT ?auto_12888 ?auto_12885 ) ( not ( = ?auto_12888 ?auto_12886 ) ) ( OBJ-AT ?auto_12886 ?auto_12889 ) ( not ( = ?auto_12888 ?auto_12892 ) ) ( not ( = ?auto_12886 ?auto_12892 ) ) ( IN-CITY ?auto_12891 ?auto_12890 ) ( not ( = ?auto_12885 ?auto_12891 ) ) ( not ( = ?auto_12889 ?auto_12891 ) ) ( OBJ-AT ?auto_12892 ?auto_12891 ) ( TRUCK-AT ?auto_12893 ?auto_12885 ) ( OBJ-AT ?auto_12887 ?auto_12885 ) ( not ( = ?auto_12886 ?auto_12887 ) ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12887 ?auto_12892 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12888 ?auto_12886 ?auto_12885 )
      ( DELIVER-3PKG-VERIFY ?auto_12886 ?auto_12887 ?auto_12888 ?auto_12885 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12895 - OBJ
      ?auto_12896 - OBJ
      ?auto_12897 - OBJ
      ?auto_12894 - LOCATION
    )
    :vars
    (
      ?auto_12898 - LOCATION
      ?auto_12899 - CITY
      ?auto_12900 - LOCATION
      ?auto_12901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12898 ?auto_12899 ) ( IN-CITY ?auto_12894 ?auto_12899 ) ( not ( = ?auto_12894 ?auto_12898 ) ) ( OBJ-AT ?auto_12896 ?auto_12894 ) ( not ( = ?auto_12896 ?auto_12895 ) ) ( OBJ-AT ?auto_12895 ?auto_12898 ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( not ( = ?auto_12895 ?auto_12897 ) ) ( IN-CITY ?auto_12900 ?auto_12899 ) ( not ( = ?auto_12894 ?auto_12900 ) ) ( not ( = ?auto_12898 ?auto_12900 ) ) ( OBJ-AT ?auto_12897 ?auto_12900 ) ( TRUCK-AT ?auto_12901 ?auto_12894 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12896 ?auto_12895 ?auto_12894 )
      ( DELIVER-3PKG-VERIFY ?auto_12895 ?auto_12896 ?auto_12897 ?auto_12894 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12912 - OBJ
      ?auto_12913 - OBJ
      ?auto_12914 - OBJ
      ?auto_12911 - LOCATION
    )
    :vars
    (
      ?auto_12915 - LOCATION
      ?auto_12916 - CITY
      ?auto_12917 - LOCATION
      ?auto_12918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12915 ?auto_12916 ) ( IN-CITY ?auto_12911 ?auto_12916 ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( OBJ-AT ?auto_12914 ?auto_12911 ) ( not ( = ?auto_12914 ?auto_12912 ) ) ( OBJ-AT ?auto_12912 ?auto_12915 ) ( not ( = ?auto_12914 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( IN-CITY ?auto_12917 ?auto_12916 ) ( not ( = ?auto_12911 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( OBJ-AT ?auto_12913 ?auto_12917 ) ( TRUCK-AT ?auto_12918 ?auto_12911 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12914 ?auto_12912 ?auto_12911 )
      ( DELIVER-3PKG-VERIFY ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12911 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12966 - OBJ
      ?auto_12965 - LOCATION
    )
    :vars
    (
      ?auto_12967 - LOCATION
      ?auto_12968 - CITY
      ?auto_12972 - OBJ
      ?auto_12970 - OBJ
      ?auto_12969 - LOCATION
      ?auto_12971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12967 ?auto_12968 ) ( IN-CITY ?auto_12965 ?auto_12968 ) ( not ( = ?auto_12965 ?auto_12967 ) ) ( not ( = ?auto_12972 ?auto_12966 ) ) ( OBJ-AT ?auto_12966 ?auto_12967 ) ( not ( = ?auto_12972 ?auto_12970 ) ) ( not ( = ?auto_12966 ?auto_12970 ) ) ( IN-CITY ?auto_12969 ?auto_12968 ) ( not ( = ?auto_12965 ?auto_12969 ) ) ( not ( = ?auto_12967 ?auto_12969 ) ) ( OBJ-AT ?auto_12970 ?auto_12969 ) ( TRUCK-AT ?auto_12971 ?auto_12965 ) ( IN-TRUCK ?auto_12972 ?auto_12971 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12972 ?auto_12965 )
      ( DELIVER-2PKG ?auto_12972 ?auto_12966 ?auto_12965 )
      ( DELIVER-1PKG-VERIFY ?auto_12966 ?auto_12965 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12974 - OBJ
      ?auto_12975 - OBJ
      ?auto_12973 - LOCATION
    )
    :vars
    (
      ?auto_12979 - LOCATION
      ?auto_12976 - CITY
      ?auto_12978 - OBJ
      ?auto_12977 - LOCATION
      ?auto_12980 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12979 ?auto_12976 ) ( IN-CITY ?auto_12973 ?auto_12976 ) ( not ( = ?auto_12973 ?auto_12979 ) ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( OBJ-AT ?auto_12975 ?auto_12979 ) ( not ( = ?auto_12974 ?auto_12978 ) ) ( not ( = ?auto_12975 ?auto_12978 ) ) ( IN-CITY ?auto_12977 ?auto_12976 ) ( not ( = ?auto_12973 ?auto_12977 ) ) ( not ( = ?auto_12979 ?auto_12977 ) ) ( OBJ-AT ?auto_12978 ?auto_12977 ) ( TRUCK-AT ?auto_12980 ?auto_12973 ) ( IN-TRUCK ?auto_12974 ?auto_12980 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12975 ?auto_12973 )
      ( DELIVER-2PKG-VERIFY ?auto_12974 ?auto_12975 ?auto_12973 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12982 - OBJ
      ?auto_12983 - OBJ
      ?auto_12981 - LOCATION
    )
    :vars
    (
      ?auto_12985 - LOCATION
      ?auto_12987 - CITY
      ?auto_12988 - OBJ
      ?auto_12986 - LOCATION
      ?auto_12984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12985 ?auto_12987 ) ( IN-CITY ?auto_12981 ?auto_12987 ) ( not ( = ?auto_12981 ?auto_12985 ) ) ( not ( = ?auto_12988 ?auto_12983 ) ) ( OBJ-AT ?auto_12983 ?auto_12985 ) ( not ( = ?auto_12988 ?auto_12982 ) ) ( not ( = ?auto_12983 ?auto_12982 ) ) ( IN-CITY ?auto_12986 ?auto_12987 ) ( not ( = ?auto_12981 ?auto_12986 ) ) ( not ( = ?auto_12985 ?auto_12986 ) ) ( OBJ-AT ?auto_12982 ?auto_12986 ) ( TRUCK-AT ?auto_12984 ?auto_12981 ) ( IN-TRUCK ?auto_12988 ?auto_12984 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12988 ?auto_12983 ?auto_12981 )
      ( DELIVER-2PKG-VERIFY ?auto_12982 ?auto_12983 ?auto_12981 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12990 - OBJ
      ?auto_12991 - OBJ
      ?auto_12989 - LOCATION
    )
    :vars
    (
      ?auto_12993 - LOCATION
      ?auto_12996 - CITY
      ?auto_12994 - OBJ
      ?auto_12995 - LOCATION
      ?auto_12992 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12993 ?auto_12996 ) ( IN-CITY ?auto_12989 ?auto_12996 ) ( not ( = ?auto_12989 ?auto_12993 ) ) ( not ( = ?auto_12991 ?auto_12990 ) ) ( OBJ-AT ?auto_12990 ?auto_12993 ) ( not ( = ?auto_12991 ?auto_12994 ) ) ( not ( = ?auto_12990 ?auto_12994 ) ) ( IN-CITY ?auto_12995 ?auto_12996 ) ( not ( = ?auto_12989 ?auto_12995 ) ) ( not ( = ?auto_12993 ?auto_12995 ) ) ( OBJ-AT ?auto_12994 ?auto_12995 ) ( TRUCK-AT ?auto_12992 ?auto_12989 ) ( IN-TRUCK ?auto_12991 ?auto_12992 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12991 ?auto_12990 ?auto_12989 )
      ( DELIVER-2PKG-VERIFY ?auto_12990 ?auto_12991 ?auto_12989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12998 - OBJ
      ?auto_12999 - OBJ
      ?auto_12997 - LOCATION
    )
    :vars
    (
      ?auto_13001 - LOCATION
      ?auto_13003 - CITY
      ?auto_13004 - OBJ
      ?auto_13002 - LOCATION
      ?auto_13000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13001 ?auto_13003 ) ( IN-CITY ?auto_12997 ?auto_13003 ) ( not ( = ?auto_12997 ?auto_13001 ) ) ( not ( = ?auto_13004 ?auto_12998 ) ) ( OBJ-AT ?auto_12998 ?auto_13001 ) ( not ( = ?auto_13004 ?auto_12999 ) ) ( not ( = ?auto_12998 ?auto_12999 ) ) ( IN-CITY ?auto_13002 ?auto_13003 ) ( not ( = ?auto_12997 ?auto_13002 ) ) ( not ( = ?auto_13001 ?auto_13002 ) ) ( OBJ-AT ?auto_12999 ?auto_13002 ) ( TRUCK-AT ?auto_13000 ?auto_12997 ) ( IN-TRUCK ?auto_13004 ?auto_13000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13004 ?auto_12998 ?auto_12997 )
      ( DELIVER-2PKG-VERIFY ?auto_12998 ?auto_12999 ?auto_12997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13024 - OBJ
      ?auto_13025 - OBJ
      ?auto_13026 - OBJ
      ?auto_13023 - LOCATION
    )
    :vars
    (
      ?auto_13028 - LOCATION
      ?auto_13030 - CITY
      ?auto_13029 - LOCATION
      ?auto_13027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13028 ?auto_13030 ) ( IN-CITY ?auto_13023 ?auto_13030 ) ( not ( = ?auto_13023 ?auto_13028 ) ) ( not ( = ?auto_13024 ?auto_13026 ) ) ( OBJ-AT ?auto_13026 ?auto_13028 ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( not ( = ?auto_13026 ?auto_13025 ) ) ( IN-CITY ?auto_13029 ?auto_13030 ) ( not ( = ?auto_13023 ?auto_13029 ) ) ( not ( = ?auto_13028 ?auto_13029 ) ) ( OBJ-AT ?auto_13025 ?auto_13029 ) ( TRUCK-AT ?auto_13027 ?auto_13023 ) ( IN-TRUCK ?auto_13024 ?auto_13027 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13024 ?auto_13026 ?auto_13023 )
      ( DELIVER-3PKG-VERIFY ?auto_13024 ?auto_13025 ?auto_13026 ?auto_13023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13041 - OBJ
      ?auto_13042 - OBJ
      ?auto_13043 - OBJ
      ?auto_13040 - LOCATION
    )
    :vars
    (
      ?auto_13045 - LOCATION
      ?auto_13047 - CITY
      ?auto_13046 - LOCATION
      ?auto_13044 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13045 ?auto_13047 ) ( IN-CITY ?auto_13040 ?auto_13047 ) ( not ( = ?auto_13040 ?auto_13045 ) ) ( not ( = ?auto_13041 ?auto_13042 ) ) ( OBJ-AT ?auto_13042 ?auto_13045 ) ( not ( = ?auto_13041 ?auto_13043 ) ) ( not ( = ?auto_13042 ?auto_13043 ) ) ( IN-CITY ?auto_13046 ?auto_13047 ) ( not ( = ?auto_13040 ?auto_13046 ) ) ( not ( = ?auto_13045 ?auto_13046 ) ) ( OBJ-AT ?auto_13043 ?auto_13046 ) ( TRUCK-AT ?auto_13044 ?auto_13040 ) ( IN-TRUCK ?auto_13041 ?auto_13044 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13041 ?auto_13042 ?auto_13040 )
      ( DELIVER-3PKG-VERIFY ?auto_13041 ?auto_13042 ?auto_13043 ?auto_13040 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13058 - OBJ
      ?auto_13059 - OBJ
      ?auto_13060 - OBJ
      ?auto_13057 - LOCATION
    )
    :vars
    (
      ?auto_13062 - LOCATION
      ?auto_13064 - CITY
      ?auto_13063 - LOCATION
      ?auto_13061 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13062 ?auto_13064 ) ( IN-CITY ?auto_13057 ?auto_13064 ) ( not ( = ?auto_13057 ?auto_13062 ) ) ( not ( = ?auto_13059 ?auto_13060 ) ) ( OBJ-AT ?auto_13060 ?auto_13062 ) ( not ( = ?auto_13059 ?auto_13058 ) ) ( not ( = ?auto_13060 ?auto_13058 ) ) ( IN-CITY ?auto_13063 ?auto_13064 ) ( not ( = ?auto_13057 ?auto_13063 ) ) ( not ( = ?auto_13062 ?auto_13063 ) ) ( OBJ-AT ?auto_13058 ?auto_13063 ) ( TRUCK-AT ?auto_13061 ?auto_13057 ) ( IN-TRUCK ?auto_13059 ?auto_13061 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13059 ?auto_13060 ?auto_13057 )
      ( DELIVER-3PKG-VERIFY ?auto_13058 ?auto_13059 ?auto_13060 ?auto_13057 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13075 - OBJ
      ?auto_13076 - OBJ
      ?auto_13077 - OBJ
      ?auto_13074 - LOCATION
    )
    :vars
    (
      ?auto_13079 - LOCATION
      ?auto_13081 - CITY
      ?auto_13080 - LOCATION
      ?auto_13078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13079 ?auto_13081 ) ( IN-CITY ?auto_13074 ?auto_13081 ) ( not ( = ?auto_13074 ?auto_13079 ) ) ( not ( = ?auto_13077 ?auto_13076 ) ) ( OBJ-AT ?auto_13076 ?auto_13079 ) ( not ( = ?auto_13077 ?auto_13075 ) ) ( not ( = ?auto_13076 ?auto_13075 ) ) ( IN-CITY ?auto_13080 ?auto_13081 ) ( not ( = ?auto_13074 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) ( OBJ-AT ?auto_13075 ?auto_13080 ) ( TRUCK-AT ?auto_13078 ?auto_13074 ) ( IN-TRUCK ?auto_13077 ?auto_13078 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13077 ?auto_13076 ?auto_13074 )
      ( DELIVER-3PKG-VERIFY ?auto_13075 ?auto_13076 ?auto_13077 ?auto_13074 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13110 - OBJ
      ?auto_13111 - OBJ
      ?auto_13112 - OBJ
      ?auto_13109 - LOCATION
    )
    :vars
    (
      ?auto_13114 - LOCATION
      ?auto_13116 - CITY
      ?auto_13115 - LOCATION
      ?auto_13113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13114 ?auto_13116 ) ( IN-CITY ?auto_13109 ?auto_13116 ) ( not ( = ?auto_13109 ?auto_13114 ) ) ( not ( = ?auto_13111 ?auto_13110 ) ) ( OBJ-AT ?auto_13110 ?auto_13114 ) ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13110 ?auto_13112 ) ) ( IN-CITY ?auto_13115 ?auto_13116 ) ( not ( = ?auto_13109 ?auto_13115 ) ) ( not ( = ?auto_13114 ?auto_13115 ) ) ( OBJ-AT ?auto_13112 ?auto_13115 ) ( TRUCK-AT ?auto_13113 ?auto_13109 ) ( IN-TRUCK ?auto_13111 ?auto_13113 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13111 ?auto_13110 ?auto_13109 )
      ( DELIVER-3PKG-VERIFY ?auto_13110 ?auto_13111 ?auto_13112 ?auto_13109 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13127 - OBJ
      ?auto_13128 - OBJ
      ?auto_13129 - OBJ
      ?auto_13126 - LOCATION
    )
    :vars
    (
      ?auto_13131 - LOCATION
      ?auto_13133 - CITY
      ?auto_13132 - LOCATION
      ?auto_13130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13131 ?auto_13133 ) ( IN-CITY ?auto_13126 ?auto_13133 ) ( not ( = ?auto_13126 ?auto_13131 ) ) ( not ( = ?auto_13129 ?auto_13127 ) ) ( OBJ-AT ?auto_13127 ?auto_13131 ) ( not ( = ?auto_13129 ?auto_13128 ) ) ( not ( = ?auto_13127 ?auto_13128 ) ) ( IN-CITY ?auto_13132 ?auto_13133 ) ( not ( = ?auto_13126 ?auto_13132 ) ) ( not ( = ?auto_13131 ?auto_13132 ) ) ( OBJ-AT ?auto_13128 ?auto_13132 ) ( TRUCK-AT ?auto_13130 ?auto_13126 ) ( IN-TRUCK ?auto_13129 ?auto_13130 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13129 ?auto_13127 ?auto_13126 )
      ( DELIVER-3PKG-VERIFY ?auto_13127 ?auto_13128 ?auto_13129 ?auto_13126 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13181 - OBJ
      ?auto_13180 - LOCATION
    )
    :vars
    (
      ?auto_13183 - LOCATION
      ?auto_13186 - CITY
      ?auto_13187 - OBJ
      ?auto_13184 - OBJ
      ?auto_13185 - LOCATION
      ?auto_13182 - TRUCK
      ?auto_13188 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13183 ?auto_13186 ) ( IN-CITY ?auto_13180 ?auto_13186 ) ( not ( = ?auto_13180 ?auto_13183 ) ) ( not ( = ?auto_13187 ?auto_13181 ) ) ( OBJ-AT ?auto_13181 ?auto_13183 ) ( not ( = ?auto_13187 ?auto_13184 ) ) ( not ( = ?auto_13181 ?auto_13184 ) ) ( IN-CITY ?auto_13185 ?auto_13186 ) ( not ( = ?auto_13180 ?auto_13185 ) ) ( not ( = ?auto_13183 ?auto_13185 ) ) ( OBJ-AT ?auto_13184 ?auto_13185 ) ( IN-TRUCK ?auto_13187 ?auto_13182 ) ( TRUCK-AT ?auto_13182 ?auto_13188 ) ( IN-CITY ?auto_13188 ?auto_13186 ) ( not ( = ?auto_13180 ?auto_13188 ) ) ( not ( = ?auto_13183 ?auto_13188 ) ) ( not ( = ?auto_13185 ?auto_13188 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13182 ?auto_13188 ?auto_13180 ?auto_13186 )
      ( DELIVER-2PKG ?auto_13187 ?auto_13181 ?auto_13180 )
      ( DELIVER-1PKG-VERIFY ?auto_13181 ?auto_13180 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13190 - OBJ
      ?auto_13191 - OBJ
      ?auto_13189 - LOCATION
    )
    :vars
    (
      ?auto_13196 - LOCATION
      ?auto_13194 - CITY
      ?auto_13192 - OBJ
      ?auto_13197 - LOCATION
      ?auto_13193 - TRUCK
      ?auto_13195 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13196 ?auto_13194 ) ( IN-CITY ?auto_13189 ?auto_13194 ) ( not ( = ?auto_13189 ?auto_13196 ) ) ( not ( = ?auto_13190 ?auto_13191 ) ) ( OBJ-AT ?auto_13191 ?auto_13196 ) ( not ( = ?auto_13190 ?auto_13192 ) ) ( not ( = ?auto_13191 ?auto_13192 ) ) ( IN-CITY ?auto_13197 ?auto_13194 ) ( not ( = ?auto_13189 ?auto_13197 ) ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( OBJ-AT ?auto_13192 ?auto_13197 ) ( IN-TRUCK ?auto_13190 ?auto_13193 ) ( TRUCK-AT ?auto_13193 ?auto_13195 ) ( IN-CITY ?auto_13195 ?auto_13194 ) ( not ( = ?auto_13189 ?auto_13195 ) ) ( not ( = ?auto_13196 ?auto_13195 ) ) ( not ( = ?auto_13197 ?auto_13195 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13191 ?auto_13189 )
      ( DELIVER-2PKG-VERIFY ?auto_13190 ?auto_13191 ?auto_13189 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13199 - OBJ
      ?auto_13200 - OBJ
      ?auto_13198 - LOCATION
    )
    :vars
    (
      ?auto_13204 - LOCATION
      ?auto_13205 - CITY
      ?auto_13206 - OBJ
      ?auto_13203 - LOCATION
      ?auto_13202 - TRUCK
      ?auto_13201 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13204 ?auto_13205 ) ( IN-CITY ?auto_13198 ?auto_13205 ) ( not ( = ?auto_13198 ?auto_13204 ) ) ( not ( = ?auto_13206 ?auto_13200 ) ) ( OBJ-AT ?auto_13200 ?auto_13204 ) ( not ( = ?auto_13206 ?auto_13199 ) ) ( not ( = ?auto_13200 ?auto_13199 ) ) ( IN-CITY ?auto_13203 ?auto_13205 ) ( not ( = ?auto_13198 ?auto_13203 ) ) ( not ( = ?auto_13204 ?auto_13203 ) ) ( OBJ-AT ?auto_13199 ?auto_13203 ) ( IN-TRUCK ?auto_13206 ?auto_13202 ) ( TRUCK-AT ?auto_13202 ?auto_13201 ) ( IN-CITY ?auto_13201 ?auto_13205 ) ( not ( = ?auto_13198 ?auto_13201 ) ) ( not ( = ?auto_13204 ?auto_13201 ) ) ( not ( = ?auto_13203 ?auto_13201 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13206 ?auto_13200 ?auto_13198 )
      ( DELIVER-2PKG-VERIFY ?auto_13199 ?auto_13200 ?auto_13198 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13208 - OBJ
      ?auto_13209 - OBJ
      ?auto_13207 - LOCATION
    )
    :vars
    (
      ?auto_13214 - LOCATION
      ?auto_13215 - CITY
      ?auto_13211 - OBJ
      ?auto_13213 - LOCATION
      ?auto_13212 - TRUCK
      ?auto_13210 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13214 ?auto_13215 ) ( IN-CITY ?auto_13207 ?auto_13215 ) ( not ( = ?auto_13207 ?auto_13214 ) ) ( not ( = ?auto_13209 ?auto_13208 ) ) ( OBJ-AT ?auto_13208 ?auto_13214 ) ( not ( = ?auto_13209 ?auto_13211 ) ) ( not ( = ?auto_13208 ?auto_13211 ) ) ( IN-CITY ?auto_13213 ?auto_13215 ) ( not ( = ?auto_13207 ?auto_13213 ) ) ( not ( = ?auto_13214 ?auto_13213 ) ) ( OBJ-AT ?auto_13211 ?auto_13213 ) ( IN-TRUCK ?auto_13209 ?auto_13212 ) ( TRUCK-AT ?auto_13212 ?auto_13210 ) ( IN-CITY ?auto_13210 ?auto_13215 ) ( not ( = ?auto_13207 ?auto_13210 ) ) ( not ( = ?auto_13214 ?auto_13210 ) ) ( not ( = ?auto_13213 ?auto_13210 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13209 ?auto_13208 ?auto_13207 )
      ( DELIVER-2PKG-VERIFY ?auto_13208 ?auto_13209 ?auto_13207 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13217 - OBJ
      ?auto_13218 - OBJ
      ?auto_13216 - LOCATION
    )
    :vars
    (
      ?auto_13222 - LOCATION
      ?auto_13223 - CITY
      ?auto_13224 - OBJ
      ?auto_13221 - LOCATION
      ?auto_13220 - TRUCK
      ?auto_13219 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13222 ?auto_13223 ) ( IN-CITY ?auto_13216 ?auto_13223 ) ( not ( = ?auto_13216 ?auto_13222 ) ) ( not ( = ?auto_13224 ?auto_13217 ) ) ( OBJ-AT ?auto_13217 ?auto_13222 ) ( not ( = ?auto_13224 ?auto_13218 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( IN-CITY ?auto_13221 ?auto_13223 ) ( not ( = ?auto_13216 ?auto_13221 ) ) ( not ( = ?auto_13222 ?auto_13221 ) ) ( OBJ-AT ?auto_13218 ?auto_13221 ) ( IN-TRUCK ?auto_13224 ?auto_13220 ) ( TRUCK-AT ?auto_13220 ?auto_13219 ) ( IN-CITY ?auto_13219 ?auto_13223 ) ( not ( = ?auto_13216 ?auto_13219 ) ) ( not ( = ?auto_13222 ?auto_13219 ) ) ( not ( = ?auto_13221 ?auto_13219 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13224 ?auto_13217 ?auto_13216 )
      ( DELIVER-2PKG-VERIFY ?auto_13217 ?auto_13218 ?auto_13216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13246 - OBJ
      ?auto_13247 - OBJ
      ?auto_13248 - OBJ
      ?auto_13245 - LOCATION
    )
    :vars
    (
      ?auto_13252 - LOCATION
      ?auto_13253 - CITY
      ?auto_13251 - LOCATION
      ?auto_13250 - TRUCK
      ?auto_13249 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13252 ?auto_13253 ) ( IN-CITY ?auto_13245 ?auto_13253 ) ( not ( = ?auto_13245 ?auto_13252 ) ) ( not ( = ?auto_13246 ?auto_13248 ) ) ( OBJ-AT ?auto_13248 ?auto_13252 ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13248 ?auto_13247 ) ) ( IN-CITY ?auto_13251 ?auto_13253 ) ( not ( = ?auto_13245 ?auto_13251 ) ) ( not ( = ?auto_13252 ?auto_13251 ) ) ( OBJ-AT ?auto_13247 ?auto_13251 ) ( IN-TRUCK ?auto_13246 ?auto_13250 ) ( TRUCK-AT ?auto_13250 ?auto_13249 ) ( IN-CITY ?auto_13249 ?auto_13253 ) ( not ( = ?auto_13245 ?auto_13249 ) ) ( not ( = ?auto_13252 ?auto_13249 ) ) ( not ( = ?auto_13251 ?auto_13249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13246 ?auto_13248 ?auto_13245 )
      ( DELIVER-3PKG-VERIFY ?auto_13246 ?auto_13247 ?auto_13248 ?auto_13245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13265 - OBJ
      ?auto_13266 - OBJ
      ?auto_13267 - OBJ
      ?auto_13264 - LOCATION
    )
    :vars
    (
      ?auto_13271 - LOCATION
      ?auto_13272 - CITY
      ?auto_13270 - LOCATION
      ?auto_13269 - TRUCK
      ?auto_13268 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13271 ?auto_13272 ) ( IN-CITY ?auto_13264 ?auto_13272 ) ( not ( = ?auto_13264 ?auto_13271 ) ) ( not ( = ?auto_13265 ?auto_13266 ) ) ( OBJ-AT ?auto_13266 ?auto_13271 ) ( not ( = ?auto_13265 ?auto_13267 ) ) ( not ( = ?auto_13266 ?auto_13267 ) ) ( IN-CITY ?auto_13270 ?auto_13272 ) ( not ( = ?auto_13264 ?auto_13270 ) ) ( not ( = ?auto_13271 ?auto_13270 ) ) ( OBJ-AT ?auto_13267 ?auto_13270 ) ( IN-TRUCK ?auto_13265 ?auto_13269 ) ( TRUCK-AT ?auto_13269 ?auto_13268 ) ( IN-CITY ?auto_13268 ?auto_13272 ) ( not ( = ?auto_13264 ?auto_13268 ) ) ( not ( = ?auto_13271 ?auto_13268 ) ) ( not ( = ?auto_13270 ?auto_13268 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13265 ?auto_13266 ?auto_13264 )
      ( DELIVER-3PKG-VERIFY ?auto_13265 ?auto_13266 ?auto_13267 ?auto_13264 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13284 - OBJ
      ?auto_13285 - OBJ
      ?auto_13286 - OBJ
      ?auto_13283 - LOCATION
    )
    :vars
    (
      ?auto_13290 - LOCATION
      ?auto_13291 - CITY
      ?auto_13289 - LOCATION
      ?auto_13288 - TRUCK
      ?auto_13287 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13290 ?auto_13291 ) ( IN-CITY ?auto_13283 ?auto_13291 ) ( not ( = ?auto_13283 ?auto_13290 ) ) ( not ( = ?auto_13285 ?auto_13286 ) ) ( OBJ-AT ?auto_13286 ?auto_13290 ) ( not ( = ?auto_13285 ?auto_13284 ) ) ( not ( = ?auto_13286 ?auto_13284 ) ) ( IN-CITY ?auto_13289 ?auto_13291 ) ( not ( = ?auto_13283 ?auto_13289 ) ) ( not ( = ?auto_13290 ?auto_13289 ) ) ( OBJ-AT ?auto_13284 ?auto_13289 ) ( IN-TRUCK ?auto_13285 ?auto_13288 ) ( TRUCK-AT ?auto_13288 ?auto_13287 ) ( IN-CITY ?auto_13287 ?auto_13291 ) ( not ( = ?auto_13283 ?auto_13287 ) ) ( not ( = ?auto_13290 ?auto_13287 ) ) ( not ( = ?auto_13289 ?auto_13287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13285 ?auto_13286 ?auto_13283 )
      ( DELIVER-3PKG-VERIFY ?auto_13284 ?auto_13285 ?auto_13286 ?auto_13283 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13303 - OBJ
      ?auto_13304 - OBJ
      ?auto_13305 - OBJ
      ?auto_13302 - LOCATION
    )
    :vars
    (
      ?auto_13309 - LOCATION
      ?auto_13310 - CITY
      ?auto_13308 - LOCATION
      ?auto_13307 - TRUCK
      ?auto_13306 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13309 ?auto_13310 ) ( IN-CITY ?auto_13302 ?auto_13310 ) ( not ( = ?auto_13302 ?auto_13309 ) ) ( not ( = ?auto_13305 ?auto_13304 ) ) ( OBJ-AT ?auto_13304 ?auto_13309 ) ( not ( = ?auto_13305 ?auto_13303 ) ) ( not ( = ?auto_13304 ?auto_13303 ) ) ( IN-CITY ?auto_13308 ?auto_13310 ) ( not ( = ?auto_13302 ?auto_13308 ) ) ( not ( = ?auto_13309 ?auto_13308 ) ) ( OBJ-AT ?auto_13303 ?auto_13308 ) ( IN-TRUCK ?auto_13305 ?auto_13307 ) ( TRUCK-AT ?auto_13307 ?auto_13306 ) ( IN-CITY ?auto_13306 ?auto_13310 ) ( not ( = ?auto_13302 ?auto_13306 ) ) ( not ( = ?auto_13309 ?auto_13306 ) ) ( not ( = ?auto_13308 ?auto_13306 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13305 ?auto_13304 ?auto_13302 )
      ( DELIVER-3PKG-VERIFY ?auto_13303 ?auto_13304 ?auto_13305 ?auto_13302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13342 - OBJ
      ?auto_13343 - OBJ
      ?auto_13344 - OBJ
      ?auto_13341 - LOCATION
    )
    :vars
    (
      ?auto_13348 - LOCATION
      ?auto_13349 - CITY
      ?auto_13347 - LOCATION
      ?auto_13346 - TRUCK
      ?auto_13345 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13348 ?auto_13349 ) ( IN-CITY ?auto_13341 ?auto_13349 ) ( not ( = ?auto_13341 ?auto_13348 ) ) ( not ( = ?auto_13343 ?auto_13342 ) ) ( OBJ-AT ?auto_13342 ?auto_13348 ) ( not ( = ?auto_13343 ?auto_13344 ) ) ( not ( = ?auto_13342 ?auto_13344 ) ) ( IN-CITY ?auto_13347 ?auto_13349 ) ( not ( = ?auto_13341 ?auto_13347 ) ) ( not ( = ?auto_13348 ?auto_13347 ) ) ( OBJ-AT ?auto_13344 ?auto_13347 ) ( IN-TRUCK ?auto_13343 ?auto_13346 ) ( TRUCK-AT ?auto_13346 ?auto_13345 ) ( IN-CITY ?auto_13345 ?auto_13349 ) ( not ( = ?auto_13341 ?auto_13345 ) ) ( not ( = ?auto_13348 ?auto_13345 ) ) ( not ( = ?auto_13347 ?auto_13345 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13343 ?auto_13342 ?auto_13341 )
      ( DELIVER-3PKG-VERIFY ?auto_13342 ?auto_13343 ?auto_13344 ?auto_13341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13361 - OBJ
      ?auto_13362 - OBJ
      ?auto_13363 - OBJ
      ?auto_13360 - LOCATION
    )
    :vars
    (
      ?auto_13367 - LOCATION
      ?auto_13368 - CITY
      ?auto_13366 - LOCATION
      ?auto_13365 - TRUCK
      ?auto_13364 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13367 ?auto_13368 ) ( IN-CITY ?auto_13360 ?auto_13368 ) ( not ( = ?auto_13360 ?auto_13367 ) ) ( not ( = ?auto_13363 ?auto_13361 ) ) ( OBJ-AT ?auto_13361 ?auto_13367 ) ( not ( = ?auto_13363 ?auto_13362 ) ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( IN-CITY ?auto_13366 ?auto_13368 ) ( not ( = ?auto_13360 ?auto_13366 ) ) ( not ( = ?auto_13367 ?auto_13366 ) ) ( OBJ-AT ?auto_13362 ?auto_13366 ) ( IN-TRUCK ?auto_13363 ?auto_13365 ) ( TRUCK-AT ?auto_13365 ?auto_13364 ) ( IN-CITY ?auto_13364 ?auto_13368 ) ( not ( = ?auto_13360 ?auto_13364 ) ) ( not ( = ?auto_13367 ?auto_13364 ) ) ( not ( = ?auto_13366 ?auto_13364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13363 ?auto_13361 ?auto_13360 )
      ( DELIVER-3PKG-VERIFY ?auto_13361 ?auto_13362 ?auto_13363 ?auto_13360 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13421 - OBJ
      ?auto_13420 - LOCATION
    )
    :vars
    (
      ?auto_13426 - LOCATION
      ?auto_13427 - CITY
      ?auto_13428 - OBJ
      ?auto_13423 - OBJ
      ?auto_13425 - LOCATION
      ?auto_13424 - TRUCK
      ?auto_13422 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13426 ?auto_13427 ) ( IN-CITY ?auto_13420 ?auto_13427 ) ( not ( = ?auto_13420 ?auto_13426 ) ) ( not ( = ?auto_13428 ?auto_13421 ) ) ( OBJ-AT ?auto_13421 ?auto_13426 ) ( not ( = ?auto_13428 ?auto_13423 ) ) ( not ( = ?auto_13421 ?auto_13423 ) ) ( IN-CITY ?auto_13425 ?auto_13427 ) ( not ( = ?auto_13420 ?auto_13425 ) ) ( not ( = ?auto_13426 ?auto_13425 ) ) ( OBJ-AT ?auto_13423 ?auto_13425 ) ( TRUCK-AT ?auto_13424 ?auto_13422 ) ( IN-CITY ?auto_13422 ?auto_13427 ) ( not ( = ?auto_13420 ?auto_13422 ) ) ( not ( = ?auto_13426 ?auto_13422 ) ) ( not ( = ?auto_13425 ?auto_13422 ) ) ( OBJ-AT ?auto_13428 ?auto_13422 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13428 ?auto_13424 ?auto_13422 )
      ( DELIVER-2PKG ?auto_13428 ?auto_13421 ?auto_13420 )
      ( DELIVER-1PKG-VERIFY ?auto_13421 ?auto_13420 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13430 - OBJ
      ?auto_13431 - OBJ
      ?auto_13429 - LOCATION
    )
    :vars
    (
      ?auto_13436 - LOCATION
      ?auto_13432 - CITY
      ?auto_13433 - OBJ
      ?auto_13437 - LOCATION
      ?auto_13435 - TRUCK
      ?auto_13434 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13436 ?auto_13432 ) ( IN-CITY ?auto_13429 ?auto_13432 ) ( not ( = ?auto_13429 ?auto_13436 ) ) ( not ( = ?auto_13430 ?auto_13431 ) ) ( OBJ-AT ?auto_13431 ?auto_13436 ) ( not ( = ?auto_13430 ?auto_13433 ) ) ( not ( = ?auto_13431 ?auto_13433 ) ) ( IN-CITY ?auto_13437 ?auto_13432 ) ( not ( = ?auto_13429 ?auto_13437 ) ) ( not ( = ?auto_13436 ?auto_13437 ) ) ( OBJ-AT ?auto_13433 ?auto_13437 ) ( TRUCK-AT ?auto_13435 ?auto_13434 ) ( IN-CITY ?auto_13434 ?auto_13432 ) ( not ( = ?auto_13429 ?auto_13434 ) ) ( not ( = ?auto_13436 ?auto_13434 ) ) ( not ( = ?auto_13437 ?auto_13434 ) ) ( OBJ-AT ?auto_13430 ?auto_13434 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13431 ?auto_13429 )
      ( DELIVER-2PKG-VERIFY ?auto_13430 ?auto_13431 ?auto_13429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13439 - OBJ
      ?auto_13440 - OBJ
      ?auto_13438 - LOCATION
    )
    :vars
    (
      ?auto_13441 - LOCATION
      ?auto_13445 - CITY
      ?auto_13446 - OBJ
      ?auto_13443 - LOCATION
      ?auto_13444 - TRUCK
      ?auto_13442 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13441 ?auto_13445 ) ( IN-CITY ?auto_13438 ?auto_13445 ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13446 ?auto_13440 ) ) ( OBJ-AT ?auto_13440 ?auto_13441 ) ( not ( = ?auto_13446 ?auto_13439 ) ) ( not ( = ?auto_13440 ?auto_13439 ) ) ( IN-CITY ?auto_13443 ?auto_13445 ) ( not ( = ?auto_13438 ?auto_13443 ) ) ( not ( = ?auto_13441 ?auto_13443 ) ) ( OBJ-AT ?auto_13439 ?auto_13443 ) ( TRUCK-AT ?auto_13444 ?auto_13442 ) ( IN-CITY ?auto_13442 ?auto_13445 ) ( not ( = ?auto_13438 ?auto_13442 ) ) ( not ( = ?auto_13441 ?auto_13442 ) ) ( not ( = ?auto_13443 ?auto_13442 ) ) ( OBJ-AT ?auto_13446 ?auto_13442 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13446 ?auto_13440 ?auto_13438 )
      ( DELIVER-2PKG-VERIFY ?auto_13439 ?auto_13440 ?auto_13438 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13448 - OBJ
      ?auto_13449 - OBJ
      ?auto_13447 - LOCATION
    )
    :vars
    (
      ?auto_13451 - LOCATION
      ?auto_13455 - CITY
      ?auto_13450 - OBJ
      ?auto_13453 - LOCATION
      ?auto_13454 - TRUCK
      ?auto_13452 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13451 ?auto_13455 ) ( IN-CITY ?auto_13447 ?auto_13455 ) ( not ( = ?auto_13447 ?auto_13451 ) ) ( not ( = ?auto_13449 ?auto_13448 ) ) ( OBJ-AT ?auto_13448 ?auto_13451 ) ( not ( = ?auto_13449 ?auto_13450 ) ) ( not ( = ?auto_13448 ?auto_13450 ) ) ( IN-CITY ?auto_13453 ?auto_13455 ) ( not ( = ?auto_13447 ?auto_13453 ) ) ( not ( = ?auto_13451 ?auto_13453 ) ) ( OBJ-AT ?auto_13450 ?auto_13453 ) ( TRUCK-AT ?auto_13454 ?auto_13452 ) ( IN-CITY ?auto_13452 ?auto_13455 ) ( not ( = ?auto_13447 ?auto_13452 ) ) ( not ( = ?auto_13451 ?auto_13452 ) ) ( not ( = ?auto_13453 ?auto_13452 ) ) ( OBJ-AT ?auto_13449 ?auto_13452 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13449 ?auto_13448 ?auto_13447 )
      ( DELIVER-2PKG-VERIFY ?auto_13448 ?auto_13449 ?auto_13447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13457 - OBJ
      ?auto_13458 - OBJ
      ?auto_13456 - LOCATION
    )
    :vars
    (
      ?auto_13459 - LOCATION
      ?auto_13463 - CITY
      ?auto_13464 - OBJ
      ?auto_13461 - LOCATION
      ?auto_13462 - TRUCK
      ?auto_13460 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13459 ?auto_13463 ) ( IN-CITY ?auto_13456 ?auto_13463 ) ( not ( = ?auto_13456 ?auto_13459 ) ) ( not ( = ?auto_13464 ?auto_13457 ) ) ( OBJ-AT ?auto_13457 ?auto_13459 ) ( not ( = ?auto_13464 ?auto_13458 ) ) ( not ( = ?auto_13457 ?auto_13458 ) ) ( IN-CITY ?auto_13461 ?auto_13463 ) ( not ( = ?auto_13456 ?auto_13461 ) ) ( not ( = ?auto_13459 ?auto_13461 ) ) ( OBJ-AT ?auto_13458 ?auto_13461 ) ( TRUCK-AT ?auto_13462 ?auto_13460 ) ( IN-CITY ?auto_13460 ?auto_13463 ) ( not ( = ?auto_13456 ?auto_13460 ) ) ( not ( = ?auto_13459 ?auto_13460 ) ) ( not ( = ?auto_13461 ?auto_13460 ) ) ( OBJ-AT ?auto_13464 ?auto_13460 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13464 ?auto_13457 ?auto_13456 )
      ( DELIVER-2PKG-VERIFY ?auto_13457 ?auto_13458 ?auto_13456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13486 - OBJ
      ?auto_13487 - OBJ
      ?auto_13488 - OBJ
      ?auto_13485 - LOCATION
    )
    :vars
    (
      ?auto_13489 - LOCATION
      ?auto_13493 - CITY
      ?auto_13491 - LOCATION
      ?auto_13492 - TRUCK
      ?auto_13490 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13489 ?auto_13493 ) ( IN-CITY ?auto_13485 ?auto_13493 ) ( not ( = ?auto_13485 ?auto_13489 ) ) ( not ( = ?auto_13486 ?auto_13488 ) ) ( OBJ-AT ?auto_13488 ?auto_13489 ) ( not ( = ?auto_13486 ?auto_13487 ) ) ( not ( = ?auto_13488 ?auto_13487 ) ) ( IN-CITY ?auto_13491 ?auto_13493 ) ( not ( = ?auto_13485 ?auto_13491 ) ) ( not ( = ?auto_13489 ?auto_13491 ) ) ( OBJ-AT ?auto_13487 ?auto_13491 ) ( TRUCK-AT ?auto_13492 ?auto_13490 ) ( IN-CITY ?auto_13490 ?auto_13493 ) ( not ( = ?auto_13485 ?auto_13490 ) ) ( not ( = ?auto_13489 ?auto_13490 ) ) ( not ( = ?auto_13491 ?auto_13490 ) ) ( OBJ-AT ?auto_13486 ?auto_13490 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13486 ?auto_13488 ?auto_13485 )
      ( DELIVER-3PKG-VERIFY ?auto_13486 ?auto_13487 ?auto_13488 ?auto_13485 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13505 - OBJ
      ?auto_13506 - OBJ
      ?auto_13507 - OBJ
      ?auto_13504 - LOCATION
    )
    :vars
    (
      ?auto_13508 - LOCATION
      ?auto_13512 - CITY
      ?auto_13510 - LOCATION
      ?auto_13511 - TRUCK
      ?auto_13509 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13508 ?auto_13512 ) ( IN-CITY ?auto_13504 ?auto_13512 ) ( not ( = ?auto_13504 ?auto_13508 ) ) ( not ( = ?auto_13505 ?auto_13506 ) ) ( OBJ-AT ?auto_13506 ?auto_13508 ) ( not ( = ?auto_13505 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( IN-CITY ?auto_13510 ?auto_13512 ) ( not ( = ?auto_13504 ?auto_13510 ) ) ( not ( = ?auto_13508 ?auto_13510 ) ) ( OBJ-AT ?auto_13507 ?auto_13510 ) ( TRUCK-AT ?auto_13511 ?auto_13509 ) ( IN-CITY ?auto_13509 ?auto_13512 ) ( not ( = ?auto_13504 ?auto_13509 ) ) ( not ( = ?auto_13508 ?auto_13509 ) ) ( not ( = ?auto_13510 ?auto_13509 ) ) ( OBJ-AT ?auto_13505 ?auto_13509 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13505 ?auto_13506 ?auto_13504 )
      ( DELIVER-3PKG-VERIFY ?auto_13505 ?auto_13506 ?auto_13507 ?auto_13504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13524 - OBJ
      ?auto_13525 - OBJ
      ?auto_13526 - OBJ
      ?auto_13523 - LOCATION
    )
    :vars
    (
      ?auto_13527 - LOCATION
      ?auto_13531 - CITY
      ?auto_13529 - LOCATION
      ?auto_13530 - TRUCK
      ?auto_13528 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13527 ?auto_13531 ) ( IN-CITY ?auto_13523 ?auto_13531 ) ( not ( = ?auto_13523 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( OBJ-AT ?auto_13526 ?auto_13527 ) ( not ( = ?auto_13525 ?auto_13524 ) ) ( not ( = ?auto_13526 ?auto_13524 ) ) ( IN-CITY ?auto_13529 ?auto_13531 ) ( not ( = ?auto_13523 ?auto_13529 ) ) ( not ( = ?auto_13527 ?auto_13529 ) ) ( OBJ-AT ?auto_13524 ?auto_13529 ) ( TRUCK-AT ?auto_13530 ?auto_13528 ) ( IN-CITY ?auto_13528 ?auto_13531 ) ( not ( = ?auto_13523 ?auto_13528 ) ) ( not ( = ?auto_13527 ?auto_13528 ) ) ( not ( = ?auto_13529 ?auto_13528 ) ) ( OBJ-AT ?auto_13525 ?auto_13528 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13525 ?auto_13526 ?auto_13523 )
      ( DELIVER-3PKG-VERIFY ?auto_13524 ?auto_13525 ?auto_13526 ?auto_13523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13543 - OBJ
      ?auto_13544 - OBJ
      ?auto_13545 - OBJ
      ?auto_13542 - LOCATION
    )
    :vars
    (
      ?auto_13546 - LOCATION
      ?auto_13550 - CITY
      ?auto_13548 - LOCATION
      ?auto_13549 - TRUCK
      ?auto_13547 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13546 ?auto_13550 ) ( IN-CITY ?auto_13542 ?auto_13550 ) ( not ( = ?auto_13542 ?auto_13546 ) ) ( not ( = ?auto_13545 ?auto_13544 ) ) ( OBJ-AT ?auto_13544 ?auto_13546 ) ( not ( = ?auto_13545 ?auto_13543 ) ) ( not ( = ?auto_13544 ?auto_13543 ) ) ( IN-CITY ?auto_13548 ?auto_13550 ) ( not ( = ?auto_13542 ?auto_13548 ) ) ( not ( = ?auto_13546 ?auto_13548 ) ) ( OBJ-AT ?auto_13543 ?auto_13548 ) ( TRUCK-AT ?auto_13549 ?auto_13547 ) ( IN-CITY ?auto_13547 ?auto_13550 ) ( not ( = ?auto_13542 ?auto_13547 ) ) ( not ( = ?auto_13546 ?auto_13547 ) ) ( not ( = ?auto_13548 ?auto_13547 ) ) ( OBJ-AT ?auto_13545 ?auto_13547 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13545 ?auto_13544 ?auto_13542 )
      ( DELIVER-3PKG-VERIFY ?auto_13543 ?auto_13544 ?auto_13545 ?auto_13542 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13582 - OBJ
      ?auto_13583 - OBJ
      ?auto_13584 - OBJ
      ?auto_13581 - LOCATION
    )
    :vars
    (
      ?auto_13585 - LOCATION
      ?auto_13589 - CITY
      ?auto_13587 - LOCATION
      ?auto_13588 - TRUCK
      ?auto_13586 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13585 ?auto_13589 ) ( IN-CITY ?auto_13581 ?auto_13589 ) ( not ( = ?auto_13581 ?auto_13585 ) ) ( not ( = ?auto_13583 ?auto_13582 ) ) ( OBJ-AT ?auto_13582 ?auto_13585 ) ( not ( = ?auto_13583 ?auto_13584 ) ) ( not ( = ?auto_13582 ?auto_13584 ) ) ( IN-CITY ?auto_13587 ?auto_13589 ) ( not ( = ?auto_13581 ?auto_13587 ) ) ( not ( = ?auto_13585 ?auto_13587 ) ) ( OBJ-AT ?auto_13584 ?auto_13587 ) ( TRUCK-AT ?auto_13588 ?auto_13586 ) ( IN-CITY ?auto_13586 ?auto_13589 ) ( not ( = ?auto_13581 ?auto_13586 ) ) ( not ( = ?auto_13585 ?auto_13586 ) ) ( not ( = ?auto_13587 ?auto_13586 ) ) ( OBJ-AT ?auto_13583 ?auto_13586 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13583 ?auto_13582 ?auto_13581 )
      ( DELIVER-3PKG-VERIFY ?auto_13582 ?auto_13583 ?auto_13584 ?auto_13581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13601 - OBJ
      ?auto_13602 - OBJ
      ?auto_13603 - OBJ
      ?auto_13600 - LOCATION
    )
    :vars
    (
      ?auto_13604 - LOCATION
      ?auto_13608 - CITY
      ?auto_13606 - LOCATION
      ?auto_13607 - TRUCK
      ?auto_13605 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13604 ?auto_13608 ) ( IN-CITY ?auto_13600 ?auto_13608 ) ( not ( = ?auto_13600 ?auto_13604 ) ) ( not ( = ?auto_13603 ?auto_13601 ) ) ( OBJ-AT ?auto_13601 ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13602 ) ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( IN-CITY ?auto_13606 ?auto_13608 ) ( not ( = ?auto_13600 ?auto_13606 ) ) ( not ( = ?auto_13604 ?auto_13606 ) ) ( OBJ-AT ?auto_13602 ?auto_13606 ) ( TRUCK-AT ?auto_13607 ?auto_13605 ) ( IN-CITY ?auto_13605 ?auto_13608 ) ( not ( = ?auto_13600 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13606 ?auto_13605 ) ) ( OBJ-AT ?auto_13603 ?auto_13605 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13603 ?auto_13601 ?auto_13600 )
      ( DELIVER-3PKG-VERIFY ?auto_13601 ?auto_13602 ?auto_13603 ?auto_13600 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13661 - OBJ
      ?auto_13660 - LOCATION
    )
    :vars
    (
      ?auto_13663 - LOCATION
      ?auto_13667 - CITY
      ?auto_13668 - OBJ
      ?auto_13662 - OBJ
      ?auto_13665 - LOCATION
      ?auto_13664 - LOCATION
      ?auto_13666 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13663 ?auto_13667 ) ( IN-CITY ?auto_13660 ?auto_13667 ) ( not ( = ?auto_13660 ?auto_13663 ) ) ( not ( = ?auto_13668 ?auto_13661 ) ) ( OBJ-AT ?auto_13661 ?auto_13663 ) ( not ( = ?auto_13668 ?auto_13662 ) ) ( not ( = ?auto_13661 ?auto_13662 ) ) ( IN-CITY ?auto_13665 ?auto_13667 ) ( not ( = ?auto_13660 ?auto_13665 ) ) ( not ( = ?auto_13663 ?auto_13665 ) ) ( OBJ-AT ?auto_13662 ?auto_13665 ) ( IN-CITY ?auto_13664 ?auto_13667 ) ( not ( = ?auto_13660 ?auto_13664 ) ) ( not ( = ?auto_13663 ?auto_13664 ) ) ( not ( = ?auto_13665 ?auto_13664 ) ) ( OBJ-AT ?auto_13668 ?auto_13664 ) ( TRUCK-AT ?auto_13666 ?auto_13660 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13666 ?auto_13660 ?auto_13664 ?auto_13667 )
      ( DELIVER-2PKG ?auto_13668 ?auto_13661 ?auto_13660 )
      ( DELIVER-1PKG-VERIFY ?auto_13661 ?auto_13660 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13670 - OBJ
      ?auto_13671 - OBJ
      ?auto_13669 - LOCATION
    )
    :vars
    (
      ?auto_13675 - LOCATION
      ?auto_13676 - CITY
      ?auto_13674 - OBJ
      ?auto_13672 - LOCATION
      ?auto_13677 - LOCATION
      ?auto_13673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13675 ?auto_13676 ) ( IN-CITY ?auto_13669 ?auto_13676 ) ( not ( = ?auto_13669 ?auto_13675 ) ) ( not ( = ?auto_13670 ?auto_13671 ) ) ( OBJ-AT ?auto_13671 ?auto_13675 ) ( not ( = ?auto_13670 ?auto_13674 ) ) ( not ( = ?auto_13671 ?auto_13674 ) ) ( IN-CITY ?auto_13672 ?auto_13676 ) ( not ( = ?auto_13669 ?auto_13672 ) ) ( not ( = ?auto_13675 ?auto_13672 ) ) ( OBJ-AT ?auto_13674 ?auto_13672 ) ( IN-CITY ?auto_13677 ?auto_13676 ) ( not ( = ?auto_13669 ?auto_13677 ) ) ( not ( = ?auto_13675 ?auto_13677 ) ) ( not ( = ?auto_13672 ?auto_13677 ) ) ( OBJ-AT ?auto_13670 ?auto_13677 ) ( TRUCK-AT ?auto_13673 ?auto_13669 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13671 ?auto_13669 )
      ( DELIVER-2PKG-VERIFY ?auto_13670 ?auto_13671 ?auto_13669 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13679 - OBJ
      ?auto_13680 - OBJ
      ?auto_13678 - LOCATION
    )
    :vars
    (
      ?auto_13681 - LOCATION
      ?auto_13684 - CITY
      ?auto_13686 - OBJ
      ?auto_13683 - LOCATION
      ?auto_13682 - LOCATION
      ?auto_13685 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13681 ?auto_13684 ) ( IN-CITY ?auto_13678 ?auto_13684 ) ( not ( = ?auto_13678 ?auto_13681 ) ) ( not ( = ?auto_13686 ?auto_13680 ) ) ( OBJ-AT ?auto_13680 ?auto_13681 ) ( not ( = ?auto_13686 ?auto_13679 ) ) ( not ( = ?auto_13680 ?auto_13679 ) ) ( IN-CITY ?auto_13683 ?auto_13684 ) ( not ( = ?auto_13678 ?auto_13683 ) ) ( not ( = ?auto_13681 ?auto_13683 ) ) ( OBJ-AT ?auto_13679 ?auto_13683 ) ( IN-CITY ?auto_13682 ?auto_13684 ) ( not ( = ?auto_13678 ?auto_13682 ) ) ( not ( = ?auto_13681 ?auto_13682 ) ) ( not ( = ?auto_13683 ?auto_13682 ) ) ( OBJ-AT ?auto_13686 ?auto_13682 ) ( TRUCK-AT ?auto_13685 ?auto_13678 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13686 ?auto_13680 ?auto_13678 )
      ( DELIVER-2PKG-VERIFY ?auto_13679 ?auto_13680 ?auto_13678 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13688 - OBJ
      ?auto_13689 - OBJ
      ?auto_13687 - LOCATION
    )
    :vars
    (
      ?auto_13690 - LOCATION
      ?auto_13694 - CITY
      ?auto_13693 - OBJ
      ?auto_13692 - LOCATION
      ?auto_13691 - LOCATION
      ?auto_13695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13690 ?auto_13694 ) ( IN-CITY ?auto_13687 ?auto_13694 ) ( not ( = ?auto_13687 ?auto_13690 ) ) ( not ( = ?auto_13689 ?auto_13688 ) ) ( OBJ-AT ?auto_13688 ?auto_13690 ) ( not ( = ?auto_13689 ?auto_13693 ) ) ( not ( = ?auto_13688 ?auto_13693 ) ) ( IN-CITY ?auto_13692 ?auto_13694 ) ( not ( = ?auto_13687 ?auto_13692 ) ) ( not ( = ?auto_13690 ?auto_13692 ) ) ( OBJ-AT ?auto_13693 ?auto_13692 ) ( IN-CITY ?auto_13691 ?auto_13694 ) ( not ( = ?auto_13687 ?auto_13691 ) ) ( not ( = ?auto_13690 ?auto_13691 ) ) ( not ( = ?auto_13692 ?auto_13691 ) ) ( OBJ-AT ?auto_13689 ?auto_13691 ) ( TRUCK-AT ?auto_13695 ?auto_13687 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13689 ?auto_13688 ?auto_13687 )
      ( DELIVER-2PKG-VERIFY ?auto_13688 ?auto_13689 ?auto_13687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13697 - OBJ
      ?auto_13698 - OBJ
      ?auto_13696 - LOCATION
    )
    :vars
    (
      ?auto_13699 - LOCATION
      ?auto_13702 - CITY
      ?auto_13704 - OBJ
      ?auto_13701 - LOCATION
      ?auto_13700 - LOCATION
      ?auto_13703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13699 ?auto_13702 ) ( IN-CITY ?auto_13696 ?auto_13702 ) ( not ( = ?auto_13696 ?auto_13699 ) ) ( not ( = ?auto_13704 ?auto_13697 ) ) ( OBJ-AT ?auto_13697 ?auto_13699 ) ( not ( = ?auto_13704 ?auto_13698 ) ) ( not ( = ?auto_13697 ?auto_13698 ) ) ( IN-CITY ?auto_13701 ?auto_13702 ) ( not ( = ?auto_13696 ?auto_13701 ) ) ( not ( = ?auto_13699 ?auto_13701 ) ) ( OBJ-AT ?auto_13698 ?auto_13701 ) ( IN-CITY ?auto_13700 ?auto_13702 ) ( not ( = ?auto_13696 ?auto_13700 ) ) ( not ( = ?auto_13699 ?auto_13700 ) ) ( not ( = ?auto_13701 ?auto_13700 ) ) ( OBJ-AT ?auto_13704 ?auto_13700 ) ( TRUCK-AT ?auto_13703 ?auto_13696 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13704 ?auto_13697 ?auto_13696 )
      ( DELIVER-2PKG-VERIFY ?auto_13697 ?auto_13698 ?auto_13696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13726 - OBJ
      ?auto_13727 - OBJ
      ?auto_13728 - OBJ
      ?auto_13725 - LOCATION
    )
    :vars
    (
      ?auto_13729 - LOCATION
      ?auto_13732 - CITY
      ?auto_13731 - LOCATION
      ?auto_13730 - LOCATION
      ?auto_13733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13729 ?auto_13732 ) ( IN-CITY ?auto_13725 ?auto_13732 ) ( not ( = ?auto_13725 ?auto_13729 ) ) ( not ( = ?auto_13726 ?auto_13728 ) ) ( OBJ-AT ?auto_13728 ?auto_13729 ) ( not ( = ?auto_13726 ?auto_13727 ) ) ( not ( = ?auto_13728 ?auto_13727 ) ) ( IN-CITY ?auto_13731 ?auto_13732 ) ( not ( = ?auto_13725 ?auto_13731 ) ) ( not ( = ?auto_13729 ?auto_13731 ) ) ( OBJ-AT ?auto_13727 ?auto_13731 ) ( IN-CITY ?auto_13730 ?auto_13732 ) ( not ( = ?auto_13725 ?auto_13730 ) ) ( not ( = ?auto_13729 ?auto_13730 ) ) ( not ( = ?auto_13731 ?auto_13730 ) ) ( OBJ-AT ?auto_13726 ?auto_13730 ) ( TRUCK-AT ?auto_13733 ?auto_13725 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13726 ?auto_13728 ?auto_13725 )
      ( DELIVER-3PKG-VERIFY ?auto_13726 ?auto_13727 ?auto_13728 ?auto_13725 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13745 - OBJ
      ?auto_13746 - OBJ
      ?auto_13747 - OBJ
      ?auto_13744 - LOCATION
    )
    :vars
    (
      ?auto_13748 - LOCATION
      ?auto_13751 - CITY
      ?auto_13750 - LOCATION
      ?auto_13749 - LOCATION
      ?auto_13752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13748 ?auto_13751 ) ( IN-CITY ?auto_13744 ?auto_13751 ) ( not ( = ?auto_13744 ?auto_13748 ) ) ( not ( = ?auto_13745 ?auto_13746 ) ) ( OBJ-AT ?auto_13746 ?auto_13748 ) ( not ( = ?auto_13745 ?auto_13747 ) ) ( not ( = ?auto_13746 ?auto_13747 ) ) ( IN-CITY ?auto_13750 ?auto_13751 ) ( not ( = ?auto_13744 ?auto_13750 ) ) ( not ( = ?auto_13748 ?auto_13750 ) ) ( OBJ-AT ?auto_13747 ?auto_13750 ) ( IN-CITY ?auto_13749 ?auto_13751 ) ( not ( = ?auto_13744 ?auto_13749 ) ) ( not ( = ?auto_13748 ?auto_13749 ) ) ( not ( = ?auto_13750 ?auto_13749 ) ) ( OBJ-AT ?auto_13745 ?auto_13749 ) ( TRUCK-AT ?auto_13752 ?auto_13744 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13745 ?auto_13746 ?auto_13744 )
      ( DELIVER-3PKG-VERIFY ?auto_13745 ?auto_13746 ?auto_13747 ?auto_13744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13764 - OBJ
      ?auto_13765 - OBJ
      ?auto_13766 - OBJ
      ?auto_13763 - LOCATION
    )
    :vars
    (
      ?auto_13767 - LOCATION
      ?auto_13770 - CITY
      ?auto_13769 - LOCATION
      ?auto_13768 - LOCATION
      ?auto_13771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13767 ?auto_13770 ) ( IN-CITY ?auto_13763 ?auto_13770 ) ( not ( = ?auto_13763 ?auto_13767 ) ) ( not ( = ?auto_13765 ?auto_13766 ) ) ( OBJ-AT ?auto_13766 ?auto_13767 ) ( not ( = ?auto_13765 ?auto_13764 ) ) ( not ( = ?auto_13766 ?auto_13764 ) ) ( IN-CITY ?auto_13769 ?auto_13770 ) ( not ( = ?auto_13763 ?auto_13769 ) ) ( not ( = ?auto_13767 ?auto_13769 ) ) ( OBJ-AT ?auto_13764 ?auto_13769 ) ( IN-CITY ?auto_13768 ?auto_13770 ) ( not ( = ?auto_13763 ?auto_13768 ) ) ( not ( = ?auto_13767 ?auto_13768 ) ) ( not ( = ?auto_13769 ?auto_13768 ) ) ( OBJ-AT ?auto_13765 ?auto_13768 ) ( TRUCK-AT ?auto_13771 ?auto_13763 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13765 ?auto_13766 ?auto_13763 )
      ( DELIVER-3PKG-VERIFY ?auto_13764 ?auto_13765 ?auto_13766 ?auto_13763 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13783 - OBJ
      ?auto_13784 - OBJ
      ?auto_13785 - OBJ
      ?auto_13782 - LOCATION
    )
    :vars
    (
      ?auto_13786 - LOCATION
      ?auto_13789 - CITY
      ?auto_13788 - LOCATION
      ?auto_13787 - LOCATION
      ?auto_13790 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13786 ?auto_13789 ) ( IN-CITY ?auto_13782 ?auto_13789 ) ( not ( = ?auto_13782 ?auto_13786 ) ) ( not ( = ?auto_13785 ?auto_13784 ) ) ( OBJ-AT ?auto_13784 ?auto_13786 ) ( not ( = ?auto_13785 ?auto_13783 ) ) ( not ( = ?auto_13784 ?auto_13783 ) ) ( IN-CITY ?auto_13788 ?auto_13789 ) ( not ( = ?auto_13782 ?auto_13788 ) ) ( not ( = ?auto_13786 ?auto_13788 ) ) ( OBJ-AT ?auto_13783 ?auto_13788 ) ( IN-CITY ?auto_13787 ?auto_13789 ) ( not ( = ?auto_13782 ?auto_13787 ) ) ( not ( = ?auto_13786 ?auto_13787 ) ) ( not ( = ?auto_13788 ?auto_13787 ) ) ( OBJ-AT ?auto_13785 ?auto_13787 ) ( TRUCK-AT ?auto_13790 ?auto_13782 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13785 ?auto_13784 ?auto_13782 )
      ( DELIVER-3PKG-VERIFY ?auto_13783 ?auto_13784 ?auto_13785 ?auto_13782 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13822 - OBJ
      ?auto_13823 - OBJ
      ?auto_13824 - OBJ
      ?auto_13821 - LOCATION
    )
    :vars
    (
      ?auto_13825 - LOCATION
      ?auto_13828 - CITY
      ?auto_13827 - LOCATION
      ?auto_13826 - LOCATION
      ?auto_13829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13825 ?auto_13828 ) ( IN-CITY ?auto_13821 ?auto_13828 ) ( not ( = ?auto_13821 ?auto_13825 ) ) ( not ( = ?auto_13823 ?auto_13822 ) ) ( OBJ-AT ?auto_13822 ?auto_13825 ) ( not ( = ?auto_13823 ?auto_13824 ) ) ( not ( = ?auto_13822 ?auto_13824 ) ) ( IN-CITY ?auto_13827 ?auto_13828 ) ( not ( = ?auto_13821 ?auto_13827 ) ) ( not ( = ?auto_13825 ?auto_13827 ) ) ( OBJ-AT ?auto_13824 ?auto_13827 ) ( IN-CITY ?auto_13826 ?auto_13828 ) ( not ( = ?auto_13821 ?auto_13826 ) ) ( not ( = ?auto_13825 ?auto_13826 ) ) ( not ( = ?auto_13827 ?auto_13826 ) ) ( OBJ-AT ?auto_13823 ?auto_13826 ) ( TRUCK-AT ?auto_13829 ?auto_13821 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13823 ?auto_13822 ?auto_13821 )
      ( DELIVER-3PKG-VERIFY ?auto_13822 ?auto_13823 ?auto_13824 ?auto_13821 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13841 - OBJ
      ?auto_13842 - OBJ
      ?auto_13843 - OBJ
      ?auto_13840 - LOCATION
    )
    :vars
    (
      ?auto_13844 - LOCATION
      ?auto_13847 - CITY
      ?auto_13846 - LOCATION
      ?auto_13845 - LOCATION
      ?auto_13848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13844 ?auto_13847 ) ( IN-CITY ?auto_13840 ?auto_13847 ) ( not ( = ?auto_13840 ?auto_13844 ) ) ( not ( = ?auto_13843 ?auto_13841 ) ) ( OBJ-AT ?auto_13841 ?auto_13844 ) ( not ( = ?auto_13843 ?auto_13842 ) ) ( not ( = ?auto_13841 ?auto_13842 ) ) ( IN-CITY ?auto_13846 ?auto_13847 ) ( not ( = ?auto_13840 ?auto_13846 ) ) ( not ( = ?auto_13844 ?auto_13846 ) ) ( OBJ-AT ?auto_13842 ?auto_13846 ) ( IN-CITY ?auto_13845 ?auto_13847 ) ( not ( = ?auto_13840 ?auto_13845 ) ) ( not ( = ?auto_13844 ?auto_13845 ) ) ( not ( = ?auto_13846 ?auto_13845 ) ) ( OBJ-AT ?auto_13843 ?auto_13845 ) ( TRUCK-AT ?auto_13848 ?auto_13840 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13843 ?auto_13841 ?auto_13840 )
      ( DELIVER-3PKG-VERIFY ?auto_13841 ?auto_13842 ?auto_13843 ?auto_13840 ) )
  )

)

