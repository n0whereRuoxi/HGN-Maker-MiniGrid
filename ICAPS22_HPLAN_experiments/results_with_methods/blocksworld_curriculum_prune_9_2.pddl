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

