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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_750 - OBJ
      ?auto_749 - LOCATION
    )
    :vars
    (
      ?auto_751 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_751 ?auto_749 ) ( IN-TRUCK ?auto_750 ?auto_751 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_750 ?auto_751 ?auto_749 )
      ( DELIVER-1PKG-VERIFY ?auto_750 ?auto_749 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_757 - OBJ
      ?auto_756 - LOCATION
    )
    :vars
    (
      ?auto_758 - TRUCK
      ?auto_759 - LOCATION
      ?auto_760 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_757 ?auto_758 ) ( TRUCK-AT ?auto_758 ?auto_759 ) ( IN-CITY ?auto_759 ?auto_760 ) ( IN-CITY ?auto_756 ?auto_760 ) ( not ( = ?auto_756 ?auto_759 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_758 ?auto_759 ?auto_756 ?auto_760 )
      ( DELIVER-1PKG ?auto_757 ?auto_756 )
      ( DELIVER-1PKG-VERIFY ?auto_757 ?auto_756 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_768 - OBJ
      ?auto_767 - LOCATION
    )
    :vars
    (
      ?auto_771 - TRUCK
      ?auto_770 - LOCATION
      ?auto_769 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_771 ?auto_770 ) ( IN-CITY ?auto_770 ?auto_769 ) ( IN-CITY ?auto_767 ?auto_769 ) ( not ( = ?auto_767 ?auto_770 ) ) ( OBJ-AT ?auto_768 ?auto_770 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_768 ?auto_771 ?auto_770 )
      ( DELIVER-1PKG ?auto_768 ?auto_767 )
      ( DELIVER-1PKG-VERIFY ?auto_768 ?auto_767 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_779 - OBJ
      ?auto_778 - LOCATION
    )
    :vars
    (
      ?auto_781 - LOCATION
      ?auto_782 - CITY
      ?auto_780 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_781 ?auto_782 ) ( IN-CITY ?auto_778 ?auto_782 ) ( not ( = ?auto_778 ?auto_781 ) ) ( OBJ-AT ?auto_779 ?auto_781 ) ( TRUCK-AT ?auto_780 ?auto_778 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_780 ?auto_778 ?auto_781 ?auto_782 )
      ( DELIVER-1PKG ?auto_779 ?auto_778 )
      ( DELIVER-1PKG-VERIFY ?auto_779 ?auto_778 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_804 - OBJ
      ?auto_805 - OBJ
      ?auto_803 - LOCATION
    )
    :vars
    (
      ?auto_806 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_806 ?auto_803 ) ( IN-TRUCK ?auto_805 ?auto_806 ) ( OBJ-AT ?auto_804 ?auto_803 ) ( not ( = ?auto_804 ?auto_805 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_805 ?auto_803 )
      ( DELIVER-2PKG-VERIFY ?auto_804 ?auto_805 ?auto_803 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_808 - OBJ
      ?auto_809 - OBJ
      ?auto_807 - LOCATION
    )
    :vars
    (
      ?auto_810 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_810 ?auto_807 ) ( IN-TRUCK ?auto_808 ?auto_810 ) ( OBJ-AT ?auto_809 ?auto_807 ) ( not ( = ?auto_808 ?auto_809 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_808 ?auto_807 )
      ( DELIVER-2PKG-VERIFY ?auto_808 ?auto_809 ?auto_807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_821 - OBJ
      ?auto_822 - OBJ
      ?auto_820 - LOCATION
    )
    :vars
    (
      ?auto_824 - TRUCK
      ?auto_823 - LOCATION
      ?auto_825 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_822 ?auto_824 ) ( TRUCK-AT ?auto_824 ?auto_823 ) ( IN-CITY ?auto_823 ?auto_825 ) ( IN-CITY ?auto_820 ?auto_825 ) ( not ( = ?auto_820 ?auto_823 ) ) ( OBJ-AT ?auto_821 ?auto_820 ) ( not ( = ?auto_821 ?auto_822 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_822 ?auto_820 )
      ( DELIVER-2PKG-VERIFY ?auto_821 ?auto_822 ?auto_820 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_827 - OBJ
      ?auto_828 - OBJ
      ?auto_826 - LOCATION
    )
    :vars
    (
      ?auto_830 - TRUCK
      ?auto_831 - LOCATION
      ?auto_829 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_827 ?auto_830 ) ( TRUCK-AT ?auto_830 ?auto_831 ) ( IN-CITY ?auto_831 ?auto_829 ) ( IN-CITY ?auto_826 ?auto_829 ) ( not ( = ?auto_826 ?auto_831 ) ) ( OBJ-AT ?auto_828 ?auto_826 ) ( not ( = ?auto_828 ?auto_827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_828 ?auto_827 ?auto_826 )
      ( DELIVER-2PKG-VERIFY ?auto_827 ?auto_828 ?auto_826 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_840 - OBJ
      ?auto_839 - LOCATION
    )
    :vars
    (
      ?auto_843 - TRUCK
      ?auto_844 - LOCATION
      ?auto_842 - CITY
      ?auto_841 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_843 ?auto_844 ) ( IN-CITY ?auto_844 ?auto_842 ) ( IN-CITY ?auto_839 ?auto_842 ) ( not ( = ?auto_839 ?auto_844 ) ) ( OBJ-AT ?auto_841 ?auto_839 ) ( not ( = ?auto_841 ?auto_840 ) ) ( OBJ-AT ?auto_840 ?auto_844 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_840 ?auto_843 ?auto_844 )
      ( DELIVER-2PKG ?auto_841 ?auto_840 ?auto_839 )
      ( DELIVER-1PKG-VERIFY ?auto_840 ?auto_839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_846 - OBJ
      ?auto_847 - OBJ
      ?auto_845 - LOCATION
    )
    :vars
    (
      ?auto_850 - TRUCK
      ?auto_849 - LOCATION
      ?auto_848 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_850 ?auto_849 ) ( IN-CITY ?auto_849 ?auto_848 ) ( IN-CITY ?auto_845 ?auto_848 ) ( not ( = ?auto_845 ?auto_849 ) ) ( OBJ-AT ?auto_846 ?auto_845 ) ( not ( = ?auto_846 ?auto_847 ) ) ( OBJ-AT ?auto_847 ?auto_849 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_847 ?auto_845 )
      ( DELIVER-2PKG-VERIFY ?auto_846 ?auto_847 ?auto_845 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_852 - OBJ
      ?auto_853 - OBJ
      ?auto_851 - LOCATION
    )
    :vars
    (
      ?auto_856 - TRUCK
      ?auto_854 - LOCATION
      ?auto_855 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_856 ?auto_854 ) ( IN-CITY ?auto_854 ?auto_855 ) ( IN-CITY ?auto_851 ?auto_855 ) ( not ( = ?auto_851 ?auto_854 ) ) ( OBJ-AT ?auto_853 ?auto_851 ) ( not ( = ?auto_853 ?auto_852 ) ) ( OBJ-AT ?auto_852 ?auto_854 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_853 ?auto_852 ?auto_851 )
      ( DELIVER-2PKG-VERIFY ?auto_852 ?auto_853 ?auto_851 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_865 - OBJ
      ?auto_864 - LOCATION
    )
    :vars
    (
      ?auto_866 - LOCATION
      ?auto_867 - CITY
      ?auto_869 - OBJ
      ?auto_868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_866 ?auto_867 ) ( IN-CITY ?auto_864 ?auto_867 ) ( not ( = ?auto_864 ?auto_866 ) ) ( OBJ-AT ?auto_869 ?auto_864 ) ( not ( = ?auto_869 ?auto_865 ) ) ( OBJ-AT ?auto_865 ?auto_866 ) ( TRUCK-AT ?auto_868 ?auto_864 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_868 ?auto_864 ?auto_866 ?auto_867 )
      ( DELIVER-2PKG ?auto_869 ?auto_865 ?auto_864 )
      ( DELIVER-1PKG-VERIFY ?auto_865 ?auto_864 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_871 - OBJ
      ?auto_872 - OBJ
      ?auto_870 - LOCATION
    )
    :vars
    (
      ?auto_874 - LOCATION
      ?auto_875 - CITY
      ?auto_873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_874 ?auto_875 ) ( IN-CITY ?auto_870 ?auto_875 ) ( not ( = ?auto_870 ?auto_874 ) ) ( OBJ-AT ?auto_871 ?auto_870 ) ( not ( = ?auto_871 ?auto_872 ) ) ( OBJ-AT ?auto_872 ?auto_874 ) ( TRUCK-AT ?auto_873 ?auto_870 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_872 ?auto_870 )
      ( DELIVER-2PKG-VERIFY ?auto_871 ?auto_872 ?auto_870 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_877 - OBJ
      ?auto_878 - OBJ
      ?auto_876 - LOCATION
    )
    :vars
    (
      ?auto_881 - LOCATION
      ?auto_880 - CITY
      ?auto_879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_881 ?auto_880 ) ( IN-CITY ?auto_876 ?auto_880 ) ( not ( = ?auto_876 ?auto_881 ) ) ( OBJ-AT ?auto_878 ?auto_876 ) ( not ( = ?auto_878 ?auto_877 ) ) ( OBJ-AT ?auto_877 ?auto_881 ) ( TRUCK-AT ?auto_879 ?auto_876 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_878 ?auto_877 ?auto_876 )
      ( DELIVER-2PKG-VERIFY ?auto_877 ?auto_878 ?auto_876 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_890 - OBJ
      ?auto_889 - LOCATION
    )
    :vars
    (
      ?auto_894 - LOCATION
      ?auto_893 - CITY
      ?auto_892 - OBJ
      ?auto_891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894 ?auto_893 ) ( IN-CITY ?auto_889 ?auto_893 ) ( not ( = ?auto_889 ?auto_894 ) ) ( not ( = ?auto_892 ?auto_890 ) ) ( OBJ-AT ?auto_890 ?auto_894 ) ( TRUCK-AT ?auto_891 ?auto_889 ) ( IN-TRUCK ?auto_892 ?auto_891 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_892 ?auto_889 )
      ( DELIVER-2PKG ?auto_892 ?auto_890 ?auto_889 )
      ( DELIVER-1PKG-VERIFY ?auto_890 ?auto_889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_896 - OBJ
      ?auto_897 - OBJ
      ?auto_895 - LOCATION
    )
    :vars
    (
      ?auto_900 - LOCATION
      ?auto_899 - CITY
      ?auto_898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_900 ?auto_899 ) ( IN-CITY ?auto_895 ?auto_899 ) ( not ( = ?auto_895 ?auto_900 ) ) ( not ( = ?auto_896 ?auto_897 ) ) ( OBJ-AT ?auto_897 ?auto_900 ) ( TRUCK-AT ?auto_898 ?auto_895 ) ( IN-TRUCK ?auto_896 ?auto_898 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_897 ?auto_895 )
      ( DELIVER-2PKG-VERIFY ?auto_896 ?auto_897 ?auto_895 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_902 - OBJ
      ?auto_903 - OBJ
      ?auto_901 - LOCATION
    )
    :vars
    (
      ?auto_905 - LOCATION
      ?auto_906 - CITY
      ?auto_904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_905 ?auto_906 ) ( IN-CITY ?auto_901 ?auto_906 ) ( not ( = ?auto_901 ?auto_905 ) ) ( not ( = ?auto_903 ?auto_902 ) ) ( OBJ-AT ?auto_902 ?auto_905 ) ( TRUCK-AT ?auto_904 ?auto_901 ) ( IN-TRUCK ?auto_903 ?auto_904 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903 ?auto_902 ?auto_901 )
      ( DELIVER-2PKG-VERIFY ?auto_902 ?auto_903 ?auto_901 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_915 - OBJ
      ?auto_914 - LOCATION
    )
    :vars
    (
      ?auto_917 - LOCATION
      ?auto_918 - CITY
      ?auto_919 - OBJ
      ?auto_916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_917 ?auto_918 ) ( IN-CITY ?auto_914 ?auto_918 ) ( not ( = ?auto_914 ?auto_917 ) ) ( not ( = ?auto_919 ?auto_915 ) ) ( OBJ-AT ?auto_915 ?auto_917 ) ( IN-TRUCK ?auto_919 ?auto_916 ) ( TRUCK-AT ?auto_916 ?auto_917 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_916 ?auto_917 ?auto_914 ?auto_918 )
      ( DELIVER-2PKG ?auto_919 ?auto_915 ?auto_914 )
      ( DELIVER-1PKG-VERIFY ?auto_915 ?auto_914 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_921 - OBJ
      ?auto_922 - OBJ
      ?auto_920 - LOCATION
    )
    :vars
    (
      ?auto_923 - LOCATION
      ?auto_925 - CITY
      ?auto_924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_923 ?auto_925 ) ( IN-CITY ?auto_920 ?auto_925 ) ( not ( = ?auto_920 ?auto_923 ) ) ( not ( = ?auto_921 ?auto_922 ) ) ( OBJ-AT ?auto_922 ?auto_923 ) ( IN-TRUCK ?auto_921 ?auto_924 ) ( TRUCK-AT ?auto_924 ?auto_923 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_922 ?auto_920 )
      ( DELIVER-2PKG-VERIFY ?auto_921 ?auto_922 ?auto_920 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_927 - OBJ
      ?auto_928 - OBJ
      ?auto_926 - LOCATION
    )
    :vars
    (
      ?auto_930 - LOCATION
      ?auto_931 - CITY
      ?auto_929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_930 ?auto_931 ) ( IN-CITY ?auto_926 ?auto_931 ) ( not ( = ?auto_926 ?auto_930 ) ) ( not ( = ?auto_928 ?auto_927 ) ) ( OBJ-AT ?auto_927 ?auto_930 ) ( IN-TRUCK ?auto_928 ?auto_929 ) ( TRUCK-AT ?auto_929 ?auto_930 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_928 ?auto_927 ?auto_926 )
      ( DELIVER-2PKG-VERIFY ?auto_927 ?auto_928 ?auto_926 ) )
  )

)

