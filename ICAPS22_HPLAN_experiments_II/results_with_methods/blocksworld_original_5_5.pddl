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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23285 - BLOCK
      ?auto_23286 - BLOCK
      ?auto_23287 - BLOCK
      ?auto_23288 - BLOCK
      ?auto_23289 - BLOCK
    )
    :vars
    (
      ?auto_23290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23290 ?auto_23289 ) ( CLEAR ?auto_23290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23285 ) ( ON ?auto_23286 ?auto_23285 ) ( ON ?auto_23287 ?auto_23286 ) ( ON ?auto_23288 ?auto_23287 ) ( ON ?auto_23289 ?auto_23288 ) ( not ( = ?auto_23285 ?auto_23286 ) ) ( not ( = ?auto_23285 ?auto_23287 ) ) ( not ( = ?auto_23285 ?auto_23288 ) ) ( not ( = ?auto_23285 ?auto_23289 ) ) ( not ( = ?auto_23285 ?auto_23290 ) ) ( not ( = ?auto_23286 ?auto_23287 ) ) ( not ( = ?auto_23286 ?auto_23288 ) ) ( not ( = ?auto_23286 ?auto_23289 ) ) ( not ( = ?auto_23286 ?auto_23290 ) ) ( not ( = ?auto_23287 ?auto_23288 ) ) ( not ( = ?auto_23287 ?auto_23289 ) ) ( not ( = ?auto_23287 ?auto_23290 ) ) ( not ( = ?auto_23288 ?auto_23289 ) ) ( not ( = ?auto_23288 ?auto_23290 ) ) ( not ( = ?auto_23289 ?auto_23290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23290 ?auto_23289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23292 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23292 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23293 - BLOCK
    )
    :vars
    (
      ?auto_23294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23293 ?auto_23294 ) ( CLEAR ?auto_23293 ) ( HAND-EMPTY ) ( not ( = ?auto_23293 ?auto_23294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23293 ?auto_23294 )
      ( MAKE-1PILE ?auto_23293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23299 - BLOCK
      ?auto_23300 - BLOCK
      ?auto_23301 - BLOCK
      ?auto_23302 - BLOCK
    )
    :vars
    (
      ?auto_23303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23303 ?auto_23302 ) ( CLEAR ?auto_23303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23299 ) ( ON ?auto_23300 ?auto_23299 ) ( ON ?auto_23301 ?auto_23300 ) ( ON ?auto_23302 ?auto_23301 ) ( not ( = ?auto_23299 ?auto_23300 ) ) ( not ( = ?auto_23299 ?auto_23301 ) ) ( not ( = ?auto_23299 ?auto_23302 ) ) ( not ( = ?auto_23299 ?auto_23303 ) ) ( not ( = ?auto_23300 ?auto_23301 ) ) ( not ( = ?auto_23300 ?auto_23302 ) ) ( not ( = ?auto_23300 ?auto_23303 ) ) ( not ( = ?auto_23301 ?auto_23302 ) ) ( not ( = ?auto_23301 ?auto_23303 ) ) ( not ( = ?auto_23302 ?auto_23303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23303 ?auto_23302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23304 - BLOCK
      ?auto_23305 - BLOCK
      ?auto_23306 - BLOCK
      ?auto_23307 - BLOCK
    )
    :vars
    (
      ?auto_23308 - BLOCK
      ?auto_23309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23308 ?auto_23307 ) ( CLEAR ?auto_23308 ) ( ON-TABLE ?auto_23304 ) ( ON ?auto_23305 ?auto_23304 ) ( ON ?auto_23306 ?auto_23305 ) ( ON ?auto_23307 ?auto_23306 ) ( not ( = ?auto_23304 ?auto_23305 ) ) ( not ( = ?auto_23304 ?auto_23306 ) ) ( not ( = ?auto_23304 ?auto_23307 ) ) ( not ( = ?auto_23304 ?auto_23308 ) ) ( not ( = ?auto_23305 ?auto_23306 ) ) ( not ( = ?auto_23305 ?auto_23307 ) ) ( not ( = ?auto_23305 ?auto_23308 ) ) ( not ( = ?auto_23306 ?auto_23307 ) ) ( not ( = ?auto_23306 ?auto_23308 ) ) ( not ( = ?auto_23307 ?auto_23308 ) ) ( HOLDING ?auto_23309 ) ( not ( = ?auto_23304 ?auto_23309 ) ) ( not ( = ?auto_23305 ?auto_23309 ) ) ( not ( = ?auto_23306 ?auto_23309 ) ) ( not ( = ?auto_23307 ?auto_23309 ) ) ( not ( = ?auto_23308 ?auto_23309 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23309 )
      ( MAKE-4PILE ?auto_23304 ?auto_23305 ?auto_23306 ?auto_23307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23310 - BLOCK
      ?auto_23311 - BLOCK
      ?auto_23312 - BLOCK
      ?auto_23313 - BLOCK
    )
    :vars
    (
      ?auto_23314 - BLOCK
      ?auto_23315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23314 ?auto_23313 ) ( ON-TABLE ?auto_23310 ) ( ON ?auto_23311 ?auto_23310 ) ( ON ?auto_23312 ?auto_23311 ) ( ON ?auto_23313 ?auto_23312 ) ( not ( = ?auto_23310 ?auto_23311 ) ) ( not ( = ?auto_23310 ?auto_23312 ) ) ( not ( = ?auto_23310 ?auto_23313 ) ) ( not ( = ?auto_23310 ?auto_23314 ) ) ( not ( = ?auto_23311 ?auto_23312 ) ) ( not ( = ?auto_23311 ?auto_23313 ) ) ( not ( = ?auto_23311 ?auto_23314 ) ) ( not ( = ?auto_23312 ?auto_23313 ) ) ( not ( = ?auto_23312 ?auto_23314 ) ) ( not ( = ?auto_23313 ?auto_23314 ) ) ( not ( = ?auto_23310 ?auto_23315 ) ) ( not ( = ?auto_23311 ?auto_23315 ) ) ( not ( = ?auto_23312 ?auto_23315 ) ) ( not ( = ?auto_23313 ?auto_23315 ) ) ( not ( = ?auto_23314 ?auto_23315 ) ) ( ON ?auto_23315 ?auto_23314 ) ( CLEAR ?auto_23315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23310 ?auto_23311 ?auto_23312 ?auto_23313 ?auto_23314 )
      ( MAKE-4PILE ?auto_23310 ?auto_23311 ?auto_23312 ?auto_23313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23318 - BLOCK
      ?auto_23319 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23319 ) ( CLEAR ?auto_23318 ) ( ON-TABLE ?auto_23318 ) ( not ( = ?auto_23318 ?auto_23319 ) ) )
    :subtasks
    ( ( !STACK ?auto_23319 ?auto_23318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23320 - BLOCK
      ?auto_23321 - BLOCK
    )
    :vars
    (
      ?auto_23322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23320 ) ( ON-TABLE ?auto_23320 ) ( not ( = ?auto_23320 ?auto_23321 ) ) ( ON ?auto_23321 ?auto_23322 ) ( CLEAR ?auto_23321 ) ( HAND-EMPTY ) ( not ( = ?auto_23320 ?auto_23322 ) ) ( not ( = ?auto_23321 ?auto_23322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23321 ?auto_23322 )
      ( MAKE-2PILE ?auto_23320 ?auto_23321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23323 - BLOCK
      ?auto_23324 - BLOCK
    )
    :vars
    (
      ?auto_23325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23323 ?auto_23324 ) ) ( ON ?auto_23324 ?auto_23325 ) ( CLEAR ?auto_23324 ) ( not ( = ?auto_23323 ?auto_23325 ) ) ( not ( = ?auto_23324 ?auto_23325 ) ) ( HOLDING ?auto_23323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23323 )
      ( MAKE-2PILE ?auto_23323 ?auto_23324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23326 - BLOCK
      ?auto_23327 - BLOCK
    )
    :vars
    (
      ?auto_23328 - BLOCK
      ?auto_23331 - BLOCK
      ?auto_23330 - BLOCK
      ?auto_23329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23326 ?auto_23327 ) ) ( ON ?auto_23327 ?auto_23328 ) ( not ( = ?auto_23326 ?auto_23328 ) ) ( not ( = ?auto_23327 ?auto_23328 ) ) ( ON ?auto_23326 ?auto_23327 ) ( CLEAR ?auto_23326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23331 ) ( ON ?auto_23330 ?auto_23331 ) ( ON ?auto_23329 ?auto_23330 ) ( ON ?auto_23328 ?auto_23329 ) ( not ( = ?auto_23331 ?auto_23330 ) ) ( not ( = ?auto_23331 ?auto_23329 ) ) ( not ( = ?auto_23331 ?auto_23328 ) ) ( not ( = ?auto_23331 ?auto_23327 ) ) ( not ( = ?auto_23331 ?auto_23326 ) ) ( not ( = ?auto_23330 ?auto_23329 ) ) ( not ( = ?auto_23330 ?auto_23328 ) ) ( not ( = ?auto_23330 ?auto_23327 ) ) ( not ( = ?auto_23330 ?auto_23326 ) ) ( not ( = ?auto_23329 ?auto_23328 ) ) ( not ( = ?auto_23329 ?auto_23327 ) ) ( not ( = ?auto_23329 ?auto_23326 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23331 ?auto_23330 ?auto_23329 ?auto_23328 ?auto_23327 )
      ( MAKE-2PILE ?auto_23326 ?auto_23327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23335 - BLOCK
      ?auto_23336 - BLOCK
      ?auto_23337 - BLOCK
    )
    :vars
    (
      ?auto_23338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23338 ?auto_23337 ) ( CLEAR ?auto_23338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23335 ) ( ON ?auto_23336 ?auto_23335 ) ( ON ?auto_23337 ?auto_23336 ) ( not ( = ?auto_23335 ?auto_23336 ) ) ( not ( = ?auto_23335 ?auto_23337 ) ) ( not ( = ?auto_23335 ?auto_23338 ) ) ( not ( = ?auto_23336 ?auto_23337 ) ) ( not ( = ?auto_23336 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23338 ?auto_23337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23339 - BLOCK
      ?auto_23340 - BLOCK
      ?auto_23341 - BLOCK
    )
    :vars
    (
      ?auto_23342 - BLOCK
      ?auto_23343 - BLOCK
      ?auto_23344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23342 ?auto_23341 ) ( CLEAR ?auto_23342 ) ( ON-TABLE ?auto_23339 ) ( ON ?auto_23340 ?auto_23339 ) ( ON ?auto_23341 ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23340 ) ) ( not ( = ?auto_23339 ?auto_23341 ) ) ( not ( = ?auto_23339 ?auto_23342 ) ) ( not ( = ?auto_23340 ?auto_23341 ) ) ( not ( = ?auto_23340 ?auto_23342 ) ) ( not ( = ?auto_23341 ?auto_23342 ) ) ( HOLDING ?auto_23343 ) ( CLEAR ?auto_23344 ) ( not ( = ?auto_23339 ?auto_23343 ) ) ( not ( = ?auto_23339 ?auto_23344 ) ) ( not ( = ?auto_23340 ?auto_23343 ) ) ( not ( = ?auto_23340 ?auto_23344 ) ) ( not ( = ?auto_23341 ?auto_23343 ) ) ( not ( = ?auto_23341 ?auto_23344 ) ) ( not ( = ?auto_23342 ?auto_23343 ) ) ( not ( = ?auto_23342 ?auto_23344 ) ) ( not ( = ?auto_23343 ?auto_23344 ) ) )
    :subtasks
    ( ( !STACK ?auto_23343 ?auto_23344 )
      ( MAKE-3PILE ?auto_23339 ?auto_23340 ?auto_23341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23345 - BLOCK
      ?auto_23346 - BLOCK
      ?auto_23347 - BLOCK
    )
    :vars
    (
      ?auto_23349 - BLOCK
      ?auto_23350 - BLOCK
      ?auto_23348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23349 ?auto_23347 ) ( ON-TABLE ?auto_23345 ) ( ON ?auto_23346 ?auto_23345 ) ( ON ?auto_23347 ?auto_23346 ) ( not ( = ?auto_23345 ?auto_23346 ) ) ( not ( = ?auto_23345 ?auto_23347 ) ) ( not ( = ?auto_23345 ?auto_23349 ) ) ( not ( = ?auto_23346 ?auto_23347 ) ) ( not ( = ?auto_23346 ?auto_23349 ) ) ( not ( = ?auto_23347 ?auto_23349 ) ) ( CLEAR ?auto_23350 ) ( not ( = ?auto_23345 ?auto_23348 ) ) ( not ( = ?auto_23345 ?auto_23350 ) ) ( not ( = ?auto_23346 ?auto_23348 ) ) ( not ( = ?auto_23346 ?auto_23350 ) ) ( not ( = ?auto_23347 ?auto_23348 ) ) ( not ( = ?auto_23347 ?auto_23350 ) ) ( not ( = ?auto_23349 ?auto_23348 ) ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23348 ?auto_23350 ) ) ( ON ?auto_23348 ?auto_23349 ) ( CLEAR ?auto_23348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23345 ?auto_23346 ?auto_23347 ?auto_23349 )
      ( MAKE-3PILE ?auto_23345 ?auto_23346 ?auto_23347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23351 - BLOCK
      ?auto_23352 - BLOCK
      ?auto_23353 - BLOCK
    )
    :vars
    (
      ?auto_23355 - BLOCK
      ?auto_23356 - BLOCK
      ?auto_23354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23355 ?auto_23353 ) ( ON-TABLE ?auto_23351 ) ( ON ?auto_23352 ?auto_23351 ) ( ON ?auto_23353 ?auto_23352 ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( not ( = ?auto_23351 ?auto_23353 ) ) ( not ( = ?auto_23351 ?auto_23355 ) ) ( not ( = ?auto_23352 ?auto_23353 ) ) ( not ( = ?auto_23352 ?auto_23355 ) ) ( not ( = ?auto_23353 ?auto_23355 ) ) ( not ( = ?auto_23351 ?auto_23356 ) ) ( not ( = ?auto_23351 ?auto_23354 ) ) ( not ( = ?auto_23352 ?auto_23356 ) ) ( not ( = ?auto_23352 ?auto_23354 ) ) ( not ( = ?auto_23353 ?auto_23356 ) ) ( not ( = ?auto_23353 ?auto_23354 ) ) ( not ( = ?auto_23355 ?auto_23356 ) ) ( not ( = ?auto_23355 ?auto_23354 ) ) ( not ( = ?auto_23356 ?auto_23354 ) ) ( ON ?auto_23356 ?auto_23355 ) ( CLEAR ?auto_23356 ) ( HOLDING ?auto_23354 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23354 )
      ( MAKE-3PILE ?auto_23351 ?auto_23352 ?auto_23353 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23357 - BLOCK
      ?auto_23358 - BLOCK
      ?auto_23359 - BLOCK
    )
    :vars
    (
      ?auto_23361 - BLOCK
      ?auto_23360 - BLOCK
      ?auto_23362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23361 ?auto_23359 ) ( ON-TABLE ?auto_23357 ) ( ON ?auto_23358 ?auto_23357 ) ( ON ?auto_23359 ?auto_23358 ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23357 ?auto_23359 ) ) ( not ( = ?auto_23357 ?auto_23361 ) ) ( not ( = ?auto_23358 ?auto_23359 ) ) ( not ( = ?auto_23358 ?auto_23361 ) ) ( not ( = ?auto_23359 ?auto_23361 ) ) ( not ( = ?auto_23357 ?auto_23360 ) ) ( not ( = ?auto_23357 ?auto_23362 ) ) ( not ( = ?auto_23358 ?auto_23360 ) ) ( not ( = ?auto_23358 ?auto_23362 ) ) ( not ( = ?auto_23359 ?auto_23360 ) ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( not ( = ?auto_23361 ?auto_23360 ) ) ( not ( = ?auto_23361 ?auto_23362 ) ) ( not ( = ?auto_23360 ?auto_23362 ) ) ( ON ?auto_23360 ?auto_23361 ) ( ON ?auto_23362 ?auto_23360 ) ( CLEAR ?auto_23362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23357 ?auto_23358 ?auto_23359 ?auto_23361 ?auto_23360 )
      ( MAKE-3PILE ?auto_23357 ?auto_23358 ?auto_23359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23366 - BLOCK
      ?auto_23367 - BLOCK
      ?auto_23368 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23368 ) ( CLEAR ?auto_23367 ) ( ON-TABLE ?auto_23366 ) ( ON ?auto_23367 ?auto_23366 ) ( not ( = ?auto_23366 ?auto_23367 ) ) ( not ( = ?auto_23366 ?auto_23368 ) ) ( not ( = ?auto_23367 ?auto_23368 ) ) )
    :subtasks
    ( ( !STACK ?auto_23368 ?auto_23367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23369 - BLOCK
      ?auto_23370 - BLOCK
      ?auto_23371 - BLOCK
    )
    :vars
    (
      ?auto_23372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23370 ) ( ON-TABLE ?auto_23369 ) ( ON ?auto_23370 ?auto_23369 ) ( not ( = ?auto_23369 ?auto_23370 ) ) ( not ( = ?auto_23369 ?auto_23371 ) ) ( not ( = ?auto_23370 ?auto_23371 ) ) ( ON ?auto_23371 ?auto_23372 ) ( CLEAR ?auto_23371 ) ( HAND-EMPTY ) ( not ( = ?auto_23369 ?auto_23372 ) ) ( not ( = ?auto_23370 ?auto_23372 ) ) ( not ( = ?auto_23371 ?auto_23372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23371 ?auto_23372 )
      ( MAKE-3PILE ?auto_23369 ?auto_23370 ?auto_23371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23373 - BLOCK
      ?auto_23374 - BLOCK
      ?auto_23375 - BLOCK
    )
    :vars
    (
      ?auto_23376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23373 ) ( not ( = ?auto_23373 ?auto_23374 ) ) ( not ( = ?auto_23373 ?auto_23375 ) ) ( not ( = ?auto_23374 ?auto_23375 ) ) ( ON ?auto_23375 ?auto_23376 ) ( CLEAR ?auto_23375 ) ( not ( = ?auto_23373 ?auto_23376 ) ) ( not ( = ?auto_23374 ?auto_23376 ) ) ( not ( = ?auto_23375 ?auto_23376 ) ) ( HOLDING ?auto_23374 ) ( CLEAR ?auto_23373 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23373 ?auto_23374 )
      ( MAKE-3PILE ?auto_23373 ?auto_23374 ?auto_23375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23377 - BLOCK
      ?auto_23378 - BLOCK
      ?auto_23379 - BLOCK
    )
    :vars
    (
      ?auto_23380 - BLOCK
      ?auto_23381 - BLOCK
      ?auto_23382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23377 ) ( not ( = ?auto_23377 ?auto_23378 ) ) ( not ( = ?auto_23377 ?auto_23379 ) ) ( not ( = ?auto_23378 ?auto_23379 ) ) ( ON ?auto_23379 ?auto_23380 ) ( not ( = ?auto_23377 ?auto_23380 ) ) ( not ( = ?auto_23378 ?auto_23380 ) ) ( not ( = ?auto_23379 ?auto_23380 ) ) ( CLEAR ?auto_23377 ) ( ON ?auto_23378 ?auto_23379 ) ( CLEAR ?auto_23378 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23381 ) ( ON ?auto_23382 ?auto_23381 ) ( ON ?auto_23380 ?auto_23382 ) ( not ( = ?auto_23381 ?auto_23382 ) ) ( not ( = ?auto_23381 ?auto_23380 ) ) ( not ( = ?auto_23381 ?auto_23379 ) ) ( not ( = ?auto_23381 ?auto_23378 ) ) ( not ( = ?auto_23382 ?auto_23380 ) ) ( not ( = ?auto_23382 ?auto_23379 ) ) ( not ( = ?auto_23382 ?auto_23378 ) ) ( not ( = ?auto_23377 ?auto_23381 ) ) ( not ( = ?auto_23377 ?auto_23382 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23381 ?auto_23382 ?auto_23380 ?auto_23379 )
      ( MAKE-3PILE ?auto_23377 ?auto_23378 ?auto_23379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23383 - BLOCK
      ?auto_23384 - BLOCK
      ?auto_23385 - BLOCK
    )
    :vars
    (
      ?auto_23387 - BLOCK
      ?auto_23386 - BLOCK
      ?auto_23388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23385 ) ) ( not ( = ?auto_23384 ?auto_23385 ) ) ( ON ?auto_23385 ?auto_23387 ) ( not ( = ?auto_23383 ?auto_23387 ) ) ( not ( = ?auto_23384 ?auto_23387 ) ) ( not ( = ?auto_23385 ?auto_23387 ) ) ( ON ?auto_23384 ?auto_23385 ) ( CLEAR ?auto_23384 ) ( ON-TABLE ?auto_23386 ) ( ON ?auto_23388 ?auto_23386 ) ( ON ?auto_23387 ?auto_23388 ) ( not ( = ?auto_23386 ?auto_23388 ) ) ( not ( = ?auto_23386 ?auto_23387 ) ) ( not ( = ?auto_23386 ?auto_23385 ) ) ( not ( = ?auto_23386 ?auto_23384 ) ) ( not ( = ?auto_23388 ?auto_23387 ) ) ( not ( = ?auto_23388 ?auto_23385 ) ) ( not ( = ?auto_23388 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23386 ) ) ( not ( = ?auto_23383 ?auto_23388 ) ) ( HOLDING ?auto_23383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23383 )
      ( MAKE-3PILE ?auto_23383 ?auto_23384 ?auto_23385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23389 - BLOCK
      ?auto_23390 - BLOCK
      ?auto_23391 - BLOCK
    )
    :vars
    (
      ?auto_23392 - BLOCK
      ?auto_23394 - BLOCK
      ?auto_23393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23389 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23391 ) ) ( not ( = ?auto_23390 ?auto_23391 ) ) ( ON ?auto_23391 ?auto_23392 ) ( not ( = ?auto_23389 ?auto_23392 ) ) ( not ( = ?auto_23390 ?auto_23392 ) ) ( not ( = ?auto_23391 ?auto_23392 ) ) ( ON ?auto_23390 ?auto_23391 ) ( ON-TABLE ?auto_23394 ) ( ON ?auto_23393 ?auto_23394 ) ( ON ?auto_23392 ?auto_23393 ) ( not ( = ?auto_23394 ?auto_23393 ) ) ( not ( = ?auto_23394 ?auto_23392 ) ) ( not ( = ?auto_23394 ?auto_23391 ) ) ( not ( = ?auto_23394 ?auto_23390 ) ) ( not ( = ?auto_23393 ?auto_23392 ) ) ( not ( = ?auto_23393 ?auto_23391 ) ) ( not ( = ?auto_23393 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23394 ) ) ( not ( = ?auto_23389 ?auto_23393 ) ) ( ON ?auto_23389 ?auto_23390 ) ( CLEAR ?auto_23389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23394 ?auto_23393 ?auto_23392 ?auto_23391 ?auto_23390 )
      ( MAKE-3PILE ?auto_23389 ?auto_23390 ?auto_23391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23397 - BLOCK
      ?auto_23398 - BLOCK
    )
    :vars
    (
      ?auto_23399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23399 ?auto_23398 ) ( CLEAR ?auto_23399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23397 ) ( ON ?auto_23398 ?auto_23397 ) ( not ( = ?auto_23397 ?auto_23398 ) ) ( not ( = ?auto_23397 ?auto_23399 ) ) ( not ( = ?auto_23398 ?auto_23399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23399 ?auto_23398 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23400 - BLOCK
      ?auto_23401 - BLOCK
    )
    :vars
    (
      ?auto_23402 - BLOCK
      ?auto_23403 - BLOCK
      ?auto_23404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23402 ?auto_23401 ) ( CLEAR ?auto_23402 ) ( ON-TABLE ?auto_23400 ) ( ON ?auto_23401 ?auto_23400 ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23401 ?auto_23402 ) ) ( HOLDING ?auto_23403 ) ( CLEAR ?auto_23404 ) ( not ( = ?auto_23400 ?auto_23403 ) ) ( not ( = ?auto_23400 ?auto_23404 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23404 ) ) ( not ( = ?auto_23402 ?auto_23403 ) ) ( not ( = ?auto_23402 ?auto_23404 ) ) ( not ( = ?auto_23403 ?auto_23404 ) ) )
    :subtasks
    ( ( !STACK ?auto_23403 ?auto_23404 )
      ( MAKE-2PILE ?auto_23400 ?auto_23401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23405 - BLOCK
      ?auto_23406 - BLOCK
    )
    :vars
    (
      ?auto_23407 - BLOCK
      ?auto_23409 - BLOCK
      ?auto_23408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23407 ?auto_23406 ) ( ON-TABLE ?auto_23405 ) ( ON ?auto_23406 ?auto_23405 ) ( not ( = ?auto_23405 ?auto_23406 ) ) ( not ( = ?auto_23405 ?auto_23407 ) ) ( not ( = ?auto_23406 ?auto_23407 ) ) ( CLEAR ?auto_23409 ) ( not ( = ?auto_23405 ?auto_23408 ) ) ( not ( = ?auto_23405 ?auto_23409 ) ) ( not ( = ?auto_23406 ?auto_23408 ) ) ( not ( = ?auto_23406 ?auto_23409 ) ) ( not ( = ?auto_23407 ?auto_23408 ) ) ( not ( = ?auto_23407 ?auto_23409 ) ) ( not ( = ?auto_23408 ?auto_23409 ) ) ( ON ?auto_23408 ?auto_23407 ) ( CLEAR ?auto_23408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23405 ?auto_23406 ?auto_23407 )
      ( MAKE-2PILE ?auto_23405 ?auto_23406 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23410 - BLOCK
      ?auto_23411 - BLOCK
    )
    :vars
    (
      ?auto_23413 - BLOCK
      ?auto_23412 - BLOCK
      ?auto_23414 - BLOCK
      ?auto_23415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23413 ?auto_23411 ) ( ON-TABLE ?auto_23410 ) ( ON ?auto_23411 ?auto_23410 ) ( not ( = ?auto_23410 ?auto_23411 ) ) ( not ( = ?auto_23410 ?auto_23413 ) ) ( not ( = ?auto_23411 ?auto_23413 ) ) ( not ( = ?auto_23410 ?auto_23412 ) ) ( not ( = ?auto_23410 ?auto_23414 ) ) ( not ( = ?auto_23411 ?auto_23412 ) ) ( not ( = ?auto_23411 ?auto_23414 ) ) ( not ( = ?auto_23413 ?auto_23412 ) ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23412 ?auto_23414 ) ) ( ON ?auto_23412 ?auto_23413 ) ( CLEAR ?auto_23412 ) ( HOLDING ?auto_23414 ) ( CLEAR ?auto_23415 ) ( ON-TABLE ?auto_23415 ) ( not ( = ?auto_23415 ?auto_23414 ) ) ( not ( = ?auto_23410 ?auto_23415 ) ) ( not ( = ?auto_23411 ?auto_23415 ) ) ( not ( = ?auto_23413 ?auto_23415 ) ) ( not ( = ?auto_23412 ?auto_23415 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23415 ?auto_23414 )
      ( MAKE-2PILE ?auto_23410 ?auto_23411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23416 - BLOCK
      ?auto_23417 - BLOCK
    )
    :vars
    (
      ?auto_23420 - BLOCK
      ?auto_23421 - BLOCK
      ?auto_23418 - BLOCK
      ?auto_23419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23420 ?auto_23417 ) ( ON-TABLE ?auto_23416 ) ( ON ?auto_23417 ?auto_23416 ) ( not ( = ?auto_23416 ?auto_23417 ) ) ( not ( = ?auto_23416 ?auto_23420 ) ) ( not ( = ?auto_23417 ?auto_23420 ) ) ( not ( = ?auto_23416 ?auto_23421 ) ) ( not ( = ?auto_23416 ?auto_23418 ) ) ( not ( = ?auto_23417 ?auto_23421 ) ) ( not ( = ?auto_23417 ?auto_23418 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23418 ) ) ( not ( = ?auto_23421 ?auto_23418 ) ) ( ON ?auto_23421 ?auto_23420 ) ( CLEAR ?auto_23419 ) ( ON-TABLE ?auto_23419 ) ( not ( = ?auto_23419 ?auto_23418 ) ) ( not ( = ?auto_23416 ?auto_23419 ) ) ( not ( = ?auto_23417 ?auto_23419 ) ) ( not ( = ?auto_23420 ?auto_23419 ) ) ( not ( = ?auto_23421 ?auto_23419 ) ) ( ON ?auto_23418 ?auto_23421 ) ( CLEAR ?auto_23418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23416 ?auto_23417 ?auto_23420 ?auto_23421 )
      ( MAKE-2PILE ?auto_23416 ?auto_23417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23422 - BLOCK
      ?auto_23423 - BLOCK
    )
    :vars
    (
      ?auto_23426 - BLOCK
      ?auto_23427 - BLOCK
      ?auto_23424 - BLOCK
      ?auto_23425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23426 ?auto_23423 ) ( ON-TABLE ?auto_23422 ) ( ON ?auto_23423 ?auto_23422 ) ( not ( = ?auto_23422 ?auto_23423 ) ) ( not ( = ?auto_23422 ?auto_23426 ) ) ( not ( = ?auto_23423 ?auto_23426 ) ) ( not ( = ?auto_23422 ?auto_23427 ) ) ( not ( = ?auto_23422 ?auto_23424 ) ) ( not ( = ?auto_23423 ?auto_23427 ) ) ( not ( = ?auto_23423 ?auto_23424 ) ) ( not ( = ?auto_23426 ?auto_23427 ) ) ( not ( = ?auto_23426 ?auto_23424 ) ) ( not ( = ?auto_23427 ?auto_23424 ) ) ( ON ?auto_23427 ?auto_23426 ) ( not ( = ?auto_23425 ?auto_23424 ) ) ( not ( = ?auto_23422 ?auto_23425 ) ) ( not ( = ?auto_23423 ?auto_23425 ) ) ( not ( = ?auto_23426 ?auto_23425 ) ) ( not ( = ?auto_23427 ?auto_23425 ) ) ( ON ?auto_23424 ?auto_23427 ) ( CLEAR ?auto_23424 ) ( HOLDING ?auto_23425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23425 )
      ( MAKE-2PILE ?auto_23422 ?auto_23423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23428 - BLOCK
      ?auto_23429 - BLOCK
    )
    :vars
    (
      ?auto_23433 - BLOCK
      ?auto_23432 - BLOCK
      ?auto_23431 - BLOCK
      ?auto_23430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23433 ?auto_23429 ) ( ON-TABLE ?auto_23428 ) ( ON ?auto_23429 ?auto_23428 ) ( not ( = ?auto_23428 ?auto_23429 ) ) ( not ( = ?auto_23428 ?auto_23433 ) ) ( not ( = ?auto_23429 ?auto_23433 ) ) ( not ( = ?auto_23428 ?auto_23432 ) ) ( not ( = ?auto_23428 ?auto_23431 ) ) ( not ( = ?auto_23429 ?auto_23432 ) ) ( not ( = ?auto_23429 ?auto_23431 ) ) ( not ( = ?auto_23433 ?auto_23432 ) ) ( not ( = ?auto_23433 ?auto_23431 ) ) ( not ( = ?auto_23432 ?auto_23431 ) ) ( ON ?auto_23432 ?auto_23433 ) ( not ( = ?auto_23430 ?auto_23431 ) ) ( not ( = ?auto_23428 ?auto_23430 ) ) ( not ( = ?auto_23429 ?auto_23430 ) ) ( not ( = ?auto_23433 ?auto_23430 ) ) ( not ( = ?auto_23432 ?auto_23430 ) ) ( ON ?auto_23431 ?auto_23432 ) ( ON ?auto_23430 ?auto_23431 ) ( CLEAR ?auto_23430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23428 ?auto_23429 ?auto_23433 ?auto_23432 ?auto_23431 )
      ( MAKE-2PILE ?auto_23428 ?auto_23429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23438 - BLOCK
      ?auto_23439 - BLOCK
      ?auto_23440 - BLOCK
      ?auto_23441 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23441 ) ( CLEAR ?auto_23440 ) ( ON-TABLE ?auto_23438 ) ( ON ?auto_23439 ?auto_23438 ) ( ON ?auto_23440 ?auto_23439 ) ( not ( = ?auto_23438 ?auto_23439 ) ) ( not ( = ?auto_23438 ?auto_23440 ) ) ( not ( = ?auto_23438 ?auto_23441 ) ) ( not ( = ?auto_23439 ?auto_23440 ) ) ( not ( = ?auto_23439 ?auto_23441 ) ) ( not ( = ?auto_23440 ?auto_23441 ) ) )
    :subtasks
    ( ( !STACK ?auto_23441 ?auto_23440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23442 - BLOCK
      ?auto_23443 - BLOCK
      ?auto_23444 - BLOCK
      ?auto_23445 - BLOCK
    )
    :vars
    (
      ?auto_23446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23444 ) ( ON-TABLE ?auto_23442 ) ( ON ?auto_23443 ?auto_23442 ) ( ON ?auto_23444 ?auto_23443 ) ( not ( = ?auto_23442 ?auto_23443 ) ) ( not ( = ?auto_23442 ?auto_23444 ) ) ( not ( = ?auto_23442 ?auto_23445 ) ) ( not ( = ?auto_23443 ?auto_23444 ) ) ( not ( = ?auto_23443 ?auto_23445 ) ) ( not ( = ?auto_23444 ?auto_23445 ) ) ( ON ?auto_23445 ?auto_23446 ) ( CLEAR ?auto_23445 ) ( HAND-EMPTY ) ( not ( = ?auto_23442 ?auto_23446 ) ) ( not ( = ?auto_23443 ?auto_23446 ) ) ( not ( = ?auto_23444 ?auto_23446 ) ) ( not ( = ?auto_23445 ?auto_23446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23445 ?auto_23446 )
      ( MAKE-4PILE ?auto_23442 ?auto_23443 ?auto_23444 ?auto_23445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23447 - BLOCK
      ?auto_23448 - BLOCK
      ?auto_23449 - BLOCK
      ?auto_23450 - BLOCK
    )
    :vars
    (
      ?auto_23451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23447 ) ( ON ?auto_23448 ?auto_23447 ) ( not ( = ?auto_23447 ?auto_23448 ) ) ( not ( = ?auto_23447 ?auto_23449 ) ) ( not ( = ?auto_23447 ?auto_23450 ) ) ( not ( = ?auto_23448 ?auto_23449 ) ) ( not ( = ?auto_23448 ?auto_23450 ) ) ( not ( = ?auto_23449 ?auto_23450 ) ) ( ON ?auto_23450 ?auto_23451 ) ( CLEAR ?auto_23450 ) ( not ( = ?auto_23447 ?auto_23451 ) ) ( not ( = ?auto_23448 ?auto_23451 ) ) ( not ( = ?auto_23449 ?auto_23451 ) ) ( not ( = ?auto_23450 ?auto_23451 ) ) ( HOLDING ?auto_23449 ) ( CLEAR ?auto_23448 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23447 ?auto_23448 ?auto_23449 )
      ( MAKE-4PILE ?auto_23447 ?auto_23448 ?auto_23449 ?auto_23450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23452 - BLOCK
      ?auto_23453 - BLOCK
      ?auto_23454 - BLOCK
      ?auto_23455 - BLOCK
    )
    :vars
    (
      ?auto_23456 - BLOCK
      ?auto_23457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23452 ) ( ON ?auto_23453 ?auto_23452 ) ( not ( = ?auto_23452 ?auto_23453 ) ) ( not ( = ?auto_23452 ?auto_23454 ) ) ( not ( = ?auto_23452 ?auto_23455 ) ) ( not ( = ?auto_23453 ?auto_23454 ) ) ( not ( = ?auto_23453 ?auto_23455 ) ) ( not ( = ?auto_23454 ?auto_23455 ) ) ( ON ?auto_23455 ?auto_23456 ) ( not ( = ?auto_23452 ?auto_23456 ) ) ( not ( = ?auto_23453 ?auto_23456 ) ) ( not ( = ?auto_23454 ?auto_23456 ) ) ( not ( = ?auto_23455 ?auto_23456 ) ) ( CLEAR ?auto_23453 ) ( ON ?auto_23454 ?auto_23455 ) ( CLEAR ?auto_23454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23457 ) ( ON ?auto_23456 ?auto_23457 ) ( not ( = ?auto_23457 ?auto_23456 ) ) ( not ( = ?auto_23457 ?auto_23455 ) ) ( not ( = ?auto_23457 ?auto_23454 ) ) ( not ( = ?auto_23452 ?auto_23457 ) ) ( not ( = ?auto_23453 ?auto_23457 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23457 ?auto_23456 ?auto_23455 )
      ( MAKE-4PILE ?auto_23452 ?auto_23453 ?auto_23454 ?auto_23455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23458 - BLOCK
      ?auto_23459 - BLOCK
      ?auto_23460 - BLOCK
      ?auto_23461 - BLOCK
    )
    :vars
    (
      ?auto_23463 - BLOCK
      ?auto_23462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23458 ) ( not ( = ?auto_23458 ?auto_23459 ) ) ( not ( = ?auto_23458 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23461 ) ) ( not ( = ?auto_23459 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23461 ) ) ( not ( = ?auto_23460 ?auto_23461 ) ) ( ON ?auto_23461 ?auto_23463 ) ( not ( = ?auto_23458 ?auto_23463 ) ) ( not ( = ?auto_23459 ?auto_23463 ) ) ( not ( = ?auto_23460 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( ON ?auto_23460 ?auto_23461 ) ( CLEAR ?auto_23460 ) ( ON-TABLE ?auto_23462 ) ( ON ?auto_23463 ?auto_23462 ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( not ( = ?auto_23462 ?auto_23461 ) ) ( not ( = ?auto_23462 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23462 ) ) ( not ( = ?auto_23459 ?auto_23462 ) ) ( HOLDING ?auto_23459 ) ( CLEAR ?auto_23458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23458 ?auto_23459 )
      ( MAKE-4PILE ?auto_23458 ?auto_23459 ?auto_23460 ?auto_23461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23464 - BLOCK
      ?auto_23465 - BLOCK
      ?auto_23466 - BLOCK
      ?auto_23467 - BLOCK
    )
    :vars
    (
      ?auto_23468 - BLOCK
      ?auto_23469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23464 ) ( not ( = ?auto_23464 ?auto_23465 ) ) ( not ( = ?auto_23464 ?auto_23466 ) ) ( not ( = ?auto_23464 ?auto_23467 ) ) ( not ( = ?auto_23465 ?auto_23466 ) ) ( not ( = ?auto_23465 ?auto_23467 ) ) ( not ( = ?auto_23466 ?auto_23467 ) ) ( ON ?auto_23467 ?auto_23468 ) ( not ( = ?auto_23464 ?auto_23468 ) ) ( not ( = ?auto_23465 ?auto_23468 ) ) ( not ( = ?auto_23466 ?auto_23468 ) ) ( not ( = ?auto_23467 ?auto_23468 ) ) ( ON ?auto_23466 ?auto_23467 ) ( ON-TABLE ?auto_23469 ) ( ON ?auto_23468 ?auto_23469 ) ( not ( = ?auto_23469 ?auto_23468 ) ) ( not ( = ?auto_23469 ?auto_23467 ) ) ( not ( = ?auto_23469 ?auto_23466 ) ) ( not ( = ?auto_23464 ?auto_23469 ) ) ( not ( = ?auto_23465 ?auto_23469 ) ) ( CLEAR ?auto_23464 ) ( ON ?auto_23465 ?auto_23466 ) ( CLEAR ?auto_23465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23469 ?auto_23468 ?auto_23467 ?auto_23466 )
      ( MAKE-4PILE ?auto_23464 ?auto_23465 ?auto_23466 ?auto_23467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23470 - BLOCK
      ?auto_23471 - BLOCK
      ?auto_23472 - BLOCK
      ?auto_23473 - BLOCK
    )
    :vars
    (
      ?auto_23475 - BLOCK
      ?auto_23474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23470 ?auto_23471 ) ) ( not ( = ?auto_23470 ?auto_23472 ) ) ( not ( = ?auto_23470 ?auto_23473 ) ) ( not ( = ?auto_23471 ?auto_23472 ) ) ( not ( = ?auto_23471 ?auto_23473 ) ) ( not ( = ?auto_23472 ?auto_23473 ) ) ( ON ?auto_23473 ?auto_23475 ) ( not ( = ?auto_23470 ?auto_23475 ) ) ( not ( = ?auto_23471 ?auto_23475 ) ) ( not ( = ?auto_23472 ?auto_23475 ) ) ( not ( = ?auto_23473 ?auto_23475 ) ) ( ON ?auto_23472 ?auto_23473 ) ( ON-TABLE ?auto_23474 ) ( ON ?auto_23475 ?auto_23474 ) ( not ( = ?auto_23474 ?auto_23475 ) ) ( not ( = ?auto_23474 ?auto_23473 ) ) ( not ( = ?auto_23474 ?auto_23472 ) ) ( not ( = ?auto_23470 ?auto_23474 ) ) ( not ( = ?auto_23471 ?auto_23474 ) ) ( ON ?auto_23471 ?auto_23472 ) ( CLEAR ?auto_23471 ) ( HOLDING ?auto_23470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23470 )
      ( MAKE-4PILE ?auto_23470 ?auto_23471 ?auto_23472 ?auto_23473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23476 - BLOCK
      ?auto_23477 - BLOCK
      ?auto_23478 - BLOCK
      ?auto_23479 - BLOCK
    )
    :vars
    (
      ?auto_23480 - BLOCK
      ?auto_23481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23476 ?auto_23477 ) ) ( not ( = ?auto_23476 ?auto_23478 ) ) ( not ( = ?auto_23476 ?auto_23479 ) ) ( not ( = ?auto_23477 ?auto_23478 ) ) ( not ( = ?auto_23477 ?auto_23479 ) ) ( not ( = ?auto_23478 ?auto_23479 ) ) ( ON ?auto_23479 ?auto_23480 ) ( not ( = ?auto_23476 ?auto_23480 ) ) ( not ( = ?auto_23477 ?auto_23480 ) ) ( not ( = ?auto_23478 ?auto_23480 ) ) ( not ( = ?auto_23479 ?auto_23480 ) ) ( ON ?auto_23478 ?auto_23479 ) ( ON-TABLE ?auto_23481 ) ( ON ?auto_23480 ?auto_23481 ) ( not ( = ?auto_23481 ?auto_23480 ) ) ( not ( = ?auto_23481 ?auto_23479 ) ) ( not ( = ?auto_23481 ?auto_23478 ) ) ( not ( = ?auto_23476 ?auto_23481 ) ) ( not ( = ?auto_23477 ?auto_23481 ) ) ( ON ?auto_23477 ?auto_23478 ) ( ON ?auto_23476 ?auto_23477 ) ( CLEAR ?auto_23476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23481 ?auto_23480 ?auto_23479 ?auto_23478 ?auto_23477 )
      ( MAKE-4PILE ?auto_23476 ?auto_23477 ?auto_23478 ?auto_23479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23483 - BLOCK
    )
    :vars
    (
      ?auto_23484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23484 ?auto_23483 ) ( CLEAR ?auto_23484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23483 ) ( not ( = ?auto_23483 ?auto_23484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23484 ?auto_23483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23485 - BLOCK
    )
    :vars
    (
      ?auto_23486 - BLOCK
      ?auto_23487 - BLOCK
      ?auto_23488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23486 ?auto_23485 ) ( CLEAR ?auto_23486 ) ( ON-TABLE ?auto_23485 ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( HOLDING ?auto_23487 ) ( CLEAR ?auto_23488 ) ( not ( = ?auto_23485 ?auto_23487 ) ) ( not ( = ?auto_23485 ?auto_23488 ) ) ( not ( = ?auto_23486 ?auto_23487 ) ) ( not ( = ?auto_23486 ?auto_23488 ) ) ( not ( = ?auto_23487 ?auto_23488 ) ) )
    :subtasks
    ( ( !STACK ?auto_23487 ?auto_23488 )
      ( MAKE-1PILE ?auto_23485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23489 - BLOCK
    )
    :vars
    (
      ?auto_23491 - BLOCK
      ?auto_23492 - BLOCK
      ?auto_23490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23491 ?auto_23489 ) ( ON-TABLE ?auto_23489 ) ( not ( = ?auto_23489 ?auto_23491 ) ) ( CLEAR ?auto_23492 ) ( not ( = ?auto_23489 ?auto_23490 ) ) ( not ( = ?auto_23489 ?auto_23492 ) ) ( not ( = ?auto_23491 ?auto_23490 ) ) ( not ( = ?auto_23491 ?auto_23492 ) ) ( not ( = ?auto_23490 ?auto_23492 ) ) ( ON ?auto_23490 ?auto_23491 ) ( CLEAR ?auto_23490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23489 ?auto_23491 )
      ( MAKE-1PILE ?auto_23489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23493 - BLOCK
    )
    :vars
    (
      ?auto_23496 - BLOCK
      ?auto_23495 - BLOCK
      ?auto_23494 - BLOCK
      ?auto_23498 - BLOCK
      ?auto_23497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23496 ?auto_23493 ) ( ON-TABLE ?auto_23493 ) ( not ( = ?auto_23493 ?auto_23496 ) ) ( not ( = ?auto_23493 ?auto_23495 ) ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23496 ?auto_23495 ) ) ( not ( = ?auto_23496 ?auto_23494 ) ) ( not ( = ?auto_23495 ?auto_23494 ) ) ( ON ?auto_23495 ?auto_23496 ) ( CLEAR ?auto_23495 ) ( HOLDING ?auto_23494 ) ( CLEAR ?auto_23498 ) ( ON-TABLE ?auto_23497 ) ( ON ?auto_23498 ?auto_23497 ) ( not ( = ?auto_23497 ?auto_23498 ) ) ( not ( = ?auto_23497 ?auto_23494 ) ) ( not ( = ?auto_23498 ?auto_23494 ) ) ( not ( = ?auto_23493 ?auto_23498 ) ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( not ( = ?auto_23496 ?auto_23498 ) ) ( not ( = ?auto_23496 ?auto_23497 ) ) ( not ( = ?auto_23495 ?auto_23498 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23497 ?auto_23498 ?auto_23494 )
      ( MAKE-1PILE ?auto_23493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23499 - BLOCK
    )
    :vars
    (
      ?auto_23503 - BLOCK
      ?auto_23502 - BLOCK
      ?auto_23500 - BLOCK
      ?auto_23501 - BLOCK
      ?auto_23504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23503 ?auto_23499 ) ( ON-TABLE ?auto_23499 ) ( not ( = ?auto_23499 ?auto_23503 ) ) ( not ( = ?auto_23499 ?auto_23502 ) ) ( not ( = ?auto_23499 ?auto_23500 ) ) ( not ( = ?auto_23503 ?auto_23502 ) ) ( not ( = ?auto_23503 ?auto_23500 ) ) ( not ( = ?auto_23502 ?auto_23500 ) ) ( ON ?auto_23502 ?auto_23503 ) ( CLEAR ?auto_23501 ) ( ON-TABLE ?auto_23504 ) ( ON ?auto_23501 ?auto_23504 ) ( not ( = ?auto_23504 ?auto_23501 ) ) ( not ( = ?auto_23504 ?auto_23500 ) ) ( not ( = ?auto_23501 ?auto_23500 ) ) ( not ( = ?auto_23499 ?auto_23501 ) ) ( not ( = ?auto_23499 ?auto_23504 ) ) ( not ( = ?auto_23503 ?auto_23501 ) ) ( not ( = ?auto_23503 ?auto_23504 ) ) ( not ( = ?auto_23502 ?auto_23501 ) ) ( not ( = ?auto_23502 ?auto_23504 ) ) ( ON ?auto_23500 ?auto_23502 ) ( CLEAR ?auto_23500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23499 ?auto_23503 ?auto_23502 )
      ( MAKE-1PILE ?auto_23499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23505 - BLOCK
    )
    :vars
    (
      ?auto_23510 - BLOCK
      ?auto_23509 - BLOCK
      ?auto_23506 - BLOCK
      ?auto_23507 - BLOCK
      ?auto_23508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23510 ?auto_23505 ) ( ON-TABLE ?auto_23505 ) ( not ( = ?auto_23505 ?auto_23510 ) ) ( not ( = ?auto_23505 ?auto_23509 ) ) ( not ( = ?auto_23505 ?auto_23506 ) ) ( not ( = ?auto_23510 ?auto_23509 ) ) ( not ( = ?auto_23510 ?auto_23506 ) ) ( not ( = ?auto_23509 ?auto_23506 ) ) ( ON ?auto_23509 ?auto_23510 ) ( ON-TABLE ?auto_23507 ) ( not ( = ?auto_23507 ?auto_23508 ) ) ( not ( = ?auto_23507 ?auto_23506 ) ) ( not ( = ?auto_23508 ?auto_23506 ) ) ( not ( = ?auto_23505 ?auto_23508 ) ) ( not ( = ?auto_23505 ?auto_23507 ) ) ( not ( = ?auto_23510 ?auto_23508 ) ) ( not ( = ?auto_23510 ?auto_23507 ) ) ( not ( = ?auto_23509 ?auto_23508 ) ) ( not ( = ?auto_23509 ?auto_23507 ) ) ( ON ?auto_23506 ?auto_23509 ) ( CLEAR ?auto_23506 ) ( HOLDING ?auto_23508 ) ( CLEAR ?auto_23507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23507 ?auto_23508 )
      ( MAKE-1PILE ?auto_23505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23511 - BLOCK
    )
    :vars
    (
      ?auto_23515 - BLOCK
      ?auto_23512 - BLOCK
      ?auto_23513 - BLOCK
      ?auto_23514 - BLOCK
      ?auto_23516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23515 ?auto_23511 ) ( ON-TABLE ?auto_23511 ) ( not ( = ?auto_23511 ?auto_23515 ) ) ( not ( = ?auto_23511 ?auto_23512 ) ) ( not ( = ?auto_23511 ?auto_23513 ) ) ( not ( = ?auto_23515 ?auto_23512 ) ) ( not ( = ?auto_23515 ?auto_23513 ) ) ( not ( = ?auto_23512 ?auto_23513 ) ) ( ON ?auto_23512 ?auto_23515 ) ( ON-TABLE ?auto_23514 ) ( not ( = ?auto_23514 ?auto_23516 ) ) ( not ( = ?auto_23514 ?auto_23513 ) ) ( not ( = ?auto_23516 ?auto_23513 ) ) ( not ( = ?auto_23511 ?auto_23516 ) ) ( not ( = ?auto_23511 ?auto_23514 ) ) ( not ( = ?auto_23515 ?auto_23516 ) ) ( not ( = ?auto_23515 ?auto_23514 ) ) ( not ( = ?auto_23512 ?auto_23516 ) ) ( not ( = ?auto_23512 ?auto_23514 ) ) ( ON ?auto_23513 ?auto_23512 ) ( CLEAR ?auto_23514 ) ( ON ?auto_23516 ?auto_23513 ) ( CLEAR ?auto_23516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23511 ?auto_23515 ?auto_23512 ?auto_23513 )
      ( MAKE-1PILE ?auto_23511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23517 - BLOCK
    )
    :vars
    (
      ?auto_23519 - BLOCK
      ?auto_23518 - BLOCK
      ?auto_23520 - BLOCK
      ?auto_23522 - BLOCK
      ?auto_23521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23519 ?auto_23517 ) ( ON-TABLE ?auto_23517 ) ( not ( = ?auto_23517 ?auto_23519 ) ) ( not ( = ?auto_23517 ?auto_23518 ) ) ( not ( = ?auto_23517 ?auto_23520 ) ) ( not ( = ?auto_23519 ?auto_23518 ) ) ( not ( = ?auto_23519 ?auto_23520 ) ) ( not ( = ?auto_23518 ?auto_23520 ) ) ( ON ?auto_23518 ?auto_23519 ) ( not ( = ?auto_23522 ?auto_23521 ) ) ( not ( = ?auto_23522 ?auto_23520 ) ) ( not ( = ?auto_23521 ?auto_23520 ) ) ( not ( = ?auto_23517 ?auto_23521 ) ) ( not ( = ?auto_23517 ?auto_23522 ) ) ( not ( = ?auto_23519 ?auto_23521 ) ) ( not ( = ?auto_23519 ?auto_23522 ) ) ( not ( = ?auto_23518 ?auto_23521 ) ) ( not ( = ?auto_23518 ?auto_23522 ) ) ( ON ?auto_23520 ?auto_23518 ) ( ON ?auto_23521 ?auto_23520 ) ( CLEAR ?auto_23521 ) ( HOLDING ?auto_23522 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23522 )
      ( MAKE-1PILE ?auto_23517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23523 - BLOCK
    )
    :vars
    (
      ?auto_23525 - BLOCK
      ?auto_23526 - BLOCK
      ?auto_23524 - BLOCK
      ?auto_23528 - BLOCK
      ?auto_23527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23525 ?auto_23523 ) ( ON-TABLE ?auto_23523 ) ( not ( = ?auto_23523 ?auto_23525 ) ) ( not ( = ?auto_23523 ?auto_23526 ) ) ( not ( = ?auto_23523 ?auto_23524 ) ) ( not ( = ?auto_23525 ?auto_23526 ) ) ( not ( = ?auto_23525 ?auto_23524 ) ) ( not ( = ?auto_23526 ?auto_23524 ) ) ( ON ?auto_23526 ?auto_23525 ) ( not ( = ?auto_23528 ?auto_23527 ) ) ( not ( = ?auto_23528 ?auto_23524 ) ) ( not ( = ?auto_23527 ?auto_23524 ) ) ( not ( = ?auto_23523 ?auto_23527 ) ) ( not ( = ?auto_23523 ?auto_23528 ) ) ( not ( = ?auto_23525 ?auto_23527 ) ) ( not ( = ?auto_23525 ?auto_23528 ) ) ( not ( = ?auto_23526 ?auto_23527 ) ) ( not ( = ?auto_23526 ?auto_23528 ) ) ( ON ?auto_23524 ?auto_23526 ) ( ON ?auto_23527 ?auto_23524 ) ( ON ?auto_23528 ?auto_23527 ) ( CLEAR ?auto_23528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23523 ?auto_23525 ?auto_23526 ?auto_23524 ?auto_23527 )
      ( MAKE-1PILE ?auto_23523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23534 - BLOCK
      ?auto_23535 - BLOCK
      ?auto_23536 - BLOCK
      ?auto_23537 - BLOCK
      ?auto_23538 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23538 ) ( CLEAR ?auto_23537 ) ( ON-TABLE ?auto_23534 ) ( ON ?auto_23535 ?auto_23534 ) ( ON ?auto_23536 ?auto_23535 ) ( ON ?auto_23537 ?auto_23536 ) ( not ( = ?auto_23534 ?auto_23535 ) ) ( not ( = ?auto_23534 ?auto_23536 ) ) ( not ( = ?auto_23534 ?auto_23537 ) ) ( not ( = ?auto_23534 ?auto_23538 ) ) ( not ( = ?auto_23535 ?auto_23536 ) ) ( not ( = ?auto_23535 ?auto_23537 ) ) ( not ( = ?auto_23535 ?auto_23538 ) ) ( not ( = ?auto_23536 ?auto_23537 ) ) ( not ( = ?auto_23536 ?auto_23538 ) ) ( not ( = ?auto_23537 ?auto_23538 ) ) )
    :subtasks
    ( ( !STACK ?auto_23538 ?auto_23537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23539 - BLOCK
      ?auto_23540 - BLOCK
      ?auto_23541 - BLOCK
      ?auto_23542 - BLOCK
      ?auto_23543 - BLOCK
    )
    :vars
    (
      ?auto_23544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23542 ) ( ON-TABLE ?auto_23539 ) ( ON ?auto_23540 ?auto_23539 ) ( ON ?auto_23541 ?auto_23540 ) ( ON ?auto_23542 ?auto_23541 ) ( not ( = ?auto_23539 ?auto_23540 ) ) ( not ( = ?auto_23539 ?auto_23541 ) ) ( not ( = ?auto_23539 ?auto_23542 ) ) ( not ( = ?auto_23539 ?auto_23543 ) ) ( not ( = ?auto_23540 ?auto_23541 ) ) ( not ( = ?auto_23540 ?auto_23542 ) ) ( not ( = ?auto_23540 ?auto_23543 ) ) ( not ( = ?auto_23541 ?auto_23542 ) ) ( not ( = ?auto_23541 ?auto_23543 ) ) ( not ( = ?auto_23542 ?auto_23543 ) ) ( ON ?auto_23543 ?auto_23544 ) ( CLEAR ?auto_23543 ) ( HAND-EMPTY ) ( not ( = ?auto_23539 ?auto_23544 ) ) ( not ( = ?auto_23540 ?auto_23544 ) ) ( not ( = ?auto_23541 ?auto_23544 ) ) ( not ( = ?auto_23542 ?auto_23544 ) ) ( not ( = ?auto_23543 ?auto_23544 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23543 ?auto_23544 )
      ( MAKE-5PILE ?auto_23539 ?auto_23540 ?auto_23541 ?auto_23542 ?auto_23543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23545 - BLOCK
      ?auto_23546 - BLOCK
      ?auto_23547 - BLOCK
      ?auto_23548 - BLOCK
      ?auto_23549 - BLOCK
    )
    :vars
    (
      ?auto_23550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23545 ) ( ON ?auto_23546 ?auto_23545 ) ( ON ?auto_23547 ?auto_23546 ) ( not ( = ?auto_23545 ?auto_23546 ) ) ( not ( = ?auto_23545 ?auto_23547 ) ) ( not ( = ?auto_23545 ?auto_23548 ) ) ( not ( = ?auto_23545 ?auto_23549 ) ) ( not ( = ?auto_23546 ?auto_23547 ) ) ( not ( = ?auto_23546 ?auto_23548 ) ) ( not ( = ?auto_23546 ?auto_23549 ) ) ( not ( = ?auto_23547 ?auto_23548 ) ) ( not ( = ?auto_23547 ?auto_23549 ) ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( ON ?auto_23549 ?auto_23550 ) ( CLEAR ?auto_23549 ) ( not ( = ?auto_23545 ?auto_23550 ) ) ( not ( = ?auto_23546 ?auto_23550 ) ) ( not ( = ?auto_23547 ?auto_23550 ) ) ( not ( = ?auto_23548 ?auto_23550 ) ) ( not ( = ?auto_23549 ?auto_23550 ) ) ( HOLDING ?auto_23548 ) ( CLEAR ?auto_23547 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23545 ?auto_23546 ?auto_23547 ?auto_23548 )
      ( MAKE-5PILE ?auto_23545 ?auto_23546 ?auto_23547 ?auto_23548 ?auto_23549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23551 - BLOCK
      ?auto_23552 - BLOCK
      ?auto_23553 - BLOCK
      ?auto_23554 - BLOCK
      ?auto_23555 - BLOCK
    )
    :vars
    (
      ?auto_23556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23551 ) ( ON ?auto_23552 ?auto_23551 ) ( ON ?auto_23553 ?auto_23552 ) ( not ( = ?auto_23551 ?auto_23552 ) ) ( not ( = ?auto_23551 ?auto_23553 ) ) ( not ( = ?auto_23551 ?auto_23554 ) ) ( not ( = ?auto_23551 ?auto_23555 ) ) ( not ( = ?auto_23552 ?auto_23553 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23555 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) ( not ( = ?auto_23553 ?auto_23555 ) ) ( not ( = ?auto_23554 ?auto_23555 ) ) ( ON ?auto_23555 ?auto_23556 ) ( not ( = ?auto_23551 ?auto_23556 ) ) ( not ( = ?auto_23552 ?auto_23556 ) ) ( not ( = ?auto_23553 ?auto_23556 ) ) ( not ( = ?auto_23554 ?auto_23556 ) ) ( not ( = ?auto_23555 ?auto_23556 ) ) ( CLEAR ?auto_23553 ) ( ON ?auto_23554 ?auto_23555 ) ( CLEAR ?auto_23554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23556 ?auto_23555 )
      ( MAKE-5PILE ?auto_23551 ?auto_23552 ?auto_23553 ?auto_23554 ?auto_23555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23557 - BLOCK
      ?auto_23558 - BLOCK
      ?auto_23559 - BLOCK
      ?auto_23560 - BLOCK
      ?auto_23561 - BLOCK
    )
    :vars
    (
      ?auto_23562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23557 ) ( ON ?auto_23558 ?auto_23557 ) ( not ( = ?auto_23557 ?auto_23558 ) ) ( not ( = ?auto_23557 ?auto_23559 ) ) ( not ( = ?auto_23557 ?auto_23560 ) ) ( not ( = ?auto_23557 ?auto_23561 ) ) ( not ( = ?auto_23558 ?auto_23559 ) ) ( not ( = ?auto_23558 ?auto_23560 ) ) ( not ( = ?auto_23558 ?auto_23561 ) ) ( not ( = ?auto_23559 ?auto_23560 ) ) ( not ( = ?auto_23559 ?auto_23561 ) ) ( not ( = ?auto_23560 ?auto_23561 ) ) ( ON ?auto_23561 ?auto_23562 ) ( not ( = ?auto_23557 ?auto_23562 ) ) ( not ( = ?auto_23558 ?auto_23562 ) ) ( not ( = ?auto_23559 ?auto_23562 ) ) ( not ( = ?auto_23560 ?auto_23562 ) ) ( not ( = ?auto_23561 ?auto_23562 ) ) ( ON ?auto_23560 ?auto_23561 ) ( CLEAR ?auto_23560 ) ( ON-TABLE ?auto_23562 ) ( HOLDING ?auto_23559 ) ( CLEAR ?auto_23558 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23557 ?auto_23558 ?auto_23559 )
      ( MAKE-5PILE ?auto_23557 ?auto_23558 ?auto_23559 ?auto_23560 ?auto_23561 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23563 - BLOCK
      ?auto_23564 - BLOCK
      ?auto_23565 - BLOCK
      ?auto_23566 - BLOCK
      ?auto_23567 - BLOCK
    )
    :vars
    (
      ?auto_23568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23563 ) ( ON ?auto_23564 ?auto_23563 ) ( not ( = ?auto_23563 ?auto_23564 ) ) ( not ( = ?auto_23563 ?auto_23565 ) ) ( not ( = ?auto_23563 ?auto_23566 ) ) ( not ( = ?auto_23563 ?auto_23567 ) ) ( not ( = ?auto_23564 ?auto_23565 ) ) ( not ( = ?auto_23564 ?auto_23566 ) ) ( not ( = ?auto_23564 ?auto_23567 ) ) ( not ( = ?auto_23565 ?auto_23566 ) ) ( not ( = ?auto_23565 ?auto_23567 ) ) ( not ( = ?auto_23566 ?auto_23567 ) ) ( ON ?auto_23567 ?auto_23568 ) ( not ( = ?auto_23563 ?auto_23568 ) ) ( not ( = ?auto_23564 ?auto_23568 ) ) ( not ( = ?auto_23565 ?auto_23568 ) ) ( not ( = ?auto_23566 ?auto_23568 ) ) ( not ( = ?auto_23567 ?auto_23568 ) ) ( ON ?auto_23566 ?auto_23567 ) ( ON-TABLE ?auto_23568 ) ( CLEAR ?auto_23564 ) ( ON ?auto_23565 ?auto_23566 ) ( CLEAR ?auto_23565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23568 ?auto_23567 ?auto_23566 )
      ( MAKE-5PILE ?auto_23563 ?auto_23564 ?auto_23565 ?auto_23566 ?auto_23567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23569 - BLOCK
      ?auto_23570 - BLOCK
      ?auto_23571 - BLOCK
      ?auto_23572 - BLOCK
      ?auto_23573 - BLOCK
    )
    :vars
    (
      ?auto_23574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23569 ) ( not ( = ?auto_23569 ?auto_23570 ) ) ( not ( = ?auto_23569 ?auto_23571 ) ) ( not ( = ?auto_23569 ?auto_23572 ) ) ( not ( = ?auto_23569 ?auto_23573 ) ) ( not ( = ?auto_23570 ?auto_23571 ) ) ( not ( = ?auto_23570 ?auto_23572 ) ) ( not ( = ?auto_23570 ?auto_23573 ) ) ( not ( = ?auto_23571 ?auto_23572 ) ) ( not ( = ?auto_23571 ?auto_23573 ) ) ( not ( = ?auto_23572 ?auto_23573 ) ) ( ON ?auto_23573 ?auto_23574 ) ( not ( = ?auto_23569 ?auto_23574 ) ) ( not ( = ?auto_23570 ?auto_23574 ) ) ( not ( = ?auto_23571 ?auto_23574 ) ) ( not ( = ?auto_23572 ?auto_23574 ) ) ( not ( = ?auto_23573 ?auto_23574 ) ) ( ON ?auto_23572 ?auto_23573 ) ( ON-TABLE ?auto_23574 ) ( ON ?auto_23571 ?auto_23572 ) ( CLEAR ?auto_23571 ) ( HOLDING ?auto_23570 ) ( CLEAR ?auto_23569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23569 ?auto_23570 )
      ( MAKE-5PILE ?auto_23569 ?auto_23570 ?auto_23571 ?auto_23572 ?auto_23573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23575 - BLOCK
      ?auto_23576 - BLOCK
      ?auto_23577 - BLOCK
      ?auto_23578 - BLOCK
      ?auto_23579 - BLOCK
    )
    :vars
    (
      ?auto_23580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23575 ) ( not ( = ?auto_23575 ?auto_23576 ) ) ( not ( = ?auto_23575 ?auto_23577 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23579 ) ) ( not ( = ?auto_23576 ?auto_23577 ) ) ( not ( = ?auto_23576 ?auto_23578 ) ) ( not ( = ?auto_23576 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23578 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23578 ?auto_23579 ) ) ( ON ?auto_23579 ?auto_23580 ) ( not ( = ?auto_23575 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( not ( = ?auto_23577 ?auto_23580 ) ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23579 ?auto_23580 ) ) ( ON ?auto_23578 ?auto_23579 ) ( ON-TABLE ?auto_23580 ) ( ON ?auto_23577 ?auto_23578 ) ( CLEAR ?auto_23575 ) ( ON ?auto_23576 ?auto_23577 ) ( CLEAR ?auto_23576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23580 ?auto_23579 ?auto_23578 ?auto_23577 )
      ( MAKE-5PILE ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 ?auto_23579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23581 - BLOCK
      ?auto_23582 - BLOCK
      ?auto_23583 - BLOCK
      ?auto_23584 - BLOCK
      ?auto_23585 - BLOCK
    )
    :vars
    (
      ?auto_23586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23581 ?auto_23582 ) ) ( not ( = ?auto_23581 ?auto_23583 ) ) ( not ( = ?auto_23581 ?auto_23584 ) ) ( not ( = ?auto_23581 ?auto_23585 ) ) ( not ( = ?auto_23582 ?auto_23583 ) ) ( not ( = ?auto_23582 ?auto_23584 ) ) ( not ( = ?auto_23582 ?auto_23585 ) ) ( not ( = ?auto_23583 ?auto_23584 ) ) ( not ( = ?auto_23583 ?auto_23585 ) ) ( not ( = ?auto_23584 ?auto_23585 ) ) ( ON ?auto_23585 ?auto_23586 ) ( not ( = ?auto_23581 ?auto_23586 ) ) ( not ( = ?auto_23582 ?auto_23586 ) ) ( not ( = ?auto_23583 ?auto_23586 ) ) ( not ( = ?auto_23584 ?auto_23586 ) ) ( not ( = ?auto_23585 ?auto_23586 ) ) ( ON ?auto_23584 ?auto_23585 ) ( ON-TABLE ?auto_23586 ) ( ON ?auto_23583 ?auto_23584 ) ( ON ?auto_23582 ?auto_23583 ) ( CLEAR ?auto_23582 ) ( HOLDING ?auto_23581 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23581 )
      ( MAKE-5PILE ?auto_23581 ?auto_23582 ?auto_23583 ?auto_23584 ?auto_23585 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23587 - BLOCK
      ?auto_23588 - BLOCK
      ?auto_23589 - BLOCK
      ?auto_23590 - BLOCK
      ?auto_23591 - BLOCK
    )
    :vars
    (
      ?auto_23592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23587 ?auto_23588 ) ) ( not ( = ?auto_23587 ?auto_23589 ) ) ( not ( = ?auto_23587 ?auto_23590 ) ) ( not ( = ?auto_23587 ?auto_23591 ) ) ( not ( = ?auto_23588 ?auto_23589 ) ) ( not ( = ?auto_23588 ?auto_23590 ) ) ( not ( = ?auto_23588 ?auto_23591 ) ) ( not ( = ?auto_23589 ?auto_23590 ) ) ( not ( = ?auto_23589 ?auto_23591 ) ) ( not ( = ?auto_23590 ?auto_23591 ) ) ( ON ?auto_23591 ?auto_23592 ) ( not ( = ?auto_23587 ?auto_23592 ) ) ( not ( = ?auto_23588 ?auto_23592 ) ) ( not ( = ?auto_23589 ?auto_23592 ) ) ( not ( = ?auto_23590 ?auto_23592 ) ) ( not ( = ?auto_23591 ?auto_23592 ) ) ( ON ?auto_23590 ?auto_23591 ) ( ON-TABLE ?auto_23592 ) ( ON ?auto_23589 ?auto_23590 ) ( ON ?auto_23588 ?auto_23589 ) ( ON ?auto_23587 ?auto_23588 ) ( CLEAR ?auto_23587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23592 ?auto_23591 ?auto_23590 ?auto_23589 ?auto_23588 )
      ( MAKE-5PILE ?auto_23587 ?auto_23588 ?auto_23589 ?auto_23590 ?auto_23591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23597 - BLOCK
      ?auto_23598 - BLOCK
      ?auto_23599 - BLOCK
      ?auto_23600 - BLOCK
    )
    :vars
    (
      ?auto_23601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23601 ?auto_23600 ) ( CLEAR ?auto_23601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23597 ) ( ON ?auto_23598 ?auto_23597 ) ( ON ?auto_23599 ?auto_23598 ) ( ON ?auto_23600 ?auto_23599 ) ( not ( = ?auto_23597 ?auto_23598 ) ) ( not ( = ?auto_23597 ?auto_23599 ) ) ( not ( = ?auto_23597 ?auto_23600 ) ) ( not ( = ?auto_23597 ?auto_23601 ) ) ( not ( = ?auto_23598 ?auto_23599 ) ) ( not ( = ?auto_23598 ?auto_23600 ) ) ( not ( = ?auto_23598 ?auto_23601 ) ) ( not ( = ?auto_23599 ?auto_23600 ) ) ( not ( = ?auto_23599 ?auto_23601 ) ) ( not ( = ?auto_23600 ?auto_23601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23601 ?auto_23600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23613 - BLOCK
      ?auto_23614 - BLOCK
      ?auto_23615 - BLOCK
      ?auto_23616 - BLOCK
    )
    :vars
    (
      ?auto_23617 - BLOCK
      ?auto_23618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23613 ) ( ON ?auto_23614 ?auto_23613 ) ( ON ?auto_23615 ?auto_23614 ) ( not ( = ?auto_23613 ?auto_23614 ) ) ( not ( = ?auto_23613 ?auto_23615 ) ) ( not ( = ?auto_23613 ?auto_23616 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( not ( = ?auto_23614 ?auto_23615 ) ) ( not ( = ?auto_23614 ?auto_23616 ) ) ( not ( = ?auto_23614 ?auto_23617 ) ) ( not ( = ?auto_23615 ?auto_23616 ) ) ( not ( = ?auto_23615 ?auto_23617 ) ) ( not ( = ?auto_23616 ?auto_23617 ) ) ( ON ?auto_23617 ?auto_23618 ) ( CLEAR ?auto_23617 ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23614 ?auto_23618 ) ) ( not ( = ?auto_23615 ?auto_23618 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( not ( = ?auto_23617 ?auto_23618 ) ) ( HOLDING ?auto_23616 ) ( CLEAR ?auto_23615 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23613 ?auto_23614 ?auto_23615 ?auto_23616 ?auto_23617 )
      ( MAKE-4PILE ?auto_23613 ?auto_23614 ?auto_23615 ?auto_23616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23619 - BLOCK
      ?auto_23620 - BLOCK
      ?auto_23621 - BLOCK
      ?auto_23622 - BLOCK
    )
    :vars
    (
      ?auto_23624 - BLOCK
      ?auto_23623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23619 ) ( ON ?auto_23620 ?auto_23619 ) ( ON ?auto_23621 ?auto_23620 ) ( not ( = ?auto_23619 ?auto_23620 ) ) ( not ( = ?auto_23619 ?auto_23621 ) ) ( not ( = ?auto_23619 ?auto_23622 ) ) ( not ( = ?auto_23619 ?auto_23624 ) ) ( not ( = ?auto_23620 ?auto_23621 ) ) ( not ( = ?auto_23620 ?auto_23622 ) ) ( not ( = ?auto_23620 ?auto_23624 ) ) ( not ( = ?auto_23621 ?auto_23622 ) ) ( not ( = ?auto_23621 ?auto_23624 ) ) ( not ( = ?auto_23622 ?auto_23624 ) ) ( ON ?auto_23624 ?auto_23623 ) ( not ( = ?auto_23619 ?auto_23623 ) ) ( not ( = ?auto_23620 ?auto_23623 ) ) ( not ( = ?auto_23621 ?auto_23623 ) ) ( not ( = ?auto_23622 ?auto_23623 ) ) ( not ( = ?auto_23624 ?auto_23623 ) ) ( CLEAR ?auto_23621 ) ( ON ?auto_23622 ?auto_23624 ) ( CLEAR ?auto_23622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23623 ?auto_23624 )
      ( MAKE-4PILE ?auto_23619 ?auto_23620 ?auto_23621 ?auto_23622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23625 - BLOCK
      ?auto_23626 - BLOCK
      ?auto_23627 - BLOCK
      ?auto_23628 - BLOCK
    )
    :vars
    (
      ?auto_23630 - BLOCK
      ?auto_23629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23625 ) ( ON ?auto_23626 ?auto_23625 ) ( not ( = ?auto_23625 ?auto_23626 ) ) ( not ( = ?auto_23625 ?auto_23627 ) ) ( not ( = ?auto_23625 ?auto_23628 ) ) ( not ( = ?auto_23625 ?auto_23630 ) ) ( not ( = ?auto_23626 ?auto_23627 ) ) ( not ( = ?auto_23626 ?auto_23628 ) ) ( not ( = ?auto_23626 ?auto_23630 ) ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( not ( = ?auto_23627 ?auto_23630 ) ) ( not ( = ?auto_23628 ?auto_23630 ) ) ( ON ?auto_23630 ?auto_23629 ) ( not ( = ?auto_23625 ?auto_23629 ) ) ( not ( = ?auto_23626 ?auto_23629 ) ) ( not ( = ?auto_23627 ?auto_23629 ) ) ( not ( = ?auto_23628 ?auto_23629 ) ) ( not ( = ?auto_23630 ?auto_23629 ) ) ( ON ?auto_23628 ?auto_23630 ) ( CLEAR ?auto_23628 ) ( ON-TABLE ?auto_23629 ) ( HOLDING ?auto_23627 ) ( CLEAR ?auto_23626 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23625 ?auto_23626 ?auto_23627 )
      ( MAKE-4PILE ?auto_23625 ?auto_23626 ?auto_23627 ?auto_23628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23631 - BLOCK
      ?auto_23632 - BLOCK
      ?auto_23633 - BLOCK
      ?auto_23634 - BLOCK
    )
    :vars
    (
      ?auto_23636 - BLOCK
      ?auto_23635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23631 ) ( ON ?auto_23632 ?auto_23631 ) ( not ( = ?auto_23631 ?auto_23632 ) ) ( not ( = ?auto_23631 ?auto_23633 ) ) ( not ( = ?auto_23631 ?auto_23634 ) ) ( not ( = ?auto_23631 ?auto_23636 ) ) ( not ( = ?auto_23632 ?auto_23633 ) ) ( not ( = ?auto_23632 ?auto_23634 ) ) ( not ( = ?auto_23632 ?auto_23636 ) ) ( not ( = ?auto_23633 ?auto_23634 ) ) ( not ( = ?auto_23633 ?auto_23636 ) ) ( not ( = ?auto_23634 ?auto_23636 ) ) ( ON ?auto_23636 ?auto_23635 ) ( not ( = ?auto_23631 ?auto_23635 ) ) ( not ( = ?auto_23632 ?auto_23635 ) ) ( not ( = ?auto_23633 ?auto_23635 ) ) ( not ( = ?auto_23634 ?auto_23635 ) ) ( not ( = ?auto_23636 ?auto_23635 ) ) ( ON ?auto_23634 ?auto_23636 ) ( ON-TABLE ?auto_23635 ) ( CLEAR ?auto_23632 ) ( ON ?auto_23633 ?auto_23634 ) ( CLEAR ?auto_23633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23635 ?auto_23636 ?auto_23634 )
      ( MAKE-4PILE ?auto_23631 ?auto_23632 ?auto_23633 ?auto_23634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23637 - BLOCK
      ?auto_23638 - BLOCK
      ?auto_23639 - BLOCK
      ?auto_23640 - BLOCK
    )
    :vars
    (
      ?auto_23642 - BLOCK
      ?auto_23641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23637 ) ( not ( = ?auto_23637 ?auto_23638 ) ) ( not ( = ?auto_23637 ?auto_23639 ) ) ( not ( = ?auto_23637 ?auto_23640 ) ) ( not ( = ?auto_23637 ?auto_23642 ) ) ( not ( = ?auto_23638 ?auto_23639 ) ) ( not ( = ?auto_23638 ?auto_23640 ) ) ( not ( = ?auto_23638 ?auto_23642 ) ) ( not ( = ?auto_23639 ?auto_23640 ) ) ( not ( = ?auto_23639 ?auto_23642 ) ) ( not ( = ?auto_23640 ?auto_23642 ) ) ( ON ?auto_23642 ?auto_23641 ) ( not ( = ?auto_23637 ?auto_23641 ) ) ( not ( = ?auto_23638 ?auto_23641 ) ) ( not ( = ?auto_23639 ?auto_23641 ) ) ( not ( = ?auto_23640 ?auto_23641 ) ) ( not ( = ?auto_23642 ?auto_23641 ) ) ( ON ?auto_23640 ?auto_23642 ) ( ON-TABLE ?auto_23641 ) ( ON ?auto_23639 ?auto_23640 ) ( CLEAR ?auto_23639 ) ( HOLDING ?auto_23638 ) ( CLEAR ?auto_23637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23637 ?auto_23638 )
      ( MAKE-4PILE ?auto_23637 ?auto_23638 ?auto_23639 ?auto_23640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23643 - BLOCK
      ?auto_23644 - BLOCK
      ?auto_23645 - BLOCK
      ?auto_23646 - BLOCK
    )
    :vars
    (
      ?auto_23647 - BLOCK
      ?auto_23648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23643 ) ( not ( = ?auto_23643 ?auto_23644 ) ) ( not ( = ?auto_23643 ?auto_23645 ) ) ( not ( = ?auto_23643 ?auto_23646 ) ) ( not ( = ?auto_23643 ?auto_23647 ) ) ( not ( = ?auto_23644 ?auto_23645 ) ) ( not ( = ?auto_23644 ?auto_23646 ) ) ( not ( = ?auto_23644 ?auto_23647 ) ) ( not ( = ?auto_23645 ?auto_23646 ) ) ( not ( = ?auto_23645 ?auto_23647 ) ) ( not ( = ?auto_23646 ?auto_23647 ) ) ( ON ?auto_23647 ?auto_23648 ) ( not ( = ?auto_23643 ?auto_23648 ) ) ( not ( = ?auto_23644 ?auto_23648 ) ) ( not ( = ?auto_23645 ?auto_23648 ) ) ( not ( = ?auto_23646 ?auto_23648 ) ) ( not ( = ?auto_23647 ?auto_23648 ) ) ( ON ?auto_23646 ?auto_23647 ) ( ON-TABLE ?auto_23648 ) ( ON ?auto_23645 ?auto_23646 ) ( CLEAR ?auto_23643 ) ( ON ?auto_23644 ?auto_23645 ) ( CLEAR ?auto_23644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23648 ?auto_23647 ?auto_23646 ?auto_23645 )
      ( MAKE-4PILE ?auto_23643 ?auto_23644 ?auto_23645 ?auto_23646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23649 - BLOCK
      ?auto_23650 - BLOCK
      ?auto_23651 - BLOCK
      ?auto_23652 - BLOCK
    )
    :vars
    (
      ?auto_23654 - BLOCK
      ?auto_23653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23649 ?auto_23650 ) ) ( not ( = ?auto_23649 ?auto_23651 ) ) ( not ( = ?auto_23649 ?auto_23652 ) ) ( not ( = ?auto_23649 ?auto_23654 ) ) ( not ( = ?auto_23650 ?auto_23651 ) ) ( not ( = ?auto_23650 ?auto_23652 ) ) ( not ( = ?auto_23650 ?auto_23654 ) ) ( not ( = ?auto_23651 ?auto_23652 ) ) ( not ( = ?auto_23651 ?auto_23654 ) ) ( not ( = ?auto_23652 ?auto_23654 ) ) ( ON ?auto_23654 ?auto_23653 ) ( not ( = ?auto_23649 ?auto_23653 ) ) ( not ( = ?auto_23650 ?auto_23653 ) ) ( not ( = ?auto_23651 ?auto_23653 ) ) ( not ( = ?auto_23652 ?auto_23653 ) ) ( not ( = ?auto_23654 ?auto_23653 ) ) ( ON ?auto_23652 ?auto_23654 ) ( ON-TABLE ?auto_23653 ) ( ON ?auto_23651 ?auto_23652 ) ( ON ?auto_23650 ?auto_23651 ) ( CLEAR ?auto_23650 ) ( HOLDING ?auto_23649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23649 )
      ( MAKE-4PILE ?auto_23649 ?auto_23650 ?auto_23651 ?auto_23652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23655 - BLOCK
      ?auto_23656 - BLOCK
      ?auto_23657 - BLOCK
      ?auto_23658 - BLOCK
    )
    :vars
    (
      ?auto_23660 - BLOCK
      ?auto_23659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23655 ?auto_23656 ) ) ( not ( = ?auto_23655 ?auto_23657 ) ) ( not ( = ?auto_23655 ?auto_23658 ) ) ( not ( = ?auto_23655 ?auto_23660 ) ) ( not ( = ?auto_23656 ?auto_23657 ) ) ( not ( = ?auto_23656 ?auto_23658 ) ) ( not ( = ?auto_23656 ?auto_23660 ) ) ( not ( = ?auto_23657 ?auto_23658 ) ) ( not ( = ?auto_23657 ?auto_23660 ) ) ( not ( = ?auto_23658 ?auto_23660 ) ) ( ON ?auto_23660 ?auto_23659 ) ( not ( = ?auto_23655 ?auto_23659 ) ) ( not ( = ?auto_23656 ?auto_23659 ) ) ( not ( = ?auto_23657 ?auto_23659 ) ) ( not ( = ?auto_23658 ?auto_23659 ) ) ( not ( = ?auto_23660 ?auto_23659 ) ) ( ON ?auto_23658 ?auto_23660 ) ( ON-TABLE ?auto_23659 ) ( ON ?auto_23657 ?auto_23658 ) ( ON ?auto_23656 ?auto_23657 ) ( ON ?auto_23655 ?auto_23656 ) ( CLEAR ?auto_23655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23659 ?auto_23660 ?auto_23658 ?auto_23657 ?auto_23656 )
      ( MAKE-4PILE ?auto_23655 ?auto_23656 ?auto_23657 ?auto_23658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23662 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23662 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23663 - BLOCK
    )
    :vars
    (
      ?auto_23664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23663 ?auto_23664 ) ( CLEAR ?auto_23663 ) ( HAND-EMPTY ) ( not ( = ?auto_23663 ?auto_23664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23663 ?auto_23664 )
      ( MAKE-1PILE ?auto_23663 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23665 - BLOCK
    )
    :vars
    (
      ?auto_23666 - BLOCK
      ?auto_23667 - BLOCK
      ?auto_23668 - BLOCK
      ?auto_23669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23665 ?auto_23666 ) ) ( HOLDING ?auto_23665 ) ( CLEAR ?auto_23666 ) ( ON-TABLE ?auto_23667 ) ( ON ?auto_23668 ?auto_23667 ) ( ON ?auto_23669 ?auto_23668 ) ( ON ?auto_23666 ?auto_23669 ) ( not ( = ?auto_23667 ?auto_23668 ) ) ( not ( = ?auto_23667 ?auto_23669 ) ) ( not ( = ?auto_23667 ?auto_23666 ) ) ( not ( = ?auto_23667 ?auto_23665 ) ) ( not ( = ?auto_23668 ?auto_23669 ) ) ( not ( = ?auto_23668 ?auto_23666 ) ) ( not ( = ?auto_23668 ?auto_23665 ) ) ( not ( = ?auto_23669 ?auto_23666 ) ) ( not ( = ?auto_23669 ?auto_23665 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23667 ?auto_23668 ?auto_23669 ?auto_23666 ?auto_23665 )
      ( MAKE-1PILE ?auto_23665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23670 - BLOCK
    )
    :vars
    (
      ?auto_23674 - BLOCK
      ?auto_23672 - BLOCK
      ?auto_23671 - BLOCK
      ?auto_23673 - BLOCK
      ?auto_23675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23670 ?auto_23674 ) ) ( CLEAR ?auto_23674 ) ( ON-TABLE ?auto_23672 ) ( ON ?auto_23671 ?auto_23672 ) ( ON ?auto_23673 ?auto_23671 ) ( ON ?auto_23674 ?auto_23673 ) ( not ( = ?auto_23672 ?auto_23671 ) ) ( not ( = ?auto_23672 ?auto_23673 ) ) ( not ( = ?auto_23672 ?auto_23674 ) ) ( not ( = ?auto_23672 ?auto_23670 ) ) ( not ( = ?auto_23671 ?auto_23673 ) ) ( not ( = ?auto_23671 ?auto_23674 ) ) ( not ( = ?auto_23671 ?auto_23670 ) ) ( not ( = ?auto_23673 ?auto_23674 ) ) ( not ( = ?auto_23673 ?auto_23670 ) ) ( ON ?auto_23670 ?auto_23675 ) ( CLEAR ?auto_23670 ) ( HAND-EMPTY ) ( not ( = ?auto_23670 ?auto_23675 ) ) ( not ( = ?auto_23674 ?auto_23675 ) ) ( not ( = ?auto_23672 ?auto_23675 ) ) ( not ( = ?auto_23671 ?auto_23675 ) ) ( not ( = ?auto_23673 ?auto_23675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23670 ?auto_23675 )
      ( MAKE-1PILE ?auto_23670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23676 - BLOCK
    )
    :vars
    (
      ?auto_23681 - BLOCK
      ?auto_23678 - BLOCK
      ?auto_23679 - BLOCK
      ?auto_23680 - BLOCK
      ?auto_23677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23676 ?auto_23681 ) ) ( ON-TABLE ?auto_23678 ) ( ON ?auto_23679 ?auto_23678 ) ( ON ?auto_23680 ?auto_23679 ) ( not ( = ?auto_23678 ?auto_23679 ) ) ( not ( = ?auto_23678 ?auto_23680 ) ) ( not ( = ?auto_23678 ?auto_23681 ) ) ( not ( = ?auto_23678 ?auto_23676 ) ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23676 ) ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23676 ) ) ( ON ?auto_23676 ?auto_23677 ) ( CLEAR ?auto_23676 ) ( not ( = ?auto_23676 ?auto_23677 ) ) ( not ( = ?auto_23681 ?auto_23677 ) ) ( not ( = ?auto_23678 ?auto_23677 ) ) ( not ( = ?auto_23679 ?auto_23677 ) ) ( not ( = ?auto_23680 ?auto_23677 ) ) ( HOLDING ?auto_23681 ) ( CLEAR ?auto_23680 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23678 ?auto_23679 ?auto_23680 ?auto_23681 )
      ( MAKE-1PILE ?auto_23676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23682 - BLOCK
    )
    :vars
    (
      ?auto_23683 - BLOCK
      ?auto_23684 - BLOCK
      ?auto_23685 - BLOCK
      ?auto_23686 - BLOCK
      ?auto_23687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23682 ?auto_23683 ) ) ( ON-TABLE ?auto_23684 ) ( ON ?auto_23685 ?auto_23684 ) ( ON ?auto_23686 ?auto_23685 ) ( not ( = ?auto_23684 ?auto_23685 ) ) ( not ( = ?auto_23684 ?auto_23686 ) ) ( not ( = ?auto_23684 ?auto_23683 ) ) ( not ( = ?auto_23684 ?auto_23682 ) ) ( not ( = ?auto_23685 ?auto_23686 ) ) ( not ( = ?auto_23685 ?auto_23683 ) ) ( not ( = ?auto_23685 ?auto_23682 ) ) ( not ( = ?auto_23686 ?auto_23683 ) ) ( not ( = ?auto_23686 ?auto_23682 ) ) ( ON ?auto_23682 ?auto_23687 ) ( not ( = ?auto_23682 ?auto_23687 ) ) ( not ( = ?auto_23683 ?auto_23687 ) ) ( not ( = ?auto_23684 ?auto_23687 ) ) ( not ( = ?auto_23685 ?auto_23687 ) ) ( not ( = ?auto_23686 ?auto_23687 ) ) ( CLEAR ?auto_23686 ) ( ON ?auto_23683 ?auto_23682 ) ( CLEAR ?auto_23683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23687 ?auto_23682 )
      ( MAKE-1PILE ?auto_23682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23688 - BLOCK
    )
    :vars
    (
      ?auto_23691 - BLOCK
      ?auto_23692 - BLOCK
      ?auto_23689 - BLOCK
      ?auto_23690 - BLOCK
      ?auto_23693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23688 ?auto_23691 ) ) ( ON-TABLE ?auto_23692 ) ( ON ?auto_23689 ?auto_23692 ) ( not ( = ?auto_23692 ?auto_23689 ) ) ( not ( = ?auto_23692 ?auto_23690 ) ) ( not ( = ?auto_23692 ?auto_23691 ) ) ( not ( = ?auto_23692 ?auto_23688 ) ) ( not ( = ?auto_23689 ?auto_23690 ) ) ( not ( = ?auto_23689 ?auto_23691 ) ) ( not ( = ?auto_23689 ?auto_23688 ) ) ( not ( = ?auto_23690 ?auto_23691 ) ) ( not ( = ?auto_23690 ?auto_23688 ) ) ( ON ?auto_23688 ?auto_23693 ) ( not ( = ?auto_23688 ?auto_23693 ) ) ( not ( = ?auto_23691 ?auto_23693 ) ) ( not ( = ?auto_23692 ?auto_23693 ) ) ( not ( = ?auto_23689 ?auto_23693 ) ) ( not ( = ?auto_23690 ?auto_23693 ) ) ( ON ?auto_23691 ?auto_23688 ) ( CLEAR ?auto_23691 ) ( ON-TABLE ?auto_23693 ) ( HOLDING ?auto_23690 ) ( CLEAR ?auto_23689 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23692 ?auto_23689 ?auto_23690 )
      ( MAKE-1PILE ?auto_23688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23694 - BLOCK
    )
    :vars
    (
      ?auto_23697 - BLOCK
      ?auto_23699 - BLOCK
      ?auto_23696 - BLOCK
      ?auto_23698 - BLOCK
      ?auto_23695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23694 ?auto_23697 ) ) ( ON-TABLE ?auto_23699 ) ( ON ?auto_23696 ?auto_23699 ) ( not ( = ?auto_23699 ?auto_23696 ) ) ( not ( = ?auto_23699 ?auto_23698 ) ) ( not ( = ?auto_23699 ?auto_23697 ) ) ( not ( = ?auto_23699 ?auto_23694 ) ) ( not ( = ?auto_23696 ?auto_23698 ) ) ( not ( = ?auto_23696 ?auto_23697 ) ) ( not ( = ?auto_23696 ?auto_23694 ) ) ( not ( = ?auto_23698 ?auto_23697 ) ) ( not ( = ?auto_23698 ?auto_23694 ) ) ( ON ?auto_23694 ?auto_23695 ) ( not ( = ?auto_23694 ?auto_23695 ) ) ( not ( = ?auto_23697 ?auto_23695 ) ) ( not ( = ?auto_23699 ?auto_23695 ) ) ( not ( = ?auto_23696 ?auto_23695 ) ) ( not ( = ?auto_23698 ?auto_23695 ) ) ( ON ?auto_23697 ?auto_23694 ) ( ON-TABLE ?auto_23695 ) ( CLEAR ?auto_23696 ) ( ON ?auto_23698 ?auto_23697 ) ( CLEAR ?auto_23698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23695 ?auto_23694 ?auto_23697 )
      ( MAKE-1PILE ?auto_23694 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23700 - BLOCK
    )
    :vars
    (
      ?auto_23704 - BLOCK
      ?auto_23703 - BLOCK
      ?auto_23701 - BLOCK
      ?auto_23705 - BLOCK
      ?auto_23702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23700 ?auto_23704 ) ) ( ON-TABLE ?auto_23703 ) ( not ( = ?auto_23703 ?auto_23701 ) ) ( not ( = ?auto_23703 ?auto_23705 ) ) ( not ( = ?auto_23703 ?auto_23704 ) ) ( not ( = ?auto_23703 ?auto_23700 ) ) ( not ( = ?auto_23701 ?auto_23705 ) ) ( not ( = ?auto_23701 ?auto_23704 ) ) ( not ( = ?auto_23701 ?auto_23700 ) ) ( not ( = ?auto_23705 ?auto_23704 ) ) ( not ( = ?auto_23705 ?auto_23700 ) ) ( ON ?auto_23700 ?auto_23702 ) ( not ( = ?auto_23700 ?auto_23702 ) ) ( not ( = ?auto_23704 ?auto_23702 ) ) ( not ( = ?auto_23703 ?auto_23702 ) ) ( not ( = ?auto_23701 ?auto_23702 ) ) ( not ( = ?auto_23705 ?auto_23702 ) ) ( ON ?auto_23704 ?auto_23700 ) ( ON-TABLE ?auto_23702 ) ( ON ?auto_23705 ?auto_23704 ) ( CLEAR ?auto_23705 ) ( HOLDING ?auto_23701 ) ( CLEAR ?auto_23703 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23703 ?auto_23701 )
      ( MAKE-1PILE ?auto_23700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23706 - BLOCK
    )
    :vars
    (
      ?auto_23708 - BLOCK
      ?auto_23709 - BLOCK
      ?auto_23707 - BLOCK
      ?auto_23711 - BLOCK
      ?auto_23710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23706 ?auto_23708 ) ) ( ON-TABLE ?auto_23709 ) ( not ( = ?auto_23709 ?auto_23707 ) ) ( not ( = ?auto_23709 ?auto_23711 ) ) ( not ( = ?auto_23709 ?auto_23708 ) ) ( not ( = ?auto_23709 ?auto_23706 ) ) ( not ( = ?auto_23707 ?auto_23711 ) ) ( not ( = ?auto_23707 ?auto_23708 ) ) ( not ( = ?auto_23707 ?auto_23706 ) ) ( not ( = ?auto_23711 ?auto_23708 ) ) ( not ( = ?auto_23711 ?auto_23706 ) ) ( ON ?auto_23706 ?auto_23710 ) ( not ( = ?auto_23706 ?auto_23710 ) ) ( not ( = ?auto_23708 ?auto_23710 ) ) ( not ( = ?auto_23709 ?auto_23710 ) ) ( not ( = ?auto_23707 ?auto_23710 ) ) ( not ( = ?auto_23711 ?auto_23710 ) ) ( ON ?auto_23708 ?auto_23706 ) ( ON-TABLE ?auto_23710 ) ( ON ?auto_23711 ?auto_23708 ) ( CLEAR ?auto_23709 ) ( ON ?auto_23707 ?auto_23711 ) ( CLEAR ?auto_23707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23710 ?auto_23706 ?auto_23708 ?auto_23711 )
      ( MAKE-1PILE ?auto_23706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23712 - BLOCK
    )
    :vars
    (
      ?auto_23713 - BLOCK
      ?auto_23715 - BLOCK
      ?auto_23714 - BLOCK
      ?auto_23717 - BLOCK
      ?auto_23716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23712 ?auto_23713 ) ) ( not ( = ?auto_23715 ?auto_23714 ) ) ( not ( = ?auto_23715 ?auto_23717 ) ) ( not ( = ?auto_23715 ?auto_23713 ) ) ( not ( = ?auto_23715 ?auto_23712 ) ) ( not ( = ?auto_23714 ?auto_23717 ) ) ( not ( = ?auto_23714 ?auto_23713 ) ) ( not ( = ?auto_23714 ?auto_23712 ) ) ( not ( = ?auto_23717 ?auto_23713 ) ) ( not ( = ?auto_23717 ?auto_23712 ) ) ( ON ?auto_23712 ?auto_23716 ) ( not ( = ?auto_23712 ?auto_23716 ) ) ( not ( = ?auto_23713 ?auto_23716 ) ) ( not ( = ?auto_23715 ?auto_23716 ) ) ( not ( = ?auto_23714 ?auto_23716 ) ) ( not ( = ?auto_23717 ?auto_23716 ) ) ( ON ?auto_23713 ?auto_23712 ) ( ON-TABLE ?auto_23716 ) ( ON ?auto_23717 ?auto_23713 ) ( ON ?auto_23714 ?auto_23717 ) ( CLEAR ?auto_23714 ) ( HOLDING ?auto_23715 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23715 )
      ( MAKE-1PILE ?auto_23712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_23718 - BLOCK
    )
    :vars
    (
      ?auto_23719 - BLOCK
      ?auto_23723 - BLOCK
      ?auto_23722 - BLOCK
      ?auto_23720 - BLOCK
      ?auto_23721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23718 ?auto_23719 ) ) ( not ( = ?auto_23723 ?auto_23722 ) ) ( not ( = ?auto_23723 ?auto_23720 ) ) ( not ( = ?auto_23723 ?auto_23719 ) ) ( not ( = ?auto_23723 ?auto_23718 ) ) ( not ( = ?auto_23722 ?auto_23720 ) ) ( not ( = ?auto_23722 ?auto_23719 ) ) ( not ( = ?auto_23722 ?auto_23718 ) ) ( not ( = ?auto_23720 ?auto_23719 ) ) ( not ( = ?auto_23720 ?auto_23718 ) ) ( ON ?auto_23718 ?auto_23721 ) ( not ( = ?auto_23718 ?auto_23721 ) ) ( not ( = ?auto_23719 ?auto_23721 ) ) ( not ( = ?auto_23723 ?auto_23721 ) ) ( not ( = ?auto_23722 ?auto_23721 ) ) ( not ( = ?auto_23720 ?auto_23721 ) ) ( ON ?auto_23719 ?auto_23718 ) ( ON-TABLE ?auto_23721 ) ( ON ?auto_23720 ?auto_23719 ) ( ON ?auto_23722 ?auto_23720 ) ( ON ?auto_23723 ?auto_23722 ) ( CLEAR ?auto_23723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23721 ?auto_23718 ?auto_23719 ?auto_23720 ?auto_23722 )
      ( MAKE-1PILE ?auto_23718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23727 - BLOCK
      ?auto_23728 - BLOCK
      ?auto_23729 - BLOCK
    )
    :vars
    (
      ?auto_23730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23730 ?auto_23729 ) ( CLEAR ?auto_23730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23727 ) ( ON ?auto_23728 ?auto_23727 ) ( ON ?auto_23729 ?auto_23728 ) ( not ( = ?auto_23727 ?auto_23728 ) ) ( not ( = ?auto_23727 ?auto_23729 ) ) ( not ( = ?auto_23727 ?auto_23730 ) ) ( not ( = ?auto_23728 ?auto_23729 ) ) ( not ( = ?auto_23728 ?auto_23730 ) ) ( not ( = ?auto_23729 ?auto_23730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23730 ?auto_23729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23731 - BLOCK
      ?auto_23732 - BLOCK
      ?auto_23733 - BLOCK
    )
    :vars
    (
      ?auto_23734 - BLOCK
      ?auto_23735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23734 ?auto_23733 ) ( CLEAR ?auto_23734 ) ( ON-TABLE ?auto_23731 ) ( ON ?auto_23732 ?auto_23731 ) ( ON ?auto_23733 ?auto_23732 ) ( not ( = ?auto_23731 ?auto_23732 ) ) ( not ( = ?auto_23731 ?auto_23733 ) ) ( not ( = ?auto_23731 ?auto_23734 ) ) ( not ( = ?auto_23732 ?auto_23733 ) ) ( not ( = ?auto_23732 ?auto_23734 ) ) ( not ( = ?auto_23733 ?auto_23734 ) ) ( HOLDING ?auto_23735 ) ( not ( = ?auto_23731 ?auto_23735 ) ) ( not ( = ?auto_23732 ?auto_23735 ) ) ( not ( = ?auto_23733 ?auto_23735 ) ) ( not ( = ?auto_23734 ?auto_23735 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_23735 )
      ( MAKE-3PILE ?auto_23731 ?auto_23732 ?auto_23733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23736 - BLOCK
      ?auto_23737 - BLOCK
      ?auto_23738 - BLOCK
    )
    :vars
    (
      ?auto_23739 - BLOCK
      ?auto_23740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23739 ?auto_23738 ) ( ON-TABLE ?auto_23736 ) ( ON ?auto_23737 ?auto_23736 ) ( ON ?auto_23738 ?auto_23737 ) ( not ( = ?auto_23736 ?auto_23737 ) ) ( not ( = ?auto_23736 ?auto_23738 ) ) ( not ( = ?auto_23736 ?auto_23739 ) ) ( not ( = ?auto_23737 ?auto_23738 ) ) ( not ( = ?auto_23737 ?auto_23739 ) ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( not ( = ?auto_23736 ?auto_23740 ) ) ( not ( = ?auto_23737 ?auto_23740 ) ) ( not ( = ?auto_23738 ?auto_23740 ) ) ( not ( = ?auto_23739 ?auto_23740 ) ) ( ON ?auto_23740 ?auto_23739 ) ( CLEAR ?auto_23740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23736 ?auto_23737 ?auto_23738 ?auto_23739 )
      ( MAKE-3PILE ?auto_23736 ?auto_23737 ?auto_23738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23741 - BLOCK
      ?auto_23742 - BLOCK
      ?auto_23743 - BLOCK
    )
    :vars
    (
      ?auto_23745 - BLOCK
      ?auto_23744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23745 ?auto_23743 ) ( ON-TABLE ?auto_23741 ) ( ON ?auto_23742 ?auto_23741 ) ( ON ?auto_23743 ?auto_23742 ) ( not ( = ?auto_23741 ?auto_23742 ) ) ( not ( = ?auto_23741 ?auto_23743 ) ) ( not ( = ?auto_23741 ?auto_23745 ) ) ( not ( = ?auto_23742 ?auto_23743 ) ) ( not ( = ?auto_23742 ?auto_23745 ) ) ( not ( = ?auto_23743 ?auto_23745 ) ) ( not ( = ?auto_23741 ?auto_23744 ) ) ( not ( = ?auto_23742 ?auto_23744 ) ) ( not ( = ?auto_23743 ?auto_23744 ) ) ( not ( = ?auto_23745 ?auto_23744 ) ) ( HOLDING ?auto_23744 ) ( CLEAR ?auto_23745 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23741 ?auto_23742 ?auto_23743 ?auto_23745 ?auto_23744 )
      ( MAKE-3PILE ?auto_23741 ?auto_23742 ?auto_23743 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23746 - BLOCK
      ?auto_23747 - BLOCK
      ?auto_23748 - BLOCK
    )
    :vars
    (
      ?auto_23750 - BLOCK
      ?auto_23749 - BLOCK
      ?auto_23751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23750 ?auto_23748 ) ( ON-TABLE ?auto_23746 ) ( ON ?auto_23747 ?auto_23746 ) ( ON ?auto_23748 ?auto_23747 ) ( not ( = ?auto_23746 ?auto_23747 ) ) ( not ( = ?auto_23746 ?auto_23748 ) ) ( not ( = ?auto_23746 ?auto_23750 ) ) ( not ( = ?auto_23747 ?auto_23748 ) ) ( not ( = ?auto_23747 ?auto_23750 ) ) ( not ( = ?auto_23748 ?auto_23750 ) ) ( not ( = ?auto_23746 ?auto_23749 ) ) ( not ( = ?auto_23747 ?auto_23749 ) ) ( not ( = ?auto_23748 ?auto_23749 ) ) ( not ( = ?auto_23750 ?auto_23749 ) ) ( CLEAR ?auto_23750 ) ( ON ?auto_23749 ?auto_23751 ) ( CLEAR ?auto_23749 ) ( HAND-EMPTY ) ( not ( = ?auto_23746 ?auto_23751 ) ) ( not ( = ?auto_23747 ?auto_23751 ) ) ( not ( = ?auto_23748 ?auto_23751 ) ) ( not ( = ?auto_23750 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23749 ?auto_23751 )
      ( MAKE-3PILE ?auto_23746 ?auto_23747 ?auto_23748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23764 - BLOCK
      ?auto_23765 - BLOCK
      ?auto_23766 - BLOCK
    )
    :vars
    (
      ?auto_23768 - BLOCK
      ?auto_23767 - BLOCK
      ?auto_23769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23764 ) ( ON ?auto_23765 ?auto_23764 ) ( not ( = ?auto_23764 ?auto_23765 ) ) ( not ( = ?auto_23764 ?auto_23766 ) ) ( not ( = ?auto_23764 ?auto_23768 ) ) ( not ( = ?auto_23765 ?auto_23766 ) ) ( not ( = ?auto_23765 ?auto_23768 ) ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( not ( = ?auto_23764 ?auto_23767 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23767 ) ) ( not ( = ?auto_23768 ?auto_23767 ) ) ( ON ?auto_23767 ?auto_23769 ) ( not ( = ?auto_23764 ?auto_23769 ) ) ( not ( = ?auto_23765 ?auto_23769 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( not ( = ?auto_23768 ?auto_23769 ) ) ( not ( = ?auto_23767 ?auto_23769 ) ) ( ON ?auto_23768 ?auto_23767 ) ( CLEAR ?auto_23768 ) ( HOLDING ?auto_23766 ) ( CLEAR ?auto_23765 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23764 ?auto_23765 ?auto_23766 ?auto_23768 )
      ( MAKE-3PILE ?auto_23764 ?auto_23765 ?auto_23766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23770 - BLOCK
      ?auto_23771 - BLOCK
      ?auto_23772 - BLOCK
    )
    :vars
    (
      ?auto_23775 - BLOCK
      ?auto_23774 - BLOCK
      ?auto_23773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23770 ) ( ON ?auto_23771 ?auto_23770 ) ( not ( = ?auto_23770 ?auto_23771 ) ) ( not ( = ?auto_23770 ?auto_23772 ) ) ( not ( = ?auto_23770 ?auto_23775 ) ) ( not ( = ?auto_23771 ?auto_23772 ) ) ( not ( = ?auto_23771 ?auto_23775 ) ) ( not ( = ?auto_23772 ?auto_23775 ) ) ( not ( = ?auto_23770 ?auto_23774 ) ) ( not ( = ?auto_23771 ?auto_23774 ) ) ( not ( = ?auto_23772 ?auto_23774 ) ) ( not ( = ?auto_23775 ?auto_23774 ) ) ( ON ?auto_23774 ?auto_23773 ) ( not ( = ?auto_23770 ?auto_23773 ) ) ( not ( = ?auto_23771 ?auto_23773 ) ) ( not ( = ?auto_23772 ?auto_23773 ) ) ( not ( = ?auto_23775 ?auto_23773 ) ) ( not ( = ?auto_23774 ?auto_23773 ) ) ( ON ?auto_23775 ?auto_23774 ) ( CLEAR ?auto_23771 ) ( ON ?auto_23772 ?auto_23775 ) ( CLEAR ?auto_23772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23773 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23773 ?auto_23774 ?auto_23775 )
      ( MAKE-3PILE ?auto_23770 ?auto_23771 ?auto_23772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23776 - BLOCK
      ?auto_23777 - BLOCK
      ?auto_23778 - BLOCK
    )
    :vars
    (
      ?auto_23781 - BLOCK
      ?auto_23779 - BLOCK
      ?auto_23780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23776 ) ( not ( = ?auto_23776 ?auto_23777 ) ) ( not ( = ?auto_23776 ?auto_23778 ) ) ( not ( = ?auto_23776 ?auto_23781 ) ) ( not ( = ?auto_23777 ?auto_23778 ) ) ( not ( = ?auto_23777 ?auto_23781 ) ) ( not ( = ?auto_23778 ?auto_23781 ) ) ( not ( = ?auto_23776 ?auto_23779 ) ) ( not ( = ?auto_23777 ?auto_23779 ) ) ( not ( = ?auto_23778 ?auto_23779 ) ) ( not ( = ?auto_23781 ?auto_23779 ) ) ( ON ?auto_23779 ?auto_23780 ) ( not ( = ?auto_23776 ?auto_23780 ) ) ( not ( = ?auto_23777 ?auto_23780 ) ) ( not ( = ?auto_23778 ?auto_23780 ) ) ( not ( = ?auto_23781 ?auto_23780 ) ) ( not ( = ?auto_23779 ?auto_23780 ) ) ( ON ?auto_23781 ?auto_23779 ) ( ON ?auto_23778 ?auto_23781 ) ( CLEAR ?auto_23778 ) ( ON-TABLE ?auto_23780 ) ( HOLDING ?auto_23777 ) ( CLEAR ?auto_23776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23776 ?auto_23777 )
      ( MAKE-3PILE ?auto_23776 ?auto_23777 ?auto_23778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23782 - BLOCK
      ?auto_23783 - BLOCK
      ?auto_23784 - BLOCK
    )
    :vars
    (
      ?auto_23786 - BLOCK
      ?auto_23785 - BLOCK
      ?auto_23787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23782 ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23784 ) ) ( not ( = ?auto_23782 ?auto_23786 ) ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( not ( = ?auto_23783 ?auto_23786 ) ) ( not ( = ?auto_23784 ?auto_23786 ) ) ( not ( = ?auto_23782 ?auto_23785 ) ) ( not ( = ?auto_23783 ?auto_23785 ) ) ( not ( = ?auto_23784 ?auto_23785 ) ) ( not ( = ?auto_23786 ?auto_23785 ) ) ( ON ?auto_23785 ?auto_23787 ) ( not ( = ?auto_23782 ?auto_23787 ) ) ( not ( = ?auto_23783 ?auto_23787 ) ) ( not ( = ?auto_23784 ?auto_23787 ) ) ( not ( = ?auto_23786 ?auto_23787 ) ) ( not ( = ?auto_23785 ?auto_23787 ) ) ( ON ?auto_23786 ?auto_23785 ) ( ON ?auto_23784 ?auto_23786 ) ( ON-TABLE ?auto_23787 ) ( CLEAR ?auto_23782 ) ( ON ?auto_23783 ?auto_23784 ) ( CLEAR ?auto_23783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23787 ?auto_23785 ?auto_23786 ?auto_23784 )
      ( MAKE-3PILE ?auto_23782 ?auto_23783 ?auto_23784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23788 - BLOCK
      ?auto_23789 - BLOCK
      ?auto_23790 - BLOCK
    )
    :vars
    (
      ?auto_23793 - BLOCK
      ?auto_23791 - BLOCK
      ?auto_23792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23788 ?auto_23789 ) ) ( not ( = ?auto_23788 ?auto_23790 ) ) ( not ( = ?auto_23788 ?auto_23793 ) ) ( not ( = ?auto_23789 ?auto_23790 ) ) ( not ( = ?auto_23789 ?auto_23793 ) ) ( not ( = ?auto_23790 ?auto_23793 ) ) ( not ( = ?auto_23788 ?auto_23791 ) ) ( not ( = ?auto_23789 ?auto_23791 ) ) ( not ( = ?auto_23790 ?auto_23791 ) ) ( not ( = ?auto_23793 ?auto_23791 ) ) ( ON ?auto_23791 ?auto_23792 ) ( not ( = ?auto_23788 ?auto_23792 ) ) ( not ( = ?auto_23789 ?auto_23792 ) ) ( not ( = ?auto_23790 ?auto_23792 ) ) ( not ( = ?auto_23793 ?auto_23792 ) ) ( not ( = ?auto_23791 ?auto_23792 ) ) ( ON ?auto_23793 ?auto_23791 ) ( ON ?auto_23790 ?auto_23793 ) ( ON-TABLE ?auto_23792 ) ( ON ?auto_23789 ?auto_23790 ) ( CLEAR ?auto_23789 ) ( HOLDING ?auto_23788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23788 )
      ( MAKE-3PILE ?auto_23788 ?auto_23789 ?auto_23790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23794 - BLOCK
      ?auto_23795 - BLOCK
      ?auto_23796 - BLOCK
    )
    :vars
    (
      ?auto_23798 - BLOCK
      ?auto_23799 - BLOCK
      ?auto_23797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23798 ) ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23798 ) ) ( not ( = ?auto_23796 ?auto_23798 ) ) ( not ( = ?auto_23794 ?auto_23799 ) ) ( not ( = ?auto_23795 ?auto_23799 ) ) ( not ( = ?auto_23796 ?auto_23799 ) ) ( not ( = ?auto_23798 ?auto_23799 ) ) ( ON ?auto_23799 ?auto_23797 ) ( not ( = ?auto_23794 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23797 ) ) ( not ( = ?auto_23796 ?auto_23797 ) ) ( not ( = ?auto_23798 ?auto_23797 ) ) ( not ( = ?auto_23799 ?auto_23797 ) ) ( ON ?auto_23798 ?auto_23799 ) ( ON ?auto_23796 ?auto_23798 ) ( ON-TABLE ?auto_23797 ) ( ON ?auto_23795 ?auto_23796 ) ( ON ?auto_23794 ?auto_23795 ) ( CLEAR ?auto_23794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23797 ?auto_23799 ?auto_23798 ?auto_23796 ?auto_23795 )
      ( MAKE-3PILE ?auto_23794 ?auto_23795 ?auto_23796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23802 - BLOCK
      ?auto_23803 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23803 ) ( CLEAR ?auto_23802 ) ( ON-TABLE ?auto_23802 ) ( not ( = ?auto_23802 ?auto_23803 ) ) )
    :subtasks
    ( ( !STACK ?auto_23803 ?auto_23802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23804 - BLOCK
      ?auto_23805 - BLOCK
    )
    :vars
    (
      ?auto_23806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23804 ) ( ON-TABLE ?auto_23804 ) ( not ( = ?auto_23804 ?auto_23805 ) ) ( ON ?auto_23805 ?auto_23806 ) ( CLEAR ?auto_23805 ) ( HAND-EMPTY ) ( not ( = ?auto_23804 ?auto_23806 ) ) ( not ( = ?auto_23805 ?auto_23806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23805 ?auto_23806 )
      ( MAKE-2PILE ?auto_23804 ?auto_23805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23807 - BLOCK
      ?auto_23808 - BLOCK
    )
    :vars
    (
      ?auto_23809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23807 ?auto_23808 ) ) ( ON ?auto_23808 ?auto_23809 ) ( CLEAR ?auto_23808 ) ( not ( = ?auto_23807 ?auto_23809 ) ) ( not ( = ?auto_23808 ?auto_23809 ) ) ( HOLDING ?auto_23807 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23807 )
      ( MAKE-2PILE ?auto_23807 ?auto_23808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23810 - BLOCK
      ?auto_23811 - BLOCK
    )
    :vars
    (
      ?auto_23812 - BLOCK
      ?auto_23813 - BLOCK
      ?auto_23814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23810 ?auto_23811 ) ) ( ON ?auto_23811 ?auto_23812 ) ( not ( = ?auto_23810 ?auto_23812 ) ) ( not ( = ?auto_23811 ?auto_23812 ) ) ( ON ?auto_23810 ?auto_23811 ) ( CLEAR ?auto_23810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23813 ) ( ON ?auto_23814 ?auto_23813 ) ( ON ?auto_23812 ?auto_23814 ) ( not ( = ?auto_23813 ?auto_23814 ) ) ( not ( = ?auto_23813 ?auto_23812 ) ) ( not ( = ?auto_23813 ?auto_23811 ) ) ( not ( = ?auto_23813 ?auto_23810 ) ) ( not ( = ?auto_23814 ?auto_23812 ) ) ( not ( = ?auto_23814 ?auto_23811 ) ) ( not ( = ?auto_23814 ?auto_23810 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23813 ?auto_23814 ?auto_23812 ?auto_23811 )
      ( MAKE-2PILE ?auto_23810 ?auto_23811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23815 - BLOCK
      ?auto_23816 - BLOCK
    )
    :vars
    (
      ?auto_23818 - BLOCK
      ?auto_23817 - BLOCK
      ?auto_23819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23815 ?auto_23816 ) ) ( ON ?auto_23816 ?auto_23818 ) ( not ( = ?auto_23815 ?auto_23818 ) ) ( not ( = ?auto_23816 ?auto_23818 ) ) ( ON-TABLE ?auto_23817 ) ( ON ?auto_23819 ?auto_23817 ) ( ON ?auto_23818 ?auto_23819 ) ( not ( = ?auto_23817 ?auto_23819 ) ) ( not ( = ?auto_23817 ?auto_23818 ) ) ( not ( = ?auto_23817 ?auto_23816 ) ) ( not ( = ?auto_23817 ?auto_23815 ) ) ( not ( = ?auto_23819 ?auto_23818 ) ) ( not ( = ?auto_23819 ?auto_23816 ) ) ( not ( = ?auto_23819 ?auto_23815 ) ) ( HOLDING ?auto_23815 ) ( CLEAR ?auto_23816 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23817 ?auto_23819 ?auto_23818 ?auto_23816 ?auto_23815 )
      ( MAKE-2PILE ?auto_23815 ?auto_23816 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23820 - BLOCK
      ?auto_23821 - BLOCK
    )
    :vars
    (
      ?auto_23822 - BLOCK
      ?auto_23824 - BLOCK
      ?auto_23823 - BLOCK
      ?auto_23825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23820 ?auto_23821 ) ) ( ON ?auto_23821 ?auto_23822 ) ( not ( = ?auto_23820 ?auto_23822 ) ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( ON-TABLE ?auto_23824 ) ( ON ?auto_23823 ?auto_23824 ) ( ON ?auto_23822 ?auto_23823 ) ( not ( = ?auto_23824 ?auto_23823 ) ) ( not ( = ?auto_23824 ?auto_23822 ) ) ( not ( = ?auto_23824 ?auto_23821 ) ) ( not ( = ?auto_23824 ?auto_23820 ) ) ( not ( = ?auto_23823 ?auto_23822 ) ) ( not ( = ?auto_23823 ?auto_23821 ) ) ( not ( = ?auto_23823 ?auto_23820 ) ) ( CLEAR ?auto_23821 ) ( ON ?auto_23820 ?auto_23825 ) ( CLEAR ?auto_23820 ) ( HAND-EMPTY ) ( not ( = ?auto_23820 ?auto_23825 ) ) ( not ( = ?auto_23821 ?auto_23825 ) ) ( not ( = ?auto_23822 ?auto_23825 ) ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23823 ?auto_23825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23820 ?auto_23825 )
      ( MAKE-2PILE ?auto_23820 ?auto_23821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23826 - BLOCK
      ?auto_23827 - BLOCK
    )
    :vars
    (
      ?auto_23831 - BLOCK
      ?auto_23829 - BLOCK
      ?auto_23830 - BLOCK
      ?auto_23828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23826 ?auto_23827 ) ) ( not ( = ?auto_23826 ?auto_23831 ) ) ( not ( = ?auto_23827 ?auto_23831 ) ) ( ON-TABLE ?auto_23829 ) ( ON ?auto_23830 ?auto_23829 ) ( ON ?auto_23831 ?auto_23830 ) ( not ( = ?auto_23829 ?auto_23830 ) ) ( not ( = ?auto_23829 ?auto_23831 ) ) ( not ( = ?auto_23829 ?auto_23827 ) ) ( not ( = ?auto_23829 ?auto_23826 ) ) ( not ( = ?auto_23830 ?auto_23831 ) ) ( not ( = ?auto_23830 ?auto_23827 ) ) ( not ( = ?auto_23830 ?auto_23826 ) ) ( ON ?auto_23826 ?auto_23828 ) ( CLEAR ?auto_23826 ) ( not ( = ?auto_23826 ?auto_23828 ) ) ( not ( = ?auto_23827 ?auto_23828 ) ) ( not ( = ?auto_23831 ?auto_23828 ) ) ( not ( = ?auto_23829 ?auto_23828 ) ) ( not ( = ?auto_23830 ?auto_23828 ) ) ( HOLDING ?auto_23827 ) ( CLEAR ?auto_23831 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23829 ?auto_23830 ?auto_23831 ?auto_23827 )
      ( MAKE-2PILE ?auto_23826 ?auto_23827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23832 - BLOCK
      ?auto_23833 - BLOCK
    )
    :vars
    (
      ?auto_23836 - BLOCK
      ?auto_23835 - BLOCK
      ?auto_23834 - BLOCK
      ?auto_23837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23832 ?auto_23833 ) ) ( not ( = ?auto_23832 ?auto_23836 ) ) ( not ( = ?auto_23833 ?auto_23836 ) ) ( ON-TABLE ?auto_23835 ) ( ON ?auto_23834 ?auto_23835 ) ( ON ?auto_23836 ?auto_23834 ) ( not ( = ?auto_23835 ?auto_23834 ) ) ( not ( = ?auto_23835 ?auto_23836 ) ) ( not ( = ?auto_23835 ?auto_23833 ) ) ( not ( = ?auto_23835 ?auto_23832 ) ) ( not ( = ?auto_23834 ?auto_23836 ) ) ( not ( = ?auto_23834 ?auto_23833 ) ) ( not ( = ?auto_23834 ?auto_23832 ) ) ( ON ?auto_23832 ?auto_23837 ) ( not ( = ?auto_23832 ?auto_23837 ) ) ( not ( = ?auto_23833 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23835 ?auto_23837 ) ) ( not ( = ?auto_23834 ?auto_23837 ) ) ( CLEAR ?auto_23836 ) ( ON ?auto_23833 ?auto_23832 ) ( CLEAR ?auto_23833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23837 ?auto_23832 )
      ( MAKE-2PILE ?auto_23832 ?auto_23833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23838 - BLOCK
      ?auto_23839 - BLOCK
    )
    :vars
    (
      ?auto_23843 - BLOCK
      ?auto_23840 - BLOCK
      ?auto_23841 - BLOCK
      ?auto_23842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23838 ?auto_23843 ) ) ( not ( = ?auto_23839 ?auto_23843 ) ) ( ON-TABLE ?auto_23840 ) ( ON ?auto_23841 ?auto_23840 ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23843 ) ) ( not ( = ?auto_23840 ?auto_23839 ) ) ( not ( = ?auto_23840 ?auto_23838 ) ) ( not ( = ?auto_23841 ?auto_23843 ) ) ( not ( = ?auto_23841 ?auto_23839 ) ) ( not ( = ?auto_23841 ?auto_23838 ) ) ( ON ?auto_23838 ?auto_23842 ) ( not ( = ?auto_23838 ?auto_23842 ) ) ( not ( = ?auto_23839 ?auto_23842 ) ) ( not ( = ?auto_23843 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23842 ) ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( ON ?auto_23839 ?auto_23838 ) ( CLEAR ?auto_23839 ) ( ON-TABLE ?auto_23842 ) ( HOLDING ?auto_23843 ) ( CLEAR ?auto_23841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23840 ?auto_23841 ?auto_23843 )
      ( MAKE-2PILE ?auto_23838 ?auto_23839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23844 - BLOCK
      ?auto_23845 - BLOCK
    )
    :vars
    (
      ?auto_23847 - BLOCK
      ?auto_23849 - BLOCK
      ?auto_23846 - BLOCK
      ?auto_23848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23844 ?auto_23845 ) ) ( not ( = ?auto_23844 ?auto_23847 ) ) ( not ( = ?auto_23845 ?auto_23847 ) ) ( ON-TABLE ?auto_23849 ) ( ON ?auto_23846 ?auto_23849 ) ( not ( = ?auto_23849 ?auto_23846 ) ) ( not ( = ?auto_23849 ?auto_23847 ) ) ( not ( = ?auto_23849 ?auto_23845 ) ) ( not ( = ?auto_23849 ?auto_23844 ) ) ( not ( = ?auto_23846 ?auto_23847 ) ) ( not ( = ?auto_23846 ?auto_23845 ) ) ( not ( = ?auto_23846 ?auto_23844 ) ) ( ON ?auto_23844 ?auto_23848 ) ( not ( = ?auto_23844 ?auto_23848 ) ) ( not ( = ?auto_23845 ?auto_23848 ) ) ( not ( = ?auto_23847 ?auto_23848 ) ) ( not ( = ?auto_23849 ?auto_23848 ) ) ( not ( = ?auto_23846 ?auto_23848 ) ) ( ON ?auto_23845 ?auto_23844 ) ( ON-TABLE ?auto_23848 ) ( CLEAR ?auto_23846 ) ( ON ?auto_23847 ?auto_23845 ) ( CLEAR ?auto_23847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23848 ?auto_23844 ?auto_23845 )
      ( MAKE-2PILE ?auto_23844 ?auto_23845 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23850 - BLOCK
      ?auto_23851 - BLOCK
    )
    :vars
    (
      ?auto_23855 - BLOCK
      ?auto_23854 - BLOCK
      ?auto_23852 - BLOCK
      ?auto_23853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23850 ?auto_23851 ) ) ( not ( = ?auto_23850 ?auto_23855 ) ) ( not ( = ?auto_23851 ?auto_23855 ) ) ( ON-TABLE ?auto_23854 ) ( not ( = ?auto_23854 ?auto_23852 ) ) ( not ( = ?auto_23854 ?auto_23855 ) ) ( not ( = ?auto_23854 ?auto_23851 ) ) ( not ( = ?auto_23854 ?auto_23850 ) ) ( not ( = ?auto_23852 ?auto_23855 ) ) ( not ( = ?auto_23852 ?auto_23851 ) ) ( not ( = ?auto_23852 ?auto_23850 ) ) ( ON ?auto_23850 ?auto_23853 ) ( not ( = ?auto_23850 ?auto_23853 ) ) ( not ( = ?auto_23851 ?auto_23853 ) ) ( not ( = ?auto_23855 ?auto_23853 ) ) ( not ( = ?auto_23854 ?auto_23853 ) ) ( not ( = ?auto_23852 ?auto_23853 ) ) ( ON ?auto_23851 ?auto_23850 ) ( ON-TABLE ?auto_23853 ) ( ON ?auto_23855 ?auto_23851 ) ( CLEAR ?auto_23855 ) ( HOLDING ?auto_23852 ) ( CLEAR ?auto_23854 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23854 ?auto_23852 )
      ( MAKE-2PILE ?auto_23850 ?auto_23851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23856 - BLOCK
      ?auto_23857 - BLOCK
    )
    :vars
    (
      ?auto_23858 - BLOCK
      ?auto_23860 - BLOCK
      ?auto_23861 - BLOCK
      ?auto_23859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23856 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23858 ) ) ( not ( = ?auto_23857 ?auto_23858 ) ) ( ON-TABLE ?auto_23860 ) ( not ( = ?auto_23860 ?auto_23861 ) ) ( not ( = ?auto_23860 ?auto_23858 ) ) ( not ( = ?auto_23860 ?auto_23857 ) ) ( not ( = ?auto_23860 ?auto_23856 ) ) ( not ( = ?auto_23861 ?auto_23858 ) ) ( not ( = ?auto_23861 ?auto_23857 ) ) ( not ( = ?auto_23861 ?auto_23856 ) ) ( ON ?auto_23856 ?auto_23859 ) ( not ( = ?auto_23856 ?auto_23859 ) ) ( not ( = ?auto_23857 ?auto_23859 ) ) ( not ( = ?auto_23858 ?auto_23859 ) ) ( not ( = ?auto_23860 ?auto_23859 ) ) ( not ( = ?auto_23861 ?auto_23859 ) ) ( ON ?auto_23857 ?auto_23856 ) ( ON-TABLE ?auto_23859 ) ( ON ?auto_23858 ?auto_23857 ) ( CLEAR ?auto_23860 ) ( ON ?auto_23861 ?auto_23858 ) ( CLEAR ?auto_23861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23859 ?auto_23856 ?auto_23857 ?auto_23858 )
      ( MAKE-2PILE ?auto_23856 ?auto_23857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23862 - BLOCK
      ?auto_23863 - BLOCK
    )
    :vars
    (
      ?auto_23867 - BLOCK
      ?auto_23864 - BLOCK
      ?auto_23865 - BLOCK
      ?auto_23866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23862 ?auto_23863 ) ) ( not ( = ?auto_23862 ?auto_23867 ) ) ( not ( = ?auto_23863 ?auto_23867 ) ) ( not ( = ?auto_23864 ?auto_23865 ) ) ( not ( = ?auto_23864 ?auto_23867 ) ) ( not ( = ?auto_23864 ?auto_23863 ) ) ( not ( = ?auto_23864 ?auto_23862 ) ) ( not ( = ?auto_23865 ?auto_23867 ) ) ( not ( = ?auto_23865 ?auto_23863 ) ) ( not ( = ?auto_23865 ?auto_23862 ) ) ( ON ?auto_23862 ?auto_23866 ) ( not ( = ?auto_23862 ?auto_23866 ) ) ( not ( = ?auto_23863 ?auto_23866 ) ) ( not ( = ?auto_23867 ?auto_23866 ) ) ( not ( = ?auto_23864 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( ON ?auto_23863 ?auto_23862 ) ( ON-TABLE ?auto_23866 ) ( ON ?auto_23867 ?auto_23863 ) ( ON ?auto_23865 ?auto_23867 ) ( CLEAR ?auto_23865 ) ( HOLDING ?auto_23864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23864 )
      ( MAKE-2PILE ?auto_23862 ?auto_23863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23868 - BLOCK
      ?auto_23869 - BLOCK
    )
    :vars
    (
      ?auto_23871 - BLOCK
      ?auto_23873 - BLOCK
      ?auto_23872 - BLOCK
      ?auto_23870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23868 ?auto_23869 ) ) ( not ( = ?auto_23868 ?auto_23871 ) ) ( not ( = ?auto_23869 ?auto_23871 ) ) ( not ( = ?auto_23873 ?auto_23872 ) ) ( not ( = ?auto_23873 ?auto_23871 ) ) ( not ( = ?auto_23873 ?auto_23869 ) ) ( not ( = ?auto_23873 ?auto_23868 ) ) ( not ( = ?auto_23872 ?auto_23871 ) ) ( not ( = ?auto_23872 ?auto_23869 ) ) ( not ( = ?auto_23872 ?auto_23868 ) ) ( ON ?auto_23868 ?auto_23870 ) ( not ( = ?auto_23868 ?auto_23870 ) ) ( not ( = ?auto_23869 ?auto_23870 ) ) ( not ( = ?auto_23871 ?auto_23870 ) ) ( not ( = ?auto_23873 ?auto_23870 ) ) ( not ( = ?auto_23872 ?auto_23870 ) ) ( ON ?auto_23869 ?auto_23868 ) ( ON-TABLE ?auto_23870 ) ( ON ?auto_23871 ?auto_23869 ) ( ON ?auto_23872 ?auto_23871 ) ( ON ?auto_23873 ?auto_23872 ) ( CLEAR ?auto_23873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23870 ?auto_23868 ?auto_23869 ?auto_23871 ?auto_23872 )
      ( MAKE-2PILE ?auto_23868 ?auto_23869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23876 - BLOCK
      ?auto_23877 - BLOCK
    )
    :vars
    (
      ?auto_23878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23878 ?auto_23877 ) ( CLEAR ?auto_23878 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23876 ) ( ON ?auto_23877 ?auto_23876 ) ( not ( = ?auto_23876 ?auto_23877 ) ) ( not ( = ?auto_23876 ?auto_23878 ) ) ( not ( = ?auto_23877 ?auto_23878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23878 ?auto_23877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23879 - BLOCK
      ?auto_23880 - BLOCK
    )
    :vars
    (
      ?auto_23881 - BLOCK
      ?auto_23882 - BLOCK
      ?auto_23883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23881 ?auto_23880 ) ( CLEAR ?auto_23881 ) ( ON-TABLE ?auto_23879 ) ( ON ?auto_23880 ?auto_23879 ) ( not ( = ?auto_23879 ?auto_23880 ) ) ( not ( = ?auto_23879 ?auto_23881 ) ) ( not ( = ?auto_23880 ?auto_23881 ) ) ( HOLDING ?auto_23882 ) ( CLEAR ?auto_23883 ) ( not ( = ?auto_23879 ?auto_23882 ) ) ( not ( = ?auto_23879 ?auto_23883 ) ) ( not ( = ?auto_23880 ?auto_23882 ) ) ( not ( = ?auto_23880 ?auto_23883 ) ) ( not ( = ?auto_23881 ?auto_23882 ) ) ( not ( = ?auto_23881 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23883 ) ) )
    :subtasks
    ( ( !STACK ?auto_23882 ?auto_23883 )
      ( MAKE-2PILE ?auto_23879 ?auto_23880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23884 - BLOCK
      ?auto_23885 - BLOCK
    )
    :vars
    (
      ?auto_23888 - BLOCK
      ?auto_23886 - BLOCK
      ?auto_23887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23888 ?auto_23885 ) ( ON-TABLE ?auto_23884 ) ( ON ?auto_23885 ?auto_23884 ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23888 ) ) ( not ( = ?auto_23885 ?auto_23888 ) ) ( CLEAR ?auto_23886 ) ( not ( = ?auto_23884 ?auto_23887 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23887 ) ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( not ( = ?auto_23888 ?auto_23887 ) ) ( not ( = ?auto_23888 ?auto_23886 ) ) ( not ( = ?auto_23887 ?auto_23886 ) ) ( ON ?auto_23887 ?auto_23888 ) ( CLEAR ?auto_23887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23884 ?auto_23885 ?auto_23888 )
      ( MAKE-2PILE ?auto_23884 ?auto_23885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23889 - BLOCK
      ?auto_23890 - BLOCK
    )
    :vars
    (
      ?auto_23892 - BLOCK
      ?auto_23891 - BLOCK
      ?auto_23893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23892 ?auto_23890 ) ( ON-TABLE ?auto_23889 ) ( ON ?auto_23890 ?auto_23889 ) ( not ( = ?auto_23889 ?auto_23890 ) ) ( not ( = ?auto_23889 ?auto_23892 ) ) ( not ( = ?auto_23890 ?auto_23892 ) ) ( not ( = ?auto_23889 ?auto_23891 ) ) ( not ( = ?auto_23889 ?auto_23893 ) ) ( not ( = ?auto_23890 ?auto_23891 ) ) ( not ( = ?auto_23890 ?auto_23893 ) ) ( not ( = ?auto_23892 ?auto_23891 ) ) ( not ( = ?auto_23892 ?auto_23893 ) ) ( not ( = ?auto_23891 ?auto_23893 ) ) ( ON ?auto_23891 ?auto_23892 ) ( CLEAR ?auto_23891 ) ( HOLDING ?auto_23893 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23893 )
      ( MAKE-2PILE ?auto_23889 ?auto_23890 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23894 - BLOCK
      ?auto_23895 - BLOCK
    )
    :vars
    (
      ?auto_23896 - BLOCK
      ?auto_23897 - BLOCK
      ?auto_23898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23896 ?auto_23895 ) ( ON-TABLE ?auto_23894 ) ( ON ?auto_23895 ?auto_23894 ) ( not ( = ?auto_23894 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23894 ?auto_23897 ) ) ( not ( = ?auto_23894 ?auto_23898 ) ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23898 ) ) ( not ( = ?auto_23896 ?auto_23897 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( not ( = ?auto_23897 ?auto_23898 ) ) ( ON ?auto_23897 ?auto_23896 ) ( ON ?auto_23898 ?auto_23897 ) ( CLEAR ?auto_23898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23894 ?auto_23895 ?auto_23896 ?auto_23897 )
      ( MAKE-2PILE ?auto_23894 ?auto_23895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23899 - BLOCK
      ?auto_23900 - BLOCK
    )
    :vars
    (
      ?auto_23903 - BLOCK
      ?auto_23901 - BLOCK
      ?auto_23902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23903 ?auto_23900 ) ( ON-TABLE ?auto_23899 ) ( ON ?auto_23900 ?auto_23899 ) ( not ( = ?auto_23899 ?auto_23900 ) ) ( not ( = ?auto_23899 ?auto_23903 ) ) ( not ( = ?auto_23900 ?auto_23903 ) ) ( not ( = ?auto_23899 ?auto_23901 ) ) ( not ( = ?auto_23899 ?auto_23902 ) ) ( not ( = ?auto_23900 ?auto_23901 ) ) ( not ( = ?auto_23900 ?auto_23902 ) ) ( not ( = ?auto_23903 ?auto_23901 ) ) ( not ( = ?auto_23903 ?auto_23902 ) ) ( not ( = ?auto_23901 ?auto_23902 ) ) ( ON ?auto_23901 ?auto_23903 ) ( HOLDING ?auto_23902 ) ( CLEAR ?auto_23901 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23899 ?auto_23900 ?auto_23903 ?auto_23901 ?auto_23902 )
      ( MAKE-2PILE ?auto_23899 ?auto_23900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23904 - BLOCK
      ?auto_23905 - BLOCK
    )
    :vars
    (
      ?auto_23908 - BLOCK
      ?auto_23906 - BLOCK
      ?auto_23907 - BLOCK
      ?auto_23909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23908 ?auto_23905 ) ( ON-TABLE ?auto_23904 ) ( ON ?auto_23905 ?auto_23904 ) ( not ( = ?auto_23904 ?auto_23905 ) ) ( not ( = ?auto_23904 ?auto_23908 ) ) ( not ( = ?auto_23905 ?auto_23908 ) ) ( not ( = ?auto_23904 ?auto_23906 ) ) ( not ( = ?auto_23904 ?auto_23907 ) ) ( not ( = ?auto_23905 ?auto_23906 ) ) ( not ( = ?auto_23905 ?auto_23907 ) ) ( not ( = ?auto_23908 ?auto_23906 ) ) ( not ( = ?auto_23908 ?auto_23907 ) ) ( not ( = ?auto_23906 ?auto_23907 ) ) ( ON ?auto_23906 ?auto_23908 ) ( CLEAR ?auto_23906 ) ( ON ?auto_23907 ?auto_23909 ) ( CLEAR ?auto_23907 ) ( HAND-EMPTY ) ( not ( = ?auto_23904 ?auto_23909 ) ) ( not ( = ?auto_23905 ?auto_23909 ) ) ( not ( = ?auto_23908 ?auto_23909 ) ) ( not ( = ?auto_23906 ?auto_23909 ) ) ( not ( = ?auto_23907 ?auto_23909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23907 ?auto_23909 )
      ( MAKE-2PILE ?auto_23904 ?auto_23905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23910 - BLOCK
      ?auto_23911 - BLOCK
    )
    :vars
    (
      ?auto_23915 - BLOCK
      ?auto_23914 - BLOCK
      ?auto_23912 - BLOCK
      ?auto_23913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23915 ?auto_23911 ) ( ON-TABLE ?auto_23910 ) ( ON ?auto_23911 ?auto_23910 ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23910 ?auto_23915 ) ) ( not ( = ?auto_23911 ?auto_23915 ) ) ( not ( = ?auto_23910 ?auto_23914 ) ) ( not ( = ?auto_23910 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23914 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( not ( = ?auto_23915 ?auto_23914 ) ) ( not ( = ?auto_23915 ?auto_23912 ) ) ( not ( = ?auto_23914 ?auto_23912 ) ) ( ON ?auto_23912 ?auto_23913 ) ( CLEAR ?auto_23912 ) ( not ( = ?auto_23910 ?auto_23913 ) ) ( not ( = ?auto_23911 ?auto_23913 ) ) ( not ( = ?auto_23915 ?auto_23913 ) ) ( not ( = ?auto_23914 ?auto_23913 ) ) ( not ( = ?auto_23912 ?auto_23913 ) ) ( HOLDING ?auto_23914 ) ( CLEAR ?auto_23915 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23910 ?auto_23911 ?auto_23915 ?auto_23914 )
      ( MAKE-2PILE ?auto_23910 ?auto_23911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23916 - BLOCK
      ?auto_23917 - BLOCK
    )
    :vars
    (
      ?auto_23919 - BLOCK
      ?auto_23921 - BLOCK
      ?auto_23918 - BLOCK
      ?auto_23920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23919 ?auto_23917 ) ( ON-TABLE ?auto_23916 ) ( ON ?auto_23917 ?auto_23916 ) ( not ( = ?auto_23916 ?auto_23917 ) ) ( not ( = ?auto_23916 ?auto_23919 ) ) ( not ( = ?auto_23917 ?auto_23919 ) ) ( not ( = ?auto_23916 ?auto_23921 ) ) ( not ( = ?auto_23916 ?auto_23918 ) ) ( not ( = ?auto_23917 ?auto_23921 ) ) ( not ( = ?auto_23917 ?auto_23918 ) ) ( not ( = ?auto_23919 ?auto_23921 ) ) ( not ( = ?auto_23919 ?auto_23918 ) ) ( not ( = ?auto_23921 ?auto_23918 ) ) ( ON ?auto_23918 ?auto_23920 ) ( not ( = ?auto_23916 ?auto_23920 ) ) ( not ( = ?auto_23917 ?auto_23920 ) ) ( not ( = ?auto_23919 ?auto_23920 ) ) ( not ( = ?auto_23921 ?auto_23920 ) ) ( not ( = ?auto_23918 ?auto_23920 ) ) ( CLEAR ?auto_23919 ) ( ON ?auto_23921 ?auto_23918 ) ( CLEAR ?auto_23921 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23920 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23920 ?auto_23918 )
      ( MAKE-2PILE ?auto_23916 ?auto_23917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23934 - BLOCK
      ?auto_23935 - BLOCK
    )
    :vars
    (
      ?auto_23937 - BLOCK
      ?auto_23938 - BLOCK
      ?auto_23939 - BLOCK
      ?auto_23936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23934 ) ( not ( = ?auto_23934 ?auto_23935 ) ) ( not ( = ?auto_23934 ?auto_23937 ) ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( not ( = ?auto_23934 ?auto_23938 ) ) ( not ( = ?auto_23934 ?auto_23939 ) ) ( not ( = ?auto_23935 ?auto_23938 ) ) ( not ( = ?auto_23935 ?auto_23939 ) ) ( not ( = ?auto_23937 ?auto_23938 ) ) ( not ( = ?auto_23937 ?auto_23939 ) ) ( not ( = ?auto_23938 ?auto_23939 ) ) ( ON ?auto_23939 ?auto_23936 ) ( not ( = ?auto_23934 ?auto_23936 ) ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( not ( = ?auto_23937 ?auto_23936 ) ) ( not ( = ?auto_23938 ?auto_23936 ) ) ( not ( = ?auto_23939 ?auto_23936 ) ) ( ON ?auto_23938 ?auto_23939 ) ( ON-TABLE ?auto_23936 ) ( ON ?auto_23937 ?auto_23938 ) ( CLEAR ?auto_23937 ) ( HOLDING ?auto_23935 ) ( CLEAR ?auto_23934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23934 ?auto_23935 ?auto_23937 )
      ( MAKE-2PILE ?auto_23934 ?auto_23935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23940 - BLOCK
      ?auto_23941 - BLOCK
    )
    :vars
    (
      ?auto_23944 - BLOCK
      ?auto_23945 - BLOCK
      ?auto_23943 - BLOCK
      ?auto_23942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23940 ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( not ( = ?auto_23940 ?auto_23944 ) ) ( not ( = ?auto_23941 ?auto_23944 ) ) ( not ( = ?auto_23940 ?auto_23945 ) ) ( not ( = ?auto_23940 ?auto_23943 ) ) ( not ( = ?auto_23941 ?auto_23945 ) ) ( not ( = ?auto_23941 ?auto_23943 ) ) ( not ( = ?auto_23944 ?auto_23945 ) ) ( not ( = ?auto_23944 ?auto_23943 ) ) ( not ( = ?auto_23945 ?auto_23943 ) ) ( ON ?auto_23943 ?auto_23942 ) ( not ( = ?auto_23940 ?auto_23942 ) ) ( not ( = ?auto_23941 ?auto_23942 ) ) ( not ( = ?auto_23944 ?auto_23942 ) ) ( not ( = ?auto_23945 ?auto_23942 ) ) ( not ( = ?auto_23943 ?auto_23942 ) ) ( ON ?auto_23945 ?auto_23943 ) ( ON-TABLE ?auto_23942 ) ( ON ?auto_23944 ?auto_23945 ) ( CLEAR ?auto_23940 ) ( ON ?auto_23941 ?auto_23944 ) ( CLEAR ?auto_23941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23942 ?auto_23943 ?auto_23945 ?auto_23944 )
      ( MAKE-2PILE ?auto_23940 ?auto_23941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23946 - BLOCK
      ?auto_23947 - BLOCK
    )
    :vars
    (
      ?auto_23950 - BLOCK
      ?auto_23951 - BLOCK
      ?auto_23949 - BLOCK
      ?auto_23948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23946 ?auto_23947 ) ) ( not ( = ?auto_23946 ?auto_23950 ) ) ( not ( = ?auto_23947 ?auto_23950 ) ) ( not ( = ?auto_23946 ?auto_23951 ) ) ( not ( = ?auto_23946 ?auto_23949 ) ) ( not ( = ?auto_23947 ?auto_23951 ) ) ( not ( = ?auto_23947 ?auto_23949 ) ) ( not ( = ?auto_23950 ?auto_23951 ) ) ( not ( = ?auto_23950 ?auto_23949 ) ) ( not ( = ?auto_23951 ?auto_23949 ) ) ( ON ?auto_23949 ?auto_23948 ) ( not ( = ?auto_23946 ?auto_23948 ) ) ( not ( = ?auto_23947 ?auto_23948 ) ) ( not ( = ?auto_23950 ?auto_23948 ) ) ( not ( = ?auto_23951 ?auto_23948 ) ) ( not ( = ?auto_23949 ?auto_23948 ) ) ( ON ?auto_23951 ?auto_23949 ) ( ON-TABLE ?auto_23948 ) ( ON ?auto_23950 ?auto_23951 ) ( ON ?auto_23947 ?auto_23950 ) ( CLEAR ?auto_23947 ) ( HOLDING ?auto_23946 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23946 )
      ( MAKE-2PILE ?auto_23946 ?auto_23947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23952 - BLOCK
      ?auto_23953 - BLOCK
    )
    :vars
    (
      ?auto_23957 - BLOCK
      ?auto_23954 - BLOCK
      ?auto_23955 - BLOCK
      ?auto_23956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23952 ?auto_23953 ) ) ( not ( = ?auto_23952 ?auto_23957 ) ) ( not ( = ?auto_23953 ?auto_23957 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( not ( = ?auto_23952 ?auto_23955 ) ) ( not ( = ?auto_23953 ?auto_23954 ) ) ( not ( = ?auto_23953 ?auto_23955 ) ) ( not ( = ?auto_23957 ?auto_23954 ) ) ( not ( = ?auto_23957 ?auto_23955 ) ) ( not ( = ?auto_23954 ?auto_23955 ) ) ( ON ?auto_23955 ?auto_23956 ) ( not ( = ?auto_23952 ?auto_23956 ) ) ( not ( = ?auto_23953 ?auto_23956 ) ) ( not ( = ?auto_23957 ?auto_23956 ) ) ( not ( = ?auto_23954 ?auto_23956 ) ) ( not ( = ?auto_23955 ?auto_23956 ) ) ( ON ?auto_23954 ?auto_23955 ) ( ON-TABLE ?auto_23956 ) ( ON ?auto_23957 ?auto_23954 ) ( ON ?auto_23953 ?auto_23957 ) ( ON ?auto_23952 ?auto_23953 ) ( CLEAR ?auto_23952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23956 ?auto_23955 ?auto_23954 ?auto_23957 ?auto_23953 )
      ( MAKE-2PILE ?auto_23952 ?auto_23953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23961 - BLOCK
      ?auto_23962 - BLOCK
      ?auto_23963 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_23963 ) ( CLEAR ?auto_23962 ) ( ON-TABLE ?auto_23961 ) ( ON ?auto_23962 ?auto_23961 ) ( not ( = ?auto_23961 ?auto_23962 ) ) ( not ( = ?auto_23961 ?auto_23963 ) ) ( not ( = ?auto_23962 ?auto_23963 ) ) )
    :subtasks
    ( ( !STACK ?auto_23963 ?auto_23962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23964 - BLOCK
      ?auto_23965 - BLOCK
      ?auto_23966 - BLOCK
    )
    :vars
    (
      ?auto_23967 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23965 ) ( ON-TABLE ?auto_23964 ) ( ON ?auto_23965 ?auto_23964 ) ( not ( = ?auto_23964 ?auto_23965 ) ) ( not ( = ?auto_23964 ?auto_23966 ) ) ( not ( = ?auto_23965 ?auto_23966 ) ) ( ON ?auto_23966 ?auto_23967 ) ( CLEAR ?auto_23966 ) ( HAND-EMPTY ) ( not ( = ?auto_23964 ?auto_23967 ) ) ( not ( = ?auto_23965 ?auto_23967 ) ) ( not ( = ?auto_23966 ?auto_23967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23966 ?auto_23967 )
      ( MAKE-3PILE ?auto_23964 ?auto_23965 ?auto_23966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23968 - BLOCK
      ?auto_23969 - BLOCK
      ?auto_23970 - BLOCK
    )
    :vars
    (
      ?auto_23971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23968 ) ( not ( = ?auto_23968 ?auto_23969 ) ) ( not ( = ?auto_23968 ?auto_23970 ) ) ( not ( = ?auto_23969 ?auto_23970 ) ) ( ON ?auto_23970 ?auto_23971 ) ( CLEAR ?auto_23970 ) ( not ( = ?auto_23968 ?auto_23971 ) ) ( not ( = ?auto_23969 ?auto_23971 ) ) ( not ( = ?auto_23970 ?auto_23971 ) ) ( HOLDING ?auto_23969 ) ( CLEAR ?auto_23968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23968 ?auto_23969 )
      ( MAKE-3PILE ?auto_23968 ?auto_23969 ?auto_23970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23972 - BLOCK
      ?auto_23973 - BLOCK
      ?auto_23974 - BLOCK
    )
    :vars
    (
      ?auto_23975 - BLOCK
      ?auto_23976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23972 ) ( not ( = ?auto_23972 ?auto_23973 ) ) ( not ( = ?auto_23972 ?auto_23974 ) ) ( not ( = ?auto_23973 ?auto_23974 ) ) ( ON ?auto_23974 ?auto_23975 ) ( not ( = ?auto_23972 ?auto_23975 ) ) ( not ( = ?auto_23973 ?auto_23975 ) ) ( not ( = ?auto_23974 ?auto_23975 ) ) ( CLEAR ?auto_23972 ) ( ON ?auto_23973 ?auto_23974 ) ( CLEAR ?auto_23973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23976 ) ( ON ?auto_23975 ?auto_23976 ) ( not ( = ?auto_23976 ?auto_23975 ) ) ( not ( = ?auto_23976 ?auto_23974 ) ) ( not ( = ?auto_23976 ?auto_23973 ) ) ( not ( = ?auto_23972 ?auto_23976 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23976 ?auto_23975 ?auto_23974 )
      ( MAKE-3PILE ?auto_23972 ?auto_23973 ?auto_23974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23977 - BLOCK
      ?auto_23978 - BLOCK
      ?auto_23979 - BLOCK
    )
    :vars
    (
      ?auto_23981 - BLOCK
      ?auto_23980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23977 ?auto_23978 ) ) ( not ( = ?auto_23977 ?auto_23979 ) ) ( not ( = ?auto_23978 ?auto_23979 ) ) ( ON ?auto_23979 ?auto_23981 ) ( not ( = ?auto_23977 ?auto_23981 ) ) ( not ( = ?auto_23978 ?auto_23981 ) ) ( not ( = ?auto_23979 ?auto_23981 ) ) ( ON ?auto_23978 ?auto_23979 ) ( CLEAR ?auto_23978 ) ( ON-TABLE ?auto_23980 ) ( ON ?auto_23981 ?auto_23980 ) ( not ( = ?auto_23980 ?auto_23981 ) ) ( not ( = ?auto_23980 ?auto_23979 ) ) ( not ( = ?auto_23980 ?auto_23978 ) ) ( not ( = ?auto_23977 ?auto_23980 ) ) ( HOLDING ?auto_23977 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23977 )
      ( MAKE-3PILE ?auto_23977 ?auto_23978 ?auto_23979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23982 - BLOCK
      ?auto_23983 - BLOCK
      ?auto_23984 - BLOCK
    )
    :vars
    (
      ?auto_23985 - BLOCK
      ?auto_23986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23982 ?auto_23983 ) ) ( not ( = ?auto_23982 ?auto_23984 ) ) ( not ( = ?auto_23983 ?auto_23984 ) ) ( ON ?auto_23984 ?auto_23985 ) ( not ( = ?auto_23982 ?auto_23985 ) ) ( not ( = ?auto_23983 ?auto_23985 ) ) ( not ( = ?auto_23984 ?auto_23985 ) ) ( ON ?auto_23983 ?auto_23984 ) ( ON-TABLE ?auto_23986 ) ( ON ?auto_23985 ?auto_23986 ) ( not ( = ?auto_23986 ?auto_23985 ) ) ( not ( = ?auto_23986 ?auto_23984 ) ) ( not ( = ?auto_23986 ?auto_23983 ) ) ( not ( = ?auto_23982 ?auto_23986 ) ) ( ON ?auto_23982 ?auto_23983 ) ( CLEAR ?auto_23982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23986 ?auto_23985 ?auto_23984 ?auto_23983 )
      ( MAKE-3PILE ?auto_23982 ?auto_23983 ?auto_23984 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23987 - BLOCK
      ?auto_23988 - BLOCK
      ?auto_23989 - BLOCK
    )
    :vars
    (
      ?auto_23991 - BLOCK
      ?auto_23990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23987 ?auto_23988 ) ) ( not ( = ?auto_23987 ?auto_23989 ) ) ( not ( = ?auto_23988 ?auto_23989 ) ) ( ON ?auto_23989 ?auto_23991 ) ( not ( = ?auto_23987 ?auto_23991 ) ) ( not ( = ?auto_23988 ?auto_23991 ) ) ( not ( = ?auto_23989 ?auto_23991 ) ) ( ON ?auto_23988 ?auto_23989 ) ( ON-TABLE ?auto_23990 ) ( ON ?auto_23991 ?auto_23990 ) ( not ( = ?auto_23990 ?auto_23991 ) ) ( not ( = ?auto_23990 ?auto_23989 ) ) ( not ( = ?auto_23990 ?auto_23988 ) ) ( not ( = ?auto_23987 ?auto_23990 ) ) ( HOLDING ?auto_23987 ) ( CLEAR ?auto_23988 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23990 ?auto_23991 ?auto_23989 ?auto_23988 ?auto_23987 )
      ( MAKE-3PILE ?auto_23987 ?auto_23988 ?auto_23989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23992 - BLOCK
      ?auto_23993 - BLOCK
      ?auto_23994 - BLOCK
    )
    :vars
    (
      ?auto_23996 - BLOCK
      ?auto_23995 - BLOCK
      ?auto_23997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23992 ?auto_23993 ) ) ( not ( = ?auto_23992 ?auto_23994 ) ) ( not ( = ?auto_23993 ?auto_23994 ) ) ( ON ?auto_23994 ?auto_23996 ) ( not ( = ?auto_23992 ?auto_23996 ) ) ( not ( = ?auto_23993 ?auto_23996 ) ) ( not ( = ?auto_23994 ?auto_23996 ) ) ( ON ?auto_23993 ?auto_23994 ) ( ON-TABLE ?auto_23995 ) ( ON ?auto_23996 ?auto_23995 ) ( not ( = ?auto_23995 ?auto_23996 ) ) ( not ( = ?auto_23995 ?auto_23994 ) ) ( not ( = ?auto_23995 ?auto_23993 ) ) ( not ( = ?auto_23992 ?auto_23995 ) ) ( CLEAR ?auto_23993 ) ( ON ?auto_23992 ?auto_23997 ) ( CLEAR ?auto_23992 ) ( HAND-EMPTY ) ( not ( = ?auto_23992 ?auto_23997 ) ) ( not ( = ?auto_23993 ?auto_23997 ) ) ( not ( = ?auto_23994 ?auto_23997 ) ) ( not ( = ?auto_23996 ?auto_23997 ) ) ( not ( = ?auto_23995 ?auto_23997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23992 ?auto_23997 )
      ( MAKE-3PILE ?auto_23992 ?auto_23993 ?auto_23994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23998 - BLOCK
      ?auto_23999 - BLOCK
      ?auto_24000 - BLOCK
    )
    :vars
    (
      ?auto_24003 - BLOCK
      ?auto_24002 - BLOCK
      ?auto_24001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23998 ?auto_23999 ) ) ( not ( = ?auto_23998 ?auto_24000 ) ) ( not ( = ?auto_23999 ?auto_24000 ) ) ( ON ?auto_24000 ?auto_24003 ) ( not ( = ?auto_23998 ?auto_24003 ) ) ( not ( = ?auto_23999 ?auto_24003 ) ) ( not ( = ?auto_24000 ?auto_24003 ) ) ( ON-TABLE ?auto_24002 ) ( ON ?auto_24003 ?auto_24002 ) ( not ( = ?auto_24002 ?auto_24003 ) ) ( not ( = ?auto_24002 ?auto_24000 ) ) ( not ( = ?auto_24002 ?auto_23999 ) ) ( not ( = ?auto_23998 ?auto_24002 ) ) ( ON ?auto_23998 ?auto_24001 ) ( CLEAR ?auto_23998 ) ( not ( = ?auto_23998 ?auto_24001 ) ) ( not ( = ?auto_23999 ?auto_24001 ) ) ( not ( = ?auto_24000 ?auto_24001 ) ) ( not ( = ?auto_24003 ?auto_24001 ) ) ( not ( = ?auto_24002 ?auto_24001 ) ) ( HOLDING ?auto_23999 ) ( CLEAR ?auto_24000 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24002 ?auto_24003 ?auto_24000 ?auto_23999 )
      ( MAKE-3PILE ?auto_23998 ?auto_23999 ?auto_24000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24004 - BLOCK
      ?auto_24005 - BLOCK
      ?auto_24006 - BLOCK
    )
    :vars
    (
      ?auto_24007 - BLOCK
      ?auto_24009 - BLOCK
      ?auto_24008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24004 ?auto_24005 ) ) ( not ( = ?auto_24004 ?auto_24006 ) ) ( not ( = ?auto_24005 ?auto_24006 ) ) ( ON ?auto_24006 ?auto_24007 ) ( not ( = ?auto_24004 ?auto_24007 ) ) ( not ( = ?auto_24005 ?auto_24007 ) ) ( not ( = ?auto_24006 ?auto_24007 ) ) ( ON-TABLE ?auto_24009 ) ( ON ?auto_24007 ?auto_24009 ) ( not ( = ?auto_24009 ?auto_24007 ) ) ( not ( = ?auto_24009 ?auto_24006 ) ) ( not ( = ?auto_24009 ?auto_24005 ) ) ( not ( = ?auto_24004 ?auto_24009 ) ) ( ON ?auto_24004 ?auto_24008 ) ( not ( = ?auto_24004 ?auto_24008 ) ) ( not ( = ?auto_24005 ?auto_24008 ) ) ( not ( = ?auto_24006 ?auto_24008 ) ) ( not ( = ?auto_24007 ?auto_24008 ) ) ( not ( = ?auto_24009 ?auto_24008 ) ) ( CLEAR ?auto_24006 ) ( ON ?auto_24005 ?auto_24004 ) ( CLEAR ?auto_24005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24008 ?auto_24004 )
      ( MAKE-3PILE ?auto_24004 ?auto_24005 ?auto_24006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24010 - BLOCK
      ?auto_24011 - BLOCK
      ?auto_24012 - BLOCK
    )
    :vars
    (
      ?auto_24013 - BLOCK
      ?auto_24015 - BLOCK
      ?auto_24014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24010 ?auto_24011 ) ) ( not ( = ?auto_24010 ?auto_24012 ) ) ( not ( = ?auto_24011 ?auto_24012 ) ) ( not ( = ?auto_24010 ?auto_24013 ) ) ( not ( = ?auto_24011 ?auto_24013 ) ) ( not ( = ?auto_24012 ?auto_24013 ) ) ( ON-TABLE ?auto_24015 ) ( ON ?auto_24013 ?auto_24015 ) ( not ( = ?auto_24015 ?auto_24013 ) ) ( not ( = ?auto_24015 ?auto_24012 ) ) ( not ( = ?auto_24015 ?auto_24011 ) ) ( not ( = ?auto_24010 ?auto_24015 ) ) ( ON ?auto_24010 ?auto_24014 ) ( not ( = ?auto_24010 ?auto_24014 ) ) ( not ( = ?auto_24011 ?auto_24014 ) ) ( not ( = ?auto_24012 ?auto_24014 ) ) ( not ( = ?auto_24013 ?auto_24014 ) ) ( not ( = ?auto_24015 ?auto_24014 ) ) ( ON ?auto_24011 ?auto_24010 ) ( CLEAR ?auto_24011 ) ( ON-TABLE ?auto_24014 ) ( HOLDING ?auto_24012 ) ( CLEAR ?auto_24013 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24015 ?auto_24013 ?auto_24012 )
      ( MAKE-3PILE ?auto_24010 ?auto_24011 ?auto_24012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24016 - BLOCK
      ?auto_24017 - BLOCK
      ?auto_24018 - BLOCK
    )
    :vars
    (
      ?auto_24020 - BLOCK
      ?auto_24019 - BLOCK
      ?auto_24021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24016 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24018 ) ) ( not ( = ?auto_24016 ?auto_24020 ) ) ( not ( = ?auto_24017 ?auto_24020 ) ) ( not ( = ?auto_24018 ?auto_24020 ) ) ( ON-TABLE ?auto_24019 ) ( ON ?auto_24020 ?auto_24019 ) ( not ( = ?auto_24019 ?auto_24020 ) ) ( not ( = ?auto_24019 ?auto_24018 ) ) ( not ( = ?auto_24019 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24019 ) ) ( ON ?auto_24016 ?auto_24021 ) ( not ( = ?auto_24016 ?auto_24021 ) ) ( not ( = ?auto_24017 ?auto_24021 ) ) ( not ( = ?auto_24018 ?auto_24021 ) ) ( not ( = ?auto_24020 ?auto_24021 ) ) ( not ( = ?auto_24019 ?auto_24021 ) ) ( ON ?auto_24017 ?auto_24016 ) ( ON-TABLE ?auto_24021 ) ( CLEAR ?auto_24020 ) ( ON ?auto_24018 ?auto_24017 ) ( CLEAR ?auto_24018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24021 ?auto_24016 ?auto_24017 )
      ( MAKE-3PILE ?auto_24016 ?auto_24017 ?auto_24018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24022 - BLOCK
      ?auto_24023 - BLOCK
      ?auto_24024 - BLOCK
    )
    :vars
    (
      ?auto_24025 - BLOCK
      ?auto_24026 - BLOCK
      ?auto_24027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24022 ?auto_24023 ) ) ( not ( = ?auto_24022 ?auto_24024 ) ) ( not ( = ?auto_24023 ?auto_24024 ) ) ( not ( = ?auto_24022 ?auto_24025 ) ) ( not ( = ?auto_24023 ?auto_24025 ) ) ( not ( = ?auto_24024 ?auto_24025 ) ) ( ON-TABLE ?auto_24026 ) ( not ( = ?auto_24026 ?auto_24025 ) ) ( not ( = ?auto_24026 ?auto_24024 ) ) ( not ( = ?auto_24026 ?auto_24023 ) ) ( not ( = ?auto_24022 ?auto_24026 ) ) ( ON ?auto_24022 ?auto_24027 ) ( not ( = ?auto_24022 ?auto_24027 ) ) ( not ( = ?auto_24023 ?auto_24027 ) ) ( not ( = ?auto_24024 ?auto_24027 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( not ( = ?auto_24026 ?auto_24027 ) ) ( ON ?auto_24023 ?auto_24022 ) ( ON-TABLE ?auto_24027 ) ( ON ?auto_24024 ?auto_24023 ) ( CLEAR ?auto_24024 ) ( HOLDING ?auto_24025 ) ( CLEAR ?auto_24026 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24026 ?auto_24025 )
      ( MAKE-3PILE ?auto_24022 ?auto_24023 ?auto_24024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24028 - BLOCK
      ?auto_24029 - BLOCK
      ?auto_24030 - BLOCK
    )
    :vars
    (
      ?auto_24033 - BLOCK
      ?auto_24031 - BLOCK
      ?auto_24032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24028 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24030 ) ) ( not ( = ?auto_24029 ?auto_24030 ) ) ( not ( = ?auto_24028 ?auto_24033 ) ) ( not ( = ?auto_24029 ?auto_24033 ) ) ( not ( = ?auto_24030 ?auto_24033 ) ) ( ON-TABLE ?auto_24031 ) ( not ( = ?auto_24031 ?auto_24033 ) ) ( not ( = ?auto_24031 ?auto_24030 ) ) ( not ( = ?auto_24031 ?auto_24029 ) ) ( not ( = ?auto_24028 ?auto_24031 ) ) ( ON ?auto_24028 ?auto_24032 ) ( not ( = ?auto_24028 ?auto_24032 ) ) ( not ( = ?auto_24029 ?auto_24032 ) ) ( not ( = ?auto_24030 ?auto_24032 ) ) ( not ( = ?auto_24033 ?auto_24032 ) ) ( not ( = ?auto_24031 ?auto_24032 ) ) ( ON ?auto_24029 ?auto_24028 ) ( ON-TABLE ?auto_24032 ) ( ON ?auto_24030 ?auto_24029 ) ( CLEAR ?auto_24031 ) ( ON ?auto_24033 ?auto_24030 ) ( CLEAR ?auto_24033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24032 ?auto_24028 ?auto_24029 ?auto_24030 )
      ( MAKE-3PILE ?auto_24028 ?auto_24029 ?auto_24030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24034 - BLOCK
      ?auto_24035 - BLOCK
      ?auto_24036 - BLOCK
    )
    :vars
    (
      ?auto_24038 - BLOCK
      ?auto_24039 - BLOCK
      ?auto_24037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24034 ?auto_24035 ) ) ( not ( = ?auto_24034 ?auto_24036 ) ) ( not ( = ?auto_24035 ?auto_24036 ) ) ( not ( = ?auto_24034 ?auto_24038 ) ) ( not ( = ?auto_24035 ?auto_24038 ) ) ( not ( = ?auto_24036 ?auto_24038 ) ) ( not ( = ?auto_24039 ?auto_24038 ) ) ( not ( = ?auto_24039 ?auto_24036 ) ) ( not ( = ?auto_24039 ?auto_24035 ) ) ( not ( = ?auto_24034 ?auto_24039 ) ) ( ON ?auto_24034 ?auto_24037 ) ( not ( = ?auto_24034 ?auto_24037 ) ) ( not ( = ?auto_24035 ?auto_24037 ) ) ( not ( = ?auto_24036 ?auto_24037 ) ) ( not ( = ?auto_24038 ?auto_24037 ) ) ( not ( = ?auto_24039 ?auto_24037 ) ) ( ON ?auto_24035 ?auto_24034 ) ( ON-TABLE ?auto_24037 ) ( ON ?auto_24036 ?auto_24035 ) ( ON ?auto_24038 ?auto_24036 ) ( CLEAR ?auto_24038 ) ( HOLDING ?auto_24039 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24039 )
      ( MAKE-3PILE ?auto_24034 ?auto_24035 ?auto_24036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_24040 - BLOCK
      ?auto_24041 - BLOCK
      ?auto_24042 - BLOCK
    )
    :vars
    (
      ?auto_24045 - BLOCK
      ?auto_24044 - BLOCK
      ?auto_24043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24040 ?auto_24041 ) ) ( not ( = ?auto_24040 ?auto_24042 ) ) ( not ( = ?auto_24041 ?auto_24042 ) ) ( not ( = ?auto_24040 ?auto_24045 ) ) ( not ( = ?auto_24041 ?auto_24045 ) ) ( not ( = ?auto_24042 ?auto_24045 ) ) ( not ( = ?auto_24044 ?auto_24045 ) ) ( not ( = ?auto_24044 ?auto_24042 ) ) ( not ( = ?auto_24044 ?auto_24041 ) ) ( not ( = ?auto_24040 ?auto_24044 ) ) ( ON ?auto_24040 ?auto_24043 ) ( not ( = ?auto_24040 ?auto_24043 ) ) ( not ( = ?auto_24041 ?auto_24043 ) ) ( not ( = ?auto_24042 ?auto_24043 ) ) ( not ( = ?auto_24045 ?auto_24043 ) ) ( not ( = ?auto_24044 ?auto_24043 ) ) ( ON ?auto_24041 ?auto_24040 ) ( ON-TABLE ?auto_24043 ) ( ON ?auto_24042 ?auto_24041 ) ( ON ?auto_24045 ?auto_24042 ) ( ON ?auto_24044 ?auto_24045 ) ( CLEAR ?auto_24044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24043 ?auto_24040 ?auto_24041 ?auto_24042 ?auto_24045 )
      ( MAKE-3PILE ?auto_24040 ?auto_24041 ?auto_24042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24047 - BLOCK
    )
    :vars
    (
      ?auto_24048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24048 ?auto_24047 ) ( CLEAR ?auto_24048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24047 ) ( not ( = ?auto_24047 ?auto_24048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24048 ?auto_24047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24049 - BLOCK
    )
    :vars
    (
      ?auto_24050 - BLOCK
      ?auto_24051 - BLOCK
      ?auto_24052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24050 ?auto_24049 ) ( CLEAR ?auto_24050 ) ( ON-TABLE ?auto_24049 ) ( not ( = ?auto_24049 ?auto_24050 ) ) ( HOLDING ?auto_24051 ) ( CLEAR ?auto_24052 ) ( not ( = ?auto_24049 ?auto_24051 ) ) ( not ( = ?auto_24049 ?auto_24052 ) ) ( not ( = ?auto_24050 ?auto_24051 ) ) ( not ( = ?auto_24050 ?auto_24052 ) ) ( not ( = ?auto_24051 ?auto_24052 ) ) )
    :subtasks
    ( ( !STACK ?auto_24051 ?auto_24052 )
      ( MAKE-1PILE ?auto_24049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24053 - BLOCK
    )
    :vars
    (
      ?auto_24055 - BLOCK
      ?auto_24056 - BLOCK
      ?auto_24054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24055 ?auto_24053 ) ( ON-TABLE ?auto_24053 ) ( not ( = ?auto_24053 ?auto_24055 ) ) ( CLEAR ?auto_24056 ) ( not ( = ?auto_24053 ?auto_24054 ) ) ( not ( = ?auto_24053 ?auto_24056 ) ) ( not ( = ?auto_24055 ?auto_24054 ) ) ( not ( = ?auto_24055 ?auto_24056 ) ) ( not ( = ?auto_24054 ?auto_24056 ) ) ( ON ?auto_24054 ?auto_24055 ) ( CLEAR ?auto_24054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24053 ?auto_24055 )
      ( MAKE-1PILE ?auto_24053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24057 - BLOCK
    )
    :vars
    (
      ?auto_24059 - BLOCK
      ?auto_24060 - BLOCK
      ?auto_24058 - BLOCK
      ?auto_24061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24059 ?auto_24057 ) ( ON-TABLE ?auto_24057 ) ( not ( = ?auto_24057 ?auto_24059 ) ) ( not ( = ?auto_24057 ?auto_24060 ) ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( not ( = ?auto_24059 ?auto_24060 ) ) ( not ( = ?auto_24059 ?auto_24058 ) ) ( not ( = ?auto_24060 ?auto_24058 ) ) ( ON ?auto_24060 ?auto_24059 ) ( CLEAR ?auto_24060 ) ( HOLDING ?auto_24058 ) ( CLEAR ?auto_24061 ) ( ON-TABLE ?auto_24061 ) ( not ( = ?auto_24061 ?auto_24058 ) ) ( not ( = ?auto_24057 ?auto_24061 ) ) ( not ( = ?auto_24059 ?auto_24061 ) ) ( not ( = ?auto_24060 ?auto_24061 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24061 ?auto_24058 )
      ( MAKE-1PILE ?auto_24057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24062 - BLOCK
    )
    :vars
    (
      ?auto_24064 - BLOCK
      ?auto_24065 - BLOCK
      ?auto_24066 - BLOCK
      ?auto_24063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24064 ?auto_24062 ) ( ON-TABLE ?auto_24062 ) ( not ( = ?auto_24062 ?auto_24064 ) ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( not ( = ?auto_24062 ?auto_24066 ) ) ( not ( = ?auto_24064 ?auto_24065 ) ) ( not ( = ?auto_24064 ?auto_24066 ) ) ( not ( = ?auto_24065 ?auto_24066 ) ) ( ON ?auto_24065 ?auto_24064 ) ( CLEAR ?auto_24063 ) ( ON-TABLE ?auto_24063 ) ( not ( = ?auto_24063 ?auto_24066 ) ) ( not ( = ?auto_24062 ?auto_24063 ) ) ( not ( = ?auto_24064 ?auto_24063 ) ) ( not ( = ?auto_24065 ?auto_24063 ) ) ( ON ?auto_24066 ?auto_24065 ) ( CLEAR ?auto_24066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24062 ?auto_24064 ?auto_24065 )
      ( MAKE-1PILE ?auto_24062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24067 - BLOCK
    )
    :vars
    (
      ?auto_24070 - BLOCK
      ?auto_24068 - BLOCK
      ?auto_24069 - BLOCK
      ?auto_24071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24070 ?auto_24067 ) ( ON-TABLE ?auto_24067 ) ( not ( = ?auto_24067 ?auto_24070 ) ) ( not ( = ?auto_24067 ?auto_24068 ) ) ( not ( = ?auto_24067 ?auto_24069 ) ) ( not ( = ?auto_24070 ?auto_24068 ) ) ( not ( = ?auto_24070 ?auto_24069 ) ) ( not ( = ?auto_24068 ?auto_24069 ) ) ( ON ?auto_24068 ?auto_24070 ) ( not ( = ?auto_24071 ?auto_24069 ) ) ( not ( = ?auto_24067 ?auto_24071 ) ) ( not ( = ?auto_24070 ?auto_24071 ) ) ( not ( = ?auto_24068 ?auto_24071 ) ) ( ON ?auto_24069 ?auto_24068 ) ( CLEAR ?auto_24069 ) ( HOLDING ?auto_24071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24071 )
      ( MAKE-1PILE ?auto_24067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24072 - BLOCK
    )
    :vars
    (
      ?auto_24075 - BLOCK
      ?auto_24074 - BLOCK
      ?auto_24073 - BLOCK
      ?auto_24076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24075 ?auto_24072 ) ( ON-TABLE ?auto_24072 ) ( not ( = ?auto_24072 ?auto_24075 ) ) ( not ( = ?auto_24072 ?auto_24074 ) ) ( not ( = ?auto_24072 ?auto_24073 ) ) ( not ( = ?auto_24075 ?auto_24074 ) ) ( not ( = ?auto_24075 ?auto_24073 ) ) ( not ( = ?auto_24074 ?auto_24073 ) ) ( ON ?auto_24074 ?auto_24075 ) ( not ( = ?auto_24076 ?auto_24073 ) ) ( not ( = ?auto_24072 ?auto_24076 ) ) ( not ( = ?auto_24075 ?auto_24076 ) ) ( not ( = ?auto_24074 ?auto_24076 ) ) ( ON ?auto_24073 ?auto_24074 ) ( ON ?auto_24076 ?auto_24073 ) ( CLEAR ?auto_24076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24072 ?auto_24075 ?auto_24074 ?auto_24073 )
      ( MAKE-1PILE ?auto_24072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24077 - BLOCK
    )
    :vars
    (
      ?auto_24080 - BLOCK
      ?auto_24079 - BLOCK
      ?auto_24078 - BLOCK
      ?auto_24081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24080 ?auto_24077 ) ( ON-TABLE ?auto_24077 ) ( not ( = ?auto_24077 ?auto_24080 ) ) ( not ( = ?auto_24077 ?auto_24079 ) ) ( not ( = ?auto_24077 ?auto_24078 ) ) ( not ( = ?auto_24080 ?auto_24079 ) ) ( not ( = ?auto_24080 ?auto_24078 ) ) ( not ( = ?auto_24079 ?auto_24078 ) ) ( ON ?auto_24079 ?auto_24080 ) ( not ( = ?auto_24081 ?auto_24078 ) ) ( not ( = ?auto_24077 ?auto_24081 ) ) ( not ( = ?auto_24080 ?auto_24081 ) ) ( not ( = ?auto_24079 ?auto_24081 ) ) ( ON ?auto_24078 ?auto_24079 ) ( HOLDING ?auto_24081 ) ( CLEAR ?auto_24078 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24077 ?auto_24080 ?auto_24079 ?auto_24078 ?auto_24081 )
      ( MAKE-1PILE ?auto_24077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24082 - BLOCK
    )
    :vars
    (
      ?auto_24085 - BLOCK
      ?auto_24086 - BLOCK
      ?auto_24083 - BLOCK
      ?auto_24084 - BLOCK
      ?auto_24087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24085 ?auto_24082 ) ( ON-TABLE ?auto_24082 ) ( not ( = ?auto_24082 ?auto_24085 ) ) ( not ( = ?auto_24082 ?auto_24086 ) ) ( not ( = ?auto_24082 ?auto_24083 ) ) ( not ( = ?auto_24085 ?auto_24086 ) ) ( not ( = ?auto_24085 ?auto_24083 ) ) ( not ( = ?auto_24086 ?auto_24083 ) ) ( ON ?auto_24086 ?auto_24085 ) ( not ( = ?auto_24084 ?auto_24083 ) ) ( not ( = ?auto_24082 ?auto_24084 ) ) ( not ( = ?auto_24085 ?auto_24084 ) ) ( not ( = ?auto_24086 ?auto_24084 ) ) ( ON ?auto_24083 ?auto_24086 ) ( CLEAR ?auto_24083 ) ( ON ?auto_24084 ?auto_24087 ) ( CLEAR ?auto_24084 ) ( HAND-EMPTY ) ( not ( = ?auto_24082 ?auto_24087 ) ) ( not ( = ?auto_24085 ?auto_24087 ) ) ( not ( = ?auto_24086 ?auto_24087 ) ) ( not ( = ?auto_24083 ?auto_24087 ) ) ( not ( = ?auto_24084 ?auto_24087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24084 ?auto_24087 )
      ( MAKE-1PILE ?auto_24082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24088 - BLOCK
    )
    :vars
    (
      ?auto_24091 - BLOCK
      ?auto_24092 - BLOCK
      ?auto_24093 - BLOCK
      ?auto_24090 - BLOCK
      ?auto_24089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24091 ?auto_24088 ) ( ON-TABLE ?auto_24088 ) ( not ( = ?auto_24088 ?auto_24091 ) ) ( not ( = ?auto_24088 ?auto_24092 ) ) ( not ( = ?auto_24088 ?auto_24093 ) ) ( not ( = ?auto_24091 ?auto_24092 ) ) ( not ( = ?auto_24091 ?auto_24093 ) ) ( not ( = ?auto_24092 ?auto_24093 ) ) ( ON ?auto_24092 ?auto_24091 ) ( not ( = ?auto_24090 ?auto_24093 ) ) ( not ( = ?auto_24088 ?auto_24090 ) ) ( not ( = ?auto_24091 ?auto_24090 ) ) ( not ( = ?auto_24092 ?auto_24090 ) ) ( ON ?auto_24090 ?auto_24089 ) ( CLEAR ?auto_24090 ) ( not ( = ?auto_24088 ?auto_24089 ) ) ( not ( = ?auto_24091 ?auto_24089 ) ) ( not ( = ?auto_24092 ?auto_24089 ) ) ( not ( = ?auto_24093 ?auto_24089 ) ) ( not ( = ?auto_24090 ?auto_24089 ) ) ( HOLDING ?auto_24093 ) ( CLEAR ?auto_24092 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24088 ?auto_24091 ?auto_24092 ?auto_24093 )
      ( MAKE-1PILE ?auto_24088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24094 - BLOCK
    )
    :vars
    (
      ?auto_24095 - BLOCK
      ?auto_24096 - BLOCK
      ?auto_24098 - BLOCK
      ?auto_24097 - BLOCK
      ?auto_24099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24095 ?auto_24094 ) ( ON-TABLE ?auto_24094 ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24094 ?auto_24096 ) ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24095 ?auto_24096 ) ) ( not ( = ?auto_24095 ?auto_24098 ) ) ( not ( = ?auto_24096 ?auto_24098 ) ) ( ON ?auto_24096 ?auto_24095 ) ( not ( = ?auto_24097 ?auto_24098 ) ) ( not ( = ?auto_24094 ?auto_24097 ) ) ( not ( = ?auto_24095 ?auto_24097 ) ) ( not ( = ?auto_24096 ?auto_24097 ) ) ( ON ?auto_24097 ?auto_24099 ) ( not ( = ?auto_24094 ?auto_24099 ) ) ( not ( = ?auto_24095 ?auto_24099 ) ) ( not ( = ?auto_24096 ?auto_24099 ) ) ( not ( = ?auto_24098 ?auto_24099 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( CLEAR ?auto_24096 ) ( ON ?auto_24098 ?auto_24097 ) ( CLEAR ?auto_24098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24099 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24099 ?auto_24097 )
      ( MAKE-1PILE ?auto_24094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24100 - BLOCK
    )
    :vars
    (
      ?auto_24105 - BLOCK
      ?auto_24104 - BLOCK
      ?auto_24102 - BLOCK
      ?auto_24103 - BLOCK
      ?auto_24101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24105 ?auto_24100 ) ( ON-TABLE ?auto_24100 ) ( not ( = ?auto_24100 ?auto_24105 ) ) ( not ( = ?auto_24100 ?auto_24104 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) ( not ( = ?auto_24105 ?auto_24104 ) ) ( not ( = ?auto_24105 ?auto_24102 ) ) ( not ( = ?auto_24104 ?auto_24102 ) ) ( not ( = ?auto_24103 ?auto_24102 ) ) ( not ( = ?auto_24100 ?auto_24103 ) ) ( not ( = ?auto_24105 ?auto_24103 ) ) ( not ( = ?auto_24104 ?auto_24103 ) ) ( ON ?auto_24103 ?auto_24101 ) ( not ( = ?auto_24100 ?auto_24101 ) ) ( not ( = ?auto_24105 ?auto_24101 ) ) ( not ( = ?auto_24104 ?auto_24101 ) ) ( not ( = ?auto_24102 ?auto_24101 ) ) ( not ( = ?auto_24103 ?auto_24101 ) ) ( ON ?auto_24102 ?auto_24103 ) ( CLEAR ?auto_24102 ) ( ON-TABLE ?auto_24101 ) ( HOLDING ?auto_24104 ) ( CLEAR ?auto_24105 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24100 ?auto_24105 ?auto_24104 )
      ( MAKE-1PILE ?auto_24100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24106 - BLOCK
    )
    :vars
    (
      ?auto_24111 - BLOCK
      ?auto_24109 - BLOCK
      ?auto_24108 - BLOCK
      ?auto_24110 - BLOCK
      ?auto_24107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_24111 ?auto_24106 ) ( ON-TABLE ?auto_24106 ) ( not ( = ?auto_24106 ?auto_24111 ) ) ( not ( = ?auto_24106 ?auto_24109 ) ) ( not ( = ?auto_24106 ?auto_24108 ) ) ( not ( = ?auto_24111 ?auto_24109 ) ) ( not ( = ?auto_24111 ?auto_24108 ) ) ( not ( = ?auto_24109 ?auto_24108 ) ) ( not ( = ?auto_24110 ?auto_24108 ) ) ( not ( = ?auto_24106 ?auto_24110 ) ) ( not ( = ?auto_24111 ?auto_24110 ) ) ( not ( = ?auto_24109 ?auto_24110 ) ) ( ON ?auto_24110 ?auto_24107 ) ( not ( = ?auto_24106 ?auto_24107 ) ) ( not ( = ?auto_24111 ?auto_24107 ) ) ( not ( = ?auto_24109 ?auto_24107 ) ) ( not ( = ?auto_24108 ?auto_24107 ) ) ( not ( = ?auto_24110 ?auto_24107 ) ) ( ON ?auto_24108 ?auto_24110 ) ( ON-TABLE ?auto_24107 ) ( CLEAR ?auto_24111 ) ( ON ?auto_24109 ?auto_24108 ) ( CLEAR ?auto_24109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24107 ?auto_24110 ?auto_24108 )
      ( MAKE-1PILE ?auto_24106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24124 - BLOCK
    )
    :vars
    (
      ?auto_24129 - BLOCK
      ?auto_24127 - BLOCK
      ?auto_24125 - BLOCK
      ?auto_24126 - BLOCK
      ?auto_24128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24124 ?auto_24129 ) ) ( not ( = ?auto_24124 ?auto_24127 ) ) ( not ( = ?auto_24124 ?auto_24125 ) ) ( not ( = ?auto_24129 ?auto_24127 ) ) ( not ( = ?auto_24129 ?auto_24125 ) ) ( not ( = ?auto_24127 ?auto_24125 ) ) ( not ( = ?auto_24126 ?auto_24125 ) ) ( not ( = ?auto_24124 ?auto_24126 ) ) ( not ( = ?auto_24129 ?auto_24126 ) ) ( not ( = ?auto_24127 ?auto_24126 ) ) ( ON ?auto_24126 ?auto_24128 ) ( not ( = ?auto_24124 ?auto_24128 ) ) ( not ( = ?auto_24129 ?auto_24128 ) ) ( not ( = ?auto_24127 ?auto_24128 ) ) ( not ( = ?auto_24125 ?auto_24128 ) ) ( not ( = ?auto_24126 ?auto_24128 ) ) ( ON ?auto_24125 ?auto_24126 ) ( ON-TABLE ?auto_24128 ) ( ON ?auto_24127 ?auto_24125 ) ( ON ?auto_24129 ?auto_24127 ) ( CLEAR ?auto_24129 ) ( HOLDING ?auto_24124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24124 ?auto_24129 )
      ( MAKE-1PILE ?auto_24124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_24130 - BLOCK
    )
    :vars
    (
      ?auto_24132 - BLOCK
      ?auto_24135 - BLOCK
      ?auto_24133 - BLOCK
      ?auto_24134 - BLOCK
      ?auto_24131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24135 ) ) ( not ( = ?auto_24130 ?auto_24133 ) ) ( not ( = ?auto_24132 ?auto_24135 ) ) ( not ( = ?auto_24132 ?auto_24133 ) ) ( not ( = ?auto_24135 ?auto_24133 ) ) ( not ( = ?auto_24134 ?auto_24133 ) ) ( not ( = ?auto_24130 ?auto_24134 ) ) ( not ( = ?auto_24132 ?auto_24134 ) ) ( not ( = ?auto_24135 ?auto_24134 ) ) ( ON ?auto_24134 ?auto_24131 ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24132 ?auto_24131 ) ) ( not ( = ?auto_24135 ?auto_24131 ) ) ( not ( = ?auto_24133 ?auto_24131 ) ) ( not ( = ?auto_24134 ?auto_24131 ) ) ( ON ?auto_24133 ?auto_24134 ) ( ON-TABLE ?auto_24131 ) ( ON ?auto_24135 ?auto_24133 ) ( ON ?auto_24132 ?auto_24135 ) ( ON ?auto_24130 ?auto_24132 ) ( CLEAR ?auto_24130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24131 ?auto_24134 ?auto_24133 ?auto_24135 ?auto_24132 )
      ( MAKE-1PILE ?auto_24130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24140 - BLOCK
      ?auto_24141 - BLOCK
      ?auto_24142 - BLOCK
      ?auto_24143 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24143 ) ( CLEAR ?auto_24142 ) ( ON-TABLE ?auto_24140 ) ( ON ?auto_24141 ?auto_24140 ) ( ON ?auto_24142 ?auto_24141 ) ( not ( = ?auto_24140 ?auto_24141 ) ) ( not ( = ?auto_24140 ?auto_24142 ) ) ( not ( = ?auto_24140 ?auto_24143 ) ) ( not ( = ?auto_24141 ?auto_24142 ) ) ( not ( = ?auto_24141 ?auto_24143 ) ) ( not ( = ?auto_24142 ?auto_24143 ) ) )
    :subtasks
    ( ( !STACK ?auto_24143 ?auto_24142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24144 - BLOCK
      ?auto_24145 - BLOCK
      ?auto_24146 - BLOCK
      ?auto_24147 - BLOCK
    )
    :vars
    (
      ?auto_24148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24146 ) ( ON-TABLE ?auto_24144 ) ( ON ?auto_24145 ?auto_24144 ) ( ON ?auto_24146 ?auto_24145 ) ( not ( = ?auto_24144 ?auto_24145 ) ) ( not ( = ?auto_24144 ?auto_24146 ) ) ( not ( = ?auto_24144 ?auto_24147 ) ) ( not ( = ?auto_24145 ?auto_24146 ) ) ( not ( = ?auto_24145 ?auto_24147 ) ) ( not ( = ?auto_24146 ?auto_24147 ) ) ( ON ?auto_24147 ?auto_24148 ) ( CLEAR ?auto_24147 ) ( HAND-EMPTY ) ( not ( = ?auto_24144 ?auto_24148 ) ) ( not ( = ?auto_24145 ?auto_24148 ) ) ( not ( = ?auto_24146 ?auto_24148 ) ) ( not ( = ?auto_24147 ?auto_24148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24147 ?auto_24148 )
      ( MAKE-4PILE ?auto_24144 ?auto_24145 ?auto_24146 ?auto_24147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24149 - BLOCK
      ?auto_24150 - BLOCK
      ?auto_24151 - BLOCK
      ?auto_24152 - BLOCK
    )
    :vars
    (
      ?auto_24153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24149 ) ( ON ?auto_24150 ?auto_24149 ) ( not ( = ?auto_24149 ?auto_24150 ) ) ( not ( = ?auto_24149 ?auto_24151 ) ) ( not ( = ?auto_24149 ?auto_24152 ) ) ( not ( = ?auto_24150 ?auto_24151 ) ) ( not ( = ?auto_24150 ?auto_24152 ) ) ( not ( = ?auto_24151 ?auto_24152 ) ) ( ON ?auto_24152 ?auto_24153 ) ( CLEAR ?auto_24152 ) ( not ( = ?auto_24149 ?auto_24153 ) ) ( not ( = ?auto_24150 ?auto_24153 ) ) ( not ( = ?auto_24151 ?auto_24153 ) ) ( not ( = ?auto_24152 ?auto_24153 ) ) ( HOLDING ?auto_24151 ) ( CLEAR ?auto_24150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24149 ?auto_24150 ?auto_24151 )
      ( MAKE-4PILE ?auto_24149 ?auto_24150 ?auto_24151 ?auto_24152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24154 - BLOCK
      ?auto_24155 - BLOCK
      ?auto_24156 - BLOCK
      ?auto_24157 - BLOCK
    )
    :vars
    (
      ?auto_24158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24154 ) ( ON ?auto_24155 ?auto_24154 ) ( not ( = ?auto_24154 ?auto_24155 ) ) ( not ( = ?auto_24154 ?auto_24156 ) ) ( not ( = ?auto_24154 ?auto_24157 ) ) ( not ( = ?auto_24155 ?auto_24156 ) ) ( not ( = ?auto_24155 ?auto_24157 ) ) ( not ( = ?auto_24156 ?auto_24157 ) ) ( ON ?auto_24157 ?auto_24158 ) ( not ( = ?auto_24154 ?auto_24158 ) ) ( not ( = ?auto_24155 ?auto_24158 ) ) ( not ( = ?auto_24156 ?auto_24158 ) ) ( not ( = ?auto_24157 ?auto_24158 ) ) ( CLEAR ?auto_24155 ) ( ON ?auto_24156 ?auto_24157 ) ( CLEAR ?auto_24156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24158 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24158 ?auto_24157 )
      ( MAKE-4PILE ?auto_24154 ?auto_24155 ?auto_24156 ?auto_24157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24159 - BLOCK
      ?auto_24160 - BLOCK
      ?auto_24161 - BLOCK
      ?auto_24162 - BLOCK
    )
    :vars
    (
      ?auto_24163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24159 ) ( not ( = ?auto_24159 ?auto_24160 ) ) ( not ( = ?auto_24159 ?auto_24161 ) ) ( not ( = ?auto_24159 ?auto_24162 ) ) ( not ( = ?auto_24160 ?auto_24161 ) ) ( not ( = ?auto_24160 ?auto_24162 ) ) ( not ( = ?auto_24161 ?auto_24162 ) ) ( ON ?auto_24162 ?auto_24163 ) ( not ( = ?auto_24159 ?auto_24163 ) ) ( not ( = ?auto_24160 ?auto_24163 ) ) ( not ( = ?auto_24161 ?auto_24163 ) ) ( not ( = ?auto_24162 ?auto_24163 ) ) ( ON ?auto_24161 ?auto_24162 ) ( CLEAR ?auto_24161 ) ( ON-TABLE ?auto_24163 ) ( HOLDING ?auto_24160 ) ( CLEAR ?auto_24159 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24159 ?auto_24160 )
      ( MAKE-4PILE ?auto_24159 ?auto_24160 ?auto_24161 ?auto_24162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24164 - BLOCK
      ?auto_24165 - BLOCK
      ?auto_24166 - BLOCK
      ?auto_24167 - BLOCK
    )
    :vars
    (
      ?auto_24168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24164 ) ( not ( = ?auto_24164 ?auto_24165 ) ) ( not ( = ?auto_24164 ?auto_24166 ) ) ( not ( = ?auto_24164 ?auto_24167 ) ) ( not ( = ?auto_24165 ?auto_24166 ) ) ( not ( = ?auto_24165 ?auto_24167 ) ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( ON ?auto_24167 ?auto_24168 ) ( not ( = ?auto_24164 ?auto_24168 ) ) ( not ( = ?auto_24165 ?auto_24168 ) ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24167 ?auto_24168 ) ) ( ON ?auto_24166 ?auto_24167 ) ( ON-TABLE ?auto_24168 ) ( CLEAR ?auto_24164 ) ( ON ?auto_24165 ?auto_24166 ) ( CLEAR ?auto_24165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24168 ?auto_24167 ?auto_24166 )
      ( MAKE-4PILE ?auto_24164 ?auto_24165 ?auto_24166 ?auto_24167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24169 - BLOCK
      ?auto_24170 - BLOCK
      ?auto_24171 - BLOCK
      ?auto_24172 - BLOCK
    )
    :vars
    (
      ?auto_24173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24169 ?auto_24170 ) ) ( not ( = ?auto_24169 ?auto_24171 ) ) ( not ( = ?auto_24169 ?auto_24172 ) ) ( not ( = ?auto_24170 ?auto_24171 ) ) ( not ( = ?auto_24170 ?auto_24172 ) ) ( not ( = ?auto_24171 ?auto_24172 ) ) ( ON ?auto_24172 ?auto_24173 ) ( not ( = ?auto_24169 ?auto_24173 ) ) ( not ( = ?auto_24170 ?auto_24173 ) ) ( not ( = ?auto_24171 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( ON ?auto_24171 ?auto_24172 ) ( ON-TABLE ?auto_24173 ) ( ON ?auto_24170 ?auto_24171 ) ( CLEAR ?auto_24170 ) ( HOLDING ?auto_24169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24169 )
      ( MAKE-4PILE ?auto_24169 ?auto_24170 ?auto_24171 ?auto_24172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24174 - BLOCK
      ?auto_24175 - BLOCK
      ?auto_24176 - BLOCK
      ?auto_24177 - BLOCK
    )
    :vars
    (
      ?auto_24178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24174 ?auto_24175 ) ) ( not ( = ?auto_24174 ?auto_24176 ) ) ( not ( = ?auto_24174 ?auto_24177 ) ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24175 ?auto_24177 ) ) ( not ( = ?auto_24176 ?auto_24177 ) ) ( ON ?auto_24177 ?auto_24178 ) ( not ( = ?auto_24174 ?auto_24178 ) ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( not ( = ?auto_24176 ?auto_24178 ) ) ( not ( = ?auto_24177 ?auto_24178 ) ) ( ON ?auto_24176 ?auto_24177 ) ( ON-TABLE ?auto_24178 ) ( ON ?auto_24175 ?auto_24176 ) ( ON ?auto_24174 ?auto_24175 ) ( CLEAR ?auto_24174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24178 ?auto_24177 ?auto_24176 ?auto_24175 )
      ( MAKE-4PILE ?auto_24174 ?auto_24175 ?auto_24176 ?auto_24177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24179 - BLOCK
      ?auto_24180 - BLOCK
      ?auto_24181 - BLOCK
      ?auto_24182 - BLOCK
    )
    :vars
    (
      ?auto_24183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24179 ?auto_24180 ) ) ( not ( = ?auto_24179 ?auto_24181 ) ) ( not ( = ?auto_24179 ?auto_24182 ) ) ( not ( = ?auto_24180 ?auto_24181 ) ) ( not ( = ?auto_24180 ?auto_24182 ) ) ( not ( = ?auto_24181 ?auto_24182 ) ) ( ON ?auto_24182 ?auto_24183 ) ( not ( = ?auto_24179 ?auto_24183 ) ) ( not ( = ?auto_24180 ?auto_24183 ) ) ( not ( = ?auto_24181 ?auto_24183 ) ) ( not ( = ?auto_24182 ?auto_24183 ) ) ( ON ?auto_24181 ?auto_24182 ) ( ON-TABLE ?auto_24183 ) ( ON ?auto_24180 ?auto_24181 ) ( HOLDING ?auto_24179 ) ( CLEAR ?auto_24180 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24183 ?auto_24182 ?auto_24181 ?auto_24180 ?auto_24179 )
      ( MAKE-4PILE ?auto_24179 ?auto_24180 ?auto_24181 ?auto_24182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24184 - BLOCK
      ?auto_24185 - BLOCK
      ?auto_24186 - BLOCK
      ?auto_24187 - BLOCK
    )
    :vars
    (
      ?auto_24188 - BLOCK
      ?auto_24189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24184 ?auto_24185 ) ) ( not ( = ?auto_24184 ?auto_24186 ) ) ( not ( = ?auto_24184 ?auto_24187 ) ) ( not ( = ?auto_24185 ?auto_24186 ) ) ( not ( = ?auto_24185 ?auto_24187 ) ) ( not ( = ?auto_24186 ?auto_24187 ) ) ( ON ?auto_24187 ?auto_24188 ) ( not ( = ?auto_24184 ?auto_24188 ) ) ( not ( = ?auto_24185 ?auto_24188 ) ) ( not ( = ?auto_24186 ?auto_24188 ) ) ( not ( = ?auto_24187 ?auto_24188 ) ) ( ON ?auto_24186 ?auto_24187 ) ( ON-TABLE ?auto_24188 ) ( ON ?auto_24185 ?auto_24186 ) ( CLEAR ?auto_24185 ) ( ON ?auto_24184 ?auto_24189 ) ( CLEAR ?auto_24184 ) ( HAND-EMPTY ) ( not ( = ?auto_24184 ?auto_24189 ) ) ( not ( = ?auto_24185 ?auto_24189 ) ) ( not ( = ?auto_24186 ?auto_24189 ) ) ( not ( = ?auto_24187 ?auto_24189 ) ) ( not ( = ?auto_24188 ?auto_24189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24184 ?auto_24189 )
      ( MAKE-4PILE ?auto_24184 ?auto_24185 ?auto_24186 ?auto_24187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24190 - BLOCK
      ?auto_24191 - BLOCK
      ?auto_24192 - BLOCK
      ?auto_24193 - BLOCK
    )
    :vars
    (
      ?auto_24195 - BLOCK
      ?auto_24194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24190 ?auto_24191 ) ) ( not ( = ?auto_24190 ?auto_24192 ) ) ( not ( = ?auto_24190 ?auto_24193 ) ) ( not ( = ?auto_24191 ?auto_24192 ) ) ( not ( = ?auto_24191 ?auto_24193 ) ) ( not ( = ?auto_24192 ?auto_24193 ) ) ( ON ?auto_24193 ?auto_24195 ) ( not ( = ?auto_24190 ?auto_24195 ) ) ( not ( = ?auto_24191 ?auto_24195 ) ) ( not ( = ?auto_24192 ?auto_24195 ) ) ( not ( = ?auto_24193 ?auto_24195 ) ) ( ON ?auto_24192 ?auto_24193 ) ( ON-TABLE ?auto_24195 ) ( ON ?auto_24190 ?auto_24194 ) ( CLEAR ?auto_24190 ) ( not ( = ?auto_24190 ?auto_24194 ) ) ( not ( = ?auto_24191 ?auto_24194 ) ) ( not ( = ?auto_24192 ?auto_24194 ) ) ( not ( = ?auto_24193 ?auto_24194 ) ) ( not ( = ?auto_24195 ?auto_24194 ) ) ( HOLDING ?auto_24191 ) ( CLEAR ?auto_24192 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24195 ?auto_24193 ?auto_24192 ?auto_24191 )
      ( MAKE-4PILE ?auto_24190 ?auto_24191 ?auto_24192 ?auto_24193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24196 - BLOCK
      ?auto_24197 - BLOCK
      ?auto_24198 - BLOCK
      ?auto_24199 - BLOCK
    )
    :vars
    (
      ?auto_24201 - BLOCK
      ?auto_24200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24196 ?auto_24197 ) ) ( not ( = ?auto_24196 ?auto_24198 ) ) ( not ( = ?auto_24196 ?auto_24199 ) ) ( not ( = ?auto_24197 ?auto_24198 ) ) ( not ( = ?auto_24197 ?auto_24199 ) ) ( not ( = ?auto_24198 ?auto_24199 ) ) ( ON ?auto_24199 ?auto_24201 ) ( not ( = ?auto_24196 ?auto_24201 ) ) ( not ( = ?auto_24197 ?auto_24201 ) ) ( not ( = ?auto_24198 ?auto_24201 ) ) ( not ( = ?auto_24199 ?auto_24201 ) ) ( ON ?auto_24198 ?auto_24199 ) ( ON-TABLE ?auto_24201 ) ( ON ?auto_24196 ?auto_24200 ) ( not ( = ?auto_24196 ?auto_24200 ) ) ( not ( = ?auto_24197 ?auto_24200 ) ) ( not ( = ?auto_24198 ?auto_24200 ) ) ( not ( = ?auto_24199 ?auto_24200 ) ) ( not ( = ?auto_24201 ?auto_24200 ) ) ( CLEAR ?auto_24198 ) ( ON ?auto_24197 ?auto_24196 ) ( CLEAR ?auto_24197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24200 ?auto_24196 )
      ( MAKE-4PILE ?auto_24196 ?auto_24197 ?auto_24198 ?auto_24199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24202 - BLOCK
      ?auto_24203 - BLOCK
      ?auto_24204 - BLOCK
      ?auto_24205 - BLOCK
    )
    :vars
    (
      ?auto_24207 - BLOCK
      ?auto_24206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24202 ?auto_24203 ) ) ( not ( = ?auto_24202 ?auto_24204 ) ) ( not ( = ?auto_24202 ?auto_24205 ) ) ( not ( = ?auto_24203 ?auto_24204 ) ) ( not ( = ?auto_24203 ?auto_24205 ) ) ( not ( = ?auto_24204 ?auto_24205 ) ) ( ON ?auto_24205 ?auto_24207 ) ( not ( = ?auto_24202 ?auto_24207 ) ) ( not ( = ?auto_24203 ?auto_24207 ) ) ( not ( = ?auto_24204 ?auto_24207 ) ) ( not ( = ?auto_24205 ?auto_24207 ) ) ( ON-TABLE ?auto_24207 ) ( ON ?auto_24202 ?auto_24206 ) ( not ( = ?auto_24202 ?auto_24206 ) ) ( not ( = ?auto_24203 ?auto_24206 ) ) ( not ( = ?auto_24204 ?auto_24206 ) ) ( not ( = ?auto_24205 ?auto_24206 ) ) ( not ( = ?auto_24207 ?auto_24206 ) ) ( ON ?auto_24203 ?auto_24202 ) ( CLEAR ?auto_24203 ) ( ON-TABLE ?auto_24206 ) ( HOLDING ?auto_24204 ) ( CLEAR ?auto_24205 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24207 ?auto_24205 ?auto_24204 )
      ( MAKE-4PILE ?auto_24202 ?auto_24203 ?auto_24204 ?auto_24205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24208 - BLOCK
      ?auto_24209 - BLOCK
      ?auto_24210 - BLOCK
      ?auto_24211 - BLOCK
    )
    :vars
    (
      ?auto_24213 - BLOCK
      ?auto_24212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24208 ?auto_24209 ) ) ( not ( = ?auto_24208 ?auto_24210 ) ) ( not ( = ?auto_24208 ?auto_24211 ) ) ( not ( = ?auto_24209 ?auto_24210 ) ) ( not ( = ?auto_24209 ?auto_24211 ) ) ( not ( = ?auto_24210 ?auto_24211 ) ) ( ON ?auto_24211 ?auto_24213 ) ( not ( = ?auto_24208 ?auto_24213 ) ) ( not ( = ?auto_24209 ?auto_24213 ) ) ( not ( = ?auto_24210 ?auto_24213 ) ) ( not ( = ?auto_24211 ?auto_24213 ) ) ( ON-TABLE ?auto_24213 ) ( ON ?auto_24208 ?auto_24212 ) ( not ( = ?auto_24208 ?auto_24212 ) ) ( not ( = ?auto_24209 ?auto_24212 ) ) ( not ( = ?auto_24210 ?auto_24212 ) ) ( not ( = ?auto_24211 ?auto_24212 ) ) ( not ( = ?auto_24213 ?auto_24212 ) ) ( ON ?auto_24209 ?auto_24208 ) ( ON-TABLE ?auto_24212 ) ( CLEAR ?auto_24211 ) ( ON ?auto_24210 ?auto_24209 ) ( CLEAR ?auto_24210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24212 ?auto_24208 ?auto_24209 )
      ( MAKE-4PILE ?auto_24208 ?auto_24209 ?auto_24210 ?auto_24211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24214 - BLOCK
      ?auto_24215 - BLOCK
      ?auto_24216 - BLOCK
      ?auto_24217 - BLOCK
    )
    :vars
    (
      ?auto_24218 - BLOCK
      ?auto_24219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24214 ?auto_24215 ) ) ( not ( = ?auto_24214 ?auto_24216 ) ) ( not ( = ?auto_24214 ?auto_24217 ) ) ( not ( = ?auto_24215 ?auto_24216 ) ) ( not ( = ?auto_24215 ?auto_24217 ) ) ( not ( = ?auto_24216 ?auto_24217 ) ) ( not ( = ?auto_24214 ?auto_24218 ) ) ( not ( = ?auto_24215 ?auto_24218 ) ) ( not ( = ?auto_24216 ?auto_24218 ) ) ( not ( = ?auto_24217 ?auto_24218 ) ) ( ON-TABLE ?auto_24218 ) ( ON ?auto_24214 ?auto_24219 ) ( not ( = ?auto_24214 ?auto_24219 ) ) ( not ( = ?auto_24215 ?auto_24219 ) ) ( not ( = ?auto_24216 ?auto_24219 ) ) ( not ( = ?auto_24217 ?auto_24219 ) ) ( not ( = ?auto_24218 ?auto_24219 ) ) ( ON ?auto_24215 ?auto_24214 ) ( ON-TABLE ?auto_24219 ) ( ON ?auto_24216 ?auto_24215 ) ( CLEAR ?auto_24216 ) ( HOLDING ?auto_24217 ) ( CLEAR ?auto_24218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24218 ?auto_24217 )
      ( MAKE-4PILE ?auto_24214 ?auto_24215 ?auto_24216 ?auto_24217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24220 - BLOCK
      ?auto_24221 - BLOCK
      ?auto_24222 - BLOCK
      ?auto_24223 - BLOCK
    )
    :vars
    (
      ?auto_24224 - BLOCK
      ?auto_24225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24220 ?auto_24221 ) ) ( not ( = ?auto_24220 ?auto_24222 ) ) ( not ( = ?auto_24220 ?auto_24223 ) ) ( not ( = ?auto_24221 ?auto_24222 ) ) ( not ( = ?auto_24221 ?auto_24223 ) ) ( not ( = ?auto_24222 ?auto_24223 ) ) ( not ( = ?auto_24220 ?auto_24224 ) ) ( not ( = ?auto_24221 ?auto_24224 ) ) ( not ( = ?auto_24222 ?auto_24224 ) ) ( not ( = ?auto_24223 ?auto_24224 ) ) ( ON-TABLE ?auto_24224 ) ( ON ?auto_24220 ?auto_24225 ) ( not ( = ?auto_24220 ?auto_24225 ) ) ( not ( = ?auto_24221 ?auto_24225 ) ) ( not ( = ?auto_24222 ?auto_24225 ) ) ( not ( = ?auto_24223 ?auto_24225 ) ) ( not ( = ?auto_24224 ?auto_24225 ) ) ( ON ?auto_24221 ?auto_24220 ) ( ON-TABLE ?auto_24225 ) ( ON ?auto_24222 ?auto_24221 ) ( CLEAR ?auto_24224 ) ( ON ?auto_24223 ?auto_24222 ) ( CLEAR ?auto_24223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24225 ?auto_24220 ?auto_24221 ?auto_24222 )
      ( MAKE-4PILE ?auto_24220 ?auto_24221 ?auto_24222 ?auto_24223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24226 - BLOCK
      ?auto_24227 - BLOCK
      ?auto_24228 - BLOCK
      ?auto_24229 - BLOCK
    )
    :vars
    (
      ?auto_24230 - BLOCK
      ?auto_24231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24226 ?auto_24227 ) ) ( not ( = ?auto_24226 ?auto_24228 ) ) ( not ( = ?auto_24226 ?auto_24229 ) ) ( not ( = ?auto_24227 ?auto_24228 ) ) ( not ( = ?auto_24227 ?auto_24229 ) ) ( not ( = ?auto_24228 ?auto_24229 ) ) ( not ( = ?auto_24226 ?auto_24230 ) ) ( not ( = ?auto_24227 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24230 ) ) ( not ( = ?auto_24229 ?auto_24230 ) ) ( ON ?auto_24226 ?auto_24231 ) ( not ( = ?auto_24226 ?auto_24231 ) ) ( not ( = ?auto_24227 ?auto_24231 ) ) ( not ( = ?auto_24228 ?auto_24231 ) ) ( not ( = ?auto_24229 ?auto_24231 ) ) ( not ( = ?auto_24230 ?auto_24231 ) ) ( ON ?auto_24227 ?auto_24226 ) ( ON-TABLE ?auto_24231 ) ( ON ?auto_24228 ?auto_24227 ) ( ON ?auto_24229 ?auto_24228 ) ( CLEAR ?auto_24229 ) ( HOLDING ?auto_24230 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24230 )
      ( MAKE-4PILE ?auto_24226 ?auto_24227 ?auto_24228 ?auto_24229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_24232 - BLOCK
      ?auto_24233 - BLOCK
      ?auto_24234 - BLOCK
      ?auto_24235 - BLOCK
    )
    :vars
    (
      ?auto_24237 - BLOCK
      ?auto_24236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24232 ?auto_24233 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( not ( = ?auto_24232 ?auto_24235 ) ) ( not ( = ?auto_24233 ?auto_24234 ) ) ( not ( = ?auto_24233 ?auto_24235 ) ) ( not ( = ?auto_24234 ?auto_24235 ) ) ( not ( = ?auto_24232 ?auto_24237 ) ) ( not ( = ?auto_24233 ?auto_24237 ) ) ( not ( = ?auto_24234 ?auto_24237 ) ) ( not ( = ?auto_24235 ?auto_24237 ) ) ( ON ?auto_24232 ?auto_24236 ) ( not ( = ?auto_24232 ?auto_24236 ) ) ( not ( = ?auto_24233 ?auto_24236 ) ) ( not ( = ?auto_24234 ?auto_24236 ) ) ( not ( = ?auto_24235 ?auto_24236 ) ) ( not ( = ?auto_24237 ?auto_24236 ) ) ( ON ?auto_24233 ?auto_24232 ) ( ON-TABLE ?auto_24236 ) ( ON ?auto_24234 ?auto_24233 ) ( ON ?auto_24235 ?auto_24234 ) ( ON ?auto_24237 ?auto_24235 ) ( CLEAR ?auto_24237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24236 ?auto_24232 ?auto_24233 ?auto_24234 ?auto_24235 )
      ( MAKE-4PILE ?auto_24232 ?auto_24233 ?auto_24234 ?auto_24235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24243 - BLOCK
      ?auto_24244 - BLOCK
      ?auto_24245 - BLOCK
      ?auto_24246 - BLOCK
      ?auto_24247 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_24247 ) ( CLEAR ?auto_24246 ) ( ON-TABLE ?auto_24243 ) ( ON ?auto_24244 ?auto_24243 ) ( ON ?auto_24245 ?auto_24244 ) ( ON ?auto_24246 ?auto_24245 ) ( not ( = ?auto_24243 ?auto_24244 ) ) ( not ( = ?auto_24243 ?auto_24245 ) ) ( not ( = ?auto_24243 ?auto_24246 ) ) ( not ( = ?auto_24243 ?auto_24247 ) ) ( not ( = ?auto_24244 ?auto_24245 ) ) ( not ( = ?auto_24244 ?auto_24246 ) ) ( not ( = ?auto_24244 ?auto_24247 ) ) ( not ( = ?auto_24245 ?auto_24246 ) ) ( not ( = ?auto_24245 ?auto_24247 ) ) ( not ( = ?auto_24246 ?auto_24247 ) ) )
    :subtasks
    ( ( !STACK ?auto_24247 ?auto_24246 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24248 - BLOCK
      ?auto_24249 - BLOCK
      ?auto_24250 - BLOCK
      ?auto_24251 - BLOCK
      ?auto_24252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_24251 ) ( ON-TABLE ?auto_24248 ) ( ON ?auto_24249 ?auto_24248 ) ( ON ?auto_24250 ?auto_24249 ) ( ON ?auto_24251 ?auto_24250 ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( not ( = ?auto_24248 ?auto_24250 ) ) ( not ( = ?auto_24248 ?auto_24251 ) ) ( not ( = ?auto_24248 ?auto_24252 ) ) ( not ( = ?auto_24249 ?auto_24250 ) ) ( not ( = ?auto_24249 ?auto_24251 ) ) ( not ( = ?auto_24249 ?auto_24252 ) ) ( not ( = ?auto_24250 ?auto_24251 ) ) ( not ( = ?auto_24250 ?auto_24252 ) ) ( not ( = ?auto_24251 ?auto_24252 ) ) ( ON-TABLE ?auto_24252 ) ( CLEAR ?auto_24252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_24252 )
      ( MAKE-5PILE ?auto_24248 ?auto_24249 ?auto_24250 ?auto_24251 ?auto_24252 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24253 - BLOCK
      ?auto_24254 - BLOCK
      ?auto_24255 - BLOCK
      ?auto_24256 - BLOCK
      ?auto_24257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24253 ) ( ON ?auto_24254 ?auto_24253 ) ( ON ?auto_24255 ?auto_24254 ) ( not ( = ?auto_24253 ?auto_24254 ) ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( not ( = ?auto_24253 ?auto_24256 ) ) ( not ( = ?auto_24253 ?auto_24257 ) ) ( not ( = ?auto_24254 ?auto_24255 ) ) ( not ( = ?auto_24254 ?auto_24256 ) ) ( not ( = ?auto_24254 ?auto_24257 ) ) ( not ( = ?auto_24255 ?auto_24256 ) ) ( not ( = ?auto_24255 ?auto_24257 ) ) ( not ( = ?auto_24256 ?auto_24257 ) ) ( ON-TABLE ?auto_24257 ) ( CLEAR ?auto_24257 ) ( HOLDING ?auto_24256 ) ( CLEAR ?auto_24255 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24253 ?auto_24254 ?auto_24255 ?auto_24256 )
      ( MAKE-5PILE ?auto_24253 ?auto_24254 ?auto_24255 ?auto_24256 ?auto_24257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24258 - BLOCK
      ?auto_24259 - BLOCK
      ?auto_24260 - BLOCK
      ?auto_24261 - BLOCK
      ?auto_24262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24258 ) ( ON ?auto_24259 ?auto_24258 ) ( ON ?auto_24260 ?auto_24259 ) ( not ( = ?auto_24258 ?auto_24259 ) ) ( not ( = ?auto_24258 ?auto_24260 ) ) ( not ( = ?auto_24258 ?auto_24261 ) ) ( not ( = ?auto_24258 ?auto_24262 ) ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( not ( = ?auto_24259 ?auto_24261 ) ) ( not ( = ?auto_24259 ?auto_24262 ) ) ( not ( = ?auto_24260 ?auto_24261 ) ) ( not ( = ?auto_24260 ?auto_24262 ) ) ( not ( = ?auto_24261 ?auto_24262 ) ) ( ON-TABLE ?auto_24262 ) ( CLEAR ?auto_24260 ) ( ON ?auto_24261 ?auto_24262 ) ( CLEAR ?auto_24261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24262 )
      ( MAKE-5PILE ?auto_24258 ?auto_24259 ?auto_24260 ?auto_24261 ?auto_24262 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24263 - BLOCK
      ?auto_24264 - BLOCK
      ?auto_24265 - BLOCK
      ?auto_24266 - BLOCK
      ?auto_24267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24263 ) ( ON ?auto_24264 ?auto_24263 ) ( not ( = ?auto_24263 ?auto_24264 ) ) ( not ( = ?auto_24263 ?auto_24265 ) ) ( not ( = ?auto_24263 ?auto_24266 ) ) ( not ( = ?auto_24263 ?auto_24267 ) ) ( not ( = ?auto_24264 ?auto_24265 ) ) ( not ( = ?auto_24264 ?auto_24266 ) ) ( not ( = ?auto_24264 ?auto_24267 ) ) ( not ( = ?auto_24265 ?auto_24266 ) ) ( not ( = ?auto_24265 ?auto_24267 ) ) ( not ( = ?auto_24266 ?auto_24267 ) ) ( ON-TABLE ?auto_24267 ) ( ON ?auto_24266 ?auto_24267 ) ( CLEAR ?auto_24266 ) ( HOLDING ?auto_24265 ) ( CLEAR ?auto_24264 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24263 ?auto_24264 ?auto_24265 )
      ( MAKE-5PILE ?auto_24263 ?auto_24264 ?auto_24265 ?auto_24266 ?auto_24267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24268 - BLOCK
      ?auto_24269 - BLOCK
      ?auto_24270 - BLOCK
      ?auto_24271 - BLOCK
      ?auto_24272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24268 ) ( ON ?auto_24269 ?auto_24268 ) ( not ( = ?auto_24268 ?auto_24269 ) ) ( not ( = ?auto_24268 ?auto_24270 ) ) ( not ( = ?auto_24268 ?auto_24271 ) ) ( not ( = ?auto_24268 ?auto_24272 ) ) ( not ( = ?auto_24269 ?auto_24270 ) ) ( not ( = ?auto_24269 ?auto_24271 ) ) ( not ( = ?auto_24269 ?auto_24272 ) ) ( not ( = ?auto_24270 ?auto_24271 ) ) ( not ( = ?auto_24270 ?auto_24272 ) ) ( not ( = ?auto_24271 ?auto_24272 ) ) ( ON-TABLE ?auto_24272 ) ( ON ?auto_24271 ?auto_24272 ) ( CLEAR ?auto_24269 ) ( ON ?auto_24270 ?auto_24271 ) ( CLEAR ?auto_24270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24272 ?auto_24271 )
      ( MAKE-5PILE ?auto_24268 ?auto_24269 ?auto_24270 ?auto_24271 ?auto_24272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24273 - BLOCK
      ?auto_24274 - BLOCK
      ?auto_24275 - BLOCK
      ?auto_24276 - BLOCK
      ?auto_24277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24273 ) ( not ( = ?auto_24273 ?auto_24274 ) ) ( not ( = ?auto_24273 ?auto_24275 ) ) ( not ( = ?auto_24273 ?auto_24276 ) ) ( not ( = ?auto_24273 ?auto_24277 ) ) ( not ( = ?auto_24274 ?auto_24275 ) ) ( not ( = ?auto_24274 ?auto_24276 ) ) ( not ( = ?auto_24274 ?auto_24277 ) ) ( not ( = ?auto_24275 ?auto_24276 ) ) ( not ( = ?auto_24275 ?auto_24277 ) ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( ON-TABLE ?auto_24277 ) ( ON ?auto_24276 ?auto_24277 ) ( ON ?auto_24275 ?auto_24276 ) ( CLEAR ?auto_24275 ) ( HOLDING ?auto_24274 ) ( CLEAR ?auto_24273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24273 ?auto_24274 )
      ( MAKE-5PILE ?auto_24273 ?auto_24274 ?auto_24275 ?auto_24276 ?auto_24277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24278 - BLOCK
      ?auto_24279 - BLOCK
      ?auto_24280 - BLOCK
      ?auto_24281 - BLOCK
      ?auto_24282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_24278 ) ( not ( = ?auto_24278 ?auto_24279 ) ) ( not ( = ?auto_24278 ?auto_24280 ) ) ( not ( = ?auto_24278 ?auto_24281 ) ) ( not ( = ?auto_24278 ?auto_24282 ) ) ( not ( = ?auto_24279 ?auto_24280 ) ) ( not ( = ?auto_24279 ?auto_24281 ) ) ( not ( = ?auto_24279 ?auto_24282 ) ) ( not ( = ?auto_24280 ?auto_24281 ) ) ( not ( = ?auto_24280 ?auto_24282 ) ) ( not ( = ?auto_24281 ?auto_24282 ) ) ( ON-TABLE ?auto_24282 ) ( ON ?auto_24281 ?auto_24282 ) ( ON ?auto_24280 ?auto_24281 ) ( CLEAR ?auto_24278 ) ( ON ?auto_24279 ?auto_24280 ) ( CLEAR ?auto_24279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24282 ?auto_24281 ?auto_24280 )
      ( MAKE-5PILE ?auto_24278 ?auto_24279 ?auto_24280 ?auto_24281 ?auto_24282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24283 - BLOCK
      ?auto_24284 - BLOCK
      ?auto_24285 - BLOCK
      ?auto_24286 - BLOCK
      ?auto_24287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24283 ?auto_24284 ) ) ( not ( = ?auto_24283 ?auto_24285 ) ) ( not ( = ?auto_24283 ?auto_24286 ) ) ( not ( = ?auto_24283 ?auto_24287 ) ) ( not ( = ?auto_24284 ?auto_24285 ) ) ( not ( = ?auto_24284 ?auto_24286 ) ) ( not ( = ?auto_24284 ?auto_24287 ) ) ( not ( = ?auto_24285 ?auto_24286 ) ) ( not ( = ?auto_24285 ?auto_24287 ) ) ( not ( = ?auto_24286 ?auto_24287 ) ) ( ON-TABLE ?auto_24287 ) ( ON ?auto_24286 ?auto_24287 ) ( ON ?auto_24285 ?auto_24286 ) ( ON ?auto_24284 ?auto_24285 ) ( CLEAR ?auto_24284 ) ( HOLDING ?auto_24283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24283 )
      ( MAKE-5PILE ?auto_24283 ?auto_24284 ?auto_24285 ?auto_24286 ?auto_24287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24288 - BLOCK
      ?auto_24289 - BLOCK
      ?auto_24290 - BLOCK
      ?auto_24291 - BLOCK
      ?auto_24292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24288 ?auto_24289 ) ) ( not ( = ?auto_24288 ?auto_24290 ) ) ( not ( = ?auto_24288 ?auto_24291 ) ) ( not ( = ?auto_24288 ?auto_24292 ) ) ( not ( = ?auto_24289 ?auto_24290 ) ) ( not ( = ?auto_24289 ?auto_24291 ) ) ( not ( = ?auto_24289 ?auto_24292 ) ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24291 ?auto_24292 ) ) ( ON-TABLE ?auto_24292 ) ( ON ?auto_24291 ?auto_24292 ) ( ON ?auto_24290 ?auto_24291 ) ( ON ?auto_24289 ?auto_24290 ) ( ON ?auto_24288 ?auto_24289 ) ( CLEAR ?auto_24288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24292 ?auto_24291 ?auto_24290 ?auto_24289 )
      ( MAKE-5PILE ?auto_24288 ?auto_24289 ?auto_24290 ?auto_24291 ?auto_24292 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24293 - BLOCK
      ?auto_24294 - BLOCK
      ?auto_24295 - BLOCK
      ?auto_24296 - BLOCK
      ?auto_24297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24293 ?auto_24294 ) ) ( not ( = ?auto_24293 ?auto_24295 ) ) ( not ( = ?auto_24293 ?auto_24296 ) ) ( not ( = ?auto_24293 ?auto_24297 ) ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( not ( = ?auto_24294 ?auto_24296 ) ) ( not ( = ?auto_24294 ?auto_24297 ) ) ( not ( = ?auto_24295 ?auto_24296 ) ) ( not ( = ?auto_24295 ?auto_24297 ) ) ( not ( = ?auto_24296 ?auto_24297 ) ) ( ON-TABLE ?auto_24297 ) ( ON ?auto_24296 ?auto_24297 ) ( ON ?auto_24295 ?auto_24296 ) ( ON ?auto_24294 ?auto_24295 ) ( HOLDING ?auto_24293 ) ( CLEAR ?auto_24294 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24297 ?auto_24296 ?auto_24295 ?auto_24294 ?auto_24293 )
      ( MAKE-5PILE ?auto_24293 ?auto_24294 ?auto_24295 ?auto_24296 ?auto_24297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24298 - BLOCK
      ?auto_24299 - BLOCK
      ?auto_24300 - BLOCK
      ?auto_24301 - BLOCK
      ?auto_24302 - BLOCK
    )
    :vars
    (
      ?auto_24303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24298 ?auto_24299 ) ) ( not ( = ?auto_24298 ?auto_24300 ) ) ( not ( = ?auto_24298 ?auto_24301 ) ) ( not ( = ?auto_24298 ?auto_24302 ) ) ( not ( = ?auto_24299 ?auto_24300 ) ) ( not ( = ?auto_24299 ?auto_24301 ) ) ( not ( = ?auto_24299 ?auto_24302 ) ) ( not ( = ?auto_24300 ?auto_24301 ) ) ( not ( = ?auto_24300 ?auto_24302 ) ) ( not ( = ?auto_24301 ?auto_24302 ) ) ( ON-TABLE ?auto_24302 ) ( ON ?auto_24301 ?auto_24302 ) ( ON ?auto_24300 ?auto_24301 ) ( ON ?auto_24299 ?auto_24300 ) ( CLEAR ?auto_24299 ) ( ON ?auto_24298 ?auto_24303 ) ( CLEAR ?auto_24298 ) ( HAND-EMPTY ) ( not ( = ?auto_24298 ?auto_24303 ) ) ( not ( = ?auto_24299 ?auto_24303 ) ) ( not ( = ?auto_24300 ?auto_24303 ) ) ( not ( = ?auto_24301 ?auto_24303 ) ) ( not ( = ?auto_24302 ?auto_24303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_24298 ?auto_24303 )
      ( MAKE-5PILE ?auto_24298 ?auto_24299 ?auto_24300 ?auto_24301 ?auto_24302 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24304 - BLOCK
      ?auto_24305 - BLOCK
      ?auto_24306 - BLOCK
      ?auto_24307 - BLOCK
      ?auto_24308 - BLOCK
    )
    :vars
    (
      ?auto_24309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24304 ?auto_24305 ) ) ( not ( = ?auto_24304 ?auto_24306 ) ) ( not ( = ?auto_24304 ?auto_24307 ) ) ( not ( = ?auto_24304 ?auto_24308 ) ) ( not ( = ?auto_24305 ?auto_24306 ) ) ( not ( = ?auto_24305 ?auto_24307 ) ) ( not ( = ?auto_24305 ?auto_24308 ) ) ( not ( = ?auto_24306 ?auto_24307 ) ) ( not ( = ?auto_24306 ?auto_24308 ) ) ( not ( = ?auto_24307 ?auto_24308 ) ) ( ON-TABLE ?auto_24308 ) ( ON ?auto_24307 ?auto_24308 ) ( ON ?auto_24306 ?auto_24307 ) ( ON ?auto_24304 ?auto_24309 ) ( CLEAR ?auto_24304 ) ( not ( = ?auto_24304 ?auto_24309 ) ) ( not ( = ?auto_24305 ?auto_24309 ) ) ( not ( = ?auto_24306 ?auto_24309 ) ) ( not ( = ?auto_24307 ?auto_24309 ) ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( HOLDING ?auto_24305 ) ( CLEAR ?auto_24306 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24308 ?auto_24307 ?auto_24306 ?auto_24305 )
      ( MAKE-5PILE ?auto_24304 ?auto_24305 ?auto_24306 ?auto_24307 ?auto_24308 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24310 - BLOCK
      ?auto_24311 - BLOCK
      ?auto_24312 - BLOCK
      ?auto_24313 - BLOCK
      ?auto_24314 - BLOCK
    )
    :vars
    (
      ?auto_24315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24310 ?auto_24311 ) ) ( not ( = ?auto_24310 ?auto_24312 ) ) ( not ( = ?auto_24310 ?auto_24313 ) ) ( not ( = ?auto_24310 ?auto_24314 ) ) ( not ( = ?auto_24311 ?auto_24312 ) ) ( not ( = ?auto_24311 ?auto_24313 ) ) ( not ( = ?auto_24311 ?auto_24314 ) ) ( not ( = ?auto_24312 ?auto_24313 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( ON-TABLE ?auto_24314 ) ( ON ?auto_24313 ?auto_24314 ) ( ON ?auto_24312 ?auto_24313 ) ( ON ?auto_24310 ?auto_24315 ) ( not ( = ?auto_24310 ?auto_24315 ) ) ( not ( = ?auto_24311 ?auto_24315 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( CLEAR ?auto_24312 ) ( ON ?auto_24311 ?auto_24310 ) ( CLEAR ?auto_24311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_24315 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24315 ?auto_24310 )
      ( MAKE-5PILE ?auto_24310 ?auto_24311 ?auto_24312 ?auto_24313 ?auto_24314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24316 - BLOCK
      ?auto_24317 - BLOCK
      ?auto_24318 - BLOCK
      ?auto_24319 - BLOCK
      ?auto_24320 - BLOCK
    )
    :vars
    (
      ?auto_24321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24316 ?auto_24317 ) ) ( not ( = ?auto_24316 ?auto_24318 ) ) ( not ( = ?auto_24316 ?auto_24319 ) ) ( not ( = ?auto_24316 ?auto_24320 ) ) ( not ( = ?auto_24317 ?auto_24318 ) ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24317 ?auto_24320 ) ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24320 ) ) ( not ( = ?auto_24319 ?auto_24320 ) ) ( ON-TABLE ?auto_24320 ) ( ON ?auto_24319 ?auto_24320 ) ( ON ?auto_24316 ?auto_24321 ) ( not ( = ?auto_24316 ?auto_24321 ) ) ( not ( = ?auto_24317 ?auto_24321 ) ) ( not ( = ?auto_24318 ?auto_24321 ) ) ( not ( = ?auto_24319 ?auto_24321 ) ) ( not ( = ?auto_24320 ?auto_24321 ) ) ( ON ?auto_24317 ?auto_24316 ) ( CLEAR ?auto_24317 ) ( ON-TABLE ?auto_24321 ) ( HOLDING ?auto_24318 ) ( CLEAR ?auto_24319 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24320 ?auto_24319 ?auto_24318 )
      ( MAKE-5PILE ?auto_24316 ?auto_24317 ?auto_24318 ?auto_24319 ?auto_24320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24322 - BLOCK
      ?auto_24323 - BLOCK
      ?auto_24324 - BLOCK
      ?auto_24325 - BLOCK
      ?auto_24326 - BLOCK
    )
    :vars
    (
      ?auto_24327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24322 ?auto_24323 ) ) ( not ( = ?auto_24322 ?auto_24324 ) ) ( not ( = ?auto_24322 ?auto_24325 ) ) ( not ( = ?auto_24322 ?auto_24326 ) ) ( not ( = ?auto_24323 ?auto_24324 ) ) ( not ( = ?auto_24323 ?auto_24325 ) ) ( not ( = ?auto_24323 ?auto_24326 ) ) ( not ( = ?auto_24324 ?auto_24325 ) ) ( not ( = ?auto_24324 ?auto_24326 ) ) ( not ( = ?auto_24325 ?auto_24326 ) ) ( ON-TABLE ?auto_24326 ) ( ON ?auto_24325 ?auto_24326 ) ( ON ?auto_24322 ?auto_24327 ) ( not ( = ?auto_24322 ?auto_24327 ) ) ( not ( = ?auto_24323 ?auto_24327 ) ) ( not ( = ?auto_24324 ?auto_24327 ) ) ( not ( = ?auto_24325 ?auto_24327 ) ) ( not ( = ?auto_24326 ?auto_24327 ) ) ( ON ?auto_24323 ?auto_24322 ) ( ON-TABLE ?auto_24327 ) ( CLEAR ?auto_24325 ) ( ON ?auto_24324 ?auto_24323 ) ( CLEAR ?auto_24324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_24327 ?auto_24322 ?auto_24323 )
      ( MAKE-5PILE ?auto_24322 ?auto_24323 ?auto_24324 ?auto_24325 ?auto_24326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24328 - BLOCK
      ?auto_24329 - BLOCK
      ?auto_24330 - BLOCK
      ?auto_24331 - BLOCK
      ?auto_24332 - BLOCK
    )
    :vars
    (
      ?auto_24333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24328 ?auto_24329 ) ) ( not ( = ?auto_24328 ?auto_24330 ) ) ( not ( = ?auto_24328 ?auto_24331 ) ) ( not ( = ?auto_24328 ?auto_24332 ) ) ( not ( = ?auto_24329 ?auto_24330 ) ) ( not ( = ?auto_24329 ?auto_24331 ) ) ( not ( = ?auto_24329 ?auto_24332 ) ) ( not ( = ?auto_24330 ?auto_24331 ) ) ( not ( = ?auto_24330 ?auto_24332 ) ) ( not ( = ?auto_24331 ?auto_24332 ) ) ( ON-TABLE ?auto_24332 ) ( ON ?auto_24328 ?auto_24333 ) ( not ( = ?auto_24328 ?auto_24333 ) ) ( not ( = ?auto_24329 ?auto_24333 ) ) ( not ( = ?auto_24330 ?auto_24333 ) ) ( not ( = ?auto_24331 ?auto_24333 ) ) ( not ( = ?auto_24332 ?auto_24333 ) ) ( ON ?auto_24329 ?auto_24328 ) ( ON-TABLE ?auto_24333 ) ( ON ?auto_24330 ?auto_24329 ) ( CLEAR ?auto_24330 ) ( HOLDING ?auto_24331 ) ( CLEAR ?auto_24332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_24332 ?auto_24331 )
      ( MAKE-5PILE ?auto_24328 ?auto_24329 ?auto_24330 ?auto_24331 ?auto_24332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24334 - BLOCK
      ?auto_24335 - BLOCK
      ?auto_24336 - BLOCK
      ?auto_24337 - BLOCK
      ?auto_24338 - BLOCK
    )
    :vars
    (
      ?auto_24339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24334 ?auto_24335 ) ) ( not ( = ?auto_24334 ?auto_24336 ) ) ( not ( = ?auto_24334 ?auto_24337 ) ) ( not ( = ?auto_24334 ?auto_24338 ) ) ( not ( = ?auto_24335 ?auto_24336 ) ) ( not ( = ?auto_24335 ?auto_24337 ) ) ( not ( = ?auto_24335 ?auto_24338 ) ) ( not ( = ?auto_24336 ?auto_24337 ) ) ( not ( = ?auto_24336 ?auto_24338 ) ) ( not ( = ?auto_24337 ?auto_24338 ) ) ( ON-TABLE ?auto_24338 ) ( ON ?auto_24334 ?auto_24339 ) ( not ( = ?auto_24334 ?auto_24339 ) ) ( not ( = ?auto_24335 ?auto_24339 ) ) ( not ( = ?auto_24336 ?auto_24339 ) ) ( not ( = ?auto_24337 ?auto_24339 ) ) ( not ( = ?auto_24338 ?auto_24339 ) ) ( ON ?auto_24335 ?auto_24334 ) ( ON-TABLE ?auto_24339 ) ( ON ?auto_24336 ?auto_24335 ) ( CLEAR ?auto_24338 ) ( ON ?auto_24337 ?auto_24336 ) ( CLEAR ?auto_24337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_24339 ?auto_24334 ?auto_24335 ?auto_24336 )
      ( MAKE-5PILE ?auto_24334 ?auto_24335 ?auto_24336 ?auto_24337 ?auto_24338 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24340 - BLOCK
      ?auto_24341 - BLOCK
      ?auto_24342 - BLOCK
      ?auto_24343 - BLOCK
      ?auto_24344 - BLOCK
    )
    :vars
    (
      ?auto_24345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24340 ?auto_24341 ) ) ( not ( = ?auto_24340 ?auto_24342 ) ) ( not ( = ?auto_24340 ?auto_24343 ) ) ( not ( = ?auto_24340 ?auto_24344 ) ) ( not ( = ?auto_24341 ?auto_24342 ) ) ( not ( = ?auto_24341 ?auto_24343 ) ) ( not ( = ?auto_24341 ?auto_24344 ) ) ( not ( = ?auto_24342 ?auto_24343 ) ) ( not ( = ?auto_24342 ?auto_24344 ) ) ( not ( = ?auto_24343 ?auto_24344 ) ) ( ON ?auto_24340 ?auto_24345 ) ( not ( = ?auto_24340 ?auto_24345 ) ) ( not ( = ?auto_24341 ?auto_24345 ) ) ( not ( = ?auto_24342 ?auto_24345 ) ) ( not ( = ?auto_24343 ?auto_24345 ) ) ( not ( = ?auto_24344 ?auto_24345 ) ) ( ON ?auto_24341 ?auto_24340 ) ( ON-TABLE ?auto_24345 ) ( ON ?auto_24342 ?auto_24341 ) ( ON ?auto_24343 ?auto_24342 ) ( CLEAR ?auto_24343 ) ( HOLDING ?auto_24344 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_24344 )
      ( MAKE-5PILE ?auto_24340 ?auto_24341 ?auto_24342 ?auto_24343 ?auto_24344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_24346 - BLOCK
      ?auto_24347 - BLOCK
      ?auto_24348 - BLOCK
      ?auto_24349 - BLOCK
      ?auto_24350 - BLOCK
    )
    :vars
    (
      ?auto_24351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_24346 ?auto_24347 ) ) ( not ( = ?auto_24346 ?auto_24348 ) ) ( not ( = ?auto_24346 ?auto_24349 ) ) ( not ( = ?auto_24346 ?auto_24350 ) ) ( not ( = ?auto_24347 ?auto_24348 ) ) ( not ( = ?auto_24347 ?auto_24349 ) ) ( not ( = ?auto_24347 ?auto_24350 ) ) ( not ( = ?auto_24348 ?auto_24349 ) ) ( not ( = ?auto_24348 ?auto_24350 ) ) ( not ( = ?auto_24349 ?auto_24350 ) ) ( ON ?auto_24346 ?auto_24351 ) ( not ( = ?auto_24346 ?auto_24351 ) ) ( not ( = ?auto_24347 ?auto_24351 ) ) ( not ( = ?auto_24348 ?auto_24351 ) ) ( not ( = ?auto_24349 ?auto_24351 ) ) ( not ( = ?auto_24350 ?auto_24351 ) ) ( ON ?auto_24347 ?auto_24346 ) ( ON-TABLE ?auto_24351 ) ( ON ?auto_24348 ?auto_24347 ) ( ON ?auto_24349 ?auto_24348 ) ( ON ?auto_24350 ?auto_24349 ) ( CLEAR ?auto_24350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_24351 ?auto_24346 ?auto_24347 ?auto_24348 ?auto_24349 )
      ( MAKE-5PILE ?auto_24346 ?auto_24347 ?auto_24348 ?auto_24349 ?auto_24350 ) )
  )

)

