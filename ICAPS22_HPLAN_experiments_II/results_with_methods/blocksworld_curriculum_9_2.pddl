( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51201 - BLOCK
    )
    :vars
    (
      ?auto_51202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51201 ?auto_51202 ) ( CLEAR ?auto_51201 ) ( HAND-EMPTY ) ( not ( = ?auto_51201 ?auto_51202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51201 ?auto_51202 )
      ( !PUTDOWN ?auto_51201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51204 - BLOCK
    )
    :vars
    (
      ?auto_51205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51204 ?auto_51205 ) ( CLEAR ?auto_51204 ) ( HAND-EMPTY ) ( not ( = ?auto_51204 ?auto_51205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51204 ?auto_51205 )
      ( !PUTDOWN ?auto_51204 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51208 - BLOCK
      ?auto_51209 - BLOCK
    )
    :vars
    (
      ?auto_51210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51208 ) ( ON ?auto_51209 ?auto_51210 ) ( CLEAR ?auto_51209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51208 ) ( not ( = ?auto_51208 ?auto_51209 ) ) ( not ( = ?auto_51208 ?auto_51210 ) ) ( not ( = ?auto_51209 ?auto_51210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51209 ?auto_51210 )
      ( !STACK ?auto_51209 ?auto_51208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51213 - BLOCK
      ?auto_51214 - BLOCK
    )
    :vars
    (
      ?auto_51215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51213 ) ( ON ?auto_51214 ?auto_51215 ) ( CLEAR ?auto_51214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51213 ) ( not ( = ?auto_51213 ?auto_51214 ) ) ( not ( = ?auto_51213 ?auto_51215 ) ) ( not ( = ?auto_51214 ?auto_51215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51214 ?auto_51215 )
      ( !STACK ?auto_51214 ?auto_51213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51218 - BLOCK
      ?auto_51219 - BLOCK
    )
    :vars
    (
      ?auto_51220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51219 ?auto_51220 ) ( not ( = ?auto_51218 ?auto_51219 ) ) ( not ( = ?auto_51218 ?auto_51220 ) ) ( not ( = ?auto_51219 ?auto_51220 ) ) ( ON ?auto_51218 ?auto_51219 ) ( CLEAR ?auto_51218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51218 )
      ( MAKE-2PILE ?auto_51218 ?auto_51219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51223 - BLOCK
      ?auto_51224 - BLOCK
    )
    :vars
    (
      ?auto_51225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51224 ?auto_51225 ) ( not ( = ?auto_51223 ?auto_51224 ) ) ( not ( = ?auto_51223 ?auto_51225 ) ) ( not ( = ?auto_51224 ?auto_51225 ) ) ( ON ?auto_51223 ?auto_51224 ) ( CLEAR ?auto_51223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51223 )
      ( MAKE-2PILE ?auto_51223 ?auto_51224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51229 - BLOCK
      ?auto_51230 - BLOCK
      ?auto_51231 - BLOCK
    )
    :vars
    (
      ?auto_51232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51230 ) ( ON ?auto_51231 ?auto_51232 ) ( CLEAR ?auto_51231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51229 ) ( ON ?auto_51230 ?auto_51229 ) ( not ( = ?auto_51229 ?auto_51230 ) ) ( not ( = ?auto_51229 ?auto_51231 ) ) ( not ( = ?auto_51229 ?auto_51232 ) ) ( not ( = ?auto_51230 ?auto_51231 ) ) ( not ( = ?auto_51230 ?auto_51232 ) ) ( not ( = ?auto_51231 ?auto_51232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51231 ?auto_51232 )
      ( !STACK ?auto_51231 ?auto_51230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51236 - BLOCK
      ?auto_51237 - BLOCK
      ?auto_51238 - BLOCK
    )
    :vars
    (
      ?auto_51239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51237 ) ( ON ?auto_51238 ?auto_51239 ) ( CLEAR ?auto_51238 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51236 ) ( ON ?auto_51237 ?auto_51236 ) ( not ( = ?auto_51236 ?auto_51237 ) ) ( not ( = ?auto_51236 ?auto_51238 ) ) ( not ( = ?auto_51236 ?auto_51239 ) ) ( not ( = ?auto_51237 ?auto_51238 ) ) ( not ( = ?auto_51237 ?auto_51239 ) ) ( not ( = ?auto_51238 ?auto_51239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51238 ?auto_51239 )
      ( !STACK ?auto_51238 ?auto_51237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51243 - BLOCK
      ?auto_51244 - BLOCK
      ?auto_51245 - BLOCK
    )
    :vars
    (
      ?auto_51246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51245 ?auto_51246 ) ( ON-TABLE ?auto_51243 ) ( not ( = ?auto_51243 ?auto_51244 ) ) ( not ( = ?auto_51243 ?auto_51245 ) ) ( not ( = ?auto_51243 ?auto_51246 ) ) ( not ( = ?auto_51244 ?auto_51245 ) ) ( not ( = ?auto_51244 ?auto_51246 ) ) ( not ( = ?auto_51245 ?auto_51246 ) ) ( CLEAR ?auto_51243 ) ( ON ?auto_51244 ?auto_51245 ) ( CLEAR ?auto_51244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51243 ?auto_51244 )
      ( MAKE-3PILE ?auto_51243 ?auto_51244 ?auto_51245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51250 - BLOCK
      ?auto_51251 - BLOCK
      ?auto_51252 - BLOCK
    )
    :vars
    (
      ?auto_51253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51252 ?auto_51253 ) ( ON-TABLE ?auto_51250 ) ( not ( = ?auto_51250 ?auto_51251 ) ) ( not ( = ?auto_51250 ?auto_51252 ) ) ( not ( = ?auto_51250 ?auto_51253 ) ) ( not ( = ?auto_51251 ?auto_51252 ) ) ( not ( = ?auto_51251 ?auto_51253 ) ) ( not ( = ?auto_51252 ?auto_51253 ) ) ( CLEAR ?auto_51250 ) ( ON ?auto_51251 ?auto_51252 ) ( CLEAR ?auto_51251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51250 ?auto_51251 )
      ( MAKE-3PILE ?auto_51250 ?auto_51251 ?auto_51252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51257 - BLOCK
      ?auto_51258 - BLOCK
      ?auto_51259 - BLOCK
    )
    :vars
    (
      ?auto_51260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51259 ?auto_51260 ) ( not ( = ?auto_51257 ?auto_51258 ) ) ( not ( = ?auto_51257 ?auto_51259 ) ) ( not ( = ?auto_51257 ?auto_51260 ) ) ( not ( = ?auto_51258 ?auto_51259 ) ) ( not ( = ?auto_51258 ?auto_51260 ) ) ( not ( = ?auto_51259 ?auto_51260 ) ) ( ON ?auto_51258 ?auto_51259 ) ( ON ?auto_51257 ?auto_51258 ) ( CLEAR ?auto_51257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51257 )
      ( MAKE-3PILE ?auto_51257 ?auto_51258 ?auto_51259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51264 - BLOCK
      ?auto_51265 - BLOCK
      ?auto_51266 - BLOCK
    )
    :vars
    (
      ?auto_51267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51266 ?auto_51267 ) ( not ( = ?auto_51264 ?auto_51265 ) ) ( not ( = ?auto_51264 ?auto_51266 ) ) ( not ( = ?auto_51264 ?auto_51267 ) ) ( not ( = ?auto_51265 ?auto_51266 ) ) ( not ( = ?auto_51265 ?auto_51267 ) ) ( not ( = ?auto_51266 ?auto_51267 ) ) ( ON ?auto_51265 ?auto_51266 ) ( ON ?auto_51264 ?auto_51265 ) ( CLEAR ?auto_51264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51264 )
      ( MAKE-3PILE ?auto_51264 ?auto_51265 ?auto_51266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51272 - BLOCK
      ?auto_51273 - BLOCK
      ?auto_51274 - BLOCK
      ?auto_51275 - BLOCK
    )
    :vars
    (
      ?auto_51276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51274 ) ( ON ?auto_51275 ?auto_51276 ) ( CLEAR ?auto_51275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51272 ) ( ON ?auto_51273 ?auto_51272 ) ( ON ?auto_51274 ?auto_51273 ) ( not ( = ?auto_51272 ?auto_51273 ) ) ( not ( = ?auto_51272 ?auto_51274 ) ) ( not ( = ?auto_51272 ?auto_51275 ) ) ( not ( = ?auto_51272 ?auto_51276 ) ) ( not ( = ?auto_51273 ?auto_51274 ) ) ( not ( = ?auto_51273 ?auto_51275 ) ) ( not ( = ?auto_51273 ?auto_51276 ) ) ( not ( = ?auto_51274 ?auto_51275 ) ) ( not ( = ?auto_51274 ?auto_51276 ) ) ( not ( = ?auto_51275 ?auto_51276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51275 ?auto_51276 )
      ( !STACK ?auto_51275 ?auto_51274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51281 - BLOCK
      ?auto_51282 - BLOCK
      ?auto_51283 - BLOCK
      ?auto_51284 - BLOCK
    )
    :vars
    (
      ?auto_51285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51283 ) ( ON ?auto_51284 ?auto_51285 ) ( CLEAR ?auto_51284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51281 ) ( ON ?auto_51282 ?auto_51281 ) ( ON ?auto_51283 ?auto_51282 ) ( not ( = ?auto_51281 ?auto_51282 ) ) ( not ( = ?auto_51281 ?auto_51283 ) ) ( not ( = ?auto_51281 ?auto_51284 ) ) ( not ( = ?auto_51281 ?auto_51285 ) ) ( not ( = ?auto_51282 ?auto_51283 ) ) ( not ( = ?auto_51282 ?auto_51284 ) ) ( not ( = ?auto_51282 ?auto_51285 ) ) ( not ( = ?auto_51283 ?auto_51284 ) ) ( not ( = ?auto_51283 ?auto_51285 ) ) ( not ( = ?auto_51284 ?auto_51285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51284 ?auto_51285 )
      ( !STACK ?auto_51284 ?auto_51283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51290 - BLOCK
      ?auto_51291 - BLOCK
      ?auto_51292 - BLOCK
      ?auto_51293 - BLOCK
    )
    :vars
    (
      ?auto_51294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51293 ?auto_51294 ) ( ON-TABLE ?auto_51290 ) ( ON ?auto_51291 ?auto_51290 ) ( not ( = ?auto_51290 ?auto_51291 ) ) ( not ( = ?auto_51290 ?auto_51292 ) ) ( not ( = ?auto_51290 ?auto_51293 ) ) ( not ( = ?auto_51290 ?auto_51294 ) ) ( not ( = ?auto_51291 ?auto_51292 ) ) ( not ( = ?auto_51291 ?auto_51293 ) ) ( not ( = ?auto_51291 ?auto_51294 ) ) ( not ( = ?auto_51292 ?auto_51293 ) ) ( not ( = ?auto_51292 ?auto_51294 ) ) ( not ( = ?auto_51293 ?auto_51294 ) ) ( CLEAR ?auto_51291 ) ( ON ?auto_51292 ?auto_51293 ) ( CLEAR ?auto_51292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51290 ?auto_51291 ?auto_51292 )
      ( MAKE-4PILE ?auto_51290 ?auto_51291 ?auto_51292 ?auto_51293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51299 - BLOCK
      ?auto_51300 - BLOCK
      ?auto_51301 - BLOCK
      ?auto_51302 - BLOCK
    )
    :vars
    (
      ?auto_51303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51302 ?auto_51303 ) ( ON-TABLE ?auto_51299 ) ( ON ?auto_51300 ?auto_51299 ) ( not ( = ?auto_51299 ?auto_51300 ) ) ( not ( = ?auto_51299 ?auto_51301 ) ) ( not ( = ?auto_51299 ?auto_51302 ) ) ( not ( = ?auto_51299 ?auto_51303 ) ) ( not ( = ?auto_51300 ?auto_51301 ) ) ( not ( = ?auto_51300 ?auto_51302 ) ) ( not ( = ?auto_51300 ?auto_51303 ) ) ( not ( = ?auto_51301 ?auto_51302 ) ) ( not ( = ?auto_51301 ?auto_51303 ) ) ( not ( = ?auto_51302 ?auto_51303 ) ) ( CLEAR ?auto_51300 ) ( ON ?auto_51301 ?auto_51302 ) ( CLEAR ?auto_51301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51299 ?auto_51300 ?auto_51301 )
      ( MAKE-4PILE ?auto_51299 ?auto_51300 ?auto_51301 ?auto_51302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51308 - BLOCK
      ?auto_51309 - BLOCK
      ?auto_51310 - BLOCK
      ?auto_51311 - BLOCK
    )
    :vars
    (
      ?auto_51312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51311 ?auto_51312 ) ( ON-TABLE ?auto_51308 ) ( not ( = ?auto_51308 ?auto_51309 ) ) ( not ( = ?auto_51308 ?auto_51310 ) ) ( not ( = ?auto_51308 ?auto_51311 ) ) ( not ( = ?auto_51308 ?auto_51312 ) ) ( not ( = ?auto_51309 ?auto_51310 ) ) ( not ( = ?auto_51309 ?auto_51311 ) ) ( not ( = ?auto_51309 ?auto_51312 ) ) ( not ( = ?auto_51310 ?auto_51311 ) ) ( not ( = ?auto_51310 ?auto_51312 ) ) ( not ( = ?auto_51311 ?auto_51312 ) ) ( ON ?auto_51310 ?auto_51311 ) ( CLEAR ?auto_51308 ) ( ON ?auto_51309 ?auto_51310 ) ( CLEAR ?auto_51309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51308 ?auto_51309 )
      ( MAKE-4PILE ?auto_51308 ?auto_51309 ?auto_51310 ?auto_51311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51317 - BLOCK
      ?auto_51318 - BLOCK
      ?auto_51319 - BLOCK
      ?auto_51320 - BLOCK
    )
    :vars
    (
      ?auto_51321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51320 ?auto_51321 ) ( ON-TABLE ?auto_51317 ) ( not ( = ?auto_51317 ?auto_51318 ) ) ( not ( = ?auto_51317 ?auto_51319 ) ) ( not ( = ?auto_51317 ?auto_51320 ) ) ( not ( = ?auto_51317 ?auto_51321 ) ) ( not ( = ?auto_51318 ?auto_51319 ) ) ( not ( = ?auto_51318 ?auto_51320 ) ) ( not ( = ?auto_51318 ?auto_51321 ) ) ( not ( = ?auto_51319 ?auto_51320 ) ) ( not ( = ?auto_51319 ?auto_51321 ) ) ( not ( = ?auto_51320 ?auto_51321 ) ) ( ON ?auto_51319 ?auto_51320 ) ( CLEAR ?auto_51317 ) ( ON ?auto_51318 ?auto_51319 ) ( CLEAR ?auto_51318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51317 ?auto_51318 )
      ( MAKE-4PILE ?auto_51317 ?auto_51318 ?auto_51319 ?auto_51320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51326 - BLOCK
      ?auto_51327 - BLOCK
      ?auto_51328 - BLOCK
      ?auto_51329 - BLOCK
    )
    :vars
    (
      ?auto_51330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51329 ?auto_51330 ) ( not ( = ?auto_51326 ?auto_51327 ) ) ( not ( = ?auto_51326 ?auto_51328 ) ) ( not ( = ?auto_51326 ?auto_51329 ) ) ( not ( = ?auto_51326 ?auto_51330 ) ) ( not ( = ?auto_51327 ?auto_51328 ) ) ( not ( = ?auto_51327 ?auto_51329 ) ) ( not ( = ?auto_51327 ?auto_51330 ) ) ( not ( = ?auto_51328 ?auto_51329 ) ) ( not ( = ?auto_51328 ?auto_51330 ) ) ( not ( = ?auto_51329 ?auto_51330 ) ) ( ON ?auto_51328 ?auto_51329 ) ( ON ?auto_51327 ?auto_51328 ) ( ON ?auto_51326 ?auto_51327 ) ( CLEAR ?auto_51326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51326 )
      ( MAKE-4PILE ?auto_51326 ?auto_51327 ?auto_51328 ?auto_51329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51335 - BLOCK
      ?auto_51336 - BLOCK
      ?auto_51337 - BLOCK
      ?auto_51338 - BLOCK
    )
    :vars
    (
      ?auto_51339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51338 ?auto_51339 ) ( not ( = ?auto_51335 ?auto_51336 ) ) ( not ( = ?auto_51335 ?auto_51337 ) ) ( not ( = ?auto_51335 ?auto_51338 ) ) ( not ( = ?auto_51335 ?auto_51339 ) ) ( not ( = ?auto_51336 ?auto_51337 ) ) ( not ( = ?auto_51336 ?auto_51338 ) ) ( not ( = ?auto_51336 ?auto_51339 ) ) ( not ( = ?auto_51337 ?auto_51338 ) ) ( not ( = ?auto_51337 ?auto_51339 ) ) ( not ( = ?auto_51338 ?auto_51339 ) ) ( ON ?auto_51337 ?auto_51338 ) ( ON ?auto_51336 ?auto_51337 ) ( ON ?auto_51335 ?auto_51336 ) ( CLEAR ?auto_51335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51335 )
      ( MAKE-4PILE ?auto_51335 ?auto_51336 ?auto_51337 ?auto_51338 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51345 - BLOCK
      ?auto_51346 - BLOCK
      ?auto_51347 - BLOCK
      ?auto_51348 - BLOCK
      ?auto_51349 - BLOCK
    )
    :vars
    (
      ?auto_51350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51348 ) ( ON ?auto_51349 ?auto_51350 ) ( CLEAR ?auto_51349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51345 ) ( ON ?auto_51346 ?auto_51345 ) ( ON ?auto_51347 ?auto_51346 ) ( ON ?auto_51348 ?auto_51347 ) ( not ( = ?auto_51345 ?auto_51346 ) ) ( not ( = ?auto_51345 ?auto_51347 ) ) ( not ( = ?auto_51345 ?auto_51348 ) ) ( not ( = ?auto_51345 ?auto_51349 ) ) ( not ( = ?auto_51345 ?auto_51350 ) ) ( not ( = ?auto_51346 ?auto_51347 ) ) ( not ( = ?auto_51346 ?auto_51348 ) ) ( not ( = ?auto_51346 ?auto_51349 ) ) ( not ( = ?auto_51346 ?auto_51350 ) ) ( not ( = ?auto_51347 ?auto_51348 ) ) ( not ( = ?auto_51347 ?auto_51349 ) ) ( not ( = ?auto_51347 ?auto_51350 ) ) ( not ( = ?auto_51348 ?auto_51349 ) ) ( not ( = ?auto_51348 ?auto_51350 ) ) ( not ( = ?auto_51349 ?auto_51350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51349 ?auto_51350 )
      ( !STACK ?auto_51349 ?auto_51348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51356 - BLOCK
      ?auto_51357 - BLOCK
      ?auto_51358 - BLOCK
      ?auto_51359 - BLOCK
      ?auto_51360 - BLOCK
    )
    :vars
    (
      ?auto_51361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51359 ) ( ON ?auto_51360 ?auto_51361 ) ( CLEAR ?auto_51360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51356 ) ( ON ?auto_51357 ?auto_51356 ) ( ON ?auto_51358 ?auto_51357 ) ( ON ?auto_51359 ?auto_51358 ) ( not ( = ?auto_51356 ?auto_51357 ) ) ( not ( = ?auto_51356 ?auto_51358 ) ) ( not ( = ?auto_51356 ?auto_51359 ) ) ( not ( = ?auto_51356 ?auto_51360 ) ) ( not ( = ?auto_51356 ?auto_51361 ) ) ( not ( = ?auto_51357 ?auto_51358 ) ) ( not ( = ?auto_51357 ?auto_51359 ) ) ( not ( = ?auto_51357 ?auto_51360 ) ) ( not ( = ?auto_51357 ?auto_51361 ) ) ( not ( = ?auto_51358 ?auto_51359 ) ) ( not ( = ?auto_51358 ?auto_51360 ) ) ( not ( = ?auto_51358 ?auto_51361 ) ) ( not ( = ?auto_51359 ?auto_51360 ) ) ( not ( = ?auto_51359 ?auto_51361 ) ) ( not ( = ?auto_51360 ?auto_51361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51360 ?auto_51361 )
      ( !STACK ?auto_51360 ?auto_51359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51367 - BLOCK
      ?auto_51368 - BLOCK
      ?auto_51369 - BLOCK
      ?auto_51370 - BLOCK
      ?auto_51371 - BLOCK
    )
    :vars
    (
      ?auto_51372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51371 ?auto_51372 ) ( ON-TABLE ?auto_51367 ) ( ON ?auto_51368 ?auto_51367 ) ( ON ?auto_51369 ?auto_51368 ) ( not ( = ?auto_51367 ?auto_51368 ) ) ( not ( = ?auto_51367 ?auto_51369 ) ) ( not ( = ?auto_51367 ?auto_51370 ) ) ( not ( = ?auto_51367 ?auto_51371 ) ) ( not ( = ?auto_51367 ?auto_51372 ) ) ( not ( = ?auto_51368 ?auto_51369 ) ) ( not ( = ?auto_51368 ?auto_51370 ) ) ( not ( = ?auto_51368 ?auto_51371 ) ) ( not ( = ?auto_51368 ?auto_51372 ) ) ( not ( = ?auto_51369 ?auto_51370 ) ) ( not ( = ?auto_51369 ?auto_51371 ) ) ( not ( = ?auto_51369 ?auto_51372 ) ) ( not ( = ?auto_51370 ?auto_51371 ) ) ( not ( = ?auto_51370 ?auto_51372 ) ) ( not ( = ?auto_51371 ?auto_51372 ) ) ( CLEAR ?auto_51369 ) ( ON ?auto_51370 ?auto_51371 ) ( CLEAR ?auto_51370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51367 ?auto_51368 ?auto_51369 ?auto_51370 )
      ( MAKE-5PILE ?auto_51367 ?auto_51368 ?auto_51369 ?auto_51370 ?auto_51371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51378 - BLOCK
      ?auto_51379 - BLOCK
      ?auto_51380 - BLOCK
      ?auto_51381 - BLOCK
      ?auto_51382 - BLOCK
    )
    :vars
    (
      ?auto_51383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51382 ?auto_51383 ) ( ON-TABLE ?auto_51378 ) ( ON ?auto_51379 ?auto_51378 ) ( ON ?auto_51380 ?auto_51379 ) ( not ( = ?auto_51378 ?auto_51379 ) ) ( not ( = ?auto_51378 ?auto_51380 ) ) ( not ( = ?auto_51378 ?auto_51381 ) ) ( not ( = ?auto_51378 ?auto_51382 ) ) ( not ( = ?auto_51378 ?auto_51383 ) ) ( not ( = ?auto_51379 ?auto_51380 ) ) ( not ( = ?auto_51379 ?auto_51381 ) ) ( not ( = ?auto_51379 ?auto_51382 ) ) ( not ( = ?auto_51379 ?auto_51383 ) ) ( not ( = ?auto_51380 ?auto_51381 ) ) ( not ( = ?auto_51380 ?auto_51382 ) ) ( not ( = ?auto_51380 ?auto_51383 ) ) ( not ( = ?auto_51381 ?auto_51382 ) ) ( not ( = ?auto_51381 ?auto_51383 ) ) ( not ( = ?auto_51382 ?auto_51383 ) ) ( CLEAR ?auto_51380 ) ( ON ?auto_51381 ?auto_51382 ) ( CLEAR ?auto_51381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51378 ?auto_51379 ?auto_51380 ?auto_51381 )
      ( MAKE-5PILE ?auto_51378 ?auto_51379 ?auto_51380 ?auto_51381 ?auto_51382 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51389 - BLOCK
      ?auto_51390 - BLOCK
      ?auto_51391 - BLOCK
      ?auto_51392 - BLOCK
      ?auto_51393 - BLOCK
    )
    :vars
    (
      ?auto_51394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51393 ?auto_51394 ) ( ON-TABLE ?auto_51389 ) ( ON ?auto_51390 ?auto_51389 ) ( not ( = ?auto_51389 ?auto_51390 ) ) ( not ( = ?auto_51389 ?auto_51391 ) ) ( not ( = ?auto_51389 ?auto_51392 ) ) ( not ( = ?auto_51389 ?auto_51393 ) ) ( not ( = ?auto_51389 ?auto_51394 ) ) ( not ( = ?auto_51390 ?auto_51391 ) ) ( not ( = ?auto_51390 ?auto_51392 ) ) ( not ( = ?auto_51390 ?auto_51393 ) ) ( not ( = ?auto_51390 ?auto_51394 ) ) ( not ( = ?auto_51391 ?auto_51392 ) ) ( not ( = ?auto_51391 ?auto_51393 ) ) ( not ( = ?auto_51391 ?auto_51394 ) ) ( not ( = ?auto_51392 ?auto_51393 ) ) ( not ( = ?auto_51392 ?auto_51394 ) ) ( not ( = ?auto_51393 ?auto_51394 ) ) ( ON ?auto_51392 ?auto_51393 ) ( CLEAR ?auto_51390 ) ( ON ?auto_51391 ?auto_51392 ) ( CLEAR ?auto_51391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51389 ?auto_51390 ?auto_51391 )
      ( MAKE-5PILE ?auto_51389 ?auto_51390 ?auto_51391 ?auto_51392 ?auto_51393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51400 - BLOCK
      ?auto_51401 - BLOCK
      ?auto_51402 - BLOCK
      ?auto_51403 - BLOCK
      ?auto_51404 - BLOCK
    )
    :vars
    (
      ?auto_51405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51404 ?auto_51405 ) ( ON-TABLE ?auto_51400 ) ( ON ?auto_51401 ?auto_51400 ) ( not ( = ?auto_51400 ?auto_51401 ) ) ( not ( = ?auto_51400 ?auto_51402 ) ) ( not ( = ?auto_51400 ?auto_51403 ) ) ( not ( = ?auto_51400 ?auto_51404 ) ) ( not ( = ?auto_51400 ?auto_51405 ) ) ( not ( = ?auto_51401 ?auto_51402 ) ) ( not ( = ?auto_51401 ?auto_51403 ) ) ( not ( = ?auto_51401 ?auto_51404 ) ) ( not ( = ?auto_51401 ?auto_51405 ) ) ( not ( = ?auto_51402 ?auto_51403 ) ) ( not ( = ?auto_51402 ?auto_51404 ) ) ( not ( = ?auto_51402 ?auto_51405 ) ) ( not ( = ?auto_51403 ?auto_51404 ) ) ( not ( = ?auto_51403 ?auto_51405 ) ) ( not ( = ?auto_51404 ?auto_51405 ) ) ( ON ?auto_51403 ?auto_51404 ) ( CLEAR ?auto_51401 ) ( ON ?auto_51402 ?auto_51403 ) ( CLEAR ?auto_51402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51400 ?auto_51401 ?auto_51402 )
      ( MAKE-5PILE ?auto_51400 ?auto_51401 ?auto_51402 ?auto_51403 ?auto_51404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51411 - BLOCK
      ?auto_51412 - BLOCK
      ?auto_51413 - BLOCK
      ?auto_51414 - BLOCK
      ?auto_51415 - BLOCK
    )
    :vars
    (
      ?auto_51416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51415 ?auto_51416 ) ( ON-TABLE ?auto_51411 ) ( not ( = ?auto_51411 ?auto_51412 ) ) ( not ( = ?auto_51411 ?auto_51413 ) ) ( not ( = ?auto_51411 ?auto_51414 ) ) ( not ( = ?auto_51411 ?auto_51415 ) ) ( not ( = ?auto_51411 ?auto_51416 ) ) ( not ( = ?auto_51412 ?auto_51413 ) ) ( not ( = ?auto_51412 ?auto_51414 ) ) ( not ( = ?auto_51412 ?auto_51415 ) ) ( not ( = ?auto_51412 ?auto_51416 ) ) ( not ( = ?auto_51413 ?auto_51414 ) ) ( not ( = ?auto_51413 ?auto_51415 ) ) ( not ( = ?auto_51413 ?auto_51416 ) ) ( not ( = ?auto_51414 ?auto_51415 ) ) ( not ( = ?auto_51414 ?auto_51416 ) ) ( not ( = ?auto_51415 ?auto_51416 ) ) ( ON ?auto_51414 ?auto_51415 ) ( ON ?auto_51413 ?auto_51414 ) ( CLEAR ?auto_51411 ) ( ON ?auto_51412 ?auto_51413 ) ( CLEAR ?auto_51412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51411 ?auto_51412 )
      ( MAKE-5PILE ?auto_51411 ?auto_51412 ?auto_51413 ?auto_51414 ?auto_51415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51422 - BLOCK
      ?auto_51423 - BLOCK
      ?auto_51424 - BLOCK
      ?auto_51425 - BLOCK
      ?auto_51426 - BLOCK
    )
    :vars
    (
      ?auto_51427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51426 ?auto_51427 ) ( ON-TABLE ?auto_51422 ) ( not ( = ?auto_51422 ?auto_51423 ) ) ( not ( = ?auto_51422 ?auto_51424 ) ) ( not ( = ?auto_51422 ?auto_51425 ) ) ( not ( = ?auto_51422 ?auto_51426 ) ) ( not ( = ?auto_51422 ?auto_51427 ) ) ( not ( = ?auto_51423 ?auto_51424 ) ) ( not ( = ?auto_51423 ?auto_51425 ) ) ( not ( = ?auto_51423 ?auto_51426 ) ) ( not ( = ?auto_51423 ?auto_51427 ) ) ( not ( = ?auto_51424 ?auto_51425 ) ) ( not ( = ?auto_51424 ?auto_51426 ) ) ( not ( = ?auto_51424 ?auto_51427 ) ) ( not ( = ?auto_51425 ?auto_51426 ) ) ( not ( = ?auto_51425 ?auto_51427 ) ) ( not ( = ?auto_51426 ?auto_51427 ) ) ( ON ?auto_51425 ?auto_51426 ) ( ON ?auto_51424 ?auto_51425 ) ( CLEAR ?auto_51422 ) ( ON ?auto_51423 ?auto_51424 ) ( CLEAR ?auto_51423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51422 ?auto_51423 )
      ( MAKE-5PILE ?auto_51422 ?auto_51423 ?auto_51424 ?auto_51425 ?auto_51426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51433 - BLOCK
      ?auto_51434 - BLOCK
      ?auto_51435 - BLOCK
      ?auto_51436 - BLOCK
      ?auto_51437 - BLOCK
    )
    :vars
    (
      ?auto_51438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51437 ?auto_51438 ) ( not ( = ?auto_51433 ?auto_51434 ) ) ( not ( = ?auto_51433 ?auto_51435 ) ) ( not ( = ?auto_51433 ?auto_51436 ) ) ( not ( = ?auto_51433 ?auto_51437 ) ) ( not ( = ?auto_51433 ?auto_51438 ) ) ( not ( = ?auto_51434 ?auto_51435 ) ) ( not ( = ?auto_51434 ?auto_51436 ) ) ( not ( = ?auto_51434 ?auto_51437 ) ) ( not ( = ?auto_51434 ?auto_51438 ) ) ( not ( = ?auto_51435 ?auto_51436 ) ) ( not ( = ?auto_51435 ?auto_51437 ) ) ( not ( = ?auto_51435 ?auto_51438 ) ) ( not ( = ?auto_51436 ?auto_51437 ) ) ( not ( = ?auto_51436 ?auto_51438 ) ) ( not ( = ?auto_51437 ?auto_51438 ) ) ( ON ?auto_51436 ?auto_51437 ) ( ON ?auto_51435 ?auto_51436 ) ( ON ?auto_51434 ?auto_51435 ) ( ON ?auto_51433 ?auto_51434 ) ( CLEAR ?auto_51433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51433 )
      ( MAKE-5PILE ?auto_51433 ?auto_51434 ?auto_51435 ?auto_51436 ?auto_51437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51444 - BLOCK
      ?auto_51445 - BLOCK
      ?auto_51446 - BLOCK
      ?auto_51447 - BLOCK
      ?auto_51448 - BLOCK
    )
    :vars
    (
      ?auto_51449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51448 ?auto_51449 ) ( not ( = ?auto_51444 ?auto_51445 ) ) ( not ( = ?auto_51444 ?auto_51446 ) ) ( not ( = ?auto_51444 ?auto_51447 ) ) ( not ( = ?auto_51444 ?auto_51448 ) ) ( not ( = ?auto_51444 ?auto_51449 ) ) ( not ( = ?auto_51445 ?auto_51446 ) ) ( not ( = ?auto_51445 ?auto_51447 ) ) ( not ( = ?auto_51445 ?auto_51448 ) ) ( not ( = ?auto_51445 ?auto_51449 ) ) ( not ( = ?auto_51446 ?auto_51447 ) ) ( not ( = ?auto_51446 ?auto_51448 ) ) ( not ( = ?auto_51446 ?auto_51449 ) ) ( not ( = ?auto_51447 ?auto_51448 ) ) ( not ( = ?auto_51447 ?auto_51449 ) ) ( not ( = ?auto_51448 ?auto_51449 ) ) ( ON ?auto_51447 ?auto_51448 ) ( ON ?auto_51446 ?auto_51447 ) ( ON ?auto_51445 ?auto_51446 ) ( ON ?auto_51444 ?auto_51445 ) ( CLEAR ?auto_51444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51444 )
      ( MAKE-5PILE ?auto_51444 ?auto_51445 ?auto_51446 ?auto_51447 ?auto_51448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51456 - BLOCK
      ?auto_51457 - BLOCK
      ?auto_51458 - BLOCK
      ?auto_51459 - BLOCK
      ?auto_51460 - BLOCK
      ?auto_51461 - BLOCK
    )
    :vars
    (
      ?auto_51462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51460 ) ( ON ?auto_51461 ?auto_51462 ) ( CLEAR ?auto_51461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51456 ) ( ON ?auto_51457 ?auto_51456 ) ( ON ?auto_51458 ?auto_51457 ) ( ON ?auto_51459 ?auto_51458 ) ( ON ?auto_51460 ?auto_51459 ) ( not ( = ?auto_51456 ?auto_51457 ) ) ( not ( = ?auto_51456 ?auto_51458 ) ) ( not ( = ?auto_51456 ?auto_51459 ) ) ( not ( = ?auto_51456 ?auto_51460 ) ) ( not ( = ?auto_51456 ?auto_51461 ) ) ( not ( = ?auto_51456 ?auto_51462 ) ) ( not ( = ?auto_51457 ?auto_51458 ) ) ( not ( = ?auto_51457 ?auto_51459 ) ) ( not ( = ?auto_51457 ?auto_51460 ) ) ( not ( = ?auto_51457 ?auto_51461 ) ) ( not ( = ?auto_51457 ?auto_51462 ) ) ( not ( = ?auto_51458 ?auto_51459 ) ) ( not ( = ?auto_51458 ?auto_51460 ) ) ( not ( = ?auto_51458 ?auto_51461 ) ) ( not ( = ?auto_51458 ?auto_51462 ) ) ( not ( = ?auto_51459 ?auto_51460 ) ) ( not ( = ?auto_51459 ?auto_51461 ) ) ( not ( = ?auto_51459 ?auto_51462 ) ) ( not ( = ?auto_51460 ?auto_51461 ) ) ( not ( = ?auto_51460 ?auto_51462 ) ) ( not ( = ?auto_51461 ?auto_51462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51461 ?auto_51462 )
      ( !STACK ?auto_51461 ?auto_51460 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51469 - BLOCK
      ?auto_51470 - BLOCK
      ?auto_51471 - BLOCK
      ?auto_51472 - BLOCK
      ?auto_51473 - BLOCK
      ?auto_51474 - BLOCK
    )
    :vars
    (
      ?auto_51475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51473 ) ( ON ?auto_51474 ?auto_51475 ) ( CLEAR ?auto_51474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51469 ) ( ON ?auto_51470 ?auto_51469 ) ( ON ?auto_51471 ?auto_51470 ) ( ON ?auto_51472 ?auto_51471 ) ( ON ?auto_51473 ?auto_51472 ) ( not ( = ?auto_51469 ?auto_51470 ) ) ( not ( = ?auto_51469 ?auto_51471 ) ) ( not ( = ?auto_51469 ?auto_51472 ) ) ( not ( = ?auto_51469 ?auto_51473 ) ) ( not ( = ?auto_51469 ?auto_51474 ) ) ( not ( = ?auto_51469 ?auto_51475 ) ) ( not ( = ?auto_51470 ?auto_51471 ) ) ( not ( = ?auto_51470 ?auto_51472 ) ) ( not ( = ?auto_51470 ?auto_51473 ) ) ( not ( = ?auto_51470 ?auto_51474 ) ) ( not ( = ?auto_51470 ?auto_51475 ) ) ( not ( = ?auto_51471 ?auto_51472 ) ) ( not ( = ?auto_51471 ?auto_51473 ) ) ( not ( = ?auto_51471 ?auto_51474 ) ) ( not ( = ?auto_51471 ?auto_51475 ) ) ( not ( = ?auto_51472 ?auto_51473 ) ) ( not ( = ?auto_51472 ?auto_51474 ) ) ( not ( = ?auto_51472 ?auto_51475 ) ) ( not ( = ?auto_51473 ?auto_51474 ) ) ( not ( = ?auto_51473 ?auto_51475 ) ) ( not ( = ?auto_51474 ?auto_51475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51474 ?auto_51475 )
      ( !STACK ?auto_51474 ?auto_51473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51482 - BLOCK
      ?auto_51483 - BLOCK
      ?auto_51484 - BLOCK
      ?auto_51485 - BLOCK
      ?auto_51486 - BLOCK
      ?auto_51487 - BLOCK
    )
    :vars
    (
      ?auto_51488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51487 ?auto_51488 ) ( ON-TABLE ?auto_51482 ) ( ON ?auto_51483 ?auto_51482 ) ( ON ?auto_51484 ?auto_51483 ) ( ON ?auto_51485 ?auto_51484 ) ( not ( = ?auto_51482 ?auto_51483 ) ) ( not ( = ?auto_51482 ?auto_51484 ) ) ( not ( = ?auto_51482 ?auto_51485 ) ) ( not ( = ?auto_51482 ?auto_51486 ) ) ( not ( = ?auto_51482 ?auto_51487 ) ) ( not ( = ?auto_51482 ?auto_51488 ) ) ( not ( = ?auto_51483 ?auto_51484 ) ) ( not ( = ?auto_51483 ?auto_51485 ) ) ( not ( = ?auto_51483 ?auto_51486 ) ) ( not ( = ?auto_51483 ?auto_51487 ) ) ( not ( = ?auto_51483 ?auto_51488 ) ) ( not ( = ?auto_51484 ?auto_51485 ) ) ( not ( = ?auto_51484 ?auto_51486 ) ) ( not ( = ?auto_51484 ?auto_51487 ) ) ( not ( = ?auto_51484 ?auto_51488 ) ) ( not ( = ?auto_51485 ?auto_51486 ) ) ( not ( = ?auto_51485 ?auto_51487 ) ) ( not ( = ?auto_51485 ?auto_51488 ) ) ( not ( = ?auto_51486 ?auto_51487 ) ) ( not ( = ?auto_51486 ?auto_51488 ) ) ( not ( = ?auto_51487 ?auto_51488 ) ) ( CLEAR ?auto_51485 ) ( ON ?auto_51486 ?auto_51487 ) ( CLEAR ?auto_51486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51482 ?auto_51483 ?auto_51484 ?auto_51485 ?auto_51486 )
      ( MAKE-6PILE ?auto_51482 ?auto_51483 ?auto_51484 ?auto_51485 ?auto_51486 ?auto_51487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51495 - BLOCK
      ?auto_51496 - BLOCK
      ?auto_51497 - BLOCK
      ?auto_51498 - BLOCK
      ?auto_51499 - BLOCK
      ?auto_51500 - BLOCK
    )
    :vars
    (
      ?auto_51501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51500 ?auto_51501 ) ( ON-TABLE ?auto_51495 ) ( ON ?auto_51496 ?auto_51495 ) ( ON ?auto_51497 ?auto_51496 ) ( ON ?auto_51498 ?auto_51497 ) ( not ( = ?auto_51495 ?auto_51496 ) ) ( not ( = ?auto_51495 ?auto_51497 ) ) ( not ( = ?auto_51495 ?auto_51498 ) ) ( not ( = ?auto_51495 ?auto_51499 ) ) ( not ( = ?auto_51495 ?auto_51500 ) ) ( not ( = ?auto_51495 ?auto_51501 ) ) ( not ( = ?auto_51496 ?auto_51497 ) ) ( not ( = ?auto_51496 ?auto_51498 ) ) ( not ( = ?auto_51496 ?auto_51499 ) ) ( not ( = ?auto_51496 ?auto_51500 ) ) ( not ( = ?auto_51496 ?auto_51501 ) ) ( not ( = ?auto_51497 ?auto_51498 ) ) ( not ( = ?auto_51497 ?auto_51499 ) ) ( not ( = ?auto_51497 ?auto_51500 ) ) ( not ( = ?auto_51497 ?auto_51501 ) ) ( not ( = ?auto_51498 ?auto_51499 ) ) ( not ( = ?auto_51498 ?auto_51500 ) ) ( not ( = ?auto_51498 ?auto_51501 ) ) ( not ( = ?auto_51499 ?auto_51500 ) ) ( not ( = ?auto_51499 ?auto_51501 ) ) ( not ( = ?auto_51500 ?auto_51501 ) ) ( CLEAR ?auto_51498 ) ( ON ?auto_51499 ?auto_51500 ) ( CLEAR ?auto_51499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51495 ?auto_51496 ?auto_51497 ?auto_51498 ?auto_51499 )
      ( MAKE-6PILE ?auto_51495 ?auto_51496 ?auto_51497 ?auto_51498 ?auto_51499 ?auto_51500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51508 - BLOCK
      ?auto_51509 - BLOCK
      ?auto_51510 - BLOCK
      ?auto_51511 - BLOCK
      ?auto_51512 - BLOCK
      ?auto_51513 - BLOCK
    )
    :vars
    (
      ?auto_51514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51513 ?auto_51514 ) ( ON-TABLE ?auto_51508 ) ( ON ?auto_51509 ?auto_51508 ) ( ON ?auto_51510 ?auto_51509 ) ( not ( = ?auto_51508 ?auto_51509 ) ) ( not ( = ?auto_51508 ?auto_51510 ) ) ( not ( = ?auto_51508 ?auto_51511 ) ) ( not ( = ?auto_51508 ?auto_51512 ) ) ( not ( = ?auto_51508 ?auto_51513 ) ) ( not ( = ?auto_51508 ?auto_51514 ) ) ( not ( = ?auto_51509 ?auto_51510 ) ) ( not ( = ?auto_51509 ?auto_51511 ) ) ( not ( = ?auto_51509 ?auto_51512 ) ) ( not ( = ?auto_51509 ?auto_51513 ) ) ( not ( = ?auto_51509 ?auto_51514 ) ) ( not ( = ?auto_51510 ?auto_51511 ) ) ( not ( = ?auto_51510 ?auto_51512 ) ) ( not ( = ?auto_51510 ?auto_51513 ) ) ( not ( = ?auto_51510 ?auto_51514 ) ) ( not ( = ?auto_51511 ?auto_51512 ) ) ( not ( = ?auto_51511 ?auto_51513 ) ) ( not ( = ?auto_51511 ?auto_51514 ) ) ( not ( = ?auto_51512 ?auto_51513 ) ) ( not ( = ?auto_51512 ?auto_51514 ) ) ( not ( = ?auto_51513 ?auto_51514 ) ) ( ON ?auto_51512 ?auto_51513 ) ( CLEAR ?auto_51510 ) ( ON ?auto_51511 ?auto_51512 ) ( CLEAR ?auto_51511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51508 ?auto_51509 ?auto_51510 ?auto_51511 )
      ( MAKE-6PILE ?auto_51508 ?auto_51509 ?auto_51510 ?auto_51511 ?auto_51512 ?auto_51513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51521 - BLOCK
      ?auto_51522 - BLOCK
      ?auto_51523 - BLOCK
      ?auto_51524 - BLOCK
      ?auto_51525 - BLOCK
      ?auto_51526 - BLOCK
    )
    :vars
    (
      ?auto_51527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51526 ?auto_51527 ) ( ON-TABLE ?auto_51521 ) ( ON ?auto_51522 ?auto_51521 ) ( ON ?auto_51523 ?auto_51522 ) ( not ( = ?auto_51521 ?auto_51522 ) ) ( not ( = ?auto_51521 ?auto_51523 ) ) ( not ( = ?auto_51521 ?auto_51524 ) ) ( not ( = ?auto_51521 ?auto_51525 ) ) ( not ( = ?auto_51521 ?auto_51526 ) ) ( not ( = ?auto_51521 ?auto_51527 ) ) ( not ( = ?auto_51522 ?auto_51523 ) ) ( not ( = ?auto_51522 ?auto_51524 ) ) ( not ( = ?auto_51522 ?auto_51525 ) ) ( not ( = ?auto_51522 ?auto_51526 ) ) ( not ( = ?auto_51522 ?auto_51527 ) ) ( not ( = ?auto_51523 ?auto_51524 ) ) ( not ( = ?auto_51523 ?auto_51525 ) ) ( not ( = ?auto_51523 ?auto_51526 ) ) ( not ( = ?auto_51523 ?auto_51527 ) ) ( not ( = ?auto_51524 ?auto_51525 ) ) ( not ( = ?auto_51524 ?auto_51526 ) ) ( not ( = ?auto_51524 ?auto_51527 ) ) ( not ( = ?auto_51525 ?auto_51526 ) ) ( not ( = ?auto_51525 ?auto_51527 ) ) ( not ( = ?auto_51526 ?auto_51527 ) ) ( ON ?auto_51525 ?auto_51526 ) ( CLEAR ?auto_51523 ) ( ON ?auto_51524 ?auto_51525 ) ( CLEAR ?auto_51524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51521 ?auto_51522 ?auto_51523 ?auto_51524 )
      ( MAKE-6PILE ?auto_51521 ?auto_51522 ?auto_51523 ?auto_51524 ?auto_51525 ?auto_51526 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51534 - BLOCK
      ?auto_51535 - BLOCK
      ?auto_51536 - BLOCK
      ?auto_51537 - BLOCK
      ?auto_51538 - BLOCK
      ?auto_51539 - BLOCK
    )
    :vars
    (
      ?auto_51540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51539 ?auto_51540 ) ( ON-TABLE ?auto_51534 ) ( ON ?auto_51535 ?auto_51534 ) ( not ( = ?auto_51534 ?auto_51535 ) ) ( not ( = ?auto_51534 ?auto_51536 ) ) ( not ( = ?auto_51534 ?auto_51537 ) ) ( not ( = ?auto_51534 ?auto_51538 ) ) ( not ( = ?auto_51534 ?auto_51539 ) ) ( not ( = ?auto_51534 ?auto_51540 ) ) ( not ( = ?auto_51535 ?auto_51536 ) ) ( not ( = ?auto_51535 ?auto_51537 ) ) ( not ( = ?auto_51535 ?auto_51538 ) ) ( not ( = ?auto_51535 ?auto_51539 ) ) ( not ( = ?auto_51535 ?auto_51540 ) ) ( not ( = ?auto_51536 ?auto_51537 ) ) ( not ( = ?auto_51536 ?auto_51538 ) ) ( not ( = ?auto_51536 ?auto_51539 ) ) ( not ( = ?auto_51536 ?auto_51540 ) ) ( not ( = ?auto_51537 ?auto_51538 ) ) ( not ( = ?auto_51537 ?auto_51539 ) ) ( not ( = ?auto_51537 ?auto_51540 ) ) ( not ( = ?auto_51538 ?auto_51539 ) ) ( not ( = ?auto_51538 ?auto_51540 ) ) ( not ( = ?auto_51539 ?auto_51540 ) ) ( ON ?auto_51538 ?auto_51539 ) ( ON ?auto_51537 ?auto_51538 ) ( CLEAR ?auto_51535 ) ( ON ?auto_51536 ?auto_51537 ) ( CLEAR ?auto_51536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51534 ?auto_51535 ?auto_51536 )
      ( MAKE-6PILE ?auto_51534 ?auto_51535 ?auto_51536 ?auto_51537 ?auto_51538 ?auto_51539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51547 - BLOCK
      ?auto_51548 - BLOCK
      ?auto_51549 - BLOCK
      ?auto_51550 - BLOCK
      ?auto_51551 - BLOCK
      ?auto_51552 - BLOCK
    )
    :vars
    (
      ?auto_51553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51552 ?auto_51553 ) ( ON-TABLE ?auto_51547 ) ( ON ?auto_51548 ?auto_51547 ) ( not ( = ?auto_51547 ?auto_51548 ) ) ( not ( = ?auto_51547 ?auto_51549 ) ) ( not ( = ?auto_51547 ?auto_51550 ) ) ( not ( = ?auto_51547 ?auto_51551 ) ) ( not ( = ?auto_51547 ?auto_51552 ) ) ( not ( = ?auto_51547 ?auto_51553 ) ) ( not ( = ?auto_51548 ?auto_51549 ) ) ( not ( = ?auto_51548 ?auto_51550 ) ) ( not ( = ?auto_51548 ?auto_51551 ) ) ( not ( = ?auto_51548 ?auto_51552 ) ) ( not ( = ?auto_51548 ?auto_51553 ) ) ( not ( = ?auto_51549 ?auto_51550 ) ) ( not ( = ?auto_51549 ?auto_51551 ) ) ( not ( = ?auto_51549 ?auto_51552 ) ) ( not ( = ?auto_51549 ?auto_51553 ) ) ( not ( = ?auto_51550 ?auto_51551 ) ) ( not ( = ?auto_51550 ?auto_51552 ) ) ( not ( = ?auto_51550 ?auto_51553 ) ) ( not ( = ?auto_51551 ?auto_51552 ) ) ( not ( = ?auto_51551 ?auto_51553 ) ) ( not ( = ?auto_51552 ?auto_51553 ) ) ( ON ?auto_51551 ?auto_51552 ) ( ON ?auto_51550 ?auto_51551 ) ( CLEAR ?auto_51548 ) ( ON ?auto_51549 ?auto_51550 ) ( CLEAR ?auto_51549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51547 ?auto_51548 ?auto_51549 )
      ( MAKE-6PILE ?auto_51547 ?auto_51548 ?auto_51549 ?auto_51550 ?auto_51551 ?auto_51552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51560 - BLOCK
      ?auto_51561 - BLOCK
      ?auto_51562 - BLOCK
      ?auto_51563 - BLOCK
      ?auto_51564 - BLOCK
      ?auto_51565 - BLOCK
    )
    :vars
    (
      ?auto_51566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51565 ?auto_51566 ) ( ON-TABLE ?auto_51560 ) ( not ( = ?auto_51560 ?auto_51561 ) ) ( not ( = ?auto_51560 ?auto_51562 ) ) ( not ( = ?auto_51560 ?auto_51563 ) ) ( not ( = ?auto_51560 ?auto_51564 ) ) ( not ( = ?auto_51560 ?auto_51565 ) ) ( not ( = ?auto_51560 ?auto_51566 ) ) ( not ( = ?auto_51561 ?auto_51562 ) ) ( not ( = ?auto_51561 ?auto_51563 ) ) ( not ( = ?auto_51561 ?auto_51564 ) ) ( not ( = ?auto_51561 ?auto_51565 ) ) ( not ( = ?auto_51561 ?auto_51566 ) ) ( not ( = ?auto_51562 ?auto_51563 ) ) ( not ( = ?auto_51562 ?auto_51564 ) ) ( not ( = ?auto_51562 ?auto_51565 ) ) ( not ( = ?auto_51562 ?auto_51566 ) ) ( not ( = ?auto_51563 ?auto_51564 ) ) ( not ( = ?auto_51563 ?auto_51565 ) ) ( not ( = ?auto_51563 ?auto_51566 ) ) ( not ( = ?auto_51564 ?auto_51565 ) ) ( not ( = ?auto_51564 ?auto_51566 ) ) ( not ( = ?auto_51565 ?auto_51566 ) ) ( ON ?auto_51564 ?auto_51565 ) ( ON ?auto_51563 ?auto_51564 ) ( ON ?auto_51562 ?auto_51563 ) ( CLEAR ?auto_51560 ) ( ON ?auto_51561 ?auto_51562 ) ( CLEAR ?auto_51561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51560 ?auto_51561 )
      ( MAKE-6PILE ?auto_51560 ?auto_51561 ?auto_51562 ?auto_51563 ?auto_51564 ?auto_51565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51573 - BLOCK
      ?auto_51574 - BLOCK
      ?auto_51575 - BLOCK
      ?auto_51576 - BLOCK
      ?auto_51577 - BLOCK
      ?auto_51578 - BLOCK
    )
    :vars
    (
      ?auto_51579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51578 ?auto_51579 ) ( ON-TABLE ?auto_51573 ) ( not ( = ?auto_51573 ?auto_51574 ) ) ( not ( = ?auto_51573 ?auto_51575 ) ) ( not ( = ?auto_51573 ?auto_51576 ) ) ( not ( = ?auto_51573 ?auto_51577 ) ) ( not ( = ?auto_51573 ?auto_51578 ) ) ( not ( = ?auto_51573 ?auto_51579 ) ) ( not ( = ?auto_51574 ?auto_51575 ) ) ( not ( = ?auto_51574 ?auto_51576 ) ) ( not ( = ?auto_51574 ?auto_51577 ) ) ( not ( = ?auto_51574 ?auto_51578 ) ) ( not ( = ?auto_51574 ?auto_51579 ) ) ( not ( = ?auto_51575 ?auto_51576 ) ) ( not ( = ?auto_51575 ?auto_51577 ) ) ( not ( = ?auto_51575 ?auto_51578 ) ) ( not ( = ?auto_51575 ?auto_51579 ) ) ( not ( = ?auto_51576 ?auto_51577 ) ) ( not ( = ?auto_51576 ?auto_51578 ) ) ( not ( = ?auto_51576 ?auto_51579 ) ) ( not ( = ?auto_51577 ?auto_51578 ) ) ( not ( = ?auto_51577 ?auto_51579 ) ) ( not ( = ?auto_51578 ?auto_51579 ) ) ( ON ?auto_51577 ?auto_51578 ) ( ON ?auto_51576 ?auto_51577 ) ( ON ?auto_51575 ?auto_51576 ) ( CLEAR ?auto_51573 ) ( ON ?auto_51574 ?auto_51575 ) ( CLEAR ?auto_51574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51573 ?auto_51574 )
      ( MAKE-6PILE ?auto_51573 ?auto_51574 ?auto_51575 ?auto_51576 ?auto_51577 ?auto_51578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51586 - BLOCK
      ?auto_51587 - BLOCK
      ?auto_51588 - BLOCK
      ?auto_51589 - BLOCK
      ?auto_51590 - BLOCK
      ?auto_51591 - BLOCK
    )
    :vars
    (
      ?auto_51592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51591 ?auto_51592 ) ( not ( = ?auto_51586 ?auto_51587 ) ) ( not ( = ?auto_51586 ?auto_51588 ) ) ( not ( = ?auto_51586 ?auto_51589 ) ) ( not ( = ?auto_51586 ?auto_51590 ) ) ( not ( = ?auto_51586 ?auto_51591 ) ) ( not ( = ?auto_51586 ?auto_51592 ) ) ( not ( = ?auto_51587 ?auto_51588 ) ) ( not ( = ?auto_51587 ?auto_51589 ) ) ( not ( = ?auto_51587 ?auto_51590 ) ) ( not ( = ?auto_51587 ?auto_51591 ) ) ( not ( = ?auto_51587 ?auto_51592 ) ) ( not ( = ?auto_51588 ?auto_51589 ) ) ( not ( = ?auto_51588 ?auto_51590 ) ) ( not ( = ?auto_51588 ?auto_51591 ) ) ( not ( = ?auto_51588 ?auto_51592 ) ) ( not ( = ?auto_51589 ?auto_51590 ) ) ( not ( = ?auto_51589 ?auto_51591 ) ) ( not ( = ?auto_51589 ?auto_51592 ) ) ( not ( = ?auto_51590 ?auto_51591 ) ) ( not ( = ?auto_51590 ?auto_51592 ) ) ( not ( = ?auto_51591 ?auto_51592 ) ) ( ON ?auto_51590 ?auto_51591 ) ( ON ?auto_51589 ?auto_51590 ) ( ON ?auto_51588 ?auto_51589 ) ( ON ?auto_51587 ?auto_51588 ) ( ON ?auto_51586 ?auto_51587 ) ( CLEAR ?auto_51586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51586 )
      ( MAKE-6PILE ?auto_51586 ?auto_51587 ?auto_51588 ?auto_51589 ?auto_51590 ?auto_51591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51599 - BLOCK
      ?auto_51600 - BLOCK
      ?auto_51601 - BLOCK
      ?auto_51602 - BLOCK
      ?auto_51603 - BLOCK
      ?auto_51604 - BLOCK
    )
    :vars
    (
      ?auto_51605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51604 ?auto_51605 ) ( not ( = ?auto_51599 ?auto_51600 ) ) ( not ( = ?auto_51599 ?auto_51601 ) ) ( not ( = ?auto_51599 ?auto_51602 ) ) ( not ( = ?auto_51599 ?auto_51603 ) ) ( not ( = ?auto_51599 ?auto_51604 ) ) ( not ( = ?auto_51599 ?auto_51605 ) ) ( not ( = ?auto_51600 ?auto_51601 ) ) ( not ( = ?auto_51600 ?auto_51602 ) ) ( not ( = ?auto_51600 ?auto_51603 ) ) ( not ( = ?auto_51600 ?auto_51604 ) ) ( not ( = ?auto_51600 ?auto_51605 ) ) ( not ( = ?auto_51601 ?auto_51602 ) ) ( not ( = ?auto_51601 ?auto_51603 ) ) ( not ( = ?auto_51601 ?auto_51604 ) ) ( not ( = ?auto_51601 ?auto_51605 ) ) ( not ( = ?auto_51602 ?auto_51603 ) ) ( not ( = ?auto_51602 ?auto_51604 ) ) ( not ( = ?auto_51602 ?auto_51605 ) ) ( not ( = ?auto_51603 ?auto_51604 ) ) ( not ( = ?auto_51603 ?auto_51605 ) ) ( not ( = ?auto_51604 ?auto_51605 ) ) ( ON ?auto_51603 ?auto_51604 ) ( ON ?auto_51602 ?auto_51603 ) ( ON ?auto_51601 ?auto_51602 ) ( ON ?auto_51600 ?auto_51601 ) ( ON ?auto_51599 ?auto_51600 ) ( CLEAR ?auto_51599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51599 )
      ( MAKE-6PILE ?auto_51599 ?auto_51600 ?auto_51601 ?auto_51602 ?auto_51603 ?auto_51604 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51613 - BLOCK
      ?auto_51614 - BLOCK
      ?auto_51615 - BLOCK
      ?auto_51616 - BLOCK
      ?auto_51617 - BLOCK
      ?auto_51618 - BLOCK
      ?auto_51619 - BLOCK
    )
    :vars
    (
      ?auto_51620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51618 ) ( ON ?auto_51619 ?auto_51620 ) ( CLEAR ?auto_51619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51613 ) ( ON ?auto_51614 ?auto_51613 ) ( ON ?auto_51615 ?auto_51614 ) ( ON ?auto_51616 ?auto_51615 ) ( ON ?auto_51617 ?auto_51616 ) ( ON ?auto_51618 ?auto_51617 ) ( not ( = ?auto_51613 ?auto_51614 ) ) ( not ( = ?auto_51613 ?auto_51615 ) ) ( not ( = ?auto_51613 ?auto_51616 ) ) ( not ( = ?auto_51613 ?auto_51617 ) ) ( not ( = ?auto_51613 ?auto_51618 ) ) ( not ( = ?auto_51613 ?auto_51619 ) ) ( not ( = ?auto_51613 ?auto_51620 ) ) ( not ( = ?auto_51614 ?auto_51615 ) ) ( not ( = ?auto_51614 ?auto_51616 ) ) ( not ( = ?auto_51614 ?auto_51617 ) ) ( not ( = ?auto_51614 ?auto_51618 ) ) ( not ( = ?auto_51614 ?auto_51619 ) ) ( not ( = ?auto_51614 ?auto_51620 ) ) ( not ( = ?auto_51615 ?auto_51616 ) ) ( not ( = ?auto_51615 ?auto_51617 ) ) ( not ( = ?auto_51615 ?auto_51618 ) ) ( not ( = ?auto_51615 ?auto_51619 ) ) ( not ( = ?auto_51615 ?auto_51620 ) ) ( not ( = ?auto_51616 ?auto_51617 ) ) ( not ( = ?auto_51616 ?auto_51618 ) ) ( not ( = ?auto_51616 ?auto_51619 ) ) ( not ( = ?auto_51616 ?auto_51620 ) ) ( not ( = ?auto_51617 ?auto_51618 ) ) ( not ( = ?auto_51617 ?auto_51619 ) ) ( not ( = ?auto_51617 ?auto_51620 ) ) ( not ( = ?auto_51618 ?auto_51619 ) ) ( not ( = ?auto_51618 ?auto_51620 ) ) ( not ( = ?auto_51619 ?auto_51620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51619 ?auto_51620 )
      ( !STACK ?auto_51619 ?auto_51618 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51628 - BLOCK
      ?auto_51629 - BLOCK
      ?auto_51630 - BLOCK
      ?auto_51631 - BLOCK
      ?auto_51632 - BLOCK
      ?auto_51633 - BLOCK
      ?auto_51634 - BLOCK
    )
    :vars
    (
      ?auto_51635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51633 ) ( ON ?auto_51634 ?auto_51635 ) ( CLEAR ?auto_51634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51628 ) ( ON ?auto_51629 ?auto_51628 ) ( ON ?auto_51630 ?auto_51629 ) ( ON ?auto_51631 ?auto_51630 ) ( ON ?auto_51632 ?auto_51631 ) ( ON ?auto_51633 ?auto_51632 ) ( not ( = ?auto_51628 ?auto_51629 ) ) ( not ( = ?auto_51628 ?auto_51630 ) ) ( not ( = ?auto_51628 ?auto_51631 ) ) ( not ( = ?auto_51628 ?auto_51632 ) ) ( not ( = ?auto_51628 ?auto_51633 ) ) ( not ( = ?auto_51628 ?auto_51634 ) ) ( not ( = ?auto_51628 ?auto_51635 ) ) ( not ( = ?auto_51629 ?auto_51630 ) ) ( not ( = ?auto_51629 ?auto_51631 ) ) ( not ( = ?auto_51629 ?auto_51632 ) ) ( not ( = ?auto_51629 ?auto_51633 ) ) ( not ( = ?auto_51629 ?auto_51634 ) ) ( not ( = ?auto_51629 ?auto_51635 ) ) ( not ( = ?auto_51630 ?auto_51631 ) ) ( not ( = ?auto_51630 ?auto_51632 ) ) ( not ( = ?auto_51630 ?auto_51633 ) ) ( not ( = ?auto_51630 ?auto_51634 ) ) ( not ( = ?auto_51630 ?auto_51635 ) ) ( not ( = ?auto_51631 ?auto_51632 ) ) ( not ( = ?auto_51631 ?auto_51633 ) ) ( not ( = ?auto_51631 ?auto_51634 ) ) ( not ( = ?auto_51631 ?auto_51635 ) ) ( not ( = ?auto_51632 ?auto_51633 ) ) ( not ( = ?auto_51632 ?auto_51634 ) ) ( not ( = ?auto_51632 ?auto_51635 ) ) ( not ( = ?auto_51633 ?auto_51634 ) ) ( not ( = ?auto_51633 ?auto_51635 ) ) ( not ( = ?auto_51634 ?auto_51635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51634 ?auto_51635 )
      ( !STACK ?auto_51634 ?auto_51633 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51643 - BLOCK
      ?auto_51644 - BLOCK
      ?auto_51645 - BLOCK
      ?auto_51646 - BLOCK
      ?auto_51647 - BLOCK
      ?auto_51648 - BLOCK
      ?auto_51649 - BLOCK
    )
    :vars
    (
      ?auto_51650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51649 ?auto_51650 ) ( ON-TABLE ?auto_51643 ) ( ON ?auto_51644 ?auto_51643 ) ( ON ?auto_51645 ?auto_51644 ) ( ON ?auto_51646 ?auto_51645 ) ( ON ?auto_51647 ?auto_51646 ) ( not ( = ?auto_51643 ?auto_51644 ) ) ( not ( = ?auto_51643 ?auto_51645 ) ) ( not ( = ?auto_51643 ?auto_51646 ) ) ( not ( = ?auto_51643 ?auto_51647 ) ) ( not ( = ?auto_51643 ?auto_51648 ) ) ( not ( = ?auto_51643 ?auto_51649 ) ) ( not ( = ?auto_51643 ?auto_51650 ) ) ( not ( = ?auto_51644 ?auto_51645 ) ) ( not ( = ?auto_51644 ?auto_51646 ) ) ( not ( = ?auto_51644 ?auto_51647 ) ) ( not ( = ?auto_51644 ?auto_51648 ) ) ( not ( = ?auto_51644 ?auto_51649 ) ) ( not ( = ?auto_51644 ?auto_51650 ) ) ( not ( = ?auto_51645 ?auto_51646 ) ) ( not ( = ?auto_51645 ?auto_51647 ) ) ( not ( = ?auto_51645 ?auto_51648 ) ) ( not ( = ?auto_51645 ?auto_51649 ) ) ( not ( = ?auto_51645 ?auto_51650 ) ) ( not ( = ?auto_51646 ?auto_51647 ) ) ( not ( = ?auto_51646 ?auto_51648 ) ) ( not ( = ?auto_51646 ?auto_51649 ) ) ( not ( = ?auto_51646 ?auto_51650 ) ) ( not ( = ?auto_51647 ?auto_51648 ) ) ( not ( = ?auto_51647 ?auto_51649 ) ) ( not ( = ?auto_51647 ?auto_51650 ) ) ( not ( = ?auto_51648 ?auto_51649 ) ) ( not ( = ?auto_51648 ?auto_51650 ) ) ( not ( = ?auto_51649 ?auto_51650 ) ) ( CLEAR ?auto_51647 ) ( ON ?auto_51648 ?auto_51649 ) ( CLEAR ?auto_51648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51643 ?auto_51644 ?auto_51645 ?auto_51646 ?auto_51647 ?auto_51648 )
      ( MAKE-7PILE ?auto_51643 ?auto_51644 ?auto_51645 ?auto_51646 ?auto_51647 ?auto_51648 ?auto_51649 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51658 - BLOCK
      ?auto_51659 - BLOCK
      ?auto_51660 - BLOCK
      ?auto_51661 - BLOCK
      ?auto_51662 - BLOCK
      ?auto_51663 - BLOCK
      ?auto_51664 - BLOCK
    )
    :vars
    (
      ?auto_51665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51664 ?auto_51665 ) ( ON-TABLE ?auto_51658 ) ( ON ?auto_51659 ?auto_51658 ) ( ON ?auto_51660 ?auto_51659 ) ( ON ?auto_51661 ?auto_51660 ) ( ON ?auto_51662 ?auto_51661 ) ( not ( = ?auto_51658 ?auto_51659 ) ) ( not ( = ?auto_51658 ?auto_51660 ) ) ( not ( = ?auto_51658 ?auto_51661 ) ) ( not ( = ?auto_51658 ?auto_51662 ) ) ( not ( = ?auto_51658 ?auto_51663 ) ) ( not ( = ?auto_51658 ?auto_51664 ) ) ( not ( = ?auto_51658 ?auto_51665 ) ) ( not ( = ?auto_51659 ?auto_51660 ) ) ( not ( = ?auto_51659 ?auto_51661 ) ) ( not ( = ?auto_51659 ?auto_51662 ) ) ( not ( = ?auto_51659 ?auto_51663 ) ) ( not ( = ?auto_51659 ?auto_51664 ) ) ( not ( = ?auto_51659 ?auto_51665 ) ) ( not ( = ?auto_51660 ?auto_51661 ) ) ( not ( = ?auto_51660 ?auto_51662 ) ) ( not ( = ?auto_51660 ?auto_51663 ) ) ( not ( = ?auto_51660 ?auto_51664 ) ) ( not ( = ?auto_51660 ?auto_51665 ) ) ( not ( = ?auto_51661 ?auto_51662 ) ) ( not ( = ?auto_51661 ?auto_51663 ) ) ( not ( = ?auto_51661 ?auto_51664 ) ) ( not ( = ?auto_51661 ?auto_51665 ) ) ( not ( = ?auto_51662 ?auto_51663 ) ) ( not ( = ?auto_51662 ?auto_51664 ) ) ( not ( = ?auto_51662 ?auto_51665 ) ) ( not ( = ?auto_51663 ?auto_51664 ) ) ( not ( = ?auto_51663 ?auto_51665 ) ) ( not ( = ?auto_51664 ?auto_51665 ) ) ( CLEAR ?auto_51662 ) ( ON ?auto_51663 ?auto_51664 ) ( CLEAR ?auto_51663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51658 ?auto_51659 ?auto_51660 ?auto_51661 ?auto_51662 ?auto_51663 )
      ( MAKE-7PILE ?auto_51658 ?auto_51659 ?auto_51660 ?auto_51661 ?auto_51662 ?auto_51663 ?auto_51664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51673 - BLOCK
      ?auto_51674 - BLOCK
      ?auto_51675 - BLOCK
      ?auto_51676 - BLOCK
      ?auto_51677 - BLOCK
      ?auto_51678 - BLOCK
      ?auto_51679 - BLOCK
    )
    :vars
    (
      ?auto_51680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51679 ?auto_51680 ) ( ON-TABLE ?auto_51673 ) ( ON ?auto_51674 ?auto_51673 ) ( ON ?auto_51675 ?auto_51674 ) ( ON ?auto_51676 ?auto_51675 ) ( not ( = ?auto_51673 ?auto_51674 ) ) ( not ( = ?auto_51673 ?auto_51675 ) ) ( not ( = ?auto_51673 ?auto_51676 ) ) ( not ( = ?auto_51673 ?auto_51677 ) ) ( not ( = ?auto_51673 ?auto_51678 ) ) ( not ( = ?auto_51673 ?auto_51679 ) ) ( not ( = ?auto_51673 ?auto_51680 ) ) ( not ( = ?auto_51674 ?auto_51675 ) ) ( not ( = ?auto_51674 ?auto_51676 ) ) ( not ( = ?auto_51674 ?auto_51677 ) ) ( not ( = ?auto_51674 ?auto_51678 ) ) ( not ( = ?auto_51674 ?auto_51679 ) ) ( not ( = ?auto_51674 ?auto_51680 ) ) ( not ( = ?auto_51675 ?auto_51676 ) ) ( not ( = ?auto_51675 ?auto_51677 ) ) ( not ( = ?auto_51675 ?auto_51678 ) ) ( not ( = ?auto_51675 ?auto_51679 ) ) ( not ( = ?auto_51675 ?auto_51680 ) ) ( not ( = ?auto_51676 ?auto_51677 ) ) ( not ( = ?auto_51676 ?auto_51678 ) ) ( not ( = ?auto_51676 ?auto_51679 ) ) ( not ( = ?auto_51676 ?auto_51680 ) ) ( not ( = ?auto_51677 ?auto_51678 ) ) ( not ( = ?auto_51677 ?auto_51679 ) ) ( not ( = ?auto_51677 ?auto_51680 ) ) ( not ( = ?auto_51678 ?auto_51679 ) ) ( not ( = ?auto_51678 ?auto_51680 ) ) ( not ( = ?auto_51679 ?auto_51680 ) ) ( ON ?auto_51678 ?auto_51679 ) ( CLEAR ?auto_51676 ) ( ON ?auto_51677 ?auto_51678 ) ( CLEAR ?auto_51677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51673 ?auto_51674 ?auto_51675 ?auto_51676 ?auto_51677 )
      ( MAKE-7PILE ?auto_51673 ?auto_51674 ?auto_51675 ?auto_51676 ?auto_51677 ?auto_51678 ?auto_51679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51688 - BLOCK
      ?auto_51689 - BLOCK
      ?auto_51690 - BLOCK
      ?auto_51691 - BLOCK
      ?auto_51692 - BLOCK
      ?auto_51693 - BLOCK
      ?auto_51694 - BLOCK
    )
    :vars
    (
      ?auto_51695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51694 ?auto_51695 ) ( ON-TABLE ?auto_51688 ) ( ON ?auto_51689 ?auto_51688 ) ( ON ?auto_51690 ?auto_51689 ) ( ON ?auto_51691 ?auto_51690 ) ( not ( = ?auto_51688 ?auto_51689 ) ) ( not ( = ?auto_51688 ?auto_51690 ) ) ( not ( = ?auto_51688 ?auto_51691 ) ) ( not ( = ?auto_51688 ?auto_51692 ) ) ( not ( = ?auto_51688 ?auto_51693 ) ) ( not ( = ?auto_51688 ?auto_51694 ) ) ( not ( = ?auto_51688 ?auto_51695 ) ) ( not ( = ?auto_51689 ?auto_51690 ) ) ( not ( = ?auto_51689 ?auto_51691 ) ) ( not ( = ?auto_51689 ?auto_51692 ) ) ( not ( = ?auto_51689 ?auto_51693 ) ) ( not ( = ?auto_51689 ?auto_51694 ) ) ( not ( = ?auto_51689 ?auto_51695 ) ) ( not ( = ?auto_51690 ?auto_51691 ) ) ( not ( = ?auto_51690 ?auto_51692 ) ) ( not ( = ?auto_51690 ?auto_51693 ) ) ( not ( = ?auto_51690 ?auto_51694 ) ) ( not ( = ?auto_51690 ?auto_51695 ) ) ( not ( = ?auto_51691 ?auto_51692 ) ) ( not ( = ?auto_51691 ?auto_51693 ) ) ( not ( = ?auto_51691 ?auto_51694 ) ) ( not ( = ?auto_51691 ?auto_51695 ) ) ( not ( = ?auto_51692 ?auto_51693 ) ) ( not ( = ?auto_51692 ?auto_51694 ) ) ( not ( = ?auto_51692 ?auto_51695 ) ) ( not ( = ?auto_51693 ?auto_51694 ) ) ( not ( = ?auto_51693 ?auto_51695 ) ) ( not ( = ?auto_51694 ?auto_51695 ) ) ( ON ?auto_51693 ?auto_51694 ) ( CLEAR ?auto_51691 ) ( ON ?auto_51692 ?auto_51693 ) ( CLEAR ?auto_51692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51688 ?auto_51689 ?auto_51690 ?auto_51691 ?auto_51692 )
      ( MAKE-7PILE ?auto_51688 ?auto_51689 ?auto_51690 ?auto_51691 ?auto_51692 ?auto_51693 ?auto_51694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51703 - BLOCK
      ?auto_51704 - BLOCK
      ?auto_51705 - BLOCK
      ?auto_51706 - BLOCK
      ?auto_51707 - BLOCK
      ?auto_51708 - BLOCK
      ?auto_51709 - BLOCK
    )
    :vars
    (
      ?auto_51710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51709 ?auto_51710 ) ( ON-TABLE ?auto_51703 ) ( ON ?auto_51704 ?auto_51703 ) ( ON ?auto_51705 ?auto_51704 ) ( not ( = ?auto_51703 ?auto_51704 ) ) ( not ( = ?auto_51703 ?auto_51705 ) ) ( not ( = ?auto_51703 ?auto_51706 ) ) ( not ( = ?auto_51703 ?auto_51707 ) ) ( not ( = ?auto_51703 ?auto_51708 ) ) ( not ( = ?auto_51703 ?auto_51709 ) ) ( not ( = ?auto_51703 ?auto_51710 ) ) ( not ( = ?auto_51704 ?auto_51705 ) ) ( not ( = ?auto_51704 ?auto_51706 ) ) ( not ( = ?auto_51704 ?auto_51707 ) ) ( not ( = ?auto_51704 ?auto_51708 ) ) ( not ( = ?auto_51704 ?auto_51709 ) ) ( not ( = ?auto_51704 ?auto_51710 ) ) ( not ( = ?auto_51705 ?auto_51706 ) ) ( not ( = ?auto_51705 ?auto_51707 ) ) ( not ( = ?auto_51705 ?auto_51708 ) ) ( not ( = ?auto_51705 ?auto_51709 ) ) ( not ( = ?auto_51705 ?auto_51710 ) ) ( not ( = ?auto_51706 ?auto_51707 ) ) ( not ( = ?auto_51706 ?auto_51708 ) ) ( not ( = ?auto_51706 ?auto_51709 ) ) ( not ( = ?auto_51706 ?auto_51710 ) ) ( not ( = ?auto_51707 ?auto_51708 ) ) ( not ( = ?auto_51707 ?auto_51709 ) ) ( not ( = ?auto_51707 ?auto_51710 ) ) ( not ( = ?auto_51708 ?auto_51709 ) ) ( not ( = ?auto_51708 ?auto_51710 ) ) ( not ( = ?auto_51709 ?auto_51710 ) ) ( ON ?auto_51708 ?auto_51709 ) ( ON ?auto_51707 ?auto_51708 ) ( CLEAR ?auto_51705 ) ( ON ?auto_51706 ?auto_51707 ) ( CLEAR ?auto_51706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51703 ?auto_51704 ?auto_51705 ?auto_51706 )
      ( MAKE-7PILE ?auto_51703 ?auto_51704 ?auto_51705 ?auto_51706 ?auto_51707 ?auto_51708 ?auto_51709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51718 - BLOCK
      ?auto_51719 - BLOCK
      ?auto_51720 - BLOCK
      ?auto_51721 - BLOCK
      ?auto_51722 - BLOCK
      ?auto_51723 - BLOCK
      ?auto_51724 - BLOCK
    )
    :vars
    (
      ?auto_51725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51724 ?auto_51725 ) ( ON-TABLE ?auto_51718 ) ( ON ?auto_51719 ?auto_51718 ) ( ON ?auto_51720 ?auto_51719 ) ( not ( = ?auto_51718 ?auto_51719 ) ) ( not ( = ?auto_51718 ?auto_51720 ) ) ( not ( = ?auto_51718 ?auto_51721 ) ) ( not ( = ?auto_51718 ?auto_51722 ) ) ( not ( = ?auto_51718 ?auto_51723 ) ) ( not ( = ?auto_51718 ?auto_51724 ) ) ( not ( = ?auto_51718 ?auto_51725 ) ) ( not ( = ?auto_51719 ?auto_51720 ) ) ( not ( = ?auto_51719 ?auto_51721 ) ) ( not ( = ?auto_51719 ?auto_51722 ) ) ( not ( = ?auto_51719 ?auto_51723 ) ) ( not ( = ?auto_51719 ?auto_51724 ) ) ( not ( = ?auto_51719 ?auto_51725 ) ) ( not ( = ?auto_51720 ?auto_51721 ) ) ( not ( = ?auto_51720 ?auto_51722 ) ) ( not ( = ?auto_51720 ?auto_51723 ) ) ( not ( = ?auto_51720 ?auto_51724 ) ) ( not ( = ?auto_51720 ?auto_51725 ) ) ( not ( = ?auto_51721 ?auto_51722 ) ) ( not ( = ?auto_51721 ?auto_51723 ) ) ( not ( = ?auto_51721 ?auto_51724 ) ) ( not ( = ?auto_51721 ?auto_51725 ) ) ( not ( = ?auto_51722 ?auto_51723 ) ) ( not ( = ?auto_51722 ?auto_51724 ) ) ( not ( = ?auto_51722 ?auto_51725 ) ) ( not ( = ?auto_51723 ?auto_51724 ) ) ( not ( = ?auto_51723 ?auto_51725 ) ) ( not ( = ?auto_51724 ?auto_51725 ) ) ( ON ?auto_51723 ?auto_51724 ) ( ON ?auto_51722 ?auto_51723 ) ( CLEAR ?auto_51720 ) ( ON ?auto_51721 ?auto_51722 ) ( CLEAR ?auto_51721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51718 ?auto_51719 ?auto_51720 ?auto_51721 )
      ( MAKE-7PILE ?auto_51718 ?auto_51719 ?auto_51720 ?auto_51721 ?auto_51722 ?auto_51723 ?auto_51724 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51733 - BLOCK
      ?auto_51734 - BLOCK
      ?auto_51735 - BLOCK
      ?auto_51736 - BLOCK
      ?auto_51737 - BLOCK
      ?auto_51738 - BLOCK
      ?auto_51739 - BLOCK
    )
    :vars
    (
      ?auto_51740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51739 ?auto_51740 ) ( ON-TABLE ?auto_51733 ) ( ON ?auto_51734 ?auto_51733 ) ( not ( = ?auto_51733 ?auto_51734 ) ) ( not ( = ?auto_51733 ?auto_51735 ) ) ( not ( = ?auto_51733 ?auto_51736 ) ) ( not ( = ?auto_51733 ?auto_51737 ) ) ( not ( = ?auto_51733 ?auto_51738 ) ) ( not ( = ?auto_51733 ?auto_51739 ) ) ( not ( = ?auto_51733 ?auto_51740 ) ) ( not ( = ?auto_51734 ?auto_51735 ) ) ( not ( = ?auto_51734 ?auto_51736 ) ) ( not ( = ?auto_51734 ?auto_51737 ) ) ( not ( = ?auto_51734 ?auto_51738 ) ) ( not ( = ?auto_51734 ?auto_51739 ) ) ( not ( = ?auto_51734 ?auto_51740 ) ) ( not ( = ?auto_51735 ?auto_51736 ) ) ( not ( = ?auto_51735 ?auto_51737 ) ) ( not ( = ?auto_51735 ?auto_51738 ) ) ( not ( = ?auto_51735 ?auto_51739 ) ) ( not ( = ?auto_51735 ?auto_51740 ) ) ( not ( = ?auto_51736 ?auto_51737 ) ) ( not ( = ?auto_51736 ?auto_51738 ) ) ( not ( = ?auto_51736 ?auto_51739 ) ) ( not ( = ?auto_51736 ?auto_51740 ) ) ( not ( = ?auto_51737 ?auto_51738 ) ) ( not ( = ?auto_51737 ?auto_51739 ) ) ( not ( = ?auto_51737 ?auto_51740 ) ) ( not ( = ?auto_51738 ?auto_51739 ) ) ( not ( = ?auto_51738 ?auto_51740 ) ) ( not ( = ?auto_51739 ?auto_51740 ) ) ( ON ?auto_51738 ?auto_51739 ) ( ON ?auto_51737 ?auto_51738 ) ( ON ?auto_51736 ?auto_51737 ) ( CLEAR ?auto_51734 ) ( ON ?auto_51735 ?auto_51736 ) ( CLEAR ?auto_51735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51733 ?auto_51734 ?auto_51735 )
      ( MAKE-7PILE ?auto_51733 ?auto_51734 ?auto_51735 ?auto_51736 ?auto_51737 ?auto_51738 ?auto_51739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51748 - BLOCK
      ?auto_51749 - BLOCK
      ?auto_51750 - BLOCK
      ?auto_51751 - BLOCK
      ?auto_51752 - BLOCK
      ?auto_51753 - BLOCK
      ?auto_51754 - BLOCK
    )
    :vars
    (
      ?auto_51755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51754 ?auto_51755 ) ( ON-TABLE ?auto_51748 ) ( ON ?auto_51749 ?auto_51748 ) ( not ( = ?auto_51748 ?auto_51749 ) ) ( not ( = ?auto_51748 ?auto_51750 ) ) ( not ( = ?auto_51748 ?auto_51751 ) ) ( not ( = ?auto_51748 ?auto_51752 ) ) ( not ( = ?auto_51748 ?auto_51753 ) ) ( not ( = ?auto_51748 ?auto_51754 ) ) ( not ( = ?auto_51748 ?auto_51755 ) ) ( not ( = ?auto_51749 ?auto_51750 ) ) ( not ( = ?auto_51749 ?auto_51751 ) ) ( not ( = ?auto_51749 ?auto_51752 ) ) ( not ( = ?auto_51749 ?auto_51753 ) ) ( not ( = ?auto_51749 ?auto_51754 ) ) ( not ( = ?auto_51749 ?auto_51755 ) ) ( not ( = ?auto_51750 ?auto_51751 ) ) ( not ( = ?auto_51750 ?auto_51752 ) ) ( not ( = ?auto_51750 ?auto_51753 ) ) ( not ( = ?auto_51750 ?auto_51754 ) ) ( not ( = ?auto_51750 ?auto_51755 ) ) ( not ( = ?auto_51751 ?auto_51752 ) ) ( not ( = ?auto_51751 ?auto_51753 ) ) ( not ( = ?auto_51751 ?auto_51754 ) ) ( not ( = ?auto_51751 ?auto_51755 ) ) ( not ( = ?auto_51752 ?auto_51753 ) ) ( not ( = ?auto_51752 ?auto_51754 ) ) ( not ( = ?auto_51752 ?auto_51755 ) ) ( not ( = ?auto_51753 ?auto_51754 ) ) ( not ( = ?auto_51753 ?auto_51755 ) ) ( not ( = ?auto_51754 ?auto_51755 ) ) ( ON ?auto_51753 ?auto_51754 ) ( ON ?auto_51752 ?auto_51753 ) ( ON ?auto_51751 ?auto_51752 ) ( CLEAR ?auto_51749 ) ( ON ?auto_51750 ?auto_51751 ) ( CLEAR ?auto_51750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51748 ?auto_51749 ?auto_51750 )
      ( MAKE-7PILE ?auto_51748 ?auto_51749 ?auto_51750 ?auto_51751 ?auto_51752 ?auto_51753 ?auto_51754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51763 - BLOCK
      ?auto_51764 - BLOCK
      ?auto_51765 - BLOCK
      ?auto_51766 - BLOCK
      ?auto_51767 - BLOCK
      ?auto_51768 - BLOCK
      ?auto_51769 - BLOCK
    )
    :vars
    (
      ?auto_51770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51769 ?auto_51770 ) ( ON-TABLE ?auto_51763 ) ( not ( = ?auto_51763 ?auto_51764 ) ) ( not ( = ?auto_51763 ?auto_51765 ) ) ( not ( = ?auto_51763 ?auto_51766 ) ) ( not ( = ?auto_51763 ?auto_51767 ) ) ( not ( = ?auto_51763 ?auto_51768 ) ) ( not ( = ?auto_51763 ?auto_51769 ) ) ( not ( = ?auto_51763 ?auto_51770 ) ) ( not ( = ?auto_51764 ?auto_51765 ) ) ( not ( = ?auto_51764 ?auto_51766 ) ) ( not ( = ?auto_51764 ?auto_51767 ) ) ( not ( = ?auto_51764 ?auto_51768 ) ) ( not ( = ?auto_51764 ?auto_51769 ) ) ( not ( = ?auto_51764 ?auto_51770 ) ) ( not ( = ?auto_51765 ?auto_51766 ) ) ( not ( = ?auto_51765 ?auto_51767 ) ) ( not ( = ?auto_51765 ?auto_51768 ) ) ( not ( = ?auto_51765 ?auto_51769 ) ) ( not ( = ?auto_51765 ?auto_51770 ) ) ( not ( = ?auto_51766 ?auto_51767 ) ) ( not ( = ?auto_51766 ?auto_51768 ) ) ( not ( = ?auto_51766 ?auto_51769 ) ) ( not ( = ?auto_51766 ?auto_51770 ) ) ( not ( = ?auto_51767 ?auto_51768 ) ) ( not ( = ?auto_51767 ?auto_51769 ) ) ( not ( = ?auto_51767 ?auto_51770 ) ) ( not ( = ?auto_51768 ?auto_51769 ) ) ( not ( = ?auto_51768 ?auto_51770 ) ) ( not ( = ?auto_51769 ?auto_51770 ) ) ( ON ?auto_51768 ?auto_51769 ) ( ON ?auto_51767 ?auto_51768 ) ( ON ?auto_51766 ?auto_51767 ) ( ON ?auto_51765 ?auto_51766 ) ( CLEAR ?auto_51763 ) ( ON ?auto_51764 ?auto_51765 ) ( CLEAR ?auto_51764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51763 ?auto_51764 )
      ( MAKE-7PILE ?auto_51763 ?auto_51764 ?auto_51765 ?auto_51766 ?auto_51767 ?auto_51768 ?auto_51769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51778 - BLOCK
      ?auto_51779 - BLOCK
      ?auto_51780 - BLOCK
      ?auto_51781 - BLOCK
      ?auto_51782 - BLOCK
      ?auto_51783 - BLOCK
      ?auto_51784 - BLOCK
    )
    :vars
    (
      ?auto_51785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51784 ?auto_51785 ) ( ON-TABLE ?auto_51778 ) ( not ( = ?auto_51778 ?auto_51779 ) ) ( not ( = ?auto_51778 ?auto_51780 ) ) ( not ( = ?auto_51778 ?auto_51781 ) ) ( not ( = ?auto_51778 ?auto_51782 ) ) ( not ( = ?auto_51778 ?auto_51783 ) ) ( not ( = ?auto_51778 ?auto_51784 ) ) ( not ( = ?auto_51778 ?auto_51785 ) ) ( not ( = ?auto_51779 ?auto_51780 ) ) ( not ( = ?auto_51779 ?auto_51781 ) ) ( not ( = ?auto_51779 ?auto_51782 ) ) ( not ( = ?auto_51779 ?auto_51783 ) ) ( not ( = ?auto_51779 ?auto_51784 ) ) ( not ( = ?auto_51779 ?auto_51785 ) ) ( not ( = ?auto_51780 ?auto_51781 ) ) ( not ( = ?auto_51780 ?auto_51782 ) ) ( not ( = ?auto_51780 ?auto_51783 ) ) ( not ( = ?auto_51780 ?auto_51784 ) ) ( not ( = ?auto_51780 ?auto_51785 ) ) ( not ( = ?auto_51781 ?auto_51782 ) ) ( not ( = ?auto_51781 ?auto_51783 ) ) ( not ( = ?auto_51781 ?auto_51784 ) ) ( not ( = ?auto_51781 ?auto_51785 ) ) ( not ( = ?auto_51782 ?auto_51783 ) ) ( not ( = ?auto_51782 ?auto_51784 ) ) ( not ( = ?auto_51782 ?auto_51785 ) ) ( not ( = ?auto_51783 ?auto_51784 ) ) ( not ( = ?auto_51783 ?auto_51785 ) ) ( not ( = ?auto_51784 ?auto_51785 ) ) ( ON ?auto_51783 ?auto_51784 ) ( ON ?auto_51782 ?auto_51783 ) ( ON ?auto_51781 ?auto_51782 ) ( ON ?auto_51780 ?auto_51781 ) ( CLEAR ?auto_51778 ) ( ON ?auto_51779 ?auto_51780 ) ( CLEAR ?auto_51779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51778 ?auto_51779 )
      ( MAKE-7PILE ?auto_51778 ?auto_51779 ?auto_51780 ?auto_51781 ?auto_51782 ?auto_51783 ?auto_51784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51793 - BLOCK
      ?auto_51794 - BLOCK
      ?auto_51795 - BLOCK
      ?auto_51796 - BLOCK
      ?auto_51797 - BLOCK
      ?auto_51798 - BLOCK
      ?auto_51799 - BLOCK
    )
    :vars
    (
      ?auto_51800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51799 ?auto_51800 ) ( not ( = ?auto_51793 ?auto_51794 ) ) ( not ( = ?auto_51793 ?auto_51795 ) ) ( not ( = ?auto_51793 ?auto_51796 ) ) ( not ( = ?auto_51793 ?auto_51797 ) ) ( not ( = ?auto_51793 ?auto_51798 ) ) ( not ( = ?auto_51793 ?auto_51799 ) ) ( not ( = ?auto_51793 ?auto_51800 ) ) ( not ( = ?auto_51794 ?auto_51795 ) ) ( not ( = ?auto_51794 ?auto_51796 ) ) ( not ( = ?auto_51794 ?auto_51797 ) ) ( not ( = ?auto_51794 ?auto_51798 ) ) ( not ( = ?auto_51794 ?auto_51799 ) ) ( not ( = ?auto_51794 ?auto_51800 ) ) ( not ( = ?auto_51795 ?auto_51796 ) ) ( not ( = ?auto_51795 ?auto_51797 ) ) ( not ( = ?auto_51795 ?auto_51798 ) ) ( not ( = ?auto_51795 ?auto_51799 ) ) ( not ( = ?auto_51795 ?auto_51800 ) ) ( not ( = ?auto_51796 ?auto_51797 ) ) ( not ( = ?auto_51796 ?auto_51798 ) ) ( not ( = ?auto_51796 ?auto_51799 ) ) ( not ( = ?auto_51796 ?auto_51800 ) ) ( not ( = ?auto_51797 ?auto_51798 ) ) ( not ( = ?auto_51797 ?auto_51799 ) ) ( not ( = ?auto_51797 ?auto_51800 ) ) ( not ( = ?auto_51798 ?auto_51799 ) ) ( not ( = ?auto_51798 ?auto_51800 ) ) ( not ( = ?auto_51799 ?auto_51800 ) ) ( ON ?auto_51798 ?auto_51799 ) ( ON ?auto_51797 ?auto_51798 ) ( ON ?auto_51796 ?auto_51797 ) ( ON ?auto_51795 ?auto_51796 ) ( ON ?auto_51794 ?auto_51795 ) ( ON ?auto_51793 ?auto_51794 ) ( CLEAR ?auto_51793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51793 )
      ( MAKE-7PILE ?auto_51793 ?auto_51794 ?auto_51795 ?auto_51796 ?auto_51797 ?auto_51798 ?auto_51799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_51808 - BLOCK
      ?auto_51809 - BLOCK
      ?auto_51810 - BLOCK
      ?auto_51811 - BLOCK
      ?auto_51812 - BLOCK
      ?auto_51813 - BLOCK
      ?auto_51814 - BLOCK
    )
    :vars
    (
      ?auto_51815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51814 ?auto_51815 ) ( not ( = ?auto_51808 ?auto_51809 ) ) ( not ( = ?auto_51808 ?auto_51810 ) ) ( not ( = ?auto_51808 ?auto_51811 ) ) ( not ( = ?auto_51808 ?auto_51812 ) ) ( not ( = ?auto_51808 ?auto_51813 ) ) ( not ( = ?auto_51808 ?auto_51814 ) ) ( not ( = ?auto_51808 ?auto_51815 ) ) ( not ( = ?auto_51809 ?auto_51810 ) ) ( not ( = ?auto_51809 ?auto_51811 ) ) ( not ( = ?auto_51809 ?auto_51812 ) ) ( not ( = ?auto_51809 ?auto_51813 ) ) ( not ( = ?auto_51809 ?auto_51814 ) ) ( not ( = ?auto_51809 ?auto_51815 ) ) ( not ( = ?auto_51810 ?auto_51811 ) ) ( not ( = ?auto_51810 ?auto_51812 ) ) ( not ( = ?auto_51810 ?auto_51813 ) ) ( not ( = ?auto_51810 ?auto_51814 ) ) ( not ( = ?auto_51810 ?auto_51815 ) ) ( not ( = ?auto_51811 ?auto_51812 ) ) ( not ( = ?auto_51811 ?auto_51813 ) ) ( not ( = ?auto_51811 ?auto_51814 ) ) ( not ( = ?auto_51811 ?auto_51815 ) ) ( not ( = ?auto_51812 ?auto_51813 ) ) ( not ( = ?auto_51812 ?auto_51814 ) ) ( not ( = ?auto_51812 ?auto_51815 ) ) ( not ( = ?auto_51813 ?auto_51814 ) ) ( not ( = ?auto_51813 ?auto_51815 ) ) ( not ( = ?auto_51814 ?auto_51815 ) ) ( ON ?auto_51813 ?auto_51814 ) ( ON ?auto_51812 ?auto_51813 ) ( ON ?auto_51811 ?auto_51812 ) ( ON ?auto_51810 ?auto_51811 ) ( ON ?auto_51809 ?auto_51810 ) ( ON ?auto_51808 ?auto_51809 ) ( CLEAR ?auto_51808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51808 )
      ( MAKE-7PILE ?auto_51808 ?auto_51809 ?auto_51810 ?auto_51811 ?auto_51812 ?auto_51813 ?auto_51814 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51824 - BLOCK
      ?auto_51825 - BLOCK
      ?auto_51826 - BLOCK
      ?auto_51827 - BLOCK
      ?auto_51828 - BLOCK
      ?auto_51829 - BLOCK
      ?auto_51830 - BLOCK
      ?auto_51831 - BLOCK
    )
    :vars
    (
      ?auto_51832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51830 ) ( ON ?auto_51831 ?auto_51832 ) ( CLEAR ?auto_51831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51824 ) ( ON ?auto_51825 ?auto_51824 ) ( ON ?auto_51826 ?auto_51825 ) ( ON ?auto_51827 ?auto_51826 ) ( ON ?auto_51828 ?auto_51827 ) ( ON ?auto_51829 ?auto_51828 ) ( ON ?auto_51830 ?auto_51829 ) ( not ( = ?auto_51824 ?auto_51825 ) ) ( not ( = ?auto_51824 ?auto_51826 ) ) ( not ( = ?auto_51824 ?auto_51827 ) ) ( not ( = ?auto_51824 ?auto_51828 ) ) ( not ( = ?auto_51824 ?auto_51829 ) ) ( not ( = ?auto_51824 ?auto_51830 ) ) ( not ( = ?auto_51824 ?auto_51831 ) ) ( not ( = ?auto_51824 ?auto_51832 ) ) ( not ( = ?auto_51825 ?auto_51826 ) ) ( not ( = ?auto_51825 ?auto_51827 ) ) ( not ( = ?auto_51825 ?auto_51828 ) ) ( not ( = ?auto_51825 ?auto_51829 ) ) ( not ( = ?auto_51825 ?auto_51830 ) ) ( not ( = ?auto_51825 ?auto_51831 ) ) ( not ( = ?auto_51825 ?auto_51832 ) ) ( not ( = ?auto_51826 ?auto_51827 ) ) ( not ( = ?auto_51826 ?auto_51828 ) ) ( not ( = ?auto_51826 ?auto_51829 ) ) ( not ( = ?auto_51826 ?auto_51830 ) ) ( not ( = ?auto_51826 ?auto_51831 ) ) ( not ( = ?auto_51826 ?auto_51832 ) ) ( not ( = ?auto_51827 ?auto_51828 ) ) ( not ( = ?auto_51827 ?auto_51829 ) ) ( not ( = ?auto_51827 ?auto_51830 ) ) ( not ( = ?auto_51827 ?auto_51831 ) ) ( not ( = ?auto_51827 ?auto_51832 ) ) ( not ( = ?auto_51828 ?auto_51829 ) ) ( not ( = ?auto_51828 ?auto_51830 ) ) ( not ( = ?auto_51828 ?auto_51831 ) ) ( not ( = ?auto_51828 ?auto_51832 ) ) ( not ( = ?auto_51829 ?auto_51830 ) ) ( not ( = ?auto_51829 ?auto_51831 ) ) ( not ( = ?auto_51829 ?auto_51832 ) ) ( not ( = ?auto_51830 ?auto_51831 ) ) ( not ( = ?auto_51830 ?auto_51832 ) ) ( not ( = ?auto_51831 ?auto_51832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51831 ?auto_51832 )
      ( !STACK ?auto_51831 ?auto_51830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51841 - BLOCK
      ?auto_51842 - BLOCK
      ?auto_51843 - BLOCK
      ?auto_51844 - BLOCK
      ?auto_51845 - BLOCK
      ?auto_51846 - BLOCK
      ?auto_51847 - BLOCK
      ?auto_51848 - BLOCK
    )
    :vars
    (
      ?auto_51849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51847 ) ( ON ?auto_51848 ?auto_51849 ) ( CLEAR ?auto_51848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51841 ) ( ON ?auto_51842 ?auto_51841 ) ( ON ?auto_51843 ?auto_51842 ) ( ON ?auto_51844 ?auto_51843 ) ( ON ?auto_51845 ?auto_51844 ) ( ON ?auto_51846 ?auto_51845 ) ( ON ?auto_51847 ?auto_51846 ) ( not ( = ?auto_51841 ?auto_51842 ) ) ( not ( = ?auto_51841 ?auto_51843 ) ) ( not ( = ?auto_51841 ?auto_51844 ) ) ( not ( = ?auto_51841 ?auto_51845 ) ) ( not ( = ?auto_51841 ?auto_51846 ) ) ( not ( = ?auto_51841 ?auto_51847 ) ) ( not ( = ?auto_51841 ?auto_51848 ) ) ( not ( = ?auto_51841 ?auto_51849 ) ) ( not ( = ?auto_51842 ?auto_51843 ) ) ( not ( = ?auto_51842 ?auto_51844 ) ) ( not ( = ?auto_51842 ?auto_51845 ) ) ( not ( = ?auto_51842 ?auto_51846 ) ) ( not ( = ?auto_51842 ?auto_51847 ) ) ( not ( = ?auto_51842 ?auto_51848 ) ) ( not ( = ?auto_51842 ?auto_51849 ) ) ( not ( = ?auto_51843 ?auto_51844 ) ) ( not ( = ?auto_51843 ?auto_51845 ) ) ( not ( = ?auto_51843 ?auto_51846 ) ) ( not ( = ?auto_51843 ?auto_51847 ) ) ( not ( = ?auto_51843 ?auto_51848 ) ) ( not ( = ?auto_51843 ?auto_51849 ) ) ( not ( = ?auto_51844 ?auto_51845 ) ) ( not ( = ?auto_51844 ?auto_51846 ) ) ( not ( = ?auto_51844 ?auto_51847 ) ) ( not ( = ?auto_51844 ?auto_51848 ) ) ( not ( = ?auto_51844 ?auto_51849 ) ) ( not ( = ?auto_51845 ?auto_51846 ) ) ( not ( = ?auto_51845 ?auto_51847 ) ) ( not ( = ?auto_51845 ?auto_51848 ) ) ( not ( = ?auto_51845 ?auto_51849 ) ) ( not ( = ?auto_51846 ?auto_51847 ) ) ( not ( = ?auto_51846 ?auto_51848 ) ) ( not ( = ?auto_51846 ?auto_51849 ) ) ( not ( = ?auto_51847 ?auto_51848 ) ) ( not ( = ?auto_51847 ?auto_51849 ) ) ( not ( = ?auto_51848 ?auto_51849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51848 ?auto_51849 )
      ( !STACK ?auto_51848 ?auto_51847 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51858 - BLOCK
      ?auto_51859 - BLOCK
      ?auto_51860 - BLOCK
      ?auto_51861 - BLOCK
      ?auto_51862 - BLOCK
      ?auto_51863 - BLOCK
      ?auto_51864 - BLOCK
      ?auto_51865 - BLOCK
    )
    :vars
    (
      ?auto_51866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51865 ?auto_51866 ) ( ON-TABLE ?auto_51858 ) ( ON ?auto_51859 ?auto_51858 ) ( ON ?auto_51860 ?auto_51859 ) ( ON ?auto_51861 ?auto_51860 ) ( ON ?auto_51862 ?auto_51861 ) ( ON ?auto_51863 ?auto_51862 ) ( not ( = ?auto_51858 ?auto_51859 ) ) ( not ( = ?auto_51858 ?auto_51860 ) ) ( not ( = ?auto_51858 ?auto_51861 ) ) ( not ( = ?auto_51858 ?auto_51862 ) ) ( not ( = ?auto_51858 ?auto_51863 ) ) ( not ( = ?auto_51858 ?auto_51864 ) ) ( not ( = ?auto_51858 ?auto_51865 ) ) ( not ( = ?auto_51858 ?auto_51866 ) ) ( not ( = ?auto_51859 ?auto_51860 ) ) ( not ( = ?auto_51859 ?auto_51861 ) ) ( not ( = ?auto_51859 ?auto_51862 ) ) ( not ( = ?auto_51859 ?auto_51863 ) ) ( not ( = ?auto_51859 ?auto_51864 ) ) ( not ( = ?auto_51859 ?auto_51865 ) ) ( not ( = ?auto_51859 ?auto_51866 ) ) ( not ( = ?auto_51860 ?auto_51861 ) ) ( not ( = ?auto_51860 ?auto_51862 ) ) ( not ( = ?auto_51860 ?auto_51863 ) ) ( not ( = ?auto_51860 ?auto_51864 ) ) ( not ( = ?auto_51860 ?auto_51865 ) ) ( not ( = ?auto_51860 ?auto_51866 ) ) ( not ( = ?auto_51861 ?auto_51862 ) ) ( not ( = ?auto_51861 ?auto_51863 ) ) ( not ( = ?auto_51861 ?auto_51864 ) ) ( not ( = ?auto_51861 ?auto_51865 ) ) ( not ( = ?auto_51861 ?auto_51866 ) ) ( not ( = ?auto_51862 ?auto_51863 ) ) ( not ( = ?auto_51862 ?auto_51864 ) ) ( not ( = ?auto_51862 ?auto_51865 ) ) ( not ( = ?auto_51862 ?auto_51866 ) ) ( not ( = ?auto_51863 ?auto_51864 ) ) ( not ( = ?auto_51863 ?auto_51865 ) ) ( not ( = ?auto_51863 ?auto_51866 ) ) ( not ( = ?auto_51864 ?auto_51865 ) ) ( not ( = ?auto_51864 ?auto_51866 ) ) ( not ( = ?auto_51865 ?auto_51866 ) ) ( CLEAR ?auto_51863 ) ( ON ?auto_51864 ?auto_51865 ) ( CLEAR ?auto_51864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_51858 ?auto_51859 ?auto_51860 ?auto_51861 ?auto_51862 ?auto_51863 ?auto_51864 )
      ( MAKE-8PILE ?auto_51858 ?auto_51859 ?auto_51860 ?auto_51861 ?auto_51862 ?auto_51863 ?auto_51864 ?auto_51865 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51875 - BLOCK
      ?auto_51876 - BLOCK
      ?auto_51877 - BLOCK
      ?auto_51878 - BLOCK
      ?auto_51879 - BLOCK
      ?auto_51880 - BLOCK
      ?auto_51881 - BLOCK
      ?auto_51882 - BLOCK
    )
    :vars
    (
      ?auto_51883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51882 ?auto_51883 ) ( ON-TABLE ?auto_51875 ) ( ON ?auto_51876 ?auto_51875 ) ( ON ?auto_51877 ?auto_51876 ) ( ON ?auto_51878 ?auto_51877 ) ( ON ?auto_51879 ?auto_51878 ) ( ON ?auto_51880 ?auto_51879 ) ( not ( = ?auto_51875 ?auto_51876 ) ) ( not ( = ?auto_51875 ?auto_51877 ) ) ( not ( = ?auto_51875 ?auto_51878 ) ) ( not ( = ?auto_51875 ?auto_51879 ) ) ( not ( = ?auto_51875 ?auto_51880 ) ) ( not ( = ?auto_51875 ?auto_51881 ) ) ( not ( = ?auto_51875 ?auto_51882 ) ) ( not ( = ?auto_51875 ?auto_51883 ) ) ( not ( = ?auto_51876 ?auto_51877 ) ) ( not ( = ?auto_51876 ?auto_51878 ) ) ( not ( = ?auto_51876 ?auto_51879 ) ) ( not ( = ?auto_51876 ?auto_51880 ) ) ( not ( = ?auto_51876 ?auto_51881 ) ) ( not ( = ?auto_51876 ?auto_51882 ) ) ( not ( = ?auto_51876 ?auto_51883 ) ) ( not ( = ?auto_51877 ?auto_51878 ) ) ( not ( = ?auto_51877 ?auto_51879 ) ) ( not ( = ?auto_51877 ?auto_51880 ) ) ( not ( = ?auto_51877 ?auto_51881 ) ) ( not ( = ?auto_51877 ?auto_51882 ) ) ( not ( = ?auto_51877 ?auto_51883 ) ) ( not ( = ?auto_51878 ?auto_51879 ) ) ( not ( = ?auto_51878 ?auto_51880 ) ) ( not ( = ?auto_51878 ?auto_51881 ) ) ( not ( = ?auto_51878 ?auto_51882 ) ) ( not ( = ?auto_51878 ?auto_51883 ) ) ( not ( = ?auto_51879 ?auto_51880 ) ) ( not ( = ?auto_51879 ?auto_51881 ) ) ( not ( = ?auto_51879 ?auto_51882 ) ) ( not ( = ?auto_51879 ?auto_51883 ) ) ( not ( = ?auto_51880 ?auto_51881 ) ) ( not ( = ?auto_51880 ?auto_51882 ) ) ( not ( = ?auto_51880 ?auto_51883 ) ) ( not ( = ?auto_51881 ?auto_51882 ) ) ( not ( = ?auto_51881 ?auto_51883 ) ) ( not ( = ?auto_51882 ?auto_51883 ) ) ( CLEAR ?auto_51880 ) ( ON ?auto_51881 ?auto_51882 ) ( CLEAR ?auto_51881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_51875 ?auto_51876 ?auto_51877 ?auto_51878 ?auto_51879 ?auto_51880 ?auto_51881 )
      ( MAKE-8PILE ?auto_51875 ?auto_51876 ?auto_51877 ?auto_51878 ?auto_51879 ?auto_51880 ?auto_51881 ?auto_51882 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51892 - BLOCK
      ?auto_51893 - BLOCK
      ?auto_51894 - BLOCK
      ?auto_51895 - BLOCK
      ?auto_51896 - BLOCK
      ?auto_51897 - BLOCK
      ?auto_51898 - BLOCK
      ?auto_51899 - BLOCK
    )
    :vars
    (
      ?auto_51900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51899 ?auto_51900 ) ( ON-TABLE ?auto_51892 ) ( ON ?auto_51893 ?auto_51892 ) ( ON ?auto_51894 ?auto_51893 ) ( ON ?auto_51895 ?auto_51894 ) ( ON ?auto_51896 ?auto_51895 ) ( not ( = ?auto_51892 ?auto_51893 ) ) ( not ( = ?auto_51892 ?auto_51894 ) ) ( not ( = ?auto_51892 ?auto_51895 ) ) ( not ( = ?auto_51892 ?auto_51896 ) ) ( not ( = ?auto_51892 ?auto_51897 ) ) ( not ( = ?auto_51892 ?auto_51898 ) ) ( not ( = ?auto_51892 ?auto_51899 ) ) ( not ( = ?auto_51892 ?auto_51900 ) ) ( not ( = ?auto_51893 ?auto_51894 ) ) ( not ( = ?auto_51893 ?auto_51895 ) ) ( not ( = ?auto_51893 ?auto_51896 ) ) ( not ( = ?auto_51893 ?auto_51897 ) ) ( not ( = ?auto_51893 ?auto_51898 ) ) ( not ( = ?auto_51893 ?auto_51899 ) ) ( not ( = ?auto_51893 ?auto_51900 ) ) ( not ( = ?auto_51894 ?auto_51895 ) ) ( not ( = ?auto_51894 ?auto_51896 ) ) ( not ( = ?auto_51894 ?auto_51897 ) ) ( not ( = ?auto_51894 ?auto_51898 ) ) ( not ( = ?auto_51894 ?auto_51899 ) ) ( not ( = ?auto_51894 ?auto_51900 ) ) ( not ( = ?auto_51895 ?auto_51896 ) ) ( not ( = ?auto_51895 ?auto_51897 ) ) ( not ( = ?auto_51895 ?auto_51898 ) ) ( not ( = ?auto_51895 ?auto_51899 ) ) ( not ( = ?auto_51895 ?auto_51900 ) ) ( not ( = ?auto_51896 ?auto_51897 ) ) ( not ( = ?auto_51896 ?auto_51898 ) ) ( not ( = ?auto_51896 ?auto_51899 ) ) ( not ( = ?auto_51896 ?auto_51900 ) ) ( not ( = ?auto_51897 ?auto_51898 ) ) ( not ( = ?auto_51897 ?auto_51899 ) ) ( not ( = ?auto_51897 ?auto_51900 ) ) ( not ( = ?auto_51898 ?auto_51899 ) ) ( not ( = ?auto_51898 ?auto_51900 ) ) ( not ( = ?auto_51899 ?auto_51900 ) ) ( ON ?auto_51898 ?auto_51899 ) ( CLEAR ?auto_51896 ) ( ON ?auto_51897 ?auto_51898 ) ( CLEAR ?auto_51897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51892 ?auto_51893 ?auto_51894 ?auto_51895 ?auto_51896 ?auto_51897 )
      ( MAKE-8PILE ?auto_51892 ?auto_51893 ?auto_51894 ?auto_51895 ?auto_51896 ?auto_51897 ?auto_51898 ?auto_51899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51909 - BLOCK
      ?auto_51910 - BLOCK
      ?auto_51911 - BLOCK
      ?auto_51912 - BLOCK
      ?auto_51913 - BLOCK
      ?auto_51914 - BLOCK
      ?auto_51915 - BLOCK
      ?auto_51916 - BLOCK
    )
    :vars
    (
      ?auto_51917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51916 ?auto_51917 ) ( ON-TABLE ?auto_51909 ) ( ON ?auto_51910 ?auto_51909 ) ( ON ?auto_51911 ?auto_51910 ) ( ON ?auto_51912 ?auto_51911 ) ( ON ?auto_51913 ?auto_51912 ) ( not ( = ?auto_51909 ?auto_51910 ) ) ( not ( = ?auto_51909 ?auto_51911 ) ) ( not ( = ?auto_51909 ?auto_51912 ) ) ( not ( = ?auto_51909 ?auto_51913 ) ) ( not ( = ?auto_51909 ?auto_51914 ) ) ( not ( = ?auto_51909 ?auto_51915 ) ) ( not ( = ?auto_51909 ?auto_51916 ) ) ( not ( = ?auto_51909 ?auto_51917 ) ) ( not ( = ?auto_51910 ?auto_51911 ) ) ( not ( = ?auto_51910 ?auto_51912 ) ) ( not ( = ?auto_51910 ?auto_51913 ) ) ( not ( = ?auto_51910 ?auto_51914 ) ) ( not ( = ?auto_51910 ?auto_51915 ) ) ( not ( = ?auto_51910 ?auto_51916 ) ) ( not ( = ?auto_51910 ?auto_51917 ) ) ( not ( = ?auto_51911 ?auto_51912 ) ) ( not ( = ?auto_51911 ?auto_51913 ) ) ( not ( = ?auto_51911 ?auto_51914 ) ) ( not ( = ?auto_51911 ?auto_51915 ) ) ( not ( = ?auto_51911 ?auto_51916 ) ) ( not ( = ?auto_51911 ?auto_51917 ) ) ( not ( = ?auto_51912 ?auto_51913 ) ) ( not ( = ?auto_51912 ?auto_51914 ) ) ( not ( = ?auto_51912 ?auto_51915 ) ) ( not ( = ?auto_51912 ?auto_51916 ) ) ( not ( = ?auto_51912 ?auto_51917 ) ) ( not ( = ?auto_51913 ?auto_51914 ) ) ( not ( = ?auto_51913 ?auto_51915 ) ) ( not ( = ?auto_51913 ?auto_51916 ) ) ( not ( = ?auto_51913 ?auto_51917 ) ) ( not ( = ?auto_51914 ?auto_51915 ) ) ( not ( = ?auto_51914 ?auto_51916 ) ) ( not ( = ?auto_51914 ?auto_51917 ) ) ( not ( = ?auto_51915 ?auto_51916 ) ) ( not ( = ?auto_51915 ?auto_51917 ) ) ( not ( = ?auto_51916 ?auto_51917 ) ) ( ON ?auto_51915 ?auto_51916 ) ( CLEAR ?auto_51913 ) ( ON ?auto_51914 ?auto_51915 ) ( CLEAR ?auto_51914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51909 ?auto_51910 ?auto_51911 ?auto_51912 ?auto_51913 ?auto_51914 )
      ( MAKE-8PILE ?auto_51909 ?auto_51910 ?auto_51911 ?auto_51912 ?auto_51913 ?auto_51914 ?auto_51915 ?auto_51916 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51926 - BLOCK
      ?auto_51927 - BLOCK
      ?auto_51928 - BLOCK
      ?auto_51929 - BLOCK
      ?auto_51930 - BLOCK
      ?auto_51931 - BLOCK
      ?auto_51932 - BLOCK
      ?auto_51933 - BLOCK
    )
    :vars
    (
      ?auto_51934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51933 ?auto_51934 ) ( ON-TABLE ?auto_51926 ) ( ON ?auto_51927 ?auto_51926 ) ( ON ?auto_51928 ?auto_51927 ) ( ON ?auto_51929 ?auto_51928 ) ( not ( = ?auto_51926 ?auto_51927 ) ) ( not ( = ?auto_51926 ?auto_51928 ) ) ( not ( = ?auto_51926 ?auto_51929 ) ) ( not ( = ?auto_51926 ?auto_51930 ) ) ( not ( = ?auto_51926 ?auto_51931 ) ) ( not ( = ?auto_51926 ?auto_51932 ) ) ( not ( = ?auto_51926 ?auto_51933 ) ) ( not ( = ?auto_51926 ?auto_51934 ) ) ( not ( = ?auto_51927 ?auto_51928 ) ) ( not ( = ?auto_51927 ?auto_51929 ) ) ( not ( = ?auto_51927 ?auto_51930 ) ) ( not ( = ?auto_51927 ?auto_51931 ) ) ( not ( = ?auto_51927 ?auto_51932 ) ) ( not ( = ?auto_51927 ?auto_51933 ) ) ( not ( = ?auto_51927 ?auto_51934 ) ) ( not ( = ?auto_51928 ?auto_51929 ) ) ( not ( = ?auto_51928 ?auto_51930 ) ) ( not ( = ?auto_51928 ?auto_51931 ) ) ( not ( = ?auto_51928 ?auto_51932 ) ) ( not ( = ?auto_51928 ?auto_51933 ) ) ( not ( = ?auto_51928 ?auto_51934 ) ) ( not ( = ?auto_51929 ?auto_51930 ) ) ( not ( = ?auto_51929 ?auto_51931 ) ) ( not ( = ?auto_51929 ?auto_51932 ) ) ( not ( = ?auto_51929 ?auto_51933 ) ) ( not ( = ?auto_51929 ?auto_51934 ) ) ( not ( = ?auto_51930 ?auto_51931 ) ) ( not ( = ?auto_51930 ?auto_51932 ) ) ( not ( = ?auto_51930 ?auto_51933 ) ) ( not ( = ?auto_51930 ?auto_51934 ) ) ( not ( = ?auto_51931 ?auto_51932 ) ) ( not ( = ?auto_51931 ?auto_51933 ) ) ( not ( = ?auto_51931 ?auto_51934 ) ) ( not ( = ?auto_51932 ?auto_51933 ) ) ( not ( = ?auto_51932 ?auto_51934 ) ) ( not ( = ?auto_51933 ?auto_51934 ) ) ( ON ?auto_51932 ?auto_51933 ) ( ON ?auto_51931 ?auto_51932 ) ( CLEAR ?auto_51929 ) ( ON ?auto_51930 ?auto_51931 ) ( CLEAR ?auto_51930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51926 ?auto_51927 ?auto_51928 ?auto_51929 ?auto_51930 )
      ( MAKE-8PILE ?auto_51926 ?auto_51927 ?auto_51928 ?auto_51929 ?auto_51930 ?auto_51931 ?auto_51932 ?auto_51933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51943 - BLOCK
      ?auto_51944 - BLOCK
      ?auto_51945 - BLOCK
      ?auto_51946 - BLOCK
      ?auto_51947 - BLOCK
      ?auto_51948 - BLOCK
      ?auto_51949 - BLOCK
      ?auto_51950 - BLOCK
    )
    :vars
    (
      ?auto_51951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51950 ?auto_51951 ) ( ON-TABLE ?auto_51943 ) ( ON ?auto_51944 ?auto_51943 ) ( ON ?auto_51945 ?auto_51944 ) ( ON ?auto_51946 ?auto_51945 ) ( not ( = ?auto_51943 ?auto_51944 ) ) ( not ( = ?auto_51943 ?auto_51945 ) ) ( not ( = ?auto_51943 ?auto_51946 ) ) ( not ( = ?auto_51943 ?auto_51947 ) ) ( not ( = ?auto_51943 ?auto_51948 ) ) ( not ( = ?auto_51943 ?auto_51949 ) ) ( not ( = ?auto_51943 ?auto_51950 ) ) ( not ( = ?auto_51943 ?auto_51951 ) ) ( not ( = ?auto_51944 ?auto_51945 ) ) ( not ( = ?auto_51944 ?auto_51946 ) ) ( not ( = ?auto_51944 ?auto_51947 ) ) ( not ( = ?auto_51944 ?auto_51948 ) ) ( not ( = ?auto_51944 ?auto_51949 ) ) ( not ( = ?auto_51944 ?auto_51950 ) ) ( not ( = ?auto_51944 ?auto_51951 ) ) ( not ( = ?auto_51945 ?auto_51946 ) ) ( not ( = ?auto_51945 ?auto_51947 ) ) ( not ( = ?auto_51945 ?auto_51948 ) ) ( not ( = ?auto_51945 ?auto_51949 ) ) ( not ( = ?auto_51945 ?auto_51950 ) ) ( not ( = ?auto_51945 ?auto_51951 ) ) ( not ( = ?auto_51946 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51948 ) ) ( not ( = ?auto_51946 ?auto_51949 ) ) ( not ( = ?auto_51946 ?auto_51950 ) ) ( not ( = ?auto_51946 ?auto_51951 ) ) ( not ( = ?auto_51947 ?auto_51948 ) ) ( not ( = ?auto_51947 ?auto_51949 ) ) ( not ( = ?auto_51947 ?auto_51950 ) ) ( not ( = ?auto_51947 ?auto_51951 ) ) ( not ( = ?auto_51948 ?auto_51949 ) ) ( not ( = ?auto_51948 ?auto_51950 ) ) ( not ( = ?auto_51948 ?auto_51951 ) ) ( not ( = ?auto_51949 ?auto_51950 ) ) ( not ( = ?auto_51949 ?auto_51951 ) ) ( not ( = ?auto_51950 ?auto_51951 ) ) ( ON ?auto_51949 ?auto_51950 ) ( ON ?auto_51948 ?auto_51949 ) ( CLEAR ?auto_51946 ) ( ON ?auto_51947 ?auto_51948 ) ( CLEAR ?auto_51947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51943 ?auto_51944 ?auto_51945 ?auto_51946 ?auto_51947 )
      ( MAKE-8PILE ?auto_51943 ?auto_51944 ?auto_51945 ?auto_51946 ?auto_51947 ?auto_51948 ?auto_51949 ?auto_51950 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51960 - BLOCK
      ?auto_51961 - BLOCK
      ?auto_51962 - BLOCK
      ?auto_51963 - BLOCK
      ?auto_51964 - BLOCK
      ?auto_51965 - BLOCK
      ?auto_51966 - BLOCK
      ?auto_51967 - BLOCK
    )
    :vars
    (
      ?auto_51968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51967 ?auto_51968 ) ( ON-TABLE ?auto_51960 ) ( ON ?auto_51961 ?auto_51960 ) ( ON ?auto_51962 ?auto_51961 ) ( not ( = ?auto_51960 ?auto_51961 ) ) ( not ( = ?auto_51960 ?auto_51962 ) ) ( not ( = ?auto_51960 ?auto_51963 ) ) ( not ( = ?auto_51960 ?auto_51964 ) ) ( not ( = ?auto_51960 ?auto_51965 ) ) ( not ( = ?auto_51960 ?auto_51966 ) ) ( not ( = ?auto_51960 ?auto_51967 ) ) ( not ( = ?auto_51960 ?auto_51968 ) ) ( not ( = ?auto_51961 ?auto_51962 ) ) ( not ( = ?auto_51961 ?auto_51963 ) ) ( not ( = ?auto_51961 ?auto_51964 ) ) ( not ( = ?auto_51961 ?auto_51965 ) ) ( not ( = ?auto_51961 ?auto_51966 ) ) ( not ( = ?auto_51961 ?auto_51967 ) ) ( not ( = ?auto_51961 ?auto_51968 ) ) ( not ( = ?auto_51962 ?auto_51963 ) ) ( not ( = ?auto_51962 ?auto_51964 ) ) ( not ( = ?auto_51962 ?auto_51965 ) ) ( not ( = ?auto_51962 ?auto_51966 ) ) ( not ( = ?auto_51962 ?auto_51967 ) ) ( not ( = ?auto_51962 ?auto_51968 ) ) ( not ( = ?auto_51963 ?auto_51964 ) ) ( not ( = ?auto_51963 ?auto_51965 ) ) ( not ( = ?auto_51963 ?auto_51966 ) ) ( not ( = ?auto_51963 ?auto_51967 ) ) ( not ( = ?auto_51963 ?auto_51968 ) ) ( not ( = ?auto_51964 ?auto_51965 ) ) ( not ( = ?auto_51964 ?auto_51966 ) ) ( not ( = ?auto_51964 ?auto_51967 ) ) ( not ( = ?auto_51964 ?auto_51968 ) ) ( not ( = ?auto_51965 ?auto_51966 ) ) ( not ( = ?auto_51965 ?auto_51967 ) ) ( not ( = ?auto_51965 ?auto_51968 ) ) ( not ( = ?auto_51966 ?auto_51967 ) ) ( not ( = ?auto_51966 ?auto_51968 ) ) ( not ( = ?auto_51967 ?auto_51968 ) ) ( ON ?auto_51966 ?auto_51967 ) ( ON ?auto_51965 ?auto_51966 ) ( ON ?auto_51964 ?auto_51965 ) ( CLEAR ?auto_51962 ) ( ON ?auto_51963 ?auto_51964 ) ( CLEAR ?auto_51963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51960 ?auto_51961 ?auto_51962 ?auto_51963 )
      ( MAKE-8PILE ?auto_51960 ?auto_51961 ?auto_51962 ?auto_51963 ?auto_51964 ?auto_51965 ?auto_51966 ?auto_51967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51977 - BLOCK
      ?auto_51978 - BLOCK
      ?auto_51979 - BLOCK
      ?auto_51980 - BLOCK
      ?auto_51981 - BLOCK
      ?auto_51982 - BLOCK
      ?auto_51983 - BLOCK
      ?auto_51984 - BLOCK
    )
    :vars
    (
      ?auto_51985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51984 ?auto_51985 ) ( ON-TABLE ?auto_51977 ) ( ON ?auto_51978 ?auto_51977 ) ( ON ?auto_51979 ?auto_51978 ) ( not ( = ?auto_51977 ?auto_51978 ) ) ( not ( = ?auto_51977 ?auto_51979 ) ) ( not ( = ?auto_51977 ?auto_51980 ) ) ( not ( = ?auto_51977 ?auto_51981 ) ) ( not ( = ?auto_51977 ?auto_51982 ) ) ( not ( = ?auto_51977 ?auto_51983 ) ) ( not ( = ?auto_51977 ?auto_51984 ) ) ( not ( = ?auto_51977 ?auto_51985 ) ) ( not ( = ?auto_51978 ?auto_51979 ) ) ( not ( = ?auto_51978 ?auto_51980 ) ) ( not ( = ?auto_51978 ?auto_51981 ) ) ( not ( = ?auto_51978 ?auto_51982 ) ) ( not ( = ?auto_51978 ?auto_51983 ) ) ( not ( = ?auto_51978 ?auto_51984 ) ) ( not ( = ?auto_51978 ?auto_51985 ) ) ( not ( = ?auto_51979 ?auto_51980 ) ) ( not ( = ?auto_51979 ?auto_51981 ) ) ( not ( = ?auto_51979 ?auto_51982 ) ) ( not ( = ?auto_51979 ?auto_51983 ) ) ( not ( = ?auto_51979 ?auto_51984 ) ) ( not ( = ?auto_51979 ?auto_51985 ) ) ( not ( = ?auto_51980 ?auto_51981 ) ) ( not ( = ?auto_51980 ?auto_51982 ) ) ( not ( = ?auto_51980 ?auto_51983 ) ) ( not ( = ?auto_51980 ?auto_51984 ) ) ( not ( = ?auto_51980 ?auto_51985 ) ) ( not ( = ?auto_51981 ?auto_51982 ) ) ( not ( = ?auto_51981 ?auto_51983 ) ) ( not ( = ?auto_51981 ?auto_51984 ) ) ( not ( = ?auto_51981 ?auto_51985 ) ) ( not ( = ?auto_51982 ?auto_51983 ) ) ( not ( = ?auto_51982 ?auto_51984 ) ) ( not ( = ?auto_51982 ?auto_51985 ) ) ( not ( = ?auto_51983 ?auto_51984 ) ) ( not ( = ?auto_51983 ?auto_51985 ) ) ( not ( = ?auto_51984 ?auto_51985 ) ) ( ON ?auto_51983 ?auto_51984 ) ( ON ?auto_51982 ?auto_51983 ) ( ON ?auto_51981 ?auto_51982 ) ( CLEAR ?auto_51979 ) ( ON ?auto_51980 ?auto_51981 ) ( CLEAR ?auto_51980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51977 ?auto_51978 ?auto_51979 ?auto_51980 )
      ( MAKE-8PILE ?auto_51977 ?auto_51978 ?auto_51979 ?auto_51980 ?auto_51981 ?auto_51982 ?auto_51983 ?auto_51984 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_51994 - BLOCK
      ?auto_51995 - BLOCK
      ?auto_51996 - BLOCK
      ?auto_51997 - BLOCK
      ?auto_51998 - BLOCK
      ?auto_51999 - BLOCK
      ?auto_52000 - BLOCK
      ?auto_52001 - BLOCK
    )
    :vars
    (
      ?auto_52002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52001 ?auto_52002 ) ( ON-TABLE ?auto_51994 ) ( ON ?auto_51995 ?auto_51994 ) ( not ( = ?auto_51994 ?auto_51995 ) ) ( not ( = ?auto_51994 ?auto_51996 ) ) ( not ( = ?auto_51994 ?auto_51997 ) ) ( not ( = ?auto_51994 ?auto_51998 ) ) ( not ( = ?auto_51994 ?auto_51999 ) ) ( not ( = ?auto_51994 ?auto_52000 ) ) ( not ( = ?auto_51994 ?auto_52001 ) ) ( not ( = ?auto_51994 ?auto_52002 ) ) ( not ( = ?auto_51995 ?auto_51996 ) ) ( not ( = ?auto_51995 ?auto_51997 ) ) ( not ( = ?auto_51995 ?auto_51998 ) ) ( not ( = ?auto_51995 ?auto_51999 ) ) ( not ( = ?auto_51995 ?auto_52000 ) ) ( not ( = ?auto_51995 ?auto_52001 ) ) ( not ( = ?auto_51995 ?auto_52002 ) ) ( not ( = ?auto_51996 ?auto_51997 ) ) ( not ( = ?auto_51996 ?auto_51998 ) ) ( not ( = ?auto_51996 ?auto_51999 ) ) ( not ( = ?auto_51996 ?auto_52000 ) ) ( not ( = ?auto_51996 ?auto_52001 ) ) ( not ( = ?auto_51996 ?auto_52002 ) ) ( not ( = ?auto_51997 ?auto_51998 ) ) ( not ( = ?auto_51997 ?auto_51999 ) ) ( not ( = ?auto_51997 ?auto_52000 ) ) ( not ( = ?auto_51997 ?auto_52001 ) ) ( not ( = ?auto_51997 ?auto_52002 ) ) ( not ( = ?auto_51998 ?auto_51999 ) ) ( not ( = ?auto_51998 ?auto_52000 ) ) ( not ( = ?auto_51998 ?auto_52001 ) ) ( not ( = ?auto_51998 ?auto_52002 ) ) ( not ( = ?auto_51999 ?auto_52000 ) ) ( not ( = ?auto_51999 ?auto_52001 ) ) ( not ( = ?auto_51999 ?auto_52002 ) ) ( not ( = ?auto_52000 ?auto_52001 ) ) ( not ( = ?auto_52000 ?auto_52002 ) ) ( not ( = ?auto_52001 ?auto_52002 ) ) ( ON ?auto_52000 ?auto_52001 ) ( ON ?auto_51999 ?auto_52000 ) ( ON ?auto_51998 ?auto_51999 ) ( ON ?auto_51997 ?auto_51998 ) ( CLEAR ?auto_51995 ) ( ON ?auto_51996 ?auto_51997 ) ( CLEAR ?auto_51996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51994 ?auto_51995 ?auto_51996 )
      ( MAKE-8PILE ?auto_51994 ?auto_51995 ?auto_51996 ?auto_51997 ?auto_51998 ?auto_51999 ?auto_52000 ?auto_52001 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_52011 - BLOCK
      ?auto_52012 - BLOCK
      ?auto_52013 - BLOCK
      ?auto_52014 - BLOCK
      ?auto_52015 - BLOCK
      ?auto_52016 - BLOCK
      ?auto_52017 - BLOCK
      ?auto_52018 - BLOCK
    )
    :vars
    (
      ?auto_52019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52018 ?auto_52019 ) ( ON-TABLE ?auto_52011 ) ( ON ?auto_52012 ?auto_52011 ) ( not ( = ?auto_52011 ?auto_52012 ) ) ( not ( = ?auto_52011 ?auto_52013 ) ) ( not ( = ?auto_52011 ?auto_52014 ) ) ( not ( = ?auto_52011 ?auto_52015 ) ) ( not ( = ?auto_52011 ?auto_52016 ) ) ( not ( = ?auto_52011 ?auto_52017 ) ) ( not ( = ?auto_52011 ?auto_52018 ) ) ( not ( = ?auto_52011 ?auto_52019 ) ) ( not ( = ?auto_52012 ?auto_52013 ) ) ( not ( = ?auto_52012 ?auto_52014 ) ) ( not ( = ?auto_52012 ?auto_52015 ) ) ( not ( = ?auto_52012 ?auto_52016 ) ) ( not ( = ?auto_52012 ?auto_52017 ) ) ( not ( = ?auto_52012 ?auto_52018 ) ) ( not ( = ?auto_52012 ?auto_52019 ) ) ( not ( = ?auto_52013 ?auto_52014 ) ) ( not ( = ?auto_52013 ?auto_52015 ) ) ( not ( = ?auto_52013 ?auto_52016 ) ) ( not ( = ?auto_52013 ?auto_52017 ) ) ( not ( = ?auto_52013 ?auto_52018 ) ) ( not ( = ?auto_52013 ?auto_52019 ) ) ( not ( = ?auto_52014 ?auto_52015 ) ) ( not ( = ?auto_52014 ?auto_52016 ) ) ( not ( = ?auto_52014 ?auto_52017 ) ) ( not ( = ?auto_52014 ?auto_52018 ) ) ( not ( = ?auto_52014 ?auto_52019 ) ) ( not ( = ?auto_52015 ?auto_52016 ) ) ( not ( = ?auto_52015 ?auto_52017 ) ) ( not ( = ?auto_52015 ?auto_52018 ) ) ( not ( = ?auto_52015 ?auto_52019 ) ) ( not ( = ?auto_52016 ?auto_52017 ) ) ( not ( = ?auto_52016 ?auto_52018 ) ) ( not ( = ?auto_52016 ?auto_52019 ) ) ( not ( = ?auto_52017 ?auto_52018 ) ) ( not ( = ?auto_52017 ?auto_52019 ) ) ( not ( = ?auto_52018 ?auto_52019 ) ) ( ON ?auto_52017 ?auto_52018 ) ( ON ?auto_52016 ?auto_52017 ) ( ON ?auto_52015 ?auto_52016 ) ( ON ?auto_52014 ?auto_52015 ) ( CLEAR ?auto_52012 ) ( ON ?auto_52013 ?auto_52014 ) ( CLEAR ?auto_52013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52011 ?auto_52012 ?auto_52013 )
      ( MAKE-8PILE ?auto_52011 ?auto_52012 ?auto_52013 ?auto_52014 ?auto_52015 ?auto_52016 ?auto_52017 ?auto_52018 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_52028 - BLOCK
      ?auto_52029 - BLOCK
      ?auto_52030 - BLOCK
      ?auto_52031 - BLOCK
      ?auto_52032 - BLOCK
      ?auto_52033 - BLOCK
      ?auto_52034 - BLOCK
      ?auto_52035 - BLOCK
    )
    :vars
    (
      ?auto_52036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52035 ?auto_52036 ) ( ON-TABLE ?auto_52028 ) ( not ( = ?auto_52028 ?auto_52029 ) ) ( not ( = ?auto_52028 ?auto_52030 ) ) ( not ( = ?auto_52028 ?auto_52031 ) ) ( not ( = ?auto_52028 ?auto_52032 ) ) ( not ( = ?auto_52028 ?auto_52033 ) ) ( not ( = ?auto_52028 ?auto_52034 ) ) ( not ( = ?auto_52028 ?auto_52035 ) ) ( not ( = ?auto_52028 ?auto_52036 ) ) ( not ( = ?auto_52029 ?auto_52030 ) ) ( not ( = ?auto_52029 ?auto_52031 ) ) ( not ( = ?auto_52029 ?auto_52032 ) ) ( not ( = ?auto_52029 ?auto_52033 ) ) ( not ( = ?auto_52029 ?auto_52034 ) ) ( not ( = ?auto_52029 ?auto_52035 ) ) ( not ( = ?auto_52029 ?auto_52036 ) ) ( not ( = ?auto_52030 ?auto_52031 ) ) ( not ( = ?auto_52030 ?auto_52032 ) ) ( not ( = ?auto_52030 ?auto_52033 ) ) ( not ( = ?auto_52030 ?auto_52034 ) ) ( not ( = ?auto_52030 ?auto_52035 ) ) ( not ( = ?auto_52030 ?auto_52036 ) ) ( not ( = ?auto_52031 ?auto_52032 ) ) ( not ( = ?auto_52031 ?auto_52033 ) ) ( not ( = ?auto_52031 ?auto_52034 ) ) ( not ( = ?auto_52031 ?auto_52035 ) ) ( not ( = ?auto_52031 ?auto_52036 ) ) ( not ( = ?auto_52032 ?auto_52033 ) ) ( not ( = ?auto_52032 ?auto_52034 ) ) ( not ( = ?auto_52032 ?auto_52035 ) ) ( not ( = ?auto_52032 ?auto_52036 ) ) ( not ( = ?auto_52033 ?auto_52034 ) ) ( not ( = ?auto_52033 ?auto_52035 ) ) ( not ( = ?auto_52033 ?auto_52036 ) ) ( not ( = ?auto_52034 ?auto_52035 ) ) ( not ( = ?auto_52034 ?auto_52036 ) ) ( not ( = ?auto_52035 ?auto_52036 ) ) ( ON ?auto_52034 ?auto_52035 ) ( ON ?auto_52033 ?auto_52034 ) ( ON ?auto_52032 ?auto_52033 ) ( ON ?auto_52031 ?auto_52032 ) ( ON ?auto_52030 ?auto_52031 ) ( CLEAR ?auto_52028 ) ( ON ?auto_52029 ?auto_52030 ) ( CLEAR ?auto_52029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52028 ?auto_52029 )
      ( MAKE-8PILE ?auto_52028 ?auto_52029 ?auto_52030 ?auto_52031 ?auto_52032 ?auto_52033 ?auto_52034 ?auto_52035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_52045 - BLOCK
      ?auto_52046 - BLOCK
      ?auto_52047 - BLOCK
      ?auto_52048 - BLOCK
      ?auto_52049 - BLOCK
      ?auto_52050 - BLOCK
      ?auto_52051 - BLOCK
      ?auto_52052 - BLOCK
    )
    :vars
    (
      ?auto_52053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52052 ?auto_52053 ) ( ON-TABLE ?auto_52045 ) ( not ( = ?auto_52045 ?auto_52046 ) ) ( not ( = ?auto_52045 ?auto_52047 ) ) ( not ( = ?auto_52045 ?auto_52048 ) ) ( not ( = ?auto_52045 ?auto_52049 ) ) ( not ( = ?auto_52045 ?auto_52050 ) ) ( not ( = ?auto_52045 ?auto_52051 ) ) ( not ( = ?auto_52045 ?auto_52052 ) ) ( not ( = ?auto_52045 ?auto_52053 ) ) ( not ( = ?auto_52046 ?auto_52047 ) ) ( not ( = ?auto_52046 ?auto_52048 ) ) ( not ( = ?auto_52046 ?auto_52049 ) ) ( not ( = ?auto_52046 ?auto_52050 ) ) ( not ( = ?auto_52046 ?auto_52051 ) ) ( not ( = ?auto_52046 ?auto_52052 ) ) ( not ( = ?auto_52046 ?auto_52053 ) ) ( not ( = ?auto_52047 ?auto_52048 ) ) ( not ( = ?auto_52047 ?auto_52049 ) ) ( not ( = ?auto_52047 ?auto_52050 ) ) ( not ( = ?auto_52047 ?auto_52051 ) ) ( not ( = ?auto_52047 ?auto_52052 ) ) ( not ( = ?auto_52047 ?auto_52053 ) ) ( not ( = ?auto_52048 ?auto_52049 ) ) ( not ( = ?auto_52048 ?auto_52050 ) ) ( not ( = ?auto_52048 ?auto_52051 ) ) ( not ( = ?auto_52048 ?auto_52052 ) ) ( not ( = ?auto_52048 ?auto_52053 ) ) ( not ( = ?auto_52049 ?auto_52050 ) ) ( not ( = ?auto_52049 ?auto_52051 ) ) ( not ( = ?auto_52049 ?auto_52052 ) ) ( not ( = ?auto_52049 ?auto_52053 ) ) ( not ( = ?auto_52050 ?auto_52051 ) ) ( not ( = ?auto_52050 ?auto_52052 ) ) ( not ( = ?auto_52050 ?auto_52053 ) ) ( not ( = ?auto_52051 ?auto_52052 ) ) ( not ( = ?auto_52051 ?auto_52053 ) ) ( not ( = ?auto_52052 ?auto_52053 ) ) ( ON ?auto_52051 ?auto_52052 ) ( ON ?auto_52050 ?auto_52051 ) ( ON ?auto_52049 ?auto_52050 ) ( ON ?auto_52048 ?auto_52049 ) ( ON ?auto_52047 ?auto_52048 ) ( CLEAR ?auto_52045 ) ( ON ?auto_52046 ?auto_52047 ) ( CLEAR ?auto_52046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52045 ?auto_52046 )
      ( MAKE-8PILE ?auto_52045 ?auto_52046 ?auto_52047 ?auto_52048 ?auto_52049 ?auto_52050 ?auto_52051 ?auto_52052 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_52062 - BLOCK
      ?auto_52063 - BLOCK
      ?auto_52064 - BLOCK
      ?auto_52065 - BLOCK
      ?auto_52066 - BLOCK
      ?auto_52067 - BLOCK
      ?auto_52068 - BLOCK
      ?auto_52069 - BLOCK
    )
    :vars
    (
      ?auto_52070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52069 ?auto_52070 ) ( not ( = ?auto_52062 ?auto_52063 ) ) ( not ( = ?auto_52062 ?auto_52064 ) ) ( not ( = ?auto_52062 ?auto_52065 ) ) ( not ( = ?auto_52062 ?auto_52066 ) ) ( not ( = ?auto_52062 ?auto_52067 ) ) ( not ( = ?auto_52062 ?auto_52068 ) ) ( not ( = ?auto_52062 ?auto_52069 ) ) ( not ( = ?auto_52062 ?auto_52070 ) ) ( not ( = ?auto_52063 ?auto_52064 ) ) ( not ( = ?auto_52063 ?auto_52065 ) ) ( not ( = ?auto_52063 ?auto_52066 ) ) ( not ( = ?auto_52063 ?auto_52067 ) ) ( not ( = ?auto_52063 ?auto_52068 ) ) ( not ( = ?auto_52063 ?auto_52069 ) ) ( not ( = ?auto_52063 ?auto_52070 ) ) ( not ( = ?auto_52064 ?auto_52065 ) ) ( not ( = ?auto_52064 ?auto_52066 ) ) ( not ( = ?auto_52064 ?auto_52067 ) ) ( not ( = ?auto_52064 ?auto_52068 ) ) ( not ( = ?auto_52064 ?auto_52069 ) ) ( not ( = ?auto_52064 ?auto_52070 ) ) ( not ( = ?auto_52065 ?auto_52066 ) ) ( not ( = ?auto_52065 ?auto_52067 ) ) ( not ( = ?auto_52065 ?auto_52068 ) ) ( not ( = ?auto_52065 ?auto_52069 ) ) ( not ( = ?auto_52065 ?auto_52070 ) ) ( not ( = ?auto_52066 ?auto_52067 ) ) ( not ( = ?auto_52066 ?auto_52068 ) ) ( not ( = ?auto_52066 ?auto_52069 ) ) ( not ( = ?auto_52066 ?auto_52070 ) ) ( not ( = ?auto_52067 ?auto_52068 ) ) ( not ( = ?auto_52067 ?auto_52069 ) ) ( not ( = ?auto_52067 ?auto_52070 ) ) ( not ( = ?auto_52068 ?auto_52069 ) ) ( not ( = ?auto_52068 ?auto_52070 ) ) ( not ( = ?auto_52069 ?auto_52070 ) ) ( ON ?auto_52068 ?auto_52069 ) ( ON ?auto_52067 ?auto_52068 ) ( ON ?auto_52066 ?auto_52067 ) ( ON ?auto_52065 ?auto_52066 ) ( ON ?auto_52064 ?auto_52065 ) ( ON ?auto_52063 ?auto_52064 ) ( ON ?auto_52062 ?auto_52063 ) ( CLEAR ?auto_52062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52062 )
      ( MAKE-8PILE ?auto_52062 ?auto_52063 ?auto_52064 ?auto_52065 ?auto_52066 ?auto_52067 ?auto_52068 ?auto_52069 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_52079 - BLOCK
      ?auto_52080 - BLOCK
      ?auto_52081 - BLOCK
      ?auto_52082 - BLOCK
      ?auto_52083 - BLOCK
      ?auto_52084 - BLOCK
      ?auto_52085 - BLOCK
      ?auto_52086 - BLOCK
    )
    :vars
    (
      ?auto_52087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52086 ?auto_52087 ) ( not ( = ?auto_52079 ?auto_52080 ) ) ( not ( = ?auto_52079 ?auto_52081 ) ) ( not ( = ?auto_52079 ?auto_52082 ) ) ( not ( = ?auto_52079 ?auto_52083 ) ) ( not ( = ?auto_52079 ?auto_52084 ) ) ( not ( = ?auto_52079 ?auto_52085 ) ) ( not ( = ?auto_52079 ?auto_52086 ) ) ( not ( = ?auto_52079 ?auto_52087 ) ) ( not ( = ?auto_52080 ?auto_52081 ) ) ( not ( = ?auto_52080 ?auto_52082 ) ) ( not ( = ?auto_52080 ?auto_52083 ) ) ( not ( = ?auto_52080 ?auto_52084 ) ) ( not ( = ?auto_52080 ?auto_52085 ) ) ( not ( = ?auto_52080 ?auto_52086 ) ) ( not ( = ?auto_52080 ?auto_52087 ) ) ( not ( = ?auto_52081 ?auto_52082 ) ) ( not ( = ?auto_52081 ?auto_52083 ) ) ( not ( = ?auto_52081 ?auto_52084 ) ) ( not ( = ?auto_52081 ?auto_52085 ) ) ( not ( = ?auto_52081 ?auto_52086 ) ) ( not ( = ?auto_52081 ?auto_52087 ) ) ( not ( = ?auto_52082 ?auto_52083 ) ) ( not ( = ?auto_52082 ?auto_52084 ) ) ( not ( = ?auto_52082 ?auto_52085 ) ) ( not ( = ?auto_52082 ?auto_52086 ) ) ( not ( = ?auto_52082 ?auto_52087 ) ) ( not ( = ?auto_52083 ?auto_52084 ) ) ( not ( = ?auto_52083 ?auto_52085 ) ) ( not ( = ?auto_52083 ?auto_52086 ) ) ( not ( = ?auto_52083 ?auto_52087 ) ) ( not ( = ?auto_52084 ?auto_52085 ) ) ( not ( = ?auto_52084 ?auto_52086 ) ) ( not ( = ?auto_52084 ?auto_52087 ) ) ( not ( = ?auto_52085 ?auto_52086 ) ) ( not ( = ?auto_52085 ?auto_52087 ) ) ( not ( = ?auto_52086 ?auto_52087 ) ) ( ON ?auto_52085 ?auto_52086 ) ( ON ?auto_52084 ?auto_52085 ) ( ON ?auto_52083 ?auto_52084 ) ( ON ?auto_52082 ?auto_52083 ) ( ON ?auto_52081 ?auto_52082 ) ( ON ?auto_52080 ?auto_52081 ) ( ON ?auto_52079 ?auto_52080 ) ( CLEAR ?auto_52079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52079 )
      ( MAKE-8PILE ?auto_52079 ?auto_52080 ?auto_52081 ?auto_52082 ?auto_52083 ?auto_52084 ?auto_52085 ?auto_52086 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52097 - BLOCK
      ?auto_52098 - BLOCK
      ?auto_52099 - BLOCK
      ?auto_52100 - BLOCK
      ?auto_52101 - BLOCK
      ?auto_52102 - BLOCK
      ?auto_52103 - BLOCK
      ?auto_52104 - BLOCK
      ?auto_52105 - BLOCK
    )
    :vars
    (
      ?auto_52106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52104 ) ( ON ?auto_52105 ?auto_52106 ) ( CLEAR ?auto_52105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52097 ) ( ON ?auto_52098 ?auto_52097 ) ( ON ?auto_52099 ?auto_52098 ) ( ON ?auto_52100 ?auto_52099 ) ( ON ?auto_52101 ?auto_52100 ) ( ON ?auto_52102 ?auto_52101 ) ( ON ?auto_52103 ?auto_52102 ) ( ON ?auto_52104 ?auto_52103 ) ( not ( = ?auto_52097 ?auto_52098 ) ) ( not ( = ?auto_52097 ?auto_52099 ) ) ( not ( = ?auto_52097 ?auto_52100 ) ) ( not ( = ?auto_52097 ?auto_52101 ) ) ( not ( = ?auto_52097 ?auto_52102 ) ) ( not ( = ?auto_52097 ?auto_52103 ) ) ( not ( = ?auto_52097 ?auto_52104 ) ) ( not ( = ?auto_52097 ?auto_52105 ) ) ( not ( = ?auto_52097 ?auto_52106 ) ) ( not ( = ?auto_52098 ?auto_52099 ) ) ( not ( = ?auto_52098 ?auto_52100 ) ) ( not ( = ?auto_52098 ?auto_52101 ) ) ( not ( = ?auto_52098 ?auto_52102 ) ) ( not ( = ?auto_52098 ?auto_52103 ) ) ( not ( = ?auto_52098 ?auto_52104 ) ) ( not ( = ?auto_52098 ?auto_52105 ) ) ( not ( = ?auto_52098 ?auto_52106 ) ) ( not ( = ?auto_52099 ?auto_52100 ) ) ( not ( = ?auto_52099 ?auto_52101 ) ) ( not ( = ?auto_52099 ?auto_52102 ) ) ( not ( = ?auto_52099 ?auto_52103 ) ) ( not ( = ?auto_52099 ?auto_52104 ) ) ( not ( = ?auto_52099 ?auto_52105 ) ) ( not ( = ?auto_52099 ?auto_52106 ) ) ( not ( = ?auto_52100 ?auto_52101 ) ) ( not ( = ?auto_52100 ?auto_52102 ) ) ( not ( = ?auto_52100 ?auto_52103 ) ) ( not ( = ?auto_52100 ?auto_52104 ) ) ( not ( = ?auto_52100 ?auto_52105 ) ) ( not ( = ?auto_52100 ?auto_52106 ) ) ( not ( = ?auto_52101 ?auto_52102 ) ) ( not ( = ?auto_52101 ?auto_52103 ) ) ( not ( = ?auto_52101 ?auto_52104 ) ) ( not ( = ?auto_52101 ?auto_52105 ) ) ( not ( = ?auto_52101 ?auto_52106 ) ) ( not ( = ?auto_52102 ?auto_52103 ) ) ( not ( = ?auto_52102 ?auto_52104 ) ) ( not ( = ?auto_52102 ?auto_52105 ) ) ( not ( = ?auto_52102 ?auto_52106 ) ) ( not ( = ?auto_52103 ?auto_52104 ) ) ( not ( = ?auto_52103 ?auto_52105 ) ) ( not ( = ?auto_52103 ?auto_52106 ) ) ( not ( = ?auto_52104 ?auto_52105 ) ) ( not ( = ?auto_52104 ?auto_52106 ) ) ( not ( = ?auto_52105 ?auto_52106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52105 ?auto_52106 )
      ( !STACK ?auto_52105 ?auto_52104 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52116 - BLOCK
      ?auto_52117 - BLOCK
      ?auto_52118 - BLOCK
      ?auto_52119 - BLOCK
      ?auto_52120 - BLOCK
      ?auto_52121 - BLOCK
      ?auto_52122 - BLOCK
      ?auto_52123 - BLOCK
      ?auto_52124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52123 ) ( ON-TABLE ?auto_52124 ) ( CLEAR ?auto_52124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52116 ) ( ON ?auto_52117 ?auto_52116 ) ( ON ?auto_52118 ?auto_52117 ) ( ON ?auto_52119 ?auto_52118 ) ( ON ?auto_52120 ?auto_52119 ) ( ON ?auto_52121 ?auto_52120 ) ( ON ?auto_52122 ?auto_52121 ) ( ON ?auto_52123 ?auto_52122 ) ( not ( = ?auto_52116 ?auto_52117 ) ) ( not ( = ?auto_52116 ?auto_52118 ) ) ( not ( = ?auto_52116 ?auto_52119 ) ) ( not ( = ?auto_52116 ?auto_52120 ) ) ( not ( = ?auto_52116 ?auto_52121 ) ) ( not ( = ?auto_52116 ?auto_52122 ) ) ( not ( = ?auto_52116 ?auto_52123 ) ) ( not ( = ?auto_52116 ?auto_52124 ) ) ( not ( = ?auto_52117 ?auto_52118 ) ) ( not ( = ?auto_52117 ?auto_52119 ) ) ( not ( = ?auto_52117 ?auto_52120 ) ) ( not ( = ?auto_52117 ?auto_52121 ) ) ( not ( = ?auto_52117 ?auto_52122 ) ) ( not ( = ?auto_52117 ?auto_52123 ) ) ( not ( = ?auto_52117 ?auto_52124 ) ) ( not ( = ?auto_52118 ?auto_52119 ) ) ( not ( = ?auto_52118 ?auto_52120 ) ) ( not ( = ?auto_52118 ?auto_52121 ) ) ( not ( = ?auto_52118 ?auto_52122 ) ) ( not ( = ?auto_52118 ?auto_52123 ) ) ( not ( = ?auto_52118 ?auto_52124 ) ) ( not ( = ?auto_52119 ?auto_52120 ) ) ( not ( = ?auto_52119 ?auto_52121 ) ) ( not ( = ?auto_52119 ?auto_52122 ) ) ( not ( = ?auto_52119 ?auto_52123 ) ) ( not ( = ?auto_52119 ?auto_52124 ) ) ( not ( = ?auto_52120 ?auto_52121 ) ) ( not ( = ?auto_52120 ?auto_52122 ) ) ( not ( = ?auto_52120 ?auto_52123 ) ) ( not ( = ?auto_52120 ?auto_52124 ) ) ( not ( = ?auto_52121 ?auto_52122 ) ) ( not ( = ?auto_52121 ?auto_52123 ) ) ( not ( = ?auto_52121 ?auto_52124 ) ) ( not ( = ?auto_52122 ?auto_52123 ) ) ( not ( = ?auto_52122 ?auto_52124 ) ) ( not ( = ?auto_52123 ?auto_52124 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_52124 )
      ( !STACK ?auto_52124 ?auto_52123 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52134 - BLOCK
      ?auto_52135 - BLOCK
      ?auto_52136 - BLOCK
      ?auto_52137 - BLOCK
      ?auto_52138 - BLOCK
      ?auto_52139 - BLOCK
      ?auto_52140 - BLOCK
      ?auto_52141 - BLOCK
      ?auto_52142 - BLOCK
    )
    :vars
    (
      ?auto_52143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52142 ?auto_52143 ) ( ON-TABLE ?auto_52134 ) ( ON ?auto_52135 ?auto_52134 ) ( ON ?auto_52136 ?auto_52135 ) ( ON ?auto_52137 ?auto_52136 ) ( ON ?auto_52138 ?auto_52137 ) ( ON ?auto_52139 ?auto_52138 ) ( ON ?auto_52140 ?auto_52139 ) ( not ( = ?auto_52134 ?auto_52135 ) ) ( not ( = ?auto_52134 ?auto_52136 ) ) ( not ( = ?auto_52134 ?auto_52137 ) ) ( not ( = ?auto_52134 ?auto_52138 ) ) ( not ( = ?auto_52134 ?auto_52139 ) ) ( not ( = ?auto_52134 ?auto_52140 ) ) ( not ( = ?auto_52134 ?auto_52141 ) ) ( not ( = ?auto_52134 ?auto_52142 ) ) ( not ( = ?auto_52134 ?auto_52143 ) ) ( not ( = ?auto_52135 ?auto_52136 ) ) ( not ( = ?auto_52135 ?auto_52137 ) ) ( not ( = ?auto_52135 ?auto_52138 ) ) ( not ( = ?auto_52135 ?auto_52139 ) ) ( not ( = ?auto_52135 ?auto_52140 ) ) ( not ( = ?auto_52135 ?auto_52141 ) ) ( not ( = ?auto_52135 ?auto_52142 ) ) ( not ( = ?auto_52135 ?auto_52143 ) ) ( not ( = ?auto_52136 ?auto_52137 ) ) ( not ( = ?auto_52136 ?auto_52138 ) ) ( not ( = ?auto_52136 ?auto_52139 ) ) ( not ( = ?auto_52136 ?auto_52140 ) ) ( not ( = ?auto_52136 ?auto_52141 ) ) ( not ( = ?auto_52136 ?auto_52142 ) ) ( not ( = ?auto_52136 ?auto_52143 ) ) ( not ( = ?auto_52137 ?auto_52138 ) ) ( not ( = ?auto_52137 ?auto_52139 ) ) ( not ( = ?auto_52137 ?auto_52140 ) ) ( not ( = ?auto_52137 ?auto_52141 ) ) ( not ( = ?auto_52137 ?auto_52142 ) ) ( not ( = ?auto_52137 ?auto_52143 ) ) ( not ( = ?auto_52138 ?auto_52139 ) ) ( not ( = ?auto_52138 ?auto_52140 ) ) ( not ( = ?auto_52138 ?auto_52141 ) ) ( not ( = ?auto_52138 ?auto_52142 ) ) ( not ( = ?auto_52138 ?auto_52143 ) ) ( not ( = ?auto_52139 ?auto_52140 ) ) ( not ( = ?auto_52139 ?auto_52141 ) ) ( not ( = ?auto_52139 ?auto_52142 ) ) ( not ( = ?auto_52139 ?auto_52143 ) ) ( not ( = ?auto_52140 ?auto_52141 ) ) ( not ( = ?auto_52140 ?auto_52142 ) ) ( not ( = ?auto_52140 ?auto_52143 ) ) ( not ( = ?auto_52141 ?auto_52142 ) ) ( not ( = ?auto_52141 ?auto_52143 ) ) ( not ( = ?auto_52142 ?auto_52143 ) ) ( CLEAR ?auto_52140 ) ( ON ?auto_52141 ?auto_52142 ) ( CLEAR ?auto_52141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_52134 ?auto_52135 ?auto_52136 ?auto_52137 ?auto_52138 ?auto_52139 ?auto_52140 ?auto_52141 )
      ( MAKE-9PILE ?auto_52134 ?auto_52135 ?auto_52136 ?auto_52137 ?auto_52138 ?auto_52139 ?auto_52140 ?auto_52141 ?auto_52142 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52153 - BLOCK
      ?auto_52154 - BLOCK
      ?auto_52155 - BLOCK
      ?auto_52156 - BLOCK
      ?auto_52157 - BLOCK
      ?auto_52158 - BLOCK
      ?auto_52159 - BLOCK
      ?auto_52160 - BLOCK
      ?auto_52161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52161 ) ( ON-TABLE ?auto_52153 ) ( ON ?auto_52154 ?auto_52153 ) ( ON ?auto_52155 ?auto_52154 ) ( ON ?auto_52156 ?auto_52155 ) ( ON ?auto_52157 ?auto_52156 ) ( ON ?auto_52158 ?auto_52157 ) ( ON ?auto_52159 ?auto_52158 ) ( not ( = ?auto_52153 ?auto_52154 ) ) ( not ( = ?auto_52153 ?auto_52155 ) ) ( not ( = ?auto_52153 ?auto_52156 ) ) ( not ( = ?auto_52153 ?auto_52157 ) ) ( not ( = ?auto_52153 ?auto_52158 ) ) ( not ( = ?auto_52153 ?auto_52159 ) ) ( not ( = ?auto_52153 ?auto_52160 ) ) ( not ( = ?auto_52153 ?auto_52161 ) ) ( not ( = ?auto_52154 ?auto_52155 ) ) ( not ( = ?auto_52154 ?auto_52156 ) ) ( not ( = ?auto_52154 ?auto_52157 ) ) ( not ( = ?auto_52154 ?auto_52158 ) ) ( not ( = ?auto_52154 ?auto_52159 ) ) ( not ( = ?auto_52154 ?auto_52160 ) ) ( not ( = ?auto_52154 ?auto_52161 ) ) ( not ( = ?auto_52155 ?auto_52156 ) ) ( not ( = ?auto_52155 ?auto_52157 ) ) ( not ( = ?auto_52155 ?auto_52158 ) ) ( not ( = ?auto_52155 ?auto_52159 ) ) ( not ( = ?auto_52155 ?auto_52160 ) ) ( not ( = ?auto_52155 ?auto_52161 ) ) ( not ( = ?auto_52156 ?auto_52157 ) ) ( not ( = ?auto_52156 ?auto_52158 ) ) ( not ( = ?auto_52156 ?auto_52159 ) ) ( not ( = ?auto_52156 ?auto_52160 ) ) ( not ( = ?auto_52156 ?auto_52161 ) ) ( not ( = ?auto_52157 ?auto_52158 ) ) ( not ( = ?auto_52157 ?auto_52159 ) ) ( not ( = ?auto_52157 ?auto_52160 ) ) ( not ( = ?auto_52157 ?auto_52161 ) ) ( not ( = ?auto_52158 ?auto_52159 ) ) ( not ( = ?auto_52158 ?auto_52160 ) ) ( not ( = ?auto_52158 ?auto_52161 ) ) ( not ( = ?auto_52159 ?auto_52160 ) ) ( not ( = ?auto_52159 ?auto_52161 ) ) ( not ( = ?auto_52160 ?auto_52161 ) ) ( CLEAR ?auto_52159 ) ( ON ?auto_52160 ?auto_52161 ) ( CLEAR ?auto_52160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_52153 ?auto_52154 ?auto_52155 ?auto_52156 ?auto_52157 ?auto_52158 ?auto_52159 ?auto_52160 )
      ( MAKE-9PILE ?auto_52153 ?auto_52154 ?auto_52155 ?auto_52156 ?auto_52157 ?auto_52158 ?auto_52159 ?auto_52160 ?auto_52161 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52171 - BLOCK
      ?auto_52172 - BLOCK
      ?auto_52173 - BLOCK
      ?auto_52174 - BLOCK
      ?auto_52175 - BLOCK
      ?auto_52176 - BLOCK
      ?auto_52177 - BLOCK
      ?auto_52178 - BLOCK
      ?auto_52179 - BLOCK
    )
    :vars
    (
      ?auto_52180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52179 ?auto_52180 ) ( ON-TABLE ?auto_52171 ) ( ON ?auto_52172 ?auto_52171 ) ( ON ?auto_52173 ?auto_52172 ) ( ON ?auto_52174 ?auto_52173 ) ( ON ?auto_52175 ?auto_52174 ) ( ON ?auto_52176 ?auto_52175 ) ( not ( = ?auto_52171 ?auto_52172 ) ) ( not ( = ?auto_52171 ?auto_52173 ) ) ( not ( = ?auto_52171 ?auto_52174 ) ) ( not ( = ?auto_52171 ?auto_52175 ) ) ( not ( = ?auto_52171 ?auto_52176 ) ) ( not ( = ?auto_52171 ?auto_52177 ) ) ( not ( = ?auto_52171 ?auto_52178 ) ) ( not ( = ?auto_52171 ?auto_52179 ) ) ( not ( = ?auto_52171 ?auto_52180 ) ) ( not ( = ?auto_52172 ?auto_52173 ) ) ( not ( = ?auto_52172 ?auto_52174 ) ) ( not ( = ?auto_52172 ?auto_52175 ) ) ( not ( = ?auto_52172 ?auto_52176 ) ) ( not ( = ?auto_52172 ?auto_52177 ) ) ( not ( = ?auto_52172 ?auto_52178 ) ) ( not ( = ?auto_52172 ?auto_52179 ) ) ( not ( = ?auto_52172 ?auto_52180 ) ) ( not ( = ?auto_52173 ?auto_52174 ) ) ( not ( = ?auto_52173 ?auto_52175 ) ) ( not ( = ?auto_52173 ?auto_52176 ) ) ( not ( = ?auto_52173 ?auto_52177 ) ) ( not ( = ?auto_52173 ?auto_52178 ) ) ( not ( = ?auto_52173 ?auto_52179 ) ) ( not ( = ?auto_52173 ?auto_52180 ) ) ( not ( = ?auto_52174 ?auto_52175 ) ) ( not ( = ?auto_52174 ?auto_52176 ) ) ( not ( = ?auto_52174 ?auto_52177 ) ) ( not ( = ?auto_52174 ?auto_52178 ) ) ( not ( = ?auto_52174 ?auto_52179 ) ) ( not ( = ?auto_52174 ?auto_52180 ) ) ( not ( = ?auto_52175 ?auto_52176 ) ) ( not ( = ?auto_52175 ?auto_52177 ) ) ( not ( = ?auto_52175 ?auto_52178 ) ) ( not ( = ?auto_52175 ?auto_52179 ) ) ( not ( = ?auto_52175 ?auto_52180 ) ) ( not ( = ?auto_52176 ?auto_52177 ) ) ( not ( = ?auto_52176 ?auto_52178 ) ) ( not ( = ?auto_52176 ?auto_52179 ) ) ( not ( = ?auto_52176 ?auto_52180 ) ) ( not ( = ?auto_52177 ?auto_52178 ) ) ( not ( = ?auto_52177 ?auto_52179 ) ) ( not ( = ?auto_52177 ?auto_52180 ) ) ( not ( = ?auto_52178 ?auto_52179 ) ) ( not ( = ?auto_52178 ?auto_52180 ) ) ( not ( = ?auto_52179 ?auto_52180 ) ) ( ON ?auto_52178 ?auto_52179 ) ( CLEAR ?auto_52176 ) ( ON ?auto_52177 ?auto_52178 ) ( CLEAR ?auto_52177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_52171 ?auto_52172 ?auto_52173 ?auto_52174 ?auto_52175 ?auto_52176 ?auto_52177 )
      ( MAKE-9PILE ?auto_52171 ?auto_52172 ?auto_52173 ?auto_52174 ?auto_52175 ?auto_52176 ?auto_52177 ?auto_52178 ?auto_52179 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52190 - BLOCK
      ?auto_52191 - BLOCK
      ?auto_52192 - BLOCK
      ?auto_52193 - BLOCK
      ?auto_52194 - BLOCK
      ?auto_52195 - BLOCK
      ?auto_52196 - BLOCK
      ?auto_52197 - BLOCK
      ?auto_52198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52198 ) ( ON-TABLE ?auto_52190 ) ( ON ?auto_52191 ?auto_52190 ) ( ON ?auto_52192 ?auto_52191 ) ( ON ?auto_52193 ?auto_52192 ) ( ON ?auto_52194 ?auto_52193 ) ( ON ?auto_52195 ?auto_52194 ) ( not ( = ?auto_52190 ?auto_52191 ) ) ( not ( = ?auto_52190 ?auto_52192 ) ) ( not ( = ?auto_52190 ?auto_52193 ) ) ( not ( = ?auto_52190 ?auto_52194 ) ) ( not ( = ?auto_52190 ?auto_52195 ) ) ( not ( = ?auto_52190 ?auto_52196 ) ) ( not ( = ?auto_52190 ?auto_52197 ) ) ( not ( = ?auto_52190 ?auto_52198 ) ) ( not ( = ?auto_52191 ?auto_52192 ) ) ( not ( = ?auto_52191 ?auto_52193 ) ) ( not ( = ?auto_52191 ?auto_52194 ) ) ( not ( = ?auto_52191 ?auto_52195 ) ) ( not ( = ?auto_52191 ?auto_52196 ) ) ( not ( = ?auto_52191 ?auto_52197 ) ) ( not ( = ?auto_52191 ?auto_52198 ) ) ( not ( = ?auto_52192 ?auto_52193 ) ) ( not ( = ?auto_52192 ?auto_52194 ) ) ( not ( = ?auto_52192 ?auto_52195 ) ) ( not ( = ?auto_52192 ?auto_52196 ) ) ( not ( = ?auto_52192 ?auto_52197 ) ) ( not ( = ?auto_52192 ?auto_52198 ) ) ( not ( = ?auto_52193 ?auto_52194 ) ) ( not ( = ?auto_52193 ?auto_52195 ) ) ( not ( = ?auto_52193 ?auto_52196 ) ) ( not ( = ?auto_52193 ?auto_52197 ) ) ( not ( = ?auto_52193 ?auto_52198 ) ) ( not ( = ?auto_52194 ?auto_52195 ) ) ( not ( = ?auto_52194 ?auto_52196 ) ) ( not ( = ?auto_52194 ?auto_52197 ) ) ( not ( = ?auto_52194 ?auto_52198 ) ) ( not ( = ?auto_52195 ?auto_52196 ) ) ( not ( = ?auto_52195 ?auto_52197 ) ) ( not ( = ?auto_52195 ?auto_52198 ) ) ( not ( = ?auto_52196 ?auto_52197 ) ) ( not ( = ?auto_52196 ?auto_52198 ) ) ( not ( = ?auto_52197 ?auto_52198 ) ) ( ON ?auto_52197 ?auto_52198 ) ( CLEAR ?auto_52195 ) ( ON ?auto_52196 ?auto_52197 ) ( CLEAR ?auto_52196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_52190 ?auto_52191 ?auto_52192 ?auto_52193 ?auto_52194 ?auto_52195 ?auto_52196 )
      ( MAKE-9PILE ?auto_52190 ?auto_52191 ?auto_52192 ?auto_52193 ?auto_52194 ?auto_52195 ?auto_52196 ?auto_52197 ?auto_52198 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52208 - BLOCK
      ?auto_52209 - BLOCK
      ?auto_52210 - BLOCK
      ?auto_52211 - BLOCK
      ?auto_52212 - BLOCK
      ?auto_52213 - BLOCK
      ?auto_52214 - BLOCK
      ?auto_52215 - BLOCK
      ?auto_52216 - BLOCK
    )
    :vars
    (
      ?auto_52217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52216 ?auto_52217 ) ( ON-TABLE ?auto_52208 ) ( ON ?auto_52209 ?auto_52208 ) ( ON ?auto_52210 ?auto_52209 ) ( ON ?auto_52211 ?auto_52210 ) ( ON ?auto_52212 ?auto_52211 ) ( not ( = ?auto_52208 ?auto_52209 ) ) ( not ( = ?auto_52208 ?auto_52210 ) ) ( not ( = ?auto_52208 ?auto_52211 ) ) ( not ( = ?auto_52208 ?auto_52212 ) ) ( not ( = ?auto_52208 ?auto_52213 ) ) ( not ( = ?auto_52208 ?auto_52214 ) ) ( not ( = ?auto_52208 ?auto_52215 ) ) ( not ( = ?auto_52208 ?auto_52216 ) ) ( not ( = ?auto_52208 ?auto_52217 ) ) ( not ( = ?auto_52209 ?auto_52210 ) ) ( not ( = ?auto_52209 ?auto_52211 ) ) ( not ( = ?auto_52209 ?auto_52212 ) ) ( not ( = ?auto_52209 ?auto_52213 ) ) ( not ( = ?auto_52209 ?auto_52214 ) ) ( not ( = ?auto_52209 ?auto_52215 ) ) ( not ( = ?auto_52209 ?auto_52216 ) ) ( not ( = ?auto_52209 ?auto_52217 ) ) ( not ( = ?auto_52210 ?auto_52211 ) ) ( not ( = ?auto_52210 ?auto_52212 ) ) ( not ( = ?auto_52210 ?auto_52213 ) ) ( not ( = ?auto_52210 ?auto_52214 ) ) ( not ( = ?auto_52210 ?auto_52215 ) ) ( not ( = ?auto_52210 ?auto_52216 ) ) ( not ( = ?auto_52210 ?auto_52217 ) ) ( not ( = ?auto_52211 ?auto_52212 ) ) ( not ( = ?auto_52211 ?auto_52213 ) ) ( not ( = ?auto_52211 ?auto_52214 ) ) ( not ( = ?auto_52211 ?auto_52215 ) ) ( not ( = ?auto_52211 ?auto_52216 ) ) ( not ( = ?auto_52211 ?auto_52217 ) ) ( not ( = ?auto_52212 ?auto_52213 ) ) ( not ( = ?auto_52212 ?auto_52214 ) ) ( not ( = ?auto_52212 ?auto_52215 ) ) ( not ( = ?auto_52212 ?auto_52216 ) ) ( not ( = ?auto_52212 ?auto_52217 ) ) ( not ( = ?auto_52213 ?auto_52214 ) ) ( not ( = ?auto_52213 ?auto_52215 ) ) ( not ( = ?auto_52213 ?auto_52216 ) ) ( not ( = ?auto_52213 ?auto_52217 ) ) ( not ( = ?auto_52214 ?auto_52215 ) ) ( not ( = ?auto_52214 ?auto_52216 ) ) ( not ( = ?auto_52214 ?auto_52217 ) ) ( not ( = ?auto_52215 ?auto_52216 ) ) ( not ( = ?auto_52215 ?auto_52217 ) ) ( not ( = ?auto_52216 ?auto_52217 ) ) ( ON ?auto_52215 ?auto_52216 ) ( ON ?auto_52214 ?auto_52215 ) ( CLEAR ?auto_52212 ) ( ON ?auto_52213 ?auto_52214 ) ( CLEAR ?auto_52213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52208 ?auto_52209 ?auto_52210 ?auto_52211 ?auto_52212 ?auto_52213 )
      ( MAKE-9PILE ?auto_52208 ?auto_52209 ?auto_52210 ?auto_52211 ?auto_52212 ?auto_52213 ?auto_52214 ?auto_52215 ?auto_52216 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52227 - BLOCK
      ?auto_52228 - BLOCK
      ?auto_52229 - BLOCK
      ?auto_52230 - BLOCK
      ?auto_52231 - BLOCK
      ?auto_52232 - BLOCK
      ?auto_52233 - BLOCK
      ?auto_52234 - BLOCK
      ?auto_52235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52235 ) ( ON-TABLE ?auto_52227 ) ( ON ?auto_52228 ?auto_52227 ) ( ON ?auto_52229 ?auto_52228 ) ( ON ?auto_52230 ?auto_52229 ) ( ON ?auto_52231 ?auto_52230 ) ( not ( = ?auto_52227 ?auto_52228 ) ) ( not ( = ?auto_52227 ?auto_52229 ) ) ( not ( = ?auto_52227 ?auto_52230 ) ) ( not ( = ?auto_52227 ?auto_52231 ) ) ( not ( = ?auto_52227 ?auto_52232 ) ) ( not ( = ?auto_52227 ?auto_52233 ) ) ( not ( = ?auto_52227 ?auto_52234 ) ) ( not ( = ?auto_52227 ?auto_52235 ) ) ( not ( = ?auto_52228 ?auto_52229 ) ) ( not ( = ?auto_52228 ?auto_52230 ) ) ( not ( = ?auto_52228 ?auto_52231 ) ) ( not ( = ?auto_52228 ?auto_52232 ) ) ( not ( = ?auto_52228 ?auto_52233 ) ) ( not ( = ?auto_52228 ?auto_52234 ) ) ( not ( = ?auto_52228 ?auto_52235 ) ) ( not ( = ?auto_52229 ?auto_52230 ) ) ( not ( = ?auto_52229 ?auto_52231 ) ) ( not ( = ?auto_52229 ?auto_52232 ) ) ( not ( = ?auto_52229 ?auto_52233 ) ) ( not ( = ?auto_52229 ?auto_52234 ) ) ( not ( = ?auto_52229 ?auto_52235 ) ) ( not ( = ?auto_52230 ?auto_52231 ) ) ( not ( = ?auto_52230 ?auto_52232 ) ) ( not ( = ?auto_52230 ?auto_52233 ) ) ( not ( = ?auto_52230 ?auto_52234 ) ) ( not ( = ?auto_52230 ?auto_52235 ) ) ( not ( = ?auto_52231 ?auto_52232 ) ) ( not ( = ?auto_52231 ?auto_52233 ) ) ( not ( = ?auto_52231 ?auto_52234 ) ) ( not ( = ?auto_52231 ?auto_52235 ) ) ( not ( = ?auto_52232 ?auto_52233 ) ) ( not ( = ?auto_52232 ?auto_52234 ) ) ( not ( = ?auto_52232 ?auto_52235 ) ) ( not ( = ?auto_52233 ?auto_52234 ) ) ( not ( = ?auto_52233 ?auto_52235 ) ) ( not ( = ?auto_52234 ?auto_52235 ) ) ( ON ?auto_52234 ?auto_52235 ) ( ON ?auto_52233 ?auto_52234 ) ( CLEAR ?auto_52231 ) ( ON ?auto_52232 ?auto_52233 ) ( CLEAR ?auto_52232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52227 ?auto_52228 ?auto_52229 ?auto_52230 ?auto_52231 ?auto_52232 )
      ( MAKE-9PILE ?auto_52227 ?auto_52228 ?auto_52229 ?auto_52230 ?auto_52231 ?auto_52232 ?auto_52233 ?auto_52234 ?auto_52235 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52245 - BLOCK
      ?auto_52246 - BLOCK
      ?auto_52247 - BLOCK
      ?auto_52248 - BLOCK
      ?auto_52249 - BLOCK
      ?auto_52250 - BLOCK
      ?auto_52251 - BLOCK
      ?auto_52252 - BLOCK
      ?auto_52253 - BLOCK
    )
    :vars
    (
      ?auto_52254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52253 ?auto_52254 ) ( ON-TABLE ?auto_52245 ) ( ON ?auto_52246 ?auto_52245 ) ( ON ?auto_52247 ?auto_52246 ) ( ON ?auto_52248 ?auto_52247 ) ( not ( = ?auto_52245 ?auto_52246 ) ) ( not ( = ?auto_52245 ?auto_52247 ) ) ( not ( = ?auto_52245 ?auto_52248 ) ) ( not ( = ?auto_52245 ?auto_52249 ) ) ( not ( = ?auto_52245 ?auto_52250 ) ) ( not ( = ?auto_52245 ?auto_52251 ) ) ( not ( = ?auto_52245 ?auto_52252 ) ) ( not ( = ?auto_52245 ?auto_52253 ) ) ( not ( = ?auto_52245 ?auto_52254 ) ) ( not ( = ?auto_52246 ?auto_52247 ) ) ( not ( = ?auto_52246 ?auto_52248 ) ) ( not ( = ?auto_52246 ?auto_52249 ) ) ( not ( = ?auto_52246 ?auto_52250 ) ) ( not ( = ?auto_52246 ?auto_52251 ) ) ( not ( = ?auto_52246 ?auto_52252 ) ) ( not ( = ?auto_52246 ?auto_52253 ) ) ( not ( = ?auto_52246 ?auto_52254 ) ) ( not ( = ?auto_52247 ?auto_52248 ) ) ( not ( = ?auto_52247 ?auto_52249 ) ) ( not ( = ?auto_52247 ?auto_52250 ) ) ( not ( = ?auto_52247 ?auto_52251 ) ) ( not ( = ?auto_52247 ?auto_52252 ) ) ( not ( = ?auto_52247 ?auto_52253 ) ) ( not ( = ?auto_52247 ?auto_52254 ) ) ( not ( = ?auto_52248 ?auto_52249 ) ) ( not ( = ?auto_52248 ?auto_52250 ) ) ( not ( = ?auto_52248 ?auto_52251 ) ) ( not ( = ?auto_52248 ?auto_52252 ) ) ( not ( = ?auto_52248 ?auto_52253 ) ) ( not ( = ?auto_52248 ?auto_52254 ) ) ( not ( = ?auto_52249 ?auto_52250 ) ) ( not ( = ?auto_52249 ?auto_52251 ) ) ( not ( = ?auto_52249 ?auto_52252 ) ) ( not ( = ?auto_52249 ?auto_52253 ) ) ( not ( = ?auto_52249 ?auto_52254 ) ) ( not ( = ?auto_52250 ?auto_52251 ) ) ( not ( = ?auto_52250 ?auto_52252 ) ) ( not ( = ?auto_52250 ?auto_52253 ) ) ( not ( = ?auto_52250 ?auto_52254 ) ) ( not ( = ?auto_52251 ?auto_52252 ) ) ( not ( = ?auto_52251 ?auto_52253 ) ) ( not ( = ?auto_52251 ?auto_52254 ) ) ( not ( = ?auto_52252 ?auto_52253 ) ) ( not ( = ?auto_52252 ?auto_52254 ) ) ( not ( = ?auto_52253 ?auto_52254 ) ) ( ON ?auto_52252 ?auto_52253 ) ( ON ?auto_52251 ?auto_52252 ) ( ON ?auto_52250 ?auto_52251 ) ( CLEAR ?auto_52248 ) ( ON ?auto_52249 ?auto_52250 ) ( CLEAR ?auto_52249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52245 ?auto_52246 ?auto_52247 ?auto_52248 ?auto_52249 )
      ( MAKE-9PILE ?auto_52245 ?auto_52246 ?auto_52247 ?auto_52248 ?auto_52249 ?auto_52250 ?auto_52251 ?auto_52252 ?auto_52253 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52264 - BLOCK
      ?auto_52265 - BLOCK
      ?auto_52266 - BLOCK
      ?auto_52267 - BLOCK
      ?auto_52268 - BLOCK
      ?auto_52269 - BLOCK
      ?auto_52270 - BLOCK
      ?auto_52271 - BLOCK
      ?auto_52272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52272 ) ( ON-TABLE ?auto_52264 ) ( ON ?auto_52265 ?auto_52264 ) ( ON ?auto_52266 ?auto_52265 ) ( ON ?auto_52267 ?auto_52266 ) ( not ( = ?auto_52264 ?auto_52265 ) ) ( not ( = ?auto_52264 ?auto_52266 ) ) ( not ( = ?auto_52264 ?auto_52267 ) ) ( not ( = ?auto_52264 ?auto_52268 ) ) ( not ( = ?auto_52264 ?auto_52269 ) ) ( not ( = ?auto_52264 ?auto_52270 ) ) ( not ( = ?auto_52264 ?auto_52271 ) ) ( not ( = ?auto_52264 ?auto_52272 ) ) ( not ( = ?auto_52265 ?auto_52266 ) ) ( not ( = ?auto_52265 ?auto_52267 ) ) ( not ( = ?auto_52265 ?auto_52268 ) ) ( not ( = ?auto_52265 ?auto_52269 ) ) ( not ( = ?auto_52265 ?auto_52270 ) ) ( not ( = ?auto_52265 ?auto_52271 ) ) ( not ( = ?auto_52265 ?auto_52272 ) ) ( not ( = ?auto_52266 ?auto_52267 ) ) ( not ( = ?auto_52266 ?auto_52268 ) ) ( not ( = ?auto_52266 ?auto_52269 ) ) ( not ( = ?auto_52266 ?auto_52270 ) ) ( not ( = ?auto_52266 ?auto_52271 ) ) ( not ( = ?auto_52266 ?auto_52272 ) ) ( not ( = ?auto_52267 ?auto_52268 ) ) ( not ( = ?auto_52267 ?auto_52269 ) ) ( not ( = ?auto_52267 ?auto_52270 ) ) ( not ( = ?auto_52267 ?auto_52271 ) ) ( not ( = ?auto_52267 ?auto_52272 ) ) ( not ( = ?auto_52268 ?auto_52269 ) ) ( not ( = ?auto_52268 ?auto_52270 ) ) ( not ( = ?auto_52268 ?auto_52271 ) ) ( not ( = ?auto_52268 ?auto_52272 ) ) ( not ( = ?auto_52269 ?auto_52270 ) ) ( not ( = ?auto_52269 ?auto_52271 ) ) ( not ( = ?auto_52269 ?auto_52272 ) ) ( not ( = ?auto_52270 ?auto_52271 ) ) ( not ( = ?auto_52270 ?auto_52272 ) ) ( not ( = ?auto_52271 ?auto_52272 ) ) ( ON ?auto_52271 ?auto_52272 ) ( ON ?auto_52270 ?auto_52271 ) ( ON ?auto_52269 ?auto_52270 ) ( CLEAR ?auto_52267 ) ( ON ?auto_52268 ?auto_52269 ) ( CLEAR ?auto_52268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52264 ?auto_52265 ?auto_52266 ?auto_52267 ?auto_52268 )
      ( MAKE-9PILE ?auto_52264 ?auto_52265 ?auto_52266 ?auto_52267 ?auto_52268 ?auto_52269 ?auto_52270 ?auto_52271 ?auto_52272 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52282 - BLOCK
      ?auto_52283 - BLOCK
      ?auto_52284 - BLOCK
      ?auto_52285 - BLOCK
      ?auto_52286 - BLOCK
      ?auto_52287 - BLOCK
      ?auto_52288 - BLOCK
      ?auto_52289 - BLOCK
      ?auto_52290 - BLOCK
    )
    :vars
    (
      ?auto_52291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52290 ?auto_52291 ) ( ON-TABLE ?auto_52282 ) ( ON ?auto_52283 ?auto_52282 ) ( ON ?auto_52284 ?auto_52283 ) ( not ( = ?auto_52282 ?auto_52283 ) ) ( not ( = ?auto_52282 ?auto_52284 ) ) ( not ( = ?auto_52282 ?auto_52285 ) ) ( not ( = ?auto_52282 ?auto_52286 ) ) ( not ( = ?auto_52282 ?auto_52287 ) ) ( not ( = ?auto_52282 ?auto_52288 ) ) ( not ( = ?auto_52282 ?auto_52289 ) ) ( not ( = ?auto_52282 ?auto_52290 ) ) ( not ( = ?auto_52282 ?auto_52291 ) ) ( not ( = ?auto_52283 ?auto_52284 ) ) ( not ( = ?auto_52283 ?auto_52285 ) ) ( not ( = ?auto_52283 ?auto_52286 ) ) ( not ( = ?auto_52283 ?auto_52287 ) ) ( not ( = ?auto_52283 ?auto_52288 ) ) ( not ( = ?auto_52283 ?auto_52289 ) ) ( not ( = ?auto_52283 ?auto_52290 ) ) ( not ( = ?auto_52283 ?auto_52291 ) ) ( not ( = ?auto_52284 ?auto_52285 ) ) ( not ( = ?auto_52284 ?auto_52286 ) ) ( not ( = ?auto_52284 ?auto_52287 ) ) ( not ( = ?auto_52284 ?auto_52288 ) ) ( not ( = ?auto_52284 ?auto_52289 ) ) ( not ( = ?auto_52284 ?auto_52290 ) ) ( not ( = ?auto_52284 ?auto_52291 ) ) ( not ( = ?auto_52285 ?auto_52286 ) ) ( not ( = ?auto_52285 ?auto_52287 ) ) ( not ( = ?auto_52285 ?auto_52288 ) ) ( not ( = ?auto_52285 ?auto_52289 ) ) ( not ( = ?auto_52285 ?auto_52290 ) ) ( not ( = ?auto_52285 ?auto_52291 ) ) ( not ( = ?auto_52286 ?auto_52287 ) ) ( not ( = ?auto_52286 ?auto_52288 ) ) ( not ( = ?auto_52286 ?auto_52289 ) ) ( not ( = ?auto_52286 ?auto_52290 ) ) ( not ( = ?auto_52286 ?auto_52291 ) ) ( not ( = ?auto_52287 ?auto_52288 ) ) ( not ( = ?auto_52287 ?auto_52289 ) ) ( not ( = ?auto_52287 ?auto_52290 ) ) ( not ( = ?auto_52287 ?auto_52291 ) ) ( not ( = ?auto_52288 ?auto_52289 ) ) ( not ( = ?auto_52288 ?auto_52290 ) ) ( not ( = ?auto_52288 ?auto_52291 ) ) ( not ( = ?auto_52289 ?auto_52290 ) ) ( not ( = ?auto_52289 ?auto_52291 ) ) ( not ( = ?auto_52290 ?auto_52291 ) ) ( ON ?auto_52289 ?auto_52290 ) ( ON ?auto_52288 ?auto_52289 ) ( ON ?auto_52287 ?auto_52288 ) ( ON ?auto_52286 ?auto_52287 ) ( CLEAR ?auto_52284 ) ( ON ?auto_52285 ?auto_52286 ) ( CLEAR ?auto_52285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52282 ?auto_52283 ?auto_52284 ?auto_52285 )
      ( MAKE-9PILE ?auto_52282 ?auto_52283 ?auto_52284 ?auto_52285 ?auto_52286 ?auto_52287 ?auto_52288 ?auto_52289 ?auto_52290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52301 - BLOCK
      ?auto_52302 - BLOCK
      ?auto_52303 - BLOCK
      ?auto_52304 - BLOCK
      ?auto_52305 - BLOCK
      ?auto_52306 - BLOCK
      ?auto_52307 - BLOCK
      ?auto_52308 - BLOCK
      ?auto_52309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52309 ) ( ON-TABLE ?auto_52301 ) ( ON ?auto_52302 ?auto_52301 ) ( ON ?auto_52303 ?auto_52302 ) ( not ( = ?auto_52301 ?auto_52302 ) ) ( not ( = ?auto_52301 ?auto_52303 ) ) ( not ( = ?auto_52301 ?auto_52304 ) ) ( not ( = ?auto_52301 ?auto_52305 ) ) ( not ( = ?auto_52301 ?auto_52306 ) ) ( not ( = ?auto_52301 ?auto_52307 ) ) ( not ( = ?auto_52301 ?auto_52308 ) ) ( not ( = ?auto_52301 ?auto_52309 ) ) ( not ( = ?auto_52302 ?auto_52303 ) ) ( not ( = ?auto_52302 ?auto_52304 ) ) ( not ( = ?auto_52302 ?auto_52305 ) ) ( not ( = ?auto_52302 ?auto_52306 ) ) ( not ( = ?auto_52302 ?auto_52307 ) ) ( not ( = ?auto_52302 ?auto_52308 ) ) ( not ( = ?auto_52302 ?auto_52309 ) ) ( not ( = ?auto_52303 ?auto_52304 ) ) ( not ( = ?auto_52303 ?auto_52305 ) ) ( not ( = ?auto_52303 ?auto_52306 ) ) ( not ( = ?auto_52303 ?auto_52307 ) ) ( not ( = ?auto_52303 ?auto_52308 ) ) ( not ( = ?auto_52303 ?auto_52309 ) ) ( not ( = ?auto_52304 ?auto_52305 ) ) ( not ( = ?auto_52304 ?auto_52306 ) ) ( not ( = ?auto_52304 ?auto_52307 ) ) ( not ( = ?auto_52304 ?auto_52308 ) ) ( not ( = ?auto_52304 ?auto_52309 ) ) ( not ( = ?auto_52305 ?auto_52306 ) ) ( not ( = ?auto_52305 ?auto_52307 ) ) ( not ( = ?auto_52305 ?auto_52308 ) ) ( not ( = ?auto_52305 ?auto_52309 ) ) ( not ( = ?auto_52306 ?auto_52307 ) ) ( not ( = ?auto_52306 ?auto_52308 ) ) ( not ( = ?auto_52306 ?auto_52309 ) ) ( not ( = ?auto_52307 ?auto_52308 ) ) ( not ( = ?auto_52307 ?auto_52309 ) ) ( not ( = ?auto_52308 ?auto_52309 ) ) ( ON ?auto_52308 ?auto_52309 ) ( ON ?auto_52307 ?auto_52308 ) ( ON ?auto_52306 ?auto_52307 ) ( ON ?auto_52305 ?auto_52306 ) ( CLEAR ?auto_52303 ) ( ON ?auto_52304 ?auto_52305 ) ( CLEAR ?auto_52304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52301 ?auto_52302 ?auto_52303 ?auto_52304 )
      ( MAKE-9PILE ?auto_52301 ?auto_52302 ?auto_52303 ?auto_52304 ?auto_52305 ?auto_52306 ?auto_52307 ?auto_52308 ?auto_52309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52319 - BLOCK
      ?auto_52320 - BLOCK
      ?auto_52321 - BLOCK
      ?auto_52322 - BLOCK
      ?auto_52323 - BLOCK
      ?auto_52324 - BLOCK
      ?auto_52325 - BLOCK
      ?auto_52326 - BLOCK
      ?auto_52327 - BLOCK
    )
    :vars
    (
      ?auto_52328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52327 ?auto_52328 ) ( ON-TABLE ?auto_52319 ) ( ON ?auto_52320 ?auto_52319 ) ( not ( = ?auto_52319 ?auto_52320 ) ) ( not ( = ?auto_52319 ?auto_52321 ) ) ( not ( = ?auto_52319 ?auto_52322 ) ) ( not ( = ?auto_52319 ?auto_52323 ) ) ( not ( = ?auto_52319 ?auto_52324 ) ) ( not ( = ?auto_52319 ?auto_52325 ) ) ( not ( = ?auto_52319 ?auto_52326 ) ) ( not ( = ?auto_52319 ?auto_52327 ) ) ( not ( = ?auto_52319 ?auto_52328 ) ) ( not ( = ?auto_52320 ?auto_52321 ) ) ( not ( = ?auto_52320 ?auto_52322 ) ) ( not ( = ?auto_52320 ?auto_52323 ) ) ( not ( = ?auto_52320 ?auto_52324 ) ) ( not ( = ?auto_52320 ?auto_52325 ) ) ( not ( = ?auto_52320 ?auto_52326 ) ) ( not ( = ?auto_52320 ?auto_52327 ) ) ( not ( = ?auto_52320 ?auto_52328 ) ) ( not ( = ?auto_52321 ?auto_52322 ) ) ( not ( = ?auto_52321 ?auto_52323 ) ) ( not ( = ?auto_52321 ?auto_52324 ) ) ( not ( = ?auto_52321 ?auto_52325 ) ) ( not ( = ?auto_52321 ?auto_52326 ) ) ( not ( = ?auto_52321 ?auto_52327 ) ) ( not ( = ?auto_52321 ?auto_52328 ) ) ( not ( = ?auto_52322 ?auto_52323 ) ) ( not ( = ?auto_52322 ?auto_52324 ) ) ( not ( = ?auto_52322 ?auto_52325 ) ) ( not ( = ?auto_52322 ?auto_52326 ) ) ( not ( = ?auto_52322 ?auto_52327 ) ) ( not ( = ?auto_52322 ?auto_52328 ) ) ( not ( = ?auto_52323 ?auto_52324 ) ) ( not ( = ?auto_52323 ?auto_52325 ) ) ( not ( = ?auto_52323 ?auto_52326 ) ) ( not ( = ?auto_52323 ?auto_52327 ) ) ( not ( = ?auto_52323 ?auto_52328 ) ) ( not ( = ?auto_52324 ?auto_52325 ) ) ( not ( = ?auto_52324 ?auto_52326 ) ) ( not ( = ?auto_52324 ?auto_52327 ) ) ( not ( = ?auto_52324 ?auto_52328 ) ) ( not ( = ?auto_52325 ?auto_52326 ) ) ( not ( = ?auto_52325 ?auto_52327 ) ) ( not ( = ?auto_52325 ?auto_52328 ) ) ( not ( = ?auto_52326 ?auto_52327 ) ) ( not ( = ?auto_52326 ?auto_52328 ) ) ( not ( = ?auto_52327 ?auto_52328 ) ) ( ON ?auto_52326 ?auto_52327 ) ( ON ?auto_52325 ?auto_52326 ) ( ON ?auto_52324 ?auto_52325 ) ( ON ?auto_52323 ?auto_52324 ) ( ON ?auto_52322 ?auto_52323 ) ( CLEAR ?auto_52320 ) ( ON ?auto_52321 ?auto_52322 ) ( CLEAR ?auto_52321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52319 ?auto_52320 ?auto_52321 )
      ( MAKE-9PILE ?auto_52319 ?auto_52320 ?auto_52321 ?auto_52322 ?auto_52323 ?auto_52324 ?auto_52325 ?auto_52326 ?auto_52327 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52338 - BLOCK
      ?auto_52339 - BLOCK
      ?auto_52340 - BLOCK
      ?auto_52341 - BLOCK
      ?auto_52342 - BLOCK
      ?auto_52343 - BLOCK
      ?auto_52344 - BLOCK
      ?auto_52345 - BLOCK
      ?auto_52346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52346 ) ( ON-TABLE ?auto_52338 ) ( ON ?auto_52339 ?auto_52338 ) ( not ( = ?auto_52338 ?auto_52339 ) ) ( not ( = ?auto_52338 ?auto_52340 ) ) ( not ( = ?auto_52338 ?auto_52341 ) ) ( not ( = ?auto_52338 ?auto_52342 ) ) ( not ( = ?auto_52338 ?auto_52343 ) ) ( not ( = ?auto_52338 ?auto_52344 ) ) ( not ( = ?auto_52338 ?auto_52345 ) ) ( not ( = ?auto_52338 ?auto_52346 ) ) ( not ( = ?auto_52339 ?auto_52340 ) ) ( not ( = ?auto_52339 ?auto_52341 ) ) ( not ( = ?auto_52339 ?auto_52342 ) ) ( not ( = ?auto_52339 ?auto_52343 ) ) ( not ( = ?auto_52339 ?auto_52344 ) ) ( not ( = ?auto_52339 ?auto_52345 ) ) ( not ( = ?auto_52339 ?auto_52346 ) ) ( not ( = ?auto_52340 ?auto_52341 ) ) ( not ( = ?auto_52340 ?auto_52342 ) ) ( not ( = ?auto_52340 ?auto_52343 ) ) ( not ( = ?auto_52340 ?auto_52344 ) ) ( not ( = ?auto_52340 ?auto_52345 ) ) ( not ( = ?auto_52340 ?auto_52346 ) ) ( not ( = ?auto_52341 ?auto_52342 ) ) ( not ( = ?auto_52341 ?auto_52343 ) ) ( not ( = ?auto_52341 ?auto_52344 ) ) ( not ( = ?auto_52341 ?auto_52345 ) ) ( not ( = ?auto_52341 ?auto_52346 ) ) ( not ( = ?auto_52342 ?auto_52343 ) ) ( not ( = ?auto_52342 ?auto_52344 ) ) ( not ( = ?auto_52342 ?auto_52345 ) ) ( not ( = ?auto_52342 ?auto_52346 ) ) ( not ( = ?auto_52343 ?auto_52344 ) ) ( not ( = ?auto_52343 ?auto_52345 ) ) ( not ( = ?auto_52343 ?auto_52346 ) ) ( not ( = ?auto_52344 ?auto_52345 ) ) ( not ( = ?auto_52344 ?auto_52346 ) ) ( not ( = ?auto_52345 ?auto_52346 ) ) ( ON ?auto_52345 ?auto_52346 ) ( ON ?auto_52344 ?auto_52345 ) ( ON ?auto_52343 ?auto_52344 ) ( ON ?auto_52342 ?auto_52343 ) ( ON ?auto_52341 ?auto_52342 ) ( CLEAR ?auto_52339 ) ( ON ?auto_52340 ?auto_52341 ) ( CLEAR ?auto_52340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52338 ?auto_52339 ?auto_52340 )
      ( MAKE-9PILE ?auto_52338 ?auto_52339 ?auto_52340 ?auto_52341 ?auto_52342 ?auto_52343 ?auto_52344 ?auto_52345 ?auto_52346 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52356 - BLOCK
      ?auto_52357 - BLOCK
      ?auto_52358 - BLOCK
      ?auto_52359 - BLOCK
      ?auto_52360 - BLOCK
      ?auto_52361 - BLOCK
      ?auto_52362 - BLOCK
      ?auto_52363 - BLOCK
      ?auto_52364 - BLOCK
    )
    :vars
    (
      ?auto_52365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52364 ?auto_52365 ) ( ON-TABLE ?auto_52356 ) ( not ( = ?auto_52356 ?auto_52357 ) ) ( not ( = ?auto_52356 ?auto_52358 ) ) ( not ( = ?auto_52356 ?auto_52359 ) ) ( not ( = ?auto_52356 ?auto_52360 ) ) ( not ( = ?auto_52356 ?auto_52361 ) ) ( not ( = ?auto_52356 ?auto_52362 ) ) ( not ( = ?auto_52356 ?auto_52363 ) ) ( not ( = ?auto_52356 ?auto_52364 ) ) ( not ( = ?auto_52356 ?auto_52365 ) ) ( not ( = ?auto_52357 ?auto_52358 ) ) ( not ( = ?auto_52357 ?auto_52359 ) ) ( not ( = ?auto_52357 ?auto_52360 ) ) ( not ( = ?auto_52357 ?auto_52361 ) ) ( not ( = ?auto_52357 ?auto_52362 ) ) ( not ( = ?auto_52357 ?auto_52363 ) ) ( not ( = ?auto_52357 ?auto_52364 ) ) ( not ( = ?auto_52357 ?auto_52365 ) ) ( not ( = ?auto_52358 ?auto_52359 ) ) ( not ( = ?auto_52358 ?auto_52360 ) ) ( not ( = ?auto_52358 ?auto_52361 ) ) ( not ( = ?auto_52358 ?auto_52362 ) ) ( not ( = ?auto_52358 ?auto_52363 ) ) ( not ( = ?auto_52358 ?auto_52364 ) ) ( not ( = ?auto_52358 ?auto_52365 ) ) ( not ( = ?auto_52359 ?auto_52360 ) ) ( not ( = ?auto_52359 ?auto_52361 ) ) ( not ( = ?auto_52359 ?auto_52362 ) ) ( not ( = ?auto_52359 ?auto_52363 ) ) ( not ( = ?auto_52359 ?auto_52364 ) ) ( not ( = ?auto_52359 ?auto_52365 ) ) ( not ( = ?auto_52360 ?auto_52361 ) ) ( not ( = ?auto_52360 ?auto_52362 ) ) ( not ( = ?auto_52360 ?auto_52363 ) ) ( not ( = ?auto_52360 ?auto_52364 ) ) ( not ( = ?auto_52360 ?auto_52365 ) ) ( not ( = ?auto_52361 ?auto_52362 ) ) ( not ( = ?auto_52361 ?auto_52363 ) ) ( not ( = ?auto_52361 ?auto_52364 ) ) ( not ( = ?auto_52361 ?auto_52365 ) ) ( not ( = ?auto_52362 ?auto_52363 ) ) ( not ( = ?auto_52362 ?auto_52364 ) ) ( not ( = ?auto_52362 ?auto_52365 ) ) ( not ( = ?auto_52363 ?auto_52364 ) ) ( not ( = ?auto_52363 ?auto_52365 ) ) ( not ( = ?auto_52364 ?auto_52365 ) ) ( ON ?auto_52363 ?auto_52364 ) ( ON ?auto_52362 ?auto_52363 ) ( ON ?auto_52361 ?auto_52362 ) ( ON ?auto_52360 ?auto_52361 ) ( ON ?auto_52359 ?auto_52360 ) ( ON ?auto_52358 ?auto_52359 ) ( CLEAR ?auto_52356 ) ( ON ?auto_52357 ?auto_52358 ) ( CLEAR ?auto_52357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52356 ?auto_52357 )
      ( MAKE-9PILE ?auto_52356 ?auto_52357 ?auto_52358 ?auto_52359 ?auto_52360 ?auto_52361 ?auto_52362 ?auto_52363 ?auto_52364 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52375 - BLOCK
      ?auto_52376 - BLOCK
      ?auto_52377 - BLOCK
      ?auto_52378 - BLOCK
      ?auto_52379 - BLOCK
      ?auto_52380 - BLOCK
      ?auto_52381 - BLOCK
      ?auto_52382 - BLOCK
      ?auto_52383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52383 ) ( ON-TABLE ?auto_52375 ) ( not ( = ?auto_52375 ?auto_52376 ) ) ( not ( = ?auto_52375 ?auto_52377 ) ) ( not ( = ?auto_52375 ?auto_52378 ) ) ( not ( = ?auto_52375 ?auto_52379 ) ) ( not ( = ?auto_52375 ?auto_52380 ) ) ( not ( = ?auto_52375 ?auto_52381 ) ) ( not ( = ?auto_52375 ?auto_52382 ) ) ( not ( = ?auto_52375 ?auto_52383 ) ) ( not ( = ?auto_52376 ?auto_52377 ) ) ( not ( = ?auto_52376 ?auto_52378 ) ) ( not ( = ?auto_52376 ?auto_52379 ) ) ( not ( = ?auto_52376 ?auto_52380 ) ) ( not ( = ?auto_52376 ?auto_52381 ) ) ( not ( = ?auto_52376 ?auto_52382 ) ) ( not ( = ?auto_52376 ?auto_52383 ) ) ( not ( = ?auto_52377 ?auto_52378 ) ) ( not ( = ?auto_52377 ?auto_52379 ) ) ( not ( = ?auto_52377 ?auto_52380 ) ) ( not ( = ?auto_52377 ?auto_52381 ) ) ( not ( = ?auto_52377 ?auto_52382 ) ) ( not ( = ?auto_52377 ?auto_52383 ) ) ( not ( = ?auto_52378 ?auto_52379 ) ) ( not ( = ?auto_52378 ?auto_52380 ) ) ( not ( = ?auto_52378 ?auto_52381 ) ) ( not ( = ?auto_52378 ?auto_52382 ) ) ( not ( = ?auto_52378 ?auto_52383 ) ) ( not ( = ?auto_52379 ?auto_52380 ) ) ( not ( = ?auto_52379 ?auto_52381 ) ) ( not ( = ?auto_52379 ?auto_52382 ) ) ( not ( = ?auto_52379 ?auto_52383 ) ) ( not ( = ?auto_52380 ?auto_52381 ) ) ( not ( = ?auto_52380 ?auto_52382 ) ) ( not ( = ?auto_52380 ?auto_52383 ) ) ( not ( = ?auto_52381 ?auto_52382 ) ) ( not ( = ?auto_52381 ?auto_52383 ) ) ( not ( = ?auto_52382 ?auto_52383 ) ) ( ON ?auto_52382 ?auto_52383 ) ( ON ?auto_52381 ?auto_52382 ) ( ON ?auto_52380 ?auto_52381 ) ( ON ?auto_52379 ?auto_52380 ) ( ON ?auto_52378 ?auto_52379 ) ( ON ?auto_52377 ?auto_52378 ) ( CLEAR ?auto_52375 ) ( ON ?auto_52376 ?auto_52377 ) ( CLEAR ?auto_52376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52375 ?auto_52376 )
      ( MAKE-9PILE ?auto_52375 ?auto_52376 ?auto_52377 ?auto_52378 ?auto_52379 ?auto_52380 ?auto_52381 ?auto_52382 ?auto_52383 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52393 - BLOCK
      ?auto_52394 - BLOCK
      ?auto_52395 - BLOCK
      ?auto_52396 - BLOCK
      ?auto_52397 - BLOCK
      ?auto_52398 - BLOCK
      ?auto_52399 - BLOCK
      ?auto_52400 - BLOCK
      ?auto_52401 - BLOCK
    )
    :vars
    (
      ?auto_52402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52401 ?auto_52402 ) ( not ( = ?auto_52393 ?auto_52394 ) ) ( not ( = ?auto_52393 ?auto_52395 ) ) ( not ( = ?auto_52393 ?auto_52396 ) ) ( not ( = ?auto_52393 ?auto_52397 ) ) ( not ( = ?auto_52393 ?auto_52398 ) ) ( not ( = ?auto_52393 ?auto_52399 ) ) ( not ( = ?auto_52393 ?auto_52400 ) ) ( not ( = ?auto_52393 ?auto_52401 ) ) ( not ( = ?auto_52393 ?auto_52402 ) ) ( not ( = ?auto_52394 ?auto_52395 ) ) ( not ( = ?auto_52394 ?auto_52396 ) ) ( not ( = ?auto_52394 ?auto_52397 ) ) ( not ( = ?auto_52394 ?auto_52398 ) ) ( not ( = ?auto_52394 ?auto_52399 ) ) ( not ( = ?auto_52394 ?auto_52400 ) ) ( not ( = ?auto_52394 ?auto_52401 ) ) ( not ( = ?auto_52394 ?auto_52402 ) ) ( not ( = ?auto_52395 ?auto_52396 ) ) ( not ( = ?auto_52395 ?auto_52397 ) ) ( not ( = ?auto_52395 ?auto_52398 ) ) ( not ( = ?auto_52395 ?auto_52399 ) ) ( not ( = ?auto_52395 ?auto_52400 ) ) ( not ( = ?auto_52395 ?auto_52401 ) ) ( not ( = ?auto_52395 ?auto_52402 ) ) ( not ( = ?auto_52396 ?auto_52397 ) ) ( not ( = ?auto_52396 ?auto_52398 ) ) ( not ( = ?auto_52396 ?auto_52399 ) ) ( not ( = ?auto_52396 ?auto_52400 ) ) ( not ( = ?auto_52396 ?auto_52401 ) ) ( not ( = ?auto_52396 ?auto_52402 ) ) ( not ( = ?auto_52397 ?auto_52398 ) ) ( not ( = ?auto_52397 ?auto_52399 ) ) ( not ( = ?auto_52397 ?auto_52400 ) ) ( not ( = ?auto_52397 ?auto_52401 ) ) ( not ( = ?auto_52397 ?auto_52402 ) ) ( not ( = ?auto_52398 ?auto_52399 ) ) ( not ( = ?auto_52398 ?auto_52400 ) ) ( not ( = ?auto_52398 ?auto_52401 ) ) ( not ( = ?auto_52398 ?auto_52402 ) ) ( not ( = ?auto_52399 ?auto_52400 ) ) ( not ( = ?auto_52399 ?auto_52401 ) ) ( not ( = ?auto_52399 ?auto_52402 ) ) ( not ( = ?auto_52400 ?auto_52401 ) ) ( not ( = ?auto_52400 ?auto_52402 ) ) ( not ( = ?auto_52401 ?auto_52402 ) ) ( ON ?auto_52400 ?auto_52401 ) ( ON ?auto_52399 ?auto_52400 ) ( ON ?auto_52398 ?auto_52399 ) ( ON ?auto_52397 ?auto_52398 ) ( ON ?auto_52396 ?auto_52397 ) ( ON ?auto_52395 ?auto_52396 ) ( ON ?auto_52394 ?auto_52395 ) ( ON ?auto_52393 ?auto_52394 ) ( CLEAR ?auto_52393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52393 )
      ( MAKE-9PILE ?auto_52393 ?auto_52394 ?auto_52395 ?auto_52396 ?auto_52397 ?auto_52398 ?auto_52399 ?auto_52400 ?auto_52401 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52412 - BLOCK
      ?auto_52413 - BLOCK
      ?auto_52414 - BLOCK
      ?auto_52415 - BLOCK
      ?auto_52416 - BLOCK
      ?auto_52417 - BLOCK
      ?auto_52418 - BLOCK
      ?auto_52419 - BLOCK
      ?auto_52420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52420 ) ( not ( = ?auto_52412 ?auto_52413 ) ) ( not ( = ?auto_52412 ?auto_52414 ) ) ( not ( = ?auto_52412 ?auto_52415 ) ) ( not ( = ?auto_52412 ?auto_52416 ) ) ( not ( = ?auto_52412 ?auto_52417 ) ) ( not ( = ?auto_52412 ?auto_52418 ) ) ( not ( = ?auto_52412 ?auto_52419 ) ) ( not ( = ?auto_52412 ?auto_52420 ) ) ( not ( = ?auto_52413 ?auto_52414 ) ) ( not ( = ?auto_52413 ?auto_52415 ) ) ( not ( = ?auto_52413 ?auto_52416 ) ) ( not ( = ?auto_52413 ?auto_52417 ) ) ( not ( = ?auto_52413 ?auto_52418 ) ) ( not ( = ?auto_52413 ?auto_52419 ) ) ( not ( = ?auto_52413 ?auto_52420 ) ) ( not ( = ?auto_52414 ?auto_52415 ) ) ( not ( = ?auto_52414 ?auto_52416 ) ) ( not ( = ?auto_52414 ?auto_52417 ) ) ( not ( = ?auto_52414 ?auto_52418 ) ) ( not ( = ?auto_52414 ?auto_52419 ) ) ( not ( = ?auto_52414 ?auto_52420 ) ) ( not ( = ?auto_52415 ?auto_52416 ) ) ( not ( = ?auto_52415 ?auto_52417 ) ) ( not ( = ?auto_52415 ?auto_52418 ) ) ( not ( = ?auto_52415 ?auto_52419 ) ) ( not ( = ?auto_52415 ?auto_52420 ) ) ( not ( = ?auto_52416 ?auto_52417 ) ) ( not ( = ?auto_52416 ?auto_52418 ) ) ( not ( = ?auto_52416 ?auto_52419 ) ) ( not ( = ?auto_52416 ?auto_52420 ) ) ( not ( = ?auto_52417 ?auto_52418 ) ) ( not ( = ?auto_52417 ?auto_52419 ) ) ( not ( = ?auto_52417 ?auto_52420 ) ) ( not ( = ?auto_52418 ?auto_52419 ) ) ( not ( = ?auto_52418 ?auto_52420 ) ) ( not ( = ?auto_52419 ?auto_52420 ) ) ( ON ?auto_52419 ?auto_52420 ) ( ON ?auto_52418 ?auto_52419 ) ( ON ?auto_52417 ?auto_52418 ) ( ON ?auto_52416 ?auto_52417 ) ( ON ?auto_52415 ?auto_52416 ) ( ON ?auto_52414 ?auto_52415 ) ( ON ?auto_52413 ?auto_52414 ) ( ON ?auto_52412 ?auto_52413 ) ( CLEAR ?auto_52412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52412 )
      ( MAKE-9PILE ?auto_52412 ?auto_52413 ?auto_52414 ?auto_52415 ?auto_52416 ?auto_52417 ?auto_52418 ?auto_52419 ?auto_52420 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_52430 - BLOCK
      ?auto_52431 - BLOCK
      ?auto_52432 - BLOCK
      ?auto_52433 - BLOCK
      ?auto_52434 - BLOCK
      ?auto_52435 - BLOCK
      ?auto_52436 - BLOCK
      ?auto_52437 - BLOCK
      ?auto_52438 - BLOCK
    )
    :vars
    (
      ?auto_52439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52430 ?auto_52431 ) ) ( not ( = ?auto_52430 ?auto_52432 ) ) ( not ( = ?auto_52430 ?auto_52433 ) ) ( not ( = ?auto_52430 ?auto_52434 ) ) ( not ( = ?auto_52430 ?auto_52435 ) ) ( not ( = ?auto_52430 ?auto_52436 ) ) ( not ( = ?auto_52430 ?auto_52437 ) ) ( not ( = ?auto_52430 ?auto_52438 ) ) ( not ( = ?auto_52431 ?auto_52432 ) ) ( not ( = ?auto_52431 ?auto_52433 ) ) ( not ( = ?auto_52431 ?auto_52434 ) ) ( not ( = ?auto_52431 ?auto_52435 ) ) ( not ( = ?auto_52431 ?auto_52436 ) ) ( not ( = ?auto_52431 ?auto_52437 ) ) ( not ( = ?auto_52431 ?auto_52438 ) ) ( not ( = ?auto_52432 ?auto_52433 ) ) ( not ( = ?auto_52432 ?auto_52434 ) ) ( not ( = ?auto_52432 ?auto_52435 ) ) ( not ( = ?auto_52432 ?auto_52436 ) ) ( not ( = ?auto_52432 ?auto_52437 ) ) ( not ( = ?auto_52432 ?auto_52438 ) ) ( not ( = ?auto_52433 ?auto_52434 ) ) ( not ( = ?auto_52433 ?auto_52435 ) ) ( not ( = ?auto_52433 ?auto_52436 ) ) ( not ( = ?auto_52433 ?auto_52437 ) ) ( not ( = ?auto_52433 ?auto_52438 ) ) ( not ( = ?auto_52434 ?auto_52435 ) ) ( not ( = ?auto_52434 ?auto_52436 ) ) ( not ( = ?auto_52434 ?auto_52437 ) ) ( not ( = ?auto_52434 ?auto_52438 ) ) ( not ( = ?auto_52435 ?auto_52436 ) ) ( not ( = ?auto_52435 ?auto_52437 ) ) ( not ( = ?auto_52435 ?auto_52438 ) ) ( not ( = ?auto_52436 ?auto_52437 ) ) ( not ( = ?auto_52436 ?auto_52438 ) ) ( not ( = ?auto_52437 ?auto_52438 ) ) ( ON ?auto_52430 ?auto_52439 ) ( not ( = ?auto_52438 ?auto_52439 ) ) ( not ( = ?auto_52437 ?auto_52439 ) ) ( not ( = ?auto_52436 ?auto_52439 ) ) ( not ( = ?auto_52435 ?auto_52439 ) ) ( not ( = ?auto_52434 ?auto_52439 ) ) ( not ( = ?auto_52433 ?auto_52439 ) ) ( not ( = ?auto_52432 ?auto_52439 ) ) ( not ( = ?auto_52431 ?auto_52439 ) ) ( not ( = ?auto_52430 ?auto_52439 ) ) ( ON ?auto_52431 ?auto_52430 ) ( ON ?auto_52432 ?auto_52431 ) ( ON ?auto_52433 ?auto_52432 ) ( ON ?auto_52434 ?auto_52433 ) ( ON ?auto_52435 ?auto_52434 ) ( ON ?auto_52436 ?auto_52435 ) ( ON ?auto_52437 ?auto_52436 ) ( ON ?auto_52438 ?auto_52437 ) ( CLEAR ?auto_52438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_52438 ?auto_52437 ?auto_52436 ?auto_52435 ?auto_52434 ?auto_52433 ?auto_52432 ?auto_52431 ?auto_52430 )
      ( MAKE-9PILE ?auto_52430 ?auto_52431 ?auto_52432 ?auto_52433 ?auto_52434 ?auto_52435 ?auto_52436 ?auto_52437 ?auto_52438 ) )
  )

)

