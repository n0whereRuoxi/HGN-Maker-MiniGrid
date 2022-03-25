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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4037 - OBJ
      ?auto_4036 - LOCATION
    )
    :vars
    (
      ?auto_4038 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4038 ?auto_4036 ) ( IN-TRUCK ?auto_4037 ?auto_4038 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4037 ?auto_4038 ?auto_4036 )
      ( DELIVER-1PKG-VERIFY ?auto_4037 ?auto_4036 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4049 - OBJ
      ?auto_4048 - LOCATION
    )
    :vars
    (
      ?auto_4050 - TRUCK
      ?auto_4051 - LOCATION
      ?auto_4052 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4049 ?auto_4050 ) ( TRUCK-AT ?auto_4050 ?auto_4051 ) ( IN-CITY ?auto_4051 ?auto_4052 ) ( IN-CITY ?auto_4048 ?auto_4052 ) ( not ( = ?auto_4048 ?auto_4051 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4050 ?auto_4051 ?auto_4048 ?auto_4052 )
      ( DELIVER-1PKG ?auto_4049 ?auto_4048 )
      ( DELIVER-1PKG-VERIFY ?auto_4049 ?auto_4048 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4067 - OBJ
      ?auto_4066 - LOCATION
    )
    :vars
    (
      ?auto_4069 - TRUCK
      ?auto_4068 - LOCATION
      ?auto_4070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4069 ?auto_4068 ) ( IN-CITY ?auto_4068 ?auto_4070 ) ( IN-CITY ?auto_4066 ?auto_4070 ) ( not ( = ?auto_4066 ?auto_4068 ) ) ( OBJ-AT ?auto_4067 ?auto_4068 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4067 ?auto_4069 ?auto_4068 )
      ( DELIVER-1PKG ?auto_4067 ?auto_4066 )
      ( DELIVER-1PKG-VERIFY ?auto_4067 ?auto_4066 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4085 - OBJ
      ?auto_4084 - LOCATION
    )
    :vars
    (
      ?auto_4088 - LOCATION
      ?auto_4087 - CITY
      ?auto_4086 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4088 ?auto_4087 ) ( IN-CITY ?auto_4084 ?auto_4087 ) ( not ( = ?auto_4084 ?auto_4088 ) ) ( OBJ-AT ?auto_4085 ?auto_4088 ) ( TRUCK-AT ?auto_4086 ?auto_4084 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4086 ?auto_4084 ?auto_4088 ?auto_4087 )
      ( DELIVER-1PKG ?auto_4085 ?auto_4084 )
      ( DELIVER-1PKG-VERIFY ?auto_4085 ?auto_4084 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4145 - OBJ
      ?auto_4146 - OBJ
      ?auto_4144 - LOCATION
    )
    :vars
    (
      ?auto_4147 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4147 ?auto_4144 ) ( IN-TRUCK ?auto_4146 ?auto_4147 ) ( OBJ-AT ?auto_4145 ?auto_4144 ) ( not ( = ?auto_4145 ?auto_4146 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4146 ?auto_4144 )
      ( DELIVER-2PKG-VERIFY ?auto_4145 ?auto_4146 ?auto_4144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4149 - OBJ
      ?auto_4150 - OBJ
      ?auto_4148 - LOCATION
    )
    :vars
    (
      ?auto_4151 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4151 ?auto_4148 ) ( IN-TRUCK ?auto_4149 ?auto_4151 ) ( OBJ-AT ?auto_4150 ?auto_4148 ) ( not ( = ?auto_4149 ?auto_4150 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4149 ?auto_4148 )
      ( DELIVER-2PKG-VERIFY ?auto_4149 ?auto_4150 ?auto_4148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4157 - OBJ
      ?auto_4158 - OBJ
      ?auto_4159 - OBJ
      ?auto_4156 - LOCATION
    )
    :vars
    (
      ?auto_4160 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4160 ?auto_4156 ) ( IN-TRUCK ?auto_4159 ?auto_4160 ) ( OBJ-AT ?auto_4157 ?auto_4156 ) ( OBJ-AT ?auto_4158 ?auto_4156 ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4159 ) ) ( not ( = ?auto_4158 ?auto_4159 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4159 ?auto_4156 )
      ( DELIVER-3PKG-VERIFY ?auto_4157 ?auto_4158 ?auto_4159 ?auto_4156 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4162 - OBJ
      ?auto_4163 - OBJ
      ?auto_4164 - OBJ
      ?auto_4161 - LOCATION
    )
    :vars
    (
      ?auto_4165 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4165 ?auto_4161 ) ( IN-TRUCK ?auto_4163 ?auto_4165 ) ( OBJ-AT ?auto_4162 ?auto_4161 ) ( OBJ-AT ?auto_4164 ?auto_4161 ) ( not ( = ?auto_4162 ?auto_4163 ) ) ( not ( = ?auto_4162 ?auto_4164 ) ) ( not ( = ?auto_4163 ?auto_4164 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4163 ?auto_4161 )
      ( DELIVER-3PKG-VERIFY ?auto_4162 ?auto_4163 ?auto_4164 ?auto_4161 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4172 - OBJ
      ?auto_4173 - OBJ
      ?auto_4174 - OBJ
      ?auto_4171 - LOCATION
    )
    :vars
    (
      ?auto_4175 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4175 ?auto_4171 ) ( IN-TRUCK ?auto_4172 ?auto_4175 ) ( OBJ-AT ?auto_4173 ?auto_4171 ) ( OBJ-AT ?auto_4174 ?auto_4171 ) ( not ( = ?auto_4172 ?auto_4173 ) ) ( not ( = ?auto_4172 ?auto_4174 ) ) ( not ( = ?auto_4173 ?auto_4174 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4172 ?auto_4171 )
      ( DELIVER-3PKG-VERIFY ?auto_4172 ?auto_4173 ?auto_4174 ?auto_4171 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4197 - OBJ
      ?auto_4198 - OBJ
      ?auto_4196 - LOCATION
    )
    :vars
    (
      ?auto_4201 - TRUCK
      ?auto_4200 - LOCATION
      ?auto_4199 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4198 ?auto_4201 ) ( TRUCK-AT ?auto_4201 ?auto_4200 ) ( IN-CITY ?auto_4200 ?auto_4199 ) ( IN-CITY ?auto_4196 ?auto_4199 ) ( not ( = ?auto_4196 ?auto_4200 ) ) ( OBJ-AT ?auto_4197 ?auto_4196 ) ( not ( = ?auto_4197 ?auto_4198 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4198 ?auto_4196 )
      ( DELIVER-2PKG-VERIFY ?auto_4197 ?auto_4198 ?auto_4196 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4203 - OBJ
      ?auto_4204 - OBJ
      ?auto_4202 - LOCATION
    )
    :vars
    (
      ?auto_4207 - TRUCK
      ?auto_4206 - LOCATION
      ?auto_4205 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4203 ?auto_4207 ) ( TRUCK-AT ?auto_4207 ?auto_4206 ) ( IN-CITY ?auto_4206 ?auto_4205 ) ( IN-CITY ?auto_4202 ?auto_4205 ) ( not ( = ?auto_4202 ?auto_4206 ) ) ( OBJ-AT ?auto_4204 ?auto_4202 ) ( not ( = ?auto_4204 ?auto_4203 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4204 ?auto_4203 ?auto_4202 )
      ( DELIVER-2PKG-VERIFY ?auto_4203 ?auto_4204 ?auto_4202 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4216 - OBJ
      ?auto_4217 - OBJ
      ?auto_4218 - OBJ
      ?auto_4215 - LOCATION
    )
    :vars
    (
      ?auto_4221 - TRUCK
      ?auto_4220 - LOCATION
      ?auto_4219 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4218 ?auto_4221 ) ( TRUCK-AT ?auto_4221 ?auto_4220 ) ( IN-CITY ?auto_4220 ?auto_4219 ) ( IN-CITY ?auto_4215 ?auto_4219 ) ( not ( = ?auto_4215 ?auto_4220 ) ) ( OBJ-AT ?auto_4216 ?auto_4215 ) ( not ( = ?auto_4216 ?auto_4218 ) ) ( OBJ-AT ?auto_4217 ?auto_4215 ) ( not ( = ?auto_4216 ?auto_4217 ) ) ( not ( = ?auto_4217 ?auto_4218 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4216 ?auto_4218 ?auto_4215 )
      ( DELIVER-3PKG-VERIFY ?auto_4216 ?auto_4217 ?auto_4218 ?auto_4215 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4223 - OBJ
      ?auto_4224 - OBJ
      ?auto_4225 - OBJ
      ?auto_4222 - LOCATION
    )
    :vars
    (
      ?auto_4228 - TRUCK
      ?auto_4227 - LOCATION
      ?auto_4226 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4224 ?auto_4228 ) ( TRUCK-AT ?auto_4228 ?auto_4227 ) ( IN-CITY ?auto_4227 ?auto_4226 ) ( IN-CITY ?auto_4222 ?auto_4226 ) ( not ( = ?auto_4222 ?auto_4227 ) ) ( OBJ-AT ?auto_4225 ?auto_4222 ) ( not ( = ?auto_4225 ?auto_4224 ) ) ( OBJ-AT ?auto_4223 ?auto_4222 ) ( not ( = ?auto_4223 ?auto_4224 ) ) ( not ( = ?auto_4223 ?auto_4225 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4225 ?auto_4224 ?auto_4222 )
      ( DELIVER-3PKG-VERIFY ?auto_4223 ?auto_4224 ?auto_4225 ?auto_4222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4237 - OBJ
      ?auto_4238 - OBJ
      ?auto_4239 - OBJ
      ?auto_4236 - LOCATION
    )
    :vars
    (
      ?auto_4242 - TRUCK
      ?auto_4241 - LOCATION
      ?auto_4240 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4237 ?auto_4242 ) ( TRUCK-AT ?auto_4242 ?auto_4241 ) ( IN-CITY ?auto_4241 ?auto_4240 ) ( IN-CITY ?auto_4236 ?auto_4240 ) ( not ( = ?auto_4236 ?auto_4241 ) ) ( OBJ-AT ?auto_4239 ?auto_4236 ) ( not ( = ?auto_4239 ?auto_4237 ) ) ( OBJ-AT ?auto_4238 ?auto_4236 ) ( not ( = ?auto_4237 ?auto_4238 ) ) ( not ( = ?auto_4238 ?auto_4239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4239 ?auto_4237 ?auto_4236 )
      ( DELIVER-3PKG-VERIFY ?auto_4237 ?auto_4238 ?auto_4239 ?auto_4236 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4266 - OBJ
      ?auto_4265 - LOCATION
    )
    :vars
    (
      ?auto_4270 - TRUCK
      ?auto_4269 - LOCATION
      ?auto_4268 - CITY
      ?auto_4267 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4270 ?auto_4269 ) ( IN-CITY ?auto_4269 ?auto_4268 ) ( IN-CITY ?auto_4265 ?auto_4268 ) ( not ( = ?auto_4265 ?auto_4269 ) ) ( OBJ-AT ?auto_4267 ?auto_4265 ) ( not ( = ?auto_4267 ?auto_4266 ) ) ( OBJ-AT ?auto_4266 ?auto_4269 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4266 ?auto_4270 ?auto_4269 )
      ( DELIVER-2PKG ?auto_4267 ?auto_4266 ?auto_4265 )
      ( DELIVER-1PKG-VERIFY ?auto_4266 ?auto_4265 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4272 - OBJ
      ?auto_4273 - OBJ
      ?auto_4271 - LOCATION
    )
    :vars
    (
      ?auto_4275 - TRUCK
      ?auto_4276 - LOCATION
      ?auto_4274 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4275 ?auto_4276 ) ( IN-CITY ?auto_4276 ?auto_4274 ) ( IN-CITY ?auto_4271 ?auto_4274 ) ( not ( = ?auto_4271 ?auto_4276 ) ) ( OBJ-AT ?auto_4272 ?auto_4271 ) ( not ( = ?auto_4272 ?auto_4273 ) ) ( OBJ-AT ?auto_4273 ?auto_4276 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4273 ?auto_4271 )
      ( DELIVER-2PKG-VERIFY ?auto_4272 ?auto_4273 ?auto_4271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4278 - OBJ
      ?auto_4279 - OBJ
      ?auto_4277 - LOCATION
    )
    :vars
    (
      ?auto_4280 - TRUCK
      ?auto_4282 - LOCATION
      ?auto_4281 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4280 ?auto_4282 ) ( IN-CITY ?auto_4282 ?auto_4281 ) ( IN-CITY ?auto_4277 ?auto_4281 ) ( not ( = ?auto_4277 ?auto_4282 ) ) ( OBJ-AT ?auto_4279 ?auto_4277 ) ( not ( = ?auto_4279 ?auto_4278 ) ) ( OBJ-AT ?auto_4278 ?auto_4282 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4279 ?auto_4278 ?auto_4277 )
      ( DELIVER-2PKG-VERIFY ?auto_4278 ?auto_4279 ?auto_4277 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4291 - OBJ
      ?auto_4292 - OBJ
      ?auto_4293 - OBJ
      ?auto_4290 - LOCATION
    )
    :vars
    (
      ?auto_4294 - TRUCK
      ?auto_4296 - LOCATION
      ?auto_4295 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4294 ?auto_4296 ) ( IN-CITY ?auto_4296 ?auto_4295 ) ( IN-CITY ?auto_4290 ?auto_4295 ) ( not ( = ?auto_4290 ?auto_4296 ) ) ( OBJ-AT ?auto_4291 ?auto_4290 ) ( not ( = ?auto_4291 ?auto_4293 ) ) ( OBJ-AT ?auto_4293 ?auto_4296 ) ( OBJ-AT ?auto_4292 ?auto_4290 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4292 ?auto_4293 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4291 ?auto_4293 ?auto_4290 )
      ( DELIVER-3PKG-VERIFY ?auto_4291 ?auto_4292 ?auto_4293 ?auto_4290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4298 - OBJ
      ?auto_4299 - OBJ
      ?auto_4300 - OBJ
      ?auto_4297 - LOCATION
    )
    :vars
    (
      ?auto_4301 - TRUCK
      ?auto_4303 - LOCATION
      ?auto_4302 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4301 ?auto_4303 ) ( IN-CITY ?auto_4303 ?auto_4302 ) ( IN-CITY ?auto_4297 ?auto_4302 ) ( not ( = ?auto_4297 ?auto_4303 ) ) ( OBJ-AT ?auto_4300 ?auto_4297 ) ( not ( = ?auto_4300 ?auto_4299 ) ) ( OBJ-AT ?auto_4299 ?auto_4303 ) ( OBJ-AT ?auto_4298 ?auto_4297 ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4300 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4300 ?auto_4299 ?auto_4297 )
      ( DELIVER-3PKG-VERIFY ?auto_4298 ?auto_4299 ?auto_4300 ?auto_4297 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4312 - OBJ
      ?auto_4313 - OBJ
      ?auto_4314 - OBJ
      ?auto_4311 - LOCATION
    )
    :vars
    (
      ?auto_4315 - TRUCK
      ?auto_4317 - LOCATION
      ?auto_4316 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4315 ?auto_4317 ) ( IN-CITY ?auto_4317 ?auto_4316 ) ( IN-CITY ?auto_4311 ?auto_4316 ) ( not ( = ?auto_4311 ?auto_4317 ) ) ( OBJ-AT ?auto_4313 ?auto_4311 ) ( not ( = ?auto_4313 ?auto_4312 ) ) ( OBJ-AT ?auto_4312 ?auto_4317 ) ( OBJ-AT ?auto_4314 ?auto_4311 ) ( not ( = ?auto_4312 ?auto_4314 ) ) ( not ( = ?auto_4313 ?auto_4314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4313 ?auto_4312 ?auto_4311 )
      ( DELIVER-3PKG-VERIFY ?auto_4312 ?auto_4313 ?auto_4314 ?auto_4311 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4341 - OBJ
      ?auto_4340 - LOCATION
    )
    :vars
    (
      ?auto_4345 - LOCATION
      ?auto_4344 - CITY
      ?auto_4342 - OBJ
      ?auto_4343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4345 ?auto_4344 ) ( IN-CITY ?auto_4340 ?auto_4344 ) ( not ( = ?auto_4340 ?auto_4345 ) ) ( OBJ-AT ?auto_4342 ?auto_4340 ) ( not ( = ?auto_4342 ?auto_4341 ) ) ( OBJ-AT ?auto_4341 ?auto_4345 ) ( TRUCK-AT ?auto_4343 ?auto_4340 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4343 ?auto_4340 ?auto_4345 ?auto_4344 )
      ( DELIVER-2PKG ?auto_4342 ?auto_4341 ?auto_4340 )
      ( DELIVER-1PKG-VERIFY ?auto_4341 ?auto_4340 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4347 - OBJ
      ?auto_4348 - OBJ
      ?auto_4346 - LOCATION
    )
    :vars
    (
      ?auto_4350 - LOCATION
      ?auto_4351 - CITY
      ?auto_4349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4350 ?auto_4351 ) ( IN-CITY ?auto_4346 ?auto_4351 ) ( not ( = ?auto_4346 ?auto_4350 ) ) ( OBJ-AT ?auto_4347 ?auto_4346 ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( OBJ-AT ?auto_4348 ?auto_4350 ) ( TRUCK-AT ?auto_4349 ?auto_4346 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4348 ?auto_4346 )
      ( DELIVER-2PKG-VERIFY ?auto_4347 ?auto_4348 ?auto_4346 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4353 - OBJ
      ?auto_4354 - OBJ
      ?auto_4352 - LOCATION
    )
    :vars
    (
      ?auto_4355 - LOCATION
      ?auto_4357 - CITY
      ?auto_4356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4355 ?auto_4357 ) ( IN-CITY ?auto_4352 ?auto_4357 ) ( not ( = ?auto_4352 ?auto_4355 ) ) ( OBJ-AT ?auto_4354 ?auto_4352 ) ( not ( = ?auto_4354 ?auto_4353 ) ) ( OBJ-AT ?auto_4353 ?auto_4355 ) ( TRUCK-AT ?auto_4356 ?auto_4352 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4354 ?auto_4353 ?auto_4352 )
      ( DELIVER-2PKG-VERIFY ?auto_4353 ?auto_4354 ?auto_4352 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4366 - OBJ
      ?auto_4367 - OBJ
      ?auto_4368 - OBJ
      ?auto_4365 - LOCATION
    )
    :vars
    (
      ?auto_4369 - LOCATION
      ?auto_4371 - CITY
      ?auto_4370 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4369 ?auto_4371 ) ( IN-CITY ?auto_4365 ?auto_4371 ) ( not ( = ?auto_4365 ?auto_4369 ) ) ( OBJ-AT ?auto_4367 ?auto_4365 ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( OBJ-AT ?auto_4368 ?auto_4369 ) ( TRUCK-AT ?auto_4370 ?auto_4365 ) ( OBJ-AT ?auto_4366 ?auto_4365 ) ( not ( = ?auto_4366 ?auto_4367 ) ) ( not ( = ?auto_4366 ?auto_4368 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4367 ?auto_4368 ?auto_4365 )
      ( DELIVER-3PKG-VERIFY ?auto_4366 ?auto_4367 ?auto_4368 ?auto_4365 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4373 - OBJ
      ?auto_4374 - OBJ
      ?auto_4375 - OBJ
      ?auto_4372 - LOCATION
    )
    :vars
    (
      ?auto_4376 - LOCATION
      ?auto_4378 - CITY
      ?auto_4377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4376 ?auto_4378 ) ( IN-CITY ?auto_4372 ?auto_4378 ) ( not ( = ?auto_4372 ?auto_4376 ) ) ( OBJ-AT ?auto_4373 ?auto_4372 ) ( not ( = ?auto_4373 ?auto_4374 ) ) ( OBJ-AT ?auto_4374 ?auto_4376 ) ( TRUCK-AT ?auto_4377 ?auto_4372 ) ( OBJ-AT ?auto_4375 ?auto_4372 ) ( not ( = ?auto_4373 ?auto_4375 ) ) ( not ( = ?auto_4374 ?auto_4375 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4373 ?auto_4374 ?auto_4372 )
      ( DELIVER-3PKG-VERIFY ?auto_4373 ?auto_4374 ?auto_4375 ?auto_4372 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4387 - OBJ
      ?auto_4388 - OBJ
      ?auto_4389 - OBJ
      ?auto_4386 - LOCATION
    )
    :vars
    (
      ?auto_4390 - LOCATION
      ?auto_4392 - CITY
      ?auto_4391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4390 ?auto_4392 ) ( IN-CITY ?auto_4386 ?auto_4392 ) ( not ( = ?auto_4386 ?auto_4390 ) ) ( OBJ-AT ?auto_4388 ?auto_4386 ) ( not ( = ?auto_4388 ?auto_4387 ) ) ( OBJ-AT ?auto_4387 ?auto_4390 ) ( TRUCK-AT ?auto_4391 ?auto_4386 ) ( OBJ-AT ?auto_4389 ?auto_4386 ) ( not ( = ?auto_4387 ?auto_4389 ) ) ( not ( = ?auto_4388 ?auto_4389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4388 ?auto_4387 ?auto_4386 )
      ( DELIVER-3PKG-VERIFY ?auto_4387 ?auto_4388 ?auto_4389 ?auto_4386 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4416 - OBJ
      ?auto_4415 - LOCATION
    )
    :vars
    (
      ?auto_4417 - LOCATION
      ?auto_4420 - CITY
      ?auto_4418 - OBJ
      ?auto_4419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4417 ?auto_4420 ) ( IN-CITY ?auto_4415 ?auto_4420 ) ( not ( = ?auto_4415 ?auto_4417 ) ) ( not ( = ?auto_4418 ?auto_4416 ) ) ( OBJ-AT ?auto_4416 ?auto_4417 ) ( TRUCK-AT ?auto_4419 ?auto_4415 ) ( IN-TRUCK ?auto_4418 ?auto_4419 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4418 ?auto_4415 )
      ( DELIVER-2PKG ?auto_4418 ?auto_4416 ?auto_4415 )
      ( DELIVER-1PKG-VERIFY ?auto_4416 ?auto_4415 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4422 - OBJ
      ?auto_4423 - OBJ
      ?auto_4421 - LOCATION
    )
    :vars
    (
      ?auto_4426 - LOCATION
      ?auto_4424 - CITY
      ?auto_4425 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4426 ?auto_4424 ) ( IN-CITY ?auto_4421 ?auto_4424 ) ( not ( = ?auto_4421 ?auto_4426 ) ) ( not ( = ?auto_4422 ?auto_4423 ) ) ( OBJ-AT ?auto_4423 ?auto_4426 ) ( TRUCK-AT ?auto_4425 ?auto_4421 ) ( IN-TRUCK ?auto_4422 ?auto_4425 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4423 ?auto_4421 )
      ( DELIVER-2PKG-VERIFY ?auto_4422 ?auto_4423 ?auto_4421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4428 - OBJ
      ?auto_4429 - OBJ
      ?auto_4427 - LOCATION
    )
    :vars
    (
      ?auto_4432 - LOCATION
      ?auto_4431 - CITY
      ?auto_4430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4432 ?auto_4431 ) ( IN-CITY ?auto_4427 ?auto_4431 ) ( not ( = ?auto_4427 ?auto_4432 ) ) ( not ( = ?auto_4429 ?auto_4428 ) ) ( OBJ-AT ?auto_4428 ?auto_4432 ) ( TRUCK-AT ?auto_4430 ?auto_4427 ) ( IN-TRUCK ?auto_4429 ?auto_4430 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4429 ?auto_4428 ?auto_4427 )
      ( DELIVER-2PKG-VERIFY ?auto_4428 ?auto_4429 ?auto_4427 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4491 - OBJ
      ?auto_4490 - LOCATION
    )
    :vars
    (
      ?auto_4495 - LOCATION
      ?auto_4494 - CITY
      ?auto_4493 - OBJ
      ?auto_4492 - TRUCK
      ?auto_4496 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4495 ?auto_4494 ) ( IN-CITY ?auto_4490 ?auto_4494 ) ( not ( = ?auto_4490 ?auto_4495 ) ) ( not ( = ?auto_4493 ?auto_4491 ) ) ( OBJ-AT ?auto_4491 ?auto_4495 ) ( IN-TRUCK ?auto_4493 ?auto_4492 ) ( TRUCK-AT ?auto_4492 ?auto_4496 ) ( IN-CITY ?auto_4496 ?auto_4494 ) ( not ( = ?auto_4490 ?auto_4496 ) ) ( not ( = ?auto_4495 ?auto_4496 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4492 ?auto_4496 ?auto_4490 ?auto_4494 )
      ( DELIVER-2PKG ?auto_4493 ?auto_4491 ?auto_4490 )
      ( DELIVER-1PKG-VERIFY ?auto_4491 ?auto_4490 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4498 - OBJ
      ?auto_4499 - OBJ
      ?auto_4497 - LOCATION
    )
    :vars
    (
      ?auto_4502 - LOCATION
      ?auto_4503 - CITY
      ?auto_4501 - TRUCK
      ?auto_4500 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4502 ?auto_4503 ) ( IN-CITY ?auto_4497 ?auto_4503 ) ( not ( = ?auto_4497 ?auto_4502 ) ) ( not ( = ?auto_4498 ?auto_4499 ) ) ( OBJ-AT ?auto_4499 ?auto_4502 ) ( IN-TRUCK ?auto_4498 ?auto_4501 ) ( TRUCK-AT ?auto_4501 ?auto_4500 ) ( IN-CITY ?auto_4500 ?auto_4503 ) ( not ( = ?auto_4497 ?auto_4500 ) ) ( not ( = ?auto_4502 ?auto_4500 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4499 ?auto_4497 )
      ( DELIVER-2PKG-VERIFY ?auto_4498 ?auto_4499 ?auto_4497 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4505 - OBJ
      ?auto_4506 - OBJ
      ?auto_4504 - LOCATION
    )
    :vars
    (
      ?auto_4509 - LOCATION
      ?auto_4507 - CITY
      ?auto_4510 - TRUCK
      ?auto_4508 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4509 ?auto_4507 ) ( IN-CITY ?auto_4504 ?auto_4507 ) ( not ( = ?auto_4504 ?auto_4509 ) ) ( not ( = ?auto_4506 ?auto_4505 ) ) ( OBJ-AT ?auto_4505 ?auto_4509 ) ( IN-TRUCK ?auto_4506 ?auto_4510 ) ( TRUCK-AT ?auto_4510 ?auto_4508 ) ( IN-CITY ?auto_4508 ?auto_4507 ) ( not ( = ?auto_4504 ?auto_4508 ) ) ( not ( = ?auto_4509 ?auto_4508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4506 ?auto_4505 ?auto_4504 )
      ( DELIVER-2PKG-VERIFY ?auto_4505 ?auto_4506 ?auto_4504 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4577 - OBJ
      ?auto_4576 - LOCATION
    )
    :vars
    (
      ?auto_4580 - LOCATION
      ?auto_4578 - CITY
      ?auto_4581 - OBJ
      ?auto_4582 - TRUCK
      ?auto_4579 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4580 ?auto_4578 ) ( IN-CITY ?auto_4576 ?auto_4578 ) ( not ( = ?auto_4576 ?auto_4580 ) ) ( not ( = ?auto_4581 ?auto_4577 ) ) ( OBJ-AT ?auto_4577 ?auto_4580 ) ( TRUCK-AT ?auto_4582 ?auto_4579 ) ( IN-CITY ?auto_4579 ?auto_4578 ) ( not ( = ?auto_4576 ?auto_4579 ) ) ( not ( = ?auto_4580 ?auto_4579 ) ) ( OBJ-AT ?auto_4581 ?auto_4579 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4581 ?auto_4582 ?auto_4579 )
      ( DELIVER-2PKG ?auto_4581 ?auto_4577 ?auto_4576 )
      ( DELIVER-1PKG-VERIFY ?auto_4577 ?auto_4576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4584 - OBJ
      ?auto_4585 - OBJ
      ?auto_4583 - LOCATION
    )
    :vars
    (
      ?auto_4588 - LOCATION
      ?auto_4587 - CITY
      ?auto_4586 - TRUCK
      ?auto_4589 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4588 ?auto_4587 ) ( IN-CITY ?auto_4583 ?auto_4587 ) ( not ( = ?auto_4583 ?auto_4588 ) ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( OBJ-AT ?auto_4585 ?auto_4588 ) ( TRUCK-AT ?auto_4586 ?auto_4589 ) ( IN-CITY ?auto_4589 ?auto_4587 ) ( not ( = ?auto_4583 ?auto_4589 ) ) ( not ( = ?auto_4588 ?auto_4589 ) ) ( OBJ-AT ?auto_4584 ?auto_4589 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4585 ?auto_4583 )
      ( DELIVER-2PKG-VERIFY ?auto_4584 ?auto_4585 ?auto_4583 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4591 - OBJ
      ?auto_4592 - OBJ
      ?auto_4590 - LOCATION
    )
    :vars
    (
      ?auto_4595 - LOCATION
      ?auto_4593 - CITY
      ?auto_4594 - TRUCK
      ?auto_4596 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4595 ?auto_4593 ) ( IN-CITY ?auto_4590 ?auto_4593 ) ( not ( = ?auto_4590 ?auto_4595 ) ) ( not ( = ?auto_4592 ?auto_4591 ) ) ( OBJ-AT ?auto_4591 ?auto_4595 ) ( TRUCK-AT ?auto_4594 ?auto_4596 ) ( IN-CITY ?auto_4596 ?auto_4593 ) ( not ( = ?auto_4590 ?auto_4596 ) ) ( not ( = ?auto_4595 ?auto_4596 ) ) ( OBJ-AT ?auto_4592 ?auto_4596 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4592 ?auto_4591 ?auto_4590 )
      ( DELIVER-2PKG-VERIFY ?auto_4591 ?auto_4592 ?auto_4590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4965 - OBJ
      ?auto_4966 - OBJ
      ?auto_4967 - OBJ
      ?auto_4964 - LOCATION
    )
    :vars
    (
      ?auto_4970 - TRUCK
      ?auto_4969 - LOCATION
      ?auto_4968 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4967 ?auto_4970 ) ( TRUCK-AT ?auto_4970 ?auto_4969 ) ( IN-CITY ?auto_4969 ?auto_4968 ) ( IN-CITY ?auto_4964 ?auto_4968 ) ( not ( = ?auto_4964 ?auto_4969 ) ) ( OBJ-AT ?auto_4966 ?auto_4964 ) ( not ( = ?auto_4966 ?auto_4967 ) ) ( OBJ-AT ?auto_4965 ?auto_4964 ) ( not ( = ?auto_4965 ?auto_4966 ) ) ( not ( = ?auto_4965 ?auto_4967 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4966 ?auto_4967 ?auto_4964 )
      ( DELIVER-3PKG-VERIFY ?auto_4965 ?auto_4966 ?auto_4967 ?auto_4964 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4998 - OBJ
      ?auto_4999 - OBJ
      ?auto_5000 - OBJ
      ?auto_4997 - LOCATION
    )
    :vars
    (
      ?auto_5004 - TRUCK
      ?auto_5002 - LOCATION
      ?auto_5001 - CITY
      ?auto_5003 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5000 ?auto_5004 ) ( TRUCK-AT ?auto_5004 ?auto_5002 ) ( IN-CITY ?auto_5002 ?auto_5001 ) ( IN-CITY ?auto_4997 ?auto_5001 ) ( not ( = ?auto_4997 ?auto_5002 ) ) ( OBJ-AT ?auto_5003 ?auto_4997 ) ( not ( = ?auto_5003 ?auto_5000 ) ) ( OBJ-AT ?auto_4998 ?auto_4997 ) ( OBJ-AT ?auto_4999 ?auto_4997 ) ( not ( = ?auto_4998 ?auto_4999 ) ) ( not ( = ?auto_4998 ?auto_5000 ) ) ( not ( = ?auto_4998 ?auto_5003 ) ) ( not ( = ?auto_4999 ?auto_5000 ) ) ( not ( = ?auto_4999 ?auto_5003 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5003 ?auto_5000 ?auto_4997 )
      ( DELIVER-3PKG-VERIFY ?auto_4998 ?auto_4999 ?auto_5000 ?auto_4997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5010 - OBJ
      ?auto_5011 - OBJ
      ?auto_5012 - OBJ
      ?auto_5009 - LOCATION
    )
    :vars
    (
      ?auto_5016 - TRUCK
      ?auto_5014 - LOCATION
      ?auto_5013 - CITY
      ?auto_5015 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5011 ?auto_5016 ) ( TRUCK-AT ?auto_5016 ?auto_5014 ) ( IN-CITY ?auto_5014 ?auto_5013 ) ( IN-CITY ?auto_5009 ?auto_5013 ) ( not ( = ?auto_5009 ?auto_5014 ) ) ( OBJ-AT ?auto_5015 ?auto_5009 ) ( not ( = ?auto_5015 ?auto_5011 ) ) ( OBJ-AT ?auto_5010 ?auto_5009 ) ( OBJ-AT ?auto_5012 ?auto_5009 ) ( not ( = ?auto_5010 ?auto_5011 ) ) ( not ( = ?auto_5010 ?auto_5012 ) ) ( not ( = ?auto_5010 ?auto_5015 ) ) ( not ( = ?auto_5011 ?auto_5012 ) ) ( not ( = ?auto_5012 ?auto_5015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5015 ?auto_5011 ?auto_5009 )
      ( DELIVER-3PKG-VERIFY ?auto_5010 ?auto_5011 ?auto_5012 ?auto_5009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5026 - OBJ
      ?auto_5027 - OBJ
      ?auto_5028 - OBJ
      ?auto_5025 - LOCATION
    )
    :vars
    (
      ?auto_5031 - TRUCK
      ?auto_5030 - LOCATION
      ?auto_5029 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5026 ?auto_5031 ) ( TRUCK-AT ?auto_5031 ?auto_5030 ) ( IN-CITY ?auto_5030 ?auto_5029 ) ( IN-CITY ?auto_5025 ?auto_5029 ) ( not ( = ?auto_5025 ?auto_5030 ) ) ( OBJ-AT ?auto_5027 ?auto_5025 ) ( not ( = ?auto_5027 ?auto_5026 ) ) ( OBJ-AT ?auto_5028 ?auto_5025 ) ( not ( = ?auto_5026 ?auto_5028 ) ) ( not ( = ?auto_5027 ?auto_5028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5027 ?auto_5026 ?auto_5025 )
      ( DELIVER-3PKG-VERIFY ?auto_5026 ?auto_5027 ?auto_5028 ?auto_5025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5048 - OBJ
      ?auto_5049 - OBJ
      ?auto_5050 - OBJ
      ?auto_5047 - LOCATION
    )
    :vars
    (
      ?auto_5054 - TRUCK
      ?auto_5052 - LOCATION
      ?auto_5051 - CITY
      ?auto_5053 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5048 ?auto_5054 ) ( TRUCK-AT ?auto_5054 ?auto_5052 ) ( IN-CITY ?auto_5052 ?auto_5051 ) ( IN-CITY ?auto_5047 ?auto_5051 ) ( not ( = ?auto_5047 ?auto_5052 ) ) ( OBJ-AT ?auto_5053 ?auto_5047 ) ( not ( = ?auto_5053 ?auto_5048 ) ) ( OBJ-AT ?auto_5049 ?auto_5047 ) ( OBJ-AT ?auto_5050 ?auto_5047 ) ( not ( = ?auto_5048 ?auto_5049 ) ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5053 ) ) ( not ( = ?auto_5050 ?auto_5053 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5053 ?auto_5048 ?auto_5047 )
      ( DELIVER-3PKG-VERIFY ?auto_5048 ?auto_5049 ?auto_5050 ?auto_5047 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5129 - OBJ
      ?auto_5130 - OBJ
      ?auto_5131 - OBJ
      ?auto_5128 - LOCATION
    )
    :vars
    (
      ?auto_5133 - TRUCK
      ?auto_5134 - LOCATION
      ?auto_5132 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5133 ?auto_5134 ) ( IN-CITY ?auto_5134 ?auto_5132 ) ( IN-CITY ?auto_5128 ?auto_5132 ) ( not ( = ?auto_5128 ?auto_5134 ) ) ( OBJ-AT ?auto_5129 ?auto_5128 ) ( not ( = ?auto_5129 ?auto_5130 ) ) ( OBJ-AT ?auto_5130 ?auto_5134 ) ( OBJ-AT ?auto_5131 ?auto_5128 ) ( not ( = ?auto_5129 ?auto_5131 ) ) ( not ( = ?auto_5130 ?auto_5131 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5129 ?auto_5130 ?auto_5128 )
      ( DELIVER-3PKG-VERIFY ?auto_5129 ?auto_5130 ?auto_5131 ?auto_5128 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5151 - OBJ
      ?auto_5152 - OBJ
      ?auto_5153 - OBJ
      ?auto_5150 - LOCATION
    )
    :vars
    (
      ?auto_5155 - TRUCK
      ?auto_5156 - LOCATION
      ?auto_5154 - CITY
      ?auto_5157 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5155 ?auto_5156 ) ( IN-CITY ?auto_5156 ?auto_5154 ) ( IN-CITY ?auto_5150 ?auto_5154 ) ( not ( = ?auto_5150 ?auto_5156 ) ) ( OBJ-AT ?auto_5157 ?auto_5150 ) ( not ( = ?auto_5157 ?auto_5153 ) ) ( OBJ-AT ?auto_5153 ?auto_5156 ) ( OBJ-AT ?auto_5151 ?auto_5150 ) ( OBJ-AT ?auto_5152 ?auto_5150 ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5153 ) ) ( not ( = ?auto_5151 ?auto_5157 ) ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5157 ?auto_5153 ?auto_5150 )
      ( DELIVER-3PKG-VERIFY ?auto_5151 ?auto_5152 ?auto_5153 ?auto_5150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5163 - OBJ
      ?auto_5164 - OBJ
      ?auto_5165 - OBJ
      ?auto_5162 - LOCATION
    )
    :vars
    (
      ?auto_5167 - TRUCK
      ?auto_5168 - LOCATION
      ?auto_5166 - CITY
      ?auto_5169 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5167 ?auto_5168 ) ( IN-CITY ?auto_5168 ?auto_5166 ) ( IN-CITY ?auto_5162 ?auto_5166 ) ( not ( = ?auto_5162 ?auto_5168 ) ) ( OBJ-AT ?auto_5169 ?auto_5162 ) ( not ( = ?auto_5169 ?auto_5164 ) ) ( OBJ-AT ?auto_5164 ?auto_5168 ) ( OBJ-AT ?auto_5163 ?auto_5162 ) ( OBJ-AT ?auto_5165 ?auto_5162 ) ( not ( = ?auto_5163 ?auto_5164 ) ) ( not ( = ?auto_5163 ?auto_5165 ) ) ( not ( = ?auto_5163 ?auto_5169 ) ) ( not ( = ?auto_5164 ?auto_5165 ) ) ( not ( = ?auto_5165 ?auto_5169 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5169 ?auto_5164 ?auto_5162 )
      ( DELIVER-3PKG-VERIFY ?auto_5163 ?auto_5164 ?auto_5165 ?auto_5162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5201 - OBJ
      ?auto_5202 - OBJ
      ?auto_5203 - OBJ
      ?auto_5200 - LOCATION
    )
    :vars
    (
      ?auto_5205 - TRUCK
      ?auto_5206 - LOCATION
      ?auto_5204 - CITY
      ?auto_5207 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5205 ?auto_5206 ) ( IN-CITY ?auto_5206 ?auto_5204 ) ( IN-CITY ?auto_5200 ?auto_5204 ) ( not ( = ?auto_5200 ?auto_5206 ) ) ( OBJ-AT ?auto_5207 ?auto_5200 ) ( not ( = ?auto_5207 ?auto_5201 ) ) ( OBJ-AT ?auto_5201 ?auto_5206 ) ( OBJ-AT ?auto_5202 ?auto_5200 ) ( OBJ-AT ?auto_5203 ?auto_5200 ) ( not ( = ?auto_5201 ?auto_5202 ) ) ( not ( = ?auto_5201 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5203 ) ) ( not ( = ?auto_5202 ?auto_5207 ) ) ( not ( = ?auto_5203 ?auto_5207 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5207 ?auto_5201 ?auto_5200 )
      ( DELIVER-3PKG-VERIFY ?auto_5201 ?auto_5202 ?auto_5203 ?auto_5200 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5271 - OBJ
      ?auto_5272 - OBJ
      ?auto_5273 - OBJ
      ?auto_5270 - LOCATION
    )
    :vars
    (
      ?auto_5276 - LOCATION
      ?auto_5275 - CITY
      ?auto_5274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5276 ?auto_5275 ) ( IN-CITY ?auto_5270 ?auto_5275 ) ( not ( = ?auto_5270 ?auto_5276 ) ) ( OBJ-AT ?auto_5271 ?auto_5270 ) ( not ( = ?auto_5271 ?auto_5273 ) ) ( OBJ-AT ?auto_5273 ?auto_5276 ) ( TRUCK-AT ?auto_5274 ?auto_5270 ) ( OBJ-AT ?auto_5272 ?auto_5270 ) ( not ( = ?auto_5271 ?auto_5272 ) ) ( not ( = ?auto_5272 ?auto_5273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5271 ?auto_5273 ?auto_5270 )
      ( DELIVER-3PKG-VERIFY ?auto_5271 ?auto_5272 ?auto_5273 ?auto_5270 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5282 - OBJ
      ?auto_5283 - OBJ
      ?auto_5284 - OBJ
      ?auto_5281 - LOCATION
    )
    :vars
    (
      ?auto_5287 - LOCATION
      ?auto_5286 - CITY
      ?auto_5285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5287 ?auto_5286 ) ( IN-CITY ?auto_5281 ?auto_5286 ) ( not ( = ?auto_5281 ?auto_5287 ) ) ( OBJ-AT ?auto_5284 ?auto_5281 ) ( not ( = ?auto_5284 ?auto_5283 ) ) ( OBJ-AT ?auto_5283 ?auto_5287 ) ( TRUCK-AT ?auto_5285 ?auto_5281 ) ( OBJ-AT ?auto_5282 ?auto_5281 ) ( not ( = ?auto_5282 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5284 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5284 ?auto_5283 ?auto_5281 )
      ( DELIVER-3PKG-VERIFY ?auto_5282 ?auto_5283 ?auto_5284 ?auto_5281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5304 - OBJ
      ?auto_5305 - OBJ
      ?auto_5306 - OBJ
      ?auto_5303 - LOCATION
    )
    :vars
    (
      ?auto_5309 - LOCATION
      ?auto_5308 - CITY
      ?auto_5310 - OBJ
      ?auto_5307 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5309 ?auto_5308 ) ( IN-CITY ?auto_5303 ?auto_5308 ) ( not ( = ?auto_5303 ?auto_5309 ) ) ( OBJ-AT ?auto_5310 ?auto_5303 ) ( not ( = ?auto_5310 ?auto_5306 ) ) ( OBJ-AT ?auto_5306 ?auto_5309 ) ( TRUCK-AT ?auto_5307 ?auto_5303 ) ( OBJ-AT ?auto_5304 ?auto_5303 ) ( OBJ-AT ?auto_5305 ?auto_5303 ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5306 ) ) ( not ( = ?auto_5304 ?auto_5310 ) ) ( not ( = ?auto_5305 ?auto_5306 ) ) ( not ( = ?auto_5305 ?auto_5310 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5310 ?auto_5306 ?auto_5303 )
      ( DELIVER-3PKG-VERIFY ?auto_5304 ?auto_5305 ?auto_5306 ?auto_5303 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5316 - OBJ
      ?auto_5317 - OBJ
      ?auto_5318 - OBJ
      ?auto_5315 - LOCATION
    )
    :vars
    (
      ?auto_5321 - LOCATION
      ?auto_5320 - CITY
      ?auto_5322 - OBJ
      ?auto_5319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5321 ?auto_5320 ) ( IN-CITY ?auto_5315 ?auto_5320 ) ( not ( = ?auto_5315 ?auto_5321 ) ) ( OBJ-AT ?auto_5322 ?auto_5315 ) ( not ( = ?auto_5322 ?auto_5317 ) ) ( OBJ-AT ?auto_5317 ?auto_5321 ) ( TRUCK-AT ?auto_5319 ?auto_5315 ) ( OBJ-AT ?auto_5316 ?auto_5315 ) ( OBJ-AT ?auto_5318 ?auto_5315 ) ( not ( = ?auto_5316 ?auto_5317 ) ) ( not ( = ?auto_5316 ?auto_5318 ) ) ( not ( = ?auto_5316 ?auto_5322 ) ) ( not ( = ?auto_5317 ?auto_5318 ) ) ( not ( = ?auto_5318 ?auto_5322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5322 ?auto_5317 ?auto_5315 )
      ( DELIVER-3PKG-VERIFY ?auto_5316 ?auto_5317 ?auto_5318 ?auto_5315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5354 - OBJ
      ?auto_5355 - OBJ
      ?auto_5356 - OBJ
      ?auto_5353 - LOCATION
    )
    :vars
    (
      ?auto_5359 - LOCATION
      ?auto_5358 - CITY
      ?auto_5360 - OBJ
      ?auto_5357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5359 ?auto_5358 ) ( IN-CITY ?auto_5353 ?auto_5358 ) ( not ( = ?auto_5353 ?auto_5359 ) ) ( OBJ-AT ?auto_5360 ?auto_5353 ) ( not ( = ?auto_5360 ?auto_5354 ) ) ( OBJ-AT ?auto_5354 ?auto_5359 ) ( TRUCK-AT ?auto_5357 ?auto_5353 ) ( OBJ-AT ?auto_5355 ?auto_5353 ) ( OBJ-AT ?auto_5356 ?auto_5353 ) ( not ( = ?auto_5354 ?auto_5355 ) ) ( not ( = ?auto_5354 ?auto_5356 ) ) ( not ( = ?auto_5355 ?auto_5356 ) ) ( not ( = ?auto_5355 ?auto_5360 ) ) ( not ( = ?auto_5356 ?auto_5360 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5360 ?auto_5354 ?auto_5353 )
      ( DELIVER-3PKG-VERIFY ?auto_5354 ?auto_5355 ?auto_5356 ?auto_5353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5495 - OBJ
      ?auto_5496 - OBJ
      ?auto_5497 - OBJ
      ?auto_5494 - LOCATION
    )
    :vars
    (
      ?auto_5500 - LOCATION
      ?auto_5499 - CITY
      ?auto_5498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5500 ?auto_5499 ) ( IN-CITY ?auto_5494 ?auto_5499 ) ( not ( = ?auto_5494 ?auto_5500 ) ) ( OBJ-AT ?auto_5497 ?auto_5494 ) ( not ( = ?auto_5497 ?auto_5495 ) ) ( OBJ-AT ?auto_5495 ?auto_5500 ) ( TRUCK-AT ?auto_5498 ?auto_5494 ) ( OBJ-AT ?auto_5496 ?auto_5494 ) ( not ( = ?auto_5495 ?auto_5496 ) ) ( not ( = ?auto_5496 ?auto_5497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5497 ?auto_5495 ?auto_5494 )
      ( DELIVER-3PKG-VERIFY ?auto_5495 ?auto_5496 ?auto_5497 ?auto_5494 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5562 - OBJ
      ?auto_5561 - LOCATION
    )
    :vars
    (
      ?auto_5566 - LOCATION
      ?auto_5565 - CITY
      ?auto_5564 - OBJ
      ?auto_5563 - TRUCK
      ?auto_5567 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5566 ?auto_5565 ) ( IN-CITY ?auto_5561 ?auto_5565 ) ( not ( = ?auto_5561 ?auto_5566 ) ) ( OBJ-AT ?auto_5564 ?auto_5561 ) ( not ( = ?auto_5564 ?auto_5562 ) ) ( OBJ-AT ?auto_5562 ?auto_5566 ) ( TRUCK-AT ?auto_5563 ?auto_5567 ) ( IN-CITY ?auto_5567 ?auto_5565 ) ( not ( = ?auto_5561 ?auto_5567 ) ) ( not ( = ?auto_5566 ?auto_5567 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5563 ?auto_5567 ?auto_5561 ?auto_5565 )
      ( DELIVER-2PKG ?auto_5564 ?auto_5562 ?auto_5561 )
      ( DELIVER-1PKG-VERIFY ?auto_5562 ?auto_5561 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5569 - OBJ
      ?auto_5570 - OBJ
      ?auto_5568 - LOCATION
    )
    :vars
    (
      ?auto_5571 - LOCATION
      ?auto_5573 - CITY
      ?auto_5572 - TRUCK
      ?auto_5574 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5571 ?auto_5573 ) ( IN-CITY ?auto_5568 ?auto_5573 ) ( not ( = ?auto_5568 ?auto_5571 ) ) ( OBJ-AT ?auto_5569 ?auto_5568 ) ( not ( = ?auto_5569 ?auto_5570 ) ) ( OBJ-AT ?auto_5570 ?auto_5571 ) ( TRUCK-AT ?auto_5572 ?auto_5574 ) ( IN-CITY ?auto_5574 ?auto_5573 ) ( not ( = ?auto_5568 ?auto_5574 ) ) ( not ( = ?auto_5571 ?auto_5574 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5570 ?auto_5568 )
      ( DELIVER-2PKG-VERIFY ?auto_5569 ?auto_5570 ?auto_5568 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5584 - OBJ
      ?auto_5585 - OBJ
      ?auto_5583 - LOCATION
    )
    :vars
    (
      ?auto_5586 - LOCATION
      ?auto_5588 - CITY
      ?auto_5587 - TRUCK
      ?auto_5589 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5586 ?auto_5588 ) ( IN-CITY ?auto_5583 ?auto_5588 ) ( not ( = ?auto_5583 ?auto_5586 ) ) ( OBJ-AT ?auto_5585 ?auto_5583 ) ( not ( = ?auto_5585 ?auto_5584 ) ) ( OBJ-AT ?auto_5584 ?auto_5586 ) ( TRUCK-AT ?auto_5587 ?auto_5589 ) ( IN-CITY ?auto_5589 ?auto_5588 ) ( not ( = ?auto_5583 ?auto_5589 ) ) ( not ( = ?auto_5586 ?auto_5589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5585 ?auto_5584 ?auto_5583 )
      ( DELIVER-2PKG-VERIFY ?auto_5584 ?auto_5585 ?auto_5583 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5607 - OBJ
      ?auto_5608 - OBJ
      ?auto_5609 - OBJ
      ?auto_5606 - LOCATION
    )
    :vars
    (
      ?auto_5610 - LOCATION
      ?auto_5612 - CITY
      ?auto_5611 - TRUCK
      ?auto_5613 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5610 ?auto_5612 ) ( IN-CITY ?auto_5606 ?auto_5612 ) ( not ( = ?auto_5606 ?auto_5610 ) ) ( OBJ-AT ?auto_5608 ?auto_5606 ) ( not ( = ?auto_5608 ?auto_5609 ) ) ( OBJ-AT ?auto_5609 ?auto_5610 ) ( TRUCK-AT ?auto_5611 ?auto_5613 ) ( IN-CITY ?auto_5613 ?auto_5612 ) ( not ( = ?auto_5606 ?auto_5613 ) ) ( not ( = ?auto_5610 ?auto_5613 ) ) ( OBJ-AT ?auto_5607 ?auto_5606 ) ( not ( = ?auto_5607 ?auto_5608 ) ) ( not ( = ?auto_5607 ?auto_5609 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5608 ?auto_5609 ?auto_5606 )
      ( DELIVER-3PKG-VERIFY ?auto_5607 ?auto_5608 ?auto_5609 ?auto_5606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5623 - OBJ
      ?auto_5624 - OBJ
      ?auto_5625 - OBJ
      ?auto_5622 - LOCATION
    )
    :vars
    (
      ?auto_5626 - LOCATION
      ?auto_5628 - CITY
      ?auto_5627 - TRUCK
      ?auto_5629 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5626 ?auto_5628 ) ( IN-CITY ?auto_5622 ?auto_5628 ) ( not ( = ?auto_5622 ?auto_5626 ) ) ( OBJ-AT ?auto_5625 ?auto_5622 ) ( not ( = ?auto_5625 ?auto_5624 ) ) ( OBJ-AT ?auto_5624 ?auto_5626 ) ( TRUCK-AT ?auto_5627 ?auto_5629 ) ( IN-CITY ?auto_5629 ?auto_5628 ) ( not ( = ?auto_5622 ?auto_5629 ) ) ( not ( = ?auto_5626 ?auto_5629 ) ) ( OBJ-AT ?auto_5623 ?auto_5622 ) ( not ( = ?auto_5623 ?auto_5624 ) ) ( not ( = ?auto_5623 ?auto_5625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5625 ?auto_5624 ?auto_5622 )
      ( DELIVER-3PKG-VERIFY ?auto_5623 ?auto_5624 ?auto_5625 ?auto_5622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5690 - OBJ
      ?auto_5691 - OBJ
      ?auto_5692 - OBJ
      ?auto_5689 - LOCATION
    )
    :vars
    (
      ?auto_5693 - LOCATION
      ?auto_5695 - CITY
      ?auto_5694 - TRUCK
      ?auto_5696 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5693 ?auto_5695 ) ( IN-CITY ?auto_5689 ?auto_5695 ) ( not ( = ?auto_5689 ?auto_5693 ) ) ( OBJ-AT ?auto_5691 ?auto_5689 ) ( not ( = ?auto_5691 ?auto_5690 ) ) ( OBJ-AT ?auto_5690 ?auto_5693 ) ( TRUCK-AT ?auto_5694 ?auto_5696 ) ( IN-CITY ?auto_5696 ?auto_5695 ) ( not ( = ?auto_5689 ?auto_5696 ) ) ( not ( = ?auto_5693 ?auto_5696 ) ) ( OBJ-AT ?auto_5692 ?auto_5689 ) ( not ( = ?auto_5690 ?auto_5692 ) ) ( not ( = ?auto_5691 ?auto_5692 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5691 ?auto_5690 ?auto_5689 )
      ( DELIVER-3PKG-VERIFY ?auto_5690 ?auto_5691 ?auto_5692 ?auto_5689 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5798 - OBJ
      ?auto_5799 - OBJ
      ?auto_5800 - OBJ
      ?auto_5797 - LOCATION
    )
    :vars
    (
      ?auto_5802 - LOCATION
      ?auto_5804 - CITY
      ?auto_5801 - TRUCK
      ?auto_5803 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5802 ?auto_5804 ) ( IN-CITY ?auto_5797 ?auto_5804 ) ( not ( = ?auto_5797 ?auto_5802 ) ) ( OBJ-AT ?auto_5798 ?auto_5797 ) ( not ( = ?auto_5798 ?auto_5800 ) ) ( OBJ-AT ?auto_5800 ?auto_5802 ) ( TRUCK-AT ?auto_5801 ?auto_5803 ) ( IN-CITY ?auto_5803 ?auto_5804 ) ( not ( = ?auto_5797 ?auto_5803 ) ) ( not ( = ?auto_5802 ?auto_5803 ) ) ( OBJ-AT ?auto_5799 ?auto_5797 ) ( not ( = ?auto_5798 ?auto_5799 ) ) ( not ( = ?auto_5799 ?auto_5800 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5798 ?auto_5800 ?auto_5797 )
      ( DELIVER-3PKG-VERIFY ?auto_5798 ?auto_5799 ?auto_5800 ?auto_5797 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6295 - OBJ
      ?auto_6294 - LOCATION
    )
    :vars
    (
      ?auto_6299 - LOCATION
      ?auto_6298 - CITY
      ?auto_6297 - OBJ
      ?auto_6296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6299 ?auto_6298 ) ( IN-CITY ?auto_6294 ?auto_6298 ) ( not ( = ?auto_6294 ?auto_6299 ) ) ( not ( = ?auto_6297 ?auto_6295 ) ) ( OBJ-AT ?auto_6295 ?auto_6299 ) ( IN-TRUCK ?auto_6297 ?auto_6296 ) ( TRUCK-AT ?auto_6296 ?auto_6299 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6296 ?auto_6299 ?auto_6294 ?auto_6298 )
      ( DELIVER-2PKG ?auto_6297 ?auto_6295 ?auto_6294 )
      ( DELIVER-1PKG-VERIFY ?auto_6295 ?auto_6294 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6301 - OBJ
      ?auto_6302 - OBJ
      ?auto_6300 - LOCATION
    )
    :vars
    (
      ?auto_6304 - LOCATION
      ?auto_6303 - CITY
      ?auto_6305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6304 ?auto_6303 ) ( IN-CITY ?auto_6300 ?auto_6303 ) ( not ( = ?auto_6300 ?auto_6304 ) ) ( not ( = ?auto_6301 ?auto_6302 ) ) ( OBJ-AT ?auto_6302 ?auto_6304 ) ( IN-TRUCK ?auto_6301 ?auto_6305 ) ( TRUCK-AT ?auto_6305 ?auto_6304 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6302 ?auto_6300 )
      ( DELIVER-2PKG-VERIFY ?auto_6301 ?auto_6302 ?auto_6300 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6314 - OBJ
      ?auto_6315 - OBJ
      ?auto_6313 - LOCATION
    )
    :vars
    (
      ?auto_6316 - LOCATION
      ?auto_6317 - CITY
      ?auto_6318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6316 ?auto_6317 ) ( IN-CITY ?auto_6313 ?auto_6317 ) ( not ( = ?auto_6313 ?auto_6316 ) ) ( not ( = ?auto_6315 ?auto_6314 ) ) ( OBJ-AT ?auto_6314 ?auto_6316 ) ( IN-TRUCK ?auto_6315 ?auto_6318 ) ( TRUCK-AT ?auto_6318 ?auto_6316 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6315 ?auto_6314 ?auto_6313 )
      ( DELIVER-2PKG-VERIFY ?auto_6314 ?auto_6315 ?auto_6313 ) )
  )

)

