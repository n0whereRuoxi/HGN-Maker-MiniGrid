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
      ?auto_54868 - OBJ
      ?auto_54867 - LOCATION
    )
    :vars
    (
      ?auto_54869 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_54869 ?auto_54867 ) ( IN-TRUCK ?auto_54868 ?auto_54869 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_54868 ?auto_54869 ?auto_54867 )
      ( DELIVER-1PKG-VERIFY ?auto_54868 ?auto_54867 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54886 - OBJ
      ?auto_54885 - LOCATION
    )
    :vars
    (
      ?auto_54887 - TRUCK
      ?auto_54888 - LOCATION
      ?auto_54889 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_54886 ?auto_54887 ) ( TRUCK-AT ?auto_54887 ?auto_54888 ) ( IN-CITY ?auto_54888 ?auto_54889 ) ( IN-CITY ?auto_54885 ?auto_54889 ) ( not ( = ?auto_54885 ?auto_54888 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_54887 ?auto_54888 ?auto_54885 ?auto_54889 )
      ( DELIVER-1PKG ?auto_54886 ?auto_54885 )
      ( DELIVER-1PKG-VERIFY ?auto_54886 ?auto_54885 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54912 - OBJ
      ?auto_54911 - LOCATION
    )
    :vars
    (
      ?auto_54913 - TRUCK
      ?auto_54914 - LOCATION
      ?auto_54915 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_54913 ?auto_54914 ) ( IN-CITY ?auto_54914 ?auto_54915 ) ( IN-CITY ?auto_54911 ?auto_54915 ) ( not ( = ?auto_54911 ?auto_54914 ) ) ( OBJ-AT ?auto_54912 ?auto_54914 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_54912 ?auto_54913 ?auto_54914 )
      ( DELIVER-1PKG ?auto_54912 ?auto_54911 )
      ( DELIVER-1PKG-VERIFY ?auto_54912 ?auto_54911 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_54938 - OBJ
      ?auto_54937 - LOCATION
    )
    :vars
    (
      ?auto_54941 - LOCATION
      ?auto_54940 - CITY
      ?auto_54939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_54941 ?auto_54940 ) ( IN-CITY ?auto_54937 ?auto_54940 ) ( not ( = ?auto_54937 ?auto_54941 ) ) ( OBJ-AT ?auto_54938 ?auto_54941 ) ( TRUCK-AT ?auto_54939 ?auto_54937 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_54939 ?auto_54937 ?auto_54941 ?auto_54940 )
      ( DELIVER-1PKG ?auto_54938 ?auto_54937 )
      ( DELIVER-1PKG-VERIFY ?auto_54938 ?auto_54937 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55081 - OBJ
      ?auto_55082 - OBJ
      ?auto_55080 - LOCATION
    )
    :vars
    (
      ?auto_55083 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55083 ?auto_55080 ) ( IN-TRUCK ?auto_55082 ?auto_55083 ) ( OBJ-AT ?auto_55081 ?auto_55080 ) ( not ( = ?auto_55081 ?auto_55082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55082 ?auto_55080 )
      ( DELIVER-2PKG-VERIFY ?auto_55081 ?auto_55082 ?auto_55080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55085 - OBJ
      ?auto_55086 - OBJ
      ?auto_55084 - LOCATION
    )
    :vars
    (
      ?auto_55087 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55087 ?auto_55084 ) ( IN-TRUCK ?auto_55085 ?auto_55087 ) ( OBJ-AT ?auto_55086 ?auto_55084 ) ( not ( = ?auto_55085 ?auto_55086 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55085 ?auto_55084 )
      ( DELIVER-2PKG-VERIFY ?auto_55085 ?auto_55086 ?auto_55084 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55093 - OBJ
      ?auto_55094 - OBJ
      ?auto_55095 - OBJ
      ?auto_55092 - LOCATION
    )
    :vars
    (
      ?auto_55096 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55096 ?auto_55092 ) ( IN-TRUCK ?auto_55095 ?auto_55096 ) ( OBJ-AT ?auto_55093 ?auto_55092 ) ( OBJ-AT ?auto_55094 ?auto_55092 ) ( not ( = ?auto_55093 ?auto_55094 ) ) ( not ( = ?auto_55093 ?auto_55095 ) ) ( not ( = ?auto_55094 ?auto_55095 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55095 ?auto_55092 )
      ( DELIVER-3PKG-VERIFY ?auto_55093 ?auto_55094 ?auto_55095 ?auto_55092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55098 - OBJ
      ?auto_55099 - OBJ
      ?auto_55100 - OBJ
      ?auto_55097 - LOCATION
    )
    :vars
    (
      ?auto_55101 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55101 ?auto_55097 ) ( IN-TRUCK ?auto_55099 ?auto_55101 ) ( OBJ-AT ?auto_55098 ?auto_55097 ) ( OBJ-AT ?auto_55100 ?auto_55097 ) ( not ( = ?auto_55098 ?auto_55099 ) ) ( not ( = ?auto_55098 ?auto_55100 ) ) ( not ( = ?auto_55099 ?auto_55100 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55099 ?auto_55097 )
      ( DELIVER-3PKG-VERIFY ?auto_55098 ?auto_55099 ?auto_55100 ?auto_55097 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55108 - OBJ
      ?auto_55109 - OBJ
      ?auto_55110 - OBJ
      ?auto_55107 - LOCATION
    )
    :vars
    (
      ?auto_55111 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55111 ?auto_55107 ) ( IN-TRUCK ?auto_55108 ?auto_55111 ) ( OBJ-AT ?auto_55109 ?auto_55107 ) ( OBJ-AT ?auto_55110 ?auto_55107 ) ( not ( = ?auto_55108 ?auto_55109 ) ) ( not ( = ?auto_55108 ?auto_55110 ) ) ( not ( = ?auto_55109 ?auto_55110 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55108 ?auto_55107 )
      ( DELIVER-3PKG-VERIFY ?auto_55108 ?auto_55109 ?auto_55110 ?auto_55107 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55128 - OBJ
      ?auto_55129 - OBJ
      ?auto_55130 - OBJ
      ?auto_55131 - OBJ
      ?auto_55127 - LOCATION
    )
    :vars
    (
      ?auto_55132 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55132 ?auto_55127 ) ( IN-TRUCK ?auto_55131 ?auto_55132 ) ( OBJ-AT ?auto_55128 ?auto_55127 ) ( OBJ-AT ?auto_55129 ?auto_55127 ) ( OBJ-AT ?auto_55130 ?auto_55127 ) ( not ( = ?auto_55128 ?auto_55129 ) ) ( not ( = ?auto_55128 ?auto_55130 ) ) ( not ( = ?auto_55128 ?auto_55131 ) ) ( not ( = ?auto_55129 ?auto_55130 ) ) ( not ( = ?auto_55129 ?auto_55131 ) ) ( not ( = ?auto_55130 ?auto_55131 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55131 ?auto_55127 )
      ( DELIVER-4PKG-VERIFY ?auto_55128 ?auto_55129 ?auto_55130 ?auto_55131 ?auto_55127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55134 - OBJ
      ?auto_55135 - OBJ
      ?auto_55136 - OBJ
      ?auto_55137 - OBJ
      ?auto_55133 - LOCATION
    )
    :vars
    (
      ?auto_55138 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55138 ?auto_55133 ) ( IN-TRUCK ?auto_55136 ?auto_55138 ) ( OBJ-AT ?auto_55134 ?auto_55133 ) ( OBJ-AT ?auto_55135 ?auto_55133 ) ( OBJ-AT ?auto_55137 ?auto_55133 ) ( not ( = ?auto_55134 ?auto_55135 ) ) ( not ( = ?auto_55134 ?auto_55136 ) ) ( not ( = ?auto_55134 ?auto_55137 ) ) ( not ( = ?auto_55135 ?auto_55136 ) ) ( not ( = ?auto_55135 ?auto_55137 ) ) ( not ( = ?auto_55136 ?auto_55137 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55136 ?auto_55133 )
      ( DELIVER-4PKG-VERIFY ?auto_55134 ?auto_55135 ?auto_55136 ?auto_55137 ?auto_55133 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55146 - OBJ
      ?auto_55147 - OBJ
      ?auto_55148 - OBJ
      ?auto_55149 - OBJ
      ?auto_55145 - LOCATION
    )
    :vars
    (
      ?auto_55150 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55150 ?auto_55145 ) ( IN-TRUCK ?auto_55147 ?auto_55150 ) ( OBJ-AT ?auto_55146 ?auto_55145 ) ( OBJ-AT ?auto_55148 ?auto_55145 ) ( OBJ-AT ?auto_55149 ?auto_55145 ) ( not ( = ?auto_55146 ?auto_55147 ) ) ( not ( = ?auto_55146 ?auto_55148 ) ) ( not ( = ?auto_55146 ?auto_55149 ) ) ( not ( = ?auto_55147 ?auto_55148 ) ) ( not ( = ?auto_55147 ?auto_55149 ) ) ( not ( = ?auto_55148 ?auto_55149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55147 ?auto_55145 )
      ( DELIVER-4PKG-VERIFY ?auto_55146 ?auto_55147 ?auto_55148 ?auto_55149 ?auto_55145 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55170 - OBJ
      ?auto_55171 - OBJ
      ?auto_55172 - OBJ
      ?auto_55173 - OBJ
      ?auto_55169 - LOCATION
    )
    :vars
    (
      ?auto_55174 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55174 ?auto_55169 ) ( IN-TRUCK ?auto_55170 ?auto_55174 ) ( OBJ-AT ?auto_55171 ?auto_55169 ) ( OBJ-AT ?auto_55172 ?auto_55169 ) ( OBJ-AT ?auto_55173 ?auto_55169 ) ( not ( = ?auto_55170 ?auto_55171 ) ) ( not ( = ?auto_55170 ?auto_55172 ) ) ( not ( = ?auto_55170 ?auto_55173 ) ) ( not ( = ?auto_55171 ?auto_55172 ) ) ( not ( = ?auto_55171 ?auto_55173 ) ) ( not ( = ?auto_55172 ?auto_55173 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55170 ?auto_55169 )
      ( DELIVER-4PKG-VERIFY ?auto_55170 ?auto_55171 ?auto_55172 ?auto_55173 ?auto_55169 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55223 - OBJ
      ?auto_55224 - OBJ
      ?auto_55222 - LOCATION
    )
    :vars
    (
      ?auto_55225 - TRUCK
      ?auto_55226 - LOCATION
      ?auto_55227 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55224 ?auto_55225 ) ( TRUCK-AT ?auto_55225 ?auto_55226 ) ( IN-CITY ?auto_55226 ?auto_55227 ) ( IN-CITY ?auto_55222 ?auto_55227 ) ( not ( = ?auto_55222 ?auto_55226 ) ) ( OBJ-AT ?auto_55223 ?auto_55222 ) ( not ( = ?auto_55223 ?auto_55224 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55224 ?auto_55222 )
      ( DELIVER-2PKG-VERIFY ?auto_55223 ?auto_55224 ?auto_55222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55229 - OBJ
      ?auto_55230 - OBJ
      ?auto_55228 - LOCATION
    )
    :vars
    (
      ?auto_55233 - TRUCK
      ?auto_55232 - LOCATION
      ?auto_55231 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55229 ?auto_55233 ) ( TRUCK-AT ?auto_55233 ?auto_55232 ) ( IN-CITY ?auto_55232 ?auto_55231 ) ( IN-CITY ?auto_55228 ?auto_55231 ) ( not ( = ?auto_55228 ?auto_55232 ) ) ( OBJ-AT ?auto_55230 ?auto_55228 ) ( not ( = ?auto_55230 ?auto_55229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55230 ?auto_55229 ?auto_55228 )
      ( DELIVER-2PKG-VERIFY ?auto_55229 ?auto_55230 ?auto_55228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55242 - OBJ
      ?auto_55243 - OBJ
      ?auto_55244 - OBJ
      ?auto_55241 - LOCATION
    )
    :vars
    (
      ?auto_55247 - TRUCK
      ?auto_55246 - LOCATION
      ?auto_55245 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55244 ?auto_55247 ) ( TRUCK-AT ?auto_55247 ?auto_55246 ) ( IN-CITY ?auto_55246 ?auto_55245 ) ( IN-CITY ?auto_55241 ?auto_55245 ) ( not ( = ?auto_55241 ?auto_55246 ) ) ( OBJ-AT ?auto_55242 ?auto_55241 ) ( not ( = ?auto_55242 ?auto_55244 ) ) ( OBJ-AT ?auto_55243 ?auto_55241 ) ( not ( = ?auto_55242 ?auto_55243 ) ) ( not ( = ?auto_55243 ?auto_55244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55242 ?auto_55244 ?auto_55241 )
      ( DELIVER-3PKG-VERIFY ?auto_55242 ?auto_55243 ?auto_55244 ?auto_55241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55249 - OBJ
      ?auto_55250 - OBJ
      ?auto_55251 - OBJ
      ?auto_55248 - LOCATION
    )
    :vars
    (
      ?auto_55254 - TRUCK
      ?auto_55253 - LOCATION
      ?auto_55252 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55250 ?auto_55254 ) ( TRUCK-AT ?auto_55254 ?auto_55253 ) ( IN-CITY ?auto_55253 ?auto_55252 ) ( IN-CITY ?auto_55248 ?auto_55252 ) ( not ( = ?auto_55248 ?auto_55253 ) ) ( OBJ-AT ?auto_55251 ?auto_55248 ) ( not ( = ?auto_55251 ?auto_55250 ) ) ( OBJ-AT ?auto_55249 ?auto_55248 ) ( not ( = ?auto_55249 ?auto_55250 ) ) ( not ( = ?auto_55249 ?auto_55251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55251 ?auto_55250 ?auto_55248 )
      ( DELIVER-3PKG-VERIFY ?auto_55249 ?auto_55250 ?auto_55251 ?auto_55248 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55263 - OBJ
      ?auto_55264 - OBJ
      ?auto_55265 - OBJ
      ?auto_55262 - LOCATION
    )
    :vars
    (
      ?auto_55268 - TRUCK
      ?auto_55267 - LOCATION
      ?auto_55266 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55263 ?auto_55268 ) ( TRUCK-AT ?auto_55268 ?auto_55267 ) ( IN-CITY ?auto_55267 ?auto_55266 ) ( IN-CITY ?auto_55262 ?auto_55266 ) ( not ( = ?auto_55262 ?auto_55267 ) ) ( OBJ-AT ?auto_55264 ?auto_55262 ) ( not ( = ?auto_55264 ?auto_55263 ) ) ( OBJ-AT ?auto_55265 ?auto_55262 ) ( not ( = ?auto_55263 ?auto_55265 ) ) ( not ( = ?auto_55264 ?auto_55265 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55264 ?auto_55263 ?auto_55262 )
      ( DELIVER-3PKG-VERIFY ?auto_55263 ?auto_55264 ?auto_55265 ?auto_55262 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55292 - OBJ
      ?auto_55293 - OBJ
      ?auto_55294 - OBJ
      ?auto_55295 - OBJ
      ?auto_55291 - LOCATION
    )
    :vars
    (
      ?auto_55298 - TRUCK
      ?auto_55297 - LOCATION
      ?auto_55296 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55295 ?auto_55298 ) ( TRUCK-AT ?auto_55298 ?auto_55297 ) ( IN-CITY ?auto_55297 ?auto_55296 ) ( IN-CITY ?auto_55291 ?auto_55296 ) ( not ( = ?auto_55291 ?auto_55297 ) ) ( OBJ-AT ?auto_55293 ?auto_55291 ) ( not ( = ?auto_55293 ?auto_55295 ) ) ( OBJ-AT ?auto_55292 ?auto_55291 ) ( OBJ-AT ?auto_55294 ?auto_55291 ) ( not ( = ?auto_55292 ?auto_55293 ) ) ( not ( = ?auto_55292 ?auto_55294 ) ) ( not ( = ?auto_55292 ?auto_55295 ) ) ( not ( = ?auto_55293 ?auto_55294 ) ) ( not ( = ?auto_55294 ?auto_55295 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55293 ?auto_55295 ?auto_55291 )
      ( DELIVER-4PKG-VERIFY ?auto_55292 ?auto_55293 ?auto_55294 ?auto_55295 ?auto_55291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55300 - OBJ
      ?auto_55301 - OBJ
      ?auto_55302 - OBJ
      ?auto_55303 - OBJ
      ?auto_55299 - LOCATION
    )
    :vars
    (
      ?auto_55306 - TRUCK
      ?auto_55305 - LOCATION
      ?auto_55304 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55302 ?auto_55306 ) ( TRUCK-AT ?auto_55306 ?auto_55305 ) ( IN-CITY ?auto_55305 ?auto_55304 ) ( IN-CITY ?auto_55299 ?auto_55304 ) ( not ( = ?auto_55299 ?auto_55305 ) ) ( OBJ-AT ?auto_55300 ?auto_55299 ) ( not ( = ?auto_55300 ?auto_55302 ) ) ( OBJ-AT ?auto_55301 ?auto_55299 ) ( OBJ-AT ?auto_55303 ?auto_55299 ) ( not ( = ?auto_55300 ?auto_55301 ) ) ( not ( = ?auto_55300 ?auto_55303 ) ) ( not ( = ?auto_55301 ?auto_55302 ) ) ( not ( = ?auto_55301 ?auto_55303 ) ) ( not ( = ?auto_55302 ?auto_55303 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55300 ?auto_55302 ?auto_55299 )
      ( DELIVER-4PKG-VERIFY ?auto_55300 ?auto_55301 ?auto_55302 ?auto_55303 ?auto_55299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55316 - OBJ
      ?auto_55317 - OBJ
      ?auto_55318 - OBJ
      ?auto_55319 - OBJ
      ?auto_55315 - LOCATION
    )
    :vars
    (
      ?auto_55322 - TRUCK
      ?auto_55321 - LOCATION
      ?auto_55320 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55317 ?auto_55322 ) ( TRUCK-AT ?auto_55322 ?auto_55321 ) ( IN-CITY ?auto_55321 ?auto_55320 ) ( IN-CITY ?auto_55315 ?auto_55320 ) ( not ( = ?auto_55315 ?auto_55321 ) ) ( OBJ-AT ?auto_55319 ?auto_55315 ) ( not ( = ?auto_55319 ?auto_55317 ) ) ( OBJ-AT ?auto_55316 ?auto_55315 ) ( OBJ-AT ?auto_55318 ?auto_55315 ) ( not ( = ?auto_55316 ?auto_55317 ) ) ( not ( = ?auto_55316 ?auto_55318 ) ) ( not ( = ?auto_55316 ?auto_55319 ) ) ( not ( = ?auto_55317 ?auto_55318 ) ) ( not ( = ?auto_55318 ?auto_55319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55319 ?auto_55317 ?auto_55315 )
      ( DELIVER-4PKG-VERIFY ?auto_55316 ?auto_55317 ?auto_55318 ?auto_55319 ?auto_55315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55348 - OBJ
      ?auto_55349 - OBJ
      ?auto_55350 - OBJ
      ?auto_55351 - OBJ
      ?auto_55347 - LOCATION
    )
    :vars
    (
      ?auto_55354 - TRUCK
      ?auto_55353 - LOCATION
      ?auto_55352 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55348 ?auto_55354 ) ( TRUCK-AT ?auto_55354 ?auto_55353 ) ( IN-CITY ?auto_55353 ?auto_55352 ) ( IN-CITY ?auto_55347 ?auto_55352 ) ( not ( = ?auto_55347 ?auto_55353 ) ) ( OBJ-AT ?auto_55349 ?auto_55347 ) ( not ( = ?auto_55349 ?auto_55348 ) ) ( OBJ-AT ?auto_55350 ?auto_55347 ) ( OBJ-AT ?auto_55351 ?auto_55347 ) ( not ( = ?auto_55348 ?auto_55350 ) ) ( not ( = ?auto_55348 ?auto_55351 ) ) ( not ( = ?auto_55349 ?auto_55350 ) ) ( not ( = ?auto_55349 ?auto_55351 ) ) ( not ( = ?auto_55350 ?auto_55351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55349 ?auto_55348 ?auto_55347 )
      ( DELIVER-4PKG-VERIFY ?auto_55348 ?auto_55349 ?auto_55350 ?auto_55351 ?auto_55347 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55413 - OBJ
      ?auto_55412 - LOCATION
    )
    :vars
    (
      ?auto_55417 - TRUCK
      ?auto_55415 - LOCATION
      ?auto_55414 - CITY
      ?auto_55416 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55417 ?auto_55415 ) ( IN-CITY ?auto_55415 ?auto_55414 ) ( IN-CITY ?auto_55412 ?auto_55414 ) ( not ( = ?auto_55412 ?auto_55415 ) ) ( OBJ-AT ?auto_55416 ?auto_55412 ) ( not ( = ?auto_55416 ?auto_55413 ) ) ( OBJ-AT ?auto_55413 ?auto_55415 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55413 ?auto_55417 ?auto_55415 )
      ( DELIVER-2PKG ?auto_55416 ?auto_55413 ?auto_55412 )
      ( DELIVER-1PKG-VERIFY ?auto_55413 ?auto_55412 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55419 - OBJ
      ?auto_55420 - OBJ
      ?auto_55418 - LOCATION
    )
    :vars
    (
      ?auto_55422 - TRUCK
      ?auto_55421 - LOCATION
      ?auto_55423 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55422 ?auto_55421 ) ( IN-CITY ?auto_55421 ?auto_55423 ) ( IN-CITY ?auto_55418 ?auto_55423 ) ( not ( = ?auto_55418 ?auto_55421 ) ) ( OBJ-AT ?auto_55419 ?auto_55418 ) ( not ( = ?auto_55419 ?auto_55420 ) ) ( OBJ-AT ?auto_55420 ?auto_55421 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55420 ?auto_55418 )
      ( DELIVER-2PKG-VERIFY ?auto_55419 ?auto_55420 ?auto_55418 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55425 - OBJ
      ?auto_55426 - OBJ
      ?auto_55424 - LOCATION
    )
    :vars
    (
      ?auto_55427 - TRUCK
      ?auto_55428 - LOCATION
      ?auto_55429 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55427 ?auto_55428 ) ( IN-CITY ?auto_55428 ?auto_55429 ) ( IN-CITY ?auto_55424 ?auto_55429 ) ( not ( = ?auto_55424 ?auto_55428 ) ) ( OBJ-AT ?auto_55426 ?auto_55424 ) ( not ( = ?auto_55426 ?auto_55425 ) ) ( OBJ-AT ?auto_55425 ?auto_55428 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55426 ?auto_55425 ?auto_55424 )
      ( DELIVER-2PKG-VERIFY ?auto_55425 ?auto_55426 ?auto_55424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55438 - OBJ
      ?auto_55439 - OBJ
      ?auto_55440 - OBJ
      ?auto_55437 - LOCATION
    )
    :vars
    (
      ?auto_55441 - TRUCK
      ?auto_55442 - LOCATION
      ?auto_55443 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55441 ?auto_55442 ) ( IN-CITY ?auto_55442 ?auto_55443 ) ( IN-CITY ?auto_55437 ?auto_55443 ) ( not ( = ?auto_55437 ?auto_55442 ) ) ( OBJ-AT ?auto_55438 ?auto_55437 ) ( not ( = ?auto_55438 ?auto_55440 ) ) ( OBJ-AT ?auto_55440 ?auto_55442 ) ( OBJ-AT ?auto_55439 ?auto_55437 ) ( not ( = ?auto_55438 ?auto_55439 ) ) ( not ( = ?auto_55439 ?auto_55440 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55438 ?auto_55440 ?auto_55437 )
      ( DELIVER-3PKG-VERIFY ?auto_55438 ?auto_55439 ?auto_55440 ?auto_55437 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55445 - OBJ
      ?auto_55446 - OBJ
      ?auto_55447 - OBJ
      ?auto_55444 - LOCATION
    )
    :vars
    (
      ?auto_55448 - TRUCK
      ?auto_55449 - LOCATION
      ?auto_55450 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55448 ?auto_55449 ) ( IN-CITY ?auto_55449 ?auto_55450 ) ( IN-CITY ?auto_55444 ?auto_55450 ) ( not ( = ?auto_55444 ?auto_55449 ) ) ( OBJ-AT ?auto_55447 ?auto_55444 ) ( not ( = ?auto_55447 ?auto_55446 ) ) ( OBJ-AT ?auto_55446 ?auto_55449 ) ( OBJ-AT ?auto_55445 ?auto_55444 ) ( not ( = ?auto_55445 ?auto_55446 ) ) ( not ( = ?auto_55445 ?auto_55447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55447 ?auto_55446 ?auto_55444 )
      ( DELIVER-3PKG-VERIFY ?auto_55445 ?auto_55446 ?auto_55447 ?auto_55444 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55459 - OBJ
      ?auto_55460 - OBJ
      ?auto_55461 - OBJ
      ?auto_55458 - LOCATION
    )
    :vars
    (
      ?auto_55462 - TRUCK
      ?auto_55463 - LOCATION
      ?auto_55464 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55462 ?auto_55463 ) ( IN-CITY ?auto_55463 ?auto_55464 ) ( IN-CITY ?auto_55458 ?auto_55464 ) ( not ( = ?auto_55458 ?auto_55463 ) ) ( OBJ-AT ?auto_55460 ?auto_55458 ) ( not ( = ?auto_55460 ?auto_55459 ) ) ( OBJ-AT ?auto_55459 ?auto_55463 ) ( OBJ-AT ?auto_55461 ?auto_55458 ) ( not ( = ?auto_55459 ?auto_55461 ) ) ( not ( = ?auto_55460 ?auto_55461 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55460 ?auto_55459 ?auto_55458 )
      ( DELIVER-3PKG-VERIFY ?auto_55459 ?auto_55460 ?auto_55461 ?auto_55458 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55488 - OBJ
      ?auto_55489 - OBJ
      ?auto_55490 - OBJ
      ?auto_55491 - OBJ
      ?auto_55487 - LOCATION
    )
    :vars
    (
      ?auto_55492 - TRUCK
      ?auto_55493 - LOCATION
      ?auto_55494 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55492 ?auto_55493 ) ( IN-CITY ?auto_55493 ?auto_55494 ) ( IN-CITY ?auto_55487 ?auto_55494 ) ( not ( = ?auto_55487 ?auto_55493 ) ) ( OBJ-AT ?auto_55488 ?auto_55487 ) ( not ( = ?auto_55488 ?auto_55491 ) ) ( OBJ-AT ?auto_55491 ?auto_55493 ) ( OBJ-AT ?auto_55489 ?auto_55487 ) ( OBJ-AT ?auto_55490 ?auto_55487 ) ( not ( = ?auto_55488 ?auto_55489 ) ) ( not ( = ?auto_55488 ?auto_55490 ) ) ( not ( = ?auto_55489 ?auto_55490 ) ) ( not ( = ?auto_55489 ?auto_55491 ) ) ( not ( = ?auto_55490 ?auto_55491 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55488 ?auto_55491 ?auto_55487 )
      ( DELIVER-4PKG-VERIFY ?auto_55488 ?auto_55489 ?auto_55490 ?auto_55491 ?auto_55487 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55496 - OBJ
      ?auto_55497 - OBJ
      ?auto_55498 - OBJ
      ?auto_55499 - OBJ
      ?auto_55495 - LOCATION
    )
    :vars
    (
      ?auto_55500 - TRUCK
      ?auto_55501 - LOCATION
      ?auto_55502 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55500 ?auto_55501 ) ( IN-CITY ?auto_55501 ?auto_55502 ) ( IN-CITY ?auto_55495 ?auto_55502 ) ( not ( = ?auto_55495 ?auto_55501 ) ) ( OBJ-AT ?auto_55496 ?auto_55495 ) ( not ( = ?auto_55496 ?auto_55498 ) ) ( OBJ-AT ?auto_55498 ?auto_55501 ) ( OBJ-AT ?auto_55497 ?auto_55495 ) ( OBJ-AT ?auto_55499 ?auto_55495 ) ( not ( = ?auto_55496 ?auto_55497 ) ) ( not ( = ?auto_55496 ?auto_55499 ) ) ( not ( = ?auto_55497 ?auto_55498 ) ) ( not ( = ?auto_55497 ?auto_55499 ) ) ( not ( = ?auto_55498 ?auto_55499 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55496 ?auto_55498 ?auto_55495 )
      ( DELIVER-4PKG-VERIFY ?auto_55496 ?auto_55497 ?auto_55498 ?auto_55499 ?auto_55495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55512 - OBJ
      ?auto_55513 - OBJ
      ?auto_55514 - OBJ
      ?auto_55515 - OBJ
      ?auto_55511 - LOCATION
    )
    :vars
    (
      ?auto_55516 - TRUCK
      ?auto_55517 - LOCATION
      ?auto_55518 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55516 ?auto_55517 ) ( IN-CITY ?auto_55517 ?auto_55518 ) ( IN-CITY ?auto_55511 ?auto_55518 ) ( not ( = ?auto_55511 ?auto_55517 ) ) ( OBJ-AT ?auto_55514 ?auto_55511 ) ( not ( = ?auto_55514 ?auto_55513 ) ) ( OBJ-AT ?auto_55513 ?auto_55517 ) ( OBJ-AT ?auto_55512 ?auto_55511 ) ( OBJ-AT ?auto_55515 ?auto_55511 ) ( not ( = ?auto_55512 ?auto_55513 ) ) ( not ( = ?auto_55512 ?auto_55514 ) ) ( not ( = ?auto_55512 ?auto_55515 ) ) ( not ( = ?auto_55513 ?auto_55515 ) ) ( not ( = ?auto_55514 ?auto_55515 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55514 ?auto_55513 ?auto_55511 )
      ( DELIVER-4PKG-VERIFY ?auto_55512 ?auto_55513 ?auto_55514 ?auto_55515 ?auto_55511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55544 - OBJ
      ?auto_55545 - OBJ
      ?auto_55546 - OBJ
      ?auto_55547 - OBJ
      ?auto_55543 - LOCATION
    )
    :vars
    (
      ?auto_55548 - TRUCK
      ?auto_55549 - LOCATION
      ?auto_55550 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55548 ?auto_55549 ) ( IN-CITY ?auto_55549 ?auto_55550 ) ( IN-CITY ?auto_55543 ?auto_55550 ) ( not ( = ?auto_55543 ?auto_55549 ) ) ( OBJ-AT ?auto_55547 ?auto_55543 ) ( not ( = ?auto_55547 ?auto_55544 ) ) ( OBJ-AT ?auto_55544 ?auto_55549 ) ( OBJ-AT ?auto_55545 ?auto_55543 ) ( OBJ-AT ?auto_55546 ?auto_55543 ) ( not ( = ?auto_55544 ?auto_55545 ) ) ( not ( = ?auto_55544 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55546 ) ) ( not ( = ?auto_55545 ?auto_55547 ) ) ( not ( = ?auto_55546 ?auto_55547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55547 ?auto_55544 ?auto_55543 )
      ( DELIVER-4PKG-VERIFY ?auto_55544 ?auto_55545 ?auto_55546 ?auto_55547 ?auto_55543 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55609 - OBJ
      ?auto_55608 - LOCATION
    )
    :vars
    (
      ?auto_55611 - LOCATION
      ?auto_55613 - CITY
      ?auto_55612 - OBJ
      ?auto_55610 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55611 ?auto_55613 ) ( IN-CITY ?auto_55608 ?auto_55613 ) ( not ( = ?auto_55608 ?auto_55611 ) ) ( OBJ-AT ?auto_55612 ?auto_55608 ) ( not ( = ?auto_55612 ?auto_55609 ) ) ( OBJ-AT ?auto_55609 ?auto_55611 ) ( TRUCK-AT ?auto_55610 ?auto_55608 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55610 ?auto_55608 ?auto_55611 ?auto_55613 )
      ( DELIVER-2PKG ?auto_55612 ?auto_55609 ?auto_55608 )
      ( DELIVER-1PKG-VERIFY ?auto_55609 ?auto_55608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55615 - OBJ
      ?auto_55616 - OBJ
      ?auto_55614 - LOCATION
    )
    :vars
    (
      ?auto_55617 - LOCATION
      ?auto_55618 - CITY
      ?auto_55619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55617 ?auto_55618 ) ( IN-CITY ?auto_55614 ?auto_55618 ) ( not ( = ?auto_55614 ?auto_55617 ) ) ( OBJ-AT ?auto_55615 ?auto_55614 ) ( not ( = ?auto_55615 ?auto_55616 ) ) ( OBJ-AT ?auto_55616 ?auto_55617 ) ( TRUCK-AT ?auto_55619 ?auto_55614 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55616 ?auto_55614 )
      ( DELIVER-2PKG-VERIFY ?auto_55615 ?auto_55616 ?auto_55614 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55621 - OBJ
      ?auto_55622 - OBJ
      ?auto_55620 - LOCATION
    )
    :vars
    (
      ?auto_55624 - LOCATION
      ?auto_55623 - CITY
      ?auto_55625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55624 ?auto_55623 ) ( IN-CITY ?auto_55620 ?auto_55623 ) ( not ( = ?auto_55620 ?auto_55624 ) ) ( OBJ-AT ?auto_55622 ?auto_55620 ) ( not ( = ?auto_55622 ?auto_55621 ) ) ( OBJ-AT ?auto_55621 ?auto_55624 ) ( TRUCK-AT ?auto_55625 ?auto_55620 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55622 ?auto_55621 ?auto_55620 )
      ( DELIVER-2PKG-VERIFY ?auto_55621 ?auto_55622 ?auto_55620 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55634 - OBJ
      ?auto_55635 - OBJ
      ?auto_55636 - OBJ
      ?auto_55633 - LOCATION
    )
    :vars
    (
      ?auto_55638 - LOCATION
      ?auto_55637 - CITY
      ?auto_55639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55638 ?auto_55637 ) ( IN-CITY ?auto_55633 ?auto_55637 ) ( not ( = ?auto_55633 ?auto_55638 ) ) ( OBJ-AT ?auto_55634 ?auto_55633 ) ( not ( = ?auto_55634 ?auto_55636 ) ) ( OBJ-AT ?auto_55636 ?auto_55638 ) ( TRUCK-AT ?auto_55639 ?auto_55633 ) ( OBJ-AT ?auto_55635 ?auto_55633 ) ( not ( = ?auto_55634 ?auto_55635 ) ) ( not ( = ?auto_55635 ?auto_55636 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55634 ?auto_55636 ?auto_55633 )
      ( DELIVER-3PKG-VERIFY ?auto_55634 ?auto_55635 ?auto_55636 ?auto_55633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55641 - OBJ
      ?auto_55642 - OBJ
      ?auto_55643 - OBJ
      ?auto_55640 - LOCATION
    )
    :vars
    (
      ?auto_55645 - LOCATION
      ?auto_55644 - CITY
      ?auto_55646 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55645 ?auto_55644 ) ( IN-CITY ?auto_55640 ?auto_55644 ) ( not ( = ?auto_55640 ?auto_55645 ) ) ( OBJ-AT ?auto_55641 ?auto_55640 ) ( not ( = ?auto_55641 ?auto_55642 ) ) ( OBJ-AT ?auto_55642 ?auto_55645 ) ( TRUCK-AT ?auto_55646 ?auto_55640 ) ( OBJ-AT ?auto_55643 ?auto_55640 ) ( not ( = ?auto_55641 ?auto_55643 ) ) ( not ( = ?auto_55642 ?auto_55643 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55641 ?auto_55642 ?auto_55640 )
      ( DELIVER-3PKG-VERIFY ?auto_55641 ?auto_55642 ?auto_55643 ?auto_55640 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55655 - OBJ
      ?auto_55656 - OBJ
      ?auto_55657 - OBJ
      ?auto_55654 - LOCATION
    )
    :vars
    (
      ?auto_55659 - LOCATION
      ?auto_55658 - CITY
      ?auto_55660 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55659 ?auto_55658 ) ( IN-CITY ?auto_55654 ?auto_55658 ) ( not ( = ?auto_55654 ?auto_55659 ) ) ( OBJ-AT ?auto_55657 ?auto_55654 ) ( not ( = ?auto_55657 ?auto_55655 ) ) ( OBJ-AT ?auto_55655 ?auto_55659 ) ( TRUCK-AT ?auto_55660 ?auto_55654 ) ( OBJ-AT ?auto_55656 ?auto_55654 ) ( not ( = ?auto_55655 ?auto_55656 ) ) ( not ( = ?auto_55656 ?auto_55657 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55657 ?auto_55655 ?auto_55654 )
      ( DELIVER-3PKG-VERIFY ?auto_55655 ?auto_55656 ?auto_55657 ?auto_55654 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55684 - OBJ
      ?auto_55685 - OBJ
      ?auto_55686 - OBJ
      ?auto_55687 - OBJ
      ?auto_55683 - LOCATION
    )
    :vars
    (
      ?auto_55689 - LOCATION
      ?auto_55688 - CITY
      ?auto_55690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55689 ?auto_55688 ) ( IN-CITY ?auto_55683 ?auto_55688 ) ( not ( = ?auto_55683 ?auto_55689 ) ) ( OBJ-AT ?auto_55686 ?auto_55683 ) ( not ( = ?auto_55686 ?auto_55687 ) ) ( OBJ-AT ?auto_55687 ?auto_55689 ) ( TRUCK-AT ?auto_55690 ?auto_55683 ) ( OBJ-AT ?auto_55684 ?auto_55683 ) ( OBJ-AT ?auto_55685 ?auto_55683 ) ( not ( = ?auto_55684 ?auto_55685 ) ) ( not ( = ?auto_55684 ?auto_55686 ) ) ( not ( = ?auto_55684 ?auto_55687 ) ) ( not ( = ?auto_55685 ?auto_55686 ) ) ( not ( = ?auto_55685 ?auto_55687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55686 ?auto_55687 ?auto_55683 )
      ( DELIVER-4PKG-VERIFY ?auto_55684 ?auto_55685 ?auto_55686 ?auto_55687 ?auto_55683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55692 - OBJ
      ?auto_55693 - OBJ
      ?auto_55694 - OBJ
      ?auto_55695 - OBJ
      ?auto_55691 - LOCATION
    )
    :vars
    (
      ?auto_55697 - LOCATION
      ?auto_55696 - CITY
      ?auto_55698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55697 ?auto_55696 ) ( IN-CITY ?auto_55691 ?auto_55696 ) ( not ( = ?auto_55691 ?auto_55697 ) ) ( OBJ-AT ?auto_55692 ?auto_55691 ) ( not ( = ?auto_55692 ?auto_55694 ) ) ( OBJ-AT ?auto_55694 ?auto_55697 ) ( TRUCK-AT ?auto_55698 ?auto_55691 ) ( OBJ-AT ?auto_55693 ?auto_55691 ) ( OBJ-AT ?auto_55695 ?auto_55691 ) ( not ( = ?auto_55692 ?auto_55693 ) ) ( not ( = ?auto_55692 ?auto_55695 ) ) ( not ( = ?auto_55693 ?auto_55694 ) ) ( not ( = ?auto_55693 ?auto_55695 ) ) ( not ( = ?auto_55694 ?auto_55695 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55692 ?auto_55694 ?auto_55691 )
      ( DELIVER-4PKG-VERIFY ?auto_55692 ?auto_55693 ?auto_55694 ?auto_55695 ?auto_55691 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55708 - OBJ
      ?auto_55709 - OBJ
      ?auto_55710 - OBJ
      ?auto_55711 - OBJ
      ?auto_55707 - LOCATION
    )
    :vars
    (
      ?auto_55713 - LOCATION
      ?auto_55712 - CITY
      ?auto_55714 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55713 ?auto_55712 ) ( IN-CITY ?auto_55707 ?auto_55712 ) ( not ( = ?auto_55707 ?auto_55713 ) ) ( OBJ-AT ?auto_55711 ?auto_55707 ) ( not ( = ?auto_55711 ?auto_55709 ) ) ( OBJ-AT ?auto_55709 ?auto_55713 ) ( TRUCK-AT ?auto_55714 ?auto_55707 ) ( OBJ-AT ?auto_55708 ?auto_55707 ) ( OBJ-AT ?auto_55710 ?auto_55707 ) ( not ( = ?auto_55708 ?auto_55709 ) ) ( not ( = ?auto_55708 ?auto_55710 ) ) ( not ( = ?auto_55708 ?auto_55711 ) ) ( not ( = ?auto_55709 ?auto_55710 ) ) ( not ( = ?auto_55710 ?auto_55711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55711 ?auto_55709 ?auto_55707 )
      ( DELIVER-4PKG-VERIFY ?auto_55708 ?auto_55709 ?auto_55710 ?auto_55711 ?auto_55707 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55740 - OBJ
      ?auto_55741 - OBJ
      ?auto_55742 - OBJ
      ?auto_55743 - OBJ
      ?auto_55739 - LOCATION
    )
    :vars
    (
      ?auto_55745 - LOCATION
      ?auto_55744 - CITY
      ?auto_55746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55745 ?auto_55744 ) ( IN-CITY ?auto_55739 ?auto_55744 ) ( not ( = ?auto_55739 ?auto_55745 ) ) ( OBJ-AT ?auto_55742 ?auto_55739 ) ( not ( = ?auto_55742 ?auto_55740 ) ) ( OBJ-AT ?auto_55740 ?auto_55745 ) ( TRUCK-AT ?auto_55746 ?auto_55739 ) ( OBJ-AT ?auto_55741 ?auto_55739 ) ( OBJ-AT ?auto_55743 ?auto_55739 ) ( not ( = ?auto_55740 ?auto_55741 ) ) ( not ( = ?auto_55740 ?auto_55743 ) ) ( not ( = ?auto_55741 ?auto_55742 ) ) ( not ( = ?auto_55741 ?auto_55743 ) ) ( not ( = ?auto_55742 ?auto_55743 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55742 ?auto_55740 ?auto_55739 )
      ( DELIVER-4PKG-VERIFY ?auto_55740 ?auto_55741 ?auto_55742 ?auto_55743 ?auto_55739 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55805 - OBJ
      ?auto_55804 - LOCATION
    )
    :vars
    (
      ?auto_55807 - LOCATION
      ?auto_55806 - CITY
      ?auto_55809 - OBJ
      ?auto_55808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55807 ?auto_55806 ) ( IN-CITY ?auto_55804 ?auto_55806 ) ( not ( = ?auto_55804 ?auto_55807 ) ) ( not ( = ?auto_55809 ?auto_55805 ) ) ( OBJ-AT ?auto_55805 ?auto_55807 ) ( TRUCK-AT ?auto_55808 ?auto_55804 ) ( IN-TRUCK ?auto_55809 ?auto_55808 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55809 ?auto_55804 )
      ( DELIVER-2PKG ?auto_55809 ?auto_55805 ?auto_55804 )
      ( DELIVER-1PKG-VERIFY ?auto_55805 ?auto_55804 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55811 - OBJ
      ?auto_55812 - OBJ
      ?auto_55810 - LOCATION
    )
    :vars
    (
      ?auto_55814 - LOCATION
      ?auto_55815 - CITY
      ?auto_55813 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55814 ?auto_55815 ) ( IN-CITY ?auto_55810 ?auto_55815 ) ( not ( = ?auto_55810 ?auto_55814 ) ) ( not ( = ?auto_55811 ?auto_55812 ) ) ( OBJ-AT ?auto_55812 ?auto_55814 ) ( TRUCK-AT ?auto_55813 ?auto_55810 ) ( IN-TRUCK ?auto_55811 ?auto_55813 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55812 ?auto_55810 )
      ( DELIVER-2PKG-VERIFY ?auto_55811 ?auto_55812 ?auto_55810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55817 - OBJ
      ?auto_55818 - OBJ
      ?auto_55816 - LOCATION
    )
    :vars
    (
      ?auto_55819 - LOCATION
      ?auto_55820 - CITY
      ?auto_55821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55819 ?auto_55820 ) ( IN-CITY ?auto_55816 ?auto_55820 ) ( not ( = ?auto_55816 ?auto_55819 ) ) ( not ( = ?auto_55818 ?auto_55817 ) ) ( OBJ-AT ?auto_55817 ?auto_55819 ) ( TRUCK-AT ?auto_55821 ?auto_55816 ) ( IN-TRUCK ?auto_55818 ?auto_55821 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55818 ?auto_55817 ?auto_55816 )
      ( DELIVER-2PKG-VERIFY ?auto_55817 ?auto_55818 ?auto_55816 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56001 - OBJ
      ?auto_56000 - LOCATION
    )
    :vars
    (
      ?auto_56002 - LOCATION
      ?auto_56004 - CITY
      ?auto_56003 - OBJ
      ?auto_56005 - TRUCK
      ?auto_56006 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56002 ?auto_56004 ) ( IN-CITY ?auto_56000 ?auto_56004 ) ( not ( = ?auto_56000 ?auto_56002 ) ) ( not ( = ?auto_56003 ?auto_56001 ) ) ( OBJ-AT ?auto_56001 ?auto_56002 ) ( IN-TRUCK ?auto_56003 ?auto_56005 ) ( TRUCK-AT ?auto_56005 ?auto_56006 ) ( IN-CITY ?auto_56006 ?auto_56004 ) ( not ( = ?auto_56000 ?auto_56006 ) ) ( not ( = ?auto_56002 ?auto_56006 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56005 ?auto_56006 ?auto_56000 ?auto_56004 )
      ( DELIVER-2PKG ?auto_56003 ?auto_56001 ?auto_56000 )
      ( DELIVER-1PKG-VERIFY ?auto_56001 ?auto_56000 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56008 - OBJ
      ?auto_56009 - OBJ
      ?auto_56007 - LOCATION
    )
    :vars
    (
      ?auto_56011 - LOCATION
      ?auto_56013 - CITY
      ?auto_56010 - TRUCK
      ?auto_56012 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56011 ?auto_56013 ) ( IN-CITY ?auto_56007 ?auto_56013 ) ( not ( = ?auto_56007 ?auto_56011 ) ) ( not ( = ?auto_56008 ?auto_56009 ) ) ( OBJ-AT ?auto_56009 ?auto_56011 ) ( IN-TRUCK ?auto_56008 ?auto_56010 ) ( TRUCK-AT ?auto_56010 ?auto_56012 ) ( IN-CITY ?auto_56012 ?auto_56013 ) ( not ( = ?auto_56007 ?auto_56012 ) ) ( not ( = ?auto_56011 ?auto_56012 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56009 ?auto_56007 )
      ( DELIVER-2PKG-VERIFY ?auto_56008 ?auto_56009 ?auto_56007 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56015 - OBJ
      ?auto_56016 - OBJ
      ?auto_56014 - LOCATION
    )
    :vars
    (
      ?auto_56018 - LOCATION
      ?auto_56017 - CITY
      ?auto_56019 - TRUCK
      ?auto_56020 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56018 ?auto_56017 ) ( IN-CITY ?auto_56014 ?auto_56017 ) ( not ( = ?auto_56014 ?auto_56018 ) ) ( not ( = ?auto_56016 ?auto_56015 ) ) ( OBJ-AT ?auto_56015 ?auto_56018 ) ( IN-TRUCK ?auto_56016 ?auto_56019 ) ( TRUCK-AT ?auto_56019 ?auto_56020 ) ( IN-CITY ?auto_56020 ?auto_56017 ) ( not ( = ?auto_56014 ?auto_56020 ) ) ( not ( = ?auto_56018 ?auto_56020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56016 ?auto_56015 ?auto_56014 )
      ( DELIVER-2PKG-VERIFY ?auto_56015 ?auto_56016 ?auto_56014 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56223 - OBJ
      ?auto_56222 - LOCATION
    )
    :vars
    (
      ?auto_56225 - LOCATION
      ?auto_56224 - CITY
      ?auto_56228 - OBJ
      ?auto_56226 - TRUCK
      ?auto_56227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56225 ?auto_56224 ) ( IN-CITY ?auto_56222 ?auto_56224 ) ( not ( = ?auto_56222 ?auto_56225 ) ) ( not ( = ?auto_56228 ?auto_56223 ) ) ( OBJ-AT ?auto_56223 ?auto_56225 ) ( TRUCK-AT ?auto_56226 ?auto_56227 ) ( IN-CITY ?auto_56227 ?auto_56224 ) ( not ( = ?auto_56222 ?auto_56227 ) ) ( not ( = ?auto_56225 ?auto_56227 ) ) ( OBJ-AT ?auto_56228 ?auto_56227 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_56228 ?auto_56226 ?auto_56227 )
      ( DELIVER-2PKG ?auto_56228 ?auto_56223 ?auto_56222 )
      ( DELIVER-1PKG-VERIFY ?auto_56223 ?auto_56222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56230 - OBJ
      ?auto_56231 - OBJ
      ?auto_56229 - LOCATION
    )
    :vars
    (
      ?auto_56235 - LOCATION
      ?auto_56233 - CITY
      ?auto_56232 - TRUCK
      ?auto_56234 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56235 ?auto_56233 ) ( IN-CITY ?auto_56229 ?auto_56233 ) ( not ( = ?auto_56229 ?auto_56235 ) ) ( not ( = ?auto_56230 ?auto_56231 ) ) ( OBJ-AT ?auto_56231 ?auto_56235 ) ( TRUCK-AT ?auto_56232 ?auto_56234 ) ( IN-CITY ?auto_56234 ?auto_56233 ) ( not ( = ?auto_56229 ?auto_56234 ) ) ( not ( = ?auto_56235 ?auto_56234 ) ) ( OBJ-AT ?auto_56230 ?auto_56234 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56231 ?auto_56229 )
      ( DELIVER-2PKG-VERIFY ?auto_56230 ?auto_56231 ?auto_56229 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56237 - OBJ
      ?auto_56238 - OBJ
      ?auto_56236 - LOCATION
    )
    :vars
    (
      ?auto_56240 - LOCATION
      ?auto_56241 - CITY
      ?auto_56239 - TRUCK
      ?auto_56242 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_56240 ?auto_56241 ) ( IN-CITY ?auto_56236 ?auto_56241 ) ( not ( = ?auto_56236 ?auto_56240 ) ) ( not ( = ?auto_56238 ?auto_56237 ) ) ( OBJ-AT ?auto_56237 ?auto_56240 ) ( TRUCK-AT ?auto_56239 ?auto_56242 ) ( IN-CITY ?auto_56242 ?auto_56241 ) ( not ( = ?auto_56236 ?auto_56242 ) ) ( not ( = ?auto_56240 ?auto_56242 ) ) ( OBJ-AT ?auto_56238 ?auto_56242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56238 ?auto_56237 ?auto_56236 )
      ( DELIVER-2PKG-VERIFY ?auto_56237 ?auto_56238 ?auto_56236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57582 - OBJ
      ?auto_57583 - OBJ
      ?auto_57584 - OBJ
      ?auto_57581 - LOCATION
    )
    :vars
    (
      ?auto_57587 - TRUCK
      ?auto_57585 - LOCATION
      ?auto_57586 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57584 ?auto_57587 ) ( TRUCK-AT ?auto_57587 ?auto_57585 ) ( IN-CITY ?auto_57585 ?auto_57586 ) ( IN-CITY ?auto_57581 ?auto_57586 ) ( not ( = ?auto_57581 ?auto_57585 ) ) ( OBJ-AT ?auto_57583 ?auto_57581 ) ( not ( = ?auto_57583 ?auto_57584 ) ) ( OBJ-AT ?auto_57582 ?auto_57581 ) ( not ( = ?auto_57582 ?auto_57583 ) ) ( not ( = ?auto_57582 ?auto_57584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57583 ?auto_57584 ?auto_57581 )
      ( DELIVER-3PKG-VERIFY ?auto_57582 ?auto_57583 ?auto_57584 ?auto_57581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57615 - OBJ
      ?auto_57616 - OBJ
      ?auto_57617 - OBJ
      ?auto_57614 - LOCATION
    )
    :vars
    (
      ?auto_57621 - TRUCK
      ?auto_57618 - LOCATION
      ?auto_57620 - CITY
      ?auto_57619 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57617 ?auto_57621 ) ( TRUCK-AT ?auto_57621 ?auto_57618 ) ( IN-CITY ?auto_57618 ?auto_57620 ) ( IN-CITY ?auto_57614 ?auto_57620 ) ( not ( = ?auto_57614 ?auto_57618 ) ) ( OBJ-AT ?auto_57619 ?auto_57614 ) ( not ( = ?auto_57619 ?auto_57617 ) ) ( OBJ-AT ?auto_57615 ?auto_57614 ) ( OBJ-AT ?auto_57616 ?auto_57614 ) ( not ( = ?auto_57615 ?auto_57616 ) ) ( not ( = ?auto_57615 ?auto_57617 ) ) ( not ( = ?auto_57615 ?auto_57619 ) ) ( not ( = ?auto_57616 ?auto_57617 ) ) ( not ( = ?auto_57616 ?auto_57619 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57619 ?auto_57617 ?auto_57614 )
      ( DELIVER-3PKG-VERIFY ?auto_57615 ?auto_57616 ?auto_57617 ?auto_57614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57627 - OBJ
      ?auto_57628 - OBJ
      ?auto_57629 - OBJ
      ?auto_57626 - LOCATION
    )
    :vars
    (
      ?auto_57633 - TRUCK
      ?auto_57630 - LOCATION
      ?auto_57632 - CITY
      ?auto_57631 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57628 ?auto_57633 ) ( TRUCK-AT ?auto_57633 ?auto_57630 ) ( IN-CITY ?auto_57630 ?auto_57632 ) ( IN-CITY ?auto_57626 ?auto_57632 ) ( not ( = ?auto_57626 ?auto_57630 ) ) ( OBJ-AT ?auto_57631 ?auto_57626 ) ( not ( = ?auto_57631 ?auto_57628 ) ) ( OBJ-AT ?auto_57627 ?auto_57626 ) ( OBJ-AT ?auto_57629 ?auto_57626 ) ( not ( = ?auto_57627 ?auto_57628 ) ) ( not ( = ?auto_57627 ?auto_57629 ) ) ( not ( = ?auto_57627 ?auto_57631 ) ) ( not ( = ?auto_57628 ?auto_57629 ) ) ( not ( = ?auto_57629 ?auto_57631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57631 ?auto_57628 ?auto_57626 )
      ( DELIVER-3PKG-VERIFY ?auto_57627 ?auto_57628 ?auto_57629 ?auto_57626 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57643 - OBJ
      ?auto_57644 - OBJ
      ?auto_57645 - OBJ
      ?auto_57642 - LOCATION
    )
    :vars
    (
      ?auto_57648 - TRUCK
      ?auto_57646 - LOCATION
      ?auto_57647 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57643 ?auto_57648 ) ( TRUCK-AT ?auto_57648 ?auto_57646 ) ( IN-CITY ?auto_57646 ?auto_57647 ) ( IN-CITY ?auto_57642 ?auto_57647 ) ( not ( = ?auto_57642 ?auto_57646 ) ) ( OBJ-AT ?auto_57645 ?auto_57642 ) ( not ( = ?auto_57645 ?auto_57643 ) ) ( OBJ-AT ?auto_57644 ?auto_57642 ) ( not ( = ?auto_57643 ?auto_57644 ) ) ( not ( = ?auto_57644 ?auto_57645 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57645 ?auto_57643 ?auto_57642 )
      ( DELIVER-3PKG-VERIFY ?auto_57643 ?auto_57644 ?auto_57645 ?auto_57642 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57665 - OBJ
      ?auto_57666 - OBJ
      ?auto_57667 - OBJ
      ?auto_57664 - LOCATION
    )
    :vars
    (
      ?auto_57671 - TRUCK
      ?auto_57668 - LOCATION
      ?auto_57670 - CITY
      ?auto_57669 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57665 ?auto_57671 ) ( TRUCK-AT ?auto_57671 ?auto_57668 ) ( IN-CITY ?auto_57668 ?auto_57670 ) ( IN-CITY ?auto_57664 ?auto_57670 ) ( not ( = ?auto_57664 ?auto_57668 ) ) ( OBJ-AT ?auto_57669 ?auto_57664 ) ( not ( = ?auto_57669 ?auto_57665 ) ) ( OBJ-AT ?auto_57666 ?auto_57664 ) ( OBJ-AT ?auto_57667 ?auto_57664 ) ( not ( = ?auto_57665 ?auto_57666 ) ) ( not ( = ?auto_57665 ?auto_57667 ) ) ( not ( = ?auto_57666 ?auto_57667 ) ) ( not ( = ?auto_57666 ?auto_57669 ) ) ( not ( = ?auto_57667 ?auto_57669 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57669 ?auto_57665 ?auto_57664 )
      ( DELIVER-3PKG-VERIFY ?auto_57665 ?auto_57666 ?auto_57667 ?auto_57664 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57704 - OBJ
      ?auto_57705 - OBJ
      ?auto_57706 - OBJ
      ?auto_57707 - OBJ
      ?auto_57703 - LOCATION
    )
    :vars
    (
      ?auto_57710 - TRUCK
      ?auto_57708 - LOCATION
      ?auto_57709 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57707 ?auto_57710 ) ( TRUCK-AT ?auto_57710 ?auto_57708 ) ( IN-CITY ?auto_57708 ?auto_57709 ) ( IN-CITY ?auto_57703 ?auto_57709 ) ( not ( = ?auto_57703 ?auto_57708 ) ) ( OBJ-AT ?auto_57704 ?auto_57703 ) ( not ( = ?auto_57704 ?auto_57707 ) ) ( OBJ-AT ?auto_57705 ?auto_57703 ) ( OBJ-AT ?auto_57706 ?auto_57703 ) ( not ( = ?auto_57704 ?auto_57705 ) ) ( not ( = ?auto_57704 ?auto_57706 ) ) ( not ( = ?auto_57705 ?auto_57706 ) ) ( not ( = ?auto_57705 ?auto_57707 ) ) ( not ( = ?auto_57706 ?auto_57707 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57704 ?auto_57707 ?auto_57703 )
      ( DELIVER-4PKG-VERIFY ?auto_57704 ?auto_57705 ?auto_57706 ?auto_57707 ?auto_57703 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57720 - OBJ
      ?auto_57721 - OBJ
      ?auto_57722 - OBJ
      ?auto_57723 - OBJ
      ?auto_57719 - LOCATION
    )
    :vars
    (
      ?auto_57726 - TRUCK
      ?auto_57724 - LOCATION
      ?auto_57725 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57722 ?auto_57726 ) ( TRUCK-AT ?auto_57726 ?auto_57724 ) ( IN-CITY ?auto_57724 ?auto_57725 ) ( IN-CITY ?auto_57719 ?auto_57725 ) ( not ( = ?auto_57719 ?auto_57724 ) ) ( OBJ-AT ?auto_57721 ?auto_57719 ) ( not ( = ?auto_57721 ?auto_57722 ) ) ( OBJ-AT ?auto_57720 ?auto_57719 ) ( OBJ-AT ?auto_57723 ?auto_57719 ) ( not ( = ?auto_57720 ?auto_57721 ) ) ( not ( = ?auto_57720 ?auto_57722 ) ) ( not ( = ?auto_57720 ?auto_57723 ) ) ( not ( = ?auto_57721 ?auto_57723 ) ) ( not ( = ?auto_57722 ?auto_57723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57721 ?auto_57722 ?auto_57719 )
      ( DELIVER-4PKG-VERIFY ?auto_57720 ?auto_57721 ?auto_57722 ?auto_57723 ?auto_57719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57760 - OBJ
      ?auto_57761 - OBJ
      ?auto_57762 - OBJ
      ?auto_57763 - OBJ
      ?auto_57759 - LOCATION
    )
    :vars
    (
      ?auto_57766 - TRUCK
      ?auto_57764 - LOCATION
      ?auto_57765 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57762 ?auto_57766 ) ( TRUCK-AT ?auto_57766 ?auto_57764 ) ( IN-CITY ?auto_57764 ?auto_57765 ) ( IN-CITY ?auto_57759 ?auto_57765 ) ( not ( = ?auto_57759 ?auto_57764 ) ) ( OBJ-AT ?auto_57763 ?auto_57759 ) ( not ( = ?auto_57763 ?auto_57762 ) ) ( OBJ-AT ?auto_57760 ?auto_57759 ) ( OBJ-AT ?auto_57761 ?auto_57759 ) ( not ( = ?auto_57760 ?auto_57761 ) ) ( not ( = ?auto_57760 ?auto_57762 ) ) ( not ( = ?auto_57760 ?auto_57763 ) ) ( not ( = ?auto_57761 ?auto_57762 ) ) ( not ( = ?auto_57761 ?auto_57763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57763 ?auto_57762 ?auto_57759 )
      ( DELIVER-4PKG-VERIFY ?auto_57760 ?auto_57761 ?auto_57762 ?auto_57763 ?auto_57759 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57792 - OBJ
      ?auto_57793 - OBJ
      ?auto_57794 - OBJ
      ?auto_57795 - OBJ
      ?auto_57791 - LOCATION
    )
    :vars
    (
      ?auto_57798 - TRUCK
      ?auto_57796 - LOCATION
      ?auto_57797 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57793 ?auto_57798 ) ( TRUCK-AT ?auto_57798 ?auto_57796 ) ( IN-CITY ?auto_57796 ?auto_57797 ) ( IN-CITY ?auto_57791 ?auto_57797 ) ( not ( = ?auto_57791 ?auto_57796 ) ) ( OBJ-AT ?auto_57792 ?auto_57791 ) ( not ( = ?auto_57792 ?auto_57793 ) ) ( OBJ-AT ?auto_57794 ?auto_57791 ) ( OBJ-AT ?auto_57795 ?auto_57791 ) ( not ( = ?auto_57792 ?auto_57794 ) ) ( not ( = ?auto_57792 ?auto_57795 ) ) ( not ( = ?auto_57793 ?auto_57794 ) ) ( not ( = ?auto_57793 ?auto_57795 ) ) ( not ( = ?auto_57794 ?auto_57795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57792 ?auto_57793 ?auto_57791 )
      ( DELIVER-4PKG-VERIFY ?auto_57792 ?auto_57793 ?auto_57794 ?auto_57795 ?auto_57791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57896 - OBJ
      ?auto_57897 - OBJ
      ?auto_57898 - OBJ
      ?auto_57899 - OBJ
      ?auto_57895 - LOCATION
    )
    :vars
    (
      ?auto_57902 - TRUCK
      ?auto_57900 - LOCATION
      ?auto_57901 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57899 ?auto_57902 ) ( TRUCK-AT ?auto_57902 ?auto_57900 ) ( IN-CITY ?auto_57900 ?auto_57901 ) ( IN-CITY ?auto_57895 ?auto_57901 ) ( not ( = ?auto_57895 ?auto_57900 ) ) ( OBJ-AT ?auto_57898 ?auto_57895 ) ( not ( = ?auto_57898 ?auto_57899 ) ) ( OBJ-AT ?auto_57896 ?auto_57895 ) ( OBJ-AT ?auto_57897 ?auto_57895 ) ( not ( = ?auto_57896 ?auto_57897 ) ) ( not ( = ?auto_57896 ?auto_57898 ) ) ( not ( = ?auto_57896 ?auto_57899 ) ) ( not ( = ?auto_57897 ?auto_57898 ) ) ( not ( = ?auto_57897 ?auto_57899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57898 ?auto_57899 ?auto_57895 )
      ( DELIVER-4PKG-VERIFY ?auto_57896 ?auto_57897 ?auto_57898 ?auto_57899 ?auto_57895 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57904 - OBJ
      ?auto_57905 - OBJ
      ?auto_57906 - OBJ
      ?auto_57907 - OBJ
      ?auto_57903 - LOCATION
    )
    :vars
    (
      ?auto_57911 - TRUCK
      ?auto_57908 - LOCATION
      ?auto_57910 - CITY
      ?auto_57909 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57907 ?auto_57911 ) ( TRUCK-AT ?auto_57911 ?auto_57908 ) ( IN-CITY ?auto_57908 ?auto_57910 ) ( IN-CITY ?auto_57903 ?auto_57910 ) ( not ( = ?auto_57903 ?auto_57908 ) ) ( OBJ-AT ?auto_57909 ?auto_57903 ) ( not ( = ?auto_57909 ?auto_57907 ) ) ( OBJ-AT ?auto_57904 ?auto_57903 ) ( OBJ-AT ?auto_57905 ?auto_57903 ) ( OBJ-AT ?auto_57906 ?auto_57903 ) ( not ( = ?auto_57904 ?auto_57905 ) ) ( not ( = ?auto_57904 ?auto_57906 ) ) ( not ( = ?auto_57904 ?auto_57907 ) ) ( not ( = ?auto_57904 ?auto_57909 ) ) ( not ( = ?auto_57905 ?auto_57906 ) ) ( not ( = ?auto_57905 ?auto_57907 ) ) ( not ( = ?auto_57905 ?auto_57909 ) ) ( not ( = ?auto_57906 ?auto_57907 ) ) ( not ( = ?auto_57906 ?auto_57909 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57909 ?auto_57907 ?auto_57903 )
      ( DELIVER-4PKG-VERIFY ?auto_57904 ?auto_57905 ?auto_57906 ?auto_57907 ?auto_57903 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57921 - OBJ
      ?auto_57922 - OBJ
      ?auto_57923 - OBJ
      ?auto_57924 - OBJ
      ?auto_57920 - LOCATION
    )
    :vars
    (
      ?auto_57928 - TRUCK
      ?auto_57925 - LOCATION
      ?auto_57927 - CITY
      ?auto_57926 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57923 ?auto_57928 ) ( TRUCK-AT ?auto_57928 ?auto_57925 ) ( IN-CITY ?auto_57925 ?auto_57927 ) ( IN-CITY ?auto_57920 ?auto_57927 ) ( not ( = ?auto_57920 ?auto_57925 ) ) ( OBJ-AT ?auto_57926 ?auto_57920 ) ( not ( = ?auto_57926 ?auto_57923 ) ) ( OBJ-AT ?auto_57921 ?auto_57920 ) ( OBJ-AT ?auto_57922 ?auto_57920 ) ( OBJ-AT ?auto_57924 ?auto_57920 ) ( not ( = ?auto_57921 ?auto_57922 ) ) ( not ( = ?auto_57921 ?auto_57923 ) ) ( not ( = ?auto_57921 ?auto_57924 ) ) ( not ( = ?auto_57921 ?auto_57926 ) ) ( not ( = ?auto_57922 ?auto_57923 ) ) ( not ( = ?auto_57922 ?auto_57924 ) ) ( not ( = ?auto_57922 ?auto_57926 ) ) ( not ( = ?auto_57923 ?auto_57924 ) ) ( not ( = ?auto_57924 ?auto_57926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57926 ?auto_57923 ?auto_57920 )
      ( DELIVER-4PKG-VERIFY ?auto_57921 ?auto_57922 ?auto_57923 ?auto_57924 ?auto_57920 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57939 - OBJ
      ?auto_57940 - OBJ
      ?auto_57941 - OBJ
      ?auto_57942 - OBJ
      ?auto_57938 - LOCATION
    )
    :vars
    (
      ?auto_57945 - TRUCK
      ?auto_57943 - LOCATION
      ?auto_57944 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57940 ?auto_57945 ) ( TRUCK-AT ?auto_57945 ?auto_57943 ) ( IN-CITY ?auto_57943 ?auto_57944 ) ( IN-CITY ?auto_57938 ?auto_57944 ) ( not ( = ?auto_57938 ?auto_57943 ) ) ( OBJ-AT ?auto_57941 ?auto_57938 ) ( not ( = ?auto_57941 ?auto_57940 ) ) ( OBJ-AT ?auto_57939 ?auto_57938 ) ( OBJ-AT ?auto_57942 ?auto_57938 ) ( not ( = ?auto_57939 ?auto_57940 ) ) ( not ( = ?auto_57939 ?auto_57941 ) ) ( not ( = ?auto_57939 ?auto_57942 ) ) ( not ( = ?auto_57940 ?auto_57942 ) ) ( not ( = ?auto_57941 ?auto_57942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57941 ?auto_57940 ?auto_57938 )
      ( DELIVER-4PKG-VERIFY ?auto_57939 ?auto_57940 ?auto_57941 ?auto_57942 ?auto_57938 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_57971 - OBJ
      ?auto_57972 - OBJ
      ?auto_57973 - OBJ
      ?auto_57974 - OBJ
      ?auto_57970 - LOCATION
    )
    :vars
    (
      ?auto_57978 - TRUCK
      ?auto_57975 - LOCATION
      ?auto_57977 - CITY
      ?auto_57976 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57972 ?auto_57978 ) ( TRUCK-AT ?auto_57978 ?auto_57975 ) ( IN-CITY ?auto_57975 ?auto_57977 ) ( IN-CITY ?auto_57970 ?auto_57977 ) ( not ( = ?auto_57970 ?auto_57975 ) ) ( OBJ-AT ?auto_57976 ?auto_57970 ) ( not ( = ?auto_57976 ?auto_57972 ) ) ( OBJ-AT ?auto_57971 ?auto_57970 ) ( OBJ-AT ?auto_57973 ?auto_57970 ) ( OBJ-AT ?auto_57974 ?auto_57970 ) ( not ( = ?auto_57971 ?auto_57972 ) ) ( not ( = ?auto_57971 ?auto_57973 ) ) ( not ( = ?auto_57971 ?auto_57974 ) ) ( not ( = ?auto_57971 ?auto_57976 ) ) ( not ( = ?auto_57972 ?auto_57973 ) ) ( not ( = ?auto_57972 ?auto_57974 ) ) ( not ( = ?auto_57973 ?auto_57974 ) ) ( not ( = ?auto_57973 ?auto_57976 ) ) ( not ( = ?auto_57974 ?auto_57976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57976 ?auto_57972 ?auto_57970 )
      ( DELIVER-4PKG-VERIFY ?auto_57971 ?auto_57972 ?auto_57973 ?auto_57974 ?auto_57970 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58015 - OBJ
      ?auto_58016 - OBJ
      ?auto_58017 - OBJ
      ?auto_58018 - OBJ
      ?auto_58014 - LOCATION
    )
    :vars
    (
      ?auto_58021 - TRUCK
      ?auto_58019 - LOCATION
      ?auto_58020 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58015 ?auto_58021 ) ( TRUCK-AT ?auto_58021 ?auto_58019 ) ( IN-CITY ?auto_58019 ?auto_58020 ) ( IN-CITY ?auto_58014 ?auto_58020 ) ( not ( = ?auto_58014 ?auto_58019 ) ) ( OBJ-AT ?auto_58017 ?auto_58014 ) ( not ( = ?auto_58017 ?auto_58015 ) ) ( OBJ-AT ?auto_58016 ?auto_58014 ) ( OBJ-AT ?auto_58018 ?auto_58014 ) ( not ( = ?auto_58015 ?auto_58016 ) ) ( not ( = ?auto_58015 ?auto_58018 ) ) ( not ( = ?auto_58016 ?auto_58017 ) ) ( not ( = ?auto_58016 ?auto_58018 ) ) ( not ( = ?auto_58017 ?auto_58018 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58017 ?auto_58015 ?auto_58014 )
      ( DELIVER-4PKG-VERIFY ?auto_58015 ?auto_58016 ?auto_58017 ?auto_58018 ?auto_58014 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58111 - OBJ
      ?auto_58112 - OBJ
      ?auto_58113 - OBJ
      ?auto_58114 - OBJ
      ?auto_58110 - LOCATION
    )
    :vars
    (
      ?auto_58117 - TRUCK
      ?auto_58115 - LOCATION
      ?auto_58116 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58111 ?auto_58117 ) ( TRUCK-AT ?auto_58117 ?auto_58115 ) ( IN-CITY ?auto_58115 ?auto_58116 ) ( IN-CITY ?auto_58110 ?auto_58116 ) ( not ( = ?auto_58110 ?auto_58115 ) ) ( OBJ-AT ?auto_58114 ?auto_58110 ) ( not ( = ?auto_58114 ?auto_58111 ) ) ( OBJ-AT ?auto_58112 ?auto_58110 ) ( OBJ-AT ?auto_58113 ?auto_58110 ) ( not ( = ?auto_58111 ?auto_58112 ) ) ( not ( = ?auto_58111 ?auto_58113 ) ) ( not ( = ?auto_58112 ?auto_58113 ) ) ( not ( = ?auto_58112 ?auto_58114 ) ) ( not ( = ?auto_58113 ?auto_58114 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58114 ?auto_58111 ?auto_58110 )
      ( DELIVER-4PKG-VERIFY ?auto_58111 ?auto_58112 ?auto_58113 ?auto_58114 ?auto_58110 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58119 - OBJ
      ?auto_58120 - OBJ
      ?auto_58121 - OBJ
      ?auto_58122 - OBJ
      ?auto_58118 - LOCATION
    )
    :vars
    (
      ?auto_58126 - TRUCK
      ?auto_58123 - LOCATION
      ?auto_58125 - CITY
      ?auto_58124 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58119 ?auto_58126 ) ( TRUCK-AT ?auto_58126 ?auto_58123 ) ( IN-CITY ?auto_58123 ?auto_58125 ) ( IN-CITY ?auto_58118 ?auto_58125 ) ( not ( = ?auto_58118 ?auto_58123 ) ) ( OBJ-AT ?auto_58124 ?auto_58118 ) ( not ( = ?auto_58124 ?auto_58119 ) ) ( OBJ-AT ?auto_58120 ?auto_58118 ) ( OBJ-AT ?auto_58121 ?auto_58118 ) ( OBJ-AT ?auto_58122 ?auto_58118 ) ( not ( = ?auto_58119 ?auto_58120 ) ) ( not ( = ?auto_58119 ?auto_58121 ) ) ( not ( = ?auto_58119 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58121 ) ) ( not ( = ?auto_58120 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58124 ) ) ( not ( = ?auto_58121 ?auto_58122 ) ) ( not ( = ?auto_58121 ?auto_58124 ) ) ( not ( = ?auto_58122 ?auto_58124 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58124 ?auto_58119 ?auto_58118 )
      ( DELIVER-4PKG-VERIFY ?auto_58119 ?auto_58120 ?auto_58121 ?auto_58122 ?auto_58118 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58270 - OBJ
      ?auto_58271 - OBJ
      ?auto_58272 - OBJ
      ?auto_58269 - LOCATION
    )
    :vars
    (
      ?auto_58273 - TRUCK
      ?auto_58275 - LOCATION
      ?auto_58274 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58273 ?auto_58275 ) ( IN-CITY ?auto_58275 ?auto_58274 ) ( IN-CITY ?auto_58269 ?auto_58274 ) ( not ( = ?auto_58269 ?auto_58275 ) ) ( OBJ-AT ?auto_58271 ?auto_58269 ) ( not ( = ?auto_58271 ?auto_58272 ) ) ( OBJ-AT ?auto_58272 ?auto_58275 ) ( OBJ-AT ?auto_58270 ?auto_58269 ) ( not ( = ?auto_58270 ?auto_58271 ) ) ( not ( = ?auto_58270 ?auto_58272 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58271 ?auto_58272 ?auto_58269 )
      ( DELIVER-3PKG-VERIFY ?auto_58270 ?auto_58271 ?auto_58272 ?auto_58269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58303 - OBJ
      ?auto_58304 - OBJ
      ?auto_58305 - OBJ
      ?auto_58302 - LOCATION
    )
    :vars
    (
      ?auto_58307 - TRUCK
      ?auto_58309 - LOCATION
      ?auto_58308 - CITY
      ?auto_58306 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58307 ?auto_58309 ) ( IN-CITY ?auto_58309 ?auto_58308 ) ( IN-CITY ?auto_58302 ?auto_58308 ) ( not ( = ?auto_58302 ?auto_58309 ) ) ( OBJ-AT ?auto_58306 ?auto_58302 ) ( not ( = ?auto_58306 ?auto_58305 ) ) ( OBJ-AT ?auto_58305 ?auto_58309 ) ( OBJ-AT ?auto_58303 ?auto_58302 ) ( OBJ-AT ?auto_58304 ?auto_58302 ) ( not ( = ?auto_58303 ?auto_58304 ) ) ( not ( = ?auto_58303 ?auto_58305 ) ) ( not ( = ?auto_58303 ?auto_58306 ) ) ( not ( = ?auto_58304 ?auto_58305 ) ) ( not ( = ?auto_58304 ?auto_58306 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58306 ?auto_58305 ?auto_58302 )
      ( DELIVER-3PKG-VERIFY ?auto_58303 ?auto_58304 ?auto_58305 ?auto_58302 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58315 - OBJ
      ?auto_58316 - OBJ
      ?auto_58317 - OBJ
      ?auto_58314 - LOCATION
    )
    :vars
    (
      ?auto_58319 - TRUCK
      ?auto_58321 - LOCATION
      ?auto_58320 - CITY
      ?auto_58318 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58319 ?auto_58321 ) ( IN-CITY ?auto_58321 ?auto_58320 ) ( IN-CITY ?auto_58314 ?auto_58320 ) ( not ( = ?auto_58314 ?auto_58321 ) ) ( OBJ-AT ?auto_58318 ?auto_58314 ) ( not ( = ?auto_58318 ?auto_58316 ) ) ( OBJ-AT ?auto_58316 ?auto_58321 ) ( OBJ-AT ?auto_58315 ?auto_58314 ) ( OBJ-AT ?auto_58317 ?auto_58314 ) ( not ( = ?auto_58315 ?auto_58316 ) ) ( not ( = ?auto_58315 ?auto_58317 ) ) ( not ( = ?auto_58315 ?auto_58318 ) ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( not ( = ?auto_58317 ?auto_58318 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58318 ?auto_58316 ?auto_58314 )
      ( DELIVER-3PKG-VERIFY ?auto_58315 ?auto_58316 ?auto_58317 ?auto_58314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58353 - OBJ
      ?auto_58354 - OBJ
      ?auto_58355 - OBJ
      ?auto_58352 - LOCATION
    )
    :vars
    (
      ?auto_58357 - TRUCK
      ?auto_58359 - LOCATION
      ?auto_58358 - CITY
      ?auto_58356 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58357 ?auto_58359 ) ( IN-CITY ?auto_58359 ?auto_58358 ) ( IN-CITY ?auto_58352 ?auto_58358 ) ( not ( = ?auto_58352 ?auto_58359 ) ) ( OBJ-AT ?auto_58356 ?auto_58352 ) ( not ( = ?auto_58356 ?auto_58353 ) ) ( OBJ-AT ?auto_58353 ?auto_58359 ) ( OBJ-AT ?auto_58354 ?auto_58352 ) ( OBJ-AT ?auto_58355 ?auto_58352 ) ( not ( = ?auto_58353 ?auto_58354 ) ) ( not ( = ?auto_58353 ?auto_58355 ) ) ( not ( = ?auto_58354 ?auto_58355 ) ) ( not ( = ?auto_58354 ?auto_58356 ) ) ( not ( = ?auto_58355 ?auto_58356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58356 ?auto_58353 ?auto_58352 )
      ( DELIVER-3PKG-VERIFY ?auto_58353 ?auto_58354 ?auto_58355 ?auto_58352 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58392 - OBJ
      ?auto_58393 - OBJ
      ?auto_58394 - OBJ
      ?auto_58395 - OBJ
      ?auto_58391 - LOCATION
    )
    :vars
    (
      ?auto_58396 - TRUCK
      ?auto_58398 - LOCATION
      ?auto_58397 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58396 ?auto_58398 ) ( IN-CITY ?auto_58398 ?auto_58397 ) ( IN-CITY ?auto_58391 ?auto_58397 ) ( not ( = ?auto_58391 ?auto_58398 ) ) ( OBJ-AT ?auto_58393 ?auto_58391 ) ( not ( = ?auto_58393 ?auto_58395 ) ) ( OBJ-AT ?auto_58395 ?auto_58398 ) ( OBJ-AT ?auto_58392 ?auto_58391 ) ( OBJ-AT ?auto_58394 ?auto_58391 ) ( not ( = ?auto_58392 ?auto_58393 ) ) ( not ( = ?auto_58392 ?auto_58394 ) ) ( not ( = ?auto_58392 ?auto_58395 ) ) ( not ( = ?auto_58393 ?auto_58394 ) ) ( not ( = ?auto_58394 ?auto_58395 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58393 ?auto_58395 ?auto_58391 )
      ( DELIVER-4PKG-VERIFY ?auto_58392 ?auto_58393 ?auto_58394 ?auto_58395 ?auto_58391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58480 - OBJ
      ?auto_58481 - OBJ
      ?auto_58482 - OBJ
      ?auto_58483 - OBJ
      ?auto_58479 - LOCATION
    )
    :vars
    (
      ?auto_58484 - TRUCK
      ?auto_58486 - LOCATION
      ?auto_58485 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58484 ?auto_58486 ) ( IN-CITY ?auto_58486 ?auto_58485 ) ( IN-CITY ?auto_58479 ?auto_58485 ) ( not ( = ?auto_58479 ?auto_58486 ) ) ( OBJ-AT ?auto_58480 ?auto_58479 ) ( not ( = ?auto_58480 ?auto_58481 ) ) ( OBJ-AT ?auto_58481 ?auto_58486 ) ( OBJ-AT ?auto_58482 ?auto_58479 ) ( OBJ-AT ?auto_58483 ?auto_58479 ) ( not ( = ?auto_58480 ?auto_58482 ) ) ( not ( = ?auto_58480 ?auto_58483 ) ) ( not ( = ?auto_58481 ?auto_58482 ) ) ( not ( = ?auto_58481 ?auto_58483 ) ) ( not ( = ?auto_58482 ?auto_58483 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58480 ?auto_58481 ?auto_58479 )
      ( DELIVER-4PKG-VERIFY ?auto_58480 ?auto_58481 ?auto_58482 ?auto_58483 ?auto_58479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58560 - OBJ
      ?auto_58561 - OBJ
      ?auto_58562 - OBJ
      ?auto_58563 - OBJ
      ?auto_58559 - LOCATION
    )
    :vars
    (
      ?auto_58564 - TRUCK
      ?auto_58566 - LOCATION
      ?auto_58565 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58564 ?auto_58566 ) ( IN-CITY ?auto_58566 ?auto_58565 ) ( IN-CITY ?auto_58559 ?auto_58565 ) ( not ( = ?auto_58559 ?auto_58566 ) ) ( OBJ-AT ?auto_58561 ?auto_58559 ) ( not ( = ?auto_58561 ?auto_58562 ) ) ( OBJ-AT ?auto_58562 ?auto_58566 ) ( OBJ-AT ?auto_58560 ?auto_58559 ) ( OBJ-AT ?auto_58563 ?auto_58559 ) ( not ( = ?auto_58560 ?auto_58561 ) ) ( not ( = ?auto_58560 ?auto_58562 ) ) ( not ( = ?auto_58560 ?auto_58563 ) ) ( not ( = ?auto_58561 ?auto_58563 ) ) ( not ( = ?auto_58562 ?auto_58563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58561 ?auto_58562 ?auto_58559 )
      ( DELIVER-4PKG-VERIFY ?auto_58560 ?auto_58561 ?auto_58562 ?auto_58563 ?auto_58559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58584 - OBJ
      ?auto_58585 - OBJ
      ?auto_58586 - OBJ
      ?auto_58587 - OBJ
      ?auto_58583 - LOCATION
    )
    :vars
    (
      ?auto_58588 - TRUCK
      ?auto_58590 - LOCATION
      ?auto_58589 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58588 ?auto_58590 ) ( IN-CITY ?auto_58590 ?auto_58589 ) ( IN-CITY ?auto_58583 ?auto_58589 ) ( not ( = ?auto_58583 ?auto_58590 ) ) ( OBJ-AT ?auto_58586 ?auto_58583 ) ( not ( = ?auto_58586 ?auto_58587 ) ) ( OBJ-AT ?auto_58587 ?auto_58590 ) ( OBJ-AT ?auto_58584 ?auto_58583 ) ( OBJ-AT ?auto_58585 ?auto_58583 ) ( not ( = ?auto_58584 ?auto_58585 ) ) ( not ( = ?auto_58584 ?auto_58586 ) ) ( not ( = ?auto_58584 ?auto_58587 ) ) ( not ( = ?auto_58585 ?auto_58586 ) ) ( not ( = ?auto_58585 ?auto_58587 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58586 ?auto_58587 ?auto_58583 )
      ( DELIVER-4PKG-VERIFY ?auto_58584 ?auto_58585 ?auto_58586 ?auto_58587 ?auto_58583 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58592 - OBJ
      ?auto_58593 - OBJ
      ?auto_58594 - OBJ
      ?auto_58595 - OBJ
      ?auto_58591 - LOCATION
    )
    :vars
    (
      ?auto_58597 - TRUCK
      ?auto_58599 - LOCATION
      ?auto_58598 - CITY
      ?auto_58596 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58597 ?auto_58599 ) ( IN-CITY ?auto_58599 ?auto_58598 ) ( IN-CITY ?auto_58591 ?auto_58598 ) ( not ( = ?auto_58591 ?auto_58599 ) ) ( OBJ-AT ?auto_58596 ?auto_58591 ) ( not ( = ?auto_58596 ?auto_58595 ) ) ( OBJ-AT ?auto_58595 ?auto_58599 ) ( OBJ-AT ?auto_58592 ?auto_58591 ) ( OBJ-AT ?auto_58593 ?auto_58591 ) ( OBJ-AT ?auto_58594 ?auto_58591 ) ( not ( = ?auto_58592 ?auto_58593 ) ) ( not ( = ?auto_58592 ?auto_58594 ) ) ( not ( = ?auto_58592 ?auto_58595 ) ) ( not ( = ?auto_58592 ?auto_58596 ) ) ( not ( = ?auto_58593 ?auto_58594 ) ) ( not ( = ?auto_58593 ?auto_58595 ) ) ( not ( = ?auto_58593 ?auto_58596 ) ) ( not ( = ?auto_58594 ?auto_58595 ) ) ( not ( = ?auto_58594 ?auto_58596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58596 ?auto_58595 ?auto_58591 )
      ( DELIVER-4PKG-VERIFY ?auto_58592 ?auto_58593 ?auto_58594 ?auto_58595 ?auto_58591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58601 - OBJ
      ?auto_58602 - OBJ
      ?auto_58603 - OBJ
      ?auto_58604 - OBJ
      ?auto_58600 - LOCATION
    )
    :vars
    (
      ?auto_58605 - TRUCK
      ?auto_58607 - LOCATION
      ?auto_58606 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58605 ?auto_58607 ) ( IN-CITY ?auto_58607 ?auto_58606 ) ( IN-CITY ?auto_58600 ?auto_58606 ) ( not ( = ?auto_58600 ?auto_58607 ) ) ( OBJ-AT ?auto_58604 ?auto_58600 ) ( not ( = ?auto_58604 ?auto_58603 ) ) ( OBJ-AT ?auto_58603 ?auto_58607 ) ( OBJ-AT ?auto_58601 ?auto_58600 ) ( OBJ-AT ?auto_58602 ?auto_58600 ) ( not ( = ?auto_58601 ?auto_58602 ) ) ( not ( = ?auto_58601 ?auto_58603 ) ) ( not ( = ?auto_58601 ?auto_58604 ) ) ( not ( = ?auto_58602 ?auto_58603 ) ) ( not ( = ?auto_58602 ?auto_58604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58604 ?auto_58603 ?auto_58600 )
      ( DELIVER-4PKG-VERIFY ?auto_58601 ?auto_58602 ?auto_58603 ?auto_58604 ?auto_58600 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58609 - OBJ
      ?auto_58610 - OBJ
      ?auto_58611 - OBJ
      ?auto_58612 - OBJ
      ?auto_58608 - LOCATION
    )
    :vars
    (
      ?auto_58614 - TRUCK
      ?auto_58616 - LOCATION
      ?auto_58615 - CITY
      ?auto_58613 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58614 ?auto_58616 ) ( IN-CITY ?auto_58616 ?auto_58615 ) ( IN-CITY ?auto_58608 ?auto_58615 ) ( not ( = ?auto_58608 ?auto_58616 ) ) ( OBJ-AT ?auto_58613 ?auto_58608 ) ( not ( = ?auto_58613 ?auto_58611 ) ) ( OBJ-AT ?auto_58611 ?auto_58616 ) ( OBJ-AT ?auto_58609 ?auto_58608 ) ( OBJ-AT ?auto_58610 ?auto_58608 ) ( OBJ-AT ?auto_58612 ?auto_58608 ) ( not ( = ?auto_58609 ?auto_58610 ) ) ( not ( = ?auto_58609 ?auto_58611 ) ) ( not ( = ?auto_58609 ?auto_58612 ) ) ( not ( = ?auto_58609 ?auto_58613 ) ) ( not ( = ?auto_58610 ?auto_58611 ) ) ( not ( = ?auto_58610 ?auto_58612 ) ) ( not ( = ?auto_58610 ?auto_58613 ) ) ( not ( = ?auto_58611 ?auto_58612 ) ) ( not ( = ?auto_58612 ?auto_58613 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58613 ?auto_58611 ?auto_58608 )
      ( DELIVER-4PKG-VERIFY ?auto_58609 ?auto_58610 ?auto_58611 ?auto_58612 ?auto_58608 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58627 - OBJ
      ?auto_58628 - OBJ
      ?auto_58629 - OBJ
      ?auto_58630 - OBJ
      ?auto_58626 - LOCATION
    )
    :vars
    (
      ?auto_58631 - TRUCK
      ?auto_58633 - LOCATION
      ?auto_58632 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58631 ?auto_58633 ) ( IN-CITY ?auto_58633 ?auto_58632 ) ( IN-CITY ?auto_58626 ?auto_58632 ) ( not ( = ?auto_58626 ?auto_58633 ) ) ( OBJ-AT ?auto_58630 ?auto_58626 ) ( not ( = ?auto_58630 ?auto_58628 ) ) ( OBJ-AT ?auto_58628 ?auto_58633 ) ( OBJ-AT ?auto_58627 ?auto_58626 ) ( OBJ-AT ?auto_58629 ?auto_58626 ) ( not ( = ?auto_58627 ?auto_58628 ) ) ( not ( = ?auto_58627 ?auto_58629 ) ) ( not ( = ?auto_58627 ?auto_58630 ) ) ( not ( = ?auto_58628 ?auto_58629 ) ) ( not ( = ?auto_58629 ?auto_58630 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58630 ?auto_58628 ?auto_58626 )
      ( DELIVER-4PKG-VERIFY ?auto_58627 ?auto_58628 ?auto_58629 ?auto_58630 ?auto_58626 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58659 - OBJ
      ?auto_58660 - OBJ
      ?auto_58661 - OBJ
      ?auto_58662 - OBJ
      ?auto_58658 - LOCATION
    )
    :vars
    (
      ?auto_58664 - TRUCK
      ?auto_58666 - LOCATION
      ?auto_58665 - CITY
      ?auto_58663 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58664 ?auto_58666 ) ( IN-CITY ?auto_58666 ?auto_58665 ) ( IN-CITY ?auto_58658 ?auto_58665 ) ( not ( = ?auto_58658 ?auto_58666 ) ) ( OBJ-AT ?auto_58663 ?auto_58658 ) ( not ( = ?auto_58663 ?auto_58660 ) ) ( OBJ-AT ?auto_58660 ?auto_58666 ) ( OBJ-AT ?auto_58659 ?auto_58658 ) ( OBJ-AT ?auto_58661 ?auto_58658 ) ( OBJ-AT ?auto_58662 ?auto_58658 ) ( not ( = ?auto_58659 ?auto_58660 ) ) ( not ( = ?auto_58659 ?auto_58661 ) ) ( not ( = ?auto_58659 ?auto_58662 ) ) ( not ( = ?auto_58659 ?auto_58663 ) ) ( not ( = ?auto_58660 ?auto_58661 ) ) ( not ( = ?auto_58660 ?auto_58662 ) ) ( not ( = ?auto_58661 ?auto_58662 ) ) ( not ( = ?auto_58661 ?auto_58663 ) ) ( not ( = ?auto_58662 ?auto_58663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58663 ?auto_58660 ?auto_58658 )
      ( DELIVER-4PKG-VERIFY ?auto_58659 ?auto_58660 ?auto_58661 ?auto_58662 ?auto_58658 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58703 - OBJ
      ?auto_58704 - OBJ
      ?auto_58705 - OBJ
      ?auto_58706 - OBJ
      ?auto_58702 - LOCATION
    )
    :vars
    (
      ?auto_58707 - TRUCK
      ?auto_58709 - LOCATION
      ?auto_58708 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58707 ?auto_58709 ) ( IN-CITY ?auto_58709 ?auto_58708 ) ( IN-CITY ?auto_58702 ?auto_58708 ) ( not ( = ?auto_58702 ?auto_58709 ) ) ( OBJ-AT ?auto_58705 ?auto_58702 ) ( not ( = ?auto_58705 ?auto_58703 ) ) ( OBJ-AT ?auto_58703 ?auto_58709 ) ( OBJ-AT ?auto_58704 ?auto_58702 ) ( OBJ-AT ?auto_58706 ?auto_58702 ) ( not ( = ?auto_58703 ?auto_58704 ) ) ( not ( = ?auto_58703 ?auto_58706 ) ) ( not ( = ?auto_58704 ?auto_58705 ) ) ( not ( = ?auto_58704 ?auto_58706 ) ) ( not ( = ?auto_58705 ?auto_58706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58705 ?auto_58703 ?auto_58702 )
      ( DELIVER-4PKG-VERIFY ?auto_58703 ?auto_58704 ?auto_58705 ?auto_58706 ?auto_58702 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58727 - OBJ
      ?auto_58728 - OBJ
      ?auto_58729 - OBJ
      ?auto_58730 - OBJ
      ?auto_58726 - LOCATION
    )
    :vars
    (
      ?auto_58731 - TRUCK
      ?auto_58733 - LOCATION
      ?auto_58732 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58731 ?auto_58733 ) ( IN-CITY ?auto_58733 ?auto_58732 ) ( IN-CITY ?auto_58726 ?auto_58732 ) ( not ( = ?auto_58726 ?auto_58733 ) ) ( OBJ-AT ?auto_58728 ?auto_58726 ) ( not ( = ?auto_58728 ?auto_58727 ) ) ( OBJ-AT ?auto_58727 ?auto_58733 ) ( OBJ-AT ?auto_58729 ?auto_58726 ) ( OBJ-AT ?auto_58730 ?auto_58726 ) ( not ( = ?auto_58727 ?auto_58729 ) ) ( not ( = ?auto_58727 ?auto_58730 ) ) ( not ( = ?auto_58728 ?auto_58729 ) ) ( not ( = ?auto_58728 ?auto_58730 ) ) ( not ( = ?auto_58729 ?auto_58730 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58728 ?auto_58727 ?auto_58726 )
      ( DELIVER-4PKG-VERIFY ?auto_58727 ?auto_58728 ?auto_58729 ?auto_58730 ?auto_58726 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58807 - OBJ
      ?auto_58808 - OBJ
      ?auto_58809 - OBJ
      ?auto_58810 - OBJ
      ?auto_58806 - LOCATION
    )
    :vars
    (
      ?auto_58812 - TRUCK
      ?auto_58814 - LOCATION
      ?auto_58813 - CITY
      ?auto_58811 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58812 ?auto_58814 ) ( IN-CITY ?auto_58814 ?auto_58813 ) ( IN-CITY ?auto_58806 ?auto_58813 ) ( not ( = ?auto_58806 ?auto_58814 ) ) ( OBJ-AT ?auto_58811 ?auto_58806 ) ( not ( = ?auto_58811 ?auto_58807 ) ) ( OBJ-AT ?auto_58807 ?auto_58814 ) ( OBJ-AT ?auto_58808 ?auto_58806 ) ( OBJ-AT ?auto_58809 ?auto_58806 ) ( OBJ-AT ?auto_58810 ?auto_58806 ) ( not ( = ?auto_58807 ?auto_58808 ) ) ( not ( = ?auto_58807 ?auto_58809 ) ) ( not ( = ?auto_58807 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58809 ) ) ( not ( = ?auto_58808 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58811 ) ) ( not ( = ?auto_58809 ?auto_58810 ) ) ( not ( = ?auto_58809 ?auto_58811 ) ) ( not ( = ?auto_58810 ?auto_58811 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58811 ?auto_58807 ?auto_58806 )
      ( DELIVER-4PKG-VERIFY ?auto_58807 ?auto_58808 ?auto_58809 ?auto_58810 ?auto_58806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58991 - OBJ
      ?auto_58992 - OBJ
      ?auto_58993 - OBJ
      ?auto_58990 - LOCATION
    )
    :vars
    (
      ?auto_58997 - LOCATION
      ?auto_58995 - CITY
      ?auto_58994 - OBJ
      ?auto_58996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58997 ?auto_58995 ) ( IN-CITY ?auto_58990 ?auto_58995 ) ( not ( = ?auto_58990 ?auto_58997 ) ) ( OBJ-AT ?auto_58994 ?auto_58990 ) ( not ( = ?auto_58994 ?auto_58993 ) ) ( OBJ-AT ?auto_58993 ?auto_58997 ) ( TRUCK-AT ?auto_58996 ?auto_58990 ) ( OBJ-AT ?auto_58991 ?auto_58990 ) ( OBJ-AT ?auto_58992 ?auto_58990 ) ( not ( = ?auto_58991 ?auto_58992 ) ) ( not ( = ?auto_58991 ?auto_58993 ) ) ( not ( = ?auto_58991 ?auto_58994 ) ) ( not ( = ?auto_58992 ?auto_58993 ) ) ( not ( = ?auto_58992 ?auto_58994 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58994 ?auto_58993 ?auto_58990 )
      ( DELIVER-3PKG-VERIFY ?auto_58991 ?auto_58992 ?auto_58993 ?auto_58990 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59003 - OBJ
      ?auto_59004 - OBJ
      ?auto_59005 - OBJ
      ?auto_59002 - LOCATION
    )
    :vars
    (
      ?auto_59009 - LOCATION
      ?auto_59007 - CITY
      ?auto_59006 - OBJ
      ?auto_59008 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59009 ?auto_59007 ) ( IN-CITY ?auto_59002 ?auto_59007 ) ( not ( = ?auto_59002 ?auto_59009 ) ) ( OBJ-AT ?auto_59006 ?auto_59002 ) ( not ( = ?auto_59006 ?auto_59004 ) ) ( OBJ-AT ?auto_59004 ?auto_59009 ) ( TRUCK-AT ?auto_59008 ?auto_59002 ) ( OBJ-AT ?auto_59003 ?auto_59002 ) ( OBJ-AT ?auto_59005 ?auto_59002 ) ( not ( = ?auto_59003 ?auto_59004 ) ) ( not ( = ?auto_59003 ?auto_59005 ) ) ( not ( = ?auto_59003 ?auto_59006 ) ) ( not ( = ?auto_59004 ?auto_59005 ) ) ( not ( = ?auto_59005 ?auto_59006 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59006 ?auto_59004 ?auto_59002 )
      ( DELIVER-3PKG-VERIFY ?auto_59003 ?auto_59004 ?auto_59005 ?auto_59002 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59019 - OBJ
      ?auto_59020 - OBJ
      ?auto_59021 - OBJ
      ?auto_59018 - LOCATION
    )
    :vars
    (
      ?auto_59024 - LOCATION
      ?auto_59022 - CITY
      ?auto_59023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59024 ?auto_59022 ) ( IN-CITY ?auto_59018 ?auto_59022 ) ( not ( = ?auto_59018 ?auto_59024 ) ) ( OBJ-AT ?auto_59020 ?auto_59018 ) ( not ( = ?auto_59020 ?auto_59019 ) ) ( OBJ-AT ?auto_59019 ?auto_59024 ) ( TRUCK-AT ?auto_59023 ?auto_59018 ) ( OBJ-AT ?auto_59021 ?auto_59018 ) ( not ( = ?auto_59019 ?auto_59021 ) ) ( not ( = ?auto_59020 ?auto_59021 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59020 ?auto_59019 ?auto_59018 )
      ( DELIVER-3PKG-VERIFY ?auto_59019 ?auto_59020 ?auto_59021 ?auto_59018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59041 - OBJ
      ?auto_59042 - OBJ
      ?auto_59043 - OBJ
      ?auto_59040 - LOCATION
    )
    :vars
    (
      ?auto_59047 - LOCATION
      ?auto_59045 - CITY
      ?auto_59044 - OBJ
      ?auto_59046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59047 ?auto_59045 ) ( IN-CITY ?auto_59040 ?auto_59045 ) ( not ( = ?auto_59040 ?auto_59047 ) ) ( OBJ-AT ?auto_59044 ?auto_59040 ) ( not ( = ?auto_59044 ?auto_59041 ) ) ( OBJ-AT ?auto_59041 ?auto_59047 ) ( TRUCK-AT ?auto_59046 ?auto_59040 ) ( OBJ-AT ?auto_59042 ?auto_59040 ) ( OBJ-AT ?auto_59043 ?auto_59040 ) ( not ( = ?auto_59041 ?auto_59042 ) ) ( not ( = ?auto_59041 ?auto_59043 ) ) ( not ( = ?auto_59042 ?auto_59043 ) ) ( not ( = ?auto_59042 ?auto_59044 ) ) ( not ( = ?auto_59043 ?auto_59044 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59044 ?auto_59041 ?auto_59040 )
      ( DELIVER-3PKG-VERIFY ?auto_59041 ?auto_59042 ?auto_59043 ?auto_59040 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59080 - OBJ
      ?auto_59081 - OBJ
      ?auto_59082 - OBJ
      ?auto_59083 - OBJ
      ?auto_59079 - LOCATION
    )
    :vars
    (
      ?auto_59086 - LOCATION
      ?auto_59084 - CITY
      ?auto_59085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59086 ?auto_59084 ) ( IN-CITY ?auto_59079 ?auto_59084 ) ( not ( = ?auto_59079 ?auto_59086 ) ) ( OBJ-AT ?auto_59081 ?auto_59079 ) ( not ( = ?auto_59081 ?auto_59083 ) ) ( OBJ-AT ?auto_59083 ?auto_59086 ) ( TRUCK-AT ?auto_59085 ?auto_59079 ) ( OBJ-AT ?auto_59080 ?auto_59079 ) ( OBJ-AT ?auto_59082 ?auto_59079 ) ( not ( = ?auto_59080 ?auto_59081 ) ) ( not ( = ?auto_59080 ?auto_59082 ) ) ( not ( = ?auto_59080 ?auto_59083 ) ) ( not ( = ?auto_59081 ?auto_59082 ) ) ( not ( = ?auto_59082 ?auto_59083 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59081 ?auto_59083 ?auto_59079 )
      ( DELIVER-4PKG-VERIFY ?auto_59080 ?auto_59081 ?auto_59082 ?auto_59083 ?auto_59079 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59088 - OBJ
      ?auto_59089 - OBJ
      ?auto_59090 - OBJ
      ?auto_59091 - OBJ
      ?auto_59087 - LOCATION
    )
    :vars
    (
      ?auto_59094 - LOCATION
      ?auto_59092 - CITY
      ?auto_59093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59094 ?auto_59092 ) ( IN-CITY ?auto_59087 ?auto_59092 ) ( not ( = ?auto_59087 ?auto_59094 ) ) ( OBJ-AT ?auto_59088 ?auto_59087 ) ( not ( = ?auto_59088 ?auto_59091 ) ) ( OBJ-AT ?auto_59091 ?auto_59094 ) ( TRUCK-AT ?auto_59093 ?auto_59087 ) ( OBJ-AT ?auto_59089 ?auto_59087 ) ( OBJ-AT ?auto_59090 ?auto_59087 ) ( not ( = ?auto_59088 ?auto_59089 ) ) ( not ( = ?auto_59088 ?auto_59090 ) ) ( not ( = ?auto_59089 ?auto_59090 ) ) ( not ( = ?auto_59089 ?auto_59091 ) ) ( not ( = ?auto_59090 ?auto_59091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59088 ?auto_59091 ?auto_59087 )
      ( DELIVER-4PKG-VERIFY ?auto_59088 ?auto_59089 ?auto_59090 ?auto_59091 ?auto_59087 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59096 - OBJ
      ?auto_59097 - OBJ
      ?auto_59098 - OBJ
      ?auto_59099 - OBJ
      ?auto_59095 - LOCATION
    )
    :vars
    (
      ?auto_59102 - LOCATION
      ?auto_59100 - CITY
      ?auto_59101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59102 ?auto_59100 ) ( IN-CITY ?auto_59095 ?auto_59100 ) ( not ( = ?auto_59095 ?auto_59102 ) ) ( OBJ-AT ?auto_59099 ?auto_59095 ) ( not ( = ?auto_59099 ?auto_59098 ) ) ( OBJ-AT ?auto_59098 ?auto_59102 ) ( TRUCK-AT ?auto_59101 ?auto_59095 ) ( OBJ-AT ?auto_59096 ?auto_59095 ) ( OBJ-AT ?auto_59097 ?auto_59095 ) ( not ( = ?auto_59096 ?auto_59097 ) ) ( not ( = ?auto_59096 ?auto_59098 ) ) ( not ( = ?auto_59096 ?auto_59099 ) ) ( not ( = ?auto_59097 ?auto_59098 ) ) ( not ( = ?auto_59097 ?auto_59099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59099 ?auto_59098 ?auto_59095 )
      ( DELIVER-4PKG-VERIFY ?auto_59096 ?auto_59097 ?auto_59098 ?auto_59099 ?auto_59095 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59160 - OBJ
      ?auto_59161 - OBJ
      ?auto_59162 - OBJ
      ?auto_59163 - OBJ
      ?auto_59159 - LOCATION
    )
    :vars
    (
      ?auto_59166 - LOCATION
      ?auto_59164 - CITY
      ?auto_59165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59166 ?auto_59164 ) ( IN-CITY ?auto_59159 ?auto_59164 ) ( not ( = ?auto_59159 ?auto_59166 ) ) ( OBJ-AT ?auto_59162 ?auto_59159 ) ( not ( = ?auto_59162 ?auto_59161 ) ) ( OBJ-AT ?auto_59161 ?auto_59166 ) ( TRUCK-AT ?auto_59165 ?auto_59159 ) ( OBJ-AT ?auto_59160 ?auto_59159 ) ( OBJ-AT ?auto_59163 ?auto_59159 ) ( not ( = ?auto_59160 ?auto_59161 ) ) ( not ( = ?auto_59160 ?auto_59162 ) ) ( not ( = ?auto_59160 ?auto_59163 ) ) ( not ( = ?auto_59161 ?auto_59163 ) ) ( not ( = ?auto_59162 ?auto_59163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59162 ?auto_59161 ?auto_59159 )
      ( DELIVER-4PKG-VERIFY ?auto_59160 ?auto_59161 ?auto_59162 ?auto_59163 ?auto_59159 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59184 - OBJ
      ?auto_59185 - OBJ
      ?auto_59186 - OBJ
      ?auto_59187 - OBJ
      ?auto_59183 - LOCATION
    )
    :vars
    (
      ?auto_59190 - LOCATION
      ?auto_59188 - CITY
      ?auto_59189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59190 ?auto_59188 ) ( IN-CITY ?auto_59183 ?auto_59188 ) ( not ( = ?auto_59183 ?auto_59190 ) ) ( OBJ-AT ?auto_59184 ?auto_59183 ) ( not ( = ?auto_59184 ?auto_59185 ) ) ( OBJ-AT ?auto_59185 ?auto_59190 ) ( TRUCK-AT ?auto_59189 ?auto_59183 ) ( OBJ-AT ?auto_59186 ?auto_59183 ) ( OBJ-AT ?auto_59187 ?auto_59183 ) ( not ( = ?auto_59184 ?auto_59186 ) ) ( not ( = ?auto_59184 ?auto_59187 ) ) ( not ( = ?auto_59185 ?auto_59186 ) ) ( not ( = ?auto_59185 ?auto_59187 ) ) ( not ( = ?auto_59186 ?auto_59187 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59184 ?auto_59185 ?auto_59183 )
      ( DELIVER-4PKG-VERIFY ?auto_59184 ?auto_59185 ?auto_59186 ?auto_59187 ?auto_59183 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59248 - OBJ
      ?auto_59249 - OBJ
      ?auto_59250 - OBJ
      ?auto_59251 - OBJ
      ?auto_59247 - LOCATION
    )
    :vars
    (
      ?auto_59254 - LOCATION
      ?auto_59252 - CITY
      ?auto_59253 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59254 ?auto_59252 ) ( IN-CITY ?auto_59247 ?auto_59252 ) ( not ( = ?auto_59247 ?auto_59254 ) ) ( OBJ-AT ?auto_59249 ?auto_59247 ) ( not ( = ?auto_59249 ?auto_59250 ) ) ( OBJ-AT ?auto_59250 ?auto_59254 ) ( TRUCK-AT ?auto_59253 ?auto_59247 ) ( OBJ-AT ?auto_59248 ?auto_59247 ) ( OBJ-AT ?auto_59251 ?auto_59247 ) ( not ( = ?auto_59248 ?auto_59249 ) ) ( not ( = ?auto_59248 ?auto_59250 ) ) ( not ( = ?auto_59248 ?auto_59251 ) ) ( not ( = ?auto_59249 ?auto_59251 ) ) ( not ( = ?auto_59250 ?auto_59251 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59249 ?auto_59250 ?auto_59247 )
      ( DELIVER-4PKG-VERIFY ?auto_59248 ?auto_59249 ?auto_59250 ?auto_59251 ?auto_59247 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59280 - OBJ
      ?auto_59281 - OBJ
      ?auto_59282 - OBJ
      ?auto_59283 - OBJ
      ?auto_59279 - LOCATION
    )
    :vars
    (
      ?auto_59287 - LOCATION
      ?auto_59285 - CITY
      ?auto_59284 - OBJ
      ?auto_59286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59287 ?auto_59285 ) ( IN-CITY ?auto_59279 ?auto_59285 ) ( not ( = ?auto_59279 ?auto_59287 ) ) ( OBJ-AT ?auto_59284 ?auto_59279 ) ( not ( = ?auto_59284 ?auto_59283 ) ) ( OBJ-AT ?auto_59283 ?auto_59287 ) ( TRUCK-AT ?auto_59286 ?auto_59279 ) ( OBJ-AT ?auto_59280 ?auto_59279 ) ( OBJ-AT ?auto_59281 ?auto_59279 ) ( OBJ-AT ?auto_59282 ?auto_59279 ) ( not ( = ?auto_59280 ?auto_59281 ) ) ( not ( = ?auto_59280 ?auto_59282 ) ) ( not ( = ?auto_59280 ?auto_59283 ) ) ( not ( = ?auto_59280 ?auto_59284 ) ) ( not ( = ?auto_59281 ?auto_59282 ) ) ( not ( = ?auto_59281 ?auto_59283 ) ) ( not ( = ?auto_59281 ?auto_59284 ) ) ( not ( = ?auto_59282 ?auto_59283 ) ) ( not ( = ?auto_59282 ?auto_59284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59284 ?auto_59283 ?auto_59279 )
      ( DELIVER-4PKG-VERIFY ?auto_59280 ?auto_59281 ?auto_59282 ?auto_59283 ?auto_59279 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59297 - OBJ
      ?auto_59298 - OBJ
      ?auto_59299 - OBJ
      ?auto_59300 - OBJ
      ?auto_59296 - LOCATION
    )
    :vars
    (
      ?auto_59304 - LOCATION
      ?auto_59302 - CITY
      ?auto_59301 - OBJ
      ?auto_59303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59304 ?auto_59302 ) ( IN-CITY ?auto_59296 ?auto_59302 ) ( not ( = ?auto_59296 ?auto_59304 ) ) ( OBJ-AT ?auto_59301 ?auto_59296 ) ( not ( = ?auto_59301 ?auto_59299 ) ) ( OBJ-AT ?auto_59299 ?auto_59304 ) ( TRUCK-AT ?auto_59303 ?auto_59296 ) ( OBJ-AT ?auto_59297 ?auto_59296 ) ( OBJ-AT ?auto_59298 ?auto_59296 ) ( OBJ-AT ?auto_59300 ?auto_59296 ) ( not ( = ?auto_59297 ?auto_59298 ) ) ( not ( = ?auto_59297 ?auto_59299 ) ) ( not ( = ?auto_59297 ?auto_59300 ) ) ( not ( = ?auto_59297 ?auto_59301 ) ) ( not ( = ?auto_59298 ?auto_59299 ) ) ( not ( = ?auto_59298 ?auto_59300 ) ) ( not ( = ?auto_59298 ?auto_59301 ) ) ( not ( = ?auto_59299 ?auto_59300 ) ) ( not ( = ?auto_59300 ?auto_59301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59301 ?auto_59299 ?auto_59296 )
      ( DELIVER-4PKG-VERIFY ?auto_59297 ?auto_59298 ?auto_59299 ?auto_59300 ?auto_59296 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59347 - OBJ
      ?auto_59348 - OBJ
      ?auto_59349 - OBJ
      ?auto_59350 - OBJ
      ?auto_59346 - LOCATION
    )
    :vars
    (
      ?auto_59354 - LOCATION
      ?auto_59352 - CITY
      ?auto_59351 - OBJ
      ?auto_59353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59354 ?auto_59352 ) ( IN-CITY ?auto_59346 ?auto_59352 ) ( not ( = ?auto_59346 ?auto_59354 ) ) ( OBJ-AT ?auto_59351 ?auto_59346 ) ( not ( = ?auto_59351 ?auto_59348 ) ) ( OBJ-AT ?auto_59348 ?auto_59354 ) ( TRUCK-AT ?auto_59353 ?auto_59346 ) ( OBJ-AT ?auto_59347 ?auto_59346 ) ( OBJ-AT ?auto_59349 ?auto_59346 ) ( OBJ-AT ?auto_59350 ?auto_59346 ) ( not ( = ?auto_59347 ?auto_59348 ) ) ( not ( = ?auto_59347 ?auto_59349 ) ) ( not ( = ?auto_59347 ?auto_59350 ) ) ( not ( = ?auto_59347 ?auto_59351 ) ) ( not ( = ?auto_59348 ?auto_59349 ) ) ( not ( = ?auto_59348 ?auto_59350 ) ) ( not ( = ?auto_59349 ?auto_59350 ) ) ( not ( = ?auto_59349 ?auto_59351 ) ) ( not ( = ?auto_59350 ?auto_59351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59351 ?auto_59348 ?auto_59346 )
      ( DELIVER-4PKG-VERIFY ?auto_59347 ?auto_59348 ?auto_59349 ?auto_59350 ?auto_59346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59399 - OBJ
      ?auto_59400 - OBJ
      ?auto_59401 - OBJ
      ?auto_59402 - OBJ
      ?auto_59398 - LOCATION
    )
    :vars
    (
      ?auto_59405 - LOCATION
      ?auto_59403 - CITY
      ?auto_59404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59405 ?auto_59403 ) ( IN-CITY ?auto_59398 ?auto_59403 ) ( not ( = ?auto_59398 ?auto_59405 ) ) ( OBJ-AT ?auto_59400 ?auto_59398 ) ( not ( = ?auto_59400 ?auto_59399 ) ) ( OBJ-AT ?auto_59399 ?auto_59405 ) ( TRUCK-AT ?auto_59404 ?auto_59398 ) ( OBJ-AT ?auto_59401 ?auto_59398 ) ( OBJ-AT ?auto_59402 ?auto_59398 ) ( not ( = ?auto_59399 ?auto_59401 ) ) ( not ( = ?auto_59399 ?auto_59402 ) ) ( not ( = ?auto_59400 ?auto_59401 ) ) ( not ( = ?auto_59400 ?auto_59402 ) ) ( not ( = ?auto_59401 ?auto_59402 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59400 ?auto_59399 ?auto_59398 )
      ( DELIVER-4PKG-VERIFY ?auto_59399 ?auto_59400 ?auto_59401 ?auto_59402 ?auto_59398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59463 - OBJ
      ?auto_59464 - OBJ
      ?auto_59465 - OBJ
      ?auto_59466 - OBJ
      ?auto_59462 - LOCATION
    )
    :vars
    (
      ?auto_59469 - LOCATION
      ?auto_59467 - CITY
      ?auto_59468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59469 ?auto_59467 ) ( IN-CITY ?auto_59462 ?auto_59467 ) ( not ( = ?auto_59462 ?auto_59469 ) ) ( OBJ-AT ?auto_59466 ?auto_59462 ) ( not ( = ?auto_59466 ?auto_59463 ) ) ( OBJ-AT ?auto_59463 ?auto_59469 ) ( TRUCK-AT ?auto_59468 ?auto_59462 ) ( OBJ-AT ?auto_59464 ?auto_59462 ) ( OBJ-AT ?auto_59465 ?auto_59462 ) ( not ( = ?auto_59463 ?auto_59464 ) ) ( not ( = ?auto_59463 ?auto_59465 ) ) ( not ( = ?auto_59464 ?auto_59465 ) ) ( not ( = ?auto_59464 ?auto_59466 ) ) ( not ( = ?auto_59465 ?auto_59466 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59466 ?auto_59463 ?auto_59462 )
      ( DELIVER-4PKG-VERIFY ?auto_59463 ?auto_59464 ?auto_59465 ?auto_59466 ?auto_59462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59495 - OBJ
      ?auto_59496 - OBJ
      ?auto_59497 - OBJ
      ?auto_59498 - OBJ
      ?auto_59494 - LOCATION
    )
    :vars
    (
      ?auto_59502 - LOCATION
      ?auto_59500 - CITY
      ?auto_59499 - OBJ
      ?auto_59501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59502 ?auto_59500 ) ( IN-CITY ?auto_59494 ?auto_59500 ) ( not ( = ?auto_59494 ?auto_59502 ) ) ( OBJ-AT ?auto_59499 ?auto_59494 ) ( not ( = ?auto_59499 ?auto_59495 ) ) ( OBJ-AT ?auto_59495 ?auto_59502 ) ( TRUCK-AT ?auto_59501 ?auto_59494 ) ( OBJ-AT ?auto_59496 ?auto_59494 ) ( OBJ-AT ?auto_59497 ?auto_59494 ) ( OBJ-AT ?auto_59498 ?auto_59494 ) ( not ( = ?auto_59495 ?auto_59496 ) ) ( not ( = ?auto_59495 ?auto_59497 ) ) ( not ( = ?auto_59495 ?auto_59498 ) ) ( not ( = ?auto_59496 ?auto_59497 ) ) ( not ( = ?auto_59496 ?auto_59498 ) ) ( not ( = ?auto_59496 ?auto_59499 ) ) ( not ( = ?auto_59497 ?auto_59498 ) ) ( not ( = ?auto_59497 ?auto_59499 ) ) ( not ( = ?auto_59498 ?auto_59499 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59499 ?auto_59495 ?auto_59494 )
      ( DELIVER-4PKG-VERIFY ?auto_59495 ?auto_59496 ?auto_59497 ?auto_59498 ?auto_59494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59658 - OBJ
      ?auto_59659 - OBJ
      ?auto_59660 - OBJ
      ?auto_59657 - LOCATION
    )
    :vars
    (
      ?auto_59663 - LOCATION
      ?auto_59662 - CITY
      ?auto_59661 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59663 ?auto_59662 ) ( IN-CITY ?auto_59657 ?auto_59662 ) ( not ( = ?auto_59657 ?auto_59663 ) ) ( OBJ-AT ?auto_59660 ?auto_59657 ) ( not ( = ?auto_59660 ?auto_59659 ) ) ( OBJ-AT ?auto_59659 ?auto_59663 ) ( TRUCK-AT ?auto_59661 ?auto_59657 ) ( OBJ-AT ?auto_59658 ?auto_59657 ) ( not ( = ?auto_59658 ?auto_59659 ) ) ( not ( = ?auto_59658 ?auto_59660 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59660 ?auto_59659 ?auto_59657 )
      ( DELIVER-3PKG-VERIFY ?auto_59658 ?auto_59659 ?auto_59660 ?auto_59657 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60319 - OBJ
      ?auto_60318 - LOCATION
    )
    :vars
    (
      ?auto_60323 - LOCATION
      ?auto_60322 - CITY
      ?auto_60321 - OBJ
      ?auto_60320 - TRUCK
      ?auto_60324 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60323 ?auto_60322 ) ( IN-CITY ?auto_60318 ?auto_60322 ) ( not ( = ?auto_60318 ?auto_60323 ) ) ( OBJ-AT ?auto_60321 ?auto_60318 ) ( not ( = ?auto_60321 ?auto_60319 ) ) ( OBJ-AT ?auto_60319 ?auto_60323 ) ( TRUCK-AT ?auto_60320 ?auto_60324 ) ( IN-CITY ?auto_60324 ?auto_60322 ) ( not ( = ?auto_60318 ?auto_60324 ) ) ( not ( = ?auto_60323 ?auto_60324 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60320 ?auto_60324 ?auto_60318 ?auto_60322 )
      ( DELIVER-2PKG ?auto_60321 ?auto_60319 ?auto_60318 )
      ( DELIVER-1PKG-VERIFY ?auto_60319 ?auto_60318 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60326 - OBJ
      ?auto_60327 - OBJ
      ?auto_60325 - LOCATION
    )
    :vars
    (
      ?auto_60329 - LOCATION
      ?auto_60328 - CITY
      ?auto_60331 - TRUCK
      ?auto_60330 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60329 ?auto_60328 ) ( IN-CITY ?auto_60325 ?auto_60328 ) ( not ( = ?auto_60325 ?auto_60329 ) ) ( OBJ-AT ?auto_60326 ?auto_60325 ) ( not ( = ?auto_60326 ?auto_60327 ) ) ( OBJ-AT ?auto_60327 ?auto_60329 ) ( TRUCK-AT ?auto_60331 ?auto_60330 ) ( IN-CITY ?auto_60330 ?auto_60328 ) ( not ( = ?auto_60325 ?auto_60330 ) ) ( not ( = ?auto_60329 ?auto_60330 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60327 ?auto_60325 )
      ( DELIVER-2PKG-VERIFY ?auto_60326 ?auto_60327 ?auto_60325 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60341 - OBJ
      ?auto_60342 - OBJ
      ?auto_60340 - LOCATION
    )
    :vars
    (
      ?auto_60343 - LOCATION
      ?auto_60344 - CITY
      ?auto_60346 - TRUCK
      ?auto_60345 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60343 ?auto_60344 ) ( IN-CITY ?auto_60340 ?auto_60344 ) ( not ( = ?auto_60340 ?auto_60343 ) ) ( OBJ-AT ?auto_60342 ?auto_60340 ) ( not ( = ?auto_60342 ?auto_60341 ) ) ( OBJ-AT ?auto_60341 ?auto_60343 ) ( TRUCK-AT ?auto_60346 ?auto_60345 ) ( IN-CITY ?auto_60345 ?auto_60344 ) ( not ( = ?auto_60340 ?auto_60345 ) ) ( not ( = ?auto_60343 ?auto_60345 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60342 ?auto_60341 ?auto_60340 )
      ( DELIVER-2PKG-VERIFY ?auto_60341 ?auto_60342 ?auto_60340 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60364 - OBJ
      ?auto_60365 - OBJ
      ?auto_60366 - OBJ
      ?auto_60363 - LOCATION
    )
    :vars
    (
      ?auto_60367 - LOCATION
      ?auto_60368 - CITY
      ?auto_60370 - TRUCK
      ?auto_60369 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60367 ?auto_60368 ) ( IN-CITY ?auto_60363 ?auto_60368 ) ( not ( = ?auto_60363 ?auto_60367 ) ) ( OBJ-AT ?auto_60365 ?auto_60363 ) ( not ( = ?auto_60365 ?auto_60366 ) ) ( OBJ-AT ?auto_60366 ?auto_60367 ) ( TRUCK-AT ?auto_60370 ?auto_60369 ) ( IN-CITY ?auto_60369 ?auto_60368 ) ( not ( = ?auto_60363 ?auto_60369 ) ) ( not ( = ?auto_60367 ?auto_60369 ) ) ( OBJ-AT ?auto_60364 ?auto_60363 ) ( not ( = ?auto_60364 ?auto_60365 ) ) ( not ( = ?auto_60364 ?auto_60366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60365 ?auto_60366 ?auto_60363 )
      ( DELIVER-3PKG-VERIFY ?auto_60364 ?auto_60365 ?auto_60366 ?auto_60363 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60380 - OBJ
      ?auto_60381 - OBJ
      ?auto_60382 - OBJ
      ?auto_60379 - LOCATION
    )
    :vars
    (
      ?auto_60383 - LOCATION
      ?auto_60384 - CITY
      ?auto_60386 - TRUCK
      ?auto_60385 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60383 ?auto_60384 ) ( IN-CITY ?auto_60379 ?auto_60384 ) ( not ( = ?auto_60379 ?auto_60383 ) ) ( OBJ-AT ?auto_60382 ?auto_60379 ) ( not ( = ?auto_60382 ?auto_60381 ) ) ( OBJ-AT ?auto_60381 ?auto_60383 ) ( TRUCK-AT ?auto_60386 ?auto_60385 ) ( IN-CITY ?auto_60385 ?auto_60384 ) ( not ( = ?auto_60379 ?auto_60385 ) ) ( not ( = ?auto_60383 ?auto_60385 ) ) ( OBJ-AT ?auto_60380 ?auto_60379 ) ( not ( = ?auto_60380 ?auto_60381 ) ) ( not ( = ?auto_60380 ?auto_60382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60382 ?auto_60381 ?auto_60379 )
      ( DELIVER-3PKG-VERIFY ?auto_60380 ?auto_60381 ?auto_60382 ?auto_60379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60447 - OBJ
      ?auto_60448 - OBJ
      ?auto_60449 - OBJ
      ?auto_60446 - LOCATION
    )
    :vars
    (
      ?auto_60450 - LOCATION
      ?auto_60451 - CITY
      ?auto_60453 - TRUCK
      ?auto_60452 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60450 ?auto_60451 ) ( IN-CITY ?auto_60446 ?auto_60451 ) ( not ( = ?auto_60446 ?auto_60450 ) ) ( OBJ-AT ?auto_60449 ?auto_60446 ) ( not ( = ?auto_60449 ?auto_60447 ) ) ( OBJ-AT ?auto_60447 ?auto_60450 ) ( TRUCK-AT ?auto_60453 ?auto_60452 ) ( IN-CITY ?auto_60452 ?auto_60451 ) ( not ( = ?auto_60446 ?auto_60452 ) ) ( not ( = ?auto_60450 ?auto_60452 ) ) ( OBJ-AT ?auto_60448 ?auto_60446 ) ( not ( = ?auto_60447 ?auto_60448 ) ) ( not ( = ?auto_60448 ?auto_60449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60449 ?auto_60447 ?auto_60446 )
      ( DELIVER-3PKG-VERIFY ?auto_60447 ?auto_60448 ?auto_60449 ?auto_60446 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60523 - OBJ
      ?auto_60524 - OBJ
      ?auto_60525 - OBJ
      ?auto_60526 - OBJ
      ?auto_60522 - LOCATION
    )
    :vars
    (
      ?auto_60527 - LOCATION
      ?auto_60528 - CITY
      ?auto_60530 - TRUCK
      ?auto_60529 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60527 ?auto_60528 ) ( IN-CITY ?auto_60522 ?auto_60528 ) ( not ( = ?auto_60522 ?auto_60527 ) ) ( OBJ-AT ?auto_60523 ?auto_60522 ) ( not ( = ?auto_60523 ?auto_60526 ) ) ( OBJ-AT ?auto_60526 ?auto_60527 ) ( TRUCK-AT ?auto_60530 ?auto_60529 ) ( IN-CITY ?auto_60529 ?auto_60528 ) ( not ( = ?auto_60522 ?auto_60529 ) ) ( not ( = ?auto_60527 ?auto_60529 ) ) ( OBJ-AT ?auto_60524 ?auto_60522 ) ( OBJ-AT ?auto_60525 ?auto_60522 ) ( not ( = ?auto_60523 ?auto_60524 ) ) ( not ( = ?auto_60523 ?auto_60525 ) ) ( not ( = ?auto_60524 ?auto_60525 ) ) ( not ( = ?auto_60524 ?auto_60526 ) ) ( not ( = ?auto_60525 ?auto_60526 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60523 ?auto_60526 ?auto_60522 )
      ( DELIVER-4PKG-VERIFY ?auto_60523 ?auto_60524 ?auto_60525 ?auto_60526 ?auto_60522 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60541 - OBJ
      ?auto_60542 - OBJ
      ?auto_60543 - OBJ
      ?auto_60544 - OBJ
      ?auto_60540 - LOCATION
    )
    :vars
    (
      ?auto_60545 - LOCATION
      ?auto_60546 - CITY
      ?auto_60548 - TRUCK
      ?auto_60547 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60545 ?auto_60546 ) ( IN-CITY ?auto_60540 ?auto_60546 ) ( not ( = ?auto_60540 ?auto_60545 ) ) ( OBJ-AT ?auto_60541 ?auto_60540 ) ( not ( = ?auto_60541 ?auto_60543 ) ) ( OBJ-AT ?auto_60543 ?auto_60545 ) ( TRUCK-AT ?auto_60548 ?auto_60547 ) ( IN-CITY ?auto_60547 ?auto_60546 ) ( not ( = ?auto_60540 ?auto_60547 ) ) ( not ( = ?auto_60545 ?auto_60547 ) ) ( OBJ-AT ?auto_60542 ?auto_60540 ) ( OBJ-AT ?auto_60544 ?auto_60540 ) ( not ( = ?auto_60541 ?auto_60542 ) ) ( not ( = ?auto_60541 ?auto_60544 ) ) ( not ( = ?auto_60542 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60544 ) ) ( not ( = ?auto_60543 ?auto_60544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60541 ?auto_60543 ?auto_60540 )
      ( DELIVER-4PKG-VERIFY ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60544 ?auto_60540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60613 - OBJ
      ?auto_60614 - OBJ
      ?auto_60615 - OBJ
      ?auto_60616 - OBJ
      ?auto_60612 - LOCATION
    )
    :vars
    (
      ?auto_60617 - LOCATION
      ?auto_60618 - CITY
      ?auto_60620 - TRUCK
      ?auto_60619 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60617 ?auto_60618 ) ( IN-CITY ?auto_60612 ?auto_60618 ) ( not ( = ?auto_60612 ?auto_60617 ) ) ( OBJ-AT ?auto_60613 ?auto_60612 ) ( not ( = ?auto_60613 ?auto_60614 ) ) ( OBJ-AT ?auto_60614 ?auto_60617 ) ( TRUCK-AT ?auto_60620 ?auto_60619 ) ( IN-CITY ?auto_60619 ?auto_60618 ) ( not ( = ?auto_60612 ?auto_60619 ) ) ( not ( = ?auto_60617 ?auto_60619 ) ) ( OBJ-AT ?auto_60615 ?auto_60612 ) ( OBJ-AT ?auto_60616 ?auto_60612 ) ( not ( = ?auto_60613 ?auto_60615 ) ) ( not ( = ?auto_60613 ?auto_60616 ) ) ( not ( = ?auto_60614 ?auto_60615 ) ) ( not ( = ?auto_60614 ?auto_60616 ) ) ( not ( = ?auto_60615 ?auto_60616 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60613 ?auto_60614 ?auto_60612 )
      ( DELIVER-4PKG-VERIFY ?auto_60613 ?auto_60614 ?auto_60615 ?auto_60616 ?auto_60612 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60872 - OBJ
      ?auto_60873 - OBJ
      ?auto_60874 - OBJ
      ?auto_60875 - OBJ
      ?auto_60871 - LOCATION
    )
    :vars
    (
      ?auto_60876 - LOCATION
      ?auto_60877 - CITY
      ?auto_60879 - TRUCK
      ?auto_60878 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60876 ?auto_60877 ) ( IN-CITY ?auto_60871 ?auto_60877 ) ( not ( = ?auto_60871 ?auto_60876 ) ) ( OBJ-AT ?auto_60874 ?auto_60871 ) ( not ( = ?auto_60874 ?auto_60872 ) ) ( OBJ-AT ?auto_60872 ?auto_60876 ) ( TRUCK-AT ?auto_60879 ?auto_60878 ) ( IN-CITY ?auto_60878 ?auto_60877 ) ( not ( = ?auto_60871 ?auto_60878 ) ) ( not ( = ?auto_60876 ?auto_60878 ) ) ( OBJ-AT ?auto_60873 ?auto_60871 ) ( OBJ-AT ?auto_60875 ?auto_60871 ) ( not ( = ?auto_60872 ?auto_60873 ) ) ( not ( = ?auto_60872 ?auto_60875 ) ) ( not ( = ?auto_60873 ?auto_60874 ) ) ( not ( = ?auto_60873 ?auto_60875 ) ) ( not ( = ?auto_60874 ?auto_60875 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60874 ?auto_60872 ?auto_60871 )
      ( DELIVER-4PKG-VERIFY ?auto_60872 ?auto_60873 ?auto_60874 ?auto_60875 ?auto_60871 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61155 - OBJ
      ?auto_61156 - OBJ
      ?auto_61157 - OBJ
      ?auto_61154 - LOCATION
    )
    :vars
    (
      ?auto_61160 - LOCATION
      ?auto_61159 - CITY
      ?auto_61161 - TRUCK
      ?auto_61158 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61160 ?auto_61159 ) ( IN-CITY ?auto_61154 ?auto_61159 ) ( not ( = ?auto_61154 ?auto_61160 ) ) ( OBJ-AT ?auto_61155 ?auto_61154 ) ( not ( = ?auto_61155 ?auto_61157 ) ) ( OBJ-AT ?auto_61157 ?auto_61160 ) ( TRUCK-AT ?auto_61161 ?auto_61158 ) ( IN-CITY ?auto_61158 ?auto_61159 ) ( not ( = ?auto_61154 ?auto_61158 ) ) ( not ( = ?auto_61160 ?auto_61158 ) ) ( OBJ-AT ?auto_61156 ?auto_61154 ) ( not ( = ?auto_61155 ?auto_61156 ) ) ( not ( = ?auto_61156 ?auto_61157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61155 ?auto_61157 ?auto_61154 )
      ( DELIVER-3PKG-VERIFY ?auto_61155 ?auto_61156 ?auto_61157 ?auto_61154 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61238 - OBJ
      ?auto_61239 - OBJ
      ?auto_61240 - OBJ
      ?auto_61237 - LOCATION
    )
    :vars
    (
      ?auto_61243 - LOCATION
      ?auto_61242 - CITY
      ?auto_61244 - TRUCK
      ?auto_61241 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61243 ?auto_61242 ) ( IN-CITY ?auto_61237 ?auto_61242 ) ( not ( = ?auto_61237 ?auto_61243 ) ) ( OBJ-AT ?auto_61239 ?auto_61237 ) ( not ( = ?auto_61239 ?auto_61238 ) ) ( OBJ-AT ?auto_61238 ?auto_61243 ) ( TRUCK-AT ?auto_61244 ?auto_61241 ) ( IN-CITY ?auto_61241 ?auto_61242 ) ( not ( = ?auto_61237 ?auto_61241 ) ) ( not ( = ?auto_61243 ?auto_61241 ) ) ( OBJ-AT ?auto_61240 ?auto_61237 ) ( not ( = ?auto_61238 ?auto_61240 ) ) ( not ( = ?auto_61239 ?auto_61240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61239 ?auto_61238 ?auto_61237 )
      ( DELIVER-3PKG-VERIFY ?auto_61238 ?auto_61239 ?auto_61240 ?auto_61237 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61404 - OBJ
      ?auto_61405 - OBJ
      ?auto_61406 - OBJ
      ?auto_61407 - OBJ
      ?auto_61403 - LOCATION
    )
    :vars
    (
      ?auto_61410 - LOCATION
      ?auto_61409 - CITY
      ?auto_61411 - TRUCK
      ?auto_61408 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61410 ?auto_61409 ) ( IN-CITY ?auto_61403 ?auto_61409 ) ( not ( = ?auto_61403 ?auto_61410 ) ) ( OBJ-AT ?auto_61407 ?auto_61403 ) ( not ( = ?auto_61407 ?auto_61405 ) ) ( OBJ-AT ?auto_61405 ?auto_61410 ) ( TRUCK-AT ?auto_61411 ?auto_61408 ) ( IN-CITY ?auto_61408 ?auto_61409 ) ( not ( = ?auto_61403 ?auto_61408 ) ) ( not ( = ?auto_61410 ?auto_61408 ) ) ( OBJ-AT ?auto_61404 ?auto_61403 ) ( OBJ-AT ?auto_61406 ?auto_61403 ) ( not ( = ?auto_61404 ?auto_61405 ) ) ( not ( = ?auto_61404 ?auto_61406 ) ) ( not ( = ?auto_61404 ?auto_61407 ) ) ( not ( = ?auto_61405 ?auto_61406 ) ) ( not ( = ?auto_61406 ?auto_61407 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61407 ?auto_61405 ?auto_61403 )
      ( DELIVER-4PKG-VERIFY ?auto_61404 ?auto_61405 ?auto_61406 ?auto_61407 ?auto_61403 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_67906 - OBJ
      ?auto_67907 - OBJ
      ?auto_67908 - OBJ
      ?auto_67905 - LOCATION
    )
    :vars
    (
      ?auto_67910 - TRUCK
      ?auto_67911 - LOCATION
      ?auto_67909 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_67907 ?auto_67910 ) ( TRUCK-AT ?auto_67910 ?auto_67911 ) ( IN-CITY ?auto_67911 ?auto_67909 ) ( IN-CITY ?auto_67905 ?auto_67909 ) ( not ( = ?auto_67905 ?auto_67911 ) ) ( OBJ-AT ?auto_67906 ?auto_67905 ) ( not ( = ?auto_67906 ?auto_67907 ) ) ( OBJ-AT ?auto_67908 ?auto_67905 ) ( not ( = ?auto_67906 ?auto_67908 ) ) ( not ( = ?auto_67907 ?auto_67908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_67906 ?auto_67907 ?auto_67905 )
      ( DELIVER-3PKG-VERIFY ?auto_67906 ?auto_67907 ?auto_67908 ?auto_67905 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69656 - OBJ
      ?auto_69657 - OBJ
      ?auto_69658 - OBJ
      ?auto_69655 - LOCATION
    )
    :vars
    (
      ?auto_69659 - TRUCK
      ?auto_69661 - LOCATION
      ?auto_69660 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_69659 ?auto_69661 ) ( IN-CITY ?auto_69661 ?auto_69660 ) ( IN-CITY ?auto_69655 ?auto_69660 ) ( not ( = ?auto_69655 ?auto_69661 ) ) ( OBJ-AT ?auto_69658 ?auto_69655 ) ( not ( = ?auto_69658 ?auto_69656 ) ) ( OBJ-AT ?auto_69656 ?auto_69661 ) ( OBJ-AT ?auto_69657 ?auto_69655 ) ( not ( = ?auto_69656 ?auto_69657 ) ) ( not ( = ?auto_69657 ?auto_69658 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69658 ?auto_69656 ?auto_69655 )
      ( DELIVER-3PKG-VERIFY ?auto_69656 ?auto_69657 ?auto_69658 ?auto_69655 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74629 - OBJ
      ?auto_74630 - OBJ
      ?auto_74631 - OBJ
      ?auto_74628 - LOCATION
    )
    :vars
    (
      ?auto_74634 - LOCATION
      ?auto_74633 - CITY
      ?auto_74632 - TRUCK
      ?auto_74635 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74634 ?auto_74633 ) ( IN-CITY ?auto_74628 ?auto_74633 ) ( not ( = ?auto_74628 ?auto_74634 ) ) ( OBJ-AT ?auto_74629 ?auto_74628 ) ( not ( = ?auto_74629 ?auto_74630 ) ) ( OBJ-AT ?auto_74630 ?auto_74634 ) ( TRUCK-AT ?auto_74632 ?auto_74635 ) ( IN-CITY ?auto_74635 ?auto_74633 ) ( not ( = ?auto_74628 ?auto_74635 ) ) ( not ( = ?auto_74634 ?auto_74635 ) ) ( OBJ-AT ?auto_74631 ?auto_74628 ) ( not ( = ?auto_74629 ?auto_74631 ) ) ( not ( = ?auto_74630 ?auto_74631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74629 ?auto_74630 ?auto_74628 )
      ( DELIVER-3PKG-VERIFY ?auto_74629 ?auto_74630 ?auto_74631 ?auto_74628 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74661 - OBJ
      ?auto_74662 - OBJ
      ?auto_74663 - OBJ
      ?auto_74660 - LOCATION
    )
    :vars
    (
      ?auto_74667 - LOCATION
      ?auto_74666 - CITY
      ?auto_74665 - OBJ
      ?auto_74664 - TRUCK
      ?auto_74668 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74667 ?auto_74666 ) ( IN-CITY ?auto_74660 ?auto_74666 ) ( not ( = ?auto_74660 ?auto_74667 ) ) ( OBJ-AT ?auto_74665 ?auto_74660 ) ( not ( = ?auto_74665 ?auto_74663 ) ) ( OBJ-AT ?auto_74663 ?auto_74667 ) ( TRUCK-AT ?auto_74664 ?auto_74668 ) ( IN-CITY ?auto_74668 ?auto_74666 ) ( not ( = ?auto_74660 ?auto_74668 ) ) ( not ( = ?auto_74667 ?auto_74668 ) ) ( OBJ-AT ?auto_74661 ?auto_74660 ) ( OBJ-AT ?auto_74662 ?auto_74660 ) ( not ( = ?auto_74661 ?auto_74662 ) ) ( not ( = ?auto_74661 ?auto_74663 ) ) ( not ( = ?auto_74661 ?auto_74665 ) ) ( not ( = ?auto_74662 ?auto_74663 ) ) ( not ( = ?auto_74662 ?auto_74665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74665 ?auto_74663 ?auto_74660 )
      ( DELIVER-3PKG-VERIFY ?auto_74661 ?auto_74662 ?auto_74663 ?auto_74660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74683 - OBJ
      ?auto_74684 - OBJ
      ?auto_74685 - OBJ
      ?auto_74682 - LOCATION
    )
    :vars
    (
      ?auto_74689 - LOCATION
      ?auto_74688 - CITY
      ?auto_74687 - OBJ
      ?auto_74686 - TRUCK
      ?auto_74690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74689 ?auto_74688 ) ( IN-CITY ?auto_74682 ?auto_74688 ) ( not ( = ?auto_74682 ?auto_74689 ) ) ( OBJ-AT ?auto_74687 ?auto_74682 ) ( not ( = ?auto_74687 ?auto_74684 ) ) ( OBJ-AT ?auto_74684 ?auto_74689 ) ( TRUCK-AT ?auto_74686 ?auto_74690 ) ( IN-CITY ?auto_74690 ?auto_74688 ) ( not ( = ?auto_74682 ?auto_74690 ) ) ( not ( = ?auto_74689 ?auto_74690 ) ) ( OBJ-AT ?auto_74683 ?auto_74682 ) ( OBJ-AT ?auto_74685 ?auto_74682 ) ( not ( = ?auto_74683 ?auto_74684 ) ) ( not ( = ?auto_74683 ?auto_74685 ) ) ( not ( = ?auto_74683 ?auto_74687 ) ) ( not ( = ?auto_74684 ?auto_74685 ) ) ( not ( = ?auto_74685 ?auto_74687 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74687 ?auto_74684 ?auto_74682 )
      ( DELIVER-3PKG-VERIFY ?auto_74683 ?auto_74684 ?auto_74685 ?auto_74682 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74803 - OBJ
      ?auto_74804 - OBJ
      ?auto_74805 - OBJ
      ?auto_74802 - LOCATION
    )
    :vars
    (
      ?auto_74809 - LOCATION
      ?auto_74808 - CITY
      ?auto_74807 - OBJ
      ?auto_74806 - TRUCK
      ?auto_74810 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74809 ?auto_74808 ) ( IN-CITY ?auto_74802 ?auto_74808 ) ( not ( = ?auto_74802 ?auto_74809 ) ) ( OBJ-AT ?auto_74807 ?auto_74802 ) ( not ( = ?auto_74807 ?auto_74803 ) ) ( OBJ-AT ?auto_74803 ?auto_74809 ) ( TRUCK-AT ?auto_74806 ?auto_74810 ) ( IN-CITY ?auto_74810 ?auto_74808 ) ( not ( = ?auto_74802 ?auto_74810 ) ) ( not ( = ?auto_74809 ?auto_74810 ) ) ( OBJ-AT ?auto_74804 ?auto_74802 ) ( OBJ-AT ?auto_74805 ?auto_74802 ) ( not ( = ?auto_74803 ?auto_74804 ) ) ( not ( = ?auto_74803 ?auto_74805 ) ) ( not ( = ?auto_74804 ?auto_74805 ) ) ( not ( = ?auto_74804 ?auto_74807 ) ) ( not ( = ?auto_74805 ?auto_74807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74807 ?auto_74803 ?auto_74802 )
      ( DELIVER-3PKG-VERIFY ?auto_74803 ?auto_74804 ?auto_74805 ?auto_74802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74909 - OBJ
      ?auto_74910 - OBJ
      ?auto_74911 - OBJ
      ?auto_74912 - OBJ
      ?auto_74908 - LOCATION
    )
    :vars
    (
      ?auto_74915 - LOCATION
      ?auto_74914 - CITY
      ?auto_74913 - TRUCK
      ?auto_74916 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74915 ?auto_74914 ) ( IN-CITY ?auto_74908 ?auto_74914 ) ( not ( = ?auto_74908 ?auto_74915 ) ) ( OBJ-AT ?auto_74910 ?auto_74908 ) ( not ( = ?auto_74910 ?auto_74912 ) ) ( OBJ-AT ?auto_74912 ?auto_74915 ) ( TRUCK-AT ?auto_74913 ?auto_74916 ) ( IN-CITY ?auto_74916 ?auto_74914 ) ( not ( = ?auto_74908 ?auto_74916 ) ) ( not ( = ?auto_74915 ?auto_74916 ) ) ( OBJ-AT ?auto_74909 ?auto_74908 ) ( OBJ-AT ?auto_74911 ?auto_74908 ) ( not ( = ?auto_74909 ?auto_74910 ) ) ( not ( = ?auto_74909 ?auto_74911 ) ) ( not ( = ?auto_74909 ?auto_74912 ) ) ( not ( = ?auto_74910 ?auto_74911 ) ) ( not ( = ?auto_74911 ?auto_74912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74910 ?auto_74912 ?auto_74908 )
      ( DELIVER-4PKG-VERIFY ?auto_74909 ?auto_74910 ?auto_74911 ?auto_74912 ?auto_74908 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74936 - OBJ
      ?auto_74937 - OBJ
      ?auto_74938 - OBJ
      ?auto_74939 - OBJ
      ?auto_74935 - LOCATION
    )
    :vars
    (
      ?auto_74942 - LOCATION
      ?auto_74941 - CITY
      ?auto_74940 - TRUCK
      ?auto_74943 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74942 ?auto_74941 ) ( IN-CITY ?auto_74935 ?auto_74941 ) ( not ( = ?auto_74935 ?auto_74942 ) ) ( OBJ-AT ?auto_74937 ?auto_74935 ) ( not ( = ?auto_74937 ?auto_74938 ) ) ( OBJ-AT ?auto_74938 ?auto_74942 ) ( TRUCK-AT ?auto_74940 ?auto_74943 ) ( IN-CITY ?auto_74943 ?auto_74941 ) ( not ( = ?auto_74935 ?auto_74943 ) ) ( not ( = ?auto_74942 ?auto_74943 ) ) ( OBJ-AT ?auto_74936 ?auto_74935 ) ( OBJ-AT ?auto_74939 ?auto_74935 ) ( not ( = ?auto_74936 ?auto_74937 ) ) ( not ( = ?auto_74936 ?auto_74938 ) ) ( not ( = ?auto_74936 ?auto_74939 ) ) ( not ( = ?auto_74937 ?auto_74939 ) ) ( not ( = ?auto_74938 ?auto_74939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74937 ?auto_74938 ?auto_74935 )
      ( DELIVER-4PKG-VERIFY ?auto_74936 ?auto_74937 ?auto_74938 ?auto_74939 ?auto_74935 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_74963 - OBJ
      ?auto_74964 - OBJ
      ?auto_74965 - OBJ
      ?auto_74966 - OBJ
      ?auto_74962 - LOCATION
    )
    :vars
    (
      ?auto_74969 - LOCATION
      ?auto_74968 - CITY
      ?auto_74967 - TRUCK
      ?auto_74970 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74969 ?auto_74968 ) ( IN-CITY ?auto_74962 ?auto_74968 ) ( not ( = ?auto_74962 ?auto_74969 ) ) ( OBJ-AT ?auto_74965 ?auto_74962 ) ( not ( = ?auto_74965 ?auto_74966 ) ) ( OBJ-AT ?auto_74966 ?auto_74969 ) ( TRUCK-AT ?auto_74967 ?auto_74970 ) ( IN-CITY ?auto_74970 ?auto_74968 ) ( not ( = ?auto_74962 ?auto_74970 ) ) ( not ( = ?auto_74969 ?auto_74970 ) ) ( OBJ-AT ?auto_74963 ?auto_74962 ) ( OBJ-AT ?auto_74964 ?auto_74962 ) ( not ( = ?auto_74963 ?auto_74964 ) ) ( not ( = ?auto_74963 ?auto_74965 ) ) ( not ( = ?auto_74963 ?auto_74966 ) ) ( not ( = ?auto_74964 ?auto_74965 ) ) ( not ( = ?auto_74964 ?auto_74966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74965 ?auto_74966 ?auto_74962 )
      ( DELIVER-4PKG-VERIFY ?auto_74963 ?auto_74964 ?auto_74965 ?auto_74966 ?auto_74962 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75098 - OBJ
      ?auto_75099 - OBJ
      ?auto_75100 - OBJ
      ?auto_75101 - OBJ
      ?auto_75097 - LOCATION
    )
    :vars
    (
      ?auto_75104 - LOCATION
      ?auto_75103 - CITY
      ?auto_75102 - TRUCK
      ?auto_75105 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75104 ?auto_75103 ) ( IN-CITY ?auto_75097 ?auto_75103 ) ( not ( = ?auto_75097 ?auto_75104 ) ) ( OBJ-AT ?auto_75100 ?auto_75097 ) ( not ( = ?auto_75100 ?auto_75099 ) ) ( OBJ-AT ?auto_75099 ?auto_75104 ) ( TRUCK-AT ?auto_75102 ?auto_75105 ) ( IN-CITY ?auto_75105 ?auto_75103 ) ( not ( = ?auto_75097 ?auto_75105 ) ) ( not ( = ?auto_75104 ?auto_75105 ) ) ( OBJ-AT ?auto_75098 ?auto_75097 ) ( OBJ-AT ?auto_75101 ?auto_75097 ) ( not ( = ?auto_75098 ?auto_75099 ) ) ( not ( = ?auto_75098 ?auto_75100 ) ) ( not ( = ?auto_75098 ?auto_75101 ) ) ( not ( = ?auto_75099 ?auto_75101 ) ) ( not ( = ?auto_75100 ?auto_75101 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75100 ?auto_75099 ?auto_75097 )
      ( DELIVER-4PKG-VERIFY ?auto_75098 ?auto_75099 ?auto_75100 ?auto_75101 ?auto_75097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75305 - OBJ
      ?auto_75306 - OBJ
      ?auto_75307 - OBJ
      ?auto_75308 - OBJ
      ?auto_75304 - LOCATION
    )
    :vars
    (
      ?auto_75312 - LOCATION
      ?auto_75311 - CITY
      ?auto_75310 - OBJ
      ?auto_75309 - TRUCK
      ?auto_75313 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75312 ?auto_75311 ) ( IN-CITY ?auto_75304 ?auto_75311 ) ( not ( = ?auto_75304 ?auto_75312 ) ) ( OBJ-AT ?auto_75310 ?auto_75304 ) ( not ( = ?auto_75310 ?auto_75308 ) ) ( OBJ-AT ?auto_75308 ?auto_75312 ) ( TRUCK-AT ?auto_75309 ?auto_75313 ) ( IN-CITY ?auto_75313 ?auto_75311 ) ( not ( = ?auto_75304 ?auto_75313 ) ) ( not ( = ?auto_75312 ?auto_75313 ) ) ( OBJ-AT ?auto_75305 ?auto_75304 ) ( OBJ-AT ?auto_75306 ?auto_75304 ) ( OBJ-AT ?auto_75307 ?auto_75304 ) ( not ( = ?auto_75305 ?auto_75306 ) ) ( not ( = ?auto_75305 ?auto_75307 ) ) ( not ( = ?auto_75305 ?auto_75308 ) ) ( not ( = ?auto_75305 ?auto_75310 ) ) ( not ( = ?auto_75306 ?auto_75307 ) ) ( not ( = ?auto_75306 ?auto_75308 ) ) ( not ( = ?auto_75306 ?auto_75310 ) ) ( not ( = ?auto_75307 ?auto_75308 ) ) ( not ( = ?auto_75307 ?auto_75310 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75310 ?auto_75308 ?auto_75304 )
      ( DELIVER-4PKG-VERIFY ?auto_75305 ?auto_75306 ?auto_75307 ?auto_75308 ?auto_75304 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75325 - OBJ
      ?auto_75326 - OBJ
      ?auto_75327 - OBJ
      ?auto_75328 - OBJ
      ?auto_75324 - LOCATION
    )
    :vars
    (
      ?auto_75331 - LOCATION
      ?auto_75330 - CITY
      ?auto_75329 - TRUCK
      ?auto_75332 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75331 ?auto_75330 ) ( IN-CITY ?auto_75324 ?auto_75330 ) ( not ( = ?auto_75324 ?auto_75331 ) ) ( OBJ-AT ?auto_75328 ?auto_75324 ) ( not ( = ?auto_75328 ?auto_75327 ) ) ( OBJ-AT ?auto_75327 ?auto_75331 ) ( TRUCK-AT ?auto_75329 ?auto_75332 ) ( IN-CITY ?auto_75332 ?auto_75330 ) ( not ( = ?auto_75324 ?auto_75332 ) ) ( not ( = ?auto_75331 ?auto_75332 ) ) ( OBJ-AT ?auto_75325 ?auto_75324 ) ( OBJ-AT ?auto_75326 ?auto_75324 ) ( not ( = ?auto_75325 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75327 ) ) ( not ( = ?auto_75325 ?auto_75328 ) ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( not ( = ?auto_75326 ?auto_75328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75328 ?auto_75327 ?auto_75324 )
      ( DELIVER-4PKG-VERIFY ?auto_75325 ?auto_75326 ?auto_75327 ?auto_75328 ?auto_75324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75334 - OBJ
      ?auto_75335 - OBJ
      ?auto_75336 - OBJ
      ?auto_75337 - OBJ
      ?auto_75333 - LOCATION
    )
    :vars
    (
      ?auto_75341 - LOCATION
      ?auto_75340 - CITY
      ?auto_75339 - OBJ
      ?auto_75338 - TRUCK
      ?auto_75342 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75341 ?auto_75340 ) ( IN-CITY ?auto_75333 ?auto_75340 ) ( not ( = ?auto_75333 ?auto_75341 ) ) ( OBJ-AT ?auto_75339 ?auto_75333 ) ( not ( = ?auto_75339 ?auto_75336 ) ) ( OBJ-AT ?auto_75336 ?auto_75341 ) ( TRUCK-AT ?auto_75338 ?auto_75342 ) ( IN-CITY ?auto_75342 ?auto_75340 ) ( not ( = ?auto_75333 ?auto_75342 ) ) ( not ( = ?auto_75341 ?auto_75342 ) ) ( OBJ-AT ?auto_75334 ?auto_75333 ) ( OBJ-AT ?auto_75335 ?auto_75333 ) ( OBJ-AT ?auto_75337 ?auto_75333 ) ( not ( = ?auto_75334 ?auto_75335 ) ) ( not ( = ?auto_75334 ?auto_75336 ) ) ( not ( = ?auto_75334 ?auto_75337 ) ) ( not ( = ?auto_75334 ?auto_75339 ) ) ( not ( = ?auto_75335 ?auto_75336 ) ) ( not ( = ?auto_75335 ?auto_75337 ) ) ( not ( = ?auto_75335 ?auto_75339 ) ) ( not ( = ?auto_75336 ?auto_75337 ) ) ( not ( = ?auto_75337 ?auto_75339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75339 ?auto_75336 ?auto_75333 )
      ( DELIVER-4PKG-VERIFY ?auto_75334 ?auto_75335 ?auto_75336 ?auto_75337 ?auto_75333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75477 - OBJ
      ?auto_75478 - OBJ
      ?auto_75479 - OBJ
      ?auto_75480 - OBJ
      ?auto_75476 - LOCATION
    )
    :vars
    (
      ?auto_75484 - LOCATION
      ?auto_75483 - CITY
      ?auto_75482 - OBJ
      ?auto_75481 - TRUCK
      ?auto_75485 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75484 ?auto_75483 ) ( IN-CITY ?auto_75476 ?auto_75483 ) ( not ( = ?auto_75476 ?auto_75484 ) ) ( OBJ-AT ?auto_75482 ?auto_75476 ) ( not ( = ?auto_75482 ?auto_75478 ) ) ( OBJ-AT ?auto_75478 ?auto_75484 ) ( TRUCK-AT ?auto_75481 ?auto_75485 ) ( IN-CITY ?auto_75485 ?auto_75483 ) ( not ( = ?auto_75476 ?auto_75485 ) ) ( not ( = ?auto_75484 ?auto_75485 ) ) ( OBJ-AT ?auto_75477 ?auto_75476 ) ( OBJ-AT ?auto_75479 ?auto_75476 ) ( OBJ-AT ?auto_75480 ?auto_75476 ) ( not ( = ?auto_75477 ?auto_75478 ) ) ( not ( = ?auto_75477 ?auto_75479 ) ) ( not ( = ?auto_75477 ?auto_75480 ) ) ( not ( = ?auto_75477 ?auto_75482 ) ) ( not ( = ?auto_75478 ?auto_75479 ) ) ( not ( = ?auto_75478 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75482 ) ) ( not ( = ?auto_75480 ?auto_75482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75482 ?auto_75478 ?auto_75476 )
      ( DELIVER-4PKG-VERIFY ?auto_75477 ?auto_75478 ?auto_75479 ?auto_75480 ?auto_75476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75973 - OBJ
      ?auto_75974 - OBJ
      ?auto_75975 - OBJ
      ?auto_75976 - OBJ
      ?auto_75972 - LOCATION
    )
    :vars
    (
      ?auto_75979 - LOCATION
      ?auto_75978 - CITY
      ?auto_75977 - TRUCK
      ?auto_75980 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75979 ?auto_75978 ) ( IN-CITY ?auto_75972 ?auto_75978 ) ( not ( = ?auto_75972 ?auto_75979 ) ) ( OBJ-AT ?auto_75976 ?auto_75972 ) ( not ( = ?auto_75976 ?auto_75973 ) ) ( OBJ-AT ?auto_75973 ?auto_75979 ) ( TRUCK-AT ?auto_75977 ?auto_75980 ) ( IN-CITY ?auto_75980 ?auto_75978 ) ( not ( = ?auto_75972 ?auto_75980 ) ) ( not ( = ?auto_75979 ?auto_75980 ) ) ( OBJ-AT ?auto_75974 ?auto_75972 ) ( OBJ-AT ?auto_75975 ?auto_75972 ) ( not ( = ?auto_75973 ?auto_75974 ) ) ( not ( = ?auto_75973 ?auto_75975 ) ) ( not ( = ?auto_75974 ?auto_75975 ) ) ( not ( = ?auto_75974 ?auto_75976 ) ) ( not ( = ?auto_75975 ?auto_75976 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75976 ?auto_75973 ?auto_75972 )
      ( DELIVER-4PKG-VERIFY ?auto_75973 ?auto_75974 ?auto_75975 ?auto_75976 ?auto_75972 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75982 - OBJ
      ?auto_75983 - OBJ
      ?auto_75984 - OBJ
      ?auto_75985 - OBJ
      ?auto_75981 - LOCATION
    )
    :vars
    (
      ?auto_75988 - LOCATION
      ?auto_75987 - CITY
      ?auto_75986 - TRUCK
      ?auto_75989 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75988 ?auto_75987 ) ( IN-CITY ?auto_75981 ?auto_75987 ) ( not ( = ?auto_75981 ?auto_75988 ) ) ( OBJ-AT ?auto_75983 ?auto_75981 ) ( not ( = ?auto_75983 ?auto_75982 ) ) ( OBJ-AT ?auto_75982 ?auto_75988 ) ( TRUCK-AT ?auto_75986 ?auto_75989 ) ( IN-CITY ?auto_75989 ?auto_75987 ) ( not ( = ?auto_75981 ?auto_75989 ) ) ( not ( = ?auto_75988 ?auto_75989 ) ) ( OBJ-AT ?auto_75984 ?auto_75981 ) ( OBJ-AT ?auto_75985 ?auto_75981 ) ( not ( = ?auto_75982 ?auto_75984 ) ) ( not ( = ?auto_75982 ?auto_75985 ) ) ( not ( = ?auto_75983 ?auto_75984 ) ) ( not ( = ?auto_75983 ?auto_75985 ) ) ( not ( = ?auto_75984 ?auto_75985 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75983 ?auto_75982 ?auto_75981 )
      ( DELIVER-4PKG-VERIFY ?auto_75982 ?auto_75983 ?auto_75984 ?auto_75985 ?auto_75981 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76126 - OBJ
      ?auto_76127 - OBJ
      ?auto_76128 - OBJ
      ?auto_76129 - OBJ
      ?auto_76125 - LOCATION
    )
    :vars
    (
      ?auto_76133 - LOCATION
      ?auto_76132 - CITY
      ?auto_76131 - OBJ
      ?auto_76130 - TRUCK
      ?auto_76134 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76133 ?auto_76132 ) ( IN-CITY ?auto_76125 ?auto_76132 ) ( not ( = ?auto_76125 ?auto_76133 ) ) ( OBJ-AT ?auto_76131 ?auto_76125 ) ( not ( = ?auto_76131 ?auto_76126 ) ) ( OBJ-AT ?auto_76126 ?auto_76133 ) ( TRUCK-AT ?auto_76130 ?auto_76134 ) ( IN-CITY ?auto_76134 ?auto_76132 ) ( not ( = ?auto_76125 ?auto_76134 ) ) ( not ( = ?auto_76133 ?auto_76134 ) ) ( OBJ-AT ?auto_76127 ?auto_76125 ) ( OBJ-AT ?auto_76128 ?auto_76125 ) ( OBJ-AT ?auto_76129 ?auto_76125 ) ( not ( = ?auto_76126 ?auto_76127 ) ) ( not ( = ?auto_76126 ?auto_76128 ) ) ( not ( = ?auto_76126 ?auto_76129 ) ) ( not ( = ?auto_76127 ?auto_76128 ) ) ( not ( = ?auto_76127 ?auto_76129 ) ) ( not ( = ?auto_76127 ?auto_76131 ) ) ( not ( = ?auto_76128 ?auto_76129 ) ) ( not ( = ?auto_76128 ?auto_76131 ) ) ( not ( = ?auto_76129 ?auto_76131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76131 ?auto_76126 ?auto_76125 )
      ( DELIVER-4PKG-VERIFY ?auto_76126 ?auto_76127 ?auto_76128 ?auto_76129 ?auto_76125 ) )
  )

)

