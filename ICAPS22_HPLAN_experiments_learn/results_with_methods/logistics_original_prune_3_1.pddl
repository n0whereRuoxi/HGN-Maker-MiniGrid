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
      ?auto_4051 - OBJ
      ?auto_4050 - LOCATION
    )
    :vars
    (
      ?auto_4052 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4052 ?auto_4050 ) ( IN-TRUCK ?auto_4051 ?auto_4052 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4051 ?auto_4052 ?auto_4050 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4063 - OBJ
      ?auto_4062 - LOCATION
    )
    :vars
    (
      ?auto_4064 - TRUCK
      ?auto_4065 - LOCATION
      ?auto_4066 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4063 ?auto_4064 ) ( TRUCK-AT ?auto_4064 ?auto_4065 ) ( IN-CITY ?auto_4065 ?auto_4066 ) ( IN-CITY ?auto_4062 ?auto_4066 ) ( not ( = ?auto_4062 ?auto_4065 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4064 ?auto_4065 ?auto_4062 ?auto_4066 )
      ( DELIVER-1PKG ?auto_4063 ?auto_4062 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4081 - OBJ
      ?auto_4080 - LOCATION
    )
    :vars
    (
      ?auto_4084 - TRUCK
      ?auto_4083 - LOCATION
      ?auto_4082 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4084 ?auto_4083 ) ( IN-CITY ?auto_4083 ?auto_4082 ) ( IN-CITY ?auto_4080 ?auto_4082 ) ( not ( = ?auto_4080 ?auto_4083 ) ) ( OBJ-AT ?auto_4081 ?auto_4083 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4081 ?auto_4084 ?auto_4083 )
      ( DELIVER-1PKG ?auto_4081 ?auto_4080 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4099 - OBJ
      ?auto_4098 - LOCATION
    )
    :vars
    (
      ?auto_4102 - LOCATION
      ?auto_4100 - CITY
      ?auto_4101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4102 ?auto_4100 ) ( IN-CITY ?auto_4098 ?auto_4100 ) ( not ( = ?auto_4098 ?auto_4102 ) ) ( OBJ-AT ?auto_4099 ?auto_4102 ) ( TRUCK-AT ?auto_4101 ?auto_4098 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4101 ?auto_4098 ?auto_4102 ?auto_4100 )
      ( DELIVER-1PKG ?auto_4099 ?auto_4098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4159 - OBJ
      ?auto_4160 - OBJ
      ?auto_4158 - LOCATION
    )
    :vars
    (
      ?auto_4161 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4161 ?auto_4158 ) ( IN-TRUCK ?auto_4160 ?auto_4161 ) ( OBJ-AT ?auto_4159 ?auto_4158 ) ( not ( = ?auto_4159 ?auto_4160 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4160 ?auto_4158 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4163 - OBJ
      ?auto_4164 - OBJ
      ?auto_4162 - LOCATION
    )
    :vars
    (
      ?auto_4165 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4165 ?auto_4162 ) ( IN-TRUCK ?auto_4163 ?auto_4165 ) ( OBJ-AT ?auto_4164 ?auto_4162 ) ( not ( = ?auto_4163 ?auto_4164 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4163 ?auto_4162 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4171 - OBJ
      ?auto_4172 - OBJ
      ?auto_4173 - OBJ
      ?auto_4170 - LOCATION
    )
    :vars
    (
      ?auto_4174 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4174 ?auto_4170 ) ( IN-TRUCK ?auto_4173 ?auto_4174 ) ( OBJ-AT ?auto_4171 ?auto_4170 ) ( OBJ-AT ?auto_4172 ?auto_4170 ) ( not ( = ?auto_4171 ?auto_4172 ) ) ( not ( = ?auto_4171 ?auto_4173 ) ) ( not ( = ?auto_4172 ?auto_4173 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4173 ?auto_4170 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4176 - OBJ
      ?auto_4177 - OBJ
      ?auto_4178 - OBJ
      ?auto_4175 - LOCATION
    )
    :vars
    (
      ?auto_4179 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4179 ?auto_4175 ) ( IN-TRUCK ?auto_4177 ?auto_4179 ) ( OBJ-AT ?auto_4176 ?auto_4175 ) ( OBJ-AT ?auto_4178 ?auto_4175 ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( not ( = ?auto_4176 ?auto_4178 ) ) ( not ( = ?auto_4177 ?auto_4178 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4177 ?auto_4175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4186 - OBJ
      ?auto_4187 - OBJ
      ?auto_4188 - OBJ
      ?auto_4185 - LOCATION
    )
    :vars
    (
      ?auto_4189 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4189 ?auto_4185 ) ( IN-TRUCK ?auto_4186 ?auto_4189 ) ( OBJ-AT ?auto_4187 ?auto_4185 ) ( OBJ-AT ?auto_4188 ?auto_4185 ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4188 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4186 ?auto_4185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4211 - OBJ
      ?auto_4212 - OBJ
      ?auto_4210 - LOCATION
    )
    :vars
    (
      ?auto_4215 - TRUCK
      ?auto_4214 - LOCATION
      ?auto_4213 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4212 ?auto_4215 ) ( TRUCK-AT ?auto_4215 ?auto_4214 ) ( IN-CITY ?auto_4214 ?auto_4213 ) ( IN-CITY ?auto_4210 ?auto_4213 ) ( not ( = ?auto_4210 ?auto_4214 ) ) ( OBJ-AT ?auto_4211 ?auto_4210 ) ( not ( = ?auto_4211 ?auto_4212 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4212 ?auto_4210 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4217 - OBJ
      ?auto_4218 - OBJ
      ?auto_4216 - LOCATION
    )
    :vars
    (
      ?auto_4220 - TRUCK
      ?auto_4221 - LOCATION
      ?auto_4219 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4217 ?auto_4220 ) ( TRUCK-AT ?auto_4220 ?auto_4221 ) ( IN-CITY ?auto_4221 ?auto_4219 ) ( IN-CITY ?auto_4216 ?auto_4219 ) ( not ( = ?auto_4216 ?auto_4221 ) ) ( OBJ-AT ?auto_4218 ?auto_4216 ) ( not ( = ?auto_4218 ?auto_4217 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4218 ?auto_4217 ?auto_4216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4230 - OBJ
      ?auto_4231 - OBJ
      ?auto_4232 - OBJ
      ?auto_4229 - LOCATION
    )
    :vars
    (
      ?auto_4234 - TRUCK
      ?auto_4235 - LOCATION
      ?auto_4233 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4232 ?auto_4234 ) ( TRUCK-AT ?auto_4234 ?auto_4235 ) ( IN-CITY ?auto_4235 ?auto_4233 ) ( IN-CITY ?auto_4229 ?auto_4233 ) ( not ( = ?auto_4229 ?auto_4235 ) ) ( OBJ-AT ?auto_4231 ?auto_4229 ) ( not ( = ?auto_4231 ?auto_4232 ) ) ( OBJ-AT ?auto_4230 ?auto_4229 ) ( not ( = ?auto_4230 ?auto_4231 ) ) ( not ( = ?auto_4230 ?auto_4232 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4231 ?auto_4232 ?auto_4229 ) )
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
      ?auto_4241 - TRUCK
      ?auto_4242 - LOCATION
      ?auto_4240 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4238 ?auto_4241 ) ( TRUCK-AT ?auto_4241 ?auto_4242 ) ( IN-CITY ?auto_4242 ?auto_4240 ) ( IN-CITY ?auto_4236 ?auto_4240 ) ( not ( = ?auto_4236 ?auto_4242 ) ) ( OBJ-AT ?auto_4239 ?auto_4236 ) ( not ( = ?auto_4239 ?auto_4238 ) ) ( OBJ-AT ?auto_4237 ?auto_4236 ) ( not ( = ?auto_4237 ?auto_4238 ) ) ( not ( = ?auto_4237 ?auto_4239 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4239 ?auto_4238 ?auto_4236 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4251 - OBJ
      ?auto_4252 - OBJ
      ?auto_4253 - OBJ
      ?auto_4250 - LOCATION
    )
    :vars
    (
      ?auto_4255 - TRUCK
      ?auto_4256 - LOCATION
      ?auto_4254 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4251 ?auto_4255 ) ( TRUCK-AT ?auto_4255 ?auto_4256 ) ( IN-CITY ?auto_4256 ?auto_4254 ) ( IN-CITY ?auto_4250 ?auto_4254 ) ( not ( = ?auto_4250 ?auto_4256 ) ) ( OBJ-AT ?auto_4253 ?auto_4250 ) ( not ( = ?auto_4253 ?auto_4251 ) ) ( OBJ-AT ?auto_4252 ?auto_4250 ) ( not ( = ?auto_4251 ?auto_4252 ) ) ( not ( = ?auto_4252 ?auto_4253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4253 ?auto_4251 ?auto_4250 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4280 - OBJ
      ?auto_4279 - LOCATION
    )
    :vars
    (
      ?auto_4283 - TRUCK
      ?auto_4284 - LOCATION
      ?auto_4282 - CITY
      ?auto_4281 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4283 ?auto_4284 ) ( IN-CITY ?auto_4284 ?auto_4282 ) ( IN-CITY ?auto_4279 ?auto_4282 ) ( not ( = ?auto_4279 ?auto_4284 ) ) ( OBJ-AT ?auto_4281 ?auto_4279 ) ( not ( = ?auto_4281 ?auto_4280 ) ) ( OBJ-AT ?auto_4280 ?auto_4284 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4280 ?auto_4283 ?auto_4284 )
      ( DELIVER-2PKG ?auto_4281 ?auto_4280 ?auto_4279 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4286 - OBJ
      ?auto_4287 - OBJ
      ?auto_4285 - LOCATION
    )
    :vars
    (
      ?auto_4290 - TRUCK
      ?auto_4289 - LOCATION
      ?auto_4288 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4290 ?auto_4289 ) ( IN-CITY ?auto_4289 ?auto_4288 ) ( IN-CITY ?auto_4285 ?auto_4288 ) ( not ( = ?auto_4285 ?auto_4289 ) ) ( OBJ-AT ?auto_4286 ?auto_4285 ) ( not ( = ?auto_4286 ?auto_4287 ) ) ( OBJ-AT ?auto_4287 ?auto_4289 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4287 ?auto_4285 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4292 - OBJ
      ?auto_4293 - OBJ
      ?auto_4291 - LOCATION
    )
    :vars
    (
      ?auto_4296 - TRUCK
      ?auto_4294 - LOCATION
      ?auto_4295 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4296 ?auto_4294 ) ( IN-CITY ?auto_4294 ?auto_4295 ) ( IN-CITY ?auto_4291 ?auto_4295 ) ( not ( = ?auto_4291 ?auto_4294 ) ) ( OBJ-AT ?auto_4293 ?auto_4291 ) ( not ( = ?auto_4293 ?auto_4292 ) ) ( OBJ-AT ?auto_4292 ?auto_4294 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4293 ?auto_4292 ?auto_4291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4305 - OBJ
      ?auto_4306 - OBJ
      ?auto_4307 - OBJ
      ?auto_4304 - LOCATION
    )
    :vars
    (
      ?auto_4310 - TRUCK
      ?auto_4308 - LOCATION
      ?auto_4309 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4310 ?auto_4308 ) ( IN-CITY ?auto_4308 ?auto_4309 ) ( IN-CITY ?auto_4304 ?auto_4309 ) ( not ( = ?auto_4304 ?auto_4308 ) ) ( OBJ-AT ?auto_4306 ?auto_4304 ) ( not ( = ?auto_4306 ?auto_4307 ) ) ( OBJ-AT ?auto_4307 ?auto_4308 ) ( OBJ-AT ?auto_4305 ?auto_4304 ) ( not ( = ?auto_4305 ?auto_4306 ) ) ( not ( = ?auto_4305 ?auto_4307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4306 ?auto_4307 ?auto_4304 ) )
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
      ?auto_4317 - TRUCK
      ?auto_4315 - LOCATION
      ?auto_4316 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4317 ?auto_4315 ) ( IN-CITY ?auto_4315 ?auto_4316 ) ( IN-CITY ?auto_4311 ?auto_4316 ) ( not ( = ?auto_4311 ?auto_4315 ) ) ( OBJ-AT ?auto_4312 ?auto_4311 ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( OBJ-AT ?auto_4313 ?auto_4315 ) ( OBJ-AT ?auto_4314 ?auto_4311 ) ( not ( = ?auto_4312 ?auto_4314 ) ) ( not ( = ?auto_4313 ?auto_4314 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4312 ?auto_4313 ?auto_4311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4326 - OBJ
      ?auto_4327 - OBJ
      ?auto_4328 - OBJ
      ?auto_4325 - LOCATION
    )
    :vars
    (
      ?auto_4331 - TRUCK
      ?auto_4329 - LOCATION
      ?auto_4330 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4331 ?auto_4329 ) ( IN-CITY ?auto_4329 ?auto_4330 ) ( IN-CITY ?auto_4325 ?auto_4330 ) ( not ( = ?auto_4325 ?auto_4329 ) ) ( OBJ-AT ?auto_4327 ?auto_4325 ) ( not ( = ?auto_4327 ?auto_4326 ) ) ( OBJ-AT ?auto_4326 ?auto_4329 ) ( OBJ-AT ?auto_4328 ?auto_4325 ) ( not ( = ?auto_4326 ?auto_4328 ) ) ( not ( = ?auto_4327 ?auto_4328 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4327 ?auto_4326 ?auto_4325 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4355 - OBJ
      ?auto_4354 - LOCATION
    )
    :vars
    (
      ?auto_4356 - LOCATION
      ?auto_4358 - CITY
      ?auto_4357 - OBJ
      ?auto_4359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4356 ?auto_4358 ) ( IN-CITY ?auto_4354 ?auto_4358 ) ( not ( = ?auto_4354 ?auto_4356 ) ) ( OBJ-AT ?auto_4357 ?auto_4354 ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( OBJ-AT ?auto_4355 ?auto_4356 ) ( TRUCK-AT ?auto_4359 ?auto_4354 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4359 ?auto_4354 ?auto_4356 ?auto_4358 )
      ( DELIVER-2PKG ?auto_4357 ?auto_4355 ?auto_4354 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4361 - OBJ
      ?auto_4362 - OBJ
      ?auto_4360 - LOCATION
    )
    :vars
    (
      ?auto_4365 - LOCATION
      ?auto_4364 - CITY
      ?auto_4363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4365 ?auto_4364 ) ( IN-CITY ?auto_4360 ?auto_4364 ) ( not ( = ?auto_4360 ?auto_4365 ) ) ( OBJ-AT ?auto_4361 ?auto_4360 ) ( not ( = ?auto_4361 ?auto_4362 ) ) ( OBJ-AT ?auto_4362 ?auto_4365 ) ( TRUCK-AT ?auto_4363 ?auto_4360 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4362 ?auto_4360 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4367 - OBJ
      ?auto_4368 - OBJ
      ?auto_4366 - LOCATION
    )
    :vars
    (
      ?auto_4369 - LOCATION
      ?auto_4371 - CITY
      ?auto_4370 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4369 ?auto_4371 ) ( IN-CITY ?auto_4366 ?auto_4371 ) ( not ( = ?auto_4366 ?auto_4369 ) ) ( OBJ-AT ?auto_4368 ?auto_4366 ) ( not ( = ?auto_4368 ?auto_4367 ) ) ( OBJ-AT ?auto_4367 ?auto_4369 ) ( TRUCK-AT ?auto_4370 ?auto_4366 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4368 ?auto_4367 ?auto_4366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4380 - OBJ
      ?auto_4381 - OBJ
      ?auto_4382 - OBJ
      ?auto_4379 - LOCATION
    )
    :vars
    (
      ?auto_4383 - LOCATION
      ?auto_4385 - CITY
      ?auto_4384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4383 ?auto_4385 ) ( IN-CITY ?auto_4379 ?auto_4385 ) ( not ( = ?auto_4379 ?auto_4383 ) ) ( OBJ-AT ?auto_4381 ?auto_4379 ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( OBJ-AT ?auto_4382 ?auto_4383 ) ( TRUCK-AT ?auto_4384 ?auto_4379 ) ( OBJ-AT ?auto_4380 ?auto_4379 ) ( not ( = ?auto_4380 ?auto_4381 ) ) ( not ( = ?auto_4380 ?auto_4382 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4381 ?auto_4382 ?auto_4379 ) )
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
    ( and ( IN-CITY ?auto_4390 ?auto_4392 ) ( IN-CITY ?auto_4386 ?auto_4392 ) ( not ( = ?auto_4386 ?auto_4390 ) ) ( OBJ-AT ?auto_4387 ?auto_4386 ) ( not ( = ?auto_4387 ?auto_4388 ) ) ( OBJ-AT ?auto_4388 ?auto_4390 ) ( TRUCK-AT ?auto_4391 ?auto_4386 ) ( OBJ-AT ?auto_4389 ?auto_4386 ) ( not ( = ?auto_4387 ?auto_4389 ) ) ( not ( = ?auto_4388 ?auto_4389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4387 ?auto_4388 ?auto_4386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4401 - OBJ
      ?auto_4402 - OBJ
      ?auto_4403 - OBJ
      ?auto_4400 - LOCATION
    )
    :vars
    (
      ?auto_4404 - LOCATION
      ?auto_4406 - CITY
      ?auto_4405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4404 ?auto_4406 ) ( IN-CITY ?auto_4400 ?auto_4406 ) ( not ( = ?auto_4400 ?auto_4404 ) ) ( OBJ-AT ?auto_4403 ?auto_4400 ) ( not ( = ?auto_4403 ?auto_4401 ) ) ( OBJ-AT ?auto_4401 ?auto_4404 ) ( TRUCK-AT ?auto_4405 ?auto_4400 ) ( OBJ-AT ?auto_4402 ?auto_4400 ) ( not ( = ?auto_4401 ?auto_4402 ) ) ( not ( = ?auto_4402 ?auto_4403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4403 ?auto_4401 ?auto_4400 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4430 - OBJ
      ?auto_4429 - LOCATION
    )
    :vars
    (
      ?auto_4431 - LOCATION
      ?auto_4433 - CITY
      ?auto_4434 - OBJ
      ?auto_4432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4431 ?auto_4433 ) ( IN-CITY ?auto_4429 ?auto_4433 ) ( not ( = ?auto_4429 ?auto_4431 ) ) ( not ( = ?auto_4434 ?auto_4430 ) ) ( OBJ-AT ?auto_4430 ?auto_4431 ) ( TRUCK-AT ?auto_4432 ?auto_4429 ) ( IN-TRUCK ?auto_4434 ?auto_4432 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4434 ?auto_4429 )
      ( DELIVER-2PKG ?auto_4434 ?auto_4430 ?auto_4429 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4436 - OBJ
      ?auto_4437 - OBJ
      ?auto_4435 - LOCATION
    )
    :vars
    (
      ?auto_4440 - LOCATION
      ?auto_4438 - CITY
      ?auto_4439 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4440 ?auto_4438 ) ( IN-CITY ?auto_4435 ?auto_4438 ) ( not ( = ?auto_4435 ?auto_4440 ) ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( OBJ-AT ?auto_4437 ?auto_4440 ) ( TRUCK-AT ?auto_4439 ?auto_4435 ) ( IN-TRUCK ?auto_4436 ?auto_4439 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4437 ?auto_4435 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4442 - OBJ
      ?auto_4443 - OBJ
      ?auto_4441 - LOCATION
    )
    :vars
    (
      ?auto_4446 - LOCATION
      ?auto_4445 - CITY
      ?auto_4444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4446 ?auto_4445 ) ( IN-CITY ?auto_4441 ?auto_4445 ) ( not ( = ?auto_4441 ?auto_4446 ) ) ( not ( = ?auto_4443 ?auto_4442 ) ) ( OBJ-AT ?auto_4442 ?auto_4446 ) ( TRUCK-AT ?auto_4444 ?auto_4441 ) ( IN-TRUCK ?auto_4443 ?auto_4444 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4443 ?auto_4442 ?auto_4441 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4505 - OBJ
      ?auto_4504 - LOCATION
    )
    :vars
    (
      ?auto_4509 - LOCATION
      ?auto_4507 - CITY
      ?auto_4508 - OBJ
      ?auto_4506 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4509 ?auto_4507 ) ( IN-CITY ?auto_4504 ?auto_4507 ) ( not ( = ?auto_4504 ?auto_4509 ) ) ( not ( = ?auto_4508 ?auto_4505 ) ) ( OBJ-AT ?auto_4505 ?auto_4509 ) ( IN-TRUCK ?auto_4508 ?auto_4506 ) ( TRUCK-AT ?auto_4506 ?auto_4509 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4506 ?auto_4509 ?auto_4504 ?auto_4507 )
      ( DELIVER-2PKG ?auto_4508 ?auto_4505 ?auto_4504 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4511 - OBJ
      ?auto_4512 - OBJ
      ?auto_4510 - LOCATION
    )
    :vars
    (
      ?auto_4514 - LOCATION
      ?auto_4515 - CITY
      ?auto_4513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4514 ?auto_4515 ) ( IN-CITY ?auto_4510 ?auto_4515 ) ( not ( = ?auto_4510 ?auto_4514 ) ) ( not ( = ?auto_4511 ?auto_4512 ) ) ( OBJ-AT ?auto_4512 ?auto_4514 ) ( IN-TRUCK ?auto_4511 ?auto_4513 ) ( TRUCK-AT ?auto_4513 ?auto_4514 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4512 ?auto_4510 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4517 - OBJ
      ?auto_4518 - OBJ
      ?auto_4516 - LOCATION
    )
    :vars
    (
      ?auto_4520 - LOCATION
      ?auto_4519 - CITY
      ?auto_4521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4520 ?auto_4519 ) ( IN-CITY ?auto_4516 ?auto_4519 ) ( not ( = ?auto_4516 ?auto_4520 ) ) ( not ( = ?auto_4518 ?auto_4517 ) ) ( OBJ-AT ?auto_4517 ?auto_4520 ) ( IN-TRUCK ?auto_4518 ?auto_4521 ) ( TRUCK-AT ?auto_4521 ?auto_4520 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4518 ?auto_4517 ?auto_4516 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4984 - OBJ
      ?auto_4985 - OBJ
      ?auto_4986 - OBJ
      ?auto_4983 - LOCATION
    )
    :vars
    (
      ?auto_4988 - TRUCK
      ?auto_4990 - LOCATION
      ?auto_4987 - CITY
      ?auto_4989 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4986 ?auto_4988 ) ( TRUCK-AT ?auto_4988 ?auto_4990 ) ( IN-CITY ?auto_4990 ?auto_4987 ) ( IN-CITY ?auto_4983 ?auto_4987 ) ( not ( = ?auto_4983 ?auto_4990 ) ) ( OBJ-AT ?auto_4989 ?auto_4983 ) ( not ( = ?auto_4989 ?auto_4986 ) ) ( OBJ-AT ?auto_4984 ?auto_4983 ) ( OBJ-AT ?auto_4985 ?auto_4983 ) ( not ( = ?auto_4984 ?auto_4985 ) ) ( not ( = ?auto_4984 ?auto_4986 ) ) ( not ( = ?auto_4984 ?auto_4989 ) ) ( not ( = ?auto_4985 ?auto_4986 ) ) ( not ( = ?auto_4985 ?auto_4989 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4989 ?auto_4986 ?auto_4983 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4996 - OBJ
      ?auto_4997 - OBJ
      ?auto_4998 - OBJ
      ?auto_4995 - LOCATION
    )
    :vars
    (
      ?auto_5000 - TRUCK
      ?auto_5002 - LOCATION
      ?auto_4999 - CITY
      ?auto_5001 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4997 ?auto_5000 ) ( TRUCK-AT ?auto_5000 ?auto_5002 ) ( IN-CITY ?auto_5002 ?auto_4999 ) ( IN-CITY ?auto_4995 ?auto_4999 ) ( not ( = ?auto_4995 ?auto_5002 ) ) ( OBJ-AT ?auto_5001 ?auto_4995 ) ( not ( = ?auto_5001 ?auto_4997 ) ) ( OBJ-AT ?auto_4996 ?auto_4995 ) ( OBJ-AT ?auto_4998 ?auto_4995 ) ( not ( = ?auto_4996 ?auto_4997 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_5001 ) ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( not ( = ?auto_4998 ?auto_5001 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5001 ?auto_4997 ?auto_4995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5034 - OBJ
      ?auto_5035 - OBJ
      ?auto_5036 - OBJ
      ?auto_5033 - LOCATION
    )
    :vars
    (
      ?auto_5038 - TRUCK
      ?auto_5040 - LOCATION
      ?auto_5037 - CITY
      ?auto_5039 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5034 ?auto_5038 ) ( TRUCK-AT ?auto_5038 ?auto_5040 ) ( IN-CITY ?auto_5040 ?auto_5037 ) ( IN-CITY ?auto_5033 ?auto_5037 ) ( not ( = ?auto_5033 ?auto_5040 ) ) ( OBJ-AT ?auto_5039 ?auto_5033 ) ( not ( = ?auto_5039 ?auto_5034 ) ) ( OBJ-AT ?auto_5035 ?auto_5033 ) ( OBJ-AT ?auto_5036 ?auto_5033 ) ( not ( = ?auto_5034 ?auto_5035 ) ) ( not ( = ?auto_5034 ?auto_5036 ) ) ( not ( = ?auto_5035 ?auto_5036 ) ) ( not ( = ?auto_5035 ?auto_5039 ) ) ( not ( = ?auto_5036 ?auto_5039 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5039 ?auto_5034 ?auto_5033 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5104 - OBJ
      ?auto_5105 - OBJ
      ?auto_5106 - OBJ
      ?auto_5103 - LOCATION
    )
    :vars
    (
      ?auto_5109 - TRUCK
      ?auto_5108 - LOCATION
      ?auto_5107 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5109 ?auto_5108 ) ( IN-CITY ?auto_5108 ?auto_5107 ) ( IN-CITY ?auto_5103 ?auto_5107 ) ( not ( = ?auto_5103 ?auto_5108 ) ) ( OBJ-AT ?auto_5104 ?auto_5103 ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( OBJ-AT ?auto_5106 ?auto_5108 ) ( OBJ-AT ?auto_5105 ?auto_5103 ) ( not ( = ?auto_5104 ?auto_5105 ) ) ( not ( = ?auto_5105 ?auto_5106 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5104 ?auto_5106 ?auto_5103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5115 - OBJ
      ?auto_5116 - OBJ
      ?auto_5117 - OBJ
      ?auto_5114 - LOCATION
    )
    :vars
    (
      ?auto_5120 - TRUCK
      ?auto_5119 - LOCATION
      ?auto_5118 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5120 ?auto_5119 ) ( IN-CITY ?auto_5119 ?auto_5118 ) ( IN-CITY ?auto_5114 ?auto_5118 ) ( not ( = ?auto_5114 ?auto_5119 ) ) ( OBJ-AT ?auto_5117 ?auto_5114 ) ( not ( = ?auto_5117 ?auto_5116 ) ) ( OBJ-AT ?auto_5116 ?auto_5119 ) ( OBJ-AT ?auto_5115 ?auto_5114 ) ( not ( = ?auto_5115 ?auto_5116 ) ) ( not ( = ?auto_5115 ?auto_5117 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5117 ?auto_5116 ?auto_5114 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5137 - OBJ
      ?auto_5138 - OBJ
      ?auto_5139 - OBJ
      ?auto_5136 - LOCATION
    )
    :vars
    (
      ?auto_5142 - TRUCK
      ?auto_5141 - LOCATION
      ?auto_5140 - CITY
      ?auto_5143 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5142 ?auto_5141 ) ( IN-CITY ?auto_5141 ?auto_5140 ) ( IN-CITY ?auto_5136 ?auto_5140 ) ( not ( = ?auto_5136 ?auto_5141 ) ) ( OBJ-AT ?auto_5143 ?auto_5136 ) ( not ( = ?auto_5143 ?auto_5139 ) ) ( OBJ-AT ?auto_5139 ?auto_5141 ) ( OBJ-AT ?auto_5137 ?auto_5136 ) ( OBJ-AT ?auto_5138 ?auto_5136 ) ( not ( = ?auto_5137 ?auto_5138 ) ) ( not ( = ?auto_5137 ?auto_5139 ) ) ( not ( = ?auto_5137 ?auto_5143 ) ) ( not ( = ?auto_5138 ?auto_5139 ) ) ( not ( = ?auto_5138 ?auto_5143 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5143 ?auto_5139 ?auto_5136 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5149 - OBJ
      ?auto_5150 - OBJ
      ?auto_5151 - OBJ
      ?auto_5148 - LOCATION
    )
    :vars
    (
      ?auto_5154 - TRUCK
      ?auto_5153 - LOCATION
      ?auto_5152 - CITY
      ?auto_5155 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5154 ?auto_5153 ) ( IN-CITY ?auto_5153 ?auto_5152 ) ( IN-CITY ?auto_5148 ?auto_5152 ) ( not ( = ?auto_5148 ?auto_5153 ) ) ( OBJ-AT ?auto_5155 ?auto_5148 ) ( not ( = ?auto_5155 ?auto_5150 ) ) ( OBJ-AT ?auto_5150 ?auto_5153 ) ( OBJ-AT ?auto_5149 ?auto_5148 ) ( OBJ-AT ?auto_5151 ?auto_5148 ) ( not ( = ?auto_5149 ?auto_5150 ) ) ( not ( = ?auto_5149 ?auto_5151 ) ) ( not ( = ?auto_5149 ?auto_5155 ) ) ( not ( = ?auto_5150 ?auto_5151 ) ) ( not ( = ?auto_5151 ?auto_5155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5155 ?auto_5150 ?auto_5148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5187 - OBJ
      ?auto_5188 - OBJ
      ?auto_5189 - OBJ
      ?auto_5186 - LOCATION
    )
    :vars
    (
      ?auto_5192 - TRUCK
      ?auto_5191 - LOCATION
      ?auto_5190 - CITY
      ?auto_5193 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5192 ?auto_5191 ) ( IN-CITY ?auto_5191 ?auto_5190 ) ( IN-CITY ?auto_5186 ?auto_5190 ) ( not ( = ?auto_5186 ?auto_5191 ) ) ( OBJ-AT ?auto_5193 ?auto_5186 ) ( not ( = ?auto_5193 ?auto_5187 ) ) ( OBJ-AT ?auto_5187 ?auto_5191 ) ( OBJ-AT ?auto_5188 ?auto_5186 ) ( OBJ-AT ?auto_5189 ?auto_5186 ) ( not ( = ?auto_5187 ?auto_5188 ) ) ( not ( = ?auto_5187 ?auto_5189 ) ) ( not ( = ?auto_5188 ?auto_5189 ) ) ( not ( = ?auto_5188 ?auto_5193 ) ) ( not ( = ?auto_5189 ?auto_5193 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5193 ?auto_5187 ?auto_5186 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5268 - OBJ
      ?auto_5269 - OBJ
      ?auto_5270 - OBJ
      ?auto_5267 - LOCATION
    )
    :vars
    (
      ?auto_5273 - LOCATION
      ?auto_5272 - CITY
      ?auto_5271 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5273 ?auto_5272 ) ( IN-CITY ?auto_5267 ?auto_5272 ) ( not ( = ?auto_5267 ?auto_5273 ) ) ( OBJ-AT ?auto_5270 ?auto_5267 ) ( not ( = ?auto_5270 ?auto_5269 ) ) ( OBJ-AT ?auto_5269 ?auto_5273 ) ( TRUCK-AT ?auto_5271 ?auto_5267 ) ( OBJ-AT ?auto_5268 ?auto_5267 ) ( not ( = ?auto_5268 ?auto_5269 ) ) ( not ( = ?auto_5268 ?auto_5270 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5270 ?auto_5269 ?auto_5267 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5290 - OBJ
      ?auto_5291 - OBJ
      ?auto_5292 - OBJ
      ?auto_5289 - LOCATION
    )
    :vars
    (
      ?auto_5295 - LOCATION
      ?auto_5294 - CITY
      ?auto_5296 - OBJ
      ?auto_5293 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5295 ?auto_5294 ) ( IN-CITY ?auto_5289 ?auto_5294 ) ( not ( = ?auto_5289 ?auto_5295 ) ) ( OBJ-AT ?auto_5296 ?auto_5289 ) ( not ( = ?auto_5296 ?auto_5292 ) ) ( OBJ-AT ?auto_5292 ?auto_5295 ) ( TRUCK-AT ?auto_5293 ?auto_5289 ) ( OBJ-AT ?auto_5290 ?auto_5289 ) ( OBJ-AT ?auto_5291 ?auto_5289 ) ( not ( = ?auto_5290 ?auto_5291 ) ) ( not ( = ?auto_5290 ?auto_5292 ) ) ( not ( = ?auto_5290 ?auto_5296 ) ) ( not ( = ?auto_5291 ?auto_5292 ) ) ( not ( = ?auto_5291 ?auto_5296 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5296 ?auto_5292 ?auto_5289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5302 - OBJ
      ?auto_5303 - OBJ
      ?auto_5304 - OBJ
      ?auto_5301 - LOCATION
    )
    :vars
    (
      ?auto_5307 - LOCATION
      ?auto_5306 - CITY
      ?auto_5308 - OBJ
      ?auto_5305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5307 ?auto_5306 ) ( IN-CITY ?auto_5301 ?auto_5306 ) ( not ( = ?auto_5301 ?auto_5307 ) ) ( OBJ-AT ?auto_5308 ?auto_5301 ) ( not ( = ?auto_5308 ?auto_5303 ) ) ( OBJ-AT ?auto_5303 ?auto_5307 ) ( TRUCK-AT ?auto_5305 ?auto_5301 ) ( OBJ-AT ?auto_5302 ?auto_5301 ) ( OBJ-AT ?auto_5304 ?auto_5301 ) ( not ( = ?auto_5302 ?auto_5303 ) ) ( not ( = ?auto_5302 ?auto_5304 ) ) ( not ( = ?auto_5302 ?auto_5308 ) ) ( not ( = ?auto_5303 ?auto_5304 ) ) ( not ( = ?auto_5304 ?auto_5308 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5308 ?auto_5303 ?auto_5301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5340 - OBJ
      ?auto_5341 - OBJ
      ?auto_5342 - OBJ
      ?auto_5339 - LOCATION
    )
    :vars
    (
      ?auto_5345 - LOCATION
      ?auto_5344 - CITY
      ?auto_5346 - OBJ
      ?auto_5343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5345 ?auto_5344 ) ( IN-CITY ?auto_5339 ?auto_5344 ) ( not ( = ?auto_5339 ?auto_5345 ) ) ( OBJ-AT ?auto_5346 ?auto_5339 ) ( not ( = ?auto_5346 ?auto_5340 ) ) ( OBJ-AT ?auto_5340 ?auto_5345 ) ( TRUCK-AT ?auto_5343 ?auto_5339 ) ( OBJ-AT ?auto_5341 ?auto_5339 ) ( OBJ-AT ?auto_5342 ?auto_5339 ) ( not ( = ?auto_5340 ?auto_5341 ) ) ( not ( = ?auto_5340 ?auto_5342 ) ) ( not ( = ?auto_5341 ?auto_5342 ) ) ( not ( = ?auto_5341 ?auto_5346 ) ) ( not ( = ?auto_5342 ?auto_5346 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5346 ?auto_5340 ?auto_5339 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5408 - OBJ
      ?auto_5409 - OBJ
      ?auto_5410 - OBJ
      ?auto_5407 - LOCATION
    )
    :vars
    (
      ?auto_5413 - LOCATION
      ?auto_5412 - CITY
      ?auto_5411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5413 ?auto_5412 ) ( IN-CITY ?auto_5407 ?auto_5412 ) ( not ( = ?auto_5407 ?auto_5413 ) ) ( OBJ-AT ?auto_5408 ?auto_5407 ) ( not ( = ?auto_5408 ?auto_5410 ) ) ( OBJ-AT ?auto_5410 ?auto_5413 ) ( TRUCK-AT ?auto_5411 ?auto_5407 ) ( OBJ-AT ?auto_5409 ?auto_5407 ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( not ( = ?auto_5409 ?auto_5410 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5408 ?auto_5410 ?auto_5407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5481 - OBJ
      ?auto_5482 - OBJ
      ?auto_5483 - OBJ
      ?auto_5480 - LOCATION
    )
    :vars
    (
      ?auto_5486 - LOCATION
      ?auto_5485 - CITY
      ?auto_5484 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5486 ?auto_5485 ) ( IN-CITY ?auto_5480 ?auto_5485 ) ( not ( = ?auto_5480 ?auto_5486 ) ) ( OBJ-AT ?auto_5482 ?auto_5480 ) ( not ( = ?auto_5482 ?auto_5481 ) ) ( OBJ-AT ?auto_5481 ?auto_5486 ) ( TRUCK-AT ?auto_5484 ?auto_5480 ) ( OBJ-AT ?auto_5483 ?auto_5480 ) ( not ( = ?auto_5481 ?auto_5483 ) ) ( not ( = ?auto_5482 ?auto_5483 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5482 ?auto_5481 ?auto_5480 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5819 - OBJ
      ?auto_5820 - OBJ
      ?auto_5821 - OBJ
      ?auto_5818 - LOCATION
    )
    :vars
    (
      ?auto_5824 - TRUCK
      ?auto_5822 - LOCATION
      ?auto_5823 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5824 ?auto_5822 ) ( IN-CITY ?auto_5822 ?auto_5823 ) ( IN-CITY ?auto_5818 ?auto_5823 ) ( not ( = ?auto_5818 ?auto_5822 ) ) ( OBJ-AT ?auto_5821 ?auto_5818 ) ( not ( = ?auto_5821 ?auto_5819 ) ) ( OBJ-AT ?auto_5819 ?auto_5822 ) ( OBJ-AT ?auto_5820 ?auto_5818 ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( not ( = ?auto_5820 ?auto_5821 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5821 ?auto_5819 ?auto_5818 ) )
  )

)

