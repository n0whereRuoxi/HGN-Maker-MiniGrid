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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_58792 - OBJ
      ?auto_58791 - LOCATION
    )
    :vars
    (
      ?auto_58794 - LOCATION
      ?auto_58795 - CITY
      ?auto_58793 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58794 ?auto_58795 ) ( IN-CITY ?auto_58791 ?auto_58795 ) ( not ( = ?auto_58791 ?auto_58794 ) ) ( OBJ-AT ?auto_58792 ?auto_58794 ) ( TRUCK-AT ?auto_58793 ?auto_58791 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_58793 ?auto_58791 ?auto_58794 ?auto_58795 )
      ( !LOAD-TRUCK ?auto_58792 ?auto_58793 ?auto_58794 )
      ( !DRIVE-TRUCK ?auto_58793 ?auto_58794 ?auto_58791 ?auto_58795 )
      ( !UNLOAD-TRUCK ?auto_58792 ?auto_58793 ?auto_58791 )
      ( DELIVER-1PKG-VERIFY ?auto_58792 ?auto_58791 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_58799 - OBJ
      ?auto_58798 - LOCATION
    )
    :vars
    (
      ?auto_58801 - LOCATION
      ?auto_58802 - CITY
      ?auto_58800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58801 ?auto_58802 ) ( IN-CITY ?auto_58798 ?auto_58802 ) ( not ( = ?auto_58798 ?auto_58801 ) ) ( OBJ-AT ?auto_58799 ?auto_58801 ) ( TRUCK-AT ?auto_58800 ?auto_58798 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_58800 ?auto_58798 ?auto_58801 ?auto_58802 )
      ( !LOAD-TRUCK ?auto_58799 ?auto_58800 ?auto_58801 )
      ( !DRIVE-TRUCK ?auto_58800 ?auto_58801 ?auto_58798 ?auto_58802 )
      ( !UNLOAD-TRUCK ?auto_58799 ?auto_58800 ?auto_58798 )
      ( DELIVER-1PKG-VERIFY ?auto_58799 ?auto_58798 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58813 - OBJ
      ?auto_58814 - OBJ
      ?auto_58812 - LOCATION
    )
    :vars
    (
      ?auto_58815 - LOCATION
      ?auto_58817 - CITY
      ?auto_58818 - LOCATION
      ?auto_58816 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58815 ?auto_58817 ) ( IN-CITY ?auto_58812 ?auto_58817 ) ( not ( = ?auto_58812 ?auto_58815 ) ) ( OBJ-AT ?auto_58814 ?auto_58815 ) ( IN-CITY ?auto_58818 ?auto_58817 ) ( not ( = ?auto_58812 ?auto_58818 ) ) ( OBJ-AT ?auto_58813 ?auto_58818 ) ( TRUCK-AT ?auto_58816 ?auto_58812 ) ( not ( = ?auto_58813 ?auto_58814 ) ) ( not ( = ?auto_58815 ?auto_58818 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_58813 ?auto_58812 )
      ( DELIVER-1PKG ?auto_58814 ?auto_58812 )
      ( DELIVER-2PKG-VERIFY ?auto_58813 ?auto_58814 ?auto_58812 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_58820 - OBJ
      ?auto_58821 - OBJ
      ?auto_58819 - LOCATION
    )
    :vars
    (
      ?auto_58822 - LOCATION
      ?auto_58825 - CITY
      ?auto_58823 - LOCATION
      ?auto_58824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58822 ?auto_58825 ) ( IN-CITY ?auto_58819 ?auto_58825 ) ( not ( = ?auto_58819 ?auto_58822 ) ) ( OBJ-AT ?auto_58820 ?auto_58822 ) ( IN-CITY ?auto_58823 ?auto_58825 ) ( not ( = ?auto_58819 ?auto_58823 ) ) ( OBJ-AT ?auto_58821 ?auto_58823 ) ( TRUCK-AT ?auto_58824 ?auto_58819 ) ( not ( = ?auto_58821 ?auto_58820 ) ) ( not ( = ?auto_58822 ?auto_58823 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58821 ?auto_58820 ?auto_58819 )
      ( DELIVER-2PKG-VERIFY ?auto_58820 ?auto_58821 ?auto_58819 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_58837 - OBJ
      ?auto_58836 - LOCATION
    )
    :vars
    (
      ?auto_58839 - LOCATION
      ?auto_58840 - CITY
      ?auto_58838 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58839 ?auto_58840 ) ( IN-CITY ?auto_58836 ?auto_58840 ) ( not ( = ?auto_58836 ?auto_58839 ) ) ( OBJ-AT ?auto_58837 ?auto_58839 ) ( TRUCK-AT ?auto_58838 ?auto_58836 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_58838 ?auto_58836 ?auto_58839 ?auto_58840 )
      ( !LOAD-TRUCK ?auto_58837 ?auto_58838 ?auto_58839 )
      ( !DRIVE-TRUCK ?auto_58838 ?auto_58839 ?auto_58836 ?auto_58840 )
      ( !UNLOAD-TRUCK ?auto_58837 ?auto_58838 ?auto_58836 )
      ( DELIVER-1PKG-VERIFY ?auto_58837 ?auto_58836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58928 - OBJ
      ?auto_58929 - OBJ
      ?auto_58930 - OBJ
      ?auto_58927 - LOCATION
    )
    :vars
    (
      ?auto_58932 - LOCATION
      ?auto_58931 - CITY
      ?auto_58934 - LOCATION
      ?auto_58935 - LOCATION
      ?auto_58933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58932 ?auto_58931 ) ( IN-CITY ?auto_58927 ?auto_58931 ) ( not ( = ?auto_58927 ?auto_58932 ) ) ( OBJ-AT ?auto_58930 ?auto_58932 ) ( IN-CITY ?auto_58934 ?auto_58931 ) ( not ( = ?auto_58927 ?auto_58934 ) ) ( OBJ-AT ?auto_58929 ?auto_58934 ) ( IN-CITY ?auto_58935 ?auto_58931 ) ( not ( = ?auto_58927 ?auto_58935 ) ) ( OBJ-AT ?auto_58928 ?auto_58935 ) ( TRUCK-AT ?auto_58933 ?auto_58927 ) ( not ( = ?auto_58928 ?auto_58929 ) ) ( not ( = ?auto_58934 ?auto_58935 ) ) ( not ( = ?auto_58928 ?auto_58930 ) ) ( not ( = ?auto_58929 ?auto_58930 ) ) ( not ( = ?auto_58932 ?auto_58934 ) ) ( not ( = ?auto_58932 ?auto_58935 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58929 ?auto_58928 ?auto_58927 )
      ( DELIVER-1PKG ?auto_58930 ?auto_58927 )
      ( DELIVER-3PKG-VERIFY ?auto_58928 ?auto_58929 ?auto_58930 ?auto_58927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58947 - OBJ
      ?auto_58948 - OBJ
      ?auto_58949 - OBJ
      ?auto_58946 - LOCATION
    )
    :vars
    (
      ?auto_58952 - LOCATION
      ?auto_58950 - CITY
      ?auto_58951 - LOCATION
      ?auto_58954 - LOCATION
      ?auto_58953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58952 ?auto_58950 ) ( IN-CITY ?auto_58946 ?auto_58950 ) ( not ( = ?auto_58946 ?auto_58952 ) ) ( OBJ-AT ?auto_58948 ?auto_58952 ) ( IN-CITY ?auto_58951 ?auto_58950 ) ( not ( = ?auto_58946 ?auto_58951 ) ) ( OBJ-AT ?auto_58949 ?auto_58951 ) ( IN-CITY ?auto_58954 ?auto_58950 ) ( not ( = ?auto_58946 ?auto_58954 ) ) ( OBJ-AT ?auto_58947 ?auto_58954 ) ( TRUCK-AT ?auto_58953 ?auto_58946 ) ( not ( = ?auto_58947 ?auto_58949 ) ) ( not ( = ?auto_58951 ?auto_58954 ) ) ( not ( = ?auto_58947 ?auto_58948 ) ) ( not ( = ?auto_58949 ?auto_58948 ) ) ( not ( = ?auto_58952 ?auto_58951 ) ) ( not ( = ?auto_58952 ?auto_58954 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_58947 ?auto_58949 ?auto_58948 ?auto_58946 )
      ( DELIVER-3PKG-VERIFY ?auto_58947 ?auto_58948 ?auto_58949 ?auto_58946 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58966 - OBJ
      ?auto_58967 - OBJ
      ?auto_58968 - OBJ
      ?auto_58965 - LOCATION
    )
    :vars
    (
      ?auto_58970 - LOCATION
      ?auto_58971 - CITY
      ?auto_58969 - LOCATION
      ?auto_58973 - LOCATION
      ?auto_58972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58970 ?auto_58971 ) ( IN-CITY ?auto_58965 ?auto_58971 ) ( not ( = ?auto_58965 ?auto_58970 ) ) ( OBJ-AT ?auto_58968 ?auto_58970 ) ( IN-CITY ?auto_58969 ?auto_58971 ) ( not ( = ?auto_58965 ?auto_58969 ) ) ( OBJ-AT ?auto_58966 ?auto_58969 ) ( IN-CITY ?auto_58973 ?auto_58971 ) ( not ( = ?auto_58965 ?auto_58973 ) ) ( OBJ-AT ?auto_58967 ?auto_58973 ) ( TRUCK-AT ?auto_58972 ?auto_58965 ) ( not ( = ?auto_58967 ?auto_58966 ) ) ( not ( = ?auto_58969 ?auto_58973 ) ) ( not ( = ?auto_58967 ?auto_58968 ) ) ( not ( = ?auto_58966 ?auto_58968 ) ) ( not ( = ?auto_58970 ?auto_58969 ) ) ( not ( = ?auto_58970 ?auto_58973 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_58967 ?auto_58968 ?auto_58966 ?auto_58965 )
      ( DELIVER-3PKG-VERIFY ?auto_58966 ?auto_58967 ?auto_58968 ?auto_58965 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58985 - OBJ
      ?auto_58986 - OBJ
      ?auto_58987 - OBJ
      ?auto_58984 - LOCATION
    )
    :vars
    (
      ?auto_58989 - LOCATION
      ?auto_58990 - CITY
      ?auto_58988 - LOCATION
      ?auto_58992 - LOCATION
      ?auto_58991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58989 ?auto_58990 ) ( IN-CITY ?auto_58984 ?auto_58990 ) ( not ( = ?auto_58984 ?auto_58989 ) ) ( OBJ-AT ?auto_58986 ?auto_58989 ) ( IN-CITY ?auto_58988 ?auto_58990 ) ( not ( = ?auto_58984 ?auto_58988 ) ) ( OBJ-AT ?auto_58985 ?auto_58988 ) ( IN-CITY ?auto_58992 ?auto_58990 ) ( not ( = ?auto_58984 ?auto_58992 ) ) ( OBJ-AT ?auto_58987 ?auto_58992 ) ( TRUCK-AT ?auto_58991 ?auto_58984 ) ( not ( = ?auto_58987 ?auto_58985 ) ) ( not ( = ?auto_58988 ?auto_58992 ) ) ( not ( = ?auto_58987 ?auto_58986 ) ) ( not ( = ?auto_58985 ?auto_58986 ) ) ( not ( = ?auto_58989 ?auto_58988 ) ) ( not ( = ?auto_58989 ?auto_58992 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_58987 ?auto_58986 ?auto_58985 ?auto_58984 )
      ( DELIVER-3PKG-VERIFY ?auto_58985 ?auto_58986 ?auto_58987 ?auto_58984 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59024 - OBJ
      ?auto_59025 - OBJ
      ?auto_59026 - OBJ
      ?auto_59023 - LOCATION
    )
    :vars
    (
      ?auto_59028 - LOCATION
      ?auto_59029 - CITY
      ?auto_59027 - LOCATION
      ?auto_59031 - LOCATION
      ?auto_59030 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59028 ?auto_59029 ) ( IN-CITY ?auto_59023 ?auto_59029 ) ( not ( = ?auto_59023 ?auto_59028 ) ) ( OBJ-AT ?auto_59024 ?auto_59028 ) ( IN-CITY ?auto_59027 ?auto_59029 ) ( not ( = ?auto_59023 ?auto_59027 ) ) ( OBJ-AT ?auto_59026 ?auto_59027 ) ( IN-CITY ?auto_59031 ?auto_59029 ) ( not ( = ?auto_59023 ?auto_59031 ) ) ( OBJ-AT ?auto_59025 ?auto_59031 ) ( TRUCK-AT ?auto_59030 ?auto_59023 ) ( not ( = ?auto_59025 ?auto_59026 ) ) ( not ( = ?auto_59027 ?auto_59031 ) ) ( not ( = ?auto_59025 ?auto_59024 ) ) ( not ( = ?auto_59026 ?auto_59024 ) ) ( not ( = ?auto_59028 ?auto_59027 ) ) ( not ( = ?auto_59028 ?auto_59031 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59025 ?auto_59024 ?auto_59026 ?auto_59023 )
      ( DELIVER-3PKG-VERIFY ?auto_59024 ?auto_59025 ?auto_59026 ?auto_59023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59043 - OBJ
      ?auto_59044 - OBJ
      ?auto_59045 - OBJ
      ?auto_59042 - LOCATION
    )
    :vars
    (
      ?auto_59047 - LOCATION
      ?auto_59048 - CITY
      ?auto_59046 - LOCATION
      ?auto_59050 - LOCATION
      ?auto_59049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59047 ?auto_59048 ) ( IN-CITY ?auto_59042 ?auto_59048 ) ( not ( = ?auto_59042 ?auto_59047 ) ) ( OBJ-AT ?auto_59043 ?auto_59047 ) ( IN-CITY ?auto_59046 ?auto_59048 ) ( not ( = ?auto_59042 ?auto_59046 ) ) ( OBJ-AT ?auto_59044 ?auto_59046 ) ( IN-CITY ?auto_59050 ?auto_59048 ) ( not ( = ?auto_59042 ?auto_59050 ) ) ( OBJ-AT ?auto_59045 ?auto_59050 ) ( TRUCK-AT ?auto_59049 ?auto_59042 ) ( not ( = ?auto_59045 ?auto_59044 ) ) ( not ( = ?auto_59046 ?auto_59050 ) ) ( not ( = ?auto_59045 ?auto_59043 ) ) ( not ( = ?auto_59044 ?auto_59043 ) ) ( not ( = ?auto_59047 ?auto_59046 ) ) ( not ( = ?auto_59047 ?auto_59050 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_59045 ?auto_59043 ?auto_59044 ?auto_59042 )
      ( DELIVER-3PKG-VERIFY ?auto_59043 ?auto_59044 ?auto_59045 ?auto_59042 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_59105 - OBJ
      ?auto_59104 - LOCATION
    )
    :vars
    (
      ?auto_59107 - LOCATION
      ?auto_59108 - CITY
      ?auto_59106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59107 ?auto_59108 ) ( IN-CITY ?auto_59104 ?auto_59108 ) ( not ( = ?auto_59104 ?auto_59107 ) ) ( OBJ-AT ?auto_59105 ?auto_59107 ) ( TRUCK-AT ?auto_59106 ?auto_59104 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59106 ?auto_59104 ?auto_59107 ?auto_59108 )
      ( !LOAD-TRUCK ?auto_59105 ?auto_59106 ?auto_59107 )
      ( !DRIVE-TRUCK ?auto_59106 ?auto_59107 ?auto_59104 ?auto_59108 )
      ( !UNLOAD-TRUCK ?auto_59105 ?auto_59106 ?auto_59104 )
      ( DELIVER-1PKG-VERIFY ?auto_59105 ?auto_59104 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60096 - OBJ
      ?auto_60097 - OBJ
      ?auto_60098 - OBJ
      ?auto_60099 - OBJ
      ?auto_60095 - LOCATION
    )
    :vars
    (
      ?auto_60102 - LOCATION
      ?auto_60100 - CITY
      ?auto_60104 - LOCATION
      ?auto_60103 - LOCATION
      ?auto_60105 - LOCATION
      ?auto_60101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60102 ?auto_60100 ) ( IN-CITY ?auto_60095 ?auto_60100 ) ( not ( = ?auto_60095 ?auto_60102 ) ) ( OBJ-AT ?auto_60099 ?auto_60102 ) ( IN-CITY ?auto_60104 ?auto_60100 ) ( not ( = ?auto_60095 ?auto_60104 ) ) ( OBJ-AT ?auto_60098 ?auto_60104 ) ( IN-CITY ?auto_60103 ?auto_60100 ) ( not ( = ?auto_60095 ?auto_60103 ) ) ( OBJ-AT ?auto_60097 ?auto_60103 ) ( IN-CITY ?auto_60105 ?auto_60100 ) ( not ( = ?auto_60095 ?auto_60105 ) ) ( OBJ-AT ?auto_60096 ?auto_60105 ) ( TRUCK-AT ?auto_60101 ?auto_60095 ) ( not ( = ?auto_60096 ?auto_60097 ) ) ( not ( = ?auto_60103 ?auto_60105 ) ) ( not ( = ?auto_60096 ?auto_60098 ) ) ( not ( = ?auto_60097 ?auto_60098 ) ) ( not ( = ?auto_60104 ?auto_60103 ) ) ( not ( = ?auto_60104 ?auto_60105 ) ) ( not ( = ?auto_60096 ?auto_60099 ) ) ( not ( = ?auto_60097 ?auto_60099 ) ) ( not ( = ?auto_60098 ?auto_60099 ) ) ( not ( = ?auto_60102 ?auto_60104 ) ) ( not ( = ?auto_60102 ?auto_60103 ) ) ( not ( = ?auto_60102 ?auto_60105 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60096 ?auto_60098 ?auto_60097 ?auto_60095 )
      ( DELIVER-1PKG ?auto_60099 ?auto_60095 )
      ( DELIVER-4PKG-VERIFY ?auto_60096 ?auto_60097 ?auto_60098 ?auto_60099 ?auto_60095 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60131 - OBJ
      ?auto_60132 - OBJ
      ?auto_60133 - OBJ
      ?auto_60134 - OBJ
      ?auto_60130 - LOCATION
    )
    :vars
    (
      ?auto_60136 - LOCATION
      ?auto_60139 - CITY
      ?auto_60135 - LOCATION
      ?auto_60138 - LOCATION
      ?auto_60137 - LOCATION
      ?auto_60140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60136 ?auto_60139 ) ( IN-CITY ?auto_60130 ?auto_60139 ) ( not ( = ?auto_60130 ?auto_60136 ) ) ( OBJ-AT ?auto_60133 ?auto_60136 ) ( IN-CITY ?auto_60135 ?auto_60139 ) ( not ( = ?auto_60130 ?auto_60135 ) ) ( OBJ-AT ?auto_60134 ?auto_60135 ) ( IN-CITY ?auto_60138 ?auto_60139 ) ( not ( = ?auto_60130 ?auto_60138 ) ) ( OBJ-AT ?auto_60132 ?auto_60138 ) ( IN-CITY ?auto_60137 ?auto_60139 ) ( not ( = ?auto_60130 ?auto_60137 ) ) ( OBJ-AT ?auto_60131 ?auto_60137 ) ( TRUCK-AT ?auto_60140 ?auto_60130 ) ( not ( = ?auto_60131 ?auto_60132 ) ) ( not ( = ?auto_60138 ?auto_60137 ) ) ( not ( = ?auto_60131 ?auto_60134 ) ) ( not ( = ?auto_60132 ?auto_60134 ) ) ( not ( = ?auto_60135 ?auto_60138 ) ) ( not ( = ?auto_60135 ?auto_60137 ) ) ( not ( = ?auto_60131 ?auto_60133 ) ) ( not ( = ?auto_60132 ?auto_60133 ) ) ( not ( = ?auto_60134 ?auto_60133 ) ) ( not ( = ?auto_60136 ?auto_60135 ) ) ( not ( = ?auto_60136 ?auto_60138 ) ) ( not ( = ?auto_60136 ?auto_60137 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60131 ?auto_60132 ?auto_60134 ?auto_60133 ?auto_60130 )
      ( DELIVER-4PKG-VERIFY ?auto_60131 ?auto_60132 ?auto_60133 ?auto_60134 ?auto_60130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60166 - OBJ
      ?auto_60167 - OBJ
      ?auto_60168 - OBJ
      ?auto_60169 - OBJ
      ?auto_60165 - LOCATION
    )
    :vars
    (
      ?auto_60174 - LOCATION
      ?auto_60172 - CITY
      ?auto_60170 - LOCATION
      ?auto_60173 - LOCATION
      ?auto_60175 - LOCATION
      ?auto_60171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60174 ?auto_60172 ) ( IN-CITY ?auto_60165 ?auto_60172 ) ( not ( = ?auto_60165 ?auto_60174 ) ) ( OBJ-AT ?auto_60169 ?auto_60174 ) ( IN-CITY ?auto_60170 ?auto_60172 ) ( not ( = ?auto_60165 ?auto_60170 ) ) ( OBJ-AT ?auto_60167 ?auto_60170 ) ( IN-CITY ?auto_60173 ?auto_60172 ) ( not ( = ?auto_60165 ?auto_60173 ) ) ( OBJ-AT ?auto_60168 ?auto_60173 ) ( IN-CITY ?auto_60175 ?auto_60172 ) ( not ( = ?auto_60165 ?auto_60175 ) ) ( OBJ-AT ?auto_60166 ?auto_60175 ) ( TRUCK-AT ?auto_60171 ?auto_60165 ) ( not ( = ?auto_60166 ?auto_60168 ) ) ( not ( = ?auto_60173 ?auto_60175 ) ) ( not ( = ?auto_60166 ?auto_60167 ) ) ( not ( = ?auto_60168 ?auto_60167 ) ) ( not ( = ?auto_60170 ?auto_60173 ) ) ( not ( = ?auto_60170 ?auto_60175 ) ) ( not ( = ?auto_60166 ?auto_60169 ) ) ( not ( = ?auto_60168 ?auto_60169 ) ) ( not ( = ?auto_60167 ?auto_60169 ) ) ( not ( = ?auto_60174 ?auto_60170 ) ) ( not ( = ?auto_60174 ?auto_60173 ) ) ( not ( = ?auto_60174 ?auto_60175 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60166 ?auto_60168 ?auto_60169 ?auto_60167 ?auto_60165 )
      ( DELIVER-4PKG-VERIFY ?auto_60166 ?auto_60167 ?auto_60168 ?auto_60169 ?auto_60165 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60201 - OBJ
      ?auto_60202 - OBJ
      ?auto_60203 - OBJ
      ?auto_60204 - OBJ
      ?auto_60200 - LOCATION
    )
    :vars
    (
      ?auto_60209 - LOCATION
      ?auto_60207 - CITY
      ?auto_60205 - LOCATION
      ?auto_60208 - LOCATION
      ?auto_60210 - LOCATION
      ?auto_60206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60209 ?auto_60207 ) ( IN-CITY ?auto_60200 ?auto_60207 ) ( not ( = ?auto_60200 ?auto_60209 ) ) ( OBJ-AT ?auto_60203 ?auto_60209 ) ( IN-CITY ?auto_60205 ?auto_60207 ) ( not ( = ?auto_60200 ?auto_60205 ) ) ( OBJ-AT ?auto_60202 ?auto_60205 ) ( IN-CITY ?auto_60208 ?auto_60207 ) ( not ( = ?auto_60200 ?auto_60208 ) ) ( OBJ-AT ?auto_60204 ?auto_60208 ) ( IN-CITY ?auto_60210 ?auto_60207 ) ( not ( = ?auto_60200 ?auto_60210 ) ) ( OBJ-AT ?auto_60201 ?auto_60210 ) ( TRUCK-AT ?auto_60206 ?auto_60200 ) ( not ( = ?auto_60201 ?auto_60204 ) ) ( not ( = ?auto_60208 ?auto_60210 ) ) ( not ( = ?auto_60201 ?auto_60202 ) ) ( not ( = ?auto_60204 ?auto_60202 ) ) ( not ( = ?auto_60205 ?auto_60208 ) ) ( not ( = ?auto_60205 ?auto_60210 ) ) ( not ( = ?auto_60201 ?auto_60203 ) ) ( not ( = ?auto_60204 ?auto_60203 ) ) ( not ( = ?auto_60202 ?auto_60203 ) ) ( not ( = ?auto_60209 ?auto_60205 ) ) ( not ( = ?auto_60209 ?auto_60208 ) ) ( not ( = ?auto_60209 ?auto_60210 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60201 ?auto_60204 ?auto_60203 ?auto_60202 ?auto_60200 )
      ( DELIVER-4PKG-VERIFY ?auto_60201 ?auto_60202 ?auto_60203 ?auto_60204 ?auto_60200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60310 - OBJ
      ?auto_60311 - OBJ
      ?auto_60312 - OBJ
      ?auto_60313 - OBJ
      ?auto_60309 - LOCATION
    )
    :vars
    (
      ?auto_60318 - LOCATION
      ?auto_60316 - CITY
      ?auto_60314 - LOCATION
      ?auto_60317 - LOCATION
      ?auto_60319 - LOCATION
      ?auto_60315 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60318 ?auto_60316 ) ( IN-CITY ?auto_60309 ?auto_60316 ) ( not ( = ?auto_60309 ?auto_60318 ) ) ( OBJ-AT ?auto_60311 ?auto_60318 ) ( IN-CITY ?auto_60314 ?auto_60316 ) ( not ( = ?auto_60309 ?auto_60314 ) ) ( OBJ-AT ?auto_60313 ?auto_60314 ) ( IN-CITY ?auto_60317 ?auto_60316 ) ( not ( = ?auto_60309 ?auto_60317 ) ) ( OBJ-AT ?auto_60312 ?auto_60317 ) ( IN-CITY ?auto_60319 ?auto_60316 ) ( not ( = ?auto_60309 ?auto_60319 ) ) ( OBJ-AT ?auto_60310 ?auto_60319 ) ( TRUCK-AT ?auto_60315 ?auto_60309 ) ( not ( = ?auto_60310 ?auto_60312 ) ) ( not ( = ?auto_60317 ?auto_60319 ) ) ( not ( = ?auto_60310 ?auto_60313 ) ) ( not ( = ?auto_60312 ?auto_60313 ) ) ( not ( = ?auto_60314 ?auto_60317 ) ) ( not ( = ?auto_60314 ?auto_60319 ) ) ( not ( = ?auto_60310 ?auto_60311 ) ) ( not ( = ?auto_60312 ?auto_60311 ) ) ( not ( = ?auto_60313 ?auto_60311 ) ) ( not ( = ?auto_60318 ?auto_60314 ) ) ( not ( = ?auto_60318 ?auto_60317 ) ) ( not ( = ?auto_60318 ?auto_60319 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60310 ?auto_60312 ?auto_60311 ?auto_60313 ?auto_60309 )
      ( DELIVER-4PKG-VERIFY ?auto_60310 ?auto_60311 ?auto_60312 ?auto_60313 ?auto_60309 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60345 - OBJ
      ?auto_60346 - OBJ
      ?auto_60347 - OBJ
      ?auto_60348 - OBJ
      ?auto_60344 - LOCATION
    )
    :vars
    (
      ?auto_60353 - LOCATION
      ?auto_60351 - CITY
      ?auto_60349 - LOCATION
      ?auto_60352 - LOCATION
      ?auto_60354 - LOCATION
      ?auto_60350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60353 ?auto_60351 ) ( IN-CITY ?auto_60344 ?auto_60351 ) ( not ( = ?auto_60344 ?auto_60353 ) ) ( OBJ-AT ?auto_60346 ?auto_60353 ) ( IN-CITY ?auto_60349 ?auto_60351 ) ( not ( = ?auto_60344 ?auto_60349 ) ) ( OBJ-AT ?auto_60347 ?auto_60349 ) ( IN-CITY ?auto_60352 ?auto_60351 ) ( not ( = ?auto_60344 ?auto_60352 ) ) ( OBJ-AT ?auto_60348 ?auto_60352 ) ( IN-CITY ?auto_60354 ?auto_60351 ) ( not ( = ?auto_60344 ?auto_60354 ) ) ( OBJ-AT ?auto_60345 ?auto_60354 ) ( TRUCK-AT ?auto_60350 ?auto_60344 ) ( not ( = ?auto_60345 ?auto_60348 ) ) ( not ( = ?auto_60352 ?auto_60354 ) ) ( not ( = ?auto_60345 ?auto_60347 ) ) ( not ( = ?auto_60348 ?auto_60347 ) ) ( not ( = ?auto_60349 ?auto_60352 ) ) ( not ( = ?auto_60349 ?auto_60354 ) ) ( not ( = ?auto_60345 ?auto_60346 ) ) ( not ( = ?auto_60348 ?auto_60346 ) ) ( not ( = ?auto_60347 ?auto_60346 ) ) ( not ( = ?auto_60353 ?auto_60349 ) ) ( not ( = ?auto_60353 ?auto_60352 ) ) ( not ( = ?auto_60353 ?auto_60354 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60345 ?auto_60348 ?auto_60346 ?auto_60347 ?auto_60344 )
      ( DELIVER-4PKG-VERIFY ?auto_60345 ?auto_60346 ?auto_60347 ?auto_60348 ?auto_60344 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60454 - OBJ
      ?auto_60455 - OBJ
      ?auto_60456 - OBJ
      ?auto_60457 - OBJ
      ?auto_60453 - LOCATION
    )
    :vars
    (
      ?auto_60462 - LOCATION
      ?auto_60460 - CITY
      ?auto_60458 - LOCATION
      ?auto_60461 - LOCATION
      ?auto_60463 - LOCATION
      ?auto_60459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60462 ?auto_60460 ) ( IN-CITY ?auto_60453 ?auto_60460 ) ( not ( = ?auto_60453 ?auto_60462 ) ) ( OBJ-AT ?auto_60457 ?auto_60462 ) ( IN-CITY ?auto_60458 ?auto_60460 ) ( not ( = ?auto_60453 ?auto_60458 ) ) ( OBJ-AT ?auto_60456 ?auto_60458 ) ( IN-CITY ?auto_60461 ?auto_60460 ) ( not ( = ?auto_60453 ?auto_60461 ) ) ( OBJ-AT ?auto_60454 ?auto_60461 ) ( IN-CITY ?auto_60463 ?auto_60460 ) ( not ( = ?auto_60453 ?auto_60463 ) ) ( OBJ-AT ?auto_60455 ?auto_60463 ) ( TRUCK-AT ?auto_60459 ?auto_60453 ) ( not ( = ?auto_60455 ?auto_60454 ) ) ( not ( = ?auto_60461 ?auto_60463 ) ) ( not ( = ?auto_60455 ?auto_60456 ) ) ( not ( = ?auto_60454 ?auto_60456 ) ) ( not ( = ?auto_60458 ?auto_60461 ) ) ( not ( = ?auto_60458 ?auto_60463 ) ) ( not ( = ?auto_60455 ?auto_60457 ) ) ( not ( = ?auto_60454 ?auto_60457 ) ) ( not ( = ?auto_60456 ?auto_60457 ) ) ( not ( = ?auto_60462 ?auto_60458 ) ) ( not ( = ?auto_60462 ?auto_60461 ) ) ( not ( = ?auto_60462 ?auto_60463 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60455 ?auto_60454 ?auto_60457 ?auto_60456 ?auto_60453 )
      ( DELIVER-4PKG-VERIFY ?auto_60454 ?auto_60455 ?auto_60456 ?auto_60457 ?auto_60453 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60489 - OBJ
      ?auto_60490 - OBJ
      ?auto_60491 - OBJ
      ?auto_60492 - OBJ
      ?auto_60488 - LOCATION
    )
    :vars
    (
      ?auto_60497 - LOCATION
      ?auto_60495 - CITY
      ?auto_60493 - LOCATION
      ?auto_60496 - LOCATION
      ?auto_60498 - LOCATION
      ?auto_60494 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60497 ?auto_60495 ) ( IN-CITY ?auto_60488 ?auto_60495 ) ( not ( = ?auto_60488 ?auto_60497 ) ) ( OBJ-AT ?auto_60491 ?auto_60497 ) ( IN-CITY ?auto_60493 ?auto_60495 ) ( not ( = ?auto_60488 ?auto_60493 ) ) ( OBJ-AT ?auto_60492 ?auto_60493 ) ( IN-CITY ?auto_60496 ?auto_60495 ) ( not ( = ?auto_60488 ?auto_60496 ) ) ( OBJ-AT ?auto_60489 ?auto_60496 ) ( IN-CITY ?auto_60498 ?auto_60495 ) ( not ( = ?auto_60488 ?auto_60498 ) ) ( OBJ-AT ?auto_60490 ?auto_60498 ) ( TRUCK-AT ?auto_60494 ?auto_60488 ) ( not ( = ?auto_60490 ?auto_60489 ) ) ( not ( = ?auto_60496 ?auto_60498 ) ) ( not ( = ?auto_60490 ?auto_60492 ) ) ( not ( = ?auto_60489 ?auto_60492 ) ) ( not ( = ?auto_60493 ?auto_60496 ) ) ( not ( = ?auto_60493 ?auto_60498 ) ) ( not ( = ?auto_60490 ?auto_60491 ) ) ( not ( = ?auto_60489 ?auto_60491 ) ) ( not ( = ?auto_60492 ?auto_60491 ) ) ( not ( = ?auto_60497 ?auto_60493 ) ) ( not ( = ?auto_60497 ?auto_60496 ) ) ( not ( = ?auto_60497 ?auto_60498 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60490 ?auto_60489 ?auto_60491 ?auto_60492 ?auto_60488 )
      ( DELIVER-4PKG-VERIFY ?auto_60489 ?auto_60490 ?auto_60491 ?auto_60492 ?auto_60488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60599 - OBJ
      ?auto_60600 - OBJ
      ?auto_60601 - OBJ
      ?auto_60602 - OBJ
      ?auto_60598 - LOCATION
    )
    :vars
    (
      ?auto_60607 - LOCATION
      ?auto_60605 - CITY
      ?auto_60603 - LOCATION
      ?auto_60606 - LOCATION
      ?auto_60608 - LOCATION
      ?auto_60604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60607 ?auto_60605 ) ( IN-CITY ?auto_60598 ?auto_60605 ) ( not ( = ?auto_60598 ?auto_60607 ) ) ( OBJ-AT ?auto_60602 ?auto_60607 ) ( IN-CITY ?auto_60603 ?auto_60605 ) ( not ( = ?auto_60598 ?auto_60603 ) ) ( OBJ-AT ?auto_60600 ?auto_60603 ) ( IN-CITY ?auto_60606 ?auto_60605 ) ( not ( = ?auto_60598 ?auto_60606 ) ) ( OBJ-AT ?auto_60599 ?auto_60606 ) ( IN-CITY ?auto_60608 ?auto_60605 ) ( not ( = ?auto_60598 ?auto_60608 ) ) ( OBJ-AT ?auto_60601 ?auto_60608 ) ( TRUCK-AT ?auto_60604 ?auto_60598 ) ( not ( = ?auto_60601 ?auto_60599 ) ) ( not ( = ?auto_60606 ?auto_60608 ) ) ( not ( = ?auto_60601 ?auto_60600 ) ) ( not ( = ?auto_60599 ?auto_60600 ) ) ( not ( = ?auto_60603 ?auto_60606 ) ) ( not ( = ?auto_60603 ?auto_60608 ) ) ( not ( = ?auto_60601 ?auto_60602 ) ) ( not ( = ?auto_60599 ?auto_60602 ) ) ( not ( = ?auto_60600 ?auto_60602 ) ) ( not ( = ?auto_60607 ?auto_60603 ) ) ( not ( = ?auto_60607 ?auto_60606 ) ) ( not ( = ?auto_60607 ?auto_60608 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60601 ?auto_60599 ?auto_60602 ?auto_60600 ?auto_60598 )
      ( DELIVER-4PKG-VERIFY ?auto_60599 ?auto_60600 ?auto_60601 ?auto_60602 ?auto_60598 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60634 - OBJ
      ?auto_60635 - OBJ
      ?auto_60636 - OBJ
      ?auto_60637 - OBJ
      ?auto_60633 - LOCATION
    )
    :vars
    (
      ?auto_60642 - LOCATION
      ?auto_60640 - CITY
      ?auto_60638 - LOCATION
      ?auto_60641 - LOCATION
      ?auto_60643 - LOCATION
      ?auto_60639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60642 ?auto_60640 ) ( IN-CITY ?auto_60633 ?auto_60640 ) ( not ( = ?auto_60633 ?auto_60642 ) ) ( OBJ-AT ?auto_60636 ?auto_60642 ) ( IN-CITY ?auto_60638 ?auto_60640 ) ( not ( = ?auto_60633 ?auto_60638 ) ) ( OBJ-AT ?auto_60635 ?auto_60638 ) ( IN-CITY ?auto_60641 ?auto_60640 ) ( not ( = ?auto_60633 ?auto_60641 ) ) ( OBJ-AT ?auto_60634 ?auto_60641 ) ( IN-CITY ?auto_60643 ?auto_60640 ) ( not ( = ?auto_60633 ?auto_60643 ) ) ( OBJ-AT ?auto_60637 ?auto_60643 ) ( TRUCK-AT ?auto_60639 ?auto_60633 ) ( not ( = ?auto_60637 ?auto_60634 ) ) ( not ( = ?auto_60641 ?auto_60643 ) ) ( not ( = ?auto_60637 ?auto_60635 ) ) ( not ( = ?auto_60634 ?auto_60635 ) ) ( not ( = ?auto_60638 ?auto_60641 ) ) ( not ( = ?auto_60638 ?auto_60643 ) ) ( not ( = ?auto_60637 ?auto_60636 ) ) ( not ( = ?auto_60634 ?auto_60636 ) ) ( not ( = ?auto_60635 ?auto_60636 ) ) ( not ( = ?auto_60642 ?auto_60638 ) ) ( not ( = ?auto_60642 ?auto_60641 ) ) ( not ( = ?auto_60642 ?auto_60643 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60637 ?auto_60634 ?auto_60636 ?auto_60635 ?auto_60633 )
      ( DELIVER-4PKG-VERIFY ?auto_60634 ?auto_60635 ?auto_60636 ?auto_60637 ?auto_60633 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60705 - OBJ
      ?auto_60706 - OBJ
      ?auto_60707 - OBJ
      ?auto_60708 - OBJ
      ?auto_60704 - LOCATION
    )
    :vars
    (
      ?auto_60713 - LOCATION
      ?auto_60711 - CITY
      ?auto_60709 - LOCATION
      ?auto_60712 - LOCATION
      ?auto_60714 - LOCATION
      ?auto_60710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60713 ?auto_60711 ) ( IN-CITY ?auto_60704 ?auto_60711 ) ( not ( = ?auto_60704 ?auto_60713 ) ) ( OBJ-AT ?auto_60706 ?auto_60713 ) ( IN-CITY ?auto_60709 ?auto_60711 ) ( not ( = ?auto_60704 ?auto_60709 ) ) ( OBJ-AT ?auto_60708 ?auto_60709 ) ( IN-CITY ?auto_60712 ?auto_60711 ) ( not ( = ?auto_60704 ?auto_60712 ) ) ( OBJ-AT ?auto_60705 ?auto_60712 ) ( IN-CITY ?auto_60714 ?auto_60711 ) ( not ( = ?auto_60704 ?auto_60714 ) ) ( OBJ-AT ?auto_60707 ?auto_60714 ) ( TRUCK-AT ?auto_60710 ?auto_60704 ) ( not ( = ?auto_60707 ?auto_60705 ) ) ( not ( = ?auto_60712 ?auto_60714 ) ) ( not ( = ?auto_60707 ?auto_60708 ) ) ( not ( = ?auto_60705 ?auto_60708 ) ) ( not ( = ?auto_60709 ?auto_60712 ) ) ( not ( = ?auto_60709 ?auto_60714 ) ) ( not ( = ?auto_60707 ?auto_60706 ) ) ( not ( = ?auto_60705 ?auto_60706 ) ) ( not ( = ?auto_60708 ?auto_60706 ) ) ( not ( = ?auto_60713 ?auto_60709 ) ) ( not ( = ?auto_60713 ?auto_60712 ) ) ( not ( = ?auto_60713 ?auto_60714 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60707 ?auto_60705 ?auto_60706 ?auto_60708 ?auto_60704 )
      ( DELIVER-4PKG-VERIFY ?auto_60705 ?auto_60706 ?auto_60707 ?auto_60708 ?auto_60704 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60778 - OBJ
      ?auto_60779 - OBJ
      ?auto_60780 - OBJ
      ?auto_60781 - OBJ
      ?auto_60777 - LOCATION
    )
    :vars
    (
      ?auto_60786 - LOCATION
      ?auto_60784 - CITY
      ?auto_60782 - LOCATION
      ?auto_60785 - LOCATION
      ?auto_60787 - LOCATION
      ?auto_60783 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60786 ?auto_60784 ) ( IN-CITY ?auto_60777 ?auto_60784 ) ( not ( = ?auto_60777 ?auto_60786 ) ) ( OBJ-AT ?auto_60779 ?auto_60786 ) ( IN-CITY ?auto_60782 ?auto_60784 ) ( not ( = ?auto_60777 ?auto_60782 ) ) ( OBJ-AT ?auto_60780 ?auto_60782 ) ( IN-CITY ?auto_60785 ?auto_60784 ) ( not ( = ?auto_60777 ?auto_60785 ) ) ( OBJ-AT ?auto_60778 ?auto_60785 ) ( IN-CITY ?auto_60787 ?auto_60784 ) ( not ( = ?auto_60777 ?auto_60787 ) ) ( OBJ-AT ?auto_60781 ?auto_60787 ) ( TRUCK-AT ?auto_60783 ?auto_60777 ) ( not ( = ?auto_60781 ?auto_60778 ) ) ( not ( = ?auto_60785 ?auto_60787 ) ) ( not ( = ?auto_60781 ?auto_60780 ) ) ( not ( = ?auto_60778 ?auto_60780 ) ) ( not ( = ?auto_60782 ?auto_60785 ) ) ( not ( = ?auto_60782 ?auto_60787 ) ) ( not ( = ?auto_60781 ?auto_60779 ) ) ( not ( = ?auto_60778 ?auto_60779 ) ) ( not ( = ?auto_60780 ?auto_60779 ) ) ( not ( = ?auto_60786 ?auto_60782 ) ) ( not ( = ?auto_60786 ?auto_60785 ) ) ( not ( = ?auto_60786 ?auto_60787 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60781 ?auto_60778 ?auto_60779 ?auto_60780 ?auto_60777 )
      ( DELIVER-4PKG-VERIFY ?auto_60778 ?auto_60779 ?auto_60780 ?auto_60781 ?auto_60777 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60887 - OBJ
      ?auto_60888 - OBJ
      ?auto_60889 - OBJ
      ?auto_60890 - OBJ
      ?auto_60886 - LOCATION
    )
    :vars
    (
      ?auto_60895 - LOCATION
      ?auto_60893 - CITY
      ?auto_60891 - LOCATION
      ?auto_60894 - LOCATION
      ?auto_60896 - LOCATION
      ?auto_60892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60895 ?auto_60893 ) ( IN-CITY ?auto_60886 ?auto_60893 ) ( not ( = ?auto_60886 ?auto_60895 ) ) ( OBJ-AT ?auto_60890 ?auto_60895 ) ( IN-CITY ?auto_60891 ?auto_60893 ) ( not ( = ?auto_60886 ?auto_60891 ) ) ( OBJ-AT ?auto_60887 ?auto_60891 ) ( IN-CITY ?auto_60894 ?auto_60893 ) ( not ( = ?auto_60886 ?auto_60894 ) ) ( OBJ-AT ?auto_60889 ?auto_60894 ) ( IN-CITY ?auto_60896 ?auto_60893 ) ( not ( = ?auto_60886 ?auto_60896 ) ) ( OBJ-AT ?auto_60888 ?auto_60896 ) ( TRUCK-AT ?auto_60892 ?auto_60886 ) ( not ( = ?auto_60888 ?auto_60889 ) ) ( not ( = ?auto_60894 ?auto_60896 ) ) ( not ( = ?auto_60888 ?auto_60887 ) ) ( not ( = ?auto_60889 ?auto_60887 ) ) ( not ( = ?auto_60891 ?auto_60894 ) ) ( not ( = ?auto_60891 ?auto_60896 ) ) ( not ( = ?auto_60888 ?auto_60890 ) ) ( not ( = ?auto_60889 ?auto_60890 ) ) ( not ( = ?auto_60887 ?auto_60890 ) ) ( not ( = ?auto_60895 ?auto_60891 ) ) ( not ( = ?auto_60895 ?auto_60894 ) ) ( not ( = ?auto_60895 ?auto_60896 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60888 ?auto_60889 ?auto_60890 ?auto_60887 ?auto_60886 )
      ( DELIVER-4PKG-VERIFY ?auto_60887 ?auto_60888 ?auto_60889 ?auto_60890 ?auto_60886 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60922 - OBJ
      ?auto_60923 - OBJ
      ?auto_60924 - OBJ
      ?auto_60925 - OBJ
      ?auto_60921 - LOCATION
    )
    :vars
    (
      ?auto_60930 - LOCATION
      ?auto_60928 - CITY
      ?auto_60926 - LOCATION
      ?auto_60929 - LOCATION
      ?auto_60931 - LOCATION
      ?auto_60927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60930 ?auto_60928 ) ( IN-CITY ?auto_60921 ?auto_60928 ) ( not ( = ?auto_60921 ?auto_60930 ) ) ( OBJ-AT ?auto_60924 ?auto_60930 ) ( IN-CITY ?auto_60926 ?auto_60928 ) ( not ( = ?auto_60921 ?auto_60926 ) ) ( OBJ-AT ?auto_60922 ?auto_60926 ) ( IN-CITY ?auto_60929 ?auto_60928 ) ( not ( = ?auto_60921 ?auto_60929 ) ) ( OBJ-AT ?auto_60925 ?auto_60929 ) ( IN-CITY ?auto_60931 ?auto_60928 ) ( not ( = ?auto_60921 ?auto_60931 ) ) ( OBJ-AT ?auto_60923 ?auto_60931 ) ( TRUCK-AT ?auto_60927 ?auto_60921 ) ( not ( = ?auto_60923 ?auto_60925 ) ) ( not ( = ?auto_60929 ?auto_60931 ) ) ( not ( = ?auto_60923 ?auto_60922 ) ) ( not ( = ?auto_60925 ?auto_60922 ) ) ( not ( = ?auto_60926 ?auto_60929 ) ) ( not ( = ?auto_60926 ?auto_60931 ) ) ( not ( = ?auto_60923 ?auto_60924 ) ) ( not ( = ?auto_60925 ?auto_60924 ) ) ( not ( = ?auto_60922 ?auto_60924 ) ) ( not ( = ?auto_60930 ?auto_60926 ) ) ( not ( = ?auto_60930 ?auto_60929 ) ) ( not ( = ?auto_60930 ?auto_60931 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60923 ?auto_60925 ?auto_60924 ?auto_60922 ?auto_60921 )
      ( DELIVER-4PKG-VERIFY ?auto_60922 ?auto_60923 ?auto_60924 ?auto_60925 ?auto_60921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60957 - OBJ
      ?auto_60958 - OBJ
      ?auto_60959 - OBJ
      ?auto_60960 - OBJ
      ?auto_60956 - LOCATION
    )
    :vars
    (
      ?auto_60965 - LOCATION
      ?auto_60963 - CITY
      ?auto_60961 - LOCATION
      ?auto_60964 - LOCATION
      ?auto_60966 - LOCATION
      ?auto_60962 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60965 ?auto_60963 ) ( IN-CITY ?auto_60956 ?auto_60963 ) ( not ( = ?auto_60956 ?auto_60965 ) ) ( OBJ-AT ?auto_60960 ?auto_60965 ) ( IN-CITY ?auto_60961 ?auto_60963 ) ( not ( = ?auto_60956 ?auto_60961 ) ) ( OBJ-AT ?auto_60957 ?auto_60961 ) ( IN-CITY ?auto_60964 ?auto_60963 ) ( not ( = ?auto_60956 ?auto_60964 ) ) ( OBJ-AT ?auto_60958 ?auto_60964 ) ( IN-CITY ?auto_60966 ?auto_60963 ) ( not ( = ?auto_60956 ?auto_60966 ) ) ( OBJ-AT ?auto_60959 ?auto_60966 ) ( TRUCK-AT ?auto_60962 ?auto_60956 ) ( not ( = ?auto_60959 ?auto_60958 ) ) ( not ( = ?auto_60964 ?auto_60966 ) ) ( not ( = ?auto_60959 ?auto_60957 ) ) ( not ( = ?auto_60958 ?auto_60957 ) ) ( not ( = ?auto_60961 ?auto_60964 ) ) ( not ( = ?auto_60961 ?auto_60966 ) ) ( not ( = ?auto_60959 ?auto_60960 ) ) ( not ( = ?auto_60958 ?auto_60960 ) ) ( not ( = ?auto_60957 ?auto_60960 ) ) ( not ( = ?auto_60965 ?auto_60961 ) ) ( not ( = ?auto_60965 ?auto_60964 ) ) ( not ( = ?auto_60965 ?auto_60966 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60959 ?auto_60958 ?auto_60960 ?auto_60957 ?auto_60956 )
      ( DELIVER-4PKG-VERIFY ?auto_60957 ?auto_60958 ?auto_60959 ?auto_60960 ?auto_60956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60992 - OBJ
      ?auto_60993 - OBJ
      ?auto_60994 - OBJ
      ?auto_60995 - OBJ
      ?auto_60991 - LOCATION
    )
    :vars
    (
      ?auto_61000 - LOCATION
      ?auto_60998 - CITY
      ?auto_60996 - LOCATION
      ?auto_60999 - LOCATION
      ?auto_61001 - LOCATION
      ?auto_60997 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61000 ?auto_60998 ) ( IN-CITY ?auto_60991 ?auto_60998 ) ( not ( = ?auto_60991 ?auto_61000 ) ) ( OBJ-AT ?auto_60994 ?auto_61000 ) ( IN-CITY ?auto_60996 ?auto_60998 ) ( not ( = ?auto_60991 ?auto_60996 ) ) ( OBJ-AT ?auto_60992 ?auto_60996 ) ( IN-CITY ?auto_60999 ?auto_60998 ) ( not ( = ?auto_60991 ?auto_60999 ) ) ( OBJ-AT ?auto_60993 ?auto_60999 ) ( IN-CITY ?auto_61001 ?auto_60998 ) ( not ( = ?auto_60991 ?auto_61001 ) ) ( OBJ-AT ?auto_60995 ?auto_61001 ) ( TRUCK-AT ?auto_60997 ?auto_60991 ) ( not ( = ?auto_60995 ?auto_60993 ) ) ( not ( = ?auto_60999 ?auto_61001 ) ) ( not ( = ?auto_60995 ?auto_60992 ) ) ( not ( = ?auto_60993 ?auto_60992 ) ) ( not ( = ?auto_60996 ?auto_60999 ) ) ( not ( = ?auto_60996 ?auto_61001 ) ) ( not ( = ?auto_60995 ?auto_60994 ) ) ( not ( = ?auto_60993 ?auto_60994 ) ) ( not ( = ?auto_60992 ?auto_60994 ) ) ( not ( = ?auto_61000 ?auto_60996 ) ) ( not ( = ?auto_61000 ?auto_60999 ) ) ( not ( = ?auto_61000 ?auto_61001 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_60995 ?auto_60993 ?auto_60994 ?auto_60992 ?auto_60991 )
      ( DELIVER-4PKG-VERIFY ?auto_60992 ?auto_60993 ?auto_60994 ?auto_60995 ?auto_60991 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61138 - OBJ
      ?auto_61139 - OBJ
      ?auto_61140 - OBJ
      ?auto_61141 - OBJ
      ?auto_61137 - LOCATION
    )
    :vars
    (
      ?auto_61146 - LOCATION
      ?auto_61144 - CITY
      ?auto_61142 - LOCATION
      ?auto_61145 - LOCATION
      ?auto_61147 - LOCATION
      ?auto_61143 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61146 ?auto_61144 ) ( IN-CITY ?auto_61137 ?auto_61144 ) ( not ( = ?auto_61137 ?auto_61146 ) ) ( OBJ-AT ?auto_61139 ?auto_61146 ) ( IN-CITY ?auto_61142 ?auto_61144 ) ( not ( = ?auto_61137 ?auto_61142 ) ) ( OBJ-AT ?auto_61138 ?auto_61142 ) ( IN-CITY ?auto_61145 ?auto_61144 ) ( not ( = ?auto_61137 ?auto_61145 ) ) ( OBJ-AT ?auto_61141 ?auto_61145 ) ( IN-CITY ?auto_61147 ?auto_61144 ) ( not ( = ?auto_61137 ?auto_61147 ) ) ( OBJ-AT ?auto_61140 ?auto_61147 ) ( TRUCK-AT ?auto_61143 ?auto_61137 ) ( not ( = ?auto_61140 ?auto_61141 ) ) ( not ( = ?auto_61145 ?auto_61147 ) ) ( not ( = ?auto_61140 ?auto_61138 ) ) ( not ( = ?auto_61141 ?auto_61138 ) ) ( not ( = ?auto_61142 ?auto_61145 ) ) ( not ( = ?auto_61142 ?auto_61147 ) ) ( not ( = ?auto_61140 ?auto_61139 ) ) ( not ( = ?auto_61141 ?auto_61139 ) ) ( not ( = ?auto_61138 ?auto_61139 ) ) ( not ( = ?auto_61146 ?auto_61142 ) ) ( not ( = ?auto_61146 ?auto_61145 ) ) ( not ( = ?auto_61146 ?auto_61147 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61140 ?auto_61141 ?auto_61139 ?auto_61138 ?auto_61137 )
      ( DELIVER-4PKG-VERIFY ?auto_61138 ?auto_61139 ?auto_61140 ?auto_61141 ?auto_61137 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61173 - OBJ
      ?auto_61174 - OBJ
      ?auto_61175 - OBJ
      ?auto_61176 - OBJ
      ?auto_61172 - LOCATION
    )
    :vars
    (
      ?auto_61181 - LOCATION
      ?auto_61179 - CITY
      ?auto_61177 - LOCATION
      ?auto_61180 - LOCATION
      ?auto_61182 - LOCATION
      ?auto_61178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61181 ?auto_61179 ) ( IN-CITY ?auto_61172 ?auto_61179 ) ( not ( = ?auto_61172 ?auto_61181 ) ) ( OBJ-AT ?auto_61174 ?auto_61181 ) ( IN-CITY ?auto_61177 ?auto_61179 ) ( not ( = ?auto_61172 ?auto_61177 ) ) ( OBJ-AT ?auto_61173 ?auto_61177 ) ( IN-CITY ?auto_61180 ?auto_61179 ) ( not ( = ?auto_61172 ?auto_61180 ) ) ( OBJ-AT ?auto_61175 ?auto_61180 ) ( IN-CITY ?auto_61182 ?auto_61179 ) ( not ( = ?auto_61172 ?auto_61182 ) ) ( OBJ-AT ?auto_61176 ?auto_61182 ) ( TRUCK-AT ?auto_61178 ?auto_61172 ) ( not ( = ?auto_61176 ?auto_61175 ) ) ( not ( = ?auto_61180 ?auto_61182 ) ) ( not ( = ?auto_61176 ?auto_61173 ) ) ( not ( = ?auto_61175 ?auto_61173 ) ) ( not ( = ?auto_61177 ?auto_61180 ) ) ( not ( = ?auto_61177 ?auto_61182 ) ) ( not ( = ?auto_61176 ?auto_61174 ) ) ( not ( = ?auto_61175 ?auto_61174 ) ) ( not ( = ?auto_61173 ?auto_61174 ) ) ( not ( = ?auto_61181 ?auto_61177 ) ) ( not ( = ?auto_61181 ?auto_61180 ) ) ( not ( = ?auto_61181 ?auto_61182 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61176 ?auto_61175 ?auto_61174 ?auto_61173 ?auto_61172 )
      ( DELIVER-4PKG-VERIFY ?auto_61173 ?auto_61174 ?auto_61175 ?auto_61176 ?auto_61172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61394 - OBJ
      ?auto_61395 - OBJ
      ?auto_61396 - OBJ
      ?auto_61397 - OBJ
      ?auto_61393 - LOCATION
    )
    :vars
    (
      ?auto_61402 - LOCATION
      ?auto_61400 - CITY
      ?auto_61398 - LOCATION
      ?auto_61401 - LOCATION
      ?auto_61403 - LOCATION
      ?auto_61399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61402 ?auto_61400 ) ( IN-CITY ?auto_61393 ?auto_61400 ) ( not ( = ?auto_61393 ?auto_61402 ) ) ( OBJ-AT ?auto_61394 ?auto_61402 ) ( IN-CITY ?auto_61398 ?auto_61400 ) ( not ( = ?auto_61393 ?auto_61398 ) ) ( OBJ-AT ?auto_61397 ?auto_61398 ) ( IN-CITY ?auto_61401 ?auto_61400 ) ( not ( = ?auto_61393 ?auto_61401 ) ) ( OBJ-AT ?auto_61396 ?auto_61401 ) ( IN-CITY ?auto_61403 ?auto_61400 ) ( not ( = ?auto_61393 ?auto_61403 ) ) ( OBJ-AT ?auto_61395 ?auto_61403 ) ( TRUCK-AT ?auto_61399 ?auto_61393 ) ( not ( = ?auto_61395 ?auto_61396 ) ) ( not ( = ?auto_61401 ?auto_61403 ) ) ( not ( = ?auto_61395 ?auto_61397 ) ) ( not ( = ?auto_61396 ?auto_61397 ) ) ( not ( = ?auto_61398 ?auto_61401 ) ) ( not ( = ?auto_61398 ?auto_61403 ) ) ( not ( = ?auto_61395 ?auto_61394 ) ) ( not ( = ?auto_61396 ?auto_61394 ) ) ( not ( = ?auto_61397 ?auto_61394 ) ) ( not ( = ?auto_61402 ?auto_61398 ) ) ( not ( = ?auto_61402 ?auto_61401 ) ) ( not ( = ?auto_61402 ?auto_61403 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61395 ?auto_61396 ?auto_61394 ?auto_61397 ?auto_61393 )
      ( DELIVER-4PKG-VERIFY ?auto_61394 ?auto_61395 ?auto_61396 ?auto_61397 ?auto_61393 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61429 - OBJ
      ?auto_61430 - OBJ
      ?auto_61431 - OBJ
      ?auto_61432 - OBJ
      ?auto_61428 - LOCATION
    )
    :vars
    (
      ?auto_61437 - LOCATION
      ?auto_61435 - CITY
      ?auto_61433 - LOCATION
      ?auto_61436 - LOCATION
      ?auto_61438 - LOCATION
      ?auto_61434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61437 ?auto_61435 ) ( IN-CITY ?auto_61428 ?auto_61435 ) ( not ( = ?auto_61428 ?auto_61437 ) ) ( OBJ-AT ?auto_61429 ?auto_61437 ) ( IN-CITY ?auto_61433 ?auto_61435 ) ( not ( = ?auto_61428 ?auto_61433 ) ) ( OBJ-AT ?auto_61431 ?auto_61433 ) ( IN-CITY ?auto_61436 ?auto_61435 ) ( not ( = ?auto_61428 ?auto_61436 ) ) ( OBJ-AT ?auto_61432 ?auto_61436 ) ( IN-CITY ?auto_61438 ?auto_61435 ) ( not ( = ?auto_61428 ?auto_61438 ) ) ( OBJ-AT ?auto_61430 ?auto_61438 ) ( TRUCK-AT ?auto_61434 ?auto_61428 ) ( not ( = ?auto_61430 ?auto_61432 ) ) ( not ( = ?auto_61436 ?auto_61438 ) ) ( not ( = ?auto_61430 ?auto_61431 ) ) ( not ( = ?auto_61432 ?auto_61431 ) ) ( not ( = ?auto_61433 ?auto_61436 ) ) ( not ( = ?auto_61433 ?auto_61438 ) ) ( not ( = ?auto_61430 ?auto_61429 ) ) ( not ( = ?auto_61432 ?auto_61429 ) ) ( not ( = ?auto_61431 ?auto_61429 ) ) ( not ( = ?auto_61437 ?auto_61433 ) ) ( not ( = ?auto_61437 ?auto_61436 ) ) ( not ( = ?auto_61437 ?auto_61438 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61430 ?auto_61432 ?auto_61429 ?auto_61431 ?auto_61428 )
      ( DELIVER-4PKG-VERIFY ?auto_61429 ?auto_61430 ?auto_61431 ?auto_61432 ?auto_61428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61538 - OBJ
      ?auto_61539 - OBJ
      ?auto_61540 - OBJ
      ?auto_61541 - OBJ
      ?auto_61537 - LOCATION
    )
    :vars
    (
      ?auto_61546 - LOCATION
      ?auto_61544 - CITY
      ?auto_61542 - LOCATION
      ?auto_61545 - LOCATION
      ?auto_61547 - LOCATION
      ?auto_61543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61546 ?auto_61544 ) ( IN-CITY ?auto_61537 ?auto_61544 ) ( not ( = ?auto_61537 ?auto_61546 ) ) ( OBJ-AT ?auto_61538 ?auto_61546 ) ( IN-CITY ?auto_61542 ?auto_61544 ) ( not ( = ?auto_61537 ?auto_61542 ) ) ( OBJ-AT ?auto_61541 ?auto_61542 ) ( IN-CITY ?auto_61545 ?auto_61544 ) ( not ( = ?auto_61537 ?auto_61545 ) ) ( OBJ-AT ?auto_61539 ?auto_61545 ) ( IN-CITY ?auto_61547 ?auto_61544 ) ( not ( = ?auto_61537 ?auto_61547 ) ) ( OBJ-AT ?auto_61540 ?auto_61547 ) ( TRUCK-AT ?auto_61543 ?auto_61537 ) ( not ( = ?auto_61540 ?auto_61539 ) ) ( not ( = ?auto_61545 ?auto_61547 ) ) ( not ( = ?auto_61540 ?auto_61541 ) ) ( not ( = ?auto_61539 ?auto_61541 ) ) ( not ( = ?auto_61542 ?auto_61545 ) ) ( not ( = ?auto_61542 ?auto_61547 ) ) ( not ( = ?auto_61540 ?auto_61538 ) ) ( not ( = ?auto_61539 ?auto_61538 ) ) ( not ( = ?auto_61541 ?auto_61538 ) ) ( not ( = ?auto_61546 ?auto_61542 ) ) ( not ( = ?auto_61546 ?auto_61545 ) ) ( not ( = ?auto_61546 ?auto_61547 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61540 ?auto_61539 ?auto_61538 ?auto_61541 ?auto_61537 )
      ( DELIVER-4PKG-VERIFY ?auto_61538 ?auto_61539 ?auto_61540 ?auto_61541 ?auto_61537 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61611 - OBJ
      ?auto_61612 - OBJ
      ?auto_61613 - OBJ
      ?auto_61614 - OBJ
      ?auto_61610 - LOCATION
    )
    :vars
    (
      ?auto_61619 - LOCATION
      ?auto_61617 - CITY
      ?auto_61615 - LOCATION
      ?auto_61618 - LOCATION
      ?auto_61620 - LOCATION
      ?auto_61616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61619 ?auto_61617 ) ( IN-CITY ?auto_61610 ?auto_61617 ) ( not ( = ?auto_61610 ?auto_61619 ) ) ( OBJ-AT ?auto_61611 ?auto_61619 ) ( IN-CITY ?auto_61615 ?auto_61617 ) ( not ( = ?auto_61610 ?auto_61615 ) ) ( OBJ-AT ?auto_61613 ?auto_61615 ) ( IN-CITY ?auto_61618 ?auto_61617 ) ( not ( = ?auto_61610 ?auto_61618 ) ) ( OBJ-AT ?auto_61612 ?auto_61618 ) ( IN-CITY ?auto_61620 ?auto_61617 ) ( not ( = ?auto_61610 ?auto_61620 ) ) ( OBJ-AT ?auto_61614 ?auto_61620 ) ( TRUCK-AT ?auto_61616 ?auto_61610 ) ( not ( = ?auto_61614 ?auto_61612 ) ) ( not ( = ?auto_61618 ?auto_61620 ) ) ( not ( = ?auto_61614 ?auto_61613 ) ) ( not ( = ?auto_61612 ?auto_61613 ) ) ( not ( = ?auto_61615 ?auto_61618 ) ) ( not ( = ?auto_61615 ?auto_61620 ) ) ( not ( = ?auto_61614 ?auto_61611 ) ) ( not ( = ?auto_61612 ?auto_61611 ) ) ( not ( = ?auto_61613 ?auto_61611 ) ) ( not ( = ?auto_61619 ?auto_61615 ) ) ( not ( = ?auto_61619 ?auto_61618 ) ) ( not ( = ?auto_61619 ?auto_61620 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61614 ?auto_61612 ?auto_61611 ?auto_61613 ?auto_61610 )
      ( DELIVER-4PKG-VERIFY ?auto_61611 ?auto_61612 ?auto_61613 ?auto_61614 ?auto_61610 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61720 - OBJ
      ?auto_61721 - OBJ
      ?auto_61722 - OBJ
      ?auto_61723 - OBJ
      ?auto_61719 - LOCATION
    )
    :vars
    (
      ?auto_61728 - LOCATION
      ?auto_61726 - CITY
      ?auto_61724 - LOCATION
      ?auto_61727 - LOCATION
      ?auto_61729 - LOCATION
      ?auto_61725 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61728 ?auto_61726 ) ( IN-CITY ?auto_61719 ?auto_61726 ) ( not ( = ?auto_61719 ?auto_61728 ) ) ( OBJ-AT ?auto_61720 ?auto_61728 ) ( IN-CITY ?auto_61724 ?auto_61726 ) ( not ( = ?auto_61719 ?auto_61724 ) ) ( OBJ-AT ?auto_61721 ?auto_61724 ) ( IN-CITY ?auto_61727 ?auto_61726 ) ( not ( = ?auto_61719 ?auto_61727 ) ) ( OBJ-AT ?auto_61723 ?auto_61727 ) ( IN-CITY ?auto_61729 ?auto_61726 ) ( not ( = ?auto_61719 ?auto_61729 ) ) ( OBJ-AT ?auto_61722 ?auto_61729 ) ( TRUCK-AT ?auto_61725 ?auto_61719 ) ( not ( = ?auto_61722 ?auto_61723 ) ) ( not ( = ?auto_61727 ?auto_61729 ) ) ( not ( = ?auto_61722 ?auto_61721 ) ) ( not ( = ?auto_61723 ?auto_61721 ) ) ( not ( = ?auto_61724 ?auto_61727 ) ) ( not ( = ?auto_61724 ?auto_61729 ) ) ( not ( = ?auto_61722 ?auto_61720 ) ) ( not ( = ?auto_61723 ?auto_61720 ) ) ( not ( = ?auto_61721 ?auto_61720 ) ) ( not ( = ?auto_61728 ?auto_61724 ) ) ( not ( = ?auto_61728 ?auto_61727 ) ) ( not ( = ?auto_61728 ?auto_61729 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61722 ?auto_61723 ?auto_61720 ?auto_61721 ?auto_61719 )
      ( DELIVER-4PKG-VERIFY ?auto_61720 ?auto_61721 ?auto_61722 ?auto_61723 ?auto_61719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61755 - OBJ
      ?auto_61756 - OBJ
      ?auto_61757 - OBJ
      ?auto_61758 - OBJ
      ?auto_61754 - LOCATION
    )
    :vars
    (
      ?auto_61763 - LOCATION
      ?auto_61761 - CITY
      ?auto_61759 - LOCATION
      ?auto_61762 - LOCATION
      ?auto_61764 - LOCATION
      ?auto_61760 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61763 ?auto_61761 ) ( IN-CITY ?auto_61754 ?auto_61761 ) ( not ( = ?auto_61754 ?auto_61763 ) ) ( OBJ-AT ?auto_61755 ?auto_61763 ) ( IN-CITY ?auto_61759 ?auto_61761 ) ( not ( = ?auto_61754 ?auto_61759 ) ) ( OBJ-AT ?auto_61756 ?auto_61759 ) ( IN-CITY ?auto_61762 ?auto_61761 ) ( not ( = ?auto_61754 ?auto_61762 ) ) ( OBJ-AT ?auto_61757 ?auto_61762 ) ( IN-CITY ?auto_61764 ?auto_61761 ) ( not ( = ?auto_61754 ?auto_61764 ) ) ( OBJ-AT ?auto_61758 ?auto_61764 ) ( TRUCK-AT ?auto_61760 ?auto_61754 ) ( not ( = ?auto_61758 ?auto_61757 ) ) ( not ( = ?auto_61762 ?auto_61764 ) ) ( not ( = ?auto_61758 ?auto_61756 ) ) ( not ( = ?auto_61757 ?auto_61756 ) ) ( not ( = ?auto_61759 ?auto_61762 ) ) ( not ( = ?auto_61759 ?auto_61764 ) ) ( not ( = ?auto_61758 ?auto_61755 ) ) ( not ( = ?auto_61757 ?auto_61755 ) ) ( not ( = ?auto_61756 ?auto_61755 ) ) ( not ( = ?auto_61763 ?auto_61759 ) ) ( not ( = ?auto_61763 ?auto_61762 ) ) ( not ( = ?auto_61763 ?auto_61764 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61758 ?auto_61757 ?auto_61755 ?auto_61756 ?auto_61754 )
      ( DELIVER-4PKG-VERIFY ?auto_61755 ?auto_61756 ?auto_61757 ?auto_61758 ?auto_61754 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_62107 - OBJ
      ?auto_62106 - LOCATION
    )
    :vars
    (
      ?auto_62109 - LOCATION
      ?auto_62110 - CITY
      ?auto_62108 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62109 ?auto_62110 ) ( IN-CITY ?auto_62106 ?auto_62110 ) ( not ( = ?auto_62106 ?auto_62109 ) ) ( OBJ-AT ?auto_62107 ?auto_62109 ) ( TRUCK-AT ?auto_62108 ?auto_62106 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_62108 ?auto_62106 ?auto_62109 ?auto_62110 )
      ( !LOAD-TRUCK ?auto_62107 ?auto_62108 ?auto_62109 )
      ( !DRIVE-TRUCK ?auto_62108 ?auto_62109 ?auto_62106 ?auto_62110 )
      ( !UNLOAD-TRUCK ?auto_62107 ?auto_62108 ?auto_62106 )
      ( DELIVER-1PKG-VERIFY ?auto_62107 ?auto_62106 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75926 - OBJ
      ?auto_75927 - OBJ
      ?auto_75928 - OBJ
      ?auto_75929 - OBJ
      ?auto_75930 - OBJ
      ?auto_75925 - LOCATION
    )
    :vars
    (
      ?auto_75931 - LOCATION
      ?auto_75933 - CITY
      ?auto_75936 - LOCATION
      ?auto_75934 - LOCATION
      ?auto_75935 - LOCATION
      ?auto_75937 - LOCATION
      ?auto_75932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75931 ?auto_75933 ) ( IN-CITY ?auto_75925 ?auto_75933 ) ( not ( = ?auto_75925 ?auto_75931 ) ) ( OBJ-AT ?auto_75930 ?auto_75931 ) ( IN-CITY ?auto_75936 ?auto_75933 ) ( not ( = ?auto_75925 ?auto_75936 ) ) ( OBJ-AT ?auto_75929 ?auto_75936 ) ( IN-CITY ?auto_75934 ?auto_75933 ) ( not ( = ?auto_75925 ?auto_75934 ) ) ( OBJ-AT ?auto_75928 ?auto_75934 ) ( IN-CITY ?auto_75935 ?auto_75933 ) ( not ( = ?auto_75925 ?auto_75935 ) ) ( OBJ-AT ?auto_75927 ?auto_75935 ) ( IN-CITY ?auto_75937 ?auto_75933 ) ( not ( = ?auto_75925 ?auto_75937 ) ) ( OBJ-AT ?auto_75926 ?auto_75937 ) ( TRUCK-AT ?auto_75932 ?auto_75925 ) ( not ( = ?auto_75926 ?auto_75927 ) ) ( not ( = ?auto_75935 ?auto_75937 ) ) ( not ( = ?auto_75926 ?auto_75928 ) ) ( not ( = ?auto_75927 ?auto_75928 ) ) ( not ( = ?auto_75934 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75937 ) ) ( not ( = ?auto_75926 ?auto_75929 ) ) ( not ( = ?auto_75927 ?auto_75929 ) ) ( not ( = ?auto_75928 ?auto_75929 ) ) ( not ( = ?auto_75936 ?auto_75934 ) ) ( not ( = ?auto_75936 ?auto_75935 ) ) ( not ( = ?auto_75936 ?auto_75937 ) ) ( not ( = ?auto_75926 ?auto_75930 ) ) ( not ( = ?auto_75927 ?auto_75930 ) ) ( not ( = ?auto_75928 ?auto_75930 ) ) ( not ( = ?auto_75929 ?auto_75930 ) ) ( not ( = ?auto_75931 ?auto_75936 ) ) ( not ( = ?auto_75931 ?auto_75934 ) ) ( not ( = ?auto_75931 ?auto_75935 ) ) ( not ( = ?auto_75931 ?auto_75937 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_75926 ?auto_75927 ?auto_75929 ?auto_75928 ?auto_75925 )
      ( DELIVER-1PKG ?auto_75930 ?auto_75925 )
      ( DELIVER-5PKG-VERIFY ?auto_75926 ?auto_75927 ?auto_75928 ?auto_75929 ?auto_75930 ?auto_75925 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_75981 - OBJ
      ?auto_75982 - OBJ
      ?auto_75983 - OBJ
      ?auto_75984 - OBJ
      ?auto_75985 - OBJ
      ?auto_75980 - LOCATION
    )
    :vars
    (
      ?auto_75992 - LOCATION
      ?auto_75986 - CITY
      ?auto_75990 - LOCATION
      ?auto_75989 - LOCATION
      ?auto_75987 - LOCATION
      ?auto_75988 - LOCATION
      ?auto_75991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_75992 ?auto_75986 ) ( IN-CITY ?auto_75980 ?auto_75986 ) ( not ( = ?auto_75980 ?auto_75992 ) ) ( OBJ-AT ?auto_75984 ?auto_75992 ) ( IN-CITY ?auto_75990 ?auto_75986 ) ( not ( = ?auto_75980 ?auto_75990 ) ) ( OBJ-AT ?auto_75985 ?auto_75990 ) ( IN-CITY ?auto_75989 ?auto_75986 ) ( not ( = ?auto_75980 ?auto_75989 ) ) ( OBJ-AT ?auto_75983 ?auto_75989 ) ( IN-CITY ?auto_75987 ?auto_75986 ) ( not ( = ?auto_75980 ?auto_75987 ) ) ( OBJ-AT ?auto_75982 ?auto_75987 ) ( IN-CITY ?auto_75988 ?auto_75986 ) ( not ( = ?auto_75980 ?auto_75988 ) ) ( OBJ-AT ?auto_75981 ?auto_75988 ) ( TRUCK-AT ?auto_75991 ?auto_75980 ) ( not ( = ?auto_75981 ?auto_75982 ) ) ( not ( = ?auto_75987 ?auto_75988 ) ) ( not ( = ?auto_75981 ?auto_75983 ) ) ( not ( = ?auto_75982 ?auto_75983 ) ) ( not ( = ?auto_75989 ?auto_75987 ) ) ( not ( = ?auto_75989 ?auto_75988 ) ) ( not ( = ?auto_75981 ?auto_75985 ) ) ( not ( = ?auto_75982 ?auto_75985 ) ) ( not ( = ?auto_75983 ?auto_75985 ) ) ( not ( = ?auto_75990 ?auto_75989 ) ) ( not ( = ?auto_75990 ?auto_75987 ) ) ( not ( = ?auto_75990 ?auto_75988 ) ) ( not ( = ?auto_75981 ?auto_75984 ) ) ( not ( = ?auto_75982 ?auto_75984 ) ) ( not ( = ?auto_75983 ?auto_75984 ) ) ( not ( = ?auto_75985 ?auto_75984 ) ) ( not ( = ?auto_75992 ?auto_75990 ) ) ( not ( = ?auto_75992 ?auto_75989 ) ) ( not ( = ?auto_75992 ?auto_75987 ) ) ( not ( = ?auto_75992 ?auto_75988 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_75981 ?auto_75982 ?auto_75983 ?auto_75985 ?auto_75984 ?auto_75980 )
      ( DELIVER-5PKG-VERIFY ?auto_75981 ?auto_75982 ?auto_75983 ?auto_75984 ?auto_75985 ?auto_75980 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76036 - OBJ
      ?auto_76037 - OBJ
      ?auto_76038 - OBJ
      ?auto_76039 - OBJ
      ?auto_76040 - OBJ
      ?auto_76035 - LOCATION
    )
    :vars
    (
      ?auto_76045 - LOCATION
      ?auto_76047 - CITY
      ?auto_76044 - LOCATION
      ?auto_76041 - LOCATION
      ?auto_76042 - LOCATION
      ?auto_76043 - LOCATION
      ?auto_76046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76045 ?auto_76047 ) ( IN-CITY ?auto_76035 ?auto_76047 ) ( not ( = ?auto_76035 ?auto_76045 ) ) ( OBJ-AT ?auto_76040 ?auto_76045 ) ( IN-CITY ?auto_76044 ?auto_76047 ) ( not ( = ?auto_76035 ?auto_76044 ) ) ( OBJ-AT ?auto_76038 ?auto_76044 ) ( IN-CITY ?auto_76041 ?auto_76047 ) ( not ( = ?auto_76035 ?auto_76041 ) ) ( OBJ-AT ?auto_76039 ?auto_76041 ) ( IN-CITY ?auto_76042 ?auto_76047 ) ( not ( = ?auto_76035 ?auto_76042 ) ) ( OBJ-AT ?auto_76037 ?auto_76042 ) ( IN-CITY ?auto_76043 ?auto_76047 ) ( not ( = ?auto_76035 ?auto_76043 ) ) ( OBJ-AT ?auto_76036 ?auto_76043 ) ( TRUCK-AT ?auto_76046 ?auto_76035 ) ( not ( = ?auto_76036 ?auto_76037 ) ) ( not ( = ?auto_76042 ?auto_76043 ) ) ( not ( = ?auto_76036 ?auto_76039 ) ) ( not ( = ?auto_76037 ?auto_76039 ) ) ( not ( = ?auto_76041 ?auto_76042 ) ) ( not ( = ?auto_76041 ?auto_76043 ) ) ( not ( = ?auto_76036 ?auto_76038 ) ) ( not ( = ?auto_76037 ?auto_76038 ) ) ( not ( = ?auto_76039 ?auto_76038 ) ) ( not ( = ?auto_76044 ?auto_76041 ) ) ( not ( = ?auto_76044 ?auto_76042 ) ) ( not ( = ?auto_76044 ?auto_76043 ) ) ( not ( = ?auto_76036 ?auto_76040 ) ) ( not ( = ?auto_76037 ?auto_76040 ) ) ( not ( = ?auto_76039 ?auto_76040 ) ) ( not ( = ?auto_76038 ?auto_76040 ) ) ( not ( = ?auto_76045 ?auto_76044 ) ) ( not ( = ?auto_76045 ?auto_76041 ) ) ( not ( = ?auto_76045 ?auto_76042 ) ) ( not ( = ?auto_76045 ?auto_76043 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76036 ?auto_76037 ?auto_76039 ?auto_76040 ?auto_76038 ?auto_76035 )
      ( DELIVER-5PKG-VERIFY ?auto_76036 ?auto_76037 ?auto_76038 ?auto_76039 ?auto_76040 ?auto_76035 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76091 - OBJ
      ?auto_76092 - OBJ
      ?auto_76093 - OBJ
      ?auto_76094 - OBJ
      ?auto_76095 - OBJ
      ?auto_76090 - LOCATION
    )
    :vars
    (
      ?auto_76100 - LOCATION
      ?auto_76102 - CITY
      ?auto_76099 - LOCATION
      ?auto_76096 - LOCATION
      ?auto_76097 - LOCATION
      ?auto_76098 - LOCATION
      ?auto_76101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76100 ?auto_76102 ) ( IN-CITY ?auto_76090 ?auto_76102 ) ( not ( = ?auto_76090 ?auto_76100 ) ) ( OBJ-AT ?auto_76094 ?auto_76100 ) ( IN-CITY ?auto_76099 ?auto_76102 ) ( not ( = ?auto_76090 ?auto_76099 ) ) ( OBJ-AT ?auto_76093 ?auto_76099 ) ( IN-CITY ?auto_76096 ?auto_76102 ) ( not ( = ?auto_76090 ?auto_76096 ) ) ( OBJ-AT ?auto_76095 ?auto_76096 ) ( IN-CITY ?auto_76097 ?auto_76102 ) ( not ( = ?auto_76090 ?auto_76097 ) ) ( OBJ-AT ?auto_76092 ?auto_76097 ) ( IN-CITY ?auto_76098 ?auto_76102 ) ( not ( = ?auto_76090 ?auto_76098 ) ) ( OBJ-AT ?auto_76091 ?auto_76098 ) ( TRUCK-AT ?auto_76101 ?auto_76090 ) ( not ( = ?auto_76091 ?auto_76092 ) ) ( not ( = ?auto_76097 ?auto_76098 ) ) ( not ( = ?auto_76091 ?auto_76095 ) ) ( not ( = ?auto_76092 ?auto_76095 ) ) ( not ( = ?auto_76096 ?auto_76097 ) ) ( not ( = ?auto_76096 ?auto_76098 ) ) ( not ( = ?auto_76091 ?auto_76093 ) ) ( not ( = ?auto_76092 ?auto_76093 ) ) ( not ( = ?auto_76095 ?auto_76093 ) ) ( not ( = ?auto_76099 ?auto_76096 ) ) ( not ( = ?auto_76099 ?auto_76097 ) ) ( not ( = ?auto_76099 ?auto_76098 ) ) ( not ( = ?auto_76091 ?auto_76094 ) ) ( not ( = ?auto_76092 ?auto_76094 ) ) ( not ( = ?auto_76095 ?auto_76094 ) ) ( not ( = ?auto_76093 ?auto_76094 ) ) ( not ( = ?auto_76100 ?auto_76099 ) ) ( not ( = ?auto_76100 ?auto_76096 ) ) ( not ( = ?auto_76100 ?auto_76097 ) ) ( not ( = ?auto_76100 ?auto_76098 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76091 ?auto_76092 ?auto_76095 ?auto_76094 ?auto_76093 ?auto_76090 )
      ( DELIVER-5PKG-VERIFY ?auto_76091 ?auto_76092 ?auto_76093 ?auto_76094 ?auto_76095 ?auto_76090 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76320 - OBJ
      ?auto_76321 - OBJ
      ?auto_76322 - OBJ
      ?auto_76323 - OBJ
      ?auto_76324 - OBJ
      ?auto_76319 - LOCATION
    )
    :vars
    (
      ?auto_76329 - LOCATION
      ?auto_76331 - CITY
      ?auto_76328 - LOCATION
      ?auto_76325 - LOCATION
      ?auto_76326 - LOCATION
      ?auto_76327 - LOCATION
      ?auto_76330 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76329 ?auto_76331 ) ( IN-CITY ?auto_76319 ?auto_76331 ) ( not ( = ?auto_76319 ?auto_76329 ) ) ( OBJ-AT ?auto_76322 ?auto_76329 ) ( IN-CITY ?auto_76328 ?auto_76331 ) ( not ( = ?auto_76319 ?auto_76328 ) ) ( OBJ-AT ?auto_76324 ?auto_76328 ) ( IN-CITY ?auto_76325 ?auto_76331 ) ( not ( = ?auto_76319 ?auto_76325 ) ) ( OBJ-AT ?auto_76323 ?auto_76325 ) ( IN-CITY ?auto_76326 ?auto_76331 ) ( not ( = ?auto_76319 ?auto_76326 ) ) ( OBJ-AT ?auto_76321 ?auto_76326 ) ( IN-CITY ?auto_76327 ?auto_76331 ) ( not ( = ?auto_76319 ?auto_76327 ) ) ( OBJ-AT ?auto_76320 ?auto_76327 ) ( TRUCK-AT ?auto_76330 ?auto_76319 ) ( not ( = ?auto_76320 ?auto_76321 ) ) ( not ( = ?auto_76326 ?auto_76327 ) ) ( not ( = ?auto_76320 ?auto_76323 ) ) ( not ( = ?auto_76321 ?auto_76323 ) ) ( not ( = ?auto_76325 ?auto_76326 ) ) ( not ( = ?auto_76325 ?auto_76327 ) ) ( not ( = ?auto_76320 ?auto_76324 ) ) ( not ( = ?auto_76321 ?auto_76324 ) ) ( not ( = ?auto_76323 ?auto_76324 ) ) ( not ( = ?auto_76328 ?auto_76325 ) ) ( not ( = ?auto_76328 ?auto_76326 ) ) ( not ( = ?auto_76328 ?auto_76327 ) ) ( not ( = ?auto_76320 ?auto_76322 ) ) ( not ( = ?auto_76321 ?auto_76322 ) ) ( not ( = ?auto_76323 ?auto_76322 ) ) ( not ( = ?auto_76324 ?auto_76322 ) ) ( not ( = ?auto_76329 ?auto_76328 ) ) ( not ( = ?auto_76329 ?auto_76325 ) ) ( not ( = ?auto_76329 ?auto_76326 ) ) ( not ( = ?auto_76329 ?auto_76327 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76320 ?auto_76321 ?auto_76323 ?auto_76322 ?auto_76324 ?auto_76319 )
      ( DELIVER-5PKG-VERIFY ?auto_76320 ?auto_76321 ?auto_76322 ?auto_76323 ?auto_76324 ?auto_76319 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76375 - OBJ
      ?auto_76376 - OBJ
      ?auto_76377 - OBJ
      ?auto_76378 - OBJ
      ?auto_76379 - OBJ
      ?auto_76374 - LOCATION
    )
    :vars
    (
      ?auto_76384 - LOCATION
      ?auto_76386 - CITY
      ?auto_76383 - LOCATION
      ?auto_76380 - LOCATION
      ?auto_76381 - LOCATION
      ?auto_76382 - LOCATION
      ?auto_76385 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76384 ?auto_76386 ) ( IN-CITY ?auto_76374 ?auto_76386 ) ( not ( = ?auto_76374 ?auto_76384 ) ) ( OBJ-AT ?auto_76377 ?auto_76384 ) ( IN-CITY ?auto_76383 ?auto_76386 ) ( not ( = ?auto_76374 ?auto_76383 ) ) ( OBJ-AT ?auto_76378 ?auto_76383 ) ( IN-CITY ?auto_76380 ?auto_76386 ) ( not ( = ?auto_76374 ?auto_76380 ) ) ( OBJ-AT ?auto_76379 ?auto_76380 ) ( IN-CITY ?auto_76381 ?auto_76386 ) ( not ( = ?auto_76374 ?auto_76381 ) ) ( OBJ-AT ?auto_76376 ?auto_76381 ) ( IN-CITY ?auto_76382 ?auto_76386 ) ( not ( = ?auto_76374 ?auto_76382 ) ) ( OBJ-AT ?auto_76375 ?auto_76382 ) ( TRUCK-AT ?auto_76385 ?auto_76374 ) ( not ( = ?auto_76375 ?auto_76376 ) ) ( not ( = ?auto_76381 ?auto_76382 ) ) ( not ( = ?auto_76375 ?auto_76379 ) ) ( not ( = ?auto_76376 ?auto_76379 ) ) ( not ( = ?auto_76380 ?auto_76381 ) ) ( not ( = ?auto_76380 ?auto_76382 ) ) ( not ( = ?auto_76375 ?auto_76378 ) ) ( not ( = ?auto_76376 ?auto_76378 ) ) ( not ( = ?auto_76379 ?auto_76378 ) ) ( not ( = ?auto_76383 ?auto_76380 ) ) ( not ( = ?auto_76383 ?auto_76381 ) ) ( not ( = ?auto_76383 ?auto_76382 ) ) ( not ( = ?auto_76375 ?auto_76377 ) ) ( not ( = ?auto_76376 ?auto_76377 ) ) ( not ( = ?auto_76379 ?auto_76377 ) ) ( not ( = ?auto_76378 ?auto_76377 ) ) ( not ( = ?auto_76384 ?auto_76383 ) ) ( not ( = ?auto_76384 ?auto_76380 ) ) ( not ( = ?auto_76384 ?auto_76381 ) ) ( not ( = ?auto_76384 ?auto_76382 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76375 ?auto_76376 ?auto_76379 ?auto_76377 ?auto_76378 ?auto_76374 )
      ( DELIVER-5PKG-VERIFY ?auto_76375 ?auto_76376 ?auto_76377 ?auto_76378 ?auto_76379 ?auto_76374 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76662 - OBJ
      ?auto_76663 - OBJ
      ?auto_76664 - OBJ
      ?auto_76665 - OBJ
      ?auto_76666 - OBJ
      ?auto_76661 - LOCATION
    )
    :vars
    (
      ?auto_76671 - LOCATION
      ?auto_76673 - CITY
      ?auto_76670 - LOCATION
      ?auto_76667 - LOCATION
      ?auto_76668 - LOCATION
      ?auto_76669 - LOCATION
      ?auto_76672 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76671 ?auto_76673 ) ( IN-CITY ?auto_76661 ?auto_76673 ) ( not ( = ?auto_76661 ?auto_76671 ) ) ( OBJ-AT ?auto_76666 ?auto_76671 ) ( IN-CITY ?auto_76670 ?auto_76673 ) ( not ( = ?auto_76661 ?auto_76670 ) ) ( OBJ-AT ?auto_76665 ?auto_76670 ) ( IN-CITY ?auto_76667 ?auto_76673 ) ( not ( = ?auto_76661 ?auto_76667 ) ) ( OBJ-AT ?auto_76663 ?auto_76667 ) ( IN-CITY ?auto_76668 ?auto_76673 ) ( not ( = ?auto_76661 ?auto_76668 ) ) ( OBJ-AT ?auto_76664 ?auto_76668 ) ( IN-CITY ?auto_76669 ?auto_76673 ) ( not ( = ?auto_76661 ?auto_76669 ) ) ( OBJ-AT ?auto_76662 ?auto_76669 ) ( TRUCK-AT ?auto_76672 ?auto_76661 ) ( not ( = ?auto_76662 ?auto_76664 ) ) ( not ( = ?auto_76668 ?auto_76669 ) ) ( not ( = ?auto_76662 ?auto_76663 ) ) ( not ( = ?auto_76664 ?auto_76663 ) ) ( not ( = ?auto_76667 ?auto_76668 ) ) ( not ( = ?auto_76667 ?auto_76669 ) ) ( not ( = ?auto_76662 ?auto_76665 ) ) ( not ( = ?auto_76664 ?auto_76665 ) ) ( not ( = ?auto_76663 ?auto_76665 ) ) ( not ( = ?auto_76670 ?auto_76667 ) ) ( not ( = ?auto_76670 ?auto_76668 ) ) ( not ( = ?auto_76670 ?auto_76669 ) ) ( not ( = ?auto_76662 ?auto_76666 ) ) ( not ( = ?auto_76664 ?auto_76666 ) ) ( not ( = ?auto_76663 ?auto_76666 ) ) ( not ( = ?auto_76665 ?auto_76666 ) ) ( not ( = ?auto_76671 ?auto_76670 ) ) ( not ( = ?auto_76671 ?auto_76667 ) ) ( not ( = ?auto_76671 ?auto_76668 ) ) ( not ( = ?auto_76671 ?auto_76669 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76662 ?auto_76664 ?auto_76663 ?auto_76666 ?auto_76665 ?auto_76661 )
      ( DELIVER-5PKG-VERIFY ?auto_76662 ?auto_76663 ?auto_76664 ?auto_76665 ?auto_76666 ?auto_76661 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76717 - OBJ
      ?auto_76718 - OBJ
      ?auto_76719 - OBJ
      ?auto_76720 - OBJ
      ?auto_76721 - OBJ
      ?auto_76716 - LOCATION
    )
    :vars
    (
      ?auto_76726 - LOCATION
      ?auto_76728 - CITY
      ?auto_76725 - LOCATION
      ?auto_76722 - LOCATION
      ?auto_76723 - LOCATION
      ?auto_76724 - LOCATION
      ?auto_76727 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76726 ?auto_76728 ) ( IN-CITY ?auto_76716 ?auto_76728 ) ( not ( = ?auto_76716 ?auto_76726 ) ) ( OBJ-AT ?auto_76720 ?auto_76726 ) ( IN-CITY ?auto_76725 ?auto_76728 ) ( not ( = ?auto_76716 ?auto_76725 ) ) ( OBJ-AT ?auto_76721 ?auto_76725 ) ( IN-CITY ?auto_76722 ?auto_76728 ) ( not ( = ?auto_76716 ?auto_76722 ) ) ( OBJ-AT ?auto_76718 ?auto_76722 ) ( IN-CITY ?auto_76723 ?auto_76728 ) ( not ( = ?auto_76716 ?auto_76723 ) ) ( OBJ-AT ?auto_76719 ?auto_76723 ) ( IN-CITY ?auto_76724 ?auto_76728 ) ( not ( = ?auto_76716 ?auto_76724 ) ) ( OBJ-AT ?auto_76717 ?auto_76724 ) ( TRUCK-AT ?auto_76727 ?auto_76716 ) ( not ( = ?auto_76717 ?auto_76719 ) ) ( not ( = ?auto_76723 ?auto_76724 ) ) ( not ( = ?auto_76717 ?auto_76718 ) ) ( not ( = ?auto_76719 ?auto_76718 ) ) ( not ( = ?auto_76722 ?auto_76723 ) ) ( not ( = ?auto_76722 ?auto_76724 ) ) ( not ( = ?auto_76717 ?auto_76721 ) ) ( not ( = ?auto_76719 ?auto_76721 ) ) ( not ( = ?auto_76718 ?auto_76721 ) ) ( not ( = ?auto_76725 ?auto_76722 ) ) ( not ( = ?auto_76725 ?auto_76723 ) ) ( not ( = ?auto_76725 ?auto_76724 ) ) ( not ( = ?auto_76717 ?auto_76720 ) ) ( not ( = ?auto_76719 ?auto_76720 ) ) ( not ( = ?auto_76718 ?auto_76720 ) ) ( not ( = ?auto_76721 ?auto_76720 ) ) ( not ( = ?auto_76726 ?auto_76725 ) ) ( not ( = ?auto_76726 ?auto_76722 ) ) ( not ( = ?auto_76726 ?auto_76723 ) ) ( not ( = ?auto_76726 ?auto_76724 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76717 ?auto_76719 ?auto_76718 ?auto_76720 ?auto_76721 ?auto_76716 )
      ( DELIVER-5PKG-VERIFY ?auto_76717 ?auto_76718 ?auto_76719 ?auto_76720 ?auto_76721 ?auto_76716 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76889 - OBJ
      ?auto_76890 - OBJ
      ?auto_76891 - OBJ
      ?auto_76892 - OBJ
      ?auto_76893 - OBJ
      ?auto_76888 - LOCATION
    )
    :vars
    (
      ?auto_76898 - LOCATION
      ?auto_76900 - CITY
      ?auto_76897 - LOCATION
      ?auto_76894 - LOCATION
      ?auto_76895 - LOCATION
      ?auto_76896 - LOCATION
      ?auto_76899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76898 ?auto_76900 ) ( IN-CITY ?auto_76888 ?auto_76900 ) ( not ( = ?auto_76888 ?auto_76898 ) ) ( OBJ-AT ?auto_76893 ?auto_76898 ) ( IN-CITY ?auto_76897 ?auto_76900 ) ( not ( = ?auto_76888 ?auto_76897 ) ) ( OBJ-AT ?auto_76891 ?auto_76897 ) ( IN-CITY ?auto_76894 ?auto_76900 ) ( not ( = ?auto_76888 ?auto_76894 ) ) ( OBJ-AT ?auto_76890 ?auto_76894 ) ( IN-CITY ?auto_76895 ?auto_76900 ) ( not ( = ?auto_76888 ?auto_76895 ) ) ( OBJ-AT ?auto_76892 ?auto_76895 ) ( IN-CITY ?auto_76896 ?auto_76900 ) ( not ( = ?auto_76888 ?auto_76896 ) ) ( OBJ-AT ?auto_76889 ?auto_76896 ) ( TRUCK-AT ?auto_76899 ?auto_76888 ) ( not ( = ?auto_76889 ?auto_76892 ) ) ( not ( = ?auto_76895 ?auto_76896 ) ) ( not ( = ?auto_76889 ?auto_76890 ) ) ( not ( = ?auto_76892 ?auto_76890 ) ) ( not ( = ?auto_76894 ?auto_76895 ) ) ( not ( = ?auto_76894 ?auto_76896 ) ) ( not ( = ?auto_76889 ?auto_76891 ) ) ( not ( = ?auto_76892 ?auto_76891 ) ) ( not ( = ?auto_76890 ?auto_76891 ) ) ( not ( = ?auto_76897 ?auto_76894 ) ) ( not ( = ?auto_76897 ?auto_76895 ) ) ( not ( = ?auto_76897 ?auto_76896 ) ) ( not ( = ?auto_76889 ?auto_76893 ) ) ( not ( = ?auto_76892 ?auto_76893 ) ) ( not ( = ?auto_76890 ?auto_76893 ) ) ( not ( = ?auto_76891 ?auto_76893 ) ) ( not ( = ?auto_76898 ?auto_76897 ) ) ( not ( = ?auto_76898 ?auto_76894 ) ) ( not ( = ?auto_76898 ?auto_76895 ) ) ( not ( = ?auto_76898 ?auto_76896 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76889 ?auto_76892 ?auto_76890 ?auto_76893 ?auto_76891 ?auto_76888 )
      ( DELIVER-5PKG-VERIFY ?auto_76889 ?auto_76890 ?auto_76891 ?auto_76892 ?auto_76893 ?auto_76888 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76944 - OBJ
      ?auto_76945 - OBJ
      ?auto_76946 - OBJ
      ?auto_76947 - OBJ
      ?auto_76948 - OBJ
      ?auto_76943 - LOCATION
    )
    :vars
    (
      ?auto_76953 - LOCATION
      ?auto_76955 - CITY
      ?auto_76952 - LOCATION
      ?auto_76949 - LOCATION
      ?auto_76950 - LOCATION
      ?auto_76951 - LOCATION
      ?auto_76954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76953 ?auto_76955 ) ( IN-CITY ?auto_76943 ?auto_76955 ) ( not ( = ?auto_76943 ?auto_76953 ) ) ( OBJ-AT ?auto_76947 ?auto_76953 ) ( IN-CITY ?auto_76952 ?auto_76955 ) ( not ( = ?auto_76943 ?auto_76952 ) ) ( OBJ-AT ?auto_76946 ?auto_76952 ) ( IN-CITY ?auto_76949 ?auto_76955 ) ( not ( = ?auto_76943 ?auto_76949 ) ) ( OBJ-AT ?auto_76945 ?auto_76949 ) ( IN-CITY ?auto_76950 ?auto_76955 ) ( not ( = ?auto_76943 ?auto_76950 ) ) ( OBJ-AT ?auto_76948 ?auto_76950 ) ( IN-CITY ?auto_76951 ?auto_76955 ) ( not ( = ?auto_76943 ?auto_76951 ) ) ( OBJ-AT ?auto_76944 ?auto_76951 ) ( TRUCK-AT ?auto_76954 ?auto_76943 ) ( not ( = ?auto_76944 ?auto_76948 ) ) ( not ( = ?auto_76950 ?auto_76951 ) ) ( not ( = ?auto_76944 ?auto_76945 ) ) ( not ( = ?auto_76948 ?auto_76945 ) ) ( not ( = ?auto_76949 ?auto_76950 ) ) ( not ( = ?auto_76949 ?auto_76951 ) ) ( not ( = ?auto_76944 ?auto_76946 ) ) ( not ( = ?auto_76948 ?auto_76946 ) ) ( not ( = ?auto_76945 ?auto_76946 ) ) ( not ( = ?auto_76952 ?auto_76949 ) ) ( not ( = ?auto_76952 ?auto_76950 ) ) ( not ( = ?auto_76952 ?auto_76951 ) ) ( not ( = ?auto_76944 ?auto_76947 ) ) ( not ( = ?auto_76948 ?auto_76947 ) ) ( not ( = ?auto_76945 ?auto_76947 ) ) ( not ( = ?auto_76946 ?auto_76947 ) ) ( not ( = ?auto_76953 ?auto_76952 ) ) ( not ( = ?auto_76953 ?auto_76949 ) ) ( not ( = ?auto_76953 ?auto_76950 ) ) ( not ( = ?auto_76953 ?auto_76951 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76944 ?auto_76948 ?auto_76945 ?auto_76947 ?auto_76946 ?auto_76943 )
      ( DELIVER-5PKG-VERIFY ?auto_76944 ?auto_76945 ?auto_76946 ?auto_76947 ?auto_76948 ?auto_76943 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77114 - OBJ
      ?auto_77115 - OBJ
      ?auto_77116 - OBJ
      ?auto_77117 - OBJ
      ?auto_77118 - OBJ
      ?auto_77113 - LOCATION
    )
    :vars
    (
      ?auto_77123 - LOCATION
      ?auto_77125 - CITY
      ?auto_77122 - LOCATION
      ?auto_77119 - LOCATION
      ?auto_77120 - LOCATION
      ?auto_77121 - LOCATION
      ?auto_77124 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77123 ?auto_77125 ) ( IN-CITY ?auto_77113 ?auto_77125 ) ( not ( = ?auto_77113 ?auto_77123 ) ) ( OBJ-AT ?auto_77116 ?auto_77123 ) ( IN-CITY ?auto_77122 ?auto_77125 ) ( not ( = ?auto_77113 ?auto_77122 ) ) ( OBJ-AT ?auto_77118 ?auto_77122 ) ( IN-CITY ?auto_77119 ?auto_77125 ) ( not ( = ?auto_77113 ?auto_77119 ) ) ( OBJ-AT ?auto_77115 ?auto_77119 ) ( IN-CITY ?auto_77120 ?auto_77125 ) ( not ( = ?auto_77113 ?auto_77120 ) ) ( OBJ-AT ?auto_77117 ?auto_77120 ) ( IN-CITY ?auto_77121 ?auto_77125 ) ( not ( = ?auto_77113 ?auto_77121 ) ) ( OBJ-AT ?auto_77114 ?auto_77121 ) ( TRUCK-AT ?auto_77124 ?auto_77113 ) ( not ( = ?auto_77114 ?auto_77117 ) ) ( not ( = ?auto_77120 ?auto_77121 ) ) ( not ( = ?auto_77114 ?auto_77115 ) ) ( not ( = ?auto_77117 ?auto_77115 ) ) ( not ( = ?auto_77119 ?auto_77120 ) ) ( not ( = ?auto_77119 ?auto_77121 ) ) ( not ( = ?auto_77114 ?auto_77118 ) ) ( not ( = ?auto_77117 ?auto_77118 ) ) ( not ( = ?auto_77115 ?auto_77118 ) ) ( not ( = ?auto_77122 ?auto_77119 ) ) ( not ( = ?auto_77122 ?auto_77120 ) ) ( not ( = ?auto_77122 ?auto_77121 ) ) ( not ( = ?auto_77114 ?auto_77116 ) ) ( not ( = ?auto_77117 ?auto_77116 ) ) ( not ( = ?auto_77115 ?auto_77116 ) ) ( not ( = ?auto_77118 ?auto_77116 ) ) ( not ( = ?auto_77123 ?auto_77122 ) ) ( not ( = ?auto_77123 ?auto_77119 ) ) ( not ( = ?auto_77123 ?auto_77120 ) ) ( not ( = ?auto_77123 ?auto_77121 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77114 ?auto_77117 ?auto_77115 ?auto_77116 ?auto_77118 ?auto_77113 )
      ( DELIVER-5PKG-VERIFY ?auto_77114 ?auto_77115 ?auto_77116 ?auto_77117 ?auto_77118 ?auto_77113 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77228 - OBJ
      ?auto_77229 - OBJ
      ?auto_77230 - OBJ
      ?auto_77231 - OBJ
      ?auto_77232 - OBJ
      ?auto_77227 - LOCATION
    )
    :vars
    (
      ?auto_77237 - LOCATION
      ?auto_77239 - CITY
      ?auto_77236 - LOCATION
      ?auto_77233 - LOCATION
      ?auto_77234 - LOCATION
      ?auto_77235 - LOCATION
      ?auto_77238 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77237 ?auto_77239 ) ( IN-CITY ?auto_77227 ?auto_77239 ) ( not ( = ?auto_77227 ?auto_77237 ) ) ( OBJ-AT ?auto_77230 ?auto_77237 ) ( IN-CITY ?auto_77236 ?auto_77239 ) ( not ( = ?auto_77227 ?auto_77236 ) ) ( OBJ-AT ?auto_77231 ?auto_77236 ) ( IN-CITY ?auto_77233 ?auto_77239 ) ( not ( = ?auto_77227 ?auto_77233 ) ) ( OBJ-AT ?auto_77229 ?auto_77233 ) ( IN-CITY ?auto_77234 ?auto_77239 ) ( not ( = ?auto_77227 ?auto_77234 ) ) ( OBJ-AT ?auto_77232 ?auto_77234 ) ( IN-CITY ?auto_77235 ?auto_77239 ) ( not ( = ?auto_77227 ?auto_77235 ) ) ( OBJ-AT ?auto_77228 ?auto_77235 ) ( TRUCK-AT ?auto_77238 ?auto_77227 ) ( not ( = ?auto_77228 ?auto_77232 ) ) ( not ( = ?auto_77234 ?auto_77235 ) ) ( not ( = ?auto_77228 ?auto_77229 ) ) ( not ( = ?auto_77232 ?auto_77229 ) ) ( not ( = ?auto_77233 ?auto_77234 ) ) ( not ( = ?auto_77233 ?auto_77235 ) ) ( not ( = ?auto_77228 ?auto_77231 ) ) ( not ( = ?auto_77232 ?auto_77231 ) ) ( not ( = ?auto_77229 ?auto_77231 ) ) ( not ( = ?auto_77236 ?auto_77233 ) ) ( not ( = ?auto_77236 ?auto_77234 ) ) ( not ( = ?auto_77236 ?auto_77235 ) ) ( not ( = ?auto_77228 ?auto_77230 ) ) ( not ( = ?auto_77232 ?auto_77230 ) ) ( not ( = ?auto_77229 ?auto_77230 ) ) ( not ( = ?auto_77231 ?auto_77230 ) ) ( not ( = ?auto_77237 ?auto_77236 ) ) ( not ( = ?auto_77237 ?auto_77233 ) ) ( not ( = ?auto_77237 ?auto_77234 ) ) ( not ( = ?auto_77237 ?auto_77235 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77228 ?auto_77232 ?auto_77229 ?auto_77230 ?auto_77231 ?auto_77227 )
      ( DELIVER-5PKG-VERIFY ?auto_77228 ?auto_77229 ?auto_77230 ?auto_77231 ?auto_77232 ?auto_77227 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77515 - OBJ
      ?auto_77516 - OBJ
      ?auto_77517 - OBJ
      ?auto_77518 - OBJ
      ?auto_77519 - OBJ
      ?auto_77514 - LOCATION
    )
    :vars
    (
      ?auto_77524 - LOCATION
      ?auto_77526 - CITY
      ?auto_77523 - LOCATION
      ?auto_77520 - LOCATION
      ?auto_77521 - LOCATION
      ?auto_77522 - LOCATION
      ?auto_77525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77524 ?auto_77526 ) ( IN-CITY ?auto_77514 ?auto_77526 ) ( not ( = ?auto_77514 ?auto_77524 ) ) ( OBJ-AT ?auto_77519 ?auto_77524 ) ( IN-CITY ?auto_77523 ?auto_77526 ) ( not ( = ?auto_77514 ?auto_77523 ) ) ( OBJ-AT ?auto_77516 ?auto_77523 ) ( IN-CITY ?auto_77520 ?auto_77526 ) ( not ( = ?auto_77514 ?auto_77520 ) ) ( OBJ-AT ?auto_77518 ?auto_77520 ) ( IN-CITY ?auto_77521 ?auto_77526 ) ( not ( = ?auto_77514 ?auto_77521 ) ) ( OBJ-AT ?auto_77517 ?auto_77521 ) ( IN-CITY ?auto_77522 ?auto_77526 ) ( not ( = ?auto_77514 ?auto_77522 ) ) ( OBJ-AT ?auto_77515 ?auto_77522 ) ( TRUCK-AT ?auto_77525 ?auto_77514 ) ( not ( = ?auto_77515 ?auto_77517 ) ) ( not ( = ?auto_77521 ?auto_77522 ) ) ( not ( = ?auto_77515 ?auto_77518 ) ) ( not ( = ?auto_77517 ?auto_77518 ) ) ( not ( = ?auto_77520 ?auto_77521 ) ) ( not ( = ?auto_77520 ?auto_77522 ) ) ( not ( = ?auto_77515 ?auto_77516 ) ) ( not ( = ?auto_77517 ?auto_77516 ) ) ( not ( = ?auto_77518 ?auto_77516 ) ) ( not ( = ?auto_77523 ?auto_77520 ) ) ( not ( = ?auto_77523 ?auto_77521 ) ) ( not ( = ?auto_77523 ?auto_77522 ) ) ( not ( = ?auto_77515 ?auto_77519 ) ) ( not ( = ?auto_77517 ?auto_77519 ) ) ( not ( = ?auto_77518 ?auto_77519 ) ) ( not ( = ?auto_77516 ?auto_77519 ) ) ( not ( = ?auto_77524 ?auto_77523 ) ) ( not ( = ?auto_77524 ?auto_77520 ) ) ( not ( = ?auto_77524 ?auto_77521 ) ) ( not ( = ?auto_77524 ?auto_77522 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77515 ?auto_77517 ?auto_77518 ?auto_77519 ?auto_77516 ?auto_77514 )
      ( DELIVER-5PKG-VERIFY ?auto_77515 ?auto_77516 ?auto_77517 ?auto_77518 ?auto_77519 ?auto_77514 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77570 - OBJ
      ?auto_77571 - OBJ
      ?auto_77572 - OBJ
      ?auto_77573 - OBJ
      ?auto_77574 - OBJ
      ?auto_77569 - LOCATION
    )
    :vars
    (
      ?auto_77579 - LOCATION
      ?auto_77581 - CITY
      ?auto_77578 - LOCATION
      ?auto_77575 - LOCATION
      ?auto_77576 - LOCATION
      ?auto_77577 - LOCATION
      ?auto_77580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77579 ?auto_77581 ) ( IN-CITY ?auto_77569 ?auto_77581 ) ( not ( = ?auto_77569 ?auto_77579 ) ) ( OBJ-AT ?auto_77573 ?auto_77579 ) ( IN-CITY ?auto_77578 ?auto_77581 ) ( not ( = ?auto_77569 ?auto_77578 ) ) ( OBJ-AT ?auto_77571 ?auto_77578 ) ( IN-CITY ?auto_77575 ?auto_77581 ) ( not ( = ?auto_77569 ?auto_77575 ) ) ( OBJ-AT ?auto_77574 ?auto_77575 ) ( IN-CITY ?auto_77576 ?auto_77581 ) ( not ( = ?auto_77569 ?auto_77576 ) ) ( OBJ-AT ?auto_77572 ?auto_77576 ) ( IN-CITY ?auto_77577 ?auto_77581 ) ( not ( = ?auto_77569 ?auto_77577 ) ) ( OBJ-AT ?auto_77570 ?auto_77577 ) ( TRUCK-AT ?auto_77580 ?auto_77569 ) ( not ( = ?auto_77570 ?auto_77572 ) ) ( not ( = ?auto_77576 ?auto_77577 ) ) ( not ( = ?auto_77570 ?auto_77574 ) ) ( not ( = ?auto_77572 ?auto_77574 ) ) ( not ( = ?auto_77575 ?auto_77576 ) ) ( not ( = ?auto_77575 ?auto_77577 ) ) ( not ( = ?auto_77570 ?auto_77571 ) ) ( not ( = ?auto_77572 ?auto_77571 ) ) ( not ( = ?auto_77574 ?auto_77571 ) ) ( not ( = ?auto_77578 ?auto_77575 ) ) ( not ( = ?auto_77578 ?auto_77576 ) ) ( not ( = ?auto_77578 ?auto_77577 ) ) ( not ( = ?auto_77570 ?auto_77573 ) ) ( not ( = ?auto_77572 ?auto_77573 ) ) ( not ( = ?auto_77574 ?auto_77573 ) ) ( not ( = ?auto_77571 ?auto_77573 ) ) ( not ( = ?auto_77579 ?auto_77578 ) ) ( not ( = ?auto_77579 ?auto_77575 ) ) ( not ( = ?auto_77579 ?auto_77576 ) ) ( not ( = ?auto_77579 ?auto_77577 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77570 ?auto_77572 ?auto_77574 ?auto_77573 ?auto_77571 ?auto_77569 )
      ( DELIVER-5PKG-VERIFY ?auto_77570 ?auto_77571 ?auto_77572 ?auto_77573 ?auto_77574 ?auto_77569 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77625 - OBJ
      ?auto_77626 - OBJ
      ?auto_77627 - OBJ
      ?auto_77628 - OBJ
      ?auto_77629 - OBJ
      ?auto_77624 - LOCATION
    )
    :vars
    (
      ?auto_77634 - LOCATION
      ?auto_77636 - CITY
      ?auto_77633 - LOCATION
      ?auto_77630 - LOCATION
      ?auto_77631 - LOCATION
      ?auto_77632 - LOCATION
      ?auto_77635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77634 ?auto_77636 ) ( IN-CITY ?auto_77624 ?auto_77636 ) ( not ( = ?auto_77624 ?auto_77634 ) ) ( OBJ-AT ?auto_77629 ?auto_77634 ) ( IN-CITY ?auto_77633 ?auto_77636 ) ( not ( = ?auto_77624 ?auto_77633 ) ) ( OBJ-AT ?auto_77626 ?auto_77633 ) ( IN-CITY ?auto_77630 ?auto_77636 ) ( not ( = ?auto_77624 ?auto_77630 ) ) ( OBJ-AT ?auto_77627 ?auto_77630 ) ( IN-CITY ?auto_77631 ?auto_77636 ) ( not ( = ?auto_77624 ?auto_77631 ) ) ( OBJ-AT ?auto_77628 ?auto_77631 ) ( IN-CITY ?auto_77632 ?auto_77636 ) ( not ( = ?auto_77624 ?auto_77632 ) ) ( OBJ-AT ?auto_77625 ?auto_77632 ) ( TRUCK-AT ?auto_77635 ?auto_77624 ) ( not ( = ?auto_77625 ?auto_77628 ) ) ( not ( = ?auto_77631 ?auto_77632 ) ) ( not ( = ?auto_77625 ?auto_77627 ) ) ( not ( = ?auto_77628 ?auto_77627 ) ) ( not ( = ?auto_77630 ?auto_77631 ) ) ( not ( = ?auto_77630 ?auto_77632 ) ) ( not ( = ?auto_77625 ?auto_77626 ) ) ( not ( = ?auto_77628 ?auto_77626 ) ) ( not ( = ?auto_77627 ?auto_77626 ) ) ( not ( = ?auto_77633 ?auto_77630 ) ) ( not ( = ?auto_77633 ?auto_77631 ) ) ( not ( = ?auto_77633 ?auto_77632 ) ) ( not ( = ?auto_77625 ?auto_77629 ) ) ( not ( = ?auto_77628 ?auto_77629 ) ) ( not ( = ?auto_77627 ?auto_77629 ) ) ( not ( = ?auto_77626 ?auto_77629 ) ) ( not ( = ?auto_77634 ?auto_77633 ) ) ( not ( = ?auto_77634 ?auto_77630 ) ) ( not ( = ?auto_77634 ?auto_77631 ) ) ( not ( = ?auto_77634 ?auto_77632 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77625 ?auto_77628 ?auto_77627 ?auto_77629 ?auto_77626 ?auto_77624 )
      ( DELIVER-5PKG-VERIFY ?auto_77625 ?auto_77626 ?auto_77627 ?auto_77628 ?auto_77629 ?auto_77624 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77680 - OBJ
      ?auto_77681 - OBJ
      ?auto_77682 - OBJ
      ?auto_77683 - OBJ
      ?auto_77684 - OBJ
      ?auto_77679 - LOCATION
    )
    :vars
    (
      ?auto_77689 - LOCATION
      ?auto_77691 - CITY
      ?auto_77688 - LOCATION
      ?auto_77685 - LOCATION
      ?auto_77686 - LOCATION
      ?auto_77687 - LOCATION
      ?auto_77690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77689 ?auto_77691 ) ( IN-CITY ?auto_77679 ?auto_77691 ) ( not ( = ?auto_77679 ?auto_77689 ) ) ( OBJ-AT ?auto_77683 ?auto_77689 ) ( IN-CITY ?auto_77688 ?auto_77691 ) ( not ( = ?auto_77679 ?auto_77688 ) ) ( OBJ-AT ?auto_77681 ?auto_77688 ) ( IN-CITY ?auto_77685 ?auto_77691 ) ( not ( = ?auto_77679 ?auto_77685 ) ) ( OBJ-AT ?auto_77682 ?auto_77685 ) ( IN-CITY ?auto_77686 ?auto_77691 ) ( not ( = ?auto_77679 ?auto_77686 ) ) ( OBJ-AT ?auto_77684 ?auto_77686 ) ( IN-CITY ?auto_77687 ?auto_77691 ) ( not ( = ?auto_77679 ?auto_77687 ) ) ( OBJ-AT ?auto_77680 ?auto_77687 ) ( TRUCK-AT ?auto_77690 ?auto_77679 ) ( not ( = ?auto_77680 ?auto_77684 ) ) ( not ( = ?auto_77686 ?auto_77687 ) ) ( not ( = ?auto_77680 ?auto_77682 ) ) ( not ( = ?auto_77684 ?auto_77682 ) ) ( not ( = ?auto_77685 ?auto_77686 ) ) ( not ( = ?auto_77685 ?auto_77687 ) ) ( not ( = ?auto_77680 ?auto_77681 ) ) ( not ( = ?auto_77684 ?auto_77681 ) ) ( not ( = ?auto_77682 ?auto_77681 ) ) ( not ( = ?auto_77688 ?auto_77685 ) ) ( not ( = ?auto_77688 ?auto_77686 ) ) ( not ( = ?auto_77688 ?auto_77687 ) ) ( not ( = ?auto_77680 ?auto_77683 ) ) ( not ( = ?auto_77684 ?auto_77683 ) ) ( not ( = ?auto_77682 ?auto_77683 ) ) ( not ( = ?auto_77681 ?auto_77683 ) ) ( not ( = ?auto_77689 ?auto_77688 ) ) ( not ( = ?auto_77689 ?auto_77685 ) ) ( not ( = ?auto_77689 ?auto_77686 ) ) ( not ( = ?auto_77689 ?auto_77687 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77680 ?auto_77684 ?auto_77682 ?auto_77683 ?auto_77681 ?auto_77679 )
      ( DELIVER-5PKG-VERIFY ?auto_77680 ?auto_77681 ?auto_77682 ?auto_77683 ?auto_77684 ?auto_77679 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77967 - OBJ
      ?auto_77968 - OBJ
      ?auto_77969 - OBJ
      ?auto_77970 - OBJ
      ?auto_77971 - OBJ
      ?auto_77966 - LOCATION
    )
    :vars
    (
      ?auto_77976 - LOCATION
      ?auto_77978 - CITY
      ?auto_77975 - LOCATION
      ?auto_77972 - LOCATION
      ?auto_77973 - LOCATION
      ?auto_77974 - LOCATION
      ?auto_77977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77976 ?auto_77978 ) ( IN-CITY ?auto_77966 ?auto_77978 ) ( not ( = ?auto_77966 ?auto_77976 ) ) ( OBJ-AT ?auto_77969 ?auto_77976 ) ( IN-CITY ?auto_77975 ?auto_77978 ) ( not ( = ?auto_77966 ?auto_77975 ) ) ( OBJ-AT ?auto_77968 ?auto_77975 ) ( IN-CITY ?auto_77972 ?auto_77978 ) ( not ( = ?auto_77966 ?auto_77972 ) ) ( OBJ-AT ?auto_77971 ?auto_77972 ) ( IN-CITY ?auto_77973 ?auto_77978 ) ( not ( = ?auto_77966 ?auto_77973 ) ) ( OBJ-AT ?auto_77970 ?auto_77973 ) ( IN-CITY ?auto_77974 ?auto_77978 ) ( not ( = ?auto_77966 ?auto_77974 ) ) ( OBJ-AT ?auto_77967 ?auto_77974 ) ( TRUCK-AT ?auto_77977 ?auto_77966 ) ( not ( = ?auto_77967 ?auto_77970 ) ) ( not ( = ?auto_77973 ?auto_77974 ) ) ( not ( = ?auto_77967 ?auto_77971 ) ) ( not ( = ?auto_77970 ?auto_77971 ) ) ( not ( = ?auto_77972 ?auto_77973 ) ) ( not ( = ?auto_77972 ?auto_77974 ) ) ( not ( = ?auto_77967 ?auto_77968 ) ) ( not ( = ?auto_77970 ?auto_77968 ) ) ( not ( = ?auto_77971 ?auto_77968 ) ) ( not ( = ?auto_77975 ?auto_77972 ) ) ( not ( = ?auto_77975 ?auto_77973 ) ) ( not ( = ?auto_77975 ?auto_77974 ) ) ( not ( = ?auto_77967 ?auto_77969 ) ) ( not ( = ?auto_77970 ?auto_77969 ) ) ( not ( = ?auto_77971 ?auto_77969 ) ) ( not ( = ?auto_77968 ?auto_77969 ) ) ( not ( = ?auto_77976 ?auto_77975 ) ) ( not ( = ?auto_77976 ?auto_77972 ) ) ( not ( = ?auto_77976 ?auto_77973 ) ) ( not ( = ?auto_77976 ?auto_77974 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77967 ?auto_77970 ?auto_77971 ?auto_77969 ?auto_77968 ?auto_77966 )
      ( DELIVER-5PKG-VERIFY ?auto_77967 ?auto_77968 ?auto_77969 ?auto_77970 ?auto_77971 ?auto_77966 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78022 - OBJ
      ?auto_78023 - OBJ
      ?auto_78024 - OBJ
      ?auto_78025 - OBJ
      ?auto_78026 - OBJ
      ?auto_78021 - LOCATION
    )
    :vars
    (
      ?auto_78031 - LOCATION
      ?auto_78033 - CITY
      ?auto_78030 - LOCATION
      ?auto_78027 - LOCATION
      ?auto_78028 - LOCATION
      ?auto_78029 - LOCATION
      ?auto_78032 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78031 ?auto_78033 ) ( IN-CITY ?auto_78021 ?auto_78033 ) ( not ( = ?auto_78021 ?auto_78031 ) ) ( OBJ-AT ?auto_78024 ?auto_78031 ) ( IN-CITY ?auto_78030 ?auto_78033 ) ( not ( = ?auto_78021 ?auto_78030 ) ) ( OBJ-AT ?auto_78023 ?auto_78030 ) ( IN-CITY ?auto_78027 ?auto_78033 ) ( not ( = ?auto_78021 ?auto_78027 ) ) ( OBJ-AT ?auto_78025 ?auto_78027 ) ( IN-CITY ?auto_78028 ?auto_78033 ) ( not ( = ?auto_78021 ?auto_78028 ) ) ( OBJ-AT ?auto_78026 ?auto_78028 ) ( IN-CITY ?auto_78029 ?auto_78033 ) ( not ( = ?auto_78021 ?auto_78029 ) ) ( OBJ-AT ?auto_78022 ?auto_78029 ) ( TRUCK-AT ?auto_78032 ?auto_78021 ) ( not ( = ?auto_78022 ?auto_78026 ) ) ( not ( = ?auto_78028 ?auto_78029 ) ) ( not ( = ?auto_78022 ?auto_78025 ) ) ( not ( = ?auto_78026 ?auto_78025 ) ) ( not ( = ?auto_78027 ?auto_78028 ) ) ( not ( = ?auto_78027 ?auto_78029 ) ) ( not ( = ?auto_78022 ?auto_78023 ) ) ( not ( = ?auto_78026 ?auto_78023 ) ) ( not ( = ?auto_78025 ?auto_78023 ) ) ( not ( = ?auto_78030 ?auto_78027 ) ) ( not ( = ?auto_78030 ?auto_78028 ) ) ( not ( = ?auto_78030 ?auto_78029 ) ) ( not ( = ?auto_78022 ?auto_78024 ) ) ( not ( = ?auto_78026 ?auto_78024 ) ) ( not ( = ?auto_78025 ?auto_78024 ) ) ( not ( = ?auto_78023 ?auto_78024 ) ) ( not ( = ?auto_78031 ?auto_78030 ) ) ( not ( = ?auto_78031 ?auto_78027 ) ) ( not ( = ?auto_78031 ?auto_78028 ) ) ( not ( = ?auto_78031 ?auto_78029 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78022 ?auto_78026 ?auto_78025 ?auto_78024 ?auto_78023 ?auto_78021 )
      ( DELIVER-5PKG-VERIFY ?auto_78022 ?auto_78023 ?auto_78024 ?auto_78025 ?auto_78026 ?auto_78021 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78784 - OBJ
      ?auto_78785 - OBJ
      ?auto_78786 - OBJ
      ?auto_78787 - OBJ
      ?auto_78788 - OBJ
      ?auto_78783 - LOCATION
    )
    :vars
    (
      ?auto_78793 - LOCATION
      ?auto_78795 - CITY
      ?auto_78792 - LOCATION
      ?auto_78789 - LOCATION
      ?auto_78790 - LOCATION
      ?auto_78791 - LOCATION
      ?auto_78794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78793 ?auto_78795 ) ( IN-CITY ?auto_78783 ?auto_78795 ) ( not ( = ?auto_78783 ?auto_78793 ) ) ( OBJ-AT ?auto_78785 ?auto_78793 ) ( IN-CITY ?auto_78792 ?auto_78795 ) ( not ( = ?auto_78783 ?auto_78792 ) ) ( OBJ-AT ?auto_78788 ?auto_78792 ) ( IN-CITY ?auto_78789 ?auto_78795 ) ( not ( = ?auto_78783 ?auto_78789 ) ) ( OBJ-AT ?auto_78787 ?auto_78789 ) ( IN-CITY ?auto_78790 ?auto_78795 ) ( not ( = ?auto_78783 ?auto_78790 ) ) ( OBJ-AT ?auto_78786 ?auto_78790 ) ( IN-CITY ?auto_78791 ?auto_78795 ) ( not ( = ?auto_78783 ?auto_78791 ) ) ( OBJ-AT ?auto_78784 ?auto_78791 ) ( TRUCK-AT ?auto_78794 ?auto_78783 ) ( not ( = ?auto_78784 ?auto_78786 ) ) ( not ( = ?auto_78790 ?auto_78791 ) ) ( not ( = ?auto_78784 ?auto_78787 ) ) ( not ( = ?auto_78786 ?auto_78787 ) ) ( not ( = ?auto_78789 ?auto_78790 ) ) ( not ( = ?auto_78789 ?auto_78791 ) ) ( not ( = ?auto_78784 ?auto_78788 ) ) ( not ( = ?auto_78786 ?auto_78788 ) ) ( not ( = ?auto_78787 ?auto_78788 ) ) ( not ( = ?auto_78792 ?auto_78789 ) ) ( not ( = ?auto_78792 ?auto_78790 ) ) ( not ( = ?auto_78792 ?auto_78791 ) ) ( not ( = ?auto_78784 ?auto_78785 ) ) ( not ( = ?auto_78786 ?auto_78785 ) ) ( not ( = ?auto_78787 ?auto_78785 ) ) ( not ( = ?auto_78788 ?auto_78785 ) ) ( not ( = ?auto_78793 ?auto_78792 ) ) ( not ( = ?auto_78793 ?auto_78789 ) ) ( not ( = ?auto_78793 ?auto_78790 ) ) ( not ( = ?auto_78793 ?auto_78791 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78784 ?auto_78786 ?auto_78787 ?auto_78785 ?auto_78788 ?auto_78783 )
      ( DELIVER-5PKG-VERIFY ?auto_78784 ?auto_78785 ?auto_78786 ?auto_78787 ?auto_78788 ?auto_78783 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78839 - OBJ
      ?auto_78840 - OBJ
      ?auto_78841 - OBJ
      ?auto_78842 - OBJ
      ?auto_78843 - OBJ
      ?auto_78838 - LOCATION
    )
    :vars
    (
      ?auto_78848 - LOCATION
      ?auto_78850 - CITY
      ?auto_78847 - LOCATION
      ?auto_78844 - LOCATION
      ?auto_78845 - LOCATION
      ?auto_78846 - LOCATION
      ?auto_78849 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78848 ?auto_78850 ) ( IN-CITY ?auto_78838 ?auto_78850 ) ( not ( = ?auto_78838 ?auto_78848 ) ) ( OBJ-AT ?auto_78840 ?auto_78848 ) ( IN-CITY ?auto_78847 ?auto_78850 ) ( not ( = ?auto_78838 ?auto_78847 ) ) ( OBJ-AT ?auto_78842 ?auto_78847 ) ( IN-CITY ?auto_78844 ?auto_78850 ) ( not ( = ?auto_78838 ?auto_78844 ) ) ( OBJ-AT ?auto_78843 ?auto_78844 ) ( IN-CITY ?auto_78845 ?auto_78850 ) ( not ( = ?auto_78838 ?auto_78845 ) ) ( OBJ-AT ?auto_78841 ?auto_78845 ) ( IN-CITY ?auto_78846 ?auto_78850 ) ( not ( = ?auto_78838 ?auto_78846 ) ) ( OBJ-AT ?auto_78839 ?auto_78846 ) ( TRUCK-AT ?auto_78849 ?auto_78838 ) ( not ( = ?auto_78839 ?auto_78841 ) ) ( not ( = ?auto_78845 ?auto_78846 ) ) ( not ( = ?auto_78839 ?auto_78843 ) ) ( not ( = ?auto_78841 ?auto_78843 ) ) ( not ( = ?auto_78844 ?auto_78845 ) ) ( not ( = ?auto_78844 ?auto_78846 ) ) ( not ( = ?auto_78839 ?auto_78842 ) ) ( not ( = ?auto_78841 ?auto_78842 ) ) ( not ( = ?auto_78843 ?auto_78842 ) ) ( not ( = ?auto_78847 ?auto_78844 ) ) ( not ( = ?auto_78847 ?auto_78845 ) ) ( not ( = ?auto_78847 ?auto_78846 ) ) ( not ( = ?auto_78839 ?auto_78840 ) ) ( not ( = ?auto_78841 ?auto_78840 ) ) ( not ( = ?auto_78843 ?auto_78840 ) ) ( not ( = ?auto_78842 ?auto_78840 ) ) ( not ( = ?auto_78848 ?auto_78847 ) ) ( not ( = ?auto_78848 ?auto_78844 ) ) ( not ( = ?auto_78848 ?auto_78845 ) ) ( not ( = ?auto_78848 ?auto_78846 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78839 ?auto_78841 ?auto_78843 ?auto_78840 ?auto_78842 ?auto_78838 )
      ( DELIVER-5PKG-VERIFY ?auto_78839 ?auto_78840 ?auto_78841 ?auto_78842 ?auto_78843 ?auto_78838 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79068 - OBJ
      ?auto_79069 - OBJ
      ?auto_79070 - OBJ
      ?auto_79071 - OBJ
      ?auto_79072 - OBJ
      ?auto_79067 - LOCATION
    )
    :vars
    (
      ?auto_79077 - LOCATION
      ?auto_79079 - CITY
      ?auto_79076 - LOCATION
      ?auto_79073 - LOCATION
      ?auto_79074 - LOCATION
      ?auto_79075 - LOCATION
      ?auto_79078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79077 ?auto_79079 ) ( IN-CITY ?auto_79067 ?auto_79079 ) ( not ( = ?auto_79067 ?auto_79077 ) ) ( OBJ-AT ?auto_79069 ?auto_79077 ) ( IN-CITY ?auto_79076 ?auto_79079 ) ( not ( = ?auto_79067 ?auto_79076 ) ) ( OBJ-AT ?auto_79072 ?auto_79076 ) ( IN-CITY ?auto_79073 ?auto_79079 ) ( not ( = ?auto_79067 ?auto_79073 ) ) ( OBJ-AT ?auto_79070 ?auto_79073 ) ( IN-CITY ?auto_79074 ?auto_79079 ) ( not ( = ?auto_79067 ?auto_79074 ) ) ( OBJ-AT ?auto_79071 ?auto_79074 ) ( IN-CITY ?auto_79075 ?auto_79079 ) ( not ( = ?auto_79067 ?auto_79075 ) ) ( OBJ-AT ?auto_79068 ?auto_79075 ) ( TRUCK-AT ?auto_79078 ?auto_79067 ) ( not ( = ?auto_79068 ?auto_79071 ) ) ( not ( = ?auto_79074 ?auto_79075 ) ) ( not ( = ?auto_79068 ?auto_79070 ) ) ( not ( = ?auto_79071 ?auto_79070 ) ) ( not ( = ?auto_79073 ?auto_79074 ) ) ( not ( = ?auto_79073 ?auto_79075 ) ) ( not ( = ?auto_79068 ?auto_79072 ) ) ( not ( = ?auto_79071 ?auto_79072 ) ) ( not ( = ?auto_79070 ?auto_79072 ) ) ( not ( = ?auto_79076 ?auto_79073 ) ) ( not ( = ?auto_79076 ?auto_79074 ) ) ( not ( = ?auto_79076 ?auto_79075 ) ) ( not ( = ?auto_79068 ?auto_79069 ) ) ( not ( = ?auto_79071 ?auto_79069 ) ) ( not ( = ?auto_79070 ?auto_79069 ) ) ( not ( = ?auto_79072 ?auto_79069 ) ) ( not ( = ?auto_79077 ?auto_79076 ) ) ( not ( = ?auto_79077 ?auto_79073 ) ) ( not ( = ?auto_79077 ?auto_79074 ) ) ( not ( = ?auto_79077 ?auto_79075 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79068 ?auto_79071 ?auto_79070 ?auto_79069 ?auto_79072 ?auto_79067 )
      ( DELIVER-5PKG-VERIFY ?auto_79068 ?auto_79069 ?auto_79070 ?auto_79071 ?auto_79072 ?auto_79067 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79182 - OBJ
      ?auto_79183 - OBJ
      ?auto_79184 - OBJ
      ?auto_79185 - OBJ
      ?auto_79186 - OBJ
      ?auto_79181 - LOCATION
    )
    :vars
    (
      ?auto_79191 - LOCATION
      ?auto_79193 - CITY
      ?auto_79190 - LOCATION
      ?auto_79187 - LOCATION
      ?auto_79188 - LOCATION
      ?auto_79189 - LOCATION
      ?auto_79192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79191 ?auto_79193 ) ( IN-CITY ?auto_79181 ?auto_79193 ) ( not ( = ?auto_79181 ?auto_79191 ) ) ( OBJ-AT ?auto_79183 ?auto_79191 ) ( IN-CITY ?auto_79190 ?auto_79193 ) ( not ( = ?auto_79181 ?auto_79190 ) ) ( OBJ-AT ?auto_79185 ?auto_79190 ) ( IN-CITY ?auto_79187 ?auto_79193 ) ( not ( = ?auto_79181 ?auto_79187 ) ) ( OBJ-AT ?auto_79184 ?auto_79187 ) ( IN-CITY ?auto_79188 ?auto_79193 ) ( not ( = ?auto_79181 ?auto_79188 ) ) ( OBJ-AT ?auto_79186 ?auto_79188 ) ( IN-CITY ?auto_79189 ?auto_79193 ) ( not ( = ?auto_79181 ?auto_79189 ) ) ( OBJ-AT ?auto_79182 ?auto_79189 ) ( TRUCK-AT ?auto_79192 ?auto_79181 ) ( not ( = ?auto_79182 ?auto_79186 ) ) ( not ( = ?auto_79188 ?auto_79189 ) ) ( not ( = ?auto_79182 ?auto_79184 ) ) ( not ( = ?auto_79186 ?auto_79184 ) ) ( not ( = ?auto_79187 ?auto_79188 ) ) ( not ( = ?auto_79187 ?auto_79189 ) ) ( not ( = ?auto_79182 ?auto_79185 ) ) ( not ( = ?auto_79186 ?auto_79185 ) ) ( not ( = ?auto_79184 ?auto_79185 ) ) ( not ( = ?auto_79190 ?auto_79187 ) ) ( not ( = ?auto_79190 ?auto_79188 ) ) ( not ( = ?auto_79190 ?auto_79189 ) ) ( not ( = ?auto_79182 ?auto_79183 ) ) ( not ( = ?auto_79186 ?auto_79183 ) ) ( not ( = ?auto_79184 ?auto_79183 ) ) ( not ( = ?auto_79185 ?auto_79183 ) ) ( not ( = ?auto_79191 ?auto_79190 ) ) ( not ( = ?auto_79191 ?auto_79187 ) ) ( not ( = ?auto_79191 ?auto_79188 ) ) ( not ( = ?auto_79191 ?auto_79189 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79182 ?auto_79186 ?auto_79184 ?auto_79183 ?auto_79185 ?auto_79181 )
      ( DELIVER-5PKG-VERIFY ?auto_79182 ?auto_79183 ?auto_79184 ?auto_79185 ?auto_79186 ?auto_79181 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79411 - OBJ
      ?auto_79412 - OBJ
      ?auto_79413 - OBJ
      ?auto_79414 - OBJ
      ?auto_79415 - OBJ
      ?auto_79410 - LOCATION
    )
    :vars
    (
      ?auto_79420 - LOCATION
      ?auto_79422 - CITY
      ?auto_79419 - LOCATION
      ?auto_79416 - LOCATION
      ?auto_79417 - LOCATION
      ?auto_79418 - LOCATION
      ?auto_79421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79420 ?auto_79422 ) ( IN-CITY ?auto_79410 ?auto_79422 ) ( not ( = ?auto_79410 ?auto_79420 ) ) ( OBJ-AT ?auto_79412 ?auto_79420 ) ( IN-CITY ?auto_79419 ?auto_79422 ) ( not ( = ?auto_79410 ?auto_79419 ) ) ( OBJ-AT ?auto_79413 ?auto_79419 ) ( IN-CITY ?auto_79416 ?auto_79422 ) ( not ( = ?auto_79410 ?auto_79416 ) ) ( OBJ-AT ?auto_79415 ?auto_79416 ) ( IN-CITY ?auto_79417 ?auto_79422 ) ( not ( = ?auto_79410 ?auto_79417 ) ) ( OBJ-AT ?auto_79414 ?auto_79417 ) ( IN-CITY ?auto_79418 ?auto_79422 ) ( not ( = ?auto_79410 ?auto_79418 ) ) ( OBJ-AT ?auto_79411 ?auto_79418 ) ( TRUCK-AT ?auto_79421 ?auto_79410 ) ( not ( = ?auto_79411 ?auto_79414 ) ) ( not ( = ?auto_79417 ?auto_79418 ) ) ( not ( = ?auto_79411 ?auto_79415 ) ) ( not ( = ?auto_79414 ?auto_79415 ) ) ( not ( = ?auto_79416 ?auto_79417 ) ) ( not ( = ?auto_79416 ?auto_79418 ) ) ( not ( = ?auto_79411 ?auto_79413 ) ) ( not ( = ?auto_79414 ?auto_79413 ) ) ( not ( = ?auto_79415 ?auto_79413 ) ) ( not ( = ?auto_79419 ?auto_79416 ) ) ( not ( = ?auto_79419 ?auto_79417 ) ) ( not ( = ?auto_79419 ?auto_79418 ) ) ( not ( = ?auto_79411 ?auto_79412 ) ) ( not ( = ?auto_79414 ?auto_79412 ) ) ( not ( = ?auto_79415 ?auto_79412 ) ) ( not ( = ?auto_79413 ?auto_79412 ) ) ( not ( = ?auto_79420 ?auto_79419 ) ) ( not ( = ?auto_79420 ?auto_79416 ) ) ( not ( = ?auto_79420 ?auto_79417 ) ) ( not ( = ?auto_79420 ?auto_79418 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79411 ?auto_79414 ?auto_79415 ?auto_79412 ?auto_79413 ?auto_79410 )
      ( DELIVER-5PKG-VERIFY ?auto_79411 ?auto_79412 ?auto_79413 ?auto_79414 ?auto_79415 ?auto_79410 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79466 - OBJ
      ?auto_79467 - OBJ
      ?auto_79468 - OBJ
      ?auto_79469 - OBJ
      ?auto_79470 - OBJ
      ?auto_79465 - LOCATION
    )
    :vars
    (
      ?auto_79475 - LOCATION
      ?auto_79477 - CITY
      ?auto_79474 - LOCATION
      ?auto_79471 - LOCATION
      ?auto_79472 - LOCATION
      ?auto_79473 - LOCATION
      ?auto_79476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79475 ?auto_79477 ) ( IN-CITY ?auto_79465 ?auto_79477 ) ( not ( = ?auto_79465 ?auto_79475 ) ) ( OBJ-AT ?auto_79467 ?auto_79475 ) ( IN-CITY ?auto_79474 ?auto_79477 ) ( not ( = ?auto_79465 ?auto_79474 ) ) ( OBJ-AT ?auto_79468 ?auto_79474 ) ( IN-CITY ?auto_79471 ?auto_79477 ) ( not ( = ?auto_79465 ?auto_79471 ) ) ( OBJ-AT ?auto_79469 ?auto_79471 ) ( IN-CITY ?auto_79472 ?auto_79477 ) ( not ( = ?auto_79465 ?auto_79472 ) ) ( OBJ-AT ?auto_79470 ?auto_79472 ) ( IN-CITY ?auto_79473 ?auto_79477 ) ( not ( = ?auto_79465 ?auto_79473 ) ) ( OBJ-AT ?auto_79466 ?auto_79473 ) ( TRUCK-AT ?auto_79476 ?auto_79465 ) ( not ( = ?auto_79466 ?auto_79470 ) ) ( not ( = ?auto_79472 ?auto_79473 ) ) ( not ( = ?auto_79466 ?auto_79469 ) ) ( not ( = ?auto_79470 ?auto_79469 ) ) ( not ( = ?auto_79471 ?auto_79472 ) ) ( not ( = ?auto_79471 ?auto_79473 ) ) ( not ( = ?auto_79466 ?auto_79468 ) ) ( not ( = ?auto_79470 ?auto_79468 ) ) ( not ( = ?auto_79469 ?auto_79468 ) ) ( not ( = ?auto_79474 ?auto_79471 ) ) ( not ( = ?auto_79474 ?auto_79472 ) ) ( not ( = ?auto_79474 ?auto_79473 ) ) ( not ( = ?auto_79466 ?auto_79467 ) ) ( not ( = ?auto_79470 ?auto_79467 ) ) ( not ( = ?auto_79469 ?auto_79467 ) ) ( not ( = ?auto_79468 ?auto_79467 ) ) ( not ( = ?auto_79475 ?auto_79474 ) ) ( not ( = ?auto_79475 ?auto_79471 ) ) ( not ( = ?auto_79475 ?auto_79472 ) ) ( not ( = ?auto_79475 ?auto_79473 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79466 ?auto_79470 ?auto_79469 ?auto_79467 ?auto_79468 ?auto_79465 )
      ( DELIVER-5PKG-VERIFY ?auto_79466 ?auto_79467 ?auto_79468 ?auto_79469 ?auto_79470 ?auto_79465 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80344 - OBJ
      ?auto_80345 - OBJ
      ?auto_80346 - OBJ
      ?auto_80347 - OBJ
      ?auto_80348 - OBJ
      ?auto_80343 - LOCATION
    )
    :vars
    (
      ?auto_80353 - LOCATION
      ?auto_80355 - CITY
      ?auto_80352 - LOCATION
      ?auto_80349 - LOCATION
      ?auto_80350 - LOCATION
      ?auto_80351 - LOCATION
      ?auto_80354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80353 ?auto_80355 ) ( IN-CITY ?auto_80343 ?auto_80355 ) ( not ( = ?auto_80343 ?auto_80353 ) ) ( OBJ-AT ?auto_80348 ?auto_80353 ) ( IN-CITY ?auto_80352 ?auto_80355 ) ( not ( = ?auto_80343 ?auto_80352 ) ) ( OBJ-AT ?auto_80347 ?auto_80352 ) ( IN-CITY ?auto_80349 ?auto_80355 ) ( not ( = ?auto_80343 ?auto_80349 ) ) ( OBJ-AT ?auto_80346 ?auto_80349 ) ( IN-CITY ?auto_80350 ?auto_80355 ) ( not ( = ?auto_80343 ?auto_80350 ) ) ( OBJ-AT ?auto_80344 ?auto_80350 ) ( IN-CITY ?auto_80351 ?auto_80355 ) ( not ( = ?auto_80343 ?auto_80351 ) ) ( OBJ-AT ?auto_80345 ?auto_80351 ) ( TRUCK-AT ?auto_80354 ?auto_80343 ) ( not ( = ?auto_80345 ?auto_80344 ) ) ( not ( = ?auto_80350 ?auto_80351 ) ) ( not ( = ?auto_80345 ?auto_80346 ) ) ( not ( = ?auto_80344 ?auto_80346 ) ) ( not ( = ?auto_80349 ?auto_80350 ) ) ( not ( = ?auto_80349 ?auto_80351 ) ) ( not ( = ?auto_80345 ?auto_80347 ) ) ( not ( = ?auto_80344 ?auto_80347 ) ) ( not ( = ?auto_80346 ?auto_80347 ) ) ( not ( = ?auto_80352 ?auto_80349 ) ) ( not ( = ?auto_80352 ?auto_80350 ) ) ( not ( = ?auto_80352 ?auto_80351 ) ) ( not ( = ?auto_80345 ?auto_80348 ) ) ( not ( = ?auto_80344 ?auto_80348 ) ) ( not ( = ?auto_80346 ?auto_80348 ) ) ( not ( = ?auto_80347 ?auto_80348 ) ) ( not ( = ?auto_80353 ?auto_80352 ) ) ( not ( = ?auto_80353 ?auto_80349 ) ) ( not ( = ?auto_80353 ?auto_80350 ) ) ( not ( = ?auto_80353 ?auto_80351 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80345 ?auto_80344 ?auto_80346 ?auto_80348 ?auto_80347 ?auto_80343 )
      ( DELIVER-5PKG-VERIFY ?auto_80344 ?auto_80345 ?auto_80346 ?auto_80347 ?auto_80348 ?auto_80343 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80399 - OBJ
      ?auto_80400 - OBJ
      ?auto_80401 - OBJ
      ?auto_80402 - OBJ
      ?auto_80403 - OBJ
      ?auto_80398 - LOCATION
    )
    :vars
    (
      ?auto_80408 - LOCATION
      ?auto_80410 - CITY
      ?auto_80407 - LOCATION
      ?auto_80404 - LOCATION
      ?auto_80405 - LOCATION
      ?auto_80406 - LOCATION
      ?auto_80409 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80408 ?auto_80410 ) ( IN-CITY ?auto_80398 ?auto_80410 ) ( not ( = ?auto_80398 ?auto_80408 ) ) ( OBJ-AT ?auto_80402 ?auto_80408 ) ( IN-CITY ?auto_80407 ?auto_80410 ) ( not ( = ?auto_80398 ?auto_80407 ) ) ( OBJ-AT ?auto_80403 ?auto_80407 ) ( IN-CITY ?auto_80404 ?auto_80410 ) ( not ( = ?auto_80398 ?auto_80404 ) ) ( OBJ-AT ?auto_80401 ?auto_80404 ) ( IN-CITY ?auto_80405 ?auto_80410 ) ( not ( = ?auto_80398 ?auto_80405 ) ) ( OBJ-AT ?auto_80399 ?auto_80405 ) ( IN-CITY ?auto_80406 ?auto_80410 ) ( not ( = ?auto_80398 ?auto_80406 ) ) ( OBJ-AT ?auto_80400 ?auto_80406 ) ( TRUCK-AT ?auto_80409 ?auto_80398 ) ( not ( = ?auto_80400 ?auto_80399 ) ) ( not ( = ?auto_80405 ?auto_80406 ) ) ( not ( = ?auto_80400 ?auto_80401 ) ) ( not ( = ?auto_80399 ?auto_80401 ) ) ( not ( = ?auto_80404 ?auto_80405 ) ) ( not ( = ?auto_80404 ?auto_80406 ) ) ( not ( = ?auto_80400 ?auto_80403 ) ) ( not ( = ?auto_80399 ?auto_80403 ) ) ( not ( = ?auto_80401 ?auto_80403 ) ) ( not ( = ?auto_80407 ?auto_80404 ) ) ( not ( = ?auto_80407 ?auto_80405 ) ) ( not ( = ?auto_80407 ?auto_80406 ) ) ( not ( = ?auto_80400 ?auto_80402 ) ) ( not ( = ?auto_80399 ?auto_80402 ) ) ( not ( = ?auto_80401 ?auto_80402 ) ) ( not ( = ?auto_80403 ?auto_80402 ) ) ( not ( = ?auto_80408 ?auto_80407 ) ) ( not ( = ?auto_80408 ?auto_80404 ) ) ( not ( = ?auto_80408 ?auto_80405 ) ) ( not ( = ?auto_80408 ?auto_80406 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80400 ?auto_80399 ?auto_80401 ?auto_80402 ?auto_80403 ?auto_80398 )
      ( DELIVER-5PKG-VERIFY ?auto_80399 ?auto_80400 ?auto_80401 ?auto_80402 ?auto_80403 ?auto_80398 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80454 - OBJ
      ?auto_80455 - OBJ
      ?auto_80456 - OBJ
      ?auto_80457 - OBJ
      ?auto_80458 - OBJ
      ?auto_80453 - LOCATION
    )
    :vars
    (
      ?auto_80463 - LOCATION
      ?auto_80465 - CITY
      ?auto_80462 - LOCATION
      ?auto_80459 - LOCATION
      ?auto_80460 - LOCATION
      ?auto_80461 - LOCATION
      ?auto_80464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80463 ?auto_80465 ) ( IN-CITY ?auto_80453 ?auto_80465 ) ( not ( = ?auto_80453 ?auto_80463 ) ) ( OBJ-AT ?auto_80458 ?auto_80463 ) ( IN-CITY ?auto_80462 ?auto_80465 ) ( not ( = ?auto_80453 ?auto_80462 ) ) ( OBJ-AT ?auto_80456 ?auto_80462 ) ( IN-CITY ?auto_80459 ?auto_80465 ) ( not ( = ?auto_80453 ?auto_80459 ) ) ( OBJ-AT ?auto_80457 ?auto_80459 ) ( IN-CITY ?auto_80460 ?auto_80465 ) ( not ( = ?auto_80453 ?auto_80460 ) ) ( OBJ-AT ?auto_80454 ?auto_80460 ) ( IN-CITY ?auto_80461 ?auto_80465 ) ( not ( = ?auto_80453 ?auto_80461 ) ) ( OBJ-AT ?auto_80455 ?auto_80461 ) ( TRUCK-AT ?auto_80464 ?auto_80453 ) ( not ( = ?auto_80455 ?auto_80454 ) ) ( not ( = ?auto_80460 ?auto_80461 ) ) ( not ( = ?auto_80455 ?auto_80457 ) ) ( not ( = ?auto_80454 ?auto_80457 ) ) ( not ( = ?auto_80459 ?auto_80460 ) ) ( not ( = ?auto_80459 ?auto_80461 ) ) ( not ( = ?auto_80455 ?auto_80456 ) ) ( not ( = ?auto_80454 ?auto_80456 ) ) ( not ( = ?auto_80457 ?auto_80456 ) ) ( not ( = ?auto_80462 ?auto_80459 ) ) ( not ( = ?auto_80462 ?auto_80460 ) ) ( not ( = ?auto_80462 ?auto_80461 ) ) ( not ( = ?auto_80455 ?auto_80458 ) ) ( not ( = ?auto_80454 ?auto_80458 ) ) ( not ( = ?auto_80457 ?auto_80458 ) ) ( not ( = ?auto_80456 ?auto_80458 ) ) ( not ( = ?auto_80463 ?auto_80462 ) ) ( not ( = ?auto_80463 ?auto_80459 ) ) ( not ( = ?auto_80463 ?auto_80460 ) ) ( not ( = ?auto_80463 ?auto_80461 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80455 ?auto_80454 ?auto_80457 ?auto_80458 ?auto_80456 ?auto_80453 )
      ( DELIVER-5PKG-VERIFY ?auto_80454 ?auto_80455 ?auto_80456 ?auto_80457 ?auto_80458 ?auto_80453 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80509 - OBJ
      ?auto_80510 - OBJ
      ?auto_80511 - OBJ
      ?auto_80512 - OBJ
      ?auto_80513 - OBJ
      ?auto_80508 - LOCATION
    )
    :vars
    (
      ?auto_80518 - LOCATION
      ?auto_80520 - CITY
      ?auto_80517 - LOCATION
      ?auto_80514 - LOCATION
      ?auto_80515 - LOCATION
      ?auto_80516 - LOCATION
      ?auto_80519 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80518 ?auto_80520 ) ( IN-CITY ?auto_80508 ?auto_80520 ) ( not ( = ?auto_80508 ?auto_80518 ) ) ( OBJ-AT ?auto_80512 ?auto_80518 ) ( IN-CITY ?auto_80517 ?auto_80520 ) ( not ( = ?auto_80508 ?auto_80517 ) ) ( OBJ-AT ?auto_80511 ?auto_80517 ) ( IN-CITY ?auto_80514 ?auto_80520 ) ( not ( = ?auto_80508 ?auto_80514 ) ) ( OBJ-AT ?auto_80513 ?auto_80514 ) ( IN-CITY ?auto_80515 ?auto_80520 ) ( not ( = ?auto_80508 ?auto_80515 ) ) ( OBJ-AT ?auto_80509 ?auto_80515 ) ( IN-CITY ?auto_80516 ?auto_80520 ) ( not ( = ?auto_80508 ?auto_80516 ) ) ( OBJ-AT ?auto_80510 ?auto_80516 ) ( TRUCK-AT ?auto_80519 ?auto_80508 ) ( not ( = ?auto_80510 ?auto_80509 ) ) ( not ( = ?auto_80515 ?auto_80516 ) ) ( not ( = ?auto_80510 ?auto_80513 ) ) ( not ( = ?auto_80509 ?auto_80513 ) ) ( not ( = ?auto_80514 ?auto_80515 ) ) ( not ( = ?auto_80514 ?auto_80516 ) ) ( not ( = ?auto_80510 ?auto_80511 ) ) ( not ( = ?auto_80509 ?auto_80511 ) ) ( not ( = ?auto_80513 ?auto_80511 ) ) ( not ( = ?auto_80517 ?auto_80514 ) ) ( not ( = ?auto_80517 ?auto_80515 ) ) ( not ( = ?auto_80517 ?auto_80516 ) ) ( not ( = ?auto_80510 ?auto_80512 ) ) ( not ( = ?auto_80509 ?auto_80512 ) ) ( not ( = ?auto_80513 ?auto_80512 ) ) ( not ( = ?auto_80511 ?auto_80512 ) ) ( not ( = ?auto_80518 ?auto_80517 ) ) ( not ( = ?auto_80518 ?auto_80514 ) ) ( not ( = ?auto_80518 ?auto_80515 ) ) ( not ( = ?auto_80518 ?auto_80516 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80510 ?auto_80509 ?auto_80513 ?auto_80512 ?auto_80511 ?auto_80508 )
      ( DELIVER-5PKG-VERIFY ?auto_80509 ?auto_80510 ?auto_80511 ?auto_80512 ?auto_80513 ?auto_80508 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80738 - OBJ
      ?auto_80739 - OBJ
      ?auto_80740 - OBJ
      ?auto_80741 - OBJ
      ?auto_80742 - OBJ
      ?auto_80737 - LOCATION
    )
    :vars
    (
      ?auto_80747 - LOCATION
      ?auto_80749 - CITY
      ?auto_80746 - LOCATION
      ?auto_80743 - LOCATION
      ?auto_80744 - LOCATION
      ?auto_80745 - LOCATION
      ?auto_80748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80747 ?auto_80749 ) ( IN-CITY ?auto_80737 ?auto_80749 ) ( not ( = ?auto_80737 ?auto_80747 ) ) ( OBJ-AT ?auto_80740 ?auto_80747 ) ( IN-CITY ?auto_80746 ?auto_80749 ) ( not ( = ?auto_80737 ?auto_80746 ) ) ( OBJ-AT ?auto_80742 ?auto_80746 ) ( IN-CITY ?auto_80743 ?auto_80749 ) ( not ( = ?auto_80737 ?auto_80743 ) ) ( OBJ-AT ?auto_80741 ?auto_80743 ) ( IN-CITY ?auto_80744 ?auto_80749 ) ( not ( = ?auto_80737 ?auto_80744 ) ) ( OBJ-AT ?auto_80738 ?auto_80744 ) ( IN-CITY ?auto_80745 ?auto_80749 ) ( not ( = ?auto_80737 ?auto_80745 ) ) ( OBJ-AT ?auto_80739 ?auto_80745 ) ( TRUCK-AT ?auto_80748 ?auto_80737 ) ( not ( = ?auto_80739 ?auto_80738 ) ) ( not ( = ?auto_80744 ?auto_80745 ) ) ( not ( = ?auto_80739 ?auto_80741 ) ) ( not ( = ?auto_80738 ?auto_80741 ) ) ( not ( = ?auto_80743 ?auto_80744 ) ) ( not ( = ?auto_80743 ?auto_80745 ) ) ( not ( = ?auto_80739 ?auto_80742 ) ) ( not ( = ?auto_80738 ?auto_80742 ) ) ( not ( = ?auto_80741 ?auto_80742 ) ) ( not ( = ?auto_80746 ?auto_80743 ) ) ( not ( = ?auto_80746 ?auto_80744 ) ) ( not ( = ?auto_80746 ?auto_80745 ) ) ( not ( = ?auto_80739 ?auto_80740 ) ) ( not ( = ?auto_80738 ?auto_80740 ) ) ( not ( = ?auto_80741 ?auto_80740 ) ) ( not ( = ?auto_80742 ?auto_80740 ) ) ( not ( = ?auto_80747 ?auto_80746 ) ) ( not ( = ?auto_80747 ?auto_80743 ) ) ( not ( = ?auto_80747 ?auto_80744 ) ) ( not ( = ?auto_80747 ?auto_80745 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80739 ?auto_80738 ?auto_80741 ?auto_80740 ?auto_80742 ?auto_80737 )
      ( DELIVER-5PKG-VERIFY ?auto_80738 ?auto_80739 ?auto_80740 ?auto_80741 ?auto_80742 ?auto_80737 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80793 - OBJ
      ?auto_80794 - OBJ
      ?auto_80795 - OBJ
      ?auto_80796 - OBJ
      ?auto_80797 - OBJ
      ?auto_80792 - LOCATION
    )
    :vars
    (
      ?auto_80802 - LOCATION
      ?auto_80804 - CITY
      ?auto_80801 - LOCATION
      ?auto_80798 - LOCATION
      ?auto_80799 - LOCATION
      ?auto_80800 - LOCATION
      ?auto_80803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80802 ?auto_80804 ) ( IN-CITY ?auto_80792 ?auto_80804 ) ( not ( = ?auto_80792 ?auto_80802 ) ) ( OBJ-AT ?auto_80795 ?auto_80802 ) ( IN-CITY ?auto_80801 ?auto_80804 ) ( not ( = ?auto_80792 ?auto_80801 ) ) ( OBJ-AT ?auto_80796 ?auto_80801 ) ( IN-CITY ?auto_80798 ?auto_80804 ) ( not ( = ?auto_80792 ?auto_80798 ) ) ( OBJ-AT ?auto_80797 ?auto_80798 ) ( IN-CITY ?auto_80799 ?auto_80804 ) ( not ( = ?auto_80792 ?auto_80799 ) ) ( OBJ-AT ?auto_80793 ?auto_80799 ) ( IN-CITY ?auto_80800 ?auto_80804 ) ( not ( = ?auto_80792 ?auto_80800 ) ) ( OBJ-AT ?auto_80794 ?auto_80800 ) ( TRUCK-AT ?auto_80803 ?auto_80792 ) ( not ( = ?auto_80794 ?auto_80793 ) ) ( not ( = ?auto_80799 ?auto_80800 ) ) ( not ( = ?auto_80794 ?auto_80797 ) ) ( not ( = ?auto_80793 ?auto_80797 ) ) ( not ( = ?auto_80798 ?auto_80799 ) ) ( not ( = ?auto_80798 ?auto_80800 ) ) ( not ( = ?auto_80794 ?auto_80796 ) ) ( not ( = ?auto_80793 ?auto_80796 ) ) ( not ( = ?auto_80797 ?auto_80796 ) ) ( not ( = ?auto_80801 ?auto_80798 ) ) ( not ( = ?auto_80801 ?auto_80799 ) ) ( not ( = ?auto_80801 ?auto_80800 ) ) ( not ( = ?auto_80794 ?auto_80795 ) ) ( not ( = ?auto_80793 ?auto_80795 ) ) ( not ( = ?auto_80797 ?auto_80795 ) ) ( not ( = ?auto_80796 ?auto_80795 ) ) ( not ( = ?auto_80802 ?auto_80801 ) ) ( not ( = ?auto_80802 ?auto_80798 ) ) ( not ( = ?auto_80802 ?auto_80799 ) ) ( not ( = ?auto_80802 ?auto_80800 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80794 ?auto_80793 ?auto_80797 ?auto_80795 ?auto_80796 ?auto_80792 )
      ( DELIVER-5PKG-VERIFY ?auto_80793 ?auto_80794 ?auto_80795 ?auto_80796 ?auto_80797 ?auto_80792 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81853 - OBJ
      ?auto_81854 - OBJ
      ?auto_81855 - OBJ
      ?auto_81856 - OBJ
      ?auto_81857 - OBJ
      ?auto_81852 - LOCATION
    )
    :vars
    (
      ?auto_81862 - LOCATION
      ?auto_81864 - CITY
      ?auto_81861 - LOCATION
      ?auto_81858 - LOCATION
      ?auto_81859 - LOCATION
      ?auto_81860 - LOCATION
      ?auto_81863 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81862 ?auto_81864 ) ( IN-CITY ?auto_81852 ?auto_81864 ) ( not ( = ?auto_81852 ?auto_81862 ) ) ( OBJ-AT ?auto_81857 ?auto_81862 ) ( IN-CITY ?auto_81861 ?auto_81864 ) ( not ( = ?auto_81852 ?auto_81861 ) ) ( OBJ-AT ?auto_81856 ?auto_81861 ) ( IN-CITY ?auto_81858 ?auto_81864 ) ( not ( = ?auto_81852 ?auto_81858 ) ) ( OBJ-AT ?auto_81854 ?auto_81858 ) ( IN-CITY ?auto_81859 ?auto_81864 ) ( not ( = ?auto_81852 ?auto_81859 ) ) ( OBJ-AT ?auto_81853 ?auto_81859 ) ( IN-CITY ?auto_81860 ?auto_81864 ) ( not ( = ?auto_81852 ?auto_81860 ) ) ( OBJ-AT ?auto_81855 ?auto_81860 ) ( TRUCK-AT ?auto_81863 ?auto_81852 ) ( not ( = ?auto_81855 ?auto_81853 ) ) ( not ( = ?auto_81859 ?auto_81860 ) ) ( not ( = ?auto_81855 ?auto_81854 ) ) ( not ( = ?auto_81853 ?auto_81854 ) ) ( not ( = ?auto_81858 ?auto_81859 ) ) ( not ( = ?auto_81858 ?auto_81860 ) ) ( not ( = ?auto_81855 ?auto_81856 ) ) ( not ( = ?auto_81853 ?auto_81856 ) ) ( not ( = ?auto_81854 ?auto_81856 ) ) ( not ( = ?auto_81861 ?auto_81858 ) ) ( not ( = ?auto_81861 ?auto_81859 ) ) ( not ( = ?auto_81861 ?auto_81860 ) ) ( not ( = ?auto_81855 ?auto_81857 ) ) ( not ( = ?auto_81853 ?auto_81857 ) ) ( not ( = ?auto_81854 ?auto_81857 ) ) ( not ( = ?auto_81856 ?auto_81857 ) ) ( not ( = ?auto_81862 ?auto_81861 ) ) ( not ( = ?auto_81862 ?auto_81858 ) ) ( not ( = ?auto_81862 ?auto_81859 ) ) ( not ( = ?auto_81862 ?auto_81860 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81855 ?auto_81853 ?auto_81854 ?auto_81857 ?auto_81856 ?auto_81852 )
      ( DELIVER-5PKG-VERIFY ?auto_81853 ?auto_81854 ?auto_81855 ?auto_81856 ?auto_81857 ?auto_81852 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81908 - OBJ
      ?auto_81909 - OBJ
      ?auto_81910 - OBJ
      ?auto_81911 - OBJ
      ?auto_81912 - OBJ
      ?auto_81907 - LOCATION
    )
    :vars
    (
      ?auto_81917 - LOCATION
      ?auto_81919 - CITY
      ?auto_81916 - LOCATION
      ?auto_81913 - LOCATION
      ?auto_81914 - LOCATION
      ?auto_81915 - LOCATION
      ?auto_81918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81917 ?auto_81919 ) ( IN-CITY ?auto_81907 ?auto_81919 ) ( not ( = ?auto_81907 ?auto_81917 ) ) ( OBJ-AT ?auto_81911 ?auto_81917 ) ( IN-CITY ?auto_81916 ?auto_81919 ) ( not ( = ?auto_81907 ?auto_81916 ) ) ( OBJ-AT ?auto_81912 ?auto_81916 ) ( IN-CITY ?auto_81913 ?auto_81919 ) ( not ( = ?auto_81907 ?auto_81913 ) ) ( OBJ-AT ?auto_81909 ?auto_81913 ) ( IN-CITY ?auto_81914 ?auto_81919 ) ( not ( = ?auto_81907 ?auto_81914 ) ) ( OBJ-AT ?auto_81908 ?auto_81914 ) ( IN-CITY ?auto_81915 ?auto_81919 ) ( not ( = ?auto_81907 ?auto_81915 ) ) ( OBJ-AT ?auto_81910 ?auto_81915 ) ( TRUCK-AT ?auto_81918 ?auto_81907 ) ( not ( = ?auto_81910 ?auto_81908 ) ) ( not ( = ?auto_81914 ?auto_81915 ) ) ( not ( = ?auto_81910 ?auto_81909 ) ) ( not ( = ?auto_81908 ?auto_81909 ) ) ( not ( = ?auto_81913 ?auto_81914 ) ) ( not ( = ?auto_81913 ?auto_81915 ) ) ( not ( = ?auto_81910 ?auto_81912 ) ) ( not ( = ?auto_81908 ?auto_81912 ) ) ( not ( = ?auto_81909 ?auto_81912 ) ) ( not ( = ?auto_81916 ?auto_81913 ) ) ( not ( = ?auto_81916 ?auto_81914 ) ) ( not ( = ?auto_81916 ?auto_81915 ) ) ( not ( = ?auto_81910 ?auto_81911 ) ) ( not ( = ?auto_81908 ?auto_81911 ) ) ( not ( = ?auto_81909 ?auto_81911 ) ) ( not ( = ?auto_81912 ?auto_81911 ) ) ( not ( = ?auto_81917 ?auto_81916 ) ) ( not ( = ?auto_81917 ?auto_81913 ) ) ( not ( = ?auto_81917 ?auto_81914 ) ) ( not ( = ?auto_81917 ?auto_81915 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81910 ?auto_81908 ?auto_81909 ?auto_81911 ?auto_81912 ?auto_81907 )
      ( DELIVER-5PKG-VERIFY ?auto_81908 ?auto_81909 ?auto_81910 ?auto_81911 ?auto_81912 ?auto_81907 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82197 - OBJ
      ?auto_82198 - OBJ
      ?auto_82199 - OBJ
      ?auto_82200 - OBJ
      ?auto_82201 - OBJ
      ?auto_82196 - LOCATION
    )
    :vars
    (
      ?auto_82206 - LOCATION
      ?auto_82208 - CITY
      ?auto_82205 - LOCATION
      ?auto_82202 - LOCATION
      ?auto_82203 - LOCATION
      ?auto_82204 - LOCATION
      ?auto_82207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82206 ?auto_82208 ) ( IN-CITY ?auto_82196 ?auto_82208 ) ( not ( = ?auto_82196 ?auto_82206 ) ) ( OBJ-AT ?auto_82201 ?auto_82206 ) ( IN-CITY ?auto_82205 ?auto_82208 ) ( not ( = ?auto_82196 ?auto_82205 ) ) ( OBJ-AT ?auto_82199 ?auto_82205 ) ( IN-CITY ?auto_82202 ?auto_82208 ) ( not ( = ?auto_82196 ?auto_82202 ) ) ( OBJ-AT ?auto_82198 ?auto_82202 ) ( IN-CITY ?auto_82203 ?auto_82208 ) ( not ( = ?auto_82196 ?auto_82203 ) ) ( OBJ-AT ?auto_82197 ?auto_82203 ) ( IN-CITY ?auto_82204 ?auto_82208 ) ( not ( = ?auto_82196 ?auto_82204 ) ) ( OBJ-AT ?auto_82200 ?auto_82204 ) ( TRUCK-AT ?auto_82207 ?auto_82196 ) ( not ( = ?auto_82200 ?auto_82197 ) ) ( not ( = ?auto_82203 ?auto_82204 ) ) ( not ( = ?auto_82200 ?auto_82198 ) ) ( not ( = ?auto_82197 ?auto_82198 ) ) ( not ( = ?auto_82202 ?auto_82203 ) ) ( not ( = ?auto_82202 ?auto_82204 ) ) ( not ( = ?auto_82200 ?auto_82199 ) ) ( not ( = ?auto_82197 ?auto_82199 ) ) ( not ( = ?auto_82198 ?auto_82199 ) ) ( not ( = ?auto_82205 ?auto_82202 ) ) ( not ( = ?auto_82205 ?auto_82203 ) ) ( not ( = ?auto_82205 ?auto_82204 ) ) ( not ( = ?auto_82200 ?auto_82201 ) ) ( not ( = ?auto_82197 ?auto_82201 ) ) ( not ( = ?auto_82198 ?auto_82201 ) ) ( not ( = ?auto_82199 ?auto_82201 ) ) ( not ( = ?auto_82206 ?auto_82205 ) ) ( not ( = ?auto_82206 ?auto_82202 ) ) ( not ( = ?auto_82206 ?auto_82203 ) ) ( not ( = ?auto_82206 ?auto_82204 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82200 ?auto_82197 ?auto_82198 ?auto_82201 ?auto_82199 ?auto_82196 )
      ( DELIVER-5PKG-VERIFY ?auto_82197 ?auto_82198 ?auto_82199 ?auto_82200 ?auto_82201 ?auto_82196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82252 - OBJ
      ?auto_82253 - OBJ
      ?auto_82254 - OBJ
      ?auto_82255 - OBJ
      ?auto_82256 - OBJ
      ?auto_82251 - LOCATION
    )
    :vars
    (
      ?auto_82261 - LOCATION
      ?auto_82263 - CITY
      ?auto_82260 - LOCATION
      ?auto_82257 - LOCATION
      ?auto_82258 - LOCATION
      ?auto_82259 - LOCATION
      ?auto_82262 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82261 ?auto_82263 ) ( IN-CITY ?auto_82251 ?auto_82263 ) ( not ( = ?auto_82251 ?auto_82261 ) ) ( OBJ-AT ?auto_82255 ?auto_82261 ) ( IN-CITY ?auto_82260 ?auto_82263 ) ( not ( = ?auto_82251 ?auto_82260 ) ) ( OBJ-AT ?auto_82254 ?auto_82260 ) ( IN-CITY ?auto_82257 ?auto_82263 ) ( not ( = ?auto_82251 ?auto_82257 ) ) ( OBJ-AT ?auto_82253 ?auto_82257 ) ( IN-CITY ?auto_82258 ?auto_82263 ) ( not ( = ?auto_82251 ?auto_82258 ) ) ( OBJ-AT ?auto_82252 ?auto_82258 ) ( IN-CITY ?auto_82259 ?auto_82263 ) ( not ( = ?auto_82251 ?auto_82259 ) ) ( OBJ-AT ?auto_82256 ?auto_82259 ) ( TRUCK-AT ?auto_82262 ?auto_82251 ) ( not ( = ?auto_82256 ?auto_82252 ) ) ( not ( = ?auto_82258 ?auto_82259 ) ) ( not ( = ?auto_82256 ?auto_82253 ) ) ( not ( = ?auto_82252 ?auto_82253 ) ) ( not ( = ?auto_82257 ?auto_82258 ) ) ( not ( = ?auto_82257 ?auto_82259 ) ) ( not ( = ?auto_82256 ?auto_82254 ) ) ( not ( = ?auto_82252 ?auto_82254 ) ) ( not ( = ?auto_82253 ?auto_82254 ) ) ( not ( = ?auto_82260 ?auto_82257 ) ) ( not ( = ?auto_82260 ?auto_82258 ) ) ( not ( = ?auto_82260 ?auto_82259 ) ) ( not ( = ?auto_82256 ?auto_82255 ) ) ( not ( = ?auto_82252 ?auto_82255 ) ) ( not ( = ?auto_82253 ?auto_82255 ) ) ( not ( = ?auto_82254 ?auto_82255 ) ) ( not ( = ?auto_82261 ?auto_82260 ) ) ( not ( = ?auto_82261 ?auto_82257 ) ) ( not ( = ?auto_82261 ?auto_82258 ) ) ( not ( = ?auto_82261 ?auto_82259 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82256 ?auto_82252 ?auto_82253 ?auto_82255 ?auto_82254 ?auto_82251 )
      ( DELIVER-5PKG-VERIFY ?auto_82252 ?auto_82253 ?auto_82254 ?auto_82255 ?auto_82256 ?auto_82251 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82363 - OBJ
      ?auto_82364 - OBJ
      ?auto_82365 - OBJ
      ?auto_82366 - OBJ
      ?auto_82367 - OBJ
      ?auto_82362 - LOCATION
    )
    :vars
    (
      ?auto_82372 - LOCATION
      ?auto_82374 - CITY
      ?auto_82371 - LOCATION
      ?auto_82368 - LOCATION
      ?auto_82369 - LOCATION
      ?auto_82370 - LOCATION
      ?auto_82373 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82372 ?auto_82374 ) ( IN-CITY ?auto_82362 ?auto_82374 ) ( not ( = ?auto_82362 ?auto_82372 ) ) ( OBJ-AT ?auto_82365 ?auto_82372 ) ( IN-CITY ?auto_82371 ?auto_82374 ) ( not ( = ?auto_82362 ?auto_82371 ) ) ( OBJ-AT ?auto_82367 ?auto_82371 ) ( IN-CITY ?auto_82368 ?auto_82374 ) ( not ( = ?auto_82362 ?auto_82368 ) ) ( OBJ-AT ?auto_82364 ?auto_82368 ) ( IN-CITY ?auto_82369 ?auto_82374 ) ( not ( = ?auto_82362 ?auto_82369 ) ) ( OBJ-AT ?auto_82363 ?auto_82369 ) ( IN-CITY ?auto_82370 ?auto_82374 ) ( not ( = ?auto_82362 ?auto_82370 ) ) ( OBJ-AT ?auto_82366 ?auto_82370 ) ( TRUCK-AT ?auto_82373 ?auto_82362 ) ( not ( = ?auto_82366 ?auto_82363 ) ) ( not ( = ?auto_82369 ?auto_82370 ) ) ( not ( = ?auto_82366 ?auto_82364 ) ) ( not ( = ?auto_82363 ?auto_82364 ) ) ( not ( = ?auto_82368 ?auto_82369 ) ) ( not ( = ?auto_82368 ?auto_82370 ) ) ( not ( = ?auto_82366 ?auto_82367 ) ) ( not ( = ?auto_82363 ?auto_82367 ) ) ( not ( = ?auto_82364 ?auto_82367 ) ) ( not ( = ?auto_82371 ?auto_82368 ) ) ( not ( = ?auto_82371 ?auto_82369 ) ) ( not ( = ?auto_82371 ?auto_82370 ) ) ( not ( = ?auto_82366 ?auto_82365 ) ) ( not ( = ?auto_82363 ?auto_82365 ) ) ( not ( = ?auto_82364 ?auto_82365 ) ) ( not ( = ?auto_82367 ?auto_82365 ) ) ( not ( = ?auto_82372 ?auto_82371 ) ) ( not ( = ?auto_82372 ?auto_82368 ) ) ( not ( = ?auto_82372 ?auto_82369 ) ) ( not ( = ?auto_82372 ?auto_82370 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82366 ?auto_82363 ?auto_82364 ?auto_82365 ?auto_82367 ?auto_82362 )
      ( DELIVER-5PKG-VERIFY ?auto_82363 ?auto_82364 ?auto_82365 ?auto_82366 ?auto_82367 ?auto_82362 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82536 - OBJ
      ?auto_82537 - OBJ
      ?auto_82538 - OBJ
      ?auto_82539 - OBJ
      ?auto_82540 - OBJ
      ?auto_82535 - LOCATION
    )
    :vars
    (
      ?auto_82545 - LOCATION
      ?auto_82547 - CITY
      ?auto_82544 - LOCATION
      ?auto_82541 - LOCATION
      ?auto_82542 - LOCATION
      ?auto_82543 - LOCATION
      ?auto_82546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82545 ?auto_82547 ) ( IN-CITY ?auto_82535 ?auto_82547 ) ( not ( = ?auto_82535 ?auto_82545 ) ) ( OBJ-AT ?auto_82538 ?auto_82545 ) ( IN-CITY ?auto_82544 ?auto_82547 ) ( not ( = ?auto_82535 ?auto_82544 ) ) ( OBJ-AT ?auto_82539 ?auto_82544 ) ( IN-CITY ?auto_82541 ?auto_82547 ) ( not ( = ?auto_82535 ?auto_82541 ) ) ( OBJ-AT ?auto_82537 ?auto_82541 ) ( IN-CITY ?auto_82542 ?auto_82547 ) ( not ( = ?auto_82535 ?auto_82542 ) ) ( OBJ-AT ?auto_82536 ?auto_82542 ) ( IN-CITY ?auto_82543 ?auto_82547 ) ( not ( = ?auto_82535 ?auto_82543 ) ) ( OBJ-AT ?auto_82540 ?auto_82543 ) ( TRUCK-AT ?auto_82546 ?auto_82535 ) ( not ( = ?auto_82540 ?auto_82536 ) ) ( not ( = ?auto_82542 ?auto_82543 ) ) ( not ( = ?auto_82540 ?auto_82537 ) ) ( not ( = ?auto_82536 ?auto_82537 ) ) ( not ( = ?auto_82541 ?auto_82542 ) ) ( not ( = ?auto_82541 ?auto_82543 ) ) ( not ( = ?auto_82540 ?auto_82539 ) ) ( not ( = ?auto_82536 ?auto_82539 ) ) ( not ( = ?auto_82537 ?auto_82539 ) ) ( not ( = ?auto_82544 ?auto_82541 ) ) ( not ( = ?auto_82544 ?auto_82542 ) ) ( not ( = ?auto_82544 ?auto_82543 ) ) ( not ( = ?auto_82540 ?auto_82538 ) ) ( not ( = ?auto_82536 ?auto_82538 ) ) ( not ( = ?auto_82537 ?auto_82538 ) ) ( not ( = ?auto_82539 ?auto_82538 ) ) ( not ( = ?auto_82545 ?auto_82544 ) ) ( not ( = ?auto_82545 ?auto_82541 ) ) ( not ( = ?auto_82545 ?auto_82542 ) ) ( not ( = ?auto_82545 ?auto_82543 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82540 ?auto_82536 ?auto_82537 ?auto_82538 ?auto_82539 ?auto_82535 )
      ( DELIVER-5PKG-VERIFY ?auto_82536 ?auto_82537 ?auto_82538 ?auto_82539 ?auto_82540 ?auto_82535 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82706 - OBJ
      ?auto_82707 - OBJ
      ?auto_82708 - OBJ
      ?auto_82709 - OBJ
      ?auto_82710 - OBJ
      ?auto_82705 - LOCATION
    )
    :vars
    (
      ?auto_82715 - LOCATION
      ?auto_82717 - CITY
      ?auto_82714 - LOCATION
      ?auto_82711 - LOCATION
      ?auto_82712 - LOCATION
      ?auto_82713 - LOCATION
      ?auto_82716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82715 ?auto_82717 ) ( IN-CITY ?auto_82705 ?auto_82717 ) ( not ( = ?auto_82705 ?auto_82715 ) ) ( OBJ-AT ?auto_82710 ?auto_82715 ) ( IN-CITY ?auto_82714 ?auto_82717 ) ( not ( = ?auto_82705 ?auto_82714 ) ) ( OBJ-AT ?auto_82707 ?auto_82714 ) ( IN-CITY ?auto_82711 ?auto_82717 ) ( not ( = ?auto_82705 ?auto_82711 ) ) ( OBJ-AT ?auto_82709 ?auto_82711 ) ( IN-CITY ?auto_82712 ?auto_82717 ) ( not ( = ?auto_82705 ?auto_82712 ) ) ( OBJ-AT ?auto_82706 ?auto_82712 ) ( IN-CITY ?auto_82713 ?auto_82717 ) ( not ( = ?auto_82705 ?auto_82713 ) ) ( OBJ-AT ?auto_82708 ?auto_82713 ) ( TRUCK-AT ?auto_82716 ?auto_82705 ) ( not ( = ?auto_82708 ?auto_82706 ) ) ( not ( = ?auto_82712 ?auto_82713 ) ) ( not ( = ?auto_82708 ?auto_82709 ) ) ( not ( = ?auto_82706 ?auto_82709 ) ) ( not ( = ?auto_82711 ?auto_82712 ) ) ( not ( = ?auto_82711 ?auto_82713 ) ) ( not ( = ?auto_82708 ?auto_82707 ) ) ( not ( = ?auto_82706 ?auto_82707 ) ) ( not ( = ?auto_82709 ?auto_82707 ) ) ( not ( = ?auto_82714 ?auto_82711 ) ) ( not ( = ?auto_82714 ?auto_82712 ) ) ( not ( = ?auto_82714 ?auto_82713 ) ) ( not ( = ?auto_82708 ?auto_82710 ) ) ( not ( = ?auto_82706 ?auto_82710 ) ) ( not ( = ?auto_82709 ?auto_82710 ) ) ( not ( = ?auto_82707 ?auto_82710 ) ) ( not ( = ?auto_82715 ?auto_82714 ) ) ( not ( = ?auto_82715 ?auto_82711 ) ) ( not ( = ?auto_82715 ?auto_82712 ) ) ( not ( = ?auto_82715 ?auto_82713 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82708 ?auto_82706 ?auto_82709 ?auto_82710 ?auto_82707 ?auto_82705 )
      ( DELIVER-5PKG-VERIFY ?auto_82706 ?auto_82707 ?auto_82708 ?auto_82709 ?auto_82710 ?auto_82705 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82761 - OBJ
      ?auto_82762 - OBJ
      ?auto_82763 - OBJ
      ?auto_82764 - OBJ
      ?auto_82765 - OBJ
      ?auto_82760 - LOCATION
    )
    :vars
    (
      ?auto_82770 - LOCATION
      ?auto_82772 - CITY
      ?auto_82769 - LOCATION
      ?auto_82766 - LOCATION
      ?auto_82767 - LOCATION
      ?auto_82768 - LOCATION
      ?auto_82771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82770 ?auto_82772 ) ( IN-CITY ?auto_82760 ?auto_82772 ) ( not ( = ?auto_82760 ?auto_82770 ) ) ( OBJ-AT ?auto_82764 ?auto_82770 ) ( IN-CITY ?auto_82769 ?auto_82772 ) ( not ( = ?auto_82760 ?auto_82769 ) ) ( OBJ-AT ?auto_82762 ?auto_82769 ) ( IN-CITY ?auto_82766 ?auto_82772 ) ( not ( = ?auto_82760 ?auto_82766 ) ) ( OBJ-AT ?auto_82765 ?auto_82766 ) ( IN-CITY ?auto_82767 ?auto_82772 ) ( not ( = ?auto_82760 ?auto_82767 ) ) ( OBJ-AT ?auto_82761 ?auto_82767 ) ( IN-CITY ?auto_82768 ?auto_82772 ) ( not ( = ?auto_82760 ?auto_82768 ) ) ( OBJ-AT ?auto_82763 ?auto_82768 ) ( TRUCK-AT ?auto_82771 ?auto_82760 ) ( not ( = ?auto_82763 ?auto_82761 ) ) ( not ( = ?auto_82767 ?auto_82768 ) ) ( not ( = ?auto_82763 ?auto_82765 ) ) ( not ( = ?auto_82761 ?auto_82765 ) ) ( not ( = ?auto_82766 ?auto_82767 ) ) ( not ( = ?auto_82766 ?auto_82768 ) ) ( not ( = ?auto_82763 ?auto_82762 ) ) ( not ( = ?auto_82761 ?auto_82762 ) ) ( not ( = ?auto_82765 ?auto_82762 ) ) ( not ( = ?auto_82769 ?auto_82766 ) ) ( not ( = ?auto_82769 ?auto_82767 ) ) ( not ( = ?auto_82769 ?auto_82768 ) ) ( not ( = ?auto_82763 ?auto_82764 ) ) ( not ( = ?auto_82761 ?auto_82764 ) ) ( not ( = ?auto_82765 ?auto_82764 ) ) ( not ( = ?auto_82762 ?auto_82764 ) ) ( not ( = ?auto_82770 ?auto_82769 ) ) ( not ( = ?auto_82770 ?auto_82766 ) ) ( not ( = ?auto_82770 ?auto_82767 ) ) ( not ( = ?auto_82770 ?auto_82768 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82763 ?auto_82761 ?auto_82765 ?auto_82764 ?auto_82762 ?auto_82760 )
      ( DELIVER-5PKG-VERIFY ?auto_82761 ?auto_82762 ?auto_82763 ?auto_82764 ?auto_82765 ?auto_82760 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82933 - OBJ
      ?auto_82934 - OBJ
      ?auto_82935 - OBJ
      ?auto_82936 - OBJ
      ?auto_82937 - OBJ
      ?auto_82932 - LOCATION
    )
    :vars
    (
      ?auto_82942 - LOCATION
      ?auto_82944 - CITY
      ?auto_82941 - LOCATION
      ?auto_82938 - LOCATION
      ?auto_82939 - LOCATION
      ?auto_82940 - LOCATION
      ?auto_82943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82942 ?auto_82944 ) ( IN-CITY ?auto_82932 ?auto_82944 ) ( not ( = ?auto_82932 ?auto_82942 ) ) ( OBJ-AT ?auto_82937 ?auto_82942 ) ( IN-CITY ?auto_82941 ?auto_82944 ) ( not ( = ?auto_82932 ?auto_82941 ) ) ( OBJ-AT ?auto_82934 ?auto_82941 ) ( IN-CITY ?auto_82938 ?auto_82944 ) ( not ( = ?auto_82932 ?auto_82938 ) ) ( OBJ-AT ?auto_82935 ?auto_82938 ) ( IN-CITY ?auto_82939 ?auto_82944 ) ( not ( = ?auto_82932 ?auto_82939 ) ) ( OBJ-AT ?auto_82933 ?auto_82939 ) ( IN-CITY ?auto_82940 ?auto_82944 ) ( not ( = ?auto_82932 ?auto_82940 ) ) ( OBJ-AT ?auto_82936 ?auto_82940 ) ( TRUCK-AT ?auto_82943 ?auto_82932 ) ( not ( = ?auto_82936 ?auto_82933 ) ) ( not ( = ?auto_82939 ?auto_82940 ) ) ( not ( = ?auto_82936 ?auto_82935 ) ) ( not ( = ?auto_82933 ?auto_82935 ) ) ( not ( = ?auto_82938 ?auto_82939 ) ) ( not ( = ?auto_82938 ?auto_82940 ) ) ( not ( = ?auto_82936 ?auto_82934 ) ) ( not ( = ?auto_82933 ?auto_82934 ) ) ( not ( = ?auto_82935 ?auto_82934 ) ) ( not ( = ?auto_82941 ?auto_82938 ) ) ( not ( = ?auto_82941 ?auto_82939 ) ) ( not ( = ?auto_82941 ?auto_82940 ) ) ( not ( = ?auto_82936 ?auto_82937 ) ) ( not ( = ?auto_82933 ?auto_82937 ) ) ( not ( = ?auto_82935 ?auto_82937 ) ) ( not ( = ?auto_82934 ?auto_82937 ) ) ( not ( = ?auto_82942 ?auto_82941 ) ) ( not ( = ?auto_82942 ?auto_82938 ) ) ( not ( = ?auto_82942 ?auto_82939 ) ) ( not ( = ?auto_82942 ?auto_82940 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82936 ?auto_82933 ?auto_82935 ?auto_82937 ?auto_82934 ?auto_82932 )
      ( DELIVER-5PKG-VERIFY ?auto_82933 ?auto_82934 ?auto_82935 ?auto_82936 ?auto_82937 ?auto_82932 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82988 - OBJ
      ?auto_82989 - OBJ
      ?auto_82990 - OBJ
      ?auto_82991 - OBJ
      ?auto_82992 - OBJ
      ?auto_82987 - LOCATION
    )
    :vars
    (
      ?auto_82997 - LOCATION
      ?auto_82999 - CITY
      ?auto_82996 - LOCATION
      ?auto_82993 - LOCATION
      ?auto_82994 - LOCATION
      ?auto_82995 - LOCATION
      ?auto_82998 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82997 ?auto_82999 ) ( IN-CITY ?auto_82987 ?auto_82999 ) ( not ( = ?auto_82987 ?auto_82997 ) ) ( OBJ-AT ?auto_82991 ?auto_82997 ) ( IN-CITY ?auto_82996 ?auto_82999 ) ( not ( = ?auto_82987 ?auto_82996 ) ) ( OBJ-AT ?auto_82989 ?auto_82996 ) ( IN-CITY ?auto_82993 ?auto_82999 ) ( not ( = ?auto_82987 ?auto_82993 ) ) ( OBJ-AT ?auto_82990 ?auto_82993 ) ( IN-CITY ?auto_82994 ?auto_82999 ) ( not ( = ?auto_82987 ?auto_82994 ) ) ( OBJ-AT ?auto_82988 ?auto_82994 ) ( IN-CITY ?auto_82995 ?auto_82999 ) ( not ( = ?auto_82987 ?auto_82995 ) ) ( OBJ-AT ?auto_82992 ?auto_82995 ) ( TRUCK-AT ?auto_82998 ?auto_82987 ) ( not ( = ?auto_82992 ?auto_82988 ) ) ( not ( = ?auto_82994 ?auto_82995 ) ) ( not ( = ?auto_82992 ?auto_82990 ) ) ( not ( = ?auto_82988 ?auto_82990 ) ) ( not ( = ?auto_82993 ?auto_82994 ) ) ( not ( = ?auto_82993 ?auto_82995 ) ) ( not ( = ?auto_82992 ?auto_82989 ) ) ( not ( = ?auto_82988 ?auto_82989 ) ) ( not ( = ?auto_82990 ?auto_82989 ) ) ( not ( = ?auto_82996 ?auto_82993 ) ) ( not ( = ?auto_82996 ?auto_82994 ) ) ( not ( = ?auto_82996 ?auto_82995 ) ) ( not ( = ?auto_82992 ?auto_82991 ) ) ( not ( = ?auto_82988 ?auto_82991 ) ) ( not ( = ?auto_82990 ?auto_82991 ) ) ( not ( = ?auto_82989 ?auto_82991 ) ) ( not ( = ?auto_82997 ?auto_82996 ) ) ( not ( = ?auto_82997 ?auto_82993 ) ) ( not ( = ?auto_82997 ?auto_82994 ) ) ( not ( = ?auto_82997 ?auto_82995 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82992 ?auto_82988 ?auto_82990 ?auto_82991 ?auto_82989 ?auto_82987 )
      ( DELIVER-5PKG-VERIFY ?auto_82988 ?auto_82989 ?auto_82990 ?auto_82991 ?auto_82992 ?auto_82987 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83216 - OBJ
      ?auto_83217 - OBJ
      ?auto_83218 - OBJ
      ?auto_83219 - OBJ
      ?auto_83220 - OBJ
      ?auto_83215 - LOCATION
    )
    :vars
    (
      ?auto_83225 - LOCATION
      ?auto_83227 - CITY
      ?auto_83224 - LOCATION
      ?auto_83221 - LOCATION
      ?auto_83222 - LOCATION
      ?auto_83223 - LOCATION
      ?auto_83226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83225 ?auto_83227 ) ( IN-CITY ?auto_83215 ?auto_83227 ) ( not ( = ?auto_83215 ?auto_83225 ) ) ( OBJ-AT ?auto_83218 ?auto_83225 ) ( IN-CITY ?auto_83224 ?auto_83227 ) ( not ( = ?auto_83215 ?auto_83224 ) ) ( OBJ-AT ?auto_83217 ?auto_83224 ) ( IN-CITY ?auto_83221 ?auto_83227 ) ( not ( = ?auto_83215 ?auto_83221 ) ) ( OBJ-AT ?auto_83220 ?auto_83221 ) ( IN-CITY ?auto_83222 ?auto_83227 ) ( not ( = ?auto_83215 ?auto_83222 ) ) ( OBJ-AT ?auto_83216 ?auto_83222 ) ( IN-CITY ?auto_83223 ?auto_83227 ) ( not ( = ?auto_83215 ?auto_83223 ) ) ( OBJ-AT ?auto_83219 ?auto_83223 ) ( TRUCK-AT ?auto_83226 ?auto_83215 ) ( not ( = ?auto_83219 ?auto_83216 ) ) ( not ( = ?auto_83222 ?auto_83223 ) ) ( not ( = ?auto_83219 ?auto_83220 ) ) ( not ( = ?auto_83216 ?auto_83220 ) ) ( not ( = ?auto_83221 ?auto_83222 ) ) ( not ( = ?auto_83221 ?auto_83223 ) ) ( not ( = ?auto_83219 ?auto_83217 ) ) ( not ( = ?auto_83216 ?auto_83217 ) ) ( not ( = ?auto_83220 ?auto_83217 ) ) ( not ( = ?auto_83224 ?auto_83221 ) ) ( not ( = ?auto_83224 ?auto_83222 ) ) ( not ( = ?auto_83224 ?auto_83223 ) ) ( not ( = ?auto_83219 ?auto_83218 ) ) ( not ( = ?auto_83216 ?auto_83218 ) ) ( not ( = ?auto_83220 ?auto_83218 ) ) ( not ( = ?auto_83217 ?auto_83218 ) ) ( not ( = ?auto_83225 ?auto_83224 ) ) ( not ( = ?auto_83225 ?auto_83221 ) ) ( not ( = ?auto_83225 ?auto_83222 ) ) ( not ( = ?auto_83225 ?auto_83223 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83219 ?auto_83216 ?auto_83220 ?auto_83218 ?auto_83217 ?auto_83215 )
      ( DELIVER-5PKG-VERIFY ?auto_83216 ?auto_83217 ?auto_83218 ?auto_83219 ?auto_83220 ?auto_83215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83330 - OBJ
      ?auto_83331 - OBJ
      ?auto_83332 - OBJ
      ?auto_83333 - OBJ
      ?auto_83334 - OBJ
      ?auto_83329 - LOCATION
    )
    :vars
    (
      ?auto_83339 - LOCATION
      ?auto_83341 - CITY
      ?auto_83338 - LOCATION
      ?auto_83335 - LOCATION
      ?auto_83336 - LOCATION
      ?auto_83337 - LOCATION
      ?auto_83340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83339 ?auto_83341 ) ( IN-CITY ?auto_83329 ?auto_83341 ) ( not ( = ?auto_83329 ?auto_83339 ) ) ( OBJ-AT ?auto_83332 ?auto_83339 ) ( IN-CITY ?auto_83338 ?auto_83341 ) ( not ( = ?auto_83329 ?auto_83338 ) ) ( OBJ-AT ?auto_83331 ?auto_83338 ) ( IN-CITY ?auto_83335 ?auto_83341 ) ( not ( = ?auto_83329 ?auto_83335 ) ) ( OBJ-AT ?auto_83333 ?auto_83335 ) ( IN-CITY ?auto_83336 ?auto_83341 ) ( not ( = ?auto_83329 ?auto_83336 ) ) ( OBJ-AT ?auto_83330 ?auto_83336 ) ( IN-CITY ?auto_83337 ?auto_83341 ) ( not ( = ?auto_83329 ?auto_83337 ) ) ( OBJ-AT ?auto_83334 ?auto_83337 ) ( TRUCK-AT ?auto_83340 ?auto_83329 ) ( not ( = ?auto_83334 ?auto_83330 ) ) ( not ( = ?auto_83336 ?auto_83337 ) ) ( not ( = ?auto_83334 ?auto_83333 ) ) ( not ( = ?auto_83330 ?auto_83333 ) ) ( not ( = ?auto_83335 ?auto_83336 ) ) ( not ( = ?auto_83335 ?auto_83337 ) ) ( not ( = ?auto_83334 ?auto_83331 ) ) ( not ( = ?auto_83330 ?auto_83331 ) ) ( not ( = ?auto_83333 ?auto_83331 ) ) ( not ( = ?auto_83338 ?auto_83335 ) ) ( not ( = ?auto_83338 ?auto_83336 ) ) ( not ( = ?auto_83338 ?auto_83337 ) ) ( not ( = ?auto_83334 ?auto_83332 ) ) ( not ( = ?auto_83330 ?auto_83332 ) ) ( not ( = ?auto_83333 ?auto_83332 ) ) ( not ( = ?auto_83331 ?auto_83332 ) ) ( not ( = ?auto_83339 ?auto_83338 ) ) ( not ( = ?auto_83339 ?auto_83335 ) ) ( not ( = ?auto_83339 ?auto_83336 ) ) ( not ( = ?auto_83339 ?auto_83337 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83334 ?auto_83330 ?auto_83333 ?auto_83332 ?auto_83331 ?auto_83329 )
      ( DELIVER-5PKG-VERIFY ?auto_83330 ?auto_83331 ?auto_83332 ?auto_83333 ?auto_83334 ?auto_83329 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83733 - OBJ
      ?auto_83734 - OBJ
      ?auto_83735 - OBJ
      ?auto_83736 - OBJ
      ?auto_83737 - OBJ
      ?auto_83732 - LOCATION
    )
    :vars
    (
      ?auto_83742 - LOCATION
      ?auto_83744 - CITY
      ?auto_83741 - LOCATION
      ?auto_83738 - LOCATION
      ?auto_83739 - LOCATION
      ?auto_83740 - LOCATION
      ?auto_83743 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83742 ?auto_83744 ) ( IN-CITY ?auto_83732 ?auto_83744 ) ( not ( = ?auto_83732 ?auto_83742 ) ) ( OBJ-AT ?auto_83734 ?auto_83742 ) ( IN-CITY ?auto_83741 ?auto_83744 ) ( not ( = ?auto_83732 ?auto_83741 ) ) ( OBJ-AT ?auto_83737 ?auto_83741 ) ( IN-CITY ?auto_83738 ?auto_83744 ) ( not ( = ?auto_83732 ?auto_83738 ) ) ( OBJ-AT ?auto_83736 ?auto_83738 ) ( IN-CITY ?auto_83739 ?auto_83744 ) ( not ( = ?auto_83732 ?auto_83739 ) ) ( OBJ-AT ?auto_83733 ?auto_83739 ) ( IN-CITY ?auto_83740 ?auto_83744 ) ( not ( = ?auto_83732 ?auto_83740 ) ) ( OBJ-AT ?auto_83735 ?auto_83740 ) ( TRUCK-AT ?auto_83743 ?auto_83732 ) ( not ( = ?auto_83735 ?auto_83733 ) ) ( not ( = ?auto_83739 ?auto_83740 ) ) ( not ( = ?auto_83735 ?auto_83736 ) ) ( not ( = ?auto_83733 ?auto_83736 ) ) ( not ( = ?auto_83738 ?auto_83739 ) ) ( not ( = ?auto_83738 ?auto_83740 ) ) ( not ( = ?auto_83735 ?auto_83737 ) ) ( not ( = ?auto_83733 ?auto_83737 ) ) ( not ( = ?auto_83736 ?auto_83737 ) ) ( not ( = ?auto_83741 ?auto_83738 ) ) ( not ( = ?auto_83741 ?auto_83739 ) ) ( not ( = ?auto_83741 ?auto_83740 ) ) ( not ( = ?auto_83735 ?auto_83734 ) ) ( not ( = ?auto_83733 ?auto_83734 ) ) ( not ( = ?auto_83736 ?auto_83734 ) ) ( not ( = ?auto_83737 ?auto_83734 ) ) ( not ( = ?auto_83742 ?auto_83741 ) ) ( not ( = ?auto_83742 ?auto_83738 ) ) ( not ( = ?auto_83742 ?auto_83739 ) ) ( not ( = ?auto_83742 ?auto_83740 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83735 ?auto_83733 ?auto_83736 ?auto_83734 ?auto_83737 ?auto_83732 )
      ( DELIVER-5PKG-VERIFY ?auto_83733 ?auto_83734 ?auto_83735 ?auto_83736 ?auto_83737 ?auto_83732 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83788 - OBJ
      ?auto_83789 - OBJ
      ?auto_83790 - OBJ
      ?auto_83791 - OBJ
      ?auto_83792 - OBJ
      ?auto_83787 - LOCATION
    )
    :vars
    (
      ?auto_83797 - LOCATION
      ?auto_83799 - CITY
      ?auto_83796 - LOCATION
      ?auto_83793 - LOCATION
      ?auto_83794 - LOCATION
      ?auto_83795 - LOCATION
      ?auto_83798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83797 ?auto_83799 ) ( IN-CITY ?auto_83787 ?auto_83799 ) ( not ( = ?auto_83787 ?auto_83797 ) ) ( OBJ-AT ?auto_83789 ?auto_83797 ) ( IN-CITY ?auto_83796 ?auto_83799 ) ( not ( = ?auto_83787 ?auto_83796 ) ) ( OBJ-AT ?auto_83791 ?auto_83796 ) ( IN-CITY ?auto_83793 ?auto_83799 ) ( not ( = ?auto_83787 ?auto_83793 ) ) ( OBJ-AT ?auto_83792 ?auto_83793 ) ( IN-CITY ?auto_83794 ?auto_83799 ) ( not ( = ?auto_83787 ?auto_83794 ) ) ( OBJ-AT ?auto_83788 ?auto_83794 ) ( IN-CITY ?auto_83795 ?auto_83799 ) ( not ( = ?auto_83787 ?auto_83795 ) ) ( OBJ-AT ?auto_83790 ?auto_83795 ) ( TRUCK-AT ?auto_83798 ?auto_83787 ) ( not ( = ?auto_83790 ?auto_83788 ) ) ( not ( = ?auto_83794 ?auto_83795 ) ) ( not ( = ?auto_83790 ?auto_83792 ) ) ( not ( = ?auto_83788 ?auto_83792 ) ) ( not ( = ?auto_83793 ?auto_83794 ) ) ( not ( = ?auto_83793 ?auto_83795 ) ) ( not ( = ?auto_83790 ?auto_83791 ) ) ( not ( = ?auto_83788 ?auto_83791 ) ) ( not ( = ?auto_83792 ?auto_83791 ) ) ( not ( = ?auto_83796 ?auto_83793 ) ) ( not ( = ?auto_83796 ?auto_83794 ) ) ( not ( = ?auto_83796 ?auto_83795 ) ) ( not ( = ?auto_83790 ?auto_83789 ) ) ( not ( = ?auto_83788 ?auto_83789 ) ) ( not ( = ?auto_83792 ?auto_83789 ) ) ( not ( = ?auto_83791 ?auto_83789 ) ) ( not ( = ?auto_83797 ?auto_83796 ) ) ( not ( = ?auto_83797 ?auto_83793 ) ) ( not ( = ?auto_83797 ?auto_83794 ) ) ( not ( = ?auto_83797 ?auto_83795 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83790 ?auto_83788 ?auto_83792 ?auto_83789 ?auto_83791 ?auto_83787 )
      ( DELIVER-5PKG-VERIFY ?auto_83788 ?auto_83789 ?auto_83790 ?auto_83791 ?auto_83792 ?auto_83787 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84317 - OBJ
      ?auto_84318 - OBJ
      ?auto_84319 - OBJ
      ?auto_84320 - OBJ
      ?auto_84321 - OBJ
      ?auto_84316 - LOCATION
    )
    :vars
    (
      ?auto_84326 - LOCATION
      ?auto_84328 - CITY
      ?auto_84325 - LOCATION
      ?auto_84322 - LOCATION
      ?auto_84323 - LOCATION
      ?auto_84324 - LOCATION
      ?auto_84327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84326 ?auto_84328 ) ( IN-CITY ?auto_84316 ?auto_84328 ) ( not ( = ?auto_84316 ?auto_84326 ) ) ( OBJ-AT ?auto_84318 ?auto_84326 ) ( IN-CITY ?auto_84325 ?auto_84328 ) ( not ( = ?auto_84316 ?auto_84325 ) ) ( OBJ-AT ?auto_84321 ?auto_84325 ) ( IN-CITY ?auto_84322 ?auto_84328 ) ( not ( = ?auto_84316 ?auto_84322 ) ) ( OBJ-AT ?auto_84319 ?auto_84322 ) ( IN-CITY ?auto_84323 ?auto_84328 ) ( not ( = ?auto_84316 ?auto_84323 ) ) ( OBJ-AT ?auto_84317 ?auto_84323 ) ( IN-CITY ?auto_84324 ?auto_84328 ) ( not ( = ?auto_84316 ?auto_84324 ) ) ( OBJ-AT ?auto_84320 ?auto_84324 ) ( TRUCK-AT ?auto_84327 ?auto_84316 ) ( not ( = ?auto_84320 ?auto_84317 ) ) ( not ( = ?auto_84323 ?auto_84324 ) ) ( not ( = ?auto_84320 ?auto_84319 ) ) ( not ( = ?auto_84317 ?auto_84319 ) ) ( not ( = ?auto_84322 ?auto_84323 ) ) ( not ( = ?auto_84322 ?auto_84324 ) ) ( not ( = ?auto_84320 ?auto_84321 ) ) ( not ( = ?auto_84317 ?auto_84321 ) ) ( not ( = ?auto_84319 ?auto_84321 ) ) ( not ( = ?auto_84325 ?auto_84322 ) ) ( not ( = ?auto_84325 ?auto_84323 ) ) ( not ( = ?auto_84325 ?auto_84324 ) ) ( not ( = ?auto_84320 ?auto_84318 ) ) ( not ( = ?auto_84317 ?auto_84318 ) ) ( not ( = ?auto_84319 ?auto_84318 ) ) ( not ( = ?auto_84321 ?auto_84318 ) ) ( not ( = ?auto_84326 ?auto_84325 ) ) ( not ( = ?auto_84326 ?auto_84322 ) ) ( not ( = ?auto_84326 ?auto_84323 ) ) ( not ( = ?auto_84326 ?auto_84324 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84320 ?auto_84317 ?auto_84319 ?auto_84318 ?auto_84321 ?auto_84316 )
      ( DELIVER-5PKG-VERIFY ?auto_84317 ?auto_84318 ?auto_84319 ?auto_84320 ?auto_84321 ?auto_84316 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84490 - OBJ
      ?auto_84491 - OBJ
      ?auto_84492 - OBJ
      ?auto_84493 - OBJ
      ?auto_84494 - OBJ
      ?auto_84489 - LOCATION
    )
    :vars
    (
      ?auto_84499 - LOCATION
      ?auto_84501 - CITY
      ?auto_84498 - LOCATION
      ?auto_84495 - LOCATION
      ?auto_84496 - LOCATION
      ?auto_84497 - LOCATION
      ?auto_84500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84499 ?auto_84501 ) ( IN-CITY ?auto_84489 ?auto_84501 ) ( not ( = ?auto_84489 ?auto_84499 ) ) ( OBJ-AT ?auto_84491 ?auto_84499 ) ( IN-CITY ?auto_84498 ?auto_84501 ) ( not ( = ?auto_84489 ?auto_84498 ) ) ( OBJ-AT ?auto_84493 ?auto_84498 ) ( IN-CITY ?auto_84495 ?auto_84501 ) ( not ( = ?auto_84489 ?auto_84495 ) ) ( OBJ-AT ?auto_84492 ?auto_84495 ) ( IN-CITY ?auto_84496 ?auto_84501 ) ( not ( = ?auto_84489 ?auto_84496 ) ) ( OBJ-AT ?auto_84490 ?auto_84496 ) ( IN-CITY ?auto_84497 ?auto_84501 ) ( not ( = ?auto_84489 ?auto_84497 ) ) ( OBJ-AT ?auto_84494 ?auto_84497 ) ( TRUCK-AT ?auto_84500 ?auto_84489 ) ( not ( = ?auto_84494 ?auto_84490 ) ) ( not ( = ?auto_84496 ?auto_84497 ) ) ( not ( = ?auto_84494 ?auto_84492 ) ) ( not ( = ?auto_84490 ?auto_84492 ) ) ( not ( = ?auto_84495 ?auto_84496 ) ) ( not ( = ?auto_84495 ?auto_84497 ) ) ( not ( = ?auto_84494 ?auto_84493 ) ) ( not ( = ?auto_84490 ?auto_84493 ) ) ( not ( = ?auto_84492 ?auto_84493 ) ) ( not ( = ?auto_84498 ?auto_84495 ) ) ( not ( = ?auto_84498 ?auto_84496 ) ) ( not ( = ?auto_84498 ?auto_84497 ) ) ( not ( = ?auto_84494 ?auto_84491 ) ) ( not ( = ?auto_84490 ?auto_84491 ) ) ( not ( = ?auto_84492 ?auto_84491 ) ) ( not ( = ?auto_84493 ?auto_84491 ) ) ( not ( = ?auto_84499 ?auto_84498 ) ) ( not ( = ?auto_84499 ?auto_84495 ) ) ( not ( = ?auto_84499 ?auto_84496 ) ) ( not ( = ?auto_84499 ?auto_84497 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84494 ?auto_84490 ?auto_84492 ?auto_84491 ?auto_84493 ?auto_84489 )
      ( DELIVER-5PKG-VERIFY ?auto_84490 ?auto_84491 ?auto_84492 ?auto_84493 ?auto_84494 ?auto_84489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84660 - OBJ
      ?auto_84661 - OBJ
      ?auto_84662 - OBJ
      ?auto_84663 - OBJ
      ?auto_84664 - OBJ
      ?auto_84659 - LOCATION
    )
    :vars
    (
      ?auto_84669 - LOCATION
      ?auto_84671 - CITY
      ?auto_84668 - LOCATION
      ?auto_84665 - LOCATION
      ?auto_84666 - LOCATION
      ?auto_84667 - LOCATION
      ?auto_84670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84669 ?auto_84671 ) ( IN-CITY ?auto_84659 ?auto_84671 ) ( not ( = ?auto_84659 ?auto_84669 ) ) ( OBJ-AT ?auto_84661 ?auto_84669 ) ( IN-CITY ?auto_84668 ?auto_84671 ) ( not ( = ?auto_84659 ?auto_84668 ) ) ( OBJ-AT ?auto_84662 ?auto_84668 ) ( IN-CITY ?auto_84665 ?auto_84671 ) ( not ( = ?auto_84659 ?auto_84665 ) ) ( OBJ-AT ?auto_84664 ?auto_84665 ) ( IN-CITY ?auto_84666 ?auto_84671 ) ( not ( = ?auto_84659 ?auto_84666 ) ) ( OBJ-AT ?auto_84660 ?auto_84666 ) ( IN-CITY ?auto_84667 ?auto_84671 ) ( not ( = ?auto_84659 ?auto_84667 ) ) ( OBJ-AT ?auto_84663 ?auto_84667 ) ( TRUCK-AT ?auto_84670 ?auto_84659 ) ( not ( = ?auto_84663 ?auto_84660 ) ) ( not ( = ?auto_84666 ?auto_84667 ) ) ( not ( = ?auto_84663 ?auto_84664 ) ) ( not ( = ?auto_84660 ?auto_84664 ) ) ( not ( = ?auto_84665 ?auto_84666 ) ) ( not ( = ?auto_84665 ?auto_84667 ) ) ( not ( = ?auto_84663 ?auto_84662 ) ) ( not ( = ?auto_84660 ?auto_84662 ) ) ( not ( = ?auto_84664 ?auto_84662 ) ) ( not ( = ?auto_84668 ?auto_84665 ) ) ( not ( = ?auto_84668 ?auto_84666 ) ) ( not ( = ?auto_84668 ?auto_84667 ) ) ( not ( = ?auto_84663 ?auto_84661 ) ) ( not ( = ?auto_84660 ?auto_84661 ) ) ( not ( = ?auto_84664 ?auto_84661 ) ) ( not ( = ?auto_84662 ?auto_84661 ) ) ( not ( = ?auto_84669 ?auto_84668 ) ) ( not ( = ?auto_84669 ?auto_84665 ) ) ( not ( = ?auto_84669 ?auto_84666 ) ) ( not ( = ?auto_84669 ?auto_84667 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84663 ?auto_84660 ?auto_84664 ?auto_84661 ?auto_84662 ?auto_84659 )
      ( DELIVER-5PKG-VERIFY ?auto_84660 ?auto_84661 ?auto_84662 ?auto_84663 ?auto_84664 ?auto_84659 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84774 - OBJ
      ?auto_84775 - OBJ
      ?auto_84776 - OBJ
      ?auto_84777 - OBJ
      ?auto_84778 - OBJ
      ?auto_84773 - LOCATION
    )
    :vars
    (
      ?auto_84783 - LOCATION
      ?auto_84785 - CITY
      ?auto_84782 - LOCATION
      ?auto_84779 - LOCATION
      ?auto_84780 - LOCATION
      ?auto_84781 - LOCATION
      ?auto_84784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84783 ?auto_84785 ) ( IN-CITY ?auto_84773 ?auto_84785 ) ( not ( = ?auto_84773 ?auto_84783 ) ) ( OBJ-AT ?auto_84775 ?auto_84783 ) ( IN-CITY ?auto_84782 ?auto_84785 ) ( not ( = ?auto_84773 ?auto_84782 ) ) ( OBJ-AT ?auto_84776 ?auto_84782 ) ( IN-CITY ?auto_84779 ?auto_84785 ) ( not ( = ?auto_84773 ?auto_84779 ) ) ( OBJ-AT ?auto_84777 ?auto_84779 ) ( IN-CITY ?auto_84780 ?auto_84785 ) ( not ( = ?auto_84773 ?auto_84780 ) ) ( OBJ-AT ?auto_84774 ?auto_84780 ) ( IN-CITY ?auto_84781 ?auto_84785 ) ( not ( = ?auto_84773 ?auto_84781 ) ) ( OBJ-AT ?auto_84778 ?auto_84781 ) ( TRUCK-AT ?auto_84784 ?auto_84773 ) ( not ( = ?auto_84778 ?auto_84774 ) ) ( not ( = ?auto_84780 ?auto_84781 ) ) ( not ( = ?auto_84778 ?auto_84777 ) ) ( not ( = ?auto_84774 ?auto_84777 ) ) ( not ( = ?auto_84779 ?auto_84780 ) ) ( not ( = ?auto_84779 ?auto_84781 ) ) ( not ( = ?auto_84778 ?auto_84776 ) ) ( not ( = ?auto_84774 ?auto_84776 ) ) ( not ( = ?auto_84777 ?auto_84776 ) ) ( not ( = ?auto_84782 ?auto_84779 ) ) ( not ( = ?auto_84782 ?auto_84780 ) ) ( not ( = ?auto_84782 ?auto_84781 ) ) ( not ( = ?auto_84778 ?auto_84775 ) ) ( not ( = ?auto_84774 ?auto_84775 ) ) ( not ( = ?auto_84777 ?auto_84775 ) ) ( not ( = ?auto_84776 ?auto_84775 ) ) ( not ( = ?auto_84783 ?auto_84782 ) ) ( not ( = ?auto_84783 ?auto_84779 ) ) ( not ( = ?auto_84783 ?auto_84780 ) ) ( not ( = ?auto_84783 ?auto_84781 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84778 ?auto_84774 ?auto_84777 ?auto_84775 ?auto_84776 ?auto_84773 )
      ( DELIVER-5PKG-VERIFY ?auto_84774 ?auto_84775 ?auto_84776 ?auto_84777 ?auto_84778 ?auto_84773 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85535 - OBJ
      ?auto_85536 - OBJ
      ?auto_85537 - OBJ
      ?auto_85538 - OBJ
      ?auto_85539 - OBJ
      ?auto_85534 - LOCATION
    )
    :vars
    (
      ?auto_85544 - LOCATION
      ?auto_85546 - CITY
      ?auto_85543 - LOCATION
      ?auto_85540 - LOCATION
      ?auto_85541 - LOCATION
      ?auto_85542 - LOCATION
      ?auto_85545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85544 ?auto_85546 ) ( IN-CITY ?auto_85534 ?auto_85546 ) ( not ( = ?auto_85534 ?auto_85544 ) ) ( OBJ-AT ?auto_85539 ?auto_85544 ) ( IN-CITY ?auto_85543 ?auto_85546 ) ( not ( = ?auto_85534 ?auto_85543 ) ) ( OBJ-AT ?auto_85538 ?auto_85543 ) ( IN-CITY ?auto_85540 ?auto_85546 ) ( not ( = ?auto_85534 ?auto_85540 ) ) ( OBJ-AT ?auto_85535 ?auto_85540 ) ( IN-CITY ?auto_85541 ?auto_85546 ) ( not ( = ?auto_85534 ?auto_85541 ) ) ( OBJ-AT ?auto_85537 ?auto_85541 ) ( IN-CITY ?auto_85542 ?auto_85546 ) ( not ( = ?auto_85534 ?auto_85542 ) ) ( OBJ-AT ?auto_85536 ?auto_85542 ) ( TRUCK-AT ?auto_85545 ?auto_85534 ) ( not ( = ?auto_85536 ?auto_85537 ) ) ( not ( = ?auto_85541 ?auto_85542 ) ) ( not ( = ?auto_85536 ?auto_85535 ) ) ( not ( = ?auto_85537 ?auto_85535 ) ) ( not ( = ?auto_85540 ?auto_85541 ) ) ( not ( = ?auto_85540 ?auto_85542 ) ) ( not ( = ?auto_85536 ?auto_85538 ) ) ( not ( = ?auto_85537 ?auto_85538 ) ) ( not ( = ?auto_85535 ?auto_85538 ) ) ( not ( = ?auto_85543 ?auto_85540 ) ) ( not ( = ?auto_85543 ?auto_85541 ) ) ( not ( = ?auto_85543 ?auto_85542 ) ) ( not ( = ?auto_85536 ?auto_85539 ) ) ( not ( = ?auto_85537 ?auto_85539 ) ) ( not ( = ?auto_85535 ?auto_85539 ) ) ( not ( = ?auto_85538 ?auto_85539 ) ) ( not ( = ?auto_85544 ?auto_85543 ) ) ( not ( = ?auto_85544 ?auto_85540 ) ) ( not ( = ?auto_85544 ?auto_85541 ) ) ( not ( = ?auto_85544 ?auto_85542 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85536 ?auto_85537 ?auto_85535 ?auto_85539 ?auto_85538 ?auto_85534 )
      ( DELIVER-5PKG-VERIFY ?auto_85535 ?auto_85536 ?auto_85537 ?auto_85538 ?auto_85539 ?auto_85534 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85590 - OBJ
      ?auto_85591 - OBJ
      ?auto_85592 - OBJ
      ?auto_85593 - OBJ
      ?auto_85594 - OBJ
      ?auto_85589 - LOCATION
    )
    :vars
    (
      ?auto_85599 - LOCATION
      ?auto_85601 - CITY
      ?auto_85598 - LOCATION
      ?auto_85595 - LOCATION
      ?auto_85596 - LOCATION
      ?auto_85597 - LOCATION
      ?auto_85600 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85599 ?auto_85601 ) ( IN-CITY ?auto_85589 ?auto_85601 ) ( not ( = ?auto_85589 ?auto_85599 ) ) ( OBJ-AT ?auto_85593 ?auto_85599 ) ( IN-CITY ?auto_85598 ?auto_85601 ) ( not ( = ?auto_85589 ?auto_85598 ) ) ( OBJ-AT ?auto_85594 ?auto_85598 ) ( IN-CITY ?auto_85595 ?auto_85601 ) ( not ( = ?auto_85589 ?auto_85595 ) ) ( OBJ-AT ?auto_85590 ?auto_85595 ) ( IN-CITY ?auto_85596 ?auto_85601 ) ( not ( = ?auto_85589 ?auto_85596 ) ) ( OBJ-AT ?auto_85592 ?auto_85596 ) ( IN-CITY ?auto_85597 ?auto_85601 ) ( not ( = ?auto_85589 ?auto_85597 ) ) ( OBJ-AT ?auto_85591 ?auto_85597 ) ( TRUCK-AT ?auto_85600 ?auto_85589 ) ( not ( = ?auto_85591 ?auto_85592 ) ) ( not ( = ?auto_85596 ?auto_85597 ) ) ( not ( = ?auto_85591 ?auto_85590 ) ) ( not ( = ?auto_85592 ?auto_85590 ) ) ( not ( = ?auto_85595 ?auto_85596 ) ) ( not ( = ?auto_85595 ?auto_85597 ) ) ( not ( = ?auto_85591 ?auto_85594 ) ) ( not ( = ?auto_85592 ?auto_85594 ) ) ( not ( = ?auto_85590 ?auto_85594 ) ) ( not ( = ?auto_85598 ?auto_85595 ) ) ( not ( = ?auto_85598 ?auto_85596 ) ) ( not ( = ?auto_85598 ?auto_85597 ) ) ( not ( = ?auto_85591 ?auto_85593 ) ) ( not ( = ?auto_85592 ?auto_85593 ) ) ( not ( = ?auto_85590 ?auto_85593 ) ) ( not ( = ?auto_85594 ?auto_85593 ) ) ( not ( = ?auto_85599 ?auto_85598 ) ) ( not ( = ?auto_85599 ?auto_85595 ) ) ( not ( = ?auto_85599 ?auto_85596 ) ) ( not ( = ?auto_85599 ?auto_85597 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85591 ?auto_85592 ?auto_85590 ?auto_85593 ?auto_85594 ?auto_85589 )
      ( DELIVER-5PKG-VERIFY ?auto_85590 ?auto_85591 ?auto_85592 ?auto_85593 ?auto_85594 ?auto_85589 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85762 - OBJ
      ?auto_85763 - OBJ
      ?auto_85764 - OBJ
      ?auto_85765 - OBJ
      ?auto_85766 - OBJ
      ?auto_85761 - LOCATION
    )
    :vars
    (
      ?auto_85771 - LOCATION
      ?auto_85773 - CITY
      ?auto_85770 - LOCATION
      ?auto_85767 - LOCATION
      ?auto_85768 - LOCATION
      ?auto_85769 - LOCATION
      ?auto_85772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85771 ?auto_85773 ) ( IN-CITY ?auto_85761 ?auto_85773 ) ( not ( = ?auto_85761 ?auto_85771 ) ) ( OBJ-AT ?auto_85766 ?auto_85771 ) ( IN-CITY ?auto_85770 ?auto_85773 ) ( not ( = ?auto_85761 ?auto_85770 ) ) ( OBJ-AT ?auto_85764 ?auto_85770 ) ( IN-CITY ?auto_85767 ?auto_85773 ) ( not ( = ?auto_85761 ?auto_85767 ) ) ( OBJ-AT ?auto_85762 ?auto_85767 ) ( IN-CITY ?auto_85768 ?auto_85773 ) ( not ( = ?auto_85761 ?auto_85768 ) ) ( OBJ-AT ?auto_85765 ?auto_85768 ) ( IN-CITY ?auto_85769 ?auto_85773 ) ( not ( = ?auto_85761 ?auto_85769 ) ) ( OBJ-AT ?auto_85763 ?auto_85769 ) ( TRUCK-AT ?auto_85772 ?auto_85761 ) ( not ( = ?auto_85763 ?auto_85765 ) ) ( not ( = ?auto_85768 ?auto_85769 ) ) ( not ( = ?auto_85763 ?auto_85762 ) ) ( not ( = ?auto_85765 ?auto_85762 ) ) ( not ( = ?auto_85767 ?auto_85768 ) ) ( not ( = ?auto_85767 ?auto_85769 ) ) ( not ( = ?auto_85763 ?auto_85764 ) ) ( not ( = ?auto_85765 ?auto_85764 ) ) ( not ( = ?auto_85762 ?auto_85764 ) ) ( not ( = ?auto_85770 ?auto_85767 ) ) ( not ( = ?auto_85770 ?auto_85768 ) ) ( not ( = ?auto_85770 ?auto_85769 ) ) ( not ( = ?auto_85763 ?auto_85766 ) ) ( not ( = ?auto_85765 ?auto_85766 ) ) ( not ( = ?auto_85762 ?auto_85766 ) ) ( not ( = ?auto_85764 ?auto_85766 ) ) ( not ( = ?auto_85771 ?auto_85770 ) ) ( not ( = ?auto_85771 ?auto_85767 ) ) ( not ( = ?auto_85771 ?auto_85768 ) ) ( not ( = ?auto_85771 ?auto_85769 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85763 ?auto_85765 ?auto_85762 ?auto_85766 ?auto_85764 ?auto_85761 )
      ( DELIVER-5PKG-VERIFY ?auto_85762 ?auto_85763 ?auto_85764 ?auto_85765 ?auto_85766 ?auto_85761 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85817 - OBJ
      ?auto_85818 - OBJ
      ?auto_85819 - OBJ
      ?auto_85820 - OBJ
      ?auto_85821 - OBJ
      ?auto_85816 - LOCATION
    )
    :vars
    (
      ?auto_85826 - LOCATION
      ?auto_85828 - CITY
      ?auto_85825 - LOCATION
      ?auto_85822 - LOCATION
      ?auto_85823 - LOCATION
      ?auto_85824 - LOCATION
      ?auto_85827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85826 ?auto_85828 ) ( IN-CITY ?auto_85816 ?auto_85828 ) ( not ( = ?auto_85816 ?auto_85826 ) ) ( OBJ-AT ?auto_85820 ?auto_85826 ) ( IN-CITY ?auto_85825 ?auto_85828 ) ( not ( = ?auto_85816 ?auto_85825 ) ) ( OBJ-AT ?auto_85819 ?auto_85825 ) ( IN-CITY ?auto_85822 ?auto_85828 ) ( not ( = ?auto_85816 ?auto_85822 ) ) ( OBJ-AT ?auto_85817 ?auto_85822 ) ( IN-CITY ?auto_85823 ?auto_85828 ) ( not ( = ?auto_85816 ?auto_85823 ) ) ( OBJ-AT ?auto_85821 ?auto_85823 ) ( IN-CITY ?auto_85824 ?auto_85828 ) ( not ( = ?auto_85816 ?auto_85824 ) ) ( OBJ-AT ?auto_85818 ?auto_85824 ) ( TRUCK-AT ?auto_85827 ?auto_85816 ) ( not ( = ?auto_85818 ?auto_85821 ) ) ( not ( = ?auto_85823 ?auto_85824 ) ) ( not ( = ?auto_85818 ?auto_85817 ) ) ( not ( = ?auto_85821 ?auto_85817 ) ) ( not ( = ?auto_85822 ?auto_85823 ) ) ( not ( = ?auto_85822 ?auto_85824 ) ) ( not ( = ?auto_85818 ?auto_85819 ) ) ( not ( = ?auto_85821 ?auto_85819 ) ) ( not ( = ?auto_85817 ?auto_85819 ) ) ( not ( = ?auto_85825 ?auto_85822 ) ) ( not ( = ?auto_85825 ?auto_85823 ) ) ( not ( = ?auto_85825 ?auto_85824 ) ) ( not ( = ?auto_85818 ?auto_85820 ) ) ( not ( = ?auto_85821 ?auto_85820 ) ) ( not ( = ?auto_85817 ?auto_85820 ) ) ( not ( = ?auto_85819 ?auto_85820 ) ) ( not ( = ?auto_85826 ?auto_85825 ) ) ( not ( = ?auto_85826 ?auto_85822 ) ) ( not ( = ?auto_85826 ?auto_85823 ) ) ( not ( = ?auto_85826 ?auto_85824 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85818 ?auto_85821 ?auto_85817 ?auto_85820 ?auto_85819 ?auto_85816 )
      ( DELIVER-5PKG-VERIFY ?auto_85817 ?auto_85818 ?auto_85819 ?auto_85820 ?auto_85821 ?auto_85816 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85987 - OBJ
      ?auto_85988 - OBJ
      ?auto_85989 - OBJ
      ?auto_85990 - OBJ
      ?auto_85991 - OBJ
      ?auto_85986 - LOCATION
    )
    :vars
    (
      ?auto_85996 - LOCATION
      ?auto_85998 - CITY
      ?auto_85995 - LOCATION
      ?auto_85992 - LOCATION
      ?auto_85993 - LOCATION
      ?auto_85994 - LOCATION
      ?auto_85997 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85996 ?auto_85998 ) ( IN-CITY ?auto_85986 ?auto_85998 ) ( not ( = ?auto_85986 ?auto_85996 ) ) ( OBJ-AT ?auto_85989 ?auto_85996 ) ( IN-CITY ?auto_85995 ?auto_85998 ) ( not ( = ?auto_85986 ?auto_85995 ) ) ( OBJ-AT ?auto_85991 ?auto_85995 ) ( IN-CITY ?auto_85992 ?auto_85998 ) ( not ( = ?auto_85986 ?auto_85992 ) ) ( OBJ-AT ?auto_85987 ?auto_85992 ) ( IN-CITY ?auto_85993 ?auto_85998 ) ( not ( = ?auto_85986 ?auto_85993 ) ) ( OBJ-AT ?auto_85990 ?auto_85993 ) ( IN-CITY ?auto_85994 ?auto_85998 ) ( not ( = ?auto_85986 ?auto_85994 ) ) ( OBJ-AT ?auto_85988 ?auto_85994 ) ( TRUCK-AT ?auto_85997 ?auto_85986 ) ( not ( = ?auto_85988 ?auto_85990 ) ) ( not ( = ?auto_85993 ?auto_85994 ) ) ( not ( = ?auto_85988 ?auto_85987 ) ) ( not ( = ?auto_85990 ?auto_85987 ) ) ( not ( = ?auto_85992 ?auto_85993 ) ) ( not ( = ?auto_85992 ?auto_85994 ) ) ( not ( = ?auto_85988 ?auto_85991 ) ) ( not ( = ?auto_85990 ?auto_85991 ) ) ( not ( = ?auto_85987 ?auto_85991 ) ) ( not ( = ?auto_85995 ?auto_85992 ) ) ( not ( = ?auto_85995 ?auto_85993 ) ) ( not ( = ?auto_85995 ?auto_85994 ) ) ( not ( = ?auto_85988 ?auto_85989 ) ) ( not ( = ?auto_85990 ?auto_85989 ) ) ( not ( = ?auto_85987 ?auto_85989 ) ) ( not ( = ?auto_85991 ?auto_85989 ) ) ( not ( = ?auto_85996 ?auto_85995 ) ) ( not ( = ?auto_85996 ?auto_85992 ) ) ( not ( = ?auto_85996 ?auto_85993 ) ) ( not ( = ?auto_85996 ?auto_85994 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85988 ?auto_85990 ?auto_85987 ?auto_85989 ?auto_85991 ?auto_85986 )
      ( DELIVER-5PKG-VERIFY ?auto_85987 ?auto_85988 ?auto_85989 ?auto_85990 ?auto_85991 ?auto_85986 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86101 - OBJ
      ?auto_86102 - OBJ
      ?auto_86103 - OBJ
      ?auto_86104 - OBJ
      ?auto_86105 - OBJ
      ?auto_86100 - LOCATION
    )
    :vars
    (
      ?auto_86110 - LOCATION
      ?auto_86112 - CITY
      ?auto_86109 - LOCATION
      ?auto_86106 - LOCATION
      ?auto_86107 - LOCATION
      ?auto_86108 - LOCATION
      ?auto_86111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86110 ?auto_86112 ) ( IN-CITY ?auto_86100 ?auto_86112 ) ( not ( = ?auto_86100 ?auto_86110 ) ) ( OBJ-AT ?auto_86103 ?auto_86110 ) ( IN-CITY ?auto_86109 ?auto_86112 ) ( not ( = ?auto_86100 ?auto_86109 ) ) ( OBJ-AT ?auto_86104 ?auto_86109 ) ( IN-CITY ?auto_86106 ?auto_86112 ) ( not ( = ?auto_86100 ?auto_86106 ) ) ( OBJ-AT ?auto_86101 ?auto_86106 ) ( IN-CITY ?auto_86107 ?auto_86112 ) ( not ( = ?auto_86100 ?auto_86107 ) ) ( OBJ-AT ?auto_86105 ?auto_86107 ) ( IN-CITY ?auto_86108 ?auto_86112 ) ( not ( = ?auto_86100 ?auto_86108 ) ) ( OBJ-AT ?auto_86102 ?auto_86108 ) ( TRUCK-AT ?auto_86111 ?auto_86100 ) ( not ( = ?auto_86102 ?auto_86105 ) ) ( not ( = ?auto_86107 ?auto_86108 ) ) ( not ( = ?auto_86102 ?auto_86101 ) ) ( not ( = ?auto_86105 ?auto_86101 ) ) ( not ( = ?auto_86106 ?auto_86107 ) ) ( not ( = ?auto_86106 ?auto_86108 ) ) ( not ( = ?auto_86102 ?auto_86104 ) ) ( not ( = ?auto_86105 ?auto_86104 ) ) ( not ( = ?auto_86101 ?auto_86104 ) ) ( not ( = ?auto_86109 ?auto_86106 ) ) ( not ( = ?auto_86109 ?auto_86107 ) ) ( not ( = ?auto_86109 ?auto_86108 ) ) ( not ( = ?auto_86102 ?auto_86103 ) ) ( not ( = ?auto_86105 ?auto_86103 ) ) ( not ( = ?auto_86101 ?auto_86103 ) ) ( not ( = ?auto_86104 ?auto_86103 ) ) ( not ( = ?auto_86110 ?auto_86109 ) ) ( not ( = ?auto_86110 ?auto_86106 ) ) ( not ( = ?auto_86110 ?auto_86107 ) ) ( not ( = ?auto_86110 ?auto_86108 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86102 ?auto_86105 ?auto_86101 ?auto_86103 ?auto_86104 ?auto_86100 )
      ( DELIVER-5PKG-VERIFY ?auto_86101 ?auto_86102 ?auto_86103 ?auto_86104 ?auto_86105 ?auto_86100 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86271 - OBJ
      ?auto_86272 - OBJ
      ?auto_86273 - OBJ
      ?auto_86274 - OBJ
      ?auto_86275 - OBJ
      ?auto_86270 - LOCATION
    )
    :vars
    (
      ?auto_86280 - LOCATION
      ?auto_86282 - CITY
      ?auto_86279 - LOCATION
      ?auto_86276 - LOCATION
      ?auto_86277 - LOCATION
      ?auto_86278 - LOCATION
      ?auto_86281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86280 ?auto_86282 ) ( IN-CITY ?auto_86270 ?auto_86282 ) ( not ( = ?auto_86270 ?auto_86280 ) ) ( OBJ-AT ?auto_86275 ?auto_86280 ) ( IN-CITY ?auto_86279 ?auto_86282 ) ( not ( = ?auto_86270 ?auto_86279 ) ) ( OBJ-AT ?auto_86274 ?auto_86279 ) ( IN-CITY ?auto_86276 ?auto_86282 ) ( not ( = ?auto_86270 ?auto_86276 ) ) ( OBJ-AT ?auto_86271 ?auto_86276 ) ( IN-CITY ?auto_86277 ?auto_86282 ) ( not ( = ?auto_86270 ?auto_86277 ) ) ( OBJ-AT ?auto_86272 ?auto_86277 ) ( IN-CITY ?auto_86278 ?auto_86282 ) ( not ( = ?auto_86270 ?auto_86278 ) ) ( OBJ-AT ?auto_86273 ?auto_86278 ) ( TRUCK-AT ?auto_86281 ?auto_86270 ) ( not ( = ?auto_86273 ?auto_86272 ) ) ( not ( = ?auto_86277 ?auto_86278 ) ) ( not ( = ?auto_86273 ?auto_86271 ) ) ( not ( = ?auto_86272 ?auto_86271 ) ) ( not ( = ?auto_86276 ?auto_86277 ) ) ( not ( = ?auto_86276 ?auto_86278 ) ) ( not ( = ?auto_86273 ?auto_86274 ) ) ( not ( = ?auto_86272 ?auto_86274 ) ) ( not ( = ?auto_86271 ?auto_86274 ) ) ( not ( = ?auto_86279 ?auto_86276 ) ) ( not ( = ?auto_86279 ?auto_86277 ) ) ( not ( = ?auto_86279 ?auto_86278 ) ) ( not ( = ?auto_86273 ?auto_86275 ) ) ( not ( = ?auto_86272 ?auto_86275 ) ) ( not ( = ?auto_86271 ?auto_86275 ) ) ( not ( = ?auto_86274 ?auto_86275 ) ) ( not ( = ?auto_86280 ?auto_86279 ) ) ( not ( = ?auto_86280 ?auto_86276 ) ) ( not ( = ?auto_86280 ?auto_86277 ) ) ( not ( = ?auto_86280 ?auto_86278 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86273 ?auto_86272 ?auto_86271 ?auto_86275 ?auto_86274 ?auto_86270 )
      ( DELIVER-5PKG-VERIFY ?auto_86271 ?auto_86272 ?auto_86273 ?auto_86274 ?auto_86275 ?auto_86270 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86326 - OBJ
      ?auto_86327 - OBJ
      ?auto_86328 - OBJ
      ?auto_86329 - OBJ
      ?auto_86330 - OBJ
      ?auto_86325 - LOCATION
    )
    :vars
    (
      ?auto_86335 - LOCATION
      ?auto_86337 - CITY
      ?auto_86334 - LOCATION
      ?auto_86331 - LOCATION
      ?auto_86332 - LOCATION
      ?auto_86333 - LOCATION
      ?auto_86336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86335 ?auto_86337 ) ( IN-CITY ?auto_86325 ?auto_86337 ) ( not ( = ?auto_86325 ?auto_86335 ) ) ( OBJ-AT ?auto_86329 ?auto_86335 ) ( IN-CITY ?auto_86334 ?auto_86337 ) ( not ( = ?auto_86325 ?auto_86334 ) ) ( OBJ-AT ?auto_86330 ?auto_86334 ) ( IN-CITY ?auto_86331 ?auto_86337 ) ( not ( = ?auto_86325 ?auto_86331 ) ) ( OBJ-AT ?auto_86326 ?auto_86331 ) ( IN-CITY ?auto_86332 ?auto_86337 ) ( not ( = ?auto_86325 ?auto_86332 ) ) ( OBJ-AT ?auto_86327 ?auto_86332 ) ( IN-CITY ?auto_86333 ?auto_86337 ) ( not ( = ?auto_86325 ?auto_86333 ) ) ( OBJ-AT ?auto_86328 ?auto_86333 ) ( TRUCK-AT ?auto_86336 ?auto_86325 ) ( not ( = ?auto_86328 ?auto_86327 ) ) ( not ( = ?auto_86332 ?auto_86333 ) ) ( not ( = ?auto_86328 ?auto_86326 ) ) ( not ( = ?auto_86327 ?auto_86326 ) ) ( not ( = ?auto_86331 ?auto_86332 ) ) ( not ( = ?auto_86331 ?auto_86333 ) ) ( not ( = ?auto_86328 ?auto_86330 ) ) ( not ( = ?auto_86327 ?auto_86330 ) ) ( not ( = ?auto_86326 ?auto_86330 ) ) ( not ( = ?auto_86334 ?auto_86331 ) ) ( not ( = ?auto_86334 ?auto_86332 ) ) ( not ( = ?auto_86334 ?auto_86333 ) ) ( not ( = ?auto_86328 ?auto_86329 ) ) ( not ( = ?auto_86327 ?auto_86329 ) ) ( not ( = ?auto_86326 ?auto_86329 ) ) ( not ( = ?auto_86330 ?auto_86329 ) ) ( not ( = ?auto_86335 ?auto_86334 ) ) ( not ( = ?auto_86335 ?auto_86331 ) ) ( not ( = ?auto_86335 ?auto_86332 ) ) ( not ( = ?auto_86335 ?auto_86333 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86328 ?auto_86327 ?auto_86326 ?auto_86329 ?auto_86330 ?auto_86325 )
      ( DELIVER-5PKG-VERIFY ?auto_86326 ?auto_86327 ?auto_86328 ?auto_86329 ?auto_86330 ?auto_86325 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86615 - OBJ
      ?auto_86616 - OBJ
      ?auto_86617 - OBJ
      ?auto_86618 - OBJ
      ?auto_86619 - OBJ
      ?auto_86614 - LOCATION
    )
    :vars
    (
      ?auto_86624 - LOCATION
      ?auto_86626 - CITY
      ?auto_86623 - LOCATION
      ?auto_86620 - LOCATION
      ?auto_86621 - LOCATION
      ?auto_86622 - LOCATION
      ?auto_86625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86624 ?auto_86626 ) ( IN-CITY ?auto_86614 ?auto_86626 ) ( not ( = ?auto_86614 ?auto_86624 ) ) ( OBJ-AT ?auto_86619 ?auto_86624 ) ( IN-CITY ?auto_86623 ?auto_86626 ) ( not ( = ?auto_86614 ?auto_86623 ) ) ( OBJ-AT ?auto_86617 ?auto_86623 ) ( IN-CITY ?auto_86620 ?auto_86626 ) ( not ( = ?auto_86614 ?auto_86620 ) ) ( OBJ-AT ?auto_86615 ?auto_86620 ) ( IN-CITY ?auto_86621 ?auto_86626 ) ( not ( = ?auto_86614 ?auto_86621 ) ) ( OBJ-AT ?auto_86616 ?auto_86621 ) ( IN-CITY ?auto_86622 ?auto_86626 ) ( not ( = ?auto_86614 ?auto_86622 ) ) ( OBJ-AT ?auto_86618 ?auto_86622 ) ( TRUCK-AT ?auto_86625 ?auto_86614 ) ( not ( = ?auto_86618 ?auto_86616 ) ) ( not ( = ?auto_86621 ?auto_86622 ) ) ( not ( = ?auto_86618 ?auto_86615 ) ) ( not ( = ?auto_86616 ?auto_86615 ) ) ( not ( = ?auto_86620 ?auto_86621 ) ) ( not ( = ?auto_86620 ?auto_86622 ) ) ( not ( = ?auto_86618 ?auto_86617 ) ) ( not ( = ?auto_86616 ?auto_86617 ) ) ( not ( = ?auto_86615 ?auto_86617 ) ) ( not ( = ?auto_86623 ?auto_86620 ) ) ( not ( = ?auto_86623 ?auto_86621 ) ) ( not ( = ?auto_86623 ?auto_86622 ) ) ( not ( = ?auto_86618 ?auto_86619 ) ) ( not ( = ?auto_86616 ?auto_86619 ) ) ( not ( = ?auto_86615 ?auto_86619 ) ) ( not ( = ?auto_86617 ?auto_86619 ) ) ( not ( = ?auto_86624 ?auto_86623 ) ) ( not ( = ?auto_86624 ?auto_86620 ) ) ( not ( = ?auto_86624 ?auto_86621 ) ) ( not ( = ?auto_86624 ?auto_86622 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86618 ?auto_86616 ?auto_86615 ?auto_86619 ?auto_86617 ?auto_86614 )
      ( DELIVER-5PKG-VERIFY ?auto_86615 ?auto_86616 ?auto_86617 ?auto_86618 ?auto_86619 ?auto_86614 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86670 - OBJ
      ?auto_86671 - OBJ
      ?auto_86672 - OBJ
      ?auto_86673 - OBJ
      ?auto_86674 - OBJ
      ?auto_86669 - LOCATION
    )
    :vars
    (
      ?auto_86679 - LOCATION
      ?auto_86681 - CITY
      ?auto_86678 - LOCATION
      ?auto_86675 - LOCATION
      ?auto_86676 - LOCATION
      ?auto_86677 - LOCATION
      ?auto_86680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86679 ?auto_86681 ) ( IN-CITY ?auto_86669 ?auto_86681 ) ( not ( = ?auto_86669 ?auto_86679 ) ) ( OBJ-AT ?auto_86673 ?auto_86679 ) ( IN-CITY ?auto_86678 ?auto_86681 ) ( not ( = ?auto_86669 ?auto_86678 ) ) ( OBJ-AT ?auto_86672 ?auto_86678 ) ( IN-CITY ?auto_86675 ?auto_86681 ) ( not ( = ?auto_86669 ?auto_86675 ) ) ( OBJ-AT ?auto_86670 ?auto_86675 ) ( IN-CITY ?auto_86676 ?auto_86681 ) ( not ( = ?auto_86669 ?auto_86676 ) ) ( OBJ-AT ?auto_86671 ?auto_86676 ) ( IN-CITY ?auto_86677 ?auto_86681 ) ( not ( = ?auto_86669 ?auto_86677 ) ) ( OBJ-AT ?auto_86674 ?auto_86677 ) ( TRUCK-AT ?auto_86680 ?auto_86669 ) ( not ( = ?auto_86674 ?auto_86671 ) ) ( not ( = ?auto_86676 ?auto_86677 ) ) ( not ( = ?auto_86674 ?auto_86670 ) ) ( not ( = ?auto_86671 ?auto_86670 ) ) ( not ( = ?auto_86675 ?auto_86676 ) ) ( not ( = ?auto_86675 ?auto_86677 ) ) ( not ( = ?auto_86674 ?auto_86672 ) ) ( not ( = ?auto_86671 ?auto_86672 ) ) ( not ( = ?auto_86670 ?auto_86672 ) ) ( not ( = ?auto_86678 ?auto_86675 ) ) ( not ( = ?auto_86678 ?auto_86676 ) ) ( not ( = ?auto_86678 ?auto_86677 ) ) ( not ( = ?auto_86674 ?auto_86673 ) ) ( not ( = ?auto_86671 ?auto_86673 ) ) ( not ( = ?auto_86670 ?auto_86673 ) ) ( not ( = ?auto_86672 ?auto_86673 ) ) ( not ( = ?auto_86679 ?auto_86678 ) ) ( not ( = ?auto_86679 ?auto_86675 ) ) ( not ( = ?auto_86679 ?auto_86676 ) ) ( not ( = ?auto_86679 ?auto_86677 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86674 ?auto_86671 ?auto_86670 ?auto_86673 ?auto_86672 ?auto_86669 )
      ( DELIVER-5PKG-VERIFY ?auto_86670 ?auto_86671 ?auto_86672 ?auto_86673 ?auto_86674 ?auto_86669 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86781 - OBJ
      ?auto_86782 - OBJ
      ?auto_86783 - OBJ
      ?auto_86784 - OBJ
      ?auto_86785 - OBJ
      ?auto_86780 - LOCATION
    )
    :vars
    (
      ?auto_86790 - LOCATION
      ?auto_86792 - CITY
      ?auto_86789 - LOCATION
      ?auto_86786 - LOCATION
      ?auto_86787 - LOCATION
      ?auto_86788 - LOCATION
      ?auto_86791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86790 ?auto_86792 ) ( IN-CITY ?auto_86780 ?auto_86792 ) ( not ( = ?auto_86780 ?auto_86790 ) ) ( OBJ-AT ?auto_86783 ?auto_86790 ) ( IN-CITY ?auto_86789 ?auto_86792 ) ( not ( = ?auto_86780 ?auto_86789 ) ) ( OBJ-AT ?auto_86785 ?auto_86789 ) ( IN-CITY ?auto_86786 ?auto_86792 ) ( not ( = ?auto_86780 ?auto_86786 ) ) ( OBJ-AT ?auto_86781 ?auto_86786 ) ( IN-CITY ?auto_86787 ?auto_86792 ) ( not ( = ?auto_86780 ?auto_86787 ) ) ( OBJ-AT ?auto_86782 ?auto_86787 ) ( IN-CITY ?auto_86788 ?auto_86792 ) ( not ( = ?auto_86780 ?auto_86788 ) ) ( OBJ-AT ?auto_86784 ?auto_86788 ) ( TRUCK-AT ?auto_86791 ?auto_86780 ) ( not ( = ?auto_86784 ?auto_86782 ) ) ( not ( = ?auto_86787 ?auto_86788 ) ) ( not ( = ?auto_86784 ?auto_86781 ) ) ( not ( = ?auto_86782 ?auto_86781 ) ) ( not ( = ?auto_86786 ?auto_86787 ) ) ( not ( = ?auto_86786 ?auto_86788 ) ) ( not ( = ?auto_86784 ?auto_86785 ) ) ( not ( = ?auto_86782 ?auto_86785 ) ) ( not ( = ?auto_86781 ?auto_86785 ) ) ( not ( = ?auto_86789 ?auto_86786 ) ) ( not ( = ?auto_86789 ?auto_86787 ) ) ( not ( = ?auto_86789 ?auto_86788 ) ) ( not ( = ?auto_86784 ?auto_86783 ) ) ( not ( = ?auto_86782 ?auto_86783 ) ) ( not ( = ?auto_86781 ?auto_86783 ) ) ( not ( = ?auto_86785 ?auto_86783 ) ) ( not ( = ?auto_86790 ?auto_86789 ) ) ( not ( = ?auto_86790 ?auto_86786 ) ) ( not ( = ?auto_86790 ?auto_86787 ) ) ( not ( = ?auto_86790 ?auto_86788 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86784 ?auto_86782 ?auto_86781 ?auto_86783 ?auto_86785 ?auto_86780 )
      ( DELIVER-5PKG-VERIFY ?auto_86781 ?auto_86782 ?auto_86783 ?auto_86784 ?auto_86785 ?auto_86780 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86954 - OBJ
      ?auto_86955 - OBJ
      ?auto_86956 - OBJ
      ?auto_86957 - OBJ
      ?auto_86958 - OBJ
      ?auto_86953 - LOCATION
    )
    :vars
    (
      ?auto_86963 - LOCATION
      ?auto_86965 - CITY
      ?auto_86962 - LOCATION
      ?auto_86959 - LOCATION
      ?auto_86960 - LOCATION
      ?auto_86961 - LOCATION
      ?auto_86964 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86963 ?auto_86965 ) ( IN-CITY ?auto_86953 ?auto_86965 ) ( not ( = ?auto_86953 ?auto_86963 ) ) ( OBJ-AT ?auto_86956 ?auto_86963 ) ( IN-CITY ?auto_86962 ?auto_86965 ) ( not ( = ?auto_86953 ?auto_86962 ) ) ( OBJ-AT ?auto_86957 ?auto_86962 ) ( IN-CITY ?auto_86959 ?auto_86965 ) ( not ( = ?auto_86953 ?auto_86959 ) ) ( OBJ-AT ?auto_86954 ?auto_86959 ) ( IN-CITY ?auto_86960 ?auto_86965 ) ( not ( = ?auto_86953 ?auto_86960 ) ) ( OBJ-AT ?auto_86955 ?auto_86960 ) ( IN-CITY ?auto_86961 ?auto_86965 ) ( not ( = ?auto_86953 ?auto_86961 ) ) ( OBJ-AT ?auto_86958 ?auto_86961 ) ( TRUCK-AT ?auto_86964 ?auto_86953 ) ( not ( = ?auto_86958 ?auto_86955 ) ) ( not ( = ?auto_86960 ?auto_86961 ) ) ( not ( = ?auto_86958 ?auto_86954 ) ) ( not ( = ?auto_86955 ?auto_86954 ) ) ( not ( = ?auto_86959 ?auto_86960 ) ) ( not ( = ?auto_86959 ?auto_86961 ) ) ( not ( = ?auto_86958 ?auto_86957 ) ) ( not ( = ?auto_86955 ?auto_86957 ) ) ( not ( = ?auto_86954 ?auto_86957 ) ) ( not ( = ?auto_86962 ?auto_86959 ) ) ( not ( = ?auto_86962 ?auto_86960 ) ) ( not ( = ?auto_86962 ?auto_86961 ) ) ( not ( = ?auto_86958 ?auto_86956 ) ) ( not ( = ?auto_86955 ?auto_86956 ) ) ( not ( = ?auto_86954 ?auto_86956 ) ) ( not ( = ?auto_86957 ?auto_86956 ) ) ( not ( = ?auto_86963 ?auto_86962 ) ) ( not ( = ?auto_86963 ?auto_86959 ) ) ( not ( = ?auto_86963 ?auto_86960 ) ) ( not ( = ?auto_86963 ?auto_86961 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86958 ?auto_86955 ?auto_86954 ?auto_86956 ?auto_86957 ?auto_86953 )
      ( DELIVER-5PKG-VERIFY ?auto_86954 ?auto_86955 ?auto_86956 ?auto_86957 ?auto_86958 ?auto_86953 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88014 - OBJ
      ?auto_88015 - OBJ
      ?auto_88016 - OBJ
      ?auto_88017 - OBJ
      ?auto_88018 - OBJ
      ?auto_88013 - LOCATION
    )
    :vars
    (
      ?auto_88023 - LOCATION
      ?auto_88025 - CITY
      ?auto_88022 - LOCATION
      ?auto_88019 - LOCATION
      ?auto_88020 - LOCATION
      ?auto_88021 - LOCATION
      ?auto_88024 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88023 ?auto_88025 ) ( IN-CITY ?auto_88013 ?auto_88025 ) ( not ( = ?auto_88013 ?auto_88023 ) ) ( OBJ-AT ?auto_88018 ?auto_88023 ) ( IN-CITY ?auto_88022 ?auto_88025 ) ( not ( = ?auto_88013 ?auto_88022 ) ) ( OBJ-AT ?auto_88015 ?auto_88022 ) ( IN-CITY ?auto_88019 ?auto_88025 ) ( not ( = ?auto_88013 ?auto_88019 ) ) ( OBJ-AT ?auto_88014 ?auto_88019 ) ( IN-CITY ?auto_88020 ?auto_88025 ) ( not ( = ?auto_88013 ?auto_88020 ) ) ( OBJ-AT ?auto_88017 ?auto_88020 ) ( IN-CITY ?auto_88021 ?auto_88025 ) ( not ( = ?auto_88013 ?auto_88021 ) ) ( OBJ-AT ?auto_88016 ?auto_88021 ) ( TRUCK-AT ?auto_88024 ?auto_88013 ) ( not ( = ?auto_88016 ?auto_88017 ) ) ( not ( = ?auto_88020 ?auto_88021 ) ) ( not ( = ?auto_88016 ?auto_88014 ) ) ( not ( = ?auto_88017 ?auto_88014 ) ) ( not ( = ?auto_88019 ?auto_88020 ) ) ( not ( = ?auto_88019 ?auto_88021 ) ) ( not ( = ?auto_88016 ?auto_88015 ) ) ( not ( = ?auto_88017 ?auto_88015 ) ) ( not ( = ?auto_88014 ?auto_88015 ) ) ( not ( = ?auto_88022 ?auto_88019 ) ) ( not ( = ?auto_88022 ?auto_88020 ) ) ( not ( = ?auto_88022 ?auto_88021 ) ) ( not ( = ?auto_88016 ?auto_88018 ) ) ( not ( = ?auto_88017 ?auto_88018 ) ) ( not ( = ?auto_88014 ?auto_88018 ) ) ( not ( = ?auto_88015 ?auto_88018 ) ) ( not ( = ?auto_88023 ?auto_88022 ) ) ( not ( = ?auto_88023 ?auto_88019 ) ) ( not ( = ?auto_88023 ?auto_88020 ) ) ( not ( = ?auto_88023 ?auto_88021 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88016 ?auto_88017 ?auto_88014 ?auto_88018 ?auto_88015 ?auto_88013 )
      ( DELIVER-5PKG-VERIFY ?auto_88014 ?auto_88015 ?auto_88016 ?auto_88017 ?auto_88018 ?auto_88013 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88069 - OBJ
      ?auto_88070 - OBJ
      ?auto_88071 - OBJ
      ?auto_88072 - OBJ
      ?auto_88073 - OBJ
      ?auto_88068 - LOCATION
    )
    :vars
    (
      ?auto_88078 - LOCATION
      ?auto_88080 - CITY
      ?auto_88077 - LOCATION
      ?auto_88074 - LOCATION
      ?auto_88075 - LOCATION
      ?auto_88076 - LOCATION
      ?auto_88079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88078 ?auto_88080 ) ( IN-CITY ?auto_88068 ?auto_88080 ) ( not ( = ?auto_88068 ?auto_88078 ) ) ( OBJ-AT ?auto_88072 ?auto_88078 ) ( IN-CITY ?auto_88077 ?auto_88080 ) ( not ( = ?auto_88068 ?auto_88077 ) ) ( OBJ-AT ?auto_88070 ?auto_88077 ) ( IN-CITY ?auto_88074 ?auto_88080 ) ( not ( = ?auto_88068 ?auto_88074 ) ) ( OBJ-AT ?auto_88069 ?auto_88074 ) ( IN-CITY ?auto_88075 ?auto_88080 ) ( not ( = ?auto_88068 ?auto_88075 ) ) ( OBJ-AT ?auto_88073 ?auto_88075 ) ( IN-CITY ?auto_88076 ?auto_88080 ) ( not ( = ?auto_88068 ?auto_88076 ) ) ( OBJ-AT ?auto_88071 ?auto_88076 ) ( TRUCK-AT ?auto_88079 ?auto_88068 ) ( not ( = ?auto_88071 ?auto_88073 ) ) ( not ( = ?auto_88075 ?auto_88076 ) ) ( not ( = ?auto_88071 ?auto_88069 ) ) ( not ( = ?auto_88073 ?auto_88069 ) ) ( not ( = ?auto_88074 ?auto_88075 ) ) ( not ( = ?auto_88074 ?auto_88076 ) ) ( not ( = ?auto_88071 ?auto_88070 ) ) ( not ( = ?auto_88073 ?auto_88070 ) ) ( not ( = ?auto_88069 ?auto_88070 ) ) ( not ( = ?auto_88077 ?auto_88074 ) ) ( not ( = ?auto_88077 ?auto_88075 ) ) ( not ( = ?auto_88077 ?auto_88076 ) ) ( not ( = ?auto_88071 ?auto_88072 ) ) ( not ( = ?auto_88073 ?auto_88072 ) ) ( not ( = ?auto_88069 ?auto_88072 ) ) ( not ( = ?auto_88070 ?auto_88072 ) ) ( not ( = ?auto_88078 ?auto_88077 ) ) ( not ( = ?auto_88078 ?auto_88074 ) ) ( not ( = ?auto_88078 ?auto_88075 ) ) ( not ( = ?auto_88078 ?auto_88076 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88071 ?auto_88073 ?auto_88069 ?auto_88072 ?auto_88070 ?auto_88068 )
      ( DELIVER-5PKG-VERIFY ?auto_88069 ?auto_88070 ?auto_88071 ?auto_88072 ?auto_88073 ?auto_88068 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88124 - OBJ
      ?auto_88125 - OBJ
      ?auto_88126 - OBJ
      ?auto_88127 - OBJ
      ?auto_88128 - OBJ
      ?auto_88123 - LOCATION
    )
    :vars
    (
      ?auto_88133 - LOCATION
      ?auto_88135 - CITY
      ?auto_88132 - LOCATION
      ?auto_88129 - LOCATION
      ?auto_88130 - LOCATION
      ?auto_88131 - LOCATION
      ?auto_88134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88133 ?auto_88135 ) ( IN-CITY ?auto_88123 ?auto_88135 ) ( not ( = ?auto_88123 ?auto_88133 ) ) ( OBJ-AT ?auto_88128 ?auto_88133 ) ( IN-CITY ?auto_88132 ?auto_88135 ) ( not ( = ?auto_88123 ?auto_88132 ) ) ( OBJ-AT ?auto_88125 ?auto_88132 ) ( IN-CITY ?auto_88129 ?auto_88135 ) ( not ( = ?auto_88123 ?auto_88129 ) ) ( OBJ-AT ?auto_88124 ?auto_88129 ) ( IN-CITY ?auto_88130 ?auto_88135 ) ( not ( = ?auto_88123 ?auto_88130 ) ) ( OBJ-AT ?auto_88126 ?auto_88130 ) ( IN-CITY ?auto_88131 ?auto_88135 ) ( not ( = ?auto_88123 ?auto_88131 ) ) ( OBJ-AT ?auto_88127 ?auto_88131 ) ( TRUCK-AT ?auto_88134 ?auto_88123 ) ( not ( = ?auto_88127 ?auto_88126 ) ) ( not ( = ?auto_88130 ?auto_88131 ) ) ( not ( = ?auto_88127 ?auto_88124 ) ) ( not ( = ?auto_88126 ?auto_88124 ) ) ( not ( = ?auto_88129 ?auto_88130 ) ) ( not ( = ?auto_88129 ?auto_88131 ) ) ( not ( = ?auto_88127 ?auto_88125 ) ) ( not ( = ?auto_88126 ?auto_88125 ) ) ( not ( = ?auto_88124 ?auto_88125 ) ) ( not ( = ?auto_88132 ?auto_88129 ) ) ( not ( = ?auto_88132 ?auto_88130 ) ) ( not ( = ?auto_88132 ?auto_88131 ) ) ( not ( = ?auto_88127 ?auto_88128 ) ) ( not ( = ?auto_88126 ?auto_88128 ) ) ( not ( = ?auto_88124 ?auto_88128 ) ) ( not ( = ?auto_88125 ?auto_88128 ) ) ( not ( = ?auto_88133 ?auto_88132 ) ) ( not ( = ?auto_88133 ?auto_88129 ) ) ( not ( = ?auto_88133 ?auto_88130 ) ) ( not ( = ?auto_88133 ?auto_88131 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88127 ?auto_88126 ?auto_88124 ?auto_88128 ?auto_88125 ?auto_88123 )
      ( DELIVER-5PKG-VERIFY ?auto_88124 ?auto_88125 ?auto_88126 ?auto_88127 ?auto_88128 ?auto_88123 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88179 - OBJ
      ?auto_88180 - OBJ
      ?auto_88181 - OBJ
      ?auto_88182 - OBJ
      ?auto_88183 - OBJ
      ?auto_88178 - LOCATION
    )
    :vars
    (
      ?auto_88188 - LOCATION
      ?auto_88190 - CITY
      ?auto_88187 - LOCATION
      ?auto_88184 - LOCATION
      ?auto_88185 - LOCATION
      ?auto_88186 - LOCATION
      ?auto_88189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88188 ?auto_88190 ) ( IN-CITY ?auto_88178 ?auto_88190 ) ( not ( = ?auto_88178 ?auto_88188 ) ) ( OBJ-AT ?auto_88182 ?auto_88188 ) ( IN-CITY ?auto_88187 ?auto_88190 ) ( not ( = ?auto_88178 ?auto_88187 ) ) ( OBJ-AT ?auto_88180 ?auto_88187 ) ( IN-CITY ?auto_88184 ?auto_88190 ) ( not ( = ?auto_88178 ?auto_88184 ) ) ( OBJ-AT ?auto_88179 ?auto_88184 ) ( IN-CITY ?auto_88185 ?auto_88190 ) ( not ( = ?auto_88178 ?auto_88185 ) ) ( OBJ-AT ?auto_88181 ?auto_88185 ) ( IN-CITY ?auto_88186 ?auto_88190 ) ( not ( = ?auto_88178 ?auto_88186 ) ) ( OBJ-AT ?auto_88183 ?auto_88186 ) ( TRUCK-AT ?auto_88189 ?auto_88178 ) ( not ( = ?auto_88183 ?auto_88181 ) ) ( not ( = ?auto_88185 ?auto_88186 ) ) ( not ( = ?auto_88183 ?auto_88179 ) ) ( not ( = ?auto_88181 ?auto_88179 ) ) ( not ( = ?auto_88184 ?auto_88185 ) ) ( not ( = ?auto_88184 ?auto_88186 ) ) ( not ( = ?auto_88183 ?auto_88180 ) ) ( not ( = ?auto_88181 ?auto_88180 ) ) ( not ( = ?auto_88179 ?auto_88180 ) ) ( not ( = ?auto_88187 ?auto_88184 ) ) ( not ( = ?auto_88187 ?auto_88185 ) ) ( not ( = ?auto_88187 ?auto_88186 ) ) ( not ( = ?auto_88183 ?auto_88182 ) ) ( not ( = ?auto_88181 ?auto_88182 ) ) ( not ( = ?auto_88179 ?auto_88182 ) ) ( not ( = ?auto_88180 ?auto_88182 ) ) ( not ( = ?auto_88188 ?auto_88187 ) ) ( not ( = ?auto_88188 ?auto_88184 ) ) ( not ( = ?auto_88188 ?auto_88185 ) ) ( not ( = ?auto_88188 ?auto_88186 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88183 ?auto_88181 ?auto_88179 ?auto_88182 ?auto_88180 ?auto_88178 )
      ( DELIVER-5PKG-VERIFY ?auto_88179 ?auto_88180 ?auto_88181 ?auto_88182 ?auto_88183 ?auto_88178 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88524 - OBJ
      ?auto_88525 - OBJ
      ?auto_88526 - OBJ
      ?auto_88527 - OBJ
      ?auto_88528 - OBJ
      ?auto_88523 - LOCATION
    )
    :vars
    (
      ?auto_88533 - LOCATION
      ?auto_88535 - CITY
      ?auto_88532 - LOCATION
      ?auto_88529 - LOCATION
      ?auto_88530 - LOCATION
      ?auto_88531 - LOCATION
      ?auto_88534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88533 ?auto_88535 ) ( IN-CITY ?auto_88523 ?auto_88535 ) ( not ( = ?auto_88523 ?auto_88533 ) ) ( OBJ-AT ?auto_88526 ?auto_88533 ) ( IN-CITY ?auto_88532 ?auto_88535 ) ( not ( = ?auto_88523 ?auto_88532 ) ) ( OBJ-AT ?auto_88525 ?auto_88532 ) ( IN-CITY ?auto_88529 ?auto_88535 ) ( not ( = ?auto_88523 ?auto_88529 ) ) ( OBJ-AT ?auto_88524 ?auto_88529 ) ( IN-CITY ?auto_88530 ?auto_88535 ) ( not ( = ?auto_88523 ?auto_88530 ) ) ( OBJ-AT ?auto_88528 ?auto_88530 ) ( IN-CITY ?auto_88531 ?auto_88535 ) ( not ( = ?auto_88523 ?auto_88531 ) ) ( OBJ-AT ?auto_88527 ?auto_88531 ) ( TRUCK-AT ?auto_88534 ?auto_88523 ) ( not ( = ?auto_88527 ?auto_88528 ) ) ( not ( = ?auto_88530 ?auto_88531 ) ) ( not ( = ?auto_88527 ?auto_88524 ) ) ( not ( = ?auto_88528 ?auto_88524 ) ) ( not ( = ?auto_88529 ?auto_88530 ) ) ( not ( = ?auto_88529 ?auto_88531 ) ) ( not ( = ?auto_88527 ?auto_88525 ) ) ( not ( = ?auto_88528 ?auto_88525 ) ) ( not ( = ?auto_88524 ?auto_88525 ) ) ( not ( = ?auto_88532 ?auto_88529 ) ) ( not ( = ?auto_88532 ?auto_88530 ) ) ( not ( = ?auto_88532 ?auto_88531 ) ) ( not ( = ?auto_88527 ?auto_88526 ) ) ( not ( = ?auto_88528 ?auto_88526 ) ) ( not ( = ?auto_88524 ?auto_88526 ) ) ( not ( = ?auto_88525 ?auto_88526 ) ) ( not ( = ?auto_88533 ?auto_88532 ) ) ( not ( = ?auto_88533 ?auto_88529 ) ) ( not ( = ?auto_88533 ?auto_88530 ) ) ( not ( = ?auto_88533 ?auto_88531 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88527 ?auto_88528 ?auto_88524 ?auto_88526 ?auto_88525 ?auto_88523 )
      ( DELIVER-5PKG-VERIFY ?auto_88524 ?auto_88525 ?auto_88526 ?auto_88527 ?auto_88528 ?auto_88523 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88579 - OBJ
      ?auto_88580 - OBJ
      ?auto_88581 - OBJ
      ?auto_88582 - OBJ
      ?auto_88583 - OBJ
      ?auto_88578 - LOCATION
    )
    :vars
    (
      ?auto_88588 - LOCATION
      ?auto_88590 - CITY
      ?auto_88587 - LOCATION
      ?auto_88584 - LOCATION
      ?auto_88585 - LOCATION
      ?auto_88586 - LOCATION
      ?auto_88589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88588 ?auto_88590 ) ( IN-CITY ?auto_88578 ?auto_88590 ) ( not ( = ?auto_88578 ?auto_88588 ) ) ( OBJ-AT ?auto_88581 ?auto_88588 ) ( IN-CITY ?auto_88587 ?auto_88590 ) ( not ( = ?auto_88578 ?auto_88587 ) ) ( OBJ-AT ?auto_88580 ?auto_88587 ) ( IN-CITY ?auto_88584 ?auto_88590 ) ( not ( = ?auto_88578 ?auto_88584 ) ) ( OBJ-AT ?auto_88579 ?auto_88584 ) ( IN-CITY ?auto_88585 ?auto_88590 ) ( not ( = ?auto_88578 ?auto_88585 ) ) ( OBJ-AT ?auto_88582 ?auto_88585 ) ( IN-CITY ?auto_88586 ?auto_88590 ) ( not ( = ?auto_88578 ?auto_88586 ) ) ( OBJ-AT ?auto_88583 ?auto_88586 ) ( TRUCK-AT ?auto_88589 ?auto_88578 ) ( not ( = ?auto_88583 ?auto_88582 ) ) ( not ( = ?auto_88585 ?auto_88586 ) ) ( not ( = ?auto_88583 ?auto_88579 ) ) ( not ( = ?auto_88582 ?auto_88579 ) ) ( not ( = ?auto_88584 ?auto_88585 ) ) ( not ( = ?auto_88584 ?auto_88586 ) ) ( not ( = ?auto_88583 ?auto_88580 ) ) ( not ( = ?auto_88582 ?auto_88580 ) ) ( not ( = ?auto_88579 ?auto_88580 ) ) ( not ( = ?auto_88587 ?auto_88584 ) ) ( not ( = ?auto_88587 ?auto_88585 ) ) ( not ( = ?auto_88587 ?auto_88586 ) ) ( not ( = ?auto_88583 ?auto_88581 ) ) ( not ( = ?auto_88582 ?auto_88581 ) ) ( not ( = ?auto_88579 ?auto_88581 ) ) ( not ( = ?auto_88580 ?auto_88581 ) ) ( not ( = ?auto_88588 ?auto_88587 ) ) ( not ( = ?auto_88588 ?auto_88584 ) ) ( not ( = ?auto_88588 ?auto_88585 ) ) ( not ( = ?auto_88588 ?auto_88586 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88583 ?auto_88582 ?auto_88579 ?auto_88581 ?auto_88580 ?auto_88578 )
      ( DELIVER-5PKG-VERIFY ?auto_88579 ?auto_88580 ?auto_88581 ?auto_88582 ?auto_88583 ?auto_88578 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88982 - OBJ
      ?auto_88983 - OBJ
      ?auto_88984 - OBJ
      ?auto_88985 - OBJ
      ?auto_88986 - OBJ
      ?auto_88981 - LOCATION
    )
    :vars
    (
      ?auto_88991 - LOCATION
      ?auto_88993 - CITY
      ?auto_88990 - LOCATION
      ?auto_88987 - LOCATION
      ?auto_88988 - LOCATION
      ?auto_88989 - LOCATION
      ?auto_88992 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88991 ?auto_88993 ) ( IN-CITY ?auto_88981 ?auto_88993 ) ( not ( = ?auto_88981 ?auto_88991 ) ) ( OBJ-AT ?auto_88983 ?auto_88991 ) ( IN-CITY ?auto_88990 ?auto_88993 ) ( not ( = ?auto_88981 ?auto_88990 ) ) ( OBJ-AT ?auto_88986 ?auto_88990 ) ( IN-CITY ?auto_88987 ?auto_88993 ) ( not ( = ?auto_88981 ?auto_88987 ) ) ( OBJ-AT ?auto_88982 ?auto_88987 ) ( IN-CITY ?auto_88988 ?auto_88993 ) ( not ( = ?auto_88981 ?auto_88988 ) ) ( OBJ-AT ?auto_88985 ?auto_88988 ) ( IN-CITY ?auto_88989 ?auto_88993 ) ( not ( = ?auto_88981 ?auto_88989 ) ) ( OBJ-AT ?auto_88984 ?auto_88989 ) ( TRUCK-AT ?auto_88992 ?auto_88981 ) ( not ( = ?auto_88984 ?auto_88985 ) ) ( not ( = ?auto_88988 ?auto_88989 ) ) ( not ( = ?auto_88984 ?auto_88982 ) ) ( not ( = ?auto_88985 ?auto_88982 ) ) ( not ( = ?auto_88987 ?auto_88988 ) ) ( not ( = ?auto_88987 ?auto_88989 ) ) ( not ( = ?auto_88984 ?auto_88986 ) ) ( not ( = ?auto_88985 ?auto_88986 ) ) ( not ( = ?auto_88982 ?auto_88986 ) ) ( not ( = ?auto_88990 ?auto_88987 ) ) ( not ( = ?auto_88990 ?auto_88988 ) ) ( not ( = ?auto_88990 ?auto_88989 ) ) ( not ( = ?auto_88984 ?auto_88983 ) ) ( not ( = ?auto_88985 ?auto_88983 ) ) ( not ( = ?auto_88982 ?auto_88983 ) ) ( not ( = ?auto_88986 ?auto_88983 ) ) ( not ( = ?auto_88991 ?auto_88990 ) ) ( not ( = ?auto_88991 ?auto_88987 ) ) ( not ( = ?auto_88991 ?auto_88988 ) ) ( not ( = ?auto_88991 ?auto_88989 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88984 ?auto_88985 ?auto_88982 ?auto_88983 ?auto_88986 ?auto_88981 )
      ( DELIVER-5PKG-VERIFY ?auto_88982 ?auto_88983 ?auto_88984 ?auto_88985 ?auto_88986 ?auto_88981 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89096 - OBJ
      ?auto_89097 - OBJ
      ?auto_89098 - OBJ
      ?auto_89099 - OBJ
      ?auto_89100 - OBJ
      ?auto_89095 - LOCATION
    )
    :vars
    (
      ?auto_89105 - LOCATION
      ?auto_89107 - CITY
      ?auto_89104 - LOCATION
      ?auto_89101 - LOCATION
      ?auto_89102 - LOCATION
      ?auto_89103 - LOCATION
      ?auto_89106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89105 ?auto_89107 ) ( IN-CITY ?auto_89095 ?auto_89107 ) ( not ( = ?auto_89095 ?auto_89105 ) ) ( OBJ-AT ?auto_89097 ?auto_89105 ) ( IN-CITY ?auto_89104 ?auto_89107 ) ( not ( = ?auto_89095 ?auto_89104 ) ) ( OBJ-AT ?auto_89099 ?auto_89104 ) ( IN-CITY ?auto_89101 ?auto_89107 ) ( not ( = ?auto_89095 ?auto_89101 ) ) ( OBJ-AT ?auto_89096 ?auto_89101 ) ( IN-CITY ?auto_89102 ?auto_89107 ) ( not ( = ?auto_89095 ?auto_89102 ) ) ( OBJ-AT ?auto_89100 ?auto_89102 ) ( IN-CITY ?auto_89103 ?auto_89107 ) ( not ( = ?auto_89095 ?auto_89103 ) ) ( OBJ-AT ?auto_89098 ?auto_89103 ) ( TRUCK-AT ?auto_89106 ?auto_89095 ) ( not ( = ?auto_89098 ?auto_89100 ) ) ( not ( = ?auto_89102 ?auto_89103 ) ) ( not ( = ?auto_89098 ?auto_89096 ) ) ( not ( = ?auto_89100 ?auto_89096 ) ) ( not ( = ?auto_89101 ?auto_89102 ) ) ( not ( = ?auto_89101 ?auto_89103 ) ) ( not ( = ?auto_89098 ?auto_89099 ) ) ( not ( = ?auto_89100 ?auto_89099 ) ) ( not ( = ?auto_89096 ?auto_89099 ) ) ( not ( = ?auto_89104 ?auto_89101 ) ) ( not ( = ?auto_89104 ?auto_89102 ) ) ( not ( = ?auto_89104 ?auto_89103 ) ) ( not ( = ?auto_89098 ?auto_89097 ) ) ( not ( = ?auto_89100 ?auto_89097 ) ) ( not ( = ?auto_89096 ?auto_89097 ) ) ( not ( = ?auto_89099 ?auto_89097 ) ) ( not ( = ?auto_89105 ?auto_89104 ) ) ( not ( = ?auto_89105 ?auto_89101 ) ) ( not ( = ?auto_89105 ?auto_89102 ) ) ( not ( = ?auto_89105 ?auto_89103 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89098 ?auto_89100 ?auto_89096 ?auto_89097 ?auto_89099 ?auto_89095 )
      ( DELIVER-5PKG-VERIFY ?auto_89096 ?auto_89097 ?auto_89098 ?auto_89099 ?auto_89100 ?auto_89095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89266 - OBJ
      ?auto_89267 - OBJ
      ?auto_89268 - OBJ
      ?auto_89269 - OBJ
      ?auto_89270 - OBJ
      ?auto_89265 - LOCATION
    )
    :vars
    (
      ?auto_89275 - LOCATION
      ?auto_89277 - CITY
      ?auto_89274 - LOCATION
      ?auto_89271 - LOCATION
      ?auto_89272 - LOCATION
      ?auto_89273 - LOCATION
      ?auto_89276 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89275 ?auto_89277 ) ( IN-CITY ?auto_89265 ?auto_89277 ) ( not ( = ?auto_89265 ?auto_89275 ) ) ( OBJ-AT ?auto_89267 ?auto_89275 ) ( IN-CITY ?auto_89274 ?auto_89277 ) ( not ( = ?auto_89265 ?auto_89274 ) ) ( OBJ-AT ?auto_89270 ?auto_89274 ) ( IN-CITY ?auto_89271 ?auto_89277 ) ( not ( = ?auto_89265 ?auto_89271 ) ) ( OBJ-AT ?auto_89266 ?auto_89271 ) ( IN-CITY ?auto_89272 ?auto_89277 ) ( not ( = ?auto_89265 ?auto_89272 ) ) ( OBJ-AT ?auto_89268 ?auto_89272 ) ( IN-CITY ?auto_89273 ?auto_89277 ) ( not ( = ?auto_89265 ?auto_89273 ) ) ( OBJ-AT ?auto_89269 ?auto_89273 ) ( TRUCK-AT ?auto_89276 ?auto_89265 ) ( not ( = ?auto_89269 ?auto_89268 ) ) ( not ( = ?auto_89272 ?auto_89273 ) ) ( not ( = ?auto_89269 ?auto_89266 ) ) ( not ( = ?auto_89268 ?auto_89266 ) ) ( not ( = ?auto_89271 ?auto_89272 ) ) ( not ( = ?auto_89271 ?auto_89273 ) ) ( not ( = ?auto_89269 ?auto_89270 ) ) ( not ( = ?auto_89268 ?auto_89270 ) ) ( not ( = ?auto_89266 ?auto_89270 ) ) ( not ( = ?auto_89274 ?auto_89271 ) ) ( not ( = ?auto_89274 ?auto_89272 ) ) ( not ( = ?auto_89274 ?auto_89273 ) ) ( not ( = ?auto_89269 ?auto_89267 ) ) ( not ( = ?auto_89268 ?auto_89267 ) ) ( not ( = ?auto_89266 ?auto_89267 ) ) ( not ( = ?auto_89270 ?auto_89267 ) ) ( not ( = ?auto_89275 ?auto_89274 ) ) ( not ( = ?auto_89275 ?auto_89271 ) ) ( not ( = ?auto_89275 ?auto_89272 ) ) ( not ( = ?auto_89275 ?auto_89273 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89269 ?auto_89268 ?auto_89266 ?auto_89267 ?auto_89270 ?auto_89265 )
      ( DELIVER-5PKG-VERIFY ?auto_89266 ?auto_89267 ?auto_89268 ?auto_89269 ?auto_89270 ?auto_89265 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89439 - OBJ
      ?auto_89440 - OBJ
      ?auto_89441 - OBJ
      ?auto_89442 - OBJ
      ?auto_89443 - OBJ
      ?auto_89438 - LOCATION
    )
    :vars
    (
      ?auto_89448 - LOCATION
      ?auto_89450 - CITY
      ?auto_89447 - LOCATION
      ?auto_89444 - LOCATION
      ?auto_89445 - LOCATION
      ?auto_89446 - LOCATION
      ?auto_89449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89448 ?auto_89450 ) ( IN-CITY ?auto_89438 ?auto_89450 ) ( not ( = ?auto_89438 ?auto_89448 ) ) ( OBJ-AT ?auto_89440 ?auto_89448 ) ( IN-CITY ?auto_89447 ?auto_89450 ) ( not ( = ?auto_89438 ?auto_89447 ) ) ( OBJ-AT ?auto_89442 ?auto_89447 ) ( IN-CITY ?auto_89444 ?auto_89450 ) ( not ( = ?auto_89438 ?auto_89444 ) ) ( OBJ-AT ?auto_89439 ?auto_89444 ) ( IN-CITY ?auto_89445 ?auto_89450 ) ( not ( = ?auto_89438 ?auto_89445 ) ) ( OBJ-AT ?auto_89441 ?auto_89445 ) ( IN-CITY ?auto_89446 ?auto_89450 ) ( not ( = ?auto_89438 ?auto_89446 ) ) ( OBJ-AT ?auto_89443 ?auto_89446 ) ( TRUCK-AT ?auto_89449 ?auto_89438 ) ( not ( = ?auto_89443 ?auto_89441 ) ) ( not ( = ?auto_89445 ?auto_89446 ) ) ( not ( = ?auto_89443 ?auto_89439 ) ) ( not ( = ?auto_89441 ?auto_89439 ) ) ( not ( = ?auto_89444 ?auto_89445 ) ) ( not ( = ?auto_89444 ?auto_89446 ) ) ( not ( = ?auto_89443 ?auto_89442 ) ) ( not ( = ?auto_89441 ?auto_89442 ) ) ( not ( = ?auto_89439 ?auto_89442 ) ) ( not ( = ?auto_89447 ?auto_89444 ) ) ( not ( = ?auto_89447 ?auto_89445 ) ) ( not ( = ?auto_89447 ?auto_89446 ) ) ( not ( = ?auto_89443 ?auto_89440 ) ) ( not ( = ?auto_89441 ?auto_89440 ) ) ( not ( = ?auto_89439 ?auto_89440 ) ) ( not ( = ?auto_89442 ?auto_89440 ) ) ( not ( = ?auto_89448 ?auto_89447 ) ) ( not ( = ?auto_89448 ?auto_89444 ) ) ( not ( = ?auto_89448 ?auto_89445 ) ) ( not ( = ?auto_89448 ?auto_89446 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89443 ?auto_89441 ?auto_89439 ?auto_89440 ?auto_89442 ?auto_89438 )
      ( DELIVER-5PKG-VERIFY ?auto_89439 ?auto_89440 ?auto_89441 ?auto_89442 ?auto_89443 ?auto_89438 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89968 - OBJ
      ?auto_89969 - OBJ
      ?auto_89970 - OBJ
      ?auto_89971 - OBJ
      ?auto_89972 - OBJ
      ?auto_89967 - LOCATION
    )
    :vars
    (
      ?auto_89977 - LOCATION
      ?auto_89979 - CITY
      ?auto_89976 - LOCATION
      ?auto_89973 - LOCATION
      ?auto_89974 - LOCATION
      ?auto_89975 - LOCATION
      ?auto_89978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89977 ?auto_89979 ) ( IN-CITY ?auto_89967 ?auto_89979 ) ( not ( = ?auto_89967 ?auto_89977 ) ) ( OBJ-AT ?auto_89969 ?auto_89977 ) ( IN-CITY ?auto_89976 ?auto_89979 ) ( not ( = ?auto_89967 ?auto_89976 ) ) ( OBJ-AT ?auto_89970 ?auto_89976 ) ( IN-CITY ?auto_89973 ?auto_89979 ) ( not ( = ?auto_89967 ?auto_89973 ) ) ( OBJ-AT ?auto_89968 ?auto_89973 ) ( IN-CITY ?auto_89974 ?auto_89979 ) ( not ( = ?auto_89967 ?auto_89974 ) ) ( OBJ-AT ?auto_89972 ?auto_89974 ) ( IN-CITY ?auto_89975 ?auto_89979 ) ( not ( = ?auto_89967 ?auto_89975 ) ) ( OBJ-AT ?auto_89971 ?auto_89975 ) ( TRUCK-AT ?auto_89978 ?auto_89967 ) ( not ( = ?auto_89971 ?auto_89972 ) ) ( not ( = ?auto_89974 ?auto_89975 ) ) ( not ( = ?auto_89971 ?auto_89968 ) ) ( not ( = ?auto_89972 ?auto_89968 ) ) ( not ( = ?auto_89973 ?auto_89974 ) ) ( not ( = ?auto_89973 ?auto_89975 ) ) ( not ( = ?auto_89971 ?auto_89970 ) ) ( not ( = ?auto_89972 ?auto_89970 ) ) ( not ( = ?auto_89968 ?auto_89970 ) ) ( not ( = ?auto_89976 ?auto_89973 ) ) ( not ( = ?auto_89976 ?auto_89974 ) ) ( not ( = ?auto_89976 ?auto_89975 ) ) ( not ( = ?auto_89971 ?auto_89969 ) ) ( not ( = ?auto_89972 ?auto_89969 ) ) ( not ( = ?auto_89968 ?auto_89969 ) ) ( not ( = ?auto_89970 ?auto_89969 ) ) ( not ( = ?auto_89977 ?auto_89976 ) ) ( not ( = ?auto_89977 ?auto_89973 ) ) ( not ( = ?auto_89977 ?auto_89974 ) ) ( not ( = ?auto_89977 ?auto_89975 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89971 ?auto_89972 ?auto_89968 ?auto_89969 ?auto_89970 ?auto_89967 )
      ( DELIVER-5PKG-VERIFY ?auto_89968 ?auto_89969 ?auto_89970 ?auto_89971 ?auto_89972 ?auto_89967 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90023 - OBJ
      ?auto_90024 - OBJ
      ?auto_90025 - OBJ
      ?auto_90026 - OBJ
      ?auto_90027 - OBJ
      ?auto_90022 - LOCATION
    )
    :vars
    (
      ?auto_90032 - LOCATION
      ?auto_90034 - CITY
      ?auto_90031 - LOCATION
      ?auto_90028 - LOCATION
      ?auto_90029 - LOCATION
      ?auto_90030 - LOCATION
      ?auto_90033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90032 ?auto_90034 ) ( IN-CITY ?auto_90022 ?auto_90034 ) ( not ( = ?auto_90022 ?auto_90032 ) ) ( OBJ-AT ?auto_90024 ?auto_90032 ) ( IN-CITY ?auto_90031 ?auto_90034 ) ( not ( = ?auto_90022 ?auto_90031 ) ) ( OBJ-AT ?auto_90025 ?auto_90031 ) ( IN-CITY ?auto_90028 ?auto_90034 ) ( not ( = ?auto_90022 ?auto_90028 ) ) ( OBJ-AT ?auto_90023 ?auto_90028 ) ( IN-CITY ?auto_90029 ?auto_90034 ) ( not ( = ?auto_90022 ?auto_90029 ) ) ( OBJ-AT ?auto_90026 ?auto_90029 ) ( IN-CITY ?auto_90030 ?auto_90034 ) ( not ( = ?auto_90022 ?auto_90030 ) ) ( OBJ-AT ?auto_90027 ?auto_90030 ) ( TRUCK-AT ?auto_90033 ?auto_90022 ) ( not ( = ?auto_90027 ?auto_90026 ) ) ( not ( = ?auto_90029 ?auto_90030 ) ) ( not ( = ?auto_90027 ?auto_90023 ) ) ( not ( = ?auto_90026 ?auto_90023 ) ) ( not ( = ?auto_90028 ?auto_90029 ) ) ( not ( = ?auto_90028 ?auto_90030 ) ) ( not ( = ?auto_90027 ?auto_90025 ) ) ( not ( = ?auto_90026 ?auto_90025 ) ) ( not ( = ?auto_90023 ?auto_90025 ) ) ( not ( = ?auto_90031 ?auto_90028 ) ) ( not ( = ?auto_90031 ?auto_90029 ) ) ( not ( = ?auto_90031 ?auto_90030 ) ) ( not ( = ?auto_90027 ?auto_90024 ) ) ( not ( = ?auto_90026 ?auto_90024 ) ) ( not ( = ?auto_90023 ?auto_90024 ) ) ( not ( = ?auto_90025 ?auto_90024 ) ) ( not ( = ?auto_90032 ?auto_90031 ) ) ( not ( = ?auto_90032 ?auto_90028 ) ) ( not ( = ?auto_90032 ?auto_90029 ) ) ( not ( = ?auto_90032 ?auto_90030 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90027 ?auto_90026 ?auto_90023 ?auto_90024 ?auto_90025 ?auto_90022 )
      ( DELIVER-5PKG-VERIFY ?auto_90023 ?auto_90024 ?auto_90025 ?auto_90026 ?auto_90027 ?auto_90022 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90843 - OBJ
      ?auto_90844 - OBJ
      ?auto_90845 - OBJ
      ?auto_90846 - OBJ
      ?auto_90847 - OBJ
      ?auto_90842 - LOCATION
    )
    :vars
    (
      ?auto_90852 - LOCATION
      ?auto_90854 - CITY
      ?auto_90851 - LOCATION
      ?auto_90848 - LOCATION
      ?auto_90849 - LOCATION
      ?auto_90850 - LOCATION
      ?auto_90853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90852 ?auto_90854 ) ( IN-CITY ?auto_90842 ?auto_90854 ) ( not ( = ?auto_90842 ?auto_90852 ) ) ( OBJ-AT ?auto_90847 ?auto_90852 ) ( IN-CITY ?auto_90851 ?auto_90854 ) ( not ( = ?auto_90842 ?auto_90851 ) ) ( OBJ-AT ?auto_90843 ?auto_90851 ) ( IN-CITY ?auto_90848 ?auto_90854 ) ( not ( = ?auto_90842 ?auto_90848 ) ) ( OBJ-AT ?auto_90846 ?auto_90848 ) ( IN-CITY ?auto_90849 ?auto_90854 ) ( not ( = ?auto_90842 ?auto_90849 ) ) ( OBJ-AT ?auto_90845 ?auto_90849 ) ( IN-CITY ?auto_90850 ?auto_90854 ) ( not ( = ?auto_90842 ?auto_90850 ) ) ( OBJ-AT ?auto_90844 ?auto_90850 ) ( TRUCK-AT ?auto_90853 ?auto_90842 ) ( not ( = ?auto_90844 ?auto_90845 ) ) ( not ( = ?auto_90849 ?auto_90850 ) ) ( not ( = ?auto_90844 ?auto_90846 ) ) ( not ( = ?auto_90845 ?auto_90846 ) ) ( not ( = ?auto_90848 ?auto_90849 ) ) ( not ( = ?auto_90848 ?auto_90850 ) ) ( not ( = ?auto_90844 ?auto_90843 ) ) ( not ( = ?auto_90845 ?auto_90843 ) ) ( not ( = ?auto_90846 ?auto_90843 ) ) ( not ( = ?auto_90851 ?auto_90848 ) ) ( not ( = ?auto_90851 ?auto_90849 ) ) ( not ( = ?auto_90851 ?auto_90850 ) ) ( not ( = ?auto_90844 ?auto_90847 ) ) ( not ( = ?auto_90845 ?auto_90847 ) ) ( not ( = ?auto_90846 ?auto_90847 ) ) ( not ( = ?auto_90843 ?auto_90847 ) ) ( not ( = ?auto_90852 ?auto_90851 ) ) ( not ( = ?auto_90852 ?auto_90848 ) ) ( not ( = ?auto_90852 ?auto_90849 ) ) ( not ( = ?auto_90852 ?auto_90850 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90844 ?auto_90845 ?auto_90846 ?auto_90847 ?auto_90843 ?auto_90842 )
      ( DELIVER-5PKG-VERIFY ?auto_90843 ?auto_90844 ?auto_90845 ?auto_90846 ?auto_90847 ?auto_90842 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90898 - OBJ
      ?auto_90899 - OBJ
      ?auto_90900 - OBJ
      ?auto_90901 - OBJ
      ?auto_90902 - OBJ
      ?auto_90897 - LOCATION
    )
    :vars
    (
      ?auto_90907 - LOCATION
      ?auto_90909 - CITY
      ?auto_90906 - LOCATION
      ?auto_90903 - LOCATION
      ?auto_90904 - LOCATION
      ?auto_90905 - LOCATION
      ?auto_90908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90907 ?auto_90909 ) ( IN-CITY ?auto_90897 ?auto_90909 ) ( not ( = ?auto_90897 ?auto_90907 ) ) ( OBJ-AT ?auto_90901 ?auto_90907 ) ( IN-CITY ?auto_90906 ?auto_90909 ) ( not ( = ?auto_90897 ?auto_90906 ) ) ( OBJ-AT ?auto_90898 ?auto_90906 ) ( IN-CITY ?auto_90903 ?auto_90909 ) ( not ( = ?auto_90897 ?auto_90903 ) ) ( OBJ-AT ?auto_90902 ?auto_90903 ) ( IN-CITY ?auto_90904 ?auto_90909 ) ( not ( = ?auto_90897 ?auto_90904 ) ) ( OBJ-AT ?auto_90900 ?auto_90904 ) ( IN-CITY ?auto_90905 ?auto_90909 ) ( not ( = ?auto_90897 ?auto_90905 ) ) ( OBJ-AT ?auto_90899 ?auto_90905 ) ( TRUCK-AT ?auto_90908 ?auto_90897 ) ( not ( = ?auto_90899 ?auto_90900 ) ) ( not ( = ?auto_90904 ?auto_90905 ) ) ( not ( = ?auto_90899 ?auto_90902 ) ) ( not ( = ?auto_90900 ?auto_90902 ) ) ( not ( = ?auto_90903 ?auto_90904 ) ) ( not ( = ?auto_90903 ?auto_90905 ) ) ( not ( = ?auto_90899 ?auto_90898 ) ) ( not ( = ?auto_90900 ?auto_90898 ) ) ( not ( = ?auto_90902 ?auto_90898 ) ) ( not ( = ?auto_90906 ?auto_90903 ) ) ( not ( = ?auto_90906 ?auto_90904 ) ) ( not ( = ?auto_90906 ?auto_90905 ) ) ( not ( = ?auto_90899 ?auto_90901 ) ) ( not ( = ?auto_90900 ?auto_90901 ) ) ( not ( = ?auto_90902 ?auto_90901 ) ) ( not ( = ?auto_90898 ?auto_90901 ) ) ( not ( = ?auto_90907 ?auto_90906 ) ) ( not ( = ?auto_90907 ?auto_90903 ) ) ( not ( = ?auto_90907 ?auto_90904 ) ) ( not ( = ?auto_90907 ?auto_90905 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90899 ?auto_90900 ?auto_90902 ?auto_90901 ?auto_90898 ?auto_90897 )
      ( DELIVER-5PKG-VERIFY ?auto_90898 ?auto_90899 ?auto_90900 ?auto_90901 ?auto_90902 ?auto_90897 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90953 - OBJ
      ?auto_90954 - OBJ
      ?auto_90955 - OBJ
      ?auto_90956 - OBJ
      ?auto_90957 - OBJ
      ?auto_90952 - LOCATION
    )
    :vars
    (
      ?auto_90962 - LOCATION
      ?auto_90964 - CITY
      ?auto_90961 - LOCATION
      ?auto_90958 - LOCATION
      ?auto_90959 - LOCATION
      ?auto_90960 - LOCATION
      ?auto_90963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90962 ?auto_90964 ) ( IN-CITY ?auto_90952 ?auto_90964 ) ( not ( = ?auto_90952 ?auto_90962 ) ) ( OBJ-AT ?auto_90957 ?auto_90962 ) ( IN-CITY ?auto_90961 ?auto_90964 ) ( not ( = ?auto_90952 ?auto_90961 ) ) ( OBJ-AT ?auto_90953 ?auto_90961 ) ( IN-CITY ?auto_90958 ?auto_90964 ) ( not ( = ?auto_90952 ?auto_90958 ) ) ( OBJ-AT ?auto_90955 ?auto_90958 ) ( IN-CITY ?auto_90959 ?auto_90964 ) ( not ( = ?auto_90952 ?auto_90959 ) ) ( OBJ-AT ?auto_90956 ?auto_90959 ) ( IN-CITY ?auto_90960 ?auto_90964 ) ( not ( = ?auto_90952 ?auto_90960 ) ) ( OBJ-AT ?auto_90954 ?auto_90960 ) ( TRUCK-AT ?auto_90963 ?auto_90952 ) ( not ( = ?auto_90954 ?auto_90956 ) ) ( not ( = ?auto_90959 ?auto_90960 ) ) ( not ( = ?auto_90954 ?auto_90955 ) ) ( not ( = ?auto_90956 ?auto_90955 ) ) ( not ( = ?auto_90958 ?auto_90959 ) ) ( not ( = ?auto_90958 ?auto_90960 ) ) ( not ( = ?auto_90954 ?auto_90953 ) ) ( not ( = ?auto_90956 ?auto_90953 ) ) ( not ( = ?auto_90955 ?auto_90953 ) ) ( not ( = ?auto_90961 ?auto_90958 ) ) ( not ( = ?auto_90961 ?auto_90959 ) ) ( not ( = ?auto_90961 ?auto_90960 ) ) ( not ( = ?auto_90954 ?auto_90957 ) ) ( not ( = ?auto_90956 ?auto_90957 ) ) ( not ( = ?auto_90955 ?auto_90957 ) ) ( not ( = ?auto_90953 ?auto_90957 ) ) ( not ( = ?auto_90962 ?auto_90961 ) ) ( not ( = ?auto_90962 ?auto_90958 ) ) ( not ( = ?auto_90962 ?auto_90959 ) ) ( not ( = ?auto_90962 ?auto_90960 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90954 ?auto_90956 ?auto_90955 ?auto_90957 ?auto_90953 ?auto_90952 )
      ( DELIVER-5PKG-VERIFY ?auto_90953 ?auto_90954 ?auto_90955 ?auto_90956 ?auto_90957 ?auto_90952 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91008 - OBJ
      ?auto_91009 - OBJ
      ?auto_91010 - OBJ
      ?auto_91011 - OBJ
      ?auto_91012 - OBJ
      ?auto_91007 - LOCATION
    )
    :vars
    (
      ?auto_91017 - LOCATION
      ?auto_91019 - CITY
      ?auto_91016 - LOCATION
      ?auto_91013 - LOCATION
      ?auto_91014 - LOCATION
      ?auto_91015 - LOCATION
      ?auto_91018 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91017 ?auto_91019 ) ( IN-CITY ?auto_91007 ?auto_91019 ) ( not ( = ?auto_91007 ?auto_91017 ) ) ( OBJ-AT ?auto_91011 ?auto_91017 ) ( IN-CITY ?auto_91016 ?auto_91019 ) ( not ( = ?auto_91007 ?auto_91016 ) ) ( OBJ-AT ?auto_91008 ?auto_91016 ) ( IN-CITY ?auto_91013 ?auto_91019 ) ( not ( = ?auto_91007 ?auto_91013 ) ) ( OBJ-AT ?auto_91010 ?auto_91013 ) ( IN-CITY ?auto_91014 ?auto_91019 ) ( not ( = ?auto_91007 ?auto_91014 ) ) ( OBJ-AT ?auto_91012 ?auto_91014 ) ( IN-CITY ?auto_91015 ?auto_91019 ) ( not ( = ?auto_91007 ?auto_91015 ) ) ( OBJ-AT ?auto_91009 ?auto_91015 ) ( TRUCK-AT ?auto_91018 ?auto_91007 ) ( not ( = ?auto_91009 ?auto_91012 ) ) ( not ( = ?auto_91014 ?auto_91015 ) ) ( not ( = ?auto_91009 ?auto_91010 ) ) ( not ( = ?auto_91012 ?auto_91010 ) ) ( not ( = ?auto_91013 ?auto_91014 ) ) ( not ( = ?auto_91013 ?auto_91015 ) ) ( not ( = ?auto_91009 ?auto_91008 ) ) ( not ( = ?auto_91012 ?auto_91008 ) ) ( not ( = ?auto_91010 ?auto_91008 ) ) ( not ( = ?auto_91016 ?auto_91013 ) ) ( not ( = ?auto_91016 ?auto_91014 ) ) ( not ( = ?auto_91016 ?auto_91015 ) ) ( not ( = ?auto_91009 ?auto_91011 ) ) ( not ( = ?auto_91012 ?auto_91011 ) ) ( not ( = ?auto_91010 ?auto_91011 ) ) ( not ( = ?auto_91008 ?auto_91011 ) ) ( not ( = ?auto_91017 ?auto_91016 ) ) ( not ( = ?auto_91017 ?auto_91013 ) ) ( not ( = ?auto_91017 ?auto_91014 ) ) ( not ( = ?auto_91017 ?auto_91015 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91009 ?auto_91012 ?auto_91010 ?auto_91011 ?auto_91008 ?auto_91007 )
      ( DELIVER-5PKG-VERIFY ?auto_91008 ?auto_91009 ?auto_91010 ?auto_91011 ?auto_91012 ?auto_91007 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91295 - OBJ
      ?auto_91296 - OBJ
      ?auto_91297 - OBJ
      ?auto_91298 - OBJ
      ?auto_91299 - OBJ
      ?auto_91294 - LOCATION
    )
    :vars
    (
      ?auto_91304 - LOCATION
      ?auto_91306 - CITY
      ?auto_91303 - LOCATION
      ?auto_91300 - LOCATION
      ?auto_91301 - LOCATION
      ?auto_91302 - LOCATION
      ?auto_91305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91304 ?auto_91306 ) ( IN-CITY ?auto_91294 ?auto_91306 ) ( not ( = ?auto_91294 ?auto_91304 ) ) ( OBJ-AT ?auto_91297 ?auto_91304 ) ( IN-CITY ?auto_91303 ?auto_91306 ) ( not ( = ?auto_91294 ?auto_91303 ) ) ( OBJ-AT ?auto_91295 ?auto_91303 ) ( IN-CITY ?auto_91300 ?auto_91306 ) ( not ( = ?auto_91294 ?auto_91300 ) ) ( OBJ-AT ?auto_91299 ?auto_91300 ) ( IN-CITY ?auto_91301 ?auto_91306 ) ( not ( = ?auto_91294 ?auto_91301 ) ) ( OBJ-AT ?auto_91298 ?auto_91301 ) ( IN-CITY ?auto_91302 ?auto_91306 ) ( not ( = ?auto_91294 ?auto_91302 ) ) ( OBJ-AT ?auto_91296 ?auto_91302 ) ( TRUCK-AT ?auto_91305 ?auto_91294 ) ( not ( = ?auto_91296 ?auto_91298 ) ) ( not ( = ?auto_91301 ?auto_91302 ) ) ( not ( = ?auto_91296 ?auto_91299 ) ) ( not ( = ?auto_91298 ?auto_91299 ) ) ( not ( = ?auto_91300 ?auto_91301 ) ) ( not ( = ?auto_91300 ?auto_91302 ) ) ( not ( = ?auto_91296 ?auto_91295 ) ) ( not ( = ?auto_91298 ?auto_91295 ) ) ( not ( = ?auto_91299 ?auto_91295 ) ) ( not ( = ?auto_91303 ?auto_91300 ) ) ( not ( = ?auto_91303 ?auto_91301 ) ) ( not ( = ?auto_91303 ?auto_91302 ) ) ( not ( = ?auto_91296 ?auto_91297 ) ) ( not ( = ?auto_91298 ?auto_91297 ) ) ( not ( = ?auto_91299 ?auto_91297 ) ) ( not ( = ?auto_91295 ?auto_91297 ) ) ( not ( = ?auto_91304 ?auto_91303 ) ) ( not ( = ?auto_91304 ?auto_91300 ) ) ( not ( = ?auto_91304 ?auto_91301 ) ) ( not ( = ?auto_91304 ?auto_91302 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91296 ?auto_91298 ?auto_91299 ?auto_91297 ?auto_91295 ?auto_91294 )
      ( DELIVER-5PKG-VERIFY ?auto_91295 ?auto_91296 ?auto_91297 ?auto_91298 ?auto_91299 ?auto_91294 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91350 - OBJ
      ?auto_91351 - OBJ
      ?auto_91352 - OBJ
      ?auto_91353 - OBJ
      ?auto_91354 - OBJ
      ?auto_91349 - LOCATION
    )
    :vars
    (
      ?auto_91359 - LOCATION
      ?auto_91361 - CITY
      ?auto_91358 - LOCATION
      ?auto_91355 - LOCATION
      ?auto_91356 - LOCATION
      ?auto_91357 - LOCATION
      ?auto_91360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91359 ?auto_91361 ) ( IN-CITY ?auto_91349 ?auto_91361 ) ( not ( = ?auto_91349 ?auto_91359 ) ) ( OBJ-AT ?auto_91352 ?auto_91359 ) ( IN-CITY ?auto_91358 ?auto_91361 ) ( not ( = ?auto_91349 ?auto_91358 ) ) ( OBJ-AT ?auto_91350 ?auto_91358 ) ( IN-CITY ?auto_91355 ?auto_91361 ) ( not ( = ?auto_91349 ?auto_91355 ) ) ( OBJ-AT ?auto_91353 ?auto_91355 ) ( IN-CITY ?auto_91356 ?auto_91361 ) ( not ( = ?auto_91349 ?auto_91356 ) ) ( OBJ-AT ?auto_91354 ?auto_91356 ) ( IN-CITY ?auto_91357 ?auto_91361 ) ( not ( = ?auto_91349 ?auto_91357 ) ) ( OBJ-AT ?auto_91351 ?auto_91357 ) ( TRUCK-AT ?auto_91360 ?auto_91349 ) ( not ( = ?auto_91351 ?auto_91354 ) ) ( not ( = ?auto_91356 ?auto_91357 ) ) ( not ( = ?auto_91351 ?auto_91353 ) ) ( not ( = ?auto_91354 ?auto_91353 ) ) ( not ( = ?auto_91355 ?auto_91356 ) ) ( not ( = ?auto_91355 ?auto_91357 ) ) ( not ( = ?auto_91351 ?auto_91350 ) ) ( not ( = ?auto_91354 ?auto_91350 ) ) ( not ( = ?auto_91353 ?auto_91350 ) ) ( not ( = ?auto_91358 ?auto_91355 ) ) ( not ( = ?auto_91358 ?auto_91356 ) ) ( not ( = ?auto_91358 ?auto_91357 ) ) ( not ( = ?auto_91351 ?auto_91352 ) ) ( not ( = ?auto_91354 ?auto_91352 ) ) ( not ( = ?auto_91353 ?auto_91352 ) ) ( not ( = ?auto_91350 ?auto_91352 ) ) ( not ( = ?auto_91359 ?auto_91358 ) ) ( not ( = ?auto_91359 ?auto_91355 ) ) ( not ( = ?auto_91359 ?auto_91356 ) ) ( not ( = ?auto_91359 ?auto_91357 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91351 ?auto_91354 ?auto_91353 ?auto_91352 ?auto_91350 ?auto_91349 )
      ( DELIVER-5PKG-VERIFY ?auto_91350 ?auto_91351 ?auto_91352 ?auto_91353 ?auto_91354 ?auto_91349 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91579 - OBJ
      ?auto_91580 - OBJ
      ?auto_91581 - OBJ
      ?auto_91582 - OBJ
      ?auto_91583 - OBJ
      ?auto_91578 - LOCATION
    )
    :vars
    (
      ?auto_91588 - LOCATION
      ?auto_91590 - CITY
      ?auto_91587 - LOCATION
      ?auto_91584 - LOCATION
      ?auto_91585 - LOCATION
      ?auto_91586 - LOCATION
      ?auto_91589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91588 ?auto_91590 ) ( IN-CITY ?auto_91578 ?auto_91590 ) ( not ( = ?auto_91578 ?auto_91588 ) ) ( OBJ-AT ?auto_91583 ?auto_91588 ) ( IN-CITY ?auto_91587 ?auto_91590 ) ( not ( = ?auto_91578 ?auto_91587 ) ) ( OBJ-AT ?auto_91579 ?auto_91587 ) ( IN-CITY ?auto_91584 ?auto_91590 ) ( not ( = ?auto_91578 ?auto_91584 ) ) ( OBJ-AT ?auto_91582 ?auto_91584 ) ( IN-CITY ?auto_91585 ?auto_91590 ) ( not ( = ?auto_91578 ?auto_91585 ) ) ( OBJ-AT ?auto_91580 ?auto_91585 ) ( IN-CITY ?auto_91586 ?auto_91590 ) ( not ( = ?auto_91578 ?auto_91586 ) ) ( OBJ-AT ?auto_91581 ?auto_91586 ) ( TRUCK-AT ?auto_91589 ?auto_91578 ) ( not ( = ?auto_91581 ?auto_91580 ) ) ( not ( = ?auto_91585 ?auto_91586 ) ) ( not ( = ?auto_91581 ?auto_91582 ) ) ( not ( = ?auto_91580 ?auto_91582 ) ) ( not ( = ?auto_91584 ?auto_91585 ) ) ( not ( = ?auto_91584 ?auto_91586 ) ) ( not ( = ?auto_91581 ?auto_91579 ) ) ( not ( = ?auto_91580 ?auto_91579 ) ) ( not ( = ?auto_91582 ?auto_91579 ) ) ( not ( = ?auto_91587 ?auto_91584 ) ) ( not ( = ?auto_91587 ?auto_91585 ) ) ( not ( = ?auto_91587 ?auto_91586 ) ) ( not ( = ?auto_91581 ?auto_91583 ) ) ( not ( = ?auto_91580 ?auto_91583 ) ) ( not ( = ?auto_91582 ?auto_91583 ) ) ( not ( = ?auto_91579 ?auto_91583 ) ) ( not ( = ?auto_91588 ?auto_91587 ) ) ( not ( = ?auto_91588 ?auto_91584 ) ) ( not ( = ?auto_91588 ?auto_91585 ) ) ( not ( = ?auto_91588 ?auto_91586 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91581 ?auto_91580 ?auto_91582 ?auto_91583 ?auto_91579 ?auto_91578 )
      ( DELIVER-5PKG-VERIFY ?auto_91579 ?auto_91580 ?auto_91581 ?auto_91582 ?auto_91583 ?auto_91578 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91634 - OBJ
      ?auto_91635 - OBJ
      ?auto_91636 - OBJ
      ?auto_91637 - OBJ
      ?auto_91638 - OBJ
      ?auto_91633 - LOCATION
    )
    :vars
    (
      ?auto_91643 - LOCATION
      ?auto_91645 - CITY
      ?auto_91642 - LOCATION
      ?auto_91639 - LOCATION
      ?auto_91640 - LOCATION
      ?auto_91641 - LOCATION
      ?auto_91644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91643 ?auto_91645 ) ( IN-CITY ?auto_91633 ?auto_91645 ) ( not ( = ?auto_91633 ?auto_91643 ) ) ( OBJ-AT ?auto_91637 ?auto_91643 ) ( IN-CITY ?auto_91642 ?auto_91645 ) ( not ( = ?auto_91633 ?auto_91642 ) ) ( OBJ-AT ?auto_91634 ?auto_91642 ) ( IN-CITY ?auto_91639 ?auto_91645 ) ( not ( = ?auto_91633 ?auto_91639 ) ) ( OBJ-AT ?auto_91638 ?auto_91639 ) ( IN-CITY ?auto_91640 ?auto_91645 ) ( not ( = ?auto_91633 ?auto_91640 ) ) ( OBJ-AT ?auto_91635 ?auto_91640 ) ( IN-CITY ?auto_91641 ?auto_91645 ) ( not ( = ?auto_91633 ?auto_91641 ) ) ( OBJ-AT ?auto_91636 ?auto_91641 ) ( TRUCK-AT ?auto_91644 ?auto_91633 ) ( not ( = ?auto_91636 ?auto_91635 ) ) ( not ( = ?auto_91640 ?auto_91641 ) ) ( not ( = ?auto_91636 ?auto_91638 ) ) ( not ( = ?auto_91635 ?auto_91638 ) ) ( not ( = ?auto_91639 ?auto_91640 ) ) ( not ( = ?auto_91639 ?auto_91641 ) ) ( not ( = ?auto_91636 ?auto_91634 ) ) ( not ( = ?auto_91635 ?auto_91634 ) ) ( not ( = ?auto_91638 ?auto_91634 ) ) ( not ( = ?auto_91642 ?auto_91639 ) ) ( not ( = ?auto_91642 ?auto_91640 ) ) ( not ( = ?auto_91642 ?auto_91641 ) ) ( not ( = ?auto_91636 ?auto_91637 ) ) ( not ( = ?auto_91635 ?auto_91637 ) ) ( not ( = ?auto_91638 ?auto_91637 ) ) ( not ( = ?auto_91634 ?auto_91637 ) ) ( not ( = ?auto_91643 ?auto_91642 ) ) ( not ( = ?auto_91643 ?auto_91639 ) ) ( not ( = ?auto_91643 ?auto_91640 ) ) ( not ( = ?auto_91643 ?auto_91641 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91636 ?auto_91635 ?auto_91638 ?auto_91637 ?auto_91634 ?auto_91633 )
      ( DELIVER-5PKG-VERIFY ?auto_91634 ?auto_91635 ?auto_91636 ?auto_91637 ?auto_91638 ?auto_91633 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91806 - OBJ
      ?auto_91807 - OBJ
      ?auto_91808 - OBJ
      ?auto_91809 - OBJ
      ?auto_91810 - OBJ
      ?auto_91805 - LOCATION
    )
    :vars
    (
      ?auto_91815 - LOCATION
      ?auto_91817 - CITY
      ?auto_91814 - LOCATION
      ?auto_91811 - LOCATION
      ?auto_91812 - LOCATION
      ?auto_91813 - LOCATION
      ?auto_91816 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91815 ?auto_91817 ) ( IN-CITY ?auto_91805 ?auto_91817 ) ( not ( = ?auto_91805 ?auto_91815 ) ) ( OBJ-AT ?auto_91810 ?auto_91815 ) ( IN-CITY ?auto_91814 ?auto_91817 ) ( not ( = ?auto_91805 ?auto_91814 ) ) ( OBJ-AT ?auto_91806 ?auto_91814 ) ( IN-CITY ?auto_91811 ?auto_91817 ) ( not ( = ?auto_91805 ?auto_91811 ) ) ( OBJ-AT ?auto_91808 ?auto_91811 ) ( IN-CITY ?auto_91812 ?auto_91817 ) ( not ( = ?auto_91805 ?auto_91812 ) ) ( OBJ-AT ?auto_91807 ?auto_91812 ) ( IN-CITY ?auto_91813 ?auto_91817 ) ( not ( = ?auto_91805 ?auto_91813 ) ) ( OBJ-AT ?auto_91809 ?auto_91813 ) ( TRUCK-AT ?auto_91816 ?auto_91805 ) ( not ( = ?auto_91809 ?auto_91807 ) ) ( not ( = ?auto_91812 ?auto_91813 ) ) ( not ( = ?auto_91809 ?auto_91808 ) ) ( not ( = ?auto_91807 ?auto_91808 ) ) ( not ( = ?auto_91811 ?auto_91812 ) ) ( not ( = ?auto_91811 ?auto_91813 ) ) ( not ( = ?auto_91809 ?auto_91806 ) ) ( not ( = ?auto_91807 ?auto_91806 ) ) ( not ( = ?auto_91808 ?auto_91806 ) ) ( not ( = ?auto_91814 ?auto_91811 ) ) ( not ( = ?auto_91814 ?auto_91812 ) ) ( not ( = ?auto_91814 ?auto_91813 ) ) ( not ( = ?auto_91809 ?auto_91810 ) ) ( not ( = ?auto_91807 ?auto_91810 ) ) ( not ( = ?auto_91808 ?auto_91810 ) ) ( not ( = ?auto_91806 ?auto_91810 ) ) ( not ( = ?auto_91815 ?auto_91814 ) ) ( not ( = ?auto_91815 ?auto_91811 ) ) ( not ( = ?auto_91815 ?auto_91812 ) ) ( not ( = ?auto_91815 ?auto_91813 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91809 ?auto_91807 ?auto_91808 ?auto_91810 ?auto_91806 ?auto_91805 )
      ( DELIVER-5PKG-VERIFY ?auto_91806 ?auto_91807 ?auto_91808 ?auto_91809 ?auto_91810 ?auto_91805 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91861 - OBJ
      ?auto_91862 - OBJ
      ?auto_91863 - OBJ
      ?auto_91864 - OBJ
      ?auto_91865 - OBJ
      ?auto_91860 - LOCATION
    )
    :vars
    (
      ?auto_91870 - LOCATION
      ?auto_91872 - CITY
      ?auto_91869 - LOCATION
      ?auto_91866 - LOCATION
      ?auto_91867 - LOCATION
      ?auto_91868 - LOCATION
      ?auto_91871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91870 ?auto_91872 ) ( IN-CITY ?auto_91860 ?auto_91872 ) ( not ( = ?auto_91860 ?auto_91870 ) ) ( OBJ-AT ?auto_91864 ?auto_91870 ) ( IN-CITY ?auto_91869 ?auto_91872 ) ( not ( = ?auto_91860 ?auto_91869 ) ) ( OBJ-AT ?auto_91861 ?auto_91869 ) ( IN-CITY ?auto_91866 ?auto_91872 ) ( not ( = ?auto_91860 ?auto_91866 ) ) ( OBJ-AT ?auto_91863 ?auto_91866 ) ( IN-CITY ?auto_91867 ?auto_91872 ) ( not ( = ?auto_91860 ?auto_91867 ) ) ( OBJ-AT ?auto_91862 ?auto_91867 ) ( IN-CITY ?auto_91868 ?auto_91872 ) ( not ( = ?auto_91860 ?auto_91868 ) ) ( OBJ-AT ?auto_91865 ?auto_91868 ) ( TRUCK-AT ?auto_91871 ?auto_91860 ) ( not ( = ?auto_91865 ?auto_91862 ) ) ( not ( = ?auto_91867 ?auto_91868 ) ) ( not ( = ?auto_91865 ?auto_91863 ) ) ( not ( = ?auto_91862 ?auto_91863 ) ) ( not ( = ?auto_91866 ?auto_91867 ) ) ( not ( = ?auto_91866 ?auto_91868 ) ) ( not ( = ?auto_91865 ?auto_91861 ) ) ( not ( = ?auto_91862 ?auto_91861 ) ) ( not ( = ?auto_91863 ?auto_91861 ) ) ( not ( = ?auto_91869 ?auto_91866 ) ) ( not ( = ?auto_91869 ?auto_91867 ) ) ( not ( = ?auto_91869 ?auto_91868 ) ) ( not ( = ?auto_91865 ?auto_91864 ) ) ( not ( = ?auto_91862 ?auto_91864 ) ) ( not ( = ?auto_91863 ?auto_91864 ) ) ( not ( = ?auto_91861 ?auto_91864 ) ) ( not ( = ?auto_91870 ?auto_91869 ) ) ( not ( = ?auto_91870 ?auto_91866 ) ) ( not ( = ?auto_91870 ?auto_91867 ) ) ( not ( = ?auto_91870 ?auto_91868 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91865 ?auto_91862 ?auto_91863 ?auto_91864 ?auto_91861 ?auto_91860 )
      ( DELIVER-5PKG-VERIFY ?auto_91861 ?auto_91862 ?auto_91863 ?auto_91864 ?auto_91865 ?auto_91860 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92089 - OBJ
      ?auto_92090 - OBJ
      ?auto_92091 - OBJ
      ?auto_92092 - OBJ
      ?auto_92093 - OBJ
      ?auto_92088 - LOCATION
    )
    :vars
    (
      ?auto_92098 - LOCATION
      ?auto_92100 - CITY
      ?auto_92097 - LOCATION
      ?auto_92094 - LOCATION
      ?auto_92095 - LOCATION
      ?auto_92096 - LOCATION
      ?auto_92099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92098 ?auto_92100 ) ( IN-CITY ?auto_92088 ?auto_92100 ) ( not ( = ?auto_92088 ?auto_92098 ) ) ( OBJ-AT ?auto_92091 ?auto_92098 ) ( IN-CITY ?auto_92097 ?auto_92100 ) ( not ( = ?auto_92088 ?auto_92097 ) ) ( OBJ-AT ?auto_92089 ?auto_92097 ) ( IN-CITY ?auto_92094 ?auto_92100 ) ( not ( = ?auto_92088 ?auto_92094 ) ) ( OBJ-AT ?auto_92093 ?auto_92094 ) ( IN-CITY ?auto_92095 ?auto_92100 ) ( not ( = ?auto_92088 ?auto_92095 ) ) ( OBJ-AT ?auto_92090 ?auto_92095 ) ( IN-CITY ?auto_92096 ?auto_92100 ) ( not ( = ?auto_92088 ?auto_92096 ) ) ( OBJ-AT ?auto_92092 ?auto_92096 ) ( TRUCK-AT ?auto_92099 ?auto_92088 ) ( not ( = ?auto_92092 ?auto_92090 ) ) ( not ( = ?auto_92095 ?auto_92096 ) ) ( not ( = ?auto_92092 ?auto_92093 ) ) ( not ( = ?auto_92090 ?auto_92093 ) ) ( not ( = ?auto_92094 ?auto_92095 ) ) ( not ( = ?auto_92094 ?auto_92096 ) ) ( not ( = ?auto_92092 ?auto_92089 ) ) ( not ( = ?auto_92090 ?auto_92089 ) ) ( not ( = ?auto_92093 ?auto_92089 ) ) ( not ( = ?auto_92097 ?auto_92094 ) ) ( not ( = ?auto_92097 ?auto_92095 ) ) ( not ( = ?auto_92097 ?auto_92096 ) ) ( not ( = ?auto_92092 ?auto_92091 ) ) ( not ( = ?auto_92090 ?auto_92091 ) ) ( not ( = ?auto_92093 ?auto_92091 ) ) ( not ( = ?auto_92089 ?auto_92091 ) ) ( not ( = ?auto_92098 ?auto_92097 ) ) ( not ( = ?auto_92098 ?auto_92094 ) ) ( not ( = ?auto_92098 ?auto_92095 ) ) ( not ( = ?auto_92098 ?auto_92096 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92092 ?auto_92090 ?auto_92093 ?auto_92091 ?auto_92089 ?auto_92088 )
      ( DELIVER-5PKG-VERIFY ?auto_92089 ?auto_92090 ?auto_92091 ?auto_92092 ?auto_92093 ?auto_92088 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92203 - OBJ
      ?auto_92204 - OBJ
      ?auto_92205 - OBJ
      ?auto_92206 - OBJ
      ?auto_92207 - OBJ
      ?auto_92202 - LOCATION
    )
    :vars
    (
      ?auto_92212 - LOCATION
      ?auto_92214 - CITY
      ?auto_92211 - LOCATION
      ?auto_92208 - LOCATION
      ?auto_92209 - LOCATION
      ?auto_92210 - LOCATION
      ?auto_92213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92212 ?auto_92214 ) ( IN-CITY ?auto_92202 ?auto_92214 ) ( not ( = ?auto_92202 ?auto_92212 ) ) ( OBJ-AT ?auto_92205 ?auto_92212 ) ( IN-CITY ?auto_92211 ?auto_92214 ) ( not ( = ?auto_92202 ?auto_92211 ) ) ( OBJ-AT ?auto_92203 ?auto_92211 ) ( IN-CITY ?auto_92208 ?auto_92214 ) ( not ( = ?auto_92202 ?auto_92208 ) ) ( OBJ-AT ?auto_92206 ?auto_92208 ) ( IN-CITY ?auto_92209 ?auto_92214 ) ( not ( = ?auto_92202 ?auto_92209 ) ) ( OBJ-AT ?auto_92204 ?auto_92209 ) ( IN-CITY ?auto_92210 ?auto_92214 ) ( not ( = ?auto_92202 ?auto_92210 ) ) ( OBJ-AT ?auto_92207 ?auto_92210 ) ( TRUCK-AT ?auto_92213 ?auto_92202 ) ( not ( = ?auto_92207 ?auto_92204 ) ) ( not ( = ?auto_92209 ?auto_92210 ) ) ( not ( = ?auto_92207 ?auto_92206 ) ) ( not ( = ?auto_92204 ?auto_92206 ) ) ( not ( = ?auto_92208 ?auto_92209 ) ) ( not ( = ?auto_92208 ?auto_92210 ) ) ( not ( = ?auto_92207 ?auto_92203 ) ) ( not ( = ?auto_92204 ?auto_92203 ) ) ( not ( = ?auto_92206 ?auto_92203 ) ) ( not ( = ?auto_92211 ?auto_92208 ) ) ( not ( = ?auto_92211 ?auto_92209 ) ) ( not ( = ?auto_92211 ?auto_92210 ) ) ( not ( = ?auto_92207 ?auto_92205 ) ) ( not ( = ?auto_92204 ?auto_92205 ) ) ( not ( = ?auto_92206 ?auto_92205 ) ) ( not ( = ?auto_92203 ?auto_92205 ) ) ( not ( = ?auto_92212 ?auto_92211 ) ) ( not ( = ?auto_92212 ?auto_92208 ) ) ( not ( = ?auto_92212 ?auto_92209 ) ) ( not ( = ?auto_92212 ?auto_92210 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92207 ?auto_92204 ?auto_92206 ?auto_92205 ?auto_92203 ?auto_92202 )
      ( DELIVER-5PKG-VERIFY ?auto_92203 ?auto_92204 ?auto_92205 ?auto_92206 ?auto_92207 ?auto_92202 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92432 - OBJ
      ?auto_92433 - OBJ
      ?auto_92434 - OBJ
      ?auto_92435 - OBJ
      ?auto_92436 - OBJ
      ?auto_92431 - LOCATION
    )
    :vars
    (
      ?auto_92441 - LOCATION
      ?auto_92443 - CITY
      ?auto_92440 - LOCATION
      ?auto_92437 - LOCATION
      ?auto_92438 - LOCATION
      ?auto_92439 - LOCATION
      ?auto_92442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92441 ?auto_92443 ) ( IN-CITY ?auto_92431 ?auto_92443 ) ( not ( = ?auto_92431 ?auto_92441 ) ) ( OBJ-AT ?auto_92436 ?auto_92441 ) ( IN-CITY ?auto_92440 ?auto_92443 ) ( not ( = ?auto_92431 ?auto_92440 ) ) ( OBJ-AT ?auto_92432 ?auto_92440 ) ( IN-CITY ?auto_92437 ?auto_92443 ) ( not ( = ?auto_92431 ?auto_92437 ) ) ( OBJ-AT ?auto_92433 ?auto_92437 ) ( IN-CITY ?auto_92438 ?auto_92443 ) ( not ( = ?auto_92431 ?auto_92438 ) ) ( OBJ-AT ?auto_92435 ?auto_92438 ) ( IN-CITY ?auto_92439 ?auto_92443 ) ( not ( = ?auto_92431 ?auto_92439 ) ) ( OBJ-AT ?auto_92434 ?auto_92439 ) ( TRUCK-AT ?auto_92442 ?auto_92431 ) ( not ( = ?auto_92434 ?auto_92435 ) ) ( not ( = ?auto_92438 ?auto_92439 ) ) ( not ( = ?auto_92434 ?auto_92433 ) ) ( not ( = ?auto_92435 ?auto_92433 ) ) ( not ( = ?auto_92437 ?auto_92438 ) ) ( not ( = ?auto_92437 ?auto_92439 ) ) ( not ( = ?auto_92434 ?auto_92432 ) ) ( not ( = ?auto_92435 ?auto_92432 ) ) ( not ( = ?auto_92433 ?auto_92432 ) ) ( not ( = ?auto_92440 ?auto_92437 ) ) ( not ( = ?auto_92440 ?auto_92438 ) ) ( not ( = ?auto_92440 ?auto_92439 ) ) ( not ( = ?auto_92434 ?auto_92436 ) ) ( not ( = ?auto_92435 ?auto_92436 ) ) ( not ( = ?auto_92433 ?auto_92436 ) ) ( not ( = ?auto_92432 ?auto_92436 ) ) ( not ( = ?auto_92441 ?auto_92440 ) ) ( not ( = ?auto_92441 ?auto_92437 ) ) ( not ( = ?auto_92441 ?auto_92438 ) ) ( not ( = ?auto_92441 ?auto_92439 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92434 ?auto_92435 ?auto_92433 ?auto_92436 ?auto_92432 ?auto_92431 )
      ( DELIVER-5PKG-VERIFY ?auto_92432 ?auto_92433 ?auto_92434 ?auto_92435 ?auto_92436 ?auto_92431 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92487 - OBJ
      ?auto_92488 - OBJ
      ?auto_92489 - OBJ
      ?auto_92490 - OBJ
      ?auto_92491 - OBJ
      ?auto_92486 - LOCATION
    )
    :vars
    (
      ?auto_92496 - LOCATION
      ?auto_92498 - CITY
      ?auto_92495 - LOCATION
      ?auto_92492 - LOCATION
      ?auto_92493 - LOCATION
      ?auto_92494 - LOCATION
      ?auto_92497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92496 ?auto_92498 ) ( IN-CITY ?auto_92486 ?auto_92498 ) ( not ( = ?auto_92486 ?auto_92496 ) ) ( OBJ-AT ?auto_92490 ?auto_92496 ) ( IN-CITY ?auto_92495 ?auto_92498 ) ( not ( = ?auto_92486 ?auto_92495 ) ) ( OBJ-AT ?auto_92487 ?auto_92495 ) ( IN-CITY ?auto_92492 ?auto_92498 ) ( not ( = ?auto_92486 ?auto_92492 ) ) ( OBJ-AT ?auto_92488 ?auto_92492 ) ( IN-CITY ?auto_92493 ?auto_92498 ) ( not ( = ?auto_92486 ?auto_92493 ) ) ( OBJ-AT ?auto_92491 ?auto_92493 ) ( IN-CITY ?auto_92494 ?auto_92498 ) ( not ( = ?auto_92486 ?auto_92494 ) ) ( OBJ-AT ?auto_92489 ?auto_92494 ) ( TRUCK-AT ?auto_92497 ?auto_92486 ) ( not ( = ?auto_92489 ?auto_92491 ) ) ( not ( = ?auto_92493 ?auto_92494 ) ) ( not ( = ?auto_92489 ?auto_92488 ) ) ( not ( = ?auto_92491 ?auto_92488 ) ) ( not ( = ?auto_92492 ?auto_92493 ) ) ( not ( = ?auto_92492 ?auto_92494 ) ) ( not ( = ?auto_92489 ?auto_92487 ) ) ( not ( = ?auto_92491 ?auto_92487 ) ) ( not ( = ?auto_92488 ?auto_92487 ) ) ( not ( = ?auto_92495 ?auto_92492 ) ) ( not ( = ?auto_92495 ?auto_92493 ) ) ( not ( = ?auto_92495 ?auto_92494 ) ) ( not ( = ?auto_92489 ?auto_92490 ) ) ( not ( = ?auto_92491 ?auto_92490 ) ) ( not ( = ?auto_92488 ?auto_92490 ) ) ( not ( = ?auto_92487 ?auto_92490 ) ) ( not ( = ?auto_92496 ?auto_92495 ) ) ( not ( = ?auto_92496 ?auto_92492 ) ) ( not ( = ?auto_92496 ?auto_92493 ) ) ( not ( = ?auto_92496 ?auto_92494 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92489 ?auto_92491 ?auto_92488 ?auto_92490 ?auto_92487 ?auto_92486 )
      ( DELIVER-5PKG-VERIFY ?auto_92487 ?auto_92488 ?auto_92489 ?auto_92490 ?auto_92491 ?auto_92486 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92542 - OBJ
      ?auto_92543 - OBJ
      ?auto_92544 - OBJ
      ?auto_92545 - OBJ
      ?auto_92546 - OBJ
      ?auto_92541 - LOCATION
    )
    :vars
    (
      ?auto_92551 - LOCATION
      ?auto_92553 - CITY
      ?auto_92550 - LOCATION
      ?auto_92547 - LOCATION
      ?auto_92548 - LOCATION
      ?auto_92549 - LOCATION
      ?auto_92552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92551 ?auto_92553 ) ( IN-CITY ?auto_92541 ?auto_92553 ) ( not ( = ?auto_92541 ?auto_92551 ) ) ( OBJ-AT ?auto_92546 ?auto_92551 ) ( IN-CITY ?auto_92550 ?auto_92553 ) ( not ( = ?auto_92541 ?auto_92550 ) ) ( OBJ-AT ?auto_92542 ?auto_92550 ) ( IN-CITY ?auto_92547 ?auto_92553 ) ( not ( = ?auto_92541 ?auto_92547 ) ) ( OBJ-AT ?auto_92543 ?auto_92547 ) ( IN-CITY ?auto_92548 ?auto_92553 ) ( not ( = ?auto_92541 ?auto_92548 ) ) ( OBJ-AT ?auto_92544 ?auto_92548 ) ( IN-CITY ?auto_92549 ?auto_92553 ) ( not ( = ?auto_92541 ?auto_92549 ) ) ( OBJ-AT ?auto_92545 ?auto_92549 ) ( TRUCK-AT ?auto_92552 ?auto_92541 ) ( not ( = ?auto_92545 ?auto_92544 ) ) ( not ( = ?auto_92548 ?auto_92549 ) ) ( not ( = ?auto_92545 ?auto_92543 ) ) ( not ( = ?auto_92544 ?auto_92543 ) ) ( not ( = ?auto_92547 ?auto_92548 ) ) ( not ( = ?auto_92547 ?auto_92549 ) ) ( not ( = ?auto_92545 ?auto_92542 ) ) ( not ( = ?auto_92544 ?auto_92542 ) ) ( not ( = ?auto_92543 ?auto_92542 ) ) ( not ( = ?auto_92550 ?auto_92547 ) ) ( not ( = ?auto_92550 ?auto_92548 ) ) ( not ( = ?auto_92550 ?auto_92549 ) ) ( not ( = ?auto_92545 ?auto_92546 ) ) ( not ( = ?auto_92544 ?auto_92546 ) ) ( not ( = ?auto_92543 ?auto_92546 ) ) ( not ( = ?auto_92542 ?auto_92546 ) ) ( not ( = ?auto_92551 ?auto_92550 ) ) ( not ( = ?auto_92551 ?auto_92547 ) ) ( not ( = ?auto_92551 ?auto_92548 ) ) ( not ( = ?auto_92551 ?auto_92549 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92545 ?auto_92544 ?auto_92543 ?auto_92546 ?auto_92542 ?auto_92541 )
      ( DELIVER-5PKG-VERIFY ?auto_92542 ?auto_92543 ?auto_92544 ?auto_92545 ?auto_92546 ?auto_92541 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92597 - OBJ
      ?auto_92598 - OBJ
      ?auto_92599 - OBJ
      ?auto_92600 - OBJ
      ?auto_92601 - OBJ
      ?auto_92596 - LOCATION
    )
    :vars
    (
      ?auto_92606 - LOCATION
      ?auto_92608 - CITY
      ?auto_92605 - LOCATION
      ?auto_92602 - LOCATION
      ?auto_92603 - LOCATION
      ?auto_92604 - LOCATION
      ?auto_92607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92606 ?auto_92608 ) ( IN-CITY ?auto_92596 ?auto_92608 ) ( not ( = ?auto_92596 ?auto_92606 ) ) ( OBJ-AT ?auto_92600 ?auto_92606 ) ( IN-CITY ?auto_92605 ?auto_92608 ) ( not ( = ?auto_92596 ?auto_92605 ) ) ( OBJ-AT ?auto_92597 ?auto_92605 ) ( IN-CITY ?auto_92602 ?auto_92608 ) ( not ( = ?auto_92596 ?auto_92602 ) ) ( OBJ-AT ?auto_92598 ?auto_92602 ) ( IN-CITY ?auto_92603 ?auto_92608 ) ( not ( = ?auto_92596 ?auto_92603 ) ) ( OBJ-AT ?auto_92599 ?auto_92603 ) ( IN-CITY ?auto_92604 ?auto_92608 ) ( not ( = ?auto_92596 ?auto_92604 ) ) ( OBJ-AT ?auto_92601 ?auto_92604 ) ( TRUCK-AT ?auto_92607 ?auto_92596 ) ( not ( = ?auto_92601 ?auto_92599 ) ) ( not ( = ?auto_92603 ?auto_92604 ) ) ( not ( = ?auto_92601 ?auto_92598 ) ) ( not ( = ?auto_92599 ?auto_92598 ) ) ( not ( = ?auto_92602 ?auto_92603 ) ) ( not ( = ?auto_92602 ?auto_92604 ) ) ( not ( = ?auto_92601 ?auto_92597 ) ) ( not ( = ?auto_92599 ?auto_92597 ) ) ( not ( = ?auto_92598 ?auto_92597 ) ) ( not ( = ?auto_92605 ?auto_92602 ) ) ( not ( = ?auto_92605 ?auto_92603 ) ) ( not ( = ?auto_92605 ?auto_92604 ) ) ( not ( = ?auto_92601 ?auto_92600 ) ) ( not ( = ?auto_92599 ?auto_92600 ) ) ( not ( = ?auto_92598 ?auto_92600 ) ) ( not ( = ?auto_92597 ?auto_92600 ) ) ( not ( = ?auto_92606 ?auto_92605 ) ) ( not ( = ?auto_92606 ?auto_92602 ) ) ( not ( = ?auto_92606 ?auto_92603 ) ) ( not ( = ?auto_92606 ?auto_92604 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92601 ?auto_92599 ?auto_92598 ?auto_92600 ?auto_92597 ?auto_92596 )
      ( DELIVER-5PKG-VERIFY ?auto_92597 ?auto_92598 ?auto_92599 ?auto_92600 ?auto_92601 ?auto_92596 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92942 - OBJ
      ?auto_92943 - OBJ
      ?auto_92944 - OBJ
      ?auto_92945 - OBJ
      ?auto_92946 - OBJ
      ?auto_92941 - LOCATION
    )
    :vars
    (
      ?auto_92951 - LOCATION
      ?auto_92953 - CITY
      ?auto_92950 - LOCATION
      ?auto_92947 - LOCATION
      ?auto_92948 - LOCATION
      ?auto_92949 - LOCATION
      ?auto_92952 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92951 ?auto_92953 ) ( IN-CITY ?auto_92941 ?auto_92953 ) ( not ( = ?auto_92941 ?auto_92951 ) ) ( OBJ-AT ?auto_92944 ?auto_92951 ) ( IN-CITY ?auto_92950 ?auto_92953 ) ( not ( = ?auto_92941 ?auto_92950 ) ) ( OBJ-AT ?auto_92942 ?auto_92950 ) ( IN-CITY ?auto_92947 ?auto_92953 ) ( not ( = ?auto_92941 ?auto_92947 ) ) ( OBJ-AT ?auto_92943 ?auto_92947 ) ( IN-CITY ?auto_92948 ?auto_92953 ) ( not ( = ?auto_92941 ?auto_92948 ) ) ( OBJ-AT ?auto_92946 ?auto_92948 ) ( IN-CITY ?auto_92949 ?auto_92953 ) ( not ( = ?auto_92941 ?auto_92949 ) ) ( OBJ-AT ?auto_92945 ?auto_92949 ) ( TRUCK-AT ?auto_92952 ?auto_92941 ) ( not ( = ?auto_92945 ?auto_92946 ) ) ( not ( = ?auto_92948 ?auto_92949 ) ) ( not ( = ?auto_92945 ?auto_92943 ) ) ( not ( = ?auto_92946 ?auto_92943 ) ) ( not ( = ?auto_92947 ?auto_92948 ) ) ( not ( = ?auto_92947 ?auto_92949 ) ) ( not ( = ?auto_92945 ?auto_92942 ) ) ( not ( = ?auto_92946 ?auto_92942 ) ) ( not ( = ?auto_92943 ?auto_92942 ) ) ( not ( = ?auto_92950 ?auto_92947 ) ) ( not ( = ?auto_92950 ?auto_92948 ) ) ( not ( = ?auto_92950 ?auto_92949 ) ) ( not ( = ?auto_92945 ?auto_92944 ) ) ( not ( = ?auto_92946 ?auto_92944 ) ) ( not ( = ?auto_92943 ?auto_92944 ) ) ( not ( = ?auto_92942 ?auto_92944 ) ) ( not ( = ?auto_92951 ?auto_92950 ) ) ( not ( = ?auto_92951 ?auto_92947 ) ) ( not ( = ?auto_92951 ?auto_92948 ) ) ( not ( = ?auto_92951 ?auto_92949 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92945 ?auto_92946 ?auto_92943 ?auto_92944 ?auto_92942 ?auto_92941 )
      ( DELIVER-5PKG-VERIFY ?auto_92942 ?auto_92943 ?auto_92944 ?auto_92945 ?auto_92946 ?auto_92941 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92997 - OBJ
      ?auto_92998 - OBJ
      ?auto_92999 - OBJ
      ?auto_93000 - OBJ
      ?auto_93001 - OBJ
      ?auto_92996 - LOCATION
    )
    :vars
    (
      ?auto_93006 - LOCATION
      ?auto_93008 - CITY
      ?auto_93005 - LOCATION
      ?auto_93002 - LOCATION
      ?auto_93003 - LOCATION
      ?auto_93004 - LOCATION
      ?auto_93007 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_93006 ?auto_93008 ) ( IN-CITY ?auto_92996 ?auto_93008 ) ( not ( = ?auto_92996 ?auto_93006 ) ) ( OBJ-AT ?auto_92999 ?auto_93006 ) ( IN-CITY ?auto_93005 ?auto_93008 ) ( not ( = ?auto_92996 ?auto_93005 ) ) ( OBJ-AT ?auto_92997 ?auto_93005 ) ( IN-CITY ?auto_93002 ?auto_93008 ) ( not ( = ?auto_92996 ?auto_93002 ) ) ( OBJ-AT ?auto_92998 ?auto_93002 ) ( IN-CITY ?auto_93003 ?auto_93008 ) ( not ( = ?auto_92996 ?auto_93003 ) ) ( OBJ-AT ?auto_93000 ?auto_93003 ) ( IN-CITY ?auto_93004 ?auto_93008 ) ( not ( = ?auto_92996 ?auto_93004 ) ) ( OBJ-AT ?auto_93001 ?auto_93004 ) ( TRUCK-AT ?auto_93007 ?auto_92996 ) ( not ( = ?auto_93001 ?auto_93000 ) ) ( not ( = ?auto_93003 ?auto_93004 ) ) ( not ( = ?auto_93001 ?auto_92998 ) ) ( not ( = ?auto_93000 ?auto_92998 ) ) ( not ( = ?auto_93002 ?auto_93003 ) ) ( not ( = ?auto_93002 ?auto_93004 ) ) ( not ( = ?auto_93001 ?auto_92997 ) ) ( not ( = ?auto_93000 ?auto_92997 ) ) ( not ( = ?auto_92998 ?auto_92997 ) ) ( not ( = ?auto_93005 ?auto_93002 ) ) ( not ( = ?auto_93005 ?auto_93003 ) ) ( not ( = ?auto_93005 ?auto_93004 ) ) ( not ( = ?auto_93001 ?auto_92999 ) ) ( not ( = ?auto_93000 ?auto_92999 ) ) ( not ( = ?auto_92998 ?auto_92999 ) ) ( not ( = ?auto_92997 ?auto_92999 ) ) ( not ( = ?auto_93006 ?auto_93005 ) ) ( not ( = ?auto_93006 ?auto_93002 ) ) ( not ( = ?auto_93006 ?auto_93003 ) ) ( not ( = ?auto_93006 ?auto_93004 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_93001 ?auto_93000 ?auto_92998 ?auto_92999 ?auto_92997 ?auto_92996 )
      ( DELIVER-5PKG-VERIFY ?auto_92997 ?auto_92998 ?auto_92999 ?auto_93000 ?auto_93001 ?auto_92996 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94290 - OBJ
      ?auto_94291 - OBJ
      ?auto_94292 - OBJ
      ?auto_94293 - OBJ
      ?auto_94294 - OBJ
      ?auto_94289 - LOCATION
    )
    :vars
    (
      ?auto_94299 - LOCATION
      ?auto_94301 - CITY
      ?auto_94298 - LOCATION
      ?auto_94295 - LOCATION
      ?auto_94296 - LOCATION
      ?auto_94297 - LOCATION
      ?auto_94300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94299 ?auto_94301 ) ( IN-CITY ?auto_94289 ?auto_94301 ) ( not ( = ?auto_94289 ?auto_94299 ) ) ( OBJ-AT ?auto_94291 ?auto_94299 ) ( IN-CITY ?auto_94298 ?auto_94301 ) ( not ( = ?auto_94289 ?auto_94298 ) ) ( OBJ-AT ?auto_94290 ?auto_94298 ) ( IN-CITY ?auto_94295 ?auto_94301 ) ( not ( = ?auto_94289 ?auto_94295 ) ) ( OBJ-AT ?auto_94294 ?auto_94295 ) ( IN-CITY ?auto_94296 ?auto_94301 ) ( not ( = ?auto_94289 ?auto_94296 ) ) ( OBJ-AT ?auto_94293 ?auto_94296 ) ( IN-CITY ?auto_94297 ?auto_94301 ) ( not ( = ?auto_94289 ?auto_94297 ) ) ( OBJ-AT ?auto_94292 ?auto_94297 ) ( TRUCK-AT ?auto_94300 ?auto_94289 ) ( not ( = ?auto_94292 ?auto_94293 ) ) ( not ( = ?auto_94296 ?auto_94297 ) ) ( not ( = ?auto_94292 ?auto_94294 ) ) ( not ( = ?auto_94293 ?auto_94294 ) ) ( not ( = ?auto_94295 ?auto_94296 ) ) ( not ( = ?auto_94295 ?auto_94297 ) ) ( not ( = ?auto_94292 ?auto_94290 ) ) ( not ( = ?auto_94293 ?auto_94290 ) ) ( not ( = ?auto_94294 ?auto_94290 ) ) ( not ( = ?auto_94298 ?auto_94295 ) ) ( not ( = ?auto_94298 ?auto_94296 ) ) ( not ( = ?auto_94298 ?auto_94297 ) ) ( not ( = ?auto_94292 ?auto_94291 ) ) ( not ( = ?auto_94293 ?auto_94291 ) ) ( not ( = ?auto_94294 ?auto_94291 ) ) ( not ( = ?auto_94290 ?auto_94291 ) ) ( not ( = ?auto_94299 ?auto_94298 ) ) ( not ( = ?auto_94299 ?auto_94295 ) ) ( not ( = ?auto_94299 ?auto_94296 ) ) ( not ( = ?auto_94299 ?auto_94297 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94292 ?auto_94293 ?auto_94294 ?auto_94291 ?auto_94290 ?auto_94289 )
      ( DELIVER-5PKG-VERIFY ?auto_94290 ?auto_94291 ?auto_94292 ?auto_94293 ?auto_94294 ?auto_94289 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94345 - OBJ
      ?auto_94346 - OBJ
      ?auto_94347 - OBJ
      ?auto_94348 - OBJ
      ?auto_94349 - OBJ
      ?auto_94344 - LOCATION
    )
    :vars
    (
      ?auto_94354 - LOCATION
      ?auto_94356 - CITY
      ?auto_94353 - LOCATION
      ?auto_94350 - LOCATION
      ?auto_94351 - LOCATION
      ?auto_94352 - LOCATION
      ?auto_94355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94354 ?auto_94356 ) ( IN-CITY ?auto_94344 ?auto_94356 ) ( not ( = ?auto_94344 ?auto_94354 ) ) ( OBJ-AT ?auto_94346 ?auto_94354 ) ( IN-CITY ?auto_94353 ?auto_94356 ) ( not ( = ?auto_94344 ?auto_94353 ) ) ( OBJ-AT ?auto_94345 ?auto_94353 ) ( IN-CITY ?auto_94350 ?auto_94356 ) ( not ( = ?auto_94344 ?auto_94350 ) ) ( OBJ-AT ?auto_94348 ?auto_94350 ) ( IN-CITY ?auto_94351 ?auto_94356 ) ( not ( = ?auto_94344 ?auto_94351 ) ) ( OBJ-AT ?auto_94349 ?auto_94351 ) ( IN-CITY ?auto_94352 ?auto_94356 ) ( not ( = ?auto_94344 ?auto_94352 ) ) ( OBJ-AT ?auto_94347 ?auto_94352 ) ( TRUCK-AT ?auto_94355 ?auto_94344 ) ( not ( = ?auto_94347 ?auto_94349 ) ) ( not ( = ?auto_94351 ?auto_94352 ) ) ( not ( = ?auto_94347 ?auto_94348 ) ) ( not ( = ?auto_94349 ?auto_94348 ) ) ( not ( = ?auto_94350 ?auto_94351 ) ) ( not ( = ?auto_94350 ?auto_94352 ) ) ( not ( = ?auto_94347 ?auto_94345 ) ) ( not ( = ?auto_94349 ?auto_94345 ) ) ( not ( = ?auto_94348 ?auto_94345 ) ) ( not ( = ?auto_94353 ?auto_94350 ) ) ( not ( = ?auto_94353 ?auto_94351 ) ) ( not ( = ?auto_94353 ?auto_94352 ) ) ( not ( = ?auto_94347 ?auto_94346 ) ) ( not ( = ?auto_94349 ?auto_94346 ) ) ( not ( = ?auto_94348 ?auto_94346 ) ) ( not ( = ?auto_94345 ?auto_94346 ) ) ( not ( = ?auto_94354 ?auto_94353 ) ) ( not ( = ?auto_94354 ?auto_94350 ) ) ( not ( = ?auto_94354 ?auto_94351 ) ) ( not ( = ?auto_94354 ?auto_94352 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94347 ?auto_94349 ?auto_94348 ?auto_94346 ?auto_94345 ?auto_94344 )
      ( DELIVER-5PKG-VERIFY ?auto_94345 ?auto_94346 ?auto_94347 ?auto_94348 ?auto_94349 ?auto_94344 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94574 - OBJ
      ?auto_94575 - OBJ
      ?auto_94576 - OBJ
      ?auto_94577 - OBJ
      ?auto_94578 - OBJ
      ?auto_94573 - LOCATION
    )
    :vars
    (
      ?auto_94583 - LOCATION
      ?auto_94585 - CITY
      ?auto_94582 - LOCATION
      ?auto_94579 - LOCATION
      ?auto_94580 - LOCATION
      ?auto_94581 - LOCATION
      ?auto_94584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94583 ?auto_94585 ) ( IN-CITY ?auto_94573 ?auto_94585 ) ( not ( = ?auto_94573 ?auto_94583 ) ) ( OBJ-AT ?auto_94575 ?auto_94583 ) ( IN-CITY ?auto_94582 ?auto_94585 ) ( not ( = ?auto_94573 ?auto_94582 ) ) ( OBJ-AT ?auto_94574 ?auto_94582 ) ( IN-CITY ?auto_94579 ?auto_94585 ) ( not ( = ?auto_94573 ?auto_94579 ) ) ( OBJ-AT ?auto_94578 ?auto_94579 ) ( IN-CITY ?auto_94580 ?auto_94585 ) ( not ( = ?auto_94573 ?auto_94580 ) ) ( OBJ-AT ?auto_94576 ?auto_94580 ) ( IN-CITY ?auto_94581 ?auto_94585 ) ( not ( = ?auto_94573 ?auto_94581 ) ) ( OBJ-AT ?auto_94577 ?auto_94581 ) ( TRUCK-AT ?auto_94584 ?auto_94573 ) ( not ( = ?auto_94577 ?auto_94576 ) ) ( not ( = ?auto_94580 ?auto_94581 ) ) ( not ( = ?auto_94577 ?auto_94578 ) ) ( not ( = ?auto_94576 ?auto_94578 ) ) ( not ( = ?auto_94579 ?auto_94580 ) ) ( not ( = ?auto_94579 ?auto_94581 ) ) ( not ( = ?auto_94577 ?auto_94574 ) ) ( not ( = ?auto_94576 ?auto_94574 ) ) ( not ( = ?auto_94578 ?auto_94574 ) ) ( not ( = ?auto_94582 ?auto_94579 ) ) ( not ( = ?auto_94582 ?auto_94580 ) ) ( not ( = ?auto_94582 ?auto_94581 ) ) ( not ( = ?auto_94577 ?auto_94575 ) ) ( not ( = ?auto_94576 ?auto_94575 ) ) ( not ( = ?auto_94578 ?auto_94575 ) ) ( not ( = ?auto_94574 ?auto_94575 ) ) ( not ( = ?auto_94583 ?auto_94582 ) ) ( not ( = ?auto_94583 ?auto_94579 ) ) ( not ( = ?auto_94583 ?auto_94580 ) ) ( not ( = ?auto_94583 ?auto_94581 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94577 ?auto_94576 ?auto_94578 ?auto_94575 ?auto_94574 ?auto_94573 )
      ( DELIVER-5PKG-VERIFY ?auto_94574 ?auto_94575 ?auto_94576 ?auto_94577 ?auto_94578 ?auto_94573 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94688 - OBJ
      ?auto_94689 - OBJ
      ?auto_94690 - OBJ
      ?auto_94691 - OBJ
      ?auto_94692 - OBJ
      ?auto_94687 - LOCATION
    )
    :vars
    (
      ?auto_94697 - LOCATION
      ?auto_94699 - CITY
      ?auto_94696 - LOCATION
      ?auto_94693 - LOCATION
      ?auto_94694 - LOCATION
      ?auto_94695 - LOCATION
      ?auto_94698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94697 ?auto_94699 ) ( IN-CITY ?auto_94687 ?auto_94699 ) ( not ( = ?auto_94687 ?auto_94697 ) ) ( OBJ-AT ?auto_94689 ?auto_94697 ) ( IN-CITY ?auto_94696 ?auto_94699 ) ( not ( = ?auto_94687 ?auto_94696 ) ) ( OBJ-AT ?auto_94688 ?auto_94696 ) ( IN-CITY ?auto_94693 ?auto_94699 ) ( not ( = ?auto_94687 ?auto_94693 ) ) ( OBJ-AT ?auto_94691 ?auto_94693 ) ( IN-CITY ?auto_94694 ?auto_94699 ) ( not ( = ?auto_94687 ?auto_94694 ) ) ( OBJ-AT ?auto_94690 ?auto_94694 ) ( IN-CITY ?auto_94695 ?auto_94699 ) ( not ( = ?auto_94687 ?auto_94695 ) ) ( OBJ-AT ?auto_94692 ?auto_94695 ) ( TRUCK-AT ?auto_94698 ?auto_94687 ) ( not ( = ?auto_94692 ?auto_94690 ) ) ( not ( = ?auto_94694 ?auto_94695 ) ) ( not ( = ?auto_94692 ?auto_94691 ) ) ( not ( = ?auto_94690 ?auto_94691 ) ) ( not ( = ?auto_94693 ?auto_94694 ) ) ( not ( = ?auto_94693 ?auto_94695 ) ) ( not ( = ?auto_94692 ?auto_94688 ) ) ( not ( = ?auto_94690 ?auto_94688 ) ) ( not ( = ?auto_94691 ?auto_94688 ) ) ( not ( = ?auto_94696 ?auto_94693 ) ) ( not ( = ?auto_94696 ?auto_94694 ) ) ( not ( = ?auto_94696 ?auto_94695 ) ) ( not ( = ?auto_94692 ?auto_94689 ) ) ( not ( = ?auto_94690 ?auto_94689 ) ) ( not ( = ?auto_94691 ?auto_94689 ) ) ( not ( = ?auto_94688 ?auto_94689 ) ) ( not ( = ?auto_94697 ?auto_94696 ) ) ( not ( = ?auto_94697 ?auto_94693 ) ) ( not ( = ?auto_94697 ?auto_94694 ) ) ( not ( = ?auto_94697 ?auto_94695 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94692 ?auto_94690 ?auto_94691 ?auto_94689 ?auto_94688 ?auto_94687 )
      ( DELIVER-5PKG-VERIFY ?auto_94688 ?auto_94689 ?auto_94690 ?auto_94691 ?auto_94692 ?auto_94687 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94917 - OBJ
      ?auto_94918 - OBJ
      ?auto_94919 - OBJ
      ?auto_94920 - OBJ
      ?auto_94921 - OBJ
      ?auto_94916 - LOCATION
    )
    :vars
    (
      ?auto_94926 - LOCATION
      ?auto_94928 - CITY
      ?auto_94925 - LOCATION
      ?auto_94922 - LOCATION
      ?auto_94923 - LOCATION
      ?auto_94924 - LOCATION
      ?auto_94927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94926 ?auto_94928 ) ( IN-CITY ?auto_94916 ?auto_94928 ) ( not ( = ?auto_94916 ?auto_94926 ) ) ( OBJ-AT ?auto_94918 ?auto_94926 ) ( IN-CITY ?auto_94925 ?auto_94928 ) ( not ( = ?auto_94916 ?auto_94925 ) ) ( OBJ-AT ?auto_94917 ?auto_94925 ) ( IN-CITY ?auto_94922 ?auto_94928 ) ( not ( = ?auto_94916 ?auto_94922 ) ) ( OBJ-AT ?auto_94919 ?auto_94922 ) ( IN-CITY ?auto_94923 ?auto_94928 ) ( not ( = ?auto_94916 ?auto_94923 ) ) ( OBJ-AT ?auto_94921 ?auto_94923 ) ( IN-CITY ?auto_94924 ?auto_94928 ) ( not ( = ?auto_94916 ?auto_94924 ) ) ( OBJ-AT ?auto_94920 ?auto_94924 ) ( TRUCK-AT ?auto_94927 ?auto_94916 ) ( not ( = ?auto_94920 ?auto_94921 ) ) ( not ( = ?auto_94923 ?auto_94924 ) ) ( not ( = ?auto_94920 ?auto_94919 ) ) ( not ( = ?auto_94921 ?auto_94919 ) ) ( not ( = ?auto_94922 ?auto_94923 ) ) ( not ( = ?auto_94922 ?auto_94924 ) ) ( not ( = ?auto_94920 ?auto_94917 ) ) ( not ( = ?auto_94921 ?auto_94917 ) ) ( not ( = ?auto_94919 ?auto_94917 ) ) ( not ( = ?auto_94925 ?auto_94922 ) ) ( not ( = ?auto_94925 ?auto_94923 ) ) ( not ( = ?auto_94925 ?auto_94924 ) ) ( not ( = ?auto_94920 ?auto_94918 ) ) ( not ( = ?auto_94921 ?auto_94918 ) ) ( not ( = ?auto_94919 ?auto_94918 ) ) ( not ( = ?auto_94917 ?auto_94918 ) ) ( not ( = ?auto_94926 ?auto_94925 ) ) ( not ( = ?auto_94926 ?auto_94922 ) ) ( not ( = ?auto_94926 ?auto_94923 ) ) ( not ( = ?auto_94926 ?auto_94924 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94920 ?auto_94921 ?auto_94919 ?auto_94918 ?auto_94917 ?auto_94916 )
      ( DELIVER-5PKG-VERIFY ?auto_94917 ?auto_94918 ?auto_94919 ?auto_94920 ?auto_94921 ?auto_94916 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94972 - OBJ
      ?auto_94973 - OBJ
      ?auto_94974 - OBJ
      ?auto_94975 - OBJ
      ?auto_94976 - OBJ
      ?auto_94971 - LOCATION
    )
    :vars
    (
      ?auto_94981 - LOCATION
      ?auto_94983 - CITY
      ?auto_94980 - LOCATION
      ?auto_94977 - LOCATION
      ?auto_94978 - LOCATION
      ?auto_94979 - LOCATION
      ?auto_94982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94981 ?auto_94983 ) ( IN-CITY ?auto_94971 ?auto_94983 ) ( not ( = ?auto_94971 ?auto_94981 ) ) ( OBJ-AT ?auto_94973 ?auto_94981 ) ( IN-CITY ?auto_94980 ?auto_94983 ) ( not ( = ?auto_94971 ?auto_94980 ) ) ( OBJ-AT ?auto_94972 ?auto_94980 ) ( IN-CITY ?auto_94977 ?auto_94983 ) ( not ( = ?auto_94971 ?auto_94977 ) ) ( OBJ-AT ?auto_94974 ?auto_94977 ) ( IN-CITY ?auto_94978 ?auto_94983 ) ( not ( = ?auto_94971 ?auto_94978 ) ) ( OBJ-AT ?auto_94975 ?auto_94978 ) ( IN-CITY ?auto_94979 ?auto_94983 ) ( not ( = ?auto_94971 ?auto_94979 ) ) ( OBJ-AT ?auto_94976 ?auto_94979 ) ( TRUCK-AT ?auto_94982 ?auto_94971 ) ( not ( = ?auto_94976 ?auto_94975 ) ) ( not ( = ?auto_94978 ?auto_94979 ) ) ( not ( = ?auto_94976 ?auto_94974 ) ) ( not ( = ?auto_94975 ?auto_94974 ) ) ( not ( = ?auto_94977 ?auto_94978 ) ) ( not ( = ?auto_94977 ?auto_94979 ) ) ( not ( = ?auto_94976 ?auto_94972 ) ) ( not ( = ?auto_94975 ?auto_94972 ) ) ( not ( = ?auto_94974 ?auto_94972 ) ) ( not ( = ?auto_94980 ?auto_94977 ) ) ( not ( = ?auto_94980 ?auto_94978 ) ) ( not ( = ?auto_94980 ?auto_94979 ) ) ( not ( = ?auto_94976 ?auto_94973 ) ) ( not ( = ?auto_94975 ?auto_94973 ) ) ( not ( = ?auto_94974 ?auto_94973 ) ) ( not ( = ?auto_94972 ?auto_94973 ) ) ( not ( = ?auto_94981 ?auto_94980 ) ) ( not ( = ?auto_94981 ?auto_94977 ) ) ( not ( = ?auto_94981 ?auto_94978 ) ) ( not ( = ?auto_94981 ?auto_94979 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94976 ?auto_94975 ?auto_94974 ?auto_94973 ?auto_94972 ?auto_94971 )
      ( DELIVER-5PKG-VERIFY ?auto_94972 ?auto_94973 ?auto_94974 ?auto_94975 ?auto_94976 ?auto_94971 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96567 - OBJ
      ?auto_96568 - OBJ
      ?auto_96569 - OBJ
      ?auto_96570 - OBJ
      ?auto_96571 - OBJ
      ?auto_96566 - LOCATION
    )
    :vars
    (
      ?auto_96576 - LOCATION
      ?auto_96578 - CITY
      ?auto_96575 - LOCATION
      ?auto_96572 - LOCATION
      ?auto_96573 - LOCATION
      ?auto_96574 - LOCATION
      ?auto_96577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96576 ?auto_96578 ) ( IN-CITY ?auto_96566 ?auto_96578 ) ( not ( = ?auto_96566 ?auto_96576 ) ) ( OBJ-AT ?auto_96567 ?auto_96576 ) ( IN-CITY ?auto_96575 ?auto_96578 ) ( not ( = ?auto_96566 ?auto_96575 ) ) ( OBJ-AT ?auto_96571 ?auto_96575 ) ( IN-CITY ?auto_96572 ?auto_96578 ) ( not ( = ?auto_96566 ?auto_96572 ) ) ( OBJ-AT ?auto_96570 ?auto_96572 ) ( IN-CITY ?auto_96573 ?auto_96578 ) ( not ( = ?auto_96566 ?auto_96573 ) ) ( OBJ-AT ?auto_96569 ?auto_96573 ) ( IN-CITY ?auto_96574 ?auto_96578 ) ( not ( = ?auto_96566 ?auto_96574 ) ) ( OBJ-AT ?auto_96568 ?auto_96574 ) ( TRUCK-AT ?auto_96577 ?auto_96566 ) ( not ( = ?auto_96568 ?auto_96569 ) ) ( not ( = ?auto_96573 ?auto_96574 ) ) ( not ( = ?auto_96568 ?auto_96570 ) ) ( not ( = ?auto_96569 ?auto_96570 ) ) ( not ( = ?auto_96572 ?auto_96573 ) ) ( not ( = ?auto_96572 ?auto_96574 ) ) ( not ( = ?auto_96568 ?auto_96571 ) ) ( not ( = ?auto_96569 ?auto_96571 ) ) ( not ( = ?auto_96570 ?auto_96571 ) ) ( not ( = ?auto_96575 ?auto_96572 ) ) ( not ( = ?auto_96575 ?auto_96573 ) ) ( not ( = ?auto_96575 ?auto_96574 ) ) ( not ( = ?auto_96568 ?auto_96567 ) ) ( not ( = ?auto_96569 ?auto_96567 ) ) ( not ( = ?auto_96570 ?auto_96567 ) ) ( not ( = ?auto_96571 ?auto_96567 ) ) ( not ( = ?auto_96576 ?auto_96575 ) ) ( not ( = ?auto_96576 ?auto_96572 ) ) ( not ( = ?auto_96576 ?auto_96573 ) ) ( not ( = ?auto_96576 ?auto_96574 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96568 ?auto_96569 ?auto_96570 ?auto_96567 ?auto_96571 ?auto_96566 )
      ( DELIVER-5PKG-VERIFY ?auto_96567 ?auto_96568 ?auto_96569 ?auto_96570 ?auto_96571 ?auto_96566 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96622 - OBJ
      ?auto_96623 - OBJ
      ?auto_96624 - OBJ
      ?auto_96625 - OBJ
      ?auto_96626 - OBJ
      ?auto_96621 - LOCATION
    )
    :vars
    (
      ?auto_96631 - LOCATION
      ?auto_96633 - CITY
      ?auto_96630 - LOCATION
      ?auto_96627 - LOCATION
      ?auto_96628 - LOCATION
      ?auto_96629 - LOCATION
      ?auto_96632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96631 ?auto_96633 ) ( IN-CITY ?auto_96621 ?auto_96633 ) ( not ( = ?auto_96621 ?auto_96631 ) ) ( OBJ-AT ?auto_96622 ?auto_96631 ) ( IN-CITY ?auto_96630 ?auto_96633 ) ( not ( = ?auto_96621 ?auto_96630 ) ) ( OBJ-AT ?auto_96625 ?auto_96630 ) ( IN-CITY ?auto_96627 ?auto_96633 ) ( not ( = ?auto_96621 ?auto_96627 ) ) ( OBJ-AT ?auto_96626 ?auto_96627 ) ( IN-CITY ?auto_96628 ?auto_96633 ) ( not ( = ?auto_96621 ?auto_96628 ) ) ( OBJ-AT ?auto_96624 ?auto_96628 ) ( IN-CITY ?auto_96629 ?auto_96633 ) ( not ( = ?auto_96621 ?auto_96629 ) ) ( OBJ-AT ?auto_96623 ?auto_96629 ) ( TRUCK-AT ?auto_96632 ?auto_96621 ) ( not ( = ?auto_96623 ?auto_96624 ) ) ( not ( = ?auto_96628 ?auto_96629 ) ) ( not ( = ?auto_96623 ?auto_96626 ) ) ( not ( = ?auto_96624 ?auto_96626 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96629 ) ) ( not ( = ?auto_96623 ?auto_96625 ) ) ( not ( = ?auto_96624 ?auto_96625 ) ) ( not ( = ?auto_96626 ?auto_96625 ) ) ( not ( = ?auto_96630 ?auto_96627 ) ) ( not ( = ?auto_96630 ?auto_96628 ) ) ( not ( = ?auto_96630 ?auto_96629 ) ) ( not ( = ?auto_96623 ?auto_96622 ) ) ( not ( = ?auto_96624 ?auto_96622 ) ) ( not ( = ?auto_96626 ?auto_96622 ) ) ( not ( = ?auto_96625 ?auto_96622 ) ) ( not ( = ?auto_96631 ?auto_96630 ) ) ( not ( = ?auto_96631 ?auto_96627 ) ) ( not ( = ?auto_96631 ?auto_96628 ) ) ( not ( = ?auto_96631 ?auto_96629 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96623 ?auto_96624 ?auto_96626 ?auto_96622 ?auto_96625 ?auto_96621 )
      ( DELIVER-5PKG-VERIFY ?auto_96622 ?auto_96623 ?auto_96624 ?auto_96625 ?auto_96626 ?auto_96621 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96851 - OBJ
      ?auto_96852 - OBJ
      ?auto_96853 - OBJ
      ?auto_96854 - OBJ
      ?auto_96855 - OBJ
      ?auto_96850 - LOCATION
    )
    :vars
    (
      ?auto_96860 - LOCATION
      ?auto_96862 - CITY
      ?auto_96859 - LOCATION
      ?auto_96856 - LOCATION
      ?auto_96857 - LOCATION
      ?auto_96858 - LOCATION
      ?auto_96861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96860 ?auto_96862 ) ( IN-CITY ?auto_96850 ?auto_96862 ) ( not ( = ?auto_96850 ?auto_96860 ) ) ( OBJ-AT ?auto_96851 ?auto_96860 ) ( IN-CITY ?auto_96859 ?auto_96862 ) ( not ( = ?auto_96850 ?auto_96859 ) ) ( OBJ-AT ?auto_96855 ?auto_96859 ) ( IN-CITY ?auto_96856 ?auto_96862 ) ( not ( = ?auto_96850 ?auto_96856 ) ) ( OBJ-AT ?auto_96853 ?auto_96856 ) ( IN-CITY ?auto_96857 ?auto_96862 ) ( not ( = ?auto_96850 ?auto_96857 ) ) ( OBJ-AT ?auto_96854 ?auto_96857 ) ( IN-CITY ?auto_96858 ?auto_96862 ) ( not ( = ?auto_96850 ?auto_96858 ) ) ( OBJ-AT ?auto_96852 ?auto_96858 ) ( TRUCK-AT ?auto_96861 ?auto_96850 ) ( not ( = ?auto_96852 ?auto_96854 ) ) ( not ( = ?auto_96857 ?auto_96858 ) ) ( not ( = ?auto_96852 ?auto_96853 ) ) ( not ( = ?auto_96854 ?auto_96853 ) ) ( not ( = ?auto_96856 ?auto_96857 ) ) ( not ( = ?auto_96856 ?auto_96858 ) ) ( not ( = ?auto_96852 ?auto_96855 ) ) ( not ( = ?auto_96854 ?auto_96855 ) ) ( not ( = ?auto_96853 ?auto_96855 ) ) ( not ( = ?auto_96859 ?auto_96856 ) ) ( not ( = ?auto_96859 ?auto_96857 ) ) ( not ( = ?auto_96859 ?auto_96858 ) ) ( not ( = ?auto_96852 ?auto_96851 ) ) ( not ( = ?auto_96854 ?auto_96851 ) ) ( not ( = ?auto_96853 ?auto_96851 ) ) ( not ( = ?auto_96855 ?auto_96851 ) ) ( not ( = ?auto_96860 ?auto_96859 ) ) ( not ( = ?auto_96860 ?auto_96856 ) ) ( not ( = ?auto_96860 ?auto_96857 ) ) ( not ( = ?auto_96860 ?auto_96858 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96852 ?auto_96854 ?auto_96853 ?auto_96851 ?auto_96855 ?auto_96850 )
      ( DELIVER-5PKG-VERIFY ?auto_96851 ?auto_96852 ?auto_96853 ?auto_96854 ?auto_96855 ?auto_96850 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96965 - OBJ
      ?auto_96966 - OBJ
      ?auto_96967 - OBJ
      ?auto_96968 - OBJ
      ?auto_96969 - OBJ
      ?auto_96964 - LOCATION
    )
    :vars
    (
      ?auto_96974 - LOCATION
      ?auto_96976 - CITY
      ?auto_96973 - LOCATION
      ?auto_96970 - LOCATION
      ?auto_96971 - LOCATION
      ?auto_96972 - LOCATION
      ?auto_96975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96974 ?auto_96976 ) ( IN-CITY ?auto_96964 ?auto_96976 ) ( not ( = ?auto_96964 ?auto_96974 ) ) ( OBJ-AT ?auto_96965 ?auto_96974 ) ( IN-CITY ?auto_96973 ?auto_96976 ) ( not ( = ?auto_96964 ?auto_96973 ) ) ( OBJ-AT ?auto_96968 ?auto_96973 ) ( IN-CITY ?auto_96970 ?auto_96976 ) ( not ( = ?auto_96964 ?auto_96970 ) ) ( OBJ-AT ?auto_96967 ?auto_96970 ) ( IN-CITY ?auto_96971 ?auto_96976 ) ( not ( = ?auto_96964 ?auto_96971 ) ) ( OBJ-AT ?auto_96969 ?auto_96971 ) ( IN-CITY ?auto_96972 ?auto_96976 ) ( not ( = ?auto_96964 ?auto_96972 ) ) ( OBJ-AT ?auto_96966 ?auto_96972 ) ( TRUCK-AT ?auto_96975 ?auto_96964 ) ( not ( = ?auto_96966 ?auto_96969 ) ) ( not ( = ?auto_96971 ?auto_96972 ) ) ( not ( = ?auto_96966 ?auto_96967 ) ) ( not ( = ?auto_96969 ?auto_96967 ) ) ( not ( = ?auto_96970 ?auto_96971 ) ) ( not ( = ?auto_96970 ?auto_96972 ) ) ( not ( = ?auto_96966 ?auto_96968 ) ) ( not ( = ?auto_96969 ?auto_96968 ) ) ( not ( = ?auto_96967 ?auto_96968 ) ) ( not ( = ?auto_96973 ?auto_96970 ) ) ( not ( = ?auto_96973 ?auto_96971 ) ) ( not ( = ?auto_96973 ?auto_96972 ) ) ( not ( = ?auto_96966 ?auto_96965 ) ) ( not ( = ?auto_96969 ?auto_96965 ) ) ( not ( = ?auto_96967 ?auto_96965 ) ) ( not ( = ?auto_96968 ?auto_96965 ) ) ( not ( = ?auto_96974 ?auto_96973 ) ) ( not ( = ?auto_96974 ?auto_96970 ) ) ( not ( = ?auto_96974 ?auto_96971 ) ) ( not ( = ?auto_96974 ?auto_96972 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96966 ?auto_96969 ?auto_96967 ?auto_96965 ?auto_96968 ?auto_96964 )
      ( DELIVER-5PKG-VERIFY ?auto_96965 ?auto_96966 ?auto_96967 ?auto_96968 ?auto_96969 ?auto_96964 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97194 - OBJ
      ?auto_97195 - OBJ
      ?auto_97196 - OBJ
      ?auto_97197 - OBJ
      ?auto_97198 - OBJ
      ?auto_97193 - LOCATION
    )
    :vars
    (
      ?auto_97203 - LOCATION
      ?auto_97205 - CITY
      ?auto_97202 - LOCATION
      ?auto_97199 - LOCATION
      ?auto_97200 - LOCATION
      ?auto_97201 - LOCATION
      ?auto_97204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97203 ?auto_97205 ) ( IN-CITY ?auto_97193 ?auto_97205 ) ( not ( = ?auto_97193 ?auto_97203 ) ) ( OBJ-AT ?auto_97194 ?auto_97203 ) ( IN-CITY ?auto_97202 ?auto_97205 ) ( not ( = ?auto_97193 ?auto_97202 ) ) ( OBJ-AT ?auto_97196 ?auto_97202 ) ( IN-CITY ?auto_97199 ?auto_97205 ) ( not ( = ?auto_97193 ?auto_97199 ) ) ( OBJ-AT ?auto_97198 ?auto_97199 ) ( IN-CITY ?auto_97200 ?auto_97205 ) ( not ( = ?auto_97193 ?auto_97200 ) ) ( OBJ-AT ?auto_97197 ?auto_97200 ) ( IN-CITY ?auto_97201 ?auto_97205 ) ( not ( = ?auto_97193 ?auto_97201 ) ) ( OBJ-AT ?auto_97195 ?auto_97201 ) ( TRUCK-AT ?auto_97204 ?auto_97193 ) ( not ( = ?auto_97195 ?auto_97197 ) ) ( not ( = ?auto_97200 ?auto_97201 ) ) ( not ( = ?auto_97195 ?auto_97198 ) ) ( not ( = ?auto_97197 ?auto_97198 ) ) ( not ( = ?auto_97199 ?auto_97200 ) ) ( not ( = ?auto_97199 ?auto_97201 ) ) ( not ( = ?auto_97195 ?auto_97196 ) ) ( not ( = ?auto_97197 ?auto_97196 ) ) ( not ( = ?auto_97198 ?auto_97196 ) ) ( not ( = ?auto_97202 ?auto_97199 ) ) ( not ( = ?auto_97202 ?auto_97200 ) ) ( not ( = ?auto_97202 ?auto_97201 ) ) ( not ( = ?auto_97195 ?auto_97194 ) ) ( not ( = ?auto_97197 ?auto_97194 ) ) ( not ( = ?auto_97198 ?auto_97194 ) ) ( not ( = ?auto_97196 ?auto_97194 ) ) ( not ( = ?auto_97203 ?auto_97202 ) ) ( not ( = ?auto_97203 ?auto_97199 ) ) ( not ( = ?auto_97203 ?auto_97200 ) ) ( not ( = ?auto_97203 ?auto_97201 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97195 ?auto_97197 ?auto_97198 ?auto_97194 ?auto_97196 ?auto_97193 )
      ( DELIVER-5PKG-VERIFY ?auto_97194 ?auto_97195 ?auto_97196 ?auto_97197 ?auto_97198 ?auto_97193 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97249 - OBJ
      ?auto_97250 - OBJ
      ?auto_97251 - OBJ
      ?auto_97252 - OBJ
      ?auto_97253 - OBJ
      ?auto_97248 - LOCATION
    )
    :vars
    (
      ?auto_97258 - LOCATION
      ?auto_97260 - CITY
      ?auto_97257 - LOCATION
      ?auto_97254 - LOCATION
      ?auto_97255 - LOCATION
      ?auto_97256 - LOCATION
      ?auto_97259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97258 ?auto_97260 ) ( IN-CITY ?auto_97248 ?auto_97260 ) ( not ( = ?auto_97248 ?auto_97258 ) ) ( OBJ-AT ?auto_97249 ?auto_97258 ) ( IN-CITY ?auto_97257 ?auto_97260 ) ( not ( = ?auto_97248 ?auto_97257 ) ) ( OBJ-AT ?auto_97251 ?auto_97257 ) ( IN-CITY ?auto_97254 ?auto_97260 ) ( not ( = ?auto_97248 ?auto_97254 ) ) ( OBJ-AT ?auto_97252 ?auto_97254 ) ( IN-CITY ?auto_97255 ?auto_97260 ) ( not ( = ?auto_97248 ?auto_97255 ) ) ( OBJ-AT ?auto_97253 ?auto_97255 ) ( IN-CITY ?auto_97256 ?auto_97260 ) ( not ( = ?auto_97248 ?auto_97256 ) ) ( OBJ-AT ?auto_97250 ?auto_97256 ) ( TRUCK-AT ?auto_97259 ?auto_97248 ) ( not ( = ?auto_97250 ?auto_97253 ) ) ( not ( = ?auto_97255 ?auto_97256 ) ) ( not ( = ?auto_97250 ?auto_97252 ) ) ( not ( = ?auto_97253 ?auto_97252 ) ) ( not ( = ?auto_97254 ?auto_97255 ) ) ( not ( = ?auto_97254 ?auto_97256 ) ) ( not ( = ?auto_97250 ?auto_97251 ) ) ( not ( = ?auto_97253 ?auto_97251 ) ) ( not ( = ?auto_97252 ?auto_97251 ) ) ( not ( = ?auto_97257 ?auto_97254 ) ) ( not ( = ?auto_97257 ?auto_97255 ) ) ( not ( = ?auto_97257 ?auto_97256 ) ) ( not ( = ?auto_97250 ?auto_97249 ) ) ( not ( = ?auto_97253 ?auto_97249 ) ) ( not ( = ?auto_97252 ?auto_97249 ) ) ( not ( = ?auto_97251 ?auto_97249 ) ) ( not ( = ?auto_97258 ?auto_97257 ) ) ( not ( = ?auto_97258 ?auto_97254 ) ) ( not ( = ?auto_97258 ?auto_97255 ) ) ( not ( = ?auto_97258 ?auto_97256 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97250 ?auto_97253 ?auto_97252 ?auto_97249 ?auto_97251 ?auto_97248 )
      ( DELIVER-5PKG-VERIFY ?auto_97249 ?auto_97250 ?auto_97251 ?auto_97252 ?auto_97253 ?auto_97248 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98011 - OBJ
      ?auto_98012 - OBJ
      ?auto_98013 - OBJ
      ?auto_98014 - OBJ
      ?auto_98015 - OBJ
      ?auto_98010 - LOCATION
    )
    :vars
    (
      ?auto_98020 - LOCATION
      ?auto_98022 - CITY
      ?auto_98019 - LOCATION
      ?auto_98016 - LOCATION
      ?auto_98017 - LOCATION
      ?auto_98018 - LOCATION
      ?auto_98021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98020 ?auto_98022 ) ( IN-CITY ?auto_98010 ?auto_98022 ) ( not ( = ?auto_98010 ?auto_98020 ) ) ( OBJ-AT ?auto_98011 ?auto_98020 ) ( IN-CITY ?auto_98019 ?auto_98022 ) ( not ( = ?auto_98010 ?auto_98019 ) ) ( OBJ-AT ?auto_98015 ?auto_98019 ) ( IN-CITY ?auto_98016 ?auto_98022 ) ( not ( = ?auto_98010 ?auto_98016 ) ) ( OBJ-AT ?auto_98014 ?auto_98016 ) ( IN-CITY ?auto_98017 ?auto_98022 ) ( not ( = ?auto_98010 ?auto_98017 ) ) ( OBJ-AT ?auto_98012 ?auto_98017 ) ( IN-CITY ?auto_98018 ?auto_98022 ) ( not ( = ?auto_98010 ?auto_98018 ) ) ( OBJ-AT ?auto_98013 ?auto_98018 ) ( TRUCK-AT ?auto_98021 ?auto_98010 ) ( not ( = ?auto_98013 ?auto_98012 ) ) ( not ( = ?auto_98017 ?auto_98018 ) ) ( not ( = ?auto_98013 ?auto_98014 ) ) ( not ( = ?auto_98012 ?auto_98014 ) ) ( not ( = ?auto_98016 ?auto_98017 ) ) ( not ( = ?auto_98016 ?auto_98018 ) ) ( not ( = ?auto_98013 ?auto_98015 ) ) ( not ( = ?auto_98012 ?auto_98015 ) ) ( not ( = ?auto_98014 ?auto_98015 ) ) ( not ( = ?auto_98019 ?auto_98016 ) ) ( not ( = ?auto_98019 ?auto_98017 ) ) ( not ( = ?auto_98019 ?auto_98018 ) ) ( not ( = ?auto_98013 ?auto_98011 ) ) ( not ( = ?auto_98012 ?auto_98011 ) ) ( not ( = ?auto_98014 ?auto_98011 ) ) ( not ( = ?auto_98015 ?auto_98011 ) ) ( not ( = ?auto_98020 ?auto_98019 ) ) ( not ( = ?auto_98020 ?auto_98016 ) ) ( not ( = ?auto_98020 ?auto_98017 ) ) ( not ( = ?auto_98020 ?auto_98018 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98013 ?auto_98012 ?auto_98014 ?auto_98011 ?auto_98015 ?auto_98010 )
      ( DELIVER-5PKG-VERIFY ?auto_98011 ?auto_98012 ?auto_98013 ?auto_98014 ?auto_98015 ?auto_98010 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98066 - OBJ
      ?auto_98067 - OBJ
      ?auto_98068 - OBJ
      ?auto_98069 - OBJ
      ?auto_98070 - OBJ
      ?auto_98065 - LOCATION
    )
    :vars
    (
      ?auto_98075 - LOCATION
      ?auto_98077 - CITY
      ?auto_98074 - LOCATION
      ?auto_98071 - LOCATION
      ?auto_98072 - LOCATION
      ?auto_98073 - LOCATION
      ?auto_98076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98075 ?auto_98077 ) ( IN-CITY ?auto_98065 ?auto_98077 ) ( not ( = ?auto_98065 ?auto_98075 ) ) ( OBJ-AT ?auto_98066 ?auto_98075 ) ( IN-CITY ?auto_98074 ?auto_98077 ) ( not ( = ?auto_98065 ?auto_98074 ) ) ( OBJ-AT ?auto_98069 ?auto_98074 ) ( IN-CITY ?auto_98071 ?auto_98077 ) ( not ( = ?auto_98065 ?auto_98071 ) ) ( OBJ-AT ?auto_98070 ?auto_98071 ) ( IN-CITY ?auto_98072 ?auto_98077 ) ( not ( = ?auto_98065 ?auto_98072 ) ) ( OBJ-AT ?auto_98067 ?auto_98072 ) ( IN-CITY ?auto_98073 ?auto_98077 ) ( not ( = ?auto_98065 ?auto_98073 ) ) ( OBJ-AT ?auto_98068 ?auto_98073 ) ( TRUCK-AT ?auto_98076 ?auto_98065 ) ( not ( = ?auto_98068 ?auto_98067 ) ) ( not ( = ?auto_98072 ?auto_98073 ) ) ( not ( = ?auto_98068 ?auto_98070 ) ) ( not ( = ?auto_98067 ?auto_98070 ) ) ( not ( = ?auto_98071 ?auto_98072 ) ) ( not ( = ?auto_98071 ?auto_98073 ) ) ( not ( = ?auto_98068 ?auto_98069 ) ) ( not ( = ?auto_98067 ?auto_98069 ) ) ( not ( = ?auto_98070 ?auto_98069 ) ) ( not ( = ?auto_98074 ?auto_98071 ) ) ( not ( = ?auto_98074 ?auto_98072 ) ) ( not ( = ?auto_98074 ?auto_98073 ) ) ( not ( = ?auto_98068 ?auto_98066 ) ) ( not ( = ?auto_98067 ?auto_98066 ) ) ( not ( = ?auto_98070 ?auto_98066 ) ) ( not ( = ?auto_98069 ?auto_98066 ) ) ( not ( = ?auto_98075 ?auto_98074 ) ) ( not ( = ?auto_98075 ?auto_98071 ) ) ( not ( = ?auto_98075 ?auto_98072 ) ) ( not ( = ?auto_98075 ?auto_98073 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98068 ?auto_98067 ?auto_98070 ?auto_98066 ?auto_98069 ?auto_98065 )
      ( DELIVER-5PKG-VERIFY ?auto_98066 ?auto_98067 ?auto_98068 ?auto_98069 ?auto_98070 ?auto_98065 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98595 - OBJ
      ?auto_98596 - OBJ
      ?auto_98597 - OBJ
      ?auto_98598 - OBJ
      ?auto_98599 - OBJ
      ?auto_98594 - LOCATION
    )
    :vars
    (
      ?auto_98604 - LOCATION
      ?auto_98606 - CITY
      ?auto_98603 - LOCATION
      ?auto_98600 - LOCATION
      ?auto_98601 - LOCATION
      ?auto_98602 - LOCATION
      ?auto_98605 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98604 ?auto_98606 ) ( IN-CITY ?auto_98594 ?auto_98606 ) ( not ( = ?auto_98594 ?auto_98604 ) ) ( OBJ-AT ?auto_98595 ?auto_98604 ) ( IN-CITY ?auto_98603 ?auto_98606 ) ( not ( = ?auto_98594 ?auto_98603 ) ) ( OBJ-AT ?auto_98599 ?auto_98603 ) ( IN-CITY ?auto_98600 ?auto_98606 ) ( not ( = ?auto_98594 ?auto_98600 ) ) ( OBJ-AT ?auto_98597 ?auto_98600 ) ( IN-CITY ?auto_98601 ?auto_98606 ) ( not ( = ?auto_98594 ?auto_98601 ) ) ( OBJ-AT ?auto_98596 ?auto_98601 ) ( IN-CITY ?auto_98602 ?auto_98606 ) ( not ( = ?auto_98594 ?auto_98602 ) ) ( OBJ-AT ?auto_98598 ?auto_98602 ) ( TRUCK-AT ?auto_98605 ?auto_98594 ) ( not ( = ?auto_98598 ?auto_98596 ) ) ( not ( = ?auto_98601 ?auto_98602 ) ) ( not ( = ?auto_98598 ?auto_98597 ) ) ( not ( = ?auto_98596 ?auto_98597 ) ) ( not ( = ?auto_98600 ?auto_98601 ) ) ( not ( = ?auto_98600 ?auto_98602 ) ) ( not ( = ?auto_98598 ?auto_98599 ) ) ( not ( = ?auto_98596 ?auto_98599 ) ) ( not ( = ?auto_98597 ?auto_98599 ) ) ( not ( = ?auto_98603 ?auto_98600 ) ) ( not ( = ?auto_98603 ?auto_98601 ) ) ( not ( = ?auto_98603 ?auto_98602 ) ) ( not ( = ?auto_98598 ?auto_98595 ) ) ( not ( = ?auto_98596 ?auto_98595 ) ) ( not ( = ?auto_98597 ?auto_98595 ) ) ( not ( = ?auto_98599 ?auto_98595 ) ) ( not ( = ?auto_98604 ?auto_98603 ) ) ( not ( = ?auto_98604 ?auto_98600 ) ) ( not ( = ?auto_98604 ?auto_98601 ) ) ( not ( = ?auto_98604 ?auto_98602 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98598 ?auto_98596 ?auto_98597 ?auto_98595 ?auto_98599 ?auto_98594 )
      ( DELIVER-5PKG-VERIFY ?auto_98595 ?auto_98596 ?auto_98597 ?auto_98598 ?auto_98599 ?auto_98594 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98768 - OBJ
      ?auto_98769 - OBJ
      ?auto_98770 - OBJ
      ?auto_98771 - OBJ
      ?auto_98772 - OBJ
      ?auto_98767 - LOCATION
    )
    :vars
    (
      ?auto_98777 - LOCATION
      ?auto_98779 - CITY
      ?auto_98776 - LOCATION
      ?auto_98773 - LOCATION
      ?auto_98774 - LOCATION
      ?auto_98775 - LOCATION
      ?auto_98778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98777 ?auto_98779 ) ( IN-CITY ?auto_98767 ?auto_98779 ) ( not ( = ?auto_98767 ?auto_98777 ) ) ( OBJ-AT ?auto_98768 ?auto_98777 ) ( IN-CITY ?auto_98776 ?auto_98779 ) ( not ( = ?auto_98767 ?auto_98776 ) ) ( OBJ-AT ?auto_98771 ?auto_98776 ) ( IN-CITY ?auto_98773 ?auto_98779 ) ( not ( = ?auto_98767 ?auto_98773 ) ) ( OBJ-AT ?auto_98770 ?auto_98773 ) ( IN-CITY ?auto_98774 ?auto_98779 ) ( not ( = ?auto_98767 ?auto_98774 ) ) ( OBJ-AT ?auto_98769 ?auto_98774 ) ( IN-CITY ?auto_98775 ?auto_98779 ) ( not ( = ?auto_98767 ?auto_98775 ) ) ( OBJ-AT ?auto_98772 ?auto_98775 ) ( TRUCK-AT ?auto_98778 ?auto_98767 ) ( not ( = ?auto_98772 ?auto_98769 ) ) ( not ( = ?auto_98774 ?auto_98775 ) ) ( not ( = ?auto_98772 ?auto_98770 ) ) ( not ( = ?auto_98769 ?auto_98770 ) ) ( not ( = ?auto_98773 ?auto_98774 ) ) ( not ( = ?auto_98773 ?auto_98775 ) ) ( not ( = ?auto_98772 ?auto_98771 ) ) ( not ( = ?auto_98769 ?auto_98771 ) ) ( not ( = ?auto_98770 ?auto_98771 ) ) ( not ( = ?auto_98776 ?auto_98773 ) ) ( not ( = ?auto_98776 ?auto_98774 ) ) ( not ( = ?auto_98776 ?auto_98775 ) ) ( not ( = ?auto_98772 ?auto_98768 ) ) ( not ( = ?auto_98769 ?auto_98768 ) ) ( not ( = ?auto_98770 ?auto_98768 ) ) ( not ( = ?auto_98771 ?auto_98768 ) ) ( not ( = ?auto_98777 ?auto_98776 ) ) ( not ( = ?auto_98777 ?auto_98773 ) ) ( not ( = ?auto_98777 ?auto_98774 ) ) ( not ( = ?auto_98777 ?auto_98775 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98772 ?auto_98769 ?auto_98770 ?auto_98768 ?auto_98771 ?auto_98767 )
      ( DELIVER-5PKG-VERIFY ?auto_98768 ?auto_98769 ?auto_98770 ?auto_98771 ?auto_98772 ?auto_98767 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98938 - OBJ
      ?auto_98939 - OBJ
      ?auto_98940 - OBJ
      ?auto_98941 - OBJ
      ?auto_98942 - OBJ
      ?auto_98937 - LOCATION
    )
    :vars
    (
      ?auto_98947 - LOCATION
      ?auto_98949 - CITY
      ?auto_98946 - LOCATION
      ?auto_98943 - LOCATION
      ?auto_98944 - LOCATION
      ?auto_98945 - LOCATION
      ?auto_98948 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98947 ?auto_98949 ) ( IN-CITY ?auto_98937 ?auto_98949 ) ( not ( = ?auto_98937 ?auto_98947 ) ) ( OBJ-AT ?auto_98938 ?auto_98947 ) ( IN-CITY ?auto_98946 ?auto_98949 ) ( not ( = ?auto_98937 ?auto_98946 ) ) ( OBJ-AT ?auto_98940 ?auto_98946 ) ( IN-CITY ?auto_98943 ?auto_98949 ) ( not ( = ?auto_98937 ?auto_98943 ) ) ( OBJ-AT ?auto_98942 ?auto_98943 ) ( IN-CITY ?auto_98944 ?auto_98949 ) ( not ( = ?auto_98937 ?auto_98944 ) ) ( OBJ-AT ?auto_98939 ?auto_98944 ) ( IN-CITY ?auto_98945 ?auto_98949 ) ( not ( = ?auto_98937 ?auto_98945 ) ) ( OBJ-AT ?auto_98941 ?auto_98945 ) ( TRUCK-AT ?auto_98948 ?auto_98937 ) ( not ( = ?auto_98941 ?auto_98939 ) ) ( not ( = ?auto_98944 ?auto_98945 ) ) ( not ( = ?auto_98941 ?auto_98942 ) ) ( not ( = ?auto_98939 ?auto_98942 ) ) ( not ( = ?auto_98943 ?auto_98944 ) ) ( not ( = ?auto_98943 ?auto_98945 ) ) ( not ( = ?auto_98941 ?auto_98940 ) ) ( not ( = ?auto_98939 ?auto_98940 ) ) ( not ( = ?auto_98942 ?auto_98940 ) ) ( not ( = ?auto_98946 ?auto_98943 ) ) ( not ( = ?auto_98946 ?auto_98944 ) ) ( not ( = ?auto_98946 ?auto_98945 ) ) ( not ( = ?auto_98941 ?auto_98938 ) ) ( not ( = ?auto_98939 ?auto_98938 ) ) ( not ( = ?auto_98942 ?auto_98938 ) ) ( not ( = ?auto_98940 ?auto_98938 ) ) ( not ( = ?auto_98947 ?auto_98946 ) ) ( not ( = ?auto_98947 ?auto_98943 ) ) ( not ( = ?auto_98947 ?auto_98944 ) ) ( not ( = ?auto_98947 ?auto_98945 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98941 ?auto_98939 ?auto_98942 ?auto_98938 ?auto_98940 ?auto_98937 )
      ( DELIVER-5PKG-VERIFY ?auto_98938 ?auto_98939 ?auto_98940 ?auto_98941 ?auto_98942 ?auto_98937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99052 - OBJ
      ?auto_99053 - OBJ
      ?auto_99054 - OBJ
      ?auto_99055 - OBJ
      ?auto_99056 - OBJ
      ?auto_99051 - LOCATION
    )
    :vars
    (
      ?auto_99061 - LOCATION
      ?auto_99063 - CITY
      ?auto_99060 - LOCATION
      ?auto_99057 - LOCATION
      ?auto_99058 - LOCATION
      ?auto_99059 - LOCATION
      ?auto_99062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99061 ?auto_99063 ) ( IN-CITY ?auto_99051 ?auto_99063 ) ( not ( = ?auto_99051 ?auto_99061 ) ) ( OBJ-AT ?auto_99052 ?auto_99061 ) ( IN-CITY ?auto_99060 ?auto_99063 ) ( not ( = ?auto_99051 ?auto_99060 ) ) ( OBJ-AT ?auto_99054 ?auto_99060 ) ( IN-CITY ?auto_99057 ?auto_99063 ) ( not ( = ?auto_99051 ?auto_99057 ) ) ( OBJ-AT ?auto_99055 ?auto_99057 ) ( IN-CITY ?auto_99058 ?auto_99063 ) ( not ( = ?auto_99051 ?auto_99058 ) ) ( OBJ-AT ?auto_99053 ?auto_99058 ) ( IN-CITY ?auto_99059 ?auto_99063 ) ( not ( = ?auto_99051 ?auto_99059 ) ) ( OBJ-AT ?auto_99056 ?auto_99059 ) ( TRUCK-AT ?auto_99062 ?auto_99051 ) ( not ( = ?auto_99056 ?auto_99053 ) ) ( not ( = ?auto_99058 ?auto_99059 ) ) ( not ( = ?auto_99056 ?auto_99055 ) ) ( not ( = ?auto_99053 ?auto_99055 ) ) ( not ( = ?auto_99057 ?auto_99058 ) ) ( not ( = ?auto_99057 ?auto_99059 ) ) ( not ( = ?auto_99056 ?auto_99054 ) ) ( not ( = ?auto_99053 ?auto_99054 ) ) ( not ( = ?auto_99055 ?auto_99054 ) ) ( not ( = ?auto_99060 ?auto_99057 ) ) ( not ( = ?auto_99060 ?auto_99058 ) ) ( not ( = ?auto_99060 ?auto_99059 ) ) ( not ( = ?auto_99056 ?auto_99052 ) ) ( not ( = ?auto_99053 ?auto_99052 ) ) ( not ( = ?auto_99055 ?auto_99052 ) ) ( not ( = ?auto_99054 ?auto_99052 ) ) ( not ( = ?auto_99061 ?auto_99060 ) ) ( not ( = ?auto_99061 ?auto_99057 ) ) ( not ( = ?auto_99061 ?auto_99058 ) ) ( not ( = ?auto_99061 ?auto_99059 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99056 ?auto_99053 ?auto_99055 ?auto_99052 ?auto_99054 ?auto_99051 )
      ( DELIVER-5PKG-VERIFY ?auto_99052 ?auto_99053 ?auto_99054 ?auto_99055 ?auto_99056 ?auto_99051 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99755 - OBJ
      ?auto_99756 - OBJ
      ?auto_99757 - OBJ
      ?auto_99758 - OBJ
      ?auto_99759 - OBJ
      ?auto_99754 - LOCATION
    )
    :vars
    (
      ?auto_99764 - LOCATION
      ?auto_99766 - CITY
      ?auto_99763 - LOCATION
      ?auto_99760 - LOCATION
      ?auto_99761 - LOCATION
      ?auto_99762 - LOCATION
      ?auto_99765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99764 ?auto_99766 ) ( IN-CITY ?auto_99754 ?auto_99766 ) ( not ( = ?auto_99754 ?auto_99764 ) ) ( OBJ-AT ?auto_99755 ?auto_99764 ) ( IN-CITY ?auto_99763 ?auto_99766 ) ( not ( = ?auto_99754 ?auto_99763 ) ) ( OBJ-AT ?auto_99759 ?auto_99763 ) ( IN-CITY ?auto_99760 ?auto_99766 ) ( not ( = ?auto_99754 ?auto_99760 ) ) ( OBJ-AT ?auto_99756 ?auto_99760 ) ( IN-CITY ?auto_99761 ?auto_99766 ) ( not ( = ?auto_99754 ?auto_99761 ) ) ( OBJ-AT ?auto_99758 ?auto_99761 ) ( IN-CITY ?auto_99762 ?auto_99766 ) ( not ( = ?auto_99754 ?auto_99762 ) ) ( OBJ-AT ?auto_99757 ?auto_99762 ) ( TRUCK-AT ?auto_99765 ?auto_99754 ) ( not ( = ?auto_99757 ?auto_99758 ) ) ( not ( = ?auto_99761 ?auto_99762 ) ) ( not ( = ?auto_99757 ?auto_99756 ) ) ( not ( = ?auto_99758 ?auto_99756 ) ) ( not ( = ?auto_99760 ?auto_99761 ) ) ( not ( = ?auto_99760 ?auto_99762 ) ) ( not ( = ?auto_99757 ?auto_99759 ) ) ( not ( = ?auto_99758 ?auto_99759 ) ) ( not ( = ?auto_99756 ?auto_99759 ) ) ( not ( = ?auto_99763 ?auto_99760 ) ) ( not ( = ?auto_99763 ?auto_99761 ) ) ( not ( = ?auto_99763 ?auto_99762 ) ) ( not ( = ?auto_99757 ?auto_99755 ) ) ( not ( = ?auto_99758 ?auto_99755 ) ) ( not ( = ?auto_99756 ?auto_99755 ) ) ( not ( = ?auto_99759 ?auto_99755 ) ) ( not ( = ?auto_99764 ?auto_99763 ) ) ( not ( = ?auto_99764 ?auto_99760 ) ) ( not ( = ?auto_99764 ?auto_99761 ) ) ( not ( = ?auto_99764 ?auto_99762 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99757 ?auto_99758 ?auto_99756 ?auto_99755 ?auto_99759 ?auto_99754 )
      ( DELIVER-5PKG-VERIFY ?auto_99755 ?auto_99756 ?auto_99757 ?auto_99758 ?auto_99759 ?auto_99754 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99869 - OBJ
      ?auto_99870 - OBJ
      ?auto_99871 - OBJ
      ?auto_99872 - OBJ
      ?auto_99873 - OBJ
      ?auto_99868 - LOCATION
    )
    :vars
    (
      ?auto_99878 - LOCATION
      ?auto_99880 - CITY
      ?auto_99877 - LOCATION
      ?auto_99874 - LOCATION
      ?auto_99875 - LOCATION
      ?auto_99876 - LOCATION
      ?auto_99879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99878 ?auto_99880 ) ( IN-CITY ?auto_99868 ?auto_99880 ) ( not ( = ?auto_99868 ?auto_99878 ) ) ( OBJ-AT ?auto_99869 ?auto_99878 ) ( IN-CITY ?auto_99877 ?auto_99880 ) ( not ( = ?auto_99868 ?auto_99877 ) ) ( OBJ-AT ?auto_99872 ?auto_99877 ) ( IN-CITY ?auto_99874 ?auto_99880 ) ( not ( = ?auto_99868 ?auto_99874 ) ) ( OBJ-AT ?auto_99870 ?auto_99874 ) ( IN-CITY ?auto_99875 ?auto_99880 ) ( not ( = ?auto_99868 ?auto_99875 ) ) ( OBJ-AT ?auto_99873 ?auto_99875 ) ( IN-CITY ?auto_99876 ?auto_99880 ) ( not ( = ?auto_99868 ?auto_99876 ) ) ( OBJ-AT ?auto_99871 ?auto_99876 ) ( TRUCK-AT ?auto_99879 ?auto_99868 ) ( not ( = ?auto_99871 ?auto_99873 ) ) ( not ( = ?auto_99875 ?auto_99876 ) ) ( not ( = ?auto_99871 ?auto_99870 ) ) ( not ( = ?auto_99873 ?auto_99870 ) ) ( not ( = ?auto_99874 ?auto_99875 ) ) ( not ( = ?auto_99874 ?auto_99876 ) ) ( not ( = ?auto_99871 ?auto_99872 ) ) ( not ( = ?auto_99873 ?auto_99872 ) ) ( not ( = ?auto_99870 ?auto_99872 ) ) ( not ( = ?auto_99877 ?auto_99874 ) ) ( not ( = ?auto_99877 ?auto_99875 ) ) ( not ( = ?auto_99877 ?auto_99876 ) ) ( not ( = ?auto_99871 ?auto_99869 ) ) ( not ( = ?auto_99873 ?auto_99869 ) ) ( not ( = ?auto_99870 ?auto_99869 ) ) ( not ( = ?auto_99872 ?auto_99869 ) ) ( not ( = ?auto_99878 ?auto_99877 ) ) ( not ( = ?auto_99878 ?auto_99874 ) ) ( not ( = ?auto_99878 ?auto_99875 ) ) ( not ( = ?auto_99878 ?auto_99876 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99871 ?auto_99873 ?auto_99870 ?auto_99869 ?auto_99872 ?auto_99868 )
      ( DELIVER-5PKG-VERIFY ?auto_99869 ?auto_99870 ?auto_99871 ?auto_99872 ?auto_99873 ?auto_99868 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100039 - OBJ
      ?auto_100040 - OBJ
      ?auto_100041 - OBJ
      ?auto_100042 - OBJ
      ?auto_100043 - OBJ
      ?auto_100038 - LOCATION
    )
    :vars
    (
      ?auto_100048 - LOCATION
      ?auto_100050 - CITY
      ?auto_100047 - LOCATION
      ?auto_100044 - LOCATION
      ?auto_100045 - LOCATION
      ?auto_100046 - LOCATION
      ?auto_100049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100048 ?auto_100050 ) ( IN-CITY ?auto_100038 ?auto_100050 ) ( not ( = ?auto_100038 ?auto_100048 ) ) ( OBJ-AT ?auto_100039 ?auto_100048 ) ( IN-CITY ?auto_100047 ?auto_100050 ) ( not ( = ?auto_100038 ?auto_100047 ) ) ( OBJ-AT ?auto_100043 ?auto_100047 ) ( IN-CITY ?auto_100044 ?auto_100050 ) ( not ( = ?auto_100038 ?auto_100044 ) ) ( OBJ-AT ?auto_100040 ?auto_100044 ) ( IN-CITY ?auto_100045 ?auto_100050 ) ( not ( = ?auto_100038 ?auto_100045 ) ) ( OBJ-AT ?auto_100041 ?auto_100045 ) ( IN-CITY ?auto_100046 ?auto_100050 ) ( not ( = ?auto_100038 ?auto_100046 ) ) ( OBJ-AT ?auto_100042 ?auto_100046 ) ( TRUCK-AT ?auto_100049 ?auto_100038 ) ( not ( = ?auto_100042 ?auto_100041 ) ) ( not ( = ?auto_100045 ?auto_100046 ) ) ( not ( = ?auto_100042 ?auto_100040 ) ) ( not ( = ?auto_100041 ?auto_100040 ) ) ( not ( = ?auto_100044 ?auto_100045 ) ) ( not ( = ?auto_100044 ?auto_100046 ) ) ( not ( = ?auto_100042 ?auto_100043 ) ) ( not ( = ?auto_100041 ?auto_100043 ) ) ( not ( = ?auto_100040 ?auto_100043 ) ) ( not ( = ?auto_100047 ?auto_100044 ) ) ( not ( = ?auto_100047 ?auto_100045 ) ) ( not ( = ?auto_100047 ?auto_100046 ) ) ( not ( = ?auto_100042 ?auto_100039 ) ) ( not ( = ?auto_100041 ?auto_100039 ) ) ( not ( = ?auto_100040 ?auto_100039 ) ) ( not ( = ?auto_100043 ?auto_100039 ) ) ( not ( = ?auto_100048 ?auto_100047 ) ) ( not ( = ?auto_100048 ?auto_100044 ) ) ( not ( = ?auto_100048 ?auto_100045 ) ) ( not ( = ?auto_100048 ?auto_100046 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100042 ?auto_100041 ?auto_100040 ?auto_100039 ?auto_100043 ?auto_100038 )
      ( DELIVER-5PKG-VERIFY ?auto_100039 ?auto_100040 ?auto_100041 ?auto_100042 ?auto_100043 ?auto_100038 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100212 - OBJ
      ?auto_100213 - OBJ
      ?auto_100214 - OBJ
      ?auto_100215 - OBJ
      ?auto_100216 - OBJ
      ?auto_100211 - LOCATION
    )
    :vars
    (
      ?auto_100221 - LOCATION
      ?auto_100223 - CITY
      ?auto_100220 - LOCATION
      ?auto_100217 - LOCATION
      ?auto_100218 - LOCATION
      ?auto_100219 - LOCATION
      ?auto_100222 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100221 ?auto_100223 ) ( IN-CITY ?auto_100211 ?auto_100223 ) ( not ( = ?auto_100211 ?auto_100221 ) ) ( OBJ-AT ?auto_100212 ?auto_100221 ) ( IN-CITY ?auto_100220 ?auto_100223 ) ( not ( = ?auto_100211 ?auto_100220 ) ) ( OBJ-AT ?auto_100215 ?auto_100220 ) ( IN-CITY ?auto_100217 ?auto_100223 ) ( not ( = ?auto_100211 ?auto_100217 ) ) ( OBJ-AT ?auto_100213 ?auto_100217 ) ( IN-CITY ?auto_100218 ?auto_100223 ) ( not ( = ?auto_100211 ?auto_100218 ) ) ( OBJ-AT ?auto_100214 ?auto_100218 ) ( IN-CITY ?auto_100219 ?auto_100223 ) ( not ( = ?auto_100211 ?auto_100219 ) ) ( OBJ-AT ?auto_100216 ?auto_100219 ) ( TRUCK-AT ?auto_100222 ?auto_100211 ) ( not ( = ?auto_100216 ?auto_100214 ) ) ( not ( = ?auto_100218 ?auto_100219 ) ) ( not ( = ?auto_100216 ?auto_100213 ) ) ( not ( = ?auto_100214 ?auto_100213 ) ) ( not ( = ?auto_100217 ?auto_100218 ) ) ( not ( = ?auto_100217 ?auto_100219 ) ) ( not ( = ?auto_100216 ?auto_100215 ) ) ( not ( = ?auto_100214 ?auto_100215 ) ) ( not ( = ?auto_100213 ?auto_100215 ) ) ( not ( = ?auto_100220 ?auto_100217 ) ) ( not ( = ?auto_100220 ?auto_100218 ) ) ( not ( = ?auto_100220 ?auto_100219 ) ) ( not ( = ?auto_100216 ?auto_100212 ) ) ( not ( = ?auto_100214 ?auto_100212 ) ) ( not ( = ?auto_100213 ?auto_100212 ) ) ( not ( = ?auto_100215 ?auto_100212 ) ) ( not ( = ?auto_100221 ?auto_100220 ) ) ( not ( = ?auto_100221 ?auto_100217 ) ) ( not ( = ?auto_100221 ?auto_100218 ) ) ( not ( = ?auto_100221 ?auto_100219 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100216 ?auto_100214 ?auto_100213 ?auto_100212 ?auto_100215 ?auto_100211 )
      ( DELIVER-5PKG-VERIFY ?auto_100212 ?auto_100213 ?auto_100214 ?auto_100215 ?auto_100216 ?auto_100211 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100741 - OBJ
      ?auto_100742 - OBJ
      ?auto_100743 - OBJ
      ?auto_100744 - OBJ
      ?auto_100745 - OBJ
      ?auto_100740 - LOCATION
    )
    :vars
    (
      ?auto_100750 - LOCATION
      ?auto_100752 - CITY
      ?auto_100749 - LOCATION
      ?auto_100746 - LOCATION
      ?auto_100747 - LOCATION
      ?auto_100748 - LOCATION
      ?auto_100751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100750 ?auto_100752 ) ( IN-CITY ?auto_100740 ?auto_100752 ) ( not ( = ?auto_100740 ?auto_100750 ) ) ( OBJ-AT ?auto_100741 ?auto_100750 ) ( IN-CITY ?auto_100749 ?auto_100752 ) ( not ( = ?auto_100740 ?auto_100749 ) ) ( OBJ-AT ?auto_100743 ?auto_100749 ) ( IN-CITY ?auto_100746 ?auto_100752 ) ( not ( = ?auto_100740 ?auto_100746 ) ) ( OBJ-AT ?auto_100742 ?auto_100746 ) ( IN-CITY ?auto_100747 ?auto_100752 ) ( not ( = ?auto_100740 ?auto_100747 ) ) ( OBJ-AT ?auto_100745 ?auto_100747 ) ( IN-CITY ?auto_100748 ?auto_100752 ) ( not ( = ?auto_100740 ?auto_100748 ) ) ( OBJ-AT ?auto_100744 ?auto_100748 ) ( TRUCK-AT ?auto_100751 ?auto_100740 ) ( not ( = ?auto_100744 ?auto_100745 ) ) ( not ( = ?auto_100747 ?auto_100748 ) ) ( not ( = ?auto_100744 ?auto_100742 ) ) ( not ( = ?auto_100745 ?auto_100742 ) ) ( not ( = ?auto_100746 ?auto_100747 ) ) ( not ( = ?auto_100746 ?auto_100748 ) ) ( not ( = ?auto_100744 ?auto_100743 ) ) ( not ( = ?auto_100745 ?auto_100743 ) ) ( not ( = ?auto_100742 ?auto_100743 ) ) ( not ( = ?auto_100749 ?auto_100746 ) ) ( not ( = ?auto_100749 ?auto_100747 ) ) ( not ( = ?auto_100749 ?auto_100748 ) ) ( not ( = ?auto_100744 ?auto_100741 ) ) ( not ( = ?auto_100745 ?auto_100741 ) ) ( not ( = ?auto_100742 ?auto_100741 ) ) ( not ( = ?auto_100743 ?auto_100741 ) ) ( not ( = ?auto_100750 ?auto_100749 ) ) ( not ( = ?auto_100750 ?auto_100746 ) ) ( not ( = ?auto_100750 ?auto_100747 ) ) ( not ( = ?auto_100750 ?auto_100748 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100744 ?auto_100745 ?auto_100742 ?auto_100741 ?auto_100743 ?auto_100740 )
      ( DELIVER-5PKG-VERIFY ?auto_100741 ?auto_100742 ?auto_100743 ?auto_100744 ?auto_100745 ?auto_100740 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100796 - OBJ
      ?auto_100797 - OBJ
      ?auto_100798 - OBJ
      ?auto_100799 - OBJ
      ?auto_100800 - OBJ
      ?auto_100795 - LOCATION
    )
    :vars
    (
      ?auto_100805 - LOCATION
      ?auto_100807 - CITY
      ?auto_100804 - LOCATION
      ?auto_100801 - LOCATION
      ?auto_100802 - LOCATION
      ?auto_100803 - LOCATION
      ?auto_100806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100805 ?auto_100807 ) ( IN-CITY ?auto_100795 ?auto_100807 ) ( not ( = ?auto_100795 ?auto_100805 ) ) ( OBJ-AT ?auto_100796 ?auto_100805 ) ( IN-CITY ?auto_100804 ?auto_100807 ) ( not ( = ?auto_100795 ?auto_100804 ) ) ( OBJ-AT ?auto_100798 ?auto_100804 ) ( IN-CITY ?auto_100801 ?auto_100807 ) ( not ( = ?auto_100795 ?auto_100801 ) ) ( OBJ-AT ?auto_100797 ?auto_100801 ) ( IN-CITY ?auto_100802 ?auto_100807 ) ( not ( = ?auto_100795 ?auto_100802 ) ) ( OBJ-AT ?auto_100799 ?auto_100802 ) ( IN-CITY ?auto_100803 ?auto_100807 ) ( not ( = ?auto_100795 ?auto_100803 ) ) ( OBJ-AT ?auto_100800 ?auto_100803 ) ( TRUCK-AT ?auto_100806 ?auto_100795 ) ( not ( = ?auto_100800 ?auto_100799 ) ) ( not ( = ?auto_100802 ?auto_100803 ) ) ( not ( = ?auto_100800 ?auto_100797 ) ) ( not ( = ?auto_100799 ?auto_100797 ) ) ( not ( = ?auto_100801 ?auto_100802 ) ) ( not ( = ?auto_100801 ?auto_100803 ) ) ( not ( = ?auto_100800 ?auto_100798 ) ) ( not ( = ?auto_100799 ?auto_100798 ) ) ( not ( = ?auto_100797 ?auto_100798 ) ) ( not ( = ?auto_100804 ?auto_100801 ) ) ( not ( = ?auto_100804 ?auto_100802 ) ) ( not ( = ?auto_100804 ?auto_100803 ) ) ( not ( = ?auto_100800 ?auto_100796 ) ) ( not ( = ?auto_100799 ?auto_100796 ) ) ( not ( = ?auto_100797 ?auto_100796 ) ) ( not ( = ?auto_100798 ?auto_100796 ) ) ( not ( = ?auto_100805 ?auto_100804 ) ) ( not ( = ?auto_100805 ?auto_100801 ) ) ( not ( = ?auto_100805 ?auto_100802 ) ) ( not ( = ?auto_100805 ?auto_100803 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100800 ?auto_100799 ?auto_100797 ?auto_100796 ?auto_100798 ?auto_100795 )
      ( DELIVER-5PKG-VERIFY ?auto_100796 ?auto_100797 ?auto_100798 ?auto_100799 ?auto_100800 ?auto_100795 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101558 - OBJ
      ?auto_101559 - OBJ
      ?auto_101560 - OBJ
      ?auto_101561 - OBJ
      ?auto_101562 - OBJ
      ?auto_101557 - LOCATION
    )
    :vars
    (
      ?auto_101567 - LOCATION
      ?auto_101569 - CITY
      ?auto_101566 - LOCATION
      ?auto_101563 - LOCATION
      ?auto_101564 - LOCATION
      ?auto_101565 - LOCATION
      ?auto_101568 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101567 ?auto_101569 ) ( IN-CITY ?auto_101557 ?auto_101569 ) ( not ( = ?auto_101557 ?auto_101567 ) ) ( OBJ-AT ?auto_101558 ?auto_101567 ) ( IN-CITY ?auto_101566 ?auto_101569 ) ( not ( = ?auto_101557 ?auto_101566 ) ) ( OBJ-AT ?auto_101559 ?auto_101566 ) ( IN-CITY ?auto_101563 ?auto_101569 ) ( not ( = ?auto_101557 ?auto_101563 ) ) ( OBJ-AT ?auto_101562 ?auto_101563 ) ( IN-CITY ?auto_101564 ?auto_101569 ) ( not ( = ?auto_101557 ?auto_101564 ) ) ( OBJ-AT ?auto_101561 ?auto_101564 ) ( IN-CITY ?auto_101565 ?auto_101569 ) ( not ( = ?auto_101557 ?auto_101565 ) ) ( OBJ-AT ?auto_101560 ?auto_101565 ) ( TRUCK-AT ?auto_101568 ?auto_101557 ) ( not ( = ?auto_101560 ?auto_101561 ) ) ( not ( = ?auto_101564 ?auto_101565 ) ) ( not ( = ?auto_101560 ?auto_101562 ) ) ( not ( = ?auto_101561 ?auto_101562 ) ) ( not ( = ?auto_101563 ?auto_101564 ) ) ( not ( = ?auto_101563 ?auto_101565 ) ) ( not ( = ?auto_101560 ?auto_101559 ) ) ( not ( = ?auto_101561 ?auto_101559 ) ) ( not ( = ?auto_101562 ?auto_101559 ) ) ( not ( = ?auto_101566 ?auto_101563 ) ) ( not ( = ?auto_101566 ?auto_101564 ) ) ( not ( = ?auto_101566 ?auto_101565 ) ) ( not ( = ?auto_101560 ?auto_101558 ) ) ( not ( = ?auto_101561 ?auto_101558 ) ) ( not ( = ?auto_101562 ?auto_101558 ) ) ( not ( = ?auto_101559 ?auto_101558 ) ) ( not ( = ?auto_101567 ?auto_101566 ) ) ( not ( = ?auto_101567 ?auto_101563 ) ) ( not ( = ?auto_101567 ?auto_101564 ) ) ( not ( = ?auto_101567 ?auto_101565 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101560 ?auto_101561 ?auto_101562 ?auto_101558 ?auto_101559 ?auto_101557 )
      ( DELIVER-5PKG-VERIFY ?auto_101558 ?auto_101559 ?auto_101560 ?auto_101561 ?auto_101562 ?auto_101557 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101613 - OBJ
      ?auto_101614 - OBJ
      ?auto_101615 - OBJ
      ?auto_101616 - OBJ
      ?auto_101617 - OBJ
      ?auto_101612 - LOCATION
    )
    :vars
    (
      ?auto_101622 - LOCATION
      ?auto_101624 - CITY
      ?auto_101621 - LOCATION
      ?auto_101618 - LOCATION
      ?auto_101619 - LOCATION
      ?auto_101620 - LOCATION
      ?auto_101623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101622 ?auto_101624 ) ( IN-CITY ?auto_101612 ?auto_101624 ) ( not ( = ?auto_101612 ?auto_101622 ) ) ( OBJ-AT ?auto_101613 ?auto_101622 ) ( IN-CITY ?auto_101621 ?auto_101624 ) ( not ( = ?auto_101612 ?auto_101621 ) ) ( OBJ-AT ?auto_101614 ?auto_101621 ) ( IN-CITY ?auto_101618 ?auto_101624 ) ( not ( = ?auto_101612 ?auto_101618 ) ) ( OBJ-AT ?auto_101616 ?auto_101618 ) ( IN-CITY ?auto_101619 ?auto_101624 ) ( not ( = ?auto_101612 ?auto_101619 ) ) ( OBJ-AT ?auto_101617 ?auto_101619 ) ( IN-CITY ?auto_101620 ?auto_101624 ) ( not ( = ?auto_101612 ?auto_101620 ) ) ( OBJ-AT ?auto_101615 ?auto_101620 ) ( TRUCK-AT ?auto_101623 ?auto_101612 ) ( not ( = ?auto_101615 ?auto_101617 ) ) ( not ( = ?auto_101619 ?auto_101620 ) ) ( not ( = ?auto_101615 ?auto_101616 ) ) ( not ( = ?auto_101617 ?auto_101616 ) ) ( not ( = ?auto_101618 ?auto_101619 ) ) ( not ( = ?auto_101618 ?auto_101620 ) ) ( not ( = ?auto_101615 ?auto_101614 ) ) ( not ( = ?auto_101617 ?auto_101614 ) ) ( not ( = ?auto_101616 ?auto_101614 ) ) ( not ( = ?auto_101621 ?auto_101618 ) ) ( not ( = ?auto_101621 ?auto_101619 ) ) ( not ( = ?auto_101621 ?auto_101620 ) ) ( not ( = ?auto_101615 ?auto_101613 ) ) ( not ( = ?auto_101617 ?auto_101613 ) ) ( not ( = ?auto_101616 ?auto_101613 ) ) ( not ( = ?auto_101614 ?auto_101613 ) ) ( not ( = ?auto_101622 ?auto_101621 ) ) ( not ( = ?auto_101622 ?auto_101618 ) ) ( not ( = ?auto_101622 ?auto_101619 ) ) ( not ( = ?auto_101622 ?auto_101620 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101615 ?auto_101617 ?auto_101616 ?auto_101613 ?auto_101614 ?auto_101612 )
      ( DELIVER-5PKG-VERIFY ?auto_101613 ?auto_101614 ?auto_101615 ?auto_101616 ?auto_101617 ?auto_101612 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101842 - OBJ
      ?auto_101843 - OBJ
      ?auto_101844 - OBJ
      ?auto_101845 - OBJ
      ?auto_101846 - OBJ
      ?auto_101841 - LOCATION
    )
    :vars
    (
      ?auto_101851 - LOCATION
      ?auto_101853 - CITY
      ?auto_101850 - LOCATION
      ?auto_101847 - LOCATION
      ?auto_101848 - LOCATION
      ?auto_101849 - LOCATION
      ?auto_101852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101851 ?auto_101853 ) ( IN-CITY ?auto_101841 ?auto_101853 ) ( not ( = ?auto_101841 ?auto_101851 ) ) ( OBJ-AT ?auto_101842 ?auto_101851 ) ( IN-CITY ?auto_101850 ?auto_101853 ) ( not ( = ?auto_101841 ?auto_101850 ) ) ( OBJ-AT ?auto_101843 ?auto_101850 ) ( IN-CITY ?auto_101847 ?auto_101853 ) ( not ( = ?auto_101841 ?auto_101847 ) ) ( OBJ-AT ?auto_101846 ?auto_101847 ) ( IN-CITY ?auto_101848 ?auto_101853 ) ( not ( = ?auto_101841 ?auto_101848 ) ) ( OBJ-AT ?auto_101844 ?auto_101848 ) ( IN-CITY ?auto_101849 ?auto_101853 ) ( not ( = ?auto_101841 ?auto_101849 ) ) ( OBJ-AT ?auto_101845 ?auto_101849 ) ( TRUCK-AT ?auto_101852 ?auto_101841 ) ( not ( = ?auto_101845 ?auto_101844 ) ) ( not ( = ?auto_101848 ?auto_101849 ) ) ( not ( = ?auto_101845 ?auto_101846 ) ) ( not ( = ?auto_101844 ?auto_101846 ) ) ( not ( = ?auto_101847 ?auto_101848 ) ) ( not ( = ?auto_101847 ?auto_101849 ) ) ( not ( = ?auto_101845 ?auto_101843 ) ) ( not ( = ?auto_101844 ?auto_101843 ) ) ( not ( = ?auto_101846 ?auto_101843 ) ) ( not ( = ?auto_101850 ?auto_101847 ) ) ( not ( = ?auto_101850 ?auto_101848 ) ) ( not ( = ?auto_101850 ?auto_101849 ) ) ( not ( = ?auto_101845 ?auto_101842 ) ) ( not ( = ?auto_101844 ?auto_101842 ) ) ( not ( = ?auto_101846 ?auto_101842 ) ) ( not ( = ?auto_101843 ?auto_101842 ) ) ( not ( = ?auto_101851 ?auto_101850 ) ) ( not ( = ?auto_101851 ?auto_101847 ) ) ( not ( = ?auto_101851 ?auto_101848 ) ) ( not ( = ?auto_101851 ?auto_101849 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101845 ?auto_101844 ?auto_101846 ?auto_101842 ?auto_101843 ?auto_101841 )
      ( DELIVER-5PKG-VERIFY ?auto_101842 ?auto_101843 ?auto_101844 ?auto_101845 ?auto_101846 ?auto_101841 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101956 - OBJ
      ?auto_101957 - OBJ
      ?auto_101958 - OBJ
      ?auto_101959 - OBJ
      ?auto_101960 - OBJ
      ?auto_101955 - LOCATION
    )
    :vars
    (
      ?auto_101965 - LOCATION
      ?auto_101967 - CITY
      ?auto_101964 - LOCATION
      ?auto_101961 - LOCATION
      ?auto_101962 - LOCATION
      ?auto_101963 - LOCATION
      ?auto_101966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101965 ?auto_101967 ) ( IN-CITY ?auto_101955 ?auto_101967 ) ( not ( = ?auto_101955 ?auto_101965 ) ) ( OBJ-AT ?auto_101956 ?auto_101965 ) ( IN-CITY ?auto_101964 ?auto_101967 ) ( not ( = ?auto_101955 ?auto_101964 ) ) ( OBJ-AT ?auto_101957 ?auto_101964 ) ( IN-CITY ?auto_101961 ?auto_101967 ) ( not ( = ?auto_101955 ?auto_101961 ) ) ( OBJ-AT ?auto_101959 ?auto_101961 ) ( IN-CITY ?auto_101962 ?auto_101967 ) ( not ( = ?auto_101955 ?auto_101962 ) ) ( OBJ-AT ?auto_101958 ?auto_101962 ) ( IN-CITY ?auto_101963 ?auto_101967 ) ( not ( = ?auto_101955 ?auto_101963 ) ) ( OBJ-AT ?auto_101960 ?auto_101963 ) ( TRUCK-AT ?auto_101966 ?auto_101955 ) ( not ( = ?auto_101960 ?auto_101958 ) ) ( not ( = ?auto_101962 ?auto_101963 ) ) ( not ( = ?auto_101960 ?auto_101959 ) ) ( not ( = ?auto_101958 ?auto_101959 ) ) ( not ( = ?auto_101961 ?auto_101962 ) ) ( not ( = ?auto_101961 ?auto_101963 ) ) ( not ( = ?auto_101960 ?auto_101957 ) ) ( not ( = ?auto_101958 ?auto_101957 ) ) ( not ( = ?auto_101959 ?auto_101957 ) ) ( not ( = ?auto_101964 ?auto_101961 ) ) ( not ( = ?auto_101964 ?auto_101962 ) ) ( not ( = ?auto_101964 ?auto_101963 ) ) ( not ( = ?auto_101960 ?auto_101956 ) ) ( not ( = ?auto_101958 ?auto_101956 ) ) ( not ( = ?auto_101959 ?auto_101956 ) ) ( not ( = ?auto_101957 ?auto_101956 ) ) ( not ( = ?auto_101965 ?auto_101964 ) ) ( not ( = ?auto_101965 ?auto_101961 ) ) ( not ( = ?auto_101965 ?auto_101962 ) ) ( not ( = ?auto_101965 ?auto_101963 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101960 ?auto_101958 ?auto_101959 ?auto_101956 ?auto_101957 ?auto_101955 )
      ( DELIVER-5PKG-VERIFY ?auto_101956 ?auto_101957 ?auto_101958 ?auto_101959 ?auto_101960 ?auto_101955 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_102185 - OBJ
      ?auto_102186 - OBJ
      ?auto_102187 - OBJ
      ?auto_102188 - OBJ
      ?auto_102189 - OBJ
      ?auto_102184 - LOCATION
    )
    :vars
    (
      ?auto_102194 - LOCATION
      ?auto_102196 - CITY
      ?auto_102193 - LOCATION
      ?auto_102190 - LOCATION
      ?auto_102191 - LOCATION
      ?auto_102192 - LOCATION
      ?auto_102195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102194 ?auto_102196 ) ( IN-CITY ?auto_102184 ?auto_102196 ) ( not ( = ?auto_102184 ?auto_102194 ) ) ( OBJ-AT ?auto_102185 ?auto_102194 ) ( IN-CITY ?auto_102193 ?auto_102196 ) ( not ( = ?auto_102184 ?auto_102193 ) ) ( OBJ-AT ?auto_102186 ?auto_102193 ) ( IN-CITY ?auto_102190 ?auto_102196 ) ( not ( = ?auto_102184 ?auto_102190 ) ) ( OBJ-AT ?auto_102187 ?auto_102190 ) ( IN-CITY ?auto_102191 ?auto_102196 ) ( not ( = ?auto_102184 ?auto_102191 ) ) ( OBJ-AT ?auto_102189 ?auto_102191 ) ( IN-CITY ?auto_102192 ?auto_102196 ) ( not ( = ?auto_102184 ?auto_102192 ) ) ( OBJ-AT ?auto_102188 ?auto_102192 ) ( TRUCK-AT ?auto_102195 ?auto_102184 ) ( not ( = ?auto_102188 ?auto_102189 ) ) ( not ( = ?auto_102191 ?auto_102192 ) ) ( not ( = ?auto_102188 ?auto_102187 ) ) ( not ( = ?auto_102189 ?auto_102187 ) ) ( not ( = ?auto_102190 ?auto_102191 ) ) ( not ( = ?auto_102190 ?auto_102192 ) ) ( not ( = ?auto_102188 ?auto_102186 ) ) ( not ( = ?auto_102189 ?auto_102186 ) ) ( not ( = ?auto_102187 ?auto_102186 ) ) ( not ( = ?auto_102193 ?auto_102190 ) ) ( not ( = ?auto_102193 ?auto_102191 ) ) ( not ( = ?auto_102193 ?auto_102192 ) ) ( not ( = ?auto_102188 ?auto_102185 ) ) ( not ( = ?auto_102189 ?auto_102185 ) ) ( not ( = ?auto_102187 ?auto_102185 ) ) ( not ( = ?auto_102186 ?auto_102185 ) ) ( not ( = ?auto_102194 ?auto_102193 ) ) ( not ( = ?auto_102194 ?auto_102190 ) ) ( not ( = ?auto_102194 ?auto_102191 ) ) ( not ( = ?auto_102194 ?auto_102192 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_102188 ?auto_102189 ?auto_102187 ?auto_102185 ?auto_102186 ?auto_102184 )
      ( DELIVER-5PKG-VERIFY ?auto_102185 ?auto_102186 ?auto_102187 ?auto_102188 ?auto_102189 ?auto_102184 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_102240 - OBJ
      ?auto_102241 - OBJ
      ?auto_102242 - OBJ
      ?auto_102243 - OBJ
      ?auto_102244 - OBJ
      ?auto_102239 - LOCATION
    )
    :vars
    (
      ?auto_102249 - LOCATION
      ?auto_102251 - CITY
      ?auto_102248 - LOCATION
      ?auto_102245 - LOCATION
      ?auto_102246 - LOCATION
      ?auto_102247 - LOCATION
      ?auto_102250 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102249 ?auto_102251 ) ( IN-CITY ?auto_102239 ?auto_102251 ) ( not ( = ?auto_102239 ?auto_102249 ) ) ( OBJ-AT ?auto_102240 ?auto_102249 ) ( IN-CITY ?auto_102248 ?auto_102251 ) ( not ( = ?auto_102239 ?auto_102248 ) ) ( OBJ-AT ?auto_102241 ?auto_102248 ) ( IN-CITY ?auto_102245 ?auto_102251 ) ( not ( = ?auto_102239 ?auto_102245 ) ) ( OBJ-AT ?auto_102242 ?auto_102245 ) ( IN-CITY ?auto_102246 ?auto_102251 ) ( not ( = ?auto_102239 ?auto_102246 ) ) ( OBJ-AT ?auto_102243 ?auto_102246 ) ( IN-CITY ?auto_102247 ?auto_102251 ) ( not ( = ?auto_102239 ?auto_102247 ) ) ( OBJ-AT ?auto_102244 ?auto_102247 ) ( TRUCK-AT ?auto_102250 ?auto_102239 ) ( not ( = ?auto_102244 ?auto_102243 ) ) ( not ( = ?auto_102246 ?auto_102247 ) ) ( not ( = ?auto_102244 ?auto_102242 ) ) ( not ( = ?auto_102243 ?auto_102242 ) ) ( not ( = ?auto_102245 ?auto_102246 ) ) ( not ( = ?auto_102245 ?auto_102247 ) ) ( not ( = ?auto_102244 ?auto_102241 ) ) ( not ( = ?auto_102243 ?auto_102241 ) ) ( not ( = ?auto_102242 ?auto_102241 ) ) ( not ( = ?auto_102248 ?auto_102245 ) ) ( not ( = ?auto_102248 ?auto_102246 ) ) ( not ( = ?auto_102248 ?auto_102247 ) ) ( not ( = ?auto_102244 ?auto_102240 ) ) ( not ( = ?auto_102243 ?auto_102240 ) ) ( not ( = ?auto_102242 ?auto_102240 ) ) ( not ( = ?auto_102241 ?auto_102240 ) ) ( not ( = ?auto_102249 ?auto_102248 ) ) ( not ( = ?auto_102249 ?auto_102245 ) ) ( not ( = ?auto_102249 ?auto_102246 ) ) ( not ( = ?auto_102249 ?auto_102247 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_102244 ?auto_102243 ?auto_102242 ?auto_102240 ?auto_102241 ?auto_102239 )
      ( DELIVER-5PKG-VERIFY ?auto_102240 ?auto_102241 ?auto_102242 ?auto_102243 ?auto_102244 ?auto_102239 ) )
  )

)

