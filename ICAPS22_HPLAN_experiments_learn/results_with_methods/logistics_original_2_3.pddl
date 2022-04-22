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
      ?auto_765 - OBJ
      ?auto_764 - LOCATION
    )
    :vars
    (
      ?auto_766 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_766 ?auto_764 ) ( IN-TRUCK ?auto_765 ?auto_766 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_765 ?auto_766 ?auto_764 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_772 - OBJ
      ?auto_771 - LOCATION
    )
    :vars
    (
      ?auto_773 - TRUCK
      ?auto_774 - LOCATION
      ?auto_775 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_772 ?auto_773 ) ( TRUCK-AT ?auto_773 ?auto_774 ) ( IN-CITY ?auto_774 ?auto_775 ) ( IN-CITY ?auto_771 ?auto_775 ) ( not ( = ?auto_771 ?auto_774 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_773 ?auto_774 ?auto_771 ?auto_775 )
      ( DELIVER-1PKG ?auto_772 ?auto_771 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_783 - OBJ
      ?auto_782 - LOCATION
    )
    :vars
    (
      ?auto_786 - TRUCK
      ?auto_784 - LOCATION
      ?auto_785 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_786 ?auto_784 ) ( IN-CITY ?auto_784 ?auto_785 ) ( IN-CITY ?auto_782 ?auto_785 ) ( not ( = ?auto_782 ?auto_784 ) ) ( OBJ-AT ?auto_783 ?auto_784 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_783 ?auto_786 ?auto_784 )
      ( DELIVER-1PKG ?auto_783 ?auto_782 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_794 - OBJ
      ?auto_793 - LOCATION
    )
    :vars
    (
      ?auto_796 - LOCATION
      ?auto_797 - CITY
      ?auto_795 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_796 ?auto_797 ) ( IN-CITY ?auto_793 ?auto_797 ) ( not ( = ?auto_793 ?auto_796 ) ) ( OBJ-AT ?auto_794 ?auto_796 ) ( TRUCK-AT ?auto_795 ?auto_793 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_795 ?auto_793 ?auto_796 ?auto_797 )
      ( DELIVER-1PKG ?auto_794 ?auto_793 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_816 - OBJ
      ?auto_815 - LOCATION
    )
    :vars
    (
      ?auto_817 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_817 ?auto_815 ) ( IN-TRUCK ?auto_816 ?auto_817 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_816 ?auto_817 ?auto_815 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_819 - OBJ
      ?auto_820 - OBJ
      ?auto_818 - LOCATION
    )
    :vars
    (
      ?auto_821 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_821 ?auto_818 ) ( IN-TRUCK ?auto_820 ?auto_821 ) ( OBJ-AT ?auto_819 ?auto_818 ) ( not ( = ?auto_819 ?auto_820 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_820 ?auto_818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_823 - OBJ
      ?auto_824 - OBJ
      ?auto_822 - LOCATION
    )
    :vars
    (
      ?auto_825 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_825 ?auto_822 ) ( IN-TRUCK ?auto_823 ?auto_825 ) ( OBJ-AT ?auto_824 ?auto_822 ) ( not ( = ?auto_823 ?auto_824 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_823 ?auto_822 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_831 - OBJ
      ?auto_830 - LOCATION
    )
    :vars
    (
      ?auto_832 - TRUCK
      ?auto_833 - LOCATION
      ?auto_834 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_831 ?auto_832 ) ( TRUCK-AT ?auto_832 ?auto_833 ) ( IN-CITY ?auto_833 ?auto_834 ) ( IN-CITY ?auto_830 ?auto_834 ) ( not ( = ?auto_830 ?auto_833 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_832 ?auto_833 ?auto_830 ?auto_834 )
      ( DELIVER-1PKG ?auto_831 ?auto_830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_836 - OBJ
      ?auto_837 - OBJ
      ?auto_835 - LOCATION
    )
    :vars
    (
      ?auto_838 - TRUCK
      ?auto_839 - LOCATION
      ?auto_840 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_837 ?auto_838 ) ( TRUCK-AT ?auto_838 ?auto_839 ) ( IN-CITY ?auto_839 ?auto_840 ) ( IN-CITY ?auto_835 ?auto_840 ) ( not ( = ?auto_835 ?auto_839 ) ) ( OBJ-AT ?auto_836 ?auto_835 ) ( not ( = ?auto_836 ?auto_837 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_837 ?auto_835 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_842 - OBJ
      ?auto_843 - OBJ
      ?auto_841 - LOCATION
    )
    :vars
    (
      ?auto_844 - TRUCK
      ?auto_845 - LOCATION
      ?auto_846 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_842 ?auto_844 ) ( TRUCK-AT ?auto_844 ?auto_845 ) ( IN-CITY ?auto_845 ?auto_846 ) ( IN-CITY ?auto_841 ?auto_846 ) ( not ( = ?auto_841 ?auto_845 ) ) ( OBJ-AT ?auto_843 ?auto_841 ) ( not ( = ?auto_843 ?auto_842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_843 ?auto_842 ?auto_841 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_855 - OBJ
      ?auto_854 - LOCATION
    )
    :vars
    (
      ?auto_857 - TRUCK
      ?auto_858 - LOCATION
      ?auto_859 - CITY
      ?auto_856 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_857 ?auto_858 ) ( IN-CITY ?auto_858 ?auto_859 ) ( IN-CITY ?auto_854 ?auto_859 ) ( not ( = ?auto_854 ?auto_858 ) ) ( OBJ-AT ?auto_856 ?auto_854 ) ( not ( = ?auto_856 ?auto_855 ) ) ( OBJ-AT ?auto_855 ?auto_858 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_855 ?auto_857 ?auto_858 )
      ( DELIVER-2PKG ?auto_856 ?auto_855 ?auto_854 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_861 - OBJ
      ?auto_862 - OBJ
      ?auto_860 - LOCATION
    )
    :vars
    (
      ?auto_865 - TRUCK
      ?auto_864 - LOCATION
      ?auto_863 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_865 ?auto_864 ) ( IN-CITY ?auto_864 ?auto_863 ) ( IN-CITY ?auto_860 ?auto_863 ) ( not ( = ?auto_860 ?auto_864 ) ) ( OBJ-AT ?auto_861 ?auto_860 ) ( not ( = ?auto_861 ?auto_862 ) ) ( OBJ-AT ?auto_862 ?auto_864 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_862 ?auto_860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_867 - OBJ
      ?auto_868 - OBJ
      ?auto_866 - LOCATION
    )
    :vars
    (
      ?auto_870 - TRUCK
      ?auto_869 - LOCATION
      ?auto_871 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_870 ?auto_869 ) ( IN-CITY ?auto_869 ?auto_871 ) ( IN-CITY ?auto_866 ?auto_871 ) ( not ( = ?auto_866 ?auto_869 ) ) ( OBJ-AT ?auto_868 ?auto_866 ) ( not ( = ?auto_868 ?auto_867 ) ) ( OBJ-AT ?auto_867 ?auto_869 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_868 ?auto_867 ?auto_866 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_880 - OBJ
      ?auto_879 - LOCATION
    )
    :vars
    (
      ?auto_881 - LOCATION
      ?auto_884 - CITY
      ?auto_883 - OBJ
      ?auto_882 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_881 ?auto_884 ) ( IN-CITY ?auto_879 ?auto_884 ) ( not ( = ?auto_879 ?auto_881 ) ) ( OBJ-AT ?auto_883 ?auto_879 ) ( not ( = ?auto_883 ?auto_880 ) ) ( OBJ-AT ?auto_880 ?auto_881 ) ( TRUCK-AT ?auto_882 ?auto_879 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_882 ?auto_879 ?auto_881 ?auto_884 )
      ( DELIVER-2PKG ?auto_883 ?auto_880 ?auto_879 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_886 - OBJ
      ?auto_887 - OBJ
      ?auto_885 - LOCATION
    )
    :vars
    (
      ?auto_888 - LOCATION
      ?auto_889 - CITY
      ?auto_890 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_888 ?auto_889 ) ( IN-CITY ?auto_885 ?auto_889 ) ( not ( = ?auto_885 ?auto_888 ) ) ( OBJ-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_886 ?auto_887 ) ) ( OBJ-AT ?auto_887 ?auto_888 ) ( TRUCK-AT ?auto_890 ?auto_885 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_887 ?auto_885 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_892 - OBJ
      ?auto_893 - OBJ
      ?auto_891 - LOCATION
    )
    :vars
    (
      ?auto_896 - LOCATION
      ?auto_894 - CITY
      ?auto_895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_896 ?auto_894 ) ( IN-CITY ?auto_891 ?auto_894 ) ( not ( = ?auto_891 ?auto_896 ) ) ( OBJ-AT ?auto_893 ?auto_891 ) ( not ( = ?auto_893 ?auto_892 ) ) ( OBJ-AT ?auto_892 ?auto_896 ) ( TRUCK-AT ?auto_895 ?auto_891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_893 ?auto_892 ?auto_891 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_905 - OBJ
      ?auto_904 - LOCATION
    )
    :vars
    (
      ?auto_908 - LOCATION
      ?auto_906 - CITY
      ?auto_909 - OBJ
      ?auto_907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_908 ?auto_906 ) ( IN-CITY ?auto_904 ?auto_906 ) ( not ( = ?auto_904 ?auto_908 ) ) ( not ( = ?auto_909 ?auto_905 ) ) ( OBJ-AT ?auto_905 ?auto_908 ) ( TRUCK-AT ?auto_907 ?auto_904 ) ( IN-TRUCK ?auto_909 ?auto_907 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_909 ?auto_904 )
      ( DELIVER-2PKG ?auto_909 ?auto_905 ?auto_904 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_911 - OBJ
      ?auto_912 - OBJ
      ?auto_910 - LOCATION
    )
    :vars
    (
      ?auto_915 - LOCATION
      ?auto_914 - CITY
      ?auto_913 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_915 ?auto_914 ) ( IN-CITY ?auto_910 ?auto_914 ) ( not ( = ?auto_910 ?auto_915 ) ) ( not ( = ?auto_911 ?auto_912 ) ) ( OBJ-AT ?auto_912 ?auto_915 ) ( TRUCK-AT ?auto_913 ?auto_910 ) ( IN-TRUCK ?auto_911 ?auto_913 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_912 ?auto_910 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_917 - OBJ
      ?auto_918 - OBJ
      ?auto_916 - LOCATION
    )
    :vars
    (
      ?auto_920 - LOCATION
      ?auto_921 - CITY
      ?auto_919 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_920 ?auto_921 ) ( IN-CITY ?auto_916 ?auto_921 ) ( not ( = ?auto_916 ?auto_920 ) ) ( not ( = ?auto_918 ?auto_917 ) ) ( OBJ-AT ?auto_917 ?auto_920 ) ( TRUCK-AT ?auto_919 ?auto_916 ) ( IN-TRUCK ?auto_918 ?auto_919 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_918 ?auto_917 ?auto_916 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_930 - OBJ
      ?auto_929 - LOCATION
    )
    :vars
    (
      ?auto_933 - LOCATION
      ?auto_934 - CITY
      ?auto_932 - OBJ
      ?auto_931 - TRUCK
      ?auto_935 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_933 ?auto_934 ) ( IN-CITY ?auto_929 ?auto_934 ) ( not ( = ?auto_929 ?auto_933 ) ) ( not ( = ?auto_932 ?auto_930 ) ) ( OBJ-AT ?auto_930 ?auto_933 ) ( IN-TRUCK ?auto_932 ?auto_931 ) ( TRUCK-AT ?auto_931 ?auto_935 ) ( IN-CITY ?auto_935 ?auto_934 ) ( not ( = ?auto_929 ?auto_935 ) ) ( not ( = ?auto_933 ?auto_935 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_931 ?auto_935 ?auto_929 ?auto_934 )
      ( DELIVER-2PKG ?auto_932 ?auto_930 ?auto_929 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_937 - OBJ
      ?auto_938 - OBJ
      ?auto_936 - LOCATION
    )
    :vars
    (
      ?auto_940 - LOCATION
      ?auto_939 - CITY
      ?auto_941 - TRUCK
      ?auto_942 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_940 ?auto_939 ) ( IN-CITY ?auto_936 ?auto_939 ) ( not ( = ?auto_936 ?auto_940 ) ) ( not ( = ?auto_937 ?auto_938 ) ) ( OBJ-AT ?auto_938 ?auto_940 ) ( IN-TRUCK ?auto_937 ?auto_941 ) ( TRUCK-AT ?auto_941 ?auto_942 ) ( IN-CITY ?auto_942 ?auto_939 ) ( not ( = ?auto_936 ?auto_942 ) ) ( not ( = ?auto_940 ?auto_942 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_938 ?auto_936 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_944 - OBJ
      ?auto_945 - OBJ
      ?auto_943 - LOCATION
    )
    :vars
    (
      ?auto_949 - LOCATION
      ?auto_946 - CITY
      ?auto_947 - TRUCK
      ?auto_948 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_949 ?auto_946 ) ( IN-CITY ?auto_943 ?auto_946 ) ( not ( = ?auto_943 ?auto_949 ) ) ( not ( = ?auto_945 ?auto_944 ) ) ( OBJ-AT ?auto_944 ?auto_949 ) ( IN-TRUCK ?auto_945 ?auto_947 ) ( TRUCK-AT ?auto_947 ?auto_948 ) ( IN-CITY ?auto_948 ?auto_946 ) ( not ( = ?auto_943 ?auto_948 ) ) ( not ( = ?auto_949 ?auto_948 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_945 ?auto_944 ?auto_943 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_959 - OBJ
      ?auto_958 - LOCATION
    )
    :vars
    (
      ?auto_963 - LOCATION
      ?auto_960 - CITY
      ?auto_964 - OBJ
      ?auto_961 - TRUCK
      ?auto_962 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_963 ?auto_960 ) ( IN-CITY ?auto_958 ?auto_960 ) ( not ( = ?auto_958 ?auto_963 ) ) ( not ( = ?auto_964 ?auto_959 ) ) ( OBJ-AT ?auto_959 ?auto_963 ) ( TRUCK-AT ?auto_961 ?auto_962 ) ( IN-CITY ?auto_962 ?auto_960 ) ( not ( = ?auto_958 ?auto_962 ) ) ( not ( = ?auto_963 ?auto_962 ) ) ( OBJ-AT ?auto_964 ?auto_962 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_964 ?auto_961 ?auto_962 )
      ( DELIVER-2PKG ?auto_964 ?auto_959 ?auto_958 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_966 - OBJ
      ?auto_967 - OBJ
      ?auto_965 - LOCATION
    )
    :vars
    (
      ?auto_969 - LOCATION
      ?auto_971 - CITY
      ?auto_970 - TRUCK
      ?auto_968 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_969 ?auto_971 ) ( IN-CITY ?auto_965 ?auto_971 ) ( not ( = ?auto_965 ?auto_969 ) ) ( not ( = ?auto_966 ?auto_967 ) ) ( OBJ-AT ?auto_967 ?auto_969 ) ( TRUCK-AT ?auto_970 ?auto_968 ) ( IN-CITY ?auto_968 ?auto_971 ) ( not ( = ?auto_965 ?auto_968 ) ) ( not ( = ?auto_969 ?auto_968 ) ) ( OBJ-AT ?auto_966 ?auto_968 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_967 ?auto_965 ) )
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
      ?auto_978 - CITY
      ?auto_976 - TRUCK
      ?auto_975 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_977 ?auto_978 ) ( IN-CITY ?auto_972 ?auto_978 ) ( not ( = ?auto_972 ?auto_977 ) ) ( not ( = ?auto_974 ?auto_973 ) ) ( OBJ-AT ?auto_973 ?auto_977 ) ( TRUCK-AT ?auto_976 ?auto_975 ) ( IN-CITY ?auto_975 ?auto_978 ) ( not ( = ?auto_972 ?auto_975 ) ) ( not ( = ?auto_977 ?auto_975 ) ) ( OBJ-AT ?auto_974 ?auto_975 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_974 ?auto_973 ?auto_972 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_988 - OBJ
      ?auto_987 - LOCATION
    )
    :vars
    (
      ?auto_991 - LOCATION
      ?auto_992 - CITY
      ?auto_993 - OBJ
      ?auto_989 - LOCATION
      ?auto_990 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_991 ?auto_992 ) ( IN-CITY ?auto_987 ?auto_992 ) ( not ( = ?auto_987 ?auto_991 ) ) ( not ( = ?auto_993 ?auto_988 ) ) ( OBJ-AT ?auto_988 ?auto_991 ) ( IN-CITY ?auto_989 ?auto_992 ) ( not ( = ?auto_987 ?auto_989 ) ) ( not ( = ?auto_991 ?auto_989 ) ) ( OBJ-AT ?auto_993 ?auto_989 ) ( TRUCK-AT ?auto_990 ?auto_987 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_990 ?auto_987 ?auto_989 ?auto_992 )
      ( DELIVER-2PKG ?auto_993 ?auto_988 ?auto_987 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_995 - OBJ
      ?auto_996 - OBJ
      ?auto_994 - LOCATION
    )
    :vars
    (
      ?auto_998 - LOCATION
      ?auto_999 - CITY
      ?auto_997 - LOCATION
      ?auto_1000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_998 ?auto_999 ) ( IN-CITY ?auto_994 ?auto_999 ) ( not ( = ?auto_994 ?auto_998 ) ) ( not ( = ?auto_995 ?auto_996 ) ) ( OBJ-AT ?auto_996 ?auto_998 ) ( IN-CITY ?auto_997 ?auto_999 ) ( not ( = ?auto_994 ?auto_997 ) ) ( not ( = ?auto_998 ?auto_997 ) ) ( OBJ-AT ?auto_995 ?auto_997 ) ( TRUCK-AT ?auto_1000 ?auto_994 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_996 ?auto_994 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1002 - OBJ
      ?auto_1003 - OBJ
      ?auto_1001 - LOCATION
    )
    :vars
    (
      ?auto_1004 - LOCATION
      ?auto_1007 - CITY
      ?auto_1005 - LOCATION
      ?auto_1006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1004 ?auto_1007 ) ( IN-CITY ?auto_1001 ?auto_1007 ) ( not ( = ?auto_1001 ?auto_1004 ) ) ( not ( = ?auto_1003 ?auto_1002 ) ) ( OBJ-AT ?auto_1002 ?auto_1004 ) ( IN-CITY ?auto_1005 ?auto_1007 ) ( not ( = ?auto_1001 ?auto_1005 ) ) ( not ( = ?auto_1004 ?auto_1005 ) ) ( OBJ-AT ?auto_1003 ?auto_1005 ) ( TRUCK-AT ?auto_1006 ?auto_1001 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1003 ?auto_1002 ?auto_1001 ) )
  )

)

