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
      ?auto_6201 - BLOCK
    )
    :vars
    (
      ?auto_6202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6201 ?auto_6202 ) ( CLEAR ?auto_6201 ) ( HAND-EMPTY ) ( not ( = ?auto_6201 ?auto_6202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6201 ?auto_6202 )
      ( !PUTDOWN ?auto_6201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6208 - BLOCK
      ?auto_6209 - BLOCK
    )
    :vars
    (
      ?auto_6210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6208 ) ( ON ?auto_6209 ?auto_6210 ) ( CLEAR ?auto_6209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6208 ) ( not ( = ?auto_6208 ?auto_6209 ) ) ( not ( = ?auto_6208 ?auto_6210 ) ) ( not ( = ?auto_6209 ?auto_6210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6209 ?auto_6210 )
      ( !STACK ?auto_6209 ?auto_6208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6218 - BLOCK
      ?auto_6219 - BLOCK
    )
    :vars
    (
      ?auto_6220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6219 ?auto_6220 ) ( not ( = ?auto_6218 ?auto_6219 ) ) ( not ( = ?auto_6218 ?auto_6220 ) ) ( not ( = ?auto_6219 ?auto_6220 ) ) ( ON ?auto_6218 ?auto_6219 ) ( CLEAR ?auto_6218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6218 )
      ( MAKE-2PILE ?auto_6218 ?auto_6219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6229 - BLOCK
      ?auto_6230 - BLOCK
      ?auto_6231 - BLOCK
    )
    :vars
    (
      ?auto_6232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6230 ) ( ON ?auto_6231 ?auto_6232 ) ( CLEAR ?auto_6231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6229 ) ( ON ?auto_6230 ?auto_6229 ) ( not ( = ?auto_6229 ?auto_6230 ) ) ( not ( = ?auto_6229 ?auto_6231 ) ) ( not ( = ?auto_6229 ?auto_6232 ) ) ( not ( = ?auto_6230 ?auto_6231 ) ) ( not ( = ?auto_6230 ?auto_6232 ) ) ( not ( = ?auto_6231 ?auto_6232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6231 ?auto_6232 )
      ( !STACK ?auto_6231 ?auto_6230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6243 - BLOCK
      ?auto_6244 - BLOCK
      ?auto_6245 - BLOCK
    )
    :vars
    (
      ?auto_6246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6245 ?auto_6246 ) ( ON-TABLE ?auto_6243 ) ( not ( = ?auto_6243 ?auto_6244 ) ) ( not ( = ?auto_6243 ?auto_6245 ) ) ( not ( = ?auto_6243 ?auto_6246 ) ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6246 ) ) ( not ( = ?auto_6245 ?auto_6246 ) ) ( CLEAR ?auto_6243 ) ( ON ?auto_6244 ?auto_6245 ) ( CLEAR ?auto_6244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6243 ?auto_6244 )
      ( MAKE-3PILE ?auto_6243 ?auto_6244 ?auto_6245 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6257 - BLOCK
      ?auto_6258 - BLOCK
      ?auto_6259 - BLOCK
    )
    :vars
    (
      ?auto_6260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6259 ?auto_6260 ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( not ( = ?auto_6257 ?auto_6259 ) ) ( not ( = ?auto_6257 ?auto_6260 ) ) ( not ( = ?auto_6258 ?auto_6259 ) ) ( not ( = ?auto_6258 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( ON ?auto_6258 ?auto_6259 ) ( ON ?auto_6257 ?auto_6258 ) ( CLEAR ?auto_6257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6257 )
      ( MAKE-3PILE ?auto_6257 ?auto_6258 ?auto_6259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6272 - BLOCK
      ?auto_6273 - BLOCK
      ?auto_6274 - BLOCK
      ?auto_6275 - BLOCK
    )
    :vars
    (
      ?auto_6276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6274 ) ( ON ?auto_6275 ?auto_6276 ) ( CLEAR ?auto_6275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6272 ) ( ON ?auto_6273 ?auto_6272 ) ( ON ?auto_6274 ?auto_6273 ) ( not ( = ?auto_6272 ?auto_6273 ) ) ( not ( = ?auto_6272 ?auto_6274 ) ) ( not ( = ?auto_6272 ?auto_6275 ) ) ( not ( = ?auto_6272 ?auto_6276 ) ) ( not ( = ?auto_6273 ?auto_6274 ) ) ( not ( = ?auto_6273 ?auto_6275 ) ) ( not ( = ?auto_6273 ?auto_6276 ) ) ( not ( = ?auto_6274 ?auto_6275 ) ) ( not ( = ?auto_6274 ?auto_6276 ) ) ( not ( = ?auto_6275 ?auto_6276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6275 ?auto_6276 )
      ( !STACK ?auto_6275 ?auto_6274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6290 - BLOCK
      ?auto_6291 - BLOCK
      ?auto_6292 - BLOCK
      ?auto_6293 - BLOCK
    )
    :vars
    (
      ?auto_6294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6293 ?auto_6294 ) ( ON-TABLE ?auto_6290 ) ( ON ?auto_6291 ?auto_6290 ) ( not ( = ?auto_6290 ?auto_6291 ) ) ( not ( = ?auto_6290 ?auto_6292 ) ) ( not ( = ?auto_6290 ?auto_6293 ) ) ( not ( = ?auto_6290 ?auto_6294 ) ) ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6291 ?auto_6294 ) ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6294 ) ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( CLEAR ?auto_6291 ) ( ON ?auto_6292 ?auto_6293 ) ( CLEAR ?auto_6292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6290 ?auto_6291 ?auto_6292 )
      ( MAKE-4PILE ?auto_6290 ?auto_6291 ?auto_6292 ?auto_6293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6308 - BLOCK
      ?auto_6309 - BLOCK
      ?auto_6310 - BLOCK
      ?auto_6311 - BLOCK
    )
    :vars
    (
      ?auto_6312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6311 ?auto_6312 ) ( ON-TABLE ?auto_6308 ) ( not ( = ?auto_6308 ?auto_6309 ) ) ( not ( = ?auto_6308 ?auto_6310 ) ) ( not ( = ?auto_6308 ?auto_6311 ) ) ( not ( = ?auto_6308 ?auto_6312 ) ) ( not ( = ?auto_6309 ?auto_6310 ) ) ( not ( = ?auto_6309 ?auto_6311 ) ) ( not ( = ?auto_6309 ?auto_6312 ) ) ( not ( = ?auto_6310 ?auto_6311 ) ) ( not ( = ?auto_6310 ?auto_6312 ) ) ( not ( = ?auto_6311 ?auto_6312 ) ) ( ON ?auto_6310 ?auto_6311 ) ( CLEAR ?auto_6308 ) ( ON ?auto_6309 ?auto_6310 ) ( CLEAR ?auto_6309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6308 ?auto_6309 )
      ( MAKE-4PILE ?auto_6308 ?auto_6309 ?auto_6310 ?auto_6311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6326 - BLOCK
      ?auto_6327 - BLOCK
      ?auto_6328 - BLOCK
      ?auto_6329 - BLOCK
    )
    :vars
    (
      ?auto_6330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6329 ?auto_6330 ) ( not ( = ?auto_6326 ?auto_6327 ) ) ( not ( = ?auto_6326 ?auto_6328 ) ) ( not ( = ?auto_6326 ?auto_6329 ) ) ( not ( = ?auto_6326 ?auto_6330 ) ) ( not ( = ?auto_6327 ?auto_6328 ) ) ( not ( = ?auto_6327 ?auto_6329 ) ) ( not ( = ?auto_6327 ?auto_6330 ) ) ( not ( = ?auto_6328 ?auto_6329 ) ) ( not ( = ?auto_6328 ?auto_6330 ) ) ( not ( = ?auto_6329 ?auto_6330 ) ) ( ON ?auto_6328 ?auto_6329 ) ( ON ?auto_6327 ?auto_6328 ) ( ON ?auto_6326 ?auto_6327 ) ( CLEAR ?auto_6326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6326 )
      ( MAKE-4PILE ?auto_6326 ?auto_6327 ?auto_6328 ?auto_6329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6345 - BLOCK
      ?auto_6346 - BLOCK
      ?auto_6347 - BLOCK
      ?auto_6348 - BLOCK
      ?auto_6349 - BLOCK
    )
    :vars
    (
      ?auto_6350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6348 ) ( ON ?auto_6349 ?auto_6350 ) ( CLEAR ?auto_6349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6345 ) ( ON ?auto_6346 ?auto_6345 ) ( ON ?auto_6347 ?auto_6346 ) ( ON ?auto_6348 ?auto_6347 ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( not ( = ?auto_6345 ?auto_6347 ) ) ( not ( = ?auto_6345 ?auto_6348 ) ) ( not ( = ?auto_6345 ?auto_6349 ) ) ( not ( = ?auto_6345 ?auto_6350 ) ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( not ( = ?auto_6346 ?auto_6349 ) ) ( not ( = ?auto_6346 ?auto_6350 ) ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6347 ?auto_6350 ) ) ( not ( = ?auto_6348 ?auto_6349 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6349 ?auto_6350 )
      ( !STACK ?auto_6349 ?auto_6348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6356 - BLOCK
      ?auto_6357 - BLOCK
      ?auto_6358 - BLOCK
      ?auto_6359 - BLOCK
      ?auto_6360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6359 ) ( ON-TABLE ?auto_6360 ) ( CLEAR ?auto_6360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6356 ) ( ON ?auto_6357 ?auto_6356 ) ( ON ?auto_6358 ?auto_6357 ) ( ON ?auto_6359 ?auto_6358 ) ( not ( = ?auto_6356 ?auto_6357 ) ) ( not ( = ?auto_6356 ?auto_6358 ) ) ( not ( = ?auto_6356 ?auto_6359 ) ) ( not ( = ?auto_6356 ?auto_6360 ) ) ( not ( = ?auto_6357 ?auto_6358 ) ) ( not ( = ?auto_6357 ?auto_6359 ) ) ( not ( = ?auto_6357 ?auto_6360 ) ) ( not ( = ?auto_6358 ?auto_6359 ) ) ( not ( = ?auto_6358 ?auto_6360 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_6360 )
      ( !STACK ?auto_6360 ?auto_6359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6366 - BLOCK
      ?auto_6367 - BLOCK
      ?auto_6368 - BLOCK
      ?auto_6369 - BLOCK
      ?auto_6370 - BLOCK
    )
    :vars
    (
      ?auto_6371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6370 ?auto_6371 ) ( ON-TABLE ?auto_6366 ) ( ON ?auto_6367 ?auto_6366 ) ( ON ?auto_6368 ?auto_6367 ) ( not ( = ?auto_6366 ?auto_6367 ) ) ( not ( = ?auto_6366 ?auto_6368 ) ) ( not ( = ?auto_6366 ?auto_6369 ) ) ( not ( = ?auto_6366 ?auto_6370 ) ) ( not ( = ?auto_6366 ?auto_6371 ) ) ( not ( = ?auto_6367 ?auto_6368 ) ) ( not ( = ?auto_6367 ?auto_6369 ) ) ( not ( = ?auto_6367 ?auto_6370 ) ) ( not ( = ?auto_6367 ?auto_6371 ) ) ( not ( = ?auto_6368 ?auto_6369 ) ) ( not ( = ?auto_6368 ?auto_6370 ) ) ( not ( = ?auto_6368 ?auto_6371 ) ) ( not ( = ?auto_6369 ?auto_6370 ) ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( not ( = ?auto_6370 ?auto_6371 ) ) ( CLEAR ?auto_6368 ) ( ON ?auto_6369 ?auto_6370 ) ( CLEAR ?auto_6369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6366 ?auto_6367 ?auto_6368 ?auto_6369 )
      ( MAKE-5PILE ?auto_6366 ?auto_6367 ?auto_6368 ?auto_6369 ?auto_6370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6377 - BLOCK
      ?auto_6378 - BLOCK
      ?auto_6379 - BLOCK
      ?auto_6380 - BLOCK
      ?auto_6381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6381 ) ( ON-TABLE ?auto_6377 ) ( ON ?auto_6378 ?auto_6377 ) ( ON ?auto_6379 ?auto_6378 ) ( not ( = ?auto_6377 ?auto_6378 ) ) ( not ( = ?auto_6377 ?auto_6379 ) ) ( not ( = ?auto_6377 ?auto_6380 ) ) ( not ( = ?auto_6377 ?auto_6381 ) ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( not ( = ?auto_6378 ?auto_6381 ) ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6380 ?auto_6381 ) ) ( CLEAR ?auto_6379 ) ( ON ?auto_6380 ?auto_6381 ) ( CLEAR ?auto_6380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6377 ?auto_6378 ?auto_6379 ?auto_6380 )
      ( MAKE-5PILE ?auto_6377 ?auto_6378 ?auto_6379 ?auto_6380 ?auto_6381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6387 - BLOCK
      ?auto_6388 - BLOCK
      ?auto_6389 - BLOCK
      ?auto_6390 - BLOCK
      ?auto_6391 - BLOCK
    )
    :vars
    (
      ?auto_6392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6391 ?auto_6392 ) ( ON-TABLE ?auto_6387 ) ( ON ?auto_6388 ?auto_6387 ) ( not ( = ?auto_6387 ?auto_6388 ) ) ( not ( = ?auto_6387 ?auto_6389 ) ) ( not ( = ?auto_6387 ?auto_6390 ) ) ( not ( = ?auto_6387 ?auto_6391 ) ) ( not ( = ?auto_6387 ?auto_6392 ) ) ( not ( = ?auto_6388 ?auto_6389 ) ) ( not ( = ?auto_6388 ?auto_6390 ) ) ( not ( = ?auto_6388 ?auto_6391 ) ) ( not ( = ?auto_6388 ?auto_6392 ) ) ( not ( = ?auto_6389 ?auto_6390 ) ) ( not ( = ?auto_6389 ?auto_6391 ) ) ( not ( = ?auto_6389 ?auto_6392 ) ) ( not ( = ?auto_6390 ?auto_6391 ) ) ( not ( = ?auto_6390 ?auto_6392 ) ) ( not ( = ?auto_6391 ?auto_6392 ) ) ( ON ?auto_6390 ?auto_6391 ) ( CLEAR ?auto_6388 ) ( ON ?auto_6389 ?auto_6390 ) ( CLEAR ?auto_6389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6387 ?auto_6388 ?auto_6389 )
      ( MAKE-5PILE ?auto_6387 ?auto_6388 ?auto_6389 ?auto_6390 ?auto_6391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6398 - BLOCK
      ?auto_6399 - BLOCK
      ?auto_6400 - BLOCK
      ?auto_6401 - BLOCK
      ?auto_6402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6402 ) ( ON-TABLE ?auto_6398 ) ( ON ?auto_6399 ?auto_6398 ) ( not ( = ?auto_6398 ?auto_6399 ) ) ( not ( = ?auto_6398 ?auto_6400 ) ) ( not ( = ?auto_6398 ?auto_6401 ) ) ( not ( = ?auto_6398 ?auto_6402 ) ) ( not ( = ?auto_6399 ?auto_6400 ) ) ( not ( = ?auto_6399 ?auto_6401 ) ) ( not ( = ?auto_6399 ?auto_6402 ) ) ( not ( = ?auto_6400 ?auto_6401 ) ) ( not ( = ?auto_6400 ?auto_6402 ) ) ( not ( = ?auto_6401 ?auto_6402 ) ) ( ON ?auto_6401 ?auto_6402 ) ( CLEAR ?auto_6399 ) ( ON ?auto_6400 ?auto_6401 ) ( CLEAR ?auto_6400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6398 ?auto_6399 ?auto_6400 )
      ( MAKE-5PILE ?auto_6398 ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6408 - BLOCK
      ?auto_6409 - BLOCK
      ?auto_6410 - BLOCK
      ?auto_6411 - BLOCK
      ?auto_6412 - BLOCK
    )
    :vars
    (
      ?auto_6413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6412 ?auto_6413 ) ( ON-TABLE ?auto_6408 ) ( not ( = ?auto_6408 ?auto_6409 ) ) ( not ( = ?auto_6408 ?auto_6410 ) ) ( not ( = ?auto_6408 ?auto_6411 ) ) ( not ( = ?auto_6408 ?auto_6412 ) ) ( not ( = ?auto_6408 ?auto_6413 ) ) ( not ( = ?auto_6409 ?auto_6410 ) ) ( not ( = ?auto_6409 ?auto_6411 ) ) ( not ( = ?auto_6409 ?auto_6412 ) ) ( not ( = ?auto_6409 ?auto_6413 ) ) ( not ( = ?auto_6410 ?auto_6411 ) ) ( not ( = ?auto_6410 ?auto_6412 ) ) ( not ( = ?auto_6410 ?auto_6413 ) ) ( not ( = ?auto_6411 ?auto_6412 ) ) ( not ( = ?auto_6411 ?auto_6413 ) ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( ON ?auto_6411 ?auto_6412 ) ( ON ?auto_6410 ?auto_6411 ) ( CLEAR ?auto_6408 ) ( ON ?auto_6409 ?auto_6410 ) ( CLEAR ?auto_6409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6408 ?auto_6409 )
      ( MAKE-5PILE ?auto_6408 ?auto_6409 ?auto_6410 ?auto_6411 ?auto_6412 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6419 - BLOCK
      ?auto_6420 - BLOCK
      ?auto_6421 - BLOCK
      ?auto_6422 - BLOCK
      ?auto_6423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6423 ) ( ON-TABLE ?auto_6419 ) ( not ( = ?auto_6419 ?auto_6420 ) ) ( not ( = ?auto_6419 ?auto_6421 ) ) ( not ( = ?auto_6419 ?auto_6422 ) ) ( not ( = ?auto_6419 ?auto_6423 ) ) ( not ( = ?auto_6420 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6422 ) ) ( not ( = ?auto_6420 ?auto_6423 ) ) ( not ( = ?auto_6421 ?auto_6422 ) ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6423 ) ) ( ON ?auto_6422 ?auto_6423 ) ( ON ?auto_6421 ?auto_6422 ) ( CLEAR ?auto_6419 ) ( ON ?auto_6420 ?auto_6421 ) ( CLEAR ?auto_6420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6419 ?auto_6420 )
      ( MAKE-5PILE ?auto_6419 ?auto_6420 ?auto_6421 ?auto_6422 ?auto_6423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6429 - BLOCK
      ?auto_6430 - BLOCK
      ?auto_6431 - BLOCK
      ?auto_6432 - BLOCK
      ?auto_6433 - BLOCK
    )
    :vars
    (
      ?auto_6434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6433 ?auto_6434 ) ( not ( = ?auto_6429 ?auto_6430 ) ) ( not ( = ?auto_6429 ?auto_6431 ) ) ( not ( = ?auto_6429 ?auto_6432 ) ) ( not ( = ?auto_6429 ?auto_6433 ) ) ( not ( = ?auto_6429 ?auto_6434 ) ) ( not ( = ?auto_6430 ?auto_6431 ) ) ( not ( = ?auto_6430 ?auto_6432 ) ) ( not ( = ?auto_6430 ?auto_6433 ) ) ( not ( = ?auto_6430 ?auto_6434 ) ) ( not ( = ?auto_6431 ?auto_6432 ) ) ( not ( = ?auto_6431 ?auto_6433 ) ) ( not ( = ?auto_6431 ?auto_6434 ) ) ( not ( = ?auto_6432 ?auto_6433 ) ) ( not ( = ?auto_6432 ?auto_6434 ) ) ( not ( = ?auto_6433 ?auto_6434 ) ) ( ON ?auto_6432 ?auto_6433 ) ( ON ?auto_6431 ?auto_6432 ) ( ON ?auto_6430 ?auto_6431 ) ( ON ?auto_6429 ?auto_6430 ) ( CLEAR ?auto_6429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6429 )
      ( MAKE-5PILE ?auto_6429 ?auto_6430 ?auto_6431 ?auto_6432 ?auto_6433 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6440 - BLOCK
      ?auto_6441 - BLOCK
      ?auto_6442 - BLOCK
      ?auto_6443 - BLOCK
      ?auto_6444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6444 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( ON ?auto_6443 ?auto_6444 ) ( ON ?auto_6442 ?auto_6443 ) ( ON ?auto_6441 ?auto_6442 ) ( ON ?auto_6440 ?auto_6441 ) ( CLEAR ?auto_6440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6440 )
      ( MAKE-5PILE ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ?auto_6444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6450 - BLOCK
      ?auto_6451 - BLOCK
      ?auto_6452 - BLOCK
      ?auto_6453 - BLOCK
      ?auto_6454 - BLOCK
    )
    :vars
    (
      ?auto_6455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6450 ?auto_6451 ) ) ( not ( = ?auto_6450 ?auto_6452 ) ) ( not ( = ?auto_6450 ?auto_6453 ) ) ( not ( = ?auto_6450 ?auto_6454 ) ) ( not ( = ?auto_6451 ?auto_6452 ) ) ( not ( = ?auto_6451 ?auto_6453 ) ) ( not ( = ?auto_6451 ?auto_6454 ) ) ( not ( = ?auto_6452 ?auto_6453 ) ) ( not ( = ?auto_6452 ?auto_6454 ) ) ( not ( = ?auto_6453 ?auto_6454 ) ) ( ON ?auto_6450 ?auto_6455 ) ( not ( = ?auto_6454 ?auto_6455 ) ) ( not ( = ?auto_6453 ?auto_6455 ) ) ( not ( = ?auto_6452 ?auto_6455 ) ) ( not ( = ?auto_6451 ?auto_6455 ) ) ( not ( = ?auto_6450 ?auto_6455 ) ) ( ON ?auto_6451 ?auto_6450 ) ( ON ?auto_6452 ?auto_6451 ) ( ON ?auto_6453 ?auto_6452 ) ( ON ?auto_6454 ?auto_6453 ) ( CLEAR ?auto_6454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_6454 ?auto_6453 ?auto_6452 ?auto_6451 ?auto_6450 )
      ( MAKE-5PILE ?auto_6450 ?auto_6451 ?auto_6452 ?auto_6453 ?auto_6454 ) )
  )

)

