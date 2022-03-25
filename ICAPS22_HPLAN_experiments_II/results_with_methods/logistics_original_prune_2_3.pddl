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
    ( ( !UNLOAD-TRUCK ?auto_750 ?auto_751 ?auto_749 ) )
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
      ( DELIVER-1PKG ?auto_757 ?auto_756 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_768 - OBJ
      ?auto_767 - LOCATION
    )
    :vars
    (
      ?auto_770 - TRUCK
      ?auto_769 - LOCATION
      ?auto_771 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_770 ?auto_769 ) ( IN-CITY ?auto_769 ?auto_771 ) ( IN-CITY ?auto_767 ?auto_771 ) ( not ( = ?auto_767 ?auto_769 ) ) ( OBJ-AT ?auto_768 ?auto_769 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_768 ?auto_770 ?auto_769 )
      ( DELIVER-1PKG ?auto_768 ?auto_767 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_779 - OBJ
      ?auto_778 - LOCATION
    )
    :vars
    (
      ?auto_782 - LOCATION
      ?auto_780 - CITY
      ?auto_781 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_782 ?auto_780 ) ( IN-CITY ?auto_778 ?auto_780 ) ( not ( = ?auto_778 ?auto_782 ) ) ( OBJ-AT ?auto_779 ?auto_782 ) ( TRUCK-AT ?auto_781 ?auto_778 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_781 ?auto_778 ?auto_782 ?auto_780 )
      ( DELIVER-1PKG ?auto_779 ?auto_778 ) )
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
    ( ( DELIVER-1PKG ?auto_805 ?auto_803 ) )
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
    ( ( DELIVER-1PKG ?auto_808 ?auto_807 ) )
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
      ?auto_825 - TRUCK
      ?auto_824 - LOCATION
      ?auto_823 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_822 ?auto_825 ) ( TRUCK-AT ?auto_825 ?auto_824 ) ( IN-CITY ?auto_824 ?auto_823 ) ( IN-CITY ?auto_820 ?auto_823 ) ( not ( = ?auto_820 ?auto_824 ) ) ( OBJ-AT ?auto_821 ?auto_820 ) ( not ( = ?auto_821 ?auto_822 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_822 ?auto_820 ) )
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
    ( ( DELIVER-2PKG ?auto_828 ?auto_827 ?auto_826 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_840 - OBJ
      ?auto_839 - LOCATION
    )
    :vars
    (
      ?auto_842 - TRUCK
      ?auto_844 - LOCATION
      ?auto_841 - CITY
      ?auto_843 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_842 ?auto_844 ) ( IN-CITY ?auto_844 ?auto_841 ) ( IN-CITY ?auto_839 ?auto_841 ) ( not ( = ?auto_839 ?auto_844 ) ) ( OBJ-AT ?auto_843 ?auto_839 ) ( not ( = ?auto_843 ?auto_840 ) ) ( OBJ-AT ?auto_840 ?auto_844 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_840 ?auto_842 ?auto_844 )
      ( DELIVER-2PKG ?auto_843 ?auto_840 ?auto_839 ) )
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
      ?auto_848 - LOCATION
      ?auto_849 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_850 ?auto_848 ) ( IN-CITY ?auto_848 ?auto_849 ) ( IN-CITY ?auto_845 ?auto_849 ) ( not ( = ?auto_845 ?auto_848 ) ) ( OBJ-AT ?auto_846 ?auto_845 ) ( not ( = ?auto_846 ?auto_847 ) ) ( OBJ-AT ?auto_847 ?auto_848 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_847 ?auto_845 ) )
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
      ?auto_854 - TRUCK
      ?auto_856 - LOCATION
      ?auto_855 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_854 ?auto_856 ) ( IN-CITY ?auto_856 ?auto_855 ) ( IN-CITY ?auto_851 ?auto_855 ) ( not ( = ?auto_851 ?auto_856 ) ) ( OBJ-AT ?auto_853 ?auto_851 ) ( not ( = ?auto_853 ?auto_852 ) ) ( OBJ-AT ?auto_852 ?auto_856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_853 ?auto_852 ?auto_851 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_865 - OBJ
      ?auto_864 - LOCATION
    )
    :vars
    (
      ?auto_868 - LOCATION
      ?auto_867 - CITY
      ?auto_869 - OBJ
      ?auto_866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_868 ?auto_867 ) ( IN-CITY ?auto_864 ?auto_867 ) ( not ( = ?auto_864 ?auto_868 ) ) ( OBJ-AT ?auto_869 ?auto_864 ) ( not ( = ?auto_869 ?auto_865 ) ) ( OBJ-AT ?auto_865 ?auto_868 ) ( TRUCK-AT ?auto_866 ?auto_864 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_866 ?auto_864 ?auto_868 ?auto_867 )
      ( DELIVER-2PKG ?auto_869 ?auto_865 ?auto_864 ) )
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
      ?auto_873 - LOCATION
      ?auto_874 - CITY
      ?auto_875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_873 ?auto_874 ) ( IN-CITY ?auto_870 ?auto_874 ) ( not ( = ?auto_870 ?auto_873 ) ) ( OBJ-AT ?auto_871 ?auto_870 ) ( not ( = ?auto_871 ?auto_872 ) ) ( OBJ-AT ?auto_872 ?auto_873 ) ( TRUCK-AT ?auto_875 ?auto_870 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_872 ?auto_870 ) )
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
      ?auto_880 - LOCATION
      ?auto_879 - CITY
      ?auto_881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_880 ?auto_879 ) ( IN-CITY ?auto_876 ?auto_879 ) ( not ( = ?auto_876 ?auto_880 ) ) ( OBJ-AT ?auto_878 ?auto_876 ) ( not ( = ?auto_878 ?auto_877 ) ) ( OBJ-AT ?auto_877 ?auto_880 ) ( TRUCK-AT ?auto_881 ?auto_876 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_878 ?auto_877 ?auto_876 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_890 - OBJ
      ?auto_889 - LOCATION
    )
    :vars
    (
      ?auto_892 - LOCATION
      ?auto_891 - CITY
      ?auto_893 - OBJ
      ?auto_894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_892 ?auto_891 ) ( IN-CITY ?auto_889 ?auto_891 ) ( not ( = ?auto_889 ?auto_892 ) ) ( not ( = ?auto_893 ?auto_890 ) ) ( OBJ-AT ?auto_890 ?auto_892 ) ( TRUCK-AT ?auto_894 ?auto_889 ) ( IN-TRUCK ?auto_893 ?auto_894 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_893 ?auto_889 )
      ( DELIVER-2PKG ?auto_893 ?auto_890 ?auto_889 ) )
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
      ?auto_899 - LOCATION
      ?auto_898 - CITY
      ?auto_900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_899 ?auto_898 ) ( IN-CITY ?auto_895 ?auto_898 ) ( not ( = ?auto_895 ?auto_899 ) ) ( not ( = ?auto_896 ?auto_897 ) ) ( OBJ-AT ?auto_897 ?auto_899 ) ( TRUCK-AT ?auto_900 ?auto_895 ) ( IN-TRUCK ?auto_896 ?auto_900 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_897 ?auto_895 ) )
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
      ?auto_906 - LOCATION
      ?auto_905 - CITY
      ?auto_904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906 ?auto_905 ) ( IN-CITY ?auto_901 ?auto_905 ) ( not ( = ?auto_901 ?auto_906 ) ) ( not ( = ?auto_903 ?auto_902 ) ) ( OBJ-AT ?auto_902 ?auto_906 ) ( TRUCK-AT ?auto_904 ?auto_901 ) ( IN-TRUCK ?auto_903 ?auto_904 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_903 ?auto_902 ?auto_901 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_915 - OBJ
      ?auto_914 - LOCATION
    )
    :vars
    (
      ?auto_918 - LOCATION
      ?auto_917 - CITY
      ?auto_919 - OBJ
      ?auto_916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_918 ?auto_917 ) ( IN-CITY ?auto_914 ?auto_917 ) ( not ( = ?auto_914 ?auto_918 ) ) ( not ( = ?auto_919 ?auto_915 ) ) ( OBJ-AT ?auto_915 ?auto_918 ) ( IN-TRUCK ?auto_919 ?auto_916 ) ( TRUCK-AT ?auto_916 ?auto_918 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_916 ?auto_918 ?auto_914 ?auto_917 )
      ( DELIVER-2PKG ?auto_919 ?auto_915 ?auto_914 ) )
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
      ?auto_925 - LOCATION
      ?auto_924 - CITY
      ?auto_923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_925 ?auto_924 ) ( IN-CITY ?auto_920 ?auto_924 ) ( not ( = ?auto_920 ?auto_925 ) ) ( not ( = ?auto_921 ?auto_922 ) ) ( OBJ-AT ?auto_922 ?auto_925 ) ( IN-TRUCK ?auto_921 ?auto_923 ) ( TRUCK-AT ?auto_923 ?auto_925 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_922 ?auto_920 ) )
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
      ?auto_931 - LOCATION
      ?auto_929 - CITY
      ?auto_930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_931 ?auto_929 ) ( IN-CITY ?auto_926 ?auto_929 ) ( not ( = ?auto_926 ?auto_931 ) ) ( not ( = ?auto_928 ?auto_927 ) ) ( OBJ-AT ?auto_927 ?auto_931 ) ( IN-TRUCK ?auto_928 ?auto_930 ) ( TRUCK-AT ?auto_930 ?auto_931 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_928 ?auto_927 ?auto_926 ) )
  )

)

