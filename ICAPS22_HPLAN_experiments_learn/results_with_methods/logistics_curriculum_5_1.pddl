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
      ?auto_59883 - OBJ
      ?auto_59882 - LOCATION
    )
    :vars
    (
      ?auto_59885 - LOCATION
      ?auto_59886 - CITY
      ?auto_59884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59885 ?auto_59886 ) ( IN-CITY ?auto_59882 ?auto_59886 ) ( not ( = ?auto_59882 ?auto_59885 ) ) ( OBJ-AT ?auto_59883 ?auto_59885 ) ( TRUCK-AT ?auto_59884 ?auto_59882 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59884 ?auto_59882 ?auto_59885 ?auto_59886 )
      ( !LOAD-TRUCK ?auto_59883 ?auto_59884 ?auto_59885 )
      ( !DRIVE-TRUCK ?auto_59884 ?auto_59885 ?auto_59882 ?auto_59886 )
      ( !UNLOAD-TRUCK ?auto_59883 ?auto_59884 ?auto_59882 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_59890 - OBJ
      ?auto_59889 - LOCATION
    )
    :vars
    (
      ?auto_59892 - LOCATION
      ?auto_59893 - CITY
      ?auto_59891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59892 ?auto_59893 ) ( IN-CITY ?auto_59889 ?auto_59893 ) ( not ( = ?auto_59889 ?auto_59892 ) ) ( OBJ-AT ?auto_59890 ?auto_59892 ) ( TRUCK-AT ?auto_59891 ?auto_59889 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59891 ?auto_59889 ?auto_59892 ?auto_59893 )
      ( !LOAD-TRUCK ?auto_59890 ?auto_59891 ?auto_59892 )
      ( !DRIVE-TRUCK ?auto_59891 ?auto_59892 ?auto_59889 ?auto_59893 )
      ( !UNLOAD-TRUCK ?auto_59890 ?auto_59891 ?auto_59889 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_59904 - OBJ
      ?auto_59905 - OBJ
      ?auto_59903 - LOCATION
    )
    :vars
    (
      ?auto_59907 - LOCATION
      ?auto_59906 - CITY
      ?auto_59909 - LOCATION
      ?auto_59908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59907 ?auto_59906 ) ( IN-CITY ?auto_59903 ?auto_59906 ) ( not ( = ?auto_59903 ?auto_59907 ) ) ( OBJ-AT ?auto_59905 ?auto_59907 ) ( IN-CITY ?auto_59909 ?auto_59906 ) ( not ( = ?auto_59903 ?auto_59909 ) ) ( OBJ-AT ?auto_59904 ?auto_59909 ) ( TRUCK-AT ?auto_59908 ?auto_59903 ) ( not ( = ?auto_59904 ?auto_59905 ) ) ( not ( = ?auto_59907 ?auto_59909 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_59904 ?auto_59903 )
      ( DELIVER-1PKG ?auto_59905 ?auto_59903 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_59911 - OBJ
      ?auto_59912 - OBJ
      ?auto_59910 - LOCATION
    )
    :vars
    (
      ?auto_59913 - LOCATION
      ?auto_59915 - CITY
      ?auto_59916 - LOCATION
      ?auto_59914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59913 ?auto_59915 ) ( IN-CITY ?auto_59910 ?auto_59915 ) ( not ( = ?auto_59910 ?auto_59913 ) ) ( OBJ-AT ?auto_59911 ?auto_59913 ) ( IN-CITY ?auto_59916 ?auto_59915 ) ( not ( = ?auto_59910 ?auto_59916 ) ) ( OBJ-AT ?auto_59912 ?auto_59916 ) ( TRUCK-AT ?auto_59914 ?auto_59910 ) ( not ( = ?auto_59912 ?auto_59911 ) ) ( not ( = ?auto_59913 ?auto_59916 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59912 ?auto_59911 ?auto_59910 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_59928 - OBJ
      ?auto_59927 - LOCATION
    )
    :vars
    (
      ?auto_59930 - LOCATION
      ?auto_59931 - CITY
      ?auto_59929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59930 ?auto_59931 ) ( IN-CITY ?auto_59927 ?auto_59931 ) ( not ( = ?auto_59927 ?auto_59930 ) ) ( OBJ-AT ?auto_59928 ?auto_59930 ) ( TRUCK-AT ?auto_59929 ?auto_59927 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_59929 ?auto_59927 ?auto_59930 ?auto_59931 )
      ( !LOAD-TRUCK ?auto_59928 ?auto_59929 ?auto_59930 )
      ( !DRIVE-TRUCK ?auto_59929 ?auto_59930 ?auto_59927 ?auto_59931 )
      ( !UNLOAD-TRUCK ?auto_59928 ?auto_59929 ?auto_59927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60019 - OBJ
      ?auto_60020 - OBJ
      ?auto_60021 - OBJ
      ?auto_60018 - LOCATION
    )
    :vars
    (
      ?auto_60024 - LOCATION
      ?auto_60023 - CITY
      ?auto_60025 - LOCATION
      ?auto_60026 - LOCATION
      ?auto_60022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60024 ?auto_60023 ) ( IN-CITY ?auto_60018 ?auto_60023 ) ( not ( = ?auto_60018 ?auto_60024 ) ) ( OBJ-AT ?auto_60021 ?auto_60024 ) ( IN-CITY ?auto_60025 ?auto_60023 ) ( not ( = ?auto_60018 ?auto_60025 ) ) ( OBJ-AT ?auto_60020 ?auto_60025 ) ( IN-CITY ?auto_60026 ?auto_60023 ) ( not ( = ?auto_60018 ?auto_60026 ) ) ( OBJ-AT ?auto_60019 ?auto_60026 ) ( TRUCK-AT ?auto_60022 ?auto_60018 ) ( not ( = ?auto_60019 ?auto_60020 ) ) ( not ( = ?auto_60025 ?auto_60026 ) ) ( not ( = ?auto_60019 ?auto_60021 ) ) ( not ( = ?auto_60020 ?auto_60021 ) ) ( not ( = ?auto_60024 ?auto_60025 ) ) ( not ( = ?auto_60024 ?auto_60026 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60020 ?auto_60019 ?auto_60018 )
      ( DELIVER-1PKG ?auto_60021 ?auto_60018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60038 - OBJ
      ?auto_60039 - OBJ
      ?auto_60040 - OBJ
      ?auto_60037 - LOCATION
    )
    :vars
    (
      ?auto_60043 - LOCATION
      ?auto_60045 - CITY
      ?auto_60044 - LOCATION
      ?auto_60041 - LOCATION
      ?auto_60042 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60043 ?auto_60045 ) ( IN-CITY ?auto_60037 ?auto_60045 ) ( not ( = ?auto_60037 ?auto_60043 ) ) ( OBJ-AT ?auto_60039 ?auto_60043 ) ( IN-CITY ?auto_60044 ?auto_60045 ) ( not ( = ?auto_60037 ?auto_60044 ) ) ( OBJ-AT ?auto_60040 ?auto_60044 ) ( IN-CITY ?auto_60041 ?auto_60045 ) ( not ( = ?auto_60037 ?auto_60041 ) ) ( OBJ-AT ?auto_60038 ?auto_60041 ) ( TRUCK-AT ?auto_60042 ?auto_60037 ) ( not ( = ?auto_60038 ?auto_60040 ) ) ( not ( = ?auto_60044 ?auto_60041 ) ) ( not ( = ?auto_60038 ?auto_60039 ) ) ( not ( = ?auto_60040 ?auto_60039 ) ) ( not ( = ?auto_60043 ?auto_60044 ) ) ( not ( = ?auto_60043 ?auto_60041 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60038 ?auto_60040 ?auto_60039 ?auto_60037 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60057 - OBJ
      ?auto_60058 - OBJ
      ?auto_60059 - OBJ
      ?auto_60056 - LOCATION
    )
    :vars
    (
      ?auto_60062 - LOCATION
      ?auto_60060 - CITY
      ?auto_60063 - LOCATION
      ?auto_60061 - LOCATION
      ?auto_60064 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60062 ?auto_60060 ) ( IN-CITY ?auto_60056 ?auto_60060 ) ( not ( = ?auto_60056 ?auto_60062 ) ) ( OBJ-AT ?auto_60059 ?auto_60062 ) ( IN-CITY ?auto_60063 ?auto_60060 ) ( not ( = ?auto_60056 ?auto_60063 ) ) ( OBJ-AT ?auto_60057 ?auto_60063 ) ( IN-CITY ?auto_60061 ?auto_60060 ) ( not ( = ?auto_60056 ?auto_60061 ) ) ( OBJ-AT ?auto_60058 ?auto_60061 ) ( TRUCK-AT ?auto_60064 ?auto_60056 ) ( not ( = ?auto_60058 ?auto_60057 ) ) ( not ( = ?auto_60063 ?auto_60061 ) ) ( not ( = ?auto_60058 ?auto_60059 ) ) ( not ( = ?auto_60057 ?auto_60059 ) ) ( not ( = ?auto_60062 ?auto_60063 ) ) ( not ( = ?auto_60062 ?auto_60061 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60058 ?auto_60059 ?auto_60057 ?auto_60056 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60076 - OBJ
      ?auto_60077 - OBJ
      ?auto_60078 - OBJ
      ?auto_60075 - LOCATION
    )
    :vars
    (
      ?auto_60081 - LOCATION
      ?auto_60079 - CITY
      ?auto_60082 - LOCATION
      ?auto_60080 - LOCATION
      ?auto_60083 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60081 ?auto_60079 ) ( IN-CITY ?auto_60075 ?auto_60079 ) ( not ( = ?auto_60075 ?auto_60081 ) ) ( OBJ-AT ?auto_60077 ?auto_60081 ) ( IN-CITY ?auto_60082 ?auto_60079 ) ( not ( = ?auto_60075 ?auto_60082 ) ) ( OBJ-AT ?auto_60076 ?auto_60082 ) ( IN-CITY ?auto_60080 ?auto_60079 ) ( not ( = ?auto_60075 ?auto_60080 ) ) ( OBJ-AT ?auto_60078 ?auto_60080 ) ( TRUCK-AT ?auto_60083 ?auto_60075 ) ( not ( = ?auto_60078 ?auto_60076 ) ) ( not ( = ?auto_60082 ?auto_60080 ) ) ( not ( = ?auto_60078 ?auto_60077 ) ) ( not ( = ?auto_60076 ?auto_60077 ) ) ( not ( = ?auto_60081 ?auto_60082 ) ) ( not ( = ?auto_60081 ?auto_60080 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60078 ?auto_60077 ?auto_60076 ?auto_60075 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60115 - OBJ
      ?auto_60116 - OBJ
      ?auto_60117 - OBJ
      ?auto_60114 - LOCATION
    )
    :vars
    (
      ?auto_60120 - LOCATION
      ?auto_60118 - CITY
      ?auto_60121 - LOCATION
      ?auto_60119 - LOCATION
      ?auto_60122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60120 ?auto_60118 ) ( IN-CITY ?auto_60114 ?auto_60118 ) ( not ( = ?auto_60114 ?auto_60120 ) ) ( OBJ-AT ?auto_60115 ?auto_60120 ) ( IN-CITY ?auto_60121 ?auto_60118 ) ( not ( = ?auto_60114 ?auto_60121 ) ) ( OBJ-AT ?auto_60117 ?auto_60121 ) ( IN-CITY ?auto_60119 ?auto_60118 ) ( not ( = ?auto_60114 ?auto_60119 ) ) ( OBJ-AT ?auto_60116 ?auto_60119 ) ( TRUCK-AT ?auto_60122 ?auto_60114 ) ( not ( = ?auto_60116 ?auto_60117 ) ) ( not ( = ?auto_60121 ?auto_60119 ) ) ( not ( = ?auto_60116 ?auto_60115 ) ) ( not ( = ?auto_60117 ?auto_60115 ) ) ( not ( = ?auto_60120 ?auto_60121 ) ) ( not ( = ?auto_60120 ?auto_60119 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60116 ?auto_60115 ?auto_60117 ?auto_60114 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60134 - OBJ
      ?auto_60135 - OBJ
      ?auto_60136 - OBJ
      ?auto_60133 - LOCATION
    )
    :vars
    (
      ?auto_60139 - LOCATION
      ?auto_60137 - CITY
      ?auto_60140 - LOCATION
      ?auto_60138 - LOCATION
      ?auto_60141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60139 ?auto_60137 ) ( IN-CITY ?auto_60133 ?auto_60137 ) ( not ( = ?auto_60133 ?auto_60139 ) ) ( OBJ-AT ?auto_60134 ?auto_60139 ) ( IN-CITY ?auto_60140 ?auto_60137 ) ( not ( = ?auto_60133 ?auto_60140 ) ) ( OBJ-AT ?auto_60135 ?auto_60140 ) ( IN-CITY ?auto_60138 ?auto_60137 ) ( not ( = ?auto_60133 ?auto_60138 ) ) ( OBJ-AT ?auto_60136 ?auto_60138 ) ( TRUCK-AT ?auto_60141 ?auto_60133 ) ( not ( = ?auto_60136 ?auto_60135 ) ) ( not ( = ?auto_60140 ?auto_60138 ) ) ( not ( = ?auto_60136 ?auto_60134 ) ) ( not ( = ?auto_60135 ?auto_60134 ) ) ( not ( = ?auto_60139 ?auto_60140 ) ) ( not ( = ?auto_60139 ?auto_60138 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_60136 ?auto_60134 ?auto_60135 ?auto_60133 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60196 - OBJ
      ?auto_60195 - LOCATION
    )
    :vars
    (
      ?auto_60198 - LOCATION
      ?auto_60199 - CITY
      ?auto_60197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_60198 ?auto_60199 ) ( IN-CITY ?auto_60195 ?auto_60199 ) ( not ( = ?auto_60195 ?auto_60198 ) ) ( OBJ-AT ?auto_60196 ?auto_60198 ) ( TRUCK-AT ?auto_60197 ?auto_60195 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60197 ?auto_60195 ?auto_60198 ?auto_60199 )
      ( !LOAD-TRUCK ?auto_60196 ?auto_60197 ?auto_60198 )
      ( !DRIVE-TRUCK ?auto_60197 ?auto_60198 ?auto_60195 ?auto_60199 )
      ( !UNLOAD-TRUCK ?auto_60196 ?auto_60197 ?auto_60195 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61187 - OBJ
      ?auto_61188 - OBJ
      ?auto_61189 - OBJ
      ?auto_61190 - OBJ
      ?auto_61186 - LOCATION
    )
    :vars
    (
      ?auto_61192 - LOCATION
      ?auto_61193 - CITY
      ?auto_61195 - LOCATION
      ?auto_61196 - LOCATION
      ?auto_61194 - LOCATION
      ?auto_61191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61192 ?auto_61193 ) ( IN-CITY ?auto_61186 ?auto_61193 ) ( not ( = ?auto_61186 ?auto_61192 ) ) ( OBJ-AT ?auto_61190 ?auto_61192 ) ( IN-CITY ?auto_61195 ?auto_61193 ) ( not ( = ?auto_61186 ?auto_61195 ) ) ( OBJ-AT ?auto_61189 ?auto_61195 ) ( IN-CITY ?auto_61196 ?auto_61193 ) ( not ( = ?auto_61186 ?auto_61196 ) ) ( OBJ-AT ?auto_61188 ?auto_61196 ) ( IN-CITY ?auto_61194 ?auto_61193 ) ( not ( = ?auto_61186 ?auto_61194 ) ) ( OBJ-AT ?auto_61187 ?auto_61194 ) ( TRUCK-AT ?auto_61191 ?auto_61186 ) ( not ( = ?auto_61187 ?auto_61188 ) ) ( not ( = ?auto_61196 ?auto_61194 ) ) ( not ( = ?auto_61187 ?auto_61189 ) ) ( not ( = ?auto_61188 ?auto_61189 ) ) ( not ( = ?auto_61195 ?auto_61196 ) ) ( not ( = ?auto_61195 ?auto_61194 ) ) ( not ( = ?auto_61187 ?auto_61190 ) ) ( not ( = ?auto_61188 ?auto_61190 ) ) ( not ( = ?auto_61189 ?auto_61190 ) ) ( not ( = ?auto_61192 ?auto_61195 ) ) ( not ( = ?auto_61192 ?auto_61196 ) ) ( not ( = ?auto_61192 ?auto_61194 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_61187 ?auto_61189 ?auto_61188 ?auto_61186 )
      ( DELIVER-1PKG ?auto_61190 ?auto_61186 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61222 - OBJ
      ?auto_61223 - OBJ
      ?auto_61224 - OBJ
      ?auto_61225 - OBJ
      ?auto_61221 - LOCATION
    )
    :vars
    (
      ?auto_61231 - LOCATION
      ?auto_61229 - CITY
      ?auto_61227 - LOCATION
      ?auto_61226 - LOCATION
      ?auto_61230 - LOCATION
      ?auto_61228 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61231 ?auto_61229 ) ( IN-CITY ?auto_61221 ?auto_61229 ) ( not ( = ?auto_61221 ?auto_61231 ) ) ( OBJ-AT ?auto_61224 ?auto_61231 ) ( IN-CITY ?auto_61227 ?auto_61229 ) ( not ( = ?auto_61221 ?auto_61227 ) ) ( OBJ-AT ?auto_61225 ?auto_61227 ) ( IN-CITY ?auto_61226 ?auto_61229 ) ( not ( = ?auto_61221 ?auto_61226 ) ) ( OBJ-AT ?auto_61223 ?auto_61226 ) ( IN-CITY ?auto_61230 ?auto_61229 ) ( not ( = ?auto_61221 ?auto_61230 ) ) ( OBJ-AT ?auto_61222 ?auto_61230 ) ( TRUCK-AT ?auto_61228 ?auto_61221 ) ( not ( = ?auto_61222 ?auto_61223 ) ) ( not ( = ?auto_61226 ?auto_61230 ) ) ( not ( = ?auto_61222 ?auto_61225 ) ) ( not ( = ?auto_61223 ?auto_61225 ) ) ( not ( = ?auto_61227 ?auto_61226 ) ) ( not ( = ?auto_61227 ?auto_61230 ) ) ( not ( = ?auto_61222 ?auto_61224 ) ) ( not ( = ?auto_61223 ?auto_61224 ) ) ( not ( = ?auto_61225 ?auto_61224 ) ) ( not ( = ?auto_61231 ?auto_61227 ) ) ( not ( = ?auto_61231 ?auto_61226 ) ) ( not ( = ?auto_61231 ?auto_61230 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61222 ?auto_61223 ?auto_61225 ?auto_61224 ?auto_61221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61257 - OBJ
      ?auto_61258 - OBJ
      ?auto_61259 - OBJ
      ?auto_61260 - OBJ
      ?auto_61256 - LOCATION
    )
    :vars
    (
      ?auto_61263 - LOCATION
      ?auto_61265 - CITY
      ?auto_61262 - LOCATION
      ?auto_61264 - LOCATION
      ?auto_61266 - LOCATION
      ?auto_61261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61263 ?auto_61265 ) ( IN-CITY ?auto_61256 ?auto_61265 ) ( not ( = ?auto_61256 ?auto_61263 ) ) ( OBJ-AT ?auto_61260 ?auto_61263 ) ( IN-CITY ?auto_61262 ?auto_61265 ) ( not ( = ?auto_61256 ?auto_61262 ) ) ( OBJ-AT ?auto_61258 ?auto_61262 ) ( IN-CITY ?auto_61264 ?auto_61265 ) ( not ( = ?auto_61256 ?auto_61264 ) ) ( OBJ-AT ?auto_61259 ?auto_61264 ) ( IN-CITY ?auto_61266 ?auto_61265 ) ( not ( = ?auto_61256 ?auto_61266 ) ) ( OBJ-AT ?auto_61257 ?auto_61266 ) ( TRUCK-AT ?auto_61261 ?auto_61256 ) ( not ( = ?auto_61257 ?auto_61259 ) ) ( not ( = ?auto_61264 ?auto_61266 ) ) ( not ( = ?auto_61257 ?auto_61258 ) ) ( not ( = ?auto_61259 ?auto_61258 ) ) ( not ( = ?auto_61262 ?auto_61264 ) ) ( not ( = ?auto_61262 ?auto_61266 ) ) ( not ( = ?auto_61257 ?auto_61260 ) ) ( not ( = ?auto_61259 ?auto_61260 ) ) ( not ( = ?auto_61258 ?auto_61260 ) ) ( not ( = ?auto_61263 ?auto_61262 ) ) ( not ( = ?auto_61263 ?auto_61264 ) ) ( not ( = ?auto_61263 ?auto_61266 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61257 ?auto_61259 ?auto_61260 ?auto_61258 ?auto_61256 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61292 - OBJ
      ?auto_61293 - OBJ
      ?auto_61294 - OBJ
      ?auto_61295 - OBJ
      ?auto_61291 - LOCATION
    )
    :vars
    (
      ?auto_61298 - LOCATION
      ?auto_61300 - CITY
      ?auto_61297 - LOCATION
      ?auto_61299 - LOCATION
      ?auto_61301 - LOCATION
      ?auto_61296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61298 ?auto_61300 ) ( IN-CITY ?auto_61291 ?auto_61300 ) ( not ( = ?auto_61291 ?auto_61298 ) ) ( OBJ-AT ?auto_61294 ?auto_61298 ) ( IN-CITY ?auto_61297 ?auto_61300 ) ( not ( = ?auto_61291 ?auto_61297 ) ) ( OBJ-AT ?auto_61293 ?auto_61297 ) ( IN-CITY ?auto_61299 ?auto_61300 ) ( not ( = ?auto_61291 ?auto_61299 ) ) ( OBJ-AT ?auto_61295 ?auto_61299 ) ( IN-CITY ?auto_61301 ?auto_61300 ) ( not ( = ?auto_61291 ?auto_61301 ) ) ( OBJ-AT ?auto_61292 ?auto_61301 ) ( TRUCK-AT ?auto_61296 ?auto_61291 ) ( not ( = ?auto_61292 ?auto_61295 ) ) ( not ( = ?auto_61299 ?auto_61301 ) ) ( not ( = ?auto_61292 ?auto_61293 ) ) ( not ( = ?auto_61295 ?auto_61293 ) ) ( not ( = ?auto_61297 ?auto_61299 ) ) ( not ( = ?auto_61297 ?auto_61301 ) ) ( not ( = ?auto_61292 ?auto_61294 ) ) ( not ( = ?auto_61295 ?auto_61294 ) ) ( not ( = ?auto_61293 ?auto_61294 ) ) ( not ( = ?auto_61298 ?auto_61297 ) ) ( not ( = ?auto_61298 ?auto_61299 ) ) ( not ( = ?auto_61298 ?auto_61301 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61292 ?auto_61295 ?auto_61294 ?auto_61293 ?auto_61291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61401 - OBJ
      ?auto_61402 - OBJ
      ?auto_61403 - OBJ
      ?auto_61404 - OBJ
      ?auto_61400 - LOCATION
    )
    :vars
    (
      ?auto_61407 - LOCATION
      ?auto_61409 - CITY
      ?auto_61406 - LOCATION
      ?auto_61408 - LOCATION
      ?auto_61410 - LOCATION
      ?auto_61405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61407 ?auto_61409 ) ( IN-CITY ?auto_61400 ?auto_61409 ) ( not ( = ?auto_61400 ?auto_61407 ) ) ( OBJ-AT ?auto_61402 ?auto_61407 ) ( IN-CITY ?auto_61406 ?auto_61409 ) ( not ( = ?auto_61400 ?auto_61406 ) ) ( OBJ-AT ?auto_61404 ?auto_61406 ) ( IN-CITY ?auto_61408 ?auto_61409 ) ( not ( = ?auto_61400 ?auto_61408 ) ) ( OBJ-AT ?auto_61403 ?auto_61408 ) ( IN-CITY ?auto_61410 ?auto_61409 ) ( not ( = ?auto_61400 ?auto_61410 ) ) ( OBJ-AT ?auto_61401 ?auto_61410 ) ( TRUCK-AT ?auto_61405 ?auto_61400 ) ( not ( = ?auto_61401 ?auto_61403 ) ) ( not ( = ?auto_61408 ?auto_61410 ) ) ( not ( = ?auto_61401 ?auto_61404 ) ) ( not ( = ?auto_61403 ?auto_61404 ) ) ( not ( = ?auto_61406 ?auto_61408 ) ) ( not ( = ?auto_61406 ?auto_61410 ) ) ( not ( = ?auto_61401 ?auto_61402 ) ) ( not ( = ?auto_61403 ?auto_61402 ) ) ( not ( = ?auto_61404 ?auto_61402 ) ) ( not ( = ?auto_61407 ?auto_61406 ) ) ( not ( = ?auto_61407 ?auto_61408 ) ) ( not ( = ?auto_61407 ?auto_61410 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61401 ?auto_61403 ?auto_61402 ?auto_61404 ?auto_61400 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61436 - OBJ
      ?auto_61437 - OBJ
      ?auto_61438 - OBJ
      ?auto_61439 - OBJ
      ?auto_61435 - LOCATION
    )
    :vars
    (
      ?auto_61442 - LOCATION
      ?auto_61444 - CITY
      ?auto_61441 - LOCATION
      ?auto_61443 - LOCATION
      ?auto_61445 - LOCATION
      ?auto_61440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61442 ?auto_61444 ) ( IN-CITY ?auto_61435 ?auto_61444 ) ( not ( = ?auto_61435 ?auto_61442 ) ) ( OBJ-AT ?auto_61437 ?auto_61442 ) ( IN-CITY ?auto_61441 ?auto_61444 ) ( not ( = ?auto_61435 ?auto_61441 ) ) ( OBJ-AT ?auto_61438 ?auto_61441 ) ( IN-CITY ?auto_61443 ?auto_61444 ) ( not ( = ?auto_61435 ?auto_61443 ) ) ( OBJ-AT ?auto_61439 ?auto_61443 ) ( IN-CITY ?auto_61445 ?auto_61444 ) ( not ( = ?auto_61435 ?auto_61445 ) ) ( OBJ-AT ?auto_61436 ?auto_61445 ) ( TRUCK-AT ?auto_61440 ?auto_61435 ) ( not ( = ?auto_61436 ?auto_61439 ) ) ( not ( = ?auto_61443 ?auto_61445 ) ) ( not ( = ?auto_61436 ?auto_61438 ) ) ( not ( = ?auto_61439 ?auto_61438 ) ) ( not ( = ?auto_61441 ?auto_61443 ) ) ( not ( = ?auto_61441 ?auto_61445 ) ) ( not ( = ?auto_61436 ?auto_61437 ) ) ( not ( = ?auto_61439 ?auto_61437 ) ) ( not ( = ?auto_61438 ?auto_61437 ) ) ( not ( = ?auto_61442 ?auto_61441 ) ) ( not ( = ?auto_61442 ?auto_61443 ) ) ( not ( = ?auto_61442 ?auto_61445 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61436 ?auto_61439 ?auto_61437 ?auto_61438 ?auto_61435 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61545 - OBJ
      ?auto_61546 - OBJ
      ?auto_61547 - OBJ
      ?auto_61548 - OBJ
      ?auto_61544 - LOCATION
    )
    :vars
    (
      ?auto_61551 - LOCATION
      ?auto_61553 - CITY
      ?auto_61550 - LOCATION
      ?auto_61552 - LOCATION
      ?auto_61554 - LOCATION
      ?auto_61549 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61551 ?auto_61553 ) ( IN-CITY ?auto_61544 ?auto_61553 ) ( not ( = ?auto_61544 ?auto_61551 ) ) ( OBJ-AT ?auto_61548 ?auto_61551 ) ( IN-CITY ?auto_61550 ?auto_61553 ) ( not ( = ?auto_61544 ?auto_61550 ) ) ( OBJ-AT ?auto_61547 ?auto_61550 ) ( IN-CITY ?auto_61552 ?auto_61553 ) ( not ( = ?auto_61544 ?auto_61552 ) ) ( OBJ-AT ?auto_61545 ?auto_61552 ) ( IN-CITY ?auto_61554 ?auto_61553 ) ( not ( = ?auto_61544 ?auto_61554 ) ) ( OBJ-AT ?auto_61546 ?auto_61554 ) ( TRUCK-AT ?auto_61549 ?auto_61544 ) ( not ( = ?auto_61546 ?auto_61545 ) ) ( not ( = ?auto_61552 ?auto_61554 ) ) ( not ( = ?auto_61546 ?auto_61547 ) ) ( not ( = ?auto_61545 ?auto_61547 ) ) ( not ( = ?auto_61550 ?auto_61552 ) ) ( not ( = ?auto_61550 ?auto_61554 ) ) ( not ( = ?auto_61546 ?auto_61548 ) ) ( not ( = ?auto_61545 ?auto_61548 ) ) ( not ( = ?auto_61547 ?auto_61548 ) ) ( not ( = ?auto_61551 ?auto_61550 ) ) ( not ( = ?auto_61551 ?auto_61552 ) ) ( not ( = ?auto_61551 ?auto_61554 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61546 ?auto_61545 ?auto_61548 ?auto_61547 ?auto_61544 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61580 - OBJ
      ?auto_61581 - OBJ
      ?auto_61582 - OBJ
      ?auto_61583 - OBJ
      ?auto_61579 - LOCATION
    )
    :vars
    (
      ?auto_61586 - LOCATION
      ?auto_61588 - CITY
      ?auto_61585 - LOCATION
      ?auto_61587 - LOCATION
      ?auto_61589 - LOCATION
      ?auto_61584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61586 ?auto_61588 ) ( IN-CITY ?auto_61579 ?auto_61588 ) ( not ( = ?auto_61579 ?auto_61586 ) ) ( OBJ-AT ?auto_61582 ?auto_61586 ) ( IN-CITY ?auto_61585 ?auto_61588 ) ( not ( = ?auto_61579 ?auto_61585 ) ) ( OBJ-AT ?auto_61583 ?auto_61585 ) ( IN-CITY ?auto_61587 ?auto_61588 ) ( not ( = ?auto_61579 ?auto_61587 ) ) ( OBJ-AT ?auto_61580 ?auto_61587 ) ( IN-CITY ?auto_61589 ?auto_61588 ) ( not ( = ?auto_61579 ?auto_61589 ) ) ( OBJ-AT ?auto_61581 ?auto_61589 ) ( TRUCK-AT ?auto_61584 ?auto_61579 ) ( not ( = ?auto_61581 ?auto_61580 ) ) ( not ( = ?auto_61587 ?auto_61589 ) ) ( not ( = ?auto_61581 ?auto_61583 ) ) ( not ( = ?auto_61580 ?auto_61583 ) ) ( not ( = ?auto_61585 ?auto_61587 ) ) ( not ( = ?auto_61585 ?auto_61589 ) ) ( not ( = ?auto_61581 ?auto_61582 ) ) ( not ( = ?auto_61580 ?auto_61582 ) ) ( not ( = ?auto_61583 ?auto_61582 ) ) ( not ( = ?auto_61586 ?auto_61585 ) ) ( not ( = ?auto_61586 ?auto_61587 ) ) ( not ( = ?auto_61586 ?auto_61589 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61581 ?auto_61580 ?auto_61582 ?auto_61583 ?auto_61579 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61690 - OBJ
      ?auto_61691 - OBJ
      ?auto_61692 - OBJ
      ?auto_61693 - OBJ
      ?auto_61689 - LOCATION
    )
    :vars
    (
      ?auto_61696 - LOCATION
      ?auto_61698 - CITY
      ?auto_61695 - LOCATION
      ?auto_61697 - LOCATION
      ?auto_61699 - LOCATION
      ?auto_61694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61696 ?auto_61698 ) ( IN-CITY ?auto_61689 ?auto_61698 ) ( not ( = ?auto_61689 ?auto_61696 ) ) ( OBJ-AT ?auto_61693 ?auto_61696 ) ( IN-CITY ?auto_61695 ?auto_61698 ) ( not ( = ?auto_61689 ?auto_61695 ) ) ( OBJ-AT ?auto_61691 ?auto_61695 ) ( IN-CITY ?auto_61697 ?auto_61698 ) ( not ( = ?auto_61689 ?auto_61697 ) ) ( OBJ-AT ?auto_61690 ?auto_61697 ) ( IN-CITY ?auto_61699 ?auto_61698 ) ( not ( = ?auto_61689 ?auto_61699 ) ) ( OBJ-AT ?auto_61692 ?auto_61699 ) ( TRUCK-AT ?auto_61694 ?auto_61689 ) ( not ( = ?auto_61692 ?auto_61690 ) ) ( not ( = ?auto_61697 ?auto_61699 ) ) ( not ( = ?auto_61692 ?auto_61691 ) ) ( not ( = ?auto_61690 ?auto_61691 ) ) ( not ( = ?auto_61695 ?auto_61697 ) ) ( not ( = ?auto_61695 ?auto_61699 ) ) ( not ( = ?auto_61692 ?auto_61693 ) ) ( not ( = ?auto_61690 ?auto_61693 ) ) ( not ( = ?auto_61691 ?auto_61693 ) ) ( not ( = ?auto_61696 ?auto_61695 ) ) ( not ( = ?auto_61696 ?auto_61697 ) ) ( not ( = ?auto_61696 ?auto_61699 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61692 ?auto_61690 ?auto_61693 ?auto_61691 ?auto_61689 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61725 - OBJ
      ?auto_61726 - OBJ
      ?auto_61727 - OBJ
      ?auto_61728 - OBJ
      ?auto_61724 - LOCATION
    )
    :vars
    (
      ?auto_61731 - LOCATION
      ?auto_61733 - CITY
      ?auto_61730 - LOCATION
      ?auto_61732 - LOCATION
      ?auto_61734 - LOCATION
      ?auto_61729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61731 ?auto_61733 ) ( IN-CITY ?auto_61724 ?auto_61733 ) ( not ( = ?auto_61724 ?auto_61731 ) ) ( OBJ-AT ?auto_61727 ?auto_61731 ) ( IN-CITY ?auto_61730 ?auto_61733 ) ( not ( = ?auto_61724 ?auto_61730 ) ) ( OBJ-AT ?auto_61726 ?auto_61730 ) ( IN-CITY ?auto_61732 ?auto_61733 ) ( not ( = ?auto_61724 ?auto_61732 ) ) ( OBJ-AT ?auto_61725 ?auto_61732 ) ( IN-CITY ?auto_61734 ?auto_61733 ) ( not ( = ?auto_61724 ?auto_61734 ) ) ( OBJ-AT ?auto_61728 ?auto_61734 ) ( TRUCK-AT ?auto_61729 ?auto_61724 ) ( not ( = ?auto_61728 ?auto_61725 ) ) ( not ( = ?auto_61732 ?auto_61734 ) ) ( not ( = ?auto_61728 ?auto_61726 ) ) ( not ( = ?auto_61725 ?auto_61726 ) ) ( not ( = ?auto_61730 ?auto_61732 ) ) ( not ( = ?auto_61730 ?auto_61734 ) ) ( not ( = ?auto_61728 ?auto_61727 ) ) ( not ( = ?auto_61725 ?auto_61727 ) ) ( not ( = ?auto_61726 ?auto_61727 ) ) ( not ( = ?auto_61731 ?auto_61730 ) ) ( not ( = ?auto_61731 ?auto_61732 ) ) ( not ( = ?auto_61731 ?auto_61734 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61728 ?auto_61725 ?auto_61727 ?auto_61726 ?auto_61724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61796 - OBJ
      ?auto_61797 - OBJ
      ?auto_61798 - OBJ
      ?auto_61799 - OBJ
      ?auto_61795 - LOCATION
    )
    :vars
    (
      ?auto_61802 - LOCATION
      ?auto_61804 - CITY
      ?auto_61801 - LOCATION
      ?auto_61803 - LOCATION
      ?auto_61805 - LOCATION
      ?auto_61800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61802 ?auto_61804 ) ( IN-CITY ?auto_61795 ?auto_61804 ) ( not ( = ?auto_61795 ?auto_61802 ) ) ( OBJ-AT ?auto_61797 ?auto_61802 ) ( IN-CITY ?auto_61801 ?auto_61804 ) ( not ( = ?auto_61795 ?auto_61801 ) ) ( OBJ-AT ?auto_61799 ?auto_61801 ) ( IN-CITY ?auto_61803 ?auto_61804 ) ( not ( = ?auto_61795 ?auto_61803 ) ) ( OBJ-AT ?auto_61796 ?auto_61803 ) ( IN-CITY ?auto_61805 ?auto_61804 ) ( not ( = ?auto_61795 ?auto_61805 ) ) ( OBJ-AT ?auto_61798 ?auto_61805 ) ( TRUCK-AT ?auto_61800 ?auto_61795 ) ( not ( = ?auto_61798 ?auto_61796 ) ) ( not ( = ?auto_61803 ?auto_61805 ) ) ( not ( = ?auto_61798 ?auto_61799 ) ) ( not ( = ?auto_61796 ?auto_61799 ) ) ( not ( = ?auto_61801 ?auto_61803 ) ) ( not ( = ?auto_61801 ?auto_61805 ) ) ( not ( = ?auto_61798 ?auto_61797 ) ) ( not ( = ?auto_61796 ?auto_61797 ) ) ( not ( = ?auto_61799 ?auto_61797 ) ) ( not ( = ?auto_61802 ?auto_61801 ) ) ( not ( = ?auto_61802 ?auto_61803 ) ) ( not ( = ?auto_61802 ?auto_61805 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61798 ?auto_61796 ?auto_61797 ?auto_61799 ?auto_61795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61869 - OBJ
      ?auto_61870 - OBJ
      ?auto_61871 - OBJ
      ?auto_61872 - OBJ
      ?auto_61868 - LOCATION
    )
    :vars
    (
      ?auto_61875 - LOCATION
      ?auto_61877 - CITY
      ?auto_61874 - LOCATION
      ?auto_61876 - LOCATION
      ?auto_61878 - LOCATION
      ?auto_61873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61875 ?auto_61877 ) ( IN-CITY ?auto_61868 ?auto_61877 ) ( not ( = ?auto_61868 ?auto_61875 ) ) ( OBJ-AT ?auto_61870 ?auto_61875 ) ( IN-CITY ?auto_61874 ?auto_61877 ) ( not ( = ?auto_61868 ?auto_61874 ) ) ( OBJ-AT ?auto_61871 ?auto_61874 ) ( IN-CITY ?auto_61876 ?auto_61877 ) ( not ( = ?auto_61868 ?auto_61876 ) ) ( OBJ-AT ?auto_61869 ?auto_61876 ) ( IN-CITY ?auto_61878 ?auto_61877 ) ( not ( = ?auto_61868 ?auto_61878 ) ) ( OBJ-AT ?auto_61872 ?auto_61878 ) ( TRUCK-AT ?auto_61873 ?auto_61868 ) ( not ( = ?auto_61872 ?auto_61869 ) ) ( not ( = ?auto_61876 ?auto_61878 ) ) ( not ( = ?auto_61872 ?auto_61871 ) ) ( not ( = ?auto_61869 ?auto_61871 ) ) ( not ( = ?auto_61874 ?auto_61876 ) ) ( not ( = ?auto_61874 ?auto_61878 ) ) ( not ( = ?auto_61872 ?auto_61870 ) ) ( not ( = ?auto_61869 ?auto_61870 ) ) ( not ( = ?auto_61871 ?auto_61870 ) ) ( not ( = ?auto_61875 ?auto_61874 ) ) ( not ( = ?auto_61875 ?auto_61876 ) ) ( not ( = ?auto_61875 ?auto_61878 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61872 ?auto_61869 ?auto_61870 ?auto_61871 ?auto_61868 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61978 - OBJ
      ?auto_61979 - OBJ
      ?auto_61980 - OBJ
      ?auto_61981 - OBJ
      ?auto_61977 - LOCATION
    )
    :vars
    (
      ?auto_61984 - LOCATION
      ?auto_61986 - CITY
      ?auto_61983 - LOCATION
      ?auto_61985 - LOCATION
      ?auto_61987 - LOCATION
      ?auto_61982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_61984 ?auto_61986 ) ( IN-CITY ?auto_61977 ?auto_61986 ) ( not ( = ?auto_61977 ?auto_61984 ) ) ( OBJ-AT ?auto_61981 ?auto_61984 ) ( IN-CITY ?auto_61983 ?auto_61986 ) ( not ( = ?auto_61977 ?auto_61983 ) ) ( OBJ-AT ?auto_61978 ?auto_61983 ) ( IN-CITY ?auto_61985 ?auto_61986 ) ( not ( = ?auto_61977 ?auto_61985 ) ) ( OBJ-AT ?auto_61980 ?auto_61985 ) ( IN-CITY ?auto_61987 ?auto_61986 ) ( not ( = ?auto_61977 ?auto_61987 ) ) ( OBJ-AT ?auto_61979 ?auto_61987 ) ( TRUCK-AT ?auto_61982 ?auto_61977 ) ( not ( = ?auto_61979 ?auto_61980 ) ) ( not ( = ?auto_61985 ?auto_61987 ) ) ( not ( = ?auto_61979 ?auto_61978 ) ) ( not ( = ?auto_61980 ?auto_61978 ) ) ( not ( = ?auto_61983 ?auto_61985 ) ) ( not ( = ?auto_61983 ?auto_61987 ) ) ( not ( = ?auto_61979 ?auto_61981 ) ) ( not ( = ?auto_61980 ?auto_61981 ) ) ( not ( = ?auto_61978 ?auto_61981 ) ) ( not ( = ?auto_61984 ?auto_61983 ) ) ( not ( = ?auto_61984 ?auto_61985 ) ) ( not ( = ?auto_61984 ?auto_61987 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_61979 ?auto_61980 ?auto_61981 ?auto_61978 ?auto_61977 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62013 - OBJ
      ?auto_62014 - OBJ
      ?auto_62015 - OBJ
      ?auto_62016 - OBJ
      ?auto_62012 - LOCATION
    )
    :vars
    (
      ?auto_62019 - LOCATION
      ?auto_62021 - CITY
      ?auto_62018 - LOCATION
      ?auto_62020 - LOCATION
      ?auto_62022 - LOCATION
      ?auto_62017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62019 ?auto_62021 ) ( IN-CITY ?auto_62012 ?auto_62021 ) ( not ( = ?auto_62012 ?auto_62019 ) ) ( OBJ-AT ?auto_62015 ?auto_62019 ) ( IN-CITY ?auto_62018 ?auto_62021 ) ( not ( = ?auto_62012 ?auto_62018 ) ) ( OBJ-AT ?auto_62013 ?auto_62018 ) ( IN-CITY ?auto_62020 ?auto_62021 ) ( not ( = ?auto_62012 ?auto_62020 ) ) ( OBJ-AT ?auto_62016 ?auto_62020 ) ( IN-CITY ?auto_62022 ?auto_62021 ) ( not ( = ?auto_62012 ?auto_62022 ) ) ( OBJ-AT ?auto_62014 ?auto_62022 ) ( TRUCK-AT ?auto_62017 ?auto_62012 ) ( not ( = ?auto_62014 ?auto_62016 ) ) ( not ( = ?auto_62020 ?auto_62022 ) ) ( not ( = ?auto_62014 ?auto_62013 ) ) ( not ( = ?auto_62016 ?auto_62013 ) ) ( not ( = ?auto_62018 ?auto_62020 ) ) ( not ( = ?auto_62018 ?auto_62022 ) ) ( not ( = ?auto_62014 ?auto_62015 ) ) ( not ( = ?auto_62016 ?auto_62015 ) ) ( not ( = ?auto_62013 ?auto_62015 ) ) ( not ( = ?auto_62019 ?auto_62018 ) ) ( not ( = ?auto_62019 ?auto_62020 ) ) ( not ( = ?auto_62019 ?auto_62022 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62014 ?auto_62016 ?auto_62015 ?auto_62013 ?auto_62012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62048 - OBJ
      ?auto_62049 - OBJ
      ?auto_62050 - OBJ
      ?auto_62051 - OBJ
      ?auto_62047 - LOCATION
    )
    :vars
    (
      ?auto_62054 - LOCATION
      ?auto_62056 - CITY
      ?auto_62053 - LOCATION
      ?auto_62055 - LOCATION
      ?auto_62057 - LOCATION
      ?auto_62052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62054 ?auto_62056 ) ( IN-CITY ?auto_62047 ?auto_62056 ) ( not ( = ?auto_62047 ?auto_62054 ) ) ( OBJ-AT ?auto_62051 ?auto_62054 ) ( IN-CITY ?auto_62053 ?auto_62056 ) ( not ( = ?auto_62047 ?auto_62053 ) ) ( OBJ-AT ?auto_62048 ?auto_62053 ) ( IN-CITY ?auto_62055 ?auto_62056 ) ( not ( = ?auto_62047 ?auto_62055 ) ) ( OBJ-AT ?auto_62049 ?auto_62055 ) ( IN-CITY ?auto_62057 ?auto_62056 ) ( not ( = ?auto_62047 ?auto_62057 ) ) ( OBJ-AT ?auto_62050 ?auto_62057 ) ( TRUCK-AT ?auto_62052 ?auto_62047 ) ( not ( = ?auto_62050 ?auto_62049 ) ) ( not ( = ?auto_62055 ?auto_62057 ) ) ( not ( = ?auto_62050 ?auto_62048 ) ) ( not ( = ?auto_62049 ?auto_62048 ) ) ( not ( = ?auto_62053 ?auto_62055 ) ) ( not ( = ?auto_62053 ?auto_62057 ) ) ( not ( = ?auto_62050 ?auto_62051 ) ) ( not ( = ?auto_62049 ?auto_62051 ) ) ( not ( = ?auto_62048 ?auto_62051 ) ) ( not ( = ?auto_62054 ?auto_62053 ) ) ( not ( = ?auto_62054 ?auto_62055 ) ) ( not ( = ?auto_62054 ?auto_62057 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62050 ?auto_62049 ?auto_62051 ?auto_62048 ?auto_62047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62083 - OBJ
      ?auto_62084 - OBJ
      ?auto_62085 - OBJ
      ?auto_62086 - OBJ
      ?auto_62082 - LOCATION
    )
    :vars
    (
      ?auto_62089 - LOCATION
      ?auto_62091 - CITY
      ?auto_62088 - LOCATION
      ?auto_62090 - LOCATION
      ?auto_62092 - LOCATION
      ?auto_62087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62089 ?auto_62091 ) ( IN-CITY ?auto_62082 ?auto_62091 ) ( not ( = ?auto_62082 ?auto_62089 ) ) ( OBJ-AT ?auto_62085 ?auto_62089 ) ( IN-CITY ?auto_62088 ?auto_62091 ) ( not ( = ?auto_62082 ?auto_62088 ) ) ( OBJ-AT ?auto_62083 ?auto_62088 ) ( IN-CITY ?auto_62090 ?auto_62091 ) ( not ( = ?auto_62082 ?auto_62090 ) ) ( OBJ-AT ?auto_62084 ?auto_62090 ) ( IN-CITY ?auto_62092 ?auto_62091 ) ( not ( = ?auto_62082 ?auto_62092 ) ) ( OBJ-AT ?auto_62086 ?auto_62092 ) ( TRUCK-AT ?auto_62087 ?auto_62082 ) ( not ( = ?auto_62086 ?auto_62084 ) ) ( not ( = ?auto_62090 ?auto_62092 ) ) ( not ( = ?auto_62086 ?auto_62083 ) ) ( not ( = ?auto_62084 ?auto_62083 ) ) ( not ( = ?auto_62088 ?auto_62090 ) ) ( not ( = ?auto_62088 ?auto_62092 ) ) ( not ( = ?auto_62086 ?auto_62085 ) ) ( not ( = ?auto_62084 ?auto_62085 ) ) ( not ( = ?auto_62083 ?auto_62085 ) ) ( not ( = ?auto_62089 ?auto_62088 ) ) ( not ( = ?auto_62089 ?auto_62090 ) ) ( not ( = ?auto_62089 ?auto_62092 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62086 ?auto_62084 ?auto_62085 ?auto_62083 ?auto_62082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62229 - OBJ
      ?auto_62230 - OBJ
      ?auto_62231 - OBJ
      ?auto_62232 - OBJ
      ?auto_62228 - LOCATION
    )
    :vars
    (
      ?auto_62235 - LOCATION
      ?auto_62237 - CITY
      ?auto_62234 - LOCATION
      ?auto_62236 - LOCATION
      ?auto_62238 - LOCATION
      ?auto_62233 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62235 ?auto_62237 ) ( IN-CITY ?auto_62228 ?auto_62237 ) ( not ( = ?auto_62228 ?auto_62235 ) ) ( OBJ-AT ?auto_62230 ?auto_62235 ) ( IN-CITY ?auto_62234 ?auto_62237 ) ( not ( = ?auto_62228 ?auto_62234 ) ) ( OBJ-AT ?auto_62229 ?auto_62234 ) ( IN-CITY ?auto_62236 ?auto_62237 ) ( not ( = ?auto_62228 ?auto_62236 ) ) ( OBJ-AT ?auto_62232 ?auto_62236 ) ( IN-CITY ?auto_62238 ?auto_62237 ) ( not ( = ?auto_62228 ?auto_62238 ) ) ( OBJ-AT ?auto_62231 ?auto_62238 ) ( TRUCK-AT ?auto_62233 ?auto_62228 ) ( not ( = ?auto_62231 ?auto_62232 ) ) ( not ( = ?auto_62236 ?auto_62238 ) ) ( not ( = ?auto_62231 ?auto_62229 ) ) ( not ( = ?auto_62232 ?auto_62229 ) ) ( not ( = ?auto_62234 ?auto_62236 ) ) ( not ( = ?auto_62234 ?auto_62238 ) ) ( not ( = ?auto_62231 ?auto_62230 ) ) ( not ( = ?auto_62232 ?auto_62230 ) ) ( not ( = ?auto_62229 ?auto_62230 ) ) ( not ( = ?auto_62235 ?auto_62234 ) ) ( not ( = ?auto_62235 ?auto_62236 ) ) ( not ( = ?auto_62235 ?auto_62238 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62231 ?auto_62232 ?auto_62230 ?auto_62229 ?auto_62228 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62264 - OBJ
      ?auto_62265 - OBJ
      ?auto_62266 - OBJ
      ?auto_62267 - OBJ
      ?auto_62263 - LOCATION
    )
    :vars
    (
      ?auto_62270 - LOCATION
      ?auto_62272 - CITY
      ?auto_62269 - LOCATION
      ?auto_62271 - LOCATION
      ?auto_62273 - LOCATION
      ?auto_62268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62270 ?auto_62272 ) ( IN-CITY ?auto_62263 ?auto_62272 ) ( not ( = ?auto_62263 ?auto_62270 ) ) ( OBJ-AT ?auto_62265 ?auto_62270 ) ( IN-CITY ?auto_62269 ?auto_62272 ) ( not ( = ?auto_62263 ?auto_62269 ) ) ( OBJ-AT ?auto_62264 ?auto_62269 ) ( IN-CITY ?auto_62271 ?auto_62272 ) ( not ( = ?auto_62263 ?auto_62271 ) ) ( OBJ-AT ?auto_62266 ?auto_62271 ) ( IN-CITY ?auto_62273 ?auto_62272 ) ( not ( = ?auto_62263 ?auto_62273 ) ) ( OBJ-AT ?auto_62267 ?auto_62273 ) ( TRUCK-AT ?auto_62268 ?auto_62263 ) ( not ( = ?auto_62267 ?auto_62266 ) ) ( not ( = ?auto_62271 ?auto_62273 ) ) ( not ( = ?auto_62267 ?auto_62264 ) ) ( not ( = ?auto_62266 ?auto_62264 ) ) ( not ( = ?auto_62269 ?auto_62271 ) ) ( not ( = ?auto_62269 ?auto_62273 ) ) ( not ( = ?auto_62267 ?auto_62265 ) ) ( not ( = ?auto_62266 ?auto_62265 ) ) ( not ( = ?auto_62264 ?auto_62265 ) ) ( not ( = ?auto_62270 ?auto_62269 ) ) ( not ( = ?auto_62270 ?auto_62271 ) ) ( not ( = ?auto_62270 ?auto_62273 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62267 ?auto_62266 ?auto_62265 ?auto_62264 ?auto_62263 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62485 - OBJ
      ?auto_62486 - OBJ
      ?auto_62487 - OBJ
      ?auto_62488 - OBJ
      ?auto_62484 - LOCATION
    )
    :vars
    (
      ?auto_62491 - LOCATION
      ?auto_62493 - CITY
      ?auto_62490 - LOCATION
      ?auto_62492 - LOCATION
      ?auto_62494 - LOCATION
      ?auto_62489 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62491 ?auto_62493 ) ( IN-CITY ?auto_62484 ?auto_62493 ) ( not ( = ?auto_62484 ?auto_62491 ) ) ( OBJ-AT ?auto_62485 ?auto_62491 ) ( IN-CITY ?auto_62490 ?auto_62493 ) ( not ( = ?auto_62484 ?auto_62490 ) ) ( OBJ-AT ?auto_62488 ?auto_62490 ) ( IN-CITY ?auto_62492 ?auto_62493 ) ( not ( = ?auto_62484 ?auto_62492 ) ) ( OBJ-AT ?auto_62487 ?auto_62492 ) ( IN-CITY ?auto_62494 ?auto_62493 ) ( not ( = ?auto_62484 ?auto_62494 ) ) ( OBJ-AT ?auto_62486 ?auto_62494 ) ( TRUCK-AT ?auto_62489 ?auto_62484 ) ( not ( = ?auto_62486 ?auto_62487 ) ) ( not ( = ?auto_62492 ?auto_62494 ) ) ( not ( = ?auto_62486 ?auto_62488 ) ) ( not ( = ?auto_62487 ?auto_62488 ) ) ( not ( = ?auto_62490 ?auto_62492 ) ) ( not ( = ?auto_62490 ?auto_62494 ) ) ( not ( = ?auto_62486 ?auto_62485 ) ) ( not ( = ?auto_62487 ?auto_62485 ) ) ( not ( = ?auto_62488 ?auto_62485 ) ) ( not ( = ?auto_62491 ?auto_62490 ) ) ( not ( = ?auto_62491 ?auto_62492 ) ) ( not ( = ?auto_62491 ?auto_62494 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62486 ?auto_62487 ?auto_62485 ?auto_62488 ?auto_62484 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62520 - OBJ
      ?auto_62521 - OBJ
      ?auto_62522 - OBJ
      ?auto_62523 - OBJ
      ?auto_62519 - LOCATION
    )
    :vars
    (
      ?auto_62526 - LOCATION
      ?auto_62528 - CITY
      ?auto_62525 - LOCATION
      ?auto_62527 - LOCATION
      ?auto_62529 - LOCATION
      ?auto_62524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62526 ?auto_62528 ) ( IN-CITY ?auto_62519 ?auto_62528 ) ( not ( = ?auto_62519 ?auto_62526 ) ) ( OBJ-AT ?auto_62520 ?auto_62526 ) ( IN-CITY ?auto_62525 ?auto_62528 ) ( not ( = ?auto_62519 ?auto_62525 ) ) ( OBJ-AT ?auto_62522 ?auto_62525 ) ( IN-CITY ?auto_62527 ?auto_62528 ) ( not ( = ?auto_62519 ?auto_62527 ) ) ( OBJ-AT ?auto_62523 ?auto_62527 ) ( IN-CITY ?auto_62529 ?auto_62528 ) ( not ( = ?auto_62519 ?auto_62529 ) ) ( OBJ-AT ?auto_62521 ?auto_62529 ) ( TRUCK-AT ?auto_62524 ?auto_62519 ) ( not ( = ?auto_62521 ?auto_62523 ) ) ( not ( = ?auto_62527 ?auto_62529 ) ) ( not ( = ?auto_62521 ?auto_62522 ) ) ( not ( = ?auto_62523 ?auto_62522 ) ) ( not ( = ?auto_62525 ?auto_62527 ) ) ( not ( = ?auto_62525 ?auto_62529 ) ) ( not ( = ?auto_62521 ?auto_62520 ) ) ( not ( = ?auto_62523 ?auto_62520 ) ) ( not ( = ?auto_62522 ?auto_62520 ) ) ( not ( = ?auto_62526 ?auto_62525 ) ) ( not ( = ?auto_62526 ?auto_62527 ) ) ( not ( = ?auto_62526 ?auto_62529 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62521 ?auto_62523 ?auto_62520 ?auto_62522 ?auto_62519 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62629 - OBJ
      ?auto_62630 - OBJ
      ?auto_62631 - OBJ
      ?auto_62632 - OBJ
      ?auto_62628 - LOCATION
    )
    :vars
    (
      ?auto_62635 - LOCATION
      ?auto_62637 - CITY
      ?auto_62634 - LOCATION
      ?auto_62636 - LOCATION
      ?auto_62638 - LOCATION
      ?auto_62633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62635 ?auto_62637 ) ( IN-CITY ?auto_62628 ?auto_62637 ) ( not ( = ?auto_62628 ?auto_62635 ) ) ( OBJ-AT ?auto_62629 ?auto_62635 ) ( IN-CITY ?auto_62634 ?auto_62637 ) ( not ( = ?auto_62628 ?auto_62634 ) ) ( OBJ-AT ?auto_62632 ?auto_62634 ) ( IN-CITY ?auto_62636 ?auto_62637 ) ( not ( = ?auto_62628 ?auto_62636 ) ) ( OBJ-AT ?auto_62630 ?auto_62636 ) ( IN-CITY ?auto_62638 ?auto_62637 ) ( not ( = ?auto_62628 ?auto_62638 ) ) ( OBJ-AT ?auto_62631 ?auto_62638 ) ( TRUCK-AT ?auto_62633 ?auto_62628 ) ( not ( = ?auto_62631 ?auto_62630 ) ) ( not ( = ?auto_62636 ?auto_62638 ) ) ( not ( = ?auto_62631 ?auto_62632 ) ) ( not ( = ?auto_62630 ?auto_62632 ) ) ( not ( = ?auto_62634 ?auto_62636 ) ) ( not ( = ?auto_62634 ?auto_62638 ) ) ( not ( = ?auto_62631 ?auto_62629 ) ) ( not ( = ?auto_62630 ?auto_62629 ) ) ( not ( = ?auto_62632 ?auto_62629 ) ) ( not ( = ?auto_62635 ?auto_62634 ) ) ( not ( = ?auto_62635 ?auto_62636 ) ) ( not ( = ?auto_62635 ?auto_62638 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62631 ?auto_62630 ?auto_62629 ?auto_62632 ?auto_62628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62702 - OBJ
      ?auto_62703 - OBJ
      ?auto_62704 - OBJ
      ?auto_62705 - OBJ
      ?auto_62701 - LOCATION
    )
    :vars
    (
      ?auto_62708 - LOCATION
      ?auto_62710 - CITY
      ?auto_62707 - LOCATION
      ?auto_62709 - LOCATION
      ?auto_62711 - LOCATION
      ?auto_62706 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62708 ?auto_62710 ) ( IN-CITY ?auto_62701 ?auto_62710 ) ( not ( = ?auto_62701 ?auto_62708 ) ) ( OBJ-AT ?auto_62702 ?auto_62708 ) ( IN-CITY ?auto_62707 ?auto_62710 ) ( not ( = ?auto_62701 ?auto_62707 ) ) ( OBJ-AT ?auto_62704 ?auto_62707 ) ( IN-CITY ?auto_62709 ?auto_62710 ) ( not ( = ?auto_62701 ?auto_62709 ) ) ( OBJ-AT ?auto_62703 ?auto_62709 ) ( IN-CITY ?auto_62711 ?auto_62710 ) ( not ( = ?auto_62701 ?auto_62711 ) ) ( OBJ-AT ?auto_62705 ?auto_62711 ) ( TRUCK-AT ?auto_62706 ?auto_62701 ) ( not ( = ?auto_62705 ?auto_62703 ) ) ( not ( = ?auto_62709 ?auto_62711 ) ) ( not ( = ?auto_62705 ?auto_62704 ) ) ( not ( = ?auto_62703 ?auto_62704 ) ) ( not ( = ?auto_62707 ?auto_62709 ) ) ( not ( = ?auto_62707 ?auto_62711 ) ) ( not ( = ?auto_62705 ?auto_62702 ) ) ( not ( = ?auto_62703 ?auto_62702 ) ) ( not ( = ?auto_62704 ?auto_62702 ) ) ( not ( = ?auto_62708 ?auto_62707 ) ) ( not ( = ?auto_62708 ?auto_62709 ) ) ( not ( = ?auto_62708 ?auto_62711 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62705 ?auto_62703 ?auto_62702 ?auto_62704 ?auto_62701 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62811 - OBJ
      ?auto_62812 - OBJ
      ?auto_62813 - OBJ
      ?auto_62814 - OBJ
      ?auto_62810 - LOCATION
    )
    :vars
    (
      ?auto_62817 - LOCATION
      ?auto_62819 - CITY
      ?auto_62816 - LOCATION
      ?auto_62818 - LOCATION
      ?auto_62820 - LOCATION
      ?auto_62815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62817 ?auto_62819 ) ( IN-CITY ?auto_62810 ?auto_62819 ) ( not ( = ?auto_62810 ?auto_62817 ) ) ( OBJ-AT ?auto_62811 ?auto_62817 ) ( IN-CITY ?auto_62816 ?auto_62819 ) ( not ( = ?auto_62810 ?auto_62816 ) ) ( OBJ-AT ?auto_62812 ?auto_62816 ) ( IN-CITY ?auto_62818 ?auto_62819 ) ( not ( = ?auto_62810 ?auto_62818 ) ) ( OBJ-AT ?auto_62814 ?auto_62818 ) ( IN-CITY ?auto_62820 ?auto_62819 ) ( not ( = ?auto_62810 ?auto_62820 ) ) ( OBJ-AT ?auto_62813 ?auto_62820 ) ( TRUCK-AT ?auto_62815 ?auto_62810 ) ( not ( = ?auto_62813 ?auto_62814 ) ) ( not ( = ?auto_62818 ?auto_62820 ) ) ( not ( = ?auto_62813 ?auto_62812 ) ) ( not ( = ?auto_62814 ?auto_62812 ) ) ( not ( = ?auto_62816 ?auto_62818 ) ) ( not ( = ?auto_62816 ?auto_62820 ) ) ( not ( = ?auto_62813 ?auto_62811 ) ) ( not ( = ?auto_62814 ?auto_62811 ) ) ( not ( = ?auto_62812 ?auto_62811 ) ) ( not ( = ?auto_62817 ?auto_62816 ) ) ( not ( = ?auto_62817 ?auto_62818 ) ) ( not ( = ?auto_62817 ?auto_62820 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62813 ?auto_62814 ?auto_62811 ?auto_62812 ?auto_62810 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62846 - OBJ
      ?auto_62847 - OBJ
      ?auto_62848 - OBJ
      ?auto_62849 - OBJ
      ?auto_62845 - LOCATION
    )
    :vars
    (
      ?auto_62852 - LOCATION
      ?auto_62854 - CITY
      ?auto_62851 - LOCATION
      ?auto_62853 - LOCATION
      ?auto_62855 - LOCATION
      ?auto_62850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62852 ?auto_62854 ) ( IN-CITY ?auto_62845 ?auto_62854 ) ( not ( = ?auto_62845 ?auto_62852 ) ) ( OBJ-AT ?auto_62846 ?auto_62852 ) ( IN-CITY ?auto_62851 ?auto_62854 ) ( not ( = ?auto_62845 ?auto_62851 ) ) ( OBJ-AT ?auto_62847 ?auto_62851 ) ( IN-CITY ?auto_62853 ?auto_62854 ) ( not ( = ?auto_62845 ?auto_62853 ) ) ( OBJ-AT ?auto_62848 ?auto_62853 ) ( IN-CITY ?auto_62855 ?auto_62854 ) ( not ( = ?auto_62845 ?auto_62855 ) ) ( OBJ-AT ?auto_62849 ?auto_62855 ) ( TRUCK-AT ?auto_62850 ?auto_62845 ) ( not ( = ?auto_62849 ?auto_62848 ) ) ( not ( = ?auto_62853 ?auto_62855 ) ) ( not ( = ?auto_62849 ?auto_62847 ) ) ( not ( = ?auto_62848 ?auto_62847 ) ) ( not ( = ?auto_62851 ?auto_62853 ) ) ( not ( = ?auto_62851 ?auto_62855 ) ) ( not ( = ?auto_62849 ?auto_62846 ) ) ( not ( = ?auto_62848 ?auto_62846 ) ) ( not ( = ?auto_62847 ?auto_62846 ) ) ( not ( = ?auto_62852 ?auto_62851 ) ) ( not ( = ?auto_62852 ?auto_62853 ) ) ( not ( = ?auto_62852 ?auto_62855 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_62849 ?auto_62848 ?auto_62846 ?auto_62847 ?auto_62845 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63198 - OBJ
      ?auto_63197 - LOCATION
    )
    :vars
    (
      ?auto_63200 - LOCATION
      ?auto_63201 - CITY
      ?auto_63199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_63200 ?auto_63201 ) ( IN-CITY ?auto_63197 ?auto_63201 ) ( not ( = ?auto_63197 ?auto_63200 ) ) ( OBJ-AT ?auto_63198 ?auto_63200 ) ( TRUCK-AT ?auto_63199 ?auto_63197 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_63199 ?auto_63197 ?auto_63200 ?auto_63201 )
      ( !LOAD-TRUCK ?auto_63198 ?auto_63199 ?auto_63200 )
      ( !DRIVE-TRUCK ?auto_63199 ?auto_63200 ?auto_63197 ?auto_63201 )
      ( !UNLOAD-TRUCK ?auto_63198 ?auto_63199 ?auto_63197 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76935 - OBJ
      ?auto_76936 - OBJ
      ?auto_76937 - OBJ
      ?auto_76938 - OBJ
      ?auto_76939 - OBJ
      ?auto_76934 - LOCATION
    )
    :vars
    (
      ?auto_76941 - LOCATION
      ?auto_76940 - CITY
      ?auto_76944 - LOCATION
      ?auto_76943 - LOCATION
      ?auto_76945 - LOCATION
      ?auto_76942 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76941 ?auto_76940 ) ( IN-CITY ?auto_76934 ?auto_76940 ) ( not ( = ?auto_76934 ?auto_76941 ) ) ( OBJ-AT ?auto_76939 ?auto_76941 ) ( IN-CITY ?auto_76944 ?auto_76940 ) ( not ( = ?auto_76934 ?auto_76944 ) ) ( OBJ-AT ?auto_76938 ?auto_76944 ) ( IN-CITY ?auto_76943 ?auto_76940 ) ( not ( = ?auto_76934 ?auto_76943 ) ) ( OBJ-AT ?auto_76937 ?auto_76943 ) ( IN-CITY ?auto_76945 ?auto_76940 ) ( not ( = ?auto_76934 ?auto_76945 ) ) ( OBJ-AT ?auto_76936 ?auto_76945 ) ( OBJ-AT ?auto_76935 ?auto_76941 ) ( TRUCK-AT ?auto_76942 ?auto_76934 ) ( not ( = ?auto_76935 ?auto_76936 ) ) ( not ( = ?auto_76945 ?auto_76941 ) ) ( not ( = ?auto_76935 ?auto_76937 ) ) ( not ( = ?auto_76936 ?auto_76937 ) ) ( not ( = ?auto_76943 ?auto_76945 ) ) ( not ( = ?auto_76943 ?auto_76941 ) ) ( not ( = ?auto_76935 ?auto_76938 ) ) ( not ( = ?auto_76936 ?auto_76938 ) ) ( not ( = ?auto_76937 ?auto_76938 ) ) ( not ( = ?auto_76944 ?auto_76943 ) ) ( not ( = ?auto_76944 ?auto_76945 ) ) ( not ( = ?auto_76944 ?auto_76941 ) ) ( not ( = ?auto_76935 ?auto_76939 ) ) ( not ( = ?auto_76936 ?auto_76939 ) ) ( not ( = ?auto_76937 ?auto_76939 ) ) ( not ( = ?auto_76938 ?auto_76939 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_76935 ?auto_76936 ?auto_76938 ?auto_76937 ?auto_76934 )
      ( DELIVER-1PKG ?auto_76939 ?auto_76934 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_76986 - OBJ
      ?auto_76987 - OBJ
      ?auto_76988 - OBJ
      ?auto_76989 - OBJ
      ?auto_76990 - OBJ
      ?auto_76985 - LOCATION
    )
    :vars
    (
      ?auto_76993 - LOCATION
      ?auto_76996 - CITY
      ?auto_76992 - LOCATION
      ?auto_76995 - LOCATION
      ?auto_76994 - LOCATION
      ?auto_76991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_76993 ?auto_76996 ) ( IN-CITY ?auto_76985 ?auto_76996 ) ( not ( = ?auto_76985 ?auto_76993 ) ) ( OBJ-AT ?auto_76989 ?auto_76993 ) ( IN-CITY ?auto_76992 ?auto_76996 ) ( not ( = ?auto_76985 ?auto_76992 ) ) ( OBJ-AT ?auto_76990 ?auto_76992 ) ( IN-CITY ?auto_76995 ?auto_76996 ) ( not ( = ?auto_76985 ?auto_76995 ) ) ( OBJ-AT ?auto_76988 ?auto_76995 ) ( IN-CITY ?auto_76994 ?auto_76996 ) ( not ( = ?auto_76985 ?auto_76994 ) ) ( OBJ-AT ?auto_76987 ?auto_76994 ) ( OBJ-AT ?auto_76986 ?auto_76993 ) ( TRUCK-AT ?auto_76991 ?auto_76985 ) ( not ( = ?auto_76986 ?auto_76987 ) ) ( not ( = ?auto_76994 ?auto_76993 ) ) ( not ( = ?auto_76986 ?auto_76988 ) ) ( not ( = ?auto_76987 ?auto_76988 ) ) ( not ( = ?auto_76995 ?auto_76994 ) ) ( not ( = ?auto_76995 ?auto_76993 ) ) ( not ( = ?auto_76986 ?auto_76990 ) ) ( not ( = ?auto_76987 ?auto_76990 ) ) ( not ( = ?auto_76988 ?auto_76990 ) ) ( not ( = ?auto_76992 ?auto_76995 ) ) ( not ( = ?auto_76992 ?auto_76994 ) ) ( not ( = ?auto_76992 ?auto_76993 ) ) ( not ( = ?auto_76986 ?auto_76989 ) ) ( not ( = ?auto_76987 ?auto_76989 ) ) ( not ( = ?auto_76988 ?auto_76989 ) ) ( not ( = ?auto_76990 ?auto_76989 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_76986 ?auto_76987 ?auto_76988 ?auto_76990 ?auto_76989 ?auto_76985 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77037 - OBJ
      ?auto_77038 - OBJ
      ?auto_77039 - OBJ
      ?auto_77040 - OBJ
      ?auto_77041 - OBJ
      ?auto_77036 - LOCATION
    )
    :vars
    (
      ?auto_77046 - LOCATION
      ?auto_77043 - CITY
      ?auto_77042 - LOCATION
      ?auto_77044 - LOCATION
      ?auto_77045 - LOCATION
      ?auto_77047 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77046 ?auto_77043 ) ( IN-CITY ?auto_77036 ?auto_77043 ) ( not ( = ?auto_77036 ?auto_77046 ) ) ( OBJ-AT ?auto_77041 ?auto_77046 ) ( IN-CITY ?auto_77042 ?auto_77043 ) ( not ( = ?auto_77036 ?auto_77042 ) ) ( OBJ-AT ?auto_77039 ?auto_77042 ) ( IN-CITY ?auto_77044 ?auto_77043 ) ( not ( = ?auto_77036 ?auto_77044 ) ) ( OBJ-AT ?auto_77040 ?auto_77044 ) ( IN-CITY ?auto_77045 ?auto_77043 ) ( not ( = ?auto_77036 ?auto_77045 ) ) ( OBJ-AT ?auto_77038 ?auto_77045 ) ( OBJ-AT ?auto_77037 ?auto_77046 ) ( TRUCK-AT ?auto_77047 ?auto_77036 ) ( not ( = ?auto_77037 ?auto_77038 ) ) ( not ( = ?auto_77045 ?auto_77046 ) ) ( not ( = ?auto_77037 ?auto_77040 ) ) ( not ( = ?auto_77038 ?auto_77040 ) ) ( not ( = ?auto_77044 ?auto_77045 ) ) ( not ( = ?auto_77044 ?auto_77046 ) ) ( not ( = ?auto_77037 ?auto_77039 ) ) ( not ( = ?auto_77038 ?auto_77039 ) ) ( not ( = ?auto_77040 ?auto_77039 ) ) ( not ( = ?auto_77042 ?auto_77044 ) ) ( not ( = ?auto_77042 ?auto_77045 ) ) ( not ( = ?auto_77042 ?auto_77046 ) ) ( not ( = ?auto_77037 ?auto_77041 ) ) ( not ( = ?auto_77038 ?auto_77041 ) ) ( not ( = ?auto_77040 ?auto_77041 ) ) ( not ( = ?auto_77039 ?auto_77041 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77037 ?auto_77038 ?auto_77040 ?auto_77041 ?auto_77039 ?auto_77036 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77088 - OBJ
      ?auto_77089 - OBJ
      ?auto_77090 - OBJ
      ?auto_77091 - OBJ
      ?auto_77092 - OBJ
      ?auto_77087 - LOCATION
    )
    :vars
    (
      ?auto_77097 - LOCATION
      ?auto_77094 - CITY
      ?auto_77093 - LOCATION
      ?auto_77095 - LOCATION
      ?auto_77096 - LOCATION
      ?auto_77098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77097 ?auto_77094 ) ( IN-CITY ?auto_77087 ?auto_77094 ) ( not ( = ?auto_77087 ?auto_77097 ) ) ( OBJ-AT ?auto_77091 ?auto_77097 ) ( IN-CITY ?auto_77093 ?auto_77094 ) ( not ( = ?auto_77087 ?auto_77093 ) ) ( OBJ-AT ?auto_77090 ?auto_77093 ) ( IN-CITY ?auto_77095 ?auto_77094 ) ( not ( = ?auto_77087 ?auto_77095 ) ) ( OBJ-AT ?auto_77092 ?auto_77095 ) ( IN-CITY ?auto_77096 ?auto_77094 ) ( not ( = ?auto_77087 ?auto_77096 ) ) ( OBJ-AT ?auto_77089 ?auto_77096 ) ( OBJ-AT ?auto_77088 ?auto_77097 ) ( TRUCK-AT ?auto_77098 ?auto_77087 ) ( not ( = ?auto_77088 ?auto_77089 ) ) ( not ( = ?auto_77096 ?auto_77097 ) ) ( not ( = ?auto_77088 ?auto_77092 ) ) ( not ( = ?auto_77089 ?auto_77092 ) ) ( not ( = ?auto_77095 ?auto_77096 ) ) ( not ( = ?auto_77095 ?auto_77097 ) ) ( not ( = ?auto_77088 ?auto_77090 ) ) ( not ( = ?auto_77089 ?auto_77090 ) ) ( not ( = ?auto_77092 ?auto_77090 ) ) ( not ( = ?auto_77093 ?auto_77095 ) ) ( not ( = ?auto_77093 ?auto_77096 ) ) ( not ( = ?auto_77093 ?auto_77097 ) ) ( not ( = ?auto_77088 ?auto_77091 ) ) ( not ( = ?auto_77089 ?auto_77091 ) ) ( not ( = ?auto_77092 ?auto_77091 ) ) ( not ( = ?auto_77090 ?auto_77091 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77088 ?auto_77089 ?auto_77092 ?auto_77091 ?auto_77090 ?auto_77087 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77301 - OBJ
      ?auto_77302 - OBJ
      ?auto_77303 - OBJ
      ?auto_77304 - OBJ
      ?auto_77305 - OBJ
      ?auto_77300 - LOCATION
    )
    :vars
    (
      ?auto_77310 - LOCATION
      ?auto_77307 - CITY
      ?auto_77306 - LOCATION
      ?auto_77308 - LOCATION
      ?auto_77309 - LOCATION
      ?auto_77311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77310 ?auto_77307 ) ( IN-CITY ?auto_77300 ?auto_77307 ) ( not ( = ?auto_77300 ?auto_77310 ) ) ( OBJ-AT ?auto_77303 ?auto_77310 ) ( IN-CITY ?auto_77306 ?auto_77307 ) ( not ( = ?auto_77300 ?auto_77306 ) ) ( OBJ-AT ?auto_77305 ?auto_77306 ) ( IN-CITY ?auto_77308 ?auto_77307 ) ( not ( = ?auto_77300 ?auto_77308 ) ) ( OBJ-AT ?auto_77304 ?auto_77308 ) ( IN-CITY ?auto_77309 ?auto_77307 ) ( not ( = ?auto_77300 ?auto_77309 ) ) ( OBJ-AT ?auto_77302 ?auto_77309 ) ( OBJ-AT ?auto_77301 ?auto_77310 ) ( TRUCK-AT ?auto_77311 ?auto_77300 ) ( not ( = ?auto_77301 ?auto_77302 ) ) ( not ( = ?auto_77309 ?auto_77310 ) ) ( not ( = ?auto_77301 ?auto_77304 ) ) ( not ( = ?auto_77302 ?auto_77304 ) ) ( not ( = ?auto_77308 ?auto_77309 ) ) ( not ( = ?auto_77308 ?auto_77310 ) ) ( not ( = ?auto_77301 ?auto_77305 ) ) ( not ( = ?auto_77302 ?auto_77305 ) ) ( not ( = ?auto_77304 ?auto_77305 ) ) ( not ( = ?auto_77306 ?auto_77308 ) ) ( not ( = ?auto_77306 ?auto_77309 ) ) ( not ( = ?auto_77306 ?auto_77310 ) ) ( not ( = ?auto_77301 ?auto_77303 ) ) ( not ( = ?auto_77302 ?auto_77303 ) ) ( not ( = ?auto_77304 ?auto_77303 ) ) ( not ( = ?auto_77305 ?auto_77303 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77301 ?auto_77302 ?auto_77304 ?auto_77303 ?auto_77305 ?auto_77300 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77352 - OBJ
      ?auto_77353 - OBJ
      ?auto_77354 - OBJ
      ?auto_77355 - OBJ
      ?auto_77356 - OBJ
      ?auto_77351 - LOCATION
    )
    :vars
    (
      ?auto_77361 - LOCATION
      ?auto_77358 - CITY
      ?auto_77357 - LOCATION
      ?auto_77359 - LOCATION
      ?auto_77360 - LOCATION
      ?auto_77362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77361 ?auto_77358 ) ( IN-CITY ?auto_77351 ?auto_77358 ) ( not ( = ?auto_77351 ?auto_77361 ) ) ( OBJ-AT ?auto_77354 ?auto_77361 ) ( IN-CITY ?auto_77357 ?auto_77358 ) ( not ( = ?auto_77351 ?auto_77357 ) ) ( OBJ-AT ?auto_77355 ?auto_77357 ) ( IN-CITY ?auto_77359 ?auto_77358 ) ( not ( = ?auto_77351 ?auto_77359 ) ) ( OBJ-AT ?auto_77356 ?auto_77359 ) ( IN-CITY ?auto_77360 ?auto_77358 ) ( not ( = ?auto_77351 ?auto_77360 ) ) ( OBJ-AT ?auto_77353 ?auto_77360 ) ( OBJ-AT ?auto_77352 ?auto_77361 ) ( TRUCK-AT ?auto_77362 ?auto_77351 ) ( not ( = ?auto_77352 ?auto_77353 ) ) ( not ( = ?auto_77360 ?auto_77361 ) ) ( not ( = ?auto_77352 ?auto_77356 ) ) ( not ( = ?auto_77353 ?auto_77356 ) ) ( not ( = ?auto_77359 ?auto_77360 ) ) ( not ( = ?auto_77359 ?auto_77361 ) ) ( not ( = ?auto_77352 ?auto_77355 ) ) ( not ( = ?auto_77353 ?auto_77355 ) ) ( not ( = ?auto_77356 ?auto_77355 ) ) ( not ( = ?auto_77357 ?auto_77359 ) ) ( not ( = ?auto_77357 ?auto_77360 ) ) ( not ( = ?auto_77357 ?auto_77361 ) ) ( not ( = ?auto_77352 ?auto_77354 ) ) ( not ( = ?auto_77353 ?auto_77354 ) ) ( not ( = ?auto_77356 ?auto_77354 ) ) ( not ( = ?auto_77355 ?auto_77354 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77352 ?auto_77353 ?auto_77356 ?auto_77354 ?auto_77355 ?auto_77351 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77619 - OBJ
      ?auto_77620 - OBJ
      ?auto_77621 - OBJ
      ?auto_77622 - OBJ
      ?auto_77623 - OBJ
      ?auto_77618 - LOCATION
    )
    :vars
    (
      ?auto_77628 - LOCATION
      ?auto_77625 - CITY
      ?auto_77624 - LOCATION
      ?auto_77626 - LOCATION
      ?auto_77627 - LOCATION
      ?auto_77629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77628 ?auto_77625 ) ( IN-CITY ?auto_77618 ?auto_77625 ) ( not ( = ?auto_77618 ?auto_77628 ) ) ( OBJ-AT ?auto_77623 ?auto_77628 ) ( IN-CITY ?auto_77624 ?auto_77625 ) ( not ( = ?auto_77618 ?auto_77624 ) ) ( OBJ-AT ?auto_77622 ?auto_77624 ) ( IN-CITY ?auto_77626 ?auto_77625 ) ( not ( = ?auto_77618 ?auto_77626 ) ) ( OBJ-AT ?auto_77620 ?auto_77626 ) ( IN-CITY ?auto_77627 ?auto_77625 ) ( not ( = ?auto_77618 ?auto_77627 ) ) ( OBJ-AT ?auto_77621 ?auto_77627 ) ( OBJ-AT ?auto_77619 ?auto_77628 ) ( TRUCK-AT ?auto_77629 ?auto_77618 ) ( not ( = ?auto_77619 ?auto_77621 ) ) ( not ( = ?auto_77627 ?auto_77628 ) ) ( not ( = ?auto_77619 ?auto_77620 ) ) ( not ( = ?auto_77621 ?auto_77620 ) ) ( not ( = ?auto_77626 ?auto_77627 ) ) ( not ( = ?auto_77626 ?auto_77628 ) ) ( not ( = ?auto_77619 ?auto_77622 ) ) ( not ( = ?auto_77621 ?auto_77622 ) ) ( not ( = ?auto_77620 ?auto_77622 ) ) ( not ( = ?auto_77624 ?auto_77626 ) ) ( not ( = ?auto_77624 ?auto_77627 ) ) ( not ( = ?auto_77624 ?auto_77628 ) ) ( not ( = ?auto_77619 ?auto_77623 ) ) ( not ( = ?auto_77621 ?auto_77623 ) ) ( not ( = ?auto_77620 ?auto_77623 ) ) ( not ( = ?auto_77622 ?auto_77623 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77619 ?auto_77621 ?auto_77620 ?auto_77623 ?auto_77622 ?auto_77618 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77670 - OBJ
      ?auto_77671 - OBJ
      ?auto_77672 - OBJ
      ?auto_77673 - OBJ
      ?auto_77674 - OBJ
      ?auto_77669 - LOCATION
    )
    :vars
    (
      ?auto_77679 - LOCATION
      ?auto_77676 - CITY
      ?auto_77675 - LOCATION
      ?auto_77677 - LOCATION
      ?auto_77678 - LOCATION
      ?auto_77680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77679 ?auto_77676 ) ( IN-CITY ?auto_77669 ?auto_77676 ) ( not ( = ?auto_77669 ?auto_77679 ) ) ( OBJ-AT ?auto_77673 ?auto_77679 ) ( IN-CITY ?auto_77675 ?auto_77676 ) ( not ( = ?auto_77669 ?auto_77675 ) ) ( OBJ-AT ?auto_77674 ?auto_77675 ) ( IN-CITY ?auto_77677 ?auto_77676 ) ( not ( = ?auto_77669 ?auto_77677 ) ) ( OBJ-AT ?auto_77671 ?auto_77677 ) ( IN-CITY ?auto_77678 ?auto_77676 ) ( not ( = ?auto_77669 ?auto_77678 ) ) ( OBJ-AT ?auto_77672 ?auto_77678 ) ( OBJ-AT ?auto_77670 ?auto_77679 ) ( TRUCK-AT ?auto_77680 ?auto_77669 ) ( not ( = ?auto_77670 ?auto_77672 ) ) ( not ( = ?auto_77678 ?auto_77679 ) ) ( not ( = ?auto_77670 ?auto_77671 ) ) ( not ( = ?auto_77672 ?auto_77671 ) ) ( not ( = ?auto_77677 ?auto_77678 ) ) ( not ( = ?auto_77677 ?auto_77679 ) ) ( not ( = ?auto_77670 ?auto_77674 ) ) ( not ( = ?auto_77672 ?auto_77674 ) ) ( not ( = ?auto_77671 ?auto_77674 ) ) ( not ( = ?auto_77675 ?auto_77677 ) ) ( not ( = ?auto_77675 ?auto_77678 ) ) ( not ( = ?auto_77675 ?auto_77679 ) ) ( not ( = ?auto_77670 ?auto_77673 ) ) ( not ( = ?auto_77672 ?auto_77673 ) ) ( not ( = ?auto_77671 ?auto_77673 ) ) ( not ( = ?auto_77674 ?auto_77673 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77670 ?auto_77672 ?auto_77671 ?auto_77673 ?auto_77674 ?auto_77669 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77830 - OBJ
      ?auto_77831 - OBJ
      ?auto_77832 - OBJ
      ?auto_77833 - OBJ
      ?auto_77834 - OBJ
      ?auto_77829 - LOCATION
    )
    :vars
    (
      ?auto_77839 - LOCATION
      ?auto_77836 - CITY
      ?auto_77835 - LOCATION
      ?auto_77837 - LOCATION
      ?auto_77838 - LOCATION
      ?auto_77840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77839 ?auto_77836 ) ( IN-CITY ?auto_77829 ?auto_77836 ) ( not ( = ?auto_77829 ?auto_77839 ) ) ( OBJ-AT ?auto_77834 ?auto_77839 ) ( IN-CITY ?auto_77835 ?auto_77836 ) ( not ( = ?auto_77829 ?auto_77835 ) ) ( OBJ-AT ?auto_77832 ?auto_77835 ) ( IN-CITY ?auto_77837 ?auto_77836 ) ( not ( = ?auto_77829 ?auto_77837 ) ) ( OBJ-AT ?auto_77831 ?auto_77837 ) ( IN-CITY ?auto_77838 ?auto_77836 ) ( not ( = ?auto_77829 ?auto_77838 ) ) ( OBJ-AT ?auto_77833 ?auto_77838 ) ( OBJ-AT ?auto_77830 ?auto_77839 ) ( TRUCK-AT ?auto_77840 ?auto_77829 ) ( not ( = ?auto_77830 ?auto_77833 ) ) ( not ( = ?auto_77838 ?auto_77839 ) ) ( not ( = ?auto_77830 ?auto_77831 ) ) ( not ( = ?auto_77833 ?auto_77831 ) ) ( not ( = ?auto_77837 ?auto_77838 ) ) ( not ( = ?auto_77837 ?auto_77839 ) ) ( not ( = ?auto_77830 ?auto_77832 ) ) ( not ( = ?auto_77833 ?auto_77832 ) ) ( not ( = ?auto_77831 ?auto_77832 ) ) ( not ( = ?auto_77835 ?auto_77837 ) ) ( not ( = ?auto_77835 ?auto_77838 ) ) ( not ( = ?auto_77835 ?auto_77839 ) ) ( not ( = ?auto_77830 ?auto_77834 ) ) ( not ( = ?auto_77833 ?auto_77834 ) ) ( not ( = ?auto_77831 ?auto_77834 ) ) ( not ( = ?auto_77832 ?auto_77834 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77830 ?auto_77833 ?auto_77831 ?auto_77834 ?auto_77832 ?auto_77829 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_77881 - OBJ
      ?auto_77882 - OBJ
      ?auto_77883 - OBJ
      ?auto_77884 - OBJ
      ?auto_77885 - OBJ
      ?auto_77880 - LOCATION
    )
    :vars
    (
      ?auto_77890 - LOCATION
      ?auto_77887 - CITY
      ?auto_77886 - LOCATION
      ?auto_77888 - LOCATION
      ?auto_77889 - LOCATION
      ?auto_77891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_77890 ?auto_77887 ) ( IN-CITY ?auto_77880 ?auto_77887 ) ( not ( = ?auto_77880 ?auto_77890 ) ) ( OBJ-AT ?auto_77884 ?auto_77890 ) ( IN-CITY ?auto_77886 ?auto_77887 ) ( not ( = ?auto_77880 ?auto_77886 ) ) ( OBJ-AT ?auto_77883 ?auto_77886 ) ( IN-CITY ?auto_77888 ?auto_77887 ) ( not ( = ?auto_77880 ?auto_77888 ) ) ( OBJ-AT ?auto_77882 ?auto_77888 ) ( IN-CITY ?auto_77889 ?auto_77887 ) ( not ( = ?auto_77880 ?auto_77889 ) ) ( OBJ-AT ?auto_77885 ?auto_77889 ) ( OBJ-AT ?auto_77881 ?auto_77890 ) ( TRUCK-AT ?auto_77891 ?auto_77880 ) ( not ( = ?auto_77881 ?auto_77885 ) ) ( not ( = ?auto_77889 ?auto_77890 ) ) ( not ( = ?auto_77881 ?auto_77882 ) ) ( not ( = ?auto_77885 ?auto_77882 ) ) ( not ( = ?auto_77888 ?auto_77889 ) ) ( not ( = ?auto_77888 ?auto_77890 ) ) ( not ( = ?auto_77881 ?auto_77883 ) ) ( not ( = ?auto_77885 ?auto_77883 ) ) ( not ( = ?auto_77882 ?auto_77883 ) ) ( not ( = ?auto_77886 ?auto_77888 ) ) ( not ( = ?auto_77886 ?auto_77889 ) ) ( not ( = ?auto_77886 ?auto_77890 ) ) ( not ( = ?auto_77881 ?auto_77884 ) ) ( not ( = ?auto_77885 ?auto_77884 ) ) ( not ( = ?auto_77882 ?auto_77884 ) ) ( not ( = ?auto_77883 ?auto_77884 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_77881 ?auto_77885 ?auto_77882 ?auto_77884 ?auto_77883 ?auto_77880 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78039 - OBJ
      ?auto_78040 - OBJ
      ?auto_78041 - OBJ
      ?auto_78042 - OBJ
      ?auto_78043 - OBJ
      ?auto_78038 - LOCATION
    )
    :vars
    (
      ?auto_78048 - LOCATION
      ?auto_78045 - CITY
      ?auto_78044 - LOCATION
      ?auto_78046 - LOCATION
      ?auto_78047 - LOCATION
      ?auto_78049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78048 ?auto_78045 ) ( IN-CITY ?auto_78038 ?auto_78045 ) ( not ( = ?auto_78038 ?auto_78048 ) ) ( OBJ-AT ?auto_78041 ?auto_78048 ) ( IN-CITY ?auto_78044 ?auto_78045 ) ( not ( = ?auto_78038 ?auto_78044 ) ) ( OBJ-AT ?auto_78043 ?auto_78044 ) ( IN-CITY ?auto_78046 ?auto_78045 ) ( not ( = ?auto_78038 ?auto_78046 ) ) ( OBJ-AT ?auto_78040 ?auto_78046 ) ( IN-CITY ?auto_78047 ?auto_78045 ) ( not ( = ?auto_78038 ?auto_78047 ) ) ( OBJ-AT ?auto_78042 ?auto_78047 ) ( OBJ-AT ?auto_78039 ?auto_78048 ) ( TRUCK-AT ?auto_78049 ?auto_78038 ) ( not ( = ?auto_78039 ?auto_78042 ) ) ( not ( = ?auto_78047 ?auto_78048 ) ) ( not ( = ?auto_78039 ?auto_78040 ) ) ( not ( = ?auto_78042 ?auto_78040 ) ) ( not ( = ?auto_78046 ?auto_78047 ) ) ( not ( = ?auto_78046 ?auto_78048 ) ) ( not ( = ?auto_78039 ?auto_78043 ) ) ( not ( = ?auto_78042 ?auto_78043 ) ) ( not ( = ?auto_78040 ?auto_78043 ) ) ( not ( = ?auto_78044 ?auto_78046 ) ) ( not ( = ?auto_78044 ?auto_78047 ) ) ( not ( = ?auto_78044 ?auto_78048 ) ) ( not ( = ?auto_78039 ?auto_78041 ) ) ( not ( = ?auto_78042 ?auto_78041 ) ) ( not ( = ?auto_78040 ?auto_78041 ) ) ( not ( = ?auto_78043 ?auto_78041 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78039 ?auto_78042 ?auto_78040 ?auto_78041 ?auto_78043 ?auto_78038 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78145 - OBJ
      ?auto_78146 - OBJ
      ?auto_78147 - OBJ
      ?auto_78148 - OBJ
      ?auto_78149 - OBJ
      ?auto_78144 - LOCATION
    )
    :vars
    (
      ?auto_78154 - LOCATION
      ?auto_78151 - CITY
      ?auto_78150 - LOCATION
      ?auto_78152 - LOCATION
      ?auto_78153 - LOCATION
      ?auto_78155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78154 ?auto_78151 ) ( IN-CITY ?auto_78144 ?auto_78151 ) ( not ( = ?auto_78144 ?auto_78154 ) ) ( OBJ-AT ?auto_78147 ?auto_78154 ) ( IN-CITY ?auto_78150 ?auto_78151 ) ( not ( = ?auto_78144 ?auto_78150 ) ) ( OBJ-AT ?auto_78148 ?auto_78150 ) ( IN-CITY ?auto_78152 ?auto_78151 ) ( not ( = ?auto_78144 ?auto_78152 ) ) ( OBJ-AT ?auto_78146 ?auto_78152 ) ( IN-CITY ?auto_78153 ?auto_78151 ) ( not ( = ?auto_78144 ?auto_78153 ) ) ( OBJ-AT ?auto_78149 ?auto_78153 ) ( OBJ-AT ?auto_78145 ?auto_78154 ) ( TRUCK-AT ?auto_78155 ?auto_78144 ) ( not ( = ?auto_78145 ?auto_78149 ) ) ( not ( = ?auto_78153 ?auto_78154 ) ) ( not ( = ?auto_78145 ?auto_78146 ) ) ( not ( = ?auto_78149 ?auto_78146 ) ) ( not ( = ?auto_78152 ?auto_78153 ) ) ( not ( = ?auto_78152 ?auto_78154 ) ) ( not ( = ?auto_78145 ?auto_78148 ) ) ( not ( = ?auto_78149 ?auto_78148 ) ) ( not ( = ?auto_78146 ?auto_78148 ) ) ( not ( = ?auto_78150 ?auto_78152 ) ) ( not ( = ?auto_78150 ?auto_78153 ) ) ( not ( = ?auto_78150 ?auto_78154 ) ) ( not ( = ?auto_78145 ?auto_78147 ) ) ( not ( = ?auto_78149 ?auto_78147 ) ) ( not ( = ?auto_78146 ?auto_78147 ) ) ( not ( = ?auto_78148 ?auto_78147 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78145 ?auto_78149 ?auto_78146 ?auto_78147 ?auto_78148 ?auto_78144 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78412 - OBJ
      ?auto_78413 - OBJ
      ?auto_78414 - OBJ
      ?auto_78415 - OBJ
      ?auto_78416 - OBJ
      ?auto_78411 - LOCATION
    )
    :vars
    (
      ?auto_78421 - LOCATION
      ?auto_78418 - CITY
      ?auto_78417 - LOCATION
      ?auto_78419 - LOCATION
      ?auto_78420 - LOCATION
      ?auto_78422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78421 ?auto_78418 ) ( IN-CITY ?auto_78411 ?auto_78418 ) ( not ( = ?auto_78411 ?auto_78421 ) ) ( OBJ-AT ?auto_78416 ?auto_78421 ) ( IN-CITY ?auto_78417 ?auto_78418 ) ( not ( = ?auto_78411 ?auto_78417 ) ) ( OBJ-AT ?auto_78413 ?auto_78417 ) ( IN-CITY ?auto_78419 ?auto_78418 ) ( not ( = ?auto_78411 ?auto_78419 ) ) ( OBJ-AT ?auto_78415 ?auto_78419 ) ( IN-CITY ?auto_78420 ?auto_78418 ) ( not ( = ?auto_78411 ?auto_78420 ) ) ( OBJ-AT ?auto_78414 ?auto_78420 ) ( OBJ-AT ?auto_78412 ?auto_78421 ) ( TRUCK-AT ?auto_78422 ?auto_78411 ) ( not ( = ?auto_78412 ?auto_78414 ) ) ( not ( = ?auto_78420 ?auto_78421 ) ) ( not ( = ?auto_78412 ?auto_78415 ) ) ( not ( = ?auto_78414 ?auto_78415 ) ) ( not ( = ?auto_78419 ?auto_78420 ) ) ( not ( = ?auto_78419 ?auto_78421 ) ) ( not ( = ?auto_78412 ?auto_78413 ) ) ( not ( = ?auto_78414 ?auto_78413 ) ) ( not ( = ?auto_78415 ?auto_78413 ) ) ( not ( = ?auto_78417 ?auto_78419 ) ) ( not ( = ?auto_78417 ?auto_78420 ) ) ( not ( = ?auto_78417 ?auto_78421 ) ) ( not ( = ?auto_78412 ?auto_78416 ) ) ( not ( = ?auto_78414 ?auto_78416 ) ) ( not ( = ?auto_78415 ?auto_78416 ) ) ( not ( = ?auto_78413 ?auto_78416 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78412 ?auto_78414 ?auto_78415 ?auto_78416 ?auto_78413 ?auto_78411 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78463 - OBJ
      ?auto_78464 - OBJ
      ?auto_78465 - OBJ
      ?auto_78466 - OBJ
      ?auto_78467 - OBJ
      ?auto_78462 - LOCATION
    )
    :vars
    (
      ?auto_78472 - LOCATION
      ?auto_78469 - CITY
      ?auto_78468 - LOCATION
      ?auto_78470 - LOCATION
      ?auto_78471 - LOCATION
      ?auto_78473 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78472 ?auto_78469 ) ( IN-CITY ?auto_78462 ?auto_78469 ) ( not ( = ?auto_78462 ?auto_78472 ) ) ( OBJ-AT ?auto_78466 ?auto_78472 ) ( IN-CITY ?auto_78468 ?auto_78469 ) ( not ( = ?auto_78462 ?auto_78468 ) ) ( OBJ-AT ?auto_78464 ?auto_78468 ) ( IN-CITY ?auto_78470 ?auto_78469 ) ( not ( = ?auto_78462 ?auto_78470 ) ) ( OBJ-AT ?auto_78467 ?auto_78470 ) ( IN-CITY ?auto_78471 ?auto_78469 ) ( not ( = ?auto_78462 ?auto_78471 ) ) ( OBJ-AT ?auto_78465 ?auto_78471 ) ( OBJ-AT ?auto_78463 ?auto_78472 ) ( TRUCK-AT ?auto_78473 ?auto_78462 ) ( not ( = ?auto_78463 ?auto_78465 ) ) ( not ( = ?auto_78471 ?auto_78472 ) ) ( not ( = ?auto_78463 ?auto_78467 ) ) ( not ( = ?auto_78465 ?auto_78467 ) ) ( not ( = ?auto_78470 ?auto_78471 ) ) ( not ( = ?auto_78470 ?auto_78472 ) ) ( not ( = ?auto_78463 ?auto_78464 ) ) ( not ( = ?auto_78465 ?auto_78464 ) ) ( not ( = ?auto_78467 ?auto_78464 ) ) ( not ( = ?auto_78468 ?auto_78470 ) ) ( not ( = ?auto_78468 ?auto_78471 ) ) ( not ( = ?auto_78468 ?auto_78472 ) ) ( not ( = ?auto_78463 ?auto_78466 ) ) ( not ( = ?auto_78465 ?auto_78466 ) ) ( not ( = ?auto_78467 ?auto_78466 ) ) ( not ( = ?auto_78464 ?auto_78466 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78463 ?auto_78465 ?auto_78467 ?auto_78466 ?auto_78464 ?auto_78462 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78514 - OBJ
      ?auto_78515 - OBJ
      ?auto_78516 - OBJ
      ?auto_78517 - OBJ
      ?auto_78518 - OBJ
      ?auto_78513 - LOCATION
    )
    :vars
    (
      ?auto_78523 - LOCATION
      ?auto_78520 - CITY
      ?auto_78519 - LOCATION
      ?auto_78521 - LOCATION
      ?auto_78522 - LOCATION
      ?auto_78524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78523 ?auto_78520 ) ( IN-CITY ?auto_78513 ?auto_78520 ) ( not ( = ?auto_78513 ?auto_78523 ) ) ( OBJ-AT ?auto_78518 ?auto_78523 ) ( IN-CITY ?auto_78519 ?auto_78520 ) ( not ( = ?auto_78513 ?auto_78519 ) ) ( OBJ-AT ?auto_78515 ?auto_78519 ) ( IN-CITY ?auto_78521 ?auto_78520 ) ( not ( = ?auto_78513 ?auto_78521 ) ) ( OBJ-AT ?auto_78516 ?auto_78521 ) ( IN-CITY ?auto_78522 ?auto_78520 ) ( not ( = ?auto_78513 ?auto_78522 ) ) ( OBJ-AT ?auto_78517 ?auto_78522 ) ( OBJ-AT ?auto_78514 ?auto_78523 ) ( TRUCK-AT ?auto_78524 ?auto_78513 ) ( not ( = ?auto_78514 ?auto_78517 ) ) ( not ( = ?auto_78522 ?auto_78523 ) ) ( not ( = ?auto_78514 ?auto_78516 ) ) ( not ( = ?auto_78517 ?auto_78516 ) ) ( not ( = ?auto_78521 ?auto_78522 ) ) ( not ( = ?auto_78521 ?auto_78523 ) ) ( not ( = ?auto_78514 ?auto_78515 ) ) ( not ( = ?auto_78517 ?auto_78515 ) ) ( not ( = ?auto_78516 ?auto_78515 ) ) ( not ( = ?auto_78519 ?auto_78521 ) ) ( not ( = ?auto_78519 ?auto_78522 ) ) ( not ( = ?auto_78519 ?auto_78523 ) ) ( not ( = ?auto_78514 ?auto_78518 ) ) ( not ( = ?auto_78517 ?auto_78518 ) ) ( not ( = ?auto_78516 ?auto_78518 ) ) ( not ( = ?auto_78515 ?auto_78518 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78514 ?auto_78517 ?auto_78516 ?auto_78518 ?auto_78515 ?auto_78513 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78565 - OBJ
      ?auto_78566 - OBJ
      ?auto_78567 - OBJ
      ?auto_78568 - OBJ
      ?auto_78569 - OBJ
      ?auto_78564 - LOCATION
    )
    :vars
    (
      ?auto_78574 - LOCATION
      ?auto_78571 - CITY
      ?auto_78570 - LOCATION
      ?auto_78572 - LOCATION
      ?auto_78573 - LOCATION
      ?auto_78575 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78574 ?auto_78571 ) ( IN-CITY ?auto_78564 ?auto_78571 ) ( not ( = ?auto_78564 ?auto_78574 ) ) ( OBJ-AT ?auto_78568 ?auto_78574 ) ( IN-CITY ?auto_78570 ?auto_78571 ) ( not ( = ?auto_78564 ?auto_78570 ) ) ( OBJ-AT ?auto_78566 ?auto_78570 ) ( IN-CITY ?auto_78572 ?auto_78571 ) ( not ( = ?auto_78564 ?auto_78572 ) ) ( OBJ-AT ?auto_78567 ?auto_78572 ) ( IN-CITY ?auto_78573 ?auto_78571 ) ( not ( = ?auto_78564 ?auto_78573 ) ) ( OBJ-AT ?auto_78569 ?auto_78573 ) ( OBJ-AT ?auto_78565 ?auto_78574 ) ( TRUCK-AT ?auto_78575 ?auto_78564 ) ( not ( = ?auto_78565 ?auto_78569 ) ) ( not ( = ?auto_78573 ?auto_78574 ) ) ( not ( = ?auto_78565 ?auto_78567 ) ) ( not ( = ?auto_78569 ?auto_78567 ) ) ( not ( = ?auto_78572 ?auto_78573 ) ) ( not ( = ?auto_78572 ?auto_78574 ) ) ( not ( = ?auto_78565 ?auto_78566 ) ) ( not ( = ?auto_78569 ?auto_78566 ) ) ( not ( = ?auto_78567 ?auto_78566 ) ) ( not ( = ?auto_78570 ?auto_78572 ) ) ( not ( = ?auto_78570 ?auto_78573 ) ) ( not ( = ?auto_78570 ?auto_78574 ) ) ( not ( = ?auto_78565 ?auto_78568 ) ) ( not ( = ?auto_78569 ?auto_78568 ) ) ( not ( = ?auto_78567 ?auto_78568 ) ) ( not ( = ?auto_78566 ?auto_78568 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78565 ?auto_78569 ?auto_78567 ?auto_78568 ?auto_78566 ?auto_78564 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78832 - OBJ
      ?auto_78833 - OBJ
      ?auto_78834 - OBJ
      ?auto_78835 - OBJ
      ?auto_78836 - OBJ
      ?auto_78831 - LOCATION
    )
    :vars
    (
      ?auto_78841 - LOCATION
      ?auto_78838 - CITY
      ?auto_78837 - LOCATION
      ?auto_78839 - LOCATION
      ?auto_78840 - LOCATION
      ?auto_78842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78841 ?auto_78838 ) ( IN-CITY ?auto_78831 ?auto_78838 ) ( not ( = ?auto_78831 ?auto_78841 ) ) ( OBJ-AT ?auto_78834 ?auto_78841 ) ( IN-CITY ?auto_78837 ?auto_78838 ) ( not ( = ?auto_78831 ?auto_78837 ) ) ( OBJ-AT ?auto_78833 ?auto_78837 ) ( IN-CITY ?auto_78839 ?auto_78838 ) ( not ( = ?auto_78831 ?auto_78839 ) ) ( OBJ-AT ?auto_78836 ?auto_78839 ) ( IN-CITY ?auto_78840 ?auto_78838 ) ( not ( = ?auto_78831 ?auto_78840 ) ) ( OBJ-AT ?auto_78835 ?auto_78840 ) ( OBJ-AT ?auto_78832 ?auto_78841 ) ( TRUCK-AT ?auto_78842 ?auto_78831 ) ( not ( = ?auto_78832 ?auto_78835 ) ) ( not ( = ?auto_78840 ?auto_78841 ) ) ( not ( = ?auto_78832 ?auto_78836 ) ) ( not ( = ?auto_78835 ?auto_78836 ) ) ( not ( = ?auto_78839 ?auto_78840 ) ) ( not ( = ?auto_78839 ?auto_78841 ) ) ( not ( = ?auto_78832 ?auto_78833 ) ) ( not ( = ?auto_78835 ?auto_78833 ) ) ( not ( = ?auto_78836 ?auto_78833 ) ) ( not ( = ?auto_78837 ?auto_78839 ) ) ( not ( = ?auto_78837 ?auto_78840 ) ) ( not ( = ?auto_78837 ?auto_78841 ) ) ( not ( = ?auto_78832 ?auto_78834 ) ) ( not ( = ?auto_78835 ?auto_78834 ) ) ( not ( = ?auto_78836 ?auto_78834 ) ) ( not ( = ?auto_78833 ?auto_78834 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78832 ?auto_78835 ?auto_78836 ?auto_78834 ?auto_78833 ?auto_78831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_78883 - OBJ
      ?auto_78884 - OBJ
      ?auto_78885 - OBJ
      ?auto_78886 - OBJ
      ?auto_78887 - OBJ
      ?auto_78882 - LOCATION
    )
    :vars
    (
      ?auto_78892 - LOCATION
      ?auto_78889 - CITY
      ?auto_78888 - LOCATION
      ?auto_78890 - LOCATION
      ?auto_78891 - LOCATION
      ?auto_78893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_78892 ?auto_78889 ) ( IN-CITY ?auto_78882 ?auto_78889 ) ( not ( = ?auto_78882 ?auto_78892 ) ) ( OBJ-AT ?auto_78885 ?auto_78892 ) ( IN-CITY ?auto_78888 ?auto_78889 ) ( not ( = ?auto_78882 ?auto_78888 ) ) ( OBJ-AT ?auto_78884 ?auto_78888 ) ( IN-CITY ?auto_78890 ?auto_78889 ) ( not ( = ?auto_78882 ?auto_78890 ) ) ( OBJ-AT ?auto_78886 ?auto_78890 ) ( IN-CITY ?auto_78891 ?auto_78889 ) ( not ( = ?auto_78882 ?auto_78891 ) ) ( OBJ-AT ?auto_78887 ?auto_78891 ) ( OBJ-AT ?auto_78883 ?auto_78892 ) ( TRUCK-AT ?auto_78893 ?auto_78882 ) ( not ( = ?auto_78883 ?auto_78887 ) ) ( not ( = ?auto_78891 ?auto_78892 ) ) ( not ( = ?auto_78883 ?auto_78886 ) ) ( not ( = ?auto_78887 ?auto_78886 ) ) ( not ( = ?auto_78890 ?auto_78891 ) ) ( not ( = ?auto_78890 ?auto_78892 ) ) ( not ( = ?auto_78883 ?auto_78884 ) ) ( not ( = ?auto_78887 ?auto_78884 ) ) ( not ( = ?auto_78886 ?auto_78884 ) ) ( not ( = ?auto_78888 ?auto_78890 ) ) ( not ( = ?auto_78888 ?auto_78891 ) ) ( not ( = ?auto_78888 ?auto_78892 ) ) ( not ( = ?auto_78883 ?auto_78885 ) ) ( not ( = ?auto_78887 ?auto_78885 ) ) ( not ( = ?auto_78886 ?auto_78885 ) ) ( not ( = ?auto_78884 ?auto_78885 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_78883 ?auto_78887 ?auto_78886 ?auto_78885 ?auto_78884 ?auto_78882 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79593 - OBJ
      ?auto_79594 - OBJ
      ?auto_79595 - OBJ
      ?auto_79596 - OBJ
      ?auto_79597 - OBJ
      ?auto_79592 - LOCATION
    )
    :vars
    (
      ?auto_79602 - LOCATION
      ?auto_79599 - CITY
      ?auto_79598 - LOCATION
      ?auto_79600 - LOCATION
      ?auto_79601 - LOCATION
      ?auto_79603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79602 ?auto_79599 ) ( IN-CITY ?auto_79592 ?auto_79599 ) ( not ( = ?auto_79592 ?auto_79602 ) ) ( OBJ-AT ?auto_79594 ?auto_79602 ) ( IN-CITY ?auto_79598 ?auto_79599 ) ( not ( = ?auto_79592 ?auto_79598 ) ) ( OBJ-AT ?auto_79597 ?auto_79598 ) ( IN-CITY ?auto_79600 ?auto_79599 ) ( not ( = ?auto_79592 ?auto_79600 ) ) ( OBJ-AT ?auto_79596 ?auto_79600 ) ( IN-CITY ?auto_79601 ?auto_79599 ) ( not ( = ?auto_79592 ?auto_79601 ) ) ( OBJ-AT ?auto_79595 ?auto_79601 ) ( OBJ-AT ?auto_79593 ?auto_79602 ) ( TRUCK-AT ?auto_79603 ?auto_79592 ) ( not ( = ?auto_79593 ?auto_79595 ) ) ( not ( = ?auto_79601 ?auto_79602 ) ) ( not ( = ?auto_79593 ?auto_79596 ) ) ( not ( = ?auto_79595 ?auto_79596 ) ) ( not ( = ?auto_79600 ?auto_79601 ) ) ( not ( = ?auto_79600 ?auto_79602 ) ) ( not ( = ?auto_79593 ?auto_79597 ) ) ( not ( = ?auto_79595 ?auto_79597 ) ) ( not ( = ?auto_79596 ?auto_79597 ) ) ( not ( = ?auto_79598 ?auto_79600 ) ) ( not ( = ?auto_79598 ?auto_79601 ) ) ( not ( = ?auto_79598 ?auto_79602 ) ) ( not ( = ?auto_79593 ?auto_79594 ) ) ( not ( = ?auto_79595 ?auto_79594 ) ) ( not ( = ?auto_79596 ?auto_79594 ) ) ( not ( = ?auto_79597 ?auto_79594 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79593 ?auto_79595 ?auto_79596 ?auto_79594 ?auto_79597 ?auto_79592 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79644 - OBJ
      ?auto_79645 - OBJ
      ?auto_79646 - OBJ
      ?auto_79647 - OBJ
      ?auto_79648 - OBJ
      ?auto_79643 - LOCATION
    )
    :vars
    (
      ?auto_79653 - LOCATION
      ?auto_79650 - CITY
      ?auto_79649 - LOCATION
      ?auto_79651 - LOCATION
      ?auto_79652 - LOCATION
      ?auto_79654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79653 ?auto_79650 ) ( IN-CITY ?auto_79643 ?auto_79650 ) ( not ( = ?auto_79643 ?auto_79653 ) ) ( OBJ-AT ?auto_79645 ?auto_79653 ) ( IN-CITY ?auto_79649 ?auto_79650 ) ( not ( = ?auto_79643 ?auto_79649 ) ) ( OBJ-AT ?auto_79647 ?auto_79649 ) ( IN-CITY ?auto_79651 ?auto_79650 ) ( not ( = ?auto_79643 ?auto_79651 ) ) ( OBJ-AT ?auto_79648 ?auto_79651 ) ( IN-CITY ?auto_79652 ?auto_79650 ) ( not ( = ?auto_79643 ?auto_79652 ) ) ( OBJ-AT ?auto_79646 ?auto_79652 ) ( OBJ-AT ?auto_79644 ?auto_79653 ) ( TRUCK-AT ?auto_79654 ?auto_79643 ) ( not ( = ?auto_79644 ?auto_79646 ) ) ( not ( = ?auto_79652 ?auto_79653 ) ) ( not ( = ?auto_79644 ?auto_79648 ) ) ( not ( = ?auto_79646 ?auto_79648 ) ) ( not ( = ?auto_79651 ?auto_79652 ) ) ( not ( = ?auto_79651 ?auto_79653 ) ) ( not ( = ?auto_79644 ?auto_79647 ) ) ( not ( = ?auto_79646 ?auto_79647 ) ) ( not ( = ?auto_79648 ?auto_79647 ) ) ( not ( = ?auto_79649 ?auto_79651 ) ) ( not ( = ?auto_79649 ?auto_79652 ) ) ( not ( = ?auto_79649 ?auto_79653 ) ) ( not ( = ?auto_79644 ?auto_79645 ) ) ( not ( = ?auto_79646 ?auto_79645 ) ) ( not ( = ?auto_79648 ?auto_79645 ) ) ( not ( = ?auto_79647 ?auto_79645 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79644 ?auto_79646 ?auto_79648 ?auto_79645 ?auto_79647 ?auto_79643 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79857 - OBJ
      ?auto_79858 - OBJ
      ?auto_79859 - OBJ
      ?auto_79860 - OBJ
      ?auto_79861 - OBJ
      ?auto_79856 - LOCATION
    )
    :vars
    (
      ?auto_79866 - LOCATION
      ?auto_79863 - CITY
      ?auto_79862 - LOCATION
      ?auto_79864 - LOCATION
      ?auto_79865 - LOCATION
      ?auto_79867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79866 ?auto_79863 ) ( IN-CITY ?auto_79856 ?auto_79863 ) ( not ( = ?auto_79856 ?auto_79866 ) ) ( OBJ-AT ?auto_79858 ?auto_79866 ) ( IN-CITY ?auto_79862 ?auto_79863 ) ( not ( = ?auto_79856 ?auto_79862 ) ) ( OBJ-AT ?auto_79861 ?auto_79862 ) ( IN-CITY ?auto_79864 ?auto_79863 ) ( not ( = ?auto_79856 ?auto_79864 ) ) ( OBJ-AT ?auto_79859 ?auto_79864 ) ( IN-CITY ?auto_79865 ?auto_79863 ) ( not ( = ?auto_79856 ?auto_79865 ) ) ( OBJ-AT ?auto_79860 ?auto_79865 ) ( OBJ-AT ?auto_79857 ?auto_79866 ) ( TRUCK-AT ?auto_79867 ?auto_79856 ) ( not ( = ?auto_79857 ?auto_79860 ) ) ( not ( = ?auto_79865 ?auto_79866 ) ) ( not ( = ?auto_79857 ?auto_79859 ) ) ( not ( = ?auto_79860 ?auto_79859 ) ) ( not ( = ?auto_79864 ?auto_79865 ) ) ( not ( = ?auto_79864 ?auto_79866 ) ) ( not ( = ?auto_79857 ?auto_79861 ) ) ( not ( = ?auto_79860 ?auto_79861 ) ) ( not ( = ?auto_79859 ?auto_79861 ) ) ( not ( = ?auto_79862 ?auto_79864 ) ) ( not ( = ?auto_79862 ?auto_79865 ) ) ( not ( = ?auto_79862 ?auto_79866 ) ) ( not ( = ?auto_79857 ?auto_79858 ) ) ( not ( = ?auto_79860 ?auto_79858 ) ) ( not ( = ?auto_79859 ?auto_79858 ) ) ( not ( = ?auto_79861 ?auto_79858 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79857 ?auto_79860 ?auto_79859 ?auto_79858 ?auto_79861 ?auto_79856 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_79963 - OBJ
      ?auto_79964 - OBJ
      ?auto_79965 - OBJ
      ?auto_79966 - OBJ
      ?auto_79967 - OBJ
      ?auto_79962 - LOCATION
    )
    :vars
    (
      ?auto_79972 - LOCATION
      ?auto_79969 - CITY
      ?auto_79968 - LOCATION
      ?auto_79970 - LOCATION
      ?auto_79971 - LOCATION
      ?auto_79973 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_79972 ?auto_79969 ) ( IN-CITY ?auto_79962 ?auto_79969 ) ( not ( = ?auto_79962 ?auto_79972 ) ) ( OBJ-AT ?auto_79964 ?auto_79972 ) ( IN-CITY ?auto_79968 ?auto_79969 ) ( not ( = ?auto_79962 ?auto_79968 ) ) ( OBJ-AT ?auto_79966 ?auto_79968 ) ( IN-CITY ?auto_79970 ?auto_79969 ) ( not ( = ?auto_79962 ?auto_79970 ) ) ( OBJ-AT ?auto_79965 ?auto_79970 ) ( IN-CITY ?auto_79971 ?auto_79969 ) ( not ( = ?auto_79962 ?auto_79971 ) ) ( OBJ-AT ?auto_79967 ?auto_79971 ) ( OBJ-AT ?auto_79963 ?auto_79972 ) ( TRUCK-AT ?auto_79973 ?auto_79962 ) ( not ( = ?auto_79963 ?auto_79967 ) ) ( not ( = ?auto_79971 ?auto_79972 ) ) ( not ( = ?auto_79963 ?auto_79965 ) ) ( not ( = ?auto_79967 ?auto_79965 ) ) ( not ( = ?auto_79970 ?auto_79971 ) ) ( not ( = ?auto_79970 ?auto_79972 ) ) ( not ( = ?auto_79963 ?auto_79966 ) ) ( not ( = ?auto_79967 ?auto_79966 ) ) ( not ( = ?auto_79965 ?auto_79966 ) ) ( not ( = ?auto_79968 ?auto_79970 ) ) ( not ( = ?auto_79968 ?auto_79971 ) ) ( not ( = ?auto_79968 ?auto_79972 ) ) ( not ( = ?auto_79963 ?auto_79964 ) ) ( not ( = ?auto_79967 ?auto_79964 ) ) ( not ( = ?auto_79965 ?auto_79964 ) ) ( not ( = ?auto_79966 ?auto_79964 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_79963 ?auto_79967 ?auto_79965 ?auto_79964 ?auto_79966 ?auto_79962 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80176 - OBJ
      ?auto_80177 - OBJ
      ?auto_80178 - OBJ
      ?auto_80179 - OBJ
      ?auto_80180 - OBJ
      ?auto_80175 - LOCATION
    )
    :vars
    (
      ?auto_80185 - LOCATION
      ?auto_80182 - CITY
      ?auto_80181 - LOCATION
      ?auto_80183 - LOCATION
      ?auto_80184 - LOCATION
      ?auto_80186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80185 ?auto_80182 ) ( IN-CITY ?auto_80175 ?auto_80182 ) ( not ( = ?auto_80175 ?auto_80185 ) ) ( OBJ-AT ?auto_80177 ?auto_80185 ) ( IN-CITY ?auto_80181 ?auto_80182 ) ( not ( = ?auto_80175 ?auto_80181 ) ) ( OBJ-AT ?auto_80178 ?auto_80181 ) ( IN-CITY ?auto_80183 ?auto_80182 ) ( not ( = ?auto_80175 ?auto_80183 ) ) ( OBJ-AT ?auto_80180 ?auto_80183 ) ( IN-CITY ?auto_80184 ?auto_80182 ) ( not ( = ?auto_80175 ?auto_80184 ) ) ( OBJ-AT ?auto_80179 ?auto_80184 ) ( OBJ-AT ?auto_80176 ?auto_80185 ) ( TRUCK-AT ?auto_80186 ?auto_80175 ) ( not ( = ?auto_80176 ?auto_80179 ) ) ( not ( = ?auto_80184 ?auto_80185 ) ) ( not ( = ?auto_80176 ?auto_80180 ) ) ( not ( = ?auto_80179 ?auto_80180 ) ) ( not ( = ?auto_80183 ?auto_80184 ) ) ( not ( = ?auto_80183 ?auto_80185 ) ) ( not ( = ?auto_80176 ?auto_80178 ) ) ( not ( = ?auto_80179 ?auto_80178 ) ) ( not ( = ?auto_80180 ?auto_80178 ) ) ( not ( = ?auto_80181 ?auto_80183 ) ) ( not ( = ?auto_80181 ?auto_80184 ) ) ( not ( = ?auto_80181 ?auto_80185 ) ) ( not ( = ?auto_80176 ?auto_80177 ) ) ( not ( = ?auto_80179 ?auto_80177 ) ) ( not ( = ?auto_80180 ?auto_80177 ) ) ( not ( = ?auto_80178 ?auto_80177 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80176 ?auto_80179 ?auto_80180 ?auto_80177 ?auto_80178 ?auto_80175 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_80227 - OBJ
      ?auto_80228 - OBJ
      ?auto_80229 - OBJ
      ?auto_80230 - OBJ
      ?auto_80231 - OBJ
      ?auto_80226 - LOCATION
    )
    :vars
    (
      ?auto_80236 - LOCATION
      ?auto_80233 - CITY
      ?auto_80232 - LOCATION
      ?auto_80234 - LOCATION
      ?auto_80235 - LOCATION
      ?auto_80237 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_80236 ?auto_80233 ) ( IN-CITY ?auto_80226 ?auto_80233 ) ( not ( = ?auto_80226 ?auto_80236 ) ) ( OBJ-AT ?auto_80228 ?auto_80236 ) ( IN-CITY ?auto_80232 ?auto_80233 ) ( not ( = ?auto_80226 ?auto_80232 ) ) ( OBJ-AT ?auto_80229 ?auto_80232 ) ( IN-CITY ?auto_80234 ?auto_80233 ) ( not ( = ?auto_80226 ?auto_80234 ) ) ( OBJ-AT ?auto_80230 ?auto_80234 ) ( IN-CITY ?auto_80235 ?auto_80233 ) ( not ( = ?auto_80226 ?auto_80235 ) ) ( OBJ-AT ?auto_80231 ?auto_80235 ) ( OBJ-AT ?auto_80227 ?auto_80236 ) ( TRUCK-AT ?auto_80237 ?auto_80226 ) ( not ( = ?auto_80227 ?auto_80231 ) ) ( not ( = ?auto_80235 ?auto_80236 ) ) ( not ( = ?auto_80227 ?auto_80230 ) ) ( not ( = ?auto_80231 ?auto_80230 ) ) ( not ( = ?auto_80234 ?auto_80235 ) ) ( not ( = ?auto_80234 ?auto_80236 ) ) ( not ( = ?auto_80227 ?auto_80229 ) ) ( not ( = ?auto_80231 ?auto_80229 ) ) ( not ( = ?auto_80230 ?auto_80229 ) ) ( not ( = ?auto_80232 ?auto_80234 ) ) ( not ( = ?auto_80232 ?auto_80235 ) ) ( not ( = ?auto_80232 ?auto_80236 ) ) ( not ( = ?auto_80227 ?auto_80228 ) ) ( not ( = ?auto_80231 ?auto_80228 ) ) ( not ( = ?auto_80230 ?auto_80228 ) ) ( not ( = ?auto_80229 ?auto_80228 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_80227 ?auto_80231 ?auto_80230 ?auto_80228 ?auto_80229 ?auto_80226 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81045 - OBJ
      ?auto_81046 - OBJ
      ?auto_81047 - OBJ
      ?auto_81048 - OBJ
      ?auto_81049 - OBJ
      ?auto_81044 - LOCATION
    )
    :vars
    (
      ?auto_81054 - LOCATION
      ?auto_81051 - CITY
      ?auto_81050 - LOCATION
      ?auto_81052 - LOCATION
      ?auto_81053 - LOCATION
      ?auto_81055 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81054 ?auto_81051 ) ( IN-CITY ?auto_81044 ?auto_81051 ) ( not ( = ?auto_81044 ?auto_81054 ) ) ( OBJ-AT ?auto_81049 ?auto_81054 ) ( IN-CITY ?auto_81050 ?auto_81051 ) ( not ( = ?auto_81044 ?auto_81050 ) ) ( OBJ-AT ?auto_81048 ?auto_81050 ) ( IN-CITY ?auto_81052 ?auto_81051 ) ( not ( = ?auto_81044 ?auto_81052 ) ) ( OBJ-AT ?auto_81047 ?auto_81052 ) ( IN-CITY ?auto_81053 ?auto_81051 ) ( not ( = ?auto_81044 ?auto_81053 ) ) ( OBJ-AT ?auto_81045 ?auto_81053 ) ( OBJ-AT ?auto_81046 ?auto_81054 ) ( TRUCK-AT ?auto_81055 ?auto_81044 ) ( not ( = ?auto_81046 ?auto_81045 ) ) ( not ( = ?auto_81053 ?auto_81054 ) ) ( not ( = ?auto_81046 ?auto_81047 ) ) ( not ( = ?auto_81045 ?auto_81047 ) ) ( not ( = ?auto_81052 ?auto_81053 ) ) ( not ( = ?auto_81052 ?auto_81054 ) ) ( not ( = ?auto_81046 ?auto_81048 ) ) ( not ( = ?auto_81045 ?auto_81048 ) ) ( not ( = ?auto_81047 ?auto_81048 ) ) ( not ( = ?auto_81050 ?auto_81052 ) ) ( not ( = ?auto_81050 ?auto_81053 ) ) ( not ( = ?auto_81050 ?auto_81054 ) ) ( not ( = ?auto_81046 ?auto_81049 ) ) ( not ( = ?auto_81045 ?auto_81049 ) ) ( not ( = ?auto_81047 ?auto_81049 ) ) ( not ( = ?auto_81048 ?auto_81049 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81046 ?auto_81045 ?auto_81047 ?auto_81049 ?auto_81048 ?auto_81044 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81096 - OBJ
      ?auto_81097 - OBJ
      ?auto_81098 - OBJ
      ?auto_81099 - OBJ
      ?auto_81100 - OBJ
      ?auto_81095 - LOCATION
    )
    :vars
    (
      ?auto_81105 - LOCATION
      ?auto_81102 - CITY
      ?auto_81101 - LOCATION
      ?auto_81103 - LOCATION
      ?auto_81104 - LOCATION
      ?auto_81106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81105 ?auto_81102 ) ( IN-CITY ?auto_81095 ?auto_81102 ) ( not ( = ?auto_81095 ?auto_81105 ) ) ( OBJ-AT ?auto_81099 ?auto_81105 ) ( IN-CITY ?auto_81101 ?auto_81102 ) ( not ( = ?auto_81095 ?auto_81101 ) ) ( OBJ-AT ?auto_81100 ?auto_81101 ) ( IN-CITY ?auto_81103 ?auto_81102 ) ( not ( = ?auto_81095 ?auto_81103 ) ) ( OBJ-AT ?auto_81098 ?auto_81103 ) ( IN-CITY ?auto_81104 ?auto_81102 ) ( not ( = ?auto_81095 ?auto_81104 ) ) ( OBJ-AT ?auto_81096 ?auto_81104 ) ( OBJ-AT ?auto_81097 ?auto_81105 ) ( TRUCK-AT ?auto_81106 ?auto_81095 ) ( not ( = ?auto_81097 ?auto_81096 ) ) ( not ( = ?auto_81104 ?auto_81105 ) ) ( not ( = ?auto_81097 ?auto_81098 ) ) ( not ( = ?auto_81096 ?auto_81098 ) ) ( not ( = ?auto_81103 ?auto_81104 ) ) ( not ( = ?auto_81103 ?auto_81105 ) ) ( not ( = ?auto_81097 ?auto_81100 ) ) ( not ( = ?auto_81096 ?auto_81100 ) ) ( not ( = ?auto_81098 ?auto_81100 ) ) ( not ( = ?auto_81101 ?auto_81103 ) ) ( not ( = ?auto_81101 ?auto_81104 ) ) ( not ( = ?auto_81101 ?auto_81105 ) ) ( not ( = ?auto_81097 ?auto_81099 ) ) ( not ( = ?auto_81096 ?auto_81099 ) ) ( not ( = ?auto_81098 ?auto_81099 ) ) ( not ( = ?auto_81100 ?auto_81099 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81097 ?auto_81096 ?auto_81098 ?auto_81099 ?auto_81100 ?auto_81095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81147 - OBJ
      ?auto_81148 - OBJ
      ?auto_81149 - OBJ
      ?auto_81150 - OBJ
      ?auto_81151 - OBJ
      ?auto_81146 - LOCATION
    )
    :vars
    (
      ?auto_81156 - LOCATION
      ?auto_81153 - CITY
      ?auto_81152 - LOCATION
      ?auto_81154 - LOCATION
      ?auto_81155 - LOCATION
      ?auto_81157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81156 ?auto_81153 ) ( IN-CITY ?auto_81146 ?auto_81153 ) ( not ( = ?auto_81146 ?auto_81156 ) ) ( OBJ-AT ?auto_81151 ?auto_81156 ) ( IN-CITY ?auto_81152 ?auto_81153 ) ( not ( = ?auto_81146 ?auto_81152 ) ) ( OBJ-AT ?auto_81149 ?auto_81152 ) ( IN-CITY ?auto_81154 ?auto_81153 ) ( not ( = ?auto_81146 ?auto_81154 ) ) ( OBJ-AT ?auto_81150 ?auto_81154 ) ( IN-CITY ?auto_81155 ?auto_81153 ) ( not ( = ?auto_81146 ?auto_81155 ) ) ( OBJ-AT ?auto_81147 ?auto_81155 ) ( OBJ-AT ?auto_81148 ?auto_81156 ) ( TRUCK-AT ?auto_81157 ?auto_81146 ) ( not ( = ?auto_81148 ?auto_81147 ) ) ( not ( = ?auto_81155 ?auto_81156 ) ) ( not ( = ?auto_81148 ?auto_81150 ) ) ( not ( = ?auto_81147 ?auto_81150 ) ) ( not ( = ?auto_81154 ?auto_81155 ) ) ( not ( = ?auto_81154 ?auto_81156 ) ) ( not ( = ?auto_81148 ?auto_81149 ) ) ( not ( = ?auto_81147 ?auto_81149 ) ) ( not ( = ?auto_81150 ?auto_81149 ) ) ( not ( = ?auto_81152 ?auto_81154 ) ) ( not ( = ?auto_81152 ?auto_81155 ) ) ( not ( = ?auto_81152 ?auto_81156 ) ) ( not ( = ?auto_81148 ?auto_81151 ) ) ( not ( = ?auto_81147 ?auto_81151 ) ) ( not ( = ?auto_81150 ?auto_81151 ) ) ( not ( = ?auto_81149 ?auto_81151 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81148 ?auto_81147 ?auto_81150 ?auto_81151 ?auto_81149 ?auto_81146 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81198 - OBJ
      ?auto_81199 - OBJ
      ?auto_81200 - OBJ
      ?auto_81201 - OBJ
      ?auto_81202 - OBJ
      ?auto_81197 - LOCATION
    )
    :vars
    (
      ?auto_81207 - LOCATION
      ?auto_81204 - CITY
      ?auto_81203 - LOCATION
      ?auto_81205 - LOCATION
      ?auto_81206 - LOCATION
      ?auto_81208 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81207 ?auto_81204 ) ( IN-CITY ?auto_81197 ?auto_81204 ) ( not ( = ?auto_81197 ?auto_81207 ) ) ( OBJ-AT ?auto_81201 ?auto_81207 ) ( IN-CITY ?auto_81203 ?auto_81204 ) ( not ( = ?auto_81197 ?auto_81203 ) ) ( OBJ-AT ?auto_81200 ?auto_81203 ) ( IN-CITY ?auto_81205 ?auto_81204 ) ( not ( = ?auto_81197 ?auto_81205 ) ) ( OBJ-AT ?auto_81202 ?auto_81205 ) ( IN-CITY ?auto_81206 ?auto_81204 ) ( not ( = ?auto_81197 ?auto_81206 ) ) ( OBJ-AT ?auto_81198 ?auto_81206 ) ( OBJ-AT ?auto_81199 ?auto_81207 ) ( TRUCK-AT ?auto_81208 ?auto_81197 ) ( not ( = ?auto_81199 ?auto_81198 ) ) ( not ( = ?auto_81206 ?auto_81207 ) ) ( not ( = ?auto_81199 ?auto_81202 ) ) ( not ( = ?auto_81198 ?auto_81202 ) ) ( not ( = ?auto_81205 ?auto_81206 ) ) ( not ( = ?auto_81205 ?auto_81207 ) ) ( not ( = ?auto_81199 ?auto_81200 ) ) ( not ( = ?auto_81198 ?auto_81200 ) ) ( not ( = ?auto_81202 ?auto_81200 ) ) ( not ( = ?auto_81203 ?auto_81205 ) ) ( not ( = ?auto_81203 ?auto_81206 ) ) ( not ( = ?auto_81203 ?auto_81207 ) ) ( not ( = ?auto_81199 ?auto_81201 ) ) ( not ( = ?auto_81198 ?auto_81201 ) ) ( not ( = ?auto_81202 ?auto_81201 ) ) ( not ( = ?auto_81200 ?auto_81201 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81199 ?auto_81198 ?auto_81202 ?auto_81201 ?auto_81200 ?auto_81197 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81411 - OBJ
      ?auto_81412 - OBJ
      ?auto_81413 - OBJ
      ?auto_81414 - OBJ
      ?auto_81415 - OBJ
      ?auto_81410 - LOCATION
    )
    :vars
    (
      ?auto_81420 - LOCATION
      ?auto_81417 - CITY
      ?auto_81416 - LOCATION
      ?auto_81418 - LOCATION
      ?auto_81419 - LOCATION
      ?auto_81421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81420 ?auto_81417 ) ( IN-CITY ?auto_81410 ?auto_81417 ) ( not ( = ?auto_81410 ?auto_81420 ) ) ( OBJ-AT ?auto_81413 ?auto_81420 ) ( IN-CITY ?auto_81416 ?auto_81417 ) ( not ( = ?auto_81410 ?auto_81416 ) ) ( OBJ-AT ?auto_81415 ?auto_81416 ) ( IN-CITY ?auto_81418 ?auto_81417 ) ( not ( = ?auto_81410 ?auto_81418 ) ) ( OBJ-AT ?auto_81414 ?auto_81418 ) ( IN-CITY ?auto_81419 ?auto_81417 ) ( not ( = ?auto_81410 ?auto_81419 ) ) ( OBJ-AT ?auto_81411 ?auto_81419 ) ( OBJ-AT ?auto_81412 ?auto_81420 ) ( TRUCK-AT ?auto_81421 ?auto_81410 ) ( not ( = ?auto_81412 ?auto_81411 ) ) ( not ( = ?auto_81419 ?auto_81420 ) ) ( not ( = ?auto_81412 ?auto_81414 ) ) ( not ( = ?auto_81411 ?auto_81414 ) ) ( not ( = ?auto_81418 ?auto_81419 ) ) ( not ( = ?auto_81418 ?auto_81420 ) ) ( not ( = ?auto_81412 ?auto_81415 ) ) ( not ( = ?auto_81411 ?auto_81415 ) ) ( not ( = ?auto_81414 ?auto_81415 ) ) ( not ( = ?auto_81416 ?auto_81418 ) ) ( not ( = ?auto_81416 ?auto_81419 ) ) ( not ( = ?auto_81416 ?auto_81420 ) ) ( not ( = ?auto_81412 ?auto_81413 ) ) ( not ( = ?auto_81411 ?auto_81413 ) ) ( not ( = ?auto_81414 ?auto_81413 ) ) ( not ( = ?auto_81415 ?auto_81413 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81412 ?auto_81411 ?auto_81414 ?auto_81413 ?auto_81415 ?auto_81410 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_81462 - OBJ
      ?auto_81463 - OBJ
      ?auto_81464 - OBJ
      ?auto_81465 - OBJ
      ?auto_81466 - OBJ
      ?auto_81461 - LOCATION
    )
    :vars
    (
      ?auto_81471 - LOCATION
      ?auto_81468 - CITY
      ?auto_81467 - LOCATION
      ?auto_81469 - LOCATION
      ?auto_81470 - LOCATION
      ?auto_81472 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_81471 ?auto_81468 ) ( IN-CITY ?auto_81461 ?auto_81468 ) ( not ( = ?auto_81461 ?auto_81471 ) ) ( OBJ-AT ?auto_81464 ?auto_81471 ) ( IN-CITY ?auto_81467 ?auto_81468 ) ( not ( = ?auto_81461 ?auto_81467 ) ) ( OBJ-AT ?auto_81465 ?auto_81467 ) ( IN-CITY ?auto_81469 ?auto_81468 ) ( not ( = ?auto_81461 ?auto_81469 ) ) ( OBJ-AT ?auto_81466 ?auto_81469 ) ( IN-CITY ?auto_81470 ?auto_81468 ) ( not ( = ?auto_81461 ?auto_81470 ) ) ( OBJ-AT ?auto_81462 ?auto_81470 ) ( OBJ-AT ?auto_81463 ?auto_81471 ) ( TRUCK-AT ?auto_81472 ?auto_81461 ) ( not ( = ?auto_81463 ?auto_81462 ) ) ( not ( = ?auto_81470 ?auto_81471 ) ) ( not ( = ?auto_81463 ?auto_81466 ) ) ( not ( = ?auto_81462 ?auto_81466 ) ) ( not ( = ?auto_81469 ?auto_81470 ) ) ( not ( = ?auto_81469 ?auto_81471 ) ) ( not ( = ?auto_81463 ?auto_81465 ) ) ( not ( = ?auto_81462 ?auto_81465 ) ) ( not ( = ?auto_81466 ?auto_81465 ) ) ( not ( = ?auto_81467 ?auto_81469 ) ) ( not ( = ?auto_81467 ?auto_81470 ) ) ( not ( = ?auto_81467 ?auto_81471 ) ) ( not ( = ?auto_81463 ?auto_81464 ) ) ( not ( = ?auto_81462 ?auto_81464 ) ) ( not ( = ?auto_81466 ?auto_81464 ) ) ( not ( = ?auto_81465 ?auto_81464 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_81463 ?auto_81462 ?auto_81466 ?auto_81464 ?auto_81465 ?auto_81461 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82450 - OBJ
      ?auto_82451 - OBJ
      ?auto_82452 - OBJ
      ?auto_82453 - OBJ
      ?auto_82454 - OBJ
      ?auto_82449 - LOCATION
    )
    :vars
    (
      ?auto_82459 - LOCATION
      ?auto_82456 - CITY
      ?auto_82455 - LOCATION
      ?auto_82457 - LOCATION
      ?auto_82458 - LOCATION
      ?auto_82460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82459 ?auto_82456 ) ( IN-CITY ?auto_82449 ?auto_82456 ) ( not ( = ?auto_82449 ?auto_82459 ) ) ( OBJ-AT ?auto_82454 ?auto_82459 ) ( IN-CITY ?auto_82455 ?auto_82456 ) ( not ( = ?auto_82449 ?auto_82455 ) ) ( OBJ-AT ?auto_82453 ?auto_82455 ) ( IN-CITY ?auto_82457 ?auto_82456 ) ( not ( = ?auto_82449 ?auto_82457 ) ) ( OBJ-AT ?auto_82451 ?auto_82457 ) ( IN-CITY ?auto_82458 ?auto_82456 ) ( not ( = ?auto_82449 ?auto_82458 ) ) ( OBJ-AT ?auto_82450 ?auto_82458 ) ( OBJ-AT ?auto_82452 ?auto_82459 ) ( TRUCK-AT ?auto_82460 ?auto_82449 ) ( not ( = ?auto_82452 ?auto_82450 ) ) ( not ( = ?auto_82458 ?auto_82459 ) ) ( not ( = ?auto_82452 ?auto_82451 ) ) ( not ( = ?auto_82450 ?auto_82451 ) ) ( not ( = ?auto_82457 ?auto_82458 ) ) ( not ( = ?auto_82457 ?auto_82459 ) ) ( not ( = ?auto_82452 ?auto_82453 ) ) ( not ( = ?auto_82450 ?auto_82453 ) ) ( not ( = ?auto_82451 ?auto_82453 ) ) ( not ( = ?auto_82455 ?auto_82457 ) ) ( not ( = ?auto_82455 ?auto_82458 ) ) ( not ( = ?auto_82455 ?auto_82459 ) ) ( not ( = ?auto_82452 ?auto_82454 ) ) ( not ( = ?auto_82450 ?auto_82454 ) ) ( not ( = ?auto_82451 ?auto_82454 ) ) ( not ( = ?auto_82453 ?auto_82454 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82452 ?auto_82450 ?auto_82451 ?auto_82454 ?auto_82453 ?auto_82449 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82501 - OBJ
      ?auto_82502 - OBJ
      ?auto_82503 - OBJ
      ?auto_82504 - OBJ
      ?auto_82505 - OBJ
      ?auto_82500 - LOCATION
    )
    :vars
    (
      ?auto_82510 - LOCATION
      ?auto_82507 - CITY
      ?auto_82506 - LOCATION
      ?auto_82508 - LOCATION
      ?auto_82509 - LOCATION
      ?auto_82511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82510 ?auto_82507 ) ( IN-CITY ?auto_82500 ?auto_82507 ) ( not ( = ?auto_82500 ?auto_82510 ) ) ( OBJ-AT ?auto_82504 ?auto_82510 ) ( IN-CITY ?auto_82506 ?auto_82507 ) ( not ( = ?auto_82500 ?auto_82506 ) ) ( OBJ-AT ?auto_82505 ?auto_82506 ) ( IN-CITY ?auto_82508 ?auto_82507 ) ( not ( = ?auto_82500 ?auto_82508 ) ) ( OBJ-AT ?auto_82502 ?auto_82508 ) ( IN-CITY ?auto_82509 ?auto_82507 ) ( not ( = ?auto_82500 ?auto_82509 ) ) ( OBJ-AT ?auto_82501 ?auto_82509 ) ( OBJ-AT ?auto_82503 ?auto_82510 ) ( TRUCK-AT ?auto_82511 ?auto_82500 ) ( not ( = ?auto_82503 ?auto_82501 ) ) ( not ( = ?auto_82509 ?auto_82510 ) ) ( not ( = ?auto_82503 ?auto_82502 ) ) ( not ( = ?auto_82501 ?auto_82502 ) ) ( not ( = ?auto_82508 ?auto_82509 ) ) ( not ( = ?auto_82508 ?auto_82510 ) ) ( not ( = ?auto_82503 ?auto_82505 ) ) ( not ( = ?auto_82501 ?auto_82505 ) ) ( not ( = ?auto_82502 ?auto_82505 ) ) ( not ( = ?auto_82506 ?auto_82508 ) ) ( not ( = ?auto_82506 ?auto_82509 ) ) ( not ( = ?auto_82506 ?auto_82510 ) ) ( not ( = ?auto_82503 ?auto_82504 ) ) ( not ( = ?auto_82501 ?auto_82504 ) ) ( not ( = ?auto_82502 ?auto_82504 ) ) ( not ( = ?auto_82505 ?auto_82504 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82503 ?auto_82501 ?auto_82502 ?auto_82504 ?auto_82505 ?auto_82500 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82770 - OBJ
      ?auto_82771 - OBJ
      ?auto_82772 - OBJ
      ?auto_82773 - OBJ
      ?auto_82774 - OBJ
      ?auto_82769 - LOCATION
    )
    :vars
    (
      ?auto_82779 - LOCATION
      ?auto_82776 - CITY
      ?auto_82775 - LOCATION
      ?auto_82777 - LOCATION
      ?auto_82778 - LOCATION
      ?auto_82780 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82779 ?auto_82776 ) ( IN-CITY ?auto_82769 ?auto_82776 ) ( not ( = ?auto_82769 ?auto_82779 ) ) ( OBJ-AT ?auto_82774 ?auto_82779 ) ( IN-CITY ?auto_82775 ?auto_82776 ) ( not ( = ?auto_82769 ?auto_82775 ) ) ( OBJ-AT ?auto_82772 ?auto_82775 ) ( IN-CITY ?auto_82777 ?auto_82776 ) ( not ( = ?auto_82769 ?auto_82777 ) ) ( OBJ-AT ?auto_82771 ?auto_82777 ) ( IN-CITY ?auto_82778 ?auto_82776 ) ( not ( = ?auto_82769 ?auto_82778 ) ) ( OBJ-AT ?auto_82770 ?auto_82778 ) ( OBJ-AT ?auto_82773 ?auto_82779 ) ( TRUCK-AT ?auto_82780 ?auto_82769 ) ( not ( = ?auto_82773 ?auto_82770 ) ) ( not ( = ?auto_82778 ?auto_82779 ) ) ( not ( = ?auto_82773 ?auto_82771 ) ) ( not ( = ?auto_82770 ?auto_82771 ) ) ( not ( = ?auto_82777 ?auto_82778 ) ) ( not ( = ?auto_82777 ?auto_82779 ) ) ( not ( = ?auto_82773 ?auto_82772 ) ) ( not ( = ?auto_82770 ?auto_82772 ) ) ( not ( = ?auto_82771 ?auto_82772 ) ) ( not ( = ?auto_82775 ?auto_82777 ) ) ( not ( = ?auto_82775 ?auto_82778 ) ) ( not ( = ?auto_82775 ?auto_82779 ) ) ( not ( = ?auto_82773 ?auto_82774 ) ) ( not ( = ?auto_82770 ?auto_82774 ) ) ( not ( = ?auto_82771 ?auto_82774 ) ) ( not ( = ?auto_82772 ?auto_82774 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82773 ?auto_82770 ?auto_82771 ?auto_82774 ?auto_82772 ?auto_82769 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82821 - OBJ
      ?auto_82822 - OBJ
      ?auto_82823 - OBJ
      ?auto_82824 - OBJ
      ?auto_82825 - OBJ
      ?auto_82820 - LOCATION
    )
    :vars
    (
      ?auto_82830 - LOCATION
      ?auto_82827 - CITY
      ?auto_82826 - LOCATION
      ?auto_82828 - LOCATION
      ?auto_82829 - LOCATION
      ?auto_82831 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82830 ?auto_82827 ) ( IN-CITY ?auto_82820 ?auto_82827 ) ( not ( = ?auto_82820 ?auto_82830 ) ) ( OBJ-AT ?auto_82824 ?auto_82830 ) ( IN-CITY ?auto_82826 ?auto_82827 ) ( not ( = ?auto_82820 ?auto_82826 ) ) ( OBJ-AT ?auto_82823 ?auto_82826 ) ( IN-CITY ?auto_82828 ?auto_82827 ) ( not ( = ?auto_82820 ?auto_82828 ) ) ( OBJ-AT ?auto_82822 ?auto_82828 ) ( IN-CITY ?auto_82829 ?auto_82827 ) ( not ( = ?auto_82820 ?auto_82829 ) ) ( OBJ-AT ?auto_82821 ?auto_82829 ) ( OBJ-AT ?auto_82825 ?auto_82830 ) ( TRUCK-AT ?auto_82831 ?auto_82820 ) ( not ( = ?auto_82825 ?auto_82821 ) ) ( not ( = ?auto_82829 ?auto_82830 ) ) ( not ( = ?auto_82825 ?auto_82822 ) ) ( not ( = ?auto_82821 ?auto_82822 ) ) ( not ( = ?auto_82828 ?auto_82829 ) ) ( not ( = ?auto_82828 ?auto_82830 ) ) ( not ( = ?auto_82825 ?auto_82823 ) ) ( not ( = ?auto_82821 ?auto_82823 ) ) ( not ( = ?auto_82822 ?auto_82823 ) ) ( not ( = ?auto_82826 ?auto_82828 ) ) ( not ( = ?auto_82826 ?auto_82829 ) ) ( not ( = ?auto_82826 ?auto_82830 ) ) ( not ( = ?auto_82825 ?auto_82824 ) ) ( not ( = ?auto_82821 ?auto_82824 ) ) ( not ( = ?auto_82822 ?auto_82824 ) ) ( not ( = ?auto_82823 ?auto_82824 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82825 ?auto_82821 ?auto_82822 ?auto_82824 ?auto_82823 ?auto_82820 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_82924 - OBJ
      ?auto_82925 - OBJ
      ?auto_82926 - OBJ
      ?auto_82927 - OBJ
      ?auto_82928 - OBJ
      ?auto_82923 - LOCATION
    )
    :vars
    (
      ?auto_82933 - LOCATION
      ?auto_82930 - CITY
      ?auto_82929 - LOCATION
      ?auto_82931 - LOCATION
      ?auto_82932 - LOCATION
      ?auto_82934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_82933 ?auto_82930 ) ( IN-CITY ?auto_82923 ?auto_82930 ) ( not ( = ?auto_82923 ?auto_82933 ) ) ( OBJ-AT ?auto_82926 ?auto_82933 ) ( IN-CITY ?auto_82929 ?auto_82930 ) ( not ( = ?auto_82923 ?auto_82929 ) ) ( OBJ-AT ?auto_82928 ?auto_82929 ) ( IN-CITY ?auto_82931 ?auto_82930 ) ( not ( = ?auto_82923 ?auto_82931 ) ) ( OBJ-AT ?auto_82925 ?auto_82931 ) ( IN-CITY ?auto_82932 ?auto_82930 ) ( not ( = ?auto_82923 ?auto_82932 ) ) ( OBJ-AT ?auto_82924 ?auto_82932 ) ( OBJ-AT ?auto_82927 ?auto_82933 ) ( TRUCK-AT ?auto_82934 ?auto_82923 ) ( not ( = ?auto_82927 ?auto_82924 ) ) ( not ( = ?auto_82932 ?auto_82933 ) ) ( not ( = ?auto_82927 ?auto_82925 ) ) ( not ( = ?auto_82924 ?auto_82925 ) ) ( not ( = ?auto_82931 ?auto_82932 ) ) ( not ( = ?auto_82931 ?auto_82933 ) ) ( not ( = ?auto_82927 ?auto_82928 ) ) ( not ( = ?auto_82924 ?auto_82928 ) ) ( not ( = ?auto_82925 ?auto_82928 ) ) ( not ( = ?auto_82929 ?auto_82931 ) ) ( not ( = ?auto_82929 ?auto_82932 ) ) ( not ( = ?auto_82929 ?auto_82933 ) ) ( not ( = ?auto_82927 ?auto_82926 ) ) ( not ( = ?auto_82924 ?auto_82926 ) ) ( not ( = ?auto_82925 ?auto_82926 ) ) ( not ( = ?auto_82928 ?auto_82926 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_82927 ?auto_82924 ?auto_82925 ?auto_82926 ?auto_82928 ?auto_82923 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83085 - OBJ
      ?auto_83086 - OBJ
      ?auto_83087 - OBJ
      ?auto_83088 - OBJ
      ?auto_83089 - OBJ
      ?auto_83084 - LOCATION
    )
    :vars
    (
      ?auto_83094 - LOCATION
      ?auto_83091 - CITY
      ?auto_83090 - LOCATION
      ?auto_83092 - LOCATION
      ?auto_83093 - LOCATION
      ?auto_83095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83094 ?auto_83091 ) ( IN-CITY ?auto_83084 ?auto_83091 ) ( not ( = ?auto_83084 ?auto_83094 ) ) ( OBJ-AT ?auto_83087 ?auto_83094 ) ( IN-CITY ?auto_83090 ?auto_83091 ) ( not ( = ?auto_83084 ?auto_83090 ) ) ( OBJ-AT ?auto_83088 ?auto_83090 ) ( IN-CITY ?auto_83092 ?auto_83091 ) ( not ( = ?auto_83084 ?auto_83092 ) ) ( OBJ-AT ?auto_83086 ?auto_83092 ) ( IN-CITY ?auto_83093 ?auto_83091 ) ( not ( = ?auto_83084 ?auto_83093 ) ) ( OBJ-AT ?auto_83085 ?auto_83093 ) ( OBJ-AT ?auto_83089 ?auto_83094 ) ( TRUCK-AT ?auto_83095 ?auto_83084 ) ( not ( = ?auto_83089 ?auto_83085 ) ) ( not ( = ?auto_83093 ?auto_83094 ) ) ( not ( = ?auto_83089 ?auto_83086 ) ) ( not ( = ?auto_83085 ?auto_83086 ) ) ( not ( = ?auto_83092 ?auto_83093 ) ) ( not ( = ?auto_83092 ?auto_83094 ) ) ( not ( = ?auto_83089 ?auto_83088 ) ) ( not ( = ?auto_83085 ?auto_83088 ) ) ( not ( = ?auto_83086 ?auto_83088 ) ) ( not ( = ?auto_83090 ?auto_83092 ) ) ( not ( = ?auto_83090 ?auto_83093 ) ) ( not ( = ?auto_83090 ?auto_83094 ) ) ( not ( = ?auto_83089 ?auto_83087 ) ) ( not ( = ?auto_83085 ?auto_83087 ) ) ( not ( = ?auto_83086 ?auto_83087 ) ) ( not ( = ?auto_83088 ?auto_83087 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83089 ?auto_83085 ?auto_83086 ?auto_83087 ?auto_83088 ?auto_83084 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83243 - OBJ
      ?auto_83244 - OBJ
      ?auto_83245 - OBJ
      ?auto_83246 - OBJ
      ?auto_83247 - OBJ
      ?auto_83242 - LOCATION
    )
    :vars
    (
      ?auto_83252 - LOCATION
      ?auto_83249 - CITY
      ?auto_83248 - LOCATION
      ?auto_83250 - LOCATION
      ?auto_83251 - LOCATION
      ?auto_83253 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83252 ?auto_83249 ) ( IN-CITY ?auto_83242 ?auto_83249 ) ( not ( = ?auto_83242 ?auto_83252 ) ) ( OBJ-AT ?auto_83247 ?auto_83252 ) ( IN-CITY ?auto_83248 ?auto_83249 ) ( not ( = ?auto_83242 ?auto_83248 ) ) ( OBJ-AT ?auto_83244 ?auto_83248 ) ( IN-CITY ?auto_83250 ?auto_83249 ) ( not ( = ?auto_83242 ?auto_83250 ) ) ( OBJ-AT ?auto_83246 ?auto_83250 ) ( IN-CITY ?auto_83251 ?auto_83249 ) ( not ( = ?auto_83242 ?auto_83251 ) ) ( OBJ-AT ?auto_83243 ?auto_83251 ) ( OBJ-AT ?auto_83245 ?auto_83252 ) ( TRUCK-AT ?auto_83253 ?auto_83242 ) ( not ( = ?auto_83245 ?auto_83243 ) ) ( not ( = ?auto_83251 ?auto_83252 ) ) ( not ( = ?auto_83245 ?auto_83246 ) ) ( not ( = ?auto_83243 ?auto_83246 ) ) ( not ( = ?auto_83250 ?auto_83251 ) ) ( not ( = ?auto_83250 ?auto_83252 ) ) ( not ( = ?auto_83245 ?auto_83244 ) ) ( not ( = ?auto_83243 ?auto_83244 ) ) ( not ( = ?auto_83246 ?auto_83244 ) ) ( not ( = ?auto_83248 ?auto_83250 ) ) ( not ( = ?auto_83248 ?auto_83251 ) ) ( not ( = ?auto_83248 ?auto_83252 ) ) ( not ( = ?auto_83245 ?auto_83247 ) ) ( not ( = ?auto_83243 ?auto_83247 ) ) ( not ( = ?auto_83246 ?auto_83247 ) ) ( not ( = ?auto_83244 ?auto_83247 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83245 ?auto_83243 ?auto_83246 ?auto_83247 ?auto_83244 ?auto_83242 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83294 - OBJ
      ?auto_83295 - OBJ
      ?auto_83296 - OBJ
      ?auto_83297 - OBJ
      ?auto_83298 - OBJ
      ?auto_83293 - LOCATION
    )
    :vars
    (
      ?auto_83303 - LOCATION
      ?auto_83300 - CITY
      ?auto_83299 - LOCATION
      ?auto_83301 - LOCATION
      ?auto_83302 - LOCATION
      ?auto_83304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83303 ?auto_83300 ) ( IN-CITY ?auto_83293 ?auto_83300 ) ( not ( = ?auto_83293 ?auto_83303 ) ) ( OBJ-AT ?auto_83297 ?auto_83303 ) ( IN-CITY ?auto_83299 ?auto_83300 ) ( not ( = ?auto_83293 ?auto_83299 ) ) ( OBJ-AT ?auto_83295 ?auto_83299 ) ( IN-CITY ?auto_83301 ?auto_83300 ) ( not ( = ?auto_83293 ?auto_83301 ) ) ( OBJ-AT ?auto_83298 ?auto_83301 ) ( IN-CITY ?auto_83302 ?auto_83300 ) ( not ( = ?auto_83293 ?auto_83302 ) ) ( OBJ-AT ?auto_83294 ?auto_83302 ) ( OBJ-AT ?auto_83296 ?auto_83303 ) ( TRUCK-AT ?auto_83304 ?auto_83293 ) ( not ( = ?auto_83296 ?auto_83294 ) ) ( not ( = ?auto_83302 ?auto_83303 ) ) ( not ( = ?auto_83296 ?auto_83298 ) ) ( not ( = ?auto_83294 ?auto_83298 ) ) ( not ( = ?auto_83301 ?auto_83302 ) ) ( not ( = ?auto_83301 ?auto_83303 ) ) ( not ( = ?auto_83296 ?auto_83295 ) ) ( not ( = ?auto_83294 ?auto_83295 ) ) ( not ( = ?auto_83298 ?auto_83295 ) ) ( not ( = ?auto_83299 ?auto_83301 ) ) ( not ( = ?auto_83299 ?auto_83302 ) ) ( not ( = ?auto_83299 ?auto_83303 ) ) ( not ( = ?auto_83296 ?auto_83297 ) ) ( not ( = ?auto_83294 ?auto_83297 ) ) ( not ( = ?auto_83298 ?auto_83297 ) ) ( not ( = ?auto_83295 ?auto_83297 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83296 ?auto_83294 ?auto_83298 ?auto_83297 ?auto_83295 ?auto_83293 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83454 - OBJ
      ?auto_83455 - OBJ
      ?auto_83456 - OBJ
      ?auto_83457 - OBJ
      ?auto_83458 - OBJ
      ?auto_83453 - LOCATION
    )
    :vars
    (
      ?auto_83463 - LOCATION
      ?auto_83460 - CITY
      ?auto_83459 - LOCATION
      ?auto_83461 - LOCATION
      ?auto_83462 - LOCATION
      ?auto_83464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83463 ?auto_83460 ) ( IN-CITY ?auto_83453 ?auto_83460 ) ( not ( = ?auto_83453 ?auto_83463 ) ) ( OBJ-AT ?auto_83458 ?auto_83463 ) ( IN-CITY ?auto_83459 ?auto_83460 ) ( not ( = ?auto_83453 ?auto_83459 ) ) ( OBJ-AT ?auto_83455 ?auto_83459 ) ( IN-CITY ?auto_83461 ?auto_83460 ) ( not ( = ?auto_83453 ?auto_83461 ) ) ( OBJ-AT ?auto_83456 ?auto_83461 ) ( IN-CITY ?auto_83462 ?auto_83460 ) ( not ( = ?auto_83453 ?auto_83462 ) ) ( OBJ-AT ?auto_83454 ?auto_83462 ) ( OBJ-AT ?auto_83457 ?auto_83463 ) ( TRUCK-AT ?auto_83464 ?auto_83453 ) ( not ( = ?auto_83457 ?auto_83454 ) ) ( not ( = ?auto_83462 ?auto_83463 ) ) ( not ( = ?auto_83457 ?auto_83456 ) ) ( not ( = ?auto_83454 ?auto_83456 ) ) ( not ( = ?auto_83461 ?auto_83462 ) ) ( not ( = ?auto_83461 ?auto_83463 ) ) ( not ( = ?auto_83457 ?auto_83455 ) ) ( not ( = ?auto_83454 ?auto_83455 ) ) ( not ( = ?auto_83456 ?auto_83455 ) ) ( not ( = ?auto_83459 ?auto_83461 ) ) ( not ( = ?auto_83459 ?auto_83462 ) ) ( not ( = ?auto_83459 ?auto_83463 ) ) ( not ( = ?auto_83457 ?auto_83458 ) ) ( not ( = ?auto_83454 ?auto_83458 ) ) ( not ( = ?auto_83456 ?auto_83458 ) ) ( not ( = ?auto_83455 ?auto_83458 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83457 ?auto_83454 ?auto_83456 ?auto_83458 ?auto_83455 ?auto_83453 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83505 - OBJ
      ?auto_83506 - OBJ
      ?auto_83507 - OBJ
      ?auto_83508 - OBJ
      ?auto_83509 - OBJ
      ?auto_83504 - LOCATION
    )
    :vars
    (
      ?auto_83514 - LOCATION
      ?auto_83511 - CITY
      ?auto_83510 - LOCATION
      ?auto_83512 - LOCATION
      ?auto_83513 - LOCATION
      ?auto_83515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83514 ?auto_83511 ) ( IN-CITY ?auto_83504 ?auto_83511 ) ( not ( = ?auto_83504 ?auto_83514 ) ) ( OBJ-AT ?auto_83508 ?auto_83514 ) ( IN-CITY ?auto_83510 ?auto_83511 ) ( not ( = ?auto_83504 ?auto_83510 ) ) ( OBJ-AT ?auto_83506 ?auto_83510 ) ( IN-CITY ?auto_83512 ?auto_83511 ) ( not ( = ?auto_83504 ?auto_83512 ) ) ( OBJ-AT ?auto_83507 ?auto_83512 ) ( IN-CITY ?auto_83513 ?auto_83511 ) ( not ( = ?auto_83504 ?auto_83513 ) ) ( OBJ-AT ?auto_83505 ?auto_83513 ) ( OBJ-AT ?auto_83509 ?auto_83514 ) ( TRUCK-AT ?auto_83515 ?auto_83504 ) ( not ( = ?auto_83509 ?auto_83505 ) ) ( not ( = ?auto_83513 ?auto_83514 ) ) ( not ( = ?auto_83509 ?auto_83507 ) ) ( not ( = ?auto_83505 ?auto_83507 ) ) ( not ( = ?auto_83512 ?auto_83513 ) ) ( not ( = ?auto_83512 ?auto_83514 ) ) ( not ( = ?auto_83509 ?auto_83506 ) ) ( not ( = ?auto_83505 ?auto_83506 ) ) ( not ( = ?auto_83507 ?auto_83506 ) ) ( not ( = ?auto_83510 ?auto_83512 ) ) ( not ( = ?auto_83510 ?auto_83513 ) ) ( not ( = ?auto_83510 ?auto_83514 ) ) ( not ( = ?auto_83509 ?auto_83508 ) ) ( not ( = ?auto_83505 ?auto_83508 ) ) ( not ( = ?auto_83507 ?auto_83508 ) ) ( not ( = ?auto_83506 ?auto_83508 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83509 ?auto_83505 ?auto_83507 ?auto_83508 ?auto_83506 ?auto_83504 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83717 - OBJ
      ?auto_83718 - OBJ
      ?auto_83719 - OBJ
      ?auto_83720 - OBJ
      ?auto_83721 - OBJ
      ?auto_83716 - LOCATION
    )
    :vars
    (
      ?auto_83726 - LOCATION
      ?auto_83723 - CITY
      ?auto_83722 - LOCATION
      ?auto_83724 - LOCATION
      ?auto_83725 - LOCATION
      ?auto_83727 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83726 ?auto_83723 ) ( IN-CITY ?auto_83716 ?auto_83723 ) ( not ( = ?auto_83716 ?auto_83726 ) ) ( OBJ-AT ?auto_83719 ?auto_83726 ) ( IN-CITY ?auto_83722 ?auto_83723 ) ( not ( = ?auto_83716 ?auto_83722 ) ) ( OBJ-AT ?auto_83718 ?auto_83722 ) ( IN-CITY ?auto_83724 ?auto_83723 ) ( not ( = ?auto_83716 ?auto_83724 ) ) ( OBJ-AT ?auto_83721 ?auto_83724 ) ( IN-CITY ?auto_83725 ?auto_83723 ) ( not ( = ?auto_83716 ?auto_83725 ) ) ( OBJ-AT ?auto_83717 ?auto_83725 ) ( OBJ-AT ?auto_83720 ?auto_83726 ) ( TRUCK-AT ?auto_83727 ?auto_83716 ) ( not ( = ?auto_83720 ?auto_83717 ) ) ( not ( = ?auto_83725 ?auto_83726 ) ) ( not ( = ?auto_83720 ?auto_83721 ) ) ( not ( = ?auto_83717 ?auto_83721 ) ) ( not ( = ?auto_83724 ?auto_83725 ) ) ( not ( = ?auto_83724 ?auto_83726 ) ) ( not ( = ?auto_83720 ?auto_83718 ) ) ( not ( = ?auto_83717 ?auto_83718 ) ) ( not ( = ?auto_83721 ?auto_83718 ) ) ( not ( = ?auto_83722 ?auto_83724 ) ) ( not ( = ?auto_83722 ?auto_83725 ) ) ( not ( = ?auto_83722 ?auto_83726 ) ) ( not ( = ?auto_83720 ?auto_83719 ) ) ( not ( = ?auto_83717 ?auto_83719 ) ) ( not ( = ?auto_83721 ?auto_83719 ) ) ( not ( = ?auto_83718 ?auto_83719 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83720 ?auto_83717 ?auto_83721 ?auto_83719 ?auto_83718 ?auto_83716 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_83823 - OBJ
      ?auto_83824 - OBJ
      ?auto_83825 - OBJ
      ?auto_83826 - OBJ
      ?auto_83827 - OBJ
      ?auto_83822 - LOCATION
    )
    :vars
    (
      ?auto_83832 - LOCATION
      ?auto_83829 - CITY
      ?auto_83828 - LOCATION
      ?auto_83830 - LOCATION
      ?auto_83831 - LOCATION
      ?auto_83833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_83832 ?auto_83829 ) ( IN-CITY ?auto_83822 ?auto_83829 ) ( not ( = ?auto_83822 ?auto_83832 ) ) ( OBJ-AT ?auto_83825 ?auto_83832 ) ( IN-CITY ?auto_83828 ?auto_83829 ) ( not ( = ?auto_83822 ?auto_83828 ) ) ( OBJ-AT ?auto_83824 ?auto_83828 ) ( IN-CITY ?auto_83830 ?auto_83829 ) ( not ( = ?auto_83822 ?auto_83830 ) ) ( OBJ-AT ?auto_83826 ?auto_83830 ) ( IN-CITY ?auto_83831 ?auto_83829 ) ( not ( = ?auto_83822 ?auto_83831 ) ) ( OBJ-AT ?auto_83823 ?auto_83831 ) ( OBJ-AT ?auto_83827 ?auto_83832 ) ( TRUCK-AT ?auto_83833 ?auto_83822 ) ( not ( = ?auto_83827 ?auto_83823 ) ) ( not ( = ?auto_83831 ?auto_83832 ) ) ( not ( = ?auto_83827 ?auto_83826 ) ) ( not ( = ?auto_83823 ?auto_83826 ) ) ( not ( = ?auto_83830 ?auto_83831 ) ) ( not ( = ?auto_83830 ?auto_83832 ) ) ( not ( = ?auto_83827 ?auto_83824 ) ) ( not ( = ?auto_83823 ?auto_83824 ) ) ( not ( = ?auto_83826 ?auto_83824 ) ) ( not ( = ?auto_83828 ?auto_83830 ) ) ( not ( = ?auto_83828 ?auto_83831 ) ) ( not ( = ?auto_83828 ?auto_83832 ) ) ( not ( = ?auto_83827 ?auto_83825 ) ) ( not ( = ?auto_83823 ?auto_83825 ) ) ( not ( = ?auto_83826 ?auto_83825 ) ) ( not ( = ?auto_83824 ?auto_83825 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_83827 ?auto_83823 ?auto_83826 ?auto_83825 ?auto_83824 ?auto_83822 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84198 - OBJ
      ?auto_84199 - OBJ
      ?auto_84200 - OBJ
      ?auto_84201 - OBJ
      ?auto_84202 - OBJ
      ?auto_84197 - LOCATION
    )
    :vars
    (
      ?auto_84207 - LOCATION
      ?auto_84204 - CITY
      ?auto_84203 - LOCATION
      ?auto_84205 - LOCATION
      ?auto_84206 - LOCATION
      ?auto_84208 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84207 ?auto_84204 ) ( IN-CITY ?auto_84197 ?auto_84204 ) ( not ( = ?auto_84197 ?auto_84207 ) ) ( OBJ-AT ?auto_84199 ?auto_84207 ) ( IN-CITY ?auto_84203 ?auto_84204 ) ( not ( = ?auto_84197 ?auto_84203 ) ) ( OBJ-AT ?auto_84202 ?auto_84203 ) ( IN-CITY ?auto_84205 ?auto_84204 ) ( not ( = ?auto_84197 ?auto_84205 ) ) ( OBJ-AT ?auto_84201 ?auto_84205 ) ( IN-CITY ?auto_84206 ?auto_84204 ) ( not ( = ?auto_84197 ?auto_84206 ) ) ( OBJ-AT ?auto_84198 ?auto_84206 ) ( OBJ-AT ?auto_84200 ?auto_84207 ) ( TRUCK-AT ?auto_84208 ?auto_84197 ) ( not ( = ?auto_84200 ?auto_84198 ) ) ( not ( = ?auto_84206 ?auto_84207 ) ) ( not ( = ?auto_84200 ?auto_84201 ) ) ( not ( = ?auto_84198 ?auto_84201 ) ) ( not ( = ?auto_84205 ?auto_84206 ) ) ( not ( = ?auto_84205 ?auto_84207 ) ) ( not ( = ?auto_84200 ?auto_84202 ) ) ( not ( = ?auto_84198 ?auto_84202 ) ) ( not ( = ?auto_84201 ?auto_84202 ) ) ( not ( = ?auto_84203 ?auto_84205 ) ) ( not ( = ?auto_84203 ?auto_84206 ) ) ( not ( = ?auto_84203 ?auto_84207 ) ) ( not ( = ?auto_84200 ?auto_84199 ) ) ( not ( = ?auto_84198 ?auto_84199 ) ) ( not ( = ?auto_84201 ?auto_84199 ) ) ( not ( = ?auto_84202 ?auto_84199 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84200 ?auto_84198 ?auto_84201 ?auto_84199 ?auto_84202 ?auto_84197 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84249 - OBJ
      ?auto_84250 - OBJ
      ?auto_84251 - OBJ
      ?auto_84252 - OBJ
      ?auto_84253 - OBJ
      ?auto_84248 - LOCATION
    )
    :vars
    (
      ?auto_84258 - LOCATION
      ?auto_84255 - CITY
      ?auto_84254 - LOCATION
      ?auto_84256 - LOCATION
      ?auto_84257 - LOCATION
      ?auto_84259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84258 ?auto_84255 ) ( IN-CITY ?auto_84248 ?auto_84255 ) ( not ( = ?auto_84248 ?auto_84258 ) ) ( OBJ-AT ?auto_84250 ?auto_84258 ) ( IN-CITY ?auto_84254 ?auto_84255 ) ( not ( = ?auto_84248 ?auto_84254 ) ) ( OBJ-AT ?auto_84252 ?auto_84254 ) ( IN-CITY ?auto_84256 ?auto_84255 ) ( not ( = ?auto_84248 ?auto_84256 ) ) ( OBJ-AT ?auto_84253 ?auto_84256 ) ( IN-CITY ?auto_84257 ?auto_84255 ) ( not ( = ?auto_84248 ?auto_84257 ) ) ( OBJ-AT ?auto_84249 ?auto_84257 ) ( OBJ-AT ?auto_84251 ?auto_84258 ) ( TRUCK-AT ?auto_84259 ?auto_84248 ) ( not ( = ?auto_84251 ?auto_84249 ) ) ( not ( = ?auto_84257 ?auto_84258 ) ) ( not ( = ?auto_84251 ?auto_84253 ) ) ( not ( = ?auto_84249 ?auto_84253 ) ) ( not ( = ?auto_84256 ?auto_84257 ) ) ( not ( = ?auto_84256 ?auto_84258 ) ) ( not ( = ?auto_84251 ?auto_84252 ) ) ( not ( = ?auto_84249 ?auto_84252 ) ) ( not ( = ?auto_84253 ?auto_84252 ) ) ( not ( = ?auto_84254 ?auto_84256 ) ) ( not ( = ?auto_84254 ?auto_84257 ) ) ( not ( = ?auto_84254 ?auto_84258 ) ) ( not ( = ?auto_84251 ?auto_84250 ) ) ( not ( = ?auto_84249 ?auto_84250 ) ) ( not ( = ?auto_84253 ?auto_84250 ) ) ( not ( = ?auto_84252 ?auto_84250 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84251 ?auto_84249 ?auto_84253 ?auto_84250 ?auto_84252 ?auto_84248 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84742 - OBJ
      ?auto_84743 - OBJ
      ?auto_84744 - OBJ
      ?auto_84745 - OBJ
      ?auto_84746 - OBJ
      ?auto_84741 - LOCATION
    )
    :vars
    (
      ?auto_84751 - LOCATION
      ?auto_84748 - CITY
      ?auto_84747 - LOCATION
      ?auto_84749 - LOCATION
      ?auto_84750 - LOCATION
      ?auto_84752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84751 ?auto_84748 ) ( IN-CITY ?auto_84741 ?auto_84748 ) ( not ( = ?auto_84741 ?auto_84751 ) ) ( OBJ-AT ?auto_84743 ?auto_84751 ) ( IN-CITY ?auto_84747 ?auto_84748 ) ( not ( = ?auto_84741 ?auto_84747 ) ) ( OBJ-AT ?auto_84746 ?auto_84747 ) ( IN-CITY ?auto_84749 ?auto_84748 ) ( not ( = ?auto_84741 ?auto_84749 ) ) ( OBJ-AT ?auto_84744 ?auto_84749 ) ( IN-CITY ?auto_84750 ?auto_84748 ) ( not ( = ?auto_84741 ?auto_84750 ) ) ( OBJ-AT ?auto_84742 ?auto_84750 ) ( OBJ-AT ?auto_84745 ?auto_84751 ) ( TRUCK-AT ?auto_84752 ?auto_84741 ) ( not ( = ?auto_84745 ?auto_84742 ) ) ( not ( = ?auto_84750 ?auto_84751 ) ) ( not ( = ?auto_84745 ?auto_84744 ) ) ( not ( = ?auto_84742 ?auto_84744 ) ) ( not ( = ?auto_84749 ?auto_84750 ) ) ( not ( = ?auto_84749 ?auto_84751 ) ) ( not ( = ?auto_84745 ?auto_84746 ) ) ( not ( = ?auto_84742 ?auto_84746 ) ) ( not ( = ?auto_84744 ?auto_84746 ) ) ( not ( = ?auto_84747 ?auto_84749 ) ) ( not ( = ?auto_84747 ?auto_84750 ) ) ( not ( = ?auto_84747 ?auto_84751 ) ) ( not ( = ?auto_84745 ?auto_84743 ) ) ( not ( = ?auto_84742 ?auto_84743 ) ) ( not ( = ?auto_84744 ?auto_84743 ) ) ( not ( = ?auto_84746 ?auto_84743 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84745 ?auto_84742 ?auto_84744 ?auto_84743 ?auto_84746 ?auto_84741 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_84903 - OBJ
      ?auto_84904 - OBJ
      ?auto_84905 - OBJ
      ?auto_84906 - OBJ
      ?auto_84907 - OBJ
      ?auto_84902 - LOCATION
    )
    :vars
    (
      ?auto_84912 - LOCATION
      ?auto_84909 - CITY
      ?auto_84908 - LOCATION
      ?auto_84910 - LOCATION
      ?auto_84911 - LOCATION
      ?auto_84913 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_84912 ?auto_84909 ) ( IN-CITY ?auto_84902 ?auto_84909 ) ( not ( = ?auto_84902 ?auto_84912 ) ) ( OBJ-AT ?auto_84904 ?auto_84912 ) ( IN-CITY ?auto_84908 ?auto_84909 ) ( not ( = ?auto_84902 ?auto_84908 ) ) ( OBJ-AT ?auto_84906 ?auto_84908 ) ( IN-CITY ?auto_84910 ?auto_84909 ) ( not ( = ?auto_84902 ?auto_84910 ) ) ( OBJ-AT ?auto_84905 ?auto_84910 ) ( IN-CITY ?auto_84911 ?auto_84909 ) ( not ( = ?auto_84902 ?auto_84911 ) ) ( OBJ-AT ?auto_84903 ?auto_84911 ) ( OBJ-AT ?auto_84907 ?auto_84912 ) ( TRUCK-AT ?auto_84913 ?auto_84902 ) ( not ( = ?auto_84907 ?auto_84903 ) ) ( not ( = ?auto_84911 ?auto_84912 ) ) ( not ( = ?auto_84907 ?auto_84905 ) ) ( not ( = ?auto_84903 ?auto_84905 ) ) ( not ( = ?auto_84910 ?auto_84911 ) ) ( not ( = ?auto_84910 ?auto_84912 ) ) ( not ( = ?auto_84907 ?auto_84906 ) ) ( not ( = ?auto_84903 ?auto_84906 ) ) ( not ( = ?auto_84905 ?auto_84906 ) ) ( not ( = ?auto_84908 ?auto_84910 ) ) ( not ( = ?auto_84908 ?auto_84911 ) ) ( not ( = ?auto_84908 ?auto_84912 ) ) ( not ( = ?auto_84907 ?auto_84904 ) ) ( not ( = ?auto_84903 ?auto_84904 ) ) ( not ( = ?auto_84905 ?auto_84904 ) ) ( not ( = ?auto_84906 ?auto_84904 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_84907 ?auto_84903 ?auto_84905 ?auto_84904 ?auto_84906 ?auto_84902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85061 - OBJ
      ?auto_85062 - OBJ
      ?auto_85063 - OBJ
      ?auto_85064 - OBJ
      ?auto_85065 - OBJ
      ?auto_85060 - LOCATION
    )
    :vars
    (
      ?auto_85070 - LOCATION
      ?auto_85067 - CITY
      ?auto_85066 - LOCATION
      ?auto_85068 - LOCATION
      ?auto_85069 - LOCATION
      ?auto_85071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85070 ?auto_85067 ) ( IN-CITY ?auto_85060 ?auto_85067 ) ( not ( = ?auto_85060 ?auto_85070 ) ) ( OBJ-AT ?auto_85062 ?auto_85070 ) ( IN-CITY ?auto_85066 ?auto_85067 ) ( not ( = ?auto_85060 ?auto_85066 ) ) ( OBJ-AT ?auto_85063 ?auto_85066 ) ( IN-CITY ?auto_85068 ?auto_85067 ) ( not ( = ?auto_85060 ?auto_85068 ) ) ( OBJ-AT ?auto_85065 ?auto_85068 ) ( IN-CITY ?auto_85069 ?auto_85067 ) ( not ( = ?auto_85060 ?auto_85069 ) ) ( OBJ-AT ?auto_85061 ?auto_85069 ) ( OBJ-AT ?auto_85064 ?auto_85070 ) ( TRUCK-AT ?auto_85071 ?auto_85060 ) ( not ( = ?auto_85064 ?auto_85061 ) ) ( not ( = ?auto_85069 ?auto_85070 ) ) ( not ( = ?auto_85064 ?auto_85065 ) ) ( not ( = ?auto_85061 ?auto_85065 ) ) ( not ( = ?auto_85068 ?auto_85069 ) ) ( not ( = ?auto_85068 ?auto_85070 ) ) ( not ( = ?auto_85064 ?auto_85063 ) ) ( not ( = ?auto_85061 ?auto_85063 ) ) ( not ( = ?auto_85065 ?auto_85063 ) ) ( not ( = ?auto_85066 ?auto_85068 ) ) ( not ( = ?auto_85066 ?auto_85069 ) ) ( not ( = ?auto_85066 ?auto_85070 ) ) ( not ( = ?auto_85064 ?auto_85062 ) ) ( not ( = ?auto_85061 ?auto_85062 ) ) ( not ( = ?auto_85065 ?auto_85062 ) ) ( not ( = ?auto_85063 ?auto_85062 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85064 ?auto_85061 ?auto_85065 ?auto_85062 ?auto_85063 ?auto_85060 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85167 - OBJ
      ?auto_85168 - OBJ
      ?auto_85169 - OBJ
      ?auto_85170 - OBJ
      ?auto_85171 - OBJ
      ?auto_85166 - LOCATION
    )
    :vars
    (
      ?auto_85176 - LOCATION
      ?auto_85173 - CITY
      ?auto_85172 - LOCATION
      ?auto_85174 - LOCATION
      ?auto_85175 - LOCATION
      ?auto_85177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85176 ?auto_85173 ) ( IN-CITY ?auto_85166 ?auto_85173 ) ( not ( = ?auto_85166 ?auto_85176 ) ) ( OBJ-AT ?auto_85168 ?auto_85176 ) ( IN-CITY ?auto_85172 ?auto_85173 ) ( not ( = ?auto_85166 ?auto_85172 ) ) ( OBJ-AT ?auto_85169 ?auto_85172 ) ( IN-CITY ?auto_85174 ?auto_85173 ) ( not ( = ?auto_85166 ?auto_85174 ) ) ( OBJ-AT ?auto_85170 ?auto_85174 ) ( IN-CITY ?auto_85175 ?auto_85173 ) ( not ( = ?auto_85166 ?auto_85175 ) ) ( OBJ-AT ?auto_85167 ?auto_85175 ) ( OBJ-AT ?auto_85171 ?auto_85176 ) ( TRUCK-AT ?auto_85177 ?auto_85166 ) ( not ( = ?auto_85171 ?auto_85167 ) ) ( not ( = ?auto_85175 ?auto_85176 ) ) ( not ( = ?auto_85171 ?auto_85170 ) ) ( not ( = ?auto_85167 ?auto_85170 ) ) ( not ( = ?auto_85174 ?auto_85175 ) ) ( not ( = ?auto_85174 ?auto_85176 ) ) ( not ( = ?auto_85171 ?auto_85169 ) ) ( not ( = ?auto_85167 ?auto_85169 ) ) ( not ( = ?auto_85170 ?auto_85169 ) ) ( not ( = ?auto_85172 ?auto_85174 ) ) ( not ( = ?auto_85172 ?auto_85175 ) ) ( not ( = ?auto_85172 ?auto_85176 ) ) ( not ( = ?auto_85171 ?auto_85168 ) ) ( not ( = ?auto_85167 ?auto_85168 ) ) ( not ( = ?auto_85170 ?auto_85168 ) ) ( not ( = ?auto_85169 ?auto_85168 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85171 ?auto_85167 ?auto_85170 ?auto_85168 ?auto_85169 ?auto_85166 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85876 - OBJ
      ?auto_85877 - OBJ
      ?auto_85878 - OBJ
      ?auto_85879 - OBJ
      ?auto_85880 - OBJ
      ?auto_85875 - LOCATION
    )
    :vars
    (
      ?auto_85885 - LOCATION
      ?auto_85882 - CITY
      ?auto_85881 - LOCATION
      ?auto_85883 - LOCATION
      ?auto_85884 - LOCATION
      ?auto_85886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85885 ?auto_85882 ) ( IN-CITY ?auto_85875 ?auto_85882 ) ( not ( = ?auto_85875 ?auto_85885 ) ) ( OBJ-AT ?auto_85880 ?auto_85885 ) ( IN-CITY ?auto_85881 ?auto_85882 ) ( not ( = ?auto_85875 ?auto_85881 ) ) ( OBJ-AT ?auto_85879 ?auto_85881 ) ( IN-CITY ?auto_85883 ?auto_85882 ) ( not ( = ?auto_85875 ?auto_85883 ) ) ( OBJ-AT ?auto_85876 ?auto_85883 ) ( IN-CITY ?auto_85884 ?auto_85882 ) ( not ( = ?auto_85875 ?auto_85884 ) ) ( OBJ-AT ?auto_85878 ?auto_85884 ) ( OBJ-AT ?auto_85877 ?auto_85885 ) ( TRUCK-AT ?auto_85886 ?auto_85875 ) ( not ( = ?auto_85877 ?auto_85878 ) ) ( not ( = ?auto_85884 ?auto_85885 ) ) ( not ( = ?auto_85877 ?auto_85876 ) ) ( not ( = ?auto_85878 ?auto_85876 ) ) ( not ( = ?auto_85883 ?auto_85884 ) ) ( not ( = ?auto_85883 ?auto_85885 ) ) ( not ( = ?auto_85877 ?auto_85879 ) ) ( not ( = ?auto_85878 ?auto_85879 ) ) ( not ( = ?auto_85876 ?auto_85879 ) ) ( not ( = ?auto_85881 ?auto_85883 ) ) ( not ( = ?auto_85881 ?auto_85884 ) ) ( not ( = ?auto_85881 ?auto_85885 ) ) ( not ( = ?auto_85877 ?auto_85880 ) ) ( not ( = ?auto_85878 ?auto_85880 ) ) ( not ( = ?auto_85876 ?auto_85880 ) ) ( not ( = ?auto_85879 ?auto_85880 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85877 ?auto_85878 ?auto_85876 ?auto_85880 ?auto_85879 ?auto_85875 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_85927 - OBJ
      ?auto_85928 - OBJ
      ?auto_85929 - OBJ
      ?auto_85930 - OBJ
      ?auto_85931 - OBJ
      ?auto_85926 - LOCATION
    )
    :vars
    (
      ?auto_85936 - LOCATION
      ?auto_85933 - CITY
      ?auto_85932 - LOCATION
      ?auto_85934 - LOCATION
      ?auto_85935 - LOCATION
      ?auto_85937 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_85936 ?auto_85933 ) ( IN-CITY ?auto_85926 ?auto_85933 ) ( not ( = ?auto_85926 ?auto_85936 ) ) ( OBJ-AT ?auto_85930 ?auto_85936 ) ( IN-CITY ?auto_85932 ?auto_85933 ) ( not ( = ?auto_85926 ?auto_85932 ) ) ( OBJ-AT ?auto_85931 ?auto_85932 ) ( IN-CITY ?auto_85934 ?auto_85933 ) ( not ( = ?auto_85926 ?auto_85934 ) ) ( OBJ-AT ?auto_85927 ?auto_85934 ) ( IN-CITY ?auto_85935 ?auto_85933 ) ( not ( = ?auto_85926 ?auto_85935 ) ) ( OBJ-AT ?auto_85929 ?auto_85935 ) ( OBJ-AT ?auto_85928 ?auto_85936 ) ( TRUCK-AT ?auto_85937 ?auto_85926 ) ( not ( = ?auto_85928 ?auto_85929 ) ) ( not ( = ?auto_85935 ?auto_85936 ) ) ( not ( = ?auto_85928 ?auto_85927 ) ) ( not ( = ?auto_85929 ?auto_85927 ) ) ( not ( = ?auto_85934 ?auto_85935 ) ) ( not ( = ?auto_85934 ?auto_85936 ) ) ( not ( = ?auto_85928 ?auto_85931 ) ) ( not ( = ?auto_85929 ?auto_85931 ) ) ( not ( = ?auto_85927 ?auto_85931 ) ) ( not ( = ?auto_85932 ?auto_85934 ) ) ( not ( = ?auto_85932 ?auto_85935 ) ) ( not ( = ?auto_85932 ?auto_85936 ) ) ( not ( = ?auto_85928 ?auto_85930 ) ) ( not ( = ?auto_85929 ?auto_85930 ) ) ( not ( = ?auto_85927 ?auto_85930 ) ) ( not ( = ?auto_85931 ?auto_85930 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_85928 ?auto_85929 ?auto_85927 ?auto_85930 ?auto_85931 ?auto_85926 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86087 - OBJ
      ?auto_86088 - OBJ
      ?auto_86089 - OBJ
      ?auto_86090 - OBJ
      ?auto_86091 - OBJ
      ?auto_86086 - LOCATION
    )
    :vars
    (
      ?auto_86096 - LOCATION
      ?auto_86093 - CITY
      ?auto_86092 - LOCATION
      ?auto_86094 - LOCATION
      ?auto_86095 - LOCATION
      ?auto_86097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86096 ?auto_86093 ) ( IN-CITY ?auto_86086 ?auto_86093 ) ( not ( = ?auto_86086 ?auto_86096 ) ) ( OBJ-AT ?auto_86091 ?auto_86096 ) ( IN-CITY ?auto_86092 ?auto_86093 ) ( not ( = ?auto_86086 ?auto_86092 ) ) ( OBJ-AT ?auto_86089 ?auto_86092 ) ( IN-CITY ?auto_86094 ?auto_86093 ) ( not ( = ?auto_86086 ?auto_86094 ) ) ( OBJ-AT ?auto_86087 ?auto_86094 ) ( IN-CITY ?auto_86095 ?auto_86093 ) ( not ( = ?auto_86086 ?auto_86095 ) ) ( OBJ-AT ?auto_86090 ?auto_86095 ) ( OBJ-AT ?auto_86088 ?auto_86096 ) ( TRUCK-AT ?auto_86097 ?auto_86086 ) ( not ( = ?auto_86088 ?auto_86090 ) ) ( not ( = ?auto_86095 ?auto_86096 ) ) ( not ( = ?auto_86088 ?auto_86087 ) ) ( not ( = ?auto_86090 ?auto_86087 ) ) ( not ( = ?auto_86094 ?auto_86095 ) ) ( not ( = ?auto_86094 ?auto_86096 ) ) ( not ( = ?auto_86088 ?auto_86089 ) ) ( not ( = ?auto_86090 ?auto_86089 ) ) ( not ( = ?auto_86087 ?auto_86089 ) ) ( not ( = ?auto_86092 ?auto_86094 ) ) ( not ( = ?auto_86092 ?auto_86095 ) ) ( not ( = ?auto_86092 ?auto_86096 ) ) ( not ( = ?auto_86088 ?auto_86091 ) ) ( not ( = ?auto_86090 ?auto_86091 ) ) ( not ( = ?auto_86087 ?auto_86091 ) ) ( not ( = ?auto_86089 ?auto_86091 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86088 ?auto_86090 ?auto_86087 ?auto_86091 ?auto_86089 ?auto_86086 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86138 - OBJ
      ?auto_86139 - OBJ
      ?auto_86140 - OBJ
      ?auto_86141 - OBJ
      ?auto_86142 - OBJ
      ?auto_86137 - LOCATION
    )
    :vars
    (
      ?auto_86147 - LOCATION
      ?auto_86144 - CITY
      ?auto_86143 - LOCATION
      ?auto_86145 - LOCATION
      ?auto_86146 - LOCATION
      ?auto_86148 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86147 ?auto_86144 ) ( IN-CITY ?auto_86137 ?auto_86144 ) ( not ( = ?auto_86137 ?auto_86147 ) ) ( OBJ-AT ?auto_86141 ?auto_86147 ) ( IN-CITY ?auto_86143 ?auto_86144 ) ( not ( = ?auto_86137 ?auto_86143 ) ) ( OBJ-AT ?auto_86140 ?auto_86143 ) ( IN-CITY ?auto_86145 ?auto_86144 ) ( not ( = ?auto_86137 ?auto_86145 ) ) ( OBJ-AT ?auto_86138 ?auto_86145 ) ( IN-CITY ?auto_86146 ?auto_86144 ) ( not ( = ?auto_86137 ?auto_86146 ) ) ( OBJ-AT ?auto_86142 ?auto_86146 ) ( OBJ-AT ?auto_86139 ?auto_86147 ) ( TRUCK-AT ?auto_86148 ?auto_86137 ) ( not ( = ?auto_86139 ?auto_86142 ) ) ( not ( = ?auto_86146 ?auto_86147 ) ) ( not ( = ?auto_86139 ?auto_86138 ) ) ( not ( = ?auto_86142 ?auto_86138 ) ) ( not ( = ?auto_86145 ?auto_86146 ) ) ( not ( = ?auto_86145 ?auto_86147 ) ) ( not ( = ?auto_86139 ?auto_86140 ) ) ( not ( = ?auto_86142 ?auto_86140 ) ) ( not ( = ?auto_86138 ?auto_86140 ) ) ( not ( = ?auto_86143 ?auto_86145 ) ) ( not ( = ?auto_86143 ?auto_86146 ) ) ( not ( = ?auto_86143 ?auto_86147 ) ) ( not ( = ?auto_86139 ?auto_86141 ) ) ( not ( = ?auto_86142 ?auto_86141 ) ) ( not ( = ?auto_86138 ?auto_86141 ) ) ( not ( = ?auto_86140 ?auto_86141 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86139 ?auto_86142 ?auto_86138 ?auto_86141 ?auto_86140 ?auto_86137 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86296 - OBJ
      ?auto_86297 - OBJ
      ?auto_86298 - OBJ
      ?auto_86299 - OBJ
      ?auto_86300 - OBJ
      ?auto_86295 - LOCATION
    )
    :vars
    (
      ?auto_86305 - LOCATION
      ?auto_86302 - CITY
      ?auto_86301 - LOCATION
      ?auto_86303 - LOCATION
      ?auto_86304 - LOCATION
      ?auto_86306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86305 ?auto_86302 ) ( IN-CITY ?auto_86295 ?auto_86302 ) ( not ( = ?auto_86295 ?auto_86305 ) ) ( OBJ-AT ?auto_86298 ?auto_86305 ) ( IN-CITY ?auto_86301 ?auto_86302 ) ( not ( = ?auto_86295 ?auto_86301 ) ) ( OBJ-AT ?auto_86300 ?auto_86301 ) ( IN-CITY ?auto_86303 ?auto_86302 ) ( not ( = ?auto_86295 ?auto_86303 ) ) ( OBJ-AT ?auto_86296 ?auto_86303 ) ( IN-CITY ?auto_86304 ?auto_86302 ) ( not ( = ?auto_86295 ?auto_86304 ) ) ( OBJ-AT ?auto_86299 ?auto_86304 ) ( OBJ-AT ?auto_86297 ?auto_86305 ) ( TRUCK-AT ?auto_86306 ?auto_86295 ) ( not ( = ?auto_86297 ?auto_86299 ) ) ( not ( = ?auto_86304 ?auto_86305 ) ) ( not ( = ?auto_86297 ?auto_86296 ) ) ( not ( = ?auto_86299 ?auto_86296 ) ) ( not ( = ?auto_86303 ?auto_86304 ) ) ( not ( = ?auto_86303 ?auto_86305 ) ) ( not ( = ?auto_86297 ?auto_86300 ) ) ( not ( = ?auto_86299 ?auto_86300 ) ) ( not ( = ?auto_86296 ?auto_86300 ) ) ( not ( = ?auto_86301 ?auto_86303 ) ) ( not ( = ?auto_86301 ?auto_86304 ) ) ( not ( = ?auto_86301 ?auto_86305 ) ) ( not ( = ?auto_86297 ?auto_86298 ) ) ( not ( = ?auto_86299 ?auto_86298 ) ) ( not ( = ?auto_86296 ?auto_86298 ) ) ( not ( = ?auto_86300 ?auto_86298 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86297 ?auto_86299 ?auto_86296 ?auto_86298 ?auto_86300 ?auto_86295 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86402 - OBJ
      ?auto_86403 - OBJ
      ?auto_86404 - OBJ
      ?auto_86405 - OBJ
      ?auto_86406 - OBJ
      ?auto_86401 - LOCATION
    )
    :vars
    (
      ?auto_86411 - LOCATION
      ?auto_86408 - CITY
      ?auto_86407 - LOCATION
      ?auto_86409 - LOCATION
      ?auto_86410 - LOCATION
      ?auto_86412 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86411 ?auto_86408 ) ( IN-CITY ?auto_86401 ?auto_86408 ) ( not ( = ?auto_86401 ?auto_86411 ) ) ( OBJ-AT ?auto_86404 ?auto_86411 ) ( IN-CITY ?auto_86407 ?auto_86408 ) ( not ( = ?auto_86401 ?auto_86407 ) ) ( OBJ-AT ?auto_86405 ?auto_86407 ) ( IN-CITY ?auto_86409 ?auto_86408 ) ( not ( = ?auto_86401 ?auto_86409 ) ) ( OBJ-AT ?auto_86402 ?auto_86409 ) ( IN-CITY ?auto_86410 ?auto_86408 ) ( not ( = ?auto_86401 ?auto_86410 ) ) ( OBJ-AT ?auto_86406 ?auto_86410 ) ( OBJ-AT ?auto_86403 ?auto_86411 ) ( TRUCK-AT ?auto_86412 ?auto_86401 ) ( not ( = ?auto_86403 ?auto_86406 ) ) ( not ( = ?auto_86410 ?auto_86411 ) ) ( not ( = ?auto_86403 ?auto_86402 ) ) ( not ( = ?auto_86406 ?auto_86402 ) ) ( not ( = ?auto_86409 ?auto_86410 ) ) ( not ( = ?auto_86409 ?auto_86411 ) ) ( not ( = ?auto_86403 ?auto_86405 ) ) ( not ( = ?auto_86406 ?auto_86405 ) ) ( not ( = ?auto_86402 ?auto_86405 ) ) ( not ( = ?auto_86407 ?auto_86409 ) ) ( not ( = ?auto_86407 ?auto_86410 ) ) ( not ( = ?auto_86407 ?auto_86411 ) ) ( not ( = ?auto_86403 ?auto_86404 ) ) ( not ( = ?auto_86406 ?auto_86404 ) ) ( not ( = ?auto_86402 ?auto_86404 ) ) ( not ( = ?auto_86405 ?auto_86404 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86403 ?auto_86406 ?auto_86402 ?auto_86404 ?auto_86405 ?auto_86401 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86560 - OBJ
      ?auto_86561 - OBJ
      ?auto_86562 - OBJ
      ?auto_86563 - OBJ
      ?auto_86564 - OBJ
      ?auto_86559 - LOCATION
    )
    :vars
    (
      ?auto_86569 - LOCATION
      ?auto_86566 - CITY
      ?auto_86565 - LOCATION
      ?auto_86567 - LOCATION
      ?auto_86568 - LOCATION
      ?auto_86570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86569 ?auto_86566 ) ( IN-CITY ?auto_86559 ?auto_86566 ) ( not ( = ?auto_86559 ?auto_86569 ) ) ( OBJ-AT ?auto_86564 ?auto_86569 ) ( IN-CITY ?auto_86565 ?auto_86566 ) ( not ( = ?auto_86559 ?auto_86565 ) ) ( OBJ-AT ?auto_86563 ?auto_86565 ) ( IN-CITY ?auto_86567 ?auto_86566 ) ( not ( = ?auto_86559 ?auto_86567 ) ) ( OBJ-AT ?auto_86560 ?auto_86567 ) ( IN-CITY ?auto_86568 ?auto_86566 ) ( not ( = ?auto_86559 ?auto_86568 ) ) ( OBJ-AT ?auto_86561 ?auto_86568 ) ( OBJ-AT ?auto_86562 ?auto_86569 ) ( TRUCK-AT ?auto_86570 ?auto_86559 ) ( not ( = ?auto_86562 ?auto_86561 ) ) ( not ( = ?auto_86568 ?auto_86569 ) ) ( not ( = ?auto_86562 ?auto_86560 ) ) ( not ( = ?auto_86561 ?auto_86560 ) ) ( not ( = ?auto_86567 ?auto_86568 ) ) ( not ( = ?auto_86567 ?auto_86569 ) ) ( not ( = ?auto_86562 ?auto_86563 ) ) ( not ( = ?auto_86561 ?auto_86563 ) ) ( not ( = ?auto_86560 ?auto_86563 ) ) ( not ( = ?auto_86565 ?auto_86567 ) ) ( not ( = ?auto_86565 ?auto_86568 ) ) ( not ( = ?auto_86565 ?auto_86569 ) ) ( not ( = ?auto_86562 ?auto_86564 ) ) ( not ( = ?auto_86561 ?auto_86564 ) ) ( not ( = ?auto_86560 ?auto_86564 ) ) ( not ( = ?auto_86563 ?auto_86564 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86562 ?auto_86561 ?auto_86560 ?auto_86564 ?auto_86563 ?auto_86559 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86611 - OBJ
      ?auto_86612 - OBJ
      ?auto_86613 - OBJ
      ?auto_86614 - OBJ
      ?auto_86615 - OBJ
      ?auto_86610 - LOCATION
    )
    :vars
    (
      ?auto_86620 - LOCATION
      ?auto_86617 - CITY
      ?auto_86616 - LOCATION
      ?auto_86618 - LOCATION
      ?auto_86619 - LOCATION
      ?auto_86621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86620 ?auto_86617 ) ( IN-CITY ?auto_86610 ?auto_86617 ) ( not ( = ?auto_86610 ?auto_86620 ) ) ( OBJ-AT ?auto_86614 ?auto_86620 ) ( IN-CITY ?auto_86616 ?auto_86617 ) ( not ( = ?auto_86610 ?auto_86616 ) ) ( OBJ-AT ?auto_86615 ?auto_86616 ) ( IN-CITY ?auto_86618 ?auto_86617 ) ( not ( = ?auto_86610 ?auto_86618 ) ) ( OBJ-AT ?auto_86611 ?auto_86618 ) ( IN-CITY ?auto_86619 ?auto_86617 ) ( not ( = ?auto_86610 ?auto_86619 ) ) ( OBJ-AT ?auto_86612 ?auto_86619 ) ( OBJ-AT ?auto_86613 ?auto_86620 ) ( TRUCK-AT ?auto_86621 ?auto_86610 ) ( not ( = ?auto_86613 ?auto_86612 ) ) ( not ( = ?auto_86619 ?auto_86620 ) ) ( not ( = ?auto_86613 ?auto_86611 ) ) ( not ( = ?auto_86612 ?auto_86611 ) ) ( not ( = ?auto_86618 ?auto_86619 ) ) ( not ( = ?auto_86618 ?auto_86620 ) ) ( not ( = ?auto_86613 ?auto_86615 ) ) ( not ( = ?auto_86612 ?auto_86615 ) ) ( not ( = ?auto_86611 ?auto_86615 ) ) ( not ( = ?auto_86616 ?auto_86618 ) ) ( not ( = ?auto_86616 ?auto_86619 ) ) ( not ( = ?auto_86616 ?auto_86620 ) ) ( not ( = ?auto_86613 ?auto_86614 ) ) ( not ( = ?auto_86612 ?auto_86614 ) ) ( not ( = ?auto_86611 ?auto_86614 ) ) ( not ( = ?auto_86615 ?auto_86614 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86613 ?auto_86612 ?auto_86611 ?auto_86614 ?auto_86615 ?auto_86610 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86880 - OBJ
      ?auto_86881 - OBJ
      ?auto_86882 - OBJ
      ?auto_86883 - OBJ
      ?auto_86884 - OBJ
      ?auto_86879 - LOCATION
    )
    :vars
    (
      ?auto_86889 - LOCATION
      ?auto_86886 - CITY
      ?auto_86885 - LOCATION
      ?auto_86887 - LOCATION
      ?auto_86888 - LOCATION
      ?auto_86890 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86889 ?auto_86886 ) ( IN-CITY ?auto_86879 ?auto_86886 ) ( not ( = ?auto_86879 ?auto_86889 ) ) ( OBJ-AT ?auto_86884 ?auto_86889 ) ( IN-CITY ?auto_86885 ?auto_86886 ) ( not ( = ?auto_86879 ?auto_86885 ) ) ( OBJ-AT ?auto_86882 ?auto_86885 ) ( IN-CITY ?auto_86887 ?auto_86886 ) ( not ( = ?auto_86879 ?auto_86887 ) ) ( OBJ-AT ?auto_86880 ?auto_86887 ) ( IN-CITY ?auto_86888 ?auto_86886 ) ( not ( = ?auto_86879 ?auto_86888 ) ) ( OBJ-AT ?auto_86881 ?auto_86888 ) ( OBJ-AT ?auto_86883 ?auto_86889 ) ( TRUCK-AT ?auto_86890 ?auto_86879 ) ( not ( = ?auto_86883 ?auto_86881 ) ) ( not ( = ?auto_86888 ?auto_86889 ) ) ( not ( = ?auto_86883 ?auto_86880 ) ) ( not ( = ?auto_86881 ?auto_86880 ) ) ( not ( = ?auto_86887 ?auto_86888 ) ) ( not ( = ?auto_86887 ?auto_86889 ) ) ( not ( = ?auto_86883 ?auto_86882 ) ) ( not ( = ?auto_86881 ?auto_86882 ) ) ( not ( = ?auto_86880 ?auto_86882 ) ) ( not ( = ?auto_86885 ?auto_86887 ) ) ( not ( = ?auto_86885 ?auto_86888 ) ) ( not ( = ?auto_86885 ?auto_86889 ) ) ( not ( = ?auto_86883 ?auto_86884 ) ) ( not ( = ?auto_86881 ?auto_86884 ) ) ( not ( = ?auto_86880 ?auto_86884 ) ) ( not ( = ?auto_86882 ?auto_86884 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86883 ?auto_86881 ?auto_86880 ?auto_86884 ?auto_86882 ?auto_86879 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_86931 - OBJ
      ?auto_86932 - OBJ
      ?auto_86933 - OBJ
      ?auto_86934 - OBJ
      ?auto_86935 - OBJ
      ?auto_86930 - LOCATION
    )
    :vars
    (
      ?auto_86940 - LOCATION
      ?auto_86937 - CITY
      ?auto_86936 - LOCATION
      ?auto_86938 - LOCATION
      ?auto_86939 - LOCATION
      ?auto_86941 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_86940 ?auto_86937 ) ( IN-CITY ?auto_86930 ?auto_86937 ) ( not ( = ?auto_86930 ?auto_86940 ) ) ( OBJ-AT ?auto_86934 ?auto_86940 ) ( IN-CITY ?auto_86936 ?auto_86937 ) ( not ( = ?auto_86930 ?auto_86936 ) ) ( OBJ-AT ?auto_86933 ?auto_86936 ) ( IN-CITY ?auto_86938 ?auto_86937 ) ( not ( = ?auto_86930 ?auto_86938 ) ) ( OBJ-AT ?auto_86931 ?auto_86938 ) ( IN-CITY ?auto_86939 ?auto_86937 ) ( not ( = ?auto_86930 ?auto_86939 ) ) ( OBJ-AT ?auto_86932 ?auto_86939 ) ( OBJ-AT ?auto_86935 ?auto_86940 ) ( TRUCK-AT ?auto_86941 ?auto_86930 ) ( not ( = ?auto_86935 ?auto_86932 ) ) ( not ( = ?auto_86939 ?auto_86940 ) ) ( not ( = ?auto_86935 ?auto_86931 ) ) ( not ( = ?auto_86932 ?auto_86931 ) ) ( not ( = ?auto_86938 ?auto_86939 ) ) ( not ( = ?auto_86938 ?auto_86940 ) ) ( not ( = ?auto_86935 ?auto_86933 ) ) ( not ( = ?auto_86932 ?auto_86933 ) ) ( not ( = ?auto_86931 ?auto_86933 ) ) ( not ( = ?auto_86936 ?auto_86938 ) ) ( not ( = ?auto_86936 ?auto_86939 ) ) ( not ( = ?auto_86936 ?auto_86940 ) ) ( not ( = ?auto_86935 ?auto_86934 ) ) ( not ( = ?auto_86932 ?auto_86934 ) ) ( not ( = ?auto_86931 ?auto_86934 ) ) ( not ( = ?auto_86933 ?auto_86934 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_86935 ?auto_86932 ?auto_86931 ?auto_86934 ?auto_86933 ?auto_86930 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87034 - OBJ
      ?auto_87035 - OBJ
      ?auto_87036 - OBJ
      ?auto_87037 - OBJ
      ?auto_87038 - OBJ
      ?auto_87033 - LOCATION
    )
    :vars
    (
      ?auto_87043 - LOCATION
      ?auto_87040 - CITY
      ?auto_87039 - LOCATION
      ?auto_87041 - LOCATION
      ?auto_87042 - LOCATION
      ?auto_87044 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87043 ?auto_87040 ) ( IN-CITY ?auto_87033 ?auto_87040 ) ( not ( = ?auto_87033 ?auto_87043 ) ) ( OBJ-AT ?auto_87036 ?auto_87043 ) ( IN-CITY ?auto_87039 ?auto_87040 ) ( not ( = ?auto_87033 ?auto_87039 ) ) ( OBJ-AT ?auto_87038 ?auto_87039 ) ( IN-CITY ?auto_87041 ?auto_87040 ) ( not ( = ?auto_87033 ?auto_87041 ) ) ( OBJ-AT ?auto_87034 ?auto_87041 ) ( IN-CITY ?auto_87042 ?auto_87040 ) ( not ( = ?auto_87033 ?auto_87042 ) ) ( OBJ-AT ?auto_87035 ?auto_87042 ) ( OBJ-AT ?auto_87037 ?auto_87043 ) ( TRUCK-AT ?auto_87044 ?auto_87033 ) ( not ( = ?auto_87037 ?auto_87035 ) ) ( not ( = ?auto_87042 ?auto_87043 ) ) ( not ( = ?auto_87037 ?auto_87034 ) ) ( not ( = ?auto_87035 ?auto_87034 ) ) ( not ( = ?auto_87041 ?auto_87042 ) ) ( not ( = ?auto_87041 ?auto_87043 ) ) ( not ( = ?auto_87037 ?auto_87038 ) ) ( not ( = ?auto_87035 ?auto_87038 ) ) ( not ( = ?auto_87034 ?auto_87038 ) ) ( not ( = ?auto_87039 ?auto_87041 ) ) ( not ( = ?auto_87039 ?auto_87042 ) ) ( not ( = ?auto_87039 ?auto_87043 ) ) ( not ( = ?auto_87037 ?auto_87036 ) ) ( not ( = ?auto_87035 ?auto_87036 ) ) ( not ( = ?auto_87034 ?auto_87036 ) ) ( not ( = ?auto_87038 ?auto_87036 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87037 ?auto_87035 ?auto_87034 ?auto_87036 ?auto_87038 ?auto_87033 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_87195 - OBJ
      ?auto_87196 - OBJ
      ?auto_87197 - OBJ
      ?auto_87198 - OBJ
      ?auto_87199 - OBJ
      ?auto_87194 - LOCATION
    )
    :vars
    (
      ?auto_87204 - LOCATION
      ?auto_87201 - CITY
      ?auto_87200 - LOCATION
      ?auto_87202 - LOCATION
      ?auto_87203 - LOCATION
      ?auto_87205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87204 ?auto_87201 ) ( IN-CITY ?auto_87194 ?auto_87201 ) ( not ( = ?auto_87194 ?auto_87204 ) ) ( OBJ-AT ?auto_87197 ?auto_87204 ) ( IN-CITY ?auto_87200 ?auto_87201 ) ( not ( = ?auto_87194 ?auto_87200 ) ) ( OBJ-AT ?auto_87198 ?auto_87200 ) ( IN-CITY ?auto_87202 ?auto_87201 ) ( not ( = ?auto_87194 ?auto_87202 ) ) ( OBJ-AT ?auto_87195 ?auto_87202 ) ( IN-CITY ?auto_87203 ?auto_87201 ) ( not ( = ?auto_87194 ?auto_87203 ) ) ( OBJ-AT ?auto_87196 ?auto_87203 ) ( OBJ-AT ?auto_87199 ?auto_87204 ) ( TRUCK-AT ?auto_87205 ?auto_87194 ) ( not ( = ?auto_87199 ?auto_87196 ) ) ( not ( = ?auto_87203 ?auto_87204 ) ) ( not ( = ?auto_87199 ?auto_87195 ) ) ( not ( = ?auto_87196 ?auto_87195 ) ) ( not ( = ?auto_87202 ?auto_87203 ) ) ( not ( = ?auto_87202 ?auto_87204 ) ) ( not ( = ?auto_87199 ?auto_87198 ) ) ( not ( = ?auto_87196 ?auto_87198 ) ) ( not ( = ?auto_87195 ?auto_87198 ) ) ( not ( = ?auto_87200 ?auto_87202 ) ) ( not ( = ?auto_87200 ?auto_87203 ) ) ( not ( = ?auto_87200 ?auto_87204 ) ) ( not ( = ?auto_87199 ?auto_87197 ) ) ( not ( = ?auto_87196 ?auto_87197 ) ) ( not ( = ?auto_87195 ?auto_87197 ) ) ( not ( = ?auto_87198 ?auto_87197 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_87199 ?auto_87196 ?auto_87195 ?auto_87197 ?auto_87198 ?auto_87194 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88183 - OBJ
      ?auto_88184 - OBJ
      ?auto_88185 - OBJ
      ?auto_88186 - OBJ
      ?auto_88187 - OBJ
      ?auto_88182 - LOCATION
    )
    :vars
    (
      ?auto_88192 - LOCATION
      ?auto_88189 - CITY
      ?auto_88188 - LOCATION
      ?auto_88190 - LOCATION
      ?auto_88191 - LOCATION
      ?auto_88193 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88192 ?auto_88189 ) ( IN-CITY ?auto_88182 ?auto_88189 ) ( not ( = ?auto_88182 ?auto_88192 ) ) ( OBJ-AT ?auto_88187 ?auto_88192 ) ( IN-CITY ?auto_88188 ?auto_88189 ) ( not ( = ?auto_88182 ?auto_88188 ) ) ( OBJ-AT ?auto_88184 ?auto_88188 ) ( IN-CITY ?auto_88190 ?auto_88189 ) ( not ( = ?auto_88182 ?auto_88190 ) ) ( OBJ-AT ?auto_88183 ?auto_88190 ) ( IN-CITY ?auto_88191 ?auto_88189 ) ( not ( = ?auto_88182 ?auto_88191 ) ) ( OBJ-AT ?auto_88186 ?auto_88191 ) ( OBJ-AT ?auto_88185 ?auto_88192 ) ( TRUCK-AT ?auto_88193 ?auto_88182 ) ( not ( = ?auto_88185 ?auto_88186 ) ) ( not ( = ?auto_88191 ?auto_88192 ) ) ( not ( = ?auto_88185 ?auto_88183 ) ) ( not ( = ?auto_88186 ?auto_88183 ) ) ( not ( = ?auto_88190 ?auto_88191 ) ) ( not ( = ?auto_88190 ?auto_88192 ) ) ( not ( = ?auto_88185 ?auto_88184 ) ) ( not ( = ?auto_88186 ?auto_88184 ) ) ( not ( = ?auto_88183 ?auto_88184 ) ) ( not ( = ?auto_88188 ?auto_88190 ) ) ( not ( = ?auto_88188 ?auto_88191 ) ) ( not ( = ?auto_88188 ?auto_88192 ) ) ( not ( = ?auto_88185 ?auto_88187 ) ) ( not ( = ?auto_88186 ?auto_88187 ) ) ( not ( = ?auto_88183 ?auto_88187 ) ) ( not ( = ?auto_88184 ?auto_88187 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88185 ?auto_88186 ?auto_88183 ?auto_88187 ?auto_88184 ?auto_88182 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88234 - OBJ
      ?auto_88235 - OBJ
      ?auto_88236 - OBJ
      ?auto_88237 - OBJ
      ?auto_88238 - OBJ
      ?auto_88233 - LOCATION
    )
    :vars
    (
      ?auto_88243 - LOCATION
      ?auto_88240 - CITY
      ?auto_88239 - LOCATION
      ?auto_88241 - LOCATION
      ?auto_88242 - LOCATION
      ?auto_88244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88243 ?auto_88240 ) ( IN-CITY ?auto_88233 ?auto_88240 ) ( not ( = ?auto_88233 ?auto_88243 ) ) ( OBJ-AT ?auto_88237 ?auto_88243 ) ( IN-CITY ?auto_88239 ?auto_88240 ) ( not ( = ?auto_88233 ?auto_88239 ) ) ( OBJ-AT ?auto_88235 ?auto_88239 ) ( IN-CITY ?auto_88241 ?auto_88240 ) ( not ( = ?auto_88233 ?auto_88241 ) ) ( OBJ-AT ?auto_88234 ?auto_88241 ) ( IN-CITY ?auto_88242 ?auto_88240 ) ( not ( = ?auto_88233 ?auto_88242 ) ) ( OBJ-AT ?auto_88238 ?auto_88242 ) ( OBJ-AT ?auto_88236 ?auto_88243 ) ( TRUCK-AT ?auto_88244 ?auto_88233 ) ( not ( = ?auto_88236 ?auto_88238 ) ) ( not ( = ?auto_88242 ?auto_88243 ) ) ( not ( = ?auto_88236 ?auto_88234 ) ) ( not ( = ?auto_88238 ?auto_88234 ) ) ( not ( = ?auto_88241 ?auto_88242 ) ) ( not ( = ?auto_88241 ?auto_88243 ) ) ( not ( = ?auto_88236 ?auto_88235 ) ) ( not ( = ?auto_88238 ?auto_88235 ) ) ( not ( = ?auto_88234 ?auto_88235 ) ) ( not ( = ?auto_88239 ?auto_88241 ) ) ( not ( = ?auto_88239 ?auto_88242 ) ) ( not ( = ?auto_88239 ?auto_88243 ) ) ( not ( = ?auto_88236 ?auto_88237 ) ) ( not ( = ?auto_88238 ?auto_88237 ) ) ( not ( = ?auto_88234 ?auto_88237 ) ) ( not ( = ?auto_88235 ?auto_88237 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88236 ?auto_88238 ?auto_88234 ?auto_88237 ?auto_88235 ?auto_88233 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88285 - OBJ
      ?auto_88286 - OBJ
      ?auto_88287 - OBJ
      ?auto_88288 - OBJ
      ?auto_88289 - OBJ
      ?auto_88284 - LOCATION
    )
    :vars
    (
      ?auto_88294 - LOCATION
      ?auto_88291 - CITY
      ?auto_88290 - LOCATION
      ?auto_88292 - LOCATION
      ?auto_88293 - LOCATION
      ?auto_88295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88294 ?auto_88291 ) ( IN-CITY ?auto_88284 ?auto_88291 ) ( not ( = ?auto_88284 ?auto_88294 ) ) ( OBJ-AT ?auto_88289 ?auto_88294 ) ( IN-CITY ?auto_88290 ?auto_88291 ) ( not ( = ?auto_88284 ?auto_88290 ) ) ( OBJ-AT ?auto_88286 ?auto_88290 ) ( IN-CITY ?auto_88292 ?auto_88291 ) ( not ( = ?auto_88284 ?auto_88292 ) ) ( OBJ-AT ?auto_88285 ?auto_88292 ) ( IN-CITY ?auto_88293 ?auto_88291 ) ( not ( = ?auto_88284 ?auto_88293 ) ) ( OBJ-AT ?auto_88287 ?auto_88293 ) ( OBJ-AT ?auto_88288 ?auto_88294 ) ( TRUCK-AT ?auto_88295 ?auto_88284 ) ( not ( = ?auto_88288 ?auto_88287 ) ) ( not ( = ?auto_88293 ?auto_88294 ) ) ( not ( = ?auto_88288 ?auto_88285 ) ) ( not ( = ?auto_88287 ?auto_88285 ) ) ( not ( = ?auto_88292 ?auto_88293 ) ) ( not ( = ?auto_88292 ?auto_88294 ) ) ( not ( = ?auto_88288 ?auto_88286 ) ) ( not ( = ?auto_88287 ?auto_88286 ) ) ( not ( = ?auto_88285 ?auto_88286 ) ) ( not ( = ?auto_88290 ?auto_88292 ) ) ( not ( = ?auto_88290 ?auto_88293 ) ) ( not ( = ?auto_88290 ?auto_88294 ) ) ( not ( = ?auto_88288 ?auto_88289 ) ) ( not ( = ?auto_88287 ?auto_88289 ) ) ( not ( = ?auto_88285 ?auto_88289 ) ) ( not ( = ?auto_88286 ?auto_88289 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88288 ?auto_88287 ?auto_88285 ?auto_88289 ?auto_88286 ?auto_88284 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88336 - OBJ
      ?auto_88337 - OBJ
      ?auto_88338 - OBJ
      ?auto_88339 - OBJ
      ?auto_88340 - OBJ
      ?auto_88335 - LOCATION
    )
    :vars
    (
      ?auto_88345 - LOCATION
      ?auto_88342 - CITY
      ?auto_88341 - LOCATION
      ?auto_88343 - LOCATION
      ?auto_88344 - LOCATION
      ?auto_88346 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88345 ?auto_88342 ) ( IN-CITY ?auto_88335 ?auto_88342 ) ( not ( = ?auto_88335 ?auto_88345 ) ) ( OBJ-AT ?auto_88339 ?auto_88345 ) ( IN-CITY ?auto_88341 ?auto_88342 ) ( not ( = ?auto_88335 ?auto_88341 ) ) ( OBJ-AT ?auto_88337 ?auto_88341 ) ( IN-CITY ?auto_88343 ?auto_88342 ) ( not ( = ?auto_88335 ?auto_88343 ) ) ( OBJ-AT ?auto_88336 ?auto_88343 ) ( IN-CITY ?auto_88344 ?auto_88342 ) ( not ( = ?auto_88335 ?auto_88344 ) ) ( OBJ-AT ?auto_88338 ?auto_88344 ) ( OBJ-AT ?auto_88340 ?auto_88345 ) ( TRUCK-AT ?auto_88346 ?auto_88335 ) ( not ( = ?auto_88340 ?auto_88338 ) ) ( not ( = ?auto_88344 ?auto_88345 ) ) ( not ( = ?auto_88340 ?auto_88336 ) ) ( not ( = ?auto_88338 ?auto_88336 ) ) ( not ( = ?auto_88343 ?auto_88344 ) ) ( not ( = ?auto_88343 ?auto_88345 ) ) ( not ( = ?auto_88340 ?auto_88337 ) ) ( not ( = ?auto_88338 ?auto_88337 ) ) ( not ( = ?auto_88336 ?auto_88337 ) ) ( not ( = ?auto_88341 ?auto_88343 ) ) ( not ( = ?auto_88341 ?auto_88344 ) ) ( not ( = ?auto_88341 ?auto_88345 ) ) ( not ( = ?auto_88340 ?auto_88339 ) ) ( not ( = ?auto_88338 ?auto_88339 ) ) ( not ( = ?auto_88336 ?auto_88339 ) ) ( not ( = ?auto_88337 ?auto_88339 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88340 ?auto_88338 ?auto_88336 ?auto_88339 ?auto_88337 ?auto_88335 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88657 - OBJ
      ?auto_88658 - OBJ
      ?auto_88659 - OBJ
      ?auto_88660 - OBJ
      ?auto_88661 - OBJ
      ?auto_88656 - LOCATION
    )
    :vars
    (
      ?auto_88666 - LOCATION
      ?auto_88663 - CITY
      ?auto_88662 - LOCATION
      ?auto_88664 - LOCATION
      ?auto_88665 - LOCATION
      ?auto_88667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88666 ?auto_88663 ) ( IN-CITY ?auto_88656 ?auto_88663 ) ( not ( = ?auto_88656 ?auto_88666 ) ) ( OBJ-AT ?auto_88659 ?auto_88666 ) ( IN-CITY ?auto_88662 ?auto_88663 ) ( not ( = ?auto_88656 ?auto_88662 ) ) ( OBJ-AT ?auto_88658 ?auto_88662 ) ( IN-CITY ?auto_88664 ?auto_88663 ) ( not ( = ?auto_88656 ?auto_88664 ) ) ( OBJ-AT ?auto_88657 ?auto_88664 ) ( IN-CITY ?auto_88665 ?auto_88663 ) ( not ( = ?auto_88656 ?auto_88665 ) ) ( OBJ-AT ?auto_88661 ?auto_88665 ) ( OBJ-AT ?auto_88660 ?auto_88666 ) ( TRUCK-AT ?auto_88667 ?auto_88656 ) ( not ( = ?auto_88660 ?auto_88661 ) ) ( not ( = ?auto_88665 ?auto_88666 ) ) ( not ( = ?auto_88660 ?auto_88657 ) ) ( not ( = ?auto_88661 ?auto_88657 ) ) ( not ( = ?auto_88664 ?auto_88665 ) ) ( not ( = ?auto_88664 ?auto_88666 ) ) ( not ( = ?auto_88660 ?auto_88658 ) ) ( not ( = ?auto_88661 ?auto_88658 ) ) ( not ( = ?auto_88657 ?auto_88658 ) ) ( not ( = ?auto_88662 ?auto_88664 ) ) ( not ( = ?auto_88662 ?auto_88665 ) ) ( not ( = ?auto_88662 ?auto_88666 ) ) ( not ( = ?auto_88660 ?auto_88659 ) ) ( not ( = ?auto_88661 ?auto_88659 ) ) ( not ( = ?auto_88657 ?auto_88659 ) ) ( not ( = ?auto_88658 ?auto_88659 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88660 ?auto_88661 ?auto_88657 ?auto_88659 ?auto_88658 ?auto_88656 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_88708 - OBJ
      ?auto_88709 - OBJ
      ?auto_88710 - OBJ
      ?auto_88711 - OBJ
      ?auto_88712 - OBJ
      ?auto_88707 - LOCATION
    )
    :vars
    (
      ?auto_88717 - LOCATION
      ?auto_88714 - CITY
      ?auto_88713 - LOCATION
      ?auto_88715 - LOCATION
      ?auto_88716 - LOCATION
      ?auto_88718 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_88717 ?auto_88714 ) ( IN-CITY ?auto_88707 ?auto_88714 ) ( not ( = ?auto_88707 ?auto_88717 ) ) ( OBJ-AT ?auto_88710 ?auto_88717 ) ( IN-CITY ?auto_88713 ?auto_88714 ) ( not ( = ?auto_88707 ?auto_88713 ) ) ( OBJ-AT ?auto_88709 ?auto_88713 ) ( IN-CITY ?auto_88715 ?auto_88714 ) ( not ( = ?auto_88707 ?auto_88715 ) ) ( OBJ-AT ?auto_88708 ?auto_88715 ) ( IN-CITY ?auto_88716 ?auto_88714 ) ( not ( = ?auto_88707 ?auto_88716 ) ) ( OBJ-AT ?auto_88711 ?auto_88716 ) ( OBJ-AT ?auto_88712 ?auto_88717 ) ( TRUCK-AT ?auto_88718 ?auto_88707 ) ( not ( = ?auto_88712 ?auto_88711 ) ) ( not ( = ?auto_88716 ?auto_88717 ) ) ( not ( = ?auto_88712 ?auto_88708 ) ) ( not ( = ?auto_88711 ?auto_88708 ) ) ( not ( = ?auto_88715 ?auto_88716 ) ) ( not ( = ?auto_88715 ?auto_88717 ) ) ( not ( = ?auto_88712 ?auto_88709 ) ) ( not ( = ?auto_88711 ?auto_88709 ) ) ( not ( = ?auto_88708 ?auto_88709 ) ) ( not ( = ?auto_88713 ?auto_88715 ) ) ( not ( = ?auto_88713 ?auto_88716 ) ) ( not ( = ?auto_88713 ?auto_88717 ) ) ( not ( = ?auto_88712 ?auto_88710 ) ) ( not ( = ?auto_88711 ?auto_88710 ) ) ( not ( = ?auto_88708 ?auto_88710 ) ) ( not ( = ?auto_88709 ?auto_88710 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_88712 ?auto_88711 ?auto_88708 ?auto_88710 ?auto_88709 ?auto_88707 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89083 - OBJ
      ?auto_89084 - OBJ
      ?auto_89085 - OBJ
      ?auto_89086 - OBJ
      ?auto_89087 - OBJ
      ?auto_89082 - LOCATION
    )
    :vars
    (
      ?auto_89092 - LOCATION
      ?auto_89089 - CITY
      ?auto_89088 - LOCATION
      ?auto_89090 - LOCATION
      ?auto_89091 - LOCATION
      ?auto_89093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89092 ?auto_89089 ) ( IN-CITY ?auto_89082 ?auto_89089 ) ( not ( = ?auto_89082 ?auto_89092 ) ) ( OBJ-AT ?auto_89084 ?auto_89092 ) ( IN-CITY ?auto_89088 ?auto_89089 ) ( not ( = ?auto_89082 ?auto_89088 ) ) ( OBJ-AT ?auto_89087 ?auto_89088 ) ( IN-CITY ?auto_89090 ?auto_89089 ) ( not ( = ?auto_89082 ?auto_89090 ) ) ( OBJ-AT ?auto_89083 ?auto_89090 ) ( IN-CITY ?auto_89091 ?auto_89089 ) ( not ( = ?auto_89082 ?auto_89091 ) ) ( OBJ-AT ?auto_89086 ?auto_89091 ) ( OBJ-AT ?auto_89085 ?auto_89092 ) ( TRUCK-AT ?auto_89093 ?auto_89082 ) ( not ( = ?auto_89085 ?auto_89086 ) ) ( not ( = ?auto_89091 ?auto_89092 ) ) ( not ( = ?auto_89085 ?auto_89083 ) ) ( not ( = ?auto_89086 ?auto_89083 ) ) ( not ( = ?auto_89090 ?auto_89091 ) ) ( not ( = ?auto_89090 ?auto_89092 ) ) ( not ( = ?auto_89085 ?auto_89087 ) ) ( not ( = ?auto_89086 ?auto_89087 ) ) ( not ( = ?auto_89083 ?auto_89087 ) ) ( not ( = ?auto_89088 ?auto_89090 ) ) ( not ( = ?auto_89088 ?auto_89091 ) ) ( not ( = ?auto_89088 ?auto_89092 ) ) ( not ( = ?auto_89085 ?auto_89084 ) ) ( not ( = ?auto_89086 ?auto_89084 ) ) ( not ( = ?auto_89083 ?auto_89084 ) ) ( not ( = ?auto_89087 ?auto_89084 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89085 ?auto_89086 ?auto_89083 ?auto_89084 ?auto_89087 ?auto_89082 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89189 - OBJ
      ?auto_89190 - OBJ
      ?auto_89191 - OBJ
      ?auto_89192 - OBJ
      ?auto_89193 - OBJ
      ?auto_89188 - LOCATION
    )
    :vars
    (
      ?auto_89198 - LOCATION
      ?auto_89195 - CITY
      ?auto_89194 - LOCATION
      ?auto_89196 - LOCATION
      ?auto_89197 - LOCATION
      ?auto_89199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89198 ?auto_89195 ) ( IN-CITY ?auto_89188 ?auto_89195 ) ( not ( = ?auto_89188 ?auto_89198 ) ) ( OBJ-AT ?auto_89190 ?auto_89198 ) ( IN-CITY ?auto_89194 ?auto_89195 ) ( not ( = ?auto_89188 ?auto_89194 ) ) ( OBJ-AT ?auto_89192 ?auto_89194 ) ( IN-CITY ?auto_89196 ?auto_89195 ) ( not ( = ?auto_89188 ?auto_89196 ) ) ( OBJ-AT ?auto_89189 ?auto_89196 ) ( IN-CITY ?auto_89197 ?auto_89195 ) ( not ( = ?auto_89188 ?auto_89197 ) ) ( OBJ-AT ?auto_89193 ?auto_89197 ) ( OBJ-AT ?auto_89191 ?auto_89198 ) ( TRUCK-AT ?auto_89199 ?auto_89188 ) ( not ( = ?auto_89191 ?auto_89193 ) ) ( not ( = ?auto_89197 ?auto_89198 ) ) ( not ( = ?auto_89191 ?auto_89189 ) ) ( not ( = ?auto_89193 ?auto_89189 ) ) ( not ( = ?auto_89196 ?auto_89197 ) ) ( not ( = ?auto_89196 ?auto_89198 ) ) ( not ( = ?auto_89191 ?auto_89192 ) ) ( not ( = ?auto_89193 ?auto_89192 ) ) ( not ( = ?auto_89189 ?auto_89192 ) ) ( not ( = ?auto_89194 ?auto_89196 ) ) ( not ( = ?auto_89194 ?auto_89197 ) ) ( not ( = ?auto_89194 ?auto_89198 ) ) ( not ( = ?auto_89191 ?auto_89190 ) ) ( not ( = ?auto_89193 ?auto_89190 ) ) ( not ( = ?auto_89189 ?auto_89190 ) ) ( not ( = ?auto_89192 ?auto_89190 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89191 ?auto_89193 ?auto_89189 ?auto_89190 ?auto_89192 ?auto_89188 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89347 - OBJ
      ?auto_89348 - OBJ
      ?auto_89349 - OBJ
      ?auto_89350 - OBJ
      ?auto_89351 - OBJ
      ?auto_89346 - LOCATION
    )
    :vars
    (
      ?auto_89356 - LOCATION
      ?auto_89353 - CITY
      ?auto_89352 - LOCATION
      ?auto_89354 - LOCATION
      ?auto_89355 - LOCATION
      ?auto_89357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89356 ?auto_89353 ) ( IN-CITY ?auto_89346 ?auto_89353 ) ( not ( = ?auto_89346 ?auto_89356 ) ) ( OBJ-AT ?auto_89348 ?auto_89356 ) ( IN-CITY ?auto_89352 ?auto_89353 ) ( not ( = ?auto_89346 ?auto_89352 ) ) ( OBJ-AT ?auto_89351 ?auto_89352 ) ( IN-CITY ?auto_89354 ?auto_89353 ) ( not ( = ?auto_89346 ?auto_89354 ) ) ( OBJ-AT ?auto_89347 ?auto_89354 ) ( IN-CITY ?auto_89355 ?auto_89353 ) ( not ( = ?auto_89346 ?auto_89355 ) ) ( OBJ-AT ?auto_89349 ?auto_89355 ) ( OBJ-AT ?auto_89350 ?auto_89356 ) ( TRUCK-AT ?auto_89357 ?auto_89346 ) ( not ( = ?auto_89350 ?auto_89349 ) ) ( not ( = ?auto_89355 ?auto_89356 ) ) ( not ( = ?auto_89350 ?auto_89347 ) ) ( not ( = ?auto_89349 ?auto_89347 ) ) ( not ( = ?auto_89354 ?auto_89355 ) ) ( not ( = ?auto_89354 ?auto_89356 ) ) ( not ( = ?auto_89350 ?auto_89351 ) ) ( not ( = ?auto_89349 ?auto_89351 ) ) ( not ( = ?auto_89347 ?auto_89351 ) ) ( not ( = ?auto_89352 ?auto_89354 ) ) ( not ( = ?auto_89352 ?auto_89355 ) ) ( not ( = ?auto_89352 ?auto_89356 ) ) ( not ( = ?auto_89350 ?auto_89348 ) ) ( not ( = ?auto_89349 ?auto_89348 ) ) ( not ( = ?auto_89347 ?auto_89348 ) ) ( not ( = ?auto_89351 ?auto_89348 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89350 ?auto_89349 ?auto_89347 ?auto_89348 ?auto_89351 ?auto_89346 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_89508 - OBJ
      ?auto_89509 - OBJ
      ?auto_89510 - OBJ
      ?auto_89511 - OBJ
      ?auto_89512 - OBJ
      ?auto_89507 - LOCATION
    )
    :vars
    (
      ?auto_89517 - LOCATION
      ?auto_89514 - CITY
      ?auto_89513 - LOCATION
      ?auto_89515 - LOCATION
      ?auto_89516 - LOCATION
      ?auto_89518 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_89517 ?auto_89514 ) ( IN-CITY ?auto_89507 ?auto_89514 ) ( not ( = ?auto_89507 ?auto_89517 ) ) ( OBJ-AT ?auto_89509 ?auto_89517 ) ( IN-CITY ?auto_89513 ?auto_89514 ) ( not ( = ?auto_89507 ?auto_89513 ) ) ( OBJ-AT ?auto_89511 ?auto_89513 ) ( IN-CITY ?auto_89515 ?auto_89514 ) ( not ( = ?auto_89507 ?auto_89515 ) ) ( OBJ-AT ?auto_89508 ?auto_89515 ) ( IN-CITY ?auto_89516 ?auto_89514 ) ( not ( = ?auto_89507 ?auto_89516 ) ) ( OBJ-AT ?auto_89510 ?auto_89516 ) ( OBJ-AT ?auto_89512 ?auto_89517 ) ( TRUCK-AT ?auto_89518 ?auto_89507 ) ( not ( = ?auto_89512 ?auto_89510 ) ) ( not ( = ?auto_89516 ?auto_89517 ) ) ( not ( = ?auto_89512 ?auto_89508 ) ) ( not ( = ?auto_89510 ?auto_89508 ) ) ( not ( = ?auto_89515 ?auto_89516 ) ) ( not ( = ?auto_89515 ?auto_89517 ) ) ( not ( = ?auto_89512 ?auto_89511 ) ) ( not ( = ?auto_89510 ?auto_89511 ) ) ( not ( = ?auto_89508 ?auto_89511 ) ) ( not ( = ?auto_89513 ?auto_89515 ) ) ( not ( = ?auto_89513 ?auto_89516 ) ) ( not ( = ?auto_89513 ?auto_89517 ) ) ( not ( = ?auto_89512 ?auto_89509 ) ) ( not ( = ?auto_89510 ?auto_89509 ) ) ( not ( = ?auto_89508 ?auto_89509 ) ) ( not ( = ?auto_89511 ?auto_89509 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_89512 ?auto_89510 ?auto_89508 ?auto_89509 ?auto_89511 ?auto_89507 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90001 - OBJ
      ?auto_90002 - OBJ
      ?auto_90003 - OBJ
      ?auto_90004 - OBJ
      ?auto_90005 - OBJ
      ?auto_90000 - LOCATION
    )
    :vars
    (
      ?auto_90010 - LOCATION
      ?auto_90007 - CITY
      ?auto_90006 - LOCATION
      ?auto_90008 - LOCATION
      ?auto_90009 - LOCATION
      ?auto_90011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90010 ?auto_90007 ) ( IN-CITY ?auto_90000 ?auto_90007 ) ( not ( = ?auto_90000 ?auto_90010 ) ) ( OBJ-AT ?auto_90002 ?auto_90010 ) ( IN-CITY ?auto_90006 ?auto_90007 ) ( not ( = ?auto_90000 ?auto_90006 ) ) ( OBJ-AT ?auto_90003 ?auto_90006 ) ( IN-CITY ?auto_90008 ?auto_90007 ) ( not ( = ?auto_90000 ?auto_90008 ) ) ( OBJ-AT ?auto_90001 ?auto_90008 ) ( IN-CITY ?auto_90009 ?auto_90007 ) ( not ( = ?auto_90000 ?auto_90009 ) ) ( OBJ-AT ?auto_90005 ?auto_90009 ) ( OBJ-AT ?auto_90004 ?auto_90010 ) ( TRUCK-AT ?auto_90011 ?auto_90000 ) ( not ( = ?auto_90004 ?auto_90005 ) ) ( not ( = ?auto_90009 ?auto_90010 ) ) ( not ( = ?auto_90004 ?auto_90001 ) ) ( not ( = ?auto_90005 ?auto_90001 ) ) ( not ( = ?auto_90008 ?auto_90009 ) ) ( not ( = ?auto_90008 ?auto_90010 ) ) ( not ( = ?auto_90004 ?auto_90003 ) ) ( not ( = ?auto_90005 ?auto_90003 ) ) ( not ( = ?auto_90001 ?auto_90003 ) ) ( not ( = ?auto_90006 ?auto_90008 ) ) ( not ( = ?auto_90006 ?auto_90009 ) ) ( not ( = ?auto_90006 ?auto_90010 ) ) ( not ( = ?auto_90004 ?auto_90002 ) ) ( not ( = ?auto_90005 ?auto_90002 ) ) ( not ( = ?auto_90001 ?auto_90002 ) ) ( not ( = ?auto_90003 ?auto_90002 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90004 ?auto_90005 ?auto_90001 ?auto_90002 ?auto_90003 ?auto_90000 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90052 - OBJ
      ?auto_90053 - OBJ
      ?auto_90054 - OBJ
      ?auto_90055 - OBJ
      ?auto_90056 - OBJ
      ?auto_90051 - LOCATION
    )
    :vars
    (
      ?auto_90061 - LOCATION
      ?auto_90058 - CITY
      ?auto_90057 - LOCATION
      ?auto_90059 - LOCATION
      ?auto_90060 - LOCATION
      ?auto_90062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90061 ?auto_90058 ) ( IN-CITY ?auto_90051 ?auto_90058 ) ( not ( = ?auto_90051 ?auto_90061 ) ) ( OBJ-AT ?auto_90053 ?auto_90061 ) ( IN-CITY ?auto_90057 ?auto_90058 ) ( not ( = ?auto_90051 ?auto_90057 ) ) ( OBJ-AT ?auto_90054 ?auto_90057 ) ( IN-CITY ?auto_90059 ?auto_90058 ) ( not ( = ?auto_90051 ?auto_90059 ) ) ( OBJ-AT ?auto_90052 ?auto_90059 ) ( IN-CITY ?auto_90060 ?auto_90058 ) ( not ( = ?auto_90051 ?auto_90060 ) ) ( OBJ-AT ?auto_90055 ?auto_90060 ) ( OBJ-AT ?auto_90056 ?auto_90061 ) ( TRUCK-AT ?auto_90062 ?auto_90051 ) ( not ( = ?auto_90056 ?auto_90055 ) ) ( not ( = ?auto_90060 ?auto_90061 ) ) ( not ( = ?auto_90056 ?auto_90052 ) ) ( not ( = ?auto_90055 ?auto_90052 ) ) ( not ( = ?auto_90059 ?auto_90060 ) ) ( not ( = ?auto_90059 ?auto_90061 ) ) ( not ( = ?auto_90056 ?auto_90054 ) ) ( not ( = ?auto_90055 ?auto_90054 ) ) ( not ( = ?auto_90052 ?auto_90054 ) ) ( not ( = ?auto_90057 ?auto_90059 ) ) ( not ( = ?auto_90057 ?auto_90060 ) ) ( not ( = ?auto_90057 ?auto_90061 ) ) ( not ( = ?auto_90056 ?auto_90053 ) ) ( not ( = ?auto_90055 ?auto_90053 ) ) ( not ( = ?auto_90052 ?auto_90053 ) ) ( not ( = ?auto_90054 ?auto_90053 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90056 ?auto_90055 ?auto_90052 ?auto_90053 ?auto_90054 ?auto_90051 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90816 - OBJ
      ?auto_90817 - OBJ
      ?auto_90818 - OBJ
      ?auto_90819 - OBJ
      ?auto_90820 - OBJ
      ?auto_90815 - LOCATION
    )
    :vars
    (
      ?auto_90825 - LOCATION
      ?auto_90822 - CITY
      ?auto_90821 - LOCATION
      ?auto_90823 - LOCATION
      ?auto_90824 - LOCATION
      ?auto_90826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90825 ?auto_90822 ) ( IN-CITY ?auto_90815 ?auto_90822 ) ( not ( = ?auto_90815 ?auto_90825 ) ) ( OBJ-AT ?auto_90820 ?auto_90825 ) ( IN-CITY ?auto_90821 ?auto_90822 ) ( not ( = ?auto_90815 ?auto_90821 ) ) ( OBJ-AT ?auto_90816 ?auto_90821 ) ( IN-CITY ?auto_90823 ?auto_90822 ) ( not ( = ?auto_90815 ?auto_90823 ) ) ( OBJ-AT ?auto_90819 ?auto_90823 ) ( IN-CITY ?auto_90824 ?auto_90822 ) ( not ( = ?auto_90815 ?auto_90824 ) ) ( OBJ-AT ?auto_90818 ?auto_90824 ) ( OBJ-AT ?auto_90817 ?auto_90825 ) ( TRUCK-AT ?auto_90826 ?auto_90815 ) ( not ( = ?auto_90817 ?auto_90818 ) ) ( not ( = ?auto_90824 ?auto_90825 ) ) ( not ( = ?auto_90817 ?auto_90819 ) ) ( not ( = ?auto_90818 ?auto_90819 ) ) ( not ( = ?auto_90823 ?auto_90824 ) ) ( not ( = ?auto_90823 ?auto_90825 ) ) ( not ( = ?auto_90817 ?auto_90816 ) ) ( not ( = ?auto_90818 ?auto_90816 ) ) ( not ( = ?auto_90819 ?auto_90816 ) ) ( not ( = ?auto_90821 ?auto_90823 ) ) ( not ( = ?auto_90821 ?auto_90824 ) ) ( not ( = ?auto_90821 ?auto_90825 ) ) ( not ( = ?auto_90817 ?auto_90820 ) ) ( not ( = ?auto_90818 ?auto_90820 ) ) ( not ( = ?auto_90819 ?auto_90820 ) ) ( not ( = ?auto_90816 ?auto_90820 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90817 ?auto_90818 ?auto_90819 ?auto_90820 ?auto_90816 ?auto_90815 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90867 - OBJ
      ?auto_90868 - OBJ
      ?auto_90869 - OBJ
      ?auto_90870 - OBJ
      ?auto_90871 - OBJ
      ?auto_90866 - LOCATION
    )
    :vars
    (
      ?auto_90876 - LOCATION
      ?auto_90873 - CITY
      ?auto_90872 - LOCATION
      ?auto_90874 - LOCATION
      ?auto_90875 - LOCATION
      ?auto_90877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90876 ?auto_90873 ) ( IN-CITY ?auto_90866 ?auto_90873 ) ( not ( = ?auto_90866 ?auto_90876 ) ) ( OBJ-AT ?auto_90870 ?auto_90876 ) ( IN-CITY ?auto_90872 ?auto_90873 ) ( not ( = ?auto_90866 ?auto_90872 ) ) ( OBJ-AT ?auto_90867 ?auto_90872 ) ( IN-CITY ?auto_90874 ?auto_90873 ) ( not ( = ?auto_90866 ?auto_90874 ) ) ( OBJ-AT ?auto_90871 ?auto_90874 ) ( IN-CITY ?auto_90875 ?auto_90873 ) ( not ( = ?auto_90866 ?auto_90875 ) ) ( OBJ-AT ?auto_90869 ?auto_90875 ) ( OBJ-AT ?auto_90868 ?auto_90876 ) ( TRUCK-AT ?auto_90877 ?auto_90866 ) ( not ( = ?auto_90868 ?auto_90869 ) ) ( not ( = ?auto_90875 ?auto_90876 ) ) ( not ( = ?auto_90868 ?auto_90871 ) ) ( not ( = ?auto_90869 ?auto_90871 ) ) ( not ( = ?auto_90874 ?auto_90875 ) ) ( not ( = ?auto_90874 ?auto_90876 ) ) ( not ( = ?auto_90868 ?auto_90867 ) ) ( not ( = ?auto_90869 ?auto_90867 ) ) ( not ( = ?auto_90871 ?auto_90867 ) ) ( not ( = ?auto_90872 ?auto_90874 ) ) ( not ( = ?auto_90872 ?auto_90875 ) ) ( not ( = ?auto_90872 ?auto_90876 ) ) ( not ( = ?auto_90868 ?auto_90870 ) ) ( not ( = ?auto_90869 ?auto_90870 ) ) ( not ( = ?auto_90871 ?auto_90870 ) ) ( not ( = ?auto_90867 ?auto_90870 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90868 ?auto_90869 ?auto_90871 ?auto_90870 ?auto_90867 ?auto_90866 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90918 - OBJ
      ?auto_90919 - OBJ
      ?auto_90920 - OBJ
      ?auto_90921 - OBJ
      ?auto_90922 - OBJ
      ?auto_90917 - LOCATION
    )
    :vars
    (
      ?auto_90927 - LOCATION
      ?auto_90924 - CITY
      ?auto_90923 - LOCATION
      ?auto_90925 - LOCATION
      ?auto_90926 - LOCATION
      ?auto_90928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90927 ?auto_90924 ) ( IN-CITY ?auto_90917 ?auto_90924 ) ( not ( = ?auto_90917 ?auto_90927 ) ) ( OBJ-AT ?auto_90922 ?auto_90927 ) ( IN-CITY ?auto_90923 ?auto_90924 ) ( not ( = ?auto_90917 ?auto_90923 ) ) ( OBJ-AT ?auto_90918 ?auto_90923 ) ( IN-CITY ?auto_90925 ?auto_90924 ) ( not ( = ?auto_90917 ?auto_90925 ) ) ( OBJ-AT ?auto_90920 ?auto_90925 ) ( IN-CITY ?auto_90926 ?auto_90924 ) ( not ( = ?auto_90917 ?auto_90926 ) ) ( OBJ-AT ?auto_90921 ?auto_90926 ) ( OBJ-AT ?auto_90919 ?auto_90927 ) ( TRUCK-AT ?auto_90928 ?auto_90917 ) ( not ( = ?auto_90919 ?auto_90921 ) ) ( not ( = ?auto_90926 ?auto_90927 ) ) ( not ( = ?auto_90919 ?auto_90920 ) ) ( not ( = ?auto_90921 ?auto_90920 ) ) ( not ( = ?auto_90925 ?auto_90926 ) ) ( not ( = ?auto_90925 ?auto_90927 ) ) ( not ( = ?auto_90919 ?auto_90918 ) ) ( not ( = ?auto_90921 ?auto_90918 ) ) ( not ( = ?auto_90920 ?auto_90918 ) ) ( not ( = ?auto_90923 ?auto_90925 ) ) ( not ( = ?auto_90923 ?auto_90926 ) ) ( not ( = ?auto_90923 ?auto_90927 ) ) ( not ( = ?auto_90919 ?auto_90922 ) ) ( not ( = ?auto_90921 ?auto_90922 ) ) ( not ( = ?auto_90920 ?auto_90922 ) ) ( not ( = ?auto_90918 ?auto_90922 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90919 ?auto_90921 ?auto_90920 ?auto_90922 ?auto_90918 ?auto_90917 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_90969 - OBJ
      ?auto_90970 - OBJ
      ?auto_90971 - OBJ
      ?auto_90972 - OBJ
      ?auto_90973 - OBJ
      ?auto_90968 - LOCATION
    )
    :vars
    (
      ?auto_90978 - LOCATION
      ?auto_90975 - CITY
      ?auto_90974 - LOCATION
      ?auto_90976 - LOCATION
      ?auto_90977 - LOCATION
      ?auto_90979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_90978 ?auto_90975 ) ( IN-CITY ?auto_90968 ?auto_90975 ) ( not ( = ?auto_90968 ?auto_90978 ) ) ( OBJ-AT ?auto_90972 ?auto_90978 ) ( IN-CITY ?auto_90974 ?auto_90975 ) ( not ( = ?auto_90968 ?auto_90974 ) ) ( OBJ-AT ?auto_90969 ?auto_90974 ) ( IN-CITY ?auto_90976 ?auto_90975 ) ( not ( = ?auto_90968 ?auto_90976 ) ) ( OBJ-AT ?auto_90971 ?auto_90976 ) ( IN-CITY ?auto_90977 ?auto_90975 ) ( not ( = ?auto_90968 ?auto_90977 ) ) ( OBJ-AT ?auto_90973 ?auto_90977 ) ( OBJ-AT ?auto_90970 ?auto_90978 ) ( TRUCK-AT ?auto_90979 ?auto_90968 ) ( not ( = ?auto_90970 ?auto_90973 ) ) ( not ( = ?auto_90977 ?auto_90978 ) ) ( not ( = ?auto_90970 ?auto_90971 ) ) ( not ( = ?auto_90973 ?auto_90971 ) ) ( not ( = ?auto_90976 ?auto_90977 ) ) ( not ( = ?auto_90976 ?auto_90978 ) ) ( not ( = ?auto_90970 ?auto_90969 ) ) ( not ( = ?auto_90973 ?auto_90969 ) ) ( not ( = ?auto_90971 ?auto_90969 ) ) ( not ( = ?auto_90974 ?auto_90976 ) ) ( not ( = ?auto_90974 ?auto_90977 ) ) ( not ( = ?auto_90974 ?auto_90978 ) ) ( not ( = ?auto_90970 ?auto_90972 ) ) ( not ( = ?auto_90973 ?auto_90972 ) ) ( not ( = ?auto_90971 ?auto_90972 ) ) ( not ( = ?auto_90969 ?auto_90972 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_90970 ?auto_90973 ?auto_90971 ?auto_90972 ?auto_90969 ?auto_90968 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91236 - OBJ
      ?auto_91237 - OBJ
      ?auto_91238 - OBJ
      ?auto_91239 - OBJ
      ?auto_91240 - OBJ
      ?auto_91235 - LOCATION
    )
    :vars
    (
      ?auto_91245 - LOCATION
      ?auto_91242 - CITY
      ?auto_91241 - LOCATION
      ?auto_91243 - LOCATION
      ?auto_91244 - LOCATION
      ?auto_91246 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91245 ?auto_91242 ) ( IN-CITY ?auto_91235 ?auto_91242 ) ( not ( = ?auto_91235 ?auto_91245 ) ) ( OBJ-AT ?auto_91238 ?auto_91245 ) ( IN-CITY ?auto_91241 ?auto_91242 ) ( not ( = ?auto_91235 ?auto_91241 ) ) ( OBJ-AT ?auto_91236 ?auto_91241 ) ( IN-CITY ?auto_91243 ?auto_91242 ) ( not ( = ?auto_91235 ?auto_91243 ) ) ( OBJ-AT ?auto_91240 ?auto_91243 ) ( IN-CITY ?auto_91244 ?auto_91242 ) ( not ( = ?auto_91235 ?auto_91244 ) ) ( OBJ-AT ?auto_91239 ?auto_91244 ) ( OBJ-AT ?auto_91237 ?auto_91245 ) ( TRUCK-AT ?auto_91246 ?auto_91235 ) ( not ( = ?auto_91237 ?auto_91239 ) ) ( not ( = ?auto_91244 ?auto_91245 ) ) ( not ( = ?auto_91237 ?auto_91240 ) ) ( not ( = ?auto_91239 ?auto_91240 ) ) ( not ( = ?auto_91243 ?auto_91244 ) ) ( not ( = ?auto_91243 ?auto_91245 ) ) ( not ( = ?auto_91237 ?auto_91236 ) ) ( not ( = ?auto_91239 ?auto_91236 ) ) ( not ( = ?auto_91240 ?auto_91236 ) ) ( not ( = ?auto_91241 ?auto_91243 ) ) ( not ( = ?auto_91241 ?auto_91244 ) ) ( not ( = ?auto_91241 ?auto_91245 ) ) ( not ( = ?auto_91237 ?auto_91238 ) ) ( not ( = ?auto_91239 ?auto_91238 ) ) ( not ( = ?auto_91240 ?auto_91238 ) ) ( not ( = ?auto_91236 ?auto_91238 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91237 ?auto_91239 ?auto_91240 ?auto_91238 ?auto_91236 ?auto_91235 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91287 - OBJ
      ?auto_91288 - OBJ
      ?auto_91289 - OBJ
      ?auto_91290 - OBJ
      ?auto_91291 - OBJ
      ?auto_91286 - LOCATION
    )
    :vars
    (
      ?auto_91296 - LOCATION
      ?auto_91293 - CITY
      ?auto_91292 - LOCATION
      ?auto_91294 - LOCATION
      ?auto_91295 - LOCATION
      ?auto_91297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91296 ?auto_91293 ) ( IN-CITY ?auto_91286 ?auto_91293 ) ( not ( = ?auto_91286 ?auto_91296 ) ) ( OBJ-AT ?auto_91289 ?auto_91296 ) ( IN-CITY ?auto_91292 ?auto_91293 ) ( not ( = ?auto_91286 ?auto_91292 ) ) ( OBJ-AT ?auto_91287 ?auto_91292 ) ( IN-CITY ?auto_91294 ?auto_91293 ) ( not ( = ?auto_91286 ?auto_91294 ) ) ( OBJ-AT ?auto_91290 ?auto_91294 ) ( IN-CITY ?auto_91295 ?auto_91293 ) ( not ( = ?auto_91286 ?auto_91295 ) ) ( OBJ-AT ?auto_91291 ?auto_91295 ) ( OBJ-AT ?auto_91288 ?auto_91296 ) ( TRUCK-AT ?auto_91297 ?auto_91286 ) ( not ( = ?auto_91288 ?auto_91291 ) ) ( not ( = ?auto_91295 ?auto_91296 ) ) ( not ( = ?auto_91288 ?auto_91290 ) ) ( not ( = ?auto_91291 ?auto_91290 ) ) ( not ( = ?auto_91294 ?auto_91295 ) ) ( not ( = ?auto_91294 ?auto_91296 ) ) ( not ( = ?auto_91288 ?auto_91287 ) ) ( not ( = ?auto_91291 ?auto_91287 ) ) ( not ( = ?auto_91290 ?auto_91287 ) ) ( not ( = ?auto_91292 ?auto_91294 ) ) ( not ( = ?auto_91292 ?auto_91295 ) ) ( not ( = ?auto_91292 ?auto_91296 ) ) ( not ( = ?auto_91288 ?auto_91289 ) ) ( not ( = ?auto_91291 ?auto_91289 ) ) ( not ( = ?auto_91290 ?auto_91289 ) ) ( not ( = ?auto_91287 ?auto_91289 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91288 ?auto_91291 ?auto_91290 ?auto_91289 ?auto_91287 ?auto_91286 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91500 - OBJ
      ?auto_91501 - OBJ
      ?auto_91502 - OBJ
      ?auto_91503 - OBJ
      ?auto_91504 - OBJ
      ?auto_91499 - LOCATION
    )
    :vars
    (
      ?auto_91509 - LOCATION
      ?auto_91506 - CITY
      ?auto_91505 - LOCATION
      ?auto_91507 - LOCATION
      ?auto_91508 - LOCATION
      ?auto_91510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91509 ?auto_91506 ) ( IN-CITY ?auto_91499 ?auto_91506 ) ( not ( = ?auto_91499 ?auto_91509 ) ) ( OBJ-AT ?auto_91504 ?auto_91509 ) ( IN-CITY ?auto_91505 ?auto_91506 ) ( not ( = ?auto_91499 ?auto_91505 ) ) ( OBJ-AT ?auto_91500 ?auto_91505 ) ( IN-CITY ?auto_91507 ?auto_91506 ) ( not ( = ?auto_91499 ?auto_91507 ) ) ( OBJ-AT ?auto_91503 ?auto_91507 ) ( IN-CITY ?auto_91508 ?auto_91506 ) ( not ( = ?auto_91499 ?auto_91508 ) ) ( OBJ-AT ?auto_91501 ?auto_91508 ) ( OBJ-AT ?auto_91502 ?auto_91509 ) ( TRUCK-AT ?auto_91510 ?auto_91499 ) ( not ( = ?auto_91502 ?auto_91501 ) ) ( not ( = ?auto_91508 ?auto_91509 ) ) ( not ( = ?auto_91502 ?auto_91503 ) ) ( not ( = ?auto_91501 ?auto_91503 ) ) ( not ( = ?auto_91507 ?auto_91508 ) ) ( not ( = ?auto_91507 ?auto_91509 ) ) ( not ( = ?auto_91502 ?auto_91500 ) ) ( not ( = ?auto_91501 ?auto_91500 ) ) ( not ( = ?auto_91503 ?auto_91500 ) ) ( not ( = ?auto_91505 ?auto_91507 ) ) ( not ( = ?auto_91505 ?auto_91508 ) ) ( not ( = ?auto_91505 ?auto_91509 ) ) ( not ( = ?auto_91502 ?auto_91504 ) ) ( not ( = ?auto_91501 ?auto_91504 ) ) ( not ( = ?auto_91503 ?auto_91504 ) ) ( not ( = ?auto_91500 ?auto_91504 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91502 ?auto_91501 ?auto_91503 ?auto_91504 ?auto_91500 ?auto_91499 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91551 - OBJ
      ?auto_91552 - OBJ
      ?auto_91553 - OBJ
      ?auto_91554 - OBJ
      ?auto_91555 - OBJ
      ?auto_91550 - LOCATION
    )
    :vars
    (
      ?auto_91560 - LOCATION
      ?auto_91557 - CITY
      ?auto_91556 - LOCATION
      ?auto_91558 - LOCATION
      ?auto_91559 - LOCATION
      ?auto_91561 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91560 ?auto_91557 ) ( IN-CITY ?auto_91550 ?auto_91557 ) ( not ( = ?auto_91550 ?auto_91560 ) ) ( OBJ-AT ?auto_91554 ?auto_91560 ) ( IN-CITY ?auto_91556 ?auto_91557 ) ( not ( = ?auto_91550 ?auto_91556 ) ) ( OBJ-AT ?auto_91551 ?auto_91556 ) ( IN-CITY ?auto_91558 ?auto_91557 ) ( not ( = ?auto_91550 ?auto_91558 ) ) ( OBJ-AT ?auto_91555 ?auto_91558 ) ( IN-CITY ?auto_91559 ?auto_91557 ) ( not ( = ?auto_91550 ?auto_91559 ) ) ( OBJ-AT ?auto_91552 ?auto_91559 ) ( OBJ-AT ?auto_91553 ?auto_91560 ) ( TRUCK-AT ?auto_91561 ?auto_91550 ) ( not ( = ?auto_91553 ?auto_91552 ) ) ( not ( = ?auto_91559 ?auto_91560 ) ) ( not ( = ?auto_91553 ?auto_91555 ) ) ( not ( = ?auto_91552 ?auto_91555 ) ) ( not ( = ?auto_91558 ?auto_91559 ) ) ( not ( = ?auto_91558 ?auto_91560 ) ) ( not ( = ?auto_91553 ?auto_91551 ) ) ( not ( = ?auto_91552 ?auto_91551 ) ) ( not ( = ?auto_91555 ?auto_91551 ) ) ( not ( = ?auto_91556 ?auto_91558 ) ) ( not ( = ?auto_91556 ?auto_91559 ) ) ( not ( = ?auto_91556 ?auto_91560 ) ) ( not ( = ?auto_91553 ?auto_91554 ) ) ( not ( = ?auto_91552 ?auto_91554 ) ) ( not ( = ?auto_91555 ?auto_91554 ) ) ( not ( = ?auto_91551 ?auto_91554 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91553 ?auto_91552 ?auto_91555 ?auto_91554 ?auto_91551 ?auto_91550 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91711 - OBJ
      ?auto_91712 - OBJ
      ?auto_91713 - OBJ
      ?auto_91714 - OBJ
      ?auto_91715 - OBJ
      ?auto_91710 - LOCATION
    )
    :vars
    (
      ?auto_91720 - LOCATION
      ?auto_91717 - CITY
      ?auto_91716 - LOCATION
      ?auto_91718 - LOCATION
      ?auto_91719 - LOCATION
      ?auto_91721 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91720 ?auto_91717 ) ( IN-CITY ?auto_91710 ?auto_91717 ) ( not ( = ?auto_91710 ?auto_91720 ) ) ( OBJ-AT ?auto_91715 ?auto_91720 ) ( IN-CITY ?auto_91716 ?auto_91717 ) ( not ( = ?auto_91710 ?auto_91716 ) ) ( OBJ-AT ?auto_91711 ?auto_91716 ) ( IN-CITY ?auto_91718 ?auto_91717 ) ( not ( = ?auto_91710 ?auto_91718 ) ) ( OBJ-AT ?auto_91713 ?auto_91718 ) ( IN-CITY ?auto_91719 ?auto_91717 ) ( not ( = ?auto_91710 ?auto_91719 ) ) ( OBJ-AT ?auto_91712 ?auto_91719 ) ( OBJ-AT ?auto_91714 ?auto_91720 ) ( TRUCK-AT ?auto_91721 ?auto_91710 ) ( not ( = ?auto_91714 ?auto_91712 ) ) ( not ( = ?auto_91719 ?auto_91720 ) ) ( not ( = ?auto_91714 ?auto_91713 ) ) ( not ( = ?auto_91712 ?auto_91713 ) ) ( not ( = ?auto_91718 ?auto_91719 ) ) ( not ( = ?auto_91718 ?auto_91720 ) ) ( not ( = ?auto_91714 ?auto_91711 ) ) ( not ( = ?auto_91712 ?auto_91711 ) ) ( not ( = ?auto_91713 ?auto_91711 ) ) ( not ( = ?auto_91716 ?auto_91718 ) ) ( not ( = ?auto_91716 ?auto_91719 ) ) ( not ( = ?auto_91716 ?auto_91720 ) ) ( not ( = ?auto_91714 ?auto_91715 ) ) ( not ( = ?auto_91712 ?auto_91715 ) ) ( not ( = ?auto_91713 ?auto_91715 ) ) ( not ( = ?auto_91711 ?auto_91715 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91714 ?auto_91712 ?auto_91713 ?auto_91715 ?auto_91711 ?auto_91710 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91762 - OBJ
      ?auto_91763 - OBJ
      ?auto_91764 - OBJ
      ?auto_91765 - OBJ
      ?auto_91766 - OBJ
      ?auto_91761 - LOCATION
    )
    :vars
    (
      ?auto_91771 - LOCATION
      ?auto_91768 - CITY
      ?auto_91767 - LOCATION
      ?auto_91769 - LOCATION
      ?auto_91770 - LOCATION
      ?auto_91772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91771 ?auto_91768 ) ( IN-CITY ?auto_91761 ?auto_91768 ) ( not ( = ?auto_91761 ?auto_91771 ) ) ( OBJ-AT ?auto_91765 ?auto_91771 ) ( IN-CITY ?auto_91767 ?auto_91768 ) ( not ( = ?auto_91761 ?auto_91767 ) ) ( OBJ-AT ?auto_91762 ?auto_91767 ) ( IN-CITY ?auto_91769 ?auto_91768 ) ( not ( = ?auto_91761 ?auto_91769 ) ) ( OBJ-AT ?auto_91764 ?auto_91769 ) ( IN-CITY ?auto_91770 ?auto_91768 ) ( not ( = ?auto_91761 ?auto_91770 ) ) ( OBJ-AT ?auto_91763 ?auto_91770 ) ( OBJ-AT ?auto_91766 ?auto_91771 ) ( TRUCK-AT ?auto_91772 ?auto_91761 ) ( not ( = ?auto_91766 ?auto_91763 ) ) ( not ( = ?auto_91770 ?auto_91771 ) ) ( not ( = ?auto_91766 ?auto_91764 ) ) ( not ( = ?auto_91763 ?auto_91764 ) ) ( not ( = ?auto_91769 ?auto_91770 ) ) ( not ( = ?auto_91769 ?auto_91771 ) ) ( not ( = ?auto_91766 ?auto_91762 ) ) ( not ( = ?auto_91763 ?auto_91762 ) ) ( not ( = ?auto_91764 ?auto_91762 ) ) ( not ( = ?auto_91767 ?auto_91769 ) ) ( not ( = ?auto_91767 ?auto_91770 ) ) ( not ( = ?auto_91767 ?auto_91771 ) ) ( not ( = ?auto_91766 ?auto_91765 ) ) ( not ( = ?auto_91763 ?auto_91765 ) ) ( not ( = ?auto_91764 ?auto_91765 ) ) ( not ( = ?auto_91762 ?auto_91765 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91766 ?auto_91763 ?auto_91764 ?auto_91765 ?auto_91762 ?auto_91761 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_91974 - OBJ
      ?auto_91975 - OBJ
      ?auto_91976 - OBJ
      ?auto_91977 - OBJ
      ?auto_91978 - OBJ
      ?auto_91973 - LOCATION
    )
    :vars
    (
      ?auto_91983 - LOCATION
      ?auto_91980 - CITY
      ?auto_91979 - LOCATION
      ?auto_91981 - LOCATION
      ?auto_91982 - LOCATION
      ?auto_91984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_91983 ?auto_91980 ) ( IN-CITY ?auto_91973 ?auto_91980 ) ( not ( = ?auto_91973 ?auto_91983 ) ) ( OBJ-AT ?auto_91976 ?auto_91983 ) ( IN-CITY ?auto_91979 ?auto_91980 ) ( not ( = ?auto_91973 ?auto_91979 ) ) ( OBJ-AT ?auto_91974 ?auto_91979 ) ( IN-CITY ?auto_91981 ?auto_91980 ) ( not ( = ?auto_91973 ?auto_91981 ) ) ( OBJ-AT ?auto_91978 ?auto_91981 ) ( IN-CITY ?auto_91982 ?auto_91980 ) ( not ( = ?auto_91973 ?auto_91982 ) ) ( OBJ-AT ?auto_91975 ?auto_91982 ) ( OBJ-AT ?auto_91977 ?auto_91983 ) ( TRUCK-AT ?auto_91984 ?auto_91973 ) ( not ( = ?auto_91977 ?auto_91975 ) ) ( not ( = ?auto_91982 ?auto_91983 ) ) ( not ( = ?auto_91977 ?auto_91978 ) ) ( not ( = ?auto_91975 ?auto_91978 ) ) ( not ( = ?auto_91981 ?auto_91982 ) ) ( not ( = ?auto_91981 ?auto_91983 ) ) ( not ( = ?auto_91977 ?auto_91974 ) ) ( not ( = ?auto_91975 ?auto_91974 ) ) ( not ( = ?auto_91978 ?auto_91974 ) ) ( not ( = ?auto_91979 ?auto_91981 ) ) ( not ( = ?auto_91979 ?auto_91982 ) ) ( not ( = ?auto_91979 ?auto_91983 ) ) ( not ( = ?auto_91977 ?auto_91976 ) ) ( not ( = ?auto_91975 ?auto_91976 ) ) ( not ( = ?auto_91978 ?auto_91976 ) ) ( not ( = ?auto_91974 ?auto_91976 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_91977 ?auto_91975 ?auto_91978 ?auto_91976 ?auto_91974 ?auto_91973 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92080 - OBJ
      ?auto_92081 - OBJ
      ?auto_92082 - OBJ
      ?auto_92083 - OBJ
      ?auto_92084 - OBJ
      ?auto_92079 - LOCATION
    )
    :vars
    (
      ?auto_92089 - LOCATION
      ?auto_92086 - CITY
      ?auto_92085 - LOCATION
      ?auto_92087 - LOCATION
      ?auto_92088 - LOCATION
      ?auto_92090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92089 ?auto_92086 ) ( IN-CITY ?auto_92079 ?auto_92086 ) ( not ( = ?auto_92079 ?auto_92089 ) ) ( OBJ-AT ?auto_92082 ?auto_92089 ) ( IN-CITY ?auto_92085 ?auto_92086 ) ( not ( = ?auto_92079 ?auto_92085 ) ) ( OBJ-AT ?auto_92080 ?auto_92085 ) ( IN-CITY ?auto_92087 ?auto_92086 ) ( not ( = ?auto_92079 ?auto_92087 ) ) ( OBJ-AT ?auto_92083 ?auto_92087 ) ( IN-CITY ?auto_92088 ?auto_92086 ) ( not ( = ?auto_92079 ?auto_92088 ) ) ( OBJ-AT ?auto_92081 ?auto_92088 ) ( OBJ-AT ?auto_92084 ?auto_92089 ) ( TRUCK-AT ?auto_92090 ?auto_92079 ) ( not ( = ?auto_92084 ?auto_92081 ) ) ( not ( = ?auto_92088 ?auto_92089 ) ) ( not ( = ?auto_92084 ?auto_92083 ) ) ( not ( = ?auto_92081 ?auto_92083 ) ) ( not ( = ?auto_92087 ?auto_92088 ) ) ( not ( = ?auto_92087 ?auto_92089 ) ) ( not ( = ?auto_92084 ?auto_92080 ) ) ( not ( = ?auto_92081 ?auto_92080 ) ) ( not ( = ?auto_92083 ?auto_92080 ) ) ( not ( = ?auto_92085 ?auto_92087 ) ) ( not ( = ?auto_92085 ?auto_92088 ) ) ( not ( = ?auto_92085 ?auto_92089 ) ) ( not ( = ?auto_92084 ?auto_92082 ) ) ( not ( = ?auto_92081 ?auto_92082 ) ) ( not ( = ?auto_92083 ?auto_92082 ) ) ( not ( = ?auto_92080 ?auto_92082 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92084 ?auto_92081 ?auto_92083 ?auto_92082 ?auto_92080 ?auto_92079 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92293 - OBJ
      ?auto_92294 - OBJ
      ?auto_92295 - OBJ
      ?auto_92296 - OBJ
      ?auto_92297 - OBJ
      ?auto_92292 - LOCATION
    )
    :vars
    (
      ?auto_92302 - LOCATION
      ?auto_92299 - CITY
      ?auto_92298 - LOCATION
      ?auto_92300 - LOCATION
      ?auto_92301 - LOCATION
      ?auto_92303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92302 ?auto_92299 ) ( IN-CITY ?auto_92292 ?auto_92299 ) ( not ( = ?auto_92292 ?auto_92302 ) ) ( OBJ-AT ?auto_92297 ?auto_92302 ) ( IN-CITY ?auto_92298 ?auto_92299 ) ( not ( = ?auto_92292 ?auto_92298 ) ) ( OBJ-AT ?auto_92293 ?auto_92298 ) ( IN-CITY ?auto_92300 ?auto_92299 ) ( not ( = ?auto_92292 ?auto_92300 ) ) ( OBJ-AT ?auto_92294 ?auto_92300 ) ( IN-CITY ?auto_92301 ?auto_92299 ) ( not ( = ?auto_92292 ?auto_92301 ) ) ( OBJ-AT ?auto_92296 ?auto_92301 ) ( OBJ-AT ?auto_92295 ?auto_92302 ) ( TRUCK-AT ?auto_92303 ?auto_92292 ) ( not ( = ?auto_92295 ?auto_92296 ) ) ( not ( = ?auto_92301 ?auto_92302 ) ) ( not ( = ?auto_92295 ?auto_92294 ) ) ( not ( = ?auto_92296 ?auto_92294 ) ) ( not ( = ?auto_92300 ?auto_92301 ) ) ( not ( = ?auto_92300 ?auto_92302 ) ) ( not ( = ?auto_92295 ?auto_92293 ) ) ( not ( = ?auto_92296 ?auto_92293 ) ) ( not ( = ?auto_92294 ?auto_92293 ) ) ( not ( = ?auto_92298 ?auto_92300 ) ) ( not ( = ?auto_92298 ?auto_92301 ) ) ( not ( = ?auto_92298 ?auto_92302 ) ) ( not ( = ?auto_92295 ?auto_92297 ) ) ( not ( = ?auto_92296 ?auto_92297 ) ) ( not ( = ?auto_92294 ?auto_92297 ) ) ( not ( = ?auto_92293 ?auto_92297 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92295 ?auto_92296 ?auto_92294 ?auto_92297 ?auto_92293 ?auto_92292 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92344 - OBJ
      ?auto_92345 - OBJ
      ?auto_92346 - OBJ
      ?auto_92347 - OBJ
      ?auto_92348 - OBJ
      ?auto_92343 - LOCATION
    )
    :vars
    (
      ?auto_92353 - LOCATION
      ?auto_92350 - CITY
      ?auto_92349 - LOCATION
      ?auto_92351 - LOCATION
      ?auto_92352 - LOCATION
      ?auto_92354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92353 ?auto_92350 ) ( IN-CITY ?auto_92343 ?auto_92350 ) ( not ( = ?auto_92343 ?auto_92353 ) ) ( OBJ-AT ?auto_92347 ?auto_92353 ) ( IN-CITY ?auto_92349 ?auto_92350 ) ( not ( = ?auto_92343 ?auto_92349 ) ) ( OBJ-AT ?auto_92344 ?auto_92349 ) ( IN-CITY ?auto_92351 ?auto_92350 ) ( not ( = ?auto_92343 ?auto_92351 ) ) ( OBJ-AT ?auto_92345 ?auto_92351 ) ( IN-CITY ?auto_92352 ?auto_92350 ) ( not ( = ?auto_92343 ?auto_92352 ) ) ( OBJ-AT ?auto_92348 ?auto_92352 ) ( OBJ-AT ?auto_92346 ?auto_92353 ) ( TRUCK-AT ?auto_92354 ?auto_92343 ) ( not ( = ?auto_92346 ?auto_92348 ) ) ( not ( = ?auto_92352 ?auto_92353 ) ) ( not ( = ?auto_92346 ?auto_92345 ) ) ( not ( = ?auto_92348 ?auto_92345 ) ) ( not ( = ?auto_92351 ?auto_92352 ) ) ( not ( = ?auto_92351 ?auto_92353 ) ) ( not ( = ?auto_92346 ?auto_92344 ) ) ( not ( = ?auto_92348 ?auto_92344 ) ) ( not ( = ?auto_92345 ?auto_92344 ) ) ( not ( = ?auto_92349 ?auto_92351 ) ) ( not ( = ?auto_92349 ?auto_92352 ) ) ( not ( = ?auto_92349 ?auto_92353 ) ) ( not ( = ?auto_92346 ?auto_92347 ) ) ( not ( = ?auto_92348 ?auto_92347 ) ) ( not ( = ?auto_92345 ?auto_92347 ) ) ( not ( = ?auto_92344 ?auto_92347 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92346 ?auto_92348 ?auto_92345 ?auto_92347 ?auto_92344 ?auto_92343 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92395 - OBJ
      ?auto_92396 - OBJ
      ?auto_92397 - OBJ
      ?auto_92398 - OBJ
      ?auto_92399 - OBJ
      ?auto_92394 - LOCATION
    )
    :vars
    (
      ?auto_92404 - LOCATION
      ?auto_92401 - CITY
      ?auto_92400 - LOCATION
      ?auto_92402 - LOCATION
      ?auto_92403 - LOCATION
      ?auto_92405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92404 ?auto_92401 ) ( IN-CITY ?auto_92394 ?auto_92401 ) ( not ( = ?auto_92394 ?auto_92404 ) ) ( OBJ-AT ?auto_92399 ?auto_92404 ) ( IN-CITY ?auto_92400 ?auto_92401 ) ( not ( = ?auto_92394 ?auto_92400 ) ) ( OBJ-AT ?auto_92395 ?auto_92400 ) ( IN-CITY ?auto_92402 ?auto_92401 ) ( not ( = ?auto_92394 ?auto_92402 ) ) ( OBJ-AT ?auto_92396 ?auto_92402 ) ( IN-CITY ?auto_92403 ?auto_92401 ) ( not ( = ?auto_92394 ?auto_92403 ) ) ( OBJ-AT ?auto_92397 ?auto_92403 ) ( OBJ-AT ?auto_92398 ?auto_92404 ) ( TRUCK-AT ?auto_92405 ?auto_92394 ) ( not ( = ?auto_92398 ?auto_92397 ) ) ( not ( = ?auto_92403 ?auto_92404 ) ) ( not ( = ?auto_92398 ?auto_92396 ) ) ( not ( = ?auto_92397 ?auto_92396 ) ) ( not ( = ?auto_92402 ?auto_92403 ) ) ( not ( = ?auto_92402 ?auto_92404 ) ) ( not ( = ?auto_92398 ?auto_92395 ) ) ( not ( = ?auto_92397 ?auto_92395 ) ) ( not ( = ?auto_92396 ?auto_92395 ) ) ( not ( = ?auto_92400 ?auto_92402 ) ) ( not ( = ?auto_92400 ?auto_92403 ) ) ( not ( = ?auto_92400 ?auto_92404 ) ) ( not ( = ?auto_92398 ?auto_92399 ) ) ( not ( = ?auto_92397 ?auto_92399 ) ) ( not ( = ?auto_92396 ?auto_92399 ) ) ( not ( = ?auto_92395 ?auto_92399 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92398 ?auto_92397 ?auto_92396 ?auto_92399 ?auto_92395 ?auto_92394 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92446 - OBJ
      ?auto_92447 - OBJ
      ?auto_92448 - OBJ
      ?auto_92449 - OBJ
      ?auto_92450 - OBJ
      ?auto_92445 - LOCATION
    )
    :vars
    (
      ?auto_92455 - LOCATION
      ?auto_92452 - CITY
      ?auto_92451 - LOCATION
      ?auto_92453 - LOCATION
      ?auto_92454 - LOCATION
      ?auto_92456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92455 ?auto_92452 ) ( IN-CITY ?auto_92445 ?auto_92452 ) ( not ( = ?auto_92445 ?auto_92455 ) ) ( OBJ-AT ?auto_92449 ?auto_92455 ) ( IN-CITY ?auto_92451 ?auto_92452 ) ( not ( = ?auto_92445 ?auto_92451 ) ) ( OBJ-AT ?auto_92446 ?auto_92451 ) ( IN-CITY ?auto_92453 ?auto_92452 ) ( not ( = ?auto_92445 ?auto_92453 ) ) ( OBJ-AT ?auto_92447 ?auto_92453 ) ( IN-CITY ?auto_92454 ?auto_92452 ) ( not ( = ?auto_92445 ?auto_92454 ) ) ( OBJ-AT ?auto_92448 ?auto_92454 ) ( OBJ-AT ?auto_92450 ?auto_92455 ) ( TRUCK-AT ?auto_92456 ?auto_92445 ) ( not ( = ?auto_92450 ?auto_92448 ) ) ( not ( = ?auto_92454 ?auto_92455 ) ) ( not ( = ?auto_92450 ?auto_92447 ) ) ( not ( = ?auto_92448 ?auto_92447 ) ) ( not ( = ?auto_92453 ?auto_92454 ) ) ( not ( = ?auto_92453 ?auto_92455 ) ) ( not ( = ?auto_92450 ?auto_92446 ) ) ( not ( = ?auto_92448 ?auto_92446 ) ) ( not ( = ?auto_92447 ?auto_92446 ) ) ( not ( = ?auto_92451 ?auto_92453 ) ) ( not ( = ?auto_92451 ?auto_92454 ) ) ( not ( = ?auto_92451 ?auto_92455 ) ) ( not ( = ?auto_92450 ?auto_92449 ) ) ( not ( = ?auto_92448 ?auto_92449 ) ) ( not ( = ?auto_92447 ?auto_92449 ) ) ( not ( = ?auto_92446 ?auto_92449 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92450 ?auto_92448 ?auto_92447 ?auto_92449 ?auto_92446 ?auto_92445 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92767 - OBJ
      ?auto_92768 - OBJ
      ?auto_92769 - OBJ
      ?auto_92770 - OBJ
      ?auto_92771 - OBJ
      ?auto_92766 - LOCATION
    )
    :vars
    (
      ?auto_92776 - LOCATION
      ?auto_92773 - CITY
      ?auto_92772 - LOCATION
      ?auto_92774 - LOCATION
      ?auto_92775 - LOCATION
      ?auto_92777 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92776 ?auto_92773 ) ( IN-CITY ?auto_92766 ?auto_92773 ) ( not ( = ?auto_92766 ?auto_92776 ) ) ( OBJ-AT ?auto_92769 ?auto_92776 ) ( IN-CITY ?auto_92772 ?auto_92773 ) ( not ( = ?auto_92766 ?auto_92772 ) ) ( OBJ-AT ?auto_92767 ?auto_92772 ) ( IN-CITY ?auto_92774 ?auto_92773 ) ( not ( = ?auto_92766 ?auto_92774 ) ) ( OBJ-AT ?auto_92768 ?auto_92774 ) ( IN-CITY ?auto_92775 ?auto_92773 ) ( not ( = ?auto_92766 ?auto_92775 ) ) ( OBJ-AT ?auto_92771 ?auto_92775 ) ( OBJ-AT ?auto_92770 ?auto_92776 ) ( TRUCK-AT ?auto_92777 ?auto_92766 ) ( not ( = ?auto_92770 ?auto_92771 ) ) ( not ( = ?auto_92775 ?auto_92776 ) ) ( not ( = ?auto_92770 ?auto_92768 ) ) ( not ( = ?auto_92771 ?auto_92768 ) ) ( not ( = ?auto_92774 ?auto_92775 ) ) ( not ( = ?auto_92774 ?auto_92776 ) ) ( not ( = ?auto_92770 ?auto_92767 ) ) ( not ( = ?auto_92771 ?auto_92767 ) ) ( not ( = ?auto_92768 ?auto_92767 ) ) ( not ( = ?auto_92772 ?auto_92774 ) ) ( not ( = ?auto_92772 ?auto_92775 ) ) ( not ( = ?auto_92772 ?auto_92776 ) ) ( not ( = ?auto_92770 ?auto_92769 ) ) ( not ( = ?auto_92771 ?auto_92769 ) ) ( not ( = ?auto_92768 ?auto_92769 ) ) ( not ( = ?auto_92767 ?auto_92769 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92770 ?auto_92771 ?auto_92768 ?auto_92769 ?auto_92767 ?auto_92766 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_92818 - OBJ
      ?auto_92819 - OBJ
      ?auto_92820 - OBJ
      ?auto_92821 - OBJ
      ?auto_92822 - OBJ
      ?auto_92817 - LOCATION
    )
    :vars
    (
      ?auto_92827 - LOCATION
      ?auto_92824 - CITY
      ?auto_92823 - LOCATION
      ?auto_92825 - LOCATION
      ?auto_92826 - LOCATION
      ?auto_92828 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_92827 ?auto_92824 ) ( IN-CITY ?auto_92817 ?auto_92824 ) ( not ( = ?auto_92817 ?auto_92827 ) ) ( OBJ-AT ?auto_92820 ?auto_92827 ) ( IN-CITY ?auto_92823 ?auto_92824 ) ( not ( = ?auto_92817 ?auto_92823 ) ) ( OBJ-AT ?auto_92818 ?auto_92823 ) ( IN-CITY ?auto_92825 ?auto_92824 ) ( not ( = ?auto_92817 ?auto_92825 ) ) ( OBJ-AT ?auto_92819 ?auto_92825 ) ( IN-CITY ?auto_92826 ?auto_92824 ) ( not ( = ?auto_92817 ?auto_92826 ) ) ( OBJ-AT ?auto_92821 ?auto_92826 ) ( OBJ-AT ?auto_92822 ?auto_92827 ) ( TRUCK-AT ?auto_92828 ?auto_92817 ) ( not ( = ?auto_92822 ?auto_92821 ) ) ( not ( = ?auto_92826 ?auto_92827 ) ) ( not ( = ?auto_92822 ?auto_92819 ) ) ( not ( = ?auto_92821 ?auto_92819 ) ) ( not ( = ?auto_92825 ?auto_92826 ) ) ( not ( = ?auto_92825 ?auto_92827 ) ) ( not ( = ?auto_92822 ?auto_92818 ) ) ( not ( = ?auto_92821 ?auto_92818 ) ) ( not ( = ?auto_92819 ?auto_92818 ) ) ( not ( = ?auto_92823 ?auto_92825 ) ) ( not ( = ?auto_92823 ?auto_92826 ) ) ( not ( = ?auto_92823 ?auto_92827 ) ) ( not ( = ?auto_92822 ?auto_92820 ) ) ( not ( = ?auto_92821 ?auto_92820 ) ) ( not ( = ?auto_92819 ?auto_92820 ) ) ( not ( = ?auto_92818 ?auto_92820 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_92822 ?auto_92821 ?auto_92819 ?auto_92820 ?auto_92818 ?auto_92817 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94023 - OBJ
      ?auto_94024 - OBJ
      ?auto_94025 - OBJ
      ?auto_94026 - OBJ
      ?auto_94027 - OBJ
      ?auto_94022 - LOCATION
    )
    :vars
    (
      ?auto_94032 - LOCATION
      ?auto_94029 - CITY
      ?auto_94028 - LOCATION
      ?auto_94030 - LOCATION
      ?auto_94031 - LOCATION
      ?auto_94033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94032 ?auto_94029 ) ( IN-CITY ?auto_94022 ?auto_94029 ) ( not ( = ?auto_94022 ?auto_94032 ) ) ( OBJ-AT ?auto_94024 ?auto_94032 ) ( IN-CITY ?auto_94028 ?auto_94029 ) ( not ( = ?auto_94022 ?auto_94028 ) ) ( OBJ-AT ?auto_94023 ?auto_94028 ) ( IN-CITY ?auto_94030 ?auto_94029 ) ( not ( = ?auto_94022 ?auto_94030 ) ) ( OBJ-AT ?auto_94027 ?auto_94030 ) ( IN-CITY ?auto_94031 ?auto_94029 ) ( not ( = ?auto_94022 ?auto_94031 ) ) ( OBJ-AT ?auto_94026 ?auto_94031 ) ( OBJ-AT ?auto_94025 ?auto_94032 ) ( TRUCK-AT ?auto_94033 ?auto_94022 ) ( not ( = ?auto_94025 ?auto_94026 ) ) ( not ( = ?auto_94031 ?auto_94032 ) ) ( not ( = ?auto_94025 ?auto_94027 ) ) ( not ( = ?auto_94026 ?auto_94027 ) ) ( not ( = ?auto_94030 ?auto_94031 ) ) ( not ( = ?auto_94030 ?auto_94032 ) ) ( not ( = ?auto_94025 ?auto_94023 ) ) ( not ( = ?auto_94026 ?auto_94023 ) ) ( not ( = ?auto_94027 ?auto_94023 ) ) ( not ( = ?auto_94028 ?auto_94030 ) ) ( not ( = ?auto_94028 ?auto_94031 ) ) ( not ( = ?auto_94028 ?auto_94032 ) ) ( not ( = ?auto_94025 ?auto_94024 ) ) ( not ( = ?auto_94026 ?auto_94024 ) ) ( not ( = ?auto_94027 ?auto_94024 ) ) ( not ( = ?auto_94023 ?auto_94024 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94025 ?auto_94026 ?auto_94027 ?auto_94024 ?auto_94023 ?auto_94022 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94074 - OBJ
      ?auto_94075 - OBJ
      ?auto_94076 - OBJ
      ?auto_94077 - OBJ
      ?auto_94078 - OBJ
      ?auto_94073 - LOCATION
    )
    :vars
    (
      ?auto_94083 - LOCATION
      ?auto_94080 - CITY
      ?auto_94079 - LOCATION
      ?auto_94081 - LOCATION
      ?auto_94082 - LOCATION
      ?auto_94084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94083 ?auto_94080 ) ( IN-CITY ?auto_94073 ?auto_94080 ) ( not ( = ?auto_94073 ?auto_94083 ) ) ( OBJ-AT ?auto_94075 ?auto_94083 ) ( IN-CITY ?auto_94079 ?auto_94080 ) ( not ( = ?auto_94073 ?auto_94079 ) ) ( OBJ-AT ?auto_94074 ?auto_94079 ) ( IN-CITY ?auto_94081 ?auto_94080 ) ( not ( = ?auto_94073 ?auto_94081 ) ) ( OBJ-AT ?auto_94077 ?auto_94081 ) ( IN-CITY ?auto_94082 ?auto_94080 ) ( not ( = ?auto_94073 ?auto_94082 ) ) ( OBJ-AT ?auto_94078 ?auto_94082 ) ( OBJ-AT ?auto_94076 ?auto_94083 ) ( TRUCK-AT ?auto_94084 ?auto_94073 ) ( not ( = ?auto_94076 ?auto_94078 ) ) ( not ( = ?auto_94082 ?auto_94083 ) ) ( not ( = ?auto_94076 ?auto_94077 ) ) ( not ( = ?auto_94078 ?auto_94077 ) ) ( not ( = ?auto_94081 ?auto_94082 ) ) ( not ( = ?auto_94081 ?auto_94083 ) ) ( not ( = ?auto_94076 ?auto_94074 ) ) ( not ( = ?auto_94078 ?auto_94074 ) ) ( not ( = ?auto_94077 ?auto_94074 ) ) ( not ( = ?auto_94079 ?auto_94081 ) ) ( not ( = ?auto_94079 ?auto_94082 ) ) ( not ( = ?auto_94079 ?auto_94083 ) ) ( not ( = ?auto_94076 ?auto_94075 ) ) ( not ( = ?auto_94078 ?auto_94075 ) ) ( not ( = ?auto_94077 ?auto_94075 ) ) ( not ( = ?auto_94074 ?auto_94075 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94076 ?auto_94078 ?auto_94077 ?auto_94075 ?auto_94074 ?auto_94073 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94287 - OBJ
      ?auto_94288 - OBJ
      ?auto_94289 - OBJ
      ?auto_94290 - OBJ
      ?auto_94291 - OBJ
      ?auto_94286 - LOCATION
    )
    :vars
    (
      ?auto_94296 - LOCATION
      ?auto_94293 - CITY
      ?auto_94292 - LOCATION
      ?auto_94294 - LOCATION
      ?auto_94295 - LOCATION
      ?auto_94297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94296 ?auto_94293 ) ( IN-CITY ?auto_94286 ?auto_94293 ) ( not ( = ?auto_94286 ?auto_94296 ) ) ( OBJ-AT ?auto_94288 ?auto_94296 ) ( IN-CITY ?auto_94292 ?auto_94293 ) ( not ( = ?auto_94286 ?auto_94292 ) ) ( OBJ-AT ?auto_94287 ?auto_94292 ) ( IN-CITY ?auto_94294 ?auto_94293 ) ( not ( = ?auto_94286 ?auto_94294 ) ) ( OBJ-AT ?auto_94291 ?auto_94294 ) ( IN-CITY ?auto_94295 ?auto_94293 ) ( not ( = ?auto_94286 ?auto_94295 ) ) ( OBJ-AT ?auto_94289 ?auto_94295 ) ( OBJ-AT ?auto_94290 ?auto_94296 ) ( TRUCK-AT ?auto_94297 ?auto_94286 ) ( not ( = ?auto_94290 ?auto_94289 ) ) ( not ( = ?auto_94295 ?auto_94296 ) ) ( not ( = ?auto_94290 ?auto_94291 ) ) ( not ( = ?auto_94289 ?auto_94291 ) ) ( not ( = ?auto_94294 ?auto_94295 ) ) ( not ( = ?auto_94294 ?auto_94296 ) ) ( not ( = ?auto_94290 ?auto_94287 ) ) ( not ( = ?auto_94289 ?auto_94287 ) ) ( not ( = ?auto_94291 ?auto_94287 ) ) ( not ( = ?auto_94292 ?auto_94294 ) ) ( not ( = ?auto_94292 ?auto_94295 ) ) ( not ( = ?auto_94292 ?auto_94296 ) ) ( not ( = ?auto_94290 ?auto_94288 ) ) ( not ( = ?auto_94289 ?auto_94288 ) ) ( not ( = ?auto_94291 ?auto_94288 ) ) ( not ( = ?auto_94287 ?auto_94288 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94290 ?auto_94289 ?auto_94291 ?auto_94288 ?auto_94287 ?auto_94286 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94393 - OBJ
      ?auto_94394 - OBJ
      ?auto_94395 - OBJ
      ?auto_94396 - OBJ
      ?auto_94397 - OBJ
      ?auto_94392 - LOCATION
    )
    :vars
    (
      ?auto_94402 - LOCATION
      ?auto_94399 - CITY
      ?auto_94398 - LOCATION
      ?auto_94400 - LOCATION
      ?auto_94401 - LOCATION
      ?auto_94403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94402 ?auto_94399 ) ( IN-CITY ?auto_94392 ?auto_94399 ) ( not ( = ?auto_94392 ?auto_94402 ) ) ( OBJ-AT ?auto_94394 ?auto_94402 ) ( IN-CITY ?auto_94398 ?auto_94399 ) ( not ( = ?auto_94392 ?auto_94398 ) ) ( OBJ-AT ?auto_94393 ?auto_94398 ) ( IN-CITY ?auto_94400 ?auto_94399 ) ( not ( = ?auto_94392 ?auto_94400 ) ) ( OBJ-AT ?auto_94396 ?auto_94400 ) ( IN-CITY ?auto_94401 ?auto_94399 ) ( not ( = ?auto_94392 ?auto_94401 ) ) ( OBJ-AT ?auto_94395 ?auto_94401 ) ( OBJ-AT ?auto_94397 ?auto_94402 ) ( TRUCK-AT ?auto_94403 ?auto_94392 ) ( not ( = ?auto_94397 ?auto_94395 ) ) ( not ( = ?auto_94401 ?auto_94402 ) ) ( not ( = ?auto_94397 ?auto_94396 ) ) ( not ( = ?auto_94395 ?auto_94396 ) ) ( not ( = ?auto_94400 ?auto_94401 ) ) ( not ( = ?auto_94400 ?auto_94402 ) ) ( not ( = ?auto_94397 ?auto_94393 ) ) ( not ( = ?auto_94395 ?auto_94393 ) ) ( not ( = ?auto_94396 ?auto_94393 ) ) ( not ( = ?auto_94398 ?auto_94400 ) ) ( not ( = ?auto_94398 ?auto_94401 ) ) ( not ( = ?auto_94398 ?auto_94402 ) ) ( not ( = ?auto_94397 ?auto_94394 ) ) ( not ( = ?auto_94395 ?auto_94394 ) ) ( not ( = ?auto_94396 ?auto_94394 ) ) ( not ( = ?auto_94393 ?auto_94394 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94397 ?auto_94395 ?auto_94396 ?auto_94394 ?auto_94393 ?auto_94392 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94606 - OBJ
      ?auto_94607 - OBJ
      ?auto_94608 - OBJ
      ?auto_94609 - OBJ
      ?auto_94610 - OBJ
      ?auto_94605 - LOCATION
    )
    :vars
    (
      ?auto_94615 - LOCATION
      ?auto_94612 - CITY
      ?auto_94611 - LOCATION
      ?auto_94613 - LOCATION
      ?auto_94614 - LOCATION
      ?auto_94616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94615 ?auto_94612 ) ( IN-CITY ?auto_94605 ?auto_94612 ) ( not ( = ?auto_94605 ?auto_94615 ) ) ( OBJ-AT ?auto_94607 ?auto_94615 ) ( IN-CITY ?auto_94611 ?auto_94612 ) ( not ( = ?auto_94605 ?auto_94611 ) ) ( OBJ-AT ?auto_94606 ?auto_94611 ) ( IN-CITY ?auto_94613 ?auto_94612 ) ( not ( = ?auto_94605 ?auto_94613 ) ) ( OBJ-AT ?auto_94608 ?auto_94613 ) ( IN-CITY ?auto_94614 ?auto_94612 ) ( not ( = ?auto_94605 ?auto_94614 ) ) ( OBJ-AT ?auto_94610 ?auto_94614 ) ( OBJ-AT ?auto_94609 ?auto_94615 ) ( TRUCK-AT ?auto_94616 ?auto_94605 ) ( not ( = ?auto_94609 ?auto_94610 ) ) ( not ( = ?auto_94614 ?auto_94615 ) ) ( not ( = ?auto_94609 ?auto_94608 ) ) ( not ( = ?auto_94610 ?auto_94608 ) ) ( not ( = ?auto_94613 ?auto_94614 ) ) ( not ( = ?auto_94613 ?auto_94615 ) ) ( not ( = ?auto_94609 ?auto_94606 ) ) ( not ( = ?auto_94610 ?auto_94606 ) ) ( not ( = ?auto_94608 ?auto_94606 ) ) ( not ( = ?auto_94611 ?auto_94613 ) ) ( not ( = ?auto_94611 ?auto_94614 ) ) ( not ( = ?auto_94611 ?auto_94615 ) ) ( not ( = ?auto_94609 ?auto_94607 ) ) ( not ( = ?auto_94610 ?auto_94607 ) ) ( not ( = ?auto_94608 ?auto_94607 ) ) ( not ( = ?auto_94606 ?auto_94607 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94609 ?auto_94610 ?auto_94608 ?auto_94607 ?auto_94606 ?auto_94605 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_94657 - OBJ
      ?auto_94658 - OBJ
      ?auto_94659 - OBJ
      ?auto_94660 - OBJ
      ?auto_94661 - OBJ
      ?auto_94656 - LOCATION
    )
    :vars
    (
      ?auto_94666 - LOCATION
      ?auto_94663 - CITY
      ?auto_94662 - LOCATION
      ?auto_94664 - LOCATION
      ?auto_94665 - LOCATION
      ?auto_94667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_94666 ?auto_94663 ) ( IN-CITY ?auto_94656 ?auto_94663 ) ( not ( = ?auto_94656 ?auto_94666 ) ) ( OBJ-AT ?auto_94658 ?auto_94666 ) ( IN-CITY ?auto_94662 ?auto_94663 ) ( not ( = ?auto_94656 ?auto_94662 ) ) ( OBJ-AT ?auto_94657 ?auto_94662 ) ( IN-CITY ?auto_94664 ?auto_94663 ) ( not ( = ?auto_94656 ?auto_94664 ) ) ( OBJ-AT ?auto_94659 ?auto_94664 ) ( IN-CITY ?auto_94665 ?auto_94663 ) ( not ( = ?auto_94656 ?auto_94665 ) ) ( OBJ-AT ?auto_94660 ?auto_94665 ) ( OBJ-AT ?auto_94661 ?auto_94666 ) ( TRUCK-AT ?auto_94667 ?auto_94656 ) ( not ( = ?auto_94661 ?auto_94660 ) ) ( not ( = ?auto_94665 ?auto_94666 ) ) ( not ( = ?auto_94661 ?auto_94659 ) ) ( not ( = ?auto_94660 ?auto_94659 ) ) ( not ( = ?auto_94664 ?auto_94665 ) ) ( not ( = ?auto_94664 ?auto_94666 ) ) ( not ( = ?auto_94661 ?auto_94657 ) ) ( not ( = ?auto_94660 ?auto_94657 ) ) ( not ( = ?auto_94659 ?auto_94657 ) ) ( not ( = ?auto_94662 ?auto_94664 ) ) ( not ( = ?auto_94662 ?auto_94665 ) ) ( not ( = ?auto_94662 ?auto_94666 ) ) ( not ( = ?auto_94661 ?auto_94658 ) ) ( not ( = ?auto_94660 ?auto_94658 ) ) ( not ( = ?auto_94659 ?auto_94658 ) ) ( not ( = ?auto_94657 ?auto_94658 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_94661 ?auto_94660 ?auto_94659 ?auto_94658 ?auto_94657 ?auto_94656 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96144 - OBJ
      ?auto_96145 - OBJ
      ?auto_96146 - OBJ
      ?auto_96147 - OBJ
      ?auto_96148 - OBJ
      ?auto_96143 - LOCATION
    )
    :vars
    (
      ?auto_96153 - LOCATION
      ?auto_96150 - CITY
      ?auto_96149 - LOCATION
      ?auto_96151 - LOCATION
      ?auto_96152 - LOCATION
      ?auto_96154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96153 ?auto_96150 ) ( IN-CITY ?auto_96143 ?auto_96150 ) ( not ( = ?auto_96143 ?auto_96153 ) ) ( OBJ-AT ?auto_96144 ?auto_96153 ) ( IN-CITY ?auto_96149 ?auto_96150 ) ( not ( = ?auto_96143 ?auto_96149 ) ) ( OBJ-AT ?auto_96148 ?auto_96149 ) ( IN-CITY ?auto_96151 ?auto_96150 ) ( not ( = ?auto_96143 ?auto_96151 ) ) ( OBJ-AT ?auto_96147 ?auto_96151 ) ( IN-CITY ?auto_96152 ?auto_96150 ) ( not ( = ?auto_96143 ?auto_96152 ) ) ( OBJ-AT ?auto_96146 ?auto_96152 ) ( OBJ-AT ?auto_96145 ?auto_96153 ) ( TRUCK-AT ?auto_96154 ?auto_96143 ) ( not ( = ?auto_96145 ?auto_96146 ) ) ( not ( = ?auto_96152 ?auto_96153 ) ) ( not ( = ?auto_96145 ?auto_96147 ) ) ( not ( = ?auto_96146 ?auto_96147 ) ) ( not ( = ?auto_96151 ?auto_96152 ) ) ( not ( = ?auto_96151 ?auto_96153 ) ) ( not ( = ?auto_96145 ?auto_96148 ) ) ( not ( = ?auto_96146 ?auto_96148 ) ) ( not ( = ?auto_96147 ?auto_96148 ) ) ( not ( = ?auto_96149 ?auto_96151 ) ) ( not ( = ?auto_96149 ?auto_96152 ) ) ( not ( = ?auto_96149 ?auto_96153 ) ) ( not ( = ?auto_96145 ?auto_96144 ) ) ( not ( = ?auto_96146 ?auto_96144 ) ) ( not ( = ?auto_96147 ?auto_96144 ) ) ( not ( = ?auto_96148 ?auto_96144 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96145 ?auto_96146 ?auto_96147 ?auto_96144 ?auto_96148 ?auto_96143 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96195 - OBJ
      ?auto_96196 - OBJ
      ?auto_96197 - OBJ
      ?auto_96198 - OBJ
      ?auto_96199 - OBJ
      ?auto_96194 - LOCATION
    )
    :vars
    (
      ?auto_96204 - LOCATION
      ?auto_96201 - CITY
      ?auto_96200 - LOCATION
      ?auto_96202 - LOCATION
      ?auto_96203 - LOCATION
      ?auto_96205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96204 ?auto_96201 ) ( IN-CITY ?auto_96194 ?auto_96201 ) ( not ( = ?auto_96194 ?auto_96204 ) ) ( OBJ-AT ?auto_96195 ?auto_96204 ) ( IN-CITY ?auto_96200 ?auto_96201 ) ( not ( = ?auto_96194 ?auto_96200 ) ) ( OBJ-AT ?auto_96198 ?auto_96200 ) ( IN-CITY ?auto_96202 ?auto_96201 ) ( not ( = ?auto_96194 ?auto_96202 ) ) ( OBJ-AT ?auto_96199 ?auto_96202 ) ( IN-CITY ?auto_96203 ?auto_96201 ) ( not ( = ?auto_96194 ?auto_96203 ) ) ( OBJ-AT ?auto_96197 ?auto_96203 ) ( OBJ-AT ?auto_96196 ?auto_96204 ) ( TRUCK-AT ?auto_96205 ?auto_96194 ) ( not ( = ?auto_96196 ?auto_96197 ) ) ( not ( = ?auto_96203 ?auto_96204 ) ) ( not ( = ?auto_96196 ?auto_96199 ) ) ( not ( = ?auto_96197 ?auto_96199 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( not ( = ?auto_96202 ?auto_96204 ) ) ( not ( = ?auto_96196 ?auto_96198 ) ) ( not ( = ?auto_96197 ?auto_96198 ) ) ( not ( = ?auto_96199 ?auto_96198 ) ) ( not ( = ?auto_96200 ?auto_96202 ) ) ( not ( = ?auto_96200 ?auto_96203 ) ) ( not ( = ?auto_96200 ?auto_96204 ) ) ( not ( = ?auto_96196 ?auto_96195 ) ) ( not ( = ?auto_96197 ?auto_96195 ) ) ( not ( = ?auto_96199 ?auto_96195 ) ) ( not ( = ?auto_96198 ?auto_96195 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96196 ?auto_96197 ?auto_96199 ?auto_96195 ?auto_96198 ?auto_96194 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96408 - OBJ
      ?auto_96409 - OBJ
      ?auto_96410 - OBJ
      ?auto_96411 - OBJ
      ?auto_96412 - OBJ
      ?auto_96407 - LOCATION
    )
    :vars
    (
      ?auto_96417 - LOCATION
      ?auto_96414 - CITY
      ?auto_96413 - LOCATION
      ?auto_96415 - LOCATION
      ?auto_96416 - LOCATION
      ?auto_96418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96417 ?auto_96414 ) ( IN-CITY ?auto_96407 ?auto_96414 ) ( not ( = ?auto_96407 ?auto_96417 ) ) ( OBJ-AT ?auto_96408 ?auto_96417 ) ( IN-CITY ?auto_96413 ?auto_96414 ) ( not ( = ?auto_96407 ?auto_96413 ) ) ( OBJ-AT ?auto_96412 ?auto_96413 ) ( IN-CITY ?auto_96415 ?auto_96414 ) ( not ( = ?auto_96407 ?auto_96415 ) ) ( OBJ-AT ?auto_96410 ?auto_96415 ) ( IN-CITY ?auto_96416 ?auto_96414 ) ( not ( = ?auto_96407 ?auto_96416 ) ) ( OBJ-AT ?auto_96411 ?auto_96416 ) ( OBJ-AT ?auto_96409 ?auto_96417 ) ( TRUCK-AT ?auto_96418 ?auto_96407 ) ( not ( = ?auto_96409 ?auto_96411 ) ) ( not ( = ?auto_96416 ?auto_96417 ) ) ( not ( = ?auto_96409 ?auto_96410 ) ) ( not ( = ?auto_96411 ?auto_96410 ) ) ( not ( = ?auto_96415 ?auto_96416 ) ) ( not ( = ?auto_96415 ?auto_96417 ) ) ( not ( = ?auto_96409 ?auto_96412 ) ) ( not ( = ?auto_96411 ?auto_96412 ) ) ( not ( = ?auto_96410 ?auto_96412 ) ) ( not ( = ?auto_96413 ?auto_96415 ) ) ( not ( = ?auto_96413 ?auto_96416 ) ) ( not ( = ?auto_96413 ?auto_96417 ) ) ( not ( = ?auto_96409 ?auto_96408 ) ) ( not ( = ?auto_96411 ?auto_96408 ) ) ( not ( = ?auto_96410 ?auto_96408 ) ) ( not ( = ?auto_96412 ?auto_96408 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96409 ?auto_96411 ?auto_96410 ?auto_96408 ?auto_96412 ?auto_96407 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96514 - OBJ
      ?auto_96515 - OBJ
      ?auto_96516 - OBJ
      ?auto_96517 - OBJ
      ?auto_96518 - OBJ
      ?auto_96513 - LOCATION
    )
    :vars
    (
      ?auto_96523 - LOCATION
      ?auto_96520 - CITY
      ?auto_96519 - LOCATION
      ?auto_96521 - LOCATION
      ?auto_96522 - LOCATION
      ?auto_96524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96523 ?auto_96520 ) ( IN-CITY ?auto_96513 ?auto_96520 ) ( not ( = ?auto_96513 ?auto_96523 ) ) ( OBJ-AT ?auto_96514 ?auto_96523 ) ( IN-CITY ?auto_96519 ?auto_96520 ) ( not ( = ?auto_96513 ?auto_96519 ) ) ( OBJ-AT ?auto_96517 ?auto_96519 ) ( IN-CITY ?auto_96521 ?auto_96520 ) ( not ( = ?auto_96513 ?auto_96521 ) ) ( OBJ-AT ?auto_96516 ?auto_96521 ) ( IN-CITY ?auto_96522 ?auto_96520 ) ( not ( = ?auto_96513 ?auto_96522 ) ) ( OBJ-AT ?auto_96518 ?auto_96522 ) ( OBJ-AT ?auto_96515 ?auto_96523 ) ( TRUCK-AT ?auto_96524 ?auto_96513 ) ( not ( = ?auto_96515 ?auto_96518 ) ) ( not ( = ?auto_96522 ?auto_96523 ) ) ( not ( = ?auto_96515 ?auto_96516 ) ) ( not ( = ?auto_96518 ?auto_96516 ) ) ( not ( = ?auto_96521 ?auto_96522 ) ) ( not ( = ?auto_96521 ?auto_96523 ) ) ( not ( = ?auto_96515 ?auto_96517 ) ) ( not ( = ?auto_96518 ?auto_96517 ) ) ( not ( = ?auto_96516 ?auto_96517 ) ) ( not ( = ?auto_96519 ?auto_96521 ) ) ( not ( = ?auto_96519 ?auto_96522 ) ) ( not ( = ?auto_96519 ?auto_96523 ) ) ( not ( = ?auto_96515 ?auto_96514 ) ) ( not ( = ?auto_96518 ?auto_96514 ) ) ( not ( = ?auto_96516 ?auto_96514 ) ) ( not ( = ?auto_96517 ?auto_96514 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96515 ?auto_96518 ?auto_96516 ?auto_96514 ?auto_96517 ?auto_96513 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96727 - OBJ
      ?auto_96728 - OBJ
      ?auto_96729 - OBJ
      ?auto_96730 - OBJ
      ?auto_96731 - OBJ
      ?auto_96726 - LOCATION
    )
    :vars
    (
      ?auto_96736 - LOCATION
      ?auto_96733 - CITY
      ?auto_96732 - LOCATION
      ?auto_96734 - LOCATION
      ?auto_96735 - LOCATION
      ?auto_96737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96736 ?auto_96733 ) ( IN-CITY ?auto_96726 ?auto_96733 ) ( not ( = ?auto_96726 ?auto_96736 ) ) ( OBJ-AT ?auto_96727 ?auto_96736 ) ( IN-CITY ?auto_96732 ?auto_96733 ) ( not ( = ?auto_96726 ?auto_96732 ) ) ( OBJ-AT ?auto_96729 ?auto_96732 ) ( IN-CITY ?auto_96734 ?auto_96733 ) ( not ( = ?auto_96726 ?auto_96734 ) ) ( OBJ-AT ?auto_96731 ?auto_96734 ) ( IN-CITY ?auto_96735 ?auto_96733 ) ( not ( = ?auto_96726 ?auto_96735 ) ) ( OBJ-AT ?auto_96730 ?auto_96735 ) ( OBJ-AT ?auto_96728 ?auto_96736 ) ( TRUCK-AT ?auto_96737 ?auto_96726 ) ( not ( = ?auto_96728 ?auto_96730 ) ) ( not ( = ?auto_96735 ?auto_96736 ) ) ( not ( = ?auto_96728 ?auto_96731 ) ) ( not ( = ?auto_96730 ?auto_96731 ) ) ( not ( = ?auto_96734 ?auto_96735 ) ) ( not ( = ?auto_96734 ?auto_96736 ) ) ( not ( = ?auto_96728 ?auto_96729 ) ) ( not ( = ?auto_96730 ?auto_96729 ) ) ( not ( = ?auto_96731 ?auto_96729 ) ) ( not ( = ?auto_96732 ?auto_96734 ) ) ( not ( = ?auto_96732 ?auto_96735 ) ) ( not ( = ?auto_96732 ?auto_96736 ) ) ( not ( = ?auto_96728 ?auto_96727 ) ) ( not ( = ?auto_96730 ?auto_96727 ) ) ( not ( = ?auto_96731 ?auto_96727 ) ) ( not ( = ?auto_96729 ?auto_96727 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96728 ?auto_96730 ?auto_96731 ?auto_96727 ?auto_96729 ?auto_96726 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_96778 - OBJ
      ?auto_96779 - OBJ
      ?auto_96780 - OBJ
      ?auto_96781 - OBJ
      ?auto_96782 - OBJ
      ?auto_96777 - LOCATION
    )
    :vars
    (
      ?auto_96787 - LOCATION
      ?auto_96784 - CITY
      ?auto_96783 - LOCATION
      ?auto_96785 - LOCATION
      ?auto_96786 - LOCATION
      ?auto_96788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96787 ?auto_96784 ) ( IN-CITY ?auto_96777 ?auto_96784 ) ( not ( = ?auto_96777 ?auto_96787 ) ) ( OBJ-AT ?auto_96778 ?auto_96787 ) ( IN-CITY ?auto_96783 ?auto_96784 ) ( not ( = ?auto_96777 ?auto_96783 ) ) ( OBJ-AT ?auto_96780 ?auto_96783 ) ( IN-CITY ?auto_96785 ?auto_96784 ) ( not ( = ?auto_96777 ?auto_96785 ) ) ( OBJ-AT ?auto_96781 ?auto_96785 ) ( IN-CITY ?auto_96786 ?auto_96784 ) ( not ( = ?auto_96777 ?auto_96786 ) ) ( OBJ-AT ?auto_96782 ?auto_96786 ) ( OBJ-AT ?auto_96779 ?auto_96787 ) ( TRUCK-AT ?auto_96788 ?auto_96777 ) ( not ( = ?auto_96779 ?auto_96782 ) ) ( not ( = ?auto_96786 ?auto_96787 ) ) ( not ( = ?auto_96779 ?auto_96781 ) ) ( not ( = ?auto_96782 ?auto_96781 ) ) ( not ( = ?auto_96785 ?auto_96786 ) ) ( not ( = ?auto_96785 ?auto_96787 ) ) ( not ( = ?auto_96779 ?auto_96780 ) ) ( not ( = ?auto_96782 ?auto_96780 ) ) ( not ( = ?auto_96781 ?auto_96780 ) ) ( not ( = ?auto_96783 ?auto_96785 ) ) ( not ( = ?auto_96783 ?auto_96786 ) ) ( not ( = ?auto_96783 ?auto_96787 ) ) ( not ( = ?auto_96779 ?auto_96778 ) ) ( not ( = ?auto_96782 ?auto_96778 ) ) ( not ( = ?auto_96781 ?auto_96778 ) ) ( not ( = ?auto_96780 ?auto_96778 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_96779 ?auto_96782 ?auto_96781 ?auto_96778 ?auto_96780 ?auto_96777 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97488 - OBJ
      ?auto_97489 - OBJ
      ?auto_97490 - OBJ
      ?auto_97491 - OBJ
      ?auto_97492 - OBJ
      ?auto_97487 - LOCATION
    )
    :vars
    (
      ?auto_97497 - LOCATION
      ?auto_97494 - CITY
      ?auto_97493 - LOCATION
      ?auto_97495 - LOCATION
      ?auto_97496 - LOCATION
      ?auto_97498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97497 ?auto_97494 ) ( IN-CITY ?auto_97487 ?auto_97494 ) ( not ( = ?auto_97487 ?auto_97497 ) ) ( OBJ-AT ?auto_97488 ?auto_97497 ) ( IN-CITY ?auto_97493 ?auto_97494 ) ( not ( = ?auto_97487 ?auto_97493 ) ) ( OBJ-AT ?auto_97492 ?auto_97493 ) ( IN-CITY ?auto_97495 ?auto_97494 ) ( not ( = ?auto_97487 ?auto_97495 ) ) ( OBJ-AT ?auto_97491 ?auto_97495 ) ( IN-CITY ?auto_97496 ?auto_97494 ) ( not ( = ?auto_97487 ?auto_97496 ) ) ( OBJ-AT ?auto_97489 ?auto_97496 ) ( OBJ-AT ?auto_97490 ?auto_97497 ) ( TRUCK-AT ?auto_97498 ?auto_97487 ) ( not ( = ?auto_97490 ?auto_97489 ) ) ( not ( = ?auto_97496 ?auto_97497 ) ) ( not ( = ?auto_97490 ?auto_97491 ) ) ( not ( = ?auto_97489 ?auto_97491 ) ) ( not ( = ?auto_97495 ?auto_97496 ) ) ( not ( = ?auto_97495 ?auto_97497 ) ) ( not ( = ?auto_97490 ?auto_97492 ) ) ( not ( = ?auto_97489 ?auto_97492 ) ) ( not ( = ?auto_97491 ?auto_97492 ) ) ( not ( = ?auto_97493 ?auto_97495 ) ) ( not ( = ?auto_97493 ?auto_97496 ) ) ( not ( = ?auto_97493 ?auto_97497 ) ) ( not ( = ?auto_97490 ?auto_97488 ) ) ( not ( = ?auto_97489 ?auto_97488 ) ) ( not ( = ?auto_97491 ?auto_97488 ) ) ( not ( = ?auto_97492 ?auto_97488 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97490 ?auto_97489 ?auto_97491 ?auto_97488 ?auto_97492 ?auto_97487 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_97539 - OBJ
      ?auto_97540 - OBJ
      ?auto_97541 - OBJ
      ?auto_97542 - OBJ
      ?auto_97543 - OBJ
      ?auto_97538 - LOCATION
    )
    :vars
    (
      ?auto_97548 - LOCATION
      ?auto_97545 - CITY
      ?auto_97544 - LOCATION
      ?auto_97546 - LOCATION
      ?auto_97547 - LOCATION
      ?auto_97549 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_97548 ?auto_97545 ) ( IN-CITY ?auto_97538 ?auto_97545 ) ( not ( = ?auto_97538 ?auto_97548 ) ) ( OBJ-AT ?auto_97539 ?auto_97548 ) ( IN-CITY ?auto_97544 ?auto_97545 ) ( not ( = ?auto_97538 ?auto_97544 ) ) ( OBJ-AT ?auto_97542 ?auto_97544 ) ( IN-CITY ?auto_97546 ?auto_97545 ) ( not ( = ?auto_97538 ?auto_97546 ) ) ( OBJ-AT ?auto_97543 ?auto_97546 ) ( IN-CITY ?auto_97547 ?auto_97545 ) ( not ( = ?auto_97538 ?auto_97547 ) ) ( OBJ-AT ?auto_97540 ?auto_97547 ) ( OBJ-AT ?auto_97541 ?auto_97548 ) ( TRUCK-AT ?auto_97549 ?auto_97538 ) ( not ( = ?auto_97541 ?auto_97540 ) ) ( not ( = ?auto_97547 ?auto_97548 ) ) ( not ( = ?auto_97541 ?auto_97543 ) ) ( not ( = ?auto_97540 ?auto_97543 ) ) ( not ( = ?auto_97546 ?auto_97547 ) ) ( not ( = ?auto_97546 ?auto_97548 ) ) ( not ( = ?auto_97541 ?auto_97542 ) ) ( not ( = ?auto_97540 ?auto_97542 ) ) ( not ( = ?auto_97543 ?auto_97542 ) ) ( not ( = ?auto_97544 ?auto_97546 ) ) ( not ( = ?auto_97544 ?auto_97547 ) ) ( not ( = ?auto_97544 ?auto_97548 ) ) ( not ( = ?auto_97541 ?auto_97539 ) ) ( not ( = ?auto_97540 ?auto_97539 ) ) ( not ( = ?auto_97543 ?auto_97539 ) ) ( not ( = ?auto_97542 ?auto_97539 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_97541 ?auto_97540 ?auto_97543 ?auto_97539 ?auto_97542 ?auto_97538 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98032 - OBJ
      ?auto_98033 - OBJ
      ?auto_98034 - OBJ
      ?auto_98035 - OBJ
      ?auto_98036 - OBJ
      ?auto_98031 - LOCATION
    )
    :vars
    (
      ?auto_98041 - LOCATION
      ?auto_98038 - CITY
      ?auto_98037 - LOCATION
      ?auto_98039 - LOCATION
      ?auto_98040 - LOCATION
      ?auto_98042 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98041 ?auto_98038 ) ( IN-CITY ?auto_98031 ?auto_98038 ) ( not ( = ?auto_98031 ?auto_98041 ) ) ( OBJ-AT ?auto_98032 ?auto_98041 ) ( IN-CITY ?auto_98037 ?auto_98038 ) ( not ( = ?auto_98031 ?auto_98037 ) ) ( OBJ-AT ?auto_98036 ?auto_98037 ) ( IN-CITY ?auto_98039 ?auto_98038 ) ( not ( = ?auto_98031 ?auto_98039 ) ) ( OBJ-AT ?auto_98034 ?auto_98039 ) ( IN-CITY ?auto_98040 ?auto_98038 ) ( not ( = ?auto_98031 ?auto_98040 ) ) ( OBJ-AT ?auto_98033 ?auto_98040 ) ( OBJ-AT ?auto_98035 ?auto_98041 ) ( TRUCK-AT ?auto_98042 ?auto_98031 ) ( not ( = ?auto_98035 ?auto_98033 ) ) ( not ( = ?auto_98040 ?auto_98041 ) ) ( not ( = ?auto_98035 ?auto_98034 ) ) ( not ( = ?auto_98033 ?auto_98034 ) ) ( not ( = ?auto_98039 ?auto_98040 ) ) ( not ( = ?auto_98039 ?auto_98041 ) ) ( not ( = ?auto_98035 ?auto_98036 ) ) ( not ( = ?auto_98033 ?auto_98036 ) ) ( not ( = ?auto_98034 ?auto_98036 ) ) ( not ( = ?auto_98037 ?auto_98039 ) ) ( not ( = ?auto_98037 ?auto_98040 ) ) ( not ( = ?auto_98037 ?auto_98041 ) ) ( not ( = ?auto_98035 ?auto_98032 ) ) ( not ( = ?auto_98033 ?auto_98032 ) ) ( not ( = ?auto_98034 ?auto_98032 ) ) ( not ( = ?auto_98036 ?auto_98032 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98035 ?auto_98033 ?auto_98034 ?auto_98032 ?auto_98036 ?auto_98031 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98193 - OBJ
      ?auto_98194 - OBJ
      ?auto_98195 - OBJ
      ?auto_98196 - OBJ
      ?auto_98197 - OBJ
      ?auto_98192 - LOCATION
    )
    :vars
    (
      ?auto_98202 - LOCATION
      ?auto_98199 - CITY
      ?auto_98198 - LOCATION
      ?auto_98200 - LOCATION
      ?auto_98201 - LOCATION
      ?auto_98203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98202 ?auto_98199 ) ( IN-CITY ?auto_98192 ?auto_98199 ) ( not ( = ?auto_98192 ?auto_98202 ) ) ( OBJ-AT ?auto_98193 ?auto_98202 ) ( IN-CITY ?auto_98198 ?auto_98199 ) ( not ( = ?auto_98192 ?auto_98198 ) ) ( OBJ-AT ?auto_98196 ?auto_98198 ) ( IN-CITY ?auto_98200 ?auto_98199 ) ( not ( = ?auto_98192 ?auto_98200 ) ) ( OBJ-AT ?auto_98195 ?auto_98200 ) ( IN-CITY ?auto_98201 ?auto_98199 ) ( not ( = ?auto_98192 ?auto_98201 ) ) ( OBJ-AT ?auto_98194 ?auto_98201 ) ( OBJ-AT ?auto_98197 ?auto_98202 ) ( TRUCK-AT ?auto_98203 ?auto_98192 ) ( not ( = ?auto_98197 ?auto_98194 ) ) ( not ( = ?auto_98201 ?auto_98202 ) ) ( not ( = ?auto_98197 ?auto_98195 ) ) ( not ( = ?auto_98194 ?auto_98195 ) ) ( not ( = ?auto_98200 ?auto_98201 ) ) ( not ( = ?auto_98200 ?auto_98202 ) ) ( not ( = ?auto_98197 ?auto_98196 ) ) ( not ( = ?auto_98194 ?auto_98196 ) ) ( not ( = ?auto_98195 ?auto_98196 ) ) ( not ( = ?auto_98198 ?auto_98200 ) ) ( not ( = ?auto_98198 ?auto_98201 ) ) ( not ( = ?auto_98198 ?auto_98202 ) ) ( not ( = ?auto_98197 ?auto_98193 ) ) ( not ( = ?auto_98194 ?auto_98193 ) ) ( not ( = ?auto_98195 ?auto_98193 ) ) ( not ( = ?auto_98196 ?auto_98193 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98197 ?auto_98194 ?auto_98195 ?auto_98193 ?auto_98196 ?auto_98192 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98351 - OBJ
      ?auto_98352 - OBJ
      ?auto_98353 - OBJ
      ?auto_98354 - OBJ
      ?auto_98355 - OBJ
      ?auto_98350 - LOCATION
    )
    :vars
    (
      ?auto_98360 - LOCATION
      ?auto_98357 - CITY
      ?auto_98356 - LOCATION
      ?auto_98358 - LOCATION
      ?auto_98359 - LOCATION
      ?auto_98361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98360 ?auto_98357 ) ( IN-CITY ?auto_98350 ?auto_98357 ) ( not ( = ?auto_98350 ?auto_98360 ) ) ( OBJ-AT ?auto_98351 ?auto_98360 ) ( IN-CITY ?auto_98356 ?auto_98357 ) ( not ( = ?auto_98350 ?auto_98356 ) ) ( OBJ-AT ?auto_98353 ?auto_98356 ) ( IN-CITY ?auto_98358 ?auto_98357 ) ( not ( = ?auto_98350 ?auto_98358 ) ) ( OBJ-AT ?auto_98355 ?auto_98358 ) ( IN-CITY ?auto_98359 ?auto_98357 ) ( not ( = ?auto_98350 ?auto_98359 ) ) ( OBJ-AT ?auto_98352 ?auto_98359 ) ( OBJ-AT ?auto_98354 ?auto_98360 ) ( TRUCK-AT ?auto_98361 ?auto_98350 ) ( not ( = ?auto_98354 ?auto_98352 ) ) ( not ( = ?auto_98359 ?auto_98360 ) ) ( not ( = ?auto_98354 ?auto_98355 ) ) ( not ( = ?auto_98352 ?auto_98355 ) ) ( not ( = ?auto_98358 ?auto_98359 ) ) ( not ( = ?auto_98358 ?auto_98360 ) ) ( not ( = ?auto_98354 ?auto_98353 ) ) ( not ( = ?auto_98352 ?auto_98353 ) ) ( not ( = ?auto_98355 ?auto_98353 ) ) ( not ( = ?auto_98356 ?auto_98358 ) ) ( not ( = ?auto_98356 ?auto_98359 ) ) ( not ( = ?auto_98356 ?auto_98360 ) ) ( not ( = ?auto_98354 ?auto_98351 ) ) ( not ( = ?auto_98352 ?auto_98351 ) ) ( not ( = ?auto_98355 ?auto_98351 ) ) ( not ( = ?auto_98353 ?auto_98351 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98354 ?auto_98352 ?auto_98355 ?auto_98351 ?auto_98353 ?auto_98350 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_98457 - OBJ
      ?auto_98458 - OBJ
      ?auto_98459 - OBJ
      ?auto_98460 - OBJ
      ?auto_98461 - OBJ
      ?auto_98456 - LOCATION
    )
    :vars
    (
      ?auto_98466 - LOCATION
      ?auto_98463 - CITY
      ?auto_98462 - LOCATION
      ?auto_98464 - LOCATION
      ?auto_98465 - LOCATION
      ?auto_98467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_98466 ?auto_98463 ) ( IN-CITY ?auto_98456 ?auto_98463 ) ( not ( = ?auto_98456 ?auto_98466 ) ) ( OBJ-AT ?auto_98457 ?auto_98466 ) ( IN-CITY ?auto_98462 ?auto_98463 ) ( not ( = ?auto_98456 ?auto_98462 ) ) ( OBJ-AT ?auto_98459 ?auto_98462 ) ( IN-CITY ?auto_98464 ?auto_98463 ) ( not ( = ?auto_98456 ?auto_98464 ) ) ( OBJ-AT ?auto_98460 ?auto_98464 ) ( IN-CITY ?auto_98465 ?auto_98463 ) ( not ( = ?auto_98456 ?auto_98465 ) ) ( OBJ-AT ?auto_98458 ?auto_98465 ) ( OBJ-AT ?auto_98461 ?auto_98466 ) ( TRUCK-AT ?auto_98467 ?auto_98456 ) ( not ( = ?auto_98461 ?auto_98458 ) ) ( not ( = ?auto_98465 ?auto_98466 ) ) ( not ( = ?auto_98461 ?auto_98460 ) ) ( not ( = ?auto_98458 ?auto_98460 ) ) ( not ( = ?auto_98464 ?auto_98465 ) ) ( not ( = ?auto_98464 ?auto_98466 ) ) ( not ( = ?auto_98461 ?auto_98459 ) ) ( not ( = ?auto_98458 ?auto_98459 ) ) ( not ( = ?auto_98460 ?auto_98459 ) ) ( not ( = ?auto_98462 ?auto_98464 ) ) ( not ( = ?auto_98462 ?auto_98465 ) ) ( not ( = ?auto_98462 ?auto_98466 ) ) ( not ( = ?auto_98461 ?auto_98457 ) ) ( not ( = ?auto_98458 ?auto_98457 ) ) ( not ( = ?auto_98460 ?auto_98457 ) ) ( not ( = ?auto_98459 ?auto_98457 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_98461 ?auto_98458 ?auto_98460 ?auto_98457 ?auto_98459 ?auto_98456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99112 - OBJ
      ?auto_99113 - OBJ
      ?auto_99114 - OBJ
      ?auto_99115 - OBJ
      ?auto_99116 - OBJ
      ?auto_99111 - LOCATION
    )
    :vars
    (
      ?auto_99121 - LOCATION
      ?auto_99118 - CITY
      ?auto_99117 - LOCATION
      ?auto_99119 - LOCATION
      ?auto_99120 - LOCATION
      ?auto_99122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99121 ?auto_99118 ) ( IN-CITY ?auto_99111 ?auto_99118 ) ( not ( = ?auto_99111 ?auto_99121 ) ) ( OBJ-AT ?auto_99112 ?auto_99121 ) ( IN-CITY ?auto_99117 ?auto_99118 ) ( not ( = ?auto_99111 ?auto_99117 ) ) ( OBJ-AT ?auto_99116 ?auto_99117 ) ( IN-CITY ?auto_99119 ?auto_99118 ) ( not ( = ?auto_99111 ?auto_99119 ) ) ( OBJ-AT ?auto_99113 ?auto_99119 ) ( IN-CITY ?auto_99120 ?auto_99118 ) ( not ( = ?auto_99111 ?auto_99120 ) ) ( OBJ-AT ?auto_99115 ?auto_99120 ) ( OBJ-AT ?auto_99114 ?auto_99121 ) ( TRUCK-AT ?auto_99122 ?auto_99111 ) ( not ( = ?auto_99114 ?auto_99115 ) ) ( not ( = ?auto_99120 ?auto_99121 ) ) ( not ( = ?auto_99114 ?auto_99113 ) ) ( not ( = ?auto_99115 ?auto_99113 ) ) ( not ( = ?auto_99119 ?auto_99120 ) ) ( not ( = ?auto_99119 ?auto_99121 ) ) ( not ( = ?auto_99114 ?auto_99116 ) ) ( not ( = ?auto_99115 ?auto_99116 ) ) ( not ( = ?auto_99113 ?auto_99116 ) ) ( not ( = ?auto_99117 ?auto_99119 ) ) ( not ( = ?auto_99117 ?auto_99120 ) ) ( not ( = ?auto_99117 ?auto_99121 ) ) ( not ( = ?auto_99114 ?auto_99112 ) ) ( not ( = ?auto_99115 ?auto_99112 ) ) ( not ( = ?auto_99113 ?auto_99112 ) ) ( not ( = ?auto_99116 ?auto_99112 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99114 ?auto_99115 ?auto_99113 ?auto_99112 ?auto_99116 ?auto_99111 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99218 - OBJ
      ?auto_99219 - OBJ
      ?auto_99220 - OBJ
      ?auto_99221 - OBJ
      ?auto_99222 - OBJ
      ?auto_99217 - LOCATION
    )
    :vars
    (
      ?auto_99227 - LOCATION
      ?auto_99224 - CITY
      ?auto_99223 - LOCATION
      ?auto_99225 - LOCATION
      ?auto_99226 - LOCATION
      ?auto_99228 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99227 ?auto_99224 ) ( IN-CITY ?auto_99217 ?auto_99224 ) ( not ( = ?auto_99217 ?auto_99227 ) ) ( OBJ-AT ?auto_99218 ?auto_99227 ) ( IN-CITY ?auto_99223 ?auto_99224 ) ( not ( = ?auto_99217 ?auto_99223 ) ) ( OBJ-AT ?auto_99221 ?auto_99223 ) ( IN-CITY ?auto_99225 ?auto_99224 ) ( not ( = ?auto_99217 ?auto_99225 ) ) ( OBJ-AT ?auto_99219 ?auto_99225 ) ( IN-CITY ?auto_99226 ?auto_99224 ) ( not ( = ?auto_99217 ?auto_99226 ) ) ( OBJ-AT ?auto_99222 ?auto_99226 ) ( OBJ-AT ?auto_99220 ?auto_99227 ) ( TRUCK-AT ?auto_99228 ?auto_99217 ) ( not ( = ?auto_99220 ?auto_99222 ) ) ( not ( = ?auto_99226 ?auto_99227 ) ) ( not ( = ?auto_99220 ?auto_99219 ) ) ( not ( = ?auto_99222 ?auto_99219 ) ) ( not ( = ?auto_99225 ?auto_99226 ) ) ( not ( = ?auto_99225 ?auto_99227 ) ) ( not ( = ?auto_99220 ?auto_99221 ) ) ( not ( = ?auto_99222 ?auto_99221 ) ) ( not ( = ?auto_99219 ?auto_99221 ) ) ( not ( = ?auto_99223 ?auto_99225 ) ) ( not ( = ?auto_99223 ?auto_99226 ) ) ( not ( = ?auto_99223 ?auto_99227 ) ) ( not ( = ?auto_99220 ?auto_99218 ) ) ( not ( = ?auto_99222 ?auto_99218 ) ) ( not ( = ?auto_99219 ?auto_99218 ) ) ( not ( = ?auto_99221 ?auto_99218 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99220 ?auto_99222 ?auto_99219 ?auto_99218 ?auto_99221 ?auto_99217 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99376 - OBJ
      ?auto_99377 - OBJ
      ?auto_99378 - OBJ
      ?auto_99379 - OBJ
      ?auto_99380 - OBJ
      ?auto_99375 - LOCATION
    )
    :vars
    (
      ?auto_99385 - LOCATION
      ?auto_99382 - CITY
      ?auto_99381 - LOCATION
      ?auto_99383 - LOCATION
      ?auto_99384 - LOCATION
      ?auto_99386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99385 ?auto_99382 ) ( IN-CITY ?auto_99375 ?auto_99382 ) ( not ( = ?auto_99375 ?auto_99385 ) ) ( OBJ-AT ?auto_99376 ?auto_99385 ) ( IN-CITY ?auto_99381 ?auto_99382 ) ( not ( = ?auto_99375 ?auto_99381 ) ) ( OBJ-AT ?auto_99380 ?auto_99381 ) ( IN-CITY ?auto_99383 ?auto_99382 ) ( not ( = ?auto_99375 ?auto_99383 ) ) ( OBJ-AT ?auto_99377 ?auto_99383 ) ( IN-CITY ?auto_99384 ?auto_99382 ) ( not ( = ?auto_99375 ?auto_99384 ) ) ( OBJ-AT ?auto_99378 ?auto_99384 ) ( OBJ-AT ?auto_99379 ?auto_99385 ) ( TRUCK-AT ?auto_99386 ?auto_99375 ) ( not ( = ?auto_99379 ?auto_99378 ) ) ( not ( = ?auto_99384 ?auto_99385 ) ) ( not ( = ?auto_99379 ?auto_99377 ) ) ( not ( = ?auto_99378 ?auto_99377 ) ) ( not ( = ?auto_99383 ?auto_99384 ) ) ( not ( = ?auto_99383 ?auto_99385 ) ) ( not ( = ?auto_99379 ?auto_99380 ) ) ( not ( = ?auto_99378 ?auto_99380 ) ) ( not ( = ?auto_99377 ?auto_99380 ) ) ( not ( = ?auto_99381 ?auto_99383 ) ) ( not ( = ?auto_99381 ?auto_99384 ) ) ( not ( = ?auto_99381 ?auto_99385 ) ) ( not ( = ?auto_99379 ?auto_99376 ) ) ( not ( = ?auto_99378 ?auto_99376 ) ) ( not ( = ?auto_99377 ?auto_99376 ) ) ( not ( = ?auto_99380 ?auto_99376 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99379 ?auto_99378 ?auto_99377 ?auto_99376 ?auto_99380 ?auto_99375 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_99537 - OBJ
      ?auto_99538 - OBJ
      ?auto_99539 - OBJ
      ?auto_99540 - OBJ
      ?auto_99541 - OBJ
      ?auto_99536 - LOCATION
    )
    :vars
    (
      ?auto_99546 - LOCATION
      ?auto_99543 - CITY
      ?auto_99542 - LOCATION
      ?auto_99544 - LOCATION
      ?auto_99545 - LOCATION
      ?auto_99547 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99546 ?auto_99543 ) ( IN-CITY ?auto_99536 ?auto_99543 ) ( not ( = ?auto_99536 ?auto_99546 ) ) ( OBJ-AT ?auto_99537 ?auto_99546 ) ( IN-CITY ?auto_99542 ?auto_99543 ) ( not ( = ?auto_99536 ?auto_99542 ) ) ( OBJ-AT ?auto_99540 ?auto_99542 ) ( IN-CITY ?auto_99544 ?auto_99543 ) ( not ( = ?auto_99536 ?auto_99544 ) ) ( OBJ-AT ?auto_99538 ?auto_99544 ) ( IN-CITY ?auto_99545 ?auto_99543 ) ( not ( = ?auto_99536 ?auto_99545 ) ) ( OBJ-AT ?auto_99539 ?auto_99545 ) ( OBJ-AT ?auto_99541 ?auto_99546 ) ( TRUCK-AT ?auto_99547 ?auto_99536 ) ( not ( = ?auto_99541 ?auto_99539 ) ) ( not ( = ?auto_99545 ?auto_99546 ) ) ( not ( = ?auto_99541 ?auto_99538 ) ) ( not ( = ?auto_99539 ?auto_99538 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) ( not ( = ?auto_99544 ?auto_99546 ) ) ( not ( = ?auto_99541 ?auto_99540 ) ) ( not ( = ?auto_99539 ?auto_99540 ) ) ( not ( = ?auto_99538 ?auto_99540 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99542 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99546 ) ) ( not ( = ?auto_99541 ?auto_99537 ) ) ( not ( = ?auto_99539 ?auto_99537 ) ) ( not ( = ?auto_99538 ?auto_99537 ) ) ( not ( = ?auto_99540 ?auto_99537 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_99541 ?auto_99539 ?auto_99538 ?auto_99537 ?auto_99540 ?auto_99536 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100030 - OBJ
      ?auto_100031 - OBJ
      ?auto_100032 - OBJ
      ?auto_100033 - OBJ
      ?auto_100034 - OBJ
      ?auto_100029 - LOCATION
    )
    :vars
    (
      ?auto_100039 - LOCATION
      ?auto_100036 - CITY
      ?auto_100035 - LOCATION
      ?auto_100037 - LOCATION
      ?auto_100038 - LOCATION
      ?auto_100040 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100039 ?auto_100036 ) ( IN-CITY ?auto_100029 ?auto_100036 ) ( not ( = ?auto_100029 ?auto_100039 ) ) ( OBJ-AT ?auto_100030 ?auto_100039 ) ( IN-CITY ?auto_100035 ?auto_100036 ) ( not ( = ?auto_100029 ?auto_100035 ) ) ( OBJ-AT ?auto_100032 ?auto_100035 ) ( IN-CITY ?auto_100037 ?auto_100036 ) ( not ( = ?auto_100029 ?auto_100037 ) ) ( OBJ-AT ?auto_100031 ?auto_100037 ) ( IN-CITY ?auto_100038 ?auto_100036 ) ( not ( = ?auto_100029 ?auto_100038 ) ) ( OBJ-AT ?auto_100034 ?auto_100038 ) ( OBJ-AT ?auto_100033 ?auto_100039 ) ( TRUCK-AT ?auto_100040 ?auto_100029 ) ( not ( = ?auto_100033 ?auto_100034 ) ) ( not ( = ?auto_100038 ?auto_100039 ) ) ( not ( = ?auto_100033 ?auto_100031 ) ) ( not ( = ?auto_100034 ?auto_100031 ) ) ( not ( = ?auto_100037 ?auto_100038 ) ) ( not ( = ?auto_100037 ?auto_100039 ) ) ( not ( = ?auto_100033 ?auto_100032 ) ) ( not ( = ?auto_100034 ?auto_100032 ) ) ( not ( = ?auto_100031 ?auto_100032 ) ) ( not ( = ?auto_100035 ?auto_100037 ) ) ( not ( = ?auto_100035 ?auto_100038 ) ) ( not ( = ?auto_100035 ?auto_100039 ) ) ( not ( = ?auto_100033 ?auto_100030 ) ) ( not ( = ?auto_100034 ?auto_100030 ) ) ( not ( = ?auto_100031 ?auto_100030 ) ) ( not ( = ?auto_100032 ?auto_100030 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100033 ?auto_100034 ?auto_100031 ?auto_100030 ?auto_100032 ?auto_100029 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100081 - OBJ
      ?auto_100082 - OBJ
      ?auto_100083 - OBJ
      ?auto_100084 - OBJ
      ?auto_100085 - OBJ
      ?auto_100080 - LOCATION
    )
    :vars
    (
      ?auto_100090 - LOCATION
      ?auto_100087 - CITY
      ?auto_100086 - LOCATION
      ?auto_100088 - LOCATION
      ?auto_100089 - LOCATION
      ?auto_100091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100090 ?auto_100087 ) ( IN-CITY ?auto_100080 ?auto_100087 ) ( not ( = ?auto_100080 ?auto_100090 ) ) ( OBJ-AT ?auto_100081 ?auto_100090 ) ( IN-CITY ?auto_100086 ?auto_100087 ) ( not ( = ?auto_100080 ?auto_100086 ) ) ( OBJ-AT ?auto_100083 ?auto_100086 ) ( IN-CITY ?auto_100088 ?auto_100087 ) ( not ( = ?auto_100080 ?auto_100088 ) ) ( OBJ-AT ?auto_100082 ?auto_100088 ) ( IN-CITY ?auto_100089 ?auto_100087 ) ( not ( = ?auto_100080 ?auto_100089 ) ) ( OBJ-AT ?auto_100084 ?auto_100089 ) ( OBJ-AT ?auto_100085 ?auto_100090 ) ( TRUCK-AT ?auto_100091 ?auto_100080 ) ( not ( = ?auto_100085 ?auto_100084 ) ) ( not ( = ?auto_100089 ?auto_100090 ) ) ( not ( = ?auto_100085 ?auto_100082 ) ) ( not ( = ?auto_100084 ?auto_100082 ) ) ( not ( = ?auto_100088 ?auto_100089 ) ) ( not ( = ?auto_100088 ?auto_100090 ) ) ( not ( = ?auto_100085 ?auto_100083 ) ) ( not ( = ?auto_100084 ?auto_100083 ) ) ( not ( = ?auto_100082 ?auto_100083 ) ) ( not ( = ?auto_100086 ?auto_100088 ) ) ( not ( = ?auto_100086 ?auto_100089 ) ) ( not ( = ?auto_100086 ?auto_100090 ) ) ( not ( = ?auto_100085 ?auto_100081 ) ) ( not ( = ?auto_100084 ?auto_100081 ) ) ( not ( = ?auto_100082 ?auto_100081 ) ) ( not ( = ?auto_100083 ?auto_100081 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100085 ?auto_100084 ?auto_100082 ?auto_100081 ?auto_100083 ?auto_100080 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100791 - OBJ
      ?auto_100792 - OBJ
      ?auto_100793 - OBJ
      ?auto_100794 - OBJ
      ?auto_100795 - OBJ
      ?auto_100790 - LOCATION
    )
    :vars
    (
      ?auto_100800 - LOCATION
      ?auto_100797 - CITY
      ?auto_100796 - LOCATION
      ?auto_100798 - LOCATION
      ?auto_100799 - LOCATION
      ?auto_100801 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100800 ?auto_100797 ) ( IN-CITY ?auto_100790 ?auto_100797 ) ( not ( = ?auto_100790 ?auto_100800 ) ) ( OBJ-AT ?auto_100791 ?auto_100800 ) ( IN-CITY ?auto_100796 ?auto_100797 ) ( not ( = ?auto_100790 ?auto_100796 ) ) ( OBJ-AT ?auto_100792 ?auto_100796 ) ( IN-CITY ?auto_100798 ?auto_100797 ) ( not ( = ?auto_100790 ?auto_100798 ) ) ( OBJ-AT ?auto_100795 ?auto_100798 ) ( IN-CITY ?auto_100799 ?auto_100797 ) ( not ( = ?auto_100790 ?auto_100799 ) ) ( OBJ-AT ?auto_100794 ?auto_100799 ) ( OBJ-AT ?auto_100793 ?auto_100800 ) ( TRUCK-AT ?auto_100801 ?auto_100790 ) ( not ( = ?auto_100793 ?auto_100794 ) ) ( not ( = ?auto_100799 ?auto_100800 ) ) ( not ( = ?auto_100793 ?auto_100795 ) ) ( not ( = ?auto_100794 ?auto_100795 ) ) ( not ( = ?auto_100798 ?auto_100799 ) ) ( not ( = ?auto_100798 ?auto_100800 ) ) ( not ( = ?auto_100793 ?auto_100792 ) ) ( not ( = ?auto_100794 ?auto_100792 ) ) ( not ( = ?auto_100795 ?auto_100792 ) ) ( not ( = ?auto_100796 ?auto_100798 ) ) ( not ( = ?auto_100796 ?auto_100799 ) ) ( not ( = ?auto_100796 ?auto_100800 ) ) ( not ( = ?auto_100793 ?auto_100791 ) ) ( not ( = ?auto_100794 ?auto_100791 ) ) ( not ( = ?auto_100795 ?auto_100791 ) ) ( not ( = ?auto_100792 ?auto_100791 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100793 ?auto_100794 ?auto_100795 ?auto_100791 ?auto_100792 ?auto_100790 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_100842 - OBJ
      ?auto_100843 - OBJ
      ?auto_100844 - OBJ
      ?auto_100845 - OBJ
      ?auto_100846 - OBJ
      ?auto_100841 - LOCATION
    )
    :vars
    (
      ?auto_100851 - LOCATION
      ?auto_100848 - CITY
      ?auto_100847 - LOCATION
      ?auto_100849 - LOCATION
      ?auto_100850 - LOCATION
      ?auto_100852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100851 ?auto_100848 ) ( IN-CITY ?auto_100841 ?auto_100848 ) ( not ( = ?auto_100841 ?auto_100851 ) ) ( OBJ-AT ?auto_100842 ?auto_100851 ) ( IN-CITY ?auto_100847 ?auto_100848 ) ( not ( = ?auto_100841 ?auto_100847 ) ) ( OBJ-AT ?auto_100843 ?auto_100847 ) ( IN-CITY ?auto_100849 ?auto_100848 ) ( not ( = ?auto_100841 ?auto_100849 ) ) ( OBJ-AT ?auto_100845 ?auto_100849 ) ( IN-CITY ?auto_100850 ?auto_100848 ) ( not ( = ?auto_100841 ?auto_100850 ) ) ( OBJ-AT ?auto_100846 ?auto_100850 ) ( OBJ-AT ?auto_100844 ?auto_100851 ) ( TRUCK-AT ?auto_100852 ?auto_100841 ) ( not ( = ?auto_100844 ?auto_100846 ) ) ( not ( = ?auto_100850 ?auto_100851 ) ) ( not ( = ?auto_100844 ?auto_100845 ) ) ( not ( = ?auto_100846 ?auto_100845 ) ) ( not ( = ?auto_100849 ?auto_100850 ) ) ( not ( = ?auto_100849 ?auto_100851 ) ) ( not ( = ?auto_100844 ?auto_100843 ) ) ( not ( = ?auto_100846 ?auto_100843 ) ) ( not ( = ?auto_100845 ?auto_100843 ) ) ( not ( = ?auto_100847 ?auto_100849 ) ) ( not ( = ?auto_100847 ?auto_100850 ) ) ( not ( = ?auto_100847 ?auto_100851 ) ) ( not ( = ?auto_100844 ?auto_100842 ) ) ( not ( = ?auto_100846 ?auto_100842 ) ) ( not ( = ?auto_100845 ?auto_100842 ) ) ( not ( = ?auto_100843 ?auto_100842 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_100844 ?auto_100846 ?auto_100845 ?auto_100842 ?auto_100843 ?auto_100841 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101055 - OBJ
      ?auto_101056 - OBJ
      ?auto_101057 - OBJ
      ?auto_101058 - OBJ
      ?auto_101059 - OBJ
      ?auto_101054 - LOCATION
    )
    :vars
    (
      ?auto_101064 - LOCATION
      ?auto_101061 - CITY
      ?auto_101060 - LOCATION
      ?auto_101062 - LOCATION
      ?auto_101063 - LOCATION
      ?auto_101065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101064 ?auto_101061 ) ( IN-CITY ?auto_101054 ?auto_101061 ) ( not ( = ?auto_101054 ?auto_101064 ) ) ( OBJ-AT ?auto_101055 ?auto_101064 ) ( IN-CITY ?auto_101060 ?auto_101061 ) ( not ( = ?auto_101054 ?auto_101060 ) ) ( OBJ-AT ?auto_101056 ?auto_101060 ) ( IN-CITY ?auto_101062 ?auto_101061 ) ( not ( = ?auto_101054 ?auto_101062 ) ) ( OBJ-AT ?auto_101059 ?auto_101062 ) ( IN-CITY ?auto_101063 ?auto_101061 ) ( not ( = ?auto_101054 ?auto_101063 ) ) ( OBJ-AT ?auto_101057 ?auto_101063 ) ( OBJ-AT ?auto_101058 ?auto_101064 ) ( TRUCK-AT ?auto_101065 ?auto_101054 ) ( not ( = ?auto_101058 ?auto_101057 ) ) ( not ( = ?auto_101063 ?auto_101064 ) ) ( not ( = ?auto_101058 ?auto_101059 ) ) ( not ( = ?auto_101057 ?auto_101059 ) ) ( not ( = ?auto_101062 ?auto_101063 ) ) ( not ( = ?auto_101062 ?auto_101064 ) ) ( not ( = ?auto_101058 ?auto_101056 ) ) ( not ( = ?auto_101057 ?auto_101056 ) ) ( not ( = ?auto_101059 ?auto_101056 ) ) ( not ( = ?auto_101060 ?auto_101062 ) ) ( not ( = ?auto_101060 ?auto_101063 ) ) ( not ( = ?auto_101060 ?auto_101064 ) ) ( not ( = ?auto_101058 ?auto_101055 ) ) ( not ( = ?auto_101057 ?auto_101055 ) ) ( not ( = ?auto_101059 ?auto_101055 ) ) ( not ( = ?auto_101056 ?auto_101055 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101058 ?auto_101057 ?auto_101059 ?auto_101055 ?auto_101056 ?auto_101054 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101161 - OBJ
      ?auto_101162 - OBJ
      ?auto_101163 - OBJ
      ?auto_101164 - OBJ
      ?auto_101165 - OBJ
      ?auto_101160 - LOCATION
    )
    :vars
    (
      ?auto_101170 - LOCATION
      ?auto_101167 - CITY
      ?auto_101166 - LOCATION
      ?auto_101168 - LOCATION
      ?auto_101169 - LOCATION
      ?auto_101171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101170 ?auto_101167 ) ( IN-CITY ?auto_101160 ?auto_101167 ) ( not ( = ?auto_101160 ?auto_101170 ) ) ( OBJ-AT ?auto_101161 ?auto_101170 ) ( IN-CITY ?auto_101166 ?auto_101167 ) ( not ( = ?auto_101160 ?auto_101166 ) ) ( OBJ-AT ?auto_101162 ?auto_101166 ) ( IN-CITY ?auto_101168 ?auto_101167 ) ( not ( = ?auto_101160 ?auto_101168 ) ) ( OBJ-AT ?auto_101164 ?auto_101168 ) ( IN-CITY ?auto_101169 ?auto_101167 ) ( not ( = ?auto_101160 ?auto_101169 ) ) ( OBJ-AT ?auto_101163 ?auto_101169 ) ( OBJ-AT ?auto_101165 ?auto_101170 ) ( TRUCK-AT ?auto_101171 ?auto_101160 ) ( not ( = ?auto_101165 ?auto_101163 ) ) ( not ( = ?auto_101169 ?auto_101170 ) ) ( not ( = ?auto_101165 ?auto_101164 ) ) ( not ( = ?auto_101163 ?auto_101164 ) ) ( not ( = ?auto_101168 ?auto_101169 ) ) ( not ( = ?auto_101168 ?auto_101170 ) ) ( not ( = ?auto_101165 ?auto_101162 ) ) ( not ( = ?auto_101163 ?auto_101162 ) ) ( not ( = ?auto_101164 ?auto_101162 ) ) ( not ( = ?auto_101166 ?auto_101168 ) ) ( not ( = ?auto_101166 ?auto_101169 ) ) ( not ( = ?auto_101166 ?auto_101170 ) ) ( not ( = ?auto_101165 ?auto_101161 ) ) ( not ( = ?auto_101163 ?auto_101161 ) ) ( not ( = ?auto_101164 ?auto_101161 ) ) ( not ( = ?auto_101162 ?auto_101161 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101165 ?auto_101163 ?auto_101164 ?auto_101161 ?auto_101162 ?auto_101160 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101374 - OBJ
      ?auto_101375 - OBJ
      ?auto_101376 - OBJ
      ?auto_101377 - OBJ
      ?auto_101378 - OBJ
      ?auto_101373 - LOCATION
    )
    :vars
    (
      ?auto_101383 - LOCATION
      ?auto_101380 - CITY
      ?auto_101379 - LOCATION
      ?auto_101381 - LOCATION
      ?auto_101382 - LOCATION
      ?auto_101384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101383 ?auto_101380 ) ( IN-CITY ?auto_101373 ?auto_101380 ) ( not ( = ?auto_101373 ?auto_101383 ) ) ( OBJ-AT ?auto_101374 ?auto_101383 ) ( IN-CITY ?auto_101379 ?auto_101380 ) ( not ( = ?auto_101373 ?auto_101379 ) ) ( OBJ-AT ?auto_101375 ?auto_101379 ) ( IN-CITY ?auto_101381 ?auto_101380 ) ( not ( = ?auto_101373 ?auto_101381 ) ) ( OBJ-AT ?auto_101376 ?auto_101381 ) ( IN-CITY ?auto_101382 ?auto_101380 ) ( not ( = ?auto_101373 ?auto_101382 ) ) ( OBJ-AT ?auto_101378 ?auto_101382 ) ( OBJ-AT ?auto_101377 ?auto_101383 ) ( TRUCK-AT ?auto_101384 ?auto_101373 ) ( not ( = ?auto_101377 ?auto_101378 ) ) ( not ( = ?auto_101382 ?auto_101383 ) ) ( not ( = ?auto_101377 ?auto_101376 ) ) ( not ( = ?auto_101378 ?auto_101376 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) ( not ( = ?auto_101381 ?auto_101383 ) ) ( not ( = ?auto_101377 ?auto_101375 ) ) ( not ( = ?auto_101378 ?auto_101375 ) ) ( not ( = ?auto_101376 ?auto_101375 ) ) ( not ( = ?auto_101379 ?auto_101381 ) ) ( not ( = ?auto_101379 ?auto_101382 ) ) ( not ( = ?auto_101379 ?auto_101383 ) ) ( not ( = ?auto_101377 ?auto_101374 ) ) ( not ( = ?auto_101378 ?auto_101374 ) ) ( not ( = ?auto_101376 ?auto_101374 ) ) ( not ( = ?auto_101375 ?auto_101374 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101377 ?auto_101378 ?auto_101376 ?auto_101374 ?auto_101375 ?auto_101373 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_101425 - OBJ
      ?auto_101426 - OBJ
      ?auto_101427 - OBJ
      ?auto_101428 - OBJ
      ?auto_101429 - OBJ
      ?auto_101424 - LOCATION
    )
    :vars
    (
      ?auto_101434 - LOCATION
      ?auto_101431 - CITY
      ?auto_101430 - LOCATION
      ?auto_101432 - LOCATION
      ?auto_101433 - LOCATION
      ?auto_101435 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_101434 ?auto_101431 ) ( IN-CITY ?auto_101424 ?auto_101431 ) ( not ( = ?auto_101424 ?auto_101434 ) ) ( OBJ-AT ?auto_101425 ?auto_101434 ) ( IN-CITY ?auto_101430 ?auto_101431 ) ( not ( = ?auto_101424 ?auto_101430 ) ) ( OBJ-AT ?auto_101426 ?auto_101430 ) ( IN-CITY ?auto_101432 ?auto_101431 ) ( not ( = ?auto_101424 ?auto_101432 ) ) ( OBJ-AT ?auto_101427 ?auto_101432 ) ( IN-CITY ?auto_101433 ?auto_101431 ) ( not ( = ?auto_101424 ?auto_101433 ) ) ( OBJ-AT ?auto_101428 ?auto_101433 ) ( OBJ-AT ?auto_101429 ?auto_101434 ) ( TRUCK-AT ?auto_101435 ?auto_101424 ) ( not ( = ?auto_101429 ?auto_101428 ) ) ( not ( = ?auto_101433 ?auto_101434 ) ) ( not ( = ?auto_101429 ?auto_101427 ) ) ( not ( = ?auto_101428 ?auto_101427 ) ) ( not ( = ?auto_101432 ?auto_101433 ) ) ( not ( = ?auto_101432 ?auto_101434 ) ) ( not ( = ?auto_101429 ?auto_101426 ) ) ( not ( = ?auto_101428 ?auto_101426 ) ) ( not ( = ?auto_101427 ?auto_101426 ) ) ( not ( = ?auto_101430 ?auto_101432 ) ) ( not ( = ?auto_101430 ?auto_101433 ) ) ( not ( = ?auto_101430 ?auto_101434 ) ) ( not ( = ?auto_101429 ?auto_101425 ) ) ( not ( = ?auto_101428 ?auto_101425 ) ) ( not ( = ?auto_101427 ?auto_101425 ) ) ( not ( = ?auto_101426 ?auto_101425 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_101429 ?auto_101428 ?auto_101427 ?auto_101425 ?auto_101426 ?auto_101424 ) )
  )

)

