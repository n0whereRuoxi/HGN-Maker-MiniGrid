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
      ?auto_810 - OBJ
      ?auto_809 - LOCATION
    )
    :vars
    (
      ?auto_812 - LOCATION
      ?auto_813 - CITY
      ?auto_811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_812 ?auto_813 ) ( IN-CITY ?auto_809 ?auto_813 ) ( not ( = ?auto_809 ?auto_812 ) ) ( OBJ-AT ?auto_810 ?auto_812 ) ( TRUCK-AT ?auto_811 ?auto_809 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_811 ?auto_809 ?auto_812 ?auto_813 )
      ( !LOAD-TRUCK ?auto_810 ?auto_811 ?auto_812 )
      ( !DRIVE-TRUCK ?auto_811 ?auto_812 ?auto_809 ?auto_813 )
      ( !UNLOAD-TRUCK ?auto_810 ?auto_811 ?auto_809 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_817 - OBJ
      ?auto_816 - LOCATION
    )
    :vars
    (
      ?auto_819 - LOCATION
      ?auto_820 - CITY
      ?auto_818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_819 ?auto_820 ) ( IN-CITY ?auto_816 ?auto_820 ) ( not ( = ?auto_816 ?auto_819 ) ) ( OBJ-AT ?auto_817 ?auto_819 ) ( TRUCK-AT ?auto_818 ?auto_816 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_818 ?auto_816 ?auto_819 ?auto_820 )
      ( !LOAD-TRUCK ?auto_817 ?auto_818 ?auto_819 )
      ( !DRIVE-TRUCK ?auto_818 ?auto_819 ?auto_816 ?auto_820 )
      ( !UNLOAD-TRUCK ?auto_817 ?auto_818 ?auto_816 ) )
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
      ?auto_833 - LOCATION
      ?auto_834 - CITY
      ?auto_836 - LOCATION
      ?auto_835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_833 ?auto_834 ) ( IN-CITY ?auto_830 ?auto_834 ) ( not ( = ?auto_830 ?auto_833 ) ) ( OBJ-AT ?auto_832 ?auto_833 ) ( IN-CITY ?auto_836 ?auto_834 ) ( not ( = ?auto_830 ?auto_836 ) ) ( OBJ-AT ?auto_831 ?auto_836 ) ( TRUCK-AT ?auto_835 ?auto_830 ) ( not ( = ?auto_831 ?auto_832 ) ) ( not ( = ?auto_833 ?auto_836 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_831 ?auto_830 )
      ( DELIVER-1PKG ?auto_832 ?auto_830 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_838 - OBJ
      ?auto_839 - OBJ
      ?auto_837 - LOCATION
    )
    :vars
    (
      ?auto_842 - LOCATION
      ?auto_841 - CITY
      ?auto_843 - LOCATION
      ?auto_840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_842 ?auto_841 ) ( IN-CITY ?auto_837 ?auto_841 ) ( not ( = ?auto_837 ?auto_842 ) ) ( OBJ-AT ?auto_838 ?auto_842 ) ( IN-CITY ?auto_843 ?auto_841 ) ( not ( = ?auto_837 ?auto_843 ) ) ( OBJ-AT ?auto_839 ?auto_843 ) ( TRUCK-AT ?auto_840 ?auto_837 ) ( not ( = ?auto_839 ?auto_838 ) ) ( not ( = ?auto_842 ?auto_843 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_839 ?auto_838 ?auto_837 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_855 - OBJ
      ?auto_854 - LOCATION
    )
    :vars
    (
      ?auto_857 - LOCATION
      ?auto_858 - CITY
      ?auto_856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_857 ?auto_858 ) ( IN-CITY ?auto_854 ?auto_858 ) ( not ( = ?auto_854 ?auto_857 ) ) ( OBJ-AT ?auto_855 ?auto_857 ) ( TRUCK-AT ?auto_856 ?auto_854 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_856 ?auto_854 ?auto_857 ?auto_858 )
      ( !LOAD-TRUCK ?auto_855 ?auto_856 ?auto_857 )
      ( !DRIVE-TRUCK ?auto_856 ?auto_857 ?auto_854 ?auto_858 )
      ( !UNLOAD-TRUCK ?auto_855 ?auto_856 ?auto_854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_945 - OBJ
      ?auto_946 - OBJ
      ?auto_947 - OBJ
      ?auto_944 - LOCATION
    )
    :vars
    (
      ?auto_950 - LOCATION
      ?auto_948 - CITY
      ?auto_951 - LOCATION
      ?auto_949 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950 ?auto_948 ) ( IN-CITY ?auto_944 ?auto_948 ) ( not ( = ?auto_944 ?auto_950 ) ) ( OBJ-AT ?auto_947 ?auto_950 ) ( OBJ-AT ?auto_946 ?auto_950 ) ( IN-CITY ?auto_951 ?auto_948 ) ( not ( = ?auto_944 ?auto_951 ) ) ( OBJ-AT ?auto_945 ?auto_951 ) ( TRUCK-AT ?auto_949 ?auto_944 ) ( not ( = ?auto_945 ?auto_946 ) ) ( not ( = ?auto_950 ?auto_951 ) ) ( not ( = ?auto_945 ?auto_947 ) ) ( not ( = ?auto_946 ?auto_947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_946 ?auto_945 ?auto_944 )
      ( DELIVER-1PKG ?auto_947 ?auto_944 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_962 - OBJ
      ?auto_963 - OBJ
      ?auto_964 - OBJ
      ?auto_961 - LOCATION
    )
    :vars
    (
      ?auto_966 - LOCATION
      ?auto_968 - CITY
      ?auto_967 - LOCATION
      ?auto_965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_966 ?auto_968 ) ( IN-CITY ?auto_961 ?auto_968 ) ( not ( = ?auto_961 ?auto_966 ) ) ( OBJ-AT ?auto_963 ?auto_966 ) ( OBJ-AT ?auto_964 ?auto_966 ) ( IN-CITY ?auto_967 ?auto_968 ) ( not ( = ?auto_961 ?auto_967 ) ) ( OBJ-AT ?auto_962 ?auto_967 ) ( TRUCK-AT ?auto_965 ?auto_961 ) ( not ( = ?auto_962 ?auto_964 ) ) ( not ( = ?auto_966 ?auto_967 ) ) ( not ( = ?auto_962 ?auto_963 ) ) ( not ( = ?auto_964 ?auto_963 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_962 ?auto_964 ?auto_963 ?auto_961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_979 - OBJ
      ?auto_980 - OBJ
      ?auto_981 - OBJ
      ?auto_978 - LOCATION
    )
    :vars
    (
      ?auto_985 - LOCATION
      ?auto_982 - CITY
      ?auto_983 - LOCATION
      ?auto_984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_985 ?auto_982 ) ( IN-CITY ?auto_978 ?auto_982 ) ( not ( = ?auto_978 ?auto_985 ) ) ( OBJ-AT ?auto_981 ?auto_985 ) ( OBJ-AT ?auto_979 ?auto_985 ) ( IN-CITY ?auto_983 ?auto_982 ) ( not ( = ?auto_978 ?auto_983 ) ) ( OBJ-AT ?auto_980 ?auto_983 ) ( TRUCK-AT ?auto_984 ?auto_978 ) ( not ( = ?auto_980 ?auto_979 ) ) ( not ( = ?auto_985 ?auto_983 ) ) ( not ( = ?auto_980 ?auto_981 ) ) ( not ( = ?auto_979 ?auto_981 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_980 ?auto_981 ?auto_979 ?auto_978 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_996 - OBJ
      ?auto_997 - OBJ
      ?auto_998 - OBJ
      ?auto_995 - LOCATION
    )
    :vars
    (
      ?auto_1002 - LOCATION
      ?auto_999 - CITY
      ?auto_1000 - LOCATION
      ?auto_1001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1002 ?auto_999 ) ( IN-CITY ?auto_995 ?auto_999 ) ( not ( = ?auto_995 ?auto_1002 ) ) ( OBJ-AT ?auto_997 ?auto_1002 ) ( OBJ-AT ?auto_996 ?auto_1002 ) ( IN-CITY ?auto_1000 ?auto_999 ) ( not ( = ?auto_995 ?auto_1000 ) ) ( OBJ-AT ?auto_998 ?auto_1000 ) ( TRUCK-AT ?auto_1001 ?auto_995 ) ( not ( = ?auto_998 ?auto_996 ) ) ( not ( = ?auto_1002 ?auto_1000 ) ) ( not ( = ?auto_998 ?auto_997 ) ) ( not ( = ?auto_996 ?auto_997 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_998 ?auto_997 ?auto_996 ?auto_995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1031 - OBJ
      ?auto_1032 - OBJ
      ?auto_1033 - OBJ
      ?auto_1030 - LOCATION
    )
    :vars
    (
      ?auto_1037 - LOCATION
      ?auto_1034 - CITY
      ?auto_1035 - LOCATION
      ?auto_1036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1037 ?auto_1034 ) ( IN-CITY ?auto_1030 ?auto_1034 ) ( not ( = ?auto_1030 ?auto_1037 ) ) ( OBJ-AT ?auto_1031 ?auto_1037 ) ( OBJ-AT ?auto_1033 ?auto_1037 ) ( IN-CITY ?auto_1035 ?auto_1034 ) ( not ( = ?auto_1030 ?auto_1035 ) ) ( OBJ-AT ?auto_1032 ?auto_1035 ) ( TRUCK-AT ?auto_1036 ?auto_1030 ) ( not ( = ?auto_1032 ?auto_1033 ) ) ( not ( = ?auto_1037 ?auto_1035 ) ) ( not ( = ?auto_1032 ?auto_1031 ) ) ( not ( = ?auto_1033 ?auto_1031 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1032 ?auto_1031 ?auto_1033 ?auto_1030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1048 - OBJ
      ?auto_1049 - OBJ
      ?auto_1050 - OBJ
      ?auto_1047 - LOCATION
    )
    :vars
    (
      ?auto_1054 - LOCATION
      ?auto_1051 - CITY
      ?auto_1052 - LOCATION
      ?auto_1053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1054 ?auto_1051 ) ( IN-CITY ?auto_1047 ?auto_1051 ) ( not ( = ?auto_1047 ?auto_1054 ) ) ( OBJ-AT ?auto_1048 ?auto_1054 ) ( OBJ-AT ?auto_1049 ?auto_1054 ) ( IN-CITY ?auto_1052 ?auto_1051 ) ( not ( = ?auto_1047 ?auto_1052 ) ) ( OBJ-AT ?auto_1050 ?auto_1052 ) ( TRUCK-AT ?auto_1053 ?auto_1047 ) ( not ( = ?auto_1050 ?auto_1049 ) ) ( not ( = ?auto_1054 ?auto_1052 ) ) ( not ( = ?auto_1050 ?auto_1048 ) ) ( not ( = ?auto_1049 ?auto_1048 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1050 ?auto_1048 ?auto_1049 ?auto_1047 ) )
  )

)

