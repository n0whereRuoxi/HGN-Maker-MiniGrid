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
      ?auto_16804 - OBJ
      ?auto_16803 - LOCATION
    )
    :vars
    (
      ?auto_16806 - LOCATION
      ?auto_16807 - CITY
      ?auto_16805 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16806 ?auto_16807 ) ( IN-CITY ?auto_16803 ?auto_16807 ) ( not ( = ?auto_16803 ?auto_16806 ) ) ( OBJ-AT ?auto_16804 ?auto_16806 ) ( TRUCK-AT ?auto_16805 ?auto_16803 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16805 ?auto_16803 ?auto_16806 ?auto_16807 )
      ( !LOAD-TRUCK ?auto_16804 ?auto_16805 ?auto_16806 )
      ( !DRIVE-TRUCK ?auto_16805 ?auto_16806 ?auto_16803 ?auto_16807 )
      ( !UNLOAD-TRUCK ?auto_16804 ?auto_16805 ?auto_16803 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16811 - OBJ
      ?auto_16810 - LOCATION
    )
    :vars
    (
      ?auto_16813 - LOCATION
      ?auto_16814 - CITY
      ?auto_16812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16813 ?auto_16814 ) ( IN-CITY ?auto_16810 ?auto_16814 ) ( not ( = ?auto_16810 ?auto_16813 ) ) ( OBJ-AT ?auto_16811 ?auto_16813 ) ( TRUCK-AT ?auto_16812 ?auto_16810 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16812 ?auto_16810 ?auto_16813 ?auto_16814 )
      ( !LOAD-TRUCK ?auto_16811 ?auto_16812 ?auto_16813 )
      ( !DRIVE-TRUCK ?auto_16812 ?auto_16813 ?auto_16810 ?auto_16814 )
      ( !UNLOAD-TRUCK ?auto_16811 ?auto_16812 ?auto_16810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16825 - OBJ
      ?auto_16826 - OBJ
      ?auto_16824 - LOCATION
    )
    :vars
    (
      ?auto_16827 - LOCATION
      ?auto_16829 - CITY
      ?auto_16830 - LOCATION
      ?auto_16828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16827 ?auto_16829 ) ( IN-CITY ?auto_16824 ?auto_16829 ) ( not ( = ?auto_16824 ?auto_16827 ) ) ( OBJ-AT ?auto_16826 ?auto_16827 ) ( IN-CITY ?auto_16830 ?auto_16829 ) ( not ( = ?auto_16824 ?auto_16830 ) ) ( OBJ-AT ?auto_16825 ?auto_16830 ) ( TRUCK-AT ?auto_16828 ?auto_16824 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16825 ?auto_16824 )
      ( DELIVER-1PKG ?auto_16826 ?auto_16824 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16832 - OBJ
      ?auto_16833 - OBJ
      ?auto_16831 - LOCATION
    )
    :vars
    (
      ?auto_16835 - LOCATION
      ?auto_16836 - CITY
      ?auto_16834 - LOCATION
      ?auto_16837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16835 ?auto_16836 ) ( IN-CITY ?auto_16831 ?auto_16836 ) ( not ( = ?auto_16831 ?auto_16835 ) ) ( OBJ-AT ?auto_16832 ?auto_16835 ) ( IN-CITY ?auto_16834 ?auto_16836 ) ( not ( = ?auto_16831 ?auto_16834 ) ) ( OBJ-AT ?auto_16833 ?auto_16834 ) ( TRUCK-AT ?auto_16837 ?auto_16831 ) ( not ( = ?auto_16833 ?auto_16832 ) ) ( not ( = ?auto_16835 ?auto_16834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16833 ?auto_16832 ?auto_16831 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16849 - OBJ
      ?auto_16848 - LOCATION
    )
    :vars
    (
      ?auto_16851 - LOCATION
      ?auto_16852 - CITY
      ?auto_16850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16851 ?auto_16852 ) ( IN-CITY ?auto_16848 ?auto_16852 ) ( not ( = ?auto_16848 ?auto_16851 ) ) ( OBJ-AT ?auto_16849 ?auto_16851 ) ( TRUCK-AT ?auto_16850 ?auto_16848 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16850 ?auto_16848 ?auto_16851 ?auto_16852 )
      ( !LOAD-TRUCK ?auto_16849 ?auto_16850 ?auto_16851 )
      ( !DRIVE-TRUCK ?auto_16850 ?auto_16851 ?auto_16848 ?auto_16852 )
      ( !UNLOAD-TRUCK ?auto_16849 ?auto_16850 ?auto_16848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16940 - OBJ
      ?auto_16941 - OBJ
      ?auto_16942 - OBJ
      ?auto_16939 - LOCATION
    )
    :vars
    (
      ?auto_16945 - LOCATION
      ?auto_16944 - CITY
      ?auto_16946 - LOCATION
      ?auto_16947 - LOCATION
      ?auto_16943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16945 ?auto_16944 ) ( IN-CITY ?auto_16939 ?auto_16944 ) ( not ( = ?auto_16939 ?auto_16945 ) ) ( OBJ-AT ?auto_16942 ?auto_16945 ) ( IN-CITY ?auto_16946 ?auto_16944 ) ( not ( = ?auto_16939 ?auto_16946 ) ) ( OBJ-AT ?auto_16941 ?auto_16946 ) ( IN-CITY ?auto_16947 ?auto_16944 ) ( not ( = ?auto_16939 ?auto_16947 ) ) ( OBJ-AT ?auto_16940 ?auto_16947 ) ( TRUCK-AT ?auto_16943 ?auto_16939 ) ( not ( = ?auto_16940 ?auto_16941 ) ) ( not ( = ?auto_16946 ?auto_16947 ) ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16941 ?auto_16942 ) ) ( not ( = ?auto_16945 ?auto_16946 ) ) ( not ( = ?auto_16945 ?auto_16947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16941 ?auto_16940 ?auto_16939 )
      ( DELIVER-1PKG ?auto_16942 ?auto_16939 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16959 - OBJ
      ?auto_16960 - OBJ
      ?auto_16961 - OBJ
      ?auto_16958 - LOCATION
    )
    :vars
    (
      ?auto_16962 - LOCATION
      ?auto_16963 - CITY
      ?auto_16964 - LOCATION
      ?auto_16966 - LOCATION
      ?auto_16965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16962 ?auto_16963 ) ( IN-CITY ?auto_16958 ?auto_16963 ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( OBJ-AT ?auto_16960 ?auto_16962 ) ( IN-CITY ?auto_16964 ?auto_16963 ) ( not ( = ?auto_16958 ?auto_16964 ) ) ( OBJ-AT ?auto_16961 ?auto_16964 ) ( IN-CITY ?auto_16966 ?auto_16963 ) ( not ( = ?auto_16958 ?auto_16966 ) ) ( OBJ-AT ?auto_16959 ?auto_16966 ) ( TRUCK-AT ?auto_16965 ?auto_16958 ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16961 ?auto_16960 ) ) ( not ( = ?auto_16962 ?auto_16964 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_16959 ?auto_16961 ?auto_16960 ?auto_16958 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16978 - OBJ
      ?auto_16979 - OBJ
      ?auto_16980 - OBJ
      ?auto_16977 - LOCATION
    )
    :vars
    (
      ?auto_16985 - LOCATION
      ?auto_16984 - CITY
      ?auto_16983 - LOCATION
      ?auto_16982 - LOCATION
      ?auto_16981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16985 ?auto_16984 ) ( IN-CITY ?auto_16977 ?auto_16984 ) ( not ( = ?auto_16977 ?auto_16985 ) ) ( OBJ-AT ?auto_16980 ?auto_16985 ) ( IN-CITY ?auto_16983 ?auto_16984 ) ( not ( = ?auto_16977 ?auto_16983 ) ) ( OBJ-AT ?auto_16978 ?auto_16983 ) ( IN-CITY ?auto_16982 ?auto_16984 ) ( not ( = ?auto_16977 ?auto_16982 ) ) ( OBJ-AT ?auto_16979 ?auto_16982 ) ( TRUCK-AT ?auto_16981 ?auto_16977 ) ( not ( = ?auto_16979 ?auto_16978 ) ) ( not ( = ?auto_16983 ?auto_16982 ) ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( not ( = ?auto_16978 ?auto_16980 ) ) ( not ( = ?auto_16985 ?auto_16983 ) ) ( not ( = ?auto_16985 ?auto_16982 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_16979 ?auto_16980 ?auto_16978 ?auto_16977 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16997 - OBJ
      ?auto_16998 - OBJ
      ?auto_16999 - OBJ
      ?auto_16996 - LOCATION
    )
    :vars
    (
      ?auto_17004 - LOCATION
      ?auto_17003 - CITY
      ?auto_17002 - LOCATION
      ?auto_17001 - LOCATION
      ?auto_17000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17004 ?auto_17003 ) ( IN-CITY ?auto_16996 ?auto_17003 ) ( not ( = ?auto_16996 ?auto_17004 ) ) ( OBJ-AT ?auto_16998 ?auto_17004 ) ( IN-CITY ?auto_17002 ?auto_17003 ) ( not ( = ?auto_16996 ?auto_17002 ) ) ( OBJ-AT ?auto_16997 ?auto_17002 ) ( IN-CITY ?auto_17001 ?auto_17003 ) ( not ( = ?auto_16996 ?auto_17001 ) ) ( OBJ-AT ?auto_16999 ?auto_17001 ) ( TRUCK-AT ?auto_17000 ?auto_16996 ) ( not ( = ?auto_16999 ?auto_16997 ) ) ( not ( = ?auto_17002 ?auto_17001 ) ) ( not ( = ?auto_16999 ?auto_16998 ) ) ( not ( = ?auto_16997 ?auto_16998 ) ) ( not ( = ?auto_17004 ?auto_17002 ) ) ( not ( = ?auto_17004 ?auto_17001 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_16999 ?auto_16998 ?auto_16997 ?auto_16996 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17036 - OBJ
      ?auto_17037 - OBJ
      ?auto_17038 - OBJ
      ?auto_17035 - LOCATION
    )
    :vars
    (
      ?auto_17043 - LOCATION
      ?auto_17042 - CITY
      ?auto_17041 - LOCATION
      ?auto_17040 - LOCATION
      ?auto_17039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17043 ?auto_17042 ) ( IN-CITY ?auto_17035 ?auto_17042 ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( OBJ-AT ?auto_17036 ?auto_17043 ) ( IN-CITY ?auto_17041 ?auto_17042 ) ( not ( = ?auto_17035 ?auto_17041 ) ) ( OBJ-AT ?auto_17038 ?auto_17041 ) ( IN-CITY ?auto_17040 ?auto_17042 ) ( not ( = ?auto_17035 ?auto_17040 ) ) ( OBJ-AT ?auto_17037 ?auto_17040 ) ( TRUCK-AT ?auto_17039 ?auto_17035 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17041 ?auto_17040 ) ) ( not ( = ?auto_17037 ?auto_17036 ) ) ( not ( = ?auto_17038 ?auto_17036 ) ) ( not ( = ?auto_17043 ?auto_17041 ) ) ( not ( = ?auto_17043 ?auto_17040 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17037 ?auto_17036 ?auto_17038 ?auto_17035 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17055 - OBJ
      ?auto_17056 - OBJ
      ?auto_17057 - OBJ
      ?auto_17054 - LOCATION
    )
    :vars
    (
      ?auto_17062 - LOCATION
      ?auto_17061 - CITY
      ?auto_17060 - LOCATION
      ?auto_17059 - LOCATION
      ?auto_17058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17062 ?auto_17061 ) ( IN-CITY ?auto_17054 ?auto_17061 ) ( not ( = ?auto_17054 ?auto_17062 ) ) ( OBJ-AT ?auto_17055 ?auto_17062 ) ( IN-CITY ?auto_17060 ?auto_17061 ) ( not ( = ?auto_17054 ?auto_17060 ) ) ( OBJ-AT ?auto_17056 ?auto_17060 ) ( IN-CITY ?auto_17059 ?auto_17061 ) ( not ( = ?auto_17054 ?auto_17059 ) ) ( OBJ-AT ?auto_17057 ?auto_17059 ) ( TRUCK-AT ?auto_17058 ?auto_17054 ) ( not ( = ?auto_17057 ?auto_17056 ) ) ( not ( = ?auto_17060 ?auto_17059 ) ) ( not ( = ?auto_17057 ?auto_17055 ) ) ( not ( = ?auto_17056 ?auto_17055 ) ) ( not ( = ?auto_17062 ?auto_17060 ) ) ( not ( = ?auto_17062 ?auto_17059 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_17057 ?auto_17055 ?auto_17056 ?auto_17054 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_17117 - OBJ
      ?auto_17116 - LOCATION
    )
    :vars
    (
      ?auto_17119 - LOCATION
      ?auto_17120 - CITY
      ?auto_17118 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_17119 ?auto_17120 ) ( IN-CITY ?auto_17116 ?auto_17120 ) ( not ( = ?auto_17116 ?auto_17119 ) ) ( OBJ-AT ?auto_17117 ?auto_17119 ) ( TRUCK-AT ?auto_17118 ?auto_17116 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_17118 ?auto_17116 ?auto_17119 ?auto_17120 )
      ( !LOAD-TRUCK ?auto_17117 ?auto_17118 ?auto_17119 )
      ( !DRIVE-TRUCK ?auto_17118 ?auto_17119 ?auto_17116 ?auto_17120 )
      ( !UNLOAD-TRUCK ?auto_17117 ?auto_17118 ?auto_17116 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18099 - OBJ
      ?auto_18100 - OBJ
      ?auto_18101 - OBJ
      ?auto_18102 - OBJ
      ?auto_18098 - LOCATION
    )
    :vars
    (
      ?auto_18104 - LOCATION
      ?auto_18103 - CITY
      ?auto_18107 - LOCATION
      ?auto_18106 - LOCATION
      ?auto_18105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18104 ?auto_18103 ) ( IN-CITY ?auto_18098 ?auto_18103 ) ( not ( = ?auto_18098 ?auto_18104 ) ) ( OBJ-AT ?auto_18102 ?auto_18104 ) ( OBJ-AT ?auto_18101 ?auto_18104 ) ( IN-CITY ?auto_18107 ?auto_18103 ) ( not ( = ?auto_18098 ?auto_18107 ) ) ( OBJ-AT ?auto_18100 ?auto_18107 ) ( IN-CITY ?auto_18106 ?auto_18103 ) ( not ( = ?auto_18098 ?auto_18106 ) ) ( OBJ-AT ?auto_18099 ?auto_18106 ) ( TRUCK-AT ?auto_18105 ?auto_18098 ) ( not ( = ?auto_18099 ?auto_18100 ) ) ( not ( = ?auto_18107 ?auto_18106 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( not ( = ?auto_18104 ?auto_18107 ) ) ( not ( = ?auto_18104 ?auto_18106 ) ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( not ( = ?auto_18100 ?auto_18102 ) ) ( not ( = ?auto_18101 ?auto_18102 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_18099 ?auto_18101 ?auto_18100 ?auto_18098 )
      ( DELIVER-1PKG ?auto_18102 ?auto_18098 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18131 - OBJ
      ?auto_18132 - OBJ
      ?auto_18133 - OBJ
      ?auto_18134 - OBJ
      ?auto_18130 - LOCATION
    )
    :vars
    (
      ?auto_18138 - LOCATION
      ?auto_18136 - CITY
      ?auto_18135 - LOCATION
      ?auto_18139 - LOCATION
      ?auto_18137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18138 ?auto_18136 ) ( IN-CITY ?auto_18130 ?auto_18136 ) ( not ( = ?auto_18130 ?auto_18138 ) ) ( OBJ-AT ?auto_18133 ?auto_18138 ) ( OBJ-AT ?auto_18134 ?auto_18138 ) ( IN-CITY ?auto_18135 ?auto_18136 ) ( not ( = ?auto_18130 ?auto_18135 ) ) ( OBJ-AT ?auto_18132 ?auto_18135 ) ( IN-CITY ?auto_18139 ?auto_18136 ) ( not ( = ?auto_18130 ?auto_18139 ) ) ( OBJ-AT ?auto_18131 ?auto_18139 ) ( TRUCK-AT ?auto_18137 ?auto_18130 ) ( not ( = ?auto_18131 ?auto_18132 ) ) ( not ( = ?auto_18135 ?auto_18139 ) ) ( not ( = ?auto_18131 ?auto_18134 ) ) ( not ( = ?auto_18132 ?auto_18134 ) ) ( not ( = ?auto_18138 ?auto_18135 ) ) ( not ( = ?auto_18138 ?auto_18139 ) ) ( not ( = ?auto_18131 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18134 ?auto_18133 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18131 ?auto_18132 ?auto_18134 ?auto_18133 ?auto_18130 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18163 - OBJ
      ?auto_18164 - OBJ
      ?auto_18165 - OBJ
      ?auto_18166 - OBJ
      ?auto_18162 - LOCATION
    )
    :vars
    (
      ?auto_18167 - LOCATION
      ?auto_18171 - CITY
      ?auto_18170 - LOCATION
      ?auto_18169 - LOCATION
      ?auto_18168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18167 ?auto_18171 ) ( IN-CITY ?auto_18162 ?auto_18171 ) ( not ( = ?auto_18162 ?auto_18167 ) ) ( OBJ-AT ?auto_18166 ?auto_18167 ) ( OBJ-AT ?auto_18164 ?auto_18167 ) ( IN-CITY ?auto_18170 ?auto_18171 ) ( not ( = ?auto_18162 ?auto_18170 ) ) ( OBJ-AT ?auto_18165 ?auto_18170 ) ( IN-CITY ?auto_18169 ?auto_18171 ) ( not ( = ?auto_18162 ?auto_18169 ) ) ( OBJ-AT ?auto_18163 ?auto_18169 ) ( TRUCK-AT ?auto_18168 ?auto_18162 ) ( not ( = ?auto_18163 ?auto_18165 ) ) ( not ( = ?auto_18170 ?auto_18169 ) ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( not ( = ?auto_18165 ?auto_18164 ) ) ( not ( = ?auto_18167 ?auto_18170 ) ) ( not ( = ?auto_18167 ?auto_18169 ) ) ( not ( = ?auto_18163 ?auto_18166 ) ) ( not ( = ?auto_18165 ?auto_18166 ) ) ( not ( = ?auto_18164 ?auto_18166 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18163 ?auto_18165 ?auto_18166 ?auto_18164 ?auto_18162 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18195 - OBJ
      ?auto_18196 - OBJ
      ?auto_18197 - OBJ
      ?auto_18198 - OBJ
      ?auto_18194 - LOCATION
    )
    :vars
    (
      ?auto_18199 - LOCATION
      ?auto_18203 - CITY
      ?auto_18202 - LOCATION
      ?auto_18201 - LOCATION
      ?auto_18200 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18199 ?auto_18203 ) ( IN-CITY ?auto_18194 ?auto_18203 ) ( not ( = ?auto_18194 ?auto_18199 ) ) ( OBJ-AT ?auto_18197 ?auto_18199 ) ( OBJ-AT ?auto_18196 ?auto_18199 ) ( IN-CITY ?auto_18202 ?auto_18203 ) ( not ( = ?auto_18194 ?auto_18202 ) ) ( OBJ-AT ?auto_18198 ?auto_18202 ) ( IN-CITY ?auto_18201 ?auto_18203 ) ( not ( = ?auto_18194 ?auto_18201 ) ) ( OBJ-AT ?auto_18195 ?auto_18201 ) ( TRUCK-AT ?auto_18200 ?auto_18194 ) ( not ( = ?auto_18195 ?auto_18198 ) ) ( not ( = ?auto_18202 ?auto_18201 ) ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( not ( = ?auto_18198 ?auto_18196 ) ) ( not ( = ?auto_18199 ?auto_18202 ) ) ( not ( = ?auto_18199 ?auto_18201 ) ) ( not ( = ?auto_18195 ?auto_18197 ) ) ( not ( = ?auto_18198 ?auto_18197 ) ) ( not ( = ?auto_18196 ?auto_18197 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18195 ?auto_18198 ?auto_18197 ?auto_18196 ?auto_18194 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18295 - OBJ
      ?auto_18296 - OBJ
      ?auto_18297 - OBJ
      ?auto_18298 - OBJ
      ?auto_18294 - LOCATION
    )
    :vars
    (
      ?auto_18299 - LOCATION
      ?auto_18303 - CITY
      ?auto_18302 - LOCATION
      ?auto_18301 - LOCATION
      ?auto_18300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18299 ?auto_18303 ) ( IN-CITY ?auto_18294 ?auto_18303 ) ( not ( = ?auto_18294 ?auto_18299 ) ) ( OBJ-AT ?auto_18296 ?auto_18299 ) ( OBJ-AT ?auto_18298 ?auto_18299 ) ( IN-CITY ?auto_18302 ?auto_18303 ) ( not ( = ?auto_18294 ?auto_18302 ) ) ( OBJ-AT ?auto_18297 ?auto_18302 ) ( IN-CITY ?auto_18301 ?auto_18303 ) ( not ( = ?auto_18294 ?auto_18301 ) ) ( OBJ-AT ?auto_18295 ?auto_18301 ) ( TRUCK-AT ?auto_18300 ?auto_18294 ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( not ( = ?auto_18302 ?auto_18301 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( not ( = ?auto_18299 ?auto_18302 ) ) ( not ( = ?auto_18299 ?auto_18301 ) ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18297 ?auto_18296 ) ) ( not ( = ?auto_18298 ?auto_18296 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18295 ?auto_18297 ?auto_18296 ?auto_18298 ?auto_18294 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18327 - OBJ
      ?auto_18328 - OBJ
      ?auto_18329 - OBJ
      ?auto_18330 - OBJ
      ?auto_18326 - LOCATION
    )
    :vars
    (
      ?auto_18331 - LOCATION
      ?auto_18335 - CITY
      ?auto_18334 - LOCATION
      ?auto_18333 - LOCATION
      ?auto_18332 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18331 ?auto_18335 ) ( IN-CITY ?auto_18326 ?auto_18335 ) ( not ( = ?auto_18326 ?auto_18331 ) ) ( OBJ-AT ?auto_18328 ?auto_18331 ) ( OBJ-AT ?auto_18329 ?auto_18331 ) ( IN-CITY ?auto_18334 ?auto_18335 ) ( not ( = ?auto_18326 ?auto_18334 ) ) ( OBJ-AT ?auto_18330 ?auto_18334 ) ( IN-CITY ?auto_18333 ?auto_18335 ) ( not ( = ?auto_18326 ?auto_18333 ) ) ( OBJ-AT ?auto_18327 ?auto_18333 ) ( TRUCK-AT ?auto_18332 ?auto_18326 ) ( not ( = ?auto_18327 ?auto_18330 ) ) ( not ( = ?auto_18334 ?auto_18333 ) ) ( not ( = ?auto_18327 ?auto_18329 ) ) ( not ( = ?auto_18330 ?auto_18329 ) ) ( not ( = ?auto_18331 ?auto_18334 ) ) ( not ( = ?auto_18331 ?auto_18333 ) ) ( not ( = ?auto_18327 ?auto_18328 ) ) ( not ( = ?auto_18330 ?auto_18328 ) ) ( not ( = ?auto_18329 ?auto_18328 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18327 ?auto_18330 ?auto_18328 ?auto_18329 ?auto_18326 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18427 - OBJ
      ?auto_18428 - OBJ
      ?auto_18429 - OBJ
      ?auto_18430 - OBJ
      ?auto_18426 - LOCATION
    )
    :vars
    (
      ?auto_18431 - LOCATION
      ?auto_18435 - CITY
      ?auto_18434 - LOCATION
      ?auto_18433 - LOCATION
      ?auto_18432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18431 ?auto_18435 ) ( IN-CITY ?auto_18426 ?auto_18435 ) ( not ( = ?auto_18426 ?auto_18431 ) ) ( OBJ-AT ?auto_18430 ?auto_18431 ) ( OBJ-AT ?auto_18429 ?auto_18431 ) ( IN-CITY ?auto_18434 ?auto_18435 ) ( not ( = ?auto_18426 ?auto_18434 ) ) ( OBJ-AT ?auto_18427 ?auto_18434 ) ( IN-CITY ?auto_18433 ?auto_18435 ) ( not ( = ?auto_18426 ?auto_18433 ) ) ( OBJ-AT ?auto_18428 ?auto_18433 ) ( TRUCK-AT ?auto_18432 ?auto_18426 ) ( not ( = ?auto_18428 ?auto_18427 ) ) ( not ( = ?auto_18434 ?auto_18433 ) ) ( not ( = ?auto_18428 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( not ( = ?auto_18431 ?auto_18434 ) ) ( not ( = ?auto_18431 ?auto_18433 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18427 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18428 ?auto_18427 ?auto_18430 ?auto_18429 ?auto_18426 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18459 - OBJ
      ?auto_18460 - OBJ
      ?auto_18461 - OBJ
      ?auto_18462 - OBJ
      ?auto_18458 - LOCATION
    )
    :vars
    (
      ?auto_18463 - LOCATION
      ?auto_18467 - CITY
      ?auto_18466 - LOCATION
      ?auto_18465 - LOCATION
      ?auto_18464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18463 ?auto_18467 ) ( IN-CITY ?auto_18458 ?auto_18467 ) ( not ( = ?auto_18458 ?auto_18463 ) ) ( OBJ-AT ?auto_18461 ?auto_18463 ) ( OBJ-AT ?auto_18462 ?auto_18463 ) ( IN-CITY ?auto_18466 ?auto_18467 ) ( not ( = ?auto_18458 ?auto_18466 ) ) ( OBJ-AT ?auto_18459 ?auto_18466 ) ( IN-CITY ?auto_18465 ?auto_18467 ) ( not ( = ?auto_18458 ?auto_18465 ) ) ( OBJ-AT ?auto_18460 ?auto_18465 ) ( TRUCK-AT ?auto_18464 ?auto_18458 ) ( not ( = ?auto_18460 ?auto_18459 ) ) ( not ( = ?auto_18466 ?auto_18465 ) ) ( not ( = ?auto_18460 ?auto_18462 ) ) ( not ( = ?auto_18459 ?auto_18462 ) ) ( not ( = ?auto_18463 ?auto_18466 ) ) ( not ( = ?auto_18463 ?auto_18465 ) ) ( not ( = ?auto_18460 ?auto_18461 ) ) ( not ( = ?auto_18459 ?auto_18461 ) ) ( not ( = ?auto_18462 ?auto_18461 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18460 ?auto_18459 ?auto_18461 ?auto_18462 ?auto_18458 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18560 - OBJ
      ?auto_18561 - OBJ
      ?auto_18562 - OBJ
      ?auto_18563 - OBJ
      ?auto_18559 - LOCATION
    )
    :vars
    (
      ?auto_18564 - LOCATION
      ?auto_18568 - CITY
      ?auto_18567 - LOCATION
      ?auto_18566 - LOCATION
      ?auto_18565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18564 ?auto_18568 ) ( IN-CITY ?auto_18559 ?auto_18568 ) ( not ( = ?auto_18559 ?auto_18564 ) ) ( OBJ-AT ?auto_18563 ?auto_18564 ) ( OBJ-AT ?auto_18561 ?auto_18564 ) ( IN-CITY ?auto_18567 ?auto_18568 ) ( not ( = ?auto_18559 ?auto_18567 ) ) ( OBJ-AT ?auto_18560 ?auto_18567 ) ( IN-CITY ?auto_18566 ?auto_18568 ) ( not ( = ?auto_18559 ?auto_18566 ) ) ( OBJ-AT ?auto_18562 ?auto_18566 ) ( TRUCK-AT ?auto_18565 ?auto_18559 ) ( not ( = ?auto_18562 ?auto_18560 ) ) ( not ( = ?auto_18567 ?auto_18566 ) ) ( not ( = ?auto_18562 ?auto_18561 ) ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18562 ?auto_18563 ) ) ( not ( = ?auto_18560 ?auto_18563 ) ) ( not ( = ?auto_18561 ?auto_18563 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18562 ?auto_18560 ?auto_18563 ?auto_18561 ?auto_18559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18592 - OBJ
      ?auto_18593 - OBJ
      ?auto_18594 - OBJ
      ?auto_18595 - OBJ
      ?auto_18591 - LOCATION
    )
    :vars
    (
      ?auto_18596 - LOCATION
      ?auto_18600 - CITY
      ?auto_18599 - LOCATION
      ?auto_18598 - LOCATION
      ?auto_18597 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18596 ?auto_18600 ) ( IN-CITY ?auto_18591 ?auto_18600 ) ( not ( = ?auto_18591 ?auto_18596 ) ) ( OBJ-AT ?auto_18594 ?auto_18596 ) ( OBJ-AT ?auto_18593 ?auto_18596 ) ( IN-CITY ?auto_18599 ?auto_18600 ) ( not ( = ?auto_18591 ?auto_18599 ) ) ( OBJ-AT ?auto_18592 ?auto_18599 ) ( IN-CITY ?auto_18598 ?auto_18600 ) ( not ( = ?auto_18591 ?auto_18598 ) ) ( OBJ-AT ?auto_18595 ?auto_18598 ) ( TRUCK-AT ?auto_18597 ?auto_18591 ) ( not ( = ?auto_18595 ?auto_18592 ) ) ( not ( = ?auto_18599 ?auto_18598 ) ) ( not ( = ?auto_18595 ?auto_18593 ) ) ( not ( = ?auto_18592 ?auto_18593 ) ) ( not ( = ?auto_18596 ?auto_18599 ) ) ( not ( = ?auto_18596 ?auto_18598 ) ) ( not ( = ?auto_18595 ?auto_18594 ) ) ( not ( = ?auto_18592 ?auto_18594 ) ) ( not ( = ?auto_18593 ?auto_18594 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18595 ?auto_18592 ?auto_18594 ?auto_18593 ?auto_18591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18657 - OBJ
      ?auto_18658 - OBJ
      ?auto_18659 - OBJ
      ?auto_18660 - OBJ
      ?auto_18656 - LOCATION
    )
    :vars
    (
      ?auto_18661 - LOCATION
      ?auto_18665 - CITY
      ?auto_18664 - LOCATION
      ?auto_18663 - LOCATION
      ?auto_18662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18661 ?auto_18665 ) ( IN-CITY ?auto_18656 ?auto_18665 ) ( not ( = ?auto_18656 ?auto_18661 ) ) ( OBJ-AT ?auto_18658 ?auto_18661 ) ( OBJ-AT ?auto_18660 ?auto_18661 ) ( IN-CITY ?auto_18664 ?auto_18665 ) ( not ( = ?auto_18656 ?auto_18664 ) ) ( OBJ-AT ?auto_18657 ?auto_18664 ) ( IN-CITY ?auto_18663 ?auto_18665 ) ( not ( = ?auto_18656 ?auto_18663 ) ) ( OBJ-AT ?auto_18659 ?auto_18663 ) ( TRUCK-AT ?auto_18662 ?auto_18656 ) ( not ( = ?auto_18659 ?auto_18657 ) ) ( not ( = ?auto_18664 ?auto_18663 ) ) ( not ( = ?auto_18659 ?auto_18660 ) ) ( not ( = ?auto_18657 ?auto_18660 ) ) ( not ( = ?auto_18661 ?auto_18664 ) ) ( not ( = ?auto_18661 ?auto_18663 ) ) ( not ( = ?auto_18659 ?auto_18658 ) ) ( not ( = ?auto_18657 ?auto_18658 ) ) ( not ( = ?auto_18660 ?auto_18658 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18659 ?auto_18657 ?auto_18658 ?auto_18660 ?auto_18656 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18724 - OBJ
      ?auto_18725 - OBJ
      ?auto_18726 - OBJ
      ?auto_18727 - OBJ
      ?auto_18723 - LOCATION
    )
    :vars
    (
      ?auto_18728 - LOCATION
      ?auto_18732 - CITY
      ?auto_18731 - LOCATION
      ?auto_18730 - LOCATION
      ?auto_18729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18728 ?auto_18732 ) ( IN-CITY ?auto_18723 ?auto_18732 ) ( not ( = ?auto_18723 ?auto_18728 ) ) ( OBJ-AT ?auto_18725 ?auto_18728 ) ( OBJ-AT ?auto_18726 ?auto_18728 ) ( IN-CITY ?auto_18731 ?auto_18732 ) ( not ( = ?auto_18723 ?auto_18731 ) ) ( OBJ-AT ?auto_18724 ?auto_18731 ) ( IN-CITY ?auto_18730 ?auto_18732 ) ( not ( = ?auto_18723 ?auto_18730 ) ) ( OBJ-AT ?auto_18727 ?auto_18730 ) ( TRUCK-AT ?auto_18729 ?auto_18723 ) ( not ( = ?auto_18727 ?auto_18724 ) ) ( not ( = ?auto_18731 ?auto_18730 ) ) ( not ( = ?auto_18727 ?auto_18726 ) ) ( not ( = ?auto_18724 ?auto_18726 ) ) ( not ( = ?auto_18728 ?auto_18731 ) ) ( not ( = ?auto_18728 ?auto_18730 ) ) ( not ( = ?auto_18727 ?auto_18725 ) ) ( not ( = ?auto_18724 ?auto_18725 ) ) ( not ( = ?auto_18726 ?auto_18725 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18727 ?auto_18724 ?auto_18725 ?auto_18726 ?auto_18723 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18824 - OBJ
      ?auto_18825 - OBJ
      ?auto_18826 - OBJ
      ?auto_18827 - OBJ
      ?auto_18823 - LOCATION
    )
    :vars
    (
      ?auto_18828 - LOCATION
      ?auto_18832 - CITY
      ?auto_18831 - LOCATION
      ?auto_18830 - LOCATION
      ?auto_18829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18828 ?auto_18832 ) ( IN-CITY ?auto_18823 ?auto_18832 ) ( not ( = ?auto_18823 ?auto_18828 ) ) ( OBJ-AT ?auto_18827 ?auto_18828 ) ( OBJ-AT ?auto_18824 ?auto_18828 ) ( IN-CITY ?auto_18831 ?auto_18832 ) ( not ( = ?auto_18823 ?auto_18831 ) ) ( OBJ-AT ?auto_18826 ?auto_18831 ) ( IN-CITY ?auto_18830 ?auto_18832 ) ( not ( = ?auto_18823 ?auto_18830 ) ) ( OBJ-AT ?auto_18825 ?auto_18830 ) ( TRUCK-AT ?auto_18829 ?auto_18823 ) ( not ( = ?auto_18825 ?auto_18826 ) ) ( not ( = ?auto_18831 ?auto_18830 ) ) ( not ( = ?auto_18825 ?auto_18824 ) ) ( not ( = ?auto_18826 ?auto_18824 ) ) ( not ( = ?auto_18828 ?auto_18831 ) ) ( not ( = ?auto_18828 ?auto_18830 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( not ( = ?auto_18824 ?auto_18827 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18825 ?auto_18826 ?auto_18827 ?auto_18824 ?auto_18823 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18856 - OBJ
      ?auto_18857 - OBJ
      ?auto_18858 - OBJ
      ?auto_18859 - OBJ
      ?auto_18855 - LOCATION
    )
    :vars
    (
      ?auto_18860 - LOCATION
      ?auto_18864 - CITY
      ?auto_18863 - LOCATION
      ?auto_18862 - LOCATION
      ?auto_18861 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18860 ?auto_18864 ) ( IN-CITY ?auto_18855 ?auto_18864 ) ( not ( = ?auto_18855 ?auto_18860 ) ) ( OBJ-AT ?auto_18858 ?auto_18860 ) ( OBJ-AT ?auto_18856 ?auto_18860 ) ( IN-CITY ?auto_18863 ?auto_18864 ) ( not ( = ?auto_18855 ?auto_18863 ) ) ( OBJ-AT ?auto_18859 ?auto_18863 ) ( IN-CITY ?auto_18862 ?auto_18864 ) ( not ( = ?auto_18855 ?auto_18862 ) ) ( OBJ-AT ?auto_18857 ?auto_18862 ) ( TRUCK-AT ?auto_18861 ?auto_18855 ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( not ( = ?auto_18863 ?auto_18862 ) ) ( not ( = ?auto_18857 ?auto_18856 ) ) ( not ( = ?auto_18859 ?auto_18856 ) ) ( not ( = ?auto_18860 ?auto_18863 ) ) ( not ( = ?auto_18860 ?auto_18862 ) ) ( not ( = ?auto_18857 ?auto_18858 ) ) ( not ( = ?auto_18859 ?auto_18858 ) ) ( not ( = ?auto_18856 ?auto_18858 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18857 ?auto_18859 ?auto_18858 ?auto_18856 ?auto_18855 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18888 - OBJ
      ?auto_18889 - OBJ
      ?auto_18890 - OBJ
      ?auto_18891 - OBJ
      ?auto_18887 - LOCATION
    )
    :vars
    (
      ?auto_18892 - LOCATION
      ?auto_18896 - CITY
      ?auto_18895 - LOCATION
      ?auto_18894 - LOCATION
      ?auto_18893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18892 ?auto_18896 ) ( IN-CITY ?auto_18887 ?auto_18896 ) ( not ( = ?auto_18887 ?auto_18892 ) ) ( OBJ-AT ?auto_18891 ?auto_18892 ) ( OBJ-AT ?auto_18888 ?auto_18892 ) ( IN-CITY ?auto_18895 ?auto_18896 ) ( not ( = ?auto_18887 ?auto_18895 ) ) ( OBJ-AT ?auto_18889 ?auto_18895 ) ( IN-CITY ?auto_18894 ?auto_18896 ) ( not ( = ?auto_18887 ?auto_18894 ) ) ( OBJ-AT ?auto_18890 ?auto_18894 ) ( TRUCK-AT ?auto_18893 ?auto_18887 ) ( not ( = ?auto_18890 ?auto_18889 ) ) ( not ( = ?auto_18895 ?auto_18894 ) ) ( not ( = ?auto_18890 ?auto_18888 ) ) ( not ( = ?auto_18889 ?auto_18888 ) ) ( not ( = ?auto_18892 ?auto_18895 ) ) ( not ( = ?auto_18892 ?auto_18894 ) ) ( not ( = ?auto_18890 ?auto_18891 ) ) ( not ( = ?auto_18889 ?auto_18891 ) ) ( not ( = ?auto_18888 ?auto_18891 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18890 ?auto_18889 ?auto_18891 ?auto_18888 ?auto_18887 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18920 - OBJ
      ?auto_18921 - OBJ
      ?auto_18922 - OBJ
      ?auto_18923 - OBJ
      ?auto_18919 - LOCATION
    )
    :vars
    (
      ?auto_18924 - LOCATION
      ?auto_18928 - CITY
      ?auto_18927 - LOCATION
      ?auto_18926 - LOCATION
      ?auto_18925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_18924 ?auto_18928 ) ( IN-CITY ?auto_18919 ?auto_18928 ) ( not ( = ?auto_18919 ?auto_18924 ) ) ( OBJ-AT ?auto_18922 ?auto_18924 ) ( OBJ-AT ?auto_18920 ?auto_18924 ) ( IN-CITY ?auto_18927 ?auto_18928 ) ( not ( = ?auto_18919 ?auto_18927 ) ) ( OBJ-AT ?auto_18921 ?auto_18927 ) ( IN-CITY ?auto_18926 ?auto_18928 ) ( not ( = ?auto_18919 ?auto_18926 ) ) ( OBJ-AT ?auto_18923 ?auto_18926 ) ( TRUCK-AT ?auto_18925 ?auto_18919 ) ( not ( = ?auto_18923 ?auto_18921 ) ) ( not ( = ?auto_18927 ?auto_18926 ) ) ( not ( = ?auto_18923 ?auto_18920 ) ) ( not ( = ?auto_18921 ?auto_18920 ) ) ( not ( = ?auto_18924 ?auto_18927 ) ) ( not ( = ?auto_18924 ?auto_18926 ) ) ( not ( = ?auto_18923 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( not ( = ?auto_18920 ?auto_18922 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_18923 ?auto_18921 ?auto_18922 ?auto_18920 ?auto_18919 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19054 - OBJ
      ?auto_19055 - OBJ
      ?auto_19056 - OBJ
      ?auto_19057 - OBJ
      ?auto_19053 - LOCATION
    )
    :vars
    (
      ?auto_19058 - LOCATION
      ?auto_19062 - CITY
      ?auto_19061 - LOCATION
      ?auto_19060 - LOCATION
      ?auto_19059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19058 ?auto_19062 ) ( IN-CITY ?auto_19053 ?auto_19062 ) ( not ( = ?auto_19053 ?auto_19058 ) ) ( OBJ-AT ?auto_19055 ?auto_19058 ) ( OBJ-AT ?auto_19054 ?auto_19058 ) ( IN-CITY ?auto_19061 ?auto_19062 ) ( not ( = ?auto_19053 ?auto_19061 ) ) ( OBJ-AT ?auto_19057 ?auto_19061 ) ( IN-CITY ?auto_19060 ?auto_19062 ) ( not ( = ?auto_19053 ?auto_19060 ) ) ( OBJ-AT ?auto_19056 ?auto_19060 ) ( TRUCK-AT ?auto_19059 ?auto_19053 ) ( not ( = ?auto_19056 ?auto_19057 ) ) ( not ( = ?auto_19061 ?auto_19060 ) ) ( not ( = ?auto_19056 ?auto_19054 ) ) ( not ( = ?auto_19057 ?auto_19054 ) ) ( not ( = ?auto_19058 ?auto_19061 ) ) ( not ( = ?auto_19058 ?auto_19060 ) ) ( not ( = ?auto_19056 ?auto_19055 ) ) ( not ( = ?auto_19057 ?auto_19055 ) ) ( not ( = ?auto_19054 ?auto_19055 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19056 ?auto_19057 ?auto_19055 ?auto_19054 ?auto_19053 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19086 - OBJ
      ?auto_19087 - OBJ
      ?auto_19088 - OBJ
      ?auto_19089 - OBJ
      ?auto_19085 - LOCATION
    )
    :vars
    (
      ?auto_19090 - LOCATION
      ?auto_19094 - CITY
      ?auto_19093 - LOCATION
      ?auto_19092 - LOCATION
      ?auto_19091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19090 ?auto_19094 ) ( IN-CITY ?auto_19085 ?auto_19094 ) ( not ( = ?auto_19085 ?auto_19090 ) ) ( OBJ-AT ?auto_19087 ?auto_19090 ) ( OBJ-AT ?auto_19086 ?auto_19090 ) ( IN-CITY ?auto_19093 ?auto_19094 ) ( not ( = ?auto_19085 ?auto_19093 ) ) ( OBJ-AT ?auto_19088 ?auto_19093 ) ( IN-CITY ?auto_19092 ?auto_19094 ) ( not ( = ?auto_19085 ?auto_19092 ) ) ( OBJ-AT ?auto_19089 ?auto_19092 ) ( TRUCK-AT ?auto_19091 ?auto_19085 ) ( not ( = ?auto_19089 ?auto_19088 ) ) ( not ( = ?auto_19093 ?auto_19092 ) ) ( not ( = ?auto_19089 ?auto_19086 ) ) ( not ( = ?auto_19088 ?auto_19086 ) ) ( not ( = ?auto_19090 ?auto_19093 ) ) ( not ( = ?auto_19090 ?auto_19092 ) ) ( not ( = ?auto_19089 ?auto_19087 ) ) ( not ( = ?auto_19088 ?auto_19087 ) ) ( not ( = ?auto_19086 ?auto_19087 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19089 ?auto_19088 ?auto_19087 ?auto_19086 ?auto_19085 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19289 - OBJ
      ?auto_19290 - OBJ
      ?auto_19291 - OBJ
      ?auto_19292 - OBJ
      ?auto_19288 - LOCATION
    )
    :vars
    (
      ?auto_19293 - LOCATION
      ?auto_19297 - CITY
      ?auto_19296 - LOCATION
      ?auto_19295 - LOCATION
      ?auto_19294 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19293 ?auto_19297 ) ( IN-CITY ?auto_19288 ?auto_19297 ) ( not ( = ?auto_19288 ?auto_19293 ) ) ( OBJ-AT ?auto_19289 ?auto_19293 ) ( OBJ-AT ?auto_19292 ?auto_19293 ) ( IN-CITY ?auto_19296 ?auto_19297 ) ( not ( = ?auto_19288 ?auto_19296 ) ) ( OBJ-AT ?auto_19291 ?auto_19296 ) ( IN-CITY ?auto_19295 ?auto_19297 ) ( not ( = ?auto_19288 ?auto_19295 ) ) ( OBJ-AT ?auto_19290 ?auto_19295 ) ( TRUCK-AT ?auto_19294 ?auto_19288 ) ( not ( = ?auto_19290 ?auto_19291 ) ) ( not ( = ?auto_19296 ?auto_19295 ) ) ( not ( = ?auto_19290 ?auto_19292 ) ) ( not ( = ?auto_19291 ?auto_19292 ) ) ( not ( = ?auto_19293 ?auto_19296 ) ) ( not ( = ?auto_19293 ?auto_19295 ) ) ( not ( = ?auto_19290 ?auto_19289 ) ) ( not ( = ?auto_19291 ?auto_19289 ) ) ( not ( = ?auto_19292 ?auto_19289 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19290 ?auto_19291 ?auto_19289 ?auto_19292 ?auto_19288 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19321 - OBJ
      ?auto_19322 - OBJ
      ?auto_19323 - OBJ
      ?auto_19324 - OBJ
      ?auto_19320 - LOCATION
    )
    :vars
    (
      ?auto_19325 - LOCATION
      ?auto_19329 - CITY
      ?auto_19328 - LOCATION
      ?auto_19327 - LOCATION
      ?auto_19326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19325 ?auto_19329 ) ( IN-CITY ?auto_19320 ?auto_19329 ) ( not ( = ?auto_19320 ?auto_19325 ) ) ( OBJ-AT ?auto_19321 ?auto_19325 ) ( OBJ-AT ?auto_19323 ?auto_19325 ) ( IN-CITY ?auto_19328 ?auto_19329 ) ( not ( = ?auto_19320 ?auto_19328 ) ) ( OBJ-AT ?auto_19324 ?auto_19328 ) ( IN-CITY ?auto_19327 ?auto_19329 ) ( not ( = ?auto_19320 ?auto_19327 ) ) ( OBJ-AT ?auto_19322 ?auto_19327 ) ( TRUCK-AT ?auto_19326 ?auto_19320 ) ( not ( = ?auto_19322 ?auto_19324 ) ) ( not ( = ?auto_19328 ?auto_19327 ) ) ( not ( = ?auto_19322 ?auto_19323 ) ) ( not ( = ?auto_19324 ?auto_19323 ) ) ( not ( = ?auto_19325 ?auto_19328 ) ) ( not ( = ?auto_19325 ?auto_19327 ) ) ( not ( = ?auto_19322 ?auto_19321 ) ) ( not ( = ?auto_19324 ?auto_19321 ) ) ( not ( = ?auto_19323 ?auto_19321 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19322 ?auto_19324 ?auto_19321 ?auto_19323 ?auto_19320 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19421 - OBJ
      ?auto_19422 - OBJ
      ?auto_19423 - OBJ
      ?auto_19424 - OBJ
      ?auto_19420 - LOCATION
    )
    :vars
    (
      ?auto_19425 - LOCATION
      ?auto_19429 - CITY
      ?auto_19428 - LOCATION
      ?auto_19427 - LOCATION
      ?auto_19426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19425 ?auto_19429 ) ( IN-CITY ?auto_19420 ?auto_19429 ) ( not ( = ?auto_19420 ?auto_19425 ) ) ( OBJ-AT ?auto_19421 ?auto_19425 ) ( OBJ-AT ?auto_19424 ?auto_19425 ) ( IN-CITY ?auto_19428 ?auto_19429 ) ( not ( = ?auto_19420 ?auto_19428 ) ) ( OBJ-AT ?auto_19422 ?auto_19428 ) ( IN-CITY ?auto_19427 ?auto_19429 ) ( not ( = ?auto_19420 ?auto_19427 ) ) ( OBJ-AT ?auto_19423 ?auto_19427 ) ( TRUCK-AT ?auto_19426 ?auto_19420 ) ( not ( = ?auto_19423 ?auto_19422 ) ) ( not ( = ?auto_19428 ?auto_19427 ) ) ( not ( = ?auto_19423 ?auto_19424 ) ) ( not ( = ?auto_19422 ?auto_19424 ) ) ( not ( = ?auto_19425 ?auto_19428 ) ) ( not ( = ?auto_19425 ?auto_19427 ) ) ( not ( = ?auto_19423 ?auto_19421 ) ) ( not ( = ?auto_19422 ?auto_19421 ) ) ( not ( = ?auto_19424 ?auto_19421 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19423 ?auto_19422 ?auto_19421 ?auto_19424 ?auto_19420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19488 - OBJ
      ?auto_19489 - OBJ
      ?auto_19490 - OBJ
      ?auto_19491 - OBJ
      ?auto_19487 - LOCATION
    )
    :vars
    (
      ?auto_19492 - LOCATION
      ?auto_19496 - CITY
      ?auto_19495 - LOCATION
      ?auto_19494 - LOCATION
      ?auto_19493 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19492 ?auto_19496 ) ( IN-CITY ?auto_19487 ?auto_19496 ) ( not ( = ?auto_19487 ?auto_19492 ) ) ( OBJ-AT ?auto_19488 ?auto_19492 ) ( OBJ-AT ?auto_19490 ?auto_19492 ) ( IN-CITY ?auto_19495 ?auto_19496 ) ( not ( = ?auto_19487 ?auto_19495 ) ) ( OBJ-AT ?auto_19489 ?auto_19495 ) ( IN-CITY ?auto_19494 ?auto_19496 ) ( not ( = ?auto_19487 ?auto_19494 ) ) ( OBJ-AT ?auto_19491 ?auto_19494 ) ( TRUCK-AT ?auto_19493 ?auto_19487 ) ( not ( = ?auto_19491 ?auto_19489 ) ) ( not ( = ?auto_19495 ?auto_19494 ) ) ( not ( = ?auto_19491 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19492 ?auto_19495 ) ) ( not ( = ?auto_19492 ?auto_19494 ) ) ( not ( = ?auto_19491 ?auto_19488 ) ) ( not ( = ?auto_19489 ?auto_19488 ) ) ( not ( = ?auto_19490 ?auto_19488 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19491 ?auto_19489 ?auto_19488 ?auto_19490 ?auto_19487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19588 - OBJ
      ?auto_19589 - OBJ
      ?auto_19590 - OBJ
      ?auto_19591 - OBJ
      ?auto_19587 - LOCATION
    )
    :vars
    (
      ?auto_19592 - LOCATION
      ?auto_19596 - CITY
      ?auto_19595 - LOCATION
      ?auto_19594 - LOCATION
      ?auto_19593 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19592 ?auto_19596 ) ( IN-CITY ?auto_19587 ?auto_19596 ) ( not ( = ?auto_19587 ?auto_19592 ) ) ( OBJ-AT ?auto_19588 ?auto_19592 ) ( OBJ-AT ?auto_19589 ?auto_19592 ) ( IN-CITY ?auto_19595 ?auto_19596 ) ( not ( = ?auto_19587 ?auto_19595 ) ) ( OBJ-AT ?auto_19591 ?auto_19595 ) ( IN-CITY ?auto_19594 ?auto_19596 ) ( not ( = ?auto_19587 ?auto_19594 ) ) ( OBJ-AT ?auto_19590 ?auto_19594 ) ( TRUCK-AT ?auto_19593 ?auto_19587 ) ( not ( = ?auto_19590 ?auto_19591 ) ) ( not ( = ?auto_19595 ?auto_19594 ) ) ( not ( = ?auto_19590 ?auto_19589 ) ) ( not ( = ?auto_19591 ?auto_19589 ) ) ( not ( = ?auto_19592 ?auto_19595 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19590 ?auto_19588 ) ) ( not ( = ?auto_19591 ?auto_19588 ) ) ( not ( = ?auto_19589 ?auto_19588 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19590 ?auto_19591 ?auto_19588 ?auto_19589 ?auto_19587 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19620 - OBJ
      ?auto_19621 - OBJ
      ?auto_19622 - OBJ
      ?auto_19623 - OBJ
      ?auto_19619 - LOCATION
    )
    :vars
    (
      ?auto_19624 - LOCATION
      ?auto_19628 - CITY
      ?auto_19627 - LOCATION
      ?auto_19626 - LOCATION
      ?auto_19625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19624 ?auto_19628 ) ( IN-CITY ?auto_19619 ?auto_19628 ) ( not ( = ?auto_19619 ?auto_19624 ) ) ( OBJ-AT ?auto_19620 ?auto_19624 ) ( OBJ-AT ?auto_19621 ?auto_19624 ) ( IN-CITY ?auto_19627 ?auto_19628 ) ( not ( = ?auto_19619 ?auto_19627 ) ) ( OBJ-AT ?auto_19622 ?auto_19627 ) ( IN-CITY ?auto_19626 ?auto_19628 ) ( not ( = ?auto_19619 ?auto_19626 ) ) ( OBJ-AT ?auto_19623 ?auto_19626 ) ( TRUCK-AT ?auto_19625 ?auto_19619 ) ( not ( = ?auto_19623 ?auto_19622 ) ) ( not ( = ?auto_19627 ?auto_19626 ) ) ( not ( = ?auto_19623 ?auto_19621 ) ) ( not ( = ?auto_19622 ?auto_19621 ) ) ( not ( = ?auto_19624 ?auto_19627 ) ) ( not ( = ?auto_19624 ?auto_19626 ) ) ( not ( = ?auto_19623 ?auto_19620 ) ) ( not ( = ?auto_19622 ?auto_19620 ) ) ( not ( = ?auto_19621 ?auto_19620 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_19623 ?auto_19622 ?auto_19620 ?auto_19621 ?auto_19619 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_19944 - OBJ
      ?auto_19943 - LOCATION
    )
    :vars
    (
      ?auto_19946 - LOCATION
      ?auto_19947 - CITY
      ?auto_19945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19946 ?auto_19947 ) ( IN-CITY ?auto_19943 ?auto_19947 ) ( not ( = ?auto_19943 ?auto_19946 ) ) ( OBJ-AT ?auto_19944 ?auto_19946 ) ( TRUCK-AT ?auto_19945 ?auto_19943 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_19945 ?auto_19943 ?auto_19946 ?auto_19947 )
      ( !LOAD-TRUCK ?auto_19944 ?auto_19945 ?auto_19946 )
      ( !DRIVE-TRUCK ?auto_19945 ?auto_19946 ?auto_19943 ?auto_19947 )
      ( !UNLOAD-TRUCK ?auto_19944 ?auto_19945 ?auto_19943 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33599 - OBJ
      ?auto_33600 - OBJ
      ?auto_33601 - OBJ
      ?auto_33602 - OBJ
      ?auto_33603 - OBJ
      ?auto_33598 - LOCATION
    )
    :vars
    (
      ?auto_33604 - LOCATION
      ?auto_33606 - CITY
      ?auto_33608 - LOCATION
      ?auto_33607 - LOCATION
      ?auto_33605 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33604 ?auto_33606 ) ( IN-CITY ?auto_33598 ?auto_33606 ) ( not ( = ?auto_33598 ?auto_33604 ) ) ( OBJ-AT ?auto_33603 ?auto_33604 ) ( OBJ-AT ?auto_33602 ?auto_33604 ) ( OBJ-AT ?auto_33601 ?auto_33604 ) ( IN-CITY ?auto_33608 ?auto_33606 ) ( not ( = ?auto_33598 ?auto_33608 ) ) ( OBJ-AT ?auto_33600 ?auto_33608 ) ( IN-CITY ?auto_33607 ?auto_33606 ) ( not ( = ?auto_33598 ?auto_33607 ) ) ( OBJ-AT ?auto_33599 ?auto_33607 ) ( TRUCK-AT ?auto_33605 ?auto_33598 ) ( not ( = ?auto_33599 ?auto_33600 ) ) ( not ( = ?auto_33608 ?auto_33607 ) ) ( not ( = ?auto_33599 ?auto_33601 ) ) ( not ( = ?auto_33600 ?auto_33601 ) ) ( not ( = ?auto_33604 ?auto_33608 ) ) ( not ( = ?auto_33604 ?auto_33607 ) ) ( not ( = ?auto_33599 ?auto_33602 ) ) ( not ( = ?auto_33600 ?auto_33602 ) ) ( not ( = ?auto_33601 ?auto_33602 ) ) ( not ( = ?auto_33599 ?auto_33603 ) ) ( not ( = ?auto_33600 ?auto_33603 ) ) ( not ( = ?auto_33601 ?auto_33603 ) ) ( not ( = ?auto_33602 ?auto_33603 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_33599 ?auto_33600 ?auto_33602 ?auto_33601 ?auto_33598 )
      ( DELIVER-1PKG ?auto_33603 ?auto_33598 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33646 - OBJ
      ?auto_33647 - OBJ
      ?auto_33648 - OBJ
      ?auto_33649 - OBJ
      ?auto_33650 - OBJ
      ?auto_33645 - LOCATION
    )
    :vars
    (
      ?auto_33653 - LOCATION
      ?auto_33651 - CITY
      ?auto_33654 - LOCATION
      ?auto_33655 - LOCATION
      ?auto_33652 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33653 ?auto_33651 ) ( IN-CITY ?auto_33645 ?auto_33651 ) ( not ( = ?auto_33645 ?auto_33653 ) ) ( OBJ-AT ?auto_33649 ?auto_33653 ) ( OBJ-AT ?auto_33650 ?auto_33653 ) ( OBJ-AT ?auto_33648 ?auto_33653 ) ( IN-CITY ?auto_33654 ?auto_33651 ) ( not ( = ?auto_33645 ?auto_33654 ) ) ( OBJ-AT ?auto_33647 ?auto_33654 ) ( IN-CITY ?auto_33655 ?auto_33651 ) ( not ( = ?auto_33645 ?auto_33655 ) ) ( OBJ-AT ?auto_33646 ?auto_33655 ) ( TRUCK-AT ?auto_33652 ?auto_33645 ) ( not ( = ?auto_33646 ?auto_33647 ) ) ( not ( = ?auto_33654 ?auto_33655 ) ) ( not ( = ?auto_33646 ?auto_33648 ) ) ( not ( = ?auto_33647 ?auto_33648 ) ) ( not ( = ?auto_33653 ?auto_33654 ) ) ( not ( = ?auto_33653 ?auto_33655 ) ) ( not ( = ?auto_33646 ?auto_33650 ) ) ( not ( = ?auto_33647 ?auto_33650 ) ) ( not ( = ?auto_33648 ?auto_33650 ) ) ( not ( = ?auto_33646 ?auto_33649 ) ) ( not ( = ?auto_33647 ?auto_33649 ) ) ( not ( = ?auto_33648 ?auto_33649 ) ) ( not ( = ?auto_33650 ?auto_33649 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33646 ?auto_33647 ?auto_33648 ?auto_33650 ?auto_33649 ?auto_33645 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33693 - OBJ
      ?auto_33694 - OBJ
      ?auto_33695 - OBJ
      ?auto_33696 - OBJ
      ?auto_33697 - OBJ
      ?auto_33692 - LOCATION
    )
    :vars
    (
      ?auto_33699 - LOCATION
      ?auto_33700 - CITY
      ?auto_33698 - LOCATION
      ?auto_33702 - LOCATION
      ?auto_33701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33699 ?auto_33700 ) ( IN-CITY ?auto_33692 ?auto_33700 ) ( not ( = ?auto_33692 ?auto_33699 ) ) ( OBJ-AT ?auto_33697 ?auto_33699 ) ( OBJ-AT ?auto_33695 ?auto_33699 ) ( OBJ-AT ?auto_33696 ?auto_33699 ) ( IN-CITY ?auto_33698 ?auto_33700 ) ( not ( = ?auto_33692 ?auto_33698 ) ) ( OBJ-AT ?auto_33694 ?auto_33698 ) ( IN-CITY ?auto_33702 ?auto_33700 ) ( not ( = ?auto_33692 ?auto_33702 ) ) ( OBJ-AT ?auto_33693 ?auto_33702 ) ( TRUCK-AT ?auto_33701 ?auto_33692 ) ( not ( = ?auto_33693 ?auto_33694 ) ) ( not ( = ?auto_33698 ?auto_33702 ) ) ( not ( = ?auto_33693 ?auto_33696 ) ) ( not ( = ?auto_33694 ?auto_33696 ) ) ( not ( = ?auto_33699 ?auto_33698 ) ) ( not ( = ?auto_33699 ?auto_33702 ) ) ( not ( = ?auto_33693 ?auto_33695 ) ) ( not ( = ?auto_33694 ?auto_33695 ) ) ( not ( = ?auto_33696 ?auto_33695 ) ) ( not ( = ?auto_33693 ?auto_33697 ) ) ( not ( = ?auto_33694 ?auto_33697 ) ) ( not ( = ?auto_33696 ?auto_33697 ) ) ( not ( = ?auto_33695 ?auto_33697 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33693 ?auto_33694 ?auto_33696 ?auto_33697 ?auto_33695 ?auto_33692 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33740 - OBJ
      ?auto_33741 - OBJ
      ?auto_33742 - OBJ
      ?auto_33743 - OBJ
      ?auto_33744 - OBJ
      ?auto_33739 - LOCATION
    )
    :vars
    (
      ?auto_33746 - LOCATION
      ?auto_33747 - CITY
      ?auto_33745 - LOCATION
      ?auto_33749 - LOCATION
      ?auto_33748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33746 ?auto_33747 ) ( IN-CITY ?auto_33739 ?auto_33747 ) ( not ( = ?auto_33739 ?auto_33746 ) ) ( OBJ-AT ?auto_33743 ?auto_33746 ) ( OBJ-AT ?auto_33742 ?auto_33746 ) ( OBJ-AT ?auto_33744 ?auto_33746 ) ( IN-CITY ?auto_33745 ?auto_33747 ) ( not ( = ?auto_33739 ?auto_33745 ) ) ( OBJ-AT ?auto_33741 ?auto_33745 ) ( IN-CITY ?auto_33749 ?auto_33747 ) ( not ( = ?auto_33739 ?auto_33749 ) ) ( OBJ-AT ?auto_33740 ?auto_33749 ) ( TRUCK-AT ?auto_33748 ?auto_33739 ) ( not ( = ?auto_33740 ?auto_33741 ) ) ( not ( = ?auto_33745 ?auto_33749 ) ) ( not ( = ?auto_33740 ?auto_33744 ) ) ( not ( = ?auto_33741 ?auto_33744 ) ) ( not ( = ?auto_33746 ?auto_33745 ) ) ( not ( = ?auto_33746 ?auto_33749 ) ) ( not ( = ?auto_33740 ?auto_33742 ) ) ( not ( = ?auto_33741 ?auto_33742 ) ) ( not ( = ?auto_33744 ?auto_33742 ) ) ( not ( = ?auto_33740 ?auto_33743 ) ) ( not ( = ?auto_33741 ?auto_33743 ) ) ( not ( = ?auto_33744 ?auto_33743 ) ) ( not ( = ?auto_33742 ?auto_33743 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33740 ?auto_33741 ?auto_33744 ?auto_33743 ?auto_33742 ?auto_33739 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33937 - OBJ
      ?auto_33938 - OBJ
      ?auto_33939 - OBJ
      ?auto_33940 - OBJ
      ?auto_33941 - OBJ
      ?auto_33936 - LOCATION
    )
    :vars
    (
      ?auto_33943 - LOCATION
      ?auto_33944 - CITY
      ?auto_33942 - LOCATION
      ?auto_33946 - LOCATION
      ?auto_33945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33943 ?auto_33944 ) ( IN-CITY ?auto_33936 ?auto_33944 ) ( not ( = ?auto_33936 ?auto_33943 ) ) ( OBJ-AT ?auto_33939 ?auto_33943 ) ( OBJ-AT ?auto_33941 ?auto_33943 ) ( OBJ-AT ?auto_33940 ?auto_33943 ) ( IN-CITY ?auto_33942 ?auto_33944 ) ( not ( = ?auto_33936 ?auto_33942 ) ) ( OBJ-AT ?auto_33938 ?auto_33942 ) ( IN-CITY ?auto_33946 ?auto_33944 ) ( not ( = ?auto_33936 ?auto_33946 ) ) ( OBJ-AT ?auto_33937 ?auto_33946 ) ( TRUCK-AT ?auto_33945 ?auto_33936 ) ( not ( = ?auto_33937 ?auto_33938 ) ) ( not ( = ?auto_33942 ?auto_33946 ) ) ( not ( = ?auto_33937 ?auto_33940 ) ) ( not ( = ?auto_33938 ?auto_33940 ) ) ( not ( = ?auto_33943 ?auto_33942 ) ) ( not ( = ?auto_33943 ?auto_33946 ) ) ( not ( = ?auto_33937 ?auto_33941 ) ) ( not ( = ?auto_33938 ?auto_33941 ) ) ( not ( = ?auto_33940 ?auto_33941 ) ) ( not ( = ?auto_33937 ?auto_33939 ) ) ( not ( = ?auto_33938 ?auto_33939 ) ) ( not ( = ?auto_33940 ?auto_33939 ) ) ( not ( = ?auto_33941 ?auto_33939 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33937 ?auto_33938 ?auto_33940 ?auto_33939 ?auto_33941 ?auto_33936 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_33984 - OBJ
      ?auto_33985 - OBJ
      ?auto_33986 - OBJ
      ?auto_33987 - OBJ
      ?auto_33988 - OBJ
      ?auto_33983 - LOCATION
    )
    :vars
    (
      ?auto_33990 - LOCATION
      ?auto_33991 - CITY
      ?auto_33989 - LOCATION
      ?auto_33993 - LOCATION
      ?auto_33992 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_33990 ?auto_33991 ) ( IN-CITY ?auto_33983 ?auto_33991 ) ( not ( = ?auto_33983 ?auto_33990 ) ) ( OBJ-AT ?auto_33986 ?auto_33990 ) ( OBJ-AT ?auto_33987 ?auto_33990 ) ( OBJ-AT ?auto_33988 ?auto_33990 ) ( IN-CITY ?auto_33989 ?auto_33991 ) ( not ( = ?auto_33983 ?auto_33989 ) ) ( OBJ-AT ?auto_33985 ?auto_33989 ) ( IN-CITY ?auto_33993 ?auto_33991 ) ( not ( = ?auto_33983 ?auto_33993 ) ) ( OBJ-AT ?auto_33984 ?auto_33993 ) ( TRUCK-AT ?auto_33992 ?auto_33983 ) ( not ( = ?auto_33984 ?auto_33985 ) ) ( not ( = ?auto_33989 ?auto_33993 ) ) ( not ( = ?auto_33984 ?auto_33988 ) ) ( not ( = ?auto_33985 ?auto_33988 ) ) ( not ( = ?auto_33990 ?auto_33989 ) ) ( not ( = ?auto_33990 ?auto_33993 ) ) ( not ( = ?auto_33984 ?auto_33987 ) ) ( not ( = ?auto_33985 ?auto_33987 ) ) ( not ( = ?auto_33988 ?auto_33987 ) ) ( not ( = ?auto_33984 ?auto_33986 ) ) ( not ( = ?auto_33985 ?auto_33986 ) ) ( not ( = ?auto_33988 ?auto_33986 ) ) ( not ( = ?auto_33987 ?auto_33986 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_33984 ?auto_33985 ?auto_33988 ?auto_33986 ?auto_33987 ?auto_33983 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34231 - OBJ
      ?auto_34232 - OBJ
      ?auto_34233 - OBJ
      ?auto_34234 - OBJ
      ?auto_34235 - OBJ
      ?auto_34230 - LOCATION
    )
    :vars
    (
      ?auto_34237 - LOCATION
      ?auto_34238 - CITY
      ?auto_34236 - LOCATION
      ?auto_34240 - LOCATION
      ?auto_34239 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34237 ?auto_34238 ) ( IN-CITY ?auto_34230 ?auto_34238 ) ( not ( = ?auto_34230 ?auto_34237 ) ) ( OBJ-AT ?auto_34235 ?auto_34237 ) ( OBJ-AT ?auto_34234 ?auto_34237 ) ( OBJ-AT ?auto_34232 ?auto_34237 ) ( IN-CITY ?auto_34236 ?auto_34238 ) ( not ( = ?auto_34230 ?auto_34236 ) ) ( OBJ-AT ?auto_34233 ?auto_34236 ) ( IN-CITY ?auto_34240 ?auto_34238 ) ( not ( = ?auto_34230 ?auto_34240 ) ) ( OBJ-AT ?auto_34231 ?auto_34240 ) ( TRUCK-AT ?auto_34239 ?auto_34230 ) ( not ( = ?auto_34231 ?auto_34233 ) ) ( not ( = ?auto_34236 ?auto_34240 ) ) ( not ( = ?auto_34231 ?auto_34232 ) ) ( not ( = ?auto_34233 ?auto_34232 ) ) ( not ( = ?auto_34237 ?auto_34236 ) ) ( not ( = ?auto_34237 ?auto_34240 ) ) ( not ( = ?auto_34231 ?auto_34234 ) ) ( not ( = ?auto_34233 ?auto_34234 ) ) ( not ( = ?auto_34232 ?auto_34234 ) ) ( not ( = ?auto_34231 ?auto_34235 ) ) ( not ( = ?auto_34233 ?auto_34235 ) ) ( not ( = ?auto_34232 ?auto_34235 ) ) ( not ( = ?auto_34234 ?auto_34235 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34231 ?auto_34233 ?auto_34232 ?auto_34235 ?auto_34234 ?auto_34230 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34278 - OBJ
      ?auto_34279 - OBJ
      ?auto_34280 - OBJ
      ?auto_34281 - OBJ
      ?auto_34282 - OBJ
      ?auto_34277 - LOCATION
    )
    :vars
    (
      ?auto_34284 - LOCATION
      ?auto_34285 - CITY
      ?auto_34283 - LOCATION
      ?auto_34287 - LOCATION
      ?auto_34286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34284 ?auto_34285 ) ( IN-CITY ?auto_34277 ?auto_34285 ) ( not ( = ?auto_34277 ?auto_34284 ) ) ( OBJ-AT ?auto_34281 ?auto_34284 ) ( OBJ-AT ?auto_34282 ?auto_34284 ) ( OBJ-AT ?auto_34279 ?auto_34284 ) ( IN-CITY ?auto_34283 ?auto_34285 ) ( not ( = ?auto_34277 ?auto_34283 ) ) ( OBJ-AT ?auto_34280 ?auto_34283 ) ( IN-CITY ?auto_34287 ?auto_34285 ) ( not ( = ?auto_34277 ?auto_34287 ) ) ( OBJ-AT ?auto_34278 ?auto_34287 ) ( TRUCK-AT ?auto_34286 ?auto_34277 ) ( not ( = ?auto_34278 ?auto_34280 ) ) ( not ( = ?auto_34283 ?auto_34287 ) ) ( not ( = ?auto_34278 ?auto_34279 ) ) ( not ( = ?auto_34280 ?auto_34279 ) ) ( not ( = ?auto_34284 ?auto_34283 ) ) ( not ( = ?auto_34284 ?auto_34287 ) ) ( not ( = ?auto_34278 ?auto_34282 ) ) ( not ( = ?auto_34280 ?auto_34282 ) ) ( not ( = ?auto_34279 ?auto_34282 ) ) ( not ( = ?auto_34278 ?auto_34281 ) ) ( not ( = ?auto_34280 ?auto_34281 ) ) ( not ( = ?auto_34279 ?auto_34281 ) ) ( not ( = ?auto_34282 ?auto_34281 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34278 ?auto_34280 ?auto_34279 ?auto_34281 ?auto_34282 ?auto_34277 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34426 - OBJ
      ?auto_34427 - OBJ
      ?auto_34428 - OBJ
      ?auto_34429 - OBJ
      ?auto_34430 - OBJ
      ?auto_34425 - LOCATION
    )
    :vars
    (
      ?auto_34432 - LOCATION
      ?auto_34433 - CITY
      ?auto_34431 - LOCATION
      ?auto_34435 - LOCATION
      ?auto_34434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34432 ?auto_34433 ) ( IN-CITY ?auto_34425 ?auto_34433 ) ( not ( = ?auto_34425 ?auto_34432 ) ) ( OBJ-AT ?auto_34430 ?auto_34432 ) ( OBJ-AT ?auto_34428 ?auto_34432 ) ( OBJ-AT ?auto_34427 ?auto_34432 ) ( IN-CITY ?auto_34431 ?auto_34433 ) ( not ( = ?auto_34425 ?auto_34431 ) ) ( OBJ-AT ?auto_34429 ?auto_34431 ) ( IN-CITY ?auto_34435 ?auto_34433 ) ( not ( = ?auto_34425 ?auto_34435 ) ) ( OBJ-AT ?auto_34426 ?auto_34435 ) ( TRUCK-AT ?auto_34434 ?auto_34425 ) ( not ( = ?auto_34426 ?auto_34429 ) ) ( not ( = ?auto_34431 ?auto_34435 ) ) ( not ( = ?auto_34426 ?auto_34427 ) ) ( not ( = ?auto_34429 ?auto_34427 ) ) ( not ( = ?auto_34432 ?auto_34431 ) ) ( not ( = ?auto_34432 ?auto_34435 ) ) ( not ( = ?auto_34426 ?auto_34428 ) ) ( not ( = ?auto_34429 ?auto_34428 ) ) ( not ( = ?auto_34427 ?auto_34428 ) ) ( not ( = ?auto_34426 ?auto_34430 ) ) ( not ( = ?auto_34429 ?auto_34430 ) ) ( not ( = ?auto_34427 ?auto_34430 ) ) ( not ( = ?auto_34428 ?auto_34430 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34426 ?auto_34429 ?auto_34427 ?auto_34430 ?auto_34428 ?auto_34425 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34473 - OBJ
      ?auto_34474 - OBJ
      ?auto_34475 - OBJ
      ?auto_34476 - OBJ
      ?auto_34477 - OBJ
      ?auto_34472 - LOCATION
    )
    :vars
    (
      ?auto_34479 - LOCATION
      ?auto_34480 - CITY
      ?auto_34478 - LOCATION
      ?auto_34482 - LOCATION
      ?auto_34481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34479 ?auto_34480 ) ( IN-CITY ?auto_34472 ?auto_34480 ) ( not ( = ?auto_34472 ?auto_34479 ) ) ( OBJ-AT ?auto_34476 ?auto_34479 ) ( OBJ-AT ?auto_34475 ?auto_34479 ) ( OBJ-AT ?auto_34474 ?auto_34479 ) ( IN-CITY ?auto_34478 ?auto_34480 ) ( not ( = ?auto_34472 ?auto_34478 ) ) ( OBJ-AT ?auto_34477 ?auto_34478 ) ( IN-CITY ?auto_34482 ?auto_34480 ) ( not ( = ?auto_34472 ?auto_34482 ) ) ( OBJ-AT ?auto_34473 ?auto_34482 ) ( TRUCK-AT ?auto_34481 ?auto_34472 ) ( not ( = ?auto_34473 ?auto_34477 ) ) ( not ( = ?auto_34478 ?auto_34482 ) ) ( not ( = ?auto_34473 ?auto_34474 ) ) ( not ( = ?auto_34477 ?auto_34474 ) ) ( not ( = ?auto_34479 ?auto_34478 ) ) ( not ( = ?auto_34479 ?auto_34482 ) ) ( not ( = ?auto_34473 ?auto_34475 ) ) ( not ( = ?auto_34477 ?auto_34475 ) ) ( not ( = ?auto_34474 ?auto_34475 ) ) ( not ( = ?auto_34473 ?auto_34476 ) ) ( not ( = ?auto_34477 ?auto_34476 ) ) ( not ( = ?auto_34474 ?auto_34476 ) ) ( not ( = ?auto_34475 ?auto_34476 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34473 ?auto_34477 ?auto_34474 ?auto_34476 ?auto_34475 ?auto_34472 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34619 - OBJ
      ?auto_34620 - OBJ
      ?auto_34621 - OBJ
      ?auto_34622 - OBJ
      ?auto_34623 - OBJ
      ?auto_34618 - LOCATION
    )
    :vars
    (
      ?auto_34625 - LOCATION
      ?auto_34626 - CITY
      ?auto_34624 - LOCATION
      ?auto_34628 - LOCATION
      ?auto_34627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34625 ?auto_34626 ) ( IN-CITY ?auto_34618 ?auto_34626 ) ( not ( = ?auto_34618 ?auto_34625 ) ) ( OBJ-AT ?auto_34621 ?auto_34625 ) ( OBJ-AT ?auto_34623 ?auto_34625 ) ( OBJ-AT ?auto_34620 ?auto_34625 ) ( IN-CITY ?auto_34624 ?auto_34626 ) ( not ( = ?auto_34618 ?auto_34624 ) ) ( OBJ-AT ?auto_34622 ?auto_34624 ) ( IN-CITY ?auto_34628 ?auto_34626 ) ( not ( = ?auto_34618 ?auto_34628 ) ) ( OBJ-AT ?auto_34619 ?auto_34628 ) ( TRUCK-AT ?auto_34627 ?auto_34618 ) ( not ( = ?auto_34619 ?auto_34622 ) ) ( not ( = ?auto_34624 ?auto_34628 ) ) ( not ( = ?auto_34619 ?auto_34620 ) ) ( not ( = ?auto_34622 ?auto_34620 ) ) ( not ( = ?auto_34625 ?auto_34624 ) ) ( not ( = ?auto_34625 ?auto_34628 ) ) ( not ( = ?auto_34619 ?auto_34623 ) ) ( not ( = ?auto_34622 ?auto_34623 ) ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( not ( = ?auto_34619 ?auto_34621 ) ) ( not ( = ?auto_34622 ?auto_34621 ) ) ( not ( = ?auto_34620 ?auto_34621 ) ) ( not ( = ?auto_34623 ?auto_34621 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34619 ?auto_34622 ?auto_34620 ?auto_34621 ?auto_34623 ?auto_34618 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34717 - OBJ
      ?auto_34718 - OBJ
      ?auto_34719 - OBJ
      ?auto_34720 - OBJ
      ?auto_34721 - OBJ
      ?auto_34716 - LOCATION
    )
    :vars
    (
      ?auto_34723 - LOCATION
      ?auto_34724 - CITY
      ?auto_34722 - LOCATION
      ?auto_34726 - LOCATION
      ?auto_34725 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34723 ?auto_34724 ) ( IN-CITY ?auto_34716 ?auto_34724 ) ( not ( = ?auto_34716 ?auto_34723 ) ) ( OBJ-AT ?auto_34719 ?auto_34723 ) ( OBJ-AT ?auto_34720 ?auto_34723 ) ( OBJ-AT ?auto_34718 ?auto_34723 ) ( IN-CITY ?auto_34722 ?auto_34724 ) ( not ( = ?auto_34716 ?auto_34722 ) ) ( OBJ-AT ?auto_34721 ?auto_34722 ) ( IN-CITY ?auto_34726 ?auto_34724 ) ( not ( = ?auto_34716 ?auto_34726 ) ) ( OBJ-AT ?auto_34717 ?auto_34726 ) ( TRUCK-AT ?auto_34725 ?auto_34716 ) ( not ( = ?auto_34717 ?auto_34721 ) ) ( not ( = ?auto_34722 ?auto_34726 ) ) ( not ( = ?auto_34717 ?auto_34718 ) ) ( not ( = ?auto_34721 ?auto_34718 ) ) ( not ( = ?auto_34723 ?auto_34722 ) ) ( not ( = ?auto_34723 ?auto_34726 ) ) ( not ( = ?auto_34717 ?auto_34720 ) ) ( not ( = ?auto_34721 ?auto_34720 ) ) ( not ( = ?auto_34718 ?auto_34720 ) ) ( not ( = ?auto_34717 ?auto_34719 ) ) ( not ( = ?auto_34721 ?auto_34719 ) ) ( not ( = ?auto_34718 ?auto_34719 ) ) ( not ( = ?auto_34720 ?auto_34719 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34717 ?auto_34721 ?auto_34718 ?auto_34719 ?auto_34720 ?auto_34716 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_34964 - OBJ
      ?auto_34965 - OBJ
      ?auto_34966 - OBJ
      ?auto_34967 - OBJ
      ?auto_34968 - OBJ
      ?auto_34963 - LOCATION
    )
    :vars
    (
      ?auto_34970 - LOCATION
      ?auto_34971 - CITY
      ?auto_34969 - LOCATION
      ?auto_34973 - LOCATION
      ?auto_34972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34970 ?auto_34971 ) ( IN-CITY ?auto_34963 ?auto_34971 ) ( not ( = ?auto_34963 ?auto_34970 ) ) ( OBJ-AT ?auto_34968 ?auto_34970 ) ( OBJ-AT ?auto_34965 ?auto_34970 ) ( OBJ-AT ?auto_34967 ?auto_34970 ) ( IN-CITY ?auto_34969 ?auto_34971 ) ( not ( = ?auto_34963 ?auto_34969 ) ) ( OBJ-AT ?auto_34966 ?auto_34969 ) ( IN-CITY ?auto_34973 ?auto_34971 ) ( not ( = ?auto_34963 ?auto_34973 ) ) ( OBJ-AT ?auto_34964 ?auto_34973 ) ( TRUCK-AT ?auto_34972 ?auto_34963 ) ( not ( = ?auto_34964 ?auto_34966 ) ) ( not ( = ?auto_34969 ?auto_34973 ) ) ( not ( = ?auto_34964 ?auto_34967 ) ) ( not ( = ?auto_34966 ?auto_34967 ) ) ( not ( = ?auto_34970 ?auto_34969 ) ) ( not ( = ?auto_34970 ?auto_34973 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( not ( = ?auto_34966 ?auto_34965 ) ) ( not ( = ?auto_34967 ?auto_34965 ) ) ( not ( = ?auto_34964 ?auto_34968 ) ) ( not ( = ?auto_34966 ?auto_34968 ) ) ( not ( = ?auto_34967 ?auto_34968 ) ) ( not ( = ?auto_34965 ?auto_34968 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_34964 ?auto_34966 ?auto_34967 ?auto_34968 ?auto_34965 ?auto_34963 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35011 - OBJ
      ?auto_35012 - OBJ
      ?auto_35013 - OBJ
      ?auto_35014 - OBJ
      ?auto_35015 - OBJ
      ?auto_35010 - LOCATION
    )
    :vars
    (
      ?auto_35017 - LOCATION
      ?auto_35018 - CITY
      ?auto_35016 - LOCATION
      ?auto_35020 - LOCATION
      ?auto_35019 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35017 ?auto_35018 ) ( IN-CITY ?auto_35010 ?auto_35018 ) ( not ( = ?auto_35010 ?auto_35017 ) ) ( OBJ-AT ?auto_35014 ?auto_35017 ) ( OBJ-AT ?auto_35012 ?auto_35017 ) ( OBJ-AT ?auto_35015 ?auto_35017 ) ( IN-CITY ?auto_35016 ?auto_35018 ) ( not ( = ?auto_35010 ?auto_35016 ) ) ( OBJ-AT ?auto_35013 ?auto_35016 ) ( IN-CITY ?auto_35020 ?auto_35018 ) ( not ( = ?auto_35010 ?auto_35020 ) ) ( OBJ-AT ?auto_35011 ?auto_35020 ) ( TRUCK-AT ?auto_35019 ?auto_35010 ) ( not ( = ?auto_35011 ?auto_35013 ) ) ( not ( = ?auto_35016 ?auto_35020 ) ) ( not ( = ?auto_35011 ?auto_35015 ) ) ( not ( = ?auto_35013 ?auto_35015 ) ) ( not ( = ?auto_35017 ?auto_35016 ) ) ( not ( = ?auto_35017 ?auto_35020 ) ) ( not ( = ?auto_35011 ?auto_35012 ) ) ( not ( = ?auto_35013 ?auto_35012 ) ) ( not ( = ?auto_35015 ?auto_35012 ) ) ( not ( = ?auto_35011 ?auto_35014 ) ) ( not ( = ?auto_35013 ?auto_35014 ) ) ( not ( = ?auto_35015 ?auto_35014 ) ) ( not ( = ?auto_35012 ?auto_35014 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35011 ?auto_35013 ?auto_35015 ?auto_35014 ?auto_35012 ?auto_35010 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35058 - OBJ
      ?auto_35059 - OBJ
      ?auto_35060 - OBJ
      ?auto_35061 - OBJ
      ?auto_35062 - OBJ
      ?auto_35057 - LOCATION
    )
    :vars
    (
      ?auto_35064 - LOCATION
      ?auto_35065 - CITY
      ?auto_35063 - LOCATION
      ?auto_35067 - LOCATION
      ?auto_35066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35064 ?auto_35065 ) ( IN-CITY ?auto_35057 ?auto_35065 ) ( not ( = ?auto_35057 ?auto_35064 ) ) ( OBJ-AT ?auto_35062 ?auto_35064 ) ( OBJ-AT ?auto_35059 ?auto_35064 ) ( OBJ-AT ?auto_35060 ?auto_35064 ) ( IN-CITY ?auto_35063 ?auto_35065 ) ( not ( = ?auto_35057 ?auto_35063 ) ) ( OBJ-AT ?auto_35061 ?auto_35063 ) ( IN-CITY ?auto_35067 ?auto_35065 ) ( not ( = ?auto_35057 ?auto_35067 ) ) ( OBJ-AT ?auto_35058 ?auto_35067 ) ( TRUCK-AT ?auto_35066 ?auto_35057 ) ( not ( = ?auto_35058 ?auto_35061 ) ) ( not ( = ?auto_35063 ?auto_35067 ) ) ( not ( = ?auto_35058 ?auto_35060 ) ) ( not ( = ?auto_35061 ?auto_35060 ) ) ( not ( = ?auto_35064 ?auto_35063 ) ) ( not ( = ?auto_35064 ?auto_35067 ) ) ( not ( = ?auto_35058 ?auto_35059 ) ) ( not ( = ?auto_35061 ?auto_35059 ) ) ( not ( = ?auto_35060 ?auto_35059 ) ) ( not ( = ?auto_35058 ?auto_35062 ) ) ( not ( = ?auto_35061 ?auto_35062 ) ) ( not ( = ?auto_35060 ?auto_35062 ) ) ( not ( = ?auto_35059 ?auto_35062 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35058 ?auto_35061 ?auto_35060 ?auto_35062 ?auto_35059 ?auto_35057 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35105 - OBJ
      ?auto_35106 - OBJ
      ?auto_35107 - OBJ
      ?auto_35108 - OBJ
      ?auto_35109 - OBJ
      ?auto_35104 - LOCATION
    )
    :vars
    (
      ?auto_35111 - LOCATION
      ?auto_35112 - CITY
      ?auto_35110 - LOCATION
      ?auto_35114 - LOCATION
      ?auto_35113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35111 ?auto_35112 ) ( IN-CITY ?auto_35104 ?auto_35112 ) ( not ( = ?auto_35104 ?auto_35111 ) ) ( OBJ-AT ?auto_35108 ?auto_35111 ) ( OBJ-AT ?auto_35106 ?auto_35111 ) ( OBJ-AT ?auto_35107 ?auto_35111 ) ( IN-CITY ?auto_35110 ?auto_35112 ) ( not ( = ?auto_35104 ?auto_35110 ) ) ( OBJ-AT ?auto_35109 ?auto_35110 ) ( IN-CITY ?auto_35114 ?auto_35112 ) ( not ( = ?auto_35104 ?auto_35114 ) ) ( OBJ-AT ?auto_35105 ?auto_35114 ) ( TRUCK-AT ?auto_35113 ?auto_35104 ) ( not ( = ?auto_35105 ?auto_35109 ) ) ( not ( = ?auto_35110 ?auto_35114 ) ) ( not ( = ?auto_35105 ?auto_35107 ) ) ( not ( = ?auto_35109 ?auto_35107 ) ) ( not ( = ?auto_35111 ?auto_35110 ) ) ( not ( = ?auto_35111 ?auto_35114 ) ) ( not ( = ?auto_35105 ?auto_35106 ) ) ( not ( = ?auto_35109 ?auto_35106 ) ) ( not ( = ?auto_35107 ?auto_35106 ) ) ( not ( = ?auto_35105 ?auto_35108 ) ) ( not ( = ?auto_35109 ?auto_35108 ) ) ( not ( = ?auto_35107 ?auto_35108 ) ) ( not ( = ?auto_35106 ?auto_35108 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35105 ?auto_35109 ?auto_35107 ?auto_35108 ?auto_35106 ?auto_35104 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35352 - OBJ
      ?auto_35353 - OBJ
      ?auto_35354 - OBJ
      ?auto_35355 - OBJ
      ?auto_35356 - OBJ
      ?auto_35351 - LOCATION
    )
    :vars
    (
      ?auto_35358 - LOCATION
      ?auto_35359 - CITY
      ?auto_35357 - LOCATION
      ?auto_35361 - LOCATION
      ?auto_35360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35358 ?auto_35359 ) ( IN-CITY ?auto_35351 ?auto_35359 ) ( not ( = ?auto_35351 ?auto_35358 ) ) ( OBJ-AT ?auto_35354 ?auto_35358 ) ( OBJ-AT ?auto_35353 ?auto_35358 ) ( OBJ-AT ?auto_35356 ?auto_35358 ) ( IN-CITY ?auto_35357 ?auto_35359 ) ( not ( = ?auto_35351 ?auto_35357 ) ) ( OBJ-AT ?auto_35355 ?auto_35357 ) ( IN-CITY ?auto_35361 ?auto_35359 ) ( not ( = ?auto_35351 ?auto_35361 ) ) ( OBJ-AT ?auto_35352 ?auto_35361 ) ( TRUCK-AT ?auto_35360 ?auto_35351 ) ( not ( = ?auto_35352 ?auto_35355 ) ) ( not ( = ?auto_35357 ?auto_35361 ) ) ( not ( = ?auto_35352 ?auto_35356 ) ) ( not ( = ?auto_35355 ?auto_35356 ) ) ( not ( = ?auto_35358 ?auto_35357 ) ) ( not ( = ?auto_35358 ?auto_35361 ) ) ( not ( = ?auto_35352 ?auto_35353 ) ) ( not ( = ?auto_35355 ?auto_35353 ) ) ( not ( = ?auto_35356 ?auto_35353 ) ) ( not ( = ?auto_35352 ?auto_35354 ) ) ( not ( = ?auto_35355 ?auto_35354 ) ) ( not ( = ?auto_35356 ?auto_35354 ) ) ( not ( = ?auto_35353 ?auto_35354 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35352 ?auto_35355 ?auto_35356 ?auto_35354 ?auto_35353 ?auto_35351 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_35399 - OBJ
      ?auto_35400 - OBJ
      ?auto_35401 - OBJ
      ?auto_35402 - OBJ
      ?auto_35403 - OBJ
      ?auto_35398 - LOCATION
    )
    :vars
    (
      ?auto_35405 - LOCATION
      ?auto_35406 - CITY
      ?auto_35404 - LOCATION
      ?auto_35408 - LOCATION
      ?auto_35407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_35405 ?auto_35406 ) ( IN-CITY ?auto_35398 ?auto_35406 ) ( not ( = ?auto_35398 ?auto_35405 ) ) ( OBJ-AT ?auto_35401 ?auto_35405 ) ( OBJ-AT ?auto_35400 ?auto_35405 ) ( OBJ-AT ?auto_35402 ?auto_35405 ) ( IN-CITY ?auto_35404 ?auto_35406 ) ( not ( = ?auto_35398 ?auto_35404 ) ) ( OBJ-AT ?auto_35403 ?auto_35404 ) ( IN-CITY ?auto_35408 ?auto_35406 ) ( not ( = ?auto_35398 ?auto_35408 ) ) ( OBJ-AT ?auto_35399 ?auto_35408 ) ( TRUCK-AT ?auto_35407 ?auto_35398 ) ( not ( = ?auto_35399 ?auto_35403 ) ) ( not ( = ?auto_35404 ?auto_35408 ) ) ( not ( = ?auto_35399 ?auto_35402 ) ) ( not ( = ?auto_35403 ?auto_35402 ) ) ( not ( = ?auto_35405 ?auto_35404 ) ) ( not ( = ?auto_35405 ?auto_35408 ) ) ( not ( = ?auto_35399 ?auto_35400 ) ) ( not ( = ?auto_35403 ?auto_35400 ) ) ( not ( = ?auto_35402 ?auto_35400 ) ) ( not ( = ?auto_35399 ?auto_35401 ) ) ( not ( = ?auto_35403 ?auto_35401 ) ) ( not ( = ?auto_35402 ?auto_35401 ) ) ( not ( = ?auto_35400 ?auto_35401 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_35399 ?auto_35403 ?auto_35402 ?auto_35401 ?auto_35400 ?auto_35398 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36057 - OBJ
      ?auto_36058 - OBJ
      ?auto_36059 - OBJ
      ?auto_36060 - OBJ
      ?auto_36061 - OBJ
      ?auto_36056 - LOCATION
    )
    :vars
    (
      ?auto_36063 - LOCATION
      ?auto_36064 - CITY
      ?auto_36062 - LOCATION
      ?auto_36066 - LOCATION
      ?auto_36065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36063 ?auto_36064 ) ( IN-CITY ?auto_36056 ?auto_36064 ) ( not ( = ?auto_36056 ?auto_36063 ) ) ( OBJ-AT ?auto_36058 ?auto_36063 ) ( OBJ-AT ?auto_36061 ?auto_36063 ) ( OBJ-AT ?auto_36060 ?auto_36063 ) ( IN-CITY ?auto_36062 ?auto_36064 ) ( not ( = ?auto_36056 ?auto_36062 ) ) ( OBJ-AT ?auto_36059 ?auto_36062 ) ( IN-CITY ?auto_36066 ?auto_36064 ) ( not ( = ?auto_36056 ?auto_36066 ) ) ( OBJ-AT ?auto_36057 ?auto_36066 ) ( TRUCK-AT ?auto_36065 ?auto_36056 ) ( not ( = ?auto_36057 ?auto_36059 ) ) ( not ( = ?auto_36062 ?auto_36066 ) ) ( not ( = ?auto_36057 ?auto_36060 ) ) ( not ( = ?auto_36059 ?auto_36060 ) ) ( not ( = ?auto_36063 ?auto_36062 ) ) ( not ( = ?auto_36063 ?auto_36066 ) ) ( not ( = ?auto_36057 ?auto_36061 ) ) ( not ( = ?auto_36059 ?auto_36061 ) ) ( not ( = ?auto_36060 ?auto_36061 ) ) ( not ( = ?auto_36057 ?auto_36058 ) ) ( not ( = ?auto_36059 ?auto_36058 ) ) ( not ( = ?auto_36060 ?auto_36058 ) ) ( not ( = ?auto_36061 ?auto_36058 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36057 ?auto_36059 ?auto_36060 ?auto_36058 ?auto_36061 ?auto_36056 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36104 - OBJ
      ?auto_36105 - OBJ
      ?auto_36106 - OBJ
      ?auto_36107 - OBJ
      ?auto_36108 - OBJ
      ?auto_36103 - LOCATION
    )
    :vars
    (
      ?auto_36110 - LOCATION
      ?auto_36111 - CITY
      ?auto_36109 - LOCATION
      ?auto_36113 - LOCATION
      ?auto_36112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36110 ?auto_36111 ) ( IN-CITY ?auto_36103 ?auto_36111 ) ( not ( = ?auto_36103 ?auto_36110 ) ) ( OBJ-AT ?auto_36105 ?auto_36110 ) ( OBJ-AT ?auto_36107 ?auto_36110 ) ( OBJ-AT ?auto_36108 ?auto_36110 ) ( IN-CITY ?auto_36109 ?auto_36111 ) ( not ( = ?auto_36103 ?auto_36109 ) ) ( OBJ-AT ?auto_36106 ?auto_36109 ) ( IN-CITY ?auto_36113 ?auto_36111 ) ( not ( = ?auto_36103 ?auto_36113 ) ) ( OBJ-AT ?auto_36104 ?auto_36113 ) ( TRUCK-AT ?auto_36112 ?auto_36103 ) ( not ( = ?auto_36104 ?auto_36106 ) ) ( not ( = ?auto_36109 ?auto_36113 ) ) ( not ( = ?auto_36104 ?auto_36108 ) ) ( not ( = ?auto_36106 ?auto_36108 ) ) ( not ( = ?auto_36110 ?auto_36109 ) ) ( not ( = ?auto_36110 ?auto_36113 ) ) ( not ( = ?auto_36104 ?auto_36107 ) ) ( not ( = ?auto_36106 ?auto_36107 ) ) ( not ( = ?auto_36108 ?auto_36107 ) ) ( not ( = ?auto_36104 ?auto_36105 ) ) ( not ( = ?auto_36106 ?auto_36105 ) ) ( not ( = ?auto_36108 ?auto_36105 ) ) ( not ( = ?auto_36107 ?auto_36105 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36104 ?auto_36106 ?auto_36108 ?auto_36105 ?auto_36107 ?auto_36103 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36301 - OBJ
      ?auto_36302 - OBJ
      ?auto_36303 - OBJ
      ?auto_36304 - OBJ
      ?auto_36305 - OBJ
      ?auto_36300 - LOCATION
    )
    :vars
    (
      ?auto_36307 - LOCATION
      ?auto_36308 - CITY
      ?auto_36306 - LOCATION
      ?auto_36310 - LOCATION
      ?auto_36309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36307 ?auto_36308 ) ( IN-CITY ?auto_36300 ?auto_36308 ) ( not ( = ?auto_36300 ?auto_36307 ) ) ( OBJ-AT ?auto_36302 ?auto_36307 ) ( OBJ-AT ?auto_36305 ?auto_36307 ) ( OBJ-AT ?auto_36303 ?auto_36307 ) ( IN-CITY ?auto_36306 ?auto_36308 ) ( not ( = ?auto_36300 ?auto_36306 ) ) ( OBJ-AT ?auto_36304 ?auto_36306 ) ( IN-CITY ?auto_36310 ?auto_36308 ) ( not ( = ?auto_36300 ?auto_36310 ) ) ( OBJ-AT ?auto_36301 ?auto_36310 ) ( TRUCK-AT ?auto_36309 ?auto_36300 ) ( not ( = ?auto_36301 ?auto_36304 ) ) ( not ( = ?auto_36306 ?auto_36310 ) ) ( not ( = ?auto_36301 ?auto_36303 ) ) ( not ( = ?auto_36304 ?auto_36303 ) ) ( not ( = ?auto_36307 ?auto_36306 ) ) ( not ( = ?auto_36307 ?auto_36310 ) ) ( not ( = ?auto_36301 ?auto_36305 ) ) ( not ( = ?auto_36304 ?auto_36305 ) ) ( not ( = ?auto_36303 ?auto_36305 ) ) ( not ( = ?auto_36301 ?auto_36302 ) ) ( not ( = ?auto_36304 ?auto_36302 ) ) ( not ( = ?auto_36303 ?auto_36302 ) ) ( not ( = ?auto_36305 ?auto_36302 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36301 ?auto_36304 ?auto_36303 ?auto_36302 ?auto_36305 ?auto_36300 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36399 - OBJ
      ?auto_36400 - OBJ
      ?auto_36401 - OBJ
      ?auto_36402 - OBJ
      ?auto_36403 - OBJ
      ?auto_36398 - LOCATION
    )
    :vars
    (
      ?auto_36405 - LOCATION
      ?auto_36406 - CITY
      ?auto_36404 - LOCATION
      ?auto_36408 - LOCATION
      ?auto_36407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36405 ?auto_36406 ) ( IN-CITY ?auto_36398 ?auto_36406 ) ( not ( = ?auto_36398 ?auto_36405 ) ) ( OBJ-AT ?auto_36400 ?auto_36405 ) ( OBJ-AT ?auto_36402 ?auto_36405 ) ( OBJ-AT ?auto_36401 ?auto_36405 ) ( IN-CITY ?auto_36404 ?auto_36406 ) ( not ( = ?auto_36398 ?auto_36404 ) ) ( OBJ-AT ?auto_36403 ?auto_36404 ) ( IN-CITY ?auto_36408 ?auto_36406 ) ( not ( = ?auto_36398 ?auto_36408 ) ) ( OBJ-AT ?auto_36399 ?auto_36408 ) ( TRUCK-AT ?auto_36407 ?auto_36398 ) ( not ( = ?auto_36399 ?auto_36403 ) ) ( not ( = ?auto_36404 ?auto_36408 ) ) ( not ( = ?auto_36399 ?auto_36401 ) ) ( not ( = ?auto_36403 ?auto_36401 ) ) ( not ( = ?auto_36405 ?auto_36404 ) ) ( not ( = ?auto_36405 ?auto_36408 ) ) ( not ( = ?auto_36399 ?auto_36402 ) ) ( not ( = ?auto_36403 ?auto_36402 ) ) ( not ( = ?auto_36401 ?auto_36402 ) ) ( not ( = ?auto_36399 ?auto_36400 ) ) ( not ( = ?auto_36403 ?auto_36400 ) ) ( not ( = ?auto_36401 ?auto_36400 ) ) ( not ( = ?auto_36402 ?auto_36400 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36399 ?auto_36403 ?auto_36401 ?auto_36400 ?auto_36402 ?auto_36398 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36596 - OBJ
      ?auto_36597 - OBJ
      ?auto_36598 - OBJ
      ?auto_36599 - OBJ
      ?auto_36600 - OBJ
      ?auto_36595 - LOCATION
    )
    :vars
    (
      ?auto_36602 - LOCATION
      ?auto_36603 - CITY
      ?auto_36601 - LOCATION
      ?auto_36605 - LOCATION
      ?auto_36604 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36602 ?auto_36603 ) ( IN-CITY ?auto_36595 ?auto_36603 ) ( not ( = ?auto_36595 ?auto_36602 ) ) ( OBJ-AT ?auto_36597 ?auto_36602 ) ( OBJ-AT ?auto_36598 ?auto_36602 ) ( OBJ-AT ?auto_36600 ?auto_36602 ) ( IN-CITY ?auto_36601 ?auto_36603 ) ( not ( = ?auto_36595 ?auto_36601 ) ) ( OBJ-AT ?auto_36599 ?auto_36601 ) ( IN-CITY ?auto_36605 ?auto_36603 ) ( not ( = ?auto_36595 ?auto_36605 ) ) ( OBJ-AT ?auto_36596 ?auto_36605 ) ( TRUCK-AT ?auto_36604 ?auto_36595 ) ( not ( = ?auto_36596 ?auto_36599 ) ) ( not ( = ?auto_36601 ?auto_36605 ) ) ( not ( = ?auto_36596 ?auto_36600 ) ) ( not ( = ?auto_36599 ?auto_36600 ) ) ( not ( = ?auto_36602 ?auto_36601 ) ) ( not ( = ?auto_36602 ?auto_36605 ) ) ( not ( = ?auto_36596 ?auto_36598 ) ) ( not ( = ?auto_36599 ?auto_36598 ) ) ( not ( = ?auto_36600 ?auto_36598 ) ) ( not ( = ?auto_36596 ?auto_36597 ) ) ( not ( = ?auto_36599 ?auto_36597 ) ) ( not ( = ?auto_36600 ?auto_36597 ) ) ( not ( = ?auto_36598 ?auto_36597 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36596 ?auto_36599 ?auto_36600 ?auto_36597 ?auto_36598 ?auto_36595 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_36643 - OBJ
      ?auto_36644 - OBJ
      ?auto_36645 - OBJ
      ?auto_36646 - OBJ
      ?auto_36647 - OBJ
      ?auto_36642 - LOCATION
    )
    :vars
    (
      ?auto_36649 - LOCATION
      ?auto_36650 - CITY
      ?auto_36648 - LOCATION
      ?auto_36652 - LOCATION
      ?auto_36651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_36649 ?auto_36650 ) ( IN-CITY ?auto_36642 ?auto_36650 ) ( not ( = ?auto_36642 ?auto_36649 ) ) ( OBJ-AT ?auto_36644 ?auto_36649 ) ( OBJ-AT ?auto_36645 ?auto_36649 ) ( OBJ-AT ?auto_36646 ?auto_36649 ) ( IN-CITY ?auto_36648 ?auto_36650 ) ( not ( = ?auto_36642 ?auto_36648 ) ) ( OBJ-AT ?auto_36647 ?auto_36648 ) ( IN-CITY ?auto_36652 ?auto_36650 ) ( not ( = ?auto_36642 ?auto_36652 ) ) ( OBJ-AT ?auto_36643 ?auto_36652 ) ( TRUCK-AT ?auto_36651 ?auto_36642 ) ( not ( = ?auto_36643 ?auto_36647 ) ) ( not ( = ?auto_36648 ?auto_36652 ) ) ( not ( = ?auto_36643 ?auto_36646 ) ) ( not ( = ?auto_36647 ?auto_36646 ) ) ( not ( = ?auto_36649 ?auto_36648 ) ) ( not ( = ?auto_36649 ?auto_36652 ) ) ( not ( = ?auto_36643 ?auto_36645 ) ) ( not ( = ?auto_36647 ?auto_36645 ) ) ( not ( = ?auto_36646 ?auto_36645 ) ) ( not ( = ?auto_36643 ?auto_36644 ) ) ( not ( = ?auto_36647 ?auto_36644 ) ) ( not ( = ?auto_36646 ?auto_36644 ) ) ( not ( = ?auto_36645 ?auto_36644 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_36643 ?auto_36647 ?auto_36646 ?auto_36644 ?auto_36645 ?auto_36642 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37401 - OBJ
      ?auto_37402 - OBJ
      ?auto_37403 - OBJ
      ?auto_37404 - OBJ
      ?auto_37405 - OBJ
      ?auto_37400 - LOCATION
    )
    :vars
    (
      ?auto_37407 - LOCATION
      ?auto_37408 - CITY
      ?auto_37406 - LOCATION
      ?auto_37410 - LOCATION
      ?auto_37409 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37407 ?auto_37408 ) ( IN-CITY ?auto_37400 ?auto_37408 ) ( not ( = ?auto_37400 ?auto_37407 ) ) ( OBJ-AT ?auto_37405 ?auto_37407 ) ( OBJ-AT ?auto_37404 ?auto_37407 ) ( OBJ-AT ?auto_37403 ?auto_37407 ) ( IN-CITY ?auto_37406 ?auto_37408 ) ( not ( = ?auto_37400 ?auto_37406 ) ) ( OBJ-AT ?auto_37401 ?auto_37406 ) ( IN-CITY ?auto_37410 ?auto_37408 ) ( not ( = ?auto_37400 ?auto_37410 ) ) ( OBJ-AT ?auto_37402 ?auto_37410 ) ( TRUCK-AT ?auto_37409 ?auto_37400 ) ( not ( = ?auto_37402 ?auto_37401 ) ) ( not ( = ?auto_37406 ?auto_37410 ) ) ( not ( = ?auto_37402 ?auto_37403 ) ) ( not ( = ?auto_37401 ?auto_37403 ) ) ( not ( = ?auto_37407 ?auto_37406 ) ) ( not ( = ?auto_37407 ?auto_37410 ) ) ( not ( = ?auto_37402 ?auto_37404 ) ) ( not ( = ?auto_37401 ?auto_37404 ) ) ( not ( = ?auto_37403 ?auto_37404 ) ) ( not ( = ?auto_37402 ?auto_37405 ) ) ( not ( = ?auto_37401 ?auto_37405 ) ) ( not ( = ?auto_37403 ?auto_37405 ) ) ( not ( = ?auto_37404 ?auto_37405 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37402 ?auto_37401 ?auto_37403 ?auto_37405 ?auto_37404 ?auto_37400 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37448 - OBJ
      ?auto_37449 - OBJ
      ?auto_37450 - OBJ
      ?auto_37451 - OBJ
      ?auto_37452 - OBJ
      ?auto_37447 - LOCATION
    )
    :vars
    (
      ?auto_37454 - LOCATION
      ?auto_37455 - CITY
      ?auto_37453 - LOCATION
      ?auto_37457 - LOCATION
      ?auto_37456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37454 ?auto_37455 ) ( IN-CITY ?auto_37447 ?auto_37455 ) ( not ( = ?auto_37447 ?auto_37454 ) ) ( OBJ-AT ?auto_37451 ?auto_37454 ) ( OBJ-AT ?auto_37452 ?auto_37454 ) ( OBJ-AT ?auto_37450 ?auto_37454 ) ( IN-CITY ?auto_37453 ?auto_37455 ) ( not ( = ?auto_37447 ?auto_37453 ) ) ( OBJ-AT ?auto_37448 ?auto_37453 ) ( IN-CITY ?auto_37457 ?auto_37455 ) ( not ( = ?auto_37447 ?auto_37457 ) ) ( OBJ-AT ?auto_37449 ?auto_37457 ) ( TRUCK-AT ?auto_37456 ?auto_37447 ) ( not ( = ?auto_37449 ?auto_37448 ) ) ( not ( = ?auto_37453 ?auto_37457 ) ) ( not ( = ?auto_37449 ?auto_37450 ) ) ( not ( = ?auto_37448 ?auto_37450 ) ) ( not ( = ?auto_37454 ?auto_37453 ) ) ( not ( = ?auto_37454 ?auto_37457 ) ) ( not ( = ?auto_37449 ?auto_37452 ) ) ( not ( = ?auto_37448 ?auto_37452 ) ) ( not ( = ?auto_37450 ?auto_37452 ) ) ( not ( = ?auto_37449 ?auto_37451 ) ) ( not ( = ?auto_37448 ?auto_37451 ) ) ( not ( = ?auto_37450 ?auto_37451 ) ) ( not ( = ?auto_37452 ?auto_37451 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37449 ?auto_37448 ?auto_37450 ?auto_37451 ?auto_37452 ?auto_37447 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37495 - OBJ
      ?auto_37496 - OBJ
      ?auto_37497 - OBJ
      ?auto_37498 - OBJ
      ?auto_37499 - OBJ
      ?auto_37494 - LOCATION
    )
    :vars
    (
      ?auto_37501 - LOCATION
      ?auto_37502 - CITY
      ?auto_37500 - LOCATION
      ?auto_37504 - LOCATION
      ?auto_37503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37501 ?auto_37502 ) ( IN-CITY ?auto_37494 ?auto_37502 ) ( not ( = ?auto_37494 ?auto_37501 ) ) ( OBJ-AT ?auto_37499 ?auto_37501 ) ( OBJ-AT ?auto_37497 ?auto_37501 ) ( OBJ-AT ?auto_37498 ?auto_37501 ) ( IN-CITY ?auto_37500 ?auto_37502 ) ( not ( = ?auto_37494 ?auto_37500 ) ) ( OBJ-AT ?auto_37495 ?auto_37500 ) ( IN-CITY ?auto_37504 ?auto_37502 ) ( not ( = ?auto_37494 ?auto_37504 ) ) ( OBJ-AT ?auto_37496 ?auto_37504 ) ( TRUCK-AT ?auto_37503 ?auto_37494 ) ( not ( = ?auto_37496 ?auto_37495 ) ) ( not ( = ?auto_37500 ?auto_37504 ) ) ( not ( = ?auto_37496 ?auto_37498 ) ) ( not ( = ?auto_37495 ?auto_37498 ) ) ( not ( = ?auto_37501 ?auto_37500 ) ) ( not ( = ?auto_37501 ?auto_37504 ) ) ( not ( = ?auto_37496 ?auto_37497 ) ) ( not ( = ?auto_37495 ?auto_37497 ) ) ( not ( = ?auto_37498 ?auto_37497 ) ) ( not ( = ?auto_37496 ?auto_37499 ) ) ( not ( = ?auto_37495 ?auto_37499 ) ) ( not ( = ?auto_37498 ?auto_37499 ) ) ( not ( = ?auto_37497 ?auto_37499 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37496 ?auto_37495 ?auto_37498 ?auto_37499 ?auto_37497 ?auto_37494 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37542 - OBJ
      ?auto_37543 - OBJ
      ?auto_37544 - OBJ
      ?auto_37545 - OBJ
      ?auto_37546 - OBJ
      ?auto_37541 - LOCATION
    )
    :vars
    (
      ?auto_37548 - LOCATION
      ?auto_37549 - CITY
      ?auto_37547 - LOCATION
      ?auto_37551 - LOCATION
      ?auto_37550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37548 ?auto_37549 ) ( IN-CITY ?auto_37541 ?auto_37549 ) ( not ( = ?auto_37541 ?auto_37548 ) ) ( OBJ-AT ?auto_37545 ?auto_37548 ) ( OBJ-AT ?auto_37544 ?auto_37548 ) ( OBJ-AT ?auto_37546 ?auto_37548 ) ( IN-CITY ?auto_37547 ?auto_37549 ) ( not ( = ?auto_37541 ?auto_37547 ) ) ( OBJ-AT ?auto_37542 ?auto_37547 ) ( IN-CITY ?auto_37551 ?auto_37549 ) ( not ( = ?auto_37541 ?auto_37551 ) ) ( OBJ-AT ?auto_37543 ?auto_37551 ) ( TRUCK-AT ?auto_37550 ?auto_37541 ) ( not ( = ?auto_37543 ?auto_37542 ) ) ( not ( = ?auto_37547 ?auto_37551 ) ) ( not ( = ?auto_37543 ?auto_37546 ) ) ( not ( = ?auto_37542 ?auto_37546 ) ) ( not ( = ?auto_37548 ?auto_37547 ) ) ( not ( = ?auto_37548 ?auto_37551 ) ) ( not ( = ?auto_37543 ?auto_37544 ) ) ( not ( = ?auto_37542 ?auto_37544 ) ) ( not ( = ?auto_37546 ?auto_37544 ) ) ( not ( = ?auto_37543 ?auto_37545 ) ) ( not ( = ?auto_37542 ?auto_37545 ) ) ( not ( = ?auto_37546 ?auto_37545 ) ) ( not ( = ?auto_37544 ?auto_37545 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37543 ?auto_37542 ?auto_37546 ?auto_37545 ?auto_37544 ?auto_37541 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37739 - OBJ
      ?auto_37740 - OBJ
      ?auto_37741 - OBJ
      ?auto_37742 - OBJ
      ?auto_37743 - OBJ
      ?auto_37738 - LOCATION
    )
    :vars
    (
      ?auto_37745 - LOCATION
      ?auto_37746 - CITY
      ?auto_37744 - LOCATION
      ?auto_37748 - LOCATION
      ?auto_37747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37745 ?auto_37746 ) ( IN-CITY ?auto_37738 ?auto_37746 ) ( not ( = ?auto_37738 ?auto_37745 ) ) ( OBJ-AT ?auto_37741 ?auto_37745 ) ( OBJ-AT ?auto_37743 ?auto_37745 ) ( OBJ-AT ?auto_37742 ?auto_37745 ) ( IN-CITY ?auto_37744 ?auto_37746 ) ( not ( = ?auto_37738 ?auto_37744 ) ) ( OBJ-AT ?auto_37739 ?auto_37744 ) ( IN-CITY ?auto_37748 ?auto_37746 ) ( not ( = ?auto_37738 ?auto_37748 ) ) ( OBJ-AT ?auto_37740 ?auto_37748 ) ( TRUCK-AT ?auto_37747 ?auto_37738 ) ( not ( = ?auto_37740 ?auto_37739 ) ) ( not ( = ?auto_37744 ?auto_37748 ) ) ( not ( = ?auto_37740 ?auto_37742 ) ) ( not ( = ?auto_37739 ?auto_37742 ) ) ( not ( = ?auto_37745 ?auto_37744 ) ) ( not ( = ?auto_37745 ?auto_37748 ) ) ( not ( = ?auto_37740 ?auto_37743 ) ) ( not ( = ?auto_37739 ?auto_37743 ) ) ( not ( = ?auto_37742 ?auto_37743 ) ) ( not ( = ?auto_37740 ?auto_37741 ) ) ( not ( = ?auto_37739 ?auto_37741 ) ) ( not ( = ?auto_37742 ?auto_37741 ) ) ( not ( = ?auto_37743 ?auto_37741 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37740 ?auto_37739 ?auto_37742 ?auto_37741 ?auto_37743 ?auto_37738 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_37786 - OBJ
      ?auto_37787 - OBJ
      ?auto_37788 - OBJ
      ?auto_37789 - OBJ
      ?auto_37790 - OBJ
      ?auto_37785 - LOCATION
    )
    :vars
    (
      ?auto_37792 - LOCATION
      ?auto_37793 - CITY
      ?auto_37791 - LOCATION
      ?auto_37795 - LOCATION
      ?auto_37794 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_37792 ?auto_37793 ) ( IN-CITY ?auto_37785 ?auto_37793 ) ( not ( = ?auto_37785 ?auto_37792 ) ) ( OBJ-AT ?auto_37788 ?auto_37792 ) ( OBJ-AT ?auto_37789 ?auto_37792 ) ( OBJ-AT ?auto_37790 ?auto_37792 ) ( IN-CITY ?auto_37791 ?auto_37793 ) ( not ( = ?auto_37785 ?auto_37791 ) ) ( OBJ-AT ?auto_37786 ?auto_37791 ) ( IN-CITY ?auto_37795 ?auto_37793 ) ( not ( = ?auto_37785 ?auto_37795 ) ) ( OBJ-AT ?auto_37787 ?auto_37795 ) ( TRUCK-AT ?auto_37794 ?auto_37785 ) ( not ( = ?auto_37787 ?auto_37786 ) ) ( not ( = ?auto_37791 ?auto_37795 ) ) ( not ( = ?auto_37787 ?auto_37790 ) ) ( not ( = ?auto_37786 ?auto_37790 ) ) ( not ( = ?auto_37792 ?auto_37791 ) ) ( not ( = ?auto_37792 ?auto_37795 ) ) ( not ( = ?auto_37787 ?auto_37789 ) ) ( not ( = ?auto_37786 ?auto_37789 ) ) ( not ( = ?auto_37790 ?auto_37789 ) ) ( not ( = ?auto_37787 ?auto_37788 ) ) ( not ( = ?auto_37786 ?auto_37788 ) ) ( not ( = ?auto_37790 ?auto_37788 ) ) ( not ( = ?auto_37789 ?auto_37788 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_37787 ?auto_37786 ?auto_37790 ?auto_37788 ?auto_37789 ?auto_37785 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38702 - OBJ
      ?auto_38703 - OBJ
      ?auto_38704 - OBJ
      ?auto_38705 - OBJ
      ?auto_38706 - OBJ
      ?auto_38701 - LOCATION
    )
    :vars
    (
      ?auto_38708 - LOCATION
      ?auto_38709 - CITY
      ?auto_38707 - LOCATION
      ?auto_38711 - LOCATION
      ?auto_38710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38708 ?auto_38709 ) ( IN-CITY ?auto_38701 ?auto_38709 ) ( not ( = ?auto_38701 ?auto_38708 ) ) ( OBJ-AT ?auto_38706 ?auto_38708 ) ( OBJ-AT ?auto_38705 ?auto_38708 ) ( OBJ-AT ?auto_38703 ?auto_38708 ) ( IN-CITY ?auto_38707 ?auto_38709 ) ( not ( = ?auto_38701 ?auto_38707 ) ) ( OBJ-AT ?auto_38702 ?auto_38707 ) ( IN-CITY ?auto_38711 ?auto_38709 ) ( not ( = ?auto_38701 ?auto_38711 ) ) ( OBJ-AT ?auto_38704 ?auto_38711 ) ( TRUCK-AT ?auto_38710 ?auto_38701 ) ( not ( = ?auto_38704 ?auto_38702 ) ) ( not ( = ?auto_38707 ?auto_38711 ) ) ( not ( = ?auto_38704 ?auto_38703 ) ) ( not ( = ?auto_38702 ?auto_38703 ) ) ( not ( = ?auto_38708 ?auto_38707 ) ) ( not ( = ?auto_38708 ?auto_38711 ) ) ( not ( = ?auto_38704 ?auto_38705 ) ) ( not ( = ?auto_38702 ?auto_38705 ) ) ( not ( = ?auto_38703 ?auto_38705 ) ) ( not ( = ?auto_38704 ?auto_38706 ) ) ( not ( = ?auto_38702 ?auto_38706 ) ) ( not ( = ?auto_38703 ?auto_38706 ) ) ( not ( = ?auto_38705 ?auto_38706 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38704 ?auto_38702 ?auto_38703 ?auto_38706 ?auto_38705 ?auto_38701 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38749 - OBJ
      ?auto_38750 - OBJ
      ?auto_38751 - OBJ
      ?auto_38752 - OBJ
      ?auto_38753 - OBJ
      ?auto_38748 - LOCATION
    )
    :vars
    (
      ?auto_38755 - LOCATION
      ?auto_38756 - CITY
      ?auto_38754 - LOCATION
      ?auto_38758 - LOCATION
      ?auto_38757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_38755 ?auto_38756 ) ( IN-CITY ?auto_38748 ?auto_38756 ) ( not ( = ?auto_38748 ?auto_38755 ) ) ( OBJ-AT ?auto_38752 ?auto_38755 ) ( OBJ-AT ?auto_38753 ?auto_38755 ) ( OBJ-AT ?auto_38750 ?auto_38755 ) ( IN-CITY ?auto_38754 ?auto_38756 ) ( not ( = ?auto_38748 ?auto_38754 ) ) ( OBJ-AT ?auto_38749 ?auto_38754 ) ( IN-CITY ?auto_38758 ?auto_38756 ) ( not ( = ?auto_38748 ?auto_38758 ) ) ( OBJ-AT ?auto_38751 ?auto_38758 ) ( TRUCK-AT ?auto_38757 ?auto_38748 ) ( not ( = ?auto_38751 ?auto_38749 ) ) ( not ( = ?auto_38754 ?auto_38758 ) ) ( not ( = ?auto_38751 ?auto_38750 ) ) ( not ( = ?auto_38749 ?auto_38750 ) ) ( not ( = ?auto_38755 ?auto_38754 ) ) ( not ( = ?auto_38755 ?auto_38758 ) ) ( not ( = ?auto_38751 ?auto_38753 ) ) ( not ( = ?auto_38749 ?auto_38753 ) ) ( not ( = ?auto_38750 ?auto_38753 ) ) ( not ( = ?auto_38751 ?auto_38752 ) ) ( not ( = ?auto_38749 ?auto_38752 ) ) ( not ( = ?auto_38750 ?auto_38752 ) ) ( not ( = ?auto_38753 ?auto_38752 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_38751 ?auto_38749 ?auto_38750 ?auto_38752 ?auto_38753 ?auto_38748 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_38998 - OBJ
      ?auto_38999 - OBJ
      ?auto_39000 - OBJ
      ?auto_39001 - OBJ
      ?auto_39002 - OBJ
      ?auto_38997 - LOCATION
    )
    :vars
    (
      ?auto_39004 - LOCATION
      ?auto_39005 - CITY
      ?auto_39003 - LOCATION
      ?auto_39007 - LOCATION
      ?auto_39006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39004 ?auto_39005 ) ( IN-CITY ?auto_38997 ?auto_39005 ) ( not ( = ?auto_38997 ?auto_39004 ) ) ( OBJ-AT ?auto_39002 ?auto_39004 ) ( OBJ-AT ?auto_39000 ?auto_39004 ) ( OBJ-AT ?auto_38999 ?auto_39004 ) ( IN-CITY ?auto_39003 ?auto_39005 ) ( not ( = ?auto_38997 ?auto_39003 ) ) ( OBJ-AT ?auto_38998 ?auto_39003 ) ( IN-CITY ?auto_39007 ?auto_39005 ) ( not ( = ?auto_38997 ?auto_39007 ) ) ( OBJ-AT ?auto_39001 ?auto_39007 ) ( TRUCK-AT ?auto_39006 ?auto_38997 ) ( not ( = ?auto_39001 ?auto_38998 ) ) ( not ( = ?auto_39003 ?auto_39007 ) ) ( not ( = ?auto_39001 ?auto_38999 ) ) ( not ( = ?auto_38998 ?auto_38999 ) ) ( not ( = ?auto_39004 ?auto_39003 ) ) ( not ( = ?auto_39004 ?auto_39007 ) ) ( not ( = ?auto_39001 ?auto_39000 ) ) ( not ( = ?auto_38998 ?auto_39000 ) ) ( not ( = ?auto_38999 ?auto_39000 ) ) ( not ( = ?auto_39001 ?auto_39002 ) ) ( not ( = ?auto_38998 ?auto_39002 ) ) ( not ( = ?auto_38999 ?auto_39002 ) ) ( not ( = ?auto_39000 ?auto_39002 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39001 ?auto_38998 ?auto_38999 ?auto_39002 ?auto_39000 ?auto_38997 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39045 - OBJ
      ?auto_39046 - OBJ
      ?auto_39047 - OBJ
      ?auto_39048 - OBJ
      ?auto_39049 - OBJ
      ?auto_39044 - LOCATION
    )
    :vars
    (
      ?auto_39051 - LOCATION
      ?auto_39052 - CITY
      ?auto_39050 - LOCATION
      ?auto_39054 - LOCATION
      ?auto_39053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39051 ?auto_39052 ) ( IN-CITY ?auto_39044 ?auto_39052 ) ( not ( = ?auto_39044 ?auto_39051 ) ) ( OBJ-AT ?auto_39048 ?auto_39051 ) ( OBJ-AT ?auto_39047 ?auto_39051 ) ( OBJ-AT ?auto_39046 ?auto_39051 ) ( IN-CITY ?auto_39050 ?auto_39052 ) ( not ( = ?auto_39044 ?auto_39050 ) ) ( OBJ-AT ?auto_39045 ?auto_39050 ) ( IN-CITY ?auto_39054 ?auto_39052 ) ( not ( = ?auto_39044 ?auto_39054 ) ) ( OBJ-AT ?auto_39049 ?auto_39054 ) ( TRUCK-AT ?auto_39053 ?auto_39044 ) ( not ( = ?auto_39049 ?auto_39045 ) ) ( not ( = ?auto_39050 ?auto_39054 ) ) ( not ( = ?auto_39049 ?auto_39046 ) ) ( not ( = ?auto_39045 ?auto_39046 ) ) ( not ( = ?auto_39051 ?auto_39050 ) ) ( not ( = ?auto_39051 ?auto_39054 ) ) ( not ( = ?auto_39049 ?auto_39047 ) ) ( not ( = ?auto_39045 ?auto_39047 ) ) ( not ( = ?auto_39046 ?auto_39047 ) ) ( not ( = ?auto_39049 ?auto_39048 ) ) ( not ( = ?auto_39045 ?auto_39048 ) ) ( not ( = ?auto_39046 ?auto_39048 ) ) ( not ( = ?auto_39047 ?auto_39048 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39049 ?auto_39045 ?auto_39046 ?auto_39048 ?auto_39047 ?auto_39044 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39140 - OBJ
      ?auto_39141 - OBJ
      ?auto_39142 - OBJ
      ?auto_39143 - OBJ
      ?auto_39144 - OBJ
      ?auto_39139 - LOCATION
    )
    :vars
    (
      ?auto_39146 - LOCATION
      ?auto_39147 - CITY
      ?auto_39145 - LOCATION
      ?auto_39149 - LOCATION
      ?auto_39148 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39146 ?auto_39147 ) ( IN-CITY ?auto_39139 ?auto_39147 ) ( not ( = ?auto_39139 ?auto_39146 ) ) ( OBJ-AT ?auto_39142 ?auto_39146 ) ( OBJ-AT ?auto_39144 ?auto_39146 ) ( OBJ-AT ?auto_39141 ?auto_39146 ) ( IN-CITY ?auto_39145 ?auto_39147 ) ( not ( = ?auto_39139 ?auto_39145 ) ) ( OBJ-AT ?auto_39140 ?auto_39145 ) ( IN-CITY ?auto_39149 ?auto_39147 ) ( not ( = ?auto_39139 ?auto_39149 ) ) ( OBJ-AT ?auto_39143 ?auto_39149 ) ( TRUCK-AT ?auto_39148 ?auto_39139 ) ( not ( = ?auto_39143 ?auto_39140 ) ) ( not ( = ?auto_39145 ?auto_39149 ) ) ( not ( = ?auto_39143 ?auto_39141 ) ) ( not ( = ?auto_39140 ?auto_39141 ) ) ( not ( = ?auto_39146 ?auto_39145 ) ) ( not ( = ?auto_39146 ?auto_39149 ) ) ( not ( = ?auto_39143 ?auto_39144 ) ) ( not ( = ?auto_39140 ?auto_39144 ) ) ( not ( = ?auto_39141 ?auto_39144 ) ) ( not ( = ?auto_39143 ?auto_39142 ) ) ( not ( = ?auto_39140 ?auto_39142 ) ) ( not ( = ?auto_39141 ?auto_39142 ) ) ( not ( = ?auto_39144 ?auto_39142 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39143 ?auto_39140 ?auto_39141 ?auto_39142 ?auto_39144 ?auto_39139 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39289 - OBJ
      ?auto_39290 - OBJ
      ?auto_39291 - OBJ
      ?auto_39292 - OBJ
      ?auto_39293 - OBJ
      ?auto_39288 - LOCATION
    )
    :vars
    (
      ?auto_39295 - LOCATION
      ?auto_39296 - CITY
      ?auto_39294 - LOCATION
      ?auto_39298 - LOCATION
      ?auto_39297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39295 ?auto_39296 ) ( IN-CITY ?auto_39288 ?auto_39296 ) ( not ( = ?auto_39288 ?auto_39295 ) ) ( OBJ-AT ?auto_39291 ?auto_39295 ) ( OBJ-AT ?auto_39292 ?auto_39295 ) ( OBJ-AT ?auto_39290 ?auto_39295 ) ( IN-CITY ?auto_39294 ?auto_39296 ) ( not ( = ?auto_39288 ?auto_39294 ) ) ( OBJ-AT ?auto_39289 ?auto_39294 ) ( IN-CITY ?auto_39298 ?auto_39296 ) ( not ( = ?auto_39288 ?auto_39298 ) ) ( OBJ-AT ?auto_39293 ?auto_39298 ) ( TRUCK-AT ?auto_39297 ?auto_39288 ) ( not ( = ?auto_39293 ?auto_39289 ) ) ( not ( = ?auto_39294 ?auto_39298 ) ) ( not ( = ?auto_39293 ?auto_39290 ) ) ( not ( = ?auto_39289 ?auto_39290 ) ) ( not ( = ?auto_39295 ?auto_39294 ) ) ( not ( = ?auto_39295 ?auto_39298 ) ) ( not ( = ?auto_39293 ?auto_39292 ) ) ( not ( = ?auto_39289 ?auto_39292 ) ) ( not ( = ?auto_39290 ?auto_39292 ) ) ( not ( = ?auto_39293 ?auto_39291 ) ) ( not ( = ?auto_39289 ?auto_39291 ) ) ( not ( = ?auto_39290 ?auto_39291 ) ) ( not ( = ?auto_39292 ?auto_39291 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39293 ?auto_39289 ?auto_39290 ?auto_39291 ?auto_39292 ?auto_39288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39435 - OBJ
      ?auto_39436 - OBJ
      ?auto_39437 - OBJ
      ?auto_39438 - OBJ
      ?auto_39439 - OBJ
      ?auto_39434 - LOCATION
    )
    :vars
    (
      ?auto_39441 - LOCATION
      ?auto_39442 - CITY
      ?auto_39440 - LOCATION
      ?auto_39444 - LOCATION
      ?auto_39443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39441 ?auto_39442 ) ( IN-CITY ?auto_39434 ?auto_39442 ) ( not ( = ?auto_39434 ?auto_39441 ) ) ( OBJ-AT ?auto_39439 ?auto_39441 ) ( OBJ-AT ?auto_39436 ?auto_39441 ) ( OBJ-AT ?auto_39438 ?auto_39441 ) ( IN-CITY ?auto_39440 ?auto_39442 ) ( not ( = ?auto_39434 ?auto_39440 ) ) ( OBJ-AT ?auto_39435 ?auto_39440 ) ( IN-CITY ?auto_39444 ?auto_39442 ) ( not ( = ?auto_39434 ?auto_39444 ) ) ( OBJ-AT ?auto_39437 ?auto_39444 ) ( TRUCK-AT ?auto_39443 ?auto_39434 ) ( not ( = ?auto_39437 ?auto_39435 ) ) ( not ( = ?auto_39440 ?auto_39444 ) ) ( not ( = ?auto_39437 ?auto_39438 ) ) ( not ( = ?auto_39435 ?auto_39438 ) ) ( not ( = ?auto_39441 ?auto_39440 ) ) ( not ( = ?auto_39441 ?auto_39444 ) ) ( not ( = ?auto_39437 ?auto_39436 ) ) ( not ( = ?auto_39435 ?auto_39436 ) ) ( not ( = ?auto_39438 ?auto_39436 ) ) ( not ( = ?auto_39437 ?auto_39439 ) ) ( not ( = ?auto_39435 ?auto_39439 ) ) ( not ( = ?auto_39438 ?auto_39439 ) ) ( not ( = ?auto_39436 ?auto_39439 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39437 ?auto_39435 ?auto_39438 ?auto_39439 ?auto_39436 ?auto_39434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39482 - OBJ
      ?auto_39483 - OBJ
      ?auto_39484 - OBJ
      ?auto_39485 - OBJ
      ?auto_39486 - OBJ
      ?auto_39481 - LOCATION
    )
    :vars
    (
      ?auto_39488 - LOCATION
      ?auto_39489 - CITY
      ?auto_39487 - LOCATION
      ?auto_39491 - LOCATION
      ?auto_39490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39488 ?auto_39489 ) ( IN-CITY ?auto_39481 ?auto_39489 ) ( not ( = ?auto_39481 ?auto_39488 ) ) ( OBJ-AT ?auto_39485 ?auto_39488 ) ( OBJ-AT ?auto_39483 ?auto_39488 ) ( OBJ-AT ?auto_39486 ?auto_39488 ) ( IN-CITY ?auto_39487 ?auto_39489 ) ( not ( = ?auto_39481 ?auto_39487 ) ) ( OBJ-AT ?auto_39482 ?auto_39487 ) ( IN-CITY ?auto_39491 ?auto_39489 ) ( not ( = ?auto_39481 ?auto_39491 ) ) ( OBJ-AT ?auto_39484 ?auto_39491 ) ( TRUCK-AT ?auto_39490 ?auto_39481 ) ( not ( = ?auto_39484 ?auto_39482 ) ) ( not ( = ?auto_39487 ?auto_39491 ) ) ( not ( = ?auto_39484 ?auto_39486 ) ) ( not ( = ?auto_39482 ?auto_39486 ) ) ( not ( = ?auto_39488 ?auto_39487 ) ) ( not ( = ?auto_39488 ?auto_39491 ) ) ( not ( = ?auto_39484 ?auto_39483 ) ) ( not ( = ?auto_39482 ?auto_39483 ) ) ( not ( = ?auto_39486 ?auto_39483 ) ) ( not ( = ?auto_39484 ?auto_39485 ) ) ( not ( = ?auto_39482 ?auto_39485 ) ) ( not ( = ?auto_39486 ?auto_39485 ) ) ( not ( = ?auto_39483 ?auto_39485 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39484 ?auto_39482 ?auto_39486 ?auto_39485 ?auto_39483 ?auto_39481 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39630 - OBJ
      ?auto_39631 - OBJ
      ?auto_39632 - OBJ
      ?auto_39633 - OBJ
      ?auto_39634 - OBJ
      ?auto_39629 - LOCATION
    )
    :vars
    (
      ?auto_39636 - LOCATION
      ?auto_39637 - CITY
      ?auto_39635 - LOCATION
      ?auto_39639 - LOCATION
      ?auto_39638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39636 ?auto_39637 ) ( IN-CITY ?auto_39629 ?auto_39637 ) ( not ( = ?auto_39629 ?auto_39636 ) ) ( OBJ-AT ?auto_39634 ?auto_39636 ) ( OBJ-AT ?auto_39631 ?auto_39636 ) ( OBJ-AT ?auto_39632 ?auto_39636 ) ( IN-CITY ?auto_39635 ?auto_39637 ) ( not ( = ?auto_39629 ?auto_39635 ) ) ( OBJ-AT ?auto_39630 ?auto_39635 ) ( IN-CITY ?auto_39639 ?auto_39637 ) ( not ( = ?auto_39629 ?auto_39639 ) ) ( OBJ-AT ?auto_39633 ?auto_39639 ) ( TRUCK-AT ?auto_39638 ?auto_39629 ) ( not ( = ?auto_39633 ?auto_39630 ) ) ( not ( = ?auto_39635 ?auto_39639 ) ) ( not ( = ?auto_39633 ?auto_39632 ) ) ( not ( = ?auto_39630 ?auto_39632 ) ) ( not ( = ?auto_39636 ?auto_39635 ) ) ( not ( = ?auto_39636 ?auto_39639 ) ) ( not ( = ?auto_39633 ?auto_39631 ) ) ( not ( = ?auto_39630 ?auto_39631 ) ) ( not ( = ?auto_39632 ?auto_39631 ) ) ( not ( = ?auto_39633 ?auto_39634 ) ) ( not ( = ?auto_39630 ?auto_39634 ) ) ( not ( = ?auto_39632 ?auto_39634 ) ) ( not ( = ?auto_39631 ?auto_39634 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39633 ?auto_39630 ?auto_39632 ?auto_39634 ?auto_39631 ?auto_39629 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39677 - OBJ
      ?auto_39678 - OBJ
      ?auto_39679 - OBJ
      ?auto_39680 - OBJ
      ?auto_39681 - OBJ
      ?auto_39676 - LOCATION
    )
    :vars
    (
      ?auto_39683 - LOCATION
      ?auto_39684 - CITY
      ?auto_39682 - LOCATION
      ?auto_39686 - LOCATION
      ?auto_39685 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39683 ?auto_39684 ) ( IN-CITY ?auto_39676 ?auto_39684 ) ( not ( = ?auto_39676 ?auto_39683 ) ) ( OBJ-AT ?auto_39680 ?auto_39683 ) ( OBJ-AT ?auto_39678 ?auto_39683 ) ( OBJ-AT ?auto_39679 ?auto_39683 ) ( IN-CITY ?auto_39682 ?auto_39684 ) ( not ( = ?auto_39676 ?auto_39682 ) ) ( OBJ-AT ?auto_39677 ?auto_39682 ) ( IN-CITY ?auto_39686 ?auto_39684 ) ( not ( = ?auto_39676 ?auto_39686 ) ) ( OBJ-AT ?auto_39681 ?auto_39686 ) ( TRUCK-AT ?auto_39685 ?auto_39676 ) ( not ( = ?auto_39681 ?auto_39677 ) ) ( not ( = ?auto_39682 ?auto_39686 ) ) ( not ( = ?auto_39681 ?auto_39679 ) ) ( not ( = ?auto_39677 ?auto_39679 ) ) ( not ( = ?auto_39683 ?auto_39682 ) ) ( not ( = ?auto_39683 ?auto_39686 ) ) ( not ( = ?auto_39681 ?auto_39678 ) ) ( not ( = ?auto_39677 ?auto_39678 ) ) ( not ( = ?auto_39679 ?auto_39678 ) ) ( not ( = ?auto_39681 ?auto_39680 ) ) ( not ( = ?auto_39677 ?auto_39680 ) ) ( not ( = ?auto_39679 ?auto_39680 ) ) ( not ( = ?auto_39678 ?auto_39680 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39681 ?auto_39677 ?auto_39679 ?auto_39680 ?auto_39678 ?auto_39676 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39873 - OBJ
      ?auto_39874 - OBJ
      ?auto_39875 - OBJ
      ?auto_39876 - OBJ
      ?auto_39877 - OBJ
      ?auto_39872 - LOCATION
    )
    :vars
    (
      ?auto_39879 - LOCATION
      ?auto_39880 - CITY
      ?auto_39878 - LOCATION
      ?auto_39882 - LOCATION
      ?auto_39881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39879 ?auto_39880 ) ( IN-CITY ?auto_39872 ?auto_39880 ) ( not ( = ?auto_39872 ?auto_39879 ) ) ( OBJ-AT ?auto_39875 ?auto_39879 ) ( OBJ-AT ?auto_39874 ?auto_39879 ) ( OBJ-AT ?auto_39877 ?auto_39879 ) ( IN-CITY ?auto_39878 ?auto_39880 ) ( not ( = ?auto_39872 ?auto_39878 ) ) ( OBJ-AT ?auto_39873 ?auto_39878 ) ( IN-CITY ?auto_39882 ?auto_39880 ) ( not ( = ?auto_39872 ?auto_39882 ) ) ( OBJ-AT ?auto_39876 ?auto_39882 ) ( TRUCK-AT ?auto_39881 ?auto_39872 ) ( not ( = ?auto_39876 ?auto_39873 ) ) ( not ( = ?auto_39878 ?auto_39882 ) ) ( not ( = ?auto_39876 ?auto_39877 ) ) ( not ( = ?auto_39873 ?auto_39877 ) ) ( not ( = ?auto_39879 ?auto_39878 ) ) ( not ( = ?auto_39879 ?auto_39882 ) ) ( not ( = ?auto_39876 ?auto_39874 ) ) ( not ( = ?auto_39873 ?auto_39874 ) ) ( not ( = ?auto_39877 ?auto_39874 ) ) ( not ( = ?auto_39876 ?auto_39875 ) ) ( not ( = ?auto_39873 ?auto_39875 ) ) ( not ( = ?auto_39877 ?auto_39875 ) ) ( not ( = ?auto_39874 ?auto_39875 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39876 ?auto_39873 ?auto_39877 ?auto_39875 ?auto_39874 ?auto_39872 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_39971 - OBJ
      ?auto_39972 - OBJ
      ?auto_39973 - OBJ
      ?auto_39974 - OBJ
      ?auto_39975 - OBJ
      ?auto_39970 - LOCATION
    )
    :vars
    (
      ?auto_39977 - LOCATION
      ?auto_39978 - CITY
      ?auto_39976 - LOCATION
      ?auto_39980 - LOCATION
      ?auto_39979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_39977 ?auto_39978 ) ( IN-CITY ?auto_39970 ?auto_39978 ) ( not ( = ?auto_39970 ?auto_39977 ) ) ( OBJ-AT ?auto_39973 ?auto_39977 ) ( OBJ-AT ?auto_39972 ?auto_39977 ) ( OBJ-AT ?auto_39974 ?auto_39977 ) ( IN-CITY ?auto_39976 ?auto_39978 ) ( not ( = ?auto_39970 ?auto_39976 ) ) ( OBJ-AT ?auto_39971 ?auto_39976 ) ( IN-CITY ?auto_39980 ?auto_39978 ) ( not ( = ?auto_39970 ?auto_39980 ) ) ( OBJ-AT ?auto_39975 ?auto_39980 ) ( TRUCK-AT ?auto_39979 ?auto_39970 ) ( not ( = ?auto_39975 ?auto_39971 ) ) ( not ( = ?auto_39976 ?auto_39980 ) ) ( not ( = ?auto_39975 ?auto_39974 ) ) ( not ( = ?auto_39971 ?auto_39974 ) ) ( not ( = ?auto_39977 ?auto_39976 ) ) ( not ( = ?auto_39977 ?auto_39980 ) ) ( not ( = ?auto_39975 ?auto_39972 ) ) ( not ( = ?auto_39971 ?auto_39972 ) ) ( not ( = ?auto_39974 ?auto_39972 ) ) ( not ( = ?auto_39975 ?auto_39973 ) ) ( not ( = ?auto_39971 ?auto_39973 ) ) ( not ( = ?auto_39974 ?auto_39973 ) ) ( not ( = ?auto_39972 ?auto_39973 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_39975 ?auto_39971 ?auto_39974 ?auto_39973 ?auto_39972 ?auto_39970 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40318 - OBJ
      ?auto_40319 - OBJ
      ?auto_40320 - OBJ
      ?auto_40321 - OBJ
      ?auto_40322 - OBJ
      ?auto_40317 - LOCATION
    )
    :vars
    (
      ?auto_40324 - LOCATION
      ?auto_40325 - CITY
      ?auto_40323 - LOCATION
      ?auto_40327 - LOCATION
      ?auto_40326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40324 ?auto_40325 ) ( IN-CITY ?auto_40317 ?auto_40325 ) ( not ( = ?auto_40317 ?auto_40324 ) ) ( OBJ-AT ?auto_40319 ?auto_40324 ) ( OBJ-AT ?auto_40322 ?auto_40324 ) ( OBJ-AT ?auto_40321 ?auto_40324 ) ( IN-CITY ?auto_40323 ?auto_40325 ) ( not ( = ?auto_40317 ?auto_40323 ) ) ( OBJ-AT ?auto_40318 ?auto_40323 ) ( IN-CITY ?auto_40327 ?auto_40325 ) ( not ( = ?auto_40317 ?auto_40327 ) ) ( OBJ-AT ?auto_40320 ?auto_40327 ) ( TRUCK-AT ?auto_40326 ?auto_40317 ) ( not ( = ?auto_40320 ?auto_40318 ) ) ( not ( = ?auto_40323 ?auto_40327 ) ) ( not ( = ?auto_40320 ?auto_40321 ) ) ( not ( = ?auto_40318 ?auto_40321 ) ) ( not ( = ?auto_40324 ?auto_40323 ) ) ( not ( = ?auto_40324 ?auto_40327 ) ) ( not ( = ?auto_40320 ?auto_40322 ) ) ( not ( = ?auto_40318 ?auto_40322 ) ) ( not ( = ?auto_40321 ?auto_40322 ) ) ( not ( = ?auto_40320 ?auto_40319 ) ) ( not ( = ?auto_40318 ?auto_40319 ) ) ( not ( = ?auto_40321 ?auto_40319 ) ) ( not ( = ?auto_40322 ?auto_40319 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40320 ?auto_40318 ?auto_40321 ?auto_40319 ?auto_40322 ?auto_40317 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40365 - OBJ
      ?auto_40366 - OBJ
      ?auto_40367 - OBJ
      ?auto_40368 - OBJ
      ?auto_40369 - OBJ
      ?auto_40364 - LOCATION
    )
    :vars
    (
      ?auto_40371 - LOCATION
      ?auto_40372 - CITY
      ?auto_40370 - LOCATION
      ?auto_40374 - LOCATION
      ?auto_40373 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40371 ?auto_40372 ) ( IN-CITY ?auto_40364 ?auto_40372 ) ( not ( = ?auto_40364 ?auto_40371 ) ) ( OBJ-AT ?auto_40366 ?auto_40371 ) ( OBJ-AT ?auto_40368 ?auto_40371 ) ( OBJ-AT ?auto_40369 ?auto_40371 ) ( IN-CITY ?auto_40370 ?auto_40372 ) ( not ( = ?auto_40364 ?auto_40370 ) ) ( OBJ-AT ?auto_40365 ?auto_40370 ) ( IN-CITY ?auto_40374 ?auto_40372 ) ( not ( = ?auto_40364 ?auto_40374 ) ) ( OBJ-AT ?auto_40367 ?auto_40374 ) ( TRUCK-AT ?auto_40373 ?auto_40364 ) ( not ( = ?auto_40367 ?auto_40365 ) ) ( not ( = ?auto_40370 ?auto_40374 ) ) ( not ( = ?auto_40367 ?auto_40369 ) ) ( not ( = ?auto_40365 ?auto_40369 ) ) ( not ( = ?auto_40371 ?auto_40370 ) ) ( not ( = ?auto_40371 ?auto_40374 ) ) ( not ( = ?auto_40367 ?auto_40368 ) ) ( not ( = ?auto_40365 ?auto_40368 ) ) ( not ( = ?auto_40369 ?auto_40368 ) ) ( not ( = ?auto_40367 ?auto_40366 ) ) ( not ( = ?auto_40365 ?auto_40366 ) ) ( not ( = ?auto_40369 ?auto_40366 ) ) ( not ( = ?auto_40368 ?auto_40366 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40367 ?auto_40365 ?auto_40369 ?auto_40366 ?auto_40368 ?auto_40364 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40822 - OBJ
      ?auto_40823 - OBJ
      ?auto_40824 - OBJ
      ?auto_40825 - OBJ
      ?auto_40826 - OBJ
      ?auto_40821 - LOCATION
    )
    :vars
    (
      ?auto_40828 - LOCATION
      ?auto_40829 - CITY
      ?auto_40827 - LOCATION
      ?auto_40831 - LOCATION
      ?auto_40830 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40828 ?auto_40829 ) ( IN-CITY ?auto_40821 ?auto_40829 ) ( not ( = ?auto_40821 ?auto_40828 ) ) ( OBJ-AT ?auto_40823 ?auto_40828 ) ( OBJ-AT ?auto_40826 ?auto_40828 ) ( OBJ-AT ?auto_40824 ?auto_40828 ) ( IN-CITY ?auto_40827 ?auto_40829 ) ( not ( = ?auto_40821 ?auto_40827 ) ) ( OBJ-AT ?auto_40822 ?auto_40827 ) ( IN-CITY ?auto_40831 ?auto_40829 ) ( not ( = ?auto_40821 ?auto_40831 ) ) ( OBJ-AT ?auto_40825 ?auto_40831 ) ( TRUCK-AT ?auto_40830 ?auto_40821 ) ( not ( = ?auto_40825 ?auto_40822 ) ) ( not ( = ?auto_40827 ?auto_40831 ) ) ( not ( = ?auto_40825 ?auto_40824 ) ) ( not ( = ?auto_40822 ?auto_40824 ) ) ( not ( = ?auto_40828 ?auto_40827 ) ) ( not ( = ?auto_40828 ?auto_40831 ) ) ( not ( = ?auto_40825 ?auto_40826 ) ) ( not ( = ?auto_40822 ?auto_40826 ) ) ( not ( = ?auto_40824 ?auto_40826 ) ) ( not ( = ?auto_40825 ?auto_40823 ) ) ( not ( = ?auto_40822 ?auto_40823 ) ) ( not ( = ?auto_40824 ?auto_40823 ) ) ( not ( = ?auto_40826 ?auto_40823 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40825 ?auto_40822 ?auto_40824 ?auto_40823 ?auto_40826 ?auto_40821 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_40971 - OBJ
      ?auto_40972 - OBJ
      ?auto_40973 - OBJ
      ?auto_40974 - OBJ
      ?auto_40975 - OBJ
      ?auto_40970 - LOCATION
    )
    :vars
    (
      ?auto_40977 - LOCATION
      ?auto_40978 - CITY
      ?auto_40976 - LOCATION
      ?auto_40980 - LOCATION
      ?auto_40979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_40977 ?auto_40978 ) ( IN-CITY ?auto_40970 ?auto_40978 ) ( not ( = ?auto_40970 ?auto_40977 ) ) ( OBJ-AT ?auto_40972 ?auto_40977 ) ( OBJ-AT ?auto_40974 ?auto_40977 ) ( OBJ-AT ?auto_40973 ?auto_40977 ) ( IN-CITY ?auto_40976 ?auto_40978 ) ( not ( = ?auto_40970 ?auto_40976 ) ) ( OBJ-AT ?auto_40971 ?auto_40976 ) ( IN-CITY ?auto_40980 ?auto_40978 ) ( not ( = ?auto_40970 ?auto_40980 ) ) ( OBJ-AT ?auto_40975 ?auto_40980 ) ( TRUCK-AT ?auto_40979 ?auto_40970 ) ( not ( = ?auto_40975 ?auto_40971 ) ) ( not ( = ?auto_40976 ?auto_40980 ) ) ( not ( = ?auto_40975 ?auto_40973 ) ) ( not ( = ?auto_40971 ?auto_40973 ) ) ( not ( = ?auto_40977 ?auto_40976 ) ) ( not ( = ?auto_40977 ?auto_40980 ) ) ( not ( = ?auto_40975 ?auto_40974 ) ) ( not ( = ?auto_40971 ?auto_40974 ) ) ( not ( = ?auto_40973 ?auto_40974 ) ) ( not ( = ?auto_40975 ?auto_40972 ) ) ( not ( = ?auto_40971 ?auto_40972 ) ) ( not ( = ?auto_40973 ?auto_40972 ) ) ( not ( = ?auto_40974 ?auto_40972 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_40975 ?auto_40971 ?auto_40973 ?auto_40972 ?auto_40974 ?auto_40970 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41117 - OBJ
      ?auto_41118 - OBJ
      ?auto_41119 - OBJ
      ?auto_41120 - OBJ
      ?auto_41121 - OBJ
      ?auto_41116 - LOCATION
    )
    :vars
    (
      ?auto_41123 - LOCATION
      ?auto_41124 - CITY
      ?auto_41122 - LOCATION
      ?auto_41126 - LOCATION
      ?auto_41125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41123 ?auto_41124 ) ( IN-CITY ?auto_41116 ?auto_41124 ) ( not ( = ?auto_41116 ?auto_41123 ) ) ( OBJ-AT ?auto_41118 ?auto_41123 ) ( OBJ-AT ?auto_41119 ?auto_41123 ) ( OBJ-AT ?auto_41121 ?auto_41123 ) ( IN-CITY ?auto_41122 ?auto_41124 ) ( not ( = ?auto_41116 ?auto_41122 ) ) ( OBJ-AT ?auto_41117 ?auto_41122 ) ( IN-CITY ?auto_41126 ?auto_41124 ) ( not ( = ?auto_41116 ?auto_41126 ) ) ( OBJ-AT ?auto_41120 ?auto_41126 ) ( TRUCK-AT ?auto_41125 ?auto_41116 ) ( not ( = ?auto_41120 ?auto_41117 ) ) ( not ( = ?auto_41122 ?auto_41126 ) ) ( not ( = ?auto_41120 ?auto_41121 ) ) ( not ( = ?auto_41117 ?auto_41121 ) ) ( not ( = ?auto_41123 ?auto_41122 ) ) ( not ( = ?auto_41123 ?auto_41126 ) ) ( not ( = ?auto_41120 ?auto_41119 ) ) ( not ( = ?auto_41117 ?auto_41119 ) ) ( not ( = ?auto_41121 ?auto_41119 ) ) ( not ( = ?auto_41120 ?auto_41118 ) ) ( not ( = ?auto_41117 ?auto_41118 ) ) ( not ( = ?auto_41121 ?auto_41118 ) ) ( not ( = ?auto_41119 ?auto_41118 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41120 ?auto_41117 ?auto_41121 ?auto_41118 ?auto_41119 ?auto_41116 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41215 - OBJ
      ?auto_41216 - OBJ
      ?auto_41217 - OBJ
      ?auto_41218 - OBJ
      ?auto_41219 - OBJ
      ?auto_41214 - LOCATION
    )
    :vars
    (
      ?auto_41221 - LOCATION
      ?auto_41222 - CITY
      ?auto_41220 - LOCATION
      ?auto_41224 - LOCATION
      ?auto_41223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41221 ?auto_41222 ) ( IN-CITY ?auto_41214 ?auto_41222 ) ( not ( = ?auto_41214 ?auto_41221 ) ) ( OBJ-AT ?auto_41216 ?auto_41221 ) ( OBJ-AT ?auto_41217 ?auto_41221 ) ( OBJ-AT ?auto_41218 ?auto_41221 ) ( IN-CITY ?auto_41220 ?auto_41222 ) ( not ( = ?auto_41214 ?auto_41220 ) ) ( OBJ-AT ?auto_41215 ?auto_41220 ) ( IN-CITY ?auto_41224 ?auto_41222 ) ( not ( = ?auto_41214 ?auto_41224 ) ) ( OBJ-AT ?auto_41219 ?auto_41224 ) ( TRUCK-AT ?auto_41223 ?auto_41214 ) ( not ( = ?auto_41219 ?auto_41215 ) ) ( not ( = ?auto_41220 ?auto_41224 ) ) ( not ( = ?auto_41219 ?auto_41218 ) ) ( not ( = ?auto_41215 ?auto_41218 ) ) ( not ( = ?auto_41221 ?auto_41220 ) ) ( not ( = ?auto_41221 ?auto_41224 ) ) ( not ( = ?auto_41219 ?auto_41217 ) ) ( not ( = ?auto_41215 ?auto_41217 ) ) ( not ( = ?auto_41218 ?auto_41217 ) ) ( not ( = ?auto_41219 ?auto_41216 ) ) ( not ( = ?auto_41215 ?auto_41216 ) ) ( not ( = ?auto_41218 ?auto_41216 ) ) ( not ( = ?auto_41217 ?auto_41216 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41219 ?auto_41215 ?auto_41218 ?auto_41216 ?auto_41217 ?auto_41214 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41872 - OBJ
      ?auto_41873 - OBJ
      ?auto_41874 - OBJ
      ?auto_41875 - OBJ
      ?auto_41876 - OBJ
      ?auto_41871 - LOCATION
    )
    :vars
    (
      ?auto_41878 - LOCATION
      ?auto_41879 - CITY
      ?auto_41877 - LOCATION
      ?auto_41881 - LOCATION
      ?auto_41880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41878 ?auto_41879 ) ( IN-CITY ?auto_41871 ?auto_41879 ) ( not ( = ?auto_41871 ?auto_41878 ) ) ( OBJ-AT ?auto_41876 ?auto_41878 ) ( OBJ-AT ?auto_41875 ?auto_41878 ) ( OBJ-AT ?auto_41872 ?auto_41878 ) ( IN-CITY ?auto_41877 ?auto_41879 ) ( not ( = ?auto_41871 ?auto_41877 ) ) ( OBJ-AT ?auto_41874 ?auto_41877 ) ( IN-CITY ?auto_41881 ?auto_41879 ) ( not ( = ?auto_41871 ?auto_41881 ) ) ( OBJ-AT ?auto_41873 ?auto_41881 ) ( TRUCK-AT ?auto_41880 ?auto_41871 ) ( not ( = ?auto_41873 ?auto_41874 ) ) ( not ( = ?auto_41877 ?auto_41881 ) ) ( not ( = ?auto_41873 ?auto_41872 ) ) ( not ( = ?auto_41874 ?auto_41872 ) ) ( not ( = ?auto_41878 ?auto_41877 ) ) ( not ( = ?auto_41878 ?auto_41881 ) ) ( not ( = ?auto_41873 ?auto_41875 ) ) ( not ( = ?auto_41874 ?auto_41875 ) ) ( not ( = ?auto_41872 ?auto_41875 ) ) ( not ( = ?auto_41873 ?auto_41876 ) ) ( not ( = ?auto_41874 ?auto_41876 ) ) ( not ( = ?auto_41872 ?auto_41876 ) ) ( not ( = ?auto_41875 ?auto_41876 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41873 ?auto_41874 ?auto_41872 ?auto_41876 ?auto_41875 ?auto_41871 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_41919 - OBJ
      ?auto_41920 - OBJ
      ?auto_41921 - OBJ
      ?auto_41922 - OBJ
      ?auto_41923 - OBJ
      ?auto_41918 - LOCATION
    )
    :vars
    (
      ?auto_41925 - LOCATION
      ?auto_41926 - CITY
      ?auto_41924 - LOCATION
      ?auto_41928 - LOCATION
      ?auto_41927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_41925 ?auto_41926 ) ( IN-CITY ?auto_41918 ?auto_41926 ) ( not ( = ?auto_41918 ?auto_41925 ) ) ( OBJ-AT ?auto_41922 ?auto_41925 ) ( OBJ-AT ?auto_41923 ?auto_41925 ) ( OBJ-AT ?auto_41919 ?auto_41925 ) ( IN-CITY ?auto_41924 ?auto_41926 ) ( not ( = ?auto_41918 ?auto_41924 ) ) ( OBJ-AT ?auto_41921 ?auto_41924 ) ( IN-CITY ?auto_41928 ?auto_41926 ) ( not ( = ?auto_41918 ?auto_41928 ) ) ( OBJ-AT ?auto_41920 ?auto_41928 ) ( TRUCK-AT ?auto_41927 ?auto_41918 ) ( not ( = ?auto_41920 ?auto_41921 ) ) ( not ( = ?auto_41924 ?auto_41928 ) ) ( not ( = ?auto_41920 ?auto_41919 ) ) ( not ( = ?auto_41921 ?auto_41919 ) ) ( not ( = ?auto_41925 ?auto_41924 ) ) ( not ( = ?auto_41925 ?auto_41928 ) ) ( not ( = ?auto_41920 ?auto_41923 ) ) ( not ( = ?auto_41921 ?auto_41923 ) ) ( not ( = ?auto_41919 ?auto_41923 ) ) ( not ( = ?auto_41920 ?auto_41922 ) ) ( not ( = ?auto_41921 ?auto_41922 ) ) ( not ( = ?auto_41919 ?auto_41922 ) ) ( not ( = ?auto_41923 ?auto_41922 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_41920 ?auto_41921 ?auto_41919 ?auto_41922 ?auto_41923 ?auto_41918 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42067 - OBJ
      ?auto_42068 - OBJ
      ?auto_42069 - OBJ
      ?auto_42070 - OBJ
      ?auto_42071 - OBJ
      ?auto_42066 - LOCATION
    )
    :vars
    (
      ?auto_42073 - LOCATION
      ?auto_42074 - CITY
      ?auto_42072 - LOCATION
      ?auto_42076 - LOCATION
      ?auto_42075 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42073 ?auto_42074 ) ( IN-CITY ?auto_42066 ?auto_42074 ) ( not ( = ?auto_42066 ?auto_42073 ) ) ( OBJ-AT ?auto_42071 ?auto_42073 ) ( OBJ-AT ?auto_42069 ?auto_42073 ) ( OBJ-AT ?auto_42067 ?auto_42073 ) ( IN-CITY ?auto_42072 ?auto_42074 ) ( not ( = ?auto_42066 ?auto_42072 ) ) ( OBJ-AT ?auto_42070 ?auto_42072 ) ( IN-CITY ?auto_42076 ?auto_42074 ) ( not ( = ?auto_42066 ?auto_42076 ) ) ( OBJ-AT ?auto_42068 ?auto_42076 ) ( TRUCK-AT ?auto_42075 ?auto_42066 ) ( not ( = ?auto_42068 ?auto_42070 ) ) ( not ( = ?auto_42072 ?auto_42076 ) ) ( not ( = ?auto_42068 ?auto_42067 ) ) ( not ( = ?auto_42070 ?auto_42067 ) ) ( not ( = ?auto_42073 ?auto_42072 ) ) ( not ( = ?auto_42073 ?auto_42076 ) ) ( not ( = ?auto_42068 ?auto_42069 ) ) ( not ( = ?auto_42070 ?auto_42069 ) ) ( not ( = ?auto_42067 ?auto_42069 ) ) ( not ( = ?auto_42068 ?auto_42071 ) ) ( not ( = ?auto_42070 ?auto_42071 ) ) ( not ( = ?auto_42067 ?auto_42071 ) ) ( not ( = ?auto_42069 ?auto_42071 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42068 ?auto_42070 ?auto_42067 ?auto_42071 ?auto_42069 ?auto_42066 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42114 - OBJ
      ?auto_42115 - OBJ
      ?auto_42116 - OBJ
      ?auto_42117 - OBJ
      ?auto_42118 - OBJ
      ?auto_42113 - LOCATION
    )
    :vars
    (
      ?auto_42120 - LOCATION
      ?auto_42121 - CITY
      ?auto_42119 - LOCATION
      ?auto_42123 - LOCATION
      ?auto_42122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42120 ?auto_42121 ) ( IN-CITY ?auto_42113 ?auto_42121 ) ( not ( = ?auto_42113 ?auto_42120 ) ) ( OBJ-AT ?auto_42117 ?auto_42120 ) ( OBJ-AT ?auto_42116 ?auto_42120 ) ( OBJ-AT ?auto_42114 ?auto_42120 ) ( IN-CITY ?auto_42119 ?auto_42121 ) ( not ( = ?auto_42113 ?auto_42119 ) ) ( OBJ-AT ?auto_42118 ?auto_42119 ) ( IN-CITY ?auto_42123 ?auto_42121 ) ( not ( = ?auto_42113 ?auto_42123 ) ) ( OBJ-AT ?auto_42115 ?auto_42123 ) ( TRUCK-AT ?auto_42122 ?auto_42113 ) ( not ( = ?auto_42115 ?auto_42118 ) ) ( not ( = ?auto_42119 ?auto_42123 ) ) ( not ( = ?auto_42115 ?auto_42114 ) ) ( not ( = ?auto_42118 ?auto_42114 ) ) ( not ( = ?auto_42120 ?auto_42119 ) ) ( not ( = ?auto_42120 ?auto_42123 ) ) ( not ( = ?auto_42115 ?auto_42116 ) ) ( not ( = ?auto_42118 ?auto_42116 ) ) ( not ( = ?auto_42114 ?auto_42116 ) ) ( not ( = ?auto_42115 ?auto_42117 ) ) ( not ( = ?auto_42118 ?auto_42117 ) ) ( not ( = ?auto_42114 ?auto_42117 ) ) ( not ( = ?auto_42116 ?auto_42117 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42115 ?auto_42118 ?auto_42114 ?auto_42117 ?auto_42116 ?auto_42113 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42260 - OBJ
      ?auto_42261 - OBJ
      ?auto_42262 - OBJ
      ?auto_42263 - OBJ
      ?auto_42264 - OBJ
      ?auto_42259 - LOCATION
    )
    :vars
    (
      ?auto_42266 - LOCATION
      ?auto_42267 - CITY
      ?auto_42265 - LOCATION
      ?auto_42269 - LOCATION
      ?auto_42268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42266 ?auto_42267 ) ( IN-CITY ?auto_42259 ?auto_42267 ) ( not ( = ?auto_42259 ?auto_42266 ) ) ( OBJ-AT ?auto_42262 ?auto_42266 ) ( OBJ-AT ?auto_42264 ?auto_42266 ) ( OBJ-AT ?auto_42260 ?auto_42266 ) ( IN-CITY ?auto_42265 ?auto_42267 ) ( not ( = ?auto_42259 ?auto_42265 ) ) ( OBJ-AT ?auto_42263 ?auto_42265 ) ( IN-CITY ?auto_42269 ?auto_42267 ) ( not ( = ?auto_42259 ?auto_42269 ) ) ( OBJ-AT ?auto_42261 ?auto_42269 ) ( TRUCK-AT ?auto_42268 ?auto_42259 ) ( not ( = ?auto_42261 ?auto_42263 ) ) ( not ( = ?auto_42265 ?auto_42269 ) ) ( not ( = ?auto_42261 ?auto_42260 ) ) ( not ( = ?auto_42263 ?auto_42260 ) ) ( not ( = ?auto_42266 ?auto_42265 ) ) ( not ( = ?auto_42266 ?auto_42269 ) ) ( not ( = ?auto_42261 ?auto_42264 ) ) ( not ( = ?auto_42263 ?auto_42264 ) ) ( not ( = ?auto_42260 ?auto_42264 ) ) ( not ( = ?auto_42261 ?auto_42262 ) ) ( not ( = ?auto_42263 ?auto_42262 ) ) ( not ( = ?auto_42260 ?auto_42262 ) ) ( not ( = ?auto_42264 ?auto_42262 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42261 ?auto_42263 ?auto_42260 ?auto_42262 ?auto_42264 ?auto_42259 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42358 - OBJ
      ?auto_42359 - OBJ
      ?auto_42360 - OBJ
      ?auto_42361 - OBJ
      ?auto_42362 - OBJ
      ?auto_42357 - LOCATION
    )
    :vars
    (
      ?auto_42364 - LOCATION
      ?auto_42365 - CITY
      ?auto_42363 - LOCATION
      ?auto_42367 - LOCATION
      ?auto_42366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42364 ?auto_42365 ) ( IN-CITY ?auto_42357 ?auto_42365 ) ( not ( = ?auto_42357 ?auto_42364 ) ) ( OBJ-AT ?auto_42360 ?auto_42364 ) ( OBJ-AT ?auto_42361 ?auto_42364 ) ( OBJ-AT ?auto_42358 ?auto_42364 ) ( IN-CITY ?auto_42363 ?auto_42365 ) ( not ( = ?auto_42357 ?auto_42363 ) ) ( OBJ-AT ?auto_42362 ?auto_42363 ) ( IN-CITY ?auto_42367 ?auto_42365 ) ( not ( = ?auto_42357 ?auto_42367 ) ) ( OBJ-AT ?auto_42359 ?auto_42367 ) ( TRUCK-AT ?auto_42366 ?auto_42357 ) ( not ( = ?auto_42359 ?auto_42362 ) ) ( not ( = ?auto_42363 ?auto_42367 ) ) ( not ( = ?auto_42359 ?auto_42358 ) ) ( not ( = ?auto_42362 ?auto_42358 ) ) ( not ( = ?auto_42364 ?auto_42363 ) ) ( not ( = ?auto_42364 ?auto_42367 ) ) ( not ( = ?auto_42359 ?auto_42361 ) ) ( not ( = ?auto_42362 ?auto_42361 ) ) ( not ( = ?auto_42358 ?auto_42361 ) ) ( not ( = ?auto_42359 ?auto_42360 ) ) ( not ( = ?auto_42362 ?auto_42360 ) ) ( not ( = ?auto_42358 ?auto_42360 ) ) ( not ( = ?auto_42361 ?auto_42360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42359 ?auto_42362 ?auto_42358 ?auto_42360 ?auto_42361 ?auto_42357 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42504 - OBJ
      ?auto_42505 - OBJ
      ?auto_42506 - OBJ
      ?auto_42507 - OBJ
      ?auto_42508 - OBJ
      ?auto_42503 - LOCATION
    )
    :vars
    (
      ?auto_42510 - LOCATION
      ?auto_42511 - CITY
      ?auto_42509 - LOCATION
      ?auto_42513 - LOCATION
      ?auto_42512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42510 ?auto_42511 ) ( IN-CITY ?auto_42503 ?auto_42511 ) ( not ( = ?auto_42503 ?auto_42510 ) ) ( OBJ-AT ?auto_42508 ?auto_42510 ) ( OBJ-AT ?auto_42507 ?auto_42510 ) ( OBJ-AT ?auto_42504 ?auto_42510 ) ( IN-CITY ?auto_42509 ?auto_42511 ) ( not ( = ?auto_42503 ?auto_42509 ) ) ( OBJ-AT ?auto_42505 ?auto_42509 ) ( IN-CITY ?auto_42513 ?auto_42511 ) ( not ( = ?auto_42503 ?auto_42513 ) ) ( OBJ-AT ?auto_42506 ?auto_42513 ) ( TRUCK-AT ?auto_42512 ?auto_42503 ) ( not ( = ?auto_42506 ?auto_42505 ) ) ( not ( = ?auto_42509 ?auto_42513 ) ) ( not ( = ?auto_42506 ?auto_42504 ) ) ( not ( = ?auto_42505 ?auto_42504 ) ) ( not ( = ?auto_42510 ?auto_42509 ) ) ( not ( = ?auto_42510 ?auto_42513 ) ) ( not ( = ?auto_42506 ?auto_42507 ) ) ( not ( = ?auto_42505 ?auto_42507 ) ) ( not ( = ?auto_42504 ?auto_42507 ) ) ( not ( = ?auto_42506 ?auto_42508 ) ) ( not ( = ?auto_42505 ?auto_42508 ) ) ( not ( = ?auto_42504 ?auto_42508 ) ) ( not ( = ?auto_42507 ?auto_42508 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42506 ?auto_42505 ?auto_42504 ?auto_42508 ?auto_42507 ?auto_42503 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42551 - OBJ
      ?auto_42552 - OBJ
      ?auto_42553 - OBJ
      ?auto_42554 - OBJ
      ?auto_42555 - OBJ
      ?auto_42550 - LOCATION
    )
    :vars
    (
      ?auto_42557 - LOCATION
      ?auto_42558 - CITY
      ?auto_42556 - LOCATION
      ?auto_42560 - LOCATION
      ?auto_42559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42557 ?auto_42558 ) ( IN-CITY ?auto_42550 ?auto_42558 ) ( not ( = ?auto_42550 ?auto_42557 ) ) ( OBJ-AT ?auto_42554 ?auto_42557 ) ( OBJ-AT ?auto_42555 ?auto_42557 ) ( OBJ-AT ?auto_42551 ?auto_42557 ) ( IN-CITY ?auto_42556 ?auto_42558 ) ( not ( = ?auto_42550 ?auto_42556 ) ) ( OBJ-AT ?auto_42552 ?auto_42556 ) ( IN-CITY ?auto_42560 ?auto_42558 ) ( not ( = ?auto_42550 ?auto_42560 ) ) ( OBJ-AT ?auto_42553 ?auto_42560 ) ( TRUCK-AT ?auto_42559 ?auto_42550 ) ( not ( = ?auto_42553 ?auto_42552 ) ) ( not ( = ?auto_42556 ?auto_42560 ) ) ( not ( = ?auto_42553 ?auto_42551 ) ) ( not ( = ?auto_42552 ?auto_42551 ) ) ( not ( = ?auto_42557 ?auto_42556 ) ) ( not ( = ?auto_42557 ?auto_42560 ) ) ( not ( = ?auto_42553 ?auto_42555 ) ) ( not ( = ?auto_42552 ?auto_42555 ) ) ( not ( = ?auto_42551 ?auto_42555 ) ) ( not ( = ?auto_42553 ?auto_42554 ) ) ( not ( = ?auto_42552 ?auto_42554 ) ) ( not ( = ?auto_42551 ?auto_42554 ) ) ( not ( = ?auto_42555 ?auto_42554 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42553 ?auto_42552 ?auto_42551 ?auto_42554 ?auto_42555 ?auto_42550 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42800 - OBJ
      ?auto_42801 - OBJ
      ?auto_42802 - OBJ
      ?auto_42803 - OBJ
      ?auto_42804 - OBJ
      ?auto_42799 - LOCATION
    )
    :vars
    (
      ?auto_42806 - LOCATION
      ?auto_42807 - CITY
      ?auto_42805 - LOCATION
      ?auto_42809 - LOCATION
      ?auto_42808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42806 ?auto_42807 ) ( IN-CITY ?auto_42799 ?auto_42807 ) ( not ( = ?auto_42799 ?auto_42806 ) ) ( OBJ-AT ?auto_42804 ?auto_42806 ) ( OBJ-AT ?auto_42802 ?auto_42806 ) ( OBJ-AT ?auto_42800 ?auto_42806 ) ( IN-CITY ?auto_42805 ?auto_42807 ) ( not ( = ?auto_42799 ?auto_42805 ) ) ( OBJ-AT ?auto_42801 ?auto_42805 ) ( IN-CITY ?auto_42809 ?auto_42807 ) ( not ( = ?auto_42799 ?auto_42809 ) ) ( OBJ-AT ?auto_42803 ?auto_42809 ) ( TRUCK-AT ?auto_42808 ?auto_42799 ) ( not ( = ?auto_42803 ?auto_42801 ) ) ( not ( = ?auto_42805 ?auto_42809 ) ) ( not ( = ?auto_42803 ?auto_42800 ) ) ( not ( = ?auto_42801 ?auto_42800 ) ) ( not ( = ?auto_42806 ?auto_42805 ) ) ( not ( = ?auto_42806 ?auto_42809 ) ) ( not ( = ?auto_42803 ?auto_42802 ) ) ( not ( = ?auto_42801 ?auto_42802 ) ) ( not ( = ?auto_42800 ?auto_42802 ) ) ( not ( = ?auto_42803 ?auto_42804 ) ) ( not ( = ?auto_42801 ?auto_42804 ) ) ( not ( = ?auto_42800 ?auto_42804 ) ) ( not ( = ?auto_42802 ?auto_42804 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42803 ?auto_42801 ?auto_42800 ?auto_42804 ?auto_42802 ?auto_42799 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42847 - OBJ
      ?auto_42848 - OBJ
      ?auto_42849 - OBJ
      ?auto_42850 - OBJ
      ?auto_42851 - OBJ
      ?auto_42846 - LOCATION
    )
    :vars
    (
      ?auto_42853 - LOCATION
      ?auto_42854 - CITY
      ?auto_42852 - LOCATION
      ?auto_42856 - LOCATION
      ?auto_42855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42853 ?auto_42854 ) ( IN-CITY ?auto_42846 ?auto_42854 ) ( not ( = ?auto_42846 ?auto_42853 ) ) ( OBJ-AT ?auto_42850 ?auto_42853 ) ( OBJ-AT ?auto_42849 ?auto_42853 ) ( OBJ-AT ?auto_42847 ?auto_42853 ) ( IN-CITY ?auto_42852 ?auto_42854 ) ( not ( = ?auto_42846 ?auto_42852 ) ) ( OBJ-AT ?auto_42848 ?auto_42852 ) ( IN-CITY ?auto_42856 ?auto_42854 ) ( not ( = ?auto_42846 ?auto_42856 ) ) ( OBJ-AT ?auto_42851 ?auto_42856 ) ( TRUCK-AT ?auto_42855 ?auto_42846 ) ( not ( = ?auto_42851 ?auto_42848 ) ) ( not ( = ?auto_42852 ?auto_42856 ) ) ( not ( = ?auto_42851 ?auto_42847 ) ) ( not ( = ?auto_42848 ?auto_42847 ) ) ( not ( = ?auto_42853 ?auto_42852 ) ) ( not ( = ?auto_42853 ?auto_42856 ) ) ( not ( = ?auto_42851 ?auto_42849 ) ) ( not ( = ?auto_42848 ?auto_42849 ) ) ( not ( = ?auto_42847 ?auto_42849 ) ) ( not ( = ?auto_42851 ?auto_42850 ) ) ( not ( = ?auto_42848 ?auto_42850 ) ) ( not ( = ?auto_42847 ?auto_42850 ) ) ( not ( = ?auto_42849 ?auto_42850 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42851 ?auto_42848 ?auto_42847 ?auto_42850 ?auto_42849 ?auto_42846 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_42942 - OBJ
      ?auto_42943 - OBJ
      ?auto_42944 - OBJ
      ?auto_42945 - OBJ
      ?auto_42946 - OBJ
      ?auto_42941 - LOCATION
    )
    :vars
    (
      ?auto_42948 - LOCATION
      ?auto_42949 - CITY
      ?auto_42947 - LOCATION
      ?auto_42951 - LOCATION
      ?auto_42950 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_42948 ?auto_42949 ) ( IN-CITY ?auto_42941 ?auto_42949 ) ( not ( = ?auto_42941 ?auto_42948 ) ) ( OBJ-AT ?auto_42944 ?auto_42948 ) ( OBJ-AT ?auto_42946 ?auto_42948 ) ( OBJ-AT ?auto_42942 ?auto_42948 ) ( IN-CITY ?auto_42947 ?auto_42949 ) ( not ( = ?auto_42941 ?auto_42947 ) ) ( OBJ-AT ?auto_42943 ?auto_42947 ) ( IN-CITY ?auto_42951 ?auto_42949 ) ( not ( = ?auto_42941 ?auto_42951 ) ) ( OBJ-AT ?auto_42945 ?auto_42951 ) ( TRUCK-AT ?auto_42950 ?auto_42941 ) ( not ( = ?auto_42945 ?auto_42943 ) ) ( not ( = ?auto_42947 ?auto_42951 ) ) ( not ( = ?auto_42945 ?auto_42942 ) ) ( not ( = ?auto_42943 ?auto_42942 ) ) ( not ( = ?auto_42948 ?auto_42947 ) ) ( not ( = ?auto_42948 ?auto_42951 ) ) ( not ( = ?auto_42945 ?auto_42946 ) ) ( not ( = ?auto_42943 ?auto_42946 ) ) ( not ( = ?auto_42942 ?auto_42946 ) ) ( not ( = ?auto_42945 ?auto_42944 ) ) ( not ( = ?auto_42943 ?auto_42944 ) ) ( not ( = ?auto_42942 ?auto_42944 ) ) ( not ( = ?auto_42946 ?auto_42944 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_42945 ?auto_42943 ?auto_42942 ?auto_42944 ?auto_42946 ?auto_42941 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_43091 - OBJ
      ?auto_43092 - OBJ
      ?auto_43093 - OBJ
      ?auto_43094 - OBJ
      ?auto_43095 - OBJ
      ?auto_43090 - LOCATION
    )
    :vars
    (
      ?auto_43097 - LOCATION
      ?auto_43098 - CITY
      ?auto_43096 - LOCATION
      ?auto_43100 - LOCATION
      ?auto_43099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_43097 ?auto_43098 ) ( IN-CITY ?auto_43090 ?auto_43098 ) ( not ( = ?auto_43090 ?auto_43097 ) ) ( OBJ-AT ?auto_43093 ?auto_43097 ) ( OBJ-AT ?auto_43094 ?auto_43097 ) ( OBJ-AT ?auto_43091 ?auto_43097 ) ( IN-CITY ?auto_43096 ?auto_43098 ) ( not ( = ?auto_43090 ?auto_43096 ) ) ( OBJ-AT ?auto_43092 ?auto_43096 ) ( IN-CITY ?auto_43100 ?auto_43098 ) ( not ( = ?auto_43090 ?auto_43100 ) ) ( OBJ-AT ?auto_43095 ?auto_43100 ) ( TRUCK-AT ?auto_43099 ?auto_43090 ) ( not ( = ?auto_43095 ?auto_43092 ) ) ( not ( = ?auto_43096 ?auto_43100 ) ) ( not ( = ?auto_43095 ?auto_43091 ) ) ( not ( = ?auto_43092 ?auto_43091 ) ) ( not ( = ?auto_43097 ?auto_43096 ) ) ( not ( = ?auto_43097 ?auto_43100 ) ) ( not ( = ?auto_43095 ?auto_43094 ) ) ( not ( = ?auto_43092 ?auto_43094 ) ) ( not ( = ?auto_43091 ?auto_43094 ) ) ( not ( = ?auto_43095 ?auto_43093 ) ) ( not ( = ?auto_43092 ?auto_43093 ) ) ( not ( = ?auto_43091 ?auto_43093 ) ) ( not ( = ?auto_43094 ?auto_43093 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_43095 ?auto_43092 ?auto_43091 ?auto_43093 ?auto_43094 ?auto_43090 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44007 - OBJ
      ?auto_44008 - OBJ
      ?auto_44009 - OBJ
      ?auto_44010 - OBJ
      ?auto_44011 - OBJ
      ?auto_44006 - LOCATION
    )
    :vars
    (
      ?auto_44013 - LOCATION
      ?auto_44014 - CITY
      ?auto_44012 - LOCATION
      ?auto_44016 - LOCATION
      ?auto_44015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44013 ?auto_44014 ) ( IN-CITY ?auto_44006 ?auto_44014 ) ( not ( = ?auto_44006 ?auto_44013 ) ) ( OBJ-AT ?auto_44011 ?auto_44013 ) ( OBJ-AT ?auto_44008 ?auto_44013 ) ( OBJ-AT ?auto_44007 ?auto_44013 ) ( IN-CITY ?auto_44012 ?auto_44014 ) ( not ( = ?auto_44006 ?auto_44012 ) ) ( OBJ-AT ?auto_44010 ?auto_44012 ) ( IN-CITY ?auto_44016 ?auto_44014 ) ( not ( = ?auto_44006 ?auto_44016 ) ) ( OBJ-AT ?auto_44009 ?auto_44016 ) ( TRUCK-AT ?auto_44015 ?auto_44006 ) ( not ( = ?auto_44009 ?auto_44010 ) ) ( not ( = ?auto_44012 ?auto_44016 ) ) ( not ( = ?auto_44009 ?auto_44007 ) ) ( not ( = ?auto_44010 ?auto_44007 ) ) ( not ( = ?auto_44013 ?auto_44012 ) ) ( not ( = ?auto_44013 ?auto_44016 ) ) ( not ( = ?auto_44009 ?auto_44008 ) ) ( not ( = ?auto_44010 ?auto_44008 ) ) ( not ( = ?auto_44007 ?auto_44008 ) ) ( not ( = ?auto_44009 ?auto_44011 ) ) ( not ( = ?auto_44010 ?auto_44011 ) ) ( not ( = ?auto_44007 ?auto_44011 ) ) ( not ( = ?auto_44008 ?auto_44011 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44009 ?auto_44010 ?auto_44007 ?auto_44011 ?auto_44008 ?auto_44006 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44054 - OBJ
      ?auto_44055 - OBJ
      ?auto_44056 - OBJ
      ?auto_44057 - OBJ
      ?auto_44058 - OBJ
      ?auto_44053 - LOCATION
    )
    :vars
    (
      ?auto_44060 - LOCATION
      ?auto_44061 - CITY
      ?auto_44059 - LOCATION
      ?auto_44063 - LOCATION
      ?auto_44062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44060 ?auto_44061 ) ( IN-CITY ?auto_44053 ?auto_44061 ) ( not ( = ?auto_44053 ?auto_44060 ) ) ( OBJ-AT ?auto_44057 ?auto_44060 ) ( OBJ-AT ?auto_44055 ?auto_44060 ) ( OBJ-AT ?auto_44054 ?auto_44060 ) ( IN-CITY ?auto_44059 ?auto_44061 ) ( not ( = ?auto_44053 ?auto_44059 ) ) ( OBJ-AT ?auto_44058 ?auto_44059 ) ( IN-CITY ?auto_44063 ?auto_44061 ) ( not ( = ?auto_44053 ?auto_44063 ) ) ( OBJ-AT ?auto_44056 ?auto_44063 ) ( TRUCK-AT ?auto_44062 ?auto_44053 ) ( not ( = ?auto_44056 ?auto_44058 ) ) ( not ( = ?auto_44059 ?auto_44063 ) ) ( not ( = ?auto_44056 ?auto_44054 ) ) ( not ( = ?auto_44058 ?auto_44054 ) ) ( not ( = ?auto_44060 ?auto_44059 ) ) ( not ( = ?auto_44060 ?auto_44063 ) ) ( not ( = ?auto_44056 ?auto_44055 ) ) ( not ( = ?auto_44058 ?auto_44055 ) ) ( not ( = ?auto_44054 ?auto_44055 ) ) ( not ( = ?auto_44056 ?auto_44057 ) ) ( not ( = ?auto_44058 ?auto_44057 ) ) ( not ( = ?auto_44054 ?auto_44057 ) ) ( not ( = ?auto_44055 ?auto_44057 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44056 ?auto_44058 ?auto_44054 ?auto_44057 ?auto_44055 ?auto_44053 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44101 - OBJ
      ?auto_44102 - OBJ
      ?auto_44103 - OBJ
      ?auto_44104 - OBJ
      ?auto_44105 - OBJ
      ?auto_44100 - LOCATION
    )
    :vars
    (
      ?auto_44107 - LOCATION
      ?auto_44108 - CITY
      ?auto_44106 - LOCATION
      ?auto_44110 - LOCATION
      ?auto_44109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44107 ?auto_44108 ) ( IN-CITY ?auto_44100 ?auto_44108 ) ( not ( = ?auto_44100 ?auto_44107 ) ) ( OBJ-AT ?auto_44105 ?auto_44107 ) ( OBJ-AT ?auto_44102 ?auto_44107 ) ( OBJ-AT ?auto_44101 ?auto_44107 ) ( IN-CITY ?auto_44106 ?auto_44108 ) ( not ( = ?auto_44100 ?auto_44106 ) ) ( OBJ-AT ?auto_44103 ?auto_44106 ) ( IN-CITY ?auto_44110 ?auto_44108 ) ( not ( = ?auto_44100 ?auto_44110 ) ) ( OBJ-AT ?auto_44104 ?auto_44110 ) ( TRUCK-AT ?auto_44109 ?auto_44100 ) ( not ( = ?auto_44104 ?auto_44103 ) ) ( not ( = ?auto_44106 ?auto_44110 ) ) ( not ( = ?auto_44104 ?auto_44101 ) ) ( not ( = ?auto_44103 ?auto_44101 ) ) ( not ( = ?auto_44107 ?auto_44106 ) ) ( not ( = ?auto_44107 ?auto_44110 ) ) ( not ( = ?auto_44104 ?auto_44102 ) ) ( not ( = ?auto_44103 ?auto_44102 ) ) ( not ( = ?auto_44101 ?auto_44102 ) ) ( not ( = ?auto_44104 ?auto_44105 ) ) ( not ( = ?auto_44103 ?auto_44105 ) ) ( not ( = ?auto_44101 ?auto_44105 ) ) ( not ( = ?auto_44102 ?auto_44105 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44104 ?auto_44103 ?auto_44101 ?auto_44105 ?auto_44102 ?auto_44100 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44148 - OBJ
      ?auto_44149 - OBJ
      ?auto_44150 - OBJ
      ?auto_44151 - OBJ
      ?auto_44152 - OBJ
      ?auto_44147 - LOCATION
    )
    :vars
    (
      ?auto_44154 - LOCATION
      ?auto_44155 - CITY
      ?auto_44153 - LOCATION
      ?auto_44157 - LOCATION
      ?auto_44156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44154 ?auto_44155 ) ( IN-CITY ?auto_44147 ?auto_44155 ) ( not ( = ?auto_44147 ?auto_44154 ) ) ( OBJ-AT ?auto_44151 ?auto_44154 ) ( OBJ-AT ?auto_44149 ?auto_44154 ) ( OBJ-AT ?auto_44148 ?auto_44154 ) ( IN-CITY ?auto_44153 ?auto_44155 ) ( not ( = ?auto_44147 ?auto_44153 ) ) ( OBJ-AT ?auto_44150 ?auto_44153 ) ( IN-CITY ?auto_44157 ?auto_44155 ) ( not ( = ?auto_44147 ?auto_44157 ) ) ( OBJ-AT ?auto_44152 ?auto_44157 ) ( TRUCK-AT ?auto_44156 ?auto_44147 ) ( not ( = ?auto_44152 ?auto_44150 ) ) ( not ( = ?auto_44153 ?auto_44157 ) ) ( not ( = ?auto_44152 ?auto_44148 ) ) ( not ( = ?auto_44150 ?auto_44148 ) ) ( not ( = ?auto_44154 ?auto_44153 ) ) ( not ( = ?auto_44154 ?auto_44157 ) ) ( not ( = ?auto_44152 ?auto_44149 ) ) ( not ( = ?auto_44150 ?auto_44149 ) ) ( not ( = ?auto_44148 ?auto_44149 ) ) ( not ( = ?auto_44152 ?auto_44151 ) ) ( not ( = ?auto_44150 ?auto_44151 ) ) ( not ( = ?auto_44148 ?auto_44151 ) ) ( not ( = ?auto_44149 ?auto_44151 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44152 ?auto_44150 ?auto_44148 ?auto_44151 ?auto_44149 ?auto_44147 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44445 - OBJ
      ?auto_44446 - OBJ
      ?auto_44447 - OBJ
      ?auto_44448 - OBJ
      ?auto_44449 - OBJ
      ?auto_44444 - LOCATION
    )
    :vars
    (
      ?auto_44451 - LOCATION
      ?auto_44452 - CITY
      ?auto_44450 - LOCATION
      ?auto_44454 - LOCATION
      ?auto_44453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44451 ?auto_44452 ) ( IN-CITY ?auto_44444 ?auto_44452 ) ( not ( = ?auto_44444 ?auto_44451 ) ) ( OBJ-AT ?auto_44447 ?auto_44451 ) ( OBJ-AT ?auto_44446 ?auto_44451 ) ( OBJ-AT ?auto_44445 ?auto_44451 ) ( IN-CITY ?auto_44450 ?auto_44452 ) ( not ( = ?auto_44444 ?auto_44450 ) ) ( OBJ-AT ?auto_44449 ?auto_44450 ) ( IN-CITY ?auto_44454 ?auto_44452 ) ( not ( = ?auto_44444 ?auto_44454 ) ) ( OBJ-AT ?auto_44448 ?auto_44454 ) ( TRUCK-AT ?auto_44453 ?auto_44444 ) ( not ( = ?auto_44448 ?auto_44449 ) ) ( not ( = ?auto_44450 ?auto_44454 ) ) ( not ( = ?auto_44448 ?auto_44445 ) ) ( not ( = ?auto_44449 ?auto_44445 ) ) ( not ( = ?auto_44451 ?auto_44450 ) ) ( not ( = ?auto_44451 ?auto_44454 ) ) ( not ( = ?auto_44448 ?auto_44446 ) ) ( not ( = ?auto_44449 ?auto_44446 ) ) ( not ( = ?auto_44445 ?auto_44446 ) ) ( not ( = ?auto_44448 ?auto_44447 ) ) ( not ( = ?auto_44449 ?auto_44447 ) ) ( not ( = ?auto_44445 ?auto_44447 ) ) ( not ( = ?auto_44446 ?auto_44447 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44448 ?auto_44449 ?auto_44445 ?auto_44447 ?auto_44446 ?auto_44444 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44492 - OBJ
      ?auto_44493 - OBJ
      ?auto_44494 - OBJ
      ?auto_44495 - OBJ
      ?auto_44496 - OBJ
      ?auto_44491 - LOCATION
    )
    :vars
    (
      ?auto_44498 - LOCATION
      ?auto_44499 - CITY
      ?auto_44497 - LOCATION
      ?auto_44501 - LOCATION
      ?auto_44500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44498 ?auto_44499 ) ( IN-CITY ?auto_44491 ?auto_44499 ) ( not ( = ?auto_44491 ?auto_44498 ) ) ( OBJ-AT ?auto_44494 ?auto_44498 ) ( OBJ-AT ?auto_44493 ?auto_44498 ) ( OBJ-AT ?auto_44492 ?auto_44498 ) ( IN-CITY ?auto_44497 ?auto_44499 ) ( not ( = ?auto_44491 ?auto_44497 ) ) ( OBJ-AT ?auto_44495 ?auto_44497 ) ( IN-CITY ?auto_44501 ?auto_44499 ) ( not ( = ?auto_44491 ?auto_44501 ) ) ( OBJ-AT ?auto_44496 ?auto_44501 ) ( TRUCK-AT ?auto_44500 ?auto_44491 ) ( not ( = ?auto_44496 ?auto_44495 ) ) ( not ( = ?auto_44497 ?auto_44501 ) ) ( not ( = ?auto_44496 ?auto_44492 ) ) ( not ( = ?auto_44495 ?auto_44492 ) ) ( not ( = ?auto_44498 ?auto_44497 ) ) ( not ( = ?auto_44498 ?auto_44501 ) ) ( not ( = ?auto_44496 ?auto_44493 ) ) ( not ( = ?auto_44495 ?auto_44493 ) ) ( not ( = ?auto_44492 ?auto_44493 ) ) ( not ( = ?auto_44496 ?auto_44494 ) ) ( not ( = ?auto_44495 ?auto_44494 ) ) ( not ( = ?auto_44492 ?auto_44494 ) ) ( not ( = ?auto_44493 ?auto_44494 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44496 ?auto_44495 ?auto_44492 ?auto_44494 ?auto_44493 ?auto_44491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44839 - OBJ
      ?auto_44840 - OBJ
      ?auto_44841 - OBJ
      ?auto_44842 - OBJ
      ?auto_44843 - OBJ
      ?auto_44838 - LOCATION
    )
    :vars
    (
      ?auto_44845 - LOCATION
      ?auto_44846 - CITY
      ?auto_44844 - LOCATION
      ?auto_44848 - LOCATION
      ?auto_44847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44845 ?auto_44846 ) ( IN-CITY ?auto_44838 ?auto_44846 ) ( not ( = ?auto_44838 ?auto_44845 ) ) ( OBJ-AT ?auto_44840 ?auto_44845 ) ( OBJ-AT ?auto_44843 ?auto_44845 ) ( OBJ-AT ?auto_44839 ?auto_44845 ) ( IN-CITY ?auto_44844 ?auto_44846 ) ( not ( = ?auto_44838 ?auto_44844 ) ) ( OBJ-AT ?auto_44842 ?auto_44844 ) ( IN-CITY ?auto_44848 ?auto_44846 ) ( not ( = ?auto_44838 ?auto_44848 ) ) ( OBJ-AT ?auto_44841 ?auto_44848 ) ( TRUCK-AT ?auto_44847 ?auto_44838 ) ( not ( = ?auto_44841 ?auto_44842 ) ) ( not ( = ?auto_44844 ?auto_44848 ) ) ( not ( = ?auto_44841 ?auto_44839 ) ) ( not ( = ?auto_44842 ?auto_44839 ) ) ( not ( = ?auto_44845 ?auto_44844 ) ) ( not ( = ?auto_44845 ?auto_44848 ) ) ( not ( = ?auto_44841 ?auto_44843 ) ) ( not ( = ?auto_44842 ?auto_44843 ) ) ( not ( = ?auto_44839 ?auto_44843 ) ) ( not ( = ?auto_44841 ?auto_44840 ) ) ( not ( = ?auto_44842 ?auto_44840 ) ) ( not ( = ?auto_44839 ?auto_44840 ) ) ( not ( = ?auto_44843 ?auto_44840 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44841 ?auto_44842 ?auto_44839 ?auto_44840 ?auto_44843 ?auto_44838 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_44937 - OBJ
      ?auto_44938 - OBJ
      ?auto_44939 - OBJ
      ?auto_44940 - OBJ
      ?auto_44941 - OBJ
      ?auto_44936 - LOCATION
    )
    :vars
    (
      ?auto_44943 - LOCATION
      ?auto_44944 - CITY
      ?auto_44942 - LOCATION
      ?auto_44946 - LOCATION
      ?auto_44945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_44943 ?auto_44944 ) ( IN-CITY ?auto_44936 ?auto_44944 ) ( not ( = ?auto_44936 ?auto_44943 ) ) ( OBJ-AT ?auto_44938 ?auto_44943 ) ( OBJ-AT ?auto_44940 ?auto_44943 ) ( OBJ-AT ?auto_44937 ?auto_44943 ) ( IN-CITY ?auto_44942 ?auto_44944 ) ( not ( = ?auto_44936 ?auto_44942 ) ) ( OBJ-AT ?auto_44941 ?auto_44942 ) ( IN-CITY ?auto_44946 ?auto_44944 ) ( not ( = ?auto_44936 ?auto_44946 ) ) ( OBJ-AT ?auto_44939 ?auto_44946 ) ( TRUCK-AT ?auto_44945 ?auto_44936 ) ( not ( = ?auto_44939 ?auto_44941 ) ) ( not ( = ?auto_44942 ?auto_44946 ) ) ( not ( = ?auto_44939 ?auto_44937 ) ) ( not ( = ?auto_44941 ?auto_44937 ) ) ( not ( = ?auto_44943 ?auto_44942 ) ) ( not ( = ?auto_44943 ?auto_44946 ) ) ( not ( = ?auto_44939 ?auto_44940 ) ) ( not ( = ?auto_44941 ?auto_44940 ) ) ( not ( = ?auto_44937 ?auto_44940 ) ) ( not ( = ?auto_44939 ?auto_44938 ) ) ( not ( = ?auto_44941 ?auto_44938 ) ) ( not ( = ?auto_44937 ?auto_44938 ) ) ( not ( = ?auto_44940 ?auto_44938 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_44939 ?auto_44941 ?auto_44937 ?auto_44938 ?auto_44940 ?auto_44936 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45083 - OBJ
      ?auto_45084 - OBJ
      ?auto_45085 - OBJ
      ?auto_45086 - OBJ
      ?auto_45087 - OBJ
      ?auto_45082 - LOCATION
    )
    :vars
    (
      ?auto_45089 - LOCATION
      ?auto_45090 - CITY
      ?auto_45088 - LOCATION
      ?auto_45092 - LOCATION
      ?auto_45091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45089 ?auto_45090 ) ( IN-CITY ?auto_45082 ?auto_45090 ) ( not ( = ?auto_45082 ?auto_45089 ) ) ( OBJ-AT ?auto_45084 ?auto_45089 ) ( OBJ-AT ?auto_45087 ?auto_45089 ) ( OBJ-AT ?auto_45083 ?auto_45089 ) ( IN-CITY ?auto_45088 ?auto_45090 ) ( not ( = ?auto_45082 ?auto_45088 ) ) ( OBJ-AT ?auto_45085 ?auto_45088 ) ( IN-CITY ?auto_45092 ?auto_45090 ) ( not ( = ?auto_45082 ?auto_45092 ) ) ( OBJ-AT ?auto_45086 ?auto_45092 ) ( TRUCK-AT ?auto_45091 ?auto_45082 ) ( not ( = ?auto_45086 ?auto_45085 ) ) ( not ( = ?auto_45088 ?auto_45092 ) ) ( not ( = ?auto_45086 ?auto_45083 ) ) ( not ( = ?auto_45085 ?auto_45083 ) ) ( not ( = ?auto_45089 ?auto_45088 ) ) ( not ( = ?auto_45089 ?auto_45092 ) ) ( not ( = ?auto_45086 ?auto_45087 ) ) ( not ( = ?auto_45085 ?auto_45087 ) ) ( not ( = ?auto_45083 ?auto_45087 ) ) ( not ( = ?auto_45086 ?auto_45084 ) ) ( not ( = ?auto_45085 ?auto_45084 ) ) ( not ( = ?auto_45083 ?auto_45084 ) ) ( not ( = ?auto_45087 ?auto_45084 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45086 ?auto_45085 ?auto_45083 ?auto_45084 ?auto_45087 ?auto_45082 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45232 - OBJ
      ?auto_45233 - OBJ
      ?auto_45234 - OBJ
      ?auto_45235 - OBJ
      ?auto_45236 - OBJ
      ?auto_45231 - LOCATION
    )
    :vars
    (
      ?auto_45238 - LOCATION
      ?auto_45239 - CITY
      ?auto_45237 - LOCATION
      ?auto_45241 - LOCATION
      ?auto_45240 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45238 ?auto_45239 ) ( IN-CITY ?auto_45231 ?auto_45239 ) ( not ( = ?auto_45231 ?auto_45238 ) ) ( OBJ-AT ?auto_45233 ?auto_45238 ) ( OBJ-AT ?auto_45235 ?auto_45238 ) ( OBJ-AT ?auto_45232 ?auto_45238 ) ( IN-CITY ?auto_45237 ?auto_45239 ) ( not ( = ?auto_45231 ?auto_45237 ) ) ( OBJ-AT ?auto_45234 ?auto_45237 ) ( IN-CITY ?auto_45241 ?auto_45239 ) ( not ( = ?auto_45231 ?auto_45241 ) ) ( OBJ-AT ?auto_45236 ?auto_45241 ) ( TRUCK-AT ?auto_45240 ?auto_45231 ) ( not ( = ?auto_45236 ?auto_45234 ) ) ( not ( = ?auto_45237 ?auto_45241 ) ) ( not ( = ?auto_45236 ?auto_45232 ) ) ( not ( = ?auto_45234 ?auto_45232 ) ) ( not ( = ?auto_45238 ?auto_45237 ) ) ( not ( = ?auto_45238 ?auto_45241 ) ) ( not ( = ?auto_45236 ?auto_45235 ) ) ( not ( = ?auto_45234 ?auto_45235 ) ) ( not ( = ?auto_45232 ?auto_45235 ) ) ( not ( = ?auto_45236 ?auto_45233 ) ) ( not ( = ?auto_45234 ?auto_45233 ) ) ( not ( = ?auto_45232 ?auto_45233 ) ) ( not ( = ?auto_45235 ?auto_45233 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45236 ?auto_45234 ?auto_45232 ?auto_45233 ?auto_45235 ?auto_45231 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45689 - OBJ
      ?auto_45690 - OBJ
      ?auto_45691 - OBJ
      ?auto_45692 - OBJ
      ?auto_45693 - OBJ
      ?auto_45688 - LOCATION
    )
    :vars
    (
      ?auto_45695 - LOCATION
      ?auto_45696 - CITY
      ?auto_45694 - LOCATION
      ?auto_45698 - LOCATION
      ?auto_45697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45695 ?auto_45696 ) ( IN-CITY ?auto_45688 ?auto_45696 ) ( not ( = ?auto_45688 ?auto_45695 ) ) ( OBJ-AT ?auto_45690 ?auto_45695 ) ( OBJ-AT ?auto_45691 ?auto_45695 ) ( OBJ-AT ?auto_45689 ?auto_45695 ) ( IN-CITY ?auto_45694 ?auto_45696 ) ( not ( = ?auto_45688 ?auto_45694 ) ) ( OBJ-AT ?auto_45693 ?auto_45694 ) ( IN-CITY ?auto_45698 ?auto_45696 ) ( not ( = ?auto_45688 ?auto_45698 ) ) ( OBJ-AT ?auto_45692 ?auto_45698 ) ( TRUCK-AT ?auto_45697 ?auto_45688 ) ( not ( = ?auto_45692 ?auto_45693 ) ) ( not ( = ?auto_45694 ?auto_45698 ) ) ( not ( = ?auto_45692 ?auto_45689 ) ) ( not ( = ?auto_45693 ?auto_45689 ) ) ( not ( = ?auto_45695 ?auto_45694 ) ) ( not ( = ?auto_45695 ?auto_45698 ) ) ( not ( = ?auto_45692 ?auto_45691 ) ) ( not ( = ?auto_45693 ?auto_45691 ) ) ( not ( = ?auto_45689 ?auto_45691 ) ) ( not ( = ?auto_45692 ?auto_45690 ) ) ( not ( = ?auto_45693 ?auto_45690 ) ) ( not ( = ?auto_45689 ?auto_45690 ) ) ( not ( = ?auto_45691 ?auto_45690 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45692 ?auto_45693 ?auto_45689 ?auto_45690 ?auto_45691 ?auto_45688 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_45736 - OBJ
      ?auto_45737 - OBJ
      ?auto_45738 - OBJ
      ?auto_45739 - OBJ
      ?auto_45740 - OBJ
      ?auto_45735 - LOCATION
    )
    :vars
    (
      ?auto_45742 - LOCATION
      ?auto_45743 - CITY
      ?auto_45741 - LOCATION
      ?auto_45745 - LOCATION
      ?auto_45744 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_45742 ?auto_45743 ) ( IN-CITY ?auto_45735 ?auto_45743 ) ( not ( = ?auto_45735 ?auto_45742 ) ) ( OBJ-AT ?auto_45737 ?auto_45742 ) ( OBJ-AT ?auto_45738 ?auto_45742 ) ( OBJ-AT ?auto_45736 ?auto_45742 ) ( IN-CITY ?auto_45741 ?auto_45743 ) ( not ( = ?auto_45735 ?auto_45741 ) ) ( OBJ-AT ?auto_45739 ?auto_45741 ) ( IN-CITY ?auto_45745 ?auto_45743 ) ( not ( = ?auto_45735 ?auto_45745 ) ) ( OBJ-AT ?auto_45740 ?auto_45745 ) ( TRUCK-AT ?auto_45744 ?auto_45735 ) ( not ( = ?auto_45740 ?auto_45739 ) ) ( not ( = ?auto_45741 ?auto_45745 ) ) ( not ( = ?auto_45740 ?auto_45736 ) ) ( not ( = ?auto_45739 ?auto_45736 ) ) ( not ( = ?auto_45742 ?auto_45741 ) ) ( not ( = ?auto_45742 ?auto_45745 ) ) ( not ( = ?auto_45740 ?auto_45738 ) ) ( not ( = ?auto_45739 ?auto_45738 ) ) ( not ( = ?auto_45736 ?auto_45738 ) ) ( not ( = ?auto_45740 ?auto_45737 ) ) ( not ( = ?auto_45739 ?auto_45737 ) ) ( not ( = ?auto_45736 ?auto_45737 ) ) ( not ( = ?auto_45738 ?auto_45737 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_45740 ?auto_45739 ?auto_45736 ?auto_45737 ?auto_45738 ?auto_45735 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46444 - OBJ
      ?auto_46445 - OBJ
      ?auto_46446 - OBJ
      ?auto_46447 - OBJ
      ?auto_46448 - OBJ
      ?auto_46443 - LOCATION
    )
    :vars
    (
      ?auto_46450 - LOCATION
      ?auto_46451 - CITY
      ?auto_46449 - LOCATION
      ?auto_46453 - LOCATION
      ?auto_46452 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46450 ?auto_46451 ) ( IN-CITY ?auto_46443 ?auto_46451 ) ( not ( = ?auto_46443 ?auto_46450 ) ) ( OBJ-AT ?auto_46448 ?auto_46450 ) ( OBJ-AT ?auto_46444 ?auto_46450 ) ( OBJ-AT ?auto_46447 ?auto_46450 ) ( IN-CITY ?auto_46449 ?auto_46451 ) ( not ( = ?auto_46443 ?auto_46449 ) ) ( OBJ-AT ?auto_46446 ?auto_46449 ) ( IN-CITY ?auto_46453 ?auto_46451 ) ( not ( = ?auto_46443 ?auto_46453 ) ) ( OBJ-AT ?auto_46445 ?auto_46453 ) ( TRUCK-AT ?auto_46452 ?auto_46443 ) ( not ( = ?auto_46445 ?auto_46446 ) ) ( not ( = ?auto_46449 ?auto_46453 ) ) ( not ( = ?auto_46445 ?auto_46447 ) ) ( not ( = ?auto_46446 ?auto_46447 ) ) ( not ( = ?auto_46450 ?auto_46449 ) ) ( not ( = ?auto_46450 ?auto_46453 ) ) ( not ( = ?auto_46445 ?auto_46444 ) ) ( not ( = ?auto_46446 ?auto_46444 ) ) ( not ( = ?auto_46447 ?auto_46444 ) ) ( not ( = ?auto_46445 ?auto_46448 ) ) ( not ( = ?auto_46446 ?auto_46448 ) ) ( not ( = ?auto_46447 ?auto_46448 ) ) ( not ( = ?auto_46444 ?auto_46448 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46445 ?auto_46446 ?auto_46447 ?auto_46448 ?auto_46444 ?auto_46443 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46491 - OBJ
      ?auto_46492 - OBJ
      ?auto_46493 - OBJ
      ?auto_46494 - OBJ
      ?auto_46495 - OBJ
      ?auto_46490 - LOCATION
    )
    :vars
    (
      ?auto_46497 - LOCATION
      ?auto_46498 - CITY
      ?auto_46496 - LOCATION
      ?auto_46500 - LOCATION
      ?auto_46499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46497 ?auto_46498 ) ( IN-CITY ?auto_46490 ?auto_46498 ) ( not ( = ?auto_46490 ?auto_46497 ) ) ( OBJ-AT ?auto_46494 ?auto_46497 ) ( OBJ-AT ?auto_46491 ?auto_46497 ) ( OBJ-AT ?auto_46495 ?auto_46497 ) ( IN-CITY ?auto_46496 ?auto_46498 ) ( not ( = ?auto_46490 ?auto_46496 ) ) ( OBJ-AT ?auto_46493 ?auto_46496 ) ( IN-CITY ?auto_46500 ?auto_46498 ) ( not ( = ?auto_46490 ?auto_46500 ) ) ( OBJ-AT ?auto_46492 ?auto_46500 ) ( TRUCK-AT ?auto_46499 ?auto_46490 ) ( not ( = ?auto_46492 ?auto_46493 ) ) ( not ( = ?auto_46496 ?auto_46500 ) ) ( not ( = ?auto_46492 ?auto_46495 ) ) ( not ( = ?auto_46493 ?auto_46495 ) ) ( not ( = ?auto_46497 ?auto_46496 ) ) ( not ( = ?auto_46497 ?auto_46500 ) ) ( not ( = ?auto_46492 ?auto_46491 ) ) ( not ( = ?auto_46493 ?auto_46491 ) ) ( not ( = ?auto_46495 ?auto_46491 ) ) ( not ( = ?auto_46492 ?auto_46494 ) ) ( not ( = ?auto_46493 ?auto_46494 ) ) ( not ( = ?auto_46495 ?auto_46494 ) ) ( not ( = ?auto_46491 ?auto_46494 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46492 ?auto_46493 ?auto_46495 ?auto_46494 ?auto_46491 ?auto_46490 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46538 - OBJ
      ?auto_46539 - OBJ
      ?auto_46540 - OBJ
      ?auto_46541 - OBJ
      ?auto_46542 - OBJ
      ?auto_46537 - LOCATION
    )
    :vars
    (
      ?auto_46544 - LOCATION
      ?auto_46545 - CITY
      ?auto_46543 - LOCATION
      ?auto_46547 - LOCATION
      ?auto_46546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46544 ?auto_46545 ) ( IN-CITY ?auto_46537 ?auto_46545 ) ( not ( = ?auto_46537 ?auto_46544 ) ) ( OBJ-AT ?auto_46542 ?auto_46544 ) ( OBJ-AT ?auto_46538 ?auto_46544 ) ( OBJ-AT ?auto_46540 ?auto_46544 ) ( IN-CITY ?auto_46543 ?auto_46545 ) ( not ( = ?auto_46537 ?auto_46543 ) ) ( OBJ-AT ?auto_46541 ?auto_46543 ) ( IN-CITY ?auto_46547 ?auto_46545 ) ( not ( = ?auto_46537 ?auto_46547 ) ) ( OBJ-AT ?auto_46539 ?auto_46547 ) ( TRUCK-AT ?auto_46546 ?auto_46537 ) ( not ( = ?auto_46539 ?auto_46541 ) ) ( not ( = ?auto_46543 ?auto_46547 ) ) ( not ( = ?auto_46539 ?auto_46540 ) ) ( not ( = ?auto_46541 ?auto_46540 ) ) ( not ( = ?auto_46544 ?auto_46543 ) ) ( not ( = ?auto_46544 ?auto_46547 ) ) ( not ( = ?auto_46539 ?auto_46538 ) ) ( not ( = ?auto_46541 ?auto_46538 ) ) ( not ( = ?auto_46540 ?auto_46538 ) ) ( not ( = ?auto_46539 ?auto_46542 ) ) ( not ( = ?auto_46541 ?auto_46542 ) ) ( not ( = ?auto_46540 ?auto_46542 ) ) ( not ( = ?auto_46538 ?auto_46542 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46539 ?auto_46541 ?auto_46540 ?auto_46542 ?auto_46538 ?auto_46537 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46585 - OBJ
      ?auto_46586 - OBJ
      ?auto_46587 - OBJ
      ?auto_46588 - OBJ
      ?auto_46589 - OBJ
      ?auto_46584 - LOCATION
    )
    :vars
    (
      ?auto_46591 - LOCATION
      ?auto_46592 - CITY
      ?auto_46590 - LOCATION
      ?auto_46594 - LOCATION
      ?auto_46593 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46591 ?auto_46592 ) ( IN-CITY ?auto_46584 ?auto_46592 ) ( not ( = ?auto_46584 ?auto_46591 ) ) ( OBJ-AT ?auto_46588 ?auto_46591 ) ( OBJ-AT ?auto_46585 ?auto_46591 ) ( OBJ-AT ?auto_46587 ?auto_46591 ) ( IN-CITY ?auto_46590 ?auto_46592 ) ( not ( = ?auto_46584 ?auto_46590 ) ) ( OBJ-AT ?auto_46589 ?auto_46590 ) ( IN-CITY ?auto_46594 ?auto_46592 ) ( not ( = ?auto_46584 ?auto_46594 ) ) ( OBJ-AT ?auto_46586 ?auto_46594 ) ( TRUCK-AT ?auto_46593 ?auto_46584 ) ( not ( = ?auto_46586 ?auto_46589 ) ) ( not ( = ?auto_46590 ?auto_46594 ) ) ( not ( = ?auto_46586 ?auto_46587 ) ) ( not ( = ?auto_46589 ?auto_46587 ) ) ( not ( = ?auto_46591 ?auto_46590 ) ) ( not ( = ?auto_46591 ?auto_46594 ) ) ( not ( = ?auto_46586 ?auto_46585 ) ) ( not ( = ?auto_46589 ?auto_46585 ) ) ( not ( = ?auto_46587 ?auto_46585 ) ) ( not ( = ?auto_46586 ?auto_46588 ) ) ( not ( = ?auto_46589 ?auto_46588 ) ) ( not ( = ?auto_46587 ?auto_46588 ) ) ( not ( = ?auto_46585 ?auto_46588 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46586 ?auto_46589 ?auto_46587 ?auto_46588 ?auto_46585 ?auto_46584 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46832 - OBJ
      ?auto_46833 - OBJ
      ?auto_46834 - OBJ
      ?auto_46835 - OBJ
      ?auto_46836 - OBJ
      ?auto_46831 - LOCATION
    )
    :vars
    (
      ?auto_46838 - LOCATION
      ?auto_46839 - CITY
      ?auto_46837 - LOCATION
      ?auto_46841 - LOCATION
      ?auto_46840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46838 ?auto_46839 ) ( IN-CITY ?auto_46831 ?auto_46839 ) ( not ( = ?auto_46831 ?auto_46838 ) ) ( OBJ-AT ?auto_46834 ?auto_46838 ) ( OBJ-AT ?auto_46832 ?auto_46838 ) ( OBJ-AT ?auto_46836 ?auto_46838 ) ( IN-CITY ?auto_46837 ?auto_46839 ) ( not ( = ?auto_46831 ?auto_46837 ) ) ( OBJ-AT ?auto_46835 ?auto_46837 ) ( IN-CITY ?auto_46841 ?auto_46839 ) ( not ( = ?auto_46831 ?auto_46841 ) ) ( OBJ-AT ?auto_46833 ?auto_46841 ) ( TRUCK-AT ?auto_46840 ?auto_46831 ) ( not ( = ?auto_46833 ?auto_46835 ) ) ( not ( = ?auto_46837 ?auto_46841 ) ) ( not ( = ?auto_46833 ?auto_46836 ) ) ( not ( = ?auto_46835 ?auto_46836 ) ) ( not ( = ?auto_46838 ?auto_46837 ) ) ( not ( = ?auto_46838 ?auto_46841 ) ) ( not ( = ?auto_46833 ?auto_46832 ) ) ( not ( = ?auto_46835 ?auto_46832 ) ) ( not ( = ?auto_46836 ?auto_46832 ) ) ( not ( = ?auto_46833 ?auto_46834 ) ) ( not ( = ?auto_46835 ?auto_46834 ) ) ( not ( = ?auto_46836 ?auto_46834 ) ) ( not ( = ?auto_46832 ?auto_46834 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46833 ?auto_46835 ?auto_46836 ?auto_46834 ?auto_46832 ?auto_46831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_46879 - OBJ
      ?auto_46880 - OBJ
      ?auto_46881 - OBJ
      ?auto_46882 - OBJ
      ?auto_46883 - OBJ
      ?auto_46878 - LOCATION
    )
    :vars
    (
      ?auto_46885 - LOCATION
      ?auto_46886 - CITY
      ?auto_46884 - LOCATION
      ?auto_46888 - LOCATION
      ?auto_46887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46885 ?auto_46886 ) ( IN-CITY ?auto_46878 ?auto_46886 ) ( not ( = ?auto_46878 ?auto_46885 ) ) ( OBJ-AT ?auto_46881 ?auto_46885 ) ( OBJ-AT ?auto_46879 ?auto_46885 ) ( OBJ-AT ?auto_46882 ?auto_46885 ) ( IN-CITY ?auto_46884 ?auto_46886 ) ( not ( = ?auto_46878 ?auto_46884 ) ) ( OBJ-AT ?auto_46883 ?auto_46884 ) ( IN-CITY ?auto_46888 ?auto_46886 ) ( not ( = ?auto_46878 ?auto_46888 ) ) ( OBJ-AT ?auto_46880 ?auto_46888 ) ( TRUCK-AT ?auto_46887 ?auto_46878 ) ( not ( = ?auto_46880 ?auto_46883 ) ) ( not ( = ?auto_46884 ?auto_46888 ) ) ( not ( = ?auto_46880 ?auto_46882 ) ) ( not ( = ?auto_46883 ?auto_46882 ) ) ( not ( = ?auto_46885 ?auto_46884 ) ) ( not ( = ?auto_46885 ?auto_46888 ) ) ( not ( = ?auto_46880 ?auto_46879 ) ) ( not ( = ?auto_46883 ?auto_46879 ) ) ( not ( = ?auto_46882 ?auto_46879 ) ) ( not ( = ?auto_46880 ?auto_46881 ) ) ( not ( = ?auto_46883 ?auto_46881 ) ) ( not ( = ?auto_46882 ?auto_46881 ) ) ( not ( = ?auto_46879 ?auto_46881 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_46880 ?auto_46883 ?auto_46882 ?auto_46881 ?auto_46879 ?auto_46878 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47076 - OBJ
      ?auto_47077 - OBJ
      ?auto_47078 - OBJ
      ?auto_47079 - OBJ
      ?auto_47080 - OBJ
      ?auto_47075 - LOCATION
    )
    :vars
    (
      ?auto_47082 - LOCATION
      ?auto_47083 - CITY
      ?auto_47081 - LOCATION
      ?auto_47085 - LOCATION
      ?auto_47084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47082 ?auto_47083 ) ( IN-CITY ?auto_47075 ?auto_47083 ) ( not ( = ?auto_47075 ?auto_47082 ) ) ( OBJ-AT ?auto_47080 ?auto_47082 ) ( OBJ-AT ?auto_47076 ?auto_47082 ) ( OBJ-AT ?auto_47079 ?auto_47082 ) ( IN-CITY ?auto_47081 ?auto_47083 ) ( not ( = ?auto_47075 ?auto_47081 ) ) ( OBJ-AT ?auto_47077 ?auto_47081 ) ( IN-CITY ?auto_47085 ?auto_47083 ) ( not ( = ?auto_47075 ?auto_47085 ) ) ( OBJ-AT ?auto_47078 ?auto_47085 ) ( TRUCK-AT ?auto_47084 ?auto_47075 ) ( not ( = ?auto_47078 ?auto_47077 ) ) ( not ( = ?auto_47081 ?auto_47085 ) ) ( not ( = ?auto_47078 ?auto_47079 ) ) ( not ( = ?auto_47077 ?auto_47079 ) ) ( not ( = ?auto_47082 ?auto_47081 ) ) ( not ( = ?auto_47082 ?auto_47085 ) ) ( not ( = ?auto_47078 ?auto_47076 ) ) ( not ( = ?auto_47077 ?auto_47076 ) ) ( not ( = ?auto_47079 ?auto_47076 ) ) ( not ( = ?auto_47078 ?auto_47080 ) ) ( not ( = ?auto_47077 ?auto_47080 ) ) ( not ( = ?auto_47079 ?auto_47080 ) ) ( not ( = ?auto_47076 ?auto_47080 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47078 ?auto_47077 ?auto_47079 ?auto_47080 ?auto_47076 ?auto_47075 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47123 - OBJ
      ?auto_47124 - OBJ
      ?auto_47125 - OBJ
      ?auto_47126 - OBJ
      ?auto_47127 - OBJ
      ?auto_47122 - LOCATION
    )
    :vars
    (
      ?auto_47129 - LOCATION
      ?auto_47130 - CITY
      ?auto_47128 - LOCATION
      ?auto_47132 - LOCATION
      ?auto_47131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47129 ?auto_47130 ) ( IN-CITY ?auto_47122 ?auto_47130 ) ( not ( = ?auto_47122 ?auto_47129 ) ) ( OBJ-AT ?auto_47126 ?auto_47129 ) ( OBJ-AT ?auto_47123 ?auto_47129 ) ( OBJ-AT ?auto_47127 ?auto_47129 ) ( IN-CITY ?auto_47128 ?auto_47130 ) ( not ( = ?auto_47122 ?auto_47128 ) ) ( OBJ-AT ?auto_47124 ?auto_47128 ) ( IN-CITY ?auto_47132 ?auto_47130 ) ( not ( = ?auto_47122 ?auto_47132 ) ) ( OBJ-AT ?auto_47125 ?auto_47132 ) ( TRUCK-AT ?auto_47131 ?auto_47122 ) ( not ( = ?auto_47125 ?auto_47124 ) ) ( not ( = ?auto_47128 ?auto_47132 ) ) ( not ( = ?auto_47125 ?auto_47127 ) ) ( not ( = ?auto_47124 ?auto_47127 ) ) ( not ( = ?auto_47129 ?auto_47128 ) ) ( not ( = ?auto_47129 ?auto_47132 ) ) ( not ( = ?auto_47125 ?auto_47123 ) ) ( not ( = ?auto_47124 ?auto_47123 ) ) ( not ( = ?auto_47127 ?auto_47123 ) ) ( not ( = ?auto_47125 ?auto_47126 ) ) ( not ( = ?auto_47124 ?auto_47126 ) ) ( not ( = ?auto_47127 ?auto_47126 ) ) ( not ( = ?auto_47123 ?auto_47126 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47125 ?auto_47124 ?auto_47127 ?auto_47126 ?auto_47123 ?auto_47122 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47271 - OBJ
      ?auto_47272 - OBJ
      ?auto_47273 - OBJ
      ?auto_47274 - OBJ
      ?auto_47275 - OBJ
      ?auto_47270 - LOCATION
    )
    :vars
    (
      ?auto_47277 - LOCATION
      ?auto_47278 - CITY
      ?auto_47276 - LOCATION
      ?auto_47280 - LOCATION
      ?auto_47279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47277 ?auto_47278 ) ( IN-CITY ?auto_47270 ?auto_47278 ) ( not ( = ?auto_47270 ?auto_47277 ) ) ( OBJ-AT ?auto_47275 ?auto_47277 ) ( OBJ-AT ?auto_47271 ?auto_47277 ) ( OBJ-AT ?auto_47273 ?auto_47277 ) ( IN-CITY ?auto_47276 ?auto_47278 ) ( not ( = ?auto_47270 ?auto_47276 ) ) ( OBJ-AT ?auto_47272 ?auto_47276 ) ( IN-CITY ?auto_47280 ?auto_47278 ) ( not ( = ?auto_47270 ?auto_47280 ) ) ( OBJ-AT ?auto_47274 ?auto_47280 ) ( TRUCK-AT ?auto_47279 ?auto_47270 ) ( not ( = ?auto_47274 ?auto_47272 ) ) ( not ( = ?auto_47276 ?auto_47280 ) ) ( not ( = ?auto_47274 ?auto_47273 ) ) ( not ( = ?auto_47272 ?auto_47273 ) ) ( not ( = ?auto_47277 ?auto_47276 ) ) ( not ( = ?auto_47277 ?auto_47280 ) ) ( not ( = ?auto_47274 ?auto_47271 ) ) ( not ( = ?auto_47272 ?auto_47271 ) ) ( not ( = ?auto_47273 ?auto_47271 ) ) ( not ( = ?auto_47274 ?auto_47275 ) ) ( not ( = ?auto_47272 ?auto_47275 ) ) ( not ( = ?auto_47273 ?auto_47275 ) ) ( not ( = ?auto_47271 ?auto_47275 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47274 ?auto_47272 ?auto_47273 ?auto_47275 ?auto_47271 ?auto_47270 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47318 - OBJ
      ?auto_47319 - OBJ
      ?auto_47320 - OBJ
      ?auto_47321 - OBJ
      ?auto_47322 - OBJ
      ?auto_47317 - LOCATION
    )
    :vars
    (
      ?auto_47324 - LOCATION
      ?auto_47325 - CITY
      ?auto_47323 - LOCATION
      ?auto_47327 - LOCATION
      ?auto_47326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47324 ?auto_47325 ) ( IN-CITY ?auto_47317 ?auto_47325 ) ( not ( = ?auto_47317 ?auto_47324 ) ) ( OBJ-AT ?auto_47321 ?auto_47324 ) ( OBJ-AT ?auto_47318 ?auto_47324 ) ( OBJ-AT ?auto_47320 ?auto_47324 ) ( IN-CITY ?auto_47323 ?auto_47325 ) ( not ( = ?auto_47317 ?auto_47323 ) ) ( OBJ-AT ?auto_47319 ?auto_47323 ) ( IN-CITY ?auto_47327 ?auto_47325 ) ( not ( = ?auto_47317 ?auto_47327 ) ) ( OBJ-AT ?auto_47322 ?auto_47327 ) ( TRUCK-AT ?auto_47326 ?auto_47317 ) ( not ( = ?auto_47322 ?auto_47319 ) ) ( not ( = ?auto_47323 ?auto_47327 ) ) ( not ( = ?auto_47322 ?auto_47320 ) ) ( not ( = ?auto_47319 ?auto_47320 ) ) ( not ( = ?auto_47324 ?auto_47323 ) ) ( not ( = ?auto_47324 ?auto_47327 ) ) ( not ( = ?auto_47322 ?auto_47318 ) ) ( not ( = ?auto_47319 ?auto_47318 ) ) ( not ( = ?auto_47320 ?auto_47318 ) ) ( not ( = ?auto_47322 ?auto_47321 ) ) ( not ( = ?auto_47319 ?auto_47321 ) ) ( not ( = ?auto_47320 ?auto_47321 ) ) ( not ( = ?auto_47318 ?auto_47321 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47322 ?auto_47319 ?auto_47320 ?auto_47321 ?auto_47318 ?auto_47317 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47514 - OBJ
      ?auto_47515 - OBJ
      ?auto_47516 - OBJ
      ?auto_47517 - OBJ
      ?auto_47518 - OBJ
      ?auto_47513 - LOCATION
    )
    :vars
    (
      ?auto_47520 - LOCATION
      ?auto_47521 - CITY
      ?auto_47519 - LOCATION
      ?auto_47523 - LOCATION
      ?auto_47522 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47520 ?auto_47521 ) ( IN-CITY ?auto_47513 ?auto_47521 ) ( not ( = ?auto_47513 ?auto_47520 ) ) ( OBJ-AT ?auto_47516 ?auto_47520 ) ( OBJ-AT ?auto_47514 ?auto_47520 ) ( OBJ-AT ?auto_47518 ?auto_47520 ) ( IN-CITY ?auto_47519 ?auto_47521 ) ( not ( = ?auto_47513 ?auto_47519 ) ) ( OBJ-AT ?auto_47515 ?auto_47519 ) ( IN-CITY ?auto_47523 ?auto_47521 ) ( not ( = ?auto_47513 ?auto_47523 ) ) ( OBJ-AT ?auto_47517 ?auto_47523 ) ( TRUCK-AT ?auto_47522 ?auto_47513 ) ( not ( = ?auto_47517 ?auto_47515 ) ) ( not ( = ?auto_47519 ?auto_47523 ) ) ( not ( = ?auto_47517 ?auto_47518 ) ) ( not ( = ?auto_47515 ?auto_47518 ) ) ( not ( = ?auto_47520 ?auto_47519 ) ) ( not ( = ?auto_47520 ?auto_47523 ) ) ( not ( = ?auto_47517 ?auto_47514 ) ) ( not ( = ?auto_47515 ?auto_47514 ) ) ( not ( = ?auto_47518 ?auto_47514 ) ) ( not ( = ?auto_47517 ?auto_47516 ) ) ( not ( = ?auto_47515 ?auto_47516 ) ) ( not ( = ?auto_47518 ?auto_47516 ) ) ( not ( = ?auto_47514 ?auto_47516 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47517 ?auto_47515 ?auto_47518 ?auto_47516 ?auto_47514 ?auto_47513 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47612 - OBJ
      ?auto_47613 - OBJ
      ?auto_47614 - OBJ
      ?auto_47615 - OBJ
      ?auto_47616 - OBJ
      ?auto_47611 - LOCATION
    )
    :vars
    (
      ?auto_47618 - LOCATION
      ?auto_47619 - CITY
      ?auto_47617 - LOCATION
      ?auto_47621 - LOCATION
      ?auto_47620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47618 ?auto_47619 ) ( IN-CITY ?auto_47611 ?auto_47619 ) ( not ( = ?auto_47611 ?auto_47618 ) ) ( OBJ-AT ?auto_47614 ?auto_47618 ) ( OBJ-AT ?auto_47612 ?auto_47618 ) ( OBJ-AT ?auto_47615 ?auto_47618 ) ( IN-CITY ?auto_47617 ?auto_47619 ) ( not ( = ?auto_47611 ?auto_47617 ) ) ( OBJ-AT ?auto_47613 ?auto_47617 ) ( IN-CITY ?auto_47621 ?auto_47619 ) ( not ( = ?auto_47611 ?auto_47621 ) ) ( OBJ-AT ?auto_47616 ?auto_47621 ) ( TRUCK-AT ?auto_47620 ?auto_47611 ) ( not ( = ?auto_47616 ?auto_47613 ) ) ( not ( = ?auto_47617 ?auto_47621 ) ) ( not ( = ?auto_47616 ?auto_47615 ) ) ( not ( = ?auto_47613 ?auto_47615 ) ) ( not ( = ?auto_47618 ?auto_47617 ) ) ( not ( = ?auto_47618 ?auto_47621 ) ) ( not ( = ?auto_47616 ?auto_47612 ) ) ( not ( = ?auto_47613 ?auto_47612 ) ) ( not ( = ?auto_47615 ?auto_47612 ) ) ( not ( = ?auto_47616 ?auto_47614 ) ) ( not ( = ?auto_47613 ?auto_47614 ) ) ( not ( = ?auto_47615 ?auto_47614 ) ) ( not ( = ?auto_47612 ?auto_47614 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47616 ?auto_47613 ?auto_47615 ?auto_47614 ?auto_47612 ?auto_47611 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47809 - OBJ
      ?auto_47810 - OBJ
      ?auto_47811 - OBJ
      ?auto_47812 - OBJ
      ?auto_47813 - OBJ
      ?auto_47808 - LOCATION
    )
    :vars
    (
      ?auto_47815 - LOCATION
      ?auto_47816 - CITY
      ?auto_47814 - LOCATION
      ?auto_47818 - LOCATION
      ?auto_47817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47815 ?auto_47816 ) ( IN-CITY ?auto_47808 ?auto_47816 ) ( not ( = ?auto_47808 ?auto_47815 ) ) ( OBJ-AT ?auto_47813 ?auto_47815 ) ( OBJ-AT ?auto_47809 ?auto_47815 ) ( OBJ-AT ?auto_47810 ?auto_47815 ) ( IN-CITY ?auto_47814 ?auto_47816 ) ( not ( = ?auto_47808 ?auto_47814 ) ) ( OBJ-AT ?auto_47812 ?auto_47814 ) ( IN-CITY ?auto_47818 ?auto_47816 ) ( not ( = ?auto_47808 ?auto_47818 ) ) ( OBJ-AT ?auto_47811 ?auto_47818 ) ( TRUCK-AT ?auto_47817 ?auto_47808 ) ( not ( = ?auto_47811 ?auto_47812 ) ) ( not ( = ?auto_47814 ?auto_47818 ) ) ( not ( = ?auto_47811 ?auto_47810 ) ) ( not ( = ?auto_47812 ?auto_47810 ) ) ( not ( = ?auto_47815 ?auto_47814 ) ) ( not ( = ?auto_47815 ?auto_47818 ) ) ( not ( = ?auto_47811 ?auto_47809 ) ) ( not ( = ?auto_47812 ?auto_47809 ) ) ( not ( = ?auto_47810 ?auto_47809 ) ) ( not ( = ?auto_47811 ?auto_47813 ) ) ( not ( = ?auto_47812 ?auto_47813 ) ) ( not ( = ?auto_47810 ?auto_47813 ) ) ( not ( = ?auto_47809 ?auto_47813 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47811 ?auto_47812 ?auto_47810 ?auto_47813 ?auto_47809 ?auto_47808 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47856 - OBJ
      ?auto_47857 - OBJ
      ?auto_47858 - OBJ
      ?auto_47859 - OBJ
      ?auto_47860 - OBJ
      ?auto_47855 - LOCATION
    )
    :vars
    (
      ?auto_47862 - LOCATION
      ?auto_47863 - CITY
      ?auto_47861 - LOCATION
      ?auto_47865 - LOCATION
      ?auto_47864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47862 ?auto_47863 ) ( IN-CITY ?auto_47855 ?auto_47863 ) ( not ( = ?auto_47855 ?auto_47862 ) ) ( OBJ-AT ?auto_47859 ?auto_47862 ) ( OBJ-AT ?auto_47856 ?auto_47862 ) ( OBJ-AT ?auto_47857 ?auto_47862 ) ( IN-CITY ?auto_47861 ?auto_47863 ) ( not ( = ?auto_47855 ?auto_47861 ) ) ( OBJ-AT ?auto_47860 ?auto_47861 ) ( IN-CITY ?auto_47865 ?auto_47863 ) ( not ( = ?auto_47855 ?auto_47865 ) ) ( OBJ-AT ?auto_47858 ?auto_47865 ) ( TRUCK-AT ?auto_47864 ?auto_47855 ) ( not ( = ?auto_47858 ?auto_47860 ) ) ( not ( = ?auto_47861 ?auto_47865 ) ) ( not ( = ?auto_47858 ?auto_47857 ) ) ( not ( = ?auto_47860 ?auto_47857 ) ) ( not ( = ?auto_47862 ?auto_47861 ) ) ( not ( = ?auto_47862 ?auto_47865 ) ) ( not ( = ?auto_47858 ?auto_47856 ) ) ( not ( = ?auto_47860 ?auto_47856 ) ) ( not ( = ?auto_47857 ?auto_47856 ) ) ( not ( = ?auto_47858 ?auto_47859 ) ) ( not ( = ?auto_47860 ?auto_47859 ) ) ( not ( = ?auto_47857 ?auto_47859 ) ) ( not ( = ?auto_47856 ?auto_47859 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47858 ?auto_47860 ?auto_47857 ?auto_47859 ?auto_47856 ?auto_47855 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47903 - OBJ
      ?auto_47904 - OBJ
      ?auto_47905 - OBJ
      ?auto_47906 - OBJ
      ?auto_47907 - OBJ
      ?auto_47902 - LOCATION
    )
    :vars
    (
      ?auto_47909 - LOCATION
      ?auto_47910 - CITY
      ?auto_47908 - LOCATION
      ?auto_47912 - LOCATION
      ?auto_47911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47909 ?auto_47910 ) ( IN-CITY ?auto_47902 ?auto_47910 ) ( not ( = ?auto_47902 ?auto_47909 ) ) ( OBJ-AT ?auto_47907 ?auto_47909 ) ( OBJ-AT ?auto_47903 ?auto_47909 ) ( OBJ-AT ?auto_47904 ?auto_47909 ) ( IN-CITY ?auto_47908 ?auto_47910 ) ( not ( = ?auto_47902 ?auto_47908 ) ) ( OBJ-AT ?auto_47905 ?auto_47908 ) ( IN-CITY ?auto_47912 ?auto_47910 ) ( not ( = ?auto_47902 ?auto_47912 ) ) ( OBJ-AT ?auto_47906 ?auto_47912 ) ( TRUCK-AT ?auto_47911 ?auto_47902 ) ( not ( = ?auto_47906 ?auto_47905 ) ) ( not ( = ?auto_47908 ?auto_47912 ) ) ( not ( = ?auto_47906 ?auto_47904 ) ) ( not ( = ?auto_47905 ?auto_47904 ) ) ( not ( = ?auto_47909 ?auto_47908 ) ) ( not ( = ?auto_47909 ?auto_47912 ) ) ( not ( = ?auto_47906 ?auto_47903 ) ) ( not ( = ?auto_47905 ?auto_47903 ) ) ( not ( = ?auto_47904 ?auto_47903 ) ) ( not ( = ?auto_47906 ?auto_47907 ) ) ( not ( = ?auto_47905 ?auto_47907 ) ) ( not ( = ?auto_47904 ?auto_47907 ) ) ( not ( = ?auto_47903 ?auto_47907 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47906 ?auto_47905 ?auto_47904 ?auto_47907 ?auto_47903 ?auto_47902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_47950 - OBJ
      ?auto_47951 - OBJ
      ?auto_47952 - OBJ
      ?auto_47953 - OBJ
      ?auto_47954 - OBJ
      ?auto_47949 - LOCATION
    )
    :vars
    (
      ?auto_47956 - LOCATION
      ?auto_47957 - CITY
      ?auto_47955 - LOCATION
      ?auto_47959 - LOCATION
      ?auto_47958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_47956 ?auto_47957 ) ( IN-CITY ?auto_47949 ?auto_47957 ) ( not ( = ?auto_47949 ?auto_47956 ) ) ( OBJ-AT ?auto_47953 ?auto_47956 ) ( OBJ-AT ?auto_47950 ?auto_47956 ) ( OBJ-AT ?auto_47951 ?auto_47956 ) ( IN-CITY ?auto_47955 ?auto_47957 ) ( not ( = ?auto_47949 ?auto_47955 ) ) ( OBJ-AT ?auto_47952 ?auto_47955 ) ( IN-CITY ?auto_47959 ?auto_47957 ) ( not ( = ?auto_47949 ?auto_47959 ) ) ( OBJ-AT ?auto_47954 ?auto_47959 ) ( TRUCK-AT ?auto_47958 ?auto_47949 ) ( not ( = ?auto_47954 ?auto_47952 ) ) ( not ( = ?auto_47955 ?auto_47959 ) ) ( not ( = ?auto_47954 ?auto_47951 ) ) ( not ( = ?auto_47952 ?auto_47951 ) ) ( not ( = ?auto_47956 ?auto_47955 ) ) ( not ( = ?auto_47956 ?auto_47959 ) ) ( not ( = ?auto_47954 ?auto_47950 ) ) ( not ( = ?auto_47952 ?auto_47950 ) ) ( not ( = ?auto_47951 ?auto_47950 ) ) ( not ( = ?auto_47954 ?auto_47953 ) ) ( not ( = ?auto_47952 ?auto_47953 ) ) ( not ( = ?auto_47951 ?auto_47953 ) ) ( not ( = ?auto_47950 ?auto_47953 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_47954 ?auto_47952 ?auto_47951 ?auto_47953 ?auto_47950 ?auto_47949 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48247 - OBJ
      ?auto_48248 - OBJ
      ?auto_48249 - OBJ
      ?auto_48250 - OBJ
      ?auto_48251 - OBJ
      ?auto_48246 - LOCATION
    )
    :vars
    (
      ?auto_48253 - LOCATION
      ?auto_48254 - CITY
      ?auto_48252 - LOCATION
      ?auto_48256 - LOCATION
      ?auto_48255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48253 ?auto_48254 ) ( IN-CITY ?auto_48246 ?auto_48254 ) ( not ( = ?auto_48246 ?auto_48253 ) ) ( OBJ-AT ?auto_48249 ?auto_48253 ) ( OBJ-AT ?auto_48247 ?auto_48253 ) ( OBJ-AT ?auto_48248 ?auto_48253 ) ( IN-CITY ?auto_48252 ?auto_48254 ) ( not ( = ?auto_48246 ?auto_48252 ) ) ( OBJ-AT ?auto_48251 ?auto_48252 ) ( IN-CITY ?auto_48256 ?auto_48254 ) ( not ( = ?auto_48246 ?auto_48256 ) ) ( OBJ-AT ?auto_48250 ?auto_48256 ) ( TRUCK-AT ?auto_48255 ?auto_48246 ) ( not ( = ?auto_48250 ?auto_48251 ) ) ( not ( = ?auto_48252 ?auto_48256 ) ) ( not ( = ?auto_48250 ?auto_48248 ) ) ( not ( = ?auto_48251 ?auto_48248 ) ) ( not ( = ?auto_48253 ?auto_48252 ) ) ( not ( = ?auto_48253 ?auto_48256 ) ) ( not ( = ?auto_48250 ?auto_48247 ) ) ( not ( = ?auto_48251 ?auto_48247 ) ) ( not ( = ?auto_48248 ?auto_48247 ) ) ( not ( = ?auto_48250 ?auto_48249 ) ) ( not ( = ?auto_48251 ?auto_48249 ) ) ( not ( = ?auto_48248 ?auto_48249 ) ) ( not ( = ?auto_48247 ?auto_48249 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48250 ?auto_48251 ?auto_48248 ?auto_48249 ?auto_48247 ?auto_48246 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_48294 - OBJ
      ?auto_48295 - OBJ
      ?auto_48296 - OBJ
      ?auto_48297 - OBJ
      ?auto_48298 - OBJ
      ?auto_48293 - LOCATION
    )
    :vars
    (
      ?auto_48300 - LOCATION
      ?auto_48301 - CITY
      ?auto_48299 - LOCATION
      ?auto_48303 - LOCATION
      ?auto_48302 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_48300 ?auto_48301 ) ( IN-CITY ?auto_48293 ?auto_48301 ) ( not ( = ?auto_48293 ?auto_48300 ) ) ( OBJ-AT ?auto_48296 ?auto_48300 ) ( OBJ-AT ?auto_48294 ?auto_48300 ) ( OBJ-AT ?auto_48295 ?auto_48300 ) ( IN-CITY ?auto_48299 ?auto_48301 ) ( not ( = ?auto_48293 ?auto_48299 ) ) ( OBJ-AT ?auto_48297 ?auto_48299 ) ( IN-CITY ?auto_48303 ?auto_48301 ) ( not ( = ?auto_48293 ?auto_48303 ) ) ( OBJ-AT ?auto_48298 ?auto_48303 ) ( TRUCK-AT ?auto_48302 ?auto_48293 ) ( not ( = ?auto_48298 ?auto_48297 ) ) ( not ( = ?auto_48299 ?auto_48303 ) ) ( not ( = ?auto_48298 ?auto_48295 ) ) ( not ( = ?auto_48297 ?auto_48295 ) ) ( not ( = ?auto_48300 ?auto_48299 ) ) ( not ( = ?auto_48300 ?auto_48303 ) ) ( not ( = ?auto_48298 ?auto_48294 ) ) ( not ( = ?auto_48297 ?auto_48294 ) ) ( not ( = ?auto_48295 ?auto_48294 ) ) ( not ( = ?auto_48298 ?auto_48296 ) ) ( not ( = ?auto_48297 ?auto_48296 ) ) ( not ( = ?auto_48295 ?auto_48296 ) ) ( not ( = ?auto_48294 ?auto_48296 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_48298 ?auto_48297 ?auto_48295 ?auto_48296 ?auto_48294 ?auto_48293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49411 - OBJ
      ?auto_49412 - OBJ
      ?auto_49413 - OBJ
      ?auto_49414 - OBJ
      ?auto_49415 - OBJ
      ?auto_49410 - LOCATION
    )
    :vars
    (
      ?auto_49417 - LOCATION
      ?auto_49418 - CITY
      ?auto_49416 - LOCATION
      ?auto_49420 - LOCATION
      ?auto_49419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49417 ?auto_49418 ) ( IN-CITY ?auto_49410 ?auto_49418 ) ( not ( = ?auto_49410 ?auto_49417 ) ) ( OBJ-AT ?auto_49412 ?auto_49417 ) ( OBJ-AT ?auto_49411 ?auto_49417 ) ( OBJ-AT ?auto_49415 ?auto_49417 ) ( IN-CITY ?auto_49416 ?auto_49418 ) ( not ( = ?auto_49410 ?auto_49416 ) ) ( OBJ-AT ?auto_49414 ?auto_49416 ) ( IN-CITY ?auto_49420 ?auto_49418 ) ( not ( = ?auto_49410 ?auto_49420 ) ) ( OBJ-AT ?auto_49413 ?auto_49420 ) ( TRUCK-AT ?auto_49419 ?auto_49410 ) ( not ( = ?auto_49413 ?auto_49414 ) ) ( not ( = ?auto_49416 ?auto_49420 ) ) ( not ( = ?auto_49413 ?auto_49415 ) ) ( not ( = ?auto_49414 ?auto_49415 ) ) ( not ( = ?auto_49417 ?auto_49416 ) ) ( not ( = ?auto_49417 ?auto_49420 ) ) ( not ( = ?auto_49413 ?auto_49411 ) ) ( not ( = ?auto_49414 ?auto_49411 ) ) ( not ( = ?auto_49415 ?auto_49411 ) ) ( not ( = ?auto_49413 ?auto_49412 ) ) ( not ( = ?auto_49414 ?auto_49412 ) ) ( not ( = ?auto_49415 ?auto_49412 ) ) ( not ( = ?auto_49411 ?auto_49412 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49413 ?auto_49414 ?auto_49415 ?auto_49412 ?auto_49411 ?auto_49410 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49458 - OBJ
      ?auto_49459 - OBJ
      ?auto_49460 - OBJ
      ?auto_49461 - OBJ
      ?auto_49462 - OBJ
      ?auto_49457 - LOCATION
    )
    :vars
    (
      ?auto_49464 - LOCATION
      ?auto_49465 - CITY
      ?auto_49463 - LOCATION
      ?auto_49467 - LOCATION
      ?auto_49466 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49464 ?auto_49465 ) ( IN-CITY ?auto_49457 ?auto_49465 ) ( not ( = ?auto_49457 ?auto_49464 ) ) ( OBJ-AT ?auto_49459 ?auto_49464 ) ( OBJ-AT ?auto_49458 ?auto_49464 ) ( OBJ-AT ?auto_49461 ?auto_49464 ) ( IN-CITY ?auto_49463 ?auto_49465 ) ( not ( = ?auto_49457 ?auto_49463 ) ) ( OBJ-AT ?auto_49462 ?auto_49463 ) ( IN-CITY ?auto_49467 ?auto_49465 ) ( not ( = ?auto_49457 ?auto_49467 ) ) ( OBJ-AT ?auto_49460 ?auto_49467 ) ( TRUCK-AT ?auto_49466 ?auto_49457 ) ( not ( = ?auto_49460 ?auto_49462 ) ) ( not ( = ?auto_49463 ?auto_49467 ) ) ( not ( = ?auto_49460 ?auto_49461 ) ) ( not ( = ?auto_49462 ?auto_49461 ) ) ( not ( = ?auto_49464 ?auto_49463 ) ) ( not ( = ?auto_49464 ?auto_49467 ) ) ( not ( = ?auto_49460 ?auto_49458 ) ) ( not ( = ?auto_49462 ?auto_49458 ) ) ( not ( = ?auto_49461 ?auto_49458 ) ) ( not ( = ?auto_49460 ?auto_49459 ) ) ( not ( = ?auto_49462 ?auto_49459 ) ) ( not ( = ?auto_49461 ?auto_49459 ) ) ( not ( = ?auto_49458 ?auto_49459 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49460 ?auto_49462 ?auto_49461 ?auto_49459 ?auto_49458 ?auto_49457 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49655 - OBJ
      ?auto_49656 - OBJ
      ?auto_49657 - OBJ
      ?auto_49658 - OBJ
      ?auto_49659 - OBJ
      ?auto_49654 - LOCATION
    )
    :vars
    (
      ?auto_49661 - LOCATION
      ?auto_49662 - CITY
      ?auto_49660 - LOCATION
      ?auto_49664 - LOCATION
      ?auto_49663 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49661 ?auto_49662 ) ( IN-CITY ?auto_49654 ?auto_49662 ) ( not ( = ?auto_49654 ?auto_49661 ) ) ( OBJ-AT ?auto_49656 ?auto_49661 ) ( OBJ-AT ?auto_49655 ?auto_49661 ) ( OBJ-AT ?auto_49659 ?auto_49661 ) ( IN-CITY ?auto_49660 ?auto_49662 ) ( not ( = ?auto_49654 ?auto_49660 ) ) ( OBJ-AT ?auto_49657 ?auto_49660 ) ( IN-CITY ?auto_49664 ?auto_49662 ) ( not ( = ?auto_49654 ?auto_49664 ) ) ( OBJ-AT ?auto_49658 ?auto_49664 ) ( TRUCK-AT ?auto_49663 ?auto_49654 ) ( not ( = ?auto_49658 ?auto_49657 ) ) ( not ( = ?auto_49660 ?auto_49664 ) ) ( not ( = ?auto_49658 ?auto_49659 ) ) ( not ( = ?auto_49657 ?auto_49659 ) ) ( not ( = ?auto_49661 ?auto_49660 ) ) ( not ( = ?auto_49661 ?auto_49664 ) ) ( not ( = ?auto_49658 ?auto_49655 ) ) ( not ( = ?auto_49657 ?auto_49655 ) ) ( not ( = ?auto_49659 ?auto_49655 ) ) ( not ( = ?auto_49658 ?auto_49656 ) ) ( not ( = ?auto_49657 ?auto_49656 ) ) ( not ( = ?auto_49659 ?auto_49656 ) ) ( not ( = ?auto_49655 ?auto_49656 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49658 ?auto_49657 ?auto_49659 ?auto_49656 ?auto_49655 ?auto_49654 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49753 - OBJ
      ?auto_49754 - OBJ
      ?auto_49755 - OBJ
      ?auto_49756 - OBJ
      ?auto_49757 - OBJ
      ?auto_49752 - LOCATION
    )
    :vars
    (
      ?auto_49759 - LOCATION
      ?auto_49760 - CITY
      ?auto_49758 - LOCATION
      ?auto_49762 - LOCATION
      ?auto_49761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49759 ?auto_49760 ) ( IN-CITY ?auto_49752 ?auto_49760 ) ( not ( = ?auto_49752 ?auto_49759 ) ) ( OBJ-AT ?auto_49754 ?auto_49759 ) ( OBJ-AT ?auto_49753 ?auto_49759 ) ( OBJ-AT ?auto_49756 ?auto_49759 ) ( IN-CITY ?auto_49758 ?auto_49760 ) ( not ( = ?auto_49752 ?auto_49758 ) ) ( OBJ-AT ?auto_49755 ?auto_49758 ) ( IN-CITY ?auto_49762 ?auto_49760 ) ( not ( = ?auto_49752 ?auto_49762 ) ) ( OBJ-AT ?auto_49757 ?auto_49762 ) ( TRUCK-AT ?auto_49761 ?auto_49752 ) ( not ( = ?auto_49757 ?auto_49755 ) ) ( not ( = ?auto_49758 ?auto_49762 ) ) ( not ( = ?auto_49757 ?auto_49756 ) ) ( not ( = ?auto_49755 ?auto_49756 ) ) ( not ( = ?auto_49759 ?auto_49758 ) ) ( not ( = ?auto_49759 ?auto_49762 ) ) ( not ( = ?auto_49757 ?auto_49753 ) ) ( not ( = ?auto_49755 ?auto_49753 ) ) ( not ( = ?auto_49756 ?auto_49753 ) ) ( not ( = ?auto_49757 ?auto_49754 ) ) ( not ( = ?auto_49755 ?auto_49754 ) ) ( not ( = ?auto_49756 ?auto_49754 ) ) ( not ( = ?auto_49753 ?auto_49754 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49757 ?auto_49755 ?auto_49756 ?auto_49754 ?auto_49753 ?auto_49752 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49950 - OBJ
      ?auto_49951 - OBJ
      ?auto_49952 - OBJ
      ?auto_49953 - OBJ
      ?auto_49954 - OBJ
      ?auto_49949 - LOCATION
    )
    :vars
    (
      ?auto_49956 - LOCATION
      ?auto_49957 - CITY
      ?auto_49955 - LOCATION
      ?auto_49959 - LOCATION
      ?auto_49958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_49956 ?auto_49957 ) ( IN-CITY ?auto_49949 ?auto_49957 ) ( not ( = ?auto_49949 ?auto_49956 ) ) ( OBJ-AT ?auto_49951 ?auto_49956 ) ( OBJ-AT ?auto_49950 ?auto_49956 ) ( OBJ-AT ?auto_49952 ?auto_49956 ) ( IN-CITY ?auto_49955 ?auto_49957 ) ( not ( = ?auto_49949 ?auto_49955 ) ) ( OBJ-AT ?auto_49954 ?auto_49955 ) ( IN-CITY ?auto_49959 ?auto_49957 ) ( not ( = ?auto_49949 ?auto_49959 ) ) ( OBJ-AT ?auto_49953 ?auto_49959 ) ( TRUCK-AT ?auto_49958 ?auto_49949 ) ( not ( = ?auto_49953 ?auto_49954 ) ) ( not ( = ?auto_49955 ?auto_49959 ) ) ( not ( = ?auto_49953 ?auto_49952 ) ) ( not ( = ?auto_49954 ?auto_49952 ) ) ( not ( = ?auto_49956 ?auto_49955 ) ) ( not ( = ?auto_49956 ?auto_49959 ) ) ( not ( = ?auto_49953 ?auto_49950 ) ) ( not ( = ?auto_49954 ?auto_49950 ) ) ( not ( = ?auto_49952 ?auto_49950 ) ) ( not ( = ?auto_49953 ?auto_49951 ) ) ( not ( = ?auto_49954 ?auto_49951 ) ) ( not ( = ?auto_49952 ?auto_49951 ) ) ( not ( = ?auto_49950 ?auto_49951 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_49953 ?auto_49954 ?auto_49952 ?auto_49951 ?auto_49950 ?auto_49949 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_49997 - OBJ
      ?auto_49998 - OBJ
      ?auto_49999 - OBJ
      ?auto_50000 - OBJ
      ?auto_50001 - OBJ
      ?auto_49996 - LOCATION
    )
    :vars
    (
      ?auto_50003 - LOCATION
      ?auto_50004 - CITY
      ?auto_50002 - LOCATION
      ?auto_50006 - LOCATION
      ?auto_50005 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_50003 ?auto_50004 ) ( IN-CITY ?auto_49996 ?auto_50004 ) ( not ( = ?auto_49996 ?auto_50003 ) ) ( OBJ-AT ?auto_49998 ?auto_50003 ) ( OBJ-AT ?auto_49997 ?auto_50003 ) ( OBJ-AT ?auto_49999 ?auto_50003 ) ( IN-CITY ?auto_50002 ?auto_50004 ) ( not ( = ?auto_49996 ?auto_50002 ) ) ( OBJ-AT ?auto_50000 ?auto_50002 ) ( IN-CITY ?auto_50006 ?auto_50004 ) ( not ( = ?auto_49996 ?auto_50006 ) ) ( OBJ-AT ?auto_50001 ?auto_50006 ) ( TRUCK-AT ?auto_50005 ?auto_49996 ) ( not ( = ?auto_50001 ?auto_50000 ) ) ( not ( = ?auto_50002 ?auto_50006 ) ) ( not ( = ?auto_50001 ?auto_49999 ) ) ( not ( = ?auto_50000 ?auto_49999 ) ) ( not ( = ?auto_50003 ?auto_50002 ) ) ( not ( = ?auto_50003 ?auto_50006 ) ) ( not ( = ?auto_50001 ?auto_49997 ) ) ( not ( = ?auto_50000 ?auto_49997 ) ) ( not ( = ?auto_49999 ?auto_49997 ) ) ( not ( = ?auto_50001 ?auto_49998 ) ) ( not ( = ?auto_50000 ?auto_49998 ) ) ( not ( = ?auto_49999 ?auto_49998 ) ) ( not ( = ?auto_49997 ?auto_49998 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_50001 ?auto_50000 ?auto_49999 ?auto_49998 ?auto_49997 ?auto_49996 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51376 - OBJ
      ?auto_51377 - OBJ
      ?auto_51378 - OBJ
      ?auto_51379 - OBJ
      ?auto_51380 - OBJ
      ?auto_51375 - LOCATION
    )
    :vars
    (
      ?auto_51382 - LOCATION
      ?auto_51383 - CITY
      ?auto_51381 - LOCATION
      ?auto_51385 - LOCATION
      ?auto_51384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51382 ?auto_51383 ) ( IN-CITY ?auto_51375 ?auto_51383 ) ( not ( = ?auto_51375 ?auto_51382 ) ) ( OBJ-AT ?auto_51376 ?auto_51382 ) ( OBJ-AT ?auto_51380 ?auto_51382 ) ( OBJ-AT ?auto_51379 ?auto_51382 ) ( IN-CITY ?auto_51381 ?auto_51383 ) ( not ( = ?auto_51375 ?auto_51381 ) ) ( OBJ-AT ?auto_51378 ?auto_51381 ) ( IN-CITY ?auto_51385 ?auto_51383 ) ( not ( = ?auto_51375 ?auto_51385 ) ) ( OBJ-AT ?auto_51377 ?auto_51385 ) ( TRUCK-AT ?auto_51384 ?auto_51375 ) ( not ( = ?auto_51377 ?auto_51378 ) ) ( not ( = ?auto_51381 ?auto_51385 ) ) ( not ( = ?auto_51377 ?auto_51379 ) ) ( not ( = ?auto_51378 ?auto_51379 ) ) ( not ( = ?auto_51382 ?auto_51381 ) ) ( not ( = ?auto_51382 ?auto_51385 ) ) ( not ( = ?auto_51377 ?auto_51380 ) ) ( not ( = ?auto_51378 ?auto_51380 ) ) ( not ( = ?auto_51379 ?auto_51380 ) ) ( not ( = ?auto_51377 ?auto_51376 ) ) ( not ( = ?auto_51378 ?auto_51376 ) ) ( not ( = ?auto_51379 ?auto_51376 ) ) ( not ( = ?auto_51380 ?auto_51376 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51377 ?auto_51378 ?auto_51379 ?auto_51376 ?auto_51380 ?auto_51375 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51423 - OBJ
      ?auto_51424 - OBJ
      ?auto_51425 - OBJ
      ?auto_51426 - OBJ
      ?auto_51427 - OBJ
      ?auto_51422 - LOCATION
    )
    :vars
    (
      ?auto_51429 - LOCATION
      ?auto_51430 - CITY
      ?auto_51428 - LOCATION
      ?auto_51432 - LOCATION
      ?auto_51431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51429 ?auto_51430 ) ( IN-CITY ?auto_51422 ?auto_51430 ) ( not ( = ?auto_51422 ?auto_51429 ) ) ( OBJ-AT ?auto_51423 ?auto_51429 ) ( OBJ-AT ?auto_51426 ?auto_51429 ) ( OBJ-AT ?auto_51427 ?auto_51429 ) ( IN-CITY ?auto_51428 ?auto_51430 ) ( not ( = ?auto_51422 ?auto_51428 ) ) ( OBJ-AT ?auto_51425 ?auto_51428 ) ( IN-CITY ?auto_51432 ?auto_51430 ) ( not ( = ?auto_51422 ?auto_51432 ) ) ( OBJ-AT ?auto_51424 ?auto_51432 ) ( TRUCK-AT ?auto_51431 ?auto_51422 ) ( not ( = ?auto_51424 ?auto_51425 ) ) ( not ( = ?auto_51428 ?auto_51432 ) ) ( not ( = ?auto_51424 ?auto_51427 ) ) ( not ( = ?auto_51425 ?auto_51427 ) ) ( not ( = ?auto_51429 ?auto_51428 ) ) ( not ( = ?auto_51429 ?auto_51432 ) ) ( not ( = ?auto_51424 ?auto_51426 ) ) ( not ( = ?auto_51425 ?auto_51426 ) ) ( not ( = ?auto_51427 ?auto_51426 ) ) ( not ( = ?auto_51424 ?auto_51423 ) ) ( not ( = ?auto_51425 ?auto_51423 ) ) ( not ( = ?auto_51427 ?auto_51423 ) ) ( not ( = ?auto_51426 ?auto_51423 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51424 ?auto_51425 ?auto_51427 ?auto_51423 ?auto_51426 ?auto_51422 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51620 - OBJ
      ?auto_51621 - OBJ
      ?auto_51622 - OBJ
      ?auto_51623 - OBJ
      ?auto_51624 - OBJ
      ?auto_51619 - LOCATION
    )
    :vars
    (
      ?auto_51626 - LOCATION
      ?auto_51627 - CITY
      ?auto_51625 - LOCATION
      ?auto_51629 - LOCATION
      ?auto_51628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51626 ?auto_51627 ) ( IN-CITY ?auto_51619 ?auto_51627 ) ( not ( = ?auto_51619 ?auto_51626 ) ) ( OBJ-AT ?auto_51620 ?auto_51626 ) ( OBJ-AT ?auto_51624 ?auto_51626 ) ( OBJ-AT ?auto_51622 ?auto_51626 ) ( IN-CITY ?auto_51625 ?auto_51627 ) ( not ( = ?auto_51619 ?auto_51625 ) ) ( OBJ-AT ?auto_51623 ?auto_51625 ) ( IN-CITY ?auto_51629 ?auto_51627 ) ( not ( = ?auto_51619 ?auto_51629 ) ) ( OBJ-AT ?auto_51621 ?auto_51629 ) ( TRUCK-AT ?auto_51628 ?auto_51619 ) ( not ( = ?auto_51621 ?auto_51623 ) ) ( not ( = ?auto_51625 ?auto_51629 ) ) ( not ( = ?auto_51621 ?auto_51622 ) ) ( not ( = ?auto_51623 ?auto_51622 ) ) ( not ( = ?auto_51626 ?auto_51625 ) ) ( not ( = ?auto_51626 ?auto_51629 ) ) ( not ( = ?auto_51621 ?auto_51624 ) ) ( not ( = ?auto_51623 ?auto_51624 ) ) ( not ( = ?auto_51622 ?auto_51624 ) ) ( not ( = ?auto_51621 ?auto_51620 ) ) ( not ( = ?auto_51623 ?auto_51620 ) ) ( not ( = ?auto_51622 ?auto_51620 ) ) ( not ( = ?auto_51624 ?auto_51620 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51621 ?auto_51623 ?auto_51622 ?auto_51620 ?auto_51624 ?auto_51619 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51718 - OBJ
      ?auto_51719 - OBJ
      ?auto_51720 - OBJ
      ?auto_51721 - OBJ
      ?auto_51722 - OBJ
      ?auto_51717 - LOCATION
    )
    :vars
    (
      ?auto_51724 - LOCATION
      ?auto_51725 - CITY
      ?auto_51723 - LOCATION
      ?auto_51727 - LOCATION
      ?auto_51726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51724 ?auto_51725 ) ( IN-CITY ?auto_51717 ?auto_51725 ) ( not ( = ?auto_51717 ?auto_51724 ) ) ( OBJ-AT ?auto_51718 ?auto_51724 ) ( OBJ-AT ?auto_51721 ?auto_51724 ) ( OBJ-AT ?auto_51720 ?auto_51724 ) ( IN-CITY ?auto_51723 ?auto_51725 ) ( not ( = ?auto_51717 ?auto_51723 ) ) ( OBJ-AT ?auto_51722 ?auto_51723 ) ( IN-CITY ?auto_51727 ?auto_51725 ) ( not ( = ?auto_51717 ?auto_51727 ) ) ( OBJ-AT ?auto_51719 ?auto_51727 ) ( TRUCK-AT ?auto_51726 ?auto_51717 ) ( not ( = ?auto_51719 ?auto_51722 ) ) ( not ( = ?auto_51723 ?auto_51727 ) ) ( not ( = ?auto_51719 ?auto_51720 ) ) ( not ( = ?auto_51722 ?auto_51720 ) ) ( not ( = ?auto_51724 ?auto_51723 ) ) ( not ( = ?auto_51724 ?auto_51727 ) ) ( not ( = ?auto_51719 ?auto_51721 ) ) ( not ( = ?auto_51722 ?auto_51721 ) ) ( not ( = ?auto_51720 ?auto_51721 ) ) ( not ( = ?auto_51719 ?auto_51718 ) ) ( not ( = ?auto_51722 ?auto_51718 ) ) ( not ( = ?auto_51720 ?auto_51718 ) ) ( not ( = ?auto_51721 ?auto_51718 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51719 ?auto_51722 ?auto_51720 ?auto_51718 ?auto_51721 ?auto_51717 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51915 - OBJ
      ?auto_51916 - OBJ
      ?auto_51917 - OBJ
      ?auto_51918 - OBJ
      ?auto_51919 - OBJ
      ?auto_51914 - LOCATION
    )
    :vars
    (
      ?auto_51921 - LOCATION
      ?auto_51922 - CITY
      ?auto_51920 - LOCATION
      ?auto_51924 - LOCATION
      ?auto_51923 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51921 ?auto_51922 ) ( IN-CITY ?auto_51914 ?auto_51922 ) ( not ( = ?auto_51914 ?auto_51921 ) ) ( OBJ-AT ?auto_51915 ?auto_51921 ) ( OBJ-AT ?auto_51917 ?auto_51921 ) ( OBJ-AT ?auto_51919 ?auto_51921 ) ( IN-CITY ?auto_51920 ?auto_51922 ) ( not ( = ?auto_51914 ?auto_51920 ) ) ( OBJ-AT ?auto_51918 ?auto_51920 ) ( IN-CITY ?auto_51924 ?auto_51922 ) ( not ( = ?auto_51914 ?auto_51924 ) ) ( OBJ-AT ?auto_51916 ?auto_51924 ) ( TRUCK-AT ?auto_51923 ?auto_51914 ) ( not ( = ?auto_51916 ?auto_51918 ) ) ( not ( = ?auto_51920 ?auto_51924 ) ) ( not ( = ?auto_51916 ?auto_51919 ) ) ( not ( = ?auto_51918 ?auto_51919 ) ) ( not ( = ?auto_51921 ?auto_51920 ) ) ( not ( = ?auto_51921 ?auto_51924 ) ) ( not ( = ?auto_51916 ?auto_51917 ) ) ( not ( = ?auto_51918 ?auto_51917 ) ) ( not ( = ?auto_51919 ?auto_51917 ) ) ( not ( = ?auto_51916 ?auto_51915 ) ) ( not ( = ?auto_51918 ?auto_51915 ) ) ( not ( = ?auto_51919 ?auto_51915 ) ) ( not ( = ?auto_51917 ?auto_51915 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51916 ?auto_51918 ?auto_51919 ?auto_51915 ?auto_51917 ?auto_51914 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_51962 - OBJ
      ?auto_51963 - OBJ
      ?auto_51964 - OBJ
      ?auto_51965 - OBJ
      ?auto_51966 - OBJ
      ?auto_51961 - LOCATION
    )
    :vars
    (
      ?auto_51968 - LOCATION
      ?auto_51969 - CITY
      ?auto_51967 - LOCATION
      ?auto_51971 - LOCATION
      ?auto_51970 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_51968 ?auto_51969 ) ( IN-CITY ?auto_51961 ?auto_51969 ) ( not ( = ?auto_51961 ?auto_51968 ) ) ( OBJ-AT ?auto_51962 ?auto_51968 ) ( OBJ-AT ?auto_51964 ?auto_51968 ) ( OBJ-AT ?auto_51965 ?auto_51968 ) ( IN-CITY ?auto_51967 ?auto_51969 ) ( not ( = ?auto_51961 ?auto_51967 ) ) ( OBJ-AT ?auto_51966 ?auto_51967 ) ( IN-CITY ?auto_51971 ?auto_51969 ) ( not ( = ?auto_51961 ?auto_51971 ) ) ( OBJ-AT ?auto_51963 ?auto_51971 ) ( TRUCK-AT ?auto_51970 ?auto_51961 ) ( not ( = ?auto_51963 ?auto_51966 ) ) ( not ( = ?auto_51967 ?auto_51971 ) ) ( not ( = ?auto_51963 ?auto_51965 ) ) ( not ( = ?auto_51966 ?auto_51965 ) ) ( not ( = ?auto_51968 ?auto_51967 ) ) ( not ( = ?auto_51968 ?auto_51971 ) ) ( not ( = ?auto_51963 ?auto_51964 ) ) ( not ( = ?auto_51966 ?auto_51964 ) ) ( not ( = ?auto_51965 ?auto_51964 ) ) ( not ( = ?auto_51963 ?auto_51962 ) ) ( not ( = ?auto_51966 ?auto_51962 ) ) ( not ( = ?auto_51965 ?auto_51962 ) ) ( not ( = ?auto_51964 ?auto_51962 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_51963 ?auto_51966 ?auto_51965 ?auto_51962 ?auto_51964 ?auto_51961 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52620 - OBJ
      ?auto_52621 - OBJ
      ?auto_52622 - OBJ
      ?auto_52623 - OBJ
      ?auto_52624 - OBJ
      ?auto_52619 - LOCATION
    )
    :vars
    (
      ?auto_52626 - LOCATION
      ?auto_52627 - CITY
      ?auto_52625 - LOCATION
      ?auto_52629 - LOCATION
      ?auto_52628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52626 ?auto_52627 ) ( IN-CITY ?auto_52619 ?auto_52627 ) ( not ( = ?auto_52619 ?auto_52626 ) ) ( OBJ-AT ?auto_52620 ?auto_52626 ) ( OBJ-AT ?auto_52624 ?auto_52626 ) ( OBJ-AT ?auto_52623 ?auto_52626 ) ( IN-CITY ?auto_52625 ?auto_52627 ) ( not ( = ?auto_52619 ?auto_52625 ) ) ( OBJ-AT ?auto_52621 ?auto_52625 ) ( IN-CITY ?auto_52629 ?auto_52627 ) ( not ( = ?auto_52619 ?auto_52629 ) ) ( OBJ-AT ?auto_52622 ?auto_52629 ) ( TRUCK-AT ?auto_52628 ?auto_52619 ) ( not ( = ?auto_52622 ?auto_52621 ) ) ( not ( = ?auto_52625 ?auto_52629 ) ) ( not ( = ?auto_52622 ?auto_52623 ) ) ( not ( = ?auto_52621 ?auto_52623 ) ) ( not ( = ?auto_52626 ?auto_52625 ) ) ( not ( = ?auto_52626 ?auto_52629 ) ) ( not ( = ?auto_52622 ?auto_52624 ) ) ( not ( = ?auto_52621 ?auto_52624 ) ) ( not ( = ?auto_52623 ?auto_52624 ) ) ( not ( = ?auto_52622 ?auto_52620 ) ) ( not ( = ?auto_52621 ?auto_52620 ) ) ( not ( = ?auto_52623 ?auto_52620 ) ) ( not ( = ?auto_52624 ?auto_52620 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52622 ?auto_52621 ?auto_52623 ?auto_52620 ?auto_52624 ?auto_52619 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_52667 - OBJ
      ?auto_52668 - OBJ
      ?auto_52669 - OBJ
      ?auto_52670 - OBJ
      ?auto_52671 - OBJ
      ?auto_52666 - LOCATION
    )
    :vars
    (
      ?auto_52673 - LOCATION
      ?auto_52674 - CITY
      ?auto_52672 - LOCATION
      ?auto_52676 - LOCATION
      ?auto_52675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_52673 ?auto_52674 ) ( IN-CITY ?auto_52666 ?auto_52674 ) ( not ( = ?auto_52666 ?auto_52673 ) ) ( OBJ-AT ?auto_52667 ?auto_52673 ) ( OBJ-AT ?auto_52670 ?auto_52673 ) ( OBJ-AT ?auto_52671 ?auto_52673 ) ( IN-CITY ?auto_52672 ?auto_52674 ) ( not ( = ?auto_52666 ?auto_52672 ) ) ( OBJ-AT ?auto_52668 ?auto_52672 ) ( IN-CITY ?auto_52676 ?auto_52674 ) ( not ( = ?auto_52666 ?auto_52676 ) ) ( OBJ-AT ?auto_52669 ?auto_52676 ) ( TRUCK-AT ?auto_52675 ?auto_52666 ) ( not ( = ?auto_52669 ?auto_52668 ) ) ( not ( = ?auto_52672 ?auto_52676 ) ) ( not ( = ?auto_52669 ?auto_52671 ) ) ( not ( = ?auto_52668 ?auto_52671 ) ) ( not ( = ?auto_52673 ?auto_52672 ) ) ( not ( = ?auto_52673 ?auto_52676 ) ) ( not ( = ?auto_52669 ?auto_52670 ) ) ( not ( = ?auto_52668 ?auto_52670 ) ) ( not ( = ?auto_52671 ?auto_52670 ) ) ( not ( = ?auto_52669 ?auto_52667 ) ) ( not ( = ?auto_52668 ?auto_52667 ) ) ( not ( = ?auto_52671 ?auto_52667 ) ) ( not ( = ?auto_52670 ?auto_52667 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_52669 ?auto_52668 ?auto_52671 ?auto_52667 ?auto_52670 ?auto_52666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53124 - OBJ
      ?auto_53125 - OBJ
      ?auto_53126 - OBJ
      ?auto_53127 - OBJ
      ?auto_53128 - OBJ
      ?auto_53123 - LOCATION
    )
    :vars
    (
      ?auto_53130 - LOCATION
      ?auto_53131 - CITY
      ?auto_53129 - LOCATION
      ?auto_53133 - LOCATION
      ?auto_53132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53130 ?auto_53131 ) ( IN-CITY ?auto_53123 ?auto_53131 ) ( not ( = ?auto_53123 ?auto_53130 ) ) ( OBJ-AT ?auto_53124 ?auto_53130 ) ( OBJ-AT ?auto_53128 ?auto_53130 ) ( OBJ-AT ?auto_53126 ?auto_53130 ) ( IN-CITY ?auto_53129 ?auto_53131 ) ( not ( = ?auto_53123 ?auto_53129 ) ) ( OBJ-AT ?auto_53125 ?auto_53129 ) ( IN-CITY ?auto_53133 ?auto_53131 ) ( not ( = ?auto_53123 ?auto_53133 ) ) ( OBJ-AT ?auto_53127 ?auto_53133 ) ( TRUCK-AT ?auto_53132 ?auto_53123 ) ( not ( = ?auto_53127 ?auto_53125 ) ) ( not ( = ?auto_53129 ?auto_53133 ) ) ( not ( = ?auto_53127 ?auto_53126 ) ) ( not ( = ?auto_53125 ?auto_53126 ) ) ( not ( = ?auto_53130 ?auto_53129 ) ) ( not ( = ?auto_53130 ?auto_53133 ) ) ( not ( = ?auto_53127 ?auto_53128 ) ) ( not ( = ?auto_53125 ?auto_53128 ) ) ( not ( = ?auto_53126 ?auto_53128 ) ) ( not ( = ?auto_53127 ?auto_53124 ) ) ( not ( = ?auto_53125 ?auto_53124 ) ) ( not ( = ?auto_53126 ?auto_53124 ) ) ( not ( = ?auto_53128 ?auto_53124 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53127 ?auto_53125 ?auto_53126 ?auto_53124 ?auto_53128 ?auto_53123 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53273 - OBJ
      ?auto_53274 - OBJ
      ?auto_53275 - OBJ
      ?auto_53276 - OBJ
      ?auto_53277 - OBJ
      ?auto_53272 - LOCATION
    )
    :vars
    (
      ?auto_53279 - LOCATION
      ?auto_53280 - CITY
      ?auto_53278 - LOCATION
      ?auto_53282 - LOCATION
      ?auto_53281 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53279 ?auto_53280 ) ( IN-CITY ?auto_53272 ?auto_53280 ) ( not ( = ?auto_53272 ?auto_53279 ) ) ( OBJ-AT ?auto_53273 ?auto_53279 ) ( OBJ-AT ?auto_53276 ?auto_53279 ) ( OBJ-AT ?auto_53275 ?auto_53279 ) ( IN-CITY ?auto_53278 ?auto_53280 ) ( not ( = ?auto_53272 ?auto_53278 ) ) ( OBJ-AT ?auto_53274 ?auto_53278 ) ( IN-CITY ?auto_53282 ?auto_53280 ) ( not ( = ?auto_53272 ?auto_53282 ) ) ( OBJ-AT ?auto_53277 ?auto_53282 ) ( TRUCK-AT ?auto_53281 ?auto_53272 ) ( not ( = ?auto_53277 ?auto_53274 ) ) ( not ( = ?auto_53278 ?auto_53282 ) ) ( not ( = ?auto_53277 ?auto_53275 ) ) ( not ( = ?auto_53274 ?auto_53275 ) ) ( not ( = ?auto_53279 ?auto_53278 ) ) ( not ( = ?auto_53279 ?auto_53282 ) ) ( not ( = ?auto_53277 ?auto_53276 ) ) ( not ( = ?auto_53274 ?auto_53276 ) ) ( not ( = ?auto_53275 ?auto_53276 ) ) ( not ( = ?auto_53277 ?auto_53273 ) ) ( not ( = ?auto_53274 ?auto_53273 ) ) ( not ( = ?auto_53275 ?auto_53273 ) ) ( not ( = ?auto_53276 ?auto_53273 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53277 ?auto_53274 ?auto_53275 ?auto_53273 ?auto_53276 ?auto_53272 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53419 - OBJ
      ?auto_53420 - OBJ
      ?auto_53421 - OBJ
      ?auto_53422 - OBJ
      ?auto_53423 - OBJ
      ?auto_53418 - LOCATION
    )
    :vars
    (
      ?auto_53425 - LOCATION
      ?auto_53426 - CITY
      ?auto_53424 - LOCATION
      ?auto_53428 - LOCATION
      ?auto_53427 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53425 ?auto_53426 ) ( IN-CITY ?auto_53418 ?auto_53426 ) ( not ( = ?auto_53418 ?auto_53425 ) ) ( OBJ-AT ?auto_53419 ?auto_53425 ) ( OBJ-AT ?auto_53421 ?auto_53425 ) ( OBJ-AT ?auto_53423 ?auto_53425 ) ( IN-CITY ?auto_53424 ?auto_53426 ) ( not ( = ?auto_53418 ?auto_53424 ) ) ( OBJ-AT ?auto_53420 ?auto_53424 ) ( IN-CITY ?auto_53428 ?auto_53426 ) ( not ( = ?auto_53418 ?auto_53428 ) ) ( OBJ-AT ?auto_53422 ?auto_53428 ) ( TRUCK-AT ?auto_53427 ?auto_53418 ) ( not ( = ?auto_53422 ?auto_53420 ) ) ( not ( = ?auto_53424 ?auto_53428 ) ) ( not ( = ?auto_53422 ?auto_53423 ) ) ( not ( = ?auto_53420 ?auto_53423 ) ) ( not ( = ?auto_53425 ?auto_53424 ) ) ( not ( = ?auto_53425 ?auto_53428 ) ) ( not ( = ?auto_53422 ?auto_53421 ) ) ( not ( = ?auto_53420 ?auto_53421 ) ) ( not ( = ?auto_53423 ?auto_53421 ) ) ( not ( = ?auto_53422 ?auto_53419 ) ) ( not ( = ?auto_53420 ?auto_53419 ) ) ( not ( = ?auto_53423 ?auto_53419 ) ) ( not ( = ?auto_53421 ?auto_53419 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53422 ?auto_53420 ?auto_53423 ?auto_53419 ?auto_53421 ?auto_53418 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_53517 - OBJ
      ?auto_53518 - OBJ
      ?auto_53519 - OBJ
      ?auto_53520 - OBJ
      ?auto_53521 - OBJ
      ?auto_53516 - LOCATION
    )
    :vars
    (
      ?auto_53523 - LOCATION
      ?auto_53524 - CITY
      ?auto_53522 - LOCATION
      ?auto_53526 - LOCATION
      ?auto_53525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_53523 ?auto_53524 ) ( IN-CITY ?auto_53516 ?auto_53524 ) ( not ( = ?auto_53516 ?auto_53523 ) ) ( OBJ-AT ?auto_53517 ?auto_53523 ) ( OBJ-AT ?auto_53519 ?auto_53523 ) ( OBJ-AT ?auto_53520 ?auto_53523 ) ( IN-CITY ?auto_53522 ?auto_53524 ) ( not ( = ?auto_53516 ?auto_53522 ) ) ( OBJ-AT ?auto_53518 ?auto_53522 ) ( IN-CITY ?auto_53526 ?auto_53524 ) ( not ( = ?auto_53516 ?auto_53526 ) ) ( OBJ-AT ?auto_53521 ?auto_53526 ) ( TRUCK-AT ?auto_53525 ?auto_53516 ) ( not ( = ?auto_53521 ?auto_53518 ) ) ( not ( = ?auto_53522 ?auto_53526 ) ) ( not ( = ?auto_53521 ?auto_53520 ) ) ( not ( = ?auto_53518 ?auto_53520 ) ) ( not ( = ?auto_53523 ?auto_53522 ) ) ( not ( = ?auto_53523 ?auto_53526 ) ) ( not ( = ?auto_53521 ?auto_53519 ) ) ( not ( = ?auto_53518 ?auto_53519 ) ) ( not ( = ?auto_53520 ?auto_53519 ) ) ( not ( = ?auto_53521 ?auto_53517 ) ) ( not ( = ?auto_53518 ?auto_53517 ) ) ( not ( = ?auto_53520 ?auto_53517 ) ) ( not ( = ?auto_53519 ?auto_53517 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_53521 ?auto_53518 ?auto_53520 ?auto_53517 ?auto_53519 ?auto_53516 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54124 - OBJ
      ?auto_54125 - OBJ
      ?auto_54126 - OBJ
      ?auto_54127 - OBJ
      ?auto_54128 - OBJ
      ?auto_54123 - LOCATION
    )
    :vars
    (
      ?auto_54130 - LOCATION
      ?auto_54131 - CITY
      ?auto_54129 - LOCATION
      ?auto_54133 - LOCATION
      ?auto_54132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54130 ?auto_54131 ) ( IN-CITY ?auto_54123 ?auto_54131 ) ( not ( = ?auto_54123 ?auto_54130 ) ) ( OBJ-AT ?auto_54124 ?auto_54130 ) ( OBJ-AT ?auto_54128 ?auto_54130 ) ( OBJ-AT ?auto_54125 ?auto_54130 ) ( IN-CITY ?auto_54129 ?auto_54131 ) ( not ( = ?auto_54123 ?auto_54129 ) ) ( OBJ-AT ?auto_54127 ?auto_54129 ) ( IN-CITY ?auto_54133 ?auto_54131 ) ( not ( = ?auto_54123 ?auto_54133 ) ) ( OBJ-AT ?auto_54126 ?auto_54133 ) ( TRUCK-AT ?auto_54132 ?auto_54123 ) ( not ( = ?auto_54126 ?auto_54127 ) ) ( not ( = ?auto_54129 ?auto_54133 ) ) ( not ( = ?auto_54126 ?auto_54125 ) ) ( not ( = ?auto_54127 ?auto_54125 ) ) ( not ( = ?auto_54130 ?auto_54129 ) ) ( not ( = ?auto_54130 ?auto_54133 ) ) ( not ( = ?auto_54126 ?auto_54128 ) ) ( not ( = ?auto_54127 ?auto_54128 ) ) ( not ( = ?auto_54125 ?auto_54128 ) ) ( not ( = ?auto_54126 ?auto_54124 ) ) ( not ( = ?auto_54127 ?auto_54124 ) ) ( not ( = ?auto_54125 ?auto_54124 ) ) ( not ( = ?auto_54128 ?auto_54124 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54126 ?auto_54127 ?auto_54125 ?auto_54124 ?auto_54128 ?auto_54123 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54222 - OBJ
      ?auto_54223 - OBJ
      ?auto_54224 - OBJ
      ?auto_54225 - OBJ
      ?auto_54226 - OBJ
      ?auto_54221 - LOCATION
    )
    :vars
    (
      ?auto_54228 - LOCATION
      ?auto_54229 - CITY
      ?auto_54227 - LOCATION
      ?auto_54231 - LOCATION
      ?auto_54230 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54228 ?auto_54229 ) ( IN-CITY ?auto_54221 ?auto_54229 ) ( not ( = ?auto_54221 ?auto_54228 ) ) ( OBJ-AT ?auto_54222 ?auto_54228 ) ( OBJ-AT ?auto_54225 ?auto_54228 ) ( OBJ-AT ?auto_54223 ?auto_54228 ) ( IN-CITY ?auto_54227 ?auto_54229 ) ( not ( = ?auto_54221 ?auto_54227 ) ) ( OBJ-AT ?auto_54226 ?auto_54227 ) ( IN-CITY ?auto_54231 ?auto_54229 ) ( not ( = ?auto_54221 ?auto_54231 ) ) ( OBJ-AT ?auto_54224 ?auto_54231 ) ( TRUCK-AT ?auto_54230 ?auto_54221 ) ( not ( = ?auto_54224 ?auto_54226 ) ) ( not ( = ?auto_54227 ?auto_54231 ) ) ( not ( = ?auto_54224 ?auto_54223 ) ) ( not ( = ?auto_54226 ?auto_54223 ) ) ( not ( = ?auto_54228 ?auto_54227 ) ) ( not ( = ?auto_54228 ?auto_54231 ) ) ( not ( = ?auto_54224 ?auto_54225 ) ) ( not ( = ?auto_54226 ?auto_54225 ) ) ( not ( = ?auto_54223 ?auto_54225 ) ) ( not ( = ?auto_54224 ?auto_54222 ) ) ( not ( = ?auto_54226 ?auto_54222 ) ) ( not ( = ?auto_54223 ?auto_54222 ) ) ( not ( = ?auto_54225 ?auto_54222 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54224 ?auto_54226 ?auto_54223 ?auto_54222 ?auto_54225 ?auto_54221 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54368 - OBJ
      ?auto_54369 - OBJ
      ?auto_54370 - OBJ
      ?auto_54371 - OBJ
      ?auto_54372 - OBJ
      ?auto_54367 - LOCATION
    )
    :vars
    (
      ?auto_54374 - LOCATION
      ?auto_54375 - CITY
      ?auto_54373 - LOCATION
      ?auto_54377 - LOCATION
      ?auto_54376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54374 ?auto_54375 ) ( IN-CITY ?auto_54367 ?auto_54375 ) ( not ( = ?auto_54367 ?auto_54374 ) ) ( OBJ-AT ?auto_54368 ?auto_54374 ) ( OBJ-AT ?auto_54372 ?auto_54374 ) ( OBJ-AT ?auto_54369 ?auto_54374 ) ( IN-CITY ?auto_54373 ?auto_54375 ) ( not ( = ?auto_54367 ?auto_54373 ) ) ( OBJ-AT ?auto_54370 ?auto_54373 ) ( IN-CITY ?auto_54377 ?auto_54375 ) ( not ( = ?auto_54367 ?auto_54377 ) ) ( OBJ-AT ?auto_54371 ?auto_54377 ) ( TRUCK-AT ?auto_54376 ?auto_54367 ) ( not ( = ?auto_54371 ?auto_54370 ) ) ( not ( = ?auto_54373 ?auto_54377 ) ) ( not ( = ?auto_54371 ?auto_54369 ) ) ( not ( = ?auto_54370 ?auto_54369 ) ) ( not ( = ?auto_54374 ?auto_54373 ) ) ( not ( = ?auto_54374 ?auto_54377 ) ) ( not ( = ?auto_54371 ?auto_54372 ) ) ( not ( = ?auto_54370 ?auto_54372 ) ) ( not ( = ?auto_54369 ?auto_54372 ) ) ( not ( = ?auto_54371 ?auto_54368 ) ) ( not ( = ?auto_54370 ?auto_54368 ) ) ( not ( = ?auto_54369 ?auto_54368 ) ) ( not ( = ?auto_54372 ?auto_54368 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54371 ?auto_54370 ?auto_54369 ?auto_54368 ?auto_54372 ?auto_54367 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54517 - OBJ
      ?auto_54518 - OBJ
      ?auto_54519 - OBJ
      ?auto_54520 - OBJ
      ?auto_54521 - OBJ
      ?auto_54516 - LOCATION
    )
    :vars
    (
      ?auto_54523 - LOCATION
      ?auto_54524 - CITY
      ?auto_54522 - LOCATION
      ?auto_54526 - LOCATION
      ?auto_54525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54523 ?auto_54524 ) ( IN-CITY ?auto_54516 ?auto_54524 ) ( not ( = ?auto_54516 ?auto_54523 ) ) ( OBJ-AT ?auto_54517 ?auto_54523 ) ( OBJ-AT ?auto_54520 ?auto_54523 ) ( OBJ-AT ?auto_54518 ?auto_54523 ) ( IN-CITY ?auto_54522 ?auto_54524 ) ( not ( = ?auto_54516 ?auto_54522 ) ) ( OBJ-AT ?auto_54519 ?auto_54522 ) ( IN-CITY ?auto_54526 ?auto_54524 ) ( not ( = ?auto_54516 ?auto_54526 ) ) ( OBJ-AT ?auto_54521 ?auto_54526 ) ( TRUCK-AT ?auto_54525 ?auto_54516 ) ( not ( = ?auto_54521 ?auto_54519 ) ) ( not ( = ?auto_54522 ?auto_54526 ) ) ( not ( = ?auto_54521 ?auto_54518 ) ) ( not ( = ?auto_54519 ?auto_54518 ) ) ( not ( = ?auto_54523 ?auto_54522 ) ) ( not ( = ?auto_54523 ?auto_54526 ) ) ( not ( = ?auto_54521 ?auto_54520 ) ) ( not ( = ?auto_54519 ?auto_54520 ) ) ( not ( = ?auto_54518 ?auto_54520 ) ) ( not ( = ?auto_54521 ?auto_54517 ) ) ( not ( = ?auto_54519 ?auto_54517 ) ) ( not ( = ?auto_54518 ?auto_54517 ) ) ( not ( = ?auto_54520 ?auto_54517 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54521 ?auto_54519 ?auto_54518 ?auto_54517 ?auto_54520 ?auto_54516 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_54974 - OBJ
      ?auto_54975 - OBJ
      ?auto_54976 - OBJ
      ?auto_54977 - OBJ
      ?auto_54978 - OBJ
      ?auto_54973 - LOCATION
    )
    :vars
    (
      ?auto_54980 - LOCATION
      ?auto_54981 - CITY
      ?auto_54979 - LOCATION
      ?auto_54983 - LOCATION
      ?auto_54982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54980 ?auto_54981 ) ( IN-CITY ?auto_54973 ?auto_54981 ) ( not ( = ?auto_54973 ?auto_54980 ) ) ( OBJ-AT ?auto_54974 ?auto_54980 ) ( OBJ-AT ?auto_54976 ?auto_54980 ) ( OBJ-AT ?auto_54975 ?auto_54980 ) ( IN-CITY ?auto_54979 ?auto_54981 ) ( not ( = ?auto_54973 ?auto_54979 ) ) ( OBJ-AT ?auto_54978 ?auto_54979 ) ( IN-CITY ?auto_54983 ?auto_54981 ) ( not ( = ?auto_54973 ?auto_54983 ) ) ( OBJ-AT ?auto_54977 ?auto_54983 ) ( TRUCK-AT ?auto_54982 ?auto_54973 ) ( not ( = ?auto_54977 ?auto_54978 ) ) ( not ( = ?auto_54979 ?auto_54983 ) ) ( not ( = ?auto_54977 ?auto_54975 ) ) ( not ( = ?auto_54978 ?auto_54975 ) ) ( not ( = ?auto_54980 ?auto_54979 ) ) ( not ( = ?auto_54980 ?auto_54983 ) ) ( not ( = ?auto_54977 ?auto_54976 ) ) ( not ( = ?auto_54978 ?auto_54976 ) ) ( not ( = ?auto_54975 ?auto_54976 ) ) ( not ( = ?auto_54977 ?auto_54974 ) ) ( not ( = ?auto_54978 ?auto_54974 ) ) ( not ( = ?auto_54975 ?auto_54974 ) ) ( not ( = ?auto_54976 ?auto_54974 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_54977 ?auto_54978 ?auto_54975 ?auto_54974 ?auto_54976 ?auto_54973 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55021 - OBJ
      ?auto_55022 - OBJ
      ?auto_55023 - OBJ
      ?auto_55024 - OBJ
      ?auto_55025 - OBJ
      ?auto_55020 - LOCATION
    )
    :vars
    (
      ?auto_55027 - LOCATION
      ?auto_55028 - CITY
      ?auto_55026 - LOCATION
      ?auto_55030 - LOCATION
      ?auto_55029 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55027 ?auto_55028 ) ( IN-CITY ?auto_55020 ?auto_55028 ) ( not ( = ?auto_55020 ?auto_55027 ) ) ( OBJ-AT ?auto_55021 ?auto_55027 ) ( OBJ-AT ?auto_55023 ?auto_55027 ) ( OBJ-AT ?auto_55022 ?auto_55027 ) ( IN-CITY ?auto_55026 ?auto_55028 ) ( not ( = ?auto_55020 ?auto_55026 ) ) ( OBJ-AT ?auto_55024 ?auto_55026 ) ( IN-CITY ?auto_55030 ?auto_55028 ) ( not ( = ?auto_55020 ?auto_55030 ) ) ( OBJ-AT ?auto_55025 ?auto_55030 ) ( TRUCK-AT ?auto_55029 ?auto_55020 ) ( not ( = ?auto_55025 ?auto_55024 ) ) ( not ( = ?auto_55026 ?auto_55030 ) ) ( not ( = ?auto_55025 ?auto_55022 ) ) ( not ( = ?auto_55024 ?auto_55022 ) ) ( not ( = ?auto_55027 ?auto_55026 ) ) ( not ( = ?auto_55027 ?auto_55030 ) ) ( not ( = ?auto_55025 ?auto_55023 ) ) ( not ( = ?auto_55024 ?auto_55023 ) ) ( not ( = ?auto_55022 ?auto_55023 ) ) ( not ( = ?auto_55025 ?auto_55021 ) ) ( not ( = ?auto_55024 ?auto_55021 ) ) ( not ( = ?auto_55022 ?auto_55021 ) ) ( not ( = ?auto_55023 ?auto_55021 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55025 ?auto_55024 ?auto_55022 ?auto_55021 ?auto_55023 ?auto_55020 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55679 - OBJ
      ?auto_55680 - OBJ
      ?auto_55681 - OBJ
      ?auto_55682 - OBJ
      ?auto_55683 - OBJ
      ?auto_55678 - LOCATION
    )
    :vars
    (
      ?auto_55685 - LOCATION
      ?auto_55686 - CITY
      ?auto_55684 - LOCATION
      ?auto_55688 - LOCATION
      ?auto_55687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55685 ?auto_55686 ) ( IN-CITY ?auto_55678 ?auto_55686 ) ( not ( = ?auto_55678 ?auto_55685 ) ) ( OBJ-AT ?auto_55679 ?auto_55685 ) ( OBJ-AT ?auto_55680 ?auto_55685 ) ( OBJ-AT ?auto_55683 ?auto_55685 ) ( IN-CITY ?auto_55684 ?auto_55686 ) ( not ( = ?auto_55678 ?auto_55684 ) ) ( OBJ-AT ?auto_55682 ?auto_55684 ) ( IN-CITY ?auto_55688 ?auto_55686 ) ( not ( = ?auto_55678 ?auto_55688 ) ) ( OBJ-AT ?auto_55681 ?auto_55688 ) ( TRUCK-AT ?auto_55687 ?auto_55678 ) ( not ( = ?auto_55681 ?auto_55682 ) ) ( not ( = ?auto_55684 ?auto_55688 ) ) ( not ( = ?auto_55681 ?auto_55683 ) ) ( not ( = ?auto_55682 ?auto_55683 ) ) ( not ( = ?auto_55685 ?auto_55684 ) ) ( not ( = ?auto_55685 ?auto_55688 ) ) ( not ( = ?auto_55681 ?auto_55680 ) ) ( not ( = ?auto_55682 ?auto_55680 ) ) ( not ( = ?auto_55683 ?auto_55680 ) ) ( not ( = ?auto_55681 ?auto_55679 ) ) ( not ( = ?auto_55682 ?auto_55679 ) ) ( not ( = ?auto_55683 ?auto_55679 ) ) ( not ( = ?auto_55680 ?auto_55679 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55681 ?auto_55682 ?auto_55683 ?auto_55679 ?auto_55680 ?auto_55678 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55726 - OBJ
      ?auto_55727 - OBJ
      ?auto_55728 - OBJ
      ?auto_55729 - OBJ
      ?auto_55730 - OBJ
      ?auto_55725 - LOCATION
    )
    :vars
    (
      ?auto_55732 - LOCATION
      ?auto_55733 - CITY
      ?auto_55731 - LOCATION
      ?auto_55735 - LOCATION
      ?auto_55734 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55732 ?auto_55733 ) ( IN-CITY ?auto_55725 ?auto_55733 ) ( not ( = ?auto_55725 ?auto_55732 ) ) ( OBJ-AT ?auto_55726 ?auto_55732 ) ( OBJ-AT ?auto_55727 ?auto_55732 ) ( OBJ-AT ?auto_55729 ?auto_55732 ) ( IN-CITY ?auto_55731 ?auto_55733 ) ( not ( = ?auto_55725 ?auto_55731 ) ) ( OBJ-AT ?auto_55730 ?auto_55731 ) ( IN-CITY ?auto_55735 ?auto_55733 ) ( not ( = ?auto_55725 ?auto_55735 ) ) ( OBJ-AT ?auto_55728 ?auto_55735 ) ( TRUCK-AT ?auto_55734 ?auto_55725 ) ( not ( = ?auto_55728 ?auto_55730 ) ) ( not ( = ?auto_55731 ?auto_55735 ) ) ( not ( = ?auto_55728 ?auto_55729 ) ) ( not ( = ?auto_55730 ?auto_55729 ) ) ( not ( = ?auto_55732 ?auto_55731 ) ) ( not ( = ?auto_55732 ?auto_55735 ) ) ( not ( = ?auto_55728 ?auto_55727 ) ) ( not ( = ?auto_55730 ?auto_55727 ) ) ( not ( = ?auto_55729 ?auto_55727 ) ) ( not ( = ?auto_55728 ?auto_55726 ) ) ( not ( = ?auto_55730 ?auto_55726 ) ) ( not ( = ?auto_55729 ?auto_55726 ) ) ( not ( = ?auto_55727 ?auto_55726 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55728 ?auto_55730 ?auto_55729 ?auto_55726 ?auto_55727 ?auto_55725 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_55923 - OBJ
      ?auto_55924 - OBJ
      ?auto_55925 - OBJ
      ?auto_55926 - OBJ
      ?auto_55927 - OBJ
      ?auto_55922 - LOCATION
    )
    :vars
    (
      ?auto_55929 - LOCATION
      ?auto_55930 - CITY
      ?auto_55928 - LOCATION
      ?auto_55932 - LOCATION
      ?auto_55931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55929 ?auto_55930 ) ( IN-CITY ?auto_55922 ?auto_55930 ) ( not ( = ?auto_55922 ?auto_55929 ) ) ( OBJ-AT ?auto_55923 ?auto_55929 ) ( OBJ-AT ?auto_55924 ?auto_55929 ) ( OBJ-AT ?auto_55927 ?auto_55929 ) ( IN-CITY ?auto_55928 ?auto_55930 ) ( not ( = ?auto_55922 ?auto_55928 ) ) ( OBJ-AT ?auto_55925 ?auto_55928 ) ( IN-CITY ?auto_55932 ?auto_55930 ) ( not ( = ?auto_55922 ?auto_55932 ) ) ( OBJ-AT ?auto_55926 ?auto_55932 ) ( TRUCK-AT ?auto_55931 ?auto_55922 ) ( not ( = ?auto_55926 ?auto_55925 ) ) ( not ( = ?auto_55928 ?auto_55932 ) ) ( not ( = ?auto_55926 ?auto_55927 ) ) ( not ( = ?auto_55925 ?auto_55927 ) ) ( not ( = ?auto_55929 ?auto_55928 ) ) ( not ( = ?auto_55929 ?auto_55932 ) ) ( not ( = ?auto_55926 ?auto_55924 ) ) ( not ( = ?auto_55925 ?auto_55924 ) ) ( not ( = ?auto_55927 ?auto_55924 ) ) ( not ( = ?auto_55926 ?auto_55923 ) ) ( not ( = ?auto_55925 ?auto_55923 ) ) ( not ( = ?auto_55927 ?auto_55923 ) ) ( not ( = ?auto_55924 ?auto_55923 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_55926 ?auto_55925 ?auto_55927 ?auto_55923 ?auto_55924 ?auto_55922 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56021 - OBJ
      ?auto_56022 - OBJ
      ?auto_56023 - OBJ
      ?auto_56024 - OBJ
      ?auto_56025 - OBJ
      ?auto_56020 - LOCATION
    )
    :vars
    (
      ?auto_56027 - LOCATION
      ?auto_56028 - CITY
      ?auto_56026 - LOCATION
      ?auto_56030 - LOCATION
      ?auto_56029 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56027 ?auto_56028 ) ( IN-CITY ?auto_56020 ?auto_56028 ) ( not ( = ?auto_56020 ?auto_56027 ) ) ( OBJ-AT ?auto_56021 ?auto_56027 ) ( OBJ-AT ?auto_56022 ?auto_56027 ) ( OBJ-AT ?auto_56024 ?auto_56027 ) ( IN-CITY ?auto_56026 ?auto_56028 ) ( not ( = ?auto_56020 ?auto_56026 ) ) ( OBJ-AT ?auto_56023 ?auto_56026 ) ( IN-CITY ?auto_56030 ?auto_56028 ) ( not ( = ?auto_56020 ?auto_56030 ) ) ( OBJ-AT ?auto_56025 ?auto_56030 ) ( TRUCK-AT ?auto_56029 ?auto_56020 ) ( not ( = ?auto_56025 ?auto_56023 ) ) ( not ( = ?auto_56026 ?auto_56030 ) ) ( not ( = ?auto_56025 ?auto_56024 ) ) ( not ( = ?auto_56023 ?auto_56024 ) ) ( not ( = ?auto_56027 ?auto_56026 ) ) ( not ( = ?auto_56027 ?auto_56030 ) ) ( not ( = ?auto_56025 ?auto_56022 ) ) ( not ( = ?auto_56023 ?auto_56022 ) ) ( not ( = ?auto_56024 ?auto_56022 ) ) ( not ( = ?auto_56025 ?auto_56021 ) ) ( not ( = ?auto_56023 ?auto_56021 ) ) ( not ( = ?auto_56024 ?auto_56021 ) ) ( not ( = ?auto_56022 ?auto_56021 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56025 ?auto_56023 ?auto_56024 ?auto_56021 ?auto_56022 ?auto_56020 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56218 - OBJ
      ?auto_56219 - OBJ
      ?auto_56220 - OBJ
      ?auto_56221 - OBJ
      ?auto_56222 - OBJ
      ?auto_56217 - LOCATION
    )
    :vars
    (
      ?auto_56224 - LOCATION
      ?auto_56225 - CITY
      ?auto_56223 - LOCATION
      ?auto_56227 - LOCATION
      ?auto_56226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56224 ?auto_56225 ) ( IN-CITY ?auto_56217 ?auto_56225 ) ( not ( = ?auto_56217 ?auto_56224 ) ) ( OBJ-AT ?auto_56218 ?auto_56224 ) ( OBJ-AT ?auto_56219 ?auto_56224 ) ( OBJ-AT ?auto_56220 ?auto_56224 ) ( IN-CITY ?auto_56223 ?auto_56225 ) ( not ( = ?auto_56217 ?auto_56223 ) ) ( OBJ-AT ?auto_56222 ?auto_56223 ) ( IN-CITY ?auto_56227 ?auto_56225 ) ( not ( = ?auto_56217 ?auto_56227 ) ) ( OBJ-AT ?auto_56221 ?auto_56227 ) ( TRUCK-AT ?auto_56226 ?auto_56217 ) ( not ( = ?auto_56221 ?auto_56222 ) ) ( not ( = ?auto_56223 ?auto_56227 ) ) ( not ( = ?auto_56221 ?auto_56220 ) ) ( not ( = ?auto_56222 ?auto_56220 ) ) ( not ( = ?auto_56224 ?auto_56223 ) ) ( not ( = ?auto_56224 ?auto_56227 ) ) ( not ( = ?auto_56221 ?auto_56219 ) ) ( not ( = ?auto_56222 ?auto_56219 ) ) ( not ( = ?auto_56220 ?auto_56219 ) ) ( not ( = ?auto_56221 ?auto_56218 ) ) ( not ( = ?auto_56222 ?auto_56218 ) ) ( not ( = ?auto_56220 ?auto_56218 ) ) ( not ( = ?auto_56219 ?auto_56218 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56221 ?auto_56222 ?auto_56220 ?auto_56218 ?auto_56219 ?auto_56217 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_56265 - OBJ
      ?auto_56266 - OBJ
      ?auto_56267 - OBJ
      ?auto_56268 - OBJ
      ?auto_56269 - OBJ
      ?auto_56264 - LOCATION
    )
    :vars
    (
      ?auto_56271 - LOCATION
      ?auto_56272 - CITY
      ?auto_56270 - LOCATION
      ?auto_56274 - LOCATION
      ?auto_56273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56271 ?auto_56272 ) ( IN-CITY ?auto_56264 ?auto_56272 ) ( not ( = ?auto_56264 ?auto_56271 ) ) ( OBJ-AT ?auto_56265 ?auto_56271 ) ( OBJ-AT ?auto_56266 ?auto_56271 ) ( OBJ-AT ?auto_56267 ?auto_56271 ) ( IN-CITY ?auto_56270 ?auto_56272 ) ( not ( = ?auto_56264 ?auto_56270 ) ) ( OBJ-AT ?auto_56268 ?auto_56270 ) ( IN-CITY ?auto_56274 ?auto_56272 ) ( not ( = ?auto_56264 ?auto_56274 ) ) ( OBJ-AT ?auto_56269 ?auto_56274 ) ( TRUCK-AT ?auto_56273 ?auto_56264 ) ( not ( = ?auto_56269 ?auto_56268 ) ) ( not ( = ?auto_56270 ?auto_56274 ) ) ( not ( = ?auto_56269 ?auto_56267 ) ) ( not ( = ?auto_56268 ?auto_56267 ) ) ( not ( = ?auto_56271 ?auto_56270 ) ) ( not ( = ?auto_56271 ?auto_56274 ) ) ( not ( = ?auto_56269 ?auto_56266 ) ) ( not ( = ?auto_56268 ?auto_56266 ) ) ( not ( = ?auto_56267 ?auto_56266 ) ) ( not ( = ?auto_56269 ?auto_56265 ) ) ( not ( = ?auto_56268 ?auto_56265 ) ) ( not ( = ?auto_56267 ?auto_56265 ) ) ( not ( = ?auto_56266 ?auto_56265 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_56269 ?auto_56268 ?auto_56267 ?auto_56265 ?auto_56266 ?auto_56264 ) )
  )

)

