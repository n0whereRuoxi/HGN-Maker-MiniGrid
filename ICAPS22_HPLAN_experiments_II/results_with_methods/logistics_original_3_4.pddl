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
      ?auto_13910 - OBJ
      ?auto_13909 - LOCATION
    )
    :vars
    (
      ?auto_13911 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13911 ?auto_13909 ) ( IN-TRUCK ?auto_13910 ?auto_13911 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_13910 ?auto_13911 ?auto_13909 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13922 - OBJ
      ?auto_13921 - LOCATION
    )
    :vars
    (
      ?auto_13923 - TRUCK
      ?auto_13924 - LOCATION
      ?auto_13925 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13922 ?auto_13923 ) ( TRUCK-AT ?auto_13923 ?auto_13924 ) ( IN-CITY ?auto_13924 ?auto_13925 ) ( IN-CITY ?auto_13921 ?auto_13925 ) ( not ( = ?auto_13921 ?auto_13924 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13923 ?auto_13924 ?auto_13921 ?auto_13925 )
      ( DELIVER-1PKG ?auto_13922 ?auto_13921 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13940 - OBJ
      ?auto_13939 - LOCATION
    )
    :vars
    (
      ?auto_13942 - TRUCK
      ?auto_13941 - LOCATION
      ?auto_13943 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13942 ?auto_13941 ) ( IN-CITY ?auto_13941 ?auto_13943 ) ( IN-CITY ?auto_13939 ?auto_13943 ) ( not ( = ?auto_13939 ?auto_13941 ) ) ( OBJ-AT ?auto_13940 ?auto_13941 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_13940 ?auto_13942 ?auto_13941 )
      ( DELIVER-1PKG ?auto_13940 ?auto_13939 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13958 - OBJ
      ?auto_13957 - LOCATION
    )
    :vars
    (
      ?auto_13959 - LOCATION
      ?auto_13960 - CITY
      ?auto_13961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13959 ?auto_13960 ) ( IN-CITY ?auto_13957 ?auto_13960 ) ( not ( = ?auto_13957 ?auto_13959 ) ) ( OBJ-AT ?auto_13958 ?auto_13959 ) ( TRUCK-AT ?auto_13961 ?auto_13957 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13961 ?auto_13957 ?auto_13959 ?auto_13960 )
      ( DELIVER-1PKG ?auto_13958 ?auto_13957 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14015 - OBJ
      ?auto_14014 - LOCATION
    )
    :vars
    (
      ?auto_14016 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14016 ?auto_14014 ) ( IN-TRUCK ?auto_14015 ?auto_14016 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_14015 ?auto_14016 ?auto_14014 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14018 - OBJ
      ?auto_14019 - OBJ
      ?auto_14017 - LOCATION
    )
    :vars
    (
      ?auto_14020 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14020 ?auto_14017 ) ( IN-TRUCK ?auto_14019 ?auto_14020 ) ( OBJ-AT ?auto_14018 ?auto_14017 ) ( not ( = ?auto_14018 ?auto_14019 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14019 ?auto_14017 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14022 - OBJ
      ?auto_14023 - OBJ
      ?auto_14021 - LOCATION
    )
    :vars
    (
      ?auto_14024 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14024 ?auto_14021 ) ( IN-TRUCK ?auto_14022 ?auto_14024 ) ( OBJ-AT ?auto_14023 ?auto_14021 ) ( not ( = ?auto_14022 ?auto_14023 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14022 ?auto_14021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14030 - OBJ
      ?auto_14031 - OBJ
      ?auto_14032 - OBJ
      ?auto_14029 - LOCATION
    )
    :vars
    (
      ?auto_14033 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14033 ?auto_14029 ) ( IN-TRUCK ?auto_14032 ?auto_14033 ) ( OBJ-AT ?auto_14030 ?auto_14029 ) ( OBJ-AT ?auto_14031 ?auto_14029 ) ( not ( = ?auto_14030 ?auto_14031 ) ) ( not ( = ?auto_14030 ?auto_14032 ) ) ( not ( = ?auto_14031 ?auto_14032 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14032 ?auto_14029 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14035 - OBJ
      ?auto_14036 - OBJ
      ?auto_14037 - OBJ
      ?auto_14034 - LOCATION
    )
    :vars
    (
      ?auto_14038 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14038 ?auto_14034 ) ( IN-TRUCK ?auto_14036 ?auto_14038 ) ( OBJ-AT ?auto_14035 ?auto_14034 ) ( OBJ-AT ?auto_14037 ?auto_14034 ) ( not ( = ?auto_14035 ?auto_14036 ) ) ( not ( = ?auto_14035 ?auto_14037 ) ) ( not ( = ?auto_14036 ?auto_14037 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14036 ?auto_14034 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14045 - OBJ
      ?auto_14046 - OBJ
      ?auto_14047 - OBJ
      ?auto_14044 - LOCATION
    )
    :vars
    (
      ?auto_14048 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14048 ?auto_14044 ) ( IN-TRUCK ?auto_14045 ?auto_14048 ) ( OBJ-AT ?auto_14046 ?auto_14044 ) ( OBJ-AT ?auto_14047 ?auto_14044 ) ( not ( = ?auto_14045 ?auto_14046 ) ) ( not ( = ?auto_14045 ?auto_14047 ) ) ( not ( = ?auto_14046 ?auto_14047 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14045 ?auto_14044 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14065 - OBJ
      ?auto_14064 - LOCATION
    )
    :vars
    (
      ?auto_14066 - TRUCK
      ?auto_14067 - LOCATION
      ?auto_14068 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14065 ?auto_14066 ) ( TRUCK-AT ?auto_14066 ?auto_14067 ) ( IN-CITY ?auto_14067 ?auto_14068 ) ( IN-CITY ?auto_14064 ?auto_14068 ) ( not ( = ?auto_14064 ?auto_14067 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14066 ?auto_14067 ?auto_14064 ?auto_14068 )
      ( DELIVER-1PKG ?auto_14065 ?auto_14064 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14070 - OBJ
      ?auto_14071 - OBJ
      ?auto_14069 - LOCATION
    )
    :vars
    (
      ?auto_14073 - TRUCK
      ?auto_14072 - LOCATION
      ?auto_14074 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14071 ?auto_14073 ) ( TRUCK-AT ?auto_14073 ?auto_14072 ) ( IN-CITY ?auto_14072 ?auto_14074 ) ( IN-CITY ?auto_14069 ?auto_14074 ) ( not ( = ?auto_14069 ?auto_14072 ) ) ( OBJ-AT ?auto_14070 ?auto_14069 ) ( not ( = ?auto_14070 ?auto_14071 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14071 ?auto_14069 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14076 - OBJ
      ?auto_14077 - OBJ
      ?auto_14075 - LOCATION
    )
    :vars
    (
      ?auto_14080 - TRUCK
      ?auto_14079 - LOCATION
      ?auto_14078 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14076 ?auto_14080 ) ( TRUCK-AT ?auto_14080 ?auto_14079 ) ( IN-CITY ?auto_14079 ?auto_14078 ) ( IN-CITY ?auto_14075 ?auto_14078 ) ( not ( = ?auto_14075 ?auto_14079 ) ) ( OBJ-AT ?auto_14077 ?auto_14075 ) ( not ( = ?auto_14077 ?auto_14076 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14077 ?auto_14076 ?auto_14075 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14089 - OBJ
      ?auto_14090 - OBJ
      ?auto_14091 - OBJ
      ?auto_14088 - LOCATION
    )
    :vars
    (
      ?auto_14094 - TRUCK
      ?auto_14093 - LOCATION
      ?auto_14092 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14091 ?auto_14094 ) ( TRUCK-AT ?auto_14094 ?auto_14093 ) ( IN-CITY ?auto_14093 ?auto_14092 ) ( IN-CITY ?auto_14088 ?auto_14092 ) ( not ( = ?auto_14088 ?auto_14093 ) ) ( OBJ-AT ?auto_14089 ?auto_14088 ) ( not ( = ?auto_14089 ?auto_14091 ) ) ( OBJ-AT ?auto_14090 ?auto_14088 ) ( not ( = ?auto_14089 ?auto_14090 ) ) ( not ( = ?auto_14090 ?auto_14091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14089 ?auto_14091 ?auto_14088 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14096 - OBJ
      ?auto_14097 - OBJ
      ?auto_14098 - OBJ
      ?auto_14095 - LOCATION
    )
    :vars
    (
      ?auto_14101 - TRUCK
      ?auto_14100 - LOCATION
      ?auto_14099 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14097 ?auto_14101 ) ( TRUCK-AT ?auto_14101 ?auto_14100 ) ( IN-CITY ?auto_14100 ?auto_14099 ) ( IN-CITY ?auto_14095 ?auto_14099 ) ( not ( = ?auto_14095 ?auto_14100 ) ) ( OBJ-AT ?auto_14098 ?auto_14095 ) ( not ( = ?auto_14098 ?auto_14097 ) ) ( OBJ-AT ?auto_14096 ?auto_14095 ) ( not ( = ?auto_14096 ?auto_14097 ) ) ( not ( = ?auto_14096 ?auto_14098 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14098 ?auto_14097 ?auto_14095 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14110 - OBJ
      ?auto_14111 - OBJ
      ?auto_14112 - OBJ
      ?auto_14109 - LOCATION
    )
    :vars
    (
      ?auto_14115 - TRUCK
      ?auto_14114 - LOCATION
      ?auto_14113 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14110 ?auto_14115 ) ( TRUCK-AT ?auto_14115 ?auto_14114 ) ( IN-CITY ?auto_14114 ?auto_14113 ) ( IN-CITY ?auto_14109 ?auto_14113 ) ( not ( = ?auto_14109 ?auto_14114 ) ) ( OBJ-AT ?auto_14111 ?auto_14109 ) ( not ( = ?auto_14111 ?auto_14110 ) ) ( OBJ-AT ?auto_14112 ?auto_14109 ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14111 ?auto_14112 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14111 ?auto_14110 ?auto_14109 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14139 - OBJ
      ?auto_14138 - LOCATION
    )
    :vars
    (
      ?auto_14143 - TRUCK
      ?auto_14141 - LOCATION
      ?auto_14140 - CITY
      ?auto_14142 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14143 ?auto_14141 ) ( IN-CITY ?auto_14141 ?auto_14140 ) ( IN-CITY ?auto_14138 ?auto_14140 ) ( not ( = ?auto_14138 ?auto_14141 ) ) ( OBJ-AT ?auto_14142 ?auto_14138 ) ( not ( = ?auto_14142 ?auto_14139 ) ) ( OBJ-AT ?auto_14139 ?auto_14141 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14139 ?auto_14143 ?auto_14141 )
      ( DELIVER-2PKG ?auto_14142 ?auto_14139 ?auto_14138 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14145 - OBJ
      ?auto_14146 - OBJ
      ?auto_14144 - LOCATION
    )
    :vars
    (
      ?auto_14149 - TRUCK
      ?auto_14148 - LOCATION
      ?auto_14147 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14149 ?auto_14148 ) ( IN-CITY ?auto_14148 ?auto_14147 ) ( IN-CITY ?auto_14144 ?auto_14147 ) ( not ( = ?auto_14144 ?auto_14148 ) ) ( OBJ-AT ?auto_14145 ?auto_14144 ) ( not ( = ?auto_14145 ?auto_14146 ) ) ( OBJ-AT ?auto_14146 ?auto_14148 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14146 ?auto_14144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14151 - OBJ
      ?auto_14152 - OBJ
      ?auto_14150 - LOCATION
    )
    :vars
    (
      ?auto_14153 - TRUCK
      ?auto_14154 - LOCATION
      ?auto_14155 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14153 ?auto_14154 ) ( IN-CITY ?auto_14154 ?auto_14155 ) ( IN-CITY ?auto_14150 ?auto_14155 ) ( not ( = ?auto_14150 ?auto_14154 ) ) ( OBJ-AT ?auto_14152 ?auto_14150 ) ( not ( = ?auto_14152 ?auto_14151 ) ) ( OBJ-AT ?auto_14151 ?auto_14154 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14152 ?auto_14151 ?auto_14150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14164 - OBJ
      ?auto_14165 - OBJ
      ?auto_14166 - OBJ
      ?auto_14163 - LOCATION
    )
    :vars
    (
      ?auto_14167 - TRUCK
      ?auto_14168 - LOCATION
      ?auto_14169 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14167 ?auto_14168 ) ( IN-CITY ?auto_14168 ?auto_14169 ) ( IN-CITY ?auto_14163 ?auto_14169 ) ( not ( = ?auto_14163 ?auto_14168 ) ) ( OBJ-AT ?auto_14165 ?auto_14163 ) ( not ( = ?auto_14165 ?auto_14166 ) ) ( OBJ-AT ?auto_14166 ?auto_14168 ) ( OBJ-AT ?auto_14164 ?auto_14163 ) ( not ( = ?auto_14164 ?auto_14165 ) ) ( not ( = ?auto_14164 ?auto_14166 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14165 ?auto_14166 ?auto_14163 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14171 - OBJ
      ?auto_14172 - OBJ
      ?auto_14173 - OBJ
      ?auto_14170 - LOCATION
    )
    :vars
    (
      ?auto_14174 - TRUCK
      ?auto_14175 - LOCATION
      ?auto_14176 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14174 ?auto_14175 ) ( IN-CITY ?auto_14175 ?auto_14176 ) ( IN-CITY ?auto_14170 ?auto_14176 ) ( not ( = ?auto_14170 ?auto_14175 ) ) ( OBJ-AT ?auto_14173 ?auto_14170 ) ( not ( = ?auto_14173 ?auto_14172 ) ) ( OBJ-AT ?auto_14172 ?auto_14175 ) ( OBJ-AT ?auto_14171 ?auto_14170 ) ( not ( = ?auto_14171 ?auto_14172 ) ) ( not ( = ?auto_14171 ?auto_14173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14173 ?auto_14172 ?auto_14170 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14185 - OBJ
      ?auto_14186 - OBJ
      ?auto_14187 - OBJ
      ?auto_14184 - LOCATION
    )
    :vars
    (
      ?auto_14188 - TRUCK
      ?auto_14189 - LOCATION
      ?auto_14190 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14188 ?auto_14189 ) ( IN-CITY ?auto_14189 ?auto_14190 ) ( IN-CITY ?auto_14184 ?auto_14190 ) ( not ( = ?auto_14184 ?auto_14189 ) ) ( OBJ-AT ?auto_14187 ?auto_14184 ) ( not ( = ?auto_14187 ?auto_14185 ) ) ( OBJ-AT ?auto_14185 ?auto_14189 ) ( OBJ-AT ?auto_14186 ?auto_14184 ) ( not ( = ?auto_14185 ?auto_14186 ) ) ( not ( = ?auto_14186 ?auto_14187 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14187 ?auto_14185 ?auto_14184 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14214 - OBJ
      ?auto_14213 - LOCATION
    )
    :vars
    (
      ?auto_14216 - LOCATION
      ?auto_14218 - CITY
      ?auto_14217 - OBJ
      ?auto_14215 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14216 ?auto_14218 ) ( IN-CITY ?auto_14213 ?auto_14218 ) ( not ( = ?auto_14213 ?auto_14216 ) ) ( OBJ-AT ?auto_14217 ?auto_14213 ) ( not ( = ?auto_14217 ?auto_14214 ) ) ( OBJ-AT ?auto_14214 ?auto_14216 ) ( TRUCK-AT ?auto_14215 ?auto_14213 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14215 ?auto_14213 ?auto_14216 ?auto_14218 )
      ( DELIVER-2PKG ?auto_14217 ?auto_14214 ?auto_14213 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14220 - OBJ
      ?auto_14221 - OBJ
      ?auto_14219 - LOCATION
    )
    :vars
    (
      ?auto_14223 - LOCATION
      ?auto_14222 - CITY
      ?auto_14224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14223 ?auto_14222 ) ( IN-CITY ?auto_14219 ?auto_14222 ) ( not ( = ?auto_14219 ?auto_14223 ) ) ( OBJ-AT ?auto_14220 ?auto_14219 ) ( not ( = ?auto_14220 ?auto_14221 ) ) ( OBJ-AT ?auto_14221 ?auto_14223 ) ( TRUCK-AT ?auto_14224 ?auto_14219 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14221 ?auto_14219 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14226 - OBJ
      ?auto_14227 - OBJ
      ?auto_14225 - LOCATION
    )
    :vars
    (
      ?auto_14230 - LOCATION
      ?auto_14228 - CITY
      ?auto_14229 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14230 ?auto_14228 ) ( IN-CITY ?auto_14225 ?auto_14228 ) ( not ( = ?auto_14225 ?auto_14230 ) ) ( OBJ-AT ?auto_14227 ?auto_14225 ) ( not ( = ?auto_14227 ?auto_14226 ) ) ( OBJ-AT ?auto_14226 ?auto_14230 ) ( TRUCK-AT ?auto_14229 ?auto_14225 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14227 ?auto_14226 ?auto_14225 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14239 - OBJ
      ?auto_14240 - OBJ
      ?auto_14241 - OBJ
      ?auto_14238 - LOCATION
    )
    :vars
    (
      ?auto_14244 - LOCATION
      ?auto_14242 - CITY
      ?auto_14243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14244 ?auto_14242 ) ( IN-CITY ?auto_14238 ?auto_14242 ) ( not ( = ?auto_14238 ?auto_14244 ) ) ( OBJ-AT ?auto_14240 ?auto_14238 ) ( not ( = ?auto_14240 ?auto_14241 ) ) ( OBJ-AT ?auto_14241 ?auto_14244 ) ( TRUCK-AT ?auto_14243 ?auto_14238 ) ( OBJ-AT ?auto_14239 ?auto_14238 ) ( not ( = ?auto_14239 ?auto_14240 ) ) ( not ( = ?auto_14239 ?auto_14241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14240 ?auto_14241 ?auto_14238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14246 - OBJ
      ?auto_14247 - OBJ
      ?auto_14248 - OBJ
      ?auto_14245 - LOCATION
    )
    :vars
    (
      ?auto_14251 - LOCATION
      ?auto_14249 - CITY
      ?auto_14250 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14251 ?auto_14249 ) ( IN-CITY ?auto_14245 ?auto_14249 ) ( not ( = ?auto_14245 ?auto_14251 ) ) ( OBJ-AT ?auto_14248 ?auto_14245 ) ( not ( = ?auto_14248 ?auto_14247 ) ) ( OBJ-AT ?auto_14247 ?auto_14251 ) ( TRUCK-AT ?auto_14250 ?auto_14245 ) ( OBJ-AT ?auto_14246 ?auto_14245 ) ( not ( = ?auto_14246 ?auto_14247 ) ) ( not ( = ?auto_14246 ?auto_14248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14248 ?auto_14247 ?auto_14245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14260 - OBJ
      ?auto_14261 - OBJ
      ?auto_14262 - OBJ
      ?auto_14259 - LOCATION
    )
    :vars
    (
      ?auto_14265 - LOCATION
      ?auto_14263 - CITY
      ?auto_14264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14265 ?auto_14263 ) ( IN-CITY ?auto_14259 ?auto_14263 ) ( not ( = ?auto_14259 ?auto_14265 ) ) ( OBJ-AT ?auto_14261 ?auto_14259 ) ( not ( = ?auto_14261 ?auto_14260 ) ) ( OBJ-AT ?auto_14260 ?auto_14265 ) ( TRUCK-AT ?auto_14264 ?auto_14259 ) ( OBJ-AT ?auto_14262 ?auto_14259 ) ( not ( = ?auto_14260 ?auto_14262 ) ) ( not ( = ?auto_14261 ?auto_14262 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14261 ?auto_14260 ?auto_14259 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14289 - OBJ
      ?auto_14288 - LOCATION
    )
    :vars
    (
      ?auto_14293 - LOCATION
      ?auto_14291 - CITY
      ?auto_14290 - OBJ
      ?auto_14292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14293 ?auto_14291 ) ( IN-CITY ?auto_14288 ?auto_14291 ) ( not ( = ?auto_14288 ?auto_14293 ) ) ( not ( = ?auto_14290 ?auto_14289 ) ) ( OBJ-AT ?auto_14289 ?auto_14293 ) ( TRUCK-AT ?auto_14292 ?auto_14288 ) ( IN-TRUCK ?auto_14290 ?auto_14292 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14290 ?auto_14288 )
      ( DELIVER-2PKG ?auto_14290 ?auto_14289 ?auto_14288 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14295 - OBJ
      ?auto_14296 - OBJ
      ?auto_14294 - LOCATION
    )
    :vars
    (
      ?auto_14298 - LOCATION
      ?auto_14299 - CITY
      ?auto_14297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14298 ?auto_14299 ) ( IN-CITY ?auto_14294 ?auto_14299 ) ( not ( = ?auto_14294 ?auto_14298 ) ) ( not ( = ?auto_14295 ?auto_14296 ) ) ( OBJ-AT ?auto_14296 ?auto_14298 ) ( TRUCK-AT ?auto_14297 ?auto_14294 ) ( IN-TRUCK ?auto_14295 ?auto_14297 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14296 ?auto_14294 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14301 - OBJ
      ?auto_14302 - OBJ
      ?auto_14300 - LOCATION
    )
    :vars
    (
      ?auto_14303 - LOCATION
      ?auto_14304 - CITY
      ?auto_14305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14303 ?auto_14304 ) ( IN-CITY ?auto_14300 ?auto_14304 ) ( not ( = ?auto_14300 ?auto_14303 ) ) ( not ( = ?auto_14302 ?auto_14301 ) ) ( OBJ-AT ?auto_14301 ?auto_14303 ) ( TRUCK-AT ?auto_14305 ?auto_14300 ) ( IN-TRUCK ?auto_14302 ?auto_14305 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14302 ?auto_14301 ?auto_14300 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14364 - OBJ
      ?auto_14363 - LOCATION
    )
    :vars
    (
      ?auto_14365 - LOCATION
      ?auto_14366 - CITY
      ?auto_14367 - OBJ
      ?auto_14368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14365 ?auto_14366 ) ( IN-CITY ?auto_14363 ?auto_14366 ) ( not ( = ?auto_14363 ?auto_14365 ) ) ( not ( = ?auto_14367 ?auto_14364 ) ) ( OBJ-AT ?auto_14364 ?auto_14365 ) ( IN-TRUCK ?auto_14367 ?auto_14368 ) ( TRUCK-AT ?auto_14368 ?auto_14365 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14368 ?auto_14365 ?auto_14363 ?auto_14366 )
      ( DELIVER-2PKG ?auto_14367 ?auto_14364 ?auto_14363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14370 - OBJ
      ?auto_14371 - OBJ
      ?auto_14369 - LOCATION
    )
    :vars
    (
      ?auto_14374 - LOCATION
      ?auto_14372 - CITY
      ?auto_14373 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14374 ?auto_14372 ) ( IN-CITY ?auto_14369 ?auto_14372 ) ( not ( = ?auto_14369 ?auto_14374 ) ) ( not ( = ?auto_14370 ?auto_14371 ) ) ( OBJ-AT ?auto_14371 ?auto_14374 ) ( IN-TRUCK ?auto_14370 ?auto_14373 ) ( TRUCK-AT ?auto_14373 ?auto_14374 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14371 ?auto_14369 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14376 - OBJ
      ?auto_14377 - OBJ
      ?auto_14375 - LOCATION
    )
    :vars
    (
      ?auto_14380 - LOCATION
      ?auto_14378 - CITY
      ?auto_14379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14380 ?auto_14378 ) ( IN-CITY ?auto_14375 ?auto_14378 ) ( not ( = ?auto_14375 ?auto_14380 ) ) ( not ( = ?auto_14377 ?auto_14376 ) ) ( OBJ-AT ?auto_14376 ?auto_14380 ) ( IN-TRUCK ?auto_14377 ?auto_14379 ) ( TRUCK-AT ?auto_14379 ?auto_14380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14377 ?auto_14376 ?auto_14375 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14439 - OBJ
      ?auto_14438 - LOCATION
    )
    :vars
    (
      ?auto_14442 - LOCATION
      ?auto_14440 - CITY
      ?auto_14443 - OBJ
      ?auto_14441 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14442 ?auto_14440 ) ( IN-CITY ?auto_14438 ?auto_14440 ) ( not ( = ?auto_14438 ?auto_14442 ) ) ( not ( = ?auto_14443 ?auto_14439 ) ) ( OBJ-AT ?auto_14439 ?auto_14442 ) ( TRUCK-AT ?auto_14441 ?auto_14442 ) ( OBJ-AT ?auto_14443 ?auto_14442 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14443 ?auto_14441 ?auto_14442 )
      ( DELIVER-2PKG ?auto_14443 ?auto_14439 ?auto_14438 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14445 - OBJ
      ?auto_14446 - OBJ
      ?auto_14444 - LOCATION
    )
    :vars
    (
      ?auto_14447 - LOCATION
      ?auto_14448 - CITY
      ?auto_14449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14447 ?auto_14448 ) ( IN-CITY ?auto_14444 ?auto_14448 ) ( not ( = ?auto_14444 ?auto_14447 ) ) ( not ( = ?auto_14445 ?auto_14446 ) ) ( OBJ-AT ?auto_14446 ?auto_14447 ) ( TRUCK-AT ?auto_14449 ?auto_14447 ) ( OBJ-AT ?auto_14445 ?auto_14447 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14446 ?auto_14444 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14451 - OBJ
      ?auto_14452 - OBJ
      ?auto_14450 - LOCATION
    )
    :vars
    (
      ?auto_14453 - LOCATION
      ?auto_14455 - CITY
      ?auto_14454 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14453 ?auto_14455 ) ( IN-CITY ?auto_14450 ?auto_14455 ) ( not ( = ?auto_14450 ?auto_14453 ) ) ( not ( = ?auto_14452 ?auto_14451 ) ) ( OBJ-AT ?auto_14451 ?auto_14453 ) ( TRUCK-AT ?auto_14454 ?auto_14453 ) ( OBJ-AT ?auto_14452 ?auto_14453 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14452 ?auto_14451 ?auto_14450 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14514 - OBJ
      ?auto_14513 - LOCATION
    )
    :vars
    (
      ?auto_14516 - LOCATION
      ?auto_14518 - CITY
      ?auto_14515 - OBJ
      ?auto_14517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14516 ?auto_14518 ) ( IN-CITY ?auto_14513 ?auto_14518 ) ( not ( = ?auto_14513 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14514 ) ) ( OBJ-AT ?auto_14514 ?auto_14516 ) ( OBJ-AT ?auto_14515 ?auto_14516 ) ( TRUCK-AT ?auto_14517 ?auto_14513 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14517 ?auto_14513 ?auto_14516 ?auto_14518 )
      ( DELIVER-2PKG ?auto_14515 ?auto_14514 ?auto_14513 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14520 - OBJ
      ?auto_14521 - OBJ
      ?auto_14519 - LOCATION
    )
    :vars
    (
      ?auto_14523 - LOCATION
      ?auto_14522 - CITY
      ?auto_14524 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14523 ?auto_14522 ) ( IN-CITY ?auto_14519 ?auto_14522 ) ( not ( = ?auto_14519 ?auto_14523 ) ) ( not ( = ?auto_14520 ?auto_14521 ) ) ( OBJ-AT ?auto_14521 ?auto_14523 ) ( OBJ-AT ?auto_14520 ?auto_14523 ) ( TRUCK-AT ?auto_14524 ?auto_14519 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14521 ?auto_14519 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14526 - OBJ
      ?auto_14527 - OBJ
      ?auto_14525 - LOCATION
    )
    :vars
    (
      ?auto_14530 - LOCATION
      ?auto_14529 - CITY
      ?auto_14528 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14530 ?auto_14529 ) ( IN-CITY ?auto_14525 ?auto_14529 ) ( not ( = ?auto_14525 ?auto_14530 ) ) ( not ( = ?auto_14527 ?auto_14526 ) ) ( OBJ-AT ?auto_14526 ?auto_14530 ) ( OBJ-AT ?auto_14527 ?auto_14530 ) ( TRUCK-AT ?auto_14528 ?auto_14525 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14527 ?auto_14526 ?auto_14525 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14682 - OBJ
      ?auto_14681 - LOCATION
    )
    :vars
    (
      ?auto_14683 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14683 ?auto_14681 ) ( IN-TRUCK ?auto_14682 ?auto_14683 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_14682 ?auto_14683 ?auto_14681 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14685 - OBJ
      ?auto_14686 - OBJ
      ?auto_14684 - LOCATION
    )
    :vars
    (
      ?auto_14687 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14687 ?auto_14684 ) ( IN-TRUCK ?auto_14686 ?auto_14687 ) ( OBJ-AT ?auto_14685 ?auto_14684 ) ( not ( = ?auto_14685 ?auto_14686 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14686 ?auto_14684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14689 - OBJ
      ?auto_14690 - OBJ
      ?auto_14688 - LOCATION
    )
    :vars
    (
      ?auto_14691 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14691 ?auto_14688 ) ( IN-TRUCK ?auto_14690 ?auto_14691 ) ( OBJ-AT ?auto_14689 ?auto_14688 ) ( not ( = ?auto_14689 ?auto_14690 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14690 ?auto_14688 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14693 - OBJ
      ?auto_14694 - OBJ
      ?auto_14692 - LOCATION
    )
    :vars
    (
      ?auto_14695 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14695 ?auto_14692 ) ( IN-TRUCK ?auto_14693 ?auto_14695 ) ( OBJ-AT ?auto_14694 ?auto_14692 ) ( not ( = ?auto_14693 ?auto_14694 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14693 ?auto_14692 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14697 - OBJ
      ?auto_14698 - OBJ
      ?auto_14696 - LOCATION
    )
    :vars
    (
      ?auto_14699 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14699 ?auto_14696 ) ( IN-TRUCK ?auto_14697 ?auto_14699 ) ( OBJ-AT ?auto_14698 ?auto_14696 ) ( not ( = ?auto_14697 ?auto_14698 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14697 ?auto_14696 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14705 - OBJ
      ?auto_14706 - OBJ
      ?auto_14707 - OBJ
      ?auto_14704 - LOCATION
    )
    :vars
    (
      ?auto_14708 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14708 ?auto_14704 ) ( IN-TRUCK ?auto_14707 ?auto_14708 ) ( OBJ-AT ?auto_14705 ?auto_14704 ) ( OBJ-AT ?auto_14706 ?auto_14704 ) ( not ( = ?auto_14705 ?auto_14706 ) ) ( not ( = ?auto_14705 ?auto_14707 ) ) ( not ( = ?auto_14706 ?auto_14707 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14707 ?auto_14704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14710 - OBJ
      ?auto_14711 - OBJ
      ?auto_14712 - OBJ
      ?auto_14709 - LOCATION
    )
    :vars
    (
      ?auto_14713 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14713 ?auto_14709 ) ( IN-TRUCK ?auto_14712 ?auto_14713 ) ( OBJ-AT ?auto_14710 ?auto_14709 ) ( OBJ-AT ?auto_14711 ?auto_14709 ) ( not ( = ?auto_14710 ?auto_14711 ) ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14711 ?auto_14712 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14712 ?auto_14709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14715 - OBJ
      ?auto_14716 - OBJ
      ?auto_14717 - OBJ
      ?auto_14714 - LOCATION
    )
    :vars
    (
      ?auto_14718 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14718 ?auto_14714 ) ( IN-TRUCK ?auto_14716 ?auto_14718 ) ( OBJ-AT ?auto_14715 ?auto_14714 ) ( OBJ-AT ?auto_14717 ?auto_14714 ) ( not ( = ?auto_14715 ?auto_14716 ) ) ( not ( = ?auto_14715 ?auto_14717 ) ) ( not ( = ?auto_14716 ?auto_14717 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14716 ?auto_14714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14720 - OBJ
      ?auto_14721 - OBJ
      ?auto_14722 - OBJ
      ?auto_14719 - LOCATION
    )
    :vars
    (
      ?auto_14723 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14723 ?auto_14719 ) ( IN-TRUCK ?auto_14721 ?auto_14723 ) ( OBJ-AT ?auto_14720 ?auto_14719 ) ( OBJ-AT ?auto_14722 ?auto_14719 ) ( not ( = ?auto_14720 ?auto_14721 ) ) ( not ( = ?auto_14720 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14722 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14721 ?auto_14719 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14730 - OBJ
      ?auto_14731 - OBJ
      ?auto_14732 - OBJ
      ?auto_14729 - LOCATION
    )
    :vars
    (
      ?auto_14733 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14733 ?auto_14729 ) ( IN-TRUCK ?auto_14732 ?auto_14733 ) ( OBJ-AT ?auto_14730 ?auto_14729 ) ( OBJ-AT ?auto_14731 ?auto_14729 ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14731 ?auto_14732 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14732 ?auto_14729 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14735 - OBJ
      ?auto_14736 - OBJ
      ?auto_14737 - OBJ
      ?auto_14734 - LOCATION
    )
    :vars
    (
      ?auto_14738 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14738 ?auto_14734 ) ( IN-TRUCK ?auto_14737 ?auto_14738 ) ( OBJ-AT ?auto_14735 ?auto_14734 ) ( OBJ-AT ?auto_14736 ?auto_14734 ) ( not ( = ?auto_14735 ?auto_14736 ) ) ( not ( = ?auto_14735 ?auto_14737 ) ) ( not ( = ?auto_14736 ?auto_14737 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14737 ?auto_14734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14740 - OBJ
      ?auto_14741 - OBJ
      ?auto_14742 - OBJ
      ?auto_14739 - LOCATION
    )
    :vars
    (
      ?auto_14743 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14743 ?auto_14739 ) ( IN-TRUCK ?auto_14741 ?auto_14743 ) ( OBJ-AT ?auto_14740 ?auto_14739 ) ( OBJ-AT ?auto_14742 ?auto_14739 ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14741 ?auto_14742 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14741 ?auto_14739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14745 - OBJ
      ?auto_14746 - OBJ
      ?auto_14747 - OBJ
      ?auto_14744 - LOCATION
    )
    :vars
    (
      ?auto_14748 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14748 ?auto_14744 ) ( IN-TRUCK ?auto_14746 ?auto_14748 ) ( OBJ-AT ?auto_14745 ?auto_14744 ) ( OBJ-AT ?auto_14747 ?auto_14744 ) ( not ( = ?auto_14745 ?auto_14746 ) ) ( not ( = ?auto_14745 ?auto_14747 ) ) ( not ( = ?auto_14746 ?auto_14747 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14746 ?auto_14744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14755 - OBJ
      ?auto_14756 - OBJ
      ?auto_14757 - OBJ
      ?auto_14754 - LOCATION
    )
    :vars
    (
      ?auto_14758 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14758 ?auto_14754 ) ( IN-TRUCK ?auto_14755 ?auto_14758 ) ( OBJ-AT ?auto_14756 ?auto_14754 ) ( OBJ-AT ?auto_14757 ?auto_14754 ) ( not ( = ?auto_14755 ?auto_14756 ) ) ( not ( = ?auto_14755 ?auto_14757 ) ) ( not ( = ?auto_14756 ?auto_14757 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14755 ?auto_14754 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14760 - OBJ
      ?auto_14761 - OBJ
      ?auto_14762 - OBJ
      ?auto_14759 - LOCATION
    )
    :vars
    (
      ?auto_14763 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14763 ?auto_14759 ) ( IN-TRUCK ?auto_14760 ?auto_14763 ) ( OBJ-AT ?auto_14761 ?auto_14759 ) ( OBJ-AT ?auto_14762 ?auto_14759 ) ( not ( = ?auto_14760 ?auto_14761 ) ) ( not ( = ?auto_14760 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14762 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14760 ?auto_14759 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14770 - OBJ
      ?auto_14771 - OBJ
      ?auto_14772 - OBJ
      ?auto_14769 - LOCATION
    )
    :vars
    (
      ?auto_14773 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14773 ?auto_14769 ) ( IN-TRUCK ?auto_14770 ?auto_14773 ) ( OBJ-AT ?auto_14771 ?auto_14769 ) ( OBJ-AT ?auto_14772 ?auto_14769 ) ( not ( = ?auto_14770 ?auto_14771 ) ) ( not ( = ?auto_14770 ?auto_14772 ) ) ( not ( = ?auto_14771 ?auto_14772 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14770 ?auto_14769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14775 - OBJ
      ?auto_14776 - OBJ
      ?auto_14777 - OBJ
      ?auto_14774 - LOCATION
    )
    :vars
    (
      ?auto_14778 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14778 ?auto_14774 ) ( IN-TRUCK ?auto_14775 ?auto_14778 ) ( OBJ-AT ?auto_14776 ?auto_14774 ) ( OBJ-AT ?auto_14777 ?auto_14774 ) ( not ( = ?auto_14775 ?auto_14776 ) ) ( not ( = ?auto_14775 ?auto_14777 ) ) ( not ( = ?auto_14776 ?auto_14777 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14775 ?auto_14774 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14800 - OBJ
      ?auto_14799 - LOCATION
    )
    :vars
    (
      ?auto_14801 - TRUCK
      ?auto_14802 - LOCATION
      ?auto_14803 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14800 ?auto_14801 ) ( TRUCK-AT ?auto_14801 ?auto_14802 ) ( IN-CITY ?auto_14802 ?auto_14803 ) ( IN-CITY ?auto_14799 ?auto_14803 ) ( not ( = ?auto_14799 ?auto_14802 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_14801 ?auto_14802 ?auto_14799 ?auto_14803 )
      ( DELIVER-1PKG ?auto_14800 ?auto_14799 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14805 - OBJ
      ?auto_14806 - OBJ
      ?auto_14804 - LOCATION
    )
    :vars
    (
      ?auto_14809 - TRUCK
      ?auto_14807 - LOCATION
      ?auto_14808 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14806 ?auto_14809 ) ( TRUCK-AT ?auto_14809 ?auto_14807 ) ( IN-CITY ?auto_14807 ?auto_14808 ) ( IN-CITY ?auto_14804 ?auto_14808 ) ( not ( = ?auto_14804 ?auto_14807 ) ) ( OBJ-AT ?auto_14805 ?auto_14804 ) ( not ( = ?auto_14805 ?auto_14806 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14806 ?auto_14804 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14811 - OBJ
      ?auto_14812 - OBJ
      ?auto_14810 - LOCATION
    )
    :vars
    (
      ?auto_14813 - TRUCK
      ?auto_14815 - LOCATION
      ?auto_14816 - CITY
      ?auto_14814 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14812 ?auto_14813 ) ( TRUCK-AT ?auto_14813 ?auto_14815 ) ( IN-CITY ?auto_14815 ?auto_14816 ) ( IN-CITY ?auto_14810 ?auto_14816 ) ( not ( = ?auto_14810 ?auto_14815 ) ) ( OBJ-AT ?auto_14814 ?auto_14810 ) ( not ( = ?auto_14814 ?auto_14812 ) ) ( OBJ-AT ?auto_14811 ?auto_14810 ) ( not ( = ?auto_14811 ?auto_14812 ) ) ( not ( = ?auto_14811 ?auto_14814 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14814 ?auto_14812 ?auto_14810 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14818 - OBJ
      ?auto_14819 - OBJ
      ?auto_14817 - LOCATION
    )
    :vars
    (
      ?auto_14820 - TRUCK
      ?auto_14821 - LOCATION
      ?auto_14822 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14818 ?auto_14820 ) ( TRUCK-AT ?auto_14820 ?auto_14821 ) ( IN-CITY ?auto_14821 ?auto_14822 ) ( IN-CITY ?auto_14817 ?auto_14822 ) ( not ( = ?auto_14817 ?auto_14821 ) ) ( OBJ-AT ?auto_14819 ?auto_14817 ) ( not ( = ?auto_14819 ?auto_14818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14819 ?auto_14818 ?auto_14817 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14824 - OBJ
      ?auto_14825 - OBJ
      ?auto_14823 - LOCATION
    )
    :vars
    (
      ?auto_14826 - TRUCK
      ?auto_14828 - LOCATION
      ?auto_14829 - CITY
      ?auto_14827 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14824 ?auto_14826 ) ( TRUCK-AT ?auto_14826 ?auto_14828 ) ( IN-CITY ?auto_14828 ?auto_14829 ) ( IN-CITY ?auto_14823 ?auto_14829 ) ( not ( = ?auto_14823 ?auto_14828 ) ) ( OBJ-AT ?auto_14827 ?auto_14823 ) ( not ( = ?auto_14827 ?auto_14824 ) ) ( OBJ-AT ?auto_14825 ?auto_14823 ) ( not ( = ?auto_14824 ?auto_14825 ) ) ( not ( = ?auto_14825 ?auto_14827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14827 ?auto_14824 ?auto_14823 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14838 - OBJ
      ?auto_14839 - OBJ
      ?auto_14840 - OBJ
      ?auto_14837 - LOCATION
    )
    :vars
    (
      ?auto_14841 - TRUCK
      ?auto_14842 - LOCATION
      ?auto_14843 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14840 ?auto_14841 ) ( TRUCK-AT ?auto_14841 ?auto_14842 ) ( IN-CITY ?auto_14842 ?auto_14843 ) ( IN-CITY ?auto_14837 ?auto_14843 ) ( not ( = ?auto_14837 ?auto_14842 ) ) ( OBJ-AT ?auto_14839 ?auto_14837 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( OBJ-AT ?auto_14838 ?auto_14837 ) ( not ( = ?auto_14838 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14839 ?auto_14840 ?auto_14837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14845 - OBJ
      ?auto_14846 - OBJ
      ?auto_14847 - OBJ
      ?auto_14844 - LOCATION
    )
    :vars
    (
      ?auto_14848 - TRUCK
      ?auto_14849 - LOCATION
      ?auto_14850 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14847 ?auto_14848 ) ( TRUCK-AT ?auto_14848 ?auto_14849 ) ( IN-CITY ?auto_14849 ?auto_14850 ) ( IN-CITY ?auto_14844 ?auto_14850 ) ( not ( = ?auto_14844 ?auto_14849 ) ) ( OBJ-AT ?auto_14845 ?auto_14844 ) ( not ( = ?auto_14845 ?auto_14847 ) ) ( OBJ-AT ?auto_14846 ?auto_14844 ) ( not ( = ?auto_14845 ?auto_14846 ) ) ( not ( = ?auto_14846 ?auto_14847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14845 ?auto_14847 ?auto_14844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14852 - OBJ
      ?auto_14853 - OBJ
      ?auto_14854 - OBJ
      ?auto_14851 - LOCATION
    )
    :vars
    (
      ?auto_14855 - TRUCK
      ?auto_14856 - LOCATION
      ?auto_14857 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14853 ?auto_14855 ) ( TRUCK-AT ?auto_14855 ?auto_14856 ) ( IN-CITY ?auto_14856 ?auto_14857 ) ( IN-CITY ?auto_14851 ?auto_14857 ) ( not ( = ?auto_14851 ?auto_14856 ) ) ( OBJ-AT ?auto_14854 ?auto_14851 ) ( not ( = ?auto_14854 ?auto_14853 ) ) ( OBJ-AT ?auto_14852 ?auto_14851 ) ( not ( = ?auto_14852 ?auto_14853 ) ) ( not ( = ?auto_14852 ?auto_14854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14854 ?auto_14853 ?auto_14851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14859 - OBJ
      ?auto_14860 - OBJ
      ?auto_14861 - OBJ
      ?auto_14858 - LOCATION
    )
    :vars
    (
      ?auto_14862 - TRUCK
      ?auto_14863 - LOCATION
      ?auto_14864 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14860 ?auto_14862 ) ( TRUCK-AT ?auto_14862 ?auto_14863 ) ( IN-CITY ?auto_14863 ?auto_14864 ) ( IN-CITY ?auto_14858 ?auto_14864 ) ( not ( = ?auto_14858 ?auto_14863 ) ) ( OBJ-AT ?auto_14859 ?auto_14858 ) ( not ( = ?auto_14859 ?auto_14860 ) ) ( OBJ-AT ?auto_14861 ?auto_14858 ) ( not ( = ?auto_14859 ?auto_14861 ) ) ( not ( = ?auto_14860 ?auto_14861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14859 ?auto_14860 ?auto_14858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14873 - OBJ
      ?auto_14874 - OBJ
      ?auto_14875 - OBJ
      ?auto_14872 - LOCATION
    )
    :vars
    (
      ?auto_14876 - TRUCK
      ?auto_14877 - LOCATION
      ?auto_14878 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14875 ?auto_14876 ) ( TRUCK-AT ?auto_14876 ?auto_14877 ) ( IN-CITY ?auto_14877 ?auto_14878 ) ( IN-CITY ?auto_14872 ?auto_14878 ) ( not ( = ?auto_14872 ?auto_14877 ) ) ( OBJ-AT ?auto_14874 ?auto_14872 ) ( not ( = ?auto_14874 ?auto_14875 ) ) ( OBJ-AT ?auto_14873 ?auto_14872 ) ( not ( = ?auto_14873 ?auto_14874 ) ) ( not ( = ?auto_14873 ?auto_14875 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14874 ?auto_14875 ?auto_14872 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14880 - OBJ
      ?auto_14881 - OBJ
      ?auto_14882 - OBJ
      ?auto_14879 - LOCATION
    )
    :vars
    (
      ?auto_14883 - TRUCK
      ?auto_14885 - LOCATION
      ?auto_14886 - CITY
      ?auto_14884 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14882 ?auto_14883 ) ( TRUCK-AT ?auto_14883 ?auto_14885 ) ( IN-CITY ?auto_14885 ?auto_14886 ) ( IN-CITY ?auto_14879 ?auto_14886 ) ( not ( = ?auto_14879 ?auto_14885 ) ) ( OBJ-AT ?auto_14884 ?auto_14879 ) ( not ( = ?auto_14884 ?auto_14882 ) ) ( OBJ-AT ?auto_14880 ?auto_14879 ) ( OBJ-AT ?auto_14881 ?auto_14879 ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14882 ) ) ( not ( = ?auto_14880 ?auto_14884 ) ) ( not ( = ?auto_14881 ?auto_14882 ) ) ( not ( = ?auto_14881 ?auto_14884 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14884 ?auto_14882 ?auto_14879 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14888 - OBJ
      ?auto_14889 - OBJ
      ?auto_14890 - OBJ
      ?auto_14887 - LOCATION
    )
    :vars
    (
      ?auto_14891 - TRUCK
      ?auto_14892 - LOCATION
      ?auto_14893 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14889 ?auto_14891 ) ( TRUCK-AT ?auto_14891 ?auto_14892 ) ( IN-CITY ?auto_14892 ?auto_14893 ) ( IN-CITY ?auto_14887 ?auto_14893 ) ( not ( = ?auto_14887 ?auto_14892 ) ) ( OBJ-AT ?auto_14890 ?auto_14887 ) ( not ( = ?auto_14890 ?auto_14889 ) ) ( OBJ-AT ?auto_14888 ?auto_14887 ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14890 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14890 ?auto_14889 ?auto_14887 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14895 - OBJ
      ?auto_14896 - OBJ
      ?auto_14897 - OBJ
      ?auto_14894 - LOCATION
    )
    :vars
    (
      ?auto_14898 - TRUCK
      ?auto_14900 - LOCATION
      ?auto_14901 - CITY
      ?auto_14899 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14896 ?auto_14898 ) ( TRUCK-AT ?auto_14898 ?auto_14900 ) ( IN-CITY ?auto_14900 ?auto_14901 ) ( IN-CITY ?auto_14894 ?auto_14901 ) ( not ( = ?auto_14894 ?auto_14900 ) ) ( OBJ-AT ?auto_14899 ?auto_14894 ) ( not ( = ?auto_14899 ?auto_14896 ) ) ( OBJ-AT ?auto_14895 ?auto_14894 ) ( OBJ-AT ?auto_14897 ?auto_14894 ) ( not ( = ?auto_14895 ?auto_14896 ) ) ( not ( = ?auto_14895 ?auto_14897 ) ) ( not ( = ?auto_14895 ?auto_14899 ) ) ( not ( = ?auto_14896 ?auto_14897 ) ) ( not ( = ?auto_14897 ?auto_14899 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14899 ?auto_14896 ?auto_14894 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14911 - OBJ
      ?auto_14912 - OBJ
      ?auto_14913 - OBJ
      ?auto_14910 - LOCATION
    )
    :vars
    (
      ?auto_14914 - TRUCK
      ?auto_14915 - LOCATION
      ?auto_14916 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14911 ?auto_14914 ) ( TRUCK-AT ?auto_14914 ?auto_14915 ) ( IN-CITY ?auto_14915 ?auto_14916 ) ( IN-CITY ?auto_14910 ?auto_14916 ) ( not ( = ?auto_14910 ?auto_14915 ) ) ( OBJ-AT ?auto_14912 ?auto_14910 ) ( not ( = ?auto_14912 ?auto_14911 ) ) ( OBJ-AT ?auto_14913 ?auto_14910 ) ( not ( = ?auto_14911 ?auto_14913 ) ) ( not ( = ?auto_14912 ?auto_14913 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14912 ?auto_14911 ?auto_14910 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14918 - OBJ
      ?auto_14919 - OBJ
      ?auto_14920 - OBJ
      ?auto_14917 - LOCATION
    )
    :vars
    (
      ?auto_14921 - TRUCK
      ?auto_14922 - LOCATION
      ?auto_14923 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14918 ?auto_14921 ) ( TRUCK-AT ?auto_14921 ?auto_14922 ) ( IN-CITY ?auto_14922 ?auto_14923 ) ( IN-CITY ?auto_14917 ?auto_14923 ) ( not ( = ?auto_14917 ?auto_14922 ) ) ( OBJ-AT ?auto_14919 ?auto_14917 ) ( not ( = ?auto_14919 ?auto_14918 ) ) ( OBJ-AT ?auto_14920 ?auto_14917 ) ( not ( = ?auto_14918 ?auto_14920 ) ) ( not ( = ?auto_14919 ?auto_14920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14919 ?auto_14918 ?auto_14917 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14932 - OBJ
      ?auto_14933 - OBJ
      ?auto_14934 - OBJ
      ?auto_14931 - LOCATION
    )
    :vars
    (
      ?auto_14935 - TRUCK
      ?auto_14936 - LOCATION
      ?auto_14937 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14932 ?auto_14935 ) ( TRUCK-AT ?auto_14935 ?auto_14936 ) ( IN-CITY ?auto_14936 ?auto_14937 ) ( IN-CITY ?auto_14931 ?auto_14937 ) ( not ( = ?auto_14931 ?auto_14936 ) ) ( OBJ-AT ?auto_14934 ?auto_14931 ) ( not ( = ?auto_14934 ?auto_14932 ) ) ( OBJ-AT ?auto_14933 ?auto_14931 ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14933 ?auto_14934 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14934 ?auto_14932 ?auto_14931 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_14939 - OBJ
      ?auto_14940 - OBJ
      ?auto_14941 - OBJ
      ?auto_14938 - LOCATION
    )
    :vars
    (
      ?auto_14942 - TRUCK
      ?auto_14944 - LOCATION
      ?auto_14945 - CITY
      ?auto_14943 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_14939 ?auto_14942 ) ( TRUCK-AT ?auto_14942 ?auto_14944 ) ( IN-CITY ?auto_14944 ?auto_14945 ) ( IN-CITY ?auto_14938 ?auto_14945 ) ( not ( = ?auto_14938 ?auto_14944 ) ) ( OBJ-AT ?auto_14943 ?auto_14938 ) ( not ( = ?auto_14943 ?auto_14939 ) ) ( OBJ-AT ?auto_14940 ?auto_14938 ) ( OBJ-AT ?auto_14941 ?auto_14938 ) ( not ( = ?auto_14939 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14943 ) ) ( not ( = ?auto_14941 ?auto_14943 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14943 ?auto_14939 ?auto_14938 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_14978 - OBJ
      ?auto_14977 - LOCATION
    )
    :vars
    (
      ?auto_14979 - TRUCK
      ?auto_14981 - LOCATION
      ?auto_14982 - CITY
      ?auto_14980 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14979 ?auto_14981 ) ( IN-CITY ?auto_14981 ?auto_14982 ) ( IN-CITY ?auto_14977 ?auto_14982 ) ( not ( = ?auto_14977 ?auto_14981 ) ) ( OBJ-AT ?auto_14980 ?auto_14977 ) ( not ( = ?auto_14980 ?auto_14978 ) ) ( OBJ-AT ?auto_14978 ?auto_14981 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_14978 ?auto_14979 ?auto_14981 )
      ( DELIVER-2PKG ?auto_14980 ?auto_14978 ?auto_14977 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14984 - OBJ
      ?auto_14985 - OBJ
      ?auto_14983 - LOCATION
    )
    :vars
    (
      ?auto_14986 - TRUCK
      ?auto_14988 - LOCATION
      ?auto_14987 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14986 ?auto_14988 ) ( IN-CITY ?auto_14988 ?auto_14987 ) ( IN-CITY ?auto_14983 ?auto_14987 ) ( not ( = ?auto_14983 ?auto_14988 ) ) ( OBJ-AT ?auto_14984 ?auto_14983 ) ( not ( = ?auto_14984 ?auto_14985 ) ) ( OBJ-AT ?auto_14985 ?auto_14988 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_14985 ?auto_14983 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14990 - OBJ
      ?auto_14991 - OBJ
      ?auto_14989 - LOCATION
    )
    :vars
    (
      ?auto_14995 - TRUCK
      ?auto_14994 - LOCATION
      ?auto_14992 - CITY
      ?auto_14993 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_14995 ?auto_14994 ) ( IN-CITY ?auto_14994 ?auto_14992 ) ( IN-CITY ?auto_14989 ?auto_14992 ) ( not ( = ?auto_14989 ?auto_14994 ) ) ( OBJ-AT ?auto_14993 ?auto_14989 ) ( not ( = ?auto_14993 ?auto_14991 ) ) ( OBJ-AT ?auto_14991 ?auto_14994 ) ( OBJ-AT ?auto_14990 ?auto_14989 ) ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14990 ?auto_14993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14993 ?auto_14991 ?auto_14989 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_14997 - OBJ
      ?auto_14998 - OBJ
      ?auto_14996 - LOCATION
    )
    :vars
    (
      ?auto_15001 - TRUCK
      ?auto_15000 - LOCATION
      ?auto_14999 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15001 ?auto_15000 ) ( IN-CITY ?auto_15000 ?auto_14999 ) ( IN-CITY ?auto_14996 ?auto_14999 ) ( not ( = ?auto_14996 ?auto_15000 ) ) ( OBJ-AT ?auto_14998 ?auto_14996 ) ( not ( = ?auto_14998 ?auto_14997 ) ) ( OBJ-AT ?auto_14997 ?auto_15000 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_14998 ?auto_14997 ?auto_14996 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15003 - OBJ
      ?auto_15004 - OBJ
      ?auto_15002 - LOCATION
    )
    :vars
    (
      ?auto_15008 - TRUCK
      ?auto_15007 - LOCATION
      ?auto_15005 - CITY
      ?auto_15006 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15008 ?auto_15007 ) ( IN-CITY ?auto_15007 ?auto_15005 ) ( IN-CITY ?auto_15002 ?auto_15005 ) ( not ( = ?auto_15002 ?auto_15007 ) ) ( OBJ-AT ?auto_15006 ?auto_15002 ) ( not ( = ?auto_15006 ?auto_15003 ) ) ( OBJ-AT ?auto_15003 ?auto_15007 ) ( OBJ-AT ?auto_15004 ?auto_15002 ) ( not ( = ?auto_15003 ?auto_15004 ) ) ( not ( = ?auto_15004 ?auto_15006 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15006 ?auto_15003 ?auto_15002 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15017 - OBJ
      ?auto_15018 - OBJ
      ?auto_15019 - OBJ
      ?auto_15016 - LOCATION
    )
    :vars
    (
      ?auto_15022 - TRUCK
      ?auto_15021 - LOCATION
      ?auto_15020 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15022 ?auto_15021 ) ( IN-CITY ?auto_15021 ?auto_15020 ) ( IN-CITY ?auto_15016 ?auto_15020 ) ( not ( = ?auto_15016 ?auto_15021 ) ) ( OBJ-AT ?auto_15017 ?auto_15016 ) ( not ( = ?auto_15017 ?auto_15019 ) ) ( OBJ-AT ?auto_15019 ?auto_15021 ) ( OBJ-AT ?auto_15018 ?auto_15016 ) ( not ( = ?auto_15017 ?auto_15018 ) ) ( not ( = ?auto_15018 ?auto_15019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15017 ?auto_15019 ?auto_15016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15024 - OBJ
      ?auto_15025 - OBJ
      ?auto_15026 - OBJ
      ?auto_15023 - LOCATION
    )
    :vars
    (
      ?auto_15029 - TRUCK
      ?auto_15028 - LOCATION
      ?auto_15027 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15029 ?auto_15028 ) ( IN-CITY ?auto_15028 ?auto_15027 ) ( IN-CITY ?auto_15023 ?auto_15027 ) ( not ( = ?auto_15023 ?auto_15028 ) ) ( OBJ-AT ?auto_15024 ?auto_15023 ) ( not ( = ?auto_15024 ?auto_15026 ) ) ( OBJ-AT ?auto_15026 ?auto_15028 ) ( OBJ-AT ?auto_15025 ?auto_15023 ) ( not ( = ?auto_15024 ?auto_15025 ) ) ( not ( = ?auto_15025 ?auto_15026 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15024 ?auto_15026 ?auto_15023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15031 - OBJ
      ?auto_15032 - OBJ
      ?auto_15033 - OBJ
      ?auto_15030 - LOCATION
    )
    :vars
    (
      ?auto_15036 - TRUCK
      ?auto_15035 - LOCATION
      ?auto_15034 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15036 ?auto_15035 ) ( IN-CITY ?auto_15035 ?auto_15034 ) ( IN-CITY ?auto_15030 ?auto_15034 ) ( not ( = ?auto_15030 ?auto_15035 ) ) ( OBJ-AT ?auto_15033 ?auto_15030 ) ( not ( = ?auto_15033 ?auto_15032 ) ) ( OBJ-AT ?auto_15032 ?auto_15035 ) ( OBJ-AT ?auto_15031 ?auto_15030 ) ( not ( = ?auto_15031 ?auto_15032 ) ) ( not ( = ?auto_15031 ?auto_15033 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15033 ?auto_15032 ?auto_15030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15038 - OBJ
      ?auto_15039 - OBJ
      ?auto_15040 - OBJ
      ?auto_15037 - LOCATION
    )
    :vars
    (
      ?auto_15043 - TRUCK
      ?auto_15042 - LOCATION
      ?auto_15041 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15043 ?auto_15042 ) ( IN-CITY ?auto_15042 ?auto_15041 ) ( IN-CITY ?auto_15037 ?auto_15041 ) ( not ( = ?auto_15037 ?auto_15042 ) ) ( OBJ-AT ?auto_15038 ?auto_15037 ) ( not ( = ?auto_15038 ?auto_15039 ) ) ( OBJ-AT ?auto_15039 ?auto_15042 ) ( OBJ-AT ?auto_15040 ?auto_15037 ) ( not ( = ?auto_15038 ?auto_15040 ) ) ( not ( = ?auto_15039 ?auto_15040 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15038 ?auto_15039 ?auto_15037 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15052 - OBJ
      ?auto_15053 - OBJ
      ?auto_15054 - OBJ
      ?auto_15051 - LOCATION
    )
    :vars
    (
      ?auto_15057 - TRUCK
      ?auto_15056 - LOCATION
      ?auto_15055 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15057 ?auto_15056 ) ( IN-CITY ?auto_15056 ?auto_15055 ) ( IN-CITY ?auto_15051 ?auto_15055 ) ( not ( = ?auto_15051 ?auto_15056 ) ) ( OBJ-AT ?auto_15053 ?auto_15051 ) ( not ( = ?auto_15053 ?auto_15054 ) ) ( OBJ-AT ?auto_15054 ?auto_15056 ) ( OBJ-AT ?auto_15052 ?auto_15051 ) ( not ( = ?auto_15052 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15054 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15053 ?auto_15054 ?auto_15051 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15059 - OBJ
      ?auto_15060 - OBJ
      ?auto_15061 - OBJ
      ?auto_15058 - LOCATION
    )
    :vars
    (
      ?auto_15065 - TRUCK
      ?auto_15064 - LOCATION
      ?auto_15062 - CITY
      ?auto_15063 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15065 ?auto_15064 ) ( IN-CITY ?auto_15064 ?auto_15062 ) ( IN-CITY ?auto_15058 ?auto_15062 ) ( not ( = ?auto_15058 ?auto_15064 ) ) ( OBJ-AT ?auto_15063 ?auto_15058 ) ( not ( = ?auto_15063 ?auto_15061 ) ) ( OBJ-AT ?auto_15061 ?auto_15064 ) ( OBJ-AT ?auto_15059 ?auto_15058 ) ( OBJ-AT ?auto_15060 ?auto_15058 ) ( not ( = ?auto_15059 ?auto_15060 ) ) ( not ( = ?auto_15059 ?auto_15061 ) ) ( not ( = ?auto_15059 ?auto_15063 ) ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15063 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15063 ?auto_15061 ?auto_15058 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15067 - OBJ
      ?auto_15068 - OBJ
      ?auto_15069 - OBJ
      ?auto_15066 - LOCATION
    )
    :vars
    (
      ?auto_15072 - TRUCK
      ?auto_15071 - LOCATION
      ?auto_15070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15072 ?auto_15071 ) ( IN-CITY ?auto_15071 ?auto_15070 ) ( IN-CITY ?auto_15066 ?auto_15070 ) ( not ( = ?auto_15066 ?auto_15071 ) ) ( OBJ-AT ?auto_15069 ?auto_15066 ) ( not ( = ?auto_15069 ?auto_15068 ) ) ( OBJ-AT ?auto_15068 ?auto_15071 ) ( OBJ-AT ?auto_15067 ?auto_15066 ) ( not ( = ?auto_15067 ?auto_15068 ) ) ( not ( = ?auto_15067 ?auto_15069 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15069 ?auto_15068 ?auto_15066 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15074 - OBJ
      ?auto_15075 - OBJ
      ?auto_15076 - OBJ
      ?auto_15073 - LOCATION
    )
    :vars
    (
      ?auto_15080 - TRUCK
      ?auto_15079 - LOCATION
      ?auto_15077 - CITY
      ?auto_15078 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15080 ?auto_15079 ) ( IN-CITY ?auto_15079 ?auto_15077 ) ( IN-CITY ?auto_15073 ?auto_15077 ) ( not ( = ?auto_15073 ?auto_15079 ) ) ( OBJ-AT ?auto_15078 ?auto_15073 ) ( not ( = ?auto_15078 ?auto_15075 ) ) ( OBJ-AT ?auto_15075 ?auto_15079 ) ( OBJ-AT ?auto_15074 ?auto_15073 ) ( OBJ-AT ?auto_15076 ?auto_15073 ) ( not ( = ?auto_15074 ?auto_15075 ) ) ( not ( = ?auto_15074 ?auto_15076 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15078 ?auto_15075 ?auto_15073 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15090 - OBJ
      ?auto_15091 - OBJ
      ?auto_15092 - OBJ
      ?auto_15089 - LOCATION
    )
    :vars
    (
      ?auto_15095 - TRUCK
      ?auto_15094 - LOCATION
      ?auto_15093 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15095 ?auto_15094 ) ( IN-CITY ?auto_15094 ?auto_15093 ) ( IN-CITY ?auto_15089 ?auto_15093 ) ( not ( = ?auto_15089 ?auto_15094 ) ) ( OBJ-AT ?auto_15091 ?auto_15089 ) ( not ( = ?auto_15091 ?auto_15090 ) ) ( OBJ-AT ?auto_15090 ?auto_15094 ) ( OBJ-AT ?auto_15092 ?auto_15089 ) ( not ( = ?auto_15090 ?auto_15092 ) ) ( not ( = ?auto_15091 ?auto_15092 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15091 ?auto_15090 ?auto_15089 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15097 - OBJ
      ?auto_15098 - OBJ
      ?auto_15099 - OBJ
      ?auto_15096 - LOCATION
    )
    :vars
    (
      ?auto_15102 - TRUCK
      ?auto_15101 - LOCATION
      ?auto_15100 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15102 ?auto_15101 ) ( IN-CITY ?auto_15101 ?auto_15100 ) ( IN-CITY ?auto_15096 ?auto_15100 ) ( not ( = ?auto_15096 ?auto_15101 ) ) ( OBJ-AT ?auto_15098 ?auto_15096 ) ( not ( = ?auto_15098 ?auto_15097 ) ) ( OBJ-AT ?auto_15097 ?auto_15101 ) ( OBJ-AT ?auto_15099 ?auto_15096 ) ( not ( = ?auto_15097 ?auto_15099 ) ) ( not ( = ?auto_15098 ?auto_15099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15098 ?auto_15097 ?auto_15096 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15111 - OBJ
      ?auto_15112 - OBJ
      ?auto_15113 - OBJ
      ?auto_15110 - LOCATION
    )
    :vars
    (
      ?auto_15116 - TRUCK
      ?auto_15115 - LOCATION
      ?auto_15114 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15116 ?auto_15115 ) ( IN-CITY ?auto_15115 ?auto_15114 ) ( IN-CITY ?auto_15110 ?auto_15114 ) ( not ( = ?auto_15110 ?auto_15115 ) ) ( OBJ-AT ?auto_15113 ?auto_15110 ) ( not ( = ?auto_15113 ?auto_15111 ) ) ( OBJ-AT ?auto_15111 ?auto_15115 ) ( OBJ-AT ?auto_15112 ?auto_15110 ) ( not ( = ?auto_15111 ?auto_15112 ) ) ( not ( = ?auto_15112 ?auto_15113 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15113 ?auto_15111 ?auto_15110 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15118 - OBJ
      ?auto_15119 - OBJ
      ?auto_15120 - OBJ
      ?auto_15117 - LOCATION
    )
    :vars
    (
      ?auto_15124 - TRUCK
      ?auto_15123 - LOCATION
      ?auto_15121 - CITY
      ?auto_15122 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15124 ?auto_15123 ) ( IN-CITY ?auto_15123 ?auto_15121 ) ( IN-CITY ?auto_15117 ?auto_15121 ) ( not ( = ?auto_15117 ?auto_15123 ) ) ( OBJ-AT ?auto_15122 ?auto_15117 ) ( not ( = ?auto_15122 ?auto_15118 ) ) ( OBJ-AT ?auto_15118 ?auto_15123 ) ( OBJ-AT ?auto_15119 ?auto_15117 ) ( OBJ-AT ?auto_15120 ?auto_15117 ) ( not ( = ?auto_15118 ?auto_15119 ) ) ( not ( = ?auto_15118 ?auto_15120 ) ) ( not ( = ?auto_15119 ?auto_15120 ) ) ( not ( = ?auto_15119 ?auto_15122 ) ) ( not ( = ?auto_15120 ?auto_15122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15122 ?auto_15118 ?auto_15117 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15157 - OBJ
      ?auto_15156 - LOCATION
    )
    :vars
    (
      ?auto_15160 - LOCATION
      ?auto_15158 - CITY
      ?auto_15159 - OBJ
      ?auto_15161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15160 ?auto_15158 ) ( IN-CITY ?auto_15156 ?auto_15158 ) ( not ( = ?auto_15156 ?auto_15160 ) ) ( OBJ-AT ?auto_15159 ?auto_15156 ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( OBJ-AT ?auto_15157 ?auto_15160 ) ( TRUCK-AT ?auto_15161 ?auto_15156 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15161 ?auto_15156 ?auto_15160 ?auto_15158 )
      ( DELIVER-2PKG ?auto_15159 ?auto_15157 ?auto_15156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15163 - OBJ
      ?auto_15164 - OBJ
      ?auto_15162 - LOCATION
    )
    :vars
    (
      ?auto_15166 - LOCATION
      ?auto_15165 - CITY
      ?auto_15167 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15166 ?auto_15165 ) ( IN-CITY ?auto_15162 ?auto_15165 ) ( not ( = ?auto_15162 ?auto_15166 ) ) ( OBJ-AT ?auto_15163 ?auto_15162 ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( OBJ-AT ?auto_15164 ?auto_15166 ) ( TRUCK-AT ?auto_15167 ?auto_15162 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15164 ?auto_15162 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15169 - OBJ
      ?auto_15170 - OBJ
      ?auto_15168 - LOCATION
    )
    :vars
    (
      ?auto_15174 - LOCATION
      ?auto_15172 - CITY
      ?auto_15173 - OBJ
      ?auto_15171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15174 ?auto_15172 ) ( IN-CITY ?auto_15168 ?auto_15172 ) ( not ( = ?auto_15168 ?auto_15174 ) ) ( OBJ-AT ?auto_15173 ?auto_15168 ) ( not ( = ?auto_15173 ?auto_15170 ) ) ( OBJ-AT ?auto_15170 ?auto_15174 ) ( TRUCK-AT ?auto_15171 ?auto_15168 ) ( OBJ-AT ?auto_15169 ?auto_15168 ) ( not ( = ?auto_15169 ?auto_15170 ) ) ( not ( = ?auto_15169 ?auto_15173 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15173 ?auto_15170 ?auto_15168 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15176 - OBJ
      ?auto_15177 - OBJ
      ?auto_15175 - LOCATION
    )
    :vars
    (
      ?auto_15180 - LOCATION
      ?auto_15179 - CITY
      ?auto_15178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15180 ?auto_15179 ) ( IN-CITY ?auto_15175 ?auto_15179 ) ( not ( = ?auto_15175 ?auto_15180 ) ) ( OBJ-AT ?auto_15177 ?auto_15175 ) ( not ( = ?auto_15177 ?auto_15176 ) ) ( OBJ-AT ?auto_15176 ?auto_15180 ) ( TRUCK-AT ?auto_15178 ?auto_15175 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15177 ?auto_15176 ?auto_15175 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15182 - OBJ
      ?auto_15183 - OBJ
      ?auto_15181 - LOCATION
    )
    :vars
    (
      ?auto_15187 - LOCATION
      ?auto_15185 - CITY
      ?auto_15186 - OBJ
      ?auto_15184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15187 ?auto_15185 ) ( IN-CITY ?auto_15181 ?auto_15185 ) ( not ( = ?auto_15181 ?auto_15187 ) ) ( OBJ-AT ?auto_15186 ?auto_15181 ) ( not ( = ?auto_15186 ?auto_15182 ) ) ( OBJ-AT ?auto_15182 ?auto_15187 ) ( TRUCK-AT ?auto_15184 ?auto_15181 ) ( OBJ-AT ?auto_15183 ?auto_15181 ) ( not ( = ?auto_15182 ?auto_15183 ) ) ( not ( = ?auto_15183 ?auto_15186 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15186 ?auto_15182 ?auto_15181 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15196 - OBJ
      ?auto_15197 - OBJ
      ?auto_15198 - OBJ
      ?auto_15195 - LOCATION
    )
    :vars
    (
      ?auto_15201 - LOCATION
      ?auto_15200 - CITY
      ?auto_15199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15201 ?auto_15200 ) ( IN-CITY ?auto_15195 ?auto_15200 ) ( not ( = ?auto_15195 ?auto_15201 ) ) ( OBJ-AT ?auto_15196 ?auto_15195 ) ( not ( = ?auto_15196 ?auto_15198 ) ) ( OBJ-AT ?auto_15198 ?auto_15201 ) ( TRUCK-AT ?auto_15199 ?auto_15195 ) ( OBJ-AT ?auto_15197 ?auto_15195 ) ( not ( = ?auto_15196 ?auto_15197 ) ) ( not ( = ?auto_15197 ?auto_15198 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15196 ?auto_15198 ?auto_15195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15203 - OBJ
      ?auto_15204 - OBJ
      ?auto_15205 - OBJ
      ?auto_15202 - LOCATION
    )
    :vars
    (
      ?auto_15208 - LOCATION
      ?auto_15207 - CITY
      ?auto_15206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15208 ?auto_15207 ) ( IN-CITY ?auto_15202 ?auto_15207 ) ( not ( = ?auto_15202 ?auto_15208 ) ) ( OBJ-AT ?auto_15203 ?auto_15202 ) ( not ( = ?auto_15203 ?auto_15205 ) ) ( OBJ-AT ?auto_15205 ?auto_15208 ) ( TRUCK-AT ?auto_15206 ?auto_15202 ) ( OBJ-AT ?auto_15204 ?auto_15202 ) ( not ( = ?auto_15203 ?auto_15204 ) ) ( not ( = ?auto_15204 ?auto_15205 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15203 ?auto_15205 ?auto_15202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15210 - OBJ
      ?auto_15211 - OBJ
      ?auto_15212 - OBJ
      ?auto_15209 - LOCATION
    )
    :vars
    (
      ?auto_15215 - LOCATION
      ?auto_15214 - CITY
      ?auto_15213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15215 ?auto_15214 ) ( IN-CITY ?auto_15209 ?auto_15214 ) ( not ( = ?auto_15209 ?auto_15215 ) ) ( OBJ-AT ?auto_15212 ?auto_15209 ) ( not ( = ?auto_15212 ?auto_15211 ) ) ( OBJ-AT ?auto_15211 ?auto_15215 ) ( TRUCK-AT ?auto_15213 ?auto_15209 ) ( OBJ-AT ?auto_15210 ?auto_15209 ) ( not ( = ?auto_15210 ?auto_15211 ) ) ( not ( = ?auto_15210 ?auto_15212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15212 ?auto_15211 ?auto_15209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15217 - OBJ
      ?auto_15218 - OBJ
      ?auto_15219 - OBJ
      ?auto_15216 - LOCATION
    )
    :vars
    (
      ?auto_15222 - LOCATION
      ?auto_15221 - CITY
      ?auto_15220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15222 ?auto_15221 ) ( IN-CITY ?auto_15216 ?auto_15221 ) ( not ( = ?auto_15216 ?auto_15222 ) ) ( OBJ-AT ?auto_15217 ?auto_15216 ) ( not ( = ?auto_15217 ?auto_15218 ) ) ( OBJ-AT ?auto_15218 ?auto_15222 ) ( TRUCK-AT ?auto_15220 ?auto_15216 ) ( OBJ-AT ?auto_15219 ?auto_15216 ) ( not ( = ?auto_15217 ?auto_15219 ) ) ( not ( = ?auto_15218 ?auto_15219 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15217 ?auto_15218 ?auto_15216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15231 - OBJ
      ?auto_15232 - OBJ
      ?auto_15233 - OBJ
      ?auto_15230 - LOCATION
    )
    :vars
    (
      ?auto_15236 - LOCATION
      ?auto_15235 - CITY
      ?auto_15234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15236 ?auto_15235 ) ( IN-CITY ?auto_15230 ?auto_15235 ) ( not ( = ?auto_15230 ?auto_15236 ) ) ( OBJ-AT ?auto_15232 ?auto_15230 ) ( not ( = ?auto_15232 ?auto_15233 ) ) ( OBJ-AT ?auto_15233 ?auto_15236 ) ( TRUCK-AT ?auto_15234 ?auto_15230 ) ( OBJ-AT ?auto_15231 ?auto_15230 ) ( not ( = ?auto_15231 ?auto_15232 ) ) ( not ( = ?auto_15231 ?auto_15233 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15232 ?auto_15233 ?auto_15230 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15238 - OBJ
      ?auto_15239 - OBJ
      ?auto_15240 - OBJ
      ?auto_15237 - LOCATION
    )
    :vars
    (
      ?auto_15244 - LOCATION
      ?auto_15242 - CITY
      ?auto_15243 - OBJ
      ?auto_15241 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15244 ?auto_15242 ) ( IN-CITY ?auto_15237 ?auto_15242 ) ( not ( = ?auto_15237 ?auto_15244 ) ) ( OBJ-AT ?auto_15243 ?auto_15237 ) ( not ( = ?auto_15243 ?auto_15240 ) ) ( OBJ-AT ?auto_15240 ?auto_15244 ) ( TRUCK-AT ?auto_15241 ?auto_15237 ) ( OBJ-AT ?auto_15238 ?auto_15237 ) ( OBJ-AT ?auto_15239 ?auto_15237 ) ( not ( = ?auto_15238 ?auto_15239 ) ) ( not ( = ?auto_15238 ?auto_15240 ) ) ( not ( = ?auto_15238 ?auto_15243 ) ) ( not ( = ?auto_15239 ?auto_15240 ) ) ( not ( = ?auto_15239 ?auto_15243 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15243 ?auto_15240 ?auto_15237 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15246 - OBJ
      ?auto_15247 - OBJ
      ?auto_15248 - OBJ
      ?auto_15245 - LOCATION
    )
    :vars
    (
      ?auto_15251 - LOCATION
      ?auto_15250 - CITY
      ?auto_15249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15251 ?auto_15250 ) ( IN-CITY ?auto_15245 ?auto_15250 ) ( not ( = ?auto_15245 ?auto_15251 ) ) ( OBJ-AT ?auto_15248 ?auto_15245 ) ( not ( = ?auto_15248 ?auto_15247 ) ) ( OBJ-AT ?auto_15247 ?auto_15251 ) ( TRUCK-AT ?auto_15249 ?auto_15245 ) ( OBJ-AT ?auto_15246 ?auto_15245 ) ( not ( = ?auto_15246 ?auto_15247 ) ) ( not ( = ?auto_15246 ?auto_15248 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15248 ?auto_15247 ?auto_15245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15253 - OBJ
      ?auto_15254 - OBJ
      ?auto_15255 - OBJ
      ?auto_15252 - LOCATION
    )
    :vars
    (
      ?auto_15259 - LOCATION
      ?auto_15257 - CITY
      ?auto_15258 - OBJ
      ?auto_15256 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15259 ?auto_15257 ) ( IN-CITY ?auto_15252 ?auto_15257 ) ( not ( = ?auto_15252 ?auto_15259 ) ) ( OBJ-AT ?auto_15258 ?auto_15252 ) ( not ( = ?auto_15258 ?auto_15254 ) ) ( OBJ-AT ?auto_15254 ?auto_15259 ) ( TRUCK-AT ?auto_15256 ?auto_15252 ) ( OBJ-AT ?auto_15253 ?auto_15252 ) ( OBJ-AT ?auto_15255 ?auto_15252 ) ( not ( = ?auto_15253 ?auto_15254 ) ) ( not ( = ?auto_15253 ?auto_15255 ) ) ( not ( = ?auto_15253 ?auto_15258 ) ) ( not ( = ?auto_15254 ?auto_15255 ) ) ( not ( = ?auto_15255 ?auto_15258 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15258 ?auto_15254 ?auto_15252 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15269 - OBJ
      ?auto_15270 - OBJ
      ?auto_15271 - OBJ
      ?auto_15268 - LOCATION
    )
    :vars
    (
      ?auto_15274 - LOCATION
      ?auto_15273 - CITY
      ?auto_15272 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15274 ?auto_15273 ) ( IN-CITY ?auto_15268 ?auto_15273 ) ( not ( = ?auto_15268 ?auto_15274 ) ) ( OBJ-AT ?auto_15271 ?auto_15268 ) ( not ( = ?auto_15271 ?auto_15269 ) ) ( OBJ-AT ?auto_15269 ?auto_15274 ) ( TRUCK-AT ?auto_15272 ?auto_15268 ) ( OBJ-AT ?auto_15270 ?auto_15268 ) ( not ( = ?auto_15269 ?auto_15270 ) ) ( not ( = ?auto_15270 ?auto_15271 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15271 ?auto_15269 ?auto_15268 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15276 - OBJ
      ?auto_15277 - OBJ
      ?auto_15278 - OBJ
      ?auto_15275 - LOCATION
    )
    :vars
    (
      ?auto_15281 - LOCATION
      ?auto_15280 - CITY
      ?auto_15279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15281 ?auto_15280 ) ( IN-CITY ?auto_15275 ?auto_15280 ) ( not ( = ?auto_15275 ?auto_15281 ) ) ( OBJ-AT ?auto_15277 ?auto_15275 ) ( not ( = ?auto_15277 ?auto_15276 ) ) ( OBJ-AT ?auto_15276 ?auto_15281 ) ( TRUCK-AT ?auto_15279 ?auto_15275 ) ( OBJ-AT ?auto_15278 ?auto_15275 ) ( not ( = ?auto_15276 ?auto_15278 ) ) ( not ( = ?auto_15277 ?auto_15278 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15277 ?auto_15276 ?auto_15275 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15290 - OBJ
      ?auto_15291 - OBJ
      ?auto_15292 - OBJ
      ?auto_15289 - LOCATION
    )
    :vars
    (
      ?auto_15295 - LOCATION
      ?auto_15294 - CITY
      ?auto_15293 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15295 ?auto_15294 ) ( IN-CITY ?auto_15289 ?auto_15294 ) ( not ( = ?auto_15289 ?auto_15295 ) ) ( OBJ-AT ?auto_15292 ?auto_15289 ) ( not ( = ?auto_15292 ?auto_15290 ) ) ( OBJ-AT ?auto_15290 ?auto_15295 ) ( TRUCK-AT ?auto_15293 ?auto_15289 ) ( OBJ-AT ?auto_15291 ?auto_15289 ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15292 ?auto_15290 ?auto_15289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15297 - OBJ
      ?auto_15298 - OBJ
      ?auto_15299 - OBJ
      ?auto_15296 - LOCATION
    )
    :vars
    (
      ?auto_15303 - LOCATION
      ?auto_15301 - CITY
      ?auto_15302 - OBJ
      ?auto_15300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15303 ?auto_15301 ) ( IN-CITY ?auto_15296 ?auto_15301 ) ( not ( = ?auto_15296 ?auto_15303 ) ) ( OBJ-AT ?auto_15302 ?auto_15296 ) ( not ( = ?auto_15302 ?auto_15297 ) ) ( OBJ-AT ?auto_15297 ?auto_15303 ) ( TRUCK-AT ?auto_15300 ?auto_15296 ) ( OBJ-AT ?auto_15298 ?auto_15296 ) ( OBJ-AT ?auto_15299 ?auto_15296 ) ( not ( = ?auto_15297 ?auto_15298 ) ) ( not ( = ?auto_15297 ?auto_15299 ) ) ( not ( = ?auto_15298 ?auto_15299 ) ) ( not ( = ?auto_15298 ?auto_15302 ) ) ( not ( = ?auto_15299 ?auto_15302 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15302 ?auto_15297 ?auto_15296 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15336 - OBJ
      ?auto_15335 - LOCATION
    )
    :vars
    (
      ?auto_15340 - LOCATION
      ?auto_15338 - CITY
      ?auto_15339 - OBJ
      ?auto_15337 - TRUCK
      ?auto_15341 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15340 ?auto_15338 ) ( IN-CITY ?auto_15335 ?auto_15338 ) ( not ( = ?auto_15335 ?auto_15340 ) ) ( OBJ-AT ?auto_15339 ?auto_15335 ) ( not ( = ?auto_15339 ?auto_15336 ) ) ( OBJ-AT ?auto_15336 ?auto_15340 ) ( TRUCK-AT ?auto_15337 ?auto_15335 ) ( IN-TRUCK ?auto_15341 ?auto_15337 ) ( not ( = ?auto_15339 ?auto_15341 ) ) ( not ( = ?auto_15336 ?auto_15341 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15339 ?auto_15341 ?auto_15335 )
      ( DELIVER-2PKG ?auto_15339 ?auto_15336 ?auto_15335 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15343 - OBJ
      ?auto_15344 - OBJ
      ?auto_15342 - LOCATION
    )
    :vars
    (
      ?auto_15347 - LOCATION
      ?auto_15345 - CITY
      ?auto_15346 - TRUCK
      ?auto_15348 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15347 ?auto_15345 ) ( IN-CITY ?auto_15342 ?auto_15345 ) ( not ( = ?auto_15342 ?auto_15347 ) ) ( OBJ-AT ?auto_15343 ?auto_15342 ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( OBJ-AT ?auto_15344 ?auto_15347 ) ( TRUCK-AT ?auto_15346 ?auto_15342 ) ( IN-TRUCK ?auto_15348 ?auto_15346 ) ( not ( = ?auto_15343 ?auto_15348 ) ) ( not ( = ?auto_15344 ?auto_15348 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15344 ?auto_15342 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15350 - OBJ
      ?auto_15351 - OBJ
      ?auto_15349 - LOCATION
    )
    :vars
    (
      ?auto_15352 - LOCATION
      ?auto_15354 - CITY
      ?auto_15353 - OBJ
      ?auto_15355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15352 ?auto_15354 ) ( IN-CITY ?auto_15349 ?auto_15354 ) ( not ( = ?auto_15349 ?auto_15352 ) ) ( OBJ-AT ?auto_15353 ?auto_15349 ) ( not ( = ?auto_15353 ?auto_15351 ) ) ( OBJ-AT ?auto_15351 ?auto_15352 ) ( TRUCK-AT ?auto_15355 ?auto_15349 ) ( IN-TRUCK ?auto_15350 ?auto_15355 ) ( not ( = ?auto_15353 ?auto_15350 ) ) ( not ( = ?auto_15351 ?auto_15350 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15353 ?auto_15351 ?auto_15349 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15357 - OBJ
      ?auto_15358 - OBJ
      ?auto_15356 - LOCATION
    )
    :vars
    (
      ?auto_15359 - LOCATION
      ?auto_15361 - CITY
      ?auto_15362 - TRUCK
      ?auto_15360 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15359 ?auto_15361 ) ( IN-CITY ?auto_15356 ?auto_15361 ) ( not ( = ?auto_15356 ?auto_15359 ) ) ( OBJ-AT ?auto_15358 ?auto_15356 ) ( not ( = ?auto_15358 ?auto_15357 ) ) ( OBJ-AT ?auto_15357 ?auto_15359 ) ( TRUCK-AT ?auto_15362 ?auto_15356 ) ( IN-TRUCK ?auto_15360 ?auto_15362 ) ( not ( = ?auto_15358 ?auto_15360 ) ) ( not ( = ?auto_15357 ?auto_15360 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15358 ?auto_15357 ?auto_15356 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15364 - OBJ
      ?auto_15365 - OBJ
      ?auto_15363 - LOCATION
    )
    :vars
    (
      ?auto_15366 - LOCATION
      ?auto_15368 - CITY
      ?auto_15367 - OBJ
      ?auto_15369 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15366 ?auto_15368 ) ( IN-CITY ?auto_15363 ?auto_15368 ) ( not ( = ?auto_15363 ?auto_15366 ) ) ( OBJ-AT ?auto_15367 ?auto_15363 ) ( not ( = ?auto_15367 ?auto_15364 ) ) ( OBJ-AT ?auto_15364 ?auto_15366 ) ( TRUCK-AT ?auto_15369 ?auto_15363 ) ( IN-TRUCK ?auto_15365 ?auto_15369 ) ( not ( = ?auto_15367 ?auto_15365 ) ) ( not ( = ?auto_15364 ?auto_15365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15367 ?auto_15364 ?auto_15363 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15379 - OBJ
      ?auto_15380 - OBJ
      ?auto_15381 - OBJ
      ?auto_15378 - LOCATION
    )
    :vars
    (
      ?auto_15382 - LOCATION
      ?auto_15384 - CITY
      ?auto_15385 - TRUCK
      ?auto_15383 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15382 ?auto_15384 ) ( IN-CITY ?auto_15378 ?auto_15384 ) ( not ( = ?auto_15378 ?auto_15382 ) ) ( OBJ-AT ?auto_15379 ?auto_15378 ) ( not ( = ?auto_15379 ?auto_15381 ) ) ( OBJ-AT ?auto_15381 ?auto_15382 ) ( TRUCK-AT ?auto_15385 ?auto_15378 ) ( IN-TRUCK ?auto_15383 ?auto_15385 ) ( not ( = ?auto_15379 ?auto_15383 ) ) ( not ( = ?auto_15381 ?auto_15383 ) ) ( OBJ-AT ?auto_15380 ?auto_15378 ) ( not ( = ?auto_15379 ?auto_15380 ) ) ( not ( = ?auto_15380 ?auto_15381 ) ) ( not ( = ?auto_15380 ?auto_15383 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15379 ?auto_15381 ?auto_15378 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15387 - OBJ
      ?auto_15388 - OBJ
      ?auto_15389 - OBJ
      ?auto_15386 - LOCATION
    )
    :vars
    (
      ?auto_15390 - LOCATION
      ?auto_15391 - CITY
      ?auto_15392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15390 ?auto_15391 ) ( IN-CITY ?auto_15386 ?auto_15391 ) ( not ( = ?auto_15386 ?auto_15390 ) ) ( OBJ-AT ?auto_15387 ?auto_15386 ) ( not ( = ?auto_15387 ?auto_15389 ) ) ( OBJ-AT ?auto_15389 ?auto_15390 ) ( TRUCK-AT ?auto_15392 ?auto_15386 ) ( IN-TRUCK ?auto_15388 ?auto_15392 ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15389 ?auto_15388 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15387 ?auto_15389 ?auto_15386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15394 - OBJ
      ?auto_15395 - OBJ
      ?auto_15396 - OBJ
      ?auto_15393 - LOCATION
    )
    :vars
    (
      ?auto_15397 - LOCATION
      ?auto_15399 - CITY
      ?auto_15400 - TRUCK
      ?auto_15398 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15397 ?auto_15399 ) ( IN-CITY ?auto_15393 ?auto_15399 ) ( not ( = ?auto_15393 ?auto_15397 ) ) ( OBJ-AT ?auto_15396 ?auto_15393 ) ( not ( = ?auto_15396 ?auto_15395 ) ) ( OBJ-AT ?auto_15395 ?auto_15397 ) ( TRUCK-AT ?auto_15400 ?auto_15393 ) ( IN-TRUCK ?auto_15398 ?auto_15400 ) ( not ( = ?auto_15396 ?auto_15398 ) ) ( not ( = ?auto_15395 ?auto_15398 ) ) ( OBJ-AT ?auto_15394 ?auto_15393 ) ( not ( = ?auto_15394 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15398 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15396 ?auto_15395 ?auto_15393 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15402 - OBJ
      ?auto_15403 - OBJ
      ?auto_15404 - OBJ
      ?auto_15401 - LOCATION
    )
    :vars
    (
      ?auto_15405 - LOCATION
      ?auto_15406 - CITY
      ?auto_15407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15405 ?auto_15406 ) ( IN-CITY ?auto_15401 ?auto_15406 ) ( not ( = ?auto_15401 ?auto_15405 ) ) ( OBJ-AT ?auto_15402 ?auto_15401 ) ( not ( = ?auto_15402 ?auto_15403 ) ) ( OBJ-AT ?auto_15403 ?auto_15405 ) ( TRUCK-AT ?auto_15407 ?auto_15401 ) ( IN-TRUCK ?auto_15404 ?auto_15407 ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15403 ?auto_15404 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15402 ?auto_15403 ?auto_15401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15417 - OBJ
      ?auto_15418 - OBJ
      ?auto_15419 - OBJ
      ?auto_15416 - LOCATION
    )
    :vars
    (
      ?auto_15420 - LOCATION
      ?auto_15421 - CITY
      ?auto_15422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15420 ?auto_15421 ) ( IN-CITY ?auto_15416 ?auto_15421 ) ( not ( = ?auto_15416 ?auto_15420 ) ) ( OBJ-AT ?auto_15418 ?auto_15416 ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( OBJ-AT ?auto_15419 ?auto_15420 ) ( TRUCK-AT ?auto_15422 ?auto_15416 ) ( IN-TRUCK ?auto_15417 ?auto_15422 ) ( not ( = ?auto_15418 ?auto_15417 ) ) ( not ( = ?auto_15419 ?auto_15417 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15418 ?auto_15419 ?auto_15416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15432 - OBJ
      ?auto_15433 - OBJ
      ?auto_15434 - OBJ
      ?auto_15431 - LOCATION
    )
    :vars
    (
      ?auto_15435 - LOCATION
      ?auto_15436 - CITY
      ?auto_15437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15435 ?auto_15436 ) ( IN-CITY ?auto_15431 ?auto_15436 ) ( not ( = ?auto_15431 ?auto_15435 ) ) ( OBJ-AT ?auto_15434 ?auto_15431 ) ( not ( = ?auto_15434 ?auto_15433 ) ) ( OBJ-AT ?auto_15433 ?auto_15435 ) ( TRUCK-AT ?auto_15437 ?auto_15431 ) ( IN-TRUCK ?auto_15432 ?auto_15437 ) ( not ( = ?auto_15434 ?auto_15432 ) ) ( not ( = ?auto_15433 ?auto_15432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15434 ?auto_15433 ?auto_15431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15455 - OBJ
      ?auto_15456 - OBJ
      ?auto_15457 - OBJ
      ?auto_15454 - LOCATION
    )
    :vars
    (
      ?auto_15458 - LOCATION
      ?auto_15460 - CITY
      ?auto_15461 - TRUCK
      ?auto_15459 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_15458 ?auto_15460 ) ( IN-CITY ?auto_15454 ?auto_15460 ) ( not ( = ?auto_15454 ?auto_15458 ) ) ( OBJ-AT ?auto_15456 ?auto_15454 ) ( not ( = ?auto_15456 ?auto_15455 ) ) ( OBJ-AT ?auto_15455 ?auto_15458 ) ( TRUCK-AT ?auto_15461 ?auto_15454 ) ( IN-TRUCK ?auto_15459 ?auto_15461 ) ( not ( = ?auto_15456 ?auto_15459 ) ) ( not ( = ?auto_15455 ?auto_15459 ) ) ( OBJ-AT ?auto_15457 ?auto_15454 ) ( not ( = ?auto_15455 ?auto_15457 ) ) ( not ( = ?auto_15456 ?auto_15457 ) ) ( not ( = ?auto_15457 ?auto_15459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15456 ?auto_15455 ?auto_15454 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15463 - OBJ
      ?auto_15464 - OBJ
      ?auto_15465 - OBJ
      ?auto_15462 - LOCATION
    )
    :vars
    (
      ?auto_15466 - LOCATION
      ?auto_15467 - CITY
      ?auto_15468 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15466 ?auto_15467 ) ( IN-CITY ?auto_15462 ?auto_15467 ) ( not ( = ?auto_15462 ?auto_15466 ) ) ( OBJ-AT ?auto_15464 ?auto_15462 ) ( not ( = ?auto_15464 ?auto_15463 ) ) ( OBJ-AT ?auto_15463 ?auto_15466 ) ( TRUCK-AT ?auto_15468 ?auto_15462 ) ( IN-TRUCK ?auto_15465 ?auto_15468 ) ( not ( = ?auto_15464 ?auto_15465 ) ) ( not ( = ?auto_15463 ?auto_15465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15464 ?auto_15463 ?auto_15462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15478 - OBJ
      ?auto_15479 - OBJ
      ?auto_15480 - OBJ
      ?auto_15477 - LOCATION
    )
    :vars
    (
      ?auto_15481 - LOCATION
      ?auto_15482 - CITY
      ?auto_15483 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15481 ?auto_15482 ) ( IN-CITY ?auto_15477 ?auto_15482 ) ( not ( = ?auto_15477 ?auto_15481 ) ) ( OBJ-AT ?auto_15480 ?auto_15477 ) ( not ( = ?auto_15480 ?auto_15478 ) ) ( OBJ-AT ?auto_15478 ?auto_15481 ) ( TRUCK-AT ?auto_15483 ?auto_15477 ) ( IN-TRUCK ?auto_15479 ?auto_15483 ) ( not ( = ?auto_15480 ?auto_15479 ) ) ( not ( = ?auto_15478 ?auto_15479 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15480 ?auto_15478 ?auto_15477 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15526 - OBJ
      ?auto_15525 - LOCATION
    )
    :vars
    (
      ?auto_15527 - LOCATION
      ?auto_15530 - CITY
      ?auto_15528 - OBJ
      ?auto_15529 - OBJ
      ?auto_15531 - TRUCK
      ?auto_15532 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15527 ?auto_15530 ) ( IN-CITY ?auto_15525 ?auto_15530 ) ( not ( = ?auto_15525 ?auto_15527 ) ) ( OBJ-AT ?auto_15528 ?auto_15525 ) ( not ( = ?auto_15528 ?auto_15526 ) ) ( OBJ-AT ?auto_15526 ?auto_15527 ) ( IN-TRUCK ?auto_15529 ?auto_15531 ) ( not ( = ?auto_15528 ?auto_15529 ) ) ( not ( = ?auto_15526 ?auto_15529 ) ) ( TRUCK-AT ?auto_15531 ?auto_15532 ) ( IN-CITY ?auto_15532 ?auto_15530 ) ( not ( = ?auto_15525 ?auto_15532 ) ) ( not ( = ?auto_15527 ?auto_15532 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15531 ?auto_15532 ?auto_15525 ?auto_15530 )
      ( DELIVER-2PKG ?auto_15528 ?auto_15526 ?auto_15525 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15534 - OBJ
      ?auto_15535 - OBJ
      ?auto_15533 - LOCATION
    )
    :vars
    (
      ?auto_15538 - LOCATION
      ?auto_15537 - CITY
      ?auto_15539 - OBJ
      ?auto_15536 - TRUCK
      ?auto_15540 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15538 ?auto_15537 ) ( IN-CITY ?auto_15533 ?auto_15537 ) ( not ( = ?auto_15533 ?auto_15538 ) ) ( OBJ-AT ?auto_15534 ?auto_15533 ) ( not ( = ?auto_15534 ?auto_15535 ) ) ( OBJ-AT ?auto_15535 ?auto_15538 ) ( IN-TRUCK ?auto_15539 ?auto_15536 ) ( not ( = ?auto_15534 ?auto_15539 ) ) ( not ( = ?auto_15535 ?auto_15539 ) ) ( TRUCK-AT ?auto_15536 ?auto_15540 ) ( IN-CITY ?auto_15540 ?auto_15537 ) ( not ( = ?auto_15533 ?auto_15540 ) ) ( not ( = ?auto_15538 ?auto_15540 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15535 ?auto_15533 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15542 - OBJ
      ?auto_15543 - OBJ
      ?auto_15541 - LOCATION
    )
    :vars
    (
      ?auto_15544 - LOCATION
      ?auto_15546 - CITY
      ?auto_15548 - OBJ
      ?auto_15545 - TRUCK
      ?auto_15547 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15544 ?auto_15546 ) ( IN-CITY ?auto_15541 ?auto_15546 ) ( not ( = ?auto_15541 ?auto_15544 ) ) ( OBJ-AT ?auto_15548 ?auto_15541 ) ( not ( = ?auto_15548 ?auto_15543 ) ) ( OBJ-AT ?auto_15543 ?auto_15544 ) ( IN-TRUCK ?auto_15542 ?auto_15545 ) ( not ( = ?auto_15548 ?auto_15542 ) ) ( not ( = ?auto_15543 ?auto_15542 ) ) ( TRUCK-AT ?auto_15545 ?auto_15547 ) ( IN-CITY ?auto_15547 ?auto_15546 ) ( not ( = ?auto_15541 ?auto_15547 ) ) ( not ( = ?auto_15544 ?auto_15547 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15548 ?auto_15543 ?auto_15541 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15550 - OBJ
      ?auto_15551 - OBJ
      ?auto_15549 - LOCATION
    )
    :vars
    (
      ?auto_15552 - LOCATION
      ?auto_15554 - CITY
      ?auto_15556 - OBJ
      ?auto_15553 - TRUCK
      ?auto_15555 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15552 ?auto_15554 ) ( IN-CITY ?auto_15549 ?auto_15554 ) ( not ( = ?auto_15549 ?auto_15552 ) ) ( OBJ-AT ?auto_15551 ?auto_15549 ) ( not ( = ?auto_15551 ?auto_15550 ) ) ( OBJ-AT ?auto_15550 ?auto_15552 ) ( IN-TRUCK ?auto_15556 ?auto_15553 ) ( not ( = ?auto_15551 ?auto_15556 ) ) ( not ( = ?auto_15550 ?auto_15556 ) ) ( TRUCK-AT ?auto_15553 ?auto_15555 ) ( IN-CITY ?auto_15555 ?auto_15554 ) ( not ( = ?auto_15549 ?auto_15555 ) ) ( not ( = ?auto_15552 ?auto_15555 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15551 ?auto_15550 ?auto_15549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15558 - OBJ
      ?auto_15559 - OBJ
      ?auto_15557 - LOCATION
    )
    :vars
    (
      ?auto_15560 - LOCATION
      ?auto_15562 - CITY
      ?auto_15564 - OBJ
      ?auto_15561 - TRUCK
      ?auto_15563 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15560 ?auto_15562 ) ( IN-CITY ?auto_15557 ?auto_15562 ) ( not ( = ?auto_15557 ?auto_15560 ) ) ( OBJ-AT ?auto_15564 ?auto_15557 ) ( not ( = ?auto_15564 ?auto_15558 ) ) ( OBJ-AT ?auto_15558 ?auto_15560 ) ( IN-TRUCK ?auto_15559 ?auto_15561 ) ( not ( = ?auto_15564 ?auto_15559 ) ) ( not ( = ?auto_15558 ?auto_15559 ) ) ( TRUCK-AT ?auto_15561 ?auto_15563 ) ( IN-CITY ?auto_15563 ?auto_15562 ) ( not ( = ?auto_15557 ?auto_15563 ) ) ( not ( = ?auto_15560 ?auto_15563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15564 ?auto_15558 ?auto_15557 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15575 - OBJ
      ?auto_15576 - OBJ
      ?auto_15577 - OBJ
      ?auto_15574 - LOCATION
    )
    :vars
    (
      ?auto_15578 - LOCATION
      ?auto_15580 - CITY
      ?auto_15582 - OBJ
      ?auto_15579 - TRUCK
      ?auto_15581 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15578 ?auto_15580 ) ( IN-CITY ?auto_15574 ?auto_15580 ) ( not ( = ?auto_15574 ?auto_15578 ) ) ( OBJ-AT ?auto_15576 ?auto_15574 ) ( not ( = ?auto_15576 ?auto_15577 ) ) ( OBJ-AT ?auto_15577 ?auto_15578 ) ( IN-TRUCK ?auto_15582 ?auto_15579 ) ( not ( = ?auto_15576 ?auto_15582 ) ) ( not ( = ?auto_15577 ?auto_15582 ) ) ( TRUCK-AT ?auto_15579 ?auto_15581 ) ( IN-CITY ?auto_15581 ?auto_15580 ) ( not ( = ?auto_15574 ?auto_15581 ) ) ( not ( = ?auto_15578 ?auto_15581 ) ) ( OBJ-AT ?auto_15575 ?auto_15574 ) ( not ( = ?auto_15575 ?auto_15576 ) ) ( not ( = ?auto_15575 ?auto_15577 ) ) ( not ( = ?auto_15575 ?auto_15582 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15576 ?auto_15577 ?auto_15574 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15584 - OBJ
      ?auto_15585 - OBJ
      ?auto_15586 - OBJ
      ?auto_15583 - LOCATION
    )
    :vars
    (
      ?auto_15587 - LOCATION
      ?auto_15589 - CITY
      ?auto_15588 - TRUCK
      ?auto_15590 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15587 ?auto_15589 ) ( IN-CITY ?auto_15583 ?auto_15589 ) ( not ( = ?auto_15583 ?auto_15587 ) ) ( OBJ-AT ?auto_15584 ?auto_15583 ) ( not ( = ?auto_15584 ?auto_15586 ) ) ( OBJ-AT ?auto_15586 ?auto_15587 ) ( IN-TRUCK ?auto_15585 ?auto_15588 ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15586 ?auto_15585 ) ) ( TRUCK-AT ?auto_15588 ?auto_15590 ) ( IN-CITY ?auto_15590 ?auto_15589 ) ( not ( = ?auto_15583 ?auto_15590 ) ) ( not ( = ?auto_15587 ?auto_15590 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15584 ?auto_15586 ?auto_15583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15592 - OBJ
      ?auto_15593 - OBJ
      ?auto_15594 - OBJ
      ?auto_15591 - LOCATION
    )
    :vars
    (
      ?auto_15595 - LOCATION
      ?auto_15597 - CITY
      ?auto_15599 - OBJ
      ?auto_15596 - TRUCK
      ?auto_15598 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15595 ?auto_15597 ) ( IN-CITY ?auto_15591 ?auto_15597 ) ( not ( = ?auto_15591 ?auto_15595 ) ) ( OBJ-AT ?auto_15594 ?auto_15591 ) ( not ( = ?auto_15594 ?auto_15593 ) ) ( OBJ-AT ?auto_15593 ?auto_15595 ) ( IN-TRUCK ?auto_15599 ?auto_15596 ) ( not ( = ?auto_15594 ?auto_15599 ) ) ( not ( = ?auto_15593 ?auto_15599 ) ) ( TRUCK-AT ?auto_15596 ?auto_15598 ) ( IN-CITY ?auto_15598 ?auto_15597 ) ( not ( = ?auto_15591 ?auto_15598 ) ) ( not ( = ?auto_15595 ?auto_15598 ) ) ( OBJ-AT ?auto_15592 ?auto_15591 ) ( not ( = ?auto_15592 ?auto_15593 ) ) ( not ( = ?auto_15592 ?auto_15594 ) ) ( not ( = ?auto_15592 ?auto_15599 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15594 ?auto_15593 ?auto_15591 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15601 - OBJ
      ?auto_15602 - OBJ
      ?auto_15603 - OBJ
      ?auto_15600 - LOCATION
    )
    :vars
    (
      ?auto_15604 - LOCATION
      ?auto_15606 - CITY
      ?auto_15605 - TRUCK
      ?auto_15607 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15604 ?auto_15606 ) ( IN-CITY ?auto_15600 ?auto_15606 ) ( not ( = ?auto_15600 ?auto_15604 ) ) ( OBJ-AT ?auto_15601 ?auto_15600 ) ( not ( = ?auto_15601 ?auto_15602 ) ) ( OBJ-AT ?auto_15602 ?auto_15604 ) ( IN-TRUCK ?auto_15603 ?auto_15605 ) ( not ( = ?auto_15601 ?auto_15603 ) ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( TRUCK-AT ?auto_15605 ?auto_15607 ) ( IN-CITY ?auto_15607 ?auto_15606 ) ( not ( = ?auto_15600 ?auto_15607 ) ) ( not ( = ?auto_15604 ?auto_15607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15601 ?auto_15602 ?auto_15600 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15618 - OBJ
      ?auto_15619 - OBJ
      ?auto_15620 - OBJ
      ?auto_15617 - LOCATION
    )
    :vars
    (
      ?auto_15621 - LOCATION
      ?auto_15623 - CITY
      ?auto_15622 - TRUCK
      ?auto_15624 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15621 ?auto_15623 ) ( IN-CITY ?auto_15617 ?auto_15623 ) ( not ( = ?auto_15617 ?auto_15621 ) ) ( OBJ-AT ?auto_15619 ?auto_15617 ) ( not ( = ?auto_15619 ?auto_15620 ) ) ( OBJ-AT ?auto_15620 ?auto_15621 ) ( IN-TRUCK ?auto_15618 ?auto_15622 ) ( not ( = ?auto_15619 ?auto_15618 ) ) ( not ( = ?auto_15620 ?auto_15618 ) ) ( TRUCK-AT ?auto_15622 ?auto_15624 ) ( IN-CITY ?auto_15624 ?auto_15623 ) ( not ( = ?auto_15617 ?auto_15624 ) ) ( not ( = ?auto_15621 ?auto_15624 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15619 ?auto_15620 ?auto_15617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15635 - OBJ
      ?auto_15636 - OBJ
      ?auto_15637 - OBJ
      ?auto_15634 - LOCATION
    )
    :vars
    (
      ?auto_15638 - LOCATION
      ?auto_15640 - CITY
      ?auto_15639 - TRUCK
      ?auto_15641 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15638 ?auto_15640 ) ( IN-CITY ?auto_15634 ?auto_15640 ) ( not ( = ?auto_15634 ?auto_15638 ) ) ( OBJ-AT ?auto_15637 ?auto_15634 ) ( not ( = ?auto_15637 ?auto_15636 ) ) ( OBJ-AT ?auto_15636 ?auto_15638 ) ( IN-TRUCK ?auto_15635 ?auto_15639 ) ( not ( = ?auto_15637 ?auto_15635 ) ) ( not ( = ?auto_15636 ?auto_15635 ) ) ( TRUCK-AT ?auto_15639 ?auto_15641 ) ( IN-CITY ?auto_15641 ?auto_15640 ) ( not ( = ?auto_15634 ?auto_15641 ) ) ( not ( = ?auto_15638 ?auto_15641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15637 ?auto_15636 ?auto_15634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15661 - OBJ
      ?auto_15662 - OBJ
      ?auto_15663 - OBJ
      ?auto_15660 - LOCATION
    )
    :vars
    (
      ?auto_15664 - LOCATION
      ?auto_15666 - CITY
      ?auto_15668 - OBJ
      ?auto_15665 - TRUCK
      ?auto_15667 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15664 ?auto_15666 ) ( IN-CITY ?auto_15660 ?auto_15666 ) ( not ( = ?auto_15660 ?auto_15664 ) ) ( OBJ-AT ?auto_15663 ?auto_15660 ) ( not ( = ?auto_15663 ?auto_15661 ) ) ( OBJ-AT ?auto_15661 ?auto_15664 ) ( IN-TRUCK ?auto_15668 ?auto_15665 ) ( not ( = ?auto_15663 ?auto_15668 ) ) ( not ( = ?auto_15661 ?auto_15668 ) ) ( TRUCK-AT ?auto_15665 ?auto_15667 ) ( IN-CITY ?auto_15667 ?auto_15666 ) ( not ( = ?auto_15660 ?auto_15667 ) ) ( not ( = ?auto_15664 ?auto_15667 ) ) ( OBJ-AT ?auto_15662 ?auto_15660 ) ( not ( = ?auto_15661 ?auto_15662 ) ) ( not ( = ?auto_15662 ?auto_15663 ) ) ( not ( = ?auto_15662 ?auto_15668 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15663 ?auto_15661 ?auto_15660 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15670 - OBJ
      ?auto_15671 - OBJ
      ?auto_15672 - OBJ
      ?auto_15669 - LOCATION
    )
    :vars
    (
      ?auto_15673 - LOCATION
      ?auto_15675 - CITY
      ?auto_15674 - TRUCK
      ?auto_15676 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15673 ?auto_15675 ) ( IN-CITY ?auto_15669 ?auto_15675 ) ( not ( = ?auto_15669 ?auto_15673 ) ) ( OBJ-AT ?auto_15671 ?auto_15669 ) ( not ( = ?auto_15671 ?auto_15670 ) ) ( OBJ-AT ?auto_15670 ?auto_15673 ) ( IN-TRUCK ?auto_15672 ?auto_15674 ) ( not ( = ?auto_15671 ?auto_15672 ) ) ( not ( = ?auto_15670 ?auto_15672 ) ) ( TRUCK-AT ?auto_15674 ?auto_15676 ) ( IN-CITY ?auto_15676 ?auto_15675 ) ( not ( = ?auto_15669 ?auto_15676 ) ) ( not ( = ?auto_15673 ?auto_15676 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15671 ?auto_15670 ?auto_15669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15687 - OBJ
      ?auto_15688 - OBJ
      ?auto_15689 - OBJ
      ?auto_15686 - LOCATION
    )
    :vars
    (
      ?auto_15690 - LOCATION
      ?auto_15692 - CITY
      ?auto_15691 - TRUCK
      ?auto_15693 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15690 ?auto_15692 ) ( IN-CITY ?auto_15686 ?auto_15692 ) ( not ( = ?auto_15686 ?auto_15690 ) ) ( OBJ-AT ?auto_15689 ?auto_15686 ) ( not ( = ?auto_15689 ?auto_15687 ) ) ( OBJ-AT ?auto_15687 ?auto_15690 ) ( IN-TRUCK ?auto_15688 ?auto_15691 ) ( not ( = ?auto_15689 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( TRUCK-AT ?auto_15691 ?auto_15693 ) ( IN-CITY ?auto_15693 ?auto_15692 ) ( not ( = ?auto_15686 ?auto_15693 ) ) ( not ( = ?auto_15690 ?auto_15693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15689 ?auto_15687 ?auto_15686 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15741 - OBJ
      ?auto_15740 - LOCATION
    )
    :vars
    (
      ?auto_15742 - LOCATION
      ?auto_15744 - CITY
      ?auto_15746 - OBJ
      ?auto_15747 - OBJ
      ?auto_15743 - TRUCK
      ?auto_15745 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15742 ?auto_15744 ) ( IN-CITY ?auto_15740 ?auto_15744 ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( OBJ-AT ?auto_15746 ?auto_15740 ) ( not ( = ?auto_15746 ?auto_15741 ) ) ( OBJ-AT ?auto_15741 ?auto_15742 ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( not ( = ?auto_15741 ?auto_15747 ) ) ( TRUCK-AT ?auto_15743 ?auto_15745 ) ( IN-CITY ?auto_15745 ?auto_15744 ) ( not ( = ?auto_15740 ?auto_15745 ) ) ( not ( = ?auto_15742 ?auto_15745 ) ) ( OBJ-AT ?auto_15747 ?auto_15745 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15747 ?auto_15743 ?auto_15745 )
      ( DELIVER-2PKG ?auto_15746 ?auto_15741 ?auto_15740 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15749 - OBJ
      ?auto_15750 - OBJ
      ?auto_15748 - LOCATION
    )
    :vars
    (
      ?auto_15753 - LOCATION
      ?auto_15754 - CITY
      ?auto_15755 - OBJ
      ?auto_15752 - TRUCK
      ?auto_15751 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15753 ?auto_15754 ) ( IN-CITY ?auto_15748 ?auto_15754 ) ( not ( = ?auto_15748 ?auto_15753 ) ) ( OBJ-AT ?auto_15749 ?auto_15748 ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( OBJ-AT ?auto_15750 ?auto_15753 ) ( not ( = ?auto_15749 ?auto_15755 ) ) ( not ( = ?auto_15750 ?auto_15755 ) ) ( TRUCK-AT ?auto_15752 ?auto_15751 ) ( IN-CITY ?auto_15751 ?auto_15754 ) ( not ( = ?auto_15748 ?auto_15751 ) ) ( not ( = ?auto_15753 ?auto_15751 ) ) ( OBJ-AT ?auto_15755 ?auto_15751 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15750 ?auto_15748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15757 - OBJ
      ?auto_15758 - OBJ
      ?auto_15756 - LOCATION
    )
    :vars
    (
      ?auto_15759 - LOCATION
      ?auto_15761 - CITY
      ?auto_15763 - OBJ
      ?auto_15760 - TRUCK
      ?auto_15762 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15759 ?auto_15761 ) ( IN-CITY ?auto_15756 ?auto_15761 ) ( not ( = ?auto_15756 ?auto_15759 ) ) ( OBJ-AT ?auto_15763 ?auto_15756 ) ( not ( = ?auto_15763 ?auto_15758 ) ) ( OBJ-AT ?auto_15758 ?auto_15759 ) ( not ( = ?auto_15763 ?auto_15757 ) ) ( not ( = ?auto_15758 ?auto_15757 ) ) ( TRUCK-AT ?auto_15760 ?auto_15762 ) ( IN-CITY ?auto_15762 ?auto_15761 ) ( not ( = ?auto_15756 ?auto_15762 ) ) ( not ( = ?auto_15759 ?auto_15762 ) ) ( OBJ-AT ?auto_15757 ?auto_15762 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15763 ?auto_15758 ?auto_15756 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15765 - OBJ
      ?auto_15766 - OBJ
      ?auto_15764 - LOCATION
    )
    :vars
    (
      ?auto_15767 - LOCATION
      ?auto_15770 - CITY
      ?auto_15769 - OBJ
      ?auto_15768 - TRUCK
      ?auto_15771 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15767 ?auto_15770 ) ( IN-CITY ?auto_15764 ?auto_15770 ) ( not ( = ?auto_15764 ?auto_15767 ) ) ( OBJ-AT ?auto_15766 ?auto_15764 ) ( not ( = ?auto_15766 ?auto_15765 ) ) ( OBJ-AT ?auto_15765 ?auto_15767 ) ( not ( = ?auto_15766 ?auto_15769 ) ) ( not ( = ?auto_15765 ?auto_15769 ) ) ( TRUCK-AT ?auto_15768 ?auto_15771 ) ( IN-CITY ?auto_15771 ?auto_15770 ) ( not ( = ?auto_15764 ?auto_15771 ) ) ( not ( = ?auto_15767 ?auto_15771 ) ) ( OBJ-AT ?auto_15769 ?auto_15771 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15766 ?auto_15765 ?auto_15764 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15773 - OBJ
      ?auto_15774 - OBJ
      ?auto_15772 - LOCATION
    )
    :vars
    (
      ?auto_15775 - LOCATION
      ?auto_15777 - CITY
      ?auto_15779 - OBJ
      ?auto_15776 - TRUCK
      ?auto_15778 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15775 ?auto_15777 ) ( IN-CITY ?auto_15772 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15775 ) ) ( OBJ-AT ?auto_15779 ?auto_15772 ) ( not ( = ?auto_15779 ?auto_15773 ) ) ( OBJ-AT ?auto_15773 ?auto_15775 ) ( not ( = ?auto_15779 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( TRUCK-AT ?auto_15776 ?auto_15778 ) ( IN-CITY ?auto_15778 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( OBJ-AT ?auto_15774 ?auto_15778 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15779 ?auto_15773 ?auto_15772 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15790 - OBJ
      ?auto_15791 - OBJ
      ?auto_15792 - OBJ
      ?auto_15789 - LOCATION
    )
    :vars
    (
      ?auto_15793 - LOCATION
      ?auto_15796 - CITY
      ?auto_15795 - OBJ
      ?auto_15794 - TRUCK
      ?auto_15797 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15793 ?auto_15796 ) ( IN-CITY ?auto_15789 ?auto_15796 ) ( not ( = ?auto_15789 ?auto_15793 ) ) ( OBJ-AT ?auto_15790 ?auto_15789 ) ( not ( = ?auto_15790 ?auto_15792 ) ) ( OBJ-AT ?auto_15792 ?auto_15793 ) ( not ( = ?auto_15790 ?auto_15795 ) ) ( not ( = ?auto_15792 ?auto_15795 ) ) ( TRUCK-AT ?auto_15794 ?auto_15797 ) ( IN-CITY ?auto_15797 ?auto_15796 ) ( not ( = ?auto_15789 ?auto_15797 ) ) ( not ( = ?auto_15793 ?auto_15797 ) ) ( OBJ-AT ?auto_15795 ?auto_15797 ) ( OBJ-AT ?auto_15791 ?auto_15789 ) ( not ( = ?auto_15790 ?auto_15791 ) ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( not ( = ?auto_15791 ?auto_15795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15790 ?auto_15792 ?auto_15789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15799 - OBJ
      ?auto_15800 - OBJ
      ?auto_15801 - OBJ
      ?auto_15798 - LOCATION
    )
    :vars
    (
      ?auto_15802 - LOCATION
      ?auto_15804 - CITY
      ?auto_15803 - TRUCK
      ?auto_15805 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15802 ?auto_15804 ) ( IN-CITY ?auto_15798 ?auto_15804 ) ( not ( = ?auto_15798 ?auto_15802 ) ) ( OBJ-AT ?auto_15799 ?auto_15798 ) ( not ( = ?auto_15799 ?auto_15801 ) ) ( OBJ-AT ?auto_15801 ?auto_15802 ) ( not ( = ?auto_15799 ?auto_15800 ) ) ( not ( = ?auto_15801 ?auto_15800 ) ) ( TRUCK-AT ?auto_15803 ?auto_15805 ) ( IN-CITY ?auto_15805 ?auto_15804 ) ( not ( = ?auto_15798 ?auto_15805 ) ) ( not ( = ?auto_15802 ?auto_15805 ) ) ( OBJ-AT ?auto_15800 ?auto_15805 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15799 ?auto_15801 ?auto_15798 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15807 - OBJ
      ?auto_15808 - OBJ
      ?auto_15809 - OBJ
      ?auto_15806 - LOCATION
    )
    :vars
    (
      ?auto_15810 - LOCATION
      ?auto_15813 - CITY
      ?auto_15812 - OBJ
      ?auto_15811 - TRUCK
      ?auto_15814 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15810 ?auto_15813 ) ( IN-CITY ?auto_15806 ?auto_15813 ) ( not ( = ?auto_15806 ?auto_15810 ) ) ( OBJ-AT ?auto_15809 ?auto_15806 ) ( not ( = ?auto_15809 ?auto_15808 ) ) ( OBJ-AT ?auto_15808 ?auto_15810 ) ( not ( = ?auto_15809 ?auto_15812 ) ) ( not ( = ?auto_15808 ?auto_15812 ) ) ( TRUCK-AT ?auto_15811 ?auto_15814 ) ( IN-CITY ?auto_15814 ?auto_15813 ) ( not ( = ?auto_15806 ?auto_15814 ) ) ( not ( = ?auto_15810 ?auto_15814 ) ) ( OBJ-AT ?auto_15812 ?auto_15814 ) ( OBJ-AT ?auto_15807 ?auto_15806 ) ( not ( = ?auto_15807 ?auto_15808 ) ) ( not ( = ?auto_15807 ?auto_15809 ) ) ( not ( = ?auto_15807 ?auto_15812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15809 ?auto_15808 ?auto_15806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15816 - OBJ
      ?auto_15817 - OBJ
      ?auto_15818 - OBJ
      ?auto_15815 - LOCATION
    )
    :vars
    (
      ?auto_15819 - LOCATION
      ?auto_15821 - CITY
      ?auto_15820 - TRUCK
      ?auto_15822 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15819 ?auto_15821 ) ( IN-CITY ?auto_15815 ?auto_15821 ) ( not ( = ?auto_15815 ?auto_15819 ) ) ( OBJ-AT ?auto_15816 ?auto_15815 ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( OBJ-AT ?auto_15817 ?auto_15819 ) ( not ( = ?auto_15816 ?auto_15818 ) ) ( not ( = ?auto_15817 ?auto_15818 ) ) ( TRUCK-AT ?auto_15820 ?auto_15822 ) ( IN-CITY ?auto_15822 ?auto_15821 ) ( not ( = ?auto_15815 ?auto_15822 ) ) ( not ( = ?auto_15819 ?auto_15822 ) ) ( OBJ-AT ?auto_15818 ?auto_15822 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15816 ?auto_15817 ?auto_15815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15833 - OBJ
      ?auto_15834 - OBJ
      ?auto_15835 - OBJ
      ?auto_15832 - LOCATION
    )
    :vars
    (
      ?auto_15836 - LOCATION
      ?auto_15838 - CITY
      ?auto_15837 - TRUCK
      ?auto_15839 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15836 ?auto_15838 ) ( IN-CITY ?auto_15832 ?auto_15838 ) ( not ( = ?auto_15832 ?auto_15836 ) ) ( OBJ-AT ?auto_15834 ?auto_15832 ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( OBJ-AT ?auto_15835 ?auto_15836 ) ( not ( = ?auto_15834 ?auto_15833 ) ) ( not ( = ?auto_15835 ?auto_15833 ) ) ( TRUCK-AT ?auto_15837 ?auto_15839 ) ( IN-CITY ?auto_15839 ?auto_15838 ) ( not ( = ?auto_15832 ?auto_15839 ) ) ( not ( = ?auto_15836 ?auto_15839 ) ) ( OBJ-AT ?auto_15833 ?auto_15839 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15834 ?auto_15835 ?auto_15832 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15850 - OBJ
      ?auto_15851 - OBJ
      ?auto_15852 - OBJ
      ?auto_15849 - LOCATION
    )
    :vars
    (
      ?auto_15853 - LOCATION
      ?auto_15855 - CITY
      ?auto_15854 - TRUCK
      ?auto_15856 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15853 ?auto_15855 ) ( IN-CITY ?auto_15849 ?auto_15855 ) ( not ( = ?auto_15849 ?auto_15853 ) ) ( OBJ-AT ?auto_15852 ?auto_15849 ) ( not ( = ?auto_15852 ?auto_15851 ) ) ( OBJ-AT ?auto_15851 ?auto_15853 ) ( not ( = ?auto_15852 ?auto_15850 ) ) ( not ( = ?auto_15851 ?auto_15850 ) ) ( TRUCK-AT ?auto_15854 ?auto_15856 ) ( IN-CITY ?auto_15856 ?auto_15855 ) ( not ( = ?auto_15849 ?auto_15856 ) ) ( not ( = ?auto_15853 ?auto_15856 ) ) ( OBJ-AT ?auto_15850 ?auto_15856 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15852 ?auto_15851 ?auto_15849 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15876 - OBJ
      ?auto_15877 - OBJ
      ?auto_15878 - OBJ
      ?auto_15875 - LOCATION
    )
    :vars
    (
      ?auto_15879 - LOCATION
      ?auto_15882 - CITY
      ?auto_15881 - OBJ
      ?auto_15880 - TRUCK
      ?auto_15883 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15879 ?auto_15882 ) ( IN-CITY ?auto_15875 ?auto_15882 ) ( not ( = ?auto_15875 ?auto_15879 ) ) ( OBJ-AT ?auto_15878 ?auto_15875 ) ( not ( = ?auto_15878 ?auto_15876 ) ) ( OBJ-AT ?auto_15876 ?auto_15879 ) ( not ( = ?auto_15878 ?auto_15881 ) ) ( not ( = ?auto_15876 ?auto_15881 ) ) ( TRUCK-AT ?auto_15880 ?auto_15883 ) ( IN-CITY ?auto_15883 ?auto_15882 ) ( not ( = ?auto_15875 ?auto_15883 ) ) ( not ( = ?auto_15879 ?auto_15883 ) ) ( OBJ-AT ?auto_15881 ?auto_15883 ) ( OBJ-AT ?auto_15877 ?auto_15875 ) ( not ( = ?auto_15876 ?auto_15877 ) ) ( not ( = ?auto_15877 ?auto_15878 ) ) ( not ( = ?auto_15877 ?auto_15881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15878 ?auto_15876 ?auto_15875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15885 - OBJ
      ?auto_15886 - OBJ
      ?auto_15887 - OBJ
      ?auto_15884 - LOCATION
    )
    :vars
    (
      ?auto_15888 - LOCATION
      ?auto_15890 - CITY
      ?auto_15889 - TRUCK
      ?auto_15891 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15888 ?auto_15890 ) ( IN-CITY ?auto_15884 ?auto_15890 ) ( not ( = ?auto_15884 ?auto_15888 ) ) ( OBJ-AT ?auto_15886 ?auto_15884 ) ( not ( = ?auto_15886 ?auto_15885 ) ) ( OBJ-AT ?auto_15885 ?auto_15888 ) ( not ( = ?auto_15886 ?auto_15887 ) ) ( not ( = ?auto_15885 ?auto_15887 ) ) ( TRUCK-AT ?auto_15889 ?auto_15891 ) ( IN-CITY ?auto_15891 ?auto_15890 ) ( not ( = ?auto_15884 ?auto_15891 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( OBJ-AT ?auto_15887 ?auto_15891 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15886 ?auto_15885 ?auto_15884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15902 - OBJ
      ?auto_15903 - OBJ
      ?auto_15904 - OBJ
      ?auto_15901 - LOCATION
    )
    :vars
    (
      ?auto_15905 - LOCATION
      ?auto_15907 - CITY
      ?auto_15906 - TRUCK
      ?auto_15908 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_15905 ?auto_15907 ) ( IN-CITY ?auto_15901 ?auto_15907 ) ( not ( = ?auto_15901 ?auto_15905 ) ) ( OBJ-AT ?auto_15904 ?auto_15901 ) ( not ( = ?auto_15904 ?auto_15902 ) ) ( OBJ-AT ?auto_15902 ?auto_15905 ) ( not ( = ?auto_15904 ?auto_15903 ) ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( TRUCK-AT ?auto_15906 ?auto_15908 ) ( IN-CITY ?auto_15908 ?auto_15907 ) ( not ( = ?auto_15901 ?auto_15908 ) ) ( not ( = ?auto_15905 ?auto_15908 ) ) ( OBJ-AT ?auto_15903 ?auto_15908 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15904 ?auto_15902 ?auto_15901 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15956 - OBJ
      ?auto_15955 - LOCATION
    )
    :vars
    (
      ?auto_15957 - LOCATION
      ?auto_15960 - CITY
      ?auto_15962 - OBJ
      ?auto_15959 - OBJ
      ?auto_15961 - LOCATION
      ?auto_15958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15957 ?auto_15960 ) ( IN-CITY ?auto_15955 ?auto_15960 ) ( not ( = ?auto_15955 ?auto_15957 ) ) ( OBJ-AT ?auto_15962 ?auto_15955 ) ( not ( = ?auto_15962 ?auto_15956 ) ) ( OBJ-AT ?auto_15956 ?auto_15957 ) ( not ( = ?auto_15962 ?auto_15959 ) ) ( not ( = ?auto_15956 ?auto_15959 ) ) ( IN-CITY ?auto_15961 ?auto_15960 ) ( not ( = ?auto_15955 ?auto_15961 ) ) ( not ( = ?auto_15957 ?auto_15961 ) ) ( OBJ-AT ?auto_15959 ?auto_15961 ) ( TRUCK-AT ?auto_15958 ?auto_15955 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15958 ?auto_15955 ?auto_15961 ?auto_15960 )
      ( DELIVER-2PKG ?auto_15962 ?auto_15956 ?auto_15955 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15964 - OBJ
      ?auto_15965 - OBJ
      ?auto_15963 - LOCATION
    )
    :vars
    (
      ?auto_15968 - LOCATION
      ?auto_15969 - CITY
      ?auto_15966 - OBJ
      ?auto_15970 - LOCATION
      ?auto_15967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15968 ?auto_15969 ) ( IN-CITY ?auto_15963 ?auto_15969 ) ( not ( = ?auto_15963 ?auto_15968 ) ) ( OBJ-AT ?auto_15964 ?auto_15963 ) ( not ( = ?auto_15964 ?auto_15965 ) ) ( OBJ-AT ?auto_15965 ?auto_15968 ) ( not ( = ?auto_15964 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( IN-CITY ?auto_15970 ?auto_15969 ) ( not ( = ?auto_15963 ?auto_15970 ) ) ( not ( = ?auto_15968 ?auto_15970 ) ) ( OBJ-AT ?auto_15966 ?auto_15970 ) ( TRUCK-AT ?auto_15967 ?auto_15963 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15965 ?auto_15963 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15972 - OBJ
      ?auto_15973 - OBJ
      ?auto_15971 - LOCATION
    )
    :vars
    (
      ?auto_15976 - LOCATION
      ?auto_15974 - CITY
      ?auto_15978 - OBJ
      ?auto_15975 - LOCATION
      ?auto_15977 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15976 ?auto_15974 ) ( IN-CITY ?auto_15971 ?auto_15974 ) ( not ( = ?auto_15971 ?auto_15976 ) ) ( OBJ-AT ?auto_15978 ?auto_15971 ) ( not ( = ?auto_15978 ?auto_15973 ) ) ( OBJ-AT ?auto_15973 ?auto_15976 ) ( not ( = ?auto_15978 ?auto_15972 ) ) ( not ( = ?auto_15973 ?auto_15972 ) ) ( IN-CITY ?auto_15975 ?auto_15974 ) ( not ( = ?auto_15971 ?auto_15975 ) ) ( not ( = ?auto_15976 ?auto_15975 ) ) ( OBJ-AT ?auto_15972 ?auto_15975 ) ( TRUCK-AT ?auto_15977 ?auto_15971 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15978 ?auto_15973 ?auto_15971 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15980 - OBJ
      ?auto_15981 - OBJ
      ?auto_15979 - LOCATION
    )
    :vars
    (
      ?auto_15985 - LOCATION
      ?auto_15982 - CITY
      ?auto_15984 - OBJ
      ?auto_15983 - LOCATION
      ?auto_15986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15985 ?auto_15982 ) ( IN-CITY ?auto_15979 ?auto_15982 ) ( not ( = ?auto_15979 ?auto_15985 ) ) ( OBJ-AT ?auto_15981 ?auto_15979 ) ( not ( = ?auto_15981 ?auto_15980 ) ) ( OBJ-AT ?auto_15980 ?auto_15985 ) ( not ( = ?auto_15981 ?auto_15984 ) ) ( not ( = ?auto_15980 ?auto_15984 ) ) ( IN-CITY ?auto_15983 ?auto_15982 ) ( not ( = ?auto_15979 ?auto_15983 ) ) ( not ( = ?auto_15985 ?auto_15983 ) ) ( OBJ-AT ?auto_15984 ?auto_15983 ) ( TRUCK-AT ?auto_15986 ?auto_15979 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15981 ?auto_15980 ?auto_15979 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15988 - OBJ
      ?auto_15989 - OBJ
      ?auto_15987 - LOCATION
    )
    :vars
    (
      ?auto_15992 - LOCATION
      ?auto_15990 - CITY
      ?auto_15994 - OBJ
      ?auto_15991 - LOCATION
      ?auto_15993 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15992 ?auto_15990 ) ( IN-CITY ?auto_15987 ?auto_15990 ) ( not ( = ?auto_15987 ?auto_15992 ) ) ( OBJ-AT ?auto_15994 ?auto_15987 ) ( not ( = ?auto_15994 ?auto_15988 ) ) ( OBJ-AT ?auto_15988 ?auto_15992 ) ( not ( = ?auto_15994 ?auto_15989 ) ) ( not ( = ?auto_15988 ?auto_15989 ) ) ( IN-CITY ?auto_15991 ?auto_15990 ) ( not ( = ?auto_15987 ?auto_15991 ) ) ( not ( = ?auto_15992 ?auto_15991 ) ) ( OBJ-AT ?auto_15989 ?auto_15991 ) ( TRUCK-AT ?auto_15993 ?auto_15987 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15994 ?auto_15988 ?auto_15987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16005 - OBJ
      ?auto_16006 - OBJ
      ?auto_16007 - OBJ
      ?auto_16004 - LOCATION
    )
    :vars
    (
      ?auto_16011 - LOCATION
      ?auto_16008 - CITY
      ?auto_16010 - OBJ
      ?auto_16009 - LOCATION
      ?auto_16012 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16011 ?auto_16008 ) ( IN-CITY ?auto_16004 ?auto_16008 ) ( not ( = ?auto_16004 ?auto_16011 ) ) ( OBJ-AT ?auto_16005 ?auto_16004 ) ( not ( = ?auto_16005 ?auto_16007 ) ) ( OBJ-AT ?auto_16007 ?auto_16011 ) ( not ( = ?auto_16005 ?auto_16010 ) ) ( not ( = ?auto_16007 ?auto_16010 ) ) ( IN-CITY ?auto_16009 ?auto_16008 ) ( not ( = ?auto_16004 ?auto_16009 ) ) ( not ( = ?auto_16011 ?auto_16009 ) ) ( OBJ-AT ?auto_16010 ?auto_16009 ) ( TRUCK-AT ?auto_16012 ?auto_16004 ) ( OBJ-AT ?auto_16006 ?auto_16004 ) ( not ( = ?auto_16005 ?auto_16006 ) ) ( not ( = ?auto_16006 ?auto_16007 ) ) ( not ( = ?auto_16006 ?auto_16010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16005 ?auto_16007 ?auto_16004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16014 - OBJ
      ?auto_16015 - OBJ
      ?auto_16016 - OBJ
      ?auto_16013 - LOCATION
    )
    :vars
    (
      ?auto_16019 - LOCATION
      ?auto_16017 - CITY
      ?auto_16018 - LOCATION
      ?auto_16020 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16019 ?auto_16017 ) ( IN-CITY ?auto_16013 ?auto_16017 ) ( not ( = ?auto_16013 ?auto_16019 ) ) ( OBJ-AT ?auto_16014 ?auto_16013 ) ( not ( = ?auto_16014 ?auto_16016 ) ) ( OBJ-AT ?auto_16016 ?auto_16019 ) ( not ( = ?auto_16014 ?auto_16015 ) ) ( not ( = ?auto_16016 ?auto_16015 ) ) ( IN-CITY ?auto_16018 ?auto_16017 ) ( not ( = ?auto_16013 ?auto_16018 ) ) ( not ( = ?auto_16019 ?auto_16018 ) ) ( OBJ-AT ?auto_16015 ?auto_16018 ) ( TRUCK-AT ?auto_16020 ?auto_16013 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16014 ?auto_16016 ?auto_16013 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16022 - OBJ
      ?auto_16023 - OBJ
      ?auto_16024 - OBJ
      ?auto_16021 - LOCATION
    )
    :vars
    (
      ?auto_16028 - LOCATION
      ?auto_16025 - CITY
      ?auto_16027 - OBJ
      ?auto_16026 - LOCATION
      ?auto_16029 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16028 ?auto_16025 ) ( IN-CITY ?auto_16021 ?auto_16025 ) ( not ( = ?auto_16021 ?auto_16028 ) ) ( OBJ-AT ?auto_16024 ?auto_16021 ) ( not ( = ?auto_16024 ?auto_16023 ) ) ( OBJ-AT ?auto_16023 ?auto_16028 ) ( not ( = ?auto_16024 ?auto_16027 ) ) ( not ( = ?auto_16023 ?auto_16027 ) ) ( IN-CITY ?auto_16026 ?auto_16025 ) ( not ( = ?auto_16021 ?auto_16026 ) ) ( not ( = ?auto_16028 ?auto_16026 ) ) ( OBJ-AT ?auto_16027 ?auto_16026 ) ( TRUCK-AT ?auto_16029 ?auto_16021 ) ( OBJ-AT ?auto_16022 ?auto_16021 ) ( not ( = ?auto_16022 ?auto_16023 ) ) ( not ( = ?auto_16022 ?auto_16024 ) ) ( not ( = ?auto_16022 ?auto_16027 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16024 ?auto_16023 ?auto_16021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16031 - OBJ
      ?auto_16032 - OBJ
      ?auto_16033 - OBJ
      ?auto_16030 - LOCATION
    )
    :vars
    (
      ?auto_16036 - LOCATION
      ?auto_16034 - CITY
      ?auto_16035 - LOCATION
      ?auto_16037 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16036 ?auto_16034 ) ( IN-CITY ?auto_16030 ?auto_16034 ) ( not ( = ?auto_16030 ?auto_16036 ) ) ( OBJ-AT ?auto_16031 ?auto_16030 ) ( not ( = ?auto_16031 ?auto_16032 ) ) ( OBJ-AT ?auto_16032 ?auto_16036 ) ( not ( = ?auto_16031 ?auto_16033 ) ) ( not ( = ?auto_16032 ?auto_16033 ) ) ( IN-CITY ?auto_16035 ?auto_16034 ) ( not ( = ?auto_16030 ?auto_16035 ) ) ( not ( = ?auto_16036 ?auto_16035 ) ) ( OBJ-AT ?auto_16033 ?auto_16035 ) ( TRUCK-AT ?auto_16037 ?auto_16030 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16031 ?auto_16032 ?auto_16030 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16048 - OBJ
      ?auto_16049 - OBJ
      ?auto_16050 - OBJ
      ?auto_16047 - LOCATION
    )
    :vars
    (
      ?auto_16053 - LOCATION
      ?auto_16051 - CITY
      ?auto_16052 - LOCATION
      ?auto_16054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16053 ?auto_16051 ) ( IN-CITY ?auto_16047 ?auto_16051 ) ( not ( = ?auto_16047 ?auto_16053 ) ) ( OBJ-AT ?auto_16049 ?auto_16047 ) ( not ( = ?auto_16049 ?auto_16050 ) ) ( OBJ-AT ?auto_16050 ?auto_16053 ) ( not ( = ?auto_16049 ?auto_16048 ) ) ( not ( = ?auto_16050 ?auto_16048 ) ) ( IN-CITY ?auto_16052 ?auto_16051 ) ( not ( = ?auto_16047 ?auto_16052 ) ) ( not ( = ?auto_16053 ?auto_16052 ) ) ( OBJ-AT ?auto_16048 ?auto_16052 ) ( TRUCK-AT ?auto_16054 ?auto_16047 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16049 ?auto_16050 ?auto_16047 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16065 - OBJ
      ?auto_16066 - OBJ
      ?auto_16067 - OBJ
      ?auto_16064 - LOCATION
    )
    :vars
    (
      ?auto_16070 - LOCATION
      ?auto_16068 - CITY
      ?auto_16069 - LOCATION
      ?auto_16071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16070 ?auto_16068 ) ( IN-CITY ?auto_16064 ?auto_16068 ) ( not ( = ?auto_16064 ?auto_16070 ) ) ( OBJ-AT ?auto_16067 ?auto_16064 ) ( not ( = ?auto_16067 ?auto_16066 ) ) ( OBJ-AT ?auto_16066 ?auto_16070 ) ( not ( = ?auto_16067 ?auto_16065 ) ) ( not ( = ?auto_16066 ?auto_16065 ) ) ( IN-CITY ?auto_16069 ?auto_16068 ) ( not ( = ?auto_16064 ?auto_16069 ) ) ( not ( = ?auto_16070 ?auto_16069 ) ) ( OBJ-AT ?auto_16065 ?auto_16069 ) ( TRUCK-AT ?auto_16071 ?auto_16064 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16067 ?auto_16066 ?auto_16064 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16091 - OBJ
      ?auto_16092 - OBJ
      ?auto_16093 - OBJ
      ?auto_16090 - LOCATION
    )
    :vars
    (
      ?auto_16097 - LOCATION
      ?auto_16094 - CITY
      ?auto_16096 - OBJ
      ?auto_16095 - LOCATION
      ?auto_16098 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16097 ?auto_16094 ) ( IN-CITY ?auto_16090 ?auto_16094 ) ( not ( = ?auto_16090 ?auto_16097 ) ) ( OBJ-AT ?auto_16093 ?auto_16090 ) ( not ( = ?auto_16093 ?auto_16091 ) ) ( OBJ-AT ?auto_16091 ?auto_16097 ) ( not ( = ?auto_16093 ?auto_16096 ) ) ( not ( = ?auto_16091 ?auto_16096 ) ) ( IN-CITY ?auto_16095 ?auto_16094 ) ( not ( = ?auto_16090 ?auto_16095 ) ) ( not ( = ?auto_16097 ?auto_16095 ) ) ( OBJ-AT ?auto_16096 ?auto_16095 ) ( TRUCK-AT ?auto_16098 ?auto_16090 ) ( OBJ-AT ?auto_16092 ?auto_16090 ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16092 ?auto_16093 ) ) ( not ( = ?auto_16092 ?auto_16096 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16093 ?auto_16091 ?auto_16090 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16100 - OBJ
      ?auto_16101 - OBJ
      ?auto_16102 - OBJ
      ?auto_16099 - LOCATION
    )
    :vars
    (
      ?auto_16105 - LOCATION
      ?auto_16103 - CITY
      ?auto_16104 - LOCATION
      ?auto_16106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16105 ?auto_16103 ) ( IN-CITY ?auto_16099 ?auto_16103 ) ( not ( = ?auto_16099 ?auto_16105 ) ) ( OBJ-AT ?auto_16101 ?auto_16099 ) ( not ( = ?auto_16101 ?auto_16100 ) ) ( OBJ-AT ?auto_16100 ?auto_16105 ) ( not ( = ?auto_16101 ?auto_16102 ) ) ( not ( = ?auto_16100 ?auto_16102 ) ) ( IN-CITY ?auto_16104 ?auto_16103 ) ( not ( = ?auto_16099 ?auto_16104 ) ) ( not ( = ?auto_16105 ?auto_16104 ) ) ( OBJ-AT ?auto_16102 ?auto_16104 ) ( TRUCK-AT ?auto_16106 ?auto_16099 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16101 ?auto_16100 ?auto_16099 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16117 - OBJ
      ?auto_16118 - OBJ
      ?auto_16119 - OBJ
      ?auto_16116 - LOCATION
    )
    :vars
    (
      ?auto_16122 - LOCATION
      ?auto_16120 - CITY
      ?auto_16121 - LOCATION
      ?auto_16123 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16122 ?auto_16120 ) ( IN-CITY ?auto_16116 ?auto_16120 ) ( not ( = ?auto_16116 ?auto_16122 ) ) ( OBJ-AT ?auto_16119 ?auto_16116 ) ( not ( = ?auto_16119 ?auto_16117 ) ) ( OBJ-AT ?auto_16117 ?auto_16122 ) ( not ( = ?auto_16119 ?auto_16118 ) ) ( not ( = ?auto_16117 ?auto_16118 ) ) ( IN-CITY ?auto_16121 ?auto_16120 ) ( not ( = ?auto_16116 ?auto_16121 ) ) ( not ( = ?auto_16122 ?auto_16121 ) ) ( OBJ-AT ?auto_16118 ?auto_16121 ) ( TRUCK-AT ?auto_16123 ?auto_16116 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16119 ?auto_16117 ?auto_16116 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16171 - OBJ
      ?auto_16170 - LOCATION
    )
    :vars
    (
      ?auto_16175 - LOCATION
      ?auto_16172 - CITY
      ?auto_16177 - OBJ
      ?auto_16174 - OBJ
      ?auto_16173 - LOCATION
      ?auto_16176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16175 ?auto_16172 ) ( IN-CITY ?auto_16170 ?auto_16172 ) ( not ( = ?auto_16170 ?auto_16175 ) ) ( not ( = ?auto_16177 ?auto_16171 ) ) ( OBJ-AT ?auto_16171 ?auto_16175 ) ( not ( = ?auto_16177 ?auto_16174 ) ) ( not ( = ?auto_16171 ?auto_16174 ) ) ( IN-CITY ?auto_16173 ?auto_16172 ) ( not ( = ?auto_16170 ?auto_16173 ) ) ( not ( = ?auto_16175 ?auto_16173 ) ) ( OBJ-AT ?auto_16174 ?auto_16173 ) ( TRUCK-AT ?auto_16176 ?auto_16170 ) ( IN-TRUCK ?auto_16177 ?auto_16176 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16177 ?auto_16170 )
      ( DELIVER-2PKG ?auto_16177 ?auto_16171 ?auto_16170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16179 - OBJ
      ?auto_16180 - OBJ
      ?auto_16178 - LOCATION
    )
    :vars
    (
      ?auto_16182 - LOCATION
      ?auto_16183 - CITY
      ?auto_16181 - OBJ
      ?auto_16185 - LOCATION
      ?auto_16184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16182 ?auto_16183 ) ( IN-CITY ?auto_16178 ?auto_16183 ) ( not ( = ?auto_16178 ?auto_16182 ) ) ( not ( = ?auto_16179 ?auto_16180 ) ) ( OBJ-AT ?auto_16180 ?auto_16182 ) ( not ( = ?auto_16179 ?auto_16181 ) ) ( not ( = ?auto_16180 ?auto_16181 ) ) ( IN-CITY ?auto_16185 ?auto_16183 ) ( not ( = ?auto_16178 ?auto_16185 ) ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( OBJ-AT ?auto_16181 ?auto_16185 ) ( TRUCK-AT ?auto_16184 ?auto_16178 ) ( IN-TRUCK ?auto_16179 ?auto_16184 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16180 ?auto_16178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16187 - OBJ
      ?auto_16188 - OBJ
      ?auto_16186 - LOCATION
    )
    :vars
    (
      ?auto_16192 - LOCATION
      ?auto_16190 - CITY
      ?auto_16193 - OBJ
      ?auto_16191 - LOCATION
      ?auto_16189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16192 ?auto_16190 ) ( IN-CITY ?auto_16186 ?auto_16190 ) ( not ( = ?auto_16186 ?auto_16192 ) ) ( not ( = ?auto_16193 ?auto_16188 ) ) ( OBJ-AT ?auto_16188 ?auto_16192 ) ( not ( = ?auto_16193 ?auto_16187 ) ) ( not ( = ?auto_16188 ?auto_16187 ) ) ( IN-CITY ?auto_16191 ?auto_16190 ) ( not ( = ?auto_16186 ?auto_16191 ) ) ( not ( = ?auto_16192 ?auto_16191 ) ) ( OBJ-AT ?auto_16187 ?auto_16191 ) ( TRUCK-AT ?auto_16189 ?auto_16186 ) ( IN-TRUCK ?auto_16193 ?auto_16189 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16193 ?auto_16188 ?auto_16186 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16195 - OBJ
      ?auto_16196 - OBJ
      ?auto_16194 - LOCATION
    )
    :vars
    (
      ?auto_16200 - LOCATION
      ?auto_16198 - CITY
      ?auto_16201 - OBJ
      ?auto_16199 - LOCATION
      ?auto_16197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16200 ?auto_16198 ) ( IN-CITY ?auto_16194 ?auto_16198 ) ( not ( = ?auto_16194 ?auto_16200 ) ) ( not ( = ?auto_16196 ?auto_16195 ) ) ( OBJ-AT ?auto_16195 ?auto_16200 ) ( not ( = ?auto_16196 ?auto_16201 ) ) ( not ( = ?auto_16195 ?auto_16201 ) ) ( IN-CITY ?auto_16199 ?auto_16198 ) ( not ( = ?auto_16194 ?auto_16199 ) ) ( not ( = ?auto_16200 ?auto_16199 ) ) ( OBJ-AT ?auto_16201 ?auto_16199 ) ( TRUCK-AT ?auto_16197 ?auto_16194 ) ( IN-TRUCK ?auto_16196 ?auto_16197 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16196 ?auto_16195 ?auto_16194 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16203 - OBJ
      ?auto_16204 - OBJ
      ?auto_16202 - LOCATION
    )
    :vars
    (
      ?auto_16208 - LOCATION
      ?auto_16206 - CITY
      ?auto_16209 - OBJ
      ?auto_16207 - LOCATION
      ?auto_16205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16208 ?auto_16206 ) ( IN-CITY ?auto_16202 ?auto_16206 ) ( not ( = ?auto_16202 ?auto_16208 ) ) ( not ( = ?auto_16209 ?auto_16203 ) ) ( OBJ-AT ?auto_16203 ?auto_16208 ) ( not ( = ?auto_16209 ?auto_16204 ) ) ( not ( = ?auto_16203 ?auto_16204 ) ) ( IN-CITY ?auto_16207 ?auto_16206 ) ( not ( = ?auto_16202 ?auto_16207 ) ) ( not ( = ?auto_16208 ?auto_16207 ) ) ( OBJ-AT ?auto_16204 ?auto_16207 ) ( TRUCK-AT ?auto_16205 ?auto_16202 ) ( IN-TRUCK ?auto_16209 ?auto_16205 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16209 ?auto_16203 ?auto_16202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16229 - OBJ
      ?auto_16230 - OBJ
      ?auto_16231 - OBJ
      ?auto_16228 - LOCATION
    )
    :vars
    (
      ?auto_16235 - LOCATION
      ?auto_16233 - CITY
      ?auto_16234 - LOCATION
      ?auto_16232 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16235 ?auto_16233 ) ( IN-CITY ?auto_16228 ?auto_16233 ) ( not ( = ?auto_16228 ?auto_16235 ) ) ( not ( = ?auto_16229 ?auto_16231 ) ) ( OBJ-AT ?auto_16231 ?auto_16235 ) ( not ( = ?auto_16229 ?auto_16230 ) ) ( not ( = ?auto_16231 ?auto_16230 ) ) ( IN-CITY ?auto_16234 ?auto_16233 ) ( not ( = ?auto_16228 ?auto_16234 ) ) ( not ( = ?auto_16235 ?auto_16234 ) ) ( OBJ-AT ?auto_16230 ?auto_16234 ) ( TRUCK-AT ?auto_16232 ?auto_16228 ) ( IN-TRUCK ?auto_16229 ?auto_16232 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16229 ?auto_16231 ?auto_16228 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16246 - OBJ
      ?auto_16247 - OBJ
      ?auto_16248 - OBJ
      ?auto_16245 - LOCATION
    )
    :vars
    (
      ?auto_16252 - LOCATION
      ?auto_16250 - CITY
      ?auto_16251 - LOCATION
      ?auto_16249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16252 ?auto_16250 ) ( IN-CITY ?auto_16245 ?auto_16250 ) ( not ( = ?auto_16245 ?auto_16252 ) ) ( not ( = ?auto_16246 ?auto_16247 ) ) ( OBJ-AT ?auto_16247 ?auto_16252 ) ( not ( = ?auto_16246 ?auto_16248 ) ) ( not ( = ?auto_16247 ?auto_16248 ) ) ( IN-CITY ?auto_16251 ?auto_16250 ) ( not ( = ?auto_16245 ?auto_16251 ) ) ( not ( = ?auto_16252 ?auto_16251 ) ) ( OBJ-AT ?auto_16248 ?auto_16251 ) ( TRUCK-AT ?auto_16249 ?auto_16245 ) ( IN-TRUCK ?auto_16246 ?auto_16249 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16246 ?auto_16247 ?auto_16245 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16263 - OBJ
      ?auto_16264 - OBJ
      ?auto_16265 - OBJ
      ?auto_16262 - LOCATION
    )
    :vars
    (
      ?auto_16269 - LOCATION
      ?auto_16267 - CITY
      ?auto_16268 - LOCATION
      ?auto_16266 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16269 ?auto_16267 ) ( IN-CITY ?auto_16262 ?auto_16267 ) ( not ( = ?auto_16262 ?auto_16269 ) ) ( not ( = ?auto_16264 ?auto_16265 ) ) ( OBJ-AT ?auto_16265 ?auto_16269 ) ( not ( = ?auto_16264 ?auto_16263 ) ) ( not ( = ?auto_16265 ?auto_16263 ) ) ( IN-CITY ?auto_16268 ?auto_16267 ) ( not ( = ?auto_16262 ?auto_16268 ) ) ( not ( = ?auto_16269 ?auto_16268 ) ) ( OBJ-AT ?auto_16263 ?auto_16268 ) ( TRUCK-AT ?auto_16266 ?auto_16262 ) ( IN-TRUCK ?auto_16264 ?auto_16266 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16264 ?auto_16265 ?auto_16262 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16280 - OBJ
      ?auto_16281 - OBJ
      ?auto_16282 - OBJ
      ?auto_16279 - LOCATION
    )
    :vars
    (
      ?auto_16286 - LOCATION
      ?auto_16284 - CITY
      ?auto_16285 - LOCATION
      ?auto_16283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16286 ?auto_16284 ) ( IN-CITY ?auto_16279 ?auto_16284 ) ( not ( = ?auto_16279 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16281 ) ) ( OBJ-AT ?auto_16281 ?auto_16286 ) ( not ( = ?auto_16282 ?auto_16280 ) ) ( not ( = ?auto_16281 ?auto_16280 ) ) ( IN-CITY ?auto_16285 ?auto_16284 ) ( not ( = ?auto_16279 ?auto_16285 ) ) ( not ( = ?auto_16286 ?auto_16285 ) ) ( OBJ-AT ?auto_16280 ?auto_16285 ) ( TRUCK-AT ?auto_16283 ?auto_16279 ) ( IN-TRUCK ?auto_16282 ?auto_16283 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16282 ?auto_16281 ?auto_16279 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16315 - OBJ
      ?auto_16316 - OBJ
      ?auto_16317 - OBJ
      ?auto_16314 - LOCATION
    )
    :vars
    (
      ?auto_16321 - LOCATION
      ?auto_16319 - CITY
      ?auto_16320 - LOCATION
      ?auto_16318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16321 ?auto_16319 ) ( IN-CITY ?auto_16314 ?auto_16319 ) ( not ( = ?auto_16314 ?auto_16321 ) ) ( not ( = ?auto_16316 ?auto_16315 ) ) ( OBJ-AT ?auto_16315 ?auto_16321 ) ( not ( = ?auto_16316 ?auto_16317 ) ) ( not ( = ?auto_16315 ?auto_16317 ) ) ( IN-CITY ?auto_16320 ?auto_16319 ) ( not ( = ?auto_16314 ?auto_16320 ) ) ( not ( = ?auto_16321 ?auto_16320 ) ) ( OBJ-AT ?auto_16317 ?auto_16320 ) ( TRUCK-AT ?auto_16318 ?auto_16314 ) ( IN-TRUCK ?auto_16316 ?auto_16318 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16316 ?auto_16315 ?auto_16314 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16332 - OBJ
      ?auto_16333 - OBJ
      ?auto_16334 - OBJ
      ?auto_16331 - LOCATION
    )
    :vars
    (
      ?auto_16338 - LOCATION
      ?auto_16336 - CITY
      ?auto_16337 - LOCATION
      ?auto_16335 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16338 ?auto_16336 ) ( IN-CITY ?auto_16331 ?auto_16336 ) ( not ( = ?auto_16331 ?auto_16338 ) ) ( not ( = ?auto_16334 ?auto_16332 ) ) ( OBJ-AT ?auto_16332 ?auto_16338 ) ( not ( = ?auto_16334 ?auto_16333 ) ) ( not ( = ?auto_16332 ?auto_16333 ) ) ( IN-CITY ?auto_16337 ?auto_16336 ) ( not ( = ?auto_16331 ?auto_16337 ) ) ( not ( = ?auto_16338 ?auto_16337 ) ) ( OBJ-AT ?auto_16333 ?auto_16337 ) ( TRUCK-AT ?auto_16335 ?auto_16331 ) ( IN-TRUCK ?auto_16334 ?auto_16335 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16334 ?auto_16332 ?auto_16331 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16386 - OBJ
      ?auto_16385 - LOCATION
    )
    :vars
    (
      ?auto_16390 - LOCATION
      ?auto_16388 - CITY
      ?auto_16392 - OBJ
      ?auto_16391 - OBJ
      ?auto_16389 - LOCATION
      ?auto_16387 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16390 ?auto_16388 ) ( IN-CITY ?auto_16385 ?auto_16388 ) ( not ( = ?auto_16385 ?auto_16390 ) ) ( not ( = ?auto_16392 ?auto_16386 ) ) ( OBJ-AT ?auto_16386 ?auto_16390 ) ( not ( = ?auto_16392 ?auto_16391 ) ) ( not ( = ?auto_16386 ?auto_16391 ) ) ( IN-CITY ?auto_16389 ?auto_16388 ) ( not ( = ?auto_16385 ?auto_16389 ) ) ( not ( = ?auto_16390 ?auto_16389 ) ) ( OBJ-AT ?auto_16391 ?auto_16389 ) ( IN-TRUCK ?auto_16392 ?auto_16387 ) ( TRUCK-AT ?auto_16387 ?auto_16389 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16387 ?auto_16389 ?auto_16385 ?auto_16388 )
      ( DELIVER-2PKG ?auto_16392 ?auto_16386 ?auto_16385 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16394 - OBJ
      ?auto_16395 - OBJ
      ?auto_16393 - LOCATION
    )
    :vars
    (
      ?auto_16399 - LOCATION
      ?auto_16397 - CITY
      ?auto_16400 - OBJ
      ?auto_16396 - LOCATION
      ?auto_16398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16399 ?auto_16397 ) ( IN-CITY ?auto_16393 ?auto_16397 ) ( not ( = ?auto_16393 ?auto_16399 ) ) ( not ( = ?auto_16394 ?auto_16395 ) ) ( OBJ-AT ?auto_16395 ?auto_16399 ) ( not ( = ?auto_16394 ?auto_16400 ) ) ( not ( = ?auto_16395 ?auto_16400 ) ) ( IN-CITY ?auto_16396 ?auto_16397 ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16399 ?auto_16396 ) ) ( OBJ-AT ?auto_16400 ?auto_16396 ) ( IN-TRUCK ?auto_16394 ?auto_16398 ) ( TRUCK-AT ?auto_16398 ?auto_16396 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16395 ?auto_16393 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16402 - OBJ
      ?auto_16403 - OBJ
      ?auto_16401 - LOCATION
    )
    :vars
    (
      ?auto_16404 - LOCATION
      ?auto_16406 - CITY
      ?auto_16408 - OBJ
      ?auto_16405 - LOCATION
      ?auto_16407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16404 ?auto_16406 ) ( IN-CITY ?auto_16401 ?auto_16406 ) ( not ( = ?auto_16401 ?auto_16404 ) ) ( not ( = ?auto_16408 ?auto_16403 ) ) ( OBJ-AT ?auto_16403 ?auto_16404 ) ( not ( = ?auto_16408 ?auto_16402 ) ) ( not ( = ?auto_16403 ?auto_16402 ) ) ( IN-CITY ?auto_16405 ?auto_16406 ) ( not ( = ?auto_16401 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16405 ) ) ( OBJ-AT ?auto_16402 ?auto_16405 ) ( IN-TRUCK ?auto_16408 ?auto_16407 ) ( TRUCK-AT ?auto_16407 ?auto_16405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16408 ?auto_16403 ?auto_16401 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16410 - OBJ
      ?auto_16411 - OBJ
      ?auto_16409 - LOCATION
    )
    :vars
    (
      ?auto_16412 - LOCATION
      ?auto_16414 - CITY
      ?auto_16415 - OBJ
      ?auto_16413 - LOCATION
      ?auto_16416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16412 ?auto_16414 ) ( IN-CITY ?auto_16409 ?auto_16414 ) ( not ( = ?auto_16409 ?auto_16412 ) ) ( not ( = ?auto_16411 ?auto_16410 ) ) ( OBJ-AT ?auto_16410 ?auto_16412 ) ( not ( = ?auto_16411 ?auto_16415 ) ) ( not ( = ?auto_16410 ?auto_16415 ) ) ( IN-CITY ?auto_16413 ?auto_16414 ) ( not ( = ?auto_16409 ?auto_16413 ) ) ( not ( = ?auto_16412 ?auto_16413 ) ) ( OBJ-AT ?auto_16415 ?auto_16413 ) ( IN-TRUCK ?auto_16411 ?auto_16416 ) ( TRUCK-AT ?auto_16416 ?auto_16413 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16411 ?auto_16410 ?auto_16409 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16418 - OBJ
      ?auto_16419 - OBJ
      ?auto_16417 - LOCATION
    )
    :vars
    (
      ?auto_16420 - LOCATION
      ?auto_16422 - CITY
      ?auto_16424 - OBJ
      ?auto_16421 - LOCATION
      ?auto_16423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16420 ?auto_16422 ) ( IN-CITY ?auto_16417 ?auto_16422 ) ( not ( = ?auto_16417 ?auto_16420 ) ) ( not ( = ?auto_16424 ?auto_16418 ) ) ( OBJ-AT ?auto_16418 ?auto_16420 ) ( not ( = ?auto_16424 ?auto_16419 ) ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( IN-CITY ?auto_16421 ?auto_16422 ) ( not ( = ?auto_16417 ?auto_16421 ) ) ( not ( = ?auto_16420 ?auto_16421 ) ) ( OBJ-AT ?auto_16419 ?auto_16421 ) ( IN-TRUCK ?auto_16424 ?auto_16423 ) ( TRUCK-AT ?auto_16423 ?auto_16421 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16424 ?auto_16418 ?auto_16417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16444 - OBJ
      ?auto_16445 - OBJ
      ?auto_16446 - OBJ
      ?auto_16443 - LOCATION
    )
    :vars
    (
      ?auto_16447 - LOCATION
      ?auto_16449 - CITY
      ?auto_16448 - LOCATION
      ?auto_16450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16447 ?auto_16449 ) ( IN-CITY ?auto_16443 ?auto_16449 ) ( not ( = ?auto_16443 ?auto_16447 ) ) ( not ( = ?auto_16444 ?auto_16446 ) ) ( OBJ-AT ?auto_16446 ?auto_16447 ) ( not ( = ?auto_16444 ?auto_16445 ) ) ( not ( = ?auto_16446 ?auto_16445 ) ) ( IN-CITY ?auto_16448 ?auto_16449 ) ( not ( = ?auto_16443 ?auto_16448 ) ) ( not ( = ?auto_16447 ?auto_16448 ) ) ( OBJ-AT ?auto_16445 ?auto_16448 ) ( IN-TRUCK ?auto_16444 ?auto_16450 ) ( TRUCK-AT ?auto_16450 ?auto_16448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16444 ?auto_16446 ?auto_16443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16461 - OBJ
      ?auto_16462 - OBJ
      ?auto_16463 - OBJ
      ?auto_16460 - LOCATION
    )
    :vars
    (
      ?auto_16464 - LOCATION
      ?auto_16466 - CITY
      ?auto_16465 - LOCATION
      ?auto_16467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16464 ?auto_16466 ) ( IN-CITY ?auto_16460 ?auto_16466 ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( OBJ-AT ?auto_16462 ?auto_16464 ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( IN-CITY ?auto_16465 ?auto_16466 ) ( not ( = ?auto_16460 ?auto_16465 ) ) ( not ( = ?auto_16464 ?auto_16465 ) ) ( OBJ-AT ?auto_16463 ?auto_16465 ) ( IN-TRUCK ?auto_16461 ?auto_16467 ) ( TRUCK-AT ?auto_16467 ?auto_16465 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16461 ?auto_16462 ?auto_16460 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16478 - OBJ
      ?auto_16479 - OBJ
      ?auto_16480 - OBJ
      ?auto_16477 - LOCATION
    )
    :vars
    (
      ?auto_16481 - LOCATION
      ?auto_16483 - CITY
      ?auto_16482 - LOCATION
      ?auto_16484 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16481 ?auto_16483 ) ( IN-CITY ?auto_16477 ?auto_16483 ) ( not ( = ?auto_16477 ?auto_16481 ) ) ( not ( = ?auto_16479 ?auto_16480 ) ) ( OBJ-AT ?auto_16480 ?auto_16481 ) ( not ( = ?auto_16479 ?auto_16478 ) ) ( not ( = ?auto_16480 ?auto_16478 ) ) ( IN-CITY ?auto_16482 ?auto_16483 ) ( not ( = ?auto_16477 ?auto_16482 ) ) ( not ( = ?auto_16481 ?auto_16482 ) ) ( OBJ-AT ?auto_16478 ?auto_16482 ) ( IN-TRUCK ?auto_16479 ?auto_16484 ) ( TRUCK-AT ?auto_16484 ?auto_16482 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16479 ?auto_16480 ?auto_16477 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16495 - OBJ
      ?auto_16496 - OBJ
      ?auto_16497 - OBJ
      ?auto_16494 - LOCATION
    )
    :vars
    (
      ?auto_16498 - LOCATION
      ?auto_16500 - CITY
      ?auto_16499 - LOCATION
      ?auto_16501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16498 ?auto_16500 ) ( IN-CITY ?auto_16494 ?auto_16500 ) ( not ( = ?auto_16494 ?auto_16498 ) ) ( not ( = ?auto_16497 ?auto_16496 ) ) ( OBJ-AT ?auto_16496 ?auto_16498 ) ( not ( = ?auto_16497 ?auto_16495 ) ) ( not ( = ?auto_16496 ?auto_16495 ) ) ( IN-CITY ?auto_16499 ?auto_16500 ) ( not ( = ?auto_16494 ?auto_16499 ) ) ( not ( = ?auto_16498 ?auto_16499 ) ) ( OBJ-AT ?auto_16495 ?auto_16499 ) ( IN-TRUCK ?auto_16497 ?auto_16501 ) ( TRUCK-AT ?auto_16501 ?auto_16499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16497 ?auto_16496 ?auto_16494 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16530 - OBJ
      ?auto_16531 - OBJ
      ?auto_16532 - OBJ
      ?auto_16529 - LOCATION
    )
    :vars
    (
      ?auto_16533 - LOCATION
      ?auto_16535 - CITY
      ?auto_16534 - LOCATION
      ?auto_16536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16533 ?auto_16535 ) ( IN-CITY ?auto_16529 ?auto_16535 ) ( not ( = ?auto_16529 ?auto_16533 ) ) ( not ( = ?auto_16531 ?auto_16530 ) ) ( OBJ-AT ?auto_16530 ?auto_16533 ) ( not ( = ?auto_16531 ?auto_16532 ) ) ( not ( = ?auto_16530 ?auto_16532 ) ) ( IN-CITY ?auto_16534 ?auto_16535 ) ( not ( = ?auto_16529 ?auto_16534 ) ) ( not ( = ?auto_16533 ?auto_16534 ) ) ( OBJ-AT ?auto_16532 ?auto_16534 ) ( IN-TRUCK ?auto_16531 ?auto_16536 ) ( TRUCK-AT ?auto_16536 ?auto_16534 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16531 ?auto_16530 ?auto_16529 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16547 - OBJ
      ?auto_16548 - OBJ
      ?auto_16549 - OBJ
      ?auto_16546 - LOCATION
    )
    :vars
    (
      ?auto_16550 - LOCATION
      ?auto_16552 - CITY
      ?auto_16551 - LOCATION
      ?auto_16553 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16550 ?auto_16552 ) ( IN-CITY ?auto_16546 ?auto_16552 ) ( not ( = ?auto_16546 ?auto_16550 ) ) ( not ( = ?auto_16549 ?auto_16547 ) ) ( OBJ-AT ?auto_16547 ?auto_16550 ) ( not ( = ?auto_16549 ?auto_16548 ) ) ( not ( = ?auto_16547 ?auto_16548 ) ) ( IN-CITY ?auto_16551 ?auto_16552 ) ( not ( = ?auto_16546 ?auto_16551 ) ) ( not ( = ?auto_16550 ?auto_16551 ) ) ( OBJ-AT ?auto_16548 ?auto_16551 ) ( IN-TRUCK ?auto_16549 ?auto_16553 ) ( TRUCK-AT ?auto_16553 ?auto_16551 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16549 ?auto_16547 ?auto_16546 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16601 - OBJ
      ?auto_16600 - LOCATION
    )
    :vars
    (
      ?auto_16602 - LOCATION
      ?auto_16604 - CITY
      ?auto_16607 - OBJ
      ?auto_16605 - OBJ
      ?auto_16603 - LOCATION
      ?auto_16606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16602 ?auto_16604 ) ( IN-CITY ?auto_16600 ?auto_16604 ) ( not ( = ?auto_16600 ?auto_16602 ) ) ( not ( = ?auto_16607 ?auto_16601 ) ) ( OBJ-AT ?auto_16601 ?auto_16602 ) ( not ( = ?auto_16607 ?auto_16605 ) ) ( not ( = ?auto_16601 ?auto_16605 ) ) ( IN-CITY ?auto_16603 ?auto_16604 ) ( not ( = ?auto_16600 ?auto_16603 ) ) ( not ( = ?auto_16602 ?auto_16603 ) ) ( OBJ-AT ?auto_16605 ?auto_16603 ) ( TRUCK-AT ?auto_16606 ?auto_16603 ) ( OBJ-AT ?auto_16607 ?auto_16603 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16607 ?auto_16606 ?auto_16603 )
      ( DELIVER-2PKG ?auto_16607 ?auto_16601 ?auto_16600 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16609 - OBJ
      ?auto_16610 - OBJ
      ?auto_16608 - LOCATION
    )
    :vars
    (
      ?auto_16613 - LOCATION
      ?auto_16612 - CITY
      ?auto_16615 - OBJ
      ?auto_16611 - LOCATION
      ?auto_16614 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16613 ?auto_16612 ) ( IN-CITY ?auto_16608 ?auto_16612 ) ( not ( = ?auto_16608 ?auto_16613 ) ) ( not ( = ?auto_16609 ?auto_16610 ) ) ( OBJ-AT ?auto_16610 ?auto_16613 ) ( not ( = ?auto_16609 ?auto_16615 ) ) ( not ( = ?auto_16610 ?auto_16615 ) ) ( IN-CITY ?auto_16611 ?auto_16612 ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16613 ?auto_16611 ) ) ( OBJ-AT ?auto_16615 ?auto_16611 ) ( TRUCK-AT ?auto_16614 ?auto_16611 ) ( OBJ-AT ?auto_16609 ?auto_16611 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16610 ?auto_16608 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16617 - OBJ
      ?auto_16618 - OBJ
      ?auto_16616 - LOCATION
    )
    :vars
    (
      ?auto_16619 - LOCATION
      ?auto_16620 - CITY
      ?auto_16623 - OBJ
      ?auto_16622 - LOCATION
      ?auto_16621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16619 ?auto_16620 ) ( IN-CITY ?auto_16616 ?auto_16620 ) ( not ( = ?auto_16616 ?auto_16619 ) ) ( not ( = ?auto_16623 ?auto_16618 ) ) ( OBJ-AT ?auto_16618 ?auto_16619 ) ( not ( = ?auto_16623 ?auto_16617 ) ) ( not ( = ?auto_16618 ?auto_16617 ) ) ( IN-CITY ?auto_16622 ?auto_16620 ) ( not ( = ?auto_16616 ?auto_16622 ) ) ( not ( = ?auto_16619 ?auto_16622 ) ) ( OBJ-AT ?auto_16617 ?auto_16622 ) ( TRUCK-AT ?auto_16621 ?auto_16622 ) ( OBJ-AT ?auto_16623 ?auto_16622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16623 ?auto_16618 ?auto_16616 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16625 - OBJ
      ?auto_16626 - OBJ
      ?auto_16624 - LOCATION
    )
    :vars
    (
      ?auto_16628 - LOCATION
      ?auto_16629 - CITY
      ?auto_16627 - OBJ
      ?auto_16631 - LOCATION
      ?auto_16630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16628 ?auto_16629 ) ( IN-CITY ?auto_16624 ?auto_16629 ) ( not ( = ?auto_16624 ?auto_16628 ) ) ( not ( = ?auto_16626 ?auto_16625 ) ) ( OBJ-AT ?auto_16625 ?auto_16628 ) ( not ( = ?auto_16626 ?auto_16627 ) ) ( not ( = ?auto_16625 ?auto_16627 ) ) ( IN-CITY ?auto_16631 ?auto_16629 ) ( not ( = ?auto_16624 ?auto_16631 ) ) ( not ( = ?auto_16628 ?auto_16631 ) ) ( OBJ-AT ?auto_16627 ?auto_16631 ) ( TRUCK-AT ?auto_16630 ?auto_16631 ) ( OBJ-AT ?auto_16626 ?auto_16631 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16626 ?auto_16625 ?auto_16624 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16633 - OBJ
      ?auto_16634 - OBJ
      ?auto_16632 - LOCATION
    )
    :vars
    (
      ?auto_16635 - LOCATION
      ?auto_16636 - CITY
      ?auto_16639 - OBJ
      ?auto_16638 - LOCATION
      ?auto_16637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16635 ?auto_16636 ) ( IN-CITY ?auto_16632 ?auto_16636 ) ( not ( = ?auto_16632 ?auto_16635 ) ) ( not ( = ?auto_16639 ?auto_16633 ) ) ( OBJ-AT ?auto_16633 ?auto_16635 ) ( not ( = ?auto_16639 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16634 ) ) ( IN-CITY ?auto_16638 ?auto_16636 ) ( not ( = ?auto_16632 ?auto_16638 ) ) ( not ( = ?auto_16635 ?auto_16638 ) ) ( OBJ-AT ?auto_16634 ?auto_16638 ) ( TRUCK-AT ?auto_16637 ?auto_16638 ) ( OBJ-AT ?auto_16639 ?auto_16638 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16639 ?auto_16633 ?auto_16632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16659 - OBJ
      ?auto_16660 - OBJ
      ?auto_16661 - OBJ
      ?auto_16658 - LOCATION
    )
    :vars
    (
      ?auto_16662 - LOCATION
      ?auto_16663 - CITY
      ?auto_16665 - LOCATION
      ?auto_16664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16662 ?auto_16663 ) ( IN-CITY ?auto_16658 ?auto_16663 ) ( not ( = ?auto_16658 ?auto_16662 ) ) ( not ( = ?auto_16659 ?auto_16661 ) ) ( OBJ-AT ?auto_16661 ?auto_16662 ) ( not ( = ?auto_16659 ?auto_16660 ) ) ( not ( = ?auto_16661 ?auto_16660 ) ) ( IN-CITY ?auto_16665 ?auto_16663 ) ( not ( = ?auto_16658 ?auto_16665 ) ) ( not ( = ?auto_16662 ?auto_16665 ) ) ( OBJ-AT ?auto_16660 ?auto_16665 ) ( TRUCK-AT ?auto_16664 ?auto_16665 ) ( OBJ-AT ?auto_16659 ?auto_16665 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16659 ?auto_16661 ?auto_16658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16676 - OBJ
      ?auto_16677 - OBJ
      ?auto_16678 - OBJ
      ?auto_16675 - LOCATION
    )
    :vars
    (
      ?auto_16679 - LOCATION
      ?auto_16680 - CITY
      ?auto_16682 - LOCATION
      ?auto_16681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16679 ?auto_16680 ) ( IN-CITY ?auto_16675 ?auto_16680 ) ( not ( = ?auto_16675 ?auto_16679 ) ) ( not ( = ?auto_16676 ?auto_16677 ) ) ( OBJ-AT ?auto_16677 ?auto_16679 ) ( not ( = ?auto_16676 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16678 ) ) ( IN-CITY ?auto_16682 ?auto_16680 ) ( not ( = ?auto_16675 ?auto_16682 ) ) ( not ( = ?auto_16679 ?auto_16682 ) ) ( OBJ-AT ?auto_16678 ?auto_16682 ) ( TRUCK-AT ?auto_16681 ?auto_16682 ) ( OBJ-AT ?auto_16676 ?auto_16682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16676 ?auto_16677 ?auto_16675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16693 - OBJ
      ?auto_16694 - OBJ
      ?auto_16695 - OBJ
      ?auto_16692 - LOCATION
    )
    :vars
    (
      ?auto_16696 - LOCATION
      ?auto_16697 - CITY
      ?auto_16699 - LOCATION
      ?auto_16698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16696 ?auto_16697 ) ( IN-CITY ?auto_16692 ?auto_16697 ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( OBJ-AT ?auto_16695 ?auto_16696 ) ( not ( = ?auto_16694 ?auto_16693 ) ) ( not ( = ?auto_16695 ?auto_16693 ) ) ( IN-CITY ?auto_16699 ?auto_16697 ) ( not ( = ?auto_16692 ?auto_16699 ) ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( OBJ-AT ?auto_16693 ?auto_16699 ) ( TRUCK-AT ?auto_16698 ?auto_16699 ) ( OBJ-AT ?auto_16694 ?auto_16699 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16694 ?auto_16695 ?auto_16692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16710 - OBJ
      ?auto_16711 - OBJ
      ?auto_16712 - OBJ
      ?auto_16709 - LOCATION
    )
    :vars
    (
      ?auto_16713 - LOCATION
      ?auto_16714 - CITY
      ?auto_16716 - LOCATION
      ?auto_16715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16713 ?auto_16714 ) ( IN-CITY ?auto_16709 ?auto_16714 ) ( not ( = ?auto_16709 ?auto_16713 ) ) ( not ( = ?auto_16712 ?auto_16711 ) ) ( OBJ-AT ?auto_16711 ?auto_16713 ) ( not ( = ?auto_16712 ?auto_16710 ) ) ( not ( = ?auto_16711 ?auto_16710 ) ) ( IN-CITY ?auto_16716 ?auto_16714 ) ( not ( = ?auto_16709 ?auto_16716 ) ) ( not ( = ?auto_16713 ?auto_16716 ) ) ( OBJ-AT ?auto_16710 ?auto_16716 ) ( TRUCK-AT ?auto_16715 ?auto_16716 ) ( OBJ-AT ?auto_16712 ?auto_16716 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16712 ?auto_16711 ?auto_16709 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16745 - OBJ
      ?auto_16746 - OBJ
      ?auto_16747 - OBJ
      ?auto_16744 - LOCATION
    )
    :vars
    (
      ?auto_16748 - LOCATION
      ?auto_16749 - CITY
      ?auto_16751 - LOCATION
      ?auto_16750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16748 ?auto_16749 ) ( IN-CITY ?auto_16744 ?auto_16749 ) ( not ( = ?auto_16744 ?auto_16748 ) ) ( not ( = ?auto_16746 ?auto_16745 ) ) ( OBJ-AT ?auto_16745 ?auto_16748 ) ( not ( = ?auto_16746 ?auto_16747 ) ) ( not ( = ?auto_16745 ?auto_16747 ) ) ( IN-CITY ?auto_16751 ?auto_16749 ) ( not ( = ?auto_16744 ?auto_16751 ) ) ( not ( = ?auto_16748 ?auto_16751 ) ) ( OBJ-AT ?auto_16747 ?auto_16751 ) ( TRUCK-AT ?auto_16750 ?auto_16751 ) ( OBJ-AT ?auto_16746 ?auto_16751 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16746 ?auto_16745 ?auto_16744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16762 - OBJ
      ?auto_16763 - OBJ
      ?auto_16764 - OBJ
      ?auto_16761 - LOCATION
    )
    :vars
    (
      ?auto_16765 - LOCATION
      ?auto_16766 - CITY
      ?auto_16768 - LOCATION
      ?auto_16767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16765 ?auto_16766 ) ( IN-CITY ?auto_16761 ?auto_16766 ) ( not ( = ?auto_16761 ?auto_16765 ) ) ( not ( = ?auto_16764 ?auto_16762 ) ) ( OBJ-AT ?auto_16762 ?auto_16765 ) ( not ( = ?auto_16764 ?auto_16763 ) ) ( not ( = ?auto_16762 ?auto_16763 ) ) ( IN-CITY ?auto_16768 ?auto_16766 ) ( not ( = ?auto_16761 ?auto_16768 ) ) ( not ( = ?auto_16765 ?auto_16768 ) ) ( OBJ-AT ?auto_16763 ?auto_16768 ) ( TRUCK-AT ?auto_16767 ?auto_16768 ) ( OBJ-AT ?auto_16764 ?auto_16768 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16764 ?auto_16762 ?auto_16761 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16816 - OBJ
      ?auto_16815 - LOCATION
    )
    :vars
    (
      ?auto_16818 - LOCATION
      ?auto_16819 - CITY
      ?auto_16822 - OBJ
      ?auto_16817 - OBJ
      ?auto_16821 - LOCATION
      ?auto_16820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16818 ?auto_16819 ) ( IN-CITY ?auto_16815 ?auto_16819 ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16822 ?auto_16816 ) ) ( OBJ-AT ?auto_16816 ?auto_16818 ) ( not ( = ?auto_16822 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( IN-CITY ?auto_16821 ?auto_16819 ) ( not ( = ?auto_16815 ?auto_16821 ) ) ( not ( = ?auto_16818 ?auto_16821 ) ) ( OBJ-AT ?auto_16817 ?auto_16821 ) ( OBJ-AT ?auto_16822 ?auto_16821 ) ( TRUCK-AT ?auto_16820 ?auto_16815 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16820 ?auto_16815 ?auto_16821 ?auto_16819 )
      ( DELIVER-2PKG ?auto_16822 ?auto_16816 ?auto_16815 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16824 - OBJ
      ?auto_16825 - OBJ
      ?auto_16823 - LOCATION
    )
    :vars
    (
      ?auto_16826 - LOCATION
      ?auto_16830 - CITY
      ?auto_16829 - OBJ
      ?auto_16828 - LOCATION
      ?auto_16827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16826 ?auto_16830 ) ( IN-CITY ?auto_16823 ?auto_16830 ) ( not ( = ?auto_16823 ?auto_16826 ) ) ( not ( = ?auto_16824 ?auto_16825 ) ) ( OBJ-AT ?auto_16825 ?auto_16826 ) ( not ( = ?auto_16824 ?auto_16829 ) ) ( not ( = ?auto_16825 ?auto_16829 ) ) ( IN-CITY ?auto_16828 ?auto_16830 ) ( not ( = ?auto_16823 ?auto_16828 ) ) ( not ( = ?auto_16826 ?auto_16828 ) ) ( OBJ-AT ?auto_16829 ?auto_16828 ) ( OBJ-AT ?auto_16824 ?auto_16828 ) ( TRUCK-AT ?auto_16827 ?auto_16823 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16825 ?auto_16823 ) )
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
      ?auto_16834 - CITY
      ?auto_16838 - OBJ
      ?auto_16836 - LOCATION
      ?auto_16837 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16835 ?auto_16834 ) ( IN-CITY ?auto_16831 ?auto_16834 ) ( not ( = ?auto_16831 ?auto_16835 ) ) ( not ( = ?auto_16838 ?auto_16833 ) ) ( OBJ-AT ?auto_16833 ?auto_16835 ) ( not ( = ?auto_16838 ?auto_16832 ) ) ( not ( = ?auto_16833 ?auto_16832 ) ) ( IN-CITY ?auto_16836 ?auto_16834 ) ( not ( = ?auto_16831 ?auto_16836 ) ) ( not ( = ?auto_16835 ?auto_16836 ) ) ( OBJ-AT ?auto_16832 ?auto_16836 ) ( OBJ-AT ?auto_16838 ?auto_16836 ) ( TRUCK-AT ?auto_16837 ?auto_16831 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16838 ?auto_16833 ?auto_16831 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16840 - OBJ
      ?auto_16841 - OBJ
      ?auto_16839 - LOCATION
    )
    :vars
    (
      ?auto_16844 - LOCATION
      ?auto_16843 - CITY
      ?auto_16842 - OBJ
      ?auto_16845 - LOCATION
      ?auto_16846 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16844 ?auto_16843 ) ( IN-CITY ?auto_16839 ?auto_16843 ) ( not ( = ?auto_16839 ?auto_16844 ) ) ( not ( = ?auto_16841 ?auto_16840 ) ) ( OBJ-AT ?auto_16840 ?auto_16844 ) ( not ( = ?auto_16841 ?auto_16842 ) ) ( not ( = ?auto_16840 ?auto_16842 ) ) ( IN-CITY ?auto_16845 ?auto_16843 ) ( not ( = ?auto_16839 ?auto_16845 ) ) ( not ( = ?auto_16844 ?auto_16845 ) ) ( OBJ-AT ?auto_16842 ?auto_16845 ) ( OBJ-AT ?auto_16841 ?auto_16845 ) ( TRUCK-AT ?auto_16846 ?auto_16839 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16841 ?auto_16840 ?auto_16839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16848 - OBJ
      ?auto_16849 - OBJ
      ?auto_16847 - LOCATION
    )
    :vars
    (
      ?auto_16851 - LOCATION
      ?auto_16850 - CITY
      ?auto_16854 - OBJ
      ?auto_16852 - LOCATION
      ?auto_16853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16851 ?auto_16850 ) ( IN-CITY ?auto_16847 ?auto_16850 ) ( not ( = ?auto_16847 ?auto_16851 ) ) ( not ( = ?auto_16854 ?auto_16848 ) ) ( OBJ-AT ?auto_16848 ?auto_16851 ) ( not ( = ?auto_16854 ?auto_16849 ) ) ( not ( = ?auto_16848 ?auto_16849 ) ) ( IN-CITY ?auto_16852 ?auto_16850 ) ( not ( = ?auto_16847 ?auto_16852 ) ) ( not ( = ?auto_16851 ?auto_16852 ) ) ( OBJ-AT ?auto_16849 ?auto_16852 ) ( OBJ-AT ?auto_16854 ?auto_16852 ) ( TRUCK-AT ?auto_16853 ?auto_16847 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16854 ?auto_16848 ?auto_16847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16874 - OBJ
      ?auto_16875 - OBJ
      ?auto_16876 - OBJ
      ?auto_16873 - LOCATION
    )
    :vars
    (
      ?auto_16878 - LOCATION
      ?auto_16877 - CITY
      ?auto_16879 - LOCATION
      ?auto_16880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16878 ?auto_16877 ) ( IN-CITY ?auto_16873 ?auto_16877 ) ( not ( = ?auto_16873 ?auto_16878 ) ) ( not ( = ?auto_16874 ?auto_16876 ) ) ( OBJ-AT ?auto_16876 ?auto_16878 ) ( not ( = ?auto_16874 ?auto_16875 ) ) ( not ( = ?auto_16876 ?auto_16875 ) ) ( IN-CITY ?auto_16879 ?auto_16877 ) ( not ( = ?auto_16873 ?auto_16879 ) ) ( not ( = ?auto_16878 ?auto_16879 ) ) ( OBJ-AT ?auto_16875 ?auto_16879 ) ( OBJ-AT ?auto_16874 ?auto_16879 ) ( TRUCK-AT ?auto_16880 ?auto_16873 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16874 ?auto_16876 ?auto_16873 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16891 - OBJ
      ?auto_16892 - OBJ
      ?auto_16893 - OBJ
      ?auto_16890 - LOCATION
    )
    :vars
    (
      ?auto_16895 - LOCATION
      ?auto_16894 - CITY
      ?auto_16896 - LOCATION
      ?auto_16897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16895 ?auto_16894 ) ( IN-CITY ?auto_16890 ?auto_16894 ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( not ( = ?auto_16891 ?auto_16892 ) ) ( OBJ-AT ?auto_16892 ?auto_16895 ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( IN-CITY ?auto_16896 ?auto_16894 ) ( not ( = ?auto_16890 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( OBJ-AT ?auto_16893 ?auto_16896 ) ( OBJ-AT ?auto_16891 ?auto_16896 ) ( TRUCK-AT ?auto_16897 ?auto_16890 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16891 ?auto_16892 ?auto_16890 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16908 - OBJ
      ?auto_16909 - OBJ
      ?auto_16910 - OBJ
      ?auto_16907 - LOCATION
    )
    :vars
    (
      ?auto_16912 - LOCATION
      ?auto_16911 - CITY
      ?auto_16913 - LOCATION
      ?auto_16914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16912 ?auto_16911 ) ( IN-CITY ?auto_16907 ?auto_16911 ) ( not ( = ?auto_16907 ?auto_16912 ) ) ( not ( = ?auto_16909 ?auto_16910 ) ) ( OBJ-AT ?auto_16910 ?auto_16912 ) ( not ( = ?auto_16909 ?auto_16908 ) ) ( not ( = ?auto_16910 ?auto_16908 ) ) ( IN-CITY ?auto_16913 ?auto_16911 ) ( not ( = ?auto_16907 ?auto_16913 ) ) ( not ( = ?auto_16912 ?auto_16913 ) ) ( OBJ-AT ?auto_16908 ?auto_16913 ) ( OBJ-AT ?auto_16909 ?auto_16913 ) ( TRUCK-AT ?auto_16914 ?auto_16907 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16909 ?auto_16910 ?auto_16907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16925 - OBJ
      ?auto_16926 - OBJ
      ?auto_16927 - OBJ
      ?auto_16924 - LOCATION
    )
    :vars
    (
      ?auto_16929 - LOCATION
      ?auto_16928 - CITY
      ?auto_16930 - LOCATION
      ?auto_16931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16929 ?auto_16928 ) ( IN-CITY ?auto_16924 ?auto_16928 ) ( not ( = ?auto_16924 ?auto_16929 ) ) ( not ( = ?auto_16927 ?auto_16926 ) ) ( OBJ-AT ?auto_16926 ?auto_16929 ) ( not ( = ?auto_16927 ?auto_16925 ) ) ( not ( = ?auto_16926 ?auto_16925 ) ) ( IN-CITY ?auto_16930 ?auto_16928 ) ( not ( = ?auto_16924 ?auto_16930 ) ) ( not ( = ?auto_16929 ?auto_16930 ) ) ( OBJ-AT ?auto_16925 ?auto_16930 ) ( OBJ-AT ?auto_16927 ?auto_16930 ) ( TRUCK-AT ?auto_16931 ?auto_16924 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16927 ?auto_16926 ?auto_16924 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16960 - OBJ
      ?auto_16961 - OBJ
      ?auto_16962 - OBJ
      ?auto_16959 - LOCATION
    )
    :vars
    (
      ?auto_16964 - LOCATION
      ?auto_16963 - CITY
      ?auto_16965 - LOCATION
      ?auto_16966 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16964 ?auto_16963 ) ( IN-CITY ?auto_16959 ?auto_16963 ) ( not ( = ?auto_16959 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_16960 ) ) ( OBJ-AT ?auto_16960 ?auto_16964 ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( IN-CITY ?auto_16965 ?auto_16963 ) ( not ( = ?auto_16959 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( OBJ-AT ?auto_16962 ?auto_16965 ) ( OBJ-AT ?auto_16961 ?auto_16965 ) ( TRUCK-AT ?auto_16966 ?auto_16959 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16961 ?auto_16960 ?auto_16959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_16977 - OBJ
      ?auto_16978 - OBJ
      ?auto_16979 - OBJ
      ?auto_16976 - LOCATION
    )
    :vars
    (
      ?auto_16981 - LOCATION
      ?auto_16980 - CITY
      ?auto_16982 - LOCATION
      ?auto_16983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16981 ?auto_16980 ) ( IN-CITY ?auto_16976 ?auto_16980 ) ( not ( = ?auto_16976 ?auto_16981 ) ) ( not ( = ?auto_16979 ?auto_16977 ) ) ( OBJ-AT ?auto_16977 ?auto_16981 ) ( not ( = ?auto_16979 ?auto_16978 ) ) ( not ( = ?auto_16977 ?auto_16978 ) ) ( IN-CITY ?auto_16982 ?auto_16980 ) ( not ( = ?auto_16976 ?auto_16982 ) ) ( not ( = ?auto_16981 ?auto_16982 ) ) ( OBJ-AT ?auto_16978 ?auto_16982 ) ( OBJ-AT ?auto_16979 ?auto_16982 ) ( TRUCK-AT ?auto_16983 ?auto_16976 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16979 ?auto_16977 ?auto_16976 ) )
  )

)

