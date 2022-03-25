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
      ?auto_813 - OBJ
      ?auto_812 - LOCATION
    )
    :vars
    (
      ?auto_815 - LOCATION
      ?auto_816 - CITY
      ?auto_814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_815 ?auto_816 ) ( IN-CITY ?auto_812 ?auto_816 ) ( not ( = ?auto_812 ?auto_815 ) ) ( OBJ-AT ?auto_813 ?auto_815 ) ( TRUCK-AT ?auto_814 ?auto_812 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_814 ?auto_812 ?auto_815 ?auto_816 )
      ( !LOAD-TRUCK ?auto_813 ?auto_814 ?auto_815 )
      ( !DRIVE-TRUCK ?auto_814 ?auto_815 ?auto_812 ?auto_816 )
      ( !UNLOAD-TRUCK ?auto_813 ?auto_814 ?auto_812 )
      ( DELIVER-1PKG-VERIFY ?auto_813 ?auto_812 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_820 - OBJ
      ?auto_819 - LOCATION
    )
    :vars
    (
      ?auto_822 - LOCATION
      ?auto_823 - CITY
      ?auto_821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_822 ?auto_823 ) ( IN-CITY ?auto_819 ?auto_823 ) ( not ( = ?auto_819 ?auto_822 ) ) ( OBJ-AT ?auto_820 ?auto_822 ) ( TRUCK-AT ?auto_821 ?auto_819 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_821 ?auto_819 ?auto_822 ?auto_823 )
      ( !LOAD-TRUCK ?auto_820 ?auto_821 ?auto_822 )
      ( !DRIVE-TRUCK ?auto_821 ?auto_822 ?auto_819 ?auto_823 )
      ( !UNLOAD-TRUCK ?auto_820 ?auto_821 ?auto_819 )
      ( DELIVER-1PKG-VERIFY ?auto_820 ?auto_819 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_834 - OBJ
      ?auto_835 - OBJ
      ?auto_833 - LOCATION
    )
    :vars
    (
      ?auto_838 - LOCATION
      ?auto_836 - CITY
      ?auto_839 - LOCATION
      ?auto_837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_838 ?auto_836 ) ( IN-CITY ?auto_833 ?auto_836 ) ( not ( = ?auto_833 ?auto_838 ) ) ( OBJ-AT ?auto_835 ?auto_838 ) ( IN-CITY ?auto_839 ?auto_836 ) ( not ( = ?auto_833 ?auto_839 ) ) ( OBJ-AT ?auto_834 ?auto_839 ) ( TRUCK-AT ?auto_837 ?auto_833 ) ( not ( = ?auto_834 ?auto_835 ) ) ( not ( = ?auto_838 ?auto_839 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_834 ?auto_833 )
      ( DELIVER-1PKG ?auto_835 ?auto_833 )
      ( DELIVER-2PKG-VERIFY ?auto_834 ?auto_835 ?auto_833 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_841 - OBJ
      ?auto_842 - OBJ
      ?auto_840 - LOCATION
    )
    :vars
    (
      ?auto_846 - LOCATION
      ?auto_845 - CITY
      ?auto_844 - LOCATION
      ?auto_843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_846 ?auto_845 ) ( IN-CITY ?auto_840 ?auto_845 ) ( not ( = ?auto_840 ?auto_846 ) ) ( OBJ-AT ?auto_841 ?auto_846 ) ( IN-CITY ?auto_844 ?auto_845 ) ( not ( = ?auto_840 ?auto_844 ) ) ( OBJ-AT ?auto_842 ?auto_844 ) ( TRUCK-AT ?auto_843 ?auto_840 ) ( not ( = ?auto_842 ?auto_841 ) ) ( not ( = ?auto_846 ?auto_844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_842 ?auto_841 ?auto_840 )
      ( DELIVER-2PKG-VERIFY ?auto_841 ?auto_842 ?auto_840 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_858 - OBJ
      ?auto_857 - LOCATION
    )
    :vars
    (
      ?auto_860 - LOCATION
      ?auto_861 - CITY
      ?auto_859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_860 ?auto_861 ) ( IN-CITY ?auto_857 ?auto_861 ) ( not ( = ?auto_857 ?auto_860 ) ) ( OBJ-AT ?auto_858 ?auto_860 ) ( TRUCK-AT ?auto_859 ?auto_857 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_859 ?auto_857 ?auto_860 ?auto_861 )
      ( !LOAD-TRUCK ?auto_858 ?auto_859 ?auto_860 )
      ( !DRIVE-TRUCK ?auto_859 ?auto_860 ?auto_857 ?auto_861 )
      ( !UNLOAD-TRUCK ?auto_858 ?auto_859 ?auto_857 )
      ( DELIVER-1PKG-VERIFY ?auto_858 ?auto_857 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_948 - OBJ
      ?auto_949 - OBJ
      ?auto_950 - OBJ
      ?auto_947 - LOCATION
    )
    :vars
    (
      ?auto_952 - LOCATION
      ?auto_951 - CITY
      ?auto_954 - LOCATION
      ?auto_953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_952 ?auto_951 ) ( IN-CITY ?auto_947 ?auto_951 ) ( not ( = ?auto_947 ?auto_952 ) ) ( OBJ-AT ?auto_950 ?auto_952 ) ( OBJ-AT ?auto_949 ?auto_952 ) ( IN-CITY ?auto_954 ?auto_951 ) ( not ( = ?auto_947 ?auto_954 ) ) ( OBJ-AT ?auto_948 ?auto_954 ) ( TRUCK-AT ?auto_953 ?auto_947 ) ( not ( = ?auto_948 ?auto_949 ) ) ( not ( = ?auto_952 ?auto_954 ) ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_949 ?auto_950 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_949 ?auto_948 ?auto_947 )
      ( DELIVER-1PKG ?auto_950 ?auto_947 )
      ( DELIVER-3PKG-VERIFY ?auto_948 ?auto_949 ?auto_950 ?auto_947 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_965 - OBJ
      ?auto_966 - OBJ
      ?auto_967 - OBJ
      ?auto_964 - LOCATION
    )
    :vars
    (
      ?auto_968 - LOCATION
      ?auto_971 - CITY
      ?auto_970 - LOCATION
      ?auto_969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_968 ?auto_971 ) ( IN-CITY ?auto_964 ?auto_971 ) ( not ( = ?auto_964 ?auto_968 ) ) ( OBJ-AT ?auto_966 ?auto_968 ) ( OBJ-AT ?auto_967 ?auto_968 ) ( IN-CITY ?auto_970 ?auto_971 ) ( not ( = ?auto_964 ?auto_970 ) ) ( OBJ-AT ?auto_965 ?auto_970 ) ( TRUCK-AT ?auto_969 ?auto_964 ) ( not ( = ?auto_965 ?auto_967 ) ) ( not ( = ?auto_968 ?auto_970 ) ) ( not ( = ?auto_965 ?auto_966 ) ) ( not ( = ?auto_967 ?auto_966 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_965 ?auto_967 ?auto_966 ?auto_964 )
      ( DELIVER-3PKG-VERIFY ?auto_965 ?auto_966 ?auto_967 ?auto_964 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_982 - OBJ
      ?auto_983 - OBJ
      ?auto_984 - OBJ
      ?auto_981 - LOCATION
    )
    :vars
    (
      ?auto_987 - LOCATION
      ?auto_988 - CITY
      ?auto_986 - LOCATION
      ?auto_985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_987 ?auto_988 ) ( IN-CITY ?auto_981 ?auto_988 ) ( not ( = ?auto_981 ?auto_987 ) ) ( OBJ-AT ?auto_984 ?auto_987 ) ( OBJ-AT ?auto_982 ?auto_987 ) ( IN-CITY ?auto_986 ?auto_988 ) ( not ( = ?auto_981 ?auto_986 ) ) ( OBJ-AT ?auto_983 ?auto_986 ) ( TRUCK-AT ?auto_985 ?auto_981 ) ( not ( = ?auto_983 ?auto_982 ) ) ( not ( = ?auto_987 ?auto_986 ) ) ( not ( = ?auto_983 ?auto_984 ) ) ( not ( = ?auto_982 ?auto_984 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_983 ?auto_984 ?auto_982 ?auto_981 )
      ( DELIVER-3PKG-VERIFY ?auto_982 ?auto_983 ?auto_984 ?auto_981 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_999 - OBJ
      ?auto_1000 - OBJ
      ?auto_1001 - OBJ
      ?auto_998 - LOCATION
    )
    :vars
    (
      ?auto_1004 - LOCATION
      ?auto_1005 - CITY
      ?auto_1003 - LOCATION
      ?auto_1002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1004 ?auto_1005 ) ( IN-CITY ?auto_998 ?auto_1005 ) ( not ( = ?auto_998 ?auto_1004 ) ) ( OBJ-AT ?auto_1000 ?auto_1004 ) ( OBJ-AT ?auto_999 ?auto_1004 ) ( IN-CITY ?auto_1003 ?auto_1005 ) ( not ( = ?auto_998 ?auto_1003 ) ) ( OBJ-AT ?auto_1001 ?auto_1003 ) ( TRUCK-AT ?auto_1002 ?auto_998 ) ( not ( = ?auto_1001 ?auto_999 ) ) ( not ( = ?auto_1004 ?auto_1003 ) ) ( not ( = ?auto_1001 ?auto_1000 ) ) ( not ( = ?auto_999 ?auto_1000 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1001 ?auto_1000 ?auto_999 ?auto_998 )
      ( DELIVER-3PKG-VERIFY ?auto_999 ?auto_1000 ?auto_1001 ?auto_998 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1034 - OBJ
      ?auto_1035 - OBJ
      ?auto_1036 - OBJ
      ?auto_1033 - LOCATION
    )
    :vars
    (
      ?auto_1039 - LOCATION
      ?auto_1040 - CITY
      ?auto_1038 - LOCATION
      ?auto_1037 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1039 ?auto_1040 ) ( IN-CITY ?auto_1033 ?auto_1040 ) ( not ( = ?auto_1033 ?auto_1039 ) ) ( OBJ-AT ?auto_1034 ?auto_1039 ) ( OBJ-AT ?auto_1036 ?auto_1039 ) ( IN-CITY ?auto_1038 ?auto_1040 ) ( not ( = ?auto_1033 ?auto_1038 ) ) ( OBJ-AT ?auto_1035 ?auto_1038 ) ( TRUCK-AT ?auto_1037 ?auto_1033 ) ( not ( = ?auto_1035 ?auto_1036 ) ) ( not ( = ?auto_1039 ?auto_1038 ) ) ( not ( = ?auto_1035 ?auto_1034 ) ) ( not ( = ?auto_1036 ?auto_1034 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1035 ?auto_1034 ?auto_1036 ?auto_1033 )
      ( DELIVER-3PKG-VERIFY ?auto_1034 ?auto_1035 ?auto_1036 ?auto_1033 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1051 - OBJ
      ?auto_1052 - OBJ
      ?auto_1053 - OBJ
      ?auto_1050 - LOCATION
    )
    :vars
    (
      ?auto_1056 - LOCATION
      ?auto_1057 - CITY
      ?auto_1055 - LOCATION
      ?auto_1054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1056 ?auto_1057 ) ( IN-CITY ?auto_1050 ?auto_1057 ) ( not ( = ?auto_1050 ?auto_1056 ) ) ( OBJ-AT ?auto_1051 ?auto_1056 ) ( OBJ-AT ?auto_1052 ?auto_1056 ) ( IN-CITY ?auto_1055 ?auto_1057 ) ( not ( = ?auto_1050 ?auto_1055 ) ) ( OBJ-AT ?auto_1053 ?auto_1055 ) ( TRUCK-AT ?auto_1054 ?auto_1050 ) ( not ( = ?auto_1053 ?auto_1052 ) ) ( not ( = ?auto_1056 ?auto_1055 ) ) ( not ( = ?auto_1053 ?auto_1051 ) ) ( not ( = ?auto_1052 ?auto_1051 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1053 ?auto_1051 ?auto_1052 ?auto_1050 )
      ( DELIVER-3PKG-VERIFY ?auto_1051 ?auto_1052 ?auto_1053 ?auto_1050 ) )
  )

)

