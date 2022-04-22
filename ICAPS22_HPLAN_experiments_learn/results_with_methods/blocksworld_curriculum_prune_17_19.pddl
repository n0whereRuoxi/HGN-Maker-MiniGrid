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
      ?auto_732217 - BLOCK
    )
    :vars
    (
      ?auto_732218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732217 ?auto_732218 ) ( CLEAR ?auto_732217 ) ( HAND-EMPTY ) ( not ( = ?auto_732217 ?auto_732218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732217 ?auto_732218 )
      ( !PUTDOWN ?auto_732217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_732224 - BLOCK
      ?auto_732225 - BLOCK
    )
    :vars
    (
      ?auto_732226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732224 ) ( ON ?auto_732225 ?auto_732226 ) ( CLEAR ?auto_732225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732224 ) ( not ( = ?auto_732224 ?auto_732225 ) ) ( not ( = ?auto_732224 ?auto_732226 ) ) ( not ( = ?auto_732225 ?auto_732226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732225 ?auto_732226 )
      ( !STACK ?auto_732225 ?auto_732224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_732234 - BLOCK
      ?auto_732235 - BLOCK
    )
    :vars
    (
      ?auto_732236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732235 ?auto_732236 ) ( not ( = ?auto_732234 ?auto_732235 ) ) ( not ( = ?auto_732234 ?auto_732236 ) ) ( not ( = ?auto_732235 ?auto_732236 ) ) ( ON ?auto_732234 ?auto_732235 ) ( CLEAR ?auto_732234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732234 )
      ( MAKE-2PILE ?auto_732234 ?auto_732235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_732245 - BLOCK
      ?auto_732246 - BLOCK
      ?auto_732247 - BLOCK
    )
    :vars
    (
      ?auto_732248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732246 ) ( ON ?auto_732247 ?auto_732248 ) ( CLEAR ?auto_732247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732245 ) ( ON ?auto_732246 ?auto_732245 ) ( not ( = ?auto_732245 ?auto_732246 ) ) ( not ( = ?auto_732245 ?auto_732247 ) ) ( not ( = ?auto_732245 ?auto_732248 ) ) ( not ( = ?auto_732246 ?auto_732247 ) ) ( not ( = ?auto_732246 ?auto_732248 ) ) ( not ( = ?auto_732247 ?auto_732248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732247 ?auto_732248 )
      ( !STACK ?auto_732247 ?auto_732246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_732259 - BLOCK
      ?auto_732260 - BLOCK
      ?auto_732261 - BLOCK
    )
    :vars
    (
      ?auto_732262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732261 ?auto_732262 ) ( ON-TABLE ?auto_732259 ) ( not ( = ?auto_732259 ?auto_732260 ) ) ( not ( = ?auto_732259 ?auto_732261 ) ) ( not ( = ?auto_732259 ?auto_732262 ) ) ( not ( = ?auto_732260 ?auto_732261 ) ) ( not ( = ?auto_732260 ?auto_732262 ) ) ( not ( = ?auto_732261 ?auto_732262 ) ) ( CLEAR ?auto_732259 ) ( ON ?auto_732260 ?auto_732261 ) ( CLEAR ?auto_732260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732259 ?auto_732260 )
      ( MAKE-3PILE ?auto_732259 ?auto_732260 ?auto_732261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_732273 - BLOCK
      ?auto_732274 - BLOCK
      ?auto_732275 - BLOCK
    )
    :vars
    (
      ?auto_732276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732275 ?auto_732276 ) ( not ( = ?auto_732273 ?auto_732274 ) ) ( not ( = ?auto_732273 ?auto_732275 ) ) ( not ( = ?auto_732273 ?auto_732276 ) ) ( not ( = ?auto_732274 ?auto_732275 ) ) ( not ( = ?auto_732274 ?auto_732276 ) ) ( not ( = ?auto_732275 ?auto_732276 ) ) ( ON ?auto_732274 ?auto_732275 ) ( ON ?auto_732273 ?auto_732274 ) ( CLEAR ?auto_732273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732273 )
      ( MAKE-3PILE ?auto_732273 ?auto_732274 ?auto_732275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_732288 - BLOCK
      ?auto_732289 - BLOCK
      ?auto_732290 - BLOCK
      ?auto_732291 - BLOCK
    )
    :vars
    (
      ?auto_732292 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732290 ) ( ON ?auto_732291 ?auto_732292 ) ( CLEAR ?auto_732291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732288 ) ( ON ?auto_732289 ?auto_732288 ) ( ON ?auto_732290 ?auto_732289 ) ( not ( = ?auto_732288 ?auto_732289 ) ) ( not ( = ?auto_732288 ?auto_732290 ) ) ( not ( = ?auto_732288 ?auto_732291 ) ) ( not ( = ?auto_732288 ?auto_732292 ) ) ( not ( = ?auto_732289 ?auto_732290 ) ) ( not ( = ?auto_732289 ?auto_732291 ) ) ( not ( = ?auto_732289 ?auto_732292 ) ) ( not ( = ?auto_732290 ?auto_732291 ) ) ( not ( = ?auto_732290 ?auto_732292 ) ) ( not ( = ?auto_732291 ?auto_732292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732291 ?auto_732292 )
      ( !STACK ?auto_732291 ?auto_732290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_732306 - BLOCK
      ?auto_732307 - BLOCK
      ?auto_732308 - BLOCK
      ?auto_732309 - BLOCK
    )
    :vars
    (
      ?auto_732310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732309 ?auto_732310 ) ( ON-TABLE ?auto_732306 ) ( ON ?auto_732307 ?auto_732306 ) ( not ( = ?auto_732306 ?auto_732307 ) ) ( not ( = ?auto_732306 ?auto_732308 ) ) ( not ( = ?auto_732306 ?auto_732309 ) ) ( not ( = ?auto_732306 ?auto_732310 ) ) ( not ( = ?auto_732307 ?auto_732308 ) ) ( not ( = ?auto_732307 ?auto_732309 ) ) ( not ( = ?auto_732307 ?auto_732310 ) ) ( not ( = ?auto_732308 ?auto_732309 ) ) ( not ( = ?auto_732308 ?auto_732310 ) ) ( not ( = ?auto_732309 ?auto_732310 ) ) ( CLEAR ?auto_732307 ) ( ON ?auto_732308 ?auto_732309 ) ( CLEAR ?auto_732308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_732306 ?auto_732307 ?auto_732308 )
      ( MAKE-4PILE ?auto_732306 ?auto_732307 ?auto_732308 ?auto_732309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_732324 - BLOCK
      ?auto_732325 - BLOCK
      ?auto_732326 - BLOCK
      ?auto_732327 - BLOCK
    )
    :vars
    (
      ?auto_732328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732327 ?auto_732328 ) ( ON-TABLE ?auto_732324 ) ( not ( = ?auto_732324 ?auto_732325 ) ) ( not ( = ?auto_732324 ?auto_732326 ) ) ( not ( = ?auto_732324 ?auto_732327 ) ) ( not ( = ?auto_732324 ?auto_732328 ) ) ( not ( = ?auto_732325 ?auto_732326 ) ) ( not ( = ?auto_732325 ?auto_732327 ) ) ( not ( = ?auto_732325 ?auto_732328 ) ) ( not ( = ?auto_732326 ?auto_732327 ) ) ( not ( = ?auto_732326 ?auto_732328 ) ) ( not ( = ?auto_732327 ?auto_732328 ) ) ( ON ?auto_732326 ?auto_732327 ) ( CLEAR ?auto_732324 ) ( ON ?auto_732325 ?auto_732326 ) ( CLEAR ?auto_732325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732324 ?auto_732325 )
      ( MAKE-4PILE ?auto_732324 ?auto_732325 ?auto_732326 ?auto_732327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_732342 - BLOCK
      ?auto_732343 - BLOCK
      ?auto_732344 - BLOCK
      ?auto_732345 - BLOCK
    )
    :vars
    (
      ?auto_732346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732345 ?auto_732346 ) ( not ( = ?auto_732342 ?auto_732343 ) ) ( not ( = ?auto_732342 ?auto_732344 ) ) ( not ( = ?auto_732342 ?auto_732345 ) ) ( not ( = ?auto_732342 ?auto_732346 ) ) ( not ( = ?auto_732343 ?auto_732344 ) ) ( not ( = ?auto_732343 ?auto_732345 ) ) ( not ( = ?auto_732343 ?auto_732346 ) ) ( not ( = ?auto_732344 ?auto_732345 ) ) ( not ( = ?auto_732344 ?auto_732346 ) ) ( not ( = ?auto_732345 ?auto_732346 ) ) ( ON ?auto_732344 ?auto_732345 ) ( ON ?auto_732343 ?auto_732344 ) ( ON ?auto_732342 ?auto_732343 ) ( CLEAR ?auto_732342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732342 )
      ( MAKE-4PILE ?auto_732342 ?auto_732343 ?auto_732344 ?auto_732345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_732361 - BLOCK
      ?auto_732362 - BLOCK
      ?auto_732363 - BLOCK
      ?auto_732364 - BLOCK
      ?auto_732365 - BLOCK
    )
    :vars
    (
      ?auto_732366 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732364 ) ( ON ?auto_732365 ?auto_732366 ) ( CLEAR ?auto_732365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732361 ) ( ON ?auto_732362 ?auto_732361 ) ( ON ?auto_732363 ?auto_732362 ) ( ON ?auto_732364 ?auto_732363 ) ( not ( = ?auto_732361 ?auto_732362 ) ) ( not ( = ?auto_732361 ?auto_732363 ) ) ( not ( = ?auto_732361 ?auto_732364 ) ) ( not ( = ?auto_732361 ?auto_732365 ) ) ( not ( = ?auto_732361 ?auto_732366 ) ) ( not ( = ?auto_732362 ?auto_732363 ) ) ( not ( = ?auto_732362 ?auto_732364 ) ) ( not ( = ?auto_732362 ?auto_732365 ) ) ( not ( = ?auto_732362 ?auto_732366 ) ) ( not ( = ?auto_732363 ?auto_732364 ) ) ( not ( = ?auto_732363 ?auto_732365 ) ) ( not ( = ?auto_732363 ?auto_732366 ) ) ( not ( = ?auto_732364 ?auto_732365 ) ) ( not ( = ?auto_732364 ?auto_732366 ) ) ( not ( = ?auto_732365 ?auto_732366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732365 ?auto_732366 )
      ( !STACK ?auto_732365 ?auto_732364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_732383 - BLOCK
      ?auto_732384 - BLOCK
      ?auto_732385 - BLOCK
      ?auto_732386 - BLOCK
      ?auto_732387 - BLOCK
    )
    :vars
    (
      ?auto_732388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732387 ?auto_732388 ) ( ON-TABLE ?auto_732383 ) ( ON ?auto_732384 ?auto_732383 ) ( ON ?auto_732385 ?auto_732384 ) ( not ( = ?auto_732383 ?auto_732384 ) ) ( not ( = ?auto_732383 ?auto_732385 ) ) ( not ( = ?auto_732383 ?auto_732386 ) ) ( not ( = ?auto_732383 ?auto_732387 ) ) ( not ( = ?auto_732383 ?auto_732388 ) ) ( not ( = ?auto_732384 ?auto_732385 ) ) ( not ( = ?auto_732384 ?auto_732386 ) ) ( not ( = ?auto_732384 ?auto_732387 ) ) ( not ( = ?auto_732384 ?auto_732388 ) ) ( not ( = ?auto_732385 ?auto_732386 ) ) ( not ( = ?auto_732385 ?auto_732387 ) ) ( not ( = ?auto_732385 ?auto_732388 ) ) ( not ( = ?auto_732386 ?auto_732387 ) ) ( not ( = ?auto_732386 ?auto_732388 ) ) ( not ( = ?auto_732387 ?auto_732388 ) ) ( CLEAR ?auto_732385 ) ( ON ?auto_732386 ?auto_732387 ) ( CLEAR ?auto_732386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_732383 ?auto_732384 ?auto_732385 ?auto_732386 )
      ( MAKE-5PILE ?auto_732383 ?auto_732384 ?auto_732385 ?auto_732386 ?auto_732387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_732405 - BLOCK
      ?auto_732406 - BLOCK
      ?auto_732407 - BLOCK
      ?auto_732408 - BLOCK
      ?auto_732409 - BLOCK
    )
    :vars
    (
      ?auto_732410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732409 ?auto_732410 ) ( ON-TABLE ?auto_732405 ) ( ON ?auto_732406 ?auto_732405 ) ( not ( = ?auto_732405 ?auto_732406 ) ) ( not ( = ?auto_732405 ?auto_732407 ) ) ( not ( = ?auto_732405 ?auto_732408 ) ) ( not ( = ?auto_732405 ?auto_732409 ) ) ( not ( = ?auto_732405 ?auto_732410 ) ) ( not ( = ?auto_732406 ?auto_732407 ) ) ( not ( = ?auto_732406 ?auto_732408 ) ) ( not ( = ?auto_732406 ?auto_732409 ) ) ( not ( = ?auto_732406 ?auto_732410 ) ) ( not ( = ?auto_732407 ?auto_732408 ) ) ( not ( = ?auto_732407 ?auto_732409 ) ) ( not ( = ?auto_732407 ?auto_732410 ) ) ( not ( = ?auto_732408 ?auto_732409 ) ) ( not ( = ?auto_732408 ?auto_732410 ) ) ( not ( = ?auto_732409 ?auto_732410 ) ) ( ON ?auto_732408 ?auto_732409 ) ( CLEAR ?auto_732406 ) ( ON ?auto_732407 ?auto_732408 ) ( CLEAR ?auto_732407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_732405 ?auto_732406 ?auto_732407 )
      ( MAKE-5PILE ?auto_732405 ?auto_732406 ?auto_732407 ?auto_732408 ?auto_732409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_732427 - BLOCK
      ?auto_732428 - BLOCK
      ?auto_732429 - BLOCK
      ?auto_732430 - BLOCK
      ?auto_732431 - BLOCK
    )
    :vars
    (
      ?auto_732432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732431 ?auto_732432 ) ( ON-TABLE ?auto_732427 ) ( not ( = ?auto_732427 ?auto_732428 ) ) ( not ( = ?auto_732427 ?auto_732429 ) ) ( not ( = ?auto_732427 ?auto_732430 ) ) ( not ( = ?auto_732427 ?auto_732431 ) ) ( not ( = ?auto_732427 ?auto_732432 ) ) ( not ( = ?auto_732428 ?auto_732429 ) ) ( not ( = ?auto_732428 ?auto_732430 ) ) ( not ( = ?auto_732428 ?auto_732431 ) ) ( not ( = ?auto_732428 ?auto_732432 ) ) ( not ( = ?auto_732429 ?auto_732430 ) ) ( not ( = ?auto_732429 ?auto_732431 ) ) ( not ( = ?auto_732429 ?auto_732432 ) ) ( not ( = ?auto_732430 ?auto_732431 ) ) ( not ( = ?auto_732430 ?auto_732432 ) ) ( not ( = ?auto_732431 ?auto_732432 ) ) ( ON ?auto_732430 ?auto_732431 ) ( ON ?auto_732429 ?auto_732430 ) ( CLEAR ?auto_732427 ) ( ON ?auto_732428 ?auto_732429 ) ( CLEAR ?auto_732428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732427 ?auto_732428 )
      ( MAKE-5PILE ?auto_732427 ?auto_732428 ?auto_732429 ?auto_732430 ?auto_732431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_732449 - BLOCK
      ?auto_732450 - BLOCK
      ?auto_732451 - BLOCK
      ?auto_732452 - BLOCK
      ?auto_732453 - BLOCK
    )
    :vars
    (
      ?auto_732454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732453 ?auto_732454 ) ( not ( = ?auto_732449 ?auto_732450 ) ) ( not ( = ?auto_732449 ?auto_732451 ) ) ( not ( = ?auto_732449 ?auto_732452 ) ) ( not ( = ?auto_732449 ?auto_732453 ) ) ( not ( = ?auto_732449 ?auto_732454 ) ) ( not ( = ?auto_732450 ?auto_732451 ) ) ( not ( = ?auto_732450 ?auto_732452 ) ) ( not ( = ?auto_732450 ?auto_732453 ) ) ( not ( = ?auto_732450 ?auto_732454 ) ) ( not ( = ?auto_732451 ?auto_732452 ) ) ( not ( = ?auto_732451 ?auto_732453 ) ) ( not ( = ?auto_732451 ?auto_732454 ) ) ( not ( = ?auto_732452 ?auto_732453 ) ) ( not ( = ?auto_732452 ?auto_732454 ) ) ( not ( = ?auto_732453 ?auto_732454 ) ) ( ON ?auto_732452 ?auto_732453 ) ( ON ?auto_732451 ?auto_732452 ) ( ON ?auto_732450 ?auto_732451 ) ( ON ?auto_732449 ?auto_732450 ) ( CLEAR ?auto_732449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732449 )
      ( MAKE-5PILE ?auto_732449 ?auto_732450 ?auto_732451 ?auto_732452 ?auto_732453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_732472 - BLOCK
      ?auto_732473 - BLOCK
      ?auto_732474 - BLOCK
      ?auto_732475 - BLOCK
      ?auto_732476 - BLOCK
      ?auto_732477 - BLOCK
    )
    :vars
    (
      ?auto_732478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732476 ) ( ON ?auto_732477 ?auto_732478 ) ( CLEAR ?auto_732477 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732472 ) ( ON ?auto_732473 ?auto_732472 ) ( ON ?auto_732474 ?auto_732473 ) ( ON ?auto_732475 ?auto_732474 ) ( ON ?auto_732476 ?auto_732475 ) ( not ( = ?auto_732472 ?auto_732473 ) ) ( not ( = ?auto_732472 ?auto_732474 ) ) ( not ( = ?auto_732472 ?auto_732475 ) ) ( not ( = ?auto_732472 ?auto_732476 ) ) ( not ( = ?auto_732472 ?auto_732477 ) ) ( not ( = ?auto_732472 ?auto_732478 ) ) ( not ( = ?auto_732473 ?auto_732474 ) ) ( not ( = ?auto_732473 ?auto_732475 ) ) ( not ( = ?auto_732473 ?auto_732476 ) ) ( not ( = ?auto_732473 ?auto_732477 ) ) ( not ( = ?auto_732473 ?auto_732478 ) ) ( not ( = ?auto_732474 ?auto_732475 ) ) ( not ( = ?auto_732474 ?auto_732476 ) ) ( not ( = ?auto_732474 ?auto_732477 ) ) ( not ( = ?auto_732474 ?auto_732478 ) ) ( not ( = ?auto_732475 ?auto_732476 ) ) ( not ( = ?auto_732475 ?auto_732477 ) ) ( not ( = ?auto_732475 ?auto_732478 ) ) ( not ( = ?auto_732476 ?auto_732477 ) ) ( not ( = ?auto_732476 ?auto_732478 ) ) ( not ( = ?auto_732477 ?auto_732478 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732477 ?auto_732478 )
      ( !STACK ?auto_732477 ?auto_732476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_732498 - BLOCK
      ?auto_732499 - BLOCK
      ?auto_732500 - BLOCK
      ?auto_732501 - BLOCK
      ?auto_732502 - BLOCK
      ?auto_732503 - BLOCK
    )
    :vars
    (
      ?auto_732504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732503 ?auto_732504 ) ( ON-TABLE ?auto_732498 ) ( ON ?auto_732499 ?auto_732498 ) ( ON ?auto_732500 ?auto_732499 ) ( ON ?auto_732501 ?auto_732500 ) ( not ( = ?auto_732498 ?auto_732499 ) ) ( not ( = ?auto_732498 ?auto_732500 ) ) ( not ( = ?auto_732498 ?auto_732501 ) ) ( not ( = ?auto_732498 ?auto_732502 ) ) ( not ( = ?auto_732498 ?auto_732503 ) ) ( not ( = ?auto_732498 ?auto_732504 ) ) ( not ( = ?auto_732499 ?auto_732500 ) ) ( not ( = ?auto_732499 ?auto_732501 ) ) ( not ( = ?auto_732499 ?auto_732502 ) ) ( not ( = ?auto_732499 ?auto_732503 ) ) ( not ( = ?auto_732499 ?auto_732504 ) ) ( not ( = ?auto_732500 ?auto_732501 ) ) ( not ( = ?auto_732500 ?auto_732502 ) ) ( not ( = ?auto_732500 ?auto_732503 ) ) ( not ( = ?auto_732500 ?auto_732504 ) ) ( not ( = ?auto_732501 ?auto_732502 ) ) ( not ( = ?auto_732501 ?auto_732503 ) ) ( not ( = ?auto_732501 ?auto_732504 ) ) ( not ( = ?auto_732502 ?auto_732503 ) ) ( not ( = ?auto_732502 ?auto_732504 ) ) ( not ( = ?auto_732503 ?auto_732504 ) ) ( CLEAR ?auto_732501 ) ( ON ?auto_732502 ?auto_732503 ) ( CLEAR ?auto_732502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_732498 ?auto_732499 ?auto_732500 ?auto_732501 ?auto_732502 )
      ( MAKE-6PILE ?auto_732498 ?auto_732499 ?auto_732500 ?auto_732501 ?auto_732502 ?auto_732503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_732524 - BLOCK
      ?auto_732525 - BLOCK
      ?auto_732526 - BLOCK
      ?auto_732527 - BLOCK
      ?auto_732528 - BLOCK
      ?auto_732529 - BLOCK
    )
    :vars
    (
      ?auto_732530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732529 ?auto_732530 ) ( ON-TABLE ?auto_732524 ) ( ON ?auto_732525 ?auto_732524 ) ( ON ?auto_732526 ?auto_732525 ) ( not ( = ?auto_732524 ?auto_732525 ) ) ( not ( = ?auto_732524 ?auto_732526 ) ) ( not ( = ?auto_732524 ?auto_732527 ) ) ( not ( = ?auto_732524 ?auto_732528 ) ) ( not ( = ?auto_732524 ?auto_732529 ) ) ( not ( = ?auto_732524 ?auto_732530 ) ) ( not ( = ?auto_732525 ?auto_732526 ) ) ( not ( = ?auto_732525 ?auto_732527 ) ) ( not ( = ?auto_732525 ?auto_732528 ) ) ( not ( = ?auto_732525 ?auto_732529 ) ) ( not ( = ?auto_732525 ?auto_732530 ) ) ( not ( = ?auto_732526 ?auto_732527 ) ) ( not ( = ?auto_732526 ?auto_732528 ) ) ( not ( = ?auto_732526 ?auto_732529 ) ) ( not ( = ?auto_732526 ?auto_732530 ) ) ( not ( = ?auto_732527 ?auto_732528 ) ) ( not ( = ?auto_732527 ?auto_732529 ) ) ( not ( = ?auto_732527 ?auto_732530 ) ) ( not ( = ?auto_732528 ?auto_732529 ) ) ( not ( = ?auto_732528 ?auto_732530 ) ) ( not ( = ?auto_732529 ?auto_732530 ) ) ( ON ?auto_732528 ?auto_732529 ) ( CLEAR ?auto_732526 ) ( ON ?auto_732527 ?auto_732528 ) ( CLEAR ?auto_732527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_732524 ?auto_732525 ?auto_732526 ?auto_732527 )
      ( MAKE-6PILE ?auto_732524 ?auto_732525 ?auto_732526 ?auto_732527 ?auto_732528 ?auto_732529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_732550 - BLOCK
      ?auto_732551 - BLOCK
      ?auto_732552 - BLOCK
      ?auto_732553 - BLOCK
      ?auto_732554 - BLOCK
      ?auto_732555 - BLOCK
    )
    :vars
    (
      ?auto_732556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732555 ?auto_732556 ) ( ON-TABLE ?auto_732550 ) ( ON ?auto_732551 ?auto_732550 ) ( not ( = ?auto_732550 ?auto_732551 ) ) ( not ( = ?auto_732550 ?auto_732552 ) ) ( not ( = ?auto_732550 ?auto_732553 ) ) ( not ( = ?auto_732550 ?auto_732554 ) ) ( not ( = ?auto_732550 ?auto_732555 ) ) ( not ( = ?auto_732550 ?auto_732556 ) ) ( not ( = ?auto_732551 ?auto_732552 ) ) ( not ( = ?auto_732551 ?auto_732553 ) ) ( not ( = ?auto_732551 ?auto_732554 ) ) ( not ( = ?auto_732551 ?auto_732555 ) ) ( not ( = ?auto_732551 ?auto_732556 ) ) ( not ( = ?auto_732552 ?auto_732553 ) ) ( not ( = ?auto_732552 ?auto_732554 ) ) ( not ( = ?auto_732552 ?auto_732555 ) ) ( not ( = ?auto_732552 ?auto_732556 ) ) ( not ( = ?auto_732553 ?auto_732554 ) ) ( not ( = ?auto_732553 ?auto_732555 ) ) ( not ( = ?auto_732553 ?auto_732556 ) ) ( not ( = ?auto_732554 ?auto_732555 ) ) ( not ( = ?auto_732554 ?auto_732556 ) ) ( not ( = ?auto_732555 ?auto_732556 ) ) ( ON ?auto_732554 ?auto_732555 ) ( ON ?auto_732553 ?auto_732554 ) ( CLEAR ?auto_732551 ) ( ON ?auto_732552 ?auto_732553 ) ( CLEAR ?auto_732552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_732550 ?auto_732551 ?auto_732552 )
      ( MAKE-6PILE ?auto_732550 ?auto_732551 ?auto_732552 ?auto_732553 ?auto_732554 ?auto_732555 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_732576 - BLOCK
      ?auto_732577 - BLOCK
      ?auto_732578 - BLOCK
      ?auto_732579 - BLOCK
      ?auto_732580 - BLOCK
      ?auto_732581 - BLOCK
    )
    :vars
    (
      ?auto_732582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732581 ?auto_732582 ) ( ON-TABLE ?auto_732576 ) ( not ( = ?auto_732576 ?auto_732577 ) ) ( not ( = ?auto_732576 ?auto_732578 ) ) ( not ( = ?auto_732576 ?auto_732579 ) ) ( not ( = ?auto_732576 ?auto_732580 ) ) ( not ( = ?auto_732576 ?auto_732581 ) ) ( not ( = ?auto_732576 ?auto_732582 ) ) ( not ( = ?auto_732577 ?auto_732578 ) ) ( not ( = ?auto_732577 ?auto_732579 ) ) ( not ( = ?auto_732577 ?auto_732580 ) ) ( not ( = ?auto_732577 ?auto_732581 ) ) ( not ( = ?auto_732577 ?auto_732582 ) ) ( not ( = ?auto_732578 ?auto_732579 ) ) ( not ( = ?auto_732578 ?auto_732580 ) ) ( not ( = ?auto_732578 ?auto_732581 ) ) ( not ( = ?auto_732578 ?auto_732582 ) ) ( not ( = ?auto_732579 ?auto_732580 ) ) ( not ( = ?auto_732579 ?auto_732581 ) ) ( not ( = ?auto_732579 ?auto_732582 ) ) ( not ( = ?auto_732580 ?auto_732581 ) ) ( not ( = ?auto_732580 ?auto_732582 ) ) ( not ( = ?auto_732581 ?auto_732582 ) ) ( ON ?auto_732580 ?auto_732581 ) ( ON ?auto_732579 ?auto_732580 ) ( ON ?auto_732578 ?auto_732579 ) ( CLEAR ?auto_732576 ) ( ON ?auto_732577 ?auto_732578 ) ( CLEAR ?auto_732577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732576 ?auto_732577 )
      ( MAKE-6PILE ?auto_732576 ?auto_732577 ?auto_732578 ?auto_732579 ?auto_732580 ?auto_732581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_732602 - BLOCK
      ?auto_732603 - BLOCK
      ?auto_732604 - BLOCK
      ?auto_732605 - BLOCK
      ?auto_732606 - BLOCK
      ?auto_732607 - BLOCK
    )
    :vars
    (
      ?auto_732608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732607 ?auto_732608 ) ( not ( = ?auto_732602 ?auto_732603 ) ) ( not ( = ?auto_732602 ?auto_732604 ) ) ( not ( = ?auto_732602 ?auto_732605 ) ) ( not ( = ?auto_732602 ?auto_732606 ) ) ( not ( = ?auto_732602 ?auto_732607 ) ) ( not ( = ?auto_732602 ?auto_732608 ) ) ( not ( = ?auto_732603 ?auto_732604 ) ) ( not ( = ?auto_732603 ?auto_732605 ) ) ( not ( = ?auto_732603 ?auto_732606 ) ) ( not ( = ?auto_732603 ?auto_732607 ) ) ( not ( = ?auto_732603 ?auto_732608 ) ) ( not ( = ?auto_732604 ?auto_732605 ) ) ( not ( = ?auto_732604 ?auto_732606 ) ) ( not ( = ?auto_732604 ?auto_732607 ) ) ( not ( = ?auto_732604 ?auto_732608 ) ) ( not ( = ?auto_732605 ?auto_732606 ) ) ( not ( = ?auto_732605 ?auto_732607 ) ) ( not ( = ?auto_732605 ?auto_732608 ) ) ( not ( = ?auto_732606 ?auto_732607 ) ) ( not ( = ?auto_732606 ?auto_732608 ) ) ( not ( = ?auto_732607 ?auto_732608 ) ) ( ON ?auto_732606 ?auto_732607 ) ( ON ?auto_732605 ?auto_732606 ) ( ON ?auto_732604 ?auto_732605 ) ( ON ?auto_732603 ?auto_732604 ) ( ON ?auto_732602 ?auto_732603 ) ( CLEAR ?auto_732602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732602 )
      ( MAKE-6PILE ?auto_732602 ?auto_732603 ?auto_732604 ?auto_732605 ?auto_732606 ?auto_732607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732629 - BLOCK
      ?auto_732630 - BLOCK
      ?auto_732631 - BLOCK
      ?auto_732632 - BLOCK
      ?auto_732633 - BLOCK
      ?auto_732634 - BLOCK
      ?auto_732635 - BLOCK
    )
    :vars
    (
      ?auto_732636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732634 ) ( ON ?auto_732635 ?auto_732636 ) ( CLEAR ?auto_732635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732629 ) ( ON ?auto_732630 ?auto_732629 ) ( ON ?auto_732631 ?auto_732630 ) ( ON ?auto_732632 ?auto_732631 ) ( ON ?auto_732633 ?auto_732632 ) ( ON ?auto_732634 ?auto_732633 ) ( not ( = ?auto_732629 ?auto_732630 ) ) ( not ( = ?auto_732629 ?auto_732631 ) ) ( not ( = ?auto_732629 ?auto_732632 ) ) ( not ( = ?auto_732629 ?auto_732633 ) ) ( not ( = ?auto_732629 ?auto_732634 ) ) ( not ( = ?auto_732629 ?auto_732635 ) ) ( not ( = ?auto_732629 ?auto_732636 ) ) ( not ( = ?auto_732630 ?auto_732631 ) ) ( not ( = ?auto_732630 ?auto_732632 ) ) ( not ( = ?auto_732630 ?auto_732633 ) ) ( not ( = ?auto_732630 ?auto_732634 ) ) ( not ( = ?auto_732630 ?auto_732635 ) ) ( not ( = ?auto_732630 ?auto_732636 ) ) ( not ( = ?auto_732631 ?auto_732632 ) ) ( not ( = ?auto_732631 ?auto_732633 ) ) ( not ( = ?auto_732631 ?auto_732634 ) ) ( not ( = ?auto_732631 ?auto_732635 ) ) ( not ( = ?auto_732631 ?auto_732636 ) ) ( not ( = ?auto_732632 ?auto_732633 ) ) ( not ( = ?auto_732632 ?auto_732634 ) ) ( not ( = ?auto_732632 ?auto_732635 ) ) ( not ( = ?auto_732632 ?auto_732636 ) ) ( not ( = ?auto_732633 ?auto_732634 ) ) ( not ( = ?auto_732633 ?auto_732635 ) ) ( not ( = ?auto_732633 ?auto_732636 ) ) ( not ( = ?auto_732634 ?auto_732635 ) ) ( not ( = ?auto_732634 ?auto_732636 ) ) ( not ( = ?auto_732635 ?auto_732636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732635 ?auto_732636 )
      ( !STACK ?auto_732635 ?auto_732634 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732659 - BLOCK
      ?auto_732660 - BLOCK
      ?auto_732661 - BLOCK
      ?auto_732662 - BLOCK
      ?auto_732663 - BLOCK
      ?auto_732664 - BLOCK
      ?auto_732665 - BLOCK
    )
    :vars
    (
      ?auto_732666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732665 ?auto_732666 ) ( ON-TABLE ?auto_732659 ) ( ON ?auto_732660 ?auto_732659 ) ( ON ?auto_732661 ?auto_732660 ) ( ON ?auto_732662 ?auto_732661 ) ( ON ?auto_732663 ?auto_732662 ) ( not ( = ?auto_732659 ?auto_732660 ) ) ( not ( = ?auto_732659 ?auto_732661 ) ) ( not ( = ?auto_732659 ?auto_732662 ) ) ( not ( = ?auto_732659 ?auto_732663 ) ) ( not ( = ?auto_732659 ?auto_732664 ) ) ( not ( = ?auto_732659 ?auto_732665 ) ) ( not ( = ?auto_732659 ?auto_732666 ) ) ( not ( = ?auto_732660 ?auto_732661 ) ) ( not ( = ?auto_732660 ?auto_732662 ) ) ( not ( = ?auto_732660 ?auto_732663 ) ) ( not ( = ?auto_732660 ?auto_732664 ) ) ( not ( = ?auto_732660 ?auto_732665 ) ) ( not ( = ?auto_732660 ?auto_732666 ) ) ( not ( = ?auto_732661 ?auto_732662 ) ) ( not ( = ?auto_732661 ?auto_732663 ) ) ( not ( = ?auto_732661 ?auto_732664 ) ) ( not ( = ?auto_732661 ?auto_732665 ) ) ( not ( = ?auto_732661 ?auto_732666 ) ) ( not ( = ?auto_732662 ?auto_732663 ) ) ( not ( = ?auto_732662 ?auto_732664 ) ) ( not ( = ?auto_732662 ?auto_732665 ) ) ( not ( = ?auto_732662 ?auto_732666 ) ) ( not ( = ?auto_732663 ?auto_732664 ) ) ( not ( = ?auto_732663 ?auto_732665 ) ) ( not ( = ?auto_732663 ?auto_732666 ) ) ( not ( = ?auto_732664 ?auto_732665 ) ) ( not ( = ?auto_732664 ?auto_732666 ) ) ( not ( = ?auto_732665 ?auto_732666 ) ) ( CLEAR ?auto_732663 ) ( ON ?auto_732664 ?auto_732665 ) ( CLEAR ?auto_732664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_732659 ?auto_732660 ?auto_732661 ?auto_732662 ?auto_732663 ?auto_732664 )
      ( MAKE-7PILE ?auto_732659 ?auto_732660 ?auto_732661 ?auto_732662 ?auto_732663 ?auto_732664 ?auto_732665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732689 - BLOCK
      ?auto_732690 - BLOCK
      ?auto_732691 - BLOCK
      ?auto_732692 - BLOCK
      ?auto_732693 - BLOCK
      ?auto_732694 - BLOCK
      ?auto_732695 - BLOCK
    )
    :vars
    (
      ?auto_732696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732695 ?auto_732696 ) ( ON-TABLE ?auto_732689 ) ( ON ?auto_732690 ?auto_732689 ) ( ON ?auto_732691 ?auto_732690 ) ( ON ?auto_732692 ?auto_732691 ) ( not ( = ?auto_732689 ?auto_732690 ) ) ( not ( = ?auto_732689 ?auto_732691 ) ) ( not ( = ?auto_732689 ?auto_732692 ) ) ( not ( = ?auto_732689 ?auto_732693 ) ) ( not ( = ?auto_732689 ?auto_732694 ) ) ( not ( = ?auto_732689 ?auto_732695 ) ) ( not ( = ?auto_732689 ?auto_732696 ) ) ( not ( = ?auto_732690 ?auto_732691 ) ) ( not ( = ?auto_732690 ?auto_732692 ) ) ( not ( = ?auto_732690 ?auto_732693 ) ) ( not ( = ?auto_732690 ?auto_732694 ) ) ( not ( = ?auto_732690 ?auto_732695 ) ) ( not ( = ?auto_732690 ?auto_732696 ) ) ( not ( = ?auto_732691 ?auto_732692 ) ) ( not ( = ?auto_732691 ?auto_732693 ) ) ( not ( = ?auto_732691 ?auto_732694 ) ) ( not ( = ?auto_732691 ?auto_732695 ) ) ( not ( = ?auto_732691 ?auto_732696 ) ) ( not ( = ?auto_732692 ?auto_732693 ) ) ( not ( = ?auto_732692 ?auto_732694 ) ) ( not ( = ?auto_732692 ?auto_732695 ) ) ( not ( = ?auto_732692 ?auto_732696 ) ) ( not ( = ?auto_732693 ?auto_732694 ) ) ( not ( = ?auto_732693 ?auto_732695 ) ) ( not ( = ?auto_732693 ?auto_732696 ) ) ( not ( = ?auto_732694 ?auto_732695 ) ) ( not ( = ?auto_732694 ?auto_732696 ) ) ( not ( = ?auto_732695 ?auto_732696 ) ) ( ON ?auto_732694 ?auto_732695 ) ( CLEAR ?auto_732692 ) ( ON ?auto_732693 ?auto_732694 ) ( CLEAR ?auto_732693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_732689 ?auto_732690 ?auto_732691 ?auto_732692 ?auto_732693 )
      ( MAKE-7PILE ?auto_732689 ?auto_732690 ?auto_732691 ?auto_732692 ?auto_732693 ?auto_732694 ?auto_732695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732719 - BLOCK
      ?auto_732720 - BLOCK
      ?auto_732721 - BLOCK
      ?auto_732722 - BLOCK
      ?auto_732723 - BLOCK
      ?auto_732724 - BLOCK
      ?auto_732725 - BLOCK
    )
    :vars
    (
      ?auto_732726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732725 ?auto_732726 ) ( ON-TABLE ?auto_732719 ) ( ON ?auto_732720 ?auto_732719 ) ( ON ?auto_732721 ?auto_732720 ) ( not ( = ?auto_732719 ?auto_732720 ) ) ( not ( = ?auto_732719 ?auto_732721 ) ) ( not ( = ?auto_732719 ?auto_732722 ) ) ( not ( = ?auto_732719 ?auto_732723 ) ) ( not ( = ?auto_732719 ?auto_732724 ) ) ( not ( = ?auto_732719 ?auto_732725 ) ) ( not ( = ?auto_732719 ?auto_732726 ) ) ( not ( = ?auto_732720 ?auto_732721 ) ) ( not ( = ?auto_732720 ?auto_732722 ) ) ( not ( = ?auto_732720 ?auto_732723 ) ) ( not ( = ?auto_732720 ?auto_732724 ) ) ( not ( = ?auto_732720 ?auto_732725 ) ) ( not ( = ?auto_732720 ?auto_732726 ) ) ( not ( = ?auto_732721 ?auto_732722 ) ) ( not ( = ?auto_732721 ?auto_732723 ) ) ( not ( = ?auto_732721 ?auto_732724 ) ) ( not ( = ?auto_732721 ?auto_732725 ) ) ( not ( = ?auto_732721 ?auto_732726 ) ) ( not ( = ?auto_732722 ?auto_732723 ) ) ( not ( = ?auto_732722 ?auto_732724 ) ) ( not ( = ?auto_732722 ?auto_732725 ) ) ( not ( = ?auto_732722 ?auto_732726 ) ) ( not ( = ?auto_732723 ?auto_732724 ) ) ( not ( = ?auto_732723 ?auto_732725 ) ) ( not ( = ?auto_732723 ?auto_732726 ) ) ( not ( = ?auto_732724 ?auto_732725 ) ) ( not ( = ?auto_732724 ?auto_732726 ) ) ( not ( = ?auto_732725 ?auto_732726 ) ) ( ON ?auto_732724 ?auto_732725 ) ( ON ?auto_732723 ?auto_732724 ) ( CLEAR ?auto_732721 ) ( ON ?auto_732722 ?auto_732723 ) ( CLEAR ?auto_732722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_732719 ?auto_732720 ?auto_732721 ?auto_732722 )
      ( MAKE-7PILE ?auto_732719 ?auto_732720 ?auto_732721 ?auto_732722 ?auto_732723 ?auto_732724 ?auto_732725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732749 - BLOCK
      ?auto_732750 - BLOCK
      ?auto_732751 - BLOCK
      ?auto_732752 - BLOCK
      ?auto_732753 - BLOCK
      ?auto_732754 - BLOCK
      ?auto_732755 - BLOCK
    )
    :vars
    (
      ?auto_732756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732755 ?auto_732756 ) ( ON-TABLE ?auto_732749 ) ( ON ?auto_732750 ?auto_732749 ) ( not ( = ?auto_732749 ?auto_732750 ) ) ( not ( = ?auto_732749 ?auto_732751 ) ) ( not ( = ?auto_732749 ?auto_732752 ) ) ( not ( = ?auto_732749 ?auto_732753 ) ) ( not ( = ?auto_732749 ?auto_732754 ) ) ( not ( = ?auto_732749 ?auto_732755 ) ) ( not ( = ?auto_732749 ?auto_732756 ) ) ( not ( = ?auto_732750 ?auto_732751 ) ) ( not ( = ?auto_732750 ?auto_732752 ) ) ( not ( = ?auto_732750 ?auto_732753 ) ) ( not ( = ?auto_732750 ?auto_732754 ) ) ( not ( = ?auto_732750 ?auto_732755 ) ) ( not ( = ?auto_732750 ?auto_732756 ) ) ( not ( = ?auto_732751 ?auto_732752 ) ) ( not ( = ?auto_732751 ?auto_732753 ) ) ( not ( = ?auto_732751 ?auto_732754 ) ) ( not ( = ?auto_732751 ?auto_732755 ) ) ( not ( = ?auto_732751 ?auto_732756 ) ) ( not ( = ?auto_732752 ?auto_732753 ) ) ( not ( = ?auto_732752 ?auto_732754 ) ) ( not ( = ?auto_732752 ?auto_732755 ) ) ( not ( = ?auto_732752 ?auto_732756 ) ) ( not ( = ?auto_732753 ?auto_732754 ) ) ( not ( = ?auto_732753 ?auto_732755 ) ) ( not ( = ?auto_732753 ?auto_732756 ) ) ( not ( = ?auto_732754 ?auto_732755 ) ) ( not ( = ?auto_732754 ?auto_732756 ) ) ( not ( = ?auto_732755 ?auto_732756 ) ) ( ON ?auto_732754 ?auto_732755 ) ( ON ?auto_732753 ?auto_732754 ) ( ON ?auto_732752 ?auto_732753 ) ( CLEAR ?auto_732750 ) ( ON ?auto_732751 ?auto_732752 ) ( CLEAR ?auto_732751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_732749 ?auto_732750 ?auto_732751 )
      ( MAKE-7PILE ?auto_732749 ?auto_732750 ?auto_732751 ?auto_732752 ?auto_732753 ?auto_732754 ?auto_732755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732779 - BLOCK
      ?auto_732780 - BLOCK
      ?auto_732781 - BLOCK
      ?auto_732782 - BLOCK
      ?auto_732783 - BLOCK
      ?auto_732784 - BLOCK
      ?auto_732785 - BLOCK
    )
    :vars
    (
      ?auto_732786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732785 ?auto_732786 ) ( ON-TABLE ?auto_732779 ) ( not ( = ?auto_732779 ?auto_732780 ) ) ( not ( = ?auto_732779 ?auto_732781 ) ) ( not ( = ?auto_732779 ?auto_732782 ) ) ( not ( = ?auto_732779 ?auto_732783 ) ) ( not ( = ?auto_732779 ?auto_732784 ) ) ( not ( = ?auto_732779 ?auto_732785 ) ) ( not ( = ?auto_732779 ?auto_732786 ) ) ( not ( = ?auto_732780 ?auto_732781 ) ) ( not ( = ?auto_732780 ?auto_732782 ) ) ( not ( = ?auto_732780 ?auto_732783 ) ) ( not ( = ?auto_732780 ?auto_732784 ) ) ( not ( = ?auto_732780 ?auto_732785 ) ) ( not ( = ?auto_732780 ?auto_732786 ) ) ( not ( = ?auto_732781 ?auto_732782 ) ) ( not ( = ?auto_732781 ?auto_732783 ) ) ( not ( = ?auto_732781 ?auto_732784 ) ) ( not ( = ?auto_732781 ?auto_732785 ) ) ( not ( = ?auto_732781 ?auto_732786 ) ) ( not ( = ?auto_732782 ?auto_732783 ) ) ( not ( = ?auto_732782 ?auto_732784 ) ) ( not ( = ?auto_732782 ?auto_732785 ) ) ( not ( = ?auto_732782 ?auto_732786 ) ) ( not ( = ?auto_732783 ?auto_732784 ) ) ( not ( = ?auto_732783 ?auto_732785 ) ) ( not ( = ?auto_732783 ?auto_732786 ) ) ( not ( = ?auto_732784 ?auto_732785 ) ) ( not ( = ?auto_732784 ?auto_732786 ) ) ( not ( = ?auto_732785 ?auto_732786 ) ) ( ON ?auto_732784 ?auto_732785 ) ( ON ?auto_732783 ?auto_732784 ) ( ON ?auto_732782 ?auto_732783 ) ( ON ?auto_732781 ?auto_732782 ) ( CLEAR ?auto_732779 ) ( ON ?auto_732780 ?auto_732781 ) ( CLEAR ?auto_732780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732779 ?auto_732780 )
      ( MAKE-7PILE ?auto_732779 ?auto_732780 ?auto_732781 ?auto_732782 ?auto_732783 ?auto_732784 ?auto_732785 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_732809 - BLOCK
      ?auto_732810 - BLOCK
      ?auto_732811 - BLOCK
      ?auto_732812 - BLOCK
      ?auto_732813 - BLOCK
      ?auto_732814 - BLOCK
      ?auto_732815 - BLOCK
    )
    :vars
    (
      ?auto_732816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732815 ?auto_732816 ) ( not ( = ?auto_732809 ?auto_732810 ) ) ( not ( = ?auto_732809 ?auto_732811 ) ) ( not ( = ?auto_732809 ?auto_732812 ) ) ( not ( = ?auto_732809 ?auto_732813 ) ) ( not ( = ?auto_732809 ?auto_732814 ) ) ( not ( = ?auto_732809 ?auto_732815 ) ) ( not ( = ?auto_732809 ?auto_732816 ) ) ( not ( = ?auto_732810 ?auto_732811 ) ) ( not ( = ?auto_732810 ?auto_732812 ) ) ( not ( = ?auto_732810 ?auto_732813 ) ) ( not ( = ?auto_732810 ?auto_732814 ) ) ( not ( = ?auto_732810 ?auto_732815 ) ) ( not ( = ?auto_732810 ?auto_732816 ) ) ( not ( = ?auto_732811 ?auto_732812 ) ) ( not ( = ?auto_732811 ?auto_732813 ) ) ( not ( = ?auto_732811 ?auto_732814 ) ) ( not ( = ?auto_732811 ?auto_732815 ) ) ( not ( = ?auto_732811 ?auto_732816 ) ) ( not ( = ?auto_732812 ?auto_732813 ) ) ( not ( = ?auto_732812 ?auto_732814 ) ) ( not ( = ?auto_732812 ?auto_732815 ) ) ( not ( = ?auto_732812 ?auto_732816 ) ) ( not ( = ?auto_732813 ?auto_732814 ) ) ( not ( = ?auto_732813 ?auto_732815 ) ) ( not ( = ?auto_732813 ?auto_732816 ) ) ( not ( = ?auto_732814 ?auto_732815 ) ) ( not ( = ?auto_732814 ?auto_732816 ) ) ( not ( = ?auto_732815 ?auto_732816 ) ) ( ON ?auto_732814 ?auto_732815 ) ( ON ?auto_732813 ?auto_732814 ) ( ON ?auto_732812 ?auto_732813 ) ( ON ?auto_732811 ?auto_732812 ) ( ON ?auto_732810 ?auto_732811 ) ( ON ?auto_732809 ?auto_732810 ) ( CLEAR ?auto_732809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732809 )
      ( MAKE-7PILE ?auto_732809 ?auto_732810 ?auto_732811 ?auto_732812 ?auto_732813 ?auto_732814 ?auto_732815 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_732840 - BLOCK
      ?auto_732841 - BLOCK
      ?auto_732842 - BLOCK
      ?auto_732843 - BLOCK
      ?auto_732844 - BLOCK
      ?auto_732845 - BLOCK
      ?auto_732846 - BLOCK
      ?auto_732847 - BLOCK
    )
    :vars
    (
      ?auto_732848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732846 ) ( ON ?auto_732847 ?auto_732848 ) ( CLEAR ?auto_732847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732840 ) ( ON ?auto_732841 ?auto_732840 ) ( ON ?auto_732842 ?auto_732841 ) ( ON ?auto_732843 ?auto_732842 ) ( ON ?auto_732844 ?auto_732843 ) ( ON ?auto_732845 ?auto_732844 ) ( ON ?auto_732846 ?auto_732845 ) ( not ( = ?auto_732840 ?auto_732841 ) ) ( not ( = ?auto_732840 ?auto_732842 ) ) ( not ( = ?auto_732840 ?auto_732843 ) ) ( not ( = ?auto_732840 ?auto_732844 ) ) ( not ( = ?auto_732840 ?auto_732845 ) ) ( not ( = ?auto_732840 ?auto_732846 ) ) ( not ( = ?auto_732840 ?auto_732847 ) ) ( not ( = ?auto_732840 ?auto_732848 ) ) ( not ( = ?auto_732841 ?auto_732842 ) ) ( not ( = ?auto_732841 ?auto_732843 ) ) ( not ( = ?auto_732841 ?auto_732844 ) ) ( not ( = ?auto_732841 ?auto_732845 ) ) ( not ( = ?auto_732841 ?auto_732846 ) ) ( not ( = ?auto_732841 ?auto_732847 ) ) ( not ( = ?auto_732841 ?auto_732848 ) ) ( not ( = ?auto_732842 ?auto_732843 ) ) ( not ( = ?auto_732842 ?auto_732844 ) ) ( not ( = ?auto_732842 ?auto_732845 ) ) ( not ( = ?auto_732842 ?auto_732846 ) ) ( not ( = ?auto_732842 ?auto_732847 ) ) ( not ( = ?auto_732842 ?auto_732848 ) ) ( not ( = ?auto_732843 ?auto_732844 ) ) ( not ( = ?auto_732843 ?auto_732845 ) ) ( not ( = ?auto_732843 ?auto_732846 ) ) ( not ( = ?auto_732843 ?auto_732847 ) ) ( not ( = ?auto_732843 ?auto_732848 ) ) ( not ( = ?auto_732844 ?auto_732845 ) ) ( not ( = ?auto_732844 ?auto_732846 ) ) ( not ( = ?auto_732844 ?auto_732847 ) ) ( not ( = ?auto_732844 ?auto_732848 ) ) ( not ( = ?auto_732845 ?auto_732846 ) ) ( not ( = ?auto_732845 ?auto_732847 ) ) ( not ( = ?auto_732845 ?auto_732848 ) ) ( not ( = ?auto_732846 ?auto_732847 ) ) ( not ( = ?auto_732846 ?auto_732848 ) ) ( not ( = ?auto_732847 ?auto_732848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_732847 ?auto_732848 )
      ( !STACK ?auto_732847 ?auto_732846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_732874 - BLOCK
      ?auto_732875 - BLOCK
      ?auto_732876 - BLOCK
      ?auto_732877 - BLOCK
      ?auto_732878 - BLOCK
      ?auto_732879 - BLOCK
      ?auto_732880 - BLOCK
      ?auto_732881 - BLOCK
    )
    :vars
    (
      ?auto_732882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732881 ?auto_732882 ) ( ON-TABLE ?auto_732874 ) ( ON ?auto_732875 ?auto_732874 ) ( ON ?auto_732876 ?auto_732875 ) ( ON ?auto_732877 ?auto_732876 ) ( ON ?auto_732878 ?auto_732877 ) ( ON ?auto_732879 ?auto_732878 ) ( not ( = ?auto_732874 ?auto_732875 ) ) ( not ( = ?auto_732874 ?auto_732876 ) ) ( not ( = ?auto_732874 ?auto_732877 ) ) ( not ( = ?auto_732874 ?auto_732878 ) ) ( not ( = ?auto_732874 ?auto_732879 ) ) ( not ( = ?auto_732874 ?auto_732880 ) ) ( not ( = ?auto_732874 ?auto_732881 ) ) ( not ( = ?auto_732874 ?auto_732882 ) ) ( not ( = ?auto_732875 ?auto_732876 ) ) ( not ( = ?auto_732875 ?auto_732877 ) ) ( not ( = ?auto_732875 ?auto_732878 ) ) ( not ( = ?auto_732875 ?auto_732879 ) ) ( not ( = ?auto_732875 ?auto_732880 ) ) ( not ( = ?auto_732875 ?auto_732881 ) ) ( not ( = ?auto_732875 ?auto_732882 ) ) ( not ( = ?auto_732876 ?auto_732877 ) ) ( not ( = ?auto_732876 ?auto_732878 ) ) ( not ( = ?auto_732876 ?auto_732879 ) ) ( not ( = ?auto_732876 ?auto_732880 ) ) ( not ( = ?auto_732876 ?auto_732881 ) ) ( not ( = ?auto_732876 ?auto_732882 ) ) ( not ( = ?auto_732877 ?auto_732878 ) ) ( not ( = ?auto_732877 ?auto_732879 ) ) ( not ( = ?auto_732877 ?auto_732880 ) ) ( not ( = ?auto_732877 ?auto_732881 ) ) ( not ( = ?auto_732877 ?auto_732882 ) ) ( not ( = ?auto_732878 ?auto_732879 ) ) ( not ( = ?auto_732878 ?auto_732880 ) ) ( not ( = ?auto_732878 ?auto_732881 ) ) ( not ( = ?auto_732878 ?auto_732882 ) ) ( not ( = ?auto_732879 ?auto_732880 ) ) ( not ( = ?auto_732879 ?auto_732881 ) ) ( not ( = ?auto_732879 ?auto_732882 ) ) ( not ( = ?auto_732880 ?auto_732881 ) ) ( not ( = ?auto_732880 ?auto_732882 ) ) ( not ( = ?auto_732881 ?auto_732882 ) ) ( CLEAR ?auto_732879 ) ( ON ?auto_732880 ?auto_732881 ) ( CLEAR ?auto_732880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_732874 ?auto_732875 ?auto_732876 ?auto_732877 ?auto_732878 ?auto_732879 ?auto_732880 )
      ( MAKE-8PILE ?auto_732874 ?auto_732875 ?auto_732876 ?auto_732877 ?auto_732878 ?auto_732879 ?auto_732880 ?auto_732881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_732908 - BLOCK
      ?auto_732909 - BLOCK
      ?auto_732910 - BLOCK
      ?auto_732911 - BLOCK
      ?auto_732912 - BLOCK
      ?auto_732913 - BLOCK
      ?auto_732914 - BLOCK
      ?auto_732915 - BLOCK
    )
    :vars
    (
      ?auto_732916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732915 ?auto_732916 ) ( ON-TABLE ?auto_732908 ) ( ON ?auto_732909 ?auto_732908 ) ( ON ?auto_732910 ?auto_732909 ) ( ON ?auto_732911 ?auto_732910 ) ( ON ?auto_732912 ?auto_732911 ) ( not ( = ?auto_732908 ?auto_732909 ) ) ( not ( = ?auto_732908 ?auto_732910 ) ) ( not ( = ?auto_732908 ?auto_732911 ) ) ( not ( = ?auto_732908 ?auto_732912 ) ) ( not ( = ?auto_732908 ?auto_732913 ) ) ( not ( = ?auto_732908 ?auto_732914 ) ) ( not ( = ?auto_732908 ?auto_732915 ) ) ( not ( = ?auto_732908 ?auto_732916 ) ) ( not ( = ?auto_732909 ?auto_732910 ) ) ( not ( = ?auto_732909 ?auto_732911 ) ) ( not ( = ?auto_732909 ?auto_732912 ) ) ( not ( = ?auto_732909 ?auto_732913 ) ) ( not ( = ?auto_732909 ?auto_732914 ) ) ( not ( = ?auto_732909 ?auto_732915 ) ) ( not ( = ?auto_732909 ?auto_732916 ) ) ( not ( = ?auto_732910 ?auto_732911 ) ) ( not ( = ?auto_732910 ?auto_732912 ) ) ( not ( = ?auto_732910 ?auto_732913 ) ) ( not ( = ?auto_732910 ?auto_732914 ) ) ( not ( = ?auto_732910 ?auto_732915 ) ) ( not ( = ?auto_732910 ?auto_732916 ) ) ( not ( = ?auto_732911 ?auto_732912 ) ) ( not ( = ?auto_732911 ?auto_732913 ) ) ( not ( = ?auto_732911 ?auto_732914 ) ) ( not ( = ?auto_732911 ?auto_732915 ) ) ( not ( = ?auto_732911 ?auto_732916 ) ) ( not ( = ?auto_732912 ?auto_732913 ) ) ( not ( = ?auto_732912 ?auto_732914 ) ) ( not ( = ?auto_732912 ?auto_732915 ) ) ( not ( = ?auto_732912 ?auto_732916 ) ) ( not ( = ?auto_732913 ?auto_732914 ) ) ( not ( = ?auto_732913 ?auto_732915 ) ) ( not ( = ?auto_732913 ?auto_732916 ) ) ( not ( = ?auto_732914 ?auto_732915 ) ) ( not ( = ?auto_732914 ?auto_732916 ) ) ( not ( = ?auto_732915 ?auto_732916 ) ) ( ON ?auto_732914 ?auto_732915 ) ( CLEAR ?auto_732912 ) ( ON ?auto_732913 ?auto_732914 ) ( CLEAR ?auto_732913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_732908 ?auto_732909 ?auto_732910 ?auto_732911 ?auto_732912 ?auto_732913 )
      ( MAKE-8PILE ?auto_732908 ?auto_732909 ?auto_732910 ?auto_732911 ?auto_732912 ?auto_732913 ?auto_732914 ?auto_732915 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_732942 - BLOCK
      ?auto_732943 - BLOCK
      ?auto_732944 - BLOCK
      ?auto_732945 - BLOCK
      ?auto_732946 - BLOCK
      ?auto_732947 - BLOCK
      ?auto_732948 - BLOCK
      ?auto_732949 - BLOCK
    )
    :vars
    (
      ?auto_732950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732949 ?auto_732950 ) ( ON-TABLE ?auto_732942 ) ( ON ?auto_732943 ?auto_732942 ) ( ON ?auto_732944 ?auto_732943 ) ( ON ?auto_732945 ?auto_732944 ) ( not ( = ?auto_732942 ?auto_732943 ) ) ( not ( = ?auto_732942 ?auto_732944 ) ) ( not ( = ?auto_732942 ?auto_732945 ) ) ( not ( = ?auto_732942 ?auto_732946 ) ) ( not ( = ?auto_732942 ?auto_732947 ) ) ( not ( = ?auto_732942 ?auto_732948 ) ) ( not ( = ?auto_732942 ?auto_732949 ) ) ( not ( = ?auto_732942 ?auto_732950 ) ) ( not ( = ?auto_732943 ?auto_732944 ) ) ( not ( = ?auto_732943 ?auto_732945 ) ) ( not ( = ?auto_732943 ?auto_732946 ) ) ( not ( = ?auto_732943 ?auto_732947 ) ) ( not ( = ?auto_732943 ?auto_732948 ) ) ( not ( = ?auto_732943 ?auto_732949 ) ) ( not ( = ?auto_732943 ?auto_732950 ) ) ( not ( = ?auto_732944 ?auto_732945 ) ) ( not ( = ?auto_732944 ?auto_732946 ) ) ( not ( = ?auto_732944 ?auto_732947 ) ) ( not ( = ?auto_732944 ?auto_732948 ) ) ( not ( = ?auto_732944 ?auto_732949 ) ) ( not ( = ?auto_732944 ?auto_732950 ) ) ( not ( = ?auto_732945 ?auto_732946 ) ) ( not ( = ?auto_732945 ?auto_732947 ) ) ( not ( = ?auto_732945 ?auto_732948 ) ) ( not ( = ?auto_732945 ?auto_732949 ) ) ( not ( = ?auto_732945 ?auto_732950 ) ) ( not ( = ?auto_732946 ?auto_732947 ) ) ( not ( = ?auto_732946 ?auto_732948 ) ) ( not ( = ?auto_732946 ?auto_732949 ) ) ( not ( = ?auto_732946 ?auto_732950 ) ) ( not ( = ?auto_732947 ?auto_732948 ) ) ( not ( = ?auto_732947 ?auto_732949 ) ) ( not ( = ?auto_732947 ?auto_732950 ) ) ( not ( = ?auto_732948 ?auto_732949 ) ) ( not ( = ?auto_732948 ?auto_732950 ) ) ( not ( = ?auto_732949 ?auto_732950 ) ) ( ON ?auto_732948 ?auto_732949 ) ( ON ?auto_732947 ?auto_732948 ) ( CLEAR ?auto_732945 ) ( ON ?auto_732946 ?auto_732947 ) ( CLEAR ?auto_732946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_732942 ?auto_732943 ?auto_732944 ?auto_732945 ?auto_732946 )
      ( MAKE-8PILE ?auto_732942 ?auto_732943 ?auto_732944 ?auto_732945 ?auto_732946 ?auto_732947 ?auto_732948 ?auto_732949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_732976 - BLOCK
      ?auto_732977 - BLOCK
      ?auto_732978 - BLOCK
      ?auto_732979 - BLOCK
      ?auto_732980 - BLOCK
      ?auto_732981 - BLOCK
      ?auto_732982 - BLOCK
      ?auto_732983 - BLOCK
    )
    :vars
    (
      ?auto_732984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732983 ?auto_732984 ) ( ON-TABLE ?auto_732976 ) ( ON ?auto_732977 ?auto_732976 ) ( ON ?auto_732978 ?auto_732977 ) ( not ( = ?auto_732976 ?auto_732977 ) ) ( not ( = ?auto_732976 ?auto_732978 ) ) ( not ( = ?auto_732976 ?auto_732979 ) ) ( not ( = ?auto_732976 ?auto_732980 ) ) ( not ( = ?auto_732976 ?auto_732981 ) ) ( not ( = ?auto_732976 ?auto_732982 ) ) ( not ( = ?auto_732976 ?auto_732983 ) ) ( not ( = ?auto_732976 ?auto_732984 ) ) ( not ( = ?auto_732977 ?auto_732978 ) ) ( not ( = ?auto_732977 ?auto_732979 ) ) ( not ( = ?auto_732977 ?auto_732980 ) ) ( not ( = ?auto_732977 ?auto_732981 ) ) ( not ( = ?auto_732977 ?auto_732982 ) ) ( not ( = ?auto_732977 ?auto_732983 ) ) ( not ( = ?auto_732977 ?auto_732984 ) ) ( not ( = ?auto_732978 ?auto_732979 ) ) ( not ( = ?auto_732978 ?auto_732980 ) ) ( not ( = ?auto_732978 ?auto_732981 ) ) ( not ( = ?auto_732978 ?auto_732982 ) ) ( not ( = ?auto_732978 ?auto_732983 ) ) ( not ( = ?auto_732978 ?auto_732984 ) ) ( not ( = ?auto_732979 ?auto_732980 ) ) ( not ( = ?auto_732979 ?auto_732981 ) ) ( not ( = ?auto_732979 ?auto_732982 ) ) ( not ( = ?auto_732979 ?auto_732983 ) ) ( not ( = ?auto_732979 ?auto_732984 ) ) ( not ( = ?auto_732980 ?auto_732981 ) ) ( not ( = ?auto_732980 ?auto_732982 ) ) ( not ( = ?auto_732980 ?auto_732983 ) ) ( not ( = ?auto_732980 ?auto_732984 ) ) ( not ( = ?auto_732981 ?auto_732982 ) ) ( not ( = ?auto_732981 ?auto_732983 ) ) ( not ( = ?auto_732981 ?auto_732984 ) ) ( not ( = ?auto_732982 ?auto_732983 ) ) ( not ( = ?auto_732982 ?auto_732984 ) ) ( not ( = ?auto_732983 ?auto_732984 ) ) ( ON ?auto_732982 ?auto_732983 ) ( ON ?auto_732981 ?auto_732982 ) ( ON ?auto_732980 ?auto_732981 ) ( CLEAR ?auto_732978 ) ( ON ?auto_732979 ?auto_732980 ) ( CLEAR ?auto_732979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_732976 ?auto_732977 ?auto_732978 ?auto_732979 )
      ( MAKE-8PILE ?auto_732976 ?auto_732977 ?auto_732978 ?auto_732979 ?auto_732980 ?auto_732981 ?auto_732982 ?auto_732983 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_733010 - BLOCK
      ?auto_733011 - BLOCK
      ?auto_733012 - BLOCK
      ?auto_733013 - BLOCK
      ?auto_733014 - BLOCK
      ?auto_733015 - BLOCK
      ?auto_733016 - BLOCK
      ?auto_733017 - BLOCK
    )
    :vars
    (
      ?auto_733018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733017 ?auto_733018 ) ( ON-TABLE ?auto_733010 ) ( ON ?auto_733011 ?auto_733010 ) ( not ( = ?auto_733010 ?auto_733011 ) ) ( not ( = ?auto_733010 ?auto_733012 ) ) ( not ( = ?auto_733010 ?auto_733013 ) ) ( not ( = ?auto_733010 ?auto_733014 ) ) ( not ( = ?auto_733010 ?auto_733015 ) ) ( not ( = ?auto_733010 ?auto_733016 ) ) ( not ( = ?auto_733010 ?auto_733017 ) ) ( not ( = ?auto_733010 ?auto_733018 ) ) ( not ( = ?auto_733011 ?auto_733012 ) ) ( not ( = ?auto_733011 ?auto_733013 ) ) ( not ( = ?auto_733011 ?auto_733014 ) ) ( not ( = ?auto_733011 ?auto_733015 ) ) ( not ( = ?auto_733011 ?auto_733016 ) ) ( not ( = ?auto_733011 ?auto_733017 ) ) ( not ( = ?auto_733011 ?auto_733018 ) ) ( not ( = ?auto_733012 ?auto_733013 ) ) ( not ( = ?auto_733012 ?auto_733014 ) ) ( not ( = ?auto_733012 ?auto_733015 ) ) ( not ( = ?auto_733012 ?auto_733016 ) ) ( not ( = ?auto_733012 ?auto_733017 ) ) ( not ( = ?auto_733012 ?auto_733018 ) ) ( not ( = ?auto_733013 ?auto_733014 ) ) ( not ( = ?auto_733013 ?auto_733015 ) ) ( not ( = ?auto_733013 ?auto_733016 ) ) ( not ( = ?auto_733013 ?auto_733017 ) ) ( not ( = ?auto_733013 ?auto_733018 ) ) ( not ( = ?auto_733014 ?auto_733015 ) ) ( not ( = ?auto_733014 ?auto_733016 ) ) ( not ( = ?auto_733014 ?auto_733017 ) ) ( not ( = ?auto_733014 ?auto_733018 ) ) ( not ( = ?auto_733015 ?auto_733016 ) ) ( not ( = ?auto_733015 ?auto_733017 ) ) ( not ( = ?auto_733015 ?auto_733018 ) ) ( not ( = ?auto_733016 ?auto_733017 ) ) ( not ( = ?auto_733016 ?auto_733018 ) ) ( not ( = ?auto_733017 ?auto_733018 ) ) ( ON ?auto_733016 ?auto_733017 ) ( ON ?auto_733015 ?auto_733016 ) ( ON ?auto_733014 ?auto_733015 ) ( ON ?auto_733013 ?auto_733014 ) ( CLEAR ?auto_733011 ) ( ON ?auto_733012 ?auto_733013 ) ( CLEAR ?auto_733012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_733010 ?auto_733011 ?auto_733012 )
      ( MAKE-8PILE ?auto_733010 ?auto_733011 ?auto_733012 ?auto_733013 ?auto_733014 ?auto_733015 ?auto_733016 ?auto_733017 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_733044 - BLOCK
      ?auto_733045 - BLOCK
      ?auto_733046 - BLOCK
      ?auto_733047 - BLOCK
      ?auto_733048 - BLOCK
      ?auto_733049 - BLOCK
      ?auto_733050 - BLOCK
      ?auto_733051 - BLOCK
    )
    :vars
    (
      ?auto_733052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733051 ?auto_733052 ) ( ON-TABLE ?auto_733044 ) ( not ( = ?auto_733044 ?auto_733045 ) ) ( not ( = ?auto_733044 ?auto_733046 ) ) ( not ( = ?auto_733044 ?auto_733047 ) ) ( not ( = ?auto_733044 ?auto_733048 ) ) ( not ( = ?auto_733044 ?auto_733049 ) ) ( not ( = ?auto_733044 ?auto_733050 ) ) ( not ( = ?auto_733044 ?auto_733051 ) ) ( not ( = ?auto_733044 ?auto_733052 ) ) ( not ( = ?auto_733045 ?auto_733046 ) ) ( not ( = ?auto_733045 ?auto_733047 ) ) ( not ( = ?auto_733045 ?auto_733048 ) ) ( not ( = ?auto_733045 ?auto_733049 ) ) ( not ( = ?auto_733045 ?auto_733050 ) ) ( not ( = ?auto_733045 ?auto_733051 ) ) ( not ( = ?auto_733045 ?auto_733052 ) ) ( not ( = ?auto_733046 ?auto_733047 ) ) ( not ( = ?auto_733046 ?auto_733048 ) ) ( not ( = ?auto_733046 ?auto_733049 ) ) ( not ( = ?auto_733046 ?auto_733050 ) ) ( not ( = ?auto_733046 ?auto_733051 ) ) ( not ( = ?auto_733046 ?auto_733052 ) ) ( not ( = ?auto_733047 ?auto_733048 ) ) ( not ( = ?auto_733047 ?auto_733049 ) ) ( not ( = ?auto_733047 ?auto_733050 ) ) ( not ( = ?auto_733047 ?auto_733051 ) ) ( not ( = ?auto_733047 ?auto_733052 ) ) ( not ( = ?auto_733048 ?auto_733049 ) ) ( not ( = ?auto_733048 ?auto_733050 ) ) ( not ( = ?auto_733048 ?auto_733051 ) ) ( not ( = ?auto_733048 ?auto_733052 ) ) ( not ( = ?auto_733049 ?auto_733050 ) ) ( not ( = ?auto_733049 ?auto_733051 ) ) ( not ( = ?auto_733049 ?auto_733052 ) ) ( not ( = ?auto_733050 ?auto_733051 ) ) ( not ( = ?auto_733050 ?auto_733052 ) ) ( not ( = ?auto_733051 ?auto_733052 ) ) ( ON ?auto_733050 ?auto_733051 ) ( ON ?auto_733049 ?auto_733050 ) ( ON ?auto_733048 ?auto_733049 ) ( ON ?auto_733047 ?auto_733048 ) ( ON ?auto_733046 ?auto_733047 ) ( CLEAR ?auto_733044 ) ( ON ?auto_733045 ?auto_733046 ) ( CLEAR ?auto_733045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_733044 ?auto_733045 )
      ( MAKE-8PILE ?auto_733044 ?auto_733045 ?auto_733046 ?auto_733047 ?auto_733048 ?auto_733049 ?auto_733050 ?auto_733051 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_733078 - BLOCK
      ?auto_733079 - BLOCK
      ?auto_733080 - BLOCK
      ?auto_733081 - BLOCK
      ?auto_733082 - BLOCK
      ?auto_733083 - BLOCK
      ?auto_733084 - BLOCK
      ?auto_733085 - BLOCK
    )
    :vars
    (
      ?auto_733086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733085 ?auto_733086 ) ( not ( = ?auto_733078 ?auto_733079 ) ) ( not ( = ?auto_733078 ?auto_733080 ) ) ( not ( = ?auto_733078 ?auto_733081 ) ) ( not ( = ?auto_733078 ?auto_733082 ) ) ( not ( = ?auto_733078 ?auto_733083 ) ) ( not ( = ?auto_733078 ?auto_733084 ) ) ( not ( = ?auto_733078 ?auto_733085 ) ) ( not ( = ?auto_733078 ?auto_733086 ) ) ( not ( = ?auto_733079 ?auto_733080 ) ) ( not ( = ?auto_733079 ?auto_733081 ) ) ( not ( = ?auto_733079 ?auto_733082 ) ) ( not ( = ?auto_733079 ?auto_733083 ) ) ( not ( = ?auto_733079 ?auto_733084 ) ) ( not ( = ?auto_733079 ?auto_733085 ) ) ( not ( = ?auto_733079 ?auto_733086 ) ) ( not ( = ?auto_733080 ?auto_733081 ) ) ( not ( = ?auto_733080 ?auto_733082 ) ) ( not ( = ?auto_733080 ?auto_733083 ) ) ( not ( = ?auto_733080 ?auto_733084 ) ) ( not ( = ?auto_733080 ?auto_733085 ) ) ( not ( = ?auto_733080 ?auto_733086 ) ) ( not ( = ?auto_733081 ?auto_733082 ) ) ( not ( = ?auto_733081 ?auto_733083 ) ) ( not ( = ?auto_733081 ?auto_733084 ) ) ( not ( = ?auto_733081 ?auto_733085 ) ) ( not ( = ?auto_733081 ?auto_733086 ) ) ( not ( = ?auto_733082 ?auto_733083 ) ) ( not ( = ?auto_733082 ?auto_733084 ) ) ( not ( = ?auto_733082 ?auto_733085 ) ) ( not ( = ?auto_733082 ?auto_733086 ) ) ( not ( = ?auto_733083 ?auto_733084 ) ) ( not ( = ?auto_733083 ?auto_733085 ) ) ( not ( = ?auto_733083 ?auto_733086 ) ) ( not ( = ?auto_733084 ?auto_733085 ) ) ( not ( = ?auto_733084 ?auto_733086 ) ) ( not ( = ?auto_733085 ?auto_733086 ) ) ( ON ?auto_733084 ?auto_733085 ) ( ON ?auto_733083 ?auto_733084 ) ( ON ?auto_733082 ?auto_733083 ) ( ON ?auto_733081 ?auto_733082 ) ( ON ?auto_733080 ?auto_733081 ) ( ON ?auto_733079 ?auto_733080 ) ( ON ?auto_733078 ?auto_733079 ) ( CLEAR ?auto_733078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_733078 )
      ( MAKE-8PILE ?auto_733078 ?auto_733079 ?auto_733080 ?auto_733081 ?auto_733082 ?auto_733083 ?auto_733084 ?auto_733085 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733113 - BLOCK
      ?auto_733114 - BLOCK
      ?auto_733115 - BLOCK
      ?auto_733116 - BLOCK
      ?auto_733117 - BLOCK
      ?auto_733118 - BLOCK
      ?auto_733119 - BLOCK
      ?auto_733120 - BLOCK
      ?auto_733121 - BLOCK
    )
    :vars
    (
      ?auto_733122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_733120 ) ( ON ?auto_733121 ?auto_733122 ) ( CLEAR ?auto_733121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_733113 ) ( ON ?auto_733114 ?auto_733113 ) ( ON ?auto_733115 ?auto_733114 ) ( ON ?auto_733116 ?auto_733115 ) ( ON ?auto_733117 ?auto_733116 ) ( ON ?auto_733118 ?auto_733117 ) ( ON ?auto_733119 ?auto_733118 ) ( ON ?auto_733120 ?auto_733119 ) ( not ( = ?auto_733113 ?auto_733114 ) ) ( not ( = ?auto_733113 ?auto_733115 ) ) ( not ( = ?auto_733113 ?auto_733116 ) ) ( not ( = ?auto_733113 ?auto_733117 ) ) ( not ( = ?auto_733113 ?auto_733118 ) ) ( not ( = ?auto_733113 ?auto_733119 ) ) ( not ( = ?auto_733113 ?auto_733120 ) ) ( not ( = ?auto_733113 ?auto_733121 ) ) ( not ( = ?auto_733113 ?auto_733122 ) ) ( not ( = ?auto_733114 ?auto_733115 ) ) ( not ( = ?auto_733114 ?auto_733116 ) ) ( not ( = ?auto_733114 ?auto_733117 ) ) ( not ( = ?auto_733114 ?auto_733118 ) ) ( not ( = ?auto_733114 ?auto_733119 ) ) ( not ( = ?auto_733114 ?auto_733120 ) ) ( not ( = ?auto_733114 ?auto_733121 ) ) ( not ( = ?auto_733114 ?auto_733122 ) ) ( not ( = ?auto_733115 ?auto_733116 ) ) ( not ( = ?auto_733115 ?auto_733117 ) ) ( not ( = ?auto_733115 ?auto_733118 ) ) ( not ( = ?auto_733115 ?auto_733119 ) ) ( not ( = ?auto_733115 ?auto_733120 ) ) ( not ( = ?auto_733115 ?auto_733121 ) ) ( not ( = ?auto_733115 ?auto_733122 ) ) ( not ( = ?auto_733116 ?auto_733117 ) ) ( not ( = ?auto_733116 ?auto_733118 ) ) ( not ( = ?auto_733116 ?auto_733119 ) ) ( not ( = ?auto_733116 ?auto_733120 ) ) ( not ( = ?auto_733116 ?auto_733121 ) ) ( not ( = ?auto_733116 ?auto_733122 ) ) ( not ( = ?auto_733117 ?auto_733118 ) ) ( not ( = ?auto_733117 ?auto_733119 ) ) ( not ( = ?auto_733117 ?auto_733120 ) ) ( not ( = ?auto_733117 ?auto_733121 ) ) ( not ( = ?auto_733117 ?auto_733122 ) ) ( not ( = ?auto_733118 ?auto_733119 ) ) ( not ( = ?auto_733118 ?auto_733120 ) ) ( not ( = ?auto_733118 ?auto_733121 ) ) ( not ( = ?auto_733118 ?auto_733122 ) ) ( not ( = ?auto_733119 ?auto_733120 ) ) ( not ( = ?auto_733119 ?auto_733121 ) ) ( not ( = ?auto_733119 ?auto_733122 ) ) ( not ( = ?auto_733120 ?auto_733121 ) ) ( not ( = ?auto_733120 ?auto_733122 ) ) ( not ( = ?auto_733121 ?auto_733122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_733121 ?auto_733122 )
      ( !STACK ?auto_733121 ?auto_733120 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733151 - BLOCK
      ?auto_733152 - BLOCK
      ?auto_733153 - BLOCK
      ?auto_733154 - BLOCK
      ?auto_733155 - BLOCK
      ?auto_733156 - BLOCK
      ?auto_733157 - BLOCK
      ?auto_733158 - BLOCK
      ?auto_733159 - BLOCK
    )
    :vars
    (
      ?auto_733160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733159 ?auto_733160 ) ( ON-TABLE ?auto_733151 ) ( ON ?auto_733152 ?auto_733151 ) ( ON ?auto_733153 ?auto_733152 ) ( ON ?auto_733154 ?auto_733153 ) ( ON ?auto_733155 ?auto_733154 ) ( ON ?auto_733156 ?auto_733155 ) ( ON ?auto_733157 ?auto_733156 ) ( not ( = ?auto_733151 ?auto_733152 ) ) ( not ( = ?auto_733151 ?auto_733153 ) ) ( not ( = ?auto_733151 ?auto_733154 ) ) ( not ( = ?auto_733151 ?auto_733155 ) ) ( not ( = ?auto_733151 ?auto_733156 ) ) ( not ( = ?auto_733151 ?auto_733157 ) ) ( not ( = ?auto_733151 ?auto_733158 ) ) ( not ( = ?auto_733151 ?auto_733159 ) ) ( not ( = ?auto_733151 ?auto_733160 ) ) ( not ( = ?auto_733152 ?auto_733153 ) ) ( not ( = ?auto_733152 ?auto_733154 ) ) ( not ( = ?auto_733152 ?auto_733155 ) ) ( not ( = ?auto_733152 ?auto_733156 ) ) ( not ( = ?auto_733152 ?auto_733157 ) ) ( not ( = ?auto_733152 ?auto_733158 ) ) ( not ( = ?auto_733152 ?auto_733159 ) ) ( not ( = ?auto_733152 ?auto_733160 ) ) ( not ( = ?auto_733153 ?auto_733154 ) ) ( not ( = ?auto_733153 ?auto_733155 ) ) ( not ( = ?auto_733153 ?auto_733156 ) ) ( not ( = ?auto_733153 ?auto_733157 ) ) ( not ( = ?auto_733153 ?auto_733158 ) ) ( not ( = ?auto_733153 ?auto_733159 ) ) ( not ( = ?auto_733153 ?auto_733160 ) ) ( not ( = ?auto_733154 ?auto_733155 ) ) ( not ( = ?auto_733154 ?auto_733156 ) ) ( not ( = ?auto_733154 ?auto_733157 ) ) ( not ( = ?auto_733154 ?auto_733158 ) ) ( not ( = ?auto_733154 ?auto_733159 ) ) ( not ( = ?auto_733154 ?auto_733160 ) ) ( not ( = ?auto_733155 ?auto_733156 ) ) ( not ( = ?auto_733155 ?auto_733157 ) ) ( not ( = ?auto_733155 ?auto_733158 ) ) ( not ( = ?auto_733155 ?auto_733159 ) ) ( not ( = ?auto_733155 ?auto_733160 ) ) ( not ( = ?auto_733156 ?auto_733157 ) ) ( not ( = ?auto_733156 ?auto_733158 ) ) ( not ( = ?auto_733156 ?auto_733159 ) ) ( not ( = ?auto_733156 ?auto_733160 ) ) ( not ( = ?auto_733157 ?auto_733158 ) ) ( not ( = ?auto_733157 ?auto_733159 ) ) ( not ( = ?auto_733157 ?auto_733160 ) ) ( not ( = ?auto_733158 ?auto_733159 ) ) ( not ( = ?auto_733158 ?auto_733160 ) ) ( not ( = ?auto_733159 ?auto_733160 ) ) ( CLEAR ?auto_733157 ) ( ON ?auto_733158 ?auto_733159 ) ( CLEAR ?auto_733158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_733151 ?auto_733152 ?auto_733153 ?auto_733154 ?auto_733155 ?auto_733156 ?auto_733157 ?auto_733158 )
      ( MAKE-9PILE ?auto_733151 ?auto_733152 ?auto_733153 ?auto_733154 ?auto_733155 ?auto_733156 ?auto_733157 ?auto_733158 ?auto_733159 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733189 - BLOCK
      ?auto_733190 - BLOCK
      ?auto_733191 - BLOCK
      ?auto_733192 - BLOCK
      ?auto_733193 - BLOCK
      ?auto_733194 - BLOCK
      ?auto_733195 - BLOCK
      ?auto_733196 - BLOCK
      ?auto_733197 - BLOCK
    )
    :vars
    (
      ?auto_733198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733197 ?auto_733198 ) ( ON-TABLE ?auto_733189 ) ( ON ?auto_733190 ?auto_733189 ) ( ON ?auto_733191 ?auto_733190 ) ( ON ?auto_733192 ?auto_733191 ) ( ON ?auto_733193 ?auto_733192 ) ( ON ?auto_733194 ?auto_733193 ) ( not ( = ?auto_733189 ?auto_733190 ) ) ( not ( = ?auto_733189 ?auto_733191 ) ) ( not ( = ?auto_733189 ?auto_733192 ) ) ( not ( = ?auto_733189 ?auto_733193 ) ) ( not ( = ?auto_733189 ?auto_733194 ) ) ( not ( = ?auto_733189 ?auto_733195 ) ) ( not ( = ?auto_733189 ?auto_733196 ) ) ( not ( = ?auto_733189 ?auto_733197 ) ) ( not ( = ?auto_733189 ?auto_733198 ) ) ( not ( = ?auto_733190 ?auto_733191 ) ) ( not ( = ?auto_733190 ?auto_733192 ) ) ( not ( = ?auto_733190 ?auto_733193 ) ) ( not ( = ?auto_733190 ?auto_733194 ) ) ( not ( = ?auto_733190 ?auto_733195 ) ) ( not ( = ?auto_733190 ?auto_733196 ) ) ( not ( = ?auto_733190 ?auto_733197 ) ) ( not ( = ?auto_733190 ?auto_733198 ) ) ( not ( = ?auto_733191 ?auto_733192 ) ) ( not ( = ?auto_733191 ?auto_733193 ) ) ( not ( = ?auto_733191 ?auto_733194 ) ) ( not ( = ?auto_733191 ?auto_733195 ) ) ( not ( = ?auto_733191 ?auto_733196 ) ) ( not ( = ?auto_733191 ?auto_733197 ) ) ( not ( = ?auto_733191 ?auto_733198 ) ) ( not ( = ?auto_733192 ?auto_733193 ) ) ( not ( = ?auto_733192 ?auto_733194 ) ) ( not ( = ?auto_733192 ?auto_733195 ) ) ( not ( = ?auto_733192 ?auto_733196 ) ) ( not ( = ?auto_733192 ?auto_733197 ) ) ( not ( = ?auto_733192 ?auto_733198 ) ) ( not ( = ?auto_733193 ?auto_733194 ) ) ( not ( = ?auto_733193 ?auto_733195 ) ) ( not ( = ?auto_733193 ?auto_733196 ) ) ( not ( = ?auto_733193 ?auto_733197 ) ) ( not ( = ?auto_733193 ?auto_733198 ) ) ( not ( = ?auto_733194 ?auto_733195 ) ) ( not ( = ?auto_733194 ?auto_733196 ) ) ( not ( = ?auto_733194 ?auto_733197 ) ) ( not ( = ?auto_733194 ?auto_733198 ) ) ( not ( = ?auto_733195 ?auto_733196 ) ) ( not ( = ?auto_733195 ?auto_733197 ) ) ( not ( = ?auto_733195 ?auto_733198 ) ) ( not ( = ?auto_733196 ?auto_733197 ) ) ( not ( = ?auto_733196 ?auto_733198 ) ) ( not ( = ?auto_733197 ?auto_733198 ) ) ( ON ?auto_733196 ?auto_733197 ) ( CLEAR ?auto_733194 ) ( ON ?auto_733195 ?auto_733196 ) ( CLEAR ?auto_733195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_733189 ?auto_733190 ?auto_733191 ?auto_733192 ?auto_733193 ?auto_733194 ?auto_733195 )
      ( MAKE-9PILE ?auto_733189 ?auto_733190 ?auto_733191 ?auto_733192 ?auto_733193 ?auto_733194 ?auto_733195 ?auto_733196 ?auto_733197 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733227 - BLOCK
      ?auto_733228 - BLOCK
      ?auto_733229 - BLOCK
      ?auto_733230 - BLOCK
      ?auto_733231 - BLOCK
      ?auto_733232 - BLOCK
      ?auto_733233 - BLOCK
      ?auto_733234 - BLOCK
      ?auto_733235 - BLOCK
    )
    :vars
    (
      ?auto_733236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733235 ?auto_733236 ) ( ON-TABLE ?auto_733227 ) ( ON ?auto_733228 ?auto_733227 ) ( ON ?auto_733229 ?auto_733228 ) ( ON ?auto_733230 ?auto_733229 ) ( ON ?auto_733231 ?auto_733230 ) ( not ( = ?auto_733227 ?auto_733228 ) ) ( not ( = ?auto_733227 ?auto_733229 ) ) ( not ( = ?auto_733227 ?auto_733230 ) ) ( not ( = ?auto_733227 ?auto_733231 ) ) ( not ( = ?auto_733227 ?auto_733232 ) ) ( not ( = ?auto_733227 ?auto_733233 ) ) ( not ( = ?auto_733227 ?auto_733234 ) ) ( not ( = ?auto_733227 ?auto_733235 ) ) ( not ( = ?auto_733227 ?auto_733236 ) ) ( not ( = ?auto_733228 ?auto_733229 ) ) ( not ( = ?auto_733228 ?auto_733230 ) ) ( not ( = ?auto_733228 ?auto_733231 ) ) ( not ( = ?auto_733228 ?auto_733232 ) ) ( not ( = ?auto_733228 ?auto_733233 ) ) ( not ( = ?auto_733228 ?auto_733234 ) ) ( not ( = ?auto_733228 ?auto_733235 ) ) ( not ( = ?auto_733228 ?auto_733236 ) ) ( not ( = ?auto_733229 ?auto_733230 ) ) ( not ( = ?auto_733229 ?auto_733231 ) ) ( not ( = ?auto_733229 ?auto_733232 ) ) ( not ( = ?auto_733229 ?auto_733233 ) ) ( not ( = ?auto_733229 ?auto_733234 ) ) ( not ( = ?auto_733229 ?auto_733235 ) ) ( not ( = ?auto_733229 ?auto_733236 ) ) ( not ( = ?auto_733230 ?auto_733231 ) ) ( not ( = ?auto_733230 ?auto_733232 ) ) ( not ( = ?auto_733230 ?auto_733233 ) ) ( not ( = ?auto_733230 ?auto_733234 ) ) ( not ( = ?auto_733230 ?auto_733235 ) ) ( not ( = ?auto_733230 ?auto_733236 ) ) ( not ( = ?auto_733231 ?auto_733232 ) ) ( not ( = ?auto_733231 ?auto_733233 ) ) ( not ( = ?auto_733231 ?auto_733234 ) ) ( not ( = ?auto_733231 ?auto_733235 ) ) ( not ( = ?auto_733231 ?auto_733236 ) ) ( not ( = ?auto_733232 ?auto_733233 ) ) ( not ( = ?auto_733232 ?auto_733234 ) ) ( not ( = ?auto_733232 ?auto_733235 ) ) ( not ( = ?auto_733232 ?auto_733236 ) ) ( not ( = ?auto_733233 ?auto_733234 ) ) ( not ( = ?auto_733233 ?auto_733235 ) ) ( not ( = ?auto_733233 ?auto_733236 ) ) ( not ( = ?auto_733234 ?auto_733235 ) ) ( not ( = ?auto_733234 ?auto_733236 ) ) ( not ( = ?auto_733235 ?auto_733236 ) ) ( ON ?auto_733234 ?auto_733235 ) ( ON ?auto_733233 ?auto_733234 ) ( CLEAR ?auto_733231 ) ( ON ?auto_733232 ?auto_733233 ) ( CLEAR ?auto_733232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_733227 ?auto_733228 ?auto_733229 ?auto_733230 ?auto_733231 ?auto_733232 )
      ( MAKE-9PILE ?auto_733227 ?auto_733228 ?auto_733229 ?auto_733230 ?auto_733231 ?auto_733232 ?auto_733233 ?auto_733234 ?auto_733235 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733265 - BLOCK
      ?auto_733266 - BLOCK
      ?auto_733267 - BLOCK
      ?auto_733268 - BLOCK
      ?auto_733269 - BLOCK
      ?auto_733270 - BLOCK
      ?auto_733271 - BLOCK
      ?auto_733272 - BLOCK
      ?auto_733273 - BLOCK
    )
    :vars
    (
      ?auto_733274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733273 ?auto_733274 ) ( ON-TABLE ?auto_733265 ) ( ON ?auto_733266 ?auto_733265 ) ( ON ?auto_733267 ?auto_733266 ) ( ON ?auto_733268 ?auto_733267 ) ( not ( = ?auto_733265 ?auto_733266 ) ) ( not ( = ?auto_733265 ?auto_733267 ) ) ( not ( = ?auto_733265 ?auto_733268 ) ) ( not ( = ?auto_733265 ?auto_733269 ) ) ( not ( = ?auto_733265 ?auto_733270 ) ) ( not ( = ?auto_733265 ?auto_733271 ) ) ( not ( = ?auto_733265 ?auto_733272 ) ) ( not ( = ?auto_733265 ?auto_733273 ) ) ( not ( = ?auto_733265 ?auto_733274 ) ) ( not ( = ?auto_733266 ?auto_733267 ) ) ( not ( = ?auto_733266 ?auto_733268 ) ) ( not ( = ?auto_733266 ?auto_733269 ) ) ( not ( = ?auto_733266 ?auto_733270 ) ) ( not ( = ?auto_733266 ?auto_733271 ) ) ( not ( = ?auto_733266 ?auto_733272 ) ) ( not ( = ?auto_733266 ?auto_733273 ) ) ( not ( = ?auto_733266 ?auto_733274 ) ) ( not ( = ?auto_733267 ?auto_733268 ) ) ( not ( = ?auto_733267 ?auto_733269 ) ) ( not ( = ?auto_733267 ?auto_733270 ) ) ( not ( = ?auto_733267 ?auto_733271 ) ) ( not ( = ?auto_733267 ?auto_733272 ) ) ( not ( = ?auto_733267 ?auto_733273 ) ) ( not ( = ?auto_733267 ?auto_733274 ) ) ( not ( = ?auto_733268 ?auto_733269 ) ) ( not ( = ?auto_733268 ?auto_733270 ) ) ( not ( = ?auto_733268 ?auto_733271 ) ) ( not ( = ?auto_733268 ?auto_733272 ) ) ( not ( = ?auto_733268 ?auto_733273 ) ) ( not ( = ?auto_733268 ?auto_733274 ) ) ( not ( = ?auto_733269 ?auto_733270 ) ) ( not ( = ?auto_733269 ?auto_733271 ) ) ( not ( = ?auto_733269 ?auto_733272 ) ) ( not ( = ?auto_733269 ?auto_733273 ) ) ( not ( = ?auto_733269 ?auto_733274 ) ) ( not ( = ?auto_733270 ?auto_733271 ) ) ( not ( = ?auto_733270 ?auto_733272 ) ) ( not ( = ?auto_733270 ?auto_733273 ) ) ( not ( = ?auto_733270 ?auto_733274 ) ) ( not ( = ?auto_733271 ?auto_733272 ) ) ( not ( = ?auto_733271 ?auto_733273 ) ) ( not ( = ?auto_733271 ?auto_733274 ) ) ( not ( = ?auto_733272 ?auto_733273 ) ) ( not ( = ?auto_733272 ?auto_733274 ) ) ( not ( = ?auto_733273 ?auto_733274 ) ) ( ON ?auto_733272 ?auto_733273 ) ( ON ?auto_733271 ?auto_733272 ) ( ON ?auto_733270 ?auto_733271 ) ( CLEAR ?auto_733268 ) ( ON ?auto_733269 ?auto_733270 ) ( CLEAR ?auto_733269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_733265 ?auto_733266 ?auto_733267 ?auto_733268 ?auto_733269 )
      ( MAKE-9PILE ?auto_733265 ?auto_733266 ?auto_733267 ?auto_733268 ?auto_733269 ?auto_733270 ?auto_733271 ?auto_733272 ?auto_733273 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733303 - BLOCK
      ?auto_733304 - BLOCK
      ?auto_733305 - BLOCK
      ?auto_733306 - BLOCK
      ?auto_733307 - BLOCK
      ?auto_733308 - BLOCK
      ?auto_733309 - BLOCK
      ?auto_733310 - BLOCK
      ?auto_733311 - BLOCK
    )
    :vars
    (
      ?auto_733312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733311 ?auto_733312 ) ( ON-TABLE ?auto_733303 ) ( ON ?auto_733304 ?auto_733303 ) ( ON ?auto_733305 ?auto_733304 ) ( not ( = ?auto_733303 ?auto_733304 ) ) ( not ( = ?auto_733303 ?auto_733305 ) ) ( not ( = ?auto_733303 ?auto_733306 ) ) ( not ( = ?auto_733303 ?auto_733307 ) ) ( not ( = ?auto_733303 ?auto_733308 ) ) ( not ( = ?auto_733303 ?auto_733309 ) ) ( not ( = ?auto_733303 ?auto_733310 ) ) ( not ( = ?auto_733303 ?auto_733311 ) ) ( not ( = ?auto_733303 ?auto_733312 ) ) ( not ( = ?auto_733304 ?auto_733305 ) ) ( not ( = ?auto_733304 ?auto_733306 ) ) ( not ( = ?auto_733304 ?auto_733307 ) ) ( not ( = ?auto_733304 ?auto_733308 ) ) ( not ( = ?auto_733304 ?auto_733309 ) ) ( not ( = ?auto_733304 ?auto_733310 ) ) ( not ( = ?auto_733304 ?auto_733311 ) ) ( not ( = ?auto_733304 ?auto_733312 ) ) ( not ( = ?auto_733305 ?auto_733306 ) ) ( not ( = ?auto_733305 ?auto_733307 ) ) ( not ( = ?auto_733305 ?auto_733308 ) ) ( not ( = ?auto_733305 ?auto_733309 ) ) ( not ( = ?auto_733305 ?auto_733310 ) ) ( not ( = ?auto_733305 ?auto_733311 ) ) ( not ( = ?auto_733305 ?auto_733312 ) ) ( not ( = ?auto_733306 ?auto_733307 ) ) ( not ( = ?auto_733306 ?auto_733308 ) ) ( not ( = ?auto_733306 ?auto_733309 ) ) ( not ( = ?auto_733306 ?auto_733310 ) ) ( not ( = ?auto_733306 ?auto_733311 ) ) ( not ( = ?auto_733306 ?auto_733312 ) ) ( not ( = ?auto_733307 ?auto_733308 ) ) ( not ( = ?auto_733307 ?auto_733309 ) ) ( not ( = ?auto_733307 ?auto_733310 ) ) ( not ( = ?auto_733307 ?auto_733311 ) ) ( not ( = ?auto_733307 ?auto_733312 ) ) ( not ( = ?auto_733308 ?auto_733309 ) ) ( not ( = ?auto_733308 ?auto_733310 ) ) ( not ( = ?auto_733308 ?auto_733311 ) ) ( not ( = ?auto_733308 ?auto_733312 ) ) ( not ( = ?auto_733309 ?auto_733310 ) ) ( not ( = ?auto_733309 ?auto_733311 ) ) ( not ( = ?auto_733309 ?auto_733312 ) ) ( not ( = ?auto_733310 ?auto_733311 ) ) ( not ( = ?auto_733310 ?auto_733312 ) ) ( not ( = ?auto_733311 ?auto_733312 ) ) ( ON ?auto_733310 ?auto_733311 ) ( ON ?auto_733309 ?auto_733310 ) ( ON ?auto_733308 ?auto_733309 ) ( ON ?auto_733307 ?auto_733308 ) ( CLEAR ?auto_733305 ) ( ON ?auto_733306 ?auto_733307 ) ( CLEAR ?auto_733306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_733303 ?auto_733304 ?auto_733305 ?auto_733306 )
      ( MAKE-9PILE ?auto_733303 ?auto_733304 ?auto_733305 ?auto_733306 ?auto_733307 ?auto_733308 ?auto_733309 ?auto_733310 ?auto_733311 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733341 - BLOCK
      ?auto_733342 - BLOCK
      ?auto_733343 - BLOCK
      ?auto_733344 - BLOCK
      ?auto_733345 - BLOCK
      ?auto_733346 - BLOCK
      ?auto_733347 - BLOCK
      ?auto_733348 - BLOCK
      ?auto_733349 - BLOCK
    )
    :vars
    (
      ?auto_733350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733349 ?auto_733350 ) ( ON-TABLE ?auto_733341 ) ( ON ?auto_733342 ?auto_733341 ) ( not ( = ?auto_733341 ?auto_733342 ) ) ( not ( = ?auto_733341 ?auto_733343 ) ) ( not ( = ?auto_733341 ?auto_733344 ) ) ( not ( = ?auto_733341 ?auto_733345 ) ) ( not ( = ?auto_733341 ?auto_733346 ) ) ( not ( = ?auto_733341 ?auto_733347 ) ) ( not ( = ?auto_733341 ?auto_733348 ) ) ( not ( = ?auto_733341 ?auto_733349 ) ) ( not ( = ?auto_733341 ?auto_733350 ) ) ( not ( = ?auto_733342 ?auto_733343 ) ) ( not ( = ?auto_733342 ?auto_733344 ) ) ( not ( = ?auto_733342 ?auto_733345 ) ) ( not ( = ?auto_733342 ?auto_733346 ) ) ( not ( = ?auto_733342 ?auto_733347 ) ) ( not ( = ?auto_733342 ?auto_733348 ) ) ( not ( = ?auto_733342 ?auto_733349 ) ) ( not ( = ?auto_733342 ?auto_733350 ) ) ( not ( = ?auto_733343 ?auto_733344 ) ) ( not ( = ?auto_733343 ?auto_733345 ) ) ( not ( = ?auto_733343 ?auto_733346 ) ) ( not ( = ?auto_733343 ?auto_733347 ) ) ( not ( = ?auto_733343 ?auto_733348 ) ) ( not ( = ?auto_733343 ?auto_733349 ) ) ( not ( = ?auto_733343 ?auto_733350 ) ) ( not ( = ?auto_733344 ?auto_733345 ) ) ( not ( = ?auto_733344 ?auto_733346 ) ) ( not ( = ?auto_733344 ?auto_733347 ) ) ( not ( = ?auto_733344 ?auto_733348 ) ) ( not ( = ?auto_733344 ?auto_733349 ) ) ( not ( = ?auto_733344 ?auto_733350 ) ) ( not ( = ?auto_733345 ?auto_733346 ) ) ( not ( = ?auto_733345 ?auto_733347 ) ) ( not ( = ?auto_733345 ?auto_733348 ) ) ( not ( = ?auto_733345 ?auto_733349 ) ) ( not ( = ?auto_733345 ?auto_733350 ) ) ( not ( = ?auto_733346 ?auto_733347 ) ) ( not ( = ?auto_733346 ?auto_733348 ) ) ( not ( = ?auto_733346 ?auto_733349 ) ) ( not ( = ?auto_733346 ?auto_733350 ) ) ( not ( = ?auto_733347 ?auto_733348 ) ) ( not ( = ?auto_733347 ?auto_733349 ) ) ( not ( = ?auto_733347 ?auto_733350 ) ) ( not ( = ?auto_733348 ?auto_733349 ) ) ( not ( = ?auto_733348 ?auto_733350 ) ) ( not ( = ?auto_733349 ?auto_733350 ) ) ( ON ?auto_733348 ?auto_733349 ) ( ON ?auto_733347 ?auto_733348 ) ( ON ?auto_733346 ?auto_733347 ) ( ON ?auto_733345 ?auto_733346 ) ( ON ?auto_733344 ?auto_733345 ) ( CLEAR ?auto_733342 ) ( ON ?auto_733343 ?auto_733344 ) ( CLEAR ?auto_733343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_733341 ?auto_733342 ?auto_733343 )
      ( MAKE-9PILE ?auto_733341 ?auto_733342 ?auto_733343 ?auto_733344 ?auto_733345 ?auto_733346 ?auto_733347 ?auto_733348 ?auto_733349 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733379 - BLOCK
      ?auto_733380 - BLOCK
      ?auto_733381 - BLOCK
      ?auto_733382 - BLOCK
      ?auto_733383 - BLOCK
      ?auto_733384 - BLOCK
      ?auto_733385 - BLOCK
      ?auto_733386 - BLOCK
      ?auto_733387 - BLOCK
    )
    :vars
    (
      ?auto_733388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733387 ?auto_733388 ) ( ON-TABLE ?auto_733379 ) ( not ( = ?auto_733379 ?auto_733380 ) ) ( not ( = ?auto_733379 ?auto_733381 ) ) ( not ( = ?auto_733379 ?auto_733382 ) ) ( not ( = ?auto_733379 ?auto_733383 ) ) ( not ( = ?auto_733379 ?auto_733384 ) ) ( not ( = ?auto_733379 ?auto_733385 ) ) ( not ( = ?auto_733379 ?auto_733386 ) ) ( not ( = ?auto_733379 ?auto_733387 ) ) ( not ( = ?auto_733379 ?auto_733388 ) ) ( not ( = ?auto_733380 ?auto_733381 ) ) ( not ( = ?auto_733380 ?auto_733382 ) ) ( not ( = ?auto_733380 ?auto_733383 ) ) ( not ( = ?auto_733380 ?auto_733384 ) ) ( not ( = ?auto_733380 ?auto_733385 ) ) ( not ( = ?auto_733380 ?auto_733386 ) ) ( not ( = ?auto_733380 ?auto_733387 ) ) ( not ( = ?auto_733380 ?auto_733388 ) ) ( not ( = ?auto_733381 ?auto_733382 ) ) ( not ( = ?auto_733381 ?auto_733383 ) ) ( not ( = ?auto_733381 ?auto_733384 ) ) ( not ( = ?auto_733381 ?auto_733385 ) ) ( not ( = ?auto_733381 ?auto_733386 ) ) ( not ( = ?auto_733381 ?auto_733387 ) ) ( not ( = ?auto_733381 ?auto_733388 ) ) ( not ( = ?auto_733382 ?auto_733383 ) ) ( not ( = ?auto_733382 ?auto_733384 ) ) ( not ( = ?auto_733382 ?auto_733385 ) ) ( not ( = ?auto_733382 ?auto_733386 ) ) ( not ( = ?auto_733382 ?auto_733387 ) ) ( not ( = ?auto_733382 ?auto_733388 ) ) ( not ( = ?auto_733383 ?auto_733384 ) ) ( not ( = ?auto_733383 ?auto_733385 ) ) ( not ( = ?auto_733383 ?auto_733386 ) ) ( not ( = ?auto_733383 ?auto_733387 ) ) ( not ( = ?auto_733383 ?auto_733388 ) ) ( not ( = ?auto_733384 ?auto_733385 ) ) ( not ( = ?auto_733384 ?auto_733386 ) ) ( not ( = ?auto_733384 ?auto_733387 ) ) ( not ( = ?auto_733384 ?auto_733388 ) ) ( not ( = ?auto_733385 ?auto_733386 ) ) ( not ( = ?auto_733385 ?auto_733387 ) ) ( not ( = ?auto_733385 ?auto_733388 ) ) ( not ( = ?auto_733386 ?auto_733387 ) ) ( not ( = ?auto_733386 ?auto_733388 ) ) ( not ( = ?auto_733387 ?auto_733388 ) ) ( ON ?auto_733386 ?auto_733387 ) ( ON ?auto_733385 ?auto_733386 ) ( ON ?auto_733384 ?auto_733385 ) ( ON ?auto_733383 ?auto_733384 ) ( ON ?auto_733382 ?auto_733383 ) ( ON ?auto_733381 ?auto_733382 ) ( CLEAR ?auto_733379 ) ( ON ?auto_733380 ?auto_733381 ) ( CLEAR ?auto_733380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_733379 ?auto_733380 )
      ( MAKE-9PILE ?auto_733379 ?auto_733380 ?auto_733381 ?auto_733382 ?auto_733383 ?auto_733384 ?auto_733385 ?auto_733386 ?auto_733387 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_733417 - BLOCK
      ?auto_733418 - BLOCK
      ?auto_733419 - BLOCK
      ?auto_733420 - BLOCK
      ?auto_733421 - BLOCK
      ?auto_733422 - BLOCK
      ?auto_733423 - BLOCK
      ?auto_733424 - BLOCK
      ?auto_733425 - BLOCK
    )
    :vars
    (
      ?auto_733426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733425 ?auto_733426 ) ( not ( = ?auto_733417 ?auto_733418 ) ) ( not ( = ?auto_733417 ?auto_733419 ) ) ( not ( = ?auto_733417 ?auto_733420 ) ) ( not ( = ?auto_733417 ?auto_733421 ) ) ( not ( = ?auto_733417 ?auto_733422 ) ) ( not ( = ?auto_733417 ?auto_733423 ) ) ( not ( = ?auto_733417 ?auto_733424 ) ) ( not ( = ?auto_733417 ?auto_733425 ) ) ( not ( = ?auto_733417 ?auto_733426 ) ) ( not ( = ?auto_733418 ?auto_733419 ) ) ( not ( = ?auto_733418 ?auto_733420 ) ) ( not ( = ?auto_733418 ?auto_733421 ) ) ( not ( = ?auto_733418 ?auto_733422 ) ) ( not ( = ?auto_733418 ?auto_733423 ) ) ( not ( = ?auto_733418 ?auto_733424 ) ) ( not ( = ?auto_733418 ?auto_733425 ) ) ( not ( = ?auto_733418 ?auto_733426 ) ) ( not ( = ?auto_733419 ?auto_733420 ) ) ( not ( = ?auto_733419 ?auto_733421 ) ) ( not ( = ?auto_733419 ?auto_733422 ) ) ( not ( = ?auto_733419 ?auto_733423 ) ) ( not ( = ?auto_733419 ?auto_733424 ) ) ( not ( = ?auto_733419 ?auto_733425 ) ) ( not ( = ?auto_733419 ?auto_733426 ) ) ( not ( = ?auto_733420 ?auto_733421 ) ) ( not ( = ?auto_733420 ?auto_733422 ) ) ( not ( = ?auto_733420 ?auto_733423 ) ) ( not ( = ?auto_733420 ?auto_733424 ) ) ( not ( = ?auto_733420 ?auto_733425 ) ) ( not ( = ?auto_733420 ?auto_733426 ) ) ( not ( = ?auto_733421 ?auto_733422 ) ) ( not ( = ?auto_733421 ?auto_733423 ) ) ( not ( = ?auto_733421 ?auto_733424 ) ) ( not ( = ?auto_733421 ?auto_733425 ) ) ( not ( = ?auto_733421 ?auto_733426 ) ) ( not ( = ?auto_733422 ?auto_733423 ) ) ( not ( = ?auto_733422 ?auto_733424 ) ) ( not ( = ?auto_733422 ?auto_733425 ) ) ( not ( = ?auto_733422 ?auto_733426 ) ) ( not ( = ?auto_733423 ?auto_733424 ) ) ( not ( = ?auto_733423 ?auto_733425 ) ) ( not ( = ?auto_733423 ?auto_733426 ) ) ( not ( = ?auto_733424 ?auto_733425 ) ) ( not ( = ?auto_733424 ?auto_733426 ) ) ( not ( = ?auto_733425 ?auto_733426 ) ) ( ON ?auto_733424 ?auto_733425 ) ( ON ?auto_733423 ?auto_733424 ) ( ON ?auto_733422 ?auto_733423 ) ( ON ?auto_733421 ?auto_733422 ) ( ON ?auto_733420 ?auto_733421 ) ( ON ?auto_733419 ?auto_733420 ) ( ON ?auto_733418 ?auto_733419 ) ( ON ?auto_733417 ?auto_733418 ) ( CLEAR ?auto_733417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_733417 )
      ( MAKE-9PILE ?auto_733417 ?auto_733418 ?auto_733419 ?auto_733420 ?auto_733421 ?auto_733422 ?auto_733423 ?auto_733424 ?auto_733425 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733456 - BLOCK
      ?auto_733457 - BLOCK
      ?auto_733458 - BLOCK
      ?auto_733459 - BLOCK
      ?auto_733460 - BLOCK
      ?auto_733461 - BLOCK
      ?auto_733462 - BLOCK
      ?auto_733463 - BLOCK
      ?auto_733464 - BLOCK
      ?auto_733465 - BLOCK
    )
    :vars
    (
      ?auto_733466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_733464 ) ( ON ?auto_733465 ?auto_733466 ) ( CLEAR ?auto_733465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_733456 ) ( ON ?auto_733457 ?auto_733456 ) ( ON ?auto_733458 ?auto_733457 ) ( ON ?auto_733459 ?auto_733458 ) ( ON ?auto_733460 ?auto_733459 ) ( ON ?auto_733461 ?auto_733460 ) ( ON ?auto_733462 ?auto_733461 ) ( ON ?auto_733463 ?auto_733462 ) ( ON ?auto_733464 ?auto_733463 ) ( not ( = ?auto_733456 ?auto_733457 ) ) ( not ( = ?auto_733456 ?auto_733458 ) ) ( not ( = ?auto_733456 ?auto_733459 ) ) ( not ( = ?auto_733456 ?auto_733460 ) ) ( not ( = ?auto_733456 ?auto_733461 ) ) ( not ( = ?auto_733456 ?auto_733462 ) ) ( not ( = ?auto_733456 ?auto_733463 ) ) ( not ( = ?auto_733456 ?auto_733464 ) ) ( not ( = ?auto_733456 ?auto_733465 ) ) ( not ( = ?auto_733456 ?auto_733466 ) ) ( not ( = ?auto_733457 ?auto_733458 ) ) ( not ( = ?auto_733457 ?auto_733459 ) ) ( not ( = ?auto_733457 ?auto_733460 ) ) ( not ( = ?auto_733457 ?auto_733461 ) ) ( not ( = ?auto_733457 ?auto_733462 ) ) ( not ( = ?auto_733457 ?auto_733463 ) ) ( not ( = ?auto_733457 ?auto_733464 ) ) ( not ( = ?auto_733457 ?auto_733465 ) ) ( not ( = ?auto_733457 ?auto_733466 ) ) ( not ( = ?auto_733458 ?auto_733459 ) ) ( not ( = ?auto_733458 ?auto_733460 ) ) ( not ( = ?auto_733458 ?auto_733461 ) ) ( not ( = ?auto_733458 ?auto_733462 ) ) ( not ( = ?auto_733458 ?auto_733463 ) ) ( not ( = ?auto_733458 ?auto_733464 ) ) ( not ( = ?auto_733458 ?auto_733465 ) ) ( not ( = ?auto_733458 ?auto_733466 ) ) ( not ( = ?auto_733459 ?auto_733460 ) ) ( not ( = ?auto_733459 ?auto_733461 ) ) ( not ( = ?auto_733459 ?auto_733462 ) ) ( not ( = ?auto_733459 ?auto_733463 ) ) ( not ( = ?auto_733459 ?auto_733464 ) ) ( not ( = ?auto_733459 ?auto_733465 ) ) ( not ( = ?auto_733459 ?auto_733466 ) ) ( not ( = ?auto_733460 ?auto_733461 ) ) ( not ( = ?auto_733460 ?auto_733462 ) ) ( not ( = ?auto_733460 ?auto_733463 ) ) ( not ( = ?auto_733460 ?auto_733464 ) ) ( not ( = ?auto_733460 ?auto_733465 ) ) ( not ( = ?auto_733460 ?auto_733466 ) ) ( not ( = ?auto_733461 ?auto_733462 ) ) ( not ( = ?auto_733461 ?auto_733463 ) ) ( not ( = ?auto_733461 ?auto_733464 ) ) ( not ( = ?auto_733461 ?auto_733465 ) ) ( not ( = ?auto_733461 ?auto_733466 ) ) ( not ( = ?auto_733462 ?auto_733463 ) ) ( not ( = ?auto_733462 ?auto_733464 ) ) ( not ( = ?auto_733462 ?auto_733465 ) ) ( not ( = ?auto_733462 ?auto_733466 ) ) ( not ( = ?auto_733463 ?auto_733464 ) ) ( not ( = ?auto_733463 ?auto_733465 ) ) ( not ( = ?auto_733463 ?auto_733466 ) ) ( not ( = ?auto_733464 ?auto_733465 ) ) ( not ( = ?auto_733464 ?auto_733466 ) ) ( not ( = ?auto_733465 ?auto_733466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_733465 ?auto_733466 )
      ( !STACK ?auto_733465 ?auto_733464 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733498 - BLOCK
      ?auto_733499 - BLOCK
      ?auto_733500 - BLOCK
      ?auto_733501 - BLOCK
      ?auto_733502 - BLOCK
      ?auto_733503 - BLOCK
      ?auto_733504 - BLOCK
      ?auto_733505 - BLOCK
      ?auto_733506 - BLOCK
      ?auto_733507 - BLOCK
    )
    :vars
    (
      ?auto_733508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733507 ?auto_733508 ) ( ON-TABLE ?auto_733498 ) ( ON ?auto_733499 ?auto_733498 ) ( ON ?auto_733500 ?auto_733499 ) ( ON ?auto_733501 ?auto_733500 ) ( ON ?auto_733502 ?auto_733501 ) ( ON ?auto_733503 ?auto_733502 ) ( ON ?auto_733504 ?auto_733503 ) ( ON ?auto_733505 ?auto_733504 ) ( not ( = ?auto_733498 ?auto_733499 ) ) ( not ( = ?auto_733498 ?auto_733500 ) ) ( not ( = ?auto_733498 ?auto_733501 ) ) ( not ( = ?auto_733498 ?auto_733502 ) ) ( not ( = ?auto_733498 ?auto_733503 ) ) ( not ( = ?auto_733498 ?auto_733504 ) ) ( not ( = ?auto_733498 ?auto_733505 ) ) ( not ( = ?auto_733498 ?auto_733506 ) ) ( not ( = ?auto_733498 ?auto_733507 ) ) ( not ( = ?auto_733498 ?auto_733508 ) ) ( not ( = ?auto_733499 ?auto_733500 ) ) ( not ( = ?auto_733499 ?auto_733501 ) ) ( not ( = ?auto_733499 ?auto_733502 ) ) ( not ( = ?auto_733499 ?auto_733503 ) ) ( not ( = ?auto_733499 ?auto_733504 ) ) ( not ( = ?auto_733499 ?auto_733505 ) ) ( not ( = ?auto_733499 ?auto_733506 ) ) ( not ( = ?auto_733499 ?auto_733507 ) ) ( not ( = ?auto_733499 ?auto_733508 ) ) ( not ( = ?auto_733500 ?auto_733501 ) ) ( not ( = ?auto_733500 ?auto_733502 ) ) ( not ( = ?auto_733500 ?auto_733503 ) ) ( not ( = ?auto_733500 ?auto_733504 ) ) ( not ( = ?auto_733500 ?auto_733505 ) ) ( not ( = ?auto_733500 ?auto_733506 ) ) ( not ( = ?auto_733500 ?auto_733507 ) ) ( not ( = ?auto_733500 ?auto_733508 ) ) ( not ( = ?auto_733501 ?auto_733502 ) ) ( not ( = ?auto_733501 ?auto_733503 ) ) ( not ( = ?auto_733501 ?auto_733504 ) ) ( not ( = ?auto_733501 ?auto_733505 ) ) ( not ( = ?auto_733501 ?auto_733506 ) ) ( not ( = ?auto_733501 ?auto_733507 ) ) ( not ( = ?auto_733501 ?auto_733508 ) ) ( not ( = ?auto_733502 ?auto_733503 ) ) ( not ( = ?auto_733502 ?auto_733504 ) ) ( not ( = ?auto_733502 ?auto_733505 ) ) ( not ( = ?auto_733502 ?auto_733506 ) ) ( not ( = ?auto_733502 ?auto_733507 ) ) ( not ( = ?auto_733502 ?auto_733508 ) ) ( not ( = ?auto_733503 ?auto_733504 ) ) ( not ( = ?auto_733503 ?auto_733505 ) ) ( not ( = ?auto_733503 ?auto_733506 ) ) ( not ( = ?auto_733503 ?auto_733507 ) ) ( not ( = ?auto_733503 ?auto_733508 ) ) ( not ( = ?auto_733504 ?auto_733505 ) ) ( not ( = ?auto_733504 ?auto_733506 ) ) ( not ( = ?auto_733504 ?auto_733507 ) ) ( not ( = ?auto_733504 ?auto_733508 ) ) ( not ( = ?auto_733505 ?auto_733506 ) ) ( not ( = ?auto_733505 ?auto_733507 ) ) ( not ( = ?auto_733505 ?auto_733508 ) ) ( not ( = ?auto_733506 ?auto_733507 ) ) ( not ( = ?auto_733506 ?auto_733508 ) ) ( not ( = ?auto_733507 ?auto_733508 ) ) ( CLEAR ?auto_733505 ) ( ON ?auto_733506 ?auto_733507 ) ( CLEAR ?auto_733506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_733498 ?auto_733499 ?auto_733500 ?auto_733501 ?auto_733502 ?auto_733503 ?auto_733504 ?auto_733505 ?auto_733506 )
      ( MAKE-10PILE ?auto_733498 ?auto_733499 ?auto_733500 ?auto_733501 ?auto_733502 ?auto_733503 ?auto_733504 ?auto_733505 ?auto_733506 ?auto_733507 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733540 - BLOCK
      ?auto_733541 - BLOCK
      ?auto_733542 - BLOCK
      ?auto_733543 - BLOCK
      ?auto_733544 - BLOCK
      ?auto_733545 - BLOCK
      ?auto_733546 - BLOCK
      ?auto_733547 - BLOCK
      ?auto_733548 - BLOCK
      ?auto_733549 - BLOCK
    )
    :vars
    (
      ?auto_733550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733549 ?auto_733550 ) ( ON-TABLE ?auto_733540 ) ( ON ?auto_733541 ?auto_733540 ) ( ON ?auto_733542 ?auto_733541 ) ( ON ?auto_733543 ?auto_733542 ) ( ON ?auto_733544 ?auto_733543 ) ( ON ?auto_733545 ?auto_733544 ) ( ON ?auto_733546 ?auto_733545 ) ( not ( = ?auto_733540 ?auto_733541 ) ) ( not ( = ?auto_733540 ?auto_733542 ) ) ( not ( = ?auto_733540 ?auto_733543 ) ) ( not ( = ?auto_733540 ?auto_733544 ) ) ( not ( = ?auto_733540 ?auto_733545 ) ) ( not ( = ?auto_733540 ?auto_733546 ) ) ( not ( = ?auto_733540 ?auto_733547 ) ) ( not ( = ?auto_733540 ?auto_733548 ) ) ( not ( = ?auto_733540 ?auto_733549 ) ) ( not ( = ?auto_733540 ?auto_733550 ) ) ( not ( = ?auto_733541 ?auto_733542 ) ) ( not ( = ?auto_733541 ?auto_733543 ) ) ( not ( = ?auto_733541 ?auto_733544 ) ) ( not ( = ?auto_733541 ?auto_733545 ) ) ( not ( = ?auto_733541 ?auto_733546 ) ) ( not ( = ?auto_733541 ?auto_733547 ) ) ( not ( = ?auto_733541 ?auto_733548 ) ) ( not ( = ?auto_733541 ?auto_733549 ) ) ( not ( = ?auto_733541 ?auto_733550 ) ) ( not ( = ?auto_733542 ?auto_733543 ) ) ( not ( = ?auto_733542 ?auto_733544 ) ) ( not ( = ?auto_733542 ?auto_733545 ) ) ( not ( = ?auto_733542 ?auto_733546 ) ) ( not ( = ?auto_733542 ?auto_733547 ) ) ( not ( = ?auto_733542 ?auto_733548 ) ) ( not ( = ?auto_733542 ?auto_733549 ) ) ( not ( = ?auto_733542 ?auto_733550 ) ) ( not ( = ?auto_733543 ?auto_733544 ) ) ( not ( = ?auto_733543 ?auto_733545 ) ) ( not ( = ?auto_733543 ?auto_733546 ) ) ( not ( = ?auto_733543 ?auto_733547 ) ) ( not ( = ?auto_733543 ?auto_733548 ) ) ( not ( = ?auto_733543 ?auto_733549 ) ) ( not ( = ?auto_733543 ?auto_733550 ) ) ( not ( = ?auto_733544 ?auto_733545 ) ) ( not ( = ?auto_733544 ?auto_733546 ) ) ( not ( = ?auto_733544 ?auto_733547 ) ) ( not ( = ?auto_733544 ?auto_733548 ) ) ( not ( = ?auto_733544 ?auto_733549 ) ) ( not ( = ?auto_733544 ?auto_733550 ) ) ( not ( = ?auto_733545 ?auto_733546 ) ) ( not ( = ?auto_733545 ?auto_733547 ) ) ( not ( = ?auto_733545 ?auto_733548 ) ) ( not ( = ?auto_733545 ?auto_733549 ) ) ( not ( = ?auto_733545 ?auto_733550 ) ) ( not ( = ?auto_733546 ?auto_733547 ) ) ( not ( = ?auto_733546 ?auto_733548 ) ) ( not ( = ?auto_733546 ?auto_733549 ) ) ( not ( = ?auto_733546 ?auto_733550 ) ) ( not ( = ?auto_733547 ?auto_733548 ) ) ( not ( = ?auto_733547 ?auto_733549 ) ) ( not ( = ?auto_733547 ?auto_733550 ) ) ( not ( = ?auto_733548 ?auto_733549 ) ) ( not ( = ?auto_733548 ?auto_733550 ) ) ( not ( = ?auto_733549 ?auto_733550 ) ) ( ON ?auto_733548 ?auto_733549 ) ( CLEAR ?auto_733546 ) ( ON ?auto_733547 ?auto_733548 ) ( CLEAR ?auto_733547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_733540 ?auto_733541 ?auto_733542 ?auto_733543 ?auto_733544 ?auto_733545 ?auto_733546 ?auto_733547 )
      ( MAKE-10PILE ?auto_733540 ?auto_733541 ?auto_733542 ?auto_733543 ?auto_733544 ?auto_733545 ?auto_733546 ?auto_733547 ?auto_733548 ?auto_733549 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733582 - BLOCK
      ?auto_733583 - BLOCK
      ?auto_733584 - BLOCK
      ?auto_733585 - BLOCK
      ?auto_733586 - BLOCK
      ?auto_733587 - BLOCK
      ?auto_733588 - BLOCK
      ?auto_733589 - BLOCK
      ?auto_733590 - BLOCK
      ?auto_733591 - BLOCK
    )
    :vars
    (
      ?auto_733592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733591 ?auto_733592 ) ( ON-TABLE ?auto_733582 ) ( ON ?auto_733583 ?auto_733582 ) ( ON ?auto_733584 ?auto_733583 ) ( ON ?auto_733585 ?auto_733584 ) ( ON ?auto_733586 ?auto_733585 ) ( ON ?auto_733587 ?auto_733586 ) ( not ( = ?auto_733582 ?auto_733583 ) ) ( not ( = ?auto_733582 ?auto_733584 ) ) ( not ( = ?auto_733582 ?auto_733585 ) ) ( not ( = ?auto_733582 ?auto_733586 ) ) ( not ( = ?auto_733582 ?auto_733587 ) ) ( not ( = ?auto_733582 ?auto_733588 ) ) ( not ( = ?auto_733582 ?auto_733589 ) ) ( not ( = ?auto_733582 ?auto_733590 ) ) ( not ( = ?auto_733582 ?auto_733591 ) ) ( not ( = ?auto_733582 ?auto_733592 ) ) ( not ( = ?auto_733583 ?auto_733584 ) ) ( not ( = ?auto_733583 ?auto_733585 ) ) ( not ( = ?auto_733583 ?auto_733586 ) ) ( not ( = ?auto_733583 ?auto_733587 ) ) ( not ( = ?auto_733583 ?auto_733588 ) ) ( not ( = ?auto_733583 ?auto_733589 ) ) ( not ( = ?auto_733583 ?auto_733590 ) ) ( not ( = ?auto_733583 ?auto_733591 ) ) ( not ( = ?auto_733583 ?auto_733592 ) ) ( not ( = ?auto_733584 ?auto_733585 ) ) ( not ( = ?auto_733584 ?auto_733586 ) ) ( not ( = ?auto_733584 ?auto_733587 ) ) ( not ( = ?auto_733584 ?auto_733588 ) ) ( not ( = ?auto_733584 ?auto_733589 ) ) ( not ( = ?auto_733584 ?auto_733590 ) ) ( not ( = ?auto_733584 ?auto_733591 ) ) ( not ( = ?auto_733584 ?auto_733592 ) ) ( not ( = ?auto_733585 ?auto_733586 ) ) ( not ( = ?auto_733585 ?auto_733587 ) ) ( not ( = ?auto_733585 ?auto_733588 ) ) ( not ( = ?auto_733585 ?auto_733589 ) ) ( not ( = ?auto_733585 ?auto_733590 ) ) ( not ( = ?auto_733585 ?auto_733591 ) ) ( not ( = ?auto_733585 ?auto_733592 ) ) ( not ( = ?auto_733586 ?auto_733587 ) ) ( not ( = ?auto_733586 ?auto_733588 ) ) ( not ( = ?auto_733586 ?auto_733589 ) ) ( not ( = ?auto_733586 ?auto_733590 ) ) ( not ( = ?auto_733586 ?auto_733591 ) ) ( not ( = ?auto_733586 ?auto_733592 ) ) ( not ( = ?auto_733587 ?auto_733588 ) ) ( not ( = ?auto_733587 ?auto_733589 ) ) ( not ( = ?auto_733587 ?auto_733590 ) ) ( not ( = ?auto_733587 ?auto_733591 ) ) ( not ( = ?auto_733587 ?auto_733592 ) ) ( not ( = ?auto_733588 ?auto_733589 ) ) ( not ( = ?auto_733588 ?auto_733590 ) ) ( not ( = ?auto_733588 ?auto_733591 ) ) ( not ( = ?auto_733588 ?auto_733592 ) ) ( not ( = ?auto_733589 ?auto_733590 ) ) ( not ( = ?auto_733589 ?auto_733591 ) ) ( not ( = ?auto_733589 ?auto_733592 ) ) ( not ( = ?auto_733590 ?auto_733591 ) ) ( not ( = ?auto_733590 ?auto_733592 ) ) ( not ( = ?auto_733591 ?auto_733592 ) ) ( ON ?auto_733590 ?auto_733591 ) ( ON ?auto_733589 ?auto_733590 ) ( CLEAR ?auto_733587 ) ( ON ?auto_733588 ?auto_733589 ) ( CLEAR ?auto_733588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_733582 ?auto_733583 ?auto_733584 ?auto_733585 ?auto_733586 ?auto_733587 ?auto_733588 )
      ( MAKE-10PILE ?auto_733582 ?auto_733583 ?auto_733584 ?auto_733585 ?auto_733586 ?auto_733587 ?auto_733588 ?auto_733589 ?auto_733590 ?auto_733591 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733624 - BLOCK
      ?auto_733625 - BLOCK
      ?auto_733626 - BLOCK
      ?auto_733627 - BLOCK
      ?auto_733628 - BLOCK
      ?auto_733629 - BLOCK
      ?auto_733630 - BLOCK
      ?auto_733631 - BLOCK
      ?auto_733632 - BLOCK
      ?auto_733633 - BLOCK
    )
    :vars
    (
      ?auto_733634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733633 ?auto_733634 ) ( ON-TABLE ?auto_733624 ) ( ON ?auto_733625 ?auto_733624 ) ( ON ?auto_733626 ?auto_733625 ) ( ON ?auto_733627 ?auto_733626 ) ( ON ?auto_733628 ?auto_733627 ) ( not ( = ?auto_733624 ?auto_733625 ) ) ( not ( = ?auto_733624 ?auto_733626 ) ) ( not ( = ?auto_733624 ?auto_733627 ) ) ( not ( = ?auto_733624 ?auto_733628 ) ) ( not ( = ?auto_733624 ?auto_733629 ) ) ( not ( = ?auto_733624 ?auto_733630 ) ) ( not ( = ?auto_733624 ?auto_733631 ) ) ( not ( = ?auto_733624 ?auto_733632 ) ) ( not ( = ?auto_733624 ?auto_733633 ) ) ( not ( = ?auto_733624 ?auto_733634 ) ) ( not ( = ?auto_733625 ?auto_733626 ) ) ( not ( = ?auto_733625 ?auto_733627 ) ) ( not ( = ?auto_733625 ?auto_733628 ) ) ( not ( = ?auto_733625 ?auto_733629 ) ) ( not ( = ?auto_733625 ?auto_733630 ) ) ( not ( = ?auto_733625 ?auto_733631 ) ) ( not ( = ?auto_733625 ?auto_733632 ) ) ( not ( = ?auto_733625 ?auto_733633 ) ) ( not ( = ?auto_733625 ?auto_733634 ) ) ( not ( = ?auto_733626 ?auto_733627 ) ) ( not ( = ?auto_733626 ?auto_733628 ) ) ( not ( = ?auto_733626 ?auto_733629 ) ) ( not ( = ?auto_733626 ?auto_733630 ) ) ( not ( = ?auto_733626 ?auto_733631 ) ) ( not ( = ?auto_733626 ?auto_733632 ) ) ( not ( = ?auto_733626 ?auto_733633 ) ) ( not ( = ?auto_733626 ?auto_733634 ) ) ( not ( = ?auto_733627 ?auto_733628 ) ) ( not ( = ?auto_733627 ?auto_733629 ) ) ( not ( = ?auto_733627 ?auto_733630 ) ) ( not ( = ?auto_733627 ?auto_733631 ) ) ( not ( = ?auto_733627 ?auto_733632 ) ) ( not ( = ?auto_733627 ?auto_733633 ) ) ( not ( = ?auto_733627 ?auto_733634 ) ) ( not ( = ?auto_733628 ?auto_733629 ) ) ( not ( = ?auto_733628 ?auto_733630 ) ) ( not ( = ?auto_733628 ?auto_733631 ) ) ( not ( = ?auto_733628 ?auto_733632 ) ) ( not ( = ?auto_733628 ?auto_733633 ) ) ( not ( = ?auto_733628 ?auto_733634 ) ) ( not ( = ?auto_733629 ?auto_733630 ) ) ( not ( = ?auto_733629 ?auto_733631 ) ) ( not ( = ?auto_733629 ?auto_733632 ) ) ( not ( = ?auto_733629 ?auto_733633 ) ) ( not ( = ?auto_733629 ?auto_733634 ) ) ( not ( = ?auto_733630 ?auto_733631 ) ) ( not ( = ?auto_733630 ?auto_733632 ) ) ( not ( = ?auto_733630 ?auto_733633 ) ) ( not ( = ?auto_733630 ?auto_733634 ) ) ( not ( = ?auto_733631 ?auto_733632 ) ) ( not ( = ?auto_733631 ?auto_733633 ) ) ( not ( = ?auto_733631 ?auto_733634 ) ) ( not ( = ?auto_733632 ?auto_733633 ) ) ( not ( = ?auto_733632 ?auto_733634 ) ) ( not ( = ?auto_733633 ?auto_733634 ) ) ( ON ?auto_733632 ?auto_733633 ) ( ON ?auto_733631 ?auto_733632 ) ( ON ?auto_733630 ?auto_733631 ) ( CLEAR ?auto_733628 ) ( ON ?auto_733629 ?auto_733630 ) ( CLEAR ?auto_733629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_733624 ?auto_733625 ?auto_733626 ?auto_733627 ?auto_733628 ?auto_733629 )
      ( MAKE-10PILE ?auto_733624 ?auto_733625 ?auto_733626 ?auto_733627 ?auto_733628 ?auto_733629 ?auto_733630 ?auto_733631 ?auto_733632 ?auto_733633 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733666 - BLOCK
      ?auto_733667 - BLOCK
      ?auto_733668 - BLOCK
      ?auto_733669 - BLOCK
      ?auto_733670 - BLOCK
      ?auto_733671 - BLOCK
      ?auto_733672 - BLOCK
      ?auto_733673 - BLOCK
      ?auto_733674 - BLOCK
      ?auto_733675 - BLOCK
    )
    :vars
    (
      ?auto_733676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733675 ?auto_733676 ) ( ON-TABLE ?auto_733666 ) ( ON ?auto_733667 ?auto_733666 ) ( ON ?auto_733668 ?auto_733667 ) ( ON ?auto_733669 ?auto_733668 ) ( not ( = ?auto_733666 ?auto_733667 ) ) ( not ( = ?auto_733666 ?auto_733668 ) ) ( not ( = ?auto_733666 ?auto_733669 ) ) ( not ( = ?auto_733666 ?auto_733670 ) ) ( not ( = ?auto_733666 ?auto_733671 ) ) ( not ( = ?auto_733666 ?auto_733672 ) ) ( not ( = ?auto_733666 ?auto_733673 ) ) ( not ( = ?auto_733666 ?auto_733674 ) ) ( not ( = ?auto_733666 ?auto_733675 ) ) ( not ( = ?auto_733666 ?auto_733676 ) ) ( not ( = ?auto_733667 ?auto_733668 ) ) ( not ( = ?auto_733667 ?auto_733669 ) ) ( not ( = ?auto_733667 ?auto_733670 ) ) ( not ( = ?auto_733667 ?auto_733671 ) ) ( not ( = ?auto_733667 ?auto_733672 ) ) ( not ( = ?auto_733667 ?auto_733673 ) ) ( not ( = ?auto_733667 ?auto_733674 ) ) ( not ( = ?auto_733667 ?auto_733675 ) ) ( not ( = ?auto_733667 ?auto_733676 ) ) ( not ( = ?auto_733668 ?auto_733669 ) ) ( not ( = ?auto_733668 ?auto_733670 ) ) ( not ( = ?auto_733668 ?auto_733671 ) ) ( not ( = ?auto_733668 ?auto_733672 ) ) ( not ( = ?auto_733668 ?auto_733673 ) ) ( not ( = ?auto_733668 ?auto_733674 ) ) ( not ( = ?auto_733668 ?auto_733675 ) ) ( not ( = ?auto_733668 ?auto_733676 ) ) ( not ( = ?auto_733669 ?auto_733670 ) ) ( not ( = ?auto_733669 ?auto_733671 ) ) ( not ( = ?auto_733669 ?auto_733672 ) ) ( not ( = ?auto_733669 ?auto_733673 ) ) ( not ( = ?auto_733669 ?auto_733674 ) ) ( not ( = ?auto_733669 ?auto_733675 ) ) ( not ( = ?auto_733669 ?auto_733676 ) ) ( not ( = ?auto_733670 ?auto_733671 ) ) ( not ( = ?auto_733670 ?auto_733672 ) ) ( not ( = ?auto_733670 ?auto_733673 ) ) ( not ( = ?auto_733670 ?auto_733674 ) ) ( not ( = ?auto_733670 ?auto_733675 ) ) ( not ( = ?auto_733670 ?auto_733676 ) ) ( not ( = ?auto_733671 ?auto_733672 ) ) ( not ( = ?auto_733671 ?auto_733673 ) ) ( not ( = ?auto_733671 ?auto_733674 ) ) ( not ( = ?auto_733671 ?auto_733675 ) ) ( not ( = ?auto_733671 ?auto_733676 ) ) ( not ( = ?auto_733672 ?auto_733673 ) ) ( not ( = ?auto_733672 ?auto_733674 ) ) ( not ( = ?auto_733672 ?auto_733675 ) ) ( not ( = ?auto_733672 ?auto_733676 ) ) ( not ( = ?auto_733673 ?auto_733674 ) ) ( not ( = ?auto_733673 ?auto_733675 ) ) ( not ( = ?auto_733673 ?auto_733676 ) ) ( not ( = ?auto_733674 ?auto_733675 ) ) ( not ( = ?auto_733674 ?auto_733676 ) ) ( not ( = ?auto_733675 ?auto_733676 ) ) ( ON ?auto_733674 ?auto_733675 ) ( ON ?auto_733673 ?auto_733674 ) ( ON ?auto_733672 ?auto_733673 ) ( ON ?auto_733671 ?auto_733672 ) ( CLEAR ?auto_733669 ) ( ON ?auto_733670 ?auto_733671 ) ( CLEAR ?auto_733670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_733666 ?auto_733667 ?auto_733668 ?auto_733669 ?auto_733670 )
      ( MAKE-10PILE ?auto_733666 ?auto_733667 ?auto_733668 ?auto_733669 ?auto_733670 ?auto_733671 ?auto_733672 ?auto_733673 ?auto_733674 ?auto_733675 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733708 - BLOCK
      ?auto_733709 - BLOCK
      ?auto_733710 - BLOCK
      ?auto_733711 - BLOCK
      ?auto_733712 - BLOCK
      ?auto_733713 - BLOCK
      ?auto_733714 - BLOCK
      ?auto_733715 - BLOCK
      ?auto_733716 - BLOCK
      ?auto_733717 - BLOCK
    )
    :vars
    (
      ?auto_733718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733717 ?auto_733718 ) ( ON-TABLE ?auto_733708 ) ( ON ?auto_733709 ?auto_733708 ) ( ON ?auto_733710 ?auto_733709 ) ( not ( = ?auto_733708 ?auto_733709 ) ) ( not ( = ?auto_733708 ?auto_733710 ) ) ( not ( = ?auto_733708 ?auto_733711 ) ) ( not ( = ?auto_733708 ?auto_733712 ) ) ( not ( = ?auto_733708 ?auto_733713 ) ) ( not ( = ?auto_733708 ?auto_733714 ) ) ( not ( = ?auto_733708 ?auto_733715 ) ) ( not ( = ?auto_733708 ?auto_733716 ) ) ( not ( = ?auto_733708 ?auto_733717 ) ) ( not ( = ?auto_733708 ?auto_733718 ) ) ( not ( = ?auto_733709 ?auto_733710 ) ) ( not ( = ?auto_733709 ?auto_733711 ) ) ( not ( = ?auto_733709 ?auto_733712 ) ) ( not ( = ?auto_733709 ?auto_733713 ) ) ( not ( = ?auto_733709 ?auto_733714 ) ) ( not ( = ?auto_733709 ?auto_733715 ) ) ( not ( = ?auto_733709 ?auto_733716 ) ) ( not ( = ?auto_733709 ?auto_733717 ) ) ( not ( = ?auto_733709 ?auto_733718 ) ) ( not ( = ?auto_733710 ?auto_733711 ) ) ( not ( = ?auto_733710 ?auto_733712 ) ) ( not ( = ?auto_733710 ?auto_733713 ) ) ( not ( = ?auto_733710 ?auto_733714 ) ) ( not ( = ?auto_733710 ?auto_733715 ) ) ( not ( = ?auto_733710 ?auto_733716 ) ) ( not ( = ?auto_733710 ?auto_733717 ) ) ( not ( = ?auto_733710 ?auto_733718 ) ) ( not ( = ?auto_733711 ?auto_733712 ) ) ( not ( = ?auto_733711 ?auto_733713 ) ) ( not ( = ?auto_733711 ?auto_733714 ) ) ( not ( = ?auto_733711 ?auto_733715 ) ) ( not ( = ?auto_733711 ?auto_733716 ) ) ( not ( = ?auto_733711 ?auto_733717 ) ) ( not ( = ?auto_733711 ?auto_733718 ) ) ( not ( = ?auto_733712 ?auto_733713 ) ) ( not ( = ?auto_733712 ?auto_733714 ) ) ( not ( = ?auto_733712 ?auto_733715 ) ) ( not ( = ?auto_733712 ?auto_733716 ) ) ( not ( = ?auto_733712 ?auto_733717 ) ) ( not ( = ?auto_733712 ?auto_733718 ) ) ( not ( = ?auto_733713 ?auto_733714 ) ) ( not ( = ?auto_733713 ?auto_733715 ) ) ( not ( = ?auto_733713 ?auto_733716 ) ) ( not ( = ?auto_733713 ?auto_733717 ) ) ( not ( = ?auto_733713 ?auto_733718 ) ) ( not ( = ?auto_733714 ?auto_733715 ) ) ( not ( = ?auto_733714 ?auto_733716 ) ) ( not ( = ?auto_733714 ?auto_733717 ) ) ( not ( = ?auto_733714 ?auto_733718 ) ) ( not ( = ?auto_733715 ?auto_733716 ) ) ( not ( = ?auto_733715 ?auto_733717 ) ) ( not ( = ?auto_733715 ?auto_733718 ) ) ( not ( = ?auto_733716 ?auto_733717 ) ) ( not ( = ?auto_733716 ?auto_733718 ) ) ( not ( = ?auto_733717 ?auto_733718 ) ) ( ON ?auto_733716 ?auto_733717 ) ( ON ?auto_733715 ?auto_733716 ) ( ON ?auto_733714 ?auto_733715 ) ( ON ?auto_733713 ?auto_733714 ) ( ON ?auto_733712 ?auto_733713 ) ( CLEAR ?auto_733710 ) ( ON ?auto_733711 ?auto_733712 ) ( CLEAR ?auto_733711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_733708 ?auto_733709 ?auto_733710 ?auto_733711 )
      ( MAKE-10PILE ?auto_733708 ?auto_733709 ?auto_733710 ?auto_733711 ?auto_733712 ?auto_733713 ?auto_733714 ?auto_733715 ?auto_733716 ?auto_733717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733750 - BLOCK
      ?auto_733751 - BLOCK
      ?auto_733752 - BLOCK
      ?auto_733753 - BLOCK
      ?auto_733754 - BLOCK
      ?auto_733755 - BLOCK
      ?auto_733756 - BLOCK
      ?auto_733757 - BLOCK
      ?auto_733758 - BLOCK
      ?auto_733759 - BLOCK
    )
    :vars
    (
      ?auto_733760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733759 ?auto_733760 ) ( ON-TABLE ?auto_733750 ) ( ON ?auto_733751 ?auto_733750 ) ( not ( = ?auto_733750 ?auto_733751 ) ) ( not ( = ?auto_733750 ?auto_733752 ) ) ( not ( = ?auto_733750 ?auto_733753 ) ) ( not ( = ?auto_733750 ?auto_733754 ) ) ( not ( = ?auto_733750 ?auto_733755 ) ) ( not ( = ?auto_733750 ?auto_733756 ) ) ( not ( = ?auto_733750 ?auto_733757 ) ) ( not ( = ?auto_733750 ?auto_733758 ) ) ( not ( = ?auto_733750 ?auto_733759 ) ) ( not ( = ?auto_733750 ?auto_733760 ) ) ( not ( = ?auto_733751 ?auto_733752 ) ) ( not ( = ?auto_733751 ?auto_733753 ) ) ( not ( = ?auto_733751 ?auto_733754 ) ) ( not ( = ?auto_733751 ?auto_733755 ) ) ( not ( = ?auto_733751 ?auto_733756 ) ) ( not ( = ?auto_733751 ?auto_733757 ) ) ( not ( = ?auto_733751 ?auto_733758 ) ) ( not ( = ?auto_733751 ?auto_733759 ) ) ( not ( = ?auto_733751 ?auto_733760 ) ) ( not ( = ?auto_733752 ?auto_733753 ) ) ( not ( = ?auto_733752 ?auto_733754 ) ) ( not ( = ?auto_733752 ?auto_733755 ) ) ( not ( = ?auto_733752 ?auto_733756 ) ) ( not ( = ?auto_733752 ?auto_733757 ) ) ( not ( = ?auto_733752 ?auto_733758 ) ) ( not ( = ?auto_733752 ?auto_733759 ) ) ( not ( = ?auto_733752 ?auto_733760 ) ) ( not ( = ?auto_733753 ?auto_733754 ) ) ( not ( = ?auto_733753 ?auto_733755 ) ) ( not ( = ?auto_733753 ?auto_733756 ) ) ( not ( = ?auto_733753 ?auto_733757 ) ) ( not ( = ?auto_733753 ?auto_733758 ) ) ( not ( = ?auto_733753 ?auto_733759 ) ) ( not ( = ?auto_733753 ?auto_733760 ) ) ( not ( = ?auto_733754 ?auto_733755 ) ) ( not ( = ?auto_733754 ?auto_733756 ) ) ( not ( = ?auto_733754 ?auto_733757 ) ) ( not ( = ?auto_733754 ?auto_733758 ) ) ( not ( = ?auto_733754 ?auto_733759 ) ) ( not ( = ?auto_733754 ?auto_733760 ) ) ( not ( = ?auto_733755 ?auto_733756 ) ) ( not ( = ?auto_733755 ?auto_733757 ) ) ( not ( = ?auto_733755 ?auto_733758 ) ) ( not ( = ?auto_733755 ?auto_733759 ) ) ( not ( = ?auto_733755 ?auto_733760 ) ) ( not ( = ?auto_733756 ?auto_733757 ) ) ( not ( = ?auto_733756 ?auto_733758 ) ) ( not ( = ?auto_733756 ?auto_733759 ) ) ( not ( = ?auto_733756 ?auto_733760 ) ) ( not ( = ?auto_733757 ?auto_733758 ) ) ( not ( = ?auto_733757 ?auto_733759 ) ) ( not ( = ?auto_733757 ?auto_733760 ) ) ( not ( = ?auto_733758 ?auto_733759 ) ) ( not ( = ?auto_733758 ?auto_733760 ) ) ( not ( = ?auto_733759 ?auto_733760 ) ) ( ON ?auto_733758 ?auto_733759 ) ( ON ?auto_733757 ?auto_733758 ) ( ON ?auto_733756 ?auto_733757 ) ( ON ?auto_733755 ?auto_733756 ) ( ON ?auto_733754 ?auto_733755 ) ( ON ?auto_733753 ?auto_733754 ) ( CLEAR ?auto_733751 ) ( ON ?auto_733752 ?auto_733753 ) ( CLEAR ?auto_733752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_733750 ?auto_733751 ?auto_733752 )
      ( MAKE-10PILE ?auto_733750 ?auto_733751 ?auto_733752 ?auto_733753 ?auto_733754 ?auto_733755 ?auto_733756 ?auto_733757 ?auto_733758 ?auto_733759 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733792 - BLOCK
      ?auto_733793 - BLOCK
      ?auto_733794 - BLOCK
      ?auto_733795 - BLOCK
      ?auto_733796 - BLOCK
      ?auto_733797 - BLOCK
      ?auto_733798 - BLOCK
      ?auto_733799 - BLOCK
      ?auto_733800 - BLOCK
      ?auto_733801 - BLOCK
    )
    :vars
    (
      ?auto_733802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733801 ?auto_733802 ) ( ON-TABLE ?auto_733792 ) ( not ( = ?auto_733792 ?auto_733793 ) ) ( not ( = ?auto_733792 ?auto_733794 ) ) ( not ( = ?auto_733792 ?auto_733795 ) ) ( not ( = ?auto_733792 ?auto_733796 ) ) ( not ( = ?auto_733792 ?auto_733797 ) ) ( not ( = ?auto_733792 ?auto_733798 ) ) ( not ( = ?auto_733792 ?auto_733799 ) ) ( not ( = ?auto_733792 ?auto_733800 ) ) ( not ( = ?auto_733792 ?auto_733801 ) ) ( not ( = ?auto_733792 ?auto_733802 ) ) ( not ( = ?auto_733793 ?auto_733794 ) ) ( not ( = ?auto_733793 ?auto_733795 ) ) ( not ( = ?auto_733793 ?auto_733796 ) ) ( not ( = ?auto_733793 ?auto_733797 ) ) ( not ( = ?auto_733793 ?auto_733798 ) ) ( not ( = ?auto_733793 ?auto_733799 ) ) ( not ( = ?auto_733793 ?auto_733800 ) ) ( not ( = ?auto_733793 ?auto_733801 ) ) ( not ( = ?auto_733793 ?auto_733802 ) ) ( not ( = ?auto_733794 ?auto_733795 ) ) ( not ( = ?auto_733794 ?auto_733796 ) ) ( not ( = ?auto_733794 ?auto_733797 ) ) ( not ( = ?auto_733794 ?auto_733798 ) ) ( not ( = ?auto_733794 ?auto_733799 ) ) ( not ( = ?auto_733794 ?auto_733800 ) ) ( not ( = ?auto_733794 ?auto_733801 ) ) ( not ( = ?auto_733794 ?auto_733802 ) ) ( not ( = ?auto_733795 ?auto_733796 ) ) ( not ( = ?auto_733795 ?auto_733797 ) ) ( not ( = ?auto_733795 ?auto_733798 ) ) ( not ( = ?auto_733795 ?auto_733799 ) ) ( not ( = ?auto_733795 ?auto_733800 ) ) ( not ( = ?auto_733795 ?auto_733801 ) ) ( not ( = ?auto_733795 ?auto_733802 ) ) ( not ( = ?auto_733796 ?auto_733797 ) ) ( not ( = ?auto_733796 ?auto_733798 ) ) ( not ( = ?auto_733796 ?auto_733799 ) ) ( not ( = ?auto_733796 ?auto_733800 ) ) ( not ( = ?auto_733796 ?auto_733801 ) ) ( not ( = ?auto_733796 ?auto_733802 ) ) ( not ( = ?auto_733797 ?auto_733798 ) ) ( not ( = ?auto_733797 ?auto_733799 ) ) ( not ( = ?auto_733797 ?auto_733800 ) ) ( not ( = ?auto_733797 ?auto_733801 ) ) ( not ( = ?auto_733797 ?auto_733802 ) ) ( not ( = ?auto_733798 ?auto_733799 ) ) ( not ( = ?auto_733798 ?auto_733800 ) ) ( not ( = ?auto_733798 ?auto_733801 ) ) ( not ( = ?auto_733798 ?auto_733802 ) ) ( not ( = ?auto_733799 ?auto_733800 ) ) ( not ( = ?auto_733799 ?auto_733801 ) ) ( not ( = ?auto_733799 ?auto_733802 ) ) ( not ( = ?auto_733800 ?auto_733801 ) ) ( not ( = ?auto_733800 ?auto_733802 ) ) ( not ( = ?auto_733801 ?auto_733802 ) ) ( ON ?auto_733800 ?auto_733801 ) ( ON ?auto_733799 ?auto_733800 ) ( ON ?auto_733798 ?auto_733799 ) ( ON ?auto_733797 ?auto_733798 ) ( ON ?auto_733796 ?auto_733797 ) ( ON ?auto_733795 ?auto_733796 ) ( ON ?auto_733794 ?auto_733795 ) ( CLEAR ?auto_733792 ) ( ON ?auto_733793 ?auto_733794 ) ( CLEAR ?auto_733793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_733792 ?auto_733793 )
      ( MAKE-10PILE ?auto_733792 ?auto_733793 ?auto_733794 ?auto_733795 ?auto_733796 ?auto_733797 ?auto_733798 ?auto_733799 ?auto_733800 ?auto_733801 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_733834 - BLOCK
      ?auto_733835 - BLOCK
      ?auto_733836 - BLOCK
      ?auto_733837 - BLOCK
      ?auto_733838 - BLOCK
      ?auto_733839 - BLOCK
      ?auto_733840 - BLOCK
      ?auto_733841 - BLOCK
      ?auto_733842 - BLOCK
      ?auto_733843 - BLOCK
    )
    :vars
    (
      ?auto_733844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733843 ?auto_733844 ) ( not ( = ?auto_733834 ?auto_733835 ) ) ( not ( = ?auto_733834 ?auto_733836 ) ) ( not ( = ?auto_733834 ?auto_733837 ) ) ( not ( = ?auto_733834 ?auto_733838 ) ) ( not ( = ?auto_733834 ?auto_733839 ) ) ( not ( = ?auto_733834 ?auto_733840 ) ) ( not ( = ?auto_733834 ?auto_733841 ) ) ( not ( = ?auto_733834 ?auto_733842 ) ) ( not ( = ?auto_733834 ?auto_733843 ) ) ( not ( = ?auto_733834 ?auto_733844 ) ) ( not ( = ?auto_733835 ?auto_733836 ) ) ( not ( = ?auto_733835 ?auto_733837 ) ) ( not ( = ?auto_733835 ?auto_733838 ) ) ( not ( = ?auto_733835 ?auto_733839 ) ) ( not ( = ?auto_733835 ?auto_733840 ) ) ( not ( = ?auto_733835 ?auto_733841 ) ) ( not ( = ?auto_733835 ?auto_733842 ) ) ( not ( = ?auto_733835 ?auto_733843 ) ) ( not ( = ?auto_733835 ?auto_733844 ) ) ( not ( = ?auto_733836 ?auto_733837 ) ) ( not ( = ?auto_733836 ?auto_733838 ) ) ( not ( = ?auto_733836 ?auto_733839 ) ) ( not ( = ?auto_733836 ?auto_733840 ) ) ( not ( = ?auto_733836 ?auto_733841 ) ) ( not ( = ?auto_733836 ?auto_733842 ) ) ( not ( = ?auto_733836 ?auto_733843 ) ) ( not ( = ?auto_733836 ?auto_733844 ) ) ( not ( = ?auto_733837 ?auto_733838 ) ) ( not ( = ?auto_733837 ?auto_733839 ) ) ( not ( = ?auto_733837 ?auto_733840 ) ) ( not ( = ?auto_733837 ?auto_733841 ) ) ( not ( = ?auto_733837 ?auto_733842 ) ) ( not ( = ?auto_733837 ?auto_733843 ) ) ( not ( = ?auto_733837 ?auto_733844 ) ) ( not ( = ?auto_733838 ?auto_733839 ) ) ( not ( = ?auto_733838 ?auto_733840 ) ) ( not ( = ?auto_733838 ?auto_733841 ) ) ( not ( = ?auto_733838 ?auto_733842 ) ) ( not ( = ?auto_733838 ?auto_733843 ) ) ( not ( = ?auto_733838 ?auto_733844 ) ) ( not ( = ?auto_733839 ?auto_733840 ) ) ( not ( = ?auto_733839 ?auto_733841 ) ) ( not ( = ?auto_733839 ?auto_733842 ) ) ( not ( = ?auto_733839 ?auto_733843 ) ) ( not ( = ?auto_733839 ?auto_733844 ) ) ( not ( = ?auto_733840 ?auto_733841 ) ) ( not ( = ?auto_733840 ?auto_733842 ) ) ( not ( = ?auto_733840 ?auto_733843 ) ) ( not ( = ?auto_733840 ?auto_733844 ) ) ( not ( = ?auto_733841 ?auto_733842 ) ) ( not ( = ?auto_733841 ?auto_733843 ) ) ( not ( = ?auto_733841 ?auto_733844 ) ) ( not ( = ?auto_733842 ?auto_733843 ) ) ( not ( = ?auto_733842 ?auto_733844 ) ) ( not ( = ?auto_733843 ?auto_733844 ) ) ( ON ?auto_733842 ?auto_733843 ) ( ON ?auto_733841 ?auto_733842 ) ( ON ?auto_733840 ?auto_733841 ) ( ON ?auto_733839 ?auto_733840 ) ( ON ?auto_733838 ?auto_733839 ) ( ON ?auto_733837 ?auto_733838 ) ( ON ?auto_733836 ?auto_733837 ) ( ON ?auto_733835 ?auto_733836 ) ( ON ?auto_733834 ?auto_733835 ) ( CLEAR ?auto_733834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_733834 )
      ( MAKE-10PILE ?auto_733834 ?auto_733835 ?auto_733836 ?auto_733837 ?auto_733838 ?auto_733839 ?auto_733840 ?auto_733841 ?auto_733842 ?auto_733843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_733877 - BLOCK
      ?auto_733878 - BLOCK
      ?auto_733879 - BLOCK
      ?auto_733880 - BLOCK
      ?auto_733881 - BLOCK
      ?auto_733882 - BLOCK
      ?auto_733883 - BLOCK
      ?auto_733884 - BLOCK
      ?auto_733885 - BLOCK
      ?auto_733886 - BLOCK
      ?auto_733887 - BLOCK
    )
    :vars
    (
      ?auto_733888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_733886 ) ( ON ?auto_733887 ?auto_733888 ) ( CLEAR ?auto_733887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_733877 ) ( ON ?auto_733878 ?auto_733877 ) ( ON ?auto_733879 ?auto_733878 ) ( ON ?auto_733880 ?auto_733879 ) ( ON ?auto_733881 ?auto_733880 ) ( ON ?auto_733882 ?auto_733881 ) ( ON ?auto_733883 ?auto_733882 ) ( ON ?auto_733884 ?auto_733883 ) ( ON ?auto_733885 ?auto_733884 ) ( ON ?auto_733886 ?auto_733885 ) ( not ( = ?auto_733877 ?auto_733878 ) ) ( not ( = ?auto_733877 ?auto_733879 ) ) ( not ( = ?auto_733877 ?auto_733880 ) ) ( not ( = ?auto_733877 ?auto_733881 ) ) ( not ( = ?auto_733877 ?auto_733882 ) ) ( not ( = ?auto_733877 ?auto_733883 ) ) ( not ( = ?auto_733877 ?auto_733884 ) ) ( not ( = ?auto_733877 ?auto_733885 ) ) ( not ( = ?auto_733877 ?auto_733886 ) ) ( not ( = ?auto_733877 ?auto_733887 ) ) ( not ( = ?auto_733877 ?auto_733888 ) ) ( not ( = ?auto_733878 ?auto_733879 ) ) ( not ( = ?auto_733878 ?auto_733880 ) ) ( not ( = ?auto_733878 ?auto_733881 ) ) ( not ( = ?auto_733878 ?auto_733882 ) ) ( not ( = ?auto_733878 ?auto_733883 ) ) ( not ( = ?auto_733878 ?auto_733884 ) ) ( not ( = ?auto_733878 ?auto_733885 ) ) ( not ( = ?auto_733878 ?auto_733886 ) ) ( not ( = ?auto_733878 ?auto_733887 ) ) ( not ( = ?auto_733878 ?auto_733888 ) ) ( not ( = ?auto_733879 ?auto_733880 ) ) ( not ( = ?auto_733879 ?auto_733881 ) ) ( not ( = ?auto_733879 ?auto_733882 ) ) ( not ( = ?auto_733879 ?auto_733883 ) ) ( not ( = ?auto_733879 ?auto_733884 ) ) ( not ( = ?auto_733879 ?auto_733885 ) ) ( not ( = ?auto_733879 ?auto_733886 ) ) ( not ( = ?auto_733879 ?auto_733887 ) ) ( not ( = ?auto_733879 ?auto_733888 ) ) ( not ( = ?auto_733880 ?auto_733881 ) ) ( not ( = ?auto_733880 ?auto_733882 ) ) ( not ( = ?auto_733880 ?auto_733883 ) ) ( not ( = ?auto_733880 ?auto_733884 ) ) ( not ( = ?auto_733880 ?auto_733885 ) ) ( not ( = ?auto_733880 ?auto_733886 ) ) ( not ( = ?auto_733880 ?auto_733887 ) ) ( not ( = ?auto_733880 ?auto_733888 ) ) ( not ( = ?auto_733881 ?auto_733882 ) ) ( not ( = ?auto_733881 ?auto_733883 ) ) ( not ( = ?auto_733881 ?auto_733884 ) ) ( not ( = ?auto_733881 ?auto_733885 ) ) ( not ( = ?auto_733881 ?auto_733886 ) ) ( not ( = ?auto_733881 ?auto_733887 ) ) ( not ( = ?auto_733881 ?auto_733888 ) ) ( not ( = ?auto_733882 ?auto_733883 ) ) ( not ( = ?auto_733882 ?auto_733884 ) ) ( not ( = ?auto_733882 ?auto_733885 ) ) ( not ( = ?auto_733882 ?auto_733886 ) ) ( not ( = ?auto_733882 ?auto_733887 ) ) ( not ( = ?auto_733882 ?auto_733888 ) ) ( not ( = ?auto_733883 ?auto_733884 ) ) ( not ( = ?auto_733883 ?auto_733885 ) ) ( not ( = ?auto_733883 ?auto_733886 ) ) ( not ( = ?auto_733883 ?auto_733887 ) ) ( not ( = ?auto_733883 ?auto_733888 ) ) ( not ( = ?auto_733884 ?auto_733885 ) ) ( not ( = ?auto_733884 ?auto_733886 ) ) ( not ( = ?auto_733884 ?auto_733887 ) ) ( not ( = ?auto_733884 ?auto_733888 ) ) ( not ( = ?auto_733885 ?auto_733886 ) ) ( not ( = ?auto_733885 ?auto_733887 ) ) ( not ( = ?auto_733885 ?auto_733888 ) ) ( not ( = ?auto_733886 ?auto_733887 ) ) ( not ( = ?auto_733886 ?auto_733888 ) ) ( not ( = ?auto_733887 ?auto_733888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_733887 ?auto_733888 )
      ( !STACK ?auto_733887 ?auto_733886 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_733923 - BLOCK
      ?auto_733924 - BLOCK
      ?auto_733925 - BLOCK
      ?auto_733926 - BLOCK
      ?auto_733927 - BLOCK
      ?auto_733928 - BLOCK
      ?auto_733929 - BLOCK
      ?auto_733930 - BLOCK
      ?auto_733931 - BLOCK
      ?auto_733932 - BLOCK
      ?auto_733933 - BLOCK
    )
    :vars
    (
      ?auto_733934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733933 ?auto_733934 ) ( ON-TABLE ?auto_733923 ) ( ON ?auto_733924 ?auto_733923 ) ( ON ?auto_733925 ?auto_733924 ) ( ON ?auto_733926 ?auto_733925 ) ( ON ?auto_733927 ?auto_733926 ) ( ON ?auto_733928 ?auto_733927 ) ( ON ?auto_733929 ?auto_733928 ) ( ON ?auto_733930 ?auto_733929 ) ( ON ?auto_733931 ?auto_733930 ) ( not ( = ?auto_733923 ?auto_733924 ) ) ( not ( = ?auto_733923 ?auto_733925 ) ) ( not ( = ?auto_733923 ?auto_733926 ) ) ( not ( = ?auto_733923 ?auto_733927 ) ) ( not ( = ?auto_733923 ?auto_733928 ) ) ( not ( = ?auto_733923 ?auto_733929 ) ) ( not ( = ?auto_733923 ?auto_733930 ) ) ( not ( = ?auto_733923 ?auto_733931 ) ) ( not ( = ?auto_733923 ?auto_733932 ) ) ( not ( = ?auto_733923 ?auto_733933 ) ) ( not ( = ?auto_733923 ?auto_733934 ) ) ( not ( = ?auto_733924 ?auto_733925 ) ) ( not ( = ?auto_733924 ?auto_733926 ) ) ( not ( = ?auto_733924 ?auto_733927 ) ) ( not ( = ?auto_733924 ?auto_733928 ) ) ( not ( = ?auto_733924 ?auto_733929 ) ) ( not ( = ?auto_733924 ?auto_733930 ) ) ( not ( = ?auto_733924 ?auto_733931 ) ) ( not ( = ?auto_733924 ?auto_733932 ) ) ( not ( = ?auto_733924 ?auto_733933 ) ) ( not ( = ?auto_733924 ?auto_733934 ) ) ( not ( = ?auto_733925 ?auto_733926 ) ) ( not ( = ?auto_733925 ?auto_733927 ) ) ( not ( = ?auto_733925 ?auto_733928 ) ) ( not ( = ?auto_733925 ?auto_733929 ) ) ( not ( = ?auto_733925 ?auto_733930 ) ) ( not ( = ?auto_733925 ?auto_733931 ) ) ( not ( = ?auto_733925 ?auto_733932 ) ) ( not ( = ?auto_733925 ?auto_733933 ) ) ( not ( = ?auto_733925 ?auto_733934 ) ) ( not ( = ?auto_733926 ?auto_733927 ) ) ( not ( = ?auto_733926 ?auto_733928 ) ) ( not ( = ?auto_733926 ?auto_733929 ) ) ( not ( = ?auto_733926 ?auto_733930 ) ) ( not ( = ?auto_733926 ?auto_733931 ) ) ( not ( = ?auto_733926 ?auto_733932 ) ) ( not ( = ?auto_733926 ?auto_733933 ) ) ( not ( = ?auto_733926 ?auto_733934 ) ) ( not ( = ?auto_733927 ?auto_733928 ) ) ( not ( = ?auto_733927 ?auto_733929 ) ) ( not ( = ?auto_733927 ?auto_733930 ) ) ( not ( = ?auto_733927 ?auto_733931 ) ) ( not ( = ?auto_733927 ?auto_733932 ) ) ( not ( = ?auto_733927 ?auto_733933 ) ) ( not ( = ?auto_733927 ?auto_733934 ) ) ( not ( = ?auto_733928 ?auto_733929 ) ) ( not ( = ?auto_733928 ?auto_733930 ) ) ( not ( = ?auto_733928 ?auto_733931 ) ) ( not ( = ?auto_733928 ?auto_733932 ) ) ( not ( = ?auto_733928 ?auto_733933 ) ) ( not ( = ?auto_733928 ?auto_733934 ) ) ( not ( = ?auto_733929 ?auto_733930 ) ) ( not ( = ?auto_733929 ?auto_733931 ) ) ( not ( = ?auto_733929 ?auto_733932 ) ) ( not ( = ?auto_733929 ?auto_733933 ) ) ( not ( = ?auto_733929 ?auto_733934 ) ) ( not ( = ?auto_733930 ?auto_733931 ) ) ( not ( = ?auto_733930 ?auto_733932 ) ) ( not ( = ?auto_733930 ?auto_733933 ) ) ( not ( = ?auto_733930 ?auto_733934 ) ) ( not ( = ?auto_733931 ?auto_733932 ) ) ( not ( = ?auto_733931 ?auto_733933 ) ) ( not ( = ?auto_733931 ?auto_733934 ) ) ( not ( = ?auto_733932 ?auto_733933 ) ) ( not ( = ?auto_733932 ?auto_733934 ) ) ( not ( = ?auto_733933 ?auto_733934 ) ) ( CLEAR ?auto_733931 ) ( ON ?auto_733932 ?auto_733933 ) ( CLEAR ?auto_733932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_733923 ?auto_733924 ?auto_733925 ?auto_733926 ?auto_733927 ?auto_733928 ?auto_733929 ?auto_733930 ?auto_733931 ?auto_733932 )
      ( MAKE-11PILE ?auto_733923 ?auto_733924 ?auto_733925 ?auto_733926 ?auto_733927 ?auto_733928 ?auto_733929 ?auto_733930 ?auto_733931 ?auto_733932 ?auto_733933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_733969 - BLOCK
      ?auto_733970 - BLOCK
      ?auto_733971 - BLOCK
      ?auto_733972 - BLOCK
      ?auto_733973 - BLOCK
      ?auto_733974 - BLOCK
      ?auto_733975 - BLOCK
      ?auto_733976 - BLOCK
      ?auto_733977 - BLOCK
      ?auto_733978 - BLOCK
      ?auto_733979 - BLOCK
    )
    :vars
    (
      ?auto_733980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733979 ?auto_733980 ) ( ON-TABLE ?auto_733969 ) ( ON ?auto_733970 ?auto_733969 ) ( ON ?auto_733971 ?auto_733970 ) ( ON ?auto_733972 ?auto_733971 ) ( ON ?auto_733973 ?auto_733972 ) ( ON ?auto_733974 ?auto_733973 ) ( ON ?auto_733975 ?auto_733974 ) ( ON ?auto_733976 ?auto_733975 ) ( not ( = ?auto_733969 ?auto_733970 ) ) ( not ( = ?auto_733969 ?auto_733971 ) ) ( not ( = ?auto_733969 ?auto_733972 ) ) ( not ( = ?auto_733969 ?auto_733973 ) ) ( not ( = ?auto_733969 ?auto_733974 ) ) ( not ( = ?auto_733969 ?auto_733975 ) ) ( not ( = ?auto_733969 ?auto_733976 ) ) ( not ( = ?auto_733969 ?auto_733977 ) ) ( not ( = ?auto_733969 ?auto_733978 ) ) ( not ( = ?auto_733969 ?auto_733979 ) ) ( not ( = ?auto_733969 ?auto_733980 ) ) ( not ( = ?auto_733970 ?auto_733971 ) ) ( not ( = ?auto_733970 ?auto_733972 ) ) ( not ( = ?auto_733970 ?auto_733973 ) ) ( not ( = ?auto_733970 ?auto_733974 ) ) ( not ( = ?auto_733970 ?auto_733975 ) ) ( not ( = ?auto_733970 ?auto_733976 ) ) ( not ( = ?auto_733970 ?auto_733977 ) ) ( not ( = ?auto_733970 ?auto_733978 ) ) ( not ( = ?auto_733970 ?auto_733979 ) ) ( not ( = ?auto_733970 ?auto_733980 ) ) ( not ( = ?auto_733971 ?auto_733972 ) ) ( not ( = ?auto_733971 ?auto_733973 ) ) ( not ( = ?auto_733971 ?auto_733974 ) ) ( not ( = ?auto_733971 ?auto_733975 ) ) ( not ( = ?auto_733971 ?auto_733976 ) ) ( not ( = ?auto_733971 ?auto_733977 ) ) ( not ( = ?auto_733971 ?auto_733978 ) ) ( not ( = ?auto_733971 ?auto_733979 ) ) ( not ( = ?auto_733971 ?auto_733980 ) ) ( not ( = ?auto_733972 ?auto_733973 ) ) ( not ( = ?auto_733972 ?auto_733974 ) ) ( not ( = ?auto_733972 ?auto_733975 ) ) ( not ( = ?auto_733972 ?auto_733976 ) ) ( not ( = ?auto_733972 ?auto_733977 ) ) ( not ( = ?auto_733972 ?auto_733978 ) ) ( not ( = ?auto_733972 ?auto_733979 ) ) ( not ( = ?auto_733972 ?auto_733980 ) ) ( not ( = ?auto_733973 ?auto_733974 ) ) ( not ( = ?auto_733973 ?auto_733975 ) ) ( not ( = ?auto_733973 ?auto_733976 ) ) ( not ( = ?auto_733973 ?auto_733977 ) ) ( not ( = ?auto_733973 ?auto_733978 ) ) ( not ( = ?auto_733973 ?auto_733979 ) ) ( not ( = ?auto_733973 ?auto_733980 ) ) ( not ( = ?auto_733974 ?auto_733975 ) ) ( not ( = ?auto_733974 ?auto_733976 ) ) ( not ( = ?auto_733974 ?auto_733977 ) ) ( not ( = ?auto_733974 ?auto_733978 ) ) ( not ( = ?auto_733974 ?auto_733979 ) ) ( not ( = ?auto_733974 ?auto_733980 ) ) ( not ( = ?auto_733975 ?auto_733976 ) ) ( not ( = ?auto_733975 ?auto_733977 ) ) ( not ( = ?auto_733975 ?auto_733978 ) ) ( not ( = ?auto_733975 ?auto_733979 ) ) ( not ( = ?auto_733975 ?auto_733980 ) ) ( not ( = ?auto_733976 ?auto_733977 ) ) ( not ( = ?auto_733976 ?auto_733978 ) ) ( not ( = ?auto_733976 ?auto_733979 ) ) ( not ( = ?auto_733976 ?auto_733980 ) ) ( not ( = ?auto_733977 ?auto_733978 ) ) ( not ( = ?auto_733977 ?auto_733979 ) ) ( not ( = ?auto_733977 ?auto_733980 ) ) ( not ( = ?auto_733978 ?auto_733979 ) ) ( not ( = ?auto_733978 ?auto_733980 ) ) ( not ( = ?auto_733979 ?auto_733980 ) ) ( ON ?auto_733978 ?auto_733979 ) ( CLEAR ?auto_733976 ) ( ON ?auto_733977 ?auto_733978 ) ( CLEAR ?auto_733977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_733969 ?auto_733970 ?auto_733971 ?auto_733972 ?auto_733973 ?auto_733974 ?auto_733975 ?auto_733976 ?auto_733977 )
      ( MAKE-11PILE ?auto_733969 ?auto_733970 ?auto_733971 ?auto_733972 ?auto_733973 ?auto_733974 ?auto_733975 ?auto_733976 ?auto_733977 ?auto_733978 ?auto_733979 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734015 - BLOCK
      ?auto_734016 - BLOCK
      ?auto_734017 - BLOCK
      ?auto_734018 - BLOCK
      ?auto_734019 - BLOCK
      ?auto_734020 - BLOCK
      ?auto_734021 - BLOCK
      ?auto_734022 - BLOCK
      ?auto_734023 - BLOCK
      ?auto_734024 - BLOCK
      ?auto_734025 - BLOCK
    )
    :vars
    (
      ?auto_734026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734025 ?auto_734026 ) ( ON-TABLE ?auto_734015 ) ( ON ?auto_734016 ?auto_734015 ) ( ON ?auto_734017 ?auto_734016 ) ( ON ?auto_734018 ?auto_734017 ) ( ON ?auto_734019 ?auto_734018 ) ( ON ?auto_734020 ?auto_734019 ) ( ON ?auto_734021 ?auto_734020 ) ( not ( = ?auto_734015 ?auto_734016 ) ) ( not ( = ?auto_734015 ?auto_734017 ) ) ( not ( = ?auto_734015 ?auto_734018 ) ) ( not ( = ?auto_734015 ?auto_734019 ) ) ( not ( = ?auto_734015 ?auto_734020 ) ) ( not ( = ?auto_734015 ?auto_734021 ) ) ( not ( = ?auto_734015 ?auto_734022 ) ) ( not ( = ?auto_734015 ?auto_734023 ) ) ( not ( = ?auto_734015 ?auto_734024 ) ) ( not ( = ?auto_734015 ?auto_734025 ) ) ( not ( = ?auto_734015 ?auto_734026 ) ) ( not ( = ?auto_734016 ?auto_734017 ) ) ( not ( = ?auto_734016 ?auto_734018 ) ) ( not ( = ?auto_734016 ?auto_734019 ) ) ( not ( = ?auto_734016 ?auto_734020 ) ) ( not ( = ?auto_734016 ?auto_734021 ) ) ( not ( = ?auto_734016 ?auto_734022 ) ) ( not ( = ?auto_734016 ?auto_734023 ) ) ( not ( = ?auto_734016 ?auto_734024 ) ) ( not ( = ?auto_734016 ?auto_734025 ) ) ( not ( = ?auto_734016 ?auto_734026 ) ) ( not ( = ?auto_734017 ?auto_734018 ) ) ( not ( = ?auto_734017 ?auto_734019 ) ) ( not ( = ?auto_734017 ?auto_734020 ) ) ( not ( = ?auto_734017 ?auto_734021 ) ) ( not ( = ?auto_734017 ?auto_734022 ) ) ( not ( = ?auto_734017 ?auto_734023 ) ) ( not ( = ?auto_734017 ?auto_734024 ) ) ( not ( = ?auto_734017 ?auto_734025 ) ) ( not ( = ?auto_734017 ?auto_734026 ) ) ( not ( = ?auto_734018 ?auto_734019 ) ) ( not ( = ?auto_734018 ?auto_734020 ) ) ( not ( = ?auto_734018 ?auto_734021 ) ) ( not ( = ?auto_734018 ?auto_734022 ) ) ( not ( = ?auto_734018 ?auto_734023 ) ) ( not ( = ?auto_734018 ?auto_734024 ) ) ( not ( = ?auto_734018 ?auto_734025 ) ) ( not ( = ?auto_734018 ?auto_734026 ) ) ( not ( = ?auto_734019 ?auto_734020 ) ) ( not ( = ?auto_734019 ?auto_734021 ) ) ( not ( = ?auto_734019 ?auto_734022 ) ) ( not ( = ?auto_734019 ?auto_734023 ) ) ( not ( = ?auto_734019 ?auto_734024 ) ) ( not ( = ?auto_734019 ?auto_734025 ) ) ( not ( = ?auto_734019 ?auto_734026 ) ) ( not ( = ?auto_734020 ?auto_734021 ) ) ( not ( = ?auto_734020 ?auto_734022 ) ) ( not ( = ?auto_734020 ?auto_734023 ) ) ( not ( = ?auto_734020 ?auto_734024 ) ) ( not ( = ?auto_734020 ?auto_734025 ) ) ( not ( = ?auto_734020 ?auto_734026 ) ) ( not ( = ?auto_734021 ?auto_734022 ) ) ( not ( = ?auto_734021 ?auto_734023 ) ) ( not ( = ?auto_734021 ?auto_734024 ) ) ( not ( = ?auto_734021 ?auto_734025 ) ) ( not ( = ?auto_734021 ?auto_734026 ) ) ( not ( = ?auto_734022 ?auto_734023 ) ) ( not ( = ?auto_734022 ?auto_734024 ) ) ( not ( = ?auto_734022 ?auto_734025 ) ) ( not ( = ?auto_734022 ?auto_734026 ) ) ( not ( = ?auto_734023 ?auto_734024 ) ) ( not ( = ?auto_734023 ?auto_734025 ) ) ( not ( = ?auto_734023 ?auto_734026 ) ) ( not ( = ?auto_734024 ?auto_734025 ) ) ( not ( = ?auto_734024 ?auto_734026 ) ) ( not ( = ?auto_734025 ?auto_734026 ) ) ( ON ?auto_734024 ?auto_734025 ) ( ON ?auto_734023 ?auto_734024 ) ( CLEAR ?auto_734021 ) ( ON ?auto_734022 ?auto_734023 ) ( CLEAR ?auto_734022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_734015 ?auto_734016 ?auto_734017 ?auto_734018 ?auto_734019 ?auto_734020 ?auto_734021 ?auto_734022 )
      ( MAKE-11PILE ?auto_734015 ?auto_734016 ?auto_734017 ?auto_734018 ?auto_734019 ?auto_734020 ?auto_734021 ?auto_734022 ?auto_734023 ?auto_734024 ?auto_734025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734061 - BLOCK
      ?auto_734062 - BLOCK
      ?auto_734063 - BLOCK
      ?auto_734064 - BLOCK
      ?auto_734065 - BLOCK
      ?auto_734066 - BLOCK
      ?auto_734067 - BLOCK
      ?auto_734068 - BLOCK
      ?auto_734069 - BLOCK
      ?auto_734070 - BLOCK
      ?auto_734071 - BLOCK
    )
    :vars
    (
      ?auto_734072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734071 ?auto_734072 ) ( ON-TABLE ?auto_734061 ) ( ON ?auto_734062 ?auto_734061 ) ( ON ?auto_734063 ?auto_734062 ) ( ON ?auto_734064 ?auto_734063 ) ( ON ?auto_734065 ?auto_734064 ) ( ON ?auto_734066 ?auto_734065 ) ( not ( = ?auto_734061 ?auto_734062 ) ) ( not ( = ?auto_734061 ?auto_734063 ) ) ( not ( = ?auto_734061 ?auto_734064 ) ) ( not ( = ?auto_734061 ?auto_734065 ) ) ( not ( = ?auto_734061 ?auto_734066 ) ) ( not ( = ?auto_734061 ?auto_734067 ) ) ( not ( = ?auto_734061 ?auto_734068 ) ) ( not ( = ?auto_734061 ?auto_734069 ) ) ( not ( = ?auto_734061 ?auto_734070 ) ) ( not ( = ?auto_734061 ?auto_734071 ) ) ( not ( = ?auto_734061 ?auto_734072 ) ) ( not ( = ?auto_734062 ?auto_734063 ) ) ( not ( = ?auto_734062 ?auto_734064 ) ) ( not ( = ?auto_734062 ?auto_734065 ) ) ( not ( = ?auto_734062 ?auto_734066 ) ) ( not ( = ?auto_734062 ?auto_734067 ) ) ( not ( = ?auto_734062 ?auto_734068 ) ) ( not ( = ?auto_734062 ?auto_734069 ) ) ( not ( = ?auto_734062 ?auto_734070 ) ) ( not ( = ?auto_734062 ?auto_734071 ) ) ( not ( = ?auto_734062 ?auto_734072 ) ) ( not ( = ?auto_734063 ?auto_734064 ) ) ( not ( = ?auto_734063 ?auto_734065 ) ) ( not ( = ?auto_734063 ?auto_734066 ) ) ( not ( = ?auto_734063 ?auto_734067 ) ) ( not ( = ?auto_734063 ?auto_734068 ) ) ( not ( = ?auto_734063 ?auto_734069 ) ) ( not ( = ?auto_734063 ?auto_734070 ) ) ( not ( = ?auto_734063 ?auto_734071 ) ) ( not ( = ?auto_734063 ?auto_734072 ) ) ( not ( = ?auto_734064 ?auto_734065 ) ) ( not ( = ?auto_734064 ?auto_734066 ) ) ( not ( = ?auto_734064 ?auto_734067 ) ) ( not ( = ?auto_734064 ?auto_734068 ) ) ( not ( = ?auto_734064 ?auto_734069 ) ) ( not ( = ?auto_734064 ?auto_734070 ) ) ( not ( = ?auto_734064 ?auto_734071 ) ) ( not ( = ?auto_734064 ?auto_734072 ) ) ( not ( = ?auto_734065 ?auto_734066 ) ) ( not ( = ?auto_734065 ?auto_734067 ) ) ( not ( = ?auto_734065 ?auto_734068 ) ) ( not ( = ?auto_734065 ?auto_734069 ) ) ( not ( = ?auto_734065 ?auto_734070 ) ) ( not ( = ?auto_734065 ?auto_734071 ) ) ( not ( = ?auto_734065 ?auto_734072 ) ) ( not ( = ?auto_734066 ?auto_734067 ) ) ( not ( = ?auto_734066 ?auto_734068 ) ) ( not ( = ?auto_734066 ?auto_734069 ) ) ( not ( = ?auto_734066 ?auto_734070 ) ) ( not ( = ?auto_734066 ?auto_734071 ) ) ( not ( = ?auto_734066 ?auto_734072 ) ) ( not ( = ?auto_734067 ?auto_734068 ) ) ( not ( = ?auto_734067 ?auto_734069 ) ) ( not ( = ?auto_734067 ?auto_734070 ) ) ( not ( = ?auto_734067 ?auto_734071 ) ) ( not ( = ?auto_734067 ?auto_734072 ) ) ( not ( = ?auto_734068 ?auto_734069 ) ) ( not ( = ?auto_734068 ?auto_734070 ) ) ( not ( = ?auto_734068 ?auto_734071 ) ) ( not ( = ?auto_734068 ?auto_734072 ) ) ( not ( = ?auto_734069 ?auto_734070 ) ) ( not ( = ?auto_734069 ?auto_734071 ) ) ( not ( = ?auto_734069 ?auto_734072 ) ) ( not ( = ?auto_734070 ?auto_734071 ) ) ( not ( = ?auto_734070 ?auto_734072 ) ) ( not ( = ?auto_734071 ?auto_734072 ) ) ( ON ?auto_734070 ?auto_734071 ) ( ON ?auto_734069 ?auto_734070 ) ( ON ?auto_734068 ?auto_734069 ) ( CLEAR ?auto_734066 ) ( ON ?auto_734067 ?auto_734068 ) ( CLEAR ?auto_734067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_734061 ?auto_734062 ?auto_734063 ?auto_734064 ?auto_734065 ?auto_734066 ?auto_734067 )
      ( MAKE-11PILE ?auto_734061 ?auto_734062 ?auto_734063 ?auto_734064 ?auto_734065 ?auto_734066 ?auto_734067 ?auto_734068 ?auto_734069 ?auto_734070 ?auto_734071 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734107 - BLOCK
      ?auto_734108 - BLOCK
      ?auto_734109 - BLOCK
      ?auto_734110 - BLOCK
      ?auto_734111 - BLOCK
      ?auto_734112 - BLOCK
      ?auto_734113 - BLOCK
      ?auto_734114 - BLOCK
      ?auto_734115 - BLOCK
      ?auto_734116 - BLOCK
      ?auto_734117 - BLOCK
    )
    :vars
    (
      ?auto_734118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734117 ?auto_734118 ) ( ON-TABLE ?auto_734107 ) ( ON ?auto_734108 ?auto_734107 ) ( ON ?auto_734109 ?auto_734108 ) ( ON ?auto_734110 ?auto_734109 ) ( ON ?auto_734111 ?auto_734110 ) ( not ( = ?auto_734107 ?auto_734108 ) ) ( not ( = ?auto_734107 ?auto_734109 ) ) ( not ( = ?auto_734107 ?auto_734110 ) ) ( not ( = ?auto_734107 ?auto_734111 ) ) ( not ( = ?auto_734107 ?auto_734112 ) ) ( not ( = ?auto_734107 ?auto_734113 ) ) ( not ( = ?auto_734107 ?auto_734114 ) ) ( not ( = ?auto_734107 ?auto_734115 ) ) ( not ( = ?auto_734107 ?auto_734116 ) ) ( not ( = ?auto_734107 ?auto_734117 ) ) ( not ( = ?auto_734107 ?auto_734118 ) ) ( not ( = ?auto_734108 ?auto_734109 ) ) ( not ( = ?auto_734108 ?auto_734110 ) ) ( not ( = ?auto_734108 ?auto_734111 ) ) ( not ( = ?auto_734108 ?auto_734112 ) ) ( not ( = ?auto_734108 ?auto_734113 ) ) ( not ( = ?auto_734108 ?auto_734114 ) ) ( not ( = ?auto_734108 ?auto_734115 ) ) ( not ( = ?auto_734108 ?auto_734116 ) ) ( not ( = ?auto_734108 ?auto_734117 ) ) ( not ( = ?auto_734108 ?auto_734118 ) ) ( not ( = ?auto_734109 ?auto_734110 ) ) ( not ( = ?auto_734109 ?auto_734111 ) ) ( not ( = ?auto_734109 ?auto_734112 ) ) ( not ( = ?auto_734109 ?auto_734113 ) ) ( not ( = ?auto_734109 ?auto_734114 ) ) ( not ( = ?auto_734109 ?auto_734115 ) ) ( not ( = ?auto_734109 ?auto_734116 ) ) ( not ( = ?auto_734109 ?auto_734117 ) ) ( not ( = ?auto_734109 ?auto_734118 ) ) ( not ( = ?auto_734110 ?auto_734111 ) ) ( not ( = ?auto_734110 ?auto_734112 ) ) ( not ( = ?auto_734110 ?auto_734113 ) ) ( not ( = ?auto_734110 ?auto_734114 ) ) ( not ( = ?auto_734110 ?auto_734115 ) ) ( not ( = ?auto_734110 ?auto_734116 ) ) ( not ( = ?auto_734110 ?auto_734117 ) ) ( not ( = ?auto_734110 ?auto_734118 ) ) ( not ( = ?auto_734111 ?auto_734112 ) ) ( not ( = ?auto_734111 ?auto_734113 ) ) ( not ( = ?auto_734111 ?auto_734114 ) ) ( not ( = ?auto_734111 ?auto_734115 ) ) ( not ( = ?auto_734111 ?auto_734116 ) ) ( not ( = ?auto_734111 ?auto_734117 ) ) ( not ( = ?auto_734111 ?auto_734118 ) ) ( not ( = ?auto_734112 ?auto_734113 ) ) ( not ( = ?auto_734112 ?auto_734114 ) ) ( not ( = ?auto_734112 ?auto_734115 ) ) ( not ( = ?auto_734112 ?auto_734116 ) ) ( not ( = ?auto_734112 ?auto_734117 ) ) ( not ( = ?auto_734112 ?auto_734118 ) ) ( not ( = ?auto_734113 ?auto_734114 ) ) ( not ( = ?auto_734113 ?auto_734115 ) ) ( not ( = ?auto_734113 ?auto_734116 ) ) ( not ( = ?auto_734113 ?auto_734117 ) ) ( not ( = ?auto_734113 ?auto_734118 ) ) ( not ( = ?auto_734114 ?auto_734115 ) ) ( not ( = ?auto_734114 ?auto_734116 ) ) ( not ( = ?auto_734114 ?auto_734117 ) ) ( not ( = ?auto_734114 ?auto_734118 ) ) ( not ( = ?auto_734115 ?auto_734116 ) ) ( not ( = ?auto_734115 ?auto_734117 ) ) ( not ( = ?auto_734115 ?auto_734118 ) ) ( not ( = ?auto_734116 ?auto_734117 ) ) ( not ( = ?auto_734116 ?auto_734118 ) ) ( not ( = ?auto_734117 ?auto_734118 ) ) ( ON ?auto_734116 ?auto_734117 ) ( ON ?auto_734115 ?auto_734116 ) ( ON ?auto_734114 ?auto_734115 ) ( ON ?auto_734113 ?auto_734114 ) ( CLEAR ?auto_734111 ) ( ON ?auto_734112 ?auto_734113 ) ( CLEAR ?auto_734112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_734107 ?auto_734108 ?auto_734109 ?auto_734110 ?auto_734111 ?auto_734112 )
      ( MAKE-11PILE ?auto_734107 ?auto_734108 ?auto_734109 ?auto_734110 ?auto_734111 ?auto_734112 ?auto_734113 ?auto_734114 ?auto_734115 ?auto_734116 ?auto_734117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734153 - BLOCK
      ?auto_734154 - BLOCK
      ?auto_734155 - BLOCK
      ?auto_734156 - BLOCK
      ?auto_734157 - BLOCK
      ?auto_734158 - BLOCK
      ?auto_734159 - BLOCK
      ?auto_734160 - BLOCK
      ?auto_734161 - BLOCK
      ?auto_734162 - BLOCK
      ?auto_734163 - BLOCK
    )
    :vars
    (
      ?auto_734164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734163 ?auto_734164 ) ( ON-TABLE ?auto_734153 ) ( ON ?auto_734154 ?auto_734153 ) ( ON ?auto_734155 ?auto_734154 ) ( ON ?auto_734156 ?auto_734155 ) ( not ( = ?auto_734153 ?auto_734154 ) ) ( not ( = ?auto_734153 ?auto_734155 ) ) ( not ( = ?auto_734153 ?auto_734156 ) ) ( not ( = ?auto_734153 ?auto_734157 ) ) ( not ( = ?auto_734153 ?auto_734158 ) ) ( not ( = ?auto_734153 ?auto_734159 ) ) ( not ( = ?auto_734153 ?auto_734160 ) ) ( not ( = ?auto_734153 ?auto_734161 ) ) ( not ( = ?auto_734153 ?auto_734162 ) ) ( not ( = ?auto_734153 ?auto_734163 ) ) ( not ( = ?auto_734153 ?auto_734164 ) ) ( not ( = ?auto_734154 ?auto_734155 ) ) ( not ( = ?auto_734154 ?auto_734156 ) ) ( not ( = ?auto_734154 ?auto_734157 ) ) ( not ( = ?auto_734154 ?auto_734158 ) ) ( not ( = ?auto_734154 ?auto_734159 ) ) ( not ( = ?auto_734154 ?auto_734160 ) ) ( not ( = ?auto_734154 ?auto_734161 ) ) ( not ( = ?auto_734154 ?auto_734162 ) ) ( not ( = ?auto_734154 ?auto_734163 ) ) ( not ( = ?auto_734154 ?auto_734164 ) ) ( not ( = ?auto_734155 ?auto_734156 ) ) ( not ( = ?auto_734155 ?auto_734157 ) ) ( not ( = ?auto_734155 ?auto_734158 ) ) ( not ( = ?auto_734155 ?auto_734159 ) ) ( not ( = ?auto_734155 ?auto_734160 ) ) ( not ( = ?auto_734155 ?auto_734161 ) ) ( not ( = ?auto_734155 ?auto_734162 ) ) ( not ( = ?auto_734155 ?auto_734163 ) ) ( not ( = ?auto_734155 ?auto_734164 ) ) ( not ( = ?auto_734156 ?auto_734157 ) ) ( not ( = ?auto_734156 ?auto_734158 ) ) ( not ( = ?auto_734156 ?auto_734159 ) ) ( not ( = ?auto_734156 ?auto_734160 ) ) ( not ( = ?auto_734156 ?auto_734161 ) ) ( not ( = ?auto_734156 ?auto_734162 ) ) ( not ( = ?auto_734156 ?auto_734163 ) ) ( not ( = ?auto_734156 ?auto_734164 ) ) ( not ( = ?auto_734157 ?auto_734158 ) ) ( not ( = ?auto_734157 ?auto_734159 ) ) ( not ( = ?auto_734157 ?auto_734160 ) ) ( not ( = ?auto_734157 ?auto_734161 ) ) ( not ( = ?auto_734157 ?auto_734162 ) ) ( not ( = ?auto_734157 ?auto_734163 ) ) ( not ( = ?auto_734157 ?auto_734164 ) ) ( not ( = ?auto_734158 ?auto_734159 ) ) ( not ( = ?auto_734158 ?auto_734160 ) ) ( not ( = ?auto_734158 ?auto_734161 ) ) ( not ( = ?auto_734158 ?auto_734162 ) ) ( not ( = ?auto_734158 ?auto_734163 ) ) ( not ( = ?auto_734158 ?auto_734164 ) ) ( not ( = ?auto_734159 ?auto_734160 ) ) ( not ( = ?auto_734159 ?auto_734161 ) ) ( not ( = ?auto_734159 ?auto_734162 ) ) ( not ( = ?auto_734159 ?auto_734163 ) ) ( not ( = ?auto_734159 ?auto_734164 ) ) ( not ( = ?auto_734160 ?auto_734161 ) ) ( not ( = ?auto_734160 ?auto_734162 ) ) ( not ( = ?auto_734160 ?auto_734163 ) ) ( not ( = ?auto_734160 ?auto_734164 ) ) ( not ( = ?auto_734161 ?auto_734162 ) ) ( not ( = ?auto_734161 ?auto_734163 ) ) ( not ( = ?auto_734161 ?auto_734164 ) ) ( not ( = ?auto_734162 ?auto_734163 ) ) ( not ( = ?auto_734162 ?auto_734164 ) ) ( not ( = ?auto_734163 ?auto_734164 ) ) ( ON ?auto_734162 ?auto_734163 ) ( ON ?auto_734161 ?auto_734162 ) ( ON ?auto_734160 ?auto_734161 ) ( ON ?auto_734159 ?auto_734160 ) ( ON ?auto_734158 ?auto_734159 ) ( CLEAR ?auto_734156 ) ( ON ?auto_734157 ?auto_734158 ) ( CLEAR ?auto_734157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_734153 ?auto_734154 ?auto_734155 ?auto_734156 ?auto_734157 )
      ( MAKE-11PILE ?auto_734153 ?auto_734154 ?auto_734155 ?auto_734156 ?auto_734157 ?auto_734158 ?auto_734159 ?auto_734160 ?auto_734161 ?auto_734162 ?auto_734163 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734199 - BLOCK
      ?auto_734200 - BLOCK
      ?auto_734201 - BLOCK
      ?auto_734202 - BLOCK
      ?auto_734203 - BLOCK
      ?auto_734204 - BLOCK
      ?auto_734205 - BLOCK
      ?auto_734206 - BLOCK
      ?auto_734207 - BLOCK
      ?auto_734208 - BLOCK
      ?auto_734209 - BLOCK
    )
    :vars
    (
      ?auto_734210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734209 ?auto_734210 ) ( ON-TABLE ?auto_734199 ) ( ON ?auto_734200 ?auto_734199 ) ( ON ?auto_734201 ?auto_734200 ) ( not ( = ?auto_734199 ?auto_734200 ) ) ( not ( = ?auto_734199 ?auto_734201 ) ) ( not ( = ?auto_734199 ?auto_734202 ) ) ( not ( = ?auto_734199 ?auto_734203 ) ) ( not ( = ?auto_734199 ?auto_734204 ) ) ( not ( = ?auto_734199 ?auto_734205 ) ) ( not ( = ?auto_734199 ?auto_734206 ) ) ( not ( = ?auto_734199 ?auto_734207 ) ) ( not ( = ?auto_734199 ?auto_734208 ) ) ( not ( = ?auto_734199 ?auto_734209 ) ) ( not ( = ?auto_734199 ?auto_734210 ) ) ( not ( = ?auto_734200 ?auto_734201 ) ) ( not ( = ?auto_734200 ?auto_734202 ) ) ( not ( = ?auto_734200 ?auto_734203 ) ) ( not ( = ?auto_734200 ?auto_734204 ) ) ( not ( = ?auto_734200 ?auto_734205 ) ) ( not ( = ?auto_734200 ?auto_734206 ) ) ( not ( = ?auto_734200 ?auto_734207 ) ) ( not ( = ?auto_734200 ?auto_734208 ) ) ( not ( = ?auto_734200 ?auto_734209 ) ) ( not ( = ?auto_734200 ?auto_734210 ) ) ( not ( = ?auto_734201 ?auto_734202 ) ) ( not ( = ?auto_734201 ?auto_734203 ) ) ( not ( = ?auto_734201 ?auto_734204 ) ) ( not ( = ?auto_734201 ?auto_734205 ) ) ( not ( = ?auto_734201 ?auto_734206 ) ) ( not ( = ?auto_734201 ?auto_734207 ) ) ( not ( = ?auto_734201 ?auto_734208 ) ) ( not ( = ?auto_734201 ?auto_734209 ) ) ( not ( = ?auto_734201 ?auto_734210 ) ) ( not ( = ?auto_734202 ?auto_734203 ) ) ( not ( = ?auto_734202 ?auto_734204 ) ) ( not ( = ?auto_734202 ?auto_734205 ) ) ( not ( = ?auto_734202 ?auto_734206 ) ) ( not ( = ?auto_734202 ?auto_734207 ) ) ( not ( = ?auto_734202 ?auto_734208 ) ) ( not ( = ?auto_734202 ?auto_734209 ) ) ( not ( = ?auto_734202 ?auto_734210 ) ) ( not ( = ?auto_734203 ?auto_734204 ) ) ( not ( = ?auto_734203 ?auto_734205 ) ) ( not ( = ?auto_734203 ?auto_734206 ) ) ( not ( = ?auto_734203 ?auto_734207 ) ) ( not ( = ?auto_734203 ?auto_734208 ) ) ( not ( = ?auto_734203 ?auto_734209 ) ) ( not ( = ?auto_734203 ?auto_734210 ) ) ( not ( = ?auto_734204 ?auto_734205 ) ) ( not ( = ?auto_734204 ?auto_734206 ) ) ( not ( = ?auto_734204 ?auto_734207 ) ) ( not ( = ?auto_734204 ?auto_734208 ) ) ( not ( = ?auto_734204 ?auto_734209 ) ) ( not ( = ?auto_734204 ?auto_734210 ) ) ( not ( = ?auto_734205 ?auto_734206 ) ) ( not ( = ?auto_734205 ?auto_734207 ) ) ( not ( = ?auto_734205 ?auto_734208 ) ) ( not ( = ?auto_734205 ?auto_734209 ) ) ( not ( = ?auto_734205 ?auto_734210 ) ) ( not ( = ?auto_734206 ?auto_734207 ) ) ( not ( = ?auto_734206 ?auto_734208 ) ) ( not ( = ?auto_734206 ?auto_734209 ) ) ( not ( = ?auto_734206 ?auto_734210 ) ) ( not ( = ?auto_734207 ?auto_734208 ) ) ( not ( = ?auto_734207 ?auto_734209 ) ) ( not ( = ?auto_734207 ?auto_734210 ) ) ( not ( = ?auto_734208 ?auto_734209 ) ) ( not ( = ?auto_734208 ?auto_734210 ) ) ( not ( = ?auto_734209 ?auto_734210 ) ) ( ON ?auto_734208 ?auto_734209 ) ( ON ?auto_734207 ?auto_734208 ) ( ON ?auto_734206 ?auto_734207 ) ( ON ?auto_734205 ?auto_734206 ) ( ON ?auto_734204 ?auto_734205 ) ( ON ?auto_734203 ?auto_734204 ) ( CLEAR ?auto_734201 ) ( ON ?auto_734202 ?auto_734203 ) ( CLEAR ?auto_734202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_734199 ?auto_734200 ?auto_734201 ?auto_734202 )
      ( MAKE-11PILE ?auto_734199 ?auto_734200 ?auto_734201 ?auto_734202 ?auto_734203 ?auto_734204 ?auto_734205 ?auto_734206 ?auto_734207 ?auto_734208 ?auto_734209 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734245 - BLOCK
      ?auto_734246 - BLOCK
      ?auto_734247 - BLOCK
      ?auto_734248 - BLOCK
      ?auto_734249 - BLOCK
      ?auto_734250 - BLOCK
      ?auto_734251 - BLOCK
      ?auto_734252 - BLOCK
      ?auto_734253 - BLOCK
      ?auto_734254 - BLOCK
      ?auto_734255 - BLOCK
    )
    :vars
    (
      ?auto_734256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734255 ?auto_734256 ) ( ON-TABLE ?auto_734245 ) ( ON ?auto_734246 ?auto_734245 ) ( not ( = ?auto_734245 ?auto_734246 ) ) ( not ( = ?auto_734245 ?auto_734247 ) ) ( not ( = ?auto_734245 ?auto_734248 ) ) ( not ( = ?auto_734245 ?auto_734249 ) ) ( not ( = ?auto_734245 ?auto_734250 ) ) ( not ( = ?auto_734245 ?auto_734251 ) ) ( not ( = ?auto_734245 ?auto_734252 ) ) ( not ( = ?auto_734245 ?auto_734253 ) ) ( not ( = ?auto_734245 ?auto_734254 ) ) ( not ( = ?auto_734245 ?auto_734255 ) ) ( not ( = ?auto_734245 ?auto_734256 ) ) ( not ( = ?auto_734246 ?auto_734247 ) ) ( not ( = ?auto_734246 ?auto_734248 ) ) ( not ( = ?auto_734246 ?auto_734249 ) ) ( not ( = ?auto_734246 ?auto_734250 ) ) ( not ( = ?auto_734246 ?auto_734251 ) ) ( not ( = ?auto_734246 ?auto_734252 ) ) ( not ( = ?auto_734246 ?auto_734253 ) ) ( not ( = ?auto_734246 ?auto_734254 ) ) ( not ( = ?auto_734246 ?auto_734255 ) ) ( not ( = ?auto_734246 ?auto_734256 ) ) ( not ( = ?auto_734247 ?auto_734248 ) ) ( not ( = ?auto_734247 ?auto_734249 ) ) ( not ( = ?auto_734247 ?auto_734250 ) ) ( not ( = ?auto_734247 ?auto_734251 ) ) ( not ( = ?auto_734247 ?auto_734252 ) ) ( not ( = ?auto_734247 ?auto_734253 ) ) ( not ( = ?auto_734247 ?auto_734254 ) ) ( not ( = ?auto_734247 ?auto_734255 ) ) ( not ( = ?auto_734247 ?auto_734256 ) ) ( not ( = ?auto_734248 ?auto_734249 ) ) ( not ( = ?auto_734248 ?auto_734250 ) ) ( not ( = ?auto_734248 ?auto_734251 ) ) ( not ( = ?auto_734248 ?auto_734252 ) ) ( not ( = ?auto_734248 ?auto_734253 ) ) ( not ( = ?auto_734248 ?auto_734254 ) ) ( not ( = ?auto_734248 ?auto_734255 ) ) ( not ( = ?auto_734248 ?auto_734256 ) ) ( not ( = ?auto_734249 ?auto_734250 ) ) ( not ( = ?auto_734249 ?auto_734251 ) ) ( not ( = ?auto_734249 ?auto_734252 ) ) ( not ( = ?auto_734249 ?auto_734253 ) ) ( not ( = ?auto_734249 ?auto_734254 ) ) ( not ( = ?auto_734249 ?auto_734255 ) ) ( not ( = ?auto_734249 ?auto_734256 ) ) ( not ( = ?auto_734250 ?auto_734251 ) ) ( not ( = ?auto_734250 ?auto_734252 ) ) ( not ( = ?auto_734250 ?auto_734253 ) ) ( not ( = ?auto_734250 ?auto_734254 ) ) ( not ( = ?auto_734250 ?auto_734255 ) ) ( not ( = ?auto_734250 ?auto_734256 ) ) ( not ( = ?auto_734251 ?auto_734252 ) ) ( not ( = ?auto_734251 ?auto_734253 ) ) ( not ( = ?auto_734251 ?auto_734254 ) ) ( not ( = ?auto_734251 ?auto_734255 ) ) ( not ( = ?auto_734251 ?auto_734256 ) ) ( not ( = ?auto_734252 ?auto_734253 ) ) ( not ( = ?auto_734252 ?auto_734254 ) ) ( not ( = ?auto_734252 ?auto_734255 ) ) ( not ( = ?auto_734252 ?auto_734256 ) ) ( not ( = ?auto_734253 ?auto_734254 ) ) ( not ( = ?auto_734253 ?auto_734255 ) ) ( not ( = ?auto_734253 ?auto_734256 ) ) ( not ( = ?auto_734254 ?auto_734255 ) ) ( not ( = ?auto_734254 ?auto_734256 ) ) ( not ( = ?auto_734255 ?auto_734256 ) ) ( ON ?auto_734254 ?auto_734255 ) ( ON ?auto_734253 ?auto_734254 ) ( ON ?auto_734252 ?auto_734253 ) ( ON ?auto_734251 ?auto_734252 ) ( ON ?auto_734250 ?auto_734251 ) ( ON ?auto_734249 ?auto_734250 ) ( ON ?auto_734248 ?auto_734249 ) ( CLEAR ?auto_734246 ) ( ON ?auto_734247 ?auto_734248 ) ( CLEAR ?auto_734247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_734245 ?auto_734246 ?auto_734247 )
      ( MAKE-11PILE ?auto_734245 ?auto_734246 ?auto_734247 ?auto_734248 ?auto_734249 ?auto_734250 ?auto_734251 ?auto_734252 ?auto_734253 ?auto_734254 ?auto_734255 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734291 - BLOCK
      ?auto_734292 - BLOCK
      ?auto_734293 - BLOCK
      ?auto_734294 - BLOCK
      ?auto_734295 - BLOCK
      ?auto_734296 - BLOCK
      ?auto_734297 - BLOCK
      ?auto_734298 - BLOCK
      ?auto_734299 - BLOCK
      ?auto_734300 - BLOCK
      ?auto_734301 - BLOCK
    )
    :vars
    (
      ?auto_734302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734301 ?auto_734302 ) ( ON-TABLE ?auto_734291 ) ( not ( = ?auto_734291 ?auto_734292 ) ) ( not ( = ?auto_734291 ?auto_734293 ) ) ( not ( = ?auto_734291 ?auto_734294 ) ) ( not ( = ?auto_734291 ?auto_734295 ) ) ( not ( = ?auto_734291 ?auto_734296 ) ) ( not ( = ?auto_734291 ?auto_734297 ) ) ( not ( = ?auto_734291 ?auto_734298 ) ) ( not ( = ?auto_734291 ?auto_734299 ) ) ( not ( = ?auto_734291 ?auto_734300 ) ) ( not ( = ?auto_734291 ?auto_734301 ) ) ( not ( = ?auto_734291 ?auto_734302 ) ) ( not ( = ?auto_734292 ?auto_734293 ) ) ( not ( = ?auto_734292 ?auto_734294 ) ) ( not ( = ?auto_734292 ?auto_734295 ) ) ( not ( = ?auto_734292 ?auto_734296 ) ) ( not ( = ?auto_734292 ?auto_734297 ) ) ( not ( = ?auto_734292 ?auto_734298 ) ) ( not ( = ?auto_734292 ?auto_734299 ) ) ( not ( = ?auto_734292 ?auto_734300 ) ) ( not ( = ?auto_734292 ?auto_734301 ) ) ( not ( = ?auto_734292 ?auto_734302 ) ) ( not ( = ?auto_734293 ?auto_734294 ) ) ( not ( = ?auto_734293 ?auto_734295 ) ) ( not ( = ?auto_734293 ?auto_734296 ) ) ( not ( = ?auto_734293 ?auto_734297 ) ) ( not ( = ?auto_734293 ?auto_734298 ) ) ( not ( = ?auto_734293 ?auto_734299 ) ) ( not ( = ?auto_734293 ?auto_734300 ) ) ( not ( = ?auto_734293 ?auto_734301 ) ) ( not ( = ?auto_734293 ?auto_734302 ) ) ( not ( = ?auto_734294 ?auto_734295 ) ) ( not ( = ?auto_734294 ?auto_734296 ) ) ( not ( = ?auto_734294 ?auto_734297 ) ) ( not ( = ?auto_734294 ?auto_734298 ) ) ( not ( = ?auto_734294 ?auto_734299 ) ) ( not ( = ?auto_734294 ?auto_734300 ) ) ( not ( = ?auto_734294 ?auto_734301 ) ) ( not ( = ?auto_734294 ?auto_734302 ) ) ( not ( = ?auto_734295 ?auto_734296 ) ) ( not ( = ?auto_734295 ?auto_734297 ) ) ( not ( = ?auto_734295 ?auto_734298 ) ) ( not ( = ?auto_734295 ?auto_734299 ) ) ( not ( = ?auto_734295 ?auto_734300 ) ) ( not ( = ?auto_734295 ?auto_734301 ) ) ( not ( = ?auto_734295 ?auto_734302 ) ) ( not ( = ?auto_734296 ?auto_734297 ) ) ( not ( = ?auto_734296 ?auto_734298 ) ) ( not ( = ?auto_734296 ?auto_734299 ) ) ( not ( = ?auto_734296 ?auto_734300 ) ) ( not ( = ?auto_734296 ?auto_734301 ) ) ( not ( = ?auto_734296 ?auto_734302 ) ) ( not ( = ?auto_734297 ?auto_734298 ) ) ( not ( = ?auto_734297 ?auto_734299 ) ) ( not ( = ?auto_734297 ?auto_734300 ) ) ( not ( = ?auto_734297 ?auto_734301 ) ) ( not ( = ?auto_734297 ?auto_734302 ) ) ( not ( = ?auto_734298 ?auto_734299 ) ) ( not ( = ?auto_734298 ?auto_734300 ) ) ( not ( = ?auto_734298 ?auto_734301 ) ) ( not ( = ?auto_734298 ?auto_734302 ) ) ( not ( = ?auto_734299 ?auto_734300 ) ) ( not ( = ?auto_734299 ?auto_734301 ) ) ( not ( = ?auto_734299 ?auto_734302 ) ) ( not ( = ?auto_734300 ?auto_734301 ) ) ( not ( = ?auto_734300 ?auto_734302 ) ) ( not ( = ?auto_734301 ?auto_734302 ) ) ( ON ?auto_734300 ?auto_734301 ) ( ON ?auto_734299 ?auto_734300 ) ( ON ?auto_734298 ?auto_734299 ) ( ON ?auto_734297 ?auto_734298 ) ( ON ?auto_734296 ?auto_734297 ) ( ON ?auto_734295 ?auto_734296 ) ( ON ?auto_734294 ?auto_734295 ) ( ON ?auto_734293 ?auto_734294 ) ( CLEAR ?auto_734291 ) ( ON ?auto_734292 ?auto_734293 ) ( CLEAR ?auto_734292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_734291 ?auto_734292 )
      ( MAKE-11PILE ?auto_734291 ?auto_734292 ?auto_734293 ?auto_734294 ?auto_734295 ?auto_734296 ?auto_734297 ?auto_734298 ?auto_734299 ?auto_734300 ?auto_734301 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_734337 - BLOCK
      ?auto_734338 - BLOCK
      ?auto_734339 - BLOCK
      ?auto_734340 - BLOCK
      ?auto_734341 - BLOCK
      ?auto_734342 - BLOCK
      ?auto_734343 - BLOCK
      ?auto_734344 - BLOCK
      ?auto_734345 - BLOCK
      ?auto_734346 - BLOCK
      ?auto_734347 - BLOCK
    )
    :vars
    (
      ?auto_734348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734347 ?auto_734348 ) ( not ( = ?auto_734337 ?auto_734338 ) ) ( not ( = ?auto_734337 ?auto_734339 ) ) ( not ( = ?auto_734337 ?auto_734340 ) ) ( not ( = ?auto_734337 ?auto_734341 ) ) ( not ( = ?auto_734337 ?auto_734342 ) ) ( not ( = ?auto_734337 ?auto_734343 ) ) ( not ( = ?auto_734337 ?auto_734344 ) ) ( not ( = ?auto_734337 ?auto_734345 ) ) ( not ( = ?auto_734337 ?auto_734346 ) ) ( not ( = ?auto_734337 ?auto_734347 ) ) ( not ( = ?auto_734337 ?auto_734348 ) ) ( not ( = ?auto_734338 ?auto_734339 ) ) ( not ( = ?auto_734338 ?auto_734340 ) ) ( not ( = ?auto_734338 ?auto_734341 ) ) ( not ( = ?auto_734338 ?auto_734342 ) ) ( not ( = ?auto_734338 ?auto_734343 ) ) ( not ( = ?auto_734338 ?auto_734344 ) ) ( not ( = ?auto_734338 ?auto_734345 ) ) ( not ( = ?auto_734338 ?auto_734346 ) ) ( not ( = ?auto_734338 ?auto_734347 ) ) ( not ( = ?auto_734338 ?auto_734348 ) ) ( not ( = ?auto_734339 ?auto_734340 ) ) ( not ( = ?auto_734339 ?auto_734341 ) ) ( not ( = ?auto_734339 ?auto_734342 ) ) ( not ( = ?auto_734339 ?auto_734343 ) ) ( not ( = ?auto_734339 ?auto_734344 ) ) ( not ( = ?auto_734339 ?auto_734345 ) ) ( not ( = ?auto_734339 ?auto_734346 ) ) ( not ( = ?auto_734339 ?auto_734347 ) ) ( not ( = ?auto_734339 ?auto_734348 ) ) ( not ( = ?auto_734340 ?auto_734341 ) ) ( not ( = ?auto_734340 ?auto_734342 ) ) ( not ( = ?auto_734340 ?auto_734343 ) ) ( not ( = ?auto_734340 ?auto_734344 ) ) ( not ( = ?auto_734340 ?auto_734345 ) ) ( not ( = ?auto_734340 ?auto_734346 ) ) ( not ( = ?auto_734340 ?auto_734347 ) ) ( not ( = ?auto_734340 ?auto_734348 ) ) ( not ( = ?auto_734341 ?auto_734342 ) ) ( not ( = ?auto_734341 ?auto_734343 ) ) ( not ( = ?auto_734341 ?auto_734344 ) ) ( not ( = ?auto_734341 ?auto_734345 ) ) ( not ( = ?auto_734341 ?auto_734346 ) ) ( not ( = ?auto_734341 ?auto_734347 ) ) ( not ( = ?auto_734341 ?auto_734348 ) ) ( not ( = ?auto_734342 ?auto_734343 ) ) ( not ( = ?auto_734342 ?auto_734344 ) ) ( not ( = ?auto_734342 ?auto_734345 ) ) ( not ( = ?auto_734342 ?auto_734346 ) ) ( not ( = ?auto_734342 ?auto_734347 ) ) ( not ( = ?auto_734342 ?auto_734348 ) ) ( not ( = ?auto_734343 ?auto_734344 ) ) ( not ( = ?auto_734343 ?auto_734345 ) ) ( not ( = ?auto_734343 ?auto_734346 ) ) ( not ( = ?auto_734343 ?auto_734347 ) ) ( not ( = ?auto_734343 ?auto_734348 ) ) ( not ( = ?auto_734344 ?auto_734345 ) ) ( not ( = ?auto_734344 ?auto_734346 ) ) ( not ( = ?auto_734344 ?auto_734347 ) ) ( not ( = ?auto_734344 ?auto_734348 ) ) ( not ( = ?auto_734345 ?auto_734346 ) ) ( not ( = ?auto_734345 ?auto_734347 ) ) ( not ( = ?auto_734345 ?auto_734348 ) ) ( not ( = ?auto_734346 ?auto_734347 ) ) ( not ( = ?auto_734346 ?auto_734348 ) ) ( not ( = ?auto_734347 ?auto_734348 ) ) ( ON ?auto_734346 ?auto_734347 ) ( ON ?auto_734345 ?auto_734346 ) ( ON ?auto_734344 ?auto_734345 ) ( ON ?auto_734343 ?auto_734344 ) ( ON ?auto_734342 ?auto_734343 ) ( ON ?auto_734341 ?auto_734342 ) ( ON ?auto_734340 ?auto_734341 ) ( ON ?auto_734339 ?auto_734340 ) ( ON ?auto_734338 ?auto_734339 ) ( ON ?auto_734337 ?auto_734338 ) ( CLEAR ?auto_734337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_734337 )
      ( MAKE-11PILE ?auto_734337 ?auto_734338 ?auto_734339 ?auto_734340 ?auto_734341 ?auto_734342 ?auto_734343 ?auto_734344 ?auto_734345 ?auto_734346 ?auto_734347 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734384 - BLOCK
      ?auto_734385 - BLOCK
      ?auto_734386 - BLOCK
      ?auto_734387 - BLOCK
      ?auto_734388 - BLOCK
      ?auto_734389 - BLOCK
      ?auto_734390 - BLOCK
      ?auto_734391 - BLOCK
      ?auto_734392 - BLOCK
      ?auto_734393 - BLOCK
      ?auto_734394 - BLOCK
      ?auto_734395 - BLOCK
    )
    :vars
    (
      ?auto_734396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_734394 ) ( ON ?auto_734395 ?auto_734396 ) ( CLEAR ?auto_734395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_734384 ) ( ON ?auto_734385 ?auto_734384 ) ( ON ?auto_734386 ?auto_734385 ) ( ON ?auto_734387 ?auto_734386 ) ( ON ?auto_734388 ?auto_734387 ) ( ON ?auto_734389 ?auto_734388 ) ( ON ?auto_734390 ?auto_734389 ) ( ON ?auto_734391 ?auto_734390 ) ( ON ?auto_734392 ?auto_734391 ) ( ON ?auto_734393 ?auto_734392 ) ( ON ?auto_734394 ?auto_734393 ) ( not ( = ?auto_734384 ?auto_734385 ) ) ( not ( = ?auto_734384 ?auto_734386 ) ) ( not ( = ?auto_734384 ?auto_734387 ) ) ( not ( = ?auto_734384 ?auto_734388 ) ) ( not ( = ?auto_734384 ?auto_734389 ) ) ( not ( = ?auto_734384 ?auto_734390 ) ) ( not ( = ?auto_734384 ?auto_734391 ) ) ( not ( = ?auto_734384 ?auto_734392 ) ) ( not ( = ?auto_734384 ?auto_734393 ) ) ( not ( = ?auto_734384 ?auto_734394 ) ) ( not ( = ?auto_734384 ?auto_734395 ) ) ( not ( = ?auto_734384 ?auto_734396 ) ) ( not ( = ?auto_734385 ?auto_734386 ) ) ( not ( = ?auto_734385 ?auto_734387 ) ) ( not ( = ?auto_734385 ?auto_734388 ) ) ( not ( = ?auto_734385 ?auto_734389 ) ) ( not ( = ?auto_734385 ?auto_734390 ) ) ( not ( = ?auto_734385 ?auto_734391 ) ) ( not ( = ?auto_734385 ?auto_734392 ) ) ( not ( = ?auto_734385 ?auto_734393 ) ) ( not ( = ?auto_734385 ?auto_734394 ) ) ( not ( = ?auto_734385 ?auto_734395 ) ) ( not ( = ?auto_734385 ?auto_734396 ) ) ( not ( = ?auto_734386 ?auto_734387 ) ) ( not ( = ?auto_734386 ?auto_734388 ) ) ( not ( = ?auto_734386 ?auto_734389 ) ) ( not ( = ?auto_734386 ?auto_734390 ) ) ( not ( = ?auto_734386 ?auto_734391 ) ) ( not ( = ?auto_734386 ?auto_734392 ) ) ( not ( = ?auto_734386 ?auto_734393 ) ) ( not ( = ?auto_734386 ?auto_734394 ) ) ( not ( = ?auto_734386 ?auto_734395 ) ) ( not ( = ?auto_734386 ?auto_734396 ) ) ( not ( = ?auto_734387 ?auto_734388 ) ) ( not ( = ?auto_734387 ?auto_734389 ) ) ( not ( = ?auto_734387 ?auto_734390 ) ) ( not ( = ?auto_734387 ?auto_734391 ) ) ( not ( = ?auto_734387 ?auto_734392 ) ) ( not ( = ?auto_734387 ?auto_734393 ) ) ( not ( = ?auto_734387 ?auto_734394 ) ) ( not ( = ?auto_734387 ?auto_734395 ) ) ( not ( = ?auto_734387 ?auto_734396 ) ) ( not ( = ?auto_734388 ?auto_734389 ) ) ( not ( = ?auto_734388 ?auto_734390 ) ) ( not ( = ?auto_734388 ?auto_734391 ) ) ( not ( = ?auto_734388 ?auto_734392 ) ) ( not ( = ?auto_734388 ?auto_734393 ) ) ( not ( = ?auto_734388 ?auto_734394 ) ) ( not ( = ?auto_734388 ?auto_734395 ) ) ( not ( = ?auto_734388 ?auto_734396 ) ) ( not ( = ?auto_734389 ?auto_734390 ) ) ( not ( = ?auto_734389 ?auto_734391 ) ) ( not ( = ?auto_734389 ?auto_734392 ) ) ( not ( = ?auto_734389 ?auto_734393 ) ) ( not ( = ?auto_734389 ?auto_734394 ) ) ( not ( = ?auto_734389 ?auto_734395 ) ) ( not ( = ?auto_734389 ?auto_734396 ) ) ( not ( = ?auto_734390 ?auto_734391 ) ) ( not ( = ?auto_734390 ?auto_734392 ) ) ( not ( = ?auto_734390 ?auto_734393 ) ) ( not ( = ?auto_734390 ?auto_734394 ) ) ( not ( = ?auto_734390 ?auto_734395 ) ) ( not ( = ?auto_734390 ?auto_734396 ) ) ( not ( = ?auto_734391 ?auto_734392 ) ) ( not ( = ?auto_734391 ?auto_734393 ) ) ( not ( = ?auto_734391 ?auto_734394 ) ) ( not ( = ?auto_734391 ?auto_734395 ) ) ( not ( = ?auto_734391 ?auto_734396 ) ) ( not ( = ?auto_734392 ?auto_734393 ) ) ( not ( = ?auto_734392 ?auto_734394 ) ) ( not ( = ?auto_734392 ?auto_734395 ) ) ( not ( = ?auto_734392 ?auto_734396 ) ) ( not ( = ?auto_734393 ?auto_734394 ) ) ( not ( = ?auto_734393 ?auto_734395 ) ) ( not ( = ?auto_734393 ?auto_734396 ) ) ( not ( = ?auto_734394 ?auto_734395 ) ) ( not ( = ?auto_734394 ?auto_734396 ) ) ( not ( = ?auto_734395 ?auto_734396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_734395 ?auto_734396 )
      ( !STACK ?auto_734395 ?auto_734394 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734434 - BLOCK
      ?auto_734435 - BLOCK
      ?auto_734436 - BLOCK
      ?auto_734437 - BLOCK
      ?auto_734438 - BLOCK
      ?auto_734439 - BLOCK
      ?auto_734440 - BLOCK
      ?auto_734441 - BLOCK
      ?auto_734442 - BLOCK
      ?auto_734443 - BLOCK
      ?auto_734444 - BLOCK
      ?auto_734445 - BLOCK
    )
    :vars
    (
      ?auto_734446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734445 ?auto_734446 ) ( ON-TABLE ?auto_734434 ) ( ON ?auto_734435 ?auto_734434 ) ( ON ?auto_734436 ?auto_734435 ) ( ON ?auto_734437 ?auto_734436 ) ( ON ?auto_734438 ?auto_734437 ) ( ON ?auto_734439 ?auto_734438 ) ( ON ?auto_734440 ?auto_734439 ) ( ON ?auto_734441 ?auto_734440 ) ( ON ?auto_734442 ?auto_734441 ) ( ON ?auto_734443 ?auto_734442 ) ( not ( = ?auto_734434 ?auto_734435 ) ) ( not ( = ?auto_734434 ?auto_734436 ) ) ( not ( = ?auto_734434 ?auto_734437 ) ) ( not ( = ?auto_734434 ?auto_734438 ) ) ( not ( = ?auto_734434 ?auto_734439 ) ) ( not ( = ?auto_734434 ?auto_734440 ) ) ( not ( = ?auto_734434 ?auto_734441 ) ) ( not ( = ?auto_734434 ?auto_734442 ) ) ( not ( = ?auto_734434 ?auto_734443 ) ) ( not ( = ?auto_734434 ?auto_734444 ) ) ( not ( = ?auto_734434 ?auto_734445 ) ) ( not ( = ?auto_734434 ?auto_734446 ) ) ( not ( = ?auto_734435 ?auto_734436 ) ) ( not ( = ?auto_734435 ?auto_734437 ) ) ( not ( = ?auto_734435 ?auto_734438 ) ) ( not ( = ?auto_734435 ?auto_734439 ) ) ( not ( = ?auto_734435 ?auto_734440 ) ) ( not ( = ?auto_734435 ?auto_734441 ) ) ( not ( = ?auto_734435 ?auto_734442 ) ) ( not ( = ?auto_734435 ?auto_734443 ) ) ( not ( = ?auto_734435 ?auto_734444 ) ) ( not ( = ?auto_734435 ?auto_734445 ) ) ( not ( = ?auto_734435 ?auto_734446 ) ) ( not ( = ?auto_734436 ?auto_734437 ) ) ( not ( = ?auto_734436 ?auto_734438 ) ) ( not ( = ?auto_734436 ?auto_734439 ) ) ( not ( = ?auto_734436 ?auto_734440 ) ) ( not ( = ?auto_734436 ?auto_734441 ) ) ( not ( = ?auto_734436 ?auto_734442 ) ) ( not ( = ?auto_734436 ?auto_734443 ) ) ( not ( = ?auto_734436 ?auto_734444 ) ) ( not ( = ?auto_734436 ?auto_734445 ) ) ( not ( = ?auto_734436 ?auto_734446 ) ) ( not ( = ?auto_734437 ?auto_734438 ) ) ( not ( = ?auto_734437 ?auto_734439 ) ) ( not ( = ?auto_734437 ?auto_734440 ) ) ( not ( = ?auto_734437 ?auto_734441 ) ) ( not ( = ?auto_734437 ?auto_734442 ) ) ( not ( = ?auto_734437 ?auto_734443 ) ) ( not ( = ?auto_734437 ?auto_734444 ) ) ( not ( = ?auto_734437 ?auto_734445 ) ) ( not ( = ?auto_734437 ?auto_734446 ) ) ( not ( = ?auto_734438 ?auto_734439 ) ) ( not ( = ?auto_734438 ?auto_734440 ) ) ( not ( = ?auto_734438 ?auto_734441 ) ) ( not ( = ?auto_734438 ?auto_734442 ) ) ( not ( = ?auto_734438 ?auto_734443 ) ) ( not ( = ?auto_734438 ?auto_734444 ) ) ( not ( = ?auto_734438 ?auto_734445 ) ) ( not ( = ?auto_734438 ?auto_734446 ) ) ( not ( = ?auto_734439 ?auto_734440 ) ) ( not ( = ?auto_734439 ?auto_734441 ) ) ( not ( = ?auto_734439 ?auto_734442 ) ) ( not ( = ?auto_734439 ?auto_734443 ) ) ( not ( = ?auto_734439 ?auto_734444 ) ) ( not ( = ?auto_734439 ?auto_734445 ) ) ( not ( = ?auto_734439 ?auto_734446 ) ) ( not ( = ?auto_734440 ?auto_734441 ) ) ( not ( = ?auto_734440 ?auto_734442 ) ) ( not ( = ?auto_734440 ?auto_734443 ) ) ( not ( = ?auto_734440 ?auto_734444 ) ) ( not ( = ?auto_734440 ?auto_734445 ) ) ( not ( = ?auto_734440 ?auto_734446 ) ) ( not ( = ?auto_734441 ?auto_734442 ) ) ( not ( = ?auto_734441 ?auto_734443 ) ) ( not ( = ?auto_734441 ?auto_734444 ) ) ( not ( = ?auto_734441 ?auto_734445 ) ) ( not ( = ?auto_734441 ?auto_734446 ) ) ( not ( = ?auto_734442 ?auto_734443 ) ) ( not ( = ?auto_734442 ?auto_734444 ) ) ( not ( = ?auto_734442 ?auto_734445 ) ) ( not ( = ?auto_734442 ?auto_734446 ) ) ( not ( = ?auto_734443 ?auto_734444 ) ) ( not ( = ?auto_734443 ?auto_734445 ) ) ( not ( = ?auto_734443 ?auto_734446 ) ) ( not ( = ?auto_734444 ?auto_734445 ) ) ( not ( = ?auto_734444 ?auto_734446 ) ) ( not ( = ?auto_734445 ?auto_734446 ) ) ( CLEAR ?auto_734443 ) ( ON ?auto_734444 ?auto_734445 ) ( CLEAR ?auto_734444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_734434 ?auto_734435 ?auto_734436 ?auto_734437 ?auto_734438 ?auto_734439 ?auto_734440 ?auto_734441 ?auto_734442 ?auto_734443 ?auto_734444 )
      ( MAKE-12PILE ?auto_734434 ?auto_734435 ?auto_734436 ?auto_734437 ?auto_734438 ?auto_734439 ?auto_734440 ?auto_734441 ?auto_734442 ?auto_734443 ?auto_734444 ?auto_734445 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734484 - BLOCK
      ?auto_734485 - BLOCK
      ?auto_734486 - BLOCK
      ?auto_734487 - BLOCK
      ?auto_734488 - BLOCK
      ?auto_734489 - BLOCK
      ?auto_734490 - BLOCK
      ?auto_734491 - BLOCK
      ?auto_734492 - BLOCK
      ?auto_734493 - BLOCK
      ?auto_734494 - BLOCK
      ?auto_734495 - BLOCK
    )
    :vars
    (
      ?auto_734496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734495 ?auto_734496 ) ( ON-TABLE ?auto_734484 ) ( ON ?auto_734485 ?auto_734484 ) ( ON ?auto_734486 ?auto_734485 ) ( ON ?auto_734487 ?auto_734486 ) ( ON ?auto_734488 ?auto_734487 ) ( ON ?auto_734489 ?auto_734488 ) ( ON ?auto_734490 ?auto_734489 ) ( ON ?auto_734491 ?auto_734490 ) ( ON ?auto_734492 ?auto_734491 ) ( not ( = ?auto_734484 ?auto_734485 ) ) ( not ( = ?auto_734484 ?auto_734486 ) ) ( not ( = ?auto_734484 ?auto_734487 ) ) ( not ( = ?auto_734484 ?auto_734488 ) ) ( not ( = ?auto_734484 ?auto_734489 ) ) ( not ( = ?auto_734484 ?auto_734490 ) ) ( not ( = ?auto_734484 ?auto_734491 ) ) ( not ( = ?auto_734484 ?auto_734492 ) ) ( not ( = ?auto_734484 ?auto_734493 ) ) ( not ( = ?auto_734484 ?auto_734494 ) ) ( not ( = ?auto_734484 ?auto_734495 ) ) ( not ( = ?auto_734484 ?auto_734496 ) ) ( not ( = ?auto_734485 ?auto_734486 ) ) ( not ( = ?auto_734485 ?auto_734487 ) ) ( not ( = ?auto_734485 ?auto_734488 ) ) ( not ( = ?auto_734485 ?auto_734489 ) ) ( not ( = ?auto_734485 ?auto_734490 ) ) ( not ( = ?auto_734485 ?auto_734491 ) ) ( not ( = ?auto_734485 ?auto_734492 ) ) ( not ( = ?auto_734485 ?auto_734493 ) ) ( not ( = ?auto_734485 ?auto_734494 ) ) ( not ( = ?auto_734485 ?auto_734495 ) ) ( not ( = ?auto_734485 ?auto_734496 ) ) ( not ( = ?auto_734486 ?auto_734487 ) ) ( not ( = ?auto_734486 ?auto_734488 ) ) ( not ( = ?auto_734486 ?auto_734489 ) ) ( not ( = ?auto_734486 ?auto_734490 ) ) ( not ( = ?auto_734486 ?auto_734491 ) ) ( not ( = ?auto_734486 ?auto_734492 ) ) ( not ( = ?auto_734486 ?auto_734493 ) ) ( not ( = ?auto_734486 ?auto_734494 ) ) ( not ( = ?auto_734486 ?auto_734495 ) ) ( not ( = ?auto_734486 ?auto_734496 ) ) ( not ( = ?auto_734487 ?auto_734488 ) ) ( not ( = ?auto_734487 ?auto_734489 ) ) ( not ( = ?auto_734487 ?auto_734490 ) ) ( not ( = ?auto_734487 ?auto_734491 ) ) ( not ( = ?auto_734487 ?auto_734492 ) ) ( not ( = ?auto_734487 ?auto_734493 ) ) ( not ( = ?auto_734487 ?auto_734494 ) ) ( not ( = ?auto_734487 ?auto_734495 ) ) ( not ( = ?auto_734487 ?auto_734496 ) ) ( not ( = ?auto_734488 ?auto_734489 ) ) ( not ( = ?auto_734488 ?auto_734490 ) ) ( not ( = ?auto_734488 ?auto_734491 ) ) ( not ( = ?auto_734488 ?auto_734492 ) ) ( not ( = ?auto_734488 ?auto_734493 ) ) ( not ( = ?auto_734488 ?auto_734494 ) ) ( not ( = ?auto_734488 ?auto_734495 ) ) ( not ( = ?auto_734488 ?auto_734496 ) ) ( not ( = ?auto_734489 ?auto_734490 ) ) ( not ( = ?auto_734489 ?auto_734491 ) ) ( not ( = ?auto_734489 ?auto_734492 ) ) ( not ( = ?auto_734489 ?auto_734493 ) ) ( not ( = ?auto_734489 ?auto_734494 ) ) ( not ( = ?auto_734489 ?auto_734495 ) ) ( not ( = ?auto_734489 ?auto_734496 ) ) ( not ( = ?auto_734490 ?auto_734491 ) ) ( not ( = ?auto_734490 ?auto_734492 ) ) ( not ( = ?auto_734490 ?auto_734493 ) ) ( not ( = ?auto_734490 ?auto_734494 ) ) ( not ( = ?auto_734490 ?auto_734495 ) ) ( not ( = ?auto_734490 ?auto_734496 ) ) ( not ( = ?auto_734491 ?auto_734492 ) ) ( not ( = ?auto_734491 ?auto_734493 ) ) ( not ( = ?auto_734491 ?auto_734494 ) ) ( not ( = ?auto_734491 ?auto_734495 ) ) ( not ( = ?auto_734491 ?auto_734496 ) ) ( not ( = ?auto_734492 ?auto_734493 ) ) ( not ( = ?auto_734492 ?auto_734494 ) ) ( not ( = ?auto_734492 ?auto_734495 ) ) ( not ( = ?auto_734492 ?auto_734496 ) ) ( not ( = ?auto_734493 ?auto_734494 ) ) ( not ( = ?auto_734493 ?auto_734495 ) ) ( not ( = ?auto_734493 ?auto_734496 ) ) ( not ( = ?auto_734494 ?auto_734495 ) ) ( not ( = ?auto_734494 ?auto_734496 ) ) ( not ( = ?auto_734495 ?auto_734496 ) ) ( ON ?auto_734494 ?auto_734495 ) ( CLEAR ?auto_734492 ) ( ON ?auto_734493 ?auto_734494 ) ( CLEAR ?auto_734493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_734484 ?auto_734485 ?auto_734486 ?auto_734487 ?auto_734488 ?auto_734489 ?auto_734490 ?auto_734491 ?auto_734492 ?auto_734493 )
      ( MAKE-12PILE ?auto_734484 ?auto_734485 ?auto_734486 ?auto_734487 ?auto_734488 ?auto_734489 ?auto_734490 ?auto_734491 ?auto_734492 ?auto_734493 ?auto_734494 ?auto_734495 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734534 - BLOCK
      ?auto_734535 - BLOCK
      ?auto_734536 - BLOCK
      ?auto_734537 - BLOCK
      ?auto_734538 - BLOCK
      ?auto_734539 - BLOCK
      ?auto_734540 - BLOCK
      ?auto_734541 - BLOCK
      ?auto_734542 - BLOCK
      ?auto_734543 - BLOCK
      ?auto_734544 - BLOCK
      ?auto_734545 - BLOCK
    )
    :vars
    (
      ?auto_734546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734545 ?auto_734546 ) ( ON-TABLE ?auto_734534 ) ( ON ?auto_734535 ?auto_734534 ) ( ON ?auto_734536 ?auto_734535 ) ( ON ?auto_734537 ?auto_734536 ) ( ON ?auto_734538 ?auto_734537 ) ( ON ?auto_734539 ?auto_734538 ) ( ON ?auto_734540 ?auto_734539 ) ( ON ?auto_734541 ?auto_734540 ) ( not ( = ?auto_734534 ?auto_734535 ) ) ( not ( = ?auto_734534 ?auto_734536 ) ) ( not ( = ?auto_734534 ?auto_734537 ) ) ( not ( = ?auto_734534 ?auto_734538 ) ) ( not ( = ?auto_734534 ?auto_734539 ) ) ( not ( = ?auto_734534 ?auto_734540 ) ) ( not ( = ?auto_734534 ?auto_734541 ) ) ( not ( = ?auto_734534 ?auto_734542 ) ) ( not ( = ?auto_734534 ?auto_734543 ) ) ( not ( = ?auto_734534 ?auto_734544 ) ) ( not ( = ?auto_734534 ?auto_734545 ) ) ( not ( = ?auto_734534 ?auto_734546 ) ) ( not ( = ?auto_734535 ?auto_734536 ) ) ( not ( = ?auto_734535 ?auto_734537 ) ) ( not ( = ?auto_734535 ?auto_734538 ) ) ( not ( = ?auto_734535 ?auto_734539 ) ) ( not ( = ?auto_734535 ?auto_734540 ) ) ( not ( = ?auto_734535 ?auto_734541 ) ) ( not ( = ?auto_734535 ?auto_734542 ) ) ( not ( = ?auto_734535 ?auto_734543 ) ) ( not ( = ?auto_734535 ?auto_734544 ) ) ( not ( = ?auto_734535 ?auto_734545 ) ) ( not ( = ?auto_734535 ?auto_734546 ) ) ( not ( = ?auto_734536 ?auto_734537 ) ) ( not ( = ?auto_734536 ?auto_734538 ) ) ( not ( = ?auto_734536 ?auto_734539 ) ) ( not ( = ?auto_734536 ?auto_734540 ) ) ( not ( = ?auto_734536 ?auto_734541 ) ) ( not ( = ?auto_734536 ?auto_734542 ) ) ( not ( = ?auto_734536 ?auto_734543 ) ) ( not ( = ?auto_734536 ?auto_734544 ) ) ( not ( = ?auto_734536 ?auto_734545 ) ) ( not ( = ?auto_734536 ?auto_734546 ) ) ( not ( = ?auto_734537 ?auto_734538 ) ) ( not ( = ?auto_734537 ?auto_734539 ) ) ( not ( = ?auto_734537 ?auto_734540 ) ) ( not ( = ?auto_734537 ?auto_734541 ) ) ( not ( = ?auto_734537 ?auto_734542 ) ) ( not ( = ?auto_734537 ?auto_734543 ) ) ( not ( = ?auto_734537 ?auto_734544 ) ) ( not ( = ?auto_734537 ?auto_734545 ) ) ( not ( = ?auto_734537 ?auto_734546 ) ) ( not ( = ?auto_734538 ?auto_734539 ) ) ( not ( = ?auto_734538 ?auto_734540 ) ) ( not ( = ?auto_734538 ?auto_734541 ) ) ( not ( = ?auto_734538 ?auto_734542 ) ) ( not ( = ?auto_734538 ?auto_734543 ) ) ( not ( = ?auto_734538 ?auto_734544 ) ) ( not ( = ?auto_734538 ?auto_734545 ) ) ( not ( = ?auto_734538 ?auto_734546 ) ) ( not ( = ?auto_734539 ?auto_734540 ) ) ( not ( = ?auto_734539 ?auto_734541 ) ) ( not ( = ?auto_734539 ?auto_734542 ) ) ( not ( = ?auto_734539 ?auto_734543 ) ) ( not ( = ?auto_734539 ?auto_734544 ) ) ( not ( = ?auto_734539 ?auto_734545 ) ) ( not ( = ?auto_734539 ?auto_734546 ) ) ( not ( = ?auto_734540 ?auto_734541 ) ) ( not ( = ?auto_734540 ?auto_734542 ) ) ( not ( = ?auto_734540 ?auto_734543 ) ) ( not ( = ?auto_734540 ?auto_734544 ) ) ( not ( = ?auto_734540 ?auto_734545 ) ) ( not ( = ?auto_734540 ?auto_734546 ) ) ( not ( = ?auto_734541 ?auto_734542 ) ) ( not ( = ?auto_734541 ?auto_734543 ) ) ( not ( = ?auto_734541 ?auto_734544 ) ) ( not ( = ?auto_734541 ?auto_734545 ) ) ( not ( = ?auto_734541 ?auto_734546 ) ) ( not ( = ?auto_734542 ?auto_734543 ) ) ( not ( = ?auto_734542 ?auto_734544 ) ) ( not ( = ?auto_734542 ?auto_734545 ) ) ( not ( = ?auto_734542 ?auto_734546 ) ) ( not ( = ?auto_734543 ?auto_734544 ) ) ( not ( = ?auto_734543 ?auto_734545 ) ) ( not ( = ?auto_734543 ?auto_734546 ) ) ( not ( = ?auto_734544 ?auto_734545 ) ) ( not ( = ?auto_734544 ?auto_734546 ) ) ( not ( = ?auto_734545 ?auto_734546 ) ) ( ON ?auto_734544 ?auto_734545 ) ( ON ?auto_734543 ?auto_734544 ) ( CLEAR ?auto_734541 ) ( ON ?auto_734542 ?auto_734543 ) ( CLEAR ?auto_734542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_734534 ?auto_734535 ?auto_734536 ?auto_734537 ?auto_734538 ?auto_734539 ?auto_734540 ?auto_734541 ?auto_734542 )
      ( MAKE-12PILE ?auto_734534 ?auto_734535 ?auto_734536 ?auto_734537 ?auto_734538 ?auto_734539 ?auto_734540 ?auto_734541 ?auto_734542 ?auto_734543 ?auto_734544 ?auto_734545 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734584 - BLOCK
      ?auto_734585 - BLOCK
      ?auto_734586 - BLOCK
      ?auto_734587 - BLOCK
      ?auto_734588 - BLOCK
      ?auto_734589 - BLOCK
      ?auto_734590 - BLOCK
      ?auto_734591 - BLOCK
      ?auto_734592 - BLOCK
      ?auto_734593 - BLOCK
      ?auto_734594 - BLOCK
      ?auto_734595 - BLOCK
    )
    :vars
    (
      ?auto_734596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734595 ?auto_734596 ) ( ON-TABLE ?auto_734584 ) ( ON ?auto_734585 ?auto_734584 ) ( ON ?auto_734586 ?auto_734585 ) ( ON ?auto_734587 ?auto_734586 ) ( ON ?auto_734588 ?auto_734587 ) ( ON ?auto_734589 ?auto_734588 ) ( ON ?auto_734590 ?auto_734589 ) ( not ( = ?auto_734584 ?auto_734585 ) ) ( not ( = ?auto_734584 ?auto_734586 ) ) ( not ( = ?auto_734584 ?auto_734587 ) ) ( not ( = ?auto_734584 ?auto_734588 ) ) ( not ( = ?auto_734584 ?auto_734589 ) ) ( not ( = ?auto_734584 ?auto_734590 ) ) ( not ( = ?auto_734584 ?auto_734591 ) ) ( not ( = ?auto_734584 ?auto_734592 ) ) ( not ( = ?auto_734584 ?auto_734593 ) ) ( not ( = ?auto_734584 ?auto_734594 ) ) ( not ( = ?auto_734584 ?auto_734595 ) ) ( not ( = ?auto_734584 ?auto_734596 ) ) ( not ( = ?auto_734585 ?auto_734586 ) ) ( not ( = ?auto_734585 ?auto_734587 ) ) ( not ( = ?auto_734585 ?auto_734588 ) ) ( not ( = ?auto_734585 ?auto_734589 ) ) ( not ( = ?auto_734585 ?auto_734590 ) ) ( not ( = ?auto_734585 ?auto_734591 ) ) ( not ( = ?auto_734585 ?auto_734592 ) ) ( not ( = ?auto_734585 ?auto_734593 ) ) ( not ( = ?auto_734585 ?auto_734594 ) ) ( not ( = ?auto_734585 ?auto_734595 ) ) ( not ( = ?auto_734585 ?auto_734596 ) ) ( not ( = ?auto_734586 ?auto_734587 ) ) ( not ( = ?auto_734586 ?auto_734588 ) ) ( not ( = ?auto_734586 ?auto_734589 ) ) ( not ( = ?auto_734586 ?auto_734590 ) ) ( not ( = ?auto_734586 ?auto_734591 ) ) ( not ( = ?auto_734586 ?auto_734592 ) ) ( not ( = ?auto_734586 ?auto_734593 ) ) ( not ( = ?auto_734586 ?auto_734594 ) ) ( not ( = ?auto_734586 ?auto_734595 ) ) ( not ( = ?auto_734586 ?auto_734596 ) ) ( not ( = ?auto_734587 ?auto_734588 ) ) ( not ( = ?auto_734587 ?auto_734589 ) ) ( not ( = ?auto_734587 ?auto_734590 ) ) ( not ( = ?auto_734587 ?auto_734591 ) ) ( not ( = ?auto_734587 ?auto_734592 ) ) ( not ( = ?auto_734587 ?auto_734593 ) ) ( not ( = ?auto_734587 ?auto_734594 ) ) ( not ( = ?auto_734587 ?auto_734595 ) ) ( not ( = ?auto_734587 ?auto_734596 ) ) ( not ( = ?auto_734588 ?auto_734589 ) ) ( not ( = ?auto_734588 ?auto_734590 ) ) ( not ( = ?auto_734588 ?auto_734591 ) ) ( not ( = ?auto_734588 ?auto_734592 ) ) ( not ( = ?auto_734588 ?auto_734593 ) ) ( not ( = ?auto_734588 ?auto_734594 ) ) ( not ( = ?auto_734588 ?auto_734595 ) ) ( not ( = ?auto_734588 ?auto_734596 ) ) ( not ( = ?auto_734589 ?auto_734590 ) ) ( not ( = ?auto_734589 ?auto_734591 ) ) ( not ( = ?auto_734589 ?auto_734592 ) ) ( not ( = ?auto_734589 ?auto_734593 ) ) ( not ( = ?auto_734589 ?auto_734594 ) ) ( not ( = ?auto_734589 ?auto_734595 ) ) ( not ( = ?auto_734589 ?auto_734596 ) ) ( not ( = ?auto_734590 ?auto_734591 ) ) ( not ( = ?auto_734590 ?auto_734592 ) ) ( not ( = ?auto_734590 ?auto_734593 ) ) ( not ( = ?auto_734590 ?auto_734594 ) ) ( not ( = ?auto_734590 ?auto_734595 ) ) ( not ( = ?auto_734590 ?auto_734596 ) ) ( not ( = ?auto_734591 ?auto_734592 ) ) ( not ( = ?auto_734591 ?auto_734593 ) ) ( not ( = ?auto_734591 ?auto_734594 ) ) ( not ( = ?auto_734591 ?auto_734595 ) ) ( not ( = ?auto_734591 ?auto_734596 ) ) ( not ( = ?auto_734592 ?auto_734593 ) ) ( not ( = ?auto_734592 ?auto_734594 ) ) ( not ( = ?auto_734592 ?auto_734595 ) ) ( not ( = ?auto_734592 ?auto_734596 ) ) ( not ( = ?auto_734593 ?auto_734594 ) ) ( not ( = ?auto_734593 ?auto_734595 ) ) ( not ( = ?auto_734593 ?auto_734596 ) ) ( not ( = ?auto_734594 ?auto_734595 ) ) ( not ( = ?auto_734594 ?auto_734596 ) ) ( not ( = ?auto_734595 ?auto_734596 ) ) ( ON ?auto_734594 ?auto_734595 ) ( ON ?auto_734593 ?auto_734594 ) ( ON ?auto_734592 ?auto_734593 ) ( CLEAR ?auto_734590 ) ( ON ?auto_734591 ?auto_734592 ) ( CLEAR ?auto_734591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_734584 ?auto_734585 ?auto_734586 ?auto_734587 ?auto_734588 ?auto_734589 ?auto_734590 ?auto_734591 )
      ( MAKE-12PILE ?auto_734584 ?auto_734585 ?auto_734586 ?auto_734587 ?auto_734588 ?auto_734589 ?auto_734590 ?auto_734591 ?auto_734592 ?auto_734593 ?auto_734594 ?auto_734595 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734634 - BLOCK
      ?auto_734635 - BLOCK
      ?auto_734636 - BLOCK
      ?auto_734637 - BLOCK
      ?auto_734638 - BLOCK
      ?auto_734639 - BLOCK
      ?auto_734640 - BLOCK
      ?auto_734641 - BLOCK
      ?auto_734642 - BLOCK
      ?auto_734643 - BLOCK
      ?auto_734644 - BLOCK
      ?auto_734645 - BLOCK
    )
    :vars
    (
      ?auto_734646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734645 ?auto_734646 ) ( ON-TABLE ?auto_734634 ) ( ON ?auto_734635 ?auto_734634 ) ( ON ?auto_734636 ?auto_734635 ) ( ON ?auto_734637 ?auto_734636 ) ( ON ?auto_734638 ?auto_734637 ) ( ON ?auto_734639 ?auto_734638 ) ( not ( = ?auto_734634 ?auto_734635 ) ) ( not ( = ?auto_734634 ?auto_734636 ) ) ( not ( = ?auto_734634 ?auto_734637 ) ) ( not ( = ?auto_734634 ?auto_734638 ) ) ( not ( = ?auto_734634 ?auto_734639 ) ) ( not ( = ?auto_734634 ?auto_734640 ) ) ( not ( = ?auto_734634 ?auto_734641 ) ) ( not ( = ?auto_734634 ?auto_734642 ) ) ( not ( = ?auto_734634 ?auto_734643 ) ) ( not ( = ?auto_734634 ?auto_734644 ) ) ( not ( = ?auto_734634 ?auto_734645 ) ) ( not ( = ?auto_734634 ?auto_734646 ) ) ( not ( = ?auto_734635 ?auto_734636 ) ) ( not ( = ?auto_734635 ?auto_734637 ) ) ( not ( = ?auto_734635 ?auto_734638 ) ) ( not ( = ?auto_734635 ?auto_734639 ) ) ( not ( = ?auto_734635 ?auto_734640 ) ) ( not ( = ?auto_734635 ?auto_734641 ) ) ( not ( = ?auto_734635 ?auto_734642 ) ) ( not ( = ?auto_734635 ?auto_734643 ) ) ( not ( = ?auto_734635 ?auto_734644 ) ) ( not ( = ?auto_734635 ?auto_734645 ) ) ( not ( = ?auto_734635 ?auto_734646 ) ) ( not ( = ?auto_734636 ?auto_734637 ) ) ( not ( = ?auto_734636 ?auto_734638 ) ) ( not ( = ?auto_734636 ?auto_734639 ) ) ( not ( = ?auto_734636 ?auto_734640 ) ) ( not ( = ?auto_734636 ?auto_734641 ) ) ( not ( = ?auto_734636 ?auto_734642 ) ) ( not ( = ?auto_734636 ?auto_734643 ) ) ( not ( = ?auto_734636 ?auto_734644 ) ) ( not ( = ?auto_734636 ?auto_734645 ) ) ( not ( = ?auto_734636 ?auto_734646 ) ) ( not ( = ?auto_734637 ?auto_734638 ) ) ( not ( = ?auto_734637 ?auto_734639 ) ) ( not ( = ?auto_734637 ?auto_734640 ) ) ( not ( = ?auto_734637 ?auto_734641 ) ) ( not ( = ?auto_734637 ?auto_734642 ) ) ( not ( = ?auto_734637 ?auto_734643 ) ) ( not ( = ?auto_734637 ?auto_734644 ) ) ( not ( = ?auto_734637 ?auto_734645 ) ) ( not ( = ?auto_734637 ?auto_734646 ) ) ( not ( = ?auto_734638 ?auto_734639 ) ) ( not ( = ?auto_734638 ?auto_734640 ) ) ( not ( = ?auto_734638 ?auto_734641 ) ) ( not ( = ?auto_734638 ?auto_734642 ) ) ( not ( = ?auto_734638 ?auto_734643 ) ) ( not ( = ?auto_734638 ?auto_734644 ) ) ( not ( = ?auto_734638 ?auto_734645 ) ) ( not ( = ?auto_734638 ?auto_734646 ) ) ( not ( = ?auto_734639 ?auto_734640 ) ) ( not ( = ?auto_734639 ?auto_734641 ) ) ( not ( = ?auto_734639 ?auto_734642 ) ) ( not ( = ?auto_734639 ?auto_734643 ) ) ( not ( = ?auto_734639 ?auto_734644 ) ) ( not ( = ?auto_734639 ?auto_734645 ) ) ( not ( = ?auto_734639 ?auto_734646 ) ) ( not ( = ?auto_734640 ?auto_734641 ) ) ( not ( = ?auto_734640 ?auto_734642 ) ) ( not ( = ?auto_734640 ?auto_734643 ) ) ( not ( = ?auto_734640 ?auto_734644 ) ) ( not ( = ?auto_734640 ?auto_734645 ) ) ( not ( = ?auto_734640 ?auto_734646 ) ) ( not ( = ?auto_734641 ?auto_734642 ) ) ( not ( = ?auto_734641 ?auto_734643 ) ) ( not ( = ?auto_734641 ?auto_734644 ) ) ( not ( = ?auto_734641 ?auto_734645 ) ) ( not ( = ?auto_734641 ?auto_734646 ) ) ( not ( = ?auto_734642 ?auto_734643 ) ) ( not ( = ?auto_734642 ?auto_734644 ) ) ( not ( = ?auto_734642 ?auto_734645 ) ) ( not ( = ?auto_734642 ?auto_734646 ) ) ( not ( = ?auto_734643 ?auto_734644 ) ) ( not ( = ?auto_734643 ?auto_734645 ) ) ( not ( = ?auto_734643 ?auto_734646 ) ) ( not ( = ?auto_734644 ?auto_734645 ) ) ( not ( = ?auto_734644 ?auto_734646 ) ) ( not ( = ?auto_734645 ?auto_734646 ) ) ( ON ?auto_734644 ?auto_734645 ) ( ON ?auto_734643 ?auto_734644 ) ( ON ?auto_734642 ?auto_734643 ) ( ON ?auto_734641 ?auto_734642 ) ( CLEAR ?auto_734639 ) ( ON ?auto_734640 ?auto_734641 ) ( CLEAR ?auto_734640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_734634 ?auto_734635 ?auto_734636 ?auto_734637 ?auto_734638 ?auto_734639 ?auto_734640 )
      ( MAKE-12PILE ?auto_734634 ?auto_734635 ?auto_734636 ?auto_734637 ?auto_734638 ?auto_734639 ?auto_734640 ?auto_734641 ?auto_734642 ?auto_734643 ?auto_734644 ?auto_734645 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734684 - BLOCK
      ?auto_734685 - BLOCK
      ?auto_734686 - BLOCK
      ?auto_734687 - BLOCK
      ?auto_734688 - BLOCK
      ?auto_734689 - BLOCK
      ?auto_734690 - BLOCK
      ?auto_734691 - BLOCK
      ?auto_734692 - BLOCK
      ?auto_734693 - BLOCK
      ?auto_734694 - BLOCK
      ?auto_734695 - BLOCK
    )
    :vars
    (
      ?auto_734696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734695 ?auto_734696 ) ( ON-TABLE ?auto_734684 ) ( ON ?auto_734685 ?auto_734684 ) ( ON ?auto_734686 ?auto_734685 ) ( ON ?auto_734687 ?auto_734686 ) ( ON ?auto_734688 ?auto_734687 ) ( not ( = ?auto_734684 ?auto_734685 ) ) ( not ( = ?auto_734684 ?auto_734686 ) ) ( not ( = ?auto_734684 ?auto_734687 ) ) ( not ( = ?auto_734684 ?auto_734688 ) ) ( not ( = ?auto_734684 ?auto_734689 ) ) ( not ( = ?auto_734684 ?auto_734690 ) ) ( not ( = ?auto_734684 ?auto_734691 ) ) ( not ( = ?auto_734684 ?auto_734692 ) ) ( not ( = ?auto_734684 ?auto_734693 ) ) ( not ( = ?auto_734684 ?auto_734694 ) ) ( not ( = ?auto_734684 ?auto_734695 ) ) ( not ( = ?auto_734684 ?auto_734696 ) ) ( not ( = ?auto_734685 ?auto_734686 ) ) ( not ( = ?auto_734685 ?auto_734687 ) ) ( not ( = ?auto_734685 ?auto_734688 ) ) ( not ( = ?auto_734685 ?auto_734689 ) ) ( not ( = ?auto_734685 ?auto_734690 ) ) ( not ( = ?auto_734685 ?auto_734691 ) ) ( not ( = ?auto_734685 ?auto_734692 ) ) ( not ( = ?auto_734685 ?auto_734693 ) ) ( not ( = ?auto_734685 ?auto_734694 ) ) ( not ( = ?auto_734685 ?auto_734695 ) ) ( not ( = ?auto_734685 ?auto_734696 ) ) ( not ( = ?auto_734686 ?auto_734687 ) ) ( not ( = ?auto_734686 ?auto_734688 ) ) ( not ( = ?auto_734686 ?auto_734689 ) ) ( not ( = ?auto_734686 ?auto_734690 ) ) ( not ( = ?auto_734686 ?auto_734691 ) ) ( not ( = ?auto_734686 ?auto_734692 ) ) ( not ( = ?auto_734686 ?auto_734693 ) ) ( not ( = ?auto_734686 ?auto_734694 ) ) ( not ( = ?auto_734686 ?auto_734695 ) ) ( not ( = ?auto_734686 ?auto_734696 ) ) ( not ( = ?auto_734687 ?auto_734688 ) ) ( not ( = ?auto_734687 ?auto_734689 ) ) ( not ( = ?auto_734687 ?auto_734690 ) ) ( not ( = ?auto_734687 ?auto_734691 ) ) ( not ( = ?auto_734687 ?auto_734692 ) ) ( not ( = ?auto_734687 ?auto_734693 ) ) ( not ( = ?auto_734687 ?auto_734694 ) ) ( not ( = ?auto_734687 ?auto_734695 ) ) ( not ( = ?auto_734687 ?auto_734696 ) ) ( not ( = ?auto_734688 ?auto_734689 ) ) ( not ( = ?auto_734688 ?auto_734690 ) ) ( not ( = ?auto_734688 ?auto_734691 ) ) ( not ( = ?auto_734688 ?auto_734692 ) ) ( not ( = ?auto_734688 ?auto_734693 ) ) ( not ( = ?auto_734688 ?auto_734694 ) ) ( not ( = ?auto_734688 ?auto_734695 ) ) ( not ( = ?auto_734688 ?auto_734696 ) ) ( not ( = ?auto_734689 ?auto_734690 ) ) ( not ( = ?auto_734689 ?auto_734691 ) ) ( not ( = ?auto_734689 ?auto_734692 ) ) ( not ( = ?auto_734689 ?auto_734693 ) ) ( not ( = ?auto_734689 ?auto_734694 ) ) ( not ( = ?auto_734689 ?auto_734695 ) ) ( not ( = ?auto_734689 ?auto_734696 ) ) ( not ( = ?auto_734690 ?auto_734691 ) ) ( not ( = ?auto_734690 ?auto_734692 ) ) ( not ( = ?auto_734690 ?auto_734693 ) ) ( not ( = ?auto_734690 ?auto_734694 ) ) ( not ( = ?auto_734690 ?auto_734695 ) ) ( not ( = ?auto_734690 ?auto_734696 ) ) ( not ( = ?auto_734691 ?auto_734692 ) ) ( not ( = ?auto_734691 ?auto_734693 ) ) ( not ( = ?auto_734691 ?auto_734694 ) ) ( not ( = ?auto_734691 ?auto_734695 ) ) ( not ( = ?auto_734691 ?auto_734696 ) ) ( not ( = ?auto_734692 ?auto_734693 ) ) ( not ( = ?auto_734692 ?auto_734694 ) ) ( not ( = ?auto_734692 ?auto_734695 ) ) ( not ( = ?auto_734692 ?auto_734696 ) ) ( not ( = ?auto_734693 ?auto_734694 ) ) ( not ( = ?auto_734693 ?auto_734695 ) ) ( not ( = ?auto_734693 ?auto_734696 ) ) ( not ( = ?auto_734694 ?auto_734695 ) ) ( not ( = ?auto_734694 ?auto_734696 ) ) ( not ( = ?auto_734695 ?auto_734696 ) ) ( ON ?auto_734694 ?auto_734695 ) ( ON ?auto_734693 ?auto_734694 ) ( ON ?auto_734692 ?auto_734693 ) ( ON ?auto_734691 ?auto_734692 ) ( ON ?auto_734690 ?auto_734691 ) ( CLEAR ?auto_734688 ) ( ON ?auto_734689 ?auto_734690 ) ( CLEAR ?auto_734689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_734684 ?auto_734685 ?auto_734686 ?auto_734687 ?auto_734688 ?auto_734689 )
      ( MAKE-12PILE ?auto_734684 ?auto_734685 ?auto_734686 ?auto_734687 ?auto_734688 ?auto_734689 ?auto_734690 ?auto_734691 ?auto_734692 ?auto_734693 ?auto_734694 ?auto_734695 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734734 - BLOCK
      ?auto_734735 - BLOCK
      ?auto_734736 - BLOCK
      ?auto_734737 - BLOCK
      ?auto_734738 - BLOCK
      ?auto_734739 - BLOCK
      ?auto_734740 - BLOCK
      ?auto_734741 - BLOCK
      ?auto_734742 - BLOCK
      ?auto_734743 - BLOCK
      ?auto_734744 - BLOCK
      ?auto_734745 - BLOCK
    )
    :vars
    (
      ?auto_734746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734745 ?auto_734746 ) ( ON-TABLE ?auto_734734 ) ( ON ?auto_734735 ?auto_734734 ) ( ON ?auto_734736 ?auto_734735 ) ( ON ?auto_734737 ?auto_734736 ) ( not ( = ?auto_734734 ?auto_734735 ) ) ( not ( = ?auto_734734 ?auto_734736 ) ) ( not ( = ?auto_734734 ?auto_734737 ) ) ( not ( = ?auto_734734 ?auto_734738 ) ) ( not ( = ?auto_734734 ?auto_734739 ) ) ( not ( = ?auto_734734 ?auto_734740 ) ) ( not ( = ?auto_734734 ?auto_734741 ) ) ( not ( = ?auto_734734 ?auto_734742 ) ) ( not ( = ?auto_734734 ?auto_734743 ) ) ( not ( = ?auto_734734 ?auto_734744 ) ) ( not ( = ?auto_734734 ?auto_734745 ) ) ( not ( = ?auto_734734 ?auto_734746 ) ) ( not ( = ?auto_734735 ?auto_734736 ) ) ( not ( = ?auto_734735 ?auto_734737 ) ) ( not ( = ?auto_734735 ?auto_734738 ) ) ( not ( = ?auto_734735 ?auto_734739 ) ) ( not ( = ?auto_734735 ?auto_734740 ) ) ( not ( = ?auto_734735 ?auto_734741 ) ) ( not ( = ?auto_734735 ?auto_734742 ) ) ( not ( = ?auto_734735 ?auto_734743 ) ) ( not ( = ?auto_734735 ?auto_734744 ) ) ( not ( = ?auto_734735 ?auto_734745 ) ) ( not ( = ?auto_734735 ?auto_734746 ) ) ( not ( = ?auto_734736 ?auto_734737 ) ) ( not ( = ?auto_734736 ?auto_734738 ) ) ( not ( = ?auto_734736 ?auto_734739 ) ) ( not ( = ?auto_734736 ?auto_734740 ) ) ( not ( = ?auto_734736 ?auto_734741 ) ) ( not ( = ?auto_734736 ?auto_734742 ) ) ( not ( = ?auto_734736 ?auto_734743 ) ) ( not ( = ?auto_734736 ?auto_734744 ) ) ( not ( = ?auto_734736 ?auto_734745 ) ) ( not ( = ?auto_734736 ?auto_734746 ) ) ( not ( = ?auto_734737 ?auto_734738 ) ) ( not ( = ?auto_734737 ?auto_734739 ) ) ( not ( = ?auto_734737 ?auto_734740 ) ) ( not ( = ?auto_734737 ?auto_734741 ) ) ( not ( = ?auto_734737 ?auto_734742 ) ) ( not ( = ?auto_734737 ?auto_734743 ) ) ( not ( = ?auto_734737 ?auto_734744 ) ) ( not ( = ?auto_734737 ?auto_734745 ) ) ( not ( = ?auto_734737 ?auto_734746 ) ) ( not ( = ?auto_734738 ?auto_734739 ) ) ( not ( = ?auto_734738 ?auto_734740 ) ) ( not ( = ?auto_734738 ?auto_734741 ) ) ( not ( = ?auto_734738 ?auto_734742 ) ) ( not ( = ?auto_734738 ?auto_734743 ) ) ( not ( = ?auto_734738 ?auto_734744 ) ) ( not ( = ?auto_734738 ?auto_734745 ) ) ( not ( = ?auto_734738 ?auto_734746 ) ) ( not ( = ?auto_734739 ?auto_734740 ) ) ( not ( = ?auto_734739 ?auto_734741 ) ) ( not ( = ?auto_734739 ?auto_734742 ) ) ( not ( = ?auto_734739 ?auto_734743 ) ) ( not ( = ?auto_734739 ?auto_734744 ) ) ( not ( = ?auto_734739 ?auto_734745 ) ) ( not ( = ?auto_734739 ?auto_734746 ) ) ( not ( = ?auto_734740 ?auto_734741 ) ) ( not ( = ?auto_734740 ?auto_734742 ) ) ( not ( = ?auto_734740 ?auto_734743 ) ) ( not ( = ?auto_734740 ?auto_734744 ) ) ( not ( = ?auto_734740 ?auto_734745 ) ) ( not ( = ?auto_734740 ?auto_734746 ) ) ( not ( = ?auto_734741 ?auto_734742 ) ) ( not ( = ?auto_734741 ?auto_734743 ) ) ( not ( = ?auto_734741 ?auto_734744 ) ) ( not ( = ?auto_734741 ?auto_734745 ) ) ( not ( = ?auto_734741 ?auto_734746 ) ) ( not ( = ?auto_734742 ?auto_734743 ) ) ( not ( = ?auto_734742 ?auto_734744 ) ) ( not ( = ?auto_734742 ?auto_734745 ) ) ( not ( = ?auto_734742 ?auto_734746 ) ) ( not ( = ?auto_734743 ?auto_734744 ) ) ( not ( = ?auto_734743 ?auto_734745 ) ) ( not ( = ?auto_734743 ?auto_734746 ) ) ( not ( = ?auto_734744 ?auto_734745 ) ) ( not ( = ?auto_734744 ?auto_734746 ) ) ( not ( = ?auto_734745 ?auto_734746 ) ) ( ON ?auto_734744 ?auto_734745 ) ( ON ?auto_734743 ?auto_734744 ) ( ON ?auto_734742 ?auto_734743 ) ( ON ?auto_734741 ?auto_734742 ) ( ON ?auto_734740 ?auto_734741 ) ( ON ?auto_734739 ?auto_734740 ) ( CLEAR ?auto_734737 ) ( ON ?auto_734738 ?auto_734739 ) ( CLEAR ?auto_734738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_734734 ?auto_734735 ?auto_734736 ?auto_734737 ?auto_734738 )
      ( MAKE-12PILE ?auto_734734 ?auto_734735 ?auto_734736 ?auto_734737 ?auto_734738 ?auto_734739 ?auto_734740 ?auto_734741 ?auto_734742 ?auto_734743 ?auto_734744 ?auto_734745 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734784 - BLOCK
      ?auto_734785 - BLOCK
      ?auto_734786 - BLOCK
      ?auto_734787 - BLOCK
      ?auto_734788 - BLOCK
      ?auto_734789 - BLOCK
      ?auto_734790 - BLOCK
      ?auto_734791 - BLOCK
      ?auto_734792 - BLOCK
      ?auto_734793 - BLOCK
      ?auto_734794 - BLOCK
      ?auto_734795 - BLOCK
    )
    :vars
    (
      ?auto_734796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734795 ?auto_734796 ) ( ON-TABLE ?auto_734784 ) ( ON ?auto_734785 ?auto_734784 ) ( ON ?auto_734786 ?auto_734785 ) ( not ( = ?auto_734784 ?auto_734785 ) ) ( not ( = ?auto_734784 ?auto_734786 ) ) ( not ( = ?auto_734784 ?auto_734787 ) ) ( not ( = ?auto_734784 ?auto_734788 ) ) ( not ( = ?auto_734784 ?auto_734789 ) ) ( not ( = ?auto_734784 ?auto_734790 ) ) ( not ( = ?auto_734784 ?auto_734791 ) ) ( not ( = ?auto_734784 ?auto_734792 ) ) ( not ( = ?auto_734784 ?auto_734793 ) ) ( not ( = ?auto_734784 ?auto_734794 ) ) ( not ( = ?auto_734784 ?auto_734795 ) ) ( not ( = ?auto_734784 ?auto_734796 ) ) ( not ( = ?auto_734785 ?auto_734786 ) ) ( not ( = ?auto_734785 ?auto_734787 ) ) ( not ( = ?auto_734785 ?auto_734788 ) ) ( not ( = ?auto_734785 ?auto_734789 ) ) ( not ( = ?auto_734785 ?auto_734790 ) ) ( not ( = ?auto_734785 ?auto_734791 ) ) ( not ( = ?auto_734785 ?auto_734792 ) ) ( not ( = ?auto_734785 ?auto_734793 ) ) ( not ( = ?auto_734785 ?auto_734794 ) ) ( not ( = ?auto_734785 ?auto_734795 ) ) ( not ( = ?auto_734785 ?auto_734796 ) ) ( not ( = ?auto_734786 ?auto_734787 ) ) ( not ( = ?auto_734786 ?auto_734788 ) ) ( not ( = ?auto_734786 ?auto_734789 ) ) ( not ( = ?auto_734786 ?auto_734790 ) ) ( not ( = ?auto_734786 ?auto_734791 ) ) ( not ( = ?auto_734786 ?auto_734792 ) ) ( not ( = ?auto_734786 ?auto_734793 ) ) ( not ( = ?auto_734786 ?auto_734794 ) ) ( not ( = ?auto_734786 ?auto_734795 ) ) ( not ( = ?auto_734786 ?auto_734796 ) ) ( not ( = ?auto_734787 ?auto_734788 ) ) ( not ( = ?auto_734787 ?auto_734789 ) ) ( not ( = ?auto_734787 ?auto_734790 ) ) ( not ( = ?auto_734787 ?auto_734791 ) ) ( not ( = ?auto_734787 ?auto_734792 ) ) ( not ( = ?auto_734787 ?auto_734793 ) ) ( not ( = ?auto_734787 ?auto_734794 ) ) ( not ( = ?auto_734787 ?auto_734795 ) ) ( not ( = ?auto_734787 ?auto_734796 ) ) ( not ( = ?auto_734788 ?auto_734789 ) ) ( not ( = ?auto_734788 ?auto_734790 ) ) ( not ( = ?auto_734788 ?auto_734791 ) ) ( not ( = ?auto_734788 ?auto_734792 ) ) ( not ( = ?auto_734788 ?auto_734793 ) ) ( not ( = ?auto_734788 ?auto_734794 ) ) ( not ( = ?auto_734788 ?auto_734795 ) ) ( not ( = ?auto_734788 ?auto_734796 ) ) ( not ( = ?auto_734789 ?auto_734790 ) ) ( not ( = ?auto_734789 ?auto_734791 ) ) ( not ( = ?auto_734789 ?auto_734792 ) ) ( not ( = ?auto_734789 ?auto_734793 ) ) ( not ( = ?auto_734789 ?auto_734794 ) ) ( not ( = ?auto_734789 ?auto_734795 ) ) ( not ( = ?auto_734789 ?auto_734796 ) ) ( not ( = ?auto_734790 ?auto_734791 ) ) ( not ( = ?auto_734790 ?auto_734792 ) ) ( not ( = ?auto_734790 ?auto_734793 ) ) ( not ( = ?auto_734790 ?auto_734794 ) ) ( not ( = ?auto_734790 ?auto_734795 ) ) ( not ( = ?auto_734790 ?auto_734796 ) ) ( not ( = ?auto_734791 ?auto_734792 ) ) ( not ( = ?auto_734791 ?auto_734793 ) ) ( not ( = ?auto_734791 ?auto_734794 ) ) ( not ( = ?auto_734791 ?auto_734795 ) ) ( not ( = ?auto_734791 ?auto_734796 ) ) ( not ( = ?auto_734792 ?auto_734793 ) ) ( not ( = ?auto_734792 ?auto_734794 ) ) ( not ( = ?auto_734792 ?auto_734795 ) ) ( not ( = ?auto_734792 ?auto_734796 ) ) ( not ( = ?auto_734793 ?auto_734794 ) ) ( not ( = ?auto_734793 ?auto_734795 ) ) ( not ( = ?auto_734793 ?auto_734796 ) ) ( not ( = ?auto_734794 ?auto_734795 ) ) ( not ( = ?auto_734794 ?auto_734796 ) ) ( not ( = ?auto_734795 ?auto_734796 ) ) ( ON ?auto_734794 ?auto_734795 ) ( ON ?auto_734793 ?auto_734794 ) ( ON ?auto_734792 ?auto_734793 ) ( ON ?auto_734791 ?auto_734792 ) ( ON ?auto_734790 ?auto_734791 ) ( ON ?auto_734789 ?auto_734790 ) ( ON ?auto_734788 ?auto_734789 ) ( CLEAR ?auto_734786 ) ( ON ?auto_734787 ?auto_734788 ) ( CLEAR ?auto_734787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_734784 ?auto_734785 ?auto_734786 ?auto_734787 )
      ( MAKE-12PILE ?auto_734784 ?auto_734785 ?auto_734786 ?auto_734787 ?auto_734788 ?auto_734789 ?auto_734790 ?auto_734791 ?auto_734792 ?auto_734793 ?auto_734794 ?auto_734795 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734834 - BLOCK
      ?auto_734835 - BLOCK
      ?auto_734836 - BLOCK
      ?auto_734837 - BLOCK
      ?auto_734838 - BLOCK
      ?auto_734839 - BLOCK
      ?auto_734840 - BLOCK
      ?auto_734841 - BLOCK
      ?auto_734842 - BLOCK
      ?auto_734843 - BLOCK
      ?auto_734844 - BLOCK
      ?auto_734845 - BLOCK
    )
    :vars
    (
      ?auto_734846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734845 ?auto_734846 ) ( ON-TABLE ?auto_734834 ) ( ON ?auto_734835 ?auto_734834 ) ( not ( = ?auto_734834 ?auto_734835 ) ) ( not ( = ?auto_734834 ?auto_734836 ) ) ( not ( = ?auto_734834 ?auto_734837 ) ) ( not ( = ?auto_734834 ?auto_734838 ) ) ( not ( = ?auto_734834 ?auto_734839 ) ) ( not ( = ?auto_734834 ?auto_734840 ) ) ( not ( = ?auto_734834 ?auto_734841 ) ) ( not ( = ?auto_734834 ?auto_734842 ) ) ( not ( = ?auto_734834 ?auto_734843 ) ) ( not ( = ?auto_734834 ?auto_734844 ) ) ( not ( = ?auto_734834 ?auto_734845 ) ) ( not ( = ?auto_734834 ?auto_734846 ) ) ( not ( = ?auto_734835 ?auto_734836 ) ) ( not ( = ?auto_734835 ?auto_734837 ) ) ( not ( = ?auto_734835 ?auto_734838 ) ) ( not ( = ?auto_734835 ?auto_734839 ) ) ( not ( = ?auto_734835 ?auto_734840 ) ) ( not ( = ?auto_734835 ?auto_734841 ) ) ( not ( = ?auto_734835 ?auto_734842 ) ) ( not ( = ?auto_734835 ?auto_734843 ) ) ( not ( = ?auto_734835 ?auto_734844 ) ) ( not ( = ?auto_734835 ?auto_734845 ) ) ( not ( = ?auto_734835 ?auto_734846 ) ) ( not ( = ?auto_734836 ?auto_734837 ) ) ( not ( = ?auto_734836 ?auto_734838 ) ) ( not ( = ?auto_734836 ?auto_734839 ) ) ( not ( = ?auto_734836 ?auto_734840 ) ) ( not ( = ?auto_734836 ?auto_734841 ) ) ( not ( = ?auto_734836 ?auto_734842 ) ) ( not ( = ?auto_734836 ?auto_734843 ) ) ( not ( = ?auto_734836 ?auto_734844 ) ) ( not ( = ?auto_734836 ?auto_734845 ) ) ( not ( = ?auto_734836 ?auto_734846 ) ) ( not ( = ?auto_734837 ?auto_734838 ) ) ( not ( = ?auto_734837 ?auto_734839 ) ) ( not ( = ?auto_734837 ?auto_734840 ) ) ( not ( = ?auto_734837 ?auto_734841 ) ) ( not ( = ?auto_734837 ?auto_734842 ) ) ( not ( = ?auto_734837 ?auto_734843 ) ) ( not ( = ?auto_734837 ?auto_734844 ) ) ( not ( = ?auto_734837 ?auto_734845 ) ) ( not ( = ?auto_734837 ?auto_734846 ) ) ( not ( = ?auto_734838 ?auto_734839 ) ) ( not ( = ?auto_734838 ?auto_734840 ) ) ( not ( = ?auto_734838 ?auto_734841 ) ) ( not ( = ?auto_734838 ?auto_734842 ) ) ( not ( = ?auto_734838 ?auto_734843 ) ) ( not ( = ?auto_734838 ?auto_734844 ) ) ( not ( = ?auto_734838 ?auto_734845 ) ) ( not ( = ?auto_734838 ?auto_734846 ) ) ( not ( = ?auto_734839 ?auto_734840 ) ) ( not ( = ?auto_734839 ?auto_734841 ) ) ( not ( = ?auto_734839 ?auto_734842 ) ) ( not ( = ?auto_734839 ?auto_734843 ) ) ( not ( = ?auto_734839 ?auto_734844 ) ) ( not ( = ?auto_734839 ?auto_734845 ) ) ( not ( = ?auto_734839 ?auto_734846 ) ) ( not ( = ?auto_734840 ?auto_734841 ) ) ( not ( = ?auto_734840 ?auto_734842 ) ) ( not ( = ?auto_734840 ?auto_734843 ) ) ( not ( = ?auto_734840 ?auto_734844 ) ) ( not ( = ?auto_734840 ?auto_734845 ) ) ( not ( = ?auto_734840 ?auto_734846 ) ) ( not ( = ?auto_734841 ?auto_734842 ) ) ( not ( = ?auto_734841 ?auto_734843 ) ) ( not ( = ?auto_734841 ?auto_734844 ) ) ( not ( = ?auto_734841 ?auto_734845 ) ) ( not ( = ?auto_734841 ?auto_734846 ) ) ( not ( = ?auto_734842 ?auto_734843 ) ) ( not ( = ?auto_734842 ?auto_734844 ) ) ( not ( = ?auto_734842 ?auto_734845 ) ) ( not ( = ?auto_734842 ?auto_734846 ) ) ( not ( = ?auto_734843 ?auto_734844 ) ) ( not ( = ?auto_734843 ?auto_734845 ) ) ( not ( = ?auto_734843 ?auto_734846 ) ) ( not ( = ?auto_734844 ?auto_734845 ) ) ( not ( = ?auto_734844 ?auto_734846 ) ) ( not ( = ?auto_734845 ?auto_734846 ) ) ( ON ?auto_734844 ?auto_734845 ) ( ON ?auto_734843 ?auto_734844 ) ( ON ?auto_734842 ?auto_734843 ) ( ON ?auto_734841 ?auto_734842 ) ( ON ?auto_734840 ?auto_734841 ) ( ON ?auto_734839 ?auto_734840 ) ( ON ?auto_734838 ?auto_734839 ) ( ON ?auto_734837 ?auto_734838 ) ( CLEAR ?auto_734835 ) ( ON ?auto_734836 ?auto_734837 ) ( CLEAR ?auto_734836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_734834 ?auto_734835 ?auto_734836 )
      ( MAKE-12PILE ?auto_734834 ?auto_734835 ?auto_734836 ?auto_734837 ?auto_734838 ?auto_734839 ?auto_734840 ?auto_734841 ?auto_734842 ?auto_734843 ?auto_734844 ?auto_734845 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734884 - BLOCK
      ?auto_734885 - BLOCK
      ?auto_734886 - BLOCK
      ?auto_734887 - BLOCK
      ?auto_734888 - BLOCK
      ?auto_734889 - BLOCK
      ?auto_734890 - BLOCK
      ?auto_734891 - BLOCK
      ?auto_734892 - BLOCK
      ?auto_734893 - BLOCK
      ?auto_734894 - BLOCK
      ?auto_734895 - BLOCK
    )
    :vars
    (
      ?auto_734896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734895 ?auto_734896 ) ( ON-TABLE ?auto_734884 ) ( not ( = ?auto_734884 ?auto_734885 ) ) ( not ( = ?auto_734884 ?auto_734886 ) ) ( not ( = ?auto_734884 ?auto_734887 ) ) ( not ( = ?auto_734884 ?auto_734888 ) ) ( not ( = ?auto_734884 ?auto_734889 ) ) ( not ( = ?auto_734884 ?auto_734890 ) ) ( not ( = ?auto_734884 ?auto_734891 ) ) ( not ( = ?auto_734884 ?auto_734892 ) ) ( not ( = ?auto_734884 ?auto_734893 ) ) ( not ( = ?auto_734884 ?auto_734894 ) ) ( not ( = ?auto_734884 ?auto_734895 ) ) ( not ( = ?auto_734884 ?auto_734896 ) ) ( not ( = ?auto_734885 ?auto_734886 ) ) ( not ( = ?auto_734885 ?auto_734887 ) ) ( not ( = ?auto_734885 ?auto_734888 ) ) ( not ( = ?auto_734885 ?auto_734889 ) ) ( not ( = ?auto_734885 ?auto_734890 ) ) ( not ( = ?auto_734885 ?auto_734891 ) ) ( not ( = ?auto_734885 ?auto_734892 ) ) ( not ( = ?auto_734885 ?auto_734893 ) ) ( not ( = ?auto_734885 ?auto_734894 ) ) ( not ( = ?auto_734885 ?auto_734895 ) ) ( not ( = ?auto_734885 ?auto_734896 ) ) ( not ( = ?auto_734886 ?auto_734887 ) ) ( not ( = ?auto_734886 ?auto_734888 ) ) ( not ( = ?auto_734886 ?auto_734889 ) ) ( not ( = ?auto_734886 ?auto_734890 ) ) ( not ( = ?auto_734886 ?auto_734891 ) ) ( not ( = ?auto_734886 ?auto_734892 ) ) ( not ( = ?auto_734886 ?auto_734893 ) ) ( not ( = ?auto_734886 ?auto_734894 ) ) ( not ( = ?auto_734886 ?auto_734895 ) ) ( not ( = ?auto_734886 ?auto_734896 ) ) ( not ( = ?auto_734887 ?auto_734888 ) ) ( not ( = ?auto_734887 ?auto_734889 ) ) ( not ( = ?auto_734887 ?auto_734890 ) ) ( not ( = ?auto_734887 ?auto_734891 ) ) ( not ( = ?auto_734887 ?auto_734892 ) ) ( not ( = ?auto_734887 ?auto_734893 ) ) ( not ( = ?auto_734887 ?auto_734894 ) ) ( not ( = ?auto_734887 ?auto_734895 ) ) ( not ( = ?auto_734887 ?auto_734896 ) ) ( not ( = ?auto_734888 ?auto_734889 ) ) ( not ( = ?auto_734888 ?auto_734890 ) ) ( not ( = ?auto_734888 ?auto_734891 ) ) ( not ( = ?auto_734888 ?auto_734892 ) ) ( not ( = ?auto_734888 ?auto_734893 ) ) ( not ( = ?auto_734888 ?auto_734894 ) ) ( not ( = ?auto_734888 ?auto_734895 ) ) ( not ( = ?auto_734888 ?auto_734896 ) ) ( not ( = ?auto_734889 ?auto_734890 ) ) ( not ( = ?auto_734889 ?auto_734891 ) ) ( not ( = ?auto_734889 ?auto_734892 ) ) ( not ( = ?auto_734889 ?auto_734893 ) ) ( not ( = ?auto_734889 ?auto_734894 ) ) ( not ( = ?auto_734889 ?auto_734895 ) ) ( not ( = ?auto_734889 ?auto_734896 ) ) ( not ( = ?auto_734890 ?auto_734891 ) ) ( not ( = ?auto_734890 ?auto_734892 ) ) ( not ( = ?auto_734890 ?auto_734893 ) ) ( not ( = ?auto_734890 ?auto_734894 ) ) ( not ( = ?auto_734890 ?auto_734895 ) ) ( not ( = ?auto_734890 ?auto_734896 ) ) ( not ( = ?auto_734891 ?auto_734892 ) ) ( not ( = ?auto_734891 ?auto_734893 ) ) ( not ( = ?auto_734891 ?auto_734894 ) ) ( not ( = ?auto_734891 ?auto_734895 ) ) ( not ( = ?auto_734891 ?auto_734896 ) ) ( not ( = ?auto_734892 ?auto_734893 ) ) ( not ( = ?auto_734892 ?auto_734894 ) ) ( not ( = ?auto_734892 ?auto_734895 ) ) ( not ( = ?auto_734892 ?auto_734896 ) ) ( not ( = ?auto_734893 ?auto_734894 ) ) ( not ( = ?auto_734893 ?auto_734895 ) ) ( not ( = ?auto_734893 ?auto_734896 ) ) ( not ( = ?auto_734894 ?auto_734895 ) ) ( not ( = ?auto_734894 ?auto_734896 ) ) ( not ( = ?auto_734895 ?auto_734896 ) ) ( ON ?auto_734894 ?auto_734895 ) ( ON ?auto_734893 ?auto_734894 ) ( ON ?auto_734892 ?auto_734893 ) ( ON ?auto_734891 ?auto_734892 ) ( ON ?auto_734890 ?auto_734891 ) ( ON ?auto_734889 ?auto_734890 ) ( ON ?auto_734888 ?auto_734889 ) ( ON ?auto_734887 ?auto_734888 ) ( ON ?auto_734886 ?auto_734887 ) ( CLEAR ?auto_734884 ) ( ON ?auto_734885 ?auto_734886 ) ( CLEAR ?auto_734885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_734884 ?auto_734885 )
      ( MAKE-12PILE ?auto_734884 ?auto_734885 ?auto_734886 ?auto_734887 ?auto_734888 ?auto_734889 ?auto_734890 ?auto_734891 ?auto_734892 ?auto_734893 ?auto_734894 ?auto_734895 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_734934 - BLOCK
      ?auto_734935 - BLOCK
      ?auto_734936 - BLOCK
      ?auto_734937 - BLOCK
      ?auto_734938 - BLOCK
      ?auto_734939 - BLOCK
      ?auto_734940 - BLOCK
      ?auto_734941 - BLOCK
      ?auto_734942 - BLOCK
      ?auto_734943 - BLOCK
      ?auto_734944 - BLOCK
      ?auto_734945 - BLOCK
    )
    :vars
    (
      ?auto_734946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_734945 ?auto_734946 ) ( not ( = ?auto_734934 ?auto_734935 ) ) ( not ( = ?auto_734934 ?auto_734936 ) ) ( not ( = ?auto_734934 ?auto_734937 ) ) ( not ( = ?auto_734934 ?auto_734938 ) ) ( not ( = ?auto_734934 ?auto_734939 ) ) ( not ( = ?auto_734934 ?auto_734940 ) ) ( not ( = ?auto_734934 ?auto_734941 ) ) ( not ( = ?auto_734934 ?auto_734942 ) ) ( not ( = ?auto_734934 ?auto_734943 ) ) ( not ( = ?auto_734934 ?auto_734944 ) ) ( not ( = ?auto_734934 ?auto_734945 ) ) ( not ( = ?auto_734934 ?auto_734946 ) ) ( not ( = ?auto_734935 ?auto_734936 ) ) ( not ( = ?auto_734935 ?auto_734937 ) ) ( not ( = ?auto_734935 ?auto_734938 ) ) ( not ( = ?auto_734935 ?auto_734939 ) ) ( not ( = ?auto_734935 ?auto_734940 ) ) ( not ( = ?auto_734935 ?auto_734941 ) ) ( not ( = ?auto_734935 ?auto_734942 ) ) ( not ( = ?auto_734935 ?auto_734943 ) ) ( not ( = ?auto_734935 ?auto_734944 ) ) ( not ( = ?auto_734935 ?auto_734945 ) ) ( not ( = ?auto_734935 ?auto_734946 ) ) ( not ( = ?auto_734936 ?auto_734937 ) ) ( not ( = ?auto_734936 ?auto_734938 ) ) ( not ( = ?auto_734936 ?auto_734939 ) ) ( not ( = ?auto_734936 ?auto_734940 ) ) ( not ( = ?auto_734936 ?auto_734941 ) ) ( not ( = ?auto_734936 ?auto_734942 ) ) ( not ( = ?auto_734936 ?auto_734943 ) ) ( not ( = ?auto_734936 ?auto_734944 ) ) ( not ( = ?auto_734936 ?auto_734945 ) ) ( not ( = ?auto_734936 ?auto_734946 ) ) ( not ( = ?auto_734937 ?auto_734938 ) ) ( not ( = ?auto_734937 ?auto_734939 ) ) ( not ( = ?auto_734937 ?auto_734940 ) ) ( not ( = ?auto_734937 ?auto_734941 ) ) ( not ( = ?auto_734937 ?auto_734942 ) ) ( not ( = ?auto_734937 ?auto_734943 ) ) ( not ( = ?auto_734937 ?auto_734944 ) ) ( not ( = ?auto_734937 ?auto_734945 ) ) ( not ( = ?auto_734937 ?auto_734946 ) ) ( not ( = ?auto_734938 ?auto_734939 ) ) ( not ( = ?auto_734938 ?auto_734940 ) ) ( not ( = ?auto_734938 ?auto_734941 ) ) ( not ( = ?auto_734938 ?auto_734942 ) ) ( not ( = ?auto_734938 ?auto_734943 ) ) ( not ( = ?auto_734938 ?auto_734944 ) ) ( not ( = ?auto_734938 ?auto_734945 ) ) ( not ( = ?auto_734938 ?auto_734946 ) ) ( not ( = ?auto_734939 ?auto_734940 ) ) ( not ( = ?auto_734939 ?auto_734941 ) ) ( not ( = ?auto_734939 ?auto_734942 ) ) ( not ( = ?auto_734939 ?auto_734943 ) ) ( not ( = ?auto_734939 ?auto_734944 ) ) ( not ( = ?auto_734939 ?auto_734945 ) ) ( not ( = ?auto_734939 ?auto_734946 ) ) ( not ( = ?auto_734940 ?auto_734941 ) ) ( not ( = ?auto_734940 ?auto_734942 ) ) ( not ( = ?auto_734940 ?auto_734943 ) ) ( not ( = ?auto_734940 ?auto_734944 ) ) ( not ( = ?auto_734940 ?auto_734945 ) ) ( not ( = ?auto_734940 ?auto_734946 ) ) ( not ( = ?auto_734941 ?auto_734942 ) ) ( not ( = ?auto_734941 ?auto_734943 ) ) ( not ( = ?auto_734941 ?auto_734944 ) ) ( not ( = ?auto_734941 ?auto_734945 ) ) ( not ( = ?auto_734941 ?auto_734946 ) ) ( not ( = ?auto_734942 ?auto_734943 ) ) ( not ( = ?auto_734942 ?auto_734944 ) ) ( not ( = ?auto_734942 ?auto_734945 ) ) ( not ( = ?auto_734942 ?auto_734946 ) ) ( not ( = ?auto_734943 ?auto_734944 ) ) ( not ( = ?auto_734943 ?auto_734945 ) ) ( not ( = ?auto_734943 ?auto_734946 ) ) ( not ( = ?auto_734944 ?auto_734945 ) ) ( not ( = ?auto_734944 ?auto_734946 ) ) ( not ( = ?auto_734945 ?auto_734946 ) ) ( ON ?auto_734944 ?auto_734945 ) ( ON ?auto_734943 ?auto_734944 ) ( ON ?auto_734942 ?auto_734943 ) ( ON ?auto_734941 ?auto_734942 ) ( ON ?auto_734940 ?auto_734941 ) ( ON ?auto_734939 ?auto_734940 ) ( ON ?auto_734938 ?auto_734939 ) ( ON ?auto_734937 ?auto_734938 ) ( ON ?auto_734936 ?auto_734937 ) ( ON ?auto_734935 ?auto_734936 ) ( ON ?auto_734934 ?auto_734935 ) ( CLEAR ?auto_734934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_734934 )
      ( MAKE-12PILE ?auto_734934 ?auto_734935 ?auto_734936 ?auto_734937 ?auto_734938 ?auto_734939 ?auto_734940 ?auto_734941 ?auto_734942 ?auto_734943 ?auto_734944 ?auto_734945 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_734985 - BLOCK
      ?auto_734986 - BLOCK
      ?auto_734987 - BLOCK
      ?auto_734988 - BLOCK
      ?auto_734989 - BLOCK
      ?auto_734990 - BLOCK
      ?auto_734991 - BLOCK
      ?auto_734992 - BLOCK
      ?auto_734993 - BLOCK
      ?auto_734994 - BLOCK
      ?auto_734995 - BLOCK
      ?auto_734996 - BLOCK
      ?auto_734997 - BLOCK
    )
    :vars
    (
      ?auto_734998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_734996 ) ( ON ?auto_734997 ?auto_734998 ) ( CLEAR ?auto_734997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_734985 ) ( ON ?auto_734986 ?auto_734985 ) ( ON ?auto_734987 ?auto_734986 ) ( ON ?auto_734988 ?auto_734987 ) ( ON ?auto_734989 ?auto_734988 ) ( ON ?auto_734990 ?auto_734989 ) ( ON ?auto_734991 ?auto_734990 ) ( ON ?auto_734992 ?auto_734991 ) ( ON ?auto_734993 ?auto_734992 ) ( ON ?auto_734994 ?auto_734993 ) ( ON ?auto_734995 ?auto_734994 ) ( ON ?auto_734996 ?auto_734995 ) ( not ( = ?auto_734985 ?auto_734986 ) ) ( not ( = ?auto_734985 ?auto_734987 ) ) ( not ( = ?auto_734985 ?auto_734988 ) ) ( not ( = ?auto_734985 ?auto_734989 ) ) ( not ( = ?auto_734985 ?auto_734990 ) ) ( not ( = ?auto_734985 ?auto_734991 ) ) ( not ( = ?auto_734985 ?auto_734992 ) ) ( not ( = ?auto_734985 ?auto_734993 ) ) ( not ( = ?auto_734985 ?auto_734994 ) ) ( not ( = ?auto_734985 ?auto_734995 ) ) ( not ( = ?auto_734985 ?auto_734996 ) ) ( not ( = ?auto_734985 ?auto_734997 ) ) ( not ( = ?auto_734985 ?auto_734998 ) ) ( not ( = ?auto_734986 ?auto_734987 ) ) ( not ( = ?auto_734986 ?auto_734988 ) ) ( not ( = ?auto_734986 ?auto_734989 ) ) ( not ( = ?auto_734986 ?auto_734990 ) ) ( not ( = ?auto_734986 ?auto_734991 ) ) ( not ( = ?auto_734986 ?auto_734992 ) ) ( not ( = ?auto_734986 ?auto_734993 ) ) ( not ( = ?auto_734986 ?auto_734994 ) ) ( not ( = ?auto_734986 ?auto_734995 ) ) ( not ( = ?auto_734986 ?auto_734996 ) ) ( not ( = ?auto_734986 ?auto_734997 ) ) ( not ( = ?auto_734986 ?auto_734998 ) ) ( not ( = ?auto_734987 ?auto_734988 ) ) ( not ( = ?auto_734987 ?auto_734989 ) ) ( not ( = ?auto_734987 ?auto_734990 ) ) ( not ( = ?auto_734987 ?auto_734991 ) ) ( not ( = ?auto_734987 ?auto_734992 ) ) ( not ( = ?auto_734987 ?auto_734993 ) ) ( not ( = ?auto_734987 ?auto_734994 ) ) ( not ( = ?auto_734987 ?auto_734995 ) ) ( not ( = ?auto_734987 ?auto_734996 ) ) ( not ( = ?auto_734987 ?auto_734997 ) ) ( not ( = ?auto_734987 ?auto_734998 ) ) ( not ( = ?auto_734988 ?auto_734989 ) ) ( not ( = ?auto_734988 ?auto_734990 ) ) ( not ( = ?auto_734988 ?auto_734991 ) ) ( not ( = ?auto_734988 ?auto_734992 ) ) ( not ( = ?auto_734988 ?auto_734993 ) ) ( not ( = ?auto_734988 ?auto_734994 ) ) ( not ( = ?auto_734988 ?auto_734995 ) ) ( not ( = ?auto_734988 ?auto_734996 ) ) ( not ( = ?auto_734988 ?auto_734997 ) ) ( not ( = ?auto_734988 ?auto_734998 ) ) ( not ( = ?auto_734989 ?auto_734990 ) ) ( not ( = ?auto_734989 ?auto_734991 ) ) ( not ( = ?auto_734989 ?auto_734992 ) ) ( not ( = ?auto_734989 ?auto_734993 ) ) ( not ( = ?auto_734989 ?auto_734994 ) ) ( not ( = ?auto_734989 ?auto_734995 ) ) ( not ( = ?auto_734989 ?auto_734996 ) ) ( not ( = ?auto_734989 ?auto_734997 ) ) ( not ( = ?auto_734989 ?auto_734998 ) ) ( not ( = ?auto_734990 ?auto_734991 ) ) ( not ( = ?auto_734990 ?auto_734992 ) ) ( not ( = ?auto_734990 ?auto_734993 ) ) ( not ( = ?auto_734990 ?auto_734994 ) ) ( not ( = ?auto_734990 ?auto_734995 ) ) ( not ( = ?auto_734990 ?auto_734996 ) ) ( not ( = ?auto_734990 ?auto_734997 ) ) ( not ( = ?auto_734990 ?auto_734998 ) ) ( not ( = ?auto_734991 ?auto_734992 ) ) ( not ( = ?auto_734991 ?auto_734993 ) ) ( not ( = ?auto_734991 ?auto_734994 ) ) ( not ( = ?auto_734991 ?auto_734995 ) ) ( not ( = ?auto_734991 ?auto_734996 ) ) ( not ( = ?auto_734991 ?auto_734997 ) ) ( not ( = ?auto_734991 ?auto_734998 ) ) ( not ( = ?auto_734992 ?auto_734993 ) ) ( not ( = ?auto_734992 ?auto_734994 ) ) ( not ( = ?auto_734992 ?auto_734995 ) ) ( not ( = ?auto_734992 ?auto_734996 ) ) ( not ( = ?auto_734992 ?auto_734997 ) ) ( not ( = ?auto_734992 ?auto_734998 ) ) ( not ( = ?auto_734993 ?auto_734994 ) ) ( not ( = ?auto_734993 ?auto_734995 ) ) ( not ( = ?auto_734993 ?auto_734996 ) ) ( not ( = ?auto_734993 ?auto_734997 ) ) ( not ( = ?auto_734993 ?auto_734998 ) ) ( not ( = ?auto_734994 ?auto_734995 ) ) ( not ( = ?auto_734994 ?auto_734996 ) ) ( not ( = ?auto_734994 ?auto_734997 ) ) ( not ( = ?auto_734994 ?auto_734998 ) ) ( not ( = ?auto_734995 ?auto_734996 ) ) ( not ( = ?auto_734995 ?auto_734997 ) ) ( not ( = ?auto_734995 ?auto_734998 ) ) ( not ( = ?auto_734996 ?auto_734997 ) ) ( not ( = ?auto_734996 ?auto_734998 ) ) ( not ( = ?auto_734997 ?auto_734998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_734997 ?auto_734998 )
      ( !STACK ?auto_734997 ?auto_734996 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735039 - BLOCK
      ?auto_735040 - BLOCK
      ?auto_735041 - BLOCK
      ?auto_735042 - BLOCK
      ?auto_735043 - BLOCK
      ?auto_735044 - BLOCK
      ?auto_735045 - BLOCK
      ?auto_735046 - BLOCK
      ?auto_735047 - BLOCK
      ?auto_735048 - BLOCK
      ?auto_735049 - BLOCK
      ?auto_735050 - BLOCK
      ?auto_735051 - BLOCK
    )
    :vars
    (
      ?auto_735052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735051 ?auto_735052 ) ( ON-TABLE ?auto_735039 ) ( ON ?auto_735040 ?auto_735039 ) ( ON ?auto_735041 ?auto_735040 ) ( ON ?auto_735042 ?auto_735041 ) ( ON ?auto_735043 ?auto_735042 ) ( ON ?auto_735044 ?auto_735043 ) ( ON ?auto_735045 ?auto_735044 ) ( ON ?auto_735046 ?auto_735045 ) ( ON ?auto_735047 ?auto_735046 ) ( ON ?auto_735048 ?auto_735047 ) ( ON ?auto_735049 ?auto_735048 ) ( not ( = ?auto_735039 ?auto_735040 ) ) ( not ( = ?auto_735039 ?auto_735041 ) ) ( not ( = ?auto_735039 ?auto_735042 ) ) ( not ( = ?auto_735039 ?auto_735043 ) ) ( not ( = ?auto_735039 ?auto_735044 ) ) ( not ( = ?auto_735039 ?auto_735045 ) ) ( not ( = ?auto_735039 ?auto_735046 ) ) ( not ( = ?auto_735039 ?auto_735047 ) ) ( not ( = ?auto_735039 ?auto_735048 ) ) ( not ( = ?auto_735039 ?auto_735049 ) ) ( not ( = ?auto_735039 ?auto_735050 ) ) ( not ( = ?auto_735039 ?auto_735051 ) ) ( not ( = ?auto_735039 ?auto_735052 ) ) ( not ( = ?auto_735040 ?auto_735041 ) ) ( not ( = ?auto_735040 ?auto_735042 ) ) ( not ( = ?auto_735040 ?auto_735043 ) ) ( not ( = ?auto_735040 ?auto_735044 ) ) ( not ( = ?auto_735040 ?auto_735045 ) ) ( not ( = ?auto_735040 ?auto_735046 ) ) ( not ( = ?auto_735040 ?auto_735047 ) ) ( not ( = ?auto_735040 ?auto_735048 ) ) ( not ( = ?auto_735040 ?auto_735049 ) ) ( not ( = ?auto_735040 ?auto_735050 ) ) ( not ( = ?auto_735040 ?auto_735051 ) ) ( not ( = ?auto_735040 ?auto_735052 ) ) ( not ( = ?auto_735041 ?auto_735042 ) ) ( not ( = ?auto_735041 ?auto_735043 ) ) ( not ( = ?auto_735041 ?auto_735044 ) ) ( not ( = ?auto_735041 ?auto_735045 ) ) ( not ( = ?auto_735041 ?auto_735046 ) ) ( not ( = ?auto_735041 ?auto_735047 ) ) ( not ( = ?auto_735041 ?auto_735048 ) ) ( not ( = ?auto_735041 ?auto_735049 ) ) ( not ( = ?auto_735041 ?auto_735050 ) ) ( not ( = ?auto_735041 ?auto_735051 ) ) ( not ( = ?auto_735041 ?auto_735052 ) ) ( not ( = ?auto_735042 ?auto_735043 ) ) ( not ( = ?auto_735042 ?auto_735044 ) ) ( not ( = ?auto_735042 ?auto_735045 ) ) ( not ( = ?auto_735042 ?auto_735046 ) ) ( not ( = ?auto_735042 ?auto_735047 ) ) ( not ( = ?auto_735042 ?auto_735048 ) ) ( not ( = ?auto_735042 ?auto_735049 ) ) ( not ( = ?auto_735042 ?auto_735050 ) ) ( not ( = ?auto_735042 ?auto_735051 ) ) ( not ( = ?auto_735042 ?auto_735052 ) ) ( not ( = ?auto_735043 ?auto_735044 ) ) ( not ( = ?auto_735043 ?auto_735045 ) ) ( not ( = ?auto_735043 ?auto_735046 ) ) ( not ( = ?auto_735043 ?auto_735047 ) ) ( not ( = ?auto_735043 ?auto_735048 ) ) ( not ( = ?auto_735043 ?auto_735049 ) ) ( not ( = ?auto_735043 ?auto_735050 ) ) ( not ( = ?auto_735043 ?auto_735051 ) ) ( not ( = ?auto_735043 ?auto_735052 ) ) ( not ( = ?auto_735044 ?auto_735045 ) ) ( not ( = ?auto_735044 ?auto_735046 ) ) ( not ( = ?auto_735044 ?auto_735047 ) ) ( not ( = ?auto_735044 ?auto_735048 ) ) ( not ( = ?auto_735044 ?auto_735049 ) ) ( not ( = ?auto_735044 ?auto_735050 ) ) ( not ( = ?auto_735044 ?auto_735051 ) ) ( not ( = ?auto_735044 ?auto_735052 ) ) ( not ( = ?auto_735045 ?auto_735046 ) ) ( not ( = ?auto_735045 ?auto_735047 ) ) ( not ( = ?auto_735045 ?auto_735048 ) ) ( not ( = ?auto_735045 ?auto_735049 ) ) ( not ( = ?auto_735045 ?auto_735050 ) ) ( not ( = ?auto_735045 ?auto_735051 ) ) ( not ( = ?auto_735045 ?auto_735052 ) ) ( not ( = ?auto_735046 ?auto_735047 ) ) ( not ( = ?auto_735046 ?auto_735048 ) ) ( not ( = ?auto_735046 ?auto_735049 ) ) ( not ( = ?auto_735046 ?auto_735050 ) ) ( not ( = ?auto_735046 ?auto_735051 ) ) ( not ( = ?auto_735046 ?auto_735052 ) ) ( not ( = ?auto_735047 ?auto_735048 ) ) ( not ( = ?auto_735047 ?auto_735049 ) ) ( not ( = ?auto_735047 ?auto_735050 ) ) ( not ( = ?auto_735047 ?auto_735051 ) ) ( not ( = ?auto_735047 ?auto_735052 ) ) ( not ( = ?auto_735048 ?auto_735049 ) ) ( not ( = ?auto_735048 ?auto_735050 ) ) ( not ( = ?auto_735048 ?auto_735051 ) ) ( not ( = ?auto_735048 ?auto_735052 ) ) ( not ( = ?auto_735049 ?auto_735050 ) ) ( not ( = ?auto_735049 ?auto_735051 ) ) ( not ( = ?auto_735049 ?auto_735052 ) ) ( not ( = ?auto_735050 ?auto_735051 ) ) ( not ( = ?auto_735050 ?auto_735052 ) ) ( not ( = ?auto_735051 ?auto_735052 ) ) ( CLEAR ?auto_735049 ) ( ON ?auto_735050 ?auto_735051 ) ( CLEAR ?auto_735050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_735039 ?auto_735040 ?auto_735041 ?auto_735042 ?auto_735043 ?auto_735044 ?auto_735045 ?auto_735046 ?auto_735047 ?auto_735048 ?auto_735049 ?auto_735050 )
      ( MAKE-13PILE ?auto_735039 ?auto_735040 ?auto_735041 ?auto_735042 ?auto_735043 ?auto_735044 ?auto_735045 ?auto_735046 ?auto_735047 ?auto_735048 ?auto_735049 ?auto_735050 ?auto_735051 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735093 - BLOCK
      ?auto_735094 - BLOCK
      ?auto_735095 - BLOCK
      ?auto_735096 - BLOCK
      ?auto_735097 - BLOCK
      ?auto_735098 - BLOCK
      ?auto_735099 - BLOCK
      ?auto_735100 - BLOCK
      ?auto_735101 - BLOCK
      ?auto_735102 - BLOCK
      ?auto_735103 - BLOCK
      ?auto_735104 - BLOCK
      ?auto_735105 - BLOCK
    )
    :vars
    (
      ?auto_735106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735105 ?auto_735106 ) ( ON-TABLE ?auto_735093 ) ( ON ?auto_735094 ?auto_735093 ) ( ON ?auto_735095 ?auto_735094 ) ( ON ?auto_735096 ?auto_735095 ) ( ON ?auto_735097 ?auto_735096 ) ( ON ?auto_735098 ?auto_735097 ) ( ON ?auto_735099 ?auto_735098 ) ( ON ?auto_735100 ?auto_735099 ) ( ON ?auto_735101 ?auto_735100 ) ( ON ?auto_735102 ?auto_735101 ) ( not ( = ?auto_735093 ?auto_735094 ) ) ( not ( = ?auto_735093 ?auto_735095 ) ) ( not ( = ?auto_735093 ?auto_735096 ) ) ( not ( = ?auto_735093 ?auto_735097 ) ) ( not ( = ?auto_735093 ?auto_735098 ) ) ( not ( = ?auto_735093 ?auto_735099 ) ) ( not ( = ?auto_735093 ?auto_735100 ) ) ( not ( = ?auto_735093 ?auto_735101 ) ) ( not ( = ?auto_735093 ?auto_735102 ) ) ( not ( = ?auto_735093 ?auto_735103 ) ) ( not ( = ?auto_735093 ?auto_735104 ) ) ( not ( = ?auto_735093 ?auto_735105 ) ) ( not ( = ?auto_735093 ?auto_735106 ) ) ( not ( = ?auto_735094 ?auto_735095 ) ) ( not ( = ?auto_735094 ?auto_735096 ) ) ( not ( = ?auto_735094 ?auto_735097 ) ) ( not ( = ?auto_735094 ?auto_735098 ) ) ( not ( = ?auto_735094 ?auto_735099 ) ) ( not ( = ?auto_735094 ?auto_735100 ) ) ( not ( = ?auto_735094 ?auto_735101 ) ) ( not ( = ?auto_735094 ?auto_735102 ) ) ( not ( = ?auto_735094 ?auto_735103 ) ) ( not ( = ?auto_735094 ?auto_735104 ) ) ( not ( = ?auto_735094 ?auto_735105 ) ) ( not ( = ?auto_735094 ?auto_735106 ) ) ( not ( = ?auto_735095 ?auto_735096 ) ) ( not ( = ?auto_735095 ?auto_735097 ) ) ( not ( = ?auto_735095 ?auto_735098 ) ) ( not ( = ?auto_735095 ?auto_735099 ) ) ( not ( = ?auto_735095 ?auto_735100 ) ) ( not ( = ?auto_735095 ?auto_735101 ) ) ( not ( = ?auto_735095 ?auto_735102 ) ) ( not ( = ?auto_735095 ?auto_735103 ) ) ( not ( = ?auto_735095 ?auto_735104 ) ) ( not ( = ?auto_735095 ?auto_735105 ) ) ( not ( = ?auto_735095 ?auto_735106 ) ) ( not ( = ?auto_735096 ?auto_735097 ) ) ( not ( = ?auto_735096 ?auto_735098 ) ) ( not ( = ?auto_735096 ?auto_735099 ) ) ( not ( = ?auto_735096 ?auto_735100 ) ) ( not ( = ?auto_735096 ?auto_735101 ) ) ( not ( = ?auto_735096 ?auto_735102 ) ) ( not ( = ?auto_735096 ?auto_735103 ) ) ( not ( = ?auto_735096 ?auto_735104 ) ) ( not ( = ?auto_735096 ?auto_735105 ) ) ( not ( = ?auto_735096 ?auto_735106 ) ) ( not ( = ?auto_735097 ?auto_735098 ) ) ( not ( = ?auto_735097 ?auto_735099 ) ) ( not ( = ?auto_735097 ?auto_735100 ) ) ( not ( = ?auto_735097 ?auto_735101 ) ) ( not ( = ?auto_735097 ?auto_735102 ) ) ( not ( = ?auto_735097 ?auto_735103 ) ) ( not ( = ?auto_735097 ?auto_735104 ) ) ( not ( = ?auto_735097 ?auto_735105 ) ) ( not ( = ?auto_735097 ?auto_735106 ) ) ( not ( = ?auto_735098 ?auto_735099 ) ) ( not ( = ?auto_735098 ?auto_735100 ) ) ( not ( = ?auto_735098 ?auto_735101 ) ) ( not ( = ?auto_735098 ?auto_735102 ) ) ( not ( = ?auto_735098 ?auto_735103 ) ) ( not ( = ?auto_735098 ?auto_735104 ) ) ( not ( = ?auto_735098 ?auto_735105 ) ) ( not ( = ?auto_735098 ?auto_735106 ) ) ( not ( = ?auto_735099 ?auto_735100 ) ) ( not ( = ?auto_735099 ?auto_735101 ) ) ( not ( = ?auto_735099 ?auto_735102 ) ) ( not ( = ?auto_735099 ?auto_735103 ) ) ( not ( = ?auto_735099 ?auto_735104 ) ) ( not ( = ?auto_735099 ?auto_735105 ) ) ( not ( = ?auto_735099 ?auto_735106 ) ) ( not ( = ?auto_735100 ?auto_735101 ) ) ( not ( = ?auto_735100 ?auto_735102 ) ) ( not ( = ?auto_735100 ?auto_735103 ) ) ( not ( = ?auto_735100 ?auto_735104 ) ) ( not ( = ?auto_735100 ?auto_735105 ) ) ( not ( = ?auto_735100 ?auto_735106 ) ) ( not ( = ?auto_735101 ?auto_735102 ) ) ( not ( = ?auto_735101 ?auto_735103 ) ) ( not ( = ?auto_735101 ?auto_735104 ) ) ( not ( = ?auto_735101 ?auto_735105 ) ) ( not ( = ?auto_735101 ?auto_735106 ) ) ( not ( = ?auto_735102 ?auto_735103 ) ) ( not ( = ?auto_735102 ?auto_735104 ) ) ( not ( = ?auto_735102 ?auto_735105 ) ) ( not ( = ?auto_735102 ?auto_735106 ) ) ( not ( = ?auto_735103 ?auto_735104 ) ) ( not ( = ?auto_735103 ?auto_735105 ) ) ( not ( = ?auto_735103 ?auto_735106 ) ) ( not ( = ?auto_735104 ?auto_735105 ) ) ( not ( = ?auto_735104 ?auto_735106 ) ) ( not ( = ?auto_735105 ?auto_735106 ) ) ( ON ?auto_735104 ?auto_735105 ) ( CLEAR ?auto_735102 ) ( ON ?auto_735103 ?auto_735104 ) ( CLEAR ?auto_735103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_735093 ?auto_735094 ?auto_735095 ?auto_735096 ?auto_735097 ?auto_735098 ?auto_735099 ?auto_735100 ?auto_735101 ?auto_735102 ?auto_735103 )
      ( MAKE-13PILE ?auto_735093 ?auto_735094 ?auto_735095 ?auto_735096 ?auto_735097 ?auto_735098 ?auto_735099 ?auto_735100 ?auto_735101 ?auto_735102 ?auto_735103 ?auto_735104 ?auto_735105 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735147 - BLOCK
      ?auto_735148 - BLOCK
      ?auto_735149 - BLOCK
      ?auto_735150 - BLOCK
      ?auto_735151 - BLOCK
      ?auto_735152 - BLOCK
      ?auto_735153 - BLOCK
      ?auto_735154 - BLOCK
      ?auto_735155 - BLOCK
      ?auto_735156 - BLOCK
      ?auto_735157 - BLOCK
      ?auto_735158 - BLOCK
      ?auto_735159 - BLOCK
    )
    :vars
    (
      ?auto_735160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735159 ?auto_735160 ) ( ON-TABLE ?auto_735147 ) ( ON ?auto_735148 ?auto_735147 ) ( ON ?auto_735149 ?auto_735148 ) ( ON ?auto_735150 ?auto_735149 ) ( ON ?auto_735151 ?auto_735150 ) ( ON ?auto_735152 ?auto_735151 ) ( ON ?auto_735153 ?auto_735152 ) ( ON ?auto_735154 ?auto_735153 ) ( ON ?auto_735155 ?auto_735154 ) ( not ( = ?auto_735147 ?auto_735148 ) ) ( not ( = ?auto_735147 ?auto_735149 ) ) ( not ( = ?auto_735147 ?auto_735150 ) ) ( not ( = ?auto_735147 ?auto_735151 ) ) ( not ( = ?auto_735147 ?auto_735152 ) ) ( not ( = ?auto_735147 ?auto_735153 ) ) ( not ( = ?auto_735147 ?auto_735154 ) ) ( not ( = ?auto_735147 ?auto_735155 ) ) ( not ( = ?auto_735147 ?auto_735156 ) ) ( not ( = ?auto_735147 ?auto_735157 ) ) ( not ( = ?auto_735147 ?auto_735158 ) ) ( not ( = ?auto_735147 ?auto_735159 ) ) ( not ( = ?auto_735147 ?auto_735160 ) ) ( not ( = ?auto_735148 ?auto_735149 ) ) ( not ( = ?auto_735148 ?auto_735150 ) ) ( not ( = ?auto_735148 ?auto_735151 ) ) ( not ( = ?auto_735148 ?auto_735152 ) ) ( not ( = ?auto_735148 ?auto_735153 ) ) ( not ( = ?auto_735148 ?auto_735154 ) ) ( not ( = ?auto_735148 ?auto_735155 ) ) ( not ( = ?auto_735148 ?auto_735156 ) ) ( not ( = ?auto_735148 ?auto_735157 ) ) ( not ( = ?auto_735148 ?auto_735158 ) ) ( not ( = ?auto_735148 ?auto_735159 ) ) ( not ( = ?auto_735148 ?auto_735160 ) ) ( not ( = ?auto_735149 ?auto_735150 ) ) ( not ( = ?auto_735149 ?auto_735151 ) ) ( not ( = ?auto_735149 ?auto_735152 ) ) ( not ( = ?auto_735149 ?auto_735153 ) ) ( not ( = ?auto_735149 ?auto_735154 ) ) ( not ( = ?auto_735149 ?auto_735155 ) ) ( not ( = ?auto_735149 ?auto_735156 ) ) ( not ( = ?auto_735149 ?auto_735157 ) ) ( not ( = ?auto_735149 ?auto_735158 ) ) ( not ( = ?auto_735149 ?auto_735159 ) ) ( not ( = ?auto_735149 ?auto_735160 ) ) ( not ( = ?auto_735150 ?auto_735151 ) ) ( not ( = ?auto_735150 ?auto_735152 ) ) ( not ( = ?auto_735150 ?auto_735153 ) ) ( not ( = ?auto_735150 ?auto_735154 ) ) ( not ( = ?auto_735150 ?auto_735155 ) ) ( not ( = ?auto_735150 ?auto_735156 ) ) ( not ( = ?auto_735150 ?auto_735157 ) ) ( not ( = ?auto_735150 ?auto_735158 ) ) ( not ( = ?auto_735150 ?auto_735159 ) ) ( not ( = ?auto_735150 ?auto_735160 ) ) ( not ( = ?auto_735151 ?auto_735152 ) ) ( not ( = ?auto_735151 ?auto_735153 ) ) ( not ( = ?auto_735151 ?auto_735154 ) ) ( not ( = ?auto_735151 ?auto_735155 ) ) ( not ( = ?auto_735151 ?auto_735156 ) ) ( not ( = ?auto_735151 ?auto_735157 ) ) ( not ( = ?auto_735151 ?auto_735158 ) ) ( not ( = ?auto_735151 ?auto_735159 ) ) ( not ( = ?auto_735151 ?auto_735160 ) ) ( not ( = ?auto_735152 ?auto_735153 ) ) ( not ( = ?auto_735152 ?auto_735154 ) ) ( not ( = ?auto_735152 ?auto_735155 ) ) ( not ( = ?auto_735152 ?auto_735156 ) ) ( not ( = ?auto_735152 ?auto_735157 ) ) ( not ( = ?auto_735152 ?auto_735158 ) ) ( not ( = ?auto_735152 ?auto_735159 ) ) ( not ( = ?auto_735152 ?auto_735160 ) ) ( not ( = ?auto_735153 ?auto_735154 ) ) ( not ( = ?auto_735153 ?auto_735155 ) ) ( not ( = ?auto_735153 ?auto_735156 ) ) ( not ( = ?auto_735153 ?auto_735157 ) ) ( not ( = ?auto_735153 ?auto_735158 ) ) ( not ( = ?auto_735153 ?auto_735159 ) ) ( not ( = ?auto_735153 ?auto_735160 ) ) ( not ( = ?auto_735154 ?auto_735155 ) ) ( not ( = ?auto_735154 ?auto_735156 ) ) ( not ( = ?auto_735154 ?auto_735157 ) ) ( not ( = ?auto_735154 ?auto_735158 ) ) ( not ( = ?auto_735154 ?auto_735159 ) ) ( not ( = ?auto_735154 ?auto_735160 ) ) ( not ( = ?auto_735155 ?auto_735156 ) ) ( not ( = ?auto_735155 ?auto_735157 ) ) ( not ( = ?auto_735155 ?auto_735158 ) ) ( not ( = ?auto_735155 ?auto_735159 ) ) ( not ( = ?auto_735155 ?auto_735160 ) ) ( not ( = ?auto_735156 ?auto_735157 ) ) ( not ( = ?auto_735156 ?auto_735158 ) ) ( not ( = ?auto_735156 ?auto_735159 ) ) ( not ( = ?auto_735156 ?auto_735160 ) ) ( not ( = ?auto_735157 ?auto_735158 ) ) ( not ( = ?auto_735157 ?auto_735159 ) ) ( not ( = ?auto_735157 ?auto_735160 ) ) ( not ( = ?auto_735158 ?auto_735159 ) ) ( not ( = ?auto_735158 ?auto_735160 ) ) ( not ( = ?auto_735159 ?auto_735160 ) ) ( ON ?auto_735158 ?auto_735159 ) ( ON ?auto_735157 ?auto_735158 ) ( CLEAR ?auto_735155 ) ( ON ?auto_735156 ?auto_735157 ) ( CLEAR ?auto_735156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_735147 ?auto_735148 ?auto_735149 ?auto_735150 ?auto_735151 ?auto_735152 ?auto_735153 ?auto_735154 ?auto_735155 ?auto_735156 )
      ( MAKE-13PILE ?auto_735147 ?auto_735148 ?auto_735149 ?auto_735150 ?auto_735151 ?auto_735152 ?auto_735153 ?auto_735154 ?auto_735155 ?auto_735156 ?auto_735157 ?auto_735158 ?auto_735159 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735201 - BLOCK
      ?auto_735202 - BLOCK
      ?auto_735203 - BLOCK
      ?auto_735204 - BLOCK
      ?auto_735205 - BLOCK
      ?auto_735206 - BLOCK
      ?auto_735207 - BLOCK
      ?auto_735208 - BLOCK
      ?auto_735209 - BLOCK
      ?auto_735210 - BLOCK
      ?auto_735211 - BLOCK
      ?auto_735212 - BLOCK
      ?auto_735213 - BLOCK
    )
    :vars
    (
      ?auto_735214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735213 ?auto_735214 ) ( ON-TABLE ?auto_735201 ) ( ON ?auto_735202 ?auto_735201 ) ( ON ?auto_735203 ?auto_735202 ) ( ON ?auto_735204 ?auto_735203 ) ( ON ?auto_735205 ?auto_735204 ) ( ON ?auto_735206 ?auto_735205 ) ( ON ?auto_735207 ?auto_735206 ) ( ON ?auto_735208 ?auto_735207 ) ( not ( = ?auto_735201 ?auto_735202 ) ) ( not ( = ?auto_735201 ?auto_735203 ) ) ( not ( = ?auto_735201 ?auto_735204 ) ) ( not ( = ?auto_735201 ?auto_735205 ) ) ( not ( = ?auto_735201 ?auto_735206 ) ) ( not ( = ?auto_735201 ?auto_735207 ) ) ( not ( = ?auto_735201 ?auto_735208 ) ) ( not ( = ?auto_735201 ?auto_735209 ) ) ( not ( = ?auto_735201 ?auto_735210 ) ) ( not ( = ?auto_735201 ?auto_735211 ) ) ( not ( = ?auto_735201 ?auto_735212 ) ) ( not ( = ?auto_735201 ?auto_735213 ) ) ( not ( = ?auto_735201 ?auto_735214 ) ) ( not ( = ?auto_735202 ?auto_735203 ) ) ( not ( = ?auto_735202 ?auto_735204 ) ) ( not ( = ?auto_735202 ?auto_735205 ) ) ( not ( = ?auto_735202 ?auto_735206 ) ) ( not ( = ?auto_735202 ?auto_735207 ) ) ( not ( = ?auto_735202 ?auto_735208 ) ) ( not ( = ?auto_735202 ?auto_735209 ) ) ( not ( = ?auto_735202 ?auto_735210 ) ) ( not ( = ?auto_735202 ?auto_735211 ) ) ( not ( = ?auto_735202 ?auto_735212 ) ) ( not ( = ?auto_735202 ?auto_735213 ) ) ( not ( = ?auto_735202 ?auto_735214 ) ) ( not ( = ?auto_735203 ?auto_735204 ) ) ( not ( = ?auto_735203 ?auto_735205 ) ) ( not ( = ?auto_735203 ?auto_735206 ) ) ( not ( = ?auto_735203 ?auto_735207 ) ) ( not ( = ?auto_735203 ?auto_735208 ) ) ( not ( = ?auto_735203 ?auto_735209 ) ) ( not ( = ?auto_735203 ?auto_735210 ) ) ( not ( = ?auto_735203 ?auto_735211 ) ) ( not ( = ?auto_735203 ?auto_735212 ) ) ( not ( = ?auto_735203 ?auto_735213 ) ) ( not ( = ?auto_735203 ?auto_735214 ) ) ( not ( = ?auto_735204 ?auto_735205 ) ) ( not ( = ?auto_735204 ?auto_735206 ) ) ( not ( = ?auto_735204 ?auto_735207 ) ) ( not ( = ?auto_735204 ?auto_735208 ) ) ( not ( = ?auto_735204 ?auto_735209 ) ) ( not ( = ?auto_735204 ?auto_735210 ) ) ( not ( = ?auto_735204 ?auto_735211 ) ) ( not ( = ?auto_735204 ?auto_735212 ) ) ( not ( = ?auto_735204 ?auto_735213 ) ) ( not ( = ?auto_735204 ?auto_735214 ) ) ( not ( = ?auto_735205 ?auto_735206 ) ) ( not ( = ?auto_735205 ?auto_735207 ) ) ( not ( = ?auto_735205 ?auto_735208 ) ) ( not ( = ?auto_735205 ?auto_735209 ) ) ( not ( = ?auto_735205 ?auto_735210 ) ) ( not ( = ?auto_735205 ?auto_735211 ) ) ( not ( = ?auto_735205 ?auto_735212 ) ) ( not ( = ?auto_735205 ?auto_735213 ) ) ( not ( = ?auto_735205 ?auto_735214 ) ) ( not ( = ?auto_735206 ?auto_735207 ) ) ( not ( = ?auto_735206 ?auto_735208 ) ) ( not ( = ?auto_735206 ?auto_735209 ) ) ( not ( = ?auto_735206 ?auto_735210 ) ) ( not ( = ?auto_735206 ?auto_735211 ) ) ( not ( = ?auto_735206 ?auto_735212 ) ) ( not ( = ?auto_735206 ?auto_735213 ) ) ( not ( = ?auto_735206 ?auto_735214 ) ) ( not ( = ?auto_735207 ?auto_735208 ) ) ( not ( = ?auto_735207 ?auto_735209 ) ) ( not ( = ?auto_735207 ?auto_735210 ) ) ( not ( = ?auto_735207 ?auto_735211 ) ) ( not ( = ?auto_735207 ?auto_735212 ) ) ( not ( = ?auto_735207 ?auto_735213 ) ) ( not ( = ?auto_735207 ?auto_735214 ) ) ( not ( = ?auto_735208 ?auto_735209 ) ) ( not ( = ?auto_735208 ?auto_735210 ) ) ( not ( = ?auto_735208 ?auto_735211 ) ) ( not ( = ?auto_735208 ?auto_735212 ) ) ( not ( = ?auto_735208 ?auto_735213 ) ) ( not ( = ?auto_735208 ?auto_735214 ) ) ( not ( = ?auto_735209 ?auto_735210 ) ) ( not ( = ?auto_735209 ?auto_735211 ) ) ( not ( = ?auto_735209 ?auto_735212 ) ) ( not ( = ?auto_735209 ?auto_735213 ) ) ( not ( = ?auto_735209 ?auto_735214 ) ) ( not ( = ?auto_735210 ?auto_735211 ) ) ( not ( = ?auto_735210 ?auto_735212 ) ) ( not ( = ?auto_735210 ?auto_735213 ) ) ( not ( = ?auto_735210 ?auto_735214 ) ) ( not ( = ?auto_735211 ?auto_735212 ) ) ( not ( = ?auto_735211 ?auto_735213 ) ) ( not ( = ?auto_735211 ?auto_735214 ) ) ( not ( = ?auto_735212 ?auto_735213 ) ) ( not ( = ?auto_735212 ?auto_735214 ) ) ( not ( = ?auto_735213 ?auto_735214 ) ) ( ON ?auto_735212 ?auto_735213 ) ( ON ?auto_735211 ?auto_735212 ) ( ON ?auto_735210 ?auto_735211 ) ( CLEAR ?auto_735208 ) ( ON ?auto_735209 ?auto_735210 ) ( CLEAR ?auto_735209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_735201 ?auto_735202 ?auto_735203 ?auto_735204 ?auto_735205 ?auto_735206 ?auto_735207 ?auto_735208 ?auto_735209 )
      ( MAKE-13PILE ?auto_735201 ?auto_735202 ?auto_735203 ?auto_735204 ?auto_735205 ?auto_735206 ?auto_735207 ?auto_735208 ?auto_735209 ?auto_735210 ?auto_735211 ?auto_735212 ?auto_735213 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735255 - BLOCK
      ?auto_735256 - BLOCK
      ?auto_735257 - BLOCK
      ?auto_735258 - BLOCK
      ?auto_735259 - BLOCK
      ?auto_735260 - BLOCK
      ?auto_735261 - BLOCK
      ?auto_735262 - BLOCK
      ?auto_735263 - BLOCK
      ?auto_735264 - BLOCK
      ?auto_735265 - BLOCK
      ?auto_735266 - BLOCK
      ?auto_735267 - BLOCK
    )
    :vars
    (
      ?auto_735268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735267 ?auto_735268 ) ( ON-TABLE ?auto_735255 ) ( ON ?auto_735256 ?auto_735255 ) ( ON ?auto_735257 ?auto_735256 ) ( ON ?auto_735258 ?auto_735257 ) ( ON ?auto_735259 ?auto_735258 ) ( ON ?auto_735260 ?auto_735259 ) ( ON ?auto_735261 ?auto_735260 ) ( not ( = ?auto_735255 ?auto_735256 ) ) ( not ( = ?auto_735255 ?auto_735257 ) ) ( not ( = ?auto_735255 ?auto_735258 ) ) ( not ( = ?auto_735255 ?auto_735259 ) ) ( not ( = ?auto_735255 ?auto_735260 ) ) ( not ( = ?auto_735255 ?auto_735261 ) ) ( not ( = ?auto_735255 ?auto_735262 ) ) ( not ( = ?auto_735255 ?auto_735263 ) ) ( not ( = ?auto_735255 ?auto_735264 ) ) ( not ( = ?auto_735255 ?auto_735265 ) ) ( not ( = ?auto_735255 ?auto_735266 ) ) ( not ( = ?auto_735255 ?auto_735267 ) ) ( not ( = ?auto_735255 ?auto_735268 ) ) ( not ( = ?auto_735256 ?auto_735257 ) ) ( not ( = ?auto_735256 ?auto_735258 ) ) ( not ( = ?auto_735256 ?auto_735259 ) ) ( not ( = ?auto_735256 ?auto_735260 ) ) ( not ( = ?auto_735256 ?auto_735261 ) ) ( not ( = ?auto_735256 ?auto_735262 ) ) ( not ( = ?auto_735256 ?auto_735263 ) ) ( not ( = ?auto_735256 ?auto_735264 ) ) ( not ( = ?auto_735256 ?auto_735265 ) ) ( not ( = ?auto_735256 ?auto_735266 ) ) ( not ( = ?auto_735256 ?auto_735267 ) ) ( not ( = ?auto_735256 ?auto_735268 ) ) ( not ( = ?auto_735257 ?auto_735258 ) ) ( not ( = ?auto_735257 ?auto_735259 ) ) ( not ( = ?auto_735257 ?auto_735260 ) ) ( not ( = ?auto_735257 ?auto_735261 ) ) ( not ( = ?auto_735257 ?auto_735262 ) ) ( not ( = ?auto_735257 ?auto_735263 ) ) ( not ( = ?auto_735257 ?auto_735264 ) ) ( not ( = ?auto_735257 ?auto_735265 ) ) ( not ( = ?auto_735257 ?auto_735266 ) ) ( not ( = ?auto_735257 ?auto_735267 ) ) ( not ( = ?auto_735257 ?auto_735268 ) ) ( not ( = ?auto_735258 ?auto_735259 ) ) ( not ( = ?auto_735258 ?auto_735260 ) ) ( not ( = ?auto_735258 ?auto_735261 ) ) ( not ( = ?auto_735258 ?auto_735262 ) ) ( not ( = ?auto_735258 ?auto_735263 ) ) ( not ( = ?auto_735258 ?auto_735264 ) ) ( not ( = ?auto_735258 ?auto_735265 ) ) ( not ( = ?auto_735258 ?auto_735266 ) ) ( not ( = ?auto_735258 ?auto_735267 ) ) ( not ( = ?auto_735258 ?auto_735268 ) ) ( not ( = ?auto_735259 ?auto_735260 ) ) ( not ( = ?auto_735259 ?auto_735261 ) ) ( not ( = ?auto_735259 ?auto_735262 ) ) ( not ( = ?auto_735259 ?auto_735263 ) ) ( not ( = ?auto_735259 ?auto_735264 ) ) ( not ( = ?auto_735259 ?auto_735265 ) ) ( not ( = ?auto_735259 ?auto_735266 ) ) ( not ( = ?auto_735259 ?auto_735267 ) ) ( not ( = ?auto_735259 ?auto_735268 ) ) ( not ( = ?auto_735260 ?auto_735261 ) ) ( not ( = ?auto_735260 ?auto_735262 ) ) ( not ( = ?auto_735260 ?auto_735263 ) ) ( not ( = ?auto_735260 ?auto_735264 ) ) ( not ( = ?auto_735260 ?auto_735265 ) ) ( not ( = ?auto_735260 ?auto_735266 ) ) ( not ( = ?auto_735260 ?auto_735267 ) ) ( not ( = ?auto_735260 ?auto_735268 ) ) ( not ( = ?auto_735261 ?auto_735262 ) ) ( not ( = ?auto_735261 ?auto_735263 ) ) ( not ( = ?auto_735261 ?auto_735264 ) ) ( not ( = ?auto_735261 ?auto_735265 ) ) ( not ( = ?auto_735261 ?auto_735266 ) ) ( not ( = ?auto_735261 ?auto_735267 ) ) ( not ( = ?auto_735261 ?auto_735268 ) ) ( not ( = ?auto_735262 ?auto_735263 ) ) ( not ( = ?auto_735262 ?auto_735264 ) ) ( not ( = ?auto_735262 ?auto_735265 ) ) ( not ( = ?auto_735262 ?auto_735266 ) ) ( not ( = ?auto_735262 ?auto_735267 ) ) ( not ( = ?auto_735262 ?auto_735268 ) ) ( not ( = ?auto_735263 ?auto_735264 ) ) ( not ( = ?auto_735263 ?auto_735265 ) ) ( not ( = ?auto_735263 ?auto_735266 ) ) ( not ( = ?auto_735263 ?auto_735267 ) ) ( not ( = ?auto_735263 ?auto_735268 ) ) ( not ( = ?auto_735264 ?auto_735265 ) ) ( not ( = ?auto_735264 ?auto_735266 ) ) ( not ( = ?auto_735264 ?auto_735267 ) ) ( not ( = ?auto_735264 ?auto_735268 ) ) ( not ( = ?auto_735265 ?auto_735266 ) ) ( not ( = ?auto_735265 ?auto_735267 ) ) ( not ( = ?auto_735265 ?auto_735268 ) ) ( not ( = ?auto_735266 ?auto_735267 ) ) ( not ( = ?auto_735266 ?auto_735268 ) ) ( not ( = ?auto_735267 ?auto_735268 ) ) ( ON ?auto_735266 ?auto_735267 ) ( ON ?auto_735265 ?auto_735266 ) ( ON ?auto_735264 ?auto_735265 ) ( ON ?auto_735263 ?auto_735264 ) ( CLEAR ?auto_735261 ) ( ON ?auto_735262 ?auto_735263 ) ( CLEAR ?auto_735262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_735255 ?auto_735256 ?auto_735257 ?auto_735258 ?auto_735259 ?auto_735260 ?auto_735261 ?auto_735262 )
      ( MAKE-13PILE ?auto_735255 ?auto_735256 ?auto_735257 ?auto_735258 ?auto_735259 ?auto_735260 ?auto_735261 ?auto_735262 ?auto_735263 ?auto_735264 ?auto_735265 ?auto_735266 ?auto_735267 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735309 - BLOCK
      ?auto_735310 - BLOCK
      ?auto_735311 - BLOCK
      ?auto_735312 - BLOCK
      ?auto_735313 - BLOCK
      ?auto_735314 - BLOCK
      ?auto_735315 - BLOCK
      ?auto_735316 - BLOCK
      ?auto_735317 - BLOCK
      ?auto_735318 - BLOCK
      ?auto_735319 - BLOCK
      ?auto_735320 - BLOCK
      ?auto_735321 - BLOCK
    )
    :vars
    (
      ?auto_735322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735321 ?auto_735322 ) ( ON-TABLE ?auto_735309 ) ( ON ?auto_735310 ?auto_735309 ) ( ON ?auto_735311 ?auto_735310 ) ( ON ?auto_735312 ?auto_735311 ) ( ON ?auto_735313 ?auto_735312 ) ( ON ?auto_735314 ?auto_735313 ) ( not ( = ?auto_735309 ?auto_735310 ) ) ( not ( = ?auto_735309 ?auto_735311 ) ) ( not ( = ?auto_735309 ?auto_735312 ) ) ( not ( = ?auto_735309 ?auto_735313 ) ) ( not ( = ?auto_735309 ?auto_735314 ) ) ( not ( = ?auto_735309 ?auto_735315 ) ) ( not ( = ?auto_735309 ?auto_735316 ) ) ( not ( = ?auto_735309 ?auto_735317 ) ) ( not ( = ?auto_735309 ?auto_735318 ) ) ( not ( = ?auto_735309 ?auto_735319 ) ) ( not ( = ?auto_735309 ?auto_735320 ) ) ( not ( = ?auto_735309 ?auto_735321 ) ) ( not ( = ?auto_735309 ?auto_735322 ) ) ( not ( = ?auto_735310 ?auto_735311 ) ) ( not ( = ?auto_735310 ?auto_735312 ) ) ( not ( = ?auto_735310 ?auto_735313 ) ) ( not ( = ?auto_735310 ?auto_735314 ) ) ( not ( = ?auto_735310 ?auto_735315 ) ) ( not ( = ?auto_735310 ?auto_735316 ) ) ( not ( = ?auto_735310 ?auto_735317 ) ) ( not ( = ?auto_735310 ?auto_735318 ) ) ( not ( = ?auto_735310 ?auto_735319 ) ) ( not ( = ?auto_735310 ?auto_735320 ) ) ( not ( = ?auto_735310 ?auto_735321 ) ) ( not ( = ?auto_735310 ?auto_735322 ) ) ( not ( = ?auto_735311 ?auto_735312 ) ) ( not ( = ?auto_735311 ?auto_735313 ) ) ( not ( = ?auto_735311 ?auto_735314 ) ) ( not ( = ?auto_735311 ?auto_735315 ) ) ( not ( = ?auto_735311 ?auto_735316 ) ) ( not ( = ?auto_735311 ?auto_735317 ) ) ( not ( = ?auto_735311 ?auto_735318 ) ) ( not ( = ?auto_735311 ?auto_735319 ) ) ( not ( = ?auto_735311 ?auto_735320 ) ) ( not ( = ?auto_735311 ?auto_735321 ) ) ( not ( = ?auto_735311 ?auto_735322 ) ) ( not ( = ?auto_735312 ?auto_735313 ) ) ( not ( = ?auto_735312 ?auto_735314 ) ) ( not ( = ?auto_735312 ?auto_735315 ) ) ( not ( = ?auto_735312 ?auto_735316 ) ) ( not ( = ?auto_735312 ?auto_735317 ) ) ( not ( = ?auto_735312 ?auto_735318 ) ) ( not ( = ?auto_735312 ?auto_735319 ) ) ( not ( = ?auto_735312 ?auto_735320 ) ) ( not ( = ?auto_735312 ?auto_735321 ) ) ( not ( = ?auto_735312 ?auto_735322 ) ) ( not ( = ?auto_735313 ?auto_735314 ) ) ( not ( = ?auto_735313 ?auto_735315 ) ) ( not ( = ?auto_735313 ?auto_735316 ) ) ( not ( = ?auto_735313 ?auto_735317 ) ) ( not ( = ?auto_735313 ?auto_735318 ) ) ( not ( = ?auto_735313 ?auto_735319 ) ) ( not ( = ?auto_735313 ?auto_735320 ) ) ( not ( = ?auto_735313 ?auto_735321 ) ) ( not ( = ?auto_735313 ?auto_735322 ) ) ( not ( = ?auto_735314 ?auto_735315 ) ) ( not ( = ?auto_735314 ?auto_735316 ) ) ( not ( = ?auto_735314 ?auto_735317 ) ) ( not ( = ?auto_735314 ?auto_735318 ) ) ( not ( = ?auto_735314 ?auto_735319 ) ) ( not ( = ?auto_735314 ?auto_735320 ) ) ( not ( = ?auto_735314 ?auto_735321 ) ) ( not ( = ?auto_735314 ?auto_735322 ) ) ( not ( = ?auto_735315 ?auto_735316 ) ) ( not ( = ?auto_735315 ?auto_735317 ) ) ( not ( = ?auto_735315 ?auto_735318 ) ) ( not ( = ?auto_735315 ?auto_735319 ) ) ( not ( = ?auto_735315 ?auto_735320 ) ) ( not ( = ?auto_735315 ?auto_735321 ) ) ( not ( = ?auto_735315 ?auto_735322 ) ) ( not ( = ?auto_735316 ?auto_735317 ) ) ( not ( = ?auto_735316 ?auto_735318 ) ) ( not ( = ?auto_735316 ?auto_735319 ) ) ( not ( = ?auto_735316 ?auto_735320 ) ) ( not ( = ?auto_735316 ?auto_735321 ) ) ( not ( = ?auto_735316 ?auto_735322 ) ) ( not ( = ?auto_735317 ?auto_735318 ) ) ( not ( = ?auto_735317 ?auto_735319 ) ) ( not ( = ?auto_735317 ?auto_735320 ) ) ( not ( = ?auto_735317 ?auto_735321 ) ) ( not ( = ?auto_735317 ?auto_735322 ) ) ( not ( = ?auto_735318 ?auto_735319 ) ) ( not ( = ?auto_735318 ?auto_735320 ) ) ( not ( = ?auto_735318 ?auto_735321 ) ) ( not ( = ?auto_735318 ?auto_735322 ) ) ( not ( = ?auto_735319 ?auto_735320 ) ) ( not ( = ?auto_735319 ?auto_735321 ) ) ( not ( = ?auto_735319 ?auto_735322 ) ) ( not ( = ?auto_735320 ?auto_735321 ) ) ( not ( = ?auto_735320 ?auto_735322 ) ) ( not ( = ?auto_735321 ?auto_735322 ) ) ( ON ?auto_735320 ?auto_735321 ) ( ON ?auto_735319 ?auto_735320 ) ( ON ?auto_735318 ?auto_735319 ) ( ON ?auto_735317 ?auto_735318 ) ( ON ?auto_735316 ?auto_735317 ) ( CLEAR ?auto_735314 ) ( ON ?auto_735315 ?auto_735316 ) ( CLEAR ?auto_735315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_735309 ?auto_735310 ?auto_735311 ?auto_735312 ?auto_735313 ?auto_735314 ?auto_735315 )
      ( MAKE-13PILE ?auto_735309 ?auto_735310 ?auto_735311 ?auto_735312 ?auto_735313 ?auto_735314 ?auto_735315 ?auto_735316 ?auto_735317 ?auto_735318 ?auto_735319 ?auto_735320 ?auto_735321 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735363 - BLOCK
      ?auto_735364 - BLOCK
      ?auto_735365 - BLOCK
      ?auto_735366 - BLOCK
      ?auto_735367 - BLOCK
      ?auto_735368 - BLOCK
      ?auto_735369 - BLOCK
      ?auto_735370 - BLOCK
      ?auto_735371 - BLOCK
      ?auto_735372 - BLOCK
      ?auto_735373 - BLOCK
      ?auto_735374 - BLOCK
      ?auto_735375 - BLOCK
    )
    :vars
    (
      ?auto_735376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735375 ?auto_735376 ) ( ON-TABLE ?auto_735363 ) ( ON ?auto_735364 ?auto_735363 ) ( ON ?auto_735365 ?auto_735364 ) ( ON ?auto_735366 ?auto_735365 ) ( ON ?auto_735367 ?auto_735366 ) ( not ( = ?auto_735363 ?auto_735364 ) ) ( not ( = ?auto_735363 ?auto_735365 ) ) ( not ( = ?auto_735363 ?auto_735366 ) ) ( not ( = ?auto_735363 ?auto_735367 ) ) ( not ( = ?auto_735363 ?auto_735368 ) ) ( not ( = ?auto_735363 ?auto_735369 ) ) ( not ( = ?auto_735363 ?auto_735370 ) ) ( not ( = ?auto_735363 ?auto_735371 ) ) ( not ( = ?auto_735363 ?auto_735372 ) ) ( not ( = ?auto_735363 ?auto_735373 ) ) ( not ( = ?auto_735363 ?auto_735374 ) ) ( not ( = ?auto_735363 ?auto_735375 ) ) ( not ( = ?auto_735363 ?auto_735376 ) ) ( not ( = ?auto_735364 ?auto_735365 ) ) ( not ( = ?auto_735364 ?auto_735366 ) ) ( not ( = ?auto_735364 ?auto_735367 ) ) ( not ( = ?auto_735364 ?auto_735368 ) ) ( not ( = ?auto_735364 ?auto_735369 ) ) ( not ( = ?auto_735364 ?auto_735370 ) ) ( not ( = ?auto_735364 ?auto_735371 ) ) ( not ( = ?auto_735364 ?auto_735372 ) ) ( not ( = ?auto_735364 ?auto_735373 ) ) ( not ( = ?auto_735364 ?auto_735374 ) ) ( not ( = ?auto_735364 ?auto_735375 ) ) ( not ( = ?auto_735364 ?auto_735376 ) ) ( not ( = ?auto_735365 ?auto_735366 ) ) ( not ( = ?auto_735365 ?auto_735367 ) ) ( not ( = ?auto_735365 ?auto_735368 ) ) ( not ( = ?auto_735365 ?auto_735369 ) ) ( not ( = ?auto_735365 ?auto_735370 ) ) ( not ( = ?auto_735365 ?auto_735371 ) ) ( not ( = ?auto_735365 ?auto_735372 ) ) ( not ( = ?auto_735365 ?auto_735373 ) ) ( not ( = ?auto_735365 ?auto_735374 ) ) ( not ( = ?auto_735365 ?auto_735375 ) ) ( not ( = ?auto_735365 ?auto_735376 ) ) ( not ( = ?auto_735366 ?auto_735367 ) ) ( not ( = ?auto_735366 ?auto_735368 ) ) ( not ( = ?auto_735366 ?auto_735369 ) ) ( not ( = ?auto_735366 ?auto_735370 ) ) ( not ( = ?auto_735366 ?auto_735371 ) ) ( not ( = ?auto_735366 ?auto_735372 ) ) ( not ( = ?auto_735366 ?auto_735373 ) ) ( not ( = ?auto_735366 ?auto_735374 ) ) ( not ( = ?auto_735366 ?auto_735375 ) ) ( not ( = ?auto_735366 ?auto_735376 ) ) ( not ( = ?auto_735367 ?auto_735368 ) ) ( not ( = ?auto_735367 ?auto_735369 ) ) ( not ( = ?auto_735367 ?auto_735370 ) ) ( not ( = ?auto_735367 ?auto_735371 ) ) ( not ( = ?auto_735367 ?auto_735372 ) ) ( not ( = ?auto_735367 ?auto_735373 ) ) ( not ( = ?auto_735367 ?auto_735374 ) ) ( not ( = ?auto_735367 ?auto_735375 ) ) ( not ( = ?auto_735367 ?auto_735376 ) ) ( not ( = ?auto_735368 ?auto_735369 ) ) ( not ( = ?auto_735368 ?auto_735370 ) ) ( not ( = ?auto_735368 ?auto_735371 ) ) ( not ( = ?auto_735368 ?auto_735372 ) ) ( not ( = ?auto_735368 ?auto_735373 ) ) ( not ( = ?auto_735368 ?auto_735374 ) ) ( not ( = ?auto_735368 ?auto_735375 ) ) ( not ( = ?auto_735368 ?auto_735376 ) ) ( not ( = ?auto_735369 ?auto_735370 ) ) ( not ( = ?auto_735369 ?auto_735371 ) ) ( not ( = ?auto_735369 ?auto_735372 ) ) ( not ( = ?auto_735369 ?auto_735373 ) ) ( not ( = ?auto_735369 ?auto_735374 ) ) ( not ( = ?auto_735369 ?auto_735375 ) ) ( not ( = ?auto_735369 ?auto_735376 ) ) ( not ( = ?auto_735370 ?auto_735371 ) ) ( not ( = ?auto_735370 ?auto_735372 ) ) ( not ( = ?auto_735370 ?auto_735373 ) ) ( not ( = ?auto_735370 ?auto_735374 ) ) ( not ( = ?auto_735370 ?auto_735375 ) ) ( not ( = ?auto_735370 ?auto_735376 ) ) ( not ( = ?auto_735371 ?auto_735372 ) ) ( not ( = ?auto_735371 ?auto_735373 ) ) ( not ( = ?auto_735371 ?auto_735374 ) ) ( not ( = ?auto_735371 ?auto_735375 ) ) ( not ( = ?auto_735371 ?auto_735376 ) ) ( not ( = ?auto_735372 ?auto_735373 ) ) ( not ( = ?auto_735372 ?auto_735374 ) ) ( not ( = ?auto_735372 ?auto_735375 ) ) ( not ( = ?auto_735372 ?auto_735376 ) ) ( not ( = ?auto_735373 ?auto_735374 ) ) ( not ( = ?auto_735373 ?auto_735375 ) ) ( not ( = ?auto_735373 ?auto_735376 ) ) ( not ( = ?auto_735374 ?auto_735375 ) ) ( not ( = ?auto_735374 ?auto_735376 ) ) ( not ( = ?auto_735375 ?auto_735376 ) ) ( ON ?auto_735374 ?auto_735375 ) ( ON ?auto_735373 ?auto_735374 ) ( ON ?auto_735372 ?auto_735373 ) ( ON ?auto_735371 ?auto_735372 ) ( ON ?auto_735370 ?auto_735371 ) ( ON ?auto_735369 ?auto_735370 ) ( CLEAR ?auto_735367 ) ( ON ?auto_735368 ?auto_735369 ) ( CLEAR ?auto_735368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_735363 ?auto_735364 ?auto_735365 ?auto_735366 ?auto_735367 ?auto_735368 )
      ( MAKE-13PILE ?auto_735363 ?auto_735364 ?auto_735365 ?auto_735366 ?auto_735367 ?auto_735368 ?auto_735369 ?auto_735370 ?auto_735371 ?auto_735372 ?auto_735373 ?auto_735374 ?auto_735375 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735417 - BLOCK
      ?auto_735418 - BLOCK
      ?auto_735419 - BLOCK
      ?auto_735420 - BLOCK
      ?auto_735421 - BLOCK
      ?auto_735422 - BLOCK
      ?auto_735423 - BLOCK
      ?auto_735424 - BLOCK
      ?auto_735425 - BLOCK
      ?auto_735426 - BLOCK
      ?auto_735427 - BLOCK
      ?auto_735428 - BLOCK
      ?auto_735429 - BLOCK
    )
    :vars
    (
      ?auto_735430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735429 ?auto_735430 ) ( ON-TABLE ?auto_735417 ) ( ON ?auto_735418 ?auto_735417 ) ( ON ?auto_735419 ?auto_735418 ) ( ON ?auto_735420 ?auto_735419 ) ( not ( = ?auto_735417 ?auto_735418 ) ) ( not ( = ?auto_735417 ?auto_735419 ) ) ( not ( = ?auto_735417 ?auto_735420 ) ) ( not ( = ?auto_735417 ?auto_735421 ) ) ( not ( = ?auto_735417 ?auto_735422 ) ) ( not ( = ?auto_735417 ?auto_735423 ) ) ( not ( = ?auto_735417 ?auto_735424 ) ) ( not ( = ?auto_735417 ?auto_735425 ) ) ( not ( = ?auto_735417 ?auto_735426 ) ) ( not ( = ?auto_735417 ?auto_735427 ) ) ( not ( = ?auto_735417 ?auto_735428 ) ) ( not ( = ?auto_735417 ?auto_735429 ) ) ( not ( = ?auto_735417 ?auto_735430 ) ) ( not ( = ?auto_735418 ?auto_735419 ) ) ( not ( = ?auto_735418 ?auto_735420 ) ) ( not ( = ?auto_735418 ?auto_735421 ) ) ( not ( = ?auto_735418 ?auto_735422 ) ) ( not ( = ?auto_735418 ?auto_735423 ) ) ( not ( = ?auto_735418 ?auto_735424 ) ) ( not ( = ?auto_735418 ?auto_735425 ) ) ( not ( = ?auto_735418 ?auto_735426 ) ) ( not ( = ?auto_735418 ?auto_735427 ) ) ( not ( = ?auto_735418 ?auto_735428 ) ) ( not ( = ?auto_735418 ?auto_735429 ) ) ( not ( = ?auto_735418 ?auto_735430 ) ) ( not ( = ?auto_735419 ?auto_735420 ) ) ( not ( = ?auto_735419 ?auto_735421 ) ) ( not ( = ?auto_735419 ?auto_735422 ) ) ( not ( = ?auto_735419 ?auto_735423 ) ) ( not ( = ?auto_735419 ?auto_735424 ) ) ( not ( = ?auto_735419 ?auto_735425 ) ) ( not ( = ?auto_735419 ?auto_735426 ) ) ( not ( = ?auto_735419 ?auto_735427 ) ) ( not ( = ?auto_735419 ?auto_735428 ) ) ( not ( = ?auto_735419 ?auto_735429 ) ) ( not ( = ?auto_735419 ?auto_735430 ) ) ( not ( = ?auto_735420 ?auto_735421 ) ) ( not ( = ?auto_735420 ?auto_735422 ) ) ( not ( = ?auto_735420 ?auto_735423 ) ) ( not ( = ?auto_735420 ?auto_735424 ) ) ( not ( = ?auto_735420 ?auto_735425 ) ) ( not ( = ?auto_735420 ?auto_735426 ) ) ( not ( = ?auto_735420 ?auto_735427 ) ) ( not ( = ?auto_735420 ?auto_735428 ) ) ( not ( = ?auto_735420 ?auto_735429 ) ) ( not ( = ?auto_735420 ?auto_735430 ) ) ( not ( = ?auto_735421 ?auto_735422 ) ) ( not ( = ?auto_735421 ?auto_735423 ) ) ( not ( = ?auto_735421 ?auto_735424 ) ) ( not ( = ?auto_735421 ?auto_735425 ) ) ( not ( = ?auto_735421 ?auto_735426 ) ) ( not ( = ?auto_735421 ?auto_735427 ) ) ( not ( = ?auto_735421 ?auto_735428 ) ) ( not ( = ?auto_735421 ?auto_735429 ) ) ( not ( = ?auto_735421 ?auto_735430 ) ) ( not ( = ?auto_735422 ?auto_735423 ) ) ( not ( = ?auto_735422 ?auto_735424 ) ) ( not ( = ?auto_735422 ?auto_735425 ) ) ( not ( = ?auto_735422 ?auto_735426 ) ) ( not ( = ?auto_735422 ?auto_735427 ) ) ( not ( = ?auto_735422 ?auto_735428 ) ) ( not ( = ?auto_735422 ?auto_735429 ) ) ( not ( = ?auto_735422 ?auto_735430 ) ) ( not ( = ?auto_735423 ?auto_735424 ) ) ( not ( = ?auto_735423 ?auto_735425 ) ) ( not ( = ?auto_735423 ?auto_735426 ) ) ( not ( = ?auto_735423 ?auto_735427 ) ) ( not ( = ?auto_735423 ?auto_735428 ) ) ( not ( = ?auto_735423 ?auto_735429 ) ) ( not ( = ?auto_735423 ?auto_735430 ) ) ( not ( = ?auto_735424 ?auto_735425 ) ) ( not ( = ?auto_735424 ?auto_735426 ) ) ( not ( = ?auto_735424 ?auto_735427 ) ) ( not ( = ?auto_735424 ?auto_735428 ) ) ( not ( = ?auto_735424 ?auto_735429 ) ) ( not ( = ?auto_735424 ?auto_735430 ) ) ( not ( = ?auto_735425 ?auto_735426 ) ) ( not ( = ?auto_735425 ?auto_735427 ) ) ( not ( = ?auto_735425 ?auto_735428 ) ) ( not ( = ?auto_735425 ?auto_735429 ) ) ( not ( = ?auto_735425 ?auto_735430 ) ) ( not ( = ?auto_735426 ?auto_735427 ) ) ( not ( = ?auto_735426 ?auto_735428 ) ) ( not ( = ?auto_735426 ?auto_735429 ) ) ( not ( = ?auto_735426 ?auto_735430 ) ) ( not ( = ?auto_735427 ?auto_735428 ) ) ( not ( = ?auto_735427 ?auto_735429 ) ) ( not ( = ?auto_735427 ?auto_735430 ) ) ( not ( = ?auto_735428 ?auto_735429 ) ) ( not ( = ?auto_735428 ?auto_735430 ) ) ( not ( = ?auto_735429 ?auto_735430 ) ) ( ON ?auto_735428 ?auto_735429 ) ( ON ?auto_735427 ?auto_735428 ) ( ON ?auto_735426 ?auto_735427 ) ( ON ?auto_735425 ?auto_735426 ) ( ON ?auto_735424 ?auto_735425 ) ( ON ?auto_735423 ?auto_735424 ) ( ON ?auto_735422 ?auto_735423 ) ( CLEAR ?auto_735420 ) ( ON ?auto_735421 ?auto_735422 ) ( CLEAR ?auto_735421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_735417 ?auto_735418 ?auto_735419 ?auto_735420 ?auto_735421 )
      ( MAKE-13PILE ?auto_735417 ?auto_735418 ?auto_735419 ?auto_735420 ?auto_735421 ?auto_735422 ?auto_735423 ?auto_735424 ?auto_735425 ?auto_735426 ?auto_735427 ?auto_735428 ?auto_735429 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735471 - BLOCK
      ?auto_735472 - BLOCK
      ?auto_735473 - BLOCK
      ?auto_735474 - BLOCK
      ?auto_735475 - BLOCK
      ?auto_735476 - BLOCK
      ?auto_735477 - BLOCK
      ?auto_735478 - BLOCK
      ?auto_735479 - BLOCK
      ?auto_735480 - BLOCK
      ?auto_735481 - BLOCK
      ?auto_735482 - BLOCK
      ?auto_735483 - BLOCK
    )
    :vars
    (
      ?auto_735484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735483 ?auto_735484 ) ( ON-TABLE ?auto_735471 ) ( ON ?auto_735472 ?auto_735471 ) ( ON ?auto_735473 ?auto_735472 ) ( not ( = ?auto_735471 ?auto_735472 ) ) ( not ( = ?auto_735471 ?auto_735473 ) ) ( not ( = ?auto_735471 ?auto_735474 ) ) ( not ( = ?auto_735471 ?auto_735475 ) ) ( not ( = ?auto_735471 ?auto_735476 ) ) ( not ( = ?auto_735471 ?auto_735477 ) ) ( not ( = ?auto_735471 ?auto_735478 ) ) ( not ( = ?auto_735471 ?auto_735479 ) ) ( not ( = ?auto_735471 ?auto_735480 ) ) ( not ( = ?auto_735471 ?auto_735481 ) ) ( not ( = ?auto_735471 ?auto_735482 ) ) ( not ( = ?auto_735471 ?auto_735483 ) ) ( not ( = ?auto_735471 ?auto_735484 ) ) ( not ( = ?auto_735472 ?auto_735473 ) ) ( not ( = ?auto_735472 ?auto_735474 ) ) ( not ( = ?auto_735472 ?auto_735475 ) ) ( not ( = ?auto_735472 ?auto_735476 ) ) ( not ( = ?auto_735472 ?auto_735477 ) ) ( not ( = ?auto_735472 ?auto_735478 ) ) ( not ( = ?auto_735472 ?auto_735479 ) ) ( not ( = ?auto_735472 ?auto_735480 ) ) ( not ( = ?auto_735472 ?auto_735481 ) ) ( not ( = ?auto_735472 ?auto_735482 ) ) ( not ( = ?auto_735472 ?auto_735483 ) ) ( not ( = ?auto_735472 ?auto_735484 ) ) ( not ( = ?auto_735473 ?auto_735474 ) ) ( not ( = ?auto_735473 ?auto_735475 ) ) ( not ( = ?auto_735473 ?auto_735476 ) ) ( not ( = ?auto_735473 ?auto_735477 ) ) ( not ( = ?auto_735473 ?auto_735478 ) ) ( not ( = ?auto_735473 ?auto_735479 ) ) ( not ( = ?auto_735473 ?auto_735480 ) ) ( not ( = ?auto_735473 ?auto_735481 ) ) ( not ( = ?auto_735473 ?auto_735482 ) ) ( not ( = ?auto_735473 ?auto_735483 ) ) ( not ( = ?auto_735473 ?auto_735484 ) ) ( not ( = ?auto_735474 ?auto_735475 ) ) ( not ( = ?auto_735474 ?auto_735476 ) ) ( not ( = ?auto_735474 ?auto_735477 ) ) ( not ( = ?auto_735474 ?auto_735478 ) ) ( not ( = ?auto_735474 ?auto_735479 ) ) ( not ( = ?auto_735474 ?auto_735480 ) ) ( not ( = ?auto_735474 ?auto_735481 ) ) ( not ( = ?auto_735474 ?auto_735482 ) ) ( not ( = ?auto_735474 ?auto_735483 ) ) ( not ( = ?auto_735474 ?auto_735484 ) ) ( not ( = ?auto_735475 ?auto_735476 ) ) ( not ( = ?auto_735475 ?auto_735477 ) ) ( not ( = ?auto_735475 ?auto_735478 ) ) ( not ( = ?auto_735475 ?auto_735479 ) ) ( not ( = ?auto_735475 ?auto_735480 ) ) ( not ( = ?auto_735475 ?auto_735481 ) ) ( not ( = ?auto_735475 ?auto_735482 ) ) ( not ( = ?auto_735475 ?auto_735483 ) ) ( not ( = ?auto_735475 ?auto_735484 ) ) ( not ( = ?auto_735476 ?auto_735477 ) ) ( not ( = ?auto_735476 ?auto_735478 ) ) ( not ( = ?auto_735476 ?auto_735479 ) ) ( not ( = ?auto_735476 ?auto_735480 ) ) ( not ( = ?auto_735476 ?auto_735481 ) ) ( not ( = ?auto_735476 ?auto_735482 ) ) ( not ( = ?auto_735476 ?auto_735483 ) ) ( not ( = ?auto_735476 ?auto_735484 ) ) ( not ( = ?auto_735477 ?auto_735478 ) ) ( not ( = ?auto_735477 ?auto_735479 ) ) ( not ( = ?auto_735477 ?auto_735480 ) ) ( not ( = ?auto_735477 ?auto_735481 ) ) ( not ( = ?auto_735477 ?auto_735482 ) ) ( not ( = ?auto_735477 ?auto_735483 ) ) ( not ( = ?auto_735477 ?auto_735484 ) ) ( not ( = ?auto_735478 ?auto_735479 ) ) ( not ( = ?auto_735478 ?auto_735480 ) ) ( not ( = ?auto_735478 ?auto_735481 ) ) ( not ( = ?auto_735478 ?auto_735482 ) ) ( not ( = ?auto_735478 ?auto_735483 ) ) ( not ( = ?auto_735478 ?auto_735484 ) ) ( not ( = ?auto_735479 ?auto_735480 ) ) ( not ( = ?auto_735479 ?auto_735481 ) ) ( not ( = ?auto_735479 ?auto_735482 ) ) ( not ( = ?auto_735479 ?auto_735483 ) ) ( not ( = ?auto_735479 ?auto_735484 ) ) ( not ( = ?auto_735480 ?auto_735481 ) ) ( not ( = ?auto_735480 ?auto_735482 ) ) ( not ( = ?auto_735480 ?auto_735483 ) ) ( not ( = ?auto_735480 ?auto_735484 ) ) ( not ( = ?auto_735481 ?auto_735482 ) ) ( not ( = ?auto_735481 ?auto_735483 ) ) ( not ( = ?auto_735481 ?auto_735484 ) ) ( not ( = ?auto_735482 ?auto_735483 ) ) ( not ( = ?auto_735482 ?auto_735484 ) ) ( not ( = ?auto_735483 ?auto_735484 ) ) ( ON ?auto_735482 ?auto_735483 ) ( ON ?auto_735481 ?auto_735482 ) ( ON ?auto_735480 ?auto_735481 ) ( ON ?auto_735479 ?auto_735480 ) ( ON ?auto_735478 ?auto_735479 ) ( ON ?auto_735477 ?auto_735478 ) ( ON ?auto_735476 ?auto_735477 ) ( ON ?auto_735475 ?auto_735476 ) ( CLEAR ?auto_735473 ) ( ON ?auto_735474 ?auto_735475 ) ( CLEAR ?auto_735474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_735471 ?auto_735472 ?auto_735473 ?auto_735474 )
      ( MAKE-13PILE ?auto_735471 ?auto_735472 ?auto_735473 ?auto_735474 ?auto_735475 ?auto_735476 ?auto_735477 ?auto_735478 ?auto_735479 ?auto_735480 ?auto_735481 ?auto_735482 ?auto_735483 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735525 - BLOCK
      ?auto_735526 - BLOCK
      ?auto_735527 - BLOCK
      ?auto_735528 - BLOCK
      ?auto_735529 - BLOCK
      ?auto_735530 - BLOCK
      ?auto_735531 - BLOCK
      ?auto_735532 - BLOCK
      ?auto_735533 - BLOCK
      ?auto_735534 - BLOCK
      ?auto_735535 - BLOCK
      ?auto_735536 - BLOCK
      ?auto_735537 - BLOCK
    )
    :vars
    (
      ?auto_735538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735537 ?auto_735538 ) ( ON-TABLE ?auto_735525 ) ( ON ?auto_735526 ?auto_735525 ) ( not ( = ?auto_735525 ?auto_735526 ) ) ( not ( = ?auto_735525 ?auto_735527 ) ) ( not ( = ?auto_735525 ?auto_735528 ) ) ( not ( = ?auto_735525 ?auto_735529 ) ) ( not ( = ?auto_735525 ?auto_735530 ) ) ( not ( = ?auto_735525 ?auto_735531 ) ) ( not ( = ?auto_735525 ?auto_735532 ) ) ( not ( = ?auto_735525 ?auto_735533 ) ) ( not ( = ?auto_735525 ?auto_735534 ) ) ( not ( = ?auto_735525 ?auto_735535 ) ) ( not ( = ?auto_735525 ?auto_735536 ) ) ( not ( = ?auto_735525 ?auto_735537 ) ) ( not ( = ?auto_735525 ?auto_735538 ) ) ( not ( = ?auto_735526 ?auto_735527 ) ) ( not ( = ?auto_735526 ?auto_735528 ) ) ( not ( = ?auto_735526 ?auto_735529 ) ) ( not ( = ?auto_735526 ?auto_735530 ) ) ( not ( = ?auto_735526 ?auto_735531 ) ) ( not ( = ?auto_735526 ?auto_735532 ) ) ( not ( = ?auto_735526 ?auto_735533 ) ) ( not ( = ?auto_735526 ?auto_735534 ) ) ( not ( = ?auto_735526 ?auto_735535 ) ) ( not ( = ?auto_735526 ?auto_735536 ) ) ( not ( = ?auto_735526 ?auto_735537 ) ) ( not ( = ?auto_735526 ?auto_735538 ) ) ( not ( = ?auto_735527 ?auto_735528 ) ) ( not ( = ?auto_735527 ?auto_735529 ) ) ( not ( = ?auto_735527 ?auto_735530 ) ) ( not ( = ?auto_735527 ?auto_735531 ) ) ( not ( = ?auto_735527 ?auto_735532 ) ) ( not ( = ?auto_735527 ?auto_735533 ) ) ( not ( = ?auto_735527 ?auto_735534 ) ) ( not ( = ?auto_735527 ?auto_735535 ) ) ( not ( = ?auto_735527 ?auto_735536 ) ) ( not ( = ?auto_735527 ?auto_735537 ) ) ( not ( = ?auto_735527 ?auto_735538 ) ) ( not ( = ?auto_735528 ?auto_735529 ) ) ( not ( = ?auto_735528 ?auto_735530 ) ) ( not ( = ?auto_735528 ?auto_735531 ) ) ( not ( = ?auto_735528 ?auto_735532 ) ) ( not ( = ?auto_735528 ?auto_735533 ) ) ( not ( = ?auto_735528 ?auto_735534 ) ) ( not ( = ?auto_735528 ?auto_735535 ) ) ( not ( = ?auto_735528 ?auto_735536 ) ) ( not ( = ?auto_735528 ?auto_735537 ) ) ( not ( = ?auto_735528 ?auto_735538 ) ) ( not ( = ?auto_735529 ?auto_735530 ) ) ( not ( = ?auto_735529 ?auto_735531 ) ) ( not ( = ?auto_735529 ?auto_735532 ) ) ( not ( = ?auto_735529 ?auto_735533 ) ) ( not ( = ?auto_735529 ?auto_735534 ) ) ( not ( = ?auto_735529 ?auto_735535 ) ) ( not ( = ?auto_735529 ?auto_735536 ) ) ( not ( = ?auto_735529 ?auto_735537 ) ) ( not ( = ?auto_735529 ?auto_735538 ) ) ( not ( = ?auto_735530 ?auto_735531 ) ) ( not ( = ?auto_735530 ?auto_735532 ) ) ( not ( = ?auto_735530 ?auto_735533 ) ) ( not ( = ?auto_735530 ?auto_735534 ) ) ( not ( = ?auto_735530 ?auto_735535 ) ) ( not ( = ?auto_735530 ?auto_735536 ) ) ( not ( = ?auto_735530 ?auto_735537 ) ) ( not ( = ?auto_735530 ?auto_735538 ) ) ( not ( = ?auto_735531 ?auto_735532 ) ) ( not ( = ?auto_735531 ?auto_735533 ) ) ( not ( = ?auto_735531 ?auto_735534 ) ) ( not ( = ?auto_735531 ?auto_735535 ) ) ( not ( = ?auto_735531 ?auto_735536 ) ) ( not ( = ?auto_735531 ?auto_735537 ) ) ( not ( = ?auto_735531 ?auto_735538 ) ) ( not ( = ?auto_735532 ?auto_735533 ) ) ( not ( = ?auto_735532 ?auto_735534 ) ) ( not ( = ?auto_735532 ?auto_735535 ) ) ( not ( = ?auto_735532 ?auto_735536 ) ) ( not ( = ?auto_735532 ?auto_735537 ) ) ( not ( = ?auto_735532 ?auto_735538 ) ) ( not ( = ?auto_735533 ?auto_735534 ) ) ( not ( = ?auto_735533 ?auto_735535 ) ) ( not ( = ?auto_735533 ?auto_735536 ) ) ( not ( = ?auto_735533 ?auto_735537 ) ) ( not ( = ?auto_735533 ?auto_735538 ) ) ( not ( = ?auto_735534 ?auto_735535 ) ) ( not ( = ?auto_735534 ?auto_735536 ) ) ( not ( = ?auto_735534 ?auto_735537 ) ) ( not ( = ?auto_735534 ?auto_735538 ) ) ( not ( = ?auto_735535 ?auto_735536 ) ) ( not ( = ?auto_735535 ?auto_735537 ) ) ( not ( = ?auto_735535 ?auto_735538 ) ) ( not ( = ?auto_735536 ?auto_735537 ) ) ( not ( = ?auto_735536 ?auto_735538 ) ) ( not ( = ?auto_735537 ?auto_735538 ) ) ( ON ?auto_735536 ?auto_735537 ) ( ON ?auto_735535 ?auto_735536 ) ( ON ?auto_735534 ?auto_735535 ) ( ON ?auto_735533 ?auto_735534 ) ( ON ?auto_735532 ?auto_735533 ) ( ON ?auto_735531 ?auto_735532 ) ( ON ?auto_735530 ?auto_735531 ) ( ON ?auto_735529 ?auto_735530 ) ( ON ?auto_735528 ?auto_735529 ) ( CLEAR ?auto_735526 ) ( ON ?auto_735527 ?auto_735528 ) ( CLEAR ?auto_735527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_735525 ?auto_735526 ?auto_735527 )
      ( MAKE-13PILE ?auto_735525 ?auto_735526 ?auto_735527 ?auto_735528 ?auto_735529 ?auto_735530 ?auto_735531 ?auto_735532 ?auto_735533 ?auto_735534 ?auto_735535 ?auto_735536 ?auto_735537 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735579 - BLOCK
      ?auto_735580 - BLOCK
      ?auto_735581 - BLOCK
      ?auto_735582 - BLOCK
      ?auto_735583 - BLOCK
      ?auto_735584 - BLOCK
      ?auto_735585 - BLOCK
      ?auto_735586 - BLOCK
      ?auto_735587 - BLOCK
      ?auto_735588 - BLOCK
      ?auto_735589 - BLOCK
      ?auto_735590 - BLOCK
      ?auto_735591 - BLOCK
    )
    :vars
    (
      ?auto_735592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735591 ?auto_735592 ) ( ON-TABLE ?auto_735579 ) ( not ( = ?auto_735579 ?auto_735580 ) ) ( not ( = ?auto_735579 ?auto_735581 ) ) ( not ( = ?auto_735579 ?auto_735582 ) ) ( not ( = ?auto_735579 ?auto_735583 ) ) ( not ( = ?auto_735579 ?auto_735584 ) ) ( not ( = ?auto_735579 ?auto_735585 ) ) ( not ( = ?auto_735579 ?auto_735586 ) ) ( not ( = ?auto_735579 ?auto_735587 ) ) ( not ( = ?auto_735579 ?auto_735588 ) ) ( not ( = ?auto_735579 ?auto_735589 ) ) ( not ( = ?auto_735579 ?auto_735590 ) ) ( not ( = ?auto_735579 ?auto_735591 ) ) ( not ( = ?auto_735579 ?auto_735592 ) ) ( not ( = ?auto_735580 ?auto_735581 ) ) ( not ( = ?auto_735580 ?auto_735582 ) ) ( not ( = ?auto_735580 ?auto_735583 ) ) ( not ( = ?auto_735580 ?auto_735584 ) ) ( not ( = ?auto_735580 ?auto_735585 ) ) ( not ( = ?auto_735580 ?auto_735586 ) ) ( not ( = ?auto_735580 ?auto_735587 ) ) ( not ( = ?auto_735580 ?auto_735588 ) ) ( not ( = ?auto_735580 ?auto_735589 ) ) ( not ( = ?auto_735580 ?auto_735590 ) ) ( not ( = ?auto_735580 ?auto_735591 ) ) ( not ( = ?auto_735580 ?auto_735592 ) ) ( not ( = ?auto_735581 ?auto_735582 ) ) ( not ( = ?auto_735581 ?auto_735583 ) ) ( not ( = ?auto_735581 ?auto_735584 ) ) ( not ( = ?auto_735581 ?auto_735585 ) ) ( not ( = ?auto_735581 ?auto_735586 ) ) ( not ( = ?auto_735581 ?auto_735587 ) ) ( not ( = ?auto_735581 ?auto_735588 ) ) ( not ( = ?auto_735581 ?auto_735589 ) ) ( not ( = ?auto_735581 ?auto_735590 ) ) ( not ( = ?auto_735581 ?auto_735591 ) ) ( not ( = ?auto_735581 ?auto_735592 ) ) ( not ( = ?auto_735582 ?auto_735583 ) ) ( not ( = ?auto_735582 ?auto_735584 ) ) ( not ( = ?auto_735582 ?auto_735585 ) ) ( not ( = ?auto_735582 ?auto_735586 ) ) ( not ( = ?auto_735582 ?auto_735587 ) ) ( not ( = ?auto_735582 ?auto_735588 ) ) ( not ( = ?auto_735582 ?auto_735589 ) ) ( not ( = ?auto_735582 ?auto_735590 ) ) ( not ( = ?auto_735582 ?auto_735591 ) ) ( not ( = ?auto_735582 ?auto_735592 ) ) ( not ( = ?auto_735583 ?auto_735584 ) ) ( not ( = ?auto_735583 ?auto_735585 ) ) ( not ( = ?auto_735583 ?auto_735586 ) ) ( not ( = ?auto_735583 ?auto_735587 ) ) ( not ( = ?auto_735583 ?auto_735588 ) ) ( not ( = ?auto_735583 ?auto_735589 ) ) ( not ( = ?auto_735583 ?auto_735590 ) ) ( not ( = ?auto_735583 ?auto_735591 ) ) ( not ( = ?auto_735583 ?auto_735592 ) ) ( not ( = ?auto_735584 ?auto_735585 ) ) ( not ( = ?auto_735584 ?auto_735586 ) ) ( not ( = ?auto_735584 ?auto_735587 ) ) ( not ( = ?auto_735584 ?auto_735588 ) ) ( not ( = ?auto_735584 ?auto_735589 ) ) ( not ( = ?auto_735584 ?auto_735590 ) ) ( not ( = ?auto_735584 ?auto_735591 ) ) ( not ( = ?auto_735584 ?auto_735592 ) ) ( not ( = ?auto_735585 ?auto_735586 ) ) ( not ( = ?auto_735585 ?auto_735587 ) ) ( not ( = ?auto_735585 ?auto_735588 ) ) ( not ( = ?auto_735585 ?auto_735589 ) ) ( not ( = ?auto_735585 ?auto_735590 ) ) ( not ( = ?auto_735585 ?auto_735591 ) ) ( not ( = ?auto_735585 ?auto_735592 ) ) ( not ( = ?auto_735586 ?auto_735587 ) ) ( not ( = ?auto_735586 ?auto_735588 ) ) ( not ( = ?auto_735586 ?auto_735589 ) ) ( not ( = ?auto_735586 ?auto_735590 ) ) ( not ( = ?auto_735586 ?auto_735591 ) ) ( not ( = ?auto_735586 ?auto_735592 ) ) ( not ( = ?auto_735587 ?auto_735588 ) ) ( not ( = ?auto_735587 ?auto_735589 ) ) ( not ( = ?auto_735587 ?auto_735590 ) ) ( not ( = ?auto_735587 ?auto_735591 ) ) ( not ( = ?auto_735587 ?auto_735592 ) ) ( not ( = ?auto_735588 ?auto_735589 ) ) ( not ( = ?auto_735588 ?auto_735590 ) ) ( not ( = ?auto_735588 ?auto_735591 ) ) ( not ( = ?auto_735588 ?auto_735592 ) ) ( not ( = ?auto_735589 ?auto_735590 ) ) ( not ( = ?auto_735589 ?auto_735591 ) ) ( not ( = ?auto_735589 ?auto_735592 ) ) ( not ( = ?auto_735590 ?auto_735591 ) ) ( not ( = ?auto_735590 ?auto_735592 ) ) ( not ( = ?auto_735591 ?auto_735592 ) ) ( ON ?auto_735590 ?auto_735591 ) ( ON ?auto_735589 ?auto_735590 ) ( ON ?auto_735588 ?auto_735589 ) ( ON ?auto_735587 ?auto_735588 ) ( ON ?auto_735586 ?auto_735587 ) ( ON ?auto_735585 ?auto_735586 ) ( ON ?auto_735584 ?auto_735585 ) ( ON ?auto_735583 ?auto_735584 ) ( ON ?auto_735582 ?auto_735583 ) ( ON ?auto_735581 ?auto_735582 ) ( CLEAR ?auto_735579 ) ( ON ?auto_735580 ?auto_735581 ) ( CLEAR ?auto_735580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_735579 ?auto_735580 )
      ( MAKE-13PILE ?auto_735579 ?auto_735580 ?auto_735581 ?auto_735582 ?auto_735583 ?auto_735584 ?auto_735585 ?auto_735586 ?auto_735587 ?auto_735588 ?auto_735589 ?auto_735590 ?auto_735591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_735633 - BLOCK
      ?auto_735634 - BLOCK
      ?auto_735635 - BLOCK
      ?auto_735636 - BLOCK
      ?auto_735637 - BLOCK
      ?auto_735638 - BLOCK
      ?auto_735639 - BLOCK
      ?auto_735640 - BLOCK
      ?auto_735641 - BLOCK
      ?auto_735642 - BLOCK
      ?auto_735643 - BLOCK
      ?auto_735644 - BLOCK
      ?auto_735645 - BLOCK
    )
    :vars
    (
      ?auto_735646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735645 ?auto_735646 ) ( not ( = ?auto_735633 ?auto_735634 ) ) ( not ( = ?auto_735633 ?auto_735635 ) ) ( not ( = ?auto_735633 ?auto_735636 ) ) ( not ( = ?auto_735633 ?auto_735637 ) ) ( not ( = ?auto_735633 ?auto_735638 ) ) ( not ( = ?auto_735633 ?auto_735639 ) ) ( not ( = ?auto_735633 ?auto_735640 ) ) ( not ( = ?auto_735633 ?auto_735641 ) ) ( not ( = ?auto_735633 ?auto_735642 ) ) ( not ( = ?auto_735633 ?auto_735643 ) ) ( not ( = ?auto_735633 ?auto_735644 ) ) ( not ( = ?auto_735633 ?auto_735645 ) ) ( not ( = ?auto_735633 ?auto_735646 ) ) ( not ( = ?auto_735634 ?auto_735635 ) ) ( not ( = ?auto_735634 ?auto_735636 ) ) ( not ( = ?auto_735634 ?auto_735637 ) ) ( not ( = ?auto_735634 ?auto_735638 ) ) ( not ( = ?auto_735634 ?auto_735639 ) ) ( not ( = ?auto_735634 ?auto_735640 ) ) ( not ( = ?auto_735634 ?auto_735641 ) ) ( not ( = ?auto_735634 ?auto_735642 ) ) ( not ( = ?auto_735634 ?auto_735643 ) ) ( not ( = ?auto_735634 ?auto_735644 ) ) ( not ( = ?auto_735634 ?auto_735645 ) ) ( not ( = ?auto_735634 ?auto_735646 ) ) ( not ( = ?auto_735635 ?auto_735636 ) ) ( not ( = ?auto_735635 ?auto_735637 ) ) ( not ( = ?auto_735635 ?auto_735638 ) ) ( not ( = ?auto_735635 ?auto_735639 ) ) ( not ( = ?auto_735635 ?auto_735640 ) ) ( not ( = ?auto_735635 ?auto_735641 ) ) ( not ( = ?auto_735635 ?auto_735642 ) ) ( not ( = ?auto_735635 ?auto_735643 ) ) ( not ( = ?auto_735635 ?auto_735644 ) ) ( not ( = ?auto_735635 ?auto_735645 ) ) ( not ( = ?auto_735635 ?auto_735646 ) ) ( not ( = ?auto_735636 ?auto_735637 ) ) ( not ( = ?auto_735636 ?auto_735638 ) ) ( not ( = ?auto_735636 ?auto_735639 ) ) ( not ( = ?auto_735636 ?auto_735640 ) ) ( not ( = ?auto_735636 ?auto_735641 ) ) ( not ( = ?auto_735636 ?auto_735642 ) ) ( not ( = ?auto_735636 ?auto_735643 ) ) ( not ( = ?auto_735636 ?auto_735644 ) ) ( not ( = ?auto_735636 ?auto_735645 ) ) ( not ( = ?auto_735636 ?auto_735646 ) ) ( not ( = ?auto_735637 ?auto_735638 ) ) ( not ( = ?auto_735637 ?auto_735639 ) ) ( not ( = ?auto_735637 ?auto_735640 ) ) ( not ( = ?auto_735637 ?auto_735641 ) ) ( not ( = ?auto_735637 ?auto_735642 ) ) ( not ( = ?auto_735637 ?auto_735643 ) ) ( not ( = ?auto_735637 ?auto_735644 ) ) ( not ( = ?auto_735637 ?auto_735645 ) ) ( not ( = ?auto_735637 ?auto_735646 ) ) ( not ( = ?auto_735638 ?auto_735639 ) ) ( not ( = ?auto_735638 ?auto_735640 ) ) ( not ( = ?auto_735638 ?auto_735641 ) ) ( not ( = ?auto_735638 ?auto_735642 ) ) ( not ( = ?auto_735638 ?auto_735643 ) ) ( not ( = ?auto_735638 ?auto_735644 ) ) ( not ( = ?auto_735638 ?auto_735645 ) ) ( not ( = ?auto_735638 ?auto_735646 ) ) ( not ( = ?auto_735639 ?auto_735640 ) ) ( not ( = ?auto_735639 ?auto_735641 ) ) ( not ( = ?auto_735639 ?auto_735642 ) ) ( not ( = ?auto_735639 ?auto_735643 ) ) ( not ( = ?auto_735639 ?auto_735644 ) ) ( not ( = ?auto_735639 ?auto_735645 ) ) ( not ( = ?auto_735639 ?auto_735646 ) ) ( not ( = ?auto_735640 ?auto_735641 ) ) ( not ( = ?auto_735640 ?auto_735642 ) ) ( not ( = ?auto_735640 ?auto_735643 ) ) ( not ( = ?auto_735640 ?auto_735644 ) ) ( not ( = ?auto_735640 ?auto_735645 ) ) ( not ( = ?auto_735640 ?auto_735646 ) ) ( not ( = ?auto_735641 ?auto_735642 ) ) ( not ( = ?auto_735641 ?auto_735643 ) ) ( not ( = ?auto_735641 ?auto_735644 ) ) ( not ( = ?auto_735641 ?auto_735645 ) ) ( not ( = ?auto_735641 ?auto_735646 ) ) ( not ( = ?auto_735642 ?auto_735643 ) ) ( not ( = ?auto_735642 ?auto_735644 ) ) ( not ( = ?auto_735642 ?auto_735645 ) ) ( not ( = ?auto_735642 ?auto_735646 ) ) ( not ( = ?auto_735643 ?auto_735644 ) ) ( not ( = ?auto_735643 ?auto_735645 ) ) ( not ( = ?auto_735643 ?auto_735646 ) ) ( not ( = ?auto_735644 ?auto_735645 ) ) ( not ( = ?auto_735644 ?auto_735646 ) ) ( not ( = ?auto_735645 ?auto_735646 ) ) ( ON ?auto_735644 ?auto_735645 ) ( ON ?auto_735643 ?auto_735644 ) ( ON ?auto_735642 ?auto_735643 ) ( ON ?auto_735641 ?auto_735642 ) ( ON ?auto_735640 ?auto_735641 ) ( ON ?auto_735639 ?auto_735640 ) ( ON ?auto_735638 ?auto_735639 ) ( ON ?auto_735637 ?auto_735638 ) ( ON ?auto_735636 ?auto_735637 ) ( ON ?auto_735635 ?auto_735636 ) ( ON ?auto_735634 ?auto_735635 ) ( ON ?auto_735633 ?auto_735634 ) ( CLEAR ?auto_735633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_735633 )
      ( MAKE-13PILE ?auto_735633 ?auto_735634 ?auto_735635 ?auto_735636 ?auto_735637 ?auto_735638 ?auto_735639 ?auto_735640 ?auto_735641 ?auto_735642 ?auto_735643 ?auto_735644 ?auto_735645 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_735688 - BLOCK
      ?auto_735689 - BLOCK
      ?auto_735690 - BLOCK
      ?auto_735691 - BLOCK
      ?auto_735692 - BLOCK
      ?auto_735693 - BLOCK
      ?auto_735694 - BLOCK
      ?auto_735695 - BLOCK
      ?auto_735696 - BLOCK
      ?auto_735697 - BLOCK
      ?auto_735698 - BLOCK
      ?auto_735699 - BLOCK
      ?auto_735700 - BLOCK
      ?auto_735701 - BLOCK
    )
    :vars
    (
      ?auto_735702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_735700 ) ( ON ?auto_735701 ?auto_735702 ) ( CLEAR ?auto_735701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_735688 ) ( ON ?auto_735689 ?auto_735688 ) ( ON ?auto_735690 ?auto_735689 ) ( ON ?auto_735691 ?auto_735690 ) ( ON ?auto_735692 ?auto_735691 ) ( ON ?auto_735693 ?auto_735692 ) ( ON ?auto_735694 ?auto_735693 ) ( ON ?auto_735695 ?auto_735694 ) ( ON ?auto_735696 ?auto_735695 ) ( ON ?auto_735697 ?auto_735696 ) ( ON ?auto_735698 ?auto_735697 ) ( ON ?auto_735699 ?auto_735698 ) ( ON ?auto_735700 ?auto_735699 ) ( not ( = ?auto_735688 ?auto_735689 ) ) ( not ( = ?auto_735688 ?auto_735690 ) ) ( not ( = ?auto_735688 ?auto_735691 ) ) ( not ( = ?auto_735688 ?auto_735692 ) ) ( not ( = ?auto_735688 ?auto_735693 ) ) ( not ( = ?auto_735688 ?auto_735694 ) ) ( not ( = ?auto_735688 ?auto_735695 ) ) ( not ( = ?auto_735688 ?auto_735696 ) ) ( not ( = ?auto_735688 ?auto_735697 ) ) ( not ( = ?auto_735688 ?auto_735698 ) ) ( not ( = ?auto_735688 ?auto_735699 ) ) ( not ( = ?auto_735688 ?auto_735700 ) ) ( not ( = ?auto_735688 ?auto_735701 ) ) ( not ( = ?auto_735688 ?auto_735702 ) ) ( not ( = ?auto_735689 ?auto_735690 ) ) ( not ( = ?auto_735689 ?auto_735691 ) ) ( not ( = ?auto_735689 ?auto_735692 ) ) ( not ( = ?auto_735689 ?auto_735693 ) ) ( not ( = ?auto_735689 ?auto_735694 ) ) ( not ( = ?auto_735689 ?auto_735695 ) ) ( not ( = ?auto_735689 ?auto_735696 ) ) ( not ( = ?auto_735689 ?auto_735697 ) ) ( not ( = ?auto_735689 ?auto_735698 ) ) ( not ( = ?auto_735689 ?auto_735699 ) ) ( not ( = ?auto_735689 ?auto_735700 ) ) ( not ( = ?auto_735689 ?auto_735701 ) ) ( not ( = ?auto_735689 ?auto_735702 ) ) ( not ( = ?auto_735690 ?auto_735691 ) ) ( not ( = ?auto_735690 ?auto_735692 ) ) ( not ( = ?auto_735690 ?auto_735693 ) ) ( not ( = ?auto_735690 ?auto_735694 ) ) ( not ( = ?auto_735690 ?auto_735695 ) ) ( not ( = ?auto_735690 ?auto_735696 ) ) ( not ( = ?auto_735690 ?auto_735697 ) ) ( not ( = ?auto_735690 ?auto_735698 ) ) ( not ( = ?auto_735690 ?auto_735699 ) ) ( not ( = ?auto_735690 ?auto_735700 ) ) ( not ( = ?auto_735690 ?auto_735701 ) ) ( not ( = ?auto_735690 ?auto_735702 ) ) ( not ( = ?auto_735691 ?auto_735692 ) ) ( not ( = ?auto_735691 ?auto_735693 ) ) ( not ( = ?auto_735691 ?auto_735694 ) ) ( not ( = ?auto_735691 ?auto_735695 ) ) ( not ( = ?auto_735691 ?auto_735696 ) ) ( not ( = ?auto_735691 ?auto_735697 ) ) ( not ( = ?auto_735691 ?auto_735698 ) ) ( not ( = ?auto_735691 ?auto_735699 ) ) ( not ( = ?auto_735691 ?auto_735700 ) ) ( not ( = ?auto_735691 ?auto_735701 ) ) ( not ( = ?auto_735691 ?auto_735702 ) ) ( not ( = ?auto_735692 ?auto_735693 ) ) ( not ( = ?auto_735692 ?auto_735694 ) ) ( not ( = ?auto_735692 ?auto_735695 ) ) ( not ( = ?auto_735692 ?auto_735696 ) ) ( not ( = ?auto_735692 ?auto_735697 ) ) ( not ( = ?auto_735692 ?auto_735698 ) ) ( not ( = ?auto_735692 ?auto_735699 ) ) ( not ( = ?auto_735692 ?auto_735700 ) ) ( not ( = ?auto_735692 ?auto_735701 ) ) ( not ( = ?auto_735692 ?auto_735702 ) ) ( not ( = ?auto_735693 ?auto_735694 ) ) ( not ( = ?auto_735693 ?auto_735695 ) ) ( not ( = ?auto_735693 ?auto_735696 ) ) ( not ( = ?auto_735693 ?auto_735697 ) ) ( not ( = ?auto_735693 ?auto_735698 ) ) ( not ( = ?auto_735693 ?auto_735699 ) ) ( not ( = ?auto_735693 ?auto_735700 ) ) ( not ( = ?auto_735693 ?auto_735701 ) ) ( not ( = ?auto_735693 ?auto_735702 ) ) ( not ( = ?auto_735694 ?auto_735695 ) ) ( not ( = ?auto_735694 ?auto_735696 ) ) ( not ( = ?auto_735694 ?auto_735697 ) ) ( not ( = ?auto_735694 ?auto_735698 ) ) ( not ( = ?auto_735694 ?auto_735699 ) ) ( not ( = ?auto_735694 ?auto_735700 ) ) ( not ( = ?auto_735694 ?auto_735701 ) ) ( not ( = ?auto_735694 ?auto_735702 ) ) ( not ( = ?auto_735695 ?auto_735696 ) ) ( not ( = ?auto_735695 ?auto_735697 ) ) ( not ( = ?auto_735695 ?auto_735698 ) ) ( not ( = ?auto_735695 ?auto_735699 ) ) ( not ( = ?auto_735695 ?auto_735700 ) ) ( not ( = ?auto_735695 ?auto_735701 ) ) ( not ( = ?auto_735695 ?auto_735702 ) ) ( not ( = ?auto_735696 ?auto_735697 ) ) ( not ( = ?auto_735696 ?auto_735698 ) ) ( not ( = ?auto_735696 ?auto_735699 ) ) ( not ( = ?auto_735696 ?auto_735700 ) ) ( not ( = ?auto_735696 ?auto_735701 ) ) ( not ( = ?auto_735696 ?auto_735702 ) ) ( not ( = ?auto_735697 ?auto_735698 ) ) ( not ( = ?auto_735697 ?auto_735699 ) ) ( not ( = ?auto_735697 ?auto_735700 ) ) ( not ( = ?auto_735697 ?auto_735701 ) ) ( not ( = ?auto_735697 ?auto_735702 ) ) ( not ( = ?auto_735698 ?auto_735699 ) ) ( not ( = ?auto_735698 ?auto_735700 ) ) ( not ( = ?auto_735698 ?auto_735701 ) ) ( not ( = ?auto_735698 ?auto_735702 ) ) ( not ( = ?auto_735699 ?auto_735700 ) ) ( not ( = ?auto_735699 ?auto_735701 ) ) ( not ( = ?auto_735699 ?auto_735702 ) ) ( not ( = ?auto_735700 ?auto_735701 ) ) ( not ( = ?auto_735700 ?auto_735702 ) ) ( not ( = ?auto_735701 ?auto_735702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_735701 ?auto_735702 )
      ( !STACK ?auto_735701 ?auto_735700 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_735746 - BLOCK
      ?auto_735747 - BLOCK
      ?auto_735748 - BLOCK
      ?auto_735749 - BLOCK
      ?auto_735750 - BLOCK
      ?auto_735751 - BLOCK
      ?auto_735752 - BLOCK
      ?auto_735753 - BLOCK
      ?auto_735754 - BLOCK
      ?auto_735755 - BLOCK
      ?auto_735756 - BLOCK
      ?auto_735757 - BLOCK
      ?auto_735758 - BLOCK
      ?auto_735759 - BLOCK
    )
    :vars
    (
      ?auto_735760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735759 ?auto_735760 ) ( ON-TABLE ?auto_735746 ) ( ON ?auto_735747 ?auto_735746 ) ( ON ?auto_735748 ?auto_735747 ) ( ON ?auto_735749 ?auto_735748 ) ( ON ?auto_735750 ?auto_735749 ) ( ON ?auto_735751 ?auto_735750 ) ( ON ?auto_735752 ?auto_735751 ) ( ON ?auto_735753 ?auto_735752 ) ( ON ?auto_735754 ?auto_735753 ) ( ON ?auto_735755 ?auto_735754 ) ( ON ?auto_735756 ?auto_735755 ) ( ON ?auto_735757 ?auto_735756 ) ( not ( = ?auto_735746 ?auto_735747 ) ) ( not ( = ?auto_735746 ?auto_735748 ) ) ( not ( = ?auto_735746 ?auto_735749 ) ) ( not ( = ?auto_735746 ?auto_735750 ) ) ( not ( = ?auto_735746 ?auto_735751 ) ) ( not ( = ?auto_735746 ?auto_735752 ) ) ( not ( = ?auto_735746 ?auto_735753 ) ) ( not ( = ?auto_735746 ?auto_735754 ) ) ( not ( = ?auto_735746 ?auto_735755 ) ) ( not ( = ?auto_735746 ?auto_735756 ) ) ( not ( = ?auto_735746 ?auto_735757 ) ) ( not ( = ?auto_735746 ?auto_735758 ) ) ( not ( = ?auto_735746 ?auto_735759 ) ) ( not ( = ?auto_735746 ?auto_735760 ) ) ( not ( = ?auto_735747 ?auto_735748 ) ) ( not ( = ?auto_735747 ?auto_735749 ) ) ( not ( = ?auto_735747 ?auto_735750 ) ) ( not ( = ?auto_735747 ?auto_735751 ) ) ( not ( = ?auto_735747 ?auto_735752 ) ) ( not ( = ?auto_735747 ?auto_735753 ) ) ( not ( = ?auto_735747 ?auto_735754 ) ) ( not ( = ?auto_735747 ?auto_735755 ) ) ( not ( = ?auto_735747 ?auto_735756 ) ) ( not ( = ?auto_735747 ?auto_735757 ) ) ( not ( = ?auto_735747 ?auto_735758 ) ) ( not ( = ?auto_735747 ?auto_735759 ) ) ( not ( = ?auto_735747 ?auto_735760 ) ) ( not ( = ?auto_735748 ?auto_735749 ) ) ( not ( = ?auto_735748 ?auto_735750 ) ) ( not ( = ?auto_735748 ?auto_735751 ) ) ( not ( = ?auto_735748 ?auto_735752 ) ) ( not ( = ?auto_735748 ?auto_735753 ) ) ( not ( = ?auto_735748 ?auto_735754 ) ) ( not ( = ?auto_735748 ?auto_735755 ) ) ( not ( = ?auto_735748 ?auto_735756 ) ) ( not ( = ?auto_735748 ?auto_735757 ) ) ( not ( = ?auto_735748 ?auto_735758 ) ) ( not ( = ?auto_735748 ?auto_735759 ) ) ( not ( = ?auto_735748 ?auto_735760 ) ) ( not ( = ?auto_735749 ?auto_735750 ) ) ( not ( = ?auto_735749 ?auto_735751 ) ) ( not ( = ?auto_735749 ?auto_735752 ) ) ( not ( = ?auto_735749 ?auto_735753 ) ) ( not ( = ?auto_735749 ?auto_735754 ) ) ( not ( = ?auto_735749 ?auto_735755 ) ) ( not ( = ?auto_735749 ?auto_735756 ) ) ( not ( = ?auto_735749 ?auto_735757 ) ) ( not ( = ?auto_735749 ?auto_735758 ) ) ( not ( = ?auto_735749 ?auto_735759 ) ) ( not ( = ?auto_735749 ?auto_735760 ) ) ( not ( = ?auto_735750 ?auto_735751 ) ) ( not ( = ?auto_735750 ?auto_735752 ) ) ( not ( = ?auto_735750 ?auto_735753 ) ) ( not ( = ?auto_735750 ?auto_735754 ) ) ( not ( = ?auto_735750 ?auto_735755 ) ) ( not ( = ?auto_735750 ?auto_735756 ) ) ( not ( = ?auto_735750 ?auto_735757 ) ) ( not ( = ?auto_735750 ?auto_735758 ) ) ( not ( = ?auto_735750 ?auto_735759 ) ) ( not ( = ?auto_735750 ?auto_735760 ) ) ( not ( = ?auto_735751 ?auto_735752 ) ) ( not ( = ?auto_735751 ?auto_735753 ) ) ( not ( = ?auto_735751 ?auto_735754 ) ) ( not ( = ?auto_735751 ?auto_735755 ) ) ( not ( = ?auto_735751 ?auto_735756 ) ) ( not ( = ?auto_735751 ?auto_735757 ) ) ( not ( = ?auto_735751 ?auto_735758 ) ) ( not ( = ?auto_735751 ?auto_735759 ) ) ( not ( = ?auto_735751 ?auto_735760 ) ) ( not ( = ?auto_735752 ?auto_735753 ) ) ( not ( = ?auto_735752 ?auto_735754 ) ) ( not ( = ?auto_735752 ?auto_735755 ) ) ( not ( = ?auto_735752 ?auto_735756 ) ) ( not ( = ?auto_735752 ?auto_735757 ) ) ( not ( = ?auto_735752 ?auto_735758 ) ) ( not ( = ?auto_735752 ?auto_735759 ) ) ( not ( = ?auto_735752 ?auto_735760 ) ) ( not ( = ?auto_735753 ?auto_735754 ) ) ( not ( = ?auto_735753 ?auto_735755 ) ) ( not ( = ?auto_735753 ?auto_735756 ) ) ( not ( = ?auto_735753 ?auto_735757 ) ) ( not ( = ?auto_735753 ?auto_735758 ) ) ( not ( = ?auto_735753 ?auto_735759 ) ) ( not ( = ?auto_735753 ?auto_735760 ) ) ( not ( = ?auto_735754 ?auto_735755 ) ) ( not ( = ?auto_735754 ?auto_735756 ) ) ( not ( = ?auto_735754 ?auto_735757 ) ) ( not ( = ?auto_735754 ?auto_735758 ) ) ( not ( = ?auto_735754 ?auto_735759 ) ) ( not ( = ?auto_735754 ?auto_735760 ) ) ( not ( = ?auto_735755 ?auto_735756 ) ) ( not ( = ?auto_735755 ?auto_735757 ) ) ( not ( = ?auto_735755 ?auto_735758 ) ) ( not ( = ?auto_735755 ?auto_735759 ) ) ( not ( = ?auto_735755 ?auto_735760 ) ) ( not ( = ?auto_735756 ?auto_735757 ) ) ( not ( = ?auto_735756 ?auto_735758 ) ) ( not ( = ?auto_735756 ?auto_735759 ) ) ( not ( = ?auto_735756 ?auto_735760 ) ) ( not ( = ?auto_735757 ?auto_735758 ) ) ( not ( = ?auto_735757 ?auto_735759 ) ) ( not ( = ?auto_735757 ?auto_735760 ) ) ( not ( = ?auto_735758 ?auto_735759 ) ) ( not ( = ?auto_735758 ?auto_735760 ) ) ( not ( = ?auto_735759 ?auto_735760 ) ) ( CLEAR ?auto_735757 ) ( ON ?auto_735758 ?auto_735759 ) ( CLEAR ?auto_735758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_735746 ?auto_735747 ?auto_735748 ?auto_735749 ?auto_735750 ?auto_735751 ?auto_735752 ?auto_735753 ?auto_735754 ?auto_735755 ?auto_735756 ?auto_735757 ?auto_735758 )
      ( MAKE-14PILE ?auto_735746 ?auto_735747 ?auto_735748 ?auto_735749 ?auto_735750 ?auto_735751 ?auto_735752 ?auto_735753 ?auto_735754 ?auto_735755 ?auto_735756 ?auto_735757 ?auto_735758 ?auto_735759 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_735804 - BLOCK
      ?auto_735805 - BLOCK
      ?auto_735806 - BLOCK
      ?auto_735807 - BLOCK
      ?auto_735808 - BLOCK
      ?auto_735809 - BLOCK
      ?auto_735810 - BLOCK
      ?auto_735811 - BLOCK
      ?auto_735812 - BLOCK
      ?auto_735813 - BLOCK
      ?auto_735814 - BLOCK
      ?auto_735815 - BLOCK
      ?auto_735816 - BLOCK
      ?auto_735817 - BLOCK
    )
    :vars
    (
      ?auto_735818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735817 ?auto_735818 ) ( ON-TABLE ?auto_735804 ) ( ON ?auto_735805 ?auto_735804 ) ( ON ?auto_735806 ?auto_735805 ) ( ON ?auto_735807 ?auto_735806 ) ( ON ?auto_735808 ?auto_735807 ) ( ON ?auto_735809 ?auto_735808 ) ( ON ?auto_735810 ?auto_735809 ) ( ON ?auto_735811 ?auto_735810 ) ( ON ?auto_735812 ?auto_735811 ) ( ON ?auto_735813 ?auto_735812 ) ( ON ?auto_735814 ?auto_735813 ) ( not ( = ?auto_735804 ?auto_735805 ) ) ( not ( = ?auto_735804 ?auto_735806 ) ) ( not ( = ?auto_735804 ?auto_735807 ) ) ( not ( = ?auto_735804 ?auto_735808 ) ) ( not ( = ?auto_735804 ?auto_735809 ) ) ( not ( = ?auto_735804 ?auto_735810 ) ) ( not ( = ?auto_735804 ?auto_735811 ) ) ( not ( = ?auto_735804 ?auto_735812 ) ) ( not ( = ?auto_735804 ?auto_735813 ) ) ( not ( = ?auto_735804 ?auto_735814 ) ) ( not ( = ?auto_735804 ?auto_735815 ) ) ( not ( = ?auto_735804 ?auto_735816 ) ) ( not ( = ?auto_735804 ?auto_735817 ) ) ( not ( = ?auto_735804 ?auto_735818 ) ) ( not ( = ?auto_735805 ?auto_735806 ) ) ( not ( = ?auto_735805 ?auto_735807 ) ) ( not ( = ?auto_735805 ?auto_735808 ) ) ( not ( = ?auto_735805 ?auto_735809 ) ) ( not ( = ?auto_735805 ?auto_735810 ) ) ( not ( = ?auto_735805 ?auto_735811 ) ) ( not ( = ?auto_735805 ?auto_735812 ) ) ( not ( = ?auto_735805 ?auto_735813 ) ) ( not ( = ?auto_735805 ?auto_735814 ) ) ( not ( = ?auto_735805 ?auto_735815 ) ) ( not ( = ?auto_735805 ?auto_735816 ) ) ( not ( = ?auto_735805 ?auto_735817 ) ) ( not ( = ?auto_735805 ?auto_735818 ) ) ( not ( = ?auto_735806 ?auto_735807 ) ) ( not ( = ?auto_735806 ?auto_735808 ) ) ( not ( = ?auto_735806 ?auto_735809 ) ) ( not ( = ?auto_735806 ?auto_735810 ) ) ( not ( = ?auto_735806 ?auto_735811 ) ) ( not ( = ?auto_735806 ?auto_735812 ) ) ( not ( = ?auto_735806 ?auto_735813 ) ) ( not ( = ?auto_735806 ?auto_735814 ) ) ( not ( = ?auto_735806 ?auto_735815 ) ) ( not ( = ?auto_735806 ?auto_735816 ) ) ( not ( = ?auto_735806 ?auto_735817 ) ) ( not ( = ?auto_735806 ?auto_735818 ) ) ( not ( = ?auto_735807 ?auto_735808 ) ) ( not ( = ?auto_735807 ?auto_735809 ) ) ( not ( = ?auto_735807 ?auto_735810 ) ) ( not ( = ?auto_735807 ?auto_735811 ) ) ( not ( = ?auto_735807 ?auto_735812 ) ) ( not ( = ?auto_735807 ?auto_735813 ) ) ( not ( = ?auto_735807 ?auto_735814 ) ) ( not ( = ?auto_735807 ?auto_735815 ) ) ( not ( = ?auto_735807 ?auto_735816 ) ) ( not ( = ?auto_735807 ?auto_735817 ) ) ( not ( = ?auto_735807 ?auto_735818 ) ) ( not ( = ?auto_735808 ?auto_735809 ) ) ( not ( = ?auto_735808 ?auto_735810 ) ) ( not ( = ?auto_735808 ?auto_735811 ) ) ( not ( = ?auto_735808 ?auto_735812 ) ) ( not ( = ?auto_735808 ?auto_735813 ) ) ( not ( = ?auto_735808 ?auto_735814 ) ) ( not ( = ?auto_735808 ?auto_735815 ) ) ( not ( = ?auto_735808 ?auto_735816 ) ) ( not ( = ?auto_735808 ?auto_735817 ) ) ( not ( = ?auto_735808 ?auto_735818 ) ) ( not ( = ?auto_735809 ?auto_735810 ) ) ( not ( = ?auto_735809 ?auto_735811 ) ) ( not ( = ?auto_735809 ?auto_735812 ) ) ( not ( = ?auto_735809 ?auto_735813 ) ) ( not ( = ?auto_735809 ?auto_735814 ) ) ( not ( = ?auto_735809 ?auto_735815 ) ) ( not ( = ?auto_735809 ?auto_735816 ) ) ( not ( = ?auto_735809 ?auto_735817 ) ) ( not ( = ?auto_735809 ?auto_735818 ) ) ( not ( = ?auto_735810 ?auto_735811 ) ) ( not ( = ?auto_735810 ?auto_735812 ) ) ( not ( = ?auto_735810 ?auto_735813 ) ) ( not ( = ?auto_735810 ?auto_735814 ) ) ( not ( = ?auto_735810 ?auto_735815 ) ) ( not ( = ?auto_735810 ?auto_735816 ) ) ( not ( = ?auto_735810 ?auto_735817 ) ) ( not ( = ?auto_735810 ?auto_735818 ) ) ( not ( = ?auto_735811 ?auto_735812 ) ) ( not ( = ?auto_735811 ?auto_735813 ) ) ( not ( = ?auto_735811 ?auto_735814 ) ) ( not ( = ?auto_735811 ?auto_735815 ) ) ( not ( = ?auto_735811 ?auto_735816 ) ) ( not ( = ?auto_735811 ?auto_735817 ) ) ( not ( = ?auto_735811 ?auto_735818 ) ) ( not ( = ?auto_735812 ?auto_735813 ) ) ( not ( = ?auto_735812 ?auto_735814 ) ) ( not ( = ?auto_735812 ?auto_735815 ) ) ( not ( = ?auto_735812 ?auto_735816 ) ) ( not ( = ?auto_735812 ?auto_735817 ) ) ( not ( = ?auto_735812 ?auto_735818 ) ) ( not ( = ?auto_735813 ?auto_735814 ) ) ( not ( = ?auto_735813 ?auto_735815 ) ) ( not ( = ?auto_735813 ?auto_735816 ) ) ( not ( = ?auto_735813 ?auto_735817 ) ) ( not ( = ?auto_735813 ?auto_735818 ) ) ( not ( = ?auto_735814 ?auto_735815 ) ) ( not ( = ?auto_735814 ?auto_735816 ) ) ( not ( = ?auto_735814 ?auto_735817 ) ) ( not ( = ?auto_735814 ?auto_735818 ) ) ( not ( = ?auto_735815 ?auto_735816 ) ) ( not ( = ?auto_735815 ?auto_735817 ) ) ( not ( = ?auto_735815 ?auto_735818 ) ) ( not ( = ?auto_735816 ?auto_735817 ) ) ( not ( = ?auto_735816 ?auto_735818 ) ) ( not ( = ?auto_735817 ?auto_735818 ) ) ( ON ?auto_735816 ?auto_735817 ) ( CLEAR ?auto_735814 ) ( ON ?auto_735815 ?auto_735816 ) ( CLEAR ?auto_735815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_735804 ?auto_735805 ?auto_735806 ?auto_735807 ?auto_735808 ?auto_735809 ?auto_735810 ?auto_735811 ?auto_735812 ?auto_735813 ?auto_735814 ?auto_735815 )
      ( MAKE-14PILE ?auto_735804 ?auto_735805 ?auto_735806 ?auto_735807 ?auto_735808 ?auto_735809 ?auto_735810 ?auto_735811 ?auto_735812 ?auto_735813 ?auto_735814 ?auto_735815 ?auto_735816 ?auto_735817 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_735862 - BLOCK
      ?auto_735863 - BLOCK
      ?auto_735864 - BLOCK
      ?auto_735865 - BLOCK
      ?auto_735866 - BLOCK
      ?auto_735867 - BLOCK
      ?auto_735868 - BLOCK
      ?auto_735869 - BLOCK
      ?auto_735870 - BLOCK
      ?auto_735871 - BLOCK
      ?auto_735872 - BLOCK
      ?auto_735873 - BLOCK
      ?auto_735874 - BLOCK
      ?auto_735875 - BLOCK
    )
    :vars
    (
      ?auto_735876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735875 ?auto_735876 ) ( ON-TABLE ?auto_735862 ) ( ON ?auto_735863 ?auto_735862 ) ( ON ?auto_735864 ?auto_735863 ) ( ON ?auto_735865 ?auto_735864 ) ( ON ?auto_735866 ?auto_735865 ) ( ON ?auto_735867 ?auto_735866 ) ( ON ?auto_735868 ?auto_735867 ) ( ON ?auto_735869 ?auto_735868 ) ( ON ?auto_735870 ?auto_735869 ) ( ON ?auto_735871 ?auto_735870 ) ( not ( = ?auto_735862 ?auto_735863 ) ) ( not ( = ?auto_735862 ?auto_735864 ) ) ( not ( = ?auto_735862 ?auto_735865 ) ) ( not ( = ?auto_735862 ?auto_735866 ) ) ( not ( = ?auto_735862 ?auto_735867 ) ) ( not ( = ?auto_735862 ?auto_735868 ) ) ( not ( = ?auto_735862 ?auto_735869 ) ) ( not ( = ?auto_735862 ?auto_735870 ) ) ( not ( = ?auto_735862 ?auto_735871 ) ) ( not ( = ?auto_735862 ?auto_735872 ) ) ( not ( = ?auto_735862 ?auto_735873 ) ) ( not ( = ?auto_735862 ?auto_735874 ) ) ( not ( = ?auto_735862 ?auto_735875 ) ) ( not ( = ?auto_735862 ?auto_735876 ) ) ( not ( = ?auto_735863 ?auto_735864 ) ) ( not ( = ?auto_735863 ?auto_735865 ) ) ( not ( = ?auto_735863 ?auto_735866 ) ) ( not ( = ?auto_735863 ?auto_735867 ) ) ( not ( = ?auto_735863 ?auto_735868 ) ) ( not ( = ?auto_735863 ?auto_735869 ) ) ( not ( = ?auto_735863 ?auto_735870 ) ) ( not ( = ?auto_735863 ?auto_735871 ) ) ( not ( = ?auto_735863 ?auto_735872 ) ) ( not ( = ?auto_735863 ?auto_735873 ) ) ( not ( = ?auto_735863 ?auto_735874 ) ) ( not ( = ?auto_735863 ?auto_735875 ) ) ( not ( = ?auto_735863 ?auto_735876 ) ) ( not ( = ?auto_735864 ?auto_735865 ) ) ( not ( = ?auto_735864 ?auto_735866 ) ) ( not ( = ?auto_735864 ?auto_735867 ) ) ( not ( = ?auto_735864 ?auto_735868 ) ) ( not ( = ?auto_735864 ?auto_735869 ) ) ( not ( = ?auto_735864 ?auto_735870 ) ) ( not ( = ?auto_735864 ?auto_735871 ) ) ( not ( = ?auto_735864 ?auto_735872 ) ) ( not ( = ?auto_735864 ?auto_735873 ) ) ( not ( = ?auto_735864 ?auto_735874 ) ) ( not ( = ?auto_735864 ?auto_735875 ) ) ( not ( = ?auto_735864 ?auto_735876 ) ) ( not ( = ?auto_735865 ?auto_735866 ) ) ( not ( = ?auto_735865 ?auto_735867 ) ) ( not ( = ?auto_735865 ?auto_735868 ) ) ( not ( = ?auto_735865 ?auto_735869 ) ) ( not ( = ?auto_735865 ?auto_735870 ) ) ( not ( = ?auto_735865 ?auto_735871 ) ) ( not ( = ?auto_735865 ?auto_735872 ) ) ( not ( = ?auto_735865 ?auto_735873 ) ) ( not ( = ?auto_735865 ?auto_735874 ) ) ( not ( = ?auto_735865 ?auto_735875 ) ) ( not ( = ?auto_735865 ?auto_735876 ) ) ( not ( = ?auto_735866 ?auto_735867 ) ) ( not ( = ?auto_735866 ?auto_735868 ) ) ( not ( = ?auto_735866 ?auto_735869 ) ) ( not ( = ?auto_735866 ?auto_735870 ) ) ( not ( = ?auto_735866 ?auto_735871 ) ) ( not ( = ?auto_735866 ?auto_735872 ) ) ( not ( = ?auto_735866 ?auto_735873 ) ) ( not ( = ?auto_735866 ?auto_735874 ) ) ( not ( = ?auto_735866 ?auto_735875 ) ) ( not ( = ?auto_735866 ?auto_735876 ) ) ( not ( = ?auto_735867 ?auto_735868 ) ) ( not ( = ?auto_735867 ?auto_735869 ) ) ( not ( = ?auto_735867 ?auto_735870 ) ) ( not ( = ?auto_735867 ?auto_735871 ) ) ( not ( = ?auto_735867 ?auto_735872 ) ) ( not ( = ?auto_735867 ?auto_735873 ) ) ( not ( = ?auto_735867 ?auto_735874 ) ) ( not ( = ?auto_735867 ?auto_735875 ) ) ( not ( = ?auto_735867 ?auto_735876 ) ) ( not ( = ?auto_735868 ?auto_735869 ) ) ( not ( = ?auto_735868 ?auto_735870 ) ) ( not ( = ?auto_735868 ?auto_735871 ) ) ( not ( = ?auto_735868 ?auto_735872 ) ) ( not ( = ?auto_735868 ?auto_735873 ) ) ( not ( = ?auto_735868 ?auto_735874 ) ) ( not ( = ?auto_735868 ?auto_735875 ) ) ( not ( = ?auto_735868 ?auto_735876 ) ) ( not ( = ?auto_735869 ?auto_735870 ) ) ( not ( = ?auto_735869 ?auto_735871 ) ) ( not ( = ?auto_735869 ?auto_735872 ) ) ( not ( = ?auto_735869 ?auto_735873 ) ) ( not ( = ?auto_735869 ?auto_735874 ) ) ( not ( = ?auto_735869 ?auto_735875 ) ) ( not ( = ?auto_735869 ?auto_735876 ) ) ( not ( = ?auto_735870 ?auto_735871 ) ) ( not ( = ?auto_735870 ?auto_735872 ) ) ( not ( = ?auto_735870 ?auto_735873 ) ) ( not ( = ?auto_735870 ?auto_735874 ) ) ( not ( = ?auto_735870 ?auto_735875 ) ) ( not ( = ?auto_735870 ?auto_735876 ) ) ( not ( = ?auto_735871 ?auto_735872 ) ) ( not ( = ?auto_735871 ?auto_735873 ) ) ( not ( = ?auto_735871 ?auto_735874 ) ) ( not ( = ?auto_735871 ?auto_735875 ) ) ( not ( = ?auto_735871 ?auto_735876 ) ) ( not ( = ?auto_735872 ?auto_735873 ) ) ( not ( = ?auto_735872 ?auto_735874 ) ) ( not ( = ?auto_735872 ?auto_735875 ) ) ( not ( = ?auto_735872 ?auto_735876 ) ) ( not ( = ?auto_735873 ?auto_735874 ) ) ( not ( = ?auto_735873 ?auto_735875 ) ) ( not ( = ?auto_735873 ?auto_735876 ) ) ( not ( = ?auto_735874 ?auto_735875 ) ) ( not ( = ?auto_735874 ?auto_735876 ) ) ( not ( = ?auto_735875 ?auto_735876 ) ) ( ON ?auto_735874 ?auto_735875 ) ( ON ?auto_735873 ?auto_735874 ) ( CLEAR ?auto_735871 ) ( ON ?auto_735872 ?auto_735873 ) ( CLEAR ?auto_735872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_735862 ?auto_735863 ?auto_735864 ?auto_735865 ?auto_735866 ?auto_735867 ?auto_735868 ?auto_735869 ?auto_735870 ?auto_735871 ?auto_735872 )
      ( MAKE-14PILE ?auto_735862 ?auto_735863 ?auto_735864 ?auto_735865 ?auto_735866 ?auto_735867 ?auto_735868 ?auto_735869 ?auto_735870 ?auto_735871 ?auto_735872 ?auto_735873 ?auto_735874 ?auto_735875 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_735920 - BLOCK
      ?auto_735921 - BLOCK
      ?auto_735922 - BLOCK
      ?auto_735923 - BLOCK
      ?auto_735924 - BLOCK
      ?auto_735925 - BLOCK
      ?auto_735926 - BLOCK
      ?auto_735927 - BLOCK
      ?auto_735928 - BLOCK
      ?auto_735929 - BLOCK
      ?auto_735930 - BLOCK
      ?auto_735931 - BLOCK
      ?auto_735932 - BLOCK
      ?auto_735933 - BLOCK
    )
    :vars
    (
      ?auto_735934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735933 ?auto_735934 ) ( ON-TABLE ?auto_735920 ) ( ON ?auto_735921 ?auto_735920 ) ( ON ?auto_735922 ?auto_735921 ) ( ON ?auto_735923 ?auto_735922 ) ( ON ?auto_735924 ?auto_735923 ) ( ON ?auto_735925 ?auto_735924 ) ( ON ?auto_735926 ?auto_735925 ) ( ON ?auto_735927 ?auto_735926 ) ( ON ?auto_735928 ?auto_735927 ) ( not ( = ?auto_735920 ?auto_735921 ) ) ( not ( = ?auto_735920 ?auto_735922 ) ) ( not ( = ?auto_735920 ?auto_735923 ) ) ( not ( = ?auto_735920 ?auto_735924 ) ) ( not ( = ?auto_735920 ?auto_735925 ) ) ( not ( = ?auto_735920 ?auto_735926 ) ) ( not ( = ?auto_735920 ?auto_735927 ) ) ( not ( = ?auto_735920 ?auto_735928 ) ) ( not ( = ?auto_735920 ?auto_735929 ) ) ( not ( = ?auto_735920 ?auto_735930 ) ) ( not ( = ?auto_735920 ?auto_735931 ) ) ( not ( = ?auto_735920 ?auto_735932 ) ) ( not ( = ?auto_735920 ?auto_735933 ) ) ( not ( = ?auto_735920 ?auto_735934 ) ) ( not ( = ?auto_735921 ?auto_735922 ) ) ( not ( = ?auto_735921 ?auto_735923 ) ) ( not ( = ?auto_735921 ?auto_735924 ) ) ( not ( = ?auto_735921 ?auto_735925 ) ) ( not ( = ?auto_735921 ?auto_735926 ) ) ( not ( = ?auto_735921 ?auto_735927 ) ) ( not ( = ?auto_735921 ?auto_735928 ) ) ( not ( = ?auto_735921 ?auto_735929 ) ) ( not ( = ?auto_735921 ?auto_735930 ) ) ( not ( = ?auto_735921 ?auto_735931 ) ) ( not ( = ?auto_735921 ?auto_735932 ) ) ( not ( = ?auto_735921 ?auto_735933 ) ) ( not ( = ?auto_735921 ?auto_735934 ) ) ( not ( = ?auto_735922 ?auto_735923 ) ) ( not ( = ?auto_735922 ?auto_735924 ) ) ( not ( = ?auto_735922 ?auto_735925 ) ) ( not ( = ?auto_735922 ?auto_735926 ) ) ( not ( = ?auto_735922 ?auto_735927 ) ) ( not ( = ?auto_735922 ?auto_735928 ) ) ( not ( = ?auto_735922 ?auto_735929 ) ) ( not ( = ?auto_735922 ?auto_735930 ) ) ( not ( = ?auto_735922 ?auto_735931 ) ) ( not ( = ?auto_735922 ?auto_735932 ) ) ( not ( = ?auto_735922 ?auto_735933 ) ) ( not ( = ?auto_735922 ?auto_735934 ) ) ( not ( = ?auto_735923 ?auto_735924 ) ) ( not ( = ?auto_735923 ?auto_735925 ) ) ( not ( = ?auto_735923 ?auto_735926 ) ) ( not ( = ?auto_735923 ?auto_735927 ) ) ( not ( = ?auto_735923 ?auto_735928 ) ) ( not ( = ?auto_735923 ?auto_735929 ) ) ( not ( = ?auto_735923 ?auto_735930 ) ) ( not ( = ?auto_735923 ?auto_735931 ) ) ( not ( = ?auto_735923 ?auto_735932 ) ) ( not ( = ?auto_735923 ?auto_735933 ) ) ( not ( = ?auto_735923 ?auto_735934 ) ) ( not ( = ?auto_735924 ?auto_735925 ) ) ( not ( = ?auto_735924 ?auto_735926 ) ) ( not ( = ?auto_735924 ?auto_735927 ) ) ( not ( = ?auto_735924 ?auto_735928 ) ) ( not ( = ?auto_735924 ?auto_735929 ) ) ( not ( = ?auto_735924 ?auto_735930 ) ) ( not ( = ?auto_735924 ?auto_735931 ) ) ( not ( = ?auto_735924 ?auto_735932 ) ) ( not ( = ?auto_735924 ?auto_735933 ) ) ( not ( = ?auto_735924 ?auto_735934 ) ) ( not ( = ?auto_735925 ?auto_735926 ) ) ( not ( = ?auto_735925 ?auto_735927 ) ) ( not ( = ?auto_735925 ?auto_735928 ) ) ( not ( = ?auto_735925 ?auto_735929 ) ) ( not ( = ?auto_735925 ?auto_735930 ) ) ( not ( = ?auto_735925 ?auto_735931 ) ) ( not ( = ?auto_735925 ?auto_735932 ) ) ( not ( = ?auto_735925 ?auto_735933 ) ) ( not ( = ?auto_735925 ?auto_735934 ) ) ( not ( = ?auto_735926 ?auto_735927 ) ) ( not ( = ?auto_735926 ?auto_735928 ) ) ( not ( = ?auto_735926 ?auto_735929 ) ) ( not ( = ?auto_735926 ?auto_735930 ) ) ( not ( = ?auto_735926 ?auto_735931 ) ) ( not ( = ?auto_735926 ?auto_735932 ) ) ( not ( = ?auto_735926 ?auto_735933 ) ) ( not ( = ?auto_735926 ?auto_735934 ) ) ( not ( = ?auto_735927 ?auto_735928 ) ) ( not ( = ?auto_735927 ?auto_735929 ) ) ( not ( = ?auto_735927 ?auto_735930 ) ) ( not ( = ?auto_735927 ?auto_735931 ) ) ( not ( = ?auto_735927 ?auto_735932 ) ) ( not ( = ?auto_735927 ?auto_735933 ) ) ( not ( = ?auto_735927 ?auto_735934 ) ) ( not ( = ?auto_735928 ?auto_735929 ) ) ( not ( = ?auto_735928 ?auto_735930 ) ) ( not ( = ?auto_735928 ?auto_735931 ) ) ( not ( = ?auto_735928 ?auto_735932 ) ) ( not ( = ?auto_735928 ?auto_735933 ) ) ( not ( = ?auto_735928 ?auto_735934 ) ) ( not ( = ?auto_735929 ?auto_735930 ) ) ( not ( = ?auto_735929 ?auto_735931 ) ) ( not ( = ?auto_735929 ?auto_735932 ) ) ( not ( = ?auto_735929 ?auto_735933 ) ) ( not ( = ?auto_735929 ?auto_735934 ) ) ( not ( = ?auto_735930 ?auto_735931 ) ) ( not ( = ?auto_735930 ?auto_735932 ) ) ( not ( = ?auto_735930 ?auto_735933 ) ) ( not ( = ?auto_735930 ?auto_735934 ) ) ( not ( = ?auto_735931 ?auto_735932 ) ) ( not ( = ?auto_735931 ?auto_735933 ) ) ( not ( = ?auto_735931 ?auto_735934 ) ) ( not ( = ?auto_735932 ?auto_735933 ) ) ( not ( = ?auto_735932 ?auto_735934 ) ) ( not ( = ?auto_735933 ?auto_735934 ) ) ( ON ?auto_735932 ?auto_735933 ) ( ON ?auto_735931 ?auto_735932 ) ( ON ?auto_735930 ?auto_735931 ) ( CLEAR ?auto_735928 ) ( ON ?auto_735929 ?auto_735930 ) ( CLEAR ?auto_735929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_735920 ?auto_735921 ?auto_735922 ?auto_735923 ?auto_735924 ?auto_735925 ?auto_735926 ?auto_735927 ?auto_735928 ?auto_735929 )
      ( MAKE-14PILE ?auto_735920 ?auto_735921 ?auto_735922 ?auto_735923 ?auto_735924 ?auto_735925 ?auto_735926 ?auto_735927 ?auto_735928 ?auto_735929 ?auto_735930 ?auto_735931 ?auto_735932 ?auto_735933 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_735978 - BLOCK
      ?auto_735979 - BLOCK
      ?auto_735980 - BLOCK
      ?auto_735981 - BLOCK
      ?auto_735982 - BLOCK
      ?auto_735983 - BLOCK
      ?auto_735984 - BLOCK
      ?auto_735985 - BLOCK
      ?auto_735986 - BLOCK
      ?auto_735987 - BLOCK
      ?auto_735988 - BLOCK
      ?auto_735989 - BLOCK
      ?auto_735990 - BLOCK
      ?auto_735991 - BLOCK
    )
    :vars
    (
      ?auto_735992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_735991 ?auto_735992 ) ( ON-TABLE ?auto_735978 ) ( ON ?auto_735979 ?auto_735978 ) ( ON ?auto_735980 ?auto_735979 ) ( ON ?auto_735981 ?auto_735980 ) ( ON ?auto_735982 ?auto_735981 ) ( ON ?auto_735983 ?auto_735982 ) ( ON ?auto_735984 ?auto_735983 ) ( ON ?auto_735985 ?auto_735984 ) ( not ( = ?auto_735978 ?auto_735979 ) ) ( not ( = ?auto_735978 ?auto_735980 ) ) ( not ( = ?auto_735978 ?auto_735981 ) ) ( not ( = ?auto_735978 ?auto_735982 ) ) ( not ( = ?auto_735978 ?auto_735983 ) ) ( not ( = ?auto_735978 ?auto_735984 ) ) ( not ( = ?auto_735978 ?auto_735985 ) ) ( not ( = ?auto_735978 ?auto_735986 ) ) ( not ( = ?auto_735978 ?auto_735987 ) ) ( not ( = ?auto_735978 ?auto_735988 ) ) ( not ( = ?auto_735978 ?auto_735989 ) ) ( not ( = ?auto_735978 ?auto_735990 ) ) ( not ( = ?auto_735978 ?auto_735991 ) ) ( not ( = ?auto_735978 ?auto_735992 ) ) ( not ( = ?auto_735979 ?auto_735980 ) ) ( not ( = ?auto_735979 ?auto_735981 ) ) ( not ( = ?auto_735979 ?auto_735982 ) ) ( not ( = ?auto_735979 ?auto_735983 ) ) ( not ( = ?auto_735979 ?auto_735984 ) ) ( not ( = ?auto_735979 ?auto_735985 ) ) ( not ( = ?auto_735979 ?auto_735986 ) ) ( not ( = ?auto_735979 ?auto_735987 ) ) ( not ( = ?auto_735979 ?auto_735988 ) ) ( not ( = ?auto_735979 ?auto_735989 ) ) ( not ( = ?auto_735979 ?auto_735990 ) ) ( not ( = ?auto_735979 ?auto_735991 ) ) ( not ( = ?auto_735979 ?auto_735992 ) ) ( not ( = ?auto_735980 ?auto_735981 ) ) ( not ( = ?auto_735980 ?auto_735982 ) ) ( not ( = ?auto_735980 ?auto_735983 ) ) ( not ( = ?auto_735980 ?auto_735984 ) ) ( not ( = ?auto_735980 ?auto_735985 ) ) ( not ( = ?auto_735980 ?auto_735986 ) ) ( not ( = ?auto_735980 ?auto_735987 ) ) ( not ( = ?auto_735980 ?auto_735988 ) ) ( not ( = ?auto_735980 ?auto_735989 ) ) ( not ( = ?auto_735980 ?auto_735990 ) ) ( not ( = ?auto_735980 ?auto_735991 ) ) ( not ( = ?auto_735980 ?auto_735992 ) ) ( not ( = ?auto_735981 ?auto_735982 ) ) ( not ( = ?auto_735981 ?auto_735983 ) ) ( not ( = ?auto_735981 ?auto_735984 ) ) ( not ( = ?auto_735981 ?auto_735985 ) ) ( not ( = ?auto_735981 ?auto_735986 ) ) ( not ( = ?auto_735981 ?auto_735987 ) ) ( not ( = ?auto_735981 ?auto_735988 ) ) ( not ( = ?auto_735981 ?auto_735989 ) ) ( not ( = ?auto_735981 ?auto_735990 ) ) ( not ( = ?auto_735981 ?auto_735991 ) ) ( not ( = ?auto_735981 ?auto_735992 ) ) ( not ( = ?auto_735982 ?auto_735983 ) ) ( not ( = ?auto_735982 ?auto_735984 ) ) ( not ( = ?auto_735982 ?auto_735985 ) ) ( not ( = ?auto_735982 ?auto_735986 ) ) ( not ( = ?auto_735982 ?auto_735987 ) ) ( not ( = ?auto_735982 ?auto_735988 ) ) ( not ( = ?auto_735982 ?auto_735989 ) ) ( not ( = ?auto_735982 ?auto_735990 ) ) ( not ( = ?auto_735982 ?auto_735991 ) ) ( not ( = ?auto_735982 ?auto_735992 ) ) ( not ( = ?auto_735983 ?auto_735984 ) ) ( not ( = ?auto_735983 ?auto_735985 ) ) ( not ( = ?auto_735983 ?auto_735986 ) ) ( not ( = ?auto_735983 ?auto_735987 ) ) ( not ( = ?auto_735983 ?auto_735988 ) ) ( not ( = ?auto_735983 ?auto_735989 ) ) ( not ( = ?auto_735983 ?auto_735990 ) ) ( not ( = ?auto_735983 ?auto_735991 ) ) ( not ( = ?auto_735983 ?auto_735992 ) ) ( not ( = ?auto_735984 ?auto_735985 ) ) ( not ( = ?auto_735984 ?auto_735986 ) ) ( not ( = ?auto_735984 ?auto_735987 ) ) ( not ( = ?auto_735984 ?auto_735988 ) ) ( not ( = ?auto_735984 ?auto_735989 ) ) ( not ( = ?auto_735984 ?auto_735990 ) ) ( not ( = ?auto_735984 ?auto_735991 ) ) ( not ( = ?auto_735984 ?auto_735992 ) ) ( not ( = ?auto_735985 ?auto_735986 ) ) ( not ( = ?auto_735985 ?auto_735987 ) ) ( not ( = ?auto_735985 ?auto_735988 ) ) ( not ( = ?auto_735985 ?auto_735989 ) ) ( not ( = ?auto_735985 ?auto_735990 ) ) ( not ( = ?auto_735985 ?auto_735991 ) ) ( not ( = ?auto_735985 ?auto_735992 ) ) ( not ( = ?auto_735986 ?auto_735987 ) ) ( not ( = ?auto_735986 ?auto_735988 ) ) ( not ( = ?auto_735986 ?auto_735989 ) ) ( not ( = ?auto_735986 ?auto_735990 ) ) ( not ( = ?auto_735986 ?auto_735991 ) ) ( not ( = ?auto_735986 ?auto_735992 ) ) ( not ( = ?auto_735987 ?auto_735988 ) ) ( not ( = ?auto_735987 ?auto_735989 ) ) ( not ( = ?auto_735987 ?auto_735990 ) ) ( not ( = ?auto_735987 ?auto_735991 ) ) ( not ( = ?auto_735987 ?auto_735992 ) ) ( not ( = ?auto_735988 ?auto_735989 ) ) ( not ( = ?auto_735988 ?auto_735990 ) ) ( not ( = ?auto_735988 ?auto_735991 ) ) ( not ( = ?auto_735988 ?auto_735992 ) ) ( not ( = ?auto_735989 ?auto_735990 ) ) ( not ( = ?auto_735989 ?auto_735991 ) ) ( not ( = ?auto_735989 ?auto_735992 ) ) ( not ( = ?auto_735990 ?auto_735991 ) ) ( not ( = ?auto_735990 ?auto_735992 ) ) ( not ( = ?auto_735991 ?auto_735992 ) ) ( ON ?auto_735990 ?auto_735991 ) ( ON ?auto_735989 ?auto_735990 ) ( ON ?auto_735988 ?auto_735989 ) ( ON ?auto_735987 ?auto_735988 ) ( CLEAR ?auto_735985 ) ( ON ?auto_735986 ?auto_735987 ) ( CLEAR ?auto_735986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_735978 ?auto_735979 ?auto_735980 ?auto_735981 ?auto_735982 ?auto_735983 ?auto_735984 ?auto_735985 ?auto_735986 )
      ( MAKE-14PILE ?auto_735978 ?auto_735979 ?auto_735980 ?auto_735981 ?auto_735982 ?auto_735983 ?auto_735984 ?auto_735985 ?auto_735986 ?auto_735987 ?auto_735988 ?auto_735989 ?auto_735990 ?auto_735991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736036 - BLOCK
      ?auto_736037 - BLOCK
      ?auto_736038 - BLOCK
      ?auto_736039 - BLOCK
      ?auto_736040 - BLOCK
      ?auto_736041 - BLOCK
      ?auto_736042 - BLOCK
      ?auto_736043 - BLOCK
      ?auto_736044 - BLOCK
      ?auto_736045 - BLOCK
      ?auto_736046 - BLOCK
      ?auto_736047 - BLOCK
      ?auto_736048 - BLOCK
      ?auto_736049 - BLOCK
    )
    :vars
    (
      ?auto_736050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736049 ?auto_736050 ) ( ON-TABLE ?auto_736036 ) ( ON ?auto_736037 ?auto_736036 ) ( ON ?auto_736038 ?auto_736037 ) ( ON ?auto_736039 ?auto_736038 ) ( ON ?auto_736040 ?auto_736039 ) ( ON ?auto_736041 ?auto_736040 ) ( ON ?auto_736042 ?auto_736041 ) ( not ( = ?auto_736036 ?auto_736037 ) ) ( not ( = ?auto_736036 ?auto_736038 ) ) ( not ( = ?auto_736036 ?auto_736039 ) ) ( not ( = ?auto_736036 ?auto_736040 ) ) ( not ( = ?auto_736036 ?auto_736041 ) ) ( not ( = ?auto_736036 ?auto_736042 ) ) ( not ( = ?auto_736036 ?auto_736043 ) ) ( not ( = ?auto_736036 ?auto_736044 ) ) ( not ( = ?auto_736036 ?auto_736045 ) ) ( not ( = ?auto_736036 ?auto_736046 ) ) ( not ( = ?auto_736036 ?auto_736047 ) ) ( not ( = ?auto_736036 ?auto_736048 ) ) ( not ( = ?auto_736036 ?auto_736049 ) ) ( not ( = ?auto_736036 ?auto_736050 ) ) ( not ( = ?auto_736037 ?auto_736038 ) ) ( not ( = ?auto_736037 ?auto_736039 ) ) ( not ( = ?auto_736037 ?auto_736040 ) ) ( not ( = ?auto_736037 ?auto_736041 ) ) ( not ( = ?auto_736037 ?auto_736042 ) ) ( not ( = ?auto_736037 ?auto_736043 ) ) ( not ( = ?auto_736037 ?auto_736044 ) ) ( not ( = ?auto_736037 ?auto_736045 ) ) ( not ( = ?auto_736037 ?auto_736046 ) ) ( not ( = ?auto_736037 ?auto_736047 ) ) ( not ( = ?auto_736037 ?auto_736048 ) ) ( not ( = ?auto_736037 ?auto_736049 ) ) ( not ( = ?auto_736037 ?auto_736050 ) ) ( not ( = ?auto_736038 ?auto_736039 ) ) ( not ( = ?auto_736038 ?auto_736040 ) ) ( not ( = ?auto_736038 ?auto_736041 ) ) ( not ( = ?auto_736038 ?auto_736042 ) ) ( not ( = ?auto_736038 ?auto_736043 ) ) ( not ( = ?auto_736038 ?auto_736044 ) ) ( not ( = ?auto_736038 ?auto_736045 ) ) ( not ( = ?auto_736038 ?auto_736046 ) ) ( not ( = ?auto_736038 ?auto_736047 ) ) ( not ( = ?auto_736038 ?auto_736048 ) ) ( not ( = ?auto_736038 ?auto_736049 ) ) ( not ( = ?auto_736038 ?auto_736050 ) ) ( not ( = ?auto_736039 ?auto_736040 ) ) ( not ( = ?auto_736039 ?auto_736041 ) ) ( not ( = ?auto_736039 ?auto_736042 ) ) ( not ( = ?auto_736039 ?auto_736043 ) ) ( not ( = ?auto_736039 ?auto_736044 ) ) ( not ( = ?auto_736039 ?auto_736045 ) ) ( not ( = ?auto_736039 ?auto_736046 ) ) ( not ( = ?auto_736039 ?auto_736047 ) ) ( not ( = ?auto_736039 ?auto_736048 ) ) ( not ( = ?auto_736039 ?auto_736049 ) ) ( not ( = ?auto_736039 ?auto_736050 ) ) ( not ( = ?auto_736040 ?auto_736041 ) ) ( not ( = ?auto_736040 ?auto_736042 ) ) ( not ( = ?auto_736040 ?auto_736043 ) ) ( not ( = ?auto_736040 ?auto_736044 ) ) ( not ( = ?auto_736040 ?auto_736045 ) ) ( not ( = ?auto_736040 ?auto_736046 ) ) ( not ( = ?auto_736040 ?auto_736047 ) ) ( not ( = ?auto_736040 ?auto_736048 ) ) ( not ( = ?auto_736040 ?auto_736049 ) ) ( not ( = ?auto_736040 ?auto_736050 ) ) ( not ( = ?auto_736041 ?auto_736042 ) ) ( not ( = ?auto_736041 ?auto_736043 ) ) ( not ( = ?auto_736041 ?auto_736044 ) ) ( not ( = ?auto_736041 ?auto_736045 ) ) ( not ( = ?auto_736041 ?auto_736046 ) ) ( not ( = ?auto_736041 ?auto_736047 ) ) ( not ( = ?auto_736041 ?auto_736048 ) ) ( not ( = ?auto_736041 ?auto_736049 ) ) ( not ( = ?auto_736041 ?auto_736050 ) ) ( not ( = ?auto_736042 ?auto_736043 ) ) ( not ( = ?auto_736042 ?auto_736044 ) ) ( not ( = ?auto_736042 ?auto_736045 ) ) ( not ( = ?auto_736042 ?auto_736046 ) ) ( not ( = ?auto_736042 ?auto_736047 ) ) ( not ( = ?auto_736042 ?auto_736048 ) ) ( not ( = ?auto_736042 ?auto_736049 ) ) ( not ( = ?auto_736042 ?auto_736050 ) ) ( not ( = ?auto_736043 ?auto_736044 ) ) ( not ( = ?auto_736043 ?auto_736045 ) ) ( not ( = ?auto_736043 ?auto_736046 ) ) ( not ( = ?auto_736043 ?auto_736047 ) ) ( not ( = ?auto_736043 ?auto_736048 ) ) ( not ( = ?auto_736043 ?auto_736049 ) ) ( not ( = ?auto_736043 ?auto_736050 ) ) ( not ( = ?auto_736044 ?auto_736045 ) ) ( not ( = ?auto_736044 ?auto_736046 ) ) ( not ( = ?auto_736044 ?auto_736047 ) ) ( not ( = ?auto_736044 ?auto_736048 ) ) ( not ( = ?auto_736044 ?auto_736049 ) ) ( not ( = ?auto_736044 ?auto_736050 ) ) ( not ( = ?auto_736045 ?auto_736046 ) ) ( not ( = ?auto_736045 ?auto_736047 ) ) ( not ( = ?auto_736045 ?auto_736048 ) ) ( not ( = ?auto_736045 ?auto_736049 ) ) ( not ( = ?auto_736045 ?auto_736050 ) ) ( not ( = ?auto_736046 ?auto_736047 ) ) ( not ( = ?auto_736046 ?auto_736048 ) ) ( not ( = ?auto_736046 ?auto_736049 ) ) ( not ( = ?auto_736046 ?auto_736050 ) ) ( not ( = ?auto_736047 ?auto_736048 ) ) ( not ( = ?auto_736047 ?auto_736049 ) ) ( not ( = ?auto_736047 ?auto_736050 ) ) ( not ( = ?auto_736048 ?auto_736049 ) ) ( not ( = ?auto_736048 ?auto_736050 ) ) ( not ( = ?auto_736049 ?auto_736050 ) ) ( ON ?auto_736048 ?auto_736049 ) ( ON ?auto_736047 ?auto_736048 ) ( ON ?auto_736046 ?auto_736047 ) ( ON ?auto_736045 ?auto_736046 ) ( ON ?auto_736044 ?auto_736045 ) ( CLEAR ?auto_736042 ) ( ON ?auto_736043 ?auto_736044 ) ( CLEAR ?auto_736043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_736036 ?auto_736037 ?auto_736038 ?auto_736039 ?auto_736040 ?auto_736041 ?auto_736042 ?auto_736043 )
      ( MAKE-14PILE ?auto_736036 ?auto_736037 ?auto_736038 ?auto_736039 ?auto_736040 ?auto_736041 ?auto_736042 ?auto_736043 ?auto_736044 ?auto_736045 ?auto_736046 ?auto_736047 ?auto_736048 ?auto_736049 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736094 - BLOCK
      ?auto_736095 - BLOCK
      ?auto_736096 - BLOCK
      ?auto_736097 - BLOCK
      ?auto_736098 - BLOCK
      ?auto_736099 - BLOCK
      ?auto_736100 - BLOCK
      ?auto_736101 - BLOCK
      ?auto_736102 - BLOCK
      ?auto_736103 - BLOCK
      ?auto_736104 - BLOCK
      ?auto_736105 - BLOCK
      ?auto_736106 - BLOCK
      ?auto_736107 - BLOCK
    )
    :vars
    (
      ?auto_736108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736107 ?auto_736108 ) ( ON-TABLE ?auto_736094 ) ( ON ?auto_736095 ?auto_736094 ) ( ON ?auto_736096 ?auto_736095 ) ( ON ?auto_736097 ?auto_736096 ) ( ON ?auto_736098 ?auto_736097 ) ( ON ?auto_736099 ?auto_736098 ) ( not ( = ?auto_736094 ?auto_736095 ) ) ( not ( = ?auto_736094 ?auto_736096 ) ) ( not ( = ?auto_736094 ?auto_736097 ) ) ( not ( = ?auto_736094 ?auto_736098 ) ) ( not ( = ?auto_736094 ?auto_736099 ) ) ( not ( = ?auto_736094 ?auto_736100 ) ) ( not ( = ?auto_736094 ?auto_736101 ) ) ( not ( = ?auto_736094 ?auto_736102 ) ) ( not ( = ?auto_736094 ?auto_736103 ) ) ( not ( = ?auto_736094 ?auto_736104 ) ) ( not ( = ?auto_736094 ?auto_736105 ) ) ( not ( = ?auto_736094 ?auto_736106 ) ) ( not ( = ?auto_736094 ?auto_736107 ) ) ( not ( = ?auto_736094 ?auto_736108 ) ) ( not ( = ?auto_736095 ?auto_736096 ) ) ( not ( = ?auto_736095 ?auto_736097 ) ) ( not ( = ?auto_736095 ?auto_736098 ) ) ( not ( = ?auto_736095 ?auto_736099 ) ) ( not ( = ?auto_736095 ?auto_736100 ) ) ( not ( = ?auto_736095 ?auto_736101 ) ) ( not ( = ?auto_736095 ?auto_736102 ) ) ( not ( = ?auto_736095 ?auto_736103 ) ) ( not ( = ?auto_736095 ?auto_736104 ) ) ( not ( = ?auto_736095 ?auto_736105 ) ) ( not ( = ?auto_736095 ?auto_736106 ) ) ( not ( = ?auto_736095 ?auto_736107 ) ) ( not ( = ?auto_736095 ?auto_736108 ) ) ( not ( = ?auto_736096 ?auto_736097 ) ) ( not ( = ?auto_736096 ?auto_736098 ) ) ( not ( = ?auto_736096 ?auto_736099 ) ) ( not ( = ?auto_736096 ?auto_736100 ) ) ( not ( = ?auto_736096 ?auto_736101 ) ) ( not ( = ?auto_736096 ?auto_736102 ) ) ( not ( = ?auto_736096 ?auto_736103 ) ) ( not ( = ?auto_736096 ?auto_736104 ) ) ( not ( = ?auto_736096 ?auto_736105 ) ) ( not ( = ?auto_736096 ?auto_736106 ) ) ( not ( = ?auto_736096 ?auto_736107 ) ) ( not ( = ?auto_736096 ?auto_736108 ) ) ( not ( = ?auto_736097 ?auto_736098 ) ) ( not ( = ?auto_736097 ?auto_736099 ) ) ( not ( = ?auto_736097 ?auto_736100 ) ) ( not ( = ?auto_736097 ?auto_736101 ) ) ( not ( = ?auto_736097 ?auto_736102 ) ) ( not ( = ?auto_736097 ?auto_736103 ) ) ( not ( = ?auto_736097 ?auto_736104 ) ) ( not ( = ?auto_736097 ?auto_736105 ) ) ( not ( = ?auto_736097 ?auto_736106 ) ) ( not ( = ?auto_736097 ?auto_736107 ) ) ( not ( = ?auto_736097 ?auto_736108 ) ) ( not ( = ?auto_736098 ?auto_736099 ) ) ( not ( = ?auto_736098 ?auto_736100 ) ) ( not ( = ?auto_736098 ?auto_736101 ) ) ( not ( = ?auto_736098 ?auto_736102 ) ) ( not ( = ?auto_736098 ?auto_736103 ) ) ( not ( = ?auto_736098 ?auto_736104 ) ) ( not ( = ?auto_736098 ?auto_736105 ) ) ( not ( = ?auto_736098 ?auto_736106 ) ) ( not ( = ?auto_736098 ?auto_736107 ) ) ( not ( = ?auto_736098 ?auto_736108 ) ) ( not ( = ?auto_736099 ?auto_736100 ) ) ( not ( = ?auto_736099 ?auto_736101 ) ) ( not ( = ?auto_736099 ?auto_736102 ) ) ( not ( = ?auto_736099 ?auto_736103 ) ) ( not ( = ?auto_736099 ?auto_736104 ) ) ( not ( = ?auto_736099 ?auto_736105 ) ) ( not ( = ?auto_736099 ?auto_736106 ) ) ( not ( = ?auto_736099 ?auto_736107 ) ) ( not ( = ?auto_736099 ?auto_736108 ) ) ( not ( = ?auto_736100 ?auto_736101 ) ) ( not ( = ?auto_736100 ?auto_736102 ) ) ( not ( = ?auto_736100 ?auto_736103 ) ) ( not ( = ?auto_736100 ?auto_736104 ) ) ( not ( = ?auto_736100 ?auto_736105 ) ) ( not ( = ?auto_736100 ?auto_736106 ) ) ( not ( = ?auto_736100 ?auto_736107 ) ) ( not ( = ?auto_736100 ?auto_736108 ) ) ( not ( = ?auto_736101 ?auto_736102 ) ) ( not ( = ?auto_736101 ?auto_736103 ) ) ( not ( = ?auto_736101 ?auto_736104 ) ) ( not ( = ?auto_736101 ?auto_736105 ) ) ( not ( = ?auto_736101 ?auto_736106 ) ) ( not ( = ?auto_736101 ?auto_736107 ) ) ( not ( = ?auto_736101 ?auto_736108 ) ) ( not ( = ?auto_736102 ?auto_736103 ) ) ( not ( = ?auto_736102 ?auto_736104 ) ) ( not ( = ?auto_736102 ?auto_736105 ) ) ( not ( = ?auto_736102 ?auto_736106 ) ) ( not ( = ?auto_736102 ?auto_736107 ) ) ( not ( = ?auto_736102 ?auto_736108 ) ) ( not ( = ?auto_736103 ?auto_736104 ) ) ( not ( = ?auto_736103 ?auto_736105 ) ) ( not ( = ?auto_736103 ?auto_736106 ) ) ( not ( = ?auto_736103 ?auto_736107 ) ) ( not ( = ?auto_736103 ?auto_736108 ) ) ( not ( = ?auto_736104 ?auto_736105 ) ) ( not ( = ?auto_736104 ?auto_736106 ) ) ( not ( = ?auto_736104 ?auto_736107 ) ) ( not ( = ?auto_736104 ?auto_736108 ) ) ( not ( = ?auto_736105 ?auto_736106 ) ) ( not ( = ?auto_736105 ?auto_736107 ) ) ( not ( = ?auto_736105 ?auto_736108 ) ) ( not ( = ?auto_736106 ?auto_736107 ) ) ( not ( = ?auto_736106 ?auto_736108 ) ) ( not ( = ?auto_736107 ?auto_736108 ) ) ( ON ?auto_736106 ?auto_736107 ) ( ON ?auto_736105 ?auto_736106 ) ( ON ?auto_736104 ?auto_736105 ) ( ON ?auto_736103 ?auto_736104 ) ( ON ?auto_736102 ?auto_736103 ) ( ON ?auto_736101 ?auto_736102 ) ( CLEAR ?auto_736099 ) ( ON ?auto_736100 ?auto_736101 ) ( CLEAR ?auto_736100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_736094 ?auto_736095 ?auto_736096 ?auto_736097 ?auto_736098 ?auto_736099 ?auto_736100 )
      ( MAKE-14PILE ?auto_736094 ?auto_736095 ?auto_736096 ?auto_736097 ?auto_736098 ?auto_736099 ?auto_736100 ?auto_736101 ?auto_736102 ?auto_736103 ?auto_736104 ?auto_736105 ?auto_736106 ?auto_736107 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736152 - BLOCK
      ?auto_736153 - BLOCK
      ?auto_736154 - BLOCK
      ?auto_736155 - BLOCK
      ?auto_736156 - BLOCK
      ?auto_736157 - BLOCK
      ?auto_736158 - BLOCK
      ?auto_736159 - BLOCK
      ?auto_736160 - BLOCK
      ?auto_736161 - BLOCK
      ?auto_736162 - BLOCK
      ?auto_736163 - BLOCK
      ?auto_736164 - BLOCK
      ?auto_736165 - BLOCK
    )
    :vars
    (
      ?auto_736166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736165 ?auto_736166 ) ( ON-TABLE ?auto_736152 ) ( ON ?auto_736153 ?auto_736152 ) ( ON ?auto_736154 ?auto_736153 ) ( ON ?auto_736155 ?auto_736154 ) ( ON ?auto_736156 ?auto_736155 ) ( not ( = ?auto_736152 ?auto_736153 ) ) ( not ( = ?auto_736152 ?auto_736154 ) ) ( not ( = ?auto_736152 ?auto_736155 ) ) ( not ( = ?auto_736152 ?auto_736156 ) ) ( not ( = ?auto_736152 ?auto_736157 ) ) ( not ( = ?auto_736152 ?auto_736158 ) ) ( not ( = ?auto_736152 ?auto_736159 ) ) ( not ( = ?auto_736152 ?auto_736160 ) ) ( not ( = ?auto_736152 ?auto_736161 ) ) ( not ( = ?auto_736152 ?auto_736162 ) ) ( not ( = ?auto_736152 ?auto_736163 ) ) ( not ( = ?auto_736152 ?auto_736164 ) ) ( not ( = ?auto_736152 ?auto_736165 ) ) ( not ( = ?auto_736152 ?auto_736166 ) ) ( not ( = ?auto_736153 ?auto_736154 ) ) ( not ( = ?auto_736153 ?auto_736155 ) ) ( not ( = ?auto_736153 ?auto_736156 ) ) ( not ( = ?auto_736153 ?auto_736157 ) ) ( not ( = ?auto_736153 ?auto_736158 ) ) ( not ( = ?auto_736153 ?auto_736159 ) ) ( not ( = ?auto_736153 ?auto_736160 ) ) ( not ( = ?auto_736153 ?auto_736161 ) ) ( not ( = ?auto_736153 ?auto_736162 ) ) ( not ( = ?auto_736153 ?auto_736163 ) ) ( not ( = ?auto_736153 ?auto_736164 ) ) ( not ( = ?auto_736153 ?auto_736165 ) ) ( not ( = ?auto_736153 ?auto_736166 ) ) ( not ( = ?auto_736154 ?auto_736155 ) ) ( not ( = ?auto_736154 ?auto_736156 ) ) ( not ( = ?auto_736154 ?auto_736157 ) ) ( not ( = ?auto_736154 ?auto_736158 ) ) ( not ( = ?auto_736154 ?auto_736159 ) ) ( not ( = ?auto_736154 ?auto_736160 ) ) ( not ( = ?auto_736154 ?auto_736161 ) ) ( not ( = ?auto_736154 ?auto_736162 ) ) ( not ( = ?auto_736154 ?auto_736163 ) ) ( not ( = ?auto_736154 ?auto_736164 ) ) ( not ( = ?auto_736154 ?auto_736165 ) ) ( not ( = ?auto_736154 ?auto_736166 ) ) ( not ( = ?auto_736155 ?auto_736156 ) ) ( not ( = ?auto_736155 ?auto_736157 ) ) ( not ( = ?auto_736155 ?auto_736158 ) ) ( not ( = ?auto_736155 ?auto_736159 ) ) ( not ( = ?auto_736155 ?auto_736160 ) ) ( not ( = ?auto_736155 ?auto_736161 ) ) ( not ( = ?auto_736155 ?auto_736162 ) ) ( not ( = ?auto_736155 ?auto_736163 ) ) ( not ( = ?auto_736155 ?auto_736164 ) ) ( not ( = ?auto_736155 ?auto_736165 ) ) ( not ( = ?auto_736155 ?auto_736166 ) ) ( not ( = ?auto_736156 ?auto_736157 ) ) ( not ( = ?auto_736156 ?auto_736158 ) ) ( not ( = ?auto_736156 ?auto_736159 ) ) ( not ( = ?auto_736156 ?auto_736160 ) ) ( not ( = ?auto_736156 ?auto_736161 ) ) ( not ( = ?auto_736156 ?auto_736162 ) ) ( not ( = ?auto_736156 ?auto_736163 ) ) ( not ( = ?auto_736156 ?auto_736164 ) ) ( not ( = ?auto_736156 ?auto_736165 ) ) ( not ( = ?auto_736156 ?auto_736166 ) ) ( not ( = ?auto_736157 ?auto_736158 ) ) ( not ( = ?auto_736157 ?auto_736159 ) ) ( not ( = ?auto_736157 ?auto_736160 ) ) ( not ( = ?auto_736157 ?auto_736161 ) ) ( not ( = ?auto_736157 ?auto_736162 ) ) ( not ( = ?auto_736157 ?auto_736163 ) ) ( not ( = ?auto_736157 ?auto_736164 ) ) ( not ( = ?auto_736157 ?auto_736165 ) ) ( not ( = ?auto_736157 ?auto_736166 ) ) ( not ( = ?auto_736158 ?auto_736159 ) ) ( not ( = ?auto_736158 ?auto_736160 ) ) ( not ( = ?auto_736158 ?auto_736161 ) ) ( not ( = ?auto_736158 ?auto_736162 ) ) ( not ( = ?auto_736158 ?auto_736163 ) ) ( not ( = ?auto_736158 ?auto_736164 ) ) ( not ( = ?auto_736158 ?auto_736165 ) ) ( not ( = ?auto_736158 ?auto_736166 ) ) ( not ( = ?auto_736159 ?auto_736160 ) ) ( not ( = ?auto_736159 ?auto_736161 ) ) ( not ( = ?auto_736159 ?auto_736162 ) ) ( not ( = ?auto_736159 ?auto_736163 ) ) ( not ( = ?auto_736159 ?auto_736164 ) ) ( not ( = ?auto_736159 ?auto_736165 ) ) ( not ( = ?auto_736159 ?auto_736166 ) ) ( not ( = ?auto_736160 ?auto_736161 ) ) ( not ( = ?auto_736160 ?auto_736162 ) ) ( not ( = ?auto_736160 ?auto_736163 ) ) ( not ( = ?auto_736160 ?auto_736164 ) ) ( not ( = ?auto_736160 ?auto_736165 ) ) ( not ( = ?auto_736160 ?auto_736166 ) ) ( not ( = ?auto_736161 ?auto_736162 ) ) ( not ( = ?auto_736161 ?auto_736163 ) ) ( not ( = ?auto_736161 ?auto_736164 ) ) ( not ( = ?auto_736161 ?auto_736165 ) ) ( not ( = ?auto_736161 ?auto_736166 ) ) ( not ( = ?auto_736162 ?auto_736163 ) ) ( not ( = ?auto_736162 ?auto_736164 ) ) ( not ( = ?auto_736162 ?auto_736165 ) ) ( not ( = ?auto_736162 ?auto_736166 ) ) ( not ( = ?auto_736163 ?auto_736164 ) ) ( not ( = ?auto_736163 ?auto_736165 ) ) ( not ( = ?auto_736163 ?auto_736166 ) ) ( not ( = ?auto_736164 ?auto_736165 ) ) ( not ( = ?auto_736164 ?auto_736166 ) ) ( not ( = ?auto_736165 ?auto_736166 ) ) ( ON ?auto_736164 ?auto_736165 ) ( ON ?auto_736163 ?auto_736164 ) ( ON ?auto_736162 ?auto_736163 ) ( ON ?auto_736161 ?auto_736162 ) ( ON ?auto_736160 ?auto_736161 ) ( ON ?auto_736159 ?auto_736160 ) ( ON ?auto_736158 ?auto_736159 ) ( CLEAR ?auto_736156 ) ( ON ?auto_736157 ?auto_736158 ) ( CLEAR ?auto_736157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_736152 ?auto_736153 ?auto_736154 ?auto_736155 ?auto_736156 ?auto_736157 )
      ( MAKE-14PILE ?auto_736152 ?auto_736153 ?auto_736154 ?auto_736155 ?auto_736156 ?auto_736157 ?auto_736158 ?auto_736159 ?auto_736160 ?auto_736161 ?auto_736162 ?auto_736163 ?auto_736164 ?auto_736165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736210 - BLOCK
      ?auto_736211 - BLOCK
      ?auto_736212 - BLOCK
      ?auto_736213 - BLOCK
      ?auto_736214 - BLOCK
      ?auto_736215 - BLOCK
      ?auto_736216 - BLOCK
      ?auto_736217 - BLOCK
      ?auto_736218 - BLOCK
      ?auto_736219 - BLOCK
      ?auto_736220 - BLOCK
      ?auto_736221 - BLOCK
      ?auto_736222 - BLOCK
      ?auto_736223 - BLOCK
    )
    :vars
    (
      ?auto_736224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736223 ?auto_736224 ) ( ON-TABLE ?auto_736210 ) ( ON ?auto_736211 ?auto_736210 ) ( ON ?auto_736212 ?auto_736211 ) ( ON ?auto_736213 ?auto_736212 ) ( not ( = ?auto_736210 ?auto_736211 ) ) ( not ( = ?auto_736210 ?auto_736212 ) ) ( not ( = ?auto_736210 ?auto_736213 ) ) ( not ( = ?auto_736210 ?auto_736214 ) ) ( not ( = ?auto_736210 ?auto_736215 ) ) ( not ( = ?auto_736210 ?auto_736216 ) ) ( not ( = ?auto_736210 ?auto_736217 ) ) ( not ( = ?auto_736210 ?auto_736218 ) ) ( not ( = ?auto_736210 ?auto_736219 ) ) ( not ( = ?auto_736210 ?auto_736220 ) ) ( not ( = ?auto_736210 ?auto_736221 ) ) ( not ( = ?auto_736210 ?auto_736222 ) ) ( not ( = ?auto_736210 ?auto_736223 ) ) ( not ( = ?auto_736210 ?auto_736224 ) ) ( not ( = ?auto_736211 ?auto_736212 ) ) ( not ( = ?auto_736211 ?auto_736213 ) ) ( not ( = ?auto_736211 ?auto_736214 ) ) ( not ( = ?auto_736211 ?auto_736215 ) ) ( not ( = ?auto_736211 ?auto_736216 ) ) ( not ( = ?auto_736211 ?auto_736217 ) ) ( not ( = ?auto_736211 ?auto_736218 ) ) ( not ( = ?auto_736211 ?auto_736219 ) ) ( not ( = ?auto_736211 ?auto_736220 ) ) ( not ( = ?auto_736211 ?auto_736221 ) ) ( not ( = ?auto_736211 ?auto_736222 ) ) ( not ( = ?auto_736211 ?auto_736223 ) ) ( not ( = ?auto_736211 ?auto_736224 ) ) ( not ( = ?auto_736212 ?auto_736213 ) ) ( not ( = ?auto_736212 ?auto_736214 ) ) ( not ( = ?auto_736212 ?auto_736215 ) ) ( not ( = ?auto_736212 ?auto_736216 ) ) ( not ( = ?auto_736212 ?auto_736217 ) ) ( not ( = ?auto_736212 ?auto_736218 ) ) ( not ( = ?auto_736212 ?auto_736219 ) ) ( not ( = ?auto_736212 ?auto_736220 ) ) ( not ( = ?auto_736212 ?auto_736221 ) ) ( not ( = ?auto_736212 ?auto_736222 ) ) ( not ( = ?auto_736212 ?auto_736223 ) ) ( not ( = ?auto_736212 ?auto_736224 ) ) ( not ( = ?auto_736213 ?auto_736214 ) ) ( not ( = ?auto_736213 ?auto_736215 ) ) ( not ( = ?auto_736213 ?auto_736216 ) ) ( not ( = ?auto_736213 ?auto_736217 ) ) ( not ( = ?auto_736213 ?auto_736218 ) ) ( not ( = ?auto_736213 ?auto_736219 ) ) ( not ( = ?auto_736213 ?auto_736220 ) ) ( not ( = ?auto_736213 ?auto_736221 ) ) ( not ( = ?auto_736213 ?auto_736222 ) ) ( not ( = ?auto_736213 ?auto_736223 ) ) ( not ( = ?auto_736213 ?auto_736224 ) ) ( not ( = ?auto_736214 ?auto_736215 ) ) ( not ( = ?auto_736214 ?auto_736216 ) ) ( not ( = ?auto_736214 ?auto_736217 ) ) ( not ( = ?auto_736214 ?auto_736218 ) ) ( not ( = ?auto_736214 ?auto_736219 ) ) ( not ( = ?auto_736214 ?auto_736220 ) ) ( not ( = ?auto_736214 ?auto_736221 ) ) ( not ( = ?auto_736214 ?auto_736222 ) ) ( not ( = ?auto_736214 ?auto_736223 ) ) ( not ( = ?auto_736214 ?auto_736224 ) ) ( not ( = ?auto_736215 ?auto_736216 ) ) ( not ( = ?auto_736215 ?auto_736217 ) ) ( not ( = ?auto_736215 ?auto_736218 ) ) ( not ( = ?auto_736215 ?auto_736219 ) ) ( not ( = ?auto_736215 ?auto_736220 ) ) ( not ( = ?auto_736215 ?auto_736221 ) ) ( not ( = ?auto_736215 ?auto_736222 ) ) ( not ( = ?auto_736215 ?auto_736223 ) ) ( not ( = ?auto_736215 ?auto_736224 ) ) ( not ( = ?auto_736216 ?auto_736217 ) ) ( not ( = ?auto_736216 ?auto_736218 ) ) ( not ( = ?auto_736216 ?auto_736219 ) ) ( not ( = ?auto_736216 ?auto_736220 ) ) ( not ( = ?auto_736216 ?auto_736221 ) ) ( not ( = ?auto_736216 ?auto_736222 ) ) ( not ( = ?auto_736216 ?auto_736223 ) ) ( not ( = ?auto_736216 ?auto_736224 ) ) ( not ( = ?auto_736217 ?auto_736218 ) ) ( not ( = ?auto_736217 ?auto_736219 ) ) ( not ( = ?auto_736217 ?auto_736220 ) ) ( not ( = ?auto_736217 ?auto_736221 ) ) ( not ( = ?auto_736217 ?auto_736222 ) ) ( not ( = ?auto_736217 ?auto_736223 ) ) ( not ( = ?auto_736217 ?auto_736224 ) ) ( not ( = ?auto_736218 ?auto_736219 ) ) ( not ( = ?auto_736218 ?auto_736220 ) ) ( not ( = ?auto_736218 ?auto_736221 ) ) ( not ( = ?auto_736218 ?auto_736222 ) ) ( not ( = ?auto_736218 ?auto_736223 ) ) ( not ( = ?auto_736218 ?auto_736224 ) ) ( not ( = ?auto_736219 ?auto_736220 ) ) ( not ( = ?auto_736219 ?auto_736221 ) ) ( not ( = ?auto_736219 ?auto_736222 ) ) ( not ( = ?auto_736219 ?auto_736223 ) ) ( not ( = ?auto_736219 ?auto_736224 ) ) ( not ( = ?auto_736220 ?auto_736221 ) ) ( not ( = ?auto_736220 ?auto_736222 ) ) ( not ( = ?auto_736220 ?auto_736223 ) ) ( not ( = ?auto_736220 ?auto_736224 ) ) ( not ( = ?auto_736221 ?auto_736222 ) ) ( not ( = ?auto_736221 ?auto_736223 ) ) ( not ( = ?auto_736221 ?auto_736224 ) ) ( not ( = ?auto_736222 ?auto_736223 ) ) ( not ( = ?auto_736222 ?auto_736224 ) ) ( not ( = ?auto_736223 ?auto_736224 ) ) ( ON ?auto_736222 ?auto_736223 ) ( ON ?auto_736221 ?auto_736222 ) ( ON ?auto_736220 ?auto_736221 ) ( ON ?auto_736219 ?auto_736220 ) ( ON ?auto_736218 ?auto_736219 ) ( ON ?auto_736217 ?auto_736218 ) ( ON ?auto_736216 ?auto_736217 ) ( ON ?auto_736215 ?auto_736216 ) ( CLEAR ?auto_736213 ) ( ON ?auto_736214 ?auto_736215 ) ( CLEAR ?auto_736214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_736210 ?auto_736211 ?auto_736212 ?auto_736213 ?auto_736214 )
      ( MAKE-14PILE ?auto_736210 ?auto_736211 ?auto_736212 ?auto_736213 ?auto_736214 ?auto_736215 ?auto_736216 ?auto_736217 ?auto_736218 ?auto_736219 ?auto_736220 ?auto_736221 ?auto_736222 ?auto_736223 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736268 - BLOCK
      ?auto_736269 - BLOCK
      ?auto_736270 - BLOCK
      ?auto_736271 - BLOCK
      ?auto_736272 - BLOCK
      ?auto_736273 - BLOCK
      ?auto_736274 - BLOCK
      ?auto_736275 - BLOCK
      ?auto_736276 - BLOCK
      ?auto_736277 - BLOCK
      ?auto_736278 - BLOCK
      ?auto_736279 - BLOCK
      ?auto_736280 - BLOCK
      ?auto_736281 - BLOCK
    )
    :vars
    (
      ?auto_736282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736281 ?auto_736282 ) ( ON-TABLE ?auto_736268 ) ( ON ?auto_736269 ?auto_736268 ) ( ON ?auto_736270 ?auto_736269 ) ( not ( = ?auto_736268 ?auto_736269 ) ) ( not ( = ?auto_736268 ?auto_736270 ) ) ( not ( = ?auto_736268 ?auto_736271 ) ) ( not ( = ?auto_736268 ?auto_736272 ) ) ( not ( = ?auto_736268 ?auto_736273 ) ) ( not ( = ?auto_736268 ?auto_736274 ) ) ( not ( = ?auto_736268 ?auto_736275 ) ) ( not ( = ?auto_736268 ?auto_736276 ) ) ( not ( = ?auto_736268 ?auto_736277 ) ) ( not ( = ?auto_736268 ?auto_736278 ) ) ( not ( = ?auto_736268 ?auto_736279 ) ) ( not ( = ?auto_736268 ?auto_736280 ) ) ( not ( = ?auto_736268 ?auto_736281 ) ) ( not ( = ?auto_736268 ?auto_736282 ) ) ( not ( = ?auto_736269 ?auto_736270 ) ) ( not ( = ?auto_736269 ?auto_736271 ) ) ( not ( = ?auto_736269 ?auto_736272 ) ) ( not ( = ?auto_736269 ?auto_736273 ) ) ( not ( = ?auto_736269 ?auto_736274 ) ) ( not ( = ?auto_736269 ?auto_736275 ) ) ( not ( = ?auto_736269 ?auto_736276 ) ) ( not ( = ?auto_736269 ?auto_736277 ) ) ( not ( = ?auto_736269 ?auto_736278 ) ) ( not ( = ?auto_736269 ?auto_736279 ) ) ( not ( = ?auto_736269 ?auto_736280 ) ) ( not ( = ?auto_736269 ?auto_736281 ) ) ( not ( = ?auto_736269 ?auto_736282 ) ) ( not ( = ?auto_736270 ?auto_736271 ) ) ( not ( = ?auto_736270 ?auto_736272 ) ) ( not ( = ?auto_736270 ?auto_736273 ) ) ( not ( = ?auto_736270 ?auto_736274 ) ) ( not ( = ?auto_736270 ?auto_736275 ) ) ( not ( = ?auto_736270 ?auto_736276 ) ) ( not ( = ?auto_736270 ?auto_736277 ) ) ( not ( = ?auto_736270 ?auto_736278 ) ) ( not ( = ?auto_736270 ?auto_736279 ) ) ( not ( = ?auto_736270 ?auto_736280 ) ) ( not ( = ?auto_736270 ?auto_736281 ) ) ( not ( = ?auto_736270 ?auto_736282 ) ) ( not ( = ?auto_736271 ?auto_736272 ) ) ( not ( = ?auto_736271 ?auto_736273 ) ) ( not ( = ?auto_736271 ?auto_736274 ) ) ( not ( = ?auto_736271 ?auto_736275 ) ) ( not ( = ?auto_736271 ?auto_736276 ) ) ( not ( = ?auto_736271 ?auto_736277 ) ) ( not ( = ?auto_736271 ?auto_736278 ) ) ( not ( = ?auto_736271 ?auto_736279 ) ) ( not ( = ?auto_736271 ?auto_736280 ) ) ( not ( = ?auto_736271 ?auto_736281 ) ) ( not ( = ?auto_736271 ?auto_736282 ) ) ( not ( = ?auto_736272 ?auto_736273 ) ) ( not ( = ?auto_736272 ?auto_736274 ) ) ( not ( = ?auto_736272 ?auto_736275 ) ) ( not ( = ?auto_736272 ?auto_736276 ) ) ( not ( = ?auto_736272 ?auto_736277 ) ) ( not ( = ?auto_736272 ?auto_736278 ) ) ( not ( = ?auto_736272 ?auto_736279 ) ) ( not ( = ?auto_736272 ?auto_736280 ) ) ( not ( = ?auto_736272 ?auto_736281 ) ) ( not ( = ?auto_736272 ?auto_736282 ) ) ( not ( = ?auto_736273 ?auto_736274 ) ) ( not ( = ?auto_736273 ?auto_736275 ) ) ( not ( = ?auto_736273 ?auto_736276 ) ) ( not ( = ?auto_736273 ?auto_736277 ) ) ( not ( = ?auto_736273 ?auto_736278 ) ) ( not ( = ?auto_736273 ?auto_736279 ) ) ( not ( = ?auto_736273 ?auto_736280 ) ) ( not ( = ?auto_736273 ?auto_736281 ) ) ( not ( = ?auto_736273 ?auto_736282 ) ) ( not ( = ?auto_736274 ?auto_736275 ) ) ( not ( = ?auto_736274 ?auto_736276 ) ) ( not ( = ?auto_736274 ?auto_736277 ) ) ( not ( = ?auto_736274 ?auto_736278 ) ) ( not ( = ?auto_736274 ?auto_736279 ) ) ( not ( = ?auto_736274 ?auto_736280 ) ) ( not ( = ?auto_736274 ?auto_736281 ) ) ( not ( = ?auto_736274 ?auto_736282 ) ) ( not ( = ?auto_736275 ?auto_736276 ) ) ( not ( = ?auto_736275 ?auto_736277 ) ) ( not ( = ?auto_736275 ?auto_736278 ) ) ( not ( = ?auto_736275 ?auto_736279 ) ) ( not ( = ?auto_736275 ?auto_736280 ) ) ( not ( = ?auto_736275 ?auto_736281 ) ) ( not ( = ?auto_736275 ?auto_736282 ) ) ( not ( = ?auto_736276 ?auto_736277 ) ) ( not ( = ?auto_736276 ?auto_736278 ) ) ( not ( = ?auto_736276 ?auto_736279 ) ) ( not ( = ?auto_736276 ?auto_736280 ) ) ( not ( = ?auto_736276 ?auto_736281 ) ) ( not ( = ?auto_736276 ?auto_736282 ) ) ( not ( = ?auto_736277 ?auto_736278 ) ) ( not ( = ?auto_736277 ?auto_736279 ) ) ( not ( = ?auto_736277 ?auto_736280 ) ) ( not ( = ?auto_736277 ?auto_736281 ) ) ( not ( = ?auto_736277 ?auto_736282 ) ) ( not ( = ?auto_736278 ?auto_736279 ) ) ( not ( = ?auto_736278 ?auto_736280 ) ) ( not ( = ?auto_736278 ?auto_736281 ) ) ( not ( = ?auto_736278 ?auto_736282 ) ) ( not ( = ?auto_736279 ?auto_736280 ) ) ( not ( = ?auto_736279 ?auto_736281 ) ) ( not ( = ?auto_736279 ?auto_736282 ) ) ( not ( = ?auto_736280 ?auto_736281 ) ) ( not ( = ?auto_736280 ?auto_736282 ) ) ( not ( = ?auto_736281 ?auto_736282 ) ) ( ON ?auto_736280 ?auto_736281 ) ( ON ?auto_736279 ?auto_736280 ) ( ON ?auto_736278 ?auto_736279 ) ( ON ?auto_736277 ?auto_736278 ) ( ON ?auto_736276 ?auto_736277 ) ( ON ?auto_736275 ?auto_736276 ) ( ON ?auto_736274 ?auto_736275 ) ( ON ?auto_736273 ?auto_736274 ) ( ON ?auto_736272 ?auto_736273 ) ( CLEAR ?auto_736270 ) ( ON ?auto_736271 ?auto_736272 ) ( CLEAR ?auto_736271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_736268 ?auto_736269 ?auto_736270 ?auto_736271 )
      ( MAKE-14PILE ?auto_736268 ?auto_736269 ?auto_736270 ?auto_736271 ?auto_736272 ?auto_736273 ?auto_736274 ?auto_736275 ?auto_736276 ?auto_736277 ?auto_736278 ?auto_736279 ?auto_736280 ?auto_736281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736326 - BLOCK
      ?auto_736327 - BLOCK
      ?auto_736328 - BLOCK
      ?auto_736329 - BLOCK
      ?auto_736330 - BLOCK
      ?auto_736331 - BLOCK
      ?auto_736332 - BLOCK
      ?auto_736333 - BLOCK
      ?auto_736334 - BLOCK
      ?auto_736335 - BLOCK
      ?auto_736336 - BLOCK
      ?auto_736337 - BLOCK
      ?auto_736338 - BLOCK
      ?auto_736339 - BLOCK
    )
    :vars
    (
      ?auto_736340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736339 ?auto_736340 ) ( ON-TABLE ?auto_736326 ) ( ON ?auto_736327 ?auto_736326 ) ( not ( = ?auto_736326 ?auto_736327 ) ) ( not ( = ?auto_736326 ?auto_736328 ) ) ( not ( = ?auto_736326 ?auto_736329 ) ) ( not ( = ?auto_736326 ?auto_736330 ) ) ( not ( = ?auto_736326 ?auto_736331 ) ) ( not ( = ?auto_736326 ?auto_736332 ) ) ( not ( = ?auto_736326 ?auto_736333 ) ) ( not ( = ?auto_736326 ?auto_736334 ) ) ( not ( = ?auto_736326 ?auto_736335 ) ) ( not ( = ?auto_736326 ?auto_736336 ) ) ( not ( = ?auto_736326 ?auto_736337 ) ) ( not ( = ?auto_736326 ?auto_736338 ) ) ( not ( = ?auto_736326 ?auto_736339 ) ) ( not ( = ?auto_736326 ?auto_736340 ) ) ( not ( = ?auto_736327 ?auto_736328 ) ) ( not ( = ?auto_736327 ?auto_736329 ) ) ( not ( = ?auto_736327 ?auto_736330 ) ) ( not ( = ?auto_736327 ?auto_736331 ) ) ( not ( = ?auto_736327 ?auto_736332 ) ) ( not ( = ?auto_736327 ?auto_736333 ) ) ( not ( = ?auto_736327 ?auto_736334 ) ) ( not ( = ?auto_736327 ?auto_736335 ) ) ( not ( = ?auto_736327 ?auto_736336 ) ) ( not ( = ?auto_736327 ?auto_736337 ) ) ( not ( = ?auto_736327 ?auto_736338 ) ) ( not ( = ?auto_736327 ?auto_736339 ) ) ( not ( = ?auto_736327 ?auto_736340 ) ) ( not ( = ?auto_736328 ?auto_736329 ) ) ( not ( = ?auto_736328 ?auto_736330 ) ) ( not ( = ?auto_736328 ?auto_736331 ) ) ( not ( = ?auto_736328 ?auto_736332 ) ) ( not ( = ?auto_736328 ?auto_736333 ) ) ( not ( = ?auto_736328 ?auto_736334 ) ) ( not ( = ?auto_736328 ?auto_736335 ) ) ( not ( = ?auto_736328 ?auto_736336 ) ) ( not ( = ?auto_736328 ?auto_736337 ) ) ( not ( = ?auto_736328 ?auto_736338 ) ) ( not ( = ?auto_736328 ?auto_736339 ) ) ( not ( = ?auto_736328 ?auto_736340 ) ) ( not ( = ?auto_736329 ?auto_736330 ) ) ( not ( = ?auto_736329 ?auto_736331 ) ) ( not ( = ?auto_736329 ?auto_736332 ) ) ( not ( = ?auto_736329 ?auto_736333 ) ) ( not ( = ?auto_736329 ?auto_736334 ) ) ( not ( = ?auto_736329 ?auto_736335 ) ) ( not ( = ?auto_736329 ?auto_736336 ) ) ( not ( = ?auto_736329 ?auto_736337 ) ) ( not ( = ?auto_736329 ?auto_736338 ) ) ( not ( = ?auto_736329 ?auto_736339 ) ) ( not ( = ?auto_736329 ?auto_736340 ) ) ( not ( = ?auto_736330 ?auto_736331 ) ) ( not ( = ?auto_736330 ?auto_736332 ) ) ( not ( = ?auto_736330 ?auto_736333 ) ) ( not ( = ?auto_736330 ?auto_736334 ) ) ( not ( = ?auto_736330 ?auto_736335 ) ) ( not ( = ?auto_736330 ?auto_736336 ) ) ( not ( = ?auto_736330 ?auto_736337 ) ) ( not ( = ?auto_736330 ?auto_736338 ) ) ( not ( = ?auto_736330 ?auto_736339 ) ) ( not ( = ?auto_736330 ?auto_736340 ) ) ( not ( = ?auto_736331 ?auto_736332 ) ) ( not ( = ?auto_736331 ?auto_736333 ) ) ( not ( = ?auto_736331 ?auto_736334 ) ) ( not ( = ?auto_736331 ?auto_736335 ) ) ( not ( = ?auto_736331 ?auto_736336 ) ) ( not ( = ?auto_736331 ?auto_736337 ) ) ( not ( = ?auto_736331 ?auto_736338 ) ) ( not ( = ?auto_736331 ?auto_736339 ) ) ( not ( = ?auto_736331 ?auto_736340 ) ) ( not ( = ?auto_736332 ?auto_736333 ) ) ( not ( = ?auto_736332 ?auto_736334 ) ) ( not ( = ?auto_736332 ?auto_736335 ) ) ( not ( = ?auto_736332 ?auto_736336 ) ) ( not ( = ?auto_736332 ?auto_736337 ) ) ( not ( = ?auto_736332 ?auto_736338 ) ) ( not ( = ?auto_736332 ?auto_736339 ) ) ( not ( = ?auto_736332 ?auto_736340 ) ) ( not ( = ?auto_736333 ?auto_736334 ) ) ( not ( = ?auto_736333 ?auto_736335 ) ) ( not ( = ?auto_736333 ?auto_736336 ) ) ( not ( = ?auto_736333 ?auto_736337 ) ) ( not ( = ?auto_736333 ?auto_736338 ) ) ( not ( = ?auto_736333 ?auto_736339 ) ) ( not ( = ?auto_736333 ?auto_736340 ) ) ( not ( = ?auto_736334 ?auto_736335 ) ) ( not ( = ?auto_736334 ?auto_736336 ) ) ( not ( = ?auto_736334 ?auto_736337 ) ) ( not ( = ?auto_736334 ?auto_736338 ) ) ( not ( = ?auto_736334 ?auto_736339 ) ) ( not ( = ?auto_736334 ?auto_736340 ) ) ( not ( = ?auto_736335 ?auto_736336 ) ) ( not ( = ?auto_736335 ?auto_736337 ) ) ( not ( = ?auto_736335 ?auto_736338 ) ) ( not ( = ?auto_736335 ?auto_736339 ) ) ( not ( = ?auto_736335 ?auto_736340 ) ) ( not ( = ?auto_736336 ?auto_736337 ) ) ( not ( = ?auto_736336 ?auto_736338 ) ) ( not ( = ?auto_736336 ?auto_736339 ) ) ( not ( = ?auto_736336 ?auto_736340 ) ) ( not ( = ?auto_736337 ?auto_736338 ) ) ( not ( = ?auto_736337 ?auto_736339 ) ) ( not ( = ?auto_736337 ?auto_736340 ) ) ( not ( = ?auto_736338 ?auto_736339 ) ) ( not ( = ?auto_736338 ?auto_736340 ) ) ( not ( = ?auto_736339 ?auto_736340 ) ) ( ON ?auto_736338 ?auto_736339 ) ( ON ?auto_736337 ?auto_736338 ) ( ON ?auto_736336 ?auto_736337 ) ( ON ?auto_736335 ?auto_736336 ) ( ON ?auto_736334 ?auto_736335 ) ( ON ?auto_736333 ?auto_736334 ) ( ON ?auto_736332 ?auto_736333 ) ( ON ?auto_736331 ?auto_736332 ) ( ON ?auto_736330 ?auto_736331 ) ( ON ?auto_736329 ?auto_736330 ) ( CLEAR ?auto_736327 ) ( ON ?auto_736328 ?auto_736329 ) ( CLEAR ?auto_736328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_736326 ?auto_736327 ?auto_736328 )
      ( MAKE-14PILE ?auto_736326 ?auto_736327 ?auto_736328 ?auto_736329 ?auto_736330 ?auto_736331 ?auto_736332 ?auto_736333 ?auto_736334 ?auto_736335 ?auto_736336 ?auto_736337 ?auto_736338 ?auto_736339 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736384 - BLOCK
      ?auto_736385 - BLOCK
      ?auto_736386 - BLOCK
      ?auto_736387 - BLOCK
      ?auto_736388 - BLOCK
      ?auto_736389 - BLOCK
      ?auto_736390 - BLOCK
      ?auto_736391 - BLOCK
      ?auto_736392 - BLOCK
      ?auto_736393 - BLOCK
      ?auto_736394 - BLOCK
      ?auto_736395 - BLOCK
      ?auto_736396 - BLOCK
      ?auto_736397 - BLOCK
    )
    :vars
    (
      ?auto_736398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736397 ?auto_736398 ) ( ON-TABLE ?auto_736384 ) ( not ( = ?auto_736384 ?auto_736385 ) ) ( not ( = ?auto_736384 ?auto_736386 ) ) ( not ( = ?auto_736384 ?auto_736387 ) ) ( not ( = ?auto_736384 ?auto_736388 ) ) ( not ( = ?auto_736384 ?auto_736389 ) ) ( not ( = ?auto_736384 ?auto_736390 ) ) ( not ( = ?auto_736384 ?auto_736391 ) ) ( not ( = ?auto_736384 ?auto_736392 ) ) ( not ( = ?auto_736384 ?auto_736393 ) ) ( not ( = ?auto_736384 ?auto_736394 ) ) ( not ( = ?auto_736384 ?auto_736395 ) ) ( not ( = ?auto_736384 ?auto_736396 ) ) ( not ( = ?auto_736384 ?auto_736397 ) ) ( not ( = ?auto_736384 ?auto_736398 ) ) ( not ( = ?auto_736385 ?auto_736386 ) ) ( not ( = ?auto_736385 ?auto_736387 ) ) ( not ( = ?auto_736385 ?auto_736388 ) ) ( not ( = ?auto_736385 ?auto_736389 ) ) ( not ( = ?auto_736385 ?auto_736390 ) ) ( not ( = ?auto_736385 ?auto_736391 ) ) ( not ( = ?auto_736385 ?auto_736392 ) ) ( not ( = ?auto_736385 ?auto_736393 ) ) ( not ( = ?auto_736385 ?auto_736394 ) ) ( not ( = ?auto_736385 ?auto_736395 ) ) ( not ( = ?auto_736385 ?auto_736396 ) ) ( not ( = ?auto_736385 ?auto_736397 ) ) ( not ( = ?auto_736385 ?auto_736398 ) ) ( not ( = ?auto_736386 ?auto_736387 ) ) ( not ( = ?auto_736386 ?auto_736388 ) ) ( not ( = ?auto_736386 ?auto_736389 ) ) ( not ( = ?auto_736386 ?auto_736390 ) ) ( not ( = ?auto_736386 ?auto_736391 ) ) ( not ( = ?auto_736386 ?auto_736392 ) ) ( not ( = ?auto_736386 ?auto_736393 ) ) ( not ( = ?auto_736386 ?auto_736394 ) ) ( not ( = ?auto_736386 ?auto_736395 ) ) ( not ( = ?auto_736386 ?auto_736396 ) ) ( not ( = ?auto_736386 ?auto_736397 ) ) ( not ( = ?auto_736386 ?auto_736398 ) ) ( not ( = ?auto_736387 ?auto_736388 ) ) ( not ( = ?auto_736387 ?auto_736389 ) ) ( not ( = ?auto_736387 ?auto_736390 ) ) ( not ( = ?auto_736387 ?auto_736391 ) ) ( not ( = ?auto_736387 ?auto_736392 ) ) ( not ( = ?auto_736387 ?auto_736393 ) ) ( not ( = ?auto_736387 ?auto_736394 ) ) ( not ( = ?auto_736387 ?auto_736395 ) ) ( not ( = ?auto_736387 ?auto_736396 ) ) ( not ( = ?auto_736387 ?auto_736397 ) ) ( not ( = ?auto_736387 ?auto_736398 ) ) ( not ( = ?auto_736388 ?auto_736389 ) ) ( not ( = ?auto_736388 ?auto_736390 ) ) ( not ( = ?auto_736388 ?auto_736391 ) ) ( not ( = ?auto_736388 ?auto_736392 ) ) ( not ( = ?auto_736388 ?auto_736393 ) ) ( not ( = ?auto_736388 ?auto_736394 ) ) ( not ( = ?auto_736388 ?auto_736395 ) ) ( not ( = ?auto_736388 ?auto_736396 ) ) ( not ( = ?auto_736388 ?auto_736397 ) ) ( not ( = ?auto_736388 ?auto_736398 ) ) ( not ( = ?auto_736389 ?auto_736390 ) ) ( not ( = ?auto_736389 ?auto_736391 ) ) ( not ( = ?auto_736389 ?auto_736392 ) ) ( not ( = ?auto_736389 ?auto_736393 ) ) ( not ( = ?auto_736389 ?auto_736394 ) ) ( not ( = ?auto_736389 ?auto_736395 ) ) ( not ( = ?auto_736389 ?auto_736396 ) ) ( not ( = ?auto_736389 ?auto_736397 ) ) ( not ( = ?auto_736389 ?auto_736398 ) ) ( not ( = ?auto_736390 ?auto_736391 ) ) ( not ( = ?auto_736390 ?auto_736392 ) ) ( not ( = ?auto_736390 ?auto_736393 ) ) ( not ( = ?auto_736390 ?auto_736394 ) ) ( not ( = ?auto_736390 ?auto_736395 ) ) ( not ( = ?auto_736390 ?auto_736396 ) ) ( not ( = ?auto_736390 ?auto_736397 ) ) ( not ( = ?auto_736390 ?auto_736398 ) ) ( not ( = ?auto_736391 ?auto_736392 ) ) ( not ( = ?auto_736391 ?auto_736393 ) ) ( not ( = ?auto_736391 ?auto_736394 ) ) ( not ( = ?auto_736391 ?auto_736395 ) ) ( not ( = ?auto_736391 ?auto_736396 ) ) ( not ( = ?auto_736391 ?auto_736397 ) ) ( not ( = ?auto_736391 ?auto_736398 ) ) ( not ( = ?auto_736392 ?auto_736393 ) ) ( not ( = ?auto_736392 ?auto_736394 ) ) ( not ( = ?auto_736392 ?auto_736395 ) ) ( not ( = ?auto_736392 ?auto_736396 ) ) ( not ( = ?auto_736392 ?auto_736397 ) ) ( not ( = ?auto_736392 ?auto_736398 ) ) ( not ( = ?auto_736393 ?auto_736394 ) ) ( not ( = ?auto_736393 ?auto_736395 ) ) ( not ( = ?auto_736393 ?auto_736396 ) ) ( not ( = ?auto_736393 ?auto_736397 ) ) ( not ( = ?auto_736393 ?auto_736398 ) ) ( not ( = ?auto_736394 ?auto_736395 ) ) ( not ( = ?auto_736394 ?auto_736396 ) ) ( not ( = ?auto_736394 ?auto_736397 ) ) ( not ( = ?auto_736394 ?auto_736398 ) ) ( not ( = ?auto_736395 ?auto_736396 ) ) ( not ( = ?auto_736395 ?auto_736397 ) ) ( not ( = ?auto_736395 ?auto_736398 ) ) ( not ( = ?auto_736396 ?auto_736397 ) ) ( not ( = ?auto_736396 ?auto_736398 ) ) ( not ( = ?auto_736397 ?auto_736398 ) ) ( ON ?auto_736396 ?auto_736397 ) ( ON ?auto_736395 ?auto_736396 ) ( ON ?auto_736394 ?auto_736395 ) ( ON ?auto_736393 ?auto_736394 ) ( ON ?auto_736392 ?auto_736393 ) ( ON ?auto_736391 ?auto_736392 ) ( ON ?auto_736390 ?auto_736391 ) ( ON ?auto_736389 ?auto_736390 ) ( ON ?auto_736388 ?auto_736389 ) ( ON ?auto_736387 ?auto_736388 ) ( ON ?auto_736386 ?auto_736387 ) ( CLEAR ?auto_736384 ) ( ON ?auto_736385 ?auto_736386 ) ( CLEAR ?auto_736385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_736384 ?auto_736385 )
      ( MAKE-14PILE ?auto_736384 ?auto_736385 ?auto_736386 ?auto_736387 ?auto_736388 ?auto_736389 ?auto_736390 ?auto_736391 ?auto_736392 ?auto_736393 ?auto_736394 ?auto_736395 ?auto_736396 ?auto_736397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_736442 - BLOCK
      ?auto_736443 - BLOCK
      ?auto_736444 - BLOCK
      ?auto_736445 - BLOCK
      ?auto_736446 - BLOCK
      ?auto_736447 - BLOCK
      ?auto_736448 - BLOCK
      ?auto_736449 - BLOCK
      ?auto_736450 - BLOCK
      ?auto_736451 - BLOCK
      ?auto_736452 - BLOCK
      ?auto_736453 - BLOCK
      ?auto_736454 - BLOCK
      ?auto_736455 - BLOCK
    )
    :vars
    (
      ?auto_736456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736455 ?auto_736456 ) ( not ( = ?auto_736442 ?auto_736443 ) ) ( not ( = ?auto_736442 ?auto_736444 ) ) ( not ( = ?auto_736442 ?auto_736445 ) ) ( not ( = ?auto_736442 ?auto_736446 ) ) ( not ( = ?auto_736442 ?auto_736447 ) ) ( not ( = ?auto_736442 ?auto_736448 ) ) ( not ( = ?auto_736442 ?auto_736449 ) ) ( not ( = ?auto_736442 ?auto_736450 ) ) ( not ( = ?auto_736442 ?auto_736451 ) ) ( not ( = ?auto_736442 ?auto_736452 ) ) ( not ( = ?auto_736442 ?auto_736453 ) ) ( not ( = ?auto_736442 ?auto_736454 ) ) ( not ( = ?auto_736442 ?auto_736455 ) ) ( not ( = ?auto_736442 ?auto_736456 ) ) ( not ( = ?auto_736443 ?auto_736444 ) ) ( not ( = ?auto_736443 ?auto_736445 ) ) ( not ( = ?auto_736443 ?auto_736446 ) ) ( not ( = ?auto_736443 ?auto_736447 ) ) ( not ( = ?auto_736443 ?auto_736448 ) ) ( not ( = ?auto_736443 ?auto_736449 ) ) ( not ( = ?auto_736443 ?auto_736450 ) ) ( not ( = ?auto_736443 ?auto_736451 ) ) ( not ( = ?auto_736443 ?auto_736452 ) ) ( not ( = ?auto_736443 ?auto_736453 ) ) ( not ( = ?auto_736443 ?auto_736454 ) ) ( not ( = ?auto_736443 ?auto_736455 ) ) ( not ( = ?auto_736443 ?auto_736456 ) ) ( not ( = ?auto_736444 ?auto_736445 ) ) ( not ( = ?auto_736444 ?auto_736446 ) ) ( not ( = ?auto_736444 ?auto_736447 ) ) ( not ( = ?auto_736444 ?auto_736448 ) ) ( not ( = ?auto_736444 ?auto_736449 ) ) ( not ( = ?auto_736444 ?auto_736450 ) ) ( not ( = ?auto_736444 ?auto_736451 ) ) ( not ( = ?auto_736444 ?auto_736452 ) ) ( not ( = ?auto_736444 ?auto_736453 ) ) ( not ( = ?auto_736444 ?auto_736454 ) ) ( not ( = ?auto_736444 ?auto_736455 ) ) ( not ( = ?auto_736444 ?auto_736456 ) ) ( not ( = ?auto_736445 ?auto_736446 ) ) ( not ( = ?auto_736445 ?auto_736447 ) ) ( not ( = ?auto_736445 ?auto_736448 ) ) ( not ( = ?auto_736445 ?auto_736449 ) ) ( not ( = ?auto_736445 ?auto_736450 ) ) ( not ( = ?auto_736445 ?auto_736451 ) ) ( not ( = ?auto_736445 ?auto_736452 ) ) ( not ( = ?auto_736445 ?auto_736453 ) ) ( not ( = ?auto_736445 ?auto_736454 ) ) ( not ( = ?auto_736445 ?auto_736455 ) ) ( not ( = ?auto_736445 ?auto_736456 ) ) ( not ( = ?auto_736446 ?auto_736447 ) ) ( not ( = ?auto_736446 ?auto_736448 ) ) ( not ( = ?auto_736446 ?auto_736449 ) ) ( not ( = ?auto_736446 ?auto_736450 ) ) ( not ( = ?auto_736446 ?auto_736451 ) ) ( not ( = ?auto_736446 ?auto_736452 ) ) ( not ( = ?auto_736446 ?auto_736453 ) ) ( not ( = ?auto_736446 ?auto_736454 ) ) ( not ( = ?auto_736446 ?auto_736455 ) ) ( not ( = ?auto_736446 ?auto_736456 ) ) ( not ( = ?auto_736447 ?auto_736448 ) ) ( not ( = ?auto_736447 ?auto_736449 ) ) ( not ( = ?auto_736447 ?auto_736450 ) ) ( not ( = ?auto_736447 ?auto_736451 ) ) ( not ( = ?auto_736447 ?auto_736452 ) ) ( not ( = ?auto_736447 ?auto_736453 ) ) ( not ( = ?auto_736447 ?auto_736454 ) ) ( not ( = ?auto_736447 ?auto_736455 ) ) ( not ( = ?auto_736447 ?auto_736456 ) ) ( not ( = ?auto_736448 ?auto_736449 ) ) ( not ( = ?auto_736448 ?auto_736450 ) ) ( not ( = ?auto_736448 ?auto_736451 ) ) ( not ( = ?auto_736448 ?auto_736452 ) ) ( not ( = ?auto_736448 ?auto_736453 ) ) ( not ( = ?auto_736448 ?auto_736454 ) ) ( not ( = ?auto_736448 ?auto_736455 ) ) ( not ( = ?auto_736448 ?auto_736456 ) ) ( not ( = ?auto_736449 ?auto_736450 ) ) ( not ( = ?auto_736449 ?auto_736451 ) ) ( not ( = ?auto_736449 ?auto_736452 ) ) ( not ( = ?auto_736449 ?auto_736453 ) ) ( not ( = ?auto_736449 ?auto_736454 ) ) ( not ( = ?auto_736449 ?auto_736455 ) ) ( not ( = ?auto_736449 ?auto_736456 ) ) ( not ( = ?auto_736450 ?auto_736451 ) ) ( not ( = ?auto_736450 ?auto_736452 ) ) ( not ( = ?auto_736450 ?auto_736453 ) ) ( not ( = ?auto_736450 ?auto_736454 ) ) ( not ( = ?auto_736450 ?auto_736455 ) ) ( not ( = ?auto_736450 ?auto_736456 ) ) ( not ( = ?auto_736451 ?auto_736452 ) ) ( not ( = ?auto_736451 ?auto_736453 ) ) ( not ( = ?auto_736451 ?auto_736454 ) ) ( not ( = ?auto_736451 ?auto_736455 ) ) ( not ( = ?auto_736451 ?auto_736456 ) ) ( not ( = ?auto_736452 ?auto_736453 ) ) ( not ( = ?auto_736452 ?auto_736454 ) ) ( not ( = ?auto_736452 ?auto_736455 ) ) ( not ( = ?auto_736452 ?auto_736456 ) ) ( not ( = ?auto_736453 ?auto_736454 ) ) ( not ( = ?auto_736453 ?auto_736455 ) ) ( not ( = ?auto_736453 ?auto_736456 ) ) ( not ( = ?auto_736454 ?auto_736455 ) ) ( not ( = ?auto_736454 ?auto_736456 ) ) ( not ( = ?auto_736455 ?auto_736456 ) ) ( ON ?auto_736454 ?auto_736455 ) ( ON ?auto_736453 ?auto_736454 ) ( ON ?auto_736452 ?auto_736453 ) ( ON ?auto_736451 ?auto_736452 ) ( ON ?auto_736450 ?auto_736451 ) ( ON ?auto_736449 ?auto_736450 ) ( ON ?auto_736448 ?auto_736449 ) ( ON ?auto_736447 ?auto_736448 ) ( ON ?auto_736446 ?auto_736447 ) ( ON ?auto_736445 ?auto_736446 ) ( ON ?auto_736444 ?auto_736445 ) ( ON ?auto_736443 ?auto_736444 ) ( ON ?auto_736442 ?auto_736443 ) ( CLEAR ?auto_736442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_736442 )
      ( MAKE-14PILE ?auto_736442 ?auto_736443 ?auto_736444 ?auto_736445 ?auto_736446 ?auto_736447 ?auto_736448 ?auto_736449 ?auto_736450 ?auto_736451 ?auto_736452 ?auto_736453 ?auto_736454 ?auto_736455 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736501 - BLOCK
      ?auto_736502 - BLOCK
      ?auto_736503 - BLOCK
      ?auto_736504 - BLOCK
      ?auto_736505 - BLOCK
      ?auto_736506 - BLOCK
      ?auto_736507 - BLOCK
      ?auto_736508 - BLOCK
      ?auto_736509 - BLOCK
      ?auto_736510 - BLOCK
      ?auto_736511 - BLOCK
      ?auto_736512 - BLOCK
      ?auto_736513 - BLOCK
      ?auto_736514 - BLOCK
      ?auto_736515 - BLOCK
    )
    :vars
    (
      ?auto_736516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_736514 ) ( ON ?auto_736515 ?auto_736516 ) ( CLEAR ?auto_736515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_736501 ) ( ON ?auto_736502 ?auto_736501 ) ( ON ?auto_736503 ?auto_736502 ) ( ON ?auto_736504 ?auto_736503 ) ( ON ?auto_736505 ?auto_736504 ) ( ON ?auto_736506 ?auto_736505 ) ( ON ?auto_736507 ?auto_736506 ) ( ON ?auto_736508 ?auto_736507 ) ( ON ?auto_736509 ?auto_736508 ) ( ON ?auto_736510 ?auto_736509 ) ( ON ?auto_736511 ?auto_736510 ) ( ON ?auto_736512 ?auto_736511 ) ( ON ?auto_736513 ?auto_736512 ) ( ON ?auto_736514 ?auto_736513 ) ( not ( = ?auto_736501 ?auto_736502 ) ) ( not ( = ?auto_736501 ?auto_736503 ) ) ( not ( = ?auto_736501 ?auto_736504 ) ) ( not ( = ?auto_736501 ?auto_736505 ) ) ( not ( = ?auto_736501 ?auto_736506 ) ) ( not ( = ?auto_736501 ?auto_736507 ) ) ( not ( = ?auto_736501 ?auto_736508 ) ) ( not ( = ?auto_736501 ?auto_736509 ) ) ( not ( = ?auto_736501 ?auto_736510 ) ) ( not ( = ?auto_736501 ?auto_736511 ) ) ( not ( = ?auto_736501 ?auto_736512 ) ) ( not ( = ?auto_736501 ?auto_736513 ) ) ( not ( = ?auto_736501 ?auto_736514 ) ) ( not ( = ?auto_736501 ?auto_736515 ) ) ( not ( = ?auto_736501 ?auto_736516 ) ) ( not ( = ?auto_736502 ?auto_736503 ) ) ( not ( = ?auto_736502 ?auto_736504 ) ) ( not ( = ?auto_736502 ?auto_736505 ) ) ( not ( = ?auto_736502 ?auto_736506 ) ) ( not ( = ?auto_736502 ?auto_736507 ) ) ( not ( = ?auto_736502 ?auto_736508 ) ) ( not ( = ?auto_736502 ?auto_736509 ) ) ( not ( = ?auto_736502 ?auto_736510 ) ) ( not ( = ?auto_736502 ?auto_736511 ) ) ( not ( = ?auto_736502 ?auto_736512 ) ) ( not ( = ?auto_736502 ?auto_736513 ) ) ( not ( = ?auto_736502 ?auto_736514 ) ) ( not ( = ?auto_736502 ?auto_736515 ) ) ( not ( = ?auto_736502 ?auto_736516 ) ) ( not ( = ?auto_736503 ?auto_736504 ) ) ( not ( = ?auto_736503 ?auto_736505 ) ) ( not ( = ?auto_736503 ?auto_736506 ) ) ( not ( = ?auto_736503 ?auto_736507 ) ) ( not ( = ?auto_736503 ?auto_736508 ) ) ( not ( = ?auto_736503 ?auto_736509 ) ) ( not ( = ?auto_736503 ?auto_736510 ) ) ( not ( = ?auto_736503 ?auto_736511 ) ) ( not ( = ?auto_736503 ?auto_736512 ) ) ( not ( = ?auto_736503 ?auto_736513 ) ) ( not ( = ?auto_736503 ?auto_736514 ) ) ( not ( = ?auto_736503 ?auto_736515 ) ) ( not ( = ?auto_736503 ?auto_736516 ) ) ( not ( = ?auto_736504 ?auto_736505 ) ) ( not ( = ?auto_736504 ?auto_736506 ) ) ( not ( = ?auto_736504 ?auto_736507 ) ) ( not ( = ?auto_736504 ?auto_736508 ) ) ( not ( = ?auto_736504 ?auto_736509 ) ) ( not ( = ?auto_736504 ?auto_736510 ) ) ( not ( = ?auto_736504 ?auto_736511 ) ) ( not ( = ?auto_736504 ?auto_736512 ) ) ( not ( = ?auto_736504 ?auto_736513 ) ) ( not ( = ?auto_736504 ?auto_736514 ) ) ( not ( = ?auto_736504 ?auto_736515 ) ) ( not ( = ?auto_736504 ?auto_736516 ) ) ( not ( = ?auto_736505 ?auto_736506 ) ) ( not ( = ?auto_736505 ?auto_736507 ) ) ( not ( = ?auto_736505 ?auto_736508 ) ) ( not ( = ?auto_736505 ?auto_736509 ) ) ( not ( = ?auto_736505 ?auto_736510 ) ) ( not ( = ?auto_736505 ?auto_736511 ) ) ( not ( = ?auto_736505 ?auto_736512 ) ) ( not ( = ?auto_736505 ?auto_736513 ) ) ( not ( = ?auto_736505 ?auto_736514 ) ) ( not ( = ?auto_736505 ?auto_736515 ) ) ( not ( = ?auto_736505 ?auto_736516 ) ) ( not ( = ?auto_736506 ?auto_736507 ) ) ( not ( = ?auto_736506 ?auto_736508 ) ) ( not ( = ?auto_736506 ?auto_736509 ) ) ( not ( = ?auto_736506 ?auto_736510 ) ) ( not ( = ?auto_736506 ?auto_736511 ) ) ( not ( = ?auto_736506 ?auto_736512 ) ) ( not ( = ?auto_736506 ?auto_736513 ) ) ( not ( = ?auto_736506 ?auto_736514 ) ) ( not ( = ?auto_736506 ?auto_736515 ) ) ( not ( = ?auto_736506 ?auto_736516 ) ) ( not ( = ?auto_736507 ?auto_736508 ) ) ( not ( = ?auto_736507 ?auto_736509 ) ) ( not ( = ?auto_736507 ?auto_736510 ) ) ( not ( = ?auto_736507 ?auto_736511 ) ) ( not ( = ?auto_736507 ?auto_736512 ) ) ( not ( = ?auto_736507 ?auto_736513 ) ) ( not ( = ?auto_736507 ?auto_736514 ) ) ( not ( = ?auto_736507 ?auto_736515 ) ) ( not ( = ?auto_736507 ?auto_736516 ) ) ( not ( = ?auto_736508 ?auto_736509 ) ) ( not ( = ?auto_736508 ?auto_736510 ) ) ( not ( = ?auto_736508 ?auto_736511 ) ) ( not ( = ?auto_736508 ?auto_736512 ) ) ( not ( = ?auto_736508 ?auto_736513 ) ) ( not ( = ?auto_736508 ?auto_736514 ) ) ( not ( = ?auto_736508 ?auto_736515 ) ) ( not ( = ?auto_736508 ?auto_736516 ) ) ( not ( = ?auto_736509 ?auto_736510 ) ) ( not ( = ?auto_736509 ?auto_736511 ) ) ( not ( = ?auto_736509 ?auto_736512 ) ) ( not ( = ?auto_736509 ?auto_736513 ) ) ( not ( = ?auto_736509 ?auto_736514 ) ) ( not ( = ?auto_736509 ?auto_736515 ) ) ( not ( = ?auto_736509 ?auto_736516 ) ) ( not ( = ?auto_736510 ?auto_736511 ) ) ( not ( = ?auto_736510 ?auto_736512 ) ) ( not ( = ?auto_736510 ?auto_736513 ) ) ( not ( = ?auto_736510 ?auto_736514 ) ) ( not ( = ?auto_736510 ?auto_736515 ) ) ( not ( = ?auto_736510 ?auto_736516 ) ) ( not ( = ?auto_736511 ?auto_736512 ) ) ( not ( = ?auto_736511 ?auto_736513 ) ) ( not ( = ?auto_736511 ?auto_736514 ) ) ( not ( = ?auto_736511 ?auto_736515 ) ) ( not ( = ?auto_736511 ?auto_736516 ) ) ( not ( = ?auto_736512 ?auto_736513 ) ) ( not ( = ?auto_736512 ?auto_736514 ) ) ( not ( = ?auto_736512 ?auto_736515 ) ) ( not ( = ?auto_736512 ?auto_736516 ) ) ( not ( = ?auto_736513 ?auto_736514 ) ) ( not ( = ?auto_736513 ?auto_736515 ) ) ( not ( = ?auto_736513 ?auto_736516 ) ) ( not ( = ?auto_736514 ?auto_736515 ) ) ( not ( = ?auto_736514 ?auto_736516 ) ) ( not ( = ?auto_736515 ?auto_736516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_736515 ?auto_736516 )
      ( !STACK ?auto_736515 ?auto_736514 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736563 - BLOCK
      ?auto_736564 - BLOCK
      ?auto_736565 - BLOCK
      ?auto_736566 - BLOCK
      ?auto_736567 - BLOCK
      ?auto_736568 - BLOCK
      ?auto_736569 - BLOCK
      ?auto_736570 - BLOCK
      ?auto_736571 - BLOCK
      ?auto_736572 - BLOCK
      ?auto_736573 - BLOCK
      ?auto_736574 - BLOCK
      ?auto_736575 - BLOCK
      ?auto_736576 - BLOCK
      ?auto_736577 - BLOCK
    )
    :vars
    (
      ?auto_736578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736577 ?auto_736578 ) ( ON-TABLE ?auto_736563 ) ( ON ?auto_736564 ?auto_736563 ) ( ON ?auto_736565 ?auto_736564 ) ( ON ?auto_736566 ?auto_736565 ) ( ON ?auto_736567 ?auto_736566 ) ( ON ?auto_736568 ?auto_736567 ) ( ON ?auto_736569 ?auto_736568 ) ( ON ?auto_736570 ?auto_736569 ) ( ON ?auto_736571 ?auto_736570 ) ( ON ?auto_736572 ?auto_736571 ) ( ON ?auto_736573 ?auto_736572 ) ( ON ?auto_736574 ?auto_736573 ) ( ON ?auto_736575 ?auto_736574 ) ( not ( = ?auto_736563 ?auto_736564 ) ) ( not ( = ?auto_736563 ?auto_736565 ) ) ( not ( = ?auto_736563 ?auto_736566 ) ) ( not ( = ?auto_736563 ?auto_736567 ) ) ( not ( = ?auto_736563 ?auto_736568 ) ) ( not ( = ?auto_736563 ?auto_736569 ) ) ( not ( = ?auto_736563 ?auto_736570 ) ) ( not ( = ?auto_736563 ?auto_736571 ) ) ( not ( = ?auto_736563 ?auto_736572 ) ) ( not ( = ?auto_736563 ?auto_736573 ) ) ( not ( = ?auto_736563 ?auto_736574 ) ) ( not ( = ?auto_736563 ?auto_736575 ) ) ( not ( = ?auto_736563 ?auto_736576 ) ) ( not ( = ?auto_736563 ?auto_736577 ) ) ( not ( = ?auto_736563 ?auto_736578 ) ) ( not ( = ?auto_736564 ?auto_736565 ) ) ( not ( = ?auto_736564 ?auto_736566 ) ) ( not ( = ?auto_736564 ?auto_736567 ) ) ( not ( = ?auto_736564 ?auto_736568 ) ) ( not ( = ?auto_736564 ?auto_736569 ) ) ( not ( = ?auto_736564 ?auto_736570 ) ) ( not ( = ?auto_736564 ?auto_736571 ) ) ( not ( = ?auto_736564 ?auto_736572 ) ) ( not ( = ?auto_736564 ?auto_736573 ) ) ( not ( = ?auto_736564 ?auto_736574 ) ) ( not ( = ?auto_736564 ?auto_736575 ) ) ( not ( = ?auto_736564 ?auto_736576 ) ) ( not ( = ?auto_736564 ?auto_736577 ) ) ( not ( = ?auto_736564 ?auto_736578 ) ) ( not ( = ?auto_736565 ?auto_736566 ) ) ( not ( = ?auto_736565 ?auto_736567 ) ) ( not ( = ?auto_736565 ?auto_736568 ) ) ( not ( = ?auto_736565 ?auto_736569 ) ) ( not ( = ?auto_736565 ?auto_736570 ) ) ( not ( = ?auto_736565 ?auto_736571 ) ) ( not ( = ?auto_736565 ?auto_736572 ) ) ( not ( = ?auto_736565 ?auto_736573 ) ) ( not ( = ?auto_736565 ?auto_736574 ) ) ( not ( = ?auto_736565 ?auto_736575 ) ) ( not ( = ?auto_736565 ?auto_736576 ) ) ( not ( = ?auto_736565 ?auto_736577 ) ) ( not ( = ?auto_736565 ?auto_736578 ) ) ( not ( = ?auto_736566 ?auto_736567 ) ) ( not ( = ?auto_736566 ?auto_736568 ) ) ( not ( = ?auto_736566 ?auto_736569 ) ) ( not ( = ?auto_736566 ?auto_736570 ) ) ( not ( = ?auto_736566 ?auto_736571 ) ) ( not ( = ?auto_736566 ?auto_736572 ) ) ( not ( = ?auto_736566 ?auto_736573 ) ) ( not ( = ?auto_736566 ?auto_736574 ) ) ( not ( = ?auto_736566 ?auto_736575 ) ) ( not ( = ?auto_736566 ?auto_736576 ) ) ( not ( = ?auto_736566 ?auto_736577 ) ) ( not ( = ?auto_736566 ?auto_736578 ) ) ( not ( = ?auto_736567 ?auto_736568 ) ) ( not ( = ?auto_736567 ?auto_736569 ) ) ( not ( = ?auto_736567 ?auto_736570 ) ) ( not ( = ?auto_736567 ?auto_736571 ) ) ( not ( = ?auto_736567 ?auto_736572 ) ) ( not ( = ?auto_736567 ?auto_736573 ) ) ( not ( = ?auto_736567 ?auto_736574 ) ) ( not ( = ?auto_736567 ?auto_736575 ) ) ( not ( = ?auto_736567 ?auto_736576 ) ) ( not ( = ?auto_736567 ?auto_736577 ) ) ( not ( = ?auto_736567 ?auto_736578 ) ) ( not ( = ?auto_736568 ?auto_736569 ) ) ( not ( = ?auto_736568 ?auto_736570 ) ) ( not ( = ?auto_736568 ?auto_736571 ) ) ( not ( = ?auto_736568 ?auto_736572 ) ) ( not ( = ?auto_736568 ?auto_736573 ) ) ( not ( = ?auto_736568 ?auto_736574 ) ) ( not ( = ?auto_736568 ?auto_736575 ) ) ( not ( = ?auto_736568 ?auto_736576 ) ) ( not ( = ?auto_736568 ?auto_736577 ) ) ( not ( = ?auto_736568 ?auto_736578 ) ) ( not ( = ?auto_736569 ?auto_736570 ) ) ( not ( = ?auto_736569 ?auto_736571 ) ) ( not ( = ?auto_736569 ?auto_736572 ) ) ( not ( = ?auto_736569 ?auto_736573 ) ) ( not ( = ?auto_736569 ?auto_736574 ) ) ( not ( = ?auto_736569 ?auto_736575 ) ) ( not ( = ?auto_736569 ?auto_736576 ) ) ( not ( = ?auto_736569 ?auto_736577 ) ) ( not ( = ?auto_736569 ?auto_736578 ) ) ( not ( = ?auto_736570 ?auto_736571 ) ) ( not ( = ?auto_736570 ?auto_736572 ) ) ( not ( = ?auto_736570 ?auto_736573 ) ) ( not ( = ?auto_736570 ?auto_736574 ) ) ( not ( = ?auto_736570 ?auto_736575 ) ) ( not ( = ?auto_736570 ?auto_736576 ) ) ( not ( = ?auto_736570 ?auto_736577 ) ) ( not ( = ?auto_736570 ?auto_736578 ) ) ( not ( = ?auto_736571 ?auto_736572 ) ) ( not ( = ?auto_736571 ?auto_736573 ) ) ( not ( = ?auto_736571 ?auto_736574 ) ) ( not ( = ?auto_736571 ?auto_736575 ) ) ( not ( = ?auto_736571 ?auto_736576 ) ) ( not ( = ?auto_736571 ?auto_736577 ) ) ( not ( = ?auto_736571 ?auto_736578 ) ) ( not ( = ?auto_736572 ?auto_736573 ) ) ( not ( = ?auto_736572 ?auto_736574 ) ) ( not ( = ?auto_736572 ?auto_736575 ) ) ( not ( = ?auto_736572 ?auto_736576 ) ) ( not ( = ?auto_736572 ?auto_736577 ) ) ( not ( = ?auto_736572 ?auto_736578 ) ) ( not ( = ?auto_736573 ?auto_736574 ) ) ( not ( = ?auto_736573 ?auto_736575 ) ) ( not ( = ?auto_736573 ?auto_736576 ) ) ( not ( = ?auto_736573 ?auto_736577 ) ) ( not ( = ?auto_736573 ?auto_736578 ) ) ( not ( = ?auto_736574 ?auto_736575 ) ) ( not ( = ?auto_736574 ?auto_736576 ) ) ( not ( = ?auto_736574 ?auto_736577 ) ) ( not ( = ?auto_736574 ?auto_736578 ) ) ( not ( = ?auto_736575 ?auto_736576 ) ) ( not ( = ?auto_736575 ?auto_736577 ) ) ( not ( = ?auto_736575 ?auto_736578 ) ) ( not ( = ?auto_736576 ?auto_736577 ) ) ( not ( = ?auto_736576 ?auto_736578 ) ) ( not ( = ?auto_736577 ?auto_736578 ) ) ( CLEAR ?auto_736575 ) ( ON ?auto_736576 ?auto_736577 ) ( CLEAR ?auto_736576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_736563 ?auto_736564 ?auto_736565 ?auto_736566 ?auto_736567 ?auto_736568 ?auto_736569 ?auto_736570 ?auto_736571 ?auto_736572 ?auto_736573 ?auto_736574 ?auto_736575 ?auto_736576 )
      ( MAKE-15PILE ?auto_736563 ?auto_736564 ?auto_736565 ?auto_736566 ?auto_736567 ?auto_736568 ?auto_736569 ?auto_736570 ?auto_736571 ?auto_736572 ?auto_736573 ?auto_736574 ?auto_736575 ?auto_736576 ?auto_736577 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736625 - BLOCK
      ?auto_736626 - BLOCK
      ?auto_736627 - BLOCK
      ?auto_736628 - BLOCK
      ?auto_736629 - BLOCK
      ?auto_736630 - BLOCK
      ?auto_736631 - BLOCK
      ?auto_736632 - BLOCK
      ?auto_736633 - BLOCK
      ?auto_736634 - BLOCK
      ?auto_736635 - BLOCK
      ?auto_736636 - BLOCK
      ?auto_736637 - BLOCK
      ?auto_736638 - BLOCK
      ?auto_736639 - BLOCK
    )
    :vars
    (
      ?auto_736640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736639 ?auto_736640 ) ( ON-TABLE ?auto_736625 ) ( ON ?auto_736626 ?auto_736625 ) ( ON ?auto_736627 ?auto_736626 ) ( ON ?auto_736628 ?auto_736627 ) ( ON ?auto_736629 ?auto_736628 ) ( ON ?auto_736630 ?auto_736629 ) ( ON ?auto_736631 ?auto_736630 ) ( ON ?auto_736632 ?auto_736631 ) ( ON ?auto_736633 ?auto_736632 ) ( ON ?auto_736634 ?auto_736633 ) ( ON ?auto_736635 ?auto_736634 ) ( ON ?auto_736636 ?auto_736635 ) ( not ( = ?auto_736625 ?auto_736626 ) ) ( not ( = ?auto_736625 ?auto_736627 ) ) ( not ( = ?auto_736625 ?auto_736628 ) ) ( not ( = ?auto_736625 ?auto_736629 ) ) ( not ( = ?auto_736625 ?auto_736630 ) ) ( not ( = ?auto_736625 ?auto_736631 ) ) ( not ( = ?auto_736625 ?auto_736632 ) ) ( not ( = ?auto_736625 ?auto_736633 ) ) ( not ( = ?auto_736625 ?auto_736634 ) ) ( not ( = ?auto_736625 ?auto_736635 ) ) ( not ( = ?auto_736625 ?auto_736636 ) ) ( not ( = ?auto_736625 ?auto_736637 ) ) ( not ( = ?auto_736625 ?auto_736638 ) ) ( not ( = ?auto_736625 ?auto_736639 ) ) ( not ( = ?auto_736625 ?auto_736640 ) ) ( not ( = ?auto_736626 ?auto_736627 ) ) ( not ( = ?auto_736626 ?auto_736628 ) ) ( not ( = ?auto_736626 ?auto_736629 ) ) ( not ( = ?auto_736626 ?auto_736630 ) ) ( not ( = ?auto_736626 ?auto_736631 ) ) ( not ( = ?auto_736626 ?auto_736632 ) ) ( not ( = ?auto_736626 ?auto_736633 ) ) ( not ( = ?auto_736626 ?auto_736634 ) ) ( not ( = ?auto_736626 ?auto_736635 ) ) ( not ( = ?auto_736626 ?auto_736636 ) ) ( not ( = ?auto_736626 ?auto_736637 ) ) ( not ( = ?auto_736626 ?auto_736638 ) ) ( not ( = ?auto_736626 ?auto_736639 ) ) ( not ( = ?auto_736626 ?auto_736640 ) ) ( not ( = ?auto_736627 ?auto_736628 ) ) ( not ( = ?auto_736627 ?auto_736629 ) ) ( not ( = ?auto_736627 ?auto_736630 ) ) ( not ( = ?auto_736627 ?auto_736631 ) ) ( not ( = ?auto_736627 ?auto_736632 ) ) ( not ( = ?auto_736627 ?auto_736633 ) ) ( not ( = ?auto_736627 ?auto_736634 ) ) ( not ( = ?auto_736627 ?auto_736635 ) ) ( not ( = ?auto_736627 ?auto_736636 ) ) ( not ( = ?auto_736627 ?auto_736637 ) ) ( not ( = ?auto_736627 ?auto_736638 ) ) ( not ( = ?auto_736627 ?auto_736639 ) ) ( not ( = ?auto_736627 ?auto_736640 ) ) ( not ( = ?auto_736628 ?auto_736629 ) ) ( not ( = ?auto_736628 ?auto_736630 ) ) ( not ( = ?auto_736628 ?auto_736631 ) ) ( not ( = ?auto_736628 ?auto_736632 ) ) ( not ( = ?auto_736628 ?auto_736633 ) ) ( not ( = ?auto_736628 ?auto_736634 ) ) ( not ( = ?auto_736628 ?auto_736635 ) ) ( not ( = ?auto_736628 ?auto_736636 ) ) ( not ( = ?auto_736628 ?auto_736637 ) ) ( not ( = ?auto_736628 ?auto_736638 ) ) ( not ( = ?auto_736628 ?auto_736639 ) ) ( not ( = ?auto_736628 ?auto_736640 ) ) ( not ( = ?auto_736629 ?auto_736630 ) ) ( not ( = ?auto_736629 ?auto_736631 ) ) ( not ( = ?auto_736629 ?auto_736632 ) ) ( not ( = ?auto_736629 ?auto_736633 ) ) ( not ( = ?auto_736629 ?auto_736634 ) ) ( not ( = ?auto_736629 ?auto_736635 ) ) ( not ( = ?auto_736629 ?auto_736636 ) ) ( not ( = ?auto_736629 ?auto_736637 ) ) ( not ( = ?auto_736629 ?auto_736638 ) ) ( not ( = ?auto_736629 ?auto_736639 ) ) ( not ( = ?auto_736629 ?auto_736640 ) ) ( not ( = ?auto_736630 ?auto_736631 ) ) ( not ( = ?auto_736630 ?auto_736632 ) ) ( not ( = ?auto_736630 ?auto_736633 ) ) ( not ( = ?auto_736630 ?auto_736634 ) ) ( not ( = ?auto_736630 ?auto_736635 ) ) ( not ( = ?auto_736630 ?auto_736636 ) ) ( not ( = ?auto_736630 ?auto_736637 ) ) ( not ( = ?auto_736630 ?auto_736638 ) ) ( not ( = ?auto_736630 ?auto_736639 ) ) ( not ( = ?auto_736630 ?auto_736640 ) ) ( not ( = ?auto_736631 ?auto_736632 ) ) ( not ( = ?auto_736631 ?auto_736633 ) ) ( not ( = ?auto_736631 ?auto_736634 ) ) ( not ( = ?auto_736631 ?auto_736635 ) ) ( not ( = ?auto_736631 ?auto_736636 ) ) ( not ( = ?auto_736631 ?auto_736637 ) ) ( not ( = ?auto_736631 ?auto_736638 ) ) ( not ( = ?auto_736631 ?auto_736639 ) ) ( not ( = ?auto_736631 ?auto_736640 ) ) ( not ( = ?auto_736632 ?auto_736633 ) ) ( not ( = ?auto_736632 ?auto_736634 ) ) ( not ( = ?auto_736632 ?auto_736635 ) ) ( not ( = ?auto_736632 ?auto_736636 ) ) ( not ( = ?auto_736632 ?auto_736637 ) ) ( not ( = ?auto_736632 ?auto_736638 ) ) ( not ( = ?auto_736632 ?auto_736639 ) ) ( not ( = ?auto_736632 ?auto_736640 ) ) ( not ( = ?auto_736633 ?auto_736634 ) ) ( not ( = ?auto_736633 ?auto_736635 ) ) ( not ( = ?auto_736633 ?auto_736636 ) ) ( not ( = ?auto_736633 ?auto_736637 ) ) ( not ( = ?auto_736633 ?auto_736638 ) ) ( not ( = ?auto_736633 ?auto_736639 ) ) ( not ( = ?auto_736633 ?auto_736640 ) ) ( not ( = ?auto_736634 ?auto_736635 ) ) ( not ( = ?auto_736634 ?auto_736636 ) ) ( not ( = ?auto_736634 ?auto_736637 ) ) ( not ( = ?auto_736634 ?auto_736638 ) ) ( not ( = ?auto_736634 ?auto_736639 ) ) ( not ( = ?auto_736634 ?auto_736640 ) ) ( not ( = ?auto_736635 ?auto_736636 ) ) ( not ( = ?auto_736635 ?auto_736637 ) ) ( not ( = ?auto_736635 ?auto_736638 ) ) ( not ( = ?auto_736635 ?auto_736639 ) ) ( not ( = ?auto_736635 ?auto_736640 ) ) ( not ( = ?auto_736636 ?auto_736637 ) ) ( not ( = ?auto_736636 ?auto_736638 ) ) ( not ( = ?auto_736636 ?auto_736639 ) ) ( not ( = ?auto_736636 ?auto_736640 ) ) ( not ( = ?auto_736637 ?auto_736638 ) ) ( not ( = ?auto_736637 ?auto_736639 ) ) ( not ( = ?auto_736637 ?auto_736640 ) ) ( not ( = ?auto_736638 ?auto_736639 ) ) ( not ( = ?auto_736638 ?auto_736640 ) ) ( not ( = ?auto_736639 ?auto_736640 ) ) ( ON ?auto_736638 ?auto_736639 ) ( CLEAR ?auto_736636 ) ( ON ?auto_736637 ?auto_736638 ) ( CLEAR ?auto_736637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_736625 ?auto_736626 ?auto_736627 ?auto_736628 ?auto_736629 ?auto_736630 ?auto_736631 ?auto_736632 ?auto_736633 ?auto_736634 ?auto_736635 ?auto_736636 ?auto_736637 )
      ( MAKE-15PILE ?auto_736625 ?auto_736626 ?auto_736627 ?auto_736628 ?auto_736629 ?auto_736630 ?auto_736631 ?auto_736632 ?auto_736633 ?auto_736634 ?auto_736635 ?auto_736636 ?auto_736637 ?auto_736638 ?auto_736639 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736687 - BLOCK
      ?auto_736688 - BLOCK
      ?auto_736689 - BLOCK
      ?auto_736690 - BLOCK
      ?auto_736691 - BLOCK
      ?auto_736692 - BLOCK
      ?auto_736693 - BLOCK
      ?auto_736694 - BLOCK
      ?auto_736695 - BLOCK
      ?auto_736696 - BLOCK
      ?auto_736697 - BLOCK
      ?auto_736698 - BLOCK
      ?auto_736699 - BLOCK
      ?auto_736700 - BLOCK
      ?auto_736701 - BLOCK
    )
    :vars
    (
      ?auto_736702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736701 ?auto_736702 ) ( ON-TABLE ?auto_736687 ) ( ON ?auto_736688 ?auto_736687 ) ( ON ?auto_736689 ?auto_736688 ) ( ON ?auto_736690 ?auto_736689 ) ( ON ?auto_736691 ?auto_736690 ) ( ON ?auto_736692 ?auto_736691 ) ( ON ?auto_736693 ?auto_736692 ) ( ON ?auto_736694 ?auto_736693 ) ( ON ?auto_736695 ?auto_736694 ) ( ON ?auto_736696 ?auto_736695 ) ( ON ?auto_736697 ?auto_736696 ) ( not ( = ?auto_736687 ?auto_736688 ) ) ( not ( = ?auto_736687 ?auto_736689 ) ) ( not ( = ?auto_736687 ?auto_736690 ) ) ( not ( = ?auto_736687 ?auto_736691 ) ) ( not ( = ?auto_736687 ?auto_736692 ) ) ( not ( = ?auto_736687 ?auto_736693 ) ) ( not ( = ?auto_736687 ?auto_736694 ) ) ( not ( = ?auto_736687 ?auto_736695 ) ) ( not ( = ?auto_736687 ?auto_736696 ) ) ( not ( = ?auto_736687 ?auto_736697 ) ) ( not ( = ?auto_736687 ?auto_736698 ) ) ( not ( = ?auto_736687 ?auto_736699 ) ) ( not ( = ?auto_736687 ?auto_736700 ) ) ( not ( = ?auto_736687 ?auto_736701 ) ) ( not ( = ?auto_736687 ?auto_736702 ) ) ( not ( = ?auto_736688 ?auto_736689 ) ) ( not ( = ?auto_736688 ?auto_736690 ) ) ( not ( = ?auto_736688 ?auto_736691 ) ) ( not ( = ?auto_736688 ?auto_736692 ) ) ( not ( = ?auto_736688 ?auto_736693 ) ) ( not ( = ?auto_736688 ?auto_736694 ) ) ( not ( = ?auto_736688 ?auto_736695 ) ) ( not ( = ?auto_736688 ?auto_736696 ) ) ( not ( = ?auto_736688 ?auto_736697 ) ) ( not ( = ?auto_736688 ?auto_736698 ) ) ( not ( = ?auto_736688 ?auto_736699 ) ) ( not ( = ?auto_736688 ?auto_736700 ) ) ( not ( = ?auto_736688 ?auto_736701 ) ) ( not ( = ?auto_736688 ?auto_736702 ) ) ( not ( = ?auto_736689 ?auto_736690 ) ) ( not ( = ?auto_736689 ?auto_736691 ) ) ( not ( = ?auto_736689 ?auto_736692 ) ) ( not ( = ?auto_736689 ?auto_736693 ) ) ( not ( = ?auto_736689 ?auto_736694 ) ) ( not ( = ?auto_736689 ?auto_736695 ) ) ( not ( = ?auto_736689 ?auto_736696 ) ) ( not ( = ?auto_736689 ?auto_736697 ) ) ( not ( = ?auto_736689 ?auto_736698 ) ) ( not ( = ?auto_736689 ?auto_736699 ) ) ( not ( = ?auto_736689 ?auto_736700 ) ) ( not ( = ?auto_736689 ?auto_736701 ) ) ( not ( = ?auto_736689 ?auto_736702 ) ) ( not ( = ?auto_736690 ?auto_736691 ) ) ( not ( = ?auto_736690 ?auto_736692 ) ) ( not ( = ?auto_736690 ?auto_736693 ) ) ( not ( = ?auto_736690 ?auto_736694 ) ) ( not ( = ?auto_736690 ?auto_736695 ) ) ( not ( = ?auto_736690 ?auto_736696 ) ) ( not ( = ?auto_736690 ?auto_736697 ) ) ( not ( = ?auto_736690 ?auto_736698 ) ) ( not ( = ?auto_736690 ?auto_736699 ) ) ( not ( = ?auto_736690 ?auto_736700 ) ) ( not ( = ?auto_736690 ?auto_736701 ) ) ( not ( = ?auto_736690 ?auto_736702 ) ) ( not ( = ?auto_736691 ?auto_736692 ) ) ( not ( = ?auto_736691 ?auto_736693 ) ) ( not ( = ?auto_736691 ?auto_736694 ) ) ( not ( = ?auto_736691 ?auto_736695 ) ) ( not ( = ?auto_736691 ?auto_736696 ) ) ( not ( = ?auto_736691 ?auto_736697 ) ) ( not ( = ?auto_736691 ?auto_736698 ) ) ( not ( = ?auto_736691 ?auto_736699 ) ) ( not ( = ?auto_736691 ?auto_736700 ) ) ( not ( = ?auto_736691 ?auto_736701 ) ) ( not ( = ?auto_736691 ?auto_736702 ) ) ( not ( = ?auto_736692 ?auto_736693 ) ) ( not ( = ?auto_736692 ?auto_736694 ) ) ( not ( = ?auto_736692 ?auto_736695 ) ) ( not ( = ?auto_736692 ?auto_736696 ) ) ( not ( = ?auto_736692 ?auto_736697 ) ) ( not ( = ?auto_736692 ?auto_736698 ) ) ( not ( = ?auto_736692 ?auto_736699 ) ) ( not ( = ?auto_736692 ?auto_736700 ) ) ( not ( = ?auto_736692 ?auto_736701 ) ) ( not ( = ?auto_736692 ?auto_736702 ) ) ( not ( = ?auto_736693 ?auto_736694 ) ) ( not ( = ?auto_736693 ?auto_736695 ) ) ( not ( = ?auto_736693 ?auto_736696 ) ) ( not ( = ?auto_736693 ?auto_736697 ) ) ( not ( = ?auto_736693 ?auto_736698 ) ) ( not ( = ?auto_736693 ?auto_736699 ) ) ( not ( = ?auto_736693 ?auto_736700 ) ) ( not ( = ?auto_736693 ?auto_736701 ) ) ( not ( = ?auto_736693 ?auto_736702 ) ) ( not ( = ?auto_736694 ?auto_736695 ) ) ( not ( = ?auto_736694 ?auto_736696 ) ) ( not ( = ?auto_736694 ?auto_736697 ) ) ( not ( = ?auto_736694 ?auto_736698 ) ) ( not ( = ?auto_736694 ?auto_736699 ) ) ( not ( = ?auto_736694 ?auto_736700 ) ) ( not ( = ?auto_736694 ?auto_736701 ) ) ( not ( = ?auto_736694 ?auto_736702 ) ) ( not ( = ?auto_736695 ?auto_736696 ) ) ( not ( = ?auto_736695 ?auto_736697 ) ) ( not ( = ?auto_736695 ?auto_736698 ) ) ( not ( = ?auto_736695 ?auto_736699 ) ) ( not ( = ?auto_736695 ?auto_736700 ) ) ( not ( = ?auto_736695 ?auto_736701 ) ) ( not ( = ?auto_736695 ?auto_736702 ) ) ( not ( = ?auto_736696 ?auto_736697 ) ) ( not ( = ?auto_736696 ?auto_736698 ) ) ( not ( = ?auto_736696 ?auto_736699 ) ) ( not ( = ?auto_736696 ?auto_736700 ) ) ( not ( = ?auto_736696 ?auto_736701 ) ) ( not ( = ?auto_736696 ?auto_736702 ) ) ( not ( = ?auto_736697 ?auto_736698 ) ) ( not ( = ?auto_736697 ?auto_736699 ) ) ( not ( = ?auto_736697 ?auto_736700 ) ) ( not ( = ?auto_736697 ?auto_736701 ) ) ( not ( = ?auto_736697 ?auto_736702 ) ) ( not ( = ?auto_736698 ?auto_736699 ) ) ( not ( = ?auto_736698 ?auto_736700 ) ) ( not ( = ?auto_736698 ?auto_736701 ) ) ( not ( = ?auto_736698 ?auto_736702 ) ) ( not ( = ?auto_736699 ?auto_736700 ) ) ( not ( = ?auto_736699 ?auto_736701 ) ) ( not ( = ?auto_736699 ?auto_736702 ) ) ( not ( = ?auto_736700 ?auto_736701 ) ) ( not ( = ?auto_736700 ?auto_736702 ) ) ( not ( = ?auto_736701 ?auto_736702 ) ) ( ON ?auto_736700 ?auto_736701 ) ( ON ?auto_736699 ?auto_736700 ) ( CLEAR ?auto_736697 ) ( ON ?auto_736698 ?auto_736699 ) ( CLEAR ?auto_736698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_736687 ?auto_736688 ?auto_736689 ?auto_736690 ?auto_736691 ?auto_736692 ?auto_736693 ?auto_736694 ?auto_736695 ?auto_736696 ?auto_736697 ?auto_736698 )
      ( MAKE-15PILE ?auto_736687 ?auto_736688 ?auto_736689 ?auto_736690 ?auto_736691 ?auto_736692 ?auto_736693 ?auto_736694 ?auto_736695 ?auto_736696 ?auto_736697 ?auto_736698 ?auto_736699 ?auto_736700 ?auto_736701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736749 - BLOCK
      ?auto_736750 - BLOCK
      ?auto_736751 - BLOCK
      ?auto_736752 - BLOCK
      ?auto_736753 - BLOCK
      ?auto_736754 - BLOCK
      ?auto_736755 - BLOCK
      ?auto_736756 - BLOCK
      ?auto_736757 - BLOCK
      ?auto_736758 - BLOCK
      ?auto_736759 - BLOCK
      ?auto_736760 - BLOCK
      ?auto_736761 - BLOCK
      ?auto_736762 - BLOCK
      ?auto_736763 - BLOCK
    )
    :vars
    (
      ?auto_736764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736763 ?auto_736764 ) ( ON-TABLE ?auto_736749 ) ( ON ?auto_736750 ?auto_736749 ) ( ON ?auto_736751 ?auto_736750 ) ( ON ?auto_736752 ?auto_736751 ) ( ON ?auto_736753 ?auto_736752 ) ( ON ?auto_736754 ?auto_736753 ) ( ON ?auto_736755 ?auto_736754 ) ( ON ?auto_736756 ?auto_736755 ) ( ON ?auto_736757 ?auto_736756 ) ( ON ?auto_736758 ?auto_736757 ) ( not ( = ?auto_736749 ?auto_736750 ) ) ( not ( = ?auto_736749 ?auto_736751 ) ) ( not ( = ?auto_736749 ?auto_736752 ) ) ( not ( = ?auto_736749 ?auto_736753 ) ) ( not ( = ?auto_736749 ?auto_736754 ) ) ( not ( = ?auto_736749 ?auto_736755 ) ) ( not ( = ?auto_736749 ?auto_736756 ) ) ( not ( = ?auto_736749 ?auto_736757 ) ) ( not ( = ?auto_736749 ?auto_736758 ) ) ( not ( = ?auto_736749 ?auto_736759 ) ) ( not ( = ?auto_736749 ?auto_736760 ) ) ( not ( = ?auto_736749 ?auto_736761 ) ) ( not ( = ?auto_736749 ?auto_736762 ) ) ( not ( = ?auto_736749 ?auto_736763 ) ) ( not ( = ?auto_736749 ?auto_736764 ) ) ( not ( = ?auto_736750 ?auto_736751 ) ) ( not ( = ?auto_736750 ?auto_736752 ) ) ( not ( = ?auto_736750 ?auto_736753 ) ) ( not ( = ?auto_736750 ?auto_736754 ) ) ( not ( = ?auto_736750 ?auto_736755 ) ) ( not ( = ?auto_736750 ?auto_736756 ) ) ( not ( = ?auto_736750 ?auto_736757 ) ) ( not ( = ?auto_736750 ?auto_736758 ) ) ( not ( = ?auto_736750 ?auto_736759 ) ) ( not ( = ?auto_736750 ?auto_736760 ) ) ( not ( = ?auto_736750 ?auto_736761 ) ) ( not ( = ?auto_736750 ?auto_736762 ) ) ( not ( = ?auto_736750 ?auto_736763 ) ) ( not ( = ?auto_736750 ?auto_736764 ) ) ( not ( = ?auto_736751 ?auto_736752 ) ) ( not ( = ?auto_736751 ?auto_736753 ) ) ( not ( = ?auto_736751 ?auto_736754 ) ) ( not ( = ?auto_736751 ?auto_736755 ) ) ( not ( = ?auto_736751 ?auto_736756 ) ) ( not ( = ?auto_736751 ?auto_736757 ) ) ( not ( = ?auto_736751 ?auto_736758 ) ) ( not ( = ?auto_736751 ?auto_736759 ) ) ( not ( = ?auto_736751 ?auto_736760 ) ) ( not ( = ?auto_736751 ?auto_736761 ) ) ( not ( = ?auto_736751 ?auto_736762 ) ) ( not ( = ?auto_736751 ?auto_736763 ) ) ( not ( = ?auto_736751 ?auto_736764 ) ) ( not ( = ?auto_736752 ?auto_736753 ) ) ( not ( = ?auto_736752 ?auto_736754 ) ) ( not ( = ?auto_736752 ?auto_736755 ) ) ( not ( = ?auto_736752 ?auto_736756 ) ) ( not ( = ?auto_736752 ?auto_736757 ) ) ( not ( = ?auto_736752 ?auto_736758 ) ) ( not ( = ?auto_736752 ?auto_736759 ) ) ( not ( = ?auto_736752 ?auto_736760 ) ) ( not ( = ?auto_736752 ?auto_736761 ) ) ( not ( = ?auto_736752 ?auto_736762 ) ) ( not ( = ?auto_736752 ?auto_736763 ) ) ( not ( = ?auto_736752 ?auto_736764 ) ) ( not ( = ?auto_736753 ?auto_736754 ) ) ( not ( = ?auto_736753 ?auto_736755 ) ) ( not ( = ?auto_736753 ?auto_736756 ) ) ( not ( = ?auto_736753 ?auto_736757 ) ) ( not ( = ?auto_736753 ?auto_736758 ) ) ( not ( = ?auto_736753 ?auto_736759 ) ) ( not ( = ?auto_736753 ?auto_736760 ) ) ( not ( = ?auto_736753 ?auto_736761 ) ) ( not ( = ?auto_736753 ?auto_736762 ) ) ( not ( = ?auto_736753 ?auto_736763 ) ) ( not ( = ?auto_736753 ?auto_736764 ) ) ( not ( = ?auto_736754 ?auto_736755 ) ) ( not ( = ?auto_736754 ?auto_736756 ) ) ( not ( = ?auto_736754 ?auto_736757 ) ) ( not ( = ?auto_736754 ?auto_736758 ) ) ( not ( = ?auto_736754 ?auto_736759 ) ) ( not ( = ?auto_736754 ?auto_736760 ) ) ( not ( = ?auto_736754 ?auto_736761 ) ) ( not ( = ?auto_736754 ?auto_736762 ) ) ( not ( = ?auto_736754 ?auto_736763 ) ) ( not ( = ?auto_736754 ?auto_736764 ) ) ( not ( = ?auto_736755 ?auto_736756 ) ) ( not ( = ?auto_736755 ?auto_736757 ) ) ( not ( = ?auto_736755 ?auto_736758 ) ) ( not ( = ?auto_736755 ?auto_736759 ) ) ( not ( = ?auto_736755 ?auto_736760 ) ) ( not ( = ?auto_736755 ?auto_736761 ) ) ( not ( = ?auto_736755 ?auto_736762 ) ) ( not ( = ?auto_736755 ?auto_736763 ) ) ( not ( = ?auto_736755 ?auto_736764 ) ) ( not ( = ?auto_736756 ?auto_736757 ) ) ( not ( = ?auto_736756 ?auto_736758 ) ) ( not ( = ?auto_736756 ?auto_736759 ) ) ( not ( = ?auto_736756 ?auto_736760 ) ) ( not ( = ?auto_736756 ?auto_736761 ) ) ( not ( = ?auto_736756 ?auto_736762 ) ) ( not ( = ?auto_736756 ?auto_736763 ) ) ( not ( = ?auto_736756 ?auto_736764 ) ) ( not ( = ?auto_736757 ?auto_736758 ) ) ( not ( = ?auto_736757 ?auto_736759 ) ) ( not ( = ?auto_736757 ?auto_736760 ) ) ( not ( = ?auto_736757 ?auto_736761 ) ) ( not ( = ?auto_736757 ?auto_736762 ) ) ( not ( = ?auto_736757 ?auto_736763 ) ) ( not ( = ?auto_736757 ?auto_736764 ) ) ( not ( = ?auto_736758 ?auto_736759 ) ) ( not ( = ?auto_736758 ?auto_736760 ) ) ( not ( = ?auto_736758 ?auto_736761 ) ) ( not ( = ?auto_736758 ?auto_736762 ) ) ( not ( = ?auto_736758 ?auto_736763 ) ) ( not ( = ?auto_736758 ?auto_736764 ) ) ( not ( = ?auto_736759 ?auto_736760 ) ) ( not ( = ?auto_736759 ?auto_736761 ) ) ( not ( = ?auto_736759 ?auto_736762 ) ) ( not ( = ?auto_736759 ?auto_736763 ) ) ( not ( = ?auto_736759 ?auto_736764 ) ) ( not ( = ?auto_736760 ?auto_736761 ) ) ( not ( = ?auto_736760 ?auto_736762 ) ) ( not ( = ?auto_736760 ?auto_736763 ) ) ( not ( = ?auto_736760 ?auto_736764 ) ) ( not ( = ?auto_736761 ?auto_736762 ) ) ( not ( = ?auto_736761 ?auto_736763 ) ) ( not ( = ?auto_736761 ?auto_736764 ) ) ( not ( = ?auto_736762 ?auto_736763 ) ) ( not ( = ?auto_736762 ?auto_736764 ) ) ( not ( = ?auto_736763 ?auto_736764 ) ) ( ON ?auto_736762 ?auto_736763 ) ( ON ?auto_736761 ?auto_736762 ) ( ON ?auto_736760 ?auto_736761 ) ( CLEAR ?auto_736758 ) ( ON ?auto_736759 ?auto_736760 ) ( CLEAR ?auto_736759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_736749 ?auto_736750 ?auto_736751 ?auto_736752 ?auto_736753 ?auto_736754 ?auto_736755 ?auto_736756 ?auto_736757 ?auto_736758 ?auto_736759 )
      ( MAKE-15PILE ?auto_736749 ?auto_736750 ?auto_736751 ?auto_736752 ?auto_736753 ?auto_736754 ?auto_736755 ?auto_736756 ?auto_736757 ?auto_736758 ?auto_736759 ?auto_736760 ?auto_736761 ?auto_736762 ?auto_736763 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736811 - BLOCK
      ?auto_736812 - BLOCK
      ?auto_736813 - BLOCK
      ?auto_736814 - BLOCK
      ?auto_736815 - BLOCK
      ?auto_736816 - BLOCK
      ?auto_736817 - BLOCK
      ?auto_736818 - BLOCK
      ?auto_736819 - BLOCK
      ?auto_736820 - BLOCK
      ?auto_736821 - BLOCK
      ?auto_736822 - BLOCK
      ?auto_736823 - BLOCK
      ?auto_736824 - BLOCK
      ?auto_736825 - BLOCK
    )
    :vars
    (
      ?auto_736826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736825 ?auto_736826 ) ( ON-TABLE ?auto_736811 ) ( ON ?auto_736812 ?auto_736811 ) ( ON ?auto_736813 ?auto_736812 ) ( ON ?auto_736814 ?auto_736813 ) ( ON ?auto_736815 ?auto_736814 ) ( ON ?auto_736816 ?auto_736815 ) ( ON ?auto_736817 ?auto_736816 ) ( ON ?auto_736818 ?auto_736817 ) ( ON ?auto_736819 ?auto_736818 ) ( not ( = ?auto_736811 ?auto_736812 ) ) ( not ( = ?auto_736811 ?auto_736813 ) ) ( not ( = ?auto_736811 ?auto_736814 ) ) ( not ( = ?auto_736811 ?auto_736815 ) ) ( not ( = ?auto_736811 ?auto_736816 ) ) ( not ( = ?auto_736811 ?auto_736817 ) ) ( not ( = ?auto_736811 ?auto_736818 ) ) ( not ( = ?auto_736811 ?auto_736819 ) ) ( not ( = ?auto_736811 ?auto_736820 ) ) ( not ( = ?auto_736811 ?auto_736821 ) ) ( not ( = ?auto_736811 ?auto_736822 ) ) ( not ( = ?auto_736811 ?auto_736823 ) ) ( not ( = ?auto_736811 ?auto_736824 ) ) ( not ( = ?auto_736811 ?auto_736825 ) ) ( not ( = ?auto_736811 ?auto_736826 ) ) ( not ( = ?auto_736812 ?auto_736813 ) ) ( not ( = ?auto_736812 ?auto_736814 ) ) ( not ( = ?auto_736812 ?auto_736815 ) ) ( not ( = ?auto_736812 ?auto_736816 ) ) ( not ( = ?auto_736812 ?auto_736817 ) ) ( not ( = ?auto_736812 ?auto_736818 ) ) ( not ( = ?auto_736812 ?auto_736819 ) ) ( not ( = ?auto_736812 ?auto_736820 ) ) ( not ( = ?auto_736812 ?auto_736821 ) ) ( not ( = ?auto_736812 ?auto_736822 ) ) ( not ( = ?auto_736812 ?auto_736823 ) ) ( not ( = ?auto_736812 ?auto_736824 ) ) ( not ( = ?auto_736812 ?auto_736825 ) ) ( not ( = ?auto_736812 ?auto_736826 ) ) ( not ( = ?auto_736813 ?auto_736814 ) ) ( not ( = ?auto_736813 ?auto_736815 ) ) ( not ( = ?auto_736813 ?auto_736816 ) ) ( not ( = ?auto_736813 ?auto_736817 ) ) ( not ( = ?auto_736813 ?auto_736818 ) ) ( not ( = ?auto_736813 ?auto_736819 ) ) ( not ( = ?auto_736813 ?auto_736820 ) ) ( not ( = ?auto_736813 ?auto_736821 ) ) ( not ( = ?auto_736813 ?auto_736822 ) ) ( not ( = ?auto_736813 ?auto_736823 ) ) ( not ( = ?auto_736813 ?auto_736824 ) ) ( not ( = ?auto_736813 ?auto_736825 ) ) ( not ( = ?auto_736813 ?auto_736826 ) ) ( not ( = ?auto_736814 ?auto_736815 ) ) ( not ( = ?auto_736814 ?auto_736816 ) ) ( not ( = ?auto_736814 ?auto_736817 ) ) ( not ( = ?auto_736814 ?auto_736818 ) ) ( not ( = ?auto_736814 ?auto_736819 ) ) ( not ( = ?auto_736814 ?auto_736820 ) ) ( not ( = ?auto_736814 ?auto_736821 ) ) ( not ( = ?auto_736814 ?auto_736822 ) ) ( not ( = ?auto_736814 ?auto_736823 ) ) ( not ( = ?auto_736814 ?auto_736824 ) ) ( not ( = ?auto_736814 ?auto_736825 ) ) ( not ( = ?auto_736814 ?auto_736826 ) ) ( not ( = ?auto_736815 ?auto_736816 ) ) ( not ( = ?auto_736815 ?auto_736817 ) ) ( not ( = ?auto_736815 ?auto_736818 ) ) ( not ( = ?auto_736815 ?auto_736819 ) ) ( not ( = ?auto_736815 ?auto_736820 ) ) ( not ( = ?auto_736815 ?auto_736821 ) ) ( not ( = ?auto_736815 ?auto_736822 ) ) ( not ( = ?auto_736815 ?auto_736823 ) ) ( not ( = ?auto_736815 ?auto_736824 ) ) ( not ( = ?auto_736815 ?auto_736825 ) ) ( not ( = ?auto_736815 ?auto_736826 ) ) ( not ( = ?auto_736816 ?auto_736817 ) ) ( not ( = ?auto_736816 ?auto_736818 ) ) ( not ( = ?auto_736816 ?auto_736819 ) ) ( not ( = ?auto_736816 ?auto_736820 ) ) ( not ( = ?auto_736816 ?auto_736821 ) ) ( not ( = ?auto_736816 ?auto_736822 ) ) ( not ( = ?auto_736816 ?auto_736823 ) ) ( not ( = ?auto_736816 ?auto_736824 ) ) ( not ( = ?auto_736816 ?auto_736825 ) ) ( not ( = ?auto_736816 ?auto_736826 ) ) ( not ( = ?auto_736817 ?auto_736818 ) ) ( not ( = ?auto_736817 ?auto_736819 ) ) ( not ( = ?auto_736817 ?auto_736820 ) ) ( not ( = ?auto_736817 ?auto_736821 ) ) ( not ( = ?auto_736817 ?auto_736822 ) ) ( not ( = ?auto_736817 ?auto_736823 ) ) ( not ( = ?auto_736817 ?auto_736824 ) ) ( not ( = ?auto_736817 ?auto_736825 ) ) ( not ( = ?auto_736817 ?auto_736826 ) ) ( not ( = ?auto_736818 ?auto_736819 ) ) ( not ( = ?auto_736818 ?auto_736820 ) ) ( not ( = ?auto_736818 ?auto_736821 ) ) ( not ( = ?auto_736818 ?auto_736822 ) ) ( not ( = ?auto_736818 ?auto_736823 ) ) ( not ( = ?auto_736818 ?auto_736824 ) ) ( not ( = ?auto_736818 ?auto_736825 ) ) ( not ( = ?auto_736818 ?auto_736826 ) ) ( not ( = ?auto_736819 ?auto_736820 ) ) ( not ( = ?auto_736819 ?auto_736821 ) ) ( not ( = ?auto_736819 ?auto_736822 ) ) ( not ( = ?auto_736819 ?auto_736823 ) ) ( not ( = ?auto_736819 ?auto_736824 ) ) ( not ( = ?auto_736819 ?auto_736825 ) ) ( not ( = ?auto_736819 ?auto_736826 ) ) ( not ( = ?auto_736820 ?auto_736821 ) ) ( not ( = ?auto_736820 ?auto_736822 ) ) ( not ( = ?auto_736820 ?auto_736823 ) ) ( not ( = ?auto_736820 ?auto_736824 ) ) ( not ( = ?auto_736820 ?auto_736825 ) ) ( not ( = ?auto_736820 ?auto_736826 ) ) ( not ( = ?auto_736821 ?auto_736822 ) ) ( not ( = ?auto_736821 ?auto_736823 ) ) ( not ( = ?auto_736821 ?auto_736824 ) ) ( not ( = ?auto_736821 ?auto_736825 ) ) ( not ( = ?auto_736821 ?auto_736826 ) ) ( not ( = ?auto_736822 ?auto_736823 ) ) ( not ( = ?auto_736822 ?auto_736824 ) ) ( not ( = ?auto_736822 ?auto_736825 ) ) ( not ( = ?auto_736822 ?auto_736826 ) ) ( not ( = ?auto_736823 ?auto_736824 ) ) ( not ( = ?auto_736823 ?auto_736825 ) ) ( not ( = ?auto_736823 ?auto_736826 ) ) ( not ( = ?auto_736824 ?auto_736825 ) ) ( not ( = ?auto_736824 ?auto_736826 ) ) ( not ( = ?auto_736825 ?auto_736826 ) ) ( ON ?auto_736824 ?auto_736825 ) ( ON ?auto_736823 ?auto_736824 ) ( ON ?auto_736822 ?auto_736823 ) ( ON ?auto_736821 ?auto_736822 ) ( CLEAR ?auto_736819 ) ( ON ?auto_736820 ?auto_736821 ) ( CLEAR ?auto_736820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_736811 ?auto_736812 ?auto_736813 ?auto_736814 ?auto_736815 ?auto_736816 ?auto_736817 ?auto_736818 ?auto_736819 ?auto_736820 )
      ( MAKE-15PILE ?auto_736811 ?auto_736812 ?auto_736813 ?auto_736814 ?auto_736815 ?auto_736816 ?auto_736817 ?auto_736818 ?auto_736819 ?auto_736820 ?auto_736821 ?auto_736822 ?auto_736823 ?auto_736824 ?auto_736825 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736873 - BLOCK
      ?auto_736874 - BLOCK
      ?auto_736875 - BLOCK
      ?auto_736876 - BLOCK
      ?auto_736877 - BLOCK
      ?auto_736878 - BLOCK
      ?auto_736879 - BLOCK
      ?auto_736880 - BLOCK
      ?auto_736881 - BLOCK
      ?auto_736882 - BLOCK
      ?auto_736883 - BLOCK
      ?auto_736884 - BLOCK
      ?auto_736885 - BLOCK
      ?auto_736886 - BLOCK
      ?auto_736887 - BLOCK
    )
    :vars
    (
      ?auto_736888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736887 ?auto_736888 ) ( ON-TABLE ?auto_736873 ) ( ON ?auto_736874 ?auto_736873 ) ( ON ?auto_736875 ?auto_736874 ) ( ON ?auto_736876 ?auto_736875 ) ( ON ?auto_736877 ?auto_736876 ) ( ON ?auto_736878 ?auto_736877 ) ( ON ?auto_736879 ?auto_736878 ) ( ON ?auto_736880 ?auto_736879 ) ( not ( = ?auto_736873 ?auto_736874 ) ) ( not ( = ?auto_736873 ?auto_736875 ) ) ( not ( = ?auto_736873 ?auto_736876 ) ) ( not ( = ?auto_736873 ?auto_736877 ) ) ( not ( = ?auto_736873 ?auto_736878 ) ) ( not ( = ?auto_736873 ?auto_736879 ) ) ( not ( = ?auto_736873 ?auto_736880 ) ) ( not ( = ?auto_736873 ?auto_736881 ) ) ( not ( = ?auto_736873 ?auto_736882 ) ) ( not ( = ?auto_736873 ?auto_736883 ) ) ( not ( = ?auto_736873 ?auto_736884 ) ) ( not ( = ?auto_736873 ?auto_736885 ) ) ( not ( = ?auto_736873 ?auto_736886 ) ) ( not ( = ?auto_736873 ?auto_736887 ) ) ( not ( = ?auto_736873 ?auto_736888 ) ) ( not ( = ?auto_736874 ?auto_736875 ) ) ( not ( = ?auto_736874 ?auto_736876 ) ) ( not ( = ?auto_736874 ?auto_736877 ) ) ( not ( = ?auto_736874 ?auto_736878 ) ) ( not ( = ?auto_736874 ?auto_736879 ) ) ( not ( = ?auto_736874 ?auto_736880 ) ) ( not ( = ?auto_736874 ?auto_736881 ) ) ( not ( = ?auto_736874 ?auto_736882 ) ) ( not ( = ?auto_736874 ?auto_736883 ) ) ( not ( = ?auto_736874 ?auto_736884 ) ) ( not ( = ?auto_736874 ?auto_736885 ) ) ( not ( = ?auto_736874 ?auto_736886 ) ) ( not ( = ?auto_736874 ?auto_736887 ) ) ( not ( = ?auto_736874 ?auto_736888 ) ) ( not ( = ?auto_736875 ?auto_736876 ) ) ( not ( = ?auto_736875 ?auto_736877 ) ) ( not ( = ?auto_736875 ?auto_736878 ) ) ( not ( = ?auto_736875 ?auto_736879 ) ) ( not ( = ?auto_736875 ?auto_736880 ) ) ( not ( = ?auto_736875 ?auto_736881 ) ) ( not ( = ?auto_736875 ?auto_736882 ) ) ( not ( = ?auto_736875 ?auto_736883 ) ) ( not ( = ?auto_736875 ?auto_736884 ) ) ( not ( = ?auto_736875 ?auto_736885 ) ) ( not ( = ?auto_736875 ?auto_736886 ) ) ( not ( = ?auto_736875 ?auto_736887 ) ) ( not ( = ?auto_736875 ?auto_736888 ) ) ( not ( = ?auto_736876 ?auto_736877 ) ) ( not ( = ?auto_736876 ?auto_736878 ) ) ( not ( = ?auto_736876 ?auto_736879 ) ) ( not ( = ?auto_736876 ?auto_736880 ) ) ( not ( = ?auto_736876 ?auto_736881 ) ) ( not ( = ?auto_736876 ?auto_736882 ) ) ( not ( = ?auto_736876 ?auto_736883 ) ) ( not ( = ?auto_736876 ?auto_736884 ) ) ( not ( = ?auto_736876 ?auto_736885 ) ) ( not ( = ?auto_736876 ?auto_736886 ) ) ( not ( = ?auto_736876 ?auto_736887 ) ) ( not ( = ?auto_736876 ?auto_736888 ) ) ( not ( = ?auto_736877 ?auto_736878 ) ) ( not ( = ?auto_736877 ?auto_736879 ) ) ( not ( = ?auto_736877 ?auto_736880 ) ) ( not ( = ?auto_736877 ?auto_736881 ) ) ( not ( = ?auto_736877 ?auto_736882 ) ) ( not ( = ?auto_736877 ?auto_736883 ) ) ( not ( = ?auto_736877 ?auto_736884 ) ) ( not ( = ?auto_736877 ?auto_736885 ) ) ( not ( = ?auto_736877 ?auto_736886 ) ) ( not ( = ?auto_736877 ?auto_736887 ) ) ( not ( = ?auto_736877 ?auto_736888 ) ) ( not ( = ?auto_736878 ?auto_736879 ) ) ( not ( = ?auto_736878 ?auto_736880 ) ) ( not ( = ?auto_736878 ?auto_736881 ) ) ( not ( = ?auto_736878 ?auto_736882 ) ) ( not ( = ?auto_736878 ?auto_736883 ) ) ( not ( = ?auto_736878 ?auto_736884 ) ) ( not ( = ?auto_736878 ?auto_736885 ) ) ( not ( = ?auto_736878 ?auto_736886 ) ) ( not ( = ?auto_736878 ?auto_736887 ) ) ( not ( = ?auto_736878 ?auto_736888 ) ) ( not ( = ?auto_736879 ?auto_736880 ) ) ( not ( = ?auto_736879 ?auto_736881 ) ) ( not ( = ?auto_736879 ?auto_736882 ) ) ( not ( = ?auto_736879 ?auto_736883 ) ) ( not ( = ?auto_736879 ?auto_736884 ) ) ( not ( = ?auto_736879 ?auto_736885 ) ) ( not ( = ?auto_736879 ?auto_736886 ) ) ( not ( = ?auto_736879 ?auto_736887 ) ) ( not ( = ?auto_736879 ?auto_736888 ) ) ( not ( = ?auto_736880 ?auto_736881 ) ) ( not ( = ?auto_736880 ?auto_736882 ) ) ( not ( = ?auto_736880 ?auto_736883 ) ) ( not ( = ?auto_736880 ?auto_736884 ) ) ( not ( = ?auto_736880 ?auto_736885 ) ) ( not ( = ?auto_736880 ?auto_736886 ) ) ( not ( = ?auto_736880 ?auto_736887 ) ) ( not ( = ?auto_736880 ?auto_736888 ) ) ( not ( = ?auto_736881 ?auto_736882 ) ) ( not ( = ?auto_736881 ?auto_736883 ) ) ( not ( = ?auto_736881 ?auto_736884 ) ) ( not ( = ?auto_736881 ?auto_736885 ) ) ( not ( = ?auto_736881 ?auto_736886 ) ) ( not ( = ?auto_736881 ?auto_736887 ) ) ( not ( = ?auto_736881 ?auto_736888 ) ) ( not ( = ?auto_736882 ?auto_736883 ) ) ( not ( = ?auto_736882 ?auto_736884 ) ) ( not ( = ?auto_736882 ?auto_736885 ) ) ( not ( = ?auto_736882 ?auto_736886 ) ) ( not ( = ?auto_736882 ?auto_736887 ) ) ( not ( = ?auto_736882 ?auto_736888 ) ) ( not ( = ?auto_736883 ?auto_736884 ) ) ( not ( = ?auto_736883 ?auto_736885 ) ) ( not ( = ?auto_736883 ?auto_736886 ) ) ( not ( = ?auto_736883 ?auto_736887 ) ) ( not ( = ?auto_736883 ?auto_736888 ) ) ( not ( = ?auto_736884 ?auto_736885 ) ) ( not ( = ?auto_736884 ?auto_736886 ) ) ( not ( = ?auto_736884 ?auto_736887 ) ) ( not ( = ?auto_736884 ?auto_736888 ) ) ( not ( = ?auto_736885 ?auto_736886 ) ) ( not ( = ?auto_736885 ?auto_736887 ) ) ( not ( = ?auto_736885 ?auto_736888 ) ) ( not ( = ?auto_736886 ?auto_736887 ) ) ( not ( = ?auto_736886 ?auto_736888 ) ) ( not ( = ?auto_736887 ?auto_736888 ) ) ( ON ?auto_736886 ?auto_736887 ) ( ON ?auto_736885 ?auto_736886 ) ( ON ?auto_736884 ?auto_736885 ) ( ON ?auto_736883 ?auto_736884 ) ( ON ?auto_736882 ?auto_736883 ) ( CLEAR ?auto_736880 ) ( ON ?auto_736881 ?auto_736882 ) ( CLEAR ?auto_736881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_736873 ?auto_736874 ?auto_736875 ?auto_736876 ?auto_736877 ?auto_736878 ?auto_736879 ?auto_736880 ?auto_736881 )
      ( MAKE-15PILE ?auto_736873 ?auto_736874 ?auto_736875 ?auto_736876 ?auto_736877 ?auto_736878 ?auto_736879 ?auto_736880 ?auto_736881 ?auto_736882 ?auto_736883 ?auto_736884 ?auto_736885 ?auto_736886 ?auto_736887 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736935 - BLOCK
      ?auto_736936 - BLOCK
      ?auto_736937 - BLOCK
      ?auto_736938 - BLOCK
      ?auto_736939 - BLOCK
      ?auto_736940 - BLOCK
      ?auto_736941 - BLOCK
      ?auto_736942 - BLOCK
      ?auto_736943 - BLOCK
      ?auto_736944 - BLOCK
      ?auto_736945 - BLOCK
      ?auto_736946 - BLOCK
      ?auto_736947 - BLOCK
      ?auto_736948 - BLOCK
      ?auto_736949 - BLOCK
    )
    :vars
    (
      ?auto_736950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736949 ?auto_736950 ) ( ON-TABLE ?auto_736935 ) ( ON ?auto_736936 ?auto_736935 ) ( ON ?auto_736937 ?auto_736936 ) ( ON ?auto_736938 ?auto_736937 ) ( ON ?auto_736939 ?auto_736938 ) ( ON ?auto_736940 ?auto_736939 ) ( ON ?auto_736941 ?auto_736940 ) ( not ( = ?auto_736935 ?auto_736936 ) ) ( not ( = ?auto_736935 ?auto_736937 ) ) ( not ( = ?auto_736935 ?auto_736938 ) ) ( not ( = ?auto_736935 ?auto_736939 ) ) ( not ( = ?auto_736935 ?auto_736940 ) ) ( not ( = ?auto_736935 ?auto_736941 ) ) ( not ( = ?auto_736935 ?auto_736942 ) ) ( not ( = ?auto_736935 ?auto_736943 ) ) ( not ( = ?auto_736935 ?auto_736944 ) ) ( not ( = ?auto_736935 ?auto_736945 ) ) ( not ( = ?auto_736935 ?auto_736946 ) ) ( not ( = ?auto_736935 ?auto_736947 ) ) ( not ( = ?auto_736935 ?auto_736948 ) ) ( not ( = ?auto_736935 ?auto_736949 ) ) ( not ( = ?auto_736935 ?auto_736950 ) ) ( not ( = ?auto_736936 ?auto_736937 ) ) ( not ( = ?auto_736936 ?auto_736938 ) ) ( not ( = ?auto_736936 ?auto_736939 ) ) ( not ( = ?auto_736936 ?auto_736940 ) ) ( not ( = ?auto_736936 ?auto_736941 ) ) ( not ( = ?auto_736936 ?auto_736942 ) ) ( not ( = ?auto_736936 ?auto_736943 ) ) ( not ( = ?auto_736936 ?auto_736944 ) ) ( not ( = ?auto_736936 ?auto_736945 ) ) ( not ( = ?auto_736936 ?auto_736946 ) ) ( not ( = ?auto_736936 ?auto_736947 ) ) ( not ( = ?auto_736936 ?auto_736948 ) ) ( not ( = ?auto_736936 ?auto_736949 ) ) ( not ( = ?auto_736936 ?auto_736950 ) ) ( not ( = ?auto_736937 ?auto_736938 ) ) ( not ( = ?auto_736937 ?auto_736939 ) ) ( not ( = ?auto_736937 ?auto_736940 ) ) ( not ( = ?auto_736937 ?auto_736941 ) ) ( not ( = ?auto_736937 ?auto_736942 ) ) ( not ( = ?auto_736937 ?auto_736943 ) ) ( not ( = ?auto_736937 ?auto_736944 ) ) ( not ( = ?auto_736937 ?auto_736945 ) ) ( not ( = ?auto_736937 ?auto_736946 ) ) ( not ( = ?auto_736937 ?auto_736947 ) ) ( not ( = ?auto_736937 ?auto_736948 ) ) ( not ( = ?auto_736937 ?auto_736949 ) ) ( not ( = ?auto_736937 ?auto_736950 ) ) ( not ( = ?auto_736938 ?auto_736939 ) ) ( not ( = ?auto_736938 ?auto_736940 ) ) ( not ( = ?auto_736938 ?auto_736941 ) ) ( not ( = ?auto_736938 ?auto_736942 ) ) ( not ( = ?auto_736938 ?auto_736943 ) ) ( not ( = ?auto_736938 ?auto_736944 ) ) ( not ( = ?auto_736938 ?auto_736945 ) ) ( not ( = ?auto_736938 ?auto_736946 ) ) ( not ( = ?auto_736938 ?auto_736947 ) ) ( not ( = ?auto_736938 ?auto_736948 ) ) ( not ( = ?auto_736938 ?auto_736949 ) ) ( not ( = ?auto_736938 ?auto_736950 ) ) ( not ( = ?auto_736939 ?auto_736940 ) ) ( not ( = ?auto_736939 ?auto_736941 ) ) ( not ( = ?auto_736939 ?auto_736942 ) ) ( not ( = ?auto_736939 ?auto_736943 ) ) ( not ( = ?auto_736939 ?auto_736944 ) ) ( not ( = ?auto_736939 ?auto_736945 ) ) ( not ( = ?auto_736939 ?auto_736946 ) ) ( not ( = ?auto_736939 ?auto_736947 ) ) ( not ( = ?auto_736939 ?auto_736948 ) ) ( not ( = ?auto_736939 ?auto_736949 ) ) ( not ( = ?auto_736939 ?auto_736950 ) ) ( not ( = ?auto_736940 ?auto_736941 ) ) ( not ( = ?auto_736940 ?auto_736942 ) ) ( not ( = ?auto_736940 ?auto_736943 ) ) ( not ( = ?auto_736940 ?auto_736944 ) ) ( not ( = ?auto_736940 ?auto_736945 ) ) ( not ( = ?auto_736940 ?auto_736946 ) ) ( not ( = ?auto_736940 ?auto_736947 ) ) ( not ( = ?auto_736940 ?auto_736948 ) ) ( not ( = ?auto_736940 ?auto_736949 ) ) ( not ( = ?auto_736940 ?auto_736950 ) ) ( not ( = ?auto_736941 ?auto_736942 ) ) ( not ( = ?auto_736941 ?auto_736943 ) ) ( not ( = ?auto_736941 ?auto_736944 ) ) ( not ( = ?auto_736941 ?auto_736945 ) ) ( not ( = ?auto_736941 ?auto_736946 ) ) ( not ( = ?auto_736941 ?auto_736947 ) ) ( not ( = ?auto_736941 ?auto_736948 ) ) ( not ( = ?auto_736941 ?auto_736949 ) ) ( not ( = ?auto_736941 ?auto_736950 ) ) ( not ( = ?auto_736942 ?auto_736943 ) ) ( not ( = ?auto_736942 ?auto_736944 ) ) ( not ( = ?auto_736942 ?auto_736945 ) ) ( not ( = ?auto_736942 ?auto_736946 ) ) ( not ( = ?auto_736942 ?auto_736947 ) ) ( not ( = ?auto_736942 ?auto_736948 ) ) ( not ( = ?auto_736942 ?auto_736949 ) ) ( not ( = ?auto_736942 ?auto_736950 ) ) ( not ( = ?auto_736943 ?auto_736944 ) ) ( not ( = ?auto_736943 ?auto_736945 ) ) ( not ( = ?auto_736943 ?auto_736946 ) ) ( not ( = ?auto_736943 ?auto_736947 ) ) ( not ( = ?auto_736943 ?auto_736948 ) ) ( not ( = ?auto_736943 ?auto_736949 ) ) ( not ( = ?auto_736943 ?auto_736950 ) ) ( not ( = ?auto_736944 ?auto_736945 ) ) ( not ( = ?auto_736944 ?auto_736946 ) ) ( not ( = ?auto_736944 ?auto_736947 ) ) ( not ( = ?auto_736944 ?auto_736948 ) ) ( not ( = ?auto_736944 ?auto_736949 ) ) ( not ( = ?auto_736944 ?auto_736950 ) ) ( not ( = ?auto_736945 ?auto_736946 ) ) ( not ( = ?auto_736945 ?auto_736947 ) ) ( not ( = ?auto_736945 ?auto_736948 ) ) ( not ( = ?auto_736945 ?auto_736949 ) ) ( not ( = ?auto_736945 ?auto_736950 ) ) ( not ( = ?auto_736946 ?auto_736947 ) ) ( not ( = ?auto_736946 ?auto_736948 ) ) ( not ( = ?auto_736946 ?auto_736949 ) ) ( not ( = ?auto_736946 ?auto_736950 ) ) ( not ( = ?auto_736947 ?auto_736948 ) ) ( not ( = ?auto_736947 ?auto_736949 ) ) ( not ( = ?auto_736947 ?auto_736950 ) ) ( not ( = ?auto_736948 ?auto_736949 ) ) ( not ( = ?auto_736948 ?auto_736950 ) ) ( not ( = ?auto_736949 ?auto_736950 ) ) ( ON ?auto_736948 ?auto_736949 ) ( ON ?auto_736947 ?auto_736948 ) ( ON ?auto_736946 ?auto_736947 ) ( ON ?auto_736945 ?auto_736946 ) ( ON ?auto_736944 ?auto_736945 ) ( ON ?auto_736943 ?auto_736944 ) ( CLEAR ?auto_736941 ) ( ON ?auto_736942 ?auto_736943 ) ( CLEAR ?auto_736942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_736935 ?auto_736936 ?auto_736937 ?auto_736938 ?auto_736939 ?auto_736940 ?auto_736941 ?auto_736942 )
      ( MAKE-15PILE ?auto_736935 ?auto_736936 ?auto_736937 ?auto_736938 ?auto_736939 ?auto_736940 ?auto_736941 ?auto_736942 ?auto_736943 ?auto_736944 ?auto_736945 ?auto_736946 ?auto_736947 ?auto_736948 ?auto_736949 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_736997 - BLOCK
      ?auto_736998 - BLOCK
      ?auto_736999 - BLOCK
      ?auto_737000 - BLOCK
      ?auto_737001 - BLOCK
      ?auto_737002 - BLOCK
      ?auto_737003 - BLOCK
      ?auto_737004 - BLOCK
      ?auto_737005 - BLOCK
      ?auto_737006 - BLOCK
      ?auto_737007 - BLOCK
      ?auto_737008 - BLOCK
      ?auto_737009 - BLOCK
      ?auto_737010 - BLOCK
      ?auto_737011 - BLOCK
    )
    :vars
    (
      ?auto_737012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737011 ?auto_737012 ) ( ON-TABLE ?auto_736997 ) ( ON ?auto_736998 ?auto_736997 ) ( ON ?auto_736999 ?auto_736998 ) ( ON ?auto_737000 ?auto_736999 ) ( ON ?auto_737001 ?auto_737000 ) ( ON ?auto_737002 ?auto_737001 ) ( not ( = ?auto_736997 ?auto_736998 ) ) ( not ( = ?auto_736997 ?auto_736999 ) ) ( not ( = ?auto_736997 ?auto_737000 ) ) ( not ( = ?auto_736997 ?auto_737001 ) ) ( not ( = ?auto_736997 ?auto_737002 ) ) ( not ( = ?auto_736997 ?auto_737003 ) ) ( not ( = ?auto_736997 ?auto_737004 ) ) ( not ( = ?auto_736997 ?auto_737005 ) ) ( not ( = ?auto_736997 ?auto_737006 ) ) ( not ( = ?auto_736997 ?auto_737007 ) ) ( not ( = ?auto_736997 ?auto_737008 ) ) ( not ( = ?auto_736997 ?auto_737009 ) ) ( not ( = ?auto_736997 ?auto_737010 ) ) ( not ( = ?auto_736997 ?auto_737011 ) ) ( not ( = ?auto_736997 ?auto_737012 ) ) ( not ( = ?auto_736998 ?auto_736999 ) ) ( not ( = ?auto_736998 ?auto_737000 ) ) ( not ( = ?auto_736998 ?auto_737001 ) ) ( not ( = ?auto_736998 ?auto_737002 ) ) ( not ( = ?auto_736998 ?auto_737003 ) ) ( not ( = ?auto_736998 ?auto_737004 ) ) ( not ( = ?auto_736998 ?auto_737005 ) ) ( not ( = ?auto_736998 ?auto_737006 ) ) ( not ( = ?auto_736998 ?auto_737007 ) ) ( not ( = ?auto_736998 ?auto_737008 ) ) ( not ( = ?auto_736998 ?auto_737009 ) ) ( not ( = ?auto_736998 ?auto_737010 ) ) ( not ( = ?auto_736998 ?auto_737011 ) ) ( not ( = ?auto_736998 ?auto_737012 ) ) ( not ( = ?auto_736999 ?auto_737000 ) ) ( not ( = ?auto_736999 ?auto_737001 ) ) ( not ( = ?auto_736999 ?auto_737002 ) ) ( not ( = ?auto_736999 ?auto_737003 ) ) ( not ( = ?auto_736999 ?auto_737004 ) ) ( not ( = ?auto_736999 ?auto_737005 ) ) ( not ( = ?auto_736999 ?auto_737006 ) ) ( not ( = ?auto_736999 ?auto_737007 ) ) ( not ( = ?auto_736999 ?auto_737008 ) ) ( not ( = ?auto_736999 ?auto_737009 ) ) ( not ( = ?auto_736999 ?auto_737010 ) ) ( not ( = ?auto_736999 ?auto_737011 ) ) ( not ( = ?auto_736999 ?auto_737012 ) ) ( not ( = ?auto_737000 ?auto_737001 ) ) ( not ( = ?auto_737000 ?auto_737002 ) ) ( not ( = ?auto_737000 ?auto_737003 ) ) ( not ( = ?auto_737000 ?auto_737004 ) ) ( not ( = ?auto_737000 ?auto_737005 ) ) ( not ( = ?auto_737000 ?auto_737006 ) ) ( not ( = ?auto_737000 ?auto_737007 ) ) ( not ( = ?auto_737000 ?auto_737008 ) ) ( not ( = ?auto_737000 ?auto_737009 ) ) ( not ( = ?auto_737000 ?auto_737010 ) ) ( not ( = ?auto_737000 ?auto_737011 ) ) ( not ( = ?auto_737000 ?auto_737012 ) ) ( not ( = ?auto_737001 ?auto_737002 ) ) ( not ( = ?auto_737001 ?auto_737003 ) ) ( not ( = ?auto_737001 ?auto_737004 ) ) ( not ( = ?auto_737001 ?auto_737005 ) ) ( not ( = ?auto_737001 ?auto_737006 ) ) ( not ( = ?auto_737001 ?auto_737007 ) ) ( not ( = ?auto_737001 ?auto_737008 ) ) ( not ( = ?auto_737001 ?auto_737009 ) ) ( not ( = ?auto_737001 ?auto_737010 ) ) ( not ( = ?auto_737001 ?auto_737011 ) ) ( not ( = ?auto_737001 ?auto_737012 ) ) ( not ( = ?auto_737002 ?auto_737003 ) ) ( not ( = ?auto_737002 ?auto_737004 ) ) ( not ( = ?auto_737002 ?auto_737005 ) ) ( not ( = ?auto_737002 ?auto_737006 ) ) ( not ( = ?auto_737002 ?auto_737007 ) ) ( not ( = ?auto_737002 ?auto_737008 ) ) ( not ( = ?auto_737002 ?auto_737009 ) ) ( not ( = ?auto_737002 ?auto_737010 ) ) ( not ( = ?auto_737002 ?auto_737011 ) ) ( not ( = ?auto_737002 ?auto_737012 ) ) ( not ( = ?auto_737003 ?auto_737004 ) ) ( not ( = ?auto_737003 ?auto_737005 ) ) ( not ( = ?auto_737003 ?auto_737006 ) ) ( not ( = ?auto_737003 ?auto_737007 ) ) ( not ( = ?auto_737003 ?auto_737008 ) ) ( not ( = ?auto_737003 ?auto_737009 ) ) ( not ( = ?auto_737003 ?auto_737010 ) ) ( not ( = ?auto_737003 ?auto_737011 ) ) ( not ( = ?auto_737003 ?auto_737012 ) ) ( not ( = ?auto_737004 ?auto_737005 ) ) ( not ( = ?auto_737004 ?auto_737006 ) ) ( not ( = ?auto_737004 ?auto_737007 ) ) ( not ( = ?auto_737004 ?auto_737008 ) ) ( not ( = ?auto_737004 ?auto_737009 ) ) ( not ( = ?auto_737004 ?auto_737010 ) ) ( not ( = ?auto_737004 ?auto_737011 ) ) ( not ( = ?auto_737004 ?auto_737012 ) ) ( not ( = ?auto_737005 ?auto_737006 ) ) ( not ( = ?auto_737005 ?auto_737007 ) ) ( not ( = ?auto_737005 ?auto_737008 ) ) ( not ( = ?auto_737005 ?auto_737009 ) ) ( not ( = ?auto_737005 ?auto_737010 ) ) ( not ( = ?auto_737005 ?auto_737011 ) ) ( not ( = ?auto_737005 ?auto_737012 ) ) ( not ( = ?auto_737006 ?auto_737007 ) ) ( not ( = ?auto_737006 ?auto_737008 ) ) ( not ( = ?auto_737006 ?auto_737009 ) ) ( not ( = ?auto_737006 ?auto_737010 ) ) ( not ( = ?auto_737006 ?auto_737011 ) ) ( not ( = ?auto_737006 ?auto_737012 ) ) ( not ( = ?auto_737007 ?auto_737008 ) ) ( not ( = ?auto_737007 ?auto_737009 ) ) ( not ( = ?auto_737007 ?auto_737010 ) ) ( not ( = ?auto_737007 ?auto_737011 ) ) ( not ( = ?auto_737007 ?auto_737012 ) ) ( not ( = ?auto_737008 ?auto_737009 ) ) ( not ( = ?auto_737008 ?auto_737010 ) ) ( not ( = ?auto_737008 ?auto_737011 ) ) ( not ( = ?auto_737008 ?auto_737012 ) ) ( not ( = ?auto_737009 ?auto_737010 ) ) ( not ( = ?auto_737009 ?auto_737011 ) ) ( not ( = ?auto_737009 ?auto_737012 ) ) ( not ( = ?auto_737010 ?auto_737011 ) ) ( not ( = ?auto_737010 ?auto_737012 ) ) ( not ( = ?auto_737011 ?auto_737012 ) ) ( ON ?auto_737010 ?auto_737011 ) ( ON ?auto_737009 ?auto_737010 ) ( ON ?auto_737008 ?auto_737009 ) ( ON ?auto_737007 ?auto_737008 ) ( ON ?auto_737006 ?auto_737007 ) ( ON ?auto_737005 ?auto_737006 ) ( ON ?auto_737004 ?auto_737005 ) ( CLEAR ?auto_737002 ) ( ON ?auto_737003 ?auto_737004 ) ( CLEAR ?auto_737003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_736997 ?auto_736998 ?auto_736999 ?auto_737000 ?auto_737001 ?auto_737002 ?auto_737003 )
      ( MAKE-15PILE ?auto_736997 ?auto_736998 ?auto_736999 ?auto_737000 ?auto_737001 ?auto_737002 ?auto_737003 ?auto_737004 ?auto_737005 ?auto_737006 ?auto_737007 ?auto_737008 ?auto_737009 ?auto_737010 ?auto_737011 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_737059 - BLOCK
      ?auto_737060 - BLOCK
      ?auto_737061 - BLOCK
      ?auto_737062 - BLOCK
      ?auto_737063 - BLOCK
      ?auto_737064 - BLOCK
      ?auto_737065 - BLOCK
      ?auto_737066 - BLOCK
      ?auto_737067 - BLOCK
      ?auto_737068 - BLOCK
      ?auto_737069 - BLOCK
      ?auto_737070 - BLOCK
      ?auto_737071 - BLOCK
      ?auto_737072 - BLOCK
      ?auto_737073 - BLOCK
    )
    :vars
    (
      ?auto_737074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737073 ?auto_737074 ) ( ON-TABLE ?auto_737059 ) ( ON ?auto_737060 ?auto_737059 ) ( ON ?auto_737061 ?auto_737060 ) ( ON ?auto_737062 ?auto_737061 ) ( ON ?auto_737063 ?auto_737062 ) ( not ( = ?auto_737059 ?auto_737060 ) ) ( not ( = ?auto_737059 ?auto_737061 ) ) ( not ( = ?auto_737059 ?auto_737062 ) ) ( not ( = ?auto_737059 ?auto_737063 ) ) ( not ( = ?auto_737059 ?auto_737064 ) ) ( not ( = ?auto_737059 ?auto_737065 ) ) ( not ( = ?auto_737059 ?auto_737066 ) ) ( not ( = ?auto_737059 ?auto_737067 ) ) ( not ( = ?auto_737059 ?auto_737068 ) ) ( not ( = ?auto_737059 ?auto_737069 ) ) ( not ( = ?auto_737059 ?auto_737070 ) ) ( not ( = ?auto_737059 ?auto_737071 ) ) ( not ( = ?auto_737059 ?auto_737072 ) ) ( not ( = ?auto_737059 ?auto_737073 ) ) ( not ( = ?auto_737059 ?auto_737074 ) ) ( not ( = ?auto_737060 ?auto_737061 ) ) ( not ( = ?auto_737060 ?auto_737062 ) ) ( not ( = ?auto_737060 ?auto_737063 ) ) ( not ( = ?auto_737060 ?auto_737064 ) ) ( not ( = ?auto_737060 ?auto_737065 ) ) ( not ( = ?auto_737060 ?auto_737066 ) ) ( not ( = ?auto_737060 ?auto_737067 ) ) ( not ( = ?auto_737060 ?auto_737068 ) ) ( not ( = ?auto_737060 ?auto_737069 ) ) ( not ( = ?auto_737060 ?auto_737070 ) ) ( not ( = ?auto_737060 ?auto_737071 ) ) ( not ( = ?auto_737060 ?auto_737072 ) ) ( not ( = ?auto_737060 ?auto_737073 ) ) ( not ( = ?auto_737060 ?auto_737074 ) ) ( not ( = ?auto_737061 ?auto_737062 ) ) ( not ( = ?auto_737061 ?auto_737063 ) ) ( not ( = ?auto_737061 ?auto_737064 ) ) ( not ( = ?auto_737061 ?auto_737065 ) ) ( not ( = ?auto_737061 ?auto_737066 ) ) ( not ( = ?auto_737061 ?auto_737067 ) ) ( not ( = ?auto_737061 ?auto_737068 ) ) ( not ( = ?auto_737061 ?auto_737069 ) ) ( not ( = ?auto_737061 ?auto_737070 ) ) ( not ( = ?auto_737061 ?auto_737071 ) ) ( not ( = ?auto_737061 ?auto_737072 ) ) ( not ( = ?auto_737061 ?auto_737073 ) ) ( not ( = ?auto_737061 ?auto_737074 ) ) ( not ( = ?auto_737062 ?auto_737063 ) ) ( not ( = ?auto_737062 ?auto_737064 ) ) ( not ( = ?auto_737062 ?auto_737065 ) ) ( not ( = ?auto_737062 ?auto_737066 ) ) ( not ( = ?auto_737062 ?auto_737067 ) ) ( not ( = ?auto_737062 ?auto_737068 ) ) ( not ( = ?auto_737062 ?auto_737069 ) ) ( not ( = ?auto_737062 ?auto_737070 ) ) ( not ( = ?auto_737062 ?auto_737071 ) ) ( not ( = ?auto_737062 ?auto_737072 ) ) ( not ( = ?auto_737062 ?auto_737073 ) ) ( not ( = ?auto_737062 ?auto_737074 ) ) ( not ( = ?auto_737063 ?auto_737064 ) ) ( not ( = ?auto_737063 ?auto_737065 ) ) ( not ( = ?auto_737063 ?auto_737066 ) ) ( not ( = ?auto_737063 ?auto_737067 ) ) ( not ( = ?auto_737063 ?auto_737068 ) ) ( not ( = ?auto_737063 ?auto_737069 ) ) ( not ( = ?auto_737063 ?auto_737070 ) ) ( not ( = ?auto_737063 ?auto_737071 ) ) ( not ( = ?auto_737063 ?auto_737072 ) ) ( not ( = ?auto_737063 ?auto_737073 ) ) ( not ( = ?auto_737063 ?auto_737074 ) ) ( not ( = ?auto_737064 ?auto_737065 ) ) ( not ( = ?auto_737064 ?auto_737066 ) ) ( not ( = ?auto_737064 ?auto_737067 ) ) ( not ( = ?auto_737064 ?auto_737068 ) ) ( not ( = ?auto_737064 ?auto_737069 ) ) ( not ( = ?auto_737064 ?auto_737070 ) ) ( not ( = ?auto_737064 ?auto_737071 ) ) ( not ( = ?auto_737064 ?auto_737072 ) ) ( not ( = ?auto_737064 ?auto_737073 ) ) ( not ( = ?auto_737064 ?auto_737074 ) ) ( not ( = ?auto_737065 ?auto_737066 ) ) ( not ( = ?auto_737065 ?auto_737067 ) ) ( not ( = ?auto_737065 ?auto_737068 ) ) ( not ( = ?auto_737065 ?auto_737069 ) ) ( not ( = ?auto_737065 ?auto_737070 ) ) ( not ( = ?auto_737065 ?auto_737071 ) ) ( not ( = ?auto_737065 ?auto_737072 ) ) ( not ( = ?auto_737065 ?auto_737073 ) ) ( not ( = ?auto_737065 ?auto_737074 ) ) ( not ( = ?auto_737066 ?auto_737067 ) ) ( not ( = ?auto_737066 ?auto_737068 ) ) ( not ( = ?auto_737066 ?auto_737069 ) ) ( not ( = ?auto_737066 ?auto_737070 ) ) ( not ( = ?auto_737066 ?auto_737071 ) ) ( not ( = ?auto_737066 ?auto_737072 ) ) ( not ( = ?auto_737066 ?auto_737073 ) ) ( not ( = ?auto_737066 ?auto_737074 ) ) ( not ( = ?auto_737067 ?auto_737068 ) ) ( not ( = ?auto_737067 ?auto_737069 ) ) ( not ( = ?auto_737067 ?auto_737070 ) ) ( not ( = ?auto_737067 ?auto_737071 ) ) ( not ( = ?auto_737067 ?auto_737072 ) ) ( not ( = ?auto_737067 ?auto_737073 ) ) ( not ( = ?auto_737067 ?auto_737074 ) ) ( not ( = ?auto_737068 ?auto_737069 ) ) ( not ( = ?auto_737068 ?auto_737070 ) ) ( not ( = ?auto_737068 ?auto_737071 ) ) ( not ( = ?auto_737068 ?auto_737072 ) ) ( not ( = ?auto_737068 ?auto_737073 ) ) ( not ( = ?auto_737068 ?auto_737074 ) ) ( not ( = ?auto_737069 ?auto_737070 ) ) ( not ( = ?auto_737069 ?auto_737071 ) ) ( not ( = ?auto_737069 ?auto_737072 ) ) ( not ( = ?auto_737069 ?auto_737073 ) ) ( not ( = ?auto_737069 ?auto_737074 ) ) ( not ( = ?auto_737070 ?auto_737071 ) ) ( not ( = ?auto_737070 ?auto_737072 ) ) ( not ( = ?auto_737070 ?auto_737073 ) ) ( not ( = ?auto_737070 ?auto_737074 ) ) ( not ( = ?auto_737071 ?auto_737072 ) ) ( not ( = ?auto_737071 ?auto_737073 ) ) ( not ( = ?auto_737071 ?auto_737074 ) ) ( not ( = ?auto_737072 ?auto_737073 ) ) ( not ( = ?auto_737072 ?auto_737074 ) ) ( not ( = ?auto_737073 ?auto_737074 ) ) ( ON ?auto_737072 ?auto_737073 ) ( ON ?auto_737071 ?auto_737072 ) ( ON ?auto_737070 ?auto_737071 ) ( ON ?auto_737069 ?auto_737070 ) ( ON ?auto_737068 ?auto_737069 ) ( ON ?auto_737067 ?auto_737068 ) ( ON ?auto_737066 ?auto_737067 ) ( ON ?auto_737065 ?auto_737066 ) ( CLEAR ?auto_737063 ) ( ON ?auto_737064 ?auto_737065 ) ( CLEAR ?auto_737064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_737059 ?auto_737060 ?auto_737061 ?auto_737062 ?auto_737063 ?auto_737064 )
      ( MAKE-15PILE ?auto_737059 ?auto_737060 ?auto_737061 ?auto_737062 ?auto_737063 ?auto_737064 ?auto_737065 ?auto_737066 ?auto_737067 ?auto_737068 ?auto_737069 ?auto_737070 ?auto_737071 ?auto_737072 ?auto_737073 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_737121 - BLOCK
      ?auto_737122 - BLOCK
      ?auto_737123 - BLOCK
      ?auto_737124 - BLOCK
      ?auto_737125 - BLOCK
      ?auto_737126 - BLOCK
      ?auto_737127 - BLOCK
      ?auto_737128 - BLOCK
      ?auto_737129 - BLOCK
      ?auto_737130 - BLOCK
      ?auto_737131 - BLOCK
      ?auto_737132 - BLOCK
      ?auto_737133 - BLOCK
      ?auto_737134 - BLOCK
      ?auto_737135 - BLOCK
    )
    :vars
    (
      ?auto_737136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737135 ?auto_737136 ) ( ON-TABLE ?auto_737121 ) ( ON ?auto_737122 ?auto_737121 ) ( ON ?auto_737123 ?auto_737122 ) ( ON ?auto_737124 ?auto_737123 ) ( not ( = ?auto_737121 ?auto_737122 ) ) ( not ( = ?auto_737121 ?auto_737123 ) ) ( not ( = ?auto_737121 ?auto_737124 ) ) ( not ( = ?auto_737121 ?auto_737125 ) ) ( not ( = ?auto_737121 ?auto_737126 ) ) ( not ( = ?auto_737121 ?auto_737127 ) ) ( not ( = ?auto_737121 ?auto_737128 ) ) ( not ( = ?auto_737121 ?auto_737129 ) ) ( not ( = ?auto_737121 ?auto_737130 ) ) ( not ( = ?auto_737121 ?auto_737131 ) ) ( not ( = ?auto_737121 ?auto_737132 ) ) ( not ( = ?auto_737121 ?auto_737133 ) ) ( not ( = ?auto_737121 ?auto_737134 ) ) ( not ( = ?auto_737121 ?auto_737135 ) ) ( not ( = ?auto_737121 ?auto_737136 ) ) ( not ( = ?auto_737122 ?auto_737123 ) ) ( not ( = ?auto_737122 ?auto_737124 ) ) ( not ( = ?auto_737122 ?auto_737125 ) ) ( not ( = ?auto_737122 ?auto_737126 ) ) ( not ( = ?auto_737122 ?auto_737127 ) ) ( not ( = ?auto_737122 ?auto_737128 ) ) ( not ( = ?auto_737122 ?auto_737129 ) ) ( not ( = ?auto_737122 ?auto_737130 ) ) ( not ( = ?auto_737122 ?auto_737131 ) ) ( not ( = ?auto_737122 ?auto_737132 ) ) ( not ( = ?auto_737122 ?auto_737133 ) ) ( not ( = ?auto_737122 ?auto_737134 ) ) ( not ( = ?auto_737122 ?auto_737135 ) ) ( not ( = ?auto_737122 ?auto_737136 ) ) ( not ( = ?auto_737123 ?auto_737124 ) ) ( not ( = ?auto_737123 ?auto_737125 ) ) ( not ( = ?auto_737123 ?auto_737126 ) ) ( not ( = ?auto_737123 ?auto_737127 ) ) ( not ( = ?auto_737123 ?auto_737128 ) ) ( not ( = ?auto_737123 ?auto_737129 ) ) ( not ( = ?auto_737123 ?auto_737130 ) ) ( not ( = ?auto_737123 ?auto_737131 ) ) ( not ( = ?auto_737123 ?auto_737132 ) ) ( not ( = ?auto_737123 ?auto_737133 ) ) ( not ( = ?auto_737123 ?auto_737134 ) ) ( not ( = ?auto_737123 ?auto_737135 ) ) ( not ( = ?auto_737123 ?auto_737136 ) ) ( not ( = ?auto_737124 ?auto_737125 ) ) ( not ( = ?auto_737124 ?auto_737126 ) ) ( not ( = ?auto_737124 ?auto_737127 ) ) ( not ( = ?auto_737124 ?auto_737128 ) ) ( not ( = ?auto_737124 ?auto_737129 ) ) ( not ( = ?auto_737124 ?auto_737130 ) ) ( not ( = ?auto_737124 ?auto_737131 ) ) ( not ( = ?auto_737124 ?auto_737132 ) ) ( not ( = ?auto_737124 ?auto_737133 ) ) ( not ( = ?auto_737124 ?auto_737134 ) ) ( not ( = ?auto_737124 ?auto_737135 ) ) ( not ( = ?auto_737124 ?auto_737136 ) ) ( not ( = ?auto_737125 ?auto_737126 ) ) ( not ( = ?auto_737125 ?auto_737127 ) ) ( not ( = ?auto_737125 ?auto_737128 ) ) ( not ( = ?auto_737125 ?auto_737129 ) ) ( not ( = ?auto_737125 ?auto_737130 ) ) ( not ( = ?auto_737125 ?auto_737131 ) ) ( not ( = ?auto_737125 ?auto_737132 ) ) ( not ( = ?auto_737125 ?auto_737133 ) ) ( not ( = ?auto_737125 ?auto_737134 ) ) ( not ( = ?auto_737125 ?auto_737135 ) ) ( not ( = ?auto_737125 ?auto_737136 ) ) ( not ( = ?auto_737126 ?auto_737127 ) ) ( not ( = ?auto_737126 ?auto_737128 ) ) ( not ( = ?auto_737126 ?auto_737129 ) ) ( not ( = ?auto_737126 ?auto_737130 ) ) ( not ( = ?auto_737126 ?auto_737131 ) ) ( not ( = ?auto_737126 ?auto_737132 ) ) ( not ( = ?auto_737126 ?auto_737133 ) ) ( not ( = ?auto_737126 ?auto_737134 ) ) ( not ( = ?auto_737126 ?auto_737135 ) ) ( not ( = ?auto_737126 ?auto_737136 ) ) ( not ( = ?auto_737127 ?auto_737128 ) ) ( not ( = ?auto_737127 ?auto_737129 ) ) ( not ( = ?auto_737127 ?auto_737130 ) ) ( not ( = ?auto_737127 ?auto_737131 ) ) ( not ( = ?auto_737127 ?auto_737132 ) ) ( not ( = ?auto_737127 ?auto_737133 ) ) ( not ( = ?auto_737127 ?auto_737134 ) ) ( not ( = ?auto_737127 ?auto_737135 ) ) ( not ( = ?auto_737127 ?auto_737136 ) ) ( not ( = ?auto_737128 ?auto_737129 ) ) ( not ( = ?auto_737128 ?auto_737130 ) ) ( not ( = ?auto_737128 ?auto_737131 ) ) ( not ( = ?auto_737128 ?auto_737132 ) ) ( not ( = ?auto_737128 ?auto_737133 ) ) ( not ( = ?auto_737128 ?auto_737134 ) ) ( not ( = ?auto_737128 ?auto_737135 ) ) ( not ( = ?auto_737128 ?auto_737136 ) ) ( not ( = ?auto_737129 ?auto_737130 ) ) ( not ( = ?auto_737129 ?auto_737131 ) ) ( not ( = ?auto_737129 ?auto_737132 ) ) ( not ( = ?auto_737129 ?auto_737133 ) ) ( not ( = ?auto_737129 ?auto_737134 ) ) ( not ( = ?auto_737129 ?auto_737135 ) ) ( not ( = ?auto_737129 ?auto_737136 ) ) ( not ( = ?auto_737130 ?auto_737131 ) ) ( not ( = ?auto_737130 ?auto_737132 ) ) ( not ( = ?auto_737130 ?auto_737133 ) ) ( not ( = ?auto_737130 ?auto_737134 ) ) ( not ( = ?auto_737130 ?auto_737135 ) ) ( not ( = ?auto_737130 ?auto_737136 ) ) ( not ( = ?auto_737131 ?auto_737132 ) ) ( not ( = ?auto_737131 ?auto_737133 ) ) ( not ( = ?auto_737131 ?auto_737134 ) ) ( not ( = ?auto_737131 ?auto_737135 ) ) ( not ( = ?auto_737131 ?auto_737136 ) ) ( not ( = ?auto_737132 ?auto_737133 ) ) ( not ( = ?auto_737132 ?auto_737134 ) ) ( not ( = ?auto_737132 ?auto_737135 ) ) ( not ( = ?auto_737132 ?auto_737136 ) ) ( not ( = ?auto_737133 ?auto_737134 ) ) ( not ( = ?auto_737133 ?auto_737135 ) ) ( not ( = ?auto_737133 ?auto_737136 ) ) ( not ( = ?auto_737134 ?auto_737135 ) ) ( not ( = ?auto_737134 ?auto_737136 ) ) ( not ( = ?auto_737135 ?auto_737136 ) ) ( ON ?auto_737134 ?auto_737135 ) ( ON ?auto_737133 ?auto_737134 ) ( ON ?auto_737132 ?auto_737133 ) ( ON ?auto_737131 ?auto_737132 ) ( ON ?auto_737130 ?auto_737131 ) ( ON ?auto_737129 ?auto_737130 ) ( ON ?auto_737128 ?auto_737129 ) ( ON ?auto_737127 ?auto_737128 ) ( ON ?auto_737126 ?auto_737127 ) ( CLEAR ?auto_737124 ) ( ON ?auto_737125 ?auto_737126 ) ( CLEAR ?auto_737125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_737121 ?auto_737122 ?auto_737123 ?auto_737124 ?auto_737125 )
      ( MAKE-15PILE ?auto_737121 ?auto_737122 ?auto_737123 ?auto_737124 ?auto_737125 ?auto_737126 ?auto_737127 ?auto_737128 ?auto_737129 ?auto_737130 ?auto_737131 ?auto_737132 ?auto_737133 ?auto_737134 ?auto_737135 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_737183 - BLOCK
      ?auto_737184 - BLOCK
      ?auto_737185 - BLOCK
      ?auto_737186 - BLOCK
      ?auto_737187 - BLOCK
      ?auto_737188 - BLOCK
      ?auto_737189 - BLOCK
      ?auto_737190 - BLOCK
      ?auto_737191 - BLOCK
      ?auto_737192 - BLOCK
      ?auto_737193 - BLOCK
      ?auto_737194 - BLOCK
      ?auto_737195 - BLOCK
      ?auto_737196 - BLOCK
      ?auto_737197 - BLOCK
    )
    :vars
    (
      ?auto_737198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737197 ?auto_737198 ) ( ON-TABLE ?auto_737183 ) ( ON ?auto_737184 ?auto_737183 ) ( ON ?auto_737185 ?auto_737184 ) ( not ( = ?auto_737183 ?auto_737184 ) ) ( not ( = ?auto_737183 ?auto_737185 ) ) ( not ( = ?auto_737183 ?auto_737186 ) ) ( not ( = ?auto_737183 ?auto_737187 ) ) ( not ( = ?auto_737183 ?auto_737188 ) ) ( not ( = ?auto_737183 ?auto_737189 ) ) ( not ( = ?auto_737183 ?auto_737190 ) ) ( not ( = ?auto_737183 ?auto_737191 ) ) ( not ( = ?auto_737183 ?auto_737192 ) ) ( not ( = ?auto_737183 ?auto_737193 ) ) ( not ( = ?auto_737183 ?auto_737194 ) ) ( not ( = ?auto_737183 ?auto_737195 ) ) ( not ( = ?auto_737183 ?auto_737196 ) ) ( not ( = ?auto_737183 ?auto_737197 ) ) ( not ( = ?auto_737183 ?auto_737198 ) ) ( not ( = ?auto_737184 ?auto_737185 ) ) ( not ( = ?auto_737184 ?auto_737186 ) ) ( not ( = ?auto_737184 ?auto_737187 ) ) ( not ( = ?auto_737184 ?auto_737188 ) ) ( not ( = ?auto_737184 ?auto_737189 ) ) ( not ( = ?auto_737184 ?auto_737190 ) ) ( not ( = ?auto_737184 ?auto_737191 ) ) ( not ( = ?auto_737184 ?auto_737192 ) ) ( not ( = ?auto_737184 ?auto_737193 ) ) ( not ( = ?auto_737184 ?auto_737194 ) ) ( not ( = ?auto_737184 ?auto_737195 ) ) ( not ( = ?auto_737184 ?auto_737196 ) ) ( not ( = ?auto_737184 ?auto_737197 ) ) ( not ( = ?auto_737184 ?auto_737198 ) ) ( not ( = ?auto_737185 ?auto_737186 ) ) ( not ( = ?auto_737185 ?auto_737187 ) ) ( not ( = ?auto_737185 ?auto_737188 ) ) ( not ( = ?auto_737185 ?auto_737189 ) ) ( not ( = ?auto_737185 ?auto_737190 ) ) ( not ( = ?auto_737185 ?auto_737191 ) ) ( not ( = ?auto_737185 ?auto_737192 ) ) ( not ( = ?auto_737185 ?auto_737193 ) ) ( not ( = ?auto_737185 ?auto_737194 ) ) ( not ( = ?auto_737185 ?auto_737195 ) ) ( not ( = ?auto_737185 ?auto_737196 ) ) ( not ( = ?auto_737185 ?auto_737197 ) ) ( not ( = ?auto_737185 ?auto_737198 ) ) ( not ( = ?auto_737186 ?auto_737187 ) ) ( not ( = ?auto_737186 ?auto_737188 ) ) ( not ( = ?auto_737186 ?auto_737189 ) ) ( not ( = ?auto_737186 ?auto_737190 ) ) ( not ( = ?auto_737186 ?auto_737191 ) ) ( not ( = ?auto_737186 ?auto_737192 ) ) ( not ( = ?auto_737186 ?auto_737193 ) ) ( not ( = ?auto_737186 ?auto_737194 ) ) ( not ( = ?auto_737186 ?auto_737195 ) ) ( not ( = ?auto_737186 ?auto_737196 ) ) ( not ( = ?auto_737186 ?auto_737197 ) ) ( not ( = ?auto_737186 ?auto_737198 ) ) ( not ( = ?auto_737187 ?auto_737188 ) ) ( not ( = ?auto_737187 ?auto_737189 ) ) ( not ( = ?auto_737187 ?auto_737190 ) ) ( not ( = ?auto_737187 ?auto_737191 ) ) ( not ( = ?auto_737187 ?auto_737192 ) ) ( not ( = ?auto_737187 ?auto_737193 ) ) ( not ( = ?auto_737187 ?auto_737194 ) ) ( not ( = ?auto_737187 ?auto_737195 ) ) ( not ( = ?auto_737187 ?auto_737196 ) ) ( not ( = ?auto_737187 ?auto_737197 ) ) ( not ( = ?auto_737187 ?auto_737198 ) ) ( not ( = ?auto_737188 ?auto_737189 ) ) ( not ( = ?auto_737188 ?auto_737190 ) ) ( not ( = ?auto_737188 ?auto_737191 ) ) ( not ( = ?auto_737188 ?auto_737192 ) ) ( not ( = ?auto_737188 ?auto_737193 ) ) ( not ( = ?auto_737188 ?auto_737194 ) ) ( not ( = ?auto_737188 ?auto_737195 ) ) ( not ( = ?auto_737188 ?auto_737196 ) ) ( not ( = ?auto_737188 ?auto_737197 ) ) ( not ( = ?auto_737188 ?auto_737198 ) ) ( not ( = ?auto_737189 ?auto_737190 ) ) ( not ( = ?auto_737189 ?auto_737191 ) ) ( not ( = ?auto_737189 ?auto_737192 ) ) ( not ( = ?auto_737189 ?auto_737193 ) ) ( not ( = ?auto_737189 ?auto_737194 ) ) ( not ( = ?auto_737189 ?auto_737195 ) ) ( not ( = ?auto_737189 ?auto_737196 ) ) ( not ( = ?auto_737189 ?auto_737197 ) ) ( not ( = ?auto_737189 ?auto_737198 ) ) ( not ( = ?auto_737190 ?auto_737191 ) ) ( not ( = ?auto_737190 ?auto_737192 ) ) ( not ( = ?auto_737190 ?auto_737193 ) ) ( not ( = ?auto_737190 ?auto_737194 ) ) ( not ( = ?auto_737190 ?auto_737195 ) ) ( not ( = ?auto_737190 ?auto_737196 ) ) ( not ( = ?auto_737190 ?auto_737197 ) ) ( not ( = ?auto_737190 ?auto_737198 ) ) ( not ( = ?auto_737191 ?auto_737192 ) ) ( not ( = ?auto_737191 ?auto_737193 ) ) ( not ( = ?auto_737191 ?auto_737194 ) ) ( not ( = ?auto_737191 ?auto_737195 ) ) ( not ( = ?auto_737191 ?auto_737196 ) ) ( not ( = ?auto_737191 ?auto_737197 ) ) ( not ( = ?auto_737191 ?auto_737198 ) ) ( not ( = ?auto_737192 ?auto_737193 ) ) ( not ( = ?auto_737192 ?auto_737194 ) ) ( not ( = ?auto_737192 ?auto_737195 ) ) ( not ( = ?auto_737192 ?auto_737196 ) ) ( not ( = ?auto_737192 ?auto_737197 ) ) ( not ( = ?auto_737192 ?auto_737198 ) ) ( not ( = ?auto_737193 ?auto_737194 ) ) ( not ( = ?auto_737193 ?auto_737195 ) ) ( not ( = ?auto_737193 ?auto_737196 ) ) ( not ( = ?auto_737193 ?auto_737197 ) ) ( not ( = ?auto_737193 ?auto_737198 ) ) ( not ( = ?auto_737194 ?auto_737195 ) ) ( not ( = ?auto_737194 ?auto_737196 ) ) ( not ( = ?auto_737194 ?auto_737197 ) ) ( not ( = ?auto_737194 ?auto_737198 ) ) ( not ( = ?auto_737195 ?auto_737196 ) ) ( not ( = ?auto_737195 ?auto_737197 ) ) ( not ( = ?auto_737195 ?auto_737198 ) ) ( not ( = ?auto_737196 ?auto_737197 ) ) ( not ( = ?auto_737196 ?auto_737198 ) ) ( not ( = ?auto_737197 ?auto_737198 ) ) ( ON ?auto_737196 ?auto_737197 ) ( ON ?auto_737195 ?auto_737196 ) ( ON ?auto_737194 ?auto_737195 ) ( ON ?auto_737193 ?auto_737194 ) ( ON ?auto_737192 ?auto_737193 ) ( ON ?auto_737191 ?auto_737192 ) ( ON ?auto_737190 ?auto_737191 ) ( ON ?auto_737189 ?auto_737190 ) ( ON ?auto_737188 ?auto_737189 ) ( ON ?auto_737187 ?auto_737188 ) ( CLEAR ?auto_737185 ) ( ON ?auto_737186 ?auto_737187 ) ( CLEAR ?auto_737186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_737183 ?auto_737184 ?auto_737185 ?auto_737186 )
      ( MAKE-15PILE ?auto_737183 ?auto_737184 ?auto_737185 ?auto_737186 ?auto_737187 ?auto_737188 ?auto_737189 ?auto_737190 ?auto_737191 ?auto_737192 ?auto_737193 ?auto_737194 ?auto_737195 ?auto_737196 ?auto_737197 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_737245 - BLOCK
      ?auto_737246 - BLOCK
      ?auto_737247 - BLOCK
      ?auto_737248 - BLOCK
      ?auto_737249 - BLOCK
      ?auto_737250 - BLOCK
      ?auto_737251 - BLOCK
      ?auto_737252 - BLOCK
      ?auto_737253 - BLOCK
      ?auto_737254 - BLOCK
      ?auto_737255 - BLOCK
      ?auto_737256 - BLOCK
      ?auto_737257 - BLOCK
      ?auto_737258 - BLOCK
      ?auto_737259 - BLOCK
    )
    :vars
    (
      ?auto_737260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737259 ?auto_737260 ) ( ON-TABLE ?auto_737245 ) ( ON ?auto_737246 ?auto_737245 ) ( not ( = ?auto_737245 ?auto_737246 ) ) ( not ( = ?auto_737245 ?auto_737247 ) ) ( not ( = ?auto_737245 ?auto_737248 ) ) ( not ( = ?auto_737245 ?auto_737249 ) ) ( not ( = ?auto_737245 ?auto_737250 ) ) ( not ( = ?auto_737245 ?auto_737251 ) ) ( not ( = ?auto_737245 ?auto_737252 ) ) ( not ( = ?auto_737245 ?auto_737253 ) ) ( not ( = ?auto_737245 ?auto_737254 ) ) ( not ( = ?auto_737245 ?auto_737255 ) ) ( not ( = ?auto_737245 ?auto_737256 ) ) ( not ( = ?auto_737245 ?auto_737257 ) ) ( not ( = ?auto_737245 ?auto_737258 ) ) ( not ( = ?auto_737245 ?auto_737259 ) ) ( not ( = ?auto_737245 ?auto_737260 ) ) ( not ( = ?auto_737246 ?auto_737247 ) ) ( not ( = ?auto_737246 ?auto_737248 ) ) ( not ( = ?auto_737246 ?auto_737249 ) ) ( not ( = ?auto_737246 ?auto_737250 ) ) ( not ( = ?auto_737246 ?auto_737251 ) ) ( not ( = ?auto_737246 ?auto_737252 ) ) ( not ( = ?auto_737246 ?auto_737253 ) ) ( not ( = ?auto_737246 ?auto_737254 ) ) ( not ( = ?auto_737246 ?auto_737255 ) ) ( not ( = ?auto_737246 ?auto_737256 ) ) ( not ( = ?auto_737246 ?auto_737257 ) ) ( not ( = ?auto_737246 ?auto_737258 ) ) ( not ( = ?auto_737246 ?auto_737259 ) ) ( not ( = ?auto_737246 ?auto_737260 ) ) ( not ( = ?auto_737247 ?auto_737248 ) ) ( not ( = ?auto_737247 ?auto_737249 ) ) ( not ( = ?auto_737247 ?auto_737250 ) ) ( not ( = ?auto_737247 ?auto_737251 ) ) ( not ( = ?auto_737247 ?auto_737252 ) ) ( not ( = ?auto_737247 ?auto_737253 ) ) ( not ( = ?auto_737247 ?auto_737254 ) ) ( not ( = ?auto_737247 ?auto_737255 ) ) ( not ( = ?auto_737247 ?auto_737256 ) ) ( not ( = ?auto_737247 ?auto_737257 ) ) ( not ( = ?auto_737247 ?auto_737258 ) ) ( not ( = ?auto_737247 ?auto_737259 ) ) ( not ( = ?auto_737247 ?auto_737260 ) ) ( not ( = ?auto_737248 ?auto_737249 ) ) ( not ( = ?auto_737248 ?auto_737250 ) ) ( not ( = ?auto_737248 ?auto_737251 ) ) ( not ( = ?auto_737248 ?auto_737252 ) ) ( not ( = ?auto_737248 ?auto_737253 ) ) ( not ( = ?auto_737248 ?auto_737254 ) ) ( not ( = ?auto_737248 ?auto_737255 ) ) ( not ( = ?auto_737248 ?auto_737256 ) ) ( not ( = ?auto_737248 ?auto_737257 ) ) ( not ( = ?auto_737248 ?auto_737258 ) ) ( not ( = ?auto_737248 ?auto_737259 ) ) ( not ( = ?auto_737248 ?auto_737260 ) ) ( not ( = ?auto_737249 ?auto_737250 ) ) ( not ( = ?auto_737249 ?auto_737251 ) ) ( not ( = ?auto_737249 ?auto_737252 ) ) ( not ( = ?auto_737249 ?auto_737253 ) ) ( not ( = ?auto_737249 ?auto_737254 ) ) ( not ( = ?auto_737249 ?auto_737255 ) ) ( not ( = ?auto_737249 ?auto_737256 ) ) ( not ( = ?auto_737249 ?auto_737257 ) ) ( not ( = ?auto_737249 ?auto_737258 ) ) ( not ( = ?auto_737249 ?auto_737259 ) ) ( not ( = ?auto_737249 ?auto_737260 ) ) ( not ( = ?auto_737250 ?auto_737251 ) ) ( not ( = ?auto_737250 ?auto_737252 ) ) ( not ( = ?auto_737250 ?auto_737253 ) ) ( not ( = ?auto_737250 ?auto_737254 ) ) ( not ( = ?auto_737250 ?auto_737255 ) ) ( not ( = ?auto_737250 ?auto_737256 ) ) ( not ( = ?auto_737250 ?auto_737257 ) ) ( not ( = ?auto_737250 ?auto_737258 ) ) ( not ( = ?auto_737250 ?auto_737259 ) ) ( not ( = ?auto_737250 ?auto_737260 ) ) ( not ( = ?auto_737251 ?auto_737252 ) ) ( not ( = ?auto_737251 ?auto_737253 ) ) ( not ( = ?auto_737251 ?auto_737254 ) ) ( not ( = ?auto_737251 ?auto_737255 ) ) ( not ( = ?auto_737251 ?auto_737256 ) ) ( not ( = ?auto_737251 ?auto_737257 ) ) ( not ( = ?auto_737251 ?auto_737258 ) ) ( not ( = ?auto_737251 ?auto_737259 ) ) ( not ( = ?auto_737251 ?auto_737260 ) ) ( not ( = ?auto_737252 ?auto_737253 ) ) ( not ( = ?auto_737252 ?auto_737254 ) ) ( not ( = ?auto_737252 ?auto_737255 ) ) ( not ( = ?auto_737252 ?auto_737256 ) ) ( not ( = ?auto_737252 ?auto_737257 ) ) ( not ( = ?auto_737252 ?auto_737258 ) ) ( not ( = ?auto_737252 ?auto_737259 ) ) ( not ( = ?auto_737252 ?auto_737260 ) ) ( not ( = ?auto_737253 ?auto_737254 ) ) ( not ( = ?auto_737253 ?auto_737255 ) ) ( not ( = ?auto_737253 ?auto_737256 ) ) ( not ( = ?auto_737253 ?auto_737257 ) ) ( not ( = ?auto_737253 ?auto_737258 ) ) ( not ( = ?auto_737253 ?auto_737259 ) ) ( not ( = ?auto_737253 ?auto_737260 ) ) ( not ( = ?auto_737254 ?auto_737255 ) ) ( not ( = ?auto_737254 ?auto_737256 ) ) ( not ( = ?auto_737254 ?auto_737257 ) ) ( not ( = ?auto_737254 ?auto_737258 ) ) ( not ( = ?auto_737254 ?auto_737259 ) ) ( not ( = ?auto_737254 ?auto_737260 ) ) ( not ( = ?auto_737255 ?auto_737256 ) ) ( not ( = ?auto_737255 ?auto_737257 ) ) ( not ( = ?auto_737255 ?auto_737258 ) ) ( not ( = ?auto_737255 ?auto_737259 ) ) ( not ( = ?auto_737255 ?auto_737260 ) ) ( not ( = ?auto_737256 ?auto_737257 ) ) ( not ( = ?auto_737256 ?auto_737258 ) ) ( not ( = ?auto_737256 ?auto_737259 ) ) ( not ( = ?auto_737256 ?auto_737260 ) ) ( not ( = ?auto_737257 ?auto_737258 ) ) ( not ( = ?auto_737257 ?auto_737259 ) ) ( not ( = ?auto_737257 ?auto_737260 ) ) ( not ( = ?auto_737258 ?auto_737259 ) ) ( not ( = ?auto_737258 ?auto_737260 ) ) ( not ( = ?auto_737259 ?auto_737260 ) ) ( ON ?auto_737258 ?auto_737259 ) ( ON ?auto_737257 ?auto_737258 ) ( ON ?auto_737256 ?auto_737257 ) ( ON ?auto_737255 ?auto_737256 ) ( ON ?auto_737254 ?auto_737255 ) ( ON ?auto_737253 ?auto_737254 ) ( ON ?auto_737252 ?auto_737253 ) ( ON ?auto_737251 ?auto_737252 ) ( ON ?auto_737250 ?auto_737251 ) ( ON ?auto_737249 ?auto_737250 ) ( ON ?auto_737248 ?auto_737249 ) ( CLEAR ?auto_737246 ) ( ON ?auto_737247 ?auto_737248 ) ( CLEAR ?auto_737247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_737245 ?auto_737246 ?auto_737247 )
      ( MAKE-15PILE ?auto_737245 ?auto_737246 ?auto_737247 ?auto_737248 ?auto_737249 ?auto_737250 ?auto_737251 ?auto_737252 ?auto_737253 ?auto_737254 ?auto_737255 ?auto_737256 ?auto_737257 ?auto_737258 ?auto_737259 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_737307 - BLOCK
      ?auto_737308 - BLOCK
      ?auto_737309 - BLOCK
      ?auto_737310 - BLOCK
      ?auto_737311 - BLOCK
      ?auto_737312 - BLOCK
      ?auto_737313 - BLOCK
      ?auto_737314 - BLOCK
      ?auto_737315 - BLOCK
      ?auto_737316 - BLOCK
      ?auto_737317 - BLOCK
      ?auto_737318 - BLOCK
      ?auto_737319 - BLOCK
      ?auto_737320 - BLOCK
      ?auto_737321 - BLOCK
    )
    :vars
    (
      ?auto_737322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737321 ?auto_737322 ) ( ON-TABLE ?auto_737307 ) ( not ( = ?auto_737307 ?auto_737308 ) ) ( not ( = ?auto_737307 ?auto_737309 ) ) ( not ( = ?auto_737307 ?auto_737310 ) ) ( not ( = ?auto_737307 ?auto_737311 ) ) ( not ( = ?auto_737307 ?auto_737312 ) ) ( not ( = ?auto_737307 ?auto_737313 ) ) ( not ( = ?auto_737307 ?auto_737314 ) ) ( not ( = ?auto_737307 ?auto_737315 ) ) ( not ( = ?auto_737307 ?auto_737316 ) ) ( not ( = ?auto_737307 ?auto_737317 ) ) ( not ( = ?auto_737307 ?auto_737318 ) ) ( not ( = ?auto_737307 ?auto_737319 ) ) ( not ( = ?auto_737307 ?auto_737320 ) ) ( not ( = ?auto_737307 ?auto_737321 ) ) ( not ( = ?auto_737307 ?auto_737322 ) ) ( not ( = ?auto_737308 ?auto_737309 ) ) ( not ( = ?auto_737308 ?auto_737310 ) ) ( not ( = ?auto_737308 ?auto_737311 ) ) ( not ( = ?auto_737308 ?auto_737312 ) ) ( not ( = ?auto_737308 ?auto_737313 ) ) ( not ( = ?auto_737308 ?auto_737314 ) ) ( not ( = ?auto_737308 ?auto_737315 ) ) ( not ( = ?auto_737308 ?auto_737316 ) ) ( not ( = ?auto_737308 ?auto_737317 ) ) ( not ( = ?auto_737308 ?auto_737318 ) ) ( not ( = ?auto_737308 ?auto_737319 ) ) ( not ( = ?auto_737308 ?auto_737320 ) ) ( not ( = ?auto_737308 ?auto_737321 ) ) ( not ( = ?auto_737308 ?auto_737322 ) ) ( not ( = ?auto_737309 ?auto_737310 ) ) ( not ( = ?auto_737309 ?auto_737311 ) ) ( not ( = ?auto_737309 ?auto_737312 ) ) ( not ( = ?auto_737309 ?auto_737313 ) ) ( not ( = ?auto_737309 ?auto_737314 ) ) ( not ( = ?auto_737309 ?auto_737315 ) ) ( not ( = ?auto_737309 ?auto_737316 ) ) ( not ( = ?auto_737309 ?auto_737317 ) ) ( not ( = ?auto_737309 ?auto_737318 ) ) ( not ( = ?auto_737309 ?auto_737319 ) ) ( not ( = ?auto_737309 ?auto_737320 ) ) ( not ( = ?auto_737309 ?auto_737321 ) ) ( not ( = ?auto_737309 ?auto_737322 ) ) ( not ( = ?auto_737310 ?auto_737311 ) ) ( not ( = ?auto_737310 ?auto_737312 ) ) ( not ( = ?auto_737310 ?auto_737313 ) ) ( not ( = ?auto_737310 ?auto_737314 ) ) ( not ( = ?auto_737310 ?auto_737315 ) ) ( not ( = ?auto_737310 ?auto_737316 ) ) ( not ( = ?auto_737310 ?auto_737317 ) ) ( not ( = ?auto_737310 ?auto_737318 ) ) ( not ( = ?auto_737310 ?auto_737319 ) ) ( not ( = ?auto_737310 ?auto_737320 ) ) ( not ( = ?auto_737310 ?auto_737321 ) ) ( not ( = ?auto_737310 ?auto_737322 ) ) ( not ( = ?auto_737311 ?auto_737312 ) ) ( not ( = ?auto_737311 ?auto_737313 ) ) ( not ( = ?auto_737311 ?auto_737314 ) ) ( not ( = ?auto_737311 ?auto_737315 ) ) ( not ( = ?auto_737311 ?auto_737316 ) ) ( not ( = ?auto_737311 ?auto_737317 ) ) ( not ( = ?auto_737311 ?auto_737318 ) ) ( not ( = ?auto_737311 ?auto_737319 ) ) ( not ( = ?auto_737311 ?auto_737320 ) ) ( not ( = ?auto_737311 ?auto_737321 ) ) ( not ( = ?auto_737311 ?auto_737322 ) ) ( not ( = ?auto_737312 ?auto_737313 ) ) ( not ( = ?auto_737312 ?auto_737314 ) ) ( not ( = ?auto_737312 ?auto_737315 ) ) ( not ( = ?auto_737312 ?auto_737316 ) ) ( not ( = ?auto_737312 ?auto_737317 ) ) ( not ( = ?auto_737312 ?auto_737318 ) ) ( not ( = ?auto_737312 ?auto_737319 ) ) ( not ( = ?auto_737312 ?auto_737320 ) ) ( not ( = ?auto_737312 ?auto_737321 ) ) ( not ( = ?auto_737312 ?auto_737322 ) ) ( not ( = ?auto_737313 ?auto_737314 ) ) ( not ( = ?auto_737313 ?auto_737315 ) ) ( not ( = ?auto_737313 ?auto_737316 ) ) ( not ( = ?auto_737313 ?auto_737317 ) ) ( not ( = ?auto_737313 ?auto_737318 ) ) ( not ( = ?auto_737313 ?auto_737319 ) ) ( not ( = ?auto_737313 ?auto_737320 ) ) ( not ( = ?auto_737313 ?auto_737321 ) ) ( not ( = ?auto_737313 ?auto_737322 ) ) ( not ( = ?auto_737314 ?auto_737315 ) ) ( not ( = ?auto_737314 ?auto_737316 ) ) ( not ( = ?auto_737314 ?auto_737317 ) ) ( not ( = ?auto_737314 ?auto_737318 ) ) ( not ( = ?auto_737314 ?auto_737319 ) ) ( not ( = ?auto_737314 ?auto_737320 ) ) ( not ( = ?auto_737314 ?auto_737321 ) ) ( not ( = ?auto_737314 ?auto_737322 ) ) ( not ( = ?auto_737315 ?auto_737316 ) ) ( not ( = ?auto_737315 ?auto_737317 ) ) ( not ( = ?auto_737315 ?auto_737318 ) ) ( not ( = ?auto_737315 ?auto_737319 ) ) ( not ( = ?auto_737315 ?auto_737320 ) ) ( not ( = ?auto_737315 ?auto_737321 ) ) ( not ( = ?auto_737315 ?auto_737322 ) ) ( not ( = ?auto_737316 ?auto_737317 ) ) ( not ( = ?auto_737316 ?auto_737318 ) ) ( not ( = ?auto_737316 ?auto_737319 ) ) ( not ( = ?auto_737316 ?auto_737320 ) ) ( not ( = ?auto_737316 ?auto_737321 ) ) ( not ( = ?auto_737316 ?auto_737322 ) ) ( not ( = ?auto_737317 ?auto_737318 ) ) ( not ( = ?auto_737317 ?auto_737319 ) ) ( not ( = ?auto_737317 ?auto_737320 ) ) ( not ( = ?auto_737317 ?auto_737321 ) ) ( not ( = ?auto_737317 ?auto_737322 ) ) ( not ( = ?auto_737318 ?auto_737319 ) ) ( not ( = ?auto_737318 ?auto_737320 ) ) ( not ( = ?auto_737318 ?auto_737321 ) ) ( not ( = ?auto_737318 ?auto_737322 ) ) ( not ( = ?auto_737319 ?auto_737320 ) ) ( not ( = ?auto_737319 ?auto_737321 ) ) ( not ( = ?auto_737319 ?auto_737322 ) ) ( not ( = ?auto_737320 ?auto_737321 ) ) ( not ( = ?auto_737320 ?auto_737322 ) ) ( not ( = ?auto_737321 ?auto_737322 ) ) ( ON ?auto_737320 ?auto_737321 ) ( ON ?auto_737319 ?auto_737320 ) ( ON ?auto_737318 ?auto_737319 ) ( ON ?auto_737317 ?auto_737318 ) ( ON ?auto_737316 ?auto_737317 ) ( ON ?auto_737315 ?auto_737316 ) ( ON ?auto_737314 ?auto_737315 ) ( ON ?auto_737313 ?auto_737314 ) ( ON ?auto_737312 ?auto_737313 ) ( ON ?auto_737311 ?auto_737312 ) ( ON ?auto_737310 ?auto_737311 ) ( ON ?auto_737309 ?auto_737310 ) ( CLEAR ?auto_737307 ) ( ON ?auto_737308 ?auto_737309 ) ( CLEAR ?auto_737308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_737307 ?auto_737308 )
      ( MAKE-15PILE ?auto_737307 ?auto_737308 ?auto_737309 ?auto_737310 ?auto_737311 ?auto_737312 ?auto_737313 ?auto_737314 ?auto_737315 ?auto_737316 ?auto_737317 ?auto_737318 ?auto_737319 ?auto_737320 ?auto_737321 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_737369 - BLOCK
      ?auto_737370 - BLOCK
      ?auto_737371 - BLOCK
      ?auto_737372 - BLOCK
      ?auto_737373 - BLOCK
      ?auto_737374 - BLOCK
      ?auto_737375 - BLOCK
      ?auto_737376 - BLOCK
      ?auto_737377 - BLOCK
      ?auto_737378 - BLOCK
      ?auto_737379 - BLOCK
      ?auto_737380 - BLOCK
      ?auto_737381 - BLOCK
      ?auto_737382 - BLOCK
      ?auto_737383 - BLOCK
    )
    :vars
    (
      ?auto_737384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737383 ?auto_737384 ) ( not ( = ?auto_737369 ?auto_737370 ) ) ( not ( = ?auto_737369 ?auto_737371 ) ) ( not ( = ?auto_737369 ?auto_737372 ) ) ( not ( = ?auto_737369 ?auto_737373 ) ) ( not ( = ?auto_737369 ?auto_737374 ) ) ( not ( = ?auto_737369 ?auto_737375 ) ) ( not ( = ?auto_737369 ?auto_737376 ) ) ( not ( = ?auto_737369 ?auto_737377 ) ) ( not ( = ?auto_737369 ?auto_737378 ) ) ( not ( = ?auto_737369 ?auto_737379 ) ) ( not ( = ?auto_737369 ?auto_737380 ) ) ( not ( = ?auto_737369 ?auto_737381 ) ) ( not ( = ?auto_737369 ?auto_737382 ) ) ( not ( = ?auto_737369 ?auto_737383 ) ) ( not ( = ?auto_737369 ?auto_737384 ) ) ( not ( = ?auto_737370 ?auto_737371 ) ) ( not ( = ?auto_737370 ?auto_737372 ) ) ( not ( = ?auto_737370 ?auto_737373 ) ) ( not ( = ?auto_737370 ?auto_737374 ) ) ( not ( = ?auto_737370 ?auto_737375 ) ) ( not ( = ?auto_737370 ?auto_737376 ) ) ( not ( = ?auto_737370 ?auto_737377 ) ) ( not ( = ?auto_737370 ?auto_737378 ) ) ( not ( = ?auto_737370 ?auto_737379 ) ) ( not ( = ?auto_737370 ?auto_737380 ) ) ( not ( = ?auto_737370 ?auto_737381 ) ) ( not ( = ?auto_737370 ?auto_737382 ) ) ( not ( = ?auto_737370 ?auto_737383 ) ) ( not ( = ?auto_737370 ?auto_737384 ) ) ( not ( = ?auto_737371 ?auto_737372 ) ) ( not ( = ?auto_737371 ?auto_737373 ) ) ( not ( = ?auto_737371 ?auto_737374 ) ) ( not ( = ?auto_737371 ?auto_737375 ) ) ( not ( = ?auto_737371 ?auto_737376 ) ) ( not ( = ?auto_737371 ?auto_737377 ) ) ( not ( = ?auto_737371 ?auto_737378 ) ) ( not ( = ?auto_737371 ?auto_737379 ) ) ( not ( = ?auto_737371 ?auto_737380 ) ) ( not ( = ?auto_737371 ?auto_737381 ) ) ( not ( = ?auto_737371 ?auto_737382 ) ) ( not ( = ?auto_737371 ?auto_737383 ) ) ( not ( = ?auto_737371 ?auto_737384 ) ) ( not ( = ?auto_737372 ?auto_737373 ) ) ( not ( = ?auto_737372 ?auto_737374 ) ) ( not ( = ?auto_737372 ?auto_737375 ) ) ( not ( = ?auto_737372 ?auto_737376 ) ) ( not ( = ?auto_737372 ?auto_737377 ) ) ( not ( = ?auto_737372 ?auto_737378 ) ) ( not ( = ?auto_737372 ?auto_737379 ) ) ( not ( = ?auto_737372 ?auto_737380 ) ) ( not ( = ?auto_737372 ?auto_737381 ) ) ( not ( = ?auto_737372 ?auto_737382 ) ) ( not ( = ?auto_737372 ?auto_737383 ) ) ( not ( = ?auto_737372 ?auto_737384 ) ) ( not ( = ?auto_737373 ?auto_737374 ) ) ( not ( = ?auto_737373 ?auto_737375 ) ) ( not ( = ?auto_737373 ?auto_737376 ) ) ( not ( = ?auto_737373 ?auto_737377 ) ) ( not ( = ?auto_737373 ?auto_737378 ) ) ( not ( = ?auto_737373 ?auto_737379 ) ) ( not ( = ?auto_737373 ?auto_737380 ) ) ( not ( = ?auto_737373 ?auto_737381 ) ) ( not ( = ?auto_737373 ?auto_737382 ) ) ( not ( = ?auto_737373 ?auto_737383 ) ) ( not ( = ?auto_737373 ?auto_737384 ) ) ( not ( = ?auto_737374 ?auto_737375 ) ) ( not ( = ?auto_737374 ?auto_737376 ) ) ( not ( = ?auto_737374 ?auto_737377 ) ) ( not ( = ?auto_737374 ?auto_737378 ) ) ( not ( = ?auto_737374 ?auto_737379 ) ) ( not ( = ?auto_737374 ?auto_737380 ) ) ( not ( = ?auto_737374 ?auto_737381 ) ) ( not ( = ?auto_737374 ?auto_737382 ) ) ( not ( = ?auto_737374 ?auto_737383 ) ) ( not ( = ?auto_737374 ?auto_737384 ) ) ( not ( = ?auto_737375 ?auto_737376 ) ) ( not ( = ?auto_737375 ?auto_737377 ) ) ( not ( = ?auto_737375 ?auto_737378 ) ) ( not ( = ?auto_737375 ?auto_737379 ) ) ( not ( = ?auto_737375 ?auto_737380 ) ) ( not ( = ?auto_737375 ?auto_737381 ) ) ( not ( = ?auto_737375 ?auto_737382 ) ) ( not ( = ?auto_737375 ?auto_737383 ) ) ( not ( = ?auto_737375 ?auto_737384 ) ) ( not ( = ?auto_737376 ?auto_737377 ) ) ( not ( = ?auto_737376 ?auto_737378 ) ) ( not ( = ?auto_737376 ?auto_737379 ) ) ( not ( = ?auto_737376 ?auto_737380 ) ) ( not ( = ?auto_737376 ?auto_737381 ) ) ( not ( = ?auto_737376 ?auto_737382 ) ) ( not ( = ?auto_737376 ?auto_737383 ) ) ( not ( = ?auto_737376 ?auto_737384 ) ) ( not ( = ?auto_737377 ?auto_737378 ) ) ( not ( = ?auto_737377 ?auto_737379 ) ) ( not ( = ?auto_737377 ?auto_737380 ) ) ( not ( = ?auto_737377 ?auto_737381 ) ) ( not ( = ?auto_737377 ?auto_737382 ) ) ( not ( = ?auto_737377 ?auto_737383 ) ) ( not ( = ?auto_737377 ?auto_737384 ) ) ( not ( = ?auto_737378 ?auto_737379 ) ) ( not ( = ?auto_737378 ?auto_737380 ) ) ( not ( = ?auto_737378 ?auto_737381 ) ) ( not ( = ?auto_737378 ?auto_737382 ) ) ( not ( = ?auto_737378 ?auto_737383 ) ) ( not ( = ?auto_737378 ?auto_737384 ) ) ( not ( = ?auto_737379 ?auto_737380 ) ) ( not ( = ?auto_737379 ?auto_737381 ) ) ( not ( = ?auto_737379 ?auto_737382 ) ) ( not ( = ?auto_737379 ?auto_737383 ) ) ( not ( = ?auto_737379 ?auto_737384 ) ) ( not ( = ?auto_737380 ?auto_737381 ) ) ( not ( = ?auto_737380 ?auto_737382 ) ) ( not ( = ?auto_737380 ?auto_737383 ) ) ( not ( = ?auto_737380 ?auto_737384 ) ) ( not ( = ?auto_737381 ?auto_737382 ) ) ( not ( = ?auto_737381 ?auto_737383 ) ) ( not ( = ?auto_737381 ?auto_737384 ) ) ( not ( = ?auto_737382 ?auto_737383 ) ) ( not ( = ?auto_737382 ?auto_737384 ) ) ( not ( = ?auto_737383 ?auto_737384 ) ) ( ON ?auto_737382 ?auto_737383 ) ( ON ?auto_737381 ?auto_737382 ) ( ON ?auto_737380 ?auto_737381 ) ( ON ?auto_737379 ?auto_737380 ) ( ON ?auto_737378 ?auto_737379 ) ( ON ?auto_737377 ?auto_737378 ) ( ON ?auto_737376 ?auto_737377 ) ( ON ?auto_737375 ?auto_737376 ) ( ON ?auto_737374 ?auto_737375 ) ( ON ?auto_737373 ?auto_737374 ) ( ON ?auto_737372 ?auto_737373 ) ( ON ?auto_737371 ?auto_737372 ) ( ON ?auto_737370 ?auto_737371 ) ( ON ?auto_737369 ?auto_737370 ) ( CLEAR ?auto_737369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_737369 )
      ( MAKE-15PILE ?auto_737369 ?auto_737370 ?auto_737371 ?auto_737372 ?auto_737373 ?auto_737374 ?auto_737375 ?auto_737376 ?auto_737377 ?auto_737378 ?auto_737379 ?auto_737380 ?auto_737381 ?auto_737382 ?auto_737383 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737432 - BLOCK
      ?auto_737433 - BLOCK
      ?auto_737434 - BLOCK
      ?auto_737435 - BLOCK
      ?auto_737436 - BLOCK
      ?auto_737437 - BLOCK
      ?auto_737438 - BLOCK
      ?auto_737439 - BLOCK
      ?auto_737440 - BLOCK
      ?auto_737441 - BLOCK
      ?auto_737442 - BLOCK
      ?auto_737443 - BLOCK
      ?auto_737444 - BLOCK
      ?auto_737445 - BLOCK
      ?auto_737446 - BLOCK
      ?auto_737447 - BLOCK
    )
    :vars
    (
      ?auto_737448 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_737446 ) ( ON ?auto_737447 ?auto_737448 ) ( CLEAR ?auto_737447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_737432 ) ( ON ?auto_737433 ?auto_737432 ) ( ON ?auto_737434 ?auto_737433 ) ( ON ?auto_737435 ?auto_737434 ) ( ON ?auto_737436 ?auto_737435 ) ( ON ?auto_737437 ?auto_737436 ) ( ON ?auto_737438 ?auto_737437 ) ( ON ?auto_737439 ?auto_737438 ) ( ON ?auto_737440 ?auto_737439 ) ( ON ?auto_737441 ?auto_737440 ) ( ON ?auto_737442 ?auto_737441 ) ( ON ?auto_737443 ?auto_737442 ) ( ON ?auto_737444 ?auto_737443 ) ( ON ?auto_737445 ?auto_737444 ) ( ON ?auto_737446 ?auto_737445 ) ( not ( = ?auto_737432 ?auto_737433 ) ) ( not ( = ?auto_737432 ?auto_737434 ) ) ( not ( = ?auto_737432 ?auto_737435 ) ) ( not ( = ?auto_737432 ?auto_737436 ) ) ( not ( = ?auto_737432 ?auto_737437 ) ) ( not ( = ?auto_737432 ?auto_737438 ) ) ( not ( = ?auto_737432 ?auto_737439 ) ) ( not ( = ?auto_737432 ?auto_737440 ) ) ( not ( = ?auto_737432 ?auto_737441 ) ) ( not ( = ?auto_737432 ?auto_737442 ) ) ( not ( = ?auto_737432 ?auto_737443 ) ) ( not ( = ?auto_737432 ?auto_737444 ) ) ( not ( = ?auto_737432 ?auto_737445 ) ) ( not ( = ?auto_737432 ?auto_737446 ) ) ( not ( = ?auto_737432 ?auto_737447 ) ) ( not ( = ?auto_737432 ?auto_737448 ) ) ( not ( = ?auto_737433 ?auto_737434 ) ) ( not ( = ?auto_737433 ?auto_737435 ) ) ( not ( = ?auto_737433 ?auto_737436 ) ) ( not ( = ?auto_737433 ?auto_737437 ) ) ( not ( = ?auto_737433 ?auto_737438 ) ) ( not ( = ?auto_737433 ?auto_737439 ) ) ( not ( = ?auto_737433 ?auto_737440 ) ) ( not ( = ?auto_737433 ?auto_737441 ) ) ( not ( = ?auto_737433 ?auto_737442 ) ) ( not ( = ?auto_737433 ?auto_737443 ) ) ( not ( = ?auto_737433 ?auto_737444 ) ) ( not ( = ?auto_737433 ?auto_737445 ) ) ( not ( = ?auto_737433 ?auto_737446 ) ) ( not ( = ?auto_737433 ?auto_737447 ) ) ( not ( = ?auto_737433 ?auto_737448 ) ) ( not ( = ?auto_737434 ?auto_737435 ) ) ( not ( = ?auto_737434 ?auto_737436 ) ) ( not ( = ?auto_737434 ?auto_737437 ) ) ( not ( = ?auto_737434 ?auto_737438 ) ) ( not ( = ?auto_737434 ?auto_737439 ) ) ( not ( = ?auto_737434 ?auto_737440 ) ) ( not ( = ?auto_737434 ?auto_737441 ) ) ( not ( = ?auto_737434 ?auto_737442 ) ) ( not ( = ?auto_737434 ?auto_737443 ) ) ( not ( = ?auto_737434 ?auto_737444 ) ) ( not ( = ?auto_737434 ?auto_737445 ) ) ( not ( = ?auto_737434 ?auto_737446 ) ) ( not ( = ?auto_737434 ?auto_737447 ) ) ( not ( = ?auto_737434 ?auto_737448 ) ) ( not ( = ?auto_737435 ?auto_737436 ) ) ( not ( = ?auto_737435 ?auto_737437 ) ) ( not ( = ?auto_737435 ?auto_737438 ) ) ( not ( = ?auto_737435 ?auto_737439 ) ) ( not ( = ?auto_737435 ?auto_737440 ) ) ( not ( = ?auto_737435 ?auto_737441 ) ) ( not ( = ?auto_737435 ?auto_737442 ) ) ( not ( = ?auto_737435 ?auto_737443 ) ) ( not ( = ?auto_737435 ?auto_737444 ) ) ( not ( = ?auto_737435 ?auto_737445 ) ) ( not ( = ?auto_737435 ?auto_737446 ) ) ( not ( = ?auto_737435 ?auto_737447 ) ) ( not ( = ?auto_737435 ?auto_737448 ) ) ( not ( = ?auto_737436 ?auto_737437 ) ) ( not ( = ?auto_737436 ?auto_737438 ) ) ( not ( = ?auto_737436 ?auto_737439 ) ) ( not ( = ?auto_737436 ?auto_737440 ) ) ( not ( = ?auto_737436 ?auto_737441 ) ) ( not ( = ?auto_737436 ?auto_737442 ) ) ( not ( = ?auto_737436 ?auto_737443 ) ) ( not ( = ?auto_737436 ?auto_737444 ) ) ( not ( = ?auto_737436 ?auto_737445 ) ) ( not ( = ?auto_737436 ?auto_737446 ) ) ( not ( = ?auto_737436 ?auto_737447 ) ) ( not ( = ?auto_737436 ?auto_737448 ) ) ( not ( = ?auto_737437 ?auto_737438 ) ) ( not ( = ?auto_737437 ?auto_737439 ) ) ( not ( = ?auto_737437 ?auto_737440 ) ) ( not ( = ?auto_737437 ?auto_737441 ) ) ( not ( = ?auto_737437 ?auto_737442 ) ) ( not ( = ?auto_737437 ?auto_737443 ) ) ( not ( = ?auto_737437 ?auto_737444 ) ) ( not ( = ?auto_737437 ?auto_737445 ) ) ( not ( = ?auto_737437 ?auto_737446 ) ) ( not ( = ?auto_737437 ?auto_737447 ) ) ( not ( = ?auto_737437 ?auto_737448 ) ) ( not ( = ?auto_737438 ?auto_737439 ) ) ( not ( = ?auto_737438 ?auto_737440 ) ) ( not ( = ?auto_737438 ?auto_737441 ) ) ( not ( = ?auto_737438 ?auto_737442 ) ) ( not ( = ?auto_737438 ?auto_737443 ) ) ( not ( = ?auto_737438 ?auto_737444 ) ) ( not ( = ?auto_737438 ?auto_737445 ) ) ( not ( = ?auto_737438 ?auto_737446 ) ) ( not ( = ?auto_737438 ?auto_737447 ) ) ( not ( = ?auto_737438 ?auto_737448 ) ) ( not ( = ?auto_737439 ?auto_737440 ) ) ( not ( = ?auto_737439 ?auto_737441 ) ) ( not ( = ?auto_737439 ?auto_737442 ) ) ( not ( = ?auto_737439 ?auto_737443 ) ) ( not ( = ?auto_737439 ?auto_737444 ) ) ( not ( = ?auto_737439 ?auto_737445 ) ) ( not ( = ?auto_737439 ?auto_737446 ) ) ( not ( = ?auto_737439 ?auto_737447 ) ) ( not ( = ?auto_737439 ?auto_737448 ) ) ( not ( = ?auto_737440 ?auto_737441 ) ) ( not ( = ?auto_737440 ?auto_737442 ) ) ( not ( = ?auto_737440 ?auto_737443 ) ) ( not ( = ?auto_737440 ?auto_737444 ) ) ( not ( = ?auto_737440 ?auto_737445 ) ) ( not ( = ?auto_737440 ?auto_737446 ) ) ( not ( = ?auto_737440 ?auto_737447 ) ) ( not ( = ?auto_737440 ?auto_737448 ) ) ( not ( = ?auto_737441 ?auto_737442 ) ) ( not ( = ?auto_737441 ?auto_737443 ) ) ( not ( = ?auto_737441 ?auto_737444 ) ) ( not ( = ?auto_737441 ?auto_737445 ) ) ( not ( = ?auto_737441 ?auto_737446 ) ) ( not ( = ?auto_737441 ?auto_737447 ) ) ( not ( = ?auto_737441 ?auto_737448 ) ) ( not ( = ?auto_737442 ?auto_737443 ) ) ( not ( = ?auto_737442 ?auto_737444 ) ) ( not ( = ?auto_737442 ?auto_737445 ) ) ( not ( = ?auto_737442 ?auto_737446 ) ) ( not ( = ?auto_737442 ?auto_737447 ) ) ( not ( = ?auto_737442 ?auto_737448 ) ) ( not ( = ?auto_737443 ?auto_737444 ) ) ( not ( = ?auto_737443 ?auto_737445 ) ) ( not ( = ?auto_737443 ?auto_737446 ) ) ( not ( = ?auto_737443 ?auto_737447 ) ) ( not ( = ?auto_737443 ?auto_737448 ) ) ( not ( = ?auto_737444 ?auto_737445 ) ) ( not ( = ?auto_737444 ?auto_737446 ) ) ( not ( = ?auto_737444 ?auto_737447 ) ) ( not ( = ?auto_737444 ?auto_737448 ) ) ( not ( = ?auto_737445 ?auto_737446 ) ) ( not ( = ?auto_737445 ?auto_737447 ) ) ( not ( = ?auto_737445 ?auto_737448 ) ) ( not ( = ?auto_737446 ?auto_737447 ) ) ( not ( = ?auto_737446 ?auto_737448 ) ) ( not ( = ?auto_737447 ?auto_737448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_737447 ?auto_737448 )
      ( !STACK ?auto_737447 ?auto_737446 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737498 - BLOCK
      ?auto_737499 - BLOCK
      ?auto_737500 - BLOCK
      ?auto_737501 - BLOCK
      ?auto_737502 - BLOCK
      ?auto_737503 - BLOCK
      ?auto_737504 - BLOCK
      ?auto_737505 - BLOCK
      ?auto_737506 - BLOCK
      ?auto_737507 - BLOCK
      ?auto_737508 - BLOCK
      ?auto_737509 - BLOCK
      ?auto_737510 - BLOCK
      ?auto_737511 - BLOCK
      ?auto_737512 - BLOCK
      ?auto_737513 - BLOCK
    )
    :vars
    (
      ?auto_737514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737513 ?auto_737514 ) ( ON-TABLE ?auto_737498 ) ( ON ?auto_737499 ?auto_737498 ) ( ON ?auto_737500 ?auto_737499 ) ( ON ?auto_737501 ?auto_737500 ) ( ON ?auto_737502 ?auto_737501 ) ( ON ?auto_737503 ?auto_737502 ) ( ON ?auto_737504 ?auto_737503 ) ( ON ?auto_737505 ?auto_737504 ) ( ON ?auto_737506 ?auto_737505 ) ( ON ?auto_737507 ?auto_737506 ) ( ON ?auto_737508 ?auto_737507 ) ( ON ?auto_737509 ?auto_737508 ) ( ON ?auto_737510 ?auto_737509 ) ( ON ?auto_737511 ?auto_737510 ) ( not ( = ?auto_737498 ?auto_737499 ) ) ( not ( = ?auto_737498 ?auto_737500 ) ) ( not ( = ?auto_737498 ?auto_737501 ) ) ( not ( = ?auto_737498 ?auto_737502 ) ) ( not ( = ?auto_737498 ?auto_737503 ) ) ( not ( = ?auto_737498 ?auto_737504 ) ) ( not ( = ?auto_737498 ?auto_737505 ) ) ( not ( = ?auto_737498 ?auto_737506 ) ) ( not ( = ?auto_737498 ?auto_737507 ) ) ( not ( = ?auto_737498 ?auto_737508 ) ) ( not ( = ?auto_737498 ?auto_737509 ) ) ( not ( = ?auto_737498 ?auto_737510 ) ) ( not ( = ?auto_737498 ?auto_737511 ) ) ( not ( = ?auto_737498 ?auto_737512 ) ) ( not ( = ?auto_737498 ?auto_737513 ) ) ( not ( = ?auto_737498 ?auto_737514 ) ) ( not ( = ?auto_737499 ?auto_737500 ) ) ( not ( = ?auto_737499 ?auto_737501 ) ) ( not ( = ?auto_737499 ?auto_737502 ) ) ( not ( = ?auto_737499 ?auto_737503 ) ) ( not ( = ?auto_737499 ?auto_737504 ) ) ( not ( = ?auto_737499 ?auto_737505 ) ) ( not ( = ?auto_737499 ?auto_737506 ) ) ( not ( = ?auto_737499 ?auto_737507 ) ) ( not ( = ?auto_737499 ?auto_737508 ) ) ( not ( = ?auto_737499 ?auto_737509 ) ) ( not ( = ?auto_737499 ?auto_737510 ) ) ( not ( = ?auto_737499 ?auto_737511 ) ) ( not ( = ?auto_737499 ?auto_737512 ) ) ( not ( = ?auto_737499 ?auto_737513 ) ) ( not ( = ?auto_737499 ?auto_737514 ) ) ( not ( = ?auto_737500 ?auto_737501 ) ) ( not ( = ?auto_737500 ?auto_737502 ) ) ( not ( = ?auto_737500 ?auto_737503 ) ) ( not ( = ?auto_737500 ?auto_737504 ) ) ( not ( = ?auto_737500 ?auto_737505 ) ) ( not ( = ?auto_737500 ?auto_737506 ) ) ( not ( = ?auto_737500 ?auto_737507 ) ) ( not ( = ?auto_737500 ?auto_737508 ) ) ( not ( = ?auto_737500 ?auto_737509 ) ) ( not ( = ?auto_737500 ?auto_737510 ) ) ( not ( = ?auto_737500 ?auto_737511 ) ) ( not ( = ?auto_737500 ?auto_737512 ) ) ( not ( = ?auto_737500 ?auto_737513 ) ) ( not ( = ?auto_737500 ?auto_737514 ) ) ( not ( = ?auto_737501 ?auto_737502 ) ) ( not ( = ?auto_737501 ?auto_737503 ) ) ( not ( = ?auto_737501 ?auto_737504 ) ) ( not ( = ?auto_737501 ?auto_737505 ) ) ( not ( = ?auto_737501 ?auto_737506 ) ) ( not ( = ?auto_737501 ?auto_737507 ) ) ( not ( = ?auto_737501 ?auto_737508 ) ) ( not ( = ?auto_737501 ?auto_737509 ) ) ( not ( = ?auto_737501 ?auto_737510 ) ) ( not ( = ?auto_737501 ?auto_737511 ) ) ( not ( = ?auto_737501 ?auto_737512 ) ) ( not ( = ?auto_737501 ?auto_737513 ) ) ( not ( = ?auto_737501 ?auto_737514 ) ) ( not ( = ?auto_737502 ?auto_737503 ) ) ( not ( = ?auto_737502 ?auto_737504 ) ) ( not ( = ?auto_737502 ?auto_737505 ) ) ( not ( = ?auto_737502 ?auto_737506 ) ) ( not ( = ?auto_737502 ?auto_737507 ) ) ( not ( = ?auto_737502 ?auto_737508 ) ) ( not ( = ?auto_737502 ?auto_737509 ) ) ( not ( = ?auto_737502 ?auto_737510 ) ) ( not ( = ?auto_737502 ?auto_737511 ) ) ( not ( = ?auto_737502 ?auto_737512 ) ) ( not ( = ?auto_737502 ?auto_737513 ) ) ( not ( = ?auto_737502 ?auto_737514 ) ) ( not ( = ?auto_737503 ?auto_737504 ) ) ( not ( = ?auto_737503 ?auto_737505 ) ) ( not ( = ?auto_737503 ?auto_737506 ) ) ( not ( = ?auto_737503 ?auto_737507 ) ) ( not ( = ?auto_737503 ?auto_737508 ) ) ( not ( = ?auto_737503 ?auto_737509 ) ) ( not ( = ?auto_737503 ?auto_737510 ) ) ( not ( = ?auto_737503 ?auto_737511 ) ) ( not ( = ?auto_737503 ?auto_737512 ) ) ( not ( = ?auto_737503 ?auto_737513 ) ) ( not ( = ?auto_737503 ?auto_737514 ) ) ( not ( = ?auto_737504 ?auto_737505 ) ) ( not ( = ?auto_737504 ?auto_737506 ) ) ( not ( = ?auto_737504 ?auto_737507 ) ) ( not ( = ?auto_737504 ?auto_737508 ) ) ( not ( = ?auto_737504 ?auto_737509 ) ) ( not ( = ?auto_737504 ?auto_737510 ) ) ( not ( = ?auto_737504 ?auto_737511 ) ) ( not ( = ?auto_737504 ?auto_737512 ) ) ( not ( = ?auto_737504 ?auto_737513 ) ) ( not ( = ?auto_737504 ?auto_737514 ) ) ( not ( = ?auto_737505 ?auto_737506 ) ) ( not ( = ?auto_737505 ?auto_737507 ) ) ( not ( = ?auto_737505 ?auto_737508 ) ) ( not ( = ?auto_737505 ?auto_737509 ) ) ( not ( = ?auto_737505 ?auto_737510 ) ) ( not ( = ?auto_737505 ?auto_737511 ) ) ( not ( = ?auto_737505 ?auto_737512 ) ) ( not ( = ?auto_737505 ?auto_737513 ) ) ( not ( = ?auto_737505 ?auto_737514 ) ) ( not ( = ?auto_737506 ?auto_737507 ) ) ( not ( = ?auto_737506 ?auto_737508 ) ) ( not ( = ?auto_737506 ?auto_737509 ) ) ( not ( = ?auto_737506 ?auto_737510 ) ) ( not ( = ?auto_737506 ?auto_737511 ) ) ( not ( = ?auto_737506 ?auto_737512 ) ) ( not ( = ?auto_737506 ?auto_737513 ) ) ( not ( = ?auto_737506 ?auto_737514 ) ) ( not ( = ?auto_737507 ?auto_737508 ) ) ( not ( = ?auto_737507 ?auto_737509 ) ) ( not ( = ?auto_737507 ?auto_737510 ) ) ( not ( = ?auto_737507 ?auto_737511 ) ) ( not ( = ?auto_737507 ?auto_737512 ) ) ( not ( = ?auto_737507 ?auto_737513 ) ) ( not ( = ?auto_737507 ?auto_737514 ) ) ( not ( = ?auto_737508 ?auto_737509 ) ) ( not ( = ?auto_737508 ?auto_737510 ) ) ( not ( = ?auto_737508 ?auto_737511 ) ) ( not ( = ?auto_737508 ?auto_737512 ) ) ( not ( = ?auto_737508 ?auto_737513 ) ) ( not ( = ?auto_737508 ?auto_737514 ) ) ( not ( = ?auto_737509 ?auto_737510 ) ) ( not ( = ?auto_737509 ?auto_737511 ) ) ( not ( = ?auto_737509 ?auto_737512 ) ) ( not ( = ?auto_737509 ?auto_737513 ) ) ( not ( = ?auto_737509 ?auto_737514 ) ) ( not ( = ?auto_737510 ?auto_737511 ) ) ( not ( = ?auto_737510 ?auto_737512 ) ) ( not ( = ?auto_737510 ?auto_737513 ) ) ( not ( = ?auto_737510 ?auto_737514 ) ) ( not ( = ?auto_737511 ?auto_737512 ) ) ( not ( = ?auto_737511 ?auto_737513 ) ) ( not ( = ?auto_737511 ?auto_737514 ) ) ( not ( = ?auto_737512 ?auto_737513 ) ) ( not ( = ?auto_737512 ?auto_737514 ) ) ( not ( = ?auto_737513 ?auto_737514 ) ) ( CLEAR ?auto_737511 ) ( ON ?auto_737512 ?auto_737513 ) ( CLEAR ?auto_737512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_737498 ?auto_737499 ?auto_737500 ?auto_737501 ?auto_737502 ?auto_737503 ?auto_737504 ?auto_737505 ?auto_737506 ?auto_737507 ?auto_737508 ?auto_737509 ?auto_737510 ?auto_737511 ?auto_737512 )
      ( MAKE-16PILE ?auto_737498 ?auto_737499 ?auto_737500 ?auto_737501 ?auto_737502 ?auto_737503 ?auto_737504 ?auto_737505 ?auto_737506 ?auto_737507 ?auto_737508 ?auto_737509 ?auto_737510 ?auto_737511 ?auto_737512 ?auto_737513 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737564 - BLOCK
      ?auto_737565 - BLOCK
      ?auto_737566 - BLOCK
      ?auto_737567 - BLOCK
      ?auto_737568 - BLOCK
      ?auto_737569 - BLOCK
      ?auto_737570 - BLOCK
      ?auto_737571 - BLOCK
      ?auto_737572 - BLOCK
      ?auto_737573 - BLOCK
      ?auto_737574 - BLOCK
      ?auto_737575 - BLOCK
      ?auto_737576 - BLOCK
      ?auto_737577 - BLOCK
      ?auto_737578 - BLOCK
      ?auto_737579 - BLOCK
    )
    :vars
    (
      ?auto_737580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737579 ?auto_737580 ) ( ON-TABLE ?auto_737564 ) ( ON ?auto_737565 ?auto_737564 ) ( ON ?auto_737566 ?auto_737565 ) ( ON ?auto_737567 ?auto_737566 ) ( ON ?auto_737568 ?auto_737567 ) ( ON ?auto_737569 ?auto_737568 ) ( ON ?auto_737570 ?auto_737569 ) ( ON ?auto_737571 ?auto_737570 ) ( ON ?auto_737572 ?auto_737571 ) ( ON ?auto_737573 ?auto_737572 ) ( ON ?auto_737574 ?auto_737573 ) ( ON ?auto_737575 ?auto_737574 ) ( ON ?auto_737576 ?auto_737575 ) ( not ( = ?auto_737564 ?auto_737565 ) ) ( not ( = ?auto_737564 ?auto_737566 ) ) ( not ( = ?auto_737564 ?auto_737567 ) ) ( not ( = ?auto_737564 ?auto_737568 ) ) ( not ( = ?auto_737564 ?auto_737569 ) ) ( not ( = ?auto_737564 ?auto_737570 ) ) ( not ( = ?auto_737564 ?auto_737571 ) ) ( not ( = ?auto_737564 ?auto_737572 ) ) ( not ( = ?auto_737564 ?auto_737573 ) ) ( not ( = ?auto_737564 ?auto_737574 ) ) ( not ( = ?auto_737564 ?auto_737575 ) ) ( not ( = ?auto_737564 ?auto_737576 ) ) ( not ( = ?auto_737564 ?auto_737577 ) ) ( not ( = ?auto_737564 ?auto_737578 ) ) ( not ( = ?auto_737564 ?auto_737579 ) ) ( not ( = ?auto_737564 ?auto_737580 ) ) ( not ( = ?auto_737565 ?auto_737566 ) ) ( not ( = ?auto_737565 ?auto_737567 ) ) ( not ( = ?auto_737565 ?auto_737568 ) ) ( not ( = ?auto_737565 ?auto_737569 ) ) ( not ( = ?auto_737565 ?auto_737570 ) ) ( not ( = ?auto_737565 ?auto_737571 ) ) ( not ( = ?auto_737565 ?auto_737572 ) ) ( not ( = ?auto_737565 ?auto_737573 ) ) ( not ( = ?auto_737565 ?auto_737574 ) ) ( not ( = ?auto_737565 ?auto_737575 ) ) ( not ( = ?auto_737565 ?auto_737576 ) ) ( not ( = ?auto_737565 ?auto_737577 ) ) ( not ( = ?auto_737565 ?auto_737578 ) ) ( not ( = ?auto_737565 ?auto_737579 ) ) ( not ( = ?auto_737565 ?auto_737580 ) ) ( not ( = ?auto_737566 ?auto_737567 ) ) ( not ( = ?auto_737566 ?auto_737568 ) ) ( not ( = ?auto_737566 ?auto_737569 ) ) ( not ( = ?auto_737566 ?auto_737570 ) ) ( not ( = ?auto_737566 ?auto_737571 ) ) ( not ( = ?auto_737566 ?auto_737572 ) ) ( not ( = ?auto_737566 ?auto_737573 ) ) ( not ( = ?auto_737566 ?auto_737574 ) ) ( not ( = ?auto_737566 ?auto_737575 ) ) ( not ( = ?auto_737566 ?auto_737576 ) ) ( not ( = ?auto_737566 ?auto_737577 ) ) ( not ( = ?auto_737566 ?auto_737578 ) ) ( not ( = ?auto_737566 ?auto_737579 ) ) ( not ( = ?auto_737566 ?auto_737580 ) ) ( not ( = ?auto_737567 ?auto_737568 ) ) ( not ( = ?auto_737567 ?auto_737569 ) ) ( not ( = ?auto_737567 ?auto_737570 ) ) ( not ( = ?auto_737567 ?auto_737571 ) ) ( not ( = ?auto_737567 ?auto_737572 ) ) ( not ( = ?auto_737567 ?auto_737573 ) ) ( not ( = ?auto_737567 ?auto_737574 ) ) ( not ( = ?auto_737567 ?auto_737575 ) ) ( not ( = ?auto_737567 ?auto_737576 ) ) ( not ( = ?auto_737567 ?auto_737577 ) ) ( not ( = ?auto_737567 ?auto_737578 ) ) ( not ( = ?auto_737567 ?auto_737579 ) ) ( not ( = ?auto_737567 ?auto_737580 ) ) ( not ( = ?auto_737568 ?auto_737569 ) ) ( not ( = ?auto_737568 ?auto_737570 ) ) ( not ( = ?auto_737568 ?auto_737571 ) ) ( not ( = ?auto_737568 ?auto_737572 ) ) ( not ( = ?auto_737568 ?auto_737573 ) ) ( not ( = ?auto_737568 ?auto_737574 ) ) ( not ( = ?auto_737568 ?auto_737575 ) ) ( not ( = ?auto_737568 ?auto_737576 ) ) ( not ( = ?auto_737568 ?auto_737577 ) ) ( not ( = ?auto_737568 ?auto_737578 ) ) ( not ( = ?auto_737568 ?auto_737579 ) ) ( not ( = ?auto_737568 ?auto_737580 ) ) ( not ( = ?auto_737569 ?auto_737570 ) ) ( not ( = ?auto_737569 ?auto_737571 ) ) ( not ( = ?auto_737569 ?auto_737572 ) ) ( not ( = ?auto_737569 ?auto_737573 ) ) ( not ( = ?auto_737569 ?auto_737574 ) ) ( not ( = ?auto_737569 ?auto_737575 ) ) ( not ( = ?auto_737569 ?auto_737576 ) ) ( not ( = ?auto_737569 ?auto_737577 ) ) ( not ( = ?auto_737569 ?auto_737578 ) ) ( not ( = ?auto_737569 ?auto_737579 ) ) ( not ( = ?auto_737569 ?auto_737580 ) ) ( not ( = ?auto_737570 ?auto_737571 ) ) ( not ( = ?auto_737570 ?auto_737572 ) ) ( not ( = ?auto_737570 ?auto_737573 ) ) ( not ( = ?auto_737570 ?auto_737574 ) ) ( not ( = ?auto_737570 ?auto_737575 ) ) ( not ( = ?auto_737570 ?auto_737576 ) ) ( not ( = ?auto_737570 ?auto_737577 ) ) ( not ( = ?auto_737570 ?auto_737578 ) ) ( not ( = ?auto_737570 ?auto_737579 ) ) ( not ( = ?auto_737570 ?auto_737580 ) ) ( not ( = ?auto_737571 ?auto_737572 ) ) ( not ( = ?auto_737571 ?auto_737573 ) ) ( not ( = ?auto_737571 ?auto_737574 ) ) ( not ( = ?auto_737571 ?auto_737575 ) ) ( not ( = ?auto_737571 ?auto_737576 ) ) ( not ( = ?auto_737571 ?auto_737577 ) ) ( not ( = ?auto_737571 ?auto_737578 ) ) ( not ( = ?auto_737571 ?auto_737579 ) ) ( not ( = ?auto_737571 ?auto_737580 ) ) ( not ( = ?auto_737572 ?auto_737573 ) ) ( not ( = ?auto_737572 ?auto_737574 ) ) ( not ( = ?auto_737572 ?auto_737575 ) ) ( not ( = ?auto_737572 ?auto_737576 ) ) ( not ( = ?auto_737572 ?auto_737577 ) ) ( not ( = ?auto_737572 ?auto_737578 ) ) ( not ( = ?auto_737572 ?auto_737579 ) ) ( not ( = ?auto_737572 ?auto_737580 ) ) ( not ( = ?auto_737573 ?auto_737574 ) ) ( not ( = ?auto_737573 ?auto_737575 ) ) ( not ( = ?auto_737573 ?auto_737576 ) ) ( not ( = ?auto_737573 ?auto_737577 ) ) ( not ( = ?auto_737573 ?auto_737578 ) ) ( not ( = ?auto_737573 ?auto_737579 ) ) ( not ( = ?auto_737573 ?auto_737580 ) ) ( not ( = ?auto_737574 ?auto_737575 ) ) ( not ( = ?auto_737574 ?auto_737576 ) ) ( not ( = ?auto_737574 ?auto_737577 ) ) ( not ( = ?auto_737574 ?auto_737578 ) ) ( not ( = ?auto_737574 ?auto_737579 ) ) ( not ( = ?auto_737574 ?auto_737580 ) ) ( not ( = ?auto_737575 ?auto_737576 ) ) ( not ( = ?auto_737575 ?auto_737577 ) ) ( not ( = ?auto_737575 ?auto_737578 ) ) ( not ( = ?auto_737575 ?auto_737579 ) ) ( not ( = ?auto_737575 ?auto_737580 ) ) ( not ( = ?auto_737576 ?auto_737577 ) ) ( not ( = ?auto_737576 ?auto_737578 ) ) ( not ( = ?auto_737576 ?auto_737579 ) ) ( not ( = ?auto_737576 ?auto_737580 ) ) ( not ( = ?auto_737577 ?auto_737578 ) ) ( not ( = ?auto_737577 ?auto_737579 ) ) ( not ( = ?auto_737577 ?auto_737580 ) ) ( not ( = ?auto_737578 ?auto_737579 ) ) ( not ( = ?auto_737578 ?auto_737580 ) ) ( not ( = ?auto_737579 ?auto_737580 ) ) ( ON ?auto_737578 ?auto_737579 ) ( CLEAR ?auto_737576 ) ( ON ?auto_737577 ?auto_737578 ) ( CLEAR ?auto_737577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_737564 ?auto_737565 ?auto_737566 ?auto_737567 ?auto_737568 ?auto_737569 ?auto_737570 ?auto_737571 ?auto_737572 ?auto_737573 ?auto_737574 ?auto_737575 ?auto_737576 ?auto_737577 )
      ( MAKE-16PILE ?auto_737564 ?auto_737565 ?auto_737566 ?auto_737567 ?auto_737568 ?auto_737569 ?auto_737570 ?auto_737571 ?auto_737572 ?auto_737573 ?auto_737574 ?auto_737575 ?auto_737576 ?auto_737577 ?auto_737578 ?auto_737579 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737630 - BLOCK
      ?auto_737631 - BLOCK
      ?auto_737632 - BLOCK
      ?auto_737633 - BLOCK
      ?auto_737634 - BLOCK
      ?auto_737635 - BLOCK
      ?auto_737636 - BLOCK
      ?auto_737637 - BLOCK
      ?auto_737638 - BLOCK
      ?auto_737639 - BLOCK
      ?auto_737640 - BLOCK
      ?auto_737641 - BLOCK
      ?auto_737642 - BLOCK
      ?auto_737643 - BLOCK
      ?auto_737644 - BLOCK
      ?auto_737645 - BLOCK
    )
    :vars
    (
      ?auto_737646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737645 ?auto_737646 ) ( ON-TABLE ?auto_737630 ) ( ON ?auto_737631 ?auto_737630 ) ( ON ?auto_737632 ?auto_737631 ) ( ON ?auto_737633 ?auto_737632 ) ( ON ?auto_737634 ?auto_737633 ) ( ON ?auto_737635 ?auto_737634 ) ( ON ?auto_737636 ?auto_737635 ) ( ON ?auto_737637 ?auto_737636 ) ( ON ?auto_737638 ?auto_737637 ) ( ON ?auto_737639 ?auto_737638 ) ( ON ?auto_737640 ?auto_737639 ) ( ON ?auto_737641 ?auto_737640 ) ( not ( = ?auto_737630 ?auto_737631 ) ) ( not ( = ?auto_737630 ?auto_737632 ) ) ( not ( = ?auto_737630 ?auto_737633 ) ) ( not ( = ?auto_737630 ?auto_737634 ) ) ( not ( = ?auto_737630 ?auto_737635 ) ) ( not ( = ?auto_737630 ?auto_737636 ) ) ( not ( = ?auto_737630 ?auto_737637 ) ) ( not ( = ?auto_737630 ?auto_737638 ) ) ( not ( = ?auto_737630 ?auto_737639 ) ) ( not ( = ?auto_737630 ?auto_737640 ) ) ( not ( = ?auto_737630 ?auto_737641 ) ) ( not ( = ?auto_737630 ?auto_737642 ) ) ( not ( = ?auto_737630 ?auto_737643 ) ) ( not ( = ?auto_737630 ?auto_737644 ) ) ( not ( = ?auto_737630 ?auto_737645 ) ) ( not ( = ?auto_737630 ?auto_737646 ) ) ( not ( = ?auto_737631 ?auto_737632 ) ) ( not ( = ?auto_737631 ?auto_737633 ) ) ( not ( = ?auto_737631 ?auto_737634 ) ) ( not ( = ?auto_737631 ?auto_737635 ) ) ( not ( = ?auto_737631 ?auto_737636 ) ) ( not ( = ?auto_737631 ?auto_737637 ) ) ( not ( = ?auto_737631 ?auto_737638 ) ) ( not ( = ?auto_737631 ?auto_737639 ) ) ( not ( = ?auto_737631 ?auto_737640 ) ) ( not ( = ?auto_737631 ?auto_737641 ) ) ( not ( = ?auto_737631 ?auto_737642 ) ) ( not ( = ?auto_737631 ?auto_737643 ) ) ( not ( = ?auto_737631 ?auto_737644 ) ) ( not ( = ?auto_737631 ?auto_737645 ) ) ( not ( = ?auto_737631 ?auto_737646 ) ) ( not ( = ?auto_737632 ?auto_737633 ) ) ( not ( = ?auto_737632 ?auto_737634 ) ) ( not ( = ?auto_737632 ?auto_737635 ) ) ( not ( = ?auto_737632 ?auto_737636 ) ) ( not ( = ?auto_737632 ?auto_737637 ) ) ( not ( = ?auto_737632 ?auto_737638 ) ) ( not ( = ?auto_737632 ?auto_737639 ) ) ( not ( = ?auto_737632 ?auto_737640 ) ) ( not ( = ?auto_737632 ?auto_737641 ) ) ( not ( = ?auto_737632 ?auto_737642 ) ) ( not ( = ?auto_737632 ?auto_737643 ) ) ( not ( = ?auto_737632 ?auto_737644 ) ) ( not ( = ?auto_737632 ?auto_737645 ) ) ( not ( = ?auto_737632 ?auto_737646 ) ) ( not ( = ?auto_737633 ?auto_737634 ) ) ( not ( = ?auto_737633 ?auto_737635 ) ) ( not ( = ?auto_737633 ?auto_737636 ) ) ( not ( = ?auto_737633 ?auto_737637 ) ) ( not ( = ?auto_737633 ?auto_737638 ) ) ( not ( = ?auto_737633 ?auto_737639 ) ) ( not ( = ?auto_737633 ?auto_737640 ) ) ( not ( = ?auto_737633 ?auto_737641 ) ) ( not ( = ?auto_737633 ?auto_737642 ) ) ( not ( = ?auto_737633 ?auto_737643 ) ) ( not ( = ?auto_737633 ?auto_737644 ) ) ( not ( = ?auto_737633 ?auto_737645 ) ) ( not ( = ?auto_737633 ?auto_737646 ) ) ( not ( = ?auto_737634 ?auto_737635 ) ) ( not ( = ?auto_737634 ?auto_737636 ) ) ( not ( = ?auto_737634 ?auto_737637 ) ) ( not ( = ?auto_737634 ?auto_737638 ) ) ( not ( = ?auto_737634 ?auto_737639 ) ) ( not ( = ?auto_737634 ?auto_737640 ) ) ( not ( = ?auto_737634 ?auto_737641 ) ) ( not ( = ?auto_737634 ?auto_737642 ) ) ( not ( = ?auto_737634 ?auto_737643 ) ) ( not ( = ?auto_737634 ?auto_737644 ) ) ( not ( = ?auto_737634 ?auto_737645 ) ) ( not ( = ?auto_737634 ?auto_737646 ) ) ( not ( = ?auto_737635 ?auto_737636 ) ) ( not ( = ?auto_737635 ?auto_737637 ) ) ( not ( = ?auto_737635 ?auto_737638 ) ) ( not ( = ?auto_737635 ?auto_737639 ) ) ( not ( = ?auto_737635 ?auto_737640 ) ) ( not ( = ?auto_737635 ?auto_737641 ) ) ( not ( = ?auto_737635 ?auto_737642 ) ) ( not ( = ?auto_737635 ?auto_737643 ) ) ( not ( = ?auto_737635 ?auto_737644 ) ) ( not ( = ?auto_737635 ?auto_737645 ) ) ( not ( = ?auto_737635 ?auto_737646 ) ) ( not ( = ?auto_737636 ?auto_737637 ) ) ( not ( = ?auto_737636 ?auto_737638 ) ) ( not ( = ?auto_737636 ?auto_737639 ) ) ( not ( = ?auto_737636 ?auto_737640 ) ) ( not ( = ?auto_737636 ?auto_737641 ) ) ( not ( = ?auto_737636 ?auto_737642 ) ) ( not ( = ?auto_737636 ?auto_737643 ) ) ( not ( = ?auto_737636 ?auto_737644 ) ) ( not ( = ?auto_737636 ?auto_737645 ) ) ( not ( = ?auto_737636 ?auto_737646 ) ) ( not ( = ?auto_737637 ?auto_737638 ) ) ( not ( = ?auto_737637 ?auto_737639 ) ) ( not ( = ?auto_737637 ?auto_737640 ) ) ( not ( = ?auto_737637 ?auto_737641 ) ) ( not ( = ?auto_737637 ?auto_737642 ) ) ( not ( = ?auto_737637 ?auto_737643 ) ) ( not ( = ?auto_737637 ?auto_737644 ) ) ( not ( = ?auto_737637 ?auto_737645 ) ) ( not ( = ?auto_737637 ?auto_737646 ) ) ( not ( = ?auto_737638 ?auto_737639 ) ) ( not ( = ?auto_737638 ?auto_737640 ) ) ( not ( = ?auto_737638 ?auto_737641 ) ) ( not ( = ?auto_737638 ?auto_737642 ) ) ( not ( = ?auto_737638 ?auto_737643 ) ) ( not ( = ?auto_737638 ?auto_737644 ) ) ( not ( = ?auto_737638 ?auto_737645 ) ) ( not ( = ?auto_737638 ?auto_737646 ) ) ( not ( = ?auto_737639 ?auto_737640 ) ) ( not ( = ?auto_737639 ?auto_737641 ) ) ( not ( = ?auto_737639 ?auto_737642 ) ) ( not ( = ?auto_737639 ?auto_737643 ) ) ( not ( = ?auto_737639 ?auto_737644 ) ) ( not ( = ?auto_737639 ?auto_737645 ) ) ( not ( = ?auto_737639 ?auto_737646 ) ) ( not ( = ?auto_737640 ?auto_737641 ) ) ( not ( = ?auto_737640 ?auto_737642 ) ) ( not ( = ?auto_737640 ?auto_737643 ) ) ( not ( = ?auto_737640 ?auto_737644 ) ) ( not ( = ?auto_737640 ?auto_737645 ) ) ( not ( = ?auto_737640 ?auto_737646 ) ) ( not ( = ?auto_737641 ?auto_737642 ) ) ( not ( = ?auto_737641 ?auto_737643 ) ) ( not ( = ?auto_737641 ?auto_737644 ) ) ( not ( = ?auto_737641 ?auto_737645 ) ) ( not ( = ?auto_737641 ?auto_737646 ) ) ( not ( = ?auto_737642 ?auto_737643 ) ) ( not ( = ?auto_737642 ?auto_737644 ) ) ( not ( = ?auto_737642 ?auto_737645 ) ) ( not ( = ?auto_737642 ?auto_737646 ) ) ( not ( = ?auto_737643 ?auto_737644 ) ) ( not ( = ?auto_737643 ?auto_737645 ) ) ( not ( = ?auto_737643 ?auto_737646 ) ) ( not ( = ?auto_737644 ?auto_737645 ) ) ( not ( = ?auto_737644 ?auto_737646 ) ) ( not ( = ?auto_737645 ?auto_737646 ) ) ( ON ?auto_737644 ?auto_737645 ) ( ON ?auto_737643 ?auto_737644 ) ( CLEAR ?auto_737641 ) ( ON ?auto_737642 ?auto_737643 ) ( CLEAR ?auto_737642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_737630 ?auto_737631 ?auto_737632 ?auto_737633 ?auto_737634 ?auto_737635 ?auto_737636 ?auto_737637 ?auto_737638 ?auto_737639 ?auto_737640 ?auto_737641 ?auto_737642 )
      ( MAKE-16PILE ?auto_737630 ?auto_737631 ?auto_737632 ?auto_737633 ?auto_737634 ?auto_737635 ?auto_737636 ?auto_737637 ?auto_737638 ?auto_737639 ?auto_737640 ?auto_737641 ?auto_737642 ?auto_737643 ?auto_737644 ?auto_737645 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737696 - BLOCK
      ?auto_737697 - BLOCK
      ?auto_737698 - BLOCK
      ?auto_737699 - BLOCK
      ?auto_737700 - BLOCK
      ?auto_737701 - BLOCK
      ?auto_737702 - BLOCK
      ?auto_737703 - BLOCK
      ?auto_737704 - BLOCK
      ?auto_737705 - BLOCK
      ?auto_737706 - BLOCK
      ?auto_737707 - BLOCK
      ?auto_737708 - BLOCK
      ?auto_737709 - BLOCK
      ?auto_737710 - BLOCK
      ?auto_737711 - BLOCK
    )
    :vars
    (
      ?auto_737712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737711 ?auto_737712 ) ( ON-TABLE ?auto_737696 ) ( ON ?auto_737697 ?auto_737696 ) ( ON ?auto_737698 ?auto_737697 ) ( ON ?auto_737699 ?auto_737698 ) ( ON ?auto_737700 ?auto_737699 ) ( ON ?auto_737701 ?auto_737700 ) ( ON ?auto_737702 ?auto_737701 ) ( ON ?auto_737703 ?auto_737702 ) ( ON ?auto_737704 ?auto_737703 ) ( ON ?auto_737705 ?auto_737704 ) ( ON ?auto_737706 ?auto_737705 ) ( not ( = ?auto_737696 ?auto_737697 ) ) ( not ( = ?auto_737696 ?auto_737698 ) ) ( not ( = ?auto_737696 ?auto_737699 ) ) ( not ( = ?auto_737696 ?auto_737700 ) ) ( not ( = ?auto_737696 ?auto_737701 ) ) ( not ( = ?auto_737696 ?auto_737702 ) ) ( not ( = ?auto_737696 ?auto_737703 ) ) ( not ( = ?auto_737696 ?auto_737704 ) ) ( not ( = ?auto_737696 ?auto_737705 ) ) ( not ( = ?auto_737696 ?auto_737706 ) ) ( not ( = ?auto_737696 ?auto_737707 ) ) ( not ( = ?auto_737696 ?auto_737708 ) ) ( not ( = ?auto_737696 ?auto_737709 ) ) ( not ( = ?auto_737696 ?auto_737710 ) ) ( not ( = ?auto_737696 ?auto_737711 ) ) ( not ( = ?auto_737696 ?auto_737712 ) ) ( not ( = ?auto_737697 ?auto_737698 ) ) ( not ( = ?auto_737697 ?auto_737699 ) ) ( not ( = ?auto_737697 ?auto_737700 ) ) ( not ( = ?auto_737697 ?auto_737701 ) ) ( not ( = ?auto_737697 ?auto_737702 ) ) ( not ( = ?auto_737697 ?auto_737703 ) ) ( not ( = ?auto_737697 ?auto_737704 ) ) ( not ( = ?auto_737697 ?auto_737705 ) ) ( not ( = ?auto_737697 ?auto_737706 ) ) ( not ( = ?auto_737697 ?auto_737707 ) ) ( not ( = ?auto_737697 ?auto_737708 ) ) ( not ( = ?auto_737697 ?auto_737709 ) ) ( not ( = ?auto_737697 ?auto_737710 ) ) ( not ( = ?auto_737697 ?auto_737711 ) ) ( not ( = ?auto_737697 ?auto_737712 ) ) ( not ( = ?auto_737698 ?auto_737699 ) ) ( not ( = ?auto_737698 ?auto_737700 ) ) ( not ( = ?auto_737698 ?auto_737701 ) ) ( not ( = ?auto_737698 ?auto_737702 ) ) ( not ( = ?auto_737698 ?auto_737703 ) ) ( not ( = ?auto_737698 ?auto_737704 ) ) ( not ( = ?auto_737698 ?auto_737705 ) ) ( not ( = ?auto_737698 ?auto_737706 ) ) ( not ( = ?auto_737698 ?auto_737707 ) ) ( not ( = ?auto_737698 ?auto_737708 ) ) ( not ( = ?auto_737698 ?auto_737709 ) ) ( not ( = ?auto_737698 ?auto_737710 ) ) ( not ( = ?auto_737698 ?auto_737711 ) ) ( not ( = ?auto_737698 ?auto_737712 ) ) ( not ( = ?auto_737699 ?auto_737700 ) ) ( not ( = ?auto_737699 ?auto_737701 ) ) ( not ( = ?auto_737699 ?auto_737702 ) ) ( not ( = ?auto_737699 ?auto_737703 ) ) ( not ( = ?auto_737699 ?auto_737704 ) ) ( not ( = ?auto_737699 ?auto_737705 ) ) ( not ( = ?auto_737699 ?auto_737706 ) ) ( not ( = ?auto_737699 ?auto_737707 ) ) ( not ( = ?auto_737699 ?auto_737708 ) ) ( not ( = ?auto_737699 ?auto_737709 ) ) ( not ( = ?auto_737699 ?auto_737710 ) ) ( not ( = ?auto_737699 ?auto_737711 ) ) ( not ( = ?auto_737699 ?auto_737712 ) ) ( not ( = ?auto_737700 ?auto_737701 ) ) ( not ( = ?auto_737700 ?auto_737702 ) ) ( not ( = ?auto_737700 ?auto_737703 ) ) ( not ( = ?auto_737700 ?auto_737704 ) ) ( not ( = ?auto_737700 ?auto_737705 ) ) ( not ( = ?auto_737700 ?auto_737706 ) ) ( not ( = ?auto_737700 ?auto_737707 ) ) ( not ( = ?auto_737700 ?auto_737708 ) ) ( not ( = ?auto_737700 ?auto_737709 ) ) ( not ( = ?auto_737700 ?auto_737710 ) ) ( not ( = ?auto_737700 ?auto_737711 ) ) ( not ( = ?auto_737700 ?auto_737712 ) ) ( not ( = ?auto_737701 ?auto_737702 ) ) ( not ( = ?auto_737701 ?auto_737703 ) ) ( not ( = ?auto_737701 ?auto_737704 ) ) ( not ( = ?auto_737701 ?auto_737705 ) ) ( not ( = ?auto_737701 ?auto_737706 ) ) ( not ( = ?auto_737701 ?auto_737707 ) ) ( not ( = ?auto_737701 ?auto_737708 ) ) ( not ( = ?auto_737701 ?auto_737709 ) ) ( not ( = ?auto_737701 ?auto_737710 ) ) ( not ( = ?auto_737701 ?auto_737711 ) ) ( not ( = ?auto_737701 ?auto_737712 ) ) ( not ( = ?auto_737702 ?auto_737703 ) ) ( not ( = ?auto_737702 ?auto_737704 ) ) ( not ( = ?auto_737702 ?auto_737705 ) ) ( not ( = ?auto_737702 ?auto_737706 ) ) ( not ( = ?auto_737702 ?auto_737707 ) ) ( not ( = ?auto_737702 ?auto_737708 ) ) ( not ( = ?auto_737702 ?auto_737709 ) ) ( not ( = ?auto_737702 ?auto_737710 ) ) ( not ( = ?auto_737702 ?auto_737711 ) ) ( not ( = ?auto_737702 ?auto_737712 ) ) ( not ( = ?auto_737703 ?auto_737704 ) ) ( not ( = ?auto_737703 ?auto_737705 ) ) ( not ( = ?auto_737703 ?auto_737706 ) ) ( not ( = ?auto_737703 ?auto_737707 ) ) ( not ( = ?auto_737703 ?auto_737708 ) ) ( not ( = ?auto_737703 ?auto_737709 ) ) ( not ( = ?auto_737703 ?auto_737710 ) ) ( not ( = ?auto_737703 ?auto_737711 ) ) ( not ( = ?auto_737703 ?auto_737712 ) ) ( not ( = ?auto_737704 ?auto_737705 ) ) ( not ( = ?auto_737704 ?auto_737706 ) ) ( not ( = ?auto_737704 ?auto_737707 ) ) ( not ( = ?auto_737704 ?auto_737708 ) ) ( not ( = ?auto_737704 ?auto_737709 ) ) ( not ( = ?auto_737704 ?auto_737710 ) ) ( not ( = ?auto_737704 ?auto_737711 ) ) ( not ( = ?auto_737704 ?auto_737712 ) ) ( not ( = ?auto_737705 ?auto_737706 ) ) ( not ( = ?auto_737705 ?auto_737707 ) ) ( not ( = ?auto_737705 ?auto_737708 ) ) ( not ( = ?auto_737705 ?auto_737709 ) ) ( not ( = ?auto_737705 ?auto_737710 ) ) ( not ( = ?auto_737705 ?auto_737711 ) ) ( not ( = ?auto_737705 ?auto_737712 ) ) ( not ( = ?auto_737706 ?auto_737707 ) ) ( not ( = ?auto_737706 ?auto_737708 ) ) ( not ( = ?auto_737706 ?auto_737709 ) ) ( not ( = ?auto_737706 ?auto_737710 ) ) ( not ( = ?auto_737706 ?auto_737711 ) ) ( not ( = ?auto_737706 ?auto_737712 ) ) ( not ( = ?auto_737707 ?auto_737708 ) ) ( not ( = ?auto_737707 ?auto_737709 ) ) ( not ( = ?auto_737707 ?auto_737710 ) ) ( not ( = ?auto_737707 ?auto_737711 ) ) ( not ( = ?auto_737707 ?auto_737712 ) ) ( not ( = ?auto_737708 ?auto_737709 ) ) ( not ( = ?auto_737708 ?auto_737710 ) ) ( not ( = ?auto_737708 ?auto_737711 ) ) ( not ( = ?auto_737708 ?auto_737712 ) ) ( not ( = ?auto_737709 ?auto_737710 ) ) ( not ( = ?auto_737709 ?auto_737711 ) ) ( not ( = ?auto_737709 ?auto_737712 ) ) ( not ( = ?auto_737710 ?auto_737711 ) ) ( not ( = ?auto_737710 ?auto_737712 ) ) ( not ( = ?auto_737711 ?auto_737712 ) ) ( ON ?auto_737710 ?auto_737711 ) ( ON ?auto_737709 ?auto_737710 ) ( ON ?auto_737708 ?auto_737709 ) ( CLEAR ?auto_737706 ) ( ON ?auto_737707 ?auto_737708 ) ( CLEAR ?auto_737707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_737696 ?auto_737697 ?auto_737698 ?auto_737699 ?auto_737700 ?auto_737701 ?auto_737702 ?auto_737703 ?auto_737704 ?auto_737705 ?auto_737706 ?auto_737707 )
      ( MAKE-16PILE ?auto_737696 ?auto_737697 ?auto_737698 ?auto_737699 ?auto_737700 ?auto_737701 ?auto_737702 ?auto_737703 ?auto_737704 ?auto_737705 ?auto_737706 ?auto_737707 ?auto_737708 ?auto_737709 ?auto_737710 ?auto_737711 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737762 - BLOCK
      ?auto_737763 - BLOCK
      ?auto_737764 - BLOCK
      ?auto_737765 - BLOCK
      ?auto_737766 - BLOCK
      ?auto_737767 - BLOCK
      ?auto_737768 - BLOCK
      ?auto_737769 - BLOCK
      ?auto_737770 - BLOCK
      ?auto_737771 - BLOCK
      ?auto_737772 - BLOCK
      ?auto_737773 - BLOCK
      ?auto_737774 - BLOCK
      ?auto_737775 - BLOCK
      ?auto_737776 - BLOCK
      ?auto_737777 - BLOCK
    )
    :vars
    (
      ?auto_737778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737777 ?auto_737778 ) ( ON-TABLE ?auto_737762 ) ( ON ?auto_737763 ?auto_737762 ) ( ON ?auto_737764 ?auto_737763 ) ( ON ?auto_737765 ?auto_737764 ) ( ON ?auto_737766 ?auto_737765 ) ( ON ?auto_737767 ?auto_737766 ) ( ON ?auto_737768 ?auto_737767 ) ( ON ?auto_737769 ?auto_737768 ) ( ON ?auto_737770 ?auto_737769 ) ( ON ?auto_737771 ?auto_737770 ) ( not ( = ?auto_737762 ?auto_737763 ) ) ( not ( = ?auto_737762 ?auto_737764 ) ) ( not ( = ?auto_737762 ?auto_737765 ) ) ( not ( = ?auto_737762 ?auto_737766 ) ) ( not ( = ?auto_737762 ?auto_737767 ) ) ( not ( = ?auto_737762 ?auto_737768 ) ) ( not ( = ?auto_737762 ?auto_737769 ) ) ( not ( = ?auto_737762 ?auto_737770 ) ) ( not ( = ?auto_737762 ?auto_737771 ) ) ( not ( = ?auto_737762 ?auto_737772 ) ) ( not ( = ?auto_737762 ?auto_737773 ) ) ( not ( = ?auto_737762 ?auto_737774 ) ) ( not ( = ?auto_737762 ?auto_737775 ) ) ( not ( = ?auto_737762 ?auto_737776 ) ) ( not ( = ?auto_737762 ?auto_737777 ) ) ( not ( = ?auto_737762 ?auto_737778 ) ) ( not ( = ?auto_737763 ?auto_737764 ) ) ( not ( = ?auto_737763 ?auto_737765 ) ) ( not ( = ?auto_737763 ?auto_737766 ) ) ( not ( = ?auto_737763 ?auto_737767 ) ) ( not ( = ?auto_737763 ?auto_737768 ) ) ( not ( = ?auto_737763 ?auto_737769 ) ) ( not ( = ?auto_737763 ?auto_737770 ) ) ( not ( = ?auto_737763 ?auto_737771 ) ) ( not ( = ?auto_737763 ?auto_737772 ) ) ( not ( = ?auto_737763 ?auto_737773 ) ) ( not ( = ?auto_737763 ?auto_737774 ) ) ( not ( = ?auto_737763 ?auto_737775 ) ) ( not ( = ?auto_737763 ?auto_737776 ) ) ( not ( = ?auto_737763 ?auto_737777 ) ) ( not ( = ?auto_737763 ?auto_737778 ) ) ( not ( = ?auto_737764 ?auto_737765 ) ) ( not ( = ?auto_737764 ?auto_737766 ) ) ( not ( = ?auto_737764 ?auto_737767 ) ) ( not ( = ?auto_737764 ?auto_737768 ) ) ( not ( = ?auto_737764 ?auto_737769 ) ) ( not ( = ?auto_737764 ?auto_737770 ) ) ( not ( = ?auto_737764 ?auto_737771 ) ) ( not ( = ?auto_737764 ?auto_737772 ) ) ( not ( = ?auto_737764 ?auto_737773 ) ) ( not ( = ?auto_737764 ?auto_737774 ) ) ( not ( = ?auto_737764 ?auto_737775 ) ) ( not ( = ?auto_737764 ?auto_737776 ) ) ( not ( = ?auto_737764 ?auto_737777 ) ) ( not ( = ?auto_737764 ?auto_737778 ) ) ( not ( = ?auto_737765 ?auto_737766 ) ) ( not ( = ?auto_737765 ?auto_737767 ) ) ( not ( = ?auto_737765 ?auto_737768 ) ) ( not ( = ?auto_737765 ?auto_737769 ) ) ( not ( = ?auto_737765 ?auto_737770 ) ) ( not ( = ?auto_737765 ?auto_737771 ) ) ( not ( = ?auto_737765 ?auto_737772 ) ) ( not ( = ?auto_737765 ?auto_737773 ) ) ( not ( = ?auto_737765 ?auto_737774 ) ) ( not ( = ?auto_737765 ?auto_737775 ) ) ( not ( = ?auto_737765 ?auto_737776 ) ) ( not ( = ?auto_737765 ?auto_737777 ) ) ( not ( = ?auto_737765 ?auto_737778 ) ) ( not ( = ?auto_737766 ?auto_737767 ) ) ( not ( = ?auto_737766 ?auto_737768 ) ) ( not ( = ?auto_737766 ?auto_737769 ) ) ( not ( = ?auto_737766 ?auto_737770 ) ) ( not ( = ?auto_737766 ?auto_737771 ) ) ( not ( = ?auto_737766 ?auto_737772 ) ) ( not ( = ?auto_737766 ?auto_737773 ) ) ( not ( = ?auto_737766 ?auto_737774 ) ) ( not ( = ?auto_737766 ?auto_737775 ) ) ( not ( = ?auto_737766 ?auto_737776 ) ) ( not ( = ?auto_737766 ?auto_737777 ) ) ( not ( = ?auto_737766 ?auto_737778 ) ) ( not ( = ?auto_737767 ?auto_737768 ) ) ( not ( = ?auto_737767 ?auto_737769 ) ) ( not ( = ?auto_737767 ?auto_737770 ) ) ( not ( = ?auto_737767 ?auto_737771 ) ) ( not ( = ?auto_737767 ?auto_737772 ) ) ( not ( = ?auto_737767 ?auto_737773 ) ) ( not ( = ?auto_737767 ?auto_737774 ) ) ( not ( = ?auto_737767 ?auto_737775 ) ) ( not ( = ?auto_737767 ?auto_737776 ) ) ( not ( = ?auto_737767 ?auto_737777 ) ) ( not ( = ?auto_737767 ?auto_737778 ) ) ( not ( = ?auto_737768 ?auto_737769 ) ) ( not ( = ?auto_737768 ?auto_737770 ) ) ( not ( = ?auto_737768 ?auto_737771 ) ) ( not ( = ?auto_737768 ?auto_737772 ) ) ( not ( = ?auto_737768 ?auto_737773 ) ) ( not ( = ?auto_737768 ?auto_737774 ) ) ( not ( = ?auto_737768 ?auto_737775 ) ) ( not ( = ?auto_737768 ?auto_737776 ) ) ( not ( = ?auto_737768 ?auto_737777 ) ) ( not ( = ?auto_737768 ?auto_737778 ) ) ( not ( = ?auto_737769 ?auto_737770 ) ) ( not ( = ?auto_737769 ?auto_737771 ) ) ( not ( = ?auto_737769 ?auto_737772 ) ) ( not ( = ?auto_737769 ?auto_737773 ) ) ( not ( = ?auto_737769 ?auto_737774 ) ) ( not ( = ?auto_737769 ?auto_737775 ) ) ( not ( = ?auto_737769 ?auto_737776 ) ) ( not ( = ?auto_737769 ?auto_737777 ) ) ( not ( = ?auto_737769 ?auto_737778 ) ) ( not ( = ?auto_737770 ?auto_737771 ) ) ( not ( = ?auto_737770 ?auto_737772 ) ) ( not ( = ?auto_737770 ?auto_737773 ) ) ( not ( = ?auto_737770 ?auto_737774 ) ) ( not ( = ?auto_737770 ?auto_737775 ) ) ( not ( = ?auto_737770 ?auto_737776 ) ) ( not ( = ?auto_737770 ?auto_737777 ) ) ( not ( = ?auto_737770 ?auto_737778 ) ) ( not ( = ?auto_737771 ?auto_737772 ) ) ( not ( = ?auto_737771 ?auto_737773 ) ) ( not ( = ?auto_737771 ?auto_737774 ) ) ( not ( = ?auto_737771 ?auto_737775 ) ) ( not ( = ?auto_737771 ?auto_737776 ) ) ( not ( = ?auto_737771 ?auto_737777 ) ) ( not ( = ?auto_737771 ?auto_737778 ) ) ( not ( = ?auto_737772 ?auto_737773 ) ) ( not ( = ?auto_737772 ?auto_737774 ) ) ( not ( = ?auto_737772 ?auto_737775 ) ) ( not ( = ?auto_737772 ?auto_737776 ) ) ( not ( = ?auto_737772 ?auto_737777 ) ) ( not ( = ?auto_737772 ?auto_737778 ) ) ( not ( = ?auto_737773 ?auto_737774 ) ) ( not ( = ?auto_737773 ?auto_737775 ) ) ( not ( = ?auto_737773 ?auto_737776 ) ) ( not ( = ?auto_737773 ?auto_737777 ) ) ( not ( = ?auto_737773 ?auto_737778 ) ) ( not ( = ?auto_737774 ?auto_737775 ) ) ( not ( = ?auto_737774 ?auto_737776 ) ) ( not ( = ?auto_737774 ?auto_737777 ) ) ( not ( = ?auto_737774 ?auto_737778 ) ) ( not ( = ?auto_737775 ?auto_737776 ) ) ( not ( = ?auto_737775 ?auto_737777 ) ) ( not ( = ?auto_737775 ?auto_737778 ) ) ( not ( = ?auto_737776 ?auto_737777 ) ) ( not ( = ?auto_737776 ?auto_737778 ) ) ( not ( = ?auto_737777 ?auto_737778 ) ) ( ON ?auto_737776 ?auto_737777 ) ( ON ?auto_737775 ?auto_737776 ) ( ON ?auto_737774 ?auto_737775 ) ( ON ?auto_737773 ?auto_737774 ) ( CLEAR ?auto_737771 ) ( ON ?auto_737772 ?auto_737773 ) ( CLEAR ?auto_737772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_737762 ?auto_737763 ?auto_737764 ?auto_737765 ?auto_737766 ?auto_737767 ?auto_737768 ?auto_737769 ?auto_737770 ?auto_737771 ?auto_737772 )
      ( MAKE-16PILE ?auto_737762 ?auto_737763 ?auto_737764 ?auto_737765 ?auto_737766 ?auto_737767 ?auto_737768 ?auto_737769 ?auto_737770 ?auto_737771 ?auto_737772 ?auto_737773 ?auto_737774 ?auto_737775 ?auto_737776 ?auto_737777 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737828 - BLOCK
      ?auto_737829 - BLOCK
      ?auto_737830 - BLOCK
      ?auto_737831 - BLOCK
      ?auto_737832 - BLOCK
      ?auto_737833 - BLOCK
      ?auto_737834 - BLOCK
      ?auto_737835 - BLOCK
      ?auto_737836 - BLOCK
      ?auto_737837 - BLOCK
      ?auto_737838 - BLOCK
      ?auto_737839 - BLOCK
      ?auto_737840 - BLOCK
      ?auto_737841 - BLOCK
      ?auto_737842 - BLOCK
      ?auto_737843 - BLOCK
    )
    :vars
    (
      ?auto_737844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737843 ?auto_737844 ) ( ON-TABLE ?auto_737828 ) ( ON ?auto_737829 ?auto_737828 ) ( ON ?auto_737830 ?auto_737829 ) ( ON ?auto_737831 ?auto_737830 ) ( ON ?auto_737832 ?auto_737831 ) ( ON ?auto_737833 ?auto_737832 ) ( ON ?auto_737834 ?auto_737833 ) ( ON ?auto_737835 ?auto_737834 ) ( ON ?auto_737836 ?auto_737835 ) ( not ( = ?auto_737828 ?auto_737829 ) ) ( not ( = ?auto_737828 ?auto_737830 ) ) ( not ( = ?auto_737828 ?auto_737831 ) ) ( not ( = ?auto_737828 ?auto_737832 ) ) ( not ( = ?auto_737828 ?auto_737833 ) ) ( not ( = ?auto_737828 ?auto_737834 ) ) ( not ( = ?auto_737828 ?auto_737835 ) ) ( not ( = ?auto_737828 ?auto_737836 ) ) ( not ( = ?auto_737828 ?auto_737837 ) ) ( not ( = ?auto_737828 ?auto_737838 ) ) ( not ( = ?auto_737828 ?auto_737839 ) ) ( not ( = ?auto_737828 ?auto_737840 ) ) ( not ( = ?auto_737828 ?auto_737841 ) ) ( not ( = ?auto_737828 ?auto_737842 ) ) ( not ( = ?auto_737828 ?auto_737843 ) ) ( not ( = ?auto_737828 ?auto_737844 ) ) ( not ( = ?auto_737829 ?auto_737830 ) ) ( not ( = ?auto_737829 ?auto_737831 ) ) ( not ( = ?auto_737829 ?auto_737832 ) ) ( not ( = ?auto_737829 ?auto_737833 ) ) ( not ( = ?auto_737829 ?auto_737834 ) ) ( not ( = ?auto_737829 ?auto_737835 ) ) ( not ( = ?auto_737829 ?auto_737836 ) ) ( not ( = ?auto_737829 ?auto_737837 ) ) ( not ( = ?auto_737829 ?auto_737838 ) ) ( not ( = ?auto_737829 ?auto_737839 ) ) ( not ( = ?auto_737829 ?auto_737840 ) ) ( not ( = ?auto_737829 ?auto_737841 ) ) ( not ( = ?auto_737829 ?auto_737842 ) ) ( not ( = ?auto_737829 ?auto_737843 ) ) ( not ( = ?auto_737829 ?auto_737844 ) ) ( not ( = ?auto_737830 ?auto_737831 ) ) ( not ( = ?auto_737830 ?auto_737832 ) ) ( not ( = ?auto_737830 ?auto_737833 ) ) ( not ( = ?auto_737830 ?auto_737834 ) ) ( not ( = ?auto_737830 ?auto_737835 ) ) ( not ( = ?auto_737830 ?auto_737836 ) ) ( not ( = ?auto_737830 ?auto_737837 ) ) ( not ( = ?auto_737830 ?auto_737838 ) ) ( not ( = ?auto_737830 ?auto_737839 ) ) ( not ( = ?auto_737830 ?auto_737840 ) ) ( not ( = ?auto_737830 ?auto_737841 ) ) ( not ( = ?auto_737830 ?auto_737842 ) ) ( not ( = ?auto_737830 ?auto_737843 ) ) ( not ( = ?auto_737830 ?auto_737844 ) ) ( not ( = ?auto_737831 ?auto_737832 ) ) ( not ( = ?auto_737831 ?auto_737833 ) ) ( not ( = ?auto_737831 ?auto_737834 ) ) ( not ( = ?auto_737831 ?auto_737835 ) ) ( not ( = ?auto_737831 ?auto_737836 ) ) ( not ( = ?auto_737831 ?auto_737837 ) ) ( not ( = ?auto_737831 ?auto_737838 ) ) ( not ( = ?auto_737831 ?auto_737839 ) ) ( not ( = ?auto_737831 ?auto_737840 ) ) ( not ( = ?auto_737831 ?auto_737841 ) ) ( not ( = ?auto_737831 ?auto_737842 ) ) ( not ( = ?auto_737831 ?auto_737843 ) ) ( not ( = ?auto_737831 ?auto_737844 ) ) ( not ( = ?auto_737832 ?auto_737833 ) ) ( not ( = ?auto_737832 ?auto_737834 ) ) ( not ( = ?auto_737832 ?auto_737835 ) ) ( not ( = ?auto_737832 ?auto_737836 ) ) ( not ( = ?auto_737832 ?auto_737837 ) ) ( not ( = ?auto_737832 ?auto_737838 ) ) ( not ( = ?auto_737832 ?auto_737839 ) ) ( not ( = ?auto_737832 ?auto_737840 ) ) ( not ( = ?auto_737832 ?auto_737841 ) ) ( not ( = ?auto_737832 ?auto_737842 ) ) ( not ( = ?auto_737832 ?auto_737843 ) ) ( not ( = ?auto_737832 ?auto_737844 ) ) ( not ( = ?auto_737833 ?auto_737834 ) ) ( not ( = ?auto_737833 ?auto_737835 ) ) ( not ( = ?auto_737833 ?auto_737836 ) ) ( not ( = ?auto_737833 ?auto_737837 ) ) ( not ( = ?auto_737833 ?auto_737838 ) ) ( not ( = ?auto_737833 ?auto_737839 ) ) ( not ( = ?auto_737833 ?auto_737840 ) ) ( not ( = ?auto_737833 ?auto_737841 ) ) ( not ( = ?auto_737833 ?auto_737842 ) ) ( not ( = ?auto_737833 ?auto_737843 ) ) ( not ( = ?auto_737833 ?auto_737844 ) ) ( not ( = ?auto_737834 ?auto_737835 ) ) ( not ( = ?auto_737834 ?auto_737836 ) ) ( not ( = ?auto_737834 ?auto_737837 ) ) ( not ( = ?auto_737834 ?auto_737838 ) ) ( not ( = ?auto_737834 ?auto_737839 ) ) ( not ( = ?auto_737834 ?auto_737840 ) ) ( not ( = ?auto_737834 ?auto_737841 ) ) ( not ( = ?auto_737834 ?auto_737842 ) ) ( not ( = ?auto_737834 ?auto_737843 ) ) ( not ( = ?auto_737834 ?auto_737844 ) ) ( not ( = ?auto_737835 ?auto_737836 ) ) ( not ( = ?auto_737835 ?auto_737837 ) ) ( not ( = ?auto_737835 ?auto_737838 ) ) ( not ( = ?auto_737835 ?auto_737839 ) ) ( not ( = ?auto_737835 ?auto_737840 ) ) ( not ( = ?auto_737835 ?auto_737841 ) ) ( not ( = ?auto_737835 ?auto_737842 ) ) ( not ( = ?auto_737835 ?auto_737843 ) ) ( not ( = ?auto_737835 ?auto_737844 ) ) ( not ( = ?auto_737836 ?auto_737837 ) ) ( not ( = ?auto_737836 ?auto_737838 ) ) ( not ( = ?auto_737836 ?auto_737839 ) ) ( not ( = ?auto_737836 ?auto_737840 ) ) ( not ( = ?auto_737836 ?auto_737841 ) ) ( not ( = ?auto_737836 ?auto_737842 ) ) ( not ( = ?auto_737836 ?auto_737843 ) ) ( not ( = ?auto_737836 ?auto_737844 ) ) ( not ( = ?auto_737837 ?auto_737838 ) ) ( not ( = ?auto_737837 ?auto_737839 ) ) ( not ( = ?auto_737837 ?auto_737840 ) ) ( not ( = ?auto_737837 ?auto_737841 ) ) ( not ( = ?auto_737837 ?auto_737842 ) ) ( not ( = ?auto_737837 ?auto_737843 ) ) ( not ( = ?auto_737837 ?auto_737844 ) ) ( not ( = ?auto_737838 ?auto_737839 ) ) ( not ( = ?auto_737838 ?auto_737840 ) ) ( not ( = ?auto_737838 ?auto_737841 ) ) ( not ( = ?auto_737838 ?auto_737842 ) ) ( not ( = ?auto_737838 ?auto_737843 ) ) ( not ( = ?auto_737838 ?auto_737844 ) ) ( not ( = ?auto_737839 ?auto_737840 ) ) ( not ( = ?auto_737839 ?auto_737841 ) ) ( not ( = ?auto_737839 ?auto_737842 ) ) ( not ( = ?auto_737839 ?auto_737843 ) ) ( not ( = ?auto_737839 ?auto_737844 ) ) ( not ( = ?auto_737840 ?auto_737841 ) ) ( not ( = ?auto_737840 ?auto_737842 ) ) ( not ( = ?auto_737840 ?auto_737843 ) ) ( not ( = ?auto_737840 ?auto_737844 ) ) ( not ( = ?auto_737841 ?auto_737842 ) ) ( not ( = ?auto_737841 ?auto_737843 ) ) ( not ( = ?auto_737841 ?auto_737844 ) ) ( not ( = ?auto_737842 ?auto_737843 ) ) ( not ( = ?auto_737842 ?auto_737844 ) ) ( not ( = ?auto_737843 ?auto_737844 ) ) ( ON ?auto_737842 ?auto_737843 ) ( ON ?auto_737841 ?auto_737842 ) ( ON ?auto_737840 ?auto_737841 ) ( ON ?auto_737839 ?auto_737840 ) ( ON ?auto_737838 ?auto_737839 ) ( CLEAR ?auto_737836 ) ( ON ?auto_737837 ?auto_737838 ) ( CLEAR ?auto_737837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_737828 ?auto_737829 ?auto_737830 ?auto_737831 ?auto_737832 ?auto_737833 ?auto_737834 ?auto_737835 ?auto_737836 ?auto_737837 )
      ( MAKE-16PILE ?auto_737828 ?auto_737829 ?auto_737830 ?auto_737831 ?auto_737832 ?auto_737833 ?auto_737834 ?auto_737835 ?auto_737836 ?auto_737837 ?auto_737838 ?auto_737839 ?auto_737840 ?auto_737841 ?auto_737842 ?auto_737843 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737894 - BLOCK
      ?auto_737895 - BLOCK
      ?auto_737896 - BLOCK
      ?auto_737897 - BLOCK
      ?auto_737898 - BLOCK
      ?auto_737899 - BLOCK
      ?auto_737900 - BLOCK
      ?auto_737901 - BLOCK
      ?auto_737902 - BLOCK
      ?auto_737903 - BLOCK
      ?auto_737904 - BLOCK
      ?auto_737905 - BLOCK
      ?auto_737906 - BLOCK
      ?auto_737907 - BLOCK
      ?auto_737908 - BLOCK
      ?auto_737909 - BLOCK
    )
    :vars
    (
      ?auto_737910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737909 ?auto_737910 ) ( ON-TABLE ?auto_737894 ) ( ON ?auto_737895 ?auto_737894 ) ( ON ?auto_737896 ?auto_737895 ) ( ON ?auto_737897 ?auto_737896 ) ( ON ?auto_737898 ?auto_737897 ) ( ON ?auto_737899 ?auto_737898 ) ( ON ?auto_737900 ?auto_737899 ) ( ON ?auto_737901 ?auto_737900 ) ( not ( = ?auto_737894 ?auto_737895 ) ) ( not ( = ?auto_737894 ?auto_737896 ) ) ( not ( = ?auto_737894 ?auto_737897 ) ) ( not ( = ?auto_737894 ?auto_737898 ) ) ( not ( = ?auto_737894 ?auto_737899 ) ) ( not ( = ?auto_737894 ?auto_737900 ) ) ( not ( = ?auto_737894 ?auto_737901 ) ) ( not ( = ?auto_737894 ?auto_737902 ) ) ( not ( = ?auto_737894 ?auto_737903 ) ) ( not ( = ?auto_737894 ?auto_737904 ) ) ( not ( = ?auto_737894 ?auto_737905 ) ) ( not ( = ?auto_737894 ?auto_737906 ) ) ( not ( = ?auto_737894 ?auto_737907 ) ) ( not ( = ?auto_737894 ?auto_737908 ) ) ( not ( = ?auto_737894 ?auto_737909 ) ) ( not ( = ?auto_737894 ?auto_737910 ) ) ( not ( = ?auto_737895 ?auto_737896 ) ) ( not ( = ?auto_737895 ?auto_737897 ) ) ( not ( = ?auto_737895 ?auto_737898 ) ) ( not ( = ?auto_737895 ?auto_737899 ) ) ( not ( = ?auto_737895 ?auto_737900 ) ) ( not ( = ?auto_737895 ?auto_737901 ) ) ( not ( = ?auto_737895 ?auto_737902 ) ) ( not ( = ?auto_737895 ?auto_737903 ) ) ( not ( = ?auto_737895 ?auto_737904 ) ) ( not ( = ?auto_737895 ?auto_737905 ) ) ( not ( = ?auto_737895 ?auto_737906 ) ) ( not ( = ?auto_737895 ?auto_737907 ) ) ( not ( = ?auto_737895 ?auto_737908 ) ) ( not ( = ?auto_737895 ?auto_737909 ) ) ( not ( = ?auto_737895 ?auto_737910 ) ) ( not ( = ?auto_737896 ?auto_737897 ) ) ( not ( = ?auto_737896 ?auto_737898 ) ) ( not ( = ?auto_737896 ?auto_737899 ) ) ( not ( = ?auto_737896 ?auto_737900 ) ) ( not ( = ?auto_737896 ?auto_737901 ) ) ( not ( = ?auto_737896 ?auto_737902 ) ) ( not ( = ?auto_737896 ?auto_737903 ) ) ( not ( = ?auto_737896 ?auto_737904 ) ) ( not ( = ?auto_737896 ?auto_737905 ) ) ( not ( = ?auto_737896 ?auto_737906 ) ) ( not ( = ?auto_737896 ?auto_737907 ) ) ( not ( = ?auto_737896 ?auto_737908 ) ) ( not ( = ?auto_737896 ?auto_737909 ) ) ( not ( = ?auto_737896 ?auto_737910 ) ) ( not ( = ?auto_737897 ?auto_737898 ) ) ( not ( = ?auto_737897 ?auto_737899 ) ) ( not ( = ?auto_737897 ?auto_737900 ) ) ( not ( = ?auto_737897 ?auto_737901 ) ) ( not ( = ?auto_737897 ?auto_737902 ) ) ( not ( = ?auto_737897 ?auto_737903 ) ) ( not ( = ?auto_737897 ?auto_737904 ) ) ( not ( = ?auto_737897 ?auto_737905 ) ) ( not ( = ?auto_737897 ?auto_737906 ) ) ( not ( = ?auto_737897 ?auto_737907 ) ) ( not ( = ?auto_737897 ?auto_737908 ) ) ( not ( = ?auto_737897 ?auto_737909 ) ) ( not ( = ?auto_737897 ?auto_737910 ) ) ( not ( = ?auto_737898 ?auto_737899 ) ) ( not ( = ?auto_737898 ?auto_737900 ) ) ( not ( = ?auto_737898 ?auto_737901 ) ) ( not ( = ?auto_737898 ?auto_737902 ) ) ( not ( = ?auto_737898 ?auto_737903 ) ) ( not ( = ?auto_737898 ?auto_737904 ) ) ( not ( = ?auto_737898 ?auto_737905 ) ) ( not ( = ?auto_737898 ?auto_737906 ) ) ( not ( = ?auto_737898 ?auto_737907 ) ) ( not ( = ?auto_737898 ?auto_737908 ) ) ( not ( = ?auto_737898 ?auto_737909 ) ) ( not ( = ?auto_737898 ?auto_737910 ) ) ( not ( = ?auto_737899 ?auto_737900 ) ) ( not ( = ?auto_737899 ?auto_737901 ) ) ( not ( = ?auto_737899 ?auto_737902 ) ) ( not ( = ?auto_737899 ?auto_737903 ) ) ( not ( = ?auto_737899 ?auto_737904 ) ) ( not ( = ?auto_737899 ?auto_737905 ) ) ( not ( = ?auto_737899 ?auto_737906 ) ) ( not ( = ?auto_737899 ?auto_737907 ) ) ( not ( = ?auto_737899 ?auto_737908 ) ) ( not ( = ?auto_737899 ?auto_737909 ) ) ( not ( = ?auto_737899 ?auto_737910 ) ) ( not ( = ?auto_737900 ?auto_737901 ) ) ( not ( = ?auto_737900 ?auto_737902 ) ) ( not ( = ?auto_737900 ?auto_737903 ) ) ( not ( = ?auto_737900 ?auto_737904 ) ) ( not ( = ?auto_737900 ?auto_737905 ) ) ( not ( = ?auto_737900 ?auto_737906 ) ) ( not ( = ?auto_737900 ?auto_737907 ) ) ( not ( = ?auto_737900 ?auto_737908 ) ) ( not ( = ?auto_737900 ?auto_737909 ) ) ( not ( = ?auto_737900 ?auto_737910 ) ) ( not ( = ?auto_737901 ?auto_737902 ) ) ( not ( = ?auto_737901 ?auto_737903 ) ) ( not ( = ?auto_737901 ?auto_737904 ) ) ( not ( = ?auto_737901 ?auto_737905 ) ) ( not ( = ?auto_737901 ?auto_737906 ) ) ( not ( = ?auto_737901 ?auto_737907 ) ) ( not ( = ?auto_737901 ?auto_737908 ) ) ( not ( = ?auto_737901 ?auto_737909 ) ) ( not ( = ?auto_737901 ?auto_737910 ) ) ( not ( = ?auto_737902 ?auto_737903 ) ) ( not ( = ?auto_737902 ?auto_737904 ) ) ( not ( = ?auto_737902 ?auto_737905 ) ) ( not ( = ?auto_737902 ?auto_737906 ) ) ( not ( = ?auto_737902 ?auto_737907 ) ) ( not ( = ?auto_737902 ?auto_737908 ) ) ( not ( = ?auto_737902 ?auto_737909 ) ) ( not ( = ?auto_737902 ?auto_737910 ) ) ( not ( = ?auto_737903 ?auto_737904 ) ) ( not ( = ?auto_737903 ?auto_737905 ) ) ( not ( = ?auto_737903 ?auto_737906 ) ) ( not ( = ?auto_737903 ?auto_737907 ) ) ( not ( = ?auto_737903 ?auto_737908 ) ) ( not ( = ?auto_737903 ?auto_737909 ) ) ( not ( = ?auto_737903 ?auto_737910 ) ) ( not ( = ?auto_737904 ?auto_737905 ) ) ( not ( = ?auto_737904 ?auto_737906 ) ) ( not ( = ?auto_737904 ?auto_737907 ) ) ( not ( = ?auto_737904 ?auto_737908 ) ) ( not ( = ?auto_737904 ?auto_737909 ) ) ( not ( = ?auto_737904 ?auto_737910 ) ) ( not ( = ?auto_737905 ?auto_737906 ) ) ( not ( = ?auto_737905 ?auto_737907 ) ) ( not ( = ?auto_737905 ?auto_737908 ) ) ( not ( = ?auto_737905 ?auto_737909 ) ) ( not ( = ?auto_737905 ?auto_737910 ) ) ( not ( = ?auto_737906 ?auto_737907 ) ) ( not ( = ?auto_737906 ?auto_737908 ) ) ( not ( = ?auto_737906 ?auto_737909 ) ) ( not ( = ?auto_737906 ?auto_737910 ) ) ( not ( = ?auto_737907 ?auto_737908 ) ) ( not ( = ?auto_737907 ?auto_737909 ) ) ( not ( = ?auto_737907 ?auto_737910 ) ) ( not ( = ?auto_737908 ?auto_737909 ) ) ( not ( = ?auto_737908 ?auto_737910 ) ) ( not ( = ?auto_737909 ?auto_737910 ) ) ( ON ?auto_737908 ?auto_737909 ) ( ON ?auto_737907 ?auto_737908 ) ( ON ?auto_737906 ?auto_737907 ) ( ON ?auto_737905 ?auto_737906 ) ( ON ?auto_737904 ?auto_737905 ) ( ON ?auto_737903 ?auto_737904 ) ( CLEAR ?auto_737901 ) ( ON ?auto_737902 ?auto_737903 ) ( CLEAR ?auto_737902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_737894 ?auto_737895 ?auto_737896 ?auto_737897 ?auto_737898 ?auto_737899 ?auto_737900 ?auto_737901 ?auto_737902 )
      ( MAKE-16PILE ?auto_737894 ?auto_737895 ?auto_737896 ?auto_737897 ?auto_737898 ?auto_737899 ?auto_737900 ?auto_737901 ?auto_737902 ?auto_737903 ?auto_737904 ?auto_737905 ?auto_737906 ?auto_737907 ?auto_737908 ?auto_737909 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_737960 - BLOCK
      ?auto_737961 - BLOCK
      ?auto_737962 - BLOCK
      ?auto_737963 - BLOCK
      ?auto_737964 - BLOCK
      ?auto_737965 - BLOCK
      ?auto_737966 - BLOCK
      ?auto_737967 - BLOCK
      ?auto_737968 - BLOCK
      ?auto_737969 - BLOCK
      ?auto_737970 - BLOCK
      ?auto_737971 - BLOCK
      ?auto_737972 - BLOCK
      ?auto_737973 - BLOCK
      ?auto_737974 - BLOCK
      ?auto_737975 - BLOCK
    )
    :vars
    (
      ?auto_737976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_737975 ?auto_737976 ) ( ON-TABLE ?auto_737960 ) ( ON ?auto_737961 ?auto_737960 ) ( ON ?auto_737962 ?auto_737961 ) ( ON ?auto_737963 ?auto_737962 ) ( ON ?auto_737964 ?auto_737963 ) ( ON ?auto_737965 ?auto_737964 ) ( ON ?auto_737966 ?auto_737965 ) ( not ( = ?auto_737960 ?auto_737961 ) ) ( not ( = ?auto_737960 ?auto_737962 ) ) ( not ( = ?auto_737960 ?auto_737963 ) ) ( not ( = ?auto_737960 ?auto_737964 ) ) ( not ( = ?auto_737960 ?auto_737965 ) ) ( not ( = ?auto_737960 ?auto_737966 ) ) ( not ( = ?auto_737960 ?auto_737967 ) ) ( not ( = ?auto_737960 ?auto_737968 ) ) ( not ( = ?auto_737960 ?auto_737969 ) ) ( not ( = ?auto_737960 ?auto_737970 ) ) ( not ( = ?auto_737960 ?auto_737971 ) ) ( not ( = ?auto_737960 ?auto_737972 ) ) ( not ( = ?auto_737960 ?auto_737973 ) ) ( not ( = ?auto_737960 ?auto_737974 ) ) ( not ( = ?auto_737960 ?auto_737975 ) ) ( not ( = ?auto_737960 ?auto_737976 ) ) ( not ( = ?auto_737961 ?auto_737962 ) ) ( not ( = ?auto_737961 ?auto_737963 ) ) ( not ( = ?auto_737961 ?auto_737964 ) ) ( not ( = ?auto_737961 ?auto_737965 ) ) ( not ( = ?auto_737961 ?auto_737966 ) ) ( not ( = ?auto_737961 ?auto_737967 ) ) ( not ( = ?auto_737961 ?auto_737968 ) ) ( not ( = ?auto_737961 ?auto_737969 ) ) ( not ( = ?auto_737961 ?auto_737970 ) ) ( not ( = ?auto_737961 ?auto_737971 ) ) ( not ( = ?auto_737961 ?auto_737972 ) ) ( not ( = ?auto_737961 ?auto_737973 ) ) ( not ( = ?auto_737961 ?auto_737974 ) ) ( not ( = ?auto_737961 ?auto_737975 ) ) ( not ( = ?auto_737961 ?auto_737976 ) ) ( not ( = ?auto_737962 ?auto_737963 ) ) ( not ( = ?auto_737962 ?auto_737964 ) ) ( not ( = ?auto_737962 ?auto_737965 ) ) ( not ( = ?auto_737962 ?auto_737966 ) ) ( not ( = ?auto_737962 ?auto_737967 ) ) ( not ( = ?auto_737962 ?auto_737968 ) ) ( not ( = ?auto_737962 ?auto_737969 ) ) ( not ( = ?auto_737962 ?auto_737970 ) ) ( not ( = ?auto_737962 ?auto_737971 ) ) ( not ( = ?auto_737962 ?auto_737972 ) ) ( not ( = ?auto_737962 ?auto_737973 ) ) ( not ( = ?auto_737962 ?auto_737974 ) ) ( not ( = ?auto_737962 ?auto_737975 ) ) ( not ( = ?auto_737962 ?auto_737976 ) ) ( not ( = ?auto_737963 ?auto_737964 ) ) ( not ( = ?auto_737963 ?auto_737965 ) ) ( not ( = ?auto_737963 ?auto_737966 ) ) ( not ( = ?auto_737963 ?auto_737967 ) ) ( not ( = ?auto_737963 ?auto_737968 ) ) ( not ( = ?auto_737963 ?auto_737969 ) ) ( not ( = ?auto_737963 ?auto_737970 ) ) ( not ( = ?auto_737963 ?auto_737971 ) ) ( not ( = ?auto_737963 ?auto_737972 ) ) ( not ( = ?auto_737963 ?auto_737973 ) ) ( not ( = ?auto_737963 ?auto_737974 ) ) ( not ( = ?auto_737963 ?auto_737975 ) ) ( not ( = ?auto_737963 ?auto_737976 ) ) ( not ( = ?auto_737964 ?auto_737965 ) ) ( not ( = ?auto_737964 ?auto_737966 ) ) ( not ( = ?auto_737964 ?auto_737967 ) ) ( not ( = ?auto_737964 ?auto_737968 ) ) ( not ( = ?auto_737964 ?auto_737969 ) ) ( not ( = ?auto_737964 ?auto_737970 ) ) ( not ( = ?auto_737964 ?auto_737971 ) ) ( not ( = ?auto_737964 ?auto_737972 ) ) ( not ( = ?auto_737964 ?auto_737973 ) ) ( not ( = ?auto_737964 ?auto_737974 ) ) ( not ( = ?auto_737964 ?auto_737975 ) ) ( not ( = ?auto_737964 ?auto_737976 ) ) ( not ( = ?auto_737965 ?auto_737966 ) ) ( not ( = ?auto_737965 ?auto_737967 ) ) ( not ( = ?auto_737965 ?auto_737968 ) ) ( not ( = ?auto_737965 ?auto_737969 ) ) ( not ( = ?auto_737965 ?auto_737970 ) ) ( not ( = ?auto_737965 ?auto_737971 ) ) ( not ( = ?auto_737965 ?auto_737972 ) ) ( not ( = ?auto_737965 ?auto_737973 ) ) ( not ( = ?auto_737965 ?auto_737974 ) ) ( not ( = ?auto_737965 ?auto_737975 ) ) ( not ( = ?auto_737965 ?auto_737976 ) ) ( not ( = ?auto_737966 ?auto_737967 ) ) ( not ( = ?auto_737966 ?auto_737968 ) ) ( not ( = ?auto_737966 ?auto_737969 ) ) ( not ( = ?auto_737966 ?auto_737970 ) ) ( not ( = ?auto_737966 ?auto_737971 ) ) ( not ( = ?auto_737966 ?auto_737972 ) ) ( not ( = ?auto_737966 ?auto_737973 ) ) ( not ( = ?auto_737966 ?auto_737974 ) ) ( not ( = ?auto_737966 ?auto_737975 ) ) ( not ( = ?auto_737966 ?auto_737976 ) ) ( not ( = ?auto_737967 ?auto_737968 ) ) ( not ( = ?auto_737967 ?auto_737969 ) ) ( not ( = ?auto_737967 ?auto_737970 ) ) ( not ( = ?auto_737967 ?auto_737971 ) ) ( not ( = ?auto_737967 ?auto_737972 ) ) ( not ( = ?auto_737967 ?auto_737973 ) ) ( not ( = ?auto_737967 ?auto_737974 ) ) ( not ( = ?auto_737967 ?auto_737975 ) ) ( not ( = ?auto_737967 ?auto_737976 ) ) ( not ( = ?auto_737968 ?auto_737969 ) ) ( not ( = ?auto_737968 ?auto_737970 ) ) ( not ( = ?auto_737968 ?auto_737971 ) ) ( not ( = ?auto_737968 ?auto_737972 ) ) ( not ( = ?auto_737968 ?auto_737973 ) ) ( not ( = ?auto_737968 ?auto_737974 ) ) ( not ( = ?auto_737968 ?auto_737975 ) ) ( not ( = ?auto_737968 ?auto_737976 ) ) ( not ( = ?auto_737969 ?auto_737970 ) ) ( not ( = ?auto_737969 ?auto_737971 ) ) ( not ( = ?auto_737969 ?auto_737972 ) ) ( not ( = ?auto_737969 ?auto_737973 ) ) ( not ( = ?auto_737969 ?auto_737974 ) ) ( not ( = ?auto_737969 ?auto_737975 ) ) ( not ( = ?auto_737969 ?auto_737976 ) ) ( not ( = ?auto_737970 ?auto_737971 ) ) ( not ( = ?auto_737970 ?auto_737972 ) ) ( not ( = ?auto_737970 ?auto_737973 ) ) ( not ( = ?auto_737970 ?auto_737974 ) ) ( not ( = ?auto_737970 ?auto_737975 ) ) ( not ( = ?auto_737970 ?auto_737976 ) ) ( not ( = ?auto_737971 ?auto_737972 ) ) ( not ( = ?auto_737971 ?auto_737973 ) ) ( not ( = ?auto_737971 ?auto_737974 ) ) ( not ( = ?auto_737971 ?auto_737975 ) ) ( not ( = ?auto_737971 ?auto_737976 ) ) ( not ( = ?auto_737972 ?auto_737973 ) ) ( not ( = ?auto_737972 ?auto_737974 ) ) ( not ( = ?auto_737972 ?auto_737975 ) ) ( not ( = ?auto_737972 ?auto_737976 ) ) ( not ( = ?auto_737973 ?auto_737974 ) ) ( not ( = ?auto_737973 ?auto_737975 ) ) ( not ( = ?auto_737973 ?auto_737976 ) ) ( not ( = ?auto_737974 ?auto_737975 ) ) ( not ( = ?auto_737974 ?auto_737976 ) ) ( not ( = ?auto_737975 ?auto_737976 ) ) ( ON ?auto_737974 ?auto_737975 ) ( ON ?auto_737973 ?auto_737974 ) ( ON ?auto_737972 ?auto_737973 ) ( ON ?auto_737971 ?auto_737972 ) ( ON ?auto_737970 ?auto_737971 ) ( ON ?auto_737969 ?auto_737970 ) ( ON ?auto_737968 ?auto_737969 ) ( CLEAR ?auto_737966 ) ( ON ?auto_737967 ?auto_737968 ) ( CLEAR ?auto_737967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_737960 ?auto_737961 ?auto_737962 ?auto_737963 ?auto_737964 ?auto_737965 ?auto_737966 ?auto_737967 )
      ( MAKE-16PILE ?auto_737960 ?auto_737961 ?auto_737962 ?auto_737963 ?auto_737964 ?auto_737965 ?auto_737966 ?auto_737967 ?auto_737968 ?auto_737969 ?auto_737970 ?auto_737971 ?auto_737972 ?auto_737973 ?auto_737974 ?auto_737975 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738026 - BLOCK
      ?auto_738027 - BLOCK
      ?auto_738028 - BLOCK
      ?auto_738029 - BLOCK
      ?auto_738030 - BLOCK
      ?auto_738031 - BLOCK
      ?auto_738032 - BLOCK
      ?auto_738033 - BLOCK
      ?auto_738034 - BLOCK
      ?auto_738035 - BLOCK
      ?auto_738036 - BLOCK
      ?auto_738037 - BLOCK
      ?auto_738038 - BLOCK
      ?auto_738039 - BLOCK
      ?auto_738040 - BLOCK
      ?auto_738041 - BLOCK
    )
    :vars
    (
      ?auto_738042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738041 ?auto_738042 ) ( ON-TABLE ?auto_738026 ) ( ON ?auto_738027 ?auto_738026 ) ( ON ?auto_738028 ?auto_738027 ) ( ON ?auto_738029 ?auto_738028 ) ( ON ?auto_738030 ?auto_738029 ) ( ON ?auto_738031 ?auto_738030 ) ( not ( = ?auto_738026 ?auto_738027 ) ) ( not ( = ?auto_738026 ?auto_738028 ) ) ( not ( = ?auto_738026 ?auto_738029 ) ) ( not ( = ?auto_738026 ?auto_738030 ) ) ( not ( = ?auto_738026 ?auto_738031 ) ) ( not ( = ?auto_738026 ?auto_738032 ) ) ( not ( = ?auto_738026 ?auto_738033 ) ) ( not ( = ?auto_738026 ?auto_738034 ) ) ( not ( = ?auto_738026 ?auto_738035 ) ) ( not ( = ?auto_738026 ?auto_738036 ) ) ( not ( = ?auto_738026 ?auto_738037 ) ) ( not ( = ?auto_738026 ?auto_738038 ) ) ( not ( = ?auto_738026 ?auto_738039 ) ) ( not ( = ?auto_738026 ?auto_738040 ) ) ( not ( = ?auto_738026 ?auto_738041 ) ) ( not ( = ?auto_738026 ?auto_738042 ) ) ( not ( = ?auto_738027 ?auto_738028 ) ) ( not ( = ?auto_738027 ?auto_738029 ) ) ( not ( = ?auto_738027 ?auto_738030 ) ) ( not ( = ?auto_738027 ?auto_738031 ) ) ( not ( = ?auto_738027 ?auto_738032 ) ) ( not ( = ?auto_738027 ?auto_738033 ) ) ( not ( = ?auto_738027 ?auto_738034 ) ) ( not ( = ?auto_738027 ?auto_738035 ) ) ( not ( = ?auto_738027 ?auto_738036 ) ) ( not ( = ?auto_738027 ?auto_738037 ) ) ( not ( = ?auto_738027 ?auto_738038 ) ) ( not ( = ?auto_738027 ?auto_738039 ) ) ( not ( = ?auto_738027 ?auto_738040 ) ) ( not ( = ?auto_738027 ?auto_738041 ) ) ( not ( = ?auto_738027 ?auto_738042 ) ) ( not ( = ?auto_738028 ?auto_738029 ) ) ( not ( = ?auto_738028 ?auto_738030 ) ) ( not ( = ?auto_738028 ?auto_738031 ) ) ( not ( = ?auto_738028 ?auto_738032 ) ) ( not ( = ?auto_738028 ?auto_738033 ) ) ( not ( = ?auto_738028 ?auto_738034 ) ) ( not ( = ?auto_738028 ?auto_738035 ) ) ( not ( = ?auto_738028 ?auto_738036 ) ) ( not ( = ?auto_738028 ?auto_738037 ) ) ( not ( = ?auto_738028 ?auto_738038 ) ) ( not ( = ?auto_738028 ?auto_738039 ) ) ( not ( = ?auto_738028 ?auto_738040 ) ) ( not ( = ?auto_738028 ?auto_738041 ) ) ( not ( = ?auto_738028 ?auto_738042 ) ) ( not ( = ?auto_738029 ?auto_738030 ) ) ( not ( = ?auto_738029 ?auto_738031 ) ) ( not ( = ?auto_738029 ?auto_738032 ) ) ( not ( = ?auto_738029 ?auto_738033 ) ) ( not ( = ?auto_738029 ?auto_738034 ) ) ( not ( = ?auto_738029 ?auto_738035 ) ) ( not ( = ?auto_738029 ?auto_738036 ) ) ( not ( = ?auto_738029 ?auto_738037 ) ) ( not ( = ?auto_738029 ?auto_738038 ) ) ( not ( = ?auto_738029 ?auto_738039 ) ) ( not ( = ?auto_738029 ?auto_738040 ) ) ( not ( = ?auto_738029 ?auto_738041 ) ) ( not ( = ?auto_738029 ?auto_738042 ) ) ( not ( = ?auto_738030 ?auto_738031 ) ) ( not ( = ?auto_738030 ?auto_738032 ) ) ( not ( = ?auto_738030 ?auto_738033 ) ) ( not ( = ?auto_738030 ?auto_738034 ) ) ( not ( = ?auto_738030 ?auto_738035 ) ) ( not ( = ?auto_738030 ?auto_738036 ) ) ( not ( = ?auto_738030 ?auto_738037 ) ) ( not ( = ?auto_738030 ?auto_738038 ) ) ( not ( = ?auto_738030 ?auto_738039 ) ) ( not ( = ?auto_738030 ?auto_738040 ) ) ( not ( = ?auto_738030 ?auto_738041 ) ) ( not ( = ?auto_738030 ?auto_738042 ) ) ( not ( = ?auto_738031 ?auto_738032 ) ) ( not ( = ?auto_738031 ?auto_738033 ) ) ( not ( = ?auto_738031 ?auto_738034 ) ) ( not ( = ?auto_738031 ?auto_738035 ) ) ( not ( = ?auto_738031 ?auto_738036 ) ) ( not ( = ?auto_738031 ?auto_738037 ) ) ( not ( = ?auto_738031 ?auto_738038 ) ) ( not ( = ?auto_738031 ?auto_738039 ) ) ( not ( = ?auto_738031 ?auto_738040 ) ) ( not ( = ?auto_738031 ?auto_738041 ) ) ( not ( = ?auto_738031 ?auto_738042 ) ) ( not ( = ?auto_738032 ?auto_738033 ) ) ( not ( = ?auto_738032 ?auto_738034 ) ) ( not ( = ?auto_738032 ?auto_738035 ) ) ( not ( = ?auto_738032 ?auto_738036 ) ) ( not ( = ?auto_738032 ?auto_738037 ) ) ( not ( = ?auto_738032 ?auto_738038 ) ) ( not ( = ?auto_738032 ?auto_738039 ) ) ( not ( = ?auto_738032 ?auto_738040 ) ) ( not ( = ?auto_738032 ?auto_738041 ) ) ( not ( = ?auto_738032 ?auto_738042 ) ) ( not ( = ?auto_738033 ?auto_738034 ) ) ( not ( = ?auto_738033 ?auto_738035 ) ) ( not ( = ?auto_738033 ?auto_738036 ) ) ( not ( = ?auto_738033 ?auto_738037 ) ) ( not ( = ?auto_738033 ?auto_738038 ) ) ( not ( = ?auto_738033 ?auto_738039 ) ) ( not ( = ?auto_738033 ?auto_738040 ) ) ( not ( = ?auto_738033 ?auto_738041 ) ) ( not ( = ?auto_738033 ?auto_738042 ) ) ( not ( = ?auto_738034 ?auto_738035 ) ) ( not ( = ?auto_738034 ?auto_738036 ) ) ( not ( = ?auto_738034 ?auto_738037 ) ) ( not ( = ?auto_738034 ?auto_738038 ) ) ( not ( = ?auto_738034 ?auto_738039 ) ) ( not ( = ?auto_738034 ?auto_738040 ) ) ( not ( = ?auto_738034 ?auto_738041 ) ) ( not ( = ?auto_738034 ?auto_738042 ) ) ( not ( = ?auto_738035 ?auto_738036 ) ) ( not ( = ?auto_738035 ?auto_738037 ) ) ( not ( = ?auto_738035 ?auto_738038 ) ) ( not ( = ?auto_738035 ?auto_738039 ) ) ( not ( = ?auto_738035 ?auto_738040 ) ) ( not ( = ?auto_738035 ?auto_738041 ) ) ( not ( = ?auto_738035 ?auto_738042 ) ) ( not ( = ?auto_738036 ?auto_738037 ) ) ( not ( = ?auto_738036 ?auto_738038 ) ) ( not ( = ?auto_738036 ?auto_738039 ) ) ( not ( = ?auto_738036 ?auto_738040 ) ) ( not ( = ?auto_738036 ?auto_738041 ) ) ( not ( = ?auto_738036 ?auto_738042 ) ) ( not ( = ?auto_738037 ?auto_738038 ) ) ( not ( = ?auto_738037 ?auto_738039 ) ) ( not ( = ?auto_738037 ?auto_738040 ) ) ( not ( = ?auto_738037 ?auto_738041 ) ) ( not ( = ?auto_738037 ?auto_738042 ) ) ( not ( = ?auto_738038 ?auto_738039 ) ) ( not ( = ?auto_738038 ?auto_738040 ) ) ( not ( = ?auto_738038 ?auto_738041 ) ) ( not ( = ?auto_738038 ?auto_738042 ) ) ( not ( = ?auto_738039 ?auto_738040 ) ) ( not ( = ?auto_738039 ?auto_738041 ) ) ( not ( = ?auto_738039 ?auto_738042 ) ) ( not ( = ?auto_738040 ?auto_738041 ) ) ( not ( = ?auto_738040 ?auto_738042 ) ) ( not ( = ?auto_738041 ?auto_738042 ) ) ( ON ?auto_738040 ?auto_738041 ) ( ON ?auto_738039 ?auto_738040 ) ( ON ?auto_738038 ?auto_738039 ) ( ON ?auto_738037 ?auto_738038 ) ( ON ?auto_738036 ?auto_738037 ) ( ON ?auto_738035 ?auto_738036 ) ( ON ?auto_738034 ?auto_738035 ) ( ON ?auto_738033 ?auto_738034 ) ( CLEAR ?auto_738031 ) ( ON ?auto_738032 ?auto_738033 ) ( CLEAR ?auto_738032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_738026 ?auto_738027 ?auto_738028 ?auto_738029 ?auto_738030 ?auto_738031 ?auto_738032 )
      ( MAKE-16PILE ?auto_738026 ?auto_738027 ?auto_738028 ?auto_738029 ?auto_738030 ?auto_738031 ?auto_738032 ?auto_738033 ?auto_738034 ?auto_738035 ?auto_738036 ?auto_738037 ?auto_738038 ?auto_738039 ?auto_738040 ?auto_738041 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738092 - BLOCK
      ?auto_738093 - BLOCK
      ?auto_738094 - BLOCK
      ?auto_738095 - BLOCK
      ?auto_738096 - BLOCK
      ?auto_738097 - BLOCK
      ?auto_738098 - BLOCK
      ?auto_738099 - BLOCK
      ?auto_738100 - BLOCK
      ?auto_738101 - BLOCK
      ?auto_738102 - BLOCK
      ?auto_738103 - BLOCK
      ?auto_738104 - BLOCK
      ?auto_738105 - BLOCK
      ?auto_738106 - BLOCK
      ?auto_738107 - BLOCK
    )
    :vars
    (
      ?auto_738108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738107 ?auto_738108 ) ( ON-TABLE ?auto_738092 ) ( ON ?auto_738093 ?auto_738092 ) ( ON ?auto_738094 ?auto_738093 ) ( ON ?auto_738095 ?auto_738094 ) ( ON ?auto_738096 ?auto_738095 ) ( not ( = ?auto_738092 ?auto_738093 ) ) ( not ( = ?auto_738092 ?auto_738094 ) ) ( not ( = ?auto_738092 ?auto_738095 ) ) ( not ( = ?auto_738092 ?auto_738096 ) ) ( not ( = ?auto_738092 ?auto_738097 ) ) ( not ( = ?auto_738092 ?auto_738098 ) ) ( not ( = ?auto_738092 ?auto_738099 ) ) ( not ( = ?auto_738092 ?auto_738100 ) ) ( not ( = ?auto_738092 ?auto_738101 ) ) ( not ( = ?auto_738092 ?auto_738102 ) ) ( not ( = ?auto_738092 ?auto_738103 ) ) ( not ( = ?auto_738092 ?auto_738104 ) ) ( not ( = ?auto_738092 ?auto_738105 ) ) ( not ( = ?auto_738092 ?auto_738106 ) ) ( not ( = ?auto_738092 ?auto_738107 ) ) ( not ( = ?auto_738092 ?auto_738108 ) ) ( not ( = ?auto_738093 ?auto_738094 ) ) ( not ( = ?auto_738093 ?auto_738095 ) ) ( not ( = ?auto_738093 ?auto_738096 ) ) ( not ( = ?auto_738093 ?auto_738097 ) ) ( not ( = ?auto_738093 ?auto_738098 ) ) ( not ( = ?auto_738093 ?auto_738099 ) ) ( not ( = ?auto_738093 ?auto_738100 ) ) ( not ( = ?auto_738093 ?auto_738101 ) ) ( not ( = ?auto_738093 ?auto_738102 ) ) ( not ( = ?auto_738093 ?auto_738103 ) ) ( not ( = ?auto_738093 ?auto_738104 ) ) ( not ( = ?auto_738093 ?auto_738105 ) ) ( not ( = ?auto_738093 ?auto_738106 ) ) ( not ( = ?auto_738093 ?auto_738107 ) ) ( not ( = ?auto_738093 ?auto_738108 ) ) ( not ( = ?auto_738094 ?auto_738095 ) ) ( not ( = ?auto_738094 ?auto_738096 ) ) ( not ( = ?auto_738094 ?auto_738097 ) ) ( not ( = ?auto_738094 ?auto_738098 ) ) ( not ( = ?auto_738094 ?auto_738099 ) ) ( not ( = ?auto_738094 ?auto_738100 ) ) ( not ( = ?auto_738094 ?auto_738101 ) ) ( not ( = ?auto_738094 ?auto_738102 ) ) ( not ( = ?auto_738094 ?auto_738103 ) ) ( not ( = ?auto_738094 ?auto_738104 ) ) ( not ( = ?auto_738094 ?auto_738105 ) ) ( not ( = ?auto_738094 ?auto_738106 ) ) ( not ( = ?auto_738094 ?auto_738107 ) ) ( not ( = ?auto_738094 ?auto_738108 ) ) ( not ( = ?auto_738095 ?auto_738096 ) ) ( not ( = ?auto_738095 ?auto_738097 ) ) ( not ( = ?auto_738095 ?auto_738098 ) ) ( not ( = ?auto_738095 ?auto_738099 ) ) ( not ( = ?auto_738095 ?auto_738100 ) ) ( not ( = ?auto_738095 ?auto_738101 ) ) ( not ( = ?auto_738095 ?auto_738102 ) ) ( not ( = ?auto_738095 ?auto_738103 ) ) ( not ( = ?auto_738095 ?auto_738104 ) ) ( not ( = ?auto_738095 ?auto_738105 ) ) ( not ( = ?auto_738095 ?auto_738106 ) ) ( not ( = ?auto_738095 ?auto_738107 ) ) ( not ( = ?auto_738095 ?auto_738108 ) ) ( not ( = ?auto_738096 ?auto_738097 ) ) ( not ( = ?auto_738096 ?auto_738098 ) ) ( not ( = ?auto_738096 ?auto_738099 ) ) ( not ( = ?auto_738096 ?auto_738100 ) ) ( not ( = ?auto_738096 ?auto_738101 ) ) ( not ( = ?auto_738096 ?auto_738102 ) ) ( not ( = ?auto_738096 ?auto_738103 ) ) ( not ( = ?auto_738096 ?auto_738104 ) ) ( not ( = ?auto_738096 ?auto_738105 ) ) ( not ( = ?auto_738096 ?auto_738106 ) ) ( not ( = ?auto_738096 ?auto_738107 ) ) ( not ( = ?auto_738096 ?auto_738108 ) ) ( not ( = ?auto_738097 ?auto_738098 ) ) ( not ( = ?auto_738097 ?auto_738099 ) ) ( not ( = ?auto_738097 ?auto_738100 ) ) ( not ( = ?auto_738097 ?auto_738101 ) ) ( not ( = ?auto_738097 ?auto_738102 ) ) ( not ( = ?auto_738097 ?auto_738103 ) ) ( not ( = ?auto_738097 ?auto_738104 ) ) ( not ( = ?auto_738097 ?auto_738105 ) ) ( not ( = ?auto_738097 ?auto_738106 ) ) ( not ( = ?auto_738097 ?auto_738107 ) ) ( not ( = ?auto_738097 ?auto_738108 ) ) ( not ( = ?auto_738098 ?auto_738099 ) ) ( not ( = ?auto_738098 ?auto_738100 ) ) ( not ( = ?auto_738098 ?auto_738101 ) ) ( not ( = ?auto_738098 ?auto_738102 ) ) ( not ( = ?auto_738098 ?auto_738103 ) ) ( not ( = ?auto_738098 ?auto_738104 ) ) ( not ( = ?auto_738098 ?auto_738105 ) ) ( not ( = ?auto_738098 ?auto_738106 ) ) ( not ( = ?auto_738098 ?auto_738107 ) ) ( not ( = ?auto_738098 ?auto_738108 ) ) ( not ( = ?auto_738099 ?auto_738100 ) ) ( not ( = ?auto_738099 ?auto_738101 ) ) ( not ( = ?auto_738099 ?auto_738102 ) ) ( not ( = ?auto_738099 ?auto_738103 ) ) ( not ( = ?auto_738099 ?auto_738104 ) ) ( not ( = ?auto_738099 ?auto_738105 ) ) ( not ( = ?auto_738099 ?auto_738106 ) ) ( not ( = ?auto_738099 ?auto_738107 ) ) ( not ( = ?auto_738099 ?auto_738108 ) ) ( not ( = ?auto_738100 ?auto_738101 ) ) ( not ( = ?auto_738100 ?auto_738102 ) ) ( not ( = ?auto_738100 ?auto_738103 ) ) ( not ( = ?auto_738100 ?auto_738104 ) ) ( not ( = ?auto_738100 ?auto_738105 ) ) ( not ( = ?auto_738100 ?auto_738106 ) ) ( not ( = ?auto_738100 ?auto_738107 ) ) ( not ( = ?auto_738100 ?auto_738108 ) ) ( not ( = ?auto_738101 ?auto_738102 ) ) ( not ( = ?auto_738101 ?auto_738103 ) ) ( not ( = ?auto_738101 ?auto_738104 ) ) ( not ( = ?auto_738101 ?auto_738105 ) ) ( not ( = ?auto_738101 ?auto_738106 ) ) ( not ( = ?auto_738101 ?auto_738107 ) ) ( not ( = ?auto_738101 ?auto_738108 ) ) ( not ( = ?auto_738102 ?auto_738103 ) ) ( not ( = ?auto_738102 ?auto_738104 ) ) ( not ( = ?auto_738102 ?auto_738105 ) ) ( not ( = ?auto_738102 ?auto_738106 ) ) ( not ( = ?auto_738102 ?auto_738107 ) ) ( not ( = ?auto_738102 ?auto_738108 ) ) ( not ( = ?auto_738103 ?auto_738104 ) ) ( not ( = ?auto_738103 ?auto_738105 ) ) ( not ( = ?auto_738103 ?auto_738106 ) ) ( not ( = ?auto_738103 ?auto_738107 ) ) ( not ( = ?auto_738103 ?auto_738108 ) ) ( not ( = ?auto_738104 ?auto_738105 ) ) ( not ( = ?auto_738104 ?auto_738106 ) ) ( not ( = ?auto_738104 ?auto_738107 ) ) ( not ( = ?auto_738104 ?auto_738108 ) ) ( not ( = ?auto_738105 ?auto_738106 ) ) ( not ( = ?auto_738105 ?auto_738107 ) ) ( not ( = ?auto_738105 ?auto_738108 ) ) ( not ( = ?auto_738106 ?auto_738107 ) ) ( not ( = ?auto_738106 ?auto_738108 ) ) ( not ( = ?auto_738107 ?auto_738108 ) ) ( ON ?auto_738106 ?auto_738107 ) ( ON ?auto_738105 ?auto_738106 ) ( ON ?auto_738104 ?auto_738105 ) ( ON ?auto_738103 ?auto_738104 ) ( ON ?auto_738102 ?auto_738103 ) ( ON ?auto_738101 ?auto_738102 ) ( ON ?auto_738100 ?auto_738101 ) ( ON ?auto_738099 ?auto_738100 ) ( ON ?auto_738098 ?auto_738099 ) ( CLEAR ?auto_738096 ) ( ON ?auto_738097 ?auto_738098 ) ( CLEAR ?auto_738097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_738092 ?auto_738093 ?auto_738094 ?auto_738095 ?auto_738096 ?auto_738097 )
      ( MAKE-16PILE ?auto_738092 ?auto_738093 ?auto_738094 ?auto_738095 ?auto_738096 ?auto_738097 ?auto_738098 ?auto_738099 ?auto_738100 ?auto_738101 ?auto_738102 ?auto_738103 ?auto_738104 ?auto_738105 ?auto_738106 ?auto_738107 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738158 - BLOCK
      ?auto_738159 - BLOCK
      ?auto_738160 - BLOCK
      ?auto_738161 - BLOCK
      ?auto_738162 - BLOCK
      ?auto_738163 - BLOCK
      ?auto_738164 - BLOCK
      ?auto_738165 - BLOCK
      ?auto_738166 - BLOCK
      ?auto_738167 - BLOCK
      ?auto_738168 - BLOCK
      ?auto_738169 - BLOCK
      ?auto_738170 - BLOCK
      ?auto_738171 - BLOCK
      ?auto_738172 - BLOCK
      ?auto_738173 - BLOCK
    )
    :vars
    (
      ?auto_738174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738173 ?auto_738174 ) ( ON-TABLE ?auto_738158 ) ( ON ?auto_738159 ?auto_738158 ) ( ON ?auto_738160 ?auto_738159 ) ( ON ?auto_738161 ?auto_738160 ) ( not ( = ?auto_738158 ?auto_738159 ) ) ( not ( = ?auto_738158 ?auto_738160 ) ) ( not ( = ?auto_738158 ?auto_738161 ) ) ( not ( = ?auto_738158 ?auto_738162 ) ) ( not ( = ?auto_738158 ?auto_738163 ) ) ( not ( = ?auto_738158 ?auto_738164 ) ) ( not ( = ?auto_738158 ?auto_738165 ) ) ( not ( = ?auto_738158 ?auto_738166 ) ) ( not ( = ?auto_738158 ?auto_738167 ) ) ( not ( = ?auto_738158 ?auto_738168 ) ) ( not ( = ?auto_738158 ?auto_738169 ) ) ( not ( = ?auto_738158 ?auto_738170 ) ) ( not ( = ?auto_738158 ?auto_738171 ) ) ( not ( = ?auto_738158 ?auto_738172 ) ) ( not ( = ?auto_738158 ?auto_738173 ) ) ( not ( = ?auto_738158 ?auto_738174 ) ) ( not ( = ?auto_738159 ?auto_738160 ) ) ( not ( = ?auto_738159 ?auto_738161 ) ) ( not ( = ?auto_738159 ?auto_738162 ) ) ( not ( = ?auto_738159 ?auto_738163 ) ) ( not ( = ?auto_738159 ?auto_738164 ) ) ( not ( = ?auto_738159 ?auto_738165 ) ) ( not ( = ?auto_738159 ?auto_738166 ) ) ( not ( = ?auto_738159 ?auto_738167 ) ) ( not ( = ?auto_738159 ?auto_738168 ) ) ( not ( = ?auto_738159 ?auto_738169 ) ) ( not ( = ?auto_738159 ?auto_738170 ) ) ( not ( = ?auto_738159 ?auto_738171 ) ) ( not ( = ?auto_738159 ?auto_738172 ) ) ( not ( = ?auto_738159 ?auto_738173 ) ) ( not ( = ?auto_738159 ?auto_738174 ) ) ( not ( = ?auto_738160 ?auto_738161 ) ) ( not ( = ?auto_738160 ?auto_738162 ) ) ( not ( = ?auto_738160 ?auto_738163 ) ) ( not ( = ?auto_738160 ?auto_738164 ) ) ( not ( = ?auto_738160 ?auto_738165 ) ) ( not ( = ?auto_738160 ?auto_738166 ) ) ( not ( = ?auto_738160 ?auto_738167 ) ) ( not ( = ?auto_738160 ?auto_738168 ) ) ( not ( = ?auto_738160 ?auto_738169 ) ) ( not ( = ?auto_738160 ?auto_738170 ) ) ( not ( = ?auto_738160 ?auto_738171 ) ) ( not ( = ?auto_738160 ?auto_738172 ) ) ( not ( = ?auto_738160 ?auto_738173 ) ) ( not ( = ?auto_738160 ?auto_738174 ) ) ( not ( = ?auto_738161 ?auto_738162 ) ) ( not ( = ?auto_738161 ?auto_738163 ) ) ( not ( = ?auto_738161 ?auto_738164 ) ) ( not ( = ?auto_738161 ?auto_738165 ) ) ( not ( = ?auto_738161 ?auto_738166 ) ) ( not ( = ?auto_738161 ?auto_738167 ) ) ( not ( = ?auto_738161 ?auto_738168 ) ) ( not ( = ?auto_738161 ?auto_738169 ) ) ( not ( = ?auto_738161 ?auto_738170 ) ) ( not ( = ?auto_738161 ?auto_738171 ) ) ( not ( = ?auto_738161 ?auto_738172 ) ) ( not ( = ?auto_738161 ?auto_738173 ) ) ( not ( = ?auto_738161 ?auto_738174 ) ) ( not ( = ?auto_738162 ?auto_738163 ) ) ( not ( = ?auto_738162 ?auto_738164 ) ) ( not ( = ?auto_738162 ?auto_738165 ) ) ( not ( = ?auto_738162 ?auto_738166 ) ) ( not ( = ?auto_738162 ?auto_738167 ) ) ( not ( = ?auto_738162 ?auto_738168 ) ) ( not ( = ?auto_738162 ?auto_738169 ) ) ( not ( = ?auto_738162 ?auto_738170 ) ) ( not ( = ?auto_738162 ?auto_738171 ) ) ( not ( = ?auto_738162 ?auto_738172 ) ) ( not ( = ?auto_738162 ?auto_738173 ) ) ( not ( = ?auto_738162 ?auto_738174 ) ) ( not ( = ?auto_738163 ?auto_738164 ) ) ( not ( = ?auto_738163 ?auto_738165 ) ) ( not ( = ?auto_738163 ?auto_738166 ) ) ( not ( = ?auto_738163 ?auto_738167 ) ) ( not ( = ?auto_738163 ?auto_738168 ) ) ( not ( = ?auto_738163 ?auto_738169 ) ) ( not ( = ?auto_738163 ?auto_738170 ) ) ( not ( = ?auto_738163 ?auto_738171 ) ) ( not ( = ?auto_738163 ?auto_738172 ) ) ( not ( = ?auto_738163 ?auto_738173 ) ) ( not ( = ?auto_738163 ?auto_738174 ) ) ( not ( = ?auto_738164 ?auto_738165 ) ) ( not ( = ?auto_738164 ?auto_738166 ) ) ( not ( = ?auto_738164 ?auto_738167 ) ) ( not ( = ?auto_738164 ?auto_738168 ) ) ( not ( = ?auto_738164 ?auto_738169 ) ) ( not ( = ?auto_738164 ?auto_738170 ) ) ( not ( = ?auto_738164 ?auto_738171 ) ) ( not ( = ?auto_738164 ?auto_738172 ) ) ( not ( = ?auto_738164 ?auto_738173 ) ) ( not ( = ?auto_738164 ?auto_738174 ) ) ( not ( = ?auto_738165 ?auto_738166 ) ) ( not ( = ?auto_738165 ?auto_738167 ) ) ( not ( = ?auto_738165 ?auto_738168 ) ) ( not ( = ?auto_738165 ?auto_738169 ) ) ( not ( = ?auto_738165 ?auto_738170 ) ) ( not ( = ?auto_738165 ?auto_738171 ) ) ( not ( = ?auto_738165 ?auto_738172 ) ) ( not ( = ?auto_738165 ?auto_738173 ) ) ( not ( = ?auto_738165 ?auto_738174 ) ) ( not ( = ?auto_738166 ?auto_738167 ) ) ( not ( = ?auto_738166 ?auto_738168 ) ) ( not ( = ?auto_738166 ?auto_738169 ) ) ( not ( = ?auto_738166 ?auto_738170 ) ) ( not ( = ?auto_738166 ?auto_738171 ) ) ( not ( = ?auto_738166 ?auto_738172 ) ) ( not ( = ?auto_738166 ?auto_738173 ) ) ( not ( = ?auto_738166 ?auto_738174 ) ) ( not ( = ?auto_738167 ?auto_738168 ) ) ( not ( = ?auto_738167 ?auto_738169 ) ) ( not ( = ?auto_738167 ?auto_738170 ) ) ( not ( = ?auto_738167 ?auto_738171 ) ) ( not ( = ?auto_738167 ?auto_738172 ) ) ( not ( = ?auto_738167 ?auto_738173 ) ) ( not ( = ?auto_738167 ?auto_738174 ) ) ( not ( = ?auto_738168 ?auto_738169 ) ) ( not ( = ?auto_738168 ?auto_738170 ) ) ( not ( = ?auto_738168 ?auto_738171 ) ) ( not ( = ?auto_738168 ?auto_738172 ) ) ( not ( = ?auto_738168 ?auto_738173 ) ) ( not ( = ?auto_738168 ?auto_738174 ) ) ( not ( = ?auto_738169 ?auto_738170 ) ) ( not ( = ?auto_738169 ?auto_738171 ) ) ( not ( = ?auto_738169 ?auto_738172 ) ) ( not ( = ?auto_738169 ?auto_738173 ) ) ( not ( = ?auto_738169 ?auto_738174 ) ) ( not ( = ?auto_738170 ?auto_738171 ) ) ( not ( = ?auto_738170 ?auto_738172 ) ) ( not ( = ?auto_738170 ?auto_738173 ) ) ( not ( = ?auto_738170 ?auto_738174 ) ) ( not ( = ?auto_738171 ?auto_738172 ) ) ( not ( = ?auto_738171 ?auto_738173 ) ) ( not ( = ?auto_738171 ?auto_738174 ) ) ( not ( = ?auto_738172 ?auto_738173 ) ) ( not ( = ?auto_738172 ?auto_738174 ) ) ( not ( = ?auto_738173 ?auto_738174 ) ) ( ON ?auto_738172 ?auto_738173 ) ( ON ?auto_738171 ?auto_738172 ) ( ON ?auto_738170 ?auto_738171 ) ( ON ?auto_738169 ?auto_738170 ) ( ON ?auto_738168 ?auto_738169 ) ( ON ?auto_738167 ?auto_738168 ) ( ON ?auto_738166 ?auto_738167 ) ( ON ?auto_738165 ?auto_738166 ) ( ON ?auto_738164 ?auto_738165 ) ( ON ?auto_738163 ?auto_738164 ) ( CLEAR ?auto_738161 ) ( ON ?auto_738162 ?auto_738163 ) ( CLEAR ?auto_738162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_738158 ?auto_738159 ?auto_738160 ?auto_738161 ?auto_738162 )
      ( MAKE-16PILE ?auto_738158 ?auto_738159 ?auto_738160 ?auto_738161 ?auto_738162 ?auto_738163 ?auto_738164 ?auto_738165 ?auto_738166 ?auto_738167 ?auto_738168 ?auto_738169 ?auto_738170 ?auto_738171 ?auto_738172 ?auto_738173 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738224 - BLOCK
      ?auto_738225 - BLOCK
      ?auto_738226 - BLOCK
      ?auto_738227 - BLOCK
      ?auto_738228 - BLOCK
      ?auto_738229 - BLOCK
      ?auto_738230 - BLOCK
      ?auto_738231 - BLOCK
      ?auto_738232 - BLOCK
      ?auto_738233 - BLOCK
      ?auto_738234 - BLOCK
      ?auto_738235 - BLOCK
      ?auto_738236 - BLOCK
      ?auto_738237 - BLOCK
      ?auto_738238 - BLOCK
      ?auto_738239 - BLOCK
    )
    :vars
    (
      ?auto_738240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738239 ?auto_738240 ) ( ON-TABLE ?auto_738224 ) ( ON ?auto_738225 ?auto_738224 ) ( ON ?auto_738226 ?auto_738225 ) ( not ( = ?auto_738224 ?auto_738225 ) ) ( not ( = ?auto_738224 ?auto_738226 ) ) ( not ( = ?auto_738224 ?auto_738227 ) ) ( not ( = ?auto_738224 ?auto_738228 ) ) ( not ( = ?auto_738224 ?auto_738229 ) ) ( not ( = ?auto_738224 ?auto_738230 ) ) ( not ( = ?auto_738224 ?auto_738231 ) ) ( not ( = ?auto_738224 ?auto_738232 ) ) ( not ( = ?auto_738224 ?auto_738233 ) ) ( not ( = ?auto_738224 ?auto_738234 ) ) ( not ( = ?auto_738224 ?auto_738235 ) ) ( not ( = ?auto_738224 ?auto_738236 ) ) ( not ( = ?auto_738224 ?auto_738237 ) ) ( not ( = ?auto_738224 ?auto_738238 ) ) ( not ( = ?auto_738224 ?auto_738239 ) ) ( not ( = ?auto_738224 ?auto_738240 ) ) ( not ( = ?auto_738225 ?auto_738226 ) ) ( not ( = ?auto_738225 ?auto_738227 ) ) ( not ( = ?auto_738225 ?auto_738228 ) ) ( not ( = ?auto_738225 ?auto_738229 ) ) ( not ( = ?auto_738225 ?auto_738230 ) ) ( not ( = ?auto_738225 ?auto_738231 ) ) ( not ( = ?auto_738225 ?auto_738232 ) ) ( not ( = ?auto_738225 ?auto_738233 ) ) ( not ( = ?auto_738225 ?auto_738234 ) ) ( not ( = ?auto_738225 ?auto_738235 ) ) ( not ( = ?auto_738225 ?auto_738236 ) ) ( not ( = ?auto_738225 ?auto_738237 ) ) ( not ( = ?auto_738225 ?auto_738238 ) ) ( not ( = ?auto_738225 ?auto_738239 ) ) ( not ( = ?auto_738225 ?auto_738240 ) ) ( not ( = ?auto_738226 ?auto_738227 ) ) ( not ( = ?auto_738226 ?auto_738228 ) ) ( not ( = ?auto_738226 ?auto_738229 ) ) ( not ( = ?auto_738226 ?auto_738230 ) ) ( not ( = ?auto_738226 ?auto_738231 ) ) ( not ( = ?auto_738226 ?auto_738232 ) ) ( not ( = ?auto_738226 ?auto_738233 ) ) ( not ( = ?auto_738226 ?auto_738234 ) ) ( not ( = ?auto_738226 ?auto_738235 ) ) ( not ( = ?auto_738226 ?auto_738236 ) ) ( not ( = ?auto_738226 ?auto_738237 ) ) ( not ( = ?auto_738226 ?auto_738238 ) ) ( not ( = ?auto_738226 ?auto_738239 ) ) ( not ( = ?auto_738226 ?auto_738240 ) ) ( not ( = ?auto_738227 ?auto_738228 ) ) ( not ( = ?auto_738227 ?auto_738229 ) ) ( not ( = ?auto_738227 ?auto_738230 ) ) ( not ( = ?auto_738227 ?auto_738231 ) ) ( not ( = ?auto_738227 ?auto_738232 ) ) ( not ( = ?auto_738227 ?auto_738233 ) ) ( not ( = ?auto_738227 ?auto_738234 ) ) ( not ( = ?auto_738227 ?auto_738235 ) ) ( not ( = ?auto_738227 ?auto_738236 ) ) ( not ( = ?auto_738227 ?auto_738237 ) ) ( not ( = ?auto_738227 ?auto_738238 ) ) ( not ( = ?auto_738227 ?auto_738239 ) ) ( not ( = ?auto_738227 ?auto_738240 ) ) ( not ( = ?auto_738228 ?auto_738229 ) ) ( not ( = ?auto_738228 ?auto_738230 ) ) ( not ( = ?auto_738228 ?auto_738231 ) ) ( not ( = ?auto_738228 ?auto_738232 ) ) ( not ( = ?auto_738228 ?auto_738233 ) ) ( not ( = ?auto_738228 ?auto_738234 ) ) ( not ( = ?auto_738228 ?auto_738235 ) ) ( not ( = ?auto_738228 ?auto_738236 ) ) ( not ( = ?auto_738228 ?auto_738237 ) ) ( not ( = ?auto_738228 ?auto_738238 ) ) ( not ( = ?auto_738228 ?auto_738239 ) ) ( not ( = ?auto_738228 ?auto_738240 ) ) ( not ( = ?auto_738229 ?auto_738230 ) ) ( not ( = ?auto_738229 ?auto_738231 ) ) ( not ( = ?auto_738229 ?auto_738232 ) ) ( not ( = ?auto_738229 ?auto_738233 ) ) ( not ( = ?auto_738229 ?auto_738234 ) ) ( not ( = ?auto_738229 ?auto_738235 ) ) ( not ( = ?auto_738229 ?auto_738236 ) ) ( not ( = ?auto_738229 ?auto_738237 ) ) ( not ( = ?auto_738229 ?auto_738238 ) ) ( not ( = ?auto_738229 ?auto_738239 ) ) ( not ( = ?auto_738229 ?auto_738240 ) ) ( not ( = ?auto_738230 ?auto_738231 ) ) ( not ( = ?auto_738230 ?auto_738232 ) ) ( not ( = ?auto_738230 ?auto_738233 ) ) ( not ( = ?auto_738230 ?auto_738234 ) ) ( not ( = ?auto_738230 ?auto_738235 ) ) ( not ( = ?auto_738230 ?auto_738236 ) ) ( not ( = ?auto_738230 ?auto_738237 ) ) ( not ( = ?auto_738230 ?auto_738238 ) ) ( not ( = ?auto_738230 ?auto_738239 ) ) ( not ( = ?auto_738230 ?auto_738240 ) ) ( not ( = ?auto_738231 ?auto_738232 ) ) ( not ( = ?auto_738231 ?auto_738233 ) ) ( not ( = ?auto_738231 ?auto_738234 ) ) ( not ( = ?auto_738231 ?auto_738235 ) ) ( not ( = ?auto_738231 ?auto_738236 ) ) ( not ( = ?auto_738231 ?auto_738237 ) ) ( not ( = ?auto_738231 ?auto_738238 ) ) ( not ( = ?auto_738231 ?auto_738239 ) ) ( not ( = ?auto_738231 ?auto_738240 ) ) ( not ( = ?auto_738232 ?auto_738233 ) ) ( not ( = ?auto_738232 ?auto_738234 ) ) ( not ( = ?auto_738232 ?auto_738235 ) ) ( not ( = ?auto_738232 ?auto_738236 ) ) ( not ( = ?auto_738232 ?auto_738237 ) ) ( not ( = ?auto_738232 ?auto_738238 ) ) ( not ( = ?auto_738232 ?auto_738239 ) ) ( not ( = ?auto_738232 ?auto_738240 ) ) ( not ( = ?auto_738233 ?auto_738234 ) ) ( not ( = ?auto_738233 ?auto_738235 ) ) ( not ( = ?auto_738233 ?auto_738236 ) ) ( not ( = ?auto_738233 ?auto_738237 ) ) ( not ( = ?auto_738233 ?auto_738238 ) ) ( not ( = ?auto_738233 ?auto_738239 ) ) ( not ( = ?auto_738233 ?auto_738240 ) ) ( not ( = ?auto_738234 ?auto_738235 ) ) ( not ( = ?auto_738234 ?auto_738236 ) ) ( not ( = ?auto_738234 ?auto_738237 ) ) ( not ( = ?auto_738234 ?auto_738238 ) ) ( not ( = ?auto_738234 ?auto_738239 ) ) ( not ( = ?auto_738234 ?auto_738240 ) ) ( not ( = ?auto_738235 ?auto_738236 ) ) ( not ( = ?auto_738235 ?auto_738237 ) ) ( not ( = ?auto_738235 ?auto_738238 ) ) ( not ( = ?auto_738235 ?auto_738239 ) ) ( not ( = ?auto_738235 ?auto_738240 ) ) ( not ( = ?auto_738236 ?auto_738237 ) ) ( not ( = ?auto_738236 ?auto_738238 ) ) ( not ( = ?auto_738236 ?auto_738239 ) ) ( not ( = ?auto_738236 ?auto_738240 ) ) ( not ( = ?auto_738237 ?auto_738238 ) ) ( not ( = ?auto_738237 ?auto_738239 ) ) ( not ( = ?auto_738237 ?auto_738240 ) ) ( not ( = ?auto_738238 ?auto_738239 ) ) ( not ( = ?auto_738238 ?auto_738240 ) ) ( not ( = ?auto_738239 ?auto_738240 ) ) ( ON ?auto_738238 ?auto_738239 ) ( ON ?auto_738237 ?auto_738238 ) ( ON ?auto_738236 ?auto_738237 ) ( ON ?auto_738235 ?auto_738236 ) ( ON ?auto_738234 ?auto_738235 ) ( ON ?auto_738233 ?auto_738234 ) ( ON ?auto_738232 ?auto_738233 ) ( ON ?auto_738231 ?auto_738232 ) ( ON ?auto_738230 ?auto_738231 ) ( ON ?auto_738229 ?auto_738230 ) ( ON ?auto_738228 ?auto_738229 ) ( CLEAR ?auto_738226 ) ( ON ?auto_738227 ?auto_738228 ) ( CLEAR ?auto_738227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_738224 ?auto_738225 ?auto_738226 ?auto_738227 )
      ( MAKE-16PILE ?auto_738224 ?auto_738225 ?auto_738226 ?auto_738227 ?auto_738228 ?auto_738229 ?auto_738230 ?auto_738231 ?auto_738232 ?auto_738233 ?auto_738234 ?auto_738235 ?auto_738236 ?auto_738237 ?auto_738238 ?auto_738239 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738290 - BLOCK
      ?auto_738291 - BLOCK
      ?auto_738292 - BLOCK
      ?auto_738293 - BLOCK
      ?auto_738294 - BLOCK
      ?auto_738295 - BLOCK
      ?auto_738296 - BLOCK
      ?auto_738297 - BLOCK
      ?auto_738298 - BLOCK
      ?auto_738299 - BLOCK
      ?auto_738300 - BLOCK
      ?auto_738301 - BLOCK
      ?auto_738302 - BLOCK
      ?auto_738303 - BLOCK
      ?auto_738304 - BLOCK
      ?auto_738305 - BLOCK
    )
    :vars
    (
      ?auto_738306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738305 ?auto_738306 ) ( ON-TABLE ?auto_738290 ) ( ON ?auto_738291 ?auto_738290 ) ( not ( = ?auto_738290 ?auto_738291 ) ) ( not ( = ?auto_738290 ?auto_738292 ) ) ( not ( = ?auto_738290 ?auto_738293 ) ) ( not ( = ?auto_738290 ?auto_738294 ) ) ( not ( = ?auto_738290 ?auto_738295 ) ) ( not ( = ?auto_738290 ?auto_738296 ) ) ( not ( = ?auto_738290 ?auto_738297 ) ) ( not ( = ?auto_738290 ?auto_738298 ) ) ( not ( = ?auto_738290 ?auto_738299 ) ) ( not ( = ?auto_738290 ?auto_738300 ) ) ( not ( = ?auto_738290 ?auto_738301 ) ) ( not ( = ?auto_738290 ?auto_738302 ) ) ( not ( = ?auto_738290 ?auto_738303 ) ) ( not ( = ?auto_738290 ?auto_738304 ) ) ( not ( = ?auto_738290 ?auto_738305 ) ) ( not ( = ?auto_738290 ?auto_738306 ) ) ( not ( = ?auto_738291 ?auto_738292 ) ) ( not ( = ?auto_738291 ?auto_738293 ) ) ( not ( = ?auto_738291 ?auto_738294 ) ) ( not ( = ?auto_738291 ?auto_738295 ) ) ( not ( = ?auto_738291 ?auto_738296 ) ) ( not ( = ?auto_738291 ?auto_738297 ) ) ( not ( = ?auto_738291 ?auto_738298 ) ) ( not ( = ?auto_738291 ?auto_738299 ) ) ( not ( = ?auto_738291 ?auto_738300 ) ) ( not ( = ?auto_738291 ?auto_738301 ) ) ( not ( = ?auto_738291 ?auto_738302 ) ) ( not ( = ?auto_738291 ?auto_738303 ) ) ( not ( = ?auto_738291 ?auto_738304 ) ) ( not ( = ?auto_738291 ?auto_738305 ) ) ( not ( = ?auto_738291 ?auto_738306 ) ) ( not ( = ?auto_738292 ?auto_738293 ) ) ( not ( = ?auto_738292 ?auto_738294 ) ) ( not ( = ?auto_738292 ?auto_738295 ) ) ( not ( = ?auto_738292 ?auto_738296 ) ) ( not ( = ?auto_738292 ?auto_738297 ) ) ( not ( = ?auto_738292 ?auto_738298 ) ) ( not ( = ?auto_738292 ?auto_738299 ) ) ( not ( = ?auto_738292 ?auto_738300 ) ) ( not ( = ?auto_738292 ?auto_738301 ) ) ( not ( = ?auto_738292 ?auto_738302 ) ) ( not ( = ?auto_738292 ?auto_738303 ) ) ( not ( = ?auto_738292 ?auto_738304 ) ) ( not ( = ?auto_738292 ?auto_738305 ) ) ( not ( = ?auto_738292 ?auto_738306 ) ) ( not ( = ?auto_738293 ?auto_738294 ) ) ( not ( = ?auto_738293 ?auto_738295 ) ) ( not ( = ?auto_738293 ?auto_738296 ) ) ( not ( = ?auto_738293 ?auto_738297 ) ) ( not ( = ?auto_738293 ?auto_738298 ) ) ( not ( = ?auto_738293 ?auto_738299 ) ) ( not ( = ?auto_738293 ?auto_738300 ) ) ( not ( = ?auto_738293 ?auto_738301 ) ) ( not ( = ?auto_738293 ?auto_738302 ) ) ( not ( = ?auto_738293 ?auto_738303 ) ) ( not ( = ?auto_738293 ?auto_738304 ) ) ( not ( = ?auto_738293 ?auto_738305 ) ) ( not ( = ?auto_738293 ?auto_738306 ) ) ( not ( = ?auto_738294 ?auto_738295 ) ) ( not ( = ?auto_738294 ?auto_738296 ) ) ( not ( = ?auto_738294 ?auto_738297 ) ) ( not ( = ?auto_738294 ?auto_738298 ) ) ( not ( = ?auto_738294 ?auto_738299 ) ) ( not ( = ?auto_738294 ?auto_738300 ) ) ( not ( = ?auto_738294 ?auto_738301 ) ) ( not ( = ?auto_738294 ?auto_738302 ) ) ( not ( = ?auto_738294 ?auto_738303 ) ) ( not ( = ?auto_738294 ?auto_738304 ) ) ( not ( = ?auto_738294 ?auto_738305 ) ) ( not ( = ?auto_738294 ?auto_738306 ) ) ( not ( = ?auto_738295 ?auto_738296 ) ) ( not ( = ?auto_738295 ?auto_738297 ) ) ( not ( = ?auto_738295 ?auto_738298 ) ) ( not ( = ?auto_738295 ?auto_738299 ) ) ( not ( = ?auto_738295 ?auto_738300 ) ) ( not ( = ?auto_738295 ?auto_738301 ) ) ( not ( = ?auto_738295 ?auto_738302 ) ) ( not ( = ?auto_738295 ?auto_738303 ) ) ( not ( = ?auto_738295 ?auto_738304 ) ) ( not ( = ?auto_738295 ?auto_738305 ) ) ( not ( = ?auto_738295 ?auto_738306 ) ) ( not ( = ?auto_738296 ?auto_738297 ) ) ( not ( = ?auto_738296 ?auto_738298 ) ) ( not ( = ?auto_738296 ?auto_738299 ) ) ( not ( = ?auto_738296 ?auto_738300 ) ) ( not ( = ?auto_738296 ?auto_738301 ) ) ( not ( = ?auto_738296 ?auto_738302 ) ) ( not ( = ?auto_738296 ?auto_738303 ) ) ( not ( = ?auto_738296 ?auto_738304 ) ) ( not ( = ?auto_738296 ?auto_738305 ) ) ( not ( = ?auto_738296 ?auto_738306 ) ) ( not ( = ?auto_738297 ?auto_738298 ) ) ( not ( = ?auto_738297 ?auto_738299 ) ) ( not ( = ?auto_738297 ?auto_738300 ) ) ( not ( = ?auto_738297 ?auto_738301 ) ) ( not ( = ?auto_738297 ?auto_738302 ) ) ( not ( = ?auto_738297 ?auto_738303 ) ) ( not ( = ?auto_738297 ?auto_738304 ) ) ( not ( = ?auto_738297 ?auto_738305 ) ) ( not ( = ?auto_738297 ?auto_738306 ) ) ( not ( = ?auto_738298 ?auto_738299 ) ) ( not ( = ?auto_738298 ?auto_738300 ) ) ( not ( = ?auto_738298 ?auto_738301 ) ) ( not ( = ?auto_738298 ?auto_738302 ) ) ( not ( = ?auto_738298 ?auto_738303 ) ) ( not ( = ?auto_738298 ?auto_738304 ) ) ( not ( = ?auto_738298 ?auto_738305 ) ) ( not ( = ?auto_738298 ?auto_738306 ) ) ( not ( = ?auto_738299 ?auto_738300 ) ) ( not ( = ?auto_738299 ?auto_738301 ) ) ( not ( = ?auto_738299 ?auto_738302 ) ) ( not ( = ?auto_738299 ?auto_738303 ) ) ( not ( = ?auto_738299 ?auto_738304 ) ) ( not ( = ?auto_738299 ?auto_738305 ) ) ( not ( = ?auto_738299 ?auto_738306 ) ) ( not ( = ?auto_738300 ?auto_738301 ) ) ( not ( = ?auto_738300 ?auto_738302 ) ) ( not ( = ?auto_738300 ?auto_738303 ) ) ( not ( = ?auto_738300 ?auto_738304 ) ) ( not ( = ?auto_738300 ?auto_738305 ) ) ( not ( = ?auto_738300 ?auto_738306 ) ) ( not ( = ?auto_738301 ?auto_738302 ) ) ( not ( = ?auto_738301 ?auto_738303 ) ) ( not ( = ?auto_738301 ?auto_738304 ) ) ( not ( = ?auto_738301 ?auto_738305 ) ) ( not ( = ?auto_738301 ?auto_738306 ) ) ( not ( = ?auto_738302 ?auto_738303 ) ) ( not ( = ?auto_738302 ?auto_738304 ) ) ( not ( = ?auto_738302 ?auto_738305 ) ) ( not ( = ?auto_738302 ?auto_738306 ) ) ( not ( = ?auto_738303 ?auto_738304 ) ) ( not ( = ?auto_738303 ?auto_738305 ) ) ( not ( = ?auto_738303 ?auto_738306 ) ) ( not ( = ?auto_738304 ?auto_738305 ) ) ( not ( = ?auto_738304 ?auto_738306 ) ) ( not ( = ?auto_738305 ?auto_738306 ) ) ( ON ?auto_738304 ?auto_738305 ) ( ON ?auto_738303 ?auto_738304 ) ( ON ?auto_738302 ?auto_738303 ) ( ON ?auto_738301 ?auto_738302 ) ( ON ?auto_738300 ?auto_738301 ) ( ON ?auto_738299 ?auto_738300 ) ( ON ?auto_738298 ?auto_738299 ) ( ON ?auto_738297 ?auto_738298 ) ( ON ?auto_738296 ?auto_738297 ) ( ON ?auto_738295 ?auto_738296 ) ( ON ?auto_738294 ?auto_738295 ) ( ON ?auto_738293 ?auto_738294 ) ( CLEAR ?auto_738291 ) ( ON ?auto_738292 ?auto_738293 ) ( CLEAR ?auto_738292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_738290 ?auto_738291 ?auto_738292 )
      ( MAKE-16PILE ?auto_738290 ?auto_738291 ?auto_738292 ?auto_738293 ?auto_738294 ?auto_738295 ?auto_738296 ?auto_738297 ?auto_738298 ?auto_738299 ?auto_738300 ?auto_738301 ?auto_738302 ?auto_738303 ?auto_738304 ?auto_738305 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738356 - BLOCK
      ?auto_738357 - BLOCK
      ?auto_738358 - BLOCK
      ?auto_738359 - BLOCK
      ?auto_738360 - BLOCK
      ?auto_738361 - BLOCK
      ?auto_738362 - BLOCK
      ?auto_738363 - BLOCK
      ?auto_738364 - BLOCK
      ?auto_738365 - BLOCK
      ?auto_738366 - BLOCK
      ?auto_738367 - BLOCK
      ?auto_738368 - BLOCK
      ?auto_738369 - BLOCK
      ?auto_738370 - BLOCK
      ?auto_738371 - BLOCK
    )
    :vars
    (
      ?auto_738372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738371 ?auto_738372 ) ( ON-TABLE ?auto_738356 ) ( not ( = ?auto_738356 ?auto_738357 ) ) ( not ( = ?auto_738356 ?auto_738358 ) ) ( not ( = ?auto_738356 ?auto_738359 ) ) ( not ( = ?auto_738356 ?auto_738360 ) ) ( not ( = ?auto_738356 ?auto_738361 ) ) ( not ( = ?auto_738356 ?auto_738362 ) ) ( not ( = ?auto_738356 ?auto_738363 ) ) ( not ( = ?auto_738356 ?auto_738364 ) ) ( not ( = ?auto_738356 ?auto_738365 ) ) ( not ( = ?auto_738356 ?auto_738366 ) ) ( not ( = ?auto_738356 ?auto_738367 ) ) ( not ( = ?auto_738356 ?auto_738368 ) ) ( not ( = ?auto_738356 ?auto_738369 ) ) ( not ( = ?auto_738356 ?auto_738370 ) ) ( not ( = ?auto_738356 ?auto_738371 ) ) ( not ( = ?auto_738356 ?auto_738372 ) ) ( not ( = ?auto_738357 ?auto_738358 ) ) ( not ( = ?auto_738357 ?auto_738359 ) ) ( not ( = ?auto_738357 ?auto_738360 ) ) ( not ( = ?auto_738357 ?auto_738361 ) ) ( not ( = ?auto_738357 ?auto_738362 ) ) ( not ( = ?auto_738357 ?auto_738363 ) ) ( not ( = ?auto_738357 ?auto_738364 ) ) ( not ( = ?auto_738357 ?auto_738365 ) ) ( not ( = ?auto_738357 ?auto_738366 ) ) ( not ( = ?auto_738357 ?auto_738367 ) ) ( not ( = ?auto_738357 ?auto_738368 ) ) ( not ( = ?auto_738357 ?auto_738369 ) ) ( not ( = ?auto_738357 ?auto_738370 ) ) ( not ( = ?auto_738357 ?auto_738371 ) ) ( not ( = ?auto_738357 ?auto_738372 ) ) ( not ( = ?auto_738358 ?auto_738359 ) ) ( not ( = ?auto_738358 ?auto_738360 ) ) ( not ( = ?auto_738358 ?auto_738361 ) ) ( not ( = ?auto_738358 ?auto_738362 ) ) ( not ( = ?auto_738358 ?auto_738363 ) ) ( not ( = ?auto_738358 ?auto_738364 ) ) ( not ( = ?auto_738358 ?auto_738365 ) ) ( not ( = ?auto_738358 ?auto_738366 ) ) ( not ( = ?auto_738358 ?auto_738367 ) ) ( not ( = ?auto_738358 ?auto_738368 ) ) ( not ( = ?auto_738358 ?auto_738369 ) ) ( not ( = ?auto_738358 ?auto_738370 ) ) ( not ( = ?auto_738358 ?auto_738371 ) ) ( not ( = ?auto_738358 ?auto_738372 ) ) ( not ( = ?auto_738359 ?auto_738360 ) ) ( not ( = ?auto_738359 ?auto_738361 ) ) ( not ( = ?auto_738359 ?auto_738362 ) ) ( not ( = ?auto_738359 ?auto_738363 ) ) ( not ( = ?auto_738359 ?auto_738364 ) ) ( not ( = ?auto_738359 ?auto_738365 ) ) ( not ( = ?auto_738359 ?auto_738366 ) ) ( not ( = ?auto_738359 ?auto_738367 ) ) ( not ( = ?auto_738359 ?auto_738368 ) ) ( not ( = ?auto_738359 ?auto_738369 ) ) ( not ( = ?auto_738359 ?auto_738370 ) ) ( not ( = ?auto_738359 ?auto_738371 ) ) ( not ( = ?auto_738359 ?auto_738372 ) ) ( not ( = ?auto_738360 ?auto_738361 ) ) ( not ( = ?auto_738360 ?auto_738362 ) ) ( not ( = ?auto_738360 ?auto_738363 ) ) ( not ( = ?auto_738360 ?auto_738364 ) ) ( not ( = ?auto_738360 ?auto_738365 ) ) ( not ( = ?auto_738360 ?auto_738366 ) ) ( not ( = ?auto_738360 ?auto_738367 ) ) ( not ( = ?auto_738360 ?auto_738368 ) ) ( not ( = ?auto_738360 ?auto_738369 ) ) ( not ( = ?auto_738360 ?auto_738370 ) ) ( not ( = ?auto_738360 ?auto_738371 ) ) ( not ( = ?auto_738360 ?auto_738372 ) ) ( not ( = ?auto_738361 ?auto_738362 ) ) ( not ( = ?auto_738361 ?auto_738363 ) ) ( not ( = ?auto_738361 ?auto_738364 ) ) ( not ( = ?auto_738361 ?auto_738365 ) ) ( not ( = ?auto_738361 ?auto_738366 ) ) ( not ( = ?auto_738361 ?auto_738367 ) ) ( not ( = ?auto_738361 ?auto_738368 ) ) ( not ( = ?auto_738361 ?auto_738369 ) ) ( not ( = ?auto_738361 ?auto_738370 ) ) ( not ( = ?auto_738361 ?auto_738371 ) ) ( not ( = ?auto_738361 ?auto_738372 ) ) ( not ( = ?auto_738362 ?auto_738363 ) ) ( not ( = ?auto_738362 ?auto_738364 ) ) ( not ( = ?auto_738362 ?auto_738365 ) ) ( not ( = ?auto_738362 ?auto_738366 ) ) ( not ( = ?auto_738362 ?auto_738367 ) ) ( not ( = ?auto_738362 ?auto_738368 ) ) ( not ( = ?auto_738362 ?auto_738369 ) ) ( not ( = ?auto_738362 ?auto_738370 ) ) ( not ( = ?auto_738362 ?auto_738371 ) ) ( not ( = ?auto_738362 ?auto_738372 ) ) ( not ( = ?auto_738363 ?auto_738364 ) ) ( not ( = ?auto_738363 ?auto_738365 ) ) ( not ( = ?auto_738363 ?auto_738366 ) ) ( not ( = ?auto_738363 ?auto_738367 ) ) ( not ( = ?auto_738363 ?auto_738368 ) ) ( not ( = ?auto_738363 ?auto_738369 ) ) ( not ( = ?auto_738363 ?auto_738370 ) ) ( not ( = ?auto_738363 ?auto_738371 ) ) ( not ( = ?auto_738363 ?auto_738372 ) ) ( not ( = ?auto_738364 ?auto_738365 ) ) ( not ( = ?auto_738364 ?auto_738366 ) ) ( not ( = ?auto_738364 ?auto_738367 ) ) ( not ( = ?auto_738364 ?auto_738368 ) ) ( not ( = ?auto_738364 ?auto_738369 ) ) ( not ( = ?auto_738364 ?auto_738370 ) ) ( not ( = ?auto_738364 ?auto_738371 ) ) ( not ( = ?auto_738364 ?auto_738372 ) ) ( not ( = ?auto_738365 ?auto_738366 ) ) ( not ( = ?auto_738365 ?auto_738367 ) ) ( not ( = ?auto_738365 ?auto_738368 ) ) ( not ( = ?auto_738365 ?auto_738369 ) ) ( not ( = ?auto_738365 ?auto_738370 ) ) ( not ( = ?auto_738365 ?auto_738371 ) ) ( not ( = ?auto_738365 ?auto_738372 ) ) ( not ( = ?auto_738366 ?auto_738367 ) ) ( not ( = ?auto_738366 ?auto_738368 ) ) ( not ( = ?auto_738366 ?auto_738369 ) ) ( not ( = ?auto_738366 ?auto_738370 ) ) ( not ( = ?auto_738366 ?auto_738371 ) ) ( not ( = ?auto_738366 ?auto_738372 ) ) ( not ( = ?auto_738367 ?auto_738368 ) ) ( not ( = ?auto_738367 ?auto_738369 ) ) ( not ( = ?auto_738367 ?auto_738370 ) ) ( not ( = ?auto_738367 ?auto_738371 ) ) ( not ( = ?auto_738367 ?auto_738372 ) ) ( not ( = ?auto_738368 ?auto_738369 ) ) ( not ( = ?auto_738368 ?auto_738370 ) ) ( not ( = ?auto_738368 ?auto_738371 ) ) ( not ( = ?auto_738368 ?auto_738372 ) ) ( not ( = ?auto_738369 ?auto_738370 ) ) ( not ( = ?auto_738369 ?auto_738371 ) ) ( not ( = ?auto_738369 ?auto_738372 ) ) ( not ( = ?auto_738370 ?auto_738371 ) ) ( not ( = ?auto_738370 ?auto_738372 ) ) ( not ( = ?auto_738371 ?auto_738372 ) ) ( ON ?auto_738370 ?auto_738371 ) ( ON ?auto_738369 ?auto_738370 ) ( ON ?auto_738368 ?auto_738369 ) ( ON ?auto_738367 ?auto_738368 ) ( ON ?auto_738366 ?auto_738367 ) ( ON ?auto_738365 ?auto_738366 ) ( ON ?auto_738364 ?auto_738365 ) ( ON ?auto_738363 ?auto_738364 ) ( ON ?auto_738362 ?auto_738363 ) ( ON ?auto_738361 ?auto_738362 ) ( ON ?auto_738360 ?auto_738361 ) ( ON ?auto_738359 ?auto_738360 ) ( ON ?auto_738358 ?auto_738359 ) ( CLEAR ?auto_738356 ) ( ON ?auto_738357 ?auto_738358 ) ( CLEAR ?auto_738357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_738356 ?auto_738357 )
      ( MAKE-16PILE ?auto_738356 ?auto_738357 ?auto_738358 ?auto_738359 ?auto_738360 ?auto_738361 ?auto_738362 ?auto_738363 ?auto_738364 ?auto_738365 ?auto_738366 ?auto_738367 ?auto_738368 ?auto_738369 ?auto_738370 ?auto_738371 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_738422 - BLOCK
      ?auto_738423 - BLOCK
      ?auto_738424 - BLOCK
      ?auto_738425 - BLOCK
      ?auto_738426 - BLOCK
      ?auto_738427 - BLOCK
      ?auto_738428 - BLOCK
      ?auto_738429 - BLOCK
      ?auto_738430 - BLOCK
      ?auto_738431 - BLOCK
      ?auto_738432 - BLOCK
      ?auto_738433 - BLOCK
      ?auto_738434 - BLOCK
      ?auto_738435 - BLOCK
      ?auto_738436 - BLOCK
      ?auto_738437 - BLOCK
    )
    :vars
    (
      ?auto_738438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738437 ?auto_738438 ) ( not ( = ?auto_738422 ?auto_738423 ) ) ( not ( = ?auto_738422 ?auto_738424 ) ) ( not ( = ?auto_738422 ?auto_738425 ) ) ( not ( = ?auto_738422 ?auto_738426 ) ) ( not ( = ?auto_738422 ?auto_738427 ) ) ( not ( = ?auto_738422 ?auto_738428 ) ) ( not ( = ?auto_738422 ?auto_738429 ) ) ( not ( = ?auto_738422 ?auto_738430 ) ) ( not ( = ?auto_738422 ?auto_738431 ) ) ( not ( = ?auto_738422 ?auto_738432 ) ) ( not ( = ?auto_738422 ?auto_738433 ) ) ( not ( = ?auto_738422 ?auto_738434 ) ) ( not ( = ?auto_738422 ?auto_738435 ) ) ( not ( = ?auto_738422 ?auto_738436 ) ) ( not ( = ?auto_738422 ?auto_738437 ) ) ( not ( = ?auto_738422 ?auto_738438 ) ) ( not ( = ?auto_738423 ?auto_738424 ) ) ( not ( = ?auto_738423 ?auto_738425 ) ) ( not ( = ?auto_738423 ?auto_738426 ) ) ( not ( = ?auto_738423 ?auto_738427 ) ) ( not ( = ?auto_738423 ?auto_738428 ) ) ( not ( = ?auto_738423 ?auto_738429 ) ) ( not ( = ?auto_738423 ?auto_738430 ) ) ( not ( = ?auto_738423 ?auto_738431 ) ) ( not ( = ?auto_738423 ?auto_738432 ) ) ( not ( = ?auto_738423 ?auto_738433 ) ) ( not ( = ?auto_738423 ?auto_738434 ) ) ( not ( = ?auto_738423 ?auto_738435 ) ) ( not ( = ?auto_738423 ?auto_738436 ) ) ( not ( = ?auto_738423 ?auto_738437 ) ) ( not ( = ?auto_738423 ?auto_738438 ) ) ( not ( = ?auto_738424 ?auto_738425 ) ) ( not ( = ?auto_738424 ?auto_738426 ) ) ( not ( = ?auto_738424 ?auto_738427 ) ) ( not ( = ?auto_738424 ?auto_738428 ) ) ( not ( = ?auto_738424 ?auto_738429 ) ) ( not ( = ?auto_738424 ?auto_738430 ) ) ( not ( = ?auto_738424 ?auto_738431 ) ) ( not ( = ?auto_738424 ?auto_738432 ) ) ( not ( = ?auto_738424 ?auto_738433 ) ) ( not ( = ?auto_738424 ?auto_738434 ) ) ( not ( = ?auto_738424 ?auto_738435 ) ) ( not ( = ?auto_738424 ?auto_738436 ) ) ( not ( = ?auto_738424 ?auto_738437 ) ) ( not ( = ?auto_738424 ?auto_738438 ) ) ( not ( = ?auto_738425 ?auto_738426 ) ) ( not ( = ?auto_738425 ?auto_738427 ) ) ( not ( = ?auto_738425 ?auto_738428 ) ) ( not ( = ?auto_738425 ?auto_738429 ) ) ( not ( = ?auto_738425 ?auto_738430 ) ) ( not ( = ?auto_738425 ?auto_738431 ) ) ( not ( = ?auto_738425 ?auto_738432 ) ) ( not ( = ?auto_738425 ?auto_738433 ) ) ( not ( = ?auto_738425 ?auto_738434 ) ) ( not ( = ?auto_738425 ?auto_738435 ) ) ( not ( = ?auto_738425 ?auto_738436 ) ) ( not ( = ?auto_738425 ?auto_738437 ) ) ( not ( = ?auto_738425 ?auto_738438 ) ) ( not ( = ?auto_738426 ?auto_738427 ) ) ( not ( = ?auto_738426 ?auto_738428 ) ) ( not ( = ?auto_738426 ?auto_738429 ) ) ( not ( = ?auto_738426 ?auto_738430 ) ) ( not ( = ?auto_738426 ?auto_738431 ) ) ( not ( = ?auto_738426 ?auto_738432 ) ) ( not ( = ?auto_738426 ?auto_738433 ) ) ( not ( = ?auto_738426 ?auto_738434 ) ) ( not ( = ?auto_738426 ?auto_738435 ) ) ( not ( = ?auto_738426 ?auto_738436 ) ) ( not ( = ?auto_738426 ?auto_738437 ) ) ( not ( = ?auto_738426 ?auto_738438 ) ) ( not ( = ?auto_738427 ?auto_738428 ) ) ( not ( = ?auto_738427 ?auto_738429 ) ) ( not ( = ?auto_738427 ?auto_738430 ) ) ( not ( = ?auto_738427 ?auto_738431 ) ) ( not ( = ?auto_738427 ?auto_738432 ) ) ( not ( = ?auto_738427 ?auto_738433 ) ) ( not ( = ?auto_738427 ?auto_738434 ) ) ( not ( = ?auto_738427 ?auto_738435 ) ) ( not ( = ?auto_738427 ?auto_738436 ) ) ( not ( = ?auto_738427 ?auto_738437 ) ) ( not ( = ?auto_738427 ?auto_738438 ) ) ( not ( = ?auto_738428 ?auto_738429 ) ) ( not ( = ?auto_738428 ?auto_738430 ) ) ( not ( = ?auto_738428 ?auto_738431 ) ) ( not ( = ?auto_738428 ?auto_738432 ) ) ( not ( = ?auto_738428 ?auto_738433 ) ) ( not ( = ?auto_738428 ?auto_738434 ) ) ( not ( = ?auto_738428 ?auto_738435 ) ) ( not ( = ?auto_738428 ?auto_738436 ) ) ( not ( = ?auto_738428 ?auto_738437 ) ) ( not ( = ?auto_738428 ?auto_738438 ) ) ( not ( = ?auto_738429 ?auto_738430 ) ) ( not ( = ?auto_738429 ?auto_738431 ) ) ( not ( = ?auto_738429 ?auto_738432 ) ) ( not ( = ?auto_738429 ?auto_738433 ) ) ( not ( = ?auto_738429 ?auto_738434 ) ) ( not ( = ?auto_738429 ?auto_738435 ) ) ( not ( = ?auto_738429 ?auto_738436 ) ) ( not ( = ?auto_738429 ?auto_738437 ) ) ( not ( = ?auto_738429 ?auto_738438 ) ) ( not ( = ?auto_738430 ?auto_738431 ) ) ( not ( = ?auto_738430 ?auto_738432 ) ) ( not ( = ?auto_738430 ?auto_738433 ) ) ( not ( = ?auto_738430 ?auto_738434 ) ) ( not ( = ?auto_738430 ?auto_738435 ) ) ( not ( = ?auto_738430 ?auto_738436 ) ) ( not ( = ?auto_738430 ?auto_738437 ) ) ( not ( = ?auto_738430 ?auto_738438 ) ) ( not ( = ?auto_738431 ?auto_738432 ) ) ( not ( = ?auto_738431 ?auto_738433 ) ) ( not ( = ?auto_738431 ?auto_738434 ) ) ( not ( = ?auto_738431 ?auto_738435 ) ) ( not ( = ?auto_738431 ?auto_738436 ) ) ( not ( = ?auto_738431 ?auto_738437 ) ) ( not ( = ?auto_738431 ?auto_738438 ) ) ( not ( = ?auto_738432 ?auto_738433 ) ) ( not ( = ?auto_738432 ?auto_738434 ) ) ( not ( = ?auto_738432 ?auto_738435 ) ) ( not ( = ?auto_738432 ?auto_738436 ) ) ( not ( = ?auto_738432 ?auto_738437 ) ) ( not ( = ?auto_738432 ?auto_738438 ) ) ( not ( = ?auto_738433 ?auto_738434 ) ) ( not ( = ?auto_738433 ?auto_738435 ) ) ( not ( = ?auto_738433 ?auto_738436 ) ) ( not ( = ?auto_738433 ?auto_738437 ) ) ( not ( = ?auto_738433 ?auto_738438 ) ) ( not ( = ?auto_738434 ?auto_738435 ) ) ( not ( = ?auto_738434 ?auto_738436 ) ) ( not ( = ?auto_738434 ?auto_738437 ) ) ( not ( = ?auto_738434 ?auto_738438 ) ) ( not ( = ?auto_738435 ?auto_738436 ) ) ( not ( = ?auto_738435 ?auto_738437 ) ) ( not ( = ?auto_738435 ?auto_738438 ) ) ( not ( = ?auto_738436 ?auto_738437 ) ) ( not ( = ?auto_738436 ?auto_738438 ) ) ( not ( = ?auto_738437 ?auto_738438 ) ) ( ON ?auto_738436 ?auto_738437 ) ( ON ?auto_738435 ?auto_738436 ) ( ON ?auto_738434 ?auto_738435 ) ( ON ?auto_738433 ?auto_738434 ) ( ON ?auto_738432 ?auto_738433 ) ( ON ?auto_738431 ?auto_738432 ) ( ON ?auto_738430 ?auto_738431 ) ( ON ?auto_738429 ?auto_738430 ) ( ON ?auto_738428 ?auto_738429 ) ( ON ?auto_738427 ?auto_738428 ) ( ON ?auto_738426 ?auto_738427 ) ( ON ?auto_738425 ?auto_738426 ) ( ON ?auto_738424 ?auto_738425 ) ( ON ?auto_738423 ?auto_738424 ) ( ON ?auto_738422 ?auto_738423 ) ( CLEAR ?auto_738422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_738422 )
      ( MAKE-16PILE ?auto_738422 ?auto_738423 ?auto_738424 ?auto_738425 ?auto_738426 ?auto_738427 ?auto_738428 ?auto_738429 ?auto_738430 ?auto_738431 ?auto_738432 ?auto_738433 ?auto_738434 ?auto_738435 ?auto_738436 ?auto_738437 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738489 - BLOCK
      ?auto_738490 - BLOCK
      ?auto_738491 - BLOCK
      ?auto_738492 - BLOCK
      ?auto_738493 - BLOCK
      ?auto_738494 - BLOCK
      ?auto_738495 - BLOCK
      ?auto_738496 - BLOCK
      ?auto_738497 - BLOCK
      ?auto_738498 - BLOCK
      ?auto_738499 - BLOCK
      ?auto_738500 - BLOCK
      ?auto_738501 - BLOCK
      ?auto_738502 - BLOCK
      ?auto_738503 - BLOCK
      ?auto_738504 - BLOCK
      ?auto_738505 - BLOCK
    )
    :vars
    (
      ?auto_738506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_738504 ) ( ON ?auto_738505 ?auto_738506 ) ( CLEAR ?auto_738505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_738489 ) ( ON ?auto_738490 ?auto_738489 ) ( ON ?auto_738491 ?auto_738490 ) ( ON ?auto_738492 ?auto_738491 ) ( ON ?auto_738493 ?auto_738492 ) ( ON ?auto_738494 ?auto_738493 ) ( ON ?auto_738495 ?auto_738494 ) ( ON ?auto_738496 ?auto_738495 ) ( ON ?auto_738497 ?auto_738496 ) ( ON ?auto_738498 ?auto_738497 ) ( ON ?auto_738499 ?auto_738498 ) ( ON ?auto_738500 ?auto_738499 ) ( ON ?auto_738501 ?auto_738500 ) ( ON ?auto_738502 ?auto_738501 ) ( ON ?auto_738503 ?auto_738502 ) ( ON ?auto_738504 ?auto_738503 ) ( not ( = ?auto_738489 ?auto_738490 ) ) ( not ( = ?auto_738489 ?auto_738491 ) ) ( not ( = ?auto_738489 ?auto_738492 ) ) ( not ( = ?auto_738489 ?auto_738493 ) ) ( not ( = ?auto_738489 ?auto_738494 ) ) ( not ( = ?auto_738489 ?auto_738495 ) ) ( not ( = ?auto_738489 ?auto_738496 ) ) ( not ( = ?auto_738489 ?auto_738497 ) ) ( not ( = ?auto_738489 ?auto_738498 ) ) ( not ( = ?auto_738489 ?auto_738499 ) ) ( not ( = ?auto_738489 ?auto_738500 ) ) ( not ( = ?auto_738489 ?auto_738501 ) ) ( not ( = ?auto_738489 ?auto_738502 ) ) ( not ( = ?auto_738489 ?auto_738503 ) ) ( not ( = ?auto_738489 ?auto_738504 ) ) ( not ( = ?auto_738489 ?auto_738505 ) ) ( not ( = ?auto_738489 ?auto_738506 ) ) ( not ( = ?auto_738490 ?auto_738491 ) ) ( not ( = ?auto_738490 ?auto_738492 ) ) ( not ( = ?auto_738490 ?auto_738493 ) ) ( not ( = ?auto_738490 ?auto_738494 ) ) ( not ( = ?auto_738490 ?auto_738495 ) ) ( not ( = ?auto_738490 ?auto_738496 ) ) ( not ( = ?auto_738490 ?auto_738497 ) ) ( not ( = ?auto_738490 ?auto_738498 ) ) ( not ( = ?auto_738490 ?auto_738499 ) ) ( not ( = ?auto_738490 ?auto_738500 ) ) ( not ( = ?auto_738490 ?auto_738501 ) ) ( not ( = ?auto_738490 ?auto_738502 ) ) ( not ( = ?auto_738490 ?auto_738503 ) ) ( not ( = ?auto_738490 ?auto_738504 ) ) ( not ( = ?auto_738490 ?auto_738505 ) ) ( not ( = ?auto_738490 ?auto_738506 ) ) ( not ( = ?auto_738491 ?auto_738492 ) ) ( not ( = ?auto_738491 ?auto_738493 ) ) ( not ( = ?auto_738491 ?auto_738494 ) ) ( not ( = ?auto_738491 ?auto_738495 ) ) ( not ( = ?auto_738491 ?auto_738496 ) ) ( not ( = ?auto_738491 ?auto_738497 ) ) ( not ( = ?auto_738491 ?auto_738498 ) ) ( not ( = ?auto_738491 ?auto_738499 ) ) ( not ( = ?auto_738491 ?auto_738500 ) ) ( not ( = ?auto_738491 ?auto_738501 ) ) ( not ( = ?auto_738491 ?auto_738502 ) ) ( not ( = ?auto_738491 ?auto_738503 ) ) ( not ( = ?auto_738491 ?auto_738504 ) ) ( not ( = ?auto_738491 ?auto_738505 ) ) ( not ( = ?auto_738491 ?auto_738506 ) ) ( not ( = ?auto_738492 ?auto_738493 ) ) ( not ( = ?auto_738492 ?auto_738494 ) ) ( not ( = ?auto_738492 ?auto_738495 ) ) ( not ( = ?auto_738492 ?auto_738496 ) ) ( not ( = ?auto_738492 ?auto_738497 ) ) ( not ( = ?auto_738492 ?auto_738498 ) ) ( not ( = ?auto_738492 ?auto_738499 ) ) ( not ( = ?auto_738492 ?auto_738500 ) ) ( not ( = ?auto_738492 ?auto_738501 ) ) ( not ( = ?auto_738492 ?auto_738502 ) ) ( not ( = ?auto_738492 ?auto_738503 ) ) ( not ( = ?auto_738492 ?auto_738504 ) ) ( not ( = ?auto_738492 ?auto_738505 ) ) ( not ( = ?auto_738492 ?auto_738506 ) ) ( not ( = ?auto_738493 ?auto_738494 ) ) ( not ( = ?auto_738493 ?auto_738495 ) ) ( not ( = ?auto_738493 ?auto_738496 ) ) ( not ( = ?auto_738493 ?auto_738497 ) ) ( not ( = ?auto_738493 ?auto_738498 ) ) ( not ( = ?auto_738493 ?auto_738499 ) ) ( not ( = ?auto_738493 ?auto_738500 ) ) ( not ( = ?auto_738493 ?auto_738501 ) ) ( not ( = ?auto_738493 ?auto_738502 ) ) ( not ( = ?auto_738493 ?auto_738503 ) ) ( not ( = ?auto_738493 ?auto_738504 ) ) ( not ( = ?auto_738493 ?auto_738505 ) ) ( not ( = ?auto_738493 ?auto_738506 ) ) ( not ( = ?auto_738494 ?auto_738495 ) ) ( not ( = ?auto_738494 ?auto_738496 ) ) ( not ( = ?auto_738494 ?auto_738497 ) ) ( not ( = ?auto_738494 ?auto_738498 ) ) ( not ( = ?auto_738494 ?auto_738499 ) ) ( not ( = ?auto_738494 ?auto_738500 ) ) ( not ( = ?auto_738494 ?auto_738501 ) ) ( not ( = ?auto_738494 ?auto_738502 ) ) ( not ( = ?auto_738494 ?auto_738503 ) ) ( not ( = ?auto_738494 ?auto_738504 ) ) ( not ( = ?auto_738494 ?auto_738505 ) ) ( not ( = ?auto_738494 ?auto_738506 ) ) ( not ( = ?auto_738495 ?auto_738496 ) ) ( not ( = ?auto_738495 ?auto_738497 ) ) ( not ( = ?auto_738495 ?auto_738498 ) ) ( not ( = ?auto_738495 ?auto_738499 ) ) ( not ( = ?auto_738495 ?auto_738500 ) ) ( not ( = ?auto_738495 ?auto_738501 ) ) ( not ( = ?auto_738495 ?auto_738502 ) ) ( not ( = ?auto_738495 ?auto_738503 ) ) ( not ( = ?auto_738495 ?auto_738504 ) ) ( not ( = ?auto_738495 ?auto_738505 ) ) ( not ( = ?auto_738495 ?auto_738506 ) ) ( not ( = ?auto_738496 ?auto_738497 ) ) ( not ( = ?auto_738496 ?auto_738498 ) ) ( not ( = ?auto_738496 ?auto_738499 ) ) ( not ( = ?auto_738496 ?auto_738500 ) ) ( not ( = ?auto_738496 ?auto_738501 ) ) ( not ( = ?auto_738496 ?auto_738502 ) ) ( not ( = ?auto_738496 ?auto_738503 ) ) ( not ( = ?auto_738496 ?auto_738504 ) ) ( not ( = ?auto_738496 ?auto_738505 ) ) ( not ( = ?auto_738496 ?auto_738506 ) ) ( not ( = ?auto_738497 ?auto_738498 ) ) ( not ( = ?auto_738497 ?auto_738499 ) ) ( not ( = ?auto_738497 ?auto_738500 ) ) ( not ( = ?auto_738497 ?auto_738501 ) ) ( not ( = ?auto_738497 ?auto_738502 ) ) ( not ( = ?auto_738497 ?auto_738503 ) ) ( not ( = ?auto_738497 ?auto_738504 ) ) ( not ( = ?auto_738497 ?auto_738505 ) ) ( not ( = ?auto_738497 ?auto_738506 ) ) ( not ( = ?auto_738498 ?auto_738499 ) ) ( not ( = ?auto_738498 ?auto_738500 ) ) ( not ( = ?auto_738498 ?auto_738501 ) ) ( not ( = ?auto_738498 ?auto_738502 ) ) ( not ( = ?auto_738498 ?auto_738503 ) ) ( not ( = ?auto_738498 ?auto_738504 ) ) ( not ( = ?auto_738498 ?auto_738505 ) ) ( not ( = ?auto_738498 ?auto_738506 ) ) ( not ( = ?auto_738499 ?auto_738500 ) ) ( not ( = ?auto_738499 ?auto_738501 ) ) ( not ( = ?auto_738499 ?auto_738502 ) ) ( not ( = ?auto_738499 ?auto_738503 ) ) ( not ( = ?auto_738499 ?auto_738504 ) ) ( not ( = ?auto_738499 ?auto_738505 ) ) ( not ( = ?auto_738499 ?auto_738506 ) ) ( not ( = ?auto_738500 ?auto_738501 ) ) ( not ( = ?auto_738500 ?auto_738502 ) ) ( not ( = ?auto_738500 ?auto_738503 ) ) ( not ( = ?auto_738500 ?auto_738504 ) ) ( not ( = ?auto_738500 ?auto_738505 ) ) ( not ( = ?auto_738500 ?auto_738506 ) ) ( not ( = ?auto_738501 ?auto_738502 ) ) ( not ( = ?auto_738501 ?auto_738503 ) ) ( not ( = ?auto_738501 ?auto_738504 ) ) ( not ( = ?auto_738501 ?auto_738505 ) ) ( not ( = ?auto_738501 ?auto_738506 ) ) ( not ( = ?auto_738502 ?auto_738503 ) ) ( not ( = ?auto_738502 ?auto_738504 ) ) ( not ( = ?auto_738502 ?auto_738505 ) ) ( not ( = ?auto_738502 ?auto_738506 ) ) ( not ( = ?auto_738503 ?auto_738504 ) ) ( not ( = ?auto_738503 ?auto_738505 ) ) ( not ( = ?auto_738503 ?auto_738506 ) ) ( not ( = ?auto_738504 ?auto_738505 ) ) ( not ( = ?auto_738504 ?auto_738506 ) ) ( not ( = ?auto_738505 ?auto_738506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_738505 ?auto_738506 )
      ( !STACK ?auto_738505 ?auto_738504 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738524 - BLOCK
      ?auto_738525 - BLOCK
      ?auto_738526 - BLOCK
      ?auto_738527 - BLOCK
      ?auto_738528 - BLOCK
      ?auto_738529 - BLOCK
      ?auto_738530 - BLOCK
      ?auto_738531 - BLOCK
      ?auto_738532 - BLOCK
      ?auto_738533 - BLOCK
      ?auto_738534 - BLOCK
      ?auto_738535 - BLOCK
      ?auto_738536 - BLOCK
      ?auto_738537 - BLOCK
      ?auto_738538 - BLOCK
      ?auto_738539 - BLOCK
      ?auto_738540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_738539 ) ( ON-TABLE ?auto_738540 ) ( CLEAR ?auto_738540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_738524 ) ( ON ?auto_738525 ?auto_738524 ) ( ON ?auto_738526 ?auto_738525 ) ( ON ?auto_738527 ?auto_738526 ) ( ON ?auto_738528 ?auto_738527 ) ( ON ?auto_738529 ?auto_738528 ) ( ON ?auto_738530 ?auto_738529 ) ( ON ?auto_738531 ?auto_738530 ) ( ON ?auto_738532 ?auto_738531 ) ( ON ?auto_738533 ?auto_738532 ) ( ON ?auto_738534 ?auto_738533 ) ( ON ?auto_738535 ?auto_738534 ) ( ON ?auto_738536 ?auto_738535 ) ( ON ?auto_738537 ?auto_738536 ) ( ON ?auto_738538 ?auto_738537 ) ( ON ?auto_738539 ?auto_738538 ) ( not ( = ?auto_738524 ?auto_738525 ) ) ( not ( = ?auto_738524 ?auto_738526 ) ) ( not ( = ?auto_738524 ?auto_738527 ) ) ( not ( = ?auto_738524 ?auto_738528 ) ) ( not ( = ?auto_738524 ?auto_738529 ) ) ( not ( = ?auto_738524 ?auto_738530 ) ) ( not ( = ?auto_738524 ?auto_738531 ) ) ( not ( = ?auto_738524 ?auto_738532 ) ) ( not ( = ?auto_738524 ?auto_738533 ) ) ( not ( = ?auto_738524 ?auto_738534 ) ) ( not ( = ?auto_738524 ?auto_738535 ) ) ( not ( = ?auto_738524 ?auto_738536 ) ) ( not ( = ?auto_738524 ?auto_738537 ) ) ( not ( = ?auto_738524 ?auto_738538 ) ) ( not ( = ?auto_738524 ?auto_738539 ) ) ( not ( = ?auto_738524 ?auto_738540 ) ) ( not ( = ?auto_738525 ?auto_738526 ) ) ( not ( = ?auto_738525 ?auto_738527 ) ) ( not ( = ?auto_738525 ?auto_738528 ) ) ( not ( = ?auto_738525 ?auto_738529 ) ) ( not ( = ?auto_738525 ?auto_738530 ) ) ( not ( = ?auto_738525 ?auto_738531 ) ) ( not ( = ?auto_738525 ?auto_738532 ) ) ( not ( = ?auto_738525 ?auto_738533 ) ) ( not ( = ?auto_738525 ?auto_738534 ) ) ( not ( = ?auto_738525 ?auto_738535 ) ) ( not ( = ?auto_738525 ?auto_738536 ) ) ( not ( = ?auto_738525 ?auto_738537 ) ) ( not ( = ?auto_738525 ?auto_738538 ) ) ( not ( = ?auto_738525 ?auto_738539 ) ) ( not ( = ?auto_738525 ?auto_738540 ) ) ( not ( = ?auto_738526 ?auto_738527 ) ) ( not ( = ?auto_738526 ?auto_738528 ) ) ( not ( = ?auto_738526 ?auto_738529 ) ) ( not ( = ?auto_738526 ?auto_738530 ) ) ( not ( = ?auto_738526 ?auto_738531 ) ) ( not ( = ?auto_738526 ?auto_738532 ) ) ( not ( = ?auto_738526 ?auto_738533 ) ) ( not ( = ?auto_738526 ?auto_738534 ) ) ( not ( = ?auto_738526 ?auto_738535 ) ) ( not ( = ?auto_738526 ?auto_738536 ) ) ( not ( = ?auto_738526 ?auto_738537 ) ) ( not ( = ?auto_738526 ?auto_738538 ) ) ( not ( = ?auto_738526 ?auto_738539 ) ) ( not ( = ?auto_738526 ?auto_738540 ) ) ( not ( = ?auto_738527 ?auto_738528 ) ) ( not ( = ?auto_738527 ?auto_738529 ) ) ( not ( = ?auto_738527 ?auto_738530 ) ) ( not ( = ?auto_738527 ?auto_738531 ) ) ( not ( = ?auto_738527 ?auto_738532 ) ) ( not ( = ?auto_738527 ?auto_738533 ) ) ( not ( = ?auto_738527 ?auto_738534 ) ) ( not ( = ?auto_738527 ?auto_738535 ) ) ( not ( = ?auto_738527 ?auto_738536 ) ) ( not ( = ?auto_738527 ?auto_738537 ) ) ( not ( = ?auto_738527 ?auto_738538 ) ) ( not ( = ?auto_738527 ?auto_738539 ) ) ( not ( = ?auto_738527 ?auto_738540 ) ) ( not ( = ?auto_738528 ?auto_738529 ) ) ( not ( = ?auto_738528 ?auto_738530 ) ) ( not ( = ?auto_738528 ?auto_738531 ) ) ( not ( = ?auto_738528 ?auto_738532 ) ) ( not ( = ?auto_738528 ?auto_738533 ) ) ( not ( = ?auto_738528 ?auto_738534 ) ) ( not ( = ?auto_738528 ?auto_738535 ) ) ( not ( = ?auto_738528 ?auto_738536 ) ) ( not ( = ?auto_738528 ?auto_738537 ) ) ( not ( = ?auto_738528 ?auto_738538 ) ) ( not ( = ?auto_738528 ?auto_738539 ) ) ( not ( = ?auto_738528 ?auto_738540 ) ) ( not ( = ?auto_738529 ?auto_738530 ) ) ( not ( = ?auto_738529 ?auto_738531 ) ) ( not ( = ?auto_738529 ?auto_738532 ) ) ( not ( = ?auto_738529 ?auto_738533 ) ) ( not ( = ?auto_738529 ?auto_738534 ) ) ( not ( = ?auto_738529 ?auto_738535 ) ) ( not ( = ?auto_738529 ?auto_738536 ) ) ( not ( = ?auto_738529 ?auto_738537 ) ) ( not ( = ?auto_738529 ?auto_738538 ) ) ( not ( = ?auto_738529 ?auto_738539 ) ) ( not ( = ?auto_738529 ?auto_738540 ) ) ( not ( = ?auto_738530 ?auto_738531 ) ) ( not ( = ?auto_738530 ?auto_738532 ) ) ( not ( = ?auto_738530 ?auto_738533 ) ) ( not ( = ?auto_738530 ?auto_738534 ) ) ( not ( = ?auto_738530 ?auto_738535 ) ) ( not ( = ?auto_738530 ?auto_738536 ) ) ( not ( = ?auto_738530 ?auto_738537 ) ) ( not ( = ?auto_738530 ?auto_738538 ) ) ( not ( = ?auto_738530 ?auto_738539 ) ) ( not ( = ?auto_738530 ?auto_738540 ) ) ( not ( = ?auto_738531 ?auto_738532 ) ) ( not ( = ?auto_738531 ?auto_738533 ) ) ( not ( = ?auto_738531 ?auto_738534 ) ) ( not ( = ?auto_738531 ?auto_738535 ) ) ( not ( = ?auto_738531 ?auto_738536 ) ) ( not ( = ?auto_738531 ?auto_738537 ) ) ( not ( = ?auto_738531 ?auto_738538 ) ) ( not ( = ?auto_738531 ?auto_738539 ) ) ( not ( = ?auto_738531 ?auto_738540 ) ) ( not ( = ?auto_738532 ?auto_738533 ) ) ( not ( = ?auto_738532 ?auto_738534 ) ) ( not ( = ?auto_738532 ?auto_738535 ) ) ( not ( = ?auto_738532 ?auto_738536 ) ) ( not ( = ?auto_738532 ?auto_738537 ) ) ( not ( = ?auto_738532 ?auto_738538 ) ) ( not ( = ?auto_738532 ?auto_738539 ) ) ( not ( = ?auto_738532 ?auto_738540 ) ) ( not ( = ?auto_738533 ?auto_738534 ) ) ( not ( = ?auto_738533 ?auto_738535 ) ) ( not ( = ?auto_738533 ?auto_738536 ) ) ( not ( = ?auto_738533 ?auto_738537 ) ) ( not ( = ?auto_738533 ?auto_738538 ) ) ( not ( = ?auto_738533 ?auto_738539 ) ) ( not ( = ?auto_738533 ?auto_738540 ) ) ( not ( = ?auto_738534 ?auto_738535 ) ) ( not ( = ?auto_738534 ?auto_738536 ) ) ( not ( = ?auto_738534 ?auto_738537 ) ) ( not ( = ?auto_738534 ?auto_738538 ) ) ( not ( = ?auto_738534 ?auto_738539 ) ) ( not ( = ?auto_738534 ?auto_738540 ) ) ( not ( = ?auto_738535 ?auto_738536 ) ) ( not ( = ?auto_738535 ?auto_738537 ) ) ( not ( = ?auto_738535 ?auto_738538 ) ) ( not ( = ?auto_738535 ?auto_738539 ) ) ( not ( = ?auto_738535 ?auto_738540 ) ) ( not ( = ?auto_738536 ?auto_738537 ) ) ( not ( = ?auto_738536 ?auto_738538 ) ) ( not ( = ?auto_738536 ?auto_738539 ) ) ( not ( = ?auto_738536 ?auto_738540 ) ) ( not ( = ?auto_738537 ?auto_738538 ) ) ( not ( = ?auto_738537 ?auto_738539 ) ) ( not ( = ?auto_738537 ?auto_738540 ) ) ( not ( = ?auto_738538 ?auto_738539 ) ) ( not ( = ?auto_738538 ?auto_738540 ) ) ( not ( = ?auto_738539 ?auto_738540 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_738540 )
      ( !STACK ?auto_738540 ?auto_738539 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738558 - BLOCK
      ?auto_738559 - BLOCK
      ?auto_738560 - BLOCK
      ?auto_738561 - BLOCK
      ?auto_738562 - BLOCK
      ?auto_738563 - BLOCK
      ?auto_738564 - BLOCK
      ?auto_738565 - BLOCK
      ?auto_738566 - BLOCK
      ?auto_738567 - BLOCK
      ?auto_738568 - BLOCK
      ?auto_738569 - BLOCK
      ?auto_738570 - BLOCK
      ?auto_738571 - BLOCK
      ?auto_738572 - BLOCK
      ?auto_738573 - BLOCK
      ?auto_738574 - BLOCK
    )
    :vars
    (
      ?auto_738575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738574 ?auto_738575 ) ( ON-TABLE ?auto_738558 ) ( ON ?auto_738559 ?auto_738558 ) ( ON ?auto_738560 ?auto_738559 ) ( ON ?auto_738561 ?auto_738560 ) ( ON ?auto_738562 ?auto_738561 ) ( ON ?auto_738563 ?auto_738562 ) ( ON ?auto_738564 ?auto_738563 ) ( ON ?auto_738565 ?auto_738564 ) ( ON ?auto_738566 ?auto_738565 ) ( ON ?auto_738567 ?auto_738566 ) ( ON ?auto_738568 ?auto_738567 ) ( ON ?auto_738569 ?auto_738568 ) ( ON ?auto_738570 ?auto_738569 ) ( ON ?auto_738571 ?auto_738570 ) ( ON ?auto_738572 ?auto_738571 ) ( not ( = ?auto_738558 ?auto_738559 ) ) ( not ( = ?auto_738558 ?auto_738560 ) ) ( not ( = ?auto_738558 ?auto_738561 ) ) ( not ( = ?auto_738558 ?auto_738562 ) ) ( not ( = ?auto_738558 ?auto_738563 ) ) ( not ( = ?auto_738558 ?auto_738564 ) ) ( not ( = ?auto_738558 ?auto_738565 ) ) ( not ( = ?auto_738558 ?auto_738566 ) ) ( not ( = ?auto_738558 ?auto_738567 ) ) ( not ( = ?auto_738558 ?auto_738568 ) ) ( not ( = ?auto_738558 ?auto_738569 ) ) ( not ( = ?auto_738558 ?auto_738570 ) ) ( not ( = ?auto_738558 ?auto_738571 ) ) ( not ( = ?auto_738558 ?auto_738572 ) ) ( not ( = ?auto_738558 ?auto_738573 ) ) ( not ( = ?auto_738558 ?auto_738574 ) ) ( not ( = ?auto_738558 ?auto_738575 ) ) ( not ( = ?auto_738559 ?auto_738560 ) ) ( not ( = ?auto_738559 ?auto_738561 ) ) ( not ( = ?auto_738559 ?auto_738562 ) ) ( not ( = ?auto_738559 ?auto_738563 ) ) ( not ( = ?auto_738559 ?auto_738564 ) ) ( not ( = ?auto_738559 ?auto_738565 ) ) ( not ( = ?auto_738559 ?auto_738566 ) ) ( not ( = ?auto_738559 ?auto_738567 ) ) ( not ( = ?auto_738559 ?auto_738568 ) ) ( not ( = ?auto_738559 ?auto_738569 ) ) ( not ( = ?auto_738559 ?auto_738570 ) ) ( not ( = ?auto_738559 ?auto_738571 ) ) ( not ( = ?auto_738559 ?auto_738572 ) ) ( not ( = ?auto_738559 ?auto_738573 ) ) ( not ( = ?auto_738559 ?auto_738574 ) ) ( not ( = ?auto_738559 ?auto_738575 ) ) ( not ( = ?auto_738560 ?auto_738561 ) ) ( not ( = ?auto_738560 ?auto_738562 ) ) ( not ( = ?auto_738560 ?auto_738563 ) ) ( not ( = ?auto_738560 ?auto_738564 ) ) ( not ( = ?auto_738560 ?auto_738565 ) ) ( not ( = ?auto_738560 ?auto_738566 ) ) ( not ( = ?auto_738560 ?auto_738567 ) ) ( not ( = ?auto_738560 ?auto_738568 ) ) ( not ( = ?auto_738560 ?auto_738569 ) ) ( not ( = ?auto_738560 ?auto_738570 ) ) ( not ( = ?auto_738560 ?auto_738571 ) ) ( not ( = ?auto_738560 ?auto_738572 ) ) ( not ( = ?auto_738560 ?auto_738573 ) ) ( not ( = ?auto_738560 ?auto_738574 ) ) ( not ( = ?auto_738560 ?auto_738575 ) ) ( not ( = ?auto_738561 ?auto_738562 ) ) ( not ( = ?auto_738561 ?auto_738563 ) ) ( not ( = ?auto_738561 ?auto_738564 ) ) ( not ( = ?auto_738561 ?auto_738565 ) ) ( not ( = ?auto_738561 ?auto_738566 ) ) ( not ( = ?auto_738561 ?auto_738567 ) ) ( not ( = ?auto_738561 ?auto_738568 ) ) ( not ( = ?auto_738561 ?auto_738569 ) ) ( not ( = ?auto_738561 ?auto_738570 ) ) ( not ( = ?auto_738561 ?auto_738571 ) ) ( not ( = ?auto_738561 ?auto_738572 ) ) ( not ( = ?auto_738561 ?auto_738573 ) ) ( not ( = ?auto_738561 ?auto_738574 ) ) ( not ( = ?auto_738561 ?auto_738575 ) ) ( not ( = ?auto_738562 ?auto_738563 ) ) ( not ( = ?auto_738562 ?auto_738564 ) ) ( not ( = ?auto_738562 ?auto_738565 ) ) ( not ( = ?auto_738562 ?auto_738566 ) ) ( not ( = ?auto_738562 ?auto_738567 ) ) ( not ( = ?auto_738562 ?auto_738568 ) ) ( not ( = ?auto_738562 ?auto_738569 ) ) ( not ( = ?auto_738562 ?auto_738570 ) ) ( not ( = ?auto_738562 ?auto_738571 ) ) ( not ( = ?auto_738562 ?auto_738572 ) ) ( not ( = ?auto_738562 ?auto_738573 ) ) ( not ( = ?auto_738562 ?auto_738574 ) ) ( not ( = ?auto_738562 ?auto_738575 ) ) ( not ( = ?auto_738563 ?auto_738564 ) ) ( not ( = ?auto_738563 ?auto_738565 ) ) ( not ( = ?auto_738563 ?auto_738566 ) ) ( not ( = ?auto_738563 ?auto_738567 ) ) ( not ( = ?auto_738563 ?auto_738568 ) ) ( not ( = ?auto_738563 ?auto_738569 ) ) ( not ( = ?auto_738563 ?auto_738570 ) ) ( not ( = ?auto_738563 ?auto_738571 ) ) ( not ( = ?auto_738563 ?auto_738572 ) ) ( not ( = ?auto_738563 ?auto_738573 ) ) ( not ( = ?auto_738563 ?auto_738574 ) ) ( not ( = ?auto_738563 ?auto_738575 ) ) ( not ( = ?auto_738564 ?auto_738565 ) ) ( not ( = ?auto_738564 ?auto_738566 ) ) ( not ( = ?auto_738564 ?auto_738567 ) ) ( not ( = ?auto_738564 ?auto_738568 ) ) ( not ( = ?auto_738564 ?auto_738569 ) ) ( not ( = ?auto_738564 ?auto_738570 ) ) ( not ( = ?auto_738564 ?auto_738571 ) ) ( not ( = ?auto_738564 ?auto_738572 ) ) ( not ( = ?auto_738564 ?auto_738573 ) ) ( not ( = ?auto_738564 ?auto_738574 ) ) ( not ( = ?auto_738564 ?auto_738575 ) ) ( not ( = ?auto_738565 ?auto_738566 ) ) ( not ( = ?auto_738565 ?auto_738567 ) ) ( not ( = ?auto_738565 ?auto_738568 ) ) ( not ( = ?auto_738565 ?auto_738569 ) ) ( not ( = ?auto_738565 ?auto_738570 ) ) ( not ( = ?auto_738565 ?auto_738571 ) ) ( not ( = ?auto_738565 ?auto_738572 ) ) ( not ( = ?auto_738565 ?auto_738573 ) ) ( not ( = ?auto_738565 ?auto_738574 ) ) ( not ( = ?auto_738565 ?auto_738575 ) ) ( not ( = ?auto_738566 ?auto_738567 ) ) ( not ( = ?auto_738566 ?auto_738568 ) ) ( not ( = ?auto_738566 ?auto_738569 ) ) ( not ( = ?auto_738566 ?auto_738570 ) ) ( not ( = ?auto_738566 ?auto_738571 ) ) ( not ( = ?auto_738566 ?auto_738572 ) ) ( not ( = ?auto_738566 ?auto_738573 ) ) ( not ( = ?auto_738566 ?auto_738574 ) ) ( not ( = ?auto_738566 ?auto_738575 ) ) ( not ( = ?auto_738567 ?auto_738568 ) ) ( not ( = ?auto_738567 ?auto_738569 ) ) ( not ( = ?auto_738567 ?auto_738570 ) ) ( not ( = ?auto_738567 ?auto_738571 ) ) ( not ( = ?auto_738567 ?auto_738572 ) ) ( not ( = ?auto_738567 ?auto_738573 ) ) ( not ( = ?auto_738567 ?auto_738574 ) ) ( not ( = ?auto_738567 ?auto_738575 ) ) ( not ( = ?auto_738568 ?auto_738569 ) ) ( not ( = ?auto_738568 ?auto_738570 ) ) ( not ( = ?auto_738568 ?auto_738571 ) ) ( not ( = ?auto_738568 ?auto_738572 ) ) ( not ( = ?auto_738568 ?auto_738573 ) ) ( not ( = ?auto_738568 ?auto_738574 ) ) ( not ( = ?auto_738568 ?auto_738575 ) ) ( not ( = ?auto_738569 ?auto_738570 ) ) ( not ( = ?auto_738569 ?auto_738571 ) ) ( not ( = ?auto_738569 ?auto_738572 ) ) ( not ( = ?auto_738569 ?auto_738573 ) ) ( not ( = ?auto_738569 ?auto_738574 ) ) ( not ( = ?auto_738569 ?auto_738575 ) ) ( not ( = ?auto_738570 ?auto_738571 ) ) ( not ( = ?auto_738570 ?auto_738572 ) ) ( not ( = ?auto_738570 ?auto_738573 ) ) ( not ( = ?auto_738570 ?auto_738574 ) ) ( not ( = ?auto_738570 ?auto_738575 ) ) ( not ( = ?auto_738571 ?auto_738572 ) ) ( not ( = ?auto_738571 ?auto_738573 ) ) ( not ( = ?auto_738571 ?auto_738574 ) ) ( not ( = ?auto_738571 ?auto_738575 ) ) ( not ( = ?auto_738572 ?auto_738573 ) ) ( not ( = ?auto_738572 ?auto_738574 ) ) ( not ( = ?auto_738572 ?auto_738575 ) ) ( not ( = ?auto_738573 ?auto_738574 ) ) ( not ( = ?auto_738573 ?auto_738575 ) ) ( not ( = ?auto_738574 ?auto_738575 ) ) ( CLEAR ?auto_738572 ) ( ON ?auto_738573 ?auto_738574 ) ( CLEAR ?auto_738573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_738558 ?auto_738559 ?auto_738560 ?auto_738561 ?auto_738562 ?auto_738563 ?auto_738564 ?auto_738565 ?auto_738566 ?auto_738567 ?auto_738568 ?auto_738569 ?auto_738570 ?auto_738571 ?auto_738572 ?auto_738573 )
      ( MAKE-17PILE ?auto_738558 ?auto_738559 ?auto_738560 ?auto_738561 ?auto_738562 ?auto_738563 ?auto_738564 ?auto_738565 ?auto_738566 ?auto_738567 ?auto_738568 ?auto_738569 ?auto_738570 ?auto_738571 ?auto_738572 ?auto_738573 ?auto_738574 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738593 - BLOCK
      ?auto_738594 - BLOCK
      ?auto_738595 - BLOCK
      ?auto_738596 - BLOCK
      ?auto_738597 - BLOCK
      ?auto_738598 - BLOCK
      ?auto_738599 - BLOCK
      ?auto_738600 - BLOCK
      ?auto_738601 - BLOCK
      ?auto_738602 - BLOCK
      ?auto_738603 - BLOCK
      ?auto_738604 - BLOCK
      ?auto_738605 - BLOCK
      ?auto_738606 - BLOCK
      ?auto_738607 - BLOCK
      ?auto_738608 - BLOCK
      ?auto_738609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_738609 ) ( ON-TABLE ?auto_738593 ) ( ON ?auto_738594 ?auto_738593 ) ( ON ?auto_738595 ?auto_738594 ) ( ON ?auto_738596 ?auto_738595 ) ( ON ?auto_738597 ?auto_738596 ) ( ON ?auto_738598 ?auto_738597 ) ( ON ?auto_738599 ?auto_738598 ) ( ON ?auto_738600 ?auto_738599 ) ( ON ?auto_738601 ?auto_738600 ) ( ON ?auto_738602 ?auto_738601 ) ( ON ?auto_738603 ?auto_738602 ) ( ON ?auto_738604 ?auto_738603 ) ( ON ?auto_738605 ?auto_738604 ) ( ON ?auto_738606 ?auto_738605 ) ( ON ?auto_738607 ?auto_738606 ) ( not ( = ?auto_738593 ?auto_738594 ) ) ( not ( = ?auto_738593 ?auto_738595 ) ) ( not ( = ?auto_738593 ?auto_738596 ) ) ( not ( = ?auto_738593 ?auto_738597 ) ) ( not ( = ?auto_738593 ?auto_738598 ) ) ( not ( = ?auto_738593 ?auto_738599 ) ) ( not ( = ?auto_738593 ?auto_738600 ) ) ( not ( = ?auto_738593 ?auto_738601 ) ) ( not ( = ?auto_738593 ?auto_738602 ) ) ( not ( = ?auto_738593 ?auto_738603 ) ) ( not ( = ?auto_738593 ?auto_738604 ) ) ( not ( = ?auto_738593 ?auto_738605 ) ) ( not ( = ?auto_738593 ?auto_738606 ) ) ( not ( = ?auto_738593 ?auto_738607 ) ) ( not ( = ?auto_738593 ?auto_738608 ) ) ( not ( = ?auto_738593 ?auto_738609 ) ) ( not ( = ?auto_738594 ?auto_738595 ) ) ( not ( = ?auto_738594 ?auto_738596 ) ) ( not ( = ?auto_738594 ?auto_738597 ) ) ( not ( = ?auto_738594 ?auto_738598 ) ) ( not ( = ?auto_738594 ?auto_738599 ) ) ( not ( = ?auto_738594 ?auto_738600 ) ) ( not ( = ?auto_738594 ?auto_738601 ) ) ( not ( = ?auto_738594 ?auto_738602 ) ) ( not ( = ?auto_738594 ?auto_738603 ) ) ( not ( = ?auto_738594 ?auto_738604 ) ) ( not ( = ?auto_738594 ?auto_738605 ) ) ( not ( = ?auto_738594 ?auto_738606 ) ) ( not ( = ?auto_738594 ?auto_738607 ) ) ( not ( = ?auto_738594 ?auto_738608 ) ) ( not ( = ?auto_738594 ?auto_738609 ) ) ( not ( = ?auto_738595 ?auto_738596 ) ) ( not ( = ?auto_738595 ?auto_738597 ) ) ( not ( = ?auto_738595 ?auto_738598 ) ) ( not ( = ?auto_738595 ?auto_738599 ) ) ( not ( = ?auto_738595 ?auto_738600 ) ) ( not ( = ?auto_738595 ?auto_738601 ) ) ( not ( = ?auto_738595 ?auto_738602 ) ) ( not ( = ?auto_738595 ?auto_738603 ) ) ( not ( = ?auto_738595 ?auto_738604 ) ) ( not ( = ?auto_738595 ?auto_738605 ) ) ( not ( = ?auto_738595 ?auto_738606 ) ) ( not ( = ?auto_738595 ?auto_738607 ) ) ( not ( = ?auto_738595 ?auto_738608 ) ) ( not ( = ?auto_738595 ?auto_738609 ) ) ( not ( = ?auto_738596 ?auto_738597 ) ) ( not ( = ?auto_738596 ?auto_738598 ) ) ( not ( = ?auto_738596 ?auto_738599 ) ) ( not ( = ?auto_738596 ?auto_738600 ) ) ( not ( = ?auto_738596 ?auto_738601 ) ) ( not ( = ?auto_738596 ?auto_738602 ) ) ( not ( = ?auto_738596 ?auto_738603 ) ) ( not ( = ?auto_738596 ?auto_738604 ) ) ( not ( = ?auto_738596 ?auto_738605 ) ) ( not ( = ?auto_738596 ?auto_738606 ) ) ( not ( = ?auto_738596 ?auto_738607 ) ) ( not ( = ?auto_738596 ?auto_738608 ) ) ( not ( = ?auto_738596 ?auto_738609 ) ) ( not ( = ?auto_738597 ?auto_738598 ) ) ( not ( = ?auto_738597 ?auto_738599 ) ) ( not ( = ?auto_738597 ?auto_738600 ) ) ( not ( = ?auto_738597 ?auto_738601 ) ) ( not ( = ?auto_738597 ?auto_738602 ) ) ( not ( = ?auto_738597 ?auto_738603 ) ) ( not ( = ?auto_738597 ?auto_738604 ) ) ( not ( = ?auto_738597 ?auto_738605 ) ) ( not ( = ?auto_738597 ?auto_738606 ) ) ( not ( = ?auto_738597 ?auto_738607 ) ) ( not ( = ?auto_738597 ?auto_738608 ) ) ( not ( = ?auto_738597 ?auto_738609 ) ) ( not ( = ?auto_738598 ?auto_738599 ) ) ( not ( = ?auto_738598 ?auto_738600 ) ) ( not ( = ?auto_738598 ?auto_738601 ) ) ( not ( = ?auto_738598 ?auto_738602 ) ) ( not ( = ?auto_738598 ?auto_738603 ) ) ( not ( = ?auto_738598 ?auto_738604 ) ) ( not ( = ?auto_738598 ?auto_738605 ) ) ( not ( = ?auto_738598 ?auto_738606 ) ) ( not ( = ?auto_738598 ?auto_738607 ) ) ( not ( = ?auto_738598 ?auto_738608 ) ) ( not ( = ?auto_738598 ?auto_738609 ) ) ( not ( = ?auto_738599 ?auto_738600 ) ) ( not ( = ?auto_738599 ?auto_738601 ) ) ( not ( = ?auto_738599 ?auto_738602 ) ) ( not ( = ?auto_738599 ?auto_738603 ) ) ( not ( = ?auto_738599 ?auto_738604 ) ) ( not ( = ?auto_738599 ?auto_738605 ) ) ( not ( = ?auto_738599 ?auto_738606 ) ) ( not ( = ?auto_738599 ?auto_738607 ) ) ( not ( = ?auto_738599 ?auto_738608 ) ) ( not ( = ?auto_738599 ?auto_738609 ) ) ( not ( = ?auto_738600 ?auto_738601 ) ) ( not ( = ?auto_738600 ?auto_738602 ) ) ( not ( = ?auto_738600 ?auto_738603 ) ) ( not ( = ?auto_738600 ?auto_738604 ) ) ( not ( = ?auto_738600 ?auto_738605 ) ) ( not ( = ?auto_738600 ?auto_738606 ) ) ( not ( = ?auto_738600 ?auto_738607 ) ) ( not ( = ?auto_738600 ?auto_738608 ) ) ( not ( = ?auto_738600 ?auto_738609 ) ) ( not ( = ?auto_738601 ?auto_738602 ) ) ( not ( = ?auto_738601 ?auto_738603 ) ) ( not ( = ?auto_738601 ?auto_738604 ) ) ( not ( = ?auto_738601 ?auto_738605 ) ) ( not ( = ?auto_738601 ?auto_738606 ) ) ( not ( = ?auto_738601 ?auto_738607 ) ) ( not ( = ?auto_738601 ?auto_738608 ) ) ( not ( = ?auto_738601 ?auto_738609 ) ) ( not ( = ?auto_738602 ?auto_738603 ) ) ( not ( = ?auto_738602 ?auto_738604 ) ) ( not ( = ?auto_738602 ?auto_738605 ) ) ( not ( = ?auto_738602 ?auto_738606 ) ) ( not ( = ?auto_738602 ?auto_738607 ) ) ( not ( = ?auto_738602 ?auto_738608 ) ) ( not ( = ?auto_738602 ?auto_738609 ) ) ( not ( = ?auto_738603 ?auto_738604 ) ) ( not ( = ?auto_738603 ?auto_738605 ) ) ( not ( = ?auto_738603 ?auto_738606 ) ) ( not ( = ?auto_738603 ?auto_738607 ) ) ( not ( = ?auto_738603 ?auto_738608 ) ) ( not ( = ?auto_738603 ?auto_738609 ) ) ( not ( = ?auto_738604 ?auto_738605 ) ) ( not ( = ?auto_738604 ?auto_738606 ) ) ( not ( = ?auto_738604 ?auto_738607 ) ) ( not ( = ?auto_738604 ?auto_738608 ) ) ( not ( = ?auto_738604 ?auto_738609 ) ) ( not ( = ?auto_738605 ?auto_738606 ) ) ( not ( = ?auto_738605 ?auto_738607 ) ) ( not ( = ?auto_738605 ?auto_738608 ) ) ( not ( = ?auto_738605 ?auto_738609 ) ) ( not ( = ?auto_738606 ?auto_738607 ) ) ( not ( = ?auto_738606 ?auto_738608 ) ) ( not ( = ?auto_738606 ?auto_738609 ) ) ( not ( = ?auto_738607 ?auto_738608 ) ) ( not ( = ?auto_738607 ?auto_738609 ) ) ( not ( = ?auto_738608 ?auto_738609 ) ) ( CLEAR ?auto_738607 ) ( ON ?auto_738608 ?auto_738609 ) ( CLEAR ?auto_738608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_738593 ?auto_738594 ?auto_738595 ?auto_738596 ?auto_738597 ?auto_738598 ?auto_738599 ?auto_738600 ?auto_738601 ?auto_738602 ?auto_738603 ?auto_738604 ?auto_738605 ?auto_738606 ?auto_738607 ?auto_738608 )
      ( MAKE-17PILE ?auto_738593 ?auto_738594 ?auto_738595 ?auto_738596 ?auto_738597 ?auto_738598 ?auto_738599 ?auto_738600 ?auto_738601 ?auto_738602 ?auto_738603 ?auto_738604 ?auto_738605 ?auto_738606 ?auto_738607 ?auto_738608 ?auto_738609 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738627 - BLOCK
      ?auto_738628 - BLOCK
      ?auto_738629 - BLOCK
      ?auto_738630 - BLOCK
      ?auto_738631 - BLOCK
      ?auto_738632 - BLOCK
      ?auto_738633 - BLOCK
      ?auto_738634 - BLOCK
      ?auto_738635 - BLOCK
      ?auto_738636 - BLOCK
      ?auto_738637 - BLOCK
      ?auto_738638 - BLOCK
      ?auto_738639 - BLOCK
      ?auto_738640 - BLOCK
      ?auto_738641 - BLOCK
      ?auto_738642 - BLOCK
      ?auto_738643 - BLOCK
    )
    :vars
    (
      ?auto_738644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738643 ?auto_738644 ) ( ON-TABLE ?auto_738627 ) ( ON ?auto_738628 ?auto_738627 ) ( ON ?auto_738629 ?auto_738628 ) ( ON ?auto_738630 ?auto_738629 ) ( ON ?auto_738631 ?auto_738630 ) ( ON ?auto_738632 ?auto_738631 ) ( ON ?auto_738633 ?auto_738632 ) ( ON ?auto_738634 ?auto_738633 ) ( ON ?auto_738635 ?auto_738634 ) ( ON ?auto_738636 ?auto_738635 ) ( ON ?auto_738637 ?auto_738636 ) ( ON ?auto_738638 ?auto_738637 ) ( ON ?auto_738639 ?auto_738638 ) ( ON ?auto_738640 ?auto_738639 ) ( not ( = ?auto_738627 ?auto_738628 ) ) ( not ( = ?auto_738627 ?auto_738629 ) ) ( not ( = ?auto_738627 ?auto_738630 ) ) ( not ( = ?auto_738627 ?auto_738631 ) ) ( not ( = ?auto_738627 ?auto_738632 ) ) ( not ( = ?auto_738627 ?auto_738633 ) ) ( not ( = ?auto_738627 ?auto_738634 ) ) ( not ( = ?auto_738627 ?auto_738635 ) ) ( not ( = ?auto_738627 ?auto_738636 ) ) ( not ( = ?auto_738627 ?auto_738637 ) ) ( not ( = ?auto_738627 ?auto_738638 ) ) ( not ( = ?auto_738627 ?auto_738639 ) ) ( not ( = ?auto_738627 ?auto_738640 ) ) ( not ( = ?auto_738627 ?auto_738641 ) ) ( not ( = ?auto_738627 ?auto_738642 ) ) ( not ( = ?auto_738627 ?auto_738643 ) ) ( not ( = ?auto_738627 ?auto_738644 ) ) ( not ( = ?auto_738628 ?auto_738629 ) ) ( not ( = ?auto_738628 ?auto_738630 ) ) ( not ( = ?auto_738628 ?auto_738631 ) ) ( not ( = ?auto_738628 ?auto_738632 ) ) ( not ( = ?auto_738628 ?auto_738633 ) ) ( not ( = ?auto_738628 ?auto_738634 ) ) ( not ( = ?auto_738628 ?auto_738635 ) ) ( not ( = ?auto_738628 ?auto_738636 ) ) ( not ( = ?auto_738628 ?auto_738637 ) ) ( not ( = ?auto_738628 ?auto_738638 ) ) ( not ( = ?auto_738628 ?auto_738639 ) ) ( not ( = ?auto_738628 ?auto_738640 ) ) ( not ( = ?auto_738628 ?auto_738641 ) ) ( not ( = ?auto_738628 ?auto_738642 ) ) ( not ( = ?auto_738628 ?auto_738643 ) ) ( not ( = ?auto_738628 ?auto_738644 ) ) ( not ( = ?auto_738629 ?auto_738630 ) ) ( not ( = ?auto_738629 ?auto_738631 ) ) ( not ( = ?auto_738629 ?auto_738632 ) ) ( not ( = ?auto_738629 ?auto_738633 ) ) ( not ( = ?auto_738629 ?auto_738634 ) ) ( not ( = ?auto_738629 ?auto_738635 ) ) ( not ( = ?auto_738629 ?auto_738636 ) ) ( not ( = ?auto_738629 ?auto_738637 ) ) ( not ( = ?auto_738629 ?auto_738638 ) ) ( not ( = ?auto_738629 ?auto_738639 ) ) ( not ( = ?auto_738629 ?auto_738640 ) ) ( not ( = ?auto_738629 ?auto_738641 ) ) ( not ( = ?auto_738629 ?auto_738642 ) ) ( not ( = ?auto_738629 ?auto_738643 ) ) ( not ( = ?auto_738629 ?auto_738644 ) ) ( not ( = ?auto_738630 ?auto_738631 ) ) ( not ( = ?auto_738630 ?auto_738632 ) ) ( not ( = ?auto_738630 ?auto_738633 ) ) ( not ( = ?auto_738630 ?auto_738634 ) ) ( not ( = ?auto_738630 ?auto_738635 ) ) ( not ( = ?auto_738630 ?auto_738636 ) ) ( not ( = ?auto_738630 ?auto_738637 ) ) ( not ( = ?auto_738630 ?auto_738638 ) ) ( not ( = ?auto_738630 ?auto_738639 ) ) ( not ( = ?auto_738630 ?auto_738640 ) ) ( not ( = ?auto_738630 ?auto_738641 ) ) ( not ( = ?auto_738630 ?auto_738642 ) ) ( not ( = ?auto_738630 ?auto_738643 ) ) ( not ( = ?auto_738630 ?auto_738644 ) ) ( not ( = ?auto_738631 ?auto_738632 ) ) ( not ( = ?auto_738631 ?auto_738633 ) ) ( not ( = ?auto_738631 ?auto_738634 ) ) ( not ( = ?auto_738631 ?auto_738635 ) ) ( not ( = ?auto_738631 ?auto_738636 ) ) ( not ( = ?auto_738631 ?auto_738637 ) ) ( not ( = ?auto_738631 ?auto_738638 ) ) ( not ( = ?auto_738631 ?auto_738639 ) ) ( not ( = ?auto_738631 ?auto_738640 ) ) ( not ( = ?auto_738631 ?auto_738641 ) ) ( not ( = ?auto_738631 ?auto_738642 ) ) ( not ( = ?auto_738631 ?auto_738643 ) ) ( not ( = ?auto_738631 ?auto_738644 ) ) ( not ( = ?auto_738632 ?auto_738633 ) ) ( not ( = ?auto_738632 ?auto_738634 ) ) ( not ( = ?auto_738632 ?auto_738635 ) ) ( not ( = ?auto_738632 ?auto_738636 ) ) ( not ( = ?auto_738632 ?auto_738637 ) ) ( not ( = ?auto_738632 ?auto_738638 ) ) ( not ( = ?auto_738632 ?auto_738639 ) ) ( not ( = ?auto_738632 ?auto_738640 ) ) ( not ( = ?auto_738632 ?auto_738641 ) ) ( not ( = ?auto_738632 ?auto_738642 ) ) ( not ( = ?auto_738632 ?auto_738643 ) ) ( not ( = ?auto_738632 ?auto_738644 ) ) ( not ( = ?auto_738633 ?auto_738634 ) ) ( not ( = ?auto_738633 ?auto_738635 ) ) ( not ( = ?auto_738633 ?auto_738636 ) ) ( not ( = ?auto_738633 ?auto_738637 ) ) ( not ( = ?auto_738633 ?auto_738638 ) ) ( not ( = ?auto_738633 ?auto_738639 ) ) ( not ( = ?auto_738633 ?auto_738640 ) ) ( not ( = ?auto_738633 ?auto_738641 ) ) ( not ( = ?auto_738633 ?auto_738642 ) ) ( not ( = ?auto_738633 ?auto_738643 ) ) ( not ( = ?auto_738633 ?auto_738644 ) ) ( not ( = ?auto_738634 ?auto_738635 ) ) ( not ( = ?auto_738634 ?auto_738636 ) ) ( not ( = ?auto_738634 ?auto_738637 ) ) ( not ( = ?auto_738634 ?auto_738638 ) ) ( not ( = ?auto_738634 ?auto_738639 ) ) ( not ( = ?auto_738634 ?auto_738640 ) ) ( not ( = ?auto_738634 ?auto_738641 ) ) ( not ( = ?auto_738634 ?auto_738642 ) ) ( not ( = ?auto_738634 ?auto_738643 ) ) ( not ( = ?auto_738634 ?auto_738644 ) ) ( not ( = ?auto_738635 ?auto_738636 ) ) ( not ( = ?auto_738635 ?auto_738637 ) ) ( not ( = ?auto_738635 ?auto_738638 ) ) ( not ( = ?auto_738635 ?auto_738639 ) ) ( not ( = ?auto_738635 ?auto_738640 ) ) ( not ( = ?auto_738635 ?auto_738641 ) ) ( not ( = ?auto_738635 ?auto_738642 ) ) ( not ( = ?auto_738635 ?auto_738643 ) ) ( not ( = ?auto_738635 ?auto_738644 ) ) ( not ( = ?auto_738636 ?auto_738637 ) ) ( not ( = ?auto_738636 ?auto_738638 ) ) ( not ( = ?auto_738636 ?auto_738639 ) ) ( not ( = ?auto_738636 ?auto_738640 ) ) ( not ( = ?auto_738636 ?auto_738641 ) ) ( not ( = ?auto_738636 ?auto_738642 ) ) ( not ( = ?auto_738636 ?auto_738643 ) ) ( not ( = ?auto_738636 ?auto_738644 ) ) ( not ( = ?auto_738637 ?auto_738638 ) ) ( not ( = ?auto_738637 ?auto_738639 ) ) ( not ( = ?auto_738637 ?auto_738640 ) ) ( not ( = ?auto_738637 ?auto_738641 ) ) ( not ( = ?auto_738637 ?auto_738642 ) ) ( not ( = ?auto_738637 ?auto_738643 ) ) ( not ( = ?auto_738637 ?auto_738644 ) ) ( not ( = ?auto_738638 ?auto_738639 ) ) ( not ( = ?auto_738638 ?auto_738640 ) ) ( not ( = ?auto_738638 ?auto_738641 ) ) ( not ( = ?auto_738638 ?auto_738642 ) ) ( not ( = ?auto_738638 ?auto_738643 ) ) ( not ( = ?auto_738638 ?auto_738644 ) ) ( not ( = ?auto_738639 ?auto_738640 ) ) ( not ( = ?auto_738639 ?auto_738641 ) ) ( not ( = ?auto_738639 ?auto_738642 ) ) ( not ( = ?auto_738639 ?auto_738643 ) ) ( not ( = ?auto_738639 ?auto_738644 ) ) ( not ( = ?auto_738640 ?auto_738641 ) ) ( not ( = ?auto_738640 ?auto_738642 ) ) ( not ( = ?auto_738640 ?auto_738643 ) ) ( not ( = ?auto_738640 ?auto_738644 ) ) ( not ( = ?auto_738641 ?auto_738642 ) ) ( not ( = ?auto_738641 ?auto_738643 ) ) ( not ( = ?auto_738641 ?auto_738644 ) ) ( not ( = ?auto_738642 ?auto_738643 ) ) ( not ( = ?auto_738642 ?auto_738644 ) ) ( not ( = ?auto_738643 ?auto_738644 ) ) ( ON ?auto_738642 ?auto_738643 ) ( CLEAR ?auto_738640 ) ( ON ?auto_738641 ?auto_738642 ) ( CLEAR ?auto_738641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_738627 ?auto_738628 ?auto_738629 ?auto_738630 ?auto_738631 ?auto_738632 ?auto_738633 ?auto_738634 ?auto_738635 ?auto_738636 ?auto_738637 ?auto_738638 ?auto_738639 ?auto_738640 ?auto_738641 )
      ( MAKE-17PILE ?auto_738627 ?auto_738628 ?auto_738629 ?auto_738630 ?auto_738631 ?auto_738632 ?auto_738633 ?auto_738634 ?auto_738635 ?auto_738636 ?auto_738637 ?auto_738638 ?auto_738639 ?auto_738640 ?auto_738641 ?auto_738642 ?auto_738643 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738662 - BLOCK
      ?auto_738663 - BLOCK
      ?auto_738664 - BLOCK
      ?auto_738665 - BLOCK
      ?auto_738666 - BLOCK
      ?auto_738667 - BLOCK
      ?auto_738668 - BLOCK
      ?auto_738669 - BLOCK
      ?auto_738670 - BLOCK
      ?auto_738671 - BLOCK
      ?auto_738672 - BLOCK
      ?auto_738673 - BLOCK
      ?auto_738674 - BLOCK
      ?auto_738675 - BLOCK
      ?auto_738676 - BLOCK
      ?auto_738677 - BLOCK
      ?auto_738678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_738678 ) ( ON-TABLE ?auto_738662 ) ( ON ?auto_738663 ?auto_738662 ) ( ON ?auto_738664 ?auto_738663 ) ( ON ?auto_738665 ?auto_738664 ) ( ON ?auto_738666 ?auto_738665 ) ( ON ?auto_738667 ?auto_738666 ) ( ON ?auto_738668 ?auto_738667 ) ( ON ?auto_738669 ?auto_738668 ) ( ON ?auto_738670 ?auto_738669 ) ( ON ?auto_738671 ?auto_738670 ) ( ON ?auto_738672 ?auto_738671 ) ( ON ?auto_738673 ?auto_738672 ) ( ON ?auto_738674 ?auto_738673 ) ( ON ?auto_738675 ?auto_738674 ) ( not ( = ?auto_738662 ?auto_738663 ) ) ( not ( = ?auto_738662 ?auto_738664 ) ) ( not ( = ?auto_738662 ?auto_738665 ) ) ( not ( = ?auto_738662 ?auto_738666 ) ) ( not ( = ?auto_738662 ?auto_738667 ) ) ( not ( = ?auto_738662 ?auto_738668 ) ) ( not ( = ?auto_738662 ?auto_738669 ) ) ( not ( = ?auto_738662 ?auto_738670 ) ) ( not ( = ?auto_738662 ?auto_738671 ) ) ( not ( = ?auto_738662 ?auto_738672 ) ) ( not ( = ?auto_738662 ?auto_738673 ) ) ( not ( = ?auto_738662 ?auto_738674 ) ) ( not ( = ?auto_738662 ?auto_738675 ) ) ( not ( = ?auto_738662 ?auto_738676 ) ) ( not ( = ?auto_738662 ?auto_738677 ) ) ( not ( = ?auto_738662 ?auto_738678 ) ) ( not ( = ?auto_738663 ?auto_738664 ) ) ( not ( = ?auto_738663 ?auto_738665 ) ) ( not ( = ?auto_738663 ?auto_738666 ) ) ( not ( = ?auto_738663 ?auto_738667 ) ) ( not ( = ?auto_738663 ?auto_738668 ) ) ( not ( = ?auto_738663 ?auto_738669 ) ) ( not ( = ?auto_738663 ?auto_738670 ) ) ( not ( = ?auto_738663 ?auto_738671 ) ) ( not ( = ?auto_738663 ?auto_738672 ) ) ( not ( = ?auto_738663 ?auto_738673 ) ) ( not ( = ?auto_738663 ?auto_738674 ) ) ( not ( = ?auto_738663 ?auto_738675 ) ) ( not ( = ?auto_738663 ?auto_738676 ) ) ( not ( = ?auto_738663 ?auto_738677 ) ) ( not ( = ?auto_738663 ?auto_738678 ) ) ( not ( = ?auto_738664 ?auto_738665 ) ) ( not ( = ?auto_738664 ?auto_738666 ) ) ( not ( = ?auto_738664 ?auto_738667 ) ) ( not ( = ?auto_738664 ?auto_738668 ) ) ( not ( = ?auto_738664 ?auto_738669 ) ) ( not ( = ?auto_738664 ?auto_738670 ) ) ( not ( = ?auto_738664 ?auto_738671 ) ) ( not ( = ?auto_738664 ?auto_738672 ) ) ( not ( = ?auto_738664 ?auto_738673 ) ) ( not ( = ?auto_738664 ?auto_738674 ) ) ( not ( = ?auto_738664 ?auto_738675 ) ) ( not ( = ?auto_738664 ?auto_738676 ) ) ( not ( = ?auto_738664 ?auto_738677 ) ) ( not ( = ?auto_738664 ?auto_738678 ) ) ( not ( = ?auto_738665 ?auto_738666 ) ) ( not ( = ?auto_738665 ?auto_738667 ) ) ( not ( = ?auto_738665 ?auto_738668 ) ) ( not ( = ?auto_738665 ?auto_738669 ) ) ( not ( = ?auto_738665 ?auto_738670 ) ) ( not ( = ?auto_738665 ?auto_738671 ) ) ( not ( = ?auto_738665 ?auto_738672 ) ) ( not ( = ?auto_738665 ?auto_738673 ) ) ( not ( = ?auto_738665 ?auto_738674 ) ) ( not ( = ?auto_738665 ?auto_738675 ) ) ( not ( = ?auto_738665 ?auto_738676 ) ) ( not ( = ?auto_738665 ?auto_738677 ) ) ( not ( = ?auto_738665 ?auto_738678 ) ) ( not ( = ?auto_738666 ?auto_738667 ) ) ( not ( = ?auto_738666 ?auto_738668 ) ) ( not ( = ?auto_738666 ?auto_738669 ) ) ( not ( = ?auto_738666 ?auto_738670 ) ) ( not ( = ?auto_738666 ?auto_738671 ) ) ( not ( = ?auto_738666 ?auto_738672 ) ) ( not ( = ?auto_738666 ?auto_738673 ) ) ( not ( = ?auto_738666 ?auto_738674 ) ) ( not ( = ?auto_738666 ?auto_738675 ) ) ( not ( = ?auto_738666 ?auto_738676 ) ) ( not ( = ?auto_738666 ?auto_738677 ) ) ( not ( = ?auto_738666 ?auto_738678 ) ) ( not ( = ?auto_738667 ?auto_738668 ) ) ( not ( = ?auto_738667 ?auto_738669 ) ) ( not ( = ?auto_738667 ?auto_738670 ) ) ( not ( = ?auto_738667 ?auto_738671 ) ) ( not ( = ?auto_738667 ?auto_738672 ) ) ( not ( = ?auto_738667 ?auto_738673 ) ) ( not ( = ?auto_738667 ?auto_738674 ) ) ( not ( = ?auto_738667 ?auto_738675 ) ) ( not ( = ?auto_738667 ?auto_738676 ) ) ( not ( = ?auto_738667 ?auto_738677 ) ) ( not ( = ?auto_738667 ?auto_738678 ) ) ( not ( = ?auto_738668 ?auto_738669 ) ) ( not ( = ?auto_738668 ?auto_738670 ) ) ( not ( = ?auto_738668 ?auto_738671 ) ) ( not ( = ?auto_738668 ?auto_738672 ) ) ( not ( = ?auto_738668 ?auto_738673 ) ) ( not ( = ?auto_738668 ?auto_738674 ) ) ( not ( = ?auto_738668 ?auto_738675 ) ) ( not ( = ?auto_738668 ?auto_738676 ) ) ( not ( = ?auto_738668 ?auto_738677 ) ) ( not ( = ?auto_738668 ?auto_738678 ) ) ( not ( = ?auto_738669 ?auto_738670 ) ) ( not ( = ?auto_738669 ?auto_738671 ) ) ( not ( = ?auto_738669 ?auto_738672 ) ) ( not ( = ?auto_738669 ?auto_738673 ) ) ( not ( = ?auto_738669 ?auto_738674 ) ) ( not ( = ?auto_738669 ?auto_738675 ) ) ( not ( = ?auto_738669 ?auto_738676 ) ) ( not ( = ?auto_738669 ?auto_738677 ) ) ( not ( = ?auto_738669 ?auto_738678 ) ) ( not ( = ?auto_738670 ?auto_738671 ) ) ( not ( = ?auto_738670 ?auto_738672 ) ) ( not ( = ?auto_738670 ?auto_738673 ) ) ( not ( = ?auto_738670 ?auto_738674 ) ) ( not ( = ?auto_738670 ?auto_738675 ) ) ( not ( = ?auto_738670 ?auto_738676 ) ) ( not ( = ?auto_738670 ?auto_738677 ) ) ( not ( = ?auto_738670 ?auto_738678 ) ) ( not ( = ?auto_738671 ?auto_738672 ) ) ( not ( = ?auto_738671 ?auto_738673 ) ) ( not ( = ?auto_738671 ?auto_738674 ) ) ( not ( = ?auto_738671 ?auto_738675 ) ) ( not ( = ?auto_738671 ?auto_738676 ) ) ( not ( = ?auto_738671 ?auto_738677 ) ) ( not ( = ?auto_738671 ?auto_738678 ) ) ( not ( = ?auto_738672 ?auto_738673 ) ) ( not ( = ?auto_738672 ?auto_738674 ) ) ( not ( = ?auto_738672 ?auto_738675 ) ) ( not ( = ?auto_738672 ?auto_738676 ) ) ( not ( = ?auto_738672 ?auto_738677 ) ) ( not ( = ?auto_738672 ?auto_738678 ) ) ( not ( = ?auto_738673 ?auto_738674 ) ) ( not ( = ?auto_738673 ?auto_738675 ) ) ( not ( = ?auto_738673 ?auto_738676 ) ) ( not ( = ?auto_738673 ?auto_738677 ) ) ( not ( = ?auto_738673 ?auto_738678 ) ) ( not ( = ?auto_738674 ?auto_738675 ) ) ( not ( = ?auto_738674 ?auto_738676 ) ) ( not ( = ?auto_738674 ?auto_738677 ) ) ( not ( = ?auto_738674 ?auto_738678 ) ) ( not ( = ?auto_738675 ?auto_738676 ) ) ( not ( = ?auto_738675 ?auto_738677 ) ) ( not ( = ?auto_738675 ?auto_738678 ) ) ( not ( = ?auto_738676 ?auto_738677 ) ) ( not ( = ?auto_738676 ?auto_738678 ) ) ( not ( = ?auto_738677 ?auto_738678 ) ) ( ON ?auto_738677 ?auto_738678 ) ( CLEAR ?auto_738675 ) ( ON ?auto_738676 ?auto_738677 ) ( CLEAR ?auto_738676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_738662 ?auto_738663 ?auto_738664 ?auto_738665 ?auto_738666 ?auto_738667 ?auto_738668 ?auto_738669 ?auto_738670 ?auto_738671 ?auto_738672 ?auto_738673 ?auto_738674 ?auto_738675 ?auto_738676 )
      ( MAKE-17PILE ?auto_738662 ?auto_738663 ?auto_738664 ?auto_738665 ?auto_738666 ?auto_738667 ?auto_738668 ?auto_738669 ?auto_738670 ?auto_738671 ?auto_738672 ?auto_738673 ?auto_738674 ?auto_738675 ?auto_738676 ?auto_738677 ?auto_738678 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738696 - BLOCK
      ?auto_738697 - BLOCK
      ?auto_738698 - BLOCK
      ?auto_738699 - BLOCK
      ?auto_738700 - BLOCK
      ?auto_738701 - BLOCK
      ?auto_738702 - BLOCK
      ?auto_738703 - BLOCK
      ?auto_738704 - BLOCK
      ?auto_738705 - BLOCK
      ?auto_738706 - BLOCK
      ?auto_738707 - BLOCK
      ?auto_738708 - BLOCK
      ?auto_738709 - BLOCK
      ?auto_738710 - BLOCK
      ?auto_738711 - BLOCK
      ?auto_738712 - BLOCK
    )
    :vars
    (
      ?auto_738713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738712 ?auto_738713 ) ( ON-TABLE ?auto_738696 ) ( ON ?auto_738697 ?auto_738696 ) ( ON ?auto_738698 ?auto_738697 ) ( ON ?auto_738699 ?auto_738698 ) ( ON ?auto_738700 ?auto_738699 ) ( ON ?auto_738701 ?auto_738700 ) ( ON ?auto_738702 ?auto_738701 ) ( ON ?auto_738703 ?auto_738702 ) ( ON ?auto_738704 ?auto_738703 ) ( ON ?auto_738705 ?auto_738704 ) ( ON ?auto_738706 ?auto_738705 ) ( ON ?auto_738707 ?auto_738706 ) ( ON ?auto_738708 ?auto_738707 ) ( not ( = ?auto_738696 ?auto_738697 ) ) ( not ( = ?auto_738696 ?auto_738698 ) ) ( not ( = ?auto_738696 ?auto_738699 ) ) ( not ( = ?auto_738696 ?auto_738700 ) ) ( not ( = ?auto_738696 ?auto_738701 ) ) ( not ( = ?auto_738696 ?auto_738702 ) ) ( not ( = ?auto_738696 ?auto_738703 ) ) ( not ( = ?auto_738696 ?auto_738704 ) ) ( not ( = ?auto_738696 ?auto_738705 ) ) ( not ( = ?auto_738696 ?auto_738706 ) ) ( not ( = ?auto_738696 ?auto_738707 ) ) ( not ( = ?auto_738696 ?auto_738708 ) ) ( not ( = ?auto_738696 ?auto_738709 ) ) ( not ( = ?auto_738696 ?auto_738710 ) ) ( not ( = ?auto_738696 ?auto_738711 ) ) ( not ( = ?auto_738696 ?auto_738712 ) ) ( not ( = ?auto_738696 ?auto_738713 ) ) ( not ( = ?auto_738697 ?auto_738698 ) ) ( not ( = ?auto_738697 ?auto_738699 ) ) ( not ( = ?auto_738697 ?auto_738700 ) ) ( not ( = ?auto_738697 ?auto_738701 ) ) ( not ( = ?auto_738697 ?auto_738702 ) ) ( not ( = ?auto_738697 ?auto_738703 ) ) ( not ( = ?auto_738697 ?auto_738704 ) ) ( not ( = ?auto_738697 ?auto_738705 ) ) ( not ( = ?auto_738697 ?auto_738706 ) ) ( not ( = ?auto_738697 ?auto_738707 ) ) ( not ( = ?auto_738697 ?auto_738708 ) ) ( not ( = ?auto_738697 ?auto_738709 ) ) ( not ( = ?auto_738697 ?auto_738710 ) ) ( not ( = ?auto_738697 ?auto_738711 ) ) ( not ( = ?auto_738697 ?auto_738712 ) ) ( not ( = ?auto_738697 ?auto_738713 ) ) ( not ( = ?auto_738698 ?auto_738699 ) ) ( not ( = ?auto_738698 ?auto_738700 ) ) ( not ( = ?auto_738698 ?auto_738701 ) ) ( not ( = ?auto_738698 ?auto_738702 ) ) ( not ( = ?auto_738698 ?auto_738703 ) ) ( not ( = ?auto_738698 ?auto_738704 ) ) ( not ( = ?auto_738698 ?auto_738705 ) ) ( not ( = ?auto_738698 ?auto_738706 ) ) ( not ( = ?auto_738698 ?auto_738707 ) ) ( not ( = ?auto_738698 ?auto_738708 ) ) ( not ( = ?auto_738698 ?auto_738709 ) ) ( not ( = ?auto_738698 ?auto_738710 ) ) ( not ( = ?auto_738698 ?auto_738711 ) ) ( not ( = ?auto_738698 ?auto_738712 ) ) ( not ( = ?auto_738698 ?auto_738713 ) ) ( not ( = ?auto_738699 ?auto_738700 ) ) ( not ( = ?auto_738699 ?auto_738701 ) ) ( not ( = ?auto_738699 ?auto_738702 ) ) ( not ( = ?auto_738699 ?auto_738703 ) ) ( not ( = ?auto_738699 ?auto_738704 ) ) ( not ( = ?auto_738699 ?auto_738705 ) ) ( not ( = ?auto_738699 ?auto_738706 ) ) ( not ( = ?auto_738699 ?auto_738707 ) ) ( not ( = ?auto_738699 ?auto_738708 ) ) ( not ( = ?auto_738699 ?auto_738709 ) ) ( not ( = ?auto_738699 ?auto_738710 ) ) ( not ( = ?auto_738699 ?auto_738711 ) ) ( not ( = ?auto_738699 ?auto_738712 ) ) ( not ( = ?auto_738699 ?auto_738713 ) ) ( not ( = ?auto_738700 ?auto_738701 ) ) ( not ( = ?auto_738700 ?auto_738702 ) ) ( not ( = ?auto_738700 ?auto_738703 ) ) ( not ( = ?auto_738700 ?auto_738704 ) ) ( not ( = ?auto_738700 ?auto_738705 ) ) ( not ( = ?auto_738700 ?auto_738706 ) ) ( not ( = ?auto_738700 ?auto_738707 ) ) ( not ( = ?auto_738700 ?auto_738708 ) ) ( not ( = ?auto_738700 ?auto_738709 ) ) ( not ( = ?auto_738700 ?auto_738710 ) ) ( not ( = ?auto_738700 ?auto_738711 ) ) ( not ( = ?auto_738700 ?auto_738712 ) ) ( not ( = ?auto_738700 ?auto_738713 ) ) ( not ( = ?auto_738701 ?auto_738702 ) ) ( not ( = ?auto_738701 ?auto_738703 ) ) ( not ( = ?auto_738701 ?auto_738704 ) ) ( not ( = ?auto_738701 ?auto_738705 ) ) ( not ( = ?auto_738701 ?auto_738706 ) ) ( not ( = ?auto_738701 ?auto_738707 ) ) ( not ( = ?auto_738701 ?auto_738708 ) ) ( not ( = ?auto_738701 ?auto_738709 ) ) ( not ( = ?auto_738701 ?auto_738710 ) ) ( not ( = ?auto_738701 ?auto_738711 ) ) ( not ( = ?auto_738701 ?auto_738712 ) ) ( not ( = ?auto_738701 ?auto_738713 ) ) ( not ( = ?auto_738702 ?auto_738703 ) ) ( not ( = ?auto_738702 ?auto_738704 ) ) ( not ( = ?auto_738702 ?auto_738705 ) ) ( not ( = ?auto_738702 ?auto_738706 ) ) ( not ( = ?auto_738702 ?auto_738707 ) ) ( not ( = ?auto_738702 ?auto_738708 ) ) ( not ( = ?auto_738702 ?auto_738709 ) ) ( not ( = ?auto_738702 ?auto_738710 ) ) ( not ( = ?auto_738702 ?auto_738711 ) ) ( not ( = ?auto_738702 ?auto_738712 ) ) ( not ( = ?auto_738702 ?auto_738713 ) ) ( not ( = ?auto_738703 ?auto_738704 ) ) ( not ( = ?auto_738703 ?auto_738705 ) ) ( not ( = ?auto_738703 ?auto_738706 ) ) ( not ( = ?auto_738703 ?auto_738707 ) ) ( not ( = ?auto_738703 ?auto_738708 ) ) ( not ( = ?auto_738703 ?auto_738709 ) ) ( not ( = ?auto_738703 ?auto_738710 ) ) ( not ( = ?auto_738703 ?auto_738711 ) ) ( not ( = ?auto_738703 ?auto_738712 ) ) ( not ( = ?auto_738703 ?auto_738713 ) ) ( not ( = ?auto_738704 ?auto_738705 ) ) ( not ( = ?auto_738704 ?auto_738706 ) ) ( not ( = ?auto_738704 ?auto_738707 ) ) ( not ( = ?auto_738704 ?auto_738708 ) ) ( not ( = ?auto_738704 ?auto_738709 ) ) ( not ( = ?auto_738704 ?auto_738710 ) ) ( not ( = ?auto_738704 ?auto_738711 ) ) ( not ( = ?auto_738704 ?auto_738712 ) ) ( not ( = ?auto_738704 ?auto_738713 ) ) ( not ( = ?auto_738705 ?auto_738706 ) ) ( not ( = ?auto_738705 ?auto_738707 ) ) ( not ( = ?auto_738705 ?auto_738708 ) ) ( not ( = ?auto_738705 ?auto_738709 ) ) ( not ( = ?auto_738705 ?auto_738710 ) ) ( not ( = ?auto_738705 ?auto_738711 ) ) ( not ( = ?auto_738705 ?auto_738712 ) ) ( not ( = ?auto_738705 ?auto_738713 ) ) ( not ( = ?auto_738706 ?auto_738707 ) ) ( not ( = ?auto_738706 ?auto_738708 ) ) ( not ( = ?auto_738706 ?auto_738709 ) ) ( not ( = ?auto_738706 ?auto_738710 ) ) ( not ( = ?auto_738706 ?auto_738711 ) ) ( not ( = ?auto_738706 ?auto_738712 ) ) ( not ( = ?auto_738706 ?auto_738713 ) ) ( not ( = ?auto_738707 ?auto_738708 ) ) ( not ( = ?auto_738707 ?auto_738709 ) ) ( not ( = ?auto_738707 ?auto_738710 ) ) ( not ( = ?auto_738707 ?auto_738711 ) ) ( not ( = ?auto_738707 ?auto_738712 ) ) ( not ( = ?auto_738707 ?auto_738713 ) ) ( not ( = ?auto_738708 ?auto_738709 ) ) ( not ( = ?auto_738708 ?auto_738710 ) ) ( not ( = ?auto_738708 ?auto_738711 ) ) ( not ( = ?auto_738708 ?auto_738712 ) ) ( not ( = ?auto_738708 ?auto_738713 ) ) ( not ( = ?auto_738709 ?auto_738710 ) ) ( not ( = ?auto_738709 ?auto_738711 ) ) ( not ( = ?auto_738709 ?auto_738712 ) ) ( not ( = ?auto_738709 ?auto_738713 ) ) ( not ( = ?auto_738710 ?auto_738711 ) ) ( not ( = ?auto_738710 ?auto_738712 ) ) ( not ( = ?auto_738710 ?auto_738713 ) ) ( not ( = ?auto_738711 ?auto_738712 ) ) ( not ( = ?auto_738711 ?auto_738713 ) ) ( not ( = ?auto_738712 ?auto_738713 ) ) ( ON ?auto_738711 ?auto_738712 ) ( ON ?auto_738710 ?auto_738711 ) ( CLEAR ?auto_738708 ) ( ON ?auto_738709 ?auto_738710 ) ( CLEAR ?auto_738709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_738696 ?auto_738697 ?auto_738698 ?auto_738699 ?auto_738700 ?auto_738701 ?auto_738702 ?auto_738703 ?auto_738704 ?auto_738705 ?auto_738706 ?auto_738707 ?auto_738708 ?auto_738709 )
      ( MAKE-17PILE ?auto_738696 ?auto_738697 ?auto_738698 ?auto_738699 ?auto_738700 ?auto_738701 ?auto_738702 ?auto_738703 ?auto_738704 ?auto_738705 ?auto_738706 ?auto_738707 ?auto_738708 ?auto_738709 ?auto_738710 ?auto_738711 ?auto_738712 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738731 - BLOCK
      ?auto_738732 - BLOCK
      ?auto_738733 - BLOCK
      ?auto_738734 - BLOCK
      ?auto_738735 - BLOCK
      ?auto_738736 - BLOCK
      ?auto_738737 - BLOCK
      ?auto_738738 - BLOCK
      ?auto_738739 - BLOCK
      ?auto_738740 - BLOCK
      ?auto_738741 - BLOCK
      ?auto_738742 - BLOCK
      ?auto_738743 - BLOCK
      ?auto_738744 - BLOCK
      ?auto_738745 - BLOCK
      ?auto_738746 - BLOCK
      ?auto_738747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_738747 ) ( ON-TABLE ?auto_738731 ) ( ON ?auto_738732 ?auto_738731 ) ( ON ?auto_738733 ?auto_738732 ) ( ON ?auto_738734 ?auto_738733 ) ( ON ?auto_738735 ?auto_738734 ) ( ON ?auto_738736 ?auto_738735 ) ( ON ?auto_738737 ?auto_738736 ) ( ON ?auto_738738 ?auto_738737 ) ( ON ?auto_738739 ?auto_738738 ) ( ON ?auto_738740 ?auto_738739 ) ( ON ?auto_738741 ?auto_738740 ) ( ON ?auto_738742 ?auto_738741 ) ( ON ?auto_738743 ?auto_738742 ) ( not ( = ?auto_738731 ?auto_738732 ) ) ( not ( = ?auto_738731 ?auto_738733 ) ) ( not ( = ?auto_738731 ?auto_738734 ) ) ( not ( = ?auto_738731 ?auto_738735 ) ) ( not ( = ?auto_738731 ?auto_738736 ) ) ( not ( = ?auto_738731 ?auto_738737 ) ) ( not ( = ?auto_738731 ?auto_738738 ) ) ( not ( = ?auto_738731 ?auto_738739 ) ) ( not ( = ?auto_738731 ?auto_738740 ) ) ( not ( = ?auto_738731 ?auto_738741 ) ) ( not ( = ?auto_738731 ?auto_738742 ) ) ( not ( = ?auto_738731 ?auto_738743 ) ) ( not ( = ?auto_738731 ?auto_738744 ) ) ( not ( = ?auto_738731 ?auto_738745 ) ) ( not ( = ?auto_738731 ?auto_738746 ) ) ( not ( = ?auto_738731 ?auto_738747 ) ) ( not ( = ?auto_738732 ?auto_738733 ) ) ( not ( = ?auto_738732 ?auto_738734 ) ) ( not ( = ?auto_738732 ?auto_738735 ) ) ( not ( = ?auto_738732 ?auto_738736 ) ) ( not ( = ?auto_738732 ?auto_738737 ) ) ( not ( = ?auto_738732 ?auto_738738 ) ) ( not ( = ?auto_738732 ?auto_738739 ) ) ( not ( = ?auto_738732 ?auto_738740 ) ) ( not ( = ?auto_738732 ?auto_738741 ) ) ( not ( = ?auto_738732 ?auto_738742 ) ) ( not ( = ?auto_738732 ?auto_738743 ) ) ( not ( = ?auto_738732 ?auto_738744 ) ) ( not ( = ?auto_738732 ?auto_738745 ) ) ( not ( = ?auto_738732 ?auto_738746 ) ) ( not ( = ?auto_738732 ?auto_738747 ) ) ( not ( = ?auto_738733 ?auto_738734 ) ) ( not ( = ?auto_738733 ?auto_738735 ) ) ( not ( = ?auto_738733 ?auto_738736 ) ) ( not ( = ?auto_738733 ?auto_738737 ) ) ( not ( = ?auto_738733 ?auto_738738 ) ) ( not ( = ?auto_738733 ?auto_738739 ) ) ( not ( = ?auto_738733 ?auto_738740 ) ) ( not ( = ?auto_738733 ?auto_738741 ) ) ( not ( = ?auto_738733 ?auto_738742 ) ) ( not ( = ?auto_738733 ?auto_738743 ) ) ( not ( = ?auto_738733 ?auto_738744 ) ) ( not ( = ?auto_738733 ?auto_738745 ) ) ( not ( = ?auto_738733 ?auto_738746 ) ) ( not ( = ?auto_738733 ?auto_738747 ) ) ( not ( = ?auto_738734 ?auto_738735 ) ) ( not ( = ?auto_738734 ?auto_738736 ) ) ( not ( = ?auto_738734 ?auto_738737 ) ) ( not ( = ?auto_738734 ?auto_738738 ) ) ( not ( = ?auto_738734 ?auto_738739 ) ) ( not ( = ?auto_738734 ?auto_738740 ) ) ( not ( = ?auto_738734 ?auto_738741 ) ) ( not ( = ?auto_738734 ?auto_738742 ) ) ( not ( = ?auto_738734 ?auto_738743 ) ) ( not ( = ?auto_738734 ?auto_738744 ) ) ( not ( = ?auto_738734 ?auto_738745 ) ) ( not ( = ?auto_738734 ?auto_738746 ) ) ( not ( = ?auto_738734 ?auto_738747 ) ) ( not ( = ?auto_738735 ?auto_738736 ) ) ( not ( = ?auto_738735 ?auto_738737 ) ) ( not ( = ?auto_738735 ?auto_738738 ) ) ( not ( = ?auto_738735 ?auto_738739 ) ) ( not ( = ?auto_738735 ?auto_738740 ) ) ( not ( = ?auto_738735 ?auto_738741 ) ) ( not ( = ?auto_738735 ?auto_738742 ) ) ( not ( = ?auto_738735 ?auto_738743 ) ) ( not ( = ?auto_738735 ?auto_738744 ) ) ( not ( = ?auto_738735 ?auto_738745 ) ) ( not ( = ?auto_738735 ?auto_738746 ) ) ( not ( = ?auto_738735 ?auto_738747 ) ) ( not ( = ?auto_738736 ?auto_738737 ) ) ( not ( = ?auto_738736 ?auto_738738 ) ) ( not ( = ?auto_738736 ?auto_738739 ) ) ( not ( = ?auto_738736 ?auto_738740 ) ) ( not ( = ?auto_738736 ?auto_738741 ) ) ( not ( = ?auto_738736 ?auto_738742 ) ) ( not ( = ?auto_738736 ?auto_738743 ) ) ( not ( = ?auto_738736 ?auto_738744 ) ) ( not ( = ?auto_738736 ?auto_738745 ) ) ( not ( = ?auto_738736 ?auto_738746 ) ) ( not ( = ?auto_738736 ?auto_738747 ) ) ( not ( = ?auto_738737 ?auto_738738 ) ) ( not ( = ?auto_738737 ?auto_738739 ) ) ( not ( = ?auto_738737 ?auto_738740 ) ) ( not ( = ?auto_738737 ?auto_738741 ) ) ( not ( = ?auto_738737 ?auto_738742 ) ) ( not ( = ?auto_738737 ?auto_738743 ) ) ( not ( = ?auto_738737 ?auto_738744 ) ) ( not ( = ?auto_738737 ?auto_738745 ) ) ( not ( = ?auto_738737 ?auto_738746 ) ) ( not ( = ?auto_738737 ?auto_738747 ) ) ( not ( = ?auto_738738 ?auto_738739 ) ) ( not ( = ?auto_738738 ?auto_738740 ) ) ( not ( = ?auto_738738 ?auto_738741 ) ) ( not ( = ?auto_738738 ?auto_738742 ) ) ( not ( = ?auto_738738 ?auto_738743 ) ) ( not ( = ?auto_738738 ?auto_738744 ) ) ( not ( = ?auto_738738 ?auto_738745 ) ) ( not ( = ?auto_738738 ?auto_738746 ) ) ( not ( = ?auto_738738 ?auto_738747 ) ) ( not ( = ?auto_738739 ?auto_738740 ) ) ( not ( = ?auto_738739 ?auto_738741 ) ) ( not ( = ?auto_738739 ?auto_738742 ) ) ( not ( = ?auto_738739 ?auto_738743 ) ) ( not ( = ?auto_738739 ?auto_738744 ) ) ( not ( = ?auto_738739 ?auto_738745 ) ) ( not ( = ?auto_738739 ?auto_738746 ) ) ( not ( = ?auto_738739 ?auto_738747 ) ) ( not ( = ?auto_738740 ?auto_738741 ) ) ( not ( = ?auto_738740 ?auto_738742 ) ) ( not ( = ?auto_738740 ?auto_738743 ) ) ( not ( = ?auto_738740 ?auto_738744 ) ) ( not ( = ?auto_738740 ?auto_738745 ) ) ( not ( = ?auto_738740 ?auto_738746 ) ) ( not ( = ?auto_738740 ?auto_738747 ) ) ( not ( = ?auto_738741 ?auto_738742 ) ) ( not ( = ?auto_738741 ?auto_738743 ) ) ( not ( = ?auto_738741 ?auto_738744 ) ) ( not ( = ?auto_738741 ?auto_738745 ) ) ( not ( = ?auto_738741 ?auto_738746 ) ) ( not ( = ?auto_738741 ?auto_738747 ) ) ( not ( = ?auto_738742 ?auto_738743 ) ) ( not ( = ?auto_738742 ?auto_738744 ) ) ( not ( = ?auto_738742 ?auto_738745 ) ) ( not ( = ?auto_738742 ?auto_738746 ) ) ( not ( = ?auto_738742 ?auto_738747 ) ) ( not ( = ?auto_738743 ?auto_738744 ) ) ( not ( = ?auto_738743 ?auto_738745 ) ) ( not ( = ?auto_738743 ?auto_738746 ) ) ( not ( = ?auto_738743 ?auto_738747 ) ) ( not ( = ?auto_738744 ?auto_738745 ) ) ( not ( = ?auto_738744 ?auto_738746 ) ) ( not ( = ?auto_738744 ?auto_738747 ) ) ( not ( = ?auto_738745 ?auto_738746 ) ) ( not ( = ?auto_738745 ?auto_738747 ) ) ( not ( = ?auto_738746 ?auto_738747 ) ) ( ON ?auto_738746 ?auto_738747 ) ( ON ?auto_738745 ?auto_738746 ) ( CLEAR ?auto_738743 ) ( ON ?auto_738744 ?auto_738745 ) ( CLEAR ?auto_738744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_738731 ?auto_738732 ?auto_738733 ?auto_738734 ?auto_738735 ?auto_738736 ?auto_738737 ?auto_738738 ?auto_738739 ?auto_738740 ?auto_738741 ?auto_738742 ?auto_738743 ?auto_738744 )
      ( MAKE-17PILE ?auto_738731 ?auto_738732 ?auto_738733 ?auto_738734 ?auto_738735 ?auto_738736 ?auto_738737 ?auto_738738 ?auto_738739 ?auto_738740 ?auto_738741 ?auto_738742 ?auto_738743 ?auto_738744 ?auto_738745 ?auto_738746 ?auto_738747 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738765 - BLOCK
      ?auto_738766 - BLOCK
      ?auto_738767 - BLOCK
      ?auto_738768 - BLOCK
      ?auto_738769 - BLOCK
      ?auto_738770 - BLOCK
      ?auto_738771 - BLOCK
      ?auto_738772 - BLOCK
      ?auto_738773 - BLOCK
      ?auto_738774 - BLOCK
      ?auto_738775 - BLOCK
      ?auto_738776 - BLOCK
      ?auto_738777 - BLOCK
      ?auto_738778 - BLOCK
      ?auto_738779 - BLOCK
      ?auto_738780 - BLOCK
      ?auto_738781 - BLOCK
    )
    :vars
    (
      ?auto_738782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738781 ?auto_738782 ) ( ON-TABLE ?auto_738765 ) ( ON ?auto_738766 ?auto_738765 ) ( ON ?auto_738767 ?auto_738766 ) ( ON ?auto_738768 ?auto_738767 ) ( ON ?auto_738769 ?auto_738768 ) ( ON ?auto_738770 ?auto_738769 ) ( ON ?auto_738771 ?auto_738770 ) ( ON ?auto_738772 ?auto_738771 ) ( ON ?auto_738773 ?auto_738772 ) ( ON ?auto_738774 ?auto_738773 ) ( ON ?auto_738775 ?auto_738774 ) ( ON ?auto_738776 ?auto_738775 ) ( not ( = ?auto_738765 ?auto_738766 ) ) ( not ( = ?auto_738765 ?auto_738767 ) ) ( not ( = ?auto_738765 ?auto_738768 ) ) ( not ( = ?auto_738765 ?auto_738769 ) ) ( not ( = ?auto_738765 ?auto_738770 ) ) ( not ( = ?auto_738765 ?auto_738771 ) ) ( not ( = ?auto_738765 ?auto_738772 ) ) ( not ( = ?auto_738765 ?auto_738773 ) ) ( not ( = ?auto_738765 ?auto_738774 ) ) ( not ( = ?auto_738765 ?auto_738775 ) ) ( not ( = ?auto_738765 ?auto_738776 ) ) ( not ( = ?auto_738765 ?auto_738777 ) ) ( not ( = ?auto_738765 ?auto_738778 ) ) ( not ( = ?auto_738765 ?auto_738779 ) ) ( not ( = ?auto_738765 ?auto_738780 ) ) ( not ( = ?auto_738765 ?auto_738781 ) ) ( not ( = ?auto_738765 ?auto_738782 ) ) ( not ( = ?auto_738766 ?auto_738767 ) ) ( not ( = ?auto_738766 ?auto_738768 ) ) ( not ( = ?auto_738766 ?auto_738769 ) ) ( not ( = ?auto_738766 ?auto_738770 ) ) ( not ( = ?auto_738766 ?auto_738771 ) ) ( not ( = ?auto_738766 ?auto_738772 ) ) ( not ( = ?auto_738766 ?auto_738773 ) ) ( not ( = ?auto_738766 ?auto_738774 ) ) ( not ( = ?auto_738766 ?auto_738775 ) ) ( not ( = ?auto_738766 ?auto_738776 ) ) ( not ( = ?auto_738766 ?auto_738777 ) ) ( not ( = ?auto_738766 ?auto_738778 ) ) ( not ( = ?auto_738766 ?auto_738779 ) ) ( not ( = ?auto_738766 ?auto_738780 ) ) ( not ( = ?auto_738766 ?auto_738781 ) ) ( not ( = ?auto_738766 ?auto_738782 ) ) ( not ( = ?auto_738767 ?auto_738768 ) ) ( not ( = ?auto_738767 ?auto_738769 ) ) ( not ( = ?auto_738767 ?auto_738770 ) ) ( not ( = ?auto_738767 ?auto_738771 ) ) ( not ( = ?auto_738767 ?auto_738772 ) ) ( not ( = ?auto_738767 ?auto_738773 ) ) ( not ( = ?auto_738767 ?auto_738774 ) ) ( not ( = ?auto_738767 ?auto_738775 ) ) ( not ( = ?auto_738767 ?auto_738776 ) ) ( not ( = ?auto_738767 ?auto_738777 ) ) ( not ( = ?auto_738767 ?auto_738778 ) ) ( not ( = ?auto_738767 ?auto_738779 ) ) ( not ( = ?auto_738767 ?auto_738780 ) ) ( not ( = ?auto_738767 ?auto_738781 ) ) ( not ( = ?auto_738767 ?auto_738782 ) ) ( not ( = ?auto_738768 ?auto_738769 ) ) ( not ( = ?auto_738768 ?auto_738770 ) ) ( not ( = ?auto_738768 ?auto_738771 ) ) ( not ( = ?auto_738768 ?auto_738772 ) ) ( not ( = ?auto_738768 ?auto_738773 ) ) ( not ( = ?auto_738768 ?auto_738774 ) ) ( not ( = ?auto_738768 ?auto_738775 ) ) ( not ( = ?auto_738768 ?auto_738776 ) ) ( not ( = ?auto_738768 ?auto_738777 ) ) ( not ( = ?auto_738768 ?auto_738778 ) ) ( not ( = ?auto_738768 ?auto_738779 ) ) ( not ( = ?auto_738768 ?auto_738780 ) ) ( not ( = ?auto_738768 ?auto_738781 ) ) ( not ( = ?auto_738768 ?auto_738782 ) ) ( not ( = ?auto_738769 ?auto_738770 ) ) ( not ( = ?auto_738769 ?auto_738771 ) ) ( not ( = ?auto_738769 ?auto_738772 ) ) ( not ( = ?auto_738769 ?auto_738773 ) ) ( not ( = ?auto_738769 ?auto_738774 ) ) ( not ( = ?auto_738769 ?auto_738775 ) ) ( not ( = ?auto_738769 ?auto_738776 ) ) ( not ( = ?auto_738769 ?auto_738777 ) ) ( not ( = ?auto_738769 ?auto_738778 ) ) ( not ( = ?auto_738769 ?auto_738779 ) ) ( not ( = ?auto_738769 ?auto_738780 ) ) ( not ( = ?auto_738769 ?auto_738781 ) ) ( not ( = ?auto_738769 ?auto_738782 ) ) ( not ( = ?auto_738770 ?auto_738771 ) ) ( not ( = ?auto_738770 ?auto_738772 ) ) ( not ( = ?auto_738770 ?auto_738773 ) ) ( not ( = ?auto_738770 ?auto_738774 ) ) ( not ( = ?auto_738770 ?auto_738775 ) ) ( not ( = ?auto_738770 ?auto_738776 ) ) ( not ( = ?auto_738770 ?auto_738777 ) ) ( not ( = ?auto_738770 ?auto_738778 ) ) ( not ( = ?auto_738770 ?auto_738779 ) ) ( not ( = ?auto_738770 ?auto_738780 ) ) ( not ( = ?auto_738770 ?auto_738781 ) ) ( not ( = ?auto_738770 ?auto_738782 ) ) ( not ( = ?auto_738771 ?auto_738772 ) ) ( not ( = ?auto_738771 ?auto_738773 ) ) ( not ( = ?auto_738771 ?auto_738774 ) ) ( not ( = ?auto_738771 ?auto_738775 ) ) ( not ( = ?auto_738771 ?auto_738776 ) ) ( not ( = ?auto_738771 ?auto_738777 ) ) ( not ( = ?auto_738771 ?auto_738778 ) ) ( not ( = ?auto_738771 ?auto_738779 ) ) ( not ( = ?auto_738771 ?auto_738780 ) ) ( not ( = ?auto_738771 ?auto_738781 ) ) ( not ( = ?auto_738771 ?auto_738782 ) ) ( not ( = ?auto_738772 ?auto_738773 ) ) ( not ( = ?auto_738772 ?auto_738774 ) ) ( not ( = ?auto_738772 ?auto_738775 ) ) ( not ( = ?auto_738772 ?auto_738776 ) ) ( not ( = ?auto_738772 ?auto_738777 ) ) ( not ( = ?auto_738772 ?auto_738778 ) ) ( not ( = ?auto_738772 ?auto_738779 ) ) ( not ( = ?auto_738772 ?auto_738780 ) ) ( not ( = ?auto_738772 ?auto_738781 ) ) ( not ( = ?auto_738772 ?auto_738782 ) ) ( not ( = ?auto_738773 ?auto_738774 ) ) ( not ( = ?auto_738773 ?auto_738775 ) ) ( not ( = ?auto_738773 ?auto_738776 ) ) ( not ( = ?auto_738773 ?auto_738777 ) ) ( not ( = ?auto_738773 ?auto_738778 ) ) ( not ( = ?auto_738773 ?auto_738779 ) ) ( not ( = ?auto_738773 ?auto_738780 ) ) ( not ( = ?auto_738773 ?auto_738781 ) ) ( not ( = ?auto_738773 ?auto_738782 ) ) ( not ( = ?auto_738774 ?auto_738775 ) ) ( not ( = ?auto_738774 ?auto_738776 ) ) ( not ( = ?auto_738774 ?auto_738777 ) ) ( not ( = ?auto_738774 ?auto_738778 ) ) ( not ( = ?auto_738774 ?auto_738779 ) ) ( not ( = ?auto_738774 ?auto_738780 ) ) ( not ( = ?auto_738774 ?auto_738781 ) ) ( not ( = ?auto_738774 ?auto_738782 ) ) ( not ( = ?auto_738775 ?auto_738776 ) ) ( not ( = ?auto_738775 ?auto_738777 ) ) ( not ( = ?auto_738775 ?auto_738778 ) ) ( not ( = ?auto_738775 ?auto_738779 ) ) ( not ( = ?auto_738775 ?auto_738780 ) ) ( not ( = ?auto_738775 ?auto_738781 ) ) ( not ( = ?auto_738775 ?auto_738782 ) ) ( not ( = ?auto_738776 ?auto_738777 ) ) ( not ( = ?auto_738776 ?auto_738778 ) ) ( not ( = ?auto_738776 ?auto_738779 ) ) ( not ( = ?auto_738776 ?auto_738780 ) ) ( not ( = ?auto_738776 ?auto_738781 ) ) ( not ( = ?auto_738776 ?auto_738782 ) ) ( not ( = ?auto_738777 ?auto_738778 ) ) ( not ( = ?auto_738777 ?auto_738779 ) ) ( not ( = ?auto_738777 ?auto_738780 ) ) ( not ( = ?auto_738777 ?auto_738781 ) ) ( not ( = ?auto_738777 ?auto_738782 ) ) ( not ( = ?auto_738778 ?auto_738779 ) ) ( not ( = ?auto_738778 ?auto_738780 ) ) ( not ( = ?auto_738778 ?auto_738781 ) ) ( not ( = ?auto_738778 ?auto_738782 ) ) ( not ( = ?auto_738779 ?auto_738780 ) ) ( not ( = ?auto_738779 ?auto_738781 ) ) ( not ( = ?auto_738779 ?auto_738782 ) ) ( not ( = ?auto_738780 ?auto_738781 ) ) ( not ( = ?auto_738780 ?auto_738782 ) ) ( not ( = ?auto_738781 ?auto_738782 ) ) ( ON ?auto_738780 ?auto_738781 ) ( ON ?auto_738779 ?auto_738780 ) ( ON ?auto_738778 ?auto_738779 ) ( CLEAR ?auto_738776 ) ( ON ?auto_738777 ?auto_738778 ) ( CLEAR ?auto_738777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_738765 ?auto_738766 ?auto_738767 ?auto_738768 ?auto_738769 ?auto_738770 ?auto_738771 ?auto_738772 ?auto_738773 ?auto_738774 ?auto_738775 ?auto_738776 ?auto_738777 )
      ( MAKE-17PILE ?auto_738765 ?auto_738766 ?auto_738767 ?auto_738768 ?auto_738769 ?auto_738770 ?auto_738771 ?auto_738772 ?auto_738773 ?auto_738774 ?auto_738775 ?auto_738776 ?auto_738777 ?auto_738778 ?auto_738779 ?auto_738780 ?auto_738781 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738800 - BLOCK
      ?auto_738801 - BLOCK
      ?auto_738802 - BLOCK
      ?auto_738803 - BLOCK
      ?auto_738804 - BLOCK
      ?auto_738805 - BLOCK
      ?auto_738806 - BLOCK
      ?auto_738807 - BLOCK
      ?auto_738808 - BLOCK
      ?auto_738809 - BLOCK
      ?auto_738810 - BLOCK
      ?auto_738811 - BLOCK
      ?auto_738812 - BLOCK
      ?auto_738813 - BLOCK
      ?auto_738814 - BLOCK
      ?auto_738815 - BLOCK
      ?auto_738816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_738816 ) ( ON-TABLE ?auto_738800 ) ( ON ?auto_738801 ?auto_738800 ) ( ON ?auto_738802 ?auto_738801 ) ( ON ?auto_738803 ?auto_738802 ) ( ON ?auto_738804 ?auto_738803 ) ( ON ?auto_738805 ?auto_738804 ) ( ON ?auto_738806 ?auto_738805 ) ( ON ?auto_738807 ?auto_738806 ) ( ON ?auto_738808 ?auto_738807 ) ( ON ?auto_738809 ?auto_738808 ) ( ON ?auto_738810 ?auto_738809 ) ( ON ?auto_738811 ?auto_738810 ) ( not ( = ?auto_738800 ?auto_738801 ) ) ( not ( = ?auto_738800 ?auto_738802 ) ) ( not ( = ?auto_738800 ?auto_738803 ) ) ( not ( = ?auto_738800 ?auto_738804 ) ) ( not ( = ?auto_738800 ?auto_738805 ) ) ( not ( = ?auto_738800 ?auto_738806 ) ) ( not ( = ?auto_738800 ?auto_738807 ) ) ( not ( = ?auto_738800 ?auto_738808 ) ) ( not ( = ?auto_738800 ?auto_738809 ) ) ( not ( = ?auto_738800 ?auto_738810 ) ) ( not ( = ?auto_738800 ?auto_738811 ) ) ( not ( = ?auto_738800 ?auto_738812 ) ) ( not ( = ?auto_738800 ?auto_738813 ) ) ( not ( = ?auto_738800 ?auto_738814 ) ) ( not ( = ?auto_738800 ?auto_738815 ) ) ( not ( = ?auto_738800 ?auto_738816 ) ) ( not ( = ?auto_738801 ?auto_738802 ) ) ( not ( = ?auto_738801 ?auto_738803 ) ) ( not ( = ?auto_738801 ?auto_738804 ) ) ( not ( = ?auto_738801 ?auto_738805 ) ) ( not ( = ?auto_738801 ?auto_738806 ) ) ( not ( = ?auto_738801 ?auto_738807 ) ) ( not ( = ?auto_738801 ?auto_738808 ) ) ( not ( = ?auto_738801 ?auto_738809 ) ) ( not ( = ?auto_738801 ?auto_738810 ) ) ( not ( = ?auto_738801 ?auto_738811 ) ) ( not ( = ?auto_738801 ?auto_738812 ) ) ( not ( = ?auto_738801 ?auto_738813 ) ) ( not ( = ?auto_738801 ?auto_738814 ) ) ( not ( = ?auto_738801 ?auto_738815 ) ) ( not ( = ?auto_738801 ?auto_738816 ) ) ( not ( = ?auto_738802 ?auto_738803 ) ) ( not ( = ?auto_738802 ?auto_738804 ) ) ( not ( = ?auto_738802 ?auto_738805 ) ) ( not ( = ?auto_738802 ?auto_738806 ) ) ( not ( = ?auto_738802 ?auto_738807 ) ) ( not ( = ?auto_738802 ?auto_738808 ) ) ( not ( = ?auto_738802 ?auto_738809 ) ) ( not ( = ?auto_738802 ?auto_738810 ) ) ( not ( = ?auto_738802 ?auto_738811 ) ) ( not ( = ?auto_738802 ?auto_738812 ) ) ( not ( = ?auto_738802 ?auto_738813 ) ) ( not ( = ?auto_738802 ?auto_738814 ) ) ( not ( = ?auto_738802 ?auto_738815 ) ) ( not ( = ?auto_738802 ?auto_738816 ) ) ( not ( = ?auto_738803 ?auto_738804 ) ) ( not ( = ?auto_738803 ?auto_738805 ) ) ( not ( = ?auto_738803 ?auto_738806 ) ) ( not ( = ?auto_738803 ?auto_738807 ) ) ( not ( = ?auto_738803 ?auto_738808 ) ) ( not ( = ?auto_738803 ?auto_738809 ) ) ( not ( = ?auto_738803 ?auto_738810 ) ) ( not ( = ?auto_738803 ?auto_738811 ) ) ( not ( = ?auto_738803 ?auto_738812 ) ) ( not ( = ?auto_738803 ?auto_738813 ) ) ( not ( = ?auto_738803 ?auto_738814 ) ) ( not ( = ?auto_738803 ?auto_738815 ) ) ( not ( = ?auto_738803 ?auto_738816 ) ) ( not ( = ?auto_738804 ?auto_738805 ) ) ( not ( = ?auto_738804 ?auto_738806 ) ) ( not ( = ?auto_738804 ?auto_738807 ) ) ( not ( = ?auto_738804 ?auto_738808 ) ) ( not ( = ?auto_738804 ?auto_738809 ) ) ( not ( = ?auto_738804 ?auto_738810 ) ) ( not ( = ?auto_738804 ?auto_738811 ) ) ( not ( = ?auto_738804 ?auto_738812 ) ) ( not ( = ?auto_738804 ?auto_738813 ) ) ( not ( = ?auto_738804 ?auto_738814 ) ) ( not ( = ?auto_738804 ?auto_738815 ) ) ( not ( = ?auto_738804 ?auto_738816 ) ) ( not ( = ?auto_738805 ?auto_738806 ) ) ( not ( = ?auto_738805 ?auto_738807 ) ) ( not ( = ?auto_738805 ?auto_738808 ) ) ( not ( = ?auto_738805 ?auto_738809 ) ) ( not ( = ?auto_738805 ?auto_738810 ) ) ( not ( = ?auto_738805 ?auto_738811 ) ) ( not ( = ?auto_738805 ?auto_738812 ) ) ( not ( = ?auto_738805 ?auto_738813 ) ) ( not ( = ?auto_738805 ?auto_738814 ) ) ( not ( = ?auto_738805 ?auto_738815 ) ) ( not ( = ?auto_738805 ?auto_738816 ) ) ( not ( = ?auto_738806 ?auto_738807 ) ) ( not ( = ?auto_738806 ?auto_738808 ) ) ( not ( = ?auto_738806 ?auto_738809 ) ) ( not ( = ?auto_738806 ?auto_738810 ) ) ( not ( = ?auto_738806 ?auto_738811 ) ) ( not ( = ?auto_738806 ?auto_738812 ) ) ( not ( = ?auto_738806 ?auto_738813 ) ) ( not ( = ?auto_738806 ?auto_738814 ) ) ( not ( = ?auto_738806 ?auto_738815 ) ) ( not ( = ?auto_738806 ?auto_738816 ) ) ( not ( = ?auto_738807 ?auto_738808 ) ) ( not ( = ?auto_738807 ?auto_738809 ) ) ( not ( = ?auto_738807 ?auto_738810 ) ) ( not ( = ?auto_738807 ?auto_738811 ) ) ( not ( = ?auto_738807 ?auto_738812 ) ) ( not ( = ?auto_738807 ?auto_738813 ) ) ( not ( = ?auto_738807 ?auto_738814 ) ) ( not ( = ?auto_738807 ?auto_738815 ) ) ( not ( = ?auto_738807 ?auto_738816 ) ) ( not ( = ?auto_738808 ?auto_738809 ) ) ( not ( = ?auto_738808 ?auto_738810 ) ) ( not ( = ?auto_738808 ?auto_738811 ) ) ( not ( = ?auto_738808 ?auto_738812 ) ) ( not ( = ?auto_738808 ?auto_738813 ) ) ( not ( = ?auto_738808 ?auto_738814 ) ) ( not ( = ?auto_738808 ?auto_738815 ) ) ( not ( = ?auto_738808 ?auto_738816 ) ) ( not ( = ?auto_738809 ?auto_738810 ) ) ( not ( = ?auto_738809 ?auto_738811 ) ) ( not ( = ?auto_738809 ?auto_738812 ) ) ( not ( = ?auto_738809 ?auto_738813 ) ) ( not ( = ?auto_738809 ?auto_738814 ) ) ( not ( = ?auto_738809 ?auto_738815 ) ) ( not ( = ?auto_738809 ?auto_738816 ) ) ( not ( = ?auto_738810 ?auto_738811 ) ) ( not ( = ?auto_738810 ?auto_738812 ) ) ( not ( = ?auto_738810 ?auto_738813 ) ) ( not ( = ?auto_738810 ?auto_738814 ) ) ( not ( = ?auto_738810 ?auto_738815 ) ) ( not ( = ?auto_738810 ?auto_738816 ) ) ( not ( = ?auto_738811 ?auto_738812 ) ) ( not ( = ?auto_738811 ?auto_738813 ) ) ( not ( = ?auto_738811 ?auto_738814 ) ) ( not ( = ?auto_738811 ?auto_738815 ) ) ( not ( = ?auto_738811 ?auto_738816 ) ) ( not ( = ?auto_738812 ?auto_738813 ) ) ( not ( = ?auto_738812 ?auto_738814 ) ) ( not ( = ?auto_738812 ?auto_738815 ) ) ( not ( = ?auto_738812 ?auto_738816 ) ) ( not ( = ?auto_738813 ?auto_738814 ) ) ( not ( = ?auto_738813 ?auto_738815 ) ) ( not ( = ?auto_738813 ?auto_738816 ) ) ( not ( = ?auto_738814 ?auto_738815 ) ) ( not ( = ?auto_738814 ?auto_738816 ) ) ( not ( = ?auto_738815 ?auto_738816 ) ) ( ON ?auto_738815 ?auto_738816 ) ( ON ?auto_738814 ?auto_738815 ) ( ON ?auto_738813 ?auto_738814 ) ( CLEAR ?auto_738811 ) ( ON ?auto_738812 ?auto_738813 ) ( CLEAR ?auto_738812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_738800 ?auto_738801 ?auto_738802 ?auto_738803 ?auto_738804 ?auto_738805 ?auto_738806 ?auto_738807 ?auto_738808 ?auto_738809 ?auto_738810 ?auto_738811 ?auto_738812 )
      ( MAKE-17PILE ?auto_738800 ?auto_738801 ?auto_738802 ?auto_738803 ?auto_738804 ?auto_738805 ?auto_738806 ?auto_738807 ?auto_738808 ?auto_738809 ?auto_738810 ?auto_738811 ?auto_738812 ?auto_738813 ?auto_738814 ?auto_738815 ?auto_738816 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738834 - BLOCK
      ?auto_738835 - BLOCK
      ?auto_738836 - BLOCK
      ?auto_738837 - BLOCK
      ?auto_738838 - BLOCK
      ?auto_738839 - BLOCK
      ?auto_738840 - BLOCK
      ?auto_738841 - BLOCK
      ?auto_738842 - BLOCK
      ?auto_738843 - BLOCK
      ?auto_738844 - BLOCK
      ?auto_738845 - BLOCK
      ?auto_738846 - BLOCK
      ?auto_738847 - BLOCK
      ?auto_738848 - BLOCK
      ?auto_738849 - BLOCK
      ?auto_738850 - BLOCK
    )
    :vars
    (
      ?auto_738851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738850 ?auto_738851 ) ( ON-TABLE ?auto_738834 ) ( ON ?auto_738835 ?auto_738834 ) ( ON ?auto_738836 ?auto_738835 ) ( ON ?auto_738837 ?auto_738836 ) ( ON ?auto_738838 ?auto_738837 ) ( ON ?auto_738839 ?auto_738838 ) ( ON ?auto_738840 ?auto_738839 ) ( ON ?auto_738841 ?auto_738840 ) ( ON ?auto_738842 ?auto_738841 ) ( ON ?auto_738843 ?auto_738842 ) ( ON ?auto_738844 ?auto_738843 ) ( not ( = ?auto_738834 ?auto_738835 ) ) ( not ( = ?auto_738834 ?auto_738836 ) ) ( not ( = ?auto_738834 ?auto_738837 ) ) ( not ( = ?auto_738834 ?auto_738838 ) ) ( not ( = ?auto_738834 ?auto_738839 ) ) ( not ( = ?auto_738834 ?auto_738840 ) ) ( not ( = ?auto_738834 ?auto_738841 ) ) ( not ( = ?auto_738834 ?auto_738842 ) ) ( not ( = ?auto_738834 ?auto_738843 ) ) ( not ( = ?auto_738834 ?auto_738844 ) ) ( not ( = ?auto_738834 ?auto_738845 ) ) ( not ( = ?auto_738834 ?auto_738846 ) ) ( not ( = ?auto_738834 ?auto_738847 ) ) ( not ( = ?auto_738834 ?auto_738848 ) ) ( not ( = ?auto_738834 ?auto_738849 ) ) ( not ( = ?auto_738834 ?auto_738850 ) ) ( not ( = ?auto_738834 ?auto_738851 ) ) ( not ( = ?auto_738835 ?auto_738836 ) ) ( not ( = ?auto_738835 ?auto_738837 ) ) ( not ( = ?auto_738835 ?auto_738838 ) ) ( not ( = ?auto_738835 ?auto_738839 ) ) ( not ( = ?auto_738835 ?auto_738840 ) ) ( not ( = ?auto_738835 ?auto_738841 ) ) ( not ( = ?auto_738835 ?auto_738842 ) ) ( not ( = ?auto_738835 ?auto_738843 ) ) ( not ( = ?auto_738835 ?auto_738844 ) ) ( not ( = ?auto_738835 ?auto_738845 ) ) ( not ( = ?auto_738835 ?auto_738846 ) ) ( not ( = ?auto_738835 ?auto_738847 ) ) ( not ( = ?auto_738835 ?auto_738848 ) ) ( not ( = ?auto_738835 ?auto_738849 ) ) ( not ( = ?auto_738835 ?auto_738850 ) ) ( not ( = ?auto_738835 ?auto_738851 ) ) ( not ( = ?auto_738836 ?auto_738837 ) ) ( not ( = ?auto_738836 ?auto_738838 ) ) ( not ( = ?auto_738836 ?auto_738839 ) ) ( not ( = ?auto_738836 ?auto_738840 ) ) ( not ( = ?auto_738836 ?auto_738841 ) ) ( not ( = ?auto_738836 ?auto_738842 ) ) ( not ( = ?auto_738836 ?auto_738843 ) ) ( not ( = ?auto_738836 ?auto_738844 ) ) ( not ( = ?auto_738836 ?auto_738845 ) ) ( not ( = ?auto_738836 ?auto_738846 ) ) ( not ( = ?auto_738836 ?auto_738847 ) ) ( not ( = ?auto_738836 ?auto_738848 ) ) ( not ( = ?auto_738836 ?auto_738849 ) ) ( not ( = ?auto_738836 ?auto_738850 ) ) ( not ( = ?auto_738836 ?auto_738851 ) ) ( not ( = ?auto_738837 ?auto_738838 ) ) ( not ( = ?auto_738837 ?auto_738839 ) ) ( not ( = ?auto_738837 ?auto_738840 ) ) ( not ( = ?auto_738837 ?auto_738841 ) ) ( not ( = ?auto_738837 ?auto_738842 ) ) ( not ( = ?auto_738837 ?auto_738843 ) ) ( not ( = ?auto_738837 ?auto_738844 ) ) ( not ( = ?auto_738837 ?auto_738845 ) ) ( not ( = ?auto_738837 ?auto_738846 ) ) ( not ( = ?auto_738837 ?auto_738847 ) ) ( not ( = ?auto_738837 ?auto_738848 ) ) ( not ( = ?auto_738837 ?auto_738849 ) ) ( not ( = ?auto_738837 ?auto_738850 ) ) ( not ( = ?auto_738837 ?auto_738851 ) ) ( not ( = ?auto_738838 ?auto_738839 ) ) ( not ( = ?auto_738838 ?auto_738840 ) ) ( not ( = ?auto_738838 ?auto_738841 ) ) ( not ( = ?auto_738838 ?auto_738842 ) ) ( not ( = ?auto_738838 ?auto_738843 ) ) ( not ( = ?auto_738838 ?auto_738844 ) ) ( not ( = ?auto_738838 ?auto_738845 ) ) ( not ( = ?auto_738838 ?auto_738846 ) ) ( not ( = ?auto_738838 ?auto_738847 ) ) ( not ( = ?auto_738838 ?auto_738848 ) ) ( not ( = ?auto_738838 ?auto_738849 ) ) ( not ( = ?auto_738838 ?auto_738850 ) ) ( not ( = ?auto_738838 ?auto_738851 ) ) ( not ( = ?auto_738839 ?auto_738840 ) ) ( not ( = ?auto_738839 ?auto_738841 ) ) ( not ( = ?auto_738839 ?auto_738842 ) ) ( not ( = ?auto_738839 ?auto_738843 ) ) ( not ( = ?auto_738839 ?auto_738844 ) ) ( not ( = ?auto_738839 ?auto_738845 ) ) ( not ( = ?auto_738839 ?auto_738846 ) ) ( not ( = ?auto_738839 ?auto_738847 ) ) ( not ( = ?auto_738839 ?auto_738848 ) ) ( not ( = ?auto_738839 ?auto_738849 ) ) ( not ( = ?auto_738839 ?auto_738850 ) ) ( not ( = ?auto_738839 ?auto_738851 ) ) ( not ( = ?auto_738840 ?auto_738841 ) ) ( not ( = ?auto_738840 ?auto_738842 ) ) ( not ( = ?auto_738840 ?auto_738843 ) ) ( not ( = ?auto_738840 ?auto_738844 ) ) ( not ( = ?auto_738840 ?auto_738845 ) ) ( not ( = ?auto_738840 ?auto_738846 ) ) ( not ( = ?auto_738840 ?auto_738847 ) ) ( not ( = ?auto_738840 ?auto_738848 ) ) ( not ( = ?auto_738840 ?auto_738849 ) ) ( not ( = ?auto_738840 ?auto_738850 ) ) ( not ( = ?auto_738840 ?auto_738851 ) ) ( not ( = ?auto_738841 ?auto_738842 ) ) ( not ( = ?auto_738841 ?auto_738843 ) ) ( not ( = ?auto_738841 ?auto_738844 ) ) ( not ( = ?auto_738841 ?auto_738845 ) ) ( not ( = ?auto_738841 ?auto_738846 ) ) ( not ( = ?auto_738841 ?auto_738847 ) ) ( not ( = ?auto_738841 ?auto_738848 ) ) ( not ( = ?auto_738841 ?auto_738849 ) ) ( not ( = ?auto_738841 ?auto_738850 ) ) ( not ( = ?auto_738841 ?auto_738851 ) ) ( not ( = ?auto_738842 ?auto_738843 ) ) ( not ( = ?auto_738842 ?auto_738844 ) ) ( not ( = ?auto_738842 ?auto_738845 ) ) ( not ( = ?auto_738842 ?auto_738846 ) ) ( not ( = ?auto_738842 ?auto_738847 ) ) ( not ( = ?auto_738842 ?auto_738848 ) ) ( not ( = ?auto_738842 ?auto_738849 ) ) ( not ( = ?auto_738842 ?auto_738850 ) ) ( not ( = ?auto_738842 ?auto_738851 ) ) ( not ( = ?auto_738843 ?auto_738844 ) ) ( not ( = ?auto_738843 ?auto_738845 ) ) ( not ( = ?auto_738843 ?auto_738846 ) ) ( not ( = ?auto_738843 ?auto_738847 ) ) ( not ( = ?auto_738843 ?auto_738848 ) ) ( not ( = ?auto_738843 ?auto_738849 ) ) ( not ( = ?auto_738843 ?auto_738850 ) ) ( not ( = ?auto_738843 ?auto_738851 ) ) ( not ( = ?auto_738844 ?auto_738845 ) ) ( not ( = ?auto_738844 ?auto_738846 ) ) ( not ( = ?auto_738844 ?auto_738847 ) ) ( not ( = ?auto_738844 ?auto_738848 ) ) ( not ( = ?auto_738844 ?auto_738849 ) ) ( not ( = ?auto_738844 ?auto_738850 ) ) ( not ( = ?auto_738844 ?auto_738851 ) ) ( not ( = ?auto_738845 ?auto_738846 ) ) ( not ( = ?auto_738845 ?auto_738847 ) ) ( not ( = ?auto_738845 ?auto_738848 ) ) ( not ( = ?auto_738845 ?auto_738849 ) ) ( not ( = ?auto_738845 ?auto_738850 ) ) ( not ( = ?auto_738845 ?auto_738851 ) ) ( not ( = ?auto_738846 ?auto_738847 ) ) ( not ( = ?auto_738846 ?auto_738848 ) ) ( not ( = ?auto_738846 ?auto_738849 ) ) ( not ( = ?auto_738846 ?auto_738850 ) ) ( not ( = ?auto_738846 ?auto_738851 ) ) ( not ( = ?auto_738847 ?auto_738848 ) ) ( not ( = ?auto_738847 ?auto_738849 ) ) ( not ( = ?auto_738847 ?auto_738850 ) ) ( not ( = ?auto_738847 ?auto_738851 ) ) ( not ( = ?auto_738848 ?auto_738849 ) ) ( not ( = ?auto_738848 ?auto_738850 ) ) ( not ( = ?auto_738848 ?auto_738851 ) ) ( not ( = ?auto_738849 ?auto_738850 ) ) ( not ( = ?auto_738849 ?auto_738851 ) ) ( not ( = ?auto_738850 ?auto_738851 ) ) ( ON ?auto_738849 ?auto_738850 ) ( ON ?auto_738848 ?auto_738849 ) ( ON ?auto_738847 ?auto_738848 ) ( ON ?auto_738846 ?auto_738847 ) ( CLEAR ?auto_738844 ) ( ON ?auto_738845 ?auto_738846 ) ( CLEAR ?auto_738845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_738834 ?auto_738835 ?auto_738836 ?auto_738837 ?auto_738838 ?auto_738839 ?auto_738840 ?auto_738841 ?auto_738842 ?auto_738843 ?auto_738844 ?auto_738845 )
      ( MAKE-17PILE ?auto_738834 ?auto_738835 ?auto_738836 ?auto_738837 ?auto_738838 ?auto_738839 ?auto_738840 ?auto_738841 ?auto_738842 ?auto_738843 ?auto_738844 ?auto_738845 ?auto_738846 ?auto_738847 ?auto_738848 ?auto_738849 ?auto_738850 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738869 - BLOCK
      ?auto_738870 - BLOCK
      ?auto_738871 - BLOCK
      ?auto_738872 - BLOCK
      ?auto_738873 - BLOCK
      ?auto_738874 - BLOCK
      ?auto_738875 - BLOCK
      ?auto_738876 - BLOCK
      ?auto_738877 - BLOCK
      ?auto_738878 - BLOCK
      ?auto_738879 - BLOCK
      ?auto_738880 - BLOCK
      ?auto_738881 - BLOCK
      ?auto_738882 - BLOCK
      ?auto_738883 - BLOCK
      ?auto_738884 - BLOCK
      ?auto_738885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_738885 ) ( ON-TABLE ?auto_738869 ) ( ON ?auto_738870 ?auto_738869 ) ( ON ?auto_738871 ?auto_738870 ) ( ON ?auto_738872 ?auto_738871 ) ( ON ?auto_738873 ?auto_738872 ) ( ON ?auto_738874 ?auto_738873 ) ( ON ?auto_738875 ?auto_738874 ) ( ON ?auto_738876 ?auto_738875 ) ( ON ?auto_738877 ?auto_738876 ) ( ON ?auto_738878 ?auto_738877 ) ( ON ?auto_738879 ?auto_738878 ) ( not ( = ?auto_738869 ?auto_738870 ) ) ( not ( = ?auto_738869 ?auto_738871 ) ) ( not ( = ?auto_738869 ?auto_738872 ) ) ( not ( = ?auto_738869 ?auto_738873 ) ) ( not ( = ?auto_738869 ?auto_738874 ) ) ( not ( = ?auto_738869 ?auto_738875 ) ) ( not ( = ?auto_738869 ?auto_738876 ) ) ( not ( = ?auto_738869 ?auto_738877 ) ) ( not ( = ?auto_738869 ?auto_738878 ) ) ( not ( = ?auto_738869 ?auto_738879 ) ) ( not ( = ?auto_738869 ?auto_738880 ) ) ( not ( = ?auto_738869 ?auto_738881 ) ) ( not ( = ?auto_738869 ?auto_738882 ) ) ( not ( = ?auto_738869 ?auto_738883 ) ) ( not ( = ?auto_738869 ?auto_738884 ) ) ( not ( = ?auto_738869 ?auto_738885 ) ) ( not ( = ?auto_738870 ?auto_738871 ) ) ( not ( = ?auto_738870 ?auto_738872 ) ) ( not ( = ?auto_738870 ?auto_738873 ) ) ( not ( = ?auto_738870 ?auto_738874 ) ) ( not ( = ?auto_738870 ?auto_738875 ) ) ( not ( = ?auto_738870 ?auto_738876 ) ) ( not ( = ?auto_738870 ?auto_738877 ) ) ( not ( = ?auto_738870 ?auto_738878 ) ) ( not ( = ?auto_738870 ?auto_738879 ) ) ( not ( = ?auto_738870 ?auto_738880 ) ) ( not ( = ?auto_738870 ?auto_738881 ) ) ( not ( = ?auto_738870 ?auto_738882 ) ) ( not ( = ?auto_738870 ?auto_738883 ) ) ( not ( = ?auto_738870 ?auto_738884 ) ) ( not ( = ?auto_738870 ?auto_738885 ) ) ( not ( = ?auto_738871 ?auto_738872 ) ) ( not ( = ?auto_738871 ?auto_738873 ) ) ( not ( = ?auto_738871 ?auto_738874 ) ) ( not ( = ?auto_738871 ?auto_738875 ) ) ( not ( = ?auto_738871 ?auto_738876 ) ) ( not ( = ?auto_738871 ?auto_738877 ) ) ( not ( = ?auto_738871 ?auto_738878 ) ) ( not ( = ?auto_738871 ?auto_738879 ) ) ( not ( = ?auto_738871 ?auto_738880 ) ) ( not ( = ?auto_738871 ?auto_738881 ) ) ( not ( = ?auto_738871 ?auto_738882 ) ) ( not ( = ?auto_738871 ?auto_738883 ) ) ( not ( = ?auto_738871 ?auto_738884 ) ) ( not ( = ?auto_738871 ?auto_738885 ) ) ( not ( = ?auto_738872 ?auto_738873 ) ) ( not ( = ?auto_738872 ?auto_738874 ) ) ( not ( = ?auto_738872 ?auto_738875 ) ) ( not ( = ?auto_738872 ?auto_738876 ) ) ( not ( = ?auto_738872 ?auto_738877 ) ) ( not ( = ?auto_738872 ?auto_738878 ) ) ( not ( = ?auto_738872 ?auto_738879 ) ) ( not ( = ?auto_738872 ?auto_738880 ) ) ( not ( = ?auto_738872 ?auto_738881 ) ) ( not ( = ?auto_738872 ?auto_738882 ) ) ( not ( = ?auto_738872 ?auto_738883 ) ) ( not ( = ?auto_738872 ?auto_738884 ) ) ( not ( = ?auto_738872 ?auto_738885 ) ) ( not ( = ?auto_738873 ?auto_738874 ) ) ( not ( = ?auto_738873 ?auto_738875 ) ) ( not ( = ?auto_738873 ?auto_738876 ) ) ( not ( = ?auto_738873 ?auto_738877 ) ) ( not ( = ?auto_738873 ?auto_738878 ) ) ( not ( = ?auto_738873 ?auto_738879 ) ) ( not ( = ?auto_738873 ?auto_738880 ) ) ( not ( = ?auto_738873 ?auto_738881 ) ) ( not ( = ?auto_738873 ?auto_738882 ) ) ( not ( = ?auto_738873 ?auto_738883 ) ) ( not ( = ?auto_738873 ?auto_738884 ) ) ( not ( = ?auto_738873 ?auto_738885 ) ) ( not ( = ?auto_738874 ?auto_738875 ) ) ( not ( = ?auto_738874 ?auto_738876 ) ) ( not ( = ?auto_738874 ?auto_738877 ) ) ( not ( = ?auto_738874 ?auto_738878 ) ) ( not ( = ?auto_738874 ?auto_738879 ) ) ( not ( = ?auto_738874 ?auto_738880 ) ) ( not ( = ?auto_738874 ?auto_738881 ) ) ( not ( = ?auto_738874 ?auto_738882 ) ) ( not ( = ?auto_738874 ?auto_738883 ) ) ( not ( = ?auto_738874 ?auto_738884 ) ) ( not ( = ?auto_738874 ?auto_738885 ) ) ( not ( = ?auto_738875 ?auto_738876 ) ) ( not ( = ?auto_738875 ?auto_738877 ) ) ( not ( = ?auto_738875 ?auto_738878 ) ) ( not ( = ?auto_738875 ?auto_738879 ) ) ( not ( = ?auto_738875 ?auto_738880 ) ) ( not ( = ?auto_738875 ?auto_738881 ) ) ( not ( = ?auto_738875 ?auto_738882 ) ) ( not ( = ?auto_738875 ?auto_738883 ) ) ( not ( = ?auto_738875 ?auto_738884 ) ) ( not ( = ?auto_738875 ?auto_738885 ) ) ( not ( = ?auto_738876 ?auto_738877 ) ) ( not ( = ?auto_738876 ?auto_738878 ) ) ( not ( = ?auto_738876 ?auto_738879 ) ) ( not ( = ?auto_738876 ?auto_738880 ) ) ( not ( = ?auto_738876 ?auto_738881 ) ) ( not ( = ?auto_738876 ?auto_738882 ) ) ( not ( = ?auto_738876 ?auto_738883 ) ) ( not ( = ?auto_738876 ?auto_738884 ) ) ( not ( = ?auto_738876 ?auto_738885 ) ) ( not ( = ?auto_738877 ?auto_738878 ) ) ( not ( = ?auto_738877 ?auto_738879 ) ) ( not ( = ?auto_738877 ?auto_738880 ) ) ( not ( = ?auto_738877 ?auto_738881 ) ) ( not ( = ?auto_738877 ?auto_738882 ) ) ( not ( = ?auto_738877 ?auto_738883 ) ) ( not ( = ?auto_738877 ?auto_738884 ) ) ( not ( = ?auto_738877 ?auto_738885 ) ) ( not ( = ?auto_738878 ?auto_738879 ) ) ( not ( = ?auto_738878 ?auto_738880 ) ) ( not ( = ?auto_738878 ?auto_738881 ) ) ( not ( = ?auto_738878 ?auto_738882 ) ) ( not ( = ?auto_738878 ?auto_738883 ) ) ( not ( = ?auto_738878 ?auto_738884 ) ) ( not ( = ?auto_738878 ?auto_738885 ) ) ( not ( = ?auto_738879 ?auto_738880 ) ) ( not ( = ?auto_738879 ?auto_738881 ) ) ( not ( = ?auto_738879 ?auto_738882 ) ) ( not ( = ?auto_738879 ?auto_738883 ) ) ( not ( = ?auto_738879 ?auto_738884 ) ) ( not ( = ?auto_738879 ?auto_738885 ) ) ( not ( = ?auto_738880 ?auto_738881 ) ) ( not ( = ?auto_738880 ?auto_738882 ) ) ( not ( = ?auto_738880 ?auto_738883 ) ) ( not ( = ?auto_738880 ?auto_738884 ) ) ( not ( = ?auto_738880 ?auto_738885 ) ) ( not ( = ?auto_738881 ?auto_738882 ) ) ( not ( = ?auto_738881 ?auto_738883 ) ) ( not ( = ?auto_738881 ?auto_738884 ) ) ( not ( = ?auto_738881 ?auto_738885 ) ) ( not ( = ?auto_738882 ?auto_738883 ) ) ( not ( = ?auto_738882 ?auto_738884 ) ) ( not ( = ?auto_738882 ?auto_738885 ) ) ( not ( = ?auto_738883 ?auto_738884 ) ) ( not ( = ?auto_738883 ?auto_738885 ) ) ( not ( = ?auto_738884 ?auto_738885 ) ) ( ON ?auto_738884 ?auto_738885 ) ( ON ?auto_738883 ?auto_738884 ) ( ON ?auto_738882 ?auto_738883 ) ( ON ?auto_738881 ?auto_738882 ) ( CLEAR ?auto_738879 ) ( ON ?auto_738880 ?auto_738881 ) ( CLEAR ?auto_738880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_738869 ?auto_738870 ?auto_738871 ?auto_738872 ?auto_738873 ?auto_738874 ?auto_738875 ?auto_738876 ?auto_738877 ?auto_738878 ?auto_738879 ?auto_738880 )
      ( MAKE-17PILE ?auto_738869 ?auto_738870 ?auto_738871 ?auto_738872 ?auto_738873 ?auto_738874 ?auto_738875 ?auto_738876 ?auto_738877 ?auto_738878 ?auto_738879 ?auto_738880 ?auto_738881 ?auto_738882 ?auto_738883 ?auto_738884 ?auto_738885 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738903 - BLOCK
      ?auto_738904 - BLOCK
      ?auto_738905 - BLOCK
      ?auto_738906 - BLOCK
      ?auto_738907 - BLOCK
      ?auto_738908 - BLOCK
      ?auto_738909 - BLOCK
      ?auto_738910 - BLOCK
      ?auto_738911 - BLOCK
      ?auto_738912 - BLOCK
      ?auto_738913 - BLOCK
      ?auto_738914 - BLOCK
      ?auto_738915 - BLOCK
      ?auto_738916 - BLOCK
      ?auto_738917 - BLOCK
      ?auto_738918 - BLOCK
      ?auto_738919 - BLOCK
    )
    :vars
    (
      ?auto_738920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738919 ?auto_738920 ) ( ON-TABLE ?auto_738903 ) ( ON ?auto_738904 ?auto_738903 ) ( ON ?auto_738905 ?auto_738904 ) ( ON ?auto_738906 ?auto_738905 ) ( ON ?auto_738907 ?auto_738906 ) ( ON ?auto_738908 ?auto_738907 ) ( ON ?auto_738909 ?auto_738908 ) ( ON ?auto_738910 ?auto_738909 ) ( ON ?auto_738911 ?auto_738910 ) ( ON ?auto_738912 ?auto_738911 ) ( not ( = ?auto_738903 ?auto_738904 ) ) ( not ( = ?auto_738903 ?auto_738905 ) ) ( not ( = ?auto_738903 ?auto_738906 ) ) ( not ( = ?auto_738903 ?auto_738907 ) ) ( not ( = ?auto_738903 ?auto_738908 ) ) ( not ( = ?auto_738903 ?auto_738909 ) ) ( not ( = ?auto_738903 ?auto_738910 ) ) ( not ( = ?auto_738903 ?auto_738911 ) ) ( not ( = ?auto_738903 ?auto_738912 ) ) ( not ( = ?auto_738903 ?auto_738913 ) ) ( not ( = ?auto_738903 ?auto_738914 ) ) ( not ( = ?auto_738903 ?auto_738915 ) ) ( not ( = ?auto_738903 ?auto_738916 ) ) ( not ( = ?auto_738903 ?auto_738917 ) ) ( not ( = ?auto_738903 ?auto_738918 ) ) ( not ( = ?auto_738903 ?auto_738919 ) ) ( not ( = ?auto_738903 ?auto_738920 ) ) ( not ( = ?auto_738904 ?auto_738905 ) ) ( not ( = ?auto_738904 ?auto_738906 ) ) ( not ( = ?auto_738904 ?auto_738907 ) ) ( not ( = ?auto_738904 ?auto_738908 ) ) ( not ( = ?auto_738904 ?auto_738909 ) ) ( not ( = ?auto_738904 ?auto_738910 ) ) ( not ( = ?auto_738904 ?auto_738911 ) ) ( not ( = ?auto_738904 ?auto_738912 ) ) ( not ( = ?auto_738904 ?auto_738913 ) ) ( not ( = ?auto_738904 ?auto_738914 ) ) ( not ( = ?auto_738904 ?auto_738915 ) ) ( not ( = ?auto_738904 ?auto_738916 ) ) ( not ( = ?auto_738904 ?auto_738917 ) ) ( not ( = ?auto_738904 ?auto_738918 ) ) ( not ( = ?auto_738904 ?auto_738919 ) ) ( not ( = ?auto_738904 ?auto_738920 ) ) ( not ( = ?auto_738905 ?auto_738906 ) ) ( not ( = ?auto_738905 ?auto_738907 ) ) ( not ( = ?auto_738905 ?auto_738908 ) ) ( not ( = ?auto_738905 ?auto_738909 ) ) ( not ( = ?auto_738905 ?auto_738910 ) ) ( not ( = ?auto_738905 ?auto_738911 ) ) ( not ( = ?auto_738905 ?auto_738912 ) ) ( not ( = ?auto_738905 ?auto_738913 ) ) ( not ( = ?auto_738905 ?auto_738914 ) ) ( not ( = ?auto_738905 ?auto_738915 ) ) ( not ( = ?auto_738905 ?auto_738916 ) ) ( not ( = ?auto_738905 ?auto_738917 ) ) ( not ( = ?auto_738905 ?auto_738918 ) ) ( not ( = ?auto_738905 ?auto_738919 ) ) ( not ( = ?auto_738905 ?auto_738920 ) ) ( not ( = ?auto_738906 ?auto_738907 ) ) ( not ( = ?auto_738906 ?auto_738908 ) ) ( not ( = ?auto_738906 ?auto_738909 ) ) ( not ( = ?auto_738906 ?auto_738910 ) ) ( not ( = ?auto_738906 ?auto_738911 ) ) ( not ( = ?auto_738906 ?auto_738912 ) ) ( not ( = ?auto_738906 ?auto_738913 ) ) ( not ( = ?auto_738906 ?auto_738914 ) ) ( not ( = ?auto_738906 ?auto_738915 ) ) ( not ( = ?auto_738906 ?auto_738916 ) ) ( not ( = ?auto_738906 ?auto_738917 ) ) ( not ( = ?auto_738906 ?auto_738918 ) ) ( not ( = ?auto_738906 ?auto_738919 ) ) ( not ( = ?auto_738906 ?auto_738920 ) ) ( not ( = ?auto_738907 ?auto_738908 ) ) ( not ( = ?auto_738907 ?auto_738909 ) ) ( not ( = ?auto_738907 ?auto_738910 ) ) ( not ( = ?auto_738907 ?auto_738911 ) ) ( not ( = ?auto_738907 ?auto_738912 ) ) ( not ( = ?auto_738907 ?auto_738913 ) ) ( not ( = ?auto_738907 ?auto_738914 ) ) ( not ( = ?auto_738907 ?auto_738915 ) ) ( not ( = ?auto_738907 ?auto_738916 ) ) ( not ( = ?auto_738907 ?auto_738917 ) ) ( not ( = ?auto_738907 ?auto_738918 ) ) ( not ( = ?auto_738907 ?auto_738919 ) ) ( not ( = ?auto_738907 ?auto_738920 ) ) ( not ( = ?auto_738908 ?auto_738909 ) ) ( not ( = ?auto_738908 ?auto_738910 ) ) ( not ( = ?auto_738908 ?auto_738911 ) ) ( not ( = ?auto_738908 ?auto_738912 ) ) ( not ( = ?auto_738908 ?auto_738913 ) ) ( not ( = ?auto_738908 ?auto_738914 ) ) ( not ( = ?auto_738908 ?auto_738915 ) ) ( not ( = ?auto_738908 ?auto_738916 ) ) ( not ( = ?auto_738908 ?auto_738917 ) ) ( not ( = ?auto_738908 ?auto_738918 ) ) ( not ( = ?auto_738908 ?auto_738919 ) ) ( not ( = ?auto_738908 ?auto_738920 ) ) ( not ( = ?auto_738909 ?auto_738910 ) ) ( not ( = ?auto_738909 ?auto_738911 ) ) ( not ( = ?auto_738909 ?auto_738912 ) ) ( not ( = ?auto_738909 ?auto_738913 ) ) ( not ( = ?auto_738909 ?auto_738914 ) ) ( not ( = ?auto_738909 ?auto_738915 ) ) ( not ( = ?auto_738909 ?auto_738916 ) ) ( not ( = ?auto_738909 ?auto_738917 ) ) ( not ( = ?auto_738909 ?auto_738918 ) ) ( not ( = ?auto_738909 ?auto_738919 ) ) ( not ( = ?auto_738909 ?auto_738920 ) ) ( not ( = ?auto_738910 ?auto_738911 ) ) ( not ( = ?auto_738910 ?auto_738912 ) ) ( not ( = ?auto_738910 ?auto_738913 ) ) ( not ( = ?auto_738910 ?auto_738914 ) ) ( not ( = ?auto_738910 ?auto_738915 ) ) ( not ( = ?auto_738910 ?auto_738916 ) ) ( not ( = ?auto_738910 ?auto_738917 ) ) ( not ( = ?auto_738910 ?auto_738918 ) ) ( not ( = ?auto_738910 ?auto_738919 ) ) ( not ( = ?auto_738910 ?auto_738920 ) ) ( not ( = ?auto_738911 ?auto_738912 ) ) ( not ( = ?auto_738911 ?auto_738913 ) ) ( not ( = ?auto_738911 ?auto_738914 ) ) ( not ( = ?auto_738911 ?auto_738915 ) ) ( not ( = ?auto_738911 ?auto_738916 ) ) ( not ( = ?auto_738911 ?auto_738917 ) ) ( not ( = ?auto_738911 ?auto_738918 ) ) ( not ( = ?auto_738911 ?auto_738919 ) ) ( not ( = ?auto_738911 ?auto_738920 ) ) ( not ( = ?auto_738912 ?auto_738913 ) ) ( not ( = ?auto_738912 ?auto_738914 ) ) ( not ( = ?auto_738912 ?auto_738915 ) ) ( not ( = ?auto_738912 ?auto_738916 ) ) ( not ( = ?auto_738912 ?auto_738917 ) ) ( not ( = ?auto_738912 ?auto_738918 ) ) ( not ( = ?auto_738912 ?auto_738919 ) ) ( not ( = ?auto_738912 ?auto_738920 ) ) ( not ( = ?auto_738913 ?auto_738914 ) ) ( not ( = ?auto_738913 ?auto_738915 ) ) ( not ( = ?auto_738913 ?auto_738916 ) ) ( not ( = ?auto_738913 ?auto_738917 ) ) ( not ( = ?auto_738913 ?auto_738918 ) ) ( not ( = ?auto_738913 ?auto_738919 ) ) ( not ( = ?auto_738913 ?auto_738920 ) ) ( not ( = ?auto_738914 ?auto_738915 ) ) ( not ( = ?auto_738914 ?auto_738916 ) ) ( not ( = ?auto_738914 ?auto_738917 ) ) ( not ( = ?auto_738914 ?auto_738918 ) ) ( not ( = ?auto_738914 ?auto_738919 ) ) ( not ( = ?auto_738914 ?auto_738920 ) ) ( not ( = ?auto_738915 ?auto_738916 ) ) ( not ( = ?auto_738915 ?auto_738917 ) ) ( not ( = ?auto_738915 ?auto_738918 ) ) ( not ( = ?auto_738915 ?auto_738919 ) ) ( not ( = ?auto_738915 ?auto_738920 ) ) ( not ( = ?auto_738916 ?auto_738917 ) ) ( not ( = ?auto_738916 ?auto_738918 ) ) ( not ( = ?auto_738916 ?auto_738919 ) ) ( not ( = ?auto_738916 ?auto_738920 ) ) ( not ( = ?auto_738917 ?auto_738918 ) ) ( not ( = ?auto_738917 ?auto_738919 ) ) ( not ( = ?auto_738917 ?auto_738920 ) ) ( not ( = ?auto_738918 ?auto_738919 ) ) ( not ( = ?auto_738918 ?auto_738920 ) ) ( not ( = ?auto_738919 ?auto_738920 ) ) ( ON ?auto_738918 ?auto_738919 ) ( ON ?auto_738917 ?auto_738918 ) ( ON ?auto_738916 ?auto_738917 ) ( ON ?auto_738915 ?auto_738916 ) ( ON ?auto_738914 ?auto_738915 ) ( CLEAR ?auto_738912 ) ( ON ?auto_738913 ?auto_738914 ) ( CLEAR ?auto_738913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_738903 ?auto_738904 ?auto_738905 ?auto_738906 ?auto_738907 ?auto_738908 ?auto_738909 ?auto_738910 ?auto_738911 ?auto_738912 ?auto_738913 )
      ( MAKE-17PILE ?auto_738903 ?auto_738904 ?auto_738905 ?auto_738906 ?auto_738907 ?auto_738908 ?auto_738909 ?auto_738910 ?auto_738911 ?auto_738912 ?auto_738913 ?auto_738914 ?auto_738915 ?auto_738916 ?auto_738917 ?auto_738918 ?auto_738919 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738938 - BLOCK
      ?auto_738939 - BLOCK
      ?auto_738940 - BLOCK
      ?auto_738941 - BLOCK
      ?auto_738942 - BLOCK
      ?auto_738943 - BLOCK
      ?auto_738944 - BLOCK
      ?auto_738945 - BLOCK
      ?auto_738946 - BLOCK
      ?auto_738947 - BLOCK
      ?auto_738948 - BLOCK
      ?auto_738949 - BLOCK
      ?auto_738950 - BLOCK
      ?auto_738951 - BLOCK
      ?auto_738952 - BLOCK
      ?auto_738953 - BLOCK
      ?auto_738954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_738954 ) ( ON-TABLE ?auto_738938 ) ( ON ?auto_738939 ?auto_738938 ) ( ON ?auto_738940 ?auto_738939 ) ( ON ?auto_738941 ?auto_738940 ) ( ON ?auto_738942 ?auto_738941 ) ( ON ?auto_738943 ?auto_738942 ) ( ON ?auto_738944 ?auto_738943 ) ( ON ?auto_738945 ?auto_738944 ) ( ON ?auto_738946 ?auto_738945 ) ( ON ?auto_738947 ?auto_738946 ) ( not ( = ?auto_738938 ?auto_738939 ) ) ( not ( = ?auto_738938 ?auto_738940 ) ) ( not ( = ?auto_738938 ?auto_738941 ) ) ( not ( = ?auto_738938 ?auto_738942 ) ) ( not ( = ?auto_738938 ?auto_738943 ) ) ( not ( = ?auto_738938 ?auto_738944 ) ) ( not ( = ?auto_738938 ?auto_738945 ) ) ( not ( = ?auto_738938 ?auto_738946 ) ) ( not ( = ?auto_738938 ?auto_738947 ) ) ( not ( = ?auto_738938 ?auto_738948 ) ) ( not ( = ?auto_738938 ?auto_738949 ) ) ( not ( = ?auto_738938 ?auto_738950 ) ) ( not ( = ?auto_738938 ?auto_738951 ) ) ( not ( = ?auto_738938 ?auto_738952 ) ) ( not ( = ?auto_738938 ?auto_738953 ) ) ( not ( = ?auto_738938 ?auto_738954 ) ) ( not ( = ?auto_738939 ?auto_738940 ) ) ( not ( = ?auto_738939 ?auto_738941 ) ) ( not ( = ?auto_738939 ?auto_738942 ) ) ( not ( = ?auto_738939 ?auto_738943 ) ) ( not ( = ?auto_738939 ?auto_738944 ) ) ( not ( = ?auto_738939 ?auto_738945 ) ) ( not ( = ?auto_738939 ?auto_738946 ) ) ( not ( = ?auto_738939 ?auto_738947 ) ) ( not ( = ?auto_738939 ?auto_738948 ) ) ( not ( = ?auto_738939 ?auto_738949 ) ) ( not ( = ?auto_738939 ?auto_738950 ) ) ( not ( = ?auto_738939 ?auto_738951 ) ) ( not ( = ?auto_738939 ?auto_738952 ) ) ( not ( = ?auto_738939 ?auto_738953 ) ) ( not ( = ?auto_738939 ?auto_738954 ) ) ( not ( = ?auto_738940 ?auto_738941 ) ) ( not ( = ?auto_738940 ?auto_738942 ) ) ( not ( = ?auto_738940 ?auto_738943 ) ) ( not ( = ?auto_738940 ?auto_738944 ) ) ( not ( = ?auto_738940 ?auto_738945 ) ) ( not ( = ?auto_738940 ?auto_738946 ) ) ( not ( = ?auto_738940 ?auto_738947 ) ) ( not ( = ?auto_738940 ?auto_738948 ) ) ( not ( = ?auto_738940 ?auto_738949 ) ) ( not ( = ?auto_738940 ?auto_738950 ) ) ( not ( = ?auto_738940 ?auto_738951 ) ) ( not ( = ?auto_738940 ?auto_738952 ) ) ( not ( = ?auto_738940 ?auto_738953 ) ) ( not ( = ?auto_738940 ?auto_738954 ) ) ( not ( = ?auto_738941 ?auto_738942 ) ) ( not ( = ?auto_738941 ?auto_738943 ) ) ( not ( = ?auto_738941 ?auto_738944 ) ) ( not ( = ?auto_738941 ?auto_738945 ) ) ( not ( = ?auto_738941 ?auto_738946 ) ) ( not ( = ?auto_738941 ?auto_738947 ) ) ( not ( = ?auto_738941 ?auto_738948 ) ) ( not ( = ?auto_738941 ?auto_738949 ) ) ( not ( = ?auto_738941 ?auto_738950 ) ) ( not ( = ?auto_738941 ?auto_738951 ) ) ( not ( = ?auto_738941 ?auto_738952 ) ) ( not ( = ?auto_738941 ?auto_738953 ) ) ( not ( = ?auto_738941 ?auto_738954 ) ) ( not ( = ?auto_738942 ?auto_738943 ) ) ( not ( = ?auto_738942 ?auto_738944 ) ) ( not ( = ?auto_738942 ?auto_738945 ) ) ( not ( = ?auto_738942 ?auto_738946 ) ) ( not ( = ?auto_738942 ?auto_738947 ) ) ( not ( = ?auto_738942 ?auto_738948 ) ) ( not ( = ?auto_738942 ?auto_738949 ) ) ( not ( = ?auto_738942 ?auto_738950 ) ) ( not ( = ?auto_738942 ?auto_738951 ) ) ( not ( = ?auto_738942 ?auto_738952 ) ) ( not ( = ?auto_738942 ?auto_738953 ) ) ( not ( = ?auto_738942 ?auto_738954 ) ) ( not ( = ?auto_738943 ?auto_738944 ) ) ( not ( = ?auto_738943 ?auto_738945 ) ) ( not ( = ?auto_738943 ?auto_738946 ) ) ( not ( = ?auto_738943 ?auto_738947 ) ) ( not ( = ?auto_738943 ?auto_738948 ) ) ( not ( = ?auto_738943 ?auto_738949 ) ) ( not ( = ?auto_738943 ?auto_738950 ) ) ( not ( = ?auto_738943 ?auto_738951 ) ) ( not ( = ?auto_738943 ?auto_738952 ) ) ( not ( = ?auto_738943 ?auto_738953 ) ) ( not ( = ?auto_738943 ?auto_738954 ) ) ( not ( = ?auto_738944 ?auto_738945 ) ) ( not ( = ?auto_738944 ?auto_738946 ) ) ( not ( = ?auto_738944 ?auto_738947 ) ) ( not ( = ?auto_738944 ?auto_738948 ) ) ( not ( = ?auto_738944 ?auto_738949 ) ) ( not ( = ?auto_738944 ?auto_738950 ) ) ( not ( = ?auto_738944 ?auto_738951 ) ) ( not ( = ?auto_738944 ?auto_738952 ) ) ( not ( = ?auto_738944 ?auto_738953 ) ) ( not ( = ?auto_738944 ?auto_738954 ) ) ( not ( = ?auto_738945 ?auto_738946 ) ) ( not ( = ?auto_738945 ?auto_738947 ) ) ( not ( = ?auto_738945 ?auto_738948 ) ) ( not ( = ?auto_738945 ?auto_738949 ) ) ( not ( = ?auto_738945 ?auto_738950 ) ) ( not ( = ?auto_738945 ?auto_738951 ) ) ( not ( = ?auto_738945 ?auto_738952 ) ) ( not ( = ?auto_738945 ?auto_738953 ) ) ( not ( = ?auto_738945 ?auto_738954 ) ) ( not ( = ?auto_738946 ?auto_738947 ) ) ( not ( = ?auto_738946 ?auto_738948 ) ) ( not ( = ?auto_738946 ?auto_738949 ) ) ( not ( = ?auto_738946 ?auto_738950 ) ) ( not ( = ?auto_738946 ?auto_738951 ) ) ( not ( = ?auto_738946 ?auto_738952 ) ) ( not ( = ?auto_738946 ?auto_738953 ) ) ( not ( = ?auto_738946 ?auto_738954 ) ) ( not ( = ?auto_738947 ?auto_738948 ) ) ( not ( = ?auto_738947 ?auto_738949 ) ) ( not ( = ?auto_738947 ?auto_738950 ) ) ( not ( = ?auto_738947 ?auto_738951 ) ) ( not ( = ?auto_738947 ?auto_738952 ) ) ( not ( = ?auto_738947 ?auto_738953 ) ) ( not ( = ?auto_738947 ?auto_738954 ) ) ( not ( = ?auto_738948 ?auto_738949 ) ) ( not ( = ?auto_738948 ?auto_738950 ) ) ( not ( = ?auto_738948 ?auto_738951 ) ) ( not ( = ?auto_738948 ?auto_738952 ) ) ( not ( = ?auto_738948 ?auto_738953 ) ) ( not ( = ?auto_738948 ?auto_738954 ) ) ( not ( = ?auto_738949 ?auto_738950 ) ) ( not ( = ?auto_738949 ?auto_738951 ) ) ( not ( = ?auto_738949 ?auto_738952 ) ) ( not ( = ?auto_738949 ?auto_738953 ) ) ( not ( = ?auto_738949 ?auto_738954 ) ) ( not ( = ?auto_738950 ?auto_738951 ) ) ( not ( = ?auto_738950 ?auto_738952 ) ) ( not ( = ?auto_738950 ?auto_738953 ) ) ( not ( = ?auto_738950 ?auto_738954 ) ) ( not ( = ?auto_738951 ?auto_738952 ) ) ( not ( = ?auto_738951 ?auto_738953 ) ) ( not ( = ?auto_738951 ?auto_738954 ) ) ( not ( = ?auto_738952 ?auto_738953 ) ) ( not ( = ?auto_738952 ?auto_738954 ) ) ( not ( = ?auto_738953 ?auto_738954 ) ) ( ON ?auto_738953 ?auto_738954 ) ( ON ?auto_738952 ?auto_738953 ) ( ON ?auto_738951 ?auto_738952 ) ( ON ?auto_738950 ?auto_738951 ) ( ON ?auto_738949 ?auto_738950 ) ( CLEAR ?auto_738947 ) ( ON ?auto_738948 ?auto_738949 ) ( CLEAR ?auto_738948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_738938 ?auto_738939 ?auto_738940 ?auto_738941 ?auto_738942 ?auto_738943 ?auto_738944 ?auto_738945 ?auto_738946 ?auto_738947 ?auto_738948 )
      ( MAKE-17PILE ?auto_738938 ?auto_738939 ?auto_738940 ?auto_738941 ?auto_738942 ?auto_738943 ?auto_738944 ?auto_738945 ?auto_738946 ?auto_738947 ?auto_738948 ?auto_738949 ?auto_738950 ?auto_738951 ?auto_738952 ?auto_738953 ?auto_738954 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_738972 - BLOCK
      ?auto_738973 - BLOCK
      ?auto_738974 - BLOCK
      ?auto_738975 - BLOCK
      ?auto_738976 - BLOCK
      ?auto_738977 - BLOCK
      ?auto_738978 - BLOCK
      ?auto_738979 - BLOCK
      ?auto_738980 - BLOCK
      ?auto_738981 - BLOCK
      ?auto_738982 - BLOCK
      ?auto_738983 - BLOCK
      ?auto_738984 - BLOCK
      ?auto_738985 - BLOCK
      ?auto_738986 - BLOCK
      ?auto_738987 - BLOCK
      ?auto_738988 - BLOCK
    )
    :vars
    (
      ?auto_738989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_738988 ?auto_738989 ) ( ON-TABLE ?auto_738972 ) ( ON ?auto_738973 ?auto_738972 ) ( ON ?auto_738974 ?auto_738973 ) ( ON ?auto_738975 ?auto_738974 ) ( ON ?auto_738976 ?auto_738975 ) ( ON ?auto_738977 ?auto_738976 ) ( ON ?auto_738978 ?auto_738977 ) ( ON ?auto_738979 ?auto_738978 ) ( ON ?auto_738980 ?auto_738979 ) ( not ( = ?auto_738972 ?auto_738973 ) ) ( not ( = ?auto_738972 ?auto_738974 ) ) ( not ( = ?auto_738972 ?auto_738975 ) ) ( not ( = ?auto_738972 ?auto_738976 ) ) ( not ( = ?auto_738972 ?auto_738977 ) ) ( not ( = ?auto_738972 ?auto_738978 ) ) ( not ( = ?auto_738972 ?auto_738979 ) ) ( not ( = ?auto_738972 ?auto_738980 ) ) ( not ( = ?auto_738972 ?auto_738981 ) ) ( not ( = ?auto_738972 ?auto_738982 ) ) ( not ( = ?auto_738972 ?auto_738983 ) ) ( not ( = ?auto_738972 ?auto_738984 ) ) ( not ( = ?auto_738972 ?auto_738985 ) ) ( not ( = ?auto_738972 ?auto_738986 ) ) ( not ( = ?auto_738972 ?auto_738987 ) ) ( not ( = ?auto_738972 ?auto_738988 ) ) ( not ( = ?auto_738972 ?auto_738989 ) ) ( not ( = ?auto_738973 ?auto_738974 ) ) ( not ( = ?auto_738973 ?auto_738975 ) ) ( not ( = ?auto_738973 ?auto_738976 ) ) ( not ( = ?auto_738973 ?auto_738977 ) ) ( not ( = ?auto_738973 ?auto_738978 ) ) ( not ( = ?auto_738973 ?auto_738979 ) ) ( not ( = ?auto_738973 ?auto_738980 ) ) ( not ( = ?auto_738973 ?auto_738981 ) ) ( not ( = ?auto_738973 ?auto_738982 ) ) ( not ( = ?auto_738973 ?auto_738983 ) ) ( not ( = ?auto_738973 ?auto_738984 ) ) ( not ( = ?auto_738973 ?auto_738985 ) ) ( not ( = ?auto_738973 ?auto_738986 ) ) ( not ( = ?auto_738973 ?auto_738987 ) ) ( not ( = ?auto_738973 ?auto_738988 ) ) ( not ( = ?auto_738973 ?auto_738989 ) ) ( not ( = ?auto_738974 ?auto_738975 ) ) ( not ( = ?auto_738974 ?auto_738976 ) ) ( not ( = ?auto_738974 ?auto_738977 ) ) ( not ( = ?auto_738974 ?auto_738978 ) ) ( not ( = ?auto_738974 ?auto_738979 ) ) ( not ( = ?auto_738974 ?auto_738980 ) ) ( not ( = ?auto_738974 ?auto_738981 ) ) ( not ( = ?auto_738974 ?auto_738982 ) ) ( not ( = ?auto_738974 ?auto_738983 ) ) ( not ( = ?auto_738974 ?auto_738984 ) ) ( not ( = ?auto_738974 ?auto_738985 ) ) ( not ( = ?auto_738974 ?auto_738986 ) ) ( not ( = ?auto_738974 ?auto_738987 ) ) ( not ( = ?auto_738974 ?auto_738988 ) ) ( not ( = ?auto_738974 ?auto_738989 ) ) ( not ( = ?auto_738975 ?auto_738976 ) ) ( not ( = ?auto_738975 ?auto_738977 ) ) ( not ( = ?auto_738975 ?auto_738978 ) ) ( not ( = ?auto_738975 ?auto_738979 ) ) ( not ( = ?auto_738975 ?auto_738980 ) ) ( not ( = ?auto_738975 ?auto_738981 ) ) ( not ( = ?auto_738975 ?auto_738982 ) ) ( not ( = ?auto_738975 ?auto_738983 ) ) ( not ( = ?auto_738975 ?auto_738984 ) ) ( not ( = ?auto_738975 ?auto_738985 ) ) ( not ( = ?auto_738975 ?auto_738986 ) ) ( not ( = ?auto_738975 ?auto_738987 ) ) ( not ( = ?auto_738975 ?auto_738988 ) ) ( not ( = ?auto_738975 ?auto_738989 ) ) ( not ( = ?auto_738976 ?auto_738977 ) ) ( not ( = ?auto_738976 ?auto_738978 ) ) ( not ( = ?auto_738976 ?auto_738979 ) ) ( not ( = ?auto_738976 ?auto_738980 ) ) ( not ( = ?auto_738976 ?auto_738981 ) ) ( not ( = ?auto_738976 ?auto_738982 ) ) ( not ( = ?auto_738976 ?auto_738983 ) ) ( not ( = ?auto_738976 ?auto_738984 ) ) ( not ( = ?auto_738976 ?auto_738985 ) ) ( not ( = ?auto_738976 ?auto_738986 ) ) ( not ( = ?auto_738976 ?auto_738987 ) ) ( not ( = ?auto_738976 ?auto_738988 ) ) ( not ( = ?auto_738976 ?auto_738989 ) ) ( not ( = ?auto_738977 ?auto_738978 ) ) ( not ( = ?auto_738977 ?auto_738979 ) ) ( not ( = ?auto_738977 ?auto_738980 ) ) ( not ( = ?auto_738977 ?auto_738981 ) ) ( not ( = ?auto_738977 ?auto_738982 ) ) ( not ( = ?auto_738977 ?auto_738983 ) ) ( not ( = ?auto_738977 ?auto_738984 ) ) ( not ( = ?auto_738977 ?auto_738985 ) ) ( not ( = ?auto_738977 ?auto_738986 ) ) ( not ( = ?auto_738977 ?auto_738987 ) ) ( not ( = ?auto_738977 ?auto_738988 ) ) ( not ( = ?auto_738977 ?auto_738989 ) ) ( not ( = ?auto_738978 ?auto_738979 ) ) ( not ( = ?auto_738978 ?auto_738980 ) ) ( not ( = ?auto_738978 ?auto_738981 ) ) ( not ( = ?auto_738978 ?auto_738982 ) ) ( not ( = ?auto_738978 ?auto_738983 ) ) ( not ( = ?auto_738978 ?auto_738984 ) ) ( not ( = ?auto_738978 ?auto_738985 ) ) ( not ( = ?auto_738978 ?auto_738986 ) ) ( not ( = ?auto_738978 ?auto_738987 ) ) ( not ( = ?auto_738978 ?auto_738988 ) ) ( not ( = ?auto_738978 ?auto_738989 ) ) ( not ( = ?auto_738979 ?auto_738980 ) ) ( not ( = ?auto_738979 ?auto_738981 ) ) ( not ( = ?auto_738979 ?auto_738982 ) ) ( not ( = ?auto_738979 ?auto_738983 ) ) ( not ( = ?auto_738979 ?auto_738984 ) ) ( not ( = ?auto_738979 ?auto_738985 ) ) ( not ( = ?auto_738979 ?auto_738986 ) ) ( not ( = ?auto_738979 ?auto_738987 ) ) ( not ( = ?auto_738979 ?auto_738988 ) ) ( not ( = ?auto_738979 ?auto_738989 ) ) ( not ( = ?auto_738980 ?auto_738981 ) ) ( not ( = ?auto_738980 ?auto_738982 ) ) ( not ( = ?auto_738980 ?auto_738983 ) ) ( not ( = ?auto_738980 ?auto_738984 ) ) ( not ( = ?auto_738980 ?auto_738985 ) ) ( not ( = ?auto_738980 ?auto_738986 ) ) ( not ( = ?auto_738980 ?auto_738987 ) ) ( not ( = ?auto_738980 ?auto_738988 ) ) ( not ( = ?auto_738980 ?auto_738989 ) ) ( not ( = ?auto_738981 ?auto_738982 ) ) ( not ( = ?auto_738981 ?auto_738983 ) ) ( not ( = ?auto_738981 ?auto_738984 ) ) ( not ( = ?auto_738981 ?auto_738985 ) ) ( not ( = ?auto_738981 ?auto_738986 ) ) ( not ( = ?auto_738981 ?auto_738987 ) ) ( not ( = ?auto_738981 ?auto_738988 ) ) ( not ( = ?auto_738981 ?auto_738989 ) ) ( not ( = ?auto_738982 ?auto_738983 ) ) ( not ( = ?auto_738982 ?auto_738984 ) ) ( not ( = ?auto_738982 ?auto_738985 ) ) ( not ( = ?auto_738982 ?auto_738986 ) ) ( not ( = ?auto_738982 ?auto_738987 ) ) ( not ( = ?auto_738982 ?auto_738988 ) ) ( not ( = ?auto_738982 ?auto_738989 ) ) ( not ( = ?auto_738983 ?auto_738984 ) ) ( not ( = ?auto_738983 ?auto_738985 ) ) ( not ( = ?auto_738983 ?auto_738986 ) ) ( not ( = ?auto_738983 ?auto_738987 ) ) ( not ( = ?auto_738983 ?auto_738988 ) ) ( not ( = ?auto_738983 ?auto_738989 ) ) ( not ( = ?auto_738984 ?auto_738985 ) ) ( not ( = ?auto_738984 ?auto_738986 ) ) ( not ( = ?auto_738984 ?auto_738987 ) ) ( not ( = ?auto_738984 ?auto_738988 ) ) ( not ( = ?auto_738984 ?auto_738989 ) ) ( not ( = ?auto_738985 ?auto_738986 ) ) ( not ( = ?auto_738985 ?auto_738987 ) ) ( not ( = ?auto_738985 ?auto_738988 ) ) ( not ( = ?auto_738985 ?auto_738989 ) ) ( not ( = ?auto_738986 ?auto_738987 ) ) ( not ( = ?auto_738986 ?auto_738988 ) ) ( not ( = ?auto_738986 ?auto_738989 ) ) ( not ( = ?auto_738987 ?auto_738988 ) ) ( not ( = ?auto_738987 ?auto_738989 ) ) ( not ( = ?auto_738988 ?auto_738989 ) ) ( ON ?auto_738987 ?auto_738988 ) ( ON ?auto_738986 ?auto_738987 ) ( ON ?auto_738985 ?auto_738986 ) ( ON ?auto_738984 ?auto_738985 ) ( ON ?auto_738983 ?auto_738984 ) ( ON ?auto_738982 ?auto_738983 ) ( CLEAR ?auto_738980 ) ( ON ?auto_738981 ?auto_738982 ) ( CLEAR ?auto_738981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_738972 ?auto_738973 ?auto_738974 ?auto_738975 ?auto_738976 ?auto_738977 ?auto_738978 ?auto_738979 ?auto_738980 ?auto_738981 )
      ( MAKE-17PILE ?auto_738972 ?auto_738973 ?auto_738974 ?auto_738975 ?auto_738976 ?auto_738977 ?auto_738978 ?auto_738979 ?auto_738980 ?auto_738981 ?auto_738982 ?auto_738983 ?auto_738984 ?auto_738985 ?auto_738986 ?auto_738987 ?auto_738988 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739007 - BLOCK
      ?auto_739008 - BLOCK
      ?auto_739009 - BLOCK
      ?auto_739010 - BLOCK
      ?auto_739011 - BLOCK
      ?auto_739012 - BLOCK
      ?auto_739013 - BLOCK
      ?auto_739014 - BLOCK
      ?auto_739015 - BLOCK
      ?auto_739016 - BLOCK
      ?auto_739017 - BLOCK
      ?auto_739018 - BLOCK
      ?auto_739019 - BLOCK
      ?auto_739020 - BLOCK
      ?auto_739021 - BLOCK
      ?auto_739022 - BLOCK
      ?auto_739023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739023 ) ( ON-TABLE ?auto_739007 ) ( ON ?auto_739008 ?auto_739007 ) ( ON ?auto_739009 ?auto_739008 ) ( ON ?auto_739010 ?auto_739009 ) ( ON ?auto_739011 ?auto_739010 ) ( ON ?auto_739012 ?auto_739011 ) ( ON ?auto_739013 ?auto_739012 ) ( ON ?auto_739014 ?auto_739013 ) ( ON ?auto_739015 ?auto_739014 ) ( not ( = ?auto_739007 ?auto_739008 ) ) ( not ( = ?auto_739007 ?auto_739009 ) ) ( not ( = ?auto_739007 ?auto_739010 ) ) ( not ( = ?auto_739007 ?auto_739011 ) ) ( not ( = ?auto_739007 ?auto_739012 ) ) ( not ( = ?auto_739007 ?auto_739013 ) ) ( not ( = ?auto_739007 ?auto_739014 ) ) ( not ( = ?auto_739007 ?auto_739015 ) ) ( not ( = ?auto_739007 ?auto_739016 ) ) ( not ( = ?auto_739007 ?auto_739017 ) ) ( not ( = ?auto_739007 ?auto_739018 ) ) ( not ( = ?auto_739007 ?auto_739019 ) ) ( not ( = ?auto_739007 ?auto_739020 ) ) ( not ( = ?auto_739007 ?auto_739021 ) ) ( not ( = ?auto_739007 ?auto_739022 ) ) ( not ( = ?auto_739007 ?auto_739023 ) ) ( not ( = ?auto_739008 ?auto_739009 ) ) ( not ( = ?auto_739008 ?auto_739010 ) ) ( not ( = ?auto_739008 ?auto_739011 ) ) ( not ( = ?auto_739008 ?auto_739012 ) ) ( not ( = ?auto_739008 ?auto_739013 ) ) ( not ( = ?auto_739008 ?auto_739014 ) ) ( not ( = ?auto_739008 ?auto_739015 ) ) ( not ( = ?auto_739008 ?auto_739016 ) ) ( not ( = ?auto_739008 ?auto_739017 ) ) ( not ( = ?auto_739008 ?auto_739018 ) ) ( not ( = ?auto_739008 ?auto_739019 ) ) ( not ( = ?auto_739008 ?auto_739020 ) ) ( not ( = ?auto_739008 ?auto_739021 ) ) ( not ( = ?auto_739008 ?auto_739022 ) ) ( not ( = ?auto_739008 ?auto_739023 ) ) ( not ( = ?auto_739009 ?auto_739010 ) ) ( not ( = ?auto_739009 ?auto_739011 ) ) ( not ( = ?auto_739009 ?auto_739012 ) ) ( not ( = ?auto_739009 ?auto_739013 ) ) ( not ( = ?auto_739009 ?auto_739014 ) ) ( not ( = ?auto_739009 ?auto_739015 ) ) ( not ( = ?auto_739009 ?auto_739016 ) ) ( not ( = ?auto_739009 ?auto_739017 ) ) ( not ( = ?auto_739009 ?auto_739018 ) ) ( not ( = ?auto_739009 ?auto_739019 ) ) ( not ( = ?auto_739009 ?auto_739020 ) ) ( not ( = ?auto_739009 ?auto_739021 ) ) ( not ( = ?auto_739009 ?auto_739022 ) ) ( not ( = ?auto_739009 ?auto_739023 ) ) ( not ( = ?auto_739010 ?auto_739011 ) ) ( not ( = ?auto_739010 ?auto_739012 ) ) ( not ( = ?auto_739010 ?auto_739013 ) ) ( not ( = ?auto_739010 ?auto_739014 ) ) ( not ( = ?auto_739010 ?auto_739015 ) ) ( not ( = ?auto_739010 ?auto_739016 ) ) ( not ( = ?auto_739010 ?auto_739017 ) ) ( not ( = ?auto_739010 ?auto_739018 ) ) ( not ( = ?auto_739010 ?auto_739019 ) ) ( not ( = ?auto_739010 ?auto_739020 ) ) ( not ( = ?auto_739010 ?auto_739021 ) ) ( not ( = ?auto_739010 ?auto_739022 ) ) ( not ( = ?auto_739010 ?auto_739023 ) ) ( not ( = ?auto_739011 ?auto_739012 ) ) ( not ( = ?auto_739011 ?auto_739013 ) ) ( not ( = ?auto_739011 ?auto_739014 ) ) ( not ( = ?auto_739011 ?auto_739015 ) ) ( not ( = ?auto_739011 ?auto_739016 ) ) ( not ( = ?auto_739011 ?auto_739017 ) ) ( not ( = ?auto_739011 ?auto_739018 ) ) ( not ( = ?auto_739011 ?auto_739019 ) ) ( not ( = ?auto_739011 ?auto_739020 ) ) ( not ( = ?auto_739011 ?auto_739021 ) ) ( not ( = ?auto_739011 ?auto_739022 ) ) ( not ( = ?auto_739011 ?auto_739023 ) ) ( not ( = ?auto_739012 ?auto_739013 ) ) ( not ( = ?auto_739012 ?auto_739014 ) ) ( not ( = ?auto_739012 ?auto_739015 ) ) ( not ( = ?auto_739012 ?auto_739016 ) ) ( not ( = ?auto_739012 ?auto_739017 ) ) ( not ( = ?auto_739012 ?auto_739018 ) ) ( not ( = ?auto_739012 ?auto_739019 ) ) ( not ( = ?auto_739012 ?auto_739020 ) ) ( not ( = ?auto_739012 ?auto_739021 ) ) ( not ( = ?auto_739012 ?auto_739022 ) ) ( not ( = ?auto_739012 ?auto_739023 ) ) ( not ( = ?auto_739013 ?auto_739014 ) ) ( not ( = ?auto_739013 ?auto_739015 ) ) ( not ( = ?auto_739013 ?auto_739016 ) ) ( not ( = ?auto_739013 ?auto_739017 ) ) ( not ( = ?auto_739013 ?auto_739018 ) ) ( not ( = ?auto_739013 ?auto_739019 ) ) ( not ( = ?auto_739013 ?auto_739020 ) ) ( not ( = ?auto_739013 ?auto_739021 ) ) ( not ( = ?auto_739013 ?auto_739022 ) ) ( not ( = ?auto_739013 ?auto_739023 ) ) ( not ( = ?auto_739014 ?auto_739015 ) ) ( not ( = ?auto_739014 ?auto_739016 ) ) ( not ( = ?auto_739014 ?auto_739017 ) ) ( not ( = ?auto_739014 ?auto_739018 ) ) ( not ( = ?auto_739014 ?auto_739019 ) ) ( not ( = ?auto_739014 ?auto_739020 ) ) ( not ( = ?auto_739014 ?auto_739021 ) ) ( not ( = ?auto_739014 ?auto_739022 ) ) ( not ( = ?auto_739014 ?auto_739023 ) ) ( not ( = ?auto_739015 ?auto_739016 ) ) ( not ( = ?auto_739015 ?auto_739017 ) ) ( not ( = ?auto_739015 ?auto_739018 ) ) ( not ( = ?auto_739015 ?auto_739019 ) ) ( not ( = ?auto_739015 ?auto_739020 ) ) ( not ( = ?auto_739015 ?auto_739021 ) ) ( not ( = ?auto_739015 ?auto_739022 ) ) ( not ( = ?auto_739015 ?auto_739023 ) ) ( not ( = ?auto_739016 ?auto_739017 ) ) ( not ( = ?auto_739016 ?auto_739018 ) ) ( not ( = ?auto_739016 ?auto_739019 ) ) ( not ( = ?auto_739016 ?auto_739020 ) ) ( not ( = ?auto_739016 ?auto_739021 ) ) ( not ( = ?auto_739016 ?auto_739022 ) ) ( not ( = ?auto_739016 ?auto_739023 ) ) ( not ( = ?auto_739017 ?auto_739018 ) ) ( not ( = ?auto_739017 ?auto_739019 ) ) ( not ( = ?auto_739017 ?auto_739020 ) ) ( not ( = ?auto_739017 ?auto_739021 ) ) ( not ( = ?auto_739017 ?auto_739022 ) ) ( not ( = ?auto_739017 ?auto_739023 ) ) ( not ( = ?auto_739018 ?auto_739019 ) ) ( not ( = ?auto_739018 ?auto_739020 ) ) ( not ( = ?auto_739018 ?auto_739021 ) ) ( not ( = ?auto_739018 ?auto_739022 ) ) ( not ( = ?auto_739018 ?auto_739023 ) ) ( not ( = ?auto_739019 ?auto_739020 ) ) ( not ( = ?auto_739019 ?auto_739021 ) ) ( not ( = ?auto_739019 ?auto_739022 ) ) ( not ( = ?auto_739019 ?auto_739023 ) ) ( not ( = ?auto_739020 ?auto_739021 ) ) ( not ( = ?auto_739020 ?auto_739022 ) ) ( not ( = ?auto_739020 ?auto_739023 ) ) ( not ( = ?auto_739021 ?auto_739022 ) ) ( not ( = ?auto_739021 ?auto_739023 ) ) ( not ( = ?auto_739022 ?auto_739023 ) ) ( ON ?auto_739022 ?auto_739023 ) ( ON ?auto_739021 ?auto_739022 ) ( ON ?auto_739020 ?auto_739021 ) ( ON ?auto_739019 ?auto_739020 ) ( ON ?auto_739018 ?auto_739019 ) ( ON ?auto_739017 ?auto_739018 ) ( CLEAR ?auto_739015 ) ( ON ?auto_739016 ?auto_739017 ) ( CLEAR ?auto_739016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_739007 ?auto_739008 ?auto_739009 ?auto_739010 ?auto_739011 ?auto_739012 ?auto_739013 ?auto_739014 ?auto_739015 ?auto_739016 )
      ( MAKE-17PILE ?auto_739007 ?auto_739008 ?auto_739009 ?auto_739010 ?auto_739011 ?auto_739012 ?auto_739013 ?auto_739014 ?auto_739015 ?auto_739016 ?auto_739017 ?auto_739018 ?auto_739019 ?auto_739020 ?auto_739021 ?auto_739022 ?auto_739023 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739041 - BLOCK
      ?auto_739042 - BLOCK
      ?auto_739043 - BLOCK
      ?auto_739044 - BLOCK
      ?auto_739045 - BLOCK
      ?auto_739046 - BLOCK
      ?auto_739047 - BLOCK
      ?auto_739048 - BLOCK
      ?auto_739049 - BLOCK
      ?auto_739050 - BLOCK
      ?auto_739051 - BLOCK
      ?auto_739052 - BLOCK
      ?auto_739053 - BLOCK
      ?auto_739054 - BLOCK
      ?auto_739055 - BLOCK
      ?auto_739056 - BLOCK
      ?auto_739057 - BLOCK
    )
    :vars
    (
      ?auto_739058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739057 ?auto_739058 ) ( ON-TABLE ?auto_739041 ) ( ON ?auto_739042 ?auto_739041 ) ( ON ?auto_739043 ?auto_739042 ) ( ON ?auto_739044 ?auto_739043 ) ( ON ?auto_739045 ?auto_739044 ) ( ON ?auto_739046 ?auto_739045 ) ( ON ?auto_739047 ?auto_739046 ) ( ON ?auto_739048 ?auto_739047 ) ( not ( = ?auto_739041 ?auto_739042 ) ) ( not ( = ?auto_739041 ?auto_739043 ) ) ( not ( = ?auto_739041 ?auto_739044 ) ) ( not ( = ?auto_739041 ?auto_739045 ) ) ( not ( = ?auto_739041 ?auto_739046 ) ) ( not ( = ?auto_739041 ?auto_739047 ) ) ( not ( = ?auto_739041 ?auto_739048 ) ) ( not ( = ?auto_739041 ?auto_739049 ) ) ( not ( = ?auto_739041 ?auto_739050 ) ) ( not ( = ?auto_739041 ?auto_739051 ) ) ( not ( = ?auto_739041 ?auto_739052 ) ) ( not ( = ?auto_739041 ?auto_739053 ) ) ( not ( = ?auto_739041 ?auto_739054 ) ) ( not ( = ?auto_739041 ?auto_739055 ) ) ( not ( = ?auto_739041 ?auto_739056 ) ) ( not ( = ?auto_739041 ?auto_739057 ) ) ( not ( = ?auto_739041 ?auto_739058 ) ) ( not ( = ?auto_739042 ?auto_739043 ) ) ( not ( = ?auto_739042 ?auto_739044 ) ) ( not ( = ?auto_739042 ?auto_739045 ) ) ( not ( = ?auto_739042 ?auto_739046 ) ) ( not ( = ?auto_739042 ?auto_739047 ) ) ( not ( = ?auto_739042 ?auto_739048 ) ) ( not ( = ?auto_739042 ?auto_739049 ) ) ( not ( = ?auto_739042 ?auto_739050 ) ) ( not ( = ?auto_739042 ?auto_739051 ) ) ( not ( = ?auto_739042 ?auto_739052 ) ) ( not ( = ?auto_739042 ?auto_739053 ) ) ( not ( = ?auto_739042 ?auto_739054 ) ) ( not ( = ?auto_739042 ?auto_739055 ) ) ( not ( = ?auto_739042 ?auto_739056 ) ) ( not ( = ?auto_739042 ?auto_739057 ) ) ( not ( = ?auto_739042 ?auto_739058 ) ) ( not ( = ?auto_739043 ?auto_739044 ) ) ( not ( = ?auto_739043 ?auto_739045 ) ) ( not ( = ?auto_739043 ?auto_739046 ) ) ( not ( = ?auto_739043 ?auto_739047 ) ) ( not ( = ?auto_739043 ?auto_739048 ) ) ( not ( = ?auto_739043 ?auto_739049 ) ) ( not ( = ?auto_739043 ?auto_739050 ) ) ( not ( = ?auto_739043 ?auto_739051 ) ) ( not ( = ?auto_739043 ?auto_739052 ) ) ( not ( = ?auto_739043 ?auto_739053 ) ) ( not ( = ?auto_739043 ?auto_739054 ) ) ( not ( = ?auto_739043 ?auto_739055 ) ) ( not ( = ?auto_739043 ?auto_739056 ) ) ( not ( = ?auto_739043 ?auto_739057 ) ) ( not ( = ?auto_739043 ?auto_739058 ) ) ( not ( = ?auto_739044 ?auto_739045 ) ) ( not ( = ?auto_739044 ?auto_739046 ) ) ( not ( = ?auto_739044 ?auto_739047 ) ) ( not ( = ?auto_739044 ?auto_739048 ) ) ( not ( = ?auto_739044 ?auto_739049 ) ) ( not ( = ?auto_739044 ?auto_739050 ) ) ( not ( = ?auto_739044 ?auto_739051 ) ) ( not ( = ?auto_739044 ?auto_739052 ) ) ( not ( = ?auto_739044 ?auto_739053 ) ) ( not ( = ?auto_739044 ?auto_739054 ) ) ( not ( = ?auto_739044 ?auto_739055 ) ) ( not ( = ?auto_739044 ?auto_739056 ) ) ( not ( = ?auto_739044 ?auto_739057 ) ) ( not ( = ?auto_739044 ?auto_739058 ) ) ( not ( = ?auto_739045 ?auto_739046 ) ) ( not ( = ?auto_739045 ?auto_739047 ) ) ( not ( = ?auto_739045 ?auto_739048 ) ) ( not ( = ?auto_739045 ?auto_739049 ) ) ( not ( = ?auto_739045 ?auto_739050 ) ) ( not ( = ?auto_739045 ?auto_739051 ) ) ( not ( = ?auto_739045 ?auto_739052 ) ) ( not ( = ?auto_739045 ?auto_739053 ) ) ( not ( = ?auto_739045 ?auto_739054 ) ) ( not ( = ?auto_739045 ?auto_739055 ) ) ( not ( = ?auto_739045 ?auto_739056 ) ) ( not ( = ?auto_739045 ?auto_739057 ) ) ( not ( = ?auto_739045 ?auto_739058 ) ) ( not ( = ?auto_739046 ?auto_739047 ) ) ( not ( = ?auto_739046 ?auto_739048 ) ) ( not ( = ?auto_739046 ?auto_739049 ) ) ( not ( = ?auto_739046 ?auto_739050 ) ) ( not ( = ?auto_739046 ?auto_739051 ) ) ( not ( = ?auto_739046 ?auto_739052 ) ) ( not ( = ?auto_739046 ?auto_739053 ) ) ( not ( = ?auto_739046 ?auto_739054 ) ) ( not ( = ?auto_739046 ?auto_739055 ) ) ( not ( = ?auto_739046 ?auto_739056 ) ) ( not ( = ?auto_739046 ?auto_739057 ) ) ( not ( = ?auto_739046 ?auto_739058 ) ) ( not ( = ?auto_739047 ?auto_739048 ) ) ( not ( = ?auto_739047 ?auto_739049 ) ) ( not ( = ?auto_739047 ?auto_739050 ) ) ( not ( = ?auto_739047 ?auto_739051 ) ) ( not ( = ?auto_739047 ?auto_739052 ) ) ( not ( = ?auto_739047 ?auto_739053 ) ) ( not ( = ?auto_739047 ?auto_739054 ) ) ( not ( = ?auto_739047 ?auto_739055 ) ) ( not ( = ?auto_739047 ?auto_739056 ) ) ( not ( = ?auto_739047 ?auto_739057 ) ) ( not ( = ?auto_739047 ?auto_739058 ) ) ( not ( = ?auto_739048 ?auto_739049 ) ) ( not ( = ?auto_739048 ?auto_739050 ) ) ( not ( = ?auto_739048 ?auto_739051 ) ) ( not ( = ?auto_739048 ?auto_739052 ) ) ( not ( = ?auto_739048 ?auto_739053 ) ) ( not ( = ?auto_739048 ?auto_739054 ) ) ( not ( = ?auto_739048 ?auto_739055 ) ) ( not ( = ?auto_739048 ?auto_739056 ) ) ( not ( = ?auto_739048 ?auto_739057 ) ) ( not ( = ?auto_739048 ?auto_739058 ) ) ( not ( = ?auto_739049 ?auto_739050 ) ) ( not ( = ?auto_739049 ?auto_739051 ) ) ( not ( = ?auto_739049 ?auto_739052 ) ) ( not ( = ?auto_739049 ?auto_739053 ) ) ( not ( = ?auto_739049 ?auto_739054 ) ) ( not ( = ?auto_739049 ?auto_739055 ) ) ( not ( = ?auto_739049 ?auto_739056 ) ) ( not ( = ?auto_739049 ?auto_739057 ) ) ( not ( = ?auto_739049 ?auto_739058 ) ) ( not ( = ?auto_739050 ?auto_739051 ) ) ( not ( = ?auto_739050 ?auto_739052 ) ) ( not ( = ?auto_739050 ?auto_739053 ) ) ( not ( = ?auto_739050 ?auto_739054 ) ) ( not ( = ?auto_739050 ?auto_739055 ) ) ( not ( = ?auto_739050 ?auto_739056 ) ) ( not ( = ?auto_739050 ?auto_739057 ) ) ( not ( = ?auto_739050 ?auto_739058 ) ) ( not ( = ?auto_739051 ?auto_739052 ) ) ( not ( = ?auto_739051 ?auto_739053 ) ) ( not ( = ?auto_739051 ?auto_739054 ) ) ( not ( = ?auto_739051 ?auto_739055 ) ) ( not ( = ?auto_739051 ?auto_739056 ) ) ( not ( = ?auto_739051 ?auto_739057 ) ) ( not ( = ?auto_739051 ?auto_739058 ) ) ( not ( = ?auto_739052 ?auto_739053 ) ) ( not ( = ?auto_739052 ?auto_739054 ) ) ( not ( = ?auto_739052 ?auto_739055 ) ) ( not ( = ?auto_739052 ?auto_739056 ) ) ( not ( = ?auto_739052 ?auto_739057 ) ) ( not ( = ?auto_739052 ?auto_739058 ) ) ( not ( = ?auto_739053 ?auto_739054 ) ) ( not ( = ?auto_739053 ?auto_739055 ) ) ( not ( = ?auto_739053 ?auto_739056 ) ) ( not ( = ?auto_739053 ?auto_739057 ) ) ( not ( = ?auto_739053 ?auto_739058 ) ) ( not ( = ?auto_739054 ?auto_739055 ) ) ( not ( = ?auto_739054 ?auto_739056 ) ) ( not ( = ?auto_739054 ?auto_739057 ) ) ( not ( = ?auto_739054 ?auto_739058 ) ) ( not ( = ?auto_739055 ?auto_739056 ) ) ( not ( = ?auto_739055 ?auto_739057 ) ) ( not ( = ?auto_739055 ?auto_739058 ) ) ( not ( = ?auto_739056 ?auto_739057 ) ) ( not ( = ?auto_739056 ?auto_739058 ) ) ( not ( = ?auto_739057 ?auto_739058 ) ) ( ON ?auto_739056 ?auto_739057 ) ( ON ?auto_739055 ?auto_739056 ) ( ON ?auto_739054 ?auto_739055 ) ( ON ?auto_739053 ?auto_739054 ) ( ON ?auto_739052 ?auto_739053 ) ( ON ?auto_739051 ?auto_739052 ) ( ON ?auto_739050 ?auto_739051 ) ( CLEAR ?auto_739048 ) ( ON ?auto_739049 ?auto_739050 ) ( CLEAR ?auto_739049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_739041 ?auto_739042 ?auto_739043 ?auto_739044 ?auto_739045 ?auto_739046 ?auto_739047 ?auto_739048 ?auto_739049 )
      ( MAKE-17PILE ?auto_739041 ?auto_739042 ?auto_739043 ?auto_739044 ?auto_739045 ?auto_739046 ?auto_739047 ?auto_739048 ?auto_739049 ?auto_739050 ?auto_739051 ?auto_739052 ?auto_739053 ?auto_739054 ?auto_739055 ?auto_739056 ?auto_739057 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739076 - BLOCK
      ?auto_739077 - BLOCK
      ?auto_739078 - BLOCK
      ?auto_739079 - BLOCK
      ?auto_739080 - BLOCK
      ?auto_739081 - BLOCK
      ?auto_739082 - BLOCK
      ?auto_739083 - BLOCK
      ?auto_739084 - BLOCK
      ?auto_739085 - BLOCK
      ?auto_739086 - BLOCK
      ?auto_739087 - BLOCK
      ?auto_739088 - BLOCK
      ?auto_739089 - BLOCK
      ?auto_739090 - BLOCK
      ?auto_739091 - BLOCK
      ?auto_739092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739092 ) ( ON-TABLE ?auto_739076 ) ( ON ?auto_739077 ?auto_739076 ) ( ON ?auto_739078 ?auto_739077 ) ( ON ?auto_739079 ?auto_739078 ) ( ON ?auto_739080 ?auto_739079 ) ( ON ?auto_739081 ?auto_739080 ) ( ON ?auto_739082 ?auto_739081 ) ( ON ?auto_739083 ?auto_739082 ) ( not ( = ?auto_739076 ?auto_739077 ) ) ( not ( = ?auto_739076 ?auto_739078 ) ) ( not ( = ?auto_739076 ?auto_739079 ) ) ( not ( = ?auto_739076 ?auto_739080 ) ) ( not ( = ?auto_739076 ?auto_739081 ) ) ( not ( = ?auto_739076 ?auto_739082 ) ) ( not ( = ?auto_739076 ?auto_739083 ) ) ( not ( = ?auto_739076 ?auto_739084 ) ) ( not ( = ?auto_739076 ?auto_739085 ) ) ( not ( = ?auto_739076 ?auto_739086 ) ) ( not ( = ?auto_739076 ?auto_739087 ) ) ( not ( = ?auto_739076 ?auto_739088 ) ) ( not ( = ?auto_739076 ?auto_739089 ) ) ( not ( = ?auto_739076 ?auto_739090 ) ) ( not ( = ?auto_739076 ?auto_739091 ) ) ( not ( = ?auto_739076 ?auto_739092 ) ) ( not ( = ?auto_739077 ?auto_739078 ) ) ( not ( = ?auto_739077 ?auto_739079 ) ) ( not ( = ?auto_739077 ?auto_739080 ) ) ( not ( = ?auto_739077 ?auto_739081 ) ) ( not ( = ?auto_739077 ?auto_739082 ) ) ( not ( = ?auto_739077 ?auto_739083 ) ) ( not ( = ?auto_739077 ?auto_739084 ) ) ( not ( = ?auto_739077 ?auto_739085 ) ) ( not ( = ?auto_739077 ?auto_739086 ) ) ( not ( = ?auto_739077 ?auto_739087 ) ) ( not ( = ?auto_739077 ?auto_739088 ) ) ( not ( = ?auto_739077 ?auto_739089 ) ) ( not ( = ?auto_739077 ?auto_739090 ) ) ( not ( = ?auto_739077 ?auto_739091 ) ) ( not ( = ?auto_739077 ?auto_739092 ) ) ( not ( = ?auto_739078 ?auto_739079 ) ) ( not ( = ?auto_739078 ?auto_739080 ) ) ( not ( = ?auto_739078 ?auto_739081 ) ) ( not ( = ?auto_739078 ?auto_739082 ) ) ( not ( = ?auto_739078 ?auto_739083 ) ) ( not ( = ?auto_739078 ?auto_739084 ) ) ( not ( = ?auto_739078 ?auto_739085 ) ) ( not ( = ?auto_739078 ?auto_739086 ) ) ( not ( = ?auto_739078 ?auto_739087 ) ) ( not ( = ?auto_739078 ?auto_739088 ) ) ( not ( = ?auto_739078 ?auto_739089 ) ) ( not ( = ?auto_739078 ?auto_739090 ) ) ( not ( = ?auto_739078 ?auto_739091 ) ) ( not ( = ?auto_739078 ?auto_739092 ) ) ( not ( = ?auto_739079 ?auto_739080 ) ) ( not ( = ?auto_739079 ?auto_739081 ) ) ( not ( = ?auto_739079 ?auto_739082 ) ) ( not ( = ?auto_739079 ?auto_739083 ) ) ( not ( = ?auto_739079 ?auto_739084 ) ) ( not ( = ?auto_739079 ?auto_739085 ) ) ( not ( = ?auto_739079 ?auto_739086 ) ) ( not ( = ?auto_739079 ?auto_739087 ) ) ( not ( = ?auto_739079 ?auto_739088 ) ) ( not ( = ?auto_739079 ?auto_739089 ) ) ( not ( = ?auto_739079 ?auto_739090 ) ) ( not ( = ?auto_739079 ?auto_739091 ) ) ( not ( = ?auto_739079 ?auto_739092 ) ) ( not ( = ?auto_739080 ?auto_739081 ) ) ( not ( = ?auto_739080 ?auto_739082 ) ) ( not ( = ?auto_739080 ?auto_739083 ) ) ( not ( = ?auto_739080 ?auto_739084 ) ) ( not ( = ?auto_739080 ?auto_739085 ) ) ( not ( = ?auto_739080 ?auto_739086 ) ) ( not ( = ?auto_739080 ?auto_739087 ) ) ( not ( = ?auto_739080 ?auto_739088 ) ) ( not ( = ?auto_739080 ?auto_739089 ) ) ( not ( = ?auto_739080 ?auto_739090 ) ) ( not ( = ?auto_739080 ?auto_739091 ) ) ( not ( = ?auto_739080 ?auto_739092 ) ) ( not ( = ?auto_739081 ?auto_739082 ) ) ( not ( = ?auto_739081 ?auto_739083 ) ) ( not ( = ?auto_739081 ?auto_739084 ) ) ( not ( = ?auto_739081 ?auto_739085 ) ) ( not ( = ?auto_739081 ?auto_739086 ) ) ( not ( = ?auto_739081 ?auto_739087 ) ) ( not ( = ?auto_739081 ?auto_739088 ) ) ( not ( = ?auto_739081 ?auto_739089 ) ) ( not ( = ?auto_739081 ?auto_739090 ) ) ( not ( = ?auto_739081 ?auto_739091 ) ) ( not ( = ?auto_739081 ?auto_739092 ) ) ( not ( = ?auto_739082 ?auto_739083 ) ) ( not ( = ?auto_739082 ?auto_739084 ) ) ( not ( = ?auto_739082 ?auto_739085 ) ) ( not ( = ?auto_739082 ?auto_739086 ) ) ( not ( = ?auto_739082 ?auto_739087 ) ) ( not ( = ?auto_739082 ?auto_739088 ) ) ( not ( = ?auto_739082 ?auto_739089 ) ) ( not ( = ?auto_739082 ?auto_739090 ) ) ( not ( = ?auto_739082 ?auto_739091 ) ) ( not ( = ?auto_739082 ?auto_739092 ) ) ( not ( = ?auto_739083 ?auto_739084 ) ) ( not ( = ?auto_739083 ?auto_739085 ) ) ( not ( = ?auto_739083 ?auto_739086 ) ) ( not ( = ?auto_739083 ?auto_739087 ) ) ( not ( = ?auto_739083 ?auto_739088 ) ) ( not ( = ?auto_739083 ?auto_739089 ) ) ( not ( = ?auto_739083 ?auto_739090 ) ) ( not ( = ?auto_739083 ?auto_739091 ) ) ( not ( = ?auto_739083 ?auto_739092 ) ) ( not ( = ?auto_739084 ?auto_739085 ) ) ( not ( = ?auto_739084 ?auto_739086 ) ) ( not ( = ?auto_739084 ?auto_739087 ) ) ( not ( = ?auto_739084 ?auto_739088 ) ) ( not ( = ?auto_739084 ?auto_739089 ) ) ( not ( = ?auto_739084 ?auto_739090 ) ) ( not ( = ?auto_739084 ?auto_739091 ) ) ( not ( = ?auto_739084 ?auto_739092 ) ) ( not ( = ?auto_739085 ?auto_739086 ) ) ( not ( = ?auto_739085 ?auto_739087 ) ) ( not ( = ?auto_739085 ?auto_739088 ) ) ( not ( = ?auto_739085 ?auto_739089 ) ) ( not ( = ?auto_739085 ?auto_739090 ) ) ( not ( = ?auto_739085 ?auto_739091 ) ) ( not ( = ?auto_739085 ?auto_739092 ) ) ( not ( = ?auto_739086 ?auto_739087 ) ) ( not ( = ?auto_739086 ?auto_739088 ) ) ( not ( = ?auto_739086 ?auto_739089 ) ) ( not ( = ?auto_739086 ?auto_739090 ) ) ( not ( = ?auto_739086 ?auto_739091 ) ) ( not ( = ?auto_739086 ?auto_739092 ) ) ( not ( = ?auto_739087 ?auto_739088 ) ) ( not ( = ?auto_739087 ?auto_739089 ) ) ( not ( = ?auto_739087 ?auto_739090 ) ) ( not ( = ?auto_739087 ?auto_739091 ) ) ( not ( = ?auto_739087 ?auto_739092 ) ) ( not ( = ?auto_739088 ?auto_739089 ) ) ( not ( = ?auto_739088 ?auto_739090 ) ) ( not ( = ?auto_739088 ?auto_739091 ) ) ( not ( = ?auto_739088 ?auto_739092 ) ) ( not ( = ?auto_739089 ?auto_739090 ) ) ( not ( = ?auto_739089 ?auto_739091 ) ) ( not ( = ?auto_739089 ?auto_739092 ) ) ( not ( = ?auto_739090 ?auto_739091 ) ) ( not ( = ?auto_739090 ?auto_739092 ) ) ( not ( = ?auto_739091 ?auto_739092 ) ) ( ON ?auto_739091 ?auto_739092 ) ( ON ?auto_739090 ?auto_739091 ) ( ON ?auto_739089 ?auto_739090 ) ( ON ?auto_739088 ?auto_739089 ) ( ON ?auto_739087 ?auto_739088 ) ( ON ?auto_739086 ?auto_739087 ) ( ON ?auto_739085 ?auto_739086 ) ( CLEAR ?auto_739083 ) ( ON ?auto_739084 ?auto_739085 ) ( CLEAR ?auto_739084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_739076 ?auto_739077 ?auto_739078 ?auto_739079 ?auto_739080 ?auto_739081 ?auto_739082 ?auto_739083 ?auto_739084 )
      ( MAKE-17PILE ?auto_739076 ?auto_739077 ?auto_739078 ?auto_739079 ?auto_739080 ?auto_739081 ?auto_739082 ?auto_739083 ?auto_739084 ?auto_739085 ?auto_739086 ?auto_739087 ?auto_739088 ?auto_739089 ?auto_739090 ?auto_739091 ?auto_739092 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739110 - BLOCK
      ?auto_739111 - BLOCK
      ?auto_739112 - BLOCK
      ?auto_739113 - BLOCK
      ?auto_739114 - BLOCK
      ?auto_739115 - BLOCK
      ?auto_739116 - BLOCK
      ?auto_739117 - BLOCK
      ?auto_739118 - BLOCK
      ?auto_739119 - BLOCK
      ?auto_739120 - BLOCK
      ?auto_739121 - BLOCK
      ?auto_739122 - BLOCK
      ?auto_739123 - BLOCK
      ?auto_739124 - BLOCK
      ?auto_739125 - BLOCK
      ?auto_739126 - BLOCK
    )
    :vars
    (
      ?auto_739127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739126 ?auto_739127 ) ( ON-TABLE ?auto_739110 ) ( ON ?auto_739111 ?auto_739110 ) ( ON ?auto_739112 ?auto_739111 ) ( ON ?auto_739113 ?auto_739112 ) ( ON ?auto_739114 ?auto_739113 ) ( ON ?auto_739115 ?auto_739114 ) ( ON ?auto_739116 ?auto_739115 ) ( not ( = ?auto_739110 ?auto_739111 ) ) ( not ( = ?auto_739110 ?auto_739112 ) ) ( not ( = ?auto_739110 ?auto_739113 ) ) ( not ( = ?auto_739110 ?auto_739114 ) ) ( not ( = ?auto_739110 ?auto_739115 ) ) ( not ( = ?auto_739110 ?auto_739116 ) ) ( not ( = ?auto_739110 ?auto_739117 ) ) ( not ( = ?auto_739110 ?auto_739118 ) ) ( not ( = ?auto_739110 ?auto_739119 ) ) ( not ( = ?auto_739110 ?auto_739120 ) ) ( not ( = ?auto_739110 ?auto_739121 ) ) ( not ( = ?auto_739110 ?auto_739122 ) ) ( not ( = ?auto_739110 ?auto_739123 ) ) ( not ( = ?auto_739110 ?auto_739124 ) ) ( not ( = ?auto_739110 ?auto_739125 ) ) ( not ( = ?auto_739110 ?auto_739126 ) ) ( not ( = ?auto_739110 ?auto_739127 ) ) ( not ( = ?auto_739111 ?auto_739112 ) ) ( not ( = ?auto_739111 ?auto_739113 ) ) ( not ( = ?auto_739111 ?auto_739114 ) ) ( not ( = ?auto_739111 ?auto_739115 ) ) ( not ( = ?auto_739111 ?auto_739116 ) ) ( not ( = ?auto_739111 ?auto_739117 ) ) ( not ( = ?auto_739111 ?auto_739118 ) ) ( not ( = ?auto_739111 ?auto_739119 ) ) ( not ( = ?auto_739111 ?auto_739120 ) ) ( not ( = ?auto_739111 ?auto_739121 ) ) ( not ( = ?auto_739111 ?auto_739122 ) ) ( not ( = ?auto_739111 ?auto_739123 ) ) ( not ( = ?auto_739111 ?auto_739124 ) ) ( not ( = ?auto_739111 ?auto_739125 ) ) ( not ( = ?auto_739111 ?auto_739126 ) ) ( not ( = ?auto_739111 ?auto_739127 ) ) ( not ( = ?auto_739112 ?auto_739113 ) ) ( not ( = ?auto_739112 ?auto_739114 ) ) ( not ( = ?auto_739112 ?auto_739115 ) ) ( not ( = ?auto_739112 ?auto_739116 ) ) ( not ( = ?auto_739112 ?auto_739117 ) ) ( not ( = ?auto_739112 ?auto_739118 ) ) ( not ( = ?auto_739112 ?auto_739119 ) ) ( not ( = ?auto_739112 ?auto_739120 ) ) ( not ( = ?auto_739112 ?auto_739121 ) ) ( not ( = ?auto_739112 ?auto_739122 ) ) ( not ( = ?auto_739112 ?auto_739123 ) ) ( not ( = ?auto_739112 ?auto_739124 ) ) ( not ( = ?auto_739112 ?auto_739125 ) ) ( not ( = ?auto_739112 ?auto_739126 ) ) ( not ( = ?auto_739112 ?auto_739127 ) ) ( not ( = ?auto_739113 ?auto_739114 ) ) ( not ( = ?auto_739113 ?auto_739115 ) ) ( not ( = ?auto_739113 ?auto_739116 ) ) ( not ( = ?auto_739113 ?auto_739117 ) ) ( not ( = ?auto_739113 ?auto_739118 ) ) ( not ( = ?auto_739113 ?auto_739119 ) ) ( not ( = ?auto_739113 ?auto_739120 ) ) ( not ( = ?auto_739113 ?auto_739121 ) ) ( not ( = ?auto_739113 ?auto_739122 ) ) ( not ( = ?auto_739113 ?auto_739123 ) ) ( not ( = ?auto_739113 ?auto_739124 ) ) ( not ( = ?auto_739113 ?auto_739125 ) ) ( not ( = ?auto_739113 ?auto_739126 ) ) ( not ( = ?auto_739113 ?auto_739127 ) ) ( not ( = ?auto_739114 ?auto_739115 ) ) ( not ( = ?auto_739114 ?auto_739116 ) ) ( not ( = ?auto_739114 ?auto_739117 ) ) ( not ( = ?auto_739114 ?auto_739118 ) ) ( not ( = ?auto_739114 ?auto_739119 ) ) ( not ( = ?auto_739114 ?auto_739120 ) ) ( not ( = ?auto_739114 ?auto_739121 ) ) ( not ( = ?auto_739114 ?auto_739122 ) ) ( not ( = ?auto_739114 ?auto_739123 ) ) ( not ( = ?auto_739114 ?auto_739124 ) ) ( not ( = ?auto_739114 ?auto_739125 ) ) ( not ( = ?auto_739114 ?auto_739126 ) ) ( not ( = ?auto_739114 ?auto_739127 ) ) ( not ( = ?auto_739115 ?auto_739116 ) ) ( not ( = ?auto_739115 ?auto_739117 ) ) ( not ( = ?auto_739115 ?auto_739118 ) ) ( not ( = ?auto_739115 ?auto_739119 ) ) ( not ( = ?auto_739115 ?auto_739120 ) ) ( not ( = ?auto_739115 ?auto_739121 ) ) ( not ( = ?auto_739115 ?auto_739122 ) ) ( not ( = ?auto_739115 ?auto_739123 ) ) ( not ( = ?auto_739115 ?auto_739124 ) ) ( not ( = ?auto_739115 ?auto_739125 ) ) ( not ( = ?auto_739115 ?auto_739126 ) ) ( not ( = ?auto_739115 ?auto_739127 ) ) ( not ( = ?auto_739116 ?auto_739117 ) ) ( not ( = ?auto_739116 ?auto_739118 ) ) ( not ( = ?auto_739116 ?auto_739119 ) ) ( not ( = ?auto_739116 ?auto_739120 ) ) ( not ( = ?auto_739116 ?auto_739121 ) ) ( not ( = ?auto_739116 ?auto_739122 ) ) ( not ( = ?auto_739116 ?auto_739123 ) ) ( not ( = ?auto_739116 ?auto_739124 ) ) ( not ( = ?auto_739116 ?auto_739125 ) ) ( not ( = ?auto_739116 ?auto_739126 ) ) ( not ( = ?auto_739116 ?auto_739127 ) ) ( not ( = ?auto_739117 ?auto_739118 ) ) ( not ( = ?auto_739117 ?auto_739119 ) ) ( not ( = ?auto_739117 ?auto_739120 ) ) ( not ( = ?auto_739117 ?auto_739121 ) ) ( not ( = ?auto_739117 ?auto_739122 ) ) ( not ( = ?auto_739117 ?auto_739123 ) ) ( not ( = ?auto_739117 ?auto_739124 ) ) ( not ( = ?auto_739117 ?auto_739125 ) ) ( not ( = ?auto_739117 ?auto_739126 ) ) ( not ( = ?auto_739117 ?auto_739127 ) ) ( not ( = ?auto_739118 ?auto_739119 ) ) ( not ( = ?auto_739118 ?auto_739120 ) ) ( not ( = ?auto_739118 ?auto_739121 ) ) ( not ( = ?auto_739118 ?auto_739122 ) ) ( not ( = ?auto_739118 ?auto_739123 ) ) ( not ( = ?auto_739118 ?auto_739124 ) ) ( not ( = ?auto_739118 ?auto_739125 ) ) ( not ( = ?auto_739118 ?auto_739126 ) ) ( not ( = ?auto_739118 ?auto_739127 ) ) ( not ( = ?auto_739119 ?auto_739120 ) ) ( not ( = ?auto_739119 ?auto_739121 ) ) ( not ( = ?auto_739119 ?auto_739122 ) ) ( not ( = ?auto_739119 ?auto_739123 ) ) ( not ( = ?auto_739119 ?auto_739124 ) ) ( not ( = ?auto_739119 ?auto_739125 ) ) ( not ( = ?auto_739119 ?auto_739126 ) ) ( not ( = ?auto_739119 ?auto_739127 ) ) ( not ( = ?auto_739120 ?auto_739121 ) ) ( not ( = ?auto_739120 ?auto_739122 ) ) ( not ( = ?auto_739120 ?auto_739123 ) ) ( not ( = ?auto_739120 ?auto_739124 ) ) ( not ( = ?auto_739120 ?auto_739125 ) ) ( not ( = ?auto_739120 ?auto_739126 ) ) ( not ( = ?auto_739120 ?auto_739127 ) ) ( not ( = ?auto_739121 ?auto_739122 ) ) ( not ( = ?auto_739121 ?auto_739123 ) ) ( not ( = ?auto_739121 ?auto_739124 ) ) ( not ( = ?auto_739121 ?auto_739125 ) ) ( not ( = ?auto_739121 ?auto_739126 ) ) ( not ( = ?auto_739121 ?auto_739127 ) ) ( not ( = ?auto_739122 ?auto_739123 ) ) ( not ( = ?auto_739122 ?auto_739124 ) ) ( not ( = ?auto_739122 ?auto_739125 ) ) ( not ( = ?auto_739122 ?auto_739126 ) ) ( not ( = ?auto_739122 ?auto_739127 ) ) ( not ( = ?auto_739123 ?auto_739124 ) ) ( not ( = ?auto_739123 ?auto_739125 ) ) ( not ( = ?auto_739123 ?auto_739126 ) ) ( not ( = ?auto_739123 ?auto_739127 ) ) ( not ( = ?auto_739124 ?auto_739125 ) ) ( not ( = ?auto_739124 ?auto_739126 ) ) ( not ( = ?auto_739124 ?auto_739127 ) ) ( not ( = ?auto_739125 ?auto_739126 ) ) ( not ( = ?auto_739125 ?auto_739127 ) ) ( not ( = ?auto_739126 ?auto_739127 ) ) ( ON ?auto_739125 ?auto_739126 ) ( ON ?auto_739124 ?auto_739125 ) ( ON ?auto_739123 ?auto_739124 ) ( ON ?auto_739122 ?auto_739123 ) ( ON ?auto_739121 ?auto_739122 ) ( ON ?auto_739120 ?auto_739121 ) ( ON ?auto_739119 ?auto_739120 ) ( ON ?auto_739118 ?auto_739119 ) ( CLEAR ?auto_739116 ) ( ON ?auto_739117 ?auto_739118 ) ( CLEAR ?auto_739117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_739110 ?auto_739111 ?auto_739112 ?auto_739113 ?auto_739114 ?auto_739115 ?auto_739116 ?auto_739117 )
      ( MAKE-17PILE ?auto_739110 ?auto_739111 ?auto_739112 ?auto_739113 ?auto_739114 ?auto_739115 ?auto_739116 ?auto_739117 ?auto_739118 ?auto_739119 ?auto_739120 ?auto_739121 ?auto_739122 ?auto_739123 ?auto_739124 ?auto_739125 ?auto_739126 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739145 - BLOCK
      ?auto_739146 - BLOCK
      ?auto_739147 - BLOCK
      ?auto_739148 - BLOCK
      ?auto_739149 - BLOCK
      ?auto_739150 - BLOCK
      ?auto_739151 - BLOCK
      ?auto_739152 - BLOCK
      ?auto_739153 - BLOCK
      ?auto_739154 - BLOCK
      ?auto_739155 - BLOCK
      ?auto_739156 - BLOCK
      ?auto_739157 - BLOCK
      ?auto_739158 - BLOCK
      ?auto_739159 - BLOCK
      ?auto_739160 - BLOCK
      ?auto_739161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739161 ) ( ON-TABLE ?auto_739145 ) ( ON ?auto_739146 ?auto_739145 ) ( ON ?auto_739147 ?auto_739146 ) ( ON ?auto_739148 ?auto_739147 ) ( ON ?auto_739149 ?auto_739148 ) ( ON ?auto_739150 ?auto_739149 ) ( ON ?auto_739151 ?auto_739150 ) ( not ( = ?auto_739145 ?auto_739146 ) ) ( not ( = ?auto_739145 ?auto_739147 ) ) ( not ( = ?auto_739145 ?auto_739148 ) ) ( not ( = ?auto_739145 ?auto_739149 ) ) ( not ( = ?auto_739145 ?auto_739150 ) ) ( not ( = ?auto_739145 ?auto_739151 ) ) ( not ( = ?auto_739145 ?auto_739152 ) ) ( not ( = ?auto_739145 ?auto_739153 ) ) ( not ( = ?auto_739145 ?auto_739154 ) ) ( not ( = ?auto_739145 ?auto_739155 ) ) ( not ( = ?auto_739145 ?auto_739156 ) ) ( not ( = ?auto_739145 ?auto_739157 ) ) ( not ( = ?auto_739145 ?auto_739158 ) ) ( not ( = ?auto_739145 ?auto_739159 ) ) ( not ( = ?auto_739145 ?auto_739160 ) ) ( not ( = ?auto_739145 ?auto_739161 ) ) ( not ( = ?auto_739146 ?auto_739147 ) ) ( not ( = ?auto_739146 ?auto_739148 ) ) ( not ( = ?auto_739146 ?auto_739149 ) ) ( not ( = ?auto_739146 ?auto_739150 ) ) ( not ( = ?auto_739146 ?auto_739151 ) ) ( not ( = ?auto_739146 ?auto_739152 ) ) ( not ( = ?auto_739146 ?auto_739153 ) ) ( not ( = ?auto_739146 ?auto_739154 ) ) ( not ( = ?auto_739146 ?auto_739155 ) ) ( not ( = ?auto_739146 ?auto_739156 ) ) ( not ( = ?auto_739146 ?auto_739157 ) ) ( not ( = ?auto_739146 ?auto_739158 ) ) ( not ( = ?auto_739146 ?auto_739159 ) ) ( not ( = ?auto_739146 ?auto_739160 ) ) ( not ( = ?auto_739146 ?auto_739161 ) ) ( not ( = ?auto_739147 ?auto_739148 ) ) ( not ( = ?auto_739147 ?auto_739149 ) ) ( not ( = ?auto_739147 ?auto_739150 ) ) ( not ( = ?auto_739147 ?auto_739151 ) ) ( not ( = ?auto_739147 ?auto_739152 ) ) ( not ( = ?auto_739147 ?auto_739153 ) ) ( not ( = ?auto_739147 ?auto_739154 ) ) ( not ( = ?auto_739147 ?auto_739155 ) ) ( not ( = ?auto_739147 ?auto_739156 ) ) ( not ( = ?auto_739147 ?auto_739157 ) ) ( not ( = ?auto_739147 ?auto_739158 ) ) ( not ( = ?auto_739147 ?auto_739159 ) ) ( not ( = ?auto_739147 ?auto_739160 ) ) ( not ( = ?auto_739147 ?auto_739161 ) ) ( not ( = ?auto_739148 ?auto_739149 ) ) ( not ( = ?auto_739148 ?auto_739150 ) ) ( not ( = ?auto_739148 ?auto_739151 ) ) ( not ( = ?auto_739148 ?auto_739152 ) ) ( not ( = ?auto_739148 ?auto_739153 ) ) ( not ( = ?auto_739148 ?auto_739154 ) ) ( not ( = ?auto_739148 ?auto_739155 ) ) ( not ( = ?auto_739148 ?auto_739156 ) ) ( not ( = ?auto_739148 ?auto_739157 ) ) ( not ( = ?auto_739148 ?auto_739158 ) ) ( not ( = ?auto_739148 ?auto_739159 ) ) ( not ( = ?auto_739148 ?auto_739160 ) ) ( not ( = ?auto_739148 ?auto_739161 ) ) ( not ( = ?auto_739149 ?auto_739150 ) ) ( not ( = ?auto_739149 ?auto_739151 ) ) ( not ( = ?auto_739149 ?auto_739152 ) ) ( not ( = ?auto_739149 ?auto_739153 ) ) ( not ( = ?auto_739149 ?auto_739154 ) ) ( not ( = ?auto_739149 ?auto_739155 ) ) ( not ( = ?auto_739149 ?auto_739156 ) ) ( not ( = ?auto_739149 ?auto_739157 ) ) ( not ( = ?auto_739149 ?auto_739158 ) ) ( not ( = ?auto_739149 ?auto_739159 ) ) ( not ( = ?auto_739149 ?auto_739160 ) ) ( not ( = ?auto_739149 ?auto_739161 ) ) ( not ( = ?auto_739150 ?auto_739151 ) ) ( not ( = ?auto_739150 ?auto_739152 ) ) ( not ( = ?auto_739150 ?auto_739153 ) ) ( not ( = ?auto_739150 ?auto_739154 ) ) ( not ( = ?auto_739150 ?auto_739155 ) ) ( not ( = ?auto_739150 ?auto_739156 ) ) ( not ( = ?auto_739150 ?auto_739157 ) ) ( not ( = ?auto_739150 ?auto_739158 ) ) ( not ( = ?auto_739150 ?auto_739159 ) ) ( not ( = ?auto_739150 ?auto_739160 ) ) ( not ( = ?auto_739150 ?auto_739161 ) ) ( not ( = ?auto_739151 ?auto_739152 ) ) ( not ( = ?auto_739151 ?auto_739153 ) ) ( not ( = ?auto_739151 ?auto_739154 ) ) ( not ( = ?auto_739151 ?auto_739155 ) ) ( not ( = ?auto_739151 ?auto_739156 ) ) ( not ( = ?auto_739151 ?auto_739157 ) ) ( not ( = ?auto_739151 ?auto_739158 ) ) ( not ( = ?auto_739151 ?auto_739159 ) ) ( not ( = ?auto_739151 ?auto_739160 ) ) ( not ( = ?auto_739151 ?auto_739161 ) ) ( not ( = ?auto_739152 ?auto_739153 ) ) ( not ( = ?auto_739152 ?auto_739154 ) ) ( not ( = ?auto_739152 ?auto_739155 ) ) ( not ( = ?auto_739152 ?auto_739156 ) ) ( not ( = ?auto_739152 ?auto_739157 ) ) ( not ( = ?auto_739152 ?auto_739158 ) ) ( not ( = ?auto_739152 ?auto_739159 ) ) ( not ( = ?auto_739152 ?auto_739160 ) ) ( not ( = ?auto_739152 ?auto_739161 ) ) ( not ( = ?auto_739153 ?auto_739154 ) ) ( not ( = ?auto_739153 ?auto_739155 ) ) ( not ( = ?auto_739153 ?auto_739156 ) ) ( not ( = ?auto_739153 ?auto_739157 ) ) ( not ( = ?auto_739153 ?auto_739158 ) ) ( not ( = ?auto_739153 ?auto_739159 ) ) ( not ( = ?auto_739153 ?auto_739160 ) ) ( not ( = ?auto_739153 ?auto_739161 ) ) ( not ( = ?auto_739154 ?auto_739155 ) ) ( not ( = ?auto_739154 ?auto_739156 ) ) ( not ( = ?auto_739154 ?auto_739157 ) ) ( not ( = ?auto_739154 ?auto_739158 ) ) ( not ( = ?auto_739154 ?auto_739159 ) ) ( not ( = ?auto_739154 ?auto_739160 ) ) ( not ( = ?auto_739154 ?auto_739161 ) ) ( not ( = ?auto_739155 ?auto_739156 ) ) ( not ( = ?auto_739155 ?auto_739157 ) ) ( not ( = ?auto_739155 ?auto_739158 ) ) ( not ( = ?auto_739155 ?auto_739159 ) ) ( not ( = ?auto_739155 ?auto_739160 ) ) ( not ( = ?auto_739155 ?auto_739161 ) ) ( not ( = ?auto_739156 ?auto_739157 ) ) ( not ( = ?auto_739156 ?auto_739158 ) ) ( not ( = ?auto_739156 ?auto_739159 ) ) ( not ( = ?auto_739156 ?auto_739160 ) ) ( not ( = ?auto_739156 ?auto_739161 ) ) ( not ( = ?auto_739157 ?auto_739158 ) ) ( not ( = ?auto_739157 ?auto_739159 ) ) ( not ( = ?auto_739157 ?auto_739160 ) ) ( not ( = ?auto_739157 ?auto_739161 ) ) ( not ( = ?auto_739158 ?auto_739159 ) ) ( not ( = ?auto_739158 ?auto_739160 ) ) ( not ( = ?auto_739158 ?auto_739161 ) ) ( not ( = ?auto_739159 ?auto_739160 ) ) ( not ( = ?auto_739159 ?auto_739161 ) ) ( not ( = ?auto_739160 ?auto_739161 ) ) ( ON ?auto_739160 ?auto_739161 ) ( ON ?auto_739159 ?auto_739160 ) ( ON ?auto_739158 ?auto_739159 ) ( ON ?auto_739157 ?auto_739158 ) ( ON ?auto_739156 ?auto_739157 ) ( ON ?auto_739155 ?auto_739156 ) ( ON ?auto_739154 ?auto_739155 ) ( ON ?auto_739153 ?auto_739154 ) ( CLEAR ?auto_739151 ) ( ON ?auto_739152 ?auto_739153 ) ( CLEAR ?auto_739152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_739145 ?auto_739146 ?auto_739147 ?auto_739148 ?auto_739149 ?auto_739150 ?auto_739151 ?auto_739152 )
      ( MAKE-17PILE ?auto_739145 ?auto_739146 ?auto_739147 ?auto_739148 ?auto_739149 ?auto_739150 ?auto_739151 ?auto_739152 ?auto_739153 ?auto_739154 ?auto_739155 ?auto_739156 ?auto_739157 ?auto_739158 ?auto_739159 ?auto_739160 ?auto_739161 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739179 - BLOCK
      ?auto_739180 - BLOCK
      ?auto_739181 - BLOCK
      ?auto_739182 - BLOCK
      ?auto_739183 - BLOCK
      ?auto_739184 - BLOCK
      ?auto_739185 - BLOCK
      ?auto_739186 - BLOCK
      ?auto_739187 - BLOCK
      ?auto_739188 - BLOCK
      ?auto_739189 - BLOCK
      ?auto_739190 - BLOCK
      ?auto_739191 - BLOCK
      ?auto_739192 - BLOCK
      ?auto_739193 - BLOCK
      ?auto_739194 - BLOCK
      ?auto_739195 - BLOCK
    )
    :vars
    (
      ?auto_739196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739195 ?auto_739196 ) ( ON-TABLE ?auto_739179 ) ( ON ?auto_739180 ?auto_739179 ) ( ON ?auto_739181 ?auto_739180 ) ( ON ?auto_739182 ?auto_739181 ) ( ON ?auto_739183 ?auto_739182 ) ( ON ?auto_739184 ?auto_739183 ) ( not ( = ?auto_739179 ?auto_739180 ) ) ( not ( = ?auto_739179 ?auto_739181 ) ) ( not ( = ?auto_739179 ?auto_739182 ) ) ( not ( = ?auto_739179 ?auto_739183 ) ) ( not ( = ?auto_739179 ?auto_739184 ) ) ( not ( = ?auto_739179 ?auto_739185 ) ) ( not ( = ?auto_739179 ?auto_739186 ) ) ( not ( = ?auto_739179 ?auto_739187 ) ) ( not ( = ?auto_739179 ?auto_739188 ) ) ( not ( = ?auto_739179 ?auto_739189 ) ) ( not ( = ?auto_739179 ?auto_739190 ) ) ( not ( = ?auto_739179 ?auto_739191 ) ) ( not ( = ?auto_739179 ?auto_739192 ) ) ( not ( = ?auto_739179 ?auto_739193 ) ) ( not ( = ?auto_739179 ?auto_739194 ) ) ( not ( = ?auto_739179 ?auto_739195 ) ) ( not ( = ?auto_739179 ?auto_739196 ) ) ( not ( = ?auto_739180 ?auto_739181 ) ) ( not ( = ?auto_739180 ?auto_739182 ) ) ( not ( = ?auto_739180 ?auto_739183 ) ) ( not ( = ?auto_739180 ?auto_739184 ) ) ( not ( = ?auto_739180 ?auto_739185 ) ) ( not ( = ?auto_739180 ?auto_739186 ) ) ( not ( = ?auto_739180 ?auto_739187 ) ) ( not ( = ?auto_739180 ?auto_739188 ) ) ( not ( = ?auto_739180 ?auto_739189 ) ) ( not ( = ?auto_739180 ?auto_739190 ) ) ( not ( = ?auto_739180 ?auto_739191 ) ) ( not ( = ?auto_739180 ?auto_739192 ) ) ( not ( = ?auto_739180 ?auto_739193 ) ) ( not ( = ?auto_739180 ?auto_739194 ) ) ( not ( = ?auto_739180 ?auto_739195 ) ) ( not ( = ?auto_739180 ?auto_739196 ) ) ( not ( = ?auto_739181 ?auto_739182 ) ) ( not ( = ?auto_739181 ?auto_739183 ) ) ( not ( = ?auto_739181 ?auto_739184 ) ) ( not ( = ?auto_739181 ?auto_739185 ) ) ( not ( = ?auto_739181 ?auto_739186 ) ) ( not ( = ?auto_739181 ?auto_739187 ) ) ( not ( = ?auto_739181 ?auto_739188 ) ) ( not ( = ?auto_739181 ?auto_739189 ) ) ( not ( = ?auto_739181 ?auto_739190 ) ) ( not ( = ?auto_739181 ?auto_739191 ) ) ( not ( = ?auto_739181 ?auto_739192 ) ) ( not ( = ?auto_739181 ?auto_739193 ) ) ( not ( = ?auto_739181 ?auto_739194 ) ) ( not ( = ?auto_739181 ?auto_739195 ) ) ( not ( = ?auto_739181 ?auto_739196 ) ) ( not ( = ?auto_739182 ?auto_739183 ) ) ( not ( = ?auto_739182 ?auto_739184 ) ) ( not ( = ?auto_739182 ?auto_739185 ) ) ( not ( = ?auto_739182 ?auto_739186 ) ) ( not ( = ?auto_739182 ?auto_739187 ) ) ( not ( = ?auto_739182 ?auto_739188 ) ) ( not ( = ?auto_739182 ?auto_739189 ) ) ( not ( = ?auto_739182 ?auto_739190 ) ) ( not ( = ?auto_739182 ?auto_739191 ) ) ( not ( = ?auto_739182 ?auto_739192 ) ) ( not ( = ?auto_739182 ?auto_739193 ) ) ( not ( = ?auto_739182 ?auto_739194 ) ) ( not ( = ?auto_739182 ?auto_739195 ) ) ( not ( = ?auto_739182 ?auto_739196 ) ) ( not ( = ?auto_739183 ?auto_739184 ) ) ( not ( = ?auto_739183 ?auto_739185 ) ) ( not ( = ?auto_739183 ?auto_739186 ) ) ( not ( = ?auto_739183 ?auto_739187 ) ) ( not ( = ?auto_739183 ?auto_739188 ) ) ( not ( = ?auto_739183 ?auto_739189 ) ) ( not ( = ?auto_739183 ?auto_739190 ) ) ( not ( = ?auto_739183 ?auto_739191 ) ) ( not ( = ?auto_739183 ?auto_739192 ) ) ( not ( = ?auto_739183 ?auto_739193 ) ) ( not ( = ?auto_739183 ?auto_739194 ) ) ( not ( = ?auto_739183 ?auto_739195 ) ) ( not ( = ?auto_739183 ?auto_739196 ) ) ( not ( = ?auto_739184 ?auto_739185 ) ) ( not ( = ?auto_739184 ?auto_739186 ) ) ( not ( = ?auto_739184 ?auto_739187 ) ) ( not ( = ?auto_739184 ?auto_739188 ) ) ( not ( = ?auto_739184 ?auto_739189 ) ) ( not ( = ?auto_739184 ?auto_739190 ) ) ( not ( = ?auto_739184 ?auto_739191 ) ) ( not ( = ?auto_739184 ?auto_739192 ) ) ( not ( = ?auto_739184 ?auto_739193 ) ) ( not ( = ?auto_739184 ?auto_739194 ) ) ( not ( = ?auto_739184 ?auto_739195 ) ) ( not ( = ?auto_739184 ?auto_739196 ) ) ( not ( = ?auto_739185 ?auto_739186 ) ) ( not ( = ?auto_739185 ?auto_739187 ) ) ( not ( = ?auto_739185 ?auto_739188 ) ) ( not ( = ?auto_739185 ?auto_739189 ) ) ( not ( = ?auto_739185 ?auto_739190 ) ) ( not ( = ?auto_739185 ?auto_739191 ) ) ( not ( = ?auto_739185 ?auto_739192 ) ) ( not ( = ?auto_739185 ?auto_739193 ) ) ( not ( = ?auto_739185 ?auto_739194 ) ) ( not ( = ?auto_739185 ?auto_739195 ) ) ( not ( = ?auto_739185 ?auto_739196 ) ) ( not ( = ?auto_739186 ?auto_739187 ) ) ( not ( = ?auto_739186 ?auto_739188 ) ) ( not ( = ?auto_739186 ?auto_739189 ) ) ( not ( = ?auto_739186 ?auto_739190 ) ) ( not ( = ?auto_739186 ?auto_739191 ) ) ( not ( = ?auto_739186 ?auto_739192 ) ) ( not ( = ?auto_739186 ?auto_739193 ) ) ( not ( = ?auto_739186 ?auto_739194 ) ) ( not ( = ?auto_739186 ?auto_739195 ) ) ( not ( = ?auto_739186 ?auto_739196 ) ) ( not ( = ?auto_739187 ?auto_739188 ) ) ( not ( = ?auto_739187 ?auto_739189 ) ) ( not ( = ?auto_739187 ?auto_739190 ) ) ( not ( = ?auto_739187 ?auto_739191 ) ) ( not ( = ?auto_739187 ?auto_739192 ) ) ( not ( = ?auto_739187 ?auto_739193 ) ) ( not ( = ?auto_739187 ?auto_739194 ) ) ( not ( = ?auto_739187 ?auto_739195 ) ) ( not ( = ?auto_739187 ?auto_739196 ) ) ( not ( = ?auto_739188 ?auto_739189 ) ) ( not ( = ?auto_739188 ?auto_739190 ) ) ( not ( = ?auto_739188 ?auto_739191 ) ) ( not ( = ?auto_739188 ?auto_739192 ) ) ( not ( = ?auto_739188 ?auto_739193 ) ) ( not ( = ?auto_739188 ?auto_739194 ) ) ( not ( = ?auto_739188 ?auto_739195 ) ) ( not ( = ?auto_739188 ?auto_739196 ) ) ( not ( = ?auto_739189 ?auto_739190 ) ) ( not ( = ?auto_739189 ?auto_739191 ) ) ( not ( = ?auto_739189 ?auto_739192 ) ) ( not ( = ?auto_739189 ?auto_739193 ) ) ( not ( = ?auto_739189 ?auto_739194 ) ) ( not ( = ?auto_739189 ?auto_739195 ) ) ( not ( = ?auto_739189 ?auto_739196 ) ) ( not ( = ?auto_739190 ?auto_739191 ) ) ( not ( = ?auto_739190 ?auto_739192 ) ) ( not ( = ?auto_739190 ?auto_739193 ) ) ( not ( = ?auto_739190 ?auto_739194 ) ) ( not ( = ?auto_739190 ?auto_739195 ) ) ( not ( = ?auto_739190 ?auto_739196 ) ) ( not ( = ?auto_739191 ?auto_739192 ) ) ( not ( = ?auto_739191 ?auto_739193 ) ) ( not ( = ?auto_739191 ?auto_739194 ) ) ( not ( = ?auto_739191 ?auto_739195 ) ) ( not ( = ?auto_739191 ?auto_739196 ) ) ( not ( = ?auto_739192 ?auto_739193 ) ) ( not ( = ?auto_739192 ?auto_739194 ) ) ( not ( = ?auto_739192 ?auto_739195 ) ) ( not ( = ?auto_739192 ?auto_739196 ) ) ( not ( = ?auto_739193 ?auto_739194 ) ) ( not ( = ?auto_739193 ?auto_739195 ) ) ( not ( = ?auto_739193 ?auto_739196 ) ) ( not ( = ?auto_739194 ?auto_739195 ) ) ( not ( = ?auto_739194 ?auto_739196 ) ) ( not ( = ?auto_739195 ?auto_739196 ) ) ( ON ?auto_739194 ?auto_739195 ) ( ON ?auto_739193 ?auto_739194 ) ( ON ?auto_739192 ?auto_739193 ) ( ON ?auto_739191 ?auto_739192 ) ( ON ?auto_739190 ?auto_739191 ) ( ON ?auto_739189 ?auto_739190 ) ( ON ?auto_739188 ?auto_739189 ) ( ON ?auto_739187 ?auto_739188 ) ( ON ?auto_739186 ?auto_739187 ) ( CLEAR ?auto_739184 ) ( ON ?auto_739185 ?auto_739186 ) ( CLEAR ?auto_739185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_739179 ?auto_739180 ?auto_739181 ?auto_739182 ?auto_739183 ?auto_739184 ?auto_739185 )
      ( MAKE-17PILE ?auto_739179 ?auto_739180 ?auto_739181 ?auto_739182 ?auto_739183 ?auto_739184 ?auto_739185 ?auto_739186 ?auto_739187 ?auto_739188 ?auto_739189 ?auto_739190 ?auto_739191 ?auto_739192 ?auto_739193 ?auto_739194 ?auto_739195 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739214 - BLOCK
      ?auto_739215 - BLOCK
      ?auto_739216 - BLOCK
      ?auto_739217 - BLOCK
      ?auto_739218 - BLOCK
      ?auto_739219 - BLOCK
      ?auto_739220 - BLOCK
      ?auto_739221 - BLOCK
      ?auto_739222 - BLOCK
      ?auto_739223 - BLOCK
      ?auto_739224 - BLOCK
      ?auto_739225 - BLOCK
      ?auto_739226 - BLOCK
      ?auto_739227 - BLOCK
      ?auto_739228 - BLOCK
      ?auto_739229 - BLOCK
      ?auto_739230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739230 ) ( ON-TABLE ?auto_739214 ) ( ON ?auto_739215 ?auto_739214 ) ( ON ?auto_739216 ?auto_739215 ) ( ON ?auto_739217 ?auto_739216 ) ( ON ?auto_739218 ?auto_739217 ) ( ON ?auto_739219 ?auto_739218 ) ( not ( = ?auto_739214 ?auto_739215 ) ) ( not ( = ?auto_739214 ?auto_739216 ) ) ( not ( = ?auto_739214 ?auto_739217 ) ) ( not ( = ?auto_739214 ?auto_739218 ) ) ( not ( = ?auto_739214 ?auto_739219 ) ) ( not ( = ?auto_739214 ?auto_739220 ) ) ( not ( = ?auto_739214 ?auto_739221 ) ) ( not ( = ?auto_739214 ?auto_739222 ) ) ( not ( = ?auto_739214 ?auto_739223 ) ) ( not ( = ?auto_739214 ?auto_739224 ) ) ( not ( = ?auto_739214 ?auto_739225 ) ) ( not ( = ?auto_739214 ?auto_739226 ) ) ( not ( = ?auto_739214 ?auto_739227 ) ) ( not ( = ?auto_739214 ?auto_739228 ) ) ( not ( = ?auto_739214 ?auto_739229 ) ) ( not ( = ?auto_739214 ?auto_739230 ) ) ( not ( = ?auto_739215 ?auto_739216 ) ) ( not ( = ?auto_739215 ?auto_739217 ) ) ( not ( = ?auto_739215 ?auto_739218 ) ) ( not ( = ?auto_739215 ?auto_739219 ) ) ( not ( = ?auto_739215 ?auto_739220 ) ) ( not ( = ?auto_739215 ?auto_739221 ) ) ( not ( = ?auto_739215 ?auto_739222 ) ) ( not ( = ?auto_739215 ?auto_739223 ) ) ( not ( = ?auto_739215 ?auto_739224 ) ) ( not ( = ?auto_739215 ?auto_739225 ) ) ( not ( = ?auto_739215 ?auto_739226 ) ) ( not ( = ?auto_739215 ?auto_739227 ) ) ( not ( = ?auto_739215 ?auto_739228 ) ) ( not ( = ?auto_739215 ?auto_739229 ) ) ( not ( = ?auto_739215 ?auto_739230 ) ) ( not ( = ?auto_739216 ?auto_739217 ) ) ( not ( = ?auto_739216 ?auto_739218 ) ) ( not ( = ?auto_739216 ?auto_739219 ) ) ( not ( = ?auto_739216 ?auto_739220 ) ) ( not ( = ?auto_739216 ?auto_739221 ) ) ( not ( = ?auto_739216 ?auto_739222 ) ) ( not ( = ?auto_739216 ?auto_739223 ) ) ( not ( = ?auto_739216 ?auto_739224 ) ) ( not ( = ?auto_739216 ?auto_739225 ) ) ( not ( = ?auto_739216 ?auto_739226 ) ) ( not ( = ?auto_739216 ?auto_739227 ) ) ( not ( = ?auto_739216 ?auto_739228 ) ) ( not ( = ?auto_739216 ?auto_739229 ) ) ( not ( = ?auto_739216 ?auto_739230 ) ) ( not ( = ?auto_739217 ?auto_739218 ) ) ( not ( = ?auto_739217 ?auto_739219 ) ) ( not ( = ?auto_739217 ?auto_739220 ) ) ( not ( = ?auto_739217 ?auto_739221 ) ) ( not ( = ?auto_739217 ?auto_739222 ) ) ( not ( = ?auto_739217 ?auto_739223 ) ) ( not ( = ?auto_739217 ?auto_739224 ) ) ( not ( = ?auto_739217 ?auto_739225 ) ) ( not ( = ?auto_739217 ?auto_739226 ) ) ( not ( = ?auto_739217 ?auto_739227 ) ) ( not ( = ?auto_739217 ?auto_739228 ) ) ( not ( = ?auto_739217 ?auto_739229 ) ) ( not ( = ?auto_739217 ?auto_739230 ) ) ( not ( = ?auto_739218 ?auto_739219 ) ) ( not ( = ?auto_739218 ?auto_739220 ) ) ( not ( = ?auto_739218 ?auto_739221 ) ) ( not ( = ?auto_739218 ?auto_739222 ) ) ( not ( = ?auto_739218 ?auto_739223 ) ) ( not ( = ?auto_739218 ?auto_739224 ) ) ( not ( = ?auto_739218 ?auto_739225 ) ) ( not ( = ?auto_739218 ?auto_739226 ) ) ( not ( = ?auto_739218 ?auto_739227 ) ) ( not ( = ?auto_739218 ?auto_739228 ) ) ( not ( = ?auto_739218 ?auto_739229 ) ) ( not ( = ?auto_739218 ?auto_739230 ) ) ( not ( = ?auto_739219 ?auto_739220 ) ) ( not ( = ?auto_739219 ?auto_739221 ) ) ( not ( = ?auto_739219 ?auto_739222 ) ) ( not ( = ?auto_739219 ?auto_739223 ) ) ( not ( = ?auto_739219 ?auto_739224 ) ) ( not ( = ?auto_739219 ?auto_739225 ) ) ( not ( = ?auto_739219 ?auto_739226 ) ) ( not ( = ?auto_739219 ?auto_739227 ) ) ( not ( = ?auto_739219 ?auto_739228 ) ) ( not ( = ?auto_739219 ?auto_739229 ) ) ( not ( = ?auto_739219 ?auto_739230 ) ) ( not ( = ?auto_739220 ?auto_739221 ) ) ( not ( = ?auto_739220 ?auto_739222 ) ) ( not ( = ?auto_739220 ?auto_739223 ) ) ( not ( = ?auto_739220 ?auto_739224 ) ) ( not ( = ?auto_739220 ?auto_739225 ) ) ( not ( = ?auto_739220 ?auto_739226 ) ) ( not ( = ?auto_739220 ?auto_739227 ) ) ( not ( = ?auto_739220 ?auto_739228 ) ) ( not ( = ?auto_739220 ?auto_739229 ) ) ( not ( = ?auto_739220 ?auto_739230 ) ) ( not ( = ?auto_739221 ?auto_739222 ) ) ( not ( = ?auto_739221 ?auto_739223 ) ) ( not ( = ?auto_739221 ?auto_739224 ) ) ( not ( = ?auto_739221 ?auto_739225 ) ) ( not ( = ?auto_739221 ?auto_739226 ) ) ( not ( = ?auto_739221 ?auto_739227 ) ) ( not ( = ?auto_739221 ?auto_739228 ) ) ( not ( = ?auto_739221 ?auto_739229 ) ) ( not ( = ?auto_739221 ?auto_739230 ) ) ( not ( = ?auto_739222 ?auto_739223 ) ) ( not ( = ?auto_739222 ?auto_739224 ) ) ( not ( = ?auto_739222 ?auto_739225 ) ) ( not ( = ?auto_739222 ?auto_739226 ) ) ( not ( = ?auto_739222 ?auto_739227 ) ) ( not ( = ?auto_739222 ?auto_739228 ) ) ( not ( = ?auto_739222 ?auto_739229 ) ) ( not ( = ?auto_739222 ?auto_739230 ) ) ( not ( = ?auto_739223 ?auto_739224 ) ) ( not ( = ?auto_739223 ?auto_739225 ) ) ( not ( = ?auto_739223 ?auto_739226 ) ) ( not ( = ?auto_739223 ?auto_739227 ) ) ( not ( = ?auto_739223 ?auto_739228 ) ) ( not ( = ?auto_739223 ?auto_739229 ) ) ( not ( = ?auto_739223 ?auto_739230 ) ) ( not ( = ?auto_739224 ?auto_739225 ) ) ( not ( = ?auto_739224 ?auto_739226 ) ) ( not ( = ?auto_739224 ?auto_739227 ) ) ( not ( = ?auto_739224 ?auto_739228 ) ) ( not ( = ?auto_739224 ?auto_739229 ) ) ( not ( = ?auto_739224 ?auto_739230 ) ) ( not ( = ?auto_739225 ?auto_739226 ) ) ( not ( = ?auto_739225 ?auto_739227 ) ) ( not ( = ?auto_739225 ?auto_739228 ) ) ( not ( = ?auto_739225 ?auto_739229 ) ) ( not ( = ?auto_739225 ?auto_739230 ) ) ( not ( = ?auto_739226 ?auto_739227 ) ) ( not ( = ?auto_739226 ?auto_739228 ) ) ( not ( = ?auto_739226 ?auto_739229 ) ) ( not ( = ?auto_739226 ?auto_739230 ) ) ( not ( = ?auto_739227 ?auto_739228 ) ) ( not ( = ?auto_739227 ?auto_739229 ) ) ( not ( = ?auto_739227 ?auto_739230 ) ) ( not ( = ?auto_739228 ?auto_739229 ) ) ( not ( = ?auto_739228 ?auto_739230 ) ) ( not ( = ?auto_739229 ?auto_739230 ) ) ( ON ?auto_739229 ?auto_739230 ) ( ON ?auto_739228 ?auto_739229 ) ( ON ?auto_739227 ?auto_739228 ) ( ON ?auto_739226 ?auto_739227 ) ( ON ?auto_739225 ?auto_739226 ) ( ON ?auto_739224 ?auto_739225 ) ( ON ?auto_739223 ?auto_739224 ) ( ON ?auto_739222 ?auto_739223 ) ( ON ?auto_739221 ?auto_739222 ) ( CLEAR ?auto_739219 ) ( ON ?auto_739220 ?auto_739221 ) ( CLEAR ?auto_739220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_739214 ?auto_739215 ?auto_739216 ?auto_739217 ?auto_739218 ?auto_739219 ?auto_739220 )
      ( MAKE-17PILE ?auto_739214 ?auto_739215 ?auto_739216 ?auto_739217 ?auto_739218 ?auto_739219 ?auto_739220 ?auto_739221 ?auto_739222 ?auto_739223 ?auto_739224 ?auto_739225 ?auto_739226 ?auto_739227 ?auto_739228 ?auto_739229 ?auto_739230 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739248 - BLOCK
      ?auto_739249 - BLOCK
      ?auto_739250 - BLOCK
      ?auto_739251 - BLOCK
      ?auto_739252 - BLOCK
      ?auto_739253 - BLOCK
      ?auto_739254 - BLOCK
      ?auto_739255 - BLOCK
      ?auto_739256 - BLOCK
      ?auto_739257 - BLOCK
      ?auto_739258 - BLOCK
      ?auto_739259 - BLOCK
      ?auto_739260 - BLOCK
      ?auto_739261 - BLOCK
      ?auto_739262 - BLOCK
      ?auto_739263 - BLOCK
      ?auto_739264 - BLOCK
    )
    :vars
    (
      ?auto_739265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739264 ?auto_739265 ) ( ON-TABLE ?auto_739248 ) ( ON ?auto_739249 ?auto_739248 ) ( ON ?auto_739250 ?auto_739249 ) ( ON ?auto_739251 ?auto_739250 ) ( ON ?auto_739252 ?auto_739251 ) ( not ( = ?auto_739248 ?auto_739249 ) ) ( not ( = ?auto_739248 ?auto_739250 ) ) ( not ( = ?auto_739248 ?auto_739251 ) ) ( not ( = ?auto_739248 ?auto_739252 ) ) ( not ( = ?auto_739248 ?auto_739253 ) ) ( not ( = ?auto_739248 ?auto_739254 ) ) ( not ( = ?auto_739248 ?auto_739255 ) ) ( not ( = ?auto_739248 ?auto_739256 ) ) ( not ( = ?auto_739248 ?auto_739257 ) ) ( not ( = ?auto_739248 ?auto_739258 ) ) ( not ( = ?auto_739248 ?auto_739259 ) ) ( not ( = ?auto_739248 ?auto_739260 ) ) ( not ( = ?auto_739248 ?auto_739261 ) ) ( not ( = ?auto_739248 ?auto_739262 ) ) ( not ( = ?auto_739248 ?auto_739263 ) ) ( not ( = ?auto_739248 ?auto_739264 ) ) ( not ( = ?auto_739248 ?auto_739265 ) ) ( not ( = ?auto_739249 ?auto_739250 ) ) ( not ( = ?auto_739249 ?auto_739251 ) ) ( not ( = ?auto_739249 ?auto_739252 ) ) ( not ( = ?auto_739249 ?auto_739253 ) ) ( not ( = ?auto_739249 ?auto_739254 ) ) ( not ( = ?auto_739249 ?auto_739255 ) ) ( not ( = ?auto_739249 ?auto_739256 ) ) ( not ( = ?auto_739249 ?auto_739257 ) ) ( not ( = ?auto_739249 ?auto_739258 ) ) ( not ( = ?auto_739249 ?auto_739259 ) ) ( not ( = ?auto_739249 ?auto_739260 ) ) ( not ( = ?auto_739249 ?auto_739261 ) ) ( not ( = ?auto_739249 ?auto_739262 ) ) ( not ( = ?auto_739249 ?auto_739263 ) ) ( not ( = ?auto_739249 ?auto_739264 ) ) ( not ( = ?auto_739249 ?auto_739265 ) ) ( not ( = ?auto_739250 ?auto_739251 ) ) ( not ( = ?auto_739250 ?auto_739252 ) ) ( not ( = ?auto_739250 ?auto_739253 ) ) ( not ( = ?auto_739250 ?auto_739254 ) ) ( not ( = ?auto_739250 ?auto_739255 ) ) ( not ( = ?auto_739250 ?auto_739256 ) ) ( not ( = ?auto_739250 ?auto_739257 ) ) ( not ( = ?auto_739250 ?auto_739258 ) ) ( not ( = ?auto_739250 ?auto_739259 ) ) ( not ( = ?auto_739250 ?auto_739260 ) ) ( not ( = ?auto_739250 ?auto_739261 ) ) ( not ( = ?auto_739250 ?auto_739262 ) ) ( not ( = ?auto_739250 ?auto_739263 ) ) ( not ( = ?auto_739250 ?auto_739264 ) ) ( not ( = ?auto_739250 ?auto_739265 ) ) ( not ( = ?auto_739251 ?auto_739252 ) ) ( not ( = ?auto_739251 ?auto_739253 ) ) ( not ( = ?auto_739251 ?auto_739254 ) ) ( not ( = ?auto_739251 ?auto_739255 ) ) ( not ( = ?auto_739251 ?auto_739256 ) ) ( not ( = ?auto_739251 ?auto_739257 ) ) ( not ( = ?auto_739251 ?auto_739258 ) ) ( not ( = ?auto_739251 ?auto_739259 ) ) ( not ( = ?auto_739251 ?auto_739260 ) ) ( not ( = ?auto_739251 ?auto_739261 ) ) ( not ( = ?auto_739251 ?auto_739262 ) ) ( not ( = ?auto_739251 ?auto_739263 ) ) ( not ( = ?auto_739251 ?auto_739264 ) ) ( not ( = ?auto_739251 ?auto_739265 ) ) ( not ( = ?auto_739252 ?auto_739253 ) ) ( not ( = ?auto_739252 ?auto_739254 ) ) ( not ( = ?auto_739252 ?auto_739255 ) ) ( not ( = ?auto_739252 ?auto_739256 ) ) ( not ( = ?auto_739252 ?auto_739257 ) ) ( not ( = ?auto_739252 ?auto_739258 ) ) ( not ( = ?auto_739252 ?auto_739259 ) ) ( not ( = ?auto_739252 ?auto_739260 ) ) ( not ( = ?auto_739252 ?auto_739261 ) ) ( not ( = ?auto_739252 ?auto_739262 ) ) ( not ( = ?auto_739252 ?auto_739263 ) ) ( not ( = ?auto_739252 ?auto_739264 ) ) ( not ( = ?auto_739252 ?auto_739265 ) ) ( not ( = ?auto_739253 ?auto_739254 ) ) ( not ( = ?auto_739253 ?auto_739255 ) ) ( not ( = ?auto_739253 ?auto_739256 ) ) ( not ( = ?auto_739253 ?auto_739257 ) ) ( not ( = ?auto_739253 ?auto_739258 ) ) ( not ( = ?auto_739253 ?auto_739259 ) ) ( not ( = ?auto_739253 ?auto_739260 ) ) ( not ( = ?auto_739253 ?auto_739261 ) ) ( not ( = ?auto_739253 ?auto_739262 ) ) ( not ( = ?auto_739253 ?auto_739263 ) ) ( not ( = ?auto_739253 ?auto_739264 ) ) ( not ( = ?auto_739253 ?auto_739265 ) ) ( not ( = ?auto_739254 ?auto_739255 ) ) ( not ( = ?auto_739254 ?auto_739256 ) ) ( not ( = ?auto_739254 ?auto_739257 ) ) ( not ( = ?auto_739254 ?auto_739258 ) ) ( not ( = ?auto_739254 ?auto_739259 ) ) ( not ( = ?auto_739254 ?auto_739260 ) ) ( not ( = ?auto_739254 ?auto_739261 ) ) ( not ( = ?auto_739254 ?auto_739262 ) ) ( not ( = ?auto_739254 ?auto_739263 ) ) ( not ( = ?auto_739254 ?auto_739264 ) ) ( not ( = ?auto_739254 ?auto_739265 ) ) ( not ( = ?auto_739255 ?auto_739256 ) ) ( not ( = ?auto_739255 ?auto_739257 ) ) ( not ( = ?auto_739255 ?auto_739258 ) ) ( not ( = ?auto_739255 ?auto_739259 ) ) ( not ( = ?auto_739255 ?auto_739260 ) ) ( not ( = ?auto_739255 ?auto_739261 ) ) ( not ( = ?auto_739255 ?auto_739262 ) ) ( not ( = ?auto_739255 ?auto_739263 ) ) ( not ( = ?auto_739255 ?auto_739264 ) ) ( not ( = ?auto_739255 ?auto_739265 ) ) ( not ( = ?auto_739256 ?auto_739257 ) ) ( not ( = ?auto_739256 ?auto_739258 ) ) ( not ( = ?auto_739256 ?auto_739259 ) ) ( not ( = ?auto_739256 ?auto_739260 ) ) ( not ( = ?auto_739256 ?auto_739261 ) ) ( not ( = ?auto_739256 ?auto_739262 ) ) ( not ( = ?auto_739256 ?auto_739263 ) ) ( not ( = ?auto_739256 ?auto_739264 ) ) ( not ( = ?auto_739256 ?auto_739265 ) ) ( not ( = ?auto_739257 ?auto_739258 ) ) ( not ( = ?auto_739257 ?auto_739259 ) ) ( not ( = ?auto_739257 ?auto_739260 ) ) ( not ( = ?auto_739257 ?auto_739261 ) ) ( not ( = ?auto_739257 ?auto_739262 ) ) ( not ( = ?auto_739257 ?auto_739263 ) ) ( not ( = ?auto_739257 ?auto_739264 ) ) ( not ( = ?auto_739257 ?auto_739265 ) ) ( not ( = ?auto_739258 ?auto_739259 ) ) ( not ( = ?auto_739258 ?auto_739260 ) ) ( not ( = ?auto_739258 ?auto_739261 ) ) ( not ( = ?auto_739258 ?auto_739262 ) ) ( not ( = ?auto_739258 ?auto_739263 ) ) ( not ( = ?auto_739258 ?auto_739264 ) ) ( not ( = ?auto_739258 ?auto_739265 ) ) ( not ( = ?auto_739259 ?auto_739260 ) ) ( not ( = ?auto_739259 ?auto_739261 ) ) ( not ( = ?auto_739259 ?auto_739262 ) ) ( not ( = ?auto_739259 ?auto_739263 ) ) ( not ( = ?auto_739259 ?auto_739264 ) ) ( not ( = ?auto_739259 ?auto_739265 ) ) ( not ( = ?auto_739260 ?auto_739261 ) ) ( not ( = ?auto_739260 ?auto_739262 ) ) ( not ( = ?auto_739260 ?auto_739263 ) ) ( not ( = ?auto_739260 ?auto_739264 ) ) ( not ( = ?auto_739260 ?auto_739265 ) ) ( not ( = ?auto_739261 ?auto_739262 ) ) ( not ( = ?auto_739261 ?auto_739263 ) ) ( not ( = ?auto_739261 ?auto_739264 ) ) ( not ( = ?auto_739261 ?auto_739265 ) ) ( not ( = ?auto_739262 ?auto_739263 ) ) ( not ( = ?auto_739262 ?auto_739264 ) ) ( not ( = ?auto_739262 ?auto_739265 ) ) ( not ( = ?auto_739263 ?auto_739264 ) ) ( not ( = ?auto_739263 ?auto_739265 ) ) ( not ( = ?auto_739264 ?auto_739265 ) ) ( ON ?auto_739263 ?auto_739264 ) ( ON ?auto_739262 ?auto_739263 ) ( ON ?auto_739261 ?auto_739262 ) ( ON ?auto_739260 ?auto_739261 ) ( ON ?auto_739259 ?auto_739260 ) ( ON ?auto_739258 ?auto_739259 ) ( ON ?auto_739257 ?auto_739258 ) ( ON ?auto_739256 ?auto_739257 ) ( ON ?auto_739255 ?auto_739256 ) ( ON ?auto_739254 ?auto_739255 ) ( CLEAR ?auto_739252 ) ( ON ?auto_739253 ?auto_739254 ) ( CLEAR ?auto_739253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_739248 ?auto_739249 ?auto_739250 ?auto_739251 ?auto_739252 ?auto_739253 )
      ( MAKE-17PILE ?auto_739248 ?auto_739249 ?auto_739250 ?auto_739251 ?auto_739252 ?auto_739253 ?auto_739254 ?auto_739255 ?auto_739256 ?auto_739257 ?auto_739258 ?auto_739259 ?auto_739260 ?auto_739261 ?auto_739262 ?auto_739263 ?auto_739264 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739283 - BLOCK
      ?auto_739284 - BLOCK
      ?auto_739285 - BLOCK
      ?auto_739286 - BLOCK
      ?auto_739287 - BLOCK
      ?auto_739288 - BLOCK
      ?auto_739289 - BLOCK
      ?auto_739290 - BLOCK
      ?auto_739291 - BLOCK
      ?auto_739292 - BLOCK
      ?auto_739293 - BLOCK
      ?auto_739294 - BLOCK
      ?auto_739295 - BLOCK
      ?auto_739296 - BLOCK
      ?auto_739297 - BLOCK
      ?auto_739298 - BLOCK
      ?auto_739299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739299 ) ( ON-TABLE ?auto_739283 ) ( ON ?auto_739284 ?auto_739283 ) ( ON ?auto_739285 ?auto_739284 ) ( ON ?auto_739286 ?auto_739285 ) ( ON ?auto_739287 ?auto_739286 ) ( not ( = ?auto_739283 ?auto_739284 ) ) ( not ( = ?auto_739283 ?auto_739285 ) ) ( not ( = ?auto_739283 ?auto_739286 ) ) ( not ( = ?auto_739283 ?auto_739287 ) ) ( not ( = ?auto_739283 ?auto_739288 ) ) ( not ( = ?auto_739283 ?auto_739289 ) ) ( not ( = ?auto_739283 ?auto_739290 ) ) ( not ( = ?auto_739283 ?auto_739291 ) ) ( not ( = ?auto_739283 ?auto_739292 ) ) ( not ( = ?auto_739283 ?auto_739293 ) ) ( not ( = ?auto_739283 ?auto_739294 ) ) ( not ( = ?auto_739283 ?auto_739295 ) ) ( not ( = ?auto_739283 ?auto_739296 ) ) ( not ( = ?auto_739283 ?auto_739297 ) ) ( not ( = ?auto_739283 ?auto_739298 ) ) ( not ( = ?auto_739283 ?auto_739299 ) ) ( not ( = ?auto_739284 ?auto_739285 ) ) ( not ( = ?auto_739284 ?auto_739286 ) ) ( not ( = ?auto_739284 ?auto_739287 ) ) ( not ( = ?auto_739284 ?auto_739288 ) ) ( not ( = ?auto_739284 ?auto_739289 ) ) ( not ( = ?auto_739284 ?auto_739290 ) ) ( not ( = ?auto_739284 ?auto_739291 ) ) ( not ( = ?auto_739284 ?auto_739292 ) ) ( not ( = ?auto_739284 ?auto_739293 ) ) ( not ( = ?auto_739284 ?auto_739294 ) ) ( not ( = ?auto_739284 ?auto_739295 ) ) ( not ( = ?auto_739284 ?auto_739296 ) ) ( not ( = ?auto_739284 ?auto_739297 ) ) ( not ( = ?auto_739284 ?auto_739298 ) ) ( not ( = ?auto_739284 ?auto_739299 ) ) ( not ( = ?auto_739285 ?auto_739286 ) ) ( not ( = ?auto_739285 ?auto_739287 ) ) ( not ( = ?auto_739285 ?auto_739288 ) ) ( not ( = ?auto_739285 ?auto_739289 ) ) ( not ( = ?auto_739285 ?auto_739290 ) ) ( not ( = ?auto_739285 ?auto_739291 ) ) ( not ( = ?auto_739285 ?auto_739292 ) ) ( not ( = ?auto_739285 ?auto_739293 ) ) ( not ( = ?auto_739285 ?auto_739294 ) ) ( not ( = ?auto_739285 ?auto_739295 ) ) ( not ( = ?auto_739285 ?auto_739296 ) ) ( not ( = ?auto_739285 ?auto_739297 ) ) ( not ( = ?auto_739285 ?auto_739298 ) ) ( not ( = ?auto_739285 ?auto_739299 ) ) ( not ( = ?auto_739286 ?auto_739287 ) ) ( not ( = ?auto_739286 ?auto_739288 ) ) ( not ( = ?auto_739286 ?auto_739289 ) ) ( not ( = ?auto_739286 ?auto_739290 ) ) ( not ( = ?auto_739286 ?auto_739291 ) ) ( not ( = ?auto_739286 ?auto_739292 ) ) ( not ( = ?auto_739286 ?auto_739293 ) ) ( not ( = ?auto_739286 ?auto_739294 ) ) ( not ( = ?auto_739286 ?auto_739295 ) ) ( not ( = ?auto_739286 ?auto_739296 ) ) ( not ( = ?auto_739286 ?auto_739297 ) ) ( not ( = ?auto_739286 ?auto_739298 ) ) ( not ( = ?auto_739286 ?auto_739299 ) ) ( not ( = ?auto_739287 ?auto_739288 ) ) ( not ( = ?auto_739287 ?auto_739289 ) ) ( not ( = ?auto_739287 ?auto_739290 ) ) ( not ( = ?auto_739287 ?auto_739291 ) ) ( not ( = ?auto_739287 ?auto_739292 ) ) ( not ( = ?auto_739287 ?auto_739293 ) ) ( not ( = ?auto_739287 ?auto_739294 ) ) ( not ( = ?auto_739287 ?auto_739295 ) ) ( not ( = ?auto_739287 ?auto_739296 ) ) ( not ( = ?auto_739287 ?auto_739297 ) ) ( not ( = ?auto_739287 ?auto_739298 ) ) ( not ( = ?auto_739287 ?auto_739299 ) ) ( not ( = ?auto_739288 ?auto_739289 ) ) ( not ( = ?auto_739288 ?auto_739290 ) ) ( not ( = ?auto_739288 ?auto_739291 ) ) ( not ( = ?auto_739288 ?auto_739292 ) ) ( not ( = ?auto_739288 ?auto_739293 ) ) ( not ( = ?auto_739288 ?auto_739294 ) ) ( not ( = ?auto_739288 ?auto_739295 ) ) ( not ( = ?auto_739288 ?auto_739296 ) ) ( not ( = ?auto_739288 ?auto_739297 ) ) ( not ( = ?auto_739288 ?auto_739298 ) ) ( not ( = ?auto_739288 ?auto_739299 ) ) ( not ( = ?auto_739289 ?auto_739290 ) ) ( not ( = ?auto_739289 ?auto_739291 ) ) ( not ( = ?auto_739289 ?auto_739292 ) ) ( not ( = ?auto_739289 ?auto_739293 ) ) ( not ( = ?auto_739289 ?auto_739294 ) ) ( not ( = ?auto_739289 ?auto_739295 ) ) ( not ( = ?auto_739289 ?auto_739296 ) ) ( not ( = ?auto_739289 ?auto_739297 ) ) ( not ( = ?auto_739289 ?auto_739298 ) ) ( not ( = ?auto_739289 ?auto_739299 ) ) ( not ( = ?auto_739290 ?auto_739291 ) ) ( not ( = ?auto_739290 ?auto_739292 ) ) ( not ( = ?auto_739290 ?auto_739293 ) ) ( not ( = ?auto_739290 ?auto_739294 ) ) ( not ( = ?auto_739290 ?auto_739295 ) ) ( not ( = ?auto_739290 ?auto_739296 ) ) ( not ( = ?auto_739290 ?auto_739297 ) ) ( not ( = ?auto_739290 ?auto_739298 ) ) ( not ( = ?auto_739290 ?auto_739299 ) ) ( not ( = ?auto_739291 ?auto_739292 ) ) ( not ( = ?auto_739291 ?auto_739293 ) ) ( not ( = ?auto_739291 ?auto_739294 ) ) ( not ( = ?auto_739291 ?auto_739295 ) ) ( not ( = ?auto_739291 ?auto_739296 ) ) ( not ( = ?auto_739291 ?auto_739297 ) ) ( not ( = ?auto_739291 ?auto_739298 ) ) ( not ( = ?auto_739291 ?auto_739299 ) ) ( not ( = ?auto_739292 ?auto_739293 ) ) ( not ( = ?auto_739292 ?auto_739294 ) ) ( not ( = ?auto_739292 ?auto_739295 ) ) ( not ( = ?auto_739292 ?auto_739296 ) ) ( not ( = ?auto_739292 ?auto_739297 ) ) ( not ( = ?auto_739292 ?auto_739298 ) ) ( not ( = ?auto_739292 ?auto_739299 ) ) ( not ( = ?auto_739293 ?auto_739294 ) ) ( not ( = ?auto_739293 ?auto_739295 ) ) ( not ( = ?auto_739293 ?auto_739296 ) ) ( not ( = ?auto_739293 ?auto_739297 ) ) ( not ( = ?auto_739293 ?auto_739298 ) ) ( not ( = ?auto_739293 ?auto_739299 ) ) ( not ( = ?auto_739294 ?auto_739295 ) ) ( not ( = ?auto_739294 ?auto_739296 ) ) ( not ( = ?auto_739294 ?auto_739297 ) ) ( not ( = ?auto_739294 ?auto_739298 ) ) ( not ( = ?auto_739294 ?auto_739299 ) ) ( not ( = ?auto_739295 ?auto_739296 ) ) ( not ( = ?auto_739295 ?auto_739297 ) ) ( not ( = ?auto_739295 ?auto_739298 ) ) ( not ( = ?auto_739295 ?auto_739299 ) ) ( not ( = ?auto_739296 ?auto_739297 ) ) ( not ( = ?auto_739296 ?auto_739298 ) ) ( not ( = ?auto_739296 ?auto_739299 ) ) ( not ( = ?auto_739297 ?auto_739298 ) ) ( not ( = ?auto_739297 ?auto_739299 ) ) ( not ( = ?auto_739298 ?auto_739299 ) ) ( ON ?auto_739298 ?auto_739299 ) ( ON ?auto_739297 ?auto_739298 ) ( ON ?auto_739296 ?auto_739297 ) ( ON ?auto_739295 ?auto_739296 ) ( ON ?auto_739294 ?auto_739295 ) ( ON ?auto_739293 ?auto_739294 ) ( ON ?auto_739292 ?auto_739293 ) ( ON ?auto_739291 ?auto_739292 ) ( ON ?auto_739290 ?auto_739291 ) ( ON ?auto_739289 ?auto_739290 ) ( CLEAR ?auto_739287 ) ( ON ?auto_739288 ?auto_739289 ) ( CLEAR ?auto_739288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_739283 ?auto_739284 ?auto_739285 ?auto_739286 ?auto_739287 ?auto_739288 )
      ( MAKE-17PILE ?auto_739283 ?auto_739284 ?auto_739285 ?auto_739286 ?auto_739287 ?auto_739288 ?auto_739289 ?auto_739290 ?auto_739291 ?auto_739292 ?auto_739293 ?auto_739294 ?auto_739295 ?auto_739296 ?auto_739297 ?auto_739298 ?auto_739299 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739317 - BLOCK
      ?auto_739318 - BLOCK
      ?auto_739319 - BLOCK
      ?auto_739320 - BLOCK
      ?auto_739321 - BLOCK
      ?auto_739322 - BLOCK
      ?auto_739323 - BLOCK
      ?auto_739324 - BLOCK
      ?auto_739325 - BLOCK
      ?auto_739326 - BLOCK
      ?auto_739327 - BLOCK
      ?auto_739328 - BLOCK
      ?auto_739329 - BLOCK
      ?auto_739330 - BLOCK
      ?auto_739331 - BLOCK
      ?auto_739332 - BLOCK
      ?auto_739333 - BLOCK
    )
    :vars
    (
      ?auto_739334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739333 ?auto_739334 ) ( ON-TABLE ?auto_739317 ) ( ON ?auto_739318 ?auto_739317 ) ( ON ?auto_739319 ?auto_739318 ) ( ON ?auto_739320 ?auto_739319 ) ( not ( = ?auto_739317 ?auto_739318 ) ) ( not ( = ?auto_739317 ?auto_739319 ) ) ( not ( = ?auto_739317 ?auto_739320 ) ) ( not ( = ?auto_739317 ?auto_739321 ) ) ( not ( = ?auto_739317 ?auto_739322 ) ) ( not ( = ?auto_739317 ?auto_739323 ) ) ( not ( = ?auto_739317 ?auto_739324 ) ) ( not ( = ?auto_739317 ?auto_739325 ) ) ( not ( = ?auto_739317 ?auto_739326 ) ) ( not ( = ?auto_739317 ?auto_739327 ) ) ( not ( = ?auto_739317 ?auto_739328 ) ) ( not ( = ?auto_739317 ?auto_739329 ) ) ( not ( = ?auto_739317 ?auto_739330 ) ) ( not ( = ?auto_739317 ?auto_739331 ) ) ( not ( = ?auto_739317 ?auto_739332 ) ) ( not ( = ?auto_739317 ?auto_739333 ) ) ( not ( = ?auto_739317 ?auto_739334 ) ) ( not ( = ?auto_739318 ?auto_739319 ) ) ( not ( = ?auto_739318 ?auto_739320 ) ) ( not ( = ?auto_739318 ?auto_739321 ) ) ( not ( = ?auto_739318 ?auto_739322 ) ) ( not ( = ?auto_739318 ?auto_739323 ) ) ( not ( = ?auto_739318 ?auto_739324 ) ) ( not ( = ?auto_739318 ?auto_739325 ) ) ( not ( = ?auto_739318 ?auto_739326 ) ) ( not ( = ?auto_739318 ?auto_739327 ) ) ( not ( = ?auto_739318 ?auto_739328 ) ) ( not ( = ?auto_739318 ?auto_739329 ) ) ( not ( = ?auto_739318 ?auto_739330 ) ) ( not ( = ?auto_739318 ?auto_739331 ) ) ( not ( = ?auto_739318 ?auto_739332 ) ) ( not ( = ?auto_739318 ?auto_739333 ) ) ( not ( = ?auto_739318 ?auto_739334 ) ) ( not ( = ?auto_739319 ?auto_739320 ) ) ( not ( = ?auto_739319 ?auto_739321 ) ) ( not ( = ?auto_739319 ?auto_739322 ) ) ( not ( = ?auto_739319 ?auto_739323 ) ) ( not ( = ?auto_739319 ?auto_739324 ) ) ( not ( = ?auto_739319 ?auto_739325 ) ) ( not ( = ?auto_739319 ?auto_739326 ) ) ( not ( = ?auto_739319 ?auto_739327 ) ) ( not ( = ?auto_739319 ?auto_739328 ) ) ( not ( = ?auto_739319 ?auto_739329 ) ) ( not ( = ?auto_739319 ?auto_739330 ) ) ( not ( = ?auto_739319 ?auto_739331 ) ) ( not ( = ?auto_739319 ?auto_739332 ) ) ( not ( = ?auto_739319 ?auto_739333 ) ) ( not ( = ?auto_739319 ?auto_739334 ) ) ( not ( = ?auto_739320 ?auto_739321 ) ) ( not ( = ?auto_739320 ?auto_739322 ) ) ( not ( = ?auto_739320 ?auto_739323 ) ) ( not ( = ?auto_739320 ?auto_739324 ) ) ( not ( = ?auto_739320 ?auto_739325 ) ) ( not ( = ?auto_739320 ?auto_739326 ) ) ( not ( = ?auto_739320 ?auto_739327 ) ) ( not ( = ?auto_739320 ?auto_739328 ) ) ( not ( = ?auto_739320 ?auto_739329 ) ) ( not ( = ?auto_739320 ?auto_739330 ) ) ( not ( = ?auto_739320 ?auto_739331 ) ) ( not ( = ?auto_739320 ?auto_739332 ) ) ( not ( = ?auto_739320 ?auto_739333 ) ) ( not ( = ?auto_739320 ?auto_739334 ) ) ( not ( = ?auto_739321 ?auto_739322 ) ) ( not ( = ?auto_739321 ?auto_739323 ) ) ( not ( = ?auto_739321 ?auto_739324 ) ) ( not ( = ?auto_739321 ?auto_739325 ) ) ( not ( = ?auto_739321 ?auto_739326 ) ) ( not ( = ?auto_739321 ?auto_739327 ) ) ( not ( = ?auto_739321 ?auto_739328 ) ) ( not ( = ?auto_739321 ?auto_739329 ) ) ( not ( = ?auto_739321 ?auto_739330 ) ) ( not ( = ?auto_739321 ?auto_739331 ) ) ( not ( = ?auto_739321 ?auto_739332 ) ) ( not ( = ?auto_739321 ?auto_739333 ) ) ( not ( = ?auto_739321 ?auto_739334 ) ) ( not ( = ?auto_739322 ?auto_739323 ) ) ( not ( = ?auto_739322 ?auto_739324 ) ) ( not ( = ?auto_739322 ?auto_739325 ) ) ( not ( = ?auto_739322 ?auto_739326 ) ) ( not ( = ?auto_739322 ?auto_739327 ) ) ( not ( = ?auto_739322 ?auto_739328 ) ) ( not ( = ?auto_739322 ?auto_739329 ) ) ( not ( = ?auto_739322 ?auto_739330 ) ) ( not ( = ?auto_739322 ?auto_739331 ) ) ( not ( = ?auto_739322 ?auto_739332 ) ) ( not ( = ?auto_739322 ?auto_739333 ) ) ( not ( = ?auto_739322 ?auto_739334 ) ) ( not ( = ?auto_739323 ?auto_739324 ) ) ( not ( = ?auto_739323 ?auto_739325 ) ) ( not ( = ?auto_739323 ?auto_739326 ) ) ( not ( = ?auto_739323 ?auto_739327 ) ) ( not ( = ?auto_739323 ?auto_739328 ) ) ( not ( = ?auto_739323 ?auto_739329 ) ) ( not ( = ?auto_739323 ?auto_739330 ) ) ( not ( = ?auto_739323 ?auto_739331 ) ) ( not ( = ?auto_739323 ?auto_739332 ) ) ( not ( = ?auto_739323 ?auto_739333 ) ) ( not ( = ?auto_739323 ?auto_739334 ) ) ( not ( = ?auto_739324 ?auto_739325 ) ) ( not ( = ?auto_739324 ?auto_739326 ) ) ( not ( = ?auto_739324 ?auto_739327 ) ) ( not ( = ?auto_739324 ?auto_739328 ) ) ( not ( = ?auto_739324 ?auto_739329 ) ) ( not ( = ?auto_739324 ?auto_739330 ) ) ( not ( = ?auto_739324 ?auto_739331 ) ) ( not ( = ?auto_739324 ?auto_739332 ) ) ( not ( = ?auto_739324 ?auto_739333 ) ) ( not ( = ?auto_739324 ?auto_739334 ) ) ( not ( = ?auto_739325 ?auto_739326 ) ) ( not ( = ?auto_739325 ?auto_739327 ) ) ( not ( = ?auto_739325 ?auto_739328 ) ) ( not ( = ?auto_739325 ?auto_739329 ) ) ( not ( = ?auto_739325 ?auto_739330 ) ) ( not ( = ?auto_739325 ?auto_739331 ) ) ( not ( = ?auto_739325 ?auto_739332 ) ) ( not ( = ?auto_739325 ?auto_739333 ) ) ( not ( = ?auto_739325 ?auto_739334 ) ) ( not ( = ?auto_739326 ?auto_739327 ) ) ( not ( = ?auto_739326 ?auto_739328 ) ) ( not ( = ?auto_739326 ?auto_739329 ) ) ( not ( = ?auto_739326 ?auto_739330 ) ) ( not ( = ?auto_739326 ?auto_739331 ) ) ( not ( = ?auto_739326 ?auto_739332 ) ) ( not ( = ?auto_739326 ?auto_739333 ) ) ( not ( = ?auto_739326 ?auto_739334 ) ) ( not ( = ?auto_739327 ?auto_739328 ) ) ( not ( = ?auto_739327 ?auto_739329 ) ) ( not ( = ?auto_739327 ?auto_739330 ) ) ( not ( = ?auto_739327 ?auto_739331 ) ) ( not ( = ?auto_739327 ?auto_739332 ) ) ( not ( = ?auto_739327 ?auto_739333 ) ) ( not ( = ?auto_739327 ?auto_739334 ) ) ( not ( = ?auto_739328 ?auto_739329 ) ) ( not ( = ?auto_739328 ?auto_739330 ) ) ( not ( = ?auto_739328 ?auto_739331 ) ) ( not ( = ?auto_739328 ?auto_739332 ) ) ( not ( = ?auto_739328 ?auto_739333 ) ) ( not ( = ?auto_739328 ?auto_739334 ) ) ( not ( = ?auto_739329 ?auto_739330 ) ) ( not ( = ?auto_739329 ?auto_739331 ) ) ( not ( = ?auto_739329 ?auto_739332 ) ) ( not ( = ?auto_739329 ?auto_739333 ) ) ( not ( = ?auto_739329 ?auto_739334 ) ) ( not ( = ?auto_739330 ?auto_739331 ) ) ( not ( = ?auto_739330 ?auto_739332 ) ) ( not ( = ?auto_739330 ?auto_739333 ) ) ( not ( = ?auto_739330 ?auto_739334 ) ) ( not ( = ?auto_739331 ?auto_739332 ) ) ( not ( = ?auto_739331 ?auto_739333 ) ) ( not ( = ?auto_739331 ?auto_739334 ) ) ( not ( = ?auto_739332 ?auto_739333 ) ) ( not ( = ?auto_739332 ?auto_739334 ) ) ( not ( = ?auto_739333 ?auto_739334 ) ) ( ON ?auto_739332 ?auto_739333 ) ( ON ?auto_739331 ?auto_739332 ) ( ON ?auto_739330 ?auto_739331 ) ( ON ?auto_739329 ?auto_739330 ) ( ON ?auto_739328 ?auto_739329 ) ( ON ?auto_739327 ?auto_739328 ) ( ON ?auto_739326 ?auto_739327 ) ( ON ?auto_739325 ?auto_739326 ) ( ON ?auto_739324 ?auto_739325 ) ( ON ?auto_739323 ?auto_739324 ) ( ON ?auto_739322 ?auto_739323 ) ( CLEAR ?auto_739320 ) ( ON ?auto_739321 ?auto_739322 ) ( CLEAR ?auto_739321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_739317 ?auto_739318 ?auto_739319 ?auto_739320 ?auto_739321 )
      ( MAKE-17PILE ?auto_739317 ?auto_739318 ?auto_739319 ?auto_739320 ?auto_739321 ?auto_739322 ?auto_739323 ?auto_739324 ?auto_739325 ?auto_739326 ?auto_739327 ?auto_739328 ?auto_739329 ?auto_739330 ?auto_739331 ?auto_739332 ?auto_739333 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739352 - BLOCK
      ?auto_739353 - BLOCK
      ?auto_739354 - BLOCK
      ?auto_739355 - BLOCK
      ?auto_739356 - BLOCK
      ?auto_739357 - BLOCK
      ?auto_739358 - BLOCK
      ?auto_739359 - BLOCK
      ?auto_739360 - BLOCK
      ?auto_739361 - BLOCK
      ?auto_739362 - BLOCK
      ?auto_739363 - BLOCK
      ?auto_739364 - BLOCK
      ?auto_739365 - BLOCK
      ?auto_739366 - BLOCK
      ?auto_739367 - BLOCK
      ?auto_739368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739368 ) ( ON-TABLE ?auto_739352 ) ( ON ?auto_739353 ?auto_739352 ) ( ON ?auto_739354 ?auto_739353 ) ( ON ?auto_739355 ?auto_739354 ) ( not ( = ?auto_739352 ?auto_739353 ) ) ( not ( = ?auto_739352 ?auto_739354 ) ) ( not ( = ?auto_739352 ?auto_739355 ) ) ( not ( = ?auto_739352 ?auto_739356 ) ) ( not ( = ?auto_739352 ?auto_739357 ) ) ( not ( = ?auto_739352 ?auto_739358 ) ) ( not ( = ?auto_739352 ?auto_739359 ) ) ( not ( = ?auto_739352 ?auto_739360 ) ) ( not ( = ?auto_739352 ?auto_739361 ) ) ( not ( = ?auto_739352 ?auto_739362 ) ) ( not ( = ?auto_739352 ?auto_739363 ) ) ( not ( = ?auto_739352 ?auto_739364 ) ) ( not ( = ?auto_739352 ?auto_739365 ) ) ( not ( = ?auto_739352 ?auto_739366 ) ) ( not ( = ?auto_739352 ?auto_739367 ) ) ( not ( = ?auto_739352 ?auto_739368 ) ) ( not ( = ?auto_739353 ?auto_739354 ) ) ( not ( = ?auto_739353 ?auto_739355 ) ) ( not ( = ?auto_739353 ?auto_739356 ) ) ( not ( = ?auto_739353 ?auto_739357 ) ) ( not ( = ?auto_739353 ?auto_739358 ) ) ( not ( = ?auto_739353 ?auto_739359 ) ) ( not ( = ?auto_739353 ?auto_739360 ) ) ( not ( = ?auto_739353 ?auto_739361 ) ) ( not ( = ?auto_739353 ?auto_739362 ) ) ( not ( = ?auto_739353 ?auto_739363 ) ) ( not ( = ?auto_739353 ?auto_739364 ) ) ( not ( = ?auto_739353 ?auto_739365 ) ) ( not ( = ?auto_739353 ?auto_739366 ) ) ( not ( = ?auto_739353 ?auto_739367 ) ) ( not ( = ?auto_739353 ?auto_739368 ) ) ( not ( = ?auto_739354 ?auto_739355 ) ) ( not ( = ?auto_739354 ?auto_739356 ) ) ( not ( = ?auto_739354 ?auto_739357 ) ) ( not ( = ?auto_739354 ?auto_739358 ) ) ( not ( = ?auto_739354 ?auto_739359 ) ) ( not ( = ?auto_739354 ?auto_739360 ) ) ( not ( = ?auto_739354 ?auto_739361 ) ) ( not ( = ?auto_739354 ?auto_739362 ) ) ( not ( = ?auto_739354 ?auto_739363 ) ) ( not ( = ?auto_739354 ?auto_739364 ) ) ( not ( = ?auto_739354 ?auto_739365 ) ) ( not ( = ?auto_739354 ?auto_739366 ) ) ( not ( = ?auto_739354 ?auto_739367 ) ) ( not ( = ?auto_739354 ?auto_739368 ) ) ( not ( = ?auto_739355 ?auto_739356 ) ) ( not ( = ?auto_739355 ?auto_739357 ) ) ( not ( = ?auto_739355 ?auto_739358 ) ) ( not ( = ?auto_739355 ?auto_739359 ) ) ( not ( = ?auto_739355 ?auto_739360 ) ) ( not ( = ?auto_739355 ?auto_739361 ) ) ( not ( = ?auto_739355 ?auto_739362 ) ) ( not ( = ?auto_739355 ?auto_739363 ) ) ( not ( = ?auto_739355 ?auto_739364 ) ) ( not ( = ?auto_739355 ?auto_739365 ) ) ( not ( = ?auto_739355 ?auto_739366 ) ) ( not ( = ?auto_739355 ?auto_739367 ) ) ( not ( = ?auto_739355 ?auto_739368 ) ) ( not ( = ?auto_739356 ?auto_739357 ) ) ( not ( = ?auto_739356 ?auto_739358 ) ) ( not ( = ?auto_739356 ?auto_739359 ) ) ( not ( = ?auto_739356 ?auto_739360 ) ) ( not ( = ?auto_739356 ?auto_739361 ) ) ( not ( = ?auto_739356 ?auto_739362 ) ) ( not ( = ?auto_739356 ?auto_739363 ) ) ( not ( = ?auto_739356 ?auto_739364 ) ) ( not ( = ?auto_739356 ?auto_739365 ) ) ( not ( = ?auto_739356 ?auto_739366 ) ) ( not ( = ?auto_739356 ?auto_739367 ) ) ( not ( = ?auto_739356 ?auto_739368 ) ) ( not ( = ?auto_739357 ?auto_739358 ) ) ( not ( = ?auto_739357 ?auto_739359 ) ) ( not ( = ?auto_739357 ?auto_739360 ) ) ( not ( = ?auto_739357 ?auto_739361 ) ) ( not ( = ?auto_739357 ?auto_739362 ) ) ( not ( = ?auto_739357 ?auto_739363 ) ) ( not ( = ?auto_739357 ?auto_739364 ) ) ( not ( = ?auto_739357 ?auto_739365 ) ) ( not ( = ?auto_739357 ?auto_739366 ) ) ( not ( = ?auto_739357 ?auto_739367 ) ) ( not ( = ?auto_739357 ?auto_739368 ) ) ( not ( = ?auto_739358 ?auto_739359 ) ) ( not ( = ?auto_739358 ?auto_739360 ) ) ( not ( = ?auto_739358 ?auto_739361 ) ) ( not ( = ?auto_739358 ?auto_739362 ) ) ( not ( = ?auto_739358 ?auto_739363 ) ) ( not ( = ?auto_739358 ?auto_739364 ) ) ( not ( = ?auto_739358 ?auto_739365 ) ) ( not ( = ?auto_739358 ?auto_739366 ) ) ( not ( = ?auto_739358 ?auto_739367 ) ) ( not ( = ?auto_739358 ?auto_739368 ) ) ( not ( = ?auto_739359 ?auto_739360 ) ) ( not ( = ?auto_739359 ?auto_739361 ) ) ( not ( = ?auto_739359 ?auto_739362 ) ) ( not ( = ?auto_739359 ?auto_739363 ) ) ( not ( = ?auto_739359 ?auto_739364 ) ) ( not ( = ?auto_739359 ?auto_739365 ) ) ( not ( = ?auto_739359 ?auto_739366 ) ) ( not ( = ?auto_739359 ?auto_739367 ) ) ( not ( = ?auto_739359 ?auto_739368 ) ) ( not ( = ?auto_739360 ?auto_739361 ) ) ( not ( = ?auto_739360 ?auto_739362 ) ) ( not ( = ?auto_739360 ?auto_739363 ) ) ( not ( = ?auto_739360 ?auto_739364 ) ) ( not ( = ?auto_739360 ?auto_739365 ) ) ( not ( = ?auto_739360 ?auto_739366 ) ) ( not ( = ?auto_739360 ?auto_739367 ) ) ( not ( = ?auto_739360 ?auto_739368 ) ) ( not ( = ?auto_739361 ?auto_739362 ) ) ( not ( = ?auto_739361 ?auto_739363 ) ) ( not ( = ?auto_739361 ?auto_739364 ) ) ( not ( = ?auto_739361 ?auto_739365 ) ) ( not ( = ?auto_739361 ?auto_739366 ) ) ( not ( = ?auto_739361 ?auto_739367 ) ) ( not ( = ?auto_739361 ?auto_739368 ) ) ( not ( = ?auto_739362 ?auto_739363 ) ) ( not ( = ?auto_739362 ?auto_739364 ) ) ( not ( = ?auto_739362 ?auto_739365 ) ) ( not ( = ?auto_739362 ?auto_739366 ) ) ( not ( = ?auto_739362 ?auto_739367 ) ) ( not ( = ?auto_739362 ?auto_739368 ) ) ( not ( = ?auto_739363 ?auto_739364 ) ) ( not ( = ?auto_739363 ?auto_739365 ) ) ( not ( = ?auto_739363 ?auto_739366 ) ) ( not ( = ?auto_739363 ?auto_739367 ) ) ( not ( = ?auto_739363 ?auto_739368 ) ) ( not ( = ?auto_739364 ?auto_739365 ) ) ( not ( = ?auto_739364 ?auto_739366 ) ) ( not ( = ?auto_739364 ?auto_739367 ) ) ( not ( = ?auto_739364 ?auto_739368 ) ) ( not ( = ?auto_739365 ?auto_739366 ) ) ( not ( = ?auto_739365 ?auto_739367 ) ) ( not ( = ?auto_739365 ?auto_739368 ) ) ( not ( = ?auto_739366 ?auto_739367 ) ) ( not ( = ?auto_739366 ?auto_739368 ) ) ( not ( = ?auto_739367 ?auto_739368 ) ) ( ON ?auto_739367 ?auto_739368 ) ( ON ?auto_739366 ?auto_739367 ) ( ON ?auto_739365 ?auto_739366 ) ( ON ?auto_739364 ?auto_739365 ) ( ON ?auto_739363 ?auto_739364 ) ( ON ?auto_739362 ?auto_739363 ) ( ON ?auto_739361 ?auto_739362 ) ( ON ?auto_739360 ?auto_739361 ) ( ON ?auto_739359 ?auto_739360 ) ( ON ?auto_739358 ?auto_739359 ) ( ON ?auto_739357 ?auto_739358 ) ( CLEAR ?auto_739355 ) ( ON ?auto_739356 ?auto_739357 ) ( CLEAR ?auto_739356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_739352 ?auto_739353 ?auto_739354 ?auto_739355 ?auto_739356 )
      ( MAKE-17PILE ?auto_739352 ?auto_739353 ?auto_739354 ?auto_739355 ?auto_739356 ?auto_739357 ?auto_739358 ?auto_739359 ?auto_739360 ?auto_739361 ?auto_739362 ?auto_739363 ?auto_739364 ?auto_739365 ?auto_739366 ?auto_739367 ?auto_739368 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739386 - BLOCK
      ?auto_739387 - BLOCK
      ?auto_739388 - BLOCK
      ?auto_739389 - BLOCK
      ?auto_739390 - BLOCK
      ?auto_739391 - BLOCK
      ?auto_739392 - BLOCK
      ?auto_739393 - BLOCK
      ?auto_739394 - BLOCK
      ?auto_739395 - BLOCK
      ?auto_739396 - BLOCK
      ?auto_739397 - BLOCK
      ?auto_739398 - BLOCK
      ?auto_739399 - BLOCK
      ?auto_739400 - BLOCK
      ?auto_739401 - BLOCK
      ?auto_739402 - BLOCK
    )
    :vars
    (
      ?auto_739403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739402 ?auto_739403 ) ( ON-TABLE ?auto_739386 ) ( ON ?auto_739387 ?auto_739386 ) ( ON ?auto_739388 ?auto_739387 ) ( not ( = ?auto_739386 ?auto_739387 ) ) ( not ( = ?auto_739386 ?auto_739388 ) ) ( not ( = ?auto_739386 ?auto_739389 ) ) ( not ( = ?auto_739386 ?auto_739390 ) ) ( not ( = ?auto_739386 ?auto_739391 ) ) ( not ( = ?auto_739386 ?auto_739392 ) ) ( not ( = ?auto_739386 ?auto_739393 ) ) ( not ( = ?auto_739386 ?auto_739394 ) ) ( not ( = ?auto_739386 ?auto_739395 ) ) ( not ( = ?auto_739386 ?auto_739396 ) ) ( not ( = ?auto_739386 ?auto_739397 ) ) ( not ( = ?auto_739386 ?auto_739398 ) ) ( not ( = ?auto_739386 ?auto_739399 ) ) ( not ( = ?auto_739386 ?auto_739400 ) ) ( not ( = ?auto_739386 ?auto_739401 ) ) ( not ( = ?auto_739386 ?auto_739402 ) ) ( not ( = ?auto_739386 ?auto_739403 ) ) ( not ( = ?auto_739387 ?auto_739388 ) ) ( not ( = ?auto_739387 ?auto_739389 ) ) ( not ( = ?auto_739387 ?auto_739390 ) ) ( not ( = ?auto_739387 ?auto_739391 ) ) ( not ( = ?auto_739387 ?auto_739392 ) ) ( not ( = ?auto_739387 ?auto_739393 ) ) ( not ( = ?auto_739387 ?auto_739394 ) ) ( not ( = ?auto_739387 ?auto_739395 ) ) ( not ( = ?auto_739387 ?auto_739396 ) ) ( not ( = ?auto_739387 ?auto_739397 ) ) ( not ( = ?auto_739387 ?auto_739398 ) ) ( not ( = ?auto_739387 ?auto_739399 ) ) ( not ( = ?auto_739387 ?auto_739400 ) ) ( not ( = ?auto_739387 ?auto_739401 ) ) ( not ( = ?auto_739387 ?auto_739402 ) ) ( not ( = ?auto_739387 ?auto_739403 ) ) ( not ( = ?auto_739388 ?auto_739389 ) ) ( not ( = ?auto_739388 ?auto_739390 ) ) ( not ( = ?auto_739388 ?auto_739391 ) ) ( not ( = ?auto_739388 ?auto_739392 ) ) ( not ( = ?auto_739388 ?auto_739393 ) ) ( not ( = ?auto_739388 ?auto_739394 ) ) ( not ( = ?auto_739388 ?auto_739395 ) ) ( not ( = ?auto_739388 ?auto_739396 ) ) ( not ( = ?auto_739388 ?auto_739397 ) ) ( not ( = ?auto_739388 ?auto_739398 ) ) ( not ( = ?auto_739388 ?auto_739399 ) ) ( not ( = ?auto_739388 ?auto_739400 ) ) ( not ( = ?auto_739388 ?auto_739401 ) ) ( not ( = ?auto_739388 ?auto_739402 ) ) ( not ( = ?auto_739388 ?auto_739403 ) ) ( not ( = ?auto_739389 ?auto_739390 ) ) ( not ( = ?auto_739389 ?auto_739391 ) ) ( not ( = ?auto_739389 ?auto_739392 ) ) ( not ( = ?auto_739389 ?auto_739393 ) ) ( not ( = ?auto_739389 ?auto_739394 ) ) ( not ( = ?auto_739389 ?auto_739395 ) ) ( not ( = ?auto_739389 ?auto_739396 ) ) ( not ( = ?auto_739389 ?auto_739397 ) ) ( not ( = ?auto_739389 ?auto_739398 ) ) ( not ( = ?auto_739389 ?auto_739399 ) ) ( not ( = ?auto_739389 ?auto_739400 ) ) ( not ( = ?auto_739389 ?auto_739401 ) ) ( not ( = ?auto_739389 ?auto_739402 ) ) ( not ( = ?auto_739389 ?auto_739403 ) ) ( not ( = ?auto_739390 ?auto_739391 ) ) ( not ( = ?auto_739390 ?auto_739392 ) ) ( not ( = ?auto_739390 ?auto_739393 ) ) ( not ( = ?auto_739390 ?auto_739394 ) ) ( not ( = ?auto_739390 ?auto_739395 ) ) ( not ( = ?auto_739390 ?auto_739396 ) ) ( not ( = ?auto_739390 ?auto_739397 ) ) ( not ( = ?auto_739390 ?auto_739398 ) ) ( not ( = ?auto_739390 ?auto_739399 ) ) ( not ( = ?auto_739390 ?auto_739400 ) ) ( not ( = ?auto_739390 ?auto_739401 ) ) ( not ( = ?auto_739390 ?auto_739402 ) ) ( not ( = ?auto_739390 ?auto_739403 ) ) ( not ( = ?auto_739391 ?auto_739392 ) ) ( not ( = ?auto_739391 ?auto_739393 ) ) ( not ( = ?auto_739391 ?auto_739394 ) ) ( not ( = ?auto_739391 ?auto_739395 ) ) ( not ( = ?auto_739391 ?auto_739396 ) ) ( not ( = ?auto_739391 ?auto_739397 ) ) ( not ( = ?auto_739391 ?auto_739398 ) ) ( not ( = ?auto_739391 ?auto_739399 ) ) ( not ( = ?auto_739391 ?auto_739400 ) ) ( not ( = ?auto_739391 ?auto_739401 ) ) ( not ( = ?auto_739391 ?auto_739402 ) ) ( not ( = ?auto_739391 ?auto_739403 ) ) ( not ( = ?auto_739392 ?auto_739393 ) ) ( not ( = ?auto_739392 ?auto_739394 ) ) ( not ( = ?auto_739392 ?auto_739395 ) ) ( not ( = ?auto_739392 ?auto_739396 ) ) ( not ( = ?auto_739392 ?auto_739397 ) ) ( not ( = ?auto_739392 ?auto_739398 ) ) ( not ( = ?auto_739392 ?auto_739399 ) ) ( not ( = ?auto_739392 ?auto_739400 ) ) ( not ( = ?auto_739392 ?auto_739401 ) ) ( not ( = ?auto_739392 ?auto_739402 ) ) ( not ( = ?auto_739392 ?auto_739403 ) ) ( not ( = ?auto_739393 ?auto_739394 ) ) ( not ( = ?auto_739393 ?auto_739395 ) ) ( not ( = ?auto_739393 ?auto_739396 ) ) ( not ( = ?auto_739393 ?auto_739397 ) ) ( not ( = ?auto_739393 ?auto_739398 ) ) ( not ( = ?auto_739393 ?auto_739399 ) ) ( not ( = ?auto_739393 ?auto_739400 ) ) ( not ( = ?auto_739393 ?auto_739401 ) ) ( not ( = ?auto_739393 ?auto_739402 ) ) ( not ( = ?auto_739393 ?auto_739403 ) ) ( not ( = ?auto_739394 ?auto_739395 ) ) ( not ( = ?auto_739394 ?auto_739396 ) ) ( not ( = ?auto_739394 ?auto_739397 ) ) ( not ( = ?auto_739394 ?auto_739398 ) ) ( not ( = ?auto_739394 ?auto_739399 ) ) ( not ( = ?auto_739394 ?auto_739400 ) ) ( not ( = ?auto_739394 ?auto_739401 ) ) ( not ( = ?auto_739394 ?auto_739402 ) ) ( not ( = ?auto_739394 ?auto_739403 ) ) ( not ( = ?auto_739395 ?auto_739396 ) ) ( not ( = ?auto_739395 ?auto_739397 ) ) ( not ( = ?auto_739395 ?auto_739398 ) ) ( not ( = ?auto_739395 ?auto_739399 ) ) ( not ( = ?auto_739395 ?auto_739400 ) ) ( not ( = ?auto_739395 ?auto_739401 ) ) ( not ( = ?auto_739395 ?auto_739402 ) ) ( not ( = ?auto_739395 ?auto_739403 ) ) ( not ( = ?auto_739396 ?auto_739397 ) ) ( not ( = ?auto_739396 ?auto_739398 ) ) ( not ( = ?auto_739396 ?auto_739399 ) ) ( not ( = ?auto_739396 ?auto_739400 ) ) ( not ( = ?auto_739396 ?auto_739401 ) ) ( not ( = ?auto_739396 ?auto_739402 ) ) ( not ( = ?auto_739396 ?auto_739403 ) ) ( not ( = ?auto_739397 ?auto_739398 ) ) ( not ( = ?auto_739397 ?auto_739399 ) ) ( not ( = ?auto_739397 ?auto_739400 ) ) ( not ( = ?auto_739397 ?auto_739401 ) ) ( not ( = ?auto_739397 ?auto_739402 ) ) ( not ( = ?auto_739397 ?auto_739403 ) ) ( not ( = ?auto_739398 ?auto_739399 ) ) ( not ( = ?auto_739398 ?auto_739400 ) ) ( not ( = ?auto_739398 ?auto_739401 ) ) ( not ( = ?auto_739398 ?auto_739402 ) ) ( not ( = ?auto_739398 ?auto_739403 ) ) ( not ( = ?auto_739399 ?auto_739400 ) ) ( not ( = ?auto_739399 ?auto_739401 ) ) ( not ( = ?auto_739399 ?auto_739402 ) ) ( not ( = ?auto_739399 ?auto_739403 ) ) ( not ( = ?auto_739400 ?auto_739401 ) ) ( not ( = ?auto_739400 ?auto_739402 ) ) ( not ( = ?auto_739400 ?auto_739403 ) ) ( not ( = ?auto_739401 ?auto_739402 ) ) ( not ( = ?auto_739401 ?auto_739403 ) ) ( not ( = ?auto_739402 ?auto_739403 ) ) ( ON ?auto_739401 ?auto_739402 ) ( ON ?auto_739400 ?auto_739401 ) ( ON ?auto_739399 ?auto_739400 ) ( ON ?auto_739398 ?auto_739399 ) ( ON ?auto_739397 ?auto_739398 ) ( ON ?auto_739396 ?auto_739397 ) ( ON ?auto_739395 ?auto_739396 ) ( ON ?auto_739394 ?auto_739395 ) ( ON ?auto_739393 ?auto_739394 ) ( ON ?auto_739392 ?auto_739393 ) ( ON ?auto_739391 ?auto_739392 ) ( ON ?auto_739390 ?auto_739391 ) ( CLEAR ?auto_739388 ) ( ON ?auto_739389 ?auto_739390 ) ( CLEAR ?auto_739389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_739386 ?auto_739387 ?auto_739388 ?auto_739389 )
      ( MAKE-17PILE ?auto_739386 ?auto_739387 ?auto_739388 ?auto_739389 ?auto_739390 ?auto_739391 ?auto_739392 ?auto_739393 ?auto_739394 ?auto_739395 ?auto_739396 ?auto_739397 ?auto_739398 ?auto_739399 ?auto_739400 ?auto_739401 ?auto_739402 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739421 - BLOCK
      ?auto_739422 - BLOCK
      ?auto_739423 - BLOCK
      ?auto_739424 - BLOCK
      ?auto_739425 - BLOCK
      ?auto_739426 - BLOCK
      ?auto_739427 - BLOCK
      ?auto_739428 - BLOCK
      ?auto_739429 - BLOCK
      ?auto_739430 - BLOCK
      ?auto_739431 - BLOCK
      ?auto_739432 - BLOCK
      ?auto_739433 - BLOCK
      ?auto_739434 - BLOCK
      ?auto_739435 - BLOCK
      ?auto_739436 - BLOCK
      ?auto_739437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739437 ) ( ON-TABLE ?auto_739421 ) ( ON ?auto_739422 ?auto_739421 ) ( ON ?auto_739423 ?auto_739422 ) ( not ( = ?auto_739421 ?auto_739422 ) ) ( not ( = ?auto_739421 ?auto_739423 ) ) ( not ( = ?auto_739421 ?auto_739424 ) ) ( not ( = ?auto_739421 ?auto_739425 ) ) ( not ( = ?auto_739421 ?auto_739426 ) ) ( not ( = ?auto_739421 ?auto_739427 ) ) ( not ( = ?auto_739421 ?auto_739428 ) ) ( not ( = ?auto_739421 ?auto_739429 ) ) ( not ( = ?auto_739421 ?auto_739430 ) ) ( not ( = ?auto_739421 ?auto_739431 ) ) ( not ( = ?auto_739421 ?auto_739432 ) ) ( not ( = ?auto_739421 ?auto_739433 ) ) ( not ( = ?auto_739421 ?auto_739434 ) ) ( not ( = ?auto_739421 ?auto_739435 ) ) ( not ( = ?auto_739421 ?auto_739436 ) ) ( not ( = ?auto_739421 ?auto_739437 ) ) ( not ( = ?auto_739422 ?auto_739423 ) ) ( not ( = ?auto_739422 ?auto_739424 ) ) ( not ( = ?auto_739422 ?auto_739425 ) ) ( not ( = ?auto_739422 ?auto_739426 ) ) ( not ( = ?auto_739422 ?auto_739427 ) ) ( not ( = ?auto_739422 ?auto_739428 ) ) ( not ( = ?auto_739422 ?auto_739429 ) ) ( not ( = ?auto_739422 ?auto_739430 ) ) ( not ( = ?auto_739422 ?auto_739431 ) ) ( not ( = ?auto_739422 ?auto_739432 ) ) ( not ( = ?auto_739422 ?auto_739433 ) ) ( not ( = ?auto_739422 ?auto_739434 ) ) ( not ( = ?auto_739422 ?auto_739435 ) ) ( not ( = ?auto_739422 ?auto_739436 ) ) ( not ( = ?auto_739422 ?auto_739437 ) ) ( not ( = ?auto_739423 ?auto_739424 ) ) ( not ( = ?auto_739423 ?auto_739425 ) ) ( not ( = ?auto_739423 ?auto_739426 ) ) ( not ( = ?auto_739423 ?auto_739427 ) ) ( not ( = ?auto_739423 ?auto_739428 ) ) ( not ( = ?auto_739423 ?auto_739429 ) ) ( not ( = ?auto_739423 ?auto_739430 ) ) ( not ( = ?auto_739423 ?auto_739431 ) ) ( not ( = ?auto_739423 ?auto_739432 ) ) ( not ( = ?auto_739423 ?auto_739433 ) ) ( not ( = ?auto_739423 ?auto_739434 ) ) ( not ( = ?auto_739423 ?auto_739435 ) ) ( not ( = ?auto_739423 ?auto_739436 ) ) ( not ( = ?auto_739423 ?auto_739437 ) ) ( not ( = ?auto_739424 ?auto_739425 ) ) ( not ( = ?auto_739424 ?auto_739426 ) ) ( not ( = ?auto_739424 ?auto_739427 ) ) ( not ( = ?auto_739424 ?auto_739428 ) ) ( not ( = ?auto_739424 ?auto_739429 ) ) ( not ( = ?auto_739424 ?auto_739430 ) ) ( not ( = ?auto_739424 ?auto_739431 ) ) ( not ( = ?auto_739424 ?auto_739432 ) ) ( not ( = ?auto_739424 ?auto_739433 ) ) ( not ( = ?auto_739424 ?auto_739434 ) ) ( not ( = ?auto_739424 ?auto_739435 ) ) ( not ( = ?auto_739424 ?auto_739436 ) ) ( not ( = ?auto_739424 ?auto_739437 ) ) ( not ( = ?auto_739425 ?auto_739426 ) ) ( not ( = ?auto_739425 ?auto_739427 ) ) ( not ( = ?auto_739425 ?auto_739428 ) ) ( not ( = ?auto_739425 ?auto_739429 ) ) ( not ( = ?auto_739425 ?auto_739430 ) ) ( not ( = ?auto_739425 ?auto_739431 ) ) ( not ( = ?auto_739425 ?auto_739432 ) ) ( not ( = ?auto_739425 ?auto_739433 ) ) ( not ( = ?auto_739425 ?auto_739434 ) ) ( not ( = ?auto_739425 ?auto_739435 ) ) ( not ( = ?auto_739425 ?auto_739436 ) ) ( not ( = ?auto_739425 ?auto_739437 ) ) ( not ( = ?auto_739426 ?auto_739427 ) ) ( not ( = ?auto_739426 ?auto_739428 ) ) ( not ( = ?auto_739426 ?auto_739429 ) ) ( not ( = ?auto_739426 ?auto_739430 ) ) ( not ( = ?auto_739426 ?auto_739431 ) ) ( not ( = ?auto_739426 ?auto_739432 ) ) ( not ( = ?auto_739426 ?auto_739433 ) ) ( not ( = ?auto_739426 ?auto_739434 ) ) ( not ( = ?auto_739426 ?auto_739435 ) ) ( not ( = ?auto_739426 ?auto_739436 ) ) ( not ( = ?auto_739426 ?auto_739437 ) ) ( not ( = ?auto_739427 ?auto_739428 ) ) ( not ( = ?auto_739427 ?auto_739429 ) ) ( not ( = ?auto_739427 ?auto_739430 ) ) ( not ( = ?auto_739427 ?auto_739431 ) ) ( not ( = ?auto_739427 ?auto_739432 ) ) ( not ( = ?auto_739427 ?auto_739433 ) ) ( not ( = ?auto_739427 ?auto_739434 ) ) ( not ( = ?auto_739427 ?auto_739435 ) ) ( not ( = ?auto_739427 ?auto_739436 ) ) ( not ( = ?auto_739427 ?auto_739437 ) ) ( not ( = ?auto_739428 ?auto_739429 ) ) ( not ( = ?auto_739428 ?auto_739430 ) ) ( not ( = ?auto_739428 ?auto_739431 ) ) ( not ( = ?auto_739428 ?auto_739432 ) ) ( not ( = ?auto_739428 ?auto_739433 ) ) ( not ( = ?auto_739428 ?auto_739434 ) ) ( not ( = ?auto_739428 ?auto_739435 ) ) ( not ( = ?auto_739428 ?auto_739436 ) ) ( not ( = ?auto_739428 ?auto_739437 ) ) ( not ( = ?auto_739429 ?auto_739430 ) ) ( not ( = ?auto_739429 ?auto_739431 ) ) ( not ( = ?auto_739429 ?auto_739432 ) ) ( not ( = ?auto_739429 ?auto_739433 ) ) ( not ( = ?auto_739429 ?auto_739434 ) ) ( not ( = ?auto_739429 ?auto_739435 ) ) ( not ( = ?auto_739429 ?auto_739436 ) ) ( not ( = ?auto_739429 ?auto_739437 ) ) ( not ( = ?auto_739430 ?auto_739431 ) ) ( not ( = ?auto_739430 ?auto_739432 ) ) ( not ( = ?auto_739430 ?auto_739433 ) ) ( not ( = ?auto_739430 ?auto_739434 ) ) ( not ( = ?auto_739430 ?auto_739435 ) ) ( not ( = ?auto_739430 ?auto_739436 ) ) ( not ( = ?auto_739430 ?auto_739437 ) ) ( not ( = ?auto_739431 ?auto_739432 ) ) ( not ( = ?auto_739431 ?auto_739433 ) ) ( not ( = ?auto_739431 ?auto_739434 ) ) ( not ( = ?auto_739431 ?auto_739435 ) ) ( not ( = ?auto_739431 ?auto_739436 ) ) ( not ( = ?auto_739431 ?auto_739437 ) ) ( not ( = ?auto_739432 ?auto_739433 ) ) ( not ( = ?auto_739432 ?auto_739434 ) ) ( not ( = ?auto_739432 ?auto_739435 ) ) ( not ( = ?auto_739432 ?auto_739436 ) ) ( not ( = ?auto_739432 ?auto_739437 ) ) ( not ( = ?auto_739433 ?auto_739434 ) ) ( not ( = ?auto_739433 ?auto_739435 ) ) ( not ( = ?auto_739433 ?auto_739436 ) ) ( not ( = ?auto_739433 ?auto_739437 ) ) ( not ( = ?auto_739434 ?auto_739435 ) ) ( not ( = ?auto_739434 ?auto_739436 ) ) ( not ( = ?auto_739434 ?auto_739437 ) ) ( not ( = ?auto_739435 ?auto_739436 ) ) ( not ( = ?auto_739435 ?auto_739437 ) ) ( not ( = ?auto_739436 ?auto_739437 ) ) ( ON ?auto_739436 ?auto_739437 ) ( ON ?auto_739435 ?auto_739436 ) ( ON ?auto_739434 ?auto_739435 ) ( ON ?auto_739433 ?auto_739434 ) ( ON ?auto_739432 ?auto_739433 ) ( ON ?auto_739431 ?auto_739432 ) ( ON ?auto_739430 ?auto_739431 ) ( ON ?auto_739429 ?auto_739430 ) ( ON ?auto_739428 ?auto_739429 ) ( ON ?auto_739427 ?auto_739428 ) ( ON ?auto_739426 ?auto_739427 ) ( ON ?auto_739425 ?auto_739426 ) ( CLEAR ?auto_739423 ) ( ON ?auto_739424 ?auto_739425 ) ( CLEAR ?auto_739424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_739421 ?auto_739422 ?auto_739423 ?auto_739424 )
      ( MAKE-17PILE ?auto_739421 ?auto_739422 ?auto_739423 ?auto_739424 ?auto_739425 ?auto_739426 ?auto_739427 ?auto_739428 ?auto_739429 ?auto_739430 ?auto_739431 ?auto_739432 ?auto_739433 ?auto_739434 ?auto_739435 ?auto_739436 ?auto_739437 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739455 - BLOCK
      ?auto_739456 - BLOCK
      ?auto_739457 - BLOCK
      ?auto_739458 - BLOCK
      ?auto_739459 - BLOCK
      ?auto_739460 - BLOCK
      ?auto_739461 - BLOCK
      ?auto_739462 - BLOCK
      ?auto_739463 - BLOCK
      ?auto_739464 - BLOCK
      ?auto_739465 - BLOCK
      ?auto_739466 - BLOCK
      ?auto_739467 - BLOCK
      ?auto_739468 - BLOCK
      ?auto_739469 - BLOCK
      ?auto_739470 - BLOCK
      ?auto_739471 - BLOCK
    )
    :vars
    (
      ?auto_739472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739471 ?auto_739472 ) ( ON-TABLE ?auto_739455 ) ( ON ?auto_739456 ?auto_739455 ) ( not ( = ?auto_739455 ?auto_739456 ) ) ( not ( = ?auto_739455 ?auto_739457 ) ) ( not ( = ?auto_739455 ?auto_739458 ) ) ( not ( = ?auto_739455 ?auto_739459 ) ) ( not ( = ?auto_739455 ?auto_739460 ) ) ( not ( = ?auto_739455 ?auto_739461 ) ) ( not ( = ?auto_739455 ?auto_739462 ) ) ( not ( = ?auto_739455 ?auto_739463 ) ) ( not ( = ?auto_739455 ?auto_739464 ) ) ( not ( = ?auto_739455 ?auto_739465 ) ) ( not ( = ?auto_739455 ?auto_739466 ) ) ( not ( = ?auto_739455 ?auto_739467 ) ) ( not ( = ?auto_739455 ?auto_739468 ) ) ( not ( = ?auto_739455 ?auto_739469 ) ) ( not ( = ?auto_739455 ?auto_739470 ) ) ( not ( = ?auto_739455 ?auto_739471 ) ) ( not ( = ?auto_739455 ?auto_739472 ) ) ( not ( = ?auto_739456 ?auto_739457 ) ) ( not ( = ?auto_739456 ?auto_739458 ) ) ( not ( = ?auto_739456 ?auto_739459 ) ) ( not ( = ?auto_739456 ?auto_739460 ) ) ( not ( = ?auto_739456 ?auto_739461 ) ) ( not ( = ?auto_739456 ?auto_739462 ) ) ( not ( = ?auto_739456 ?auto_739463 ) ) ( not ( = ?auto_739456 ?auto_739464 ) ) ( not ( = ?auto_739456 ?auto_739465 ) ) ( not ( = ?auto_739456 ?auto_739466 ) ) ( not ( = ?auto_739456 ?auto_739467 ) ) ( not ( = ?auto_739456 ?auto_739468 ) ) ( not ( = ?auto_739456 ?auto_739469 ) ) ( not ( = ?auto_739456 ?auto_739470 ) ) ( not ( = ?auto_739456 ?auto_739471 ) ) ( not ( = ?auto_739456 ?auto_739472 ) ) ( not ( = ?auto_739457 ?auto_739458 ) ) ( not ( = ?auto_739457 ?auto_739459 ) ) ( not ( = ?auto_739457 ?auto_739460 ) ) ( not ( = ?auto_739457 ?auto_739461 ) ) ( not ( = ?auto_739457 ?auto_739462 ) ) ( not ( = ?auto_739457 ?auto_739463 ) ) ( not ( = ?auto_739457 ?auto_739464 ) ) ( not ( = ?auto_739457 ?auto_739465 ) ) ( not ( = ?auto_739457 ?auto_739466 ) ) ( not ( = ?auto_739457 ?auto_739467 ) ) ( not ( = ?auto_739457 ?auto_739468 ) ) ( not ( = ?auto_739457 ?auto_739469 ) ) ( not ( = ?auto_739457 ?auto_739470 ) ) ( not ( = ?auto_739457 ?auto_739471 ) ) ( not ( = ?auto_739457 ?auto_739472 ) ) ( not ( = ?auto_739458 ?auto_739459 ) ) ( not ( = ?auto_739458 ?auto_739460 ) ) ( not ( = ?auto_739458 ?auto_739461 ) ) ( not ( = ?auto_739458 ?auto_739462 ) ) ( not ( = ?auto_739458 ?auto_739463 ) ) ( not ( = ?auto_739458 ?auto_739464 ) ) ( not ( = ?auto_739458 ?auto_739465 ) ) ( not ( = ?auto_739458 ?auto_739466 ) ) ( not ( = ?auto_739458 ?auto_739467 ) ) ( not ( = ?auto_739458 ?auto_739468 ) ) ( not ( = ?auto_739458 ?auto_739469 ) ) ( not ( = ?auto_739458 ?auto_739470 ) ) ( not ( = ?auto_739458 ?auto_739471 ) ) ( not ( = ?auto_739458 ?auto_739472 ) ) ( not ( = ?auto_739459 ?auto_739460 ) ) ( not ( = ?auto_739459 ?auto_739461 ) ) ( not ( = ?auto_739459 ?auto_739462 ) ) ( not ( = ?auto_739459 ?auto_739463 ) ) ( not ( = ?auto_739459 ?auto_739464 ) ) ( not ( = ?auto_739459 ?auto_739465 ) ) ( not ( = ?auto_739459 ?auto_739466 ) ) ( not ( = ?auto_739459 ?auto_739467 ) ) ( not ( = ?auto_739459 ?auto_739468 ) ) ( not ( = ?auto_739459 ?auto_739469 ) ) ( not ( = ?auto_739459 ?auto_739470 ) ) ( not ( = ?auto_739459 ?auto_739471 ) ) ( not ( = ?auto_739459 ?auto_739472 ) ) ( not ( = ?auto_739460 ?auto_739461 ) ) ( not ( = ?auto_739460 ?auto_739462 ) ) ( not ( = ?auto_739460 ?auto_739463 ) ) ( not ( = ?auto_739460 ?auto_739464 ) ) ( not ( = ?auto_739460 ?auto_739465 ) ) ( not ( = ?auto_739460 ?auto_739466 ) ) ( not ( = ?auto_739460 ?auto_739467 ) ) ( not ( = ?auto_739460 ?auto_739468 ) ) ( not ( = ?auto_739460 ?auto_739469 ) ) ( not ( = ?auto_739460 ?auto_739470 ) ) ( not ( = ?auto_739460 ?auto_739471 ) ) ( not ( = ?auto_739460 ?auto_739472 ) ) ( not ( = ?auto_739461 ?auto_739462 ) ) ( not ( = ?auto_739461 ?auto_739463 ) ) ( not ( = ?auto_739461 ?auto_739464 ) ) ( not ( = ?auto_739461 ?auto_739465 ) ) ( not ( = ?auto_739461 ?auto_739466 ) ) ( not ( = ?auto_739461 ?auto_739467 ) ) ( not ( = ?auto_739461 ?auto_739468 ) ) ( not ( = ?auto_739461 ?auto_739469 ) ) ( not ( = ?auto_739461 ?auto_739470 ) ) ( not ( = ?auto_739461 ?auto_739471 ) ) ( not ( = ?auto_739461 ?auto_739472 ) ) ( not ( = ?auto_739462 ?auto_739463 ) ) ( not ( = ?auto_739462 ?auto_739464 ) ) ( not ( = ?auto_739462 ?auto_739465 ) ) ( not ( = ?auto_739462 ?auto_739466 ) ) ( not ( = ?auto_739462 ?auto_739467 ) ) ( not ( = ?auto_739462 ?auto_739468 ) ) ( not ( = ?auto_739462 ?auto_739469 ) ) ( not ( = ?auto_739462 ?auto_739470 ) ) ( not ( = ?auto_739462 ?auto_739471 ) ) ( not ( = ?auto_739462 ?auto_739472 ) ) ( not ( = ?auto_739463 ?auto_739464 ) ) ( not ( = ?auto_739463 ?auto_739465 ) ) ( not ( = ?auto_739463 ?auto_739466 ) ) ( not ( = ?auto_739463 ?auto_739467 ) ) ( not ( = ?auto_739463 ?auto_739468 ) ) ( not ( = ?auto_739463 ?auto_739469 ) ) ( not ( = ?auto_739463 ?auto_739470 ) ) ( not ( = ?auto_739463 ?auto_739471 ) ) ( not ( = ?auto_739463 ?auto_739472 ) ) ( not ( = ?auto_739464 ?auto_739465 ) ) ( not ( = ?auto_739464 ?auto_739466 ) ) ( not ( = ?auto_739464 ?auto_739467 ) ) ( not ( = ?auto_739464 ?auto_739468 ) ) ( not ( = ?auto_739464 ?auto_739469 ) ) ( not ( = ?auto_739464 ?auto_739470 ) ) ( not ( = ?auto_739464 ?auto_739471 ) ) ( not ( = ?auto_739464 ?auto_739472 ) ) ( not ( = ?auto_739465 ?auto_739466 ) ) ( not ( = ?auto_739465 ?auto_739467 ) ) ( not ( = ?auto_739465 ?auto_739468 ) ) ( not ( = ?auto_739465 ?auto_739469 ) ) ( not ( = ?auto_739465 ?auto_739470 ) ) ( not ( = ?auto_739465 ?auto_739471 ) ) ( not ( = ?auto_739465 ?auto_739472 ) ) ( not ( = ?auto_739466 ?auto_739467 ) ) ( not ( = ?auto_739466 ?auto_739468 ) ) ( not ( = ?auto_739466 ?auto_739469 ) ) ( not ( = ?auto_739466 ?auto_739470 ) ) ( not ( = ?auto_739466 ?auto_739471 ) ) ( not ( = ?auto_739466 ?auto_739472 ) ) ( not ( = ?auto_739467 ?auto_739468 ) ) ( not ( = ?auto_739467 ?auto_739469 ) ) ( not ( = ?auto_739467 ?auto_739470 ) ) ( not ( = ?auto_739467 ?auto_739471 ) ) ( not ( = ?auto_739467 ?auto_739472 ) ) ( not ( = ?auto_739468 ?auto_739469 ) ) ( not ( = ?auto_739468 ?auto_739470 ) ) ( not ( = ?auto_739468 ?auto_739471 ) ) ( not ( = ?auto_739468 ?auto_739472 ) ) ( not ( = ?auto_739469 ?auto_739470 ) ) ( not ( = ?auto_739469 ?auto_739471 ) ) ( not ( = ?auto_739469 ?auto_739472 ) ) ( not ( = ?auto_739470 ?auto_739471 ) ) ( not ( = ?auto_739470 ?auto_739472 ) ) ( not ( = ?auto_739471 ?auto_739472 ) ) ( ON ?auto_739470 ?auto_739471 ) ( ON ?auto_739469 ?auto_739470 ) ( ON ?auto_739468 ?auto_739469 ) ( ON ?auto_739467 ?auto_739468 ) ( ON ?auto_739466 ?auto_739467 ) ( ON ?auto_739465 ?auto_739466 ) ( ON ?auto_739464 ?auto_739465 ) ( ON ?auto_739463 ?auto_739464 ) ( ON ?auto_739462 ?auto_739463 ) ( ON ?auto_739461 ?auto_739462 ) ( ON ?auto_739460 ?auto_739461 ) ( ON ?auto_739459 ?auto_739460 ) ( ON ?auto_739458 ?auto_739459 ) ( CLEAR ?auto_739456 ) ( ON ?auto_739457 ?auto_739458 ) ( CLEAR ?auto_739457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_739455 ?auto_739456 ?auto_739457 )
      ( MAKE-17PILE ?auto_739455 ?auto_739456 ?auto_739457 ?auto_739458 ?auto_739459 ?auto_739460 ?auto_739461 ?auto_739462 ?auto_739463 ?auto_739464 ?auto_739465 ?auto_739466 ?auto_739467 ?auto_739468 ?auto_739469 ?auto_739470 ?auto_739471 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739490 - BLOCK
      ?auto_739491 - BLOCK
      ?auto_739492 - BLOCK
      ?auto_739493 - BLOCK
      ?auto_739494 - BLOCK
      ?auto_739495 - BLOCK
      ?auto_739496 - BLOCK
      ?auto_739497 - BLOCK
      ?auto_739498 - BLOCK
      ?auto_739499 - BLOCK
      ?auto_739500 - BLOCK
      ?auto_739501 - BLOCK
      ?auto_739502 - BLOCK
      ?auto_739503 - BLOCK
      ?auto_739504 - BLOCK
      ?auto_739505 - BLOCK
      ?auto_739506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739506 ) ( ON-TABLE ?auto_739490 ) ( ON ?auto_739491 ?auto_739490 ) ( not ( = ?auto_739490 ?auto_739491 ) ) ( not ( = ?auto_739490 ?auto_739492 ) ) ( not ( = ?auto_739490 ?auto_739493 ) ) ( not ( = ?auto_739490 ?auto_739494 ) ) ( not ( = ?auto_739490 ?auto_739495 ) ) ( not ( = ?auto_739490 ?auto_739496 ) ) ( not ( = ?auto_739490 ?auto_739497 ) ) ( not ( = ?auto_739490 ?auto_739498 ) ) ( not ( = ?auto_739490 ?auto_739499 ) ) ( not ( = ?auto_739490 ?auto_739500 ) ) ( not ( = ?auto_739490 ?auto_739501 ) ) ( not ( = ?auto_739490 ?auto_739502 ) ) ( not ( = ?auto_739490 ?auto_739503 ) ) ( not ( = ?auto_739490 ?auto_739504 ) ) ( not ( = ?auto_739490 ?auto_739505 ) ) ( not ( = ?auto_739490 ?auto_739506 ) ) ( not ( = ?auto_739491 ?auto_739492 ) ) ( not ( = ?auto_739491 ?auto_739493 ) ) ( not ( = ?auto_739491 ?auto_739494 ) ) ( not ( = ?auto_739491 ?auto_739495 ) ) ( not ( = ?auto_739491 ?auto_739496 ) ) ( not ( = ?auto_739491 ?auto_739497 ) ) ( not ( = ?auto_739491 ?auto_739498 ) ) ( not ( = ?auto_739491 ?auto_739499 ) ) ( not ( = ?auto_739491 ?auto_739500 ) ) ( not ( = ?auto_739491 ?auto_739501 ) ) ( not ( = ?auto_739491 ?auto_739502 ) ) ( not ( = ?auto_739491 ?auto_739503 ) ) ( not ( = ?auto_739491 ?auto_739504 ) ) ( not ( = ?auto_739491 ?auto_739505 ) ) ( not ( = ?auto_739491 ?auto_739506 ) ) ( not ( = ?auto_739492 ?auto_739493 ) ) ( not ( = ?auto_739492 ?auto_739494 ) ) ( not ( = ?auto_739492 ?auto_739495 ) ) ( not ( = ?auto_739492 ?auto_739496 ) ) ( not ( = ?auto_739492 ?auto_739497 ) ) ( not ( = ?auto_739492 ?auto_739498 ) ) ( not ( = ?auto_739492 ?auto_739499 ) ) ( not ( = ?auto_739492 ?auto_739500 ) ) ( not ( = ?auto_739492 ?auto_739501 ) ) ( not ( = ?auto_739492 ?auto_739502 ) ) ( not ( = ?auto_739492 ?auto_739503 ) ) ( not ( = ?auto_739492 ?auto_739504 ) ) ( not ( = ?auto_739492 ?auto_739505 ) ) ( not ( = ?auto_739492 ?auto_739506 ) ) ( not ( = ?auto_739493 ?auto_739494 ) ) ( not ( = ?auto_739493 ?auto_739495 ) ) ( not ( = ?auto_739493 ?auto_739496 ) ) ( not ( = ?auto_739493 ?auto_739497 ) ) ( not ( = ?auto_739493 ?auto_739498 ) ) ( not ( = ?auto_739493 ?auto_739499 ) ) ( not ( = ?auto_739493 ?auto_739500 ) ) ( not ( = ?auto_739493 ?auto_739501 ) ) ( not ( = ?auto_739493 ?auto_739502 ) ) ( not ( = ?auto_739493 ?auto_739503 ) ) ( not ( = ?auto_739493 ?auto_739504 ) ) ( not ( = ?auto_739493 ?auto_739505 ) ) ( not ( = ?auto_739493 ?auto_739506 ) ) ( not ( = ?auto_739494 ?auto_739495 ) ) ( not ( = ?auto_739494 ?auto_739496 ) ) ( not ( = ?auto_739494 ?auto_739497 ) ) ( not ( = ?auto_739494 ?auto_739498 ) ) ( not ( = ?auto_739494 ?auto_739499 ) ) ( not ( = ?auto_739494 ?auto_739500 ) ) ( not ( = ?auto_739494 ?auto_739501 ) ) ( not ( = ?auto_739494 ?auto_739502 ) ) ( not ( = ?auto_739494 ?auto_739503 ) ) ( not ( = ?auto_739494 ?auto_739504 ) ) ( not ( = ?auto_739494 ?auto_739505 ) ) ( not ( = ?auto_739494 ?auto_739506 ) ) ( not ( = ?auto_739495 ?auto_739496 ) ) ( not ( = ?auto_739495 ?auto_739497 ) ) ( not ( = ?auto_739495 ?auto_739498 ) ) ( not ( = ?auto_739495 ?auto_739499 ) ) ( not ( = ?auto_739495 ?auto_739500 ) ) ( not ( = ?auto_739495 ?auto_739501 ) ) ( not ( = ?auto_739495 ?auto_739502 ) ) ( not ( = ?auto_739495 ?auto_739503 ) ) ( not ( = ?auto_739495 ?auto_739504 ) ) ( not ( = ?auto_739495 ?auto_739505 ) ) ( not ( = ?auto_739495 ?auto_739506 ) ) ( not ( = ?auto_739496 ?auto_739497 ) ) ( not ( = ?auto_739496 ?auto_739498 ) ) ( not ( = ?auto_739496 ?auto_739499 ) ) ( not ( = ?auto_739496 ?auto_739500 ) ) ( not ( = ?auto_739496 ?auto_739501 ) ) ( not ( = ?auto_739496 ?auto_739502 ) ) ( not ( = ?auto_739496 ?auto_739503 ) ) ( not ( = ?auto_739496 ?auto_739504 ) ) ( not ( = ?auto_739496 ?auto_739505 ) ) ( not ( = ?auto_739496 ?auto_739506 ) ) ( not ( = ?auto_739497 ?auto_739498 ) ) ( not ( = ?auto_739497 ?auto_739499 ) ) ( not ( = ?auto_739497 ?auto_739500 ) ) ( not ( = ?auto_739497 ?auto_739501 ) ) ( not ( = ?auto_739497 ?auto_739502 ) ) ( not ( = ?auto_739497 ?auto_739503 ) ) ( not ( = ?auto_739497 ?auto_739504 ) ) ( not ( = ?auto_739497 ?auto_739505 ) ) ( not ( = ?auto_739497 ?auto_739506 ) ) ( not ( = ?auto_739498 ?auto_739499 ) ) ( not ( = ?auto_739498 ?auto_739500 ) ) ( not ( = ?auto_739498 ?auto_739501 ) ) ( not ( = ?auto_739498 ?auto_739502 ) ) ( not ( = ?auto_739498 ?auto_739503 ) ) ( not ( = ?auto_739498 ?auto_739504 ) ) ( not ( = ?auto_739498 ?auto_739505 ) ) ( not ( = ?auto_739498 ?auto_739506 ) ) ( not ( = ?auto_739499 ?auto_739500 ) ) ( not ( = ?auto_739499 ?auto_739501 ) ) ( not ( = ?auto_739499 ?auto_739502 ) ) ( not ( = ?auto_739499 ?auto_739503 ) ) ( not ( = ?auto_739499 ?auto_739504 ) ) ( not ( = ?auto_739499 ?auto_739505 ) ) ( not ( = ?auto_739499 ?auto_739506 ) ) ( not ( = ?auto_739500 ?auto_739501 ) ) ( not ( = ?auto_739500 ?auto_739502 ) ) ( not ( = ?auto_739500 ?auto_739503 ) ) ( not ( = ?auto_739500 ?auto_739504 ) ) ( not ( = ?auto_739500 ?auto_739505 ) ) ( not ( = ?auto_739500 ?auto_739506 ) ) ( not ( = ?auto_739501 ?auto_739502 ) ) ( not ( = ?auto_739501 ?auto_739503 ) ) ( not ( = ?auto_739501 ?auto_739504 ) ) ( not ( = ?auto_739501 ?auto_739505 ) ) ( not ( = ?auto_739501 ?auto_739506 ) ) ( not ( = ?auto_739502 ?auto_739503 ) ) ( not ( = ?auto_739502 ?auto_739504 ) ) ( not ( = ?auto_739502 ?auto_739505 ) ) ( not ( = ?auto_739502 ?auto_739506 ) ) ( not ( = ?auto_739503 ?auto_739504 ) ) ( not ( = ?auto_739503 ?auto_739505 ) ) ( not ( = ?auto_739503 ?auto_739506 ) ) ( not ( = ?auto_739504 ?auto_739505 ) ) ( not ( = ?auto_739504 ?auto_739506 ) ) ( not ( = ?auto_739505 ?auto_739506 ) ) ( ON ?auto_739505 ?auto_739506 ) ( ON ?auto_739504 ?auto_739505 ) ( ON ?auto_739503 ?auto_739504 ) ( ON ?auto_739502 ?auto_739503 ) ( ON ?auto_739501 ?auto_739502 ) ( ON ?auto_739500 ?auto_739501 ) ( ON ?auto_739499 ?auto_739500 ) ( ON ?auto_739498 ?auto_739499 ) ( ON ?auto_739497 ?auto_739498 ) ( ON ?auto_739496 ?auto_739497 ) ( ON ?auto_739495 ?auto_739496 ) ( ON ?auto_739494 ?auto_739495 ) ( ON ?auto_739493 ?auto_739494 ) ( CLEAR ?auto_739491 ) ( ON ?auto_739492 ?auto_739493 ) ( CLEAR ?auto_739492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_739490 ?auto_739491 ?auto_739492 )
      ( MAKE-17PILE ?auto_739490 ?auto_739491 ?auto_739492 ?auto_739493 ?auto_739494 ?auto_739495 ?auto_739496 ?auto_739497 ?auto_739498 ?auto_739499 ?auto_739500 ?auto_739501 ?auto_739502 ?auto_739503 ?auto_739504 ?auto_739505 ?auto_739506 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739524 - BLOCK
      ?auto_739525 - BLOCK
      ?auto_739526 - BLOCK
      ?auto_739527 - BLOCK
      ?auto_739528 - BLOCK
      ?auto_739529 - BLOCK
      ?auto_739530 - BLOCK
      ?auto_739531 - BLOCK
      ?auto_739532 - BLOCK
      ?auto_739533 - BLOCK
      ?auto_739534 - BLOCK
      ?auto_739535 - BLOCK
      ?auto_739536 - BLOCK
      ?auto_739537 - BLOCK
      ?auto_739538 - BLOCK
      ?auto_739539 - BLOCK
      ?auto_739540 - BLOCK
    )
    :vars
    (
      ?auto_739541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739540 ?auto_739541 ) ( ON-TABLE ?auto_739524 ) ( not ( = ?auto_739524 ?auto_739525 ) ) ( not ( = ?auto_739524 ?auto_739526 ) ) ( not ( = ?auto_739524 ?auto_739527 ) ) ( not ( = ?auto_739524 ?auto_739528 ) ) ( not ( = ?auto_739524 ?auto_739529 ) ) ( not ( = ?auto_739524 ?auto_739530 ) ) ( not ( = ?auto_739524 ?auto_739531 ) ) ( not ( = ?auto_739524 ?auto_739532 ) ) ( not ( = ?auto_739524 ?auto_739533 ) ) ( not ( = ?auto_739524 ?auto_739534 ) ) ( not ( = ?auto_739524 ?auto_739535 ) ) ( not ( = ?auto_739524 ?auto_739536 ) ) ( not ( = ?auto_739524 ?auto_739537 ) ) ( not ( = ?auto_739524 ?auto_739538 ) ) ( not ( = ?auto_739524 ?auto_739539 ) ) ( not ( = ?auto_739524 ?auto_739540 ) ) ( not ( = ?auto_739524 ?auto_739541 ) ) ( not ( = ?auto_739525 ?auto_739526 ) ) ( not ( = ?auto_739525 ?auto_739527 ) ) ( not ( = ?auto_739525 ?auto_739528 ) ) ( not ( = ?auto_739525 ?auto_739529 ) ) ( not ( = ?auto_739525 ?auto_739530 ) ) ( not ( = ?auto_739525 ?auto_739531 ) ) ( not ( = ?auto_739525 ?auto_739532 ) ) ( not ( = ?auto_739525 ?auto_739533 ) ) ( not ( = ?auto_739525 ?auto_739534 ) ) ( not ( = ?auto_739525 ?auto_739535 ) ) ( not ( = ?auto_739525 ?auto_739536 ) ) ( not ( = ?auto_739525 ?auto_739537 ) ) ( not ( = ?auto_739525 ?auto_739538 ) ) ( not ( = ?auto_739525 ?auto_739539 ) ) ( not ( = ?auto_739525 ?auto_739540 ) ) ( not ( = ?auto_739525 ?auto_739541 ) ) ( not ( = ?auto_739526 ?auto_739527 ) ) ( not ( = ?auto_739526 ?auto_739528 ) ) ( not ( = ?auto_739526 ?auto_739529 ) ) ( not ( = ?auto_739526 ?auto_739530 ) ) ( not ( = ?auto_739526 ?auto_739531 ) ) ( not ( = ?auto_739526 ?auto_739532 ) ) ( not ( = ?auto_739526 ?auto_739533 ) ) ( not ( = ?auto_739526 ?auto_739534 ) ) ( not ( = ?auto_739526 ?auto_739535 ) ) ( not ( = ?auto_739526 ?auto_739536 ) ) ( not ( = ?auto_739526 ?auto_739537 ) ) ( not ( = ?auto_739526 ?auto_739538 ) ) ( not ( = ?auto_739526 ?auto_739539 ) ) ( not ( = ?auto_739526 ?auto_739540 ) ) ( not ( = ?auto_739526 ?auto_739541 ) ) ( not ( = ?auto_739527 ?auto_739528 ) ) ( not ( = ?auto_739527 ?auto_739529 ) ) ( not ( = ?auto_739527 ?auto_739530 ) ) ( not ( = ?auto_739527 ?auto_739531 ) ) ( not ( = ?auto_739527 ?auto_739532 ) ) ( not ( = ?auto_739527 ?auto_739533 ) ) ( not ( = ?auto_739527 ?auto_739534 ) ) ( not ( = ?auto_739527 ?auto_739535 ) ) ( not ( = ?auto_739527 ?auto_739536 ) ) ( not ( = ?auto_739527 ?auto_739537 ) ) ( not ( = ?auto_739527 ?auto_739538 ) ) ( not ( = ?auto_739527 ?auto_739539 ) ) ( not ( = ?auto_739527 ?auto_739540 ) ) ( not ( = ?auto_739527 ?auto_739541 ) ) ( not ( = ?auto_739528 ?auto_739529 ) ) ( not ( = ?auto_739528 ?auto_739530 ) ) ( not ( = ?auto_739528 ?auto_739531 ) ) ( not ( = ?auto_739528 ?auto_739532 ) ) ( not ( = ?auto_739528 ?auto_739533 ) ) ( not ( = ?auto_739528 ?auto_739534 ) ) ( not ( = ?auto_739528 ?auto_739535 ) ) ( not ( = ?auto_739528 ?auto_739536 ) ) ( not ( = ?auto_739528 ?auto_739537 ) ) ( not ( = ?auto_739528 ?auto_739538 ) ) ( not ( = ?auto_739528 ?auto_739539 ) ) ( not ( = ?auto_739528 ?auto_739540 ) ) ( not ( = ?auto_739528 ?auto_739541 ) ) ( not ( = ?auto_739529 ?auto_739530 ) ) ( not ( = ?auto_739529 ?auto_739531 ) ) ( not ( = ?auto_739529 ?auto_739532 ) ) ( not ( = ?auto_739529 ?auto_739533 ) ) ( not ( = ?auto_739529 ?auto_739534 ) ) ( not ( = ?auto_739529 ?auto_739535 ) ) ( not ( = ?auto_739529 ?auto_739536 ) ) ( not ( = ?auto_739529 ?auto_739537 ) ) ( not ( = ?auto_739529 ?auto_739538 ) ) ( not ( = ?auto_739529 ?auto_739539 ) ) ( not ( = ?auto_739529 ?auto_739540 ) ) ( not ( = ?auto_739529 ?auto_739541 ) ) ( not ( = ?auto_739530 ?auto_739531 ) ) ( not ( = ?auto_739530 ?auto_739532 ) ) ( not ( = ?auto_739530 ?auto_739533 ) ) ( not ( = ?auto_739530 ?auto_739534 ) ) ( not ( = ?auto_739530 ?auto_739535 ) ) ( not ( = ?auto_739530 ?auto_739536 ) ) ( not ( = ?auto_739530 ?auto_739537 ) ) ( not ( = ?auto_739530 ?auto_739538 ) ) ( not ( = ?auto_739530 ?auto_739539 ) ) ( not ( = ?auto_739530 ?auto_739540 ) ) ( not ( = ?auto_739530 ?auto_739541 ) ) ( not ( = ?auto_739531 ?auto_739532 ) ) ( not ( = ?auto_739531 ?auto_739533 ) ) ( not ( = ?auto_739531 ?auto_739534 ) ) ( not ( = ?auto_739531 ?auto_739535 ) ) ( not ( = ?auto_739531 ?auto_739536 ) ) ( not ( = ?auto_739531 ?auto_739537 ) ) ( not ( = ?auto_739531 ?auto_739538 ) ) ( not ( = ?auto_739531 ?auto_739539 ) ) ( not ( = ?auto_739531 ?auto_739540 ) ) ( not ( = ?auto_739531 ?auto_739541 ) ) ( not ( = ?auto_739532 ?auto_739533 ) ) ( not ( = ?auto_739532 ?auto_739534 ) ) ( not ( = ?auto_739532 ?auto_739535 ) ) ( not ( = ?auto_739532 ?auto_739536 ) ) ( not ( = ?auto_739532 ?auto_739537 ) ) ( not ( = ?auto_739532 ?auto_739538 ) ) ( not ( = ?auto_739532 ?auto_739539 ) ) ( not ( = ?auto_739532 ?auto_739540 ) ) ( not ( = ?auto_739532 ?auto_739541 ) ) ( not ( = ?auto_739533 ?auto_739534 ) ) ( not ( = ?auto_739533 ?auto_739535 ) ) ( not ( = ?auto_739533 ?auto_739536 ) ) ( not ( = ?auto_739533 ?auto_739537 ) ) ( not ( = ?auto_739533 ?auto_739538 ) ) ( not ( = ?auto_739533 ?auto_739539 ) ) ( not ( = ?auto_739533 ?auto_739540 ) ) ( not ( = ?auto_739533 ?auto_739541 ) ) ( not ( = ?auto_739534 ?auto_739535 ) ) ( not ( = ?auto_739534 ?auto_739536 ) ) ( not ( = ?auto_739534 ?auto_739537 ) ) ( not ( = ?auto_739534 ?auto_739538 ) ) ( not ( = ?auto_739534 ?auto_739539 ) ) ( not ( = ?auto_739534 ?auto_739540 ) ) ( not ( = ?auto_739534 ?auto_739541 ) ) ( not ( = ?auto_739535 ?auto_739536 ) ) ( not ( = ?auto_739535 ?auto_739537 ) ) ( not ( = ?auto_739535 ?auto_739538 ) ) ( not ( = ?auto_739535 ?auto_739539 ) ) ( not ( = ?auto_739535 ?auto_739540 ) ) ( not ( = ?auto_739535 ?auto_739541 ) ) ( not ( = ?auto_739536 ?auto_739537 ) ) ( not ( = ?auto_739536 ?auto_739538 ) ) ( not ( = ?auto_739536 ?auto_739539 ) ) ( not ( = ?auto_739536 ?auto_739540 ) ) ( not ( = ?auto_739536 ?auto_739541 ) ) ( not ( = ?auto_739537 ?auto_739538 ) ) ( not ( = ?auto_739537 ?auto_739539 ) ) ( not ( = ?auto_739537 ?auto_739540 ) ) ( not ( = ?auto_739537 ?auto_739541 ) ) ( not ( = ?auto_739538 ?auto_739539 ) ) ( not ( = ?auto_739538 ?auto_739540 ) ) ( not ( = ?auto_739538 ?auto_739541 ) ) ( not ( = ?auto_739539 ?auto_739540 ) ) ( not ( = ?auto_739539 ?auto_739541 ) ) ( not ( = ?auto_739540 ?auto_739541 ) ) ( ON ?auto_739539 ?auto_739540 ) ( ON ?auto_739538 ?auto_739539 ) ( ON ?auto_739537 ?auto_739538 ) ( ON ?auto_739536 ?auto_739537 ) ( ON ?auto_739535 ?auto_739536 ) ( ON ?auto_739534 ?auto_739535 ) ( ON ?auto_739533 ?auto_739534 ) ( ON ?auto_739532 ?auto_739533 ) ( ON ?auto_739531 ?auto_739532 ) ( ON ?auto_739530 ?auto_739531 ) ( ON ?auto_739529 ?auto_739530 ) ( ON ?auto_739528 ?auto_739529 ) ( ON ?auto_739527 ?auto_739528 ) ( ON ?auto_739526 ?auto_739527 ) ( CLEAR ?auto_739524 ) ( ON ?auto_739525 ?auto_739526 ) ( CLEAR ?auto_739525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_739524 ?auto_739525 )
      ( MAKE-17PILE ?auto_739524 ?auto_739525 ?auto_739526 ?auto_739527 ?auto_739528 ?auto_739529 ?auto_739530 ?auto_739531 ?auto_739532 ?auto_739533 ?auto_739534 ?auto_739535 ?auto_739536 ?auto_739537 ?auto_739538 ?auto_739539 ?auto_739540 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739559 - BLOCK
      ?auto_739560 - BLOCK
      ?auto_739561 - BLOCK
      ?auto_739562 - BLOCK
      ?auto_739563 - BLOCK
      ?auto_739564 - BLOCK
      ?auto_739565 - BLOCK
      ?auto_739566 - BLOCK
      ?auto_739567 - BLOCK
      ?auto_739568 - BLOCK
      ?auto_739569 - BLOCK
      ?auto_739570 - BLOCK
      ?auto_739571 - BLOCK
      ?auto_739572 - BLOCK
      ?auto_739573 - BLOCK
      ?auto_739574 - BLOCK
      ?auto_739575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739575 ) ( ON-TABLE ?auto_739559 ) ( not ( = ?auto_739559 ?auto_739560 ) ) ( not ( = ?auto_739559 ?auto_739561 ) ) ( not ( = ?auto_739559 ?auto_739562 ) ) ( not ( = ?auto_739559 ?auto_739563 ) ) ( not ( = ?auto_739559 ?auto_739564 ) ) ( not ( = ?auto_739559 ?auto_739565 ) ) ( not ( = ?auto_739559 ?auto_739566 ) ) ( not ( = ?auto_739559 ?auto_739567 ) ) ( not ( = ?auto_739559 ?auto_739568 ) ) ( not ( = ?auto_739559 ?auto_739569 ) ) ( not ( = ?auto_739559 ?auto_739570 ) ) ( not ( = ?auto_739559 ?auto_739571 ) ) ( not ( = ?auto_739559 ?auto_739572 ) ) ( not ( = ?auto_739559 ?auto_739573 ) ) ( not ( = ?auto_739559 ?auto_739574 ) ) ( not ( = ?auto_739559 ?auto_739575 ) ) ( not ( = ?auto_739560 ?auto_739561 ) ) ( not ( = ?auto_739560 ?auto_739562 ) ) ( not ( = ?auto_739560 ?auto_739563 ) ) ( not ( = ?auto_739560 ?auto_739564 ) ) ( not ( = ?auto_739560 ?auto_739565 ) ) ( not ( = ?auto_739560 ?auto_739566 ) ) ( not ( = ?auto_739560 ?auto_739567 ) ) ( not ( = ?auto_739560 ?auto_739568 ) ) ( not ( = ?auto_739560 ?auto_739569 ) ) ( not ( = ?auto_739560 ?auto_739570 ) ) ( not ( = ?auto_739560 ?auto_739571 ) ) ( not ( = ?auto_739560 ?auto_739572 ) ) ( not ( = ?auto_739560 ?auto_739573 ) ) ( not ( = ?auto_739560 ?auto_739574 ) ) ( not ( = ?auto_739560 ?auto_739575 ) ) ( not ( = ?auto_739561 ?auto_739562 ) ) ( not ( = ?auto_739561 ?auto_739563 ) ) ( not ( = ?auto_739561 ?auto_739564 ) ) ( not ( = ?auto_739561 ?auto_739565 ) ) ( not ( = ?auto_739561 ?auto_739566 ) ) ( not ( = ?auto_739561 ?auto_739567 ) ) ( not ( = ?auto_739561 ?auto_739568 ) ) ( not ( = ?auto_739561 ?auto_739569 ) ) ( not ( = ?auto_739561 ?auto_739570 ) ) ( not ( = ?auto_739561 ?auto_739571 ) ) ( not ( = ?auto_739561 ?auto_739572 ) ) ( not ( = ?auto_739561 ?auto_739573 ) ) ( not ( = ?auto_739561 ?auto_739574 ) ) ( not ( = ?auto_739561 ?auto_739575 ) ) ( not ( = ?auto_739562 ?auto_739563 ) ) ( not ( = ?auto_739562 ?auto_739564 ) ) ( not ( = ?auto_739562 ?auto_739565 ) ) ( not ( = ?auto_739562 ?auto_739566 ) ) ( not ( = ?auto_739562 ?auto_739567 ) ) ( not ( = ?auto_739562 ?auto_739568 ) ) ( not ( = ?auto_739562 ?auto_739569 ) ) ( not ( = ?auto_739562 ?auto_739570 ) ) ( not ( = ?auto_739562 ?auto_739571 ) ) ( not ( = ?auto_739562 ?auto_739572 ) ) ( not ( = ?auto_739562 ?auto_739573 ) ) ( not ( = ?auto_739562 ?auto_739574 ) ) ( not ( = ?auto_739562 ?auto_739575 ) ) ( not ( = ?auto_739563 ?auto_739564 ) ) ( not ( = ?auto_739563 ?auto_739565 ) ) ( not ( = ?auto_739563 ?auto_739566 ) ) ( not ( = ?auto_739563 ?auto_739567 ) ) ( not ( = ?auto_739563 ?auto_739568 ) ) ( not ( = ?auto_739563 ?auto_739569 ) ) ( not ( = ?auto_739563 ?auto_739570 ) ) ( not ( = ?auto_739563 ?auto_739571 ) ) ( not ( = ?auto_739563 ?auto_739572 ) ) ( not ( = ?auto_739563 ?auto_739573 ) ) ( not ( = ?auto_739563 ?auto_739574 ) ) ( not ( = ?auto_739563 ?auto_739575 ) ) ( not ( = ?auto_739564 ?auto_739565 ) ) ( not ( = ?auto_739564 ?auto_739566 ) ) ( not ( = ?auto_739564 ?auto_739567 ) ) ( not ( = ?auto_739564 ?auto_739568 ) ) ( not ( = ?auto_739564 ?auto_739569 ) ) ( not ( = ?auto_739564 ?auto_739570 ) ) ( not ( = ?auto_739564 ?auto_739571 ) ) ( not ( = ?auto_739564 ?auto_739572 ) ) ( not ( = ?auto_739564 ?auto_739573 ) ) ( not ( = ?auto_739564 ?auto_739574 ) ) ( not ( = ?auto_739564 ?auto_739575 ) ) ( not ( = ?auto_739565 ?auto_739566 ) ) ( not ( = ?auto_739565 ?auto_739567 ) ) ( not ( = ?auto_739565 ?auto_739568 ) ) ( not ( = ?auto_739565 ?auto_739569 ) ) ( not ( = ?auto_739565 ?auto_739570 ) ) ( not ( = ?auto_739565 ?auto_739571 ) ) ( not ( = ?auto_739565 ?auto_739572 ) ) ( not ( = ?auto_739565 ?auto_739573 ) ) ( not ( = ?auto_739565 ?auto_739574 ) ) ( not ( = ?auto_739565 ?auto_739575 ) ) ( not ( = ?auto_739566 ?auto_739567 ) ) ( not ( = ?auto_739566 ?auto_739568 ) ) ( not ( = ?auto_739566 ?auto_739569 ) ) ( not ( = ?auto_739566 ?auto_739570 ) ) ( not ( = ?auto_739566 ?auto_739571 ) ) ( not ( = ?auto_739566 ?auto_739572 ) ) ( not ( = ?auto_739566 ?auto_739573 ) ) ( not ( = ?auto_739566 ?auto_739574 ) ) ( not ( = ?auto_739566 ?auto_739575 ) ) ( not ( = ?auto_739567 ?auto_739568 ) ) ( not ( = ?auto_739567 ?auto_739569 ) ) ( not ( = ?auto_739567 ?auto_739570 ) ) ( not ( = ?auto_739567 ?auto_739571 ) ) ( not ( = ?auto_739567 ?auto_739572 ) ) ( not ( = ?auto_739567 ?auto_739573 ) ) ( not ( = ?auto_739567 ?auto_739574 ) ) ( not ( = ?auto_739567 ?auto_739575 ) ) ( not ( = ?auto_739568 ?auto_739569 ) ) ( not ( = ?auto_739568 ?auto_739570 ) ) ( not ( = ?auto_739568 ?auto_739571 ) ) ( not ( = ?auto_739568 ?auto_739572 ) ) ( not ( = ?auto_739568 ?auto_739573 ) ) ( not ( = ?auto_739568 ?auto_739574 ) ) ( not ( = ?auto_739568 ?auto_739575 ) ) ( not ( = ?auto_739569 ?auto_739570 ) ) ( not ( = ?auto_739569 ?auto_739571 ) ) ( not ( = ?auto_739569 ?auto_739572 ) ) ( not ( = ?auto_739569 ?auto_739573 ) ) ( not ( = ?auto_739569 ?auto_739574 ) ) ( not ( = ?auto_739569 ?auto_739575 ) ) ( not ( = ?auto_739570 ?auto_739571 ) ) ( not ( = ?auto_739570 ?auto_739572 ) ) ( not ( = ?auto_739570 ?auto_739573 ) ) ( not ( = ?auto_739570 ?auto_739574 ) ) ( not ( = ?auto_739570 ?auto_739575 ) ) ( not ( = ?auto_739571 ?auto_739572 ) ) ( not ( = ?auto_739571 ?auto_739573 ) ) ( not ( = ?auto_739571 ?auto_739574 ) ) ( not ( = ?auto_739571 ?auto_739575 ) ) ( not ( = ?auto_739572 ?auto_739573 ) ) ( not ( = ?auto_739572 ?auto_739574 ) ) ( not ( = ?auto_739572 ?auto_739575 ) ) ( not ( = ?auto_739573 ?auto_739574 ) ) ( not ( = ?auto_739573 ?auto_739575 ) ) ( not ( = ?auto_739574 ?auto_739575 ) ) ( ON ?auto_739574 ?auto_739575 ) ( ON ?auto_739573 ?auto_739574 ) ( ON ?auto_739572 ?auto_739573 ) ( ON ?auto_739571 ?auto_739572 ) ( ON ?auto_739570 ?auto_739571 ) ( ON ?auto_739569 ?auto_739570 ) ( ON ?auto_739568 ?auto_739569 ) ( ON ?auto_739567 ?auto_739568 ) ( ON ?auto_739566 ?auto_739567 ) ( ON ?auto_739565 ?auto_739566 ) ( ON ?auto_739564 ?auto_739565 ) ( ON ?auto_739563 ?auto_739564 ) ( ON ?auto_739562 ?auto_739563 ) ( ON ?auto_739561 ?auto_739562 ) ( CLEAR ?auto_739559 ) ( ON ?auto_739560 ?auto_739561 ) ( CLEAR ?auto_739560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_739559 ?auto_739560 )
      ( MAKE-17PILE ?auto_739559 ?auto_739560 ?auto_739561 ?auto_739562 ?auto_739563 ?auto_739564 ?auto_739565 ?auto_739566 ?auto_739567 ?auto_739568 ?auto_739569 ?auto_739570 ?auto_739571 ?auto_739572 ?auto_739573 ?auto_739574 ?auto_739575 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739593 - BLOCK
      ?auto_739594 - BLOCK
      ?auto_739595 - BLOCK
      ?auto_739596 - BLOCK
      ?auto_739597 - BLOCK
      ?auto_739598 - BLOCK
      ?auto_739599 - BLOCK
      ?auto_739600 - BLOCK
      ?auto_739601 - BLOCK
      ?auto_739602 - BLOCK
      ?auto_739603 - BLOCK
      ?auto_739604 - BLOCK
      ?auto_739605 - BLOCK
      ?auto_739606 - BLOCK
      ?auto_739607 - BLOCK
      ?auto_739608 - BLOCK
      ?auto_739609 - BLOCK
    )
    :vars
    (
      ?auto_739610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_739609 ?auto_739610 ) ( not ( = ?auto_739593 ?auto_739594 ) ) ( not ( = ?auto_739593 ?auto_739595 ) ) ( not ( = ?auto_739593 ?auto_739596 ) ) ( not ( = ?auto_739593 ?auto_739597 ) ) ( not ( = ?auto_739593 ?auto_739598 ) ) ( not ( = ?auto_739593 ?auto_739599 ) ) ( not ( = ?auto_739593 ?auto_739600 ) ) ( not ( = ?auto_739593 ?auto_739601 ) ) ( not ( = ?auto_739593 ?auto_739602 ) ) ( not ( = ?auto_739593 ?auto_739603 ) ) ( not ( = ?auto_739593 ?auto_739604 ) ) ( not ( = ?auto_739593 ?auto_739605 ) ) ( not ( = ?auto_739593 ?auto_739606 ) ) ( not ( = ?auto_739593 ?auto_739607 ) ) ( not ( = ?auto_739593 ?auto_739608 ) ) ( not ( = ?auto_739593 ?auto_739609 ) ) ( not ( = ?auto_739593 ?auto_739610 ) ) ( not ( = ?auto_739594 ?auto_739595 ) ) ( not ( = ?auto_739594 ?auto_739596 ) ) ( not ( = ?auto_739594 ?auto_739597 ) ) ( not ( = ?auto_739594 ?auto_739598 ) ) ( not ( = ?auto_739594 ?auto_739599 ) ) ( not ( = ?auto_739594 ?auto_739600 ) ) ( not ( = ?auto_739594 ?auto_739601 ) ) ( not ( = ?auto_739594 ?auto_739602 ) ) ( not ( = ?auto_739594 ?auto_739603 ) ) ( not ( = ?auto_739594 ?auto_739604 ) ) ( not ( = ?auto_739594 ?auto_739605 ) ) ( not ( = ?auto_739594 ?auto_739606 ) ) ( not ( = ?auto_739594 ?auto_739607 ) ) ( not ( = ?auto_739594 ?auto_739608 ) ) ( not ( = ?auto_739594 ?auto_739609 ) ) ( not ( = ?auto_739594 ?auto_739610 ) ) ( not ( = ?auto_739595 ?auto_739596 ) ) ( not ( = ?auto_739595 ?auto_739597 ) ) ( not ( = ?auto_739595 ?auto_739598 ) ) ( not ( = ?auto_739595 ?auto_739599 ) ) ( not ( = ?auto_739595 ?auto_739600 ) ) ( not ( = ?auto_739595 ?auto_739601 ) ) ( not ( = ?auto_739595 ?auto_739602 ) ) ( not ( = ?auto_739595 ?auto_739603 ) ) ( not ( = ?auto_739595 ?auto_739604 ) ) ( not ( = ?auto_739595 ?auto_739605 ) ) ( not ( = ?auto_739595 ?auto_739606 ) ) ( not ( = ?auto_739595 ?auto_739607 ) ) ( not ( = ?auto_739595 ?auto_739608 ) ) ( not ( = ?auto_739595 ?auto_739609 ) ) ( not ( = ?auto_739595 ?auto_739610 ) ) ( not ( = ?auto_739596 ?auto_739597 ) ) ( not ( = ?auto_739596 ?auto_739598 ) ) ( not ( = ?auto_739596 ?auto_739599 ) ) ( not ( = ?auto_739596 ?auto_739600 ) ) ( not ( = ?auto_739596 ?auto_739601 ) ) ( not ( = ?auto_739596 ?auto_739602 ) ) ( not ( = ?auto_739596 ?auto_739603 ) ) ( not ( = ?auto_739596 ?auto_739604 ) ) ( not ( = ?auto_739596 ?auto_739605 ) ) ( not ( = ?auto_739596 ?auto_739606 ) ) ( not ( = ?auto_739596 ?auto_739607 ) ) ( not ( = ?auto_739596 ?auto_739608 ) ) ( not ( = ?auto_739596 ?auto_739609 ) ) ( not ( = ?auto_739596 ?auto_739610 ) ) ( not ( = ?auto_739597 ?auto_739598 ) ) ( not ( = ?auto_739597 ?auto_739599 ) ) ( not ( = ?auto_739597 ?auto_739600 ) ) ( not ( = ?auto_739597 ?auto_739601 ) ) ( not ( = ?auto_739597 ?auto_739602 ) ) ( not ( = ?auto_739597 ?auto_739603 ) ) ( not ( = ?auto_739597 ?auto_739604 ) ) ( not ( = ?auto_739597 ?auto_739605 ) ) ( not ( = ?auto_739597 ?auto_739606 ) ) ( not ( = ?auto_739597 ?auto_739607 ) ) ( not ( = ?auto_739597 ?auto_739608 ) ) ( not ( = ?auto_739597 ?auto_739609 ) ) ( not ( = ?auto_739597 ?auto_739610 ) ) ( not ( = ?auto_739598 ?auto_739599 ) ) ( not ( = ?auto_739598 ?auto_739600 ) ) ( not ( = ?auto_739598 ?auto_739601 ) ) ( not ( = ?auto_739598 ?auto_739602 ) ) ( not ( = ?auto_739598 ?auto_739603 ) ) ( not ( = ?auto_739598 ?auto_739604 ) ) ( not ( = ?auto_739598 ?auto_739605 ) ) ( not ( = ?auto_739598 ?auto_739606 ) ) ( not ( = ?auto_739598 ?auto_739607 ) ) ( not ( = ?auto_739598 ?auto_739608 ) ) ( not ( = ?auto_739598 ?auto_739609 ) ) ( not ( = ?auto_739598 ?auto_739610 ) ) ( not ( = ?auto_739599 ?auto_739600 ) ) ( not ( = ?auto_739599 ?auto_739601 ) ) ( not ( = ?auto_739599 ?auto_739602 ) ) ( not ( = ?auto_739599 ?auto_739603 ) ) ( not ( = ?auto_739599 ?auto_739604 ) ) ( not ( = ?auto_739599 ?auto_739605 ) ) ( not ( = ?auto_739599 ?auto_739606 ) ) ( not ( = ?auto_739599 ?auto_739607 ) ) ( not ( = ?auto_739599 ?auto_739608 ) ) ( not ( = ?auto_739599 ?auto_739609 ) ) ( not ( = ?auto_739599 ?auto_739610 ) ) ( not ( = ?auto_739600 ?auto_739601 ) ) ( not ( = ?auto_739600 ?auto_739602 ) ) ( not ( = ?auto_739600 ?auto_739603 ) ) ( not ( = ?auto_739600 ?auto_739604 ) ) ( not ( = ?auto_739600 ?auto_739605 ) ) ( not ( = ?auto_739600 ?auto_739606 ) ) ( not ( = ?auto_739600 ?auto_739607 ) ) ( not ( = ?auto_739600 ?auto_739608 ) ) ( not ( = ?auto_739600 ?auto_739609 ) ) ( not ( = ?auto_739600 ?auto_739610 ) ) ( not ( = ?auto_739601 ?auto_739602 ) ) ( not ( = ?auto_739601 ?auto_739603 ) ) ( not ( = ?auto_739601 ?auto_739604 ) ) ( not ( = ?auto_739601 ?auto_739605 ) ) ( not ( = ?auto_739601 ?auto_739606 ) ) ( not ( = ?auto_739601 ?auto_739607 ) ) ( not ( = ?auto_739601 ?auto_739608 ) ) ( not ( = ?auto_739601 ?auto_739609 ) ) ( not ( = ?auto_739601 ?auto_739610 ) ) ( not ( = ?auto_739602 ?auto_739603 ) ) ( not ( = ?auto_739602 ?auto_739604 ) ) ( not ( = ?auto_739602 ?auto_739605 ) ) ( not ( = ?auto_739602 ?auto_739606 ) ) ( not ( = ?auto_739602 ?auto_739607 ) ) ( not ( = ?auto_739602 ?auto_739608 ) ) ( not ( = ?auto_739602 ?auto_739609 ) ) ( not ( = ?auto_739602 ?auto_739610 ) ) ( not ( = ?auto_739603 ?auto_739604 ) ) ( not ( = ?auto_739603 ?auto_739605 ) ) ( not ( = ?auto_739603 ?auto_739606 ) ) ( not ( = ?auto_739603 ?auto_739607 ) ) ( not ( = ?auto_739603 ?auto_739608 ) ) ( not ( = ?auto_739603 ?auto_739609 ) ) ( not ( = ?auto_739603 ?auto_739610 ) ) ( not ( = ?auto_739604 ?auto_739605 ) ) ( not ( = ?auto_739604 ?auto_739606 ) ) ( not ( = ?auto_739604 ?auto_739607 ) ) ( not ( = ?auto_739604 ?auto_739608 ) ) ( not ( = ?auto_739604 ?auto_739609 ) ) ( not ( = ?auto_739604 ?auto_739610 ) ) ( not ( = ?auto_739605 ?auto_739606 ) ) ( not ( = ?auto_739605 ?auto_739607 ) ) ( not ( = ?auto_739605 ?auto_739608 ) ) ( not ( = ?auto_739605 ?auto_739609 ) ) ( not ( = ?auto_739605 ?auto_739610 ) ) ( not ( = ?auto_739606 ?auto_739607 ) ) ( not ( = ?auto_739606 ?auto_739608 ) ) ( not ( = ?auto_739606 ?auto_739609 ) ) ( not ( = ?auto_739606 ?auto_739610 ) ) ( not ( = ?auto_739607 ?auto_739608 ) ) ( not ( = ?auto_739607 ?auto_739609 ) ) ( not ( = ?auto_739607 ?auto_739610 ) ) ( not ( = ?auto_739608 ?auto_739609 ) ) ( not ( = ?auto_739608 ?auto_739610 ) ) ( not ( = ?auto_739609 ?auto_739610 ) ) ( ON ?auto_739608 ?auto_739609 ) ( ON ?auto_739607 ?auto_739608 ) ( ON ?auto_739606 ?auto_739607 ) ( ON ?auto_739605 ?auto_739606 ) ( ON ?auto_739604 ?auto_739605 ) ( ON ?auto_739603 ?auto_739604 ) ( ON ?auto_739602 ?auto_739603 ) ( ON ?auto_739601 ?auto_739602 ) ( ON ?auto_739600 ?auto_739601 ) ( ON ?auto_739599 ?auto_739600 ) ( ON ?auto_739598 ?auto_739599 ) ( ON ?auto_739597 ?auto_739598 ) ( ON ?auto_739596 ?auto_739597 ) ( ON ?auto_739595 ?auto_739596 ) ( ON ?auto_739594 ?auto_739595 ) ( ON ?auto_739593 ?auto_739594 ) ( CLEAR ?auto_739593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_739593 )
      ( MAKE-17PILE ?auto_739593 ?auto_739594 ?auto_739595 ?auto_739596 ?auto_739597 ?auto_739598 ?auto_739599 ?auto_739600 ?auto_739601 ?auto_739602 ?auto_739603 ?auto_739604 ?auto_739605 ?auto_739606 ?auto_739607 ?auto_739608 ?auto_739609 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739628 - BLOCK
      ?auto_739629 - BLOCK
      ?auto_739630 - BLOCK
      ?auto_739631 - BLOCK
      ?auto_739632 - BLOCK
      ?auto_739633 - BLOCK
      ?auto_739634 - BLOCK
      ?auto_739635 - BLOCK
      ?auto_739636 - BLOCK
      ?auto_739637 - BLOCK
      ?auto_739638 - BLOCK
      ?auto_739639 - BLOCK
      ?auto_739640 - BLOCK
      ?auto_739641 - BLOCK
      ?auto_739642 - BLOCK
      ?auto_739643 - BLOCK
      ?auto_739644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_739644 ) ( not ( = ?auto_739628 ?auto_739629 ) ) ( not ( = ?auto_739628 ?auto_739630 ) ) ( not ( = ?auto_739628 ?auto_739631 ) ) ( not ( = ?auto_739628 ?auto_739632 ) ) ( not ( = ?auto_739628 ?auto_739633 ) ) ( not ( = ?auto_739628 ?auto_739634 ) ) ( not ( = ?auto_739628 ?auto_739635 ) ) ( not ( = ?auto_739628 ?auto_739636 ) ) ( not ( = ?auto_739628 ?auto_739637 ) ) ( not ( = ?auto_739628 ?auto_739638 ) ) ( not ( = ?auto_739628 ?auto_739639 ) ) ( not ( = ?auto_739628 ?auto_739640 ) ) ( not ( = ?auto_739628 ?auto_739641 ) ) ( not ( = ?auto_739628 ?auto_739642 ) ) ( not ( = ?auto_739628 ?auto_739643 ) ) ( not ( = ?auto_739628 ?auto_739644 ) ) ( not ( = ?auto_739629 ?auto_739630 ) ) ( not ( = ?auto_739629 ?auto_739631 ) ) ( not ( = ?auto_739629 ?auto_739632 ) ) ( not ( = ?auto_739629 ?auto_739633 ) ) ( not ( = ?auto_739629 ?auto_739634 ) ) ( not ( = ?auto_739629 ?auto_739635 ) ) ( not ( = ?auto_739629 ?auto_739636 ) ) ( not ( = ?auto_739629 ?auto_739637 ) ) ( not ( = ?auto_739629 ?auto_739638 ) ) ( not ( = ?auto_739629 ?auto_739639 ) ) ( not ( = ?auto_739629 ?auto_739640 ) ) ( not ( = ?auto_739629 ?auto_739641 ) ) ( not ( = ?auto_739629 ?auto_739642 ) ) ( not ( = ?auto_739629 ?auto_739643 ) ) ( not ( = ?auto_739629 ?auto_739644 ) ) ( not ( = ?auto_739630 ?auto_739631 ) ) ( not ( = ?auto_739630 ?auto_739632 ) ) ( not ( = ?auto_739630 ?auto_739633 ) ) ( not ( = ?auto_739630 ?auto_739634 ) ) ( not ( = ?auto_739630 ?auto_739635 ) ) ( not ( = ?auto_739630 ?auto_739636 ) ) ( not ( = ?auto_739630 ?auto_739637 ) ) ( not ( = ?auto_739630 ?auto_739638 ) ) ( not ( = ?auto_739630 ?auto_739639 ) ) ( not ( = ?auto_739630 ?auto_739640 ) ) ( not ( = ?auto_739630 ?auto_739641 ) ) ( not ( = ?auto_739630 ?auto_739642 ) ) ( not ( = ?auto_739630 ?auto_739643 ) ) ( not ( = ?auto_739630 ?auto_739644 ) ) ( not ( = ?auto_739631 ?auto_739632 ) ) ( not ( = ?auto_739631 ?auto_739633 ) ) ( not ( = ?auto_739631 ?auto_739634 ) ) ( not ( = ?auto_739631 ?auto_739635 ) ) ( not ( = ?auto_739631 ?auto_739636 ) ) ( not ( = ?auto_739631 ?auto_739637 ) ) ( not ( = ?auto_739631 ?auto_739638 ) ) ( not ( = ?auto_739631 ?auto_739639 ) ) ( not ( = ?auto_739631 ?auto_739640 ) ) ( not ( = ?auto_739631 ?auto_739641 ) ) ( not ( = ?auto_739631 ?auto_739642 ) ) ( not ( = ?auto_739631 ?auto_739643 ) ) ( not ( = ?auto_739631 ?auto_739644 ) ) ( not ( = ?auto_739632 ?auto_739633 ) ) ( not ( = ?auto_739632 ?auto_739634 ) ) ( not ( = ?auto_739632 ?auto_739635 ) ) ( not ( = ?auto_739632 ?auto_739636 ) ) ( not ( = ?auto_739632 ?auto_739637 ) ) ( not ( = ?auto_739632 ?auto_739638 ) ) ( not ( = ?auto_739632 ?auto_739639 ) ) ( not ( = ?auto_739632 ?auto_739640 ) ) ( not ( = ?auto_739632 ?auto_739641 ) ) ( not ( = ?auto_739632 ?auto_739642 ) ) ( not ( = ?auto_739632 ?auto_739643 ) ) ( not ( = ?auto_739632 ?auto_739644 ) ) ( not ( = ?auto_739633 ?auto_739634 ) ) ( not ( = ?auto_739633 ?auto_739635 ) ) ( not ( = ?auto_739633 ?auto_739636 ) ) ( not ( = ?auto_739633 ?auto_739637 ) ) ( not ( = ?auto_739633 ?auto_739638 ) ) ( not ( = ?auto_739633 ?auto_739639 ) ) ( not ( = ?auto_739633 ?auto_739640 ) ) ( not ( = ?auto_739633 ?auto_739641 ) ) ( not ( = ?auto_739633 ?auto_739642 ) ) ( not ( = ?auto_739633 ?auto_739643 ) ) ( not ( = ?auto_739633 ?auto_739644 ) ) ( not ( = ?auto_739634 ?auto_739635 ) ) ( not ( = ?auto_739634 ?auto_739636 ) ) ( not ( = ?auto_739634 ?auto_739637 ) ) ( not ( = ?auto_739634 ?auto_739638 ) ) ( not ( = ?auto_739634 ?auto_739639 ) ) ( not ( = ?auto_739634 ?auto_739640 ) ) ( not ( = ?auto_739634 ?auto_739641 ) ) ( not ( = ?auto_739634 ?auto_739642 ) ) ( not ( = ?auto_739634 ?auto_739643 ) ) ( not ( = ?auto_739634 ?auto_739644 ) ) ( not ( = ?auto_739635 ?auto_739636 ) ) ( not ( = ?auto_739635 ?auto_739637 ) ) ( not ( = ?auto_739635 ?auto_739638 ) ) ( not ( = ?auto_739635 ?auto_739639 ) ) ( not ( = ?auto_739635 ?auto_739640 ) ) ( not ( = ?auto_739635 ?auto_739641 ) ) ( not ( = ?auto_739635 ?auto_739642 ) ) ( not ( = ?auto_739635 ?auto_739643 ) ) ( not ( = ?auto_739635 ?auto_739644 ) ) ( not ( = ?auto_739636 ?auto_739637 ) ) ( not ( = ?auto_739636 ?auto_739638 ) ) ( not ( = ?auto_739636 ?auto_739639 ) ) ( not ( = ?auto_739636 ?auto_739640 ) ) ( not ( = ?auto_739636 ?auto_739641 ) ) ( not ( = ?auto_739636 ?auto_739642 ) ) ( not ( = ?auto_739636 ?auto_739643 ) ) ( not ( = ?auto_739636 ?auto_739644 ) ) ( not ( = ?auto_739637 ?auto_739638 ) ) ( not ( = ?auto_739637 ?auto_739639 ) ) ( not ( = ?auto_739637 ?auto_739640 ) ) ( not ( = ?auto_739637 ?auto_739641 ) ) ( not ( = ?auto_739637 ?auto_739642 ) ) ( not ( = ?auto_739637 ?auto_739643 ) ) ( not ( = ?auto_739637 ?auto_739644 ) ) ( not ( = ?auto_739638 ?auto_739639 ) ) ( not ( = ?auto_739638 ?auto_739640 ) ) ( not ( = ?auto_739638 ?auto_739641 ) ) ( not ( = ?auto_739638 ?auto_739642 ) ) ( not ( = ?auto_739638 ?auto_739643 ) ) ( not ( = ?auto_739638 ?auto_739644 ) ) ( not ( = ?auto_739639 ?auto_739640 ) ) ( not ( = ?auto_739639 ?auto_739641 ) ) ( not ( = ?auto_739639 ?auto_739642 ) ) ( not ( = ?auto_739639 ?auto_739643 ) ) ( not ( = ?auto_739639 ?auto_739644 ) ) ( not ( = ?auto_739640 ?auto_739641 ) ) ( not ( = ?auto_739640 ?auto_739642 ) ) ( not ( = ?auto_739640 ?auto_739643 ) ) ( not ( = ?auto_739640 ?auto_739644 ) ) ( not ( = ?auto_739641 ?auto_739642 ) ) ( not ( = ?auto_739641 ?auto_739643 ) ) ( not ( = ?auto_739641 ?auto_739644 ) ) ( not ( = ?auto_739642 ?auto_739643 ) ) ( not ( = ?auto_739642 ?auto_739644 ) ) ( not ( = ?auto_739643 ?auto_739644 ) ) ( ON ?auto_739643 ?auto_739644 ) ( ON ?auto_739642 ?auto_739643 ) ( ON ?auto_739641 ?auto_739642 ) ( ON ?auto_739640 ?auto_739641 ) ( ON ?auto_739639 ?auto_739640 ) ( ON ?auto_739638 ?auto_739639 ) ( ON ?auto_739637 ?auto_739638 ) ( ON ?auto_739636 ?auto_739637 ) ( ON ?auto_739635 ?auto_739636 ) ( ON ?auto_739634 ?auto_739635 ) ( ON ?auto_739633 ?auto_739634 ) ( ON ?auto_739632 ?auto_739633 ) ( ON ?auto_739631 ?auto_739632 ) ( ON ?auto_739630 ?auto_739631 ) ( ON ?auto_739629 ?auto_739630 ) ( ON ?auto_739628 ?auto_739629 ) ( CLEAR ?auto_739628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_739628 )
      ( MAKE-17PILE ?auto_739628 ?auto_739629 ?auto_739630 ?auto_739631 ?auto_739632 ?auto_739633 ?auto_739634 ?auto_739635 ?auto_739636 ?auto_739637 ?auto_739638 ?auto_739639 ?auto_739640 ?auto_739641 ?auto_739642 ?auto_739643 ?auto_739644 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_739662 - BLOCK
      ?auto_739663 - BLOCK
      ?auto_739664 - BLOCK
      ?auto_739665 - BLOCK
      ?auto_739666 - BLOCK
      ?auto_739667 - BLOCK
      ?auto_739668 - BLOCK
      ?auto_739669 - BLOCK
      ?auto_739670 - BLOCK
      ?auto_739671 - BLOCK
      ?auto_739672 - BLOCK
      ?auto_739673 - BLOCK
      ?auto_739674 - BLOCK
      ?auto_739675 - BLOCK
      ?auto_739676 - BLOCK
      ?auto_739677 - BLOCK
      ?auto_739678 - BLOCK
    )
    :vars
    (
      ?auto_739679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_739662 ?auto_739663 ) ) ( not ( = ?auto_739662 ?auto_739664 ) ) ( not ( = ?auto_739662 ?auto_739665 ) ) ( not ( = ?auto_739662 ?auto_739666 ) ) ( not ( = ?auto_739662 ?auto_739667 ) ) ( not ( = ?auto_739662 ?auto_739668 ) ) ( not ( = ?auto_739662 ?auto_739669 ) ) ( not ( = ?auto_739662 ?auto_739670 ) ) ( not ( = ?auto_739662 ?auto_739671 ) ) ( not ( = ?auto_739662 ?auto_739672 ) ) ( not ( = ?auto_739662 ?auto_739673 ) ) ( not ( = ?auto_739662 ?auto_739674 ) ) ( not ( = ?auto_739662 ?auto_739675 ) ) ( not ( = ?auto_739662 ?auto_739676 ) ) ( not ( = ?auto_739662 ?auto_739677 ) ) ( not ( = ?auto_739662 ?auto_739678 ) ) ( not ( = ?auto_739663 ?auto_739664 ) ) ( not ( = ?auto_739663 ?auto_739665 ) ) ( not ( = ?auto_739663 ?auto_739666 ) ) ( not ( = ?auto_739663 ?auto_739667 ) ) ( not ( = ?auto_739663 ?auto_739668 ) ) ( not ( = ?auto_739663 ?auto_739669 ) ) ( not ( = ?auto_739663 ?auto_739670 ) ) ( not ( = ?auto_739663 ?auto_739671 ) ) ( not ( = ?auto_739663 ?auto_739672 ) ) ( not ( = ?auto_739663 ?auto_739673 ) ) ( not ( = ?auto_739663 ?auto_739674 ) ) ( not ( = ?auto_739663 ?auto_739675 ) ) ( not ( = ?auto_739663 ?auto_739676 ) ) ( not ( = ?auto_739663 ?auto_739677 ) ) ( not ( = ?auto_739663 ?auto_739678 ) ) ( not ( = ?auto_739664 ?auto_739665 ) ) ( not ( = ?auto_739664 ?auto_739666 ) ) ( not ( = ?auto_739664 ?auto_739667 ) ) ( not ( = ?auto_739664 ?auto_739668 ) ) ( not ( = ?auto_739664 ?auto_739669 ) ) ( not ( = ?auto_739664 ?auto_739670 ) ) ( not ( = ?auto_739664 ?auto_739671 ) ) ( not ( = ?auto_739664 ?auto_739672 ) ) ( not ( = ?auto_739664 ?auto_739673 ) ) ( not ( = ?auto_739664 ?auto_739674 ) ) ( not ( = ?auto_739664 ?auto_739675 ) ) ( not ( = ?auto_739664 ?auto_739676 ) ) ( not ( = ?auto_739664 ?auto_739677 ) ) ( not ( = ?auto_739664 ?auto_739678 ) ) ( not ( = ?auto_739665 ?auto_739666 ) ) ( not ( = ?auto_739665 ?auto_739667 ) ) ( not ( = ?auto_739665 ?auto_739668 ) ) ( not ( = ?auto_739665 ?auto_739669 ) ) ( not ( = ?auto_739665 ?auto_739670 ) ) ( not ( = ?auto_739665 ?auto_739671 ) ) ( not ( = ?auto_739665 ?auto_739672 ) ) ( not ( = ?auto_739665 ?auto_739673 ) ) ( not ( = ?auto_739665 ?auto_739674 ) ) ( not ( = ?auto_739665 ?auto_739675 ) ) ( not ( = ?auto_739665 ?auto_739676 ) ) ( not ( = ?auto_739665 ?auto_739677 ) ) ( not ( = ?auto_739665 ?auto_739678 ) ) ( not ( = ?auto_739666 ?auto_739667 ) ) ( not ( = ?auto_739666 ?auto_739668 ) ) ( not ( = ?auto_739666 ?auto_739669 ) ) ( not ( = ?auto_739666 ?auto_739670 ) ) ( not ( = ?auto_739666 ?auto_739671 ) ) ( not ( = ?auto_739666 ?auto_739672 ) ) ( not ( = ?auto_739666 ?auto_739673 ) ) ( not ( = ?auto_739666 ?auto_739674 ) ) ( not ( = ?auto_739666 ?auto_739675 ) ) ( not ( = ?auto_739666 ?auto_739676 ) ) ( not ( = ?auto_739666 ?auto_739677 ) ) ( not ( = ?auto_739666 ?auto_739678 ) ) ( not ( = ?auto_739667 ?auto_739668 ) ) ( not ( = ?auto_739667 ?auto_739669 ) ) ( not ( = ?auto_739667 ?auto_739670 ) ) ( not ( = ?auto_739667 ?auto_739671 ) ) ( not ( = ?auto_739667 ?auto_739672 ) ) ( not ( = ?auto_739667 ?auto_739673 ) ) ( not ( = ?auto_739667 ?auto_739674 ) ) ( not ( = ?auto_739667 ?auto_739675 ) ) ( not ( = ?auto_739667 ?auto_739676 ) ) ( not ( = ?auto_739667 ?auto_739677 ) ) ( not ( = ?auto_739667 ?auto_739678 ) ) ( not ( = ?auto_739668 ?auto_739669 ) ) ( not ( = ?auto_739668 ?auto_739670 ) ) ( not ( = ?auto_739668 ?auto_739671 ) ) ( not ( = ?auto_739668 ?auto_739672 ) ) ( not ( = ?auto_739668 ?auto_739673 ) ) ( not ( = ?auto_739668 ?auto_739674 ) ) ( not ( = ?auto_739668 ?auto_739675 ) ) ( not ( = ?auto_739668 ?auto_739676 ) ) ( not ( = ?auto_739668 ?auto_739677 ) ) ( not ( = ?auto_739668 ?auto_739678 ) ) ( not ( = ?auto_739669 ?auto_739670 ) ) ( not ( = ?auto_739669 ?auto_739671 ) ) ( not ( = ?auto_739669 ?auto_739672 ) ) ( not ( = ?auto_739669 ?auto_739673 ) ) ( not ( = ?auto_739669 ?auto_739674 ) ) ( not ( = ?auto_739669 ?auto_739675 ) ) ( not ( = ?auto_739669 ?auto_739676 ) ) ( not ( = ?auto_739669 ?auto_739677 ) ) ( not ( = ?auto_739669 ?auto_739678 ) ) ( not ( = ?auto_739670 ?auto_739671 ) ) ( not ( = ?auto_739670 ?auto_739672 ) ) ( not ( = ?auto_739670 ?auto_739673 ) ) ( not ( = ?auto_739670 ?auto_739674 ) ) ( not ( = ?auto_739670 ?auto_739675 ) ) ( not ( = ?auto_739670 ?auto_739676 ) ) ( not ( = ?auto_739670 ?auto_739677 ) ) ( not ( = ?auto_739670 ?auto_739678 ) ) ( not ( = ?auto_739671 ?auto_739672 ) ) ( not ( = ?auto_739671 ?auto_739673 ) ) ( not ( = ?auto_739671 ?auto_739674 ) ) ( not ( = ?auto_739671 ?auto_739675 ) ) ( not ( = ?auto_739671 ?auto_739676 ) ) ( not ( = ?auto_739671 ?auto_739677 ) ) ( not ( = ?auto_739671 ?auto_739678 ) ) ( not ( = ?auto_739672 ?auto_739673 ) ) ( not ( = ?auto_739672 ?auto_739674 ) ) ( not ( = ?auto_739672 ?auto_739675 ) ) ( not ( = ?auto_739672 ?auto_739676 ) ) ( not ( = ?auto_739672 ?auto_739677 ) ) ( not ( = ?auto_739672 ?auto_739678 ) ) ( not ( = ?auto_739673 ?auto_739674 ) ) ( not ( = ?auto_739673 ?auto_739675 ) ) ( not ( = ?auto_739673 ?auto_739676 ) ) ( not ( = ?auto_739673 ?auto_739677 ) ) ( not ( = ?auto_739673 ?auto_739678 ) ) ( not ( = ?auto_739674 ?auto_739675 ) ) ( not ( = ?auto_739674 ?auto_739676 ) ) ( not ( = ?auto_739674 ?auto_739677 ) ) ( not ( = ?auto_739674 ?auto_739678 ) ) ( not ( = ?auto_739675 ?auto_739676 ) ) ( not ( = ?auto_739675 ?auto_739677 ) ) ( not ( = ?auto_739675 ?auto_739678 ) ) ( not ( = ?auto_739676 ?auto_739677 ) ) ( not ( = ?auto_739676 ?auto_739678 ) ) ( not ( = ?auto_739677 ?auto_739678 ) ) ( ON ?auto_739662 ?auto_739679 ) ( not ( = ?auto_739678 ?auto_739679 ) ) ( not ( = ?auto_739677 ?auto_739679 ) ) ( not ( = ?auto_739676 ?auto_739679 ) ) ( not ( = ?auto_739675 ?auto_739679 ) ) ( not ( = ?auto_739674 ?auto_739679 ) ) ( not ( = ?auto_739673 ?auto_739679 ) ) ( not ( = ?auto_739672 ?auto_739679 ) ) ( not ( = ?auto_739671 ?auto_739679 ) ) ( not ( = ?auto_739670 ?auto_739679 ) ) ( not ( = ?auto_739669 ?auto_739679 ) ) ( not ( = ?auto_739668 ?auto_739679 ) ) ( not ( = ?auto_739667 ?auto_739679 ) ) ( not ( = ?auto_739666 ?auto_739679 ) ) ( not ( = ?auto_739665 ?auto_739679 ) ) ( not ( = ?auto_739664 ?auto_739679 ) ) ( not ( = ?auto_739663 ?auto_739679 ) ) ( not ( = ?auto_739662 ?auto_739679 ) ) ( ON ?auto_739663 ?auto_739662 ) ( ON ?auto_739664 ?auto_739663 ) ( ON ?auto_739665 ?auto_739664 ) ( ON ?auto_739666 ?auto_739665 ) ( ON ?auto_739667 ?auto_739666 ) ( ON ?auto_739668 ?auto_739667 ) ( ON ?auto_739669 ?auto_739668 ) ( ON ?auto_739670 ?auto_739669 ) ( ON ?auto_739671 ?auto_739670 ) ( ON ?auto_739672 ?auto_739671 ) ( ON ?auto_739673 ?auto_739672 ) ( ON ?auto_739674 ?auto_739673 ) ( ON ?auto_739675 ?auto_739674 ) ( ON ?auto_739676 ?auto_739675 ) ( ON ?auto_739677 ?auto_739676 ) ( ON ?auto_739678 ?auto_739677 ) ( CLEAR ?auto_739678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_739678 ?auto_739677 ?auto_739676 ?auto_739675 ?auto_739674 ?auto_739673 ?auto_739672 ?auto_739671 ?auto_739670 ?auto_739669 ?auto_739668 ?auto_739667 ?auto_739666 ?auto_739665 ?auto_739664 ?auto_739663 ?auto_739662 )
      ( MAKE-17PILE ?auto_739662 ?auto_739663 ?auto_739664 ?auto_739665 ?auto_739666 ?auto_739667 ?auto_739668 ?auto_739669 ?auto_739670 ?auto_739671 ?auto_739672 ?auto_739673 ?auto_739674 ?auto_739675 ?auto_739676 ?auto_739677 ?auto_739678 ) )
  )

)

