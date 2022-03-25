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
      ?auto_176777 - OBJ
      ?auto_176776 - LOCATION
    )
    :vars
    (
      ?auto_176778 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176778 ?auto_176776 ) ( IN-TRUCK ?auto_176777 ?auto_176778 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_176777 ?auto_176778 ?auto_176776 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176795 - OBJ
      ?auto_176794 - LOCATION
    )
    :vars
    (
      ?auto_176796 - TRUCK
      ?auto_176797 - LOCATION
      ?auto_176798 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_176795 ?auto_176796 ) ( TRUCK-AT ?auto_176796 ?auto_176797 ) ( IN-CITY ?auto_176797 ?auto_176798 ) ( IN-CITY ?auto_176794 ?auto_176798 ) ( not ( = ?auto_176794 ?auto_176797 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176796 ?auto_176797 ?auto_176794 ?auto_176798 )
      ( DELIVER-1PKG ?auto_176795 ?auto_176794 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176821 - OBJ
      ?auto_176820 - LOCATION
    )
    :vars
    (
      ?auto_176823 - TRUCK
      ?auto_176822 - LOCATION
      ?auto_176824 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176823 ?auto_176822 ) ( IN-CITY ?auto_176822 ?auto_176824 ) ( IN-CITY ?auto_176820 ?auto_176824 ) ( not ( = ?auto_176820 ?auto_176822 ) ) ( OBJ-AT ?auto_176821 ?auto_176822 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_176821 ?auto_176823 ?auto_176822 )
      ( DELIVER-1PKG ?auto_176821 ?auto_176820 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_176847 - OBJ
      ?auto_176846 - LOCATION
    )
    :vars
    (
      ?auto_176848 - LOCATION
      ?auto_176849 - CITY
      ?auto_176850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176848 ?auto_176849 ) ( IN-CITY ?auto_176846 ?auto_176849 ) ( not ( = ?auto_176846 ?auto_176848 ) ) ( OBJ-AT ?auto_176847 ?auto_176848 ) ( TRUCK-AT ?auto_176850 ?auto_176846 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_176850 ?auto_176846 ?auto_176848 ?auto_176849 )
      ( DELIVER-1PKG ?auto_176847 ?auto_176846 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176990 - OBJ
      ?auto_176991 - OBJ
      ?auto_176989 - LOCATION
    )
    :vars
    (
      ?auto_176992 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176992 ?auto_176989 ) ( IN-TRUCK ?auto_176991 ?auto_176992 ) ( OBJ-AT ?auto_176990 ?auto_176989 ) ( not ( = ?auto_176990 ?auto_176991 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176991 ?auto_176989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_176994 - OBJ
      ?auto_176995 - OBJ
      ?auto_176993 - LOCATION
    )
    :vars
    (
      ?auto_176996 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_176996 ?auto_176993 ) ( IN-TRUCK ?auto_176994 ?auto_176996 ) ( OBJ-AT ?auto_176995 ?auto_176993 ) ( not ( = ?auto_176994 ?auto_176995 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_176994 ?auto_176993 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177002 - OBJ
      ?auto_177003 - OBJ
      ?auto_177004 - OBJ
      ?auto_177001 - LOCATION
    )
    :vars
    (
      ?auto_177005 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177005 ?auto_177001 ) ( IN-TRUCK ?auto_177004 ?auto_177005 ) ( OBJ-AT ?auto_177002 ?auto_177001 ) ( OBJ-AT ?auto_177003 ?auto_177001 ) ( not ( = ?auto_177002 ?auto_177003 ) ) ( not ( = ?auto_177002 ?auto_177004 ) ) ( not ( = ?auto_177003 ?auto_177004 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177004 ?auto_177001 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177007 - OBJ
      ?auto_177008 - OBJ
      ?auto_177009 - OBJ
      ?auto_177006 - LOCATION
    )
    :vars
    (
      ?auto_177010 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177010 ?auto_177006 ) ( IN-TRUCK ?auto_177008 ?auto_177010 ) ( OBJ-AT ?auto_177007 ?auto_177006 ) ( OBJ-AT ?auto_177009 ?auto_177006 ) ( not ( = ?auto_177007 ?auto_177008 ) ) ( not ( = ?auto_177007 ?auto_177009 ) ) ( not ( = ?auto_177008 ?auto_177009 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177008 ?auto_177006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177017 - OBJ
      ?auto_177018 - OBJ
      ?auto_177019 - OBJ
      ?auto_177016 - LOCATION
    )
    :vars
    (
      ?auto_177020 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177020 ?auto_177016 ) ( IN-TRUCK ?auto_177017 ?auto_177020 ) ( OBJ-AT ?auto_177018 ?auto_177016 ) ( OBJ-AT ?auto_177019 ?auto_177016 ) ( not ( = ?auto_177017 ?auto_177018 ) ) ( not ( = ?auto_177017 ?auto_177019 ) ) ( not ( = ?auto_177018 ?auto_177019 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177017 ?auto_177016 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177037 - OBJ
      ?auto_177038 - OBJ
      ?auto_177039 - OBJ
      ?auto_177040 - OBJ
      ?auto_177036 - LOCATION
    )
    :vars
    (
      ?auto_177041 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177041 ?auto_177036 ) ( IN-TRUCK ?auto_177040 ?auto_177041 ) ( OBJ-AT ?auto_177037 ?auto_177036 ) ( OBJ-AT ?auto_177038 ?auto_177036 ) ( OBJ-AT ?auto_177039 ?auto_177036 ) ( not ( = ?auto_177037 ?auto_177038 ) ) ( not ( = ?auto_177037 ?auto_177039 ) ) ( not ( = ?auto_177037 ?auto_177040 ) ) ( not ( = ?auto_177038 ?auto_177039 ) ) ( not ( = ?auto_177038 ?auto_177040 ) ) ( not ( = ?auto_177039 ?auto_177040 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177040 ?auto_177036 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177043 - OBJ
      ?auto_177044 - OBJ
      ?auto_177045 - OBJ
      ?auto_177046 - OBJ
      ?auto_177042 - LOCATION
    )
    :vars
    (
      ?auto_177047 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177047 ?auto_177042 ) ( IN-TRUCK ?auto_177045 ?auto_177047 ) ( OBJ-AT ?auto_177043 ?auto_177042 ) ( OBJ-AT ?auto_177044 ?auto_177042 ) ( OBJ-AT ?auto_177046 ?auto_177042 ) ( not ( = ?auto_177043 ?auto_177044 ) ) ( not ( = ?auto_177043 ?auto_177045 ) ) ( not ( = ?auto_177043 ?auto_177046 ) ) ( not ( = ?auto_177044 ?auto_177045 ) ) ( not ( = ?auto_177044 ?auto_177046 ) ) ( not ( = ?auto_177045 ?auto_177046 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177045 ?auto_177042 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177055 - OBJ
      ?auto_177056 - OBJ
      ?auto_177057 - OBJ
      ?auto_177058 - OBJ
      ?auto_177054 - LOCATION
    )
    :vars
    (
      ?auto_177059 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177059 ?auto_177054 ) ( IN-TRUCK ?auto_177056 ?auto_177059 ) ( OBJ-AT ?auto_177055 ?auto_177054 ) ( OBJ-AT ?auto_177057 ?auto_177054 ) ( OBJ-AT ?auto_177058 ?auto_177054 ) ( not ( = ?auto_177055 ?auto_177056 ) ) ( not ( = ?auto_177055 ?auto_177057 ) ) ( not ( = ?auto_177055 ?auto_177058 ) ) ( not ( = ?auto_177056 ?auto_177057 ) ) ( not ( = ?auto_177056 ?auto_177058 ) ) ( not ( = ?auto_177057 ?auto_177058 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177056 ?auto_177054 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177079 - OBJ
      ?auto_177080 - OBJ
      ?auto_177081 - OBJ
      ?auto_177082 - OBJ
      ?auto_177078 - LOCATION
    )
    :vars
    (
      ?auto_177083 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177083 ?auto_177078 ) ( IN-TRUCK ?auto_177079 ?auto_177083 ) ( OBJ-AT ?auto_177080 ?auto_177078 ) ( OBJ-AT ?auto_177081 ?auto_177078 ) ( OBJ-AT ?auto_177082 ?auto_177078 ) ( not ( = ?auto_177079 ?auto_177080 ) ) ( not ( = ?auto_177079 ?auto_177081 ) ) ( not ( = ?auto_177079 ?auto_177082 ) ) ( not ( = ?auto_177080 ?auto_177081 ) ) ( not ( = ?auto_177080 ?auto_177082 ) ) ( not ( = ?auto_177081 ?auto_177082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177079 ?auto_177078 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177132 - OBJ
      ?auto_177133 - OBJ
      ?auto_177131 - LOCATION
    )
    :vars
    (
      ?auto_177135 - TRUCK
      ?auto_177134 - LOCATION
      ?auto_177136 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177133 ?auto_177135 ) ( TRUCK-AT ?auto_177135 ?auto_177134 ) ( IN-CITY ?auto_177134 ?auto_177136 ) ( IN-CITY ?auto_177131 ?auto_177136 ) ( not ( = ?auto_177131 ?auto_177134 ) ) ( OBJ-AT ?auto_177132 ?auto_177131 ) ( not ( = ?auto_177132 ?auto_177133 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177133 ?auto_177131 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177138 - OBJ
      ?auto_177139 - OBJ
      ?auto_177137 - LOCATION
    )
    :vars
    (
      ?auto_177140 - TRUCK
      ?auto_177142 - LOCATION
      ?auto_177141 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177138 ?auto_177140 ) ( TRUCK-AT ?auto_177140 ?auto_177142 ) ( IN-CITY ?auto_177142 ?auto_177141 ) ( IN-CITY ?auto_177137 ?auto_177141 ) ( not ( = ?auto_177137 ?auto_177142 ) ) ( OBJ-AT ?auto_177139 ?auto_177137 ) ( not ( = ?auto_177139 ?auto_177138 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177139 ?auto_177138 ?auto_177137 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177151 - OBJ
      ?auto_177152 - OBJ
      ?auto_177153 - OBJ
      ?auto_177150 - LOCATION
    )
    :vars
    (
      ?auto_177154 - TRUCK
      ?auto_177156 - LOCATION
      ?auto_177155 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177153 ?auto_177154 ) ( TRUCK-AT ?auto_177154 ?auto_177156 ) ( IN-CITY ?auto_177156 ?auto_177155 ) ( IN-CITY ?auto_177150 ?auto_177155 ) ( not ( = ?auto_177150 ?auto_177156 ) ) ( OBJ-AT ?auto_177152 ?auto_177150 ) ( not ( = ?auto_177152 ?auto_177153 ) ) ( OBJ-AT ?auto_177151 ?auto_177150 ) ( not ( = ?auto_177151 ?auto_177152 ) ) ( not ( = ?auto_177151 ?auto_177153 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177152 ?auto_177153 ?auto_177150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177158 - OBJ
      ?auto_177159 - OBJ
      ?auto_177160 - OBJ
      ?auto_177157 - LOCATION
    )
    :vars
    (
      ?auto_177161 - TRUCK
      ?auto_177163 - LOCATION
      ?auto_177162 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177159 ?auto_177161 ) ( TRUCK-AT ?auto_177161 ?auto_177163 ) ( IN-CITY ?auto_177163 ?auto_177162 ) ( IN-CITY ?auto_177157 ?auto_177162 ) ( not ( = ?auto_177157 ?auto_177163 ) ) ( OBJ-AT ?auto_177160 ?auto_177157 ) ( not ( = ?auto_177160 ?auto_177159 ) ) ( OBJ-AT ?auto_177158 ?auto_177157 ) ( not ( = ?auto_177158 ?auto_177159 ) ) ( not ( = ?auto_177158 ?auto_177160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177160 ?auto_177159 ?auto_177157 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177172 - OBJ
      ?auto_177173 - OBJ
      ?auto_177174 - OBJ
      ?auto_177171 - LOCATION
    )
    :vars
    (
      ?auto_177175 - TRUCK
      ?auto_177177 - LOCATION
      ?auto_177176 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177172 ?auto_177175 ) ( TRUCK-AT ?auto_177175 ?auto_177177 ) ( IN-CITY ?auto_177177 ?auto_177176 ) ( IN-CITY ?auto_177171 ?auto_177176 ) ( not ( = ?auto_177171 ?auto_177177 ) ) ( OBJ-AT ?auto_177173 ?auto_177171 ) ( not ( = ?auto_177173 ?auto_177172 ) ) ( OBJ-AT ?auto_177174 ?auto_177171 ) ( not ( = ?auto_177172 ?auto_177174 ) ) ( not ( = ?auto_177173 ?auto_177174 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177173 ?auto_177172 ?auto_177171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177201 - OBJ
      ?auto_177202 - OBJ
      ?auto_177203 - OBJ
      ?auto_177204 - OBJ
      ?auto_177200 - LOCATION
    )
    :vars
    (
      ?auto_177205 - TRUCK
      ?auto_177207 - LOCATION
      ?auto_177206 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177204 ?auto_177205 ) ( TRUCK-AT ?auto_177205 ?auto_177207 ) ( IN-CITY ?auto_177207 ?auto_177206 ) ( IN-CITY ?auto_177200 ?auto_177206 ) ( not ( = ?auto_177200 ?auto_177207 ) ) ( OBJ-AT ?auto_177203 ?auto_177200 ) ( not ( = ?auto_177203 ?auto_177204 ) ) ( OBJ-AT ?auto_177201 ?auto_177200 ) ( OBJ-AT ?auto_177202 ?auto_177200 ) ( not ( = ?auto_177201 ?auto_177202 ) ) ( not ( = ?auto_177201 ?auto_177203 ) ) ( not ( = ?auto_177201 ?auto_177204 ) ) ( not ( = ?auto_177202 ?auto_177203 ) ) ( not ( = ?auto_177202 ?auto_177204 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177203 ?auto_177204 ?auto_177200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177209 - OBJ
      ?auto_177210 - OBJ
      ?auto_177211 - OBJ
      ?auto_177212 - OBJ
      ?auto_177208 - LOCATION
    )
    :vars
    (
      ?auto_177213 - TRUCK
      ?auto_177215 - LOCATION
      ?auto_177214 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177211 ?auto_177213 ) ( TRUCK-AT ?auto_177213 ?auto_177215 ) ( IN-CITY ?auto_177215 ?auto_177214 ) ( IN-CITY ?auto_177208 ?auto_177214 ) ( not ( = ?auto_177208 ?auto_177215 ) ) ( OBJ-AT ?auto_177209 ?auto_177208 ) ( not ( = ?auto_177209 ?auto_177211 ) ) ( OBJ-AT ?auto_177210 ?auto_177208 ) ( OBJ-AT ?auto_177212 ?auto_177208 ) ( not ( = ?auto_177209 ?auto_177210 ) ) ( not ( = ?auto_177209 ?auto_177212 ) ) ( not ( = ?auto_177210 ?auto_177211 ) ) ( not ( = ?auto_177210 ?auto_177212 ) ) ( not ( = ?auto_177211 ?auto_177212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177209 ?auto_177211 ?auto_177208 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177225 - OBJ
      ?auto_177226 - OBJ
      ?auto_177227 - OBJ
      ?auto_177228 - OBJ
      ?auto_177224 - LOCATION
    )
    :vars
    (
      ?auto_177229 - TRUCK
      ?auto_177231 - LOCATION
      ?auto_177230 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177226 ?auto_177229 ) ( TRUCK-AT ?auto_177229 ?auto_177231 ) ( IN-CITY ?auto_177231 ?auto_177230 ) ( IN-CITY ?auto_177224 ?auto_177230 ) ( not ( = ?auto_177224 ?auto_177231 ) ) ( OBJ-AT ?auto_177225 ?auto_177224 ) ( not ( = ?auto_177225 ?auto_177226 ) ) ( OBJ-AT ?auto_177227 ?auto_177224 ) ( OBJ-AT ?auto_177228 ?auto_177224 ) ( not ( = ?auto_177225 ?auto_177227 ) ) ( not ( = ?auto_177225 ?auto_177228 ) ) ( not ( = ?auto_177226 ?auto_177227 ) ) ( not ( = ?auto_177226 ?auto_177228 ) ) ( not ( = ?auto_177227 ?auto_177228 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177225 ?auto_177226 ?auto_177224 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177257 - OBJ
      ?auto_177258 - OBJ
      ?auto_177259 - OBJ
      ?auto_177260 - OBJ
      ?auto_177256 - LOCATION
    )
    :vars
    (
      ?auto_177261 - TRUCK
      ?auto_177263 - LOCATION
      ?auto_177262 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_177257 ?auto_177261 ) ( TRUCK-AT ?auto_177261 ?auto_177263 ) ( IN-CITY ?auto_177263 ?auto_177262 ) ( IN-CITY ?auto_177256 ?auto_177262 ) ( not ( = ?auto_177256 ?auto_177263 ) ) ( OBJ-AT ?auto_177259 ?auto_177256 ) ( not ( = ?auto_177259 ?auto_177257 ) ) ( OBJ-AT ?auto_177258 ?auto_177256 ) ( OBJ-AT ?auto_177260 ?auto_177256 ) ( not ( = ?auto_177257 ?auto_177258 ) ) ( not ( = ?auto_177257 ?auto_177260 ) ) ( not ( = ?auto_177258 ?auto_177259 ) ) ( not ( = ?auto_177258 ?auto_177260 ) ) ( not ( = ?auto_177259 ?auto_177260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177259 ?auto_177257 ?auto_177256 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177322 - OBJ
      ?auto_177321 - LOCATION
    )
    :vars
    (
      ?auto_177323 - TRUCK
      ?auto_177326 - LOCATION
      ?auto_177325 - CITY
      ?auto_177324 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177323 ?auto_177326 ) ( IN-CITY ?auto_177326 ?auto_177325 ) ( IN-CITY ?auto_177321 ?auto_177325 ) ( not ( = ?auto_177321 ?auto_177326 ) ) ( OBJ-AT ?auto_177324 ?auto_177321 ) ( not ( = ?auto_177324 ?auto_177322 ) ) ( OBJ-AT ?auto_177322 ?auto_177326 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_177322 ?auto_177323 ?auto_177326 )
      ( DELIVER-2PKG ?auto_177324 ?auto_177322 ?auto_177321 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177328 - OBJ
      ?auto_177329 - OBJ
      ?auto_177327 - LOCATION
    )
    :vars
    (
      ?auto_177332 - TRUCK
      ?auto_177330 - LOCATION
      ?auto_177331 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177332 ?auto_177330 ) ( IN-CITY ?auto_177330 ?auto_177331 ) ( IN-CITY ?auto_177327 ?auto_177331 ) ( not ( = ?auto_177327 ?auto_177330 ) ) ( OBJ-AT ?auto_177328 ?auto_177327 ) ( not ( = ?auto_177328 ?auto_177329 ) ) ( OBJ-AT ?auto_177329 ?auto_177330 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177329 ?auto_177327 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177334 - OBJ
      ?auto_177335 - OBJ
      ?auto_177333 - LOCATION
    )
    :vars
    (
      ?auto_177336 - TRUCK
      ?auto_177338 - LOCATION
      ?auto_177337 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177336 ?auto_177338 ) ( IN-CITY ?auto_177338 ?auto_177337 ) ( IN-CITY ?auto_177333 ?auto_177337 ) ( not ( = ?auto_177333 ?auto_177338 ) ) ( OBJ-AT ?auto_177335 ?auto_177333 ) ( not ( = ?auto_177335 ?auto_177334 ) ) ( OBJ-AT ?auto_177334 ?auto_177338 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177335 ?auto_177334 ?auto_177333 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177347 - OBJ
      ?auto_177348 - OBJ
      ?auto_177349 - OBJ
      ?auto_177346 - LOCATION
    )
    :vars
    (
      ?auto_177350 - TRUCK
      ?auto_177352 - LOCATION
      ?auto_177351 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177350 ?auto_177352 ) ( IN-CITY ?auto_177352 ?auto_177351 ) ( IN-CITY ?auto_177346 ?auto_177351 ) ( not ( = ?auto_177346 ?auto_177352 ) ) ( OBJ-AT ?auto_177348 ?auto_177346 ) ( not ( = ?auto_177348 ?auto_177349 ) ) ( OBJ-AT ?auto_177349 ?auto_177352 ) ( OBJ-AT ?auto_177347 ?auto_177346 ) ( not ( = ?auto_177347 ?auto_177348 ) ) ( not ( = ?auto_177347 ?auto_177349 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177348 ?auto_177349 ?auto_177346 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177354 - OBJ
      ?auto_177355 - OBJ
      ?auto_177356 - OBJ
      ?auto_177353 - LOCATION
    )
    :vars
    (
      ?auto_177357 - TRUCK
      ?auto_177359 - LOCATION
      ?auto_177358 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177357 ?auto_177359 ) ( IN-CITY ?auto_177359 ?auto_177358 ) ( IN-CITY ?auto_177353 ?auto_177358 ) ( not ( = ?auto_177353 ?auto_177359 ) ) ( OBJ-AT ?auto_177354 ?auto_177353 ) ( not ( = ?auto_177354 ?auto_177355 ) ) ( OBJ-AT ?auto_177355 ?auto_177359 ) ( OBJ-AT ?auto_177356 ?auto_177353 ) ( not ( = ?auto_177354 ?auto_177356 ) ) ( not ( = ?auto_177355 ?auto_177356 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177354 ?auto_177355 ?auto_177353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177368 - OBJ
      ?auto_177369 - OBJ
      ?auto_177370 - OBJ
      ?auto_177367 - LOCATION
    )
    :vars
    (
      ?auto_177371 - TRUCK
      ?auto_177373 - LOCATION
      ?auto_177372 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177371 ?auto_177373 ) ( IN-CITY ?auto_177373 ?auto_177372 ) ( IN-CITY ?auto_177367 ?auto_177372 ) ( not ( = ?auto_177367 ?auto_177373 ) ) ( OBJ-AT ?auto_177369 ?auto_177367 ) ( not ( = ?auto_177369 ?auto_177368 ) ) ( OBJ-AT ?auto_177368 ?auto_177373 ) ( OBJ-AT ?auto_177370 ?auto_177367 ) ( not ( = ?auto_177368 ?auto_177370 ) ) ( not ( = ?auto_177369 ?auto_177370 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177369 ?auto_177368 ?auto_177367 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177397 - OBJ
      ?auto_177398 - OBJ
      ?auto_177399 - OBJ
      ?auto_177400 - OBJ
      ?auto_177396 - LOCATION
    )
    :vars
    (
      ?auto_177401 - TRUCK
      ?auto_177403 - LOCATION
      ?auto_177402 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177401 ?auto_177403 ) ( IN-CITY ?auto_177403 ?auto_177402 ) ( IN-CITY ?auto_177396 ?auto_177402 ) ( not ( = ?auto_177396 ?auto_177403 ) ) ( OBJ-AT ?auto_177397 ?auto_177396 ) ( not ( = ?auto_177397 ?auto_177400 ) ) ( OBJ-AT ?auto_177400 ?auto_177403 ) ( OBJ-AT ?auto_177398 ?auto_177396 ) ( OBJ-AT ?auto_177399 ?auto_177396 ) ( not ( = ?auto_177397 ?auto_177398 ) ) ( not ( = ?auto_177397 ?auto_177399 ) ) ( not ( = ?auto_177398 ?auto_177399 ) ) ( not ( = ?auto_177398 ?auto_177400 ) ) ( not ( = ?auto_177399 ?auto_177400 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177397 ?auto_177400 ?auto_177396 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177405 - OBJ
      ?auto_177406 - OBJ
      ?auto_177407 - OBJ
      ?auto_177408 - OBJ
      ?auto_177404 - LOCATION
    )
    :vars
    (
      ?auto_177409 - TRUCK
      ?auto_177411 - LOCATION
      ?auto_177410 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177409 ?auto_177411 ) ( IN-CITY ?auto_177411 ?auto_177410 ) ( IN-CITY ?auto_177404 ?auto_177410 ) ( not ( = ?auto_177404 ?auto_177411 ) ) ( OBJ-AT ?auto_177405 ?auto_177404 ) ( not ( = ?auto_177405 ?auto_177407 ) ) ( OBJ-AT ?auto_177407 ?auto_177411 ) ( OBJ-AT ?auto_177406 ?auto_177404 ) ( OBJ-AT ?auto_177408 ?auto_177404 ) ( not ( = ?auto_177405 ?auto_177406 ) ) ( not ( = ?auto_177405 ?auto_177408 ) ) ( not ( = ?auto_177406 ?auto_177407 ) ) ( not ( = ?auto_177406 ?auto_177408 ) ) ( not ( = ?auto_177407 ?auto_177408 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177405 ?auto_177407 ?auto_177404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177421 - OBJ
      ?auto_177422 - OBJ
      ?auto_177423 - OBJ
      ?auto_177424 - OBJ
      ?auto_177420 - LOCATION
    )
    :vars
    (
      ?auto_177425 - TRUCK
      ?auto_177427 - LOCATION
      ?auto_177426 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177425 ?auto_177427 ) ( IN-CITY ?auto_177427 ?auto_177426 ) ( IN-CITY ?auto_177420 ?auto_177426 ) ( not ( = ?auto_177420 ?auto_177427 ) ) ( OBJ-AT ?auto_177423 ?auto_177420 ) ( not ( = ?auto_177423 ?auto_177422 ) ) ( OBJ-AT ?auto_177422 ?auto_177427 ) ( OBJ-AT ?auto_177421 ?auto_177420 ) ( OBJ-AT ?auto_177424 ?auto_177420 ) ( not ( = ?auto_177421 ?auto_177422 ) ) ( not ( = ?auto_177421 ?auto_177423 ) ) ( not ( = ?auto_177421 ?auto_177424 ) ) ( not ( = ?auto_177422 ?auto_177424 ) ) ( not ( = ?auto_177423 ?auto_177424 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177423 ?auto_177422 ?auto_177420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177453 - OBJ
      ?auto_177454 - OBJ
      ?auto_177455 - OBJ
      ?auto_177456 - OBJ
      ?auto_177452 - LOCATION
    )
    :vars
    (
      ?auto_177457 - TRUCK
      ?auto_177459 - LOCATION
      ?auto_177458 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_177457 ?auto_177459 ) ( IN-CITY ?auto_177459 ?auto_177458 ) ( IN-CITY ?auto_177452 ?auto_177458 ) ( not ( = ?auto_177452 ?auto_177459 ) ) ( OBJ-AT ?auto_177456 ?auto_177452 ) ( not ( = ?auto_177456 ?auto_177453 ) ) ( OBJ-AT ?auto_177453 ?auto_177459 ) ( OBJ-AT ?auto_177454 ?auto_177452 ) ( OBJ-AT ?auto_177455 ?auto_177452 ) ( not ( = ?auto_177453 ?auto_177454 ) ) ( not ( = ?auto_177453 ?auto_177455 ) ) ( not ( = ?auto_177454 ?auto_177455 ) ) ( not ( = ?auto_177454 ?auto_177456 ) ) ( not ( = ?auto_177455 ?auto_177456 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177456 ?auto_177453 ?auto_177452 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177518 - OBJ
      ?auto_177517 - LOCATION
    )
    :vars
    (
      ?auto_177522 - LOCATION
      ?auto_177521 - CITY
      ?auto_177519 - OBJ
      ?auto_177520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177522 ?auto_177521 ) ( IN-CITY ?auto_177517 ?auto_177521 ) ( not ( = ?auto_177517 ?auto_177522 ) ) ( OBJ-AT ?auto_177519 ?auto_177517 ) ( not ( = ?auto_177519 ?auto_177518 ) ) ( OBJ-AT ?auto_177518 ?auto_177522 ) ( TRUCK-AT ?auto_177520 ?auto_177517 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_177520 ?auto_177517 ?auto_177522 ?auto_177521 )
      ( DELIVER-2PKG ?auto_177519 ?auto_177518 ?auto_177517 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177524 - OBJ
      ?auto_177525 - OBJ
      ?auto_177523 - LOCATION
    )
    :vars
    (
      ?auto_177528 - LOCATION
      ?auto_177527 - CITY
      ?auto_177526 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177528 ?auto_177527 ) ( IN-CITY ?auto_177523 ?auto_177527 ) ( not ( = ?auto_177523 ?auto_177528 ) ) ( OBJ-AT ?auto_177524 ?auto_177523 ) ( not ( = ?auto_177524 ?auto_177525 ) ) ( OBJ-AT ?auto_177525 ?auto_177528 ) ( TRUCK-AT ?auto_177526 ?auto_177523 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177525 ?auto_177523 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177530 - OBJ
      ?auto_177531 - OBJ
      ?auto_177529 - LOCATION
    )
    :vars
    (
      ?auto_177532 - LOCATION
      ?auto_177534 - CITY
      ?auto_177533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177532 ?auto_177534 ) ( IN-CITY ?auto_177529 ?auto_177534 ) ( not ( = ?auto_177529 ?auto_177532 ) ) ( OBJ-AT ?auto_177531 ?auto_177529 ) ( not ( = ?auto_177531 ?auto_177530 ) ) ( OBJ-AT ?auto_177530 ?auto_177532 ) ( TRUCK-AT ?auto_177533 ?auto_177529 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177531 ?auto_177530 ?auto_177529 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177543 - OBJ
      ?auto_177544 - OBJ
      ?auto_177545 - OBJ
      ?auto_177542 - LOCATION
    )
    :vars
    (
      ?auto_177546 - LOCATION
      ?auto_177548 - CITY
      ?auto_177547 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177546 ?auto_177548 ) ( IN-CITY ?auto_177542 ?auto_177548 ) ( not ( = ?auto_177542 ?auto_177546 ) ) ( OBJ-AT ?auto_177543 ?auto_177542 ) ( not ( = ?auto_177543 ?auto_177545 ) ) ( OBJ-AT ?auto_177545 ?auto_177546 ) ( TRUCK-AT ?auto_177547 ?auto_177542 ) ( OBJ-AT ?auto_177544 ?auto_177542 ) ( not ( = ?auto_177543 ?auto_177544 ) ) ( not ( = ?auto_177544 ?auto_177545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177543 ?auto_177545 ?auto_177542 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177550 - OBJ
      ?auto_177551 - OBJ
      ?auto_177552 - OBJ
      ?auto_177549 - LOCATION
    )
    :vars
    (
      ?auto_177553 - LOCATION
      ?auto_177555 - CITY
      ?auto_177554 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177553 ?auto_177555 ) ( IN-CITY ?auto_177549 ?auto_177555 ) ( not ( = ?auto_177549 ?auto_177553 ) ) ( OBJ-AT ?auto_177552 ?auto_177549 ) ( not ( = ?auto_177552 ?auto_177551 ) ) ( OBJ-AT ?auto_177551 ?auto_177553 ) ( TRUCK-AT ?auto_177554 ?auto_177549 ) ( OBJ-AT ?auto_177550 ?auto_177549 ) ( not ( = ?auto_177550 ?auto_177551 ) ) ( not ( = ?auto_177550 ?auto_177552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177552 ?auto_177551 ?auto_177549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_177564 - OBJ
      ?auto_177565 - OBJ
      ?auto_177566 - OBJ
      ?auto_177563 - LOCATION
    )
    :vars
    (
      ?auto_177567 - LOCATION
      ?auto_177569 - CITY
      ?auto_177568 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177567 ?auto_177569 ) ( IN-CITY ?auto_177563 ?auto_177569 ) ( not ( = ?auto_177563 ?auto_177567 ) ) ( OBJ-AT ?auto_177565 ?auto_177563 ) ( not ( = ?auto_177565 ?auto_177564 ) ) ( OBJ-AT ?auto_177564 ?auto_177567 ) ( TRUCK-AT ?auto_177568 ?auto_177563 ) ( OBJ-AT ?auto_177566 ?auto_177563 ) ( not ( = ?auto_177564 ?auto_177566 ) ) ( not ( = ?auto_177565 ?auto_177566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177565 ?auto_177564 ?auto_177563 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177593 - OBJ
      ?auto_177594 - OBJ
      ?auto_177595 - OBJ
      ?auto_177596 - OBJ
      ?auto_177592 - LOCATION
    )
    :vars
    (
      ?auto_177597 - LOCATION
      ?auto_177599 - CITY
      ?auto_177598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177597 ?auto_177599 ) ( IN-CITY ?auto_177592 ?auto_177599 ) ( not ( = ?auto_177592 ?auto_177597 ) ) ( OBJ-AT ?auto_177594 ?auto_177592 ) ( not ( = ?auto_177594 ?auto_177596 ) ) ( OBJ-AT ?auto_177596 ?auto_177597 ) ( TRUCK-AT ?auto_177598 ?auto_177592 ) ( OBJ-AT ?auto_177593 ?auto_177592 ) ( OBJ-AT ?auto_177595 ?auto_177592 ) ( not ( = ?auto_177593 ?auto_177594 ) ) ( not ( = ?auto_177593 ?auto_177595 ) ) ( not ( = ?auto_177593 ?auto_177596 ) ) ( not ( = ?auto_177594 ?auto_177595 ) ) ( not ( = ?auto_177595 ?auto_177596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177594 ?auto_177596 ?auto_177592 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177601 - OBJ
      ?auto_177602 - OBJ
      ?auto_177603 - OBJ
      ?auto_177604 - OBJ
      ?auto_177600 - LOCATION
    )
    :vars
    (
      ?auto_177605 - LOCATION
      ?auto_177607 - CITY
      ?auto_177606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177605 ?auto_177607 ) ( IN-CITY ?auto_177600 ?auto_177607 ) ( not ( = ?auto_177600 ?auto_177605 ) ) ( OBJ-AT ?auto_177604 ?auto_177600 ) ( not ( = ?auto_177604 ?auto_177603 ) ) ( OBJ-AT ?auto_177603 ?auto_177605 ) ( TRUCK-AT ?auto_177606 ?auto_177600 ) ( OBJ-AT ?auto_177601 ?auto_177600 ) ( OBJ-AT ?auto_177602 ?auto_177600 ) ( not ( = ?auto_177601 ?auto_177602 ) ) ( not ( = ?auto_177601 ?auto_177603 ) ) ( not ( = ?auto_177601 ?auto_177604 ) ) ( not ( = ?auto_177602 ?auto_177603 ) ) ( not ( = ?auto_177602 ?auto_177604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177604 ?auto_177603 ?auto_177600 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177617 - OBJ
      ?auto_177618 - OBJ
      ?auto_177619 - OBJ
      ?auto_177620 - OBJ
      ?auto_177616 - LOCATION
    )
    :vars
    (
      ?auto_177621 - LOCATION
      ?auto_177623 - CITY
      ?auto_177622 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177621 ?auto_177623 ) ( IN-CITY ?auto_177616 ?auto_177623 ) ( not ( = ?auto_177616 ?auto_177621 ) ) ( OBJ-AT ?auto_177620 ?auto_177616 ) ( not ( = ?auto_177620 ?auto_177618 ) ) ( OBJ-AT ?auto_177618 ?auto_177621 ) ( TRUCK-AT ?auto_177622 ?auto_177616 ) ( OBJ-AT ?auto_177617 ?auto_177616 ) ( OBJ-AT ?auto_177619 ?auto_177616 ) ( not ( = ?auto_177617 ?auto_177618 ) ) ( not ( = ?auto_177617 ?auto_177619 ) ) ( not ( = ?auto_177617 ?auto_177620 ) ) ( not ( = ?auto_177618 ?auto_177619 ) ) ( not ( = ?auto_177619 ?auto_177620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177620 ?auto_177618 ?auto_177616 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_177649 - OBJ
      ?auto_177650 - OBJ
      ?auto_177651 - OBJ
      ?auto_177652 - OBJ
      ?auto_177648 - LOCATION
    )
    :vars
    (
      ?auto_177653 - LOCATION
      ?auto_177655 - CITY
      ?auto_177654 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177653 ?auto_177655 ) ( IN-CITY ?auto_177648 ?auto_177655 ) ( not ( = ?auto_177648 ?auto_177653 ) ) ( OBJ-AT ?auto_177652 ?auto_177648 ) ( not ( = ?auto_177652 ?auto_177649 ) ) ( OBJ-AT ?auto_177649 ?auto_177653 ) ( TRUCK-AT ?auto_177654 ?auto_177648 ) ( OBJ-AT ?auto_177650 ?auto_177648 ) ( OBJ-AT ?auto_177651 ?auto_177648 ) ( not ( = ?auto_177649 ?auto_177650 ) ) ( not ( = ?auto_177649 ?auto_177651 ) ) ( not ( = ?auto_177650 ?auto_177651 ) ) ( not ( = ?auto_177650 ?auto_177652 ) ) ( not ( = ?auto_177651 ?auto_177652 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177652 ?auto_177649 ?auto_177648 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177714 - OBJ
      ?auto_177713 - LOCATION
    )
    :vars
    (
      ?auto_177715 - LOCATION
      ?auto_177718 - CITY
      ?auto_177717 - OBJ
      ?auto_177716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177715 ?auto_177718 ) ( IN-CITY ?auto_177713 ?auto_177718 ) ( not ( = ?auto_177713 ?auto_177715 ) ) ( not ( = ?auto_177717 ?auto_177714 ) ) ( OBJ-AT ?auto_177714 ?auto_177715 ) ( TRUCK-AT ?auto_177716 ?auto_177713 ) ( IN-TRUCK ?auto_177717 ?auto_177716 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177717 ?auto_177713 )
      ( DELIVER-2PKG ?auto_177717 ?auto_177714 ?auto_177713 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177720 - OBJ
      ?auto_177721 - OBJ
      ?auto_177719 - LOCATION
    )
    :vars
    (
      ?auto_177722 - LOCATION
      ?auto_177724 - CITY
      ?auto_177723 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177722 ?auto_177724 ) ( IN-CITY ?auto_177719 ?auto_177724 ) ( not ( = ?auto_177719 ?auto_177722 ) ) ( not ( = ?auto_177720 ?auto_177721 ) ) ( OBJ-AT ?auto_177721 ?auto_177722 ) ( TRUCK-AT ?auto_177723 ?auto_177719 ) ( IN-TRUCK ?auto_177720 ?auto_177723 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177721 ?auto_177719 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177726 - OBJ
      ?auto_177727 - OBJ
      ?auto_177725 - LOCATION
    )
    :vars
    (
      ?auto_177730 - LOCATION
      ?auto_177729 - CITY
      ?auto_177728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177730 ?auto_177729 ) ( IN-CITY ?auto_177725 ?auto_177729 ) ( not ( = ?auto_177725 ?auto_177730 ) ) ( not ( = ?auto_177727 ?auto_177726 ) ) ( OBJ-AT ?auto_177726 ?auto_177730 ) ( TRUCK-AT ?auto_177728 ?auto_177725 ) ( IN-TRUCK ?auto_177727 ?auto_177728 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177727 ?auto_177726 ?auto_177725 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_177910 - OBJ
      ?auto_177909 - LOCATION
    )
    :vars
    (
      ?auto_177914 - LOCATION
      ?auto_177913 - CITY
      ?auto_177911 - OBJ
      ?auto_177912 - TRUCK
      ?auto_177915 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_177914 ?auto_177913 ) ( IN-CITY ?auto_177909 ?auto_177913 ) ( not ( = ?auto_177909 ?auto_177914 ) ) ( not ( = ?auto_177911 ?auto_177910 ) ) ( OBJ-AT ?auto_177910 ?auto_177914 ) ( IN-TRUCK ?auto_177911 ?auto_177912 ) ( TRUCK-AT ?auto_177912 ?auto_177915 ) ( IN-CITY ?auto_177915 ?auto_177913 ) ( not ( = ?auto_177909 ?auto_177915 ) ) ( not ( = ?auto_177914 ?auto_177915 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_177912 ?auto_177915 ?auto_177909 ?auto_177913 )
      ( DELIVER-2PKG ?auto_177911 ?auto_177910 ?auto_177909 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177917 - OBJ
      ?auto_177918 - OBJ
      ?auto_177916 - LOCATION
    )
    :vars
    (
      ?auto_177921 - LOCATION
      ?auto_177919 - CITY
      ?auto_177920 - TRUCK
      ?auto_177922 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_177921 ?auto_177919 ) ( IN-CITY ?auto_177916 ?auto_177919 ) ( not ( = ?auto_177916 ?auto_177921 ) ) ( not ( = ?auto_177917 ?auto_177918 ) ) ( OBJ-AT ?auto_177918 ?auto_177921 ) ( IN-TRUCK ?auto_177917 ?auto_177920 ) ( TRUCK-AT ?auto_177920 ?auto_177922 ) ( IN-CITY ?auto_177922 ?auto_177919 ) ( not ( = ?auto_177916 ?auto_177922 ) ) ( not ( = ?auto_177921 ?auto_177922 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_177918 ?auto_177916 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_177924 - OBJ
      ?auto_177925 - OBJ
      ?auto_177923 - LOCATION
    )
    :vars
    (
      ?auto_177928 - LOCATION
      ?auto_177929 - CITY
      ?auto_177927 - TRUCK
      ?auto_177926 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_177928 ?auto_177929 ) ( IN-CITY ?auto_177923 ?auto_177929 ) ( not ( = ?auto_177923 ?auto_177928 ) ) ( not ( = ?auto_177925 ?auto_177924 ) ) ( OBJ-AT ?auto_177924 ?auto_177928 ) ( IN-TRUCK ?auto_177925 ?auto_177927 ) ( TRUCK-AT ?auto_177927 ?auto_177926 ) ( IN-CITY ?auto_177926 ?auto_177929 ) ( not ( = ?auto_177923 ?auto_177926 ) ) ( not ( = ?auto_177928 ?auto_177926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_177925 ?auto_177924 ?auto_177923 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_178132 - OBJ
      ?auto_178131 - LOCATION
    )
    :vars
    (
      ?auto_178135 - LOCATION
      ?auto_178136 - CITY
      ?auto_178137 - OBJ
      ?auto_178134 - TRUCK
      ?auto_178133 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_178135 ?auto_178136 ) ( IN-CITY ?auto_178131 ?auto_178136 ) ( not ( = ?auto_178131 ?auto_178135 ) ) ( not ( = ?auto_178137 ?auto_178132 ) ) ( OBJ-AT ?auto_178132 ?auto_178135 ) ( TRUCK-AT ?auto_178134 ?auto_178133 ) ( IN-CITY ?auto_178133 ?auto_178136 ) ( not ( = ?auto_178131 ?auto_178133 ) ) ( not ( = ?auto_178135 ?auto_178133 ) ) ( OBJ-AT ?auto_178137 ?auto_178133 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_178137 ?auto_178134 ?auto_178133 )
      ( DELIVER-2PKG ?auto_178137 ?auto_178132 ?auto_178131 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_178139 - OBJ
      ?auto_178140 - OBJ
      ?auto_178138 - LOCATION
    )
    :vars
    (
      ?auto_178142 - LOCATION
      ?auto_178141 - CITY
      ?auto_178144 - TRUCK
      ?auto_178143 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_178142 ?auto_178141 ) ( IN-CITY ?auto_178138 ?auto_178141 ) ( not ( = ?auto_178138 ?auto_178142 ) ) ( not ( = ?auto_178139 ?auto_178140 ) ) ( OBJ-AT ?auto_178140 ?auto_178142 ) ( TRUCK-AT ?auto_178144 ?auto_178143 ) ( IN-CITY ?auto_178143 ?auto_178141 ) ( not ( = ?auto_178138 ?auto_178143 ) ) ( not ( = ?auto_178142 ?auto_178143 ) ) ( OBJ-AT ?auto_178139 ?auto_178143 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_178140 ?auto_178138 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_178146 - OBJ
      ?auto_178147 - OBJ
      ?auto_178145 - LOCATION
    )
    :vars
    (
      ?auto_178149 - LOCATION
      ?auto_178151 - CITY
      ?auto_178148 - TRUCK
      ?auto_178150 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_178149 ?auto_178151 ) ( IN-CITY ?auto_178145 ?auto_178151 ) ( not ( = ?auto_178145 ?auto_178149 ) ) ( not ( = ?auto_178147 ?auto_178146 ) ) ( OBJ-AT ?auto_178146 ?auto_178149 ) ( TRUCK-AT ?auto_178148 ?auto_178150 ) ( IN-CITY ?auto_178150 ?auto_178151 ) ( not ( = ?auto_178145 ?auto_178150 ) ) ( not ( = ?auto_178149 ?auto_178150 ) ) ( OBJ-AT ?auto_178147 ?auto_178150 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_178147 ?auto_178146 ?auto_178145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179524 - OBJ
      ?auto_179525 - OBJ
      ?auto_179526 - OBJ
      ?auto_179523 - LOCATION
    )
    :vars
    (
      ?auto_179530 - TRUCK
      ?auto_179528 - LOCATION
      ?auto_179529 - CITY
      ?auto_179527 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179526 ?auto_179530 ) ( TRUCK-AT ?auto_179530 ?auto_179528 ) ( IN-CITY ?auto_179528 ?auto_179529 ) ( IN-CITY ?auto_179523 ?auto_179529 ) ( not ( = ?auto_179523 ?auto_179528 ) ) ( OBJ-AT ?auto_179527 ?auto_179523 ) ( not ( = ?auto_179527 ?auto_179526 ) ) ( OBJ-AT ?auto_179524 ?auto_179523 ) ( OBJ-AT ?auto_179525 ?auto_179523 ) ( not ( = ?auto_179524 ?auto_179525 ) ) ( not ( = ?auto_179524 ?auto_179526 ) ) ( not ( = ?auto_179524 ?auto_179527 ) ) ( not ( = ?auto_179525 ?auto_179526 ) ) ( not ( = ?auto_179525 ?auto_179527 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179527 ?auto_179526 ?auto_179523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179536 - OBJ
      ?auto_179537 - OBJ
      ?auto_179538 - OBJ
      ?auto_179535 - LOCATION
    )
    :vars
    (
      ?auto_179542 - TRUCK
      ?auto_179540 - LOCATION
      ?auto_179541 - CITY
      ?auto_179539 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179537 ?auto_179542 ) ( TRUCK-AT ?auto_179542 ?auto_179540 ) ( IN-CITY ?auto_179540 ?auto_179541 ) ( IN-CITY ?auto_179535 ?auto_179541 ) ( not ( = ?auto_179535 ?auto_179540 ) ) ( OBJ-AT ?auto_179539 ?auto_179535 ) ( not ( = ?auto_179539 ?auto_179537 ) ) ( OBJ-AT ?auto_179536 ?auto_179535 ) ( OBJ-AT ?auto_179538 ?auto_179535 ) ( not ( = ?auto_179536 ?auto_179537 ) ) ( not ( = ?auto_179536 ?auto_179538 ) ) ( not ( = ?auto_179536 ?auto_179539 ) ) ( not ( = ?auto_179537 ?auto_179538 ) ) ( not ( = ?auto_179538 ?auto_179539 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179539 ?auto_179537 ?auto_179535 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_179574 - OBJ
      ?auto_179575 - OBJ
      ?auto_179576 - OBJ
      ?auto_179573 - LOCATION
    )
    :vars
    (
      ?auto_179580 - TRUCK
      ?auto_179578 - LOCATION
      ?auto_179579 - CITY
      ?auto_179577 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179574 ?auto_179580 ) ( TRUCK-AT ?auto_179580 ?auto_179578 ) ( IN-CITY ?auto_179578 ?auto_179579 ) ( IN-CITY ?auto_179573 ?auto_179579 ) ( not ( = ?auto_179573 ?auto_179578 ) ) ( OBJ-AT ?auto_179577 ?auto_179573 ) ( not ( = ?auto_179577 ?auto_179574 ) ) ( OBJ-AT ?auto_179575 ?auto_179573 ) ( OBJ-AT ?auto_179576 ?auto_179573 ) ( not ( = ?auto_179574 ?auto_179575 ) ) ( not ( = ?auto_179574 ?auto_179576 ) ) ( not ( = ?auto_179575 ?auto_179576 ) ) ( not ( = ?auto_179575 ?auto_179577 ) ) ( not ( = ?auto_179576 ?auto_179577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179577 ?auto_179574 ?auto_179573 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179621 - OBJ
      ?auto_179622 - OBJ
      ?auto_179623 - OBJ
      ?auto_179624 - OBJ
      ?auto_179620 - LOCATION
    )
    :vars
    (
      ?auto_179627 - TRUCK
      ?auto_179625 - LOCATION
      ?auto_179626 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179624 ?auto_179627 ) ( TRUCK-AT ?auto_179627 ?auto_179625 ) ( IN-CITY ?auto_179625 ?auto_179626 ) ( IN-CITY ?auto_179620 ?auto_179626 ) ( not ( = ?auto_179620 ?auto_179625 ) ) ( OBJ-AT ?auto_179621 ?auto_179620 ) ( not ( = ?auto_179621 ?auto_179624 ) ) ( OBJ-AT ?auto_179622 ?auto_179620 ) ( OBJ-AT ?auto_179623 ?auto_179620 ) ( not ( = ?auto_179621 ?auto_179622 ) ) ( not ( = ?auto_179621 ?auto_179623 ) ) ( not ( = ?auto_179622 ?auto_179623 ) ) ( not ( = ?auto_179622 ?auto_179624 ) ) ( not ( = ?auto_179623 ?auto_179624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179621 ?auto_179624 ?auto_179620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179669 - OBJ
      ?auto_179670 - OBJ
      ?auto_179671 - OBJ
      ?auto_179672 - OBJ
      ?auto_179668 - LOCATION
    )
    :vars
    (
      ?auto_179675 - TRUCK
      ?auto_179673 - LOCATION
      ?auto_179674 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179671 ?auto_179675 ) ( TRUCK-AT ?auto_179675 ?auto_179673 ) ( IN-CITY ?auto_179673 ?auto_179674 ) ( IN-CITY ?auto_179668 ?auto_179674 ) ( not ( = ?auto_179668 ?auto_179673 ) ) ( OBJ-AT ?auto_179672 ?auto_179668 ) ( not ( = ?auto_179672 ?auto_179671 ) ) ( OBJ-AT ?auto_179669 ?auto_179668 ) ( OBJ-AT ?auto_179670 ?auto_179668 ) ( not ( = ?auto_179669 ?auto_179670 ) ) ( not ( = ?auto_179669 ?auto_179671 ) ) ( not ( = ?auto_179669 ?auto_179672 ) ) ( not ( = ?auto_179670 ?auto_179671 ) ) ( not ( = ?auto_179670 ?auto_179672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179672 ?auto_179671 ?auto_179668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179693 - OBJ
      ?auto_179694 - OBJ
      ?auto_179695 - OBJ
      ?auto_179696 - OBJ
      ?auto_179692 - LOCATION
    )
    :vars
    (
      ?auto_179699 - TRUCK
      ?auto_179697 - LOCATION
      ?auto_179698 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179694 ?auto_179699 ) ( TRUCK-AT ?auto_179699 ?auto_179697 ) ( IN-CITY ?auto_179697 ?auto_179698 ) ( IN-CITY ?auto_179692 ?auto_179698 ) ( not ( = ?auto_179692 ?auto_179697 ) ) ( OBJ-AT ?auto_179695 ?auto_179692 ) ( not ( = ?auto_179695 ?auto_179694 ) ) ( OBJ-AT ?auto_179693 ?auto_179692 ) ( OBJ-AT ?auto_179696 ?auto_179692 ) ( not ( = ?auto_179693 ?auto_179694 ) ) ( not ( = ?auto_179693 ?auto_179695 ) ) ( not ( = ?auto_179693 ?auto_179696 ) ) ( not ( = ?auto_179694 ?auto_179696 ) ) ( not ( = ?auto_179695 ?auto_179696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179695 ?auto_179694 ?auto_179692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179765 - OBJ
      ?auto_179766 - OBJ
      ?auto_179767 - OBJ
      ?auto_179768 - OBJ
      ?auto_179764 - LOCATION
    )
    :vars
    (
      ?auto_179771 - TRUCK
      ?auto_179769 - LOCATION
      ?auto_179770 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179768 ?auto_179771 ) ( TRUCK-AT ?auto_179771 ?auto_179769 ) ( IN-CITY ?auto_179769 ?auto_179770 ) ( IN-CITY ?auto_179764 ?auto_179770 ) ( not ( = ?auto_179764 ?auto_179769 ) ) ( OBJ-AT ?auto_179766 ?auto_179764 ) ( not ( = ?auto_179766 ?auto_179768 ) ) ( OBJ-AT ?auto_179765 ?auto_179764 ) ( OBJ-AT ?auto_179767 ?auto_179764 ) ( not ( = ?auto_179765 ?auto_179766 ) ) ( not ( = ?auto_179765 ?auto_179767 ) ) ( not ( = ?auto_179765 ?auto_179768 ) ) ( not ( = ?auto_179766 ?auto_179767 ) ) ( not ( = ?auto_179767 ?auto_179768 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179766 ?auto_179768 ?auto_179764 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179781 - OBJ
      ?auto_179782 - OBJ
      ?auto_179783 - OBJ
      ?auto_179784 - OBJ
      ?auto_179780 - LOCATION
    )
    :vars
    (
      ?auto_179787 - TRUCK
      ?auto_179785 - LOCATION
      ?auto_179786 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179783 ?auto_179787 ) ( TRUCK-AT ?auto_179787 ?auto_179785 ) ( IN-CITY ?auto_179785 ?auto_179786 ) ( IN-CITY ?auto_179780 ?auto_179786 ) ( not ( = ?auto_179780 ?auto_179785 ) ) ( OBJ-AT ?auto_179782 ?auto_179780 ) ( not ( = ?auto_179782 ?auto_179783 ) ) ( OBJ-AT ?auto_179781 ?auto_179780 ) ( OBJ-AT ?auto_179784 ?auto_179780 ) ( not ( = ?auto_179781 ?auto_179782 ) ) ( not ( = ?auto_179781 ?auto_179783 ) ) ( not ( = ?auto_179781 ?auto_179784 ) ) ( not ( = ?auto_179782 ?auto_179784 ) ) ( not ( = ?auto_179783 ?auto_179784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179782 ?auto_179783 ?auto_179780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179813 - OBJ
      ?auto_179814 - OBJ
      ?auto_179815 - OBJ
      ?auto_179816 - OBJ
      ?auto_179812 - LOCATION
    )
    :vars
    (
      ?auto_179820 - TRUCK
      ?auto_179818 - LOCATION
      ?auto_179819 - CITY
      ?auto_179817 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179816 ?auto_179820 ) ( TRUCK-AT ?auto_179820 ?auto_179818 ) ( IN-CITY ?auto_179818 ?auto_179819 ) ( IN-CITY ?auto_179812 ?auto_179819 ) ( not ( = ?auto_179812 ?auto_179818 ) ) ( OBJ-AT ?auto_179817 ?auto_179812 ) ( not ( = ?auto_179817 ?auto_179816 ) ) ( OBJ-AT ?auto_179813 ?auto_179812 ) ( OBJ-AT ?auto_179814 ?auto_179812 ) ( OBJ-AT ?auto_179815 ?auto_179812 ) ( not ( = ?auto_179813 ?auto_179814 ) ) ( not ( = ?auto_179813 ?auto_179815 ) ) ( not ( = ?auto_179813 ?auto_179816 ) ) ( not ( = ?auto_179813 ?auto_179817 ) ) ( not ( = ?auto_179814 ?auto_179815 ) ) ( not ( = ?auto_179814 ?auto_179816 ) ) ( not ( = ?auto_179814 ?auto_179817 ) ) ( not ( = ?auto_179815 ?auto_179816 ) ) ( not ( = ?auto_179815 ?auto_179817 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179817 ?auto_179816 ?auto_179812 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179830 - OBJ
      ?auto_179831 - OBJ
      ?auto_179832 - OBJ
      ?auto_179833 - OBJ
      ?auto_179829 - LOCATION
    )
    :vars
    (
      ?auto_179837 - TRUCK
      ?auto_179835 - LOCATION
      ?auto_179836 - CITY
      ?auto_179834 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179832 ?auto_179837 ) ( TRUCK-AT ?auto_179837 ?auto_179835 ) ( IN-CITY ?auto_179835 ?auto_179836 ) ( IN-CITY ?auto_179829 ?auto_179836 ) ( not ( = ?auto_179829 ?auto_179835 ) ) ( OBJ-AT ?auto_179834 ?auto_179829 ) ( not ( = ?auto_179834 ?auto_179832 ) ) ( OBJ-AT ?auto_179830 ?auto_179829 ) ( OBJ-AT ?auto_179831 ?auto_179829 ) ( OBJ-AT ?auto_179833 ?auto_179829 ) ( not ( = ?auto_179830 ?auto_179831 ) ) ( not ( = ?auto_179830 ?auto_179832 ) ) ( not ( = ?auto_179830 ?auto_179833 ) ) ( not ( = ?auto_179830 ?auto_179834 ) ) ( not ( = ?auto_179831 ?auto_179832 ) ) ( not ( = ?auto_179831 ?auto_179833 ) ) ( not ( = ?auto_179831 ?auto_179834 ) ) ( not ( = ?auto_179832 ?auto_179833 ) ) ( not ( = ?auto_179833 ?auto_179834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179834 ?auto_179832 ?auto_179829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179872 - OBJ
      ?auto_179873 - OBJ
      ?auto_179874 - OBJ
      ?auto_179875 - OBJ
      ?auto_179871 - LOCATION
    )
    :vars
    (
      ?auto_179878 - TRUCK
      ?auto_179876 - LOCATION
      ?auto_179877 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179873 ?auto_179878 ) ( TRUCK-AT ?auto_179878 ?auto_179876 ) ( IN-CITY ?auto_179876 ?auto_179877 ) ( IN-CITY ?auto_179871 ?auto_179877 ) ( not ( = ?auto_179871 ?auto_179876 ) ) ( OBJ-AT ?auto_179875 ?auto_179871 ) ( not ( = ?auto_179875 ?auto_179873 ) ) ( OBJ-AT ?auto_179872 ?auto_179871 ) ( OBJ-AT ?auto_179874 ?auto_179871 ) ( not ( = ?auto_179872 ?auto_179873 ) ) ( not ( = ?auto_179872 ?auto_179874 ) ) ( not ( = ?auto_179872 ?auto_179875 ) ) ( not ( = ?auto_179873 ?auto_179874 ) ) ( not ( = ?auto_179874 ?auto_179875 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179875 ?auto_179873 ?auto_179871 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179880 - OBJ
      ?auto_179881 - OBJ
      ?auto_179882 - OBJ
      ?auto_179883 - OBJ
      ?auto_179879 - LOCATION
    )
    :vars
    (
      ?auto_179887 - TRUCK
      ?auto_179885 - LOCATION
      ?auto_179886 - CITY
      ?auto_179884 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179881 ?auto_179887 ) ( TRUCK-AT ?auto_179887 ?auto_179885 ) ( IN-CITY ?auto_179885 ?auto_179886 ) ( IN-CITY ?auto_179879 ?auto_179886 ) ( not ( = ?auto_179879 ?auto_179885 ) ) ( OBJ-AT ?auto_179884 ?auto_179879 ) ( not ( = ?auto_179884 ?auto_179881 ) ) ( OBJ-AT ?auto_179880 ?auto_179879 ) ( OBJ-AT ?auto_179882 ?auto_179879 ) ( OBJ-AT ?auto_179883 ?auto_179879 ) ( not ( = ?auto_179880 ?auto_179881 ) ) ( not ( = ?auto_179880 ?auto_179882 ) ) ( not ( = ?auto_179880 ?auto_179883 ) ) ( not ( = ?auto_179880 ?auto_179884 ) ) ( not ( = ?auto_179881 ?auto_179882 ) ) ( not ( = ?auto_179881 ?auto_179883 ) ) ( not ( = ?auto_179882 ?auto_179883 ) ) ( not ( = ?auto_179882 ?auto_179884 ) ) ( not ( = ?auto_179883 ?auto_179884 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179884 ?auto_179881 ?auto_179879 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179924 - OBJ
      ?auto_179925 - OBJ
      ?auto_179926 - OBJ
      ?auto_179927 - OBJ
      ?auto_179923 - LOCATION
    )
    :vars
    (
      ?auto_179930 - TRUCK
      ?auto_179928 - LOCATION
      ?auto_179929 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179924 ?auto_179930 ) ( TRUCK-AT ?auto_179930 ?auto_179928 ) ( IN-CITY ?auto_179928 ?auto_179929 ) ( IN-CITY ?auto_179923 ?auto_179929 ) ( not ( = ?auto_179923 ?auto_179928 ) ) ( OBJ-AT ?auto_179927 ?auto_179923 ) ( not ( = ?auto_179927 ?auto_179924 ) ) ( OBJ-AT ?auto_179925 ?auto_179923 ) ( OBJ-AT ?auto_179926 ?auto_179923 ) ( not ( = ?auto_179924 ?auto_179925 ) ) ( not ( = ?auto_179924 ?auto_179926 ) ) ( not ( = ?auto_179925 ?auto_179926 ) ) ( not ( = ?auto_179925 ?auto_179927 ) ) ( not ( = ?auto_179926 ?auto_179927 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179927 ?auto_179924 ?auto_179923 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_179948 - OBJ
      ?auto_179949 - OBJ
      ?auto_179950 - OBJ
      ?auto_179951 - OBJ
      ?auto_179947 - LOCATION
    )
    :vars
    (
      ?auto_179954 - TRUCK
      ?auto_179952 - LOCATION
      ?auto_179953 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_179948 ?auto_179954 ) ( TRUCK-AT ?auto_179954 ?auto_179952 ) ( IN-CITY ?auto_179952 ?auto_179953 ) ( IN-CITY ?auto_179947 ?auto_179953 ) ( not ( = ?auto_179947 ?auto_179952 ) ) ( OBJ-AT ?auto_179949 ?auto_179947 ) ( not ( = ?auto_179949 ?auto_179948 ) ) ( OBJ-AT ?auto_179950 ?auto_179947 ) ( OBJ-AT ?auto_179951 ?auto_179947 ) ( not ( = ?auto_179948 ?auto_179950 ) ) ( not ( = ?auto_179948 ?auto_179951 ) ) ( not ( = ?auto_179949 ?auto_179950 ) ) ( not ( = ?auto_179949 ?auto_179951 ) ) ( not ( = ?auto_179950 ?auto_179951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_179949 ?auto_179948 ?auto_179947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180028 - OBJ
      ?auto_180029 - OBJ
      ?auto_180030 - OBJ
      ?auto_180031 - OBJ
      ?auto_180027 - LOCATION
    )
    :vars
    (
      ?auto_180035 - TRUCK
      ?auto_180033 - LOCATION
      ?auto_180034 - CITY
      ?auto_180032 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_180028 ?auto_180035 ) ( TRUCK-AT ?auto_180035 ?auto_180033 ) ( IN-CITY ?auto_180033 ?auto_180034 ) ( IN-CITY ?auto_180027 ?auto_180034 ) ( not ( = ?auto_180027 ?auto_180033 ) ) ( OBJ-AT ?auto_180032 ?auto_180027 ) ( not ( = ?auto_180032 ?auto_180028 ) ) ( OBJ-AT ?auto_180029 ?auto_180027 ) ( OBJ-AT ?auto_180030 ?auto_180027 ) ( OBJ-AT ?auto_180031 ?auto_180027 ) ( not ( = ?auto_180028 ?auto_180029 ) ) ( not ( = ?auto_180028 ?auto_180030 ) ) ( not ( = ?auto_180028 ?auto_180031 ) ) ( not ( = ?auto_180029 ?auto_180030 ) ) ( not ( = ?auto_180029 ?auto_180031 ) ) ( not ( = ?auto_180029 ?auto_180032 ) ) ( not ( = ?auto_180030 ?auto_180031 ) ) ( not ( = ?auto_180030 ?auto_180032 ) ) ( not ( = ?auto_180031 ?auto_180032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180032 ?auto_180028 ?auto_180027 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180179 - OBJ
      ?auto_180180 - OBJ
      ?auto_180181 - OBJ
      ?auto_180178 - LOCATION
    )
    :vars
    (
      ?auto_180183 - TRUCK
      ?auto_180182 - LOCATION
      ?auto_180184 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180183 ?auto_180182 ) ( IN-CITY ?auto_180182 ?auto_180184 ) ( IN-CITY ?auto_180178 ?auto_180184 ) ( not ( = ?auto_180178 ?auto_180182 ) ) ( OBJ-AT ?auto_180179 ?auto_180178 ) ( not ( = ?auto_180179 ?auto_180181 ) ) ( OBJ-AT ?auto_180181 ?auto_180182 ) ( OBJ-AT ?auto_180180 ?auto_180178 ) ( not ( = ?auto_180179 ?auto_180180 ) ) ( not ( = ?auto_180180 ?auto_180181 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180179 ?auto_180181 ?auto_180178 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180190 - OBJ
      ?auto_180191 - OBJ
      ?auto_180192 - OBJ
      ?auto_180189 - LOCATION
    )
    :vars
    (
      ?auto_180194 - TRUCK
      ?auto_180193 - LOCATION
      ?auto_180195 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180194 ?auto_180193 ) ( IN-CITY ?auto_180193 ?auto_180195 ) ( IN-CITY ?auto_180189 ?auto_180195 ) ( not ( = ?auto_180189 ?auto_180193 ) ) ( OBJ-AT ?auto_180192 ?auto_180189 ) ( not ( = ?auto_180192 ?auto_180191 ) ) ( OBJ-AT ?auto_180191 ?auto_180193 ) ( OBJ-AT ?auto_180190 ?auto_180189 ) ( not ( = ?auto_180190 ?auto_180191 ) ) ( not ( = ?auto_180190 ?auto_180192 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180192 ?auto_180191 ?auto_180189 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180212 - OBJ
      ?auto_180213 - OBJ
      ?auto_180214 - OBJ
      ?auto_180211 - LOCATION
    )
    :vars
    (
      ?auto_180216 - TRUCK
      ?auto_180215 - LOCATION
      ?auto_180218 - CITY
      ?auto_180217 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180216 ?auto_180215 ) ( IN-CITY ?auto_180215 ?auto_180218 ) ( IN-CITY ?auto_180211 ?auto_180218 ) ( not ( = ?auto_180211 ?auto_180215 ) ) ( OBJ-AT ?auto_180217 ?auto_180211 ) ( not ( = ?auto_180217 ?auto_180214 ) ) ( OBJ-AT ?auto_180214 ?auto_180215 ) ( OBJ-AT ?auto_180212 ?auto_180211 ) ( OBJ-AT ?auto_180213 ?auto_180211 ) ( not ( = ?auto_180212 ?auto_180213 ) ) ( not ( = ?auto_180212 ?auto_180214 ) ) ( not ( = ?auto_180212 ?auto_180217 ) ) ( not ( = ?auto_180213 ?auto_180214 ) ) ( not ( = ?auto_180213 ?auto_180217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180217 ?auto_180214 ?auto_180211 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180224 - OBJ
      ?auto_180225 - OBJ
      ?auto_180226 - OBJ
      ?auto_180223 - LOCATION
    )
    :vars
    (
      ?auto_180228 - TRUCK
      ?auto_180227 - LOCATION
      ?auto_180230 - CITY
      ?auto_180229 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180228 ?auto_180227 ) ( IN-CITY ?auto_180227 ?auto_180230 ) ( IN-CITY ?auto_180223 ?auto_180230 ) ( not ( = ?auto_180223 ?auto_180227 ) ) ( OBJ-AT ?auto_180229 ?auto_180223 ) ( not ( = ?auto_180229 ?auto_180225 ) ) ( OBJ-AT ?auto_180225 ?auto_180227 ) ( OBJ-AT ?auto_180224 ?auto_180223 ) ( OBJ-AT ?auto_180226 ?auto_180223 ) ( not ( = ?auto_180224 ?auto_180225 ) ) ( not ( = ?auto_180224 ?auto_180226 ) ) ( not ( = ?auto_180224 ?auto_180229 ) ) ( not ( = ?auto_180225 ?auto_180226 ) ) ( not ( = ?auto_180226 ?auto_180229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180229 ?auto_180225 ?auto_180223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180240 - OBJ
      ?auto_180241 - OBJ
      ?auto_180242 - OBJ
      ?auto_180239 - LOCATION
    )
    :vars
    (
      ?auto_180244 - TRUCK
      ?auto_180243 - LOCATION
      ?auto_180245 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180244 ?auto_180243 ) ( IN-CITY ?auto_180243 ?auto_180245 ) ( IN-CITY ?auto_180239 ?auto_180245 ) ( not ( = ?auto_180239 ?auto_180243 ) ) ( OBJ-AT ?auto_180242 ?auto_180239 ) ( not ( = ?auto_180242 ?auto_180240 ) ) ( OBJ-AT ?auto_180240 ?auto_180243 ) ( OBJ-AT ?auto_180241 ?auto_180239 ) ( not ( = ?auto_180240 ?auto_180241 ) ) ( not ( = ?auto_180241 ?auto_180242 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180242 ?auto_180240 ?auto_180239 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180262 - OBJ
      ?auto_180263 - OBJ
      ?auto_180264 - OBJ
      ?auto_180261 - LOCATION
    )
    :vars
    (
      ?auto_180266 - TRUCK
      ?auto_180265 - LOCATION
      ?auto_180268 - CITY
      ?auto_180267 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180266 ?auto_180265 ) ( IN-CITY ?auto_180265 ?auto_180268 ) ( IN-CITY ?auto_180261 ?auto_180268 ) ( not ( = ?auto_180261 ?auto_180265 ) ) ( OBJ-AT ?auto_180267 ?auto_180261 ) ( not ( = ?auto_180267 ?auto_180262 ) ) ( OBJ-AT ?auto_180262 ?auto_180265 ) ( OBJ-AT ?auto_180263 ?auto_180261 ) ( OBJ-AT ?auto_180264 ?auto_180261 ) ( not ( = ?auto_180262 ?auto_180263 ) ) ( not ( = ?auto_180262 ?auto_180264 ) ) ( not ( = ?auto_180263 ?auto_180264 ) ) ( not ( = ?auto_180263 ?auto_180267 ) ) ( not ( = ?auto_180264 ?auto_180267 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180267 ?auto_180262 ?auto_180261 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180301 - OBJ
      ?auto_180302 - OBJ
      ?auto_180303 - OBJ
      ?auto_180304 - OBJ
      ?auto_180300 - LOCATION
    )
    :vars
    (
      ?auto_180306 - TRUCK
      ?auto_180305 - LOCATION
      ?auto_180307 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180306 ?auto_180305 ) ( IN-CITY ?auto_180305 ?auto_180307 ) ( IN-CITY ?auto_180300 ?auto_180307 ) ( not ( = ?auto_180300 ?auto_180305 ) ) ( OBJ-AT ?auto_180303 ?auto_180300 ) ( not ( = ?auto_180303 ?auto_180304 ) ) ( OBJ-AT ?auto_180304 ?auto_180305 ) ( OBJ-AT ?auto_180301 ?auto_180300 ) ( OBJ-AT ?auto_180302 ?auto_180300 ) ( not ( = ?auto_180301 ?auto_180302 ) ) ( not ( = ?auto_180301 ?auto_180303 ) ) ( not ( = ?auto_180301 ?auto_180304 ) ) ( not ( = ?auto_180302 ?auto_180303 ) ) ( not ( = ?auto_180302 ?auto_180304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180303 ?auto_180304 ?auto_180300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180381 - OBJ
      ?auto_180382 - OBJ
      ?auto_180383 - OBJ
      ?auto_180384 - OBJ
      ?auto_180380 - LOCATION
    )
    :vars
    (
      ?auto_180386 - TRUCK
      ?auto_180385 - LOCATION
      ?auto_180387 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180386 ?auto_180385 ) ( IN-CITY ?auto_180385 ?auto_180387 ) ( IN-CITY ?auto_180380 ?auto_180387 ) ( not ( = ?auto_180380 ?auto_180385 ) ) ( OBJ-AT ?auto_180381 ?auto_180380 ) ( not ( = ?auto_180381 ?auto_180382 ) ) ( OBJ-AT ?auto_180382 ?auto_180385 ) ( OBJ-AT ?auto_180383 ?auto_180380 ) ( OBJ-AT ?auto_180384 ?auto_180380 ) ( not ( = ?auto_180381 ?auto_180383 ) ) ( not ( = ?auto_180381 ?auto_180384 ) ) ( not ( = ?auto_180382 ?auto_180383 ) ) ( not ( = ?auto_180382 ?auto_180384 ) ) ( not ( = ?auto_180383 ?auto_180384 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180381 ?auto_180382 ?auto_180380 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180405 - OBJ
      ?auto_180406 - OBJ
      ?auto_180407 - OBJ
      ?auto_180408 - OBJ
      ?auto_180404 - LOCATION
    )
    :vars
    (
      ?auto_180410 - TRUCK
      ?auto_180409 - LOCATION
      ?auto_180411 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180410 ?auto_180409 ) ( IN-CITY ?auto_180409 ?auto_180411 ) ( IN-CITY ?auto_180404 ?auto_180411 ) ( not ( = ?auto_180404 ?auto_180409 ) ) ( OBJ-AT ?auto_180408 ?auto_180404 ) ( not ( = ?auto_180408 ?auto_180406 ) ) ( OBJ-AT ?auto_180406 ?auto_180409 ) ( OBJ-AT ?auto_180405 ?auto_180404 ) ( OBJ-AT ?auto_180407 ?auto_180404 ) ( not ( = ?auto_180405 ?auto_180406 ) ) ( not ( = ?auto_180405 ?auto_180407 ) ) ( not ( = ?auto_180405 ?auto_180408 ) ) ( not ( = ?auto_180406 ?auto_180407 ) ) ( not ( = ?auto_180407 ?auto_180408 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180408 ?auto_180406 ?auto_180404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180461 - OBJ
      ?auto_180462 - OBJ
      ?auto_180463 - OBJ
      ?auto_180464 - OBJ
      ?auto_180460 - LOCATION
    )
    :vars
    (
      ?auto_180466 - TRUCK
      ?auto_180465 - LOCATION
      ?auto_180467 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180466 ?auto_180465 ) ( IN-CITY ?auto_180465 ?auto_180467 ) ( IN-CITY ?auto_180460 ?auto_180467 ) ( not ( = ?auto_180460 ?auto_180465 ) ) ( OBJ-AT ?auto_180462 ?auto_180460 ) ( not ( = ?auto_180462 ?auto_180464 ) ) ( OBJ-AT ?auto_180464 ?auto_180465 ) ( OBJ-AT ?auto_180461 ?auto_180460 ) ( OBJ-AT ?auto_180463 ?auto_180460 ) ( not ( = ?auto_180461 ?auto_180462 ) ) ( not ( = ?auto_180461 ?auto_180463 ) ) ( not ( = ?auto_180461 ?auto_180464 ) ) ( not ( = ?auto_180462 ?auto_180463 ) ) ( not ( = ?auto_180463 ?auto_180464 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180462 ?auto_180464 ?auto_180460 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180469 - OBJ
      ?auto_180470 - OBJ
      ?auto_180471 - OBJ
      ?auto_180472 - OBJ
      ?auto_180468 - LOCATION
    )
    :vars
    (
      ?auto_180474 - TRUCK
      ?auto_180473 - LOCATION
      ?auto_180475 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180474 ?auto_180473 ) ( IN-CITY ?auto_180473 ?auto_180475 ) ( IN-CITY ?auto_180468 ?auto_180475 ) ( not ( = ?auto_180468 ?auto_180473 ) ) ( OBJ-AT ?auto_180472 ?auto_180468 ) ( not ( = ?auto_180472 ?auto_180471 ) ) ( OBJ-AT ?auto_180471 ?auto_180473 ) ( OBJ-AT ?auto_180469 ?auto_180468 ) ( OBJ-AT ?auto_180470 ?auto_180468 ) ( not ( = ?auto_180469 ?auto_180470 ) ) ( not ( = ?auto_180469 ?auto_180471 ) ) ( not ( = ?auto_180469 ?auto_180472 ) ) ( not ( = ?auto_180470 ?auto_180471 ) ) ( not ( = ?auto_180470 ?auto_180472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180472 ?auto_180471 ?auto_180468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180477 - OBJ
      ?auto_180478 - OBJ
      ?auto_180479 - OBJ
      ?auto_180480 - OBJ
      ?auto_180476 - LOCATION
    )
    :vars
    (
      ?auto_180482 - TRUCK
      ?auto_180481 - LOCATION
      ?auto_180483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180482 ?auto_180481 ) ( IN-CITY ?auto_180481 ?auto_180483 ) ( IN-CITY ?auto_180476 ?auto_180483 ) ( not ( = ?auto_180476 ?auto_180481 ) ) ( OBJ-AT ?auto_180478 ?auto_180476 ) ( not ( = ?auto_180478 ?auto_180479 ) ) ( OBJ-AT ?auto_180479 ?auto_180481 ) ( OBJ-AT ?auto_180477 ?auto_180476 ) ( OBJ-AT ?auto_180480 ?auto_180476 ) ( not ( = ?auto_180477 ?auto_180478 ) ) ( not ( = ?auto_180477 ?auto_180479 ) ) ( not ( = ?auto_180477 ?auto_180480 ) ) ( not ( = ?auto_180478 ?auto_180480 ) ) ( not ( = ?auto_180479 ?auto_180480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180478 ?auto_180479 ?auto_180476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180501 - OBJ
      ?auto_180502 - OBJ
      ?auto_180503 - OBJ
      ?auto_180504 - OBJ
      ?auto_180500 - LOCATION
    )
    :vars
    (
      ?auto_180506 - TRUCK
      ?auto_180505 - LOCATION
      ?auto_180508 - CITY
      ?auto_180507 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180506 ?auto_180505 ) ( IN-CITY ?auto_180505 ?auto_180508 ) ( IN-CITY ?auto_180500 ?auto_180508 ) ( not ( = ?auto_180500 ?auto_180505 ) ) ( OBJ-AT ?auto_180507 ?auto_180500 ) ( not ( = ?auto_180507 ?auto_180504 ) ) ( OBJ-AT ?auto_180504 ?auto_180505 ) ( OBJ-AT ?auto_180501 ?auto_180500 ) ( OBJ-AT ?auto_180502 ?auto_180500 ) ( OBJ-AT ?auto_180503 ?auto_180500 ) ( not ( = ?auto_180501 ?auto_180502 ) ) ( not ( = ?auto_180501 ?auto_180503 ) ) ( not ( = ?auto_180501 ?auto_180504 ) ) ( not ( = ?auto_180501 ?auto_180507 ) ) ( not ( = ?auto_180502 ?auto_180503 ) ) ( not ( = ?auto_180502 ?auto_180504 ) ) ( not ( = ?auto_180502 ?auto_180507 ) ) ( not ( = ?auto_180503 ?auto_180504 ) ) ( not ( = ?auto_180503 ?auto_180507 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180507 ?auto_180504 ?auto_180500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180518 - OBJ
      ?auto_180519 - OBJ
      ?auto_180520 - OBJ
      ?auto_180521 - OBJ
      ?auto_180517 - LOCATION
    )
    :vars
    (
      ?auto_180523 - TRUCK
      ?auto_180522 - LOCATION
      ?auto_180525 - CITY
      ?auto_180524 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180523 ?auto_180522 ) ( IN-CITY ?auto_180522 ?auto_180525 ) ( IN-CITY ?auto_180517 ?auto_180525 ) ( not ( = ?auto_180517 ?auto_180522 ) ) ( OBJ-AT ?auto_180524 ?auto_180517 ) ( not ( = ?auto_180524 ?auto_180520 ) ) ( OBJ-AT ?auto_180520 ?auto_180522 ) ( OBJ-AT ?auto_180518 ?auto_180517 ) ( OBJ-AT ?auto_180519 ?auto_180517 ) ( OBJ-AT ?auto_180521 ?auto_180517 ) ( not ( = ?auto_180518 ?auto_180519 ) ) ( not ( = ?auto_180518 ?auto_180520 ) ) ( not ( = ?auto_180518 ?auto_180521 ) ) ( not ( = ?auto_180518 ?auto_180524 ) ) ( not ( = ?auto_180519 ?auto_180520 ) ) ( not ( = ?auto_180519 ?auto_180521 ) ) ( not ( = ?auto_180519 ?auto_180524 ) ) ( not ( = ?auto_180520 ?auto_180521 ) ) ( not ( = ?auto_180521 ?auto_180524 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180524 ?auto_180520 ?auto_180517 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180568 - OBJ
      ?auto_180569 - OBJ
      ?auto_180570 - OBJ
      ?auto_180571 - OBJ
      ?auto_180567 - LOCATION
    )
    :vars
    (
      ?auto_180573 - TRUCK
      ?auto_180572 - LOCATION
      ?auto_180575 - CITY
      ?auto_180574 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180573 ?auto_180572 ) ( IN-CITY ?auto_180572 ?auto_180575 ) ( IN-CITY ?auto_180567 ?auto_180575 ) ( not ( = ?auto_180567 ?auto_180572 ) ) ( OBJ-AT ?auto_180574 ?auto_180567 ) ( not ( = ?auto_180574 ?auto_180569 ) ) ( OBJ-AT ?auto_180569 ?auto_180572 ) ( OBJ-AT ?auto_180568 ?auto_180567 ) ( OBJ-AT ?auto_180570 ?auto_180567 ) ( OBJ-AT ?auto_180571 ?auto_180567 ) ( not ( = ?auto_180568 ?auto_180569 ) ) ( not ( = ?auto_180568 ?auto_180570 ) ) ( not ( = ?auto_180568 ?auto_180571 ) ) ( not ( = ?auto_180568 ?auto_180574 ) ) ( not ( = ?auto_180569 ?auto_180570 ) ) ( not ( = ?auto_180569 ?auto_180571 ) ) ( not ( = ?auto_180570 ?auto_180571 ) ) ( not ( = ?auto_180570 ?auto_180574 ) ) ( not ( = ?auto_180571 ?auto_180574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180574 ?auto_180569 ?auto_180567 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180612 - OBJ
      ?auto_180613 - OBJ
      ?auto_180614 - OBJ
      ?auto_180615 - OBJ
      ?auto_180611 - LOCATION
    )
    :vars
    (
      ?auto_180617 - TRUCK
      ?auto_180616 - LOCATION
      ?auto_180618 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180617 ?auto_180616 ) ( IN-CITY ?auto_180616 ?auto_180618 ) ( IN-CITY ?auto_180611 ?auto_180618 ) ( not ( = ?auto_180611 ?auto_180616 ) ) ( OBJ-AT ?auto_180614 ?auto_180611 ) ( not ( = ?auto_180614 ?auto_180612 ) ) ( OBJ-AT ?auto_180612 ?auto_180616 ) ( OBJ-AT ?auto_180613 ?auto_180611 ) ( OBJ-AT ?auto_180615 ?auto_180611 ) ( not ( = ?auto_180612 ?auto_180613 ) ) ( not ( = ?auto_180612 ?auto_180615 ) ) ( not ( = ?auto_180613 ?auto_180614 ) ) ( not ( = ?auto_180613 ?auto_180615 ) ) ( not ( = ?auto_180614 ?auto_180615 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180614 ?auto_180612 ?auto_180611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180636 - OBJ
      ?auto_180637 - OBJ
      ?auto_180638 - OBJ
      ?auto_180639 - OBJ
      ?auto_180635 - LOCATION
    )
    :vars
    (
      ?auto_180641 - TRUCK
      ?auto_180640 - LOCATION
      ?auto_180642 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180641 ?auto_180640 ) ( IN-CITY ?auto_180640 ?auto_180642 ) ( IN-CITY ?auto_180635 ?auto_180642 ) ( not ( = ?auto_180635 ?auto_180640 ) ) ( OBJ-AT ?auto_180637 ?auto_180635 ) ( not ( = ?auto_180637 ?auto_180636 ) ) ( OBJ-AT ?auto_180636 ?auto_180640 ) ( OBJ-AT ?auto_180638 ?auto_180635 ) ( OBJ-AT ?auto_180639 ?auto_180635 ) ( not ( = ?auto_180636 ?auto_180638 ) ) ( not ( = ?auto_180636 ?auto_180639 ) ) ( not ( = ?auto_180637 ?auto_180638 ) ) ( not ( = ?auto_180637 ?auto_180639 ) ) ( not ( = ?auto_180638 ?auto_180639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180637 ?auto_180636 ?auto_180635 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180716 - OBJ
      ?auto_180717 - OBJ
      ?auto_180718 - OBJ
      ?auto_180719 - OBJ
      ?auto_180715 - LOCATION
    )
    :vars
    (
      ?auto_180721 - TRUCK
      ?auto_180720 - LOCATION
      ?auto_180723 - CITY
      ?auto_180722 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_180721 ?auto_180720 ) ( IN-CITY ?auto_180720 ?auto_180723 ) ( IN-CITY ?auto_180715 ?auto_180723 ) ( not ( = ?auto_180715 ?auto_180720 ) ) ( OBJ-AT ?auto_180722 ?auto_180715 ) ( not ( = ?auto_180722 ?auto_180716 ) ) ( OBJ-AT ?auto_180716 ?auto_180720 ) ( OBJ-AT ?auto_180717 ?auto_180715 ) ( OBJ-AT ?auto_180718 ?auto_180715 ) ( OBJ-AT ?auto_180719 ?auto_180715 ) ( not ( = ?auto_180716 ?auto_180717 ) ) ( not ( = ?auto_180716 ?auto_180718 ) ) ( not ( = ?auto_180716 ?auto_180719 ) ) ( not ( = ?auto_180717 ?auto_180718 ) ) ( not ( = ?auto_180717 ?auto_180719 ) ) ( not ( = ?auto_180717 ?auto_180722 ) ) ( not ( = ?auto_180718 ?auto_180719 ) ) ( not ( = ?auto_180718 ?auto_180722 ) ) ( not ( = ?auto_180719 ?auto_180722 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180722 ?auto_180716 ?auto_180715 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180867 - OBJ
      ?auto_180868 - OBJ
      ?auto_180869 - OBJ
      ?auto_180866 - LOCATION
    )
    :vars
    (
      ?auto_180872 - LOCATION
      ?auto_180871 - CITY
      ?auto_180870 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180872 ?auto_180871 ) ( IN-CITY ?auto_180866 ?auto_180871 ) ( not ( = ?auto_180866 ?auto_180872 ) ) ( OBJ-AT ?auto_180868 ?auto_180866 ) ( not ( = ?auto_180868 ?auto_180869 ) ) ( OBJ-AT ?auto_180869 ?auto_180872 ) ( TRUCK-AT ?auto_180870 ?auto_180866 ) ( OBJ-AT ?auto_180867 ?auto_180866 ) ( not ( = ?auto_180867 ?auto_180868 ) ) ( not ( = ?auto_180867 ?auto_180869 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180868 ?auto_180869 ?auto_180866 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180900 - OBJ
      ?auto_180901 - OBJ
      ?auto_180902 - OBJ
      ?auto_180899 - LOCATION
    )
    :vars
    (
      ?auto_180906 - LOCATION
      ?auto_180905 - CITY
      ?auto_180903 - OBJ
      ?auto_180904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180906 ?auto_180905 ) ( IN-CITY ?auto_180899 ?auto_180905 ) ( not ( = ?auto_180899 ?auto_180906 ) ) ( OBJ-AT ?auto_180903 ?auto_180899 ) ( not ( = ?auto_180903 ?auto_180902 ) ) ( OBJ-AT ?auto_180902 ?auto_180906 ) ( TRUCK-AT ?auto_180904 ?auto_180899 ) ( OBJ-AT ?auto_180900 ?auto_180899 ) ( OBJ-AT ?auto_180901 ?auto_180899 ) ( not ( = ?auto_180900 ?auto_180901 ) ) ( not ( = ?auto_180900 ?auto_180902 ) ) ( not ( = ?auto_180900 ?auto_180903 ) ) ( not ( = ?auto_180901 ?auto_180902 ) ) ( not ( = ?auto_180901 ?auto_180903 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180903 ?auto_180902 ?auto_180899 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180912 - OBJ
      ?auto_180913 - OBJ
      ?auto_180914 - OBJ
      ?auto_180911 - LOCATION
    )
    :vars
    (
      ?auto_180918 - LOCATION
      ?auto_180917 - CITY
      ?auto_180915 - OBJ
      ?auto_180916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180918 ?auto_180917 ) ( IN-CITY ?auto_180911 ?auto_180917 ) ( not ( = ?auto_180911 ?auto_180918 ) ) ( OBJ-AT ?auto_180915 ?auto_180911 ) ( not ( = ?auto_180915 ?auto_180913 ) ) ( OBJ-AT ?auto_180913 ?auto_180918 ) ( TRUCK-AT ?auto_180916 ?auto_180911 ) ( OBJ-AT ?auto_180912 ?auto_180911 ) ( OBJ-AT ?auto_180914 ?auto_180911 ) ( not ( = ?auto_180912 ?auto_180913 ) ) ( not ( = ?auto_180912 ?auto_180914 ) ) ( not ( = ?auto_180912 ?auto_180915 ) ) ( not ( = ?auto_180913 ?auto_180914 ) ) ( not ( = ?auto_180914 ?auto_180915 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180915 ?auto_180913 ?auto_180911 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_180950 - OBJ
      ?auto_180951 - OBJ
      ?auto_180952 - OBJ
      ?auto_180949 - LOCATION
    )
    :vars
    (
      ?auto_180956 - LOCATION
      ?auto_180955 - CITY
      ?auto_180953 - OBJ
      ?auto_180954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180956 ?auto_180955 ) ( IN-CITY ?auto_180949 ?auto_180955 ) ( not ( = ?auto_180949 ?auto_180956 ) ) ( OBJ-AT ?auto_180953 ?auto_180949 ) ( not ( = ?auto_180953 ?auto_180950 ) ) ( OBJ-AT ?auto_180950 ?auto_180956 ) ( TRUCK-AT ?auto_180954 ?auto_180949 ) ( OBJ-AT ?auto_180951 ?auto_180949 ) ( OBJ-AT ?auto_180952 ?auto_180949 ) ( not ( = ?auto_180950 ?auto_180951 ) ) ( not ( = ?auto_180950 ?auto_180952 ) ) ( not ( = ?auto_180951 ?auto_180952 ) ) ( not ( = ?auto_180951 ?auto_180953 ) ) ( not ( = ?auto_180952 ?auto_180953 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180953 ?auto_180950 ?auto_180949 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_180989 - OBJ
      ?auto_180990 - OBJ
      ?auto_180991 - OBJ
      ?auto_180992 - OBJ
      ?auto_180988 - LOCATION
    )
    :vars
    (
      ?auto_180995 - LOCATION
      ?auto_180994 - CITY
      ?auto_180993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_180995 ?auto_180994 ) ( IN-CITY ?auto_180988 ?auto_180994 ) ( not ( = ?auto_180988 ?auto_180995 ) ) ( OBJ-AT ?auto_180989 ?auto_180988 ) ( not ( = ?auto_180989 ?auto_180992 ) ) ( OBJ-AT ?auto_180992 ?auto_180995 ) ( TRUCK-AT ?auto_180993 ?auto_180988 ) ( OBJ-AT ?auto_180990 ?auto_180988 ) ( OBJ-AT ?auto_180991 ?auto_180988 ) ( not ( = ?auto_180989 ?auto_180990 ) ) ( not ( = ?auto_180989 ?auto_180991 ) ) ( not ( = ?auto_180990 ?auto_180991 ) ) ( not ( = ?auto_180990 ?auto_180992 ) ) ( not ( = ?auto_180991 ?auto_180992 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_180989 ?auto_180992 ?auto_180988 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181005 - OBJ
      ?auto_181006 - OBJ
      ?auto_181007 - OBJ
      ?auto_181008 - OBJ
      ?auto_181004 - LOCATION
    )
    :vars
    (
      ?auto_181011 - LOCATION
      ?auto_181010 - CITY
      ?auto_181009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181011 ?auto_181010 ) ( IN-CITY ?auto_181004 ?auto_181010 ) ( not ( = ?auto_181004 ?auto_181011 ) ) ( OBJ-AT ?auto_181005 ?auto_181004 ) ( not ( = ?auto_181005 ?auto_181007 ) ) ( OBJ-AT ?auto_181007 ?auto_181011 ) ( TRUCK-AT ?auto_181009 ?auto_181004 ) ( OBJ-AT ?auto_181006 ?auto_181004 ) ( OBJ-AT ?auto_181008 ?auto_181004 ) ( not ( = ?auto_181005 ?auto_181006 ) ) ( not ( = ?auto_181005 ?auto_181008 ) ) ( not ( = ?auto_181006 ?auto_181007 ) ) ( not ( = ?auto_181006 ?auto_181008 ) ) ( not ( = ?auto_181007 ?auto_181008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181005 ?auto_181007 ?auto_181004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181029 - OBJ
      ?auto_181030 - OBJ
      ?auto_181031 - OBJ
      ?auto_181032 - OBJ
      ?auto_181028 - LOCATION
    )
    :vars
    (
      ?auto_181035 - LOCATION
      ?auto_181034 - CITY
      ?auto_181033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181035 ?auto_181034 ) ( IN-CITY ?auto_181028 ?auto_181034 ) ( not ( = ?auto_181028 ?auto_181035 ) ) ( OBJ-AT ?auto_181031 ?auto_181028 ) ( not ( = ?auto_181031 ?auto_181032 ) ) ( OBJ-AT ?auto_181032 ?auto_181035 ) ( TRUCK-AT ?auto_181033 ?auto_181028 ) ( OBJ-AT ?auto_181029 ?auto_181028 ) ( OBJ-AT ?auto_181030 ?auto_181028 ) ( not ( = ?auto_181029 ?auto_181030 ) ) ( not ( = ?auto_181029 ?auto_181031 ) ) ( not ( = ?auto_181029 ?auto_181032 ) ) ( not ( = ?auto_181030 ?auto_181031 ) ) ( not ( = ?auto_181030 ?auto_181032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181031 ?auto_181032 ?auto_181028 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181069 - OBJ
      ?auto_181070 - OBJ
      ?auto_181071 - OBJ
      ?auto_181072 - OBJ
      ?auto_181068 - LOCATION
    )
    :vars
    (
      ?auto_181075 - LOCATION
      ?auto_181074 - CITY
      ?auto_181073 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181075 ?auto_181074 ) ( IN-CITY ?auto_181068 ?auto_181074 ) ( not ( = ?auto_181068 ?auto_181075 ) ) ( OBJ-AT ?auto_181071 ?auto_181068 ) ( not ( = ?auto_181071 ?auto_181070 ) ) ( OBJ-AT ?auto_181070 ?auto_181075 ) ( TRUCK-AT ?auto_181073 ?auto_181068 ) ( OBJ-AT ?auto_181069 ?auto_181068 ) ( OBJ-AT ?auto_181072 ?auto_181068 ) ( not ( = ?auto_181069 ?auto_181070 ) ) ( not ( = ?auto_181069 ?auto_181071 ) ) ( not ( = ?auto_181069 ?auto_181072 ) ) ( not ( = ?auto_181070 ?auto_181072 ) ) ( not ( = ?auto_181071 ?auto_181072 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181071 ?auto_181070 ?auto_181068 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181077 - OBJ
      ?auto_181078 - OBJ
      ?auto_181079 - OBJ
      ?auto_181080 - OBJ
      ?auto_181076 - LOCATION
    )
    :vars
    (
      ?auto_181083 - LOCATION
      ?auto_181082 - CITY
      ?auto_181081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181083 ?auto_181082 ) ( IN-CITY ?auto_181076 ?auto_181082 ) ( not ( = ?auto_181076 ?auto_181083 ) ) ( OBJ-AT ?auto_181077 ?auto_181076 ) ( not ( = ?auto_181077 ?auto_181078 ) ) ( OBJ-AT ?auto_181078 ?auto_181083 ) ( TRUCK-AT ?auto_181081 ?auto_181076 ) ( OBJ-AT ?auto_181079 ?auto_181076 ) ( OBJ-AT ?auto_181080 ?auto_181076 ) ( not ( = ?auto_181077 ?auto_181079 ) ) ( not ( = ?auto_181077 ?auto_181080 ) ) ( not ( = ?auto_181078 ?auto_181079 ) ) ( not ( = ?auto_181078 ?auto_181080 ) ) ( not ( = ?auto_181079 ?auto_181080 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181077 ?auto_181078 ?auto_181076 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181157 - OBJ
      ?auto_181158 - OBJ
      ?auto_181159 - OBJ
      ?auto_181160 - OBJ
      ?auto_181156 - LOCATION
    )
    :vars
    (
      ?auto_181163 - LOCATION
      ?auto_181162 - CITY
      ?auto_181161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181163 ?auto_181162 ) ( IN-CITY ?auto_181156 ?auto_181162 ) ( not ( = ?auto_181156 ?auto_181163 ) ) ( OBJ-AT ?auto_181158 ?auto_181156 ) ( not ( = ?auto_181158 ?auto_181159 ) ) ( OBJ-AT ?auto_181159 ?auto_181163 ) ( TRUCK-AT ?auto_181161 ?auto_181156 ) ( OBJ-AT ?auto_181157 ?auto_181156 ) ( OBJ-AT ?auto_181160 ?auto_181156 ) ( not ( = ?auto_181157 ?auto_181158 ) ) ( not ( = ?auto_181157 ?auto_181159 ) ) ( not ( = ?auto_181157 ?auto_181160 ) ) ( not ( = ?auto_181158 ?auto_181160 ) ) ( not ( = ?auto_181159 ?auto_181160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181158 ?auto_181159 ?auto_181156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181189 - OBJ
      ?auto_181190 - OBJ
      ?auto_181191 - OBJ
      ?auto_181192 - OBJ
      ?auto_181188 - LOCATION
    )
    :vars
    (
      ?auto_181196 - LOCATION
      ?auto_181195 - CITY
      ?auto_181193 - OBJ
      ?auto_181194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181196 ?auto_181195 ) ( IN-CITY ?auto_181188 ?auto_181195 ) ( not ( = ?auto_181188 ?auto_181196 ) ) ( OBJ-AT ?auto_181193 ?auto_181188 ) ( not ( = ?auto_181193 ?auto_181192 ) ) ( OBJ-AT ?auto_181192 ?auto_181196 ) ( TRUCK-AT ?auto_181194 ?auto_181188 ) ( OBJ-AT ?auto_181189 ?auto_181188 ) ( OBJ-AT ?auto_181190 ?auto_181188 ) ( OBJ-AT ?auto_181191 ?auto_181188 ) ( not ( = ?auto_181189 ?auto_181190 ) ) ( not ( = ?auto_181189 ?auto_181191 ) ) ( not ( = ?auto_181189 ?auto_181192 ) ) ( not ( = ?auto_181189 ?auto_181193 ) ) ( not ( = ?auto_181190 ?auto_181191 ) ) ( not ( = ?auto_181190 ?auto_181192 ) ) ( not ( = ?auto_181190 ?auto_181193 ) ) ( not ( = ?auto_181191 ?auto_181192 ) ) ( not ( = ?auto_181191 ?auto_181193 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181193 ?auto_181192 ?auto_181188 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181206 - OBJ
      ?auto_181207 - OBJ
      ?auto_181208 - OBJ
      ?auto_181209 - OBJ
      ?auto_181205 - LOCATION
    )
    :vars
    (
      ?auto_181213 - LOCATION
      ?auto_181212 - CITY
      ?auto_181210 - OBJ
      ?auto_181211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181213 ?auto_181212 ) ( IN-CITY ?auto_181205 ?auto_181212 ) ( not ( = ?auto_181205 ?auto_181213 ) ) ( OBJ-AT ?auto_181210 ?auto_181205 ) ( not ( = ?auto_181210 ?auto_181208 ) ) ( OBJ-AT ?auto_181208 ?auto_181213 ) ( TRUCK-AT ?auto_181211 ?auto_181205 ) ( OBJ-AT ?auto_181206 ?auto_181205 ) ( OBJ-AT ?auto_181207 ?auto_181205 ) ( OBJ-AT ?auto_181209 ?auto_181205 ) ( not ( = ?auto_181206 ?auto_181207 ) ) ( not ( = ?auto_181206 ?auto_181208 ) ) ( not ( = ?auto_181206 ?auto_181209 ) ) ( not ( = ?auto_181206 ?auto_181210 ) ) ( not ( = ?auto_181207 ?auto_181208 ) ) ( not ( = ?auto_181207 ?auto_181209 ) ) ( not ( = ?auto_181207 ?auto_181210 ) ) ( not ( = ?auto_181208 ?auto_181209 ) ) ( not ( = ?auto_181209 ?auto_181210 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181210 ?auto_181208 ?auto_181205 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181256 - OBJ
      ?auto_181257 - OBJ
      ?auto_181258 - OBJ
      ?auto_181259 - OBJ
      ?auto_181255 - LOCATION
    )
    :vars
    (
      ?auto_181263 - LOCATION
      ?auto_181262 - CITY
      ?auto_181260 - OBJ
      ?auto_181261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181263 ?auto_181262 ) ( IN-CITY ?auto_181255 ?auto_181262 ) ( not ( = ?auto_181255 ?auto_181263 ) ) ( OBJ-AT ?auto_181260 ?auto_181255 ) ( not ( = ?auto_181260 ?auto_181257 ) ) ( OBJ-AT ?auto_181257 ?auto_181263 ) ( TRUCK-AT ?auto_181261 ?auto_181255 ) ( OBJ-AT ?auto_181256 ?auto_181255 ) ( OBJ-AT ?auto_181258 ?auto_181255 ) ( OBJ-AT ?auto_181259 ?auto_181255 ) ( not ( = ?auto_181256 ?auto_181257 ) ) ( not ( = ?auto_181256 ?auto_181258 ) ) ( not ( = ?auto_181256 ?auto_181259 ) ) ( not ( = ?auto_181256 ?auto_181260 ) ) ( not ( = ?auto_181257 ?auto_181258 ) ) ( not ( = ?auto_181257 ?auto_181259 ) ) ( not ( = ?auto_181258 ?auto_181259 ) ) ( not ( = ?auto_181258 ?auto_181260 ) ) ( not ( = ?auto_181259 ?auto_181260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181260 ?auto_181257 ?auto_181255 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181300 - OBJ
      ?auto_181301 - OBJ
      ?auto_181302 - OBJ
      ?auto_181303 - OBJ
      ?auto_181299 - LOCATION
    )
    :vars
    (
      ?auto_181306 - LOCATION
      ?auto_181305 - CITY
      ?auto_181304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181306 ?auto_181305 ) ( IN-CITY ?auto_181299 ?auto_181305 ) ( not ( = ?auto_181299 ?auto_181306 ) ) ( OBJ-AT ?auto_181302 ?auto_181299 ) ( not ( = ?auto_181302 ?auto_181300 ) ) ( OBJ-AT ?auto_181300 ?auto_181306 ) ( TRUCK-AT ?auto_181304 ?auto_181299 ) ( OBJ-AT ?auto_181301 ?auto_181299 ) ( OBJ-AT ?auto_181303 ?auto_181299 ) ( not ( = ?auto_181300 ?auto_181301 ) ) ( not ( = ?auto_181300 ?auto_181303 ) ) ( not ( = ?auto_181301 ?auto_181302 ) ) ( not ( = ?auto_181301 ?auto_181303 ) ) ( not ( = ?auto_181302 ?auto_181303 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181302 ?auto_181300 ?auto_181299 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181332 - OBJ
      ?auto_181333 - OBJ
      ?auto_181334 - OBJ
      ?auto_181335 - OBJ
      ?auto_181331 - LOCATION
    )
    :vars
    (
      ?auto_181338 - LOCATION
      ?auto_181337 - CITY
      ?auto_181336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181338 ?auto_181337 ) ( IN-CITY ?auto_181331 ?auto_181337 ) ( not ( = ?auto_181331 ?auto_181338 ) ) ( OBJ-AT ?auto_181333 ?auto_181331 ) ( not ( = ?auto_181333 ?auto_181332 ) ) ( OBJ-AT ?auto_181332 ?auto_181338 ) ( TRUCK-AT ?auto_181336 ?auto_181331 ) ( OBJ-AT ?auto_181334 ?auto_181331 ) ( OBJ-AT ?auto_181335 ?auto_181331 ) ( not ( = ?auto_181332 ?auto_181334 ) ) ( not ( = ?auto_181332 ?auto_181335 ) ) ( not ( = ?auto_181333 ?auto_181334 ) ) ( not ( = ?auto_181333 ?auto_181335 ) ) ( not ( = ?auto_181334 ?auto_181335 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181333 ?auto_181332 ?auto_181331 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_181404 - OBJ
      ?auto_181405 - OBJ
      ?auto_181406 - OBJ
      ?auto_181407 - OBJ
      ?auto_181403 - LOCATION
    )
    :vars
    (
      ?auto_181411 - LOCATION
      ?auto_181410 - CITY
      ?auto_181408 - OBJ
      ?auto_181409 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181411 ?auto_181410 ) ( IN-CITY ?auto_181403 ?auto_181410 ) ( not ( = ?auto_181403 ?auto_181411 ) ) ( OBJ-AT ?auto_181408 ?auto_181403 ) ( not ( = ?auto_181408 ?auto_181404 ) ) ( OBJ-AT ?auto_181404 ?auto_181411 ) ( TRUCK-AT ?auto_181409 ?auto_181403 ) ( OBJ-AT ?auto_181405 ?auto_181403 ) ( OBJ-AT ?auto_181406 ?auto_181403 ) ( OBJ-AT ?auto_181407 ?auto_181403 ) ( not ( = ?auto_181404 ?auto_181405 ) ) ( not ( = ?auto_181404 ?auto_181406 ) ) ( not ( = ?auto_181404 ?auto_181407 ) ) ( not ( = ?auto_181405 ?auto_181406 ) ) ( not ( = ?auto_181405 ?auto_181407 ) ) ( not ( = ?auto_181405 ?auto_181408 ) ) ( not ( = ?auto_181406 ?auto_181407 ) ) ( not ( = ?auto_181406 ?auto_181408 ) ) ( not ( = ?auto_181407 ?auto_181408 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_181408 ?auto_181404 ?auto_181403 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_182228 - OBJ
      ?auto_182227 - LOCATION
    )
    :vars
    (
      ?auto_182232 - LOCATION
      ?auto_182229 - CITY
      ?auto_182231 - OBJ
      ?auto_182230 - TRUCK
      ?auto_182233 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182232 ?auto_182229 ) ( IN-CITY ?auto_182227 ?auto_182229 ) ( not ( = ?auto_182227 ?auto_182232 ) ) ( OBJ-AT ?auto_182231 ?auto_182227 ) ( not ( = ?auto_182231 ?auto_182228 ) ) ( OBJ-AT ?auto_182228 ?auto_182232 ) ( TRUCK-AT ?auto_182230 ?auto_182233 ) ( IN-CITY ?auto_182233 ?auto_182229 ) ( not ( = ?auto_182227 ?auto_182233 ) ) ( not ( = ?auto_182232 ?auto_182233 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_182230 ?auto_182233 ?auto_182227 ?auto_182229 )
      ( DELIVER-2PKG ?auto_182231 ?auto_182228 ?auto_182227 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_182235 - OBJ
      ?auto_182236 - OBJ
      ?auto_182234 - LOCATION
    )
    :vars
    (
      ?auto_182240 - LOCATION
      ?auto_182238 - CITY
      ?auto_182237 - TRUCK
      ?auto_182239 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182240 ?auto_182238 ) ( IN-CITY ?auto_182234 ?auto_182238 ) ( not ( = ?auto_182234 ?auto_182240 ) ) ( OBJ-AT ?auto_182235 ?auto_182234 ) ( not ( = ?auto_182235 ?auto_182236 ) ) ( OBJ-AT ?auto_182236 ?auto_182240 ) ( TRUCK-AT ?auto_182237 ?auto_182239 ) ( IN-CITY ?auto_182239 ?auto_182238 ) ( not ( = ?auto_182234 ?auto_182239 ) ) ( not ( = ?auto_182240 ?auto_182239 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_182236 ?auto_182234 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_182250 - OBJ
      ?auto_182251 - OBJ
      ?auto_182249 - LOCATION
    )
    :vars
    (
      ?auto_182254 - LOCATION
      ?auto_182255 - CITY
      ?auto_182252 - TRUCK
      ?auto_182253 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182254 ?auto_182255 ) ( IN-CITY ?auto_182249 ?auto_182255 ) ( not ( = ?auto_182249 ?auto_182254 ) ) ( OBJ-AT ?auto_182251 ?auto_182249 ) ( not ( = ?auto_182251 ?auto_182250 ) ) ( OBJ-AT ?auto_182250 ?auto_182254 ) ( TRUCK-AT ?auto_182252 ?auto_182253 ) ( IN-CITY ?auto_182253 ?auto_182255 ) ( not ( = ?auto_182249 ?auto_182253 ) ) ( not ( = ?auto_182254 ?auto_182253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182251 ?auto_182250 ?auto_182249 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_182273 - OBJ
      ?auto_182274 - OBJ
      ?auto_182275 - OBJ
      ?auto_182272 - LOCATION
    )
    :vars
    (
      ?auto_182278 - LOCATION
      ?auto_182279 - CITY
      ?auto_182276 - TRUCK
      ?auto_182277 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182278 ?auto_182279 ) ( IN-CITY ?auto_182272 ?auto_182279 ) ( not ( = ?auto_182272 ?auto_182278 ) ) ( OBJ-AT ?auto_182273 ?auto_182272 ) ( not ( = ?auto_182273 ?auto_182275 ) ) ( OBJ-AT ?auto_182275 ?auto_182278 ) ( TRUCK-AT ?auto_182276 ?auto_182277 ) ( IN-CITY ?auto_182277 ?auto_182279 ) ( not ( = ?auto_182272 ?auto_182277 ) ) ( not ( = ?auto_182278 ?auto_182277 ) ) ( OBJ-AT ?auto_182274 ?auto_182272 ) ( not ( = ?auto_182273 ?auto_182274 ) ) ( not ( = ?auto_182274 ?auto_182275 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182273 ?auto_182275 ?auto_182272 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_182289 - OBJ
      ?auto_182290 - OBJ
      ?auto_182291 - OBJ
      ?auto_182288 - LOCATION
    )
    :vars
    (
      ?auto_182294 - LOCATION
      ?auto_182295 - CITY
      ?auto_182292 - TRUCK
      ?auto_182293 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182294 ?auto_182295 ) ( IN-CITY ?auto_182288 ?auto_182295 ) ( not ( = ?auto_182288 ?auto_182294 ) ) ( OBJ-AT ?auto_182291 ?auto_182288 ) ( not ( = ?auto_182291 ?auto_182290 ) ) ( OBJ-AT ?auto_182290 ?auto_182294 ) ( TRUCK-AT ?auto_182292 ?auto_182293 ) ( IN-CITY ?auto_182293 ?auto_182295 ) ( not ( = ?auto_182288 ?auto_182293 ) ) ( not ( = ?auto_182294 ?auto_182293 ) ) ( OBJ-AT ?auto_182289 ?auto_182288 ) ( not ( = ?auto_182289 ?auto_182290 ) ) ( not ( = ?auto_182289 ?auto_182291 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182291 ?auto_182290 ?auto_182288 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_182356 - OBJ
      ?auto_182357 - OBJ
      ?auto_182358 - OBJ
      ?auto_182355 - LOCATION
    )
    :vars
    (
      ?auto_182361 - LOCATION
      ?auto_182362 - CITY
      ?auto_182359 - TRUCK
      ?auto_182360 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182361 ?auto_182362 ) ( IN-CITY ?auto_182355 ?auto_182362 ) ( not ( = ?auto_182355 ?auto_182361 ) ) ( OBJ-AT ?auto_182358 ?auto_182355 ) ( not ( = ?auto_182358 ?auto_182356 ) ) ( OBJ-AT ?auto_182356 ?auto_182361 ) ( TRUCK-AT ?auto_182359 ?auto_182360 ) ( IN-CITY ?auto_182360 ?auto_182362 ) ( not ( = ?auto_182355 ?auto_182360 ) ) ( not ( = ?auto_182361 ?auto_182360 ) ) ( OBJ-AT ?auto_182357 ?auto_182355 ) ( not ( = ?auto_182356 ?auto_182357 ) ) ( not ( = ?auto_182357 ?auto_182358 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182358 ?auto_182356 ?auto_182355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182432 - OBJ
      ?auto_182433 - OBJ
      ?auto_182434 - OBJ
      ?auto_182435 - OBJ
      ?auto_182431 - LOCATION
    )
    :vars
    (
      ?auto_182438 - LOCATION
      ?auto_182439 - CITY
      ?auto_182436 - TRUCK
      ?auto_182437 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182438 ?auto_182439 ) ( IN-CITY ?auto_182431 ?auto_182439 ) ( not ( = ?auto_182431 ?auto_182438 ) ) ( OBJ-AT ?auto_182432 ?auto_182431 ) ( not ( = ?auto_182432 ?auto_182435 ) ) ( OBJ-AT ?auto_182435 ?auto_182438 ) ( TRUCK-AT ?auto_182436 ?auto_182437 ) ( IN-CITY ?auto_182437 ?auto_182439 ) ( not ( = ?auto_182431 ?auto_182437 ) ) ( not ( = ?auto_182438 ?auto_182437 ) ) ( OBJ-AT ?auto_182433 ?auto_182431 ) ( OBJ-AT ?auto_182434 ?auto_182431 ) ( not ( = ?auto_182432 ?auto_182433 ) ) ( not ( = ?auto_182432 ?auto_182434 ) ) ( not ( = ?auto_182433 ?auto_182434 ) ) ( not ( = ?auto_182433 ?auto_182435 ) ) ( not ( = ?auto_182434 ?auto_182435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182432 ?auto_182435 ?auto_182431 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182450 - OBJ
      ?auto_182451 - OBJ
      ?auto_182452 - OBJ
      ?auto_182453 - OBJ
      ?auto_182449 - LOCATION
    )
    :vars
    (
      ?auto_182456 - LOCATION
      ?auto_182457 - CITY
      ?auto_182454 - TRUCK
      ?auto_182455 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182456 ?auto_182457 ) ( IN-CITY ?auto_182449 ?auto_182457 ) ( not ( = ?auto_182449 ?auto_182456 ) ) ( OBJ-AT ?auto_182453 ?auto_182449 ) ( not ( = ?auto_182453 ?auto_182452 ) ) ( OBJ-AT ?auto_182452 ?auto_182456 ) ( TRUCK-AT ?auto_182454 ?auto_182455 ) ( IN-CITY ?auto_182455 ?auto_182457 ) ( not ( = ?auto_182449 ?auto_182455 ) ) ( not ( = ?auto_182456 ?auto_182455 ) ) ( OBJ-AT ?auto_182450 ?auto_182449 ) ( OBJ-AT ?auto_182451 ?auto_182449 ) ( not ( = ?auto_182450 ?auto_182451 ) ) ( not ( = ?auto_182450 ?auto_182452 ) ) ( not ( = ?auto_182450 ?auto_182453 ) ) ( not ( = ?auto_182451 ?auto_182452 ) ) ( not ( = ?auto_182451 ?auto_182453 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182453 ?auto_182452 ?auto_182449 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182522 - OBJ
      ?auto_182523 - OBJ
      ?auto_182524 - OBJ
      ?auto_182525 - OBJ
      ?auto_182521 - LOCATION
    )
    :vars
    (
      ?auto_182528 - LOCATION
      ?auto_182529 - CITY
      ?auto_182526 - TRUCK
      ?auto_182527 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182528 ?auto_182529 ) ( IN-CITY ?auto_182521 ?auto_182529 ) ( not ( = ?auto_182521 ?auto_182528 ) ) ( OBJ-AT ?auto_182522 ?auto_182521 ) ( not ( = ?auto_182522 ?auto_182523 ) ) ( OBJ-AT ?auto_182523 ?auto_182528 ) ( TRUCK-AT ?auto_182526 ?auto_182527 ) ( IN-CITY ?auto_182527 ?auto_182529 ) ( not ( = ?auto_182521 ?auto_182527 ) ) ( not ( = ?auto_182528 ?auto_182527 ) ) ( OBJ-AT ?auto_182524 ?auto_182521 ) ( OBJ-AT ?auto_182525 ?auto_182521 ) ( not ( = ?auto_182522 ?auto_182524 ) ) ( not ( = ?auto_182522 ?auto_182525 ) ) ( not ( = ?auto_182523 ?auto_182524 ) ) ( not ( = ?auto_182523 ?auto_182525 ) ) ( not ( = ?auto_182524 ?auto_182525 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182522 ?auto_182523 ?auto_182521 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_182781 - OBJ
      ?auto_182782 - OBJ
      ?auto_182783 - OBJ
      ?auto_182784 - OBJ
      ?auto_182780 - LOCATION
    )
    :vars
    (
      ?auto_182787 - LOCATION
      ?auto_182788 - CITY
      ?auto_182785 - TRUCK
      ?auto_182786 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_182787 ?auto_182788 ) ( IN-CITY ?auto_182780 ?auto_182788 ) ( not ( = ?auto_182780 ?auto_182787 ) ) ( OBJ-AT ?auto_182783 ?auto_182780 ) ( not ( = ?auto_182783 ?auto_182781 ) ) ( OBJ-AT ?auto_182781 ?auto_182787 ) ( TRUCK-AT ?auto_182785 ?auto_182786 ) ( IN-CITY ?auto_182786 ?auto_182788 ) ( not ( = ?auto_182780 ?auto_182786 ) ) ( not ( = ?auto_182787 ?auto_182786 ) ) ( OBJ-AT ?auto_182782 ?auto_182780 ) ( OBJ-AT ?auto_182784 ?auto_182780 ) ( not ( = ?auto_182781 ?auto_182782 ) ) ( not ( = ?auto_182781 ?auto_182784 ) ) ( not ( = ?auto_182782 ?auto_182783 ) ) ( not ( = ?auto_182782 ?auto_182784 ) ) ( not ( = ?auto_182783 ?auto_182784 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_182783 ?auto_182781 ?auto_182780 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183223 - OBJ
      ?auto_183224 - OBJ
      ?auto_183225 - OBJ
      ?auto_183226 - OBJ
      ?auto_183222 - LOCATION
    )
    :vars
    (
      ?auto_183228 - LOCATION
      ?auto_183230 - CITY
      ?auto_183229 - TRUCK
      ?auto_183227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_183228 ?auto_183230 ) ( IN-CITY ?auto_183222 ?auto_183230 ) ( not ( = ?auto_183222 ?auto_183228 ) ) ( OBJ-AT ?auto_183225 ?auto_183222 ) ( not ( = ?auto_183225 ?auto_183226 ) ) ( OBJ-AT ?auto_183226 ?auto_183228 ) ( TRUCK-AT ?auto_183229 ?auto_183227 ) ( IN-CITY ?auto_183227 ?auto_183230 ) ( not ( = ?auto_183222 ?auto_183227 ) ) ( not ( = ?auto_183228 ?auto_183227 ) ) ( OBJ-AT ?auto_183223 ?auto_183222 ) ( OBJ-AT ?auto_183224 ?auto_183222 ) ( not ( = ?auto_183223 ?auto_183224 ) ) ( not ( = ?auto_183223 ?auto_183225 ) ) ( not ( = ?auto_183223 ?auto_183226 ) ) ( not ( = ?auto_183224 ?auto_183225 ) ) ( not ( = ?auto_183224 ?auto_183226 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183225 ?auto_183226 ?auto_183222 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_183313 - OBJ
      ?auto_183314 - OBJ
      ?auto_183315 - OBJ
      ?auto_183316 - OBJ
      ?auto_183312 - LOCATION
    )
    :vars
    (
      ?auto_183318 - LOCATION
      ?auto_183320 - CITY
      ?auto_183319 - TRUCK
      ?auto_183317 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_183318 ?auto_183320 ) ( IN-CITY ?auto_183312 ?auto_183320 ) ( not ( = ?auto_183312 ?auto_183318 ) ) ( OBJ-AT ?auto_183315 ?auto_183312 ) ( not ( = ?auto_183315 ?auto_183314 ) ) ( OBJ-AT ?auto_183314 ?auto_183318 ) ( TRUCK-AT ?auto_183319 ?auto_183317 ) ( IN-CITY ?auto_183317 ?auto_183320 ) ( not ( = ?auto_183312 ?auto_183317 ) ) ( not ( = ?auto_183318 ?auto_183317 ) ) ( OBJ-AT ?auto_183313 ?auto_183312 ) ( OBJ-AT ?auto_183316 ?auto_183312 ) ( not ( = ?auto_183313 ?auto_183314 ) ) ( not ( = ?auto_183313 ?auto_183315 ) ) ( not ( = ?auto_183313 ?auto_183316 ) ) ( not ( = ?auto_183314 ?auto_183316 ) ) ( not ( = ?auto_183315 ?auto_183316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_183315 ?auto_183314 ?auto_183312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_189800 - OBJ
      ?auto_189801 - OBJ
      ?auto_189802 - OBJ
      ?auto_189799 - LOCATION
    )
    :vars
    (
      ?auto_189805 - TRUCK
      ?auto_189803 - LOCATION
      ?auto_189804 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_189802 ?auto_189805 ) ( TRUCK-AT ?auto_189805 ?auto_189803 ) ( IN-CITY ?auto_189803 ?auto_189804 ) ( IN-CITY ?auto_189799 ?auto_189804 ) ( not ( = ?auto_189799 ?auto_189803 ) ) ( OBJ-AT ?auto_189800 ?auto_189799 ) ( not ( = ?auto_189800 ?auto_189802 ) ) ( OBJ-AT ?auto_189801 ?auto_189799 ) ( not ( = ?auto_189800 ?auto_189801 ) ) ( not ( = ?auto_189801 ?auto_189802 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_189800 ?auto_189802 ?auto_189799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_193213 - OBJ
      ?auto_193214 - OBJ
      ?auto_193215 - OBJ
      ?auto_193212 - LOCATION
    )
    :vars
    (
      ?auto_193216 - LOCATION
      ?auto_193218 - CITY
      ?auto_193217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193216 ?auto_193218 ) ( IN-CITY ?auto_193212 ?auto_193218 ) ( not ( = ?auto_193212 ?auto_193216 ) ) ( OBJ-AT ?auto_193215 ?auto_193212 ) ( not ( = ?auto_193215 ?auto_193213 ) ) ( OBJ-AT ?auto_193213 ?auto_193216 ) ( TRUCK-AT ?auto_193217 ?auto_193212 ) ( OBJ-AT ?auto_193214 ?auto_193212 ) ( not ( = ?auto_193213 ?auto_193214 ) ) ( not ( = ?auto_193214 ?auto_193215 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_193215 ?auto_193213 ?auto_193212 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_194760 - OBJ
      ?auto_194761 - OBJ
      ?auto_194762 - OBJ
      ?auto_194759 - LOCATION
    )
    :vars
    (
      ?auto_194765 - LOCATION
      ?auto_194763 - CITY
      ?auto_194764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194765 ?auto_194763 ) ( IN-CITY ?auto_194759 ?auto_194763 ) ( not ( = ?auto_194759 ?auto_194765 ) ) ( OBJ-AT ?auto_194760 ?auto_194759 ) ( not ( = ?auto_194760 ?auto_194761 ) ) ( OBJ-AT ?auto_194761 ?auto_194765 ) ( TRUCK-AT ?auto_194764 ?auto_194759 ) ( OBJ-AT ?auto_194762 ?auto_194759 ) ( not ( = ?auto_194760 ?auto_194762 ) ) ( not ( = ?auto_194761 ?auto_194762 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_194760 ?auto_194761 ?auto_194759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196518 - OBJ
      ?auto_196519 - OBJ
      ?auto_196520 - OBJ
      ?auto_196517 - LOCATION
    )
    :vars
    (
      ?auto_196523 - LOCATION
      ?auto_196521 - CITY
      ?auto_196522 - TRUCK
      ?auto_196524 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196523 ?auto_196521 ) ( IN-CITY ?auto_196517 ?auto_196521 ) ( not ( = ?auto_196517 ?auto_196523 ) ) ( OBJ-AT ?auto_196519 ?auto_196517 ) ( not ( = ?auto_196519 ?auto_196520 ) ) ( OBJ-AT ?auto_196520 ?auto_196523 ) ( TRUCK-AT ?auto_196522 ?auto_196524 ) ( IN-CITY ?auto_196524 ?auto_196521 ) ( not ( = ?auto_196517 ?auto_196524 ) ) ( not ( = ?auto_196523 ?auto_196524 ) ) ( OBJ-AT ?auto_196518 ?auto_196517 ) ( not ( = ?auto_196518 ?auto_196519 ) ) ( not ( = ?auto_196518 ?auto_196520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196519 ?auto_196520 ?auto_196517 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196538 - OBJ
      ?auto_196539 - OBJ
      ?auto_196540 - OBJ
      ?auto_196537 - LOCATION
    )
    :vars
    (
      ?auto_196543 - LOCATION
      ?auto_196541 - CITY
      ?auto_196542 - TRUCK
      ?auto_196544 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196543 ?auto_196541 ) ( IN-CITY ?auto_196537 ?auto_196541 ) ( not ( = ?auto_196537 ?auto_196543 ) ) ( OBJ-AT ?auto_196538 ?auto_196537 ) ( not ( = ?auto_196538 ?auto_196539 ) ) ( OBJ-AT ?auto_196539 ?auto_196543 ) ( TRUCK-AT ?auto_196542 ?auto_196544 ) ( IN-CITY ?auto_196544 ?auto_196541 ) ( not ( = ?auto_196537 ?auto_196544 ) ) ( not ( = ?auto_196543 ?auto_196544 ) ) ( OBJ-AT ?auto_196540 ?auto_196537 ) ( not ( = ?auto_196538 ?auto_196540 ) ) ( not ( = ?auto_196539 ?auto_196540 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196538 ?auto_196539 ?auto_196537 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196570 - OBJ
      ?auto_196571 - OBJ
      ?auto_196572 - OBJ
      ?auto_196569 - LOCATION
    )
    :vars
    (
      ?auto_196576 - LOCATION
      ?auto_196573 - CITY
      ?auto_196575 - OBJ
      ?auto_196574 - TRUCK
      ?auto_196577 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196576 ?auto_196573 ) ( IN-CITY ?auto_196569 ?auto_196573 ) ( not ( = ?auto_196569 ?auto_196576 ) ) ( OBJ-AT ?auto_196575 ?auto_196569 ) ( not ( = ?auto_196575 ?auto_196572 ) ) ( OBJ-AT ?auto_196572 ?auto_196576 ) ( TRUCK-AT ?auto_196574 ?auto_196577 ) ( IN-CITY ?auto_196577 ?auto_196573 ) ( not ( = ?auto_196569 ?auto_196577 ) ) ( not ( = ?auto_196576 ?auto_196577 ) ) ( OBJ-AT ?auto_196570 ?auto_196569 ) ( OBJ-AT ?auto_196571 ?auto_196569 ) ( not ( = ?auto_196570 ?auto_196571 ) ) ( not ( = ?auto_196570 ?auto_196572 ) ) ( not ( = ?auto_196570 ?auto_196575 ) ) ( not ( = ?auto_196571 ?auto_196572 ) ) ( not ( = ?auto_196571 ?auto_196575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196575 ?auto_196572 ?auto_196569 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196592 - OBJ
      ?auto_196593 - OBJ
      ?auto_196594 - OBJ
      ?auto_196591 - LOCATION
    )
    :vars
    (
      ?auto_196598 - LOCATION
      ?auto_196595 - CITY
      ?auto_196597 - OBJ
      ?auto_196596 - TRUCK
      ?auto_196599 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196598 ?auto_196595 ) ( IN-CITY ?auto_196591 ?auto_196595 ) ( not ( = ?auto_196591 ?auto_196598 ) ) ( OBJ-AT ?auto_196597 ?auto_196591 ) ( not ( = ?auto_196597 ?auto_196593 ) ) ( OBJ-AT ?auto_196593 ?auto_196598 ) ( TRUCK-AT ?auto_196596 ?auto_196599 ) ( IN-CITY ?auto_196599 ?auto_196595 ) ( not ( = ?auto_196591 ?auto_196599 ) ) ( not ( = ?auto_196598 ?auto_196599 ) ) ( OBJ-AT ?auto_196592 ?auto_196591 ) ( OBJ-AT ?auto_196594 ?auto_196591 ) ( not ( = ?auto_196592 ?auto_196593 ) ) ( not ( = ?auto_196592 ?auto_196594 ) ) ( not ( = ?auto_196592 ?auto_196597 ) ) ( not ( = ?auto_196593 ?auto_196594 ) ) ( not ( = ?auto_196594 ?auto_196597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196597 ?auto_196593 ?auto_196591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196680 - OBJ
      ?auto_196681 - OBJ
      ?auto_196682 - OBJ
      ?auto_196679 - LOCATION
    )
    :vars
    (
      ?auto_196685 - LOCATION
      ?auto_196683 - CITY
      ?auto_196684 - TRUCK
      ?auto_196686 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196685 ?auto_196683 ) ( IN-CITY ?auto_196679 ?auto_196683 ) ( not ( = ?auto_196679 ?auto_196685 ) ) ( OBJ-AT ?auto_196681 ?auto_196679 ) ( not ( = ?auto_196681 ?auto_196680 ) ) ( OBJ-AT ?auto_196680 ?auto_196685 ) ( TRUCK-AT ?auto_196684 ?auto_196686 ) ( IN-CITY ?auto_196686 ?auto_196683 ) ( not ( = ?auto_196679 ?auto_196686 ) ) ( not ( = ?auto_196685 ?auto_196686 ) ) ( OBJ-AT ?auto_196682 ?auto_196679 ) ( not ( = ?auto_196680 ?auto_196682 ) ) ( not ( = ?auto_196681 ?auto_196682 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196681 ?auto_196680 ?auto_196679 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_196712 - OBJ
      ?auto_196713 - OBJ
      ?auto_196714 - OBJ
      ?auto_196711 - LOCATION
    )
    :vars
    (
      ?auto_196718 - LOCATION
      ?auto_196715 - CITY
      ?auto_196717 - OBJ
      ?auto_196716 - TRUCK
      ?auto_196719 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196718 ?auto_196715 ) ( IN-CITY ?auto_196711 ?auto_196715 ) ( not ( = ?auto_196711 ?auto_196718 ) ) ( OBJ-AT ?auto_196717 ?auto_196711 ) ( not ( = ?auto_196717 ?auto_196712 ) ) ( OBJ-AT ?auto_196712 ?auto_196718 ) ( TRUCK-AT ?auto_196716 ?auto_196719 ) ( IN-CITY ?auto_196719 ?auto_196715 ) ( not ( = ?auto_196711 ?auto_196719 ) ) ( not ( = ?auto_196718 ?auto_196719 ) ) ( OBJ-AT ?auto_196713 ?auto_196711 ) ( OBJ-AT ?auto_196714 ?auto_196711 ) ( not ( = ?auto_196712 ?auto_196713 ) ) ( not ( = ?auto_196712 ?auto_196714 ) ) ( not ( = ?auto_196713 ?auto_196714 ) ) ( not ( = ?auto_196713 ?auto_196717 ) ) ( not ( = ?auto_196714 ?auto_196717 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196717 ?auto_196712 ?auto_196711 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196818 - OBJ
      ?auto_196819 - OBJ
      ?auto_196820 - OBJ
      ?auto_196821 - OBJ
      ?auto_196817 - LOCATION
    )
    :vars
    (
      ?auto_196824 - LOCATION
      ?auto_196822 - CITY
      ?auto_196823 - TRUCK
      ?auto_196825 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196824 ?auto_196822 ) ( IN-CITY ?auto_196817 ?auto_196822 ) ( not ( = ?auto_196817 ?auto_196824 ) ) ( OBJ-AT ?auto_196819 ?auto_196817 ) ( not ( = ?auto_196819 ?auto_196821 ) ) ( OBJ-AT ?auto_196821 ?auto_196824 ) ( TRUCK-AT ?auto_196823 ?auto_196825 ) ( IN-CITY ?auto_196825 ?auto_196822 ) ( not ( = ?auto_196817 ?auto_196825 ) ) ( not ( = ?auto_196824 ?auto_196825 ) ) ( OBJ-AT ?auto_196818 ?auto_196817 ) ( OBJ-AT ?auto_196820 ?auto_196817 ) ( not ( = ?auto_196818 ?auto_196819 ) ) ( not ( = ?auto_196818 ?auto_196820 ) ) ( not ( = ?auto_196818 ?auto_196821 ) ) ( not ( = ?auto_196819 ?auto_196820 ) ) ( not ( = ?auto_196820 ?auto_196821 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196819 ?auto_196821 ?auto_196817 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196836 - OBJ
      ?auto_196837 - OBJ
      ?auto_196838 - OBJ
      ?auto_196839 - OBJ
      ?auto_196835 - LOCATION
    )
    :vars
    (
      ?auto_196842 - LOCATION
      ?auto_196840 - CITY
      ?auto_196841 - TRUCK
      ?auto_196843 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196842 ?auto_196840 ) ( IN-CITY ?auto_196835 ?auto_196840 ) ( not ( = ?auto_196835 ?auto_196842 ) ) ( OBJ-AT ?auto_196837 ?auto_196835 ) ( not ( = ?auto_196837 ?auto_196838 ) ) ( OBJ-AT ?auto_196838 ?auto_196842 ) ( TRUCK-AT ?auto_196841 ?auto_196843 ) ( IN-CITY ?auto_196843 ?auto_196840 ) ( not ( = ?auto_196835 ?auto_196843 ) ) ( not ( = ?auto_196842 ?auto_196843 ) ) ( OBJ-AT ?auto_196836 ?auto_196835 ) ( OBJ-AT ?auto_196839 ?auto_196835 ) ( not ( = ?auto_196836 ?auto_196837 ) ) ( not ( = ?auto_196836 ?auto_196838 ) ) ( not ( = ?auto_196836 ?auto_196839 ) ) ( not ( = ?auto_196837 ?auto_196839 ) ) ( not ( = ?auto_196838 ?auto_196839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196837 ?auto_196838 ?auto_196835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_196845 - OBJ
      ?auto_196846 - OBJ
      ?auto_196847 - OBJ
      ?auto_196848 - OBJ
      ?auto_196844 - LOCATION
    )
    :vars
    (
      ?auto_196851 - LOCATION
      ?auto_196849 - CITY
      ?auto_196850 - TRUCK
      ?auto_196852 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_196851 ?auto_196849 ) ( IN-CITY ?auto_196844 ?auto_196849 ) ( not ( = ?auto_196844 ?auto_196851 ) ) ( OBJ-AT ?auto_196845 ?auto_196844 ) ( not ( = ?auto_196845 ?auto_196847 ) ) ( OBJ-AT ?auto_196847 ?auto_196851 ) ( TRUCK-AT ?auto_196850 ?auto_196852 ) ( IN-CITY ?auto_196852 ?auto_196849 ) ( not ( = ?auto_196844 ?auto_196852 ) ) ( not ( = ?auto_196851 ?auto_196852 ) ) ( OBJ-AT ?auto_196846 ?auto_196844 ) ( OBJ-AT ?auto_196848 ?auto_196844 ) ( not ( = ?auto_196845 ?auto_196846 ) ) ( not ( = ?auto_196845 ?auto_196848 ) ) ( not ( = ?auto_196846 ?auto_196847 ) ) ( not ( = ?auto_196846 ?auto_196848 ) ) ( not ( = ?auto_196847 ?auto_196848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_196845 ?auto_196847 ?auto_196844 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197214 - OBJ
      ?auto_197215 - OBJ
      ?auto_197216 - OBJ
      ?auto_197217 - OBJ
      ?auto_197213 - LOCATION
    )
    :vars
    (
      ?auto_197221 - LOCATION
      ?auto_197218 - CITY
      ?auto_197220 - OBJ
      ?auto_197219 - TRUCK
      ?auto_197222 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197221 ?auto_197218 ) ( IN-CITY ?auto_197213 ?auto_197218 ) ( not ( = ?auto_197213 ?auto_197221 ) ) ( OBJ-AT ?auto_197220 ?auto_197213 ) ( not ( = ?auto_197220 ?auto_197217 ) ) ( OBJ-AT ?auto_197217 ?auto_197221 ) ( TRUCK-AT ?auto_197219 ?auto_197222 ) ( IN-CITY ?auto_197222 ?auto_197218 ) ( not ( = ?auto_197213 ?auto_197222 ) ) ( not ( = ?auto_197221 ?auto_197222 ) ) ( OBJ-AT ?auto_197214 ?auto_197213 ) ( OBJ-AT ?auto_197215 ?auto_197213 ) ( OBJ-AT ?auto_197216 ?auto_197213 ) ( not ( = ?auto_197214 ?auto_197215 ) ) ( not ( = ?auto_197214 ?auto_197216 ) ) ( not ( = ?auto_197214 ?auto_197217 ) ) ( not ( = ?auto_197214 ?auto_197220 ) ) ( not ( = ?auto_197215 ?auto_197216 ) ) ( not ( = ?auto_197215 ?auto_197217 ) ) ( not ( = ?auto_197215 ?auto_197220 ) ) ( not ( = ?auto_197216 ?auto_197217 ) ) ( not ( = ?auto_197216 ?auto_197220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197220 ?auto_197217 ?auto_197213 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197243 - OBJ
      ?auto_197244 - OBJ
      ?auto_197245 - OBJ
      ?auto_197246 - OBJ
      ?auto_197242 - LOCATION
    )
    :vars
    (
      ?auto_197250 - LOCATION
      ?auto_197247 - CITY
      ?auto_197249 - OBJ
      ?auto_197248 - TRUCK
      ?auto_197251 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197250 ?auto_197247 ) ( IN-CITY ?auto_197242 ?auto_197247 ) ( not ( = ?auto_197242 ?auto_197250 ) ) ( OBJ-AT ?auto_197249 ?auto_197242 ) ( not ( = ?auto_197249 ?auto_197245 ) ) ( OBJ-AT ?auto_197245 ?auto_197250 ) ( TRUCK-AT ?auto_197248 ?auto_197251 ) ( IN-CITY ?auto_197251 ?auto_197247 ) ( not ( = ?auto_197242 ?auto_197251 ) ) ( not ( = ?auto_197250 ?auto_197251 ) ) ( OBJ-AT ?auto_197243 ?auto_197242 ) ( OBJ-AT ?auto_197244 ?auto_197242 ) ( OBJ-AT ?auto_197246 ?auto_197242 ) ( not ( = ?auto_197243 ?auto_197244 ) ) ( not ( = ?auto_197243 ?auto_197245 ) ) ( not ( = ?auto_197243 ?auto_197246 ) ) ( not ( = ?auto_197243 ?auto_197249 ) ) ( not ( = ?auto_197244 ?auto_197245 ) ) ( not ( = ?auto_197244 ?auto_197246 ) ) ( not ( = ?auto_197244 ?auto_197249 ) ) ( not ( = ?auto_197245 ?auto_197246 ) ) ( not ( = ?auto_197246 ?auto_197249 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197249 ?auto_197245 ?auto_197242 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197377 - OBJ
      ?auto_197378 - OBJ
      ?auto_197379 - OBJ
      ?auto_197380 - OBJ
      ?auto_197376 - LOCATION
    )
    :vars
    (
      ?auto_197383 - LOCATION
      ?auto_197381 - CITY
      ?auto_197382 - TRUCK
      ?auto_197384 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197383 ?auto_197381 ) ( IN-CITY ?auto_197376 ?auto_197381 ) ( not ( = ?auto_197376 ?auto_197383 ) ) ( OBJ-AT ?auto_197380 ?auto_197376 ) ( not ( = ?auto_197380 ?auto_197378 ) ) ( OBJ-AT ?auto_197378 ?auto_197383 ) ( TRUCK-AT ?auto_197382 ?auto_197384 ) ( IN-CITY ?auto_197384 ?auto_197381 ) ( not ( = ?auto_197376 ?auto_197384 ) ) ( not ( = ?auto_197383 ?auto_197384 ) ) ( OBJ-AT ?auto_197377 ?auto_197376 ) ( OBJ-AT ?auto_197379 ?auto_197376 ) ( not ( = ?auto_197377 ?auto_197378 ) ) ( not ( = ?auto_197377 ?auto_197379 ) ) ( not ( = ?auto_197377 ?auto_197380 ) ) ( not ( = ?auto_197378 ?auto_197379 ) ) ( not ( = ?auto_197379 ?auto_197380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197380 ?auto_197378 ?auto_197376 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197386 - OBJ
      ?auto_197387 - OBJ
      ?auto_197388 - OBJ
      ?auto_197389 - OBJ
      ?auto_197385 - LOCATION
    )
    :vars
    (
      ?auto_197393 - LOCATION
      ?auto_197390 - CITY
      ?auto_197392 - OBJ
      ?auto_197391 - TRUCK
      ?auto_197394 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197393 ?auto_197390 ) ( IN-CITY ?auto_197385 ?auto_197390 ) ( not ( = ?auto_197385 ?auto_197393 ) ) ( OBJ-AT ?auto_197392 ?auto_197385 ) ( not ( = ?auto_197392 ?auto_197387 ) ) ( OBJ-AT ?auto_197387 ?auto_197393 ) ( TRUCK-AT ?auto_197391 ?auto_197394 ) ( IN-CITY ?auto_197394 ?auto_197390 ) ( not ( = ?auto_197385 ?auto_197394 ) ) ( not ( = ?auto_197393 ?auto_197394 ) ) ( OBJ-AT ?auto_197386 ?auto_197385 ) ( OBJ-AT ?auto_197388 ?auto_197385 ) ( OBJ-AT ?auto_197389 ?auto_197385 ) ( not ( = ?auto_197386 ?auto_197387 ) ) ( not ( = ?auto_197386 ?auto_197388 ) ) ( not ( = ?auto_197386 ?auto_197389 ) ) ( not ( = ?auto_197386 ?auto_197392 ) ) ( not ( = ?auto_197387 ?auto_197388 ) ) ( not ( = ?auto_197387 ?auto_197389 ) ) ( not ( = ?auto_197388 ?auto_197389 ) ) ( not ( = ?auto_197388 ?auto_197392 ) ) ( not ( = ?auto_197389 ?auto_197392 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197392 ?auto_197387 ?auto_197385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197882 - OBJ
      ?auto_197883 - OBJ
      ?auto_197884 - OBJ
      ?auto_197885 - OBJ
      ?auto_197881 - LOCATION
    )
    :vars
    (
      ?auto_197888 - LOCATION
      ?auto_197886 - CITY
      ?auto_197887 - TRUCK
      ?auto_197889 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197888 ?auto_197886 ) ( IN-CITY ?auto_197881 ?auto_197886 ) ( not ( = ?auto_197881 ?auto_197888 ) ) ( OBJ-AT ?auto_197885 ?auto_197881 ) ( not ( = ?auto_197885 ?auto_197882 ) ) ( OBJ-AT ?auto_197882 ?auto_197888 ) ( TRUCK-AT ?auto_197887 ?auto_197889 ) ( IN-CITY ?auto_197889 ?auto_197886 ) ( not ( = ?auto_197881 ?auto_197889 ) ) ( not ( = ?auto_197888 ?auto_197889 ) ) ( OBJ-AT ?auto_197883 ?auto_197881 ) ( OBJ-AT ?auto_197884 ?auto_197881 ) ( not ( = ?auto_197882 ?auto_197883 ) ) ( not ( = ?auto_197882 ?auto_197884 ) ) ( not ( = ?auto_197883 ?auto_197884 ) ) ( not ( = ?auto_197883 ?auto_197885 ) ) ( not ( = ?auto_197884 ?auto_197885 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197885 ?auto_197882 ?auto_197881 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_197891 - OBJ
      ?auto_197892 - OBJ
      ?auto_197893 - OBJ
      ?auto_197894 - OBJ
      ?auto_197890 - LOCATION
    )
    :vars
    (
      ?auto_197897 - LOCATION
      ?auto_197895 - CITY
      ?auto_197896 - TRUCK
      ?auto_197898 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_197897 ?auto_197895 ) ( IN-CITY ?auto_197890 ?auto_197895 ) ( not ( = ?auto_197890 ?auto_197897 ) ) ( OBJ-AT ?auto_197892 ?auto_197890 ) ( not ( = ?auto_197892 ?auto_197891 ) ) ( OBJ-AT ?auto_197891 ?auto_197897 ) ( TRUCK-AT ?auto_197896 ?auto_197898 ) ( IN-CITY ?auto_197898 ?auto_197895 ) ( not ( = ?auto_197890 ?auto_197898 ) ) ( not ( = ?auto_197897 ?auto_197898 ) ) ( OBJ-AT ?auto_197893 ?auto_197890 ) ( OBJ-AT ?auto_197894 ?auto_197890 ) ( not ( = ?auto_197891 ?auto_197893 ) ) ( not ( = ?auto_197891 ?auto_197894 ) ) ( not ( = ?auto_197892 ?auto_197893 ) ) ( not ( = ?auto_197892 ?auto_197894 ) ) ( not ( = ?auto_197893 ?auto_197894 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_197892 ?auto_197891 ?auto_197890 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_198035 - OBJ
      ?auto_198036 - OBJ
      ?auto_198037 - OBJ
      ?auto_198038 - OBJ
      ?auto_198034 - LOCATION
    )
    :vars
    (
      ?auto_198042 - LOCATION
      ?auto_198039 - CITY
      ?auto_198041 - OBJ
      ?auto_198040 - TRUCK
      ?auto_198043 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_198042 ?auto_198039 ) ( IN-CITY ?auto_198034 ?auto_198039 ) ( not ( = ?auto_198034 ?auto_198042 ) ) ( OBJ-AT ?auto_198041 ?auto_198034 ) ( not ( = ?auto_198041 ?auto_198035 ) ) ( OBJ-AT ?auto_198035 ?auto_198042 ) ( TRUCK-AT ?auto_198040 ?auto_198043 ) ( IN-CITY ?auto_198043 ?auto_198039 ) ( not ( = ?auto_198034 ?auto_198043 ) ) ( not ( = ?auto_198042 ?auto_198043 ) ) ( OBJ-AT ?auto_198036 ?auto_198034 ) ( OBJ-AT ?auto_198037 ?auto_198034 ) ( OBJ-AT ?auto_198038 ?auto_198034 ) ( not ( = ?auto_198035 ?auto_198036 ) ) ( not ( = ?auto_198035 ?auto_198037 ) ) ( not ( = ?auto_198035 ?auto_198038 ) ) ( not ( = ?auto_198036 ?auto_198037 ) ) ( not ( = ?auto_198036 ?auto_198038 ) ) ( not ( = ?auto_198036 ?auto_198041 ) ) ( not ( = ?auto_198037 ?auto_198038 ) ) ( not ( = ?auto_198037 ?auto_198041 ) ) ( not ( = ?auto_198038 ?auto_198041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_198041 ?auto_198035 ?auto_198034 ) )
  )

)

