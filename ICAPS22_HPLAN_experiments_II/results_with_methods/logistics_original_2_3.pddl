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
      ?auto_777 - OBJ
      ?auto_776 - LOCATION
    )
    :vars
    (
      ?auto_778 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_778 ?auto_776 ) ( IN-TRUCK ?auto_777 ?auto_778 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_777 ?auto_778 ?auto_776 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_784 - OBJ
      ?auto_783 - LOCATION
    )
    :vars
    (
      ?auto_785 - TRUCK
      ?auto_786 - LOCATION
      ?auto_787 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_784 ?auto_785 ) ( TRUCK-AT ?auto_785 ?auto_786 ) ( IN-CITY ?auto_786 ?auto_787 ) ( IN-CITY ?auto_783 ?auto_787 ) ( not ( = ?auto_783 ?auto_786 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_785 ?auto_786 ?auto_783 ?auto_787 )
      ( DELIVER-1PKG ?auto_784 ?auto_783 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_795 - OBJ
      ?auto_794 - LOCATION
    )
    :vars
    (
      ?auto_798 - TRUCK
      ?auto_797 - LOCATION
      ?auto_796 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_798 ?auto_797 ) ( IN-CITY ?auto_797 ?auto_796 ) ( IN-CITY ?auto_794 ?auto_796 ) ( not ( = ?auto_794 ?auto_797 ) ) ( OBJ-AT ?auto_795 ?auto_797 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_795 ?auto_798 ?auto_797 )
      ( DELIVER-1PKG ?auto_795 ?auto_794 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_806 - OBJ
      ?auto_805 - LOCATION
    )
    :vars
    (
      ?auto_809 - LOCATION
      ?auto_807 - CITY
      ?auto_808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_809 ?auto_807 ) ( IN-CITY ?auto_805 ?auto_807 ) ( not ( = ?auto_805 ?auto_809 ) ) ( OBJ-AT ?auto_806 ?auto_809 ) ( TRUCK-AT ?auto_808 ?auto_805 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_808 ?auto_805 ?auto_809 ?auto_807 )
      ( DELIVER-1PKG ?auto_806 ?auto_805 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_828 - OBJ
      ?auto_827 - LOCATION
    )
    :vars
    (
      ?auto_829 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_829 ?auto_827 ) ( IN-TRUCK ?auto_828 ?auto_829 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_828 ?auto_829 ?auto_827 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_831 - OBJ
      ?auto_832 - OBJ
      ?auto_830 - LOCATION
    )
    :vars
    (
      ?auto_833 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_833 ?auto_830 ) ( IN-TRUCK ?auto_832 ?auto_833 ) ( OBJ-AT ?auto_831 ?auto_830 ) ( not ( = ?auto_831 ?auto_832 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_832 ?auto_830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_835 - OBJ
      ?auto_836 - OBJ
      ?auto_834 - LOCATION
    )
    :vars
    (
      ?auto_837 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_837 ?auto_834 ) ( IN-TRUCK ?auto_835 ?auto_837 ) ( OBJ-AT ?auto_836 ?auto_834 ) ( not ( = ?auto_835 ?auto_836 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_835 ?auto_834 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_843 - OBJ
      ?auto_842 - LOCATION
    )
    :vars
    (
      ?auto_844 - TRUCK
      ?auto_845 - LOCATION
      ?auto_846 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_843 ?auto_844 ) ( TRUCK-AT ?auto_844 ?auto_845 ) ( IN-CITY ?auto_845 ?auto_846 ) ( IN-CITY ?auto_842 ?auto_846 ) ( not ( = ?auto_842 ?auto_845 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_844 ?auto_845 ?auto_842 ?auto_846 )
      ( DELIVER-1PKG ?auto_843 ?auto_842 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_848 - OBJ
      ?auto_849 - OBJ
      ?auto_847 - LOCATION
    )
    :vars
    (
      ?auto_850 - TRUCK
      ?auto_852 - LOCATION
      ?auto_851 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_849 ?auto_850 ) ( TRUCK-AT ?auto_850 ?auto_852 ) ( IN-CITY ?auto_852 ?auto_851 ) ( IN-CITY ?auto_847 ?auto_851 ) ( not ( = ?auto_847 ?auto_852 ) ) ( OBJ-AT ?auto_848 ?auto_847 ) ( not ( = ?auto_848 ?auto_849 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_849 ?auto_847 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_854 - OBJ
      ?auto_855 - OBJ
      ?auto_853 - LOCATION
    )
    :vars
    (
      ?auto_856 - TRUCK
      ?auto_857 - LOCATION
      ?auto_858 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_854 ?auto_856 ) ( TRUCK-AT ?auto_856 ?auto_857 ) ( IN-CITY ?auto_857 ?auto_858 ) ( IN-CITY ?auto_853 ?auto_858 ) ( not ( = ?auto_853 ?auto_857 ) ) ( OBJ-AT ?auto_855 ?auto_853 ) ( not ( = ?auto_855 ?auto_854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_855 ?auto_854 ?auto_853 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_867 - OBJ
      ?auto_866 - LOCATION
    )
    :vars
    (
      ?auto_868 - TRUCK
      ?auto_870 - LOCATION
      ?auto_871 - CITY
      ?auto_869 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_868 ?auto_870 ) ( IN-CITY ?auto_870 ?auto_871 ) ( IN-CITY ?auto_866 ?auto_871 ) ( not ( = ?auto_866 ?auto_870 ) ) ( OBJ-AT ?auto_869 ?auto_866 ) ( not ( = ?auto_869 ?auto_867 ) ) ( OBJ-AT ?auto_867 ?auto_870 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_867 ?auto_868 ?auto_870 )
      ( DELIVER-2PKG ?auto_869 ?auto_867 ?auto_866 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_873 - OBJ
      ?auto_874 - OBJ
      ?auto_872 - LOCATION
    )
    :vars
    (
      ?auto_876 - TRUCK
      ?auto_877 - LOCATION
      ?auto_875 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_876 ?auto_877 ) ( IN-CITY ?auto_877 ?auto_875 ) ( IN-CITY ?auto_872 ?auto_875 ) ( not ( = ?auto_872 ?auto_877 ) ) ( OBJ-AT ?auto_873 ?auto_872 ) ( not ( = ?auto_873 ?auto_874 ) ) ( OBJ-AT ?auto_874 ?auto_877 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_874 ?auto_872 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_879 - OBJ
      ?auto_880 - OBJ
      ?auto_878 - LOCATION
    )
    :vars
    (
      ?auto_882 - TRUCK
      ?auto_881 - LOCATION
      ?auto_883 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_882 ?auto_881 ) ( IN-CITY ?auto_881 ?auto_883 ) ( IN-CITY ?auto_878 ?auto_883 ) ( not ( = ?auto_878 ?auto_881 ) ) ( OBJ-AT ?auto_880 ?auto_878 ) ( not ( = ?auto_880 ?auto_879 ) ) ( OBJ-AT ?auto_879 ?auto_881 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_880 ?auto_879 ?auto_878 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_892 - OBJ
      ?auto_891 - LOCATION
    )
    :vars
    (
      ?auto_894 - LOCATION
      ?auto_896 - CITY
      ?auto_893 - OBJ
      ?auto_895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_894 ?auto_896 ) ( IN-CITY ?auto_891 ?auto_896 ) ( not ( = ?auto_891 ?auto_894 ) ) ( OBJ-AT ?auto_893 ?auto_891 ) ( not ( = ?auto_893 ?auto_892 ) ) ( OBJ-AT ?auto_892 ?auto_894 ) ( TRUCK-AT ?auto_895 ?auto_891 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_895 ?auto_891 ?auto_894 ?auto_896 )
      ( DELIVER-2PKG ?auto_893 ?auto_892 ?auto_891 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_898 - OBJ
      ?auto_899 - OBJ
      ?auto_897 - LOCATION
    )
    :vars
    (
      ?auto_901 - LOCATION
      ?auto_902 - CITY
      ?auto_900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_901 ?auto_902 ) ( IN-CITY ?auto_897 ?auto_902 ) ( not ( = ?auto_897 ?auto_901 ) ) ( OBJ-AT ?auto_898 ?auto_897 ) ( not ( = ?auto_898 ?auto_899 ) ) ( OBJ-AT ?auto_899 ?auto_901 ) ( TRUCK-AT ?auto_900 ?auto_897 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_899 ?auto_897 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_904 - OBJ
      ?auto_905 - OBJ
      ?auto_903 - LOCATION
    )
    :vars
    (
      ?auto_906 - LOCATION
      ?auto_907 - CITY
      ?auto_908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_906 ?auto_907 ) ( IN-CITY ?auto_903 ?auto_907 ) ( not ( = ?auto_903 ?auto_906 ) ) ( OBJ-AT ?auto_905 ?auto_903 ) ( not ( = ?auto_905 ?auto_904 ) ) ( OBJ-AT ?auto_904 ?auto_906 ) ( TRUCK-AT ?auto_908 ?auto_903 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_905 ?auto_904 ?auto_903 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_917 - OBJ
      ?auto_916 - LOCATION
    )
    :vars
    (
      ?auto_919 - LOCATION
      ?auto_920 - CITY
      ?auto_918 - OBJ
      ?auto_921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_919 ?auto_920 ) ( IN-CITY ?auto_916 ?auto_920 ) ( not ( = ?auto_916 ?auto_919 ) ) ( not ( = ?auto_918 ?auto_917 ) ) ( OBJ-AT ?auto_917 ?auto_919 ) ( TRUCK-AT ?auto_921 ?auto_916 ) ( IN-TRUCK ?auto_918 ?auto_921 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_918 ?auto_916 )
      ( DELIVER-2PKG ?auto_918 ?auto_917 ?auto_916 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_923 - OBJ
      ?auto_924 - OBJ
      ?auto_922 - LOCATION
    )
    :vars
    (
      ?auto_927 - LOCATION
      ?auto_926 - CITY
      ?auto_925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_927 ?auto_926 ) ( IN-CITY ?auto_922 ?auto_926 ) ( not ( = ?auto_922 ?auto_927 ) ) ( not ( = ?auto_923 ?auto_924 ) ) ( OBJ-AT ?auto_924 ?auto_927 ) ( TRUCK-AT ?auto_925 ?auto_922 ) ( IN-TRUCK ?auto_923 ?auto_925 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_924 ?auto_922 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_929 - OBJ
      ?auto_930 - OBJ
      ?auto_928 - LOCATION
    )
    :vars
    (
      ?auto_931 - LOCATION
      ?auto_933 - CITY
      ?auto_932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_931 ?auto_933 ) ( IN-CITY ?auto_928 ?auto_933 ) ( not ( = ?auto_928 ?auto_931 ) ) ( not ( = ?auto_930 ?auto_929 ) ) ( OBJ-AT ?auto_929 ?auto_931 ) ( TRUCK-AT ?auto_932 ?auto_928 ) ( IN-TRUCK ?auto_930 ?auto_932 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_930 ?auto_929 ?auto_928 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_942 - OBJ
      ?auto_941 - LOCATION
    )
    :vars
    (
      ?auto_944 - LOCATION
      ?auto_946 - CITY
      ?auto_943 - OBJ
      ?auto_945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_944 ?auto_946 ) ( IN-CITY ?auto_941 ?auto_946 ) ( not ( = ?auto_941 ?auto_944 ) ) ( not ( = ?auto_943 ?auto_942 ) ) ( OBJ-AT ?auto_942 ?auto_944 ) ( IN-TRUCK ?auto_943 ?auto_945 ) ( TRUCK-AT ?auto_945 ?auto_944 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_945 ?auto_944 ?auto_941 ?auto_946 )
      ( DELIVER-2PKG ?auto_943 ?auto_942 ?auto_941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_948 - OBJ
      ?auto_949 - OBJ
      ?auto_947 - LOCATION
    )
    :vars
    (
      ?auto_950 - LOCATION
      ?auto_952 - CITY
      ?auto_951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950 ?auto_952 ) ( IN-CITY ?auto_947 ?auto_952 ) ( not ( = ?auto_947 ?auto_950 ) ) ( not ( = ?auto_948 ?auto_949 ) ) ( OBJ-AT ?auto_949 ?auto_950 ) ( IN-TRUCK ?auto_948 ?auto_951 ) ( TRUCK-AT ?auto_951 ?auto_950 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_949 ?auto_947 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_954 - OBJ
      ?auto_955 - OBJ
      ?auto_953 - LOCATION
    )
    :vars
    (
      ?auto_956 - LOCATION
      ?auto_957 - CITY
      ?auto_958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_956 ?auto_957 ) ( IN-CITY ?auto_953 ?auto_957 ) ( not ( = ?auto_953 ?auto_956 ) ) ( not ( = ?auto_955 ?auto_954 ) ) ( OBJ-AT ?auto_954 ?auto_956 ) ( IN-TRUCK ?auto_955 ?auto_958 ) ( TRUCK-AT ?auto_958 ?auto_956 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_955 ?auto_954 ?auto_953 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_967 - OBJ
      ?auto_966 - LOCATION
    )
    :vars
    (
      ?auto_968 - LOCATION
      ?auto_969 - CITY
      ?auto_971 - OBJ
      ?auto_970 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_968 ?auto_969 ) ( IN-CITY ?auto_966 ?auto_969 ) ( not ( = ?auto_966 ?auto_968 ) ) ( not ( = ?auto_971 ?auto_967 ) ) ( OBJ-AT ?auto_967 ?auto_968 ) ( TRUCK-AT ?auto_970 ?auto_968 ) ( OBJ-AT ?auto_971 ?auto_968 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_971 ?auto_970 ?auto_968 )
      ( DELIVER-2PKG ?auto_971 ?auto_967 ?auto_966 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_973 - OBJ
      ?auto_974 - OBJ
      ?auto_972 - LOCATION
    )
    :vars
    (
      ?auto_977 - LOCATION
      ?auto_976 - CITY
      ?auto_975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_977 ?auto_976 ) ( IN-CITY ?auto_972 ?auto_976 ) ( not ( = ?auto_972 ?auto_977 ) ) ( not ( = ?auto_973 ?auto_974 ) ) ( OBJ-AT ?auto_974 ?auto_977 ) ( TRUCK-AT ?auto_975 ?auto_977 ) ( OBJ-AT ?auto_973 ?auto_977 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_974 ?auto_972 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_979 - OBJ
      ?auto_980 - OBJ
      ?auto_978 - LOCATION
    )
    :vars
    (
      ?auto_982 - LOCATION
      ?auto_983 - CITY
      ?auto_981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_982 ?auto_983 ) ( IN-CITY ?auto_978 ?auto_983 ) ( not ( = ?auto_978 ?auto_982 ) ) ( not ( = ?auto_980 ?auto_979 ) ) ( OBJ-AT ?auto_979 ?auto_982 ) ( TRUCK-AT ?auto_981 ?auto_982 ) ( OBJ-AT ?auto_980 ?auto_982 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_980 ?auto_979 ?auto_978 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_992 - OBJ
      ?auto_991 - LOCATION
    )
    :vars
    (
      ?auto_994 - LOCATION
      ?auto_995 - CITY
      ?auto_996 - OBJ
      ?auto_993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_994 ?auto_995 ) ( IN-CITY ?auto_991 ?auto_995 ) ( not ( = ?auto_991 ?auto_994 ) ) ( not ( = ?auto_996 ?auto_992 ) ) ( OBJ-AT ?auto_992 ?auto_994 ) ( OBJ-AT ?auto_996 ?auto_994 ) ( TRUCK-AT ?auto_993 ?auto_991 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_993 ?auto_991 ?auto_994 ?auto_995 )
      ( DELIVER-2PKG ?auto_996 ?auto_992 ?auto_991 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_998 - OBJ
      ?auto_999 - OBJ
      ?auto_997 - LOCATION
    )
    :vars
    (
      ?auto_1002 - LOCATION
      ?auto_1001 - CITY
      ?auto_1000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1002 ?auto_1001 ) ( IN-CITY ?auto_997 ?auto_1001 ) ( not ( = ?auto_997 ?auto_1002 ) ) ( not ( = ?auto_998 ?auto_999 ) ) ( OBJ-AT ?auto_999 ?auto_1002 ) ( OBJ-AT ?auto_998 ?auto_1002 ) ( TRUCK-AT ?auto_1000 ?auto_997 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_999 ?auto_997 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1004 - OBJ
      ?auto_1005 - OBJ
      ?auto_1003 - LOCATION
    )
    :vars
    (
      ?auto_1008 - LOCATION
      ?auto_1006 - CITY
      ?auto_1007 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1008 ?auto_1006 ) ( IN-CITY ?auto_1003 ?auto_1006 ) ( not ( = ?auto_1003 ?auto_1008 ) ) ( not ( = ?auto_1005 ?auto_1004 ) ) ( OBJ-AT ?auto_1004 ?auto_1008 ) ( OBJ-AT ?auto_1005 ?auto_1008 ) ( TRUCK-AT ?auto_1007 ?auto_1003 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1005 ?auto_1004 ?auto_1003 ) )
  )

)

