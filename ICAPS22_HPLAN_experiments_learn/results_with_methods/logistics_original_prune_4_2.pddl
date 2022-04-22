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
      ?auto_95846 - TRUCK
      ?auto_95848 - LOCATION
      ?auto_95847 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95846 ?auto_95848 ) ( IN-CITY ?auto_95848 ?auto_95847 ) ( IN-CITY ?auto_95844 ?auto_95847 ) ( not ( = ?auto_95844 ?auto_95848 ) ) ( OBJ-AT ?auto_95845 ?auto_95848 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95845 ?auto_95846 ?auto_95848 )
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
      ?auto_95872 - LOCATION
      ?auto_95874 - CITY
      ?auto_95873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95872 ?auto_95874 ) ( IN-CITY ?auto_95870 ?auto_95874 ) ( not ( = ?auto_95870 ?auto_95872 ) ) ( OBJ-AT ?auto_95871 ?auto_95872 ) ( TRUCK-AT ?auto_95873 ?auto_95870 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95873 ?auto_95870 ?auto_95872 ?auto_95874 )
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
      ?auto_96158 - TRUCK
      ?auto_96160 - LOCATION
      ?auto_96159 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96157 ?auto_96158 ) ( TRUCK-AT ?auto_96158 ?auto_96160 ) ( IN-CITY ?auto_96160 ?auto_96159 ) ( IN-CITY ?auto_96155 ?auto_96159 ) ( not ( = ?auto_96155 ?auto_96160 ) ) ( OBJ-AT ?auto_96156 ?auto_96155 ) ( not ( = ?auto_96156 ?auto_96157 ) ) )
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
      ?auto_96165 - TRUCK
      ?auto_96164 - LOCATION
      ?auto_96166 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96162 ?auto_96165 ) ( TRUCK-AT ?auto_96165 ?auto_96164 ) ( IN-CITY ?auto_96164 ?auto_96166 ) ( IN-CITY ?auto_96161 ?auto_96166 ) ( not ( = ?auto_96161 ?auto_96164 ) ) ( OBJ-AT ?auto_96163 ?auto_96161 ) ( not ( = ?auto_96163 ?auto_96162 ) ) )
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
      ?auto_96179 - TRUCK
      ?auto_96178 - LOCATION
      ?auto_96180 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96177 ?auto_96179 ) ( TRUCK-AT ?auto_96179 ?auto_96178 ) ( IN-CITY ?auto_96178 ?auto_96180 ) ( IN-CITY ?auto_96174 ?auto_96180 ) ( not ( = ?auto_96174 ?auto_96178 ) ) ( OBJ-AT ?auto_96176 ?auto_96174 ) ( not ( = ?auto_96176 ?auto_96177 ) ) ( OBJ-AT ?auto_96175 ?auto_96174 ) ( not ( = ?auto_96175 ?auto_96176 ) ) ( not ( = ?auto_96175 ?auto_96177 ) ) )
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
      ?auto_96186 - TRUCK
      ?auto_96185 - LOCATION
      ?auto_96187 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96183 ?auto_96186 ) ( TRUCK-AT ?auto_96186 ?auto_96185 ) ( IN-CITY ?auto_96185 ?auto_96187 ) ( IN-CITY ?auto_96181 ?auto_96187 ) ( not ( = ?auto_96181 ?auto_96185 ) ) ( OBJ-AT ?auto_96184 ?auto_96181 ) ( not ( = ?auto_96184 ?auto_96183 ) ) ( OBJ-AT ?auto_96182 ?auto_96181 ) ( not ( = ?auto_96182 ?auto_96183 ) ) ( not ( = ?auto_96182 ?auto_96184 ) ) )
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
      ?auto_96200 - TRUCK
      ?auto_96199 - LOCATION
      ?auto_96201 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96196 ?auto_96200 ) ( TRUCK-AT ?auto_96200 ?auto_96199 ) ( IN-CITY ?auto_96199 ?auto_96201 ) ( IN-CITY ?auto_96195 ?auto_96201 ) ( not ( = ?auto_96195 ?auto_96199 ) ) ( OBJ-AT ?auto_96197 ?auto_96195 ) ( not ( = ?auto_96197 ?auto_96196 ) ) ( OBJ-AT ?auto_96198 ?auto_96195 ) ( not ( = ?auto_96196 ?auto_96198 ) ) ( not ( = ?auto_96197 ?auto_96198 ) ) )
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
      ?auto_96230 - TRUCK
      ?auto_96229 - LOCATION
      ?auto_96231 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96228 ?auto_96230 ) ( TRUCK-AT ?auto_96230 ?auto_96229 ) ( IN-CITY ?auto_96229 ?auto_96231 ) ( IN-CITY ?auto_96224 ?auto_96231 ) ( not ( = ?auto_96224 ?auto_96229 ) ) ( OBJ-AT ?auto_96226 ?auto_96224 ) ( not ( = ?auto_96226 ?auto_96228 ) ) ( OBJ-AT ?auto_96225 ?auto_96224 ) ( OBJ-AT ?auto_96227 ?auto_96224 ) ( not ( = ?auto_96225 ?auto_96226 ) ) ( not ( = ?auto_96225 ?auto_96227 ) ) ( not ( = ?auto_96225 ?auto_96228 ) ) ( not ( = ?auto_96226 ?auto_96227 ) ) ( not ( = ?auto_96227 ?auto_96228 ) ) )
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
      ?auto_96238 - TRUCK
      ?auto_96237 - LOCATION
      ?auto_96239 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96235 ?auto_96238 ) ( TRUCK-AT ?auto_96238 ?auto_96237 ) ( IN-CITY ?auto_96237 ?auto_96239 ) ( IN-CITY ?auto_96232 ?auto_96239 ) ( not ( = ?auto_96232 ?auto_96237 ) ) ( OBJ-AT ?auto_96233 ?auto_96232 ) ( not ( = ?auto_96233 ?auto_96235 ) ) ( OBJ-AT ?auto_96234 ?auto_96232 ) ( OBJ-AT ?auto_96236 ?auto_96232 ) ( not ( = ?auto_96233 ?auto_96234 ) ) ( not ( = ?auto_96233 ?auto_96236 ) ) ( not ( = ?auto_96234 ?auto_96235 ) ) ( not ( = ?auto_96234 ?auto_96236 ) ) ( not ( = ?auto_96235 ?auto_96236 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96233 ?auto_96235 ?auto_96232 ) )
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
      ?auto_96254 - TRUCK
      ?auto_96253 - LOCATION
      ?auto_96255 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96250 ?auto_96254 ) ( TRUCK-AT ?auto_96254 ?auto_96253 ) ( IN-CITY ?auto_96253 ?auto_96255 ) ( IN-CITY ?auto_96248 ?auto_96255 ) ( not ( = ?auto_96248 ?auto_96253 ) ) ( OBJ-AT ?auto_96251 ?auto_96248 ) ( not ( = ?auto_96251 ?auto_96250 ) ) ( OBJ-AT ?auto_96249 ?auto_96248 ) ( OBJ-AT ?auto_96252 ?auto_96248 ) ( not ( = ?auto_96249 ?auto_96250 ) ) ( not ( = ?auto_96249 ?auto_96251 ) ) ( not ( = ?auto_96249 ?auto_96252 ) ) ( not ( = ?auto_96250 ?auto_96252 ) ) ( not ( = ?auto_96251 ?auto_96252 ) ) )
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
      ?auto_96286 - TRUCK
      ?auto_96285 - LOCATION
      ?auto_96287 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_96281 ?auto_96286 ) ( TRUCK-AT ?auto_96286 ?auto_96285 ) ( IN-CITY ?auto_96285 ?auto_96287 ) ( IN-CITY ?auto_96280 ?auto_96287 ) ( not ( = ?auto_96280 ?auto_96285 ) ) ( OBJ-AT ?auto_96282 ?auto_96280 ) ( not ( = ?auto_96282 ?auto_96281 ) ) ( OBJ-AT ?auto_96283 ?auto_96280 ) ( OBJ-AT ?auto_96284 ?auto_96280 ) ( not ( = ?auto_96281 ?auto_96283 ) ) ( not ( = ?auto_96281 ?auto_96284 ) ) ( not ( = ?auto_96282 ?auto_96283 ) ) ( not ( = ?auto_96282 ?auto_96284 ) ) ( not ( = ?auto_96283 ?auto_96284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96282 ?auto_96281 ?auto_96280 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96346 - OBJ
      ?auto_96345 - LOCATION
    )
    :vars
    (
      ?auto_96349 - TRUCK
      ?auto_96347 - LOCATION
      ?auto_96350 - CITY
      ?auto_96348 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96349 ?auto_96347 ) ( IN-CITY ?auto_96347 ?auto_96350 ) ( IN-CITY ?auto_96345 ?auto_96350 ) ( not ( = ?auto_96345 ?auto_96347 ) ) ( OBJ-AT ?auto_96348 ?auto_96345 ) ( not ( = ?auto_96348 ?auto_96346 ) ) ( OBJ-AT ?auto_96346 ?auto_96347 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96346 ?auto_96349 ?auto_96347 )
      ( DELIVER-2PKG ?auto_96348 ?auto_96346 ?auto_96345 ) )
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
      ?auto_96354 - LOCATION
      ?auto_96355 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_96356 ?auto_96354 ) ( IN-CITY ?auto_96354 ?auto_96355 ) ( IN-CITY ?auto_96351 ?auto_96355 ) ( not ( = ?auto_96351 ?auto_96354 ) ) ( OBJ-AT ?auto_96352 ?auto_96351 ) ( not ( = ?auto_96352 ?auto_96353 ) ) ( OBJ-AT ?auto_96353 ?auto_96354 ) )
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
    ( and ( TRUCK-AT ?auto_96374 ?auto_96376 ) ( IN-CITY ?auto_96376 ?auto_96375 ) ( IN-CITY ?auto_96370 ?auto_96375 ) ( not ( = ?auto_96370 ?auto_96376 ) ) ( OBJ-AT ?auto_96371 ?auto_96370 ) ( not ( = ?auto_96371 ?auto_96373 ) ) ( OBJ-AT ?auto_96373 ?auto_96376 ) ( OBJ-AT ?auto_96372 ?auto_96370 ) ( not ( = ?auto_96371 ?auto_96372 ) ) ( not ( = ?auto_96372 ?auto_96373 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96371 ?auto_96373 ?auto_96370 ) )
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
    ( and ( TRUCK-AT ?auto_96425 ?auto_96427 ) ( IN-CITY ?auto_96427 ?auto_96426 ) ( IN-CITY ?auto_96420 ?auto_96426 ) ( not ( = ?auto_96420 ?auto_96427 ) ) ( OBJ-AT ?auto_96421 ?auto_96420 ) ( not ( = ?auto_96421 ?auto_96424 ) ) ( OBJ-AT ?auto_96424 ?auto_96427 ) ( OBJ-AT ?auto_96422 ?auto_96420 ) ( OBJ-AT ?auto_96423 ?auto_96420 ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96424 ) ) ( not ( = ?auto_96423 ?auto_96424 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96421 ?auto_96424 ?auto_96420 ) )
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
    ( and ( TRUCK-AT ?auto_96433 ?auto_96435 ) ( IN-CITY ?auto_96435 ?auto_96434 ) ( IN-CITY ?auto_96428 ?auto_96434 ) ( not ( = ?auto_96428 ?auto_96435 ) ) ( OBJ-AT ?auto_96432 ?auto_96428 ) ( not ( = ?auto_96432 ?auto_96431 ) ) ( OBJ-AT ?auto_96431 ?auto_96435 ) ( OBJ-AT ?auto_96429 ?auto_96428 ) ( OBJ-AT ?auto_96430 ?auto_96428 ) ( not ( = ?auto_96429 ?auto_96430 ) ) ( not ( = ?auto_96429 ?auto_96431 ) ) ( not ( = ?auto_96429 ?auto_96432 ) ) ( not ( = ?auto_96430 ?auto_96431 ) ) ( not ( = ?auto_96430 ?auto_96432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96432 ?auto_96431 ?auto_96428 ) )
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
    ( and ( TRUCK-AT ?auto_96449 ?auto_96451 ) ( IN-CITY ?auto_96451 ?auto_96450 ) ( IN-CITY ?auto_96444 ?auto_96450 ) ( not ( = ?auto_96444 ?auto_96451 ) ) ( OBJ-AT ?auto_96445 ?auto_96444 ) ( not ( = ?auto_96445 ?auto_96446 ) ) ( OBJ-AT ?auto_96446 ?auto_96451 ) ( OBJ-AT ?auto_96447 ?auto_96444 ) ( OBJ-AT ?auto_96448 ?auto_96444 ) ( not ( = ?auto_96445 ?auto_96447 ) ) ( not ( = ?auto_96445 ?auto_96448 ) ) ( not ( = ?auto_96446 ?auto_96447 ) ) ( not ( = ?auto_96446 ?auto_96448 ) ) ( not ( = ?auto_96447 ?auto_96448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96445 ?auto_96446 ?auto_96444 ) )
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
    ( and ( TRUCK-AT ?auto_96481 ?auto_96483 ) ( IN-CITY ?auto_96483 ?auto_96482 ) ( IN-CITY ?auto_96476 ?auto_96482 ) ( not ( = ?auto_96476 ?auto_96483 ) ) ( OBJ-AT ?auto_96479 ?auto_96476 ) ( not ( = ?auto_96479 ?auto_96477 ) ) ( OBJ-AT ?auto_96477 ?auto_96483 ) ( OBJ-AT ?auto_96478 ?auto_96476 ) ( OBJ-AT ?auto_96480 ?auto_96476 ) ( not ( = ?auto_96477 ?auto_96478 ) ) ( not ( = ?auto_96477 ?auto_96480 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96480 ) ) ( not ( = ?auto_96479 ?auto_96480 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96479 ?auto_96477 ?auto_96476 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96542 - OBJ
      ?auto_96541 - LOCATION
    )
    :vars
    (
      ?auto_96546 - LOCATION
      ?auto_96544 - CITY
      ?auto_96545 - OBJ
      ?auto_96543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96546 ?auto_96544 ) ( IN-CITY ?auto_96541 ?auto_96544 ) ( not ( = ?auto_96541 ?auto_96546 ) ) ( OBJ-AT ?auto_96545 ?auto_96541 ) ( not ( = ?auto_96545 ?auto_96542 ) ) ( OBJ-AT ?auto_96542 ?auto_96546 ) ( TRUCK-AT ?auto_96543 ?auto_96541 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96543 ?auto_96541 ?auto_96546 ?auto_96544 )
      ( DELIVER-2PKG ?auto_96545 ?auto_96542 ?auto_96541 ) )
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
      ?auto_96551 - LOCATION
      ?auto_96552 - CITY
      ?auto_96550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96551 ?auto_96552 ) ( IN-CITY ?auto_96547 ?auto_96552 ) ( not ( = ?auto_96547 ?auto_96551 ) ) ( OBJ-AT ?auto_96548 ?auto_96547 ) ( not ( = ?auto_96548 ?auto_96549 ) ) ( OBJ-AT ?auto_96549 ?auto_96551 ) ( TRUCK-AT ?auto_96550 ?auto_96547 ) )
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
      ?auto_96557 - LOCATION
      ?auto_96558 - CITY
      ?auto_96556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96557 ?auto_96558 ) ( IN-CITY ?auto_96553 ?auto_96558 ) ( not ( = ?auto_96553 ?auto_96557 ) ) ( OBJ-AT ?auto_96555 ?auto_96553 ) ( not ( = ?auto_96555 ?auto_96554 ) ) ( OBJ-AT ?auto_96554 ?auto_96557 ) ( TRUCK-AT ?auto_96556 ?auto_96553 ) )
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
      ?auto_96571 - LOCATION
      ?auto_96572 - CITY
      ?auto_96570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96571 ?auto_96572 ) ( IN-CITY ?auto_96566 ?auto_96572 ) ( not ( = ?auto_96566 ?auto_96571 ) ) ( OBJ-AT ?auto_96567 ?auto_96566 ) ( not ( = ?auto_96567 ?auto_96569 ) ) ( OBJ-AT ?auto_96569 ?auto_96571 ) ( TRUCK-AT ?auto_96570 ?auto_96566 ) ( OBJ-AT ?auto_96568 ?auto_96566 ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( not ( = ?auto_96568 ?auto_96569 ) ) )
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
      ?auto_96578 - LOCATION
      ?auto_96579 - CITY
      ?auto_96577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96578 ?auto_96579 ) ( IN-CITY ?auto_96573 ?auto_96579 ) ( not ( = ?auto_96573 ?auto_96578 ) ) ( OBJ-AT ?auto_96576 ?auto_96573 ) ( not ( = ?auto_96576 ?auto_96575 ) ) ( OBJ-AT ?auto_96575 ?auto_96578 ) ( TRUCK-AT ?auto_96577 ?auto_96573 ) ( OBJ-AT ?auto_96574 ?auto_96573 ) ( not ( = ?auto_96574 ?auto_96575 ) ) ( not ( = ?auto_96574 ?auto_96576 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96576 ?auto_96575 ?auto_96573 ) )
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
      ?auto_96592 - LOCATION
      ?auto_96593 - CITY
      ?auto_96591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96592 ?auto_96593 ) ( IN-CITY ?auto_96587 ?auto_96593 ) ( not ( = ?auto_96587 ?auto_96592 ) ) ( OBJ-AT ?auto_96590 ?auto_96587 ) ( not ( = ?auto_96590 ?auto_96588 ) ) ( OBJ-AT ?auto_96588 ?auto_96592 ) ( TRUCK-AT ?auto_96591 ?auto_96587 ) ( OBJ-AT ?auto_96589 ?auto_96587 ) ( not ( = ?auto_96588 ?auto_96589 ) ) ( not ( = ?auto_96589 ?auto_96590 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96590 ?auto_96588 ?auto_96587 ) )
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
      ?auto_96622 - LOCATION
      ?auto_96623 - CITY
      ?auto_96621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96622 ?auto_96623 ) ( IN-CITY ?auto_96616 ?auto_96623 ) ( not ( = ?auto_96616 ?auto_96622 ) ) ( OBJ-AT ?auto_96618 ?auto_96616 ) ( not ( = ?auto_96618 ?auto_96620 ) ) ( OBJ-AT ?auto_96620 ?auto_96622 ) ( TRUCK-AT ?auto_96621 ?auto_96616 ) ( OBJ-AT ?auto_96617 ?auto_96616 ) ( OBJ-AT ?auto_96619 ?auto_96616 ) ( not ( = ?auto_96617 ?auto_96618 ) ) ( not ( = ?auto_96617 ?auto_96619 ) ) ( not ( = ?auto_96617 ?auto_96620 ) ) ( not ( = ?auto_96618 ?auto_96619 ) ) ( not ( = ?auto_96619 ?auto_96620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96618 ?auto_96620 ?auto_96616 ) )
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
      ?auto_96630 - LOCATION
      ?auto_96631 - CITY
      ?auto_96629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96630 ?auto_96631 ) ( IN-CITY ?auto_96624 ?auto_96631 ) ( not ( = ?auto_96624 ?auto_96630 ) ) ( OBJ-AT ?auto_96625 ?auto_96624 ) ( not ( = ?auto_96625 ?auto_96627 ) ) ( OBJ-AT ?auto_96627 ?auto_96630 ) ( TRUCK-AT ?auto_96629 ?auto_96624 ) ( OBJ-AT ?auto_96626 ?auto_96624 ) ( OBJ-AT ?auto_96628 ?auto_96624 ) ( not ( = ?auto_96625 ?auto_96626 ) ) ( not ( = ?auto_96625 ?auto_96628 ) ) ( not ( = ?auto_96626 ?auto_96627 ) ) ( not ( = ?auto_96626 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) )
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
      ?auto_96646 - LOCATION
      ?auto_96647 - CITY
      ?auto_96645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96646 ?auto_96647 ) ( IN-CITY ?auto_96640 ?auto_96647 ) ( not ( = ?auto_96640 ?auto_96646 ) ) ( OBJ-AT ?auto_96643 ?auto_96640 ) ( not ( = ?auto_96643 ?auto_96642 ) ) ( OBJ-AT ?auto_96642 ?auto_96646 ) ( TRUCK-AT ?auto_96645 ?auto_96640 ) ( OBJ-AT ?auto_96641 ?auto_96640 ) ( OBJ-AT ?auto_96644 ?auto_96640 ) ( not ( = ?auto_96641 ?auto_96642 ) ) ( not ( = ?auto_96641 ?auto_96643 ) ) ( not ( = ?auto_96641 ?auto_96644 ) ) ( not ( = ?auto_96642 ?auto_96644 ) ) ( not ( = ?auto_96643 ?auto_96644 ) ) )
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
      ?auto_96678 - LOCATION
      ?auto_96679 - CITY
      ?auto_96677 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96678 ?auto_96679 ) ( IN-CITY ?auto_96672 ?auto_96679 ) ( not ( = ?auto_96672 ?auto_96678 ) ) ( OBJ-AT ?auto_96676 ?auto_96672 ) ( not ( = ?auto_96676 ?auto_96673 ) ) ( OBJ-AT ?auto_96673 ?auto_96678 ) ( TRUCK-AT ?auto_96677 ?auto_96672 ) ( OBJ-AT ?auto_96674 ?auto_96672 ) ( OBJ-AT ?auto_96675 ?auto_96672 ) ( not ( = ?auto_96673 ?auto_96674 ) ) ( not ( = ?auto_96673 ?auto_96675 ) ) ( not ( = ?auto_96674 ?auto_96675 ) ) ( not ( = ?auto_96674 ?auto_96676 ) ) ( not ( = ?auto_96675 ?auto_96676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96676 ?auto_96673 ?auto_96672 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96738 - OBJ
      ?auto_96737 - LOCATION
    )
    :vars
    (
      ?auto_96741 - LOCATION
      ?auto_96742 - CITY
      ?auto_96739 - OBJ
      ?auto_96740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96741 ?auto_96742 ) ( IN-CITY ?auto_96737 ?auto_96742 ) ( not ( = ?auto_96737 ?auto_96741 ) ) ( not ( = ?auto_96739 ?auto_96738 ) ) ( OBJ-AT ?auto_96738 ?auto_96741 ) ( TRUCK-AT ?auto_96740 ?auto_96737 ) ( IN-TRUCK ?auto_96739 ?auto_96740 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96739 ?auto_96737 )
      ( DELIVER-2PKG ?auto_96739 ?auto_96738 ?auto_96737 ) )
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
      ?auto_96748 - CITY
      ?auto_96747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96746 ?auto_96748 ) ( IN-CITY ?auto_96743 ?auto_96748 ) ( not ( = ?auto_96743 ?auto_96746 ) ) ( not ( = ?auto_96744 ?auto_96745 ) ) ( OBJ-AT ?auto_96745 ?auto_96746 ) ( TRUCK-AT ?auto_96747 ?auto_96743 ) ( IN-TRUCK ?auto_96744 ?auto_96747 ) )
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
      ?auto_96754 - LOCATION
      ?auto_96753 - CITY
      ?auto_96752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96754 ?auto_96753 ) ( IN-CITY ?auto_96749 ?auto_96753 ) ( not ( = ?auto_96749 ?auto_96754 ) ) ( not ( = ?auto_96751 ?auto_96750 ) ) ( OBJ-AT ?auto_96750 ?auto_96754 ) ( TRUCK-AT ?auto_96752 ?auto_96749 ) ( IN-TRUCK ?auto_96751 ?auto_96752 ) )
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
      ?auto_96938 - LOCATION
      ?auto_96937 - CITY
      ?auto_96936 - OBJ
      ?auto_96935 - TRUCK
      ?auto_96939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96938 ?auto_96937 ) ( IN-CITY ?auto_96933 ?auto_96937 ) ( not ( = ?auto_96933 ?auto_96938 ) ) ( not ( = ?auto_96936 ?auto_96934 ) ) ( OBJ-AT ?auto_96934 ?auto_96938 ) ( IN-TRUCK ?auto_96936 ?auto_96935 ) ( TRUCK-AT ?auto_96935 ?auto_96939 ) ( IN-CITY ?auto_96939 ?auto_96937 ) ( not ( = ?auto_96933 ?auto_96939 ) ) ( not ( = ?auto_96938 ?auto_96939 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96935 ?auto_96939 ?auto_96933 ?auto_96937 )
      ( DELIVER-2PKG ?auto_96936 ?auto_96934 ?auto_96933 ) )
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
      ?auto_96945 - LOCATION
      ?auto_96944 - CITY
      ?auto_96946 - TRUCK
      ?auto_96943 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96945 ?auto_96944 ) ( IN-CITY ?auto_96940 ?auto_96944 ) ( not ( = ?auto_96940 ?auto_96945 ) ) ( not ( = ?auto_96941 ?auto_96942 ) ) ( OBJ-AT ?auto_96942 ?auto_96945 ) ( IN-TRUCK ?auto_96941 ?auto_96946 ) ( TRUCK-AT ?auto_96946 ?auto_96943 ) ( IN-CITY ?auto_96943 ?auto_96944 ) ( not ( = ?auto_96940 ?auto_96943 ) ) ( not ( = ?auto_96945 ?auto_96943 ) ) )
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
      ?auto_97159 - LOCATION
      ?auto_97158 - CITY
      ?auto_97161 - OBJ
      ?auto_97157 - TRUCK
      ?auto_97160 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_97159 ?auto_97158 ) ( IN-CITY ?auto_97155 ?auto_97158 ) ( not ( = ?auto_97155 ?auto_97159 ) ) ( not ( = ?auto_97161 ?auto_97156 ) ) ( OBJ-AT ?auto_97156 ?auto_97159 ) ( TRUCK-AT ?auto_97157 ?auto_97160 ) ( IN-CITY ?auto_97160 ?auto_97158 ) ( not ( = ?auto_97155 ?auto_97160 ) ) ( not ( = ?auto_97159 ?auto_97160 ) ) ( OBJ-AT ?auto_97161 ?auto_97160 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_97161 ?auto_97157 ?auto_97160 )
      ( DELIVER-2PKG ?auto_97161 ?auto_97156 ?auto_97155 ) )
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
      ?auto_97166 - TRUCK
      ?auto_97165 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_97168 ?auto_97167 ) ( IN-CITY ?auto_97162 ?auto_97167 ) ( not ( = ?auto_97162 ?auto_97168 ) ) ( not ( = ?auto_97163 ?auto_97164 ) ) ( OBJ-AT ?auto_97164 ?auto_97168 ) ( TRUCK-AT ?auto_97166 ?auto_97165 ) ( IN-CITY ?auto_97165 ?auto_97167 ) ( not ( = ?auto_97162 ?auto_97165 ) ) ( not ( = ?auto_97168 ?auto_97165 ) ) ( OBJ-AT ?auto_97163 ?auto_97165 ) )
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
      ?auto_97173 - TRUCK
      ?auto_97172 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_97175 ?auto_97174 ) ( IN-CITY ?auto_97169 ?auto_97174 ) ( not ( = ?auto_97169 ?auto_97175 ) ) ( not ( = ?auto_97171 ?auto_97170 ) ) ( OBJ-AT ?auto_97170 ?auto_97175 ) ( TRUCK-AT ?auto_97173 ?auto_97172 ) ( IN-CITY ?auto_97172 ?auto_97174 ) ( not ( = ?auto_97169 ?auto_97172 ) ) ( not ( = ?auto_97175 ?auto_97172 ) ) ( OBJ-AT ?auto_97171 ?auto_97172 ) )
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
      ?auto_98518 - TRUCK
      ?auto_98519 - LOCATION
      ?auto_98520 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98517 ?auto_98518 ) ( TRUCK-AT ?auto_98518 ?auto_98519 ) ( IN-CITY ?auto_98519 ?auto_98520 ) ( IN-CITY ?auto_98514 ?auto_98520 ) ( not ( = ?auto_98514 ?auto_98519 ) ) ( OBJ-AT ?auto_98515 ?auto_98514 ) ( not ( = ?auto_98515 ?auto_98517 ) ) ( OBJ-AT ?auto_98516 ?auto_98514 ) ( not ( = ?auto_98515 ?auto_98516 ) ) ( not ( = ?auto_98516 ?auto_98517 ) ) )
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
      ?auto_98553 - LOCATION
      ?auto_98554 - CITY
      ?auto_98551 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98550 ?auto_98552 ) ( TRUCK-AT ?auto_98552 ?auto_98553 ) ( IN-CITY ?auto_98553 ?auto_98554 ) ( IN-CITY ?auto_98547 ?auto_98554 ) ( not ( = ?auto_98547 ?auto_98553 ) ) ( OBJ-AT ?auto_98551 ?auto_98547 ) ( not ( = ?auto_98551 ?auto_98550 ) ) ( OBJ-AT ?auto_98548 ?auto_98547 ) ( OBJ-AT ?auto_98549 ?auto_98547 ) ( not ( = ?auto_98548 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98550 ) ) ( not ( = ?auto_98548 ?auto_98551 ) ) ( not ( = ?auto_98549 ?auto_98550 ) ) ( not ( = ?auto_98549 ?auto_98551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98551 ?auto_98550 ?auto_98547 ) )
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
      ?auto_98565 - LOCATION
      ?auto_98566 - CITY
      ?auto_98563 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98561 ?auto_98564 ) ( TRUCK-AT ?auto_98564 ?auto_98565 ) ( IN-CITY ?auto_98565 ?auto_98566 ) ( IN-CITY ?auto_98559 ?auto_98566 ) ( not ( = ?auto_98559 ?auto_98565 ) ) ( OBJ-AT ?auto_98563 ?auto_98559 ) ( not ( = ?auto_98563 ?auto_98561 ) ) ( OBJ-AT ?auto_98560 ?auto_98559 ) ( OBJ-AT ?auto_98562 ?auto_98559 ) ( not ( = ?auto_98560 ?auto_98561 ) ) ( not ( = ?auto_98560 ?auto_98562 ) ) ( not ( = ?auto_98560 ?auto_98563 ) ) ( not ( = ?auto_98561 ?auto_98562 ) ) ( not ( = ?auto_98562 ?auto_98563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98563 ?auto_98561 ?auto_98559 ) )
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
      ?auto_98579 - TRUCK
      ?auto_98580 - LOCATION
      ?auto_98581 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98576 ?auto_98579 ) ( TRUCK-AT ?auto_98579 ?auto_98580 ) ( IN-CITY ?auto_98580 ?auto_98581 ) ( IN-CITY ?auto_98575 ?auto_98581 ) ( not ( = ?auto_98575 ?auto_98580 ) ) ( OBJ-AT ?auto_98578 ?auto_98575 ) ( not ( = ?auto_98578 ?auto_98576 ) ) ( OBJ-AT ?auto_98577 ?auto_98575 ) ( not ( = ?auto_98576 ?auto_98577 ) ) ( not ( = ?auto_98577 ?auto_98578 ) ) )
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
      ?auto_98603 - LOCATION
      ?auto_98604 - CITY
      ?auto_98601 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98598 ?auto_98602 ) ( TRUCK-AT ?auto_98602 ?auto_98603 ) ( IN-CITY ?auto_98603 ?auto_98604 ) ( IN-CITY ?auto_98597 ?auto_98604 ) ( not ( = ?auto_98597 ?auto_98603 ) ) ( OBJ-AT ?auto_98601 ?auto_98597 ) ( not ( = ?auto_98601 ?auto_98598 ) ) ( OBJ-AT ?auto_98599 ?auto_98597 ) ( OBJ-AT ?auto_98600 ?auto_98597 ) ( not ( = ?auto_98598 ?auto_98599 ) ) ( not ( = ?auto_98598 ?auto_98600 ) ) ( not ( = ?auto_98599 ?auto_98600 ) ) ( not ( = ?auto_98599 ?auto_98601 ) ) ( not ( = ?auto_98600 ?auto_98601 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98601 ?auto_98598 ?auto_98597 ) )
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
      ?auto_98641 - TRUCK
      ?auto_98642 - LOCATION
      ?auto_98643 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98640 ?auto_98641 ) ( TRUCK-AT ?auto_98641 ?auto_98642 ) ( IN-CITY ?auto_98642 ?auto_98643 ) ( IN-CITY ?auto_98636 ?auto_98643 ) ( not ( = ?auto_98636 ?auto_98642 ) ) ( OBJ-AT ?auto_98639 ?auto_98636 ) ( not ( = ?auto_98639 ?auto_98640 ) ) ( OBJ-AT ?auto_98637 ?auto_98636 ) ( OBJ-AT ?auto_98638 ?auto_98636 ) ( not ( = ?auto_98637 ?auto_98638 ) ) ( not ( = ?auto_98637 ?auto_98639 ) ) ( not ( = ?auto_98637 ?auto_98640 ) ) ( not ( = ?auto_98638 ?auto_98639 ) ) ( not ( = ?auto_98638 ?auto_98640 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98639 ?auto_98640 ?auto_98636 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98645 - OBJ
      ?auto_98646 - OBJ
      ?auto_98647 - OBJ
      ?auto_98648 - OBJ
      ?auto_98644 - LOCATION
    )
    :vars
    (
      ?auto_98649 - TRUCK
      ?auto_98650 - LOCATION
      ?auto_98651 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98648 ?auto_98649 ) ( TRUCK-AT ?auto_98649 ?auto_98650 ) ( IN-CITY ?auto_98650 ?auto_98651 ) ( IN-CITY ?auto_98644 ?auto_98651 ) ( not ( = ?auto_98644 ?auto_98650 ) ) ( OBJ-AT ?auto_98645 ?auto_98644 ) ( not ( = ?auto_98645 ?auto_98648 ) ) ( OBJ-AT ?auto_98646 ?auto_98644 ) ( OBJ-AT ?auto_98647 ?auto_98644 ) ( not ( = ?auto_98645 ?auto_98646 ) ) ( not ( = ?auto_98645 ?auto_98647 ) ) ( not ( = ?auto_98646 ?auto_98647 ) ) ( not ( = ?auto_98646 ?auto_98648 ) ) ( not ( = ?auto_98647 ?auto_98648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98645 ?auto_98648 ?auto_98644 ) )
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
      ?auto_98657 - TRUCK
      ?auto_98658 - LOCATION
      ?auto_98659 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98655 ?auto_98657 ) ( TRUCK-AT ?auto_98657 ?auto_98658 ) ( IN-CITY ?auto_98658 ?auto_98659 ) ( IN-CITY ?auto_98652 ?auto_98659 ) ( not ( = ?auto_98652 ?auto_98658 ) ) ( OBJ-AT ?auto_98656 ?auto_98652 ) ( not ( = ?auto_98656 ?auto_98655 ) ) ( OBJ-AT ?auto_98653 ?auto_98652 ) ( OBJ-AT ?auto_98654 ?auto_98652 ) ( not ( = ?auto_98653 ?auto_98654 ) ) ( not ( = ?auto_98653 ?auto_98655 ) ) ( not ( = ?auto_98653 ?auto_98656 ) ) ( not ( = ?auto_98654 ?auto_98655 ) ) ( not ( = ?auto_98654 ?auto_98656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98656 ?auto_98655 ?auto_98652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98717 - OBJ
      ?auto_98718 - OBJ
      ?auto_98719 - OBJ
      ?auto_98720 - OBJ
      ?auto_98716 - LOCATION
    )
    :vars
    (
      ?auto_98721 - TRUCK
      ?auto_98722 - LOCATION
      ?auto_98723 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98718 ?auto_98721 ) ( TRUCK-AT ?auto_98721 ?auto_98722 ) ( IN-CITY ?auto_98722 ?auto_98723 ) ( IN-CITY ?auto_98716 ?auto_98723 ) ( not ( = ?auto_98716 ?auto_98722 ) ) ( OBJ-AT ?auto_98717 ?auto_98716 ) ( not ( = ?auto_98717 ?auto_98718 ) ) ( OBJ-AT ?auto_98719 ?auto_98716 ) ( OBJ-AT ?auto_98720 ?auto_98716 ) ( not ( = ?auto_98717 ?auto_98719 ) ) ( not ( = ?auto_98717 ?auto_98720 ) ) ( not ( = ?auto_98718 ?auto_98719 ) ) ( not ( = ?auto_98718 ?auto_98720 ) ) ( not ( = ?auto_98719 ?auto_98720 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98717 ?auto_98718 ?auto_98716 ) )
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
      ?auto_98745 - TRUCK
      ?auto_98746 - LOCATION
      ?auto_98747 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98742 ?auto_98745 ) ( TRUCK-AT ?auto_98745 ?auto_98746 ) ( IN-CITY ?auto_98746 ?auto_98747 ) ( IN-CITY ?auto_98740 ?auto_98747 ) ( not ( = ?auto_98740 ?auto_98746 ) ) ( OBJ-AT ?auto_98744 ?auto_98740 ) ( not ( = ?auto_98744 ?auto_98742 ) ) ( OBJ-AT ?auto_98741 ?auto_98740 ) ( OBJ-AT ?auto_98743 ?auto_98740 ) ( not ( = ?auto_98741 ?auto_98742 ) ) ( not ( = ?auto_98741 ?auto_98743 ) ) ( not ( = ?auto_98741 ?auto_98744 ) ) ( not ( = ?auto_98742 ?auto_98743 ) ) ( not ( = ?auto_98743 ?auto_98744 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98744 ?auto_98742 ?auto_98740 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98805 - OBJ
      ?auto_98806 - OBJ
      ?auto_98807 - OBJ
      ?auto_98808 - OBJ
      ?auto_98804 - LOCATION
    )
    :vars
    (
      ?auto_98809 - TRUCK
      ?auto_98810 - LOCATION
      ?auto_98811 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98807 ?auto_98809 ) ( TRUCK-AT ?auto_98809 ?auto_98810 ) ( IN-CITY ?auto_98810 ?auto_98811 ) ( IN-CITY ?auto_98804 ?auto_98811 ) ( not ( = ?auto_98804 ?auto_98810 ) ) ( OBJ-AT ?auto_98806 ?auto_98804 ) ( not ( = ?auto_98806 ?auto_98807 ) ) ( OBJ-AT ?auto_98805 ?auto_98804 ) ( OBJ-AT ?auto_98808 ?auto_98804 ) ( not ( = ?auto_98805 ?auto_98806 ) ) ( not ( = ?auto_98805 ?auto_98807 ) ) ( not ( = ?auto_98805 ?auto_98808 ) ) ( not ( = ?auto_98806 ?auto_98808 ) ) ( not ( = ?auto_98807 ?auto_98808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98806 ?auto_98807 ?auto_98804 ) )
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
      ?auto_98843 - LOCATION
      ?auto_98844 - CITY
      ?auto_98841 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98840 ?auto_98842 ) ( TRUCK-AT ?auto_98842 ?auto_98843 ) ( IN-CITY ?auto_98843 ?auto_98844 ) ( IN-CITY ?auto_98836 ?auto_98844 ) ( not ( = ?auto_98836 ?auto_98843 ) ) ( OBJ-AT ?auto_98841 ?auto_98836 ) ( not ( = ?auto_98841 ?auto_98840 ) ) ( OBJ-AT ?auto_98837 ?auto_98836 ) ( OBJ-AT ?auto_98838 ?auto_98836 ) ( OBJ-AT ?auto_98839 ?auto_98836 ) ( not ( = ?auto_98837 ?auto_98838 ) ) ( not ( = ?auto_98837 ?auto_98839 ) ) ( not ( = ?auto_98837 ?auto_98840 ) ) ( not ( = ?auto_98837 ?auto_98841 ) ) ( not ( = ?auto_98838 ?auto_98839 ) ) ( not ( = ?auto_98838 ?auto_98840 ) ) ( not ( = ?auto_98838 ?auto_98841 ) ) ( not ( = ?auto_98839 ?auto_98840 ) ) ( not ( = ?auto_98839 ?auto_98841 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98841 ?auto_98840 ?auto_98836 ) )
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
      ?auto_98860 - LOCATION
      ?auto_98861 - CITY
      ?auto_98858 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98856 ?auto_98859 ) ( TRUCK-AT ?auto_98859 ?auto_98860 ) ( IN-CITY ?auto_98860 ?auto_98861 ) ( IN-CITY ?auto_98853 ?auto_98861 ) ( not ( = ?auto_98853 ?auto_98860 ) ) ( OBJ-AT ?auto_98858 ?auto_98853 ) ( not ( = ?auto_98858 ?auto_98856 ) ) ( OBJ-AT ?auto_98854 ?auto_98853 ) ( OBJ-AT ?auto_98855 ?auto_98853 ) ( OBJ-AT ?auto_98857 ?auto_98853 ) ( not ( = ?auto_98854 ?auto_98855 ) ) ( not ( = ?auto_98854 ?auto_98856 ) ) ( not ( = ?auto_98854 ?auto_98857 ) ) ( not ( = ?auto_98854 ?auto_98858 ) ) ( not ( = ?auto_98855 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98857 ) ) ( not ( = ?auto_98855 ?auto_98858 ) ) ( not ( = ?auto_98856 ?auto_98857 ) ) ( not ( = ?auto_98857 ?auto_98858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98858 ?auto_98856 ?auto_98853 ) )
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
      ?auto_98910 - LOCATION
      ?auto_98911 - CITY
      ?auto_98908 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98905 ?auto_98909 ) ( TRUCK-AT ?auto_98909 ?auto_98910 ) ( IN-CITY ?auto_98910 ?auto_98911 ) ( IN-CITY ?auto_98903 ?auto_98911 ) ( not ( = ?auto_98903 ?auto_98910 ) ) ( OBJ-AT ?auto_98908 ?auto_98903 ) ( not ( = ?auto_98908 ?auto_98905 ) ) ( OBJ-AT ?auto_98904 ?auto_98903 ) ( OBJ-AT ?auto_98906 ?auto_98903 ) ( OBJ-AT ?auto_98907 ?auto_98903 ) ( not ( = ?auto_98904 ?auto_98905 ) ) ( not ( = ?auto_98904 ?auto_98906 ) ) ( not ( = ?auto_98904 ?auto_98907 ) ) ( not ( = ?auto_98904 ?auto_98908 ) ) ( not ( = ?auto_98905 ?auto_98906 ) ) ( not ( = ?auto_98905 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98908 ) ) ( not ( = ?auto_98907 ?auto_98908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98908 ?auto_98905 ?auto_98903 ) )
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
      ?auto_98952 - TRUCK
      ?auto_98953 - LOCATION
      ?auto_98954 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98948 ?auto_98952 ) ( TRUCK-AT ?auto_98952 ?auto_98953 ) ( IN-CITY ?auto_98953 ?auto_98954 ) ( IN-CITY ?auto_98947 ?auto_98954 ) ( not ( = ?auto_98947 ?auto_98953 ) ) ( OBJ-AT ?auto_98950 ?auto_98947 ) ( not ( = ?auto_98950 ?auto_98948 ) ) ( OBJ-AT ?auto_98949 ?auto_98947 ) ( OBJ-AT ?auto_98951 ?auto_98947 ) ( not ( = ?auto_98948 ?auto_98949 ) ) ( not ( = ?auto_98948 ?auto_98951 ) ) ( not ( = ?auto_98949 ?auto_98950 ) ) ( not ( = ?auto_98949 ?auto_98951 ) ) ( not ( = ?auto_98950 ?auto_98951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98950 ?auto_98948 ?auto_98947 ) )
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
      ?auto_99024 - TRUCK
      ?auto_99025 - LOCATION
      ?auto_99026 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_99020 ?auto_99024 ) ( TRUCK-AT ?auto_99024 ?auto_99025 ) ( IN-CITY ?auto_99025 ?auto_99026 ) ( IN-CITY ?auto_99019 ?auto_99026 ) ( not ( = ?auto_99019 ?auto_99025 ) ) ( OBJ-AT ?auto_99023 ?auto_99019 ) ( not ( = ?auto_99023 ?auto_99020 ) ) ( OBJ-AT ?auto_99021 ?auto_99019 ) ( OBJ-AT ?auto_99022 ?auto_99019 ) ( not ( = ?auto_99020 ?auto_99021 ) ) ( not ( = ?auto_99020 ?auto_99022 ) ) ( not ( = ?auto_99021 ?auto_99022 ) ) ( not ( = ?auto_99021 ?auto_99023 ) ) ( not ( = ?auto_99022 ?auto_99023 ) ) )
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
      ?auto_99058 - LOCATION
      ?auto_99059 - CITY
      ?auto_99056 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_99052 ?auto_99057 ) ( TRUCK-AT ?auto_99057 ?auto_99058 ) ( IN-CITY ?auto_99058 ?auto_99059 ) ( IN-CITY ?auto_99051 ?auto_99059 ) ( not ( = ?auto_99051 ?auto_99058 ) ) ( OBJ-AT ?auto_99056 ?auto_99051 ) ( not ( = ?auto_99056 ?auto_99052 ) ) ( OBJ-AT ?auto_99053 ?auto_99051 ) ( OBJ-AT ?auto_99054 ?auto_99051 ) ( OBJ-AT ?auto_99055 ?auto_99051 ) ( not ( = ?auto_99052 ?auto_99053 ) ) ( not ( = ?auto_99052 ?auto_99054 ) ) ( not ( = ?auto_99052 ?auto_99055 ) ) ( not ( = ?auto_99053 ?auto_99054 ) ) ( not ( = ?auto_99053 ?auto_99055 ) ) ( not ( = ?auto_99053 ?auto_99056 ) ) ( not ( = ?auto_99054 ?auto_99055 ) ) ( not ( = ?auto_99054 ?auto_99056 ) ) ( not ( = ?auto_99055 ?auto_99056 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99056 ?auto_99052 ?auto_99051 ) )
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
      ?auto_99242 - LOCATION
      ?auto_99241 - CITY
      ?auto_99240 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99239 ?auto_99242 ) ( IN-CITY ?auto_99242 ?auto_99241 ) ( IN-CITY ?auto_99235 ?auto_99241 ) ( not ( = ?auto_99235 ?auto_99242 ) ) ( OBJ-AT ?auto_99240 ?auto_99235 ) ( not ( = ?auto_99240 ?auto_99238 ) ) ( OBJ-AT ?auto_99238 ?auto_99242 ) ( OBJ-AT ?auto_99236 ?auto_99235 ) ( OBJ-AT ?auto_99237 ?auto_99235 ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99238 ) ) ( not ( = ?auto_99236 ?auto_99240 ) ) ( not ( = ?auto_99237 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99240 ?auto_99238 ?auto_99235 ) )
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
      ?auto_99254 - LOCATION
      ?auto_99253 - CITY
      ?auto_99252 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99251 ?auto_99254 ) ( IN-CITY ?auto_99254 ?auto_99253 ) ( IN-CITY ?auto_99247 ?auto_99253 ) ( not ( = ?auto_99247 ?auto_99254 ) ) ( OBJ-AT ?auto_99252 ?auto_99247 ) ( not ( = ?auto_99252 ?auto_99249 ) ) ( OBJ-AT ?auto_99249 ?auto_99254 ) ( OBJ-AT ?auto_99248 ?auto_99247 ) ( OBJ-AT ?auto_99250 ?auto_99247 ) ( not ( = ?auto_99248 ?auto_99249 ) ) ( not ( = ?auto_99248 ?auto_99250 ) ) ( not ( = ?auto_99248 ?auto_99252 ) ) ( not ( = ?auto_99249 ?auto_99250 ) ) ( not ( = ?auto_99250 ?auto_99252 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99252 ?auto_99249 ?auto_99247 ) )
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
      ?auto_99292 - LOCATION
      ?auto_99291 - CITY
      ?auto_99290 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99289 ?auto_99292 ) ( IN-CITY ?auto_99292 ?auto_99291 ) ( IN-CITY ?auto_99285 ?auto_99291 ) ( not ( = ?auto_99285 ?auto_99292 ) ) ( OBJ-AT ?auto_99290 ?auto_99285 ) ( not ( = ?auto_99290 ?auto_99286 ) ) ( OBJ-AT ?auto_99286 ?auto_99292 ) ( OBJ-AT ?auto_99287 ?auto_99285 ) ( OBJ-AT ?auto_99288 ?auto_99285 ) ( not ( = ?auto_99286 ?auto_99287 ) ) ( not ( = ?auto_99286 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99290 ) ) ( not ( = ?auto_99288 ?auto_99290 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99290 ?auto_99286 ?auto_99285 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99325 - OBJ
      ?auto_99326 - OBJ
      ?auto_99327 - OBJ
      ?auto_99328 - OBJ
      ?auto_99324 - LOCATION
    )
    :vars
    (
      ?auto_99329 - TRUCK
      ?auto_99331 - LOCATION
      ?auto_99330 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99329 ?auto_99331 ) ( IN-CITY ?auto_99331 ?auto_99330 ) ( IN-CITY ?auto_99324 ?auto_99330 ) ( not ( = ?auto_99324 ?auto_99331 ) ) ( OBJ-AT ?auto_99326 ?auto_99324 ) ( not ( = ?auto_99326 ?auto_99328 ) ) ( OBJ-AT ?auto_99328 ?auto_99331 ) ( OBJ-AT ?auto_99325 ?auto_99324 ) ( OBJ-AT ?auto_99327 ?auto_99324 ) ( not ( = ?auto_99325 ?auto_99326 ) ) ( not ( = ?auto_99325 ?auto_99327 ) ) ( not ( = ?auto_99325 ?auto_99328 ) ) ( not ( = ?auto_99326 ?auto_99327 ) ) ( not ( = ?auto_99327 ?auto_99328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99326 ?auto_99328 ?auto_99324 ) )
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
      ?auto_99347 - LOCATION
      ?auto_99346 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99345 ?auto_99347 ) ( IN-CITY ?auto_99347 ?auto_99346 ) ( IN-CITY ?auto_99340 ?auto_99346 ) ( not ( = ?auto_99340 ?auto_99347 ) ) ( OBJ-AT ?auto_99341 ?auto_99340 ) ( not ( = ?auto_99341 ?auto_99343 ) ) ( OBJ-AT ?auto_99343 ?auto_99347 ) ( OBJ-AT ?auto_99342 ?auto_99340 ) ( OBJ-AT ?auto_99344 ?auto_99340 ) ( not ( = ?auto_99341 ?auto_99342 ) ) ( not ( = ?auto_99341 ?auto_99344 ) ) ( not ( = ?auto_99342 ?auto_99343 ) ) ( not ( = ?auto_99342 ?auto_99344 ) ) ( not ( = ?auto_99343 ?auto_99344 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99341 ?auto_99343 ?auto_99340 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99493 - OBJ
      ?auto_99494 - OBJ
      ?auto_99495 - OBJ
      ?auto_99496 - OBJ
      ?auto_99492 - LOCATION
    )
    :vars
    (
      ?auto_99497 - TRUCK
      ?auto_99499 - LOCATION
      ?auto_99498 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99497 ?auto_99499 ) ( IN-CITY ?auto_99499 ?auto_99498 ) ( IN-CITY ?auto_99492 ?auto_99498 ) ( not ( = ?auto_99492 ?auto_99499 ) ) ( OBJ-AT ?auto_99494 ?auto_99492 ) ( not ( = ?auto_99494 ?auto_99495 ) ) ( OBJ-AT ?auto_99495 ?auto_99499 ) ( OBJ-AT ?auto_99493 ?auto_99492 ) ( OBJ-AT ?auto_99496 ?auto_99492 ) ( not ( = ?auto_99493 ?auto_99494 ) ) ( not ( = ?auto_99493 ?auto_99495 ) ) ( not ( = ?auto_99493 ?auto_99496 ) ) ( not ( = ?auto_99494 ?auto_99496 ) ) ( not ( = ?auto_99495 ?auto_99496 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99494 ?auto_99495 ?auto_99492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99517 - OBJ
      ?auto_99518 - OBJ
      ?auto_99519 - OBJ
      ?auto_99520 - OBJ
      ?auto_99516 - LOCATION
    )
    :vars
    (
      ?auto_99521 - TRUCK
      ?auto_99523 - LOCATION
      ?auto_99522 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99521 ?auto_99523 ) ( IN-CITY ?auto_99523 ?auto_99522 ) ( IN-CITY ?auto_99516 ?auto_99522 ) ( not ( = ?auto_99516 ?auto_99523 ) ) ( OBJ-AT ?auto_99519 ?auto_99516 ) ( not ( = ?auto_99519 ?auto_99520 ) ) ( OBJ-AT ?auto_99520 ?auto_99523 ) ( OBJ-AT ?auto_99517 ?auto_99516 ) ( OBJ-AT ?auto_99518 ?auto_99516 ) ( not ( = ?auto_99517 ?auto_99518 ) ) ( not ( = ?auto_99517 ?auto_99519 ) ) ( not ( = ?auto_99517 ?auto_99520 ) ) ( not ( = ?auto_99518 ?auto_99519 ) ) ( not ( = ?auto_99518 ?auto_99520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99519 ?auto_99520 ?auto_99516 ) )
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
      ?auto_99532 - LOCATION
      ?auto_99531 - CITY
      ?auto_99530 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99529 ?auto_99532 ) ( IN-CITY ?auto_99532 ?auto_99531 ) ( IN-CITY ?auto_99524 ?auto_99531 ) ( not ( = ?auto_99524 ?auto_99532 ) ) ( OBJ-AT ?auto_99530 ?auto_99524 ) ( not ( = ?auto_99530 ?auto_99528 ) ) ( OBJ-AT ?auto_99528 ?auto_99532 ) ( OBJ-AT ?auto_99525 ?auto_99524 ) ( OBJ-AT ?auto_99526 ?auto_99524 ) ( OBJ-AT ?auto_99527 ?auto_99524 ) ( not ( = ?auto_99525 ?auto_99526 ) ) ( not ( = ?auto_99525 ?auto_99527 ) ) ( not ( = ?auto_99525 ?auto_99528 ) ) ( not ( = ?auto_99525 ?auto_99530 ) ) ( not ( = ?auto_99526 ?auto_99527 ) ) ( not ( = ?auto_99526 ?auto_99528 ) ) ( not ( = ?auto_99526 ?auto_99530 ) ) ( not ( = ?auto_99527 ?auto_99528 ) ) ( not ( = ?auto_99527 ?auto_99530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99530 ?auto_99528 ?auto_99524 ) )
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
      ?auto_99549 - LOCATION
      ?auto_99548 - CITY
      ?auto_99547 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99546 ?auto_99549 ) ( IN-CITY ?auto_99549 ?auto_99548 ) ( IN-CITY ?auto_99541 ?auto_99548 ) ( not ( = ?auto_99541 ?auto_99549 ) ) ( OBJ-AT ?auto_99547 ?auto_99541 ) ( not ( = ?auto_99547 ?auto_99544 ) ) ( OBJ-AT ?auto_99544 ?auto_99549 ) ( OBJ-AT ?auto_99542 ?auto_99541 ) ( OBJ-AT ?auto_99543 ?auto_99541 ) ( OBJ-AT ?auto_99545 ?auto_99541 ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99542 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99547 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99545 ) ) ( not ( = ?auto_99543 ?auto_99547 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) ( not ( = ?auto_99545 ?auto_99547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99547 ?auto_99544 ?auto_99541 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99560 - OBJ
      ?auto_99561 - OBJ
      ?auto_99562 - OBJ
      ?auto_99563 - OBJ
      ?auto_99559 - LOCATION
    )
    :vars
    (
      ?auto_99564 - TRUCK
      ?auto_99566 - LOCATION
      ?auto_99565 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99564 ?auto_99566 ) ( IN-CITY ?auto_99566 ?auto_99565 ) ( IN-CITY ?auto_99559 ?auto_99565 ) ( not ( = ?auto_99559 ?auto_99566 ) ) ( OBJ-AT ?auto_99563 ?auto_99559 ) ( not ( = ?auto_99563 ?auto_99561 ) ) ( OBJ-AT ?auto_99561 ?auto_99566 ) ( OBJ-AT ?auto_99560 ?auto_99559 ) ( OBJ-AT ?auto_99562 ?auto_99559 ) ( not ( = ?auto_99560 ?auto_99561 ) ) ( not ( = ?auto_99560 ?auto_99562 ) ) ( not ( = ?auto_99560 ?auto_99563 ) ) ( not ( = ?auto_99561 ?auto_99562 ) ) ( not ( = ?auto_99562 ?auto_99563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99563 ?auto_99561 ?auto_99559 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99568 - OBJ
      ?auto_99569 - OBJ
      ?auto_99570 - OBJ
      ?auto_99571 - OBJ
      ?auto_99567 - LOCATION
    )
    :vars
    (
      ?auto_99572 - TRUCK
      ?auto_99574 - LOCATION
      ?auto_99573 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99572 ?auto_99574 ) ( IN-CITY ?auto_99574 ?auto_99573 ) ( IN-CITY ?auto_99567 ?auto_99573 ) ( not ( = ?auto_99567 ?auto_99574 ) ) ( OBJ-AT ?auto_99570 ?auto_99567 ) ( not ( = ?auto_99570 ?auto_99569 ) ) ( OBJ-AT ?auto_99569 ?auto_99574 ) ( OBJ-AT ?auto_99568 ?auto_99567 ) ( OBJ-AT ?auto_99571 ?auto_99567 ) ( not ( = ?auto_99568 ?auto_99569 ) ) ( not ( = ?auto_99568 ?auto_99570 ) ) ( not ( = ?auto_99568 ?auto_99571 ) ) ( not ( = ?auto_99569 ?auto_99571 ) ) ( not ( = ?auto_99570 ?auto_99571 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99570 ?auto_99569 ?auto_99567 ) )
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
      ?auto_99599 - LOCATION
      ?auto_99598 - CITY
      ?auto_99597 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99596 ?auto_99599 ) ( IN-CITY ?auto_99599 ?auto_99598 ) ( IN-CITY ?auto_99591 ?auto_99598 ) ( not ( = ?auto_99591 ?auto_99599 ) ) ( OBJ-AT ?auto_99597 ?auto_99591 ) ( not ( = ?auto_99597 ?auto_99593 ) ) ( OBJ-AT ?auto_99593 ?auto_99599 ) ( OBJ-AT ?auto_99592 ?auto_99591 ) ( OBJ-AT ?auto_99594 ?auto_99591 ) ( OBJ-AT ?auto_99595 ?auto_99591 ) ( not ( = ?auto_99592 ?auto_99593 ) ) ( not ( = ?auto_99592 ?auto_99594 ) ) ( not ( = ?auto_99592 ?auto_99595 ) ) ( not ( = ?auto_99592 ?auto_99597 ) ) ( not ( = ?auto_99593 ?auto_99594 ) ) ( not ( = ?auto_99593 ?auto_99595 ) ) ( not ( = ?auto_99594 ?auto_99595 ) ) ( not ( = ?auto_99594 ?auto_99597 ) ) ( not ( = ?auto_99595 ?auto_99597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99597 ?auto_99593 ?auto_99591 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99636 - OBJ
      ?auto_99637 - OBJ
      ?auto_99638 - OBJ
      ?auto_99639 - OBJ
      ?auto_99635 - LOCATION
    )
    :vars
    (
      ?auto_99640 - TRUCK
      ?auto_99642 - LOCATION
      ?auto_99641 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99640 ?auto_99642 ) ( IN-CITY ?auto_99642 ?auto_99641 ) ( IN-CITY ?auto_99635 ?auto_99641 ) ( not ( = ?auto_99635 ?auto_99642 ) ) ( OBJ-AT ?auto_99637 ?auto_99635 ) ( not ( = ?auto_99637 ?auto_99636 ) ) ( OBJ-AT ?auto_99636 ?auto_99642 ) ( OBJ-AT ?auto_99638 ?auto_99635 ) ( OBJ-AT ?auto_99639 ?auto_99635 ) ( not ( = ?auto_99636 ?auto_99638 ) ) ( not ( = ?auto_99636 ?auto_99639 ) ) ( not ( = ?auto_99637 ?auto_99638 ) ) ( not ( = ?auto_99637 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99637 ?auto_99636 ?auto_99635 ) )
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
      ?auto_99666 - LOCATION
      ?auto_99665 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99664 ?auto_99666 ) ( IN-CITY ?auto_99666 ?auto_99665 ) ( IN-CITY ?auto_99659 ?auto_99665 ) ( not ( = ?auto_99659 ?auto_99666 ) ) ( OBJ-AT ?auto_99663 ?auto_99659 ) ( not ( = ?auto_99663 ?auto_99660 ) ) ( OBJ-AT ?auto_99660 ?auto_99666 ) ( OBJ-AT ?auto_99661 ?auto_99659 ) ( OBJ-AT ?auto_99662 ?auto_99659 ) ( not ( = ?auto_99660 ?auto_99661 ) ) ( not ( = ?auto_99660 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99663 ) ) ( not ( = ?auto_99662 ?auto_99663 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99663 ?auto_99660 ?auto_99659 ) )
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
      ?auto_99747 - LOCATION
      ?auto_99746 - CITY
      ?auto_99745 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99744 ?auto_99747 ) ( IN-CITY ?auto_99747 ?auto_99746 ) ( IN-CITY ?auto_99739 ?auto_99746 ) ( not ( = ?auto_99739 ?auto_99747 ) ) ( OBJ-AT ?auto_99745 ?auto_99739 ) ( not ( = ?auto_99745 ?auto_99740 ) ) ( OBJ-AT ?auto_99740 ?auto_99747 ) ( OBJ-AT ?auto_99741 ?auto_99739 ) ( OBJ-AT ?auto_99742 ?auto_99739 ) ( OBJ-AT ?auto_99743 ?auto_99739 ) ( not ( = ?auto_99740 ?auto_99741 ) ) ( not ( = ?auto_99740 ?auto_99742 ) ) ( not ( = ?auto_99740 ?auto_99743 ) ) ( not ( = ?auto_99741 ?auto_99742 ) ) ( not ( = ?auto_99741 ?auto_99743 ) ) ( not ( = ?auto_99741 ?auto_99745 ) ) ( not ( = ?auto_99742 ?auto_99743 ) ) ( not ( = ?auto_99742 ?auto_99745 ) ) ( not ( = ?auto_99743 ?auto_99745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99745 ?auto_99740 ?auto_99739 ) )
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
      ?auto_99895 - LOCATION
      ?auto_99896 - CITY
      ?auto_99894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99895 ?auto_99896 ) ( IN-CITY ?auto_99890 ?auto_99896 ) ( not ( = ?auto_99890 ?auto_99895 ) ) ( OBJ-AT ?auto_99892 ?auto_99890 ) ( not ( = ?auto_99892 ?auto_99893 ) ) ( OBJ-AT ?auto_99893 ?auto_99895 ) ( TRUCK-AT ?auto_99894 ?auto_99890 ) ( OBJ-AT ?auto_99891 ?auto_99890 ) ( not ( = ?auto_99891 ?auto_99892 ) ) ( not ( = ?auto_99891 ?auto_99893 ) ) )
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
      ?auto_99929 - CITY
      ?auto_99930 - OBJ
      ?auto_99927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99928 ?auto_99929 ) ( IN-CITY ?auto_99923 ?auto_99929 ) ( not ( = ?auto_99923 ?auto_99928 ) ) ( OBJ-AT ?auto_99930 ?auto_99923 ) ( not ( = ?auto_99930 ?auto_99926 ) ) ( OBJ-AT ?auto_99926 ?auto_99928 ) ( TRUCK-AT ?auto_99927 ?auto_99923 ) ( OBJ-AT ?auto_99924 ?auto_99923 ) ( OBJ-AT ?auto_99925 ?auto_99923 ) ( not ( = ?auto_99924 ?auto_99925 ) ) ( not ( = ?auto_99924 ?auto_99926 ) ) ( not ( = ?auto_99924 ?auto_99930 ) ) ( not ( = ?auto_99925 ?auto_99926 ) ) ( not ( = ?auto_99925 ?auto_99930 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99930 ?auto_99926 ?auto_99923 ) )
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
      ?auto_99941 - CITY
      ?auto_99942 - OBJ
      ?auto_99939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99940 ?auto_99941 ) ( IN-CITY ?auto_99935 ?auto_99941 ) ( not ( = ?auto_99935 ?auto_99940 ) ) ( OBJ-AT ?auto_99942 ?auto_99935 ) ( not ( = ?auto_99942 ?auto_99937 ) ) ( OBJ-AT ?auto_99937 ?auto_99940 ) ( TRUCK-AT ?auto_99939 ?auto_99935 ) ( OBJ-AT ?auto_99936 ?auto_99935 ) ( OBJ-AT ?auto_99938 ?auto_99935 ) ( not ( = ?auto_99936 ?auto_99937 ) ) ( not ( = ?auto_99936 ?auto_99938 ) ) ( not ( = ?auto_99936 ?auto_99942 ) ) ( not ( = ?auto_99937 ?auto_99938 ) ) ( not ( = ?auto_99938 ?auto_99942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99942 ?auto_99937 ?auto_99935 ) )
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
      ?auto_99979 - CITY
      ?auto_99980 - OBJ
      ?auto_99977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99978 ?auto_99979 ) ( IN-CITY ?auto_99973 ?auto_99979 ) ( not ( = ?auto_99973 ?auto_99978 ) ) ( OBJ-AT ?auto_99980 ?auto_99973 ) ( not ( = ?auto_99980 ?auto_99974 ) ) ( OBJ-AT ?auto_99974 ?auto_99978 ) ( TRUCK-AT ?auto_99977 ?auto_99973 ) ( OBJ-AT ?auto_99975 ?auto_99973 ) ( OBJ-AT ?auto_99976 ?auto_99973 ) ( not ( = ?auto_99974 ?auto_99975 ) ) ( not ( = ?auto_99974 ?auto_99976 ) ) ( not ( = ?auto_99975 ?auto_99976 ) ) ( not ( = ?auto_99975 ?auto_99980 ) ) ( not ( = ?auto_99976 ?auto_99980 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99980 ?auto_99974 ?auto_99973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100013 - OBJ
      ?auto_100014 - OBJ
      ?auto_100015 - OBJ
      ?auto_100016 - OBJ
      ?auto_100012 - LOCATION
    )
    :vars
    (
      ?auto_100018 - LOCATION
      ?auto_100019 - CITY
      ?auto_100017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100018 ?auto_100019 ) ( IN-CITY ?auto_100012 ?auto_100019 ) ( not ( = ?auto_100012 ?auto_100018 ) ) ( OBJ-AT ?auto_100015 ?auto_100012 ) ( not ( = ?auto_100015 ?auto_100016 ) ) ( OBJ-AT ?auto_100016 ?auto_100018 ) ( TRUCK-AT ?auto_100017 ?auto_100012 ) ( OBJ-AT ?auto_100013 ?auto_100012 ) ( OBJ-AT ?auto_100014 ?auto_100012 ) ( not ( = ?auto_100013 ?auto_100014 ) ) ( not ( = ?auto_100013 ?auto_100015 ) ) ( not ( = ?auto_100013 ?auto_100016 ) ) ( not ( = ?auto_100014 ?auto_100015 ) ) ( not ( = ?auto_100014 ?auto_100016 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100015 ?auto_100016 ?auto_100012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100021 - OBJ
      ?auto_100022 - OBJ
      ?auto_100023 - OBJ
      ?auto_100024 - OBJ
      ?auto_100020 - LOCATION
    )
    :vars
    (
      ?auto_100026 - LOCATION
      ?auto_100027 - CITY
      ?auto_100025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100026 ?auto_100027 ) ( IN-CITY ?auto_100020 ?auto_100027 ) ( not ( = ?auto_100020 ?auto_100026 ) ) ( OBJ-AT ?auto_100021 ?auto_100020 ) ( not ( = ?auto_100021 ?auto_100024 ) ) ( OBJ-AT ?auto_100024 ?auto_100026 ) ( TRUCK-AT ?auto_100025 ?auto_100020 ) ( OBJ-AT ?auto_100022 ?auto_100020 ) ( OBJ-AT ?auto_100023 ?auto_100020 ) ( not ( = ?auto_100021 ?auto_100022 ) ) ( not ( = ?auto_100021 ?auto_100023 ) ) ( not ( = ?auto_100022 ?auto_100023 ) ) ( not ( = ?auto_100022 ?auto_100024 ) ) ( not ( = ?auto_100023 ?auto_100024 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100021 ?auto_100024 ?auto_100020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100029 - OBJ
      ?auto_100030 - OBJ
      ?auto_100031 - OBJ
      ?auto_100032 - OBJ
      ?auto_100028 - LOCATION
    )
    :vars
    (
      ?auto_100034 - LOCATION
      ?auto_100035 - CITY
      ?auto_100033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100034 ?auto_100035 ) ( IN-CITY ?auto_100028 ?auto_100035 ) ( not ( = ?auto_100028 ?auto_100034 ) ) ( OBJ-AT ?auto_100032 ?auto_100028 ) ( not ( = ?auto_100032 ?auto_100031 ) ) ( OBJ-AT ?auto_100031 ?auto_100034 ) ( TRUCK-AT ?auto_100033 ?auto_100028 ) ( OBJ-AT ?auto_100029 ?auto_100028 ) ( OBJ-AT ?auto_100030 ?auto_100028 ) ( not ( = ?auto_100029 ?auto_100030 ) ) ( not ( = ?auto_100029 ?auto_100031 ) ) ( not ( = ?auto_100029 ?auto_100032 ) ) ( not ( = ?auto_100030 ?auto_100031 ) ) ( not ( = ?auto_100030 ?auto_100032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100032 ?auto_100031 ?auto_100028 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100101 - OBJ
      ?auto_100102 - OBJ
      ?auto_100103 - OBJ
      ?auto_100104 - OBJ
      ?auto_100100 - LOCATION
    )
    :vars
    (
      ?auto_100106 - LOCATION
      ?auto_100107 - CITY
      ?auto_100105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100106 ?auto_100107 ) ( IN-CITY ?auto_100100 ?auto_100107 ) ( not ( = ?auto_100100 ?auto_100106 ) ) ( OBJ-AT ?auto_100101 ?auto_100100 ) ( not ( = ?auto_100101 ?auto_100102 ) ) ( OBJ-AT ?auto_100102 ?auto_100106 ) ( TRUCK-AT ?auto_100105 ?auto_100100 ) ( OBJ-AT ?auto_100103 ?auto_100100 ) ( OBJ-AT ?auto_100104 ?auto_100100 ) ( not ( = ?auto_100101 ?auto_100103 ) ) ( not ( = ?auto_100101 ?auto_100104 ) ) ( not ( = ?auto_100102 ?auto_100103 ) ) ( not ( = ?auto_100102 ?auto_100104 ) ) ( not ( = ?auto_100103 ?auto_100104 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100101 ?auto_100102 ?auto_100100 ) )
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
      ?auto_100122 - LOCATION
      ?auto_100123 - CITY
      ?auto_100121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100122 ?auto_100123 ) ( IN-CITY ?auto_100116 ?auto_100123 ) ( not ( = ?auto_100116 ?auto_100122 ) ) ( OBJ-AT ?auto_100120 ?auto_100116 ) ( not ( = ?auto_100120 ?auto_100118 ) ) ( OBJ-AT ?auto_100118 ?auto_100122 ) ( TRUCK-AT ?auto_100121 ?auto_100116 ) ( OBJ-AT ?auto_100117 ?auto_100116 ) ( OBJ-AT ?auto_100119 ?auto_100116 ) ( not ( = ?auto_100117 ?auto_100118 ) ) ( not ( = ?auto_100117 ?auto_100119 ) ) ( not ( = ?auto_100117 ?auto_100120 ) ) ( not ( = ?auto_100118 ?auto_100119 ) ) ( not ( = ?auto_100119 ?auto_100120 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100120 ?auto_100118 ?auto_100116 ) )
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
      ?auto_100186 - LOCATION
      ?auto_100187 - CITY
      ?auto_100185 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100186 ?auto_100187 ) ( IN-CITY ?auto_100180 ?auto_100187 ) ( not ( = ?auto_100180 ?auto_100186 ) ) ( OBJ-AT ?auto_100182 ?auto_100180 ) ( not ( = ?auto_100182 ?auto_100183 ) ) ( OBJ-AT ?auto_100183 ?auto_100186 ) ( TRUCK-AT ?auto_100185 ?auto_100180 ) ( OBJ-AT ?auto_100181 ?auto_100180 ) ( OBJ-AT ?auto_100184 ?auto_100180 ) ( not ( = ?auto_100181 ?auto_100182 ) ) ( not ( = ?auto_100181 ?auto_100183 ) ) ( not ( = ?auto_100181 ?auto_100184 ) ) ( not ( = ?auto_100182 ?auto_100184 ) ) ( not ( = ?auto_100183 ?auto_100184 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100182 ?auto_100183 ?auto_100180 ) )
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
      ?auto_100219 - CITY
      ?auto_100220 - OBJ
      ?auto_100217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100218 ?auto_100219 ) ( IN-CITY ?auto_100212 ?auto_100219 ) ( not ( = ?auto_100212 ?auto_100218 ) ) ( OBJ-AT ?auto_100220 ?auto_100212 ) ( not ( = ?auto_100220 ?auto_100216 ) ) ( OBJ-AT ?auto_100216 ?auto_100218 ) ( TRUCK-AT ?auto_100217 ?auto_100212 ) ( OBJ-AT ?auto_100213 ?auto_100212 ) ( OBJ-AT ?auto_100214 ?auto_100212 ) ( OBJ-AT ?auto_100215 ?auto_100212 ) ( not ( = ?auto_100213 ?auto_100214 ) ) ( not ( = ?auto_100213 ?auto_100215 ) ) ( not ( = ?auto_100213 ?auto_100216 ) ) ( not ( = ?auto_100213 ?auto_100220 ) ) ( not ( = ?auto_100214 ?auto_100215 ) ) ( not ( = ?auto_100214 ?auto_100216 ) ) ( not ( = ?auto_100214 ?auto_100220 ) ) ( not ( = ?auto_100215 ?auto_100216 ) ) ( not ( = ?auto_100215 ?auto_100220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100220 ?auto_100216 ?auto_100212 ) )
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
      ?auto_100236 - CITY
      ?auto_100237 - OBJ
      ?auto_100234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100235 ?auto_100236 ) ( IN-CITY ?auto_100229 ?auto_100236 ) ( not ( = ?auto_100229 ?auto_100235 ) ) ( OBJ-AT ?auto_100237 ?auto_100229 ) ( not ( = ?auto_100237 ?auto_100232 ) ) ( OBJ-AT ?auto_100232 ?auto_100235 ) ( TRUCK-AT ?auto_100234 ?auto_100229 ) ( OBJ-AT ?auto_100230 ?auto_100229 ) ( OBJ-AT ?auto_100231 ?auto_100229 ) ( OBJ-AT ?auto_100233 ?auto_100229 ) ( not ( = ?auto_100230 ?auto_100231 ) ) ( not ( = ?auto_100230 ?auto_100232 ) ) ( not ( = ?auto_100230 ?auto_100233 ) ) ( not ( = ?auto_100230 ?auto_100237 ) ) ( not ( = ?auto_100231 ?auto_100232 ) ) ( not ( = ?auto_100231 ?auto_100233 ) ) ( not ( = ?auto_100231 ?auto_100237 ) ) ( not ( = ?auto_100232 ?auto_100233 ) ) ( not ( = ?auto_100233 ?auto_100237 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100237 ?auto_100232 ?auto_100229 ) )
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
      ?auto_100286 - CITY
      ?auto_100287 - OBJ
      ?auto_100284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100285 ?auto_100286 ) ( IN-CITY ?auto_100279 ?auto_100286 ) ( not ( = ?auto_100279 ?auto_100285 ) ) ( OBJ-AT ?auto_100287 ?auto_100279 ) ( not ( = ?auto_100287 ?auto_100281 ) ) ( OBJ-AT ?auto_100281 ?auto_100285 ) ( TRUCK-AT ?auto_100284 ?auto_100279 ) ( OBJ-AT ?auto_100280 ?auto_100279 ) ( OBJ-AT ?auto_100282 ?auto_100279 ) ( OBJ-AT ?auto_100283 ?auto_100279 ) ( not ( = ?auto_100280 ?auto_100281 ) ) ( not ( = ?auto_100280 ?auto_100282 ) ) ( not ( = ?auto_100280 ?auto_100283 ) ) ( not ( = ?auto_100280 ?auto_100287 ) ) ( not ( = ?auto_100281 ?auto_100282 ) ) ( not ( = ?auto_100281 ?auto_100283 ) ) ( not ( = ?auto_100282 ?auto_100283 ) ) ( not ( = ?auto_100282 ?auto_100287 ) ) ( not ( = ?auto_100283 ?auto_100287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100287 ?auto_100281 ?auto_100279 ) )
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
      ?auto_100329 - LOCATION
      ?auto_100330 - CITY
      ?auto_100328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100329 ?auto_100330 ) ( IN-CITY ?auto_100323 ?auto_100330 ) ( not ( = ?auto_100323 ?auto_100329 ) ) ( OBJ-AT ?auto_100326 ?auto_100323 ) ( not ( = ?auto_100326 ?auto_100324 ) ) ( OBJ-AT ?auto_100324 ?auto_100329 ) ( TRUCK-AT ?auto_100328 ?auto_100323 ) ( OBJ-AT ?auto_100325 ?auto_100323 ) ( OBJ-AT ?auto_100327 ?auto_100323 ) ( not ( = ?auto_100324 ?auto_100325 ) ) ( not ( = ?auto_100324 ?auto_100327 ) ) ( not ( = ?auto_100325 ?auto_100326 ) ) ( not ( = ?auto_100325 ?auto_100327 ) ) ( not ( = ?auto_100326 ?auto_100327 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100326 ?auto_100324 ?auto_100323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_100348 - OBJ
      ?auto_100349 - OBJ
      ?auto_100350 - OBJ
      ?auto_100351 - OBJ
      ?auto_100347 - LOCATION
    )
    :vars
    (
      ?auto_100353 - LOCATION
      ?auto_100354 - CITY
      ?auto_100352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100353 ?auto_100354 ) ( IN-CITY ?auto_100347 ?auto_100354 ) ( not ( = ?auto_100347 ?auto_100353 ) ) ( OBJ-AT ?auto_100349 ?auto_100347 ) ( not ( = ?auto_100349 ?auto_100348 ) ) ( OBJ-AT ?auto_100348 ?auto_100353 ) ( TRUCK-AT ?auto_100352 ?auto_100347 ) ( OBJ-AT ?auto_100350 ?auto_100347 ) ( OBJ-AT ?auto_100351 ?auto_100347 ) ( not ( = ?auto_100348 ?auto_100350 ) ) ( not ( = ?auto_100348 ?auto_100351 ) ) ( not ( = ?auto_100349 ?auto_100350 ) ) ( not ( = ?auto_100349 ?auto_100351 ) ) ( not ( = ?auto_100350 ?auto_100351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100349 ?auto_100348 ?auto_100347 ) )
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
      ?auto_100434 - CITY
      ?auto_100435 - OBJ
      ?auto_100432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_100433 ?auto_100434 ) ( IN-CITY ?auto_100427 ?auto_100434 ) ( not ( = ?auto_100427 ?auto_100433 ) ) ( OBJ-AT ?auto_100435 ?auto_100427 ) ( not ( = ?auto_100435 ?auto_100428 ) ) ( OBJ-AT ?auto_100428 ?auto_100433 ) ( TRUCK-AT ?auto_100432 ?auto_100427 ) ( OBJ-AT ?auto_100429 ?auto_100427 ) ( OBJ-AT ?auto_100430 ?auto_100427 ) ( OBJ-AT ?auto_100431 ?auto_100427 ) ( not ( = ?auto_100428 ?auto_100429 ) ) ( not ( = ?auto_100428 ?auto_100430 ) ) ( not ( = ?auto_100428 ?auto_100431 ) ) ( not ( = ?auto_100429 ?auto_100430 ) ) ( not ( = ?auto_100429 ?auto_100431 ) ) ( not ( = ?auto_100429 ?auto_100435 ) ) ( not ( = ?auto_100430 ?auto_100431 ) ) ( not ( = ?auto_100430 ?auto_100435 ) ) ( not ( = ?auto_100431 ?auto_100435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100435 ?auto_100428 ?auto_100427 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_101252 - OBJ
      ?auto_101251 - LOCATION
    )
    :vars
    (
      ?auto_101253 - LOCATION
      ?auto_101256 - CITY
      ?auto_101255 - OBJ
      ?auto_101254 - TRUCK
      ?auto_101257 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101253 ?auto_101256 ) ( IN-CITY ?auto_101251 ?auto_101256 ) ( not ( = ?auto_101251 ?auto_101253 ) ) ( OBJ-AT ?auto_101255 ?auto_101251 ) ( not ( = ?auto_101255 ?auto_101252 ) ) ( OBJ-AT ?auto_101252 ?auto_101253 ) ( TRUCK-AT ?auto_101254 ?auto_101257 ) ( IN-CITY ?auto_101257 ?auto_101256 ) ( not ( = ?auto_101251 ?auto_101257 ) ) ( not ( = ?auto_101253 ?auto_101257 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_101254 ?auto_101257 ?auto_101251 ?auto_101256 )
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
      ?auto_101261 - LOCATION
      ?auto_101262 - CITY
      ?auto_101263 - TRUCK
      ?auto_101264 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101261 ?auto_101262 ) ( IN-CITY ?auto_101258 ?auto_101262 ) ( not ( = ?auto_101258 ?auto_101261 ) ) ( OBJ-AT ?auto_101259 ?auto_101258 ) ( not ( = ?auto_101259 ?auto_101260 ) ) ( OBJ-AT ?auto_101260 ?auto_101261 ) ( TRUCK-AT ?auto_101263 ?auto_101264 ) ( IN-CITY ?auto_101264 ?auto_101262 ) ( not ( = ?auto_101258 ?auto_101264 ) ) ( not ( = ?auto_101261 ?auto_101264 ) ) )
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
      ?auto_101276 - LOCATION
      ?auto_101279 - CITY
      ?auto_101277 - TRUCK
      ?auto_101278 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101276 ?auto_101279 ) ( IN-CITY ?auto_101273 ?auto_101279 ) ( not ( = ?auto_101273 ?auto_101276 ) ) ( OBJ-AT ?auto_101275 ?auto_101273 ) ( not ( = ?auto_101275 ?auto_101274 ) ) ( OBJ-AT ?auto_101274 ?auto_101276 ) ( TRUCK-AT ?auto_101277 ?auto_101278 ) ( IN-CITY ?auto_101278 ?auto_101279 ) ( not ( = ?auto_101273 ?auto_101278 ) ) ( not ( = ?auto_101276 ?auto_101278 ) ) )
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
      ?auto_101300 - LOCATION
      ?auto_101303 - CITY
      ?auto_101301 - TRUCK
      ?auto_101302 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101300 ?auto_101303 ) ( IN-CITY ?auto_101296 ?auto_101303 ) ( not ( = ?auto_101296 ?auto_101300 ) ) ( OBJ-AT ?auto_101297 ?auto_101296 ) ( not ( = ?auto_101297 ?auto_101299 ) ) ( OBJ-AT ?auto_101299 ?auto_101300 ) ( TRUCK-AT ?auto_101301 ?auto_101302 ) ( IN-CITY ?auto_101302 ?auto_101303 ) ( not ( = ?auto_101296 ?auto_101302 ) ) ( not ( = ?auto_101300 ?auto_101302 ) ) ( OBJ-AT ?auto_101298 ?auto_101296 ) ( not ( = ?auto_101297 ?auto_101298 ) ) ( not ( = ?auto_101298 ?auto_101299 ) ) )
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
      ?auto_101316 - LOCATION
      ?auto_101319 - CITY
      ?auto_101317 - TRUCK
      ?auto_101318 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101316 ?auto_101319 ) ( IN-CITY ?auto_101312 ?auto_101319 ) ( not ( = ?auto_101312 ?auto_101316 ) ) ( OBJ-AT ?auto_101315 ?auto_101312 ) ( not ( = ?auto_101315 ?auto_101314 ) ) ( OBJ-AT ?auto_101314 ?auto_101316 ) ( TRUCK-AT ?auto_101317 ?auto_101318 ) ( IN-CITY ?auto_101318 ?auto_101319 ) ( not ( = ?auto_101312 ?auto_101318 ) ) ( not ( = ?auto_101316 ?auto_101318 ) ) ( OBJ-AT ?auto_101313 ?auto_101312 ) ( not ( = ?auto_101313 ?auto_101314 ) ) ( not ( = ?auto_101313 ?auto_101315 ) ) )
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
      ?auto_101383 - LOCATION
      ?auto_101386 - CITY
      ?auto_101384 - TRUCK
      ?auto_101385 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101383 ?auto_101386 ) ( IN-CITY ?auto_101379 ?auto_101386 ) ( not ( = ?auto_101379 ?auto_101383 ) ) ( OBJ-AT ?auto_101382 ?auto_101379 ) ( not ( = ?auto_101382 ?auto_101380 ) ) ( OBJ-AT ?auto_101380 ?auto_101383 ) ( TRUCK-AT ?auto_101384 ?auto_101385 ) ( IN-CITY ?auto_101385 ?auto_101386 ) ( not ( = ?auto_101379 ?auto_101385 ) ) ( not ( = ?auto_101383 ?auto_101385 ) ) ( OBJ-AT ?auto_101381 ?auto_101379 ) ( not ( = ?auto_101380 ?auto_101381 ) ) ( not ( = ?auto_101381 ?auto_101382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101382 ?auto_101380 ?auto_101379 ) )
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
      ?auto_101460 - LOCATION
      ?auto_101463 - CITY
      ?auto_101461 - TRUCK
      ?auto_101462 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101460 ?auto_101463 ) ( IN-CITY ?auto_101455 ?auto_101463 ) ( not ( = ?auto_101455 ?auto_101460 ) ) ( OBJ-AT ?auto_101456 ?auto_101455 ) ( not ( = ?auto_101456 ?auto_101459 ) ) ( OBJ-AT ?auto_101459 ?auto_101460 ) ( TRUCK-AT ?auto_101461 ?auto_101462 ) ( IN-CITY ?auto_101462 ?auto_101463 ) ( not ( = ?auto_101455 ?auto_101462 ) ) ( not ( = ?auto_101460 ?auto_101462 ) ) ( OBJ-AT ?auto_101457 ?auto_101455 ) ( OBJ-AT ?auto_101458 ?auto_101455 ) ( not ( = ?auto_101456 ?auto_101457 ) ) ( not ( = ?auto_101456 ?auto_101458 ) ) ( not ( = ?auto_101457 ?auto_101458 ) ) ( not ( = ?auto_101457 ?auto_101459 ) ) ( not ( = ?auto_101458 ?auto_101459 ) ) )
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
      ?auto_101478 - LOCATION
      ?auto_101481 - CITY
      ?auto_101479 - TRUCK
      ?auto_101480 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101478 ?auto_101481 ) ( IN-CITY ?auto_101473 ?auto_101481 ) ( not ( = ?auto_101473 ?auto_101478 ) ) ( OBJ-AT ?auto_101477 ?auto_101473 ) ( not ( = ?auto_101477 ?auto_101476 ) ) ( OBJ-AT ?auto_101476 ?auto_101478 ) ( TRUCK-AT ?auto_101479 ?auto_101480 ) ( IN-CITY ?auto_101480 ?auto_101481 ) ( not ( = ?auto_101473 ?auto_101480 ) ) ( not ( = ?auto_101478 ?auto_101480 ) ) ( OBJ-AT ?auto_101474 ?auto_101473 ) ( OBJ-AT ?auto_101475 ?auto_101473 ) ( not ( = ?auto_101474 ?auto_101475 ) ) ( not ( = ?auto_101474 ?auto_101476 ) ) ( not ( = ?auto_101474 ?auto_101477 ) ) ( not ( = ?auto_101475 ?auto_101476 ) ) ( not ( = ?auto_101475 ?auto_101477 ) ) )
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
      ?auto_101550 - LOCATION
      ?auto_101553 - CITY
      ?auto_101551 - TRUCK
      ?auto_101552 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101550 ?auto_101553 ) ( IN-CITY ?auto_101545 ?auto_101553 ) ( not ( = ?auto_101545 ?auto_101550 ) ) ( OBJ-AT ?auto_101546 ?auto_101545 ) ( not ( = ?auto_101546 ?auto_101547 ) ) ( OBJ-AT ?auto_101547 ?auto_101550 ) ( TRUCK-AT ?auto_101551 ?auto_101552 ) ( IN-CITY ?auto_101552 ?auto_101553 ) ( not ( = ?auto_101545 ?auto_101552 ) ) ( not ( = ?auto_101550 ?auto_101552 ) ) ( OBJ-AT ?auto_101548 ?auto_101545 ) ( OBJ-AT ?auto_101549 ?auto_101545 ) ( not ( = ?auto_101546 ?auto_101548 ) ) ( not ( = ?auto_101546 ?auto_101549 ) ) ( not ( = ?auto_101547 ?auto_101548 ) ) ( not ( = ?auto_101547 ?auto_101549 ) ) ( not ( = ?auto_101548 ?auto_101549 ) ) )
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
      ?auto_101809 - LOCATION
      ?auto_101812 - CITY
      ?auto_101810 - TRUCK
      ?auto_101811 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_101809 ?auto_101812 ) ( IN-CITY ?auto_101804 ?auto_101812 ) ( not ( = ?auto_101804 ?auto_101809 ) ) ( OBJ-AT ?auto_101807 ?auto_101804 ) ( not ( = ?auto_101807 ?auto_101805 ) ) ( OBJ-AT ?auto_101805 ?auto_101809 ) ( TRUCK-AT ?auto_101810 ?auto_101811 ) ( IN-CITY ?auto_101811 ?auto_101812 ) ( not ( = ?auto_101804 ?auto_101811 ) ) ( not ( = ?auto_101809 ?auto_101811 ) ) ( OBJ-AT ?auto_101806 ?auto_101804 ) ( OBJ-AT ?auto_101808 ?auto_101804 ) ( not ( = ?auto_101805 ?auto_101806 ) ) ( not ( = ?auto_101805 ?auto_101808 ) ) ( not ( = ?auto_101806 ?auto_101807 ) ) ( not ( = ?auto_101806 ?auto_101808 ) ) ( not ( = ?auto_101807 ?auto_101808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101807 ?auto_101805 ?auto_101804 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_102247 - OBJ
      ?auto_102248 - OBJ
      ?auto_102249 - OBJ
      ?auto_102250 - OBJ
      ?auto_102246 - LOCATION
    )
    :vars
    (
      ?auto_102253 - LOCATION
      ?auto_102254 - CITY
      ?auto_102251 - TRUCK
      ?auto_102252 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_102253 ?auto_102254 ) ( IN-CITY ?auto_102246 ?auto_102254 ) ( not ( = ?auto_102246 ?auto_102253 ) ) ( OBJ-AT ?auto_102249 ?auto_102246 ) ( not ( = ?auto_102249 ?auto_102250 ) ) ( OBJ-AT ?auto_102250 ?auto_102253 ) ( TRUCK-AT ?auto_102251 ?auto_102252 ) ( IN-CITY ?auto_102252 ?auto_102254 ) ( not ( = ?auto_102246 ?auto_102252 ) ) ( not ( = ?auto_102253 ?auto_102252 ) ) ( OBJ-AT ?auto_102247 ?auto_102246 ) ( OBJ-AT ?auto_102248 ?auto_102246 ) ( not ( = ?auto_102247 ?auto_102248 ) ) ( not ( = ?auto_102247 ?auto_102249 ) ) ( not ( = ?auto_102247 ?auto_102250 ) ) ( not ( = ?auto_102248 ?auto_102249 ) ) ( not ( = ?auto_102248 ?auto_102250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102249 ?auto_102250 ?auto_102246 ) )
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
      ?auto_102343 - LOCATION
      ?auto_102344 - CITY
      ?auto_102341 - TRUCK
      ?auto_102342 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_102343 ?auto_102344 ) ( IN-CITY ?auto_102336 ?auto_102344 ) ( not ( = ?auto_102336 ?auto_102343 ) ) ( OBJ-AT ?auto_102339 ?auto_102336 ) ( not ( = ?auto_102339 ?auto_102338 ) ) ( OBJ-AT ?auto_102338 ?auto_102343 ) ( TRUCK-AT ?auto_102341 ?auto_102342 ) ( IN-CITY ?auto_102342 ?auto_102344 ) ( not ( = ?auto_102336 ?auto_102342 ) ) ( not ( = ?auto_102343 ?auto_102342 ) ) ( OBJ-AT ?auto_102337 ?auto_102336 ) ( OBJ-AT ?auto_102340 ?auto_102336 ) ( not ( = ?auto_102337 ?auto_102338 ) ) ( not ( = ?auto_102337 ?auto_102339 ) ) ( not ( = ?auto_102337 ?auto_102340 ) ) ( not ( = ?auto_102338 ?auto_102340 ) ) ( not ( = ?auto_102339 ?auto_102340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102339 ?auto_102338 ?auto_102336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_102949 - OBJ
      ?auto_102950 - OBJ
      ?auto_102951 - OBJ
      ?auto_102948 - LOCATION
    )
    :vars
    (
      ?auto_102952 - LOCATION
      ?auto_102953 - CITY
      ?auto_102954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_102952 ?auto_102953 ) ( IN-CITY ?auto_102948 ?auto_102953 ) ( not ( = ?auto_102948 ?auto_102952 ) ) ( OBJ-AT ?auto_102950 ?auto_102948 ) ( not ( = ?auto_102950 ?auto_102949 ) ) ( OBJ-AT ?auto_102949 ?auto_102952 ) ( TRUCK-AT ?auto_102954 ?auto_102948 ) ( OBJ-AT ?auto_102951 ?auto_102948 ) ( not ( = ?auto_102949 ?auto_102951 ) ) ( not ( = ?auto_102950 ?auto_102951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_102950 ?auto_102949 ?auto_102948 ) )
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
      ?auto_110472 - OBJ
      ?auto_110473 - OBJ
      ?auto_110474 - OBJ
      ?auto_110471 - LOCATION
    )
    :vars
    (
      ?auto_110475 - TRUCK
      ?auto_110476 - LOCATION
      ?auto_110477 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_110475 ?auto_110476 ) ( IN-CITY ?auto_110476 ?auto_110477 ) ( IN-CITY ?auto_110471 ?auto_110477 ) ( not ( = ?auto_110471 ?auto_110476 ) ) ( OBJ-AT ?auto_110473 ?auto_110471 ) ( not ( = ?auto_110473 ?auto_110474 ) ) ( OBJ-AT ?auto_110474 ?auto_110476 ) ( OBJ-AT ?auto_110472 ?auto_110471 ) ( not ( = ?auto_110472 ?auto_110473 ) ) ( not ( = ?auto_110472 ?auto_110474 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_110473 ?auto_110474 ?auto_110471 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_110589 - OBJ
      ?auto_110590 - OBJ
      ?auto_110591 - OBJ
      ?auto_110588 - LOCATION
    )
    :vars
    (
      ?auto_110592 - TRUCK
      ?auto_110593 - LOCATION
      ?auto_110594 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_110592 ?auto_110593 ) ( IN-CITY ?auto_110593 ?auto_110594 ) ( IN-CITY ?auto_110588 ?auto_110594 ) ( not ( = ?auto_110588 ?auto_110593 ) ) ( OBJ-AT ?auto_110591 ?auto_110588 ) ( not ( = ?auto_110591 ?auto_110589 ) ) ( OBJ-AT ?auto_110589 ?auto_110593 ) ( OBJ-AT ?auto_110590 ?auto_110588 ) ( not ( = ?auto_110589 ?auto_110590 ) ) ( not ( = ?auto_110590 ?auto_110591 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_110591 ?auto_110589 ?auto_110588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_113784 - OBJ
      ?auto_113785 - OBJ
      ?auto_113786 - OBJ
      ?auto_113783 - LOCATION
    )
    :vars
    (
      ?auto_113787 - LOCATION
      ?auto_113789 - CITY
      ?auto_113788 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_113787 ?auto_113789 ) ( IN-CITY ?auto_113783 ?auto_113789 ) ( not ( = ?auto_113783 ?auto_113787 ) ) ( OBJ-AT ?auto_113784 ?auto_113783 ) ( not ( = ?auto_113784 ?auto_113785 ) ) ( OBJ-AT ?auto_113785 ?auto_113787 ) ( TRUCK-AT ?auto_113788 ?auto_113783 ) ( OBJ-AT ?auto_113786 ?auto_113783 ) ( not ( = ?auto_113784 ?auto_113786 ) ) ( not ( = ?auto_113785 ?auto_113786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_113784 ?auto_113785 ?auto_113783 ) )
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
      ?auto_115545 - LOCATION
      ?auto_115547 - CITY
      ?auto_115546 - TRUCK
      ?auto_115548 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115545 ?auto_115547 ) ( IN-CITY ?auto_115541 ?auto_115547 ) ( not ( = ?auto_115541 ?auto_115545 ) ) ( OBJ-AT ?auto_115543 ?auto_115541 ) ( not ( = ?auto_115543 ?auto_115544 ) ) ( OBJ-AT ?auto_115544 ?auto_115545 ) ( TRUCK-AT ?auto_115546 ?auto_115548 ) ( IN-CITY ?auto_115548 ?auto_115547 ) ( not ( = ?auto_115541 ?auto_115548 ) ) ( not ( = ?auto_115545 ?auto_115548 ) ) ( OBJ-AT ?auto_115542 ?auto_115541 ) ( not ( = ?auto_115542 ?auto_115543 ) ) ( not ( = ?auto_115542 ?auto_115544 ) ) )
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
      ?auto_115565 - LOCATION
      ?auto_115567 - CITY
      ?auto_115566 - TRUCK
      ?auto_115568 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115565 ?auto_115567 ) ( IN-CITY ?auto_115561 ?auto_115567 ) ( not ( = ?auto_115561 ?auto_115565 ) ) ( OBJ-AT ?auto_115562 ?auto_115561 ) ( not ( = ?auto_115562 ?auto_115563 ) ) ( OBJ-AT ?auto_115563 ?auto_115565 ) ( TRUCK-AT ?auto_115566 ?auto_115568 ) ( IN-CITY ?auto_115568 ?auto_115567 ) ( not ( = ?auto_115561 ?auto_115568 ) ) ( not ( = ?auto_115565 ?auto_115568 ) ) ( OBJ-AT ?auto_115564 ?auto_115561 ) ( not ( = ?auto_115562 ?auto_115564 ) ) ( not ( = ?auto_115563 ?auto_115564 ) ) )
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
      ?auto_115597 - LOCATION
      ?auto_115600 - CITY
      ?auto_115599 - OBJ
      ?auto_115598 - TRUCK
      ?auto_115601 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115597 ?auto_115600 ) ( IN-CITY ?auto_115593 ?auto_115600 ) ( not ( = ?auto_115593 ?auto_115597 ) ) ( OBJ-AT ?auto_115599 ?auto_115593 ) ( not ( = ?auto_115599 ?auto_115596 ) ) ( OBJ-AT ?auto_115596 ?auto_115597 ) ( TRUCK-AT ?auto_115598 ?auto_115601 ) ( IN-CITY ?auto_115601 ?auto_115600 ) ( not ( = ?auto_115593 ?auto_115601 ) ) ( not ( = ?auto_115597 ?auto_115601 ) ) ( OBJ-AT ?auto_115594 ?auto_115593 ) ( OBJ-AT ?auto_115595 ?auto_115593 ) ( not ( = ?auto_115594 ?auto_115595 ) ) ( not ( = ?auto_115594 ?auto_115596 ) ) ( not ( = ?auto_115594 ?auto_115599 ) ) ( not ( = ?auto_115595 ?auto_115596 ) ) ( not ( = ?auto_115595 ?auto_115599 ) ) )
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
      ?auto_115619 - LOCATION
      ?auto_115622 - CITY
      ?auto_115621 - OBJ
      ?auto_115620 - TRUCK
      ?auto_115623 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115619 ?auto_115622 ) ( IN-CITY ?auto_115615 ?auto_115622 ) ( not ( = ?auto_115615 ?auto_115619 ) ) ( OBJ-AT ?auto_115621 ?auto_115615 ) ( not ( = ?auto_115621 ?auto_115617 ) ) ( OBJ-AT ?auto_115617 ?auto_115619 ) ( TRUCK-AT ?auto_115620 ?auto_115623 ) ( IN-CITY ?auto_115623 ?auto_115622 ) ( not ( = ?auto_115615 ?auto_115623 ) ) ( not ( = ?auto_115619 ?auto_115623 ) ) ( OBJ-AT ?auto_115616 ?auto_115615 ) ( OBJ-AT ?auto_115618 ?auto_115615 ) ( not ( = ?auto_115616 ?auto_115617 ) ) ( not ( = ?auto_115616 ?auto_115618 ) ) ( not ( = ?auto_115616 ?auto_115621 ) ) ( not ( = ?auto_115617 ?auto_115618 ) ) ( not ( = ?auto_115618 ?auto_115621 ) ) )
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
      ?auto_115707 - LOCATION
      ?auto_115709 - CITY
      ?auto_115708 - TRUCK
      ?auto_115710 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115707 ?auto_115709 ) ( IN-CITY ?auto_115703 ?auto_115709 ) ( not ( = ?auto_115703 ?auto_115707 ) ) ( OBJ-AT ?auto_115705 ?auto_115703 ) ( not ( = ?auto_115705 ?auto_115704 ) ) ( OBJ-AT ?auto_115704 ?auto_115707 ) ( TRUCK-AT ?auto_115708 ?auto_115710 ) ( IN-CITY ?auto_115710 ?auto_115709 ) ( not ( = ?auto_115703 ?auto_115710 ) ) ( not ( = ?auto_115707 ?auto_115710 ) ) ( OBJ-AT ?auto_115706 ?auto_115703 ) ( not ( = ?auto_115704 ?auto_115706 ) ) ( not ( = ?auto_115705 ?auto_115706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115705 ?auto_115704 ?auto_115703 ) )
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
      ?auto_115739 - LOCATION
      ?auto_115742 - CITY
      ?auto_115741 - OBJ
      ?auto_115740 - TRUCK
      ?auto_115743 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115739 ?auto_115742 ) ( IN-CITY ?auto_115735 ?auto_115742 ) ( not ( = ?auto_115735 ?auto_115739 ) ) ( OBJ-AT ?auto_115741 ?auto_115735 ) ( not ( = ?auto_115741 ?auto_115736 ) ) ( OBJ-AT ?auto_115736 ?auto_115739 ) ( TRUCK-AT ?auto_115740 ?auto_115743 ) ( IN-CITY ?auto_115743 ?auto_115742 ) ( not ( = ?auto_115735 ?auto_115743 ) ) ( not ( = ?auto_115739 ?auto_115743 ) ) ( OBJ-AT ?auto_115737 ?auto_115735 ) ( OBJ-AT ?auto_115738 ?auto_115735 ) ( not ( = ?auto_115736 ?auto_115737 ) ) ( not ( = ?auto_115736 ?auto_115738 ) ) ( not ( = ?auto_115737 ?auto_115738 ) ) ( not ( = ?auto_115737 ?auto_115741 ) ) ( not ( = ?auto_115738 ?auto_115741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115741 ?auto_115736 ?auto_115735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115842 - OBJ
      ?auto_115843 - OBJ
      ?auto_115844 - OBJ
      ?auto_115845 - OBJ
      ?auto_115841 - LOCATION
    )
    :vars
    (
      ?auto_115846 - LOCATION
      ?auto_115848 - CITY
      ?auto_115847 - TRUCK
      ?auto_115849 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115846 ?auto_115848 ) ( IN-CITY ?auto_115841 ?auto_115848 ) ( not ( = ?auto_115841 ?auto_115846 ) ) ( OBJ-AT ?auto_115843 ?auto_115841 ) ( not ( = ?auto_115843 ?auto_115845 ) ) ( OBJ-AT ?auto_115845 ?auto_115846 ) ( TRUCK-AT ?auto_115847 ?auto_115849 ) ( IN-CITY ?auto_115849 ?auto_115848 ) ( not ( = ?auto_115841 ?auto_115849 ) ) ( not ( = ?auto_115846 ?auto_115849 ) ) ( OBJ-AT ?auto_115842 ?auto_115841 ) ( OBJ-AT ?auto_115844 ?auto_115841 ) ( not ( = ?auto_115842 ?auto_115843 ) ) ( not ( = ?auto_115842 ?auto_115844 ) ) ( not ( = ?auto_115842 ?auto_115845 ) ) ( not ( = ?auto_115843 ?auto_115844 ) ) ( not ( = ?auto_115844 ?auto_115845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115843 ?auto_115845 ?auto_115841 ) )
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
      ?auto_115873 - LOCATION
      ?auto_115875 - CITY
      ?auto_115874 - TRUCK
      ?auto_115876 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115873 ?auto_115875 ) ( IN-CITY ?auto_115868 ?auto_115875 ) ( not ( = ?auto_115868 ?auto_115873 ) ) ( OBJ-AT ?auto_115870 ?auto_115868 ) ( not ( = ?auto_115870 ?auto_115871 ) ) ( OBJ-AT ?auto_115871 ?auto_115873 ) ( TRUCK-AT ?auto_115874 ?auto_115876 ) ( IN-CITY ?auto_115876 ?auto_115875 ) ( not ( = ?auto_115868 ?auto_115876 ) ) ( not ( = ?auto_115873 ?auto_115876 ) ) ( OBJ-AT ?auto_115869 ?auto_115868 ) ( OBJ-AT ?auto_115872 ?auto_115868 ) ( not ( = ?auto_115869 ?auto_115870 ) ) ( not ( = ?auto_115869 ?auto_115871 ) ) ( not ( = ?auto_115869 ?auto_115872 ) ) ( not ( = ?auto_115870 ?auto_115872 ) ) ( not ( = ?auto_115871 ?auto_115872 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115870 ?auto_115871 ?auto_115868 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_115932 - OBJ
      ?auto_115933 - OBJ
      ?auto_115934 - OBJ
      ?auto_115935 - OBJ
      ?auto_115931 - LOCATION
    )
    :vars
    (
      ?auto_115936 - LOCATION
      ?auto_115938 - CITY
      ?auto_115937 - TRUCK
      ?auto_115939 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_115936 ?auto_115938 ) ( IN-CITY ?auto_115931 ?auto_115938 ) ( not ( = ?auto_115931 ?auto_115936 ) ) ( OBJ-AT ?auto_115932 ?auto_115931 ) ( not ( = ?auto_115932 ?auto_115934 ) ) ( OBJ-AT ?auto_115934 ?auto_115936 ) ( TRUCK-AT ?auto_115937 ?auto_115939 ) ( IN-CITY ?auto_115939 ?auto_115938 ) ( not ( = ?auto_115931 ?auto_115939 ) ) ( not ( = ?auto_115936 ?auto_115939 ) ) ( OBJ-AT ?auto_115933 ?auto_115931 ) ( OBJ-AT ?auto_115935 ?auto_115931 ) ( not ( = ?auto_115932 ?auto_115933 ) ) ( not ( = ?auto_115932 ?auto_115935 ) ) ( not ( = ?auto_115933 ?auto_115934 ) ) ( not ( = ?auto_115933 ?auto_115935 ) ) ( not ( = ?auto_115934 ?auto_115935 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_115932 ?auto_115934 ?auto_115931 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_116058 - OBJ
      ?auto_116059 - OBJ
      ?auto_116060 - OBJ
      ?auto_116061 - OBJ
      ?auto_116057 - LOCATION
    )
    :vars
    (
      ?auto_116062 - LOCATION
      ?auto_116064 - CITY
      ?auto_116063 - TRUCK
      ?auto_116065 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116062 ?auto_116064 ) ( IN-CITY ?auto_116057 ?auto_116064 ) ( not ( = ?auto_116057 ?auto_116062 ) ) ( OBJ-AT ?auto_116061 ?auto_116057 ) ( not ( = ?auto_116061 ?auto_116059 ) ) ( OBJ-AT ?auto_116059 ?auto_116062 ) ( TRUCK-AT ?auto_116063 ?auto_116065 ) ( IN-CITY ?auto_116065 ?auto_116064 ) ( not ( = ?auto_116057 ?auto_116065 ) ) ( not ( = ?auto_116062 ?auto_116065 ) ) ( OBJ-AT ?auto_116058 ?auto_116057 ) ( OBJ-AT ?auto_116060 ?auto_116057 ) ( not ( = ?auto_116058 ?auto_116059 ) ) ( not ( = ?auto_116058 ?auto_116060 ) ) ( not ( = ?auto_116058 ?auto_116061 ) ) ( not ( = ?auto_116059 ?auto_116060 ) ) ( not ( = ?auto_116060 ?auto_116061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116061 ?auto_116059 ?auto_116057 ) )
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
      ?auto_116242 - LOCATION
      ?auto_116245 - CITY
      ?auto_116244 - OBJ
      ?auto_116243 - TRUCK
      ?auto_116246 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116242 ?auto_116245 ) ( IN-CITY ?auto_116237 ?auto_116245 ) ( not ( = ?auto_116237 ?auto_116242 ) ) ( OBJ-AT ?auto_116244 ?auto_116237 ) ( not ( = ?auto_116244 ?auto_116241 ) ) ( OBJ-AT ?auto_116241 ?auto_116242 ) ( TRUCK-AT ?auto_116243 ?auto_116246 ) ( IN-CITY ?auto_116246 ?auto_116245 ) ( not ( = ?auto_116237 ?auto_116246 ) ) ( not ( = ?auto_116242 ?auto_116246 ) ) ( OBJ-AT ?auto_116238 ?auto_116237 ) ( OBJ-AT ?auto_116239 ?auto_116237 ) ( OBJ-AT ?auto_116240 ?auto_116237 ) ( not ( = ?auto_116238 ?auto_116239 ) ) ( not ( = ?auto_116238 ?auto_116240 ) ) ( not ( = ?auto_116238 ?auto_116241 ) ) ( not ( = ?auto_116238 ?auto_116244 ) ) ( not ( = ?auto_116239 ?auto_116240 ) ) ( not ( = ?auto_116239 ?auto_116241 ) ) ( not ( = ?auto_116239 ?auto_116244 ) ) ( not ( = ?auto_116240 ?auto_116241 ) ) ( not ( = ?auto_116240 ?auto_116244 ) ) )
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
      ?auto_116271 - LOCATION
      ?auto_116274 - CITY
      ?auto_116273 - OBJ
      ?auto_116272 - TRUCK
      ?auto_116275 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116271 ?auto_116274 ) ( IN-CITY ?auto_116266 ?auto_116274 ) ( not ( = ?auto_116266 ?auto_116271 ) ) ( OBJ-AT ?auto_116273 ?auto_116266 ) ( not ( = ?auto_116273 ?auto_116269 ) ) ( OBJ-AT ?auto_116269 ?auto_116271 ) ( TRUCK-AT ?auto_116272 ?auto_116275 ) ( IN-CITY ?auto_116275 ?auto_116274 ) ( not ( = ?auto_116266 ?auto_116275 ) ) ( not ( = ?auto_116271 ?auto_116275 ) ) ( OBJ-AT ?auto_116267 ?auto_116266 ) ( OBJ-AT ?auto_116268 ?auto_116266 ) ( OBJ-AT ?auto_116270 ?auto_116266 ) ( not ( = ?auto_116267 ?auto_116268 ) ) ( not ( = ?auto_116267 ?auto_116269 ) ) ( not ( = ?auto_116267 ?auto_116270 ) ) ( not ( = ?auto_116267 ?auto_116273 ) ) ( not ( = ?auto_116268 ?auto_116269 ) ) ( not ( = ?auto_116268 ?auto_116270 ) ) ( not ( = ?auto_116268 ?auto_116273 ) ) ( not ( = ?auto_116269 ?auto_116270 ) ) ( not ( = ?auto_116270 ?auto_116273 ) ) )
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
      ?auto_116414 - LOCATION
      ?auto_116417 - CITY
      ?auto_116416 - OBJ
      ?auto_116415 - TRUCK
      ?auto_116418 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116414 ?auto_116417 ) ( IN-CITY ?auto_116409 ?auto_116417 ) ( not ( = ?auto_116409 ?auto_116414 ) ) ( OBJ-AT ?auto_116416 ?auto_116409 ) ( not ( = ?auto_116416 ?auto_116411 ) ) ( OBJ-AT ?auto_116411 ?auto_116414 ) ( TRUCK-AT ?auto_116415 ?auto_116418 ) ( IN-CITY ?auto_116418 ?auto_116417 ) ( not ( = ?auto_116409 ?auto_116418 ) ) ( not ( = ?auto_116414 ?auto_116418 ) ) ( OBJ-AT ?auto_116410 ?auto_116409 ) ( OBJ-AT ?auto_116412 ?auto_116409 ) ( OBJ-AT ?auto_116413 ?auto_116409 ) ( not ( = ?auto_116410 ?auto_116411 ) ) ( not ( = ?auto_116410 ?auto_116412 ) ) ( not ( = ?auto_116410 ?auto_116413 ) ) ( not ( = ?auto_116410 ?auto_116416 ) ) ( not ( = ?auto_116411 ?auto_116412 ) ) ( not ( = ?auto_116411 ?auto_116413 ) ) ( not ( = ?auto_116412 ?auto_116413 ) ) ( not ( = ?auto_116412 ?auto_116416 ) ) ( not ( = ?auto_116413 ?auto_116416 ) ) )
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
      ?auto_116910 - LOCATION
      ?auto_116912 - CITY
      ?auto_116911 - TRUCK
      ?auto_116913 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116910 ?auto_116912 ) ( IN-CITY ?auto_116905 ?auto_116912 ) ( not ( = ?auto_116905 ?auto_116910 ) ) ( OBJ-AT ?auto_116909 ?auto_116905 ) ( not ( = ?auto_116909 ?auto_116906 ) ) ( OBJ-AT ?auto_116906 ?auto_116910 ) ( TRUCK-AT ?auto_116911 ?auto_116913 ) ( IN-CITY ?auto_116913 ?auto_116912 ) ( not ( = ?auto_116905 ?auto_116913 ) ) ( not ( = ?auto_116910 ?auto_116913 ) ) ( OBJ-AT ?auto_116907 ?auto_116905 ) ( OBJ-AT ?auto_116908 ?auto_116905 ) ( not ( = ?auto_116906 ?auto_116907 ) ) ( not ( = ?auto_116906 ?auto_116908 ) ) ( not ( = ?auto_116907 ?auto_116908 ) ) ( not ( = ?auto_116907 ?auto_116909 ) ) ( not ( = ?auto_116908 ?auto_116909 ) ) )
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
      ?auto_116919 - LOCATION
      ?auto_116921 - CITY
      ?auto_116920 - TRUCK
      ?auto_116922 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_116919 ?auto_116921 ) ( IN-CITY ?auto_116914 ?auto_116921 ) ( not ( = ?auto_116914 ?auto_116919 ) ) ( OBJ-AT ?auto_116916 ?auto_116914 ) ( not ( = ?auto_116916 ?auto_116915 ) ) ( OBJ-AT ?auto_116915 ?auto_116919 ) ( TRUCK-AT ?auto_116920 ?auto_116922 ) ( IN-CITY ?auto_116922 ?auto_116921 ) ( not ( = ?auto_116914 ?auto_116922 ) ) ( not ( = ?auto_116919 ?auto_116922 ) ) ( OBJ-AT ?auto_116917 ?auto_116914 ) ( OBJ-AT ?auto_116918 ?auto_116914 ) ( not ( = ?auto_116915 ?auto_116917 ) ) ( not ( = ?auto_116915 ?auto_116918 ) ) ( not ( = ?auto_116916 ?auto_116917 ) ) ( not ( = ?auto_116916 ?auto_116918 ) ) ( not ( = ?auto_116917 ?auto_116918 ) ) )
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
      ?auto_117063 - LOCATION
      ?auto_117066 - CITY
      ?auto_117065 - OBJ
      ?auto_117064 - TRUCK
      ?auto_117067 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_117063 ?auto_117066 ) ( IN-CITY ?auto_117058 ?auto_117066 ) ( not ( = ?auto_117058 ?auto_117063 ) ) ( OBJ-AT ?auto_117065 ?auto_117058 ) ( not ( = ?auto_117065 ?auto_117059 ) ) ( OBJ-AT ?auto_117059 ?auto_117063 ) ( TRUCK-AT ?auto_117064 ?auto_117067 ) ( IN-CITY ?auto_117067 ?auto_117066 ) ( not ( = ?auto_117058 ?auto_117067 ) ) ( not ( = ?auto_117063 ?auto_117067 ) ) ( OBJ-AT ?auto_117060 ?auto_117058 ) ( OBJ-AT ?auto_117061 ?auto_117058 ) ( OBJ-AT ?auto_117062 ?auto_117058 ) ( not ( = ?auto_117059 ?auto_117060 ) ) ( not ( = ?auto_117059 ?auto_117061 ) ) ( not ( = ?auto_117059 ?auto_117062 ) ) ( not ( = ?auto_117060 ?auto_117061 ) ) ( not ( = ?auto_117060 ?auto_117062 ) ) ( not ( = ?auto_117060 ?auto_117065 ) ) ( not ( = ?auto_117061 ?auto_117062 ) ) ( not ( = ?auto_117061 ?auto_117065 ) ) ( not ( = ?auto_117062 ?auto_117065 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_117065 ?auto_117059 ?auto_117058 ) )
  )

)

