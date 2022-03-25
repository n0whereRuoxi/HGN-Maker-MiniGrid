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

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7794 - OBJ
      ?auto_7793 - LOCATION
    )
    :vars
    (
      ?auto_7796 - LOCATION
      ?auto_7797 - CITY
      ?auto_7795 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7796 ?auto_7797 ) ( IN-CITY ?auto_7793 ?auto_7797 ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( OBJ-AT ?auto_7794 ?auto_7796 ) ( TRUCK-AT ?auto_7795 ?auto_7793 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7795 ?auto_7793 ?auto_7796 ?auto_7797 )
      ( !LOAD-TRUCK ?auto_7794 ?auto_7795 ?auto_7796 )
      ( !DRIVE-TRUCK ?auto_7795 ?auto_7796 ?auto_7793 ?auto_7797 )
      ( !UNLOAD-TRUCK ?auto_7794 ?auto_7795 ?auto_7793 )
      ( DELIVER-1PKG-VERIFY ?auto_7794 ?auto_7793 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7801 - OBJ
      ?auto_7800 - LOCATION
    )
    :vars
    (
      ?auto_7803 - LOCATION
      ?auto_7804 - CITY
      ?auto_7802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7803 ?auto_7804 ) ( IN-CITY ?auto_7800 ?auto_7804 ) ( not ( = ?auto_7800 ?auto_7803 ) ) ( OBJ-AT ?auto_7801 ?auto_7803 ) ( TRUCK-AT ?auto_7802 ?auto_7800 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7802 ?auto_7800 ?auto_7803 ?auto_7804 )
      ( !LOAD-TRUCK ?auto_7801 ?auto_7802 ?auto_7803 )
      ( !DRIVE-TRUCK ?auto_7802 ?auto_7803 ?auto_7800 ?auto_7804 )
      ( !UNLOAD-TRUCK ?auto_7801 ?auto_7802 ?auto_7800 )
      ( DELIVER-1PKG-VERIFY ?auto_7801 ?auto_7800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7815 - OBJ
      ?auto_7816 - OBJ
      ?auto_7814 - LOCATION
    )
    :vars
    (
      ?auto_7819 - LOCATION
      ?auto_7818 - CITY
      ?auto_7820 - LOCATION
      ?auto_7817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7819 ?auto_7818 ) ( IN-CITY ?auto_7814 ?auto_7818 ) ( not ( = ?auto_7814 ?auto_7819 ) ) ( OBJ-AT ?auto_7816 ?auto_7819 ) ( IN-CITY ?auto_7820 ?auto_7818 ) ( not ( = ?auto_7814 ?auto_7820 ) ) ( OBJ-AT ?auto_7815 ?auto_7820 ) ( TRUCK-AT ?auto_7817 ?auto_7814 ) ( not ( = ?auto_7815 ?auto_7816 ) ) ( not ( = ?auto_7819 ?auto_7820 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7815 ?auto_7814 )
      ( DELIVER-1PKG ?auto_7816 ?auto_7814 )
      ( DELIVER-2PKG-VERIFY ?auto_7815 ?auto_7816 ?auto_7814 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7822 - OBJ
      ?auto_7823 - OBJ
      ?auto_7821 - LOCATION
    )
    :vars
    (
      ?auto_7824 - LOCATION
      ?auto_7825 - CITY
      ?auto_7827 - LOCATION
      ?auto_7826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7824 ?auto_7825 ) ( IN-CITY ?auto_7821 ?auto_7825 ) ( not ( = ?auto_7821 ?auto_7824 ) ) ( OBJ-AT ?auto_7822 ?auto_7824 ) ( IN-CITY ?auto_7827 ?auto_7825 ) ( not ( = ?auto_7821 ?auto_7827 ) ) ( OBJ-AT ?auto_7823 ?auto_7827 ) ( TRUCK-AT ?auto_7826 ?auto_7821 ) ( not ( = ?auto_7823 ?auto_7822 ) ) ( not ( = ?auto_7824 ?auto_7827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7823 ?auto_7822 ?auto_7821 )
      ( DELIVER-2PKG-VERIFY ?auto_7822 ?auto_7823 ?auto_7821 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7839 - OBJ
      ?auto_7838 - LOCATION
    )
    :vars
    (
      ?auto_7841 - LOCATION
      ?auto_7842 - CITY
      ?auto_7840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7841 ?auto_7842 ) ( IN-CITY ?auto_7838 ?auto_7842 ) ( not ( = ?auto_7838 ?auto_7841 ) ) ( OBJ-AT ?auto_7839 ?auto_7841 ) ( TRUCK-AT ?auto_7840 ?auto_7838 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7840 ?auto_7838 ?auto_7841 ?auto_7842 )
      ( !LOAD-TRUCK ?auto_7839 ?auto_7840 ?auto_7841 )
      ( !DRIVE-TRUCK ?auto_7840 ?auto_7841 ?auto_7838 ?auto_7842 )
      ( !UNLOAD-TRUCK ?auto_7839 ?auto_7840 ?auto_7838 )
      ( DELIVER-1PKG-VERIFY ?auto_7839 ?auto_7838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7929 - OBJ
      ?auto_7930 - OBJ
      ?auto_7931 - OBJ
      ?auto_7928 - LOCATION
    )
    :vars
    (
      ?auto_7934 - LOCATION
      ?auto_7932 - CITY
      ?auto_7935 - LOCATION
      ?auto_7933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7934 ?auto_7932 ) ( IN-CITY ?auto_7928 ?auto_7932 ) ( not ( = ?auto_7928 ?auto_7934 ) ) ( OBJ-AT ?auto_7931 ?auto_7934 ) ( OBJ-AT ?auto_7930 ?auto_7934 ) ( IN-CITY ?auto_7935 ?auto_7932 ) ( not ( = ?auto_7928 ?auto_7935 ) ) ( OBJ-AT ?auto_7929 ?auto_7935 ) ( TRUCK-AT ?auto_7933 ?auto_7928 ) ( not ( = ?auto_7929 ?auto_7930 ) ) ( not ( = ?auto_7934 ?auto_7935 ) ) ( not ( = ?auto_7929 ?auto_7931 ) ) ( not ( = ?auto_7930 ?auto_7931 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7930 ?auto_7929 ?auto_7928 )
      ( DELIVER-1PKG ?auto_7931 ?auto_7928 )
      ( DELIVER-3PKG-VERIFY ?auto_7929 ?auto_7930 ?auto_7931 ?auto_7928 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7946 - OBJ
      ?auto_7947 - OBJ
      ?auto_7948 - OBJ
      ?auto_7945 - LOCATION
    )
    :vars
    (
      ?auto_7950 - LOCATION
      ?auto_7952 - CITY
      ?auto_7949 - LOCATION
      ?auto_7951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7950 ?auto_7952 ) ( IN-CITY ?auto_7945 ?auto_7952 ) ( not ( = ?auto_7945 ?auto_7950 ) ) ( OBJ-AT ?auto_7947 ?auto_7950 ) ( OBJ-AT ?auto_7948 ?auto_7950 ) ( IN-CITY ?auto_7949 ?auto_7952 ) ( not ( = ?auto_7945 ?auto_7949 ) ) ( OBJ-AT ?auto_7946 ?auto_7949 ) ( TRUCK-AT ?auto_7951 ?auto_7945 ) ( not ( = ?auto_7946 ?auto_7948 ) ) ( not ( = ?auto_7950 ?auto_7949 ) ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( not ( = ?auto_7948 ?auto_7947 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7946 ?auto_7948 ?auto_7947 ?auto_7945 )
      ( DELIVER-3PKG-VERIFY ?auto_7946 ?auto_7947 ?auto_7948 ?auto_7945 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7963 - OBJ
      ?auto_7964 - OBJ
      ?auto_7965 - OBJ
      ?auto_7962 - LOCATION
    )
    :vars
    (
      ?auto_7969 - LOCATION
      ?auto_7968 - CITY
      ?auto_7967 - LOCATION
      ?auto_7966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7969 ?auto_7968 ) ( IN-CITY ?auto_7962 ?auto_7968 ) ( not ( = ?auto_7962 ?auto_7969 ) ) ( OBJ-AT ?auto_7965 ?auto_7969 ) ( OBJ-AT ?auto_7963 ?auto_7969 ) ( IN-CITY ?auto_7967 ?auto_7968 ) ( not ( = ?auto_7962 ?auto_7967 ) ) ( OBJ-AT ?auto_7964 ?auto_7967 ) ( TRUCK-AT ?auto_7966 ?auto_7962 ) ( not ( = ?auto_7964 ?auto_7963 ) ) ( not ( = ?auto_7969 ?auto_7967 ) ) ( not ( = ?auto_7964 ?auto_7965 ) ) ( not ( = ?auto_7963 ?auto_7965 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7964 ?auto_7965 ?auto_7963 ?auto_7962 )
      ( DELIVER-3PKG-VERIFY ?auto_7963 ?auto_7964 ?auto_7965 ?auto_7962 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7980 - OBJ
      ?auto_7981 - OBJ
      ?auto_7982 - OBJ
      ?auto_7979 - LOCATION
    )
    :vars
    (
      ?auto_7986 - LOCATION
      ?auto_7985 - CITY
      ?auto_7984 - LOCATION
      ?auto_7983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7986 ?auto_7985 ) ( IN-CITY ?auto_7979 ?auto_7985 ) ( not ( = ?auto_7979 ?auto_7986 ) ) ( OBJ-AT ?auto_7981 ?auto_7986 ) ( OBJ-AT ?auto_7980 ?auto_7986 ) ( IN-CITY ?auto_7984 ?auto_7985 ) ( not ( = ?auto_7979 ?auto_7984 ) ) ( OBJ-AT ?auto_7982 ?auto_7984 ) ( TRUCK-AT ?auto_7983 ?auto_7979 ) ( not ( = ?auto_7982 ?auto_7980 ) ) ( not ( = ?auto_7986 ?auto_7984 ) ) ( not ( = ?auto_7982 ?auto_7981 ) ) ( not ( = ?auto_7980 ?auto_7981 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_7982 ?auto_7981 ?auto_7980 ?auto_7979 )
      ( DELIVER-3PKG-VERIFY ?auto_7980 ?auto_7981 ?auto_7982 ?auto_7979 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8015 - OBJ
      ?auto_8016 - OBJ
      ?auto_8017 - OBJ
      ?auto_8014 - LOCATION
    )
    :vars
    (
      ?auto_8021 - LOCATION
      ?auto_8020 - CITY
      ?auto_8019 - LOCATION
      ?auto_8018 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8021 ?auto_8020 ) ( IN-CITY ?auto_8014 ?auto_8020 ) ( not ( = ?auto_8014 ?auto_8021 ) ) ( OBJ-AT ?auto_8015 ?auto_8021 ) ( OBJ-AT ?auto_8017 ?auto_8021 ) ( IN-CITY ?auto_8019 ?auto_8020 ) ( not ( = ?auto_8014 ?auto_8019 ) ) ( OBJ-AT ?auto_8016 ?auto_8019 ) ( TRUCK-AT ?auto_8018 ?auto_8014 ) ( not ( = ?auto_8016 ?auto_8017 ) ) ( not ( = ?auto_8021 ?auto_8019 ) ) ( not ( = ?auto_8016 ?auto_8015 ) ) ( not ( = ?auto_8017 ?auto_8015 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8016 ?auto_8015 ?auto_8017 ?auto_8014 )
      ( DELIVER-3PKG-VERIFY ?auto_8015 ?auto_8016 ?auto_8017 ?auto_8014 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8032 - OBJ
      ?auto_8033 - OBJ
      ?auto_8034 - OBJ
      ?auto_8031 - LOCATION
    )
    :vars
    (
      ?auto_8038 - LOCATION
      ?auto_8037 - CITY
      ?auto_8036 - LOCATION
      ?auto_8035 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8038 ?auto_8037 ) ( IN-CITY ?auto_8031 ?auto_8037 ) ( not ( = ?auto_8031 ?auto_8038 ) ) ( OBJ-AT ?auto_8032 ?auto_8038 ) ( OBJ-AT ?auto_8033 ?auto_8038 ) ( IN-CITY ?auto_8036 ?auto_8037 ) ( not ( = ?auto_8031 ?auto_8036 ) ) ( OBJ-AT ?auto_8034 ?auto_8036 ) ( TRUCK-AT ?auto_8035 ?auto_8031 ) ( not ( = ?auto_8034 ?auto_8033 ) ) ( not ( = ?auto_8038 ?auto_8036 ) ) ( not ( = ?auto_8034 ?auto_8032 ) ) ( not ( = ?auto_8033 ?auto_8032 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8034 ?auto_8032 ?auto_8033 ?auto_8031 )
      ( DELIVER-3PKG-VERIFY ?auto_8032 ?auto_8033 ?auto_8034 ?auto_8031 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8088 - OBJ
      ?auto_8087 - LOCATION
    )
    :vars
    (
      ?auto_8090 - LOCATION
      ?auto_8091 - CITY
      ?auto_8089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8090 ?auto_8091 ) ( IN-CITY ?auto_8087 ?auto_8091 ) ( not ( = ?auto_8087 ?auto_8090 ) ) ( OBJ-AT ?auto_8088 ?auto_8090 ) ( TRUCK-AT ?auto_8089 ?auto_8087 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8089 ?auto_8087 ?auto_8090 ?auto_8091 )
      ( !LOAD-TRUCK ?auto_8088 ?auto_8089 ?auto_8090 )
      ( !DRIVE-TRUCK ?auto_8089 ?auto_8090 ?auto_8087 ?auto_8091 )
      ( !UNLOAD-TRUCK ?auto_8088 ?auto_8089 ?auto_8087 )
      ( DELIVER-1PKG-VERIFY ?auto_8088 ?auto_8087 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9061 - OBJ
      ?auto_9062 - OBJ
      ?auto_9063 - OBJ
      ?auto_9064 - OBJ
      ?auto_9060 - LOCATION
    )
    :vars
    (
      ?auto_9065 - LOCATION
      ?auto_9067 - CITY
      ?auto_9068 - LOCATION
      ?auto_9066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9065 ?auto_9067 ) ( IN-CITY ?auto_9060 ?auto_9067 ) ( not ( = ?auto_9060 ?auto_9065 ) ) ( OBJ-AT ?auto_9064 ?auto_9065 ) ( OBJ-AT ?auto_9063 ?auto_9065 ) ( OBJ-AT ?auto_9062 ?auto_9065 ) ( IN-CITY ?auto_9068 ?auto_9067 ) ( not ( = ?auto_9060 ?auto_9068 ) ) ( OBJ-AT ?auto_9061 ?auto_9068 ) ( TRUCK-AT ?auto_9066 ?auto_9060 ) ( not ( = ?auto_9061 ?auto_9062 ) ) ( not ( = ?auto_9065 ?auto_9068 ) ) ( not ( = ?auto_9061 ?auto_9063 ) ) ( not ( = ?auto_9062 ?auto_9063 ) ) ( not ( = ?auto_9061 ?auto_9064 ) ) ( not ( = ?auto_9062 ?auto_9064 ) ) ( not ( = ?auto_9063 ?auto_9064 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_9061 ?auto_9063 ?auto_9062 ?auto_9060 )
      ( DELIVER-1PKG ?auto_9064 ?auto_9060 )
      ( DELIVER-4PKG-VERIFY ?auto_9061 ?auto_9062 ?auto_9063 ?auto_9064 ?auto_9060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9090 - OBJ
      ?auto_9091 - OBJ
      ?auto_9092 - OBJ
      ?auto_9093 - OBJ
      ?auto_9089 - LOCATION
    )
    :vars
    (
      ?auto_9095 - LOCATION
      ?auto_9096 - CITY
      ?auto_9094 - LOCATION
      ?auto_9097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9095 ?auto_9096 ) ( IN-CITY ?auto_9089 ?auto_9096 ) ( not ( = ?auto_9089 ?auto_9095 ) ) ( OBJ-AT ?auto_9092 ?auto_9095 ) ( OBJ-AT ?auto_9093 ?auto_9095 ) ( OBJ-AT ?auto_9091 ?auto_9095 ) ( IN-CITY ?auto_9094 ?auto_9096 ) ( not ( = ?auto_9089 ?auto_9094 ) ) ( OBJ-AT ?auto_9090 ?auto_9094 ) ( TRUCK-AT ?auto_9097 ?auto_9089 ) ( not ( = ?auto_9090 ?auto_9091 ) ) ( not ( = ?auto_9095 ?auto_9094 ) ) ( not ( = ?auto_9090 ?auto_9093 ) ) ( not ( = ?auto_9091 ?auto_9093 ) ) ( not ( = ?auto_9090 ?auto_9092 ) ) ( not ( = ?auto_9091 ?auto_9092 ) ) ( not ( = ?auto_9093 ?auto_9092 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9090 ?auto_9091 ?auto_9093 ?auto_9092 ?auto_9089 )
      ( DELIVER-4PKG-VERIFY ?auto_9090 ?auto_9091 ?auto_9092 ?auto_9093 ?auto_9089 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9119 - OBJ
      ?auto_9120 - OBJ
      ?auto_9121 - OBJ
      ?auto_9122 - OBJ
      ?auto_9118 - LOCATION
    )
    :vars
    (
      ?auto_9125 - LOCATION
      ?auto_9124 - CITY
      ?auto_9126 - LOCATION
      ?auto_9123 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9125 ?auto_9124 ) ( IN-CITY ?auto_9118 ?auto_9124 ) ( not ( = ?auto_9118 ?auto_9125 ) ) ( OBJ-AT ?auto_9122 ?auto_9125 ) ( OBJ-AT ?auto_9120 ?auto_9125 ) ( OBJ-AT ?auto_9121 ?auto_9125 ) ( IN-CITY ?auto_9126 ?auto_9124 ) ( not ( = ?auto_9118 ?auto_9126 ) ) ( OBJ-AT ?auto_9119 ?auto_9126 ) ( TRUCK-AT ?auto_9123 ?auto_9118 ) ( not ( = ?auto_9119 ?auto_9121 ) ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9119 ?auto_9120 ) ) ( not ( = ?auto_9121 ?auto_9120 ) ) ( not ( = ?auto_9119 ?auto_9122 ) ) ( not ( = ?auto_9121 ?auto_9122 ) ) ( not ( = ?auto_9120 ?auto_9122 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9119 ?auto_9121 ?auto_9122 ?auto_9120 ?auto_9118 )
      ( DELIVER-4PKG-VERIFY ?auto_9119 ?auto_9120 ?auto_9121 ?auto_9122 ?auto_9118 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9148 - OBJ
      ?auto_9149 - OBJ
      ?auto_9150 - OBJ
      ?auto_9151 - OBJ
      ?auto_9147 - LOCATION
    )
    :vars
    (
      ?auto_9154 - LOCATION
      ?auto_9153 - CITY
      ?auto_9155 - LOCATION
      ?auto_9152 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9154 ?auto_9153 ) ( IN-CITY ?auto_9147 ?auto_9153 ) ( not ( = ?auto_9147 ?auto_9154 ) ) ( OBJ-AT ?auto_9150 ?auto_9154 ) ( OBJ-AT ?auto_9149 ?auto_9154 ) ( OBJ-AT ?auto_9151 ?auto_9154 ) ( IN-CITY ?auto_9155 ?auto_9153 ) ( not ( = ?auto_9147 ?auto_9155 ) ) ( OBJ-AT ?auto_9148 ?auto_9155 ) ( TRUCK-AT ?auto_9152 ?auto_9147 ) ( not ( = ?auto_9148 ?auto_9151 ) ) ( not ( = ?auto_9154 ?auto_9155 ) ) ( not ( = ?auto_9148 ?auto_9149 ) ) ( not ( = ?auto_9151 ?auto_9149 ) ) ( not ( = ?auto_9148 ?auto_9150 ) ) ( not ( = ?auto_9151 ?auto_9150 ) ) ( not ( = ?auto_9149 ?auto_9150 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9148 ?auto_9151 ?auto_9150 ?auto_9149 ?auto_9147 )
      ( DELIVER-4PKG-VERIFY ?auto_9148 ?auto_9149 ?auto_9150 ?auto_9151 ?auto_9147 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9239 - OBJ
      ?auto_9240 - OBJ
      ?auto_9241 - OBJ
      ?auto_9242 - OBJ
      ?auto_9238 - LOCATION
    )
    :vars
    (
      ?auto_9245 - LOCATION
      ?auto_9244 - CITY
      ?auto_9246 - LOCATION
      ?auto_9243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9245 ?auto_9244 ) ( IN-CITY ?auto_9238 ?auto_9244 ) ( not ( = ?auto_9238 ?auto_9245 ) ) ( OBJ-AT ?auto_9240 ?auto_9245 ) ( OBJ-AT ?auto_9242 ?auto_9245 ) ( OBJ-AT ?auto_9241 ?auto_9245 ) ( IN-CITY ?auto_9246 ?auto_9244 ) ( not ( = ?auto_9238 ?auto_9246 ) ) ( OBJ-AT ?auto_9239 ?auto_9246 ) ( TRUCK-AT ?auto_9243 ?auto_9238 ) ( not ( = ?auto_9239 ?auto_9241 ) ) ( not ( = ?auto_9245 ?auto_9246 ) ) ( not ( = ?auto_9239 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( not ( = ?auto_9239 ?auto_9240 ) ) ( not ( = ?auto_9241 ?auto_9240 ) ) ( not ( = ?auto_9242 ?auto_9240 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9239 ?auto_9241 ?auto_9240 ?auto_9242 ?auto_9238 )
      ( DELIVER-4PKG-VERIFY ?auto_9239 ?auto_9240 ?auto_9241 ?auto_9242 ?auto_9238 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9268 - OBJ
      ?auto_9269 - OBJ
      ?auto_9270 - OBJ
      ?auto_9271 - OBJ
      ?auto_9267 - LOCATION
    )
    :vars
    (
      ?auto_9274 - LOCATION
      ?auto_9273 - CITY
      ?auto_9275 - LOCATION
      ?auto_9272 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9274 ?auto_9273 ) ( IN-CITY ?auto_9267 ?auto_9273 ) ( not ( = ?auto_9267 ?auto_9274 ) ) ( OBJ-AT ?auto_9269 ?auto_9274 ) ( OBJ-AT ?auto_9270 ?auto_9274 ) ( OBJ-AT ?auto_9271 ?auto_9274 ) ( IN-CITY ?auto_9275 ?auto_9273 ) ( not ( = ?auto_9267 ?auto_9275 ) ) ( OBJ-AT ?auto_9268 ?auto_9275 ) ( TRUCK-AT ?auto_9272 ?auto_9267 ) ( not ( = ?auto_9268 ?auto_9271 ) ) ( not ( = ?auto_9274 ?auto_9275 ) ) ( not ( = ?auto_9268 ?auto_9270 ) ) ( not ( = ?auto_9271 ?auto_9270 ) ) ( not ( = ?auto_9268 ?auto_9269 ) ) ( not ( = ?auto_9271 ?auto_9269 ) ) ( not ( = ?auto_9270 ?auto_9269 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9268 ?auto_9271 ?auto_9269 ?auto_9270 ?auto_9267 )
      ( DELIVER-4PKG-VERIFY ?auto_9268 ?auto_9269 ?auto_9270 ?auto_9271 ?auto_9267 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9359 - OBJ
      ?auto_9360 - OBJ
      ?auto_9361 - OBJ
      ?auto_9362 - OBJ
      ?auto_9358 - LOCATION
    )
    :vars
    (
      ?auto_9365 - LOCATION
      ?auto_9364 - CITY
      ?auto_9366 - LOCATION
      ?auto_9363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9365 ?auto_9364 ) ( IN-CITY ?auto_9358 ?auto_9364 ) ( not ( = ?auto_9358 ?auto_9365 ) ) ( OBJ-AT ?auto_9362 ?auto_9365 ) ( OBJ-AT ?auto_9361 ?auto_9365 ) ( OBJ-AT ?auto_9359 ?auto_9365 ) ( IN-CITY ?auto_9366 ?auto_9364 ) ( not ( = ?auto_9358 ?auto_9366 ) ) ( OBJ-AT ?auto_9360 ?auto_9366 ) ( TRUCK-AT ?auto_9363 ?auto_9358 ) ( not ( = ?auto_9360 ?auto_9359 ) ) ( not ( = ?auto_9365 ?auto_9366 ) ) ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9359 ?auto_9361 ) ) ( not ( = ?auto_9360 ?auto_9362 ) ) ( not ( = ?auto_9359 ?auto_9362 ) ) ( not ( = ?auto_9361 ?auto_9362 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9360 ?auto_9359 ?auto_9362 ?auto_9361 ?auto_9358 )
      ( DELIVER-4PKG-VERIFY ?auto_9359 ?auto_9360 ?auto_9361 ?auto_9362 ?auto_9358 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9388 - OBJ
      ?auto_9389 - OBJ
      ?auto_9390 - OBJ
      ?auto_9391 - OBJ
      ?auto_9387 - LOCATION
    )
    :vars
    (
      ?auto_9394 - LOCATION
      ?auto_9393 - CITY
      ?auto_9395 - LOCATION
      ?auto_9392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9394 ?auto_9393 ) ( IN-CITY ?auto_9387 ?auto_9393 ) ( not ( = ?auto_9387 ?auto_9394 ) ) ( OBJ-AT ?auto_9390 ?auto_9394 ) ( OBJ-AT ?auto_9391 ?auto_9394 ) ( OBJ-AT ?auto_9388 ?auto_9394 ) ( IN-CITY ?auto_9395 ?auto_9393 ) ( not ( = ?auto_9387 ?auto_9395 ) ) ( OBJ-AT ?auto_9389 ?auto_9395 ) ( TRUCK-AT ?auto_9392 ?auto_9387 ) ( not ( = ?auto_9389 ?auto_9388 ) ) ( not ( = ?auto_9394 ?auto_9395 ) ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( not ( = ?auto_9388 ?auto_9391 ) ) ( not ( = ?auto_9389 ?auto_9390 ) ) ( not ( = ?auto_9388 ?auto_9390 ) ) ( not ( = ?auto_9391 ?auto_9390 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9389 ?auto_9388 ?auto_9390 ?auto_9391 ?auto_9387 )
      ( DELIVER-4PKG-VERIFY ?auto_9388 ?auto_9389 ?auto_9390 ?auto_9391 ?auto_9387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9480 - OBJ
      ?auto_9481 - OBJ
      ?auto_9482 - OBJ
      ?auto_9483 - OBJ
      ?auto_9479 - LOCATION
    )
    :vars
    (
      ?auto_9486 - LOCATION
      ?auto_9485 - CITY
      ?auto_9487 - LOCATION
      ?auto_9484 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9486 ?auto_9485 ) ( IN-CITY ?auto_9479 ?auto_9485 ) ( not ( = ?auto_9479 ?auto_9486 ) ) ( OBJ-AT ?auto_9483 ?auto_9486 ) ( OBJ-AT ?auto_9481 ?auto_9486 ) ( OBJ-AT ?auto_9480 ?auto_9486 ) ( IN-CITY ?auto_9487 ?auto_9485 ) ( not ( = ?auto_9479 ?auto_9487 ) ) ( OBJ-AT ?auto_9482 ?auto_9487 ) ( TRUCK-AT ?auto_9484 ?auto_9479 ) ( not ( = ?auto_9482 ?auto_9480 ) ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( not ( = ?auto_9482 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9481 ) ) ( not ( = ?auto_9482 ?auto_9483 ) ) ( not ( = ?auto_9480 ?auto_9483 ) ) ( not ( = ?auto_9481 ?auto_9483 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9482 ?auto_9480 ?auto_9483 ?auto_9481 ?auto_9479 )
      ( DELIVER-4PKG-VERIFY ?auto_9480 ?auto_9481 ?auto_9482 ?auto_9483 ?auto_9479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9509 - OBJ
      ?auto_9510 - OBJ
      ?auto_9511 - OBJ
      ?auto_9512 - OBJ
      ?auto_9508 - LOCATION
    )
    :vars
    (
      ?auto_9515 - LOCATION
      ?auto_9514 - CITY
      ?auto_9516 - LOCATION
      ?auto_9513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9515 ?auto_9514 ) ( IN-CITY ?auto_9508 ?auto_9514 ) ( not ( = ?auto_9508 ?auto_9515 ) ) ( OBJ-AT ?auto_9511 ?auto_9515 ) ( OBJ-AT ?auto_9510 ?auto_9515 ) ( OBJ-AT ?auto_9509 ?auto_9515 ) ( IN-CITY ?auto_9516 ?auto_9514 ) ( not ( = ?auto_9508 ?auto_9516 ) ) ( OBJ-AT ?auto_9512 ?auto_9516 ) ( TRUCK-AT ?auto_9513 ?auto_9508 ) ( not ( = ?auto_9512 ?auto_9509 ) ) ( not ( = ?auto_9515 ?auto_9516 ) ) ( not ( = ?auto_9512 ?auto_9510 ) ) ( not ( = ?auto_9509 ?auto_9510 ) ) ( not ( = ?auto_9512 ?auto_9511 ) ) ( not ( = ?auto_9509 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9511 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9512 ?auto_9509 ?auto_9511 ?auto_9510 ?auto_9508 )
      ( DELIVER-4PKG-VERIFY ?auto_9509 ?auto_9510 ?auto_9511 ?auto_9512 ?auto_9508 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9568 - OBJ
      ?auto_9569 - OBJ
      ?auto_9570 - OBJ
      ?auto_9571 - OBJ
      ?auto_9567 - LOCATION
    )
    :vars
    (
      ?auto_9574 - LOCATION
      ?auto_9573 - CITY
      ?auto_9575 - LOCATION
      ?auto_9572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9574 ?auto_9573 ) ( IN-CITY ?auto_9567 ?auto_9573 ) ( not ( = ?auto_9567 ?auto_9574 ) ) ( OBJ-AT ?auto_9569 ?auto_9574 ) ( OBJ-AT ?auto_9571 ?auto_9574 ) ( OBJ-AT ?auto_9568 ?auto_9574 ) ( IN-CITY ?auto_9575 ?auto_9573 ) ( not ( = ?auto_9567 ?auto_9575 ) ) ( OBJ-AT ?auto_9570 ?auto_9575 ) ( TRUCK-AT ?auto_9572 ?auto_9567 ) ( not ( = ?auto_9570 ?auto_9568 ) ) ( not ( = ?auto_9574 ?auto_9575 ) ) ( not ( = ?auto_9570 ?auto_9571 ) ) ( not ( = ?auto_9568 ?auto_9571 ) ) ( not ( = ?auto_9570 ?auto_9569 ) ) ( not ( = ?auto_9568 ?auto_9569 ) ) ( not ( = ?auto_9571 ?auto_9569 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9570 ?auto_9568 ?auto_9569 ?auto_9571 ?auto_9567 )
      ( DELIVER-4PKG-VERIFY ?auto_9568 ?auto_9569 ?auto_9570 ?auto_9571 ?auto_9567 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9629 - OBJ
      ?auto_9630 - OBJ
      ?auto_9631 - OBJ
      ?auto_9632 - OBJ
      ?auto_9628 - LOCATION
    )
    :vars
    (
      ?auto_9635 - LOCATION
      ?auto_9634 - CITY
      ?auto_9636 - LOCATION
      ?auto_9633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9635 ?auto_9634 ) ( IN-CITY ?auto_9628 ?auto_9634 ) ( not ( = ?auto_9628 ?auto_9635 ) ) ( OBJ-AT ?auto_9630 ?auto_9635 ) ( OBJ-AT ?auto_9631 ?auto_9635 ) ( OBJ-AT ?auto_9629 ?auto_9635 ) ( IN-CITY ?auto_9636 ?auto_9634 ) ( not ( = ?auto_9628 ?auto_9636 ) ) ( OBJ-AT ?auto_9632 ?auto_9636 ) ( TRUCK-AT ?auto_9633 ?auto_9628 ) ( not ( = ?auto_9632 ?auto_9629 ) ) ( not ( = ?auto_9635 ?auto_9636 ) ) ( not ( = ?auto_9632 ?auto_9631 ) ) ( not ( = ?auto_9629 ?auto_9631 ) ) ( not ( = ?auto_9632 ?auto_9630 ) ) ( not ( = ?auto_9629 ?auto_9630 ) ) ( not ( = ?auto_9631 ?auto_9630 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9632 ?auto_9629 ?auto_9630 ?auto_9631 ?auto_9628 )
      ( DELIVER-4PKG-VERIFY ?auto_9629 ?auto_9630 ?auto_9631 ?auto_9632 ?auto_9628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9720 - OBJ
      ?auto_9721 - OBJ
      ?auto_9722 - OBJ
      ?auto_9723 - OBJ
      ?auto_9719 - LOCATION
    )
    :vars
    (
      ?auto_9726 - LOCATION
      ?auto_9725 - CITY
      ?auto_9727 - LOCATION
      ?auto_9724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9726 ?auto_9725 ) ( IN-CITY ?auto_9719 ?auto_9725 ) ( not ( = ?auto_9719 ?auto_9726 ) ) ( OBJ-AT ?auto_9723 ?auto_9726 ) ( OBJ-AT ?auto_9720 ?auto_9726 ) ( OBJ-AT ?auto_9722 ?auto_9726 ) ( IN-CITY ?auto_9727 ?auto_9725 ) ( not ( = ?auto_9719 ?auto_9727 ) ) ( OBJ-AT ?auto_9721 ?auto_9727 ) ( TRUCK-AT ?auto_9724 ?auto_9719 ) ( not ( = ?auto_9721 ?auto_9722 ) ) ( not ( = ?auto_9726 ?auto_9727 ) ) ( not ( = ?auto_9721 ?auto_9720 ) ) ( not ( = ?auto_9722 ?auto_9720 ) ) ( not ( = ?auto_9721 ?auto_9723 ) ) ( not ( = ?auto_9722 ?auto_9723 ) ) ( not ( = ?auto_9720 ?auto_9723 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9721 ?auto_9722 ?auto_9723 ?auto_9720 ?auto_9719 )
      ( DELIVER-4PKG-VERIFY ?auto_9720 ?auto_9721 ?auto_9722 ?auto_9723 ?auto_9719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9749 - OBJ
      ?auto_9750 - OBJ
      ?auto_9751 - OBJ
      ?auto_9752 - OBJ
      ?auto_9748 - LOCATION
    )
    :vars
    (
      ?auto_9755 - LOCATION
      ?auto_9754 - CITY
      ?auto_9756 - LOCATION
      ?auto_9753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9755 ?auto_9754 ) ( IN-CITY ?auto_9748 ?auto_9754 ) ( not ( = ?auto_9748 ?auto_9755 ) ) ( OBJ-AT ?auto_9751 ?auto_9755 ) ( OBJ-AT ?auto_9749 ?auto_9755 ) ( OBJ-AT ?auto_9752 ?auto_9755 ) ( IN-CITY ?auto_9756 ?auto_9754 ) ( not ( = ?auto_9748 ?auto_9756 ) ) ( OBJ-AT ?auto_9750 ?auto_9756 ) ( TRUCK-AT ?auto_9753 ?auto_9748 ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9750 ?auto_9749 ) ) ( not ( = ?auto_9752 ?auto_9749 ) ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9752 ?auto_9751 ) ) ( not ( = ?auto_9749 ?auto_9751 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9750 ?auto_9752 ?auto_9751 ?auto_9749 ?auto_9748 )
      ( DELIVER-4PKG-VERIFY ?auto_9749 ?auto_9750 ?auto_9751 ?auto_9752 ?auto_9748 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9778 - OBJ
      ?auto_9779 - OBJ
      ?auto_9780 - OBJ
      ?auto_9781 - OBJ
      ?auto_9777 - LOCATION
    )
    :vars
    (
      ?auto_9784 - LOCATION
      ?auto_9783 - CITY
      ?auto_9785 - LOCATION
      ?auto_9782 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9784 ?auto_9783 ) ( IN-CITY ?auto_9777 ?auto_9783 ) ( not ( = ?auto_9777 ?auto_9784 ) ) ( OBJ-AT ?auto_9781 ?auto_9784 ) ( OBJ-AT ?auto_9778 ?auto_9784 ) ( OBJ-AT ?auto_9779 ?auto_9784 ) ( IN-CITY ?auto_9785 ?auto_9783 ) ( not ( = ?auto_9777 ?auto_9785 ) ) ( OBJ-AT ?auto_9780 ?auto_9785 ) ( TRUCK-AT ?auto_9782 ?auto_9777 ) ( not ( = ?auto_9780 ?auto_9779 ) ) ( not ( = ?auto_9784 ?auto_9785 ) ) ( not ( = ?auto_9780 ?auto_9778 ) ) ( not ( = ?auto_9779 ?auto_9778 ) ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( not ( = ?auto_9779 ?auto_9781 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9780 ?auto_9779 ?auto_9781 ?auto_9778 ?auto_9777 )
      ( DELIVER-4PKG-VERIFY ?auto_9778 ?auto_9779 ?auto_9780 ?auto_9781 ?auto_9777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9807 - OBJ
      ?auto_9808 - OBJ
      ?auto_9809 - OBJ
      ?auto_9810 - OBJ
      ?auto_9806 - LOCATION
    )
    :vars
    (
      ?auto_9813 - LOCATION
      ?auto_9812 - CITY
      ?auto_9814 - LOCATION
      ?auto_9811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9813 ?auto_9812 ) ( IN-CITY ?auto_9806 ?auto_9812 ) ( not ( = ?auto_9806 ?auto_9813 ) ) ( OBJ-AT ?auto_9809 ?auto_9813 ) ( OBJ-AT ?auto_9807 ?auto_9813 ) ( OBJ-AT ?auto_9808 ?auto_9813 ) ( IN-CITY ?auto_9814 ?auto_9812 ) ( not ( = ?auto_9806 ?auto_9814 ) ) ( OBJ-AT ?auto_9810 ?auto_9814 ) ( TRUCK-AT ?auto_9811 ?auto_9806 ) ( not ( = ?auto_9810 ?auto_9808 ) ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9810 ?auto_9807 ) ) ( not ( = ?auto_9808 ?auto_9807 ) ) ( not ( = ?auto_9810 ?auto_9809 ) ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( not ( = ?auto_9807 ?auto_9809 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9810 ?auto_9808 ?auto_9809 ?auto_9807 ?auto_9806 )
      ( DELIVER-4PKG-VERIFY ?auto_9807 ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9806 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9929 - OBJ
      ?auto_9930 - OBJ
      ?auto_9931 - OBJ
      ?auto_9932 - OBJ
      ?auto_9928 - LOCATION
    )
    :vars
    (
      ?auto_9935 - LOCATION
      ?auto_9934 - CITY
      ?auto_9936 - LOCATION
      ?auto_9933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9935 ?auto_9934 ) ( IN-CITY ?auto_9928 ?auto_9934 ) ( not ( = ?auto_9928 ?auto_9935 ) ) ( OBJ-AT ?auto_9930 ?auto_9935 ) ( OBJ-AT ?auto_9929 ?auto_9935 ) ( OBJ-AT ?auto_9932 ?auto_9935 ) ( IN-CITY ?auto_9936 ?auto_9934 ) ( not ( = ?auto_9928 ?auto_9936 ) ) ( OBJ-AT ?auto_9931 ?auto_9936 ) ( TRUCK-AT ?auto_9933 ?auto_9928 ) ( not ( = ?auto_9931 ?auto_9932 ) ) ( not ( = ?auto_9935 ?auto_9936 ) ) ( not ( = ?auto_9931 ?auto_9929 ) ) ( not ( = ?auto_9932 ?auto_9929 ) ) ( not ( = ?auto_9931 ?auto_9930 ) ) ( not ( = ?auto_9932 ?auto_9930 ) ) ( not ( = ?auto_9929 ?auto_9930 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9931 ?auto_9932 ?auto_9930 ?auto_9929 ?auto_9928 )
      ( DELIVER-4PKG-VERIFY ?auto_9929 ?auto_9930 ?auto_9931 ?auto_9932 ?auto_9928 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9958 - OBJ
      ?auto_9959 - OBJ
      ?auto_9960 - OBJ
      ?auto_9961 - OBJ
      ?auto_9957 - LOCATION
    )
    :vars
    (
      ?auto_9964 - LOCATION
      ?auto_9963 - CITY
      ?auto_9965 - LOCATION
      ?auto_9962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9964 ?auto_9963 ) ( IN-CITY ?auto_9957 ?auto_9963 ) ( not ( = ?auto_9957 ?auto_9964 ) ) ( OBJ-AT ?auto_9959 ?auto_9964 ) ( OBJ-AT ?auto_9958 ?auto_9964 ) ( OBJ-AT ?auto_9960 ?auto_9964 ) ( IN-CITY ?auto_9965 ?auto_9963 ) ( not ( = ?auto_9957 ?auto_9965 ) ) ( OBJ-AT ?auto_9961 ?auto_9965 ) ( TRUCK-AT ?auto_9962 ?auto_9957 ) ( not ( = ?auto_9961 ?auto_9960 ) ) ( not ( = ?auto_9964 ?auto_9965 ) ) ( not ( = ?auto_9961 ?auto_9958 ) ) ( not ( = ?auto_9960 ?auto_9958 ) ) ( not ( = ?auto_9961 ?auto_9959 ) ) ( not ( = ?auto_9960 ?auto_9959 ) ) ( not ( = ?auto_9958 ?auto_9959 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9961 ?auto_9960 ?auto_9959 ?auto_9958 ?auto_9957 )
      ( DELIVER-4PKG-VERIFY ?auto_9958 ?auto_9959 ?auto_9960 ?auto_9961 ?auto_9957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10143 - OBJ
      ?auto_10144 - OBJ
      ?auto_10145 - OBJ
      ?auto_10146 - OBJ
      ?auto_10142 - LOCATION
    )
    :vars
    (
      ?auto_10149 - LOCATION
      ?auto_10148 - CITY
      ?auto_10150 - LOCATION
      ?auto_10147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10149 ?auto_10148 ) ( IN-CITY ?auto_10142 ?auto_10148 ) ( not ( = ?auto_10142 ?auto_10149 ) ) ( OBJ-AT ?auto_10143 ?auto_10149 ) ( OBJ-AT ?auto_10146 ?auto_10149 ) ( OBJ-AT ?auto_10145 ?auto_10149 ) ( IN-CITY ?auto_10150 ?auto_10148 ) ( not ( = ?auto_10142 ?auto_10150 ) ) ( OBJ-AT ?auto_10144 ?auto_10150 ) ( TRUCK-AT ?auto_10147 ?auto_10142 ) ( not ( = ?auto_10144 ?auto_10145 ) ) ( not ( = ?auto_10149 ?auto_10150 ) ) ( not ( = ?auto_10144 ?auto_10146 ) ) ( not ( = ?auto_10145 ?auto_10146 ) ) ( not ( = ?auto_10144 ?auto_10143 ) ) ( not ( = ?auto_10145 ?auto_10143 ) ) ( not ( = ?auto_10146 ?auto_10143 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10144 ?auto_10145 ?auto_10143 ?auto_10146 ?auto_10142 )
      ( DELIVER-4PKG-VERIFY ?auto_10143 ?auto_10144 ?auto_10145 ?auto_10146 ?auto_10142 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10172 - OBJ
      ?auto_10173 - OBJ
      ?auto_10174 - OBJ
      ?auto_10175 - OBJ
      ?auto_10171 - LOCATION
    )
    :vars
    (
      ?auto_10178 - LOCATION
      ?auto_10177 - CITY
      ?auto_10179 - LOCATION
      ?auto_10176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10178 ?auto_10177 ) ( IN-CITY ?auto_10171 ?auto_10177 ) ( not ( = ?auto_10171 ?auto_10178 ) ) ( OBJ-AT ?auto_10172 ?auto_10178 ) ( OBJ-AT ?auto_10174 ?auto_10178 ) ( OBJ-AT ?auto_10175 ?auto_10178 ) ( IN-CITY ?auto_10179 ?auto_10177 ) ( not ( = ?auto_10171 ?auto_10179 ) ) ( OBJ-AT ?auto_10173 ?auto_10179 ) ( TRUCK-AT ?auto_10176 ?auto_10171 ) ( not ( = ?auto_10173 ?auto_10175 ) ) ( not ( = ?auto_10178 ?auto_10179 ) ) ( not ( = ?auto_10173 ?auto_10174 ) ) ( not ( = ?auto_10175 ?auto_10174 ) ) ( not ( = ?auto_10173 ?auto_10172 ) ) ( not ( = ?auto_10175 ?auto_10172 ) ) ( not ( = ?auto_10174 ?auto_10172 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10173 ?auto_10175 ?auto_10172 ?auto_10174 ?auto_10171 )
      ( DELIVER-4PKG-VERIFY ?auto_10172 ?auto_10173 ?auto_10174 ?auto_10175 ?auto_10171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10263 - OBJ
      ?auto_10264 - OBJ
      ?auto_10265 - OBJ
      ?auto_10266 - OBJ
      ?auto_10262 - LOCATION
    )
    :vars
    (
      ?auto_10269 - LOCATION
      ?auto_10268 - CITY
      ?auto_10270 - LOCATION
      ?auto_10267 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10269 ?auto_10268 ) ( IN-CITY ?auto_10262 ?auto_10268 ) ( not ( = ?auto_10262 ?auto_10269 ) ) ( OBJ-AT ?auto_10263 ?auto_10269 ) ( OBJ-AT ?auto_10266 ?auto_10269 ) ( OBJ-AT ?auto_10264 ?auto_10269 ) ( IN-CITY ?auto_10270 ?auto_10268 ) ( not ( = ?auto_10262 ?auto_10270 ) ) ( OBJ-AT ?auto_10265 ?auto_10270 ) ( TRUCK-AT ?auto_10267 ?auto_10262 ) ( not ( = ?auto_10265 ?auto_10264 ) ) ( not ( = ?auto_10269 ?auto_10270 ) ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( not ( = ?auto_10264 ?auto_10266 ) ) ( not ( = ?auto_10265 ?auto_10263 ) ) ( not ( = ?auto_10264 ?auto_10263 ) ) ( not ( = ?auto_10266 ?auto_10263 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10265 ?auto_10264 ?auto_10263 ?auto_10266 ?auto_10262 )
      ( DELIVER-4PKG-VERIFY ?auto_10263 ?auto_10264 ?auto_10265 ?auto_10266 ?auto_10262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10324 - OBJ
      ?auto_10325 - OBJ
      ?auto_10326 - OBJ
      ?auto_10327 - OBJ
      ?auto_10323 - LOCATION
    )
    :vars
    (
      ?auto_10330 - LOCATION
      ?auto_10329 - CITY
      ?auto_10331 - LOCATION
      ?auto_10328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10330 ?auto_10329 ) ( IN-CITY ?auto_10323 ?auto_10329 ) ( not ( = ?auto_10323 ?auto_10330 ) ) ( OBJ-AT ?auto_10324 ?auto_10330 ) ( OBJ-AT ?auto_10326 ?auto_10330 ) ( OBJ-AT ?auto_10325 ?auto_10330 ) ( IN-CITY ?auto_10331 ?auto_10329 ) ( not ( = ?auto_10323 ?auto_10331 ) ) ( OBJ-AT ?auto_10327 ?auto_10331 ) ( TRUCK-AT ?auto_10328 ?auto_10323 ) ( not ( = ?auto_10327 ?auto_10325 ) ) ( not ( = ?auto_10330 ?auto_10331 ) ) ( not ( = ?auto_10327 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( not ( = ?auto_10327 ?auto_10324 ) ) ( not ( = ?auto_10325 ?auto_10324 ) ) ( not ( = ?auto_10326 ?auto_10324 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10327 ?auto_10325 ?auto_10324 ?auto_10326 ?auto_10323 )
      ( DELIVER-4PKG-VERIFY ?auto_10324 ?auto_10325 ?auto_10326 ?auto_10327 ?auto_10323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10415 - OBJ
      ?auto_10416 - OBJ
      ?auto_10417 - OBJ
      ?auto_10418 - OBJ
      ?auto_10414 - LOCATION
    )
    :vars
    (
      ?auto_10421 - LOCATION
      ?auto_10420 - CITY
      ?auto_10422 - LOCATION
      ?auto_10419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10421 ?auto_10420 ) ( IN-CITY ?auto_10414 ?auto_10420 ) ( not ( = ?auto_10414 ?auto_10421 ) ) ( OBJ-AT ?auto_10415 ?auto_10421 ) ( OBJ-AT ?auto_10416 ?auto_10421 ) ( OBJ-AT ?auto_10418 ?auto_10421 ) ( IN-CITY ?auto_10422 ?auto_10420 ) ( not ( = ?auto_10414 ?auto_10422 ) ) ( OBJ-AT ?auto_10417 ?auto_10422 ) ( TRUCK-AT ?auto_10419 ?auto_10414 ) ( not ( = ?auto_10417 ?auto_10418 ) ) ( not ( = ?auto_10421 ?auto_10422 ) ) ( not ( = ?auto_10417 ?auto_10416 ) ) ( not ( = ?auto_10418 ?auto_10416 ) ) ( not ( = ?auto_10417 ?auto_10415 ) ) ( not ( = ?auto_10418 ?auto_10415 ) ) ( not ( = ?auto_10416 ?auto_10415 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10417 ?auto_10418 ?auto_10415 ?auto_10416 ?auto_10414 )
      ( DELIVER-4PKG-VERIFY ?auto_10415 ?auto_10416 ?auto_10417 ?auto_10418 ?auto_10414 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10444 - OBJ
      ?auto_10445 - OBJ
      ?auto_10446 - OBJ
      ?auto_10447 - OBJ
      ?auto_10443 - LOCATION
    )
    :vars
    (
      ?auto_10450 - LOCATION
      ?auto_10449 - CITY
      ?auto_10451 - LOCATION
      ?auto_10448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10450 ?auto_10449 ) ( IN-CITY ?auto_10443 ?auto_10449 ) ( not ( = ?auto_10443 ?auto_10450 ) ) ( OBJ-AT ?auto_10444 ?auto_10450 ) ( OBJ-AT ?auto_10445 ?auto_10450 ) ( OBJ-AT ?auto_10446 ?auto_10450 ) ( IN-CITY ?auto_10451 ?auto_10449 ) ( not ( = ?auto_10443 ?auto_10451 ) ) ( OBJ-AT ?auto_10447 ?auto_10451 ) ( TRUCK-AT ?auto_10448 ?auto_10443 ) ( not ( = ?auto_10447 ?auto_10446 ) ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( not ( = ?auto_10447 ?auto_10445 ) ) ( not ( = ?auto_10446 ?auto_10445 ) ) ( not ( = ?auto_10447 ?auto_10444 ) ) ( not ( = ?auto_10446 ?auto_10444 ) ) ( not ( = ?auto_10445 ?auto_10444 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10447 ?auto_10446 ?auto_10444 ?auto_10445 ?auto_10443 )
      ( DELIVER-4PKG-VERIFY ?auto_10444 ?auto_10445 ?auto_10446 ?auto_10447 ?auto_10443 ) )
  )

)

