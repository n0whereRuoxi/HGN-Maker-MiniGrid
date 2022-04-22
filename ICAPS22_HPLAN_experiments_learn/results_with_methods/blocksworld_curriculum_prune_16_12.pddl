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
      ?auto_540217 - BLOCK
    )
    :vars
    (
      ?auto_540218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540217 ?auto_540218 ) ( CLEAR ?auto_540217 ) ( HAND-EMPTY ) ( not ( = ?auto_540217 ?auto_540218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540217 ?auto_540218 )
      ( !PUTDOWN ?auto_540217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_540224 - BLOCK
      ?auto_540225 - BLOCK
    )
    :vars
    (
      ?auto_540226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540224 ) ( ON ?auto_540225 ?auto_540226 ) ( CLEAR ?auto_540225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540224 ) ( not ( = ?auto_540224 ?auto_540225 ) ) ( not ( = ?auto_540224 ?auto_540226 ) ) ( not ( = ?auto_540225 ?auto_540226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540225 ?auto_540226 )
      ( !STACK ?auto_540225 ?auto_540224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_540234 - BLOCK
      ?auto_540235 - BLOCK
    )
    :vars
    (
      ?auto_540236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540235 ?auto_540236 ) ( not ( = ?auto_540234 ?auto_540235 ) ) ( not ( = ?auto_540234 ?auto_540236 ) ) ( not ( = ?auto_540235 ?auto_540236 ) ) ( ON ?auto_540234 ?auto_540235 ) ( CLEAR ?auto_540234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540234 )
      ( MAKE-2PILE ?auto_540234 ?auto_540235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_540245 - BLOCK
      ?auto_540246 - BLOCK
      ?auto_540247 - BLOCK
    )
    :vars
    (
      ?auto_540248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540246 ) ( ON ?auto_540247 ?auto_540248 ) ( CLEAR ?auto_540247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540245 ) ( ON ?auto_540246 ?auto_540245 ) ( not ( = ?auto_540245 ?auto_540246 ) ) ( not ( = ?auto_540245 ?auto_540247 ) ) ( not ( = ?auto_540245 ?auto_540248 ) ) ( not ( = ?auto_540246 ?auto_540247 ) ) ( not ( = ?auto_540246 ?auto_540248 ) ) ( not ( = ?auto_540247 ?auto_540248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540247 ?auto_540248 )
      ( !STACK ?auto_540247 ?auto_540246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_540259 - BLOCK
      ?auto_540260 - BLOCK
      ?auto_540261 - BLOCK
    )
    :vars
    (
      ?auto_540262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540261 ?auto_540262 ) ( ON-TABLE ?auto_540259 ) ( not ( = ?auto_540259 ?auto_540260 ) ) ( not ( = ?auto_540259 ?auto_540261 ) ) ( not ( = ?auto_540259 ?auto_540262 ) ) ( not ( = ?auto_540260 ?auto_540261 ) ) ( not ( = ?auto_540260 ?auto_540262 ) ) ( not ( = ?auto_540261 ?auto_540262 ) ) ( CLEAR ?auto_540259 ) ( ON ?auto_540260 ?auto_540261 ) ( CLEAR ?auto_540260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540259 ?auto_540260 )
      ( MAKE-3PILE ?auto_540259 ?auto_540260 ?auto_540261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_540273 - BLOCK
      ?auto_540274 - BLOCK
      ?auto_540275 - BLOCK
    )
    :vars
    (
      ?auto_540276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540275 ?auto_540276 ) ( not ( = ?auto_540273 ?auto_540274 ) ) ( not ( = ?auto_540273 ?auto_540275 ) ) ( not ( = ?auto_540273 ?auto_540276 ) ) ( not ( = ?auto_540274 ?auto_540275 ) ) ( not ( = ?auto_540274 ?auto_540276 ) ) ( not ( = ?auto_540275 ?auto_540276 ) ) ( ON ?auto_540274 ?auto_540275 ) ( ON ?auto_540273 ?auto_540274 ) ( CLEAR ?auto_540273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540273 )
      ( MAKE-3PILE ?auto_540273 ?auto_540274 ?auto_540275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_540288 - BLOCK
      ?auto_540289 - BLOCK
      ?auto_540290 - BLOCK
      ?auto_540291 - BLOCK
    )
    :vars
    (
      ?auto_540292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540290 ) ( ON ?auto_540291 ?auto_540292 ) ( CLEAR ?auto_540291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540288 ) ( ON ?auto_540289 ?auto_540288 ) ( ON ?auto_540290 ?auto_540289 ) ( not ( = ?auto_540288 ?auto_540289 ) ) ( not ( = ?auto_540288 ?auto_540290 ) ) ( not ( = ?auto_540288 ?auto_540291 ) ) ( not ( = ?auto_540288 ?auto_540292 ) ) ( not ( = ?auto_540289 ?auto_540290 ) ) ( not ( = ?auto_540289 ?auto_540291 ) ) ( not ( = ?auto_540289 ?auto_540292 ) ) ( not ( = ?auto_540290 ?auto_540291 ) ) ( not ( = ?auto_540290 ?auto_540292 ) ) ( not ( = ?auto_540291 ?auto_540292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540291 ?auto_540292 )
      ( !STACK ?auto_540291 ?auto_540290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_540306 - BLOCK
      ?auto_540307 - BLOCK
      ?auto_540308 - BLOCK
      ?auto_540309 - BLOCK
    )
    :vars
    (
      ?auto_540310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540309 ?auto_540310 ) ( ON-TABLE ?auto_540306 ) ( ON ?auto_540307 ?auto_540306 ) ( not ( = ?auto_540306 ?auto_540307 ) ) ( not ( = ?auto_540306 ?auto_540308 ) ) ( not ( = ?auto_540306 ?auto_540309 ) ) ( not ( = ?auto_540306 ?auto_540310 ) ) ( not ( = ?auto_540307 ?auto_540308 ) ) ( not ( = ?auto_540307 ?auto_540309 ) ) ( not ( = ?auto_540307 ?auto_540310 ) ) ( not ( = ?auto_540308 ?auto_540309 ) ) ( not ( = ?auto_540308 ?auto_540310 ) ) ( not ( = ?auto_540309 ?auto_540310 ) ) ( CLEAR ?auto_540307 ) ( ON ?auto_540308 ?auto_540309 ) ( CLEAR ?auto_540308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_540306 ?auto_540307 ?auto_540308 )
      ( MAKE-4PILE ?auto_540306 ?auto_540307 ?auto_540308 ?auto_540309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_540324 - BLOCK
      ?auto_540325 - BLOCK
      ?auto_540326 - BLOCK
      ?auto_540327 - BLOCK
    )
    :vars
    (
      ?auto_540328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540327 ?auto_540328 ) ( ON-TABLE ?auto_540324 ) ( not ( = ?auto_540324 ?auto_540325 ) ) ( not ( = ?auto_540324 ?auto_540326 ) ) ( not ( = ?auto_540324 ?auto_540327 ) ) ( not ( = ?auto_540324 ?auto_540328 ) ) ( not ( = ?auto_540325 ?auto_540326 ) ) ( not ( = ?auto_540325 ?auto_540327 ) ) ( not ( = ?auto_540325 ?auto_540328 ) ) ( not ( = ?auto_540326 ?auto_540327 ) ) ( not ( = ?auto_540326 ?auto_540328 ) ) ( not ( = ?auto_540327 ?auto_540328 ) ) ( ON ?auto_540326 ?auto_540327 ) ( CLEAR ?auto_540324 ) ( ON ?auto_540325 ?auto_540326 ) ( CLEAR ?auto_540325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540324 ?auto_540325 )
      ( MAKE-4PILE ?auto_540324 ?auto_540325 ?auto_540326 ?auto_540327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_540342 - BLOCK
      ?auto_540343 - BLOCK
      ?auto_540344 - BLOCK
      ?auto_540345 - BLOCK
    )
    :vars
    (
      ?auto_540346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540345 ?auto_540346 ) ( not ( = ?auto_540342 ?auto_540343 ) ) ( not ( = ?auto_540342 ?auto_540344 ) ) ( not ( = ?auto_540342 ?auto_540345 ) ) ( not ( = ?auto_540342 ?auto_540346 ) ) ( not ( = ?auto_540343 ?auto_540344 ) ) ( not ( = ?auto_540343 ?auto_540345 ) ) ( not ( = ?auto_540343 ?auto_540346 ) ) ( not ( = ?auto_540344 ?auto_540345 ) ) ( not ( = ?auto_540344 ?auto_540346 ) ) ( not ( = ?auto_540345 ?auto_540346 ) ) ( ON ?auto_540344 ?auto_540345 ) ( ON ?auto_540343 ?auto_540344 ) ( ON ?auto_540342 ?auto_540343 ) ( CLEAR ?auto_540342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540342 )
      ( MAKE-4PILE ?auto_540342 ?auto_540343 ?auto_540344 ?auto_540345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_540361 - BLOCK
      ?auto_540362 - BLOCK
      ?auto_540363 - BLOCK
      ?auto_540364 - BLOCK
      ?auto_540365 - BLOCK
    )
    :vars
    (
      ?auto_540366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540364 ) ( ON ?auto_540365 ?auto_540366 ) ( CLEAR ?auto_540365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540361 ) ( ON ?auto_540362 ?auto_540361 ) ( ON ?auto_540363 ?auto_540362 ) ( ON ?auto_540364 ?auto_540363 ) ( not ( = ?auto_540361 ?auto_540362 ) ) ( not ( = ?auto_540361 ?auto_540363 ) ) ( not ( = ?auto_540361 ?auto_540364 ) ) ( not ( = ?auto_540361 ?auto_540365 ) ) ( not ( = ?auto_540361 ?auto_540366 ) ) ( not ( = ?auto_540362 ?auto_540363 ) ) ( not ( = ?auto_540362 ?auto_540364 ) ) ( not ( = ?auto_540362 ?auto_540365 ) ) ( not ( = ?auto_540362 ?auto_540366 ) ) ( not ( = ?auto_540363 ?auto_540364 ) ) ( not ( = ?auto_540363 ?auto_540365 ) ) ( not ( = ?auto_540363 ?auto_540366 ) ) ( not ( = ?auto_540364 ?auto_540365 ) ) ( not ( = ?auto_540364 ?auto_540366 ) ) ( not ( = ?auto_540365 ?auto_540366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540365 ?auto_540366 )
      ( !STACK ?auto_540365 ?auto_540364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_540383 - BLOCK
      ?auto_540384 - BLOCK
      ?auto_540385 - BLOCK
      ?auto_540386 - BLOCK
      ?auto_540387 - BLOCK
    )
    :vars
    (
      ?auto_540388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540387 ?auto_540388 ) ( ON-TABLE ?auto_540383 ) ( ON ?auto_540384 ?auto_540383 ) ( ON ?auto_540385 ?auto_540384 ) ( not ( = ?auto_540383 ?auto_540384 ) ) ( not ( = ?auto_540383 ?auto_540385 ) ) ( not ( = ?auto_540383 ?auto_540386 ) ) ( not ( = ?auto_540383 ?auto_540387 ) ) ( not ( = ?auto_540383 ?auto_540388 ) ) ( not ( = ?auto_540384 ?auto_540385 ) ) ( not ( = ?auto_540384 ?auto_540386 ) ) ( not ( = ?auto_540384 ?auto_540387 ) ) ( not ( = ?auto_540384 ?auto_540388 ) ) ( not ( = ?auto_540385 ?auto_540386 ) ) ( not ( = ?auto_540385 ?auto_540387 ) ) ( not ( = ?auto_540385 ?auto_540388 ) ) ( not ( = ?auto_540386 ?auto_540387 ) ) ( not ( = ?auto_540386 ?auto_540388 ) ) ( not ( = ?auto_540387 ?auto_540388 ) ) ( CLEAR ?auto_540385 ) ( ON ?auto_540386 ?auto_540387 ) ( CLEAR ?auto_540386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_540383 ?auto_540384 ?auto_540385 ?auto_540386 )
      ( MAKE-5PILE ?auto_540383 ?auto_540384 ?auto_540385 ?auto_540386 ?auto_540387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_540405 - BLOCK
      ?auto_540406 - BLOCK
      ?auto_540407 - BLOCK
      ?auto_540408 - BLOCK
      ?auto_540409 - BLOCK
    )
    :vars
    (
      ?auto_540410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540409 ?auto_540410 ) ( ON-TABLE ?auto_540405 ) ( ON ?auto_540406 ?auto_540405 ) ( not ( = ?auto_540405 ?auto_540406 ) ) ( not ( = ?auto_540405 ?auto_540407 ) ) ( not ( = ?auto_540405 ?auto_540408 ) ) ( not ( = ?auto_540405 ?auto_540409 ) ) ( not ( = ?auto_540405 ?auto_540410 ) ) ( not ( = ?auto_540406 ?auto_540407 ) ) ( not ( = ?auto_540406 ?auto_540408 ) ) ( not ( = ?auto_540406 ?auto_540409 ) ) ( not ( = ?auto_540406 ?auto_540410 ) ) ( not ( = ?auto_540407 ?auto_540408 ) ) ( not ( = ?auto_540407 ?auto_540409 ) ) ( not ( = ?auto_540407 ?auto_540410 ) ) ( not ( = ?auto_540408 ?auto_540409 ) ) ( not ( = ?auto_540408 ?auto_540410 ) ) ( not ( = ?auto_540409 ?auto_540410 ) ) ( ON ?auto_540408 ?auto_540409 ) ( CLEAR ?auto_540406 ) ( ON ?auto_540407 ?auto_540408 ) ( CLEAR ?auto_540407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_540405 ?auto_540406 ?auto_540407 )
      ( MAKE-5PILE ?auto_540405 ?auto_540406 ?auto_540407 ?auto_540408 ?auto_540409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_540427 - BLOCK
      ?auto_540428 - BLOCK
      ?auto_540429 - BLOCK
      ?auto_540430 - BLOCK
      ?auto_540431 - BLOCK
    )
    :vars
    (
      ?auto_540432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540431 ?auto_540432 ) ( ON-TABLE ?auto_540427 ) ( not ( = ?auto_540427 ?auto_540428 ) ) ( not ( = ?auto_540427 ?auto_540429 ) ) ( not ( = ?auto_540427 ?auto_540430 ) ) ( not ( = ?auto_540427 ?auto_540431 ) ) ( not ( = ?auto_540427 ?auto_540432 ) ) ( not ( = ?auto_540428 ?auto_540429 ) ) ( not ( = ?auto_540428 ?auto_540430 ) ) ( not ( = ?auto_540428 ?auto_540431 ) ) ( not ( = ?auto_540428 ?auto_540432 ) ) ( not ( = ?auto_540429 ?auto_540430 ) ) ( not ( = ?auto_540429 ?auto_540431 ) ) ( not ( = ?auto_540429 ?auto_540432 ) ) ( not ( = ?auto_540430 ?auto_540431 ) ) ( not ( = ?auto_540430 ?auto_540432 ) ) ( not ( = ?auto_540431 ?auto_540432 ) ) ( ON ?auto_540430 ?auto_540431 ) ( ON ?auto_540429 ?auto_540430 ) ( CLEAR ?auto_540427 ) ( ON ?auto_540428 ?auto_540429 ) ( CLEAR ?auto_540428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540427 ?auto_540428 )
      ( MAKE-5PILE ?auto_540427 ?auto_540428 ?auto_540429 ?auto_540430 ?auto_540431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_540449 - BLOCK
      ?auto_540450 - BLOCK
      ?auto_540451 - BLOCK
      ?auto_540452 - BLOCK
      ?auto_540453 - BLOCK
    )
    :vars
    (
      ?auto_540454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540453 ?auto_540454 ) ( not ( = ?auto_540449 ?auto_540450 ) ) ( not ( = ?auto_540449 ?auto_540451 ) ) ( not ( = ?auto_540449 ?auto_540452 ) ) ( not ( = ?auto_540449 ?auto_540453 ) ) ( not ( = ?auto_540449 ?auto_540454 ) ) ( not ( = ?auto_540450 ?auto_540451 ) ) ( not ( = ?auto_540450 ?auto_540452 ) ) ( not ( = ?auto_540450 ?auto_540453 ) ) ( not ( = ?auto_540450 ?auto_540454 ) ) ( not ( = ?auto_540451 ?auto_540452 ) ) ( not ( = ?auto_540451 ?auto_540453 ) ) ( not ( = ?auto_540451 ?auto_540454 ) ) ( not ( = ?auto_540452 ?auto_540453 ) ) ( not ( = ?auto_540452 ?auto_540454 ) ) ( not ( = ?auto_540453 ?auto_540454 ) ) ( ON ?auto_540452 ?auto_540453 ) ( ON ?auto_540451 ?auto_540452 ) ( ON ?auto_540450 ?auto_540451 ) ( ON ?auto_540449 ?auto_540450 ) ( CLEAR ?auto_540449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540449 )
      ( MAKE-5PILE ?auto_540449 ?auto_540450 ?auto_540451 ?auto_540452 ?auto_540453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_540472 - BLOCK
      ?auto_540473 - BLOCK
      ?auto_540474 - BLOCK
      ?auto_540475 - BLOCK
      ?auto_540476 - BLOCK
      ?auto_540477 - BLOCK
    )
    :vars
    (
      ?auto_540478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540476 ) ( ON ?auto_540477 ?auto_540478 ) ( CLEAR ?auto_540477 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540472 ) ( ON ?auto_540473 ?auto_540472 ) ( ON ?auto_540474 ?auto_540473 ) ( ON ?auto_540475 ?auto_540474 ) ( ON ?auto_540476 ?auto_540475 ) ( not ( = ?auto_540472 ?auto_540473 ) ) ( not ( = ?auto_540472 ?auto_540474 ) ) ( not ( = ?auto_540472 ?auto_540475 ) ) ( not ( = ?auto_540472 ?auto_540476 ) ) ( not ( = ?auto_540472 ?auto_540477 ) ) ( not ( = ?auto_540472 ?auto_540478 ) ) ( not ( = ?auto_540473 ?auto_540474 ) ) ( not ( = ?auto_540473 ?auto_540475 ) ) ( not ( = ?auto_540473 ?auto_540476 ) ) ( not ( = ?auto_540473 ?auto_540477 ) ) ( not ( = ?auto_540473 ?auto_540478 ) ) ( not ( = ?auto_540474 ?auto_540475 ) ) ( not ( = ?auto_540474 ?auto_540476 ) ) ( not ( = ?auto_540474 ?auto_540477 ) ) ( not ( = ?auto_540474 ?auto_540478 ) ) ( not ( = ?auto_540475 ?auto_540476 ) ) ( not ( = ?auto_540475 ?auto_540477 ) ) ( not ( = ?auto_540475 ?auto_540478 ) ) ( not ( = ?auto_540476 ?auto_540477 ) ) ( not ( = ?auto_540476 ?auto_540478 ) ) ( not ( = ?auto_540477 ?auto_540478 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540477 ?auto_540478 )
      ( !STACK ?auto_540477 ?auto_540476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_540498 - BLOCK
      ?auto_540499 - BLOCK
      ?auto_540500 - BLOCK
      ?auto_540501 - BLOCK
      ?auto_540502 - BLOCK
      ?auto_540503 - BLOCK
    )
    :vars
    (
      ?auto_540504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540503 ?auto_540504 ) ( ON-TABLE ?auto_540498 ) ( ON ?auto_540499 ?auto_540498 ) ( ON ?auto_540500 ?auto_540499 ) ( ON ?auto_540501 ?auto_540500 ) ( not ( = ?auto_540498 ?auto_540499 ) ) ( not ( = ?auto_540498 ?auto_540500 ) ) ( not ( = ?auto_540498 ?auto_540501 ) ) ( not ( = ?auto_540498 ?auto_540502 ) ) ( not ( = ?auto_540498 ?auto_540503 ) ) ( not ( = ?auto_540498 ?auto_540504 ) ) ( not ( = ?auto_540499 ?auto_540500 ) ) ( not ( = ?auto_540499 ?auto_540501 ) ) ( not ( = ?auto_540499 ?auto_540502 ) ) ( not ( = ?auto_540499 ?auto_540503 ) ) ( not ( = ?auto_540499 ?auto_540504 ) ) ( not ( = ?auto_540500 ?auto_540501 ) ) ( not ( = ?auto_540500 ?auto_540502 ) ) ( not ( = ?auto_540500 ?auto_540503 ) ) ( not ( = ?auto_540500 ?auto_540504 ) ) ( not ( = ?auto_540501 ?auto_540502 ) ) ( not ( = ?auto_540501 ?auto_540503 ) ) ( not ( = ?auto_540501 ?auto_540504 ) ) ( not ( = ?auto_540502 ?auto_540503 ) ) ( not ( = ?auto_540502 ?auto_540504 ) ) ( not ( = ?auto_540503 ?auto_540504 ) ) ( CLEAR ?auto_540501 ) ( ON ?auto_540502 ?auto_540503 ) ( CLEAR ?auto_540502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_540498 ?auto_540499 ?auto_540500 ?auto_540501 ?auto_540502 )
      ( MAKE-6PILE ?auto_540498 ?auto_540499 ?auto_540500 ?auto_540501 ?auto_540502 ?auto_540503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_540524 - BLOCK
      ?auto_540525 - BLOCK
      ?auto_540526 - BLOCK
      ?auto_540527 - BLOCK
      ?auto_540528 - BLOCK
      ?auto_540529 - BLOCK
    )
    :vars
    (
      ?auto_540530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540529 ?auto_540530 ) ( ON-TABLE ?auto_540524 ) ( ON ?auto_540525 ?auto_540524 ) ( ON ?auto_540526 ?auto_540525 ) ( not ( = ?auto_540524 ?auto_540525 ) ) ( not ( = ?auto_540524 ?auto_540526 ) ) ( not ( = ?auto_540524 ?auto_540527 ) ) ( not ( = ?auto_540524 ?auto_540528 ) ) ( not ( = ?auto_540524 ?auto_540529 ) ) ( not ( = ?auto_540524 ?auto_540530 ) ) ( not ( = ?auto_540525 ?auto_540526 ) ) ( not ( = ?auto_540525 ?auto_540527 ) ) ( not ( = ?auto_540525 ?auto_540528 ) ) ( not ( = ?auto_540525 ?auto_540529 ) ) ( not ( = ?auto_540525 ?auto_540530 ) ) ( not ( = ?auto_540526 ?auto_540527 ) ) ( not ( = ?auto_540526 ?auto_540528 ) ) ( not ( = ?auto_540526 ?auto_540529 ) ) ( not ( = ?auto_540526 ?auto_540530 ) ) ( not ( = ?auto_540527 ?auto_540528 ) ) ( not ( = ?auto_540527 ?auto_540529 ) ) ( not ( = ?auto_540527 ?auto_540530 ) ) ( not ( = ?auto_540528 ?auto_540529 ) ) ( not ( = ?auto_540528 ?auto_540530 ) ) ( not ( = ?auto_540529 ?auto_540530 ) ) ( ON ?auto_540528 ?auto_540529 ) ( CLEAR ?auto_540526 ) ( ON ?auto_540527 ?auto_540528 ) ( CLEAR ?auto_540527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_540524 ?auto_540525 ?auto_540526 ?auto_540527 )
      ( MAKE-6PILE ?auto_540524 ?auto_540525 ?auto_540526 ?auto_540527 ?auto_540528 ?auto_540529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_540550 - BLOCK
      ?auto_540551 - BLOCK
      ?auto_540552 - BLOCK
      ?auto_540553 - BLOCK
      ?auto_540554 - BLOCK
      ?auto_540555 - BLOCK
    )
    :vars
    (
      ?auto_540556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540555 ?auto_540556 ) ( ON-TABLE ?auto_540550 ) ( ON ?auto_540551 ?auto_540550 ) ( not ( = ?auto_540550 ?auto_540551 ) ) ( not ( = ?auto_540550 ?auto_540552 ) ) ( not ( = ?auto_540550 ?auto_540553 ) ) ( not ( = ?auto_540550 ?auto_540554 ) ) ( not ( = ?auto_540550 ?auto_540555 ) ) ( not ( = ?auto_540550 ?auto_540556 ) ) ( not ( = ?auto_540551 ?auto_540552 ) ) ( not ( = ?auto_540551 ?auto_540553 ) ) ( not ( = ?auto_540551 ?auto_540554 ) ) ( not ( = ?auto_540551 ?auto_540555 ) ) ( not ( = ?auto_540551 ?auto_540556 ) ) ( not ( = ?auto_540552 ?auto_540553 ) ) ( not ( = ?auto_540552 ?auto_540554 ) ) ( not ( = ?auto_540552 ?auto_540555 ) ) ( not ( = ?auto_540552 ?auto_540556 ) ) ( not ( = ?auto_540553 ?auto_540554 ) ) ( not ( = ?auto_540553 ?auto_540555 ) ) ( not ( = ?auto_540553 ?auto_540556 ) ) ( not ( = ?auto_540554 ?auto_540555 ) ) ( not ( = ?auto_540554 ?auto_540556 ) ) ( not ( = ?auto_540555 ?auto_540556 ) ) ( ON ?auto_540554 ?auto_540555 ) ( ON ?auto_540553 ?auto_540554 ) ( CLEAR ?auto_540551 ) ( ON ?auto_540552 ?auto_540553 ) ( CLEAR ?auto_540552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_540550 ?auto_540551 ?auto_540552 )
      ( MAKE-6PILE ?auto_540550 ?auto_540551 ?auto_540552 ?auto_540553 ?auto_540554 ?auto_540555 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_540576 - BLOCK
      ?auto_540577 - BLOCK
      ?auto_540578 - BLOCK
      ?auto_540579 - BLOCK
      ?auto_540580 - BLOCK
      ?auto_540581 - BLOCK
    )
    :vars
    (
      ?auto_540582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540581 ?auto_540582 ) ( ON-TABLE ?auto_540576 ) ( not ( = ?auto_540576 ?auto_540577 ) ) ( not ( = ?auto_540576 ?auto_540578 ) ) ( not ( = ?auto_540576 ?auto_540579 ) ) ( not ( = ?auto_540576 ?auto_540580 ) ) ( not ( = ?auto_540576 ?auto_540581 ) ) ( not ( = ?auto_540576 ?auto_540582 ) ) ( not ( = ?auto_540577 ?auto_540578 ) ) ( not ( = ?auto_540577 ?auto_540579 ) ) ( not ( = ?auto_540577 ?auto_540580 ) ) ( not ( = ?auto_540577 ?auto_540581 ) ) ( not ( = ?auto_540577 ?auto_540582 ) ) ( not ( = ?auto_540578 ?auto_540579 ) ) ( not ( = ?auto_540578 ?auto_540580 ) ) ( not ( = ?auto_540578 ?auto_540581 ) ) ( not ( = ?auto_540578 ?auto_540582 ) ) ( not ( = ?auto_540579 ?auto_540580 ) ) ( not ( = ?auto_540579 ?auto_540581 ) ) ( not ( = ?auto_540579 ?auto_540582 ) ) ( not ( = ?auto_540580 ?auto_540581 ) ) ( not ( = ?auto_540580 ?auto_540582 ) ) ( not ( = ?auto_540581 ?auto_540582 ) ) ( ON ?auto_540580 ?auto_540581 ) ( ON ?auto_540579 ?auto_540580 ) ( ON ?auto_540578 ?auto_540579 ) ( CLEAR ?auto_540576 ) ( ON ?auto_540577 ?auto_540578 ) ( CLEAR ?auto_540577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540576 ?auto_540577 )
      ( MAKE-6PILE ?auto_540576 ?auto_540577 ?auto_540578 ?auto_540579 ?auto_540580 ?auto_540581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_540602 - BLOCK
      ?auto_540603 - BLOCK
      ?auto_540604 - BLOCK
      ?auto_540605 - BLOCK
      ?auto_540606 - BLOCK
      ?auto_540607 - BLOCK
    )
    :vars
    (
      ?auto_540608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540607 ?auto_540608 ) ( not ( = ?auto_540602 ?auto_540603 ) ) ( not ( = ?auto_540602 ?auto_540604 ) ) ( not ( = ?auto_540602 ?auto_540605 ) ) ( not ( = ?auto_540602 ?auto_540606 ) ) ( not ( = ?auto_540602 ?auto_540607 ) ) ( not ( = ?auto_540602 ?auto_540608 ) ) ( not ( = ?auto_540603 ?auto_540604 ) ) ( not ( = ?auto_540603 ?auto_540605 ) ) ( not ( = ?auto_540603 ?auto_540606 ) ) ( not ( = ?auto_540603 ?auto_540607 ) ) ( not ( = ?auto_540603 ?auto_540608 ) ) ( not ( = ?auto_540604 ?auto_540605 ) ) ( not ( = ?auto_540604 ?auto_540606 ) ) ( not ( = ?auto_540604 ?auto_540607 ) ) ( not ( = ?auto_540604 ?auto_540608 ) ) ( not ( = ?auto_540605 ?auto_540606 ) ) ( not ( = ?auto_540605 ?auto_540607 ) ) ( not ( = ?auto_540605 ?auto_540608 ) ) ( not ( = ?auto_540606 ?auto_540607 ) ) ( not ( = ?auto_540606 ?auto_540608 ) ) ( not ( = ?auto_540607 ?auto_540608 ) ) ( ON ?auto_540606 ?auto_540607 ) ( ON ?auto_540605 ?auto_540606 ) ( ON ?auto_540604 ?auto_540605 ) ( ON ?auto_540603 ?auto_540604 ) ( ON ?auto_540602 ?auto_540603 ) ( CLEAR ?auto_540602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540602 )
      ( MAKE-6PILE ?auto_540602 ?auto_540603 ?auto_540604 ?auto_540605 ?auto_540606 ?auto_540607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540629 - BLOCK
      ?auto_540630 - BLOCK
      ?auto_540631 - BLOCK
      ?auto_540632 - BLOCK
      ?auto_540633 - BLOCK
      ?auto_540634 - BLOCK
      ?auto_540635 - BLOCK
    )
    :vars
    (
      ?auto_540636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540634 ) ( ON ?auto_540635 ?auto_540636 ) ( CLEAR ?auto_540635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540629 ) ( ON ?auto_540630 ?auto_540629 ) ( ON ?auto_540631 ?auto_540630 ) ( ON ?auto_540632 ?auto_540631 ) ( ON ?auto_540633 ?auto_540632 ) ( ON ?auto_540634 ?auto_540633 ) ( not ( = ?auto_540629 ?auto_540630 ) ) ( not ( = ?auto_540629 ?auto_540631 ) ) ( not ( = ?auto_540629 ?auto_540632 ) ) ( not ( = ?auto_540629 ?auto_540633 ) ) ( not ( = ?auto_540629 ?auto_540634 ) ) ( not ( = ?auto_540629 ?auto_540635 ) ) ( not ( = ?auto_540629 ?auto_540636 ) ) ( not ( = ?auto_540630 ?auto_540631 ) ) ( not ( = ?auto_540630 ?auto_540632 ) ) ( not ( = ?auto_540630 ?auto_540633 ) ) ( not ( = ?auto_540630 ?auto_540634 ) ) ( not ( = ?auto_540630 ?auto_540635 ) ) ( not ( = ?auto_540630 ?auto_540636 ) ) ( not ( = ?auto_540631 ?auto_540632 ) ) ( not ( = ?auto_540631 ?auto_540633 ) ) ( not ( = ?auto_540631 ?auto_540634 ) ) ( not ( = ?auto_540631 ?auto_540635 ) ) ( not ( = ?auto_540631 ?auto_540636 ) ) ( not ( = ?auto_540632 ?auto_540633 ) ) ( not ( = ?auto_540632 ?auto_540634 ) ) ( not ( = ?auto_540632 ?auto_540635 ) ) ( not ( = ?auto_540632 ?auto_540636 ) ) ( not ( = ?auto_540633 ?auto_540634 ) ) ( not ( = ?auto_540633 ?auto_540635 ) ) ( not ( = ?auto_540633 ?auto_540636 ) ) ( not ( = ?auto_540634 ?auto_540635 ) ) ( not ( = ?auto_540634 ?auto_540636 ) ) ( not ( = ?auto_540635 ?auto_540636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540635 ?auto_540636 )
      ( !STACK ?auto_540635 ?auto_540634 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540659 - BLOCK
      ?auto_540660 - BLOCK
      ?auto_540661 - BLOCK
      ?auto_540662 - BLOCK
      ?auto_540663 - BLOCK
      ?auto_540664 - BLOCK
      ?auto_540665 - BLOCK
    )
    :vars
    (
      ?auto_540666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540665 ?auto_540666 ) ( ON-TABLE ?auto_540659 ) ( ON ?auto_540660 ?auto_540659 ) ( ON ?auto_540661 ?auto_540660 ) ( ON ?auto_540662 ?auto_540661 ) ( ON ?auto_540663 ?auto_540662 ) ( not ( = ?auto_540659 ?auto_540660 ) ) ( not ( = ?auto_540659 ?auto_540661 ) ) ( not ( = ?auto_540659 ?auto_540662 ) ) ( not ( = ?auto_540659 ?auto_540663 ) ) ( not ( = ?auto_540659 ?auto_540664 ) ) ( not ( = ?auto_540659 ?auto_540665 ) ) ( not ( = ?auto_540659 ?auto_540666 ) ) ( not ( = ?auto_540660 ?auto_540661 ) ) ( not ( = ?auto_540660 ?auto_540662 ) ) ( not ( = ?auto_540660 ?auto_540663 ) ) ( not ( = ?auto_540660 ?auto_540664 ) ) ( not ( = ?auto_540660 ?auto_540665 ) ) ( not ( = ?auto_540660 ?auto_540666 ) ) ( not ( = ?auto_540661 ?auto_540662 ) ) ( not ( = ?auto_540661 ?auto_540663 ) ) ( not ( = ?auto_540661 ?auto_540664 ) ) ( not ( = ?auto_540661 ?auto_540665 ) ) ( not ( = ?auto_540661 ?auto_540666 ) ) ( not ( = ?auto_540662 ?auto_540663 ) ) ( not ( = ?auto_540662 ?auto_540664 ) ) ( not ( = ?auto_540662 ?auto_540665 ) ) ( not ( = ?auto_540662 ?auto_540666 ) ) ( not ( = ?auto_540663 ?auto_540664 ) ) ( not ( = ?auto_540663 ?auto_540665 ) ) ( not ( = ?auto_540663 ?auto_540666 ) ) ( not ( = ?auto_540664 ?auto_540665 ) ) ( not ( = ?auto_540664 ?auto_540666 ) ) ( not ( = ?auto_540665 ?auto_540666 ) ) ( CLEAR ?auto_540663 ) ( ON ?auto_540664 ?auto_540665 ) ( CLEAR ?auto_540664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_540659 ?auto_540660 ?auto_540661 ?auto_540662 ?auto_540663 ?auto_540664 )
      ( MAKE-7PILE ?auto_540659 ?auto_540660 ?auto_540661 ?auto_540662 ?auto_540663 ?auto_540664 ?auto_540665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540689 - BLOCK
      ?auto_540690 - BLOCK
      ?auto_540691 - BLOCK
      ?auto_540692 - BLOCK
      ?auto_540693 - BLOCK
      ?auto_540694 - BLOCK
      ?auto_540695 - BLOCK
    )
    :vars
    (
      ?auto_540696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540695 ?auto_540696 ) ( ON-TABLE ?auto_540689 ) ( ON ?auto_540690 ?auto_540689 ) ( ON ?auto_540691 ?auto_540690 ) ( ON ?auto_540692 ?auto_540691 ) ( not ( = ?auto_540689 ?auto_540690 ) ) ( not ( = ?auto_540689 ?auto_540691 ) ) ( not ( = ?auto_540689 ?auto_540692 ) ) ( not ( = ?auto_540689 ?auto_540693 ) ) ( not ( = ?auto_540689 ?auto_540694 ) ) ( not ( = ?auto_540689 ?auto_540695 ) ) ( not ( = ?auto_540689 ?auto_540696 ) ) ( not ( = ?auto_540690 ?auto_540691 ) ) ( not ( = ?auto_540690 ?auto_540692 ) ) ( not ( = ?auto_540690 ?auto_540693 ) ) ( not ( = ?auto_540690 ?auto_540694 ) ) ( not ( = ?auto_540690 ?auto_540695 ) ) ( not ( = ?auto_540690 ?auto_540696 ) ) ( not ( = ?auto_540691 ?auto_540692 ) ) ( not ( = ?auto_540691 ?auto_540693 ) ) ( not ( = ?auto_540691 ?auto_540694 ) ) ( not ( = ?auto_540691 ?auto_540695 ) ) ( not ( = ?auto_540691 ?auto_540696 ) ) ( not ( = ?auto_540692 ?auto_540693 ) ) ( not ( = ?auto_540692 ?auto_540694 ) ) ( not ( = ?auto_540692 ?auto_540695 ) ) ( not ( = ?auto_540692 ?auto_540696 ) ) ( not ( = ?auto_540693 ?auto_540694 ) ) ( not ( = ?auto_540693 ?auto_540695 ) ) ( not ( = ?auto_540693 ?auto_540696 ) ) ( not ( = ?auto_540694 ?auto_540695 ) ) ( not ( = ?auto_540694 ?auto_540696 ) ) ( not ( = ?auto_540695 ?auto_540696 ) ) ( ON ?auto_540694 ?auto_540695 ) ( CLEAR ?auto_540692 ) ( ON ?auto_540693 ?auto_540694 ) ( CLEAR ?auto_540693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_540689 ?auto_540690 ?auto_540691 ?auto_540692 ?auto_540693 )
      ( MAKE-7PILE ?auto_540689 ?auto_540690 ?auto_540691 ?auto_540692 ?auto_540693 ?auto_540694 ?auto_540695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540719 - BLOCK
      ?auto_540720 - BLOCK
      ?auto_540721 - BLOCK
      ?auto_540722 - BLOCK
      ?auto_540723 - BLOCK
      ?auto_540724 - BLOCK
      ?auto_540725 - BLOCK
    )
    :vars
    (
      ?auto_540726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540725 ?auto_540726 ) ( ON-TABLE ?auto_540719 ) ( ON ?auto_540720 ?auto_540719 ) ( ON ?auto_540721 ?auto_540720 ) ( not ( = ?auto_540719 ?auto_540720 ) ) ( not ( = ?auto_540719 ?auto_540721 ) ) ( not ( = ?auto_540719 ?auto_540722 ) ) ( not ( = ?auto_540719 ?auto_540723 ) ) ( not ( = ?auto_540719 ?auto_540724 ) ) ( not ( = ?auto_540719 ?auto_540725 ) ) ( not ( = ?auto_540719 ?auto_540726 ) ) ( not ( = ?auto_540720 ?auto_540721 ) ) ( not ( = ?auto_540720 ?auto_540722 ) ) ( not ( = ?auto_540720 ?auto_540723 ) ) ( not ( = ?auto_540720 ?auto_540724 ) ) ( not ( = ?auto_540720 ?auto_540725 ) ) ( not ( = ?auto_540720 ?auto_540726 ) ) ( not ( = ?auto_540721 ?auto_540722 ) ) ( not ( = ?auto_540721 ?auto_540723 ) ) ( not ( = ?auto_540721 ?auto_540724 ) ) ( not ( = ?auto_540721 ?auto_540725 ) ) ( not ( = ?auto_540721 ?auto_540726 ) ) ( not ( = ?auto_540722 ?auto_540723 ) ) ( not ( = ?auto_540722 ?auto_540724 ) ) ( not ( = ?auto_540722 ?auto_540725 ) ) ( not ( = ?auto_540722 ?auto_540726 ) ) ( not ( = ?auto_540723 ?auto_540724 ) ) ( not ( = ?auto_540723 ?auto_540725 ) ) ( not ( = ?auto_540723 ?auto_540726 ) ) ( not ( = ?auto_540724 ?auto_540725 ) ) ( not ( = ?auto_540724 ?auto_540726 ) ) ( not ( = ?auto_540725 ?auto_540726 ) ) ( ON ?auto_540724 ?auto_540725 ) ( ON ?auto_540723 ?auto_540724 ) ( CLEAR ?auto_540721 ) ( ON ?auto_540722 ?auto_540723 ) ( CLEAR ?auto_540722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_540719 ?auto_540720 ?auto_540721 ?auto_540722 )
      ( MAKE-7PILE ?auto_540719 ?auto_540720 ?auto_540721 ?auto_540722 ?auto_540723 ?auto_540724 ?auto_540725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540749 - BLOCK
      ?auto_540750 - BLOCK
      ?auto_540751 - BLOCK
      ?auto_540752 - BLOCK
      ?auto_540753 - BLOCK
      ?auto_540754 - BLOCK
      ?auto_540755 - BLOCK
    )
    :vars
    (
      ?auto_540756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540755 ?auto_540756 ) ( ON-TABLE ?auto_540749 ) ( ON ?auto_540750 ?auto_540749 ) ( not ( = ?auto_540749 ?auto_540750 ) ) ( not ( = ?auto_540749 ?auto_540751 ) ) ( not ( = ?auto_540749 ?auto_540752 ) ) ( not ( = ?auto_540749 ?auto_540753 ) ) ( not ( = ?auto_540749 ?auto_540754 ) ) ( not ( = ?auto_540749 ?auto_540755 ) ) ( not ( = ?auto_540749 ?auto_540756 ) ) ( not ( = ?auto_540750 ?auto_540751 ) ) ( not ( = ?auto_540750 ?auto_540752 ) ) ( not ( = ?auto_540750 ?auto_540753 ) ) ( not ( = ?auto_540750 ?auto_540754 ) ) ( not ( = ?auto_540750 ?auto_540755 ) ) ( not ( = ?auto_540750 ?auto_540756 ) ) ( not ( = ?auto_540751 ?auto_540752 ) ) ( not ( = ?auto_540751 ?auto_540753 ) ) ( not ( = ?auto_540751 ?auto_540754 ) ) ( not ( = ?auto_540751 ?auto_540755 ) ) ( not ( = ?auto_540751 ?auto_540756 ) ) ( not ( = ?auto_540752 ?auto_540753 ) ) ( not ( = ?auto_540752 ?auto_540754 ) ) ( not ( = ?auto_540752 ?auto_540755 ) ) ( not ( = ?auto_540752 ?auto_540756 ) ) ( not ( = ?auto_540753 ?auto_540754 ) ) ( not ( = ?auto_540753 ?auto_540755 ) ) ( not ( = ?auto_540753 ?auto_540756 ) ) ( not ( = ?auto_540754 ?auto_540755 ) ) ( not ( = ?auto_540754 ?auto_540756 ) ) ( not ( = ?auto_540755 ?auto_540756 ) ) ( ON ?auto_540754 ?auto_540755 ) ( ON ?auto_540753 ?auto_540754 ) ( ON ?auto_540752 ?auto_540753 ) ( CLEAR ?auto_540750 ) ( ON ?auto_540751 ?auto_540752 ) ( CLEAR ?auto_540751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_540749 ?auto_540750 ?auto_540751 )
      ( MAKE-7PILE ?auto_540749 ?auto_540750 ?auto_540751 ?auto_540752 ?auto_540753 ?auto_540754 ?auto_540755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540779 - BLOCK
      ?auto_540780 - BLOCK
      ?auto_540781 - BLOCK
      ?auto_540782 - BLOCK
      ?auto_540783 - BLOCK
      ?auto_540784 - BLOCK
      ?auto_540785 - BLOCK
    )
    :vars
    (
      ?auto_540786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540785 ?auto_540786 ) ( ON-TABLE ?auto_540779 ) ( not ( = ?auto_540779 ?auto_540780 ) ) ( not ( = ?auto_540779 ?auto_540781 ) ) ( not ( = ?auto_540779 ?auto_540782 ) ) ( not ( = ?auto_540779 ?auto_540783 ) ) ( not ( = ?auto_540779 ?auto_540784 ) ) ( not ( = ?auto_540779 ?auto_540785 ) ) ( not ( = ?auto_540779 ?auto_540786 ) ) ( not ( = ?auto_540780 ?auto_540781 ) ) ( not ( = ?auto_540780 ?auto_540782 ) ) ( not ( = ?auto_540780 ?auto_540783 ) ) ( not ( = ?auto_540780 ?auto_540784 ) ) ( not ( = ?auto_540780 ?auto_540785 ) ) ( not ( = ?auto_540780 ?auto_540786 ) ) ( not ( = ?auto_540781 ?auto_540782 ) ) ( not ( = ?auto_540781 ?auto_540783 ) ) ( not ( = ?auto_540781 ?auto_540784 ) ) ( not ( = ?auto_540781 ?auto_540785 ) ) ( not ( = ?auto_540781 ?auto_540786 ) ) ( not ( = ?auto_540782 ?auto_540783 ) ) ( not ( = ?auto_540782 ?auto_540784 ) ) ( not ( = ?auto_540782 ?auto_540785 ) ) ( not ( = ?auto_540782 ?auto_540786 ) ) ( not ( = ?auto_540783 ?auto_540784 ) ) ( not ( = ?auto_540783 ?auto_540785 ) ) ( not ( = ?auto_540783 ?auto_540786 ) ) ( not ( = ?auto_540784 ?auto_540785 ) ) ( not ( = ?auto_540784 ?auto_540786 ) ) ( not ( = ?auto_540785 ?auto_540786 ) ) ( ON ?auto_540784 ?auto_540785 ) ( ON ?auto_540783 ?auto_540784 ) ( ON ?auto_540782 ?auto_540783 ) ( ON ?auto_540781 ?auto_540782 ) ( CLEAR ?auto_540779 ) ( ON ?auto_540780 ?auto_540781 ) ( CLEAR ?auto_540780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_540779 ?auto_540780 )
      ( MAKE-7PILE ?auto_540779 ?auto_540780 ?auto_540781 ?auto_540782 ?auto_540783 ?auto_540784 ?auto_540785 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_540809 - BLOCK
      ?auto_540810 - BLOCK
      ?auto_540811 - BLOCK
      ?auto_540812 - BLOCK
      ?auto_540813 - BLOCK
      ?auto_540814 - BLOCK
      ?auto_540815 - BLOCK
    )
    :vars
    (
      ?auto_540816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540815 ?auto_540816 ) ( not ( = ?auto_540809 ?auto_540810 ) ) ( not ( = ?auto_540809 ?auto_540811 ) ) ( not ( = ?auto_540809 ?auto_540812 ) ) ( not ( = ?auto_540809 ?auto_540813 ) ) ( not ( = ?auto_540809 ?auto_540814 ) ) ( not ( = ?auto_540809 ?auto_540815 ) ) ( not ( = ?auto_540809 ?auto_540816 ) ) ( not ( = ?auto_540810 ?auto_540811 ) ) ( not ( = ?auto_540810 ?auto_540812 ) ) ( not ( = ?auto_540810 ?auto_540813 ) ) ( not ( = ?auto_540810 ?auto_540814 ) ) ( not ( = ?auto_540810 ?auto_540815 ) ) ( not ( = ?auto_540810 ?auto_540816 ) ) ( not ( = ?auto_540811 ?auto_540812 ) ) ( not ( = ?auto_540811 ?auto_540813 ) ) ( not ( = ?auto_540811 ?auto_540814 ) ) ( not ( = ?auto_540811 ?auto_540815 ) ) ( not ( = ?auto_540811 ?auto_540816 ) ) ( not ( = ?auto_540812 ?auto_540813 ) ) ( not ( = ?auto_540812 ?auto_540814 ) ) ( not ( = ?auto_540812 ?auto_540815 ) ) ( not ( = ?auto_540812 ?auto_540816 ) ) ( not ( = ?auto_540813 ?auto_540814 ) ) ( not ( = ?auto_540813 ?auto_540815 ) ) ( not ( = ?auto_540813 ?auto_540816 ) ) ( not ( = ?auto_540814 ?auto_540815 ) ) ( not ( = ?auto_540814 ?auto_540816 ) ) ( not ( = ?auto_540815 ?auto_540816 ) ) ( ON ?auto_540814 ?auto_540815 ) ( ON ?auto_540813 ?auto_540814 ) ( ON ?auto_540812 ?auto_540813 ) ( ON ?auto_540811 ?auto_540812 ) ( ON ?auto_540810 ?auto_540811 ) ( ON ?auto_540809 ?auto_540810 ) ( CLEAR ?auto_540809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_540809 )
      ( MAKE-7PILE ?auto_540809 ?auto_540810 ?auto_540811 ?auto_540812 ?auto_540813 ?auto_540814 ?auto_540815 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_540840 - BLOCK
      ?auto_540841 - BLOCK
      ?auto_540842 - BLOCK
      ?auto_540843 - BLOCK
      ?auto_540844 - BLOCK
      ?auto_540845 - BLOCK
      ?auto_540846 - BLOCK
      ?auto_540847 - BLOCK
    )
    :vars
    (
      ?auto_540848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_540846 ) ( ON ?auto_540847 ?auto_540848 ) ( CLEAR ?auto_540847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_540840 ) ( ON ?auto_540841 ?auto_540840 ) ( ON ?auto_540842 ?auto_540841 ) ( ON ?auto_540843 ?auto_540842 ) ( ON ?auto_540844 ?auto_540843 ) ( ON ?auto_540845 ?auto_540844 ) ( ON ?auto_540846 ?auto_540845 ) ( not ( = ?auto_540840 ?auto_540841 ) ) ( not ( = ?auto_540840 ?auto_540842 ) ) ( not ( = ?auto_540840 ?auto_540843 ) ) ( not ( = ?auto_540840 ?auto_540844 ) ) ( not ( = ?auto_540840 ?auto_540845 ) ) ( not ( = ?auto_540840 ?auto_540846 ) ) ( not ( = ?auto_540840 ?auto_540847 ) ) ( not ( = ?auto_540840 ?auto_540848 ) ) ( not ( = ?auto_540841 ?auto_540842 ) ) ( not ( = ?auto_540841 ?auto_540843 ) ) ( not ( = ?auto_540841 ?auto_540844 ) ) ( not ( = ?auto_540841 ?auto_540845 ) ) ( not ( = ?auto_540841 ?auto_540846 ) ) ( not ( = ?auto_540841 ?auto_540847 ) ) ( not ( = ?auto_540841 ?auto_540848 ) ) ( not ( = ?auto_540842 ?auto_540843 ) ) ( not ( = ?auto_540842 ?auto_540844 ) ) ( not ( = ?auto_540842 ?auto_540845 ) ) ( not ( = ?auto_540842 ?auto_540846 ) ) ( not ( = ?auto_540842 ?auto_540847 ) ) ( not ( = ?auto_540842 ?auto_540848 ) ) ( not ( = ?auto_540843 ?auto_540844 ) ) ( not ( = ?auto_540843 ?auto_540845 ) ) ( not ( = ?auto_540843 ?auto_540846 ) ) ( not ( = ?auto_540843 ?auto_540847 ) ) ( not ( = ?auto_540843 ?auto_540848 ) ) ( not ( = ?auto_540844 ?auto_540845 ) ) ( not ( = ?auto_540844 ?auto_540846 ) ) ( not ( = ?auto_540844 ?auto_540847 ) ) ( not ( = ?auto_540844 ?auto_540848 ) ) ( not ( = ?auto_540845 ?auto_540846 ) ) ( not ( = ?auto_540845 ?auto_540847 ) ) ( not ( = ?auto_540845 ?auto_540848 ) ) ( not ( = ?auto_540846 ?auto_540847 ) ) ( not ( = ?auto_540846 ?auto_540848 ) ) ( not ( = ?auto_540847 ?auto_540848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_540847 ?auto_540848 )
      ( !STACK ?auto_540847 ?auto_540846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_540874 - BLOCK
      ?auto_540875 - BLOCK
      ?auto_540876 - BLOCK
      ?auto_540877 - BLOCK
      ?auto_540878 - BLOCK
      ?auto_540879 - BLOCK
      ?auto_540880 - BLOCK
      ?auto_540881 - BLOCK
    )
    :vars
    (
      ?auto_540882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540881 ?auto_540882 ) ( ON-TABLE ?auto_540874 ) ( ON ?auto_540875 ?auto_540874 ) ( ON ?auto_540876 ?auto_540875 ) ( ON ?auto_540877 ?auto_540876 ) ( ON ?auto_540878 ?auto_540877 ) ( ON ?auto_540879 ?auto_540878 ) ( not ( = ?auto_540874 ?auto_540875 ) ) ( not ( = ?auto_540874 ?auto_540876 ) ) ( not ( = ?auto_540874 ?auto_540877 ) ) ( not ( = ?auto_540874 ?auto_540878 ) ) ( not ( = ?auto_540874 ?auto_540879 ) ) ( not ( = ?auto_540874 ?auto_540880 ) ) ( not ( = ?auto_540874 ?auto_540881 ) ) ( not ( = ?auto_540874 ?auto_540882 ) ) ( not ( = ?auto_540875 ?auto_540876 ) ) ( not ( = ?auto_540875 ?auto_540877 ) ) ( not ( = ?auto_540875 ?auto_540878 ) ) ( not ( = ?auto_540875 ?auto_540879 ) ) ( not ( = ?auto_540875 ?auto_540880 ) ) ( not ( = ?auto_540875 ?auto_540881 ) ) ( not ( = ?auto_540875 ?auto_540882 ) ) ( not ( = ?auto_540876 ?auto_540877 ) ) ( not ( = ?auto_540876 ?auto_540878 ) ) ( not ( = ?auto_540876 ?auto_540879 ) ) ( not ( = ?auto_540876 ?auto_540880 ) ) ( not ( = ?auto_540876 ?auto_540881 ) ) ( not ( = ?auto_540876 ?auto_540882 ) ) ( not ( = ?auto_540877 ?auto_540878 ) ) ( not ( = ?auto_540877 ?auto_540879 ) ) ( not ( = ?auto_540877 ?auto_540880 ) ) ( not ( = ?auto_540877 ?auto_540881 ) ) ( not ( = ?auto_540877 ?auto_540882 ) ) ( not ( = ?auto_540878 ?auto_540879 ) ) ( not ( = ?auto_540878 ?auto_540880 ) ) ( not ( = ?auto_540878 ?auto_540881 ) ) ( not ( = ?auto_540878 ?auto_540882 ) ) ( not ( = ?auto_540879 ?auto_540880 ) ) ( not ( = ?auto_540879 ?auto_540881 ) ) ( not ( = ?auto_540879 ?auto_540882 ) ) ( not ( = ?auto_540880 ?auto_540881 ) ) ( not ( = ?auto_540880 ?auto_540882 ) ) ( not ( = ?auto_540881 ?auto_540882 ) ) ( CLEAR ?auto_540879 ) ( ON ?auto_540880 ?auto_540881 ) ( CLEAR ?auto_540880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_540874 ?auto_540875 ?auto_540876 ?auto_540877 ?auto_540878 ?auto_540879 ?auto_540880 )
      ( MAKE-8PILE ?auto_540874 ?auto_540875 ?auto_540876 ?auto_540877 ?auto_540878 ?auto_540879 ?auto_540880 ?auto_540881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_540908 - BLOCK
      ?auto_540909 - BLOCK
      ?auto_540910 - BLOCK
      ?auto_540911 - BLOCK
      ?auto_540912 - BLOCK
      ?auto_540913 - BLOCK
      ?auto_540914 - BLOCK
      ?auto_540915 - BLOCK
    )
    :vars
    (
      ?auto_540916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540915 ?auto_540916 ) ( ON-TABLE ?auto_540908 ) ( ON ?auto_540909 ?auto_540908 ) ( ON ?auto_540910 ?auto_540909 ) ( ON ?auto_540911 ?auto_540910 ) ( ON ?auto_540912 ?auto_540911 ) ( not ( = ?auto_540908 ?auto_540909 ) ) ( not ( = ?auto_540908 ?auto_540910 ) ) ( not ( = ?auto_540908 ?auto_540911 ) ) ( not ( = ?auto_540908 ?auto_540912 ) ) ( not ( = ?auto_540908 ?auto_540913 ) ) ( not ( = ?auto_540908 ?auto_540914 ) ) ( not ( = ?auto_540908 ?auto_540915 ) ) ( not ( = ?auto_540908 ?auto_540916 ) ) ( not ( = ?auto_540909 ?auto_540910 ) ) ( not ( = ?auto_540909 ?auto_540911 ) ) ( not ( = ?auto_540909 ?auto_540912 ) ) ( not ( = ?auto_540909 ?auto_540913 ) ) ( not ( = ?auto_540909 ?auto_540914 ) ) ( not ( = ?auto_540909 ?auto_540915 ) ) ( not ( = ?auto_540909 ?auto_540916 ) ) ( not ( = ?auto_540910 ?auto_540911 ) ) ( not ( = ?auto_540910 ?auto_540912 ) ) ( not ( = ?auto_540910 ?auto_540913 ) ) ( not ( = ?auto_540910 ?auto_540914 ) ) ( not ( = ?auto_540910 ?auto_540915 ) ) ( not ( = ?auto_540910 ?auto_540916 ) ) ( not ( = ?auto_540911 ?auto_540912 ) ) ( not ( = ?auto_540911 ?auto_540913 ) ) ( not ( = ?auto_540911 ?auto_540914 ) ) ( not ( = ?auto_540911 ?auto_540915 ) ) ( not ( = ?auto_540911 ?auto_540916 ) ) ( not ( = ?auto_540912 ?auto_540913 ) ) ( not ( = ?auto_540912 ?auto_540914 ) ) ( not ( = ?auto_540912 ?auto_540915 ) ) ( not ( = ?auto_540912 ?auto_540916 ) ) ( not ( = ?auto_540913 ?auto_540914 ) ) ( not ( = ?auto_540913 ?auto_540915 ) ) ( not ( = ?auto_540913 ?auto_540916 ) ) ( not ( = ?auto_540914 ?auto_540915 ) ) ( not ( = ?auto_540914 ?auto_540916 ) ) ( not ( = ?auto_540915 ?auto_540916 ) ) ( ON ?auto_540914 ?auto_540915 ) ( CLEAR ?auto_540912 ) ( ON ?auto_540913 ?auto_540914 ) ( CLEAR ?auto_540913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_540908 ?auto_540909 ?auto_540910 ?auto_540911 ?auto_540912 ?auto_540913 )
      ( MAKE-8PILE ?auto_540908 ?auto_540909 ?auto_540910 ?auto_540911 ?auto_540912 ?auto_540913 ?auto_540914 ?auto_540915 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_540942 - BLOCK
      ?auto_540943 - BLOCK
      ?auto_540944 - BLOCK
      ?auto_540945 - BLOCK
      ?auto_540946 - BLOCK
      ?auto_540947 - BLOCK
      ?auto_540948 - BLOCK
      ?auto_540949 - BLOCK
    )
    :vars
    (
      ?auto_540950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540949 ?auto_540950 ) ( ON-TABLE ?auto_540942 ) ( ON ?auto_540943 ?auto_540942 ) ( ON ?auto_540944 ?auto_540943 ) ( ON ?auto_540945 ?auto_540944 ) ( not ( = ?auto_540942 ?auto_540943 ) ) ( not ( = ?auto_540942 ?auto_540944 ) ) ( not ( = ?auto_540942 ?auto_540945 ) ) ( not ( = ?auto_540942 ?auto_540946 ) ) ( not ( = ?auto_540942 ?auto_540947 ) ) ( not ( = ?auto_540942 ?auto_540948 ) ) ( not ( = ?auto_540942 ?auto_540949 ) ) ( not ( = ?auto_540942 ?auto_540950 ) ) ( not ( = ?auto_540943 ?auto_540944 ) ) ( not ( = ?auto_540943 ?auto_540945 ) ) ( not ( = ?auto_540943 ?auto_540946 ) ) ( not ( = ?auto_540943 ?auto_540947 ) ) ( not ( = ?auto_540943 ?auto_540948 ) ) ( not ( = ?auto_540943 ?auto_540949 ) ) ( not ( = ?auto_540943 ?auto_540950 ) ) ( not ( = ?auto_540944 ?auto_540945 ) ) ( not ( = ?auto_540944 ?auto_540946 ) ) ( not ( = ?auto_540944 ?auto_540947 ) ) ( not ( = ?auto_540944 ?auto_540948 ) ) ( not ( = ?auto_540944 ?auto_540949 ) ) ( not ( = ?auto_540944 ?auto_540950 ) ) ( not ( = ?auto_540945 ?auto_540946 ) ) ( not ( = ?auto_540945 ?auto_540947 ) ) ( not ( = ?auto_540945 ?auto_540948 ) ) ( not ( = ?auto_540945 ?auto_540949 ) ) ( not ( = ?auto_540945 ?auto_540950 ) ) ( not ( = ?auto_540946 ?auto_540947 ) ) ( not ( = ?auto_540946 ?auto_540948 ) ) ( not ( = ?auto_540946 ?auto_540949 ) ) ( not ( = ?auto_540946 ?auto_540950 ) ) ( not ( = ?auto_540947 ?auto_540948 ) ) ( not ( = ?auto_540947 ?auto_540949 ) ) ( not ( = ?auto_540947 ?auto_540950 ) ) ( not ( = ?auto_540948 ?auto_540949 ) ) ( not ( = ?auto_540948 ?auto_540950 ) ) ( not ( = ?auto_540949 ?auto_540950 ) ) ( ON ?auto_540948 ?auto_540949 ) ( ON ?auto_540947 ?auto_540948 ) ( CLEAR ?auto_540945 ) ( ON ?auto_540946 ?auto_540947 ) ( CLEAR ?auto_540946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_540942 ?auto_540943 ?auto_540944 ?auto_540945 ?auto_540946 )
      ( MAKE-8PILE ?auto_540942 ?auto_540943 ?auto_540944 ?auto_540945 ?auto_540946 ?auto_540947 ?auto_540948 ?auto_540949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_540976 - BLOCK
      ?auto_540977 - BLOCK
      ?auto_540978 - BLOCK
      ?auto_540979 - BLOCK
      ?auto_540980 - BLOCK
      ?auto_540981 - BLOCK
      ?auto_540982 - BLOCK
      ?auto_540983 - BLOCK
    )
    :vars
    (
      ?auto_540984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_540983 ?auto_540984 ) ( ON-TABLE ?auto_540976 ) ( ON ?auto_540977 ?auto_540976 ) ( ON ?auto_540978 ?auto_540977 ) ( not ( = ?auto_540976 ?auto_540977 ) ) ( not ( = ?auto_540976 ?auto_540978 ) ) ( not ( = ?auto_540976 ?auto_540979 ) ) ( not ( = ?auto_540976 ?auto_540980 ) ) ( not ( = ?auto_540976 ?auto_540981 ) ) ( not ( = ?auto_540976 ?auto_540982 ) ) ( not ( = ?auto_540976 ?auto_540983 ) ) ( not ( = ?auto_540976 ?auto_540984 ) ) ( not ( = ?auto_540977 ?auto_540978 ) ) ( not ( = ?auto_540977 ?auto_540979 ) ) ( not ( = ?auto_540977 ?auto_540980 ) ) ( not ( = ?auto_540977 ?auto_540981 ) ) ( not ( = ?auto_540977 ?auto_540982 ) ) ( not ( = ?auto_540977 ?auto_540983 ) ) ( not ( = ?auto_540977 ?auto_540984 ) ) ( not ( = ?auto_540978 ?auto_540979 ) ) ( not ( = ?auto_540978 ?auto_540980 ) ) ( not ( = ?auto_540978 ?auto_540981 ) ) ( not ( = ?auto_540978 ?auto_540982 ) ) ( not ( = ?auto_540978 ?auto_540983 ) ) ( not ( = ?auto_540978 ?auto_540984 ) ) ( not ( = ?auto_540979 ?auto_540980 ) ) ( not ( = ?auto_540979 ?auto_540981 ) ) ( not ( = ?auto_540979 ?auto_540982 ) ) ( not ( = ?auto_540979 ?auto_540983 ) ) ( not ( = ?auto_540979 ?auto_540984 ) ) ( not ( = ?auto_540980 ?auto_540981 ) ) ( not ( = ?auto_540980 ?auto_540982 ) ) ( not ( = ?auto_540980 ?auto_540983 ) ) ( not ( = ?auto_540980 ?auto_540984 ) ) ( not ( = ?auto_540981 ?auto_540982 ) ) ( not ( = ?auto_540981 ?auto_540983 ) ) ( not ( = ?auto_540981 ?auto_540984 ) ) ( not ( = ?auto_540982 ?auto_540983 ) ) ( not ( = ?auto_540982 ?auto_540984 ) ) ( not ( = ?auto_540983 ?auto_540984 ) ) ( ON ?auto_540982 ?auto_540983 ) ( ON ?auto_540981 ?auto_540982 ) ( ON ?auto_540980 ?auto_540981 ) ( CLEAR ?auto_540978 ) ( ON ?auto_540979 ?auto_540980 ) ( CLEAR ?auto_540979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_540976 ?auto_540977 ?auto_540978 ?auto_540979 )
      ( MAKE-8PILE ?auto_540976 ?auto_540977 ?auto_540978 ?auto_540979 ?auto_540980 ?auto_540981 ?auto_540982 ?auto_540983 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_541010 - BLOCK
      ?auto_541011 - BLOCK
      ?auto_541012 - BLOCK
      ?auto_541013 - BLOCK
      ?auto_541014 - BLOCK
      ?auto_541015 - BLOCK
      ?auto_541016 - BLOCK
      ?auto_541017 - BLOCK
    )
    :vars
    (
      ?auto_541018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541017 ?auto_541018 ) ( ON-TABLE ?auto_541010 ) ( ON ?auto_541011 ?auto_541010 ) ( not ( = ?auto_541010 ?auto_541011 ) ) ( not ( = ?auto_541010 ?auto_541012 ) ) ( not ( = ?auto_541010 ?auto_541013 ) ) ( not ( = ?auto_541010 ?auto_541014 ) ) ( not ( = ?auto_541010 ?auto_541015 ) ) ( not ( = ?auto_541010 ?auto_541016 ) ) ( not ( = ?auto_541010 ?auto_541017 ) ) ( not ( = ?auto_541010 ?auto_541018 ) ) ( not ( = ?auto_541011 ?auto_541012 ) ) ( not ( = ?auto_541011 ?auto_541013 ) ) ( not ( = ?auto_541011 ?auto_541014 ) ) ( not ( = ?auto_541011 ?auto_541015 ) ) ( not ( = ?auto_541011 ?auto_541016 ) ) ( not ( = ?auto_541011 ?auto_541017 ) ) ( not ( = ?auto_541011 ?auto_541018 ) ) ( not ( = ?auto_541012 ?auto_541013 ) ) ( not ( = ?auto_541012 ?auto_541014 ) ) ( not ( = ?auto_541012 ?auto_541015 ) ) ( not ( = ?auto_541012 ?auto_541016 ) ) ( not ( = ?auto_541012 ?auto_541017 ) ) ( not ( = ?auto_541012 ?auto_541018 ) ) ( not ( = ?auto_541013 ?auto_541014 ) ) ( not ( = ?auto_541013 ?auto_541015 ) ) ( not ( = ?auto_541013 ?auto_541016 ) ) ( not ( = ?auto_541013 ?auto_541017 ) ) ( not ( = ?auto_541013 ?auto_541018 ) ) ( not ( = ?auto_541014 ?auto_541015 ) ) ( not ( = ?auto_541014 ?auto_541016 ) ) ( not ( = ?auto_541014 ?auto_541017 ) ) ( not ( = ?auto_541014 ?auto_541018 ) ) ( not ( = ?auto_541015 ?auto_541016 ) ) ( not ( = ?auto_541015 ?auto_541017 ) ) ( not ( = ?auto_541015 ?auto_541018 ) ) ( not ( = ?auto_541016 ?auto_541017 ) ) ( not ( = ?auto_541016 ?auto_541018 ) ) ( not ( = ?auto_541017 ?auto_541018 ) ) ( ON ?auto_541016 ?auto_541017 ) ( ON ?auto_541015 ?auto_541016 ) ( ON ?auto_541014 ?auto_541015 ) ( ON ?auto_541013 ?auto_541014 ) ( CLEAR ?auto_541011 ) ( ON ?auto_541012 ?auto_541013 ) ( CLEAR ?auto_541012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_541010 ?auto_541011 ?auto_541012 )
      ( MAKE-8PILE ?auto_541010 ?auto_541011 ?auto_541012 ?auto_541013 ?auto_541014 ?auto_541015 ?auto_541016 ?auto_541017 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_541044 - BLOCK
      ?auto_541045 - BLOCK
      ?auto_541046 - BLOCK
      ?auto_541047 - BLOCK
      ?auto_541048 - BLOCK
      ?auto_541049 - BLOCK
      ?auto_541050 - BLOCK
      ?auto_541051 - BLOCK
    )
    :vars
    (
      ?auto_541052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541051 ?auto_541052 ) ( ON-TABLE ?auto_541044 ) ( not ( = ?auto_541044 ?auto_541045 ) ) ( not ( = ?auto_541044 ?auto_541046 ) ) ( not ( = ?auto_541044 ?auto_541047 ) ) ( not ( = ?auto_541044 ?auto_541048 ) ) ( not ( = ?auto_541044 ?auto_541049 ) ) ( not ( = ?auto_541044 ?auto_541050 ) ) ( not ( = ?auto_541044 ?auto_541051 ) ) ( not ( = ?auto_541044 ?auto_541052 ) ) ( not ( = ?auto_541045 ?auto_541046 ) ) ( not ( = ?auto_541045 ?auto_541047 ) ) ( not ( = ?auto_541045 ?auto_541048 ) ) ( not ( = ?auto_541045 ?auto_541049 ) ) ( not ( = ?auto_541045 ?auto_541050 ) ) ( not ( = ?auto_541045 ?auto_541051 ) ) ( not ( = ?auto_541045 ?auto_541052 ) ) ( not ( = ?auto_541046 ?auto_541047 ) ) ( not ( = ?auto_541046 ?auto_541048 ) ) ( not ( = ?auto_541046 ?auto_541049 ) ) ( not ( = ?auto_541046 ?auto_541050 ) ) ( not ( = ?auto_541046 ?auto_541051 ) ) ( not ( = ?auto_541046 ?auto_541052 ) ) ( not ( = ?auto_541047 ?auto_541048 ) ) ( not ( = ?auto_541047 ?auto_541049 ) ) ( not ( = ?auto_541047 ?auto_541050 ) ) ( not ( = ?auto_541047 ?auto_541051 ) ) ( not ( = ?auto_541047 ?auto_541052 ) ) ( not ( = ?auto_541048 ?auto_541049 ) ) ( not ( = ?auto_541048 ?auto_541050 ) ) ( not ( = ?auto_541048 ?auto_541051 ) ) ( not ( = ?auto_541048 ?auto_541052 ) ) ( not ( = ?auto_541049 ?auto_541050 ) ) ( not ( = ?auto_541049 ?auto_541051 ) ) ( not ( = ?auto_541049 ?auto_541052 ) ) ( not ( = ?auto_541050 ?auto_541051 ) ) ( not ( = ?auto_541050 ?auto_541052 ) ) ( not ( = ?auto_541051 ?auto_541052 ) ) ( ON ?auto_541050 ?auto_541051 ) ( ON ?auto_541049 ?auto_541050 ) ( ON ?auto_541048 ?auto_541049 ) ( ON ?auto_541047 ?auto_541048 ) ( ON ?auto_541046 ?auto_541047 ) ( CLEAR ?auto_541044 ) ( ON ?auto_541045 ?auto_541046 ) ( CLEAR ?auto_541045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_541044 ?auto_541045 )
      ( MAKE-8PILE ?auto_541044 ?auto_541045 ?auto_541046 ?auto_541047 ?auto_541048 ?auto_541049 ?auto_541050 ?auto_541051 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_541078 - BLOCK
      ?auto_541079 - BLOCK
      ?auto_541080 - BLOCK
      ?auto_541081 - BLOCK
      ?auto_541082 - BLOCK
      ?auto_541083 - BLOCK
      ?auto_541084 - BLOCK
      ?auto_541085 - BLOCK
    )
    :vars
    (
      ?auto_541086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541085 ?auto_541086 ) ( not ( = ?auto_541078 ?auto_541079 ) ) ( not ( = ?auto_541078 ?auto_541080 ) ) ( not ( = ?auto_541078 ?auto_541081 ) ) ( not ( = ?auto_541078 ?auto_541082 ) ) ( not ( = ?auto_541078 ?auto_541083 ) ) ( not ( = ?auto_541078 ?auto_541084 ) ) ( not ( = ?auto_541078 ?auto_541085 ) ) ( not ( = ?auto_541078 ?auto_541086 ) ) ( not ( = ?auto_541079 ?auto_541080 ) ) ( not ( = ?auto_541079 ?auto_541081 ) ) ( not ( = ?auto_541079 ?auto_541082 ) ) ( not ( = ?auto_541079 ?auto_541083 ) ) ( not ( = ?auto_541079 ?auto_541084 ) ) ( not ( = ?auto_541079 ?auto_541085 ) ) ( not ( = ?auto_541079 ?auto_541086 ) ) ( not ( = ?auto_541080 ?auto_541081 ) ) ( not ( = ?auto_541080 ?auto_541082 ) ) ( not ( = ?auto_541080 ?auto_541083 ) ) ( not ( = ?auto_541080 ?auto_541084 ) ) ( not ( = ?auto_541080 ?auto_541085 ) ) ( not ( = ?auto_541080 ?auto_541086 ) ) ( not ( = ?auto_541081 ?auto_541082 ) ) ( not ( = ?auto_541081 ?auto_541083 ) ) ( not ( = ?auto_541081 ?auto_541084 ) ) ( not ( = ?auto_541081 ?auto_541085 ) ) ( not ( = ?auto_541081 ?auto_541086 ) ) ( not ( = ?auto_541082 ?auto_541083 ) ) ( not ( = ?auto_541082 ?auto_541084 ) ) ( not ( = ?auto_541082 ?auto_541085 ) ) ( not ( = ?auto_541082 ?auto_541086 ) ) ( not ( = ?auto_541083 ?auto_541084 ) ) ( not ( = ?auto_541083 ?auto_541085 ) ) ( not ( = ?auto_541083 ?auto_541086 ) ) ( not ( = ?auto_541084 ?auto_541085 ) ) ( not ( = ?auto_541084 ?auto_541086 ) ) ( not ( = ?auto_541085 ?auto_541086 ) ) ( ON ?auto_541084 ?auto_541085 ) ( ON ?auto_541083 ?auto_541084 ) ( ON ?auto_541082 ?auto_541083 ) ( ON ?auto_541081 ?auto_541082 ) ( ON ?auto_541080 ?auto_541081 ) ( ON ?auto_541079 ?auto_541080 ) ( ON ?auto_541078 ?auto_541079 ) ( CLEAR ?auto_541078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_541078 )
      ( MAKE-8PILE ?auto_541078 ?auto_541079 ?auto_541080 ?auto_541081 ?auto_541082 ?auto_541083 ?auto_541084 ?auto_541085 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541113 - BLOCK
      ?auto_541114 - BLOCK
      ?auto_541115 - BLOCK
      ?auto_541116 - BLOCK
      ?auto_541117 - BLOCK
      ?auto_541118 - BLOCK
      ?auto_541119 - BLOCK
      ?auto_541120 - BLOCK
      ?auto_541121 - BLOCK
    )
    :vars
    (
      ?auto_541122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_541120 ) ( ON ?auto_541121 ?auto_541122 ) ( CLEAR ?auto_541121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_541113 ) ( ON ?auto_541114 ?auto_541113 ) ( ON ?auto_541115 ?auto_541114 ) ( ON ?auto_541116 ?auto_541115 ) ( ON ?auto_541117 ?auto_541116 ) ( ON ?auto_541118 ?auto_541117 ) ( ON ?auto_541119 ?auto_541118 ) ( ON ?auto_541120 ?auto_541119 ) ( not ( = ?auto_541113 ?auto_541114 ) ) ( not ( = ?auto_541113 ?auto_541115 ) ) ( not ( = ?auto_541113 ?auto_541116 ) ) ( not ( = ?auto_541113 ?auto_541117 ) ) ( not ( = ?auto_541113 ?auto_541118 ) ) ( not ( = ?auto_541113 ?auto_541119 ) ) ( not ( = ?auto_541113 ?auto_541120 ) ) ( not ( = ?auto_541113 ?auto_541121 ) ) ( not ( = ?auto_541113 ?auto_541122 ) ) ( not ( = ?auto_541114 ?auto_541115 ) ) ( not ( = ?auto_541114 ?auto_541116 ) ) ( not ( = ?auto_541114 ?auto_541117 ) ) ( not ( = ?auto_541114 ?auto_541118 ) ) ( not ( = ?auto_541114 ?auto_541119 ) ) ( not ( = ?auto_541114 ?auto_541120 ) ) ( not ( = ?auto_541114 ?auto_541121 ) ) ( not ( = ?auto_541114 ?auto_541122 ) ) ( not ( = ?auto_541115 ?auto_541116 ) ) ( not ( = ?auto_541115 ?auto_541117 ) ) ( not ( = ?auto_541115 ?auto_541118 ) ) ( not ( = ?auto_541115 ?auto_541119 ) ) ( not ( = ?auto_541115 ?auto_541120 ) ) ( not ( = ?auto_541115 ?auto_541121 ) ) ( not ( = ?auto_541115 ?auto_541122 ) ) ( not ( = ?auto_541116 ?auto_541117 ) ) ( not ( = ?auto_541116 ?auto_541118 ) ) ( not ( = ?auto_541116 ?auto_541119 ) ) ( not ( = ?auto_541116 ?auto_541120 ) ) ( not ( = ?auto_541116 ?auto_541121 ) ) ( not ( = ?auto_541116 ?auto_541122 ) ) ( not ( = ?auto_541117 ?auto_541118 ) ) ( not ( = ?auto_541117 ?auto_541119 ) ) ( not ( = ?auto_541117 ?auto_541120 ) ) ( not ( = ?auto_541117 ?auto_541121 ) ) ( not ( = ?auto_541117 ?auto_541122 ) ) ( not ( = ?auto_541118 ?auto_541119 ) ) ( not ( = ?auto_541118 ?auto_541120 ) ) ( not ( = ?auto_541118 ?auto_541121 ) ) ( not ( = ?auto_541118 ?auto_541122 ) ) ( not ( = ?auto_541119 ?auto_541120 ) ) ( not ( = ?auto_541119 ?auto_541121 ) ) ( not ( = ?auto_541119 ?auto_541122 ) ) ( not ( = ?auto_541120 ?auto_541121 ) ) ( not ( = ?auto_541120 ?auto_541122 ) ) ( not ( = ?auto_541121 ?auto_541122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_541121 ?auto_541122 )
      ( !STACK ?auto_541121 ?auto_541120 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541151 - BLOCK
      ?auto_541152 - BLOCK
      ?auto_541153 - BLOCK
      ?auto_541154 - BLOCK
      ?auto_541155 - BLOCK
      ?auto_541156 - BLOCK
      ?auto_541157 - BLOCK
      ?auto_541158 - BLOCK
      ?auto_541159 - BLOCK
    )
    :vars
    (
      ?auto_541160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541159 ?auto_541160 ) ( ON-TABLE ?auto_541151 ) ( ON ?auto_541152 ?auto_541151 ) ( ON ?auto_541153 ?auto_541152 ) ( ON ?auto_541154 ?auto_541153 ) ( ON ?auto_541155 ?auto_541154 ) ( ON ?auto_541156 ?auto_541155 ) ( ON ?auto_541157 ?auto_541156 ) ( not ( = ?auto_541151 ?auto_541152 ) ) ( not ( = ?auto_541151 ?auto_541153 ) ) ( not ( = ?auto_541151 ?auto_541154 ) ) ( not ( = ?auto_541151 ?auto_541155 ) ) ( not ( = ?auto_541151 ?auto_541156 ) ) ( not ( = ?auto_541151 ?auto_541157 ) ) ( not ( = ?auto_541151 ?auto_541158 ) ) ( not ( = ?auto_541151 ?auto_541159 ) ) ( not ( = ?auto_541151 ?auto_541160 ) ) ( not ( = ?auto_541152 ?auto_541153 ) ) ( not ( = ?auto_541152 ?auto_541154 ) ) ( not ( = ?auto_541152 ?auto_541155 ) ) ( not ( = ?auto_541152 ?auto_541156 ) ) ( not ( = ?auto_541152 ?auto_541157 ) ) ( not ( = ?auto_541152 ?auto_541158 ) ) ( not ( = ?auto_541152 ?auto_541159 ) ) ( not ( = ?auto_541152 ?auto_541160 ) ) ( not ( = ?auto_541153 ?auto_541154 ) ) ( not ( = ?auto_541153 ?auto_541155 ) ) ( not ( = ?auto_541153 ?auto_541156 ) ) ( not ( = ?auto_541153 ?auto_541157 ) ) ( not ( = ?auto_541153 ?auto_541158 ) ) ( not ( = ?auto_541153 ?auto_541159 ) ) ( not ( = ?auto_541153 ?auto_541160 ) ) ( not ( = ?auto_541154 ?auto_541155 ) ) ( not ( = ?auto_541154 ?auto_541156 ) ) ( not ( = ?auto_541154 ?auto_541157 ) ) ( not ( = ?auto_541154 ?auto_541158 ) ) ( not ( = ?auto_541154 ?auto_541159 ) ) ( not ( = ?auto_541154 ?auto_541160 ) ) ( not ( = ?auto_541155 ?auto_541156 ) ) ( not ( = ?auto_541155 ?auto_541157 ) ) ( not ( = ?auto_541155 ?auto_541158 ) ) ( not ( = ?auto_541155 ?auto_541159 ) ) ( not ( = ?auto_541155 ?auto_541160 ) ) ( not ( = ?auto_541156 ?auto_541157 ) ) ( not ( = ?auto_541156 ?auto_541158 ) ) ( not ( = ?auto_541156 ?auto_541159 ) ) ( not ( = ?auto_541156 ?auto_541160 ) ) ( not ( = ?auto_541157 ?auto_541158 ) ) ( not ( = ?auto_541157 ?auto_541159 ) ) ( not ( = ?auto_541157 ?auto_541160 ) ) ( not ( = ?auto_541158 ?auto_541159 ) ) ( not ( = ?auto_541158 ?auto_541160 ) ) ( not ( = ?auto_541159 ?auto_541160 ) ) ( CLEAR ?auto_541157 ) ( ON ?auto_541158 ?auto_541159 ) ( CLEAR ?auto_541158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_541151 ?auto_541152 ?auto_541153 ?auto_541154 ?auto_541155 ?auto_541156 ?auto_541157 ?auto_541158 )
      ( MAKE-9PILE ?auto_541151 ?auto_541152 ?auto_541153 ?auto_541154 ?auto_541155 ?auto_541156 ?auto_541157 ?auto_541158 ?auto_541159 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541189 - BLOCK
      ?auto_541190 - BLOCK
      ?auto_541191 - BLOCK
      ?auto_541192 - BLOCK
      ?auto_541193 - BLOCK
      ?auto_541194 - BLOCK
      ?auto_541195 - BLOCK
      ?auto_541196 - BLOCK
      ?auto_541197 - BLOCK
    )
    :vars
    (
      ?auto_541198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541197 ?auto_541198 ) ( ON-TABLE ?auto_541189 ) ( ON ?auto_541190 ?auto_541189 ) ( ON ?auto_541191 ?auto_541190 ) ( ON ?auto_541192 ?auto_541191 ) ( ON ?auto_541193 ?auto_541192 ) ( ON ?auto_541194 ?auto_541193 ) ( not ( = ?auto_541189 ?auto_541190 ) ) ( not ( = ?auto_541189 ?auto_541191 ) ) ( not ( = ?auto_541189 ?auto_541192 ) ) ( not ( = ?auto_541189 ?auto_541193 ) ) ( not ( = ?auto_541189 ?auto_541194 ) ) ( not ( = ?auto_541189 ?auto_541195 ) ) ( not ( = ?auto_541189 ?auto_541196 ) ) ( not ( = ?auto_541189 ?auto_541197 ) ) ( not ( = ?auto_541189 ?auto_541198 ) ) ( not ( = ?auto_541190 ?auto_541191 ) ) ( not ( = ?auto_541190 ?auto_541192 ) ) ( not ( = ?auto_541190 ?auto_541193 ) ) ( not ( = ?auto_541190 ?auto_541194 ) ) ( not ( = ?auto_541190 ?auto_541195 ) ) ( not ( = ?auto_541190 ?auto_541196 ) ) ( not ( = ?auto_541190 ?auto_541197 ) ) ( not ( = ?auto_541190 ?auto_541198 ) ) ( not ( = ?auto_541191 ?auto_541192 ) ) ( not ( = ?auto_541191 ?auto_541193 ) ) ( not ( = ?auto_541191 ?auto_541194 ) ) ( not ( = ?auto_541191 ?auto_541195 ) ) ( not ( = ?auto_541191 ?auto_541196 ) ) ( not ( = ?auto_541191 ?auto_541197 ) ) ( not ( = ?auto_541191 ?auto_541198 ) ) ( not ( = ?auto_541192 ?auto_541193 ) ) ( not ( = ?auto_541192 ?auto_541194 ) ) ( not ( = ?auto_541192 ?auto_541195 ) ) ( not ( = ?auto_541192 ?auto_541196 ) ) ( not ( = ?auto_541192 ?auto_541197 ) ) ( not ( = ?auto_541192 ?auto_541198 ) ) ( not ( = ?auto_541193 ?auto_541194 ) ) ( not ( = ?auto_541193 ?auto_541195 ) ) ( not ( = ?auto_541193 ?auto_541196 ) ) ( not ( = ?auto_541193 ?auto_541197 ) ) ( not ( = ?auto_541193 ?auto_541198 ) ) ( not ( = ?auto_541194 ?auto_541195 ) ) ( not ( = ?auto_541194 ?auto_541196 ) ) ( not ( = ?auto_541194 ?auto_541197 ) ) ( not ( = ?auto_541194 ?auto_541198 ) ) ( not ( = ?auto_541195 ?auto_541196 ) ) ( not ( = ?auto_541195 ?auto_541197 ) ) ( not ( = ?auto_541195 ?auto_541198 ) ) ( not ( = ?auto_541196 ?auto_541197 ) ) ( not ( = ?auto_541196 ?auto_541198 ) ) ( not ( = ?auto_541197 ?auto_541198 ) ) ( ON ?auto_541196 ?auto_541197 ) ( CLEAR ?auto_541194 ) ( ON ?auto_541195 ?auto_541196 ) ( CLEAR ?auto_541195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_541189 ?auto_541190 ?auto_541191 ?auto_541192 ?auto_541193 ?auto_541194 ?auto_541195 )
      ( MAKE-9PILE ?auto_541189 ?auto_541190 ?auto_541191 ?auto_541192 ?auto_541193 ?auto_541194 ?auto_541195 ?auto_541196 ?auto_541197 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541227 - BLOCK
      ?auto_541228 - BLOCK
      ?auto_541229 - BLOCK
      ?auto_541230 - BLOCK
      ?auto_541231 - BLOCK
      ?auto_541232 - BLOCK
      ?auto_541233 - BLOCK
      ?auto_541234 - BLOCK
      ?auto_541235 - BLOCK
    )
    :vars
    (
      ?auto_541236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541235 ?auto_541236 ) ( ON-TABLE ?auto_541227 ) ( ON ?auto_541228 ?auto_541227 ) ( ON ?auto_541229 ?auto_541228 ) ( ON ?auto_541230 ?auto_541229 ) ( ON ?auto_541231 ?auto_541230 ) ( not ( = ?auto_541227 ?auto_541228 ) ) ( not ( = ?auto_541227 ?auto_541229 ) ) ( not ( = ?auto_541227 ?auto_541230 ) ) ( not ( = ?auto_541227 ?auto_541231 ) ) ( not ( = ?auto_541227 ?auto_541232 ) ) ( not ( = ?auto_541227 ?auto_541233 ) ) ( not ( = ?auto_541227 ?auto_541234 ) ) ( not ( = ?auto_541227 ?auto_541235 ) ) ( not ( = ?auto_541227 ?auto_541236 ) ) ( not ( = ?auto_541228 ?auto_541229 ) ) ( not ( = ?auto_541228 ?auto_541230 ) ) ( not ( = ?auto_541228 ?auto_541231 ) ) ( not ( = ?auto_541228 ?auto_541232 ) ) ( not ( = ?auto_541228 ?auto_541233 ) ) ( not ( = ?auto_541228 ?auto_541234 ) ) ( not ( = ?auto_541228 ?auto_541235 ) ) ( not ( = ?auto_541228 ?auto_541236 ) ) ( not ( = ?auto_541229 ?auto_541230 ) ) ( not ( = ?auto_541229 ?auto_541231 ) ) ( not ( = ?auto_541229 ?auto_541232 ) ) ( not ( = ?auto_541229 ?auto_541233 ) ) ( not ( = ?auto_541229 ?auto_541234 ) ) ( not ( = ?auto_541229 ?auto_541235 ) ) ( not ( = ?auto_541229 ?auto_541236 ) ) ( not ( = ?auto_541230 ?auto_541231 ) ) ( not ( = ?auto_541230 ?auto_541232 ) ) ( not ( = ?auto_541230 ?auto_541233 ) ) ( not ( = ?auto_541230 ?auto_541234 ) ) ( not ( = ?auto_541230 ?auto_541235 ) ) ( not ( = ?auto_541230 ?auto_541236 ) ) ( not ( = ?auto_541231 ?auto_541232 ) ) ( not ( = ?auto_541231 ?auto_541233 ) ) ( not ( = ?auto_541231 ?auto_541234 ) ) ( not ( = ?auto_541231 ?auto_541235 ) ) ( not ( = ?auto_541231 ?auto_541236 ) ) ( not ( = ?auto_541232 ?auto_541233 ) ) ( not ( = ?auto_541232 ?auto_541234 ) ) ( not ( = ?auto_541232 ?auto_541235 ) ) ( not ( = ?auto_541232 ?auto_541236 ) ) ( not ( = ?auto_541233 ?auto_541234 ) ) ( not ( = ?auto_541233 ?auto_541235 ) ) ( not ( = ?auto_541233 ?auto_541236 ) ) ( not ( = ?auto_541234 ?auto_541235 ) ) ( not ( = ?auto_541234 ?auto_541236 ) ) ( not ( = ?auto_541235 ?auto_541236 ) ) ( ON ?auto_541234 ?auto_541235 ) ( ON ?auto_541233 ?auto_541234 ) ( CLEAR ?auto_541231 ) ( ON ?auto_541232 ?auto_541233 ) ( CLEAR ?auto_541232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_541227 ?auto_541228 ?auto_541229 ?auto_541230 ?auto_541231 ?auto_541232 )
      ( MAKE-9PILE ?auto_541227 ?auto_541228 ?auto_541229 ?auto_541230 ?auto_541231 ?auto_541232 ?auto_541233 ?auto_541234 ?auto_541235 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541265 - BLOCK
      ?auto_541266 - BLOCK
      ?auto_541267 - BLOCK
      ?auto_541268 - BLOCK
      ?auto_541269 - BLOCK
      ?auto_541270 - BLOCK
      ?auto_541271 - BLOCK
      ?auto_541272 - BLOCK
      ?auto_541273 - BLOCK
    )
    :vars
    (
      ?auto_541274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541273 ?auto_541274 ) ( ON-TABLE ?auto_541265 ) ( ON ?auto_541266 ?auto_541265 ) ( ON ?auto_541267 ?auto_541266 ) ( ON ?auto_541268 ?auto_541267 ) ( not ( = ?auto_541265 ?auto_541266 ) ) ( not ( = ?auto_541265 ?auto_541267 ) ) ( not ( = ?auto_541265 ?auto_541268 ) ) ( not ( = ?auto_541265 ?auto_541269 ) ) ( not ( = ?auto_541265 ?auto_541270 ) ) ( not ( = ?auto_541265 ?auto_541271 ) ) ( not ( = ?auto_541265 ?auto_541272 ) ) ( not ( = ?auto_541265 ?auto_541273 ) ) ( not ( = ?auto_541265 ?auto_541274 ) ) ( not ( = ?auto_541266 ?auto_541267 ) ) ( not ( = ?auto_541266 ?auto_541268 ) ) ( not ( = ?auto_541266 ?auto_541269 ) ) ( not ( = ?auto_541266 ?auto_541270 ) ) ( not ( = ?auto_541266 ?auto_541271 ) ) ( not ( = ?auto_541266 ?auto_541272 ) ) ( not ( = ?auto_541266 ?auto_541273 ) ) ( not ( = ?auto_541266 ?auto_541274 ) ) ( not ( = ?auto_541267 ?auto_541268 ) ) ( not ( = ?auto_541267 ?auto_541269 ) ) ( not ( = ?auto_541267 ?auto_541270 ) ) ( not ( = ?auto_541267 ?auto_541271 ) ) ( not ( = ?auto_541267 ?auto_541272 ) ) ( not ( = ?auto_541267 ?auto_541273 ) ) ( not ( = ?auto_541267 ?auto_541274 ) ) ( not ( = ?auto_541268 ?auto_541269 ) ) ( not ( = ?auto_541268 ?auto_541270 ) ) ( not ( = ?auto_541268 ?auto_541271 ) ) ( not ( = ?auto_541268 ?auto_541272 ) ) ( not ( = ?auto_541268 ?auto_541273 ) ) ( not ( = ?auto_541268 ?auto_541274 ) ) ( not ( = ?auto_541269 ?auto_541270 ) ) ( not ( = ?auto_541269 ?auto_541271 ) ) ( not ( = ?auto_541269 ?auto_541272 ) ) ( not ( = ?auto_541269 ?auto_541273 ) ) ( not ( = ?auto_541269 ?auto_541274 ) ) ( not ( = ?auto_541270 ?auto_541271 ) ) ( not ( = ?auto_541270 ?auto_541272 ) ) ( not ( = ?auto_541270 ?auto_541273 ) ) ( not ( = ?auto_541270 ?auto_541274 ) ) ( not ( = ?auto_541271 ?auto_541272 ) ) ( not ( = ?auto_541271 ?auto_541273 ) ) ( not ( = ?auto_541271 ?auto_541274 ) ) ( not ( = ?auto_541272 ?auto_541273 ) ) ( not ( = ?auto_541272 ?auto_541274 ) ) ( not ( = ?auto_541273 ?auto_541274 ) ) ( ON ?auto_541272 ?auto_541273 ) ( ON ?auto_541271 ?auto_541272 ) ( ON ?auto_541270 ?auto_541271 ) ( CLEAR ?auto_541268 ) ( ON ?auto_541269 ?auto_541270 ) ( CLEAR ?auto_541269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_541265 ?auto_541266 ?auto_541267 ?auto_541268 ?auto_541269 )
      ( MAKE-9PILE ?auto_541265 ?auto_541266 ?auto_541267 ?auto_541268 ?auto_541269 ?auto_541270 ?auto_541271 ?auto_541272 ?auto_541273 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541303 - BLOCK
      ?auto_541304 - BLOCK
      ?auto_541305 - BLOCK
      ?auto_541306 - BLOCK
      ?auto_541307 - BLOCK
      ?auto_541308 - BLOCK
      ?auto_541309 - BLOCK
      ?auto_541310 - BLOCK
      ?auto_541311 - BLOCK
    )
    :vars
    (
      ?auto_541312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541311 ?auto_541312 ) ( ON-TABLE ?auto_541303 ) ( ON ?auto_541304 ?auto_541303 ) ( ON ?auto_541305 ?auto_541304 ) ( not ( = ?auto_541303 ?auto_541304 ) ) ( not ( = ?auto_541303 ?auto_541305 ) ) ( not ( = ?auto_541303 ?auto_541306 ) ) ( not ( = ?auto_541303 ?auto_541307 ) ) ( not ( = ?auto_541303 ?auto_541308 ) ) ( not ( = ?auto_541303 ?auto_541309 ) ) ( not ( = ?auto_541303 ?auto_541310 ) ) ( not ( = ?auto_541303 ?auto_541311 ) ) ( not ( = ?auto_541303 ?auto_541312 ) ) ( not ( = ?auto_541304 ?auto_541305 ) ) ( not ( = ?auto_541304 ?auto_541306 ) ) ( not ( = ?auto_541304 ?auto_541307 ) ) ( not ( = ?auto_541304 ?auto_541308 ) ) ( not ( = ?auto_541304 ?auto_541309 ) ) ( not ( = ?auto_541304 ?auto_541310 ) ) ( not ( = ?auto_541304 ?auto_541311 ) ) ( not ( = ?auto_541304 ?auto_541312 ) ) ( not ( = ?auto_541305 ?auto_541306 ) ) ( not ( = ?auto_541305 ?auto_541307 ) ) ( not ( = ?auto_541305 ?auto_541308 ) ) ( not ( = ?auto_541305 ?auto_541309 ) ) ( not ( = ?auto_541305 ?auto_541310 ) ) ( not ( = ?auto_541305 ?auto_541311 ) ) ( not ( = ?auto_541305 ?auto_541312 ) ) ( not ( = ?auto_541306 ?auto_541307 ) ) ( not ( = ?auto_541306 ?auto_541308 ) ) ( not ( = ?auto_541306 ?auto_541309 ) ) ( not ( = ?auto_541306 ?auto_541310 ) ) ( not ( = ?auto_541306 ?auto_541311 ) ) ( not ( = ?auto_541306 ?auto_541312 ) ) ( not ( = ?auto_541307 ?auto_541308 ) ) ( not ( = ?auto_541307 ?auto_541309 ) ) ( not ( = ?auto_541307 ?auto_541310 ) ) ( not ( = ?auto_541307 ?auto_541311 ) ) ( not ( = ?auto_541307 ?auto_541312 ) ) ( not ( = ?auto_541308 ?auto_541309 ) ) ( not ( = ?auto_541308 ?auto_541310 ) ) ( not ( = ?auto_541308 ?auto_541311 ) ) ( not ( = ?auto_541308 ?auto_541312 ) ) ( not ( = ?auto_541309 ?auto_541310 ) ) ( not ( = ?auto_541309 ?auto_541311 ) ) ( not ( = ?auto_541309 ?auto_541312 ) ) ( not ( = ?auto_541310 ?auto_541311 ) ) ( not ( = ?auto_541310 ?auto_541312 ) ) ( not ( = ?auto_541311 ?auto_541312 ) ) ( ON ?auto_541310 ?auto_541311 ) ( ON ?auto_541309 ?auto_541310 ) ( ON ?auto_541308 ?auto_541309 ) ( ON ?auto_541307 ?auto_541308 ) ( CLEAR ?auto_541305 ) ( ON ?auto_541306 ?auto_541307 ) ( CLEAR ?auto_541306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_541303 ?auto_541304 ?auto_541305 ?auto_541306 )
      ( MAKE-9PILE ?auto_541303 ?auto_541304 ?auto_541305 ?auto_541306 ?auto_541307 ?auto_541308 ?auto_541309 ?auto_541310 ?auto_541311 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541341 - BLOCK
      ?auto_541342 - BLOCK
      ?auto_541343 - BLOCK
      ?auto_541344 - BLOCK
      ?auto_541345 - BLOCK
      ?auto_541346 - BLOCK
      ?auto_541347 - BLOCK
      ?auto_541348 - BLOCK
      ?auto_541349 - BLOCK
    )
    :vars
    (
      ?auto_541350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541349 ?auto_541350 ) ( ON-TABLE ?auto_541341 ) ( ON ?auto_541342 ?auto_541341 ) ( not ( = ?auto_541341 ?auto_541342 ) ) ( not ( = ?auto_541341 ?auto_541343 ) ) ( not ( = ?auto_541341 ?auto_541344 ) ) ( not ( = ?auto_541341 ?auto_541345 ) ) ( not ( = ?auto_541341 ?auto_541346 ) ) ( not ( = ?auto_541341 ?auto_541347 ) ) ( not ( = ?auto_541341 ?auto_541348 ) ) ( not ( = ?auto_541341 ?auto_541349 ) ) ( not ( = ?auto_541341 ?auto_541350 ) ) ( not ( = ?auto_541342 ?auto_541343 ) ) ( not ( = ?auto_541342 ?auto_541344 ) ) ( not ( = ?auto_541342 ?auto_541345 ) ) ( not ( = ?auto_541342 ?auto_541346 ) ) ( not ( = ?auto_541342 ?auto_541347 ) ) ( not ( = ?auto_541342 ?auto_541348 ) ) ( not ( = ?auto_541342 ?auto_541349 ) ) ( not ( = ?auto_541342 ?auto_541350 ) ) ( not ( = ?auto_541343 ?auto_541344 ) ) ( not ( = ?auto_541343 ?auto_541345 ) ) ( not ( = ?auto_541343 ?auto_541346 ) ) ( not ( = ?auto_541343 ?auto_541347 ) ) ( not ( = ?auto_541343 ?auto_541348 ) ) ( not ( = ?auto_541343 ?auto_541349 ) ) ( not ( = ?auto_541343 ?auto_541350 ) ) ( not ( = ?auto_541344 ?auto_541345 ) ) ( not ( = ?auto_541344 ?auto_541346 ) ) ( not ( = ?auto_541344 ?auto_541347 ) ) ( not ( = ?auto_541344 ?auto_541348 ) ) ( not ( = ?auto_541344 ?auto_541349 ) ) ( not ( = ?auto_541344 ?auto_541350 ) ) ( not ( = ?auto_541345 ?auto_541346 ) ) ( not ( = ?auto_541345 ?auto_541347 ) ) ( not ( = ?auto_541345 ?auto_541348 ) ) ( not ( = ?auto_541345 ?auto_541349 ) ) ( not ( = ?auto_541345 ?auto_541350 ) ) ( not ( = ?auto_541346 ?auto_541347 ) ) ( not ( = ?auto_541346 ?auto_541348 ) ) ( not ( = ?auto_541346 ?auto_541349 ) ) ( not ( = ?auto_541346 ?auto_541350 ) ) ( not ( = ?auto_541347 ?auto_541348 ) ) ( not ( = ?auto_541347 ?auto_541349 ) ) ( not ( = ?auto_541347 ?auto_541350 ) ) ( not ( = ?auto_541348 ?auto_541349 ) ) ( not ( = ?auto_541348 ?auto_541350 ) ) ( not ( = ?auto_541349 ?auto_541350 ) ) ( ON ?auto_541348 ?auto_541349 ) ( ON ?auto_541347 ?auto_541348 ) ( ON ?auto_541346 ?auto_541347 ) ( ON ?auto_541345 ?auto_541346 ) ( ON ?auto_541344 ?auto_541345 ) ( CLEAR ?auto_541342 ) ( ON ?auto_541343 ?auto_541344 ) ( CLEAR ?auto_541343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_541341 ?auto_541342 ?auto_541343 )
      ( MAKE-9PILE ?auto_541341 ?auto_541342 ?auto_541343 ?auto_541344 ?auto_541345 ?auto_541346 ?auto_541347 ?auto_541348 ?auto_541349 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541379 - BLOCK
      ?auto_541380 - BLOCK
      ?auto_541381 - BLOCK
      ?auto_541382 - BLOCK
      ?auto_541383 - BLOCK
      ?auto_541384 - BLOCK
      ?auto_541385 - BLOCK
      ?auto_541386 - BLOCK
      ?auto_541387 - BLOCK
    )
    :vars
    (
      ?auto_541388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541387 ?auto_541388 ) ( ON-TABLE ?auto_541379 ) ( not ( = ?auto_541379 ?auto_541380 ) ) ( not ( = ?auto_541379 ?auto_541381 ) ) ( not ( = ?auto_541379 ?auto_541382 ) ) ( not ( = ?auto_541379 ?auto_541383 ) ) ( not ( = ?auto_541379 ?auto_541384 ) ) ( not ( = ?auto_541379 ?auto_541385 ) ) ( not ( = ?auto_541379 ?auto_541386 ) ) ( not ( = ?auto_541379 ?auto_541387 ) ) ( not ( = ?auto_541379 ?auto_541388 ) ) ( not ( = ?auto_541380 ?auto_541381 ) ) ( not ( = ?auto_541380 ?auto_541382 ) ) ( not ( = ?auto_541380 ?auto_541383 ) ) ( not ( = ?auto_541380 ?auto_541384 ) ) ( not ( = ?auto_541380 ?auto_541385 ) ) ( not ( = ?auto_541380 ?auto_541386 ) ) ( not ( = ?auto_541380 ?auto_541387 ) ) ( not ( = ?auto_541380 ?auto_541388 ) ) ( not ( = ?auto_541381 ?auto_541382 ) ) ( not ( = ?auto_541381 ?auto_541383 ) ) ( not ( = ?auto_541381 ?auto_541384 ) ) ( not ( = ?auto_541381 ?auto_541385 ) ) ( not ( = ?auto_541381 ?auto_541386 ) ) ( not ( = ?auto_541381 ?auto_541387 ) ) ( not ( = ?auto_541381 ?auto_541388 ) ) ( not ( = ?auto_541382 ?auto_541383 ) ) ( not ( = ?auto_541382 ?auto_541384 ) ) ( not ( = ?auto_541382 ?auto_541385 ) ) ( not ( = ?auto_541382 ?auto_541386 ) ) ( not ( = ?auto_541382 ?auto_541387 ) ) ( not ( = ?auto_541382 ?auto_541388 ) ) ( not ( = ?auto_541383 ?auto_541384 ) ) ( not ( = ?auto_541383 ?auto_541385 ) ) ( not ( = ?auto_541383 ?auto_541386 ) ) ( not ( = ?auto_541383 ?auto_541387 ) ) ( not ( = ?auto_541383 ?auto_541388 ) ) ( not ( = ?auto_541384 ?auto_541385 ) ) ( not ( = ?auto_541384 ?auto_541386 ) ) ( not ( = ?auto_541384 ?auto_541387 ) ) ( not ( = ?auto_541384 ?auto_541388 ) ) ( not ( = ?auto_541385 ?auto_541386 ) ) ( not ( = ?auto_541385 ?auto_541387 ) ) ( not ( = ?auto_541385 ?auto_541388 ) ) ( not ( = ?auto_541386 ?auto_541387 ) ) ( not ( = ?auto_541386 ?auto_541388 ) ) ( not ( = ?auto_541387 ?auto_541388 ) ) ( ON ?auto_541386 ?auto_541387 ) ( ON ?auto_541385 ?auto_541386 ) ( ON ?auto_541384 ?auto_541385 ) ( ON ?auto_541383 ?auto_541384 ) ( ON ?auto_541382 ?auto_541383 ) ( ON ?auto_541381 ?auto_541382 ) ( CLEAR ?auto_541379 ) ( ON ?auto_541380 ?auto_541381 ) ( CLEAR ?auto_541380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_541379 ?auto_541380 )
      ( MAKE-9PILE ?auto_541379 ?auto_541380 ?auto_541381 ?auto_541382 ?auto_541383 ?auto_541384 ?auto_541385 ?auto_541386 ?auto_541387 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_541417 - BLOCK
      ?auto_541418 - BLOCK
      ?auto_541419 - BLOCK
      ?auto_541420 - BLOCK
      ?auto_541421 - BLOCK
      ?auto_541422 - BLOCK
      ?auto_541423 - BLOCK
      ?auto_541424 - BLOCK
      ?auto_541425 - BLOCK
    )
    :vars
    (
      ?auto_541426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541425 ?auto_541426 ) ( not ( = ?auto_541417 ?auto_541418 ) ) ( not ( = ?auto_541417 ?auto_541419 ) ) ( not ( = ?auto_541417 ?auto_541420 ) ) ( not ( = ?auto_541417 ?auto_541421 ) ) ( not ( = ?auto_541417 ?auto_541422 ) ) ( not ( = ?auto_541417 ?auto_541423 ) ) ( not ( = ?auto_541417 ?auto_541424 ) ) ( not ( = ?auto_541417 ?auto_541425 ) ) ( not ( = ?auto_541417 ?auto_541426 ) ) ( not ( = ?auto_541418 ?auto_541419 ) ) ( not ( = ?auto_541418 ?auto_541420 ) ) ( not ( = ?auto_541418 ?auto_541421 ) ) ( not ( = ?auto_541418 ?auto_541422 ) ) ( not ( = ?auto_541418 ?auto_541423 ) ) ( not ( = ?auto_541418 ?auto_541424 ) ) ( not ( = ?auto_541418 ?auto_541425 ) ) ( not ( = ?auto_541418 ?auto_541426 ) ) ( not ( = ?auto_541419 ?auto_541420 ) ) ( not ( = ?auto_541419 ?auto_541421 ) ) ( not ( = ?auto_541419 ?auto_541422 ) ) ( not ( = ?auto_541419 ?auto_541423 ) ) ( not ( = ?auto_541419 ?auto_541424 ) ) ( not ( = ?auto_541419 ?auto_541425 ) ) ( not ( = ?auto_541419 ?auto_541426 ) ) ( not ( = ?auto_541420 ?auto_541421 ) ) ( not ( = ?auto_541420 ?auto_541422 ) ) ( not ( = ?auto_541420 ?auto_541423 ) ) ( not ( = ?auto_541420 ?auto_541424 ) ) ( not ( = ?auto_541420 ?auto_541425 ) ) ( not ( = ?auto_541420 ?auto_541426 ) ) ( not ( = ?auto_541421 ?auto_541422 ) ) ( not ( = ?auto_541421 ?auto_541423 ) ) ( not ( = ?auto_541421 ?auto_541424 ) ) ( not ( = ?auto_541421 ?auto_541425 ) ) ( not ( = ?auto_541421 ?auto_541426 ) ) ( not ( = ?auto_541422 ?auto_541423 ) ) ( not ( = ?auto_541422 ?auto_541424 ) ) ( not ( = ?auto_541422 ?auto_541425 ) ) ( not ( = ?auto_541422 ?auto_541426 ) ) ( not ( = ?auto_541423 ?auto_541424 ) ) ( not ( = ?auto_541423 ?auto_541425 ) ) ( not ( = ?auto_541423 ?auto_541426 ) ) ( not ( = ?auto_541424 ?auto_541425 ) ) ( not ( = ?auto_541424 ?auto_541426 ) ) ( not ( = ?auto_541425 ?auto_541426 ) ) ( ON ?auto_541424 ?auto_541425 ) ( ON ?auto_541423 ?auto_541424 ) ( ON ?auto_541422 ?auto_541423 ) ( ON ?auto_541421 ?auto_541422 ) ( ON ?auto_541420 ?auto_541421 ) ( ON ?auto_541419 ?auto_541420 ) ( ON ?auto_541418 ?auto_541419 ) ( ON ?auto_541417 ?auto_541418 ) ( CLEAR ?auto_541417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_541417 )
      ( MAKE-9PILE ?auto_541417 ?auto_541418 ?auto_541419 ?auto_541420 ?auto_541421 ?auto_541422 ?auto_541423 ?auto_541424 ?auto_541425 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541456 - BLOCK
      ?auto_541457 - BLOCK
      ?auto_541458 - BLOCK
      ?auto_541459 - BLOCK
      ?auto_541460 - BLOCK
      ?auto_541461 - BLOCK
      ?auto_541462 - BLOCK
      ?auto_541463 - BLOCK
      ?auto_541464 - BLOCK
      ?auto_541465 - BLOCK
    )
    :vars
    (
      ?auto_541466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_541464 ) ( ON ?auto_541465 ?auto_541466 ) ( CLEAR ?auto_541465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_541456 ) ( ON ?auto_541457 ?auto_541456 ) ( ON ?auto_541458 ?auto_541457 ) ( ON ?auto_541459 ?auto_541458 ) ( ON ?auto_541460 ?auto_541459 ) ( ON ?auto_541461 ?auto_541460 ) ( ON ?auto_541462 ?auto_541461 ) ( ON ?auto_541463 ?auto_541462 ) ( ON ?auto_541464 ?auto_541463 ) ( not ( = ?auto_541456 ?auto_541457 ) ) ( not ( = ?auto_541456 ?auto_541458 ) ) ( not ( = ?auto_541456 ?auto_541459 ) ) ( not ( = ?auto_541456 ?auto_541460 ) ) ( not ( = ?auto_541456 ?auto_541461 ) ) ( not ( = ?auto_541456 ?auto_541462 ) ) ( not ( = ?auto_541456 ?auto_541463 ) ) ( not ( = ?auto_541456 ?auto_541464 ) ) ( not ( = ?auto_541456 ?auto_541465 ) ) ( not ( = ?auto_541456 ?auto_541466 ) ) ( not ( = ?auto_541457 ?auto_541458 ) ) ( not ( = ?auto_541457 ?auto_541459 ) ) ( not ( = ?auto_541457 ?auto_541460 ) ) ( not ( = ?auto_541457 ?auto_541461 ) ) ( not ( = ?auto_541457 ?auto_541462 ) ) ( not ( = ?auto_541457 ?auto_541463 ) ) ( not ( = ?auto_541457 ?auto_541464 ) ) ( not ( = ?auto_541457 ?auto_541465 ) ) ( not ( = ?auto_541457 ?auto_541466 ) ) ( not ( = ?auto_541458 ?auto_541459 ) ) ( not ( = ?auto_541458 ?auto_541460 ) ) ( not ( = ?auto_541458 ?auto_541461 ) ) ( not ( = ?auto_541458 ?auto_541462 ) ) ( not ( = ?auto_541458 ?auto_541463 ) ) ( not ( = ?auto_541458 ?auto_541464 ) ) ( not ( = ?auto_541458 ?auto_541465 ) ) ( not ( = ?auto_541458 ?auto_541466 ) ) ( not ( = ?auto_541459 ?auto_541460 ) ) ( not ( = ?auto_541459 ?auto_541461 ) ) ( not ( = ?auto_541459 ?auto_541462 ) ) ( not ( = ?auto_541459 ?auto_541463 ) ) ( not ( = ?auto_541459 ?auto_541464 ) ) ( not ( = ?auto_541459 ?auto_541465 ) ) ( not ( = ?auto_541459 ?auto_541466 ) ) ( not ( = ?auto_541460 ?auto_541461 ) ) ( not ( = ?auto_541460 ?auto_541462 ) ) ( not ( = ?auto_541460 ?auto_541463 ) ) ( not ( = ?auto_541460 ?auto_541464 ) ) ( not ( = ?auto_541460 ?auto_541465 ) ) ( not ( = ?auto_541460 ?auto_541466 ) ) ( not ( = ?auto_541461 ?auto_541462 ) ) ( not ( = ?auto_541461 ?auto_541463 ) ) ( not ( = ?auto_541461 ?auto_541464 ) ) ( not ( = ?auto_541461 ?auto_541465 ) ) ( not ( = ?auto_541461 ?auto_541466 ) ) ( not ( = ?auto_541462 ?auto_541463 ) ) ( not ( = ?auto_541462 ?auto_541464 ) ) ( not ( = ?auto_541462 ?auto_541465 ) ) ( not ( = ?auto_541462 ?auto_541466 ) ) ( not ( = ?auto_541463 ?auto_541464 ) ) ( not ( = ?auto_541463 ?auto_541465 ) ) ( not ( = ?auto_541463 ?auto_541466 ) ) ( not ( = ?auto_541464 ?auto_541465 ) ) ( not ( = ?auto_541464 ?auto_541466 ) ) ( not ( = ?auto_541465 ?auto_541466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_541465 ?auto_541466 )
      ( !STACK ?auto_541465 ?auto_541464 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541498 - BLOCK
      ?auto_541499 - BLOCK
      ?auto_541500 - BLOCK
      ?auto_541501 - BLOCK
      ?auto_541502 - BLOCK
      ?auto_541503 - BLOCK
      ?auto_541504 - BLOCK
      ?auto_541505 - BLOCK
      ?auto_541506 - BLOCK
      ?auto_541507 - BLOCK
    )
    :vars
    (
      ?auto_541508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541507 ?auto_541508 ) ( ON-TABLE ?auto_541498 ) ( ON ?auto_541499 ?auto_541498 ) ( ON ?auto_541500 ?auto_541499 ) ( ON ?auto_541501 ?auto_541500 ) ( ON ?auto_541502 ?auto_541501 ) ( ON ?auto_541503 ?auto_541502 ) ( ON ?auto_541504 ?auto_541503 ) ( ON ?auto_541505 ?auto_541504 ) ( not ( = ?auto_541498 ?auto_541499 ) ) ( not ( = ?auto_541498 ?auto_541500 ) ) ( not ( = ?auto_541498 ?auto_541501 ) ) ( not ( = ?auto_541498 ?auto_541502 ) ) ( not ( = ?auto_541498 ?auto_541503 ) ) ( not ( = ?auto_541498 ?auto_541504 ) ) ( not ( = ?auto_541498 ?auto_541505 ) ) ( not ( = ?auto_541498 ?auto_541506 ) ) ( not ( = ?auto_541498 ?auto_541507 ) ) ( not ( = ?auto_541498 ?auto_541508 ) ) ( not ( = ?auto_541499 ?auto_541500 ) ) ( not ( = ?auto_541499 ?auto_541501 ) ) ( not ( = ?auto_541499 ?auto_541502 ) ) ( not ( = ?auto_541499 ?auto_541503 ) ) ( not ( = ?auto_541499 ?auto_541504 ) ) ( not ( = ?auto_541499 ?auto_541505 ) ) ( not ( = ?auto_541499 ?auto_541506 ) ) ( not ( = ?auto_541499 ?auto_541507 ) ) ( not ( = ?auto_541499 ?auto_541508 ) ) ( not ( = ?auto_541500 ?auto_541501 ) ) ( not ( = ?auto_541500 ?auto_541502 ) ) ( not ( = ?auto_541500 ?auto_541503 ) ) ( not ( = ?auto_541500 ?auto_541504 ) ) ( not ( = ?auto_541500 ?auto_541505 ) ) ( not ( = ?auto_541500 ?auto_541506 ) ) ( not ( = ?auto_541500 ?auto_541507 ) ) ( not ( = ?auto_541500 ?auto_541508 ) ) ( not ( = ?auto_541501 ?auto_541502 ) ) ( not ( = ?auto_541501 ?auto_541503 ) ) ( not ( = ?auto_541501 ?auto_541504 ) ) ( not ( = ?auto_541501 ?auto_541505 ) ) ( not ( = ?auto_541501 ?auto_541506 ) ) ( not ( = ?auto_541501 ?auto_541507 ) ) ( not ( = ?auto_541501 ?auto_541508 ) ) ( not ( = ?auto_541502 ?auto_541503 ) ) ( not ( = ?auto_541502 ?auto_541504 ) ) ( not ( = ?auto_541502 ?auto_541505 ) ) ( not ( = ?auto_541502 ?auto_541506 ) ) ( not ( = ?auto_541502 ?auto_541507 ) ) ( not ( = ?auto_541502 ?auto_541508 ) ) ( not ( = ?auto_541503 ?auto_541504 ) ) ( not ( = ?auto_541503 ?auto_541505 ) ) ( not ( = ?auto_541503 ?auto_541506 ) ) ( not ( = ?auto_541503 ?auto_541507 ) ) ( not ( = ?auto_541503 ?auto_541508 ) ) ( not ( = ?auto_541504 ?auto_541505 ) ) ( not ( = ?auto_541504 ?auto_541506 ) ) ( not ( = ?auto_541504 ?auto_541507 ) ) ( not ( = ?auto_541504 ?auto_541508 ) ) ( not ( = ?auto_541505 ?auto_541506 ) ) ( not ( = ?auto_541505 ?auto_541507 ) ) ( not ( = ?auto_541505 ?auto_541508 ) ) ( not ( = ?auto_541506 ?auto_541507 ) ) ( not ( = ?auto_541506 ?auto_541508 ) ) ( not ( = ?auto_541507 ?auto_541508 ) ) ( CLEAR ?auto_541505 ) ( ON ?auto_541506 ?auto_541507 ) ( CLEAR ?auto_541506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_541498 ?auto_541499 ?auto_541500 ?auto_541501 ?auto_541502 ?auto_541503 ?auto_541504 ?auto_541505 ?auto_541506 )
      ( MAKE-10PILE ?auto_541498 ?auto_541499 ?auto_541500 ?auto_541501 ?auto_541502 ?auto_541503 ?auto_541504 ?auto_541505 ?auto_541506 ?auto_541507 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541540 - BLOCK
      ?auto_541541 - BLOCK
      ?auto_541542 - BLOCK
      ?auto_541543 - BLOCK
      ?auto_541544 - BLOCK
      ?auto_541545 - BLOCK
      ?auto_541546 - BLOCK
      ?auto_541547 - BLOCK
      ?auto_541548 - BLOCK
      ?auto_541549 - BLOCK
    )
    :vars
    (
      ?auto_541550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541549 ?auto_541550 ) ( ON-TABLE ?auto_541540 ) ( ON ?auto_541541 ?auto_541540 ) ( ON ?auto_541542 ?auto_541541 ) ( ON ?auto_541543 ?auto_541542 ) ( ON ?auto_541544 ?auto_541543 ) ( ON ?auto_541545 ?auto_541544 ) ( ON ?auto_541546 ?auto_541545 ) ( not ( = ?auto_541540 ?auto_541541 ) ) ( not ( = ?auto_541540 ?auto_541542 ) ) ( not ( = ?auto_541540 ?auto_541543 ) ) ( not ( = ?auto_541540 ?auto_541544 ) ) ( not ( = ?auto_541540 ?auto_541545 ) ) ( not ( = ?auto_541540 ?auto_541546 ) ) ( not ( = ?auto_541540 ?auto_541547 ) ) ( not ( = ?auto_541540 ?auto_541548 ) ) ( not ( = ?auto_541540 ?auto_541549 ) ) ( not ( = ?auto_541540 ?auto_541550 ) ) ( not ( = ?auto_541541 ?auto_541542 ) ) ( not ( = ?auto_541541 ?auto_541543 ) ) ( not ( = ?auto_541541 ?auto_541544 ) ) ( not ( = ?auto_541541 ?auto_541545 ) ) ( not ( = ?auto_541541 ?auto_541546 ) ) ( not ( = ?auto_541541 ?auto_541547 ) ) ( not ( = ?auto_541541 ?auto_541548 ) ) ( not ( = ?auto_541541 ?auto_541549 ) ) ( not ( = ?auto_541541 ?auto_541550 ) ) ( not ( = ?auto_541542 ?auto_541543 ) ) ( not ( = ?auto_541542 ?auto_541544 ) ) ( not ( = ?auto_541542 ?auto_541545 ) ) ( not ( = ?auto_541542 ?auto_541546 ) ) ( not ( = ?auto_541542 ?auto_541547 ) ) ( not ( = ?auto_541542 ?auto_541548 ) ) ( not ( = ?auto_541542 ?auto_541549 ) ) ( not ( = ?auto_541542 ?auto_541550 ) ) ( not ( = ?auto_541543 ?auto_541544 ) ) ( not ( = ?auto_541543 ?auto_541545 ) ) ( not ( = ?auto_541543 ?auto_541546 ) ) ( not ( = ?auto_541543 ?auto_541547 ) ) ( not ( = ?auto_541543 ?auto_541548 ) ) ( not ( = ?auto_541543 ?auto_541549 ) ) ( not ( = ?auto_541543 ?auto_541550 ) ) ( not ( = ?auto_541544 ?auto_541545 ) ) ( not ( = ?auto_541544 ?auto_541546 ) ) ( not ( = ?auto_541544 ?auto_541547 ) ) ( not ( = ?auto_541544 ?auto_541548 ) ) ( not ( = ?auto_541544 ?auto_541549 ) ) ( not ( = ?auto_541544 ?auto_541550 ) ) ( not ( = ?auto_541545 ?auto_541546 ) ) ( not ( = ?auto_541545 ?auto_541547 ) ) ( not ( = ?auto_541545 ?auto_541548 ) ) ( not ( = ?auto_541545 ?auto_541549 ) ) ( not ( = ?auto_541545 ?auto_541550 ) ) ( not ( = ?auto_541546 ?auto_541547 ) ) ( not ( = ?auto_541546 ?auto_541548 ) ) ( not ( = ?auto_541546 ?auto_541549 ) ) ( not ( = ?auto_541546 ?auto_541550 ) ) ( not ( = ?auto_541547 ?auto_541548 ) ) ( not ( = ?auto_541547 ?auto_541549 ) ) ( not ( = ?auto_541547 ?auto_541550 ) ) ( not ( = ?auto_541548 ?auto_541549 ) ) ( not ( = ?auto_541548 ?auto_541550 ) ) ( not ( = ?auto_541549 ?auto_541550 ) ) ( ON ?auto_541548 ?auto_541549 ) ( CLEAR ?auto_541546 ) ( ON ?auto_541547 ?auto_541548 ) ( CLEAR ?auto_541547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_541540 ?auto_541541 ?auto_541542 ?auto_541543 ?auto_541544 ?auto_541545 ?auto_541546 ?auto_541547 )
      ( MAKE-10PILE ?auto_541540 ?auto_541541 ?auto_541542 ?auto_541543 ?auto_541544 ?auto_541545 ?auto_541546 ?auto_541547 ?auto_541548 ?auto_541549 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541582 - BLOCK
      ?auto_541583 - BLOCK
      ?auto_541584 - BLOCK
      ?auto_541585 - BLOCK
      ?auto_541586 - BLOCK
      ?auto_541587 - BLOCK
      ?auto_541588 - BLOCK
      ?auto_541589 - BLOCK
      ?auto_541590 - BLOCK
      ?auto_541591 - BLOCK
    )
    :vars
    (
      ?auto_541592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541591 ?auto_541592 ) ( ON-TABLE ?auto_541582 ) ( ON ?auto_541583 ?auto_541582 ) ( ON ?auto_541584 ?auto_541583 ) ( ON ?auto_541585 ?auto_541584 ) ( ON ?auto_541586 ?auto_541585 ) ( ON ?auto_541587 ?auto_541586 ) ( not ( = ?auto_541582 ?auto_541583 ) ) ( not ( = ?auto_541582 ?auto_541584 ) ) ( not ( = ?auto_541582 ?auto_541585 ) ) ( not ( = ?auto_541582 ?auto_541586 ) ) ( not ( = ?auto_541582 ?auto_541587 ) ) ( not ( = ?auto_541582 ?auto_541588 ) ) ( not ( = ?auto_541582 ?auto_541589 ) ) ( not ( = ?auto_541582 ?auto_541590 ) ) ( not ( = ?auto_541582 ?auto_541591 ) ) ( not ( = ?auto_541582 ?auto_541592 ) ) ( not ( = ?auto_541583 ?auto_541584 ) ) ( not ( = ?auto_541583 ?auto_541585 ) ) ( not ( = ?auto_541583 ?auto_541586 ) ) ( not ( = ?auto_541583 ?auto_541587 ) ) ( not ( = ?auto_541583 ?auto_541588 ) ) ( not ( = ?auto_541583 ?auto_541589 ) ) ( not ( = ?auto_541583 ?auto_541590 ) ) ( not ( = ?auto_541583 ?auto_541591 ) ) ( not ( = ?auto_541583 ?auto_541592 ) ) ( not ( = ?auto_541584 ?auto_541585 ) ) ( not ( = ?auto_541584 ?auto_541586 ) ) ( not ( = ?auto_541584 ?auto_541587 ) ) ( not ( = ?auto_541584 ?auto_541588 ) ) ( not ( = ?auto_541584 ?auto_541589 ) ) ( not ( = ?auto_541584 ?auto_541590 ) ) ( not ( = ?auto_541584 ?auto_541591 ) ) ( not ( = ?auto_541584 ?auto_541592 ) ) ( not ( = ?auto_541585 ?auto_541586 ) ) ( not ( = ?auto_541585 ?auto_541587 ) ) ( not ( = ?auto_541585 ?auto_541588 ) ) ( not ( = ?auto_541585 ?auto_541589 ) ) ( not ( = ?auto_541585 ?auto_541590 ) ) ( not ( = ?auto_541585 ?auto_541591 ) ) ( not ( = ?auto_541585 ?auto_541592 ) ) ( not ( = ?auto_541586 ?auto_541587 ) ) ( not ( = ?auto_541586 ?auto_541588 ) ) ( not ( = ?auto_541586 ?auto_541589 ) ) ( not ( = ?auto_541586 ?auto_541590 ) ) ( not ( = ?auto_541586 ?auto_541591 ) ) ( not ( = ?auto_541586 ?auto_541592 ) ) ( not ( = ?auto_541587 ?auto_541588 ) ) ( not ( = ?auto_541587 ?auto_541589 ) ) ( not ( = ?auto_541587 ?auto_541590 ) ) ( not ( = ?auto_541587 ?auto_541591 ) ) ( not ( = ?auto_541587 ?auto_541592 ) ) ( not ( = ?auto_541588 ?auto_541589 ) ) ( not ( = ?auto_541588 ?auto_541590 ) ) ( not ( = ?auto_541588 ?auto_541591 ) ) ( not ( = ?auto_541588 ?auto_541592 ) ) ( not ( = ?auto_541589 ?auto_541590 ) ) ( not ( = ?auto_541589 ?auto_541591 ) ) ( not ( = ?auto_541589 ?auto_541592 ) ) ( not ( = ?auto_541590 ?auto_541591 ) ) ( not ( = ?auto_541590 ?auto_541592 ) ) ( not ( = ?auto_541591 ?auto_541592 ) ) ( ON ?auto_541590 ?auto_541591 ) ( ON ?auto_541589 ?auto_541590 ) ( CLEAR ?auto_541587 ) ( ON ?auto_541588 ?auto_541589 ) ( CLEAR ?auto_541588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_541582 ?auto_541583 ?auto_541584 ?auto_541585 ?auto_541586 ?auto_541587 ?auto_541588 )
      ( MAKE-10PILE ?auto_541582 ?auto_541583 ?auto_541584 ?auto_541585 ?auto_541586 ?auto_541587 ?auto_541588 ?auto_541589 ?auto_541590 ?auto_541591 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541624 - BLOCK
      ?auto_541625 - BLOCK
      ?auto_541626 - BLOCK
      ?auto_541627 - BLOCK
      ?auto_541628 - BLOCK
      ?auto_541629 - BLOCK
      ?auto_541630 - BLOCK
      ?auto_541631 - BLOCK
      ?auto_541632 - BLOCK
      ?auto_541633 - BLOCK
    )
    :vars
    (
      ?auto_541634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541633 ?auto_541634 ) ( ON-TABLE ?auto_541624 ) ( ON ?auto_541625 ?auto_541624 ) ( ON ?auto_541626 ?auto_541625 ) ( ON ?auto_541627 ?auto_541626 ) ( ON ?auto_541628 ?auto_541627 ) ( not ( = ?auto_541624 ?auto_541625 ) ) ( not ( = ?auto_541624 ?auto_541626 ) ) ( not ( = ?auto_541624 ?auto_541627 ) ) ( not ( = ?auto_541624 ?auto_541628 ) ) ( not ( = ?auto_541624 ?auto_541629 ) ) ( not ( = ?auto_541624 ?auto_541630 ) ) ( not ( = ?auto_541624 ?auto_541631 ) ) ( not ( = ?auto_541624 ?auto_541632 ) ) ( not ( = ?auto_541624 ?auto_541633 ) ) ( not ( = ?auto_541624 ?auto_541634 ) ) ( not ( = ?auto_541625 ?auto_541626 ) ) ( not ( = ?auto_541625 ?auto_541627 ) ) ( not ( = ?auto_541625 ?auto_541628 ) ) ( not ( = ?auto_541625 ?auto_541629 ) ) ( not ( = ?auto_541625 ?auto_541630 ) ) ( not ( = ?auto_541625 ?auto_541631 ) ) ( not ( = ?auto_541625 ?auto_541632 ) ) ( not ( = ?auto_541625 ?auto_541633 ) ) ( not ( = ?auto_541625 ?auto_541634 ) ) ( not ( = ?auto_541626 ?auto_541627 ) ) ( not ( = ?auto_541626 ?auto_541628 ) ) ( not ( = ?auto_541626 ?auto_541629 ) ) ( not ( = ?auto_541626 ?auto_541630 ) ) ( not ( = ?auto_541626 ?auto_541631 ) ) ( not ( = ?auto_541626 ?auto_541632 ) ) ( not ( = ?auto_541626 ?auto_541633 ) ) ( not ( = ?auto_541626 ?auto_541634 ) ) ( not ( = ?auto_541627 ?auto_541628 ) ) ( not ( = ?auto_541627 ?auto_541629 ) ) ( not ( = ?auto_541627 ?auto_541630 ) ) ( not ( = ?auto_541627 ?auto_541631 ) ) ( not ( = ?auto_541627 ?auto_541632 ) ) ( not ( = ?auto_541627 ?auto_541633 ) ) ( not ( = ?auto_541627 ?auto_541634 ) ) ( not ( = ?auto_541628 ?auto_541629 ) ) ( not ( = ?auto_541628 ?auto_541630 ) ) ( not ( = ?auto_541628 ?auto_541631 ) ) ( not ( = ?auto_541628 ?auto_541632 ) ) ( not ( = ?auto_541628 ?auto_541633 ) ) ( not ( = ?auto_541628 ?auto_541634 ) ) ( not ( = ?auto_541629 ?auto_541630 ) ) ( not ( = ?auto_541629 ?auto_541631 ) ) ( not ( = ?auto_541629 ?auto_541632 ) ) ( not ( = ?auto_541629 ?auto_541633 ) ) ( not ( = ?auto_541629 ?auto_541634 ) ) ( not ( = ?auto_541630 ?auto_541631 ) ) ( not ( = ?auto_541630 ?auto_541632 ) ) ( not ( = ?auto_541630 ?auto_541633 ) ) ( not ( = ?auto_541630 ?auto_541634 ) ) ( not ( = ?auto_541631 ?auto_541632 ) ) ( not ( = ?auto_541631 ?auto_541633 ) ) ( not ( = ?auto_541631 ?auto_541634 ) ) ( not ( = ?auto_541632 ?auto_541633 ) ) ( not ( = ?auto_541632 ?auto_541634 ) ) ( not ( = ?auto_541633 ?auto_541634 ) ) ( ON ?auto_541632 ?auto_541633 ) ( ON ?auto_541631 ?auto_541632 ) ( ON ?auto_541630 ?auto_541631 ) ( CLEAR ?auto_541628 ) ( ON ?auto_541629 ?auto_541630 ) ( CLEAR ?auto_541629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_541624 ?auto_541625 ?auto_541626 ?auto_541627 ?auto_541628 ?auto_541629 )
      ( MAKE-10PILE ?auto_541624 ?auto_541625 ?auto_541626 ?auto_541627 ?auto_541628 ?auto_541629 ?auto_541630 ?auto_541631 ?auto_541632 ?auto_541633 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541666 - BLOCK
      ?auto_541667 - BLOCK
      ?auto_541668 - BLOCK
      ?auto_541669 - BLOCK
      ?auto_541670 - BLOCK
      ?auto_541671 - BLOCK
      ?auto_541672 - BLOCK
      ?auto_541673 - BLOCK
      ?auto_541674 - BLOCK
      ?auto_541675 - BLOCK
    )
    :vars
    (
      ?auto_541676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541675 ?auto_541676 ) ( ON-TABLE ?auto_541666 ) ( ON ?auto_541667 ?auto_541666 ) ( ON ?auto_541668 ?auto_541667 ) ( ON ?auto_541669 ?auto_541668 ) ( not ( = ?auto_541666 ?auto_541667 ) ) ( not ( = ?auto_541666 ?auto_541668 ) ) ( not ( = ?auto_541666 ?auto_541669 ) ) ( not ( = ?auto_541666 ?auto_541670 ) ) ( not ( = ?auto_541666 ?auto_541671 ) ) ( not ( = ?auto_541666 ?auto_541672 ) ) ( not ( = ?auto_541666 ?auto_541673 ) ) ( not ( = ?auto_541666 ?auto_541674 ) ) ( not ( = ?auto_541666 ?auto_541675 ) ) ( not ( = ?auto_541666 ?auto_541676 ) ) ( not ( = ?auto_541667 ?auto_541668 ) ) ( not ( = ?auto_541667 ?auto_541669 ) ) ( not ( = ?auto_541667 ?auto_541670 ) ) ( not ( = ?auto_541667 ?auto_541671 ) ) ( not ( = ?auto_541667 ?auto_541672 ) ) ( not ( = ?auto_541667 ?auto_541673 ) ) ( not ( = ?auto_541667 ?auto_541674 ) ) ( not ( = ?auto_541667 ?auto_541675 ) ) ( not ( = ?auto_541667 ?auto_541676 ) ) ( not ( = ?auto_541668 ?auto_541669 ) ) ( not ( = ?auto_541668 ?auto_541670 ) ) ( not ( = ?auto_541668 ?auto_541671 ) ) ( not ( = ?auto_541668 ?auto_541672 ) ) ( not ( = ?auto_541668 ?auto_541673 ) ) ( not ( = ?auto_541668 ?auto_541674 ) ) ( not ( = ?auto_541668 ?auto_541675 ) ) ( not ( = ?auto_541668 ?auto_541676 ) ) ( not ( = ?auto_541669 ?auto_541670 ) ) ( not ( = ?auto_541669 ?auto_541671 ) ) ( not ( = ?auto_541669 ?auto_541672 ) ) ( not ( = ?auto_541669 ?auto_541673 ) ) ( not ( = ?auto_541669 ?auto_541674 ) ) ( not ( = ?auto_541669 ?auto_541675 ) ) ( not ( = ?auto_541669 ?auto_541676 ) ) ( not ( = ?auto_541670 ?auto_541671 ) ) ( not ( = ?auto_541670 ?auto_541672 ) ) ( not ( = ?auto_541670 ?auto_541673 ) ) ( not ( = ?auto_541670 ?auto_541674 ) ) ( not ( = ?auto_541670 ?auto_541675 ) ) ( not ( = ?auto_541670 ?auto_541676 ) ) ( not ( = ?auto_541671 ?auto_541672 ) ) ( not ( = ?auto_541671 ?auto_541673 ) ) ( not ( = ?auto_541671 ?auto_541674 ) ) ( not ( = ?auto_541671 ?auto_541675 ) ) ( not ( = ?auto_541671 ?auto_541676 ) ) ( not ( = ?auto_541672 ?auto_541673 ) ) ( not ( = ?auto_541672 ?auto_541674 ) ) ( not ( = ?auto_541672 ?auto_541675 ) ) ( not ( = ?auto_541672 ?auto_541676 ) ) ( not ( = ?auto_541673 ?auto_541674 ) ) ( not ( = ?auto_541673 ?auto_541675 ) ) ( not ( = ?auto_541673 ?auto_541676 ) ) ( not ( = ?auto_541674 ?auto_541675 ) ) ( not ( = ?auto_541674 ?auto_541676 ) ) ( not ( = ?auto_541675 ?auto_541676 ) ) ( ON ?auto_541674 ?auto_541675 ) ( ON ?auto_541673 ?auto_541674 ) ( ON ?auto_541672 ?auto_541673 ) ( ON ?auto_541671 ?auto_541672 ) ( CLEAR ?auto_541669 ) ( ON ?auto_541670 ?auto_541671 ) ( CLEAR ?auto_541670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_541666 ?auto_541667 ?auto_541668 ?auto_541669 ?auto_541670 )
      ( MAKE-10PILE ?auto_541666 ?auto_541667 ?auto_541668 ?auto_541669 ?auto_541670 ?auto_541671 ?auto_541672 ?auto_541673 ?auto_541674 ?auto_541675 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541708 - BLOCK
      ?auto_541709 - BLOCK
      ?auto_541710 - BLOCK
      ?auto_541711 - BLOCK
      ?auto_541712 - BLOCK
      ?auto_541713 - BLOCK
      ?auto_541714 - BLOCK
      ?auto_541715 - BLOCK
      ?auto_541716 - BLOCK
      ?auto_541717 - BLOCK
    )
    :vars
    (
      ?auto_541718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541717 ?auto_541718 ) ( ON-TABLE ?auto_541708 ) ( ON ?auto_541709 ?auto_541708 ) ( ON ?auto_541710 ?auto_541709 ) ( not ( = ?auto_541708 ?auto_541709 ) ) ( not ( = ?auto_541708 ?auto_541710 ) ) ( not ( = ?auto_541708 ?auto_541711 ) ) ( not ( = ?auto_541708 ?auto_541712 ) ) ( not ( = ?auto_541708 ?auto_541713 ) ) ( not ( = ?auto_541708 ?auto_541714 ) ) ( not ( = ?auto_541708 ?auto_541715 ) ) ( not ( = ?auto_541708 ?auto_541716 ) ) ( not ( = ?auto_541708 ?auto_541717 ) ) ( not ( = ?auto_541708 ?auto_541718 ) ) ( not ( = ?auto_541709 ?auto_541710 ) ) ( not ( = ?auto_541709 ?auto_541711 ) ) ( not ( = ?auto_541709 ?auto_541712 ) ) ( not ( = ?auto_541709 ?auto_541713 ) ) ( not ( = ?auto_541709 ?auto_541714 ) ) ( not ( = ?auto_541709 ?auto_541715 ) ) ( not ( = ?auto_541709 ?auto_541716 ) ) ( not ( = ?auto_541709 ?auto_541717 ) ) ( not ( = ?auto_541709 ?auto_541718 ) ) ( not ( = ?auto_541710 ?auto_541711 ) ) ( not ( = ?auto_541710 ?auto_541712 ) ) ( not ( = ?auto_541710 ?auto_541713 ) ) ( not ( = ?auto_541710 ?auto_541714 ) ) ( not ( = ?auto_541710 ?auto_541715 ) ) ( not ( = ?auto_541710 ?auto_541716 ) ) ( not ( = ?auto_541710 ?auto_541717 ) ) ( not ( = ?auto_541710 ?auto_541718 ) ) ( not ( = ?auto_541711 ?auto_541712 ) ) ( not ( = ?auto_541711 ?auto_541713 ) ) ( not ( = ?auto_541711 ?auto_541714 ) ) ( not ( = ?auto_541711 ?auto_541715 ) ) ( not ( = ?auto_541711 ?auto_541716 ) ) ( not ( = ?auto_541711 ?auto_541717 ) ) ( not ( = ?auto_541711 ?auto_541718 ) ) ( not ( = ?auto_541712 ?auto_541713 ) ) ( not ( = ?auto_541712 ?auto_541714 ) ) ( not ( = ?auto_541712 ?auto_541715 ) ) ( not ( = ?auto_541712 ?auto_541716 ) ) ( not ( = ?auto_541712 ?auto_541717 ) ) ( not ( = ?auto_541712 ?auto_541718 ) ) ( not ( = ?auto_541713 ?auto_541714 ) ) ( not ( = ?auto_541713 ?auto_541715 ) ) ( not ( = ?auto_541713 ?auto_541716 ) ) ( not ( = ?auto_541713 ?auto_541717 ) ) ( not ( = ?auto_541713 ?auto_541718 ) ) ( not ( = ?auto_541714 ?auto_541715 ) ) ( not ( = ?auto_541714 ?auto_541716 ) ) ( not ( = ?auto_541714 ?auto_541717 ) ) ( not ( = ?auto_541714 ?auto_541718 ) ) ( not ( = ?auto_541715 ?auto_541716 ) ) ( not ( = ?auto_541715 ?auto_541717 ) ) ( not ( = ?auto_541715 ?auto_541718 ) ) ( not ( = ?auto_541716 ?auto_541717 ) ) ( not ( = ?auto_541716 ?auto_541718 ) ) ( not ( = ?auto_541717 ?auto_541718 ) ) ( ON ?auto_541716 ?auto_541717 ) ( ON ?auto_541715 ?auto_541716 ) ( ON ?auto_541714 ?auto_541715 ) ( ON ?auto_541713 ?auto_541714 ) ( ON ?auto_541712 ?auto_541713 ) ( CLEAR ?auto_541710 ) ( ON ?auto_541711 ?auto_541712 ) ( CLEAR ?auto_541711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_541708 ?auto_541709 ?auto_541710 ?auto_541711 )
      ( MAKE-10PILE ?auto_541708 ?auto_541709 ?auto_541710 ?auto_541711 ?auto_541712 ?auto_541713 ?auto_541714 ?auto_541715 ?auto_541716 ?auto_541717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541750 - BLOCK
      ?auto_541751 - BLOCK
      ?auto_541752 - BLOCK
      ?auto_541753 - BLOCK
      ?auto_541754 - BLOCK
      ?auto_541755 - BLOCK
      ?auto_541756 - BLOCK
      ?auto_541757 - BLOCK
      ?auto_541758 - BLOCK
      ?auto_541759 - BLOCK
    )
    :vars
    (
      ?auto_541760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541759 ?auto_541760 ) ( ON-TABLE ?auto_541750 ) ( ON ?auto_541751 ?auto_541750 ) ( not ( = ?auto_541750 ?auto_541751 ) ) ( not ( = ?auto_541750 ?auto_541752 ) ) ( not ( = ?auto_541750 ?auto_541753 ) ) ( not ( = ?auto_541750 ?auto_541754 ) ) ( not ( = ?auto_541750 ?auto_541755 ) ) ( not ( = ?auto_541750 ?auto_541756 ) ) ( not ( = ?auto_541750 ?auto_541757 ) ) ( not ( = ?auto_541750 ?auto_541758 ) ) ( not ( = ?auto_541750 ?auto_541759 ) ) ( not ( = ?auto_541750 ?auto_541760 ) ) ( not ( = ?auto_541751 ?auto_541752 ) ) ( not ( = ?auto_541751 ?auto_541753 ) ) ( not ( = ?auto_541751 ?auto_541754 ) ) ( not ( = ?auto_541751 ?auto_541755 ) ) ( not ( = ?auto_541751 ?auto_541756 ) ) ( not ( = ?auto_541751 ?auto_541757 ) ) ( not ( = ?auto_541751 ?auto_541758 ) ) ( not ( = ?auto_541751 ?auto_541759 ) ) ( not ( = ?auto_541751 ?auto_541760 ) ) ( not ( = ?auto_541752 ?auto_541753 ) ) ( not ( = ?auto_541752 ?auto_541754 ) ) ( not ( = ?auto_541752 ?auto_541755 ) ) ( not ( = ?auto_541752 ?auto_541756 ) ) ( not ( = ?auto_541752 ?auto_541757 ) ) ( not ( = ?auto_541752 ?auto_541758 ) ) ( not ( = ?auto_541752 ?auto_541759 ) ) ( not ( = ?auto_541752 ?auto_541760 ) ) ( not ( = ?auto_541753 ?auto_541754 ) ) ( not ( = ?auto_541753 ?auto_541755 ) ) ( not ( = ?auto_541753 ?auto_541756 ) ) ( not ( = ?auto_541753 ?auto_541757 ) ) ( not ( = ?auto_541753 ?auto_541758 ) ) ( not ( = ?auto_541753 ?auto_541759 ) ) ( not ( = ?auto_541753 ?auto_541760 ) ) ( not ( = ?auto_541754 ?auto_541755 ) ) ( not ( = ?auto_541754 ?auto_541756 ) ) ( not ( = ?auto_541754 ?auto_541757 ) ) ( not ( = ?auto_541754 ?auto_541758 ) ) ( not ( = ?auto_541754 ?auto_541759 ) ) ( not ( = ?auto_541754 ?auto_541760 ) ) ( not ( = ?auto_541755 ?auto_541756 ) ) ( not ( = ?auto_541755 ?auto_541757 ) ) ( not ( = ?auto_541755 ?auto_541758 ) ) ( not ( = ?auto_541755 ?auto_541759 ) ) ( not ( = ?auto_541755 ?auto_541760 ) ) ( not ( = ?auto_541756 ?auto_541757 ) ) ( not ( = ?auto_541756 ?auto_541758 ) ) ( not ( = ?auto_541756 ?auto_541759 ) ) ( not ( = ?auto_541756 ?auto_541760 ) ) ( not ( = ?auto_541757 ?auto_541758 ) ) ( not ( = ?auto_541757 ?auto_541759 ) ) ( not ( = ?auto_541757 ?auto_541760 ) ) ( not ( = ?auto_541758 ?auto_541759 ) ) ( not ( = ?auto_541758 ?auto_541760 ) ) ( not ( = ?auto_541759 ?auto_541760 ) ) ( ON ?auto_541758 ?auto_541759 ) ( ON ?auto_541757 ?auto_541758 ) ( ON ?auto_541756 ?auto_541757 ) ( ON ?auto_541755 ?auto_541756 ) ( ON ?auto_541754 ?auto_541755 ) ( ON ?auto_541753 ?auto_541754 ) ( CLEAR ?auto_541751 ) ( ON ?auto_541752 ?auto_541753 ) ( CLEAR ?auto_541752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_541750 ?auto_541751 ?auto_541752 )
      ( MAKE-10PILE ?auto_541750 ?auto_541751 ?auto_541752 ?auto_541753 ?auto_541754 ?auto_541755 ?auto_541756 ?auto_541757 ?auto_541758 ?auto_541759 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541792 - BLOCK
      ?auto_541793 - BLOCK
      ?auto_541794 - BLOCK
      ?auto_541795 - BLOCK
      ?auto_541796 - BLOCK
      ?auto_541797 - BLOCK
      ?auto_541798 - BLOCK
      ?auto_541799 - BLOCK
      ?auto_541800 - BLOCK
      ?auto_541801 - BLOCK
    )
    :vars
    (
      ?auto_541802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541801 ?auto_541802 ) ( ON-TABLE ?auto_541792 ) ( not ( = ?auto_541792 ?auto_541793 ) ) ( not ( = ?auto_541792 ?auto_541794 ) ) ( not ( = ?auto_541792 ?auto_541795 ) ) ( not ( = ?auto_541792 ?auto_541796 ) ) ( not ( = ?auto_541792 ?auto_541797 ) ) ( not ( = ?auto_541792 ?auto_541798 ) ) ( not ( = ?auto_541792 ?auto_541799 ) ) ( not ( = ?auto_541792 ?auto_541800 ) ) ( not ( = ?auto_541792 ?auto_541801 ) ) ( not ( = ?auto_541792 ?auto_541802 ) ) ( not ( = ?auto_541793 ?auto_541794 ) ) ( not ( = ?auto_541793 ?auto_541795 ) ) ( not ( = ?auto_541793 ?auto_541796 ) ) ( not ( = ?auto_541793 ?auto_541797 ) ) ( not ( = ?auto_541793 ?auto_541798 ) ) ( not ( = ?auto_541793 ?auto_541799 ) ) ( not ( = ?auto_541793 ?auto_541800 ) ) ( not ( = ?auto_541793 ?auto_541801 ) ) ( not ( = ?auto_541793 ?auto_541802 ) ) ( not ( = ?auto_541794 ?auto_541795 ) ) ( not ( = ?auto_541794 ?auto_541796 ) ) ( not ( = ?auto_541794 ?auto_541797 ) ) ( not ( = ?auto_541794 ?auto_541798 ) ) ( not ( = ?auto_541794 ?auto_541799 ) ) ( not ( = ?auto_541794 ?auto_541800 ) ) ( not ( = ?auto_541794 ?auto_541801 ) ) ( not ( = ?auto_541794 ?auto_541802 ) ) ( not ( = ?auto_541795 ?auto_541796 ) ) ( not ( = ?auto_541795 ?auto_541797 ) ) ( not ( = ?auto_541795 ?auto_541798 ) ) ( not ( = ?auto_541795 ?auto_541799 ) ) ( not ( = ?auto_541795 ?auto_541800 ) ) ( not ( = ?auto_541795 ?auto_541801 ) ) ( not ( = ?auto_541795 ?auto_541802 ) ) ( not ( = ?auto_541796 ?auto_541797 ) ) ( not ( = ?auto_541796 ?auto_541798 ) ) ( not ( = ?auto_541796 ?auto_541799 ) ) ( not ( = ?auto_541796 ?auto_541800 ) ) ( not ( = ?auto_541796 ?auto_541801 ) ) ( not ( = ?auto_541796 ?auto_541802 ) ) ( not ( = ?auto_541797 ?auto_541798 ) ) ( not ( = ?auto_541797 ?auto_541799 ) ) ( not ( = ?auto_541797 ?auto_541800 ) ) ( not ( = ?auto_541797 ?auto_541801 ) ) ( not ( = ?auto_541797 ?auto_541802 ) ) ( not ( = ?auto_541798 ?auto_541799 ) ) ( not ( = ?auto_541798 ?auto_541800 ) ) ( not ( = ?auto_541798 ?auto_541801 ) ) ( not ( = ?auto_541798 ?auto_541802 ) ) ( not ( = ?auto_541799 ?auto_541800 ) ) ( not ( = ?auto_541799 ?auto_541801 ) ) ( not ( = ?auto_541799 ?auto_541802 ) ) ( not ( = ?auto_541800 ?auto_541801 ) ) ( not ( = ?auto_541800 ?auto_541802 ) ) ( not ( = ?auto_541801 ?auto_541802 ) ) ( ON ?auto_541800 ?auto_541801 ) ( ON ?auto_541799 ?auto_541800 ) ( ON ?auto_541798 ?auto_541799 ) ( ON ?auto_541797 ?auto_541798 ) ( ON ?auto_541796 ?auto_541797 ) ( ON ?auto_541795 ?auto_541796 ) ( ON ?auto_541794 ?auto_541795 ) ( CLEAR ?auto_541792 ) ( ON ?auto_541793 ?auto_541794 ) ( CLEAR ?auto_541793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_541792 ?auto_541793 )
      ( MAKE-10PILE ?auto_541792 ?auto_541793 ?auto_541794 ?auto_541795 ?auto_541796 ?auto_541797 ?auto_541798 ?auto_541799 ?auto_541800 ?auto_541801 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_541834 - BLOCK
      ?auto_541835 - BLOCK
      ?auto_541836 - BLOCK
      ?auto_541837 - BLOCK
      ?auto_541838 - BLOCK
      ?auto_541839 - BLOCK
      ?auto_541840 - BLOCK
      ?auto_541841 - BLOCK
      ?auto_541842 - BLOCK
      ?auto_541843 - BLOCK
    )
    :vars
    (
      ?auto_541844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541843 ?auto_541844 ) ( not ( = ?auto_541834 ?auto_541835 ) ) ( not ( = ?auto_541834 ?auto_541836 ) ) ( not ( = ?auto_541834 ?auto_541837 ) ) ( not ( = ?auto_541834 ?auto_541838 ) ) ( not ( = ?auto_541834 ?auto_541839 ) ) ( not ( = ?auto_541834 ?auto_541840 ) ) ( not ( = ?auto_541834 ?auto_541841 ) ) ( not ( = ?auto_541834 ?auto_541842 ) ) ( not ( = ?auto_541834 ?auto_541843 ) ) ( not ( = ?auto_541834 ?auto_541844 ) ) ( not ( = ?auto_541835 ?auto_541836 ) ) ( not ( = ?auto_541835 ?auto_541837 ) ) ( not ( = ?auto_541835 ?auto_541838 ) ) ( not ( = ?auto_541835 ?auto_541839 ) ) ( not ( = ?auto_541835 ?auto_541840 ) ) ( not ( = ?auto_541835 ?auto_541841 ) ) ( not ( = ?auto_541835 ?auto_541842 ) ) ( not ( = ?auto_541835 ?auto_541843 ) ) ( not ( = ?auto_541835 ?auto_541844 ) ) ( not ( = ?auto_541836 ?auto_541837 ) ) ( not ( = ?auto_541836 ?auto_541838 ) ) ( not ( = ?auto_541836 ?auto_541839 ) ) ( not ( = ?auto_541836 ?auto_541840 ) ) ( not ( = ?auto_541836 ?auto_541841 ) ) ( not ( = ?auto_541836 ?auto_541842 ) ) ( not ( = ?auto_541836 ?auto_541843 ) ) ( not ( = ?auto_541836 ?auto_541844 ) ) ( not ( = ?auto_541837 ?auto_541838 ) ) ( not ( = ?auto_541837 ?auto_541839 ) ) ( not ( = ?auto_541837 ?auto_541840 ) ) ( not ( = ?auto_541837 ?auto_541841 ) ) ( not ( = ?auto_541837 ?auto_541842 ) ) ( not ( = ?auto_541837 ?auto_541843 ) ) ( not ( = ?auto_541837 ?auto_541844 ) ) ( not ( = ?auto_541838 ?auto_541839 ) ) ( not ( = ?auto_541838 ?auto_541840 ) ) ( not ( = ?auto_541838 ?auto_541841 ) ) ( not ( = ?auto_541838 ?auto_541842 ) ) ( not ( = ?auto_541838 ?auto_541843 ) ) ( not ( = ?auto_541838 ?auto_541844 ) ) ( not ( = ?auto_541839 ?auto_541840 ) ) ( not ( = ?auto_541839 ?auto_541841 ) ) ( not ( = ?auto_541839 ?auto_541842 ) ) ( not ( = ?auto_541839 ?auto_541843 ) ) ( not ( = ?auto_541839 ?auto_541844 ) ) ( not ( = ?auto_541840 ?auto_541841 ) ) ( not ( = ?auto_541840 ?auto_541842 ) ) ( not ( = ?auto_541840 ?auto_541843 ) ) ( not ( = ?auto_541840 ?auto_541844 ) ) ( not ( = ?auto_541841 ?auto_541842 ) ) ( not ( = ?auto_541841 ?auto_541843 ) ) ( not ( = ?auto_541841 ?auto_541844 ) ) ( not ( = ?auto_541842 ?auto_541843 ) ) ( not ( = ?auto_541842 ?auto_541844 ) ) ( not ( = ?auto_541843 ?auto_541844 ) ) ( ON ?auto_541842 ?auto_541843 ) ( ON ?auto_541841 ?auto_541842 ) ( ON ?auto_541840 ?auto_541841 ) ( ON ?auto_541839 ?auto_541840 ) ( ON ?auto_541838 ?auto_541839 ) ( ON ?auto_541837 ?auto_541838 ) ( ON ?auto_541836 ?auto_541837 ) ( ON ?auto_541835 ?auto_541836 ) ( ON ?auto_541834 ?auto_541835 ) ( CLEAR ?auto_541834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_541834 )
      ( MAKE-10PILE ?auto_541834 ?auto_541835 ?auto_541836 ?auto_541837 ?auto_541838 ?auto_541839 ?auto_541840 ?auto_541841 ?auto_541842 ?auto_541843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_541877 - BLOCK
      ?auto_541878 - BLOCK
      ?auto_541879 - BLOCK
      ?auto_541880 - BLOCK
      ?auto_541881 - BLOCK
      ?auto_541882 - BLOCK
      ?auto_541883 - BLOCK
      ?auto_541884 - BLOCK
      ?auto_541885 - BLOCK
      ?auto_541886 - BLOCK
      ?auto_541887 - BLOCK
    )
    :vars
    (
      ?auto_541888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_541886 ) ( ON ?auto_541887 ?auto_541888 ) ( CLEAR ?auto_541887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_541877 ) ( ON ?auto_541878 ?auto_541877 ) ( ON ?auto_541879 ?auto_541878 ) ( ON ?auto_541880 ?auto_541879 ) ( ON ?auto_541881 ?auto_541880 ) ( ON ?auto_541882 ?auto_541881 ) ( ON ?auto_541883 ?auto_541882 ) ( ON ?auto_541884 ?auto_541883 ) ( ON ?auto_541885 ?auto_541884 ) ( ON ?auto_541886 ?auto_541885 ) ( not ( = ?auto_541877 ?auto_541878 ) ) ( not ( = ?auto_541877 ?auto_541879 ) ) ( not ( = ?auto_541877 ?auto_541880 ) ) ( not ( = ?auto_541877 ?auto_541881 ) ) ( not ( = ?auto_541877 ?auto_541882 ) ) ( not ( = ?auto_541877 ?auto_541883 ) ) ( not ( = ?auto_541877 ?auto_541884 ) ) ( not ( = ?auto_541877 ?auto_541885 ) ) ( not ( = ?auto_541877 ?auto_541886 ) ) ( not ( = ?auto_541877 ?auto_541887 ) ) ( not ( = ?auto_541877 ?auto_541888 ) ) ( not ( = ?auto_541878 ?auto_541879 ) ) ( not ( = ?auto_541878 ?auto_541880 ) ) ( not ( = ?auto_541878 ?auto_541881 ) ) ( not ( = ?auto_541878 ?auto_541882 ) ) ( not ( = ?auto_541878 ?auto_541883 ) ) ( not ( = ?auto_541878 ?auto_541884 ) ) ( not ( = ?auto_541878 ?auto_541885 ) ) ( not ( = ?auto_541878 ?auto_541886 ) ) ( not ( = ?auto_541878 ?auto_541887 ) ) ( not ( = ?auto_541878 ?auto_541888 ) ) ( not ( = ?auto_541879 ?auto_541880 ) ) ( not ( = ?auto_541879 ?auto_541881 ) ) ( not ( = ?auto_541879 ?auto_541882 ) ) ( not ( = ?auto_541879 ?auto_541883 ) ) ( not ( = ?auto_541879 ?auto_541884 ) ) ( not ( = ?auto_541879 ?auto_541885 ) ) ( not ( = ?auto_541879 ?auto_541886 ) ) ( not ( = ?auto_541879 ?auto_541887 ) ) ( not ( = ?auto_541879 ?auto_541888 ) ) ( not ( = ?auto_541880 ?auto_541881 ) ) ( not ( = ?auto_541880 ?auto_541882 ) ) ( not ( = ?auto_541880 ?auto_541883 ) ) ( not ( = ?auto_541880 ?auto_541884 ) ) ( not ( = ?auto_541880 ?auto_541885 ) ) ( not ( = ?auto_541880 ?auto_541886 ) ) ( not ( = ?auto_541880 ?auto_541887 ) ) ( not ( = ?auto_541880 ?auto_541888 ) ) ( not ( = ?auto_541881 ?auto_541882 ) ) ( not ( = ?auto_541881 ?auto_541883 ) ) ( not ( = ?auto_541881 ?auto_541884 ) ) ( not ( = ?auto_541881 ?auto_541885 ) ) ( not ( = ?auto_541881 ?auto_541886 ) ) ( not ( = ?auto_541881 ?auto_541887 ) ) ( not ( = ?auto_541881 ?auto_541888 ) ) ( not ( = ?auto_541882 ?auto_541883 ) ) ( not ( = ?auto_541882 ?auto_541884 ) ) ( not ( = ?auto_541882 ?auto_541885 ) ) ( not ( = ?auto_541882 ?auto_541886 ) ) ( not ( = ?auto_541882 ?auto_541887 ) ) ( not ( = ?auto_541882 ?auto_541888 ) ) ( not ( = ?auto_541883 ?auto_541884 ) ) ( not ( = ?auto_541883 ?auto_541885 ) ) ( not ( = ?auto_541883 ?auto_541886 ) ) ( not ( = ?auto_541883 ?auto_541887 ) ) ( not ( = ?auto_541883 ?auto_541888 ) ) ( not ( = ?auto_541884 ?auto_541885 ) ) ( not ( = ?auto_541884 ?auto_541886 ) ) ( not ( = ?auto_541884 ?auto_541887 ) ) ( not ( = ?auto_541884 ?auto_541888 ) ) ( not ( = ?auto_541885 ?auto_541886 ) ) ( not ( = ?auto_541885 ?auto_541887 ) ) ( not ( = ?auto_541885 ?auto_541888 ) ) ( not ( = ?auto_541886 ?auto_541887 ) ) ( not ( = ?auto_541886 ?auto_541888 ) ) ( not ( = ?auto_541887 ?auto_541888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_541887 ?auto_541888 )
      ( !STACK ?auto_541887 ?auto_541886 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_541923 - BLOCK
      ?auto_541924 - BLOCK
      ?auto_541925 - BLOCK
      ?auto_541926 - BLOCK
      ?auto_541927 - BLOCK
      ?auto_541928 - BLOCK
      ?auto_541929 - BLOCK
      ?auto_541930 - BLOCK
      ?auto_541931 - BLOCK
      ?auto_541932 - BLOCK
      ?auto_541933 - BLOCK
    )
    :vars
    (
      ?auto_541934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541933 ?auto_541934 ) ( ON-TABLE ?auto_541923 ) ( ON ?auto_541924 ?auto_541923 ) ( ON ?auto_541925 ?auto_541924 ) ( ON ?auto_541926 ?auto_541925 ) ( ON ?auto_541927 ?auto_541926 ) ( ON ?auto_541928 ?auto_541927 ) ( ON ?auto_541929 ?auto_541928 ) ( ON ?auto_541930 ?auto_541929 ) ( ON ?auto_541931 ?auto_541930 ) ( not ( = ?auto_541923 ?auto_541924 ) ) ( not ( = ?auto_541923 ?auto_541925 ) ) ( not ( = ?auto_541923 ?auto_541926 ) ) ( not ( = ?auto_541923 ?auto_541927 ) ) ( not ( = ?auto_541923 ?auto_541928 ) ) ( not ( = ?auto_541923 ?auto_541929 ) ) ( not ( = ?auto_541923 ?auto_541930 ) ) ( not ( = ?auto_541923 ?auto_541931 ) ) ( not ( = ?auto_541923 ?auto_541932 ) ) ( not ( = ?auto_541923 ?auto_541933 ) ) ( not ( = ?auto_541923 ?auto_541934 ) ) ( not ( = ?auto_541924 ?auto_541925 ) ) ( not ( = ?auto_541924 ?auto_541926 ) ) ( not ( = ?auto_541924 ?auto_541927 ) ) ( not ( = ?auto_541924 ?auto_541928 ) ) ( not ( = ?auto_541924 ?auto_541929 ) ) ( not ( = ?auto_541924 ?auto_541930 ) ) ( not ( = ?auto_541924 ?auto_541931 ) ) ( not ( = ?auto_541924 ?auto_541932 ) ) ( not ( = ?auto_541924 ?auto_541933 ) ) ( not ( = ?auto_541924 ?auto_541934 ) ) ( not ( = ?auto_541925 ?auto_541926 ) ) ( not ( = ?auto_541925 ?auto_541927 ) ) ( not ( = ?auto_541925 ?auto_541928 ) ) ( not ( = ?auto_541925 ?auto_541929 ) ) ( not ( = ?auto_541925 ?auto_541930 ) ) ( not ( = ?auto_541925 ?auto_541931 ) ) ( not ( = ?auto_541925 ?auto_541932 ) ) ( not ( = ?auto_541925 ?auto_541933 ) ) ( not ( = ?auto_541925 ?auto_541934 ) ) ( not ( = ?auto_541926 ?auto_541927 ) ) ( not ( = ?auto_541926 ?auto_541928 ) ) ( not ( = ?auto_541926 ?auto_541929 ) ) ( not ( = ?auto_541926 ?auto_541930 ) ) ( not ( = ?auto_541926 ?auto_541931 ) ) ( not ( = ?auto_541926 ?auto_541932 ) ) ( not ( = ?auto_541926 ?auto_541933 ) ) ( not ( = ?auto_541926 ?auto_541934 ) ) ( not ( = ?auto_541927 ?auto_541928 ) ) ( not ( = ?auto_541927 ?auto_541929 ) ) ( not ( = ?auto_541927 ?auto_541930 ) ) ( not ( = ?auto_541927 ?auto_541931 ) ) ( not ( = ?auto_541927 ?auto_541932 ) ) ( not ( = ?auto_541927 ?auto_541933 ) ) ( not ( = ?auto_541927 ?auto_541934 ) ) ( not ( = ?auto_541928 ?auto_541929 ) ) ( not ( = ?auto_541928 ?auto_541930 ) ) ( not ( = ?auto_541928 ?auto_541931 ) ) ( not ( = ?auto_541928 ?auto_541932 ) ) ( not ( = ?auto_541928 ?auto_541933 ) ) ( not ( = ?auto_541928 ?auto_541934 ) ) ( not ( = ?auto_541929 ?auto_541930 ) ) ( not ( = ?auto_541929 ?auto_541931 ) ) ( not ( = ?auto_541929 ?auto_541932 ) ) ( not ( = ?auto_541929 ?auto_541933 ) ) ( not ( = ?auto_541929 ?auto_541934 ) ) ( not ( = ?auto_541930 ?auto_541931 ) ) ( not ( = ?auto_541930 ?auto_541932 ) ) ( not ( = ?auto_541930 ?auto_541933 ) ) ( not ( = ?auto_541930 ?auto_541934 ) ) ( not ( = ?auto_541931 ?auto_541932 ) ) ( not ( = ?auto_541931 ?auto_541933 ) ) ( not ( = ?auto_541931 ?auto_541934 ) ) ( not ( = ?auto_541932 ?auto_541933 ) ) ( not ( = ?auto_541932 ?auto_541934 ) ) ( not ( = ?auto_541933 ?auto_541934 ) ) ( CLEAR ?auto_541931 ) ( ON ?auto_541932 ?auto_541933 ) ( CLEAR ?auto_541932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_541923 ?auto_541924 ?auto_541925 ?auto_541926 ?auto_541927 ?auto_541928 ?auto_541929 ?auto_541930 ?auto_541931 ?auto_541932 )
      ( MAKE-11PILE ?auto_541923 ?auto_541924 ?auto_541925 ?auto_541926 ?auto_541927 ?auto_541928 ?auto_541929 ?auto_541930 ?auto_541931 ?auto_541932 ?auto_541933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_541969 - BLOCK
      ?auto_541970 - BLOCK
      ?auto_541971 - BLOCK
      ?auto_541972 - BLOCK
      ?auto_541973 - BLOCK
      ?auto_541974 - BLOCK
      ?auto_541975 - BLOCK
      ?auto_541976 - BLOCK
      ?auto_541977 - BLOCK
      ?auto_541978 - BLOCK
      ?auto_541979 - BLOCK
    )
    :vars
    (
      ?auto_541980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_541979 ?auto_541980 ) ( ON-TABLE ?auto_541969 ) ( ON ?auto_541970 ?auto_541969 ) ( ON ?auto_541971 ?auto_541970 ) ( ON ?auto_541972 ?auto_541971 ) ( ON ?auto_541973 ?auto_541972 ) ( ON ?auto_541974 ?auto_541973 ) ( ON ?auto_541975 ?auto_541974 ) ( ON ?auto_541976 ?auto_541975 ) ( not ( = ?auto_541969 ?auto_541970 ) ) ( not ( = ?auto_541969 ?auto_541971 ) ) ( not ( = ?auto_541969 ?auto_541972 ) ) ( not ( = ?auto_541969 ?auto_541973 ) ) ( not ( = ?auto_541969 ?auto_541974 ) ) ( not ( = ?auto_541969 ?auto_541975 ) ) ( not ( = ?auto_541969 ?auto_541976 ) ) ( not ( = ?auto_541969 ?auto_541977 ) ) ( not ( = ?auto_541969 ?auto_541978 ) ) ( not ( = ?auto_541969 ?auto_541979 ) ) ( not ( = ?auto_541969 ?auto_541980 ) ) ( not ( = ?auto_541970 ?auto_541971 ) ) ( not ( = ?auto_541970 ?auto_541972 ) ) ( not ( = ?auto_541970 ?auto_541973 ) ) ( not ( = ?auto_541970 ?auto_541974 ) ) ( not ( = ?auto_541970 ?auto_541975 ) ) ( not ( = ?auto_541970 ?auto_541976 ) ) ( not ( = ?auto_541970 ?auto_541977 ) ) ( not ( = ?auto_541970 ?auto_541978 ) ) ( not ( = ?auto_541970 ?auto_541979 ) ) ( not ( = ?auto_541970 ?auto_541980 ) ) ( not ( = ?auto_541971 ?auto_541972 ) ) ( not ( = ?auto_541971 ?auto_541973 ) ) ( not ( = ?auto_541971 ?auto_541974 ) ) ( not ( = ?auto_541971 ?auto_541975 ) ) ( not ( = ?auto_541971 ?auto_541976 ) ) ( not ( = ?auto_541971 ?auto_541977 ) ) ( not ( = ?auto_541971 ?auto_541978 ) ) ( not ( = ?auto_541971 ?auto_541979 ) ) ( not ( = ?auto_541971 ?auto_541980 ) ) ( not ( = ?auto_541972 ?auto_541973 ) ) ( not ( = ?auto_541972 ?auto_541974 ) ) ( not ( = ?auto_541972 ?auto_541975 ) ) ( not ( = ?auto_541972 ?auto_541976 ) ) ( not ( = ?auto_541972 ?auto_541977 ) ) ( not ( = ?auto_541972 ?auto_541978 ) ) ( not ( = ?auto_541972 ?auto_541979 ) ) ( not ( = ?auto_541972 ?auto_541980 ) ) ( not ( = ?auto_541973 ?auto_541974 ) ) ( not ( = ?auto_541973 ?auto_541975 ) ) ( not ( = ?auto_541973 ?auto_541976 ) ) ( not ( = ?auto_541973 ?auto_541977 ) ) ( not ( = ?auto_541973 ?auto_541978 ) ) ( not ( = ?auto_541973 ?auto_541979 ) ) ( not ( = ?auto_541973 ?auto_541980 ) ) ( not ( = ?auto_541974 ?auto_541975 ) ) ( not ( = ?auto_541974 ?auto_541976 ) ) ( not ( = ?auto_541974 ?auto_541977 ) ) ( not ( = ?auto_541974 ?auto_541978 ) ) ( not ( = ?auto_541974 ?auto_541979 ) ) ( not ( = ?auto_541974 ?auto_541980 ) ) ( not ( = ?auto_541975 ?auto_541976 ) ) ( not ( = ?auto_541975 ?auto_541977 ) ) ( not ( = ?auto_541975 ?auto_541978 ) ) ( not ( = ?auto_541975 ?auto_541979 ) ) ( not ( = ?auto_541975 ?auto_541980 ) ) ( not ( = ?auto_541976 ?auto_541977 ) ) ( not ( = ?auto_541976 ?auto_541978 ) ) ( not ( = ?auto_541976 ?auto_541979 ) ) ( not ( = ?auto_541976 ?auto_541980 ) ) ( not ( = ?auto_541977 ?auto_541978 ) ) ( not ( = ?auto_541977 ?auto_541979 ) ) ( not ( = ?auto_541977 ?auto_541980 ) ) ( not ( = ?auto_541978 ?auto_541979 ) ) ( not ( = ?auto_541978 ?auto_541980 ) ) ( not ( = ?auto_541979 ?auto_541980 ) ) ( ON ?auto_541978 ?auto_541979 ) ( CLEAR ?auto_541976 ) ( ON ?auto_541977 ?auto_541978 ) ( CLEAR ?auto_541977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_541969 ?auto_541970 ?auto_541971 ?auto_541972 ?auto_541973 ?auto_541974 ?auto_541975 ?auto_541976 ?auto_541977 )
      ( MAKE-11PILE ?auto_541969 ?auto_541970 ?auto_541971 ?auto_541972 ?auto_541973 ?auto_541974 ?auto_541975 ?auto_541976 ?auto_541977 ?auto_541978 ?auto_541979 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542015 - BLOCK
      ?auto_542016 - BLOCK
      ?auto_542017 - BLOCK
      ?auto_542018 - BLOCK
      ?auto_542019 - BLOCK
      ?auto_542020 - BLOCK
      ?auto_542021 - BLOCK
      ?auto_542022 - BLOCK
      ?auto_542023 - BLOCK
      ?auto_542024 - BLOCK
      ?auto_542025 - BLOCK
    )
    :vars
    (
      ?auto_542026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542025 ?auto_542026 ) ( ON-TABLE ?auto_542015 ) ( ON ?auto_542016 ?auto_542015 ) ( ON ?auto_542017 ?auto_542016 ) ( ON ?auto_542018 ?auto_542017 ) ( ON ?auto_542019 ?auto_542018 ) ( ON ?auto_542020 ?auto_542019 ) ( ON ?auto_542021 ?auto_542020 ) ( not ( = ?auto_542015 ?auto_542016 ) ) ( not ( = ?auto_542015 ?auto_542017 ) ) ( not ( = ?auto_542015 ?auto_542018 ) ) ( not ( = ?auto_542015 ?auto_542019 ) ) ( not ( = ?auto_542015 ?auto_542020 ) ) ( not ( = ?auto_542015 ?auto_542021 ) ) ( not ( = ?auto_542015 ?auto_542022 ) ) ( not ( = ?auto_542015 ?auto_542023 ) ) ( not ( = ?auto_542015 ?auto_542024 ) ) ( not ( = ?auto_542015 ?auto_542025 ) ) ( not ( = ?auto_542015 ?auto_542026 ) ) ( not ( = ?auto_542016 ?auto_542017 ) ) ( not ( = ?auto_542016 ?auto_542018 ) ) ( not ( = ?auto_542016 ?auto_542019 ) ) ( not ( = ?auto_542016 ?auto_542020 ) ) ( not ( = ?auto_542016 ?auto_542021 ) ) ( not ( = ?auto_542016 ?auto_542022 ) ) ( not ( = ?auto_542016 ?auto_542023 ) ) ( not ( = ?auto_542016 ?auto_542024 ) ) ( not ( = ?auto_542016 ?auto_542025 ) ) ( not ( = ?auto_542016 ?auto_542026 ) ) ( not ( = ?auto_542017 ?auto_542018 ) ) ( not ( = ?auto_542017 ?auto_542019 ) ) ( not ( = ?auto_542017 ?auto_542020 ) ) ( not ( = ?auto_542017 ?auto_542021 ) ) ( not ( = ?auto_542017 ?auto_542022 ) ) ( not ( = ?auto_542017 ?auto_542023 ) ) ( not ( = ?auto_542017 ?auto_542024 ) ) ( not ( = ?auto_542017 ?auto_542025 ) ) ( not ( = ?auto_542017 ?auto_542026 ) ) ( not ( = ?auto_542018 ?auto_542019 ) ) ( not ( = ?auto_542018 ?auto_542020 ) ) ( not ( = ?auto_542018 ?auto_542021 ) ) ( not ( = ?auto_542018 ?auto_542022 ) ) ( not ( = ?auto_542018 ?auto_542023 ) ) ( not ( = ?auto_542018 ?auto_542024 ) ) ( not ( = ?auto_542018 ?auto_542025 ) ) ( not ( = ?auto_542018 ?auto_542026 ) ) ( not ( = ?auto_542019 ?auto_542020 ) ) ( not ( = ?auto_542019 ?auto_542021 ) ) ( not ( = ?auto_542019 ?auto_542022 ) ) ( not ( = ?auto_542019 ?auto_542023 ) ) ( not ( = ?auto_542019 ?auto_542024 ) ) ( not ( = ?auto_542019 ?auto_542025 ) ) ( not ( = ?auto_542019 ?auto_542026 ) ) ( not ( = ?auto_542020 ?auto_542021 ) ) ( not ( = ?auto_542020 ?auto_542022 ) ) ( not ( = ?auto_542020 ?auto_542023 ) ) ( not ( = ?auto_542020 ?auto_542024 ) ) ( not ( = ?auto_542020 ?auto_542025 ) ) ( not ( = ?auto_542020 ?auto_542026 ) ) ( not ( = ?auto_542021 ?auto_542022 ) ) ( not ( = ?auto_542021 ?auto_542023 ) ) ( not ( = ?auto_542021 ?auto_542024 ) ) ( not ( = ?auto_542021 ?auto_542025 ) ) ( not ( = ?auto_542021 ?auto_542026 ) ) ( not ( = ?auto_542022 ?auto_542023 ) ) ( not ( = ?auto_542022 ?auto_542024 ) ) ( not ( = ?auto_542022 ?auto_542025 ) ) ( not ( = ?auto_542022 ?auto_542026 ) ) ( not ( = ?auto_542023 ?auto_542024 ) ) ( not ( = ?auto_542023 ?auto_542025 ) ) ( not ( = ?auto_542023 ?auto_542026 ) ) ( not ( = ?auto_542024 ?auto_542025 ) ) ( not ( = ?auto_542024 ?auto_542026 ) ) ( not ( = ?auto_542025 ?auto_542026 ) ) ( ON ?auto_542024 ?auto_542025 ) ( ON ?auto_542023 ?auto_542024 ) ( CLEAR ?auto_542021 ) ( ON ?auto_542022 ?auto_542023 ) ( CLEAR ?auto_542022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_542015 ?auto_542016 ?auto_542017 ?auto_542018 ?auto_542019 ?auto_542020 ?auto_542021 ?auto_542022 )
      ( MAKE-11PILE ?auto_542015 ?auto_542016 ?auto_542017 ?auto_542018 ?auto_542019 ?auto_542020 ?auto_542021 ?auto_542022 ?auto_542023 ?auto_542024 ?auto_542025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542061 - BLOCK
      ?auto_542062 - BLOCK
      ?auto_542063 - BLOCK
      ?auto_542064 - BLOCK
      ?auto_542065 - BLOCK
      ?auto_542066 - BLOCK
      ?auto_542067 - BLOCK
      ?auto_542068 - BLOCK
      ?auto_542069 - BLOCK
      ?auto_542070 - BLOCK
      ?auto_542071 - BLOCK
    )
    :vars
    (
      ?auto_542072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542071 ?auto_542072 ) ( ON-TABLE ?auto_542061 ) ( ON ?auto_542062 ?auto_542061 ) ( ON ?auto_542063 ?auto_542062 ) ( ON ?auto_542064 ?auto_542063 ) ( ON ?auto_542065 ?auto_542064 ) ( ON ?auto_542066 ?auto_542065 ) ( not ( = ?auto_542061 ?auto_542062 ) ) ( not ( = ?auto_542061 ?auto_542063 ) ) ( not ( = ?auto_542061 ?auto_542064 ) ) ( not ( = ?auto_542061 ?auto_542065 ) ) ( not ( = ?auto_542061 ?auto_542066 ) ) ( not ( = ?auto_542061 ?auto_542067 ) ) ( not ( = ?auto_542061 ?auto_542068 ) ) ( not ( = ?auto_542061 ?auto_542069 ) ) ( not ( = ?auto_542061 ?auto_542070 ) ) ( not ( = ?auto_542061 ?auto_542071 ) ) ( not ( = ?auto_542061 ?auto_542072 ) ) ( not ( = ?auto_542062 ?auto_542063 ) ) ( not ( = ?auto_542062 ?auto_542064 ) ) ( not ( = ?auto_542062 ?auto_542065 ) ) ( not ( = ?auto_542062 ?auto_542066 ) ) ( not ( = ?auto_542062 ?auto_542067 ) ) ( not ( = ?auto_542062 ?auto_542068 ) ) ( not ( = ?auto_542062 ?auto_542069 ) ) ( not ( = ?auto_542062 ?auto_542070 ) ) ( not ( = ?auto_542062 ?auto_542071 ) ) ( not ( = ?auto_542062 ?auto_542072 ) ) ( not ( = ?auto_542063 ?auto_542064 ) ) ( not ( = ?auto_542063 ?auto_542065 ) ) ( not ( = ?auto_542063 ?auto_542066 ) ) ( not ( = ?auto_542063 ?auto_542067 ) ) ( not ( = ?auto_542063 ?auto_542068 ) ) ( not ( = ?auto_542063 ?auto_542069 ) ) ( not ( = ?auto_542063 ?auto_542070 ) ) ( not ( = ?auto_542063 ?auto_542071 ) ) ( not ( = ?auto_542063 ?auto_542072 ) ) ( not ( = ?auto_542064 ?auto_542065 ) ) ( not ( = ?auto_542064 ?auto_542066 ) ) ( not ( = ?auto_542064 ?auto_542067 ) ) ( not ( = ?auto_542064 ?auto_542068 ) ) ( not ( = ?auto_542064 ?auto_542069 ) ) ( not ( = ?auto_542064 ?auto_542070 ) ) ( not ( = ?auto_542064 ?auto_542071 ) ) ( not ( = ?auto_542064 ?auto_542072 ) ) ( not ( = ?auto_542065 ?auto_542066 ) ) ( not ( = ?auto_542065 ?auto_542067 ) ) ( not ( = ?auto_542065 ?auto_542068 ) ) ( not ( = ?auto_542065 ?auto_542069 ) ) ( not ( = ?auto_542065 ?auto_542070 ) ) ( not ( = ?auto_542065 ?auto_542071 ) ) ( not ( = ?auto_542065 ?auto_542072 ) ) ( not ( = ?auto_542066 ?auto_542067 ) ) ( not ( = ?auto_542066 ?auto_542068 ) ) ( not ( = ?auto_542066 ?auto_542069 ) ) ( not ( = ?auto_542066 ?auto_542070 ) ) ( not ( = ?auto_542066 ?auto_542071 ) ) ( not ( = ?auto_542066 ?auto_542072 ) ) ( not ( = ?auto_542067 ?auto_542068 ) ) ( not ( = ?auto_542067 ?auto_542069 ) ) ( not ( = ?auto_542067 ?auto_542070 ) ) ( not ( = ?auto_542067 ?auto_542071 ) ) ( not ( = ?auto_542067 ?auto_542072 ) ) ( not ( = ?auto_542068 ?auto_542069 ) ) ( not ( = ?auto_542068 ?auto_542070 ) ) ( not ( = ?auto_542068 ?auto_542071 ) ) ( not ( = ?auto_542068 ?auto_542072 ) ) ( not ( = ?auto_542069 ?auto_542070 ) ) ( not ( = ?auto_542069 ?auto_542071 ) ) ( not ( = ?auto_542069 ?auto_542072 ) ) ( not ( = ?auto_542070 ?auto_542071 ) ) ( not ( = ?auto_542070 ?auto_542072 ) ) ( not ( = ?auto_542071 ?auto_542072 ) ) ( ON ?auto_542070 ?auto_542071 ) ( ON ?auto_542069 ?auto_542070 ) ( ON ?auto_542068 ?auto_542069 ) ( CLEAR ?auto_542066 ) ( ON ?auto_542067 ?auto_542068 ) ( CLEAR ?auto_542067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_542061 ?auto_542062 ?auto_542063 ?auto_542064 ?auto_542065 ?auto_542066 ?auto_542067 )
      ( MAKE-11PILE ?auto_542061 ?auto_542062 ?auto_542063 ?auto_542064 ?auto_542065 ?auto_542066 ?auto_542067 ?auto_542068 ?auto_542069 ?auto_542070 ?auto_542071 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542107 - BLOCK
      ?auto_542108 - BLOCK
      ?auto_542109 - BLOCK
      ?auto_542110 - BLOCK
      ?auto_542111 - BLOCK
      ?auto_542112 - BLOCK
      ?auto_542113 - BLOCK
      ?auto_542114 - BLOCK
      ?auto_542115 - BLOCK
      ?auto_542116 - BLOCK
      ?auto_542117 - BLOCK
    )
    :vars
    (
      ?auto_542118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542117 ?auto_542118 ) ( ON-TABLE ?auto_542107 ) ( ON ?auto_542108 ?auto_542107 ) ( ON ?auto_542109 ?auto_542108 ) ( ON ?auto_542110 ?auto_542109 ) ( ON ?auto_542111 ?auto_542110 ) ( not ( = ?auto_542107 ?auto_542108 ) ) ( not ( = ?auto_542107 ?auto_542109 ) ) ( not ( = ?auto_542107 ?auto_542110 ) ) ( not ( = ?auto_542107 ?auto_542111 ) ) ( not ( = ?auto_542107 ?auto_542112 ) ) ( not ( = ?auto_542107 ?auto_542113 ) ) ( not ( = ?auto_542107 ?auto_542114 ) ) ( not ( = ?auto_542107 ?auto_542115 ) ) ( not ( = ?auto_542107 ?auto_542116 ) ) ( not ( = ?auto_542107 ?auto_542117 ) ) ( not ( = ?auto_542107 ?auto_542118 ) ) ( not ( = ?auto_542108 ?auto_542109 ) ) ( not ( = ?auto_542108 ?auto_542110 ) ) ( not ( = ?auto_542108 ?auto_542111 ) ) ( not ( = ?auto_542108 ?auto_542112 ) ) ( not ( = ?auto_542108 ?auto_542113 ) ) ( not ( = ?auto_542108 ?auto_542114 ) ) ( not ( = ?auto_542108 ?auto_542115 ) ) ( not ( = ?auto_542108 ?auto_542116 ) ) ( not ( = ?auto_542108 ?auto_542117 ) ) ( not ( = ?auto_542108 ?auto_542118 ) ) ( not ( = ?auto_542109 ?auto_542110 ) ) ( not ( = ?auto_542109 ?auto_542111 ) ) ( not ( = ?auto_542109 ?auto_542112 ) ) ( not ( = ?auto_542109 ?auto_542113 ) ) ( not ( = ?auto_542109 ?auto_542114 ) ) ( not ( = ?auto_542109 ?auto_542115 ) ) ( not ( = ?auto_542109 ?auto_542116 ) ) ( not ( = ?auto_542109 ?auto_542117 ) ) ( not ( = ?auto_542109 ?auto_542118 ) ) ( not ( = ?auto_542110 ?auto_542111 ) ) ( not ( = ?auto_542110 ?auto_542112 ) ) ( not ( = ?auto_542110 ?auto_542113 ) ) ( not ( = ?auto_542110 ?auto_542114 ) ) ( not ( = ?auto_542110 ?auto_542115 ) ) ( not ( = ?auto_542110 ?auto_542116 ) ) ( not ( = ?auto_542110 ?auto_542117 ) ) ( not ( = ?auto_542110 ?auto_542118 ) ) ( not ( = ?auto_542111 ?auto_542112 ) ) ( not ( = ?auto_542111 ?auto_542113 ) ) ( not ( = ?auto_542111 ?auto_542114 ) ) ( not ( = ?auto_542111 ?auto_542115 ) ) ( not ( = ?auto_542111 ?auto_542116 ) ) ( not ( = ?auto_542111 ?auto_542117 ) ) ( not ( = ?auto_542111 ?auto_542118 ) ) ( not ( = ?auto_542112 ?auto_542113 ) ) ( not ( = ?auto_542112 ?auto_542114 ) ) ( not ( = ?auto_542112 ?auto_542115 ) ) ( not ( = ?auto_542112 ?auto_542116 ) ) ( not ( = ?auto_542112 ?auto_542117 ) ) ( not ( = ?auto_542112 ?auto_542118 ) ) ( not ( = ?auto_542113 ?auto_542114 ) ) ( not ( = ?auto_542113 ?auto_542115 ) ) ( not ( = ?auto_542113 ?auto_542116 ) ) ( not ( = ?auto_542113 ?auto_542117 ) ) ( not ( = ?auto_542113 ?auto_542118 ) ) ( not ( = ?auto_542114 ?auto_542115 ) ) ( not ( = ?auto_542114 ?auto_542116 ) ) ( not ( = ?auto_542114 ?auto_542117 ) ) ( not ( = ?auto_542114 ?auto_542118 ) ) ( not ( = ?auto_542115 ?auto_542116 ) ) ( not ( = ?auto_542115 ?auto_542117 ) ) ( not ( = ?auto_542115 ?auto_542118 ) ) ( not ( = ?auto_542116 ?auto_542117 ) ) ( not ( = ?auto_542116 ?auto_542118 ) ) ( not ( = ?auto_542117 ?auto_542118 ) ) ( ON ?auto_542116 ?auto_542117 ) ( ON ?auto_542115 ?auto_542116 ) ( ON ?auto_542114 ?auto_542115 ) ( ON ?auto_542113 ?auto_542114 ) ( CLEAR ?auto_542111 ) ( ON ?auto_542112 ?auto_542113 ) ( CLEAR ?auto_542112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_542107 ?auto_542108 ?auto_542109 ?auto_542110 ?auto_542111 ?auto_542112 )
      ( MAKE-11PILE ?auto_542107 ?auto_542108 ?auto_542109 ?auto_542110 ?auto_542111 ?auto_542112 ?auto_542113 ?auto_542114 ?auto_542115 ?auto_542116 ?auto_542117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542153 - BLOCK
      ?auto_542154 - BLOCK
      ?auto_542155 - BLOCK
      ?auto_542156 - BLOCK
      ?auto_542157 - BLOCK
      ?auto_542158 - BLOCK
      ?auto_542159 - BLOCK
      ?auto_542160 - BLOCK
      ?auto_542161 - BLOCK
      ?auto_542162 - BLOCK
      ?auto_542163 - BLOCK
    )
    :vars
    (
      ?auto_542164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542163 ?auto_542164 ) ( ON-TABLE ?auto_542153 ) ( ON ?auto_542154 ?auto_542153 ) ( ON ?auto_542155 ?auto_542154 ) ( ON ?auto_542156 ?auto_542155 ) ( not ( = ?auto_542153 ?auto_542154 ) ) ( not ( = ?auto_542153 ?auto_542155 ) ) ( not ( = ?auto_542153 ?auto_542156 ) ) ( not ( = ?auto_542153 ?auto_542157 ) ) ( not ( = ?auto_542153 ?auto_542158 ) ) ( not ( = ?auto_542153 ?auto_542159 ) ) ( not ( = ?auto_542153 ?auto_542160 ) ) ( not ( = ?auto_542153 ?auto_542161 ) ) ( not ( = ?auto_542153 ?auto_542162 ) ) ( not ( = ?auto_542153 ?auto_542163 ) ) ( not ( = ?auto_542153 ?auto_542164 ) ) ( not ( = ?auto_542154 ?auto_542155 ) ) ( not ( = ?auto_542154 ?auto_542156 ) ) ( not ( = ?auto_542154 ?auto_542157 ) ) ( not ( = ?auto_542154 ?auto_542158 ) ) ( not ( = ?auto_542154 ?auto_542159 ) ) ( not ( = ?auto_542154 ?auto_542160 ) ) ( not ( = ?auto_542154 ?auto_542161 ) ) ( not ( = ?auto_542154 ?auto_542162 ) ) ( not ( = ?auto_542154 ?auto_542163 ) ) ( not ( = ?auto_542154 ?auto_542164 ) ) ( not ( = ?auto_542155 ?auto_542156 ) ) ( not ( = ?auto_542155 ?auto_542157 ) ) ( not ( = ?auto_542155 ?auto_542158 ) ) ( not ( = ?auto_542155 ?auto_542159 ) ) ( not ( = ?auto_542155 ?auto_542160 ) ) ( not ( = ?auto_542155 ?auto_542161 ) ) ( not ( = ?auto_542155 ?auto_542162 ) ) ( not ( = ?auto_542155 ?auto_542163 ) ) ( not ( = ?auto_542155 ?auto_542164 ) ) ( not ( = ?auto_542156 ?auto_542157 ) ) ( not ( = ?auto_542156 ?auto_542158 ) ) ( not ( = ?auto_542156 ?auto_542159 ) ) ( not ( = ?auto_542156 ?auto_542160 ) ) ( not ( = ?auto_542156 ?auto_542161 ) ) ( not ( = ?auto_542156 ?auto_542162 ) ) ( not ( = ?auto_542156 ?auto_542163 ) ) ( not ( = ?auto_542156 ?auto_542164 ) ) ( not ( = ?auto_542157 ?auto_542158 ) ) ( not ( = ?auto_542157 ?auto_542159 ) ) ( not ( = ?auto_542157 ?auto_542160 ) ) ( not ( = ?auto_542157 ?auto_542161 ) ) ( not ( = ?auto_542157 ?auto_542162 ) ) ( not ( = ?auto_542157 ?auto_542163 ) ) ( not ( = ?auto_542157 ?auto_542164 ) ) ( not ( = ?auto_542158 ?auto_542159 ) ) ( not ( = ?auto_542158 ?auto_542160 ) ) ( not ( = ?auto_542158 ?auto_542161 ) ) ( not ( = ?auto_542158 ?auto_542162 ) ) ( not ( = ?auto_542158 ?auto_542163 ) ) ( not ( = ?auto_542158 ?auto_542164 ) ) ( not ( = ?auto_542159 ?auto_542160 ) ) ( not ( = ?auto_542159 ?auto_542161 ) ) ( not ( = ?auto_542159 ?auto_542162 ) ) ( not ( = ?auto_542159 ?auto_542163 ) ) ( not ( = ?auto_542159 ?auto_542164 ) ) ( not ( = ?auto_542160 ?auto_542161 ) ) ( not ( = ?auto_542160 ?auto_542162 ) ) ( not ( = ?auto_542160 ?auto_542163 ) ) ( not ( = ?auto_542160 ?auto_542164 ) ) ( not ( = ?auto_542161 ?auto_542162 ) ) ( not ( = ?auto_542161 ?auto_542163 ) ) ( not ( = ?auto_542161 ?auto_542164 ) ) ( not ( = ?auto_542162 ?auto_542163 ) ) ( not ( = ?auto_542162 ?auto_542164 ) ) ( not ( = ?auto_542163 ?auto_542164 ) ) ( ON ?auto_542162 ?auto_542163 ) ( ON ?auto_542161 ?auto_542162 ) ( ON ?auto_542160 ?auto_542161 ) ( ON ?auto_542159 ?auto_542160 ) ( ON ?auto_542158 ?auto_542159 ) ( CLEAR ?auto_542156 ) ( ON ?auto_542157 ?auto_542158 ) ( CLEAR ?auto_542157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_542153 ?auto_542154 ?auto_542155 ?auto_542156 ?auto_542157 )
      ( MAKE-11PILE ?auto_542153 ?auto_542154 ?auto_542155 ?auto_542156 ?auto_542157 ?auto_542158 ?auto_542159 ?auto_542160 ?auto_542161 ?auto_542162 ?auto_542163 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542199 - BLOCK
      ?auto_542200 - BLOCK
      ?auto_542201 - BLOCK
      ?auto_542202 - BLOCK
      ?auto_542203 - BLOCK
      ?auto_542204 - BLOCK
      ?auto_542205 - BLOCK
      ?auto_542206 - BLOCK
      ?auto_542207 - BLOCK
      ?auto_542208 - BLOCK
      ?auto_542209 - BLOCK
    )
    :vars
    (
      ?auto_542210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542209 ?auto_542210 ) ( ON-TABLE ?auto_542199 ) ( ON ?auto_542200 ?auto_542199 ) ( ON ?auto_542201 ?auto_542200 ) ( not ( = ?auto_542199 ?auto_542200 ) ) ( not ( = ?auto_542199 ?auto_542201 ) ) ( not ( = ?auto_542199 ?auto_542202 ) ) ( not ( = ?auto_542199 ?auto_542203 ) ) ( not ( = ?auto_542199 ?auto_542204 ) ) ( not ( = ?auto_542199 ?auto_542205 ) ) ( not ( = ?auto_542199 ?auto_542206 ) ) ( not ( = ?auto_542199 ?auto_542207 ) ) ( not ( = ?auto_542199 ?auto_542208 ) ) ( not ( = ?auto_542199 ?auto_542209 ) ) ( not ( = ?auto_542199 ?auto_542210 ) ) ( not ( = ?auto_542200 ?auto_542201 ) ) ( not ( = ?auto_542200 ?auto_542202 ) ) ( not ( = ?auto_542200 ?auto_542203 ) ) ( not ( = ?auto_542200 ?auto_542204 ) ) ( not ( = ?auto_542200 ?auto_542205 ) ) ( not ( = ?auto_542200 ?auto_542206 ) ) ( not ( = ?auto_542200 ?auto_542207 ) ) ( not ( = ?auto_542200 ?auto_542208 ) ) ( not ( = ?auto_542200 ?auto_542209 ) ) ( not ( = ?auto_542200 ?auto_542210 ) ) ( not ( = ?auto_542201 ?auto_542202 ) ) ( not ( = ?auto_542201 ?auto_542203 ) ) ( not ( = ?auto_542201 ?auto_542204 ) ) ( not ( = ?auto_542201 ?auto_542205 ) ) ( not ( = ?auto_542201 ?auto_542206 ) ) ( not ( = ?auto_542201 ?auto_542207 ) ) ( not ( = ?auto_542201 ?auto_542208 ) ) ( not ( = ?auto_542201 ?auto_542209 ) ) ( not ( = ?auto_542201 ?auto_542210 ) ) ( not ( = ?auto_542202 ?auto_542203 ) ) ( not ( = ?auto_542202 ?auto_542204 ) ) ( not ( = ?auto_542202 ?auto_542205 ) ) ( not ( = ?auto_542202 ?auto_542206 ) ) ( not ( = ?auto_542202 ?auto_542207 ) ) ( not ( = ?auto_542202 ?auto_542208 ) ) ( not ( = ?auto_542202 ?auto_542209 ) ) ( not ( = ?auto_542202 ?auto_542210 ) ) ( not ( = ?auto_542203 ?auto_542204 ) ) ( not ( = ?auto_542203 ?auto_542205 ) ) ( not ( = ?auto_542203 ?auto_542206 ) ) ( not ( = ?auto_542203 ?auto_542207 ) ) ( not ( = ?auto_542203 ?auto_542208 ) ) ( not ( = ?auto_542203 ?auto_542209 ) ) ( not ( = ?auto_542203 ?auto_542210 ) ) ( not ( = ?auto_542204 ?auto_542205 ) ) ( not ( = ?auto_542204 ?auto_542206 ) ) ( not ( = ?auto_542204 ?auto_542207 ) ) ( not ( = ?auto_542204 ?auto_542208 ) ) ( not ( = ?auto_542204 ?auto_542209 ) ) ( not ( = ?auto_542204 ?auto_542210 ) ) ( not ( = ?auto_542205 ?auto_542206 ) ) ( not ( = ?auto_542205 ?auto_542207 ) ) ( not ( = ?auto_542205 ?auto_542208 ) ) ( not ( = ?auto_542205 ?auto_542209 ) ) ( not ( = ?auto_542205 ?auto_542210 ) ) ( not ( = ?auto_542206 ?auto_542207 ) ) ( not ( = ?auto_542206 ?auto_542208 ) ) ( not ( = ?auto_542206 ?auto_542209 ) ) ( not ( = ?auto_542206 ?auto_542210 ) ) ( not ( = ?auto_542207 ?auto_542208 ) ) ( not ( = ?auto_542207 ?auto_542209 ) ) ( not ( = ?auto_542207 ?auto_542210 ) ) ( not ( = ?auto_542208 ?auto_542209 ) ) ( not ( = ?auto_542208 ?auto_542210 ) ) ( not ( = ?auto_542209 ?auto_542210 ) ) ( ON ?auto_542208 ?auto_542209 ) ( ON ?auto_542207 ?auto_542208 ) ( ON ?auto_542206 ?auto_542207 ) ( ON ?auto_542205 ?auto_542206 ) ( ON ?auto_542204 ?auto_542205 ) ( ON ?auto_542203 ?auto_542204 ) ( CLEAR ?auto_542201 ) ( ON ?auto_542202 ?auto_542203 ) ( CLEAR ?auto_542202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_542199 ?auto_542200 ?auto_542201 ?auto_542202 )
      ( MAKE-11PILE ?auto_542199 ?auto_542200 ?auto_542201 ?auto_542202 ?auto_542203 ?auto_542204 ?auto_542205 ?auto_542206 ?auto_542207 ?auto_542208 ?auto_542209 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542245 - BLOCK
      ?auto_542246 - BLOCK
      ?auto_542247 - BLOCK
      ?auto_542248 - BLOCK
      ?auto_542249 - BLOCK
      ?auto_542250 - BLOCK
      ?auto_542251 - BLOCK
      ?auto_542252 - BLOCK
      ?auto_542253 - BLOCK
      ?auto_542254 - BLOCK
      ?auto_542255 - BLOCK
    )
    :vars
    (
      ?auto_542256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542255 ?auto_542256 ) ( ON-TABLE ?auto_542245 ) ( ON ?auto_542246 ?auto_542245 ) ( not ( = ?auto_542245 ?auto_542246 ) ) ( not ( = ?auto_542245 ?auto_542247 ) ) ( not ( = ?auto_542245 ?auto_542248 ) ) ( not ( = ?auto_542245 ?auto_542249 ) ) ( not ( = ?auto_542245 ?auto_542250 ) ) ( not ( = ?auto_542245 ?auto_542251 ) ) ( not ( = ?auto_542245 ?auto_542252 ) ) ( not ( = ?auto_542245 ?auto_542253 ) ) ( not ( = ?auto_542245 ?auto_542254 ) ) ( not ( = ?auto_542245 ?auto_542255 ) ) ( not ( = ?auto_542245 ?auto_542256 ) ) ( not ( = ?auto_542246 ?auto_542247 ) ) ( not ( = ?auto_542246 ?auto_542248 ) ) ( not ( = ?auto_542246 ?auto_542249 ) ) ( not ( = ?auto_542246 ?auto_542250 ) ) ( not ( = ?auto_542246 ?auto_542251 ) ) ( not ( = ?auto_542246 ?auto_542252 ) ) ( not ( = ?auto_542246 ?auto_542253 ) ) ( not ( = ?auto_542246 ?auto_542254 ) ) ( not ( = ?auto_542246 ?auto_542255 ) ) ( not ( = ?auto_542246 ?auto_542256 ) ) ( not ( = ?auto_542247 ?auto_542248 ) ) ( not ( = ?auto_542247 ?auto_542249 ) ) ( not ( = ?auto_542247 ?auto_542250 ) ) ( not ( = ?auto_542247 ?auto_542251 ) ) ( not ( = ?auto_542247 ?auto_542252 ) ) ( not ( = ?auto_542247 ?auto_542253 ) ) ( not ( = ?auto_542247 ?auto_542254 ) ) ( not ( = ?auto_542247 ?auto_542255 ) ) ( not ( = ?auto_542247 ?auto_542256 ) ) ( not ( = ?auto_542248 ?auto_542249 ) ) ( not ( = ?auto_542248 ?auto_542250 ) ) ( not ( = ?auto_542248 ?auto_542251 ) ) ( not ( = ?auto_542248 ?auto_542252 ) ) ( not ( = ?auto_542248 ?auto_542253 ) ) ( not ( = ?auto_542248 ?auto_542254 ) ) ( not ( = ?auto_542248 ?auto_542255 ) ) ( not ( = ?auto_542248 ?auto_542256 ) ) ( not ( = ?auto_542249 ?auto_542250 ) ) ( not ( = ?auto_542249 ?auto_542251 ) ) ( not ( = ?auto_542249 ?auto_542252 ) ) ( not ( = ?auto_542249 ?auto_542253 ) ) ( not ( = ?auto_542249 ?auto_542254 ) ) ( not ( = ?auto_542249 ?auto_542255 ) ) ( not ( = ?auto_542249 ?auto_542256 ) ) ( not ( = ?auto_542250 ?auto_542251 ) ) ( not ( = ?auto_542250 ?auto_542252 ) ) ( not ( = ?auto_542250 ?auto_542253 ) ) ( not ( = ?auto_542250 ?auto_542254 ) ) ( not ( = ?auto_542250 ?auto_542255 ) ) ( not ( = ?auto_542250 ?auto_542256 ) ) ( not ( = ?auto_542251 ?auto_542252 ) ) ( not ( = ?auto_542251 ?auto_542253 ) ) ( not ( = ?auto_542251 ?auto_542254 ) ) ( not ( = ?auto_542251 ?auto_542255 ) ) ( not ( = ?auto_542251 ?auto_542256 ) ) ( not ( = ?auto_542252 ?auto_542253 ) ) ( not ( = ?auto_542252 ?auto_542254 ) ) ( not ( = ?auto_542252 ?auto_542255 ) ) ( not ( = ?auto_542252 ?auto_542256 ) ) ( not ( = ?auto_542253 ?auto_542254 ) ) ( not ( = ?auto_542253 ?auto_542255 ) ) ( not ( = ?auto_542253 ?auto_542256 ) ) ( not ( = ?auto_542254 ?auto_542255 ) ) ( not ( = ?auto_542254 ?auto_542256 ) ) ( not ( = ?auto_542255 ?auto_542256 ) ) ( ON ?auto_542254 ?auto_542255 ) ( ON ?auto_542253 ?auto_542254 ) ( ON ?auto_542252 ?auto_542253 ) ( ON ?auto_542251 ?auto_542252 ) ( ON ?auto_542250 ?auto_542251 ) ( ON ?auto_542249 ?auto_542250 ) ( ON ?auto_542248 ?auto_542249 ) ( CLEAR ?auto_542246 ) ( ON ?auto_542247 ?auto_542248 ) ( CLEAR ?auto_542247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_542245 ?auto_542246 ?auto_542247 )
      ( MAKE-11PILE ?auto_542245 ?auto_542246 ?auto_542247 ?auto_542248 ?auto_542249 ?auto_542250 ?auto_542251 ?auto_542252 ?auto_542253 ?auto_542254 ?auto_542255 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542291 - BLOCK
      ?auto_542292 - BLOCK
      ?auto_542293 - BLOCK
      ?auto_542294 - BLOCK
      ?auto_542295 - BLOCK
      ?auto_542296 - BLOCK
      ?auto_542297 - BLOCK
      ?auto_542298 - BLOCK
      ?auto_542299 - BLOCK
      ?auto_542300 - BLOCK
      ?auto_542301 - BLOCK
    )
    :vars
    (
      ?auto_542302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542301 ?auto_542302 ) ( ON-TABLE ?auto_542291 ) ( not ( = ?auto_542291 ?auto_542292 ) ) ( not ( = ?auto_542291 ?auto_542293 ) ) ( not ( = ?auto_542291 ?auto_542294 ) ) ( not ( = ?auto_542291 ?auto_542295 ) ) ( not ( = ?auto_542291 ?auto_542296 ) ) ( not ( = ?auto_542291 ?auto_542297 ) ) ( not ( = ?auto_542291 ?auto_542298 ) ) ( not ( = ?auto_542291 ?auto_542299 ) ) ( not ( = ?auto_542291 ?auto_542300 ) ) ( not ( = ?auto_542291 ?auto_542301 ) ) ( not ( = ?auto_542291 ?auto_542302 ) ) ( not ( = ?auto_542292 ?auto_542293 ) ) ( not ( = ?auto_542292 ?auto_542294 ) ) ( not ( = ?auto_542292 ?auto_542295 ) ) ( not ( = ?auto_542292 ?auto_542296 ) ) ( not ( = ?auto_542292 ?auto_542297 ) ) ( not ( = ?auto_542292 ?auto_542298 ) ) ( not ( = ?auto_542292 ?auto_542299 ) ) ( not ( = ?auto_542292 ?auto_542300 ) ) ( not ( = ?auto_542292 ?auto_542301 ) ) ( not ( = ?auto_542292 ?auto_542302 ) ) ( not ( = ?auto_542293 ?auto_542294 ) ) ( not ( = ?auto_542293 ?auto_542295 ) ) ( not ( = ?auto_542293 ?auto_542296 ) ) ( not ( = ?auto_542293 ?auto_542297 ) ) ( not ( = ?auto_542293 ?auto_542298 ) ) ( not ( = ?auto_542293 ?auto_542299 ) ) ( not ( = ?auto_542293 ?auto_542300 ) ) ( not ( = ?auto_542293 ?auto_542301 ) ) ( not ( = ?auto_542293 ?auto_542302 ) ) ( not ( = ?auto_542294 ?auto_542295 ) ) ( not ( = ?auto_542294 ?auto_542296 ) ) ( not ( = ?auto_542294 ?auto_542297 ) ) ( not ( = ?auto_542294 ?auto_542298 ) ) ( not ( = ?auto_542294 ?auto_542299 ) ) ( not ( = ?auto_542294 ?auto_542300 ) ) ( not ( = ?auto_542294 ?auto_542301 ) ) ( not ( = ?auto_542294 ?auto_542302 ) ) ( not ( = ?auto_542295 ?auto_542296 ) ) ( not ( = ?auto_542295 ?auto_542297 ) ) ( not ( = ?auto_542295 ?auto_542298 ) ) ( not ( = ?auto_542295 ?auto_542299 ) ) ( not ( = ?auto_542295 ?auto_542300 ) ) ( not ( = ?auto_542295 ?auto_542301 ) ) ( not ( = ?auto_542295 ?auto_542302 ) ) ( not ( = ?auto_542296 ?auto_542297 ) ) ( not ( = ?auto_542296 ?auto_542298 ) ) ( not ( = ?auto_542296 ?auto_542299 ) ) ( not ( = ?auto_542296 ?auto_542300 ) ) ( not ( = ?auto_542296 ?auto_542301 ) ) ( not ( = ?auto_542296 ?auto_542302 ) ) ( not ( = ?auto_542297 ?auto_542298 ) ) ( not ( = ?auto_542297 ?auto_542299 ) ) ( not ( = ?auto_542297 ?auto_542300 ) ) ( not ( = ?auto_542297 ?auto_542301 ) ) ( not ( = ?auto_542297 ?auto_542302 ) ) ( not ( = ?auto_542298 ?auto_542299 ) ) ( not ( = ?auto_542298 ?auto_542300 ) ) ( not ( = ?auto_542298 ?auto_542301 ) ) ( not ( = ?auto_542298 ?auto_542302 ) ) ( not ( = ?auto_542299 ?auto_542300 ) ) ( not ( = ?auto_542299 ?auto_542301 ) ) ( not ( = ?auto_542299 ?auto_542302 ) ) ( not ( = ?auto_542300 ?auto_542301 ) ) ( not ( = ?auto_542300 ?auto_542302 ) ) ( not ( = ?auto_542301 ?auto_542302 ) ) ( ON ?auto_542300 ?auto_542301 ) ( ON ?auto_542299 ?auto_542300 ) ( ON ?auto_542298 ?auto_542299 ) ( ON ?auto_542297 ?auto_542298 ) ( ON ?auto_542296 ?auto_542297 ) ( ON ?auto_542295 ?auto_542296 ) ( ON ?auto_542294 ?auto_542295 ) ( ON ?auto_542293 ?auto_542294 ) ( CLEAR ?auto_542291 ) ( ON ?auto_542292 ?auto_542293 ) ( CLEAR ?auto_542292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_542291 ?auto_542292 )
      ( MAKE-11PILE ?auto_542291 ?auto_542292 ?auto_542293 ?auto_542294 ?auto_542295 ?auto_542296 ?auto_542297 ?auto_542298 ?auto_542299 ?auto_542300 ?auto_542301 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_542337 - BLOCK
      ?auto_542338 - BLOCK
      ?auto_542339 - BLOCK
      ?auto_542340 - BLOCK
      ?auto_542341 - BLOCK
      ?auto_542342 - BLOCK
      ?auto_542343 - BLOCK
      ?auto_542344 - BLOCK
      ?auto_542345 - BLOCK
      ?auto_542346 - BLOCK
      ?auto_542347 - BLOCK
    )
    :vars
    (
      ?auto_542348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542347 ?auto_542348 ) ( not ( = ?auto_542337 ?auto_542338 ) ) ( not ( = ?auto_542337 ?auto_542339 ) ) ( not ( = ?auto_542337 ?auto_542340 ) ) ( not ( = ?auto_542337 ?auto_542341 ) ) ( not ( = ?auto_542337 ?auto_542342 ) ) ( not ( = ?auto_542337 ?auto_542343 ) ) ( not ( = ?auto_542337 ?auto_542344 ) ) ( not ( = ?auto_542337 ?auto_542345 ) ) ( not ( = ?auto_542337 ?auto_542346 ) ) ( not ( = ?auto_542337 ?auto_542347 ) ) ( not ( = ?auto_542337 ?auto_542348 ) ) ( not ( = ?auto_542338 ?auto_542339 ) ) ( not ( = ?auto_542338 ?auto_542340 ) ) ( not ( = ?auto_542338 ?auto_542341 ) ) ( not ( = ?auto_542338 ?auto_542342 ) ) ( not ( = ?auto_542338 ?auto_542343 ) ) ( not ( = ?auto_542338 ?auto_542344 ) ) ( not ( = ?auto_542338 ?auto_542345 ) ) ( not ( = ?auto_542338 ?auto_542346 ) ) ( not ( = ?auto_542338 ?auto_542347 ) ) ( not ( = ?auto_542338 ?auto_542348 ) ) ( not ( = ?auto_542339 ?auto_542340 ) ) ( not ( = ?auto_542339 ?auto_542341 ) ) ( not ( = ?auto_542339 ?auto_542342 ) ) ( not ( = ?auto_542339 ?auto_542343 ) ) ( not ( = ?auto_542339 ?auto_542344 ) ) ( not ( = ?auto_542339 ?auto_542345 ) ) ( not ( = ?auto_542339 ?auto_542346 ) ) ( not ( = ?auto_542339 ?auto_542347 ) ) ( not ( = ?auto_542339 ?auto_542348 ) ) ( not ( = ?auto_542340 ?auto_542341 ) ) ( not ( = ?auto_542340 ?auto_542342 ) ) ( not ( = ?auto_542340 ?auto_542343 ) ) ( not ( = ?auto_542340 ?auto_542344 ) ) ( not ( = ?auto_542340 ?auto_542345 ) ) ( not ( = ?auto_542340 ?auto_542346 ) ) ( not ( = ?auto_542340 ?auto_542347 ) ) ( not ( = ?auto_542340 ?auto_542348 ) ) ( not ( = ?auto_542341 ?auto_542342 ) ) ( not ( = ?auto_542341 ?auto_542343 ) ) ( not ( = ?auto_542341 ?auto_542344 ) ) ( not ( = ?auto_542341 ?auto_542345 ) ) ( not ( = ?auto_542341 ?auto_542346 ) ) ( not ( = ?auto_542341 ?auto_542347 ) ) ( not ( = ?auto_542341 ?auto_542348 ) ) ( not ( = ?auto_542342 ?auto_542343 ) ) ( not ( = ?auto_542342 ?auto_542344 ) ) ( not ( = ?auto_542342 ?auto_542345 ) ) ( not ( = ?auto_542342 ?auto_542346 ) ) ( not ( = ?auto_542342 ?auto_542347 ) ) ( not ( = ?auto_542342 ?auto_542348 ) ) ( not ( = ?auto_542343 ?auto_542344 ) ) ( not ( = ?auto_542343 ?auto_542345 ) ) ( not ( = ?auto_542343 ?auto_542346 ) ) ( not ( = ?auto_542343 ?auto_542347 ) ) ( not ( = ?auto_542343 ?auto_542348 ) ) ( not ( = ?auto_542344 ?auto_542345 ) ) ( not ( = ?auto_542344 ?auto_542346 ) ) ( not ( = ?auto_542344 ?auto_542347 ) ) ( not ( = ?auto_542344 ?auto_542348 ) ) ( not ( = ?auto_542345 ?auto_542346 ) ) ( not ( = ?auto_542345 ?auto_542347 ) ) ( not ( = ?auto_542345 ?auto_542348 ) ) ( not ( = ?auto_542346 ?auto_542347 ) ) ( not ( = ?auto_542346 ?auto_542348 ) ) ( not ( = ?auto_542347 ?auto_542348 ) ) ( ON ?auto_542346 ?auto_542347 ) ( ON ?auto_542345 ?auto_542346 ) ( ON ?auto_542344 ?auto_542345 ) ( ON ?auto_542343 ?auto_542344 ) ( ON ?auto_542342 ?auto_542343 ) ( ON ?auto_542341 ?auto_542342 ) ( ON ?auto_542340 ?auto_542341 ) ( ON ?auto_542339 ?auto_542340 ) ( ON ?auto_542338 ?auto_542339 ) ( ON ?auto_542337 ?auto_542338 ) ( CLEAR ?auto_542337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_542337 )
      ( MAKE-11PILE ?auto_542337 ?auto_542338 ?auto_542339 ?auto_542340 ?auto_542341 ?auto_542342 ?auto_542343 ?auto_542344 ?auto_542345 ?auto_542346 ?auto_542347 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542384 - BLOCK
      ?auto_542385 - BLOCK
      ?auto_542386 - BLOCK
      ?auto_542387 - BLOCK
      ?auto_542388 - BLOCK
      ?auto_542389 - BLOCK
      ?auto_542390 - BLOCK
      ?auto_542391 - BLOCK
      ?auto_542392 - BLOCK
      ?auto_542393 - BLOCK
      ?auto_542394 - BLOCK
      ?auto_542395 - BLOCK
    )
    :vars
    (
      ?auto_542396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_542394 ) ( ON ?auto_542395 ?auto_542396 ) ( CLEAR ?auto_542395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_542384 ) ( ON ?auto_542385 ?auto_542384 ) ( ON ?auto_542386 ?auto_542385 ) ( ON ?auto_542387 ?auto_542386 ) ( ON ?auto_542388 ?auto_542387 ) ( ON ?auto_542389 ?auto_542388 ) ( ON ?auto_542390 ?auto_542389 ) ( ON ?auto_542391 ?auto_542390 ) ( ON ?auto_542392 ?auto_542391 ) ( ON ?auto_542393 ?auto_542392 ) ( ON ?auto_542394 ?auto_542393 ) ( not ( = ?auto_542384 ?auto_542385 ) ) ( not ( = ?auto_542384 ?auto_542386 ) ) ( not ( = ?auto_542384 ?auto_542387 ) ) ( not ( = ?auto_542384 ?auto_542388 ) ) ( not ( = ?auto_542384 ?auto_542389 ) ) ( not ( = ?auto_542384 ?auto_542390 ) ) ( not ( = ?auto_542384 ?auto_542391 ) ) ( not ( = ?auto_542384 ?auto_542392 ) ) ( not ( = ?auto_542384 ?auto_542393 ) ) ( not ( = ?auto_542384 ?auto_542394 ) ) ( not ( = ?auto_542384 ?auto_542395 ) ) ( not ( = ?auto_542384 ?auto_542396 ) ) ( not ( = ?auto_542385 ?auto_542386 ) ) ( not ( = ?auto_542385 ?auto_542387 ) ) ( not ( = ?auto_542385 ?auto_542388 ) ) ( not ( = ?auto_542385 ?auto_542389 ) ) ( not ( = ?auto_542385 ?auto_542390 ) ) ( not ( = ?auto_542385 ?auto_542391 ) ) ( not ( = ?auto_542385 ?auto_542392 ) ) ( not ( = ?auto_542385 ?auto_542393 ) ) ( not ( = ?auto_542385 ?auto_542394 ) ) ( not ( = ?auto_542385 ?auto_542395 ) ) ( not ( = ?auto_542385 ?auto_542396 ) ) ( not ( = ?auto_542386 ?auto_542387 ) ) ( not ( = ?auto_542386 ?auto_542388 ) ) ( not ( = ?auto_542386 ?auto_542389 ) ) ( not ( = ?auto_542386 ?auto_542390 ) ) ( not ( = ?auto_542386 ?auto_542391 ) ) ( not ( = ?auto_542386 ?auto_542392 ) ) ( not ( = ?auto_542386 ?auto_542393 ) ) ( not ( = ?auto_542386 ?auto_542394 ) ) ( not ( = ?auto_542386 ?auto_542395 ) ) ( not ( = ?auto_542386 ?auto_542396 ) ) ( not ( = ?auto_542387 ?auto_542388 ) ) ( not ( = ?auto_542387 ?auto_542389 ) ) ( not ( = ?auto_542387 ?auto_542390 ) ) ( not ( = ?auto_542387 ?auto_542391 ) ) ( not ( = ?auto_542387 ?auto_542392 ) ) ( not ( = ?auto_542387 ?auto_542393 ) ) ( not ( = ?auto_542387 ?auto_542394 ) ) ( not ( = ?auto_542387 ?auto_542395 ) ) ( not ( = ?auto_542387 ?auto_542396 ) ) ( not ( = ?auto_542388 ?auto_542389 ) ) ( not ( = ?auto_542388 ?auto_542390 ) ) ( not ( = ?auto_542388 ?auto_542391 ) ) ( not ( = ?auto_542388 ?auto_542392 ) ) ( not ( = ?auto_542388 ?auto_542393 ) ) ( not ( = ?auto_542388 ?auto_542394 ) ) ( not ( = ?auto_542388 ?auto_542395 ) ) ( not ( = ?auto_542388 ?auto_542396 ) ) ( not ( = ?auto_542389 ?auto_542390 ) ) ( not ( = ?auto_542389 ?auto_542391 ) ) ( not ( = ?auto_542389 ?auto_542392 ) ) ( not ( = ?auto_542389 ?auto_542393 ) ) ( not ( = ?auto_542389 ?auto_542394 ) ) ( not ( = ?auto_542389 ?auto_542395 ) ) ( not ( = ?auto_542389 ?auto_542396 ) ) ( not ( = ?auto_542390 ?auto_542391 ) ) ( not ( = ?auto_542390 ?auto_542392 ) ) ( not ( = ?auto_542390 ?auto_542393 ) ) ( not ( = ?auto_542390 ?auto_542394 ) ) ( not ( = ?auto_542390 ?auto_542395 ) ) ( not ( = ?auto_542390 ?auto_542396 ) ) ( not ( = ?auto_542391 ?auto_542392 ) ) ( not ( = ?auto_542391 ?auto_542393 ) ) ( not ( = ?auto_542391 ?auto_542394 ) ) ( not ( = ?auto_542391 ?auto_542395 ) ) ( not ( = ?auto_542391 ?auto_542396 ) ) ( not ( = ?auto_542392 ?auto_542393 ) ) ( not ( = ?auto_542392 ?auto_542394 ) ) ( not ( = ?auto_542392 ?auto_542395 ) ) ( not ( = ?auto_542392 ?auto_542396 ) ) ( not ( = ?auto_542393 ?auto_542394 ) ) ( not ( = ?auto_542393 ?auto_542395 ) ) ( not ( = ?auto_542393 ?auto_542396 ) ) ( not ( = ?auto_542394 ?auto_542395 ) ) ( not ( = ?auto_542394 ?auto_542396 ) ) ( not ( = ?auto_542395 ?auto_542396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_542395 ?auto_542396 )
      ( !STACK ?auto_542395 ?auto_542394 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542434 - BLOCK
      ?auto_542435 - BLOCK
      ?auto_542436 - BLOCK
      ?auto_542437 - BLOCK
      ?auto_542438 - BLOCK
      ?auto_542439 - BLOCK
      ?auto_542440 - BLOCK
      ?auto_542441 - BLOCK
      ?auto_542442 - BLOCK
      ?auto_542443 - BLOCK
      ?auto_542444 - BLOCK
      ?auto_542445 - BLOCK
    )
    :vars
    (
      ?auto_542446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542445 ?auto_542446 ) ( ON-TABLE ?auto_542434 ) ( ON ?auto_542435 ?auto_542434 ) ( ON ?auto_542436 ?auto_542435 ) ( ON ?auto_542437 ?auto_542436 ) ( ON ?auto_542438 ?auto_542437 ) ( ON ?auto_542439 ?auto_542438 ) ( ON ?auto_542440 ?auto_542439 ) ( ON ?auto_542441 ?auto_542440 ) ( ON ?auto_542442 ?auto_542441 ) ( ON ?auto_542443 ?auto_542442 ) ( not ( = ?auto_542434 ?auto_542435 ) ) ( not ( = ?auto_542434 ?auto_542436 ) ) ( not ( = ?auto_542434 ?auto_542437 ) ) ( not ( = ?auto_542434 ?auto_542438 ) ) ( not ( = ?auto_542434 ?auto_542439 ) ) ( not ( = ?auto_542434 ?auto_542440 ) ) ( not ( = ?auto_542434 ?auto_542441 ) ) ( not ( = ?auto_542434 ?auto_542442 ) ) ( not ( = ?auto_542434 ?auto_542443 ) ) ( not ( = ?auto_542434 ?auto_542444 ) ) ( not ( = ?auto_542434 ?auto_542445 ) ) ( not ( = ?auto_542434 ?auto_542446 ) ) ( not ( = ?auto_542435 ?auto_542436 ) ) ( not ( = ?auto_542435 ?auto_542437 ) ) ( not ( = ?auto_542435 ?auto_542438 ) ) ( not ( = ?auto_542435 ?auto_542439 ) ) ( not ( = ?auto_542435 ?auto_542440 ) ) ( not ( = ?auto_542435 ?auto_542441 ) ) ( not ( = ?auto_542435 ?auto_542442 ) ) ( not ( = ?auto_542435 ?auto_542443 ) ) ( not ( = ?auto_542435 ?auto_542444 ) ) ( not ( = ?auto_542435 ?auto_542445 ) ) ( not ( = ?auto_542435 ?auto_542446 ) ) ( not ( = ?auto_542436 ?auto_542437 ) ) ( not ( = ?auto_542436 ?auto_542438 ) ) ( not ( = ?auto_542436 ?auto_542439 ) ) ( not ( = ?auto_542436 ?auto_542440 ) ) ( not ( = ?auto_542436 ?auto_542441 ) ) ( not ( = ?auto_542436 ?auto_542442 ) ) ( not ( = ?auto_542436 ?auto_542443 ) ) ( not ( = ?auto_542436 ?auto_542444 ) ) ( not ( = ?auto_542436 ?auto_542445 ) ) ( not ( = ?auto_542436 ?auto_542446 ) ) ( not ( = ?auto_542437 ?auto_542438 ) ) ( not ( = ?auto_542437 ?auto_542439 ) ) ( not ( = ?auto_542437 ?auto_542440 ) ) ( not ( = ?auto_542437 ?auto_542441 ) ) ( not ( = ?auto_542437 ?auto_542442 ) ) ( not ( = ?auto_542437 ?auto_542443 ) ) ( not ( = ?auto_542437 ?auto_542444 ) ) ( not ( = ?auto_542437 ?auto_542445 ) ) ( not ( = ?auto_542437 ?auto_542446 ) ) ( not ( = ?auto_542438 ?auto_542439 ) ) ( not ( = ?auto_542438 ?auto_542440 ) ) ( not ( = ?auto_542438 ?auto_542441 ) ) ( not ( = ?auto_542438 ?auto_542442 ) ) ( not ( = ?auto_542438 ?auto_542443 ) ) ( not ( = ?auto_542438 ?auto_542444 ) ) ( not ( = ?auto_542438 ?auto_542445 ) ) ( not ( = ?auto_542438 ?auto_542446 ) ) ( not ( = ?auto_542439 ?auto_542440 ) ) ( not ( = ?auto_542439 ?auto_542441 ) ) ( not ( = ?auto_542439 ?auto_542442 ) ) ( not ( = ?auto_542439 ?auto_542443 ) ) ( not ( = ?auto_542439 ?auto_542444 ) ) ( not ( = ?auto_542439 ?auto_542445 ) ) ( not ( = ?auto_542439 ?auto_542446 ) ) ( not ( = ?auto_542440 ?auto_542441 ) ) ( not ( = ?auto_542440 ?auto_542442 ) ) ( not ( = ?auto_542440 ?auto_542443 ) ) ( not ( = ?auto_542440 ?auto_542444 ) ) ( not ( = ?auto_542440 ?auto_542445 ) ) ( not ( = ?auto_542440 ?auto_542446 ) ) ( not ( = ?auto_542441 ?auto_542442 ) ) ( not ( = ?auto_542441 ?auto_542443 ) ) ( not ( = ?auto_542441 ?auto_542444 ) ) ( not ( = ?auto_542441 ?auto_542445 ) ) ( not ( = ?auto_542441 ?auto_542446 ) ) ( not ( = ?auto_542442 ?auto_542443 ) ) ( not ( = ?auto_542442 ?auto_542444 ) ) ( not ( = ?auto_542442 ?auto_542445 ) ) ( not ( = ?auto_542442 ?auto_542446 ) ) ( not ( = ?auto_542443 ?auto_542444 ) ) ( not ( = ?auto_542443 ?auto_542445 ) ) ( not ( = ?auto_542443 ?auto_542446 ) ) ( not ( = ?auto_542444 ?auto_542445 ) ) ( not ( = ?auto_542444 ?auto_542446 ) ) ( not ( = ?auto_542445 ?auto_542446 ) ) ( CLEAR ?auto_542443 ) ( ON ?auto_542444 ?auto_542445 ) ( CLEAR ?auto_542444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_542434 ?auto_542435 ?auto_542436 ?auto_542437 ?auto_542438 ?auto_542439 ?auto_542440 ?auto_542441 ?auto_542442 ?auto_542443 ?auto_542444 )
      ( MAKE-12PILE ?auto_542434 ?auto_542435 ?auto_542436 ?auto_542437 ?auto_542438 ?auto_542439 ?auto_542440 ?auto_542441 ?auto_542442 ?auto_542443 ?auto_542444 ?auto_542445 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542484 - BLOCK
      ?auto_542485 - BLOCK
      ?auto_542486 - BLOCK
      ?auto_542487 - BLOCK
      ?auto_542488 - BLOCK
      ?auto_542489 - BLOCK
      ?auto_542490 - BLOCK
      ?auto_542491 - BLOCK
      ?auto_542492 - BLOCK
      ?auto_542493 - BLOCK
      ?auto_542494 - BLOCK
      ?auto_542495 - BLOCK
    )
    :vars
    (
      ?auto_542496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542495 ?auto_542496 ) ( ON-TABLE ?auto_542484 ) ( ON ?auto_542485 ?auto_542484 ) ( ON ?auto_542486 ?auto_542485 ) ( ON ?auto_542487 ?auto_542486 ) ( ON ?auto_542488 ?auto_542487 ) ( ON ?auto_542489 ?auto_542488 ) ( ON ?auto_542490 ?auto_542489 ) ( ON ?auto_542491 ?auto_542490 ) ( ON ?auto_542492 ?auto_542491 ) ( not ( = ?auto_542484 ?auto_542485 ) ) ( not ( = ?auto_542484 ?auto_542486 ) ) ( not ( = ?auto_542484 ?auto_542487 ) ) ( not ( = ?auto_542484 ?auto_542488 ) ) ( not ( = ?auto_542484 ?auto_542489 ) ) ( not ( = ?auto_542484 ?auto_542490 ) ) ( not ( = ?auto_542484 ?auto_542491 ) ) ( not ( = ?auto_542484 ?auto_542492 ) ) ( not ( = ?auto_542484 ?auto_542493 ) ) ( not ( = ?auto_542484 ?auto_542494 ) ) ( not ( = ?auto_542484 ?auto_542495 ) ) ( not ( = ?auto_542484 ?auto_542496 ) ) ( not ( = ?auto_542485 ?auto_542486 ) ) ( not ( = ?auto_542485 ?auto_542487 ) ) ( not ( = ?auto_542485 ?auto_542488 ) ) ( not ( = ?auto_542485 ?auto_542489 ) ) ( not ( = ?auto_542485 ?auto_542490 ) ) ( not ( = ?auto_542485 ?auto_542491 ) ) ( not ( = ?auto_542485 ?auto_542492 ) ) ( not ( = ?auto_542485 ?auto_542493 ) ) ( not ( = ?auto_542485 ?auto_542494 ) ) ( not ( = ?auto_542485 ?auto_542495 ) ) ( not ( = ?auto_542485 ?auto_542496 ) ) ( not ( = ?auto_542486 ?auto_542487 ) ) ( not ( = ?auto_542486 ?auto_542488 ) ) ( not ( = ?auto_542486 ?auto_542489 ) ) ( not ( = ?auto_542486 ?auto_542490 ) ) ( not ( = ?auto_542486 ?auto_542491 ) ) ( not ( = ?auto_542486 ?auto_542492 ) ) ( not ( = ?auto_542486 ?auto_542493 ) ) ( not ( = ?auto_542486 ?auto_542494 ) ) ( not ( = ?auto_542486 ?auto_542495 ) ) ( not ( = ?auto_542486 ?auto_542496 ) ) ( not ( = ?auto_542487 ?auto_542488 ) ) ( not ( = ?auto_542487 ?auto_542489 ) ) ( not ( = ?auto_542487 ?auto_542490 ) ) ( not ( = ?auto_542487 ?auto_542491 ) ) ( not ( = ?auto_542487 ?auto_542492 ) ) ( not ( = ?auto_542487 ?auto_542493 ) ) ( not ( = ?auto_542487 ?auto_542494 ) ) ( not ( = ?auto_542487 ?auto_542495 ) ) ( not ( = ?auto_542487 ?auto_542496 ) ) ( not ( = ?auto_542488 ?auto_542489 ) ) ( not ( = ?auto_542488 ?auto_542490 ) ) ( not ( = ?auto_542488 ?auto_542491 ) ) ( not ( = ?auto_542488 ?auto_542492 ) ) ( not ( = ?auto_542488 ?auto_542493 ) ) ( not ( = ?auto_542488 ?auto_542494 ) ) ( not ( = ?auto_542488 ?auto_542495 ) ) ( not ( = ?auto_542488 ?auto_542496 ) ) ( not ( = ?auto_542489 ?auto_542490 ) ) ( not ( = ?auto_542489 ?auto_542491 ) ) ( not ( = ?auto_542489 ?auto_542492 ) ) ( not ( = ?auto_542489 ?auto_542493 ) ) ( not ( = ?auto_542489 ?auto_542494 ) ) ( not ( = ?auto_542489 ?auto_542495 ) ) ( not ( = ?auto_542489 ?auto_542496 ) ) ( not ( = ?auto_542490 ?auto_542491 ) ) ( not ( = ?auto_542490 ?auto_542492 ) ) ( not ( = ?auto_542490 ?auto_542493 ) ) ( not ( = ?auto_542490 ?auto_542494 ) ) ( not ( = ?auto_542490 ?auto_542495 ) ) ( not ( = ?auto_542490 ?auto_542496 ) ) ( not ( = ?auto_542491 ?auto_542492 ) ) ( not ( = ?auto_542491 ?auto_542493 ) ) ( not ( = ?auto_542491 ?auto_542494 ) ) ( not ( = ?auto_542491 ?auto_542495 ) ) ( not ( = ?auto_542491 ?auto_542496 ) ) ( not ( = ?auto_542492 ?auto_542493 ) ) ( not ( = ?auto_542492 ?auto_542494 ) ) ( not ( = ?auto_542492 ?auto_542495 ) ) ( not ( = ?auto_542492 ?auto_542496 ) ) ( not ( = ?auto_542493 ?auto_542494 ) ) ( not ( = ?auto_542493 ?auto_542495 ) ) ( not ( = ?auto_542493 ?auto_542496 ) ) ( not ( = ?auto_542494 ?auto_542495 ) ) ( not ( = ?auto_542494 ?auto_542496 ) ) ( not ( = ?auto_542495 ?auto_542496 ) ) ( ON ?auto_542494 ?auto_542495 ) ( CLEAR ?auto_542492 ) ( ON ?auto_542493 ?auto_542494 ) ( CLEAR ?auto_542493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_542484 ?auto_542485 ?auto_542486 ?auto_542487 ?auto_542488 ?auto_542489 ?auto_542490 ?auto_542491 ?auto_542492 ?auto_542493 )
      ( MAKE-12PILE ?auto_542484 ?auto_542485 ?auto_542486 ?auto_542487 ?auto_542488 ?auto_542489 ?auto_542490 ?auto_542491 ?auto_542492 ?auto_542493 ?auto_542494 ?auto_542495 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542534 - BLOCK
      ?auto_542535 - BLOCK
      ?auto_542536 - BLOCK
      ?auto_542537 - BLOCK
      ?auto_542538 - BLOCK
      ?auto_542539 - BLOCK
      ?auto_542540 - BLOCK
      ?auto_542541 - BLOCK
      ?auto_542542 - BLOCK
      ?auto_542543 - BLOCK
      ?auto_542544 - BLOCK
      ?auto_542545 - BLOCK
    )
    :vars
    (
      ?auto_542546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542545 ?auto_542546 ) ( ON-TABLE ?auto_542534 ) ( ON ?auto_542535 ?auto_542534 ) ( ON ?auto_542536 ?auto_542535 ) ( ON ?auto_542537 ?auto_542536 ) ( ON ?auto_542538 ?auto_542537 ) ( ON ?auto_542539 ?auto_542538 ) ( ON ?auto_542540 ?auto_542539 ) ( ON ?auto_542541 ?auto_542540 ) ( not ( = ?auto_542534 ?auto_542535 ) ) ( not ( = ?auto_542534 ?auto_542536 ) ) ( not ( = ?auto_542534 ?auto_542537 ) ) ( not ( = ?auto_542534 ?auto_542538 ) ) ( not ( = ?auto_542534 ?auto_542539 ) ) ( not ( = ?auto_542534 ?auto_542540 ) ) ( not ( = ?auto_542534 ?auto_542541 ) ) ( not ( = ?auto_542534 ?auto_542542 ) ) ( not ( = ?auto_542534 ?auto_542543 ) ) ( not ( = ?auto_542534 ?auto_542544 ) ) ( not ( = ?auto_542534 ?auto_542545 ) ) ( not ( = ?auto_542534 ?auto_542546 ) ) ( not ( = ?auto_542535 ?auto_542536 ) ) ( not ( = ?auto_542535 ?auto_542537 ) ) ( not ( = ?auto_542535 ?auto_542538 ) ) ( not ( = ?auto_542535 ?auto_542539 ) ) ( not ( = ?auto_542535 ?auto_542540 ) ) ( not ( = ?auto_542535 ?auto_542541 ) ) ( not ( = ?auto_542535 ?auto_542542 ) ) ( not ( = ?auto_542535 ?auto_542543 ) ) ( not ( = ?auto_542535 ?auto_542544 ) ) ( not ( = ?auto_542535 ?auto_542545 ) ) ( not ( = ?auto_542535 ?auto_542546 ) ) ( not ( = ?auto_542536 ?auto_542537 ) ) ( not ( = ?auto_542536 ?auto_542538 ) ) ( not ( = ?auto_542536 ?auto_542539 ) ) ( not ( = ?auto_542536 ?auto_542540 ) ) ( not ( = ?auto_542536 ?auto_542541 ) ) ( not ( = ?auto_542536 ?auto_542542 ) ) ( not ( = ?auto_542536 ?auto_542543 ) ) ( not ( = ?auto_542536 ?auto_542544 ) ) ( not ( = ?auto_542536 ?auto_542545 ) ) ( not ( = ?auto_542536 ?auto_542546 ) ) ( not ( = ?auto_542537 ?auto_542538 ) ) ( not ( = ?auto_542537 ?auto_542539 ) ) ( not ( = ?auto_542537 ?auto_542540 ) ) ( not ( = ?auto_542537 ?auto_542541 ) ) ( not ( = ?auto_542537 ?auto_542542 ) ) ( not ( = ?auto_542537 ?auto_542543 ) ) ( not ( = ?auto_542537 ?auto_542544 ) ) ( not ( = ?auto_542537 ?auto_542545 ) ) ( not ( = ?auto_542537 ?auto_542546 ) ) ( not ( = ?auto_542538 ?auto_542539 ) ) ( not ( = ?auto_542538 ?auto_542540 ) ) ( not ( = ?auto_542538 ?auto_542541 ) ) ( not ( = ?auto_542538 ?auto_542542 ) ) ( not ( = ?auto_542538 ?auto_542543 ) ) ( not ( = ?auto_542538 ?auto_542544 ) ) ( not ( = ?auto_542538 ?auto_542545 ) ) ( not ( = ?auto_542538 ?auto_542546 ) ) ( not ( = ?auto_542539 ?auto_542540 ) ) ( not ( = ?auto_542539 ?auto_542541 ) ) ( not ( = ?auto_542539 ?auto_542542 ) ) ( not ( = ?auto_542539 ?auto_542543 ) ) ( not ( = ?auto_542539 ?auto_542544 ) ) ( not ( = ?auto_542539 ?auto_542545 ) ) ( not ( = ?auto_542539 ?auto_542546 ) ) ( not ( = ?auto_542540 ?auto_542541 ) ) ( not ( = ?auto_542540 ?auto_542542 ) ) ( not ( = ?auto_542540 ?auto_542543 ) ) ( not ( = ?auto_542540 ?auto_542544 ) ) ( not ( = ?auto_542540 ?auto_542545 ) ) ( not ( = ?auto_542540 ?auto_542546 ) ) ( not ( = ?auto_542541 ?auto_542542 ) ) ( not ( = ?auto_542541 ?auto_542543 ) ) ( not ( = ?auto_542541 ?auto_542544 ) ) ( not ( = ?auto_542541 ?auto_542545 ) ) ( not ( = ?auto_542541 ?auto_542546 ) ) ( not ( = ?auto_542542 ?auto_542543 ) ) ( not ( = ?auto_542542 ?auto_542544 ) ) ( not ( = ?auto_542542 ?auto_542545 ) ) ( not ( = ?auto_542542 ?auto_542546 ) ) ( not ( = ?auto_542543 ?auto_542544 ) ) ( not ( = ?auto_542543 ?auto_542545 ) ) ( not ( = ?auto_542543 ?auto_542546 ) ) ( not ( = ?auto_542544 ?auto_542545 ) ) ( not ( = ?auto_542544 ?auto_542546 ) ) ( not ( = ?auto_542545 ?auto_542546 ) ) ( ON ?auto_542544 ?auto_542545 ) ( ON ?auto_542543 ?auto_542544 ) ( CLEAR ?auto_542541 ) ( ON ?auto_542542 ?auto_542543 ) ( CLEAR ?auto_542542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_542534 ?auto_542535 ?auto_542536 ?auto_542537 ?auto_542538 ?auto_542539 ?auto_542540 ?auto_542541 ?auto_542542 )
      ( MAKE-12PILE ?auto_542534 ?auto_542535 ?auto_542536 ?auto_542537 ?auto_542538 ?auto_542539 ?auto_542540 ?auto_542541 ?auto_542542 ?auto_542543 ?auto_542544 ?auto_542545 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542584 - BLOCK
      ?auto_542585 - BLOCK
      ?auto_542586 - BLOCK
      ?auto_542587 - BLOCK
      ?auto_542588 - BLOCK
      ?auto_542589 - BLOCK
      ?auto_542590 - BLOCK
      ?auto_542591 - BLOCK
      ?auto_542592 - BLOCK
      ?auto_542593 - BLOCK
      ?auto_542594 - BLOCK
      ?auto_542595 - BLOCK
    )
    :vars
    (
      ?auto_542596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542595 ?auto_542596 ) ( ON-TABLE ?auto_542584 ) ( ON ?auto_542585 ?auto_542584 ) ( ON ?auto_542586 ?auto_542585 ) ( ON ?auto_542587 ?auto_542586 ) ( ON ?auto_542588 ?auto_542587 ) ( ON ?auto_542589 ?auto_542588 ) ( ON ?auto_542590 ?auto_542589 ) ( not ( = ?auto_542584 ?auto_542585 ) ) ( not ( = ?auto_542584 ?auto_542586 ) ) ( not ( = ?auto_542584 ?auto_542587 ) ) ( not ( = ?auto_542584 ?auto_542588 ) ) ( not ( = ?auto_542584 ?auto_542589 ) ) ( not ( = ?auto_542584 ?auto_542590 ) ) ( not ( = ?auto_542584 ?auto_542591 ) ) ( not ( = ?auto_542584 ?auto_542592 ) ) ( not ( = ?auto_542584 ?auto_542593 ) ) ( not ( = ?auto_542584 ?auto_542594 ) ) ( not ( = ?auto_542584 ?auto_542595 ) ) ( not ( = ?auto_542584 ?auto_542596 ) ) ( not ( = ?auto_542585 ?auto_542586 ) ) ( not ( = ?auto_542585 ?auto_542587 ) ) ( not ( = ?auto_542585 ?auto_542588 ) ) ( not ( = ?auto_542585 ?auto_542589 ) ) ( not ( = ?auto_542585 ?auto_542590 ) ) ( not ( = ?auto_542585 ?auto_542591 ) ) ( not ( = ?auto_542585 ?auto_542592 ) ) ( not ( = ?auto_542585 ?auto_542593 ) ) ( not ( = ?auto_542585 ?auto_542594 ) ) ( not ( = ?auto_542585 ?auto_542595 ) ) ( not ( = ?auto_542585 ?auto_542596 ) ) ( not ( = ?auto_542586 ?auto_542587 ) ) ( not ( = ?auto_542586 ?auto_542588 ) ) ( not ( = ?auto_542586 ?auto_542589 ) ) ( not ( = ?auto_542586 ?auto_542590 ) ) ( not ( = ?auto_542586 ?auto_542591 ) ) ( not ( = ?auto_542586 ?auto_542592 ) ) ( not ( = ?auto_542586 ?auto_542593 ) ) ( not ( = ?auto_542586 ?auto_542594 ) ) ( not ( = ?auto_542586 ?auto_542595 ) ) ( not ( = ?auto_542586 ?auto_542596 ) ) ( not ( = ?auto_542587 ?auto_542588 ) ) ( not ( = ?auto_542587 ?auto_542589 ) ) ( not ( = ?auto_542587 ?auto_542590 ) ) ( not ( = ?auto_542587 ?auto_542591 ) ) ( not ( = ?auto_542587 ?auto_542592 ) ) ( not ( = ?auto_542587 ?auto_542593 ) ) ( not ( = ?auto_542587 ?auto_542594 ) ) ( not ( = ?auto_542587 ?auto_542595 ) ) ( not ( = ?auto_542587 ?auto_542596 ) ) ( not ( = ?auto_542588 ?auto_542589 ) ) ( not ( = ?auto_542588 ?auto_542590 ) ) ( not ( = ?auto_542588 ?auto_542591 ) ) ( not ( = ?auto_542588 ?auto_542592 ) ) ( not ( = ?auto_542588 ?auto_542593 ) ) ( not ( = ?auto_542588 ?auto_542594 ) ) ( not ( = ?auto_542588 ?auto_542595 ) ) ( not ( = ?auto_542588 ?auto_542596 ) ) ( not ( = ?auto_542589 ?auto_542590 ) ) ( not ( = ?auto_542589 ?auto_542591 ) ) ( not ( = ?auto_542589 ?auto_542592 ) ) ( not ( = ?auto_542589 ?auto_542593 ) ) ( not ( = ?auto_542589 ?auto_542594 ) ) ( not ( = ?auto_542589 ?auto_542595 ) ) ( not ( = ?auto_542589 ?auto_542596 ) ) ( not ( = ?auto_542590 ?auto_542591 ) ) ( not ( = ?auto_542590 ?auto_542592 ) ) ( not ( = ?auto_542590 ?auto_542593 ) ) ( not ( = ?auto_542590 ?auto_542594 ) ) ( not ( = ?auto_542590 ?auto_542595 ) ) ( not ( = ?auto_542590 ?auto_542596 ) ) ( not ( = ?auto_542591 ?auto_542592 ) ) ( not ( = ?auto_542591 ?auto_542593 ) ) ( not ( = ?auto_542591 ?auto_542594 ) ) ( not ( = ?auto_542591 ?auto_542595 ) ) ( not ( = ?auto_542591 ?auto_542596 ) ) ( not ( = ?auto_542592 ?auto_542593 ) ) ( not ( = ?auto_542592 ?auto_542594 ) ) ( not ( = ?auto_542592 ?auto_542595 ) ) ( not ( = ?auto_542592 ?auto_542596 ) ) ( not ( = ?auto_542593 ?auto_542594 ) ) ( not ( = ?auto_542593 ?auto_542595 ) ) ( not ( = ?auto_542593 ?auto_542596 ) ) ( not ( = ?auto_542594 ?auto_542595 ) ) ( not ( = ?auto_542594 ?auto_542596 ) ) ( not ( = ?auto_542595 ?auto_542596 ) ) ( ON ?auto_542594 ?auto_542595 ) ( ON ?auto_542593 ?auto_542594 ) ( ON ?auto_542592 ?auto_542593 ) ( CLEAR ?auto_542590 ) ( ON ?auto_542591 ?auto_542592 ) ( CLEAR ?auto_542591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_542584 ?auto_542585 ?auto_542586 ?auto_542587 ?auto_542588 ?auto_542589 ?auto_542590 ?auto_542591 )
      ( MAKE-12PILE ?auto_542584 ?auto_542585 ?auto_542586 ?auto_542587 ?auto_542588 ?auto_542589 ?auto_542590 ?auto_542591 ?auto_542592 ?auto_542593 ?auto_542594 ?auto_542595 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542634 - BLOCK
      ?auto_542635 - BLOCK
      ?auto_542636 - BLOCK
      ?auto_542637 - BLOCK
      ?auto_542638 - BLOCK
      ?auto_542639 - BLOCK
      ?auto_542640 - BLOCK
      ?auto_542641 - BLOCK
      ?auto_542642 - BLOCK
      ?auto_542643 - BLOCK
      ?auto_542644 - BLOCK
      ?auto_542645 - BLOCK
    )
    :vars
    (
      ?auto_542646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542645 ?auto_542646 ) ( ON-TABLE ?auto_542634 ) ( ON ?auto_542635 ?auto_542634 ) ( ON ?auto_542636 ?auto_542635 ) ( ON ?auto_542637 ?auto_542636 ) ( ON ?auto_542638 ?auto_542637 ) ( ON ?auto_542639 ?auto_542638 ) ( not ( = ?auto_542634 ?auto_542635 ) ) ( not ( = ?auto_542634 ?auto_542636 ) ) ( not ( = ?auto_542634 ?auto_542637 ) ) ( not ( = ?auto_542634 ?auto_542638 ) ) ( not ( = ?auto_542634 ?auto_542639 ) ) ( not ( = ?auto_542634 ?auto_542640 ) ) ( not ( = ?auto_542634 ?auto_542641 ) ) ( not ( = ?auto_542634 ?auto_542642 ) ) ( not ( = ?auto_542634 ?auto_542643 ) ) ( not ( = ?auto_542634 ?auto_542644 ) ) ( not ( = ?auto_542634 ?auto_542645 ) ) ( not ( = ?auto_542634 ?auto_542646 ) ) ( not ( = ?auto_542635 ?auto_542636 ) ) ( not ( = ?auto_542635 ?auto_542637 ) ) ( not ( = ?auto_542635 ?auto_542638 ) ) ( not ( = ?auto_542635 ?auto_542639 ) ) ( not ( = ?auto_542635 ?auto_542640 ) ) ( not ( = ?auto_542635 ?auto_542641 ) ) ( not ( = ?auto_542635 ?auto_542642 ) ) ( not ( = ?auto_542635 ?auto_542643 ) ) ( not ( = ?auto_542635 ?auto_542644 ) ) ( not ( = ?auto_542635 ?auto_542645 ) ) ( not ( = ?auto_542635 ?auto_542646 ) ) ( not ( = ?auto_542636 ?auto_542637 ) ) ( not ( = ?auto_542636 ?auto_542638 ) ) ( not ( = ?auto_542636 ?auto_542639 ) ) ( not ( = ?auto_542636 ?auto_542640 ) ) ( not ( = ?auto_542636 ?auto_542641 ) ) ( not ( = ?auto_542636 ?auto_542642 ) ) ( not ( = ?auto_542636 ?auto_542643 ) ) ( not ( = ?auto_542636 ?auto_542644 ) ) ( not ( = ?auto_542636 ?auto_542645 ) ) ( not ( = ?auto_542636 ?auto_542646 ) ) ( not ( = ?auto_542637 ?auto_542638 ) ) ( not ( = ?auto_542637 ?auto_542639 ) ) ( not ( = ?auto_542637 ?auto_542640 ) ) ( not ( = ?auto_542637 ?auto_542641 ) ) ( not ( = ?auto_542637 ?auto_542642 ) ) ( not ( = ?auto_542637 ?auto_542643 ) ) ( not ( = ?auto_542637 ?auto_542644 ) ) ( not ( = ?auto_542637 ?auto_542645 ) ) ( not ( = ?auto_542637 ?auto_542646 ) ) ( not ( = ?auto_542638 ?auto_542639 ) ) ( not ( = ?auto_542638 ?auto_542640 ) ) ( not ( = ?auto_542638 ?auto_542641 ) ) ( not ( = ?auto_542638 ?auto_542642 ) ) ( not ( = ?auto_542638 ?auto_542643 ) ) ( not ( = ?auto_542638 ?auto_542644 ) ) ( not ( = ?auto_542638 ?auto_542645 ) ) ( not ( = ?auto_542638 ?auto_542646 ) ) ( not ( = ?auto_542639 ?auto_542640 ) ) ( not ( = ?auto_542639 ?auto_542641 ) ) ( not ( = ?auto_542639 ?auto_542642 ) ) ( not ( = ?auto_542639 ?auto_542643 ) ) ( not ( = ?auto_542639 ?auto_542644 ) ) ( not ( = ?auto_542639 ?auto_542645 ) ) ( not ( = ?auto_542639 ?auto_542646 ) ) ( not ( = ?auto_542640 ?auto_542641 ) ) ( not ( = ?auto_542640 ?auto_542642 ) ) ( not ( = ?auto_542640 ?auto_542643 ) ) ( not ( = ?auto_542640 ?auto_542644 ) ) ( not ( = ?auto_542640 ?auto_542645 ) ) ( not ( = ?auto_542640 ?auto_542646 ) ) ( not ( = ?auto_542641 ?auto_542642 ) ) ( not ( = ?auto_542641 ?auto_542643 ) ) ( not ( = ?auto_542641 ?auto_542644 ) ) ( not ( = ?auto_542641 ?auto_542645 ) ) ( not ( = ?auto_542641 ?auto_542646 ) ) ( not ( = ?auto_542642 ?auto_542643 ) ) ( not ( = ?auto_542642 ?auto_542644 ) ) ( not ( = ?auto_542642 ?auto_542645 ) ) ( not ( = ?auto_542642 ?auto_542646 ) ) ( not ( = ?auto_542643 ?auto_542644 ) ) ( not ( = ?auto_542643 ?auto_542645 ) ) ( not ( = ?auto_542643 ?auto_542646 ) ) ( not ( = ?auto_542644 ?auto_542645 ) ) ( not ( = ?auto_542644 ?auto_542646 ) ) ( not ( = ?auto_542645 ?auto_542646 ) ) ( ON ?auto_542644 ?auto_542645 ) ( ON ?auto_542643 ?auto_542644 ) ( ON ?auto_542642 ?auto_542643 ) ( ON ?auto_542641 ?auto_542642 ) ( CLEAR ?auto_542639 ) ( ON ?auto_542640 ?auto_542641 ) ( CLEAR ?auto_542640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_542634 ?auto_542635 ?auto_542636 ?auto_542637 ?auto_542638 ?auto_542639 ?auto_542640 )
      ( MAKE-12PILE ?auto_542634 ?auto_542635 ?auto_542636 ?auto_542637 ?auto_542638 ?auto_542639 ?auto_542640 ?auto_542641 ?auto_542642 ?auto_542643 ?auto_542644 ?auto_542645 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542684 - BLOCK
      ?auto_542685 - BLOCK
      ?auto_542686 - BLOCK
      ?auto_542687 - BLOCK
      ?auto_542688 - BLOCK
      ?auto_542689 - BLOCK
      ?auto_542690 - BLOCK
      ?auto_542691 - BLOCK
      ?auto_542692 - BLOCK
      ?auto_542693 - BLOCK
      ?auto_542694 - BLOCK
      ?auto_542695 - BLOCK
    )
    :vars
    (
      ?auto_542696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542695 ?auto_542696 ) ( ON-TABLE ?auto_542684 ) ( ON ?auto_542685 ?auto_542684 ) ( ON ?auto_542686 ?auto_542685 ) ( ON ?auto_542687 ?auto_542686 ) ( ON ?auto_542688 ?auto_542687 ) ( not ( = ?auto_542684 ?auto_542685 ) ) ( not ( = ?auto_542684 ?auto_542686 ) ) ( not ( = ?auto_542684 ?auto_542687 ) ) ( not ( = ?auto_542684 ?auto_542688 ) ) ( not ( = ?auto_542684 ?auto_542689 ) ) ( not ( = ?auto_542684 ?auto_542690 ) ) ( not ( = ?auto_542684 ?auto_542691 ) ) ( not ( = ?auto_542684 ?auto_542692 ) ) ( not ( = ?auto_542684 ?auto_542693 ) ) ( not ( = ?auto_542684 ?auto_542694 ) ) ( not ( = ?auto_542684 ?auto_542695 ) ) ( not ( = ?auto_542684 ?auto_542696 ) ) ( not ( = ?auto_542685 ?auto_542686 ) ) ( not ( = ?auto_542685 ?auto_542687 ) ) ( not ( = ?auto_542685 ?auto_542688 ) ) ( not ( = ?auto_542685 ?auto_542689 ) ) ( not ( = ?auto_542685 ?auto_542690 ) ) ( not ( = ?auto_542685 ?auto_542691 ) ) ( not ( = ?auto_542685 ?auto_542692 ) ) ( not ( = ?auto_542685 ?auto_542693 ) ) ( not ( = ?auto_542685 ?auto_542694 ) ) ( not ( = ?auto_542685 ?auto_542695 ) ) ( not ( = ?auto_542685 ?auto_542696 ) ) ( not ( = ?auto_542686 ?auto_542687 ) ) ( not ( = ?auto_542686 ?auto_542688 ) ) ( not ( = ?auto_542686 ?auto_542689 ) ) ( not ( = ?auto_542686 ?auto_542690 ) ) ( not ( = ?auto_542686 ?auto_542691 ) ) ( not ( = ?auto_542686 ?auto_542692 ) ) ( not ( = ?auto_542686 ?auto_542693 ) ) ( not ( = ?auto_542686 ?auto_542694 ) ) ( not ( = ?auto_542686 ?auto_542695 ) ) ( not ( = ?auto_542686 ?auto_542696 ) ) ( not ( = ?auto_542687 ?auto_542688 ) ) ( not ( = ?auto_542687 ?auto_542689 ) ) ( not ( = ?auto_542687 ?auto_542690 ) ) ( not ( = ?auto_542687 ?auto_542691 ) ) ( not ( = ?auto_542687 ?auto_542692 ) ) ( not ( = ?auto_542687 ?auto_542693 ) ) ( not ( = ?auto_542687 ?auto_542694 ) ) ( not ( = ?auto_542687 ?auto_542695 ) ) ( not ( = ?auto_542687 ?auto_542696 ) ) ( not ( = ?auto_542688 ?auto_542689 ) ) ( not ( = ?auto_542688 ?auto_542690 ) ) ( not ( = ?auto_542688 ?auto_542691 ) ) ( not ( = ?auto_542688 ?auto_542692 ) ) ( not ( = ?auto_542688 ?auto_542693 ) ) ( not ( = ?auto_542688 ?auto_542694 ) ) ( not ( = ?auto_542688 ?auto_542695 ) ) ( not ( = ?auto_542688 ?auto_542696 ) ) ( not ( = ?auto_542689 ?auto_542690 ) ) ( not ( = ?auto_542689 ?auto_542691 ) ) ( not ( = ?auto_542689 ?auto_542692 ) ) ( not ( = ?auto_542689 ?auto_542693 ) ) ( not ( = ?auto_542689 ?auto_542694 ) ) ( not ( = ?auto_542689 ?auto_542695 ) ) ( not ( = ?auto_542689 ?auto_542696 ) ) ( not ( = ?auto_542690 ?auto_542691 ) ) ( not ( = ?auto_542690 ?auto_542692 ) ) ( not ( = ?auto_542690 ?auto_542693 ) ) ( not ( = ?auto_542690 ?auto_542694 ) ) ( not ( = ?auto_542690 ?auto_542695 ) ) ( not ( = ?auto_542690 ?auto_542696 ) ) ( not ( = ?auto_542691 ?auto_542692 ) ) ( not ( = ?auto_542691 ?auto_542693 ) ) ( not ( = ?auto_542691 ?auto_542694 ) ) ( not ( = ?auto_542691 ?auto_542695 ) ) ( not ( = ?auto_542691 ?auto_542696 ) ) ( not ( = ?auto_542692 ?auto_542693 ) ) ( not ( = ?auto_542692 ?auto_542694 ) ) ( not ( = ?auto_542692 ?auto_542695 ) ) ( not ( = ?auto_542692 ?auto_542696 ) ) ( not ( = ?auto_542693 ?auto_542694 ) ) ( not ( = ?auto_542693 ?auto_542695 ) ) ( not ( = ?auto_542693 ?auto_542696 ) ) ( not ( = ?auto_542694 ?auto_542695 ) ) ( not ( = ?auto_542694 ?auto_542696 ) ) ( not ( = ?auto_542695 ?auto_542696 ) ) ( ON ?auto_542694 ?auto_542695 ) ( ON ?auto_542693 ?auto_542694 ) ( ON ?auto_542692 ?auto_542693 ) ( ON ?auto_542691 ?auto_542692 ) ( ON ?auto_542690 ?auto_542691 ) ( CLEAR ?auto_542688 ) ( ON ?auto_542689 ?auto_542690 ) ( CLEAR ?auto_542689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_542684 ?auto_542685 ?auto_542686 ?auto_542687 ?auto_542688 ?auto_542689 )
      ( MAKE-12PILE ?auto_542684 ?auto_542685 ?auto_542686 ?auto_542687 ?auto_542688 ?auto_542689 ?auto_542690 ?auto_542691 ?auto_542692 ?auto_542693 ?auto_542694 ?auto_542695 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542734 - BLOCK
      ?auto_542735 - BLOCK
      ?auto_542736 - BLOCK
      ?auto_542737 - BLOCK
      ?auto_542738 - BLOCK
      ?auto_542739 - BLOCK
      ?auto_542740 - BLOCK
      ?auto_542741 - BLOCK
      ?auto_542742 - BLOCK
      ?auto_542743 - BLOCK
      ?auto_542744 - BLOCK
      ?auto_542745 - BLOCK
    )
    :vars
    (
      ?auto_542746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542745 ?auto_542746 ) ( ON-TABLE ?auto_542734 ) ( ON ?auto_542735 ?auto_542734 ) ( ON ?auto_542736 ?auto_542735 ) ( ON ?auto_542737 ?auto_542736 ) ( not ( = ?auto_542734 ?auto_542735 ) ) ( not ( = ?auto_542734 ?auto_542736 ) ) ( not ( = ?auto_542734 ?auto_542737 ) ) ( not ( = ?auto_542734 ?auto_542738 ) ) ( not ( = ?auto_542734 ?auto_542739 ) ) ( not ( = ?auto_542734 ?auto_542740 ) ) ( not ( = ?auto_542734 ?auto_542741 ) ) ( not ( = ?auto_542734 ?auto_542742 ) ) ( not ( = ?auto_542734 ?auto_542743 ) ) ( not ( = ?auto_542734 ?auto_542744 ) ) ( not ( = ?auto_542734 ?auto_542745 ) ) ( not ( = ?auto_542734 ?auto_542746 ) ) ( not ( = ?auto_542735 ?auto_542736 ) ) ( not ( = ?auto_542735 ?auto_542737 ) ) ( not ( = ?auto_542735 ?auto_542738 ) ) ( not ( = ?auto_542735 ?auto_542739 ) ) ( not ( = ?auto_542735 ?auto_542740 ) ) ( not ( = ?auto_542735 ?auto_542741 ) ) ( not ( = ?auto_542735 ?auto_542742 ) ) ( not ( = ?auto_542735 ?auto_542743 ) ) ( not ( = ?auto_542735 ?auto_542744 ) ) ( not ( = ?auto_542735 ?auto_542745 ) ) ( not ( = ?auto_542735 ?auto_542746 ) ) ( not ( = ?auto_542736 ?auto_542737 ) ) ( not ( = ?auto_542736 ?auto_542738 ) ) ( not ( = ?auto_542736 ?auto_542739 ) ) ( not ( = ?auto_542736 ?auto_542740 ) ) ( not ( = ?auto_542736 ?auto_542741 ) ) ( not ( = ?auto_542736 ?auto_542742 ) ) ( not ( = ?auto_542736 ?auto_542743 ) ) ( not ( = ?auto_542736 ?auto_542744 ) ) ( not ( = ?auto_542736 ?auto_542745 ) ) ( not ( = ?auto_542736 ?auto_542746 ) ) ( not ( = ?auto_542737 ?auto_542738 ) ) ( not ( = ?auto_542737 ?auto_542739 ) ) ( not ( = ?auto_542737 ?auto_542740 ) ) ( not ( = ?auto_542737 ?auto_542741 ) ) ( not ( = ?auto_542737 ?auto_542742 ) ) ( not ( = ?auto_542737 ?auto_542743 ) ) ( not ( = ?auto_542737 ?auto_542744 ) ) ( not ( = ?auto_542737 ?auto_542745 ) ) ( not ( = ?auto_542737 ?auto_542746 ) ) ( not ( = ?auto_542738 ?auto_542739 ) ) ( not ( = ?auto_542738 ?auto_542740 ) ) ( not ( = ?auto_542738 ?auto_542741 ) ) ( not ( = ?auto_542738 ?auto_542742 ) ) ( not ( = ?auto_542738 ?auto_542743 ) ) ( not ( = ?auto_542738 ?auto_542744 ) ) ( not ( = ?auto_542738 ?auto_542745 ) ) ( not ( = ?auto_542738 ?auto_542746 ) ) ( not ( = ?auto_542739 ?auto_542740 ) ) ( not ( = ?auto_542739 ?auto_542741 ) ) ( not ( = ?auto_542739 ?auto_542742 ) ) ( not ( = ?auto_542739 ?auto_542743 ) ) ( not ( = ?auto_542739 ?auto_542744 ) ) ( not ( = ?auto_542739 ?auto_542745 ) ) ( not ( = ?auto_542739 ?auto_542746 ) ) ( not ( = ?auto_542740 ?auto_542741 ) ) ( not ( = ?auto_542740 ?auto_542742 ) ) ( not ( = ?auto_542740 ?auto_542743 ) ) ( not ( = ?auto_542740 ?auto_542744 ) ) ( not ( = ?auto_542740 ?auto_542745 ) ) ( not ( = ?auto_542740 ?auto_542746 ) ) ( not ( = ?auto_542741 ?auto_542742 ) ) ( not ( = ?auto_542741 ?auto_542743 ) ) ( not ( = ?auto_542741 ?auto_542744 ) ) ( not ( = ?auto_542741 ?auto_542745 ) ) ( not ( = ?auto_542741 ?auto_542746 ) ) ( not ( = ?auto_542742 ?auto_542743 ) ) ( not ( = ?auto_542742 ?auto_542744 ) ) ( not ( = ?auto_542742 ?auto_542745 ) ) ( not ( = ?auto_542742 ?auto_542746 ) ) ( not ( = ?auto_542743 ?auto_542744 ) ) ( not ( = ?auto_542743 ?auto_542745 ) ) ( not ( = ?auto_542743 ?auto_542746 ) ) ( not ( = ?auto_542744 ?auto_542745 ) ) ( not ( = ?auto_542744 ?auto_542746 ) ) ( not ( = ?auto_542745 ?auto_542746 ) ) ( ON ?auto_542744 ?auto_542745 ) ( ON ?auto_542743 ?auto_542744 ) ( ON ?auto_542742 ?auto_542743 ) ( ON ?auto_542741 ?auto_542742 ) ( ON ?auto_542740 ?auto_542741 ) ( ON ?auto_542739 ?auto_542740 ) ( CLEAR ?auto_542737 ) ( ON ?auto_542738 ?auto_542739 ) ( CLEAR ?auto_542738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_542734 ?auto_542735 ?auto_542736 ?auto_542737 ?auto_542738 )
      ( MAKE-12PILE ?auto_542734 ?auto_542735 ?auto_542736 ?auto_542737 ?auto_542738 ?auto_542739 ?auto_542740 ?auto_542741 ?auto_542742 ?auto_542743 ?auto_542744 ?auto_542745 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542784 - BLOCK
      ?auto_542785 - BLOCK
      ?auto_542786 - BLOCK
      ?auto_542787 - BLOCK
      ?auto_542788 - BLOCK
      ?auto_542789 - BLOCK
      ?auto_542790 - BLOCK
      ?auto_542791 - BLOCK
      ?auto_542792 - BLOCK
      ?auto_542793 - BLOCK
      ?auto_542794 - BLOCK
      ?auto_542795 - BLOCK
    )
    :vars
    (
      ?auto_542796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542795 ?auto_542796 ) ( ON-TABLE ?auto_542784 ) ( ON ?auto_542785 ?auto_542784 ) ( ON ?auto_542786 ?auto_542785 ) ( not ( = ?auto_542784 ?auto_542785 ) ) ( not ( = ?auto_542784 ?auto_542786 ) ) ( not ( = ?auto_542784 ?auto_542787 ) ) ( not ( = ?auto_542784 ?auto_542788 ) ) ( not ( = ?auto_542784 ?auto_542789 ) ) ( not ( = ?auto_542784 ?auto_542790 ) ) ( not ( = ?auto_542784 ?auto_542791 ) ) ( not ( = ?auto_542784 ?auto_542792 ) ) ( not ( = ?auto_542784 ?auto_542793 ) ) ( not ( = ?auto_542784 ?auto_542794 ) ) ( not ( = ?auto_542784 ?auto_542795 ) ) ( not ( = ?auto_542784 ?auto_542796 ) ) ( not ( = ?auto_542785 ?auto_542786 ) ) ( not ( = ?auto_542785 ?auto_542787 ) ) ( not ( = ?auto_542785 ?auto_542788 ) ) ( not ( = ?auto_542785 ?auto_542789 ) ) ( not ( = ?auto_542785 ?auto_542790 ) ) ( not ( = ?auto_542785 ?auto_542791 ) ) ( not ( = ?auto_542785 ?auto_542792 ) ) ( not ( = ?auto_542785 ?auto_542793 ) ) ( not ( = ?auto_542785 ?auto_542794 ) ) ( not ( = ?auto_542785 ?auto_542795 ) ) ( not ( = ?auto_542785 ?auto_542796 ) ) ( not ( = ?auto_542786 ?auto_542787 ) ) ( not ( = ?auto_542786 ?auto_542788 ) ) ( not ( = ?auto_542786 ?auto_542789 ) ) ( not ( = ?auto_542786 ?auto_542790 ) ) ( not ( = ?auto_542786 ?auto_542791 ) ) ( not ( = ?auto_542786 ?auto_542792 ) ) ( not ( = ?auto_542786 ?auto_542793 ) ) ( not ( = ?auto_542786 ?auto_542794 ) ) ( not ( = ?auto_542786 ?auto_542795 ) ) ( not ( = ?auto_542786 ?auto_542796 ) ) ( not ( = ?auto_542787 ?auto_542788 ) ) ( not ( = ?auto_542787 ?auto_542789 ) ) ( not ( = ?auto_542787 ?auto_542790 ) ) ( not ( = ?auto_542787 ?auto_542791 ) ) ( not ( = ?auto_542787 ?auto_542792 ) ) ( not ( = ?auto_542787 ?auto_542793 ) ) ( not ( = ?auto_542787 ?auto_542794 ) ) ( not ( = ?auto_542787 ?auto_542795 ) ) ( not ( = ?auto_542787 ?auto_542796 ) ) ( not ( = ?auto_542788 ?auto_542789 ) ) ( not ( = ?auto_542788 ?auto_542790 ) ) ( not ( = ?auto_542788 ?auto_542791 ) ) ( not ( = ?auto_542788 ?auto_542792 ) ) ( not ( = ?auto_542788 ?auto_542793 ) ) ( not ( = ?auto_542788 ?auto_542794 ) ) ( not ( = ?auto_542788 ?auto_542795 ) ) ( not ( = ?auto_542788 ?auto_542796 ) ) ( not ( = ?auto_542789 ?auto_542790 ) ) ( not ( = ?auto_542789 ?auto_542791 ) ) ( not ( = ?auto_542789 ?auto_542792 ) ) ( not ( = ?auto_542789 ?auto_542793 ) ) ( not ( = ?auto_542789 ?auto_542794 ) ) ( not ( = ?auto_542789 ?auto_542795 ) ) ( not ( = ?auto_542789 ?auto_542796 ) ) ( not ( = ?auto_542790 ?auto_542791 ) ) ( not ( = ?auto_542790 ?auto_542792 ) ) ( not ( = ?auto_542790 ?auto_542793 ) ) ( not ( = ?auto_542790 ?auto_542794 ) ) ( not ( = ?auto_542790 ?auto_542795 ) ) ( not ( = ?auto_542790 ?auto_542796 ) ) ( not ( = ?auto_542791 ?auto_542792 ) ) ( not ( = ?auto_542791 ?auto_542793 ) ) ( not ( = ?auto_542791 ?auto_542794 ) ) ( not ( = ?auto_542791 ?auto_542795 ) ) ( not ( = ?auto_542791 ?auto_542796 ) ) ( not ( = ?auto_542792 ?auto_542793 ) ) ( not ( = ?auto_542792 ?auto_542794 ) ) ( not ( = ?auto_542792 ?auto_542795 ) ) ( not ( = ?auto_542792 ?auto_542796 ) ) ( not ( = ?auto_542793 ?auto_542794 ) ) ( not ( = ?auto_542793 ?auto_542795 ) ) ( not ( = ?auto_542793 ?auto_542796 ) ) ( not ( = ?auto_542794 ?auto_542795 ) ) ( not ( = ?auto_542794 ?auto_542796 ) ) ( not ( = ?auto_542795 ?auto_542796 ) ) ( ON ?auto_542794 ?auto_542795 ) ( ON ?auto_542793 ?auto_542794 ) ( ON ?auto_542792 ?auto_542793 ) ( ON ?auto_542791 ?auto_542792 ) ( ON ?auto_542790 ?auto_542791 ) ( ON ?auto_542789 ?auto_542790 ) ( ON ?auto_542788 ?auto_542789 ) ( CLEAR ?auto_542786 ) ( ON ?auto_542787 ?auto_542788 ) ( CLEAR ?auto_542787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_542784 ?auto_542785 ?auto_542786 ?auto_542787 )
      ( MAKE-12PILE ?auto_542784 ?auto_542785 ?auto_542786 ?auto_542787 ?auto_542788 ?auto_542789 ?auto_542790 ?auto_542791 ?auto_542792 ?auto_542793 ?auto_542794 ?auto_542795 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542834 - BLOCK
      ?auto_542835 - BLOCK
      ?auto_542836 - BLOCK
      ?auto_542837 - BLOCK
      ?auto_542838 - BLOCK
      ?auto_542839 - BLOCK
      ?auto_542840 - BLOCK
      ?auto_542841 - BLOCK
      ?auto_542842 - BLOCK
      ?auto_542843 - BLOCK
      ?auto_542844 - BLOCK
      ?auto_542845 - BLOCK
    )
    :vars
    (
      ?auto_542846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542845 ?auto_542846 ) ( ON-TABLE ?auto_542834 ) ( ON ?auto_542835 ?auto_542834 ) ( not ( = ?auto_542834 ?auto_542835 ) ) ( not ( = ?auto_542834 ?auto_542836 ) ) ( not ( = ?auto_542834 ?auto_542837 ) ) ( not ( = ?auto_542834 ?auto_542838 ) ) ( not ( = ?auto_542834 ?auto_542839 ) ) ( not ( = ?auto_542834 ?auto_542840 ) ) ( not ( = ?auto_542834 ?auto_542841 ) ) ( not ( = ?auto_542834 ?auto_542842 ) ) ( not ( = ?auto_542834 ?auto_542843 ) ) ( not ( = ?auto_542834 ?auto_542844 ) ) ( not ( = ?auto_542834 ?auto_542845 ) ) ( not ( = ?auto_542834 ?auto_542846 ) ) ( not ( = ?auto_542835 ?auto_542836 ) ) ( not ( = ?auto_542835 ?auto_542837 ) ) ( not ( = ?auto_542835 ?auto_542838 ) ) ( not ( = ?auto_542835 ?auto_542839 ) ) ( not ( = ?auto_542835 ?auto_542840 ) ) ( not ( = ?auto_542835 ?auto_542841 ) ) ( not ( = ?auto_542835 ?auto_542842 ) ) ( not ( = ?auto_542835 ?auto_542843 ) ) ( not ( = ?auto_542835 ?auto_542844 ) ) ( not ( = ?auto_542835 ?auto_542845 ) ) ( not ( = ?auto_542835 ?auto_542846 ) ) ( not ( = ?auto_542836 ?auto_542837 ) ) ( not ( = ?auto_542836 ?auto_542838 ) ) ( not ( = ?auto_542836 ?auto_542839 ) ) ( not ( = ?auto_542836 ?auto_542840 ) ) ( not ( = ?auto_542836 ?auto_542841 ) ) ( not ( = ?auto_542836 ?auto_542842 ) ) ( not ( = ?auto_542836 ?auto_542843 ) ) ( not ( = ?auto_542836 ?auto_542844 ) ) ( not ( = ?auto_542836 ?auto_542845 ) ) ( not ( = ?auto_542836 ?auto_542846 ) ) ( not ( = ?auto_542837 ?auto_542838 ) ) ( not ( = ?auto_542837 ?auto_542839 ) ) ( not ( = ?auto_542837 ?auto_542840 ) ) ( not ( = ?auto_542837 ?auto_542841 ) ) ( not ( = ?auto_542837 ?auto_542842 ) ) ( not ( = ?auto_542837 ?auto_542843 ) ) ( not ( = ?auto_542837 ?auto_542844 ) ) ( not ( = ?auto_542837 ?auto_542845 ) ) ( not ( = ?auto_542837 ?auto_542846 ) ) ( not ( = ?auto_542838 ?auto_542839 ) ) ( not ( = ?auto_542838 ?auto_542840 ) ) ( not ( = ?auto_542838 ?auto_542841 ) ) ( not ( = ?auto_542838 ?auto_542842 ) ) ( not ( = ?auto_542838 ?auto_542843 ) ) ( not ( = ?auto_542838 ?auto_542844 ) ) ( not ( = ?auto_542838 ?auto_542845 ) ) ( not ( = ?auto_542838 ?auto_542846 ) ) ( not ( = ?auto_542839 ?auto_542840 ) ) ( not ( = ?auto_542839 ?auto_542841 ) ) ( not ( = ?auto_542839 ?auto_542842 ) ) ( not ( = ?auto_542839 ?auto_542843 ) ) ( not ( = ?auto_542839 ?auto_542844 ) ) ( not ( = ?auto_542839 ?auto_542845 ) ) ( not ( = ?auto_542839 ?auto_542846 ) ) ( not ( = ?auto_542840 ?auto_542841 ) ) ( not ( = ?auto_542840 ?auto_542842 ) ) ( not ( = ?auto_542840 ?auto_542843 ) ) ( not ( = ?auto_542840 ?auto_542844 ) ) ( not ( = ?auto_542840 ?auto_542845 ) ) ( not ( = ?auto_542840 ?auto_542846 ) ) ( not ( = ?auto_542841 ?auto_542842 ) ) ( not ( = ?auto_542841 ?auto_542843 ) ) ( not ( = ?auto_542841 ?auto_542844 ) ) ( not ( = ?auto_542841 ?auto_542845 ) ) ( not ( = ?auto_542841 ?auto_542846 ) ) ( not ( = ?auto_542842 ?auto_542843 ) ) ( not ( = ?auto_542842 ?auto_542844 ) ) ( not ( = ?auto_542842 ?auto_542845 ) ) ( not ( = ?auto_542842 ?auto_542846 ) ) ( not ( = ?auto_542843 ?auto_542844 ) ) ( not ( = ?auto_542843 ?auto_542845 ) ) ( not ( = ?auto_542843 ?auto_542846 ) ) ( not ( = ?auto_542844 ?auto_542845 ) ) ( not ( = ?auto_542844 ?auto_542846 ) ) ( not ( = ?auto_542845 ?auto_542846 ) ) ( ON ?auto_542844 ?auto_542845 ) ( ON ?auto_542843 ?auto_542844 ) ( ON ?auto_542842 ?auto_542843 ) ( ON ?auto_542841 ?auto_542842 ) ( ON ?auto_542840 ?auto_542841 ) ( ON ?auto_542839 ?auto_542840 ) ( ON ?auto_542838 ?auto_542839 ) ( ON ?auto_542837 ?auto_542838 ) ( CLEAR ?auto_542835 ) ( ON ?auto_542836 ?auto_542837 ) ( CLEAR ?auto_542836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_542834 ?auto_542835 ?auto_542836 )
      ( MAKE-12PILE ?auto_542834 ?auto_542835 ?auto_542836 ?auto_542837 ?auto_542838 ?auto_542839 ?auto_542840 ?auto_542841 ?auto_542842 ?auto_542843 ?auto_542844 ?auto_542845 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542884 - BLOCK
      ?auto_542885 - BLOCK
      ?auto_542886 - BLOCK
      ?auto_542887 - BLOCK
      ?auto_542888 - BLOCK
      ?auto_542889 - BLOCK
      ?auto_542890 - BLOCK
      ?auto_542891 - BLOCK
      ?auto_542892 - BLOCK
      ?auto_542893 - BLOCK
      ?auto_542894 - BLOCK
      ?auto_542895 - BLOCK
    )
    :vars
    (
      ?auto_542896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542895 ?auto_542896 ) ( ON-TABLE ?auto_542884 ) ( not ( = ?auto_542884 ?auto_542885 ) ) ( not ( = ?auto_542884 ?auto_542886 ) ) ( not ( = ?auto_542884 ?auto_542887 ) ) ( not ( = ?auto_542884 ?auto_542888 ) ) ( not ( = ?auto_542884 ?auto_542889 ) ) ( not ( = ?auto_542884 ?auto_542890 ) ) ( not ( = ?auto_542884 ?auto_542891 ) ) ( not ( = ?auto_542884 ?auto_542892 ) ) ( not ( = ?auto_542884 ?auto_542893 ) ) ( not ( = ?auto_542884 ?auto_542894 ) ) ( not ( = ?auto_542884 ?auto_542895 ) ) ( not ( = ?auto_542884 ?auto_542896 ) ) ( not ( = ?auto_542885 ?auto_542886 ) ) ( not ( = ?auto_542885 ?auto_542887 ) ) ( not ( = ?auto_542885 ?auto_542888 ) ) ( not ( = ?auto_542885 ?auto_542889 ) ) ( not ( = ?auto_542885 ?auto_542890 ) ) ( not ( = ?auto_542885 ?auto_542891 ) ) ( not ( = ?auto_542885 ?auto_542892 ) ) ( not ( = ?auto_542885 ?auto_542893 ) ) ( not ( = ?auto_542885 ?auto_542894 ) ) ( not ( = ?auto_542885 ?auto_542895 ) ) ( not ( = ?auto_542885 ?auto_542896 ) ) ( not ( = ?auto_542886 ?auto_542887 ) ) ( not ( = ?auto_542886 ?auto_542888 ) ) ( not ( = ?auto_542886 ?auto_542889 ) ) ( not ( = ?auto_542886 ?auto_542890 ) ) ( not ( = ?auto_542886 ?auto_542891 ) ) ( not ( = ?auto_542886 ?auto_542892 ) ) ( not ( = ?auto_542886 ?auto_542893 ) ) ( not ( = ?auto_542886 ?auto_542894 ) ) ( not ( = ?auto_542886 ?auto_542895 ) ) ( not ( = ?auto_542886 ?auto_542896 ) ) ( not ( = ?auto_542887 ?auto_542888 ) ) ( not ( = ?auto_542887 ?auto_542889 ) ) ( not ( = ?auto_542887 ?auto_542890 ) ) ( not ( = ?auto_542887 ?auto_542891 ) ) ( not ( = ?auto_542887 ?auto_542892 ) ) ( not ( = ?auto_542887 ?auto_542893 ) ) ( not ( = ?auto_542887 ?auto_542894 ) ) ( not ( = ?auto_542887 ?auto_542895 ) ) ( not ( = ?auto_542887 ?auto_542896 ) ) ( not ( = ?auto_542888 ?auto_542889 ) ) ( not ( = ?auto_542888 ?auto_542890 ) ) ( not ( = ?auto_542888 ?auto_542891 ) ) ( not ( = ?auto_542888 ?auto_542892 ) ) ( not ( = ?auto_542888 ?auto_542893 ) ) ( not ( = ?auto_542888 ?auto_542894 ) ) ( not ( = ?auto_542888 ?auto_542895 ) ) ( not ( = ?auto_542888 ?auto_542896 ) ) ( not ( = ?auto_542889 ?auto_542890 ) ) ( not ( = ?auto_542889 ?auto_542891 ) ) ( not ( = ?auto_542889 ?auto_542892 ) ) ( not ( = ?auto_542889 ?auto_542893 ) ) ( not ( = ?auto_542889 ?auto_542894 ) ) ( not ( = ?auto_542889 ?auto_542895 ) ) ( not ( = ?auto_542889 ?auto_542896 ) ) ( not ( = ?auto_542890 ?auto_542891 ) ) ( not ( = ?auto_542890 ?auto_542892 ) ) ( not ( = ?auto_542890 ?auto_542893 ) ) ( not ( = ?auto_542890 ?auto_542894 ) ) ( not ( = ?auto_542890 ?auto_542895 ) ) ( not ( = ?auto_542890 ?auto_542896 ) ) ( not ( = ?auto_542891 ?auto_542892 ) ) ( not ( = ?auto_542891 ?auto_542893 ) ) ( not ( = ?auto_542891 ?auto_542894 ) ) ( not ( = ?auto_542891 ?auto_542895 ) ) ( not ( = ?auto_542891 ?auto_542896 ) ) ( not ( = ?auto_542892 ?auto_542893 ) ) ( not ( = ?auto_542892 ?auto_542894 ) ) ( not ( = ?auto_542892 ?auto_542895 ) ) ( not ( = ?auto_542892 ?auto_542896 ) ) ( not ( = ?auto_542893 ?auto_542894 ) ) ( not ( = ?auto_542893 ?auto_542895 ) ) ( not ( = ?auto_542893 ?auto_542896 ) ) ( not ( = ?auto_542894 ?auto_542895 ) ) ( not ( = ?auto_542894 ?auto_542896 ) ) ( not ( = ?auto_542895 ?auto_542896 ) ) ( ON ?auto_542894 ?auto_542895 ) ( ON ?auto_542893 ?auto_542894 ) ( ON ?auto_542892 ?auto_542893 ) ( ON ?auto_542891 ?auto_542892 ) ( ON ?auto_542890 ?auto_542891 ) ( ON ?auto_542889 ?auto_542890 ) ( ON ?auto_542888 ?auto_542889 ) ( ON ?auto_542887 ?auto_542888 ) ( ON ?auto_542886 ?auto_542887 ) ( CLEAR ?auto_542884 ) ( ON ?auto_542885 ?auto_542886 ) ( CLEAR ?auto_542885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_542884 ?auto_542885 )
      ( MAKE-12PILE ?auto_542884 ?auto_542885 ?auto_542886 ?auto_542887 ?auto_542888 ?auto_542889 ?auto_542890 ?auto_542891 ?auto_542892 ?auto_542893 ?auto_542894 ?auto_542895 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_542934 - BLOCK
      ?auto_542935 - BLOCK
      ?auto_542936 - BLOCK
      ?auto_542937 - BLOCK
      ?auto_542938 - BLOCK
      ?auto_542939 - BLOCK
      ?auto_542940 - BLOCK
      ?auto_542941 - BLOCK
      ?auto_542942 - BLOCK
      ?auto_542943 - BLOCK
      ?auto_542944 - BLOCK
      ?auto_542945 - BLOCK
    )
    :vars
    (
      ?auto_542946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_542945 ?auto_542946 ) ( not ( = ?auto_542934 ?auto_542935 ) ) ( not ( = ?auto_542934 ?auto_542936 ) ) ( not ( = ?auto_542934 ?auto_542937 ) ) ( not ( = ?auto_542934 ?auto_542938 ) ) ( not ( = ?auto_542934 ?auto_542939 ) ) ( not ( = ?auto_542934 ?auto_542940 ) ) ( not ( = ?auto_542934 ?auto_542941 ) ) ( not ( = ?auto_542934 ?auto_542942 ) ) ( not ( = ?auto_542934 ?auto_542943 ) ) ( not ( = ?auto_542934 ?auto_542944 ) ) ( not ( = ?auto_542934 ?auto_542945 ) ) ( not ( = ?auto_542934 ?auto_542946 ) ) ( not ( = ?auto_542935 ?auto_542936 ) ) ( not ( = ?auto_542935 ?auto_542937 ) ) ( not ( = ?auto_542935 ?auto_542938 ) ) ( not ( = ?auto_542935 ?auto_542939 ) ) ( not ( = ?auto_542935 ?auto_542940 ) ) ( not ( = ?auto_542935 ?auto_542941 ) ) ( not ( = ?auto_542935 ?auto_542942 ) ) ( not ( = ?auto_542935 ?auto_542943 ) ) ( not ( = ?auto_542935 ?auto_542944 ) ) ( not ( = ?auto_542935 ?auto_542945 ) ) ( not ( = ?auto_542935 ?auto_542946 ) ) ( not ( = ?auto_542936 ?auto_542937 ) ) ( not ( = ?auto_542936 ?auto_542938 ) ) ( not ( = ?auto_542936 ?auto_542939 ) ) ( not ( = ?auto_542936 ?auto_542940 ) ) ( not ( = ?auto_542936 ?auto_542941 ) ) ( not ( = ?auto_542936 ?auto_542942 ) ) ( not ( = ?auto_542936 ?auto_542943 ) ) ( not ( = ?auto_542936 ?auto_542944 ) ) ( not ( = ?auto_542936 ?auto_542945 ) ) ( not ( = ?auto_542936 ?auto_542946 ) ) ( not ( = ?auto_542937 ?auto_542938 ) ) ( not ( = ?auto_542937 ?auto_542939 ) ) ( not ( = ?auto_542937 ?auto_542940 ) ) ( not ( = ?auto_542937 ?auto_542941 ) ) ( not ( = ?auto_542937 ?auto_542942 ) ) ( not ( = ?auto_542937 ?auto_542943 ) ) ( not ( = ?auto_542937 ?auto_542944 ) ) ( not ( = ?auto_542937 ?auto_542945 ) ) ( not ( = ?auto_542937 ?auto_542946 ) ) ( not ( = ?auto_542938 ?auto_542939 ) ) ( not ( = ?auto_542938 ?auto_542940 ) ) ( not ( = ?auto_542938 ?auto_542941 ) ) ( not ( = ?auto_542938 ?auto_542942 ) ) ( not ( = ?auto_542938 ?auto_542943 ) ) ( not ( = ?auto_542938 ?auto_542944 ) ) ( not ( = ?auto_542938 ?auto_542945 ) ) ( not ( = ?auto_542938 ?auto_542946 ) ) ( not ( = ?auto_542939 ?auto_542940 ) ) ( not ( = ?auto_542939 ?auto_542941 ) ) ( not ( = ?auto_542939 ?auto_542942 ) ) ( not ( = ?auto_542939 ?auto_542943 ) ) ( not ( = ?auto_542939 ?auto_542944 ) ) ( not ( = ?auto_542939 ?auto_542945 ) ) ( not ( = ?auto_542939 ?auto_542946 ) ) ( not ( = ?auto_542940 ?auto_542941 ) ) ( not ( = ?auto_542940 ?auto_542942 ) ) ( not ( = ?auto_542940 ?auto_542943 ) ) ( not ( = ?auto_542940 ?auto_542944 ) ) ( not ( = ?auto_542940 ?auto_542945 ) ) ( not ( = ?auto_542940 ?auto_542946 ) ) ( not ( = ?auto_542941 ?auto_542942 ) ) ( not ( = ?auto_542941 ?auto_542943 ) ) ( not ( = ?auto_542941 ?auto_542944 ) ) ( not ( = ?auto_542941 ?auto_542945 ) ) ( not ( = ?auto_542941 ?auto_542946 ) ) ( not ( = ?auto_542942 ?auto_542943 ) ) ( not ( = ?auto_542942 ?auto_542944 ) ) ( not ( = ?auto_542942 ?auto_542945 ) ) ( not ( = ?auto_542942 ?auto_542946 ) ) ( not ( = ?auto_542943 ?auto_542944 ) ) ( not ( = ?auto_542943 ?auto_542945 ) ) ( not ( = ?auto_542943 ?auto_542946 ) ) ( not ( = ?auto_542944 ?auto_542945 ) ) ( not ( = ?auto_542944 ?auto_542946 ) ) ( not ( = ?auto_542945 ?auto_542946 ) ) ( ON ?auto_542944 ?auto_542945 ) ( ON ?auto_542943 ?auto_542944 ) ( ON ?auto_542942 ?auto_542943 ) ( ON ?auto_542941 ?auto_542942 ) ( ON ?auto_542940 ?auto_542941 ) ( ON ?auto_542939 ?auto_542940 ) ( ON ?auto_542938 ?auto_542939 ) ( ON ?auto_542937 ?auto_542938 ) ( ON ?auto_542936 ?auto_542937 ) ( ON ?auto_542935 ?auto_542936 ) ( ON ?auto_542934 ?auto_542935 ) ( CLEAR ?auto_542934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_542934 )
      ( MAKE-12PILE ?auto_542934 ?auto_542935 ?auto_542936 ?auto_542937 ?auto_542938 ?auto_542939 ?auto_542940 ?auto_542941 ?auto_542942 ?auto_542943 ?auto_542944 ?auto_542945 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_542985 - BLOCK
      ?auto_542986 - BLOCK
      ?auto_542987 - BLOCK
      ?auto_542988 - BLOCK
      ?auto_542989 - BLOCK
      ?auto_542990 - BLOCK
      ?auto_542991 - BLOCK
      ?auto_542992 - BLOCK
      ?auto_542993 - BLOCK
      ?auto_542994 - BLOCK
      ?auto_542995 - BLOCK
      ?auto_542996 - BLOCK
      ?auto_542997 - BLOCK
    )
    :vars
    (
      ?auto_542998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_542996 ) ( ON ?auto_542997 ?auto_542998 ) ( CLEAR ?auto_542997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_542985 ) ( ON ?auto_542986 ?auto_542985 ) ( ON ?auto_542987 ?auto_542986 ) ( ON ?auto_542988 ?auto_542987 ) ( ON ?auto_542989 ?auto_542988 ) ( ON ?auto_542990 ?auto_542989 ) ( ON ?auto_542991 ?auto_542990 ) ( ON ?auto_542992 ?auto_542991 ) ( ON ?auto_542993 ?auto_542992 ) ( ON ?auto_542994 ?auto_542993 ) ( ON ?auto_542995 ?auto_542994 ) ( ON ?auto_542996 ?auto_542995 ) ( not ( = ?auto_542985 ?auto_542986 ) ) ( not ( = ?auto_542985 ?auto_542987 ) ) ( not ( = ?auto_542985 ?auto_542988 ) ) ( not ( = ?auto_542985 ?auto_542989 ) ) ( not ( = ?auto_542985 ?auto_542990 ) ) ( not ( = ?auto_542985 ?auto_542991 ) ) ( not ( = ?auto_542985 ?auto_542992 ) ) ( not ( = ?auto_542985 ?auto_542993 ) ) ( not ( = ?auto_542985 ?auto_542994 ) ) ( not ( = ?auto_542985 ?auto_542995 ) ) ( not ( = ?auto_542985 ?auto_542996 ) ) ( not ( = ?auto_542985 ?auto_542997 ) ) ( not ( = ?auto_542985 ?auto_542998 ) ) ( not ( = ?auto_542986 ?auto_542987 ) ) ( not ( = ?auto_542986 ?auto_542988 ) ) ( not ( = ?auto_542986 ?auto_542989 ) ) ( not ( = ?auto_542986 ?auto_542990 ) ) ( not ( = ?auto_542986 ?auto_542991 ) ) ( not ( = ?auto_542986 ?auto_542992 ) ) ( not ( = ?auto_542986 ?auto_542993 ) ) ( not ( = ?auto_542986 ?auto_542994 ) ) ( not ( = ?auto_542986 ?auto_542995 ) ) ( not ( = ?auto_542986 ?auto_542996 ) ) ( not ( = ?auto_542986 ?auto_542997 ) ) ( not ( = ?auto_542986 ?auto_542998 ) ) ( not ( = ?auto_542987 ?auto_542988 ) ) ( not ( = ?auto_542987 ?auto_542989 ) ) ( not ( = ?auto_542987 ?auto_542990 ) ) ( not ( = ?auto_542987 ?auto_542991 ) ) ( not ( = ?auto_542987 ?auto_542992 ) ) ( not ( = ?auto_542987 ?auto_542993 ) ) ( not ( = ?auto_542987 ?auto_542994 ) ) ( not ( = ?auto_542987 ?auto_542995 ) ) ( not ( = ?auto_542987 ?auto_542996 ) ) ( not ( = ?auto_542987 ?auto_542997 ) ) ( not ( = ?auto_542987 ?auto_542998 ) ) ( not ( = ?auto_542988 ?auto_542989 ) ) ( not ( = ?auto_542988 ?auto_542990 ) ) ( not ( = ?auto_542988 ?auto_542991 ) ) ( not ( = ?auto_542988 ?auto_542992 ) ) ( not ( = ?auto_542988 ?auto_542993 ) ) ( not ( = ?auto_542988 ?auto_542994 ) ) ( not ( = ?auto_542988 ?auto_542995 ) ) ( not ( = ?auto_542988 ?auto_542996 ) ) ( not ( = ?auto_542988 ?auto_542997 ) ) ( not ( = ?auto_542988 ?auto_542998 ) ) ( not ( = ?auto_542989 ?auto_542990 ) ) ( not ( = ?auto_542989 ?auto_542991 ) ) ( not ( = ?auto_542989 ?auto_542992 ) ) ( not ( = ?auto_542989 ?auto_542993 ) ) ( not ( = ?auto_542989 ?auto_542994 ) ) ( not ( = ?auto_542989 ?auto_542995 ) ) ( not ( = ?auto_542989 ?auto_542996 ) ) ( not ( = ?auto_542989 ?auto_542997 ) ) ( not ( = ?auto_542989 ?auto_542998 ) ) ( not ( = ?auto_542990 ?auto_542991 ) ) ( not ( = ?auto_542990 ?auto_542992 ) ) ( not ( = ?auto_542990 ?auto_542993 ) ) ( not ( = ?auto_542990 ?auto_542994 ) ) ( not ( = ?auto_542990 ?auto_542995 ) ) ( not ( = ?auto_542990 ?auto_542996 ) ) ( not ( = ?auto_542990 ?auto_542997 ) ) ( not ( = ?auto_542990 ?auto_542998 ) ) ( not ( = ?auto_542991 ?auto_542992 ) ) ( not ( = ?auto_542991 ?auto_542993 ) ) ( not ( = ?auto_542991 ?auto_542994 ) ) ( not ( = ?auto_542991 ?auto_542995 ) ) ( not ( = ?auto_542991 ?auto_542996 ) ) ( not ( = ?auto_542991 ?auto_542997 ) ) ( not ( = ?auto_542991 ?auto_542998 ) ) ( not ( = ?auto_542992 ?auto_542993 ) ) ( not ( = ?auto_542992 ?auto_542994 ) ) ( not ( = ?auto_542992 ?auto_542995 ) ) ( not ( = ?auto_542992 ?auto_542996 ) ) ( not ( = ?auto_542992 ?auto_542997 ) ) ( not ( = ?auto_542992 ?auto_542998 ) ) ( not ( = ?auto_542993 ?auto_542994 ) ) ( not ( = ?auto_542993 ?auto_542995 ) ) ( not ( = ?auto_542993 ?auto_542996 ) ) ( not ( = ?auto_542993 ?auto_542997 ) ) ( not ( = ?auto_542993 ?auto_542998 ) ) ( not ( = ?auto_542994 ?auto_542995 ) ) ( not ( = ?auto_542994 ?auto_542996 ) ) ( not ( = ?auto_542994 ?auto_542997 ) ) ( not ( = ?auto_542994 ?auto_542998 ) ) ( not ( = ?auto_542995 ?auto_542996 ) ) ( not ( = ?auto_542995 ?auto_542997 ) ) ( not ( = ?auto_542995 ?auto_542998 ) ) ( not ( = ?auto_542996 ?auto_542997 ) ) ( not ( = ?auto_542996 ?auto_542998 ) ) ( not ( = ?auto_542997 ?auto_542998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_542997 ?auto_542998 )
      ( !STACK ?auto_542997 ?auto_542996 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543039 - BLOCK
      ?auto_543040 - BLOCK
      ?auto_543041 - BLOCK
      ?auto_543042 - BLOCK
      ?auto_543043 - BLOCK
      ?auto_543044 - BLOCK
      ?auto_543045 - BLOCK
      ?auto_543046 - BLOCK
      ?auto_543047 - BLOCK
      ?auto_543048 - BLOCK
      ?auto_543049 - BLOCK
      ?auto_543050 - BLOCK
      ?auto_543051 - BLOCK
    )
    :vars
    (
      ?auto_543052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543051 ?auto_543052 ) ( ON-TABLE ?auto_543039 ) ( ON ?auto_543040 ?auto_543039 ) ( ON ?auto_543041 ?auto_543040 ) ( ON ?auto_543042 ?auto_543041 ) ( ON ?auto_543043 ?auto_543042 ) ( ON ?auto_543044 ?auto_543043 ) ( ON ?auto_543045 ?auto_543044 ) ( ON ?auto_543046 ?auto_543045 ) ( ON ?auto_543047 ?auto_543046 ) ( ON ?auto_543048 ?auto_543047 ) ( ON ?auto_543049 ?auto_543048 ) ( not ( = ?auto_543039 ?auto_543040 ) ) ( not ( = ?auto_543039 ?auto_543041 ) ) ( not ( = ?auto_543039 ?auto_543042 ) ) ( not ( = ?auto_543039 ?auto_543043 ) ) ( not ( = ?auto_543039 ?auto_543044 ) ) ( not ( = ?auto_543039 ?auto_543045 ) ) ( not ( = ?auto_543039 ?auto_543046 ) ) ( not ( = ?auto_543039 ?auto_543047 ) ) ( not ( = ?auto_543039 ?auto_543048 ) ) ( not ( = ?auto_543039 ?auto_543049 ) ) ( not ( = ?auto_543039 ?auto_543050 ) ) ( not ( = ?auto_543039 ?auto_543051 ) ) ( not ( = ?auto_543039 ?auto_543052 ) ) ( not ( = ?auto_543040 ?auto_543041 ) ) ( not ( = ?auto_543040 ?auto_543042 ) ) ( not ( = ?auto_543040 ?auto_543043 ) ) ( not ( = ?auto_543040 ?auto_543044 ) ) ( not ( = ?auto_543040 ?auto_543045 ) ) ( not ( = ?auto_543040 ?auto_543046 ) ) ( not ( = ?auto_543040 ?auto_543047 ) ) ( not ( = ?auto_543040 ?auto_543048 ) ) ( not ( = ?auto_543040 ?auto_543049 ) ) ( not ( = ?auto_543040 ?auto_543050 ) ) ( not ( = ?auto_543040 ?auto_543051 ) ) ( not ( = ?auto_543040 ?auto_543052 ) ) ( not ( = ?auto_543041 ?auto_543042 ) ) ( not ( = ?auto_543041 ?auto_543043 ) ) ( not ( = ?auto_543041 ?auto_543044 ) ) ( not ( = ?auto_543041 ?auto_543045 ) ) ( not ( = ?auto_543041 ?auto_543046 ) ) ( not ( = ?auto_543041 ?auto_543047 ) ) ( not ( = ?auto_543041 ?auto_543048 ) ) ( not ( = ?auto_543041 ?auto_543049 ) ) ( not ( = ?auto_543041 ?auto_543050 ) ) ( not ( = ?auto_543041 ?auto_543051 ) ) ( not ( = ?auto_543041 ?auto_543052 ) ) ( not ( = ?auto_543042 ?auto_543043 ) ) ( not ( = ?auto_543042 ?auto_543044 ) ) ( not ( = ?auto_543042 ?auto_543045 ) ) ( not ( = ?auto_543042 ?auto_543046 ) ) ( not ( = ?auto_543042 ?auto_543047 ) ) ( not ( = ?auto_543042 ?auto_543048 ) ) ( not ( = ?auto_543042 ?auto_543049 ) ) ( not ( = ?auto_543042 ?auto_543050 ) ) ( not ( = ?auto_543042 ?auto_543051 ) ) ( not ( = ?auto_543042 ?auto_543052 ) ) ( not ( = ?auto_543043 ?auto_543044 ) ) ( not ( = ?auto_543043 ?auto_543045 ) ) ( not ( = ?auto_543043 ?auto_543046 ) ) ( not ( = ?auto_543043 ?auto_543047 ) ) ( not ( = ?auto_543043 ?auto_543048 ) ) ( not ( = ?auto_543043 ?auto_543049 ) ) ( not ( = ?auto_543043 ?auto_543050 ) ) ( not ( = ?auto_543043 ?auto_543051 ) ) ( not ( = ?auto_543043 ?auto_543052 ) ) ( not ( = ?auto_543044 ?auto_543045 ) ) ( not ( = ?auto_543044 ?auto_543046 ) ) ( not ( = ?auto_543044 ?auto_543047 ) ) ( not ( = ?auto_543044 ?auto_543048 ) ) ( not ( = ?auto_543044 ?auto_543049 ) ) ( not ( = ?auto_543044 ?auto_543050 ) ) ( not ( = ?auto_543044 ?auto_543051 ) ) ( not ( = ?auto_543044 ?auto_543052 ) ) ( not ( = ?auto_543045 ?auto_543046 ) ) ( not ( = ?auto_543045 ?auto_543047 ) ) ( not ( = ?auto_543045 ?auto_543048 ) ) ( not ( = ?auto_543045 ?auto_543049 ) ) ( not ( = ?auto_543045 ?auto_543050 ) ) ( not ( = ?auto_543045 ?auto_543051 ) ) ( not ( = ?auto_543045 ?auto_543052 ) ) ( not ( = ?auto_543046 ?auto_543047 ) ) ( not ( = ?auto_543046 ?auto_543048 ) ) ( not ( = ?auto_543046 ?auto_543049 ) ) ( not ( = ?auto_543046 ?auto_543050 ) ) ( not ( = ?auto_543046 ?auto_543051 ) ) ( not ( = ?auto_543046 ?auto_543052 ) ) ( not ( = ?auto_543047 ?auto_543048 ) ) ( not ( = ?auto_543047 ?auto_543049 ) ) ( not ( = ?auto_543047 ?auto_543050 ) ) ( not ( = ?auto_543047 ?auto_543051 ) ) ( not ( = ?auto_543047 ?auto_543052 ) ) ( not ( = ?auto_543048 ?auto_543049 ) ) ( not ( = ?auto_543048 ?auto_543050 ) ) ( not ( = ?auto_543048 ?auto_543051 ) ) ( not ( = ?auto_543048 ?auto_543052 ) ) ( not ( = ?auto_543049 ?auto_543050 ) ) ( not ( = ?auto_543049 ?auto_543051 ) ) ( not ( = ?auto_543049 ?auto_543052 ) ) ( not ( = ?auto_543050 ?auto_543051 ) ) ( not ( = ?auto_543050 ?auto_543052 ) ) ( not ( = ?auto_543051 ?auto_543052 ) ) ( CLEAR ?auto_543049 ) ( ON ?auto_543050 ?auto_543051 ) ( CLEAR ?auto_543050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_543039 ?auto_543040 ?auto_543041 ?auto_543042 ?auto_543043 ?auto_543044 ?auto_543045 ?auto_543046 ?auto_543047 ?auto_543048 ?auto_543049 ?auto_543050 )
      ( MAKE-13PILE ?auto_543039 ?auto_543040 ?auto_543041 ?auto_543042 ?auto_543043 ?auto_543044 ?auto_543045 ?auto_543046 ?auto_543047 ?auto_543048 ?auto_543049 ?auto_543050 ?auto_543051 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543093 - BLOCK
      ?auto_543094 - BLOCK
      ?auto_543095 - BLOCK
      ?auto_543096 - BLOCK
      ?auto_543097 - BLOCK
      ?auto_543098 - BLOCK
      ?auto_543099 - BLOCK
      ?auto_543100 - BLOCK
      ?auto_543101 - BLOCK
      ?auto_543102 - BLOCK
      ?auto_543103 - BLOCK
      ?auto_543104 - BLOCK
      ?auto_543105 - BLOCK
    )
    :vars
    (
      ?auto_543106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543105 ?auto_543106 ) ( ON-TABLE ?auto_543093 ) ( ON ?auto_543094 ?auto_543093 ) ( ON ?auto_543095 ?auto_543094 ) ( ON ?auto_543096 ?auto_543095 ) ( ON ?auto_543097 ?auto_543096 ) ( ON ?auto_543098 ?auto_543097 ) ( ON ?auto_543099 ?auto_543098 ) ( ON ?auto_543100 ?auto_543099 ) ( ON ?auto_543101 ?auto_543100 ) ( ON ?auto_543102 ?auto_543101 ) ( not ( = ?auto_543093 ?auto_543094 ) ) ( not ( = ?auto_543093 ?auto_543095 ) ) ( not ( = ?auto_543093 ?auto_543096 ) ) ( not ( = ?auto_543093 ?auto_543097 ) ) ( not ( = ?auto_543093 ?auto_543098 ) ) ( not ( = ?auto_543093 ?auto_543099 ) ) ( not ( = ?auto_543093 ?auto_543100 ) ) ( not ( = ?auto_543093 ?auto_543101 ) ) ( not ( = ?auto_543093 ?auto_543102 ) ) ( not ( = ?auto_543093 ?auto_543103 ) ) ( not ( = ?auto_543093 ?auto_543104 ) ) ( not ( = ?auto_543093 ?auto_543105 ) ) ( not ( = ?auto_543093 ?auto_543106 ) ) ( not ( = ?auto_543094 ?auto_543095 ) ) ( not ( = ?auto_543094 ?auto_543096 ) ) ( not ( = ?auto_543094 ?auto_543097 ) ) ( not ( = ?auto_543094 ?auto_543098 ) ) ( not ( = ?auto_543094 ?auto_543099 ) ) ( not ( = ?auto_543094 ?auto_543100 ) ) ( not ( = ?auto_543094 ?auto_543101 ) ) ( not ( = ?auto_543094 ?auto_543102 ) ) ( not ( = ?auto_543094 ?auto_543103 ) ) ( not ( = ?auto_543094 ?auto_543104 ) ) ( not ( = ?auto_543094 ?auto_543105 ) ) ( not ( = ?auto_543094 ?auto_543106 ) ) ( not ( = ?auto_543095 ?auto_543096 ) ) ( not ( = ?auto_543095 ?auto_543097 ) ) ( not ( = ?auto_543095 ?auto_543098 ) ) ( not ( = ?auto_543095 ?auto_543099 ) ) ( not ( = ?auto_543095 ?auto_543100 ) ) ( not ( = ?auto_543095 ?auto_543101 ) ) ( not ( = ?auto_543095 ?auto_543102 ) ) ( not ( = ?auto_543095 ?auto_543103 ) ) ( not ( = ?auto_543095 ?auto_543104 ) ) ( not ( = ?auto_543095 ?auto_543105 ) ) ( not ( = ?auto_543095 ?auto_543106 ) ) ( not ( = ?auto_543096 ?auto_543097 ) ) ( not ( = ?auto_543096 ?auto_543098 ) ) ( not ( = ?auto_543096 ?auto_543099 ) ) ( not ( = ?auto_543096 ?auto_543100 ) ) ( not ( = ?auto_543096 ?auto_543101 ) ) ( not ( = ?auto_543096 ?auto_543102 ) ) ( not ( = ?auto_543096 ?auto_543103 ) ) ( not ( = ?auto_543096 ?auto_543104 ) ) ( not ( = ?auto_543096 ?auto_543105 ) ) ( not ( = ?auto_543096 ?auto_543106 ) ) ( not ( = ?auto_543097 ?auto_543098 ) ) ( not ( = ?auto_543097 ?auto_543099 ) ) ( not ( = ?auto_543097 ?auto_543100 ) ) ( not ( = ?auto_543097 ?auto_543101 ) ) ( not ( = ?auto_543097 ?auto_543102 ) ) ( not ( = ?auto_543097 ?auto_543103 ) ) ( not ( = ?auto_543097 ?auto_543104 ) ) ( not ( = ?auto_543097 ?auto_543105 ) ) ( not ( = ?auto_543097 ?auto_543106 ) ) ( not ( = ?auto_543098 ?auto_543099 ) ) ( not ( = ?auto_543098 ?auto_543100 ) ) ( not ( = ?auto_543098 ?auto_543101 ) ) ( not ( = ?auto_543098 ?auto_543102 ) ) ( not ( = ?auto_543098 ?auto_543103 ) ) ( not ( = ?auto_543098 ?auto_543104 ) ) ( not ( = ?auto_543098 ?auto_543105 ) ) ( not ( = ?auto_543098 ?auto_543106 ) ) ( not ( = ?auto_543099 ?auto_543100 ) ) ( not ( = ?auto_543099 ?auto_543101 ) ) ( not ( = ?auto_543099 ?auto_543102 ) ) ( not ( = ?auto_543099 ?auto_543103 ) ) ( not ( = ?auto_543099 ?auto_543104 ) ) ( not ( = ?auto_543099 ?auto_543105 ) ) ( not ( = ?auto_543099 ?auto_543106 ) ) ( not ( = ?auto_543100 ?auto_543101 ) ) ( not ( = ?auto_543100 ?auto_543102 ) ) ( not ( = ?auto_543100 ?auto_543103 ) ) ( not ( = ?auto_543100 ?auto_543104 ) ) ( not ( = ?auto_543100 ?auto_543105 ) ) ( not ( = ?auto_543100 ?auto_543106 ) ) ( not ( = ?auto_543101 ?auto_543102 ) ) ( not ( = ?auto_543101 ?auto_543103 ) ) ( not ( = ?auto_543101 ?auto_543104 ) ) ( not ( = ?auto_543101 ?auto_543105 ) ) ( not ( = ?auto_543101 ?auto_543106 ) ) ( not ( = ?auto_543102 ?auto_543103 ) ) ( not ( = ?auto_543102 ?auto_543104 ) ) ( not ( = ?auto_543102 ?auto_543105 ) ) ( not ( = ?auto_543102 ?auto_543106 ) ) ( not ( = ?auto_543103 ?auto_543104 ) ) ( not ( = ?auto_543103 ?auto_543105 ) ) ( not ( = ?auto_543103 ?auto_543106 ) ) ( not ( = ?auto_543104 ?auto_543105 ) ) ( not ( = ?auto_543104 ?auto_543106 ) ) ( not ( = ?auto_543105 ?auto_543106 ) ) ( ON ?auto_543104 ?auto_543105 ) ( CLEAR ?auto_543102 ) ( ON ?auto_543103 ?auto_543104 ) ( CLEAR ?auto_543103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_543093 ?auto_543094 ?auto_543095 ?auto_543096 ?auto_543097 ?auto_543098 ?auto_543099 ?auto_543100 ?auto_543101 ?auto_543102 ?auto_543103 )
      ( MAKE-13PILE ?auto_543093 ?auto_543094 ?auto_543095 ?auto_543096 ?auto_543097 ?auto_543098 ?auto_543099 ?auto_543100 ?auto_543101 ?auto_543102 ?auto_543103 ?auto_543104 ?auto_543105 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543147 - BLOCK
      ?auto_543148 - BLOCK
      ?auto_543149 - BLOCK
      ?auto_543150 - BLOCK
      ?auto_543151 - BLOCK
      ?auto_543152 - BLOCK
      ?auto_543153 - BLOCK
      ?auto_543154 - BLOCK
      ?auto_543155 - BLOCK
      ?auto_543156 - BLOCK
      ?auto_543157 - BLOCK
      ?auto_543158 - BLOCK
      ?auto_543159 - BLOCK
    )
    :vars
    (
      ?auto_543160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543159 ?auto_543160 ) ( ON-TABLE ?auto_543147 ) ( ON ?auto_543148 ?auto_543147 ) ( ON ?auto_543149 ?auto_543148 ) ( ON ?auto_543150 ?auto_543149 ) ( ON ?auto_543151 ?auto_543150 ) ( ON ?auto_543152 ?auto_543151 ) ( ON ?auto_543153 ?auto_543152 ) ( ON ?auto_543154 ?auto_543153 ) ( ON ?auto_543155 ?auto_543154 ) ( not ( = ?auto_543147 ?auto_543148 ) ) ( not ( = ?auto_543147 ?auto_543149 ) ) ( not ( = ?auto_543147 ?auto_543150 ) ) ( not ( = ?auto_543147 ?auto_543151 ) ) ( not ( = ?auto_543147 ?auto_543152 ) ) ( not ( = ?auto_543147 ?auto_543153 ) ) ( not ( = ?auto_543147 ?auto_543154 ) ) ( not ( = ?auto_543147 ?auto_543155 ) ) ( not ( = ?auto_543147 ?auto_543156 ) ) ( not ( = ?auto_543147 ?auto_543157 ) ) ( not ( = ?auto_543147 ?auto_543158 ) ) ( not ( = ?auto_543147 ?auto_543159 ) ) ( not ( = ?auto_543147 ?auto_543160 ) ) ( not ( = ?auto_543148 ?auto_543149 ) ) ( not ( = ?auto_543148 ?auto_543150 ) ) ( not ( = ?auto_543148 ?auto_543151 ) ) ( not ( = ?auto_543148 ?auto_543152 ) ) ( not ( = ?auto_543148 ?auto_543153 ) ) ( not ( = ?auto_543148 ?auto_543154 ) ) ( not ( = ?auto_543148 ?auto_543155 ) ) ( not ( = ?auto_543148 ?auto_543156 ) ) ( not ( = ?auto_543148 ?auto_543157 ) ) ( not ( = ?auto_543148 ?auto_543158 ) ) ( not ( = ?auto_543148 ?auto_543159 ) ) ( not ( = ?auto_543148 ?auto_543160 ) ) ( not ( = ?auto_543149 ?auto_543150 ) ) ( not ( = ?auto_543149 ?auto_543151 ) ) ( not ( = ?auto_543149 ?auto_543152 ) ) ( not ( = ?auto_543149 ?auto_543153 ) ) ( not ( = ?auto_543149 ?auto_543154 ) ) ( not ( = ?auto_543149 ?auto_543155 ) ) ( not ( = ?auto_543149 ?auto_543156 ) ) ( not ( = ?auto_543149 ?auto_543157 ) ) ( not ( = ?auto_543149 ?auto_543158 ) ) ( not ( = ?auto_543149 ?auto_543159 ) ) ( not ( = ?auto_543149 ?auto_543160 ) ) ( not ( = ?auto_543150 ?auto_543151 ) ) ( not ( = ?auto_543150 ?auto_543152 ) ) ( not ( = ?auto_543150 ?auto_543153 ) ) ( not ( = ?auto_543150 ?auto_543154 ) ) ( not ( = ?auto_543150 ?auto_543155 ) ) ( not ( = ?auto_543150 ?auto_543156 ) ) ( not ( = ?auto_543150 ?auto_543157 ) ) ( not ( = ?auto_543150 ?auto_543158 ) ) ( not ( = ?auto_543150 ?auto_543159 ) ) ( not ( = ?auto_543150 ?auto_543160 ) ) ( not ( = ?auto_543151 ?auto_543152 ) ) ( not ( = ?auto_543151 ?auto_543153 ) ) ( not ( = ?auto_543151 ?auto_543154 ) ) ( not ( = ?auto_543151 ?auto_543155 ) ) ( not ( = ?auto_543151 ?auto_543156 ) ) ( not ( = ?auto_543151 ?auto_543157 ) ) ( not ( = ?auto_543151 ?auto_543158 ) ) ( not ( = ?auto_543151 ?auto_543159 ) ) ( not ( = ?auto_543151 ?auto_543160 ) ) ( not ( = ?auto_543152 ?auto_543153 ) ) ( not ( = ?auto_543152 ?auto_543154 ) ) ( not ( = ?auto_543152 ?auto_543155 ) ) ( not ( = ?auto_543152 ?auto_543156 ) ) ( not ( = ?auto_543152 ?auto_543157 ) ) ( not ( = ?auto_543152 ?auto_543158 ) ) ( not ( = ?auto_543152 ?auto_543159 ) ) ( not ( = ?auto_543152 ?auto_543160 ) ) ( not ( = ?auto_543153 ?auto_543154 ) ) ( not ( = ?auto_543153 ?auto_543155 ) ) ( not ( = ?auto_543153 ?auto_543156 ) ) ( not ( = ?auto_543153 ?auto_543157 ) ) ( not ( = ?auto_543153 ?auto_543158 ) ) ( not ( = ?auto_543153 ?auto_543159 ) ) ( not ( = ?auto_543153 ?auto_543160 ) ) ( not ( = ?auto_543154 ?auto_543155 ) ) ( not ( = ?auto_543154 ?auto_543156 ) ) ( not ( = ?auto_543154 ?auto_543157 ) ) ( not ( = ?auto_543154 ?auto_543158 ) ) ( not ( = ?auto_543154 ?auto_543159 ) ) ( not ( = ?auto_543154 ?auto_543160 ) ) ( not ( = ?auto_543155 ?auto_543156 ) ) ( not ( = ?auto_543155 ?auto_543157 ) ) ( not ( = ?auto_543155 ?auto_543158 ) ) ( not ( = ?auto_543155 ?auto_543159 ) ) ( not ( = ?auto_543155 ?auto_543160 ) ) ( not ( = ?auto_543156 ?auto_543157 ) ) ( not ( = ?auto_543156 ?auto_543158 ) ) ( not ( = ?auto_543156 ?auto_543159 ) ) ( not ( = ?auto_543156 ?auto_543160 ) ) ( not ( = ?auto_543157 ?auto_543158 ) ) ( not ( = ?auto_543157 ?auto_543159 ) ) ( not ( = ?auto_543157 ?auto_543160 ) ) ( not ( = ?auto_543158 ?auto_543159 ) ) ( not ( = ?auto_543158 ?auto_543160 ) ) ( not ( = ?auto_543159 ?auto_543160 ) ) ( ON ?auto_543158 ?auto_543159 ) ( ON ?auto_543157 ?auto_543158 ) ( CLEAR ?auto_543155 ) ( ON ?auto_543156 ?auto_543157 ) ( CLEAR ?auto_543156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_543147 ?auto_543148 ?auto_543149 ?auto_543150 ?auto_543151 ?auto_543152 ?auto_543153 ?auto_543154 ?auto_543155 ?auto_543156 )
      ( MAKE-13PILE ?auto_543147 ?auto_543148 ?auto_543149 ?auto_543150 ?auto_543151 ?auto_543152 ?auto_543153 ?auto_543154 ?auto_543155 ?auto_543156 ?auto_543157 ?auto_543158 ?auto_543159 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543201 - BLOCK
      ?auto_543202 - BLOCK
      ?auto_543203 - BLOCK
      ?auto_543204 - BLOCK
      ?auto_543205 - BLOCK
      ?auto_543206 - BLOCK
      ?auto_543207 - BLOCK
      ?auto_543208 - BLOCK
      ?auto_543209 - BLOCK
      ?auto_543210 - BLOCK
      ?auto_543211 - BLOCK
      ?auto_543212 - BLOCK
      ?auto_543213 - BLOCK
    )
    :vars
    (
      ?auto_543214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543213 ?auto_543214 ) ( ON-TABLE ?auto_543201 ) ( ON ?auto_543202 ?auto_543201 ) ( ON ?auto_543203 ?auto_543202 ) ( ON ?auto_543204 ?auto_543203 ) ( ON ?auto_543205 ?auto_543204 ) ( ON ?auto_543206 ?auto_543205 ) ( ON ?auto_543207 ?auto_543206 ) ( ON ?auto_543208 ?auto_543207 ) ( not ( = ?auto_543201 ?auto_543202 ) ) ( not ( = ?auto_543201 ?auto_543203 ) ) ( not ( = ?auto_543201 ?auto_543204 ) ) ( not ( = ?auto_543201 ?auto_543205 ) ) ( not ( = ?auto_543201 ?auto_543206 ) ) ( not ( = ?auto_543201 ?auto_543207 ) ) ( not ( = ?auto_543201 ?auto_543208 ) ) ( not ( = ?auto_543201 ?auto_543209 ) ) ( not ( = ?auto_543201 ?auto_543210 ) ) ( not ( = ?auto_543201 ?auto_543211 ) ) ( not ( = ?auto_543201 ?auto_543212 ) ) ( not ( = ?auto_543201 ?auto_543213 ) ) ( not ( = ?auto_543201 ?auto_543214 ) ) ( not ( = ?auto_543202 ?auto_543203 ) ) ( not ( = ?auto_543202 ?auto_543204 ) ) ( not ( = ?auto_543202 ?auto_543205 ) ) ( not ( = ?auto_543202 ?auto_543206 ) ) ( not ( = ?auto_543202 ?auto_543207 ) ) ( not ( = ?auto_543202 ?auto_543208 ) ) ( not ( = ?auto_543202 ?auto_543209 ) ) ( not ( = ?auto_543202 ?auto_543210 ) ) ( not ( = ?auto_543202 ?auto_543211 ) ) ( not ( = ?auto_543202 ?auto_543212 ) ) ( not ( = ?auto_543202 ?auto_543213 ) ) ( not ( = ?auto_543202 ?auto_543214 ) ) ( not ( = ?auto_543203 ?auto_543204 ) ) ( not ( = ?auto_543203 ?auto_543205 ) ) ( not ( = ?auto_543203 ?auto_543206 ) ) ( not ( = ?auto_543203 ?auto_543207 ) ) ( not ( = ?auto_543203 ?auto_543208 ) ) ( not ( = ?auto_543203 ?auto_543209 ) ) ( not ( = ?auto_543203 ?auto_543210 ) ) ( not ( = ?auto_543203 ?auto_543211 ) ) ( not ( = ?auto_543203 ?auto_543212 ) ) ( not ( = ?auto_543203 ?auto_543213 ) ) ( not ( = ?auto_543203 ?auto_543214 ) ) ( not ( = ?auto_543204 ?auto_543205 ) ) ( not ( = ?auto_543204 ?auto_543206 ) ) ( not ( = ?auto_543204 ?auto_543207 ) ) ( not ( = ?auto_543204 ?auto_543208 ) ) ( not ( = ?auto_543204 ?auto_543209 ) ) ( not ( = ?auto_543204 ?auto_543210 ) ) ( not ( = ?auto_543204 ?auto_543211 ) ) ( not ( = ?auto_543204 ?auto_543212 ) ) ( not ( = ?auto_543204 ?auto_543213 ) ) ( not ( = ?auto_543204 ?auto_543214 ) ) ( not ( = ?auto_543205 ?auto_543206 ) ) ( not ( = ?auto_543205 ?auto_543207 ) ) ( not ( = ?auto_543205 ?auto_543208 ) ) ( not ( = ?auto_543205 ?auto_543209 ) ) ( not ( = ?auto_543205 ?auto_543210 ) ) ( not ( = ?auto_543205 ?auto_543211 ) ) ( not ( = ?auto_543205 ?auto_543212 ) ) ( not ( = ?auto_543205 ?auto_543213 ) ) ( not ( = ?auto_543205 ?auto_543214 ) ) ( not ( = ?auto_543206 ?auto_543207 ) ) ( not ( = ?auto_543206 ?auto_543208 ) ) ( not ( = ?auto_543206 ?auto_543209 ) ) ( not ( = ?auto_543206 ?auto_543210 ) ) ( not ( = ?auto_543206 ?auto_543211 ) ) ( not ( = ?auto_543206 ?auto_543212 ) ) ( not ( = ?auto_543206 ?auto_543213 ) ) ( not ( = ?auto_543206 ?auto_543214 ) ) ( not ( = ?auto_543207 ?auto_543208 ) ) ( not ( = ?auto_543207 ?auto_543209 ) ) ( not ( = ?auto_543207 ?auto_543210 ) ) ( not ( = ?auto_543207 ?auto_543211 ) ) ( not ( = ?auto_543207 ?auto_543212 ) ) ( not ( = ?auto_543207 ?auto_543213 ) ) ( not ( = ?auto_543207 ?auto_543214 ) ) ( not ( = ?auto_543208 ?auto_543209 ) ) ( not ( = ?auto_543208 ?auto_543210 ) ) ( not ( = ?auto_543208 ?auto_543211 ) ) ( not ( = ?auto_543208 ?auto_543212 ) ) ( not ( = ?auto_543208 ?auto_543213 ) ) ( not ( = ?auto_543208 ?auto_543214 ) ) ( not ( = ?auto_543209 ?auto_543210 ) ) ( not ( = ?auto_543209 ?auto_543211 ) ) ( not ( = ?auto_543209 ?auto_543212 ) ) ( not ( = ?auto_543209 ?auto_543213 ) ) ( not ( = ?auto_543209 ?auto_543214 ) ) ( not ( = ?auto_543210 ?auto_543211 ) ) ( not ( = ?auto_543210 ?auto_543212 ) ) ( not ( = ?auto_543210 ?auto_543213 ) ) ( not ( = ?auto_543210 ?auto_543214 ) ) ( not ( = ?auto_543211 ?auto_543212 ) ) ( not ( = ?auto_543211 ?auto_543213 ) ) ( not ( = ?auto_543211 ?auto_543214 ) ) ( not ( = ?auto_543212 ?auto_543213 ) ) ( not ( = ?auto_543212 ?auto_543214 ) ) ( not ( = ?auto_543213 ?auto_543214 ) ) ( ON ?auto_543212 ?auto_543213 ) ( ON ?auto_543211 ?auto_543212 ) ( ON ?auto_543210 ?auto_543211 ) ( CLEAR ?auto_543208 ) ( ON ?auto_543209 ?auto_543210 ) ( CLEAR ?auto_543209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_543201 ?auto_543202 ?auto_543203 ?auto_543204 ?auto_543205 ?auto_543206 ?auto_543207 ?auto_543208 ?auto_543209 )
      ( MAKE-13PILE ?auto_543201 ?auto_543202 ?auto_543203 ?auto_543204 ?auto_543205 ?auto_543206 ?auto_543207 ?auto_543208 ?auto_543209 ?auto_543210 ?auto_543211 ?auto_543212 ?auto_543213 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543255 - BLOCK
      ?auto_543256 - BLOCK
      ?auto_543257 - BLOCK
      ?auto_543258 - BLOCK
      ?auto_543259 - BLOCK
      ?auto_543260 - BLOCK
      ?auto_543261 - BLOCK
      ?auto_543262 - BLOCK
      ?auto_543263 - BLOCK
      ?auto_543264 - BLOCK
      ?auto_543265 - BLOCK
      ?auto_543266 - BLOCK
      ?auto_543267 - BLOCK
    )
    :vars
    (
      ?auto_543268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543267 ?auto_543268 ) ( ON-TABLE ?auto_543255 ) ( ON ?auto_543256 ?auto_543255 ) ( ON ?auto_543257 ?auto_543256 ) ( ON ?auto_543258 ?auto_543257 ) ( ON ?auto_543259 ?auto_543258 ) ( ON ?auto_543260 ?auto_543259 ) ( ON ?auto_543261 ?auto_543260 ) ( not ( = ?auto_543255 ?auto_543256 ) ) ( not ( = ?auto_543255 ?auto_543257 ) ) ( not ( = ?auto_543255 ?auto_543258 ) ) ( not ( = ?auto_543255 ?auto_543259 ) ) ( not ( = ?auto_543255 ?auto_543260 ) ) ( not ( = ?auto_543255 ?auto_543261 ) ) ( not ( = ?auto_543255 ?auto_543262 ) ) ( not ( = ?auto_543255 ?auto_543263 ) ) ( not ( = ?auto_543255 ?auto_543264 ) ) ( not ( = ?auto_543255 ?auto_543265 ) ) ( not ( = ?auto_543255 ?auto_543266 ) ) ( not ( = ?auto_543255 ?auto_543267 ) ) ( not ( = ?auto_543255 ?auto_543268 ) ) ( not ( = ?auto_543256 ?auto_543257 ) ) ( not ( = ?auto_543256 ?auto_543258 ) ) ( not ( = ?auto_543256 ?auto_543259 ) ) ( not ( = ?auto_543256 ?auto_543260 ) ) ( not ( = ?auto_543256 ?auto_543261 ) ) ( not ( = ?auto_543256 ?auto_543262 ) ) ( not ( = ?auto_543256 ?auto_543263 ) ) ( not ( = ?auto_543256 ?auto_543264 ) ) ( not ( = ?auto_543256 ?auto_543265 ) ) ( not ( = ?auto_543256 ?auto_543266 ) ) ( not ( = ?auto_543256 ?auto_543267 ) ) ( not ( = ?auto_543256 ?auto_543268 ) ) ( not ( = ?auto_543257 ?auto_543258 ) ) ( not ( = ?auto_543257 ?auto_543259 ) ) ( not ( = ?auto_543257 ?auto_543260 ) ) ( not ( = ?auto_543257 ?auto_543261 ) ) ( not ( = ?auto_543257 ?auto_543262 ) ) ( not ( = ?auto_543257 ?auto_543263 ) ) ( not ( = ?auto_543257 ?auto_543264 ) ) ( not ( = ?auto_543257 ?auto_543265 ) ) ( not ( = ?auto_543257 ?auto_543266 ) ) ( not ( = ?auto_543257 ?auto_543267 ) ) ( not ( = ?auto_543257 ?auto_543268 ) ) ( not ( = ?auto_543258 ?auto_543259 ) ) ( not ( = ?auto_543258 ?auto_543260 ) ) ( not ( = ?auto_543258 ?auto_543261 ) ) ( not ( = ?auto_543258 ?auto_543262 ) ) ( not ( = ?auto_543258 ?auto_543263 ) ) ( not ( = ?auto_543258 ?auto_543264 ) ) ( not ( = ?auto_543258 ?auto_543265 ) ) ( not ( = ?auto_543258 ?auto_543266 ) ) ( not ( = ?auto_543258 ?auto_543267 ) ) ( not ( = ?auto_543258 ?auto_543268 ) ) ( not ( = ?auto_543259 ?auto_543260 ) ) ( not ( = ?auto_543259 ?auto_543261 ) ) ( not ( = ?auto_543259 ?auto_543262 ) ) ( not ( = ?auto_543259 ?auto_543263 ) ) ( not ( = ?auto_543259 ?auto_543264 ) ) ( not ( = ?auto_543259 ?auto_543265 ) ) ( not ( = ?auto_543259 ?auto_543266 ) ) ( not ( = ?auto_543259 ?auto_543267 ) ) ( not ( = ?auto_543259 ?auto_543268 ) ) ( not ( = ?auto_543260 ?auto_543261 ) ) ( not ( = ?auto_543260 ?auto_543262 ) ) ( not ( = ?auto_543260 ?auto_543263 ) ) ( not ( = ?auto_543260 ?auto_543264 ) ) ( not ( = ?auto_543260 ?auto_543265 ) ) ( not ( = ?auto_543260 ?auto_543266 ) ) ( not ( = ?auto_543260 ?auto_543267 ) ) ( not ( = ?auto_543260 ?auto_543268 ) ) ( not ( = ?auto_543261 ?auto_543262 ) ) ( not ( = ?auto_543261 ?auto_543263 ) ) ( not ( = ?auto_543261 ?auto_543264 ) ) ( not ( = ?auto_543261 ?auto_543265 ) ) ( not ( = ?auto_543261 ?auto_543266 ) ) ( not ( = ?auto_543261 ?auto_543267 ) ) ( not ( = ?auto_543261 ?auto_543268 ) ) ( not ( = ?auto_543262 ?auto_543263 ) ) ( not ( = ?auto_543262 ?auto_543264 ) ) ( not ( = ?auto_543262 ?auto_543265 ) ) ( not ( = ?auto_543262 ?auto_543266 ) ) ( not ( = ?auto_543262 ?auto_543267 ) ) ( not ( = ?auto_543262 ?auto_543268 ) ) ( not ( = ?auto_543263 ?auto_543264 ) ) ( not ( = ?auto_543263 ?auto_543265 ) ) ( not ( = ?auto_543263 ?auto_543266 ) ) ( not ( = ?auto_543263 ?auto_543267 ) ) ( not ( = ?auto_543263 ?auto_543268 ) ) ( not ( = ?auto_543264 ?auto_543265 ) ) ( not ( = ?auto_543264 ?auto_543266 ) ) ( not ( = ?auto_543264 ?auto_543267 ) ) ( not ( = ?auto_543264 ?auto_543268 ) ) ( not ( = ?auto_543265 ?auto_543266 ) ) ( not ( = ?auto_543265 ?auto_543267 ) ) ( not ( = ?auto_543265 ?auto_543268 ) ) ( not ( = ?auto_543266 ?auto_543267 ) ) ( not ( = ?auto_543266 ?auto_543268 ) ) ( not ( = ?auto_543267 ?auto_543268 ) ) ( ON ?auto_543266 ?auto_543267 ) ( ON ?auto_543265 ?auto_543266 ) ( ON ?auto_543264 ?auto_543265 ) ( ON ?auto_543263 ?auto_543264 ) ( CLEAR ?auto_543261 ) ( ON ?auto_543262 ?auto_543263 ) ( CLEAR ?auto_543262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_543255 ?auto_543256 ?auto_543257 ?auto_543258 ?auto_543259 ?auto_543260 ?auto_543261 ?auto_543262 )
      ( MAKE-13PILE ?auto_543255 ?auto_543256 ?auto_543257 ?auto_543258 ?auto_543259 ?auto_543260 ?auto_543261 ?auto_543262 ?auto_543263 ?auto_543264 ?auto_543265 ?auto_543266 ?auto_543267 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543309 - BLOCK
      ?auto_543310 - BLOCK
      ?auto_543311 - BLOCK
      ?auto_543312 - BLOCK
      ?auto_543313 - BLOCK
      ?auto_543314 - BLOCK
      ?auto_543315 - BLOCK
      ?auto_543316 - BLOCK
      ?auto_543317 - BLOCK
      ?auto_543318 - BLOCK
      ?auto_543319 - BLOCK
      ?auto_543320 - BLOCK
      ?auto_543321 - BLOCK
    )
    :vars
    (
      ?auto_543322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543321 ?auto_543322 ) ( ON-TABLE ?auto_543309 ) ( ON ?auto_543310 ?auto_543309 ) ( ON ?auto_543311 ?auto_543310 ) ( ON ?auto_543312 ?auto_543311 ) ( ON ?auto_543313 ?auto_543312 ) ( ON ?auto_543314 ?auto_543313 ) ( not ( = ?auto_543309 ?auto_543310 ) ) ( not ( = ?auto_543309 ?auto_543311 ) ) ( not ( = ?auto_543309 ?auto_543312 ) ) ( not ( = ?auto_543309 ?auto_543313 ) ) ( not ( = ?auto_543309 ?auto_543314 ) ) ( not ( = ?auto_543309 ?auto_543315 ) ) ( not ( = ?auto_543309 ?auto_543316 ) ) ( not ( = ?auto_543309 ?auto_543317 ) ) ( not ( = ?auto_543309 ?auto_543318 ) ) ( not ( = ?auto_543309 ?auto_543319 ) ) ( not ( = ?auto_543309 ?auto_543320 ) ) ( not ( = ?auto_543309 ?auto_543321 ) ) ( not ( = ?auto_543309 ?auto_543322 ) ) ( not ( = ?auto_543310 ?auto_543311 ) ) ( not ( = ?auto_543310 ?auto_543312 ) ) ( not ( = ?auto_543310 ?auto_543313 ) ) ( not ( = ?auto_543310 ?auto_543314 ) ) ( not ( = ?auto_543310 ?auto_543315 ) ) ( not ( = ?auto_543310 ?auto_543316 ) ) ( not ( = ?auto_543310 ?auto_543317 ) ) ( not ( = ?auto_543310 ?auto_543318 ) ) ( not ( = ?auto_543310 ?auto_543319 ) ) ( not ( = ?auto_543310 ?auto_543320 ) ) ( not ( = ?auto_543310 ?auto_543321 ) ) ( not ( = ?auto_543310 ?auto_543322 ) ) ( not ( = ?auto_543311 ?auto_543312 ) ) ( not ( = ?auto_543311 ?auto_543313 ) ) ( not ( = ?auto_543311 ?auto_543314 ) ) ( not ( = ?auto_543311 ?auto_543315 ) ) ( not ( = ?auto_543311 ?auto_543316 ) ) ( not ( = ?auto_543311 ?auto_543317 ) ) ( not ( = ?auto_543311 ?auto_543318 ) ) ( not ( = ?auto_543311 ?auto_543319 ) ) ( not ( = ?auto_543311 ?auto_543320 ) ) ( not ( = ?auto_543311 ?auto_543321 ) ) ( not ( = ?auto_543311 ?auto_543322 ) ) ( not ( = ?auto_543312 ?auto_543313 ) ) ( not ( = ?auto_543312 ?auto_543314 ) ) ( not ( = ?auto_543312 ?auto_543315 ) ) ( not ( = ?auto_543312 ?auto_543316 ) ) ( not ( = ?auto_543312 ?auto_543317 ) ) ( not ( = ?auto_543312 ?auto_543318 ) ) ( not ( = ?auto_543312 ?auto_543319 ) ) ( not ( = ?auto_543312 ?auto_543320 ) ) ( not ( = ?auto_543312 ?auto_543321 ) ) ( not ( = ?auto_543312 ?auto_543322 ) ) ( not ( = ?auto_543313 ?auto_543314 ) ) ( not ( = ?auto_543313 ?auto_543315 ) ) ( not ( = ?auto_543313 ?auto_543316 ) ) ( not ( = ?auto_543313 ?auto_543317 ) ) ( not ( = ?auto_543313 ?auto_543318 ) ) ( not ( = ?auto_543313 ?auto_543319 ) ) ( not ( = ?auto_543313 ?auto_543320 ) ) ( not ( = ?auto_543313 ?auto_543321 ) ) ( not ( = ?auto_543313 ?auto_543322 ) ) ( not ( = ?auto_543314 ?auto_543315 ) ) ( not ( = ?auto_543314 ?auto_543316 ) ) ( not ( = ?auto_543314 ?auto_543317 ) ) ( not ( = ?auto_543314 ?auto_543318 ) ) ( not ( = ?auto_543314 ?auto_543319 ) ) ( not ( = ?auto_543314 ?auto_543320 ) ) ( not ( = ?auto_543314 ?auto_543321 ) ) ( not ( = ?auto_543314 ?auto_543322 ) ) ( not ( = ?auto_543315 ?auto_543316 ) ) ( not ( = ?auto_543315 ?auto_543317 ) ) ( not ( = ?auto_543315 ?auto_543318 ) ) ( not ( = ?auto_543315 ?auto_543319 ) ) ( not ( = ?auto_543315 ?auto_543320 ) ) ( not ( = ?auto_543315 ?auto_543321 ) ) ( not ( = ?auto_543315 ?auto_543322 ) ) ( not ( = ?auto_543316 ?auto_543317 ) ) ( not ( = ?auto_543316 ?auto_543318 ) ) ( not ( = ?auto_543316 ?auto_543319 ) ) ( not ( = ?auto_543316 ?auto_543320 ) ) ( not ( = ?auto_543316 ?auto_543321 ) ) ( not ( = ?auto_543316 ?auto_543322 ) ) ( not ( = ?auto_543317 ?auto_543318 ) ) ( not ( = ?auto_543317 ?auto_543319 ) ) ( not ( = ?auto_543317 ?auto_543320 ) ) ( not ( = ?auto_543317 ?auto_543321 ) ) ( not ( = ?auto_543317 ?auto_543322 ) ) ( not ( = ?auto_543318 ?auto_543319 ) ) ( not ( = ?auto_543318 ?auto_543320 ) ) ( not ( = ?auto_543318 ?auto_543321 ) ) ( not ( = ?auto_543318 ?auto_543322 ) ) ( not ( = ?auto_543319 ?auto_543320 ) ) ( not ( = ?auto_543319 ?auto_543321 ) ) ( not ( = ?auto_543319 ?auto_543322 ) ) ( not ( = ?auto_543320 ?auto_543321 ) ) ( not ( = ?auto_543320 ?auto_543322 ) ) ( not ( = ?auto_543321 ?auto_543322 ) ) ( ON ?auto_543320 ?auto_543321 ) ( ON ?auto_543319 ?auto_543320 ) ( ON ?auto_543318 ?auto_543319 ) ( ON ?auto_543317 ?auto_543318 ) ( ON ?auto_543316 ?auto_543317 ) ( CLEAR ?auto_543314 ) ( ON ?auto_543315 ?auto_543316 ) ( CLEAR ?auto_543315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_543309 ?auto_543310 ?auto_543311 ?auto_543312 ?auto_543313 ?auto_543314 ?auto_543315 )
      ( MAKE-13PILE ?auto_543309 ?auto_543310 ?auto_543311 ?auto_543312 ?auto_543313 ?auto_543314 ?auto_543315 ?auto_543316 ?auto_543317 ?auto_543318 ?auto_543319 ?auto_543320 ?auto_543321 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543363 - BLOCK
      ?auto_543364 - BLOCK
      ?auto_543365 - BLOCK
      ?auto_543366 - BLOCK
      ?auto_543367 - BLOCK
      ?auto_543368 - BLOCK
      ?auto_543369 - BLOCK
      ?auto_543370 - BLOCK
      ?auto_543371 - BLOCK
      ?auto_543372 - BLOCK
      ?auto_543373 - BLOCK
      ?auto_543374 - BLOCK
      ?auto_543375 - BLOCK
    )
    :vars
    (
      ?auto_543376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543375 ?auto_543376 ) ( ON-TABLE ?auto_543363 ) ( ON ?auto_543364 ?auto_543363 ) ( ON ?auto_543365 ?auto_543364 ) ( ON ?auto_543366 ?auto_543365 ) ( ON ?auto_543367 ?auto_543366 ) ( not ( = ?auto_543363 ?auto_543364 ) ) ( not ( = ?auto_543363 ?auto_543365 ) ) ( not ( = ?auto_543363 ?auto_543366 ) ) ( not ( = ?auto_543363 ?auto_543367 ) ) ( not ( = ?auto_543363 ?auto_543368 ) ) ( not ( = ?auto_543363 ?auto_543369 ) ) ( not ( = ?auto_543363 ?auto_543370 ) ) ( not ( = ?auto_543363 ?auto_543371 ) ) ( not ( = ?auto_543363 ?auto_543372 ) ) ( not ( = ?auto_543363 ?auto_543373 ) ) ( not ( = ?auto_543363 ?auto_543374 ) ) ( not ( = ?auto_543363 ?auto_543375 ) ) ( not ( = ?auto_543363 ?auto_543376 ) ) ( not ( = ?auto_543364 ?auto_543365 ) ) ( not ( = ?auto_543364 ?auto_543366 ) ) ( not ( = ?auto_543364 ?auto_543367 ) ) ( not ( = ?auto_543364 ?auto_543368 ) ) ( not ( = ?auto_543364 ?auto_543369 ) ) ( not ( = ?auto_543364 ?auto_543370 ) ) ( not ( = ?auto_543364 ?auto_543371 ) ) ( not ( = ?auto_543364 ?auto_543372 ) ) ( not ( = ?auto_543364 ?auto_543373 ) ) ( not ( = ?auto_543364 ?auto_543374 ) ) ( not ( = ?auto_543364 ?auto_543375 ) ) ( not ( = ?auto_543364 ?auto_543376 ) ) ( not ( = ?auto_543365 ?auto_543366 ) ) ( not ( = ?auto_543365 ?auto_543367 ) ) ( not ( = ?auto_543365 ?auto_543368 ) ) ( not ( = ?auto_543365 ?auto_543369 ) ) ( not ( = ?auto_543365 ?auto_543370 ) ) ( not ( = ?auto_543365 ?auto_543371 ) ) ( not ( = ?auto_543365 ?auto_543372 ) ) ( not ( = ?auto_543365 ?auto_543373 ) ) ( not ( = ?auto_543365 ?auto_543374 ) ) ( not ( = ?auto_543365 ?auto_543375 ) ) ( not ( = ?auto_543365 ?auto_543376 ) ) ( not ( = ?auto_543366 ?auto_543367 ) ) ( not ( = ?auto_543366 ?auto_543368 ) ) ( not ( = ?auto_543366 ?auto_543369 ) ) ( not ( = ?auto_543366 ?auto_543370 ) ) ( not ( = ?auto_543366 ?auto_543371 ) ) ( not ( = ?auto_543366 ?auto_543372 ) ) ( not ( = ?auto_543366 ?auto_543373 ) ) ( not ( = ?auto_543366 ?auto_543374 ) ) ( not ( = ?auto_543366 ?auto_543375 ) ) ( not ( = ?auto_543366 ?auto_543376 ) ) ( not ( = ?auto_543367 ?auto_543368 ) ) ( not ( = ?auto_543367 ?auto_543369 ) ) ( not ( = ?auto_543367 ?auto_543370 ) ) ( not ( = ?auto_543367 ?auto_543371 ) ) ( not ( = ?auto_543367 ?auto_543372 ) ) ( not ( = ?auto_543367 ?auto_543373 ) ) ( not ( = ?auto_543367 ?auto_543374 ) ) ( not ( = ?auto_543367 ?auto_543375 ) ) ( not ( = ?auto_543367 ?auto_543376 ) ) ( not ( = ?auto_543368 ?auto_543369 ) ) ( not ( = ?auto_543368 ?auto_543370 ) ) ( not ( = ?auto_543368 ?auto_543371 ) ) ( not ( = ?auto_543368 ?auto_543372 ) ) ( not ( = ?auto_543368 ?auto_543373 ) ) ( not ( = ?auto_543368 ?auto_543374 ) ) ( not ( = ?auto_543368 ?auto_543375 ) ) ( not ( = ?auto_543368 ?auto_543376 ) ) ( not ( = ?auto_543369 ?auto_543370 ) ) ( not ( = ?auto_543369 ?auto_543371 ) ) ( not ( = ?auto_543369 ?auto_543372 ) ) ( not ( = ?auto_543369 ?auto_543373 ) ) ( not ( = ?auto_543369 ?auto_543374 ) ) ( not ( = ?auto_543369 ?auto_543375 ) ) ( not ( = ?auto_543369 ?auto_543376 ) ) ( not ( = ?auto_543370 ?auto_543371 ) ) ( not ( = ?auto_543370 ?auto_543372 ) ) ( not ( = ?auto_543370 ?auto_543373 ) ) ( not ( = ?auto_543370 ?auto_543374 ) ) ( not ( = ?auto_543370 ?auto_543375 ) ) ( not ( = ?auto_543370 ?auto_543376 ) ) ( not ( = ?auto_543371 ?auto_543372 ) ) ( not ( = ?auto_543371 ?auto_543373 ) ) ( not ( = ?auto_543371 ?auto_543374 ) ) ( not ( = ?auto_543371 ?auto_543375 ) ) ( not ( = ?auto_543371 ?auto_543376 ) ) ( not ( = ?auto_543372 ?auto_543373 ) ) ( not ( = ?auto_543372 ?auto_543374 ) ) ( not ( = ?auto_543372 ?auto_543375 ) ) ( not ( = ?auto_543372 ?auto_543376 ) ) ( not ( = ?auto_543373 ?auto_543374 ) ) ( not ( = ?auto_543373 ?auto_543375 ) ) ( not ( = ?auto_543373 ?auto_543376 ) ) ( not ( = ?auto_543374 ?auto_543375 ) ) ( not ( = ?auto_543374 ?auto_543376 ) ) ( not ( = ?auto_543375 ?auto_543376 ) ) ( ON ?auto_543374 ?auto_543375 ) ( ON ?auto_543373 ?auto_543374 ) ( ON ?auto_543372 ?auto_543373 ) ( ON ?auto_543371 ?auto_543372 ) ( ON ?auto_543370 ?auto_543371 ) ( ON ?auto_543369 ?auto_543370 ) ( CLEAR ?auto_543367 ) ( ON ?auto_543368 ?auto_543369 ) ( CLEAR ?auto_543368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_543363 ?auto_543364 ?auto_543365 ?auto_543366 ?auto_543367 ?auto_543368 )
      ( MAKE-13PILE ?auto_543363 ?auto_543364 ?auto_543365 ?auto_543366 ?auto_543367 ?auto_543368 ?auto_543369 ?auto_543370 ?auto_543371 ?auto_543372 ?auto_543373 ?auto_543374 ?auto_543375 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543417 - BLOCK
      ?auto_543418 - BLOCK
      ?auto_543419 - BLOCK
      ?auto_543420 - BLOCK
      ?auto_543421 - BLOCK
      ?auto_543422 - BLOCK
      ?auto_543423 - BLOCK
      ?auto_543424 - BLOCK
      ?auto_543425 - BLOCK
      ?auto_543426 - BLOCK
      ?auto_543427 - BLOCK
      ?auto_543428 - BLOCK
      ?auto_543429 - BLOCK
    )
    :vars
    (
      ?auto_543430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543429 ?auto_543430 ) ( ON-TABLE ?auto_543417 ) ( ON ?auto_543418 ?auto_543417 ) ( ON ?auto_543419 ?auto_543418 ) ( ON ?auto_543420 ?auto_543419 ) ( not ( = ?auto_543417 ?auto_543418 ) ) ( not ( = ?auto_543417 ?auto_543419 ) ) ( not ( = ?auto_543417 ?auto_543420 ) ) ( not ( = ?auto_543417 ?auto_543421 ) ) ( not ( = ?auto_543417 ?auto_543422 ) ) ( not ( = ?auto_543417 ?auto_543423 ) ) ( not ( = ?auto_543417 ?auto_543424 ) ) ( not ( = ?auto_543417 ?auto_543425 ) ) ( not ( = ?auto_543417 ?auto_543426 ) ) ( not ( = ?auto_543417 ?auto_543427 ) ) ( not ( = ?auto_543417 ?auto_543428 ) ) ( not ( = ?auto_543417 ?auto_543429 ) ) ( not ( = ?auto_543417 ?auto_543430 ) ) ( not ( = ?auto_543418 ?auto_543419 ) ) ( not ( = ?auto_543418 ?auto_543420 ) ) ( not ( = ?auto_543418 ?auto_543421 ) ) ( not ( = ?auto_543418 ?auto_543422 ) ) ( not ( = ?auto_543418 ?auto_543423 ) ) ( not ( = ?auto_543418 ?auto_543424 ) ) ( not ( = ?auto_543418 ?auto_543425 ) ) ( not ( = ?auto_543418 ?auto_543426 ) ) ( not ( = ?auto_543418 ?auto_543427 ) ) ( not ( = ?auto_543418 ?auto_543428 ) ) ( not ( = ?auto_543418 ?auto_543429 ) ) ( not ( = ?auto_543418 ?auto_543430 ) ) ( not ( = ?auto_543419 ?auto_543420 ) ) ( not ( = ?auto_543419 ?auto_543421 ) ) ( not ( = ?auto_543419 ?auto_543422 ) ) ( not ( = ?auto_543419 ?auto_543423 ) ) ( not ( = ?auto_543419 ?auto_543424 ) ) ( not ( = ?auto_543419 ?auto_543425 ) ) ( not ( = ?auto_543419 ?auto_543426 ) ) ( not ( = ?auto_543419 ?auto_543427 ) ) ( not ( = ?auto_543419 ?auto_543428 ) ) ( not ( = ?auto_543419 ?auto_543429 ) ) ( not ( = ?auto_543419 ?auto_543430 ) ) ( not ( = ?auto_543420 ?auto_543421 ) ) ( not ( = ?auto_543420 ?auto_543422 ) ) ( not ( = ?auto_543420 ?auto_543423 ) ) ( not ( = ?auto_543420 ?auto_543424 ) ) ( not ( = ?auto_543420 ?auto_543425 ) ) ( not ( = ?auto_543420 ?auto_543426 ) ) ( not ( = ?auto_543420 ?auto_543427 ) ) ( not ( = ?auto_543420 ?auto_543428 ) ) ( not ( = ?auto_543420 ?auto_543429 ) ) ( not ( = ?auto_543420 ?auto_543430 ) ) ( not ( = ?auto_543421 ?auto_543422 ) ) ( not ( = ?auto_543421 ?auto_543423 ) ) ( not ( = ?auto_543421 ?auto_543424 ) ) ( not ( = ?auto_543421 ?auto_543425 ) ) ( not ( = ?auto_543421 ?auto_543426 ) ) ( not ( = ?auto_543421 ?auto_543427 ) ) ( not ( = ?auto_543421 ?auto_543428 ) ) ( not ( = ?auto_543421 ?auto_543429 ) ) ( not ( = ?auto_543421 ?auto_543430 ) ) ( not ( = ?auto_543422 ?auto_543423 ) ) ( not ( = ?auto_543422 ?auto_543424 ) ) ( not ( = ?auto_543422 ?auto_543425 ) ) ( not ( = ?auto_543422 ?auto_543426 ) ) ( not ( = ?auto_543422 ?auto_543427 ) ) ( not ( = ?auto_543422 ?auto_543428 ) ) ( not ( = ?auto_543422 ?auto_543429 ) ) ( not ( = ?auto_543422 ?auto_543430 ) ) ( not ( = ?auto_543423 ?auto_543424 ) ) ( not ( = ?auto_543423 ?auto_543425 ) ) ( not ( = ?auto_543423 ?auto_543426 ) ) ( not ( = ?auto_543423 ?auto_543427 ) ) ( not ( = ?auto_543423 ?auto_543428 ) ) ( not ( = ?auto_543423 ?auto_543429 ) ) ( not ( = ?auto_543423 ?auto_543430 ) ) ( not ( = ?auto_543424 ?auto_543425 ) ) ( not ( = ?auto_543424 ?auto_543426 ) ) ( not ( = ?auto_543424 ?auto_543427 ) ) ( not ( = ?auto_543424 ?auto_543428 ) ) ( not ( = ?auto_543424 ?auto_543429 ) ) ( not ( = ?auto_543424 ?auto_543430 ) ) ( not ( = ?auto_543425 ?auto_543426 ) ) ( not ( = ?auto_543425 ?auto_543427 ) ) ( not ( = ?auto_543425 ?auto_543428 ) ) ( not ( = ?auto_543425 ?auto_543429 ) ) ( not ( = ?auto_543425 ?auto_543430 ) ) ( not ( = ?auto_543426 ?auto_543427 ) ) ( not ( = ?auto_543426 ?auto_543428 ) ) ( not ( = ?auto_543426 ?auto_543429 ) ) ( not ( = ?auto_543426 ?auto_543430 ) ) ( not ( = ?auto_543427 ?auto_543428 ) ) ( not ( = ?auto_543427 ?auto_543429 ) ) ( not ( = ?auto_543427 ?auto_543430 ) ) ( not ( = ?auto_543428 ?auto_543429 ) ) ( not ( = ?auto_543428 ?auto_543430 ) ) ( not ( = ?auto_543429 ?auto_543430 ) ) ( ON ?auto_543428 ?auto_543429 ) ( ON ?auto_543427 ?auto_543428 ) ( ON ?auto_543426 ?auto_543427 ) ( ON ?auto_543425 ?auto_543426 ) ( ON ?auto_543424 ?auto_543425 ) ( ON ?auto_543423 ?auto_543424 ) ( ON ?auto_543422 ?auto_543423 ) ( CLEAR ?auto_543420 ) ( ON ?auto_543421 ?auto_543422 ) ( CLEAR ?auto_543421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_543417 ?auto_543418 ?auto_543419 ?auto_543420 ?auto_543421 )
      ( MAKE-13PILE ?auto_543417 ?auto_543418 ?auto_543419 ?auto_543420 ?auto_543421 ?auto_543422 ?auto_543423 ?auto_543424 ?auto_543425 ?auto_543426 ?auto_543427 ?auto_543428 ?auto_543429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543471 - BLOCK
      ?auto_543472 - BLOCK
      ?auto_543473 - BLOCK
      ?auto_543474 - BLOCK
      ?auto_543475 - BLOCK
      ?auto_543476 - BLOCK
      ?auto_543477 - BLOCK
      ?auto_543478 - BLOCK
      ?auto_543479 - BLOCK
      ?auto_543480 - BLOCK
      ?auto_543481 - BLOCK
      ?auto_543482 - BLOCK
      ?auto_543483 - BLOCK
    )
    :vars
    (
      ?auto_543484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543483 ?auto_543484 ) ( ON-TABLE ?auto_543471 ) ( ON ?auto_543472 ?auto_543471 ) ( ON ?auto_543473 ?auto_543472 ) ( not ( = ?auto_543471 ?auto_543472 ) ) ( not ( = ?auto_543471 ?auto_543473 ) ) ( not ( = ?auto_543471 ?auto_543474 ) ) ( not ( = ?auto_543471 ?auto_543475 ) ) ( not ( = ?auto_543471 ?auto_543476 ) ) ( not ( = ?auto_543471 ?auto_543477 ) ) ( not ( = ?auto_543471 ?auto_543478 ) ) ( not ( = ?auto_543471 ?auto_543479 ) ) ( not ( = ?auto_543471 ?auto_543480 ) ) ( not ( = ?auto_543471 ?auto_543481 ) ) ( not ( = ?auto_543471 ?auto_543482 ) ) ( not ( = ?auto_543471 ?auto_543483 ) ) ( not ( = ?auto_543471 ?auto_543484 ) ) ( not ( = ?auto_543472 ?auto_543473 ) ) ( not ( = ?auto_543472 ?auto_543474 ) ) ( not ( = ?auto_543472 ?auto_543475 ) ) ( not ( = ?auto_543472 ?auto_543476 ) ) ( not ( = ?auto_543472 ?auto_543477 ) ) ( not ( = ?auto_543472 ?auto_543478 ) ) ( not ( = ?auto_543472 ?auto_543479 ) ) ( not ( = ?auto_543472 ?auto_543480 ) ) ( not ( = ?auto_543472 ?auto_543481 ) ) ( not ( = ?auto_543472 ?auto_543482 ) ) ( not ( = ?auto_543472 ?auto_543483 ) ) ( not ( = ?auto_543472 ?auto_543484 ) ) ( not ( = ?auto_543473 ?auto_543474 ) ) ( not ( = ?auto_543473 ?auto_543475 ) ) ( not ( = ?auto_543473 ?auto_543476 ) ) ( not ( = ?auto_543473 ?auto_543477 ) ) ( not ( = ?auto_543473 ?auto_543478 ) ) ( not ( = ?auto_543473 ?auto_543479 ) ) ( not ( = ?auto_543473 ?auto_543480 ) ) ( not ( = ?auto_543473 ?auto_543481 ) ) ( not ( = ?auto_543473 ?auto_543482 ) ) ( not ( = ?auto_543473 ?auto_543483 ) ) ( not ( = ?auto_543473 ?auto_543484 ) ) ( not ( = ?auto_543474 ?auto_543475 ) ) ( not ( = ?auto_543474 ?auto_543476 ) ) ( not ( = ?auto_543474 ?auto_543477 ) ) ( not ( = ?auto_543474 ?auto_543478 ) ) ( not ( = ?auto_543474 ?auto_543479 ) ) ( not ( = ?auto_543474 ?auto_543480 ) ) ( not ( = ?auto_543474 ?auto_543481 ) ) ( not ( = ?auto_543474 ?auto_543482 ) ) ( not ( = ?auto_543474 ?auto_543483 ) ) ( not ( = ?auto_543474 ?auto_543484 ) ) ( not ( = ?auto_543475 ?auto_543476 ) ) ( not ( = ?auto_543475 ?auto_543477 ) ) ( not ( = ?auto_543475 ?auto_543478 ) ) ( not ( = ?auto_543475 ?auto_543479 ) ) ( not ( = ?auto_543475 ?auto_543480 ) ) ( not ( = ?auto_543475 ?auto_543481 ) ) ( not ( = ?auto_543475 ?auto_543482 ) ) ( not ( = ?auto_543475 ?auto_543483 ) ) ( not ( = ?auto_543475 ?auto_543484 ) ) ( not ( = ?auto_543476 ?auto_543477 ) ) ( not ( = ?auto_543476 ?auto_543478 ) ) ( not ( = ?auto_543476 ?auto_543479 ) ) ( not ( = ?auto_543476 ?auto_543480 ) ) ( not ( = ?auto_543476 ?auto_543481 ) ) ( not ( = ?auto_543476 ?auto_543482 ) ) ( not ( = ?auto_543476 ?auto_543483 ) ) ( not ( = ?auto_543476 ?auto_543484 ) ) ( not ( = ?auto_543477 ?auto_543478 ) ) ( not ( = ?auto_543477 ?auto_543479 ) ) ( not ( = ?auto_543477 ?auto_543480 ) ) ( not ( = ?auto_543477 ?auto_543481 ) ) ( not ( = ?auto_543477 ?auto_543482 ) ) ( not ( = ?auto_543477 ?auto_543483 ) ) ( not ( = ?auto_543477 ?auto_543484 ) ) ( not ( = ?auto_543478 ?auto_543479 ) ) ( not ( = ?auto_543478 ?auto_543480 ) ) ( not ( = ?auto_543478 ?auto_543481 ) ) ( not ( = ?auto_543478 ?auto_543482 ) ) ( not ( = ?auto_543478 ?auto_543483 ) ) ( not ( = ?auto_543478 ?auto_543484 ) ) ( not ( = ?auto_543479 ?auto_543480 ) ) ( not ( = ?auto_543479 ?auto_543481 ) ) ( not ( = ?auto_543479 ?auto_543482 ) ) ( not ( = ?auto_543479 ?auto_543483 ) ) ( not ( = ?auto_543479 ?auto_543484 ) ) ( not ( = ?auto_543480 ?auto_543481 ) ) ( not ( = ?auto_543480 ?auto_543482 ) ) ( not ( = ?auto_543480 ?auto_543483 ) ) ( not ( = ?auto_543480 ?auto_543484 ) ) ( not ( = ?auto_543481 ?auto_543482 ) ) ( not ( = ?auto_543481 ?auto_543483 ) ) ( not ( = ?auto_543481 ?auto_543484 ) ) ( not ( = ?auto_543482 ?auto_543483 ) ) ( not ( = ?auto_543482 ?auto_543484 ) ) ( not ( = ?auto_543483 ?auto_543484 ) ) ( ON ?auto_543482 ?auto_543483 ) ( ON ?auto_543481 ?auto_543482 ) ( ON ?auto_543480 ?auto_543481 ) ( ON ?auto_543479 ?auto_543480 ) ( ON ?auto_543478 ?auto_543479 ) ( ON ?auto_543477 ?auto_543478 ) ( ON ?auto_543476 ?auto_543477 ) ( ON ?auto_543475 ?auto_543476 ) ( CLEAR ?auto_543473 ) ( ON ?auto_543474 ?auto_543475 ) ( CLEAR ?auto_543474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_543471 ?auto_543472 ?auto_543473 ?auto_543474 )
      ( MAKE-13PILE ?auto_543471 ?auto_543472 ?auto_543473 ?auto_543474 ?auto_543475 ?auto_543476 ?auto_543477 ?auto_543478 ?auto_543479 ?auto_543480 ?auto_543481 ?auto_543482 ?auto_543483 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543525 - BLOCK
      ?auto_543526 - BLOCK
      ?auto_543527 - BLOCK
      ?auto_543528 - BLOCK
      ?auto_543529 - BLOCK
      ?auto_543530 - BLOCK
      ?auto_543531 - BLOCK
      ?auto_543532 - BLOCK
      ?auto_543533 - BLOCK
      ?auto_543534 - BLOCK
      ?auto_543535 - BLOCK
      ?auto_543536 - BLOCK
      ?auto_543537 - BLOCK
    )
    :vars
    (
      ?auto_543538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543537 ?auto_543538 ) ( ON-TABLE ?auto_543525 ) ( ON ?auto_543526 ?auto_543525 ) ( not ( = ?auto_543525 ?auto_543526 ) ) ( not ( = ?auto_543525 ?auto_543527 ) ) ( not ( = ?auto_543525 ?auto_543528 ) ) ( not ( = ?auto_543525 ?auto_543529 ) ) ( not ( = ?auto_543525 ?auto_543530 ) ) ( not ( = ?auto_543525 ?auto_543531 ) ) ( not ( = ?auto_543525 ?auto_543532 ) ) ( not ( = ?auto_543525 ?auto_543533 ) ) ( not ( = ?auto_543525 ?auto_543534 ) ) ( not ( = ?auto_543525 ?auto_543535 ) ) ( not ( = ?auto_543525 ?auto_543536 ) ) ( not ( = ?auto_543525 ?auto_543537 ) ) ( not ( = ?auto_543525 ?auto_543538 ) ) ( not ( = ?auto_543526 ?auto_543527 ) ) ( not ( = ?auto_543526 ?auto_543528 ) ) ( not ( = ?auto_543526 ?auto_543529 ) ) ( not ( = ?auto_543526 ?auto_543530 ) ) ( not ( = ?auto_543526 ?auto_543531 ) ) ( not ( = ?auto_543526 ?auto_543532 ) ) ( not ( = ?auto_543526 ?auto_543533 ) ) ( not ( = ?auto_543526 ?auto_543534 ) ) ( not ( = ?auto_543526 ?auto_543535 ) ) ( not ( = ?auto_543526 ?auto_543536 ) ) ( not ( = ?auto_543526 ?auto_543537 ) ) ( not ( = ?auto_543526 ?auto_543538 ) ) ( not ( = ?auto_543527 ?auto_543528 ) ) ( not ( = ?auto_543527 ?auto_543529 ) ) ( not ( = ?auto_543527 ?auto_543530 ) ) ( not ( = ?auto_543527 ?auto_543531 ) ) ( not ( = ?auto_543527 ?auto_543532 ) ) ( not ( = ?auto_543527 ?auto_543533 ) ) ( not ( = ?auto_543527 ?auto_543534 ) ) ( not ( = ?auto_543527 ?auto_543535 ) ) ( not ( = ?auto_543527 ?auto_543536 ) ) ( not ( = ?auto_543527 ?auto_543537 ) ) ( not ( = ?auto_543527 ?auto_543538 ) ) ( not ( = ?auto_543528 ?auto_543529 ) ) ( not ( = ?auto_543528 ?auto_543530 ) ) ( not ( = ?auto_543528 ?auto_543531 ) ) ( not ( = ?auto_543528 ?auto_543532 ) ) ( not ( = ?auto_543528 ?auto_543533 ) ) ( not ( = ?auto_543528 ?auto_543534 ) ) ( not ( = ?auto_543528 ?auto_543535 ) ) ( not ( = ?auto_543528 ?auto_543536 ) ) ( not ( = ?auto_543528 ?auto_543537 ) ) ( not ( = ?auto_543528 ?auto_543538 ) ) ( not ( = ?auto_543529 ?auto_543530 ) ) ( not ( = ?auto_543529 ?auto_543531 ) ) ( not ( = ?auto_543529 ?auto_543532 ) ) ( not ( = ?auto_543529 ?auto_543533 ) ) ( not ( = ?auto_543529 ?auto_543534 ) ) ( not ( = ?auto_543529 ?auto_543535 ) ) ( not ( = ?auto_543529 ?auto_543536 ) ) ( not ( = ?auto_543529 ?auto_543537 ) ) ( not ( = ?auto_543529 ?auto_543538 ) ) ( not ( = ?auto_543530 ?auto_543531 ) ) ( not ( = ?auto_543530 ?auto_543532 ) ) ( not ( = ?auto_543530 ?auto_543533 ) ) ( not ( = ?auto_543530 ?auto_543534 ) ) ( not ( = ?auto_543530 ?auto_543535 ) ) ( not ( = ?auto_543530 ?auto_543536 ) ) ( not ( = ?auto_543530 ?auto_543537 ) ) ( not ( = ?auto_543530 ?auto_543538 ) ) ( not ( = ?auto_543531 ?auto_543532 ) ) ( not ( = ?auto_543531 ?auto_543533 ) ) ( not ( = ?auto_543531 ?auto_543534 ) ) ( not ( = ?auto_543531 ?auto_543535 ) ) ( not ( = ?auto_543531 ?auto_543536 ) ) ( not ( = ?auto_543531 ?auto_543537 ) ) ( not ( = ?auto_543531 ?auto_543538 ) ) ( not ( = ?auto_543532 ?auto_543533 ) ) ( not ( = ?auto_543532 ?auto_543534 ) ) ( not ( = ?auto_543532 ?auto_543535 ) ) ( not ( = ?auto_543532 ?auto_543536 ) ) ( not ( = ?auto_543532 ?auto_543537 ) ) ( not ( = ?auto_543532 ?auto_543538 ) ) ( not ( = ?auto_543533 ?auto_543534 ) ) ( not ( = ?auto_543533 ?auto_543535 ) ) ( not ( = ?auto_543533 ?auto_543536 ) ) ( not ( = ?auto_543533 ?auto_543537 ) ) ( not ( = ?auto_543533 ?auto_543538 ) ) ( not ( = ?auto_543534 ?auto_543535 ) ) ( not ( = ?auto_543534 ?auto_543536 ) ) ( not ( = ?auto_543534 ?auto_543537 ) ) ( not ( = ?auto_543534 ?auto_543538 ) ) ( not ( = ?auto_543535 ?auto_543536 ) ) ( not ( = ?auto_543535 ?auto_543537 ) ) ( not ( = ?auto_543535 ?auto_543538 ) ) ( not ( = ?auto_543536 ?auto_543537 ) ) ( not ( = ?auto_543536 ?auto_543538 ) ) ( not ( = ?auto_543537 ?auto_543538 ) ) ( ON ?auto_543536 ?auto_543537 ) ( ON ?auto_543535 ?auto_543536 ) ( ON ?auto_543534 ?auto_543535 ) ( ON ?auto_543533 ?auto_543534 ) ( ON ?auto_543532 ?auto_543533 ) ( ON ?auto_543531 ?auto_543532 ) ( ON ?auto_543530 ?auto_543531 ) ( ON ?auto_543529 ?auto_543530 ) ( ON ?auto_543528 ?auto_543529 ) ( CLEAR ?auto_543526 ) ( ON ?auto_543527 ?auto_543528 ) ( CLEAR ?auto_543527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_543525 ?auto_543526 ?auto_543527 )
      ( MAKE-13PILE ?auto_543525 ?auto_543526 ?auto_543527 ?auto_543528 ?auto_543529 ?auto_543530 ?auto_543531 ?auto_543532 ?auto_543533 ?auto_543534 ?auto_543535 ?auto_543536 ?auto_543537 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543579 - BLOCK
      ?auto_543580 - BLOCK
      ?auto_543581 - BLOCK
      ?auto_543582 - BLOCK
      ?auto_543583 - BLOCK
      ?auto_543584 - BLOCK
      ?auto_543585 - BLOCK
      ?auto_543586 - BLOCK
      ?auto_543587 - BLOCK
      ?auto_543588 - BLOCK
      ?auto_543589 - BLOCK
      ?auto_543590 - BLOCK
      ?auto_543591 - BLOCK
    )
    :vars
    (
      ?auto_543592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543591 ?auto_543592 ) ( ON-TABLE ?auto_543579 ) ( not ( = ?auto_543579 ?auto_543580 ) ) ( not ( = ?auto_543579 ?auto_543581 ) ) ( not ( = ?auto_543579 ?auto_543582 ) ) ( not ( = ?auto_543579 ?auto_543583 ) ) ( not ( = ?auto_543579 ?auto_543584 ) ) ( not ( = ?auto_543579 ?auto_543585 ) ) ( not ( = ?auto_543579 ?auto_543586 ) ) ( not ( = ?auto_543579 ?auto_543587 ) ) ( not ( = ?auto_543579 ?auto_543588 ) ) ( not ( = ?auto_543579 ?auto_543589 ) ) ( not ( = ?auto_543579 ?auto_543590 ) ) ( not ( = ?auto_543579 ?auto_543591 ) ) ( not ( = ?auto_543579 ?auto_543592 ) ) ( not ( = ?auto_543580 ?auto_543581 ) ) ( not ( = ?auto_543580 ?auto_543582 ) ) ( not ( = ?auto_543580 ?auto_543583 ) ) ( not ( = ?auto_543580 ?auto_543584 ) ) ( not ( = ?auto_543580 ?auto_543585 ) ) ( not ( = ?auto_543580 ?auto_543586 ) ) ( not ( = ?auto_543580 ?auto_543587 ) ) ( not ( = ?auto_543580 ?auto_543588 ) ) ( not ( = ?auto_543580 ?auto_543589 ) ) ( not ( = ?auto_543580 ?auto_543590 ) ) ( not ( = ?auto_543580 ?auto_543591 ) ) ( not ( = ?auto_543580 ?auto_543592 ) ) ( not ( = ?auto_543581 ?auto_543582 ) ) ( not ( = ?auto_543581 ?auto_543583 ) ) ( not ( = ?auto_543581 ?auto_543584 ) ) ( not ( = ?auto_543581 ?auto_543585 ) ) ( not ( = ?auto_543581 ?auto_543586 ) ) ( not ( = ?auto_543581 ?auto_543587 ) ) ( not ( = ?auto_543581 ?auto_543588 ) ) ( not ( = ?auto_543581 ?auto_543589 ) ) ( not ( = ?auto_543581 ?auto_543590 ) ) ( not ( = ?auto_543581 ?auto_543591 ) ) ( not ( = ?auto_543581 ?auto_543592 ) ) ( not ( = ?auto_543582 ?auto_543583 ) ) ( not ( = ?auto_543582 ?auto_543584 ) ) ( not ( = ?auto_543582 ?auto_543585 ) ) ( not ( = ?auto_543582 ?auto_543586 ) ) ( not ( = ?auto_543582 ?auto_543587 ) ) ( not ( = ?auto_543582 ?auto_543588 ) ) ( not ( = ?auto_543582 ?auto_543589 ) ) ( not ( = ?auto_543582 ?auto_543590 ) ) ( not ( = ?auto_543582 ?auto_543591 ) ) ( not ( = ?auto_543582 ?auto_543592 ) ) ( not ( = ?auto_543583 ?auto_543584 ) ) ( not ( = ?auto_543583 ?auto_543585 ) ) ( not ( = ?auto_543583 ?auto_543586 ) ) ( not ( = ?auto_543583 ?auto_543587 ) ) ( not ( = ?auto_543583 ?auto_543588 ) ) ( not ( = ?auto_543583 ?auto_543589 ) ) ( not ( = ?auto_543583 ?auto_543590 ) ) ( not ( = ?auto_543583 ?auto_543591 ) ) ( not ( = ?auto_543583 ?auto_543592 ) ) ( not ( = ?auto_543584 ?auto_543585 ) ) ( not ( = ?auto_543584 ?auto_543586 ) ) ( not ( = ?auto_543584 ?auto_543587 ) ) ( not ( = ?auto_543584 ?auto_543588 ) ) ( not ( = ?auto_543584 ?auto_543589 ) ) ( not ( = ?auto_543584 ?auto_543590 ) ) ( not ( = ?auto_543584 ?auto_543591 ) ) ( not ( = ?auto_543584 ?auto_543592 ) ) ( not ( = ?auto_543585 ?auto_543586 ) ) ( not ( = ?auto_543585 ?auto_543587 ) ) ( not ( = ?auto_543585 ?auto_543588 ) ) ( not ( = ?auto_543585 ?auto_543589 ) ) ( not ( = ?auto_543585 ?auto_543590 ) ) ( not ( = ?auto_543585 ?auto_543591 ) ) ( not ( = ?auto_543585 ?auto_543592 ) ) ( not ( = ?auto_543586 ?auto_543587 ) ) ( not ( = ?auto_543586 ?auto_543588 ) ) ( not ( = ?auto_543586 ?auto_543589 ) ) ( not ( = ?auto_543586 ?auto_543590 ) ) ( not ( = ?auto_543586 ?auto_543591 ) ) ( not ( = ?auto_543586 ?auto_543592 ) ) ( not ( = ?auto_543587 ?auto_543588 ) ) ( not ( = ?auto_543587 ?auto_543589 ) ) ( not ( = ?auto_543587 ?auto_543590 ) ) ( not ( = ?auto_543587 ?auto_543591 ) ) ( not ( = ?auto_543587 ?auto_543592 ) ) ( not ( = ?auto_543588 ?auto_543589 ) ) ( not ( = ?auto_543588 ?auto_543590 ) ) ( not ( = ?auto_543588 ?auto_543591 ) ) ( not ( = ?auto_543588 ?auto_543592 ) ) ( not ( = ?auto_543589 ?auto_543590 ) ) ( not ( = ?auto_543589 ?auto_543591 ) ) ( not ( = ?auto_543589 ?auto_543592 ) ) ( not ( = ?auto_543590 ?auto_543591 ) ) ( not ( = ?auto_543590 ?auto_543592 ) ) ( not ( = ?auto_543591 ?auto_543592 ) ) ( ON ?auto_543590 ?auto_543591 ) ( ON ?auto_543589 ?auto_543590 ) ( ON ?auto_543588 ?auto_543589 ) ( ON ?auto_543587 ?auto_543588 ) ( ON ?auto_543586 ?auto_543587 ) ( ON ?auto_543585 ?auto_543586 ) ( ON ?auto_543584 ?auto_543585 ) ( ON ?auto_543583 ?auto_543584 ) ( ON ?auto_543582 ?auto_543583 ) ( ON ?auto_543581 ?auto_543582 ) ( CLEAR ?auto_543579 ) ( ON ?auto_543580 ?auto_543581 ) ( CLEAR ?auto_543580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_543579 ?auto_543580 )
      ( MAKE-13PILE ?auto_543579 ?auto_543580 ?auto_543581 ?auto_543582 ?auto_543583 ?auto_543584 ?auto_543585 ?auto_543586 ?auto_543587 ?auto_543588 ?auto_543589 ?auto_543590 ?auto_543591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_543633 - BLOCK
      ?auto_543634 - BLOCK
      ?auto_543635 - BLOCK
      ?auto_543636 - BLOCK
      ?auto_543637 - BLOCK
      ?auto_543638 - BLOCK
      ?auto_543639 - BLOCK
      ?auto_543640 - BLOCK
      ?auto_543641 - BLOCK
      ?auto_543642 - BLOCK
      ?auto_543643 - BLOCK
      ?auto_543644 - BLOCK
      ?auto_543645 - BLOCK
    )
    :vars
    (
      ?auto_543646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543645 ?auto_543646 ) ( not ( = ?auto_543633 ?auto_543634 ) ) ( not ( = ?auto_543633 ?auto_543635 ) ) ( not ( = ?auto_543633 ?auto_543636 ) ) ( not ( = ?auto_543633 ?auto_543637 ) ) ( not ( = ?auto_543633 ?auto_543638 ) ) ( not ( = ?auto_543633 ?auto_543639 ) ) ( not ( = ?auto_543633 ?auto_543640 ) ) ( not ( = ?auto_543633 ?auto_543641 ) ) ( not ( = ?auto_543633 ?auto_543642 ) ) ( not ( = ?auto_543633 ?auto_543643 ) ) ( not ( = ?auto_543633 ?auto_543644 ) ) ( not ( = ?auto_543633 ?auto_543645 ) ) ( not ( = ?auto_543633 ?auto_543646 ) ) ( not ( = ?auto_543634 ?auto_543635 ) ) ( not ( = ?auto_543634 ?auto_543636 ) ) ( not ( = ?auto_543634 ?auto_543637 ) ) ( not ( = ?auto_543634 ?auto_543638 ) ) ( not ( = ?auto_543634 ?auto_543639 ) ) ( not ( = ?auto_543634 ?auto_543640 ) ) ( not ( = ?auto_543634 ?auto_543641 ) ) ( not ( = ?auto_543634 ?auto_543642 ) ) ( not ( = ?auto_543634 ?auto_543643 ) ) ( not ( = ?auto_543634 ?auto_543644 ) ) ( not ( = ?auto_543634 ?auto_543645 ) ) ( not ( = ?auto_543634 ?auto_543646 ) ) ( not ( = ?auto_543635 ?auto_543636 ) ) ( not ( = ?auto_543635 ?auto_543637 ) ) ( not ( = ?auto_543635 ?auto_543638 ) ) ( not ( = ?auto_543635 ?auto_543639 ) ) ( not ( = ?auto_543635 ?auto_543640 ) ) ( not ( = ?auto_543635 ?auto_543641 ) ) ( not ( = ?auto_543635 ?auto_543642 ) ) ( not ( = ?auto_543635 ?auto_543643 ) ) ( not ( = ?auto_543635 ?auto_543644 ) ) ( not ( = ?auto_543635 ?auto_543645 ) ) ( not ( = ?auto_543635 ?auto_543646 ) ) ( not ( = ?auto_543636 ?auto_543637 ) ) ( not ( = ?auto_543636 ?auto_543638 ) ) ( not ( = ?auto_543636 ?auto_543639 ) ) ( not ( = ?auto_543636 ?auto_543640 ) ) ( not ( = ?auto_543636 ?auto_543641 ) ) ( not ( = ?auto_543636 ?auto_543642 ) ) ( not ( = ?auto_543636 ?auto_543643 ) ) ( not ( = ?auto_543636 ?auto_543644 ) ) ( not ( = ?auto_543636 ?auto_543645 ) ) ( not ( = ?auto_543636 ?auto_543646 ) ) ( not ( = ?auto_543637 ?auto_543638 ) ) ( not ( = ?auto_543637 ?auto_543639 ) ) ( not ( = ?auto_543637 ?auto_543640 ) ) ( not ( = ?auto_543637 ?auto_543641 ) ) ( not ( = ?auto_543637 ?auto_543642 ) ) ( not ( = ?auto_543637 ?auto_543643 ) ) ( not ( = ?auto_543637 ?auto_543644 ) ) ( not ( = ?auto_543637 ?auto_543645 ) ) ( not ( = ?auto_543637 ?auto_543646 ) ) ( not ( = ?auto_543638 ?auto_543639 ) ) ( not ( = ?auto_543638 ?auto_543640 ) ) ( not ( = ?auto_543638 ?auto_543641 ) ) ( not ( = ?auto_543638 ?auto_543642 ) ) ( not ( = ?auto_543638 ?auto_543643 ) ) ( not ( = ?auto_543638 ?auto_543644 ) ) ( not ( = ?auto_543638 ?auto_543645 ) ) ( not ( = ?auto_543638 ?auto_543646 ) ) ( not ( = ?auto_543639 ?auto_543640 ) ) ( not ( = ?auto_543639 ?auto_543641 ) ) ( not ( = ?auto_543639 ?auto_543642 ) ) ( not ( = ?auto_543639 ?auto_543643 ) ) ( not ( = ?auto_543639 ?auto_543644 ) ) ( not ( = ?auto_543639 ?auto_543645 ) ) ( not ( = ?auto_543639 ?auto_543646 ) ) ( not ( = ?auto_543640 ?auto_543641 ) ) ( not ( = ?auto_543640 ?auto_543642 ) ) ( not ( = ?auto_543640 ?auto_543643 ) ) ( not ( = ?auto_543640 ?auto_543644 ) ) ( not ( = ?auto_543640 ?auto_543645 ) ) ( not ( = ?auto_543640 ?auto_543646 ) ) ( not ( = ?auto_543641 ?auto_543642 ) ) ( not ( = ?auto_543641 ?auto_543643 ) ) ( not ( = ?auto_543641 ?auto_543644 ) ) ( not ( = ?auto_543641 ?auto_543645 ) ) ( not ( = ?auto_543641 ?auto_543646 ) ) ( not ( = ?auto_543642 ?auto_543643 ) ) ( not ( = ?auto_543642 ?auto_543644 ) ) ( not ( = ?auto_543642 ?auto_543645 ) ) ( not ( = ?auto_543642 ?auto_543646 ) ) ( not ( = ?auto_543643 ?auto_543644 ) ) ( not ( = ?auto_543643 ?auto_543645 ) ) ( not ( = ?auto_543643 ?auto_543646 ) ) ( not ( = ?auto_543644 ?auto_543645 ) ) ( not ( = ?auto_543644 ?auto_543646 ) ) ( not ( = ?auto_543645 ?auto_543646 ) ) ( ON ?auto_543644 ?auto_543645 ) ( ON ?auto_543643 ?auto_543644 ) ( ON ?auto_543642 ?auto_543643 ) ( ON ?auto_543641 ?auto_543642 ) ( ON ?auto_543640 ?auto_543641 ) ( ON ?auto_543639 ?auto_543640 ) ( ON ?auto_543638 ?auto_543639 ) ( ON ?auto_543637 ?auto_543638 ) ( ON ?auto_543636 ?auto_543637 ) ( ON ?auto_543635 ?auto_543636 ) ( ON ?auto_543634 ?auto_543635 ) ( ON ?auto_543633 ?auto_543634 ) ( CLEAR ?auto_543633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_543633 )
      ( MAKE-13PILE ?auto_543633 ?auto_543634 ?auto_543635 ?auto_543636 ?auto_543637 ?auto_543638 ?auto_543639 ?auto_543640 ?auto_543641 ?auto_543642 ?auto_543643 ?auto_543644 ?auto_543645 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_543688 - BLOCK
      ?auto_543689 - BLOCK
      ?auto_543690 - BLOCK
      ?auto_543691 - BLOCK
      ?auto_543692 - BLOCK
      ?auto_543693 - BLOCK
      ?auto_543694 - BLOCK
      ?auto_543695 - BLOCK
      ?auto_543696 - BLOCK
      ?auto_543697 - BLOCK
      ?auto_543698 - BLOCK
      ?auto_543699 - BLOCK
      ?auto_543700 - BLOCK
      ?auto_543701 - BLOCK
    )
    :vars
    (
      ?auto_543702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_543700 ) ( ON ?auto_543701 ?auto_543702 ) ( CLEAR ?auto_543701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_543688 ) ( ON ?auto_543689 ?auto_543688 ) ( ON ?auto_543690 ?auto_543689 ) ( ON ?auto_543691 ?auto_543690 ) ( ON ?auto_543692 ?auto_543691 ) ( ON ?auto_543693 ?auto_543692 ) ( ON ?auto_543694 ?auto_543693 ) ( ON ?auto_543695 ?auto_543694 ) ( ON ?auto_543696 ?auto_543695 ) ( ON ?auto_543697 ?auto_543696 ) ( ON ?auto_543698 ?auto_543697 ) ( ON ?auto_543699 ?auto_543698 ) ( ON ?auto_543700 ?auto_543699 ) ( not ( = ?auto_543688 ?auto_543689 ) ) ( not ( = ?auto_543688 ?auto_543690 ) ) ( not ( = ?auto_543688 ?auto_543691 ) ) ( not ( = ?auto_543688 ?auto_543692 ) ) ( not ( = ?auto_543688 ?auto_543693 ) ) ( not ( = ?auto_543688 ?auto_543694 ) ) ( not ( = ?auto_543688 ?auto_543695 ) ) ( not ( = ?auto_543688 ?auto_543696 ) ) ( not ( = ?auto_543688 ?auto_543697 ) ) ( not ( = ?auto_543688 ?auto_543698 ) ) ( not ( = ?auto_543688 ?auto_543699 ) ) ( not ( = ?auto_543688 ?auto_543700 ) ) ( not ( = ?auto_543688 ?auto_543701 ) ) ( not ( = ?auto_543688 ?auto_543702 ) ) ( not ( = ?auto_543689 ?auto_543690 ) ) ( not ( = ?auto_543689 ?auto_543691 ) ) ( not ( = ?auto_543689 ?auto_543692 ) ) ( not ( = ?auto_543689 ?auto_543693 ) ) ( not ( = ?auto_543689 ?auto_543694 ) ) ( not ( = ?auto_543689 ?auto_543695 ) ) ( not ( = ?auto_543689 ?auto_543696 ) ) ( not ( = ?auto_543689 ?auto_543697 ) ) ( not ( = ?auto_543689 ?auto_543698 ) ) ( not ( = ?auto_543689 ?auto_543699 ) ) ( not ( = ?auto_543689 ?auto_543700 ) ) ( not ( = ?auto_543689 ?auto_543701 ) ) ( not ( = ?auto_543689 ?auto_543702 ) ) ( not ( = ?auto_543690 ?auto_543691 ) ) ( not ( = ?auto_543690 ?auto_543692 ) ) ( not ( = ?auto_543690 ?auto_543693 ) ) ( not ( = ?auto_543690 ?auto_543694 ) ) ( not ( = ?auto_543690 ?auto_543695 ) ) ( not ( = ?auto_543690 ?auto_543696 ) ) ( not ( = ?auto_543690 ?auto_543697 ) ) ( not ( = ?auto_543690 ?auto_543698 ) ) ( not ( = ?auto_543690 ?auto_543699 ) ) ( not ( = ?auto_543690 ?auto_543700 ) ) ( not ( = ?auto_543690 ?auto_543701 ) ) ( not ( = ?auto_543690 ?auto_543702 ) ) ( not ( = ?auto_543691 ?auto_543692 ) ) ( not ( = ?auto_543691 ?auto_543693 ) ) ( not ( = ?auto_543691 ?auto_543694 ) ) ( not ( = ?auto_543691 ?auto_543695 ) ) ( not ( = ?auto_543691 ?auto_543696 ) ) ( not ( = ?auto_543691 ?auto_543697 ) ) ( not ( = ?auto_543691 ?auto_543698 ) ) ( not ( = ?auto_543691 ?auto_543699 ) ) ( not ( = ?auto_543691 ?auto_543700 ) ) ( not ( = ?auto_543691 ?auto_543701 ) ) ( not ( = ?auto_543691 ?auto_543702 ) ) ( not ( = ?auto_543692 ?auto_543693 ) ) ( not ( = ?auto_543692 ?auto_543694 ) ) ( not ( = ?auto_543692 ?auto_543695 ) ) ( not ( = ?auto_543692 ?auto_543696 ) ) ( not ( = ?auto_543692 ?auto_543697 ) ) ( not ( = ?auto_543692 ?auto_543698 ) ) ( not ( = ?auto_543692 ?auto_543699 ) ) ( not ( = ?auto_543692 ?auto_543700 ) ) ( not ( = ?auto_543692 ?auto_543701 ) ) ( not ( = ?auto_543692 ?auto_543702 ) ) ( not ( = ?auto_543693 ?auto_543694 ) ) ( not ( = ?auto_543693 ?auto_543695 ) ) ( not ( = ?auto_543693 ?auto_543696 ) ) ( not ( = ?auto_543693 ?auto_543697 ) ) ( not ( = ?auto_543693 ?auto_543698 ) ) ( not ( = ?auto_543693 ?auto_543699 ) ) ( not ( = ?auto_543693 ?auto_543700 ) ) ( not ( = ?auto_543693 ?auto_543701 ) ) ( not ( = ?auto_543693 ?auto_543702 ) ) ( not ( = ?auto_543694 ?auto_543695 ) ) ( not ( = ?auto_543694 ?auto_543696 ) ) ( not ( = ?auto_543694 ?auto_543697 ) ) ( not ( = ?auto_543694 ?auto_543698 ) ) ( not ( = ?auto_543694 ?auto_543699 ) ) ( not ( = ?auto_543694 ?auto_543700 ) ) ( not ( = ?auto_543694 ?auto_543701 ) ) ( not ( = ?auto_543694 ?auto_543702 ) ) ( not ( = ?auto_543695 ?auto_543696 ) ) ( not ( = ?auto_543695 ?auto_543697 ) ) ( not ( = ?auto_543695 ?auto_543698 ) ) ( not ( = ?auto_543695 ?auto_543699 ) ) ( not ( = ?auto_543695 ?auto_543700 ) ) ( not ( = ?auto_543695 ?auto_543701 ) ) ( not ( = ?auto_543695 ?auto_543702 ) ) ( not ( = ?auto_543696 ?auto_543697 ) ) ( not ( = ?auto_543696 ?auto_543698 ) ) ( not ( = ?auto_543696 ?auto_543699 ) ) ( not ( = ?auto_543696 ?auto_543700 ) ) ( not ( = ?auto_543696 ?auto_543701 ) ) ( not ( = ?auto_543696 ?auto_543702 ) ) ( not ( = ?auto_543697 ?auto_543698 ) ) ( not ( = ?auto_543697 ?auto_543699 ) ) ( not ( = ?auto_543697 ?auto_543700 ) ) ( not ( = ?auto_543697 ?auto_543701 ) ) ( not ( = ?auto_543697 ?auto_543702 ) ) ( not ( = ?auto_543698 ?auto_543699 ) ) ( not ( = ?auto_543698 ?auto_543700 ) ) ( not ( = ?auto_543698 ?auto_543701 ) ) ( not ( = ?auto_543698 ?auto_543702 ) ) ( not ( = ?auto_543699 ?auto_543700 ) ) ( not ( = ?auto_543699 ?auto_543701 ) ) ( not ( = ?auto_543699 ?auto_543702 ) ) ( not ( = ?auto_543700 ?auto_543701 ) ) ( not ( = ?auto_543700 ?auto_543702 ) ) ( not ( = ?auto_543701 ?auto_543702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_543701 ?auto_543702 )
      ( !STACK ?auto_543701 ?auto_543700 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_543746 - BLOCK
      ?auto_543747 - BLOCK
      ?auto_543748 - BLOCK
      ?auto_543749 - BLOCK
      ?auto_543750 - BLOCK
      ?auto_543751 - BLOCK
      ?auto_543752 - BLOCK
      ?auto_543753 - BLOCK
      ?auto_543754 - BLOCK
      ?auto_543755 - BLOCK
      ?auto_543756 - BLOCK
      ?auto_543757 - BLOCK
      ?auto_543758 - BLOCK
      ?auto_543759 - BLOCK
    )
    :vars
    (
      ?auto_543760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543759 ?auto_543760 ) ( ON-TABLE ?auto_543746 ) ( ON ?auto_543747 ?auto_543746 ) ( ON ?auto_543748 ?auto_543747 ) ( ON ?auto_543749 ?auto_543748 ) ( ON ?auto_543750 ?auto_543749 ) ( ON ?auto_543751 ?auto_543750 ) ( ON ?auto_543752 ?auto_543751 ) ( ON ?auto_543753 ?auto_543752 ) ( ON ?auto_543754 ?auto_543753 ) ( ON ?auto_543755 ?auto_543754 ) ( ON ?auto_543756 ?auto_543755 ) ( ON ?auto_543757 ?auto_543756 ) ( not ( = ?auto_543746 ?auto_543747 ) ) ( not ( = ?auto_543746 ?auto_543748 ) ) ( not ( = ?auto_543746 ?auto_543749 ) ) ( not ( = ?auto_543746 ?auto_543750 ) ) ( not ( = ?auto_543746 ?auto_543751 ) ) ( not ( = ?auto_543746 ?auto_543752 ) ) ( not ( = ?auto_543746 ?auto_543753 ) ) ( not ( = ?auto_543746 ?auto_543754 ) ) ( not ( = ?auto_543746 ?auto_543755 ) ) ( not ( = ?auto_543746 ?auto_543756 ) ) ( not ( = ?auto_543746 ?auto_543757 ) ) ( not ( = ?auto_543746 ?auto_543758 ) ) ( not ( = ?auto_543746 ?auto_543759 ) ) ( not ( = ?auto_543746 ?auto_543760 ) ) ( not ( = ?auto_543747 ?auto_543748 ) ) ( not ( = ?auto_543747 ?auto_543749 ) ) ( not ( = ?auto_543747 ?auto_543750 ) ) ( not ( = ?auto_543747 ?auto_543751 ) ) ( not ( = ?auto_543747 ?auto_543752 ) ) ( not ( = ?auto_543747 ?auto_543753 ) ) ( not ( = ?auto_543747 ?auto_543754 ) ) ( not ( = ?auto_543747 ?auto_543755 ) ) ( not ( = ?auto_543747 ?auto_543756 ) ) ( not ( = ?auto_543747 ?auto_543757 ) ) ( not ( = ?auto_543747 ?auto_543758 ) ) ( not ( = ?auto_543747 ?auto_543759 ) ) ( not ( = ?auto_543747 ?auto_543760 ) ) ( not ( = ?auto_543748 ?auto_543749 ) ) ( not ( = ?auto_543748 ?auto_543750 ) ) ( not ( = ?auto_543748 ?auto_543751 ) ) ( not ( = ?auto_543748 ?auto_543752 ) ) ( not ( = ?auto_543748 ?auto_543753 ) ) ( not ( = ?auto_543748 ?auto_543754 ) ) ( not ( = ?auto_543748 ?auto_543755 ) ) ( not ( = ?auto_543748 ?auto_543756 ) ) ( not ( = ?auto_543748 ?auto_543757 ) ) ( not ( = ?auto_543748 ?auto_543758 ) ) ( not ( = ?auto_543748 ?auto_543759 ) ) ( not ( = ?auto_543748 ?auto_543760 ) ) ( not ( = ?auto_543749 ?auto_543750 ) ) ( not ( = ?auto_543749 ?auto_543751 ) ) ( not ( = ?auto_543749 ?auto_543752 ) ) ( not ( = ?auto_543749 ?auto_543753 ) ) ( not ( = ?auto_543749 ?auto_543754 ) ) ( not ( = ?auto_543749 ?auto_543755 ) ) ( not ( = ?auto_543749 ?auto_543756 ) ) ( not ( = ?auto_543749 ?auto_543757 ) ) ( not ( = ?auto_543749 ?auto_543758 ) ) ( not ( = ?auto_543749 ?auto_543759 ) ) ( not ( = ?auto_543749 ?auto_543760 ) ) ( not ( = ?auto_543750 ?auto_543751 ) ) ( not ( = ?auto_543750 ?auto_543752 ) ) ( not ( = ?auto_543750 ?auto_543753 ) ) ( not ( = ?auto_543750 ?auto_543754 ) ) ( not ( = ?auto_543750 ?auto_543755 ) ) ( not ( = ?auto_543750 ?auto_543756 ) ) ( not ( = ?auto_543750 ?auto_543757 ) ) ( not ( = ?auto_543750 ?auto_543758 ) ) ( not ( = ?auto_543750 ?auto_543759 ) ) ( not ( = ?auto_543750 ?auto_543760 ) ) ( not ( = ?auto_543751 ?auto_543752 ) ) ( not ( = ?auto_543751 ?auto_543753 ) ) ( not ( = ?auto_543751 ?auto_543754 ) ) ( not ( = ?auto_543751 ?auto_543755 ) ) ( not ( = ?auto_543751 ?auto_543756 ) ) ( not ( = ?auto_543751 ?auto_543757 ) ) ( not ( = ?auto_543751 ?auto_543758 ) ) ( not ( = ?auto_543751 ?auto_543759 ) ) ( not ( = ?auto_543751 ?auto_543760 ) ) ( not ( = ?auto_543752 ?auto_543753 ) ) ( not ( = ?auto_543752 ?auto_543754 ) ) ( not ( = ?auto_543752 ?auto_543755 ) ) ( not ( = ?auto_543752 ?auto_543756 ) ) ( not ( = ?auto_543752 ?auto_543757 ) ) ( not ( = ?auto_543752 ?auto_543758 ) ) ( not ( = ?auto_543752 ?auto_543759 ) ) ( not ( = ?auto_543752 ?auto_543760 ) ) ( not ( = ?auto_543753 ?auto_543754 ) ) ( not ( = ?auto_543753 ?auto_543755 ) ) ( not ( = ?auto_543753 ?auto_543756 ) ) ( not ( = ?auto_543753 ?auto_543757 ) ) ( not ( = ?auto_543753 ?auto_543758 ) ) ( not ( = ?auto_543753 ?auto_543759 ) ) ( not ( = ?auto_543753 ?auto_543760 ) ) ( not ( = ?auto_543754 ?auto_543755 ) ) ( not ( = ?auto_543754 ?auto_543756 ) ) ( not ( = ?auto_543754 ?auto_543757 ) ) ( not ( = ?auto_543754 ?auto_543758 ) ) ( not ( = ?auto_543754 ?auto_543759 ) ) ( not ( = ?auto_543754 ?auto_543760 ) ) ( not ( = ?auto_543755 ?auto_543756 ) ) ( not ( = ?auto_543755 ?auto_543757 ) ) ( not ( = ?auto_543755 ?auto_543758 ) ) ( not ( = ?auto_543755 ?auto_543759 ) ) ( not ( = ?auto_543755 ?auto_543760 ) ) ( not ( = ?auto_543756 ?auto_543757 ) ) ( not ( = ?auto_543756 ?auto_543758 ) ) ( not ( = ?auto_543756 ?auto_543759 ) ) ( not ( = ?auto_543756 ?auto_543760 ) ) ( not ( = ?auto_543757 ?auto_543758 ) ) ( not ( = ?auto_543757 ?auto_543759 ) ) ( not ( = ?auto_543757 ?auto_543760 ) ) ( not ( = ?auto_543758 ?auto_543759 ) ) ( not ( = ?auto_543758 ?auto_543760 ) ) ( not ( = ?auto_543759 ?auto_543760 ) ) ( CLEAR ?auto_543757 ) ( ON ?auto_543758 ?auto_543759 ) ( CLEAR ?auto_543758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_543746 ?auto_543747 ?auto_543748 ?auto_543749 ?auto_543750 ?auto_543751 ?auto_543752 ?auto_543753 ?auto_543754 ?auto_543755 ?auto_543756 ?auto_543757 ?auto_543758 )
      ( MAKE-14PILE ?auto_543746 ?auto_543747 ?auto_543748 ?auto_543749 ?auto_543750 ?auto_543751 ?auto_543752 ?auto_543753 ?auto_543754 ?auto_543755 ?auto_543756 ?auto_543757 ?auto_543758 ?auto_543759 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_543804 - BLOCK
      ?auto_543805 - BLOCK
      ?auto_543806 - BLOCK
      ?auto_543807 - BLOCK
      ?auto_543808 - BLOCK
      ?auto_543809 - BLOCK
      ?auto_543810 - BLOCK
      ?auto_543811 - BLOCK
      ?auto_543812 - BLOCK
      ?auto_543813 - BLOCK
      ?auto_543814 - BLOCK
      ?auto_543815 - BLOCK
      ?auto_543816 - BLOCK
      ?auto_543817 - BLOCK
    )
    :vars
    (
      ?auto_543818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543817 ?auto_543818 ) ( ON-TABLE ?auto_543804 ) ( ON ?auto_543805 ?auto_543804 ) ( ON ?auto_543806 ?auto_543805 ) ( ON ?auto_543807 ?auto_543806 ) ( ON ?auto_543808 ?auto_543807 ) ( ON ?auto_543809 ?auto_543808 ) ( ON ?auto_543810 ?auto_543809 ) ( ON ?auto_543811 ?auto_543810 ) ( ON ?auto_543812 ?auto_543811 ) ( ON ?auto_543813 ?auto_543812 ) ( ON ?auto_543814 ?auto_543813 ) ( not ( = ?auto_543804 ?auto_543805 ) ) ( not ( = ?auto_543804 ?auto_543806 ) ) ( not ( = ?auto_543804 ?auto_543807 ) ) ( not ( = ?auto_543804 ?auto_543808 ) ) ( not ( = ?auto_543804 ?auto_543809 ) ) ( not ( = ?auto_543804 ?auto_543810 ) ) ( not ( = ?auto_543804 ?auto_543811 ) ) ( not ( = ?auto_543804 ?auto_543812 ) ) ( not ( = ?auto_543804 ?auto_543813 ) ) ( not ( = ?auto_543804 ?auto_543814 ) ) ( not ( = ?auto_543804 ?auto_543815 ) ) ( not ( = ?auto_543804 ?auto_543816 ) ) ( not ( = ?auto_543804 ?auto_543817 ) ) ( not ( = ?auto_543804 ?auto_543818 ) ) ( not ( = ?auto_543805 ?auto_543806 ) ) ( not ( = ?auto_543805 ?auto_543807 ) ) ( not ( = ?auto_543805 ?auto_543808 ) ) ( not ( = ?auto_543805 ?auto_543809 ) ) ( not ( = ?auto_543805 ?auto_543810 ) ) ( not ( = ?auto_543805 ?auto_543811 ) ) ( not ( = ?auto_543805 ?auto_543812 ) ) ( not ( = ?auto_543805 ?auto_543813 ) ) ( not ( = ?auto_543805 ?auto_543814 ) ) ( not ( = ?auto_543805 ?auto_543815 ) ) ( not ( = ?auto_543805 ?auto_543816 ) ) ( not ( = ?auto_543805 ?auto_543817 ) ) ( not ( = ?auto_543805 ?auto_543818 ) ) ( not ( = ?auto_543806 ?auto_543807 ) ) ( not ( = ?auto_543806 ?auto_543808 ) ) ( not ( = ?auto_543806 ?auto_543809 ) ) ( not ( = ?auto_543806 ?auto_543810 ) ) ( not ( = ?auto_543806 ?auto_543811 ) ) ( not ( = ?auto_543806 ?auto_543812 ) ) ( not ( = ?auto_543806 ?auto_543813 ) ) ( not ( = ?auto_543806 ?auto_543814 ) ) ( not ( = ?auto_543806 ?auto_543815 ) ) ( not ( = ?auto_543806 ?auto_543816 ) ) ( not ( = ?auto_543806 ?auto_543817 ) ) ( not ( = ?auto_543806 ?auto_543818 ) ) ( not ( = ?auto_543807 ?auto_543808 ) ) ( not ( = ?auto_543807 ?auto_543809 ) ) ( not ( = ?auto_543807 ?auto_543810 ) ) ( not ( = ?auto_543807 ?auto_543811 ) ) ( not ( = ?auto_543807 ?auto_543812 ) ) ( not ( = ?auto_543807 ?auto_543813 ) ) ( not ( = ?auto_543807 ?auto_543814 ) ) ( not ( = ?auto_543807 ?auto_543815 ) ) ( not ( = ?auto_543807 ?auto_543816 ) ) ( not ( = ?auto_543807 ?auto_543817 ) ) ( not ( = ?auto_543807 ?auto_543818 ) ) ( not ( = ?auto_543808 ?auto_543809 ) ) ( not ( = ?auto_543808 ?auto_543810 ) ) ( not ( = ?auto_543808 ?auto_543811 ) ) ( not ( = ?auto_543808 ?auto_543812 ) ) ( not ( = ?auto_543808 ?auto_543813 ) ) ( not ( = ?auto_543808 ?auto_543814 ) ) ( not ( = ?auto_543808 ?auto_543815 ) ) ( not ( = ?auto_543808 ?auto_543816 ) ) ( not ( = ?auto_543808 ?auto_543817 ) ) ( not ( = ?auto_543808 ?auto_543818 ) ) ( not ( = ?auto_543809 ?auto_543810 ) ) ( not ( = ?auto_543809 ?auto_543811 ) ) ( not ( = ?auto_543809 ?auto_543812 ) ) ( not ( = ?auto_543809 ?auto_543813 ) ) ( not ( = ?auto_543809 ?auto_543814 ) ) ( not ( = ?auto_543809 ?auto_543815 ) ) ( not ( = ?auto_543809 ?auto_543816 ) ) ( not ( = ?auto_543809 ?auto_543817 ) ) ( not ( = ?auto_543809 ?auto_543818 ) ) ( not ( = ?auto_543810 ?auto_543811 ) ) ( not ( = ?auto_543810 ?auto_543812 ) ) ( not ( = ?auto_543810 ?auto_543813 ) ) ( not ( = ?auto_543810 ?auto_543814 ) ) ( not ( = ?auto_543810 ?auto_543815 ) ) ( not ( = ?auto_543810 ?auto_543816 ) ) ( not ( = ?auto_543810 ?auto_543817 ) ) ( not ( = ?auto_543810 ?auto_543818 ) ) ( not ( = ?auto_543811 ?auto_543812 ) ) ( not ( = ?auto_543811 ?auto_543813 ) ) ( not ( = ?auto_543811 ?auto_543814 ) ) ( not ( = ?auto_543811 ?auto_543815 ) ) ( not ( = ?auto_543811 ?auto_543816 ) ) ( not ( = ?auto_543811 ?auto_543817 ) ) ( not ( = ?auto_543811 ?auto_543818 ) ) ( not ( = ?auto_543812 ?auto_543813 ) ) ( not ( = ?auto_543812 ?auto_543814 ) ) ( not ( = ?auto_543812 ?auto_543815 ) ) ( not ( = ?auto_543812 ?auto_543816 ) ) ( not ( = ?auto_543812 ?auto_543817 ) ) ( not ( = ?auto_543812 ?auto_543818 ) ) ( not ( = ?auto_543813 ?auto_543814 ) ) ( not ( = ?auto_543813 ?auto_543815 ) ) ( not ( = ?auto_543813 ?auto_543816 ) ) ( not ( = ?auto_543813 ?auto_543817 ) ) ( not ( = ?auto_543813 ?auto_543818 ) ) ( not ( = ?auto_543814 ?auto_543815 ) ) ( not ( = ?auto_543814 ?auto_543816 ) ) ( not ( = ?auto_543814 ?auto_543817 ) ) ( not ( = ?auto_543814 ?auto_543818 ) ) ( not ( = ?auto_543815 ?auto_543816 ) ) ( not ( = ?auto_543815 ?auto_543817 ) ) ( not ( = ?auto_543815 ?auto_543818 ) ) ( not ( = ?auto_543816 ?auto_543817 ) ) ( not ( = ?auto_543816 ?auto_543818 ) ) ( not ( = ?auto_543817 ?auto_543818 ) ) ( ON ?auto_543816 ?auto_543817 ) ( CLEAR ?auto_543814 ) ( ON ?auto_543815 ?auto_543816 ) ( CLEAR ?auto_543815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_543804 ?auto_543805 ?auto_543806 ?auto_543807 ?auto_543808 ?auto_543809 ?auto_543810 ?auto_543811 ?auto_543812 ?auto_543813 ?auto_543814 ?auto_543815 )
      ( MAKE-14PILE ?auto_543804 ?auto_543805 ?auto_543806 ?auto_543807 ?auto_543808 ?auto_543809 ?auto_543810 ?auto_543811 ?auto_543812 ?auto_543813 ?auto_543814 ?auto_543815 ?auto_543816 ?auto_543817 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_543862 - BLOCK
      ?auto_543863 - BLOCK
      ?auto_543864 - BLOCK
      ?auto_543865 - BLOCK
      ?auto_543866 - BLOCK
      ?auto_543867 - BLOCK
      ?auto_543868 - BLOCK
      ?auto_543869 - BLOCK
      ?auto_543870 - BLOCK
      ?auto_543871 - BLOCK
      ?auto_543872 - BLOCK
      ?auto_543873 - BLOCK
      ?auto_543874 - BLOCK
      ?auto_543875 - BLOCK
    )
    :vars
    (
      ?auto_543876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543875 ?auto_543876 ) ( ON-TABLE ?auto_543862 ) ( ON ?auto_543863 ?auto_543862 ) ( ON ?auto_543864 ?auto_543863 ) ( ON ?auto_543865 ?auto_543864 ) ( ON ?auto_543866 ?auto_543865 ) ( ON ?auto_543867 ?auto_543866 ) ( ON ?auto_543868 ?auto_543867 ) ( ON ?auto_543869 ?auto_543868 ) ( ON ?auto_543870 ?auto_543869 ) ( ON ?auto_543871 ?auto_543870 ) ( not ( = ?auto_543862 ?auto_543863 ) ) ( not ( = ?auto_543862 ?auto_543864 ) ) ( not ( = ?auto_543862 ?auto_543865 ) ) ( not ( = ?auto_543862 ?auto_543866 ) ) ( not ( = ?auto_543862 ?auto_543867 ) ) ( not ( = ?auto_543862 ?auto_543868 ) ) ( not ( = ?auto_543862 ?auto_543869 ) ) ( not ( = ?auto_543862 ?auto_543870 ) ) ( not ( = ?auto_543862 ?auto_543871 ) ) ( not ( = ?auto_543862 ?auto_543872 ) ) ( not ( = ?auto_543862 ?auto_543873 ) ) ( not ( = ?auto_543862 ?auto_543874 ) ) ( not ( = ?auto_543862 ?auto_543875 ) ) ( not ( = ?auto_543862 ?auto_543876 ) ) ( not ( = ?auto_543863 ?auto_543864 ) ) ( not ( = ?auto_543863 ?auto_543865 ) ) ( not ( = ?auto_543863 ?auto_543866 ) ) ( not ( = ?auto_543863 ?auto_543867 ) ) ( not ( = ?auto_543863 ?auto_543868 ) ) ( not ( = ?auto_543863 ?auto_543869 ) ) ( not ( = ?auto_543863 ?auto_543870 ) ) ( not ( = ?auto_543863 ?auto_543871 ) ) ( not ( = ?auto_543863 ?auto_543872 ) ) ( not ( = ?auto_543863 ?auto_543873 ) ) ( not ( = ?auto_543863 ?auto_543874 ) ) ( not ( = ?auto_543863 ?auto_543875 ) ) ( not ( = ?auto_543863 ?auto_543876 ) ) ( not ( = ?auto_543864 ?auto_543865 ) ) ( not ( = ?auto_543864 ?auto_543866 ) ) ( not ( = ?auto_543864 ?auto_543867 ) ) ( not ( = ?auto_543864 ?auto_543868 ) ) ( not ( = ?auto_543864 ?auto_543869 ) ) ( not ( = ?auto_543864 ?auto_543870 ) ) ( not ( = ?auto_543864 ?auto_543871 ) ) ( not ( = ?auto_543864 ?auto_543872 ) ) ( not ( = ?auto_543864 ?auto_543873 ) ) ( not ( = ?auto_543864 ?auto_543874 ) ) ( not ( = ?auto_543864 ?auto_543875 ) ) ( not ( = ?auto_543864 ?auto_543876 ) ) ( not ( = ?auto_543865 ?auto_543866 ) ) ( not ( = ?auto_543865 ?auto_543867 ) ) ( not ( = ?auto_543865 ?auto_543868 ) ) ( not ( = ?auto_543865 ?auto_543869 ) ) ( not ( = ?auto_543865 ?auto_543870 ) ) ( not ( = ?auto_543865 ?auto_543871 ) ) ( not ( = ?auto_543865 ?auto_543872 ) ) ( not ( = ?auto_543865 ?auto_543873 ) ) ( not ( = ?auto_543865 ?auto_543874 ) ) ( not ( = ?auto_543865 ?auto_543875 ) ) ( not ( = ?auto_543865 ?auto_543876 ) ) ( not ( = ?auto_543866 ?auto_543867 ) ) ( not ( = ?auto_543866 ?auto_543868 ) ) ( not ( = ?auto_543866 ?auto_543869 ) ) ( not ( = ?auto_543866 ?auto_543870 ) ) ( not ( = ?auto_543866 ?auto_543871 ) ) ( not ( = ?auto_543866 ?auto_543872 ) ) ( not ( = ?auto_543866 ?auto_543873 ) ) ( not ( = ?auto_543866 ?auto_543874 ) ) ( not ( = ?auto_543866 ?auto_543875 ) ) ( not ( = ?auto_543866 ?auto_543876 ) ) ( not ( = ?auto_543867 ?auto_543868 ) ) ( not ( = ?auto_543867 ?auto_543869 ) ) ( not ( = ?auto_543867 ?auto_543870 ) ) ( not ( = ?auto_543867 ?auto_543871 ) ) ( not ( = ?auto_543867 ?auto_543872 ) ) ( not ( = ?auto_543867 ?auto_543873 ) ) ( not ( = ?auto_543867 ?auto_543874 ) ) ( not ( = ?auto_543867 ?auto_543875 ) ) ( not ( = ?auto_543867 ?auto_543876 ) ) ( not ( = ?auto_543868 ?auto_543869 ) ) ( not ( = ?auto_543868 ?auto_543870 ) ) ( not ( = ?auto_543868 ?auto_543871 ) ) ( not ( = ?auto_543868 ?auto_543872 ) ) ( not ( = ?auto_543868 ?auto_543873 ) ) ( not ( = ?auto_543868 ?auto_543874 ) ) ( not ( = ?auto_543868 ?auto_543875 ) ) ( not ( = ?auto_543868 ?auto_543876 ) ) ( not ( = ?auto_543869 ?auto_543870 ) ) ( not ( = ?auto_543869 ?auto_543871 ) ) ( not ( = ?auto_543869 ?auto_543872 ) ) ( not ( = ?auto_543869 ?auto_543873 ) ) ( not ( = ?auto_543869 ?auto_543874 ) ) ( not ( = ?auto_543869 ?auto_543875 ) ) ( not ( = ?auto_543869 ?auto_543876 ) ) ( not ( = ?auto_543870 ?auto_543871 ) ) ( not ( = ?auto_543870 ?auto_543872 ) ) ( not ( = ?auto_543870 ?auto_543873 ) ) ( not ( = ?auto_543870 ?auto_543874 ) ) ( not ( = ?auto_543870 ?auto_543875 ) ) ( not ( = ?auto_543870 ?auto_543876 ) ) ( not ( = ?auto_543871 ?auto_543872 ) ) ( not ( = ?auto_543871 ?auto_543873 ) ) ( not ( = ?auto_543871 ?auto_543874 ) ) ( not ( = ?auto_543871 ?auto_543875 ) ) ( not ( = ?auto_543871 ?auto_543876 ) ) ( not ( = ?auto_543872 ?auto_543873 ) ) ( not ( = ?auto_543872 ?auto_543874 ) ) ( not ( = ?auto_543872 ?auto_543875 ) ) ( not ( = ?auto_543872 ?auto_543876 ) ) ( not ( = ?auto_543873 ?auto_543874 ) ) ( not ( = ?auto_543873 ?auto_543875 ) ) ( not ( = ?auto_543873 ?auto_543876 ) ) ( not ( = ?auto_543874 ?auto_543875 ) ) ( not ( = ?auto_543874 ?auto_543876 ) ) ( not ( = ?auto_543875 ?auto_543876 ) ) ( ON ?auto_543874 ?auto_543875 ) ( ON ?auto_543873 ?auto_543874 ) ( CLEAR ?auto_543871 ) ( ON ?auto_543872 ?auto_543873 ) ( CLEAR ?auto_543872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_543862 ?auto_543863 ?auto_543864 ?auto_543865 ?auto_543866 ?auto_543867 ?auto_543868 ?auto_543869 ?auto_543870 ?auto_543871 ?auto_543872 )
      ( MAKE-14PILE ?auto_543862 ?auto_543863 ?auto_543864 ?auto_543865 ?auto_543866 ?auto_543867 ?auto_543868 ?auto_543869 ?auto_543870 ?auto_543871 ?auto_543872 ?auto_543873 ?auto_543874 ?auto_543875 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_543920 - BLOCK
      ?auto_543921 - BLOCK
      ?auto_543922 - BLOCK
      ?auto_543923 - BLOCK
      ?auto_543924 - BLOCK
      ?auto_543925 - BLOCK
      ?auto_543926 - BLOCK
      ?auto_543927 - BLOCK
      ?auto_543928 - BLOCK
      ?auto_543929 - BLOCK
      ?auto_543930 - BLOCK
      ?auto_543931 - BLOCK
      ?auto_543932 - BLOCK
      ?auto_543933 - BLOCK
    )
    :vars
    (
      ?auto_543934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543933 ?auto_543934 ) ( ON-TABLE ?auto_543920 ) ( ON ?auto_543921 ?auto_543920 ) ( ON ?auto_543922 ?auto_543921 ) ( ON ?auto_543923 ?auto_543922 ) ( ON ?auto_543924 ?auto_543923 ) ( ON ?auto_543925 ?auto_543924 ) ( ON ?auto_543926 ?auto_543925 ) ( ON ?auto_543927 ?auto_543926 ) ( ON ?auto_543928 ?auto_543927 ) ( not ( = ?auto_543920 ?auto_543921 ) ) ( not ( = ?auto_543920 ?auto_543922 ) ) ( not ( = ?auto_543920 ?auto_543923 ) ) ( not ( = ?auto_543920 ?auto_543924 ) ) ( not ( = ?auto_543920 ?auto_543925 ) ) ( not ( = ?auto_543920 ?auto_543926 ) ) ( not ( = ?auto_543920 ?auto_543927 ) ) ( not ( = ?auto_543920 ?auto_543928 ) ) ( not ( = ?auto_543920 ?auto_543929 ) ) ( not ( = ?auto_543920 ?auto_543930 ) ) ( not ( = ?auto_543920 ?auto_543931 ) ) ( not ( = ?auto_543920 ?auto_543932 ) ) ( not ( = ?auto_543920 ?auto_543933 ) ) ( not ( = ?auto_543920 ?auto_543934 ) ) ( not ( = ?auto_543921 ?auto_543922 ) ) ( not ( = ?auto_543921 ?auto_543923 ) ) ( not ( = ?auto_543921 ?auto_543924 ) ) ( not ( = ?auto_543921 ?auto_543925 ) ) ( not ( = ?auto_543921 ?auto_543926 ) ) ( not ( = ?auto_543921 ?auto_543927 ) ) ( not ( = ?auto_543921 ?auto_543928 ) ) ( not ( = ?auto_543921 ?auto_543929 ) ) ( not ( = ?auto_543921 ?auto_543930 ) ) ( not ( = ?auto_543921 ?auto_543931 ) ) ( not ( = ?auto_543921 ?auto_543932 ) ) ( not ( = ?auto_543921 ?auto_543933 ) ) ( not ( = ?auto_543921 ?auto_543934 ) ) ( not ( = ?auto_543922 ?auto_543923 ) ) ( not ( = ?auto_543922 ?auto_543924 ) ) ( not ( = ?auto_543922 ?auto_543925 ) ) ( not ( = ?auto_543922 ?auto_543926 ) ) ( not ( = ?auto_543922 ?auto_543927 ) ) ( not ( = ?auto_543922 ?auto_543928 ) ) ( not ( = ?auto_543922 ?auto_543929 ) ) ( not ( = ?auto_543922 ?auto_543930 ) ) ( not ( = ?auto_543922 ?auto_543931 ) ) ( not ( = ?auto_543922 ?auto_543932 ) ) ( not ( = ?auto_543922 ?auto_543933 ) ) ( not ( = ?auto_543922 ?auto_543934 ) ) ( not ( = ?auto_543923 ?auto_543924 ) ) ( not ( = ?auto_543923 ?auto_543925 ) ) ( not ( = ?auto_543923 ?auto_543926 ) ) ( not ( = ?auto_543923 ?auto_543927 ) ) ( not ( = ?auto_543923 ?auto_543928 ) ) ( not ( = ?auto_543923 ?auto_543929 ) ) ( not ( = ?auto_543923 ?auto_543930 ) ) ( not ( = ?auto_543923 ?auto_543931 ) ) ( not ( = ?auto_543923 ?auto_543932 ) ) ( not ( = ?auto_543923 ?auto_543933 ) ) ( not ( = ?auto_543923 ?auto_543934 ) ) ( not ( = ?auto_543924 ?auto_543925 ) ) ( not ( = ?auto_543924 ?auto_543926 ) ) ( not ( = ?auto_543924 ?auto_543927 ) ) ( not ( = ?auto_543924 ?auto_543928 ) ) ( not ( = ?auto_543924 ?auto_543929 ) ) ( not ( = ?auto_543924 ?auto_543930 ) ) ( not ( = ?auto_543924 ?auto_543931 ) ) ( not ( = ?auto_543924 ?auto_543932 ) ) ( not ( = ?auto_543924 ?auto_543933 ) ) ( not ( = ?auto_543924 ?auto_543934 ) ) ( not ( = ?auto_543925 ?auto_543926 ) ) ( not ( = ?auto_543925 ?auto_543927 ) ) ( not ( = ?auto_543925 ?auto_543928 ) ) ( not ( = ?auto_543925 ?auto_543929 ) ) ( not ( = ?auto_543925 ?auto_543930 ) ) ( not ( = ?auto_543925 ?auto_543931 ) ) ( not ( = ?auto_543925 ?auto_543932 ) ) ( not ( = ?auto_543925 ?auto_543933 ) ) ( not ( = ?auto_543925 ?auto_543934 ) ) ( not ( = ?auto_543926 ?auto_543927 ) ) ( not ( = ?auto_543926 ?auto_543928 ) ) ( not ( = ?auto_543926 ?auto_543929 ) ) ( not ( = ?auto_543926 ?auto_543930 ) ) ( not ( = ?auto_543926 ?auto_543931 ) ) ( not ( = ?auto_543926 ?auto_543932 ) ) ( not ( = ?auto_543926 ?auto_543933 ) ) ( not ( = ?auto_543926 ?auto_543934 ) ) ( not ( = ?auto_543927 ?auto_543928 ) ) ( not ( = ?auto_543927 ?auto_543929 ) ) ( not ( = ?auto_543927 ?auto_543930 ) ) ( not ( = ?auto_543927 ?auto_543931 ) ) ( not ( = ?auto_543927 ?auto_543932 ) ) ( not ( = ?auto_543927 ?auto_543933 ) ) ( not ( = ?auto_543927 ?auto_543934 ) ) ( not ( = ?auto_543928 ?auto_543929 ) ) ( not ( = ?auto_543928 ?auto_543930 ) ) ( not ( = ?auto_543928 ?auto_543931 ) ) ( not ( = ?auto_543928 ?auto_543932 ) ) ( not ( = ?auto_543928 ?auto_543933 ) ) ( not ( = ?auto_543928 ?auto_543934 ) ) ( not ( = ?auto_543929 ?auto_543930 ) ) ( not ( = ?auto_543929 ?auto_543931 ) ) ( not ( = ?auto_543929 ?auto_543932 ) ) ( not ( = ?auto_543929 ?auto_543933 ) ) ( not ( = ?auto_543929 ?auto_543934 ) ) ( not ( = ?auto_543930 ?auto_543931 ) ) ( not ( = ?auto_543930 ?auto_543932 ) ) ( not ( = ?auto_543930 ?auto_543933 ) ) ( not ( = ?auto_543930 ?auto_543934 ) ) ( not ( = ?auto_543931 ?auto_543932 ) ) ( not ( = ?auto_543931 ?auto_543933 ) ) ( not ( = ?auto_543931 ?auto_543934 ) ) ( not ( = ?auto_543932 ?auto_543933 ) ) ( not ( = ?auto_543932 ?auto_543934 ) ) ( not ( = ?auto_543933 ?auto_543934 ) ) ( ON ?auto_543932 ?auto_543933 ) ( ON ?auto_543931 ?auto_543932 ) ( ON ?auto_543930 ?auto_543931 ) ( CLEAR ?auto_543928 ) ( ON ?auto_543929 ?auto_543930 ) ( CLEAR ?auto_543929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_543920 ?auto_543921 ?auto_543922 ?auto_543923 ?auto_543924 ?auto_543925 ?auto_543926 ?auto_543927 ?auto_543928 ?auto_543929 )
      ( MAKE-14PILE ?auto_543920 ?auto_543921 ?auto_543922 ?auto_543923 ?auto_543924 ?auto_543925 ?auto_543926 ?auto_543927 ?auto_543928 ?auto_543929 ?auto_543930 ?auto_543931 ?auto_543932 ?auto_543933 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_543978 - BLOCK
      ?auto_543979 - BLOCK
      ?auto_543980 - BLOCK
      ?auto_543981 - BLOCK
      ?auto_543982 - BLOCK
      ?auto_543983 - BLOCK
      ?auto_543984 - BLOCK
      ?auto_543985 - BLOCK
      ?auto_543986 - BLOCK
      ?auto_543987 - BLOCK
      ?auto_543988 - BLOCK
      ?auto_543989 - BLOCK
      ?auto_543990 - BLOCK
      ?auto_543991 - BLOCK
    )
    :vars
    (
      ?auto_543992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_543991 ?auto_543992 ) ( ON-TABLE ?auto_543978 ) ( ON ?auto_543979 ?auto_543978 ) ( ON ?auto_543980 ?auto_543979 ) ( ON ?auto_543981 ?auto_543980 ) ( ON ?auto_543982 ?auto_543981 ) ( ON ?auto_543983 ?auto_543982 ) ( ON ?auto_543984 ?auto_543983 ) ( ON ?auto_543985 ?auto_543984 ) ( not ( = ?auto_543978 ?auto_543979 ) ) ( not ( = ?auto_543978 ?auto_543980 ) ) ( not ( = ?auto_543978 ?auto_543981 ) ) ( not ( = ?auto_543978 ?auto_543982 ) ) ( not ( = ?auto_543978 ?auto_543983 ) ) ( not ( = ?auto_543978 ?auto_543984 ) ) ( not ( = ?auto_543978 ?auto_543985 ) ) ( not ( = ?auto_543978 ?auto_543986 ) ) ( not ( = ?auto_543978 ?auto_543987 ) ) ( not ( = ?auto_543978 ?auto_543988 ) ) ( not ( = ?auto_543978 ?auto_543989 ) ) ( not ( = ?auto_543978 ?auto_543990 ) ) ( not ( = ?auto_543978 ?auto_543991 ) ) ( not ( = ?auto_543978 ?auto_543992 ) ) ( not ( = ?auto_543979 ?auto_543980 ) ) ( not ( = ?auto_543979 ?auto_543981 ) ) ( not ( = ?auto_543979 ?auto_543982 ) ) ( not ( = ?auto_543979 ?auto_543983 ) ) ( not ( = ?auto_543979 ?auto_543984 ) ) ( not ( = ?auto_543979 ?auto_543985 ) ) ( not ( = ?auto_543979 ?auto_543986 ) ) ( not ( = ?auto_543979 ?auto_543987 ) ) ( not ( = ?auto_543979 ?auto_543988 ) ) ( not ( = ?auto_543979 ?auto_543989 ) ) ( not ( = ?auto_543979 ?auto_543990 ) ) ( not ( = ?auto_543979 ?auto_543991 ) ) ( not ( = ?auto_543979 ?auto_543992 ) ) ( not ( = ?auto_543980 ?auto_543981 ) ) ( not ( = ?auto_543980 ?auto_543982 ) ) ( not ( = ?auto_543980 ?auto_543983 ) ) ( not ( = ?auto_543980 ?auto_543984 ) ) ( not ( = ?auto_543980 ?auto_543985 ) ) ( not ( = ?auto_543980 ?auto_543986 ) ) ( not ( = ?auto_543980 ?auto_543987 ) ) ( not ( = ?auto_543980 ?auto_543988 ) ) ( not ( = ?auto_543980 ?auto_543989 ) ) ( not ( = ?auto_543980 ?auto_543990 ) ) ( not ( = ?auto_543980 ?auto_543991 ) ) ( not ( = ?auto_543980 ?auto_543992 ) ) ( not ( = ?auto_543981 ?auto_543982 ) ) ( not ( = ?auto_543981 ?auto_543983 ) ) ( not ( = ?auto_543981 ?auto_543984 ) ) ( not ( = ?auto_543981 ?auto_543985 ) ) ( not ( = ?auto_543981 ?auto_543986 ) ) ( not ( = ?auto_543981 ?auto_543987 ) ) ( not ( = ?auto_543981 ?auto_543988 ) ) ( not ( = ?auto_543981 ?auto_543989 ) ) ( not ( = ?auto_543981 ?auto_543990 ) ) ( not ( = ?auto_543981 ?auto_543991 ) ) ( not ( = ?auto_543981 ?auto_543992 ) ) ( not ( = ?auto_543982 ?auto_543983 ) ) ( not ( = ?auto_543982 ?auto_543984 ) ) ( not ( = ?auto_543982 ?auto_543985 ) ) ( not ( = ?auto_543982 ?auto_543986 ) ) ( not ( = ?auto_543982 ?auto_543987 ) ) ( not ( = ?auto_543982 ?auto_543988 ) ) ( not ( = ?auto_543982 ?auto_543989 ) ) ( not ( = ?auto_543982 ?auto_543990 ) ) ( not ( = ?auto_543982 ?auto_543991 ) ) ( not ( = ?auto_543982 ?auto_543992 ) ) ( not ( = ?auto_543983 ?auto_543984 ) ) ( not ( = ?auto_543983 ?auto_543985 ) ) ( not ( = ?auto_543983 ?auto_543986 ) ) ( not ( = ?auto_543983 ?auto_543987 ) ) ( not ( = ?auto_543983 ?auto_543988 ) ) ( not ( = ?auto_543983 ?auto_543989 ) ) ( not ( = ?auto_543983 ?auto_543990 ) ) ( not ( = ?auto_543983 ?auto_543991 ) ) ( not ( = ?auto_543983 ?auto_543992 ) ) ( not ( = ?auto_543984 ?auto_543985 ) ) ( not ( = ?auto_543984 ?auto_543986 ) ) ( not ( = ?auto_543984 ?auto_543987 ) ) ( not ( = ?auto_543984 ?auto_543988 ) ) ( not ( = ?auto_543984 ?auto_543989 ) ) ( not ( = ?auto_543984 ?auto_543990 ) ) ( not ( = ?auto_543984 ?auto_543991 ) ) ( not ( = ?auto_543984 ?auto_543992 ) ) ( not ( = ?auto_543985 ?auto_543986 ) ) ( not ( = ?auto_543985 ?auto_543987 ) ) ( not ( = ?auto_543985 ?auto_543988 ) ) ( not ( = ?auto_543985 ?auto_543989 ) ) ( not ( = ?auto_543985 ?auto_543990 ) ) ( not ( = ?auto_543985 ?auto_543991 ) ) ( not ( = ?auto_543985 ?auto_543992 ) ) ( not ( = ?auto_543986 ?auto_543987 ) ) ( not ( = ?auto_543986 ?auto_543988 ) ) ( not ( = ?auto_543986 ?auto_543989 ) ) ( not ( = ?auto_543986 ?auto_543990 ) ) ( not ( = ?auto_543986 ?auto_543991 ) ) ( not ( = ?auto_543986 ?auto_543992 ) ) ( not ( = ?auto_543987 ?auto_543988 ) ) ( not ( = ?auto_543987 ?auto_543989 ) ) ( not ( = ?auto_543987 ?auto_543990 ) ) ( not ( = ?auto_543987 ?auto_543991 ) ) ( not ( = ?auto_543987 ?auto_543992 ) ) ( not ( = ?auto_543988 ?auto_543989 ) ) ( not ( = ?auto_543988 ?auto_543990 ) ) ( not ( = ?auto_543988 ?auto_543991 ) ) ( not ( = ?auto_543988 ?auto_543992 ) ) ( not ( = ?auto_543989 ?auto_543990 ) ) ( not ( = ?auto_543989 ?auto_543991 ) ) ( not ( = ?auto_543989 ?auto_543992 ) ) ( not ( = ?auto_543990 ?auto_543991 ) ) ( not ( = ?auto_543990 ?auto_543992 ) ) ( not ( = ?auto_543991 ?auto_543992 ) ) ( ON ?auto_543990 ?auto_543991 ) ( ON ?auto_543989 ?auto_543990 ) ( ON ?auto_543988 ?auto_543989 ) ( ON ?auto_543987 ?auto_543988 ) ( CLEAR ?auto_543985 ) ( ON ?auto_543986 ?auto_543987 ) ( CLEAR ?auto_543986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_543978 ?auto_543979 ?auto_543980 ?auto_543981 ?auto_543982 ?auto_543983 ?auto_543984 ?auto_543985 ?auto_543986 )
      ( MAKE-14PILE ?auto_543978 ?auto_543979 ?auto_543980 ?auto_543981 ?auto_543982 ?auto_543983 ?auto_543984 ?auto_543985 ?auto_543986 ?auto_543987 ?auto_543988 ?auto_543989 ?auto_543990 ?auto_543991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544036 - BLOCK
      ?auto_544037 - BLOCK
      ?auto_544038 - BLOCK
      ?auto_544039 - BLOCK
      ?auto_544040 - BLOCK
      ?auto_544041 - BLOCK
      ?auto_544042 - BLOCK
      ?auto_544043 - BLOCK
      ?auto_544044 - BLOCK
      ?auto_544045 - BLOCK
      ?auto_544046 - BLOCK
      ?auto_544047 - BLOCK
      ?auto_544048 - BLOCK
      ?auto_544049 - BLOCK
    )
    :vars
    (
      ?auto_544050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544049 ?auto_544050 ) ( ON-TABLE ?auto_544036 ) ( ON ?auto_544037 ?auto_544036 ) ( ON ?auto_544038 ?auto_544037 ) ( ON ?auto_544039 ?auto_544038 ) ( ON ?auto_544040 ?auto_544039 ) ( ON ?auto_544041 ?auto_544040 ) ( ON ?auto_544042 ?auto_544041 ) ( not ( = ?auto_544036 ?auto_544037 ) ) ( not ( = ?auto_544036 ?auto_544038 ) ) ( not ( = ?auto_544036 ?auto_544039 ) ) ( not ( = ?auto_544036 ?auto_544040 ) ) ( not ( = ?auto_544036 ?auto_544041 ) ) ( not ( = ?auto_544036 ?auto_544042 ) ) ( not ( = ?auto_544036 ?auto_544043 ) ) ( not ( = ?auto_544036 ?auto_544044 ) ) ( not ( = ?auto_544036 ?auto_544045 ) ) ( not ( = ?auto_544036 ?auto_544046 ) ) ( not ( = ?auto_544036 ?auto_544047 ) ) ( not ( = ?auto_544036 ?auto_544048 ) ) ( not ( = ?auto_544036 ?auto_544049 ) ) ( not ( = ?auto_544036 ?auto_544050 ) ) ( not ( = ?auto_544037 ?auto_544038 ) ) ( not ( = ?auto_544037 ?auto_544039 ) ) ( not ( = ?auto_544037 ?auto_544040 ) ) ( not ( = ?auto_544037 ?auto_544041 ) ) ( not ( = ?auto_544037 ?auto_544042 ) ) ( not ( = ?auto_544037 ?auto_544043 ) ) ( not ( = ?auto_544037 ?auto_544044 ) ) ( not ( = ?auto_544037 ?auto_544045 ) ) ( not ( = ?auto_544037 ?auto_544046 ) ) ( not ( = ?auto_544037 ?auto_544047 ) ) ( not ( = ?auto_544037 ?auto_544048 ) ) ( not ( = ?auto_544037 ?auto_544049 ) ) ( not ( = ?auto_544037 ?auto_544050 ) ) ( not ( = ?auto_544038 ?auto_544039 ) ) ( not ( = ?auto_544038 ?auto_544040 ) ) ( not ( = ?auto_544038 ?auto_544041 ) ) ( not ( = ?auto_544038 ?auto_544042 ) ) ( not ( = ?auto_544038 ?auto_544043 ) ) ( not ( = ?auto_544038 ?auto_544044 ) ) ( not ( = ?auto_544038 ?auto_544045 ) ) ( not ( = ?auto_544038 ?auto_544046 ) ) ( not ( = ?auto_544038 ?auto_544047 ) ) ( not ( = ?auto_544038 ?auto_544048 ) ) ( not ( = ?auto_544038 ?auto_544049 ) ) ( not ( = ?auto_544038 ?auto_544050 ) ) ( not ( = ?auto_544039 ?auto_544040 ) ) ( not ( = ?auto_544039 ?auto_544041 ) ) ( not ( = ?auto_544039 ?auto_544042 ) ) ( not ( = ?auto_544039 ?auto_544043 ) ) ( not ( = ?auto_544039 ?auto_544044 ) ) ( not ( = ?auto_544039 ?auto_544045 ) ) ( not ( = ?auto_544039 ?auto_544046 ) ) ( not ( = ?auto_544039 ?auto_544047 ) ) ( not ( = ?auto_544039 ?auto_544048 ) ) ( not ( = ?auto_544039 ?auto_544049 ) ) ( not ( = ?auto_544039 ?auto_544050 ) ) ( not ( = ?auto_544040 ?auto_544041 ) ) ( not ( = ?auto_544040 ?auto_544042 ) ) ( not ( = ?auto_544040 ?auto_544043 ) ) ( not ( = ?auto_544040 ?auto_544044 ) ) ( not ( = ?auto_544040 ?auto_544045 ) ) ( not ( = ?auto_544040 ?auto_544046 ) ) ( not ( = ?auto_544040 ?auto_544047 ) ) ( not ( = ?auto_544040 ?auto_544048 ) ) ( not ( = ?auto_544040 ?auto_544049 ) ) ( not ( = ?auto_544040 ?auto_544050 ) ) ( not ( = ?auto_544041 ?auto_544042 ) ) ( not ( = ?auto_544041 ?auto_544043 ) ) ( not ( = ?auto_544041 ?auto_544044 ) ) ( not ( = ?auto_544041 ?auto_544045 ) ) ( not ( = ?auto_544041 ?auto_544046 ) ) ( not ( = ?auto_544041 ?auto_544047 ) ) ( not ( = ?auto_544041 ?auto_544048 ) ) ( not ( = ?auto_544041 ?auto_544049 ) ) ( not ( = ?auto_544041 ?auto_544050 ) ) ( not ( = ?auto_544042 ?auto_544043 ) ) ( not ( = ?auto_544042 ?auto_544044 ) ) ( not ( = ?auto_544042 ?auto_544045 ) ) ( not ( = ?auto_544042 ?auto_544046 ) ) ( not ( = ?auto_544042 ?auto_544047 ) ) ( not ( = ?auto_544042 ?auto_544048 ) ) ( not ( = ?auto_544042 ?auto_544049 ) ) ( not ( = ?auto_544042 ?auto_544050 ) ) ( not ( = ?auto_544043 ?auto_544044 ) ) ( not ( = ?auto_544043 ?auto_544045 ) ) ( not ( = ?auto_544043 ?auto_544046 ) ) ( not ( = ?auto_544043 ?auto_544047 ) ) ( not ( = ?auto_544043 ?auto_544048 ) ) ( not ( = ?auto_544043 ?auto_544049 ) ) ( not ( = ?auto_544043 ?auto_544050 ) ) ( not ( = ?auto_544044 ?auto_544045 ) ) ( not ( = ?auto_544044 ?auto_544046 ) ) ( not ( = ?auto_544044 ?auto_544047 ) ) ( not ( = ?auto_544044 ?auto_544048 ) ) ( not ( = ?auto_544044 ?auto_544049 ) ) ( not ( = ?auto_544044 ?auto_544050 ) ) ( not ( = ?auto_544045 ?auto_544046 ) ) ( not ( = ?auto_544045 ?auto_544047 ) ) ( not ( = ?auto_544045 ?auto_544048 ) ) ( not ( = ?auto_544045 ?auto_544049 ) ) ( not ( = ?auto_544045 ?auto_544050 ) ) ( not ( = ?auto_544046 ?auto_544047 ) ) ( not ( = ?auto_544046 ?auto_544048 ) ) ( not ( = ?auto_544046 ?auto_544049 ) ) ( not ( = ?auto_544046 ?auto_544050 ) ) ( not ( = ?auto_544047 ?auto_544048 ) ) ( not ( = ?auto_544047 ?auto_544049 ) ) ( not ( = ?auto_544047 ?auto_544050 ) ) ( not ( = ?auto_544048 ?auto_544049 ) ) ( not ( = ?auto_544048 ?auto_544050 ) ) ( not ( = ?auto_544049 ?auto_544050 ) ) ( ON ?auto_544048 ?auto_544049 ) ( ON ?auto_544047 ?auto_544048 ) ( ON ?auto_544046 ?auto_544047 ) ( ON ?auto_544045 ?auto_544046 ) ( ON ?auto_544044 ?auto_544045 ) ( CLEAR ?auto_544042 ) ( ON ?auto_544043 ?auto_544044 ) ( CLEAR ?auto_544043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_544036 ?auto_544037 ?auto_544038 ?auto_544039 ?auto_544040 ?auto_544041 ?auto_544042 ?auto_544043 )
      ( MAKE-14PILE ?auto_544036 ?auto_544037 ?auto_544038 ?auto_544039 ?auto_544040 ?auto_544041 ?auto_544042 ?auto_544043 ?auto_544044 ?auto_544045 ?auto_544046 ?auto_544047 ?auto_544048 ?auto_544049 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544094 - BLOCK
      ?auto_544095 - BLOCK
      ?auto_544096 - BLOCK
      ?auto_544097 - BLOCK
      ?auto_544098 - BLOCK
      ?auto_544099 - BLOCK
      ?auto_544100 - BLOCK
      ?auto_544101 - BLOCK
      ?auto_544102 - BLOCK
      ?auto_544103 - BLOCK
      ?auto_544104 - BLOCK
      ?auto_544105 - BLOCK
      ?auto_544106 - BLOCK
      ?auto_544107 - BLOCK
    )
    :vars
    (
      ?auto_544108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544107 ?auto_544108 ) ( ON-TABLE ?auto_544094 ) ( ON ?auto_544095 ?auto_544094 ) ( ON ?auto_544096 ?auto_544095 ) ( ON ?auto_544097 ?auto_544096 ) ( ON ?auto_544098 ?auto_544097 ) ( ON ?auto_544099 ?auto_544098 ) ( not ( = ?auto_544094 ?auto_544095 ) ) ( not ( = ?auto_544094 ?auto_544096 ) ) ( not ( = ?auto_544094 ?auto_544097 ) ) ( not ( = ?auto_544094 ?auto_544098 ) ) ( not ( = ?auto_544094 ?auto_544099 ) ) ( not ( = ?auto_544094 ?auto_544100 ) ) ( not ( = ?auto_544094 ?auto_544101 ) ) ( not ( = ?auto_544094 ?auto_544102 ) ) ( not ( = ?auto_544094 ?auto_544103 ) ) ( not ( = ?auto_544094 ?auto_544104 ) ) ( not ( = ?auto_544094 ?auto_544105 ) ) ( not ( = ?auto_544094 ?auto_544106 ) ) ( not ( = ?auto_544094 ?auto_544107 ) ) ( not ( = ?auto_544094 ?auto_544108 ) ) ( not ( = ?auto_544095 ?auto_544096 ) ) ( not ( = ?auto_544095 ?auto_544097 ) ) ( not ( = ?auto_544095 ?auto_544098 ) ) ( not ( = ?auto_544095 ?auto_544099 ) ) ( not ( = ?auto_544095 ?auto_544100 ) ) ( not ( = ?auto_544095 ?auto_544101 ) ) ( not ( = ?auto_544095 ?auto_544102 ) ) ( not ( = ?auto_544095 ?auto_544103 ) ) ( not ( = ?auto_544095 ?auto_544104 ) ) ( not ( = ?auto_544095 ?auto_544105 ) ) ( not ( = ?auto_544095 ?auto_544106 ) ) ( not ( = ?auto_544095 ?auto_544107 ) ) ( not ( = ?auto_544095 ?auto_544108 ) ) ( not ( = ?auto_544096 ?auto_544097 ) ) ( not ( = ?auto_544096 ?auto_544098 ) ) ( not ( = ?auto_544096 ?auto_544099 ) ) ( not ( = ?auto_544096 ?auto_544100 ) ) ( not ( = ?auto_544096 ?auto_544101 ) ) ( not ( = ?auto_544096 ?auto_544102 ) ) ( not ( = ?auto_544096 ?auto_544103 ) ) ( not ( = ?auto_544096 ?auto_544104 ) ) ( not ( = ?auto_544096 ?auto_544105 ) ) ( not ( = ?auto_544096 ?auto_544106 ) ) ( not ( = ?auto_544096 ?auto_544107 ) ) ( not ( = ?auto_544096 ?auto_544108 ) ) ( not ( = ?auto_544097 ?auto_544098 ) ) ( not ( = ?auto_544097 ?auto_544099 ) ) ( not ( = ?auto_544097 ?auto_544100 ) ) ( not ( = ?auto_544097 ?auto_544101 ) ) ( not ( = ?auto_544097 ?auto_544102 ) ) ( not ( = ?auto_544097 ?auto_544103 ) ) ( not ( = ?auto_544097 ?auto_544104 ) ) ( not ( = ?auto_544097 ?auto_544105 ) ) ( not ( = ?auto_544097 ?auto_544106 ) ) ( not ( = ?auto_544097 ?auto_544107 ) ) ( not ( = ?auto_544097 ?auto_544108 ) ) ( not ( = ?auto_544098 ?auto_544099 ) ) ( not ( = ?auto_544098 ?auto_544100 ) ) ( not ( = ?auto_544098 ?auto_544101 ) ) ( not ( = ?auto_544098 ?auto_544102 ) ) ( not ( = ?auto_544098 ?auto_544103 ) ) ( not ( = ?auto_544098 ?auto_544104 ) ) ( not ( = ?auto_544098 ?auto_544105 ) ) ( not ( = ?auto_544098 ?auto_544106 ) ) ( not ( = ?auto_544098 ?auto_544107 ) ) ( not ( = ?auto_544098 ?auto_544108 ) ) ( not ( = ?auto_544099 ?auto_544100 ) ) ( not ( = ?auto_544099 ?auto_544101 ) ) ( not ( = ?auto_544099 ?auto_544102 ) ) ( not ( = ?auto_544099 ?auto_544103 ) ) ( not ( = ?auto_544099 ?auto_544104 ) ) ( not ( = ?auto_544099 ?auto_544105 ) ) ( not ( = ?auto_544099 ?auto_544106 ) ) ( not ( = ?auto_544099 ?auto_544107 ) ) ( not ( = ?auto_544099 ?auto_544108 ) ) ( not ( = ?auto_544100 ?auto_544101 ) ) ( not ( = ?auto_544100 ?auto_544102 ) ) ( not ( = ?auto_544100 ?auto_544103 ) ) ( not ( = ?auto_544100 ?auto_544104 ) ) ( not ( = ?auto_544100 ?auto_544105 ) ) ( not ( = ?auto_544100 ?auto_544106 ) ) ( not ( = ?auto_544100 ?auto_544107 ) ) ( not ( = ?auto_544100 ?auto_544108 ) ) ( not ( = ?auto_544101 ?auto_544102 ) ) ( not ( = ?auto_544101 ?auto_544103 ) ) ( not ( = ?auto_544101 ?auto_544104 ) ) ( not ( = ?auto_544101 ?auto_544105 ) ) ( not ( = ?auto_544101 ?auto_544106 ) ) ( not ( = ?auto_544101 ?auto_544107 ) ) ( not ( = ?auto_544101 ?auto_544108 ) ) ( not ( = ?auto_544102 ?auto_544103 ) ) ( not ( = ?auto_544102 ?auto_544104 ) ) ( not ( = ?auto_544102 ?auto_544105 ) ) ( not ( = ?auto_544102 ?auto_544106 ) ) ( not ( = ?auto_544102 ?auto_544107 ) ) ( not ( = ?auto_544102 ?auto_544108 ) ) ( not ( = ?auto_544103 ?auto_544104 ) ) ( not ( = ?auto_544103 ?auto_544105 ) ) ( not ( = ?auto_544103 ?auto_544106 ) ) ( not ( = ?auto_544103 ?auto_544107 ) ) ( not ( = ?auto_544103 ?auto_544108 ) ) ( not ( = ?auto_544104 ?auto_544105 ) ) ( not ( = ?auto_544104 ?auto_544106 ) ) ( not ( = ?auto_544104 ?auto_544107 ) ) ( not ( = ?auto_544104 ?auto_544108 ) ) ( not ( = ?auto_544105 ?auto_544106 ) ) ( not ( = ?auto_544105 ?auto_544107 ) ) ( not ( = ?auto_544105 ?auto_544108 ) ) ( not ( = ?auto_544106 ?auto_544107 ) ) ( not ( = ?auto_544106 ?auto_544108 ) ) ( not ( = ?auto_544107 ?auto_544108 ) ) ( ON ?auto_544106 ?auto_544107 ) ( ON ?auto_544105 ?auto_544106 ) ( ON ?auto_544104 ?auto_544105 ) ( ON ?auto_544103 ?auto_544104 ) ( ON ?auto_544102 ?auto_544103 ) ( ON ?auto_544101 ?auto_544102 ) ( CLEAR ?auto_544099 ) ( ON ?auto_544100 ?auto_544101 ) ( CLEAR ?auto_544100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_544094 ?auto_544095 ?auto_544096 ?auto_544097 ?auto_544098 ?auto_544099 ?auto_544100 )
      ( MAKE-14PILE ?auto_544094 ?auto_544095 ?auto_544096 ?auto_544097 ?auto_544098 ?auto_544099 ?auto_544100 ?auto_544101 ?auto_544102 ?auto_544103 ?auto_544104 ?auto_544105 ?auto_544106 ?auto_544107 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544152 - BLOCK
      ?auto_544153 - BLOCK
      ?auto_544154 - BLOCK
      ?auto_544155 - BLOCK
      ?auto_544156 - BLOCK
      ?auto_544157 - BLOCK
      ?auto_544158 - BLOCK
      ?auto_544159 - BLOCK
      ?auto_544160 - BLOCK
      ?auto_544161 - BLOCK
      ?auto_544162 - BLOCK
      ?auto_544163 - BLOCK
      ?auto_544164 - BLOCK
      ?auto_544165 - BLOCK
    )
    :vars
    (
      ?auto_544166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544165 ?auto_544166 ) ( ON-TABLE ?auto_544152 ) ( ON ?auto_544153 ?auto_544152 ) ( ON ?auto_544154 ?auto_544153 ) ( ON ?auto_544155 ?auto_544154 ) ( ON ?auto_544156 ?auto_544155 ) ( not ( = ?auto_544152 ?auto_544153 ) ) ( not ( = ?auto_544152 ?auto_544154 ) ) ( not ( = ?auto_544152 ?auto_544155 ) ) ( not ( = ?auto_544152 ?auto_544156 ) ) ( not ( = ?auto_544152 ?auto_544157 ) ) ( not ( = ?auto_544152 ?auto_544158 ) ) ( not ( = ?auto_544152 ?auto_544159 ) ) ( not ( = ?auto_544152 ?auto_544160 ) ) ( not ( = ?auto_544152 ?auto_544161 ) ) ( not ( = ?auto_544152 ?auto_544162 ) ) ( not ( = ?auto_544152 ?auto_544163 ) ) ( not ( = ?auto_544152 ?auto_544164 ) ) ( not ( = ?auto_544152 ?auto_544165 ) ) ( not ( = ?auto_544152 ?auto_544166 ) ) ( not ( = ?auto_544153 ?auto_544154 ) ) ( not ( = ?auto_544153 ?auto_544155 ) ) ( not ( = ?auto_544153 ?auto_544156 ) ) ( not ( = ?auto_544153 ?auto_544157 ) ) ( not ( = ?auto_544153 ?auto_544158 ) ) ( not ( = ?auto_544153 ?auto_544159 ) ) ( not ( = ?auto_544153 ?auto_544160 ) ) ( not ( = ?auto_544153 ?auto_544161 ) ) ( not ( = ?auto_544153 ?auto_544162 ) ) ( not ( = ?auto_544153 ?auto_544163 ) ) ( not ( = ?auto_544153 ?auto_544164 ) ) ( not ( = ?auto_544153 ?auto_544165 ) ) ( not ( = ?auto_544153 ?auto_544166 ) ) ( not ( = ?auto_544154 ?auto_544155 ) ) ( not ( = ?auto_544154 ?auto_544156 ) ) ( not ( = ?auto_544154 ?auto_544157 ) ) ( not ( = ?auto_544154 ?auto_544158 ) ) ( not ( = ?auto_544154 ?auto_544159 ) ) ( not ( = ?auto_544154 ?auto_544160 ) ) ( not ( = ?auto_544154 ?auto_544161 ) ) ( not ( = ?auto_544154 ?auto_544162 ) ) ( not ( = ?auto_544154 ?auto_544163 ) ) ( not ( = ?auto_544154 ?auto_544164 ) ) ( not ( = ?auto_544154 ?auto_544165 ) ) ( not ( = ?auto_544154 ?auto_544166 ) ) ( not ( = ?auto_544155 ?auto_544156 ) ) ( not ( = ?auto_544155 ?auto_544157 ) ) ( not ( = ?auto_544155 ?auto_544158 ) ) ( not ( = ?auto_544155 ?auto_544159 ) ) ( not ( = ?auto_544155 ?auto_544160 ) ) ( not ( = ?auto_544155 ?auto_544161 ) ) ( not ( = ?auto_544155 ?auto_544162 ) ) ( not ( = ?auto_544155 ?auto_544163 ) ) ( not ( = ?auto_544155 ?auto_544164 ) ) ( not ( = ?auto_544155 ?auto_544165 ) ) ( not ( = ?auto_544155 ?auto_544166 ) ) ( not ( = ?auto_544156 ?auto_544157 ) ) ( not ( = ?auto_544156 ?auto_544158 ) ) ( not ( = ?auto_544156 ?auto_544159 ) ) ( not ( = ?auto_544156 ?auto_544160 ) ) ( not ( = ?auto_544156 ?auto_544161 ) ) ( not ( = ?auto_544156 ?auto_544162 ) ) ( not ( = ?auto_544156 ?auto_544163 ) ) ( not ( = ?auto_544156 ?auto_544164 ) ) ( not ( = ?auto_544156 ?auto_544165 ) ) ( not ( = ?auto_544156 ?auto_544166 ) ) ( not ( = ?auto_544157 ?auto_544158 ) ) ( not ( = ?auto_544157 ?auto_544159 ) ) ( not ( = ?auto_544157 ?auto_544160 ) ) ( not ( = ?auto_544157 ?auto_544161 ) ) ( not ( = ?auto_544157 ?auto_544162 ) ) ( not ( = ?auto_544157 ?auto_544163 ) ) ( not ( = ?auto_544157 ?auto_544164 ) ) ( not ( = ?auto_544157 ?auto_544165 ) ) ( not ( = ?auto_544157 ?auto_544166 ) ) ( not ( = ?auto_544158 ?auto_544159 ) ) ( not ( = ?auto_544158 ?auto_544160 ) ) ( not ( = ?auto_544158 ?auto_544161 ) ) ( not ( = ?auto_544158 ?auto_544162 ) ) ( not ( = ?auto_544158 ?auto_544163 ) ) ( not ( = ?auto_544158 ?auto_544164 ) ) ( not ( = ?auto_544158 ?auto_544165 ) ) ( not ( = ?auto_544158 ?auto_544166 ) ) ( not ( = ?auto_544159 ?auto_544160 ) ) ( not ( = ?auto_544159 ?auto_544161 ) ) ( not ( = ?auto_544159 ?auto_544162 ) ) ( not ( = ?auto_544159 ?auto_544163 ) ) ( not ( = ?auto_544159 ?auto_544164 ) ) ( not ( = ?auto_544159 ?auto_544165 ) ) ( not ( = ?auto_544159 ?auto_544166 ) ) ( not ( = ?auto_544160 ?auto_544161 ) ) ( not ( = ?auto_544160 ?auto_544162 ) ) ( not ( = ?auto_544160 ?auto_544163 ) ) ( not ( = ?auto_544160 ?auto_544164 ) ) ( not ( = ?auto_544160 ?auto_544165 ) ) ( not ( = ?auto_544160 ?auto_544166 ) ) ( not ( = ?auto_544161 ?auto_544162 ) ) ( not ( = ?auto_544161 ?auto_544163 ) ) ( not ( = ?auto_544161 ?auto_544164 ) ) ( not ( = ?auto_544161 ?auto_544165 ) ) ( not ( = ?auto_544161 ?auto_544166 ) ) ( not ( = ?auto_544162 ?auto_544163 ) ) ( not ( = ?auto_544162 ?auto_544164 ) ) ( not ( = ?auto_544162 ?auto_544165 ) ) ( not ( = ?auto_544162 ?auto_544166 ) ) ( not ( = ?auto_544163 ?auto_544164 ) ) ( not ( = ?auto_544163 ?auto_544165 ) ) ( not ( = ?auto_544163 ?auto_544166 ) ) ( not ( = ?auto_544164 ?auto_544165 ) ) ( not ( = ?auto_544164 ?auto_544166 ) ) ( not ( = ?auto_544165 ?auto_544166 ) ) ( ON ?auto_544164 ?auto_544165 ) ( ON ?auto_544163 ?auto_544164 ) ( ON ?auto_544162 ?auto_544163 ) ( ON ?auto_544161 ?auto_544162 ) ( ON ?auto_544160 ?auto_544161 ) ( ON ?auto_544159 ?auto_544160 ) ( ON ?auto_544158 ?auto_544159 ) ( CLEAR ?auto_544156 ) ( ON ?auto_544157 ?auto_544158 ) ( CLEAR ?auto_544157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_544152 ?auto_544153 ?auto_544154 ?auto_544155 ?auto_544156 ?auto_544157 )
      ( MAKE-14PILE ?auto_544152 ?auto_544153 ?auto_544154 ?auto_544155 ?auto_544156 ?auto_544157 ?auto_544158 ?auto_544159 ?auto_544160 ?auto_544161 ?auto_544162 ?auto_544163 ?auto_544164 ?auto_544165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544210 - BLOCK
      ?auto_544211 - BLOCK
      ?auto_544212 - BLOCK
      ?auto_544213 - BLOCK
      ?auto_544214 - BLOCK
      ?auto_544215 - BLOCK
      ?auto_544216 - BLOCK
      ?auto_544217 - BLOCK
      ?auto_544218 - BLOCK
      ?auto_544219 - BLOCK
      ?auto_544220 - BLOCK
      ?auto_544221 - BLOCK
      ?auto_544222 - BLOCK
      ?auto_544223 - BLOCK
    )
    :vars
    (
      ?auto_544224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544223 ?auto_544224 ) ( ON-TABLE ?auto_544210 ) ( ON ?auto_544211 ?auto_544210 ) ( ON ?auto_544212 ?auto_544211 ) ( ON ?auto_544213 ?auto_544212 ) ( not ( = ?auto_544210 ?auto_544211 ) ) ( not ( = ?auto_544210 ?auto_544212 ) ) ( not ( = ?auto_544210 ?auto_544213 ) ) ( not ( = ?auto_544210 ?auto_544214 ) ) ( not ( = ?auto_544210 ?auto_544215 ) ) ( not ( = ?auto_544210 ?auto_544216 ) ) ( not ( = ?auto_544210 ?auto_544217 ) ) ( not ( = ?auto_544210 ?auto_544218 ) ) ( not ( = ?auto_544210 ?auto_544219 ) ) ( not ( = ?auto_544210 ?auto_544220 ) ) ( not ( = ?auto_544210 ?auto_544221 ) ) ( not ( = ?auto_544210 ?auto_544222 ) ) ( not ( = ?auto_544210 ?auto_544223 ) ) ( not ( = ?auto_544210 ?auto_544224 ) ) ( not ( = ?auto_544211 ?auto_544212 ) ) ( not ( = ?auto_544211 ?auto_544213 ) ) ( not ( = ?auto_544211 ?auto_544214 ) ) ( not ( = ?auto_544211 ?auto_544215 ) ) ( not ( = ?auto_544211 ?auto_544216 ) ) ( not ( = ?auto_544211 ?auto_544217 ) ) ( not ( = ?auto_544211 ?auto_544218 ) ) ( not ( = ?auto_544211 ?auto_544219 ) ) ( not ( = ?auto_544211 ?auto_544220 ) ) ( not ( = ?auto_544211 ?auto_544221 ) ) ( not ( = ?auto_544211 ?auto_544222 ) ) ( not ( = ?auto_544211 ?auto_544223 ) ) ( not ( = ?auto_544211 ?auto_544224 ) ) ( not ( = ?auto_544212 ?auto_544213 ) ) ( not ( = ?auto_544212 ?auto_544214 ) ) ( not ( = ?auto_544212 ?auto_544215 ) ) ( not ( = ?auto_544212 ?auto_544216 ) ) ( not ( = ?auto_544212 ?auto_544217 ) ) ( not ( = ?auto_544212 ?auto_544218 ) ) ( not ( = ?auto_544212 ?auto_544219 ) ) ( not ( = ?auto_544212 ?auto_544220 ) ) ( not ( = ?auto_544212 ?auto_544221 ) ) ( not ( = ?auto_544212 ?auto_544222 ) ) ( not ( = ?auto_544212 ?auto_544223 ) ) ( not ( = ?auto_544212 ?auto_544224 ) ) ( not ( = ?auto_544213 ?auto_544214 ) ) ( not ( = ?auto_544213 ?auto_544215 ) ) ( not ( = ?auto_544213 ?auto_544216 ) ) ( not ( = ?auto_544213 ?auto_544217 ) ) ( not ( = ?auto_544213 ?auto_544218 ) ) ( not ( = ?auto_544213 ?auto_544219 ) ) ( not ( = ?auto_544213 ?auto_544220 ) ) ( not ( = ?auto_544213 ?auto_544221 ) ) ( not ( = ?auto_544213 ?auto_544222 ) ) ( not ( = ?auto_544213 ?auto_544223 ) ) ( not ( = ?auto_544213 ?auto_544224 ) ) ( not ( = ?auto_544214 ?auto_544215 ) ) ( not ( = ?auto_544214 ?auto_544216 ) ) ( not ( = ?auto_544214 ?auto_544217 ) ) ( not ( = ?auto_544214 ?auto_544218 ) ) ( not ( = ?auto_544214 ?auto_544219 ) ) ( not ( = ?auto_544214 ?auto_544220 ) ) ( not ( = ?auto_544214 ?auto_544221 ) ) ( not ( = ?auto_544214 ?auto_544222 ) ) ( not ( = ?auto_544214 ?auto_544223 ) ) ( not ( = ?auto_544214 ?auto_544224 ) ) ( not ( = ?auto_544215 ?auto_544216 ) ) ( not ( = ?auto_544215 ?auto_544217 ) ) ( not ( = ?auto_544215 ?auto_544218 ) ) ( not ( = ?auto_544215 ?auto_544219 ) ) ( not ( = ?auto_544215 ?auto_544220 ) ) ( not ( = ?auto_544215 ?auto_544221 ) ) ( not ( = ?auto_544215 ?auto_544222 ) ) ( not ( = ?auto_544215 ?auto_544223 ) ) ( not ( = ?auto_544215 ?auto_544224 ) ) ( not ( = ?auto_544216 ?auto_544217 ) ) ( not ( = ?auto_544216 ?auto_544218 ) ) ( not ( = ?auto_544216 ?auto_544219 ) ) ( not ( = ?auto_544216 ?auto_544220 ) ) ( not ( = ?auto_544216 ?auto_544221 ) ) ( not ( = ?auto_544216 ?auto_544222 ) ) ( not ( = ?auto_544216 ?auto_544223 ) ) ( not ( = ?auto_544216 ?auto_544224 ) ) ( not ( = ?auto_544217 ?auto_544218 ) ) ( not ( = ?auto_544217 ?auto_544219 ) ) ( not ( = ?auto_544217 ?auto_544220 ) ) ( not ( = ?auto_544217 ?auto_544221 ) ) ( not ( = ?auto_544217 ?auto_544222 ) ) ( not ( = ?auto_544217 ?auto_544223 ) ) ( not ( = ?auto_544217 ?auto_544224 ) ) ( not ( = ?auto_544218 ?auto_544219 ) ) ( not ( = ?auto_544218 ?auto_544220 ) ) ( not ( = ?auto_544218 ?auto_544221 ) ) ( not ( = ?auto_544218 ?auto_544222 ) ) ( not ( = ?auto_544218 ?auto_544223 ) ) ( not ( = ?auto_544218 ?auto_544224 ) ) ( not ( = ?auto_544219 ?auto_544220 ) ) ( not ( = ?auto_544219 ?auto_544221 ) ) ( not ( = ?auto_544219 ?auto_544222 ) ) ( not ( = ?auto_544219 ?auto_544223 ) ) ( not ( = ?auto_544219 ?auto_544224 ) ) ( not ( = ?auto_544220 ?auto_544221 ) ) ( not ( = ?auto_544220 ?auto_544222 ) ) ( not ( = ?auto_544220 ?auto_544223 ) ) ( not ( = ?auto_544220 ?auto_544224 ) ) ( not ( = ?auto_544221 ?auto_544222 ) ) ( not ( = ?auto_544221 ?auto_544223 ) ) ( not ( = ?auto_544221 ?auto_544224 ) ) ( not ( = ?auto_544222 ?auto_544223 ) ) ( not ( = ?auto_544222 ?auto_544224 ) ) ( not ( = ?auto_544223 ?auto_544224 ) ) ( ON ?auto_544222 ?auto_544223 ) ( ON ?auto_544221 ?auto_544222 ) ( ON ?auto_544220 ?auto_544221 ) ( ON ?auto_544219 ?auto_544220 ) ( ON ?auto_544218 ?auto_544219 ) ( ON ?auto_544217 ?auto_544218 ) ( ON ?auto_544216 ?auto_544217 ) ( ON ?auto_544215 ?auto_544216 ) ( CLEAR ?auto_544213 ) ( ON ?auto_544214 ?auto_544215 ) ( CLEAR ?auto_544214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_544210 ?auto_544211 ?auto_544212 ?auto_544213 ?auto_544214 )
      ( MAKE-14PILE ?auto_544210 ?auto_544211 ?auto_544212 ?auto_544213 ?auto_544214 ?auto_544215 ?auto_544216 ?auto_544217 ?auto_544218 ?auto_544219 ?auto_544220 ?auto_544221 ?auto_544222 ?auto_544223 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544268 - BLOCK
      ?auto_544269 - BLOCK
      ?auto_544270 - BLOCK
      ?auto_544271 - BLOCK
      ?auto_544272 - BLOCK
      ?auto_544273 - BLOCK
      ?auto_544274 - BLOCK
      ?auto_544275 - BLOCK
      ?auto_544276 - BLOCK
      ?auto_544277 - BLOCK
      ?auto_544278 - BLOCK
      ?auto_544279 - BLOCK
      ?auto_544280 - BLOCK
      ?auto_544281 - BLOCK
    )
    :vars
    (
      ?auto_544282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544281 ?auto_544282 ) ( ON-TABLE ?auto_544268 ) ( ON ?auto_544269 ?auto_544268 ) ( ON ?auto_544270 ?auto_544269 ) ( not ( = ?auto_544268 ?auto_544269 ) ) ( not ( = ?auto_544268 ?auto_544270 ) ) ( not ( = ?auto_544268 ?auto_544271 ) ) ( not ( = ?auto_544268 ?auto_544272 ) ) ( not ( = ?auto_544268 ?auto_544273 ) ) ( not ( = ?auto_544268 ?auto_544274 ) ) ( not ( = ?auto_544268 ?auto_544275 ) ) ( not ( = ?auto_544268 ?auto_544276 ) ) ( not ( = ?auto_544268 ?auto_544277 ) ) ( not ( = ?auto_544268 ?auto_544278 ) ) ( not ( = ?auto_544268 ?auto_544279 ) ) ( not ( = ?auto_544268 ?auto_544280 ) ) ( not ( = ?auto_544268 ?auto_544281 ) ) ( not ( = ?auto_544268 ?auto_544282 ) ) ( not ( = ?auto_544269 ?auto_544270 ) ) ( not ( = ?auto_544269 ?auto_544271 ) ) ( not ( = ?auto_544269 ?auto_544272 ) ) ( not ( = ?auto_544269 ?auto_544273 ) ) ( not ( = ?auto_544269 ?auto_544274 ) ) ( not ( = ?auto_544269 ?auto_544275 ) ) ( not ( = ?auto_544269 ?auto_544276 ) ) ( not ( = ?auto_544269 ?auto_544277 ) ) ( not ( = ?auto_544269 ?auto_544278 ) ) ( not ( = ?auto_544269 ?auto_544279 ) ) ( not ( = ?auto_544269 ?auto_544280 ) ) ( not ( = ?auto_544269 ?auto_544281 ) ) ( not ( = ?auto_544269 ?auto_544282 ) ) ( not ( = ?auto_544270 ?auto_544271 ) ) ( not ( = ?auto_544270 ?auto_544272 ) ) ( not ( = ?auto_544270 ?auto_544273 ) ) ( not ( = ?auto_544270 ?auto_544274 ) ) ( not ( = ?auto_544270 ?auto_544275 ) ) ( not ( = ?auto_544270 ?auto_544276 ) ) ( not ( = ?auto_544270 ?auto_544277 ) ) ( not ( = ?auto_544270 ?auto_544278 ) ) ( not ( = ?auto_544270 ?auto_544279 ) ) ( not ( = ?auto_544270 ?auto_544280 ) ) ( not ( = ?auto_544270 ?auto_544281 ) ) ( not ( = ?auto_544270 ?auto_544282 ) ) ( not ( = ?auto_544271 ?auto_544272 ) ) ( not ( = ?auto_544271 ?auto_544273 ) ) ( not ( = ?auto_544271 ?auto_544274 ) ) ( not ( = ?auto_544271 ?auto_544275 ) ) ( not ( = ?auto_544271 ?auto_544276 ) ) ( not ( = ?auto_544271 ?auto_544277 ) ) ( not ( = ?auto_544271 ?auto_544278 ) ) ( not ( = ?auto_544271 ?auto_544279 ) ) ( not ( = ?auto_544271 ?auto_544280 ) ) ( not ( = ?auto_544271 ?auto_544281 ) ) ( not ( = ?auto_544271 ?auto_544282 ) ) ( not ( = ?auto_544272 ?auto_544273 ) ) ( not ( = ?auto_544272 ?auto_544274 ) ) ( not ( = ?auto_544272 ?auto_544275 ) ) ( not ( = ?auto_544272 ?auto_544276 ) ) ( not ( = ?auto_544272 ?auto_544277 ) ) ( not ( = ?auto_544272 ?auto_544278 ) ) ( not ( = ?auto_544272 ?auto_544279 ) ) ( not ( = ?auto_544272 ?auto_544280 ) ) ( not ( = ?auto_544272 ?auto_544281 ) ) ( not ( = ?auto_544272 ?auto_544282 ) ) ( not ( = ?auto_544273 ?auto_544274 ) ) ( not ( = ?auto_544273 ?auto_544275 ) ) ( not ( = ?auto_544273 ?auto_544276 ) ) ( not ( = ?auto_544273 ?auto_544277 ) ) ( not ( = ?auto_544273 ?auto_544278 ) ) ( not ( = ?auto_544273 ?auto_544279 ) ) ( not ( = ?auto_544273 ?auto_544280 ) ) ( not ( = ?auto_544273 ?auto_544281 ) ) ( not ( = ?auto_544273 ?auto_544282 ) ) ( not ( = ?auto_544274 ?auto_544275 ) ) ( not ( = ?auto_544274 ?auto_544276 ) ) ( not ( = ?auto_544274 ?auto_544277 ) ) ( not ( = ?auto_544274 ?auto_544278 ) ) ( not ( = ?auto_544274 ?auto_544279 ) ) ( not ( = ?auto_544274 ?auto_544280 ) ) ( not ( = ?auto_544274 ?auto_544281 ) ) ( not ( = ?auto_544274 ?auto_544282 ) ) ( not ( = ?auto_544275 ?auto_544276 ) ) ( not ( = ?auto_544275 ?auto_544277 ) ) ( not ( = ?auto_544275 ?auto_544278 ) ) ( not ( = ?auto_544275 ?auto_544279 ) ) ( not ( = ?auto_544275 ?auto_544280 ) ) ( not ( = ?auto_544275 ?auto_544281 ) ) ( not ( = ?auto_544275 ?auto_544282 ) ) ( not ( = ?auto_544276 ?auto_544277 ) ) ( not ( = ?auto_544276 ?auto_544278 ) ) ( not ( = ?auto_544276 ?auto_544279 ) ) ( not ( = ?auto_544276 ?auto_544280 ) ) ( not ( = ?auto_544276 ?auto_544281 ) ) ( not ( = ?auto_544276 ?auto_544282 ) ) ( not ( = ?auto_544277 ?auto_544278 ) ) ( not ( = ?auto_544277 ?auto_544279 ) ) ( not ( = ?auto_544277 ?auto_544280 ) ) ( not ( = ?auto_544277 ?auto_544281 ) ) ( not ( = ?auto_544277 ?auto_544282 ) ) ( not ( = ?auto_544278 ?auto_544279 ) ) ( not ( = ?auto_544278 ?auto_544280 ) ) ( not ( = ?auto_544278 ?auto_544281 ) ) ( not ( = ?auto_544278 ?auto_544282 ) ) ( not ( = ?auto_544279 ?auto_544280 ) ) ( not ( = ?auto_544279 ?auto_544281 ) ) ( not ( = ?auto_544279 ?auto_544282 ) ) ( not ( = ?auto_544280 ?auto_544281 ) ) ( not ( = ?auto_544280 ?auto_544282 ) ) ( not ( = ?auto_544281 ?auto_544282 ) ) ( ON ?auto_544280 ?auto_544281 ) ( ON ?auto_544279 ?auto_544280 ) ( ON ?auto_544278 ?auto_544279 ) ( ON ?auto_544277 ?auto_544278 ) ( ON ?auto_544276 ?auto_544277 ) ( ON ?auto_544275 ?auto_544276 ) ( ON ?auto_544274 ?auto_544275 ) ( ON ?auto_544273 ?auto_544274 ) ( ON ?auto_544272 ?auto_544273 ) ( CLEAR ?auto_544270 ) ( ON ?auto_544271 ?auto_544272 ) ( CLEAR ?auto_544271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_544268 ?auto_544269 ?auto_544270 ?auto_544271 )
      ( MAKE-14PILE ?auto_544268 ?auto_544269 ?auto_544270 ?auto_544271 ?auto_544272 ?auto_544273 ?auto_544274 ?auto_544275 ?auto_544276 ?auto_544277 ?auto_544278 ?auto_544279 ?auto_544280 ?auto_544281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544326 - BLOCK
      ?auto_544327 - BLOCK
      ?auto_544328 - BLOCK
      ?auto_544329 - BLOCK
      ?auto_544330 - BLOCK
      ?auto_544331 - BLOCK
      ?auto_544332 - BLOCK
      ?auto_544333 - BLOCK
      ?auto_544334 - BLOCK
      ?auto_544335 - BLOCK
      ?auto_544336 - BLOCK
      ?auto_544337 - BLOCK
      ?auto_544338 - BLOCK
      ?auto_544339 - BLOCK
    )
    :vars
    (
      ?auto_544340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544339 ?auto_544340 ) ( ON-TABLE ?auto_544326 ) ( ON ?auto_544327 ?auto_544326 ) ( not ( = ?auto_544326 ?auto_544327 ) ) ( not ( = ?auto_544326 ?auto_544328 ) ) ( not ( = ?auto_544326 ?auto_544329 ) ) ( not ( = ?auto_544326 ?auto_544330 ) ) ( not ( = ?auto_544326 ?auto_544331 ) ) ( not ( = ?auto_544326 ?auto_544332 ) ) ( not ( = ?auto_544326 ?auto_544333 ) ) ( not ( = ?auto_544326 ?auto_544334 ) ) ( not ( = ?auto_544326 ?auto_544335 ) ) ( not ( = ?auto_544326 ?auto_544336 ) ) ( not ( = ?auto_544326 ?auto_544337 ) ) ( not ( = ?auto_544326 ?auto_544338 ) ) ( not ( = ?auto_544326 ?auto_544339 ) ) ( not ( = ?auto_544326 ?auto_544340 ) ) ( not ( = ?auto_544327 ?auto_544328 ) ) ( not ( = ?auto_544327 ?auto_544329 ) ) ( not ( = ?auto_544327 ?auto_544330 ) ) ( not ( = ?auto_544327 ?auto_544331 ) ) ( not ( = ?auto_544327 ?auto_544332 ) ) ( not ( = ?auto_544327 ?auto_544333 ) ) ( not ( = ?auto_544327 ?auto_544334 ) ) ( not ( = ?auto_544327 ?auto_544335 ) ) ( not ( = ?auto_544327 ?auto_544336 ) ) ( not ( = ?auto_544327 ?auto_544337 ) ) ( not ( = ?auto_544327 ?auto_544338 ) ) ( not ( = ?auto_544327 ?auto_544339 ) ) ( not ( = ?auto_544327 ?auto_544340 ) ) ( not ( = ?auto_544328 ?auto_544329 ) ) ( not ( = ?auto_544328 ?auto_544330 ) ) ( not ( = ?auto_544328 ?auto_544331 ) ) ( not ( = ?auto_544328 ?auto_544332 ) ) ( not ( = ?auto_544328 ?auto_544333 ) ) ( not ( = ?auto_544328 ?auto_544334 ) ) ( not ( = ?auto_544328 ?auto_544335 ) ) ( not ( = ?auto_544328 ?auto_544336 ) ) ( not ( = ?auto_544328 ?auto_544337 ) ) ( not ( = ?auto_544328 ?auto_544338 ) ) ( not ( = ?auto_544328 ?auto_544339 ) ) ( not ( = ?auto_544328 ?auto_544340 ) ) ( not ( = ?auto_544329 ?auto_544330 ) ) ( not ( = ?auto_544329 ?auto_544331 ) ) ( not ( = ?auto_544329 ?auto_544332 ) ) ( not ( = ?auto_544329 ?auto_544333 ) ) ( not ( = ?auto_544329 ?auto_544334 ) ) ( not ( = ?auto_544329 ?auto_544335 ) ) ( not ( = ?auto_544329 ?auto_544336 ) ) ( not ( = ?auto_544329 ?auto_544337 ) ) ( not ( = ?auto_544329 ?auto_544338 ) ) ( not ( = ?auto_544329 ?auto_544339 ) ) ( not ( = ?auto_544329 ?auto_544340 ) ) ( not ( = ?auto_544330 ?auto_544331 ) ) ( not ( = ?auto_544330 ?auto_544332 ) ) ( not ( = ?auto_544330 ?auto_544333 ) ) ( not ( = ?auto_544330 ?auto_544334 ) ) ( not ( = ?auto_544330 ?auto_544335 ) ) ( not ( = ?auto_544330 ?auto_544336 ) ) ( not ( = ?auto_544330 ?auto_544337 ) ) ( not ( = ?auto_544330 ?auto_544338 ) ) ( not ( = ?auto_544330 ?auto_544339 ) ) ( not ( = ?auto_544330 ?auto_544340 ) ) ( not ( = ?auto_544331 ?auto_544332 ) ) ( not ( = ?auto_544331 ?auto_544333 ) ) ( not ( = ?auto_544331 ?auto_544334 ) ) ( not ( = ?auto_544331 ?auto_544335 ) ) ( not ( = ?auto_544331 ?auto_544336 ) ) ( not ( = ?auto_544331 ?auto_544337 ) ) ( not ( = ?auto_544331 ?auto_544338 ) ) ( not ( = ?auto_544331 ?auto_544339 ) ) ( not ( = ?auto_544331 ?auto_544340 ) ) ( not ( = ?auto_544332 ?auto_544333 ) ) ( not ( = ?auto_544332 ?auto_544334 ) ) ( not ( = ?auto_544332 ?auto_544335 ) ) ( not ( = ?auto_544332 ?auto_544336 ) ) ( not ( = ?auto_544332 ?auto_544337 ) ) ( not ( = ?auto_544332 ?auto_544338 ) ) ( not ( = ?auto_544332 ?auto_544339 ) ) ( not ( = ?auto_544332 ?auto_544340 ) ) ( not ( = ?auto_544333 ?auto_544334 ) ) ( not ( = ?auto_544333 ?auto_544335 ) ) ( not ( = ?auto_544333 ?auto_544336 ) ) ( not ( = ?auto_544333 ?auto_544337 ) ) ( not ( = ?auto_544333 ?auto_544338 ) ) ( not ( = ?auto_544333 ?auto_544339 ) ) ( not ( = ?auto_544333 ?auto_544340 ) ) ( not ( = ?auto_544334 ?auto_544335 ) ) ( not ( = ?auto_544334 ?auto_544336 ) ) ( not ( = ?auto_544334 ?auto_544337 ) ) ( not ( = ?auto_544334 ?auto_544338 ) ) ( not ( = ?auto_544334 ?auto_544339 ) ) ( not ( = ?auto_544334 ?auto_544340 ) ) ( not ( = ?auto_544335 ?auto_544336 ) ) ( not ( = ?auto_544335 ?auto_544337 ) ) ( not ( = ?auto_544335 ?auto_544338 ) ) ( not ( = ?auto_544335 ?auto_544339 ) ) ( not ( = ?auto_544335 ?auto_544340 ) ) ( not ( = ?auto_544336 ?auto_544337 ) ) ( not ( = ?auto_544336 ?auto_544338 ) ) ( not ( = ?auto_544336 ?auto_544339 ) ) ( not ( = ?auto_544336 ?auto_544340 ) ) ( not ( = ?auto_544337 ?auto_544338 ) ) ( not ( = ?auto_544337 ?auto_544339 ) ) ( not ( = ?auto_544337 ?auto_544340 ) ) ( not ( = ?auto_544338 ?auto_544339 ) ) ( not ( = ?auto_544338 ?auto_544340 ) ) ( not ( = ?auto_544339 ?auto_544340 ) ) ( ON ?auto_544338 ?auto_544339 ) ( ON ?auto_544337 ?auto_544338 ) ( ON ?auto_544336 ?auto_544337 ) ( ON ?auto_544335 ?auto_544336 ) ( ON ?auto_544334 ?auto_544335 ) ( ON ?auto_544333 ?auto_544334 ) ( ON ?auto_544332 ?auto_544333 ) ( ON ?auto_544331 ?auto_544332 ) ( ON ?auto_544330 ?auto_544331 ) ( ON ?auto_544329 ?auto_544330 ) ( CLEAR ?auto_544327 ) ( ON ?auto_544328 ?auto_544329 ) ( CLEAR ?auto_544328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_544326 ?auto_544327 ?auto_544328 )
      ( MAKE-14PILE ?auto_544326 ?auto_544327 ?auto_544328 ?auto_544329 ?auto_544330 ?auto_544331 ?auto_544332 ?auto_544333 ?auto_544334 ?auto_544335 ?auto_544336 ?auto_544337 ?auto_544338 ?auto_544339 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544384 - BLOCK
      ?auto_544385 - BLOCK
      ?auto_544386 - BLOCK
      ?auto_544387 - BLOCK
      ?auto_544388 - BLOCK
      ?auto_544389 - BLOCK
      ?auto_544390 - BLOCK
      ?auto_544391 - BLOCK
      ?auto_544392 - BLOCK
      ?auto_544393 - BLOCK
      ?auto_544394 - BLOCK
      ?auto_544395 - BLOCK
      ?auto_544396 - BLOCK
      ?auto_544397 - BLOCK
    )
    :vars
    (
      ?auto_544398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544397 ?auto_544398 ) ( ON-TABLE ?auto_544384 ) ( not ( = ?auto_544384 ?auto_544385 ) ) ( not ( = ?auto_544384 ?auto_544386 ) ) ( not ( = ?auto_544384 ?auto_544387 ) ) ( not ( = ?auto_544384 ?auto_544388 ) ) ( not ( = ?auto_544384 ?auto_544389 ) ) ( not ( = ?auto_544384 ?auto_544390 ) ) ( not ( = ?auto_544384 ?auto_544391 ) ) ( not ( = ?auto_544384 ?auto_544392 ) ) ( not ( = ?auto_544384 ?auto_544393 ) ) ( not ( = ?auto_544384 ?auto_544394 ) ) ( not ( = ?auto_544384 ?auto_544395 ) ) ( not ( = ?auto_544384 ?auto_544396 ) ) ( not ( = ?auto_544384 ?auto_544397 ) ) ( not ( = ?auto_544384 ?auto_544398 ) ) ( not ( = ?auto_544385 ?auto_544386 ) ) ( not ( = ?auto_544385 ?auto_544387 ) ) ( not ( = ?auto_544385 ?auto_544388 ) ) ( not ( = ?auto_544385 ?auto_544389 ) ) ( not ( = ?auto_544385 ?auto_544390 ) ) ( not ( = ?auto_544385 ?auto_544391 ) ) ( not ( = ?auto_544385 ?auto_544392 ) ) ( not ( = ?auto_544385 ?auto_544393 ) ) ( not ( = ?auto_544385 ?auto_544394 ) ) ( not ( = ?auto_544385 ?auto_544395 ) ) ( not ( = ?auto_544385 ?auto_544396 ) ) ( not ( = ?auto_544385 ?auto_544397 ) ) ( not ( = ?auto_544385 ?auto_544398 ) ) ( not ( = ?auto_544386 ?auto_544387 ) ) ( not ( = ?auto_544386 ?auto_544388 ) ) ( not ( = ?auto_544386 ?auto_544389 ) ) ( not ( = ?auto_544386 ?auto_544390 ) ) ( not ( = ?auto_544386 ?auto_544391 ) ) ( not ( = ?auto_544386 ?auto_544392 ) ) ( not ( = ?auto_544386 ?auto_544393 ) ) ( not ( = ?auto_544386 ?auto_544394 ) ) ( not ( = ?auto_544386 ?auto_544395 ) ) ( not ( = ?auto_544386 ?auto_544396 ) ) ( not ( = ?auto_544386 ?auto_544397 ) ) ( not ( = ?auto_544386 ?auto_544398 ) ) ( not ( = ?auto_544387 ?auto_544388 ) ) ( not ( = ?auto_544387 ?auto_544389 ) ) ( not ( = ?auto_544387 ?auto_544390 ) ) ( not ( = ?auto_544387 ?auto_544391 ) ) ( not ( = ?auto_544387 ?auto_544392 ) ) ( not ( = ?auto_544387 ?auto_544393 ) ) ( not ( = ?auto_544387 ?auto_544394 ) ) ( not ( = ?auto_544387 ?auto_544395 ) ) ( not ( = ?auto_544387 ?auto_544396 ) ) ( not ( = ?auto_544387 ?auto_544397 ) ) ( not ( = ?auto_544387 ?auto_544398 ) ) ( not ( = ?auto_544388 ?auto_544389 ) ) ( not ( = ?auto_544388 ?auto_544390 ) ) ( not ( = ?auto_544388 ?auto_544391 ) ) ( not ( = ?auto_544388 ?auto_544392 ) ) ( not ( = ?auto_544388 ?auto_544393 ) ) ( not ( = ?auto_544388 ?auto_544394 ) ) ( not ( = ?auto_544388 ?auto_544395 ) ) ( not ( = ?auto_544388 ?auto_544396 ) ) ( not ( = ?auto_544388 ?auto_544397 ) ) ( not ( = ?auto_544388 ?auto_544398 ) ) ( not ( = ?auto_544389 ?auto_544390 ) ) ( not ( = ?auto_544389 ?auto_544391 ) ) ( not ( = ?auto_544389 ?auto_544392 ) ) ( not ( = ?auto_544389 ?auto_544393 ) ) ( not ( = ?auto_544389 ?auto_544394 ) ) ( not ( = ?auto_544389 ?auto_544395 ) ) ( not ( = ?auto_544389 ?auto_544396 ) ) ( not ( = ?auto_544389 ?auto_544397 ) ) ( not ( = ?auto_544389 ?auto_544398 ) ) ( not ( = ?auto_544390 ?auto_544391 ) ) ( not ( = ?auto_544390 ?auto_544392 ) ) ( not ( = ?auto_544390 ?auto_544393 ) ) ( not ( = ?auto_544390 ?auto_544394 ) ) ( not ( = ?auto_544390 ?auto_544395 ) ) ( not ( = ?auto_544390 ?auto_544396 ) ) ( not ( = ?auto_544390 ?auto_544397 ) ) ( not ( = ?auto_544390 ?auto_544398 ) ) ( not ( = ?auto_544391 ?auto_544392 ) ) ( not ( = ?auto_544391 ?auto_544393 ) ) ( not ( = ?auto_544391 ?auto_544394 ) ) ( not ( = ?auto_544391 ?auto_544395 ) ) ( not ( = ?auto_544391 ?auto_544396 ) ) ( not ( = ?auto_544391 ?auto_544397 ) ) ( not ( = ?auto_544391 ?auto_544398 ) ) ( not ( = ?auto_544392 ?auto_544393 ) ) ( not ( = ?auto_544392 ?auto_544394 ) ) ( not ( = ?auto_544392 ?auto_544395 ) ) ( not ( = ?auto_544392 ?auto_544396 ) ) ( not ( = ?auto_544392 ?auto_544397 ) ) ( not ( = ?auto_544392 ?auto_544398 ) ) ( not ( = ?auto_544393 ?auto_544394 ) ) ( not ( = ?auto_544393 ?auto_544395 ) ) ( not ( = ?auto_544393 ?auto_544396 ) ) ( not ( = ?auto_544393 ?auto_544397 ) ) ( not ( = ?auto_544393 ?auto_544398 ) ) ( not ( = ?auto_544394 ?auto_544395 ) ) ( not ( = ?auto_544394 ?auto_544396 ) ) ( not ( = ?auto_544394 ?auto_544397 ) ) ( not ( = ?auto_544394 ?auto_544398 ) ) ( not ( = ?auto_544395 ?auto_544396 ) ) ( not ( = ?auto_544395 ?auto_544397 ) ) ( not ( = ?auto_544395 ?auto_544398 ) ) ( not ( = ?auto_544396 ?auto_544397 ) ) ( not ( = ?auto_544396 ?auto_544398 ) ) ( not ( = ?auto_544397 ?auto_544398 ) ) ( ON ?auto_544396 ?auto_544397 ) ( ON ?auto_544395 ?auto_544396 ) ( ON ?auto_544394 ?auto_544395 ) ( ON ?auto_544393 ?auto_544394 ) ( ON ?auto_544392 ?auto_544393 ) ( ON ?auto_544391 ?auto_544392 ) ( ON ?auto_544390 ?auto_544391 ) ( ON ?auto_544389 ?auto_544390 ) ( ON ?auto_544388 ?auto_544389 ) ( ON ?auto_544387 ?auto_544388 ) ( ON ?auto_544386 ?auto_544387 ) ( CLEAR ?auto_544384 ) ( ON ?auto_544385 ?auto_544386 ) ( CLEAR ?auto_544385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_544384 ?auto_544385 )
      ( MAKE-14PILE ?auto_544384 ?auto_544385 ?auto_544386 ?auto_544387 ?auto_544388 ?auto_544389 ?auto_544390 ?auto_544391 ?auto_544392 ?auto_544393 ?auto_544394 ?auto_544395 ?auto_544396 ?auto_544397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_544442 - BLOCK
      ?auto_544443 - BLOCK
      ?auto_544444 - BLOCK
      ?auto_544445 - BLOCK
      ?auto_544446 - BLOCK
      ?auto_544447 - BLOCK
      ?auto_544448 - BLOCK
      ?auto_544449 - BLOCK
      ?auto_544450 - BLOCK
      ?auto_544451 - BLOCK
      ?auto_544452 - BLOCK
      ?auto_544453 - BLOCK
      ?auto_544454 - BLOCK
      ?auto_544455 - BLOCK
    )
    :vars
    (
      ?auto_544456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544455 ?auto_544456 ) ( not ( = ?auto_544442 ?auto_544443 ) ) ( not ( = ?auto_544442 ?auto_544444 ) ) ( not ( = ?auto_544442 ?auto_544445 ) ) ( not ( = ?auto_544442 ?auto_544446 ) ) ( not ( = ?auto_544442 ?auto_544447 ) ) ( not ( = ?auto_544442 ?auto_544448 ) ) ( not ( = ?auto_544442 ?auto_544449 ) ) ( not ( = ?auto_544442 ?auto_544450 ) ) ( not ( = ?auto_544442 ?auto_544451 ) ) ( not ( = ?auto_544442 ?auto_544452 ) ) ( not ( = ?auto_544442 ?auto_544453 ) ) ( not ( = ?auto_544442 ?auto_544454 ) ) ( not ( = ?auto_544442 ?auto_544455 ) ) ( not ( = ?auto_544442 ?auto_544456 ) ) ( not ( = ?auto_544443 ?auto_544444 ) ) ( not ( = ?auto_544443 ?auto_544445 ) ) ( not ( = ?auto_544443 ?auto_544446 ) ) ( not ( = ?auto_544443 ?auto_544447 ) ) ( not ( = ?auto_544443 ?auto_544448 ) ) ( not ( = ?auto_544443 ?auto_544449 ) ) ( not ( = ?auto_544443 ?auto_544450 ) ) ( not ( = ?auto_544443 ?auto_544451 ) ) ( not ( = ?auto_544443 ?auto_544452 ) ) ( not ( = ?auto_544443 ?auto_544453 ) ) ( not ( = ?auto_544443 ?auto_544454 ) ) ( not ( = ?auto_544443 ?auto_544455 ) ) ( not ( = ?auto_544443 ?auto_544456 ) ) ( not ( = ?auto_544444 ?auto_544445 ) ) ( not ( = ?auto_544444 ?auto_544446 ) ) ( not ( = ?auto_544444 ?auto_544447 ) ) ( not ( = ?auto_544444 ?auto_544448 ) ) ( not ( = ?auto_544444 ?auto_544449 ) ) ( not ( = ?auto_544444 ?auto_544450 ) ) ( not ( = ?auto_544444 ?auto_544451 ) ) ( not ( = ?auto_544444 ?auto_544452 ) ) ( not ( = ?auto_544444 ?auto_544453 ) ) ( not ( = ?auto_544444 ?auto_544454 ) ) ( not ( = ?auto_544444 ?auto_544455 ) ) ( not ( = ?auto_544444 ?auto_544456 ) ) ( not ( = ?auto_544445 ?auto_544446 ) ) ( not ( = ?auto_544445 ?auto_544447 ) ) ( not ( = ?auto_544445 ?auto_544448 ) ) ( not ( = ?auto_544445 ?auto_544449 ) ) ( not ( = ?auto_544445 ?auto_544450 ) ) ( not ( = ?auto_544445 ?auto_544451 ) ) ( not ( = ?auto_544445 ?auto_544452 ) ) ( not ( = ?auto_544445 ?auto_544453 ) ) ( not ( = ?auto_544445 ?auto_544454 ) ) ( not ( = ?auto_544445 ?auto_544455 ) ) ( not ( = ?auto_544445 ?auto_544456 ) ) ( not ( = ?auto_544446 ?auto_544447 ) ) ( not ( = ?auto_544446 ?auto_544448 ) ) ( not ( = ?auto_544446 ?auto_544449 ) ) ( not ( = ?auto_544446 ?auto_544450 ) ) ( not ( = ?auto_544446 ?auto_544451 ) ) ( not ( = ?auto_544446 ?auto_544452 ) ) ( not ( = ?auto_544446 ?auto_544453 ) ) ( not ( = ?auto_544446 ?auto_544454 ) ) ( not ( = ?auto_544446 ?auto_544455 ) ) ( not ( = ?auto_544446 ?auto_544456 ) ) ( not ( = ?auto_544447 ?auto_544448 ) ) ( not ( = ?auto_544447 ?auto_544449 ) ) ( not ( = ?auto_544447 ?auto_544450 ) ) ( not ( = ?auto_544447 ?auto_544451 ) ) ( not ( = ?auto_544447 ?auto_544452 ) ) ( not ( = ?auto_544447 ?auto_544453 ) ) ( not ( = ?auto_544447 ?auto_544454 ) ) ( not ( = ?auto_544447 ?auto_544455 ) ) ( not ( = ?auto_544447 ?auto_544456 ) ) ( not ( = ?auto_544448 ?auto_544449 ) ) ( not ( = ?auto_544448 ?auto_544450 ) ) ( not ( = ?auto_544448 ?auto_544451 ) ) ( not ( = ?auto_544448 ?auto_544452 ) ) ( not ( = ?auto_544448 ?auto_544453 ) ) ( not ( = ?auto_544448 ?auto_544454 ) ) ( not ( = ?auto_544448 ?auto_544455 ) ) ( not ( = ?auto_544448 ?auto_544456 ) ) ( not ( = ?auto_544449 ?auto_544450 ) ) ( not ( = ?auto_544449 ?auto_544451 ) ) ( not ( = ?auto_544449 ?auto_544452 ) ) ( not ( = ?auto_544449 ?auto_544453 ) ) ( not ( = ?auto_544449 ?auto_544454 ) ) ( not ( = ?auto_544449 ?auto_544455 ) ) ( not ( = ?auto_544449 ?auto_544456 ) ) ( not ( = ?auto_544450 ?auto_544451 ) ) ( not ( = ?auto_544450 ?auto_544452 ) ) ( not ( = ?auto_544450 ?auto_544453 ) ) ( not ( = ?auto_544450 ?auto_544454 ) ) ( not ( = ?auto_544450 ?auto_544455 ) ) ( not ( = ?auto_544450 ?auto_544456 ) ) ( not ( = ?auto_544451 ?auto_544452 ) ) ( not ( = ?auto_544451 ?auto_544453 ) ) ( not ( = ?auto_544451 ?auto_544454 ) ) ( not ( = ?auto_544451 ?auto_544455 ) ) ( not ( = ?auto_544451 ?auto_544456 ) ) ( not ( = ?auto_544452 ?auto_544453 ) ) ( not ( = ?auto_544452 ?auto_544454 ) ) ( not ( = ?auto_544452 ?auto_544455 ) ) ( not ( = ?auto_544452 ?auto_544456 ) ) ( not ( = ?auto_544453 ?auto_544454 ) ) ( not ( = ?auto_544453 ?auto_544455 ) ) ( not ( = ?auto_544453 ?auto_544456 ) ) ( not ( = ?auto_544454 ?auto_544455 ) ) ( not ( = ?auto_544454 ?auto_544456 ) ) ( not ( = ?auto_544455 ?auto_544456 ) ) ( ON ?auto_544454 ?auto_544455 ) ( ON ?auto_544453 ?auto_544454 ) ( ON ?auto_544452 ?auto_544453 ) ( ON ?auto_544451 ?auto_544452 ) ( ON ?auto_544450 ?auto_544451 ) ( ON ?auto_544449 ?auto_544450 ) ( ON ?auto_544448 ?auto_544449 ) ( ON ?auto_544447 ?auto_544448 ) ( ON ?auto_544446 ?auto_544447 ) ( ON ?auto_544445 ?auto_544446 ) ( ON ?auto_544444 ?auto_544445 ) ( ON ?auto_544443 ?auto_544444 ) ( ON ?auto_544442 ?auto_544443 ) ( CLEAR ?auto_544442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_544442 )
      ( MAKE-14PILE ?auto_544442 ?auto_544443 ?auto_544444 ?auto_544445 ?auto_544446 ?auto_544447 ?auto_544448 ?auto_544449 ?auto_544450 ?auto_544451 ?auto_544452 ?auto_544453 ?auto_544454 ?auto_544455 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544501 - BLOCK
      ?auto_544502 - BLOCK
      ?auto_544503 - BLOCK
      ?auto_544504 - BLOCK
      ?auto_544505 - BLOCK
      ?auto_544506 - BLOCK
      ?auto_544507 - BLOCK
      ?auto_544508 - BLOCK
      ?auto_544509 - BLOCK
      ?auto_544510 - BLOCK
      ?auto_544511 - BLOCK
      ?auto_544512 - BLOCK
      ?auto_544513 - BLOCK
      ?auto_544514 - BLOCK
      ?auto_544515 - BLOCK
    )
    :vars
    (
      ?auto_544516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_544514 ) ( ON ?auto_544515 ?auto_544516 ) ( CLEAR ?auto_544515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_544501 ) ( ON ?auto_544502 ?auto_544501 ) ( ON ?auto_544503 ?auto_544502 ) ( ON ?auto_544504 ?auto_544503 ) ( ON ?auto_544505 ?auto_544504 ) ( ON ?auto_544506 ?auto_544505 ) ( ON ?auto_544507 ?auto_544506 ) ( ON ?auto_544508 ?auto_544507 ) ( ON ?auto_544509 ?auto_544508 ) ( ON ?auto_544510 ?auto_544509 ) ( ON ?auto_544511 ?auto_544510 ) ( ON ?auto_544512 ?auto_544511 ) ( ON ?auto_544513 ?auto_544512 ) ( ON ?auto_544514 ?auto_544513 ) ( not ( = ?auto_544501 ?auto_544502 ) ) ( not ( = ?auto_544501 ?auto_544503 ) ) ( not ( = ?auto_544501 ?auto_544504 ) ) ( not ( = ?auto_544501 ?auto_544505 ) ) ( not ( = ?auto_544501 ?auto_544506 ) ) ( not ( = ?auto_544501 ?auto_544507 ) ) ( not ( = ?auto_544501 ?auto_544508 ) ) ( not ( = ?auto_544501 ?auto_544509 ) ) ( not ( = ?auto_544501 ?auto_544510 ) ) ( not ( = ?auto_544501 ?auto_544511 ) ) ( not ( = ?auto_544501 ?auto_544512 ) ) ( not ( = ?auto_544501 ?auto_544513 ) ) ( not ( = ?auto_544501 ?auto_544514 ) ) ( not ( = ?auto_544501 ?auto_544515 ) ) ( not ( = ?auto_544501 ?auto_544516 ) ) ( not ( = ?auto_544502 ?auto_544503 ) ) ( not ( = ?auto_544502 ?auto_544504 ) ) ( not ( = ?auto_544502 ?auto_544505 ) ) ( not ( = ?auto_544502 ?auto_544506 ) ) ( not ( = ?auto_544502 ?auto_544507 ) ) ( not ( = ?auto_544502 ?auto_544508 ) ) ( not ( = ?auto_544502 ?auto_544509 ) ) ( not ( = ?auto_544502 ?auto_544510 ) ) ( not ( = ?auto_544502 ?auto_544511 ) ) ( not ( = ?auto_544502 ?auto_544512 ) ) ( not ( = ?auto_544502 ?auto_544513 ) ) ( not ( = ?auto_544502 ?auto_544514 ) ) ( not ( = ?auto_544502 ?auto_544515 ) ) ( not ( = ?auto_544502 ?auto_544516 ) ) ( not ( = ?auto_544503 ?auto_544504 ) ) ( not ( = ?auto_544503 ?auto_544505 ) ) ( not ( = ?auto_544503 ?auto_544506 ) ) ( not ( = ?auto_544503 ?auto_544507 ) ) ( not ( = ?auto_544503 ?auto_544508 ) ) ( not ( = ?auto_544503 ?auto_544509 ) ) ( not ( = ?auto_544503 ?auto_544510 ) ) ( not ( = ?auto_544503 ?auto_544511 ) ) ( not ( = ?auto_544503 ?auto_544512 ) ) ( not ( = ?auto_544503 ?auto_544513 ) ) ( not ( = ?auto_544503 ?auto_544514 ) ) ( not ( = ?auto_544503 ?auto_544515 ) ) ( not ( = ?auto_544503 ?auto_544516 ) ) ( not ( = ?auto_544504 ?auto_544505 ) ) ( not ( = ?auto_544504 ?auto_544506 ) ) ( not ( = ?auto_544504 ?auto_544507 ) ) ( not ( = ?auto_544504 ?auto_544508 ) ) ( not ( = ?auto_544504 ?auto_544509 ) ) ( not ( = ?auto_544504 ?auto_544510 ) ) ( not ( = ?auto_544504 ?auto_544511 ) ) ( not ( = ?auto_544504 ?auto_544512 ) ) ( not ( = ?auto_544504 ?auto_544513 ) ) ( not ( = ?auto_544504 ?auto_544514 ) ) ( not ( = ?auto_544504 ?auto_544515 ) ) ( not ( = ?auto_544504 ?auto_544516 ) ) ( not ( = ?auto_544505 ?auto_544506 ) ) ( not ( = ?auto_544505 ?auto_544507 ) ) ( not ( = ?auto_544505 ?auto_544508 ) ) ( not ( = ?auto_544505 ?auto_544509 ) ) ( not ( = ?auto_544505 ?auto_544510 ) ) ( not ( = ?auto_544505 ?auto_544511 ) ) ( not ( = ?auto_544505 ?auto_544512 ) ) ( not ( = ?auto_544505 ?auto_544513 ) ) ( not ( = ?auto_544505 ?auto_544514 ) ) ( not ( = ?auto_544505 ?auto_544515 ) ) ( not ( = ?auto_544505 ?auto_544516 ) ) ( not ( = ?auto_544506 ?auto_544507 ) ) ( not ( = ?auto_544506 ?auto_544508 ) ) ( not ( = ?auto_544506 ?auto_544509 ) ) ( not ( = ?auto_544506 ?auto_544510 ) ) ( not ( = ?auto_544506 ?auto_544511 ) ) ( not ( = ?auto_544506 ?auto_544512 ) ) ( not ( = ?auto_544506 ?auto_544513 ) ) ( not ( = ?auto_544506 ?auto_544514 ) ) ( not ( = ?auto_544506 ?auto_544515 ) ) ( not ( = ?auto_544506 ?auto_544516 ) ) ( not ( = ?auto_544507 ?auto_544508 ) ) ( not ( = ?auto_544507 ?auto_544509 ) ) ( not ( = ?auto_544507 ?auto_544510 ) ) ( not ( = ?auto_544507 ?auto_544511 ) ) ( not ( = ?auto_544507 ?auto_544512 ) ) ( not ( = ?auto_544507 ?auto_544513 ) ) ( not ( = ?auto_544507 ?auto_544514 ) ) ( not ( = ?auto_544507 ?auto_544515 ) ) ( not ( = ?auto_544507 ?auto_544516 ) ) ( not ( = ?auto_544508 ?auto_544509 ) ) ( not ( = ?auto_544508 ?auto_544510 ) ) ( not ( = ?auto_544508 ?auto_544511 ) ) ( not ( = ?auto_544508 ?auto_544512 ) ) ( not ( = ?auto_544508 ?auto_544513 ) ) ( not ( = ?auto_544508 ?auto_544514 ) ) ( not ( = ?auto_544508 ?auto_544515 ) ) ( not ( = ?auto_544508 ?auto_544516 ) ) ( not ( = ?auto_544509 ?auto_544510 ) ) ( not ( = ?auto_544509 ?auto_544511 ) ) ( not ( = ?auto_544509 ?auto_544512 ) ) ( not ( = ?auto_544509 ?auto_544513 ) ) ( not ( = ?auto_544509 ?auto_544514 ) ) ( not ( = ?auto_544509 ?auto_544515 ) ) ( not ( = ?auto_544509 ?auto_544516 ) ) ( not ( = ?auto_544510 ?auto_544511 ) ) ( not ( = ?auto_544510 ?auto_544512 ) ) ( not ( = ?auto_544510 ?auto_544513 ) ) ( not ( = ?auto_544510 ?auto_544514 ) ) ( not ( = ?auto_544510 ?auto_544515 ) ) ( not ( = ?auto_544510 ?auto_544516 ) ) ( not ( = ?auto_544511 ?auto_544512 ) ) ( not ( = ?auto_544511 ?auto_544513 ) ) ( not ( = ?auto_544511 ?auto_544514 ) ) ( not ( = ?auto_544511 ?auto_544515 ) ) ( not ( = ?auto_544511 ?auto_544516 ) ) ( not ( = ?auto_544512 ?auto_544513 ) ) ( not ( = ?auto_544512 ?auto_544514 ) ) ( not ( = ?auto_544512 ?auto_544515 ) ) ( not ( = ?auto_544512 ?auto_544516 ) ) ( not ( = ?auto_544513 ?auto_544514 ) ) ( not ( = ?auto_544513 ?auto_544515 ) ) ( not ( = ?auto_544513 ?auto_544516 ) ) ( not ( = ?auto_544514 ?auto_544515 ) ) ( not ( = ?auto_544514 ?auto_544516 ) ) ( not ( = ?auto_544515 ?auto_544516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_544515 ?auto_544516 )
      ( !STACK ?auto_544515 ?auto_544514 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544563 - BLOCK
      ?auto_544564 - BLOCK
      ?auto_544565 - BLOCK
      ?auto_544566 - BLOCK
      ?auto_544567 - BLOCK
      ?auto_544568 - BLOCK
      ?auto_544569 - BLOCK
      ?auto_544570 - BLOCK
      ?auto_544571 - BLOCK
      ?auto_544572 - BLOCK
      ?auto_544573 - BLOCK
      ?auto_544574 - BLOCK
      ?auto_544575 - BLOCK
      ?auto_544576 - BLOCK
      ?auto_544577 - BLOCK
    )
    :vars
    (
      ?auto_544578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544577 ?auto_544578 ) ( ON-TABLE ?auto_544563 ) ( ON ?auto_544564 ?auto_544563 ) ( ON ?auto_544565 ?auto_544564 ) ( ON ?auto_544566 ?auto_544565 ) ( ON ?auto_544567 ?auto_544566 ) ( ON ?auto_544568 ?auto_544567 ) ( ON ?auto_544569 ?auto_544568 ) ( ON ?auto_544570 ?auto_544569 ) ( ON ?auto_544571 ?auto_544570 ) ( ON ?auto_544572 ?auto_544571 ) ( ON ?auto_544573 ?auto_544572 ) ( ON ?auto_544574 ?auto_544573 ) ( ON ?auto_544575 ?auto_544574 ) ( not ( = ?auto_544563 ?auto_544564 ) ) ( not ( = ?auto_544563 ?auto_544565 ) ) ( not ( = ?auto_544563 ?auto_544566 ) ) ( not ( = ?auto_544563 ?auto_544567 ) ) ( not ( = ?auto_544563 ?auto_544568 ) ) ( not ( = ?auto_544563 ?auto_544569 ) ) ( not ( = ?auto_544563 ?auto_544570 ) ) ( not ( = ?auto_544563 ?auto_544571 ) ) ( not ( = ?auto_544563 ?auto_544572 ) ) ( not ( = ?auto_544563 ?auto_544573 ) ) ( not ( = ?auto_544563 ?auto_544574 ) ) ( not ( = ?auto_544563 ?auto_544575 ) ) ( not ( = ?auto_544563 ?auto_544576 ) ) ( not ( = ?auto_544563 ?auto_544577 ) ) ( not ( = ?auto_544563 ?auto_544578 ) ) ( not ( = ?auto_544564 ?auto_544565 ) ) ( not ( = ?auto_544564 ?auto_544566 ) ) ( not ( = ?auto_544564 ?auto_544567 ) ) ( not ( = ?auto_544564 ?auto_544568 ) ) ( not ( = ?auto_544564 ?auto_544569 ) ) ( not ( = ?auto_544564 ?auto_544570 ) ) ( not ( = ?auto_544564 ?auto_544571 ) ) ( not ( = ?auto_544564 ?auto_544572 ) ) ( not ( = ?auto_544564 ?auto_544573 ) ) ( not ( = ?auto_544564 ?auto_544574 ) ) ( not ( = ?auto_544564 ?auto_544575 ) ) ( not ( = ?auto_544564 ?auto_544576 ) ) ( not ( = ?auto_544564 ?auto_544577 ) ) ( not ( = ?auto_544564 ?auto_544578 ) ) ( not ( = ?auto_544565 ?auto_544566 ) ) ( not ( = ?auto_544565 ?auto_544567 ) ) ( not ( = ?auto_544565 ?auto_544568 ) ) ( not ( = ?auto_544565 ?auto_544569 ) ) ( not ( = ?auto_544565 ?auto_544570 ) ) ( not ( = ?auto_544565 ?auto_544571 ) ) ( not ( = ?auto_544565 ?auto_544572 ) ) ( not ( = ?auto_544565 ?auto_544573 ) ) ( not ( = ?auto_544565 ?auto_544574 ) ) ( not ( = ?auto_544565 ?auto_544575 ) ) ( not ( = ?auto_544565 ?auto_544576 ) ) ( not ( = ?auto_544565 ?auto_544577 ) ) ( not ( = ?auto_544565 ?auto_544578 ) ) ( not ( = ?auto_544566 ?auto_544567 ) ) ( not ( = ?auto_544566 ?auto_544568 ) ) ( not ( = ?auto_544566 ?auto_544569 ) ) ( not ( = ?auto_544566 ?auto_544570 ) ) ( not ( = ?auto_544566 ?auto_544571 ) ) ( not ( = ?auto_544566 ?auto_544572 ) ) ( not ( = ?auto_544566 ?auto_544573 ) ) ( not ( = ?auto_544566 ?auto_544574 ) ) ( not ( = ?auto_544566 ?auto_544575 ) ) ( not ( = ?auto_544566 ?auto_544576 ) ) ( not ( = ?auto_544566 ?auto_544577 ) ) ( not ( = ?auto_544566 ?auto_544578 ) ) ( not ( = ?auto_544567 ?auto_544568 ) ) ( not ( = ?auto_544567 ?auto_544569 ) ) ( not ( = ?auto_544567 ?auto_544570 ) ) ( not ( = ?auto_544567 ?auto_544571 ) ) ( not ( = ?auto_544567 ?auto_544572 ) ) ( not ( = ?auto_544567 ?auto_544573 ) ) ( not ( = ?auto_544567 ?auto_544574 ) ) ( not ( = ?auto_544567 ?auto_544575 ) ) ( not ( = ?auto_544567 ?auto_544576 ) ) ( not ( = ?auto_544567 ?auto_544577 ) ) ( not ( = ?auto_544567 ?auto_544578 ) ) ( not ( = ?auto_544568 ?auto_544569 ) ) ( not ( = ?auto_544568 ?auto_544570 ) ) ( not ( = ?auto_544568 ?auto_544571 ) ) ( not ( = ?auto_544568 ?auto_544572 ) ) ( not ( = ?auto_544568 ?auto_544573 ) ) ( not ( = ?auto_544568 ?auto_544574 ) ) ( not ( = ?auto_544568 ?auto_544575 ) ) ( not ( = ?auto_544568 ?auto_544576 ) ) ( not ( = ?auto_544568 ?auto_544577 ) ) ( not ( = ?auto_544568 ?auto_544578 ) ) ( not ( = ?auto_544569 ?auto_544570 ) ) ( not ( = ?auto_544569 ?auto_544571 ) ) ( not ( = ?auto_544569 ?auto_544572 ) ) ( not ( = ?auto_544569 ?auto_544573 ) ) ( not ( = ?auto_544569 ?auto_544574 ) ) ( not ( = ?auto_544569 ?auto_544575 ) ) ( not ( = ?auto_544569 ?auto_544576 ) ) ( not ( = ?auto_544569 ?auto_544577 ) ) ( not ( = ?auto_544569 ?auto_544578 ) ) ( not ( = ?auto_544570 ?auto_544571 ) ) ( not ( = ?auto_544570 ?auto_544572 ) ) ( not ( = ?auto_544570 ?auto_544573 ) ) ( not ( = ?auto_544570 ?auto_544574 ) ) ( not ( = ?auto_544570 ?auto_544575 ) ) ( not ( = ?auto_544570 ?auto_544576 ) ) ( not ( = ?auto_544570 ?auto_544577 ) ) ( not ( = ?auto_544570 ?auto_544578 ) ) ( not ( = ?auto_544571 ?auto_544572 ) ) ( not ( = ?auto_544571 ?auto_544573 ) ) ( not ( = ?auto_544571 ?auto_544574 ) ) ( not ( = ?auto_544571 ?auto_544575 ) ) ( not ( = ?auto_544571 ?auto_544576 ) ) ( not ( = ?auto_544571 ?auto_544577 ) ) ( not ( = ?auto_544571 ?auto_544578 ) ) ( not ( = ?auto_544572 ?auto_544573 ) ) ( not ( = ?auto_544572 ?auto_544574 ) ) ( not ( = ?auto_544572 ?auto_544575 ) ) ( not ( = ?auto_544572 ?auto_544576 ) ) ( not ( = ?auto_544572 ?auto_544577 ) ) ( not ( = ?auto_544572 ?auto_544578 ) ) ( not ( = ?auto_544573 ?auto_544574 ) ) ( not ( = ?auto_544573 ?auto_544575 ) ) ( not ( = ?auto_544573 ?auto_544576 ) ) ( not ( = ?auto_544573 ?auto_544577 ) ) ( not ( = ?auto_544573 ?auto_544578 ) ) ( not ( = ?auto_544574 ?auto_544575 ) ) ( not ( = ?auto_544574 ?auto_544576 ) ) ( not ( = ?auto_544574 ?auto_544577 ) ) ( not ( = ?auto_544574 ?auto_544578 ) ) ( not ( = ?auto_544575 ?auto_544576 ) ) ( not ( = ?auto_544575 ?auto_544577 ) ) ( not ( = ?auto_544575 ?auto_544578 ) ) ( not ( = ?auto_544576 ?auto_544577 ) ) ( not ( = ?auto_544576 ?auto_544578 ) ) ( not ( = ?auto_544577 ?auto_544578 ) ) ( CLEAR ?auto_544575 ) ( ON ?auto_544576 ?auto_544577 ) ( CLEAR ?auto_544576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_544563 ?auto_544564 ?auto_544565 ?auto_544566 ?auto_544567 ?auto_544568 ?auto_544569 ?auto_544570 ?auto_544571 ?auto_544572 ?auto_544573 ?auto_544574 ?auto_544575 ?auto_544576 )
      ( MAKE-15PILE ?auto_544563 ?auto_544564 ?auto_544565 ?auto_544566 ?auto_544567 ?auto_544568 ?auto_544569 ?auto_544570 ?auto_544571 ?auto_544572 ?auto_544573 ?auto_544574 ?auto_544575 ?auto_544576 ?auto_544577 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544625 - BLOCK
      ?auto_544626 - BLOCK
      ?auto_544627 - BLOCK
      ?auto_544628 - BLOCK
      ?auto_544629 - BLOCK
      ?auto_544630 - BLOCK
      ?auto_544631 - BLOCK
      ?auto_544632 - BLOCK
      ?auto_544633 - BLOCK
      ?auto_544634 - BLOCK
      ?auto_544635 - BLOCK
      ?auto_544636 - BLOCK
      ?auto_544637 - BLOCK
      ?auto_544638 - BLOCK
      ?auto_544639 - BLOCK
    )
    :vars
    (
      ?auto_544640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544639 ?auto_544640 ) ( ON-TABLE ?auto_544625 ) ( ON ?auto_544626 ?auto_544625 ) ( ON ?auto_544627 ?auto_544626 ) ( ON ?auto_544628 ?auto_544627 ) ( ON ?auto_544629 ?auto_544628 ) ( ON ?auto_544630 ?auto_544629 ) ( ON ?auto_544631 ?auto_544630 ) ( ON ?auto_544632 ?auto_544631 ) ( ON ?auto_544633 ?auto_544632 ) ( ON ?auto_544634 ?auto_544633 ) ( ON ?auto_544635 ?auto_544634 ) ( ON ?auto_544636 ?auto_544635 ) ( not ( = ?auto_544625 ?auto_544626 ) ) ( not ( = ?auto_544625 ?auto_544627 ) ) ( not ( = ?auto_544625 ?auto_544628 ) ) ( not ( = ?auto_544625 ?auto_544629 ) ) ( not ( = ?auto_544625 ?auto_544630 ) ) ( not ( = ?auto_544625 ?auto_544631 ) ) ( not ( = ?auto_544625 ?auto_544632 ) ) ( not ( = ?auto_544625 ?auto_544633 ) ) ( not ( = ?auto_544625 ?auto_544634 ) ) ( not ( = ?auto_544625 ?auto_544635 ) ) ( not ( = ?auto_544625 ?auto_544636 ) ) ( not ( = ?auto_544625 ?auto_544637 ) ) ( not ( = ?auto_544625 ?auto_544638 ) ) ( not ( = ?auto_544625 ?auto_544639 ) ) ( not ( = ?auto_544625 ?auto_544640 ) ) ( not ( = ?auto_544626 ?auto_544627 ) ) ( not ( = ?auto_544626 ?auto_544628 ) ) ( not ( = ?auto_544626 ?auto_544629 ) ) ( not ( = ?auto_544626 ?auto_544630 ) ) ( not ( = ?auto_544626 ?auto_544631 ) ) ( not ( = ?auto_544626 ?auto_544632 ) ) ( not ( = ?auto_544626 ?auto_544633 ) ) ( not ( = ?auto_544626 ?auto_544634 ) ) ( not ( = ?auto_544626 ?auto_544635 ) ) ( not ( = ?auto_544626 ?auto_544636 ) ) ( not ( = ?auto_544626 ?auto_544637 ) ) ( not ( = ?auto_544626 ?auto_544638 ) ) ( not ( = ?auto_544626 ?auto_544639 ) ) ( not ( = ?auto_544626 ?auto_544640 ) ) ( not ( = ?auto_544627 ?auto_544628 ) ) ( not ( = ?auto_544627 ?auto_544629 ) ) ( not ( = ?auto_544627 ?auto_544630 ) ) ( not ( = ?auto_544627 ?auto_544631 ) ) ( not ( = ?auto_544627 ?auto_544632 ) ) ( not ( = ?auto_544627 ?auto_544633 ) ) ( not ( = ?auto_544627 ?auto_544634 ) ) ( not ( = ?auto_544627 ?auto_544635 ) ) ( not ( = ?auto_544627 ?auto_544636 ) ) ( not ( = ?auto_544627 ?auto_544637 ) ) ( not ( = ?auto_544627 ?auto_544638 ) ) ( not ( = ?auto_544627 ?auto_544639 ) ) ( not ( = ?auto_544627 ?auto_544640 ) ) ( not ( = ?auto_544628 ?auto_544629 ) ) ( not ( = ?auto_544628 ?auto_544630 ) ) ( not ( = ?auto_544628 ?auto_544631 ) ) ( not ( = ?auto_544628 ?auto_544632 ) ) ( not ( = ?auto_544628 ?auto_544633 ) ) ( not ( = ?auto_544628 ?auto_544634 ) ) ( not ( = ?auto_544628 ?auto_544635 ) ) ( not ( = ?auto_544628 ?auto_544636 ) ) ( not ( = ?auto_544628 ?auto_544637 ) ) ( not ( = ?auto_544628 ?auto_544638 ) ) ( not ( = ?auto_544628 ?auto_544639 ) ) ( not ( = ?auto_544628 ?auto_544640 ) ) ( not ( = ?auto_544629 ?auto_544630 ) ) ( not ( = ?auto_544629 ?auto_544631 ) ) ( not ( = ?auto_544629 ?auto_544632 ) ) ( not ( = ?auto_544629 ?auto_544633 ) ) ( not ( = ?auto_544629 ?auto_544634 ) ) ( not ( = ?auto_544629 ?auto_544635 ) ) ( not ( = ?auto_544629 ?auto_544636 ) ) ( not ( = ?auto_544629 ?auto_544637 ) ) ( not ( = ?auto_544629 ?auto_544638 ) ) ( not ( = ?auto_544629 ?auto_544639 ) ) ( not ( = ?auto_544629 ?auto_544640 ) ) ( not ( = ?auto_544630 ?auto_544631 ) ) ( not ( = ?auto_544630 ?auto_544632 ) ) ( not ( = ?auto_544630 ?auto_544633 ) ) ( not ( = ?auto_544630 ?auto_544634 ) ) ( not ( = ?auto_544630 ?auto_544635 ) ) ( not ( = ?auto_544630 ?auto_544636 ) ) ( not ( = ?auto_544630 ?auto_544637 ) ) ( not ( = ?auto_544630 ?auto_544638 ) ) ( not ( = ?auto_544630 ?auto_544639 ) ) ( not ( = ?auto_544630 ?auto_544640 ) ) ( not ( = ?auto_544631 ?auto_544632 ) ) ( not ( = ?auto_544631 ?auto_544633 ) ) ( not ( = ?auto_544631 ?auto_544634 ) ) ( not ( = ?auto_544631 ?auto_544635 ) ) ( not ( = ?auto_544631 ?auto_544636 ) ) ( not ( = ?auto_544631 ?auto_544637 ) ) ( not ( = ?auto_544631 ?auto_544638 ) ) ( not ( = ?auto_544631 ?auto_544639 ) ) ( not ( = ?auto_544631 ?auto_544640 ) ) ( not ( = ?auto_544632 ?auto_544633 ) ) ( not ( = ?auto_544632 ?auto_544634 ) ) ( not ( = ?auto_544632 ?auto_544635 ) ) ( not ( = ?auto_544632 ?auto_544636 ) ) ( not ( = ?auto_544632 ?auto_544637 ) ) ( not ( = ?auto_544632 ?auto_544638 ) ) ( not ( = ?auto_544632 ?auto_544639 ) ) ( not ( = ?auto_544632 ?auto_544640 ) ) ( not ( = ?auto_544633 ?auto_544634 ) ) ( not ( = ?auto_544633 ?auto_544635 ) ) ( not ( = ?auto_544633 ?auto_544636 ) ) ( not ( = ?auto_544633 ?auto_544637 ) ) ( not ( = ?auto_544633 ?auto_544638 ) ) ( not ( = ?auto_544633 ?auto_544639 ) ) ( not ( = ?auto_544633 ?auto_544640 ) ) ( not ( = ?auto_544634 ?auto_544635 ) ) ( not ( = ?auto_544634 ?auto_544636 ) ) ( not ( = ?auto_544634 ?auto_544637 ) ) ( not ( = ?auto_544634 ?auto_544638 ) ) ( not ( = ?auto_544634 ?auto_544639 ) ) ( not ( = ?auto_544634 ?auto_544640 ) ) ( not ( = ?auto_544635 ?auto_544636 ) ) ( not ( = ?auto_544635 ?auto_544637 ) ) ( not ( = ?auto_544635 ?auto_544638 ) ) ( not ( = ?auto_544635 ?auto_544639 ) ) ( not ( = ?auto_544635 ?auto_544640 ) ) ( not ( = ?auto_544636 ?auto_544637 ) ) ( not ( = ?auto_544636 ?auto_544638 ) ) ( not ( = ?auto_544636 ?auto_544639 ) ) ( not ( = ?auto_544636 ?auto_544640 ) ) ( not ( = ?auto_544637 ?auto_544638 ) ) ( not ( = ?auto_544637 ?auto_544639 ) ) ( not ( = ?auto_544637 ?auto_544640 ) ) ( not ( = ?auto_544638 ?auto_544639 ) ) ( not ( = ?auto_544638 ?auto_544640 ) ) ( not ( = ?auto_544639 ?auto_544640 ) ) ( ON ?auto_544638 ?auto_544639 ) ( CLEAR ?auto_544636 ) ( ON ?auto_544637 ?auto_544638 ) ( CLEAR ?auto_544637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_544625 ?auto_544626 ?auto_544627 ?auto_544628 ?auto_544629 ?auto_544630 ?auto_544631 ?auto_544632 ?auto_544633 ?auto_544634 ?auto_544635 ?auto_544636 ?auto_544637 )
      ( MAKE-15PILE ?auto_544625 ?auto_544626 ?auto_544627 ?auto_544628 ?auto_544629 ?auto_544630 ?auto_544631 ?auto_544632 ?auto_544633 ?auto_544634 ?auto_544635 ?auto_544636 ?auto_544637 ?auto_544638 ?auto_544639 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544687 - BLOCK
      ?auto_544688 - BLOCK
      ?auto_544689 - BLOCK
      ?auto_544690 - BLOCK
      ?auto_544691 - BLOCK
      ?auto_544692 - BLOCK
      ?auto_544693 - BLOCK
      ?auto_544694 - BLOCK
      ?auto_544695 - BLOCK
      ?auto_544696 - BLOCK
      ?auto_544697 - BLOCK
      ?auto_544698 - BLOCK
      ?auto_544699 - BLOCK
      ?auto_544700 - BLOCK
      ?auto_544701 - BLOCK
    )
    :vars
    (
      ?auto_544702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544701 ?auto_544702 ) ( ON-TABLE ?auto_544687 ) ( ON ?auto_544688 ?auto_544687 ) ( ON ?auto_544689 ?auto_544688 ) ( ON ?auto_544690 ?auto_544689 ) ( ON ?auto_544691 ?auto_544690 ) ( ON ?auto_544692 ?auto_544691 ) ( ON ?auto_544693 ?auto_544692 ) ( ON ?auto_544694 ?auto_544693 ) ( ON ?auto_544695 ?auto_544694 ) ( ON ?auto_544696 ?auto_544695 ) ( ON ?auto_544697 ?auto_544696 ) ( not ( = ?auto_544687 ?auto_544688 ) ) ( not ( = ?auto_544687 ?auto_544689 ) ) ( not ( = ?auto_544687 ?auto_544690 ) ) ( not ( = ?auto_544687 ?auto_544691 ) ) ( not ( = ?auto_544687 ?auto_544692 ) ) ( not ( = ?auto_544687 ?auto_544693 ) ) ( not ( = ?auto_544687 ?auto_544694 ) ) ( not ( = ?auto_544687 ?auto_544695 ) ) ( not ( = ?auto_544687 ?auto_544696 ) ) ( not ( = ?auto_544687 ?auto_544697 ) ) ( not ( = ?auto_544687 ?auto_544698 ) ) ( not ( = ?auto_544687 ?auto_544699 ) ) ( not ( = ?auto_544687 ?auto_544700 ) ) ( not ( = ?auto_544687 ?auto_544701 ) ) ( not ( = ?auto_544687 ?auto_544702 ) ) ( not ( = ?auto_544688 ?auto_544689 ) ) ( not ( = ?auto_544688 ?auto_544690 ) ) ( not ( = ?auto_544688 ?auto_544691 ) ) ( not ( = ?auto_544688 ?auto_544692 ) ) ( not ( = ?auto_544688 ?auto_544693 ) ) ( not ( = ?auto_544688 ?auto_544694 ) ) ( not ( = ?auto_544688 ?auto_544695 ) ) ( not ( = ?auto_544688 ?auto_544696 ) ) ( not ( = ?auto_544688 ?auto_544697 ) ) ( not ( = ?auto_544688 ?auto_544698 ) ) ( not ( = ?auto_544688 ?auto_544699 ) ) ( not ( = ?auto_544688 ?auto_544700 ) ) ( not ( = ?auto_544688 ?auto_544701 ) ) ( not ( = ?auto_544688 ?auto_544702 ) ) ( not ( = ?auto_544689 ?auto_544690 ) ) ( not ( = ?auto_544689 ?auto_544691 ) ) ( not ( = ?auto_544689 ?auto_544692 ) ) ( not ( = ?auto_544689 ?auto_544693 ) ) ( not ( = ?auto_544689 ?auto_544694 ) ) ( not ( = ?auto_544689 ?auto_544695 ) ) ( not ( = ?auto_544689 ?auto_544696 ) ) ( not ( = ?auto_544689 ?auto_544697 ) ) ( not ( = ?auto_544689 ?auto_544698 ) ) ( not ( = ?auto_544689 ?auto_544699 ) ) ( not ( = ?auto_544689 ?auto_544700 ) ) ( not ( = ?auto_544689 ?auto_544701 ) ) ( not ( = ?auto_544689 ?auto_544702 ) ) ( not ( = ?auto_544690 ?auto_544691 ) ) ( not ( = ?auto_544690 ?auto_544692 ) ) ( not ( = ?auto_544690 ?auto_544693 ) ) ( not ( = ?auto_544690 ?auto_544694 ) ) ( not ( = ?auto_544690 ?auto_544695 ) ) ( not ( = ?auto_544690 ?auto_544696 ) ) ( not ( = ?auto_544690 ?auto_544697 ) ) ( not ( = ?auto_544690 ?auto_544698 ) ) ( not ( = ?auto_544690 ?auto_544699 ) ) ( not ( = ?auto_544690 ?auto_544700 ) ) ( not ( = ?auto_544690 ?auto_544701 ) ) ( not ( = ?auto_544690 ?auto_544702 ) ) ( not ( = ?auto_544691 ?auto_544692 ) ) ( not ( = ?auto_544691 ?auto_544693 ) ) ( not ( = ?auto_544691 ?auto_544694 ) ) ( not ( = ?auto_544691 ?auto_544695 ) ) ( not ( = ?auto_544691 ?auto_544696 ) ) ( not ( = ?auto_544691 ?auto_544697 ) ) ( not ( = ?auto_544691 ?auto_544698 ) ) ( not ( = ?auto_544691 ?auto_544699 ) ) ( not ( = ?auto_544691 ?auto_544700 ) ) ( not ( = ?auto_544691 ?auto_544701 ) ) ( not ( = ?auto_544691 ?auto_544702 ) ) ( not ( = ?auto_544692 ?auto_544693 ) ) ( not ( = ?auto_544692 ?auto_544694 ) ) ( not ( = ?auto_544692 ?auto_544695 ) ) ( not ( = ?auto_544692 ?auto_544696 ) ) ( not ( = ?auto_544692 ?auto_544697 ) ) ( not ( = ?auto_544692 ?auto_544698 ) ) ( not ( = ?auto_544692 ?auto_544699 ) ) ( not ( = ?auto_544692 ?auto_544700 ) ) ( not ( = ?auto_544692 ?auto_544701 ) ) ( not ( = ?auto_544692 ?auto_544702 ) ) ( not ( = ?auto_544693 ?auto_544694 ) ) ( not ( = ?auto_544693 ?auto_544695 ) ) ( not ( = ?auto_544693 ?auto_544696 ) ) ( not ( = ?auto_544693 ?auto_544697 ) ) ( not ( = ?auto_544693 ?auto_544698 ) ) ( not ( = ?auto_544693 ?auto_544699 ) ) ( not ( = ?auto_544693 ?auto_544700 ) ) ( not ( = ?auto_544693 ?auto_544701 ) ) ( not ( = ?auto_544693 ?auto_544702 ) ) ( not ( = ?auto_544694 ?auto_544695 ) ) ( not ( = ?auto_544694 ?auto_544696 ) ) ( not ( = ?auto_544694 ?auto_544697 ) ) ( not ( = ?auto_544694 ?auto_544698 ) ) ( not ( = ?auto_544694 ?auto_544699 ) ) ( not ( = ?auto_544694 ?auto_544700 ) ) ( not ( = ?auto_544694 ?auto_544701 ) ) ( not ( = ?auto_544694 ?auto_544702 ) ) ( not ( = ?auto_544695 ?auto_544696 ) ) ( not ( = ?auto_544695 ?auto_544697 ) ) ( not ( = ?auto_544695 ?auto_544698 ) ) ( not ( = ?auto_544695 ?auto_544699 ) ) ( not ( = ?auto_544695 ?auto_544700 ) ) ( not ( = ?auto_544695 ?auto_544701 ) ) ( not ( = ?auto_544695 ?auto_544702 ) ) ( not ( = ?auto_544696 ?auto_544697 ) ) ( not ( = ?auto_544696 ?auto_544698 ) ) ( not ( = ?auto_544696 ?auto_544699 ) ) ( not ( = ?auto_544696 ?auto_544700 ) ) ( not ( = ?auto_544696 ?auto_544701 ) ) ( not ( = ?auto_544696 ?auto_544702 ) ) ( not ( = ?auto_544697 ?auto_544698 ) ) ( not ( = ?auto_544697 ?auto_544699 ) ) ( not ( = ?auto_544697 ?auto_544700 ) ) ( not ( = ?auto_544697 ?auto_544701 ) ) ( not ( = ?auto_544697 ?auto_544702 ) ) ( not ( = ?auto_544698 ?auto_544699 ) ) ( not ( = ?auto_544698 ?auto_544700 ) ) ( not ( = ?auto_544698 ?auto_544701 ) ) ( not ( = ?auto_544698 ?auto_544702 ) ) ( not ( = ?auto_544699 ?auto_544700 ) ) ( not ( = ?auto_544699 ?auto_544701 ) ) ( not ( = ?auto_544699 ?auto_544702 ) ) ( not ( = ?auto_544700 ?auto_544701 ) ) ( not ( = ?auto_544700 ?auto_544702 ) ) ( not ( = ?auto_544701 ?auto_544702 ) ) ( ON ?auto_544700 ?auto_544701 ) ( ON ?auto_544699 ?auto_544700 ) ( CLEAR ?auto_544697 ) ( ON ?auto_544698 ?auto_544699 ) ( CLEAR ?auto_544698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_544687 ?auto_544688 ?auto_544689 ?auto_544690 ?auto_544691 ?auto_544692 ?auto_544693 ?auto_544694 ?auto_544695 ?auto_544696 ?auto_544697 ?auto_544698 )
      ( MAKE-15PILE ?auto_544687 ?auto_544688 ?auto_544689 ?auto_544690 ?auto_544691 ?auto_544692 ?auto_544693 ?auto_544694 ?auto_544695 ?auto_544696 ?auto_544697 ?auto_544698 ?auto_544699 ?auto_544700 ?auto_544701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544749 - BLOCK
      ?auto_544750 - BLOCK
      ?auto_544751 - BLOCK
      ?auto_544752 - BLOCK
      ?auto_544753 - BLOCK
      ?auto_544754 - BLOCK
      ?auto_544755 - BLOCK
      ?auto_544756 - BLOCK
      ?auto_544757 - BLOCK
      ?auto_544758 - BLOCK
      ?auto_544759 - BLOCK
      ?auto_544760 - BLOCK
      ?auto_544761 - BLOCK
      ?auto_544762 - BLOCK
      ?auto_544763 - BLOCK
    )
    :vars
    (
      ?auto_544764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544763 ?auto_544764 ) ( ON-TABLE ?auto_544749 ) ( ON ?auto_544750 ?auto_544749 ) ( ON ?auto_544751 ?auto_544750 ) ( ON ?auto_544752 ?auto_544751 ) ( ON ?auto_544753 ?auto_544752 ) ( ON ?auto_544754 ?auto_544753 ) ( ON ?auto_544755 ?auto_544754 ) ( ON ?auto_544756 ?auto_544755 ) ( ON ?auto_544757 ?auto_544756 ) ( ON ?auto_544758 ?auto_544757 ) ( not ( = ?auto_544749 ?auto_544750 ) ) ( not ( = ?auto_544749 ?auto_544751 ) ) ( not ( = ?auto_544749 ?auto_544752 ) ) ( not ( = ?auto_544749 ?auto_544753 ) ) ( not ( = ?auto_544749 ?auto_544754 ) ) ( not ( = ?auto_544749 ?auto_544755 ) ) ( not ( = ?auto_544749 ?auto_544756 ) ) ( not ( = ?auto_544749 ?auto_544757 ) ) ( not ( = ?auto_544749 ?auto_544758 ) ) ( not ( = ?auto_544749 ?auto_544759 ) ) ( not ( = ?auto_544749 ?auto_544760 ) ) ( not ( = ?auto_544749 ?auto_544761 ) ) ( not ( = ?auto_544749 ?auto_544762 ) ) ( not ( = ?auto_544749 ?auto_544763 ) ) ( not ( = ?auto_544749 ?auto_544764 ) ) ( not ( = ?auto_544750 ?auto_544751 ) ) ( not ( = ?auto_544750 ?auto_544752 ) ) ( not ( = ?auto_544750 ?auto_544753 ) ) ( not ( = ?auto_544750 ?auto_544754 ) ) ( not ( = ?auto_544750 ?auto_544755 ) ) ( not ( = ?auto_544750 ?auto_544756 ) ) ( not ( = ?auto_544750 ?auto_544757 ) ) ( not ( = ?auto_544750 ?auto_544758 ) ) ( not ( = ?auto_544750 ?auto_544759 ) ) ( not ( = ?auto_544750 ?auto_544760 ) ) ( not ( = ?auto_544750 ?auto_544761 ) ) ( not ( = ?auto_544750 ?auto_544762 ) ) ( not ( = ?auto_544750 ?auto_544763 ) ) ( not ( = ?auto_544750 ?auto_544764 ) ) ( not ( = ?auto_544751 ?auto_544752 ) ) ( not ( = ?auto_544751 ?auto_544753 ) ) ( not ( = ?auto_544751 ?auto_544754 ) ) ( not ( = ?auto_544751 ?auto_544755 ) ) ( not ( = ?auto_544751 ?auto_544756 ) ) ( not ( = ?auto_544751 ?auto_544757 ) ) ( not ( = ?auto_544751 ?auto_544758 ) ) ( not ( = ?auto_544751 ?auto_544759 ) ) ( not ( = ?auto_544751 ?auto_544760 ) ) ( not ( = ?auto_544751 ?auto_544761 ) ) ( not ( = ?auto_544751 ?auto_544762 ) ) ( not ( = ?auto_544751 ?auto_544763 ) ) ( not ( = ?auto_544751 ?auto_544764 ) ) ( not ( = ?auto_544752 ?auto_544753 ) ) ( not ( = ?auto_544752 ?auto_544754 ) ) ( not ( = ?auto_544752 ?auto_544755 ) ) ( not ( = ?auto_544752 ?auto_544756 ) ) ( not ( = ?auto_544752 ?auto_544757 ) ) ( not ( = ?auto_544752 ?auto_544758 ) ) ( not ( = ?auto_544752 ?auto_544759 ) ) ( not ( = ?auto_544752 ?auto_544760 ) ) ( not ( = ?auto_544752 ?auto_544761 ) ) ( not ( = ?auto_544752 ?auto_544762 ) ) ( not ( = ?auto_544752 ?auto_544763 ) ) ( not ( = ?auto_544752 ?auto_544764 ) ) ( not ( = ?auto_544753 ?auto_544754 ) ) ( not ( = ?auto_544753 ?auto_544755 ) ) ( not ( = ?auto_544753 ?auto_544756 ) ) ( not ( = ?auto_544753 ?auto_544757 ) ) ( not ( = ?auto_544753 ?auto_544758 ) ) ( not ( = ?auto_544753 ?auto_544759 ) ) ( not ( = ?auto_544753 ?auto_544760 ) ) ( not ( = ?auto_544753 ?auto_544761 ) ) ( not ( = ?auto_544753 ?auto_544762 ) ) ( not ( = ?auto_544753 ?auto_544763 ) ) ( not ( = ?auto_544753 ?auto_544764 ) ) ( not ( = ?auto_544754 ?auto_544755 ) ) ( not ( = ?auto_544754 ?auto_544756 ) ) ( not ( = ?auto_544754 ?auto_544757 ) ) ( not ( = ?auto_544754 ?auto_544758 ) ) ( not ( = ?auto_544754 ?auto_544759 ) ) ( not ( = ?auto_544754 ?auto_544760 ) ) ( not ( = ?auto_544754 ?auto_544761 ) ) ( not ( = ?auto_544754 ?auto_544762 ) ) ( not ( = ?auto_544754 ?auto_544763 ) ) ( not ( = ?auto_544754 ?auto_544764 ) ) ( not ( = ?auto_544755 ?auto_544756 ) ) ( not ( = ?auto_544755 ?auto_544757 ) ) ( not ( = ?auto_544755 ?auto_544758 ) ) ( not ( = ?auto_544755 ?auto_544759 ) ) ( not ( = ?auto_544755 ?auto_544760 ) ) ( not ( = ?auto_544755 ?auto_544761 ) ) ( not ( = ?auto_544755 ?auto_544762 ) ) ( not ( = ?auto_544755 ?auto_544763 ) ) ( not ( = ?auto_544755 ?auto_544764 ) ) ( not ( = ?auto_544756 ?auto_544757 ) ) ( not ( = ?auto_544756 ?auto_544758 ) ) ( not ( = ?auto_544756 ?auto_544759 ) ) ( not ( = ?auto_544756 ?auto_544760 ) ) ( not ( = ?auto_544756 ?auto_544761 ) ) ( not ( = ?auto_544756 ?auto_544762 ) ) ( not ( = ?auto_544756 ?auto_544763 ) ) ( not ( = ?auto_544756 ?auto_544764 ) ) ( not ( = ?auto_544757 ?auto_544758 ) ) ( not ( = ?auto_544757 ?auto_544759 ) ) ( not ( = ?auto_544757 ?auto_544760 ) ) ( not ( = ?auto_544757 ?auto_544761 ) ) ( not ( = ?auto_544757 ?auto_544762 ) ) ( not ( = ?auto_544757 ?auto_544763 ) ) ( not ( = ?auto_544757 ?auto_544764 ) ) ( not ( = ?auto_544758 ?auto_544759 ) ) ( not ( = ?auto_544758 ?auto_544760 ) ) ( not ( = ?auto_544758 ?auto_544761 ) ) ( not ( = ?auto_544758 ?auto_544762 ) ) ( not ( = ?auto_544758 ?auto_544763 ) ) ( not ( = ?auto_544758 ?auto_544764 ) ) ( not ( = ?auto_544759 ?auto_544760 ) ) ( not ( = ?auto_544759 ?auto_544761 ) ) ( not ( = ?auto_544759 ?auto_544762 ) ) ( not ( = ?auto_544759 ?auto_544763 ) ) ( not ( = ?auto_544759 ?auto_544764 ) ) ( not ( = ?auto_544760 ?auto_544761 ) ) ( not ( = ?auto_544760 ?auto_544762 ) ) ( not ( = ?auto_544760 ?auto_544763 ) ) ( not ( = ?auto_544760 ?auto_544764 ) ) ( not ( = ?auto_544761 ?auto_544762 ) ) ( not ( = ?auto_544761 ?auto_544763 ) ) ( not ( = ?auto_544761 ?auto_544764 ) ) ( not ( = ?auto_544762 ?auto_544763 ) ) ( not ( = ?auto_544762 ?auto_544764 ) ) ( not ( = ?auto_544763 ?auto_544764 ) ) ( ON ?auto_544762 ?auto_544763 ) ( ON ?auto_544761 ?auto_544762 ) ( ON ?auto_544760 ?auto_544761 ) ( CLEAR ?auto_544758 ) ( ON ?auto_544759 ?auto_544760 ) ( CLEAR ?auto_544759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_544749 ?auto_544750 ?auto_544751 ?auto_544752 ?auto_544753 ?auto_544754 ?auto_544755 ?auto_544756 ?auto_544757 ?auto_544758 ?auto_544759 )
      ( MAKE-15PILE ?auto_544749 ?auto_544750 ?auto_544751 ?auto_544752 ?auto_544753 ?auto_544754 ?auto_544755 ?auto_544756 ?auto_544757 ?auto_544758 ?auto_544759 ?auto_544760 ?auto_544761 ?auto_544762 ?auto_544763 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544811 - BLOCK
      ?auto_544812 - BLOCK
      ?auto_544813 - BLOCK
      ?auto_544814 - BLOCK
      ?auto_544815 - BLOCK
      ?auto_544816 - BLOCK
      ?auto_544817 - BLOCK
      ?auto_544818 - BLOCK
      ?auto_544819 - BLOCK
      ?auto_544820 - BLOCK
      ?auto_544821 - BLOCK
      ?auto_544822 - BLOCK
      ?auto_544823 - BLOCK
      ?auto_544824 - BLOCK
      ?auto_544825 - BLOCK
    )
    :vars
    (
      ?auto_544826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544825 ?auto_544826 ) ( ON-TABLE ?auto_544811 ) ( ON ?auto_544812 ?auto_544811 ) ( ON ?auto_544813 ?auto_544812 ) ( ON ?auto_544814 ?auto_544813 ) ( ON ?auto_544815 ?auto_544814 ) ( ON ?auto_544816 ?auto_544815 ) ( ON ?auto_544817 ?auto_544816 ) ( ON ?auto_544818 ?auto_544817 ) ( ON ?auto_544819 ?auto_544818 ) ( not ( = ?auto_544811 ?auto_544812 ) ) ( not ( = ?auto_544811 ?auto_544813 ) ) ( not ( = ?auto_544811 ?auto_544814 ) ) ( not ( = ?auto_544811 ?auto_544815 ) ) ( not ( = ?auto_544811 ?auto_544816 ) ) ( not ( = ?auto_544811 ?auto_544817 ) ) ( not ( = ?auto_544811 ?auto_544818 ) ) ( not ( = ?auto_544811 ?auto_544819 ) ) ( not ( = ?auto_544811 ?auto_544820 ) ) ( not ( = ?auto_544811 ?auto_544821 ) ) ( not ( = ?auto_544811 ?auto_544822 ) ) ( not ( = ?auto_544811 ?auto_544823 ) ) ( not ( = ?auto_544811 ?auto_544824 ) ) ( not ( = ?auto_544811 ?auto_544825 ) ) ( not ( = ?auto_544811 ?auto_544826 ) ) ( not ( = ?auto_544812 ?auto_544813 ) ) ( not ( = ?auto_544812 ?auto_544814 ) ) ( not ( = ?auto_544812 ?auto_544815 ) ) ( not ( = ?auto_544812 ?auto_544816 ) ) ( not ( = ?auto_544812 ?auto_544817 ) ) ( not ( = ?auto_544812 ?auto_544818 ) ) ( not ( = ?auto_544812 ?auto_544819 ) ) ( not ( = ?auto_544812 ?auto_544820 ) ) ( not ( = ?auto_544812 ?auto_544821 ) ) ( not ( = ?auto_544812 ?auto_544822 ) ) ( not ( = ?auto_544812 ?auto_544823 ) ) ( not ( = ?auto_544812 ?auto_544824 ) ) ( not ( = ?auto_544812 ?auto_544825 ) ) ( not ( = ?auto_544812 ?auto_544826 ) ) ( not ( = ?auto_544813 ?auto_544814 ) ) ( not ( = ?auto_544813 ?auto_544815 ) ) ( not ( = ?auto_544813 ?auto_544816 ) ) ( not ( = ?auto_544813 ?auto_544817 ) ) ( not ( = ?auto_544813 ?auto_544818 ) ) ( not ( = ?auto_544813 ?auto_544819 ) ) ( not ( = ?auto_544813 ?auto_544820 ) ) ( not ( = ?auto_544813 ?auto_544821 ) ) ( not ( = ?auto_544813 ?auto_544822 ) ) ( not ( = ?auto_544813 ?auto_544823 ) ) ( not ( = ?auto_544813 ?auto_544824 ) ) ( not ( = ?auto_544813 ?auto_544825 ) ) ( not ( = ?auto_544813 ?auto_544826 ) ) ( not ( = ?auto_544814 ?auto_544815 ) ) ( not ( = ?auto_544814 ?auto_544816 ) ) ( not ( = ?auto_544814 ?auto_544817 ) ) ( not ( = ?auto_544814 ?auto_544818 ) ) ( not ( = ?auto_544814 ?auto_544819 ) ) ( not ( = ?auto_544814 ?auto_544820 ) ) ( not ( = ?auto_544814 ?auto_544821 ) ) ( not ( = ?auto_544814 ?auto_544822 ) ) ( not ( = ?auto_544814 ?auto_544823 ) ) ( not ( = ?auto_544814 ?auto_544824 ) ) ( not ( = ?auto_544814 ?auto_544825 ) ) ( not ( = ?auto_544814 ?auto_544826 ) ) ( not ( = ?auto_544815 ?auto_544816 ) ) ( not ( = ?auto_544815 ?auto_544817 ) ) ( not ( = ?auto_544815 ?auto_544818 ) ) ( not ( = ?auto_544815 ?auto_544819 ) ) ( not ( = ?auto_544815 ?auto_544820 ) ) ( not ( = ?auto_544815 ?auto_544821 ) ) ( not ( = ?auto_544815 ?auto_544822 ) ) ( not ( = ?auto_544815 ?auto_544823 ) ) ( not ( = ?auto_544815 ?auto_544824 ) ) ( not ( = ?auto_544815 ?auto_544825 ) ) ( not ( = ?auto_544815 ?auto_544826 ) ) ( not ( = ?auto_544816 ?auto_544817 ) ) ( not ( = ?auto_544816 ?auto_544818 ) ) ( not ( = ?auto_544816 ?auto_544819 ) ) ( not ( = ?auto_544816 ?auto_544820 ) ) ( not ( = ?auto_544816 ?auto_544821 ) ) ( not ( = ?auto_544816 ?auto_544822 ) ) ( not ( = ?auto_544816 ?auto_544823 ) ) ( not ( = ?auto_544816 ?auto_544824 ) ) ( not ( = ?auto_544816 ?auto_544825 ) ) ( not ( = ?auto_544816 ?auto_544826 ) ) ( not ( = ?auto_544817 ?auto_544818 ) ) ( not ( = ?auto_544817 ?auto_544819 ) ) ( not ( = ?auto_544817 ?auto_544820 ) ) ( not ( = ?auto_544817 ?auto_544821 ) ) ( not ( = ?auto_544817 ?auto_544822 ) ) ( not ( = ?auto_544817 ?auto_544823 ) ) ( not ( = ?auto_544817 ?auto_544824 ) ) ( not ( = ?auto_544817 ?auto_544825 ) ) ( not ( = ?auto_544817 ?auto_544826 ) ) ( not ( = ?auto_544818 ?auto_544819 ) ) ( not ( = ?auto_544818 ?auto_544820 ) ) ( not ( = ?auto_544818 ?auto_544821 ) ) ( not ( = ?auto_544818 ?auto_544822 ) ) ( not ( = ?auto_544818 ?auto_544823 ) ) ( not ( = ?auto_544818 ?auto_544824 ) ) ( not ( = ?auto_544818 ?auto_544825 ) ) ( not ( = ?auto_544818 ?auto_544826 ) ) ( not ( = ?auto_544819 ?auto_544820 ) ) ( not ( = ?auto_544819 ?auto_544821 ) ) ( not ( = ?auto_544819 ?auto_544822 ) ) ( not ( = ?auto_544819 ?auto_544823 ) ) ( not ( = ?auto_544819 ?auto_544824 ) ) ( not ( = ?auto_544819 ?auto_544825 ) ) ( not ( = ?auto_544819 ?auto_544826 ) ) ( not ( = ?auto_544820 ?auto_544821 ) ) ( not ( = ?auto_544820 ?auto_544822 ) ) ( not ( = ?auto_544820 ?auto_544823 ) ) ( not ( = ?auto_544820 ?auto_544824 ) ) ( not ( = ?auto_544820 ?auto_544825 ) ) ( not ( = ?auto_544820 ?auto_544826 ) ) ( not ( = ?auto_544821 ?auto_544822 ) ) ( not ( = ?auto_544821 ?auto_544823 ) ) ( not ( = ?auto_544821 ?auto_544824 ) ) ( not ( = ?auto_544821 ?auto_544825 ) ) ( not ( = ?auto_544821 ?auto_544826 ) ) ( not ( = ?auto_544822 ?auto_544823 ) ) ( not ( = ?auto_544822 ?auto_544824 ) ) ( not ( = ?auto_544822 ?auto_544825 ) ) ( not ( = ?auto_544822 ?auto_544826 ) ) ( not ( = ?auto_544823 ?auto_544824 ) ) ( not ( = ?auto_544823 ?auto_544825 ) ) ( not ( = ?auto_544823 ?auto_544826 ) ) ( not ( = ?auto_544824 ?auto_544825 ) ) ( not ( = ?auto_544824 ?auto_544826 ) ) ( not ( = ?auto_544825 ?auto_544826 ) ) ( ON ?auto_544824 ?auto_544825 ) ( ON ?auto_544823 ?auto_544824 ) ( ON ?auto_544822 ?auto_544823 ) ( ON ?auto_544821 ?auto_544822 ) ( CLEAR ?auto_544819 ) ( ON ?auto_544820 ?auto_544821 ) ( CLEAR ?auto_544820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_544811 ?auto_544812 ?auto_544813 ?auto_544814 ?auto_544815 ?auto_544816 ?auto_544817 ?auto_544818 ?auto_544819 ?auto_544820 )
      ( MAKE-15PILE ?auto_544811 ?auto_544812 ?auto_544813 ?auto_544814 ?auto_544815 ?auto_544816 ?auto_544817 ?auto_544818 ?auto_544819 ?auto_544820 ?auto_544821 ?auto_544822 ?auto_544823 ?auto_544824 ?auto_544825 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544873 - BLOCK
      ?auto_544874 - BLOCK
      ?auto_544875 - BLOCK
      ?auto_544876 - BLOCK
      ?auto_544877 - BLOCK
      ?auto_544878 - BLOCK
      ?auto_544879 - BLOCK
      ?auto_544880 - BLOCK
      ?auto_544881 - BLOCK
      ?auto_544882 - BLOCK
      ?auto_544883 - BLOCK
      ?auto_544884 - BLOCK
      ?auto_544885 - BLOCK
      ?auto_544886 - BLOCK
      ?auto_544887 - BLOCK
    )
    :vars
    (
      ?auto_544888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544887 ?auto_544888 ) ( ON-TABLE ?auto_544873 ) ( ON ?auto_544874 ?auto_544873 ) ( ON ?auto_544875 ?auto_544874 ) ( ON ?auto_544876 ?auto_544875 ) ( ON ?auto_544877 ?auto_544876 ) ( ON ?auto_544878 ?auto_544877 ) ( ON ?auto_544879 ?auto_544878 ) ( ON ?auto_544880 ?auto_544879 ) ( not ( = ?auto_544873 ?auto_544874 ) ) ( not ( = ?auto_544873 ?auto_544875 ) ) ( not ( = ?auto_544873 ?auto_544876 ) ) ( not ( = ?auto_544873 ?auto_544877 ) ) ( not ( = ?auto_544873 ?auto_544878 ) ) ( not ( = ?auto_544873 ?auto_544879 ) ) ( not ( = ?auto_544873 ?auto_544880 ) ) ( not ( = ?auto_544873 ?auto_544881 ) ) ( not ( = ?auto_544873 ?auto_544882 ) ) ( not ( = ?auto_544873 ?auto_544883 ) ) ( not ( = ?auto_544873 ?auto_544884 ) ) ( not ( = ?auto_544873 ?auto_544885 ) ) ( not ( = ?auto_544873 ?auto_544886 ) ) ( not ( = ?auto_544873 ?auto_544887 ) ) ( not ( = ?auto_544873 ?auto_544888 ) ) ( not ( = ?auto_544874 ?auto_544875 ) ) ( not ( = ?auto_544874 ?auto_544876 ) ) ( not ( = ?auto_544874 ?auto_544877 ) ) ( not ( = ?auto_544874 ?auto_544878 ) ) ( not ( = ?auto_544874 ?auto_544879 ) ) ( not ( = ?auto_544874 ?auto_544880 ) ) ( not ( = ?auto_544874 ?auto_544881 ) ) ( not ( = ?auto_544874 ?auto_544882 ) ) ( not ( = ?auto_544874 ?auto_544883 ) ) ( not ( = ?auto_544874 ?auto_544884 ) ) ( not ( = ?auto_544874 ?auto_544885 ) ) ( not ( = ?auto_544874 ?auto_544886 ) ) ( not ( = ?auto_544874 ?auto_544887 ) ) ( not ( = ?auto_544874 ?auto_544888 ) ) ( not ( = ?auto_544875 ?auto_544876 ) ) ( not ( = ?auto_544875 ?auto_544877 ) ) ( not ( = ?auto_544875 ?auto_544878 ) ) ( not ( = ?auto_544875 ?auto_544879 ) ) ( not ( = ?auto_544875 ?auto_544880 ) ) ( not ( = ?auto_544875 ?auto_544881 ) ) ( not ( = ?auto_544875 ?auto_544882 ) ) ( not ( = ?auto_544875 ?auto_544883 ) ) ( not ( = ?auto_544875 ?auto_544884 ) ) ( not ( = ?auto_544875 ?auto_544885 ) ) ( not ( = ?auto_544875 ?auto_544886 ) ) ( not ( = ?auto_544875 ?auto_544887 ) ) ( not ( = ?auto_544875 ?auto_544888 ) ) ( not ( = ?auto_544876 ?auto_544877 ) ) ( not ( = ?auto_544876 ?auto_544878 ) ) ( not ( = ?auto_544876 ?auto_544879 ) ) ( not ( = ?auto_544876 ?auto_544880 ) ) ( not ( = ?auto_544876 ?auto_544881 ) ) ( not ( = ?auto_544876 ?auto_544882 ) ) ( not ( = ?auto_544876 ?auto_544883 ) ) ( not ( = ?auto_544876 ?auto_544884 ) ) ( not ( = ?auto_544876 ?auto_544885 ) ) ( not ( = ?auto_544876 ?auto_544886 ) ) ( not ( = ?auto_544876 ?auto_544887 ) ) ( not ( = ?auto_544876 ?auto_544888 ) ) ( not ( = ?auto_544877 ?auto_544878 ) ) ( not ( = ?auto_544877 ?auto_544879 ) ) ( not ( = ?auto_544877 ?auto_544880 ) ) ( not ( = ?auto_544877 ?auto_544881 ) ) ( not ( = ?auto_544877 ?auto_544882 ) ) ( not ( = ?auto_544877 ?auto_544883 ) ) ( not ( = ?auto_544877 ?auto_544884 ) ) ( not ( = ?auto_544877 ?auto_544885 ) ) ( not ( = ?auto_544877 ?auto_544886 ) ) ( not ( = ?auto_544877 ?auto_544887 ) ) ( not ( = ?auto_544877 ?auto_544888 ) ) ( not ( = ?auto_544878 ?auto_544879 ) ) ( not ( = ?auto_544878 ?auto_544880 ) ) ( not ( = ?auto_544878 ?auto_544881 ) ) ( not ( = ?auto_544878 ?auto_544882 ) ) ( not ( = ?auto_544878 ?auto_544883 ) ) ( not ( = ?auto_544878 ?auto_544884 ) ) ( not ( = ?auto_544878 ?auto_544885 ) ) ( not ( = ?auto_544878 ?auto_544886 ) ) ( not ( = ?auto_544878 ?auto_544887 ) ) ( not ( = ?auto_544878 ?auto_544888 ) ) ( not ( = ?auto_544879 ?auto_544880 ) ) ( not ( = ?auto_544879 ?auto_544881 ) ) ( not ( = ?auto_544879 ?auto_544882 ) ) ( not ( = ?auto_544879 ?auto_544883 ) ) ( not ( = ?auto_544879 ?auto_544884 ) ) ( not ( = ?auto_544879 ?auto_544885 ) ) ( not ( = ?auto_544879 ?auto_544886 ) ) ( not ( = ?auto_544879 ?auto_544887 ) ) ( not ( = ?auto_544879 ?auto_544888 ) ) ( not ( = ?auto_544880 ?auto_544881 ) ) ( not ( = ?auto_544880 ?auto_544882 ) ) ( not ( = ?auto_544880 ?auto_544883 ) ) ( not ( = ?auto_544880 ?auto_544884 ) ) ( not ( = ?auto_544880 ?auto_544885 ) ) ( not ( = ?auto_544880 ?auto_544886 ) ) ( not ( = ?auto_544880 ?auto_544887 ) ) ( not ( = ?auto_544880 ?auto_544888 ) ) ( not ( = ?auto_544881 ?auto_544882 ) ) ( not ( = ?auto_544881 ?auto_544883 ) ) ( not ( = ?auto_544881 ?auto_544884 ) ) ( not ( = ?auto_544881 ?auto_544885 ) ) ( not ( = ?auto_544881 ?auto_544886 ) ) ( not ( = ?auto_544881 ?auto_544887 ) ) ( not ( = ?auto_544881 ?auto_544888 ) ) ( not ( = ?auto_544882 ?auto_544883 ) ) ( not ( = ?auto_544882 ?auto_544884 ) ) ( not ( = ?auto_544882 ?auto_544885 ) ) ( not ( = ?auto_544882 ?auto_544886 ) ) ( not ( = ?auto_544882 ?auto_544887 ) ) ( not ( = ?auto_544882 ?auto_544888 ) ) ( not ( = ?auto_544883 ?auto_544884 ) ) ( not ( = ?auto_544883 ?auto_544885 ) ) ( not ( = ?auto_544883 ?auto_544886 ) ) ( not ( = ?auto_544883 ?auto_544887 ) ) ( not ( = ?auto_544883 ?auto_544888 ) ) ( not ( = ?auto_544884 ?auto_544885 ) ) ( not ( = ?auto_544884 ?auto_544886 ) ) ( not ( = ?auto_544884 ?auto_544887 ) ) ( not ( = ?auto_544884 ?auto_544888 ) ) ( not ( = ?auto_544885 ?auto_544886 ) ) ( not ( = ?auto_544885 ?auto_544887 ) ) ( not ( = ?auto_544885 ?auto_544888 ) ) ( not ( = ?auto_544886 ?auto_544887 ) ) ( not ( = ?auto_544886 ?auto_544888 ) ) ( not ( = ?auto_544887 ?auto_544888 ) ) ( ON ?auto_544886 ?auto_544887 ) ( ON ?auto_544885 ?auto_544886 ) ( ON ?auto_544884 ?auto_544885 ) ( ON ?auto_544883 ?auto_544884 ) ( ON ?auto_544882 ?auto_544883 ) ( CLEAR ?auto_544880 ) ( ON ?auto_544881 ?auto_544882 ) ( CLEAR ?auto_544881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_544873 ?auto_544874 ?auto_544875 ?auto_544876 ?auto_544877 ?auto_544878 ?auto_544879 ?auto_544880 ?auto_544881 )
      ( MAKE-15PILE ?auto_544873 ?auto_544874 ?auto_544875 ?auto_544876 ?auto_544877 ?auto_544878 ?auto_544879 ?auto_544880 ?auto_544881 ?auto_544882 ?auto_544883 ?auto_544884 ?auto_544885 ?auto_544886 ?auto_544887 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544935 - BLOCK
      ?auto_544936 - BLOCK
      ?auto_544937 - BLOCK
      ?auto_544938 - BLOCK
      ?auto_544939 - BLOCK
      ?auto_544940 - BLOCK
      ?auto_544941 - BLOCK
      ?auto_544942 - BLOCK
      ?auto_544943 - BLOCK
      ?auto_544944 - BLOCK
      ?auto_544945 - BLOCK
      ?auto_544946 - BLOCK
      ?auto_544947 - BLOCK
      ?auto_544948 - BLOCK
      ?auto_544949 - BLOCK
    )
    :vars
    (
      ?auto_544950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_544949 ?auto_544950 ) ( ON-TABLE ?auto_544935 ) ( ON ?auto_544936 ?auto_544935 ) ( ON ?auto_544937 ?auto_544936 ) ( ON ?auto_544938 ?auto_544937 ) ( ON ?auto_544939 ?auto_544938 ) ( ON ?auto_544940 ?auto_544939 ) ( ON ?auto_544941 ?auto_544940 ) ( not ( = ?auto_544935 ?auto_544936 ) ) ( not ( = ?auto_544935 ?auto_544937 ) ) ( not ( = ?auto_544935 ?auto_544938 ) ) ( not ( = ?auto_544935 ?auto_544939 ) ) ( not ( = ?auto_544935 ?auto_544940 ) ) ( not ( = ?auto_544935 ?auto_544941 ) ) ( not ( = ?auto_544935 ?auto_544942 ) ) ( not ( = ?auto_544935 ?auto_544943 ) ) ( not ( = ?auto_544935 ?auto_544944 ) ) ( not ( = ?auto_544935 ?auto_544945 ) ) ( not ( = ?auto_544935 ?auto_544946 ) ) ( not ( = ?auto_544935 ?auto_544947 ) ) ( not ( = ?auto_544935 ?auto_544948 ) ) ( not ( = ?auto_544935 ?auto_544949 ) ) ( not ( = ?auto_544935 ?auto_544950 ) ) ( not ( = ?auto_544936 ?auto_544937 ) ) ( not ( = ?auto_544936 ?auto_544938 ) ) ( not ( = ?auto_544936 ?auto_544939 ) ) ( not ( = ?auto_544936 ?auto_544940 ) ) ( not ( = ?auto_544936 ?auto_544941 ) ) ( not ( = ?auto_544936 ?auto_544942 ) ) ( not ( = ?auto_544936 ?auto_544943 ) ) ( not ( = ?auto_544936 ?auto_544944 ) ) ( not ( = ?auto_544936 ?auto_544945 ) ) ( not ( = ?auto_544936 ?auto_544946 ) ) ( not ( = ?auto_544936 ?auto_544947 ) ) ( not ( = ?auto_544936 ?auto_544948 ) ) ( not ( = ?auto_544936 ?auto_544949 ) ) ( not ( = ?auto_544936 ?auto_544950 ) ) ( not ( = ?auto_544937 ?auto_544938 ) ) ( not ( = ?auto_544937 ?auto_544939 ) ) ( not ( = ?auto_544937 ?auto_544940 ) ) ( not ( = ?auto_544937 ?auto_544941 ) ) ( not ( = ?auto_544937 ?auto_544942 ) ) ( not ( = ?auto_544937 ?auto_544943 ) ) ( not ( = ?auto_544937 ?auto_544944 ) ) ( not ( = ?auto_544937 ?auto_544945 ) ) ( not ( = ?auto_544937 ?auto_544946 ) ) ( not ( = ?auto_544937 ?auto_544947 ) ) ( not ( = ?auto_544937 ?auto_544948 ) ) ( not ( = ?auto_544937 ?auto_544949 ) ) ( not ( = ?auto_544937 ?auto_544950 ) ) ( not ( = ?auto_544938 ?auto_544939 ) ) ( not ( = ?auto_544938 ?auto_544940 ) ) ( not ( = ?auto_544938 ?auto_544941 ) ) ( not ( = ?auto_544938 ?auto_544942 ) ) ( not ( = ?auto_544938 ?auto_544943 ) ) ( not ( = ?auto_544938 ?auto_544944 ) ) ( not ( = ?auto_544938 ?auto_544945 ) ) ( not ( = ?auto_544938 ?auto_544946 ) ) ( not ( = ?auto_544938 ?auto_544947 ) ) ( not ( = ?auto_544938 ?auto_544948 ) ) ( not ( = ?auto_544938 ?auto_544949 ) ) ( not ( = ?auto_544938 ?auto_544950 ) ) ( not ( = ?auto_544939 ?auto_544940 ) ) ( not ( = ?auto_544939 ?auto_544941 ) ) ( not ( = ?auto_544939 ?auto_544942 ) ) ( not ( = ?auto_544939 ?auto_544943 ) ) ( not ( = ?auto_544939 ?auto_544944 ) ) ( not ( = ?auto_544939 ?auto_544945 ) ) ( not ( = ?auto_544939 ?auto_544946 ) ) ( not ( = ?auto_544939 ?auto_544947 ) ) ( not ( = ?auto_544939 ?auto_544948 ) ) ( not ( = ?auto_544939 ?auto_544949 ) ) ( not ( = ?auto_544939 ?auto_544950 ) ) ( not ( = ?auto_544940 ?auto_544941 ) ) ( not ( = ?auto_544940 ?auto_544942 ) ) ( not ( = ?auto_544940 ?auto_544943 ) ) ( not ( = ?auto_544940 ?auto_544944 ) ) ( not ( = ?auto_544940 ?auto_544945 ) ) ( not ( = ?auto_544940 ?auto_544946 ) ) ( not ( = ?auto_544940 ?auto_544947 ) ) ( not ( = ?auto_544940 ?auto_544948 ) ) ( not ( = ?auto_544940 ?auto_544949 ) ) ( not ( = ?auto_544940 ?auto_544950 ) ) ( not ( = ?auto_544941 ?auto_544942 ) ) ( not ( = ?auto_544941 ?auto_544943 ) ) ( not ( = ?auto_544941 ?auto_544944 ) ) ( not ( = ?auto_544941 ?auto_544945 ) ) ( not ( = ?auto_544941 ?auto_544946 ) ) ( not ( = ?auto_544941 ?auto_544947 ) ) ( not ( = ?auto_544941 ?auto_544948 ) ) ( not ( = ?auto_544941 ?auto_544949 ) ) ( not ( = ?auto_544941 ?auto_544950 ) ) ( not ( = ?auto_544942 ?auto_544943 ) ) ( not ( = ?auto_544942 ?auto_544944 ) ) ( not ( = ?auto_544942 ?auto_544945 ) ) ( not ( = ?auto_544942 ?auto_544946 ) ) ( not ( = ?auto_544942 ?auto_544947 ) ) ( not ( = ?auto_544942 ?auto_544948 ) ) ( not ( = ?auto_544942 ?auto_544949 ) ) ( not ( = ?auto_544942 ?auto_544950 ) ) ( not ( = ?auto_544943 ?auto_544944 ) ) ( not ( = ?auto_544943 ?auto_544945 ) ) ( not ( = ?auto_544943 ?auto_544946 ) ) ( not ( = ?auto_544943 ?auto_544947 ) ) ( not ( = ?auto_544943 ?auto_544948 ) ) ( not ( = ?auto_544943 ?auto_544949 ) ) ( not ( = ?auto_544943 ?auto_544950 ) ) ( not ( = ?auto_544944 ?auto_544945 ) ) ( not ( = ?auto_544944 ?auto_544946 ) ) ( not ( = ?auto_544944 ?auto_544947 ) ) ( not ( = ?auto_544944 ?auto_544948 ) ) ( not ( = ?auto_544944 ?auto_544949 ) ) ( not ( = ?auto_544944 ?auto_544950 ) ) ( not ( = ?auto_544945 ?auto_544946 ) ) ( not ( = ?auto_544945 ?auto_544947 ) ) ( not ( = ?auto_544945 ?auto_544948 ) ) ( not ( = ?auto_544945 ?auto_544949 ) ) ( not ( = ?auto_544945 ?auto_544950 ) ) ( not ( = ?auto_544946 ?auto_544947 ) ) ( not ( = ?auto_544946 ?auto_544948 ) ) ( not ( = ?auto_544946 ?auto_544949 ) ) ( not ( = ?auto_544946 ?auto_544950 ) ) ( not ( = ?auto_544947 ?auto_544948 ) ) ( not ( = ?auto_544947 ?auto_544949 ) ) ( not ( = ?auto_544947 ?auto_544950 ) ) ( not ( = ?auto_544948 ?auto_544949 ) ) ( not ( = ?auto_544948 ?auto_544950 ) ) ( not ( = ?auto_544949 ?auto_544950 ) ) ( ON ?auto_544948 ?auto_544949 ) ( ON ?auto_544947 ?auto_544948 ) ( ON ?auto_544946 ?auto_544947 ) ( ON ?auto_544945 ?auto_544946 ) ( ON ?auto_544944 ?auto_544945 ) ( ON ?auto_544943 ?auto_544944 ) ( CLEAR ?auto_544941 ) ( ON ?auto_544942 ?auto_544943 ) ( CLEAR ?auto_544942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_544935 ?auto_544936 ?auto_544937 ?auto_544938 ?auto_544939 ?auto_544940 ?auto_544941 ?auto_544942 )
      ( MAKE-15PILE ?auto_544935 ?auto_544936 ?auto_544937 ?auto_544938 ?auto_544939 ?auto_544940 ?auto_544941 ?auto_544942 ?auto_544943 ?auto_544944 ?auto_544945 ?auto_544946 ?auto_544947 ?auto_544948 ?auto_544949 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_544997 - BLOCK
      ?auto_544998 - BLOCK
      ?auto_544999 - BLOCK
      ?auto_545000 - BLOCK
      ?auto_545001 - BLOCK
      ?auto_545002 - BLOCK
      ?auto_545003 - BLOCK
      ?auto_545004 - BLOCK
      ?auto_545005 - BLOCK
      ?auto_545006 - BLOCK
      ?auto_545007 - BLOCK
      ?auto_545008 - BLOCK
      ?auto_545009 - BLOCK
      ?auto_545010 - BLOCK
      ?auto_545011 - BLOCK
    )
    :vars
    (
      ?auto_545012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545011 ?auto_545012 ) ( ON-TABLE ?auto_544997 ) ( ON ?auto_544998 ?auto_544997 ) ( ON ?auto_544999 ?auto_544998 ) ( ON ?auto_545000 ?auto_544999 ) ( ON ?auto_545001 ?auto_545000 ) ( ON ?auto_545002 ?auto_545001 ) ( not ( = ?auto_544997 ?auto_544998 ) ) ( not ( = ?auto_544997 ?auto_544999 ) ) ( not ( = ?auto_544997 ?auto_545000 ) ) ( not ( = ?auto_544997 ?auto_545001 ) ) ( not ( = ?auto_544997 ?auto_545002 ) ) ( not ( = ?auto_544997 ?auto_545003 ) ) ( not ( = ?auto_544997 ?auto_545004 ) ) ( not ( = ?auto_544997 ?auto_545005 ) ) ( not ( = ?auto_544997 ?auto_545006 ) ) ( not ( = ?auto_544997 ?auto_545007 ) ) ( not ( = ?auto_544997 ?auto_545008 ) ) ( not ( = ?auto_544997 ?auto_545009 ) ) ( not ( = ?auto_544997 ?auto_545010 ) ) ( not ( = ?auto_544997 ?auto_545011 ) ) ( not ( = ?auto_544997 ?auto_545012 ) ) ( not ( = ?auto_544998 ?auto_544999 ) ) ( not ( = ?auto_544998 ?auto_545000 ) ) ( not ( = ?auto_544998 ?auto_545001 ) ) ( not ( = ?auto_544998 ?auto_545002 ) ) ( not ( = ?auto_544998 ?auto_545003 ) ) ( not ( = ?auto_544998 ?auto_545004 ) ) ( not ( = ?auto_544998 ?auto_545005 ) ) ( not ( = ?auto_544998 ?auto_545006 ) ) ( not ( = ?auto_544998 ?auto_545007 ) ) ( not ( = ?auto_544998 ?auto_545008 ) ) ( not ( = ?auto_544998 ?auto_545009 ) ) ( not ( = ?auto_544998 ?auto_545010 ) ) ( not ( = ?auto_544998 ?auto_545011 ) ) ( not ( = ?auto_544998 ?auto_545012 ) ) ( not ( = ?auto_544999 ?auto_545000 ) ) ( not ( = ?auto_544999 ?auto_545001 ) ) ( not ( = ?auto_544999 ?auto_545002 ) ) ( not ( = ?auto_544999 ?auto_545003 ) ) ( not ( = ?auto_544999 ?auto_545004 ) ) ( not ( = ?auto_544999 ?auto_545005 ) ) ( not ( = ?auto_544999 ?auto_545006 ) ) ( not ( = ?auto_544999 ?auto_545007 ) ) ( not ( = ?auto_544999 ?auto_545008 ) ) ( not ( = ?auto_544999 ?auto_545009 ) ) ( not ( = ?auto_544999 ?auto_545010 ) ) ( not ( = ?auto_544999 ?auto_545011 ) ) ( not ( = ?auto_544999 ?auto_545012 ) ) ( not ( = ?auto_545000 ?auto_545001 ) ) ( not ( = ?auto_545000 ?auto_545002 ) ) ( not ( = ?auto_545000 ?auto_545003 ) ) ( not ( = ?auto_545000 ?auto_545004 ) ) ( not ( = ?auto_545000 ?auto_545005 ) ) ( not ( = ?auto_545000 ?auto_545006 ) ) ( not ( = ?auto_545000 ?auto_545007 ) ) ( not ( = ?auto_545000 ?auto_545008 ) ) ( not ( = ?auto_545000 ?auto_545009 ) ) ( not ( = ?auto_545000 ?auto_545010 ) ) ( not ( = ?auto_545000 ?auto_545011 ) ) ( not ( = ?auto_545000 ?auto_545012 ) ) ( not ( = ?auto_545001 ?auto_545002 ) ) ( not ( = ?auto_545001 ?auto_545003 ) ) ( not ( = ?auto_545001 ?auto_545004 ) ) ( not ( = ?auto_545001 ?auto_545005 ) ) ( not ( = ?auto_545001 ?auto_545006 ) ) ( not ( = ?auto_545001 ?auto_545007 ) ) ( not ( = ?auto_545001 ?auto_545008 ) ) ( not ( = ?auto_545001 ?auto_545009 ) ) ( not ( = ?auto_545001 ?auto_545010 ) ) ( not ( = ?auto_545001 ?auto_545011 ) ) ( not ( = ?auto_545001 ?auto_545012 ) ) ( not ( = ?auto_545002 ?auto_545003 ) ) ( not ( = ?auto_545002 ?auto_545004 ) ) ( not ( = ?auto_545002 ?auto_545005 ) ) ( not ( = ?auto_545002 ?auto_545006 ) ) ( not ( = ?auto_545002 ?auto_545007 ) ) ( not ( = ?auto_545002 ?auto_545008 ) ) ( not ( = ?auto_545002 ?auto_545009 ) ) ( not ( = ?auto_545002 ?auto_545010 ) ) ( not ( = ?auto_545002 ?auto_545011 ) ) ( not ( = ?auto_545002 ?auto_545012 ) ) ( not ( = ?auto_545003 ?auto_545004 ) ) ( not ( = ?auto_545003 ?auto_545005 ) ) ( not ( = ?auto_545003 ?auto_545006 ) ) ( not ( = ?auto_545003 ?auto_545007 ) ) ( not ( = ?auto_545003 ?auto_545008 ) ) ( not ( = ?auto_545003 ?auto_545009 ) ) ( not ( = ?auto_545003 ?auto_545010 ) ) ( not ( = ?auto_545003 ?auto_545011 ) ) ( not ( = ?auto_545003 ?auto_545012 ) ) ( not ( = ?auto_545004 ?auto_545005 ) ) ( not ( = ?auto_545004 ?auto_545006 ) ) ( not ( = ?auto_545004 ?auto_545007 ) ) ( not ( = ?auto_545004 ?auto_545008 ) ) ( not ( = ?auto_545004 ?auto_545009 ) ) ( not ( = ?auto_545004 ?auto_545010 ) ) ( not ( = ?auto_545004 ?auto_545011 ) ) ( not ( = ?auto_545004 ?auto_545012 ) ) ( not ( = ?auto_545005 ?auto_545006 ) ) ( not ( = ?auto_545005 ?auto_545007 ) ) ( not ( = ?auto_545005 ?auto_545008 ) ) ( not ( = ?auto_545005 ?auto_545009 ) ) ( not ( = ?auto_545005 ?auto_545010 ) ) ( not ( = ?auto_545005 ?auto_545011 ) ) ( not ( = ?auto_545005 ?auto_545012 ) ) ( not ( = ?auto_545006 ?auto_545007 ) ) ( not ( = ?auto_545006 ?auto_545008 ) ) ( not ( = ?auto_545006 ?auto_545009 ) ) ( not ( = ?auto_545006 ?auto_545010 ) ) ( not ( = ?auto_545006 ?auto_545011 ) ) ( not ( = ?auto_545006 ?auto_545012 ) ) ( not ( = ?auto_545007 ?auto_545008 ) ) ( not ( = ?auto_545007 ?auto_545009 ) ) ( not ( = ?auto_545007 ?auto_545010 ) ) ( not ( = ?auto_545007 ?auto_545011 ) ) ( not ( = ?auto_545007 ?auto_545012 ) ) ( not ( = ?auto_545008 ?auto_545009 ) ) ( not ( = ?auto_545008 ?auto_545010 ) ) ( not ( = ?auto_545008 ?auto_545011 ) ) ( not ( = ?auto_545008 ?auto_545012 ) ) ( not ( = ?auto_545009 ?auto_545010 ) ) ( not ( = ?auto_545009 ?auto_545011 ) ) ( not ( = ?auto_545009 ?auto_545012 ) ) ( not ( = ?auto_545010 ?auto_545011 ) ) ( not ( = ?auto_545010 ?auto_545012 ) ) ( not ( = ?auto_545011 ?auto_545012 ) ) ( ON ?auto_545010 ?auto_545011 ) ( ON ?auto_545009 ?auto_545010 ) ( ON ?auto_545008 ?auto_545009 ) ( ON ?auto_545007 ?auto_545008 ) ( ON ?auto_545006 ?auto_545007 ) ( ON ?auto_545005 ?auto_545006 ) ( ON ?auto_545004 ?auto_545005 ) ( CLEAR ?auto_545002 ) ( ON ?auto_545003 ?auto_545004 ) ( CLEAR ?auto_545003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_544997 ?auto_544998 ?auto_544999 ?auto_545000 ?auto_545001 ?auto_545002 ?auto_545003 )
      ( MAKE-15PILE ?auto_544997 ?auto_544998 ?auto_544999 ?auto_545000 ?auto_545001 ?auto_545002 ?auto_545003 ?auto_545004 ?auto_545005 ?auto_545006 ?auto_545007 ?auto_545008 ?auto_545009 ?auto_545010 ?auto_545011 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_545059 - BLOCK
      ?auto_545060 - BLOCK
      ?auto_545061 - BLOCK
      ?auto_545062 - BLOCK
      ?auto_545063 - BLOCK
      ?auto_545064 - BLOCK
      ?auto_545065 - BLOCK
      ?auto_545066 - BLOCK
      ?auto_545067 - BLOCK
      ?auto_545068 - BLOCK
      ?auto_545069 - BLOCK
      ?auto_545070 - BLOCK
      ?auto_545071 - BLOCK
      ?auto_545072 - BLOCK
      ?auto_545073 - BLOCK
    )
    :vars
    (
      ?auto_545074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545073 ?auto_545074 ) ( ON-TABLE ?auto_545059 ) ( ON ?auto_545060 ?auto_545059 ) ( ON ?auto_545061 ?auto_545060 ) ( ON ?auto_545062 ?auto_545061 ) ( ON ?auto_545063 ?auto_545062 ) ( not ( = ?auto_545059 ?auto_545060 ) ) ( not ( = ?auto_545059 ?auto_545061 ) ) ( not ( = ?auto_545059 ?auto_545062 ) ) ( not ( = ?auto_545059 ?auto_545063 ) ) ( not ( = ?auto_545059 ?auto_545064 ) ) ( not ( = ?auto_545059 ?auto_545065 ) ) ( not ( = ?auto_545059 ?auto_545066 ) ) ( not ( = ?auto_545059 ?auto_545067 ) ) ( not ( = ?auto_545059 ?auto_545068 ) ) ( not ( = ?auto_545059 ?auto_545069 ) ) ( not ( = ?auto_545059 ?auto_545070 ) ) ( not ( = ?auto_545059 ?auto_545071 ) ) ( not ( = ?auto_545059 ?auto_545072 ) ) ( not ( = ?auto_545059 ?auto_545073 ) ) ( not ( = ?auto_545059 ?auto_545074 ) ) ( not ( = ?auto_545060 ?auto_545061 ) ) ( not ( = ?auto_545060 ?auto_545062 ) ) ( not ( = ?auto_545060 ?auto_545063 ) ) ( not ( = ?auto_545060 ?auto_545064 ) ) ( not ( = ?auto_545060 ?auto_545065 ) ) ( not ( = ?auto_545060 ?auto_545066 ) ) ( not ( = ?auto_545060 ?auto_545067 ) ) ( not ( = ?auto_545060 ?auto_545068 ) ) ( not ( = ?auto_545060 ?auto_545069 ) ) ( not ( = ?auto_545060 ?auto_545070 ) ) ( not ( = ?auto_545060 ?auto_545071 ) ) ( not ( = ?auto_545060 ?auto_545072 ) ) ( not ( = ?auto_545060 ?auto_545073 ) ) ( not ( = ?auto_545060 ?auto_545074 ) ) ( not ( = ?auto_545061 ?auto_545062 ) ) ( not ( = ?auto_545061 ?auto_545063 ) ) ( not ( = ?auto_545061 ?auto_545064 ) ) ( not ( = ?auto_545061 ?auto_545065 ) ) ( not ( = ?auto_545061 ?auto_545066 ) ) ( not ( = ?auto_545061 ?auto_545067 ) ) ( not ( = ?auto_545061 ?auto_545068 ) ) ( not ( = ?auto_545061 ?auto_545069 ) ) ( not ( = ?auto_545061 ?auto_545070 ) ) ( not ( = ?auto_545061 ?auto_545071 ) ) ( not ( = ?auto_545061 ?auto_545072 ) ) ( not ( = ?auto_545061 ?auto_545073 ) ) ( not ( = ?auto_545061 ?auto_545074 ) ) ( not ( = ?auto_545062 ?auto_545063 ) ) ( not ( = ?auto_545062 ?auto_545064 ) ) ( not ( = ?auto_545062 ?auto_545065 ) ) ( not ( = ?auto_545062 ?auto_545066 ) ) ( not ( = ?auto_545062 ?auto_545067 ) ) ( not ( = ?auto_545062 ?auto_545068 ) ) ( not ( = ?auto_545062 ?auto_545069 ) ) ( not ( = ?auto_545062 ?auto_545070 ) ) ( not ( = ?auto_545062 ?auto_545071 ) ) ( not ( = ?auto_545062 ?auto_545072 ) ) ( not ( = ?auto_545062 ?auto_545073 ) ) ( not ( = ?auto_545062 ?auto_545074 ) ) ( not ( = ?auto_545063 ?auto_545064 ) ) ( not ( = ?auto_545063 ?auto_545065 ) ) ( not ( = ?auto_545063 ?auto_545066 ) ) ( not ( = ?auto_545063 ?auto_545067 ) ) ( not ( = ?auto_545063 ?auto_545068 ) ) ( not ( = ?auto_545063 ?auto_545069 ) ) ( not ( = ?auto_545063 ?auto_545070 ) ) ( not ( = ?auto_545063 ?auto_545071 ) ) ( not ( = ?auto_545063 ?auto_545072 ) ) ( not ( = ?auto_545063 ?auto_545073 ) ) ( not ( = ?auto_545063 ?auto_545074 ) ) ( not ( = ?auto_545064 ?auto_545065 ) ) ( not ( = ?auto_545064 ?auto_545066 ) ) ( not ( = ?auto_545064 ?auto_545067 ) ) ( not ( = ?auto_545064 ?auto_545068 ) ) ( not ( = ?auto_545064 ?auto_545069 ) ) ( not ( = ?auto_545064 ?auto_545070 ) ) ( not ( = ?auto_545064 ?auto_545071 ) ) ( not ( = ?auto_545064 ?auto_545072 ) ) ( not ( = ?auto_545064 ?auto_545073 ) ) ( not ( = ?auto_545064 ?auto_545074 ) ) ( not ( = ?auto_545065 ?auto_545066 ) ) ( not ( = ?auto_545065 ?auto_545067 ) ) ( not ( = ?auto_545065 ?auto_545068 ) ) ( not ( = ?auto_545065 ?auto_545069 ) ) ( not ( = ?auto_545065 ?auto_545070 ) ) ( not ( = ?auto_545065 ?auto_545071 ) ) ( not ( = ?auto_545065 ?auto_545072 ) ) ( not ( = ?auto_545065 ?auto_545073 ) ) ( not ( = ?auto_545065 ?auto_545074 ) ) ( not ( = ?auto_545066 ?auto_545067 ) ) ( not ( = ?auto_545066 ?auto_545068 ) ) ( not ( = ?auto_545066 ?auto_545069 ) ) ( not ( = ?auto_545066 ?auto_545070 ) ) ( not ( = ?auto_545066 ?auto_545071 ) ) ( not ( = ?auto_545066 ?auto_545072 ) ) ( not ( = ?auto_545066 ?auto_545073 ) ) ( not ( = ?auto_545066 ?auto_545074 ) ) ( not ( = ?auto_545067 ?auto_545068 ) ) ( not ( = ?auto_545067 ?auto_545069 ) ) ( not ( = ?auto_545067 ?auto_545070 ) ) ( not ( = ?auto_545067 ?auto_545071 ) ) ( not ( = ?auto_545067 ?auto_545072 ) ) ( not ( = ?auto_545067 ?auto_545073 ) ) ( not ( = ?auto_545067 ?auto_545074 ) ) ( not ( = ?auto_545068 ?auto_545069 ) ) ( not ( = ?auto_545068 ?auto_545070 ) ) ( not ( = ?auto_545068 ?auto_545071 ) ) ( not ( = ?auto_545068 ?auto_545072 ) ) ( not ( = ?auto_545068 ?auto_545073 ) ) ( not ( = ?auto_545068 ?auto_545074 ) ) ( not ( = ?auto_545069 ?auto_545070 ) ) ( not ( = ?auto_545069 ?auto_545071 ) ) ( not ( = ?auto_545069 ?auto_545072 ) ) ( not ( = ?auto_545069 ?auto_545073 ) ) ( not ( = ?auto_545069 ?auto_545074 ) ) ( not ( = ?auto_545070 ?auto_545071 ) ) ( not ( = ?auto_545070 ?auto_545072 ) ) ( not ( = ?auto_545070 ?auto_545073 ) ) ( not ( = ?auto_545070 ?auto_545074 ) ) ( not ( = ?auto_545071 ?auto_545072 ) ) ( not ( = ?auto_545071 ?auto_545073 ) ) ( not ( = ?auto_545071 ?auto_545074 ) ) ( not ( = ?auto_545072 ?auto_545073 ) ) ( not ( = ?auto_545072 ?auto_545074 ) ) ( not ( = ?auto_545073 ?auto_545074 ) ) ( ON ?auto_545072 ?auto_545073 ) ( ON ?auto_545071 ?auto_545072 ) ( ON ?auto_545070 ?auto_545071 ) ( ON ?auto_545069 ?auto_545070 ) ( ON ?auto_545068 ?auto_545069 ) ( ON ?auto_545067 ?auto_545068 ) ( ON ?auto_545066 ?auto_545067 ) ( ON ?auto_545065 ?auto_545066 ) ( CLEAR ?auto_545063 ) ( ON ?auto_545064 ?auto_545065 ) ( CLEAR ?auto_545064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_545059 ?auto_545060 ?auto_545061 ?auto_545062 ?auto_545063 ?auto_545064 )
      ( MAKE-15PILE ?auto_545059 ?auto_545060 ?auto_545061 ?auto_545062 ?auto_545063 ?auto_545064 ?auto_545065 ?auto_545066 ?auto_545067 ?auto_545068 ?auto_545069 ?auto_545070 ?auto_545071 ?auto_545072 ?auto_545073 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_545121 - BLOCK
      ?auto_545122 - BLOCK
      ?auto_545123 - BLOCK
      ?auto_545124 - BLOCK
      ?auto_545125 - BLOCK
      ?auto_545126 - BLOCK
      ?auto_545127 - BLOCK
      ?auto_545128 - BLOCK
      ?auto_545129 - BLOCK
      ?auto_545130 - BLOCK
      ?auto_545131 - BLOCK
      ?auto_545132 - BLOCK
      ?auto_545133 - BLOCK
      ?auto_545134 - BLOCK
      ?auto_545135 - BLOCK
    )
    :vars
    (
      ?auto_545136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545135 ?auto_545136 ) ( ON-TABLE ?auto_545121 ) ( ON ?auto_545122 ?auto_545121 ) ( ON ?auto_545123 ?auto_545122 ) ( ON ?auto_545124 ?auto_545123 ) ( not ( = ?auto_545121 ?auto_545122 ) ) ( not ( = ?auto_545121 ?auto_545123 ) ) ( not ( = ?auto_545121 ?auto_545124 ) ) ( not ( = ?auto_545121 ?auto_545125 ) ) ( not ( = ?auto_545121 ?auto_545126 ) ) ( not ( = ?auto_545121 ?auto_545127 ) ) ( not ( = ?auto_545121 ?auto_545128 ) ) ( not ( = ?auto_545121 ?auto_545129 ) ) ( not ( = ?auto_545121 ?auto_545130 ) ) ( not ( = ?auto_545121 ?auto_545131 ) ) ( not ( = ?auto_545121 ?auto_545132 ) ) ( not ( = ?auto_545121 ?auto_545133 ) ) ( not ( = ?auto_545121 ?auto_545134 ) ) ( not ( = ?auto_545121 ?auto_545135 ) ) ( not ( = ?auto_545121 ?auto_545136 ) ) ( not ( = ?auto_545122 ?auto_545123 ) ) ( not ( = ?auto_545122 ?auto_545124 ) ) ( not ( = ?auto_545122 ?auto_545125 ) ) ( not ( = ?auto_545122 ?auto_545126 ) ) ( not ( = ?auto_545122 ?auto_545127 ) ) ( not ( = ?auto_545122 ?auto_545128 ) ) ( not ( = ?auto_545122 ?auto_545129 ) ) ( not ( = ?auto_545122 ?auto_545130 ) ) ( not ( = ?auto_545122 ?auto_545131 ) ) ( not ( = ?auto_545122 ?auto_545132 ) ) ( not ( = ?auto_545122 ?auto_545133 ) ) ( not ( = ?auto_545122 ?auto_545134 ) ) ( not ( = ?auto_545122 ?auto_545135 ) ) ( not ( = ?auto_545122 ?auto_545136 ) ) ( not ( = ?auto_545123 ?auto_545124 ) ) ( not ( = ?auto_545123 ?auto_545125 ) ) ( not ( = ?auto_545123 ?auto_545126 ) ) ( not ( = ?auto_545123 ?auto_545127 ) ) ( not ( = ?auto_545123 ?auto_545128 ) ) ( not ( = ?auto_545123 ?auto_545129 ) ) ( not ( = ?auto_545123 ?auto_545130 ) ) ( not ( = ?auto_545123 ?auto_545131 ) ) ( not ( = ?auto_545123 ?auto_545132 ) ) ( not ( = ?auto_545123 ?auto_545133 ) ) ( not ( = ?auto_545123 ?auto_545134 ) ) ( not ( = ?auto_545123 ?auto_545135 ) ) ( not ( = ?auto_545123 ?auto_545136 ) ) ( not ( = ?auto_545124 ?auto_545125 ) ) ( not ( = ?auto_545124 ?auto_545126 ) ) ( not ( = ?auto_545124 ?auto_545127 ) ) ( not ( = ?auto_545124 ?auto_545128 ) ) ( not ( = ?auto_545124 ?auto_545129 ) ) ( not ( = ?auto_545124 ?auto_545130 ) ) ( not ( = ?auto_545124 ?auto_545131 ) ) ( not ( = ?auto_545124 ?auto_545132 ) ) ( not ( = ?auto_545124 ?auto_545133 ) ) ( not ( = ?auto_545124 ?auto_545134 ) ) ( not ( = ?auto_545124 ?auto_545135 ) ) ( not ( = ?auto_545124 ?auto_545136 ) ) ( not ( = ?auto_545125 ?auto_545126 ) ) ( not ( = ?auto_545125 ?auto_545127 ) ) ( not ( = ?auto_545125 ?auto_545128 ) ) ( not ( = ?auto_545125 ?auto_545129 ) ) ( not ( = ?auto_545125 ?auto_545130 ) ) ( not ( = ?auto_545125 ?auto_545131 ) ) ( not ( = ?auto_545125 ?auto_545132 ) ) ( not ( = ?auto_545125 ?auto_545133 ) ) ( not ( = ?auto_545125 ?auto_545134 ) ) ( not ( = ?auto_545125 ?auto_545135 ) ) ( not ( = ?auto_545125 ?auto_545136 ) ) ( not ( = ?auto_545126 ?auto_545127 ) ) ( not ( = ?auto_545126 ?auto_545128 ) ) ( not ( = ?auto_545126 ?auto_545129 ) ) ( not ( = ?auto_545126 ?auto_545130 ) ) ( not ( = ?auto_545126 ?auto_545131 ) ) ( not ( = ?auto_545126 ?auto_545132 ) ) ( not ( = ?auto_545126 ?auto_545133 ) ) ( not ( = ?auto_545126 ?auto_545134 ) ) ( not ( = ?auto_545126 ?auto_545135 ) ) ( not ( = ?auto_545126 ?auto_545136 ) ) ( not ( = ?auto_545127 ?auto_545128 ) ) ( not ( = ?auto_545127 ?auto_545129 ) ) ( not ( = ?auto_545127 ?auto_545130 ) ) ( not ( = ?auto_545127 ?auto_545131 ) ) ( not ( = ?auto_545127 ?auto_545132 ) ) ( not ( = ?auto_545127 ?auto_545133 ) ) ( not ( = ?auto_545127 ?auto_545134 ) ) ( not ( = ?auto_545127 ?auto_545135 ) ) ( not ( = ?auto_545127 ?auto_545136 ) ) ( not ( = ?auto_545128 ?auto_545129 ) ) ( not ( = ?auto_545128 ?auto_545130 ) ) ( not ( = ?auto_545128 ?auto_545131 ) ) ( not ( = ?auto_545128 ?auto_545132 ) ) ( not ( = ?auto_545128 ?auto_545133 ) ) ( not ( = ?auto_545128 ?auto_545134 ) ) ( not ( = ?auto_545128 ?auto_545135 ) ) ( not ( = ?auto_545128 ?auto_545136 ) ) ( not ( = ?auto_545129 ?auto_545130 ) ) ( not ( = ?auto_545129 ?auto_545131 ) ) ( not ( = ?auto_545129 ?auto_545132 ) ) ( not ( = ?auto_545129 ?auto_545133 ) ) ( not ( = ?auto_545129 ?auto_545134 ) ) ( not ( = ?auto_545129 ?auto_545135 ) ) ( not ( = ?auto_545129 ?auto_545136 ) ) ( not ( = ?auto_545130 ?auto_545131 ) ) ( not ( = ?auto_545130 ?auto_545132 ) ) ( not ( = ?auto_545130 ?auto_545133 ) ) ( not ( = ?auto_545130 ?auto_545134 ) ) ( not ( = ?auto_545130 ?auto_545135 ) ) ( not ( = ?auto_545130 ?auto_545136 ) ) ( not ( = ?auto_545131 ?auto_545132 ) ) ( not ( = ?auto_545131 ?auto_545133 ) ) ( not ( = ?auto_545131 ?auto_545134 ) ) ( not ( = ?auto_545131 ?auto_545135 ) ) ( not ( = ?auto_545131 ?auto_545136 ) ) ( not ( = ?auto_545132 ?auto_545133 ) ) ( not ( = ?auto_545132 ?auto_545134 ) ) ( not ( = ?auto_545132 ?auto_545135 ) ) ( not ( = ?auto_545132 ?auto_545136 ) ) ( not ( = ?auto_545133 ?auto_545134 ) ) ( not ( = ?auto_545133 ?auto_545135 ) ) ( not ( = ?auto_545133 ?auto_545136 ) ) ( not ( = ?auto_545134 ?auto_545135 ) ) ( not ( = ?auto_545134 ?auto_545136 ) ) ( not ( = ?auto_545135 ?auto_545136 ) ) ( ON ?auto_545134 ?auto_545135 ) ( ON ?auto_545133 ?auto_545134 ) ( ON ?auto_545132 ?auto_545133 ) ( ON ?auto_545131 ?auto_545132 ) ( ON ?auto_545130 ?auto_545131 ) ( ON ?auto_545129 ?auto_545130 ) ( ON ?auto_545128 ?auto_545129 ) ( ON ?auto_545127 ?auto_545128 ) ( ON ?auto_545126 ?auto_545127 ) ( CLEAR ?auto_545124 ) ( ON ?auto_545125 ?auto_545126 ) ( CLEAR ?auto_545125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_545121 ?auto_545122 ?auto_545123 ?auto_545124 ?auto_545125 )
      ( MAKE-15PILE ?auto_545121 ?auto_545122 ?auto_545123 ?auto_545124 ?auto_545125 ?auto_545126 ?auto_545127 ?auto_545128 ?auto_545129 ?auto_545130 ?auto_545131 ?auto_545132 ?auto_545133 ?auto_545134 ?auto_545135 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_545183 - BLOCK
      ?auto_545184 - BLOCK
      ?auto_545185 - BLOCK
      ?auto_545186 - BLOCK
      ?auto_545187 - BLOCK
      ?auto_545188 - BLOCK
      ?auto_545189 - BLOCK
      ?auto_545190 - BLOCK
      ?auto_545191 - BLOCK
      ?auto_545192 - BLOCK
      ?auto_545193 - BLOCK
      ?auto_545194 - BLOCK
      ?auto_545195 - BLOCK
      ?auto_545196 - BLOCK
      ?auto_545197 - BLOCK
    )
    :vars
    (
      ?auto_545198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545197 ?auto_545198 ) ( ON-TABLE ?auto_545183 ) ( ON ?auto_545184 ?auto_545183 ) ( ON ?auto_545185 ?auto_545184 ) ( not ( = ?auto_545183 ?auto_545184 ) ) ( not ( = ?auto_545183 ?auto_545185 ) ) ( not ( = ?auto_545183 ?auto_545186 ) ) ( not ( = ?auto_545183 ?auto_545187 ) ) ( not ( = ?auto_545183 ?auto_545188 ) ) ( not ( = ?auto_545183 ?auto_545189 ) ) ( not ( = ?auto_545183 ?auto_545190 ) ) ( not ( = ?auto_545183 ?auto_545191 ) ) ( not ( = ?auto_545183 ?auto_545192 ) ) ( not ( = ?auto_545183 ?auto_545193 ) ) ( not ( = ?auto_545183 ?auto_545194 ) ) ( not ( = ?auto_545183 ?auto_545195 ) ) ( not ( = ?auto_545183 ?auto_545196 ) ) ( not ( = ?auto_545183 ?auto_545197 ) ) ( not ( = ?auto_545183 ?auto_545198 ) ) ( not ( = ?auto_545184 ?auto_545185 ) ) ( not ( = ?auto_545184 ?auto_545186 ) ) ( not ( = ?auto_545184 ?auto_545187 ) ) ( not ( = ?auto_545184 ?auto_545188 ) ) ( not ( = ?auto_545184 ?auto_545189 ) ) ( not ( = ?auto_545184 ?auto_545190 ) ) ( not ( = ?auto_545184 ?auto_545191 ) ) ( not ( = ?auto_545184 ?auto_545192 ) ) ( not ( = ?auto_545184 ?auto_545193 ) ) ( not ( = ?auto_545184 ?auto_545194 ) ) ( not ( = ?auto_545184 ?auto_545195 ) ) ( not ( = ?auto_545184 ?auto_545196 ) ) ( not ( = ?auto_545184 ?auto_545197 ) ) ( not ( = ?auto_545184 ?auto_545198 ) ) ( not ( = ?auto_545185 ?auto_545186 ) ) ( not ( = ?auto_545185 ?auto_545187 ) ) ( not ( = ?auto_545185 ?auto_545188 ) ) ( not ( = ?auto_545185 ?auto_545189 ) ) ( not ( = ?auto_545185 ?auto_545190 ) ) ( not ( = ?auto_545185 ?auto_545191 ) ) ( not ( = ?auto_545185 ?auto_545192 ) ) ( not ( = ?auto_545185 ?auto_545193 ) ) ( not ( = ?auto_545185 ?auto_545194 ) ) ( not ( = ?auto_545185 ?auto_545195 ) ) ( not ( = ?auto_545185 ?auto_545196 ) ) ( not ( = ?auto_545185 ?auto_545197 ) ) ( not ( = ?auto_545185 ?auto_545198 ) ) ( not ( = ?auto_545186 ?auto_545187 ) ) ( not ( = ?auto_545186 ?auto_545188 ) ) ( not ( = ?auto_545186 ?auto_545189 ) ) ( not ( = ?auto_545186 ?auto_545190 ) ) ( not ( = ?auto_545186 ?auto_545191 ) ) ( not ( = ?auto_545186 ?auto_545192 ) ) ( not ( = ?auto_545186 ?auto_545193 ) ) ( not ( = ?auto_545186 ?auto_545194 ) ) ( not ( = ?auto_545186 ?auto_545195 ) ) ( not ( = ?auto_545186 ?auto_545196 ) ) ( not ( = ?auto_545186 ?auto_545197 ) ) ( not ( = ?auto_545186 ?auto_545198 ) ) ( not ( = ?auto_545187 ?auto_545188 ) ) ( not ( = ?auto_545187 ?auto_545189 ) ) ( not ( = ?auto_545187 ?auto_545190 ) ) ( not ( = ?auto_545187 ?auto_545191 ) ) ( not ( = ?auto_545187 ?auto_545192 ) ) ( not ( = ?auto_545187 ?auto_545193 ) ) ( not ( = ?auto_545187 ?auto_545194 ) ) ( not ( = ?auto_545187 ?auto_545195 ) ) ( not ( = ?auto_545187 ?auto_545196 ) ) ( not ( = ?auto_545187 ?auto_545197 ) ) ( not ( = ?auto_545187 ?auto_545198 ) ) ( not ( = ?auto_545188 ?auto_545189 ) ) ( not ( = ?auto_545188 ?auto_545190 ) ) ( not ( = ?auto_545188 ?auto_545191 ) ) ( not ( = ?auto_545188 ?auto_545192 ) ) ( not ( = ?auto_545188 ?auto_545193 ) ) ( not ( = ?auto_545188 ?auto_545194 ) ) ( not ( = ?auto_545188 ?auto_545195 ) ) ( not ( = ?auto_545188 ?auto_545196 ) ) ( not ( = ?auto_545188 ?auto_545197 ) ) ( not ( = ?auto_545188 ?auto_545198 ) ) ( not ( = ?auto_545189 ?auto_545190 ) ) ( not ( = ?auto_545189 ?auto_545191 ) ) ( not ( = ?auto_545189 ?auto_545192 ) ) ( not ( = ?auto_545189 ?auto_545193 ) ) ( not ( = ?auto_545189 ?auto_545194 ) ) ( not ( = ?auto_545189 ?auto_545195 ) ) ( not ( = ?auto_545189 ?auto_545196 ) ) ( not ( = ?auto_545189 ?auto_545197 ) ) ( not ( = ?auto_545189 ?auto_545198 ) ) ( not ( = ?auto_545190 ?auto_545191 ) ) ( not ( = ?auto_545190 ?auto_545192 ) ) ( not ( = ?auto_545190 ?auto_545193 ) ) ( not ( = ?auto_545190 ?auto_545194 ) ) ( not ( = ?auto_545190 ?auto_545195 ) ) ( not ( = ?auto_545190 ?auto_545196 ) ) ( not ( = ?auto_545190 ?auto_545197 ) ) ( not ( = ?auto_545190 ?auto_545198 ) ) ( not ( = ?auto_545191 ?auto_545192 ) ) ( not ( = ?auto_545191 ?auto_545193 ) ) ( not ( = ?auto_545191 ?auto_545194 ) ) ( not ( = ?auto_545191 ?auto_545195 ) ) ( not ( = ?auto_545191 ?auto_545196 ) ) ( not ( = ?auto_545191 ?auto_545197 ) ) ( not ( = ?auto_545191 ?auto_545198 ) ) ( not ( = ?auto_545192 ?auto_545193 ) ) ( not ( = ?auto_545192 ?auto_545194 ) ) ( not ( = ?auto_545192 ?auto_545195 ) ) ( not ( = ?auto_545192 ?auto_545196 ) ) ( not ( = ?auto_545192 ?auto_545197 ) ) ( not ( = ?auto_545192 ?auto_545198 ) ) ( not ( = ?auto_545193 ?auto_545194 ) ) ( not ( = ?auto_545193 ?auto_545195 ) ) ( not ( = ?auto_545193 ?auto_545196 ) ) ( not ( = ?auto_545193 ?auto_545197 ) ) ( not ( = ?auto_545193 ?auto_545198 ) ) ( not ( = ?auto_545194 ?auto_545195 ) ) ( not ( = ?auto_545194 ?auto_545196 ) ) ( not ( = ?auto_545194 ?auto_545197 ) ) ( not ( = ?auto_545194 ?auto_545198 ) ) ( not ( = ?auto_545195 ?auto_545196 ) ) ( not ( = ?auto_545195 ?auto_545197 ) ) ( not ( = ?auto_545195 ?auto_545198 ) ) ( not ( = ?auto_545196 ?auto_545197 ) ) ( not ( = ?auto_545196 ?auto_545198 ) ) ( not ( = ?auto_545197 ?auto_545198 ) ) ( ON ?auto_545196 ?auto_545197 ) ( ON ?auto_545195 ?auto_545196 ) ( ON ?auto_545194 ?auto_545195 ) ( ON ?auto_545193 ?auto_545194 ) ( ON ?auto_545192 ?auto_545193 ) ( ON ?auto_545191 ?auto_545192 ) ( ON ?auto_545190 ?auto_545191 ) ( ON ?auto_545189 ?auto_545190 ) ( ON ?auto_545188 ?auto_545189 ) ( ON ?auto_545187 ?auto_545188 ) ( CLEAR ?auto_545185 ) ( ON ?auto_545186 ?auto_545187 ) ( CLEAR ?auto_545186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_545183 ?auto_545184 ?auto_545185 ?auto_545186 )
      ( MAKE-15PILE ?auto_545183 ?auto_545184 ?auto_545185 ?auto_545186 ?auto_545187 ?auto_545188 ?auto_545189 ?auto_545190 ?auto_545191 ?auto_545192 ?auto_545193 ?auto_545194 ?auto_545195 ?auto_545196 ?auto_545197 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_545245 - BLOCK
      ?auto_545246 - BLOCK
      ?auto_545247 - BLOCK
      ?auto_545248 - BLOCK
      ?auto_545249 - BLOCK
      ?auto_545250 - BLOCK
      ?auto_545251 - BLOCK
      ?auto_545252 - BLOCK
      ?auto_545253 - BLOCK
      ?auto_545254 - BLOCK
      ?auto_545255 - BLOCK
      ?auto_545256 - BLOCK
      ?auto_545257 - BLOCK
      ?auto_545258 - BLOCK
      ?auto_545259 - BLOCK
    )
    :vars
    (
      ?auto_545260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545259 ?auto_545260 ) ( ON-TABLE ?auto_545245 ) ( ON ?auto_545246 ?auto_545245 ) ( not ( = ?auto_545245 ?auto_545246 ) ) ( not ( = ?auto_545245 ?auto_545247 ) ) ( not ( = ?auto_545245 ?auto_545248 ) ) ( not ( = ?auto_545245 ?auto_545249 ) ) ( not ( = ?auto_545245 ?auto_545250 ) ) ( not ( = ?auto_545245 ?auto_545251 ) ) ( not ( = ?auto_545245 ?auto_545252 ) ) ( not ( = ?auto_545245 ?auto_545253 ) ) ( not ( = ?auto_545245 ?auto_545254 ) ) ( not ( = ?auto_545245 ?auto_545255 ) ) ( not ( = ?auto_545245 ?auto_545256 ) ) ( not ( = ?auto_545245 ?auto_545257 ) ) ( not ( = ?auto_545245 ?auto_545258 ) ) ( not ( = ?auto_545245 ?auto_545259 ) ) ( not ( = ?auto_545245 ?auto_545260 ) ) ( not ( = ?auto_545246 ?auto_545247 ) ) ( not ( = ?auto_545246 ?auto_545248 ) ) ( not ( = ?auto_545246 ?auto_545249 ) ) ( not ( = ?auto_545246 ?auto_545250 ) ) ( not ( = ?auto_545246 ?auto_545251 ) ) ( not ( = ?auto_545246 ?auto_545252 ) ) ( not ( = ?auto_545246 ?auto_545253 ) ) ( not ( = ?auto_545246 ?auto_545254 ) ) ( not ( = ?auto_545246 ?auto_545255 ) ) ( not ( = ?auto_545246 ?auto_545256 ) ) ( not ( = ?auto_545246 ?auto_545257 ) ) ( not ( = ?auto_545246 ?auto_545258 ) ) ( not ( = ?auto_545246 ?auto_545259 ) ) ( not ( = ?auto_545246 ?auto_545260 ) ) ( not ( = ?auto_545247 ?auto_545248 ) ) ( not ( = ?auto_545247 ?auto_545249 ) ) ( not ( = ?auto_545247 ?auto_545250 ) ) ( not ( = ?auto_545247 ?auto_545251 ) ) ( not ( = ?auto_545247 ?auto_545252 ) ) ( not ( = ?auto_545247 ?auto_545253 ) ) ( not ( = ?auto_545247 ?auto_545254 ) ) ( not ( = ?auto_545247 ?auto_545255 ) ) ( not ( = ?auto_545247 ?auto_545256 ) ) ( not ( = ?auto_545247 ?auto_545257 ) ) ( not ( = ?auto_545247 ?auto_545258 ) ) ( not ( = ?auto_545247 ?auto_545259 ) ) ( not ( = ?auto_545247 ?auto_545260 ) ) ( not ( = ?auto_545248 ?auto_545249 ) ) ( not ( = ?auto_545248 ?auto_545250 ) ) ( not ( = ?auto_545248 ?auto_545251 ) ) ( not ( = ?auto_545248 ?auto_545252 ) ) ( not ( = ?auto_545248 ?auto_545253 ) ) ( not ( = ?auto_545248 ?auto_545254 ) ) ( not ( = ?auto_545248 ?auto_545255 ) ) ( not ( = ?auto_545248 ?auto_545256 ) ) ( not ( = ?auto_545248 ?auto_545257 ) ) ( not ( = ?auto_545248 ?auto_545258 ) ) ( not ( = ?auto_545248 ?auto_545259 ) ) ( not ( = ?auto_545248 ?auto_545260 ) ) ( not ( = ?auto_545249 ?auto_545250 ) ) ( not ( = ?auto_545249 ?auto_545251 ) ) ( not ( = ?auto_545249 ?auto_545252 ) ) ( not ( = ?auto_545249 ?auto_545253 ) ) ( not ( = ?auto_545249 ?auto_545254 ) ) ( not ( = ?auto_545249 ?auto_545255 ) ) ( not ( = ?auto_545249 ?auto_545256 ) ) ( not ( = ?auto_545249 ?auto_545257 ) ) ( not ( = ?auto_545249 ?auto_545258 ) ) ( not ( = ?auto_545249 ?auto_545259 ) ) ( not ( = ?auto_545249 ?auto_545260 ) ) ( not ( = ?auto_545250 ?auto_545251 ) ) ( not ( = ?auto_545250 ?auto_545252 ) ) ( not ( = ?auto_545250 ?auto_545253 ) ) ( not ( = ?auto_545250 ?auto_545254 ) ) ( not ( = ?auto_545250 ?auto_545255 ) ) ( not ( = ?auto_545250 ?auto_545256 ) ) ( not ( = ?auto_545250 ?auto_545257 ) ) ( not ( = ?auto_545250 ?auto_545258 ) ) ( not ( = ?auto_545250 ?auto_545259 ) ) ( not ( = ?auto_545250 ?auto_545260 ) ) ( not ( = ?auto_545251 ?auto_545252 ) ) ( not ( = ?auto_545251 ?auto_545253 ) ) ( not ( = ?auto_545251 ?auto_545254 ) ) ( not ( = ?auto_545251 ?auto_545255 ) ) ( not ( = ?auto_545251 ?auto_545256 ) ) ( not ( = ?auto_545251 ?auto_545257 ) ) ( not ( = ?auto_545251 ?auto_545258 ) ) ( not ( = ?auto_545251 ?auto_545259 ) ) ( not ( = ?auto_545251 ?auto_545260 ) ) ( not ( = ?auto_545252 ?auto_545253 ) ) ( not ( = ?auto_545252 ?auto_545254 ) ) ( not ( = ?auto_545252 ?auto_545255 ) ) ( not ( = ?auto_545252 ?auto_545256 ) ) ( not ( = ?auto_545252 ?auto_545257 ) ) ( not ( = ?auto_545252 ?auto_545258 ) ) ( not ( = ?auto_545252 ?auto_545259 ) ) ( not ( = ?auto_545252 ?auto_545260 ) ) ( not ( = ?auto_545253 ?auto_545254 ) ) ( not ( = ?auto_545253 ?auto_545255 ) ) ( not ( = ?auto_545253 ?auto_545256 ) ) ( not ( = ?auto_545253 ?auto_545257 ) ) ( not ( = ?auto_545253 ?auto_545258 ) ) ( not ( = ?auto_545253 ?auto_545259 ) ) ( not ( = ?auto_545253 ?auto_545260 ) ) ( not ( = ?auto_545254 ?auto_545255 ) ) ( not ( = ?auto_545254 ?auto_545256 ) ) ( not ( = ?auto_545254 ?auto_545257 ) ) ( not ( = ?auto_545254 ?auto_545258 ) ) ( not ( = ?auto_545254 ?auto_545259 ) ) ( not ( = ?auto_545254 ?auto_545260 ) ) ( not ( = ?auto_545255 ?auto_545256 ) ) ( not ( = ?auto_545255 ?auto_545257 ) ) ( not ( = ?auto_545255 ?auto_545258 ) ) ( not ( = ?auto_545255 ?auto_545259 ) ) ( not ( = ?auto_545255 ?auto_545260 ) ) ( not ( = ?auto_545256 ?auto_545257 ) ) ( not ( = ?auto_545256 ?auto_545258 ) ) ( not ( = ?auto_545256 ?auto_545259 ) ) ( not ( = ?auto_545256 ?auto_545260 ) ) ( not ( = ?auto_545257 ?auto_545258 ) ) ( not ( = ?auto_545257 ?auto_545259 ) ) ( not ( = ?auto_545257 ?auto_545260 ) ) ( not ( = ?auto_545258 ?auto_545259 ) ) ( not ( = ?auto_545258 ?auto_545260 ) ) ( not ( = ?auto_545259 ?auto_545260 ) ) ( ON ?auto_545258 ?auto_545259 ) ( ON ?auto_545257 ?auto_545258 ) ( ON ?auto_545256 ?auto_545257 ) ( ON ?auto_545255 ?auto_545256 ) ( ON ?auto_545254 ?auto_545255 ) ( ON ?auto_545253 ?auto_545254 ) ( ON ?auto_545252 ?auto_545253 ) ( ON ?auto_545251 ?auto_545252 ) ( ON ?auto_545250 ?auto_545251 ) ( ON ?auto_545249 ?auto_545250 ) ( ON ?auto_545248 ?auto_545249 ) ( CLEAR ?auto_545246 ) ( ON ?auto_545247 ?auto_545248 ) ( CLEAR ?auto_545247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_545245 ?auto_545246 ?auto_545247 )
      ( MAKE-15PILE ?auto_545245 ?auto_545246 ?auto_545247 ?auto_545248 ?auto_545249 ?auto_545250 ?auto_545251 ?auto_545252 ?auto_545253 ?auto_545254 ?auto_545255 ?auto_545256 ?auto_545257 ?auto_545258 ?auto_545259 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_545307 - BLOCK
      ?auto_545308 - BLOCK
      ?auto_545309 - BLOCK
      ?auto_545310 - BLOCK
      ?auto_545311 - BLOCK
      ?auto_545312 - BLOCK
      ?auto_545313 - BLOCK
      ?auto_545314 - BLOCK
      ?auto_545315 - BLOCK
      ?auto_545316 - BLOCK
      ?auto_545317 - BLOCK
      ?auto_545318 - BLOCK
      ?auto_545319 - BLOCK
      ?auto_545320 - BLOCK
      ?auto_545321 - BLOCK
    )
    :vars
    (
      ?auto_545322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545321 ?auto_545322 ) ( ON-TABLE ?auto_545307 ) ( not ( = ?auto_545307 ?auto_545308 ) ) ( not ( = ?auto_545307 ?auto_545309 ) ) ( not ( = ?auto_545307 ?auto_545310 ) ) ( not ( = ?auto_545307 ?auto_545311 ) ) ( not ( = ?auto_545307 ?auto_545312 ) ) ( not ( = ?auto_545307 ?auto_545313 ) ) ( not ( = ?auto_545307 ?auto_545314 ) ) ( not ( = ?auto_545307 ?auto_545315 ) ) ( not ( = ?auto_545307 ?auto_545316 ) ) ( not ( = ?auto_545307 ?auto_545317 ) ) ( not ( = ?auto_545307 ?auto_545318 ) ) ( not ( = ?auto_545307 ?auto_545319 ) ) ( not ( = ?auto_545307 ?auto_545320 ) ) ( not ( = ?auto_545307 ?auto_545321 ) ) ( not ( = ?auto_545307 ?auto_545322 ) ) ( not ( = ?auto_545308 ?auto_545309 ) ) ( not ( = ?auto_545308 ?auto_545310 ) ) ( not ( = ?auto_545308 ?auto_545311 ) ) ( not ( = ?auto_545308 ?auto_545312 ) ) ( not ( = ?auto_545308 ?auto_545313 ) ) ( not ( = ?auto_545308 ?auto_545314 ) ) ( not ( = ?auto_545308 ?auto_545315 ) ) ( not ( = ?auto_545308 ?auto_545316 ) ) ( not ( = ?auto_545308 ?auto_545317 ) ) ( not ( = ?auto_545308 ?auto_545318 ) ) ( not ( = ?auto_545308 ?auto_545319 ) ) ( not ( = ?auto_545308 ?auto_545320 ) ) ( not ( = ?auto_545308 ?auto_545321 ) ) ( not ( = ?auto_545308 ?auto_545322 ) ) ( not ( = ?auto_545309 ?auto_545310 ) ) ( not ( = ?auto_545309 ?auto_545311 ) ) ( not ( = ?auto_545309 ?auto_545312 ) ) ( not ( = ?auto_545309 ?auto_545313 ) ) ( not ( = ?auto_545309 ?auto_545314 ) ) ( not ( = ?auto_545309 ?auto_545315 ) ) ( not ( = ?auto_545309 ?auto_545316 ) ) ( not ( = ?auto_545309 ?auto_545317 ) ) ( not ( = ?auto_545309 ?auto_545318 ) ) ( not ( = ?auto_545309 ?auto_545319 ) ) ( not ( = ?auto_545309 ?auto_545320 ) ) ( not ( = ?auto_545309 ?auto_545321 ) ) ( not ( = ?auto_545309 ?auto_545322 ) ) ( not ( = ?auto_545310 ?auto_545311 ) ) ( not ( = ?auto_545310 ?auto_545312 ) ) ( not ( = ?auto_545310 ?auto_545313 ) ) ( not ( = ?auto_545310 ?auto_545314 ) ) ( not ( = ?auto_545310 ?auto_545315 ) ) ( not ( = ?auto_545310 ?auto_545316 ) ) ( not ( = ?auto_545310 ?auto_545317 ) ) ( not ( = ?auto_545310 ?auto_545318 ) ) ( not ( = ?auto_545310 ?auto_545319 ) ) ( not ( = ?auto_545310 ?auto_545320 ) ) ( not ( = ?auto_545310 ?auto_545321 ) ) ( not ( = ?auto_545310 ?auto_545322 ) ) ( not ( = ?auto_545311 ?auto_545312 ) ) ( not ( = ?auto_545311 ?auto_545313 ) ) ( not ( = ?auto_545311 ?auto_545314 ) ) ( not ( = ?auto_545311 ?auto_545315 ) ) ( not ( = ?auto_545311 ?auto_545316 ) ) ( not ( = ?auto_545311 ?auto_545317 ) ) ( not ( = ?auto_545311 ?auto_545318 ) ) ( not ( = ?auto_545311 ?auto_545319 ) ) ( not ( = ?auto_545311 ?auto_545320 ) ) ( not ( = ?auto_545311 ?auto_545321 ) ) ( not ( = ?auto_545311 ?auto_545322 ) ) ( not ( = ?auto_545312 ?auto_545313 ) ) ( not ( = ?auto_545312 ?auto_545314 ) ) ( not ( = ?auto_545312 ?auto_545315 ) ) ( not ( = ?auto_545312 ?auto_545316 ) ) ( not ( = ?auto_545312 ?auto_545317 ) ) ( not ( = ?auto_545312 ?auto_545318 ) ) ( not ( = ?auto_545312 ?auto_545319 ) ) ( not ( = ?auto_545312 ?auto_545320 ) ) ( not ( = ?auto_545312 ?auto_545321 ) ) ( not ( = ?auto_545312 ?auto_545322 ) ) ( not ( = ?auto_545313 ?auto_545314 ) ) ( not ( = ?auto_545313 ?auto_545315 ) ) ( not ( = ?auto_545313 ?auto_545316 ) ) ( not ( = ?auto_545313 ?auto_545317 ) ) ( not ( = ?auto_545313 ?auto_545318 ) ) ( not ( = ?auto_545313 ?auto_545319 ) ) ( not ( = ?auto_545313 ?auto_545320 ) ) ( not ( = ?auto_545313 ?auto_545321 ) ) ( not ( = ?auto_545313 ?auto_545322 ) ) ( not ( = ?auto_545314 ?auto_545315 ) ) ( not ( = ?auto_545314 ?auto_545316 ) ) ( not ( = ?auto_545314 ?auto_545317 ) ) ( not ( = ?auto_545314 ?auto_545318 ) ) ( not ( = ?auto_545314 ?auto_545319 ) ) ( not ( = ?auto_545314 ?auto_545320 ) ) ( not ( = ?auto_545314 ?auto_545321 ) ) ( not ( = ?auto_545314 ?auto_545322 ) ) ( not ( = ?auto_545315 ?auto_545316 ) ) ( not ( = ?auto_545315 ?auto_545317 ) ) ( not ( = ?auto_545315 ?auto_545318 ) ) ( not ( = ?auto_545315 ?auto_545319 ) ) ( not ( = ?auto_545315 ?auto_545320 ) ) ( not ( = ?auto_545315 ?auto_545321 ) ) ( not ( = ?auto_545315 ?auto_545322 ) ) ( not ( = ?auto_545316 ?auto_545317 ) ) ( not ( = ?auto_545316 ?auto_545318 ) ) ( not ( = ?auto_545316 ?auto_545319 ) ) ( not ( = ?auto_545316 ?auto_545320 ) ) ( not ( = ?auto_545316 ?auto_545321 ) ) ( not ( = ?auto_545316 ?auto_545322 ) ) ( not ( = ?auto_545317 ?auto_545318 ) ) ( not ( = ?auto_545317 ?auto_545319 ) ) ( not ( = ?auto_545317 ?auto_545320 ) ) ( not ( = ?auto_545317 ?auto_545321 ) ) ( not ( = ?auto_545317 ?auto_545322 ) ) ( not ( = ?auto_545318 ?auto_545319 ) ) ( not ( = ?auto_545318 ?auto_545320 ) ) ( not ( = ?auto_545318 ?auto_545321 ) ) ( not ( = ?auto_545318 ?auto_545322 ) ) ( not ( = ?auto_545319 ?auto_545320 ) ) ( not ( = ?auto_545319 ?auto_545321 ) ) ( not ( = ?auto_545319 ?auto_545322 ) ) ( not ( = ?auto_545320 ?auto_545321 ) ) ( not ( = ?auto_545320 ?auto_545322 ) ) ( not ( = ?auto_545321 ?auto_545322 ) ) ( ON ?auto_545320 ?auto_545321 ) ( ON ?auto_545319 ?auto_545320 ) ( ON ?auto_545318 ?auto_545319 ) ( ON ?auto_545317 ?auto_545318 ) ( ON ?auto_545316 ?auto_545317 ) ( ON ?auto_545315 ?auto_545316 ) ( ON ?auto_545314 ?auto_545315 ) ( ON ?auto_545313 ?auto_545314 ) ( ON ?auto_545312 ?auto_545313 ) ( ON ?auto_545311 ?auto_545312 ) ( ON ?auto_545310 ?auto_545311 ) ( ON ?auto_545309 ?auto_545310 ) ( CLEAR ?auto_545307 ) ( ON ?auto_545308 ?auto_545309 ) ( CLEAR ?auto_545308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_545307 ?auto_545308 )
      ( MAKE-15PILE ?auto_545307 ?auto_545308 ?auto_545309 ?auto_545310 ?auto_545311 ?auto_545312 ?auto_545313 ?auto_545314 ?auto_545315 ?auto_545316 ?auto_545317 ?auto_545318 ?auto_545319 ?auto_545320 ?auto_545321 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_545369 - BLOCK
      ?auto_545370 - BLOCK
      ?auto_545371 - BLOCK
      ?auto_545372 - BLOCK
      ?auto_545373 - BLOCK
      ?auto_545374 - BLOCK
      ?auto_545375 - BLOCK
      ?auto_545376 - BLOCK
      ?auto_545377 - BLOCK
      ?auto_545378 - BLOCK
      ?auto_545379 - BLOCK
      ?auto_545380 - BLOCK
      ?auto_545381 - BLOCK
      ?auto_545382 - BLOCK
      ?auto_545383 - BLOCK
    )
    :vars
    (
      ?auto_545384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545383 ?auto_545384 ) ( not ( = ?auto_545369 ?auto_545370 ) ) ( not ( = ?auto_545369 ?auto_545371 ) ) ( not ( = ?auto_545369 ?auto_545372 ) ) ( not ( = ?auto_545369 ?auto_545373 ) ) ( not ( = ?auto_545369 ?auto_545374 ) ) ( not ( = ?auto_545369 ?auto_545375 ) ) ( not ( = ?auto_545369 ?auto_545376 ) ) ( not ( = ?auto_545369 ?auto_545377 ) ) ( not ( = ?auto_545369 ?auto_545378 ) ) ( not ( = ?auto_545369 ?auto_545379 ) ) ( not ( = ?auto_545369 ?auto_545380 ) ) ( not ( = ?auto_545369 ?auto_545381 ) ) ( not ( = ?auto_545369 ?auto_545382 ) ) ( not ( = ?auto_545369 ?auto_545383 ) ) ( not ( = ?auto_545369 ?auto_545384 ) ) ( not ( = ?auto_545370 ?auto_545371 ) ) ( not ( = ?auto_545370 ?auto_545372 ) ) ( not ( = ?auto_545370 ?auto_545373 ) ) ( not ( = ?auto_545370 ?auto_545374 ) ) ( not ( = ?auto_545370 ?auto_545375 ) ) ( not ( = ?auto_545370 ?auto_545376 ) ) ( not ( = ?auto_545370 ?auto_545377 ) ) ( not ( = ?auto_545370 ?auto_545378 ) ) ( not ( = ?auto_545370 ?auto_545379 ) ) ( not ( = ?auto_545370 ?auto_545380 ) ) ( not ( = ?auto_545370 ?auto_545381 ) ) ( not ( = ?auto_545370 ?auto_545382 ) ) ( not ( = ?auto_545370 ?auto_545383 ) ) ( not ( = ?auto_545370 ?auto_545384 ) ) ( not ( = ?auto_545371 ?auto_545372 ) ) ( not ( = ?auto_545371 ?auto_545373 ) ) ( not ( = ?auto_545371 ?auto_545374 ) ) ( not ( = ?auto_545371 ?auto_545375 ) ) ( not ( = ?auto_545371 ?auto_545376 ) ) ( not ( = ?auto_545371 ?auto_545377 ) ) ( not ( = ?auto_545371 ?auto_545378 ) ) ( not ( = ?auto_545371 ?auto_545379 ) ) ( not ( = ?auto_545371 ?auto_545380 ) ) ( not ( = ?auto_545371 ?auto_545381 ) ) ( not ( = ?auto_545371 ?auto_545382 ) ) ( not ( = ?auto_545371 ?auto_545383 ) ) ( not ( = ?auto_545371 ?auto_545384 ) ) ( not ( = ?auto_545372 ?auto_545373 ) ) ( not ( = ?auto_545372 ?auto_545374 ) ) ( not ( = ?auto_545372 ?auto_545375 ) ) ( not ( = ?auto_545372 ?auto_545376 ) ) ( not ( = ?auto_545372 ?auto_545377 ) ) ( not ( = ?auto_545372 ?auto_545378 ) ) ( not ( = ?auto_545372 ?auto_545379 ) ) ( not ( = ?auto_545372 ?auto_545380 ) ) ( not ( = ?auto_545372 ?auto_545381 ) ) ( not ( = ?auto_545372 ?auto_545382 ) ) ( not ( = ?auto_545372 ?auto_545383 ) ) ( not ( = ?auto_545372 ?auto_545384 ) ) ( not ( = ?auto_545373 ?auto_545374 ) ) ( not ( = ?auto_545373 ?auto_545375 ) ) ( not ( = ?auto_545373 ?auto_545376 ) ) ( not ( = ?auto_545373 ?auto_545377 ) ) ( not ( = ?auto_545373 ?auto_545378 ) ) ( not ( = ?auto_545373 ?auto_545379 ) ) ( not ( = ?auto_545373 ?auto_545380 ) ) ( not ( = ?auto_545373 ?auto_545381 ) ) ( not ( = ?auto_545373 ?auto_545382 ) ) ( not ( = ?auto_545373 ?auto_545383 ) ) ( not ( = ?auto_545373 ?auto_545384 ) ) ( not ( = ?auto_545374 ?auto_545375 ) ) ( not ( = ?auto_545374 ?auto_545376 ) ) ( not ( = ?auto_545374 ?auto_545377 ) ) ( not ( = ?auto_545374 ?auto_545378 ) ) ( not ( = ?auto_545374 ?auto_545379 ) ) ( not ( = ?auto_545374 ?auto_545380 ) ) ( not ( = ?auto_545374 ?auto_545381 ) ) ( not ( = ?auto_545374 ?auto_545382 ) ) ( not ( = ?auto_545374 ?auto_545383 ) ) ( not ( = ?auto_545374 ?auto_545384 ) ) ( not ( = ?auto_545375 ?auto_545376 ) ) ( not ( = ?auto_545375 ?auto_545377 ) ) ( not ( = ?auto_545375 ?auto_545378 ) ) ( not ( = ?auto_545375 ?auto_545379 ) ) ( not ( = ?auto_545375 ?auto_545380 ) ) ( not ( = ?auto_545375 ?auto_545381 ) ) ( not ( = ?auto_545375 ?auto_545382 ) ) ( not ( = ?auto_545375 ?auto_545383 ) ) ( not ( = ?auto_545375 ?auto_545384 ) ) ( not ( = ?auto_545376 ?auto_545377 ) ) ( not ( = ?auto_545376 ?auto_545378 ) ) ( not ( = ?auto_545376 ?auto_545379 ) ) ( not ( = ?auto_545376 ?auto_545380 ) ) ( not ( = ?auto_545376 ?auto_545381 ) ) ( not ( = ?auto_545376 ?auto_545382 ) ) ( not ( = ?auto_545376 ?auto_545383 ) ) ( not ( = ?auto_545376 ?auto_545384 ) ) ( not ( = ?auto_545377 ?auto_545378 ) ) ( not ( = ?auto_545377 ?auto_545379 ) ) ( not ( = ?auto_545377 ?auto_545380 ) ) ( not ( = ?auto_545377 ?auto_545381 ) ) ( not ( = ?auto_545377 ?auto_545382 ) ) ( not ( = ?auto_545377 ?auto_545383 ) ) ( not ( = ?auto_545377 ?auto_545384 ) ) ( not ( = ?auto_545378 ?auto_545379 ) ) ( not ( = ?auto_545378 ?auto_545380 ) ) ( not ( = ?auto_545378 ?auto_545381 ) ) ( not ( = ?auto_545378 ?auto_545382 ) ) ( not ( = ?auto_545378 ?auto_545383 ) ) ( not ( = ?auto_545378 ?auto_545384 ) ) ( not ( = ?auto_545379 ?auto_545380 ) ) ( not ( = ?auto_545379 ?auto_545381 ) ) ( not ( = ?auto_545379 ?auto_545382 ) ) ( not ( = ?auto_545379 ?auto_545383 ) ) ( not ( = ?auto_545379 ?auto_545384 ) ) ( not ( = ?auto_545380 ?auto_545381 ) ) ( not ( = ?auto_545380 ?auto_545382 ) ) ( not ( = ?auto_545380 ?auto_545383 ) ) ( not ( = ?auto_545380 ?auto_545384 ) ) ( not ( = ?auto_545381 ?auto_545382 ) ) ( not ( = ?auto_545381 ?auto_545383 ) ) ( not ( = ?auto_545381 ?auto_545384 ) ) ( not ( = ?auto_545382 ?auto_545383 ) ) ( not ( = ?auto_545382 ?auto_545384 ) ) ( not ( = ?auto_545383 ?auto_545384 ) ) ( ON ?auto_545382 ?auto_545383 ) ( ON ?auto_545381 ?auto_545382 ) ( ON ?auto_545380 ?auto_545381 ) ( ON ?auto_545379 ?auto_545380 ) ( ON ?auto_545378 ?auto_545379 ) ( ON ?auto_545377 ?auto_545378 ) ( ON ?auto_545376 ?auto_545377 ) ( ON ?auto_545375 ?auto_545376 ) ( ON ?auto_545374 ?auto_545375 ) ( ON ?auto_545373 ?auto_545374 ) ( ON ?auto_545372 ?auto_545373 ) ( ON ?auto_545371 ?auto_545372 ) ( ON ?auto_545370 ?auto_545371 ) ( ON ?auto_545369 ?auto_545370 ) ( CLEAR ?auto_545369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_545369 )
      ( MAKE-15PILE ?auto_545369 ?auto_545370 ?auto_545371 ?auto_545372 ?auto_545373 ?auto_545374 ?auto_545375 ?auto_545376 ?auto_545377 ?auto_545378 ?auto_545379 ?auto_545380 ?auto_545381 ?auto_545382 ?auto_545383 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545432 - BLOCK
      ?auto_545433 - BLOCK
      ?auto_545434 - BLOCK
      ?auto_545435 - BLOCK
      ?auto_545436 - BLOCK
      ?auto_545437 - BLOCK
      ?auto_545438 - BLOCK
      ?auto_545439 - BLOCK
      ?auto_545440 - BLOCK
      ?auto_545441 - BLOCK
      ?auto_545442 - BLOCK
      ?auto_545443 - BLOCK
      ?auto_545444 - BLOCK
      ?auto_545445 - BLOCK
      ?auto_545446 - BLOCK
      ?auto_545447 - BLOCK
    )
    :vars
    (
      ?auto_545448 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_545446 ) ( ON ?auto_545447 ?auto_545448 ) ( CLEAR ?auto_545447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_545432 ) ( ON ?auto_545433 ?auto_545432 ) ( ON ?auto_545434 ?auto_545433 ) ( ON ?auto_545435 ?auto_545434 ) ( ON ?auto_545436 ?auto_545435 ) ( ON ?auto_545437 ?auto_545436 ) ( ON ?auto_545438 ?auto_545437 ) ( ON ?auto_545439 ?auto_545438 ) ( ON ?auto_545440 ?auto_545439 ) ( ON ?auto_545441 ?auto_545440 ) ( ON ?auto_545442 ?auto_545441 ) ( ON ?auto_545443 ?auto_545442 ) ( ON ?auto_545444 ?auto_545443 ) ( ON ?auto_545445 ?auto_545444 ) ( ON ?auto_545446 ?auto_545445 ) ( not ( = ?auto_545432 ?auto_545433 ) ) ( not ( = ?auto_545432 ?auto_545434 ) ) ( not ( = ?auto_545432 ?auto_545435 ) ) ( not ( = ?auto_545432 ?auto_545436 ) ) ( not ( = ?auto_545432 ?auto_545437 ) ) ( not ( = ?auto_545432 ?auto_545438 ) ) ( not ( = ?auto_545432 ?auto_545439 ) ) ( not ( = ?auto_545432 ?auto_545440 ) ) ( not ( = ?auto_545432 ?auto_545441 ) ) ( not ( = ?auto_545432 ?auto_545442 ) ) ( not ( = ?auto_545432 ?auto_545443 ) ) ( not ( = ?auto_545432 ?auto_545444 ) ) ( not ( = ?auto_545432 ?auto_545445 ) ) ( not ( = ?auto_545432 ?auto_545446 ) ) ( not ( = ?auto_545432 ?auto_545447 ) ) ( not ( = ?auto_545432 ?auto_545448 ) ) ( not ( = ?auto_545433 ?auto_545434 ) ) ( not ( = ?auto_545433 ?auto_545435 ) ) ( not ( = ?auto_545433 ?auto_545436 ) ) ( not ( = ?auto_545433 ?auto_545437 ) ) ( not ( = ?auto_545433 ?auto_545438 ) ) ( not ( = ?auto_545433 ?auto_545439 ) ) ( not ( = ?auto_545433 ?auto_545440 ) ) ( not ( = ?auto_545433 ?auto_545441 ) ) ( not ( = ?auto_545433 ?auto_545442 ) ) ( not ( = ?auto_545433 ?auto_545443 ) ) ( not ( = ?auto_545433 ?auto_545444 ) ) ( not ( = ?auto_545433 ?auto_545445 ) ) ( not ( = ?auto_545433 ?auto_545446 ) ) ( not ( = ?auto_545433 ?auto_545447 ) ) ( not ( = ?auto_545433 ?auto_545448 ) ) ( not ( = ?auto_545434 ?auto_545435 ) ) ( not ( = ?auto_545434 ?auto_545436 ) ) ( not ( = ?auto_545434 ?auto_545437 ) ) ( not ( = ?auto_545434 ?auto_545438 ) ) ( not ( = ?auto_545434 ?auto_545439 ) ) ( not ( = ?auto_545434 ?auto_545440 ) ) ( not ( = ?auto_545434 ?auto_545441 ) ) ( not ( = ?auto_545434 ?auto_545442 ) ) ( not ( = ?auto_545434 ?auto_545443 ) ) ( not ( = ?auto_545434 ?auto_545444 ) ) ( not ( = ?auto_545434 ?auto_545445 ) ) ( not ( = ?auto_545434 ?auto_545446 ) ) ( not ( = ?auto_545434 ?auto_545447 ) ) ( not ( = ?auto_545434 ?auto_545448 ) ) ( not ( = ?auto_545435 ?auto_545436 ) ) ( not ( = ?auto_545435 ?auto_545437 ) ) ( not ( = ?auto_545435 ?auto_545438 ) ) ( not ( = ?auto_545435 ?auto_545439 ) ) ( not ( = ?auto_545435 ?auto_545440 ) ) ( not ( = ?auto_545435 ?auto_545441 ) ) ( not ( = ?auto_545435 ?auto_545442 ) ) ( not ( = ?auto_545435 ?auto_545443 ) ) ( not ( = ?auto_545435 ?auto_545444 ) ) ( not ( = ?auto_545435 ?auto_545445 ) ) ( not ( = ?auto_545435 ?auto_545446 ) ) ( not ( = ?auto_545435 ?auto_545447 ) ) ( not ( = ?auto_545435 ?auto_545448 ) ) ( not ( = ?auto_545436 ?auto_545437 ) ) ( not ( = ?auto_545436 ?auto_545438 ) ) ( not ( = ?auto_545436 ?auto_545439 ) ) ( not ( = ?auto_545436 ?auto_545440 ) ) ( not ( = ?auto_545436 ?auto_545441 ) ) ( not ( = ?auto_545436 ?auto_545442 ) ) ( not ( = ?auto_545436 ?auto_545443 ) ) ( not ( = ?auto_545436 ?auto_545444 ) ) ( not ( = ?auto_545436 ?auto_545445 ) ) ( not ( = ?auto_545436 ?auto_545446 ) ) ( not ( = ?auto_545436 ?auto_545447 ) ) ( not ( = ?auto_545436 ?auto_545448 ) ) ( not ( = ?auto_545437 ?auto_545438 ) ) ( not ( = ?auto_545437 ?auto_545439 ) ) ( not ( = ?auto_545437 ?auto_545440 ) ) ( not ( = ?auto_545437 ?auto_545441 ) ) ( not ( = ?auto_545437 ?auto_545442 ) ) ( not ( = ?auto_545437 ?auto_545443 ) ) ( not ( = ?auto_545437 ?auto_545444 ) ) ( not ( = ?auto_545437 ?auto_545445 ) ) ( not ( = ?auto_545437 ?auto_545446 ) ) ( not ( = ?auto_545437 ?auto_545447 ) ) ( not ( = ?auto_545437 ?auto_545448 ) ) ( not ( = ?auto_545438 ?auto_545439 ) ) ( not ( = ?auto_545438 ?auto_545440 ) ) ( not ( = ?auto_545438 ?auto_545441 ) ) ( not ( = ?auto_545438 ?auto_545442 ) ) ( not ( = ?auto_545438 ?auto_545443 ) ) ( not ( = ?auto_545438 ?auto_545444 ) ) ( not ( = ?auto_545438 ?auto_545445 ) ) ( not ( = ?auto_545438 ?auto_545446 ) ) ( not ( = ?auto_545438 ?auto_545447 ) ) ( not ( = ?auto_545438 ?auto_545448 ) ) ( not ( = ?auto_545439 ?auto_545440 ) ) ( not ( = ?auto_545439 ?auto_545441 ) ) ( not ( = ?auto_545439 ?auto_545442 ) ) ( not ( = ?auto_545439 ?auto_545443 ) ) ( not ( = ?auto_545439 ?auto_545444 ) ) ( not ( = ?auto_545439 ?auto_545445 ) ) ( not ( = ?auto_545439 ?auto_545446 ) ) ( not ( = ?auto_545439 ?auto_545447 ) ) ( not ( = ?auto_545439 ?auto_545448 ) ) ( not ( = ?auto_545440 ?auto_545441 ) ) ( not ( = ?auto_545440 ?auto_545442 ) ) ( not ( = ?auto_545440 ?auto_545443 ) ) ( not ( = ?auto_545440 ?auto_545444 ) ) ( not ( = ?auto_545440 ?auto_545445 ) ) ( not ( = ?auto_545440 ?auto_545446 ) ) ( not ( = ?auto_545440 ?auto_545447 ) ) ( not ( = ?auto_545440 ?auto_545448 ) ) ( not ( = ?auto_545441 ?auto_545442 ) ) ( not ( = ?auto_545441 ?auto_545443 ) ) ( not ( = ?auto_545441 ?auto_545444 ) ) ( not ( = ?auto_545441 ?auto_545445 ) ) ( not ( = ?auto_545441 ?auto_545446 ) ) ( not ( = ?auto_545441 ?auto_545447 ) ) ( not ( = ?auto_545441 ?auto_545448 ) ) ( not ( = ?auto_545442 ?auto_545443 ) ) ( not ( = ?auto_545442 ?auto_545444 ) ) ( not ( = ?auto_545442 ?auto_545445 ) ) ( not ( = ?auto_545442 ?auto_545446 ) ) ( not ( = ?auto_545442 ?auto_545447 ) ) ( not ( = ?auto_545442 ?auto_545448 ) ) ( not ( = ?auto_545443 ?auto_545444 ) ) ( not ( = ?auto_545443 ?auto_545445 ) ) ( not ( = ?auto_545443 ?auto_545446 ) ) ( not ( = ?auto_545443 ?auto_545447 ) ) ( not ( = ?auto_545443 ?auto_545448 ) ) ( not ( = ?auto_545444 ?auto_545445 ) ) ( not ( = ?auto_545444 ?auto_545446 ) ) ( not ( = ?auto_545444 ?auto_545447 ) ) ( not ( = ?auto_545444 ?auto_545448 ) ) ( not ( = ?auto_545445 ?auto_545446 ) ) ( not ( = ?auto_545445 ?auto_545447 ) ) ( not ( = ?auto_545445 ?auto_545448 ) ) ( not ( = ?auto_545446 ?auto_545447 ) ) ( not ( = ?auto_545446 ?auto_545448 ) ) ( not ( = ?auto_545447 ?auto_545448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_545447 ?auto_545448 )
      ( !STACK ?auto_545447 ?auto_545446 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545465 - BLOCK
      ?auto_545466 - BLOCK
      ?auto_545467 - BLOCK
      ?auto_545468 - BLOCK
      ?auto_545469 - BLOCK
      ?auto_545470 - BLOCK
      ?auto_545471 - BLOCK
      ?auto_545472 - BLOCK
      ?auto_545473 - BLOCK
      ?auto_545474 - BLOCK
      ?auto_545475 - BLOCK
      ?auto_545476 - BLOCK
      ?auto_545477 - BLOCK
      ?auto_545478 - BLOCK
      ?auto_545479 - BLOCK
      ?auto_545480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_545479 ) ( ON-TABLE ?auto_545480 ) ( CLEAR ?auto_545480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_545465 ) ( ON ?auto_545466 ?auto_545465 ) ( ON ?auto_545467 ?auto_545466 ) ( ON ?auto_545468 ?auto_545467 ) ( ON ?auto_545469 ?auto_545468 ) ( ON ?auto_545470 ?auto_545469 ) ( ON ?auto_545471 ?auto_545470 ) ( ON ?auto_545472 ?auto_545471 ) ( ON ?auto_545473 ?auto_545472 ) ( ON ?auto_545474 ?auto_545473 ) ( ON ?auto_545475 ?auto_545474 ) ( ON ?auto_545476 ?auto_545475 ) ( ON ?auto_545477 ?auto_545476 ) ( ON ?auto_545478 ?auto_545477 ) ( ON ?auto_545479 ?auto_545478 ) ( not ( = ?auto_545465 ?auto_545466 ) ) ( not ( = ?auto_545465 ?auto_545467 ) ) ( not ( = ?auto_545465 ?auto_545468 ) ) ( not ( = ?auto_545465 ?auto_545469 ) ) ( not ( = ?auto_545465 ?auto_545470 ) ) ( not ( = ?auto_545465 ?auto_545471 ) ) ( not ( = ?auto_545465 ?auto_545472 ) ) ( not ( = ?auto_545465 ?auto_545473 ) ) ( not ( = ?auto_545465 ?auto_545474 ) ) ( not ( = ?auto_545465 ?auto_545475 ) ) ( not ( = ?auto_545465 ?auto_545476 ) ) ( not ( = ?auto_545465 ?auto_545477 ) ) ( not ( = ?auto_545465 ?auto_545478 ) ) ( not ( = ?auto_545465 ?auto_545479 ) ) ( not ( = ?auto_545465 ?auto_545480 ) ) ( not ( = ?auto_545466 ?auto_545467 ) ) ( not ( = ?auto_545466 ?auto_545468 ) ) ( not ( = ?auto_545466 ?auto_545469 ) ) ( not ( = ?auto_545466 ?auto_545470 ) ) ( not ( = ?auto_545466 ?auto_545471 ) ) ( not ( = ?auto_545466 ?auto_545472 ) ) ( not ( = ?auto_545466 ?auto_545473 ) ) ( not ( = ?auto_545466 ?auto_545474 ) ) ( not ( = ?auto_545466 ?auto_545475 ) ) ( not ( = ?auto_545466 ?auto_545476 ) ) ( not ( = ?auto_545466 ?auto_545477 ) ) ( not ( = ?auto_545466 ?auto_545478 ) ) ( not ( = ?auto_545466 ?auto_545479 ) ) ( not ( = ?auto_545466 ?auto_545480 ) ) ( not ( = ?auto_545467 ?auto_545468 ) ) ( not ( = ?auto_545467 ?auto_545469 ) ) ( not ( = ?auto_545467 ?auto_545470 ) ) ( not ( = ?auto_545467 ?auto_545471 ) ) ( not ( = ?auto_545467 ?auto_545472 ) ) ( not ( = ?auto_545467 ?auto_545473 ) ) ( not ( = ?auto_545467 ?auto_545474 ) ) ( not ( = ?auto_545467 ?auto_545475 ) ) ( not ( = ?auto_545467 ?auto_545476 ) ) ( not ( = ?auto_545467 ?auto_545477 ) ) ( not ( = ?auto_545467 ?auto_545478 ) ) ( not ( = ?auto_545467 ?auto_545479 ) ) ( not ( = ?auto_545467 ?auto_545480 ) ) ( not ( = ?auto_545468 ?auto_545469 ) ) ( not ( = ?auto_545468 ?auto_545470 ) ) ( not ( = ?auto_545468 ?auto_545471 ) ) ( not ( = ?auto_545468 ?auto_545472 ) ) ( not ( = ?auto_545468 ?auto_545473 ) ) ( not ( = ?auto_545468 ?auto_545474 ) ) ( not ( = ?auto_545468 ?auto_545475 ) ) ( not ( = ?auto_545468 ?auto_545476 ) ) ( not ( = ?auto_545468 ?auto_545477 ) ) ( not ( = ?auto_545468 ?auto_545478 ) ) ( not ( = ?auto_545468 ?auto_545479 ) ) ( not ( = ?auto_545468 ?auto_545480 ) ) ( not ( = ?auto_545469 ?auto_545470 ) ) ( not ( = ?auto_545469 ?auto_545471 ) ) ( not ( = ?auto_545469 ?auto_545472 ) ) ( not ( = ?auto_545469 ?auto_545473 ) ) ( not ( = ?auto_545469 ?auto_545474 ) ) ( not ( = ?auto_545469 ?auto_545475 ) ) ( not ( = ?auto_545469 ?auto_545476 ) ) ( not ( = ?auto_545469 ?auto_545477 ) ) ( not ( = ?auto_545469 ?auto_545478 ) ) ( not ( = ?auto_545469 ?auto_545479 ) ) ( not ( = ?auto_545469 ?auto_545480 ) ) ( not ( = ?auto_545470 ?auto_545471 ) ) ( not ( = ?auto_545470 ?auto_545472 ) ) ( not ( = ?auto_545470 ?auto_545473 ) ) ( not ( = ?auto_545470 ?auto_545474 ) ) ( not ( = ?auto_545470 ?auto_545475 ) ) ( not ( = ?auto_545470 ?auto_545476 ) ) ( not ( = ?auto_545470 ?auto_545477 ) ) ( not ( = ?auto_545470 ?auto_545478 ) ) ( not ( = ?auto_545470 ?auto_545479 ) ) ( not ( = ?auto_545470 ?auto_545480 ) ) ( not ( = ?auto_545471 ?auto_545472 ) ) ( not ( = ?auto_545471 ?auto_545473 ) ) ( not ( = ?auto_545471 ?auto_545474 ) ) ( not ( = ?auto_545471 ?auto_545475 ) ) ( not ( = ?auto_545471 ?auto_545476 ) ) ( not ( = ?auto_545471 ?auto_545477 ) ) ( not ( = ?auto_545471 ?auto_545478 ) ) ( not ( = ?auto_545471 ?auto_545479 ) ) ( not ( = ?auto_545471 ?auto_545480 ) ) ( not ( = ?auto_545472 ?auto_545473 ) ) ( not ( = ?auto_545472 ?auto_545474 ) ) ( not ( = ?auto_545472 ?auto_545475 ) ) ( not ( = ?auto_545472 ?auto_545476 ) ) ( not ( = ?auto_545472 ?auto_545477 ) ) ( not ( = ?auto_545472 ?auto_545478 ) ) ( not ( = ?auto_545472 ?auto_545479 ) ) ( not ( = ?auto_545472 ?auto_545480 ) ) ( not ( = ?auto_545473 ?auto_545474 ) ) ( not ( = ?auto_545473 ?auto_545475 ) ) ( not ( = ?auto_545473 ?auto_545476 ) ) ( not ( = ?auto_545473 ?auto_545477 ) ) ( not ( = ?auto_545473 ?auto_545478 ) ) ( not ( = ?auto_545473 ?auto_545479 ) ) ( not ( = ?auto_545473 ?auto_545480 ) ) ( not ( = ?auto_545474 ?auto_545475 ) ) ( not ( = ?auto_545474 ?auto_545476 ) ) ( not ( = ?auto_545474 ?auto_545477 ) ) ( not ( = ?auto_545474 ?auto_545478 ) ) ( not ( = ?auto_545474 ?auto_545479 ) ) ( not ( = ?auto_545474 ?auto_545480 ) ) ( not ( = ?auto_545475 ?auto_545476 ) ) ( not ( = ?auto_545475 ?auto_545477 ) ) ( not ( = ?auto_545475 ?auto_545478 ) ) ( not ( = ?auto_545475 ?auto_545479 ) ) ( not ( = ?auto_545475 ?auto_545480 ) ) ( not ( = ?auto_545476 ?auto_545477 ) ) ( not ( = ?auto_545476 ?auto_545478 ) ) ( not ( = ?auto_545476 ?auto_545479 ) ) ( not ( = ?auto_545476 ?auto_545480 ) ) ( not ( = ?auto_545477 ?auto_545478 ) ) ( not ( = ?auto_545477 ?auto_545479 ) ) ( not ( = ?auto_545477 ?auto_545480 ) ) ( not ( = ?auto_545478 ?auto_545479 ) ) ( not ( = ?auto_545478 ?auto_545480 ) ) ( not ( = ?auto_545479 ?auto_545480 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_545480 )
      ( !STACK ?auto_545480 ?auto_545479 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545497 - BLOCK
      ?auto_545498 - BLOCK
      ?auto_545499 - BLOCK
      ?auto_545500 - BLOCK
      ?auto_545501 - BLOCK
      ?auto_545502 - BLOCK
      ?auto_545503 - BLOCK
      ?auto_545504 - BLOCK
      ?auto_545505 - BLOCK
      ?auto_545506 - BLOCK
      ?auto_545507 - BLOCK
      ?auto_545508 - BLOCK
      ?auto_545509 - BLOCK
      ?auto_545510 - BLOCK
      ?auto_545511 - BLOCK
      ?auto_545512 - BLOCK
    )
    :vars
    (
      ?auto_545513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545512 ?auto_545513 ) ( ON-TABLE ?auto_545497 ) ( ON ?auto_545498 ?auto_545497 ) ( ON ?auto_545499 ?auto_545498 ) ( ON ?auto_545500 ?auto_545499 ) ( ON ?auto_545501 ?auto_545500 ) ( ON ?auto_545502 ?auto_545501 ) ( ON ?auto_545503 ?auto_545502 ) ( ON ?auto_545504 ?auto_545503 ) ( ON ?auto_545505 ?auto_545504 ) ( ON ?auto_545506 ?auto_545505 ) ( ON ?auto_545507 ?auto_545506 ) ( ON ?auto_545508 ?auto_545507 ) ( ON ?auto_545509 ?auto_545508 ) ( ON ?auto_545510 ?auto_545509 ) ( not ( = ?auto_545497 ?auto_545498 ) ) ( not ( = ?auto_545497 ?auto_545499 ) ) ( not ( = ?auto_545497 ?auto_545500 ) ) ( not ( = ?auto_545497 ?auto_545501 ) ) ( not ( = ?auto_545497 ?auto_545502 ) ) ( not ( = ?auto_545497 ?auto_545503 ) ) ( not ( = ?auto_545497 ?auto_545504 ) ) ( not ( = ?auto_545497 ?auto_545505 ) ) ( not ( = ?auto_545497 ?auto_545506 ) ) ( not ( = ?auto_545497 ?auto_545507 ) ) ( not ( = ?auto_545497 ?auto_545508 ) ) ( not ( = ?auto_545497 ?auto_545509 ) ) ( not ( = ?auto_545497 ?auto_545510 ) ) ( not ( = ?auto_545497 ?auto_545511 ) ) ( not ( = ?auto_545497 ?auto_545512 ) ) ( not ( = ?auto_545497 ?auto_545513 ) ) ( not ( = ?auto_545498 ?auto_545499 ) ) ( not ( = ?auto_545498 ?auto_545500 ) ) ( not ( = ?auto_545498 ?auto_545501 ) ) ( not ( = ?auto_545498 ?auto_545502 ) ) ( not ( = ?auto_545498 ?auto_545503 ) ) ( not ( = ?auto_545498 ?auto_545504 ) ) ( not ( = ?auto_545498 ?auto_545505 ) ) ( not ( = ?auto_545498 ?auto_545506 ) ) ( not ( = ?auto_545498 ?auto_545507 ) ) ( not ( = ?auto_545498 ?auto_545508 ) ) ( not ( = ?auto_545498 ?auto_545509 ) ) ( not ( = ?auto_545498 ?auto_545510 ) ) ( not ( = ?auto_545498 ?auto_545511 ) ) ( not ( = ?auto_545498 ?auto_545512 ) ) ( not ( = ?auto_545498 ?auto_545513 ) ) ( not ( = ?auto_545499 ?auto_545500 ) ) ( not ( = ?auto_545499 ?auto_545501 ) ) ( not ( = ?auto_545499 ?auto_545502 ) ) ( not ( = ?auto_545499 ?auto_545503 ) ) ( not ( = ?auto_545499 ?auto_545504 ) ) ( not ( = ?auto_545499 ?auto_545505 ) ) ( not ( = ?auto_545499 ?auto_545506 ) ) ( not ( = ?auto_545499 ?auto_545507 ) ) ( not ( = ?auto_545499 ?auto_545508 ) ) ( not ( = ?auto_545499 ?auto_545509 ) ) ( not ( = ?auto_545499 ?auto_545510 ) ) ( not ( = ?auto_545499 ?auto_545511 ) ) ( not ( = ?auto_545499 ?auto_545512 ) ) ( not ( = ?auto_545499 ?auto_545513 ) ) ( not ( = ?auto_545500 ?auto_545501 ) ) ( not ( = ?auto_545500 ?auto_545502 ) ) ( not ( = ?auto_545500 ?auto_545503 ) ) ( not ( = ?auto_545500 ?auto_545504 ) ) ( not ( = ?auto_545500 ?auto_545505 ) ) ( not ( = ?auto_545500 ?auto_545506 ) ) ( not ( = ?auto_545500 ?auto_545507 ) ) ( not ( = ?auto_545500 ?auto_545508 ) ) ( not ( = ?auto_545500 ?auto_545509 ) ) ( not ( = ?auto_545500 ?auto_545510 ) ) ( not ( = ?auto_545500 ?auto_545511 ) ) ( not ( = ?auto_545500 ?auto_545512 ) ) ( not ( = ?auto_545500 ?auto_545513 ) ) ( not ( = ?auto_545501 ?auto_545502 ) ) ( not ( = ?auto_545501 ?auto_545503 ) ) ( not ( = ?auto_545501 ?auto_545504 ) ) ( not ( = ?auto_545501 ?auto_545505 ) ) ( not ( = ?auto_545501 ?auto_545506 ) ) ( not ( = ?auto_545501 ?auto_545507 ) ) ( not ( = ?auto_545501 ?auto_545508 ) ) ( not ( = ?auto_545501 ?auto_545509 ) ) ( not ( = ?auto_545501 ?auto_545510 ) ) ( not ( = ?auto_545501 ?auto_545511 ) ) ( not ( = ?auto_545501 ?auto_545512 ) ) ( not ( = ?auto_545501 ?auto_545513 ) ) ( not ( = ?auto_545502 ?auto_545503 ) ) ( not ( = ?auto_545502 ?auto_545504 ) ) ( not ( = ?auto_545502 ?auto_545505 ) ) ( not ( = ?auto_545502 ?auto_545506 ) ) ( not ( = ?auto_545502 ?auto_545507 ) ) ( not ( = ?auto_545502 ?auto_545508 ) ) ( not ( = ?auto_545502 ?auto_545509 ) ) ( not ( = ?auto_545502 ?auto_545510 ) ) ( not ( = ?auto_545502 ?auto_545511 ) ) ( not ( = ?auto_545502 ?auto_545512 ) ) ( not ( = ?auto_545502 ?auto_545513 ) ) ( not ( = ?auto_545503 ?auto_545504 ) ) ( not ( = ?auto_545503 ?auto_545505 ) ) ( not ( = ?auto_545503 ?auto_545506 ) ) ( not ( = ?auto_545503 ?auto_545507 ) ) ( not ( = ?auto_545503 ?auto_545508 ) ) ( not ( = ?auto_545503 ?auto_545509 ) ) ( not ( = ?auto_545503 ?auto_545510 ) ) ( not ( = ?auto_545503 ?auto_545511 ) ) ( not ( = ?auto_545503 ?auto_545512 ) ) ( not ( = ?auto_545503 ?auto_545513 ) ) ( not ( = ?auto_545504 ?auto_545505 ) ) ( not ( = ?auto_545504 ?auto_545506 ) ) ( not ( = ?auto_545504 ?auto_545507 ) ) ( not ( = ?auto_545504 ?auto_545508 ) ) ( not ( = ?auto_545504 ?auto_545509 ) ) ( not ( = ?auto_545504 ?auto_545510 ) ) ( not ( = ?auto_545504 ?auto_545511 ) ) ( not ( = ?auto_545504 ?auto_545512 ) ) ( not ( = ?auto_545504 ?auto_545513 ) ) ( not ( = ?auto_545505 ?auto_545506 ) ) ( not ( = ?auto_545505 ?auto_545507 ) ) ( not ( = ?auto_545505 ?auto_545508 ) ) ( not ( = ?auto_545505 ?auto_545509 ) ) ( not ( = ?auto_545505 ?auto_545510 ) ) ( not ( = ?auto_545505 ?auto_545511 ) ) ( not ( = ?auto_545505 ?auto_545512 ) ) ( not ( = ?auto_545505 ?auto_545513 ) ) ( not ( = ?auto_545506 ?auto_545507 ) ) ( not ( = ?auto_545506 ?auto_545508 ) ) ( not ( = ?auto_545506 ?auto_545509 ) ) ( not ( = ?auto_545506 ?auto_545510 ) ) ( not ( = ?auto_545506 ?auto_545511 ) ) ( not ( = ?auto_545506 ?auto_545512 ) ) ( not ( = ?auto_545506 ?auto_545513 ) ) ( not ( = ?auto_545507 ?auto_545508 ) ) ( not ( = ?auto_545507 ?auto_545509 ) ) ( not ( = ?auto_545507 ?auto_545510 ) ) ( not ( = ?auto_545507 ?auto_545511 ) ) ( not ( = ?auto_545507 ?auto_545512 ) ) ( not ( = ?auto_545507 ?auto_545513 ) ) ( not ( = ?auto_545508 ?auto_545509 ) ) ( not ( = ?auto_545508 ?auto_545510 ) ) ( not ( = ?auto_545508 ?auto_545511 ) ) ( not ( = ?auto_545508 ?auto_545512 ) ) ( not ( = ?auto_545508 ?auto_545513 ) ) ( not ( = ?auto_545509 ?auto_545510 ) ) ( not ( = ?auto_545509 ?auto_545511 ) ) ( not ( = ?auto_545509 ?auto_545512 ) ) ( not ( = ?auto_545509 ?auto_545513 ) ) ( not ( = ?auto_545510 ?auto_545511 ) ) ( not ( = ?auto_545510 ?auto_545512 ) ) ( not ( = ?auto_545510 ?auto_545513 ) ) ( not ( = ?auto_545511 ?auto_545512 ) ) ( not ( = ?auto_545511 ?auto_545513 ) ) ( not ( = ?auto_545512 ?auto_545513 ) ) ( CLEAR ?auto_545510 ) ( ON ?auto_545511 ?auto_545512 ) ( CLEAR ?auto_545511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_545497 ?auto_545498 ?auto_545499 ?auto_545500 ?auto_545501 ?auto_545502 ?auto_545503 ?auto_545504 ?auto_545505 ?auto_545506 ?auto_545507 ?auto_545508 ?auto_545509 ?auto_545510 ?auto_545511 )
      ( MAKE-16PILE ?auto_545497 ?auto_545498 ?auto_545499 ?auto_545500 ?auto_545501 ?auto_545502 ?auto_545503 ?auto_545504 ?auto_545505 ?auto_545506 ?auto_545507 ?auto_545508 ?auto_545509 ?auto_545510 ?auto_545511 ?auto_545512 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545530 - BLOCK
      ?auto_545531 - BLOCK
      ?auto_545532 - BLOCK
      ?auto_545533 - BLOCK
      ?auto_545534 - BLOCK
      ?auto_545535 - BLOCK
      ?auto_545536 - BLOCK
      ?auto_545537 - BLOCK
      ?auto_545538 - BLOCK
      ?auto_545539 - BLOCK
      ?auto_545540 - BLOCK
      ?auto_545541 - BLOCK
      ?auto_545542 - BLOCK
      ?auto_545543 - BLOCK
      ?auto_545544 - BLOCK
      ?auto_545545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545545 ) ( ON-TABLE ?auto_545530 ) ( ON ?auto_545531 ?auto_545530 ) ( ON ?auto_545532 ?auto_545531 ) ( ON ?auto_545533 ?auto_545532 ) ( ON ?auto_545534 ?auto_545533 ) ( ON ?auto_545535 ?auto_545534 ) ( ON ?auto_545536 ?auto_545535 ) ( ON ?auto_545537 ?auto_545536 ) ( ON ?auto_545538 ?auto_545537 ) ( ON ?auto_545539 ?auto_545538 ) ( ON ?auto_545540 ?auto_545539 ) ( ON ?auto_545541 ?auto_545540 ) ( ON ?auto_545542 ?auto_545541 ) ( ON ?auto_545543 ?auto_545542 ) ( not ( = ?auto_545530 ?auto_545531 ) ) ( not ( = ?auto_545530 ?auto_545532 ) ) ( not ( = ?auto_545530 ?auto_545533 ) ) ( not ( = ?auto_545530 ?auto_545534 ) ) ( not ( = ?auto_545530 ?auto_545535 ) ) ( not ( = ?auto_545530 ?auto_545536 ) ) ( not ( = ?auto_545530 ?auto_545537 ) ) ( not ( = ?auto_545530 ?auto_545538 ) ) ( not ( = ?auto_545530 ?auto_545539 ) ) ( not ( = ?auto_545530 ?auto_545540 ) ) ( not ( = ?auto_545530 ?auto_545541 ) ) ( not ( = ?auto_545530 ?auto_545542 ) ) ( not ( = ?auto_545530 ?auto_545543 ) ) ( not ( = ?auto_545530 ?auto_545544 ) ) ( not ( = ?auto_545530 ?auto_545545 ) ) ( not ( = ?auto_545531 ?auto_545532 ) ) ( not ( = ?auto_545531 ?auto_545533 ) ) ( not ( = ?auto_545531 ?auto_545534 ) ) ( not ( = ?auto_545531 ?auto_545535 ) ) ( not ( = ?auto_545531 ?auto_545536 ) ) ( not ( = ?auto_545531 ?auto_545537 ) ) ( not ( = ?auto_545531 ?auto_545538 ) ) ( not ( = ?auto_545531 ?auto_545539 ) ) ( not ( = ?auto_545531 ?auto_545540 ) ) ( not ( = ?auto_545531 ?auto_545541 ) ) ( not ( = ?auto_545531 ?auto_545542 ) ) ( not ( = ?auto_545531 ?auto_545543 ) ) ( not ( = ?auto_545531 ?auto_545544 ) ) ( not ( = ?auto_545531 ?auto_545545 ) ) ( not ( = ?auto_545532 ?auto_545533 ) ) ( not ( = ?auto_545532 ?auto_545534 ) ) ( not ( = ?auto_545532 ?auto_545535 ) ) ( not ( = ?auto_545532 ?auto_545536 ) ) ( not ( = ?auto_545532 ?auto_545537 ) ) ( not ( = ?auto_545532 ?auto_545538 ) ) ( not ( = ?auto_545532 ?auto_545539 ) ) ( not ( = ?auto_545532 ?auto_545540 ) ) ( not ( = ?auto_545532 ?auto_545541 ) ) ( not ( = ?auto_545532 ?auto_545542 ) ) ( not ( = ?auto_545532 ?auto_545543 ) ) ( not ( = ?auto_545532 ?auto_545544 ) ) ( not ( = ?auto_545532 ?auto_545545 ) ) ( not ( = ?auto_545533 ?auto_545534 ) ) ( not ( = ?auto_545533 ?auto_545535 ) ) ( not ( = ?auto_545533 ?auto_545536 ) ) ( not ( = ?auto_545533 ?auto_545537 ) ) ( not ( = ?auto_545533 ?auto_545538 ) ) ( not ( = ?auto_545533 ?auto_545539 ) ) ( not ( = ?auto_545533 ?auto_545540 ) ) ( not ( = ?auto_545533 ?auto_545541 ) ) ( not ( = ?auto_545533 ?auto_545542 ) ) ( not ( = ?auto_545533 ?auto_545543 ) ) ( not ( = ?auto_545533 ?auto_545544 ) ) ( not ( = ?auto_545533 ?auto_545545 ) ) ( not ( = ?auto_545534 ?auto_545535 ) ) ( not ( = ?auto_545534 ?auto_545536 ) ) ( not ( = ?auto_545534 ?auto_545537 ) ) ( not ( = ?auto_545534 ?auto_545538 ) ) ( not ( = ?auto_545534 ?auto_545539 ) ) ( not ( = ?auto_545534 ?auto_545540 ) ) ( not ( = ?auto_545534 ?auto_545541 ) ) ( not ( = ?auto_545534 ?auto_545542 ) ) ( not ( = ?auto_545534 ?auto_545543 ) ) ( not ( = ?auto_545534 ?auto_545544 ) ) ( not ( = ?auto_545534 ?auto_545545 ) ) ( not ( = ?auto_545535 ?auto_545536 ) ) ( not ( = ?auto_545535 ?auto_545537 ) ) ( not ( = ?auto_545535 ?auto_545538 ) ) ( not ( = ?auto_545535 ?auto_545539 ) ) ( not ( = ?auto_545535 ?auto_545540 ) ) ( not ( = ?auto_545535 ?auto_545541 ) ) ( not ( = ?auto_545535 ?auto_545542 ) ) ( not ( = ?auto_545535 ?auto_545543 ) ) ( not ( = ?auto_545535 ?auto_545544 ) ) ( not ( = ?auto_545535 ?auto_545545 ) ) ( not ( = ?auto_545536 ?auto_545537 ) ) ( not ( = ?auto_545536 ?auto_545538 ) ) ( not ( = ?auto_545536 ?auto_545539 ) ) ( not ( = ?auto_545536 ?auto_545540 ) ) ( not ( = ?auto_545536 ?auto_545541 ) ) ( not ( = ?auto_545536 ?auto_545542 ) ) ( not ( = ?auto_545536 ?auto_545543 ) ) ( not ( = ?auto_545536 ?auto_545544 ) ) ( not ( = ?auto_545536 ?auto_545545 ) ) ( not ( = ?auto_545537 ?auto_545538 ) ) ( not ( = ?auto_545537 ?auto_545539 ) ) ( not ( = ?auto_545537 ?auto_545540 ) ) ( not ( = ?auto_545537 ?auto_545541 ) ) ( not ( = ?auto_545537 ?auto_545542 ) ) ( not ( = ?auto_545537 ?auto_545543 ) ) ( not ( = ?auto_545537 ?auto_545544 ) ) ( not ( = ?auto_545537 ?auto_545545 ) ) ( not ( = ?auto_545538 ?auto_545539 ) ) ( not ( = ?auto_545538 ?auto_545540 ) ) ( not ( = ?auto_545538 ?auto_545541 ) ) ( not ( = ?auto_545538 ?auto_545542 ) ) ( not ( = ?auto_545538 ?auto_545543 ) ) ( not ( = ?auto_545538 ?auto_545544 ) ) ( not ( = ?auto_545538 ?auto_545545 ) ) ( not ( = ?auto_545539 ?auto_545540 ) ) ( not ( = ?auto_545539 ?auto_545541 ) ) ( not ( = ?auto_545539 ?auto_545542 ) ) ( not ( = ?auto_545539 ?auto_545543 ) ) ( not ( = ?auto_545539 ?auto_545544 ) ) ( not ( = ?auto_545539 ?auto_545545 ) ) ( not ( = ?auto_545540 ?auto_545541 ) ) ( not ( = ?auto_545540 ?auto_545542 ) ) ( not ( = ?auto_545540 ?auto_545543 ) ) ( not ( = ?auto_545540 ?auto_545544 ) ) ( not ( = ?auto_545540 ?auto_545545 ) ) ( not ( = ?auto_545541 ?auto_545542 ) ) ( not ( = ?auto_545541 ?auto_545543 ) ) ( not ( = ?auto_545541 ?auto_545544 ) ) ( not ( = ?auto_545541 ?auto_545545 ) ) ( not ( = ?auto_545542 ?auto_545543 ) ) ( not ( = ?auto_545542 ?auto_545544 ) ) ( not ( = ?auto_545542 ?auto_545545 ) ) ( not ( = ?auto_545543 ?auto_545544 ) ) ( not ( = ?auto_545543 ?auto_545545 ) ) ( not ( = ?auto_545544 ?auto_545545 ) ) ( CLEAR ?auto_545543 ) ( ON ?auto_545544 ?auto_545545 ) ( CLEAR ?auto_545544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_545530 ?auto_545531 ?auto_545532 ?auto_545533 ?auto_545534 ?auto_545535 ?auto_545536 ?auto_545537 ?auto_545538 ?auto_545539 ?auto_545540 ?auto_545541 ?auto_545542 ?auto_545543 ?auto_545544 )
      ( MAKE-16PILE ?auto_545530 ?auto_545531 ?auto_545532 ?auto_545533 ?auto_545534 ?auto_545535 ?auto_545536 ?auto_545537 ?auto_545538 ?auto_545539 ?auto_545540 ?auto_545541 ?auto_545542 ?auto_545543 ?auto_545544 ?auto_545545 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545562 - BLOCK
      ?auto_545563 - BLOCK
      ?auto_545564 - BLOCK
      ?auto_545565 - BLOCK
      ?auto_545566 - BLOCK
      ?auto_545567 - BLOCK
      ?auto_545568 - BLOCK
      ?auto_545569 - BLOCK
      ?auto_545570 - BLOCK
      ?auto_545571 - BLOCK
      ?auto_545572 - BLOCK
      ?auto_545573 - BLOCK
      ?auto_545574 - BLOCK
      ?auto_545575 - BLOCK
      ?auto_545576 - BLOCK
      ?auto_545577 - BLOCK
    )
    :vars
    (
      ?auto_545578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545577 ?auto_545578 ) ( ON-TABLE ?auto_545562 ) ( ON ?auto_545563 ?auto_545562 ) ( ON ?auto_545564 ?auto_545563 ) ( ON ?auto_545565 ?auto_545564 ) ( ON ?auto_545566 ?auto_545565 ) ( ON ?auto_545567 ?auto_545566 ) ( ON ?auto_545568 ?auto_545567 ) ( ON ?auto_545569 ?auto_545568 ) ( ON ?auto_545570 ?auto_545569 ) ( ON ?auto_545571 ?auto_545570 ) ( ON ?auto_545572 ?auto_545571 ) ( ON ?auto_545573 ?auto_545572 ) ( ON ?auto_545574 ?auto_545573 ) ( not ( = ?auto_545562 ?auto_545563 ) ) ( not ( = ?auto_545562 ?auto_545564 ) ) ( not ( = ?auto_545562 ?auto_545565 ) ) ( not ( = ?auto_545562 ?auto_545566 ) ) ( not ( = ?auto_545562 ?auto_545567 ) ) ( not ( = ?auto_545562 ?auto_545568 ) ) ( not ( = ?auto_545562 ?auto_545569 ) ) ( not ( = ?auto_545562 ?auto_545570 ) ) ( not ( = ?auto_545562 ?auto_545571 ) ) ( not ( = ?auto_545562 ?auto_545572 ) ) ( not ( = ?auto_545562 ?auto_545573 ) ) ( not ( = ?auto_545562 ?auto_545574 ) ) ( not ( = ?auto_545562 ?auto_545575 ) ) ( not ( = ?auto_545562 ?auto_545576 ) ) ( not ( = ?auto_545562 ?auto_545577 ) ) ( not ( = ?auto_545562 ?auto_545578 ) ) ( not ( = ?auto_545563 ?auto_545564 ) ) ( not ( = ?auto_545563 ?auto_545565 ) ) ( not ( = ?auto_545563 ?auto_545566 ) ) ( not ( = ?auto_545563 ?auto_545567 ) ) ( not ( = ?auto_545563 ?auto_545568 ) ) ( not ( = ?auto_545563 ?auto_545569 ) ) ( not ( = ?auto_545563 ?auto_545570 ) ) ( not ( = ?auto_545563 ?auto_545571 ) ) ( not ( = ?auto_545563 ?auto_545572 ) ) ( not ( = ?auto_545563 ?auto_545573 ) ) ( not ( = ?auto_545563 ?auto_545574 ) ) ( not ( = ?auto_545563 ?auto_545575 ) ) ( not ( = ?auto_545563 ?auto_545576 ) ) ( not ( = ?auto_545563 ?auto_545577 ) ) ( not ( = ?auto_545563 ?auto_545578 ) ) ( not ( = ?auto_545564 ?auto_545565 ) ) ( not ( = ?auto_545564 ?auto_545566 ) ) ( not ( = ?auto_545564 ?auto_545567 ) ) ( not ( = ?auto_545564 ?auto_545568 ) ) ( not ( = ?auto_545564 ?auto_545569 ) ) ( not ( = ?auto_545564 ?auto_545570 ) ) ( not ( = ?auto_545564 ?auto_545571 ) ) ( not ( = ?auto_545564 ?auto_545572 ) ) ( not ( = ?auto_545564 ?auto_545573 ) ) ( not ( = ?auto_545564 ?auto_545574 ) ) ( not ( = ?auto_545564 ?auto_545575 ) ) ( not ( = ?auto_545564 ?auto_545576 ) ) ( not ( = ?auto_545564 ?auto_545577 ) ) ( not ( = ?auto_545564 ?auto_545578 ) ) ( not ( = ?auto_545565 ?auto_545566 ) ) ( not ( = ?auto_545565 ?auto_545567 ) ) ( not ( = ?auto_545565 ?auto_545568 ) ) ( not ( = ?auto_545565 ?auto_545569 ) ) ( not ( = ?auto_545565 ?auto_545570 ) ) ( not ( = ?auto_545565 ?auto_545571 ) ) ( not ( = ?auto_545565 ?auto_545572 ) ) ( not ( = ?auto_545565 ?auto_545573 ) ) ( not ( = ?auto_545565 ?auto_545574 ) ) ( not ( = ?auto_545565 ?auto_545575 ) ) ( not ( = ?auto_545565 ?auto_545576 ) ) ( not ( = ?auto_545565 ?auto_545577 ) ) ( not ( = ?auto_545565 ?auto_545578 ) ) ( not ( = ?auto_545566 ?auto_545567 ) ) ( not ( = ?auto_545566 ?auto_545568 ) ) ( not ( = ?auto_545566 ?auto_545569 ) ) ( not ( = ?auto_545566 ?auto_545570 ) ) ( not ( = ?auto_545566 ?auto_545571 ) ) ( not ( = ?auto_545566 ?auto_545572 ) ) ( not ( = ?auto_545566 ?auto_545573 ) ) ( not ( = ?auto_545566 ?auto_545574 ) ) ( not ( = ?auto_545566 ?auto_545575 ) ) ( not ( = ?auto_545566 ?auto_545576 ) ) ( not ( = ?auto_545566 ?auto_545577 ) ) ( not ( = ?auto_545566 ?auto_545578 ) ) ( not ( = ?auto_545567 ?auto_545568 ) ) ( not ( = ?auto_545567 ?auto_545569 ) ) ( not ( = ?auto_545567 ?auto_545570 ) ) ( not ( = ?auto_545567 ?auto_545571 ) ) ( not ( = ?auto_545567 ?auto_545572 ) ) ( not ( = ?auto_545567 ?auto_545573 ) ) ( not ( = ?auto_545567 ?auto_545574 ) ) ( not ( = ?auto_545567 ?auto_545575 ) ) ( not ( = ?auto_545567 ?auto_545576 ) ) ( not ( = ?auto_545567 ?auto_545577 ) ) ( not ( = ?auto_545567 ?auto_545578 ) ) ( not ( = ?auto_545568 ?auto_545569 ) ) ( not ( = ?auto_545568 ?auto_545570 ) ) ( not ( = ?auto_545568 ?auto_545571 ) ) ( not ( = ?auto_545568 ?auto_545572 ) ) ( not ( = ?auto_545568 ?auto_545573 ) ) ( not ( = ?auto_545568 ?auto_545574 ) ) ( not ( = ?auto_545568 ?auto_545575 ) ) ( not ( = ?auto_545568 ?auto_545576 ) ) ( not ( = ?auto_545568 ?auto_545577 ) ) ( not ( = ?auto_545568 ?auto_545578 ) ) ( not ( = ?auto_545569 ?auto_545570 ) ) ( not ( = ?auto_545569 ?auto_545571 ) ) ( not ( = ?auto_545569 ?auto_545572 ) ) ( not ( = ?auto_545569 ?auto_545573 ) ) ( not ( = ?auto_545569 ?auto_545574 ) ) ( not ( = ?auto_545569 ?auto_545575 ) ) ( not ( = ?auto_545569 ?auto_545576 ) ) ( not ( = ?auto_545569 ?auto_545577 ) ) ( not ( = ?auto_545569 ?auto_545578 ) ) ( not ( = ?auto_545570 ?auto_545571 ) ) ( not ( = ?auto_545570 ?auto_545572 ) ) ( not ( = ?auto_545570 ?auto_545573 ) ) ( not ( = ?auto_545570 ?auto_545574 ) ) ( not ( = ?auto_545570 ?auto_545575 ) ) ( not ( = ?auto_545570 ?auto_545576 ) ) ( not ( = ?auto_545570 ?auto_545577 ) ) ( not ( = ?auto_545570 ?auto_545578 ) ) ( not ( = ?auto_545571 ?auto_545572 ) ) ( not ( = ?auto_545571 ?auto_545573 ) ) ( not ( = ?auto_545571 ?auto_545574 ) ) ( not ( = ?auto_545571 ?auto_545575 ) ) ( not ( = ?auto_545571 ?auto_545576 ) ) ( not ( = ?auto_545571 ?auto_545577 ) ) ( not ( = ?auto_545571 ?auto_545578 ) ) ( not ( = ?auto_545572 ?auto_545573 ) ) ( not ( = ?auto_545572 ?auto_545574 ) ) ( not ( = ?auto_545572 ?auto_545575 ) ) ( not ( = ?auto_545572 ?auto_545576 ) ) ( not ( = ?auto_545572 ?auto_545577 ) ) ( not ( = ?auto_545572 ?auto_545578 ) ) ( not ( = ?auto_545573 ?auto_545574 ) ) ( not ( = ?auto_545573 ?auto_545575 ) ) ( not ( = ?auto_545573 ?auto_545576 ) ) ( not ( = ?auto_545573 ?auto_545577 ) ) ( not ( = ?auto_545573 ?auto_545578 ) ) ( not ( = ?auto_545574 ?auto_545575 ) ) ( not ( = ?auto_545574 ?auto_545576 ) ) ( not ( = ?auto_545574 ?auto_545577 ) ) ( not ( = ?auto_545574 ?auto_545578 ) ) ( not ( = ?auto_545575 ?auto_545576 ) ) ( not ( = ?auto_545575 ?auto_545577 ) ) ( not ( = ?auto_545575 ?auto_545578 ) ) ( not ( = ?auto_545576 ?auto_545577 ) ) ( not ( = ?auto_545576 ?auto_545578 ) ) ( not ( = ?auto_545577 ?auto_545578 ) ) ( ON ?auto_545576 ?auto_545577 ) ( CLEAR ?auto_545574 ) ( ON ?auto_545575 ?auto_545576 ) ( CLEAR ?auto_545575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_545562 ?auto_545563 ?auto_545564 ?auto_545565 ?auto_545566 ?auto_545567 ?auto_545568 ?auto_545569 ?auto_545570 ?auto_545571 ?auto_545572 ?auto_545573 ?auto_545574 ?auto_545575 )
      ( MAKE-16PILE ?auto_545562 ?auto_545563 ?auto_545564 ?auto_545565 ?auto_545566 ?auto_545567 ?auto_545568 ?auto_545569 ?auto_545570 ?auto_545571 ?auto_545572 ?auto_545573 ?auto_545574 ?auto_545575 ?auto_545576 ?auto_545577 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545595 - BLOCK
      ?auto_545596 - BLOCK
      ?auto_545597 - BLOCK
      ?auto_545598 - BLOCK
      ?auto_545599 - BLOCK
      ?auto_545600 - BLOCK
      ?auto_545601 - BLOCK
      ?auto_545602 - BLOCK
      ?auto_545603 - BLOCK
      ?auto_545604 - BLOCK
      ?auto_545605 - BLOCK
      ?auto_545606 - BLOCK
      ?auto_545607 - BLOCK
      ?auto_545608 - BLOCK
      ?auto_545609 - BLOCK
      ?auto_545610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545610 ) ( ON-TABLE ?auto_545595 ) ( ON ?auto_545596 ?auto_545595 ) ( ON ?auto_545597 ?auto_545596 ) ( ON ?auto_545598 ?auto_545597 ) ( ON ?auto_545599 ?auto_545598 ) ( ON ?auto_545600 ?auto_545599 ) ( ON ?auto_545601 ?auto_545600 ) ( ON ?auto_545602 ?auto_545601 ) ( ON ?auto_545603 ?auto_545602 ) ( ON ?auto_545604 ?auto_545603 ) ( ON ?auto_545605 ?auto_545604 ) ( ON ?auto_545606 ?auto_545605 ) ( ON ?auto_545607 ?auto_545606 ) ( not ( = ?auto_545595 ?auto_545596 ) ) ( not ( = ?auto_545595 ?auto_545597 ) ) ( not ( = ?auto_545595 ?auto_545598 ) ) ( not ( = ?auto_545595 ?auto_545599 ) ) ( not ( = ?auto_545595 ?auto_545600 ) ) ( not ( = ?auto_545595 ?auto_545601 ) ) ( not ( = ?auto_545595 ?auto_545602 ) ) ( not ( = ?auto_545595 ?auto_545603 ) ) ( not ( = ?auto_545595 ?auto_545604 ) ) ( not ( = ?auto_545595 ?auto_545605 ) ) ( not ( = ?auto_545595 ?auto_545606 ) ) ( not ( = ?auto_545595 ?auto_545607 ) ) ( not ( = ?auto_545595 ?auto_545608 ) ) ( not ( = ?auto_545595 ?auto_545609 ) ) ( not ( = ?auto_545595 ?auto_545610 ) ) ( not ( = ?auto_545596 ?auto_545597 ) ) ( not ( = ?auto_545596 ?auto_545598 ) ) ( not ( = ?auto_545596 ?auto_545599 ) ) ( not ( = ?auto_545596 ?auto_545600 ) ) ( not ( = ?auto_545596 ?auto_545601 ) ) ( not ( = ?auto_545596 ?auto_545602 ) ) ( not ( = ?auto_545596 ?auto_545603 ) ) ( not ( = ?auto_545596 ?auto_545604 ) ) ( not ( = ?auto_545596 ?auto_545605 ) ) ( not ( = ?auto_545596 ?auto_545606 ) ) ( not ( = ?auto_545596 ?auto_545607 ) ) ( not ( = ?auto_545596 ?auto_545608 ) ) ( not ( = ?auto_545596 ?auto_545609 ) ) ( not ( = ?auto_545596 ?auto_545610 ) ) ( not ( = ?auto_545597 ?auto_545598 ) ) ( not ( = ?auto_545597 ?auto_545599 ) ) ( not ( = ?auto_545597 ?auto_545600 ) ) ( not ( = ?auto_545597 ?auto_545601 ) ) ( not ( = ?auto_545597 ?auto_545602 ) ) ( not ( = ?auto_545597 ?auto_545603 ) ) ( not ( = ?auto_545597 ?auto_545604 ) ) ( not ( = ?auto_545597 ?auto_545605 ) ) ( not ( = ?auto_545597 ?auto_545606 ) ) ( not ( = ?auto_545597 ?auto_545607 ) ) ( not ( = ?auto_545597 ?auto_545608 ) ) ( not ( = ?auto_545597 ?auto_545609 ) ) ( not ( = ?auto_545597 ?auto_545610 ) ) ( not ( = ?auto_545598 ?auto_545599 ) ) ( not ( = ?auto_545598 ?auto_545600 ) ) ( not ( = ?auto_545598 ?auto_545601 ) ) ( not ( = ?auto_545598 ?auto_545602 ) ) ( not ( = ?auto_545598 ?auto_545603 ) ) ( not ( = ?auto_545598 ?auto_545604 ) ) ( not ( = ?auto_545598 ?auto_545605 ) ) ( not ( = ?auto_545598 ?auto_545606 ) ) ( not ( = ?auto_545598 ?auto_545607 ) ) ( not ( = ?auto_545598 ?auto_545608 ) ) ( not ( = ?auto_545598 ?auto_545609 ) ) ( not ( = ?auto_545598 ?auto_545610 ) ) ( not ( = ?auto_545599 ?auto_545600 ) ) ( not ( = ?auto_545599 ?auto_545601 ) ) ( not ( = ?auto_545599 ?auto_545602 ) ) ( not ( = ?auto_545599 ?auto_545603 ) ) ( not ( = ?auto_545599 ?auto_545604 ) ) ( not ( = ?auto_545599 ?auto_545605 ) ) ( not ( = ?auto_545599 ?auto_545606 ) ) ( not ( = ?auto_545599 ?auto_545607 ) ) ( not ( = ?auto_545599 ?auto_545608 ) ) ( not ( = ?auto_545599 ?auto_545609 ) ) ( not ( = ?auto_545599 ?auto_545610 ) ) ( not ( = ?auto_545600 ?auto_545601 ) ) ( not ( = ?auto_545600 ?auto_545602 ) ) ( not ( = ?auto_545600 ?auto_545603 ) ) ( not ( = ?auto_545600 ?auto_545604 ) ) ( not ( = ?auto_545600 ?auto_545605 ) ) ( not ( = ?auto_545600 ?auto_545606 ) ) ( not ( = ?auto_545600 ?auto_545607 ) ) ( not ( = ?auto_545600 ?auto_545608 ) ) ( not ( = ?auto_545600 ?auto_545609 ) ) ( not ( = ?auto_545600 ?auto_545610 ) ) ( not ( = ?auto_545601 ?auto_545602 ) ) ( not ( = ?auto_545601 ?auto_545603 ) ) ( not ( = ?auto_545601 ?auto_545604 ) ) ( not ( = ?auto_545601 ?auto_545605 ) ) ( not ( = ?auto_545601 ?auto_545606 ) ) ( not ( = ?auto_545601 ?auto_545607 ) ) ( not ( = ?auto_545601 ?auto_545608 ) ) ( not ( = ?auto_545601 ?auto_545609 ) ) ( not ( = ?auto_545601 ?auto_545610 ) ) ( not ( = ?auto_545602 ?auto_545603 ) ) ( not ( = ?auto_545602 ?auto_545604 ) ) ( not ( = ?auto_545602 ?auto_545605 ) ) ( not ( = ?auto_545602 ?auto_545606 ) ) ( not ( = ?auto_545602 ?auto_545607 ) ) ( not ( = ?auto_545602 ?auto_545608 ) ) ( not ( = ?auto_545602 ?auto_545609 ) ) ( not ( = ?auto_545602 ?auto_545610 ) ) ( not ( = ?auto_545603 ?auto_545604 ) ) ( not ( = ?auto_545603 ?auto_545605 ) ) ( not ( = ?auto_545603 ?auto_545606 ) ) ( not ( = ?auto_545603 ?auto_545607 ) ) ( not ( = ?auto_545603 ?auto_545608 ) ) ( not ( = ?auto_545603 ?auto_545609 ) ) ( not ( = ?auto_545603 ?auto_545610 ) ) ( not ( = ?auto_545604 ?auto_545605 ) ) ( not ( = ?auto_545604 ?auto_545606 ) ) ( not ( = ?auto_545604 ?auto_545607 ) ) ( not ( = ?auto_545604 ?auto_545608 ) ) ( not ( = ?auto_545604 ?auto_545609 ) ) ( not ( = ?auto_545604 ?auto_545610 ) ) ( not ( = ?auto_545605 ?auto_545606 ) ) ( not ( = ?auto_545605 ?auto_545607 ) ) ( not ( = ?auto_545605 ?auto_545608 ) ) ( not ( = ?auto_545605 ?auto_545609 ) ) ( not ( = ?auto_545605 ?auto_545610 ) ) ( not ( = ?auto_545606 ?auto_545607 ) ) ( not ( = ?auto_545606 ?auto_545608 ) ) ( not ( = ?auto_545606 ?auto_545609 ) ) ( not ( = ?auto_545606 ?auto_545610 ) ) ( not ( = ?auto_545607 ?auto_545608 ) ) ( not ( = ?auto_545607 ?auto_545609 ) ) ( not ( = ?auto_545607 ?auto_545610 ) ) ( not ( = ?auto_545608 ?auto_545609 ) ) ( not ( = ?auto_545608 ?auto_545610 ) ) ( not ( = ?auto_545609 ?auto_545610 ) ) ( ON ?auto_545609 ?auto_545610 ) ( CLEAR ?auto_545607 ) ( ON ?auto_545608 ?auto_545609 ) ( CLEAR ?auto_545608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_545595 ?auto_545596 ?auto_545597 ?auto_545598 ?auto_545599 ?auto_545600 ?auto_545601 ?auto_545602 ?auto_545603 ?auto_545604 ?auto_545605 ?auto_545606 ?auto_545607 ?auto_545608 )
      ( MAKE-16PILE ?auto_545595 ?auto_545596 ?auto_545597 ?auto_545598 ?auto_545599 ?auto_545600 ?auto_545601 ?auto_545602 ?auto_545603 ?auto_545604 ?auto_545605 ?auto_545606 ?auto_545607 ?auto_545608 ?auto_545609 ?auto_545610 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545627 - BLOCK
      ?auto_545628 - BLOCK
      ?auto_545629 - BLOCK
      ?auto_545630 - BLOCK
      ?auto_545631 - BLOCK
      ?auto_545632 - BLOCK
      ?auto_545633 - BLOCK
      ?auto_545634 - BLOCK
      ?auto_545635 - BLOCK
      ?auto_545636 - BLOCK
      ?auto_545637 - BLOCK
      ?auto_545638 - BLOCK
      ?auto_545639 - BLOCK
      ?auto_545640 - BLOCK
      ?auto_545641 - BLOCK
      ?auto_545642 - BLOCK
    )
    :vars
    (
      ?auto_545643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545642 ?auto_545643 ) ( ON-TABLE ?auto_545627 ) ( ON ?auto_545628 ?auto_545627 ) ( ON ?auto_545629 ?auto_545628 ) ( ON ?auto_545630 ?auto_545629 ) ( ON ?auto_545631 ?auto_545630 ) ( ON ?auto_545632 ?auto_545631 ) ( ON ?auto_545633 ?auto_545632 ) ( ON ?auto_545634 ?auto_545633 ) ( ON ?auto_545635 ?auto_545634 ) ( ON ?auto_545636 ?auto_545635 ) ( ON ?auto_545637 ?auto_545636 ) ( ON ?auto_545638 ?auto_545637 ) ( not ( = ?auto_545627 ?auto_545628 ) ) ( not ( = ?auto_545627 ?auto_545629 ) ) ( not ( = ?auto_545627 ?auto_545630 ) ) ( not ( = ?auto_545627 ?auto_545631 ) ) ( not ( = ?auto_545627 ?auto_545632 ) ) ( not ( = ?auto_545627 ?auto_545633 ) ) ( not ( = ?auto_545627 ?auto_545634 ) ) ( not ( = ?auto_545627 ?auto_545635 ) ) ( not ( = ?auto_545627 ?auto_545636 ) ) ( not ( = ?auto_545627 ?auto_545637 ) ) ( not ( = ?auto_545627 ?auto_545638 ) ) ( not ( = ?auto_545627 ?auto_545639 ) ) ( not ( = ?auto_545627 ?auto_545640 ) ) ( not ( = ?auto_545627 ?auto_545641 ) ) ( not ( = ?auto_545627 ?auto_545642 ) ) ( not ( = ?auto_545627 ?auto_545643 ) ) ( not ( = ?auto_545628 ?auto_545629 ) ) ( not ( = ?auto_545628 ?auto_545630 ) ) ( not ( = ?auto_545628 ?auto_545631 ) ) ( not ( = ?auto_545628 ?auto_545632 ) ) ( not ( = ?auto_545628 ?auto_545633 ) ) ( not ( = ?auto_545628 ?auto_545634 ) ) ( not ( = ?auto_545628 ?auto_545635 ) ) ( not ( = ?auto_545628 ?auto_545636 ) ) ( not ( = ?auto_545628 ?auto_545637 ) ) ( not ( = ?auto_545628 ?auto_545638 ) ) ( not ( = ?auto_545628 ?auto_545639 ) ) ( not ( = ?auto_545628 ?auto_545640 ) ) ( not ( = ?auto_545628 ?auto_545641 ) ) ( not ( = ?auto_545628 ?auto_545642 ) ) ( not ( = ?auto_545628 ?auto_545643 ) ) ( not ( = ?auto_545629 ?auto_545630 ) ) ( not ( = ?auto_545629 ?auto_545631 ) ) ( not ( = ?auto_545629 ?auto_545632 ) ) ( not ( = ?auto_545629 ?auto_545633 ) ) ( not ( = ?auto_545629 ?auto_545634 ) ) ( not ( = ?auto_545629 ?auto_545635 ) ) ( not ( = ?auto_545629 ?auto_545636 ) ) ( not ( = ?auto_545629 ?auto_545637 ) ) ( not ( = ?auto_545629 ?auto_545638 ) ) ( not ( = ?auto_545629 ?auto_545639 ) ) ( not ( = ?auto_545629 ?auto_545640 ) ) ( not ( = ?auto_545629 ?auto_545641 ) ) ( not ( = ?auto_545629 ?auto_545642 ) ) ( not ( = ?auto_545629 ?auto_545643 ) ) ( not ( = ?auto_545630 ?auto_545631 ) ) ( not ( = ?auto_545630 ?auto_545632 ) ) ( not ( = ?auto_545630 ?auto_545633 ) ) ( not ( = ?auto_545630 ?auto_545634 ) ) ( not ( = ?auto_545630 ?auto_545635 ) ) ( not ( = ?auto_545630 ?auto_545636 ) ) ( not ( = ?auto_545630 ?auto_545637 ) ) ( not ( = ?auto_545630 ?auto_545638 ) ) ( not ( = ?auto_545630 ?auto_545639 ) ) ( not ( = ?auto_545630 ?auto_545640 ) ) ( not ( = ?auto_545630 ?auto_545641 ) ) ( not ( = ?auto_545630 ?auto_545642 ) ) ( not ( = ?auto_545630 ?auto_545643 ) ) ( not ( = ?auto_545631 ?auto_545632 ) ) ( not ( = ?auto_545631 ?auto_545633 ) ) ( not ( = ?auto_545631 ?auto_545634 ) ) ( not ( = ?auto_545631 ?auto_545635 ) ) ( not ( = ?auto_545631 ?auto_545636 ) ) ( not ( = ?auto_545631 ?auto_545637 ) ) ( not ( = ?auto_545631 ?auto_545638 ) ) ( not ( = ?auto_545631 ?auto_545639 ) ) ( not ( = ?auto_545631 ?auto_545640 ) ) ( not ( = ?auto_545631 ?auto_545641 ) ) ( not ( = ?auto_545631 ?auto_545642 ) ) ( not ( = ?auto_545631 ?auto_545643 ) ) ( not ( = ?auto_545632 ?auto_545633 ) ) ( not ( = ?auto_545632 ?auto_545634 ) ) ( not ( = ?auto_545632 ?auto_545635 ) ) ( not ( = ?auto_545632 ?auto_545636 ) ) ( not ( = ?auto_545632 ?auto_545637 ) ) ( not ( = ?auto_545632 ?auto_545638 ) ) ( not ( = ?auto_545632 ?auto_545639 ) ) ( not ( = ?auto_545632 ?auto_545640 ) ) ( not ( = ?auto_545632 ?auto_545641 ) ) ( not ( = ?auto_545632 ?auto_545642 ) ) ( not ( = ?auto_545632 ?auto_545643 ) ) ( not ( = ?auto_545633 ?auto_545634 ) ) ( not ( = ?auto_545633 ?auto_545635 ) ) ( not ( = ?auto_545633 ?auto_545636 ) ) ( not ( = ?auto_545633 ?auto_545637 ) ) ( not ( = ?auto_545633 ?auto_545638 ) ) ( not ( = ?auto_545633 ?auto_545639 ) ) ( not ( = ?auto_545633 ?auto_545640 ) ) ( not ( = ?auto_545633 ?auto_545641 ) ) ( not ( = ?auto_545633 ?auto_545642 ) ) ( not ( = ?auto_545633 ?auto_545643 ) ) ( not ( = ?auto_545634 ?auto_545635 ) ) ( not ( = ?auto_545634 ?auto_545636 ) ) ( not ( = ?auto_545634 ?auto_545637 ) ) ( not ( = ?auto_545634 ?auto_545638 ) ) ( not ( = ?auto_545634 ?auto_545639 ) ) ( not ( = ?auto_545634 ?auto_545640 ) ) ( not ( = ?auto_545634 ?auto_545641 ) ) ( not ( = ?auto_545634 ?auto_545642 ) ) ( not ( = ?auto_545634 ?auto_545643 ) ) ( not ( = ?auto_545635 ?auto_545636 ) ) ( not ( = ?auto_545635 ?auto_545637 ) ) ( not ( = ?auto_545635 ?auto_545638 ) ) ( not ( = ?auto_545635 ?auto_545639 ) ) ( not ( = ?auto_545635 ?auto_545640 ) ) ( not ( = ?auto_545635 ?auto_545641 ) ) ( not ( = ?auto_545635 ?auto_545642 ) ) ( not ( = ?auto_545635 ?auto_545643 ) ) ( not ( = ?auto_545636 ?auto_545637 ) ) ( not ( = ?auto_545636 ?auto_545638 ) ) ( not ( = ?auto_545636 ?auto_545639 ) ) ( not ( = ?auto_545636 ?auto_545640 ) ) ( not ( = ?auto_545636 ?auto_545641 ) ) ( not ( = ?auto_545636 ?auto_545642 ) ) ( not ( = ?auto_545636 ?auto_545643 ) ) ( not ( = ?auto_545637 ?auto_545638 ) ) ( not ( = ?auto_545637 ?auto_545639 ) ) ( not ( = ?auto_545637 ?auto_545640 ) ) ( not ( = ?auto_545637 ?auto_545641 ) ) ( not ( = ?auto_545637 ?auto_545642 ) ) ( not ( = ?auto_545637 ?auto_545643 ) ) ( not ( = ?auto_545638 ?auto_545639 ) ) ( not ( = ?auto_545638 ?auto_545640 ) ) ( not ( = ?auto_545638 ?auto_545641 ) ) ( not ( = ?auto_545638 ?auto_545642 ) ) ( not ( = ?auto_545638 ?auto_545643 ) ) ( not ( = ?auto_545639 ?auto_545640 ) ) ( not ( = ?auto_545639 ?auto_545641 ) ) ( not ( = ?auto_545639 ?auto_545642 ) ) ( not ( = ?auto_545639 ?auto_545643 ) ) ( not ( = ?auto_545640 ?auto_545641 ) ) ( not ( = ?auto_545640 ?auto_545642 ) ) ( not ( = ?auto_545640 ?auto_545643 ) ) ( not ( = ?auto_545641 ?auto_545642 ) ) ( not ( = ?auto_545641 ?auto_545643 ) ) ( not ( = ?auto_545642 ?auto_545643 ) ) ( ON ?auto_545641 ?auto_545642 ) ( ON ?auto_545640 ?auto_545641 ) ( CLEAR ?auto_545638 ) ( ON ?auto_545639 ?auto_545640 ) ( CLEAR ?auto_545639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_545627 ?auto_545628 ?auto_545629 ?auto_545630 ?auto_545631 ?auto_545632 ?auto_545633 ?auto_545634 ?auto_545635 ?auto_545636 ?auto_545637 ?auto_545638 ?auto_545639 )
      ( MAKE-16PILE ?auto_545627 ?auto_545628 ?auto_545629 ?auto_545630 ?auto_545631 ?auto_545632 ?auto_545633 ?auto_545634 ?auto_545635 ?auto_545636 ?auto_545637 ?auto_545638 ?auto_545639 ?auto_545640 ?auto_545641 ?auto_545642 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545660 - BLOCK
      ?auto_545661 - BLOCK
      ?auto_545662 - BLOCK
      ?auto_545663 - BLOCK
      ?auto_545664 - BLOCK
      ?auto_545665 - BLOCK
      ?auto_545666 - BLOCK
      ?auto_545667 - BLOCK
      ?auto_545668 - BLOCK
      ?auto_545669 - BLOCK
      ?auto_545670 - BLOCK
      ?auto_545671 - BLOCK
      ?auto_545672 - BLOCK
      ?auto_545673 - BLOCK
      ?auto_545674 - BLOCK
      ?auto_545675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545675 ) ( ON-TABLE ?auto_545660 ) ( ON ?auto_545661 ?auto_545660 ) ( ON ?auto_545662 ?auto_545661 ) ( ON ?auto_545663 ?auto_545662 ) ( ON ?auto_545664 ?auto_545663 ) ( ON ?auto_545665 ?auto_545664 ) ( ON ?auto_545666 ?auto_545665 ) ( ON ?auto_545667 ?auto_545666 ) ( ON ?auto_545668 ?auto_545667 ) ( ON ?auto_545669 ?auto_545668 ) ( ON ?auto_545670 ?auto_545669 ) ( ON ?auto_545671 ?auto_545670 ) ( not ( = ?auto_545660 ?auto_545661 ) ) ( not ( = ?auto_545660 ?auto_545662 ) ) ( not ( = ?auto_545660 ?auto_545663 ) ) ( not ( = ?auto_545660 ?auto_545664 ) ) ( not ( = ?auto_545660 ?auto_545665 ) ) ( not ( = ?auto_545660 ?auto_545666 ) ) ( not ( = ?auto_545660 ?auto_545667 ) ) ( not ( = ?auto_545660 ?auto_545668 ) ) ( not ( = ?auto_545660 ?auto_545669 ) ) ( not ( = ?auto_545660 ?auto_545670 ) ) ( not ( = ?auto_545660 ?auto_545671 ) ) ( not ( = ?auto_545660 ?auto_545672 ) ) ( not ( = ?auto_545660 ?auto_545673 ) ) ( not ( = ?auto_545660 ?auto_545674 ) ) ( not ( = ?auto_545660 ?auto_545675 ) ) ( not ( = ?auto_545661 ?auto_545662 ) ) ( not ( = ?auto_545661 ?auto_545663 ) ) ( not ( = ?auto_545661 ?auto_545664 ) ) ( not ( = ?auto_545661 ?auto_545665 ) ) ( not ( = ?auto_545661 ?auto_545666 ) ) ( not ( = ?auto_545661 ?auto_545667 ) ) ( not ( = ?auto_545661 ?auto_545668 ) ) ( not ( = ?auto_545661 ?auto_545669 ) ) ( not ( = ?auto_545661 ?auto_545670 ) ) ( not ( = ?auto_545661 ?auto_545671 ) ) ( not ( = ?auto_545661 ?auto_545672 ) ) ( not ( = ?auto_545661 ?auto_545673 ) ) ( not ( = ?auto_545661 ?auto_545674 ) ) ( not ( = ?auto_545661 ?auto_545675 ) ) ( not ( = ?auto_545662 ?auto_545663 ) ) ( not ( = ?auto_545662 ?auto_545664 ) ) ( not ( = ?auto_545662 ?auto_545665 ) ) ( not ( = ?auto_545662 ?auto_545666 ) ) ( not ( = ?auto_545662 ?auto_545667 ) ) ( not ( = ?auto_545662 ?auto_545668 ) ) ( not ( = ?auto_545662 ?auto_545669 ) ) ( not ( = ?auto_545662 ?auto_545670 ) ) ( not ( = ?auto_545662 ?auto_545671 ) ) ( not ( = ?auto_545662 ?auto_545672 ) ) ( not ( = ?auto_545662 ?auto_545673 ) ) ( not ( = ?auto_545662 ?auto_545674 ) ) ( not ( = ?auto_545662 ?auto_545675 ) ) ( not ( = ?auto_545663 ?auto_545664 ) ) ( not ( = ?auto_545663 ?auto_545665 ) ) ( not ( = ?auto_545663 ?auto_545666 ) ) ( not ( = ?auto_545663 ?auto_545667 ) ) ( not ( = ?auto_545663 ?auto_545668 ) ) ( not ( = ?auto_545663 ?auto_545669 ) ) ( not ( = ?auto_545663 ?auto_545670 ) ) ( not ( = ?auto_545663 ?auto_545671 ) ) ( not ( = ?auto_545663 ?auto_545672 ) ) ( not ( = ?auto_545663 ?auto_545673 ) ) ( not ( = ?auto_545663 ?auto_545674 ) ) ( not ( = ?auto_545663 ?auto_545675 ) ) ( not ( = ?auto_545664 ?auto_545665 ) ) ( not ( = ?auto_545664 ?auto_545666 ) ) ( not ( = ?auto_545664 ?auto_545667 ) ) ( not ( = ?auto_545664 ?auto_545668 ) ) ( not ( = ?auto_545664 ?auto_545669 ) ) ( not ( = ?auto_545664 ?auto_545670 ) ) ( not ( = ?auto_545664 ?auto_545671 ) ) ( not ( = ?auto_545664 ?auto_545672 ) ) ( not ( = ?auto_545664 ?auto_545673 ) ) ( not ( = ?auto_545664 ?auto_545674 ) ) ( not ( = ?auto_545664 ?auto_545675 ) ) ( not ( = ?auto_545665 ?auto_545666 ) ) ( not ( = ?auto_545665 ?auto_545667 ) ) ( not ( = ?auto_545665 ?auto_545668 ) ) ( not ( = ?auto_545665 ?auto_545669 ) ) ( not ( = ?auto_545665 ?auto_545670 ) ) ( not ( = ?auto_545665 ?auto_545671 ) ) ( not ( = ?auto_545665 ?auto_545672 ) ) ( not ( = ?auto_545665 ?auto_545673 ) ) ( not ( = ?auto_545665 ?auto_545674 ) ) ( not ( = ?auto_545665 ?auto_545675 ) ) ( not ( = ?auto_545666 ?auto_545667 ) ) ( not ( = ?auto_545666 ?auto_545668 ) ) ( not ( = ?auto_545666 ?auto_545669 ) ) ( not ( = ?auto_545666 ?auto_545670 ) ) ( not ( = ?auto_545666 ?auto_545671 ) ) ( not ( = ?auto_545666 ?auto_545672 ) ) ( not ( = ?auto_545666 ?auto_545673 ) ) ( not ( = ?auto_545666 ?auto_545674 ) ) ( not ( = ?auto_545666 ?auto_545675 ) ) ( not ( = ?auto_545667 ?auto_545668 ) ) ( not ( = ?auto_545667 ?auto_545669 ) ) ( not ( = ?auto_545667 ?auto_545670 ) ) ( not ( = ?auto_545667 ?auto_545671 ) ) ( not ( = ?auto_545667 ?auto_545672 ) ) ( not ( = ?auto_545667 ?auto_545673 ) ) ( not ( = ?auto_545667 ?auto_545674 ) ) ( not ( = ?auto_545667 ?auto_545675 ) ) ( not ( = ?auto_545668 ?auto_545669 ) ) ( not ( = ?auto_545668 ?auto_545670 ) ) ( not ( = ?auto_545668 ?auto_545671 ) ) ( not ( = ?auto_545668 ?auto_545672 ) ) ( not ( = ?auto_545668 ?auto_545673 ) ) ( not ( = ?auto_545668 ?auto_545674 ) ) ( not ( = ?auto_545668 ?auto_545675 ) ) ( not ( = ?auto_545669 ?auto_545670 ) ) ( not ( = ?auto_545669 ?auto_545671 ) ) ( not ( = ?auto_545669 ?auto_545672 ) ) ( not ( = ?auto_545669 ?auto_545673 ) ) ( not ( = ?auto_545669 ?auto_545674 ) ) ( not ( = ?auto_545669 ?auto_545675 ) ) ( not ( = ?auto_545670 ?auto_545671 ) ) ( not ( = ?auto_545670 ?auto_545672 ) ) ( not ( = ?auto_545670 ?auto_545673 ) ) ( not ( = ?auto_545670 ?auto_545674 ) ) ( not ( = ?auto_545670 ?auto_545675 ) ) ( not ( = ?auto_545671 ?auto_545672 ) ) ( not ( = ?auto_545671 ?auto_545673 ) ) ( not ( = ?auto_545671 ?auto_545674 ) ) ( not ( = ?auto_545671 ?auto_545675 ) ) ( not ( = ?auto_545672 ?auto_545673 ) ) ( not ( = ?auto_545672 ?auto_545674 ) ) ( not ( = ?auto_545672 ?auto_545675 ) ) ( not ( = ?auto_545673 ?auto_545674 ) ) ( not ( = ?auto_545673 ?auto_545675 ) ) ( not ( = ?auto_545674 ?auto_545675 ) ) ( ON ?auto_545674 ?auto_545675 ) ( ON ?auto_545673 ?auto_545674 ) ( CLEAR ?auto_545671 ) ( ON ?auto_545672 ?auto_545673 ) ( CLEAR ?auto_545672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_545660 ?auto_545661 ?auto_545662 ?auto_545663 ?auto_545664 ?auto_545665 ?auto_545666 ?auto_545667 ?auto_545668 ?auto_545669 ?auto_545670 ?auto_545671 ?auto_545672 )
      ( MAKE-16PILE ?auto_545660 ?auto_545661 ?auto_545662 ?auto_545663 ?auto_545664 ?auto_545665 ?auto_545666 ?auto_545667 ?auto_545668 ?auto_545669 ?auto_545670 ?auto_545671 ?auto_545672 ?auto_545673 ?auto_545674 ?auto_545675 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545692 - BLOCK
      ?auto_545693 - BLOCK
      ?auto_545694 - BLOCK
      ?auto_545695 - BLOCK
      ?auto_545696 - BLOCK
      ?auto_545697 - BLOCK
      ?auto_545698 - BLOCK
      ?auto_545699 - BLOCK
      ?auto_545700 - BLOCK
      ?auto_545701 - BLOCK
      ?auto_545702 - BLOCK
      ?auto_545703 - BLOCK
      ?auto_545704 - BLOCK
      ?auto_545705 - BLOCK
      ?auto_545706 - BLOCK
      ?auto_545707 - BLOCK
    )
    :vars
    (
      ?auto_545708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545707 ?auto_545708 ) ( ON-TABLE ?auto_545692 ) ( ON ?auto_545693 ?auto_545692 ) ( ON ?auto_545694 ?auto_545693 ) ( ON ?auto_545695 ?auto_545694 ) ( ON ?auto_545696 ?auto_545695 ) ( ON ?auto_545697 ?auto_545696 ) ( ON ?auto_545698 ?auto_545697 ) ( ON ?auto_545699 ?auto_545698 ) ( ON ?auto_545700 ?auto_545699 ) ( ON ?auto_545701 ?auto_545700 ) ( ON ?auto_545702 ?auto_545701 ) ( not ( = ?auto_545692 ?auto_545693 ) ) ( not ( = ?auto_545692 ?auto_545694 ) ) ( not ( = ?auto_545692 ?auto_545695 ) ) ( not ( = ?auto_545692 ?auto_545696 ) ) ( not ( = ?auto_545692 ?auto_545697 ) ) ( not ( = ?auto_545692 ?auto_545698 ) ) ( not ( = ?auto_545692 ?auto_545699 ) ) ( not ( = ?auto_545692 ?auto_545700 ) ) ( not ( = ?auto_545692 ?auto_545701 ) ) ( not ( = ?auto_545692 ?auto_545702 ) ) ( not ( = ?auto_545692 ?auto_545703 ) ) ( not ( = ?auto_545692 ?auto_545704 ) ) ( not ( = ?auto_545692 ?auto_545705 ) ) ( not ( = ?auto_545692 ?auto_545706 ) ) ( not ( = ?auto_545692 ?auto_545707 ) ) ( not ( = ?auto_545692 ?auto_545708 ) ) ( not ( = ?auto_545693 ?auto_545694 ) ) ( not ( = ?auto_545693 ?auto_545695 ) ) ( not ( = ?auto_545693 ?auto_545696 ) ) ( not ( = ?auto_545693 ?auto_545697 ) ) ( not ( = ?auto_545693 ?auto_545698 ) ) ( not ( = ?auto_545693 ?auto_545699 ) ) ( not ( = ?auto_545693 ?auto_545700 ) ) ( not ( = ?auto_545693 ?auto_545701 ) ) ( not ( = ?auto_545693 ?auto_545702 ) ) ( not ( = ?auto_545693 ?auto_545703 ) ) ( not ( = ?auto_545693 ?auto_545704 ) ) ( not ( = ?auto_545693 ?auto_545705 ) ) ( not ( = ?auto_545693 ?auto_545706 ) ) ( not ( = ?auto_545693 ?auto_545707 ) ) ( not ( = ?auto_545693 ?auto_545708 ) ) ( not ( = ?auto_545694 ?auto_545695 ) ) ( not ( = ?auto_545694 ?auto_545696 ) ) ( not ( = ?auto_545694 ?auto_545697 ) ) ( not ( = ?auto_545694 ?auto_545698 ) ) ( not ( = ?auto_545694 ?auto_545699 ) ) ( not ( = ?auto_545694 ?auto_545700 ) ) ( not ( = ?auto_545694 ?auto_545701 ) ) ( not ( = ?auto_545694 ?auto_545702 ) ) ( not ( = ?auto_545694 ?auto_545703 ) ) ( not ( = ?auto_545694 ?auto_545704 ) ) ( not ( = ?auto_545694 ?auto_545705 ) ) ( not ( = ?auto_545694 ?auto_545706 ) ) ( not ( = ?auto_545694 ?auto_545707 ) ) ( not ( = ?auto_545694 ?auto_545708 ) ) ( not ( = ?auto_545695 ?auto_545696 ) ) ( not ( = ?auto_545695 ?auto_545697 ) ) ( not ( = ?auto_545695 ?auto_545698 ) ) ( not ( = ?auto_545695 ?auto_545699 ) ) ( not ( = ?auto_545695 ?auto_545700 ) ) ( not ( = ?auto_545695 ?auto_545701 ) ) ( not ( = ?auto_545695 ?auto_545702 ) ) ( not ( = ?auto_545695 ?auto_545703 ) ) ( not ( = ?auto_545695 ?auto_545704 ) ) ( not ( = ?auto_545695 ?auto_545705 ) ) ( not ( = ?auto_545695 ?auto_545706 ) ) ( not ( = ?auto_545695 ?auto_545707 ) ) ( not ( = ?auto_545695 ?auto_545708 ) ) ( not ( = ?auto_545696 ?auto_545697 ) ) ( not ( = ?auto_545696 ?auto_545698 ) ) ( not ( = ?auto_545696 ?auto_545699 ) ) ( not ( = ?auto_545696 ?auto_545700 ) ) ( not ( = ?auto_545696 ?auto_545701 ) ) ( not ( = ?auto_545696 ?auto_545702 ) ) ( not ( = ?auto_545696 ?auto_545703 ) ) ( not ( = ?auto_545696 ?auto_545704 ) ) ( not ( = ?auto_545696 ?auto_545705 ) ) ( not ( = ?auto_545696 ?auto_545706 ) ) ( not ( = ?auto_545696 ?auto_545707 ) ) ( not ( = ?auto_545696 ?auto_545708 ) ) ( not ( = ?auto_545697 ?auto_545698 ) ) ( not ( = ?auto_545697 ?auto_545699 ) ) ( not ( = ?auto_545697 ?auto_545700 ) ) ( not ( = ?auto_545697 ?auto_545701 ) ) ( not ( = ?auto_545697 ?auto_545702 ) ) ( not ( = ?auto_545697 ?auto_545703 ) ) ( not ( = ?auto_545697 ?auto_545704 ) ) ( not ( = ?auto_545697 ?auto_545705 ) ) ( not ( = ?auto_545697 ?auto_545706 ) ) ( not ( = ?auto_545697 ?auto_545707 ) ) ( not ( = ?auto_545697 ?auto_545708 ) ) ( not ( = ?auto_545698 ?auto_545699 ) ) ( not ( = ?auto_545698 ?auto_545700 ) ) ( not ( = ?auto_545698 ?auto_545701 ) ) ( not ( = ?auto_545698 ?auto_545702 ) ) ( not ( = ?auto_545698 ?auto_545703 ) ) ( not ( = ?auto_545698 ?auto_545704 ) ) ( not ( = ?auto_545698 ?auto_545705 ) ) ( not ( = ?auto_545698 ?auto_545706 ) ) ( not ( = ?auto_545698 ?auto_545707 ) ) ( not ( = ?auto_545698 ?auto_545708 ) ) ( not ( = ?auto_545699 ?auto_545700 ) ) ( not ( = ?auto_545699 ?auto_545701 ) ) ( not ( = ?auto_545699 ?auto_545702 ) ) ( not ( = ?auto_545699 ?auto_545703 ) ) ( not ( = ?auto_545699 ?auto_545704 ) ) ( not ( = ?auto_545699 ?auto_545705 ) ) ( not ( = ?auto_545699 ?auto_545706 ) ) ( not ( = ?auto_545699 ?auto_545707 ) ) ( not ( = ?auto_545699 ?auto_545708 ) ) ( not ( = ?auto_545700 ?auto_545701 ) ) ( not ( = ?auto_545700 ?auto_545702 ) ) ( not ( = ?auto_545700 ?auto_545703 ) ) ( not ( = ?auto_545700 ?auto_545704 ) ) ( not ( = ?auto_545700 ?auto_545705 ) ) ( not ( = ?auto_545700 ?auto_545706 ) ) ( not ( = ?auto_545700 ?auto_545707 ) ) ( not ( = ?auto_545700 ?auto_545708 ) ) ( not ( = ?auto_545701 ?auto_545702 ) ) ( not ( = ?auto_545701 ?auto_545703 ) ) ( not ( = ?auto_545701 ?auto_545704 ) ) ( not ( = ?auto_545701 ?auto_545705 ) ) ( not ( = ?auto_545701 ?auto_545706 ) ) ( not ( = ?auto_545701 ?auto_545707 ) ) ( not ( = ?auto_545701 ?auto_545708 ) ) ( not ( = ?auto_545702 ?auto_545703 ) ) ( not ( = ?auto_545702 ?auto_545704 ) ) ( not ( = ?auto_545702 ?auto_545705 ) ) ( not ( = ?auto_545702 ?auto_545706 ) ) ( not ( = ?auto_545702 ?auto_545707 ) ) ( not ( = ?auto_545702 ?auto_545708 ) ) ( not ( = ?auto_545703 ?auto_545704 ) ) ( not ( = ?auto_545703 ?auto_545705 ) ) ( not ( = ?auto_545703 ?auto_545706 ) ) ( not ( = ?auto_545703 ?auto_545707 ) ) ( not ( = ?auto_545703 ?auto_545708 ) ) ( not ( = ?auto_545704 ?auto_545705 ) ) ( not ( = ?auto_545704 ?auto_545706 ) ) ( not ( = ?auto_545704 ?auto_545707 ) ) ( not ( = ?auto_545704 ?auto_545708 ) ) ( not ( = ?auto_545705 ?auto_545706 ) ) ( not ( = ?auto_545705 ?auto_545707 ) ) ( not ( = ?auto_545705 ?auto_545708 ) ) ( not ( = ?auto_545706 ?auto_545707 ) ) ( not ( = ?auto_545706 ?auto_545708 ) ) ( not ( = ?auto_545707 ?auto_545708 ) ) ( ON ?auto_545706 ?auto_545707 ) ( ON ?auto_545705 ?auto_545706 ) ( ON ?auto_545704 ?auto_545705 ) ( CLEAR ?auto_545702 ) ( ON ?auto_545703 ?auto_545704 ) ( CLEAR ?auto_545703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_545692 ?auto_545693 ?auto_545694 ?auto_545695 ?auto_545696 ?auto_545697 ?auto_545698 ?auto_545699 ?auto_545700 ?auto_545701 ?auto_545702 ?auto_545703 )
      ( MAKE-16PILE ?auto_545692 ?auto_545693 ?auto_545694 ?auto_545695 ?auto_545696 ?auto_545697 ?auto_545698 ?auto_545699 ?auto_545700 ?auto_545701 ?auto_545702 ?auto_545703 ?auto_545704 ?auto_545705 ?auto_545706 ?auto_545707 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545725 - BLOCK
      ?auto_545726 - BLOCK
      ?auto_545727 - BLOCK
      ?auto_545728 - BLOCK
      ?auto_545729 - BLOCK
      ?auto_545730 - BLOCK
      ?auto_545731 - BLOCK
      ?auto_545732 - BLOCK
      ?auto_545733 - BLOCK
      ?auto_545734 - BLOCK
      ?auto_545735 - BLOCK
      ?auto_545736 - BLOCK
      ?auto_545737 - BLOCK
      ?auto_545738 - BLOCK
      ?auto_545739 - BLOCK
      ?auto_545740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545740 ) ( ON-TABLE ?auto_545725 ) ( ON ?auto_545726 ?auto_545725 ) ( ON ?auto_545727 ?auto_545726 ) ( ON ?auto_545728 ?auto_545727 ) ( ON ?auto_545729 ?auto_545728 ) ( ON ?auto_545730 ?auto_545729 ) ( ON ?auto_545731 ?auto_545730 ) ( ON ?auto_545732 ?auto_545731 ) ( ON ?auto_545733 ?auto_545732 ) ( ON ?auto_545734 ?auto_545733 ) ( ON ?auto_545735 ?auto_545734 ) ( not ( = ?auto_545725 ?auto_545726 ) ) ( not ( = ?auto_545725 ?auto_545727 ) ) ( not ( = ?auto_545725 ?auto_545728 ) ) ( not ( = ?auto_545725 ?auto_545729 ) ) ( not ( = ?auto_545725 ?auto_545730 ) ) ( not ( = ?auto_545725 ?auto_545731 ) ) ( not ( = ?auto_545725 ?auto_545732 ) ) ( not ( = ?auto_545725 ?auto_545733 ) ) ( not ( = ?auto_545725 ?auto_545734 ) ) ( not ( = ?auto_545725 ?auto_545735 ) ) ( not ( = ?auto_545725 ?auto_545736 ) ) ( not ( = ?auto_545725 ?auto_545737 ) ) ( not ( = ?auto_545725 ?auto_545738 ) ) ( not ( = ?auto_545725 ?auto_545739 ) ) ( not ( = ?auto_545725 ?auto_545740 ) ) ( not ( = ?auto_545726 ?auto_545727 ) ) ( not ( = ?auto_545726 ?auto_545728 ) ) ( not ( = ?auto_545726 ?auto_545729 ) ) ( not ( = ?auto_545726 ?auto_545730 ) ) ( not ( = ?auto_545726 ?auto_545731 ) ) ( not ( = ?auto_545726 ?auto_545732 ) ) ( not ( = ?auto_545726 ?auto_545733 ) ) ( not ( = ?auto_545726 ?auto_545734 ) ) ( not ( = ?auto_545726 ?auto_545735 ) ) ( not ( = ?auto_545726 ?auto_545736 ) ) ( not ( = ?auto_545726 ?auto_545737 ) ) ( not ( = ?auto_545726 ?auto_545738 ) ) ( not ( = ?auto_545726 ?auto_545739 ) ) ( not ( = ?auto_545726 ?auto_545740 ) ) ( not ( = ?auto_545727 ?auto_545728 ) ) ( not ( = ?auto_545727 ?auto_545729 ) ) ( not ( = ?auto_545727 ?auto_545730 ) ) ( not ( = ?auto_545727 ?auto_545731 ) ) ( not ( = ?auto_545727 ?auto_545732 ) ) ( not ( = ?auto_545727 ?auto_545733 ) ) ( not ( = ?auto_545727 ?auto_545734 ) ) ( not ( = ?auto_545727 ?auto_545735 ) ) ( not ( = ?auto_545727 ?auto_545736 ) ) ( not ( = ?auto_545727 ?auto_545737 ) ) ( not ( = ?auto_545727 ?auto_545738 ) ) ( not ( = ?auto_545727 ?auto_545739 ) ) ( not ( = ?auto_545727 ?auto_545740 ) ) ( not ( = ?auto_545728 ?auto_545729 ) ) ( not ( = ?auto_545728 ?auto_545730 ) ) ( not ( = ?auto_545728 ?auto_545731 ) ) ( not ( = ?auto_545728 ?auto_545732 ) ) ( not ( = ?auto_545728 ?auto_545733 ) ) ( not ( = ?auto_545728 ?auto_545734 ) ) ( not ( = ?auto_545728 ?auto_545735 ) ) ( not ( = ?auto_545728 ?auto_545736 ) ) ( not ( = ?auto_545728 ?auto_545737 ) ) ( not ( = ?auto_545728 ?auto_545738 ) ) ( not ( = ?auto_545728 ?auto_545739 ) ) ( not ( = ?auto_545728 ?auto_545740 ) ) ( not ( = ?auto_545729 ?auto_545730 ) ) ( not ( = ?auto_545729 ?auto_545731 ) ) ( not ( = ?auto_545729 ?auto_545732 ) ) ( not ( = ?auto_545729 ?auto_545733 ) ) ( not ( = ?auto_545729 ?auto_545734 ) ) ( not ( = ?auto_545729 ?auto_545735 ) ) ( not ( = ?auto_545729 ?auto_545736 ) ) ( not ( = ?auto_545729 ?auto_545737 ) ) ( not ( = ?auto_545729 ?auto_545738 ) ) ( not ( = ?auto_545729 ?auto_545739 ) ) ( not ( = ?auto_545729 ?auto_545740 ) ) ( not ( = ?auto_545730 ?auto_545731 ) ) ( not ( = ?auto_545730 ?auto_545732 ) ) ( not ( = ?auto_545730 ?auto_545733 ) ) ( not ( = ?auto_545730 ?auto_545734 ) ) ( not ( = ?auto_545730 ?auto_545735 ) ) ( not ( = ?auto_545730 ?auto_545736 ) ) ( not ( = ?auto_545730 ?auto_545737 ) ) ( not ( = ?auto_545730 ?auto_545738 ) ) ( not ( = ?auto_545730 ?auto_545739 ) ) ( not ( = ?auto_545730 ?auto_545740 ) ) ( not ( = ?auto_545731 ?auto_545732 ) ) ( not ( = ?auto_545731 ?auto_545733 ) ) ( not ( = ?auto_545731 ?auto_545734 ) ) ( not ( = ?auto_545731 ?auto_545735 ) ) ( not ( = ?auto_545731 ?auto_545736 ) ) ( not ( = ?auto_545731 ?auto_545737 ) ) ( not ( = ?auto_545731 ?auto_545738 ) ) ( not ( = ?auto_545731 ?auto_545739 ) ) ( not ( = ?auto_545731 ?auto_545740 ) ) ( not ( = ?auto_545732 ?auto_545733 ) ) ( not ( = ?auto_545732 ?auto_545734 ) ) ( not ( = ?auto_545732 ?auto_545735 ) ) ( not ( = ?auto_545732 ?auto_545736 ) ) ( not ( = ?auto_545732 ?auto_545737 ) ) ( not ( = ?auto_545732 ?auto_545738 ) ) ( not ( = ?auto_545732 ?auto_545739 ) ) ( not ( = ?auto_545732 ?auto_545740 ) ) ( not ( = ?auto_545733 ?auto_545734 ) ) ( not ( = ?auto_545733 ?auto_545735 ) ) ( not ( = ?auto_545733 ?auto_545736 ) ) ( not ( = ?auto_545733 ?auto_545737 ) ) ( not ( = ?auto_545733 ?auto_545738 ) ) ( not ( = ?auto_545733 ?auto_545739 ) ) ( not ( = ?auto_545733 ?auto_545740 ) ) ( not ( = ?auto_545734 ?auto_545735 ) ) ( not ( = ?auto_545734 ?auto_545736 ) ) ( not ( = ?auto_545734 ?auto_545737 ) ) ( not ( = ?auto_545734 ?auto_545738 ) ) ( not ( = ?auto_545734 ?auto_545739 ) ) ( not ( = ?auto_545734 ?auto_545740 ) ) ( not ( = ?auto_545735 ?auto_545736 ) ) ( not ( = ?auto_545735 ?auto_545737 ) ) ( not ( = ?auto_545735 ?auto_545738 ) ) ( not ( = ?auto_545735 ?auto_545739 ) ) ( not ( = ?auto_545735 ?auto_545740 ) ) ( not ( = ?auto_545736 ?auto_545737 ) ) ( not ( = ?auto_545736 ?auto_545738 ) ) ( not ( = ?auto_545736 ?auto_545739 ) ) ( not ( = ?auto_545736 ?auto_545740 ) ) ( not ( = ?auto_545737 ?auto_545738 ) ) ( not ( = ?auto_545737 ?auto_545739 ) ) ( not ( = ?auto_545737 ?auto_545740 ) ) ( not ( = ?auto_545738 ?auto_545739 ) ) ( not ( = ?auto_545738 ?auto_545740 ) ) ( not ( = ?auto_545739 ?auto_545740 ) ) ( ON ?auto_545739 ?auto_545740 ) ( ON ?auto_545738 ?auto_545739 ) ( ON ?auto_545737 ?auto_545738 ) ( CLEAR ?auto_545735 ) ( ON ?auto_545736 ?auto_545737 ) ( CLEAR ?auto_545736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_545725 ?auto_545726 ?auto_545727 ?auto_545728 ?auto_545729 ?auto_545730 ?auto_545731 ?auto_545732 ?auto_545733 ?auto_545734 ?auto_545735 ?auto_545736 )
      ( MAKE-16PILE ?auto_545725 ?auto_545726 ?auto_545727 ?auto_545728 ?auto_545729 ?auto_545730 ?auto_545731 ?auto_545732 ?auto_545733 ?auto_545734 ?auto_545735 ?auto_545736 ?auto_545737 ?auto_545738 ?auto_545739 ?auto_545740 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545757 - BLOCK
      ?auto_545758 - BLOCK
      ?auto_545759 - BLOCK
      ?auto_545760 - BLOCK
      ?auto_545761 - BLOCK
      ?auto_545762 - BLOCK
      ?auto_545763 - BLOCK
      ?auto_545764 - BLOCK
      ?auto_545765 - BLOCK
      ?auto_545766 - BLOCK
      ?auto_545767 - BLOCK
      ?auto_545768 - BLOCK
      ?auto_545769 - BLOCK
      ?auto_545770 - BLOCK
      ?auto_545771 - BLOCK
      ?auto_545772 - BLOCK
    )
    :vars
    (
      ?auto_545773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545772 ?auto_545773 ) ( ON-TABLE ?auto_545757 ) ( ON ?auto_545758 ?auto_545757 ) ( ON ?auto_545759 ?auto_545758 ) ( ON ?auto_545760 ?auto_545759 ) ( ON ?auto_545761 ?auto_545760 ) ( ON ?auto_545762 ?auto_545761 ) ( ON ?auto_545763 ?auto_545762 ) ( ON ?auto_545764 ?auto_545763 ) ( ON ?auto_545765 ?auto_545764 ) ( ON ?auto_545766 ?auto_545765 ) ( not ( = ?auto_545757 ?auto_545758 ) ) ( not ( = ?auto_545757 ?auto_545759 ) ) ( not ( = ?auto_545757 ?auto_545760 ) ) ( not ( = ?auto_545757 ?auto_545761 ) ) ( not ( = ?auto_545757 ?auto_545762 ) ) ( not ( = ?auto_545757 ?auto_545763 ) ) ( not ( = ?auto_545757 ?auto_545764 ) ) ( not ( = ?auto_545757 ?auto_545765 ) ) ( not ( = ?auto_545757 ?auto_545766 ) ) ( not ( = ?auto_545757 ?auto_545767 ) ) ( not ( = ?auto_545757 ?auto_545768 ) ) ( not ( = ?auto_545757 ?auto_545769 ) ) ( not ( = ?auto_545757 ?auto_545770 ) ) ( not ( = ?auto_545757 ?auto_545771 ) ) ( not ( = ?auto_545757 ?auto_545772 ) ) ( not ( = ?auto_545757 ?auto_545773 ) ) ( not ( = ?auto_545758 ?auto_545759 ) ) ( not ( = ?auto_545758 ?auto_545760 ) ) ( not ( = ?auto_545758 ?auto_545761 ) ) ( not ( = ?auto_545758 ?auto_545762 ) ) ( not ( = ?auto_545758 ?auto_545763 ) ) ( not ( = ?auto_545758 ?auto_545764 ) ) ( not ( = ?auto_545758 ?auto_545765 ) ) ( not ( = ?auto_545758 ?auto_545766 ) ) ( not ( = ?auto_545758 ?auto_545767 ) ) ( not ( = ?auto_545758 ?auto_545768 ) ) ( not ( = ?auto_545758 ?auto_545769 ) ) ( not ( = ?auto_545758 ?auto_545770 ) ) ( not ( = ?auto_545758 ?auto_545771 ) ) ( not ( = ?auto_545758 ?auto_545772 ) ) ( not ( = ?auto_545758 ?auto_545773 ) ) ( not ( = ?auto_545759 ?auto_545760 ) ) ( not ( = ?auto_545759 ?auto_545761 ) ) ( not ( = ?auto_545759 ?auto_545762 ) ) ( not ( = ?auto_545759 ?auto_545763 ) ) ( not ( = ?auto_545759 ?auto_545764 ) ) ( not ( = ?auto_545759 ?auto_545765 ) ) ( not ( = ?auto_545759 ?auto_545766 ) ) ( not ( = ?auto_545759 ?auto_545767 ) ) ( not ( = ?auto_545759 ?auto_545768 ) ) ( not ( = ?auto_545759 ?auto_545769 ) ) ( not ( = ?auto_545759 ?auto_545770 ) ) ( not ( = ?auto_545759 ?auto_545771 ) ) ( not ( = ?auto_545759 ?auto_545772 ) ) ( not ( = ?auto_545759 ?auto_545773 ) ) ( not ( = ?auto_545760 ?auto_545761 ) ) ( not ( = ?auto_545760 ?auto_545762 ) ) ( not ( = ?auto_545760 ?auto_545763 ) ) ( not ( = ?auto_545760 ?auto_545764 ) ) ( not ( = ?auto_545760 ?auto_545765 ) ) ( not ( = ?auto_545760 ?auto_545766 ) ) ( not ( = ?auto_545760 ?auto_545767 ) ) ( not ( = ?auto_545760 ?auto_545768 ) ) ( not ( = ?auto_545760 ?auto_545769 ) ) ( not ( = ?auto_545760 ?auto_545770 ) ) ( not ( = ?auto_545760 ?auto_545771 ) ) ( not ( = ?auto_545760 ?auto_545772 ) ) ( not ( = ?auto_545760 ?auto_545773 ) ) ( not ( = ?auto_545761 ?auto_545762 ) ) ( not ( = ?auto_545761 ?auto_545763 ) ) ( not ( = ?auto_545761 ?auto_545764 ) ) ( not ( = ?auto_545761 ?auto_545765 ) ) ( not ( = ?auto_545761 ?auto_545766 ) ) ( not ( = ?auto_545761 ?auto_545767 ) ) ( not ( = ?auto_545761 ?auto_545768 ) ) ( not ( = ?auto_545761 ?auto_545769 ) ) ( not ( = ?auto_545761 ?auto_545770 ) ) ( not ( = ?auto_545761 ?auto_545771 ) ) ( not ( = ?auto_545761 ?auto_545772 ) ) ( not ( = ?auto_545761 ?auto_545773 ) ) ( not ( = ?auto_545762 ?auto_545763 ) ) ( not ( = ?auto_545762 ?auto_545764 ) ) ( not ( = ?auto_545762 ?auto_545765 ) ) ( not ( = ?auto_545762 ?auto_545766 ) ) ( not ( = ?auto_545762 ?auto_545767 ) ) ( not ( = ?auto_545762 ?auto_545768 ) ) ( not ( = ?auto_545762 ?auto_545769 ) ) ( not ( = ?auto_545762 ?auto_545770 ) ) ( not ( = ?auto_545762 ?auto_545771 ) ) ( not ( = ?auto_545762 ?auto_545772 ) ) ( not ( = ?auto_545762 ?auto_545773 ) ) ( not ( = ?auto_545763 ?auto_545764 ) ) ( not ( = ?auto_545763 ?auto_545765 ) ) ( not ( = ?auto_545763 ?auto_545766 ) ) ( not ( = ?auto_545763 ?auto_545767 ) ) ( not ( = ?auto_545763 ?auto_545768 ) ) ( not ( = ?auto_545763 ?auto_545769 ) ) ( not ( = ?auto_545763 ?auto_545770 ) ) ( not ( = ?auto_545763 ?auto_545771 ) ) ( not ( = ?auto_545763 ?auto_545772 ) ) ( not ( = ?auto_545763 ?auto_545773 ) ) ( not ( = ?auto_545764 ?auto_545765 ) ) ( not ( = ?auto_545764 ?auto_545766 ) ) ( not ( = ?auto_545764 ?auto_545767 ) ) ( not ( = ?auto_545764 ?auto_545768 ) ) ( not ( = ?auto_545764 ?auto_545769 ) ) ( not ( = ?auto_545764 ?auto_545770 ) ) ( not ( = ?auto_545764 ?auto_545771 ) ) ( not ( = ?auto_545764 ?auto_545772 ) ) ( not ( = ?auto_545764 ?auto_545773 ) ) ( not ( = ?auto_545765 ?auto_545766 ) ) ( not ( = ?auto_545765 ?auto_545767 ) ) ( not ( = ?auto_545765 ?auto_545768 ) ) ( not ( = ?auto_545765 ?auto_545769 ) ) ( not ( = ?auto_545765 ?auto_545770 ) ) ( not ( = ?auto_545765 ?auto_545771 ) ) ( not ( = ?auto_545765 ?auto_545772 ) ) ( not ( = ?auto_545765 ?auto_545773 ) ) ( not ( = ?auto_545766 ?auto_545767 ) ) ( not ( = ?auto_545766 ?auto_545768 ) ) ( not ( = ?auto_545766 ?auto_545769 ) ) ( not ( = ?auto_545766 ?auto_545770 ) ) ( not ( = ?auto_545766 ?auto_545771 ) ) ( not ( = ?auto_545766 ?auto_545772 ) ) ( not ( = ?auto_545766 ?auto_545773 ) ) ( not ( = ?auto_545767 ?auto_545768 ) ) ( not ( = ?auto_545767 ?auto_545769 ) ) ( not ( = ?auto_545767 ?auto_545770 ) ) ( not ( = ?auto_545767 ?auto_545771 ) ) ( not ( = ?auto_545767 ?auto_545772 ) ) ( not ( = ?auto_545767 ?auto_545773 ) ) ( not ( = ?auto_545768 ?auto_545769 ) ) ( not ( = ?auto_545768 ?auto_545770 ) ) ( not ( = ?auto_545768 ?auto_545771 ) ) ( not ( = ?auto_545768 ?auto_545772 ) ) ( not ( = ?auto_545768 ?auto_545773 ) ) ( not ( = ?auto_545769 ?auto_545770 ) ) ( not ( = ?auto_545769 ?auto_545771 ) ) ( not ( = ?auto_545769 ?auto_545772 ) ) ( not ( = ?auto_545769 ?auto_545773 ) ) ( not ( = ?auto_545770 ?auto_545771 ) ) ( not ( = ?auto_545770 ?auto_545772 ) ) ( not ( = ?auto_545770 ?auto_545773 ) ) ( not ( = ?auto_545771 ?auto_545772 ) ) ( not ( = ?auto_545771 ?auto_545773 ) ) ( not ( = ?auto_545772 ?auto_545773 ) ) ( ON ?auto_545771 ?auto_545772 ) ( ON ?auto_545770 ?auto_545771 ) ( ON ?auto_545769 ?auto_545770 ) ( ON ?auto_545768 ?auto_545769 ) ( CLEAR ?auto_545766 ) ( ON ?auto_545767 ?auto_545768 ) ( CLEAR ?auto_545767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_545757 ?auto_545758 ?auto_545759 ?auto_545760 ?auto_545761 ?auto_545762 ?auto_545763 ?auto_545764 ?auto_545765 ?auto_545766 ?auto_545767 )
      ( MAKE-16PILE ?auto_545757 ?auto_545758 ?auto_545759 ?auto_545760 ?auto_545761 ?auto_545762 ?auto_545763 ?auto_545764 ?auto_545765 ?auto_545766 ?auto_545767 ?auto_545768 ?auto_545769 ?auto_545770 ?auto_545771 ?auto_545772 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545790 - BLOCK
      ?auto_545791 - BLOCK
      ?auto_545792 - BLOCK
      ?auto_545793 - BLOCK
      ?auto_545794 - BLOCK
      ?auto_545795 - BLOCK
      ?auto_545796 - BLOCK
      ?auto_545797 - BLOCK
      ?auto_545798 - BLOCK
      ?auto_545799 - BLOCK
      ?auto_545800 - BLOCK
      ?auto_545801 - BLOCK
      ?auto_545802 - BLOCK
      ?auto_545803 - BLOCK
      ?auto_545804 - BLOCK
      ?auto_545805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545805 ) ( ON-TABLE ?auto_545790 ) ( ON ?auto_545791 ?auto_545790 ) ( ON ?auto_545792 ?auto_545791 ) ( ON ?auto_545793 ?auto_545792 ) ( ON ?auto_545794 ?auto_545793 ) ( ON ?auto_545795 ?auto_545794 ) ( ON ?auto_545796 ?auto_545795 ) ( ON ?auto_545797 ?auto_545796 ) ( ON ?auto_545798 ?auto_545797 ) ( ON ?auto_545799 ?auto_545798 ) ( not ( = ?auto_545790 ?auto_545791 ) ) ( not ( = ?auto_545790 ?auto_545792 ) ) ( not ( = ?auto_545790 ?auto_545793 ) ) ( not ( = ?auto_545790 ?auto_545794 ) ) ( not ( = ?auto_545790 ?auto_545795 ) ) ( not ( = ?auto_545790 ?auto_545796 ) ) ( not ( = ?auto_545790 ?auto_545797 ) ) ( not ( = ?auto_545790 ?auto_545798 ) ) ( not ( = ?auto_545790 ?auto_545799 ) ) ( not ( = ?auto_545790 ?auto_545800 ) ) ( not ( = ?auto_545790 ?auto_545801 ) ) ( not ( = ?auto_545790 ?auto_545802 ) ) ( not ( = ?auto_545790 ?auto_545803 ) ) ( not ( = ?auto_545790 ?auto_545804 ) ) ( not ( = ?auto_545790 ?auto_545805 ) ) ( not ( = ?auto_545791 ?auto_545792 ) ) ( not ( = ?auto_545791 ?auto_545793 ) ) ( not ( = ?auto_545791 ?auto_545794 ) ) ( not ( = ?auto_545791 ?auto_545795 ) ) ( not ( = ?auto_545791 ?auto_545796 ) ) ( not ( = ?auto_545791 ?auto_545797 ) ) ( not ( = ?auto_545791 ?auto_545798 ) ) ( not ( = ?auto_545791 ?auto_545799 ) ) ( not ( = ?auto_545791 ?auto_545800 ) ) ( not ( = ?auto_545791 ?auto_545801 ) ) ( not ( = ?auto_545791 ?auto_545802 ) ) ( not ( = ?auto_545791 ?auto_545803 ) ) ( not ( = ?auto_545791 ?auto_545804 ) ) ( not ( = ?auto_545791 ?auto_545805 ) ) ( not ( = ?auto_545792 ?auto_545793 ) ) ( not ( = ?auto_545792 ?auto_545794 ) ) ( not ( = ?auto_545792 ?auto_545795 ) ) ( not ( = ?auto_545792 ?auto_545796 ) ) ( not ( = ?auto_545792 ?auto_545797 ) ) ( not ( = ?auto_545792 ?auto_545798 ) ) ( not ( = ?auto_545792 ?auto_545799 ) ) ( not ( = ?auto_545792 ?auto_545800 ) ) ( not ( = ?auto_545792 ?auto_545801 ) ) ( not ( = ?auto_545792 ?auto_545802 ) ) ( not ( = ?auto_545792 ?auto_545803 ) ) ( not ( = ?auto_545792 ?auto_545804 ) ) ( not ( = ?auto_545792 ?auto_545805 ) ) ( not ( = ?auto_545793 ?auto_545794 ) ) ( not ( = ?auto_545793 ?auto_545795 ) ) ( not ( = ?auto_545793 ?auto_545796 ) ) ( not ( = ?auto_545793 ?auto_545797 ) ) ( not ( = ?auto_545793 ?auto_545798 ) ) ( not ( = ?auto_545793 ?auto_545799 ) ) ( not ( = ?auto_545793 ?auto_545800 ) ) ( not ( = ?auto_545793 ?auto_545801 ) ) ( not ( = ?auto_545793 ?auto_545802 ) ) ( not ( = ?auto_545793 ?auto_545803 ) ) ( not ( = ?auto_545793 ?auto_545804 ) ) ( not ( = ?auto_545793 ?auto_545805 ) ) ( not ( = ?auto_545794 ?auto_545795 ) ) ( not ( = ?auto_545794 ?auto_545796 ) ) ( not ( = ?auto_545794 ?auto_545797 ) ) ( not ( = ?auto_545794 ?auto_545798 ) ) ( not ( = ?auto_545794 ?auto_545799 ) ) ( not ( = ?auto_545794 ?auto_545800 ) ) ( not ( = ?auto_545794 ?auto_545801 ) ) ( not ( = ?auto_545794 ?auto_545802 ) ) ( not ( = ?auto_545794 ?auto_545803 ) ) ( not ( = ?auto_545794 ?auto_545804 ) ) ( not ( = ?auto_545794 ?auto_545805 ) ) ( not ( = ?auto_545795 ?auto_545796 ) ) ( not ( = ?auto_545795 ?auto_545797 ) ) ( not ( = ?auto_545795 ?auto_545798 ) ) ( not ( = ?auto_545795 ?auto_545799 ) ) ( not ( = ?auto_545795 ?auto_545800 ) ) ( not ( = ?auto_545795 ?auto_545801 ) ) ( not ( = ?auto_545795 ?auto_545802 ) ) ( not ( = ?auto_545795 ?auto_545803 ) ) ( not ( = ?auto_545795 ?auto_545804 ) ) ( not ( = ?auto_545795 ?auto_545805 ) ) ( not ( = ?auto_545796 ?auto_545797 ) ) ( not ( = ?auto_545796 ?auto_545798 ) ) ( not ( = ?auto_545796 ?auto_545799 ) ) ( not ( = ?auto_545796 ?auto_545800 ) ) ( not ( = ?auto_545796 ?auto_545801 ) ) ( not ( = ?auto_545796 ?auto_545802 ) ) ( not ( = ?auto_545796 ?auto_545803 ) ) ( not ( = ?auto_545796 ?auto_545804 ) ) ( not ( = ?auto_545796 ?auto_545805 ) ) ( not ( = ?auto_545797 ?auto_545798 ) ) ( not ( = ?auto_545797 ?auto_545799 ) ) ( not ( = ?auto_545797 ?auto_545800 ) ) ( not ( = ?auto_545797 ?auto_545801 ) ) ( not ( = ?auto_545797 ?auto_545802 ) ) ( not ( = ?auto_545797 ?auto_545803 ) ) ( not ( = ?auto_545797 ?auto_545804 ) ) ( not ( = ?auto_545797 ?auto_545805 ) ) ( not ( = ?auto_545798 ?auto_545799 ) ) ( not ( = ?auto_545798 ?auto_545800 ) ) ( not ( = ?auto_545798 ?auto_545801 ) ) ( not ( = ?auto_545798 ?auto_545802 ) ) ( not ( = ?auto_545798 ?auto_545803 ) ) ( not ( = ?auto_545798 ?auto_545804 ) ) ( not ( = ?auto_545798 ?auto_545805 ) ) ( not ( = ?auto_545799 ?auto_545800 ) ) ( not ( = ?auto_545799 ?auto_545801 ) ) ( not ( = ?auto_545799 ?auto_545802 ) ) ( not ( = ?auto_545799 ?auto_545803 ) ) ( not ( = ?auto_545799 ?auto_545804 ) ) ( not ( = ?auto_545799 ?auto_545805 ) ) ( not ( = ?auto_545800 ?auto_545801 ) ) ( not ( = ?auto_545800 ?auto_545802 ) ) ( not ( = ?auto_545800 ?auto_545803 ) ) ( not ( = ?auto_545800 ?auto_545804 ) ) ( not ( = ?auto_545800 ?auto_545805 ) ) ( not ( = ?auto_545801 ?auto_545802 ) ) ( not ( = ?auto_545801 ?auto_545803 ) ) ( not ( = ?auto_545801 ?auto_545804 ) ) ( not ( = ?auto_545801 ?auto_545805 ) ) ( not ( = ?auto_545802 ?auto_545803 ) ) ( not ( = ?auto_545802 ?auto_545804 ) ) ( not ( = ?auto_545802 ?auto_545805 ) ) ( not ( = ?auto_545803 ?auto_545804 ) ) ( not ( = ?auto_545803 ?auto_545805 ) ) ( not ( = ?auto_545804 ?auto_545805 ) ) ( ON ?auto_545804 ?auto_545805 ) ( ON ?auto_545803 ?auto_545804 ) ( ON ?auto_545802 ?auto_545803 ) ( ON ?auto_545801 ?auto_545802 ) ( CLEAR ?auto_545799 ) ( ON ?auto_545800 ?auto_545801 ) ( CLEAR ?auto_545800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_545790 ?auto_545791 ?auto_545792 ?auto_545793 ?auto_545794 ?auto_545795 ?auto_545796 ?auto_545797 ?auto_545798 ?auto_545799 ?auto_545800 )
      ( MAKE-16PILE ?auto_545790 ?auto_545791 ?auto_545792 ?auto_545793 ?auto_545794 ?auto_545795 ?auto_545796 ?auto_545797 ?auto_545798 ?auto_545799 ?auto_545800 ?auto_545801 ?auto_545802 ?auto_545803 ?auto_545804 ?auto_545805 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545822 - BLOCK
      ?auto_545823 - BLOCK
      ?auto_545824 - BLOCK
      ?auto_545825 - BLOCK
      ?auto_545826 - BLOCK
      ?auto_545827 - BLOCK
      ?auto_545828 - BLOCK
      ?auto_545829 - BLOCK
      ?auto_545830 - BLOCK
      ?auto_545831 - BLOCK
      ?auto_545832 - BLOCK
      ?auto_545833 - BLOCK
      ?auto_545834 - BLOCK
      ?auto_545835 - BLOCK
      ?auto_545836 - BLOCK
      ?auto_545837 - BLOCK
    )
    :vars
    (
      ?auto_545838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545837 ?auto_545838 ) ( ON-TABLE ?auto_545822 ) ( ON ?auto_545823 ?auto_545822 ) ( ON ?auto_545824 ?auto_545823 ) ( ON ?auto_545825 ?auto_545824 ) ( ON ?auto_545826 ?auto_545825 ) ( ON ?auto_545827 ?auto_545826 ) ( ON ?auto_545828 ?auto_545827 ) ( ON ?auto_545829 ?auto_545828 ) ( ON ?auto_545830 ?auto_545829 ) ( not ( = ?auto_545822 ?auto_545823 ) ) ( not ( = ?auto_545822 ?auto_545824 ) ) ( not ( = ?auto_545822 ?auto_545825 ) ) ( not ( = ?auto_545822 ?auto_545826 ) ) ( not ( = ?auto_545822 ?auto_545827 ) ) ( not ( = ?auto_545822 ?auto_545828 ) ) ( not ( = ?auto_545822 ?auto_545829 ) ) ( not ( = ?auto_545822 ?auto_545830 ) ) ( not ( = ?auto_545822 ?auto_545831 ) ) ( not ( = ?auto_545822 ?auto_545832 ) ) ( not ( = ?auto_545822 ?auto_545833 ) ) ( not ( = ?auto_545822 ?auto_545834 ) ) ( not ( = ?auto_545822 ?auto_545835 ) ) ( not ( = ?auto_545822 ?auto_545836 ) ) ( not ( = ?auto_545822 ?auto_545837 ) ) ( not ( = ?auto_545822 ?auto_545838 ) ) ( not ( = ?auto_545823 ?auto_545824 ) ) ( not ( = ?auto_545823 ?auto_545825 ) ) ( not ( = ?auto_545823 ?auto_545826 ) ) ( not ( = ?auto_545823 ?auto_545827 ) ) ( not ( = ?auto_545823 ?auto_545828 ) ) ( not ( = ?auto_545823 ?auto_545829 ) ) ( not ( = ?auto_545823 ?auto_545830 ) ) ( not ( = ?auto_545823 ?auto_545831 ) ) ( not ( = ?auto_545823 ?auto_545832 ) ) ( not ( = ?auto_545823 ?auto_545833 ) ) ( not ( = ?auto_545823 ?auto_545834 ) ) ( not ( = ?auto_545823 ?auto_545835 ) ) ( not ( = ?auto_545823 ?auto_545836 ) ) ( not ( = ?auto_545823 ?auto_545837 ) ) ( not ( = ?auto_545823 ?auto_545838 ) ) ( not ( = ?auto_545824 ?auto_545825 ) ) ( not ( = ?auto_545824 ?auto_545826 ) ) ( not ( = ?auto_545824 ?auto_545827 ) ) ( not ( = ?auto_545824 ?auto_545828 ) ) ( not ( = ?auto_545824 ?auto_545829 ) ) ( not ( = ?auto_545824 ?auto_545830 ) ) ( not ( = ?auto_545824 ?auto_545831 ) ) ( not ( = ?auto_545824 ?auto_545832 ) ) ( not ( = ?auto_545824 ?auto_545833 ) ) ( not ( = ?auto_545824 ?auto_545834 ) ) ( not ( = ?auto_545824 ?auto_545835 ) ) ( not ( = ?auto_545824 ?auto_545836 ) ) ( not ( = ?auto_545824 ?auto_545837 ) ) ( not ( = ?auto_545824 ?auto_545838 ) ) ( not ( = ?auto_545825 ?auto_545826 ) ) ( not ( = ?auto_545825 ?auto_545827 ) ) ( not ( = ?auto_545825 ?auto_545828 ) ) ( not ( = ?auto_545825 ?auto_545829 ) ) ( not ( = ?auto_545825 ?auto_545830 ) ) ( not ( = ?auto_545825 ?auto_545831 ) ) ( not ( = ?auto_545825 ?auto_545832 ) ) ( not ( = ?auto_545825 ?auto_545833 ) ) ( not ( = ?auto_545825 ?auto_545834 ) ) ( not ( = ?auto_545825 ?auto_545835 ) ) ( not ( = ?auto_545825 ?auto_545836 ) ) ( not ( = ?auto_545825 ?auto_545837 ) ) ( not ( = ?auto_545825 ?auto_545838 ) ) ( not ( = ?auto_545826 ?auto_545827 ) ) ( not ( = ?auto_545826 ?auto_545828 ) ) ( not ( = ?auto_545826 ?auto_545829 ) ) ( not ( = ?auto_545826 ?auto_545830 ) ) ( not ( = ?auto_545826 ?auto_545831 ) ) ( not ( = ?auto_545826 ?auto_545832 ) ) ( not ( = ?auto_545826 ?auto_545833 ) ) ( not ( = ?auto_545826 ?auto_545834 ) ) ( not ( = ?auto_545826 ?auto_545835 ) ) ( not ( = ?auto_545826 ?auto_545836 ) ) ( not ( = ?auto_545826 ?auto_545837 ) ) ( not ( = ?auto_545826 ?auto_545838 ) ) ( not ( = ?auto_545827 ?auto_545828 ) ) ( not ( = ?auto_545827 ?auto_545829 ) ) ( not ( = ?auto_545827 ?auto_545830 ) ) ( not ( = ?auto_545827 ?auto_545831 ) ) ( not ( = ?auto_545827 ?auto_545832 ) ) ( not ( = ?auto_545827 ?auto_545833 ) ) ( not ( = ?auto_545827 ?auto_545834 ) ) ( not ( = ?auto_545827 ?auto_545835 ) ) ( not ( = ?auto_545827 ?auto_545836 ) ) ( not ( = ?auto_545827 ?auto_545837 ) ) ( not ( = ?auto_545827 ?auto_545838 ) ) ( not ( = ?auto_545828 ?auto_545829 ) ) ( not ( = ?auto_545828 ?auto_545830 ) ) ( not ( = ?auto_545828 ?auto_545831 ) ) ( not ( = ?auto_545828 ?auto_545832 ) ) ( not ( = ?auto_545828 ?auto_545833 ) ) ( not ( = ?auto_545828 ?auto_545834 ) ) ( not ( = ?auto_545828 ?auto_545835 ) ) ( not ( = ?auto_545828 ?auto_545836 ) ) ( not ( = ?auto_545828 ?auto_545837 ) ) ( not ( = ?auto_545828 ?auto_545838 ) ) ( not ( = ?auto_545829 ?auto_545830 ) ) ( not ( = ?auto_545829 ?auto_545831 ) ) ( not ( = ?auto_545829 ?auto_545832 ) ) ( not ( = ?auto_545829 ?auto_545833 ) ) ( not ( = ?auto_545829 ?auto_545834 ) ) ( not ( = ?auto_545829 ?auto_545835 ) ) ( not ( = ?auto_545829 ?auto_545836 ) ) ( not ( = ?auto_545829 ?auto_545837 ) ) ( not ( = ?auto_545829 ?auto_545838 ) ) ( not ( = ?auto_545830 ?auto_545831 ) ) ( not ( = ?auto_545830 ?auto_545832 ) ) ( not ( = ?auto_545830 ?auto_545833 ) ) ( not ( = ?auto_545830 ?auto_545834 ) ) ( not ( = ?auto_545830 ?auto_545835 ) ) ( not ( = ?auto_545830 ?auto_545836 ) ) ( not ( = ?auto_545830 ?auto_545837 ) ) ( not ( = ?auto_545830 ?auto_545838 ) ) ( not ( = ?auto_545831 ?auto_545832 ) ) ( not ( = ?auto_545831 ?auto_545833 ) ) ( not ( = ?auto_545831 ?auto_545834 ) ) ( not ( = ?auto_545831 ?auto_545835 ) ) ( not ( = ?auto_545831 ?auto_545836 ) ) ( not ( = ?auto_545831 ?auto_545837 ) ) ( not ( = ?auto_545831 ?auto_545838 ) ) ( not ( = ?auto_545832 ?auto_545833 ) ) ( not ( = ?auto_545832 ?auto_545834 ) ) ( not ( = ?auto_545832 ?auto_545835 ) ) ( not ( = ?auto_545832 ?auto_545836 ) ) ( not ( = ?auto_545832 ?auto_545837 ) ) ( not ( = ?auto_545832 ?auto_545838 ) ) ( not ( = ?auto_545833 ?auto_545834 ) ) ( not ( = ?auto_545833 ?auto_545835 ) ) ( not ( = ?auto_545833 ?auto_545836 ) ) ( not ( = ?auto_545833 ?auto_545837 ) ) ( not ( = ?auto_545833 ?auto_545838 ) ) ( not ( = ?auto_545834 ?auto_545835 ) ) ( not ( = ?auto_545834 ?auto_545836 ) ) ( not ( = ?auto_545834 ?auto_545837 ) ) ( not ( = ?auto_545834 ?auto_545838 ) ) ( not ( = ?auto_545835 ?auto_545836 ) ) ( not ( = ?auto_545835 ?auto_545837 ) ) ( not ( = ?auto_545835 ?auto_545838 ) ) ( not ( = ?auto_545836 ?auto_545837 ) ) ( not ( = ?auto_545836 ?auto_545838 ) ) ( not ( = ?auto_545837 ?auto_545838 ) ) ( ON ?auto_545836 ?auto_545837 ) ( ON ?auto_545835 ?auto_545836 ) ( ON ?auto_545834 ?auto_545835 ) ( ON ?auto_545833 ?auto_545834 ) ( ON ?auto_545832 ?auto_545833 ) ( CLEAR ?auto_545830 ) ( ON ?auto_545831 ?auto_545832 ) ( CLEAR ?auto_545831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_545822 ?auto_545823 ?auto_545824 ?auto_545825 ?auto_545826 ?auto_545827 ?auto_545828 ?auto_545829 ?auto_545830 ?auto_545831 )
      ( MAKE-16PILE ?auto_545822 ?auto_545823 ?auto_545824 ?auto_545825 ?auto_545826 ?auto_545827 ?auto_545828 ?auto_545829 ?auto_545830 ?auto_545831 ?auto_545832 ?auto_545833 ?auto_545834 ?auto_545835 ?auto_545836 ?auto_545837 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545855 - BLOCK
      ?auto_545856 - BLOCK
      ?auto_545857 - BLOCK
      ?auto_545858 - BLOCK
      ?auto_545859 - BLOCK
      ?auto_545860 - BLOCK
      ?auto_545861 - BLOCK
      ?auto_545862 - BLOCK
      ?auto_545863 - BLOCK
      ?auto_545864 - BLOCK
      ?auto_545865 - BLOCK
      ?auto_545866 - BLOCK
      ?auto_545867 - BLOCK
      ?auto_545868 - BLOCK
      ?auto_545869 - BLOCK
      ?auto_545870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545870 ) ( ON-TABLE ?auto_545855 ) ( ON ?auto_545856 ?auto_545855 ) ( ON ?auto_545857 ?auto_545856 ) ( ON ?auto_545858 ?auto_545857 ) ( ON ?auto_545859 ?auto_545858 ) ( ON ?auto_545860 ?auto_545859 ) ( ON ?auto_545861 ?auto_545860 ) ( ON ?auto_545862 ?auto_545861 ) ( ON ?auto_545863 ?auto_545862 ) ( not ( = ?auto_545855 ?auto_545856 ) ) ( not ( = ?auto_545855 ?auto_545857 ) ) ( not ( = ?auto_545855 ?auto_545858 ) ) ( not ( = ?auto_545855 ?auto_545859 ) ) ( not ( = ?auto_545855 ?auto_545860 ) ) ( not ( = ?auto_545855 ?auto_545861 ) ) ( not ( = ?auto_545855 ?auto_545862 ) ) ( not ( = ?auto_545855 ?auto_545863 ) ) ( not ( = ?auto_545855 ?auto_545864 ) ) ( not ( = ?auto_545855 ?auto_545865 ) ) ( not ( = ?auto_545855 ?auto_545866 ) ) ( not ( = ?auto_545855 ?auto_545867 ) ) ( not ( = ?auto_545855 ?auto_545868 ) ) ( not ( = ?auto_545855 ?auto_545869 ) ) ( not ( = ?auto_545855 ?auto_545870 ) ) ( not ( = ?auto_545856 ?auto_545857 ) ) ( not ( = ?auto_545856 ?auto_545858 ) ) ( not ( = ?auto_545856 ?auto_545859 ) ) ( not ( = ?auto_545856 ?auto_545860 ) ) ( not ( = ?auto_545856 ?auto_545861 ) ) ( not ( = ?auto_545856 ?auto_545862 ) ) ( not ( = ?auto_545856 ?auto_545863 ) ) ( not ( = ?auto_545856 ?auto_545864 ) ) ( not ( = ?auto_545856 ?auto_545865 ) ) ( not ( = ?auto_545856 ?auto_545866 ) ) ( not ( = ?auto_545856 ?auto_545867 ) ) ( not ( = ?auto_545856 ?auto_545868 ) ) ( not ( = ?auto_545856 ?auto_545869 ) ) ( not ( = ?auto_545856 ?auto_545870 ) ) ( not ( = ?auto_545857 ?auto_545858 ) ) ( not ( = ?auto_545857 ?auto_545859 ) ) ( not ( = ?auto_545857 ?auto_545860 ) ) ( not ( = ?auto_545857 ?auto_545861 ) ) ( not ( = ?auto_545857 ?auto_545862 ) ) ( not ( = ?auto_545857 ?auto_545863 ) ) ( not ( = ?auto_545857 ?auto_545864 ) ) ( not ( = ?auto_545857 ?auto_545865 ) ) ( not ( = ?auto_545857 ?auto_545866 ) ) ( not ( = ?auto_545857 ?auto_545867 ) ) ( not ( = ?auto_545857 ?auto_545868 ) ) ( not ( = ?auto_545857 ?auto_545869 ) ) ( not ( = ?auto_545857 ?auto_545870 ) ) ( not ( = ?auto_545858 ?auto_545859 ) ) ( not ( = ?auto_545858 ?auto_545860 ) ) ( not ( = ?auto_545858 ?auto_545861 ) ) ( not ( = ?auto_545858 ?auto_545862 ) ) ( not ( = ?auto_545858 ?auto_545863 ) ) ( not ( = ?auto_545858 ?auto_545864 ) ) ( not ( = ?auto_545858 ?auto_545865 ) ) ( not ( = ?auto_545858 ?auto_545866 ) ) ( not ( = ?auto_545858 ?auto_545867 ) ) ( not ( = ?auto_545858 ?auto_545868 ) ) ( not ( = ?auto_545858 ?auto_545869 ) ) ( not ( = ?auto_545858 ?auto_545870 ) ) ( not ( = ?auto_545859 ?auto_545860 ) ) ( not ( = ?auto_545859 ?auto_545861 ) ) ( not ( = ?auto_545859 ?auto_545862 ) ) ( not ( = ?auto_545859 ?auto_545863 ) ) ( not ( = ?auto_545859 ?auto_545864 ) ) ( not ( = ?auto_545859 ?auto_545865 ) ) ( not ( = ?auto_545859 ?auto_545866 ) ) ( not ( = ?auto_545859 ?auto_545867 ) ) ( not ( = ?auto_545859 ?auto_545868 ) ) ( not ( = ?auto_545859 ?auto_545869 ) ) ( not ( = ?auto_545859 ?auto_545870 ) ) ( not ( = ?auto_545860 ?auto_545861 ) ) ( not ( = ?auto_545860 ?auto_545862 ) ) ( not ( = ?auto_545860 ?auto_545863 ) ) ( not ( = ?auto_545860 ?auto_545864 ) ) ( not ( = ?auto_545860 ?auto_545865 ) ) ( not ( = ?auto_545860 ?auto_545866 ) ) ( not ( = ?auto_545860 ?auto_545867 ) ) ( not ( = ?auto_545860 ?auto_545868 ) ) ( not ( = ?auto_545860 ?auto_545869 ) ) ( not ( = ?auto_545860 ?auto_545870 ) ) ( not ( = ?auto_545861 ?auto_545862 ) ) ( not ( = ?auto_545861 ?auto_545863 ) ) ( not ( = ?auto_545861 ?auto_545864 ) ) ( not ( = ?auto_545861 ?auto_545865 ) ) ( not ( = ?auto_545861 ?auto_545866 ) ) ( not ( = ?auto_545861 ?auto_545867 ) ) ( not ( = ?auto_545861 ?auto_545868 ) ) ( not ( = ?auto_545861 ?auto_545869 ) ) ( not ( = ?auto_545861 ?auto_545870 ) ) ( not ( = ?auto_545862 ?auto_545863 ) ) ( not ( = ?auto_545862 ?auto_545864 ) ) ( not ( = ?auto_545862 ?auto_545865 ) ) ( not ( = ?auto_545862 ?auto_545866 ) ) ( not ( = ?auto_545862 ?auto_545867 ) ) ( not ( = ?auto_545862 ?auto_545868 ) ) ( not ( = ?auto_545862 ?auto_545869 ) ) ( not ( = ?auto_545862 ?auto_545870 ) ) ( not ( = ?auto_545863 ?auto_545864 ) ) ( not ( = ?auto_545863 ?auto_545865 ) ) ( not ( = ?auto_545863 ?auto_545866 ) ) ( not ( = ?auto_545863 ?auto_545867 ) ) ( not ( = ?auto_545863 ?auto_545868 ) ) ( not ( = ?auto_545863 ?auto_545869 ) ) ( not ( = ?auto_545863 ?auto_545870 ) ) ( not ( = ?auto_545864 ?auto_545865 ) ) ( not ( = ?auto_545864 ?auto_545866 ) ) ( not ( = ?auto_545864 ?auto_545867 ) ) ( not ( = ?auto_545864 ?auto_545868 ) ) ( not ( = ?auto_545864 ?auto_545869 ) ) ( not ( = ?auto_545864 ?auto_545870 ) ) ( not ( = ?auto_545865 ?auto_545866 ) ) ( not ( = ?auto_545865 ?auto_545867 ) ) ( not ( = ?auto_545865 ?auto_545868 ) ) ( not ( = ?auto_545865 ?auto_545869 ) ) ( not ( = ?auto_545865 ?auto_545870 ) ) ( not ( = ?auto_545866 ?auto_545867 ) ) ( not ( = ?auto_545866 ?auto_545868 ) ) ( not ( = ?auto_545866 ?auto_545869 ) ) ( not ( = ?auto_545866 ?auto_545870 ) ) ( not ( = ?auto_545867 ?auto_545868 ) ) ( not ( = ?auto_545867 ?auto_545869 ) ) ( not ( = ?auto_545867 ?auto_545870 ) ) ( not ( = ?auto_545868 ?auto_545869 ) ) ( not ( = ?auto_545868 ?auto_545870 ) ) ( not ( = ?auto_545869 ?auto_545870 ) ) ( ON ?auto_545869 ?auto_545870 ) ( ON ?auto_545868 ?auto_545869 ) ( ON ?auto_545867 ?auto_545868 ) ( ON ?auto_545866 ?auto_545867 ) ( ON ?auto_545865 ?auto_545866 ) ( CLEAR ?auto_545863 ) ( ON ?auto_545864 ?auto_545865 ) ( CLEAR ?auto_545864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_545855 ?auto_545856 ?auto_545857 ?auto_545858 ?auto_545859 ?auto_545860 ?auto_545861 ?auto_545862 ?auto_545863 ?auto_545864 )
      ( MAKE-16PILE ?auto_545855 ?auto_545856 ?auto_545857 ?auto_545858 ?auto_545859 ?auto_545860 ?auto_545861 ?auto_545862 ?auto_545863 ?auto_545864 ?auto_545865 ?auto_545866 ?auto_545867 ?auto_545868 ?auto_545869 ?auto_545870 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545887 - BLOCK
      ?auto_545888 - BLOCK
      ?auto_545889 - BLOCK
      ?auto_545890 - BLOCK
      ?auto_545891 - BLOCK
      ?auto_545892 - BLOCK
      ?auto_545893 - BLOCK
      ?auto_545894 - BLOCK
      ?auto_545895 - BLOCK
      ?auto_545896 - BLOCK
      ?auto_545897 - BLOCK
      ?auto_545898 - BLOCK
      ?auto_545899 - BLOCK
      ?auto_545900 - BLOCK
      ?auto_545901 - BLOCK
      ?auto_545902 - BLOCK
    )
    :vars
    (
      ?auto_545903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545902 ?auto_545903 ) ( ON-TABLE ?auto_545887 ) ( ON ?auto_545888 ?auto_545887 ) ( ON ?auto_545889 ?auto_545888 ) ( ON ?auto_545890 ?auto_545889 ) ( ON ?auto_545891 ?auto_545890 ) ( ON ?auto_545892 ?auto_545891 ) ( ON ?auto_545893 ?auto_545892 ) ( ON ?auto_545894 ?auto_545893 ) ( not ( = ?auto_545887 ?auto_545888 ) ) ( not ( = ?auto_545887 ?auto_545889 ) ) ( not ( = ?auto_545887 ?auto_545890 ) ) ( not ( = ?auto_545887 ?auto_545891 ) ) ( not ( = ?auto_545887 ?auto_545892 ) ) ( not ( = ?auto_545887 ?auto_545893 ) ) ( not ( = ?auto_545887 ?auto_545894 ) ) ( not ( = ?auto_545887 ?auto_545895 ) ) ( not ( = ?auto_545887 ?auto_545896 ) ) ( not ( = ?auto_545887 ?auto_545897 ) ) ( not ( = ?auto_545887 ?auto_545898 ) ) ( not ( = ?auto_545887 ?auto_545899 ) ) ( not ( = ?auto_545887 ?auto_545900 ) ) ( not ( = ?auto_545887 ?auto_545901 ) ) ( not ( = ?auto_545887 ?auto_545902 ) ) ( not ( = ?auto_545887 ?auto_545903 ) ) ( not ( = ?auto_545888 ?auto_545889 ) ) ( not ( = ?auto_545888 ?auto_545890 ) ) ( not ( = ?auto_545888 ?auto_545891 ) ) ( not ( = ?auto_545888 ?auto_545892 ) ) ( not ( = ?auto_545888 ?auto_545893 ) ) ( not ( = ?auto_545888 ?auto_545894 ) ) ( not ( = ?auto_545888 ?auto_545895 ) ) ( not ( = ?auto_545888 ?auto_545896 ) ) ( not ( = ?auto_545888 ?auto_545897 ) ) ( not ( = ?auto_545888 ?auto_545898 ) ) ( not ( = ?auto_545888 ?auto_545899 ) ) ( not ( = ?auto_545888 ?auto_545900 ) ) ( not ( = ?auto_545888 ?auto_545901 ) ) ( not ( = ?auto_545888 ?auto_545902 ) ) ( not ( = ?auto_545888 ?auto_545903 ) ) ( not ( = ?auto_545889 ?auto_545890 ) ) ( not ( = ?auto_545889 ?auto_545891 ) ) ( not ( = ?auto_545889 ?auto_545892 ) ) ( not ( = ?auto_545889 ?auto_545893 ) ) ( not ( = ?auto_545889 ?auto_545894 ) ) ( not ( = ?auto_545889 ?auto_545895 ) ) ( not ( = ?auto_545889 ?auto_545896 ) ) ( not ( = ?auto_545889 ?auto_545897 ) ) ( not ( = ?auto_545889 ?auto_545898 ) ) ( not ( = ?auto_545889 ?auto_545899 ) ) ( not ( = ?auto_545889 ?auto_545900 ) ) ( not ( = ?auto_545889 ?auto_545901 ) ) ( not ( = ?auto_545889 ?auto_545902 ) ) ( not ( = ?auto_545889 ?auto_545903 ) ) ( not ( = ?auto_545890 ?auto_545891 ) ) ( not ( = ?auto_545890 ?auto_545892 ) ) ( not ( = ?auto_545890 ?auto_545893 ) ) ( not ( = ?auto_545890 ?auto_545894 ) ) ( not ( = ?auto_545890 ?auto_545895 ) ) ( not ( = ?auto_545890 ?auto_545896 ) ) ( not ( = ?auto_545890 ?auto_545897 ) ) ( not ( = ?auto_545890 ?auto_545898 ) ) ( not ( = ?auto_545890 ?auto_545899 ) ) ( not ( = ?auto_545890 ?auto_545900 ) ) ( not ( = ?auto_545890 ?auto_545901 ) ) ( not ( = ?auto_545890 ?auto_545902 ) ) ( not ( = ?auto_545890 ?auto_545903 ) ) ( not ( = ?auto_545891 ?auto_545892 ) ) ( not ( = ?auto_545891 ?auto_545893 ) ) ( not ( = ?auto_545891 ?auto_545894 ) ) ( not ( = ?auto_545891 ?auto_545895 ) ) ( not ( = ?auto_545891 ?auto_545896 ) ) ( not ( = ?auto_545891 ?auto_545897 ) ) ( not ( = ?auto_545891 ?auto_545898 ) ) ( not ( = ?auto_545891 ?auto_545899 ) ) ( not ( = ?auto_545891 ?auto_545900 ) ) ( not ( = ?auto_545891 ?auto_545901 ) ) ( not ( = ?auto_545891 ?auto_545902 ) ) ( not ( = ?auto_545891 ?auto_545903 ) ) ( not ( = ?auto_545892 ?auto_545893 ) ) ( not ( = ?auto_545892 ?auto_545894 ) ) ( not ( = ?auto_545892 ?auto_545895 ) ) ( not ( = ?auto_545892 ?auto_545896 ) ) ( not ( = ?auto_545892 ?auto_545897 ) ) ( not ( = ?auto_545892 ?auto_545898 ) ) ( not ( = ?auto_545892 ?auto_545899 ) ) ( not ( = ?auto_545892 ?auto_545900 ) ) ( not ( = ?auto_545892 ?auto_545901 ) ) ( not ( = ?auto_545892 ?auto_545902 ) ) ( not ( = ?auto_545892 ?auto_545903 ) ) ( not ( = ?auto_545893 ?auto_545894 ) ) ( not ( = ?auto_545893 ?auto_545895 ) ) ( not ( = ?auto_545893 ?auto_545896 ) ) ( not ( = ?auto_545893 ?auto_545897 ) ) ( not ( = ?auto_545893 ?auto_545898 ) ) ( not ( = ?auto_545893 ?auto_545899 ) ) ( not ( = ?auto_545893 ?auto_545900 ) ) ( not ( = ?auto_545893 ?auto_545901 ) ) ( not ( = ?auto_545893 ?auto_545902 ) ) ( not ( = ?auto_545893 ?auto_545903 ) ) ( not ( = ?auto_545894 ?auto_545895 ) ) ( not ( = ?auto_545894 ?auto_545896 ) ) ( not ( = ?auto_545894 ?auto_545897 ) ) ( not ( = ?auto_545894 ?auto_545898 ) ) ( not ( = ?auto_545894 ?auto_545899 ) ) ( not ( = ?auto_545894 ?auto_545900 ) ) ( not ( = ?auto_545894 ?auto_545901 ) ) ( not ( = ?auto_545894 ?auto_545902 ) ) ( not ( = ?auto_545894 ?auto_545903 ) ) ( not ( = ?auto_545895 ?auto_545896 ) ) ( not ( = ?auto_545895 ?auto_545897 ) ) ( not ( = ?auto_545895 ?auto_545898 ) ) ( not ( = ?auto_545895 ?auto_545899 ) ) ( not ( = ?auto_545895 ?auto_545900 ) ) ( not ( = ?auto_545895 ?auto_545901 ) ) ( not ( = ?auto_545895 ?auto_545902 ) ) ( not ( = ?auto_545895 ?auto_545903 ) ) ( not ( = ?auto_545896 ?auto_545897 ) ) ( not ( = ?auto_545896 ?auto_545898 ) ) ( not ( = ?auto_545896 ?auto_545899 ) ) ( not ( = ?auto_545896 ?auto_545900 ) ) ( not ( = ?auto_545896 ?auto_545901 ) ) ( not ( = ?auto_545896 ?auto_545902 ) ) ( not ( = ?auto_545896 ?auto_545903 ) ) ( not ( = ?auto_545897 ?auto_545898 ) ) ( not ( = ?auto_545897 ?auto_545899 ) ) ( not ( = ?auto_545897 ?auto_545900 ) ) ( not ( = ?auto_545897 ?auto_545901 ) ) ( not ( = ?auto_545897 ?auto_545902 ) ) ( not ( = ?auto_545897 ?auto_545903 ) ) ( not ( = ?auto_545898 ?auto_545899 ) ) ( not ( = ?auto_545898 ?auto_545900 ) ) ( not ( = ?auto_545898 ?auto_545901 ) ) ( not ( = ?auto_545898 ?auto_545902 ) ) ( not ( = ?auto_545898 ?auto_545903 ) ) ( not ( = ?auto_545899 ?auto_545900 ) ) ( not ( = ?auto_545899 ?auto_545901 ) ) ( not ( = ?auto_545899 ?auto_545902 ) ) ( not ( = ?auto_545899 ?auto_545903 ) ) ( not ( = ?auto_545900 ?auto_545901 ) ) ( not ( = ?auto_545900 ?auto_545902 ) ) ( not ( = ?auto_545900 ?auto_545903 ) ) ( not ( = ?auto_545901 ?auto_545902 ) ) ( not ( = ?auto_545901 ?auto_545903 ) ) ( not ( = ?auto_545902 ?auto_545903 ) ) ( ON ?auto_545901 ?auto_545902 ) ( ON ?auto_545900 ?auto_545901 ) ( ON ?auto_545899 ?auto_545900 ) ( ON ?auto_545898 ?auto_545899 ) ( ON ?auto_545897 ?auto_545898 ) ( ON ?auto_545896 ?auto_545897 ) ( CLEAR ?auto_545894 ) ( ON ?auto_545895 ?auto_545896 ) ( CLEAR ?auto_545895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_545887 ?auto_545888 ?auto_545889 ?auto_545890 ?auto_545891 ?auto_545892 ?auto_545893 ?auto_545894 ?auto_545895 )
      ( MAKE-16PILE ?auto_545887 ?auto_545888 ?auto_545889 ?auto_545890 ?auto_545891 ?auto_545892 ?auto_545893 ?auto_545894 ?auto_545895 ?auto_545896 ?auto_545897 ?auto_545898 ?auto_545899 ?auto_545900 ?auto_545901 ?auto_545902 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545920 - BLOCK
      ?auto_545921 - BLOCK
      ?auto_545922 - BLOCK
      ?auto_545923 - BLOCK
      ?auto_545924 - BLOCK
      ?auto_545925 - BLOCK
      ?auto_545926 - BLOCK
      ?auto_545927 - BLOCK
      ?auto_545928 - BLOCK
      ?auto_545929 - BLOCK
      ?auto_545930 - BLOCK
      ?auto_545931 - BLOCK
      ?auto_545932 - BLOCK
      ?auto_545933 - BLOCK
      ?auto_545934 - BLOCK
      ?auto_545935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_545935 ) ( ON-TABLE ?auto_545920 ) ( ON ?auto_545921 ?auto_545920 ) ( ON ?auto_545922 ?auto_545921 ) ( ON ?auto_545923 ?auto_545922 ) ( ON ?auto_545924 ?auto_545923 ) ( ON ?auto_545925 ?auto_545924 ) ( ON ?auto_545926 ?auto_545925 ) ( ON ?auto_545927 ?auto_545926 ) ( not ( = ?auto_545920 ?auto_545921 ) ) ( not ( = ?auto_545920 ?auto_545922 ) ) ( not ( = ?auto_545920 ?auto_545923 ) ) ( not ( = ?auto_545920 ?auto_545924 ) ) ( not ( = ?auto_545920 ?auto_545925 ) ) ( not ( = ?auto_545920 ?auto_545926 ) ) ( not ( = ?auto_545920 ?auto_545927 ) ) ( not ( = ?auto_545920 ?auto_545928 ) ) ( not ( = ?auto_545920 ?auto_545929 ) ) ( not ( = ?auto_545920 ?auto_545930 ) ) ( not ( = ?auto_545920 ?auto_545931 ) ) ( not ( = ?auto_545920 ?auto_545932 ) ) ( not ( = ?auto_545920 ?auto_545933 ) ) ( not ( = ?auto_545920 ?auto_545934 ) ) ( not ( = ?auto_545920 ?auto_545935 ) ) ( not ( = ?auto_545921 ?auto_545922 ) ) ( not ( = ?auto_545921 ?auto_545923 ) ) ( not ( = ?auto_545921 ?auto_545924 ) ) ( not ( = ?auto_545921 ?auto_545925 ) ) ( not ( = ?auto_545921 ?auto_545926 ) ) ( not ( = ?auto_545921 ?auto_545927 ) ) ( not ( = ?auto_545921 ?auto_545928 ) ) ( not ( = ?auto_545921 ?auto_545929 ) ) ( not ( = ?auto_545921 ?auto_545930 ) ) ( not ( = ?auto_545921 ?auto_545931 ) ) ( not ( = ?auto_545921 ?auto_545932 ) ) ( not ( = ?auto_545921 ?auto_545933 ) ) ( not ( = ?auto_545921 ?auto_545934 ) ) ( not ( = ?auto_545921 ?auto_545935 ) ) ( not ( = ?auto_545922 ?auto_545923 ) ) ( not ( = ?auto_545922 ?auto_545924 ) ) ( not ( = ?auto_545922 ?auto_545925 ) ) ( not ( = ?auto_545922 ?auto_545926 ) ) ( not ( = ?auto_545922 ?auto_545927 ) ) ( not ( = ?auto_545922 ?auto_545928 ) ) ( not ( = ?auto_545922 ?auto_545929 ) ) ( not ( = ?auto_545922 ?auto_545930 ) ) ( not ( = ?auto_545922 ?auto_545931 ) ) ( not ( = ?auto_545922 ?auto_545932 ) ) ( not ( = ?auto_545922 ?auto_545933 ) ) ( not ( = ?auto_545922 ?auto_545934 ) ) ( not ( = ?auto_545922 ?auto_545935 ) ) ( not ( = ?auto_545923 ?auto_545924 ) ) ( not ( = ?auto_545923 ?auto_545925 ) ) ( not ( = ?auto_545923 ?auto_545926 ) ) ( not ( = ?auto_545923 ?auto_545927 ) ) ( not ( = ?auto_545923 ?auto_545928 ) ) ( not ( = ?auto_545923 ?auto_545929 ) ) ( not ( = ?auto_545923 ?auto_545930 ) ) ( not ( = ?auto_545923 ?auto_545931 ) ) ( not ( = ?auto_545923 ?auto_545932 ) ) ( not ( = ?auto_545923 ?auto_545933 ) ) ( not ( = ?auto_545923 ?auto_545934 ) ) ( not ( = ?auto_545923 ?auto_545935 ) ) ( not ( = ?auto_545924 ?auto_545925 ) ) ( not ( = ?auto_545924 ?auto_545926 ) ) ( not ( = ?auto_545924 ?auto_545927 ) ) ( not ( = ?auto_545924 ?auto_545928 ) ) ( not ( = ?auto_545924 ?auto_545929 ) ) ( not ( = ?auto_545924 ?auto_545930 ) ) ( not ( = ?auto_545924 ?auto_545931 ) ) ( not ( = ?auto_545924 ?auto_545932 ) ) ( not ( = ?auto_545924 ?auto_545933 ) ) ( not ( = ?auto_545924 ?auto_545934 ) ) ( not ( = ?auto_545924 ?auto_545935 ) ) ( not ( = ?auto_545925 ?auto_545926 ) ) ( not ( = ?auto_545925 ?auto_545927 ) ) ( not ( = ?auto_545925 ?auto_545928 ) ) ( not ( = ?auto_545925 ?auto_545929 ) ) ( not ( = ?auto_545925 ?auto_545930 ) ) ( not ( = ?auto_545925 ?auto_545931 ) ) ( not ( = ?auto_545925 ?auto_545932 ) ) ( not ( = ?auto_545925 ?auto_545933 ) ) ( not ( = ?auto_545925 ?auto_545934 ) ) ( not ( = ?auto_545925 ?auto_545935 ) ) ( not ( = ?auto_545926 ?auto_545927 ) ) ( not ( = ?auto_545926 ?auto_545928 ) ) ( not ( = ?auto_545926 ?auto_545929 ) ) ( not ( = ?auto_545926 ?auto_545930 ) ) ( not ( = ?auto_545926 ?auto_545931 ) ) ( not ( = ?auto_545926 ?auto_545932 ) ) ( not ( = ?auto_545926 ?auto_545933 ) ) ( not ( = ?auto_545926 ?auto_545934 ) ) ( not ( = ?auto_545926 ?auto_545935 ) ) ( not ( = ?auto_545927 ?auto_545928 ) ) ( not ( = ?auto_545927 ?auto_545929 ) ) ( not ( = ?auto_545927 ?auto_545930 ) ) ( not ( = ?auto_545927 ?auto_545931 ) ) ( not ( = ?auto_545927 ?auto_545932 ) ) ( not ( = ?auto_545927 ?auto_545933 ) ) ( not ( = ?auto_545927 ?auto_545934 ) ) ( not ( = ?auto_545927 ?auto_545935 ) ) ( not ( = ?auto_545928 ?auto_545929 ) ) ( not ( = ?auto_545928 ?auto_545930 ) ) ( not ( = ?auto_545928 ?auto_545931 ) ) ( not ( = ?auto_545928 ?auto_545932 ) ) ( not ( = ?auto_545928 ?auto_545933 ) ) ( not ( = ?auto_545928 ?auto_545934 ) ) ( not ( = ?auto_545928 ?auto_545935 ) ) ( not ( = ?auto_545929 ?auto_545930 ) ) ( not ( = ?auto_545929 ?auto_545931 ) ) ( not ( = ?auto_545929 ?auto_545932 ) ) ( not ( = ?auto_545929 ?auto_545933 ) ) ( not ( = ?auto_545929 ?auto_545934 ) ) ( not ( = ?auto_545929 ?auto_545935 ) ) ( not ( = ?auto_545930 ?auto_545931 ) ) ( not ( = ?auto_545930 ?auto_545932 ) ) ( not ( = ?auto_545930 ?auto_545933 ) ) ( not ( = ?auto_545930 ?auto_545934 ) ) ( not ( = ?auto_545930 ?auto_545935 ) ) ( not ( = ?auto_545931 ?auto_545932 ) ) ( not ( = ?auto_545931 ?auto_545933 ) ) ( not ( = ?auto_545931 ?auto_545934 ) ) ( not ( = ?auto_545931 ?auto_545935 ) ) ( not ( = ?auto_545932 ?auto_545933 ) ) ( not ( = ?auto_545932 ?auto_545934 ) ) ( not ( = ?auto_545932 ?auto_545935 ) ) ( not ( = ?auto_545933 ?auto_545934 ) ) ( not ( = ?auto_545933 ?auto_545935 ) ) ( not ( = ?auto_545934 ?auto_545935 ) ) ( ON ?auto_545934 ?auto_545935 ) ( ON ?auto_545933 ?auto_545934 ) ( ON ?auto_545932 ?auto_545933 ) ( ON ?auto_545931 ?auto_545932 ) ( ON ?auto_545930 ?auto_545931 ) ( ON ?auto_545929 ?auto_545930 ) ( CLEAR ?auto_545927 ) ( ON ?auto_545928 ?auto_545929 ) ( CLEAR ?auto_545928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_545920 ?auto_545921 ?auto_545922 ?auto_545923 ?auto_545924 ?auto_545925 ?auto_545926 ?auto_545927 ?auto_545928 )
      ( MAKE-16PILE ?auto_545920 ?auto_545921 ?auto_545922 ?auto_545923 ?auto_545924 ?auto_545925 ?auto_545926 ?auto_545927 ?auto_545928 ?auto_545929 ?auto_545930 ?auto_545931 ?auto_545932 ?auto_545933 ?auto_545934 ?auto_545935 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545952 - BLOCK
      ?auto_545953 - BLOCK
      ?auto_545954 - BLOCK
      ?auto_545955 - BLOCK
      ?auto_545956 - BLOCK
      ?auto_545957 - BLOCK
      ?auto_545958 - BLOCK
      ?auto_545959 - BLOCK
      ?auto_545960 - BLOCK
      ?auto_545961 - BLOCK
      ?auto_545962 - BLOCK
      ?auto_545963 - BLOCK
      ?auto_545964 - BLOCK
      ?auto_545965 - BLOCK
      ?auto_545966 - BLOCK
      ?auto_545967 - BLOCK
    )
    :vars
    (
      ?auto_545968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_545967 ?auto_545968 ) ( ON-TABLE ?auto_545952 ) ( ON ?auto_545953 ?auto_545952 ) ( ON ?auto_545954 ?auto_545953 ) ( ON ?auto_545955 ?auto_545954 ) ( ON ?auto_545956 ?auto_545955 ) ( ON ?auto_545957 ?auto_545956 ) ( ON ?auto_545958 ?auto_545957 ) ( not ( = ?auto_545952 ?auto_545953 ) ) ( not ( = ?auto_545952 ?auto_545954 ) ) ( not ( = ?auto_545952 ?auto_545955 ) ) ( not ( = ?auto_545952 ?auto_545956 ) ) ( not ( = ?auto_545952 ?auto_545957 ) ) ( not ( = ?auto_545952 ?auto_545958 ) ) ( not ( = ?auto_545952 ?auto_545959 ) ) ( not ( = ?auto_545952 ?auto_545960 ) ) ( not ( = ?auto_545952 ?auto_545961 ) ) ( not ( = ?auto_545952 ?auto_545962 ) ) ( not ( = ?auto_545952 ?auto_545963 ) ) ( not ( = ?auto_545952 ?auto_545964 ) ) ( not ( = ?auto_545952 ?auto_545965 ) ) ( not ( = ?auto_545952 ?auto_545966 ) ) ( not ( = ?auto_545952 ?auto_545967 ) ) ( not ( = ?auto_545952 ?auto_545968 ) ) ( not ( = ?auto_545953 ?auto_545954 ) ) ( not ( = ?auto_545953 ?auto_545955 ) ) ( not ( = ?auto_545953 ?auto_545956 ) ) ( not ( = ?auto_545953 ?auto_545957 ) ) ( not ( = ?auto_545953 ?auto_545958 ) ) ( not ( = ?auto_545953 ?auto_545959 ) ) ( not ( = ?auto_545953 ?auto_545960 ) ) ( not ( = ?auto_545953 ?auto_545961 ) ) ( not ( = ?auto_545953 ?auto_545962 ) ) ( not ( = ?auto_545953 ?auto_545963 ) ) ( not ( = ?auto_545953 ?auto_545964 ) ) ( not ( = ?auto_545953 ?auto_545965 ) ) ( not ( = ?auto_545953 ?auto_545966 ) ) ( not ( = ?auto_545953 ?auto_545967 ) ) ( not ( = ?auto_545953 ?auto_545968 ) ) ( not ( = ?auto_545954 ?auto_545955 ) ) ( not ( = ?auto_545954 ?auto_545956 ) ) ( not ( = ?auto_545954 ?auto_545957 ) ) ( not ( = ?auto_545954 ?auto_545958 ) ) ( not ( = ?auto_545954 ?auto_545959 ) ) ( not ( = ?auto_545954 ?auto_545960 ) ) ( not ( = ?auto_545954 ?auto_545961 ) ) ( not ( = ?auto_545954 ?auto_545962 ) ) ( not ( = ?auto_545954 ?auto_545963 ) ) ( not ( = ?auto_545954 ?auto_545964 ) ) ( not ( = ?auto_545954 ?auto_545965 ) ) ( not ( = ?auto_545954 ?auto_545966 ) ) ( not ( = ?auto_545954 ?auto_545967 ) ) ( not ( = ?auto_545954 ?auto_545968 ) ) ( not ( = ?auto_545955 ?auto_545956 ) ) ( not ( = ?auto_545955 ?auto_545957 ) ) ( not ( = ?auto_545955 ?auto_545958 ) ) ( not ( = ?auto_545955 ?auto_545959 ) ) ( not ( = ?auto_545955 ?auto_545960 ) ) ( not ( = ?auto_545955 ?auto_545961 ) ) ( not ( = ?auto_545955 ?auto_545962 ) ) ( not ( = ?auto_545955 ?auto_545963 ) ) ( not ( = ?auto_545955 ?auto_545964 ) ) ( not ( = ?auto_545955 ?auto_545965 ) ) ( not ( = ?auto_545955 ?auto_545966 ) ) ( not ( = ?auto_545955 ?auto_545967 ) ) ( not ( = ?auto_545955 ?auto_545968 ) ) ( not ( = ?auto_545956 ?auto_545957 ) ) ( not ( = ?auto_545956 ?auto_545958 ) ) ( not ( = ?auto_545956 ?auto_545959 ) ) ( not ( = ?auto_545956 ?auto_545960 ) ) ( not ( = ?auto_545956 ?auto_545961 ) ) ( not ( = ?auto_545956 ?auto_545962 ) ) ( not ( = ?auto_545956 ?auto_545963 ) ) ( not ( = ?auto_545956 ?auto_545964 ) ) ( not ( = ?auto_545956 ?auto_545965 ) ) ( not ( = ?auto_545956 ?auto_545966 ) ) ( not ( = ?auto_545956 ?auto_545967 ) ) ( not ( = ?auto_545956 ?auto_545968 ) ) ( not ( = ?auto_545957 ?auto_545958 ) ) ( not ( = ?auto_545957 ?auto_545959 ) ) ( not ( = ?auto_545957 ?auto_545960 ) ) ( not ( = ?auto_545957 ?auto_545961 ) ) ( not ( = ?auto_545957 ?auto_545962 ) ) ( not ( = ?auto_545957 ?auto_545963 ) ) ( not ( = ?auto_545957 ?auto_545964 ) ) ( not ( = ?auto_545957 ?auto_545965 ) ) ( not ( = ?auto_545957 ?auto_545966 ) ) ( not ( = ?auto_545957 ?auto_545967 ) ) ( not ( = ?auto_545957 ?auto_545968 ) ) ( not ( = ?auto_545958 ?auto_545959 ) ) ( not ( = ?auto_545958 ?auto_545960 ) ) ( not ( = ?auto_545958 ?auto_545961 ) ) ( not ( = ?auto_545958 ?auto_545962 ) ) ( not ( = ?auto_545958 ?auto_545963 ) ) ( not ( = ?auto_545958 ?auto_545964 ) ) ( not ( = ?auto_545958 ?auto_545965 ) ) ( not ( = ?auto_545958 ?auto_545966 ) ) ( not ( = ?auto_545958 ?auto_545967 ) ) ( not ( = ?auto_545958 ?auto_545968 ) ) ( not ( = ?auto_545959 ?auto_545960 ) ) ( not ( = ?auto_545959 ?auto_545961 ) ) ( not ( = ?auto_545959 ?auto_545962 ) ) ( not ( = ?auto_545959 ?auto_545963 ) ) ( not ( = ?auto_545959 ?auto_545964 ) ) ( not ( = ?auto_545959 ?auto_545965 ) ) ( not ( = ?auto_545959 ?auto_545966 ) ) ( not ( = ?auto_545959 ?auto_545967 ) ) ( not ( = ?auto_545959 ?auto_545968 ) ) ( not ( = ?auto_545960 ?auto_545961 ) ) ( not ( = ?auto_545960 ?auto_545962 ) ) ( not ( = ?auto_545960 ?auto_545963 ) ) ( not ( = ?auto_545960 ?auto_545964 ) ) ( not ( = ?auto_545960 ?auto_545965 ) ) ( not ( = ?auto_545960 ?auto_545966 ) ) ( not ( = ?auto_545960 ?auto_545967 ) ) ( not ( = ?auto_545960 ?auto_545968 ) ) ( not ( = ?auto_545961 ?auto_545962 ) ) ( not ( = ?auto_545961 ?auto_545963 ) ) ( not ( = ?auto_545961 ?auto_545964 ) ) ( not ( = ?auto_545961 ?auto_545965 ) ) ( not ( = ?auto_545961 ?auto_545966 ) ) ( not ( = ?auto_545961 ?auto_545967 ) ) ( not ( = ?auto_545961 ?auto_545968 ) ) ( not ( = ?auto_545962 ?auto_545963 ) ) ( not ( = ?auto_545962 ?auto_545964 ) ) ( not ( = ?auto_545962 ?auto_545965 ) ) ( not ( = ?auto_545962 ?auto_545966 ) ) ( not ( = ?auto_545962 ?auto_545967 ) ) ( not ( = ?auto_545962 ?auto_545968 ) ) ( not ( = ?auto_545963 ?auto_545964 ) ) ( not ( = ?auto_545963 ?auto_545965 ) ) ( not ( = ?auto_545963 ?auto_545966 ) ) ( not ( = ?auto_545963 ?auto_545967 ) ) ( not ( = ?auto_545963 ?auto_545968 ) ) ( not ( = ?auto_545964 ?auto_545965 ) ) ( not ( = ?auto_545964 ?auto_545966 ) ) ( not ( = ?auto_545964 ?auto_545967 ) ) ( not ( = ?auto_545964 ?auto_545968 ) ) ( not ( = ?auto_545965 ?auto_545966 ) ) ( not ( = ?auto_545965 ?auto_545967 ) ) ( not ( = ?auto_545965 ?auto_545968 ) ) ( not ( = ?auto_545966 ?auto_545967 ) ) ( not ( = ?auto_545966 ?auto_545968 ) ) ( not ( = ?auto_545967 ?auto_545968 ) ) ( ON ?auto_545966 ?auto_545967 ) ( ON ?auto_545965 ?auto_545966 ) ( ON ?auto_545964 ?auto_545965 ) ( ON ?auto_545963 ?auto_545964 ) ( ON ?auto_545962 ?auto_545963 ) ( ON ?auto_545961 ?auto_545962 ) ( ON ?auto_545960 ?auto_545961 ) ( CLEAR ?auto_545958 ) ( ON ?auto_545959 ?auto_545960 ) ( CLEAR ?auto_545959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_545952 ?auto_545953 ?auto_545954 ?auto_545955 ?auto_545956 ?auto_545957 ?auto_545958 ?auto_545959 )
      ( MAKE-16PILE ?auto_545952 ?auto_545953 ?auto_545954 ?auto_545955 ?auto_545956 ?auto_545957 ?auto_545958 ?auto_545959 ?auto_545960 ?auto_545961 ?auto_545962 ?auto_545963 ?auto_545964 ?auto_545965 ?auto_545966 ?auto_545967 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_545985 - BLOCK
      ?auto_545986 - BLOCK
      ?auto_545987 - BLOCK
      ?auto_545988 - BLOCK
      ?auto_545989 - BLOCK
      ?auto_545990 - BLOCK
      ?auto_545991 - BLOCK
      ?auto_545992 - BLOCK
      ?auto_545993 - BLOCK
      ?auto_545994 - BLOCK
      ?auto_545995 - BLOCK
      ?auto_545996 - BLOCK
      ?auto_545997 - BLOCK
      ?auto_545998 - BLOCK
      ?auto_545999 - BLOCK
      ?auto_546000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546000 ) ( ON-TABLE ?auto_545985 ) ( ON ?auto_545986 ?auto_545985 ) ( ON ?auto_545987 ?auto_545986 ) ( ON ?auto_545988 ?auto_545987 ) ( ON ?auto_545989 ?auto_545988 ) ( ON ?auto_545990 ?auto_545989 ) ( ON ?auto_545991 ?auto_545990 ) ( not ( = ?auto_545985 ?auto_545986 ) ) ( not ( = ?auto_545985 ?auto_545987 ) ) ( not ( = ?auto_545985 ?auto_545988 ) ) ( not ( = ?auto_545985 ?auto_545989 ) ) ( not ( = ?auto_545985 ?auto_545990 ) ) ( not ( = ?auto_545985 ?auto_545991 ) ) ( not ( = ?auto_545985 ?auto_545992 ) ) ( not ( = ?auto_545985 ?auto_545993 ) ) ( not ( = ?auto_545985 ?auto_545994 ) ) ( not ( = ?auto_545985 ?auto_545995 ) ) ( not ( = ?auto_545985 ?auto_545996 ) ) ( not ( = ?auto_545985 ?auto_545997 ) ) ( not ( = ?auto_545985 ?auto_545998 ) ) ( not ( = ?auto_545985 ?auto_545999 ) ) ( not ( = ?auto_545985 ?auto_546000 ) ) ( not ( = ?auto_545986 ?auto_545987 ) ) ( not ( = ?auto_545986 ?auto_545988 ) ) ( not ( = ?auto_545986 ?auto_545989 ) ) ( not ( = ?auto_545986 ?auto_545990 ) ) ( not ( = ?auto_545986 ?auto_545991 ) ) ( not ( = ?auto_545986 ?auto_545992 ) ) ( not ( = ?auto_545986 ?auto_545993 ) ) ( not ( = ?auto_545986 ?auto_545994 ) ) ( not ( = ?auto_545986 ?auto_545995 ) ) ( not ( = ?auto_545986 ?auto_545996 ) ) ( not ( = ?auto_545986 ?auto_545997 ) ) ( not ( = ?auto_545986 ?auto_545998 ) ) ( not ( = ?auto_545986 ?auto_545999 ) ) ( not ( = ?auto_545986 ?auto_546000 ) ) ( not ( = ?auto_545987 ?auto_545988 ) ) ( not ( = ?auto_545987 ?auto_545989 ) ) ( not ( = ?auto_545987 ?auto_545990 ) ) ( not ( = ?auto_545987 ?auto_545991 ) ) ( not ( = ?auto_545987 ?auto_545992 ) ) ( not ( = ?auto_545987 ?auto_545993 ) ) ( not ( = ?auto_545987 ?auto_545994 ) ) ( not ( = ?auto_545987 ?auto_545995 ) ) ( not ( = ?auto_545987 ?auto_545996 ) ) ( not ( = ?auto_545987 ?auto_545997 ) ) ( not ( = ?auto_545987 ?auto_545998 ) ) ( not ( = ?auto_545987 ?auto_545999 ) ) ( not ( = ?auto_545987 ?auto_546000 ) ) ( not ( = ?auto_545988 ?auto_545989 ) ) ( not ( = ?auto_545988 ?auto_545990 ) ) ( not ( = ?auto_545988 ?auto_545991 ) ) ( not ( = ?auto_545988 ?auto_545992 ) ) ( not ( = ?auto_545988 ?auto_545993 ) ) ( not ( = ?auto_545988 ?auto_545994 ) ) ( not ( = ?auto_545988 ?auto_545995 ) ) ( not ( = ?auto_545988 ?auto_545996 ) ) ( not ( = ?auto_545988 ?auto_545997 ) ) ( not ( = ?auto_545988 ?auto_545998 ) ) ( not ( = ?auto_545988 ?auto_545999 ) ) ( not ( = ?auto_545988 ?auto_546000 ) ) ( not ( = ?auto_545989 ?auto_545990 ) ) ( not ( = ?auto_545989 ?auto_545991 ) ) ( not ( = ?auto_545989 ?auto_545992 ) ) ( not ( = ?auto_545989 ?auto_545993 ) ) ( not ( = ?auto_545989 ?auto_545994 ) ) ( not ( = ?auto_545989 ?auto_545995 ) ) ( not ( = ?auto_545989 ?auto_545996 ) ) ( not ( = ?auto_545989 ?auto_545997 ) ) ( not ( = ?auto_545989 ?auto_545998 ) ) ( not ( = ?auto_545989 ?auto_545999 ) ) ( not ( = ?auto_545989 ?auto_546000 ) ) ( not ( = ?auto_545990 ?auto_545991 ) ) ( not ( = ?auto_545990 ?auto_545992 ) ) ( not ( = ?auto_545990 ?auto_545993 ) ) ( not ( = ?auto_545990 ?auto_545994 ) ) ( not ( = ?auto_545990 ?auto_545995 ) ) ( not ( = ?auto_545990 ?auto_545996 ) ) ( not ( = ?auto_545990 ?auto_545997 ) ) ( not ( = ?auto_545990 ?auto_545998 ) ) ( not ( = ?auto_545990 ?auto_545999 ) ) ( not ( = ?auto_545990 ?auto_546000 ) ) ( not ( = ?auto_545991 ?auto_545992 ) ) ( not ( = ?auto_545991 ?auto_545993 ) ) ( not ( = ?auto_545991 ?auto_545994 ) ) ( not ( = ?auto_545991 ?auto_545995 ) ) ( not ( = ?auto_545991 ?auto_545996 ) ) ( not ( = ?auto_545991 ?auto_545997 ) ) ( not ( = ?auto_545991 ?auto_545998 ) ) ( not ( = ?auto_545991 ?auto_545999 ) ) ( not ( = ?auto_545991 ?auto_546000 ) ) ( not ( = ?auto_545992 ?auto_545993 ) ) ( not ( = ?auto_545992 ?auto_545994 ) ) ( not ( = ?auto_545992 ?auto_545995 ) ) ( not ( = ?auto_545992 ?auto_545996 ) ) ( not ( = ?auto_545992 ?auto_545997 ) ) ( not ( = ?auto_545992 ?auto_545998 ) ) ( not ( = ?auto_545992 ?auto_545999 ) ) ( not ( = ?auto_545992 ?auto_546000 ) ) ( not ( = ?auto_545993 ?auto_545994 ) ) ( not ( = ?auto_545993 ?auto_545995 ) ) ( not ( = ?auto_545993 ?auto_545996 ) ) ( not ( = ?auto_545993 ?auto_545997 ) ) ( not ( = ?auto_545993 ?auto_545998 ) ) ( not ( = ?auto_545993 ?auto_545999 ) ) ( not ( = ?auto_545993 ?auto_546000 ) ) ( not ( = ?auto_545994 ?auto_545995 ) ) ( not ( = ?auto_545994 ?auto_545996 ) ) ( not ( = ?auto_545994 ?auto_545997 ) ) ( not ( = ?auto_545994 ?auto_545998 ) ) ( not ( = ?auto_545994 ?auto_545999 ) ) ( not ( = ?auto_545994 ?auto_546000 ) ) ( not ( = ?auto_545995 ?auto_545996 ) ) ( not ( = ?auto_545995 ?auto_545997 ) ) ( not ( = ?auto_545995 ?auto_545998 ) ) ( not ( = ?auto_545995 ?auto_545999 ) ) ( not ( = ?auto_545995 ?auto_546000 ) ) ( not ( = ?auto_545996 ?auto_545997 ) ) ( not ( = ?auto_545996 ?auto_545998 ) ) ( not ( = ?auto_545996 ?auto_545999 ) ) ( not ( = ?auto_545996 ?auto_546000 ) ) ( not ( = ?auto_545997 ?auto_545998 ) ) ( not ( = ?auto_545997 ?auto_545999 ) ) ( not ( = ?auto_545997 ?auto_546000 ) ) ( not ( = ?auto_545998 ?auto_545999 ) ) ( not ( = ?auto_545998 ?auto_546000 ) ) ( not ( = ?auto_545999 ?auto_546000 ) ) ( ON ?auto_545999 ?auto_546000 ) ( ON ?auto_545998 ?auto_545999 ) ( ON ?auto_545997 ?auto_545998 ) ( ON ?auto_545996 ?auto_545997 ) ( ON ?auto_545995 ?auto_545996 ) ( ON ?auto_545994 ?auto_545995 ) ( ON ?auto_545993 ?auto_545994 ) ( CLEAR ?auto_545991 ) ( ON ?auto_545992 ?auto_545993 ) ( CLEAR ?auto_545992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_545985 ?auto_545986 ?auto_545987 ?auto_545988 ?auto_545989 ?auto_545990 ?auto_545991 ?auto_545992 )
      ( MAKE-16PILE ?auto_545985 ?auto_545986 ?auto_545987 ?auto_545988 ?auto_545989 ?auto_545990 ?auto_545991 ?auto_545992 ?auto_545993 ?auto_545994 ?auto_545995 ?auto_545996 ?auto_545997 ?auto_545998 ?auto_545999 ?auto_546000 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546017 - BLOCK
      ?auto_546018 - BLOCK
      ?auto_546019 - BLOCK
      ?auto_546020 - BLOCK
      ?auto_546021 - BLOCK
      ?auto_546022 - BLOCK
      ?auto_546023 - BLOCK
      ?auto_546024 - BLOCK
      ?auto_546025 - BLOCK
      ?auto_546026 - BLOCK
      ?auto_546027 - BLOCK
      ?auto_546028 - BLOCK
      ?auto_546029 - BLOCK
      ?auto_546030 - BLOCK
      ?auto_546031 - BLOCK
      ?auto_546032 - BLOCK
    )
    :vars
    (
      ?auto_546033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546032 ?auto_546033 ) ( ON-TABLE ?auto_546017 ) ( ON ?auto_546018 ?auto_546017 ) ( ON ?auto_546019 ?auto_546018 ) ( ON ?auto_546020 ?auto_546019 ) ( ON ?auto_546021 ?auto_546020 ) ( ON ?auto_546022 ?auto_546021 ) ( not ( = ?auto_546017 ?auto_546018 ) ) ( not ( = ?auto_546017 ?auto_546019 ) ) ( not ( = ?auto_546017 ?auto_546020 ) ) ( not ( = ?auto_546017 ?auto_546021 ) ) ( not ( = ?auto_546017 ?auto_546022 ) ) ( not ( = ?auto_546017 ?auto_546023 ) ) ( not ( = ?auto_546017 ?auto_546024 ) ) ( not ( = ?auto_546017 ?auto_546025 ) ) ( not ( = ?auto_546017 ?auto_546026 ) ) ( not ( = ?auto_546017 ?auto_546027 ) ) ( not ( = ?auto_546017 ?auto_546028 ) ) ( not ( = ?auto_546017 ?auto_546029 ) ) ( not ( = ?auto_546017 ?auto_546030 ) ) ( not ( = ?auto_546017 ?auto_546031 ) ) ( not ( = ?auto_546017 ?auto_546032 ) ) ( not ( = ?auto_546017 ?auto_546033 ) ) ( not ( = ?auto_546018 ?auto_546019 ) ) ( not ( = ?auto_546018 ?auto_546020 ) ) ( not ( = ?auto_546018 ?auto_546021 ) ) ( not ( = ?auto_546018 ?auto_546022 ) ) ( not ( = ?auto_546018 ?auto_546023 ) ) ( not ( = ?auto_546018 ?auto_546024 ) ) ( not ( = ?auto_546018 ?auto_546025 ) ) ( not ( = ?auto_546018 ?auto_546026 ) ) ( not ( = ?auto_546018 ?auto_546027 ) ) ( not ( = ?auto_546018 ?auto_546028 ) ) ( not ( = ?auto_546018 ?auto_546029 ) ) ( not ( = ?auto_546018 ?auto_546030 ) ) ( not ( = ?auto_546018 ?auto_546031 ) ) ( not ( = ?auto_546018 ?auto_546032 ) ) ( not ( = ?auto_546018 ?auto_546033 ) ) ( not ( = ?auto_546019 ?auto_546020 ) ) ( not ( = ?auto_546019 ?auto_546021 ) ) ( not ( = ?auto_546019 ?auto_546022 ) ) ( not ( = ?auto_546019 ?auto_546023 ) ) ( not ( = ?auto_546019 ?auto_546024 ) ) ( not ( = ?auto_546019 ?auto_546025 ) ) ( not ( = ?auto_546019 ?auto_546026 ) ) ( not ( = ?auto_546019 ?auto_546027 ) ) ( not ( = ?auto_546019 ?auto_546028 ) ) ( not ( = ?auto_546019 ?auto_546029 ) ) ( not ( = ?auto_546019 ?auto_546030 ) ) ( not ( = ?auto_546019 ?auto_546031 ) ) ( not ( = ?auto_546019 ?auto_546032 ) ) ( not ( = ?auto_546019 ?auto_546033 ) ) ( not ( = ?auto_546020 ?auto_546021 ) ) ( not ( = ?auto_546020 ?auto_546022 ) ) ( not ( = ?auto_546020 ?auto_546023 ) ) ( not ( = ?auto_546020 ?auto_546024 ) ) ( not ( = ?auto_546020 ?auto_546025 ) ) ( not ( = ?auto_546020 ?auto_546026 ) ) ( not ( = ?auto_546020 ?auto_546027 ) ) ( not ( = ?auto_546020 ?auto_546028 ) ) ( not ( = ?auto_546020 ?auto_546029 ) ) ( not ( = ?auto_546020 ?auto_546030 ) ) ( not ( = ?auto_546020 ?auto_546031 ) ) ( not ( = ?auto_546020 ?auto_546032 ) ) ( not ( = ?auto_546020 ?auto_546033 ) ) ( not ( = ?auto_546021 ?auto_546022 ) ) ( not ( = ?auto_546021 ?auto_546023 ) ) ( not ( = ?auto_546021 ?auto_546024 ) ) ( not ( = ?auto_546021 ?auto_546025 ) ) ( not ( = ?auto_546021 ?auto_546026 ) ) ( not ( = ?auto_546021 ?auto_546027 ) ) ( not ( = ?auto_546021 ?auto_546028 ) ) ( not ( = ?auto_546021 ?auto_546029 ) ) ( not ( = ?auto_546021 ?auto_546030 ) ) ( not ( = ?auto_546021 ?auto_546031 ) ) ( not ( = ?auto_546021 ?auto_546032 ) ) ( not ( = ?auto_546021 ?auto_546033 ) ) ( not ( = ?auto_546022 ?auto_546023 ) ) ( not ( = ?auto_546022 ?auto_546024 ) ) ( not ( = ?auto_546022 ?auto_546025 ) ) ( not ( = ?auto_546022 ?auto_546026 ) ) ( not ( = ?auto_546022 ?auto_546027 ) ) ( not ( = ?auto_546022 ?auto_546028 ) ) ( not ( = ?auto_546022 ?auto_546029 ) ) ( not ( = ?auto_546022 ?auto_546030 ) ) ( not ( = ?auto_546022 ?auto_546031 ) ) ( not ( = ?auto_546022 ?auto_546032 ) ) ( not ( = ?auto_546022 ?auto_546033 ) ) ( not ( = ?auto_546023 ?auto_546024 ) ) ( not ( = ?auto_546023 ?auto_546025 ) ) ( not ( = ?auto_546023 ?auto_546026 ) ) ( not ( = ?auto_546023 ?auto_546027 ) ) ( not ( = ?auto_546023 ?auto_546028 ) ) ( not ( = ?auto_546023 ?auto_546029 ) ) ( not ( = ?auto_546023 ?auto_546030 ) ) ( not ( = ?auto_546023 ?auto_546031 ) ) ( not ( = ?auto_546023 ?auto_546032 ) ) ( not ( = ?auto_546023 ?auto_546033 ) ) ( not ( = ?auto_546024 ?auto_546025 ) ) ( not ( = ?auto_546024 ?auto_546026 ) ) ( not ( = ?auto_546024 ?auto_546027 ) ) ( not ( = ?auto_546024 ?auto_546028 ) ) ( not ( = ?auto_546024 ?auto_546029 ) ) ( not ( = ?auto_546024 ?auto_546030 ) ) ( not ( = ?auto_546024 ?auto_546031 ) ) ( not ( = ?auto_546024 ?auto_546032 ) ) ( not ( = ?auto_546024 ?auto_546033 ) ) ( not ( = ?auto_546025 ?auto_546026 ) ) ( not ( = ?auto_546025 ?auto_546027 ) ) ( not ( = ?auto_546025 ?auto_546028 ) ) ( not ( = ?auto_546025 ?auto_546029 ) ) ( not ( = ?auto_546025 ?auto_546030 ) ) ( not ( = ?auto_546025 ?auto_546031 ) ) ( not ( = ?auto_546025 ?auto_546032 ) ) ( not ( = ?auto_546025 ?auto_546033 ) ) ( not ( = ?auto_546026 ?auto_546027 ) ) ( not ( = ?auto_546026 ?auto_546028 ) ) ( not ( = ?auto_546026 ?auto_546029 ) ) ( not ( = ?auto_546026 ?auto_546030 ) ) ( not ( = ?auto_546026 ?auto_546031 ) ) ( not ( = ?auto_546026 ?auto_546032 ) ) ( not ( = ?auto_546026 ?auto_546033 ) ) ( not ( = ?auto_546027 ?auto_546028 ) ) ( not ( = ?auto_546027 ?auto_546029 ) ) ( not ( = ?auto_546027 ?auto_546030 ) ) ( not ( = ?auto_546027 ?auto_546031 ) ) ( not ( = ?auto_546027 ?auto_546032 ) ) ( not ( = ?auto_546027 ?auto_546033 ) ) ( not ( = ?auto_546028 ?auto_546029 ) ) ( not ( = ?auto_546028 ?auto_546030 ) ) ( not ( = ?auto_546028 ?auto_546031 ) ) ( not ( = ?auto_546028 ?auto_546032 ) ) ( not ( = ?auto_546028 ?auto_546033 ) ) ( not ( = ?auto_546029 ?auto_546030 ) ) ( not ( = ?auto_546029 ?auto_546031 ) ) ( not ( = ?auto_546029 ?auto_546032 ) ) ( not ( = ?auto_546029 ?auto_546033 ) ) ( not ( = ?auto_546030 ?auto_546031 ) ) ( not ( = ?auto_546030 ?auto_546032 ) ) ( not ( = ?auto_546030 ?auto_546033 ) ) ( not ( = ?auto_546031 ?auto_546032 ) ) ( not ( = ?auto_546031 ?auto_546033 ) ) ( not ( = ?auto_546032 ?auto_546033 ) ) ( ON ?auto_546031 ?auto_546032 ) ( ON ?auto_546030 ?auto_546031 ) ( ON ?auto_546029 ?auto_546030 ) ( ON ?auto_546028 ?auto_546029 ) ( ON ?auto_546027 ?auto_546028 ) ( ON ?auto_546026 ?auto_546027 ) ( ON ?auto_546025 ?auto_546026 ) ( ON ?auto_546024 ?auto_546025 ) ( CLEAR ?auto_546022 ) ( ON ?auto_546023 ?auto_546024 ) ( CLEAR ?auto_546023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_546017 ?auto_546018 ?auto_546019 ?auto_546020 ?auto_546021 ?auto_546022 ?auto_546023 )
      ( MAKE-16PILE ?auto_546017 ?auto_546018 ?auto_546019 ?auto_546020 ?auto_546021 ?auto_546022 ?auto_546023 ?auto_546024 ?auto_546025 ?auto_546026 ?auto_546027 ?auto_546028 ?auto_546029 ?auto_546030 ?auto_546031 ?auto_546032 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546050 - BLOCK
      ?auto_546051 - BLOCK
      ?auto_546052 - BLOCK
      ?auto_546053 - BLOCK
      ?auto_546054 - BLOCK
      ?auto_546055 - BLOCK
      ?auto_546056 - BLOCK
      ?auto_546057 - BLOCK
      ?auto_546058 - BLOCK
      ?auto_546059 - BLOCK
      ?auto_546060 - BLOCK
      ?auto_546061 - BLOCK
      ?auto_546062 - BLOCK
      ?auto_546063 - BLOCK
      ?auto_546064 - BLOCK
      ?auto_546065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546065 ) ( ON-TABLE ?auto_546050 ) ( ON ?auto_546051 ?auto_546050 ) ( ON ?auto_546052 ?auto_546051 ) ( ON ?auto_546053 ?auto_546052 ) ( ON ?auto_546054 ?auto_546053 ) ( ON ?auto_546055 ?auto_546054 ) ( not ( = ?auto_546050 ?auto_546051 ) ) ( not ( = ?auto_546050 ?auto_546052 ) ) ( not ( = ?auto_546050 ?auto_546053 ) ) ( not ( = ?auto_546050 ?auto_546054 ) ) ( not ( = ?auto_546050 ?auto_546055 ) ) ( not ( = ?auto_546050 ?auto_546056 ) ) ( not ( = ?auto_546050 ?auto_546057 ) ) ( not ( = ?auto_546050 ?auto_546058 ) ) ( not ( = ?auto_546050 ?auto_546059 ) ) ( not ( = ?auto_546050 ?auto_546060 ) ) ( not ( = ?auto_546050 ?auto_546061 ) ) ( not ( = ?auto_546050 ?auto_546062 ) ) ( not ( = ?auto_546050 ?auto_546063 ) ) ( not ( = ?auto_546050 ?auto_546064 ) ) ( not ( = ?auto_546050 ?auto_546065 ) ) ( not ( = ?auto_546051 ?auto_546052 ) ) ( not ( = ?auto_546051 ?auto_546053 ) ) ( not ( = ?auto_546051 ?auto_546054 ) ) ( not ( = ?auto_546051 ?auto_546055 ) ) ( not ( = ?auto_546051 ?auto_546056 ) ) ( not ( = ?auto_546051 ?auto_546057 ) ) ( not ( = ?auto_546051 ?auto_546058 ) ) ( not ( = ?auto_546051 ?auto_546059 ) ) ( not ( = ?auto_546051 ?auto_546060 ) ) ( not ( = ?auto_546051 ?auto_546061 ) ) ( not ( = ?auto_546051 ?auto_546062 ) ) ( not ( = ?auto_546051 ?auto_546063 ) ) ( not ( = ?auto_546051 ?auto_546064 ) ) ( not ( = ?auto_546051 ?auto_546065 ) ) ( not ( = ?auto_546052 ?auto_546053 ) ) ( not ( = ?auto_546052 ?auto_546054 ) ) ( not ( = ?auto_546052 ?auto_546055 ) ) ( not ( = ?auto_546052 ?auto_546056 ) ) ( not ( = ?auto_546052 ?auto_546057 ) ) ( not ( = ?auto_546052 ?auto_546058 ) ) ( not ( = ?auto_546052 ?auto_546059 ) ) ( not ( = ?auto_546052 ?auto_546060 ) ) ( not ( = ?auto_546052 ?auto_546061 ) ) ( not ( = ?auto_546052 ?auto_546062 ) ) ( not ( = ?auto_546052 ?auto_546063 ) ) ( not ( = ?auto_546052 ?auto_546064 ) ) ( not ( = ?auto_546052 ?auto_546065 ) ) ( not ( = ?auto_546053 ?auto_546054 ) ) ( not ( = ?auto_546053 ?auto_546055 ) ) ( not ( = ?auto_546053 ?auto_546056 ) ) ( not ( = ?auto_546053 ?auto_546057 ) ) ( not ( = ?auto_546053 ?auto_546058 ) ) ( not ( = ?auto_546053 ?auto_546059 ) ) ( not ( = ?auto_546053 ?auto_546060 ) ) ( not ( = ?auto_546053 ?auto_546061 ) ) ( not ( = ?auto_546053 ?auto_546062 ) ) ( not ( = ?auto_546053 ?auto_546063 ) ) ( not ( = ?auto_546053 ?auto_546064 ) ) ( not ( = ?auto_546053 ?auto_546065 ) ) ( not ( = ?auto_546054 ?auto_546055 ) ) ( not ( = ?auto_546054 ?auto_546056 ) ) ( not ( = ?auto_546054 ?auto_546057 ) ) ( not ( = ?auto_546054 ?auto_546058 ) ) ( not ( = ?auto_546054 ?auto_546059 ) ) ( not ( = ?auto_546054 ?auto_546060 ) ) ( not ( = ?auto_546054 ?auto_546061 ) ) ( not ( = ?auto_546054 ?auto_546062 ) ) ( not ( = ?auto_546054 ?auto_546063 ) ) ( not ( = ?auto_546054 ?auto_546064 ) ) ( not ( = ?auto_546054 ?auto_546065 ) ) ( not ( = ?auto_546055 ?auto_546056 ) ) ( not ( = ?auto_546055 ?auto_546057 ) ) ( not ( = ?auto_546055 ?auto_546058 ) ) ( not ( = ?auto_546055 ?auto_546059 ) ) ( not ( = ?auto_546055 ?auto_546060 ) ) ( not ( = ?auto_546055 ?auto_546061 ) ) ( not ( = ?auto_546055 ?auto_546062 ) ) ( not ( = ?auto_546055 ?auto_546063 ) ) ( not ( = ?auto_546055 ?auto_546064 ) ) ( not ( = ?auto_546055 ?auto_546065 ) ) ( not ( = ?auto_546056 ?auto_546057 ) ) ( not ( = ?auto_546056 ?auto_546058 ) ) ( not ( = ?auto_546056 ?auto_546059 ) ) ( not ( = ?auto_546056 ?auto_546060 ) ) ( not ( = ?auto_546056 ?auto_546061 ) ) ( not ( = ?auto_546056 ?auto_546062 ) ) ( not ( = ?auto_546056 ?auto_546063 ) ) ( not ( = ?auto_546056 ?auto_546064 ) ) ( not ( = ?auto_546056 ?auto_546065 ) ) ( not ( = ?auto_546057 ?auto_546058 ) ) ( not ( = ?auto_546057 ?auto_546059 ) ) ( not ( = ?auto_546057 ?auto_546060 ) ) ( not ( = ?auto_546057 ?auto_546061 ) ) ( not ( = ?auto_546057 ?auto_546062 ) ) ( not ( = ?auto_546057 ?auto_546063 ) ) ( not ( = ?auto_546057 ?auto_546064 ) ) ( not ( = ?auto_546057 ?auto_546065 ) ) ( not ( = ?auto_546058 ?auto_546059 ) ) ( not ( = ?auto_546058 ?auto_546060 ) ) ( not ( = ?auto_546058 ?auto_546061 ) ) ( not ( = ?auto_546058 ?auto_546062 ) ) ( not ( = ?auto_546058 ?auto_546063 ) ) ( not ( = ?auto_546058 ?auto_546064 ) ) ( not ( = ?auto_546058 ?auto_546065 ) ) ( not ( = ?auto_546059 ?auto_546060 ) ) ( not ( = ?auto_546059 ?auto_546061 ) ) ( not ( = ?auto_546059 ?auto_546062 ) ) ( not ( = ?auto_546059 ?auto_546063 ) ) ( not ( = ?auto_546059 ?auto_546064 ) ) ( not ( = ?auto_546059 ?auto_546065 ) ) ( not ( = ?auto_546060 ?auto_546061 ) ) ( not ( = ?auto_546060 ?auto_546062 ) ) ( not ( = ?auto_546060 ?auto_546063 ) ) ( not ( = ?auto_546060 ?auto_546064 ) ) ( not ( = ?auto_546060 ?auto_546065 ) ) ( not ( = ?auto_546061 ?auto_546062 ) ) ( not ( = ?auto_546061 ?auto_546063 ) ) ( not ( = ?auto_546061 ?auto_546064 ) ) ( not ( = ?auto_546061 ?auto_546065 ) ) ( not ( = ?auto_546062 ?auto_546063 ) ) ( not ( = ?auto_546062 ?auto_546064 ) ) ( not ( = ?auto_546062 ?auto_546065 ) ) ( not ( = ?auto_546063 ?auto_546064 ) ) ( not ( = ?auto_546063 ?auto_546065 ) ) ( not ( = ?auto_546064 ?auto_546065 ) ) ( ON ?auto_546064 ?auto_546065 ) ( ON ?auto_546063 ?auto_546064 ) ( ON ?auto_546062 ?auto_546063 ) ( ON ?auto_546061 ?auto_546062 ) ( ON ?auto_546060 ?auto_546061 ) ( ON ?auto_546059 ?auto_546060 ) ( ON ?auto_546058 ?auto_546059 ) ( ON ?auto_546057 ?auto_546058 ) ( CLEAR ?auto_546055 ) ( ON ?auto_546056 ?auto_546057 ) ( CLEAR ?auto_546056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_546050 ?auto_546051 ?auto_546052 ?auto_546053 ?auto_546054 ?auto_546055 ?auto_546056 )
      ( MAKE-16PILE ?auto_546050 ?auto_546051 ?auto_546052 ?auto_546053 ?auto_546054 ?auto_546055 ?auto_546056 ?auto_546057 ?auto_546058 ?auto_546059 ?auto_546060 ?auto_546061 ?auto_546062 ?auto_546063 ?auto_546064 ?auto_546065 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546082 - BLOCK
      ?auto_546083 - BLOCK
      ?auto_546084 - BLOCK
      ?auto_546085 - BLOCK
      ?auto_546086 - BLOCK
      ?auto_546087 - BLOCK
      ?auto_546088 - BLOCK
      ?auto_546089 - BLOCK
      ?auto_546090 - BLOCK
      ?auto_546091 - BLOCK
      ?auto_546092 - BLOCK
      ?auto_546093 - BLOCK
      ?auto_546094 - BLOCK
      ?auto_546095 - BLOCK
      ?auto_546096 - BLOCK
      ?auto_546097 - BLOCK
    )
    :vars
    (
      ?auto_546098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546097 ?auto_546098 ) ( ON-TABLE ?auto_546082 ) ( ON ?auto_546083 ?auto_546082 ) ( ON ?auto_546084 ?auto_546083 ) ( ON ?auto_546085 ?auto_546084 ) ( ON ?auto_546086 ?auto_546085 ) ( not ( = ?auto_546082 ?auto_546083 ) ) ( not ( = ?auto_546082 ?auto_546084 ) ) ( not ( = ?auto_546082 ?auto_546085 ) ) ( not ( = ?auto_546082 ?auto_546086 ) ) ( not ( = ?auto_546082 ?auto_546087 ) ) ( not ( = ?auto_546082 ?auto_546088 ) ) ( not ( = ?auto_546082 ?auto_546089 ) ) ( not ( = ?auto_546082 ?auto_546090 ) ) ( not ( = ?auto_546082 ?auto_546091 ) ) ( not ( = ?auto_546082 ?auto_546092 ) ) ( not ( = ?auto_546082 ?auto_546093 ) ) ( not ( = ?auto_546082 ?auto_546094 ) ) ( not ( = ?auto_546082 ?auto_546095 ) ) ( not ( = ?auto_546082 ?auto_546096 ) ) ( not ( = ?auto_546082 ?auto_546097 ) ) ( not ( = ?auto_546082 ?auto_546098 ) ) ( not ( = ?auto_546083 ?auto_546084 ) ) ( not ( = ?auto_546083 ?auto_546085 ) ) ( not ( = ?auto_546083 ?auto_546086 ) ) ( not ( = ?auto_546083 ?auto_546087 ) ) ( not ( = ?auto_546083 ?auto_546088 ) ) ( not ( = ?auto_546083 ?auto_546089 ) ) ( not ( = ?auto_546083 ?auto_546090 ) ) ( not ( = ?auto_546083 ?auto_546091 ) ) ( not ( = ?auto_546083 ?auto_546092 ) ) ( not ( = ?auto_546083 ?auto_546093 ) ) ( not ( = ?auto_546083 ?auto_546094 ) ) ( not ( = ?auto_546083 ?auto_546095 ) ) ( not ( = ?auto_546083 ?auto_546096 ) ) ( not ( = ?auto_546083 ?auto_546097 ) ) ( not ( = ?auto_546083 ?auto_546098 ) ) ( not ( = ?auto_546084 ?auto_546085 ) ) ( not ( = ?auto_546084 ?auto_546086 ) ) ( not ( = ?auto_546084 ?auto_546087 ) ) ( not ( = ?auto_546084 ?auto_546088 ) ) ( not ( = ?auto_546084 ?auto_546089 ) ) ( not ( = ?auto_546084 ?auto_546090 ) ) ( not ( = ?auto_546084 ?auto_546091 ) ) ( not ( = ?auto_546084 ?auto_546092 ) ) ( not ( = ?auto_546084 ?auto_546093 ) ) ( not ( = ?auto_546084 ?auto_546094 ) ) ( not ( = ?auto_546084 ?auto_546095 ) ) ( not ( = ?auto_546084 ?auto_546096 ) ) ( not ( = ?auto_546084 ?auto_546097 ) ) ( not ( = ?auto_546084 ?auto_546098 ) ) ( not ( = ?auto_546085 ?auto_546086 ) ) ( not ( = ?auto_546085 ?auto_546087 ) ) ( not ( = ?auto_546085 ?auto_546088 ) ) ( not ( = ?auto_546085 ?auto_546089 ) ) ( not ( = ?auto_546085 ?auto_546090 ) ) ( not ( = ?auto_546085 ?auto_546091 ) ) ( not ( = ?auto_546085 ?auto_546092 ) ) ( not ( = ?auto_546085 ?auto_546093 ) ) ( not ( = ?auto_546085 ?auto_546094 ) ) ( not ( = ?auto_546085 ?auto_546095 ) ) ( not ( = ?auto_546085 ?auto_546096 ) ) ( not ( = ?auto_546085 ?auto_546097 ) ) ( not ( = ?auto_546085 ?auto_546098 ) ) ( not ( = ?auto_546086 ?auto_546087 ) ) ( not ( = ?auto_546086 ?auto_546088 ) ) ( not ( = ?auto_546086 ?auto_546089 ) ) ( not ( = ?auto_546086 ?auto_546090 ) ) ( not ( = ?auto_546086 ?auto_546091 ) ) ( not ( = ?auto_546086 ?auto_546092 ) ) ( not ( = ?auto_546086 ?auto_546093 ) ) ( not ( = ?auto_546086 ?auto_546094 ) ) ( not ( = ?auto_546086 ?auto_546095 ) ) ( not ( = ?auto_546086 ?auto_546096 ) ) ( not ( = ?auto_546086 ?auto_546097 ) ) ( not ( = ?auto_546086 ?auto_546098 ) ) ( not ( = ?auto_546087 ?auto_546088 ) ) ( not ( = ?auto_546087 ?auto_546089 ) ) ( not ( = ?auto_546087 ?auto_546090 ) ) ( not ( = ?auto_546087 ?auto_546091 ) ) ( not ( = ?auto_546087 ?auto_546092 ) ) ( not ( = ?auto_546087 ?auto_546093 ) ) ( not ( = ?auto_546087 ?auto_546094 ) ) ( not ( = ?auto_546087 ?auto_546095 ) ) ( not ( = ?auto_546087 ?auto_546096 ) ) ( not ( = ?auto_546087 ?auto_546097 ) ) ( not ( = ?auto_546087 ?auto_546098 ) ) ( not ( = ?auto_546088 ?auto_546089 ) ) ( not ( = ?auto_546088 ?auto_546090 ) ) ( not ( = ?auto_546088 ?auto_546091 ) ) ( not ( = ?auto_546088 ?auto_546092 ) ) ( not ( = ?auto_546088 ?auto_546093 ) ) ( not ( = ?auto_546088 ?auto_546094 ) ) ( not ( = ?auto_546088 ?auto_546095 ) ) ( not ( = ?auto_546088 ?auto_546096 ) ) ( not ( = ?auto_546088 ?auto_546097 ) ) ( not ( = ?auto_546088 ?auto_546098 ) ) ( not ( = ?auto_546089 ?auto_546090 ) ) ( not ( = ?auto_546089 ?auto_546091 ) ) ( not ( = ?auto_546089 ?auto_546092 ) ) ( not ( = ?auto_546089 ?auto_546093 ) ) ( not ( = ?auto_546089 ?auto_546094 ) ) ( not ( = ?auto_546089 ?auto_546095 ) ) ( not ( = ?auto_546089 ?auto_546096 ) ) ( not ( = ?auto_546089 ?auto_546097 ) ) ( not ( = ?auto_546089 ?auto_546098 ) ) ( not ( = ?auto_546090 ?auto_546091 ) ) ( not ( = ?auto_546090 ?auto_546092 ) ) ( not ( = ?auto_546090 ?auto_546093 ) ) ( not ( = ?auto_546090 ?auto_546094 ) ) ( not ( = ?auto_546090 ?auto_546095 ) ) ( not ( = ?auto_546090 ?auto_546096 ) ) ( not ( = ?auto_546090 ?auto_546097 ) ) ( not ( = ?auto_546090 ?auto_546098 ) ) ( not ( = ?auto_546091 ?auto_546092 ) ) ( not ( = ?auto_546091 ?auto_546093 ) ) ( not ( = ?auto_546091 ?auto_546094 ) ) ( not ( = ?auto_546091 ?auto_546095 ) ) ( not ( = ?auto_546091 ?auto_546096 ) ) ( not ( = ?auto_546091 ?auto_546097 ) ) ( not ( = ?auto_546091 ?auto_546098 ) ) ( not ( = ?auto_546092 ?auto_546093 ) ) ( not ( = ?auto_546092 ?auto_546094 ) ) ( not ( = ?auto_546092 ?auto_546095 ) ) ( not ( = ?auto_546092 ?auto_546096 ) ) ( not ( = ?auto_546092 ?auto_546097 ) ) ( not ( = ?auto_546092 ?auto_546098 ) ) ( not ( = ?auto_546093 ?auto_546094 ) ) ( not ( = ?auto_546093 ?auto_546095 ) ) ( not ( = ?auto_546093 ?auto_546096 ) ) ( not ( = ?auto_546093 ?auto_546097 ) ) ( not ( = ?auto_546093 ?auto_546098 ) ) ( not ( = ?auto_546094 ?auto_546095 ) ) ( not ( = ?auto_546094 ?auto_546096 ) ) ( not ( = ?auto_546094 ?auto_546097 ) ) ( not ( = ?auto_546094 ?auto_546098 ) ) ( not ( = ?auto_546095 ?auto_546096 ) ) ( not ( = ?auto_546095 ?auto_546097 ) ) ( not ( = ?auto_546095 ?auto_546098 ) ) ( not ( = ?auto_546096 ?auto_546097 ) ) ( not ( = ?auto_546096 ?auto_546098 ) ) ( not ( = ?auto_546097 ?auto_546098 ) ) ( ON ?auto_546096 ?auto_546097 ) ( ON ?auto_546095 ?auto_546096 ) ( ON ?auto_546094 ?auto_546095 ) ( ON ?auto_546093 ?auto_546094 ) ( ON ?auto_546092 ?auto_546093 ) ( ON ?auto_546091 ?auto_546092 ) ( ON ?auto_546090 ?auto_546091 ) ( ON ?auto_546089 ?auto_546090 ) ( ON ?auto_546088 ?auto_546089 ) ( CLEAR ?auto_546086 ) ( ON ?auto_546087 ?auto_546088 ) ( CLEAR ?auto_546087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_546082 ?auto_546083 ?auto_546084 ?auto_546085 ?auto_546086 ?auto_546087 )
      ( MAKE-16PILE ?auto_546082 ?auto_546083 ?auto_546084 ?auto_546085 ?auto_546086 ?auto_546087 ?auto_546088 ?auto_546089 ?auto_546090 ?auto_546091 ?auto_546092 ?auto_546093 ?auto_546094 ?auto_546095 ?auto_546096 ?auto_546097 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546115 - BLOCK
      ?auto_546116 - BLOCK
      ?auto_546117 - BLOCK
      ?auto_546118 - BLOCK
      ?auto_546119 - BLOCK
      ?auto_546120 - BLOCK
      ?auto_546121 - BLOCK
      ?auto_546122 - BLOCK
      ?auto_546123 - BLOCK
      ?auto_546124 - BLOCK
      ?auto_546125 - BLOCK
      ?auto_546126 - BLOCK
      ?auto_546127 - BLOCK
      ?auto_546128 - BLOCK
      ?auto_546129 - BLOCK
      ?auto_546130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546130 ) ( ON-TABLE ?auto_546115 ) ( ON ?auto_546116 ?auto_546115 ) ( ON ?auto_546117 ?auto_546116 ) ( ON ?auto_546118 ?auto_546117 ) ( ON ?auto_546119 ?auto_546118 ) ( not ( = ?auto_546115 ?auto_546116 ) ) ( not ( = ?auto_546115 ?auto_546117 ) ) ( not ( = ?auto_546115 ?auto_546118 ) ) ( not ( = ?auto_546115 ?auto_546119 ) ) ( not ( = ?auto_546115 ?auto_546120 ) ) ( not ( = ?auto_546115 ?auto_546121 ) ) ( not ( = ?auto_546115 ?auto_546122 ) ) ( not ( = ?auto_546115 ?auto_546123 ) ) ( not ( = ?auto_546115 ?auto_546124 ) ) ( not ( = ?auto_546115 ?auto_546125 ) ) ( not ( = ?auto_546115 ?auto_546126 ) ) ( not ( = ?auto_546115 ?auto_546127 ) ) ( not ( = ?auto_546115 ?auto_546128 ) ) ( not ( = ?auto_546115 ?auto_546129 ) ) ( not ( = ?auto_546115 ?auto_546130 ) ) ( not ( = ?auto_546116 ?auto_546117 ) ) ( not ( = ?auto_546116 ?auto_546118 ) ) ( not ( = ?auto_546116 ?auto_546119 ) ) ( not ( = ?auto_546116 ?auto_546120 ) ) ( not ( = ?auto_546116 ?auto_546121 ) ) ( not ( = ?auto_546116 ?auto_546122 ) ) ( not ( = ?auto_546116 ?auto_546123 ) ) ( not ( = ?auto_546116 ?auto_546124 ) ) ( not ( = ?auto_546116 ?auto_546125 ) ) ( not ( = ?auto_546116 ?auto_546126 ) ) ( not ( = ?auto_546116 ?auto_546127 ) ) ( not ( = ?auto_546116 ?auto_546128 ) ) ( not ( = ?auto_546116 ?auto_546129 ) ) ( not ( = ?auto_546116 ?auto_546130 ) ) ( not ( = ?auto_546117 ?auto_546118 ) ) ( not ( = ?auto_546117 ?auto_546119 ) ) ( not ( = ?auto_546117 ?auto_546120 ) ) ( not ( = ?auto_546117 ?auto_546121 ) ) ( not ( = ?auto_546117 ?auto_546122 ) ) ( not ( = ?auto_546117 ?auto_546123 ) ) ( not ( = ?auto_546117 ?auto_546124 ) ) ( not ( = ?auto_546117 ?auto_546125 ) ) ( not ( = ?auto_546117 ?auto_546126 ) ) ( not ( = ?auto_546117 ?auto_546127 ) ) ( not ( = ?auto_546117 ?auto_546128 ) ) ( not ( = ?auto_546117 ?auto_546129 ) ) ( not ( = ?auto_546117 ?auto_546130 ) ) ( not ( = ?auto_546118 ?auto_546119 ) ) ( not ( = ?auto_546118 ?auto_546120 ) ) ( not ( = ?auto_546118 ?auto_546121 ) ) ( not ( = ?auto_546118 ?auto_546122 ) ) ( not ( = ?auto_546118 ?auto_546123 ) ) ( not ( = ?auto_546118 ?auto_546124 ) ) ( not ( = ?auto_546118 ?auto_546125 ) ) ( not ( = ?auto_546118 ?auto_546126 ) ) ( not ( = ?auto_546118 ?auto_546127 ) ) ( not ( = ?auto_546118 ?auto_546128 ) ) ( not ( = ?auto_546118 ?auto_546129 ) ) ( not ( = ?auto_546118 ?auto_546130 ) ) ( not ( = ?auto_546119 ?auto_546120 ) ) ( not ( = ?auto_546119 ?auto_546121 ) ) ( not ( = ?auto_546119 ?auto_546122 ) ) ( not ( = ?auto_546119 ?auto_546123 ) ) ( not ( = ?auto_546119 ?auto_546124 ) ) ( not ( = ?auto_546119 ?auto_546125 ) ) ( not ( = ?auto_546119 ?auto_546126 ) ) ( not ( = ?auto_546119 ?auto_546127 ) ) ( not ( = ?auto_546119 ?auto_546128 ) ) ( not ( = ?auto_546119 ?auto_546129 ) ) ( not ( = ?auto_546119 ?auto_546130 ) ) ( not ( = ?auto_546120 ?auto_546121 ) ) ( not ( = ?auto_546120 ?auto_546122 ) ) ( not ( = ?auto_546120 ?auto_546123 ) ) ( not ( = ?auto_546120 ?auto_546124 ) ) ( not ( = ?auto_546120 ?auto_546125 ) ) ( not ( = ?auto_546120 ?auto_546126 ) ) ( not ( = ?auto_546120 ?auto_546127 ) ) ( not ( = ?auto_546120 ?auto_546128 ) ) ( not ( = ?auto_546120 ?auto_546129 ) ) ( not ( = ?auto_546120 ?auto_546130 ) ) ( not ( = ?auto_546121 ?auto_546122 ) ) ( not ( = ?auto_546121 ?auto_546123 ) ) ( not ( = ?auto_546121 ?auto_546124 ) ) ( not ( = ?auto_546121 ?auto_546125 ) ) ( not ( = ?auto_546121 ?auto_546126 ) ) ( not ( = ?auto_546121 ?auto_546127 ) ) ( not ( = ?auto_546121 ?auto_546128 ) ) ( not ( = ?auto_546121 ?auto_546129 ) ) ( not ( = ?auto_546121 ?auto_546130 ) ) ( not ( = ?auto_546122 ?auto_546123 ) ) ( not ( = ?auto_546122 ?auto_546124 ) ) ( not ( = ?auto_546122 ?auto_546125 ) ) ( not ( = ?auto_546122 ?auto_546126 ) ) ( not ( = ?auto_546122 ?auto_546127 ) ) ( not ( = ?auto_546122 ?auto_546128 ) ) ( not ( = ?auto_546122 ?auto_546129 ) ) ( not ( = ?auto_546122 ?auto_546130 ) ) ( not ( = ?auto_546123 ?auto_546124 ) ) ( not ( = ?auto_546123 ?auto_546125 ) ) ( not ( = ?auto_546123 ?auto_546126 ) ) ( not ( = ?auto_546123 ?auto_546127 ) ) ( not ( = ?auto_546123 ?auto_546128 ) ) ( not ( = ?auto_546123 ?auto_546129 ) ) ( not ( = ?auto_546123 ?auto_546130 ) ) ( not ( = ?auto_546124 ?auto_546125 ) ) ( not ( = ?auto_546124 ?auto_546126 ) ) ( not ( = ?auto_546124 ?auto_546127 ) ) ( not ( = ?auto_546124 ?auto_546128 ) ) ( not ( = ?auto_546124 ?auto_546129 ) ) ( not ( = ?auto_546124 ?auto_546130 ) ) ( not ( = ?auto_546125 ?auto_546126 ) ) ( not ( = ?auto_546125 ?auto_546127 ) ) ( not ( = ?auto_546125 ?auto_546128 ) ) ( not ( = ?auto_546125 ?auto_546129 ) ) ( not ( = ?auto_546125 ?auto_546130 ) ) ( not ( = ?auto_546126 ?auto_546127 ) ) ( not ( = ?auto_546126 ?auto_546128 ) ) ( not ( = ?auto_546126 ?auto_546129 ) ) ( not ( = ?auto_546126 ?auto_546130 ) ) ( not ( = ?auto_546127 ?auto_546128 ) ) ( not ( = ?auto_546127 ?auto_546129 ) ) ( not ( = ?auto_546127 ?auto_546130 ) ) ( not ( = ?auto_546128 ?auto_546129 ) ) ( not ( = ?auto_546128 ?auto_546130 ) ) ( not ( = ?auto_546129 ?auto_546130 ) ) ( ON ?auto_546129 ?auto_546130 ) ( ON ?auto_546128 ?auto_546129 ) ( ON ?auto_546127 ?auto_546128 ) ( ON ?auto_546126 ?auto_546127 ) ( ON ?auto_546125 ?auto_546126 ) ( ON ?auto_546124 ?auto_546125 ) ( ON ?auto_546123 ?auto_546124 ) ( ON ?auto_546122 ?auto_546123 ) ( ON ?auto_546121 ?auto_546122 ) ( CLEAR ?auto_546119 ) ( ON ?auto_546120 ?auto_546121 ) ( CLEAR ?auto_546120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_546115 ?auto_546116 ?auto_546117 ?auto_546118 ?auto_546119 ?auto_546120 )
      ( MAKE-16PILE ?auto_546115 ?auto_546116 ?auto_546117 ?auto_546118 ?auto_546119 ?auto_546120 ?auto_546121 ?auto_546122 ?auto_546123 ?auto_546124 ?auto_546125 ?auto_546126 ?auto_546127 ?auto_546128 ?auto_546129 ?auto_546130 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546147 - BLOCK
      ?auto_546148 - BLOCK
      ?auto_546149 - BLOCK
      ?auto_546150 - BLOCK
      ?auto_546151 - BLOCK
      ?auto_546152 - BLOCK
      ?auto_546153 - BLOCK
      ?auto_546154 - BLOCK
      ?auto_546155 - BLOCK
      ?auto_546156 - BLOCK
      ?auto_546157 - BLOCK
      ?auto_546158 - BLOCK
      ?auto_546159 - BLOCK
      ?auto_546160 - BLOCK
      ?auto_546161 - BLOCK
      ?auto_546162 - BLOCK
    )
    :vars
    (
      ?auto_546163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546162 ?auto_546163 ) ( ON-TABLE ?auto_546147 ) ( ON ?auto_546148 ?auto_546147 ) ( ON ?auto_546149 ?auto_546148 ) ( ON ?auto_546150 ?auto_546149 ) ( not ( = ?auto_546147 ?auto_546148 ) ) ( not ( = ?auto_546147 ?auto_546149 ) ) ( not ( = ?auto_546147 ?auto_546150 ) ) ( not ( = ?auto_546147 ?auto_546151 ) ) ( not ( = ?auto_546147 ?auto_546152 ) ) ( not ( = ?auto_546147 ?auto_546153 ) ) ( not ( = ?auto_546147 ?auto_546154 ) ) ( not ( = ?auto_546147 ?auto_546155 ) ) ( not ( = ?auto_546147 ?auto_546156 ) ) ( not ( = ?auto_546147 ?auto_546157 ) ) ( not ( = ?auto_546147 ?auto_546158 ) ) ( not ( = ?auto_546147 ?auto_546159 ) ) ( not ( = ?auto_546147 ?auto_546160 ) ) ( not ( = ?auto_546147 ?auto_546161 ) ) ( not ( = ?auto_546147 ?auto_546162 ) ) ( not ( = ?auto_546147 ?auto_546163 ) ) ( not ( = ?auto_546148 ?auto_546149 ) ) ( not ( = ?auto_546148 ?auto_546150 ) ) ( not ( = ?auto_546148 ?auto_546151 ) ) ( not ( = ?auto_546148 ?auto_546152 ) ) ( not ( = ?auto_546148 ?auto_546153 ) ) ( not ( = ?auto_546148 ?auto_546154 ) ) ( not ( = ?auto_546148 ?auto_546155 ) ) ( not ( = ?auto_546148 ?auto_546156 ) ) ( not ( = ?auto_546148 ?auto_546157 ) ) ( not ( = ?auto_546148 ?auto_546158 ) ) ( not ( = ?auto_546148 ?auto_546159 ) ) ( not ( = ?auto_546148 ?auto_546160 ) ) ( not ( = ?auto_546148 ?auto_546161 ) ) ( not ( = ?auto_546148 ?auto_546162 ) ) ( not ( = ?auto_546148 ?auto_546163 ) ) ( not ( = ?auto_546149 ?auto_546150 ) ) ( not ( = ?auto_546149 ?auto_546151 ) ) ( not ( = ?auto_546149 ?auto_546152 ) ) ( not ( = ?auto_546149 ?auto_546153 ) ) ( not ( = ?auto_546149 ?auto_546154 ) ) ( not ( = ?auto_546149 ?auto_546155 ) ) ( not ( = ?auto_546149 ?auto_546156 ) ) ( not ( = ?auto_546149 ?auto_546157 ) ) ( not ( = ?auto_546149 ?auto_546158 ) ) ( not ( = ?auto_546149 ?auto_546159 ) ) ( not ( = ?auto_546149 ?auto_546160 ) ) ( not ( = ?auto_546149 ?auto_546161 ) ) ( not ( = ?auto_546149 ?auto_546162 ) ) ( not ( = ?auto_546149 ?auto_546163 ) ) ( not ( = ?auto_546150 ?auto_546151 ) ) ( not ( = ?auto_546150 ?auto_546152 ) ) ( not ( = ?auto_546150 ?auto_546153 ) ) ( not ( = ?auto_546150 ?auto_546154 ) ) ( not ( = ?auto_546150 ?auto_546155 ) ) ( not ( = ?auto_546150 ?auto_546156 ) ) ( not ( = ?auto_546150 ?auto_546157 ) ) ( not ( = ?auto_546150 ?auto_546158 ) ) ( not ( = ?auto_546150 ?auto_546159 ) ) ( not ( = ?auto_546150 ?auto_546160 ) ) ( not ( = ?auto_546150 ?auto_546161 ) ) ( not ( = ?auto_546150 ?auto_546162 ) ) ( not ( = ?auto_546150 ?auto_546163 ) ) ( not ( = ?auto_546151 ?auto_546152 ) ) ( not ( = ?auto_546151 ?auto_546153 ) ) ( not ( = ?auto_546151 ?auto_546154 ) ) ( not ( = ?auto_546151 ?auto_546155 ) ) ( not ( = ?auto_546151 ?auto_546156 ) ) ( not ( = ?auto_546151 ?auto_546157 ) ) ( not ( = ?auto_546151 ?auto_546158 ) ) ( not ( = ?auto_546151 ?auto_546159 ) ) ( not ( = ?auto_546151 ?auto_546160 ) ) ( not ( = ?auto_546151 ?auto_546161 ) ) ( not ( = ?auto_546151 ?auto_546162 ) ) ( not ( = ?auto_546151 ?auto_546163 ) ) ( not ( = ?auto_546152 ?auto_546153 ) ) ( not ( = ?auto_546152 ?auto_546154 ) ) ( not ( = ?auto_546152 ?auto_546155 ) ) ( not ( = ?auto_546152 ?auto_546156 ) ) ( not ( = ?auto_546152 ?auto_546157 ) ) ( not ( = ?auto_546152 ?auto_546158 ) ) ( not ( = ?auto_546152 ?auto_546159 ) ) ( not ( = ?auto_546152 ?auto_546160 ) ) ( not ( = ?auto_546152 ?auto_546161 ) ) ( not ( = ?auto_546152 ?auto_546162 ) ) ( not ( = ?auto_546152 ?auto_546163 ) ) ( not ( = ?auto_546153 ?auto_546154 ) ) ( not ( = ?auto_546153 ?auto_546155 ) ) ( not ( = ?auto_546153 ?auto_546156 ) ) ( not ( = ?auto_546153 ?auto_546157 ) ) ( not ( = ?auto_546153 ?auto_546158 ) ) ( not ( = ?auto_546153 ?auto_546159 ) ) ( not ( = ?auto_546153 ?auto_546160 ) ) ( not ( = ?auto_546153 ?auto_546161 ) ) ( not ( = ?auto_546153 ?auto_546162 ) ) ( not ( = ?auto_546153 ?auto_546163 ) ) ( not ( = ?auto_546154 ?auto_546155 ) ) ( not ( = ?auto_546154 ?auto_546156 ) ) ( not ( = ?auto_546154 ?auto_546157 ) ) ( not ( = ?auto_546154 ?auto_546158 ) ) ( not ( = ?auto_546154 ?auto_546159 ) ) ( not ( = ?auto_546154 ?auto_546160 ) ) ( not ( = ?auto_546154 ?auto_546161 ) ) ( not ( = ?auto_546154 ?auto_546162 ) ) ( not ( = ?auto_546154 ?auto_546163 ) ) ( not ( = ?auto_546155 ?auto_546156 ) ) ( not ( = ?auto_546155 ?auto_546157 ) ) ( not ( = ?auto_546155 ?auto_546158 ) ) ( not ( = ?auto_546155 ?auto_546159 ) ) ( not ( = ?auto_546155 ?auto_546160 ) ) ( not ( = ?auto_546155 ?auto_546161 ) ) ( not ( = ?auto_546155 ?auto_546162 ) ) ( not ( = ?auto_546155 ?auto_546163 ) ) ( not ( = ?auto_546156 ?auto_546157 ) ) ( not ( = ?auto_546156 ?auto_546158 ) ) ( not ( = ?auto_546156 ?auto_546159 ) ) ( not ( = ?auto_546156 ?auto_546160 ) ) ( not ( = ?auto_546156 ?auto_546161 ) ) ( not ( = ?auto_546156 ?auto_546162 ) ) ( not ( = ?auto_546156 ?auto_546163 ) ) ( not ( = ?auto_546157 ?auto_546158 ) ) ( not ( = ?auto_546157 ?auto_546159 ) ) ( not ( = ?auto_546157 ?auto_546160 ) ) ( not ( = ?auto_546157 ?auto_546161 ) ) ( not ( = ?auto_546157 ?auto_546162 ) ) ( not ( = ?auto_546157 ?auto_546163 ) ) ( not ( = ?auto_546158 ?auto_546159 ) ) ( not ( = ?auto_546158 ?auto_546160 ) ) ( not ( = ?auto_546158 ?auto_546161 ) ) ( not ( = ?auto_546158 ?auto_546162 ) ) ( not ( = ?auto_546158 ?auto_546163 ) ) ( not ( = ?auto_546159 ?auto_546160 ) ) ( not ( = ?auto_546159 ?auto_546161 ) ) ( not ( = ?auto_546159 ?auto_546162 ) ) ( not ( = ?auto_546159 ?auto_546163 ) ) ( not ( = ?auto_546160 ?auto_546161 ) ) ( not ( = ?auto_546160 ?auto_546162 ) ) ( not ( = ?auto_546160 ?auto_546163 ) ) ( not ( = ?auto_546161 ?auto_546162 ) ) ( not ( = ?auto_546161 ?auto_546163 ) ) ( not ( = ?auto_546162 ?auto_546163 ) ) ( ON ?auto_546161 ?auto_546162 ) ( ON ?auto_546160 ?auto_546161 ) ( ON ?auto_546159 ?auto_546160 ) ( ON ?auto_546158 ?auto_546159 ) ( ON ?auto_546157 ?auto_546158 ) ( ON ?auto_546156 ?auto_546157 ) ( ON ?auto_546155 ?auto_546156 ) ( ON ?auto_546154 ?auto_546155 ) ( ON ?auto_546153 ?auto_546154 ) ( ON ?auto_546152 ?auto_546153 ) ( CLEAR ?auto_546150 ) ( ON ?auto_546151 ?auto_546152 ) ( CLEAR ?auto_546151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_546147 ?auto_546148 ?auto_546149 ?auto_546150 ?auto_546151 )
      ( MAKE-16PILE ?auto_546147 ?auto_546148 ?auto_546149 ?auto_546150 ?auto_546151 ?auto_546152 ?auto_546153 ?auto_546154 ?auto_546155 ?auto_546156 ?auto_546157 ?auto_546158 ?auto_546159 ?auto_546160 ?auto_546161 ?auto_546162 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546180 - BLOCK
      ?auto_546181 - BLOCK
      ?auto_546182 - BLOCK
      ?auto_546183 - BLOCK
      ?auto_546184 - BLOCK
      ?auto_546185 - BLOCK
      ?auto_546186 - BLOCK
      ?auto_546187 - BLOCK
      ?auto_546188 - BLOCK
      ?auto_546189 - BLOCK
      ?auto_546190 - BLOCK
      ?auto_546191 - BLOCK
      ?auto_546192 - BLOCK
      ?auto_546193 - BLOCK
      ?auto_546194 - BLOCK
      ?auto_546195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546195 ) ( ON-TABLE ?auto_546180 ) ( ON ?auto_546181 ?auto_546180 ) ( ON ?auto_546182 ?auto_546181 ) ( ON ?auto_546183 ?auto_546182 ) ( not ( = ?auto_546180 ?auto_546181 ) ) ( not ( = ?auto_546180 ?auto_546182 ) ) ( not ( = ?auto_546180 ?auto_546183 ) ) ( not ( = ?auto_546180 ?auto_546184 ) ) ( not ( = ?auto_546180 ?auto_546185 ) ) ( not ( = ?auto_546180 ?auto_546186 ) ) ( not ( = ?auto_546180 ?auto_546187 ) ) ( not ( = ?auto_546180 ?auto_546188 ) ) ( not ( = ?auto_546180 ?auto_546189 ) ) ( not ( = ?auto_546180 ?auto_546190 ) ) ( not ( = ?auto_546180 ?auto_546191 ) ) ( not ( = ?auto_546180 ?auto_546192 ) ) ( not ( = ?auto_546180 ?auto_546193 ) ) ( not ( = ?auto_546180 ?auto_546194 ) ) ( not ( = ?auto_546180 ?auto_546195 ) ) ( not ( = ?auto_546181 ?auto_546182 ) ) ( not ( = ?auto_546181 ?auto_546183 ) ) ( not ( = ?auto_546181 ?auto_546184 ) ) ( not ( = ?auto_546181 ?auto_546185 ) ) ( not ( = ?auto_546181 ?auto_546186 ) ) ( not ( = ?auto_546181 ?auto_546187 ) ) ( not ( = ?auto_546181 ?auto_546188 ) ) ( not ( = ?auto_546181 ?auto_546189 ) ) ( not ( = ?auto_546181 ?auto_546190 ) ) ( not ( = ?auto_546181 ?auto_546191 ) ) ( not ( = ?auto_546181 ?auto_546192 ) ) ( not ( = ?auto_546181 ?auto_546193 ) ) ( not ( = ?auto_546181 ?auto_546194 ) ) ( not ( = ?auto_546181 ?auto_546195 ) ) ( not ( = ?auto_546182 ?auto_546183 ) ) ( not ( = ?auto_546182 ?auto_546184 ) ) ( not ( = ?auto_546182 ?auto_546185 ) ) ( not ( = ?auto_546182 ?auto_546186 ) ) ( not ( = ?auto_546182 ?auto_546187 ) ) ( not ( = ?auto_546182 ?auto_546188 ) ) ( not ( = ?auto_546182 ?auto_546189 ) ) ( not ( = ?auto_546182 ?auto_546190 ) ) ( not ( = ?auto_546182 ?auto_546191 ) ) ( not ( = ?auto_546182 ?auto_546192 ) ) ( not ( = ?auto_546182 ?auto_546193 ) ) ( not ( = ?auto_546182 ?auto_546194 ) ) ( not ( = ?auto_546182 ?auto_546195 ) ) ( not ( = ?auto_546183 ?auto_546184 ) ) ( not ( = ?auto_546183 ?auto_546185 ) ) ( not ( = ?auto_546183 ?auto_546186 ) ) ( not ( = ?auto_546183 ?auto_546187 ) ) ( not ( = ?auto_546183 ?auto_546188 ) ) ( not ( = ?auto_546183 ?auto_546189 ) ) ( not ( = ?auto_546183 ?auto_546190 ) ) ( not ( = ?auto_546183 ?auto_546191 ) ) ( not ( = ?auto_546183 ?auto_546192 ) ) ( not ( = ?auto_546183 ?auto_546193 ) ) ( not ( = ?auto_546183 ?auto_546194 ) ) ( not ( = ?auto_546183 ?auto_546195 ) ) ( not ( = ?auto_546184 ?auto_546185 ) ) ( not ( = ?auto_546184 ?auto_546186 ) ) ( not ( = ?auto_546184 ?auto_546187 ) ) ( not ( = ?auto_546184 ?auto_546188 ) ) ( not ( = ?auto_546184 ?auto_546189 ) ) ( not ( = ?auto_546184 ?auto_546190 ) ) ( not ( = ?auto_546184 ?auto_546191 ) ) ( not ( = ?auto_546184 ?auto_546192 ) ) ( not ( = ?auto_546184 ?auto_546193 ) ) ( not ( = ?auto_546184 ?auto_546194 ) ) ( not ( = ?auto_546184 ?auto_546195 ) ) ( not ( = ?auto_546185 ?auto_546186 ) ) ( not ( = ?auto_546185 ?auto_546187 ) ) ( not ( = ?auto_546185 ?auto_546188 ) ) ( not ( = ?auto_546185 ?auto_546189 ) ) ( not ( = ?auto_546185 ?auto_546190 ) ) ( not ( = ?auto_546185 ?auto_546191 ) ) ( not ( = ?auto_546185 ?auto_546192 ) ) ( not ( = ?auto_546185 ?auto_546193 ) ) ( not ( = ?auto_546185 ?auto_546194 ) ) ( not ( = ?auto_546185 ?auto_546195 ) ) ( not ( = ?auto_546186 ?auto_546187 ) ) ( not ( = ?auto_546186 ?auto_546188 ) ) ( not ( = ?auto_546186 ?auto_546189 ) ) ( not ( = ?auto_546186 ?auto_546190 ) ) ( not ( = ?auto_546186 ?auto_546191 ) ) ( not ( = ?auto_546186 ?auto_546192 ) ) ( not ( = ?auto_546186 ?auto_546193 ) ) ( not ( = ?auto_546186 ?auto_546194 ) ) ( not ( = ?auto_546186 ?auto_546195 ) ) ( not ( = ?auto_546187 ?auto_546188 ) ) ( not ( = ?auto_546187 ?auto_546189 ) ) ( not ( = ?auto_546187 ?auto_546190 ) ) ( not ( = ?auto_546187 ?auto_546191 ) ) ( not ( = ?auto_546187 ?auto_546192 ) ) ( not ( = ?auto_546187 ?auto_546193 ) ) ( not ( = ?auto_546187 ?auto_546194 ) ) ( not ( = ?auto_546187 ?auto_546195 ) ) ( not ( = ?auto_546188 ?auto_546189 ) ) ( not ( = ?auto_546188 ?auto_546190 ) ) ( not ( = ?auto_546188 ?auto_546191 ) ) ( not ( = ?auto_546188 ?auto_546192 ) ) ( not ( = ?auto_546188 ?auto_546193 ) ) ( not ( = ?auto_546188 ?auto_546194 ) ) ( not ( = ?auto_546188 ?auto_546195 ) ) ( not ( = ?auto_546189 ?auto_546190 ) ) ( not ( = ?auto_546189 ?auto_546191 ) ) ( not ( = ?auto_546189 ?auto_546192 ) ) ( not ( = ?auto_546189 ?auto_546193 ) ) ( not ( = ?auto_546189 ?auto_546194 ) ) ( not ( = ?auto_546189 ?auto_546195 ) ) ( not ( = ?auto_546190 ?auto_546191 ) ) ( not ( = ?auto_546190 ?auto_546192 ) ) ( not ( = ?auto_546190 ?auto_546193 ) ) ( not ( = ?auto_546190 ?auto_546194 ) ) ( not ( = ?auto_546190 ?auto_546195 ) ) ( not ( = ?auto_546191 ?auto_546192 ) ) ( not ( = ?auto_546191 ?auto_546193 ) ) ( not ( = ?auto_546191 ?auto_546194 ) ) ( not ( = ?auto_546191 ?auto_546195 ) ) ( not ( = ?auto_546192 ?auto_546193 ) ) ( not ( = ?auto_546192 ?auto_546194 ) ) ( not ( = ?auto_546192 ?auto_546195 ) ) ( not ( = ?auto_546193 ?auto_546194 ) ) ( not ( = ?auto_546193 ?auto_546195 ) ) ( not ( = ?auto_546194 ?auto_546195 ) ) ( ON ?auto_546194 ?auto_546195 ) ( ON ?auto_546193 ?auto_546194 ) ( ON ?auto_546192 ?auto_546193 ) ( ON ?auto_546191 ?auto_546192 ) ( ON ?auto_546190 ?auto_546191 ) ( ON ?auto_546189 ?auto_546190 ) ( ON ?auto_546188 ?auto_546189 ) ( ON ?auto_546187 ?auto_546188 ) ( ON ?auto_546186 ?auto_546187 ) ( ON ?auto_546185 ?auto_546186 ) ( CLEAR ?auto_546183 ) ( ON ?auto_546184 ?auto_546185 ) ( CLEAR ?auto_546184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_546180 ?auto_546181 ?auto_546182 ?auto_546183 ?auto_546184 )
      ( MAKE-16PILE ?auto_546180 ?auto_546181 ?auto_546182 ?auto_546183 ?auto_546184 ?auto_546185 ?auto_546186 ?auto_546187 ?auto_546188 ?auto_546189 ?auto_546190 ?auto_546191 ?auto_546192 ?auto_546193 ?auto_546194 ?auto_546195 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546212 - BLOCK
      ?auto_546213 - BLOCK
      ?auto_546214 - BLOCK
      ?auto_546215 - BLOCK
      ?auto_546216 - BLOCK
      ?auto_546217 - BLOCK
      ?auto_546218 - BLOCK
      ?auto_546219 - BLOCK
      ?auto_546220 - BLOCK
      ?auto_546221 - BLOCK
      ?auto_546222 - BLOCK
      ?auto_546223 - BLOCK
      ?auto_546224 - BLOCK
      ?auto_546225 - BLOCK
      ?auto_546226 - BLOCK
      ?auto_546227 - BLOCK
    )
    :vars
    (
      ?auto_546228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546227 ?auto_546228 ) ( ON-TABLE ?auto_546212 ) ( ON ?auto_546213 ?auto_546212 ) ( ON ?auto_546214 ?auto_546213 ) ( not ( = ?auto_546212 ?auto_546213 ) ) ( not ( = ?auto_546212 ?auto_546214 ) ) ( not ( = ?auto_546212 ?auto_546215 ) ) ( not ( = ?auto_546212 ?auto_546216 ) ) ( not ( = ?auto_546212 ?auto_546217 ) ) ( not ( = ?auto_546212 ?auto_546218 ) ) ( not ( = ?auto_546212 ?auto_546219 ) ) ( not ( = ?auto_546212 ?auto_546220 ) ) ( not ( = ?auto_546212 ?auto_546221 ) ) ( not ( = ?auto_546212 ?auto_546222 ) ) ( not ( = ?auto_546212 ?auto_546223 ) ) ( not ( = ?auto_546212 ?auto_546224 ) ) ( not ( = ?auto_546212 ?auto_546225 ) ) ( not ( = ?auto_546212 ?auto_546226 ) ) ( not ( = ?auto_546212 ?auto_546227 ) ) ( not ( = ?auto_546212 ?auto_546228 ) ) ( not ( = ?auto_546213 ?auto_546214 ) ) ( not ( = ?auto_546213 ?auto_546215 ) ) ( not ( = ?auto_546213 ?auto_546216 ) ) ( not ( = ?auto_546213 ?auto_546217 ) ) ( not ( = ?auto_546213 ?auto_546218 ) ) ( not ( = ?auto_546213 ?auto_546219 ) ) ( not ( = ?auto_546213 ?auto_546220 ) ) ( not ( = ?auto_546213 ?auto_546221 ) ) ( not ( = ?auto_546213 ?auto_546222 ) ) ( not ( = ?auto_546213 ?auto_546223 ) ) ( not ( = ?auto_546213 ?auto_546224 ) ) ( not ( = ?auto_546213 ?auto_546225 ) ) ( not ( = ?auto_546213 ?auto_546226 ) ) ( not ( = ?auto_546213 ?auto_546227 ) ) ( not ( = ?auto_546213 ?auto_546228 ) ) ( not ( = ?auto_546214 ?auto_546215 ) ) ( not ( = ?auto_546214 ?auto_546216 ) ) ( not ( = ?auto_546214 ?auto_546217 ) ) ( not ( = ?auto_546214 ?auto_546218 ) ) ( not ( = ?auto_546214 ?auto_546219 ) ) ( not ( = ?auto_546214 ?auto_546220 ) ) ( not ( = ?auto_546214 ?auto_546221 ) ) ( not ( = ?auto_546214 ?auto_546222 ) ) ( not ( = ?auto_546214 ?auto_546223 ) ) ( not ( = ?auto_546214 ?auto_546224 ) ) ( not ( = ?auto_546214 ?auto_546225 ) ) ( not ( = ?auto_546214 ?auto_546226 ) ) ( not ( = ?auto_546214 ?auto_546227 ) ) ( not ( = ?auto_546214 ?auto_546228 ) ) ( not ( = ?auto_546215 ?auto_546216 ) ) ( not ( = ?auto_546215 ?auto_546217 ) ) ( not ( = ?auto_546215 ?auto_546218 ) ) ( not ( = ?auto_546215 ?auto_546219 ) ) ( not ( = ?auto_546215 ?auto_546220 ) ) ( not ( = ?auto_546215 ?auto_546221 ) ) ( not ( = ?auto_546215 ?auto_546222 ) ) ( not ( = ?auto_546215 ?auto_546223 ) ) ( not ( = ?auto_546215 ?auto_546224 ) ) ( not ( = ?auto_546215 ?auto_546225 ) ) ( not ( = ?auto_546215 ?auto_546226 ) ) ( not ( = ?auto_546215 ?auto_546227 ) ) ( not ( = ?auto_546215 ?auto_546228 ) ) ( not ( = ?auto_546216 ?auto_546217 ) ) ( not ( = ?auto_546216 ?auto_546218 ) ) ( not ( = ?auto_546216 ?auto_546219 ) ) ( not ( = ?auto_546216 ?auto_546220 ) ) ( not ( = ?auto_546216 ?auto_546221 ) ) ( not ( = ?auto_546216 ?auto_546222 ) ) ( not ( = ?auto_546216 ?auto_546223 ) ) ( not ( = ?auto_546216 ?auto_546224 ) ) ( not ( = ?auto_546216 ?auto_546225 ) ) ( not ( = ?auto_546216 ?auto_546226 ) ) ( not ( = ?auto_546216 ?auto_546227 ) ) ( not ( = ?auto_546216 ?auto_546228 ) ) ( not ( = ?auto_546217 ?auto_546218 ) ) ( not ( = ?auto_546217 ?auto_546219 ) ) ( not ( = ?auto_546217 ?auto_546220 ) ) ( not ( = ?auto_546217 ?auto_546221 ) ) ( not ( = ?auto_546217 ?auto_546222 ) ) ( not ( = ?auto_546217 ?auto_546223 ) ) ( not ( = ?auto_546217 ?auto_546224 ) ) ( not ( = ?auto_546217 ?auto_546225 ) ) ( not ( = ?auto_546217 ?auto_546226 ) ) ( not ( = ?auto_546217 ?auto_546227 ) ) ( not ( = ?auto_546217 ?auto_546228 ) ) ( not ( = ?auto_546218 ?auto_546219 ) ) ( not ( = ?auto_546218 ?auto_546220 ) ) ( not ( = ?auto_546218 ?auto_546221 ) ) ( not ( = ?auto_546218 ?auto_546222 ) ) ( not ( = ?auto_546218 ?auto_546223 ) ) ( not ( = ?auto_546218 ?auto_546224 ) ) ( not ( = ?auto_546218 ?auto_546225 ) ) ( not ( = ?auto_546218 ?auto_546226 ) ) ( not ( = ?auto_546218 ?auto_546227 ) ) ( not ( = ?auto_546218 ?auto_546228 ) ) ( not ( = ?auto_546219 ?auto_546220 ) ) ( not ( = ?auto_546219 ?auto_546221 ) ) ( not ( = ?auto_546219 ?auto_546222 ) ) ( not ( = ?auto_546219 ?auto_546223 ) ) ( not ( = ?auto_546219 ?auto_546224 ) ) ( not ( = ?auto_546219 ?auto_546225 ) ) ( not ( = ?auto_546219 ?auto_546226 ) ) ( not ( = ?auto_546219 ?auto_546227 ) ) ( not ( = ?auto_546219 ?auto_546228 ) ) ( not ( = ?auto_546220 ?auto_546221 ) ) ( not ( = ?auto_546220 ?auto_546222 ) ) ( not ( = ?auto_546220 ?auto_546223 ) ) ( not ( = ?auto_546220 ?auto_546224 ) ) ( not ( = ?auto_546220 ?auto_546225 ) ) ( not ( = ?auto_546220 ?auto_546226 ) ) ( not ( = ?auto_546220 ?auto_546227 ) ) ( not ( = ?auto_546220 ?auto_546228 ) ) ( not ( = ?auto_546221 ?auto_546222 ) ) ( not ( = ?auto_546221 ?auto_546223 ) ) ( not ( = ?auto_546221 ?auto_546224 ) ) ( not ( = ?auto_546221 ?auto_546225 ) ) ( not ( = ?auto_546221 ?auto_546226 ) ) ( not ( = ?auto_546221 ?auto_546227 ) ) ( not ( = ?auto_546221 ?auto_546228 ) ) ( not ( = ?auto_546222 ?auto_546223 ) ) ( not ( = ?auto_546222 ?auto_546224 ) ) ( not ( = ?auto_546222 ?auto_546225 ) ) ( not ( = ?auto_546222 ?auto_546226 ) ) ( not ( = ?auto_546222 ?auto_546227 ) ) ( not ( = ?auto_546222 ?auto_546228 ) ) ( not ( = ?auto_546223 ?auto_546224 ) ) ( not ( = ?auto_546223 ?auto_546225 ) ) ( not ( = ?auto_546223 ?auto_546226 ) ) ( not ( = ?auto_546223 ?auto_546227 ) ) ( not ( = ?auto_546223 ?auto_546228 ) ) ( not ( = ?auto_546224 ?auto_546225 ) ) ( not ( = ?auto_546224 ?auto_546226 ) ) ( not ( = ?auto_546224 ?auto_546227 ) ) ( not ( = ?auto_546224 ?auto_546228 ) ) ( not ( = ?auto_546225 ?auto_546226 ) ) ( not ( = ?auto_546225 ?auto_546227 ) ) ( not ( = ?auto_546225 ?auto_546228 ) ) ( not ( = ?auto_546226 ?auto_546227 ) ) ( not ( = ?auto_546226 ?auto_546228 ) ) ( not ( = ?auto_546227 ?auto_546228 ) ) ( ON ?auto_546226 ?auto_546227 ) ( ON ?auto_546225 ?auto_546226 ) ( ON ?auto_546224 ?auto_546225 ) ( ON ?auto_546223 ?auto_546224 ) ( ON ?auto_546222 ?auto_546223 ) ( ON ?auto_546221 ?auto_546222 ) ( ON ?auto_546220 ?auto_546221 ) ( ON ?auto_546219 ?auto_546220 ) ( ON ?auto_546218 ?auto_546219 ) ( ON ?auto_546217 ?auto_546218 ) ( ON ?auto_546216 ?auto_546217 ) ( CLEAR ?auto_546214 ) ( ON ?auto_546215 ?auto_546216 ) ( CLEAR ?auto_546215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_546212 ?auto_546213 ?auto_546214 ?auto_546215 )
      ( MAKE-16PILE ?auto_546212 ?auto_546213 ?auto_546214 ?auto_546215 ?auto_546216 ?auto_546217 ?auto_546218 ?auto_546219 ?auto_546220 ?auto_546221 ?auto_546222 ?auto_546223 ?auto_546224 ?auto_546225 ?auto_546226 ?auto_546227 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546245 - BLOCK
      ?auto_546246 - BLOCK
      ?auto_546247 - BLOCK
      ?auto_546248 - BLOCK
      ?auto_546249 - BLOCK
      ?auto_546250 - BLOCK
      ?auto_546251 - BLOCK
      ?auto_546252 - BLOCK
      ?auto_546253 - BLOCK
      ?auto_546254 - BLOCK
      ?auto_546255 - BLOCK
      ?auto_546256 - BLOCK
      ?auto_546257 - BLOCK
      ?auto_546258 - BLOCK
      ?auto_546259 - BLOCK
      ?auto_546260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546260 ) ( ON-TABLE ?auto_546245 ) ( ON ?auto_546246 ?auto_546245 ) ( ON ?auto_546247 ?auto_546246 ) ( not ( = ?auto_546245 ?auto_546246 ) ) ( not ( = ?auto_546245 ?auto_546247 ) ) ( not ( = ?auto_546245 ?auto_546248 ) ) ( not ( = ?auto_546245 ?auto_546249 ) ) ( not ( = ?auto_546245 ?auto_546250 ) ) ( not ( = ?auto_546245 ?auto_546251 ) ) ( not ( = ?auto_546245 ?auto_546252 ) ) ( not ( = ?auto_546245 ?auto_546253 ) ) ( not ( = ?auto_546245 ?auto_546254 ) ) ( not ( = ?auto_546245 ?auto_546255 ) ) ( not ( = ?auto_546245 ?auto_546256 ) ) ( not ( = ?auto_546245 ?auto_546257 ) ) ( not ( = ?auto_546245 ?auto_546258 ) ) ( not ( = ?auto_546245 ?auto_546259 ) ) ( not ( = ?auto_546245 ?auto_546260 ) ) ( not ( = ?auto_546246 ?auto_546247 ) ) ( not ( = ?auto_546246 ?auto_546248 ) ) ( not ( = ?auto_546246 ?auto_546249 ) ) ( not ( = ?auto_546246 ?auto_546250 ) ) ( not ( = ?auto_546246 ?auto_546251 ) ) ( not ( = ?auto_546246 ?auto_546252 ) ) ( not ( = ?auto_546246 ?auto_546253 ) ) ( not ( = ?auto_546246 ?auto_546254 ) ) ( not ( = ?auto_546246 ?auto_546255 ) ) ( not ( = ?auto_546246 ?auto_546256 ) ) ( not ( = ?auto_546246 ?auto_546257 ) ) ( not ( = ?auto_546246 ?auto_546258 ) ) ( not ( = ?auto_546246 ?auto_546259 ) ) ( not ( = ?auto_546246 ?auto_546260 ) ) ( not ( = ?auto_546247 ?auto_546248 ) ) ( not ( = ?auto_546247 ?auto_546249 ) ) ( not ( = ?auto_546247 ?auto_546250 ) ) ( not ( = ?auto_546247 ?auto_546251 ) ) ( not ( = ?auto_546247 ?auto_546252 ) ) ( not ( = ?auto_546247 ?auto_546253 ) ) ( not ( = ?auto_546247 ?auto_546254 ) ) ( not ( = ?auto_546247 ?auto_546255 ) ) ( not ( = ?auto_546247 ?auto_546256 ) ) ( not ( = ?auto_546247 ?auto_546257 ) ) ( not ( = ?auto_546247 ?auto_546258 ) ) ( not ( = ?auto_546247 ?auto_546259 ) ) ( not ( = ?auto_546247 ?auto_546260 ) ) ( not ( = ?auto_546248 ?auto_546249 ) ) ( not ( = ?auto_546248 ?auto_546250 ) ) ( not ( = ?auto_546248 ?auto_546251 ) ) ( not ( = ?auto_546248 ?auto_546252 ) ) ( not ( = ?auto_546248 ?auto_546253 ) ) ( not ( = ?auto_546248 ?auto_546254 ) ) ( not ( = ?auto_546248 ?auto_546255 ) ) ( not ( = ?auto_546248 ?auto_546256 ) ) ( not ( = ?auto_546248 ?auto_546257 ) ) ( not ( = ?auto_546248 ?auto_546258 ) ) ( not ( = ?auto_546248 ?auto_546259 ) ) ( not ( = ?auto_546248 ?auto_546260 ) ) ( not ( = ?auto_546249 ?auto_546250 ) ) ( not ( = ?auto_546249 ?auto_546251 ) ) ( not ( = ?auto_546249 ?auto_546252 ) ) ( not ( = ?auto_546249 ?auto_546253 ) ) ( not ( = ?auto_546249 ?auto_546254 ) ) ( not ( = ?auto_546249 ?auto_546255 ) ) ( not ( = ?auto_546249 ?auto_546256 ) ) ( not ( = ?auto_546249 ?auto_546257 ) ) ( not ( = ?auto_546249 ?auto_546258 ) ) ( not ( = ?auto_546249 ?auto_546259 ) ) ( not ( = ?auto_546249 ?auto_546260 ) ) ( not ( = ?auto_546250 ?auto_546251 ) ) ( not ( = ?auto_546250 ?auto_546252 ) ) ( not ( = ?auto_546250 ?auto_546253 ) ) ( not ( = ?auto_546250 ?auto_546254 ) ) ( not ( = ?auto_546250 ?auto_546255 ) ) ( not ( = ?auto_546250 ?auto_546256 ) ) ( not ( = ?auto_546250 ?auto_546257 ) ) ( not ( = ?auto_546250 ?auto_546258 ) ) ( not ( = ?auto_546250 ?auto_546259 ) ) ( not ( = ?auto_546250 ?auto_546260 ) ) ( not ( = ?auto_546251 ?auto_546252 ) ) ( not ( = ?auto_546251 ?auto_546253 ) ) ( not ( = ?auto_546251 ?auto_546254 ) ) ( not ( = ?auto_546251 ?auto_546255 ) ) ( not ( = ?auto_546251 ?auto_546256 ) ) ( not ( = ?auto_546251 ?auto_546257 ) ) ( not ( = ?auto_546251 ?auto_546258 ) ) ( not ( = ?auto_546251 ?auto_546259 ) ) ( not ( = ?auto_546251 ?auto_546260 ) ) ( not ( = ?auto_546252 ?auto_546253 ) ) ( not ( = ?auto_546252 ?auto_546254 ) ) ( not ( = ?auto_546252 ?auto_546255 ) ) ( not ( = ?auto_546252 ?auto_546256 ) ) ( not ( = ?auto_546252 ?auto_546257 ) ) ( not ( = ?auto_546252 ?auto_546258 ) ) ( not ( = ?auto_546252 ?auto_546259 ) ) ( not ( = ?auto_546252 ?auto_546260 ) ) ( not ( = ?auto_546253 ?auto_546254 ) ) ( not ( = ?auto_546253 ?auto_546255 ) ) ( not ( = ?auto_546253 ?auto_546256 ) ) ( not ( = ?auto_546253 ?auto_546257 ) ) ( not ( = ?auto_546253 ?auto_546258 ) ) ( not ( = ?auto_546253 ?auto_546259 ) ) ( not ( = ?auto_546253 ?auto_546260 ) ) ( not ( = ?auto_546254 ?auto_546255 ) ) ( not ( = ?auto_546254 ?auto_546256 ) ) ( not ( = ?auto_546254 ?auto_546257 ) ) ( not ( = ?auto_546254 ?auto_546258 ) ) ( not ( = ?auto_546254 ?auto_546259 ) ) ( not ( = ?auto_546254 ?auto_546260 ) ) ( not ( = ?auto_546255 ?auto_546256 ) ) ( not ( = ?auto_546255 ?auto_546257 ) ) ( not ( = ?auto_546255 ?auto_546258 ) ) ( not ( = ?auto_546255 ?auto_546259 ) ) ( not ( = ?auto_546255 ?auto_546260 ) ) ( not ( = ?auto_546256 ?auto_546257 ) ) ( not ( = ?auto_546256 ?auto_546258 ) ) ( not ( = ?auto_546256 ?auto_546259 ) ) ( not ( = ?auto_546256 ?auto_546260 ) ) ( not ( = ?auto_546257 ?auto_546258 ) ) ( not ( = ?auto_546257 ?auto_546259 ) ) ( not ( = ?auto_546257 ?auto_546260 ) ) ( not ( = ?auto_546258 ?auto_546259 ) ) ( not ( = ?auto_546258 ?auto_546260 ) ) ( not ( = ?auto_546259 ?auto_546260 ) ) ( ON ?auto_546259 ?auto_546260 ) ( ON ?auto_546258 ?auto_546259 ) ( ON ?auto_546257 ?auto_546258 ) ( ON ?auto_546256 ?auto_546257 ) ( ON ?auto_546255 ?auto_546256 ) ( ON ?auto_546254 ?auto_546255 ) ( ON ?auto_546253 ?auto_546254 ) ( ON ?auto_546252 ?auto_546253 ) ( ON ?auto_546251 ?auto_546252 ) ( ON ?auto_546250 ?auto_546251 ) ( ON ?auto_546249 ?auto_546250 ) ( CLEAR ?auto_546247 ) ( ON ?auto_546248 ?auto_546249 ) ( CLEAR ?auto_546248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_546245 ?auto_546246 ?auto_546247 ?auto_546248 )
      ( MAKE-16PILE ?auto_546245 ?auto_546246 ?auto_546247 ?auto_546248 ?auto_546249 ?auto_546250 ?auto_546251 ?auto_546252 ?auto_546253 ?auto_546254 ?auto_546255 ?auto_546256 ?auto_546257 ?auto_546258 ?auto_546259 ?auto_546260 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546277 - BLOCK
      ?auto_546278 - BLOCK
      ?auto_546279 - BLOCK
      ?auto_546280 - BLOCK
      ?auto_546281 - BLOCK
      ?auto_546282 - BLOCK
      ?auto_546283 - BLOCK
      ?auto_546284 - BLOCK
      ?auto_546285 - BLOCK
      ?auto_546286 - BLOCK
      ?auto_546287 - BLOCK
      ?auto_546288 - BLOCK
      ?auto_546289 - BLOCK
      ?auto_546290 - BLOCK
      ?auto_546291 - BLOCK
      ?auto_546292 - BLOCK
    )
    :vars
    (
      ?auto_546293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546292 ?auto_546293 ) ( ON-TABLE ?auto_546277 ) ( ON ?auto_546278 ?auto_546277 ) ( not ( = ?auto_546277 ?auto_546278 ) ) ( not ( = ?auto_546277 ?auto_546279 ) ) ( not ( = ?auto_546277 ?auto_546280 ) ) ( not ( = ?auto_546277 ?auto_546281 ) ) ( not ( = ?auto_546277 ?auto_546282 ) ) ( not ( = ?auto_546277 ?auto_546283 ) ) ( not ( = ?auto_546277 ?auto_546284 ) ) ( not ( = ?auto_546277 ?auto_546285 ) ) ( not ( = ?auto_546277 ?auto_546286 ) ) ( not ( = ?auto_546277 ?auto_546287 ) ) ( not ( = ?auto_546277 ?auto_546288 ) ) ( not ( = ?auto_546277 ?auto_546289 ) ) ( not ( = ?auto_546277 ?auto_546290 ) ) ( not ( = ?auto_546277 ?auto_546291 ) ) ( not ( = ?auto_546277 ?auto_546292 ) ) ( not ( = ?auto_546277 ?auto_546293 ) ) ( not ( = ?auto_546278 ?auto_546279 ) ) ( not ( = ?auto_546278 ?auto_546280 ) ) ( not ( = ?auto_546278 ?auto_546281 ) ) ( not ( = ?auto_546278 ?auto_546282 ) ) ( not ( = ?auto_546278 ?auto_546283 ) ) ( not ( = ?auto_546278 ?auto_546284 ) ) ( not ( = ?auto_546278 ?auto_546285 ) ) ( not ( = ?auto_546278 ?auto_546286 ) ) ( not ( = ?auto_546278 ?auto_546287 ) ) ( not ( = ?auto_546278 ?auto_546288 ) ) ( not ( = ?auto_546278 ?auto_546289 ) ) ( not ( = ?auto_546278 ?auto_546290 ) ) ( not ( = ?auto_546278 ?auto_546291 ) ) ( not ( = ?auto_546278 ?auto_546292 ) ) ( not ( = ?auto_546278 ?auto_546293 ) ) ( not ( = ?auto_546279 ?auto_546280 ) ) ( not ( = ?auto_546279 ?auto_546281 ) ) ( not ( = ?auto_546279 ?auto_546282 ) ) ( not ( = ?auto_546279 ?auto_546283 ) ) ( not ( = ?auto_546279 ?auto_546284 ) ) ( not ( = ?auto_546279 ?auto_546285 ) ) ( not ( = ?auto_546279 ?auto_546286 ) ) ( not ( = ?auto_546279 ?auto_546287 ) ) ( not ( = ?auto_546279 ?auto_546288 ) ) ( not ( = ?auto_546279 ?auto_546289 ) ) ( not ( = ?auto_546279 ?auto_546290 ) ) ( not ( = ?auto_546279 ?auto_546291 ) ) ( not ( = ?auto_546279 ?auto_546292 ) ) ( not ( = ?auto_546279 ?auto_546293 ) ) ( not ( = ?auto_546280 ?auto_546281 ) ) ( not ( = ?auto_546280 ?auto_546282 ) ) ( not ( = ?auto_546280 ?auto_546283 ) ) ( not ( = ?auto_546280 ?auto_546284 ) ) ( not ( = ?auto_546280 ?auto_546285 ) ) ( not ( = ?auto_546280 ?auto_546286 ) ) ( not ( = ?auto_546280 ?auto_546287 ) ) ( not ( = ?auto_546280 ?auto_546288 ) ) ( not ( = ?auto_546280 ?auto_546289 ) ) ( not ( = ?auto_546280 ?auto_546290 ) ) ( not ( = ?auto_546280 ?auto_546291 ) ) ( not ( = ?auto_546280 ?auto_546292 ) ) ( not ( = ?auto_546280 ?auto_546293 ) ) ( not ( = ?auto_546281 ?auto_546282 ) ) ( not ( = ?auto_546281 ?auto_546283 ) ) ( not ( = ?auto_546281 ?auto_546284 ) ) ( not ( = ?auto_546281 ?auto_546285 ) ) ( not ( = ?auto_546281 ?auto_546286 ) ) ( not ( = ?auto_546281 ?auto_546287 ) ) ( not ( = ?auto_546281 ?auto_546288 ) ) ( not ( = ?auto_546281 ?auto_546289 ) ) ( not ( = ?auto_546281 ?auto_546290 ) ) ( not ( = ?auto_546281 ?auto_546291 ) ) ( not ( = ?auto_546281 ?auto_546292 ) ) ( not ( = ?auto_546281 ?auto_546293 ) ) ( not ( = ?auto_546282 ?auto_546283 ) ) ( not ( = ?auto_546282 ?auto_546284 ) ) ( not ( = ?auto_546282 ?auto_546285 ) ) ( not ( = ?auto_546282 ?auto_546286 ) ) ( not ( = ?auto_546282 ?auto_546287 ) ) ( not ( = ?auto_546282 ?auto_546288 ) ) ( not ( = ?auto_546282 ?auto_546289 ) ) ( not ( = ?auto_546282 ?auto_546290 ) ) ( not ( = ?auto_546282 ?auto_546291 ) ) ( not ( = ?auto_546282 ?auto_546292 ) ) ( not ( = ?auto_546282 ?auto_546293 ) ) ( not ( = ?auto_546283 ?auto_546284 ) ) ( not ( = ?auto_546283 ?auto_546285 ) ) ( not ( = ?auto_546283 ?auto_546286 ) ) ( not ( = ?auto_546283 ?auto_546287 ) ) ( not ( = ?auto_546283 ?auto_546288 ) ) ( not ( = ?auto_546283 ?auto_546289 ) ) ( not ( = ?auto_546283 ?auto_546290 ) ) ( not ( = ?auto_546283 ?auto_546291 ) ) ( not ( = ?auto_546283 ?auto_546292 ) ) ( not ( = ?auto_546283 ?auto_546293 ) ) ( not ( = ?auto_546284 ?auto_546285 ) ) ( not ( = ?auto_546284 ?auto_546286 ) ) ( not ( = ?auto_546284 ?auto_546287 ) ) ( not ( = ?auto_546284 ?auto_546288 ) ) ( not ( = ?auto_546284 ?auto_546289 ) ) ( not ( = ?auto_546284 ?auto_546290 ) ) ( not ( = ?auto_546284 ?auto_546291 ) ) ( not ( = ?auto_546284 ?auto_546292 ) ) ( not ( = ?auto_546284 ?auto_546293 ) ) ( not ( = ?auto_546285 ?auto_546286 ) ) ( not ( = ?auto_546285 ?auto_546287 ) ) ( not ( = ?auto_546285 ?auto_546288 ) ) ( not ( = ?auto_546285 ?auto_546289 ) ) ( not ( = ?auto_546285 ?auto_546290 ) ) ( not ( = ?auto_546285 ?auto_546291 ) ) ( not ( = ?auto_546285 ?auto_546292 ) ) ( not ( = ?auto_546285 ?auto_546293 ) ) ( not ( = ?auto_546286 ?auto_546287 ) ) ( not ( = ?auto_546286 ?auto_546288 ) ) ( not ( = ?auto_546286 ?auto_546289 ) ) ( not ( = ?auto_546286 ?auto_546290 ) ) ( not ( = ?auto_546286 ?auto_546291 ) ) ( not ( = ?auto_546286 ?auto_546292 ) ) ( not ( = ?auto_546286 ?auto_546293 ) ) ( not ( = ?auto_546287 ?auto_546288 ) ) ( not ( = ?auto_546287 ?auto_546289 ) ) ( not ( = ?auto_546287 ?auto_546290 ) ) ( not ( = ?auto_546287 ?auto_546291 ) ) ( not ( = ?auto_546287 ?auto_546292 ) ) ( not ( = ?auto_546287 ?auto_546293 ) ) ( not ( = ?auto_546288 ?auto_546289 ) ) ( not ( = ?auto_546288 ?auto_546290 ) ) ( not ( = ?auto_546288 ?auto_546291 ) ) ( not ( = ?auto_546288 ?auto_546292 ) ) ( not ( = ?auto_546288 ?auto_546293 ) ) ( not ( = ?auto_546289 ?auto_546290 ) ) ( not ( = ?auto_546289 ?auto_546291 ) ) ( not ( = ?auto_546289 ?auto_546292 ) ) ( not ( = ?auto_546289 ?auto_546293 ) ) ( not ( = ?auto_546290 ?auto_546291 ) ) ( not ( = ?auto_546290 ?auto_546292 ) ) ( not ( = ?auto_546290 ?auto_546293 ) ) ( not ( = ?auto_546291 ?auto_546292 ) ) ( not ( = ?auto_546291 ?auto_546293 ) ) ( not ( = ?auto_546292 ?auto_546293 ) ) ( ON ?auto_546291 ?auto_546292 ) ( ON ?auto_546290 ?auto_546291 ) ( ON ?auto_546289 ?auto_546290 ) ( ON ?auto_546288 ?auto_546289 ) ( ON ?auto_546287 ?auto_546288 ) ( ON ?auto_546286 ?auto_546287 ) ( ON ?auto_546285 ?auto_546286 ) ( ON ?auto_546284 ?auto_546285 ) ( ON ?auto_546283 ?auto_546284 ) ( ON ?auto_546282 ?auto_546283 ) ( ON ?auto_546281 ?auto_546282 ) ( ON ?auto_546280 ?auto_546281 ) ( CLEAR ?auto_546278 ) ( ON ?auto_546279 ?auto_546280 ) ( CLEAR ?auto_546279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_546277 ?auto_546278 ?auto_546279 )
      ( MAKE-16PILE ?auto_546277 ?auto_546278 ?auto_546279 ?auto_546280 ?auto_546281 ?auto_546282 ?auto_546283 ?auto_546284 ?auto_546285 ?auto_546286 ?auto_546287 ?auto_546288 ?auto_546289 ?auto_546290 ?auto_546291 ?auto_546292 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546310 - BLOCK
      ?auto_546311 - BLOCK
      ?auto_546312 - BLOCK
      ?auto_546313 - BLOCK
      ?auto_546314 - BLOCK
      ?auto_546315 - BLOCK
      ?auto_546316 - BLOCK
      ?auto_546317 - BLOCK
      ?auto_546318 - BLOCK
      ?auto_546319 - BLOCK
      ?auto_546320 - BLOCK
      ?auto_546321 - BLOCK
      ?auto_546322 - BLOCK
      ?auto_546323 - BLOCK
      ?auto_546324 - BLOCK
      ?auto_546325 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546325 ) ( ON-TABLE ?auto_546310 ) ( ON ?auto_546311 ?auto_546310 ) ( not ( = ?auto_546310 ?auto_546311 ) ) ( not ( = ?auto_546310 ?auto_546312 ) ) ( not ( = ?auto_546310 ?auto_546313 ) ) ( not ( = ?auto_546310 ?auto_546314 ) ) ( not ( = ?auto_546310 ?auto_546315 ) ) ( not ( = ?auto_546310 ?auto_546316 ) ) ( not ( = ?auto_546310 ?auto_546317 ) ) ( not ( = ?auto_546310 ?auto_546318 ) ) ( not ( = ?auto_546310 ?auto_546319 ) ) ( not ( = ?auto_546310 ?auto_546320 ) ) ( not ( = ?auto_546310 ?auto_546321 ) ) ( not ( = ?auto_546310 ?auto_546322 ) ) ( not ( = ?auto_546310 ?auto_546323 ) ) ( not ( = ?auto_546310 ?auto_546324 ) ) ( not ( = ?auto_546310 ?auto_546325 ) ) ( not ( = ?auto_546311 ?auto_546312 ) ) ( not ( = ?auto_546311 ?auto_546313 ) ) ( not ( = ?auto_546311 ?auto_546314 ) ) ( not ( = ?auto_546311 ?auto_546315 ) ) ( not ( = ?auto_546311 ?auto_546316 ) ) ( not ( = ?auto_546311 ?auto_546317 ) ) ( not ( = ?auto_546311 ?auto_546318 ) ) ( not ( = ?auto_546311 ?auto_546319 ) ) ( not ( = ?auto_546311 ?auto_546320 ) ) ( not ( = ?auto_546311 ?auto_546321 ) ) ( not ( = ?auto_546311 ?auto_546322 ) ) ( not ( = ?auto_546311 ?auto_546323 ) ) ( not ( = ?auto_546311 ?auto_546324 ) ) ( not ( = ?auto_546311 ?auto_546325 ) ) ( not ( = ?auto_546312 ?auto_546313 ) ) ( not ( = ?auto_546312 ?auto_546314 ) ) ( not ( = ?auto_546312 ?auto_546315 ) ) ( not ( = ?auto_546312 ?auto_546316 ) ) ( not ( = ?auto_546312 ?auto_546317 ) ) ( not ( = ?auto_546312 ?auto_546318 ) ) ( not ( = ?auto_546312 ?auto_546319 ) ) ( not ( = ?auto_546312 ?auto_546320 ) ) ( not ( = ?auto_546312 ?auto_546321 ) ) ( not ( = ?auto_546312 ?auto_546322 ) ) ( not ( = ?auto_546312 ?auto_546323 ) ) ( not ( = ?auto_546312 ?auto_546324 ) ) ( not ( = ?auto_546312 ?auto_546325 ) ) ( not ( = ?auto_546313 ?auto_546314 ) ) ( not ( = ?auto_546313 ?auto_546315 ) ) ( not ( = ?auto_546313 ?auto_546316 ) ) ( not ( = ?auto_546313 ?auto_546317 ) ) ( not ( = ?auto_546313 ?auto_546318 ) ) ( not ( = ?auto_546313 ?auto_546319 ) ) ( not ( = ?auto_546313 ?auto_546320 ) ) ( not ( = ?auto_546313 ?auto_546321 ) ) ( not ( = ?auto_546313 ?auto_546322 ) ) ( not ( = ?auto_546313 ?auto_546323 ) ) ( not ( = ?auto_546313 ?auto_546324 ) ) ( not ( = ?auto_546313 ?auto_546325 ) ) ( not ( = ?auto_546314 ?auto_546315 ) ) ( not ( = ?auto_546314 ?auto_546316 ) ) ( not ( = ?auto_546314 ?auto_546317 ) ) ( not ( = ?auto_546314 ?auto_546318 ) ) ( not ( = ?auto_546314 ?auto_546319 ) ) ( not ( = ?auto_546314 ?auto_546320 ) ) ( not ( = ?auto_546314 ?auto_546321 ) ) ( not ( = ?auto_546314 ?auto_546322 ) ) ( not ( = ?auto_546314 ?auto_546323 ) ) ( not ( = ?auto_546314 ?auto_546324 ) ) ( not ( = ?auto_546314 ?auto_546325 ) ) ( not ( = ?auto_546315 ?auto_546316 ) ) ( not ( = ?auto_546315 ?auto_546317 ) ) ( not ( = ?auto_546315 ?auto_546318 ) ) ( not ( = ?auto_546315 ?auto_546319 ) ) ( not ( = ?auto_546315 ?auto_546320 ) ) ( not ( = ?auto_546315 ?auto_546321 ) ) ( not ( = ?auto_546315 ?auto_546322 ) ) ( not ( = ?auto_546315 ?auto_546323 ) ) ( not ( = ?auto_546315 ?auto_546324 ) ) ( not ( = ?auto_546315 ?auto_546325 ) ) ( not ( = ?auto_546316 ?auto_546317 ) ) ( not ( = ?auto_546316 ?auto_546318 ) ) ( not ( = ?auto_546316 ?auto_546319 ) ) ( not ( = ?auto_546316 ?auto_546320 ) ) ( not ( = ?auto_546316 ?auto_546321 ) ) ( not ( = ?auto_546316 ?auto_546322 ) ) ( not ( = ?auto_546316 ?auto_546323 ) ) ( not ( = ?auto_546316 ?auto_546324 ) ) ( not ( = ?auto_546316 ?auto_546325 ) ) ( not ( = ?auto_546317 ?auto_546318 ) ) ( not ( = ?auto_546317 ?auto_546319 ) ) ( not ( = ?auto_546317 ?auto_546320 ) ) ( not ( = ?auto_546317 ?auto_546321 ) ) ( not ( = ?auto_546317 ?auto_546322 ) ) ( not ( = ?auto_546317 ?auto_546323 ) ) ( not ( = ?auto_546317 ?auto_546324 ) ) ( not ( = ?auto_546317 ?auto_546325 ) ) ( not ( = ?auto_546318 ?auto_546319 ) ) ( not ( = ?auto_546318 ?auto_546320 ) ) ( not ( = ?auto_546318 ?auto_546321 ) ) ( not ( = ?auto_546318 ?auto_546322 ) ) ( not ( = ?auto_546318 ?auto_546323 ) ) ( not ( = ?auto_546318 ?auto_546324 ) ) ( not ( = ?auto_546318 ?auto_546325 ) ) ( not ( = ?auto_546319 ?auto_546320 ) ) ( not ( = ?auto_546319 ?auto_546321 ) ) ( not ( = ?auto_546319 ?auto_546322 ) ) ( not ( = ?auto_546319 ?auto_546323 ) ) ( not ( = ?auto_546319 ?auto_546324 ) ) ( not ( = ?auto_546319 ?auto_546325 ) ) ( not ( = ?auto_546320 ?auto_546321 ) ) ( not ( = ?auto_546320 ?auto_546322 ) ) ( not ( = ?auto_546320 ?auto_546323 ) ) ( not ( = ?auto_546320 ?auto_546324 ) ) ( not ( = ?auto_546320 ?auto_546325 ) ) ( not ( = ?auto_546321 ?auto_546322 ) ) ( not ( = ?auto_546321 ?auto_546323 ) ) ( not ( = ?auto_546321 ?auto_546324 ) ) ( not ( = ?auto_546321 ?auto_546325 ) ) ( not ( = ?auto_546322 ?auto_546323 ) ) ( not ( = ?auto_546322 ?auto_546324 ) ) ( not ( = ?auto_546322 ?auto_546325 ) ) ( not ( = ?auto_546323 ?auto_546324 ) ) ( not ( = ?auto_546323 ?auto_546325 ) ) ( not ( = ?auto_546324 ?auto_546325 ) ) ( ON ?auto_546324 ?auto_546325 ) ( ON ?auto_546323 ?auto_546324 ) ( ON ?auto_546322 ?auto_546323 ) ( ON ?auto_546321 ?auto_546322 ) ( ON ?auto_546320 ?auto_546321 ) ( ON ?auto_546319 ?auto_546320 ) ( ON ?auto_546318 ?auto_546319 ) ( ON ?auto_546317 ?auto_546318 ) ( ON ?auto_546316 ?auto_546317 ) ( ON ?auto_546315 ?auto_546316 ) ( ON ?auto_546314 ?auto_546315 ) ( ON ?auto_546313 ?auto_546314 ) ( CLEAR ?auto_546311 ) ( ON ?auto_546312 ?auto_546313 ) ( CLEAR ?auto_546312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_546310 ?auto_546311 ?auto_546312 )
      ( MAKE-16PILE ?auto_546310 ?auto_546311 ?auto_546312 ?auto_546313 ?auto_546314 ?auto_546315 ?auto_546316 ?auto_546317 ?auto_546318 ?auto_546319 ?auto_546320 ?auto_546321 ?auto_546322 ?auto_546323 ?auto_546324 ?auto_546325 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546342 - BLOCK
      ?auto_546343 - BLOCK
      ?auto_546344 - BLOCK
      ?auto_546345 - BLOCK
      ?auto_546346 - BLOCK
      ?auto_546347 - BLOCK
      ?auto_546348 - BLOCK
      ?auto_546349 - BLOCK
      ?auto_546350 - BLOCK
      ?auto_546351 - BLOCK
      ?auto_546352 - BLOCK
      ?auto_546353 - BLOCK
      ?auto_546354 - BLOCK
      ?auto_546355 - BLOCK
      ?auto_546356 - BLOCK
      ?auto_546357 - BLOCK
    )
    :vars
    (
      ?auto_546358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546357 ?auto_546358 ) ( ON-TABLE ?auto_546342 ) ( not ( = ?auto_546342 ?auto_546343 ) ) ( not ( = ?auto_546342 ?auto_546344 ) ) ( not ( = ?auto_546342 ?auto_546345 ) ) ( not ( = ?auto_546342 ?auto_546346 ) ) ( not ( = ?auto_546342 ?auto_546347 ) ) ( not ( = ?auto_546342 ?auto_546348 ) ) ( not ( = ?auto_546342 ?auto_546349 ) ) ( not ( = ?auto_546342 ?auto_546350 ) ) ( not ( = ?auto_546342 ?auto_546351 ) ) ( not ( = ?auto_546342 ?auto_546352 ) ) ( not ( = ?auto_546342 ?auto_546353 ) ) ( not ( = ?auto_546342 ?auto_546354 ) ) ( not ( = ?auto_546342 ?auto_546355 ) ) ( not ( = ?auto_546342 ?auto_546356 ) ) ( not ( = ?auto_546342 ?auto_546357 ) ) ( not ( = ?auto_546342 ?auto_546358 ) ) ( not ( = ?auto_546343 ?auto_546344 ) ) ( not ( = ?auto_546343 ?auto_546345 ) ) ( not ( = ?auto_546343 ?auto_546346 ) ) ( not ( = ?auto_546343 ?auto_546347 ) ) ( not ( = ?auto_546343 ?auto_546348 ) ) ( not ( = ?auto_546343 ?auto_546349 ) ) ( not ( = ?auto_546343 ?auto_546350 ) ) ( not ( = ?auto_546343 ?auto_546351 ) ) ( not ( = ?auto_546343 ?auto_546352 ) ) ( not ( = ?auto_546343 ?auto_546353 ) ) ( not ( = ?auto_546343 ?auto_546354 ) ) ( not ( = ?auto_546343 ?auto_546355 ) ) ( not ( = ?auto_546343 ?auto_546356 ) ) ( not ( = ?auto_546343 ?auto_546357 ) ) ( not ( = ?auto_546343 ?auto_546358 ) ) ( not ( = ?auto_546344 ?auto_546345 ) ) ( not ( = ?auto_546344 ?auto_546346 ) ) ( not ( = ?auto_546344 ?auto_546347 ) ) ( not ( = ?auto_546344 ?auto_546348 ) ) ( not ( = ?auto_546344 ?auto_546349 ) ) ( not ( = ?auto_546344 ?auto_546350 ) ) ( not ( = ?auto_546344 ?auto_546351 ) ) ( not ( = ?auto_546344 ?auto_546352 ) ) ( not ( = ?auto_546344 ?auto_546353 ) ) ( not ( = ?auto_546344 ?auto_546354 ) ) ( not ( = ?auto_546344 ?auto_546355 ) ) ( not ( = ?auto_546344 ?auto_546356 ) ) ( not ( = ?auto_546344 ?auto_546357 ) ) ( not ( = ?auto_546344 ?auto_546358 ) ) ( not ( = ?auto_546345 ?auto_546346 ) ) ( not ( = ?auto_546345 ?auto_546347 ) ) ( not ( = ?auto_546345 ?auto_546348 ) ) ( not ( = ?auto_546345 ?auto_546349 ) ) ( not ( = ?auto_546345 ?auto_546350 ) ) ( not ( = ?auto_546345 ?auto_546351 ) ) ( not ( = ?auto_546345 ?auto_546352 ) ) ( not ( = ?auto_546345 ?auto_546353 ) ) ( not ( = ?auto_546345 ?auto_546354 ) ) ( not ( = ?auto_546345 ?auto_546355 ) ) ( not ( = ?auto_546345 ?auto_546356 ) ) ( not ( = ?auto_546345 ?auto_546357 ) ) ( not ( = ?auto_546345 ?auto_546358 ) ) ( not ( = ?auto_546346 ?auto_546347 ) ) ( not ( = ?auto_546346 ?auto_546348 ) ) ( not ( = ?auto_546346 ?auto_546349 ) ) ( not ( = ?auto_546346 ?auto_546350 ) ) ( not ( = ?auto_546346 ?auto_546351 ) ) ( not ( = ?auto_546346 ?auto_546352 ) ) ( not ( = ?auto_546346 ?auto_546353 ) ) ( not ( = ?auto_546346 ?auto_546354 ) ) ( not ( = ?auto_546346 ?auto_546355 ) ) ( not ( = ?auto_546346 ?auto_546356 ) ) ( not ( = ?auto_546346 ?auto_546357 ) ) ( not ( = ?auto_546346 ?auto_546358 ) ) ( not ( = ?auto_546347 ?auto_546348 ) ) ( not ( = ?auto_546347 ?auto_546349 ) ) ( not ( = ?auto_546347 ?auto_546350 ) ) ( not ( = ?auto_546347 ?auto_546351 ) ) ( not ( = ?auto_546347 ?auto_546352 ) ) ( not ( = ?auto_546347 ?auto_546353 ) ) ( not ( = ?auto_546347 ?auto_546354 ) ) ( not ( = ?auto_546347 ?auto_546355 ) ) ( not ( = ?auto_546347 ?auto_546356 ) ) ( not ( = ?auto_546347 ?auto_546357 ) ) ( not ( = ?auto_546347 ?auto_546358 ) ) ( not ( = ?auto_546348 ?auto_546349 ) ) ( not ( = ?auto_546348 ?auto_546350 ) ) ( not ( = ?auto_546348 ?auto_546351 ) ) ( not ( = ?auto_546348 ?auto_546352 ) ) ( not ( = ?auto_546348 ?auto_546353 ) ) ( not ( = ?auto_546348 ?auto_546354 ) ) ( not ( = ?auto_546348 ?auto_546355 ) ) ( not ( = ?auto_546348 ?auto_546356 ) ) ( not ( = ?auto_546348 ?auto_546357 ) ) ( not ( = ?auto_546348 ?auto_546358 ) ) ( not ( = ?auto_546349 ?auto_546350 ) ) ( not ( = ?auto_546349 ?auto_546351 ) ) ( not ( = ?auto_546349 ?auto_546352 ) ) ( not ( = ?auto_546349 ?auto_546353 ) ) ( not ( = ?auto_546349 ?auto_546354 ) ) ( not ( = ?auto_546349 ?auto_546355 ) ) ( not ( = ?auto_546349 ?auto_546356 ) ) ( not ( = ?auto_546349 ?auto_546357 ) ) ( not ( = ?auto_546349 ?auto_546358 ) ) ( not ( = ?auto_546350 ?auto_546351 ) ) ( not ( = ?auto_546350 ?auto_546352 ) ) ( not ( = ?auto_546350 ?auto_546353 ) ) ( not ( = ?auto_546350 ?auto_546354 ) ) ( not ( = ?auto_546350 ?auto_546355 ) ) ( not ( = ?auto_546350 ?auto_546356 ) ) ( not ( = ?auto_546350 ?auto_546357 ) ) ( not ( = ?auto_546350 ?auto_546358 ) ) ( not ( = ?auto_546351 ?auto_546352 ) ) ( not ( = ?auto_546351 ?auto_546353 ) ) ( not ( = ?auto_546351 ?auto_546354 ) ) ( not ( = ?auto_546351 ?auto_546355 ) ) ( not ( = ?auto_546351 ?auto_546356 ) ) ( not ( = ?auto_546351 ?auto_546357 ) ) ( not ( = ?auto_546351 ?auto_546358 ) ) ( not ( = ?auto_546352 ?auto_546353 ) ) ( not ( = ?auto_546352 ?auto_546354 ) ) ( not ( = ?auto_546352 ?auto_546355 ) ) ( not ( = ?auto_546352 ?auto_546356 ) ) ( not ( = ?auto_546352 ?auto_546357 ) ) ( not ( = ?auto_546352 ?auto_546358 ) ) ( not ( = ?auto_546353 ?auto_546354 ) ) ( not ( = ?auto_546353 ?auto_546355 ) ) ( not ( = ?auto_546353 ?auto_546356 ) ) ( not ( = ?auto_546353 ?auto_546357 ) ) ( not ( = ?auto_546353 ?auto_546358 ) ) ( not ( = ?auto_546354 ?auto_546355 ) ) ( not ( = ?auto_546354 ?auto_546356 ) ) ( not ( = ?auto_546354 ?auto_546357 ) ) ( not ( = ?auto_546354 ?auto_546358 ) ) ( not ( = ?auto_546355 ?auto_546356 ) ) ( not ( = ?auto_546355 ?auto_546357 ) ) ( not ( = ?auto_546355 ?auto_546358 ) ) ( not ( = ?auto_546356 ?auto_546357 ) ) ( not ( = ?auto_546356 ?auto_546358 ) ) ( not ( = ?auto_546357 ?auto_546358 ) ) ( ON ?auto_546356 ?auto_546357 ) ( ON ?auto_546355 ?auto_546356 ) ( ON ?auto_546354 ?auto_546355 ) ( ON ?auto_546353 ?auto_546354 ) ( ON ?auto_546352 ?auto_546353 ) ( ON ?auto_546351 ?auto_546352 ) ( ON ?auto_546350 ?auto_546351 ) ( ON ?auto_546349 ?auto_546350 ) ( ON ?auto_546348 ?auto_546349 ) ( ON ?auto_546347 ?auto_546348 ) ( ON ?auto_546346 ?auto_546347 ) ( ON ?auto_546345 ?auto_546346 ) ( ON ?auto_546344 ?auto_546345 ) ( CLEAR ?auto_546342 ) ( ON ?auto_546343 ?auto_546344 ) ( CLEAR ?auto_546343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_546342 ?auto_546343 )
      ( MAKE-16PILE ?auto_546342 ?auto_546343 ?auto_546344 ?auto_546345 ?auto_546346 ?auto_546347 ?auto_546348 ?auto_546349 ?auto_546350 ?auto_546351 ?auto_546352 ?auto_546353 ?auto_546354 ?auto_546355 ?auto_546356 ?auto_546357 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546375 - BLOCK
      ?auto_546376 - BLOCK
      ?auto_546377 - BLOCK
      ?auto_546378 - BLOCK
      ?auto_546379 - BLOCK
      ?auto_546380 - BLOCK
      ?auto_546381 - BLOCK
      ?auto_546382 - BLOCK
      ?auto_546383 - BLOCK
      ?auto_546384 - BLOCK
      ?auto_546385 - BLOCK
      ?auto_546386 - BLOCK
      ?auto_546387 - BLOCK
      ?auto_546388 - BLOCK
      ?auto_546389 - BLOCK
      ?auto_546390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546390 ) ( ON-TABLE ?auto_546375 ) ( not ( = ?auto_546375 ?auto_546376 ) ) ( not ( = ?auto_546375 ?auto_546377 ) ) ( not ( = ?auto_546375 ?auto_546378 ) ) ( not ( = ?auto_546375 ?auto_546379 ) ) ( not ( = ?auto_546375 ?auto_546380 ) ) ( not ( = ?auto_546375 ?auto_546381 ) ) ( not ( = ?auto_546375 ?auto_546382 ) ) ( not ( = ?auto_546375 ?auto_546383 ) ) ( not ( = ?auto_546375 ?auto_546384 ) ) ( not ( = ?auto_546375 ?auto_546385 ) ) ( not ( = ?auto_546375 ?auto_546386 ) ) ( not ( = ?auto_546375 ?auto_546387 ) ) ( not ( = ?auto_546375 ?auto_546388 ) ) ( not ( = ?auto_546375 ?auto_546389 ) ) ( not ( = ?auto_546375 ?auto_546390 ) ) ( not ( = ?auto_546376 ?auto_546377 ) ) ( not ( = ?auto_546376 ?auto_546378 ) ) ( not ( = ?auto_546376 ?auto_546379 ) ) ( not ( = ?auto_546376 ?auto_546380 ) ) ( not ( = ?auto_546376 ?auto_546381 ) ) ( not ( = ?auto_546376 ?auto_546382 ) ) ( not ( = ?auto_546376 ?auto_546383 ) ) ( not ( = ?auto_546376 ?auto_546384 ) ) ( not ( = ?auto_546376 ?auto_546385 ) ) ( not ( = ?auto_546376 ?auto_546386 ) ) ( not ( = ?auto_546376 ?auto_546387 ) ) ( not ( = ?auto_546376 ?auto_546388 ) ) ( not ( = ?auto_546376 ?auto_546389 ) ) ( not ( = ?auto_546376 ?auto_546390 ) ) ( not ( = ?auto_546377 ?auto_546378 ) ) ( not ( = ?auto_546377 ?auto_546379 ) ) ( not ( = ?auto_546377 ?auto_546380 ) ) ( not ( = ?auto_546377 ?auto_546381 ) ) ( not ( = ?auto_546377 ?auto_546382 ) ) ( not ( = ?auto_546377 ?auto_546383 ) ) ( not ( = ?auto_546377 ?auto_546384 ) ) ( not ( = ?auto_546377 ?auto_546385 ) ) ( not ( = ?auto_546377 ?auto_546386 ) ) ( not ( = ?auto_546377 ?auto_546387 ) ) ( not ( = ?auto_546377 ?auto_546388 ) ) ( not ( = ?auto_546377 ?auto_546389 ) ) ( not ( = ?auto_546377 ?auto_546390 ) ) ( not ( = ?auto_546378 ?auto_546379 ) ) ( not ( = ?auto_546378 ?auto_546380 ) ) ( not ( = ?auto_546378 ?auto_546381 ) ) ( not ( = ?auto_546378 ?auto_546382 ) ) ( not ( = ?auto_546378 ?auto_546383 ) ) ( not ( = ?auto_546378 ?auto_546384 ) ) ( not ( = ?auto_546378 ?auto_546385 ) ) ( not ( = ?auto_546378 ?auto_546386 ) ) ( not ( = ?auto_546378 ?auto_546387 ) ) ( not ( = ?auto_546378 ?auto_546388 ) ) ( not ( = ?auto_546378 ?auto_546389 ) ) ( not ( = ?auto_546378 ?auto_546390 ) ) ( not ( = ?auto_546379 ?auto_546380 ) ) ( not ( = ?auto_546379 ?auto_546381 ) ) ( not ( = ?auto_546379 ?auto_546382 ) ) ( not ( = ?auto_546379 ?auto_546383 ) ) ( not ( = ?auto_546379 ?auto_546384 ) ) ( not ( = ?auto_546379 ?auto_546385 ) ) ( not ( = ?auto_546379 ?auto_546386 ) ) ( not ( = ?auto_546379 ?auto_546387 ) ) ( not ( = ?auto_546379 ?auto_546388 ) ) ( not ( = ?auto_546379 ?auto_546389 ) ) ( not ( = ?auto_546379 ?auto_546390 ) ) ( not ( = ?auto_546380 ?auto_546381 ) ) ( not ( = ?auto_546380 ?auto_546382 ) ) ( not ( = ?auto_546380 ?auto_546383 ) ) ( not ( = ?auto_546380 ?auto_546384 ) ) ( not ( = ?auto_546380 ?auto_546385 ) ) ( not ( = ?auto_546380 ?auto_546386 ) ) ( not ( = ?auto_546380 ?auto_546387 ) ) ( not ( = ?auto_546380 ?auto_546388 ) ) ( not ( = ?auto_546380 ?auto_546389 ) ) ( not ( = ?auto_546380 ?auto_546390 ) ) ( not ( = ?auto_546381 ?auto_546382 ) ) ( not ( = ?auto_546381 ?auto_546383 ) ) ( not ( = ?auto_546381 ?auto_546384 ) ) ( not ( = ?auto_546381 ?auto_546385 ) ) ( not ( = ?auto_546381 ?auto_546386 ) ) ( not ( = ?auto_546381 ?auto_546387 ) ) ( not ( = ?auto_546381 ?auto_546388 ) ) ( not ( = ?auto_546381 ?auto_546389 ) ) ( not ( = ?auto_546381 ?auto_546390 ) ) ( not ( = ?auto_546382 ?auto_546383 ) ) ( not ( = ?auto_546382 ?auto_546384 ) ) ( not ( = ?auto_546382 ?auto_546385 ) ) ( not ( = ?auto_546382 ?auto_546386 ) ) ( not ( = ?auto_546382 ?auto_546387 ) ) ( not ( = ?auto_546382 ?auto_546388 ) ) ( not ( = ?auto_546382 ?auto_546389 ) ) ( not ( = ?auto_546382 ?auto_546390 ) ) ( not ( = ?auto_546383 ?auto_546384 ) ) ( not ( = ?auto_546383 ?auto_546385 ) ) ( not ( = ?auto_546383 ?auto_546386 ) ) ( not ( = ?auto_546383 ?auto_546387 ) ) ( not ( = ?auto_546383 ?auto_546388 ) ) ( not ( = ?auto_546383 ?auto_546389 ) ) ( not ( = ?auto_546383 ?auto_546390 ) ) ( not ( = ?auto_546384 ?auto_546385 ) ) ( not ( = ?auto_546384 ?auto_546386 ) ) ( not ( = ?auto_546384 ?auto_546387 ) ) ( not ( = ?auto_546384 ?auto_546388 ) ) ( not ( = ?auto_546384 ?auto_546389 ) ) ( not ( = ?auto_546384 ?auto_546390 ) ) ( not ( = ?auto_546385 ?auto_546386 ) ) ( not ( = ?auto_546385 ?auto_546387 ) ) ( not ( = ?auto_546385 ?auto_546388 ) ) ( not ( = ?auto_546385 ?auto_546389 ) ) ( not ( = ?auto_546385 ?auto_546390 ) ) ( not ( = ?auto_546386 ?auto_546387 ) ) ( not ( = ?auto_546386 ?auto_546388 ) ) ( not ( = ?auto_546386 ?auto_546389 ) ) ( not ( = ?auto_546386 ?auto_546390 ) ) ( not ( = ?auto_546387 ?auto_546388 ) ) ( not ( = ?auto_546387 ?auto_546389 ) ) ( not ( = ?auto_546387 ?auto_546390 ) ) ( not ( = ?auto_546388 ?auto_546389 ) ) ( not ( = ?auto_546388 ?auto_546390 ) ) ( not ( = ?auto_546389 ?auto_546390 ) ) ( ON ?auto_546389 ?auto_546390 ) ( ON ?auto_546388 ?auto_546389 ) ( ON ?auto_546387 ?auto_546388 ) ( ON ?auto_546386 ?auto_546387 ) ( ON ?auto_546385 ?auto_546386 ) ( ON ?auto_546384 ?auto_546385 ) ( ON ?auto_546383 ?auto_546384 ) ( ON ?auto_546382 ?auto_546383 ) ( ON ?auto_546381 ?auto_546382 ) ( ON ?auto_546380 ?auto_546381 ) ( ON ?auto_546379 ?auto_546380 ) ( ON ?auto_546378 ?auto_546379 ) ( ON ?auto_546377 ?auto_546378 ) ( CLEAR ?auto_546375 ) ( ON ?auto_546376 ?auto_546377 ) ( CLEAR ?auto_546376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_546375 ?auto_546376 )
      ( MAKE-16PILE ?auto_546375 ?auto_546376 ?auto_546377 ?auto_546378 ?auto_546379 ?auto_546380 ?auto_546381 ?auto_546382 ?auto_546383 ?auto_546384 ?auto_546385 ?auto_546386 ?auto_546387 ?auto_546388 ?auto_546389 ?auto_546390 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546407 - BLOCK
      ?auto_546408 - BLOCK
      ?auto_546409 - BLOCK
      ?auto_546410 - BLOCK
      ?auto_546411 - BLOCK
      ?auto_546412 - BLOCK
      ?auto_546413 - BLOCK
      ?auto_546414 - BLOCK
      ?auto_546415 - BLOCK
      ?auto_546416 - BLOCK
      ?auto_546417 - BLOCK
      ?auto_546418 - BLOCK
      ?auto_546419 - BLOCK
      ?auto_546420 - BLOCK
      ?auto_546421 - BLOCK
      ?auto_546422 - BLOCK
    )
    :vars
    (
      ?auto_546423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_546422 ?auto_546423 ) ( not ( = ?auto_546407 ?auto_546408 ) ) ( not ( = ?auto_546407 ?auto_546409 ) ) ( not ( = ?auto_546407 ?auto_546410 ) ) ( not ( = ?auto_546407 ?auto_546411 ) ) ( not ( = ?auto_546407 ?auto_546412 ) ) ( not ( = ?auto_546407 ?auto_546413 ) ) ( not ( = ?auto_546407 ?auto_546414 ) ) ( not ( = ?auto_546407 ?auto_546415 ) ) ( not ( = ?auto_546407 ?auto_546416 ) ) ( not ( = ?auto_546407 ?auto_546417 ) ) ( not ( = ?auto_546407 ?auto_546418 ) ) ( not ( = ?auto_546407 ?auto_546419 ) ) ( not ( = ?auto_546407 ?auto_546420 ) ) ( not ( = ?auto_546407 ?auto_546421 ) ) ( not ( = ?auto_546407 ?auto_546422 ) ) ( not ( = ?auto_546407 ?auto_546423 ) ) ( not ( = ?auto_546408 ?auto_546409 ) ) ( not ( = ?auto_546408 ?auto_546410 ) ) ( not ( = ?auto_546408 ?auto_546411 ) ) ( not ( = ?auto_546408 ?auto_546412 ) ) ( not ( = ?auto_546408 ?auto_546413 ) ) ( not ( = ?auto_546408 ?auto_546414 ) ) ( not ( = ?auto_546408 ?auto_546415 ) ) ( not ( = ?auto_546408 ?auto_546416 ) ) ( not ( = ?auto_546408 ?auto_546417 ) ) ( not ( = ?auto_546408 ?auto_546418 ) ) ( not ( = ?auto_546408 ?auto_546419 ) ) ( not ( = ?auto_546408 ?auto_546420 ) ) ( not ( = ?auto_546408 ?auto_546421 ) ) ( not ( = ?auto_546408 ?auto_546422 ) ) ( not ( = ?auto_546408 ?auto_546423 ) ) ( not ( = ?auto_546409 ?auto_546410 ) ) ( not ( = ?auto_546409 ?auto_546411 ) ) ( not ( = ?auto_546409 ?auto_546412 ) ) ( not ( = ?auto_546409 ?auto_546413 ) ) ( not ( = ?auto_546409 ?auto_546414 ) ) ( not ( = ?auto_546409 ?auto_546415 ) ) ( not ( = ?auto_546409 ?auto_546416 ) ) ( not ( = ?auto_546409 ?auto_546417 ) ) ( not ( = ?auto_546409 ?auto_546418 ) ) ( not ( = ?auto_546409 ?auto_546419 ) ) ( not ( = ?auto_546409 ?auto_546420 ) ) ( not ( = ?auto_546409 ?auto_546421 ) ) ( not ( = ?auto_546409 ?auto_546422 ) ) ( not ( = ?auto_546409 ?auto_546423 ) ) ( not ( = ?auto_546410 ?auto_546411 ) ) ( not ( = ?auto_546410 ?auto_546412 ) ) ( not ( = ?auto_546410 ?auto_546413 ) ) ( not ( = ?auto_546410 ?auto_546414 ) ) ( not ( = ?auto_546410 ?auto_546415 ) ) ( not ( = ?auto_546410 ?auto_546416 ) ) ( not ( = ?auto_546410 ?auto_546417 ) ) ( not ( = ?auto_546410 ?auto_546418 ) ) ( not ( = ?auto_546410 ?auto_546419 ) ) ( not ( = ?auto_546410 ?auto_546420 ) ) ( not ( = ?auto_546410 ?auto_546421 ) ) ( not ( = ?auto_546410 ?auto_546422 ) ) ( not ( = ?auto_546410 ?auto_546423 ) ) ( not ( = ?auto_546411 ?auto_546412 ) ) ( not ( = ?auto_546411 ?auto_546413 ) ) ( not ( = ?auto_546411 ?auto_546414 ) ) ( not ( = ?auto_546411 ?auto_546415 ) ) ( not ( = ?auto_546411 ?auto_546416 ) ) ( not ( = ?auto_546411 ?auto_546417 ) ) ( not ( = ?auto_546411 ?auto_546418 ) ) ( not ( = ?auto_546411 ?auto_546419 ) ) ( not ( = ?auto_546411 ?auto_546420 ) ) ( not ( = ?auto_546411 ?auto_546421 ) ) ( not ( = ?auto_546411 ?auto_546422 ) ) ( not ( = ?auto_546411 ?auto_546423 ) ) ( not ( = ?auto_546412 ?auto_546413 ) ) ( not ( = ?auto_546412 ?auto_546414 ) ) ( not ( = ?auto_546412 ?auto_546415 ) ) ( not ( = ?auto_546412 ?auto_546416 ) ) ( not ( = ?auto_546412 ?auto_546417 ) ) ( not ( = ?auto_546412 ?auto_546418 ) ) ( not ( = ?auto_546412 ?auto_546419 ) ) ( not ( = ?auto_546412 ?auto_546420 ) ) ( not ( = ?auto_546412 ?auto_546421 ) ) ( not ( = ?auto_546412 ?auto_546422 ) ) ( not ( = ?auto_546412 ?auto_546423 ) ) ( not ( = ?auto_546413 ?auto_546414 ) ) ( not ( = ?auto_546413 ?auto_546415 ) ) ( not ( = ?auto_546413 ?auto_546416 ) ) ( not ( = ?auto_546413 ?auto_546417 ) ) ( not ( = ?auto_546413 ?auto_546418 ) ) ( not ( = ?auto_546413 ?auto_546419 ) ) ( not ( = ?auto_546413 ?auto_546420 ) ) ( not ( = ?auto_546413 ?auto_546421 ) ) ( not ( = ?auto_546413 ?auto_546422 ) ) ( not ( = ?auto_546413 ?auto_546423 ) ) ( not ( = ?auto_546414 ?auto_546415 ) ) ( not ( = ?auto_546414 ?auto_546416 ) ) ( not ( = ?auto_546414 ?auto_546417 ) ) ( not ( = ?auto_546414 ?auto_546418 ) ) ( not ( = ?auto_546414 ?auto_546419 ) ) ( not ( = ?auto_546414 ?auto_546420 ) ) ( not ( = ?auto_546414 ?auto_546421 ) ) ( not ( = ?auto_546414 ?auto_546422 ) ) ( not ( = ?auto_546414 ?auto_546423 ) ) ( not ( = ?auto_546415 ?auto_546416 ) ) ( not ( = ?auto_546415 ?auto_546417 ) ) ( not ( = ?auto_546415 ?auto_546418 ) ) ( not ( = ?auto_546415 ?auto_546419 ) ) ( not ( = ?auto_546415 ?auto_546420 ) ) ( not ( = ?auto_546415 ?auto_546421 ) ) ( not ( = ?auto_546415 ?auto_546422 ) ) ( not ( = ?auto_546415 ?auto_546423 ) ) ( not ( = ?auto_546416 ?auto_546417 ) ) ( not ( = ?auto_546416 ?auto_546418 ) ) ( not ( = ?auto_546416 ?auto_546419 ) ) ( not ( = ?auto_546416 ?auto_546420 ) ) ( not ( = ?auto_546416 ?auto_546421 ) ) ( not ( = ?auto_546416 ?auto_546422 ) ) ( not ( = ?auto_546416 ?auto_546423 ) ) ( not ( = ?auto_546417 ?auto_546418 ) ) ( not ( = ?auto_546417 ?auto_546419 ) ) ( not ( = ?auto_546417 ?auto_546420 ) ) ( not ( = ?auto_546417 ?auto_546421 ) ) ( not ( = ?auto_546417 ?auto_546422 ) ) ( not ( = ?auto_546417 ?auto_546423 ) ) ( not ( = ?auto_546418 ?auto_546419 ) ) ( not ( = ?auto_546418 ?auto_546420 ) ) ( not ( = ?auto_546418 ?auto_546421 ) ) ( not ( = ?auto_546418 ?auto_546422 ) ) ( not ( = ?auto_546418 ?auto_546423 ) ) ( not ( = ?auto_546419 ?auto_546420 ) ) ( not ( = ?auto_546419 ?auto_546421 ) ) ( not ( = ?auto_546419 ?auto_546422 ) ) ( not ( = ?auto_546419 ?auto_546423 ) ) ( not ( = ?auto_546420 ?auto_546421 ) ) ( not ( = ?auto_546420 ?auto_546422 ) ) ( not ( = ?auto_546420 ?auto_546423 ) ) ( not ( = ?auto_546421 ?auto_546422 ) ) ( not ( = ?auto_546421 ?auto_546423 ) ) ( not ( = ?auto_546422 ?auto_546423 ) ) ( ON ?auto_546421 ?auto_546422 ) ( ON ?auto_546420 ?auto_546421 ) ( ON ?auto_546419 ?auto_546420 ) ( ON ?auto_546418 ?auto_546419 ) ( ON ?auto_546417 ?auto_546418 ) ( ON ?auto_546416 ?auto_546417 ) ( ON ?auto_546415 ?auto_546416 ) ( ON ?auto_546414 ?auto_546415 ) ( ON ?auto_546413 ?auto_546414 ) ( ON ?auto_546412 ?auto_546413 ) ( ON ?auto_546411 ?auto_546412 ) ( ON ?auto_546410 ?auto_546411 ) ( ON ?auto_546409 ?auto_546410 ) ( ON ?auto_546408 ?auto_546409 ) ( ON ?auto_546407 ?auto_546408 ) ( CLEAR ?auto_546407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546407 )
      ( MAKE-16PILE ?auto_546407 ?auto_546408 ?auto_546409 ?auto_546410 ?auto_546411 ?auto_546412 ?auto_546413 ?auto_546414 ?auto_546415 ?auto_546416 ?auto_546417 ?auto_546418 ?auto_546419 ?auto_546420 ?auto_546421 ?auto_546422 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546440 - BLOCK
      ?auto_546441 - BLOCK
      ?auto_546442 - BLOCK
      ?auto_546443 - BLOCK
      ?auto_546444 - BLOCK
      ?auto_546445 - BLOCK
      ?auto_546446 - BLOCK
      ?auto_546447 - BLOCK
      ?auto_546448 - BLOCK
      ?auto_546449 - BLOCK
      ?auto_546450 - BLOCK
      ?auto_546451 - BLOCK
      ?auto_546452 - BLOCK
      ?auto_546453 - BLOCK
      ?auto_546454 - BLOCK
      ?auto_546455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_546455 ) ( not ( = ?auto_546440 ?auto_546441 ) ) ( not ( = ?auto_546440 ?auto_546442 ) ) ( not ( = ?auto_546440 ?auto_546443 ) ) ( not ( = ?auto_546440 ?auto_546444 ) ) ( not ( = ?auto_546440 ?auto_546445 ) ) ( not ( = ?auto_546440 ?auto_546446 ) ) ( not ( = ?auto_546440 ?auto_546447 ) ) ( not ( = ?auto_546440 ?auto_546448 ) ) ( not ( = ?auto_546440 ?auto_546449 ) ) ( not ( = ?auto_546440 ?auto_546450 ) ) ( not ( = ?auto_546440 ?auto_546451 ) ) ( not ( = ?auto_546440 ?auto_546452 ) ) ( not ( = ?auto_546440 ?auto_546453 ) ) ( not ( = ?auto_546440 ?auto_546454 ) ) ( not ( = ?auto_546440 ?auto_546455 ) ) ( not ( = ?auto_546441 ?auto_546442 ) ) ( not ( = ?auto_546441 ?auto_546443 ) ) ( not ( = ?auto_546441 ?auto_546444 ) ) ( not ( = ?auto_546441 ?auto_546445 ) ) ( not ( = ?auto_546441 ?auto_546446 ) ) ( not ( = ?auto_546441 ?auto_546447 ) ) ( not ( = ?auto_546441 ?auto_546448 ) ) ( not ( = ?auto_546441 ?auto_546449 ) ) ( not ( = ?auto_546441 ?auto_546450 ) ) ( not ( = ?auto_546441 ?auto_546451 ) ) ( not ( = ?auto_546441 ?auto_546452 ) ) ( not ( = ?auto_546441 ?auto_546453 ) ) ( not ( = ?auto_546441 ?auto_546454 ) ) ( not ( = ?auto_546441 ?auto_546455 ) ) ( not ( = ?auto_546442 ?auto_546443 ) ) ( not ( = ?auto_546442 ?auto_546444 ) ) ( not ( = ?auto_546442 ?auto_546445 ) ) ( not ( = ?auto_546442 ?auto_546446 ) ) ( not ( = ?auto_546442 ?auto_546447 ) ) ( not ( = ?auto_546442 ?auto_546448 ) ) ( not ( = ?auto_546442 ?auto_546449 ) ) ( not ( = ?auto_546442 ?auto_546450 ) ) ( not ( = ?auto_546442 ?auto_546451 ) ) ( not ( = ?auto_546442 ?auto_546452 ) ) ( not ( = ?auto_546442 ?auto_546453 ) ) ( not ( = ?auto_546442 ?auto_546454 ) ) ( not ( = ?auto_546442 ?auto_546455 ) ) ( not ( = ?auto_546443 ?auto_546444 ) ) ( not ( = ?auto_546443 ?auto_546445 ) ) ( not ( = ?auto_546443 ?auto_546446 ) ) ( not ( = ?auto_546443 ?auto_546447 ) ) ( not ( = ?auto_546443 ?auto_546448 ) ) ( not ( = ?auto_546443 ?auto_546449 ) ) ( not ( = ?auto_546443 ?auto_546450 ) ) ( not ( = ?auto_546443 ?auto_546451 ) ) ( not ( = ?auto_546443 ?auto_546452 ) ) ( not ( = ?auto_546443 ?auto_546453 ) ) ( not ( = ?auto_546443 ?auto_546454 ) ) ( not ( = ?auto_546443 ?auto_546455 ) ) ( not ( = ?auto_546444 ?auto_546445 ) ) ( not ( = ?auto_546444 ?auto_546446 ) ) ( not ( = ?auto_546444 ?auto_546447 ) ) ( not ( = ?auto_546444 ?auto_546448 ) ) ( not ( = ?auto_546444 ?auto_546449 ) ) ( not ( = ?auto_546444 ?auto_546450 ) ) ( not ( = ?auto_546444 ?auto_546451 ) ) ( not ( = ?auto_546444 ?auto_546452 ) ) ( not ( = ?auto_546444 ?auto_546453 ) ) ( not ( = ?auto_546444 ?auto_546454 ) ) ( not ( = ?auto_546444 ?auto_546455 ) ) ( not ( = ?auto_546445 ?auto_546446 ) ) ( not ( = ?auto_546445 ?auto_546447 ) ) ( not ( = ?auto_546445 ?auto_546448 ) ) ( not ( = ?auto_546445 ?auto_546449 ) ) ( not ( = ?auto_546445 ?auto_546450 ) ) ( not ( = ?auto_546445 ?auto_546451 ) ) ( not ( = ?auto_546445 ?auto_546452 ) ) ( not ( = ?auto_546445 ?auto_546453 ) ) ( not ( = ?auto_546445 ?auto_546454 ) ) ( not ( = ?auto_546445 ?auto_546455 ) ) ( not ( = ?auto_546446 ?auto_546447 ) ) ( not ( = ?auto_546446 ?auto_546448 ) ) ( not ( = ?auto_546446 ?auto_546449 ) ) ( not ( = ?auto_546446 ?auto_546450 ) ) ( not ( = ?auto_546446 ?auto_546451 ) ) ( not ( = ?auto_546446 ?auto_546452 ) ) ( not ( = ?auto_546446 ?auto_546453 ) ) ( not ( = ?auto_546446 ?auto_546454 ) ) ( not ( = ?auto_546446 ?auto_546455 ) ) ( not ( = ?auto_546447 ?auto_546448 ) ) ( not ( = ?auto_546447 ?auto_546449 ) ) ( not ( = ?auto_546447 ?auto_546450 ) ) ( not ( = ?auto_546447 ?auto_546451 ) ) ( not ( = ?auto_546447 ?auto_546452 ) ) ( not ( = ?auto_546447 ?auto_546453 ) ) ( not ( = ?auto_546447 ?auto_546454 ) ) ( not ( = ?auto_546447 ?auto_546455 ) ) ( not ( = ?auto_546448 ?auto_546449 ) ) ( not ( = ?auto_546448 ?auto_546450 ) ) ( not ( = ?auto_546448 ?auto_546451 ) ) ( not ( = ?auto_546448 ?auto_546452 ) ) ( not ( = ?auto_546448 ?auto_546453 ) ) ( not ( = ?auto_546448 ?auto_546454 ) ) ( not ( = ?auto_546448 ?auto_546455 ) ) ( not ( = ?auto_546449 ?auto_546450 ) ) ( not ( = ?auto_546449 ?auto_546451 ) ) ( not ( = ?auto_546449 ?auto_546452 ) ) ( not ( = ?auto_546449 ?auto_546453 ) ) ( not ( = ?auto_546449 ?auto_546454 ) ) ( not ( = ?auto_546449 ?auto_546455 ) ) ( not ( = ?auto_546450 ?auto_546451 ) ) ( not ( = ?auto_546450 ?auto_546452 ) ) ( not ( = ?auto_546450 ?auto_546453 ) ) ( not ( = ?auto_546450 ?auto_546454 ) ) ( not ( = ?auto_546450 ?auto_546455 ) ) ( not ( = ?auto_546451 ?auto_546452 ) ) ( not ( = ?auto_546451 ?auto_546453 ) ) ( not ( = ?auto_546451 ?auto_546454 ) ) ( not ( = ?auto_546451 ?auto_546455 ) ) ( not ( = ?auto_546452 ?auto_546453 ) ) ( not ( = ?auto_546452 ?auto_546454 ) ) ( not ( = ?auto_546452 ?auto_546455 ) ) ( not ( = ?auto_546453 ?auto_546454 ) ) ( not ( = ?auto_546453 ?auto_546455 ) ) ( not ( = ?auto_546454 ?auto_546455 ) ) ( ON ?auto_546454 ?auto_546455 ) ( ON ?auto_546453 ?auto_546454 ) ( ON ?auto_546452 ?auto_546453 ) ( ON ?auto_546451 ?auto_546452 ) ( ON ?auto_546450 ?auto_546451 ) ( ON ?auto_546449 ?auto_546450 ) ( ON ?auto_546448 ?auto_546449 ) ( ON ?auto_546447 ?auto_546448 ) ( ON ?auto_546446 ?auto_546447 ) ( ON ?auto_546445 ?auto_546446 ) ( ON ?auto_546444 ?auto_546445 ) ( ON ?auto_546443 ?auto_546444 ) ( ON ?auto_546442 ?auto_546443 ) ( ON ?auto_546441 ?auto_546442 ) ( ON ?auto_546440 ?auto_546441 ) ( CLEAR ?auto_546440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_546440 )
      ( MAKE-16PILE ?auto_546440 ?auto_546441 ?auto_546442 ?auto_546443 ?auto_546444 ?auto_546445 ?auto_546446 ?auto_546447 ?auto_546448 ?auto_546449 ?auto_546450 ?auto_546451 ?auto_546452 ?auto_546453 ?auto_546454 ?auto_546455 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_546472 - BLOCK
      ?auto_546473 - BLOCK
      ?auto_546474 - BLOCK
      ?auto_546475 - BLOCK
      ?auto_546476 - BLOCK
      ?auto_546477 - BLOCK
      ?auto_546478 - BLOCK
      ?auto_546479 - BLOCK
      ?auto_546480 - BLOCK
      ?auto_546481 - BLOCK
      ?auto_546482 - BLOCK
      ?auto_546483 - BLOCK
      ?auto_546484 - BLOCK
      ?auto_546485 - BLOCK
      ?auto_546486 - BLOCK
      ?auto_546487 - BLOCK
    )
    :vars
    (
      ?auto_546488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_546472 ?auto_546473 ) ) ( not ( = ?auto_546472 ?auto_546474 ) ) ( not ( = ?auto_546472 ?auto_546475 ) ) ( not ( = ?auto_546472 ?auto_546476 ) ) ( not ( = ?auto_546472 ?auto_546477 ) ) ( not ( = ?auto_546472 ?auto_546478 ) ) ( not ( = ?auto_546472 ?auto_546479 ) ) ( not ( = ?auto_546472 ?auto_546480 ) ) ( not ( = ?auto_546472 ?auto_546481 ) ) ( not ( = ?auto_546472 ?auto_546482 ) ) ( not ( = ?auto_546472 ?auto_546483 ) ) ( not ( = ?auto_546472 ?auto_546484 ) ) ( not ( = ?auto_546472 ?auto_546485 ) ) ( not ( = ?auto_546472 ?auto_546486 ) ) ( not ( = ?auto_546472 ?auto_546487 ) ) ( not ( = ?auto_546473 ?auto_546474 ) ) ( not ( = ?auto_546473 ?auto_546475 ) ) ( not ( = ?auto_546473 ?auto_546476 ) ) ( not ( = ?auto_546473 ?auto_546477 ) ) ( not ( = ?auto_546473 ?auto_546478 ) ) ( not ( = ?auto_546473 ?auto_546479 ) ) ( not ( = ?auto_546473 ?auto_546480 ) ) ( not ( = ?auto_546473 ?auto_546481 ) ) ( not ( = ?auto_546473 ?auto_546482 ) ) ( not ( = ?auto_546473 ?auto_546483 ) ) ( not ( = ?auto_546473 ?auto_546484 ) ) ( not ( = ?auto_546473 ?auto_546485 ) ) ( not ( = ?auto_546473 ?auto_546486 ) ) ( not ( = ?auto_546473 ?auto_546487 ) ) ( not ( = ?auto_546474 ?auto_546475 ) ) ( not ( = ?auto_546474 ?auto_546476 ) ) ( not ( = ?auto_546474 ?auto_546477 ) ) ( not ( = ?auto_546474 ?auto_546478 ) ) ( not ( = ?auto_546474 ?auto_546479 ) ) ( not ( = ?auto_546474 ?auto_546480 ) ) ( not ( = ?auto_546474 ?auto_546481 ) ) ( not ( = ?auto_546474 ?auto_546482 ) ) ( not ( = ?auto_546474 ?auto_546483 ) ) ( not ( = ?auto_546474 ?auto_546484 ) ) ( not ( = ?auto_546474 ?auto_546485 ) ) ( not ( = ?auto_546474 ?auto_546486 ) ) ( not ( = ?auto_546474 ?auto_546487 ) ) ( not ( = ?auto_546475 ?auto_546476 ) ) ( not ( = ?auto_546475 ?auto_546477 ) ) ( not ( = ?auto_546475 ?auto_546478 ) ) ( not ( = ?auto_546475 ?auto_546479 ) ) ( not ( = ?auto_546475 ?auto_546480 ) ) ( not ( = ?auto_546475 ?auto_546481 ) ) ( not ( = ?auto_546475 ?auto_546482 ) ) ( not ( = ?auto_546475 ?auto_546483 ) ) ( not ( = ?auto_546475 ?auto_546484 ) ) ( not ( = ?auto_546475 ?auto_546485 ) ) ( not ( = ?auto_546475 ?auto_546486 ) ) ( not ( = ?auto_546475 ?auto_546487 ) ) ( not ( = ?auto_546476 ?auto_546477 ) ) ( not ( = ?auto_546476 ?auto_546478 ) ) ( not ( = ?auto_546476 ?auto_546479 ) ) ( not ( = ?auto_546476 ?auto_546480 ) ) ( not ( = ?auto_546476 ?auto_546481 ) ) ( not ( = ?auto_546476 ?auto_546482 ) ) ( not ( = ?auto_546476 ?auto_546483 ) ) ( not ( = ?auto_546476 ?auto_546484 ) ) ( not ( = ?auto_546476 ?auto_546485 ) ) ( not ( = ?auto_546476 ?auto_546486 ) ) ( not ( = ?auto_546476 ?auto_546487 ) ) ( not ( = ?auto_546477 ?auto_546478 ) ) ( not ( = ?auto_546477 ?auto_546479 ) ) ( not ( = ?auto_546477 ?auto_546480 ) ) ( not ( = ?auto_546477 ?auto_546481 ) ) ( not ( = ?auto_546477 ?auto_546482 ) ) ( not ( = ?auto_546477 ?auto_546483 ) ) ( not ( = ?auto_546477 ?auto_546484 ) ) ( not ( = ?auto_546477 ?auto_546485 ) ) ( not ( = ?auto_546477 ?auto_546486 ) ) ( not ( = ?auto_546477 ?auto_546487 ) ) ( not ( = ?auto_546478 ?auto_546479 ) ) ( not ( = ?auto_546478 ?auto_546480 ) ) ( not ( = ?auto_546478 ?auto_546481 ) ) ( not ( = ?auto_546478 ?auto_546482 ) ) ( not ( = ?auto_546478 ?auto_546483 ) ) ( not ( = ?auto_546478 ?auto_546484 ) ) ( not ( = ?auto_546478 ?auto_546485 ) ) ( not ( = ?auto_546478 ?auto_546486 ) ) ( not ( = ?auto_546478 ?auto_546487 ) ) ( not ( = ?auto_546479 ?auto_546480 ) ) ( not ( = ?auto_546479 ?auto_546481 ) ) ( not ( = ?auto_546479 ?auto_546482 ) ) ( not ( = ?auto_546479 ?auto_546483 ) ) ( not ( = ?auto_546479 ?auto_546484 ) ) ( not ( = ?auto_546479 ?auto_546485 ) ) ( not ( = ?auto_546479 ?auto_546486 ) ) ( not ( = ?auto_546479 ?auto_546487 ) ) ( not ( = ?auto_546480 ?auto_546481 ) ) ( not ( = ?auto_546480 ?auto_546482 ) ) ( not ( = ?auto_546480 ?auto_546483 ) ) ( not ( = ?auto_546480 ?auto_546484 ) ) ( not ( = ?auto_546480 ?auto_546485 ) ) ( not ( = ?auto_546480 ?auto_546486 ) ) ( not ( = ?auto_546480 ?auto_546487 ) ) ( not ( = ?auto_546481 ?auto_546482 ) ) ( not ( = ?auto_546481 ?auto_546483 ) ) ( not ( = ?auto_546481 ?auto_546484 ) ) ( not ( = ?auto_546481 ?auto_546485 ) ) ( not ( = ?auto_546481 ?auto_546486 ) ) ( not ( = ?auto_546481 ?auto_546487 ) ) ( not ( = ?auto_546482 ?auto_546483 ) ) ( not ( = ?auto_546482 ?auto_546484 ) ) ( not ( = ?auto_546482 ?auto_546485 ) ) ( not ( = ?auto_546482 ?auto_546486 ) ) ( not ( = ?auto_546482 ?auto_546487 ) ) ( not ( = ?auto_546483 ?auto_546484 ) ) ( not ( = ?auto_546483 ?auto_546485 ) ) ( not ( = ?auto_546483 ?auto_546486 ) ) ( not ( = ?auto_546483 ?auto_546487 ) ) ( not ( = ?auto_546484 ?auto_546485 ) ) ( not ( = ?auto_546484 ?auto_546486 ) ) ( not ( = ?auto_546484 ?auto_546487 ) ) ( not ( = ?auto_546485 ?auto_546486 ) ) ( not ( = ?auto_546485 ?auto_546487 ) ) ( not ( = ?auto_546486 ?auto_546487 ) ) ( ON ?auto_546472 ?auto_546488 ) ( not ( = ?auto_546487 ?auto_546488 ) ) ( not ( = ?auto_546486 ?auto_546488 ) ) ( not ( = ?auto_546485 ?auto_546488 ) ) ( not ( = ?auto_546484 ?auto_546488 ) ) ( not ( = ?auto_546483 ?auto_546488 ) ) ( not ( = ?auto_546482 ?auto_546488 ) ) ( not ( = ?auto_546481 ?auto_546488 ) ) ( not ( = ?auto_546480 ?auto_546488 ) ) ( not ( = ?auto_546479 ?auto_546488 ) ) ( not ( = ?auto_546478 ?auto_546488 ) ) ( not ( = ?auto_546477 ?auto_546488 ) ) ( not ( = ?auto_546476 ?auto_546488 ) ) ( not ( = ?auto_546475 ?auto_546488 ) ) ( not ( = ?auto_546474 ?auto_546488 ) ) ( not ( = ?auto_546473 ?auto_546488 ) ) ( not ( = ?auto_546472 ?auto_546488 ) ) ( ON ?auto_546473 ?auto_546472 ) ( ON ?auto_546474 ?auto_546473 ) ( ON ?auto_546475 ?auto_546474 ) ( ON ?auto_546476 ?auto_546475 ) ( ON ?auto_546477 ?auto_546476 ) ( ON ?auto_546478 ?auto_546477 ) ( ON ?auto_546479 ?auto_546478 ) ( ON ?auto_546480 ?auto_546479 ) ( ON ?auto_546481 ?auto_546480 ) ( ON ?auto_546482 ?auto_546481 ) ( ON ?auto_546483 ?auto_546482 ) ( ON ?auto_546484 ?auto_546483 ) ( ON ?auto_546485 ?auto_546484 ) ( ON ?auto_546486 ?auto_546485 ) ( ON ?auto_546487 ?auto_546486 ) ( CLEAR ?auto_546487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_546487 ?auto_546486 ?auto_546485 ?auto_546484 ?auto_546483 ?auto_546482 ?auto_546481 ?auto_546480 ?auto_546479 ?auto_546478 ?auto_546477 ?auto_546476 ?auto_546475 ?auto_546474 ?auto_546473 ?auto_546472 )
      ( MAKE-16PILE ?auto_546472 ?auto_546473 ?auto_546474 ?auto_546475 ?auto_546476 ?auto_546477 ?auto_546478 ?auto_546479 ?auto_546480 ?auto_546481 ?auto_546482 ?auto_546483 ?auto_546484 ?auto_546485 ?auto_546486 ?auto_546487 ) )
  )

)

