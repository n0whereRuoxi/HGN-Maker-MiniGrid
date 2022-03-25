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
      ?auto_6795 - OBJ
      ?auto_6794 - LOCATION
    )
    :vars
    (
      ?auto_6796 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6796 ?auto_6794 ) ( IN-TRUCK ?auto_6795 ?auto_6796 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_6795 ?auto_6796 ?auto_6794 )
      ( DELIVER-1PKG-VERIFY ?auto_6795 ?auto_6794 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6807 - OBJ
      ?auto_6806 - LOCATION
    )
    :vars
    (
      ?auto_6808 - TRUCK
      ?auto_6809 - LOCATION
      ?auto_6810 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6807 ?auto_6808 ) ( TRUCK-AT ?auto_6808 ?auto_6809 ) ( IN-CITY ?auto_6809 ?auto_6810 ) ( IN-CITY ?auto_6806 ?auto_6810 ) ( not ( = ?auto_6806 ?auto_6809 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6808 ?auto_6809 ?auto_6806 ?auto_6810 )
      ( DELIVER-1PKG ?auto_6807 ?auto_6806 )
      ( DELIVER-1PKG-VERIFY ?auto_6807 ?auto_6806 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6825 - OBJ
      ?auto_6824 - LOCATION
    )
    :vars
    (
      ?auto_6828 - TRUCK
      ?auto_6827 - LOCATION
      ?auto_6826 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6828 ?auto_6827 ) ( IN-CITY ?auto_6827 ?auto_6826 ) ( IN-CITY ?auto_6824 ?auto_6826 ) ( not ( = ?auto_6824 ?auto_6827 ) ) ( OBJ-AT ?auto_6825 ?auto_6827 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6825 ?auto_6828 ?auto_6827 )
      ( DELIVER-1PKG ?auto_6825 ?auto_6824 )
      ( DELIVER-1PKG-VERIFY ?auto_6825 ?auto_6824 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6843 - OBJ
      ?auto_6842 - LOCATION
    )
    :vars
    (
      ?auto_6844 - LOCATION
      ?auto_6846 - CITY
      ?auto_6845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6844 ?auto_6846 ) ( IN-CITY ?auto_6842 ?auto_6846 ) ( not ( = ?auto_6842 ?auto_6844 ) ) ( OBJ-AT ?auto_6843 ?auto_6844 ) ( TRUCK-AT ?auto_6845 ?auto_6842 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6845 ?auto_6842 ?auto_6844 ?auto_6846 )
      ( DELIVER-1PKG ?auto_6843 ?auto_6842 )
      ( DELIVER-1PKG-VERIFY ?auto_6843 ?auto_6842 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6903 - OBJ
      ?auto_6904 - OBJ
      ?auto_6902 - LOCATION
    )
    :vars
    (
      ?auto_6905 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6905 ?auto_6902 ) ( IN-TRUCK ?auto_6904 ?auto_6905 ) ( OBJ-AT ?auto_6903 ?auto_6902 ) ( not ( = ?auto_6903 ?auto_6904 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6904 ?auto_6902 )
      ( DELIVER-2PKG-VERIFY ?auto_6903 ?auto_6904 ?auto_6902 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6907 - OBJ
      ?auto_6908 - OBJ
      ?auto_6906 - LOCATION
    )
    :vars
    (
      ?auto_6909 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6909 ?auto_6906 ) ( IN-TRUCK ?auto_6907 ?auto_6909 ) ( OBJ-AT ?auto_6908 ?auto_6906 ) ( not ( = ?auto_6907 ?auto_6908 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6907 ?auto_6906 )
      ( DELIVER-2PKG-VERIFY ?auto_6907 ?auto_6908 ?auto_6906 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6915 - OBJ
      ?auto_6916 - OBJ
      ?auto_6917 - OBJ
      ?auto_6914 - LOCATION
    )
    :vars
    (
      ?auto_6918 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6918 ?auto_6914 ) ( IN-TRUCK ?auto_6917 ?auto_6918 ) ( OBJ-AT ?auto_6915 ?auto_6914 ) ( OBJ-AT ?auto_6916 ?auto_6914 ) ( not ( = ?auto_6915 ?auto_6916 ) ) ( not ( = ?auto_6915 ?auto_6917 ) ) ( not ( = ?auto_6916 ?auto_6917 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6917 ?auto_6914 )
      ( DELIVER-3PKG-VERIFY ?auto_6915 ?auto_6916 ?auto_6917 ?auto_6914 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6920 - OBJ
      ?auto_6921 - OBJ
      ?auto_6922 - OBJ
      ?auto_6919 - LOCATION
    )
    :vars
    (
      ?auto_6923 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6923 ?auto_6919 ) ( IN-TRUCK ?auto_6921 ?auto_6923 ) ( OBJ-AT ?auto_6920 ?auto_6919 ) ( OBJ-AT ?auto_6922 ?auto_6919 ) ( not ( = ?auto_6920 ?auto_6921 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6921 ?auto_6922 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6921 ?auto_6919 )
      ( DELIVER-3PKG-VERIFY ?auto_6920 ?auto_6921 ?auto_6922 ?auto_6919 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6930 - OBJ
      ?auto_6931 - OBJ
      ?auto_6932 - OBJ
      ?auto_6929 - LOCATION
    )
    :vars
    (
      ?auto_6933 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_6933 ?auto_6929 ) ( IN-TRUCK ?auto_6930 ?auto_6933 ) ( OBJ-AT ?auto_6931 ?auto_6929 ) ( OBJ-AT ?auto_6932 ?auto_6929 ) ( not ( = ?auto_6930 ?auto_6931 ) ) ( not ( = ?auto_6930 ?auto_6932 ) ) ( not ( = ?auto_6931 ?auto_6932 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6930 ?auto_6929 )
      ( DELIVER-3PKG-VERIFY ?auto_6930 ?auto_6931 ?auto_6932 ?auto_6929 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6955 - OBJ
      ?auto_6956 - OBJ
      ?auto_6954 - LOCATION
    )
    :vars
    (
      ?auto_6959 - TRUCK
      ?auto_6958 - LOCATION
      ?auto_6957 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6956 ?auto_6959 ) ( TRUCK-AT ?auto_6959 ?auto_6958 ) ( IN-CITY ?auto_6958 ?auto_6957 ) ( IN-CITY ?auto_6954 ?auto_6957 ) ( not ( = ?auto_6954 ?auto_6958 ) ) ( OBJ-AT ?auto_6955 ?auto_6954 ) ( not ( = ?auto_6955 ?auto_6956 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6956 ?auto_6954 )
      ( DELIVER-2PKG-VERIFY ?auto_6955 ?auto_6956 ?auto_6954 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6961 - OBJ
      ?auto_6962 - OBJ
      ?auto_6960 - LOCATION
    )
    :vars
    (
      ?auto_6964 - TRUCK
      ?auto_6963 - LOCATION
      ?auto_6965 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6961 ?auto_6964 ) ( TRUCK-AT ?auto_6964 ?auto_6963 ) ( IN-CITY ?auto_6963 ?auto_6965 ) ( IN-CITY ?auto_6960 ?auto_6965 ) ( not ( = ?auto_6960 ?auto_6963 ) ) ( OBJ-AT ?auto_6962 ?auto_6960 ) ( not ( = ?auto_6962 ?auto_6961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6962 ?auto_6961 ?auto_6960 )
      ( DELIVER-2PKG-VERIFY ?auto_6961 ?auto_6962 ?auto_6960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6974 - OBJ
      ?auto_6975 - OBJ
      ?auto_6976 - OBJ
      ?auto_6973 - LOCATION
    )
    :vars
    (
      ?auto_6978 - TRUCK
      ?auto_6977 - LOCATION
      ?auto_6979 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6976 ?auto_6978 ) ( TRUCK-AT ?auto_6978 ?auto_6977 ) ( IN-CITY ?auto_6977 ?auto_6979 ) ( IN-CITY ?auto_6973 ?auto_6979 ) ( not ( = ?auto_6973 ?auto_6977 ) ) ( OBJ-AT ?auto_6974 ?auto_6973 ) ( not ( = ?auto_6974 ?auto_6976 ) ) ( OBJ-AT ?auto_6975 ?auto_6973 ) ( not ( = ?auto_6974 ?auto_6975 ) ) ( not ( = ?auto_6975 ?auto_6976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6974 ?auto_6976 ?auto_6973 )
      ( DELIVER-3PKG-VERIFY ?auto_6974 ?auto_6975 ?auto_6976 ?auto_6973 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6981 - OBJ
      ?auto_6982 - OBJ
      ?auto_6983 - OBJ
      ?auto_6980 - LOCATION
    )
    :vars
    (
      ?auto_6985 - TRUCK
      ?auto_6984 - LOCATION
      ?auto_6986 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6982 ?auto_6985 ) ( TRUCK-AT ?auto_6985 ?auto_6984 ) ( IN-CITY ?auto_6984 ?auto_6986 ) ( IN-CITY ?auto_6980 ?auto_6986 ) ( not ( = ?auto_6980 ?auto_6984 ) ) ( OBJ-AT ?auto_6981 ?auto_6980 ) ( not ( = ?auto_6981 ?auto_6982 ) ) ( OBJ-AT ?auto_6983 ?auto_6980 ) ( not ( = ?auto_6981 ?auto_6983 ) ) ( not ( = ?auto_6982 ?auto_6983 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6981 ?auto_6982 ?auto_6980 )
      ( DELIVER-3PKG-VERIFY ?auto_6981 ?auto_6982 ?auto_6983 ?auto_6980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6995 - OBJ
      ?auto_6996 - OBJ
      ?auto_6997 - OBJ
      ?auto_6994 - LOCATION
    )
    :vars
    (
      ?auto_6999 - TRUCK
      ?auto_6998 - LOCATION
      ?auto_7000 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_6995 ?auto_6999 ) ( TRUCK-AT ?auto_6999 ?auto_6998 ) ( IN-CITY ?auto_6998 ?auto_7000 ) ( IN-CITY ?auto_6994 ?auto_7000 ) ( not ( = ?auto_6994 ?auto_6998 ) ) ( OBJ-AT ?auto_6997 ?auto_6994 ) ( not ( = ?auto_6997 ?auto_6995 ) ) ( OBJ-AT ?auto_6996 ?auto_6994 ) ( not ( = ?auto_6995 ?auto_6996 ) ) ( not ( = ?auto_6996 ?auto_6997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6997 ?auto_6995 ?auto_6994 )
      ( DELIVER-3PKG-VERIFY ?auto_6995 ?auto_6996 ?auto_6997 ?auto_6994 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7024 - OBJ
      ?auto_7023 - LOCATION
    )
    :vars
    (
      ?auto_7027 - TRUCK
      ?auto_7026 - LOCATION
      ?auto_7028 - CITY
      ?auto_7025 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7027 ?auto_7026 ) ( IN-CITY ?auto_7026 ?auto_7028 ) ( IN-CITY ?auto_7023 ?auto_7028 ) ( not ( = ?auto_7023 ?auto_7026 ) ) ( OBJ-AT ?auto_7025 ?auto_7023 ) ( not ( = ?auto_7025 ?auto_7024 ) ) ( OBJ-AT ?auto_7024 ?auto_7026 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7024 ?auto_7027 ?auto_7026 )
      ( DELIVER-2PKG ?auto_7025 ?auto_7024 ?auto_7023 )
      ( DELIVER-1PKG-VERIFY ?auto_7024 ?auto_7023 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7030 - OBJ
      ?auto_7031 - OBJ
      ?auto_7029 - LOCATION
    )
    :vars
    (
      ?auto_7032 - TRUCK
      ?auto_7034 - LOCATION
      ?auto_7033 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7032 ?auto_7034 ) ( IN-CITY ?auto_7034 ?auto_7033 ) ( IN-CITY ?auto_7029 ?auto_7033 ) ( not ( = ?auto_7029 ?auto_7034 ) ) ( OBJ-AT ?auto_7030 ?auto_7029 ) ( not ( = ?auto_7030 ?auto_7031 ) ) ( OBJ-AT ?auto_7031 ?auto_7034 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7031 ?auto_7029 )
      ( DELIVER-2PKG-VERIFY ?auto_7030 ?auto_7031 ?auto_7029 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7036 - OBJ
      ?auto_7037 - OBJ
      ?auto_7035 - LOCATION
    )
    :vars
    (
      ?auto_7039 - TRUCK
      ?auto_7040 - LOCATION
      ?auto_7038 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7039 ?auto_7040 ) ( IN-CITY ?auto_7040 ?auto_7038 ) ( IN-CITY ?auto_7035 ?auto_7038 ) ( not ( = ?auto_7035 ?auto_7040 ) ) ( OBJ-AT ?auto_7037 ?auto_7035 ) ( not ( = ?auto_7037 ?auto_7036 ) ) ( OBJ-AT ?auto_7036 ?auto_7040 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7037 ?auto_7036 ?auto_7035 )
      ( DELIVER-2PKG-VERIFY ?auto_7036 ?auto_7037 ?auto_7035 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7049 - OBJ
      ?auto_7050 - OBJ
      ?auto_7051 - OBJ
      ?auto_7048 - LOCATION
    )
    :vars
    (
      ?auto_7053 - TRUCK
      ?auto_7054 - LOCATION
      ?auto_7052 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7053 ?auto_7054 ) ( IN-CITY ?auto_7054 ?auto_7052 ) ( IN-CITY ?auto_7048 ?auto_7052 ) ( not ( = ?auto_7048 ?auto_7054 ) ) ( OBJ-AT ?auto_7050 ?auto_7048 ) ( not ( = ?auto_7050 ?auto_7051 ) ) ( OBJ-AT ?auto_7051 ?auto_7054 ) ( OBJ-AT ?auto_7049 ?auto_7048 ) ( not ( = ?auto_7049 ?auto_7050 ) ) ( not ( = ?auto_7049 ?auto_7051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7050 ?auto_7051 ?auto_7048 )
      ( DELIVER-3PKG-VERIFY ?auto_7049 ?auto_7050 ?auto_7051 ?auto_7048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7056 - OBJ
      ?auto_7057 - OBJ
      ?auto_7058 - OBJ
      ?auto_7055 - LOCATION
    )
    :vars
    (
      ?auto_7060 - TRUCK
      ?auto_7061 - LOCATION
      ?auto_7059 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7060 ?auto_7061 ) ( IN-CITY ?auto_7061 ?auto_7059 ) ( IN-CITY ?auto_7055 ?auto_7059 ) ( not ( = ?auto_7055 ?auto_7061 ) ) ( OBJ-AT ?auto_7058 ?auto_7055 ) ( not ( = ?auto_7058 ?auto_7057 ) ) ( OBJ-AT ?auto_7057 ?auto_7061 ) ( OBJ-AT ?auto_7056 ?auto_7055 ) ( not ( = ?auto_7056 ?auto_7057 ) ) ( not ( = ?auto_7056 ?auto_7058 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7058 ?auto_7057 ?auto_7055 )
      ( DELIVER-3PKG-VERIFY ?auto_7056 ?auto_7057 ?auto_7058 ?auto_7055 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7070 - OBJ
      ?auto_7071 - OBJ
      ?auto_7072 - OBJ
      ?auto_7069 - LOCATION
    )
    :vars
    (
      ?auto_7074 - TRUCK
      ?auto_7075 - LOCATION
      ?auto_7073 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7074 ?auto_7075 ) ( IN-CITY ?auto_7075 ?auto_7073 ) ( IN-CITY ?auto_7069 ?auto_7073 ) ( not ( = ?auto_7069 ?auto_7075 ) ) ( OBJ-AT ?auto_7071 ?auto_7069 ) ( not ( = ?auto_7071 ?auto_7070 ) ) ( OBJ-AT ?auto_7070 ?auto_7075 ) ( OBJ-AT ?auto_7072 ?auto_7069 ) ( not ( = ?auto_7070 ?auto_7072 ) ) ( not ( = ?auto_7071 ?auto_7072 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7071 ?auto_7070 ?auto_7069 )
      ( DELIVER-3PKG-VERIFY ?auto_7070 ?auto_7071 ?auto_7072 ?auto_7069 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7099 - OBJ
      ?auto_7098 - LOCATION
    )
    :vars
    (
      ?auto_7102 - LOCATION
      ?auto_7100 - CITY
      ?auto_7103 - OBJ
      ?auto_7101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7102 ?auto_7100 ) ( IN-CITY ?auto_7098 ?auto_7100 ) ( not ( = ?auto_7098 ?auto_7102 ) ) ( OBJ-AT ?auto_7103 ?auto_7098 ) ( not ( = ?auto_7103 ?auto_7099 ) ) ( OBJ-AT ?auto_7099 ?auto_7102 ) ( TRUCK-AT ?auto_7101 ?auto_7098 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7101 ?auto_7098 ?auto_7102 ?auto_7100 )
      ( DELIVER-2PKG ?auto_7103 ?auto_7099 ?auto_7098 )
      ( DELIVER-1PKG-VERIFY ?auto_7099 ?auto_7098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7105 - OBJ
      ?auto_7106 - OBJ
      ?auto_7104 - LOCATION
    )
    :vars
    (
      ?auto_7108 - LOCATION
      ?auto_7107 - CITY
      ?auto_7109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7108 ?auto_7107 ) ( IN-CITY ?auto_7104 ?auto_7107 ) ( not ( = ?auto_7104 ?auto_7108 ) ) ( OBJ-AT ?auto_7105 ?auto_7104 ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( OBJ-AT ?auto_7106 ?auto_7108 ) ( TRUCK-AT ?auto_7109 ?auto_7104 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7106 ?auto_7104 )
      ( DELIVER-2PKG-VERIFY ?auto_7105 ?auto_7106 ?auto_7104 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7111 - OBJ
      ?auto_7112 - OBJ
      ?auto_7110 - LOCATION
    )
    :vars
    (
      ?auto_7115 - LOCATION
      ?auto_7113 - CITY
      ?auto_7114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7115 ?auto_7113 ) ( IN-CITY ?auto_7110 ?auto_7113 ) ( not ( = ?auto_7110 ?auto_7115 ) ) ( OBJ-AT ?auto_7112 ?auto_7110 ) ( not ( = ?auto_7112 ?auto_7111 ) ) ( OBJ-AT ?auto_7111 ?auto_7115 ) ( TRUCK-AT ?auto_7114 ?auto_7110 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7112 ?auto_7111 ?auto_7110 )
      ( DELIVER-2PKG-VERIFY ?auto_7111 ?auto_7112 ?auto_7110 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7124 - OBJ
      ?auto_7125 - OBJ
      ?auto_7126 - OBJ
      ?auto_7123 - LOCATION
    )
    :vars
    (
      ?auto_7129 - LOCATION
      ?auto_7127 - CITY
      ?auto_7128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7129 ?auto_7127 ) ( IN-CITY ?auto_7123 ?auto_7127 ) ( not ( = ?auto_7123 ?auto_7129 ) ) ( OBJ-AT ?auto_7125 ?auto_7123 ) ( not ( = ?auto_7125 ?auto_7126 ) ) ( OBJ-AT ?auto_7126 ?auto_7129 ) ( TRUCK-AT ?auto_7128 ?auto_7123 ) ( OBJ-AT ?auto_7124 ?auto_7123 ) ( not ( = ?auto_7124 ?auto_7125 ) ) ( not ( = ?auto_7124 ?auto_7126 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7125 ?auto_7126 ?auto_7123 )
      ( DELIVER-3PKG-VERIFY ?auto_7124 ?auto_7125 ?auto_7126 ?auto_7123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7131 - OBJ
      ?auto_7132 - OBJ
      ?auto_7133 - OBJ
      ?auto_7130 - LOCATION
    )
    :vars
    (
      ?auto_7136 - LOCATION
      ?auto_7134 - CITY
      ?auto_7135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7136 ?auto_7134 ) ( IN-CITY ?auto_7130 ?auto_7134 ) ( not ( = ?auto_7130 ?auto_7136 ) ) ( OBJ-AT ?auto_7131 ?auto_7130 ) ( not ( = ?auto_7131 ?auto_7132 ) ) ( OBJ-AT ?auto_7132 ?auto_7136 ) ( TRUCK-AT ?auto_7135 ?auto_7130 ) ( OBJ-AT ?auto_7133 ?auto_7130 ) ( not ( = ?auto_7131 ?auto_7133 ) ) ( not ( = ?auto_7132 ?auto_7133 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7131 ?auto_7132 ?auto_7130 )
      ( DELIVER-3PKG-VERIFY ?auto_7131 ?auto_7132 ?auto_7133 ?auto_7130 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7145 - OBJ
      ?auto_7146 - OBJ
      ?auto_7147 - OBJ
      ?auto_7144 - LOCATION
    )
    :vars
    (
      ?auto_7150 - LOCATION
      ?auto_7148 - CITY
      ?auto_7149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7150 ?auto_7148 ) ( IN-CITY ?auto_7144 ?auto_7148 ) ( not ( = ?auto_7144 ?auto_7150 ) ) ( OBJ-AT ?auto_7147 ?auto_7144 ) ( not ( = ?auto_7147 ?auto_7145 ) ) ( OBJ-AT ?auto_7145 ?auto_7150 ) ( TRUCK-AT ?auto_7149 ?auto_7144 ) ( OBJ-AT ?auto_7146 ?auto_7144 ) ( not ( = ?auto_7145 ?auto_7146 ) ) ( not ( = ?auto_7146 ?auto_7147 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7147 ?auto_7145 ?auto_7144 )
      ( DELIVER-3PKG-VERIFY ?auto_7145 ?auto_7146 ?auto_7147 ?auto_7144 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7174 - OBJ
      ?auto_7173 - LOCATION
    )
    :vars
    (
      ?auto_7178 - LOCATION
      ?auto_7175 - CITY
      ?auto_7177 - OBJ
      ?auto_7176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7178 ?auto_7175 ) ( IN-CITY ?auto_7173 ?auto_7175 ) ( not ( = ?auto_7173 ?auto_7178 ) ) ( not ( = ?auto_7177 ?auto_7174 ) ) ( OBJ-AT ?auto_7174 ?auto_7178 ) ( TRUCK-AT ?auto_7176 ?auto_7173 ) ( IN-TRUCK ?auto_7177 ?auto_7176 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7177 ?auto_7173 )
      ( DELIVER-2PKG ?auto_7177 ?auto_7174 ?auto_7173 )
      ( DELIVER-1PKG-VERIFY ?auto_7174 ?auto_7173 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7180 - OBJ
      ?auto_7181 - OBJ
      ?auto_7179 - LOCATION
    )
    :vars
    (
      ?auto_7183 - LOCATION
      ?auto_7182 - CITY
      ?auto_7184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7183 ?auto_7182 ) ( IN-CITY ?auto_7179 ?auto_7182 ) ( not ( = ?auto_7179 ?auto_7183 ) ) ( not ( = ?auto_7180 ?auto_7181 ) ) ( OBJ-AT ?auto_7181 ?auto_7183 ) ( TRUCK-AT ?auto_7184 ?auto_7179 ) ( IN-TRUCK ?auto_7180 ?auto_7184 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7181 ?auto_7179 )
      ( DELIVER-2PKG-VERIFY ?auto_7180 ?auto_7181 ?auto_7179 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7186 - OBJ
      ?auto_7187 - OBJ
      ?auto_7185 - LOCATION
    )
    :vars
    (
      ?auto_7189 - LOCATION
      ?auto_7188 - CITY
      ?auto_7190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7189 ?auto_7188 ) ( IN-CITY ?auto_7185 ?auto_7188 ) ( not ( = ?auto_7185 ?auto_7189 ) ) ( not ( = ?auto_7187 ?auto_7186 ) ) ( OBJ-AT ?auto_7186 ?auto_7189 ) ( TRUCK-AT ?auto_7190 ?auto_7185 ) ( IN-TRUCK ?auto_7187 ?auto_7190 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7187 ?auto_7186 ?auto_7185 )
      ( DELIVER-2PKG-VERIFY ?auto_7186 ?auto_7187 ?auto_7185 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7249 - OBJ
      ?auto_7248 - LOCATION
    )
    :vars
    (
      ?auto_7252 - LOCATION
      ?auto_7251 - CITY
      ?auto_7250 - OBJ
      ?auto_7253 - TRUCK
      ?auto_7254 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7252 ?auto_7251 ) ( IN-CITY ?auto_7248 ?auto_7251 ) ( not ( = ?auto_7248 ?auto_7252 ) ) ( not ( = ?auto_7250 ?auto_7249 ) ) ( OBJ-AT ?auto_7249 ?auto_7252 ) ( IN-TRUCK ?auto_7250 ?auto_7253 ) ( TRUCK-AT ?auto_7253 ?auto_7254 ) ( IN-CITY ?auto_7254 ?auto_7251 ) ( not ( = ?auto_7248 ?auto_7254 ) ) ( not ( = ?auto_7252 ?auto_7254 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7253 ?auto_7254 ?auto_7248 ?auto_7251 )
      ( DELIVER-2PKG ?auto_7250 ?auto_7249 ?auto_7248 )
      ( DELIVER-1PKG-VERIFY ?auto_7249 ?auto_7248 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7256 - OBJ
      ?auto_7257 - OBJ
      ?auto_7255 - LOCATION
    )
    :vars
    (
      ?auto_7258 - LOCATION
      ?auto_7261 - CITY
      ?auto_7259 - TRUCK
      ?auto_7260 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7258 ?auto_7261 ) ( IN-CITY ?auto_7255 ?auto_7261 ) ( not ( = ?auto_7255 ?auto_7258 ) ) ( not ( = ?auto_7256 ?auto_7257 ) ) ( OBJ-AT ?auto_7257 ?auto_7258 ) ( IN-TRUCK ?auto_7256 ?auto_7259 ) ( TRUCK-AT ?auto_7259 ?auto_7260 ) ( IN-CITY ?auto_7260 ?auto_7261 ) ( not ( = ?auto_7255 ?auto_7260 ) ) ( not ( = ?auto_7258 ?auto_7260 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7257 ?auto_7255 )
      ( DELIVER-2PKG-VERIFY ?auto_7256 ?auto_7257 ?auto_7255 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7263 - OBJ
      ?auto_7264 - OBJ
      ?auto_7262 - LOCATION
    )
    :vars
    (
      ?auto_7268 - LOCATION
      ?auto_7266 - CITY
      ?auto_7267 - TRUCK
      ?auto_7265 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7268 ?auto_7266 ) ( IN-CITY ?auto_7262 ?auto_7266 ) ( not ( = ?auto_7262 ?auto_7268 ) ) ( not ( = ?auto_7264 ?auto_7263 ) ) ( OBJ-AT ?auto_7263 ?auto_7268 ) ( IN-TRUCK ?auto_7264 ?auto_7267 ) ( TRUCK-AT ?auto_7267 ?auto_7265 ) ( IN-CITY ?auto_7265 ?auto_7266 ) ( not ( = ?auto_7262 ?auto_7265 ) ) ( not ( = ?auto_7268 ?auto_7265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7264 ?auto_7263 ?auto_7262 )
      ( DELIVER-2PKG-VERIFY ?auto_7263 ?auto_7264 ?auto_7262 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7335 - OBJ
      ?auto_7334 - LOCATION
    )
    :vars
    (
      ?auto_7340 - LOCATION
      ?auto_7337 - CITY
      ?auto_7339 - OBJ
      ?auto_7338 - TRUCK
      ?auto_7336 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7340 ?auto_7337 ) ( IN-CITY ?auto_7334 ?auto_7337 ) ( not ( = ?auto_7334 ?auto_7340 ) ) ( not ( = ?auto_7339 ?auto_7335 ) ) ( OBJ-AT ?auto_7335 ?auto_7340 ) ( TRUCK-AT ?auto_7338 ?auto_7336 ) ( IN-CITY ?auto_7336 ?auto_7337 ) ( not ( = ?auto_7334 ?auto_7336 ) ) ( not ( = ?auto_7340 ?auto_7336 ) ) ( OBJ-AT ?auto_7339 ?auto_7336 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7339 ?auto_7338 ?auto_7336 )
      ( DELIVER-2PKG ?auto_7339 ?auto_7335 ?auto_7334 )
      ( DELIVER-1PKG-VERIFY ?auto_7335 ?auto_7334 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7342 - OBJ
      ?auto_7343 - OBJ
      ?auto_7341 - LOCATION
    )
    :vars
    (
      ?auto_7347 - LOCATION
      ?auto_7344 - CITY
      ?auto_7345 - TRUCK
      ?auto_7346 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7347 ?auto_7344 ) ( IN-CITY ?auto_7341 ?auto_7344 ) ( not ( = ?auto_7341 ?auto_7347 ) ) ( not ( = ?auto_7342 ?auto_7343 ) ) ( OBJ-AT ?auto_7343 ?auto_7347 ) ( TRUCK-AT ?auto_7345 ?auto_7346 ) ( IN-CITY ?auto_7346 ?auto_7344 ) ( not ( = ?auto_7341 ?auto_7346 ) ) ( not ( = ?auto_7347 ?auto_7346 ) ) ( OBJ-AT ?auto_7342 ?auto_7346 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7343 ?auto_7341 )
      ( DELIVER-2PKG-VERIFY ?auto_7342 ?auto_7343 ?auto_7341 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7349 - OBJ
      ?auto_7350 - OBJ
      ?auto_7348 - LOCATION
    )
    :vars
    (
      ?auto_7354 - LOCATION
      ?auto_7353 - CITY
      ?auto_7352 - TRUCK
      ?auto_7351 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7354 ?auto_7353 ) ( IN-CITY ?auto_7348 ?auto_7353 ) ( not ( = ?auto_7348 ?auto_7354 ) ) ( not ( = ?auto_7350 ?auto_7349 ) ) ( OBJ-AT ?auto_7349 ?auto_7354 ) ( TRUCK-AT ?auto_7352 ?auto_7351 ) ( IN-CITY ?auto_7351 ?auto_7353 ) ( not ( = ?auto_7348 ?auto_7351 ) ) ( not ( = ?auto_7354 ?auto_7351 ) ) ( OBJ-AT ?auto_7350 ?auto_7351 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7350 ?auto_7349 ?auto_7348 )
      ( DELIVER-2PKG-VERIFY ?auto_7349 ?auto_7350 ?auto_7348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7723 - OBJ
      ?auto_7724 - OBJ
      ?auto_7725 - OBJ
      ?auto_7722 - LOCATION
    )
    :vars
    (
      ?auto_7728 - TRUCK
      ?auto_7727 - LOCATION
      ?auto_7726 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7725 ?auto_7728 ) ( TRUCK-AT ?auto_7728 ?auto_7727 ) ( IN-CITY ?auto_7727 ?auto_7726 ) ( IN-CITY ?auto_7722 ?auto_7726 ) ( not ( = ?auto_7722 ?auto_7727 ) ) ( OBJ-AT ?auto_7724 ?auto_7722 ) ( not ( = ?auto_7724 ?auto_7725 ) ) ( OBJ-AT ?auto_7723 ?auto_7722 ) ( not ( = ?auto_7723 ?auto_7724 ) ) ( not ( = ?auto_7723 ?auto_7725 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7724 ?auto_7725 ?auto_7722 )
      ( DELIVER-3PKG-VERIFY ?auto_7723 ?auto_7724 ?auto_7725 ?auto_7722 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7756 - OBJ
      ?auto_7757 - OBJ
      ?auto_7758 - OBJ
      ?auto_7755 - LOCATION
    )
    :vars
    (
      ?auto_7762 - TRUCK
      ?auto_7760 - LOCATION
      ?auto_7759 - CITY
      ?auto_7761 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7758 ?auto_7762 ) ( TRUCK-AT ?auto_7762 ?auto_7760 ) ( IN-CITY ?auto_7760 ?auto_7759 ) ( IN-CITY ?auto_7755 ?auto_7759 ) ( not ( = ?auto_7755 ?auto_7760 ) ) ( OBJ-AT ?auto_7761 ?auto_7755 ) ( not ( = ?auto_7761 ?auto_7758 ) ) ( OBJ-AT ?auto_7756 ?auto_7755 ) ( OBJ-AT ?auto_7757 ?auto_7755 ) ( not ( = ?auto_7756 ?auto_7757 ) ) ( not ( = ?auto_7756 ?auto_7758 ) ) ( not ( = ?auto_7756 ?auto_7761 ) ) ( not ( = ?auto_7757 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7761 ?auto_7758 ?auto_7755 )
      ( DELIVER-3PKG-VERIFY ?auto_7756 ?auto_7757 ?auto_7758 ?auto_7755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7768 - OBJ
      ?auto_7769 - OBJ
      ?auto_7770 - OBJ
      ?auto_7767 - LOCATION
    )
    :vars
    (
      ?auto_7774 - TRUCK
      ?auto_7772 - LOCATION
      ?auto_7771 - CITY
      ?auto_7773 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7769 ?auto_7774 ) ( TRUCK-AT ?auto_7774 ?auto_7772 ) ( IN-CITY ?auto_7772 ?auto_7771 ) ( IN-CITY ?auto_7767 ?auto_7771 ) ( not ( = ?auto_7767 ?auto_7772 ) ) ( OBJ-AT ?auto_7773 ?auto_7767 ) ( not ( = ?auto_7773 ?auto_7769 ) ) ( OBJ-AT ?auto_7768 ?auto_7767 ) ( OBJ-AT ?auto_7770 ?auto_7767 ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7770 ) ) ( not ( = ?auto_7768 ?auto_7773 ) ) ( not ( = ?auto_7769 ?auto_7770 ) ) ( not ( = ?auto_7770 ?auto_7773 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7773 ?auto_7769 ?auto_7767 )
      ( DELIVER-3PKG-VERIFY ?auto_7768 ?auto_7769 ?auto_7770 ?auto_7767 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7784 - OBJ
      ?auto_7785 - OBJ
      ?auto_7786 - OBJ
      ?auto_7783 - LOCATION
    )
    :vars
    (
      ?auto_7789 - TRUCK
      ?auto_7788 - LOCATION
      ?auto_7787 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7784 ?auto_7789 ) ( TRUCK-AT ?auto_7789 ?auto_7788 ) ( IN-CITY ?auto_7788 ?auto_7787 ) ( IN-CITY ?auto_7783 ?auto_7787 ) ( not ( = ?auto_7783 ?auto_7788 ) ) ( OBJ-AT ?auto_7785 ?auto_7783 ) ( not ( = ?auto_7785 ?auto_7784 ) ) ( OBJ-AT ?auto_7786 ?auto_7783 ) ( not ( = ?auto_7784 ?auto_7786 ) ) ( not ( = ?auto_7785 ?auto_7786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7785 ?auto_7784 ?auto_7783 )
      ( DELIVER-3PKG-VERIFY ?auto_7784 ?auto_7785 ?auto_7786 ?auto_7783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7806 - OBJ
      ?auto_7807 - OBJ
      ?auto_7808 - OBJ
      ?auto_7805 - LOCATION
    )
    :vars
    (
      ?auto_7812 - TRUCK
      ?auto_7810 - LOCATION
      ?auto_7809 - CITY
      ?auto_7811 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_7806 ?auto_7812 ) ( TRUCK-AT ?auto_7812 ?auto_7810 ) ( IN-CITY ?auto_7810 ?auto_7809 ) ( IN-CITY ?auto_7805 ?auto_7809 ) ( not ( = ?auto_7805 ?auto_7810 ) ) ( OBJ-AT ?auto_7811 ?auto_7805 ) ( not ( = ?auto_7811 ?auto_7806 ) ) ( OBJ-AT ?auto_7807 ?auto_7805 ) ( OBJ-AT ?auto_7808 ?auto_7805 ) ( not ( = ?auto_7806 ?auto_7807 ) ) ( not ( = ?auto_7806 ?auto_7808 ) ) ( not ( = ?auto_7807 ?auto_7808 ) ) ( not ( = ?auto_7807 ?auto_7811 ) ) ( not ( = ?auto_7808 ?auto_7811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7811 ?auto_7806 ?auto_7805 )
      ( DELIVER-3PKG-VERIFY ?auto_7806 ?auto_7807 ?auto_7808 ?auto_7805 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7876 - OBJ
      ?auto_7877 - OBJ
      ?auto_7878 - OBJ
      ?auto_7875 - LOCATION
    )
    :vars
    (
      ?auto_7880 - TRUCK
      ?auto_7881 - LOCATION
      ?auto_7879 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7880 ?auto_7881 ) ( IN-CITY ?auto_7881 ?auto_7879 ) ( IN-CITY ?auto_7875 ?auto_7879 ) ( not ( = ?auto_7875 ?auto_7881 ) ) ( OBJ-AT ?auto_7876 ?auto_7875 ) ( not ( = ?auto_7876 ?auto_7878 ) ) ( OBJ-AT ?auto_7878 ?auto_7881 ) ( OBJ-AT ?auto_7877 ?auto_7875 ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( not ( = ?auto_7877 ?auto_7878 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7876 ?auto_7878 ?auto_7875 )
      ( DELIVER-3PKG-VERIFY ?auto_7876 ?auto_7877 ?auto_7878 ?auto_7875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7909 - OBJ
      ?auto_7910 - OBJ
      ?auto_7911 - OBJ
      ?auto_7908 - LOCATION
    )
    :vars
    (
      ?auto_7913 - TRUCK
      ?auto_7914 - LOCATION
      ?auto_7912 - CITY
      ?auto_7915 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7913 ?auto_7914 ) ( IN-CITY ?auto_7914 ?auto_7912 ) ( IN-CITY ?auto_7908 ?auto_7912 ) ( not ( = ?auto_7908 ?auto_7914 ) ) ( OBJ-AT ?auto_7915 ?auto_7908 ) ( not ( = ?auto_7915 ?auto_7911 ) ) ( OBJ-AT ?auto_7911 ?auto_7914 ) ( OBJ-AT ?auto_7909 ?auto_7908 ) ( OBJ-AT ?auto_7910 ?auto_7908 ) ( not ( = ?auto_7909 ?auto_7910 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( not ( = ?auto_7909 ?auto_7915 ) ) ( not ( = ?auto_7910 ?auto_7911 ) ) ( not ( = ?auto_7910 ?auto_7915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7915 ?auto_7911 ?auto_7908 )
      ( DELIVER-3PKG-VERIFY ?auto_7909 ?auto_7910 ?auto_7911 ?auto_7908 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7921 - OBJ
      ?auto_7922 - OBJ
      ?auto_7923 - OBJ
      ?auto_7920 - LOCATION
    )
    :vars
    (
      ?auto_7925 - TRUCK
      ?auto_7926 - LOCATION
      ?auto_7924 - CITY
      ?auto_7927 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7925 ?auto_7926 ) ( IN-CITY ?auto_7926 ?auto_7924 ) ( IN-CITY ?auto_7920 ?auto_7924 ) ( not ( = ?auto_7920 ?auto_7926 ) ) ( OBJ-AT ?auto_7927 ?auto_7920 ) ( not ( = ?auto_7927 ?auto_7922 ) ) ( OBJ-AT ?auto_7922 ?auto_7926 ) ( OBJ-AT ?auto_7921 ?auto_7920 ) ( OBJ-AT ?auto_7923 ?auto_7920 ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( not ( = ?auto_7921 ?auto_7923 ) ) ( not ( = ?auto_7921 ?auto_7927 ) ) ( not ( = ?auto_7922 ?auto_7923 ) ) ( not ( = ?auto_7923 ?auto_7927 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7927 ?auto_7922 ?auto_7920 )
      ( DELIVER-3PKG-VERIFY ?auto_7921 ?auto_7922 ?auto_7923 ?auto_7920 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7959 - OBJ
      ?auto_7960 - OBJ
      ?auto_7961 - OBJ
      ?auto_7958 - LOCATION
    )
    :vars
    (
      ?auto_7963 - TRUCK
      ?auto_7964 - LOCATION
      ?auto_7962 - CITY
      ?auto_7965 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_7963 ?auto_7964 ) ( IN-CITY ?auto_7964 ?auto_7962 ) ( IN-CITY ?auto_7958 ?auto_7962 ) ( not ( = ?auto_7958 ?auto_7964 ) ) ( OBJ-AT ?auto_7965 ?auto_7958 ) ( not ( = ?auto_7965 ?auto_7959 ) ) ( OBJ-AT ?auto_7959 ?auto_7964 ) ( OBJ-AT ?auto_7960 ?auto_7958 ) ( OBJ-AT ?auto_7961 ?auto_7958 ) ( not ( = ?auto_7959 ?auto_7960 ) ) ( not ( = ?auto_7959 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7961 ) ) ( not ( = ?auto_7960 ?auto_7965 ) ) ( not ( = ?auto_7961 ?auto_7965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7965 ?auto_7959 ?auto_7958 )
      ( DELIVER-3PKG-VERIFY ?auto_7959 ?auto_7960 ?auto_7961 ?auto_7958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8029 - OBJ
      ?auto_8030 - OBJ
      ?auto_8031 - OBJ
      ?auto_8028 - LOCATION
    )
    :vars
    (
      ?auto_8034 - LOCATION
      ?auto_8033 - CITY
      ?auto_8032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8034 ?auto_8033 ) ( IN-CITY ?auto_8028 ?auto_8033 ) ( not ( = ?auto_8028 ?auto_8034 ) ) ( OBJ-AT ?auto_8029 ?auto_8028 ) ( not ( = ?auto_8029 ?auto_8031 ) ) ( OBJ-AT ?auto_8031 ?auto_8034 ) ( TRUCK-AT ?auto_8032 ?auto_8028 ) ( OBJ-AT ?auto_8030 ?auto_8028 ) ( not ( = ?auto_8029 ?auto_8030 ) ) ( not ( = ?auto_8030 ?auto_8031 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8029 ?auto_8031 ?auto_8028 )
      ( DELIVER-3PKG-VERIFY ?auto_8029 ?auto_8030 ?auto_8031 ?auto_8028 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8040 - OBJ
      ?auto_8041 - OBJ
      ?auto_8042 - OBJ
      ?auto_8039 - LOCATION
    )
    :vars
    (
      ?auto_8045 - LOCATION
      ?auto_8044 - CITY
      ?auto_8043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8045 ?auto_8044 ) ( IN-CITY ?auto_8039 ?auto_8044 ) ( not ( = ?auto_8039 ?auto_8045 ) ) ( OBJ-AT ?auto_8042 ?auto_8039 ) ( not ( = ?auto_8042 ?auto_8041 ) ) ( OBJ-AT ?auto_8041 ?auto_8045 ) ( TRUCK-AT ?auto_8043 ?auto_8039 ) ( OBJ-AT ?auto_8040 ?auto_8039 ) ( not ( = ?auto_8040 ?auto_8041 ) ) ( not ( = ?auto_8040 ?auto_8042 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8042 ?auto_8041 ?auto_8039 )
      ( DELIVER-3PKG-VERIFY ?auto_8040 ?auto_8041 ?auto_8042 ?auto_8039 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8062 - OBJ
      ?auto_8063 - OBJ
      ?auto_8064 - OBJ
      ?auto_8061 - LOCATION
    )
    :vars
    (
      ?auto_8067 - LOCATION
      ?auto_8066 - CITY
      ?auto_8068 - OBJ
      ?auto_8065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8067 ?auto_8066 ) ( IN-CITY ?auto_8061 ?auto_8066 ) ( not ( = ?auto_8061 ?auto_8067 ) ) ( OBJ-AT ?auto_8068 ?auto_8061 ) ( not ( = ?auto_8068 ?auto_8064 ) ) ( OBJ-AT ?auto_8064 ?auto_8067 ) ( TRUCK-AT ?auto_8065 ?auto_8061 ) ( OBJ-AT ?auto_8062 ?auto_8061 ) ( OBJ-AT ?auto_8063 ?auto_8061 ) ( not ( = ?auto_8062 ?auto_8063 ) ) ( not ( = ?auto_8062 ?auto_8064 ) ) ( not ( = ?auto_8062 ?auto_8068 ) ) ( not ( = ?auto_8063 ?auto_8064 ) ) ( not ( = ?auto_8063 ?auto_8068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8068 ?auto_8064 ?auto_8061 )
      ( DELIVER-3PKG-VERIFY ?auto_8062 ?auto_8063 ?auto_8064 ?auto_8061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8074 - OBJ
      ?auto_8075 - OBJ
      ?auto_8076 - OBJ
      ?auto_8073 - LOCATION
    )
    :vars
    (
      ?auto_8079 - LOCATION
      ?auto_8078 - CITY
      ?auto_8080 - OBJ
      ?auto_8077 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8079 ?auto_8078 ) ( IN-CITY ?auto_8073 ?auto_8078 ) ( not ( = ?auto_8073 ?auto_8079 ) ) ( OBJ-AT ?auto_8080 ?auto_8073 ) ( not ( = ?auto_8080 ?auto_8075 ) ) ( OBJ-AT ?auto_8075 ?auto_8079 ) ( TRUCK-AT ?auto_8077 ?auto_8073 ) ( OBJ-AT ?auto_8074 ?auto_8073 ) ( OBJ-AT ?auto_8076 ?auto_8073 ) ( not ( = ?auto_8074 ?auto_8075 ) ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( not ( = ?auto_8074 ?auto_8080 ) ) ( not ( = ?auto_8075 ?auto_8076 ) ) ( not ( = ?auto_8076 ?auto_8080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8080 ?auto_8075 ?auto_8073 )
      ( DELIVER-3PKG-VERIFY ?auto_8074 ?auto_8075 ?auto_8076 ?auto_8073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8090 - OBJ
      ?auto_8091 - OBJ
      ?auto_8092 - OBJ
      ?auto_8089 - LOCATION
    )
    :vars
    (
      ?auto_8095 - LOCATION
      ?auto_8094 - CITY
      ?auto_8093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8095 ?auto_8094 ) ( IN-CITY ?auto_8089 ?auto_8094 ) ( not ( = ?auto_8089 ?auto_8095 ) ) ( OBJ-AT ?auto_8091 ?auto_8089 ) ( not ( = ?auto_8091 ?auto_8090 ) ) ( OBJ-AT ?auto_8090 ?auto_8095 ) ( TRUCK-AT ?auto_8093 ?auto_8089 ) ( OBJ-AT ?auto_8092 ?auto_8089 ) ( not ( = ?auto_8090 ?auto_8092 ) ) ( not ( = ?auto_8091 ?auto_8092 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8091 ?auto_8090 ?auto_8089 )
      ( DELIVER-3PKG-VERIFY ?auto_8090 ?auto_8091 ?auto_8092 ?auto_8089 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8112 - OBJ
      ?auto_8113 - OBJ
      ?auto_8114 - OBJ
      ?auto_8111 - LOCATION
    )
    :vars
    (
      ?auto_8117 - LOCATION
      ?auto_8116 - CITY
      ?auto_8118 - OBJ
      ?auto_8115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8117 ?auto_8116 ) ( IN-CITY ?auto_8111 ?auto_8116 ) ( not ( = ?auto_8111 ?auto_8117 ) ) ( OBJ-AT ?auto_8118 ?auto_8111 ) ( not ( = ?auto_8118 ?auto_8112 ) ) ( OBJ-AT ?auto_8112 ?auto_8117 ) ( TRUCK-AT ?auto_8115 ?auto_8111 ) ( OBJ-AT ?auto_8113 ?auto_8111 ) ( OBJ-AT ?auto_8114 ?auto_8111 ) ( not ( = ?auto_8112 ?auto_8113 ) ) ( not ( = ?auto_8112 ?auto_8114 ) ) ( not ( = ?auto_8113 ?auto_8114 ) ) ( not ( = ?auto_8113 ?auto_8118 ) ) ( not ( = ?auto_8114 ?auto_8118 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8118 ?auto_8112 ?auto_8111 )
      ( DELIVER-3PKG-VERIFY ?auto_8112 ?auto_8113 ?auto_8114 ?auto_8111 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8320 - OBJ
      ?auto_8319 - LOCATION
    )
    :vars
    (
      ?auto_8322 - LOCATION
      ?auto_8321 - CITY
      ?auto_8323 - OBJ
      ?auto_8324 - TRUCK
      ?auto_8325 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8322 ?auto_8321 ) ( IN-CITY ?auto_8319 ?auto_8321 ) ( not ( = ?auto_8319 ?auto_8322 ) ) ( OBJ-AT ?auto_8323 ?auto_8319 ) ( not ( = ?auto_8323 ?auto_8320 ) ) ( OBJ-AT ?auto_8320 ?auto_8322 ) ( TRUCK-AT ?auto_8324 ?auto_8325 ) ( IN-CITY ?auto_8325 ?auto_8321 ) ( not ( = ?auto_8319 ?auto_8325 ) ) ( not ( = ?auto_8322 ?auto_8325 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8324 ?auto_8325 ?auto_8319 ?auto_8321 )
      ( DELIVER-2PKG ?auto_8323 ?auto_8320 ?auto_8319 )
      ( DELIVER-1PKG-VERIFY ?auto_8320 ?auto_8319 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8327 - OBJ
      ?auto_8328 - OBJ
      ?auto_8326 - LOCATION
    )
    :vars
    (
      ?auto_8331 - LOCATION
      ?auto_8332 - CITY
      ?auto_8329 - TRUCK
      ?auto_8330 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8331 ?auto_8332 ) ( IN-CITY ?auto_8326 ?auto_8332 ) ( not ( = ?auto_8326 ?auto_8331 ) ) ( OBJ-AT ?auto_8327 ?auto_8326 ) ( not ( = ?auto_8327 ?auto_8328 ) ) ( OBJ-AT ?auto_8328 ?auto_8331 ) ( TRUCK-AT ?auto_8329 ?auto_8330 ) ( IN-CITY ?auto_8330 ?auto_8332 ) ( not ( = ?auto_8326 ?auto_8330 ) ) ( not ( = ?auto_8331 ?auto_8330 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_8328 ?auto_8326 )
      ( DELIVER-2PKG-VERIFY ?auto_8327 ?auto_8328 ?auto_8326 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_8342 - OBJ
      ?auto_8343 - OBJ
      ?auto_8341 - LOCATION
    )
    :vars
    (
      ?auto_8346 - LOCATION
      ?auto_8347 - CITY
      ?auto_8345 - TRUCK
      ?auto_8344 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8346 ?auto_8347 ) ( IN-CITY ?auto_8341 ?auto_8347 ) ( not ( = ?auto_8341 ?auto_8346 ) ) ( OBJ-AT ?auto_8343 ?auto_8341 ) ( not ( = ?auto_8343 ?auto_8342 ) ) ( OBJ-AT ?auto_8342 ?auto_8346 ) ( TRUCK-AT ?auto_8345 ?auto_8344 ) ( IN-CITY ?auto_8344 ?auto_8347 ) ( not ( = ?auto_8341 ?auto_8344 ) ) ( not ( = ?auto_8346 ?auto_8344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8343 ?auto_8342 ?auto_8341 )
      ( DELIVER-2PKG-VERIFY ?auto_8342 ?auto_8343 ?auto_8341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8365 - OBJ
      ?auto_8366 - OBJ
      ?auto_8367 - OBJ
      ?auto_8364 - LOCATION
    )
    :vars
    (
      ?auto_8370 - LOCATION
      ?auto_8371 - CITY
      ?auto_8369 - TRUCK
      ?auto_8368 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8370 ?auto_8371 ) ( IN-CITY ?auto_8364 ?auto_8371 ) ( not ( = ?auto_8364 ?auto_8370 ) ) ( OBJ-AT ?auto_8366 ?auto_8364 ) ( not ( = ?auto_8366 ?auto_8367 ) ) ( OBJ-AT ?auto_8367 ?auto_8370 ) ( TRUCK-AT ?auto_8369 ?auto_8368 ) ( IN-CITY ?auto_8368 ?auto_8371 ) ( not ( = ?auto_8364 ?auto_8368 ) ) ( not ( = ?auto_8370 ?auto_8368 ) ) ( OBJ-AT ?auto_8365 ?auto_8364 ) ( not ( = ?auto_8365 ?auto_8366 ) ) ( not ( = ?auto_8365 ?auto_8367 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8366 ?auto_8367 ?auto_8364 )
      ( DELIVER-3PKG-VERIFY ?auto_8365 ?auto_8366 ?auto_8367 ?auto_8364 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8381 - OBJ
      ?auto_8382 - OBJ
      ?auto_8383 - OBJ
      ?auto_8380 - LOCATION
    )
    :vars
    (
      ?auto_8386 - LOCATION
      ?auto_8387 - CITY
      ?auto_8385 - TRUCK
      ?auto_8384 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8386 ?auto_8387 ) ( IN-CITY ?auto_8380 ?auto_8387 ) ( not ( = ?auto_8380 ?auto_8386 ) ) ( OBJ-AT ?auto_8381 ?auto_8380 ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( OBJ-AT ?auto_8382 ?auto_8386 ) ( TRUCK-AT ?auto_8385 ?auto_8384 ) ( IN-CITY ?auto_8384 ?auto_8387 ) ( not ( = ?auto_8380 ?auto_8384 ) ) ( not ( = ?auto_8386 ?auto_8384 ) ) ( OBJ-AT ?auto_8383 ?auto_8380 ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( not ( = ?auto_8382 ?auto_8383 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8381 ?auto_8382 ?auto_8380 )
      ( DELIVER-3PKG-VERIFY ?auto_8381 ?auto_8382 ?auto_8383 ?auto_8380 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8448 - OBJ
      ?auto_8449 - OBJ
      ?auto_8450 - OBJ
      ?auto_8447 - LOCATION
    )
    :vars
    (
      ?auto_8453 - LOCATION
      ?auto_8454 - CITY
      ?auto_8452 - TRUCK
      ?auto_8451 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8453 ?auto_8454 ) ( IN-CITY ?auto_8447 ?auto_8454 ) ( not ( = ?auto_8447 ?auto_8453 ) ) ( OBJ-AT ?auto_8450 ?auto_8447 ) ( not ( = ?auto_8450 ?auto_8448 ) ) ( OBJ-AT ?auto_8448 ?auto_8453 ) ( TRUCK-AT ?auto_8452 ?auto_8451 ) ( IN-CITY ?auto_8451 ?auto_8454 ) ( not ( = ?auto_8447 ?auto_8451 ) ) ( not ( = ?auto_8453 ?auto_8451 ) ) ( OBJ-AT ?auto_8449 ?auto_8447 ) ( not ( = ?auto_8448 ?auto_8449 ) ) ( not ( = ?auto_8449 ?auto_8450 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8450 ?auto_8448 ?auto_8447 )
      ( DELIVER-3PKG-VERIFY ?auto_8448 ?auto_8449 ?auto_8450 ?auto_8447 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8556 - OBJ
      ?auto_8557 - OBJ
      ?auto_8558 - OBJ
      ?auto_8555 - LOCATION
    )
    :vars
    (
      ?auto_8562 - LOCATION
      ?auto_8561 - CITY
      ?auto_8559 - TRUCK
      ?auto_8560 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8562 ?auto_8561 ) ( IN-CITY ?auto_8555 ?auto_8561 ) ( not ( = ?auto_8555 ?auto_8562 ) ) ( OBJ-AT ?auto_8556 ?auto_8555 ) ( not ( = ?auto_8556 ?auto_8558 ) ) ( OBJ-AT ?auto_8558 ?auto_8562 ) ( TRUCK-AT ?auto_8559 ?auto_8560 ) ( IN-CITY ?auto_8560 ?auto_8561 ) ( not ( = ?auto_8555 ?auto_8560 ) ) ( not ( = ?auto_8562 ?auto_8560 ) ) ( OBJ-AT ?auto_8557 ?auto_8555 ) ( not ( = ?auto_8556 ?auto_8557 ) ) ( not ( = ?auto_8557 ?auto_8558 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8556 ?auto_8558 ?auto_8555 )
      ( DELIVER-3PKG-VERIFY ?auto_8556 ?auto_8557 ?auto_8558 ?auto_8555 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8572 - OBJ
      ?auto_8573 - OBJ
      ?auto_8574 - OBJ
      ?auto_8571 - LOCATION
    )
    :vars
    (
      ?auto_8578 - LOCATION
      ?auto_8577 - CITY
      ?auto_8575 - TRUCK
      ?auto_8576 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8578 ?auto_8577 ) ( IN-CITY ?auto_8571 ?auto_8577 ) ( not ( = ?auto_8571 ?auto_8578 ) ) ( OBJ-AT ?auto_8574 ?auto_8571 ) ( not ( = ?auto_8574 ?auto_8573 ) ) ( OBJ-AT ?auto_8573 ?auto_8578 ) ( TRUCK-AT ?auto_8575 ?auto_8576 ) ( IN-CITY ?auto_8576 ?auto_8577 ) ( not ( = ?auto_8571 ?auto_8576 ) ) ( not ( = ?auto_8578 ?auto_8576 ) ) ( OBJ-AT ?auto_8572 ?auto_8571 ) ( not ( = ?auto_8572 ?auto_8573 ) ) ( not ( = ?auto_8572 ?auto_8574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8574 ?auto_8573 ?auto_8571 )
      ( DELIVER-3PKG-VERIFY ?auto_8572 ?auto_8573 ?auto_8574 ?auto_8571 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8639 - OBJ
      ?auto_8640 - OBJ
      ?auto_8641 - OBJ
      ?auto_8638 - LOCATION
    )
    :vars
    (
      ?auto_8645 - LOCATION
      ?auto_8644 - CITY
      ?auto_8642 - TRUCK
      ?auto_8643 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_8645 ?auto_8644 ) ( IN-CITY ?auto_8638 ?auto_8644 ) ( not ( = ?auto_8638 ?auto_8645 ) ) ( OBJ-AT ?auto_8640 ?auto_8638 ) ( not ( = ?auto_8640 ?auto_8639 ) ) ( OBJ-AT ?auto_8639 ?auto_8645 ) ( TRUCK-AT ?auto_8642 ?auto_8643 ) ( IN-CITY ?auto_8643 ?auto_8644 ) ( not ( = ?auto_8638 ?auto_8643 ) ) ( not ( = ?auto_8645 ?auto_8643 ) ) ( OBJ-AT ?auto_8641 ?auto_8638 ) ( not ( = ?auto_8639 ?auto_8641 ) ) ( not ( = ?auto_8640 ?auto_8641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8640 ?auto_8639 ?auto_8638 )
      ( DELIVER-3PKG-VERIFY ?auto_8639 ?auto_8640 ?auto_8641 ?auto_8638 ) )
  )

)

