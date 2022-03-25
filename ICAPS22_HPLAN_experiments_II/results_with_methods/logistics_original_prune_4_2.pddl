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
      ?auto_95801 - OBJ
      ?auto_95800 - LOCATION
    )
    :vars
    (
      ?auto_95802 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95802 ?auto_95800 ) ( IN-TRUCK ?auto_95801 ?auto_95802 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_95801 ?auto_95802 ?auto_95800 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95819 - OBJ
      ?auto_95818 - LOCATION
    )
    :vars
    (
      ?auto_95820 - TRUCK
      ?auto_95821 - LOCATION
      ?auto_95822 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95819 ?auto_95820 ) ( TRUCK-AT ?auto_95820 ?auto_95821 ) ( IN-CITY ?auto_95821 ?auto_95822 ) ( IN-CITY ?auto_95818 ?auto_95822 ) ( not ( = ?auto_95818 ?auto_95821 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95820 ?auto_95821 ?auto_95818 ?auto_95822 )
      ( DELIVER-1PKG ?auto_95819 ?auto_95818 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95845 - OBJ
      ?auto_95844 - LOCATION
    )
    :vars
    (
      ?auto_95847 - TRUCK
      ?auto_95846 - LOCATION
      ?auto_95848 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95847 ?auto_95846 ) ( IN-CITY ?auto_95846 ?auto_95848 ) ( IN-CITY ?auto_95844 ?auto_95848 ) ( not ( = ?auto_95844 ?auto_95846 ) ) ( OBJ-AT ?auto_95845 ?auto_95846 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95845 ?auto_95847 ?auto_95846 )
      ( DELIVER-1PKG ?auto_95845 ?auto_95844 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95871 - OBJ
      ?auto_95870 - LOCATION
    )
    :vars
    (
      ?auto_95874 - LOCATION
      ?auto_95873 - CITY
      ?auto_95872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95874 ?auto_95873 ) ( IN-CITY ?auto_95870 ?auto_95873 ) ( not ( = ?auto_95870 ?auto_95874 ) ) ( OBJ-AT ?auto_95871 ?auto_95874 ) ( TRUCK-AT ?auto_95872 ?auto_95870 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95872 ?auto_95870 ?auto_95874 ?auto_95873 )
      ( DELIVER-1PKG ?auto_95871 ?auto_95870 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96014 - OBJ
      ?auto_96015 - OBJ
      ?auto_96013 - LOCATION
    )
    :vars
    (
      ?auto_96016 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96016 ?auto_96013 ) ( IN-TRUCK ?auto_96015 ?auto_96016 ) ( OBJ-AT ?auto_96014 ?auto_96013 ) ( not ( = ?auto_96014 ?auto_96015 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96015 ?auto_96013 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96018 - OBJ
      ?auto_96019 - OBJ
      ?auto_96017 - LOCATION
    )
    :vars
    (
      ?auto_96020 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96020 ?auto_96017 ) ( IN-TRUCK ?auto_96018 ?auto_96020 ) ( OBJ-AT ?auto_96019 ?auto_96017 ) ( not ( = ?auto_96018 ?auto_96019 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96018 ?auto_96017 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96026 - OBJ
      ?auto_96027 - OBJ
      ?auto_96028 - OBJ
      ?auto_96025 - LOCATION
    )
    :vars
    (
      ?auto_96029 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96029 ?auto_96025 ) ( IN-TRUCK ?auto_96028 ?auto_96029 ) ( OBJ-AT ?auto_96026 ?auto_96025 ) ( OBJ-AT ?auto_96027 ?auto_96025 ) ( not ( = ?auto_96026 ?auto_96027 ) ) ( not ( = ?auto_96026 ?auto_96028 ) ) ( not ( = ?auto_96027 ?auto_96028 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96028 ?auto_96025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96031 - OBJ
      ?auto_96032 - OBJ
      ?auto_96033 - OBJ
      ?auto_96030 - LOCATION
    )
    :vars
    (
      ?auto_96034 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96034 ?auto_96030 ) ( IN-TRUCK ?auto_96032 ?auto_96034 ) ( OBJ-AT ?auto_96031 ?auto_96030 ) ( OBJ-AT ?auto_96033 ?auto_96030 ) ( not ( = ?auto_96031 ?auto_96032 ) ) ( not ( = ?auto_96031 ?auto_96033 ) ) ( not ( = ?auto_96032 ?auto_96033 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96032 ?auto_96030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96041 - OBJ
      ?auto_96042 - OBJ
      ?auto_96043 - OBJ
      ?auto_96040 - LOCATION
    )
    :vars
    (
      ?auto_96044 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96044 ?auto_96040 ) ( IN-TRUCK ?auto_96041 ?auto_96044 ) ( OBJ-AT ?auto_96042 ?auto_96040 ) ( OBJ-AT ?auto_96043 ?auto_96040 ) ( not ( = ?auto_96041 ?auto_96042 ) ) ( not ( = ?auto_96041 ?auto_96043 ) ) ( not ( = ?auto_96042 ?auto_96043 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96041 ?auto_96040 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96061 - OBJ
      ?auto_96062 - OBJ
      ?auto_96063 - OBJ
      ?auto_96064 - OBJ
      ?auto_96060 - LOCATION
    )
    :vars
    (
      ?auto_96065 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96065 ?auto_96060 ) ( IN-TRUCK ?auto_96064 ?auto_96065 ) ( OBJ-AT ?auto_96061 ?auto_96060 ) ( OBJ-AT ?auto_96062 ?auto_96060 ) ( OBJ-AT ?auto_96063 ?auto_96060 ) ( not ( = ?auto_96061 ?auto_96062 ) ) ( not ( = ?auto_96061 ?auto_96063 ) ) ( not ( = ?auto_96061 ?auto_96064 ) ) ( not ( = ?auto_96062 ?auto_96063 ) ) ( not ( = ?auto_96062 ?auto_96064 ) ) ( not ( = ?auto_96063 ?auto_96064 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96064 ?auto_96060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96067 - OBJ
      ?auto_96068 - OBJ
      ?auto_96069 - OBJ
      ?auto_96070 - OBJ
      ?auto_96066 - LOCATION
    )
    :vars
    (
      ?auto_96071 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96071 ?auto_96066 ) ( IN-TRUCK ?auto_96069 ?auto_96071 ) ( OBJ-AT ?auto_96067 ?auto_96066 ) ( OBJ-AT ?auto_96068 ?auto_96066 ) ( OBJ-AT ?auto_96070 ?auto_96066 ) ( not ( = ?auto_96067 ?auto_96068 ) ) ( not ( = ?auto_96067 ?auto_96069 ) ) ( not ( = ?auto_96067 ?auto_96070 ) ) ( not ( = ?auto_96068 ?auto_96069 ) ) ( not ( = ?auto_96068 ?auto_96070 ) ) ( not ( = ?auto_96069 ?auto_96070 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96069 ?auto_96066 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96079 - OBJ
      ?auto_96080 - OBJ
      ?auto_96081 - OBJ
      ?auto_96082 - OBJ
      ?auto_96078 - LOCATION
    )
    :vars
    (
      ?auto_96083 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96083 ?auto_96078 ) ( IN-TRUCK ?auto_96080 ?auto_96083 ) ( OBJ-AT ?auto_96079 ?auto_96078 ) ( OBJ-AT ?auto_96081 ?auto_96078 ) ( OBJ-AT ?auto_96082 ?auto_96078 ) ( not ( = ?auto_96079 ?auto_96080 ) ) ( not ( = ?auto_96079 ?auto_96081 ) ) ( not ( = ?auto_96079 ?auto_96082 ) ) ( not ( = ?auto_96080 ?auto_96081 ) ) ( not ( = ?auto_96080 ?auto_96082 ) ) ( not ( = ?auto_96081 ?auto_96082 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96080 ?auto_96078 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96103 - OBJ
      ?auto_96104 - OBJ
      ?auto_96105 - OBJ
      ?auto_96106 - OBJ
      ?auto_96102 - LOCATION
    )
    :vars
    (
      ?auto_96107 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96107 ?auto_96102 ) ( IN-TRUCK ?auto_96103 ?auto_96107 ) ( OBJ-AT ?auto_96104 ?auto_96102 ) ( OBJ-AT ?auto_96105 ?auto_96102 ) ( OBJ-AT ?auto_96106 ?auto_96102 ) ( not ( = ?auto_96103 ?auto_96104 ) ) ( not ( = ?auto_96103 ?auto_96105 ) ) ( not ( = ?auto_96103 ?auto_96106 ) ) ( not ( = ?auto_96104 ?auto_96105 ) ) ( not ( = ?auto_96104 ?auto_96106 ) ) ( not ( = ?auto_96105 ?auto_96106 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96103 ?auto_96102 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96156 - OBJ
      ?auto_96157 - OBJ
      ?auto_96155 - LOCATION
    )
    :vars
    (
      ?auto_96159 - TRUCK
      ?auto_96158 - LOCATION
      ?auto_96160 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96157 ?auto_96159 ) ( TRUCK-AT ?auto_96159 ?auto_96158 ) ( IN-CITY ?auto_96158 ?auto_96160 ) ( IN-CITY ?auto_96155 ?auto_96160 ) ( not ( = ?auto_96155 ?auto_96158 ) ) ( OBJ-AT ?auto_96156 ?auto_96155 ) ( not ( = ?auto_96156 ?auto_96157 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96157 ?auto_96155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96162 - OBJ
      ?auto_96163 - OBJ
      ?auto_96161 - LOCATION
    )
    :vars
    (
      ?auto_96166 - TRUCK
      ?auto_96164 - LOCATION
      ?auto_96165 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96162 ?auto_96166 ) ( TRUCK-AT ?auto_96166 ?auto_96164 ) ( IN-CITY ?auto_96164 ?auto_96165 ) ( IN-CITY ?auto_96161 ?auto_96165 ) ( not ( = ?auto_96161 ?auto_96164 ) ) ( OBJ-AT ?auto_96163 ?auto_96161 ) ( not ( = ?auto_96163 ?auto_96162 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96163 ?auto_96162 ?auto_96161 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96175 - OBJ
      ?auto_96176 - OBJ
      ?auto_96177 - OBJ
      ?auto_96174 - LOCATION
    )
    :vars
    (
      ?auto_96180 - TRUCK
      ?auto_96178 - LOCATION
      ?auto_96179 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96177 ?auto_96180 ) ( TRUCK-AT ?auto_96180 ?auto_96178 ) ( IN-CITY ?auto_96178 ?auto_96179 ) ( IN-CITY ?auto_96174 ?auto_96179 ) ( not ( = ?auto_96174 ?auto_96178 ) ) ( OBJ-AT ?auto_96176 ?auto_96174 ) ( not ( = ?auto_96176 ?auto_96177 ) ) ( OBJ-AT ?auto_96175 ?auto_96174 ) ( not ( = ?auto_96175 ?auto_96176 ) ) ( not ( = ?auto_96175 ?auto_96177 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96176 ?auto_96177 ?auto_96174 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96182 - OBJ
      ?auto_96183 - OBJ
      ?auto_96184 - OBJ
      ?auto_96181 - LOCATION
    )
    :vars
    (
      ?auto_96187 - TRUCK
      ?auto_96185 - LOCATION
      ?auto_96186 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96183 ?auto_96187 ) ( TRUCK-AT ?auto_96187 ?auto_96185 ) ( IN-CITY ?auto_96185 ?auto_96186 ) ( IN-CITY ?auto_96181 ?auto_96186 ) ( not ( = ?auto_96181 ?auto_96185 ) ) ( OBJ-AT ?auto_96184 ?auto_96181 ) ( not ( = ?auto_96184 ?auto_96183 ) ) ( OBJ-AT ?auto_96182 ?auto_96181 ) ( not ( = ?auto_96182 ?auto_96183 ) ) ( not ( = ?auto_96182 ?auto_96184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96184 ?auto_96183 ?auto_96181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96196 - OBJ
      ?auto_96197 - OBJ
      ?auto_96198 - OBJ
      ?auto_96195 - LOCATION
    )
    :vars
    (
      ?auto_96201 - TRUCK
      ?auto_96199 - LOCATION
      ?auto_96200 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96196 ?auto_96201 ) ( TRUCK-AT ?auto_96201 ?auto_96199 ) ( IN-CITY ?auto_96199 ?auto_96200 ) ( IN-CITY ?auto_96195 ?auto_96200 ) ( not ( = ?auto_96195 ?auto_96199 ) ) ( OBJ-AT ?auto_96197 ?auto_96195 ) ( not ( = ?auto_96197 ?auto_96196 ) ) ( OBJ-AT ?auto_96198 ?auto_96195 ) ( not ( = ?auto_96196 ?auto_96198 ) ) ( not ( = ?auto_96197 ?auto_96198 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96197 ?auto_96196 ?auto_96195 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96225 - OBJ
      ?auto_96226 - OBJ
      ?auto_96227 - OBJ
      ?auto_96228 - OBJ
      ?auto_96224 - LOCATION
    )
    :vars
    (
      ?auto_96231 - TRUCK
      ?auto_96229 - LOCATION
      ?auto_96230 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96228 ?auto_96231 ) ( TRUCK-AT ?auto_96231 ?auto_96229 ) ( IN-CITY ?auto_96229 ?auto_96230 ) ( IN-CITY ?auto_96224 ?auto_96230 ) ( not ( = ?auto_96224 ?auto_96229 ) ) ( OBJ-AT ?auto_96226 ?auto_96224 ) ( not ( = ?auto_96226 ?auto_96228 ) ) ( OBJ-AT ?auto_96225 ?auto_96224 ) ( OBJ-AT ?auto_96227 ?auto_96224 ) ( not ( = ?auto_96225 ?auto_96226 ) ) ( not ( = ?auto_96225 ?auto_96227 ) ) ( not ( = ?auto_96225 ?auto_96228 ) ) ( not ( = ?auto_96226 ?auto_96227 ) ) ( not ( = ?auto_96227 ?auto_96228 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96226 ?auto_96228 ?auto_96224 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96233 - OBJ
      ?auto_96234 - OBJ
      ?auto_96235 - OBJ
      ?auto_96236 - OBJ
      ?auto_96232 - LOCATION
    )
    :vars
    (
      ?auto_96239 - TRUCK
      ?auto_96237 - LOCATION
      ?auto_96238 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96235 ?auto_96239 ) ( TRUCK-AT ?auto_96239 ?auto_96237 ) ( IN-CITY ?auto_96237 ?auto_96238 ) ( IN-CITY ?auto_96232 ?auto_96238 ) ( not ( = ?auto_96232 ?auto_96237 ) ) ( OBJ-AT ?auto_96234 ?auto_96232 ) ( not ( = ?auto_96234 ?auto_96235 ) ) ( OBJ-AT ?auto_96233 ?auto_96232 ) ( OBJ-AT ?auto_96236 ?auto_96232 ) ( not ( = ?auto_96233 ?auto_96234 ) ) ( not ( = ?auto_96233 ?auto_96235 ) ) ( not ( = ?auto_96233 ?auto_96236 ) ) ( not ( = ?auto_96234 ?auto_96236 ) ) ( not ( = ?auto_96235 ?auto_96236 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96234 ?auto_96235 ?auto_96232 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96249 - OBJ
      ?auto_96250 - OBJ
      ?auto_96251 - OBJ
      ?auto_96252 - OBJ
      ?auto_96248 - LOCATION
    )
    :vars
    (
      ?auto_96255 - TRUCK
      ?auto_96253 - LOCATION
      ?auto_96254 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96250 ?auto_96255 ) ( TRUCK-AT ?auto_96255 ?auto_96253 ) ( IN-CITY ?auto_96253 ?auto_96254 ) ( IN-CITY ?auto_96248 ?auto_96254 ) ( not ( = ?auto_96248 ?auto_96253 ) ) ( OBJ-AT ?auto_96251 ?auto_96248 ) ( not ( = ?auto_96251 ?auto_96250 ) ) ( OBJ-AT ?auto_96249 ?auto_96248 ) ( OBJ-AT ?auto_96252 ?auto_96248 ) ( not ( = ?auto_96249 ?auto_96250 ) ) ( not ( = ?auto_96249 ?auto_96251 ) ) ( not ( = ?auto_96249 ?auto_96252 ) ) ( not ( = ?auto_96250 ?auto_96252 ) ) ( not ( = ?auto_96251 ?auto_96252 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96251 ?auto_96250 ?auto_96248 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96281 - OBJ
      ?auto_96282 - OBJ
      ?auto_96283 - OBJ
      ?auto_96284 - OBJ
      ?auto_96280 - LOCATION
    )
    :vars
    (
      ?auto_96287 - TRUCK
      ?auto_96285 - LOCATION
      ?auto_96286 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96281 ?auto_96287 ) ( TRUCK-AT ?auto_96287 ?auto_96285 ) ( IN-CITY ?auto_96285 ?auto_96286 ) ( IN-CITY ?auto_96280 ?auto_96286 ) ( not ( = ?auto_96280 ?auto_96285 ) ) ( OBJ-AT ?auto_96283 ?auto_96280 ) ( not ( = ?auto_96283 ?auto_96281 ) ) ( OBJ-AT ?auto_96282 ?auto_96280 ) ( OBJ-AT ?auto_96284 ?auto_96280 ) ( not ( = ?auto_96281 ?auto_96282 ) ) ( not ( = ?auto_96281 ?auto_96284 ) ) ( not ( = ?auto_96282 ?auto_96283 ) ) ( not ( = ?auto_96282 ?auto_96284 ) ) ( not ( = ?auto_96283 ?auto_96284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96283 ?auto_96281 ?auto_96280 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96346 - OBJ
      ?auto_96345 - LOCATION
    )
    :vars
    (
      ?auto_96350 - TRUCK
      ?auto_96348 - LOCATION
      ?auto_96349 - CITY
      ?auto_96347 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96350 ?auto_96348 ) ( IN-CITY ?auto_96348 ?auto_96349 ) ( IN-CITY ?auto_96345 ?auto_96349 ) ( not ( = ?auto_96345 ?auto_96348 ) ) ( OBJ-AT ?auto_96347 ?auto_96345 ) ( not ( = ?auto_96347 ?auto_96346 ) ) ( OBJ-AT ?auto_96346 ?auto_96348 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96346 ?auto_96350 ?auto_96348 )
      ( DELIVER-2PKG ?auto_96347 ?auto_96346 ?auto_96345 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96352 - OBJ
      ?auto_96353 - OBJ
      ?auto_96351 - LOCATION
    )
    :vars
    (
      ?auto_96356 - TRUCK
      ?auto_96355 - LOCATION
      ?auto_96354 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96356 ?auto_96355 ) ( IN-CITY ?auto_96355 ?auto_96354 ) ( IN-CITY ?auto_96351 ?auto_96354 ) ( not ( = ?auto_96351 ?auto_96355 ) ) ( OBJ-AT ?auto_96352 ?auto_96351 ) ( not ( = ?auto_96352 ?auto_96353 ) ) ( OBJ-AT ?auto_96353 ?auto_96355 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96353 ?auto_96351 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96358 - OBJ
      ?auto_96359 - OBJ
      ?auto_96357 - LOCATION
    )
    :vars
    (
      ?auto_96360 - TRUCK
      ?auto_96362 - LOCATION
      ?auto_96361 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96360 ?auto_96362 ) ( IN-CITY ?auto_96362 ?auto_96361 ) ( IN-CITY ?auto_96357 ?auto_96361 ) ( not ( = ?auto_96357 ?auto_96362 ) ) ( OBJ-AT ?auto_96359 ?auto_96357 ) ( not ( = ?auto_96359 ?auto_96358 ) ) ( OBJ-AT ?auto_96358 ?auto_96362 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96359 ?auto_96358 ?auto_96357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96371 - OBJ
      ?auto_96372 - OBJ
      ?auto_96373 - OBJ
      ?auto_96370 - LOCATION
    )
    :vars
    (
      ?auto_96374 - TRUCK
      ?auto_96376 - LOCATION
      ?auto_96375 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96374 ?auto_96376 ) ( IN-CITY ?auto_96376 ?auto_96375 ) ( IN-CITY ?auto_96370 ?auto_96375 ) ( not ( = ?auto_96370 ?auto_96376 ) ) ( OBJ-AT ?auto_96372 ?auto_96370 ) ( not ( = ?auto_96372 ?auto_96373 ) ) ( OBJ-AT ?auto_96373 ?auto_96376 ) ( OBJ-AT ?auto_96371 ?auto_96370 ) ( not ( = ?auto_96371 ?auto_96372 ) ) ( not ( = ?auto_96371 ?auto_96373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96372 ?auto_96373 ?auto_96370 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96378 - OBJ
      ?auto_96379 - OBJ
      ?auto_96380 - OBJ
      ?auto_96377 - LOCATION
    )
    :vars
    (
      ?auto_96381 - TRUCK
      ?auto_96383 - LOCATION
      ?auto_96382 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96381 ?auto_96383 ) ( IN-CITY ?auto_96383 ?auto_96382 ) ( IN-CITY ?auto_96377 ?auto_96382 ) ( not ( = ?auto_96377 ?auto_96383 ) ) ( OBJ-AT ?auto_96380 ?auto_96377 ) ( not ( = ?auto_96380 ?auto_96379 ) ) ( OBJ-AT ?auto_96379 ?auto_96383 ) ( OBJ-AT ?auto_96378 ?auto_96377 ) ( not ( = ?auto_96378 ?auto_96379 ) ) ( not ( = ?auto_96378 ?auto_96380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96380 ?auto_96379 ?auto_96377 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96392 - OBJ
      ?auto_96393 - OBJ
      ?auto_96394 - OBJ
      ?auto_96391 - LOCATION
    )
    :vars
    (
      ?auto_96395 - TRUCK
      ?auto_96397 - LOCATION
      ?auto_96396 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96395 ?auto_96397 ) ( IN-CITY ?auto_96397 ?auto_96396 ) ( IN-CITY ?auto_96391 ?auto_96396 ) ( not ( = ?auto_96391 ?auto_96397 ) ) ( OBJ-AT ?auto_96393 ?auto_96391 ) ( not ( = ?auto_96393 ?auto_96392 ) ) ( OBJ-AT ?auto_96392 ?auto_96397 ) ( OBJ-AT ?auto_96394 ?auto_96391 ) ( not ( = ?auto_96392 ?auto_96394 ) ) ( not ( = ?auto_96393 ?auto_96394 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96393 ?auto_96392 ?auto_96391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96421 - OBJ
      ?auto_96422 - OBJ
      ?auto_96423 - OBJ
      ?auto_96424 - OBJ
      ?auto_96420 - LOCATION
    )
    :vars
    (
      ?auto_96425 - TRUCK
      ?auto_96427 - LOCATION
      ?auto_96426 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96425 ?auto_96427 ) ( IN-CITY ?auto_96427 ?auto_96426 ) ( IN-CITY ?auto_96420 ?auto_96426 ) ( not ( = ?auto_96420 ?auto_96427 ) ) ( OBJ-AT ?auto_96423 ?auto_96420 ) ( not ( = ?auto_96423 ?auto_96424 ) ) ( OBJ-AT ?auto_96424 ?auto_96427 ) ( OBJ-AT ?auto_96421 ?auto_96420 ) ( OBJ-AT ?auto_96422 ?auto_96420 ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( not ( = ?auto_96421 ?auto_96424 ) ) ( not ( = ?auto_96422 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96424 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96423 ?auto_96424 ?auto_96420 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96429 - OBJ
      ?auto_96430 - OBJ
      ?auto_96431 - OBJ
      ?auto_96432 - OBJ
      ?auto_96428 - LOCATION
    )
    :vars
    (
      ?auto_96433 - TRUCK
      ?auto_96435 - LOCATION
      ?auto_96434 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96433 ?auto_96435 ) ( IN-CITY ?auto_96435 ?auto_96434 ) ( IN-CITY ?auto_96428 ?auto_96434 ) ( not ( = ?auto_96428 ?auto_96435 ) ) ( OBJ-AT ?auto_96429 ?auto_96428 ) ( not ( = ?auto_96429 ?auto_96431 ) ) ( OBJ-AT ?auto_96431 ?auto_96435 ) ( OBJ-AT ?auto_96430 ?auto_96428 ) ( OBJ-AT ?auto_96432 ?auto_96428 ) ( not ( = ?auto_96429 ?auto_96430 ) ) ( not ( = ?auto_96429 ?auto_96432 ) ) ( not ( = ?auto_96430 ?auto_96431 ) ) ( not ( = ?auto_96430 ?auto_96432 ) ) ( not ( = ?auto_96431 ?auto_96432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96429 ?auto_96431 ?auto_96428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96445 - OBJ
      ?auto_96446 - OBJ
      ?auto_96447 - OBJ
      ?auto_96448 - OBJ
      ?auto_96444 - LOCATION
    )
    :vars
    (
      ?auto_96449 - TRUCK
      ?auto_96451 - LOCATION
      ?auto_96450 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96449 ?auto_96451 ) ( IN-CITY ?auto_96451 ?auto_96450 ) ( IN-CITY ?auto_96444 ?auto_96450 ) ( not ( = ?auto_96444 ?auto_96451 ) ) ( OBJ-AT ?auto_96448 ?auto_96444 ) ( not ( = ?auto_96448 ?auto_96446 ) ) ( OBJ-AT ?auto_96446 ?auto_96451 ) ( OBJ-AT ?auto_96445 ?auto_96444 ) ( OBJ-AT ?auto_96447 ?auto_96444 ) ( not ( = ?auto_96445 ?auto_96446 ) ) ( not ( = ?auto_96445 ?auto_96447 ) ) ( not ( = ?auto_96445 ?auto_96448 ) ) ( not ( = ?auto_96446 ?auto_96447 ) ) ( not ( = ?auto_96447 ?auto_96448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96448 ?auto_96446 ?auto_96444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96477 - OBJ
      ?auto_96478 - OBJ
      ?auto_96479 - OBJ
      ?auto_96480 - OBJ
      ?auto_96476 - LOCATION
    )
    :vars
    (
      ?auto_96481 - TRUCK
      ?auto_96483 - LOCATION
      ?auto_96482 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96481 ?auto_96483 ) ( IN-CITY ?auto_96483 ?auto_96482 ) ( IN-CITY ?auto_96476 ?auto_96482 ) ( not ( = ?auto_96476 ?auto_96483 ) ) ( OBJ-AT ?auto_96478 ?auto_96476 ) ( not ( = ?auto_96478 ?auto_96477 ) ) ( OBJ-AT ?auto_96477 ?auto_96483 ) ( OBJ-AT ?auto_96479 ?auto_96476 ) ( OBJ-AT ?auto_96480 ?auto_96476 ) ( not ( = ?auto_96477 ?auto_96479 ) ) ( not ( = ?auto_96477 ?auto_96480 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96480 ) ) ( not ( = ?auto_96479 ?auto_96480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96478 ?auto_96477 ?auto_96476 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96542 - OBJ
      ?auto_96541 - LOCATION
    )
    :vars
    (
      ?auto_96545 - LOCATION
      ?auto_96544 - CITY
      ?auto_96546 - OBJ
      ?auto_96543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96545 ?auto_96544 ) ( IN-CITY ?auto_96541 ?auto_96544 ) ( not ( = ?auto_96541 ?auto_96545 ) ) ( OBJ-AT ?auto_96546 ?auto_96541 ) ( not ( = ?auto_96546 ?auto_96542 ) ) ( OBJ-AT ?auto_96542 ?auto_96545 ) ( TRUCK-AT ?auto_96543 ?auto_96541 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96543 ?auto_96541 ?auto_96545 ?auto_96544 )
      ( DELIVER-2PKG ?auto_96546 ?auto_96542 ?auto_96541 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96548 - OBJ
      ?auto_96549 - OBJ
      ?auto_96547 - LOCATION
    )
    :vars
    (
      ?auto_96552 - LOCATION
      ?auto_96551 - CITY
      ?auto_96550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96552 ?auto_96551 ) ( IN-CITY ?auto_96547 ?auto_96551 ) ( not ( = ?auto_96547 ?auto_96552 ) ) ( OBJ-AT ?auto_96548 ?auto_96547 ) ( not ( = ?auto_96548 ?auto_96549 ) ) ( OBJ-AT ?auto_96549 ?auto_96552 ) ( TRUCK-AT ?auto_96550 ?auto_96547 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96549 ?auto_96547 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96554 - OBJ
      ?auto_96555 - OBJ
      ?auto_96553 - LOCATION
    )
    :vars
    (
      ?auto_96558 - LOCATION
      ?auto_96557 - CITY
      ?auto_96556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96558 ?auto_96557 ) ( IN-CITY ?auto_96553 ?auto_96557 ) ( not ( = ?auto_96553 ?auto_96558 ) ) ( OBJ-AT ?auto_96555 ?auto_96553 ) ( not ( = ?auto_96555 ?auto_96554 ) ) ( OBJ-AT ?auto_96554 ?auto_96558 ) ( TRUCK-AT ?auto_96556 ?auto_96553 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96555 ?auto_96554 ?auto_96553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96567 - OBJ
      ?auto_96568 - OBJ
      ?auto_96569 - OBJ
      ?auto_96566 - LOCATION
    )
    :vars
    (
      ?auto_96572 - LOCATION
      ?auto_96571 - CITY
      ?auto_96570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96572 ?auto_96571 ) ( IN-CITY ?auto_96566 ?auto_96571 ) ( not ( = ?auto_96566 ?auto_96572 ) ) ( OBJ-AT ?auto_96567 ?auto_96566 ) ( not ( = ?auto_96567 ?auto_96569 ) ) ( OBJ-AT ?auto_96569 ?auto_96572 ) ( TRUCK-AT ?auto_96570 ?auto_96566 ) ( OBJ-AT ?auto_96568 ?auto_96566 ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( not ( = ?auto_96568 ?auto_96569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96567 ?auto_96569 ?auto_96566 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96574 - OBJ
      ?auto_96575 - OBJ
      ?auto_96576 - OBJ
      ?auto_96573 - LOCATION
    )
    :vars
    (
      ?auto_96579 - LOCATION
      ?auto_96578 - CITY
      ?auto_96577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96579 ?auto_96578 ) ( IN-CITY ?auto_96573 ?auto_96578 ) ( not ( = ?auto_96573 ?auto_96579 ) ) ( OBJ-AT ?auto_96574 ?auto_96573 ) ( not ( = ?auto_96574 ?auto_96575 ) ) ( OBJ-AT ?auto_96575 ?auto_96579 ) ( TRUCK-AT ?auto_96577 ?auto_96573 ) ( OBJ-AT ?auto_96576 ?auto_96573 ) ( not ( = ?auto_96574 ?auto_96576 ) ) ( not ( = ?auto_96575 ?auto_96576 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96574 ?auto_96575 ?auto_96573 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_96588 - OBJ
      ?auto_96589 - OBJ
      ?auto_96590 - OBJ
      ?auto_96587 - LOCATION
    )
    :vars
    (
      ?auto_96593 - LOCATION
      ?auto_96592 - CITY
      ?auto_96591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96593 ?auto_96592 ) ( IN-CITY ?auto_96587 ?auto_96592 ) ( not ( = ?auto_96587 ?auto_96593 ) ) ( OBJ-AT ?auto_96589 ?auto_96587 ) ( not ( = ?auto_96589 ?auto_96588 ) ) ( OBJ-AT ?auto_96588 ?auto_96593 ) ( TRUCK-AT ?auto_96591 ?auto_96587 ) ( OBJ-AT ?auto_96590 ?auto_96587 ) ( not ( = ?auto_96588 ?auto_96590 ) ) ( not ( = ?auto_96589 ?auto_96590 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96589 ?auto_96588 ?auto_96587 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96617 - OBJ
      ?auto_96618 - OBJ
      ?auto_96619 - OBJ
      ?auto_96620 - OBJ
      ?auto_96616 - LOCATION
    )
    :vars
    (
      ?auto_96623 - LOCATION
      ?auto_96622 - CITY
      ?auto_96621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96623 ?auto_96622 ) ( IN-CITY ?auto_96616 ?auto_96622 ) ( not ( = ?auto_96616 ?auto_96623 ) ) ( OBJ-AT ?auto_96617 ?auto_96616 ) ( not ( = ?auto_96617 ?auto_96620 ) ) ( OBJ-AT ?auto_96620 ?auto_96623 ) ( TRUCK-AT ?auto_96621 ?auto_96616 ) ( OBJ-AT ?auto_96618 ?auto_96616 ) ( OBJ-AT ?auto_96619 ?auto_96616 ) ( not ( = ?auto_96617 ?auto_96618 ) ) ( not ( = ?auto_96617 ?auto_96619 ) ) ( not ( = ?auto_96618 ?auto_96619 ) ) ( not ( = ?auto_96618 ?auto_96620 ) ) ( not ( = ?auto_96619 ?auto_96620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96617 ?auto_96620 ?auto_96616 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96625 - OBJ
      ?auto_96626 - OBJ
      ?auto_96627 - OBJ
      ?auto_96628 - OBJ
      ?auto_96624 - LOCATION
    )
    :vars
    (
      ?auto_96631 - LOCATION
      ?auto_96630 - CITY
      ?auto_96629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96631 ?auto_96630 ) ( IN-CITY ?auto_96624 ?auto_96630 ) ( not ( = ?auto_96624 ?auto_96631 ) ) ( OBJ-AT ?auto_96625 ?auto_96624 ) ( not ( = ?auto_96625 ?auto_96627 ) ) ( OBJ-AT ?auto_96627 ?auto_96631 ) ( TRUCK-AT ?auto_96629 ?auto_96624 ) ( OBJ-AT ?auto_96626 ?auto_96624 ) ( OBJ-AT ?auto_96628 ?auto_96624 ) ( not ( = ?auto_96625 ?auto_96626 ) ) ( not ( = ?auto_96625 ?auto_96628 ) ) ( not ( = ?auto_96626 ?auto_96627 ) ) ( not ( = ?auto_96626 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96625 ?auto_96627 ?auto_96624 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96641 - OBJ
      ?auto_96642 - OBJ
      ?auto_96643 - OBJ
      ?auto_96644 - OBJ
      ?auto_96640 - LOCATION
    )
    :vars
    (
      ?auto_96647 - LOCATION
      ?auto_96646 - CITY
      ?auto_96645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96647 ?auto_96646 ) ( IN-CITY ?auto_96640 ?auto_96646 ) ( not ( = ?auto_96640 ?auto_96647 ) ) ( OBJ-AT ?auto_96643 ?auto_96640 ) ( not ( = ?auto_96643 ?auto_96642 ) ) ( OBJ-AT ?auto_96642 ?auto_96647 ) ( TRUCK-AT ?auto_96645 ?auto_96640 ) ( OBJ-AT ?auto_96641 ?auto_96640 ) ( OBJ-AT ?auto_96644 ?auto_96640 ) ( not ( = ?auto_96641 ?auto_96642 ) ) ( not ( = ?auto_96641 ?auto_96643 ) ) ( not ( = ?auto_96641 ?auto_96644 ) ) ( not ( = ?auto_96642 ?auto_96644 ) ) ( not ( = ?auto_96643 ?auto_96644 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96643 ?auto_96642 ?auto_96640 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_96673 - OBJ
      ?auto_96674 - OBJ
      ?auto_96675 - OBJ
      ?auto_96676 - OBJ
      ?auto_96672 - LOCATION
    )
    :vars
    (
      ?auto_96679 - LOCATION
      ?auto_96678 - CITY
      ?auto_96677 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96679 ?auto_96678 ) ( IN-CITY ?auto_96672 ?auto_96678 ) ( not ( = ?auto_96672 ?auto_96679 ) ) ( OBJ-AT ?auto_96675 ?auto_96672 ) ( not ( = ?auto_96675 ?auto_96673 ) ) ( OBJ-AT ?auto_96673 ?auto_96679 ) ( TRUCK-AT ?auto_96677 ?auto_96672 ) ( OBJ-AT ?auto_96674 ?auto_96672 ) ( OBJ-AT ?auto_96676 ?auto_96672 ) ( not ( = ?auto_96673 ?auto_96674 ) ) ( not ( = ?auto_96673 ?auto_96676 ) ) ( not ( = ?auto_96674 ?auto_96675 ) ) ( not ( = ?auto_96674 ?auto_96676 ) ) ( not ( = ?auto_96675 ?auto_96676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96675 ?auto_96673 ?auto_96672 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96738 - OBJ
      ?auto_96737 - LOCATION
    )
    :vars
    (
      ?auto_96742 - LOCATION
      ?auto_96740 - CITY
      ?auto_96741 - OBJ
      ?auto_96739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96742 ?auto_96740 ) ( IN-CITY ?auto_96737 ?auto_96740 ) ( not ( = ?auto_96737 ?auto_96742 ) ) ( not ( = ?auto_96741 ?auto_96738 ) ) ( OBJ-AT ?auto_96738 ?auto_96742 ) ( TRUCK-AT ?auto_96739 ?auto_96737 ) ( IN-TRUCK ?auto_96741 ?auto_96739 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96741 ?auto_96737 )
      ( DELIVER-2PKG ?auto_96741 ?auto_96738 ?auto_96737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96744 - OBJ
      ?auto_96745 - OBJ
      ?auto_96743 - LOCATION
    )
    :vars
    (
      ?auto_96746 - LOCATION
      ?auto_96747 - CITY
      ?auto_96748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96746 ?auto_96747 ) ( IN-CITY ?auto_96743 ?auto_96747 ) ( not ( = ?auto_96743 ?auto_96746 ) ) ( not ( = ?auto_96744 ?auto_96745 ) ) ( OBJ-AT ?auto_96745 ?auto_96746 ) ( TRUCK-AT ?auto_96748 ?auto_96743 ) ( IN-TRUCK ?auto_96744 ?auto_96748 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96745 ?auto_96743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96750 - OBJ
      ?auto_96751 - OBJ
      ?auto_96749 - LOCATION
    )
    :vars
    (
      ?auto_96752 - LOCATION
      ?auto_96754 - CITY
      ?auto_96753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96752 ?auto_96754 ) ( IN-CITY ?auto_96749 ?auto_96754 ) ( not ( = ?auto_96749 ?auto_96752 ) ) ( not ( = ?auto_96751 ?auto_96750 ) ) ( OBJ-AT ?auto_96750 ?auto_96752 ) ( TRUCK-AT ?auto_96753 ?auto_96749 ) ( IN-TRUCK ?auto_96751 ?auto_96753 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96751 ?auto_96750 ?auto_96749 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96934 - OBJ
      ?auto_96933 - LOCATION
    )
    :vars
    (
      ?auto_96935 - LOCATION
      ?auto_96937 - CITY
      ?auto_96938 - OBJ
      ?auto_96936 - TRUCK
      ?auto_96939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96935 ?auto_96937 ) ( IN-CITY ?auto_96933 ?auto_96937 ) ( not ( = ?auto_96933 ?auto_96935 ) ) ( not ( = ?auto_96938 ?auto_96934 ) ) ( OBJ-AT ?auto_96934 ?auto_96935 ) ( IN-TRUCK ?auto_96938 ?auto_96936 ) ( TRUCK-AT ?auto_96936 ?auto_96939 ) ( IN-CITY ?auto_96939 ?auto_96937 ) ( not ( = ?auto_96933 ?auto_96939 ) ) ( not ( = ?auto_96935 ?auto_96939 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96936 ?auto_96939 ?auto_96933 ?auto_96937 )
      ( DELIVER-2PKG ?auto_96938 ?auto_96934 ?auto_96933 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96941 - OBJ
      ?auto_96942 - OBJ
      ?auto_96940 - LOCATION
    )
    :vars
    (
      ?auto_96944 - LOCATION
      ?auto_96943 - CITY
      ?auto_96945 - TRUCK
      ?auto_96946 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96944 ?auto_96943 ) ( IN-CITY ?auto_96940 ?auto_96943 ) ( not ( = ?auto_96940 ?auto_96944 ) ) ( not ( = ?auto_96941 ?auto_96942 ) ) ( OBJ-AT ?auto_96942 ?auto_96944 ) ( IN-TRUCK ?auto_96941 ?auto_96945 ) ( TRUCK-AT ?auto_96945 ?auto_96946 ) ( IN-CITY ?auto_96946 ?auto_96943 ) ( not ( = ?auto_96940 ?auto_96946 ) ) ( not ( = ?auto_96944 ?auto_96946 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96942 ?auto_96940 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96948 - OBJ
      ?auto_96949 - OBJ
      ?auto_96947 - LOCATION
    )
    :vars
    (
      ?auto_96952 - LOCATION
      ?auto_96951 - CITY
      ?auto_96950 - TRUCK
      ?auto_96953 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96952 ?auto_96951 ) ( IN-CITY ?auto_96947 ?auto_96951 ) ( not ( = ?auto_96947 ?auto_96952 ) ) ( not ( = ?auto_96949 ?auto_96948 ) ) ( OBJ-AT ?auto_96948 ?auto_96952 ) ( IN-TRUCK ?auto_96949 ?auto_96950 ) ( TRUCK-AT ?auto_96950 ?auto_96953 ) ( IN-CITY ?auto_96953 ?auto_96951 ) ( not ( = ?auto_96947 ?auto_96953 ) ) ( not ( = ?auto_96952 ?auto_96953 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96949 ?auto_96948 ?auto_96947 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_97156 - OBJ
      ?auto_97155 - LOCATION
    )
    :vars
    (
      ?auto_97160 - LOCATION
      ?auto_97159 - CITY
      ?auto_97158 - OBJ
      ?auto_97157 - TRUCK
      ?auto_97161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_97160 ?auto_97159 ) ( IN-CITY ?auto_97155 ?auto_97159 ) ( not ( = ?auto_97155 ?auto_97160 ) ) ( not ( = ?auto_97158 ?auto_97156 ) ) ( OBJ-AT ?auto_97156 ?auto_97160 ) ( TRUCK-AT ?auto_97157 ?auto_97161 ) ( IN-CITY ?auto_97161 ?auto_97159 ) ( not ( = ?auto_97155 ?auto_97161 ) ) ( not ( = ?auto_97160 ?auto_97161 ) ) ( OBJ-AT ?auto_97158 ?auto_97161 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_97158 ?auto_97157 ?auto_97161 )
      ( DELIVER-2PKG ?auto_97158 ?auto_97156 ?auto_97155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97163 - OBJ
      ?auto_97164 - OBJ
      ?auto_97162 - LOCATION
    )
    :vars
    (
      ?auto_97168 - LOCATION
      ?auto_97167 - CITY
      ?auto_97165 - TRUCK
      ?auto_97166 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_97168 ?auto_97167 ) ( IN-CITY ?auto_97162 ?auto_97167 ) ( not ( = ?auto_97162 ?auto_97168 ) ) ( not ( = ?auto_97163 ?auto_97164 ) ) ( OBJ-AT ?auto_97164 ?auto_97168 ) ( TRUCK-AT ?auto_97165 ?auto_97166 ) ( IN-CITY ?auto_97166 ?auto_97167 ) ( not ( = ?auto_97162 ?auto_97166 ) ) ( not ( = ?auto_97168 ?auto_97166 ) ) ( OBJ-AT ?auto_97163 ?auto_97166 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_97164 ?auto_97162 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_97170 - OBJ
      ?auto_97171 - OBJ
      ?auto_97169 - LOCATION
    )
    :vars
    (
      ?auto_97175 - LOCATION
      ?auto_97174 - CITY
      ?auto_97172 - TRUCK
      ?auto_97173 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_97175 ?auto_97174 ) ( IN-CITY ?auto_97169 ?auto_97174 ) ( not ( = ?auto_97169 ?auto_97175 ) ) ( not ( = ?auto_97171 ?auto_97170 ) ) ( OBJ-AT ?auto_97170 ?auto_97175 ) ( TRUCK-AT ?auto_97172 ?auto_97173 ) ( IN-CITY ?auto_97173 ?auto_97174 ) ( not ( = ?auto_97169 ?auto_97173 ) ) ( not ( = ?auto_97175 ?auto_97173 ) ) ( OBJ-AT ?auto_97171 ?auto_97173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97171 ?auto_97170 ?auto_97169 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98515 - OBJ
      ?auto_98516 - OBJ
      ?auto_98517 - OBJ
      ?auto_98514 - LOCATION
    )
    :vars
    (
      ?auto_98519 - TRUCK
      ?auto_98518 - LOCATION
      ?auto_98520 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98517 ?auto_98519 ) ( TRUCK-AT ?auto_98519 ?auto_98518 ) ( IN-CITY ?auto_98518 ?auto_98520 ) ( IN-CITY ?auto_98514 ?auto_98520 ) ( not ( = ?auto_98514 ?auto_98518 ) ) ( OBJ-AT ?auto_98515 ?auto_98514 ) ( not ( = ?auto_98515 ?auto_98517 ) ) ( OBJ-AT ?auto_98516 ?auto_98514 ) ( not ( = ?auto_98515 ?auto_98516 ) ) ( not ( = ?auto_98516 ?auto_98517 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98515 ?auto_98517 ?auto_98514 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98548 - OBJ
      ?auto_98549 - OBJ
      ?auto_98550 - OBJ
      ?auto_98547 - LOCATION
    )
    :vars
    (
      ?auto_98552 - TRUCK
      ?auto_98551 - LOCATION
      ?auto_98553 - CITY
      ?auto_98554 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98550 ?auto_98552 ) ( TRUCK-AT ?auto_98552 ?auto_98551 ) ( IN-CITY ?auto_98551 ?auto_98553 ) ( IN-CITY ?auto_98547 ?auto_98553 ) ( not ( = ?auto_98547 ?auto_98551 ) ) ( OBJ-AT ?auto_98554 ?auto_98547 ) ( not ( = ?auto_98554 ?auto_98550 ) ) ( OBJ-AT ?auto_98548 ?auto_98547 ) ( OBJ-AT ?auto_98549 ?auto_98547 ) ( not ( = ?auto_98548 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98550 ) ) ( not ( = ?auto_98548 ?auto_98554 ) ) ( not ( = ?auto_98549 ?auto_98550 ) ) ( not ( = ?auto_98549 ?auto_98554 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98554 ?auto_98550 ?auto_98547 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98560 - OBJ
      ?auto_98561 - OBJ
      ?auto_98562 - OBJ
      ?auto_98559 - LOCATION
    )
    :vars
    (
      ?auto_98564 - TRUCK
      ?auto_98563 - LOCATION
      ?auto_98565 - CITY
      ?auto_98566 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98561 ?auto_98564 ) ( TRUCK-AT ?auto_98564 ?auto_98563 ) ( IN-CITY ?auto_98563 ?auto_98565 ) ( IN-CITY ?auto_98559 ?auto_98565 ) ( not ( = ?auto_98559 ?auto_98563 ) ) ( OBJ-AT ?auto_98566 ?auto_98559 ) ( not ( = ?auto_98566 ?auto_98561 ) ) ( OBJ-AT ?auto_98560 ?auto_98559 ) ( OBJ-AT ?auto_98562 ?auto_98559 ) ( not ( = ?auto_98560 ?auto_98561 ) ) ( not ( = ?auto_98560 ?auto_98562 ) ) ( not ( = ?auto_98560 ?auto_98566 ) ) ( not ( = ?auto_98561 ?auto_98562 ) ) ( not ( = ?auto_98562 ?auto_98566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98566 ?auto_98561 ?auto_98559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98576 - OBJ
      ?auto_98577 - OBJ
      ?auto_98578 - OBJ
      ?auto_98575 - LOCATION
    )
    :vars
    (
      ?auto_98580 - TRUCK
      ?auto_98579 - LOCATION
      ?auto_98581 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98576 ?auto_98580 ) ( TRUCK-AT ?auto_98580 ?auto_98579 ) ( IN-CITY ?auto_98579 ?auto_98581 ) ( IN-CITY ?auto_98575 ?auto_98581 ) ( not ( = ?auto_98575 ?auto_98579 ) ) ( OBJ-AT ?auto_98578 ?auto_98575 ) ( not ( = ?auto_98578 ?auto_98576 ) ) ( OBJ-AT ?auto_98577 ?auto_98575 ) ( not ( = ?auto_98576 ?auto_98577 ) ) ( not ( = ?auto_98577 ?auto_98578 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98578 ?auto_98576 ?auto_98575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98598 - OBJ
      ?auto_98599 - OBJ
      ?auto_98600 - OBJ
      ?auto_98597 - LOCATION
    )
    :vars
    (
      ?auto_98602 - TRUCK
      ?auto_98601 - LOCATION
      ?auto_98603 - CITY
      ?auto_98604 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98598 ?auto_98602 ) ( TRUCK-AT ?auto_98602 ?auto_98601 ) ( IN-CITY ?auto_98601 ?auto_98603 ) ( IN-CITY ?auto_98597 ?auto_98603 ) ( not ( = ?auto_98597 ?auto_98601 ) ) ( OBJ-AT ?auto_98604 ?auto_98597 ) ( not ( = ?auto_98604 ?auto_98598 ) ) ( OBJ-AT ?auto_98599 ?auto_98597 ) ( OBJ-AT ?auto_98600 ?auto_98597 ) ( not ( = ?auto_98598 ?auto_98599 ) ) ( not ( = ?auto_98598 ?auto_98600 ) ) ( not ( = ?auto_98599 ?auto_98600 ) ) ( not ( = ?auto_98599 ?auto_98604 ) ) ( not ( = ?auto_98600 ?auto_98604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98604 ?auto_98598 ?auto_98597 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98637 - OBJ
      ?auto_98638 - OBJ
      ?auto_98639 - OBJ
      ?auto_98640 - OBJ
      ?auto_98636 - LOCATION
    )
    :vars
    (
      ?auto_98642 - TRUCK
      ?auto_98641 - LOCATION
      ?auto_98643 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98640 ?auto_98642 ) ( TRUCK-AT ?auto_98642 ?auto_98641 ) ( IN-CITY ?auto_98641 ?auto_98643 ) ( IN-CITY ?auto_98636 ?auto_98643 ) ( not ( = ?auto_98636 ?auto_98641 ) ) ( OBJ-AT ?auto_98637 ?auto_98636 ) ( not ( = ?auto_98637 ?auto_98640 ) ) ( OBJ-AT ?auto_98638 ?auto_98636 ) ( OBJ-AT ?auto_98639 ?auto_98636 ) ( not ( = ?auto_98637 ?auto_98638 ) ) ( not ( = ?auto_98637 ?auto_98639 ) ) ( not ( = ?auto_98638 ?auto_98639 ) ) ( not ( = ?auto_98638 ?auto_98640 ) ) ( not ( = ?auto_98639 ?auto_98640 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98637 ?auto_98640 ?auto_98636 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98653 - OBJ
      ?auto_98654 - OBJ
      ?auto_98655 - OBJ
      ?auto_98656 - OBJ
      ?auto_98652 - LOCATION
    )
    :vars
    (
      ?auto_98658 - TRUCK
      ?auto_98657 - LOCATION
      ?auto_98659 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98655 ?auto_98658 ) ( TRUCK-AT ?auto_98658 ?auto_98657 ) ( IN-CITY ?auto_98657 ?auto_98659 ) ( IN-CITY ?auto_98652 ?auto_98659 ) ( not ( = ?auto_98652 ?auto_98657 ) ) ( OBJ-AT ?auto_98653 ?auto_98652 ) ( not ( = ?auto_98653 ?auto_98655 ) ) ( OBJ-AT ?auto_98654 ?auto_98652 ) ( OBJ-AT ?auto_98656 ?auto_98652 ) ( not ( = ?auto_98653 ?auto_98654 ) ) ( not ( = ?auto_98653 ?auto_98656 ) ) ( not ( = ?auto_98654 ?auto_98655 ) ) ( not ( = ?auto_98654 ?auto_98656 ) ) ( not ( = ?auto_98655 ?auto_98656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98653 ?auto_98655 ?auto_98652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98677 - OBJ
      ?auto_98678 - OBJ
      ?auto_98679 - OBJ
      ?auto_98680 - OBJ
      ?auto_98676 - LOCATION
    )
    :vars
    (
      ?auto_98682 - TRUCK
      ?auto_98681 - LOCATION
      ?auto_98683 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98680 ?auto_98682 ) ( TRUCK-AT ?auto_98682 ?auto_98681 ) ( IN-CITY ?auto_98681 ?auto_98683 ) ( IN-CITY ?auto_98676 ?auto_98683 ) ( not ( = ?auto_98676 ?auto_98681 ) ) ( OBJ-AT ?auto_98679 ?auto_98676 ) ( not ( = ?auto_98679 ?auto_98680 ) ) ( OBJ-AT ?auto_98677 ?auto_98676 ) ( OBJ-AT ?auto_98678 ?auto_98676 ) ( not ( = ?auto_98677 ?auto_98678 ) ) ( not ( = ?auto_98677 ?auto_98679 ) ) ( not ( = ?auto_98677 ?auto_98680 ) ) ( not ( = ?auto_98678 ?auto_98679 ) ) ( not ( = ?auto_98678 ?auto_98680 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98679 ?auto_98680 ?auto_98676 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98725 - OBJ
      ?auto_98726 - OBJ
      ?auto_98727 - OBJ
      ?auto_98728 - OBJ
      ?auto_98724 - LOCATION
    )
    :vars
    (
      ?auto_98730 - TRUCK
      ?auto_98729 - LOCATION
      ?auto_98731 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98726 ?auto_98730 ) ( TRUCK-AT ?auto_98730 ?auto_98729 ) ( IN-CITY ?auto_98729 ?auto_98731 ) ( IN-CITY ?auto_98724 ?auto_98731 ) ( not ( = ?auto_98724 ?auto_98729 ) ) ( OBJ-AT ?auto_98725 ?auto_98724 ) ( not ( = ?auto_98725 ?auto_98726 ) ) ( OBJ-AT ?auto_98727 ?auto_98724 ) ( OBJ-AT ?auto_98728 ?auto_98724 ) ( not ( = ?auto_98725 ?auto_98727 ) ) ( not ( = ?auto_98725 ?auto_98728 ) ) ( not ( = ?auto_98726 ?auto_98727 ) ) ( not ( = ?auto_98726 ?auto_98728 ) ) ( not ( = ?auto_98727 ?auto_98728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98725 ?auto_98726 ?auto_98724 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98741 - OBJ
      ?auto_98742 - OBJ
      ?auto_98743 - OBJ
      ?auto_98744 - OBJ
      ?auto_98740 - LOCATION
    )
    :vars
    (
      ?auto_98746 - TRUCK
      ?auto_98745 - LOCATION
      ?auto_98747 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98742 ?auto_98746 ) ( TRUCK-AT ?auto_98746 ?auto_98745 ) ( IN-CITY ?auto_98745 ?auto_98747 ) ( IN-CITY ?auto_98740 ?auto_98747 ) ( not ( = ?auto_98740 ?auto_98745 ) ) ( OBJ-AT ?auto_98744 ?auto_98740 ) ( not ( = ?auto_98744 ?auto_98742 ) ) ( OBJ-AT ?auto_98741 ?auto_98740 ) ( OBJ-AT ?auto_98743 ?auto_98740 ) ( not ( = ?auto_98741 ?auto_98742 ) ) ( not ( = ?auto_98741 ?auto_98743 ) ) ( not ( = ?auto_98741 ?auto_98744 ) ) ( not ( = ?auto_98742 ?auto_98743 ) ) ( not ( = ?auto_98743 ?auto_98744 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98744 ?auto_98742 ?auto_98740 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98837 - OBJ
      ?auto_98838 - OBJ
      ?auto_98839 - OBJ
      ?auto_98840 - OBJ
      ?auto_98836 - LOCATION
    )
    :vars
    (
      ?auto_98842 - TRUCK
      ?auto_98841 - LOCATION
      ?auto_98843 - CITY
      ?auto_98844 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98840 ?auto_98842 ) ( TRUCK-AT ?auto_98842 ?auto_98841 ) ( IN-CITY ?auto_98841 ?auto_98843 ) ( IN-CITY ?auto_98836 ?auto_98843 ) ( not ( = ?auto_98836 ?auto_98841 ) ) ( OBJ-AT ?auto_98844 ?auto_98836 ) ( not ( = ?auto_98844 ?auto_98840 ) ) ( OBJ-AT ?auto_98837 ?auto_98836 ) ( OBJ-AT ?auto_98838 ?auto_98836 ) ( OBJ-AT ?auto_98839 ?auto_98836 ) ( not ( = ?auto_98837 ?auto_98838 ) ) ( not ( = ?auto_98837 ?auto_98839 ) ) ( not ( = ?auto_98837 ?auto_98840 ) ) ( not ( = ?auto_98837 ?auto_98844 ) ) ( not ( = ?auto_98838 ?auto_98839 ) ) ( not ( = ?auto_98838 ?auto_98840 ) ) ( not ( = ?auto_98838 ?auto_98844 ) ) ( not ( = ?auto_98839 ?auto_98840 ) ) ( not ( = ?auto_98839 ?auto_98844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98844 ?auto_98840 ?auto_98836 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98846 - OBJ
      ?auto_98847 - OBJ
      ?auto_98848 - OBJ
      ?auto_98849 - OBJ
      ?auto_98845 - LOCATION
    )
    :vars
    (
      ?auto_98851 - TRUCK
      ?auto_98850 - LOCATION
      ?auto_98852 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98848 ?auto_98851 ) ( TRUCK-AT ?auto_98851 ?auto_98850 ) ( IN-CITY ?auto_98850 ?auto_98852 ) ( IN-CITY ?auto_98845 ?auto_98852 ) ( not ( = ?auto_98845 ?auto_98850 ) ) ( OBJ-AT ?auto_98849 ?auto_98845 ) ( not ( = ?auto_98849 ?auto_98848 ) ) ( OBJ-AT ?auto_98846 ?auto_98845 ) ( OBJ-AT ?auto_98847 ?auto_98845 ) ( not ( = ?auto_98846 ?auto_98847 ) ) ( not ( = ?auto_98846 ?auto_98848 ) ) ( not ( = ?auto_98846 ?auto_98849 ) ) ( not ( = ?auto_98847 ?auto_98848 ) ) ( not ( = ?auto_98847 ?auto_98849 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98849 ?auto_98848 ?auto_98845 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98854 - OBJ
      ?auto_98855 - OBJ
      ?auto_98856 - OBJ
      ?auto_98857 - OBJ
      ?auto_98853 - LOCATION
    )
    :vars
    (
      ?auto_98859 - TRUCK
      ?auto_98858 - LOCATION
      ?auto_98860 - CITY
      ?auto_98861 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98856 ?auto_98859 ) ( TRUCK-AT ?auto_98859 ?auto_98858 ) ( IN-CITY ?auto_98858 ?auto_98860 ) ( IN-CITY ?auto_98853 ?auto_98860 ) ( not ( = ?auto_98853 ?auto_98858 ) ) ( OBJ-AT ?auto_98861 ?auto_98853 ) ( not ( = ?auto_98861 ?auto_98856 ) ) ( OBJ-AT ?auto_98854 ?auto_98853 ) ( OBJ-AT ?auto_98855 ?auto_98853 ) ( OBJ-AT ?auto_98857 ?auto_98853 ) ( not ( = ?auto_98854 ?auto_98855 ) ) ( not ( = ?auto_98854 ?auto_98856 ) ) ( not ( = ?auto_98854 ?auto_98857 ) ) ( not ( = ?auto_98854 ?auto_98861 ) ) ( not ( = ?auto_98855 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98857 ) ) ( not ( = ?auto_98855 ?auto_98861 ) ) ( not ( = ?auto_98856 ?auto_98857 ) ) ( not ( = ?auto_98857 ?auto_98861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98861 ?auto_98856 ?auto_98853 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98904 - OBJ
      ?auto_98905 - OBJ
      ?auto_98906 - OBJ
      ?auto_98907 - OBJ
      ?auto_98903 - LOCATION
    )
    :vars
    (
      ?auto_98909 - TRUCK
      ?auto_98908 - LOCATION
      ?auto_98910 - CITY
      ?auto_98911 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98905 ?auto_98909 ) ( TRUCK-AT ?auto_98909 ?auto_98908 ) ( IN-CITY ?auto_98908 ?auto_98910 ) ( IN-CITY ?auto_98903 ?auto_98910 ) ( not ( = ?auto_98903 ?auto_98908 ) ) ( OBJ-AT ?auto_98911 ?auto_98903 ) ( not ( = ?auto_98911 ?auto_98905 ) ) ( OBJ-AT ?auto_98904 ?auto_98903 ) ( OBJ-AT ?auto_98906 ?auto_98903 ) ( OBJ-AT ?auto_98907 ?auto_98903 ) ( not ( = ?auto_98904 ?auto_98905 ) ) ( not ( = ?auto_98904 ?auto_98906 ) ) ( not ( = ?auto_98904 ?auto_98907 ) ) ( not ( = ?auto_98904 ?auto_98911 ) ) ( not ( = ?auto_98905 ?auto_98906 ) ) ( not ( = ?auto_98905 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98911 ) ) ( not ( = ?auto_98907 ?auto_98911 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98911 ?auto_98905 ?auto_98903 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98948 - OBJ
      ?auto_98949 - OBJ
      ?auto_98950 - OBJ
      ?auto_98951 - OBJ
      ?auto_98947 - LOCATION
    )
    :vars
    (
      ?auto_98953 - TRUCK
      ?auto_98952 - LOCATION
      ?auto_98954 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98948 ?auto_98953 ) ( TRUCK-AT ?auto_98953 ?auto_98952 ) ( IN-CITY ?auto_98952 ?auto_98954 ) ( IN-CITY ?auto_98947 ?auto_98954 ) ( not ( = ?auto_98947 ?auto_98952 ) ) ( OBJ-AT ?auto_98949 ?auto_98947 ) ( not ( = ?auto_98949 ?auto_98948 ) ) ( OBJ-AT ?auto_98950 ?auto_98947 ) ( OBJ-AT ?auto_98951 ?auto_98947 ) ( not ( = ?auto_98948 ?auto_98950 ) ) ( not ( = ?auto_98948 ?auto_98951 ) ) ( not ( = ?auto_98949 ?auto_98950 ) ) ( not ( = ?auto_98949 ?auto_98951 ) ) ( not ( = ?auto_98950 ?auto_98951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98949 ?auto_98948 ?auto_98947 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99020 - OBJ
      ?auto_99021 - OBJ
      ?auto_99022 - OBJ
      ?auto_99023 - OBJ
      ?auto_99019 - LOCATION
    )
    :vars
    (
      ?auto_99025 - TRUCK
      ?auto_99024 - LOCATION
      ?auto_99026 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_99020 ?auto_99025 ) ( TRUCK-AT ?auto_99025 ?auto_99024 ) ( IN-CITY ?auto_99024 ?auto_99026 ) ( IN-CITY ?auto_99019 ?auto_99026 ) ( not ( = ?auto_99019 ?auto_99024 ) ) ( OBJ-AT ?auto_99023 ?auto_99019 ) ( not ( = ?auto_99023 ?auto_99020 ) ) ( OBJ-AT ?auto_99021 ?auto_99019 ) ( OBJ-AT ?auto_99022 ?auto_99019 ) ( not ( = ?auto_99020 ?auto_99021 ) ) ( not ( = ?auto_99020 ?auto_99022 ) ) ( not ( = ?auto_99021 ?auto_99022 ) ) ( not ( = ?auto_99021 ?auto_99023 ) ) ( not ( = ?auto_99022 ?auto_99023 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99023 ?auto_99020 ?auto_99019 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99052 - OBJ
      ?auto_99053 - OBJ
      ?auto_99054 - OBJ
      ?auto_99055 - OBJ
      ?auto_99051 - LOCATION
    )
    :vars
    (
      ?auto_99057 - TRUCK
      ?auto_99056 - LOCATION
      ?auto_99058 - CITY
      ?auto_99059 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_99052 ?auto_99057 ) ( TRUCK-AT ?auto_99057 ?auto_99056 ) ( IN-CITY ?auto_99056 ?auto_99058 ) ( IN-CITY ?auto_99051 ?auto_99058 ) ( not ( = ?auto_99051 ?auto_99056 ) ) ( OBJ-AT ?auto_99059 ?auto_99051 ) ( not ( = ?auto_99059 ?auto_99052 ) ) ( OBJ-AT ?auto_99053 ?auto_99051 ) ( OBJ-AT ?auto_99054 ?auto_99051 ) ( OBJ-AT ?auto_99055 ?auto_99051 ) ( not ( = ?auto_99052 ?auto_99053 ) ) ( not ( = ?auto_99052 ?auto_99054 ) ) ( not ( = ?auto_99052 ?auto_99055 ) ) ( not ( = ?auto_99053 ?auto_99054 ) ) ( not ( = ?auto_99053 ?auto_99055 ) ) ( not ( = ?auto_99053 ?auto_99059 ) ) ( not ( = ?auto_99054 ?auto_99055 ) ) ( not ( = ?auto_99054 ?auto_99059 ) ) ( not ( = ?auto_99055 ?auto_99059 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99059 ?auto_99052 ?auto_99051 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99203 - OBJ
      ?auto_99204 - OBJ
      ?auto_99205 - OBJ
      ?auto_99202 - LOCATION
    )
    :vars
    (
      ?auto_99206 - TRUCK
      ?auto_99207 - LOCATION
      ?auto_99208 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99206 ?auto_99207 ) ( IN-CITY ?auto_99207 ?auto_99208 ) ( IN-CITY ?auto_99202 ?auto_99208 ) ( not ( = ?auto_99202 ?auto_99207 ) ) ( OBJ-AT ?auto_99203 ?auto_99202 ) ( not ( = ?auto_99203 ?auto_99205 ) ) ( OBJ-AT ?auto_99205 ?auto_99207 ) ( OBJ-AT ?auto_99204 ?auto_99202 ) ( not ( = ?auto_99203 ?auto_99204 ) ) ( not ( = ?auto_99204 ?auto_99205 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99203 ?auto_99205 ?auto_99202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99236 - OBJ
      ?auto_99237 - OBJ
      ?auto_99238 - OBJ
      ?auto_99235 - LOCATION
    )
    :vars
    (
      ?auto_99239 - TRUCK
      ?auto_99240 - LOCATION
      ?auto_99242 - CITY
      ?auto_99241 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99239 ?auto_99240 ) ( IN-CITY ?auto_99240 ?auto_99242 ) ( IN-CITY ?auto_99235 ?auto_99242 ) ( not ( = ?auto_99235 ?auto_99240 ) ) ( OBJ-AT ?auto_99241 ?auto_99235 ) ( not ( = ?auto_99241 ?auto_99238 ) ) ( OBJ-AT ?auto_99238 ?auto_99240 ) ( OBJ-AT ?auto_99236 ?auto_99235 ) ( OBJ-AT ?auto_99237 ?auto_99235 ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99238 ) ) ( not ( = ?auto_99236 ?auto_99241 ) ) ( not ( = ?auto_99237 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99241 ?auto_99238 ?auto_99235 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99248 - OBJ
      ?auto_99249 - OBJ
      ?auto_99250 - OBJ
      ?auto_99247 - LOCATION
    )
    :vars
    (
      ?auto_99251 - TRUCK
      ?auto_99252 - LOCATION
      ?auto_99254 - CITY
      ?auto_99253 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99251 ?auto_99252 ) ( IN-CITY ?auto_99252 ?auto_99254 ) ( IN-CITY ?auto_99247 ?auto_99254 ) ( not ( = ?auto_99247 ?auto_99252 ) ) ( OBJ-AT ?auto_99253 ?auto_99247 ) ( not ( = ?auto_99253 ?auto_99249 ) ) ( OBJ-AT ?auto_99249 ?auto_99252 ) ( OBJ-AT ?auto_99248 ?auto_99247 ) ( OBJ-AT ?auto_99250 ?auto_99247 ) ( not ( = ?auto_99248 ?auto_99249 ) ) ( not ( = ?auto_99248 ?auto_99250 ) ) ( not ( = ?auto_99248 ?auto_99253 ) ) ( not ( = ?auto_99249 ?auto_99250 ) ) ( not ( = ?auto_99250 ?auto_99253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99253 ?auto_99249 ?auto_99247 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99264 - OBJ
      ?auto_99265 - OBJ
      ?auto_99266 - OBJ
      ?auto_99263 - LOCATION
    )
    :vars
    (
      ?auto_99267 - TRUCK
      ?auto_99268 - LOCATION
      ?auto_99269 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99267 ?auto_99268 ) ( IN-CITY ?auto_99268 ?auto_99269 ) ( IN-CITY ?auto_99263 ?auto_99269 ) ( not ( = ?auto_99263 ?auto_99268 ) ) ( OBJ-AT ?auto_99266 ?auto_99263 ) ( not ( = ?auto_99266 ?auto_99264 ) ) ( OBJ-AT ?auto_99264 ?auto_99268 ) ( OBJ-AT ?auto_99265 ?auto_99263 ) ( not ( = ?auto_99264 ?auto_99265 ) ) ( not ( = ?auto_99265 ?auto_99266 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99266 ?auto_99264 ?auto_99263 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99286 - OBJ
      ?auto_99287 - OBJ
      ?auto_99288 - OBJ
      ?auto_99285 - LOCATION
    )
    :vars
    (
      ?auto_99289 - TRUCK
      ?auto_99290 - LOCATION
      ?auto_99292 - CITY
      ?auto_99291 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99289 ?auto_99290 ) ( IN-CITY ?auto_99290 ?auto_99292 ) ( IN-CITY ?auto_99285 ?auto_99292 ) ( not ( = ?auto_99285 ?auto_99290 ) ) ( OBJ-AT ?auto_99291 ?auto_99285 ) ( not ( = ?auto_99291 ?auto_99286 ) ) ( OBJ-AT ?auto_99286 ?auto_99290 ) ( OBJ-AT ?auto_99287 ?auto_99285 ) ( OBJ-AT ?auto_99288 ?auto_99285 ) ( not ( = ?auto_99286 ?auto_99287 ) ) ( not ( = ?auto_99286 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99291 ) ) ( not ( = ?auto_99288 ?auto_99291 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99291 ?auto_99286 ?auto_99285 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99333 - OBJ
      ?auto_99334 - OBJ
      ?auto_99335 - OBJ
      ?auto_99336 - OBJ
      ?auto_99332 - LOCATION
    )
    :vars
    (
      ?auto_99337 - TRUCK
      ?auto_99338 - LOCATION
      ?auto_99339 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99337 ?auto_99338 ) ( IN-CITY ?auto_99338 ?auto_99339 ) ( IN-CITY ?auto_99332 ?auto_99339 ) ( not ( = ?auto_99332 ?auto_99338 ) ) ( OBJ-AT ?auto_99333 ?auto_99332 ) ( not ( = ?auto_99333 ?auto_99336 ) ) ( OBJ-AT ?auto_99336 ?auto_99338 ) ( OBJ-AT ?auto_99334 ?auto_99332 ) ( OBJ-AT ?auto_99335 ?auto_99332 ) ( not ( = ?auto_99333 ?auto_99334 ) ) ( not ( = ?auto_99333 ?auto_99335 ) ) ( not ( = ?auto_99334 ?auto_99335 ) ) ( not ( = ?auto_99334 ?auto_99336 ) ) ( not ( = ?auto_99335 ?auto_99336 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99333 ?auto_99336 ?auto_99332 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99341 - OBJ
      ?auto_99342 - OBJ
      ?auto_99343 - OBJ
      ?auto_99344 - OBJ
      ?auto_99340 - LOCATION
    )
    :vars
    (
      ?auto_99345 - TRUCK
      ?auto_99346 - LOCATION
      ?auto_99347 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99345 ?auto_99346 ) ( IN-CITY ?auto_99346 ?auto_99347 ) ( IN-CITY ?auto_99340 ?auto_99347 ) ( not ( = ?auto_99340 ?auto_99346 ) ) ( OBJ-AT ?auto_99342 ?auto_99340 ) ( not ( = ?auto_99342 ?auto_99343 ) ) ( OBJ-AT ?auto_99343 ?auto_99346 ) ( OBJ-AT ?auto_99341 ?auto_99340 ) ( OBJ-AT ?auto_99344 ?auto_99340 ) ( not ( = ?auto_99341 ?auto_99342 ) ) ( not ( = ?auto_99341 ?auto_99343 ) ) ( not ( = ?auto_99341 ?auto_99344 ) ) ( not ( = ?auto_99342 ?auto_99344 ) ) ( not ( = ?auto_99343 ?auto_99344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99342 ?auto_99343 ?auto_99340 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99405 - OBJ
      ?auto_99406 - OBJ
      ?auto_99407 - OBJ
      ?auto_99408 - OBJ
      ?auto_99404 - LOCATION
    )
    :vars
    (
      ?auto_99409 - TRUCK
      ?auto_99410 - LOCATION
      ?auto_99411 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99409 ?auto_99410 ) ( IN-CITY ?auto_99410 ?auto_99411 ) ( IN-CITY ?auto_99404 ?auto_99411 ) ( not ( = ?auto_99404 ?auto_99410 ) ) ( OBJ-AT ?auto_99407 ?auto_99404 ) ( not ( = ?auto_99407 ?auto_99406 ) ) ( OBJ-AT ?auto_99406 ?auto_99410 ) ( OBJ-AT ?auto_99405 ?auto_99404 ) ( OBJ-AT ?auto_99408 ?auto_99404 ) ( not ( = ?auto_99405 ?auto_99406 ) ) ( not ( = ?auto_99405 ?auto_99407 ) ) ( not ( = ?auto_99405 ?auto_99408 ) ) ( not ( = ?auto_99406 ?auto_99408 ) ) ( not ( = ?auto_99407 ?auto_99408 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99407 ?auto_99406 ?auto_99404 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99413 - OBJ
      ?auto_99414 - OBJ
      ?auto_99415 - OBJ
      ?auto_99416 - OBJ
      ?auto_99412 - LOCATION
    )
    :vars
    (
      ?auto_99417 - TRUCK
      ?auto_99418 - LOCATION
      ?auto_99419 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99417 ?auto_99418 ) ( IN-CITY ?auto_99418 ?auto_99419 ) ( IN-CITY ?auto_99412 ?auto_99419 ) ( not ( = ?auto_99412 ?auto_99418 ) ) ( OBJ-AT ?auto_99413 ?auto_99412 ) ( not ( = ?auto_99413 ?auto_99414 ) ) ( OBJ-AT ?auto_99414 ?auto_99418 ) ( OBJ-AT ?auto_99415 ?auto_99412 ) ( OBJ-AT ?auto_99416 ?auto_99412 ) ( not ( = ?auto_99413 ?auto_99415 ) ) ( not ( = ?auto_99413 ?auto_99416 ) ) ( not ( = ?auto_99414 ?auto_99415 ) ) ( not ( = ?auto_99414 ?auto_99416 ) ) ( not ( = ?auto_99415 ?auto_99416 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99413 ?auto_99414 ?auto_99412 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99477 - OBJ
      ?auto_99478 - OBJ
      ?auto_99479 - OBJ
      ?auto_99480 - OBJ
      ?auto_99476 - LOCATION
    )
    :vars
    (
      ?auto_99481 - TRUCK
      ?auto_99482 - LOCATION
      ?auto_99483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99481 ?auto_99482 ) ( IN-CITY ?auto_99482 ?auto_99483 ) ( IN-CITY ?auto_99476 ?auto_99483 ) ( not ( = ?auto_99476 ?auto_99482 ) ) ( OBJ-AT ?auto_99478 ?auto_99476 ) ( not ( = ?auto_99478 ?auto_99480 ) ) ( OBJ-AT ?auto_99480 ?auto_99482 ) ( OBJ-AT ?auto_99477 ?auto_99476 ) ( OBJ-AT ?auto_99479 ?auto_99476 ) ( not ( = ?auto_99477 ?auto_99478 ) ) ( not ( = ?auto_99477 ?auto_99479 ) ) ( not ( = ?auto_99477 ?auto_99480 ) ) ( not ( = ?auto_99478 ?auto_99479 ) ) ( not ( = ?auto_99479 ?auto_99480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99478 ?auto_99480 ?auto_99476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99525 - OBJ
      ?auto_99526 - OBJ
      ?auto_99527 - OBJ
      ?auto_99528 - OBJ
      ?auto_99524 - LOCATION
    )
    :vars
    (
      ?auto_99529 - TRUCK
      ?auto_99530 - LOCATION
      ?auto_99532 - CITY
      ?auto_99531 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99529 ?auto_99530 ) ( IN-CITY ?auto_99530 ?auto_99532 ) ( IN-CITY ?auto_99524 ?auto_99532 ) ( not ( = ?auto_99524 ?auto_99530 ) ) ( OBJ-AT ?auto_99531 ?auto_99524 ) ( not ( = ?auto_99531 ?auto_99528 ) ) ( OBJ-AT ?auto_99528 ?auto_99530 ) ( OBJ-AT ?auto_99525 ?auto_99524 ) ( OBJ-AT ?auto_99526 ?auto_99524 ) ( OBJ-AT ?auto_99527 ?auto_99524 ) ( not ( = ?auto_99525 ?auto_99526 ) ) ( not ( = ?auto_99525 ?auto_99527 ) ) ( not ( = ?auto_99525 ?auto_99528 ) ) ( not ( = ?auto_99525 ?auto_99531 ) ) ( not ( = ?auto_99526 ?auto_99527 ) ) ( not ( = ?auto_99526 ?auto_99528 ) ) ( not ( = ?auto_99526 ?auto_99531 ) ) ( not ( = ?auto_99527 ?auto_99528 ) ) ( not ( = ?auto_99527 ?auto_99531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99531 ?auto_99528 ?auto_99524 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99534 - OBJ
      ?auto_99535 - OBJ
      ?auto_99536 - OBJ
      ?auto_99537 - OBJ
      ?auto_99533 - LOCATION
    )
    :vars
    (
      ?auto_99538 - TRUCK
      ?auto_99539 - LOCATION
      ?auto_99540 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99538 ?auto_99539 ) ( IN-CITY ?auto_99539 ?auto_99540 ) ( IN-CITY ?auto_99533 ?auto_99540 ) ( not ( = ?auto_99533 ?auto_99539 ) ) ( OBJ-AT ?auto_99537 ?auto_99533 ) ( not ( = ?auto_99537 ?auto_99536 ) ) ( OBJ-AT ?auto_99536 ?auto_99539 ) ( OBJ-AT ?auto_99534 ?auto_99533 ) ( OBJ-AT ?auto_99535 ?auto_99533 ) ( not ( = ?auto_99534 ?auto_99535 ) ) ( not ( = ?auto_99534 ?auto_99536 ) ) ( not ( = ?auto_99534 ?auto_99537 ) ) ( not ( = ?auto_99535 ?auto_99536 ) ) ( not ( = ?auto_99535 ?auto_99537 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99537 ?auto_99536 ?auto_99533 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99542 - OBJ
      ?auto_99543 - OBJ
      ?auto_99544 - OBJ
      ?auto_99545 - OBJ
      ?auto_99541 - LOCATION
    )
    :vars
    (
      ?auto_99546 - TRUCK
      ?auto_99547 - LOCATION
      ?auto_99549 - CITY
      ?auto_99548 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99546 ?auto_99547 ) ( IN-CITY ?auto_99547 ?auto_99549 ) ( IN-CITY ?auto_99541 ?auto_99549 ) ( not ( = ?auto_99541 ?auto_99547 ) ) ( OBJ-AT ?auto_99548 ?auto_99541 ) ( not ( = ?auto_99548 ?auto_99544 ) ) ( OBJ-AT ?auto_99544 ?auto_99547 ) ( OBJ-AT ?auto_99542 ?auto_99541 ) ( OBJ-AT ?auto_99543 ?auto_99541 ) ( OBJ-AT ?auto_99545 ?auto_99541 ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99542 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99548 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99545 ) ) ( not ( = ?auto_99543 ?auto_99548 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) ( not ( = ?auto_99545 ?auto_99548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99548 ?auto_99544 ?auto_99541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99592 - OBJ
      ?auto_99593 - OBJ
      ?auto_99594 - OBJ
      ?auto_99595 - OBJ
      ?auto_99591 - LOCATION
    )
    :vars
    (
      ?auto_99596 - TRUCK
      ?auto_99597 - LOCATION
      ?auto_99599 - CITY
      ?auto_99598 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99596 ?auto_99597 ) ( IN-CITY ?auto_99597 ?auto_99599 ) ( IN-CITY ?auto_99591 ?auto_99599 ) ( not ( = ?auto_99591 ?auto_99597 ) ) ( OBJ-AT ?auto_99598 ?auto_99591 ) ( not ( = ?auto_99598 ?auto_99593 ) ) ( OBJ-AT ?auto_99593 ?auto_99597 ) ( OBJ-AT ?auto_99592 ?auto_99591 ) ( OBJ-AT ?auto_99594 ?auto_99591 ) ( OBJ-AT ?auto_99595 ?auto_99591 ) ( not ( = ?auto_99592 ?auto_99593 ) ) ( not ( = ?auto_99592 ?auto_99594 ) ) ( not ( = ?auto_99592 ?auto_99595 ) ) ( not ( = ?auto_99592 ?auto_99598 ) ) ( not ( = ?auto_99593 ?auto_99594 ) ) ( not ( = ?auto_99593 ?auto_99595 ) ) ( not ( = ?auto_99594 ?auto_99595 ) ) ( not ( = ?auto_99594 ?auto_99598 ) ) ( not ( = ?auto_99595 ?auto_99598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99598 ?auto_99593 ?auto_99591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99660 - OBJ
      ?auto_99661 - OBJ
      ?auto_99662 - OBJ
      ?auto_99663 - OBJ
      ?auto_99659 - LOCATION
    )
    :vars
    (
      ?auto_99664 - TRUCK
      ?auto_99665 - LOCATION
      ?auto_99666 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99664 ?auto_99665 ) ( IN-CITY ?auto_99665 ?auto_99666 ) ( IN-CITY ?auto_99659 ?auto_99666 ) ( not ( = ?auto_99659 ?auto_99665 ) ) ( OBJ-AT ?auto_99663 ?auto_99659 ) ( not ( = ?auto_99663 ?auto_99660 ) ) ( OBJ-AT ?auto_99660 ?auto_99665 ) ( OBJ-AT ?auto_99661 ?auto_99659 ) ( OBJ-AT ?auto_99662 ?auto_99659 ) ( not ( = ?auto_99660 ?auto_99661 ) ) ( not ( = ?auto_99660 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99663 ) ) ( not ( = ?auto_99662 ?auto_99663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99663 ?auto_99660 ?auto_99659 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99716 - OBJ
      ?auto_99717 - OBJ
      ?auto_99718 - OBJ
      ?auto_99719 - OBJ
      ?auto_99715 - LOCATION
    )
    :vars
    (
      ?auto_99720 - TRUCK
      ?auto_99721 - LOCATION
      ?auto_99722 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99720 ?auto_99721 ) ( IN-CITY ?auto_99721 ?auto_99722 ) ( IN-CITY ?auto_99715 ?auto_99722 ) ( not ( = ?auto_99715 ?auto_99721 ) ) ( OBJ-AT ?auto_99718 ?auto_99715 ) ( not ( = ?auto_99718 ?auto_99716 ) ) ( OBJ-AT ?auto_99716 ?auto_99721 ) ( OBJ-AT ?auto_99717 ?auto_99715 ) ( OBJ-AT ?auto_99719 ?auto_99715 ) ( not ( = ?auto_99716 ?auto_99717 ) ) ( not ( = ?auto_99716 ?auto_99719 ) ) ( not ( = ?auto_99717 ?auto_99718 ) ) ( not ( = ?auto_99717 ?auto_99719 ) ) ( not ( = ?auto_99718 ?auto_99719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99718 ?auto_99716 ?auto_99715 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99740 - OBJ
      ?auto_99741 - OBJ
      ?auto_99742 - OBJ
      ?auto_99743 - OBJ
      ?auto_99739 - LOCATION
    )
    :vars
    (
      ?auto_99744 - TRUCK
      ?auto_99745 - LOCATION
      ?auto_99747 - CITY
      ?auto_99746 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99744 ?auto_99745 ) ( IN-CITY ?auto_99745 ?auto_99747 ) ( IN-CITY ?auto_99739 ?auto_99747 ) ( not ( = ?auto_99739 ?auto_99745 ) ) ( OBJ-AT ?auto_99746 ?auto_99739 ) ( not ( = ?auto_99746 ?auto_99740 ) ) ( OBJ-AT ?auto_99740 ?auto_99745 ) ( OBJ-AT ?auto_99741 ?auto_99739 ) ( OBJ-AT ?auto_99742 ?auto_99739 ) ( OBJ-AT ?auto_99743 ?auto_99739 ) ( not ( = ?auto_99740 ?auto_99741 ) ) ( not ( = ?auto_99740 ?auto_99742 ) ) ( not ( = ?auto_99740 ?auto_99743 ) ) ( not ( = ?auto_99741 ?auto_99742 ) ) ( not ( = ?auto_99741 ?auto_99743 ) ) ( not ( = ?auto_99741 ?auto_99746 ) ) ( not ( = ?auto_99742 ?auto_99743 ) ) ( not ( = ?auto_99742 ?auto_99746 ) ) ( not ( = ?auto_99743 ?auto_99746 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99746 ?auto_99740 ?auto_99739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99891 - OBJ
      ?auto_99892 - OBJ
      ?auto_99893 - OBJ
      ?auto_99890 - LOCATION
    )
    :vars
    (
      ?auto_99894 - LOCATION
      ?auto_99896 - CITY
      ?auto_99895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99894 ?auto_99896 ) ( IN-CITY ?auto_99890 ?auto_99896 ) ( not ( = ?auto_99890 ?auto_99894 ) ) ( OBJ-AT ?auto_99892 ?auto_99890 ) ( not ( = ?auto_99892 ?auto_99893 ) ) ( OBJ-AT ?auto_99893 ?auto_99894 ) ( TRUCK-AT ?auto_99895 ?auto_99890 ) ( OBJ-AT ?auto_99891 ?auto_99890 ) ( not ( = ?auto_99891 ?auto_99892 ) ) ( not ( = ?auto_99891 ?auto_99893 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99892 ?auto_99893 ?auto_99890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99924 - OBJ
      ?auto_99925 - OBJ
      ?auto_99926 - OBJ
      ?auto_99923 - LOCATION
    )
    :vars
    (
      ?auto_99928 - LOCATION
      ?auto_99930 - CITY
      ?auto_99927 - OBJ
      ?auto_99929 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99928 ?auto_99930 ) ( IN-CITY ?auto_99923 ?auto_99930 ) ( not ( = ?auto_99923 ?auto_99928 ) ) ( OBJ-AT ?auto_99927 ?auto_99923 ) ( not ( = ?auto_99927 ?auto_99926 ) ) ( OBJ-AT ?auto_99926 ?auto_99928 ) ( TRUCK-AT ?auto_99929 ?auto_99923 ) ( OBJ-AT ?auto_99924 ?auto_99923 ) ( OBJ-AT ?auto_99925 ?auto_99923 ) ( not ( = ?auto_99924 ?auto_99925 ) ) ( not ( = ?auto_99924 ?auto_99926 ) ) ( not ( = ?auto_99924 ?auto_99927 ) ) ( not ( = ?auto_99925 ?auto_99926 ) ) ( not ( = ?auto_99925 ?auto_99927 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99927 ?auto_99926 ?auto_99923 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99936 - OBJ
      ?auto_99937 - OBJ
      ?auto_99938 - OBJ
      ?auto_99935 - LOCATION
    )
    :vars
    (
      ?auto_99940 - LOCATION
      ?auto_99942 - CITY
      ?auto_99939 - OBJ
      ?auto_99941 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99940 ?auto_99942 ) ( IN-CITY ?auto_99935 ?auto_99942 ) ( not ( = ?auto_99935 ?auto_99940 ) ) ( OBJ-AT ?auto_99939 ?auto_99935 ) ( not ( = ?auto_99939 ?auto_99937 ) ) ( OBJ-AT ?auto_99937 ?auto_99940 ) ( TRUCK-AT ?auto_99941 ?auto_99935 ) ( OBJ-AT ?auto_99936 ?auto_99935 ) ( OBJ-AT ?auto_99938 ?auto_99935 ) ( not ( = ?auto_99936 ?auto_99937 ) ) ( not ( = ?auto_99936 ?auto_99938 ) ) ( not ( = ?auto_99936 ?auto_99939 ) ) ( not ( = ?auto_99937 ?auto_99938 ) ) ( not ( = ?auto_99938 ?auto_99939 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99939 ?auto_99937 ?auto_99935 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99974 - OBJ
      ?auto_99975 - OBJ
      ?auto_99976 - OBJ
      ?auto_99973 - LOCATION
    )
    :vars
    (
      ?auto_99978 - LOCATION
      ?auto_99980 - CITY
      ?auto_99977 - OBJ
      ?auto_99979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99978 ?auto_99980 ) ( IN-CITY ?auto_99973 ?auto_99980 ) ( not ( = ?auto_99973 ?auto_99978 ) ) ( OBJ-AT ?auto_99977 ?auto_99973 ) ( not ( = ?auto_99977 ?auto_99974 ) ) ( OBJ-AT ?auto_99974 ?auto_99978 ) ( TRUCK-AT ?auto_99979 ?auto_99973 ) ( OBJ-AT ?auto_99975 ?auto_99973 ) ( OBJ-AT ?auto_99976 ?auto_99973 ) ( not ( = ?auto_99974 ?auto_99975 ) ) ( not ( = ?auto_99974 ?auto_99976 ) ) ( not ( = ?auto_99975 ?auto_99976 ) ) ( not ( = ?auto_99975 ?auto_99977 ) ) ( not ( = ?auto_99976 ?auto_99977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99977 ?auto_99974 ?auto_99973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100053 - OBJ
      ?auto_100054 - OBJ
      ?auto_100055 - OBJ
      ?auto_100056 - OBJ
      ?auto_100052 - LOCATION
    )
    :vars
    (
      ?auto_100057 - LOCATION
      ?auto_100059 - CITY
      ?auto_100058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100057 ?auto_100059 ) ( IN-CITY ?auto_100052 ?auto_100059 ) ( not ( = ?auto_100052 ?auto_100057 ) ) ( OBJ-AT ?auto_100055 ?auto_100052 ) ( not ( = ?auto_100055 ?auto_100056 ) ) ( OBJ-AT ?auto_100056 ?auto_100057 ) ( TRUCK-AT ?auto_100058 ?auto_100052 ) ( OBJ-AT ?auto_100053 ?auto_100052 ) ( OBJ-AT ?auto_100054 ?auto_100052 ) ( not ( = ?auto_100053 ?auto_100054 ) ) ( not ( = ?auto_100053 ?auto_100055 ) ) ( not ( = ?auto_100053 ?auto_100056 ) ) ( not ( = ?auto_100054 ?auto_100055 ) ) ( not ( = ?auto_100054 ?auto_100056 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100055 ?auto_100056 ?auto_100052 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100093 - OBJ
      ?auto_100094 - OBJ
      ?auto_100095 - OBJ
      ?auto_100096 - OBJ
      ?auto_100092 - LOCATION
    )
    :vars
    (
      ?auto_100097 - LOCATION
      ?auto_100099 - CITY
      ?auto_100098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100097 ?auto_100099 ) ( IN-CITY ?auto_100092 ?auto_100099 ) ( not ( = ?auto_100092 ?auto_100097 ) ) ( OBJ-AT ?auto_100093 ?auto_100092 ) ( not ( = ?auto_100093 ?auto_100094 ) ) ( OBJ-AT ?auto_100094 ?auto_100097 ) ( TRUCK-AT ?auto_100098 ?auto_100092 ) ( OBJ-AT ?auto_100095 ?auto_100092 ) ( OBJ-AT ?auto_100096 ?auto_100092 ) ( not ( = ?auto_100093 ?auto_100095 ) ) ( not ( = ?auto_100093 ?auto_100096 ) ) ( not ( = ?auto_100094 ?auto_100095 ) ) ( not ( = ?auto_100094 ?auto_100096 ) ) ( not ( = ?auto_100095 ?auto_100096 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100093 ?auto_100094 ?auto_100092 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100117 - OBJ
      ?auto_100118 - OBJ
      ?auto_100119 - OBJ
      ?auto_100120 - OBJ
      ?auto_100116 - LOCATION
    )
    :vars
    (
      ?auto_100121 - LOCATION
      ?auto_100123 - CITY
      ?auto_100122 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100121 ?auto_100123 ) ( IN-CITY ?auto_100116 ?auto_100123 ) ( not ( = ?auto_100116 ?auto_100121 ) ) ( OBJ-AT ?auto_100120 ?auto_100116 ) ( not ( = ?auto_100120 ?auto_100118 ) ) ( OBJ-AT ?auto_100118 ?auto_100121 ) ( TRUCK-AT ?auto_100122 ?auto_100116 ) ( OBJ-AT ?auto_100117 ?auto_100116 ) ( OBJ-AT ?auto_100119 ?auto_100116 ) ( not ( = ?auto_100117 ?auto_100118 ) ) ( not ( = ?auto_100117 ?auto_100119 ) ) ( not ( = ?auto_100117 ?auto_100120 ) ) ( not ( = ?auto_100118 ?auto_100119 ) ) ( not ( = ?auto_100119 ?auto_100120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100120 ?auto_100118 ?auto_100116 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100173 - OBJ
      ?auto_100174 - OBJ
      ?auto_100175 - OBJ
      ?auto_100176 - OBJ
      ?auto_100172 - LOCATION
    )
    :vars
    (
      ?auto_100177 - LOCATION
      ?auto_100179 - CITY
      ?auto_100178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100177 ?auto_100179 ) ( IN-CITY ?auto_100172 ?auto_100179 ) ( not ( = ?auto_100172 ?auto_100177 ) ) ( OBJ-AT ?auto_100174 ?auto_100172 ) ( not ( = ?auto_100174 ?auto_100176 ) ) ( OBJ-AT ?auto_100176 ?auto_100177 ) ( TRUCK-AT ?auto_100178 ?auto_100172 ) ( OBJ-AT ?auto_100173 ?auto_100172 ) ( OBJ-AT ?auto_100175 ?auto_100172 ) ( not ( = ?auto_100173 ?auto_100174 ) ) ( not ( = ?auto_100173 ?auto_100175 ) ) ( not ( = ?auto_100173 ?auto_100176 ) ) ( not ( = ?auto_100174 ?auto_100175 ) ) ( not ( = ?auto_100175 ?auto_100176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100174 ?auto_100176 ?auto_100172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100181 - OBJ
      ?auto_100182 - OBJ
      ?auto_100183 - OBJ
      ?auto_100184 - OBJ
      ?auto_100180 - LOCATION
    )
    :vars
    (
      ?auto_100185 - LOCATION
      ?auto_100187 - CITY
      ?auto_100186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100185 ?auto_100187 ) ( IN-CITY ?auto_100180 ?auto_100187 ) ( not ( = ?auto_100180 ?auto_100185 ) ) ( OBJ-AT ?auto_100184 ?auto_100180 ) ( not ( = ?auto_100184 ?auto_100183 ) ) ( OBJ-AT ?auto_100183 ?auto_100185 ) ( TRUCK-AT ?auto_100186 ?auto_100180 ) ( OBJ-AT ?auto_100181 ?auto_100180 ) ( OBJ-AT ?auto_100182 ?auto_100180 ) ( not ( = ?auto_100181 ?auto_100182 ) ) ( not ( = ?auto_100181 ?auto_100183 ) ) ( not ( = ?auto_100181 ?auto_100184 ) ) ( not ( = ?auto_100182 ?auto_100183 ) ) ( not ( = ?auto_100182 ?auto_100184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100184 ?auto_100183 ?auto_100180 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100189 - OBJ
      ?auto_100190 - OBJ
      ?auto_100191 - OBJ
      ?auto_100192 - OBJ
      ?auto_100188 - LOCATION
    )
    :vars
    (
      ?auto_100193 - LOCATION
      ?auto_100195 - CITY
      ?auto_100194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100193 ?auto_100195 ) ( IN-CITY ?auto_100188 ?auto_100195 ) ( not ( = ?auto_100188 ?auto_100193 ) ) ( OBJ-AT ?auto_100190 ?auto_100188 ) ( not ( = ?auto_100190 ?auto_100191 ) ) ( OBJ-AT ?auto_100191 ?auto_100193 ) ( TRUCK-AT ?auto_100194 ?auto_100188 ) ( OBJ-AT ?auto_100189 ?auto_100188 ) ( OBJ-AT ?auto_100192 ?auto_100188 ) ( not ( = ?auto_100189 ?auto_100190 ) ) ( not ( = ?auto_100189 ?auto_100191 ) ) ( not ( = ?auto_100189 ?auto_100192 ) ) ( not ( = ?auto_100190 ?auto_100192 ) ) ( not ( = ?auto_100191 ?auto_100192 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100190 ?auto_100191 ?auto_100188 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100213 - OBJ
      ?auto_100214 - OBJ
      ?auto_100215 - OBJ
      ?auto_100216 - OBJ
      ?auto_100212 - LOCATION
    )
    :vars
    (
      ?auto_100218 - LOCATION
      ?auto_100220 - CITY
      ?auto_100217 - OBJ
      ?auto_100219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100218 ?auto_100220 ) ( IN-CITY ?auto_100212 ?auto_100220 ) ( not ( = ?auto_100212 ?auto_100218 ) ) ( OBJ-AT ?auto_100217 ?auto_100212 ) ( not ( = ?auto_100217 ?auto_100216 ) ) ( OBJ-AT ?auto_100216 ?auto_100218 ) ( TRUCK-AT ?auto_100219 ?auto_100212 ) ( OBJ-AT ?auto_100213 ?auto_100212 ) ( OBJ-AT ?auto_100214 ?auto_100212 ) ( OBJ-AT ?auto_100215 ?auto_100212 ) ( not ( = ?auto_100213 ?auto_100214 ) ) ( not ( = ?auto_100213 ?auto_100215 ) ) ( not ( = ?auto_100213 ?auto_100216 ) ) ( not ( = ?auto_100213 ?auto_100217 ) ) ( not ( = ?auto_100214 ?auto_100215 ) ) ( not ( = ?auto_100214 ?auto_100216 ) ) ( not ( = ?auto_100214 ?auto_100217 ) ) ( not ( = ?auto_100215 ?auto_100216 ) ) ( not ( = ?auto_100215 ?auto_100217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100217 ?auto_100216 ?auto_100212 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100230 - OBJ
      ?auto_100231 - OBJ
      ?auto_100232 - OBJ
      ?auto_100233 - OBJ
      ?auto_100229 - LOCATION
    )
    :vars
    (
      ?auto_100235 - LOCATION
      ?auto_100237 - CITY
      ?auto_100234 - OBJ
      ?auto_100236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100235 ?auto_100237 ) ( IN-CITY ?auto_100229 ?auto_100237 ) ( not ( = ?auto_100229 ?auto_100235 ) ) ( OBJ-AT ?auto_100234 ?auto_100229 ) ( not ( = ?auto_100234 ?auto_100232 ) ) ( OBJ-AT ?auto_100232 ?auto_100235 ) ( TRUCK-AT ?auto_100236 ?auto_100229 ) ( OBJ-AT ?auto_100230 ?auto_100229 ) ( OBJ-AT ?auto_100231 ?auto_100229 ) ( OBJ-AT ?auto_100233 ?auto_100229 ) ( not ( = ?auto_100230 ?auto_100231 ) ) ( not ( = ?auto_100230 ?auto_100232 ) ) ( not ( = ?auto_100230 ?auto_100233 ) ) ( not ( = ?auto_100230 ?auto_100234 ) ) ( not ( = ?auto_100231 ?auto_100232 ) ) ( not ( = ?auto_100231 ?auto_100233 ) ) ( not ( = ?auto_100231 ?auto_100234 ) ) ( not ( = ?auto_100232 ?auto_100233 ) ) ( not ( = ?auto_100233 ?auto_100234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100234 ?auto_100232 ?auto_100229 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100280 - OBJ
      ?auto_100281 - OBJ
      ?auto_100282 - OBJ
      ?auto_100283 - OBJ
      ?auto_100279 - LOCATION
    )
    :vars
    (
      ?auto_100285 - LOCATION
      ?auto_100287 - CITY
      ?auto_100284 - OBJ
      ?auto_100286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100285 ?auto_100287 ) ( IN-CITY ?auto_100279 ?auto_100287 ) ( not ( = ?auto_100279 ?auto_100285 ) ) ( OBJ-AT ?auto_100284 ?auto_100279 ) ( not ( = ?auto_100284 ?auto_100281 ) ) ( OBJ-AT ?auto_100281 ?auto_100285 ) ( TRUCK-AT ?auto_100286 ?auto_100279 ) ( OBJ-AT ?auto_100280 ?auto_100279 ) ( OBJ-AT ?auto_100282 ?auto_100279 ) ( OBJ-AT ?auto_100283 ?auto_100279 ) ( not ( = ?auto_100280 ?auto_100281 ) ) ( not ( = ?auto_100280 ?auto_100282 ) ) ( not ( = ?auto_100280 ?auto_100283 ) ) ( not ( = ?auto_100280 ?auto_100284 ) ) ( not ( = ?auto_100281 ?auto_100282 ) ) ( not ( = ?auto_100281 ?auto_100283 ) ) ( not ( = ?auto_100282 ?auto_100283 ) ) ( not ( = ?auto_100282 ?auto_100284 ) ) ( not ( = ?auto_100283 ?auto_100284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100284 ?auto_100281 ?auto_100279 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100324 - OBJ
      ?auto_100325 - OBJ
      ?auto_100326 - OBJ
      ?auto_100327 - OBJ
      ?auto_100323 - LOCATION
    )
    :vars
    (
      ?auto_100328 - LOCATION
      ?auto_100330 - CITY
      ?auto_100329 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100328 ?auto_100330 ) ( IN-CITY ?auto_100323 ?auto_100330 ) ( not ( = ?auto_100323 ?auto_100328 ) ) ( OBJ-AT ?auto_100327 ?auto_100323 ) ( not ( = ?auto_100327 ?auto_100324 ) ) ( OBJ-AT ?auto_100324 ?auto_100328 ) ( TRUCK-AT ?auto_100329 ?auto_100323 ) ( OBJ-AT ?auto_100325 ?auto_100323 ) ( OBJ-AT ?auto_100326 ?auto_100323 ) ( not ( = ?auto_100324 ?auto_100325 ) ) ( not ( = ?auto_100324 ?auto_100326 ) ) ( not ( = ?auto_100325 ?auto_100326 ) ) ( not ( = ?auto_100325 ?auto_100327 ) ) ( not ( = ?auto_100326 ?auto_100327 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100327 ?auto_100324 ?auto_100323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100356 - OBJ
      ?auto_100357 - OBJ
      ?auto_100358 - OBJ
      ?auto_100359 - OBJ
      ?auto_100355 - LOCATION
    )
    :vars
    (
      ?auto_100360 - LOCATION
      ?auto_100362 - CITY
      ?auto_100361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100360 ?auto_100362 ) ( IN-CITY ?auto_100355 ?auto_100362 ) ( not ( = ?auto_100355 ?auto_100360 ) ) ( OBJ-AT ?auto_100357 ?auto_100355 ) ( not ( = ?auto_100357 ?auto_100356 ) ) ( OBJ-AT ?auto_100356 ?auto_100360 ) ( TRUCK-AT ?auto_100361 ?auto_100355 ) ( OBJ-AT ?auto_100358 ?auto_100355 ) ( OBJ-AT ?auto_100359 ?auto_100355 ) ( not ( = ?auto_100356 ?auto_100358 ) ) ( not ( = ?auto_100356 ?auto_100359 ) ) ( not ( = ?auto_100357 ?auto_100358 ) ) ( not ( = ?auto_100357 ?auto_100359 ) ) ( not ( = ?auto_100358 ?auto_100359 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100357 ?auto_100356 ?auto_100355 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100428 - OBJ
      ?auto_100429 - OBJ
      ?auto_100430 - OBJ
      ?auto_100431 - OBJ
      ?auto_100427 - LOCATION
    )
    :vars
    (
      ?auto_100433 - LOCATION
      ?auto_100435 - CITY
      ?auto_100432 - OBJ
      ?auto_100434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100433 ?auto_100435 ) ( IN-CITY ?auto_100427 ?auto_100435 ) ( not ( = ?auto_100427 ?auto_100433 ) ) ( OBJ-AT ?auto_100432 ?auto_100427 ) ( not ( = ?auto_100432 ?auto_100428 ) ) ( OBJ-AT ?auto_100428 ?auto_100433 ) ( TRUCK-AT ?auto_100434 ?auto_100427 ) ( OBJ-AT ?auto_100429 ?auto_100427 ) ( OBJ-AT ?auto_100430 ?auto_100427 ) ( OBJ-AT ?auto_100431 ?auto_100427 ) ( not ( = ?auto_100428 ?auto_100429 ) ) ( not ( = ?auto_100428 ?auto_100430 ) ) ( not ( = ?auto_100428 ?auto_100431 ) ) ( not ( = ?auto_100429 ?auto_100430 ) ) ( not ( = ?auto_100429 ?auto_100431 ) ) ( not ( = ?auto_100429 ?auto_100432 ) ) ( not ( = ?auto_100430 ?auto_100431 ) ) ( not ( = ?auto_100430 ?auto_100432 ) ) ( not ( = ?auto_100431 ?auto_100432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100432 ?auto_100428 ?auto_100427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_100591 - OBJ
      ?auto_100592 - OBJ
      ?auto_100593 - OBJ
      ?auto_100590 - LOCATION
    )
    :vars
    (
      ?auto_100596 - LOCATION
      ?auto_100594 - CITY
      ?auto_100595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100596 ?auto_100594 ) ( IN-CITY ?auto_100590 ?auto_100594 ) ( not ( = ?auto_100590 ?auto_100596 ) ) ( OBJ-AT ?auto_100593 ?auto_100590 ) ( not ( = ?auto_100593 ?auto_100592 ) ) ( OBJ-AT ?auto_100592 ?auto_100596 ) ( TRUCK-AT ?auto_100595 ?auto_100590 ) ( OBJ-AT ?auto_100591 ?auto_100590 ) ( not ( = ?auto_100591 ?auto_100592 ) ) ( not ( = ?auto_100591 ?auto_100593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100593 ?auto_100592 ?auto_100590 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_101252 - OBJ
      ?auto_101251 - LOCATION
    )
    :vars
    (
      ?auto_101256 - LOCATION
      ?auto_101253 - CITY
      ?auto_101255 - OBJ
      ?auto_101254 - TRUCK
      ?auto_101257 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101256 ?auto_101253 ) ( IN-CITY ?auto_101251 ?auto_101253 ) ( not ( = ?auto_101251 ?auto_101256 ) ) ( OBJ-AT ?auto_101255 ?auto_101251 ) ( not ( = ?auto_101255 ?auto_101252 ) ) ( OBJ-AT ?auto_101252 ?auto_101256 ) ( TRUCK-AT ?auto_101254 ?auto_101257 ) ( IN-CITY ?auto_101257 ?auto_101253 ) ( not ( = ?auto_101251 ?auto_101257 ) ) ( not ( = ?auto_101256 ?auto_101257 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_101254 ?auto_101257 ?auto_101251 ?auto_101253 )
      ( DELIVER-2PKG ?auto_101255 ?auto_101252 ?auto_101251 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_101259 - OBJ
      ?auto_101260 - OBJ
      ?auto_101258 - LOCATION
    )
    :vars
    (
      ?auto_101264 - LOCATION
      ?auto_101262 - CITY
      ?auto_101261 - TRUCK
      ?auto_101263 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101264 ?auto_101262 ) ( IN-CITY ?auto_101258 ?auto_101262 ) ( not ( = ?auto_101258 ?auto_101264 ) ) ( OBJ-AT ?auto_101259 ?auto_101258 ) ( not ( = ?auto_101259 ?auto_101260 ) ) ( OBJ-AT ?auto_101260 ?auto_101264 ) ( TRUCK-AT ?auto_101261 ?auto_101263 ) ( IN-CITY ?auto_101263 ?auto_101262 ) ( not ( = ?auto_101258 ?auto_101263 ) ) ( not ( = ?auto_101264 ?auto_101263 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_101260 ?auto_101258 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_101274 - OBJ
      ?auto_101275 - OBJ
      ?auto_101273 - LOCATION
    )
    :vars
    (
      ?auto_101278 - LOCATION
      ?auto_101277 - CITY
      ?auto_101276 - TRUCK
      ?auto_101279 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101278 ?auto_101277 ) ( IN-CITY ?auto_101273 ?auto_101277 ) ( not ( = ?auto_101273 ?auto_101278 ) ) ( OBJ-AT ?auto_101275 ?auto_101273 ) ( not ( = ?auto_101275 ?auto_101274 ) ) ( OBJ-AT ?auto_101274 ?auto_101278 ) ( TRUCK-AT ?auto_101276 ?auto_101279 ) ( IN-CITY ?auto_101279 ?auto_101277 ) ( not ( = ?auto_101273 ?auto_101279 ) ) ( not ( = ?auto_101278 ?auto_101279 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101275 ?auto_101274 ?auto_101273 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101297 - OBJ
      ?auto_101298 - OBJ
      ?auto_101299 - OBJ
      ?auto_101296 - LOCATION
    )
    :vars
    (
      ?auto_101302 - LOCATION
      ?auto_101301 - CITY
      ?auto_101300 - TRUCK
      ?auto_101303 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101302 ?auto_101301 ) ( IN-CITY ?auto_101296 ?auto_101301 ) ( not ( = ?auto_101296 ?auto_101302 ) ) ( OBJ-AT ?auto_101297 ?auto_101296 ) ( not ( = ?auto_101297 ?auto_101299 ) ) ( OBJ-AT ?auto_101299 ?auto_101302 ) ( TRUCK-AT ?auto_101300 ?auto_101303 ) ( IN-CITY ?auto_101303 ?auto_101301 ) ( not ( = ?auto_101296 ?auto_101303 ) ) ( not ( = ?auto_101302 ?auto_101303 ) ) ( OBJ-AT ?auto_101298 ?auto_101296 ) ( not ( = ?auto_101297 ?auto_101298 ) ) ( not ( = ?auto_101298 ?auto_101299 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101297 ?auto_101299 ?auto_101296 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101313 - OBJ
      ?auto_101314 - OBJ
      ?auto_101315 - OBJ
      ?auto_101312 - LOCATION
    )
    :vars
    (
      ?auto_101318 - LOCATION
      ?auto_101317 - CITY
      ?auto_101316 - TRUCK
      ?auto_101319 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101318 ?auto_101317 ) ( IN-CITY ?auto_101312 ?auto_101317 ) ( not ( = ?auto_101312 ?auto_101318 ) ) ( OBJ-AT ?auto_101315 ?auto_101312 ) ( not ( = ?auto_101315 ?auto_101314 ) ) ( OBJ-AT ?auto_101314 ?auto_101318 ) ( TRUCK-AT ?auto_101316 ?auto_101319 ) ( IN-CITY ?auto_101319 ?auto_101317 ) ( not ( = ?auto_101312 ?auto_101319 ) ) ( not ( = ?auto_101318 ?auto_101319 ) ) ( OBJ-AT ?auto_101313 ?auto_101312 ) ( not ( = ?auto_101313 ?auto_101314 ) ) ( not ( = ?auto_101313 ?auto_101315 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101315 ?auto_101314 ?auto_101312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101380 - OBJ
      ?auto_101381 - OBJ
      ?auto_101382 - OBJ
      ?auto_101379 - LOCATION
    )
    :vars
    (
      ?auto_101385 - LOCATION
      ?auto_101384 - CITY
      ?auto_101383 - TRUCK
      ?auto_101386 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101385 ?auto_101384 ) ( IN-CITY ?auto_101379 ?auto_101384 ) ( not ( = ?auto_101379 ?auto_101385 ) ) ( OBJ-AT ?auto_101381 ?auto_101379 ) ( not ( = ?auto_101381 ?auto_101380 ) ) ( OBJ-AT ?auto_101380 ?auto_101385 ) ( TRUCK-AT ?auto_101383 ?auto_101386 ) ( IN-CITY ?auto_101386 ?auto_101384 ) ( not ( = ?auto_101379 ?auto_101386 ) ) ( not ( = ?auto_101385 ?auto_101386 ) ) ( OBJ-AT ?auto_101382 ?auto_101379 ) ( not ( = ?auto_101380 ?auto_101382 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101381 ?auto_101380 ?auto_101379 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101456 - OBJ
      ?auto_101457 - OBJ
      ?auto_101458 - OBJ
      ?auto_101459 - OBJ
      ?auto_101455 - LOCATION
    )
    :vars
    (
      ?auto_101462 - LOCATION
      ?auto_101461 - CITY
      ?auto_101460 - TRUCK
      ?auto_101463 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101462 ?auto_101461 ) ( IN-CITY ?auto_101455 ?auto_101461 ) ( not ( = ?auto_101455 ?auto_101462 ) ) ( OBJ-AT ?auto_101456 ?auto_101455 ) ( not ( = ?auto_101456 ?auto_101459 ) ) ( OBJ-AT ?auto_101459 ?auto_101462 ) ( TRUCK-AT ?auto_101460 ?auto_101463 ) ( IN-CITY ?auto_101463 ?auto_101461 ) ( not ( = ?auto_101455 ?auto_101463 ) ) ( not ( = ?auto_101462 ?auto_101463 ) ) ( OBJ-AT ?auto_101457 ?auto_101455 ) ( OBJ-AT ?auto_101458 ?auto_101455 ) ( not ( = ?auto_101456 ?auto_101457 ) ) ( not ( = ?auto_101456 ?auto_101458 ) ) ( not ( = ?auto_101457 ?auto_101458 ) ) ( not ( = ?auto_101457 ?auto_101459 ) ) ( not ( = ?auto_101458 ?auto_101459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101456 ?auto_101459 ?auto_101455 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101474 - OBJ
      ?auto_101475 - OBJ
      ?auto_101476 - OBJ
      ?auto_101477 - OBJ
      ?auto_101473 - LOCATION
    )
    :vars
    (
      ?auto_101480 - LOCATION
      ?auto_101479 - CITY
      ?auto_101478 - TRUCK
      ?auto_101481 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101480 ?auto_101479 ) ( IN-CITY ?auto_101473 ?auto_101479 ) ( not ( = ?auto_101473 ?auto_101480 ) ) ( OBJ-AT ?auto_101477 ?auto_101473 ) ( not ( = ?auto_101477 ?auto_101476 ) ) ( OBJ-AT ?auto_101476 ?auto_101480 ) ( TRUCK-AT ?auto_101478 ?auto_101481 ) ( IN-CITY ?auto_101481 ?auto_101479 ) ( not ( = ?auto_101473 ?auto_101481 ) ) ( not ( = ?auto_101480 ?auto_101481 ) ) ( OBJ-AT ?auto_101474 ?auto_101473 ) ( OBJ-AT ?auto_101475 ?auto_101473 ) ( not ( = ?auto_101474 ?auto_101475 ) ) ( not ( = ?auto_101474 ?auto_101476 ) ) ( not ( = ?auto_101474 ?auto_101477 ) ) ( not ( = ?auto_101475 ?auto_101476 ) ) ( not ( = ?auto_101475 ?auto_101477 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101477 ?auto_101476 ?auto_101473 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101546 - OBJ
      ?auto_101547 - OBJ
      ?auto_101548 - OBJ
      ?auto_101549 - OBJ
      ?auto_101545 - LOCATION
    )
    :vars
    (
      ?auto_101552 - LOCATION
      ?auto_101551 - CITY
      ?auto_101550 - TRUCK
      ?auto_101553 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101552 ?auto_101551 ) ( IN-CITY ?auto_101545 ?auto_101551 ) ( not ( = ?auto_101545 ?auto_101552 ) ) ( OBJ-AT ?auto_101546 ?auto_101545 ) ( not ( = ?auto_101546 ?auto_101547 ) ) ( OBJ-AT ?auto_101547 ?auto_101552 ) ( TRUCK-AT ?auto_101550 ?auto_101553 ) ( IN-CITY ?auto_101553 ?auto_101551 ) ( not ( = ?auto_101545 ?auto_101553 ) ) ( not ( = ?auto_101552 ?auto_101553 ) ) ( OBJ-AT ?auto_101548 ?auto_101545 ) ( OBJ-AT ?auto_101549 ?auto_101545 ) ( not ( = ?auto_101546 ?auto_101548 ) ) ( not ( = ?auto_101546 ?auto_101549 ) ) ( not ( = ?auto_101547 ?auto_101548 ) ) ( not ( = ?auto_101547 ?auto_101549 ) ) ( not ( = ?auto_101548 ?auto_101549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101546 ?auto_101547 ?auto_101545 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_101805 - OBJ
      ?auto_101806 - OBJ
      ?auto_101807 - OBJ
      ?auto_101808 - OBJ
      ?auto_101804 - LOCATION
    )
    :vars
    (
      ?auto_101811 - LOCATION
      ?auto_101810 - CITY
      ?auto_101809 - TRUCK
      ?auto_101812 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101811 ?auto_101810 ) ( IN-CITY ?auto_101804 ?auto_101810 ) ( not ( = ?auto_101804 ?auto_101811 ) ) ( OBJ-AT ?auto_101807 ?auto_101804 ) ( not ( = ?auto_101807 ?auto_101805 ) ) ( OBJ-AT ?auto_101805 ?auto_101811 ) ( TRUCK-AT ?auto_101809 ?auto_101812 ) ( IN-CITY ?auto_101812 ?auto_101810 ) ( not ( = ?auto_101804 ?auto_101812 ) ) ( not ( = ?auto_101811 ?auto_101812 ) ) ( OBJ-AT ?auto_101806 ?auto_101804 ) ( OBJ-AT ?auto_101808 ?auto_101804 ) ( not ( = ?auto_101805 ?auto_101806 ) ) ( not ( = ?auto_101805 ?auto_101808 ) ) ( not ( = ?auto_101806 ?auto_101807 ) ) ( not ( = ?auto_101806 ?auto_101808 ) ) ( not ( = ?auto_101807 ?auto_101808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101807 ?auto_101805 ?auto_101804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102337 - OBJ
      ?auto_102338 - OBJ
      ?auto_102339 - OBJ
      ?auto_102340 - OBJ
      ?auto_102336 - LOCATION
    )
    :vars
    (
      ?auto_102342 - LOCATION
      ?auto_102341 - CITY
      ?auto_102343 - TRUCK
      ?auto_102344 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_102342 ?auto_102341 ) ( IN-CITY ?auto_102336 ?auto_102341 ) ( not ( = ?auto_102336 ?auto_102342 ) ) ( OBJ-AT ?auto_102340 ?auto_102336 ) ( not ( = ?auto_102340 ?auto_102338 ) ) ( OBJ-AT ?auto_102338 ?auto_102342 ) ( TRUCK-AT ?auto_102343 ?auto_102344 ) ( IN-CITY ?auto_102344 ?auto_102341 ) ( not ( = ?auto_102336 ?auto_102344 ) ) ( not ( = ?auto_102342 ?auto_102344 ) ) ( OBJ-AT ?auto_102337 ?auto_102336 ) ( OBJ-AT ?auto_102339 ?auto_102336 ) ( not ( = ?auto_102337 ?auto_102338 ) ) ( not ( = ?auto_102337 ?auto_102339 ) ) ( not ( = ?auto_102337 ?auto_102340 ) ) ( not ( = ?auto_102338 ?auto_102339 ) ) ( not ( = ?auto_102339 ?auto_102340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102340 ?auto_102338 ?auto_102336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_108839 - OBJ
      ?auto_108840 - OBJ
      ?auto_108841 - OBJ
      ?auto_108838 - LOCATION
    )
    :vars
    (
      ?auto_108843 - TRUCK
      ?auto_108842 - LOCATION
      ?auto_108844 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_108840 ?auto_108843 ) ( TRUCK-AT ?auto_108843 ?auto_108842 ) ( IN-CITY ?auto_108842 ?auto_108844 ) ( IN-CITY ?auto_108838 ?auto_108844 ) ( not ( = ?auto_108838 ?auto_108842 ) ) ( OBJ-AT ?auto_108839 ?auto_108838 ) ( not ( = ?auto_108839 ?auto_108840 ) ) ( OBJ-AT ?auto_108841 ?auto_108838 ) ( not ( = ?auto_108839 ?auto_108841 ) ) ( not ( = ?auto_108840 ?auto_108841 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_108839 ?auto_108840 ?auto_108838 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_112237 - OBJ
      ?auto_112238 - OBJ
      ?auto_112239 - OBJ
      ?auto_112236 - LOCATION
    )
    :vars
    (
      ?auto_112241 - LOCATION
      ?auto_112242 - CITY
      ?auto_112240 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_112241 ?auto_112242 ) ( IN-CITY ?auto_112236 ?auto_112242 ) ( not ( = ?auto_112236 ?auto_112241 ) ) ( OBJ-AT ?auto_112239 ?auto_112236 ) ( not ( = ?auto_112239 ?auto_112237 ) ) ( OBJ-AT ?auto_112237 ?auto_112241 ) ( TRUCK-AT ?auto_112240 ?auto_112236 ) ( OBJ-AT ?auto_112238 ?auto_112236 ) ( not ( = ?auto_112237 ?auto_112238 ) ) ( not ( = ?auto_112238 ?auto_112239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_112239 ?auto_112237 ?auto_112236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115542 - OBJ
      ?auto_115543 - OBJ
      ?auto_115544 - OBJ
      ?auto_115541 - LOCATION
    )
    :vars
    (
      ?auto_115546 - LOCATION
      ?auto_115545 - CITY
      ?auto_115547 - TRUCK
      ?auto_115548 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115546 ?auto_115545 ) ( IN-CITY ?auto_115541 ?auto_115545 ) ( not ( = ?auto_115541 ?auto_115546 ) ) ( OBJ-AT ?auto_115543 ?auto_115541 ) ( not ( = ?auto_115543 ?auto_115544 ) ) ( OBJ-AT ?auto_115544 ?auto_115546 ) ( TRUCK-AT ?auto_115547 ?auto_115548 ) ( IN-CITY ?auto_115548 ?auto_115545 ) ( not ( = ?auto_115541 ?auto_115548 ) ) ( not ( = ?auto_115546 ?auto_115548 ) ) ( OBJ-AT ?auto_115542 ?auto_115541 ) ( not ( = ?auto_115542 ?auto_115543 ) ) ( not ( = ?auto_115542 ?auto_115544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115543 ?auto_115544 ?auto_115541 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115562 - OBJ
      ?auto_115563 - OBJ
      ?auto_115564 - OBJ
      ?auto_115561 - LOCATION
    )
    :vars
    (
      ?auto_115566 - LOCATION
      ?auto_115565 - CITY
      ?auto_115567 - TRUCK
      ?auto_115568 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115566 ?auto_115565 ) ( IN-CITY ?auto_115561 ?auto_115565 ) ( not ( = ?auto_115561 ?auto_115566 ) ) ( OBJ-AT ?auto_115562 ?auto_115561 ) ( not ( = ?auto_115562 ?auto_115563 ) ) ( OBJ-AT ?auto_115563 ?auto_115566 ) ( TRUCK-AT ?auto_115567 ?auto_115568 ) ( IN-CITY ?auto_115568 ?auto_115565 ) ( not ( = ?auto_115561 ?auto_115568 ) ) ( not ( = ?auto_115566 ?auto_115568 ) ) ( OBJ-AT ?auto_115564 ?auto_115561 ) ( not ( = ?auto_115562 ?auto_115564 ) ) ( not ( = ?auto_115563 ?auto_115564 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115562 ?auto_115563 ?auto_115561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115594 - OBJ
      ?auto_115595 - OBJ
      ?auto_115596 - OBJ
      ?auto_115593 - LOCATION
    )
    :vars
    (
      ?auto_115598 - LOCATION
      ?auto_115597 - CITY
      ?auto_115599 - OBJ
      ?auto_115600 - TRUCK
      ?auto_115601 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115598 ?auto_115597 ) ( IN-CITY ?auto_115593 ?auto_115597 ) ( not ( = ?auto_115593 ?auto_115598 ) ) ( OBJ-AT ?auto_115599 ?auto_115593 ) ( not ( = ?auto_115599 ?auto_115596 ) ) ( OBJ-AT ?auto_115596 ?auto_115598 ) ( TRUCK-AT ?auto_115600 ?auto_115601 ) ( IN-CITY ?auto_115601 ?auto_115597 ) ( not ( = ?auto_115593 ?auto_115601 ) ) ( not ( = ?auto_115598 ?auto_115601 ) ) ( OBJ-AT ?auto_115594 ?auto_115593 ) ( OBJ-AT ?auto_115595 ?auto_115593 ) ( not ( = ?auto_115594 ?auto_115595 ) ) ( not ( = ?auto_115594 ?auto_115596 ) ) ( not ( = ?auto_115594 ?auto_115599 ) ) ( not ( = ?auto_115595 ?auto_115596 ) ) ( not ( = ?auto_115595 ?auto_115599 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115599 ?auto_115596 ?auto_115593 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115616 - OBJ
      ?auto_115617 - OBJ
      ?auto_115618 - OBJ
      ?auto_115615 - LOCATION
    )
    :vars
    (
      ?auto_115620 - LOCATION
      ?auto_115619 - CITY
      ?auto_115621 - OBJ
      ?auto_115622 - TRUCK
      ?auto_115623 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115620 ?auto_115619 ) ( IN-CITY ?auto_115615 ?auto_115619 ) ( not ( = ?auto_115615 ?auto_115620 ) ) ( OBJ-AT ?auto_115621 ?auto_115615 ) ( not ( = ?auto_115621 ?auto_115617 ) ) ( OBJ-AT ?auto_115617 ?auto_115620 ) ( TRUCK-AT ?auto_115622 ?auto_115623 ) ( IN-CITY ?auto_115623 ?auto_115619 ) ( not ( = ?auto_115615 ?auto_115623 ) ) ( not ( = ?auto_115620 ?auto_115623 ) ) ( OBJ-AT ?auto_115616 ?auto_115615 ) ( OBJ-AT ?auto_115618 ?auto_115615 ) ( not ( = ?auto_115616 ?auto_115617 ) ) ( not ( = ?auto_115616 ?auto_115618 ) ) ( not ( = ?auto_115616 ?auto_115621 ) ) ( not ( = ?auto_115617 ?auto_115618 ) ) ( not ( = ?auto_115618 ?auto_115621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115621 ?auto_115617 ?auto_115615 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115704 - OBJ
      ?auto_115705 - OBJ
      ?auto_115706 - OBJ
      ?auto_115703 - LOCATION
    )
    :vars
    (
      ?auto_115708 - LOCATION
      ?auto_115707 - CITY
      ?auto_115709 - TRUCK
      ?auto_115710 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115708 ?auto_115707 ) ( IN-CITY ?auto_115703 ?auto_115707 ) ( not ( = ?auto_115703 ?auto_115708 ) ) ( OBJ-AT ?auto_115706 ?auto_115703 ) ( not ( = ?auto_115706 ?auto_115704 ) ) ( OBJ-AT ?auto_115704 ?auto_115708 ) ( TRUCK-AT ?auto_115709 ?auto_115710 ) ( IN-CITY ?auto_115710 ?auto_115707 ) ( not ( = ?auto_115703 ?auto_115710 ) ) ( not ( = ?auto_115708 ?auto_115710 ) ) ( OBJ-AT ?auto_115705 ?auto_115703 ) ( not ( = ?auto_115704 ?auto_115705 ) ) ( not ( = ?auto_115705 ?auto_115706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115706 ?auto_115704 ?auto_115703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_115736 - OBJ
      ?auto_115737 - OBJ
      ?auto_115738 - OBJ
      ?auto_115735 - LOCATION
    )
    :vars
    (
      ?auto_115740 - LOCATION
      ?auto_115739 - CITY
      ?auto_115741 - OBJ
      ?auto_115742 - TRUCK
      ?auto_115743 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115740 ?auto_115739 ) ( IN-CITY ?auto_115735 ?auto_115739 ) ( not ( = ?auto_115735 ?auto_115740 ) ) ( OBJ-AT ?auto_115741 ?auto_115735 ) ( not ( = ?auto_115741 ?auto_115736 ) ) ( OBJ-AT ?auto_115736 ?auto_115740 ) ( TRUCK-AT ?auto_115742 ?auto_115743 ) ( IN-CITY ?auto_115743 ?auto_115739 ) ( not ( = ?auto_115735 ?auto_115743 ) ) ( not ( = ?auto_115740 ?auto_115743 ) ) ( OBJ-AT ?auto_115737 ?auto_115735 ) ( OBJ-AT ?auto_115738 ?auto_115735 ) ( not ( = ?auto_115736 ?auto_115737 ) ) ( not ( = ?auto_115736 ?auto_115738 ) ) ( not ( = ?auto_115737 ?auto_115738 ) ) ( not ( = ?auto_115737 ?auto_115741 ) ) ( not ( = ?auto_115738 ?auto_115741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115741 ?auto_115736 ?auto_115735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115833 - OBJ
      ?auto_115834 - OBJ
      ?auto_115835 - OBJ
      ?auto_115836 - OBJ
      ?auto_115832 - LOCATION
    )
    :vars
    (
      ?auto_115838 - LOCATION
      ?auto_115837 - CITY
      ?auto_115839 - TRUCK
      ?auto_115840 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115838 ?auto_115837 ) ( IN-CITY ?auto_115832 ?auto_115837 ) ( not ( = ?auto_115832 ?auto_115838 ) ) ( OBJ-AT ?auto_115835 ?auto_115832 ) ( not ( = ?auto_115835 ?auto_115836 ) ) ( OBJ-AT ?auto_115836 ?auto_115838 ) ( TRUCK-AT ?auto_115839 ?auto_115840 ) ( IN-CITY ?auto_115840 ?auto_115837 ) ( not ( = ?auto_115832 ?auto_115840 ) ) ( not ( = ?auto_115838 ?auto_115840 ) ) ( OBJ-AT ?auto_115833 ?auto_115832 ) ( OBJ-AT ?auto_115834 ?auto_115832 ) ( not ( = ?auto_115833 ?auto_115834 ) ) ( not ( = ?auto_115833 ?auto_115835 ) ) ( not ( = ?auto_115833 ?auto_115836 ) ) ( not ( = ?auto_115834 ?auto_115835 ) ) ( not ( = ?auto_115834 ?auto_115836 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115835 ?auto_115836 ?auto_115832 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115869 - OBJ
      ?auto_115870 - OBJ
      ?auto_115871 - OBJ
      ?auto_115872 - OBJ
      ?auto_115868 - LOCATION
    )
    :vars
    (
      ?auto_115874 - LOCATION
      ?auto_115873 - CITY
      ?auto_115875 - TRUCK
      ?auto_115876 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115874 ?auto_115873 ) ( IN-CITY ?auto_115868 ?auto_115873 ) ( not ( = ?auto_115868 ?auto_115874 ) ) ( OBJ-AT ?auto_115870 ?auto_115868 ) ( not ( = ?auto_115870 ?auto_115871 ) ) ( OBJ-AT ?auto_115871 ?auto_115874 ) ( TRUCK-AT ?auto_115875 ?auto_115876 ) ( IN-CITY ?auto_115876 ?auto_115873 ) ( not ( = ?auto_115868 ?auto_115876 ) ) ( not ( = ?auto_115874 ?auto_115876 ) ) ( OBJ-AT ?auto_115869 ?auto_115868 ) ( OBJ-AT ?auto_115872 ?auto_115868 ) ( not ( = ?auto_115869 ?auto_115870 ) ) ( not ( = ?auto_115869 ?auto_115871 ) ) ( not ( = ?auto_115869 ?auto_115872 ) ) ( not ( = ?auto_115870 ?auto_115872 ) ) ( not ( = ?auto_115871 ?auto_115872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115870 ?auto_115871 ?auto_115868 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115923 - OBJ
      ?auto_115924 - OBJ
      ?auto_115925 - OBJ
      ?auto_115926 - OBJ
      ?auto_115922 - LOCATION
    )
    :vars
    (
      ?auto_115928 - LOCATION
      ?auto_115927 - CITY
      ?auto_115929 - TRUCK
      ?auto_115930 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115928 ?auto_115927 ) ( IN-CITY ?auto_115922 ?auto_115927 ) ( not ( = ?auto_115922 ?auto_115928 ) ) ( OBJ-AT ?auto_115923 ?auto_115922 ) ( not ( = ?auto_115923 ?auto_115925 ) ) ( OBJ-AT ?auto_115925 ?auto_115928 ) ( TRUCK-AT ?auto_115929 ?auto_115930 ) ( IN-CITY ?auto_115930 ?auto_115927 ) ( not ( = ?auto_115922 ?auto_115930 ) ) ( not ( = ?auto_115928 ?auto_115930 ) ) ( OBJ-AT ?auto_115924 ?auto_115922 ) ( OBJ-AT ?auto_115926 ?auto_115922 ) ( not ( = ?auto_115923 ?auto_115924 ) ) ( not ( = ?auto_115923 ?auto_115926 ) ) ( not ( = ?auto_115924 ?auto_115925 ) ) ( not ( = ?auto_115924 ?auto_115926 ) ) ( not ( = ?auto_115925 ?auto_115926 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115923 ?auto_115925 ?auto_115922 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116031 - OBJ
      ?auto_116032 - OBJ
      ?auto_116033 - OBJ
      ?auto_116034 - OBJ
      ?auto_116030 - LOCATION
    )
    :vars
    (
      ?auto_116036 - LOCATION
      ?auto_116035 - CITY
      ?auto_116037 - TRUCK
      ?auto_116038 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116036 ?auto_116035 ) ( IN-CITY ?auto_116030 ?auto_116035 ) ( not ( = ?auto_116030 ?auto_116036 ) ) ( OBJ-AT ?auto_116033 ?auto_116030 ) ( not ( = ?auto_116033 ?auto_116032 ) ) ( OBJ-AT ?auto_116032 ?auto_116036 ) ( TRUCK-AT ?auto_116037 ?auto_116038 ) ( IN-CITY ?auto_116038 ?auto_116035 ) ( not ( = ?auto_116030 ?auto_116038 ) ) ( not ( = ?auto_116036 ?auto_116038 ) ) ( OBJ-AT ?auto_116031 ?auto_116030 ) ( OBJ-AT ?auto_116034 ?auto_116030 ) ( not ( = ?auto_116031 ?auto_116032 ) ) ( not ( = ?auto_116031 ?auto_116033 ) ) ( not ( = ?auto_116031 ?auto_116034 ) ) ( not ( = ?auto_116032 ?auto_116034 ) ) ( not ( = ?auto_116033 ?auto_116034 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116033 ?auto_116032 ?auto_116030 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116175 - OBJ
      ?auto_116176 - OBJ
      ?auto_116177 - OBJ
      ?auto_116178 - OBJ
      ?auto_116174 - LOCATION
    )
    :vars
    (
      ?auto_116180 - LOCATION
      ?auto_116179 - CITY
      ?auto_116181 - TRUCK
      ?auto_116182 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116180 ?auto_116179 ) ( IN-CITY ?auto_116174 ?auto_116179 ) ( not ( = ?auto_116174 ?auto_116180 ) ) ( OBJ-AT ?auto_116176 ?auto_116174 ) ( not ( = ?auto_116176 ?auto_116178 ) ) ( OBJ-AT ?auto_116178 ?auto_116180 ) ( TRUCK-AT ?auto_116181 ?auto_116182 ) ( IN-CITY ?auto_116182 ?auto_116179 ) ( not ( = ?auto_116174 ?auto_116182 ) ) ( not ( = ?auto_116180 ?auto_116182 ) ) ( OBJ-AT ?auto_116175 ?auto_116174 ) ( OBJ-AT ?auto_116177 ?auto_116174 ) ( not ( = ?auto_116175 ?auto_116176 ) ) ( not ( = ?auto_116175 ?auto_116177 ) ) ( not ( = ?auto_116175 ?auto_116178 ) ) ( not ( = ?auto_116176 ?auto_116177 ) ) ( not ( = ?auto_116177 ?auto_116178 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116176 ?auto_116178 ?auto_116174 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116238 - OBJ
      ?auto_116239 - OBJ
      ?auto_116240 - OBJ
      ?auto_116241 - OBJ
      ?auto_116237 - LOCATION
    )
    :vars
    (
      ?auto_116243 - LOCATION
      ?auto_116242 - CITY
      ?auto_116244 - OBJ
      ?auto_116245 - TRUCK
      ?auto_116246 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116243 ?auto_116242 ) ( IN-CITY ?auto_116237 ?auto_116242 ) ( not ( = ?auto_116237 ?auto_116243 ) ) ( OBJ-AT ?auto_116244 ?auto_116237 ) ( not ( = ?auto_116244 ?auto_116241 ) ) ( OBJ-AT ?auto_116241 ?auto_116243 ) ( TRUCK-AT ?auto_116245 ?auto_116246 ) ( IN-CITY ?auto_116246 ?auto_116242 ) ( not ( = ?auto_116237 ?auto_116246 ) ) ( not ( = ?auto_116243 ?auto_116246 ) ) ( OBJ-AT ?auto_116238 ?auto_116237 ) ( OBJ-AT ?auto_116239 ?auto_116237 ) ( OBJ-AT ?auto_116240 ?auto_116237 ) ( not ( = ?auto_116238 ?auto_116239 ) ) ( not ( = ?auto_116238 ?auto_116240 ) ) ( not ( = ?auto_116238 ?auto_116241 ) ) ( not ( = ?auto_116238 ?auto_116244 ) ) ( not ( = ?auto_116239 ?auto_116240 ) ) ( not ( = ?auto_116239 ?auto_116241 ) ) ( not ( = ?auto_116239 ?auto_116244 ) ) ( not ( = ?auto_116240 ?auto_116241 ) ) ( not ( = ?auto_116240 ?auto_116244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116244 ?auto_116241 ?auto_116237 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116267 - OBJ
      ?auto_116268 - OBJ
      ?auto_116269 - OBJ
      ?auto_116270 - OBJ
      ?auto_116266 - LOCATION
    )
    :vars
    (
      ?auto_116272 - LOCATION
      ?auto_116271 - CITY
      ?auto_116273 - OBJ
      ?auto_116274 - TRUCK
      ?auto_116275 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116272 ?auto_116271 ) ( IN-CITY ?auto_116266 ?auto_116271 ) ( not ( = ?auto_116266 ?auto_116272 ) ) ( OBJ-AT ?auto_116273 ?auto_116266 ) ( not ( = ?auto_116273 ?auto_116269 ) ) ( OBJ-AT ?auto_116269 ?auto_116272 ) ( TRUCK-AT ?auto_116274 ?auto_116275 ) ( IN-CITY ?auto_116275 ?auto_116271 ) ( not ( = ?auto_116266 ?auto_116275 ) ) ( not ( = ?auto_116272 ?auto_116275 ) ) ( OBJ-AT ?auto_116267 ?auto_116266 ) ( OBJ-AT ?auto_116268 ?auto_116266 ) ( OBJ-AT ?auto_116270 ?auto_116266 ) ( not ( = ?auto_116267 ?auto_116268 ) ) ( not ( = ?auto_116267 ?auto_116269 ) ) ( not ( = ?auto_116267 ?auto_116270 ) ) ( not ( = ?auto_116267 ?auto_116273 ) ) ( not ( = ?auto_116268 ?auto_116269 ) ) ( not ( = ?auto_116268 ?auto_116270 ) ) ( not ( = ?auto_116268 ?auto_116273 ) ) ( not ( = ?auto_116269 ?auto_116270 ) ) ( not ( = ?auto_116270 ?auto_116273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116273 ?auto_116269 ?auto_116266 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116410 - OBJ
      ?auto_116411 - OBJ
      ?auto_116412 - OBJ
      ?auto_116413 - OBJ
      ?auto_116409 - LOCATION
    )
    :vars
    (
      ?auto_116415 - LOCATION
      ?auto_116414 - CITY
      ?auto_116416 - OBJ
      ?auto_116417 - TRUCK
      ?auto_116418 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116415 ?auto_116414 ) ( IN-CITY ?auto_116409 ?auto_116414 ) ( not ( = ?auto_116409 ?auto_116415 ) ) ( OBJ-AT ?auto_116416 ?auto_116409 ) ( not ( = ?auto_116416 ?auto_116411 ) ) ( OBJ-AT ?auto_116411 ?auto_116415 ) ( TRUCK-AT ?auto_116417 ?auto_116418 ) ( IN-CITY ?auto_116418 ?auto_116414 ) ( not ( = ?auto_116409 ?auto_116418 ) ) ( not ( = ?auto_116415 ?auto_116418 ) ) ( OBJ-AT ?auto_116410 ?auto_116409 ) ( OBJ-AT ?auto_116412 ?auto_116409 ) ( OBJ-AT ?auto_116413 ?auto_116409 ) ( not ( = ?auto_116410 ?auto_116411 ) ) ( not ( = ?auto_116410 ?auto_116412 ) ) ( not ( = ?auto_116410 ?auto_116413 ) ) ( not ( = ?auto_116410 ?auto_116416 ) ) ( not ( = ?auto_116411 ?auto_116412 ) ) ( not ( = ?auto_116411 ?auto_116413 ) ) ( not ( = ?auto_116412 ?auto_116413 ) ) ( not ( = ?auto_116412 ?auto_116416 ) ) ( not ( = ?auto_116413 ?auto_116416 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116416 ?auto_116411 ?auto_116409 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116906 - OBJ
      ?auto_116907 - OBJ
      ?auto_116908 - OBJ
      ?auto_116909 - OBJ
      ?auto_116905 - LOCATION
    )
    :vars
    (
      ?auto_116911 - LOCATION
      ?auto_116910 - CITY
      ?auto_116912 - TRUCK
      ?auto_116913 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116911 ?auto_116910 ) ( IN-CITY ?auto_116905 ?auto_116910 ) ( not ( = ?auto_116905 ?auto_116911 ) ) ( OBJ-AT ?auto_116909 ?auto_116905 ) ( not ( = ?auto_116909 ?auto_116906 ) ) ( OBJ-AT ?auto_116906 ?auto_116911 ) ( TRUCK-AT ?auto_116912 ?auto_116913 ) ( IN-CITY ?auto_116913 ?auto_116910 ) ( not ( = ?auto_116905 ?auto_116913 ) ) ( not ( = ?auto_116911 ?auto_116913 ) ) ( OBJ-AT ?auto_116907 ?auto_116905 ) ( OBJ-AT ?auto_116908 ?auto_116905 ) ( not ( = ?auto_116906 ?auto_116907 ) ) ( not ( = ?auto_116906 ?auto_116908 ) ) ( not ( = ?auto_116907 ?auto_116908 ) ) ( not ( = ?auto_116907 ?auto_116909 ) ) ( not ( = ?auto_116908 ?auto_116909 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116909 ?auto_116906 ?auto_116905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116915 - OBJ
      ?auto_116916 - OBJ
      ?auto_116917 - OBJ
      ?auto_116918 - OBJ
      ?auto_116914 - LOCATION
    )
    :vars
    (
      ?auto_116920 - LOCATION
      ?auto_116919 - CITY
      ?auto_116921 - TRUCK
      ?auto_116922 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116920 ?auto_116919 ) ( IN-CITY ?auto_116914 ?auto_116919 ) ( not ( = ?auto_116914 ?auto_116920 ) ) ( OBJ-AT ?auto_116916 ?auto_116914 ) ( not ( = ?auto_116916 ?auto_116915 ) ) ( OBJ-AT ?auto_116915 ?auto_116920 ) ( TRUCK-AT ?auto_116921 ?auto_116922 ) ( IN-CITY ?auto_116922 ?auto_116919 ) ( not ( = ?auto_116914 ?auto_116922 ) ) ( not ( = ?auto_116920 ?auto_116922 ) ) ( OBJ-AT ?auto_116917 ?auto_116914 ) ( OBJ-AT ?auto_116918 ?auto_116914 ) ( not ( = ?auto_116915 ?auto_116917 ) ) ( not ( = ?auto_116915 ?auto_116918 ) ) ( not ( = ?auto_116916 ?auto_116917 ) ) ( not ( = ?auto_116916 ?auto_116918 ) ) ( not ( = ?auto_116917 ?auto_116918 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116916 ?auto_116915 ?auto_116914 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_117059 - OBJ
      ?auto_117060 - OBJ
      ?auto_117061 - OBJ
      ?auto_117062 - OBJ
      ?auto_117058 - LOCATION
    )
    :vars
    (
      ?auto_117064 - LOCATION
      ?auto_117063 - CITY
      ?auto_117065 - OBJ
      ?auto_117066 - TRUCK
      ?auto_117067 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_117064 ?auto_117063 ) ( IN-CITY ?auto_117058 ?auto_117063 ) ( not ( = ?auto_117058 ?auto_117064 ) ) ( OBJ-AT ?auto_117065 ?auto_117058 ) ( not ( = ?auto_117065 ?auto_117059 ) ) ( OBJ-AT ?auto_117059 ?auto_117064 ) ( TRUCK-AT ?auto_117066 ?auto_117067 ) ( IN-CITY ?auto_117067 ?auto_117063 ) ( not ( = ?auto_117058 ?auto_117067 ) ) ( not ( = ?auto_117064 ?auto_117067 ) ) ( OBJ-AT ?auto_117060 ?auto_117058 ) ( OBJ-AT ?auto_117061 ?auto_117058 ) ( OBJ-AT ?auto_117062 ?auto_117058 ) ( not ( = ?auto_117059 ?auto_117060 ) ) ( not ( = ?auto_117059 ?auto_117061 ) ) ( not ( = ?auto_117059 ?auto_117062 ) ) ( not ( = ?auto_117060 ?auto_117061 ) ) ( not ( = ?auto_117060 ?auto_117062 ) ) ( not ( = ?auto_117060 ?auto_117065 ) ) ( not ( = ?auto_117061 ?auto_117062 ) ) ( not ( = ?auto_117061 ?auto_117065 ) ) ( not ( = ?auto_117062 ?auto_117065 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_117065 ?auto_117059 ?auto_117058 ) )
  )

)

