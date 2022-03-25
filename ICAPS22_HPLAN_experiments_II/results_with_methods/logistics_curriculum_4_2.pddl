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
      ?auto_7950 - OBJ
      ?auto_7949 - LOCATION
    )
    :vars
    (
      ?auto_7952 - LOCATION
      ?auto_7953 - CITY
      ?auto_7951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7952 ?auto_7953 ) ( IN-CITY ?auto_7949 ?auto_7953 ) ( not ( = ?auto_7949 ?auto_7952 ) ) ( OBJ-AT ?auto_7950 ?auto_7952 ) ( TRUCK-AT ?auto_7951 ?auto_7949 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7951 ?auto_7949 ?auto_7952 ?auto_7953 )
      ( !LOAD-TRUCK ?auto_7950 ?auto_7951 ?auto_7952 )
      ( !DRIVE-TRUCK ?auto_7951 ?auto_7952 ?auto_7949 ?auto_7953 )
      ( !UNLOAD-TRUCK ?auto_7950 ?auto_7951 ?auto_7949 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7957 - OBJ
      ?auto_7956 - LOCATION
    )
    :vars
    (
      ?auto_7959 - LOCATION
      ?auto_7960 - CITY
      ?auto_7958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7959 ?auto_7960 ) ( IN-CITY ?auto_7956 ?auto_7960 ) ( not ( = ?auto_7956 ?auto_7959 ) ) ( OBJ-AT ?auto_7957 ?auto_7959 ) ( TRUCK-AT ?auto_7958 ?auto_7956 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7958 ?auto_7956 ?auto_7959 ?auto_7960 )
      ( !LOAD-TRUCK ?auto_7957 ?auto_7958 ?auto_7959 )
      ( !DRIVE-TRUCK ?auto_7958 ?auto_7959 ?auto_7956 ?auto_7960 )
      ( !UNLOAD-TRUCK ?auto_7957 ?auto_7958 ?auto_7956 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7971 - OBJ
      ?auto_7972 - OBJ
      ?auto_7970 - LOCATION
    )
    :vars
    (
      ?auto_7973 - LOCATION
      ?auto_7974 - CITY
      ?auto_7976 - LOCATION
      ?auto_7975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7973 ?auto_7974 ) ( IN-CITY ?auto_7970 ?auto_7974 ) ( not ( = ?auto_7970 ?auto_7973 ) ) ( OBJ-AT ?auto_7972 ?auto_7973 ) ( IN-CITY ?auto_7976 ?auto_7974 ) ( not ( = ?auto_7970 ?auto_7976 ) ) ( OBJ-AT ?auto_7971 ?auto_7976 ) ( TRUCK-AT ?auto_7975 ?auto_7970 ) ( not ( = ?auto_7971 ?auto_7972 ) ) ( not ( = ?auto_7973 ?auto_7976 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7971 ?auto_7970 )
      ( DELIVER-1PKG ?auto_7972 ?auto_7970 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7978 - OBJ
      ?auto_7979 - OBJ
      ?auto_7977 - LOCATION
    )
    :vars
    (
      ?auto_7982 - LOCATION
      ?auto_7981 - CITY
      ?auto_7980 - LOCATION
      ?auto_7983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7982 ?auto_7981 ) ( IN-CITY ?auto_7977 ?auto_7981 ) ( not ( = ?auto_7977 ?auto_7982 ) ) ( OBJ-AT ?auto_7978 ?auto_7982 ) ( IN-CITY ?auto_7980 ?auto_7981 ) ( not ( = ?auto_7977 ?auto_7980 ) ) ( OBJ-AT ?auto_7979 ?auto_7980 ) ( TRUCK-AT ?auto_7983 ?auto_7977 ) ( not ( = ?auto_7979 ?auto_7978 ) ) ( not ( = ?auto_7982 ?auto_7980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7979 ?auto_7978 ?auto_7977 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7995 - OBJ
      ?auto_7994 - LOCATION
    )
    :vars
    (
      ?auto_7997 - LOCATION
      ?auto_7998 - CITY
      ?auto_7996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7997 ?auto_7998 ) ( IN-CITY ?auto_7994 ?auto_7998 ) ( not ( = ?auto_7994 ?auto_7997 ) ) ( OBJ-AT ?auto_7995 ?auto_7997 ) ( TRUCK-AT ?auto_7996 ?auto_7994 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7996 ?auto_7994 ?auto_7997 ?auto_7998 )
      ( !LOAD-TRUCK ?auto_7995 ?auto_7996 ?auto_7997 )
      ( !DRIVE-TRUCK ?auto_7996 ?auto_7997 ?auto_7994 ?auto_7998 )
      ( !UNLOAD-TRUCK ?auto_7995 ?auto_7996 ?auto_7994 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8086 - OBJ
      ?auto_8087 - OBJ
      ?auto_8088 - OBJ
      ?auto_8085 - LOCATION
    )
    :vars
    (
      ?auto_8091 - LOCATION
      ?auto_8090 - CITY
      ?auto_8092 - LOCATION
      ?auto_8093 - LOCATION
      ?auto_8089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8091 ?auto_8090 ) ( IN-CITY ?auto_8085 ?auto_8090 ) ( not ( = ?auto_8085 ?auto_8091 ) ) ( OBJ-AT ?auto_8088 ?auto_8091 ) ( IN-CITY ?auto_8092 ?auto_8090 ) ( not ( = ?auto_8085 ?auto_8092 ) ) ( OBJ-AT ?auto_8087 ?auto_8092 ) ( IN-CITY ?auto_8093 ?auto_8090 ) ( not ( = ?auto_8085 ?auto_8093 ) ) ( OBJ-AT ?auto_8086 ?auto_8093 ) ( TRUCK-AT ?auto_8089 ?auto_8085 ) ( not ( = ?auto_8086 ?auto_8087 ) ) ( not ( = ?auto_8092 ?auto_8093 ) ) ( not ( = ?auto_8086 ?auto_8088 ) ) ( not ( = ?auto_8087 ?auto_8088 ) ) ( not ( = ?auto_8091 ?auto_8092 ) ) ( not ( = ?auto_8091 ?auto_8093 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_8087 ?auto_8086 ?auto_8085 )
      ( DELIVER-1PKG ?auto_8088 ?auto_8085 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8105 - OBJ
      ?auto_8106 - OBJ
      ?auto_8107 - OBJ
      ?auto_8104 - LOCATION
    )
    :vars
    (
      ?auto_8112 - LOCATION
      ?auto_8110 - CITY
      ?auto_8111 - LOCATION
      ?auto_8109 - LOCATION
      ?auto_8108 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8112 ?auto_8110 ) ( IN-CITY ?auto_8104 ?auto_8110 ) ( not ( = ?auto_8104 ?auto_8112 ) ) ( OBJ-AT ?auto_8106 ?auto_8112 ) ( IN-CITY ?auto_8111 ?auto_8110 ) ( not ( = ?auto_8104 ?auto_8111 ) ) ( OBJ-AT ?auto_8107 ?auto_8111 ) ( IN-CITY ?auto_8109 ?auto_8110 ) ( not ( = ?auto_8104 ?auto_8109 ) ) ( OBJ-AT ?auto_8105 ?auto_8109 ) ( TRUCK-AT ?auto_8108 ?auto_8104 ) ( not ( = ?auto_8105 ?auto_8107 ) ) ( not ( = ?auto_8111 ?auto_8109 ) ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8107 ?auto_8106 ) ) ( not ( = ?auto_8112 ?auto_8111 ) ) ( not ( = ?auto_8112 ?auto_8109 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8105 ?auto_8107 ?auto_8106 ?auto_8104 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8124 - OBJ
      ?auto_8125 - OBJ
      ?auto_8126 - OBJ
      ?auto_8123 - LOCATION
    )
    :vars
    (
      ?auto_8130 - LOCATION
      ?auto_8128 - CITY
      ?auto_8129 - LOCATION
      ?auto_8127 - LOCATION
      ?auto_8131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8130 ?auto_8128 ) ( IN-CITY ?auto_8123 ?auto_8128 ) ( not ( = ?auto_8123 ?auto_8130 ) ) ( OBJ-AT ?auto_8126 ?auto_8130 ) ( IN-CITY ?auto_8129 ?auto_8128 ) ( not ( = ?auto_8123 ?auto_8129 ) ) ( OBJ-AT ?auto_8124 ?auto_8129 ) ( IN-CITY ?auto_8127 ?auto_8128 ) ( not ( = ?auto_8123 ?auto_8127 ) ) ( OBJ-AT ?auto_8125 ?auto_8127 ) ( TRUCK-AT ?auto_8131 ?auto_8123 ) ( not ( = ?auto_8125 ?auto_8124 ) ) ( not ( = ?auto_8129 ?auto_8127 ) ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( not ( = ?auto_8130 ?auto_8129 ) ) ( not ( = ?auto_8130 ?auto_8127 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8125 ?auto_8126 ?auto_8124 ?auto_8123 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8143 - OBJ
      ?auto_8144 - OBJ
      ?auto_8145 - OBJ
      ?auto_8142 - LOCATION
    )
    :vars
    (
      ?auto_8149 - LOCATION
      ?auto_8147 - CITY
      ?auto_8148 - LOCATION
      ?auto_8146 - LOCATION
      ?auto_8150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8149 ?auto_8147 ) ( IN-CITY ?auto_8142 ?auto_8147 ) ( not ( = ?auto_8142 ?auto_8149 ) ) ( OBJ-AT ?auto_8144 ?auto_8149 ) ( IN-CITY ?auto_8148 ?auto_8147 ) ( not ( = ?auto_8142 ?auto_8148 ) ) ( OBJ-AT ?auto_8143 ?auto_8148 ) ( IN-CITY ?auto_8146 ?auto_8147 ) ( not ( = ?auto_8142 ?auto_8146 ) ) ( OBJ-AT ?auto_8145 ?auto_8146 ) ( TRUCK-AT ?auto_8150 ?auto_8142 ) ( not ( = ?auto_8145 ?auto_8143 ) ) ( not ( = ?auto_8148 ?auto_8146 ) ) ( not ( = ?auto_8145 ?auto_8144 ) ) ( not ( = ?auto_8143 ?auto_8144 ) ) ( not ( = ?auto_8149 ?auto_8148 ) ) ( not ( = ?auto_8149 ?auto_8146 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8145 ?auto_8144 ?auto_8143 ?auto_8142 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8182 - OBJ
      ?auto_8183 - OBJ
      ?auto_8184 - OBJ
      ?auto_8181 - LOCATION
    )
    :vars
    (
      ?auto_8188 - LOCATION
      ?auto_8186 - CITY
      ?auto_8187 - LOCATION
      ?auto_8185 - LOCATION
      ?auto_8189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8188 ?auto_8186 ) ( IN-CITY ?auto_8181 ?auto_8186 ) ( not ( = ?auto_8181 ?auto_8188 ) ) ( OBJ-AT ?auto_8182 ?auto_8188 ) ( IN-CITY ?auto_8187 ?auto_8186 ) ( not ( = ?auto_8181 ?auto_8187 ) ) ( OBJ-AT ?auto_8184 ?auto_8187 ) ( IN-CITY ?auto_8185 ?auto_8186 ) ( not ( = ?auto_8181 ?auto_8185 ) ) ( OBJ-AT ?auto_8183 ?auto_8185 ) ( TRUCK-AT ?auto_8189 ?auto_8181 ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( not ( = ?auto_8187 ?auto_8185 ) ) ( not ( = ?auto_8183 ?auto_8182 ) ) ( not ( = ?auto_8184 ?auto_8182 ) ) ( not ( = ?auto_8188 ?auto_8187 ) ) ( not ( = ?auto_8188 ?auto_8185 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8183 ?auto_8182 ?auto_8184 ?auto_8181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_8201 - OBJ
      ?auto_8202 - OBJ
      ?auto_8203 - OBJ
      ?auto_8200 - LOCATION
    )
    :vars
    (
      ?auto_8207 - LOCATION
      ?auto_8205 - CITY
      ?auto_8206 - LOCATION
      ?auto_8204 - LOCATION
      ?auto_8208 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8207 ?auto_8205 ) ( IN-CITY ?auto_8200 ?auto_8205 ) ( not ( = ?auto_8200 ?auto_8207 ) ) ( OBJ-AT ?auto_8201 ?auto_8207 ) ( IN-CITY ?auto_8206 ?auto_8205 ) ( not ( = ?auto_8200 ?auto_8206 ) ) ( OBJ-AT ?auto_8202 ?auto_8206 ) ( IN-CITY ?auto_8204 ?auto_8205 ) ( not ( = ?auto_8200 ?auto_8204 ) ) ( OBJ-AT ?auto_8203 ?auto_8204 ) ( TRUCK-AT ?auto_8208 ?auto_8200 ) ( not ( = ?auto_8203 ?auto_8202 ) ) ( not ( = ?auto_8206 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8201 ) ) ( not ( = ?auto_8202 ?auto_8201 ) ) ( not ( = ?auto_8207 ?auto_8206 ) ) ( not ( = ?auto_8207 ?auto_8204 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_8203 ?auto_8201 ?auto_8202 ?auto_8200 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_8263 - OBJ
      ?auto_8262 - LOCATION
    )
    :vars
    (
      ?auto_8265 - LOCATION
      ?auto_8266 - CITY
      ?auto_8264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_8265 ?auto_8266 ) ( IN-CITY ?auto_8262 ?auto_8266 ) ( not ( = ?auto_8262 ?auto_8265 ) ) ( OBJ-AT ?auto_8263 ?auto_8265 ) ( TRUCK-AT ?auto_8264 ?auto_8262 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_8264 ?auto_8262 ?auto_8265 ?auto_8266 )
      ( !LOAD-TRUCK ?auto_8263 ?auto_8264 ?auto_8265 )
      ( !DRIVE-TRUCK ?auto_8264 ?auto_8265 ?auto_8262 ?auto_8266 )
      ( !UNLOAD-TRUCK ?auto_8263 ?auto_8264 ?auto_8262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9254 - OBJ
      ?auto_9255 - OBJ
      ?auto_9256 - OBJ
      ?auto_9257 - OBJ
      ?auto_9253 - LOCATION
    )
    :vars
    (
      ?auto_9260 - LOCATION
      ?auto_9258 - CITY
      ?auto_9263 - LOCATION
      ?auto_9262 - LOCATION
      ?auto_9261 - LOCATION
      ?auto_9259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9260 ?auto_9258 ) ( IN-CITY ?auto_9253 ?auto_9258 ) ( not ( = ?auto_9253 ?auto_9260 ) ) ( OBJ-AT ?auto_9257 ?auto_9260 ) ( IN-CITY ?auto_9263 ?auto_9258 ) ( not ( = ?auto_9253 ?auto_9263 ) ) ( OBJ-AT ?auto_9256 ?auto_9263 ) ( IN-CITY ?auto_9262 ?auto_9258 ) ( not ( = ?auto_9253 ?auto_9262 ) ) ( OBJ-AT ?auto_9255 ?auto_9262 ) ( IN-CITY ?auto_9261 ?auto_9258 ) ( not ( = ?auto_9253 ?auto_9261 ) ) ( OBJ-AT ?auto_9254 ?auto_9261 ) ( TRUCK-AT ?auto_9259 ?auto_9253 ) ( not ( = ?auto_9254 ?auto_9255 ) ) ( not ( = ?auto_9262 ?auto_9261 ) ) ( not ( = ?auto_9254 ?auto_9256 ) ) ( not ( = ?auto_9255 ?auto_9256 ) ) ( not ( = ?auto_9263 ?auto_9262 ) ) ( not ( = ?auto_9263 ?auto_9261 ) ) ( not ( = ?auto_9254 ?auto_9257 ) ) ( not ( = ?auto_9255 ?auto_9257 ) ) ( not ( = ?auto_9256 ?auto_9257 ) ) ( not ( = ?auto_9260 ?auto_9263 ) ) ( not ( = ?auto_9260 ?auto_9262 ) ) ( not ( = ?auto_9260 ?auto_9261 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_9254 ?auto_9256 ?auto_9255 ?auto_9253 )
      ( DELIVER-1PKG ?auto_9257 ?auto_9253 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9289 - OBJ
      ?auto_9290 - OBJ
      ?auto_9291 - OBJ
      ?auto_9292 - OBJ
      ?auto_9288 - LOCATION
    )
    :vars
    (
      ?auto_9294 - LOCATION
      ?auto_9293 - CITY
      ?auto_9298 - LOCATION
      ?auto_9296 - LOCATION
      ?auto_9297 - LOCATION
      ?auto_9295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9294 ?auto_9293 ) ( IN-CITY ?auto_9288 ?auto_9293 ) ( not ( = ?auto_9288 ?auto_9294 ) ) ( OBJ-AT ?auto_9291 ?auto_9294 ) ( IN-CITY ?auto_9298 ?auto_9293 ) ( not ( = ?auto_9288 ?auto_9298 ) ) ( OBJ-AT ?auto_9292 ?auto_9298 ) ( IN-CITY ?auto_9296 ?auto_9293 ) ( not ( = ?auto_9288 ?auto_9296 ) ) ( OBJ-AT ?auto_9290 ?auto_9296 ) ( IN-CITY ?auto_9297 ?auto_9293 ) ( not ( = ?auto_9288 ?auto_9297 ) ) ( OBJ-AT ?auto_9289 ?auto_9297 ) ( TRUCK-AT ?auto_9295 ?auto_9288 ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( not ( = ?auto_9296 ?auto_9297 ) ) ( not ( = ?auto_9289 ?auto_9292 ) ) ( not ( = ?auto_9290 ?auto_9292 ) ) ( not ( = ?auto_9298 ?auto_9296 ) ) ( not ( = ?auto_9298 ?auto_9297 ) ) ( not ( = ?auto_9289 ?auto_9291 ) ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( not ( = ?auto_9292 ?auto_9291 ) ) ( not ( = ?auto_9294 ?auto_9298 ) ) ( not ( = ?auto_9294 ?auto_9296 ) ) ( not ( = ?auto_9294 ?auto_9297 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9289 ?auto_9290 ?auto_9292 ?auto_9291 ?auto_9288 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9324 - OBJ
      ?auto_9325 - OBJ
      ?auto_9326 - OBJ
      ?auto_9327 - OBJ
      ?auto_9323 - LOCATION
    )
    :vars
    (
      ?auto_9332 - LOCATION
      ?auto_9329 - CITY
      ?auto_9328 - LOCATION
      ?auto_9333 - LOCATION
      ?auto_9330 - LOCATION
      ?auto_9331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9332 ?auto_9329 ) ( IN-CITY ?auto_9323 ?auto_9329 ) ( not ( = ?auto_9323 ?auto_9332 ) ) ( OBJ-AT ?auto_9327 ?auto_9332 ) ( IN-CITY ?auto_9328 ?auto_9329 ) ( not ( = ?auto_9323 ?auto_9328 ) ) ( OBJ-AT ?auto_9325 ?auto_9328 ) ( IN-CITY ?auto_9333 ?auto_9329 ) ( not ( = ?auto_9323 ?auto_9333 ) ) ( OBJ-AT ?auto_9326 ?auto_9333 ) ( IN-CITY ?auto_9330 ?auto_9329 ) ( not ( = ?auto_9323 ?auto_9330 ) ) ( OBJ-AT ?auto_9324 ?auto_9330 ) ( TRUCK-AT ?auto_9331 ?auto_9323 ) ( not ( = ?auto_9324 ?auto_9326 ) ) ( not ( = ?auto_9333 ?auto_9330 ) ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( not ( = ?auto_9326 ?auto_9325 ) ) ( not ( = ?auto_9328 ?auto_9333 ) ) ( not ( = ?auto_9328 ?auto_9330 ) ) ( not ( = ?auto_9324 ?auto_9327 ) ) ( not ( = ?auto_9326 ?auto_9327 ) ) ( not ( = ?auto_9325 ?auto_9327 ) ) ( not ( = ?auto_9332 ?auto_9328 ) ) ( not ( = ?auto_9332 ?auto_9333 ) ) ( not ( = ?auto_9332 ?auto_9330 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9324 ?auto_9326 ?auto_9327 ?auto_9325 ?auto_9323 ) )
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
      ?auto_9367 - LOCATION
      ?auto_9364 - CITY
      ?auto_9363 - LOCATION
      ?auto_9368 - LOCATION
      ?auto_9365 - LOCATION
      ?auto_9366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9367 ?auto_9364 ) ( IN-CITY ?auto_9358 ?auto_9364 ) ( not ( = ?auto_9358 ?auto_9367 ) ) ( OBJ-AT ?auto_9361 ?auto_9367 ) ( IN-CITY ?auto_9363 ?auto_9364 ) ( not ( = ?auto_9358 ?auto_9363 ) ) ( OBJ-AT ?auto_9360 ?auto_9363 ) ( IN-CITY ?auto_9368 ?auto_9364 ) ( not ( = ?auto_9358 ?auto_9368 ) ) ( OBJ-AT ?auto_9362 ?auto_9368 ) ( IN-CITY ?auto_9365 ?auto_9364 ) ( not ( = ?auto_9358 ?auto_9365 ) ) ( OBJ-AT ?auto_9359 ?auto_9365 ) ( TRUCK-AT ?auto_9366 ?auto_9358 ) ( not ( = ?auto_9359 ?auto_9362 ) ) ( not ( = ?auto_9368 ?auto_9365 ) ) ( not ( = ?auto_9359 ?auto_9360 ) ) ( not ( = ?auto_9362 ?auto_9360 ) ) ( not ( = ?auto_9363 ?auto_9368 ) ) ( not ( = ?auto_9363 ?auto_9365 ) ) ( not ( = ?auto_9359 ?auto_9361 ) ) ( not ( = ?auto_9362 ?auto_9361 ) ) ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9367 ?auto_9363 ) ) ( not ( = ?auto_9367 ?auto_9368 ) ) ( not ( = ?auto_9367 ?auto_9365 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9359 ?auto_9362 ?auto_9361 ?auto_9360 ?auto_9358 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9468 - OBJ
      ?auto_9469 - OBJ
      ?auto_9470 - OBJ
      ?auto_9471 - OBJ
      ?auto_9467 - LOCATION
    )
    :vars
    (
      ?auto_9476 - LOCATION
      ?auto_9473 - CITY
      ?auto_9472 - LOCATION
      ?auto_9477 - LOCATION
      ?auto_9474 - LOCATION
      ?auto_9475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9476 ?auto_9473 ) ( IN-CITY ?auto_9467 ?auto_9473 ) ( not ( = ?auto_9467 ?auto_9476 ) ) ( OBJ-AT ?auto_9469 ?auto_9476 ) ( IN-CITY ?auto_9472 ?auto_9473 ) ( not ( = ?auto_9467 ?auto_9472 ) ) ( OBJ-AT ?auto_9471 ?auto_9472 ) ( IN-CITY ?auto_9477 ?auto_9473 ) ( not ( = ?auto_9467 ?auto_9477 ) ) ( OBJ-AT ?auto_9470 ?auto_9477 ) ( IN-CITY ?auto_9474 ?auto_9473 ) ( not ( = ?auto_9467 ?auto_9474 ) ) ( OBJ-AT ?auto_9468 ?auto_9474 ) ( TRUCK-AT ?auto_9475 ?auto_9467 ) ( not ( = ?auto_9468 ?auto_9470 ) ) ( not ( = ?auto_9477 ?auto_9474 ) ) ( not ( = ?auto_9468 ?auto_9471 ) ) ( not ( = ?auto_9470 ?auto_9471 ) ) ( not ( = ?auto_9472 ?auto_9477 ) ) ( not ( = ?auto_9472 ?auto_9474 ) ) ( not ( = ?auto_9468 ?auto_9469 ) ) ( not ( = ?auto_9470 ?auto_9469 ) ) ( not ( = ?auto_9471 ?auto_9469 ) ) ( not ( = ?auto_9476 ?auto_9472 ) ) ( not ( = ?auto_9476 ?auto_9477 ) ) ( not ( = ?auto_9476 ?auto_9474 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9468 ?auto_9470 ?auto_9469 ?auto_9471 ?auto_9467 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9503 - OBJ
      ?auto_9504 - OBJ
      ?auto_9505 - OBJ
      ?auto_9506 - OBJ
      ?auto_9502 - LOCATION
    )
    :vars
    (
      ?auto_9511 - LOCATION
      ?auto_9508 - CITY
      ?auto_9507 - LOCATION
      ?auto_9512 - LOCATION
      ?auto_9509 - LOCATION
      ?auto_9510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9511 ?auto_9508 ) ( IN-CITY ?auto_9502 ?auto_9508 ) ( not ( = ?auto_9502 ?auto_9511 ) ) ( OBJ-AT ?auto_9504 ?auto_9511 ) ( IN-CITY ?auto_9507 ?auto_9508 ) ( not ( = ?auto_9502 ?auto_9507 ) ) ( OBJ-AT ?auto_9505 ?auto_9507 ) ( IN-CITY ?auto_9512 ?auto_9508 ) ( not ( = ?auto_9502 ?auto_9512 ) ) ( OBJ-AT ?auto_9506 ?auto_9512 ) ( IN-CITY ?auto_9509 ?auto_9508 ) ( not ( = ?auto_9502 ?auto_9509 ) ) ( OBJ-AT ?auto_9503 ?auto_9509 ) ( TRUCK-AT ?auto_9510 ?auto_9502 ) ( not ( = ?auto_9503 ?auto_9506 ) ) ( not ( = ?auto_9512 ?auto_9509 ) ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( not ( = ?auto_9506 ?auto_9505 ) ) ( not ( = ?auto_9507 ?auto_9512 ) ) ( not ( = ?auto_9507 ?auto_9509 ) ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9506 ?auto_9504 ) ) ( not ( = ?auto_9505 ?auto_9504 ) ) ( not ( = ?auto_9511 ?auto_9507 ) ) ( not ( = ?auto_9511 ?auto_9512 ) ) ( not ( = ?auto_9511 ?auto_9509 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9503 ?auto_9506 ?auto_9504 ?auto_9505 ?auto_9502 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9612 - OBJ
      ?auto_9613 - OBJ
      ?auto_9614 - OBJ
      ?auto_9615 - OBJ
      ?auto_9611 - LOCATION
    )
    :vars
    (
      ?auto_9620 - LOCATION
      ?auto_9617 - CITY
      ?auto_9616 - LOCATION
      ?auto_9621 - LOCATION
      ?auto_9618 - LOCATION
      ?auto_9619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9620 ?auto_9617 ) ( IN-CITY ?auto_9611 ?auto_9617 ) ( not ( = ?auto_9611 ?auto_9620 ) ) ( OBJ-AT ?auto_9615 ?auto_9620 ) ( IN-CITY ?auto_9616 ?auto_9617 ) ( not ( = ?auto_9611 ?auto_9616 ) ) ( OBJ-AT ?auto_9614 ?auto_9616 ) ( IN-CITY ?auto_9621 ?auto_9617 ) ( not ( = ?auto_9611 ?auto_9621 ) ) ( OBJ-AT ?auto_9612 ?auto_9621 ) ( IN-CITY ?auto_9618 ?auto_9617 ) ( not ( = ?auto_9611 ?auto_9618 ) ) ( OBJ-AT ?auto_9613 ?auto_9618 ) ( TRUCK-AT ?auto_9619 ?auto_9611 ) ( not ( = ?auto_9613 ?auto_9612 ) ) ( not ( = ?auto_9621 ?auto_9618 ) ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9612 ?auto_9614 ) ) ( not ( = ?auto_9616 ?auto_9621 ) ) ( not ( = ?auto_9616 ?auto_9618 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9612 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9620 ?auto_9616 ) ) ( not ( = ?auto_9620 ?auto_9621 ) ) ( not ( = ?auto_9620 ?auto_9618 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9613 ?auto_9612 ?auto_9615 ?auto_9614 ?auto_9611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9647 - OBJ
      ?auto_9648 - OBJ
      ?auto_9649 - OBJ
      ?auto_9650 - OBJ
      ?auto_9646 - LOCATION
    )
    :vars
    (
      ?auto_9655 - LOCATION
      ?auto_9652 - CITY
      ?auto_9651 - LOCATION
      ?auto_9656 - LOCATION
      ?auto_9653 - LOCATION
      ?auto_9654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9655 ?auto_9652 ) ( IN-CITY ?auto_9646 ?auto_9652 ) ( not ( = ?auto_9646 ?auto_9655 ) ) ( OBJ-AT ?auto_9649 ?auto_9655 ) ( IN-CITY ?auto_9651 ?auto_9652 ) ( not ( = ?auto_9646 ?auto_9651 ) ) ( OBJ-AT ?auto_9650 ?auto_9651 ) ( IN-CITY ?auto_9656 ?auto_9652 ) ( not ( = ?auto_9646 ?auto_9656 ) ) ( OBJ-AT ?auto_9647 ?auto_9656 ) ( IN-CITY ?auto_9653 ?auto_9652 ) ( not ( = ?auto_9646 ?auto_9653 ) ) ( OBJ-AT ?auto_9648 ?auto_9653 ) ( TRUCK-AT ?auto_9654 ?auto_9646 ) ( not ( = ?auto_9648 ?auto_9647 ) ) ( not ( = ?auto_9656 ?auto_9653 ) ) ( not ( = ?auto_9648 ?auto_9650 ) ) ( not ( = ?auto_9647 ?auto_9650 ) ) ( not ( = ?auto_9651 ?auto_9656 ) ) ( not ( = ?auto_9651 ?auto_9653 ) ) ( not ( = ?auto_9648 ?auto_9649 ) ) ( not ( = ?auto_9647 ?auto_9649 ) ) ( not ( = ?auto_9650 ?auto_9649 ) ) ( not ( = ?auto_9655 ?auto_9651 ) ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9653 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9648 ?auto_9647 ?auto_9649 ?auto_9650 ?auto_9646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9757 - OBJ
      ?auto_9758 - OBJ
      ?auto_9759 - OBJ
      ?auto_9760 - OBJ
      ?auto_9756 - LOCATION
    )
    :vars
    (
      ?auto_9765 - LOCATION
      ?auto_9762 - CITY
      ?auto_9761 - LOCATION
      ?auto_9766 - LOCATION
      ?auto_9763 - LOCATION
      ?auto_9764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9765 ?auto_9762 ) ( IN-CITY ?auto_9756 ?auto_9762 ) ( not ( = ?auto_9756 ?auto_9765 ) ) ( OBJ-AT ?auto_9760 ?auto_9765 ) ( IN-CITY ?auto_9761 ?auto_9762 ) ( not ( = ?auto_9756 ?auto_9761 ) ) ( OBJ-AT ?auto_9758 ?auto_9761 ) ( IN-CITY ?auto_9766 ?auto_9762 ) ( not ( = ?auto_9756 ?auto_9766 ) ) ( OBJ-AT ?auto_9757 ?auto_9766 ) ( IN-CITY ?auto_9763 ?auto_9762 ) ( not ( = ?auto_9756 ?auto_9763 ) ) ( OBJ-AT ?auto_9759 ?auto_9763 ) ( TRUCK-AT ?auto_9764 ?auto_9756 ) ( not ( = ?auto_9759 ?auto_9757 ) ) ( not ( = ?auto_9766 ?auto_9763 ) ) ( not ( = ?auto_9759 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( not ( = ?auto_9761 ?auto_9766 ) ) ( not ( = ?auto_9761 ?auto_9763 ) ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9757 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( not ( = ?auto_9765 ?auto_9761 ) ) ( not ( = ?auto_9765 ?auto_9766 ) ) ( not ( = ?auto_9765 ?auto_9763 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9759 ?auto_9757 ?auto_9760 ?auto_9758 ?auto_9756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9792 - OBJ
      ?auto_9793 - OBJ
      ?auto_9794 - OBJ
      ?auto_9795 - OBJ
      ?auto_9791 - LOCATION
    )
    :vars
    (
      ?auto_9800 - LOCATION
      ?auto_9797 - CITY
      ?auto_9796 - LOCATION
      ?auto_9801 - LOCATION
      ?auto_9798 - LOCATION
      ?auto_9799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9800 ?auto_9797 ) ( IN-CITY ?auto_9791 ?auto_9797 ) ( not ( = ?auto_9791 ?auto_9800 ) ) ( OBJ-AT ?auto_9794 ?auto_9800 ) ( IN-CITY ?auto_9796 ?auto_9797 ) ( not ( = ?auto_9791 ?auto_9796 ) ) ( OBJ-AT ?auto_9793 ?auto_9796 ) ( IN-CITY ?auto_9801 ?auto_9797 ) ( not ( = ?auto_9791 ?auto_9801 ) ) ( OBJ-AT ?auto_9792 ?auto_9801 ) ( IN-CITY ?auto_9798 ?auto_9797 ) ( not ( = ?auto_9791 ?auto_9798 ) ) ( OBJ-AT ?auto_9795 ?auto_9798 ) ( TRUCK-AT ?auto_9799 ?auto_9791 ) ( not ( = ?auto_9795 ?auto_9792 ) ) ( not ( = ?auto_9801 ?auto_9798 ) ) ( not ( = ?auto_9795 ?auto_9793 ) ) ( not ( = ?auto_9792 ?auto_9793 ) ) ( not ( = ?auto_9796 ?auto_9801 ) ) ( not ( = ?auto_9796 ?auto_9798 ) ) ( not ( = ?auto_9795 ?auto_9794 ) ) ( not ( = ?auto_9792 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9794 ) ) ( not ( = ?auto_9800 ?auto_9796 ) ) ( not ( = ?auto_9800 ?auto_9801 ) ) ( not ( = ?auto_9800 ?auto_9798 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9795 ?auto_9792 ?auto_9794 ?auto_9793 ?auto_9791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9863 - OBJ
      ?auto_9864 - OBJ
      ?auto_9865 - OBJ
      ?auto_9866 - OBJ
      ?auto_9862 - LOCATION
    )
    :vars
    (
      ?auto_9871 - LOCATION
      ?auto_9868 - CITY
      ?auto_9867 - LOCATION
      ?auto_9872 - LOCATION
      ?auto_9869 - LOCATION
      ?auto_9870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9871 ?auto_9868 ) ( IN-CITY ?auto_9862 ?auto_9868 ) ( not ( = ?auto_9862 ?auto_9871 ) ) ( OBJ-AT ?auto_9864 ?auto_9871 ) ( IN-CITY ?auto_9867 ?auto_9868 ) ( not ( = ?auto_9862 ?auto_9867 ) ) ( OBJ-AT ?auto_9866 ?auto_9867 ) ( IN-CITY ?auto_9872 ?auto_9868 ) ( not ( = ?auto_9862 ?auto_9872 ) ) ( OBJ-AT ?auto_9863 ?auto_9872 ) ( IN-CITY ?auto_9869 ?auto_9868 ) ( not ( = ?auto_9862 ?auto_9869 ) ) ( OBJ-AT ?auto_9865 ?auto_9869 ) ( TRUCK-AT ?auto_9870 ?auto_9862 ) ( not ( = ?auto_9865 ?auto_9863 ) ) ( not ( = ?auto_9872 ?auto_9869 ) ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9863 ?auto_9866 ) ) ( not ( = ?auto_9867 ?auto_9872 ) ) ( not ( = ?auto_9867 ?auto_9869 ) ) ( not ( = ?auto_9865 ?auto_9864 ) ) ( not ( = ?auto_9863 ?auto_9864 ) ) ( not ( = ?auto_9866 ?auto_9864 ) ) ( not ( = ?auto_9871 ?auto_9867 ) ) ( not ( = ?auto_9871 ?auto_9872 ) ) ( not ( = ?auto_9871 ?auto_9869 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9865 ?auto_9863 ?auto_9864 ?auto_9866 ?auto_9862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_9936 - OBJ
      ?auto_9937 - OBJ
      ?auto_9938 - OBJ
      ?auto_9939 - OBJ
      ?auto_9935 - LOCATION
    )
    :vars
    (
      ?auto_9944 - LOCATION
      ?auto_9941 - CITY
      ?auto_9940 - LOCATION
      ?auto_9945 - LOCATION
      ?auto_9942 - LOCATION
      ?auto_9943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_9944 ?auto_9941 ) ( IN-CITY ?auto_9935 ?auto_9941 ) ( not ( = ?auto_9935 ?auto_9944 ) ) ( OBJ-AT ?auto_9937 ?auto_9944 ) ( IN-CITY ?auto_9940 ?auto_9941 ) ( not ( = ?auto_9935 ?auto_9940 ) ) ( OBJ-AT ?auto_9938 ?auto_9940 ) ( IN-CITY ?auto_9945 ?auto_9941 ) ( not ( = ?auto_9935 ?auto_9945 ) ) ( OBJ-AT ?auto_9936 ?auto_9945 ) ( IN-CITY ?auto_9942 ?auto_9941 ) ( not ( = ?auto_9935 ?auto_9942 ) ) ( OBJ-AT ?auto_9939 ?auto_9942 ) ( TRUCK-AT ?auto_9943 ?auto_9935 ) ( not ( = ?auto_9939 ?auto_9936 ) ) ( not ( = ?auto_9945 ?auto_9942 ) ) ( not ( = ?auto_9939 ?auto_9938 ) ) ( not ( = ?auto_9936 ?auto_9938 ) ) ( not ( = ?auto_9940 ?auto_9945 ) ) ( not ( = ?auto_9940 ?auto_9942 ) ) ( not ( = ?auto_9939 ?auto_9937 ) ) ( not ( = ?auto_9936 ?auto_9937 ) ) ( not ( = ?auto_9938 ?auto_9937 ) ) ( not ( = ?auto_9944 ?auto_9940 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( not ( = ?auto_9944 ?auto_9942 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_9939 ?auto_9936 ?auto_9937 ?auto_9938 ?auto_9935 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10045 - OBJ
      ?auto_10046 - OBJ
      ?auto_10047 - OBJ
      ?auto_10048 - OBJ
      ?auto_10044 - LOCATION
    )
    :vars
    (
      ?auto_10053 - LOCATION
      ?auto_10050 - CITY
      ?auto_10049 - LOCATION
      ?auto_10054 - LOCATION
      ?auto_10051 - LOCATION
      ?auto_10052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10053 ?auto_10050 ) ( IN-CITY ?auto_10044 ?auto_10050 ) ( not ( = ?auto_10044 ?auto_10053 ) ) ( OBJ-AT ?auto_10048 ?auto_10053 ) ( IN-CITY ?auto_10049 ?auto_10050 ) ( not ( = ?auto_10044 ?auto_10049 ) ) ( OBJ-AT ?auto_10045 ?auto_10049 ) ( IN-CITY ?auto_10054 ?auto_10050 ) ( not ( = ?auto_10044 ?auto_10054 ) ) ( OBJ-AT ?auto_10047 ?auto_10054 ) ( IN-CITY ?auto_10051 ?auto_10050 ) ( not ( = ?auto_10044 ?auto_10051 ) ) ( OBJ-AT ?auto_10046 ?auto_10051 ) ( TRUCK-AT ?auto_10052 ?auto_10044 ) ( not ( = ?auto_10046 ?auto_10047 ) ) ( not ( = ?auto_10054 ?auto_10051 ) ) ( not ( = ?auto_10046 ?auto_10045 ) ) ( not ( = ?auto_10047 ?auto_10045 ) ) ( not ( = ?auto_10049 ?auto_10054 ) ) ( not ( = ?auto_10049 ?auto_10051 ) ) ( not ( = ?auto_10046 ?auto_10048 ) ) ( not ( = ?auto_10047 ?auto_10048 ) ) ( not ( = ?auto_10045 ?auto_10048 ) ) ( not ( = ?auto_10053 ?auto_10049 ) ) ( not ( = ?auto_10053 ?auto_10054 ) ) ( not ( = ?auto_10053 ?auto_10051 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10046 ?auto_10047 ?auto_10048 ?auto_10045 ?auto_10044 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10080 - OBJ
      ?auto_10081 - OBJ
      ?auto_10082 - OBJ
      ?auto_10083 - OBJ
      ?auto_10079 - LOCATION
    )
    :vars
    (
      ?auto_10088 - LOCATION
      ?auto_10085 - CITY
      ?auto_10084 - LOCATION
      ?auto_10089 - LOCATION
      ?auto_10086 - LOCATION
      ?auto_10087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10088 ?auto_10085 ) ( IN-CITY ?auto_10079 ?auto_10085 ) ( not ( = ?auto_10079 ?auto_10088 ) ) ( OBJ-AT ?auto_10082 ?auto_10088 ) ( IN-CITY ?auto_10084 ?auto_10085 ) ( not ( = ?auto_10079 ?auto_10084 ) ) ( OBJ-AT ?auto_10080 ?auto_10084 ) ( IN-CITY ?auto_10089 ?auto_10085 ) ( not ( = ?auto_10079 ?auto_10089 ) ) ( OBJ-AT ?auto_10083 ?auto_10089 ) ( IN-CITY ?auto_10086 ?auto_10085 ) ( not ( = ?auto_10079 ?auto_10086 ) ) ( OBJ-AT ?auto_10081 ?auto_10086 ) ( TRUCK-AT ?auto_10087 ?auto_10079 ) ( not ( = ?auto_10081 ?auto_10083 ) ) ( not ( = ?auto_10089 ?auto_10086 ) ) ( not ( = ?auto_10081 ?auto_10080 ) ) ( not ( = ?auto_10083 ?auto_10080 ) ) ( not ( = ?auto_10084 ?auto_10089 ) ) ( not ( = ?auto_10084 ?auto_10086 ) ) ( not ( = ?auto_10081 ?auto_10082 ) ) ( not ( = ?auto_10083 ?auto_10082 ) ) ( not ( = ?auto_10080 ?auto_10082 ) ) ( not ( = ?auto_10088 ?auto_10084 ) ) ( not ( = ?auto_10088 ?auto_10089 ) ) ( not ( = ?auto_10088 ?auto_10086 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10081 ?auto_10083 ?auto_10082 ?auto_10080 ?auto_10079 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10115 - OBJ
      ?auto_10116 - OBJ
      ?auto_10117 - OBJ
      ?auto_10118 - OBJ
      ?auto_10114 - LOCATION
    )
    :vars
    (
      ?auto_10123 - LOCATION
      ?auto_10120 - CITY
      ?auto_10119 - LOCATION
      ?auto_10124 - LOCATION
      ?auto_10121 - LOCATION
      ?auto_10122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10123 ?auto_10120 ) ( IN-CITY ?auto_10114 ?auto_10120 ) ( not ( = ?auto_10114 ?auto_10123 ) ) ( OBJ-AT ?auto_10118 ?auto_10123 ) ( IN-CITY ?auto_10119 ?auto_10120 ) ( not ( = ?auto_10114 ?auto_10119 ) ) ( OBJ-AT ?auto_10115 ?auto_10119 ) ( IN-CITY ?auto_10124 ?auto_10120 ) ( not ( = ?auto_10114 ?auto_10124 ) ) ( OBJ-AT ?auto_10116 ?auto_10124 ) ( IN-CITY ?auto_10121 ?auto_10120 ) ( not ( = ?auto_10114 ?auto_10121 ) ) ( OBJ-AT ?auto_10117 ?auto_10121 ) ( TRUCK-AT ?auto_10122 ?auto_10114 ) ( not ( = ?auto_10117 ?auto_10116 ) ) ( not ( = ?auto_10124 ?auto_10121 ) ) ( not ( = ?auto_10117 ?auto_10115 ) ) ( not ( = ?auto_10116 ?auto_10115 ) ) ( not ( = ?auto_10119 ?auto_10124 ) ) ( not ( = ?auto_10119 ?auto_10121 ) ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10115 ?auto_10118 ) ) ( not ( = ?auto_10123 ?auto_10119 ) ) ( not ( = ?auto_10123 ?auto_10124 ) ) ( not ( = ?auto_10123 ?auto_10121 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10117 ?auto_10116 ?auto_10118 ?auto_10115 ?auto_10114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10150 - OBJ
      ?auto_10151 - OBJ
      ?auto_10152 - OBJ
      ?auto_10153 - OBJ
      ?auto_10149 - LOCATION
    )
    :vars
    (
      ?auto_10158 - LOCATION
      ?auto_10155 - CITY
      ?auto_10154 - LOCATION
      ?auto_10159 - LOCATION
      ?auto_10156 - LOCATION
      ?auto_10157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10158 ?auto_10155 ) ( IN-CITY ?auto_10149 ?auto_10155 ) ( not ( = ?auto_10149 ?auto_10158 ) ) ( OBJ-AT ?auto_10152 ?auto_10158 ) ( IN-CITY ?auto_10154 ?auto_10155 ) ( not ( = ?auto_10149 ?auto_10154 ) ) ( OBJ-AT ?auto_10150 ?auto_10154 ) ( IN-CITY ?auto_10159 ?auto_10155 ) ( not ( = ?auto_10149 ?auto_10159 ) ) ( OBJ-AT ?auto_10151 ?auto_10159 ) ( IN-CITY ?auto_10156 ?auto_10155 ) ( not ( = ?auto_10149 ?auto_10156 ) ) ( OBJ-AT ?auto_10153 ?auto_10156 ) ( TRUCK-AT ?auto_10157 ?auto_10149 ) ( not ( = ?auto_10153 ?auto_10151 ) ) ( not ( = ?auto_10159 ?auto_10156 ) ) ( not ( = ?auto_10153 ?auto_10150 ) ) ( not ( = ?auto_10151 ?auto_10150 ) ) ( not ( = ?auto_10154 ?auto_10159 ) ) ( not ( = ?auto_10154 ?auto_10156 ) ) ( not ( = ?auto_10153 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) ( not ( = ?auto_10150 ?auto_10152 ) ) ( not ( = ?auto_10158 ?auto_10154 ) ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10158 ?auto_10156 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10153 ?auto_10151 ?auto_10152 ?auto_10150 ?auto_10149 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10296 - OBJ
      ?auto_10297 - OBJ
      ?auto_10298 - OBJ
      ?auto_10299 - OBJ
      ?auto_10295 - LOCATION
    )
    :vars
    (
      ?auto_10304 - LOCATION
      ?auto_10301 - CITY
      ?auto_10300 - LOCATION
      ?auto_10305 - LOCATION
      ?auto_10302 - LOCATION
      ?auto_10303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10304 ?auto_10301 ) ( IN-CITY ?auto_10295 ?auto_10301 ) ( not ( = ?auto_10295 ?auto_10304 ) ) ( OBJ-AT ?auto_10297 ?auto_10304 ) ( IN-CITY ?auto_10300 ?auto_10301 ) ( not ( = ?auto_10295 ?auto_10300 ) ) ( OBJ-AT ?auto_10296 ?auto_10300 ) ( IN-CITY ?auto_10305 ?auto_10301 ) ( not ( = ?auto_10295 ?auto_10305 ) ) ( OBJ-AT ?auto_10299 ?auto_10305 ) ( IN-CITY ?auto_10302 ?auto_10301 ) ( not ( = ?auto_10295 ?auto_10302 ) ) ( OBJ-AT ?auto_10298 ?auto_10302 ) ( TRUCK-AT ?auto_10303 ?auto_10295 ) ( not ( = ?auto_10298 ?auto_10299 ) ) ( not ( = ?auto_10305 ?auto_10302 ) ) ( not ( = ?auto_10298 ?auto_10296 ) ) ( not ( = ?auto_10299 ?auto_10296 ) ) ( not ( = ?auto_10300 ?auto_10305 ) ) ( not ( = ?auto_10300 ?auto_10302 ) ) ( not ( = ?auto_10298 ?auto_10297 ) ) ( not ( = ?auto_10299 ?auto_10297 ) ) ( not ( = ?auto_10296 ?auto_10297 ) ) ( not ( = ?auto_10304 ?auto_10300 ) ) ( not ( = ?auto_10304 ?auto_10305 ) ) ( not ( = ?auto_10304 ?auto_10302 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10298 ?auto_10299 ?auto_10297 ?auto_10296 ?auto_10295 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10331 - OBJ
      ?auto_10332 - OBJ
      ?auto_10333 - OBJ
      ?auto_10334 - OBJ
      ?auto_10330 - LOCATION
    )
    :vars
    (
      ?auto_10339 - LOCATION
      ?auto_10336 - CITY
      ?auto_10335 - LOCATION
      ?auto_10340 - LOCATION
      ?auto_10337 - LOCATION
      ?auto_10338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10339 ?auto_10336 ) ( IN-CITY ?auto_10330 ?auto_10336 ) ( not ( = ?auto_10330 ?auto_10339 ) ) ( OBJ-AT ?auto_10332 ?auto_10339 ) ( IN-CITY ?auto_10335 ?auto_10336 ) ( not ( = ?auto_10330 ?auto_10335 ) ) ( OBJ-AT ?auto_10331 ?auto_10335 ) ( IN-CITY ?auto_10340 ?auto_10336 ) ( not ( = ?auto_10330 ?auto_10340 ) ) ( OBJ-AT ?auto_10333 ?auto_10340 ) ( IN-CITY ?auto_10337 ?auto_10336 ) ( not ( = ?auto_10330 ?auto_10337 ) ) ( OBJ-AT ?auto_10334 ?auto_10337 ) ( TRUCK-AT ?auto_10338 ?auto_10330 ) ( not ( = ?auto_10334 ?auto_10333 ) ) ( not ( = ?auto_10340 ?auto_10337 ) ) ( not ( = ?auto_10334 ?auto_10331 ) ) ( not ( = ?auto_10333 ?auto_10331 ) ) ( not ( = ?auto_10335 ?auto_10340 ) ) ( not ( = ?auto_10335 ?auto_10337 ) ) ( not ( = ?auto_10334 ?auto_10332 ) ) ( not ( = ?auto_10333 ?auto_10332 ) ) ( not ( = ?auto_10331 ?auto_10332 ) ) ( not ( = ?auto_10339 ?auto_10335 ) ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( not ( = ?auto_10339 ?auto_10337 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10334 ?auto_10333 ?auto_10332 ?auto_10331 ?auto_10330 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10552 - OBJ
      ?auto_10553 - OBJ
      ?auto_10554 - OBJ
      ?auto_10555 - OBJ
      ?auto_10551 - LOCATION
    )
    :vars
    (
      ?auto_10560 - LOCATION
      ?auto_10557 - CITY
      ?auto_10556 - LOCATION
      ?auto_10561 - LOCATION
      ?auto_10558 - LOCATION
      ?auto_10559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10560 ?auto_10557 ) ( IN-CITY ?auto_10551 ?auto_10557 ) ( not ( = ?auto_10551 ?auto_10560 ) ) ( OBJ-AT ?auto_10552 ?auto_10560 ) ( IN-CITY ?auto_10556 ?auto_10557 ) ( not ( = ?auto_10551 ?auto_10556 ) ) ( OBJ-AT ?auto_10555 ?auto_10556 ) ( IN-CITY ?auto_10561 ?auto_10557 ) ( not ( = ?auto_10551 ?auto_10561 ) ) ( OBJ-AT ?auto_10554 ?auto_10561 ) ( IN-CITY ?auto_10558 ?auto_10557 ) ( not ( = ?auto_10551 ?auto_10558 ) ) ( OBJ-AT ?auto_10553 ?auto_10558 ) ( TRUCK-AT ?auto_10559 ?auto_10551 ) ( not ( = ?auto_10553 ?auto_10554 ) ) ( not ( = ?auto_10561 ?auto_10558 ) ) ( not ( = ?auto_10553 ?auto_10555 ) ) ( not ( = ?auto_10554 ?auto_10555 ) ) ( not ( = ?auto_10556 ?auto_10561 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) ( not ( = ?auto_10553 ?auto_10552 ) ) ( not ( = ?auto_10554 ?auto_10552 ) ) ( not ( = ?auto_10555 ?auto_10552 ) ) ( not ( = ?auto_10560 ?auto_10556 ) ) ( not ( = ?auto_10560 ?auto_10561 ) ) ( not ( = ?auto_10560 ?auto_10558 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10553 ?auto_10554 ?auto_10552 ?auto_10555 ?auto_10551 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10587 - OBJ
      ?auto_10588 - OBJ
      ?auto_10589 - OBJ
      ?auto_10590 - OBJ
      ?auto_10586 - LOCATION
    )
    :vars
    (
      ?auto_10595 - LOCATION
      ?auto_10592 - CITY
      ?auto_10591 - LOCATION
      ?auto_10596 - LOCATION
      ?auto_10593 - LOCATION
      ?auto_10594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10595 ?auto_10592 ) ( IN-CITY ?auto_10586 ?auto_10592 ) ( not ( = ?auto_10586 ?auto_10595 ) ) ( OBJ-AT ?auto_10587 ?auto_10595 ) ( IN-CITY ?auto_10591 ?auto_10592 ) ( not ( = ?auto_10586 ?auto_10591 ) ) ( OBJ-AT ?auto_10589 ?auto_10591 ) ( IN-CITY ?auto_10596 ?auto_10592 ) ( not ( = ?auto_10586 ?auto_10596 ) ) ( OBJ-AT ?auto_10590 ?auto_10596 ) ( IN-CITY ?auto_10593 ?auto_10592 ) ( not ( = ?auto_10586 ?auto_10593 ) ) ( OBJ-AT ?auto_10588 ?auto_10593 ) ( TRUCK-AT ?auto_10594 ?auto_10586 ) ( not ( = ?auto_10588 ?auto_10590 ) ) ( not ( = ?auto_10596 ?auto_10593 ) ) ( not ( = ?auto_10588 ?auto_10589 ) ) ( not ( = ?auto_10590 ?auto_10589 ) ) ( not ( = ?auto_10591 ?auto_10596 ) ) ( not ( = ?auto_10591 ?auto_10593 ) ) ( not ( = ?auto_10588 ?auto_10587 ) ) ( not ( = ?auto_10590 ?auto_10587 ) ) ( not ( = ?auto_10589 ?auto_10587 ) ) ( not ( = ?auto_10595 ?auto_10591 ) ) ( not ( = ?auto_10595 ?auto_10596 ) ) ( not ( = ?auto_10595 ?auto_10593 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10588 ?auto_10590 ?auto_10587 ?auto_10589 ?auto_10586 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10696 - OBJ
      ?auto_10697 - OBJ
      ?auto_10698 - OBJ
      ?auto_10699 - OBJ
      ?auto_10695 - LOCATION
    )
    :vars
    (
      ?auto_10704 - LOCATION
      ?auto_10701 - CITY
      ?auto_10700 - LOCATION
      ?auto_10705 - LOCATION
      ?auto_10702 - LOCATION
      ?auto_10703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10704 ?auto_10701 ) ( IN-CITY ?auto_10695 ?auto_10701 ) ( not ( = ?auto_10695 ?auto_10704 ) ) ( OBJ-AT ?auto_10696 ?auto_10704 ) ( IN-CITY ?auto_10700 ?auto_10701 ) ( not ( = ?auto_10695 ?auto_10700 ) ) ( OBJ-AT ?auto_10699 ?auto_10700 ) ( IN-CITY ?auto_10705 ?auto_10701 ) ( not ( = ?auto_10695 ?auto_10705 ) ) ( OBJ-AT ?auto_10697 ?auto_10705 ) ( IN-CITY ?auto_10702 ?auto_10701 ) ( not ( = ?auto_10695 ?auto_10702 ) ) ( OBJ-AT ?auto_10698 ?auto_10702 ) ( TRUCK-AT ?auto_10703 ?auto_10695 ) ( not ( = ?auto_10698 ?auto_10697 ) ) ( not ( = ?auto_10705 ?auto_10702 ) ) ( not ( = ?auto_10698 ?auto_10699 ) ) ( not ( = ?auto_10697 ?auto_10699 ) ) ( not ( = ?auto_10700 ?auto_10705 ) ) ( not ( = ?auto_10700 ?auto_10702 ) ) ( not ( = ?auto_10698 ?auto_10696 ) ) ( not ( = ?auto_10697 ?auto_10696 ) ) ( not ( = ?auto_10699 ?auto_10696 ) ) ( not ( = ?auto_10704 ?auto_10700 ) ) ( not ( = ?auto_10704 ?auto_10705 ) ) ( not ( = ?auto_10704 ?auto_10702 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10698 ?auto_10697 ?auto_10696 ?auto_10699 ?auto_10695 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10769 - OBJ
      ?auto_10770 - OBJ
      ?auto_10771 - OBJ
      ?auto_10772 - OBJ
      ?auto_10768 - LOCATION
    )
    :vars
    (
      ?auto_10777 - LOCATION
      ?auto_10774 - CITY
      ?auto_10773 - LOCATION
      ?auto_10778 - LOCATION
      ?auto_10775 - LOCATION
      ?auto_10776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10777 ?auto_10774 ) ( IN-CITY ?auto_10768 ?auto_10774 ) ( not ( = ?auto_10768 ?auto_10777 ) ) ( OBJ-AT ?auto_10769 ?auto_10777 ) ( IN-CITY ?auto_10773 ?auto_10774 ) ( not ( = ?auto_10768 ?auto_10773 ) ) ( OBJ-AT ?auto_10771 ?auto_10773 ) ( IN-CITY ?auto_10778 ?auto_10774 ) ( not ( = ?auto_10768 ?auto_10778 ) ) ( OBJ-AT ?auto_10770 ?auto_10778 ) ( IN-CITY ?auto_10775 ?auto_10774 ) ( not ( = ?auto_10768 ?auto_10775 ) ) ( OBJ-AT ?auto_10772 ?auto_10775 ) ( TRUCK-AT ?auto_10776 ?auto_10768 ) ( not ( = ?auto_10772 ?auto_10770 ) ) ( not ( = ?auto_10778 ?auto_10775 ) ) ( not ( = ?auto_10772 ?auto_10771 ) ) ( not ( = ?auto_10770 ?auto_10771 ) ) ( not ( = ?auto_10773 ?auto_10778 ) ) ( not ( = ?auto_10773 ?auto_10775 ) ) ( not ( = ?auto_10772 ?auto_10769 ) ) ( not ( = ?auto_10770 ?auto_10769 ) ) ( not ( = ?auto_10771 ?auto_10769 ) ) ( not ( = ?auto_10777 ?auto_10773 ) ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( not ( = ?auto_10777 ?auto_10775 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10772 ?auto_10770 ?auto_10769 ?auto_10771 ?auto_10768 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10878 - OBJ
      ?auto_10879 - OBJ
      ?auto_10880 - OBJ
      ?auto_10881 - OBJ
      ?auto_10877 - LOCATION
    )
    :vars
    (
      ?auto_10886 - LOCATION
      ?auto_10883 - CITY
      ?auto_10882 - LOCATION
      ?auto_10887 - LOCATION
      ?auto_10884 - LOCATION
      ?auto_10885 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10886 ?auto_10883 ) ( IN-CITY ?auto_10877 ?auto_10883 ) ( not ( = ?auto_10877 ?auto_10886 ) ) ( OBJ-AT ?auto_10878 ?auto_10886 ) ( IN-CITY ?auto_10882 ?auto_10883 ) ( not ( = ?auto_10877 ?auto_10882 ) ) ( OBJ-AT ?auto_10879 ?auto_10882 ) ( IN-CITY ?auto_10887 ?auto_10883 ) ( not ( = ?auto_10877 ?auto_10887 ) ) ( OBJ-AT ?auto_10881 ?auto_10887 ) ( IN-CITY ?auto_10884 ?auto_10883 ) ( not ( = ?auto_10877 ?auto_10884 ) ) ( OBJ-AT ?auto_10880 ?auto_10884 ) ( TRUCK-AT ?auto_10885 ?auto_10877 ) ( not ( = ?auto_10880 ?auto_10881 ) ) ( not ( = ?auto_10887 ?auto_10884 ) ) ( not ( = ?auto_10880 ?auto_10879 ) ) ( not ( = ?auto_10881 ?auto_10879 ) ) ( not ( = ?auto_10882 ?auto_10887 ) ) ( not ( = ?auto_10882 ?auto_10884 ) ) ( not ( = ?auto_10880 ?auto_10878 ) ) ( not ( = ?auto_10881 ?auto_10878 ) ) ( not ( = ?auto_10879 ?auto_10878 ) ) ( not ( = ?auto_10886 ?auto_10882 ) ) ( not ( = ?auto_10886 ?auto_10887 ) ) ( not ( = ?auto_10886 ?auto_10884 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10880 ?auto_10881 ?auto_10878 ?auto_10879 ?auto_10877 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_10913 - OBJ
      ?auto_10914 - OBJ
      ?auto_10915 - OBJ
      ?auto_10916 - OBJ
      ?auto_10912 - LOCATION
    )
    :vars
    (
      ?auto_10921 - LOCATION
      ?auto_10918 - CITY
      ?auto_10917 - LOCATION
      ?auto_10922 - LOCATION
      ?auto_10919 - LOCATION
      ?auto_10920 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_10921 ?auto_10918 ) ( IN-CITY ?auto_10912 ?auto_10918 ) ( not ( = ?auto_10912 ?auto_10921 ) ) ( OBJ-AT ?auto_10913 ?auto_10921 ) ( IN-CITY ?auto_10917 ?auto_10918 ) ( not ( = ?auto_10912 ?auto_10917 ) ) ( OBJ-AT ?auto_10914 ?auto_10917 ) ( IN-CITY ?auto_10922 ?auto_10918 ) ( not ( = ?auto_10912 ?auto_10922 ) ) ( OBJ-AT ?auto_10915 ?auto_10922 ) ( IN-CITY ?auto_10919 ?auto_10918 ) ( not ( = ?auto_10912 ?auto_10919 ) ) ( OBJ-AT ?auto_10916 ?auto_10919 ) ( TRUCK-AT ?auto_10920 ?auto_10912 ) ( not ( = ?auto_10916 ?auto_10915 ) ) ( not ( = ?auto_10922 ?auto_10919 ) ) ( not ( = ?auto_10916 ?auto_10914 ) ) ( not ( = ?auto_10915 ?auto_10914 ) ) ( not ( = ?auto_10917 ?auto_10922 ) ) ( not ( = ?auto_10917 ?auto_10919 ) ) ( not ( = ?auto_10916 ?auto_10913 ) ) ( not ( = ?auto_10915 ?auto_10913 ) ) ( not ( = ?auto_10914 ?auto_10913 ) ) ( not ( = ?auto_10921 ?auto_10917 ) ) ( not ( = ?auto_10921 ?auto_10922 ) ) ( not ( = ?auto_10921 ?auto_10919 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_10916 ?auto_10915 ?auto_10913 ?auto_10914 ?auto_10912 ) )
  )

)

