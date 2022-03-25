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
      ?auto_471214 - BLOCK
    )
    :vars
    (
      ?auto_471215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471214 ?auto_471215 ) ( CLEAR ?auto_471214 ) ( HAND-EMPTY ) ( not ( = ?auto_471214 ?auto_471215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471214 ?auto_471215 )
      ( !PUTDOWN ?auto_471214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_471221 - BLOCK
      ?auto_471222 - BLOCK
    )
    :vars
    (
      ?auto_471223 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471221 ) ( ON ?auto_471222 ?auto_471223 ) ( CLEAR ?auto_471222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471221 ) ( not ( = ?auto_471221 ?auto_471222 ) ) ( not ( = ?auto_471221 ?auto_471223 ) ) ( not ( = ?auto_471222 ?auto_471223 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471222 ?auto_471223 )
      ( !STACK ?auto_471222 ?auto_471221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_471231 - BLOCK
      ?auto_471232 - BLOCK
    )
    :vars
    (
      ?auto_471233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471232 ?auto_471233 ) ( not ( = ?auto_471231 ?auto_471232 ) ) ( not ( = ?auto_471231 ?auto_471233 ) ) ( not ( = ?auto_471232 ?auto_471233 ) ) ( ON ?auto_471231 ?auto_471232 ) ( CLEAR ?auto_471231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471231 )
      ( MAKE-2PILE ?auto_471231 ?auto_471232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_471242 - BLOCK
      ?auto_471243 - BLOCK
      ?auto_471244 - BLOCK
    )
    :vars
    (
      ?auto_471245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471243 ) ( ON ?auto_471244 ?auto_471245 ) ( CLEAR ?auto_471244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471242 ) ( ON ?auto_471243 ?auto_471242 ) ( not ( = ?auto_471242 ?auto_471243 ) ) ( not ( = ?auto_471242 ?auto_471244 ) ) ( not ( = ?auto_471242 ?auto_471245 ) ) ( not ( = ?auto_471243 ?auto_471244 ) ) ( not ( = ?auto_471243 ?auto_471245 ) ) ( not ( = ?auto_471244 ?auto_471245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471244 ?auto_471245 )
      ( !STACK ?auto_471244 ?auto_471243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_471256 - BLOCK
      ?auto_471257 - BLOCK
      ?auto_471258 - BLOCK
    )
    :vars
    (
      ?auto_471259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471258 ?auto_471259 ) ( ON-TABLE ?auto_471256 ) ( not ( = ?auto_471256 ?auto_471257 ) ) ( not ( = ?auto_471256 ?auto_471258 ) ) ( not ( = ?auto_471256 ?auto_471259 ) ) ( not ( = ?auto_471257 ?auto_471258 ) ) ( not ( = ?auto_471257 ?auto_471259 ) ) ( not ( = ?auto_471258 ?auto_471259 ) ) ( CLEAR ?auto_471256 ) ( ON ?auto_471257 ?auto_471258 ) ( CLEAR ?auto_471257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471256 ?auto_471257 )
      ( MAKE-3PILE ?auto_471256 ?auto_471257 ?auto_471258 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_471270 - BLOCK
      ?auto_471271 - BLOCK
      ?auto_471272 - BLOCK
    )
    :vars
    (
      ?auto_471273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471272 ?auto_471273 ) ( not ( = ?auto_471270 ?auto_471271 ) ) ( not ( = ?auto_471270 ?auto_471272 ) ) ( not ( = ?auto_471270 ?auto_471273 ) ) ( not ( = ?auto_471271 ?auto_471272 ) ) ( not ( = ?auto_471271 ?auto_471273 ) ) ( not ( = ?auto_471272 ?auto_471273 ) ) ( ON ?auto_471271 ?auto_471272 ) ( ON ?auto_471270 ?auto_471271 ) ( CLEAR ?auto_471270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471270 )
      ( MAKE-3PILE ?auto_471270 ?auto_471271 ?auto_471272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_471285 - BLOCK
      ?auto_471286 - BLOCK
      ?auto_471287 - BLOCK
      ?auto_471288 - BLOCK
    )
    :vars
    (
      ?auto_471289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471287 ) ( ON ?auto_471288 ?auto_471289 ) ( CLEAR ?auto_471288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471285 ) ( ON ?auto_471286 ?auto_471285 ) ( ON ?auto_471287 ?auto_471286 ) ( not ( = ?auto_471285 ?auto_471286 ) ) ( not ( = ?auto_471285 ?auto_471287 ) ) ( not ( = ?auto_471285 ?auto_471288 ) ) ( not ( = ?auto_471285 ?auto_471289 ) ) ( not ( = ?auto_471286 ?auto_471287 ) ) ( not ( = ?auto_471286 ?auto_471288 ) ) ( not ( = ?auto_471286 ?auto_471289 ) ) ( not ( = ?auto_471287 ?auto_471288 ) ) ( not ( = ?auto_471287 ?auto_471289 ) ) ( not ( = ?auto_471288 ?auto_471289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471288 ?auto_471289 )
      ( !STACK ?auto_471288 ?auto_471287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_471303 - BLOCK
      ?auto_471304 - BLOCK
      ?auto_471305 - BLOCK
      ?auto_471306 - BLOCK
    )
    :vars
    (
      ?auto_471307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471306 ?auto_471307 ) ( ON-TABLE ?auto_471303 ) ( ON ?auto_471304 ?auto_471303 ) ( not ( = ?auto_471303 ?auto_471304 ) ) ( not ( = ?auto_471303 ?auto_471305 ) ) ( not ( = ?auto_471303 ?auto_471306 ) ) ( not ( = ?auto_471303 ?auto_471307 ) ) ( not ( = ?auto_471304 ?auto_471305 ) ) ( not ( = ?auto_471304 ?auto_471306 ) ) ( not ( = ?auto_471304 ?auto_471307 ) ) ( not ( = ?auto_471305 ?auto_471306 ) ) ( not ( = ?auto_471305 ?auto_471307 ) ) ( not ( = ?auto_471306 ?auto_471307 ) ) ( CLEAR ?auto_471304 ) ( ON ?auto_471305 ?auto_471306 ) ( CLEAR ?auto_471305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_471303 ?auto_471304 ?auto_471305 )
      ( MAKE-4PILE ?auto_471303 ?auto_471304 ?auto_471305 ?auto_471306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_471321 - BLOCK
      ?auto_471322 - BLOCK
      ?auto_471323 - BLOCK
      ?auto_471324 - BLOCK
    )
    :vars
    (
      ?auto_471325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471324 ?auto_471325 ) ( ON-TABLE ?auto_471321 ) ( not ( = ?auto_471321 ?auto_471322 ) ) ( not ( = ?auto_471321 ?auto_471323 ) ) ( not ( = ?auto_471321 ?auto_471324 ) ) ( not ( = ?auto_471321 ?auto_471325 ) ) ( not ( = ?auto_471322 ?auto_471323 ) ) ( not ( = ?auto_471322 ?auto_471324 ) ) ( not ( = ?auto_471322 ?auto_471325 ) ) ( not ( = ?auto_471323 ?auto_471324 ) ) ( not ( = ?auto_471323 ?auto_471325 ) ) ( not ( = ?auto_471324 ?auto_471325 ) ) ( ON ?auto_471323 ?auto_471324 ) ( CLEAR ?auto_471321 ) ( ON ?auto_471322 ?auto_471323 ) ( CLEAR ?auto_471322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471321 ?auto_471322 )
      ( MAKE-4PILE ?auto_471321 ?auto_471322 ?auto_471323 ?auto_471324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_471339 - BLOCK
      ?auto_471340 - BLOCK
      ?auto_471341 - BLOCK
      ?auto_471342 - BLOCK
    )
    :vars
    (
      ?auto_471343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471342 ?auto_471343 ) ( not ( = ?auto_471339 ?auto_471340 ) ) ( not ( = ?auto_471339 ?auto_471341 ) ) ( not ( = ?auto_471339 ?auto_471342 ) ) ( not ( = ?auto_471339 ?auto_471343 ) ) ( not ( = ?auto_471340 ?auto_471341 ) ) ( not ( = ?auto_471340 ?auto_471342 ) ) ( not ( = ?auto_471340 ?auto_471343 ) ) ( not ( = ?auto_471341 ?auto_471342 ) ) ( not ( = ?auto_471341 ?auto_471343 ) ) ( not ( = ?auto_471342 ?auto_471343 ) ) ( ON ?auto_471341 ?auto_471342 ) ( ON ?auto_471340 ?auto_471341 ) ( ON ?auto_471339 ?auto_471340 ) ( CLEAR ?auto_471339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471339 )
      ( MAKE-4PILE ?auto_471339 ?auto_471340 ?auto_471341 ?auto_471342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_471358 - BLOCK
      ?auto_471359 - BLOCK
      ?auto_471360 - BLOCK
      ?auto_471361 - BLOCK
      ?auto_471362 - BLOCK
    )
    :vars
    (
      ?auto_471363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471361 ) ( ON ?auto_471362 ?auto_471363 ) ( CLEAR ?auto_471362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471358 ) ( ON ?auto_471359 ?auto_471358 ) ( ON ?auto_471360 ?auto_471359 ) ( ON ?auto_471361 ?auto_471360 ) ( not ( = ?auto_471358 ?auto_471359 ) ) ( not ( = ?auto_471358 ?auto_471360 ) ) ( not ( = ?auto_471358 ?auto_471361 ) ) ( not ( = ?auto_471358 ?auto_471362 ) ) ( not ( = ?auto_471358 ?auto_471363 ) ) ( not ( = ?auto_471359 ?auto_471360 ) ) ( not ( = ?auto_471359 ?auto_471361 ) ) ( not ( = ?auto_471359 ?auto_471362 ) ) ( not ( = ?auto_471359 ?auto_471363 ) ) ( not ( = ?auto_471360 ?auto_471361 ) ) ( not ( = ?auto_471360 ?auto_471362 ) ) ( not ( = ?auto_471360 ?auto_471363 ) ) ( not ( = ?auto_471361 ?auto_471362 ) ) ( not ( = ?auto_471361 ?auto_471363 ) ) ( not ( = ?auto_471362 ?auto_471363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471362 ?auto_471363 )
      ( !STACK ?auto_471362 ?auto_471361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_471380 - BLOCK
      ?auto_471381 - BLOCK
      ?auto_471382 - BLOCK
      ?auto_471383 - BLOCK
      ?auto_471384 - BLOCK
    )
    :vars
    (
      ?auto_471385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471384 ?auto_471385 ) ( ON-TABLE ?auto_471380 ) ( ON ?auto_471381 ?auto_471380 ) ( ON ?auto_471382 ?auto_471381 ) ( not ( = ?auto_471380 ?auto_471381 ) ) ( not ( = ?auto_471380 ?auto_471382 ) ) ( not ( = ?auto_471380 ?auto_471383 ) ) ( not ( = ?auto_471380 ?auto_471384 ) ) ( not ( = ?auto_471380 ?auto_471385 ) ) ( not ( = ?auto_471381 ?auto_471382 ) ) ( not ( = ?auto_471381 ?auto_471383 ) ) ( not ( = ?auto_471381 ?auto_471384 ) ) ( not ( = ?auto_471381 ?auto_471385 ) ) ( not ( = ?auto_471382 ?auto_471383 ) ) ( not ( = ?auto_471382 ?auto_471384 ) ) ( not ( = ?auto_471382 ?auto_471385 ) ) ( not ( = ?auto_471383 ?auto_471384 ) ) ( not ( = ?auto_471383 ?auto_471385 ) ) ( not ( = ?auto_471384 ?auto_471385 ) ) ( CLEAR ?auto_471382 ) ( ON ?auto_471383 ?auto_471384 ) ( CLEAR ?auto_471383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_471380 ?auto_471381 ?auto_471382 ?auto_471383 )
      ( MAKE-5PILE ?auto_471380 ?auto_471381 ?auto_471382 ?auto_471383 ?auto_471384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_471402 - BLOCK
      ?auto_471403 - BLOCK
      ?auto_471404 - BLOCK
      ?auto_471405 - BLOCK
      ?auto_471406 - BLOCK
    )
    :vars
    (
      ?auto_471407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471406 ?auto_471407 ) ( ON-TABLE ?auto_471402 ) ( ON ?auto_471403 ?auto_471402 ) ( not ( = ?auto_471402 ?auto_471403 ) ) ( not ( = ?auto_471402 ?auto_471404 ) ) ( not ( = ?auto_471402 ?auto_471405 ) ) ( not ( = ?auto_471402 ?auto_471406 ) ) ( not ( = ?auto_471402 ?auto_471407 ) ) ( not ( = ?auto_471403 ?auto_471404 ) ) ( not ( = ?auto_471403 ?auto_471405 ) ) ( not ( = ?auto_471403 ?auto_471406 ) ) ( not ( = ?auto_471403 ?auto_471407 ) ) ( not ( = ?auto_471404 ?auto_471405 ) ) ( not ( = ?auto_471404 ?auto_471406 ) ) ( not ( = ?auto_471404 ?auto_471407 ) ) ( not ( = ?auto_471405 ?auto_471406 ) ) ( not ( = ?auto_471405 ?auto_471407 ) ) ( not ( = ?auto_471406 ?auto_471407 ) ) ( ON ?auto_471405 ?auto_471406 ) ( CLEAR ?auto_471403 ) ( ON ?auto_471404 ?auto_471405 ) ( CLEAR ?auto_471404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_471402 ?auto_471403 ?auto_471404 )
      ( MAKE-5PILE ?auto_471402 ?auto_471403 ?auto_471404 ?auto_471405 ?auto_471406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_471424 - BLOCK
      ?auto_471425 - BLOCK
      ?auto_471426 - BLOCK
      ?auto_471427 - BLOCK
      ?auto_471428 - BLOCK
    )
    :vars
    (
      ?auto_471429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471428 ?auto_471429 ) ( ON-TABLE ?auto_471424 ) ( not ( = ?auto_471424 ?auto_471425 ) ) ( not ( = ?auto_471424 ?auto_471426 ) ) ( not ( = ?auto_471424 ?auto_471427 ) ) ( not ( = ?auto_471424 ?auto_471428 ) ) ( not ( = ?auto_471424 ?auto_471429 ) ) ( not ( = ?auto_471425 ?auto_471426 ) ) ( not ( = ?auto_471425 ?auto_471427 ) ) ( not ( = ?auto_471425 ?auto_471428 ) ) ( not ( = ?auto_471425 ?auto_471429 ) ) ( not ( = ?auto_471426 ?auto_471427 ) ) ( not ( = ?auto_471426 ?auto_471428 ) ) ( not ( = ?auto_471426 ?auto_471429 ) ) ( not ( = ?auto_471427 ?auto_471428 ) ) ( not ( = ?auto_471427 ?auto_471429 ) ) ( not ( = ?auto_471428 ?auto_471429 ) ) ( ON ?auto_471427 ?auto_471428 ) ( ON ?auto_471426 ?auto_471427 ) ( CLEAR ?auto_471424 ) ( ON ?auto_471425 ?auto_471426 ) ( CLEAR ?auto_471425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471424 ?auto_471425 )
      ( MAKE-5PILE ?auto_471424 ?auto_471425 ?auto_471426 ?auto_471427 ?auto_471428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_471446 - BLOCK
      ?auto_471447 - BLOCK
      ?auto_471448 - BLOCK
      ?auto_471449 - BLOCK
      ?auto_471450 - BLOCK
    )
    :vars
    (
      ?auto_471451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471450 ?auto_471451 ) ( not ( = ?auto_471446 ?auto_471447 ) ) ( not ( = ?auto_471446 ?auto_471448 ) ) ( not ( = ?auto_471446 ?auto_471449 ) ) ( not ( = ?auto_471446 ?auto_471450 ) ) ( not ( = ?auto_471446 ?auto_471451 ) ) ( not ( = ?auto_471447 ?auto_471448 ) ) ( not ( = ?auto_471447 ?auto_471449 ) ) ( not ( = ?auto_471447 ?auto_471450 ) ) ( not ( = ?auto_471447 ?auto_471451 ) ) ( not ( = ?auto_471448 ?auto_471449 ) ) ( not ( = ?auto_471448 ?auto_471450 ) ) ( not ( = ?auto_471448 ?auto_471451 ) ) ( not ( = ?auto_471449 ?auto_471450 ) ) ( not ( = ?auto_471449 ?auto_471451 ) ) ( not ( = ?auto_471450 ?auto_471451 ) ) ( ON ?auto_471449 ?auto_471450 ) ( ON ?auto_471448 ?auto_471449 ) ( ON ?auto_471447 ?auto_471448 ) ( ON ?auto_471446 ?auto_471447 ) ( CLEAR ?auto_471446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471446 )
      ( MAKE-5PILE ?auto_471446 ?auto_471447 ?auto_471448 ?auto_471449 ?auto_471450 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_471469 - BLOCK
      ?auto_471470 - BLOCK
      ?auto_471471 - BLOCK
      ?auto_471472 - BLOCK
      ?auto_471473 - BLOCK
      ?auto_471474 - BLOCK
    )
    :vars
    (
      ?auto_471475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471473 ) ( ON ?auto_471474 ?auto_471475 ) ( CLEAR ?auto_471474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471469 ) ( ON ?auto_471470 ?auto_471469 ) ( ON ?auto_471471 ?auto_471470 ) ( ON ?auto_471472 ?auto_471471 ) ( ON ?auto_471473 ?auto_471472 ) ( not ( = ?auto_471469 ?auto_471470 ) ) ( not ( = ?auto_471469 ?auto_471471 ) ) ( not ( = ?auto_471469 ?auto_471472 ) ) ( not ( = ?auto_471469 ?auto_471473 ) ) ( not ( = ?auto_471469 ?auto_471474 ) ) ( not ( = ?auto_471469 ?auto_471475 ) ) ( not ( = ?auto_471470 ?auto_471471 ) ) ( not ( = ?auto_471470 ?auto_471472 ) ) ( not ( = ?auto_471470 ?auto_471473 ) ) ( not ( = ?auto_471470 ?auto_471474 ) ) ( not ( = ?auto_471470 ?auto_471475 ) ) ( not ( = ?auto_471471 ?auto_471472 ) ) ( not ( = ?auto_471471 ?auto_471473 ) ) ( not ( = ?auto_471471 ?auto_471474 ) ) ( not ( = ?auto_471471 ?auto_471475 ) ) ( not ( = ?auto_471472 ?auto_471473 ) ) ( not ( = ?auto_471472 ?auto_471474 ) ) ( not ( = ?auto_471472 ?auto_471475 ) ) ( not ( = ?auto_471473 ?auto_471474 ) ) ( not ( = ?auto_471473 ?auto_471475 ) ) ( not ( = ?auto_471474 ?auto_471475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471474 ?auto_471475 )
      ( !STACK ?auto_471474 ?auto_471473 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_471495 - BLOCK
      ?auto_471496 - BLOCK
      ?auto_471497 - BLOCK
      ?auto_471498 - BLOCK
      ?auto_471499 - BLOCK
      ?auto_471500 - BLOCK
    )
    :vars
    (
      ?auto_471501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471500 ?auto_471501 ) ( ON-TABLE ?auto_471495 ) ( ON ?auto_471496 ?auto_471495 ) ( ON ?auto_471497 ?auto_471496 ) ( ON ?auto_471498 ?auto_471497 ) ( not ( = ?auto_471495 ?auto_471496 ) ) ( not ( = ?auto_471495 ?auto_471497 ) ) ( not ( = ?auto_471495 ?auto_471498 ) ) ( not ( = ?auto_471495 ?auto_471499 ) ) ( not ( = ?auto_471495 ?auto_471500 ) ) ( not ( = ?auto_471495 ?auto_471501 ) ) ( not ( = ?auto_471496 ?auto_471497 ) ) ( not ( = ?auto_471496 ?auto_471498 ) ) ( not ( = ?auto_471496 ?auto_471499 ) ) ( not ( = ?auto_471496 ?auto_471500 ) ) ( not ( = ?auto_471496 ?auto_471501 ) ) ( not ( = ?auto_471497 ?auto_471498 ) ) ( not ( = ?auto_471497 ?auto_471499 ) ) ( not ( = ?auto_471497 ?auto_471500 ) ) ( not ( = ?auto_471497 ?auto_471501 ) ) ( not ( = ?auto_471498 ?auto_471499 ) ) ( not ( = ?auto_471498 ?auto_471500 ) ) ( not ( = ?auto_471498 ?auto_471501 ) ) ( not ( = ?auto_471499 ?auto_471500 ) ) ( not ( = ?auto_471499 ?auto_471501 ) ) ( not ( = ?auto_471500 ?auto_471501 ) ) ( CLEAR ?auto_471498 ) ( ON ?auto_471499 ?auto_471500 ) ( CLEAR ?auto_471499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_471495 ?auto_471496 ?auto_471497 ?auto_471498 ?auto_471499 )
      ( MAKE-6PILE ?auto_471495 ?auto_471496 ?auto_471497 ?auto_471498 ?auto_471499 ?auto_471500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_471521 - BLOCK
      ?auto_471522 - BLOCK
      ?auto_471523 - BLOCK
      ?auto_471524 - BLOCK
      ?auto_471525 - BLOCK
      ?auto_471526 - BLOCK
    )
    :vars
    (
      ?auto_471527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471526 ?auto_471527 ) ( ON-TABLE ?auto_471521 ) ( ON ?auto_471522 ?auto_471521 ) ( ON ?auto_471523 ?auto_471522 ) ( not ( = ?auto_471521 ?auto_471522 ) ) ( not ( = ?auto_471521 ?auto_471523 ) ) ( not ( = ?auto_471521 ?auto_471524 ) ) ( not ( = ?auto_471521 ?auto_471525 ) ) ( not ( = ?auto_471521 ?auto_471526 ) ) ( not ( = ?auto_471521 ?auto_471527 ) ) ( not ( = ?auto_471522 ?auto_471523 ) ) ( not ( = ?auto_471522 ?auto_471524 ) ) ( not ( = ?auto_471522 ?auto_471525 ) ) ( not ( = ?auto_471522 ?auto_471526 ) ) ( not ( = ?auto_471522 ?auto_471527 ) ) ( not ( = ?auto_471523 ?auto_471524 ) ) ( not ( = ?auto_471523 ?auto_471525 ) ) ( not ( = ?auto_471523 ?auto_471526 ) ) ( not ( = ?auto_471523 ?auto_471527 ) ) ( not ( = ?auto_471524 ?auto_471525 ) ) ( not ( = ?auto_471524 ?auto_471526 ) ) ( not ( = ?auto_471524 ?auto_471527 ) ) ( not ( = ?auto_471525 ?auto_471526 ) ) ( not ( = ?auto_471525 ?auto_471527 ) ) ( not ( = ?auto_471526 ?auto_471527 ) ) ( ON ?auto_471525 ?auto_471526 ) ( CLEAR ?auto_471523 ) ( ON ?auto_471524 ?auto_471525 ) ( CLEAR ?auto_471524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_471521 ?auto_471522 ?auto_471523 ?auto_471524 )
      ( MAKE-6PILE ?auto_471521 ?auto_471522 ?auto_471523 ?auto_471524 ?auto_471525 ?auto_471526 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_471547 - BLOCK
      ?auto_471548 - BLOCK
      ?auto_471549 - BLOCK
      ?auto_471550 - BLOCK
      ?auto_471551 - BLOCK
      ?auto_471552 - BLOCK
    )
    :vars
    (
      ?auto_471553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471552 ?auto_471553 ) ( ON-TABLE ?auto_471547 ) ( ON ?auto_471548 ?auto_471547 ) ( not ( = ?auto_471547 ?auto_471548 ) ) ( not ( = ?auto_471547 ?auto_471549 ) ) ( not ( = ?auto_471547 ?auto_471550 ) ) ( not ( = ?auto_471547 ?auto_471551 ) ) ( not ( = ?auto_471547 ?auto_471552 ) ) ( not ( = ?auto_471547 ?auto_471553 ) ) ( not ( = ?auto_471548 ?auto_471549 ) ) ( not ( = ?auto_471548 ?auto_471550 ) ) ( not ( = ?auto_471548 ?auto_471551 ) ) ( not ( = ?auto_471548 ?auto_471552 ) ) ( not ( = ?auto_471548 ?auto_471553 ) ) ( not ( = ?auto_471549 ?auto_471550 ) ) ( not ( = ?auto_471549 ?auto_471551 ) ) ( not ( = ?auto_471549 ?auto_471552 ) ) ( not ( = ?auto_471549 ?auto_471553 ) ) ( not ( = ?auto_471550 ?auto_471551 ) ) ( not ( = ?auto_471550 ?auto_471552 ) ) ( not ( = ?auto_471550 ?auto_471553 ) ) ( not ( = ?auto_471551 ?auto_471552 ) ) ( not ( = ?auto_471551 ?auto_471553 ) ) ( not ( = ?auto_471552 ?auto_471553 ) ) ( ON ?auto_471551 ?auto_471552 ) ( ON ?auto_471550 ?auto_471551 ) ( CLEAR ?auto_471548 ) ( ON ?auto_471549 ?auto_471550 ) ( CLEAR ?auto_471549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_471547 ?auto_471548 ?auto_471549 )
      ( MAKE-6PILE ?auto_471547 ?auto_471548 ?auto_471549 ?auto_471550 ?auto_471551 ?auto_471552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_471573 - BLOCK
      ?auto_471574 - BLOCK
      ?auto_471575 - BLOCK
      ?auto_471576 - BLOCK
      ?auto_471577 - BLOCK
      ?auto_471578 - BLOCK
    )
    :vars
    (
      ?auto_471579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471578 ?auto_471579 ) ( ON-TABLE ?auto_471573 ) ( not ( = ?auto_471573 ?auto_471574 ) ) ( not ( = ?auto_471573 ?auto_471575 ) ) ( not ( = ?auto_471573 ?auto_471576 ) ) ( not ( = ?auto_471573 ?auto_471577 ) ) ( not ( = ?auto_471573 ?auto_471578 ) ) ( not ( = ?auto_471573 ?auto_471579 ) ) ( not ( = ?auto_471574 ?auto_471575 ) ) ( not ( = ?auto_471574 ?auto_471576 ) ) ( not ( = ?auto_471574 ?auto_471577 ) ) ( not ( = ?auto_471574 ?auto_471578 ) ) ( not ( = ?auto_471574 ?auto_471579 ) ) ( not ( = ?auto_471575 ?auto_471576 ) ) ( not ( = ?auto_471575 ?auto_471577 ) ) ( not ( = ?auto_471575 ?auto_471578 ) ) ( not ( = ?auto_471575 ?auto_471579 ) ) ( not ( = ?auto_471576 ?auto_471577 ) ) ( not ( = ?auto_471576 ?auto_471578 ) ) ( not ( = ?auto_471576 ?auto_471579 ) ) ( not ( = ?auto_471577 ?auto_471578 ) ) ( not ( = ?auto_471577 ?auto_471579 ) ) ( not ( = ?auto_471578 ?auto_471579 ) ) ( ON ?auto_471577 ?auto_471578 ) ( ON ?auto_471576 ?auto_471577 ) ( ON ?auto_471575 ?auto_471576 ) ( CLEAR ?auto_471573 ) ( ON ?auto_471574 ?auto_471575 ) ( CLEAR ?auto_471574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471573 ?auto_471574 )
      ( MAKE-6PILE ?auto_471573 ?auto_471574 ?auto_471575 ?auto_471576 ?auto_471577 ?auto_471578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_471599 - BLOCK
      ?auto_471600 - BLOCK
      ?auto_471601 - BLOCK
      ?auto_471602 - BLOCK
      ?auto_471603 - BLOCK
      ?auto_471604 - BLOCK
    )
    :vars
    (
      ?auto_471605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471604 ?auto_471605 ) ( not ( = ?auto_471599 ?auto_471600 ) ) ( not ( = ?auto_471599 ?auto_471601 ) ) ( not ( = ?auto_471599 ?auto_471602 ) ) ( not ( = ?auto_471599 ?auto_471603 ) ) ( not ( = ?auto_471599 ?auto_471604 ) ) ( not ( = ?auto_471599 ?auto_471605 ) ) ( not ( = ?auto_471600 ?auto_471601 ) ) ( not ( = ?auto_471600 ?auto_471602 ) ) ( not ( = ?auto_471600 ?auto_471603 ) ) ( not ( = ?auto_471600 ?auto_471604 ) ) ( not ( = ?auto_471600 ?auto_471605 ) ) ( not ( = ?auto_471601 ?auto_471602 ) ) ( not ( = ?auto_471601 ?auto_471603 ) ) ( not ( = ?auto_471601 ?auto_471604 ) ) ( not ( = ?auto_471601 ?auto_471605 ) ) ( not ( = ?auto_471602 ?auto_471603 ) ) ( not ( = ?auto_471602 ?auto_471604 ) ) ( not ( = ?auto_471602 ?auto_471605 ) ) ( not ( = ?auto_471603 ?auto_471604 ) ) ( not ( = ?auto_471603 ?auto_471605 ) ) ( not ( = ?auto_471604 ?auto_471605 ) ) ( ON ?auto_471603 ?auto_471604 ) ( ON ?auto_471602 ?auto_471603 ) ( ON ?auto_471601 ?auto_471602 ) ( ON ?auto_471600 ?auto_471601 ) ( ON ?auto_471599 ?auto_471600 ) ( CLEAR ?auto_471599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471599 )
      ( MAKE-6PILE ?auto_471599 ?auto_471600 ?auto_471601 ?auto_471602 ?auto_471603 ?auto_471604 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471626 - BLOCK
      ?auto_471627 - BLOCK
      ?auto_471628 - BLOCK
      ?auto_471629 - BLOCK
      ?auto_471630 - BLOCK
      ?auto_471631 - BLOCK
      ?auto_471632 - BLOCK
    )
    :vars
    (
      ?auto_471633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471631 ) ( ON ?auto_471632 ?auto_471633 ) ( CLEAR ?auto_471632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471626 ) ( ON ?auto_471627 ?auto_471626 ) ( ON ?auto_471628 ?auto_471627 ) ( ON ?auto_471629 ?auto_471628 ) ( ON ?auto_471630 ?auto_471629 ) ( ON ?auto_471631 ?auto_471630 ) ( not ( = ?auto_471626 ?auto_471627 ) ) ( not ( = ?auto_471626 ?auto_471628 ) ) ( not ( = ?auto_471626 ?auto_471629 ) ) ( not ( = ?auto_471626 ?auto_471630 ) ) ( not ( = ?auto_471626 ?auto_471631 ) ) ( not ( = ?auto_471626 ?auto_471632 ) ) ( not ( = ?auto_471626 ?auto_471633 ) ) ( not ( = ?auto_471627 ?auto_471628 ) ) ( not ( = ?auto_471627 ?auto_471629 ) ) ( not ( = ?auto_471627 ?auto_471630 ) ) ( not ( = ?auto_471627 ?auto_471631 ) ) ( not ( = ?auto_471627 ?auto_471632 ) ) ( not ( = ?auto_471627 ?auto_471633 ) ) ( not ( = ?auto_471628 ?auto_471629 ) ) ( not ( = ?auto_471628 ?auto_471630 ) ) ( not ( = ?auto_471628 ?auto_471631 ) ) ( not ( = ?auto_471628 ?auto_471632 ) ) ( not ( = ?auto_471628 ?auto_471633 ) ) ( not ( = ?auto_471629 ?auto_471630 ) ) ( not ( = ?auto_471629 ?auto_471631 ) ) ( not ( = ?auto_471629 ?auto_471632 ) ) ( not ( = ?auto_471629 ?auto_471633 ) ) ( not ( = ?auto_471630 ?auto_471631 ) ) ( not ( = ?auto_471630 ?auto_471632 ) ) ( not ( = ?auto_471630 ?auto_471633 ) ) ( not ( = ?auto_471631 ?auto_471632 ) ) ( not ( = ?auto_471631 ?auto_471633 ) ) ( not ( = ?auto_471632 ?auto_471633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471632 ?auto_471633 )
      ( !STACK ?auto_471632 ?auto_471631 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471656 - BLOCK
      ?auto_471657 - BLOCK
      ?auto_471658 - BLOCK
      ?auto_471659 - BLOCK
      ?auto_471660 - BLOCK
      ?auto_471661 - BLOCK
      ?auto_471662 - BLOCK
    )
    :vars
    (
      ?auto_471663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471662 ?auto_471663 ) ( ON-TABLE ?auto_471656 ) ( ON ?auto_471657 ?auto_471656 ) ( ON ?auto_471658 ?auto_471657 ) ( ON ?auto_471659 ?auto_471658 ) ( ON ?auto_471660 ?auto_471659 ) ( not ( = ?auto_471656 ?auto_471657 ) ) ( not ( = ?auto_471656 ?auto_471658 ) ) ( not ( = ?auto_471656 ?auto_471659 ) ) ( not ( = ?auto_471656 ?auto_471660 ) ) ( not ( = ?auto_471656 ?auto_471661 ) ) ( not ( = ?auto_471656 ?auto_471662 ) ) ( not ( = ?auto_471656 ?auto_471663 ) ) ( not ( = ?auto_471657 ?auto_471658 ) ) ( not ( = ?auto_471657 ?auto_471659 ) ) ( not ( = ?auto_471657 ?auto_471660 ) ) ( not ( = ?auto_471657 ?auto_471661 ) ) ( not ( = ?auto_471657 ?auto_471662 ) ) ( not ( = ?auto_471657 ?auto_471663 ) ) ( not ( = ?auto_471658 ?auto_471659 ) ) ( not ( = ?auto_471658 ?auto_471660 ) ) ( not ( = ?auto_471658 ?auto_471661 ) ) ( not ( = ?auto_471658 ?auto_471662 ) ) ( not ( = ?auto_471658 ?auto_471663 ) ) ( not ( = ?auto_471659 ?auto_471660 ) ) ( not ( = ?auto_471659 ?auto_471661 ) ) ( not ( = ?auto_471659 ?auto_471662 ) ) ( not ( = ?auto_471659 ?auto_471663 ) ) ( not ( = ?auto_471660 ?auto_471661 ) ) ( not ( = ?auto_471660 ?auto_471662 ) ) ( not ( = ?auto_471660 ?auto_471663 ) ) ( not ( = ?auto_471661 ?auto_471662 ) ) ( not ( = ?auto_471661 ?auto_471663 ) ) ( not ( = ?auto_471662 ?auto_471663 ) ) ( CLEAR ?auto_471660 ) ( ON ?auto_471661 ?auto_471662 ) ( CLEAR ?auto_471661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_471656 ?auto_471657 ?auto_471658 ?auto_471659 ?auto_471660 ?auto_471661 )
      ( MAKE-7PILE ?auto_471656 ?auto_471657 ?auto_471658 ?auto_471659 ?auto_471660 ?auto_471661 ?auto_471662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471686 - BLOCK
      ?auto_471687 - BLOCK
      ?auto_471688 - BLOCK
      ?auto_471689 - BLOCK
      ?auto_471690 - BLOCK
      ?auto_471691 - BLOCK
      ?auto_471692 - BLOCK
    )
    :vars
    (
      ?auto_471693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471692 ?auto_471693 ) ( ON-TABLE ?auto_471686 ) ( ON ?auto_471687 ?auto_471686 ) ( ON ?auto_471688 ?auto_471687 ) ( ON ?auto_471689 ?auto_471688 ) ( not ( = ?auto_471686 ?auto_471687 ) ) ( not ( = ?auto_471686 ?auto_471688 ) ) ( not ( = ?auto_471686 ?auto_471689 ) ) ( not ( = ?auto_471686 ?auto_471690 ) ) ( not ( = ?auto_471686 ?auto_471691 ) ) ( not ( = ?auto_471686 ?auto_471692 ) ) ( not ( = ?auto_471686 ?auto_471693 ) ) ( not ( = ?auto_471687 ?auto_471688 ) ) ( not ( = ?auto_471687 ?auto_471689 ) ) ( not ( = ?auto_471687 ?auto_471690 ) ) ( not ( = ?auto_471687 ?auto_471691 ) ) ( not ( = ?auto_471687 ?auto_471692 ) ) ( not ( = ?auto_471687 ?auto_471693 ) ) ( not ( = ?auto_471688 ?auto_471689 ) ) ( not ( = ?auto_471688 ?auto_471690 ) ) ( not ( = ?auto_471688 ?auto_471691 ) ) ( not ( = ?auto_471688 ?auto_471692 ) ) ( not ( = ?auto_471688 ?auto_471693 ) ) ( not ( = ?auto_471689 ?auto_471690 ) ) ( not ( = ?auto_471689 ?auto_471691 ) ) ( not ( = ?auto_471689 ?auto_471692 ) ) ( not ( = ?auto_471689 ?auto_471693 ) ) ( not ( = ?auto_471690 ?auto_471691 ) ) ( not ( = ?auto_471690 ?auto_471692 ) ) ( not ( = ?auto_471690 ?auto_471693 ) ) ( not ( = ?auto_471691 ?auto_471692 ) ) ( not ( = ?auto_471691 ?auto_471693 ) ) ( not ( = ?auto_471692 ?auto_471693 ) ) ( ON ?auto_471691 ?auto_471692 ) ( CLEAR ?auto_471689 ) ( ON ?auto_471690 ?auto_471691 ) ( CLEAR ?auto_471690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_471686 ?auto_471687 ?auto_471688 ?auto_471689 ?auto_471690 )
      ( MAKE-7PILE ?auto_471686 ?auto_471687 ?auto_471688 ?auto_471689 ?auto_471690 ?auto_471691 ?auto_471692 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471716 - BLOCK
      ?auto_471717 - BLOCK
      ?auto_471718 - BLOCK
      ?auto_471719 - BLOCK
      ?auto_471720 - BLOCK
      ?auto_471721 - BLOCK
      ?auto_471722 - BLOCK
    )
    :vars
    (
      ?auto_471723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471722 ?auto_471723 ) ( ON-TABLE ?auto_471716 ) ( ON ?auto_471717 ?auto_471716 ) ( ON ?auto_471718 ?auto_471717 ) ( not ( = ?auto_471716 ?auto_471717 ) ) ( not ( = ?auto_471716 ?auto_471718 ) ) ( not ( = ?auto_471716 ?auto_471719 ) ) ( not ( = ?auto_471716 ?auto_471720 ) ) ( not ( = ?auto_471716 ?auto_471721 ) ) ( not ( = ?auto_471716 ?auto_471722 ) ) ( not ( = ?auto_471716 ?auto_471723 ) ) ( not ( = ?auto_471717 ?auto_471718 ) ) ( not ( = ?auto_471717 ?auto_471719 ) ) ( not ( = ?auto_471717 ?auto_471720 ) ) ( not ( = ?auto_471717 ?auto_471721 ) ) ( not ( = ?auto_471717 ?auto_471722 ) ) ( not ( = ?auto_471717 ?auto_471723 ) ) ( not ( = ?auto_471718 ?auto_471719 ) ) ( not ( = ?auto_471718 ?auto_471720 ) ) ( not ( = ?auto_471718 ?auto_471721 ) ) ( not ( = ?auto_471718 ?auto_471722 ) ) ( not ( = ?auto_471718 ?auto_471723 ) ) ( not ( = ?auto_471719 ?auto_471720 ) ) ( not ( = ?auto_471719 ?auto_471721 ) ) ( not ( = ?auto_471719 ?auto_471722 ) ) ( not ( = ?auto_471719 ?auto_471723 ) ) ( not ( = ?auto_471720 ?auto_471721 ) ) ( not ( = ?auto_471720 ?auto_471722 ) ) ( not ( = ?auto_471720 ?auto_471723 ) ) ( not ( = ?auto_471721 ?auto_471722 ) ) ( not ( = ?auto_471721 ?auto_471723 ) ) ( not ( = ?auto_471722 ?auto_471723 ) ) ( ON ?auto_471721 ?auto_471722 ) ( ON ?auto_471720 ?auto_471721 ) ( CLEAR ?auto_471718 ) ( ON ?auto_471719 ?auto_471720 ) ( CLEAR ?auto_471719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_471716 ?auto_471717 ?auto_471718 ?auto_471719 )
      ( MAKE-7PILE ?auto_471716 ?auto_471717 ?auto_471718 ?auto_471719 ?auto_471720 ?auto_471721 ?auto_471722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471746 - BLOCK
      ?auto_471747 - BLOCK
      ?auto_471748 - BLOCK
      ?auto_471749 - BLOCK
      ?auto_471750 - BLOCK
      ?auto_471751 - BLOCK
      ?auto_471752 - BLOCK
    )
    :vars
    (
      ?auto_471753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471752 ?auto_471753 ) ( ON-TABLE ?auto_471746 ) ( ON ?auto_471747 ?auto_471746 ) ( not ( = ?auto_471746 ?auto_471747 ) ) ( not ( = ?auto_471746 ?auto_471748 ) ) ( not ( = ?auto_471746 ?auto_471749 ) ) ( not ( = ?auto_471746 ?auto_471750 ) ) ( not ( = ?auto_471746 ?auto_471751 ) ) ( not ( = ?auto_471746 ?auto_471752 ) ) ( not ( = ?auto_471746 ?auto_471753 ) ) ( not ( = ?auto_471747 ?auto_471748 ) ) ( not ( = ?auto_471747 ?auto_471749 ) ) ( not ( = ?auto_471747 ?auto_471750 ) ) ( not ( = ?auto_471747 ?auto_471751 ) ) ( not ( = ?auto_471747 ?auto_471752 ) ) ( not ( = ?auto_471747 ?auto_471753 ) ) ( not ( = ?auto_471748 ?auto_471749 ) ) ( not ( = ?auto_471748 ?auto_471750 ) ) ( not ( = ?auto_471748 ?auto_471751 ) ) ( not ( = ?auto_471748 ?auto_471752 ) ) ( not ( = ?auto_471748 ?auto_471753 ) ) ( not ( = ?auto_471749 ?auto_471750 ) ) ( not ( = ?auto_471749 ?auto_471751 ) ) ( not ( = ?auto_471749 ?auto_471752 ) ) ( not ( = ?auto_471749 ?auto_471753 ) ) ( not ( = ?auto_471750 ?auto_471751 ) ) ( not ( = ?auto_471750 ?auto_471752 ) ) ( not ( = ?auto_471750 ?auto_471753 ) ) ( not ( = ?auto_471751 ?auto_471752 ) ) ( not ( = ?auto_471751 ?auto_471753 ) ) ( not ( = ?auto_471752 ?auto_471753 ) ) ( ON ?auto_471751 ?auto_471752 ) ( ON ?auto_471750 ?auto_471751 ) ( ON ?auto_471749 ?auto_471750 ) ( CLEAR ?auto_471747 ) ( ON ?auto_471748 ?auto_471749 ) ( CLEAR ?auto_471748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_471746 ?auto_471747 ?auto_471748 )
      ( MAKE-7PILE ?auto_471746 ?auto_471747 ?auto_471748 ?auto_471749 ?auto_471750 ?auto_471751 ?auto_471752 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471776 - BLOCK
      ?auto_471777 - BLOCK
      ?auto_471778 - BLOCK
      ?auto_471779 - BLOCK
      ?auto_471780 - BLOCK
      ?auto_471781 - BLOCK
      ?auto_471782 - BLOCK
    )
    :vars
    (
      ?auto_471783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471782 ?auto_471783 ) ( ON-TABLE ?auto_471776 ) ( not ( = ?auto_471776 ?auto_471777 ) ) ( not ( = ?auto_471776 ?auto_471778 ) ) ( not ( = ?auto_471776 ?auto_471779 ) ) ( not ( = ?auto_471776 ?auto_471780 ) ) ( not ( = ?auto_471776 ?auto_471781 ) ) ( not ( = ?auto_471776 ?auto_471782 ) ) ( not ( = ?auto_471776 ?auto_471783 ) ) ( not ( = ?auto_471777 ?auto_471778 ) ) ( not ( = ?auto_471777 ?auto_471779 ) ) ( not ( = ?auto_471777 ?auto_471780 ) ) ( not ( = ?auto_471777 ?auto_471781 ) ) ( not ( = ?auto_471777 ?auto_471782 ) ) ( not ( = ?auto_471777 ?auto_471783 ) ) ( not ( = ?auto_471778 ?auto_471779 ) ) ( not ( = ?auto_471778 ?auto_471780 ) ) ( not ( = ?auto_471778 ?auto_471781 ) ) ( not ( = ?auto_471778 ?auto_471782 ) ) ( not ( = ?auto_471778 ?auto_471783 ) ) ( not ( = ?auto_471779 ?auto_471780 ) ) ( not ( = ?auto_471779 ?auto_471781 ) ) ( not ( = ?auto_471779 ?auto_471782 ) ) ( not ( = ?auto_471779 ?auto_471783 ) ) ( not ( = ?auto_471780 ?auto_471781 ) ) ( not ( = ?auto_471780 ?auto_471782 ) ) ( not ( = ?auto_471780 ?auto_471783 ) ) ( not ( = ?auto_471781 ?auto_471782 ) ) ( not ( = ?auto_471781 ?auto_471783 ) ) ( not ( = ?auto_471782 ?auto_471783 ) ) ( ON ?auto_471781 ?auto_471782 ) ( ON ?auto_471780 ?auto_471781 ) ( ON ?auto_471779 ?auto_471780 ) ( ON ?auto_471778 ?auto_471779 ) ( CLEAR ?auto_471776 ) ( ON ?auto_471777 ?auto_471778 ) ( CLEAR ?auto_471777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_471776 ?auto_471777 )
      ( MAKE-7PILE ?auto_471776 ?auto_471777 ?auto_471778 ?auto_471779 ?auto_471780 ?auto_471781 ?auto_471782 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_471806 - BLOCK
      ?auto_471807 - BLOCK
      ?auto_471808 - BLOCK
      ?auto_471809 - BLOCK
      ?auto_471810 - BLOCK
      ?auto_471811 - BLOCK
      ?auto_471812 - BLOCK
    )
    :vars
    (
      ?auto_471813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471812 ?auto_471813 ) ( not ( = ?auto_471806 ?auto_471807 ) ) ( not ( = ?auto_471806 ?auto_471808 ) ) ( not ( = ?auto_471806 ?auto_471809 ) ) ( not ( = ?auto_471806 ?auto_471810 ) ) ( not ( = ?auto_471806 ?auto_471811 ) ) ( not ( = ?auto_471806 ?auto_471812 ) ) ( not ( = ?auto_471806 ?auto_471813 ) ) ( not ( = ?auto_471807 ?auto_471808 ) ) ( not ( = ?auto_471807 ?auto_471809 ) ) ( not ( = ?auto_471807 ?auto_471810 ) ) ( not ( = ?auto_471807 ?auto_471811 ) ) ( not ( = ?auto_471807 ?auto_471812 ) ) ( not ( = ?auto_471807 ?auto_471813 ) ) ( not ( = ?auto_471808 ?auto_471809 ) ) ( not ( = ?auto_471808 ?auto_471810 ) ) ( not ( = ?auto_471808 ?auto_471811 ) ) ( not ( = ?auto_471808 ?auto_471812 ) ) ( not ( = ?auto_471808 ?auto_471813 ) ) ( not ( = ?auto_471809 ?auto_471810 ) ) ( not ( = ?auto_471809 ?auto_471811 ) ) ( not ( = ?auto_471809 ?auto_471812 ) ) ( not ( = ?auto_471809 ?auto_471813 ) ) ( not ( = ?auto_471810 ?auto_471811 ) ) ( not ( = ?auto_471810 ?auto_471812 ) ) ( not ( = ?auto_471810 ?auto_471813 ) ) ( not ( = ?auto_471811 ?auto_471812 ) ) ( not ( = ?auto_471811 ?auto_471813 ) ) ( not ( = ?auto_471812 ?auto_471813 ) ) ( ON ?auto_471811 ?auto_471812 ) ( ON ?auto_471810 ?auto_471811 ) ( ON ?auto_471809 ?auto_471810 ) ( ON ?auto_471808 ?auto_471809 ) ( ON ?auto_471807 ?auto_471808 ) ( ON ?auto_471806 ?auto_471807 ) ( CLEAR ?auto_471806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_471806 )
      ( MAKE-7PILE ?auto_471806 ?auto_471807 ?auto_471808 ?auto_471809 ?auto_471810 ?auto_471811 ?auto_471812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_471837 - BLOCK
      ?auto_471838 - BLOCK
      ?auto_471839 - BLOCK
      ?auto_471840 - BLOCK
      ?auto_471841 - BLOCK
      ?auto_471842 - BLOCK
      ?auto_471843 - BLOCK
      ?auto_471844 - BLOCK
    )
    :vars
    (
      ?auto_471845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_471843 ) ( ON ?auto_471844 ?auto_471845 ) ( CLEAR ?auto_471844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_471837 ) ( ON ?auto_471838 ?auto_471837 ) ( ON ?auto_471839 ?auto_471838 ) ( ON ?auto_471840 ?auto_471839 ) ( ON ?auto_471841 ?auto_471840 ) ( ON ?auto_471842 ?auto_471841 ) ( ON ?auto_471843 ?auto_471842 ) ( not ( = ?auto_471837 ?auto_471838 ) ) ( not ( = ?auto_471837 ?auto_471839 ) ) ( not ( = ?auto_471837 ?auto_471840 ) ) ( not ( = ?auto_471837 ?auto_471841 ) ) ( not ( = ?auto_471837 ?auto_471842 ) ) ( not ( = ?auto_471837 ?auto_471843 ) ) ( not ( = ?auto_471837 ?auto_471844 ) ) ( not ( = ?auto_471837 ?auto_471845 ) ) ( not ( = ?auto_471838 ?auto_471839 ) ) ( not ( = ?auto_471838 ?auto_471840 ) ) ( not ( = ?auto_471838 ?auto_471841 ) ) ( not ( = ?auto_471838 ?auto_471842 ) ) ( not ( = ?auto_471838 ?auto_471843 ) ) ( not ( = ?auto_471838 ?auto_471844 ) ) ( not ( = ?auto_471838 ?auto_471845 ) ) ( not ( = ?auto_471839 ?auto_471840 ) ) ( not ( = ?auto_471839 ?auto_471841 ) ) ( not ( = ?auto_471839 ?auto_471842 ) ) ( not ( = ?auto_471839 ?auto_471843 ) ) ( not ( = ?auto_471839 ?auto_471844 ) ) ( not ( = ?auto_471839 ?auto_471845 ) ) ( not ( = ?auto_471840 ?auto_471841 ) ) ( not ( = ?auto_471840 ?auto_471842 ) ) ( not ( = ?auto_471840 ?auto_471843 ) ) ( not ( = ?auto_471840 ?auto_471844 ) ) ( not ( = ?auto_471840 ?auto_471845 ) ) ( not ( = ?auto_471841 ?auto_471842 ) ) ( not ( = ?auto_471841 ?auto_471843 ) ) ( not ( = ?auto_471841 ?auto_471844 ) ) ( not ( = ?auto_471841 ?auto_471845 ) ) ( not ( = ?auto_471842 ?auto_471843 ) ) ( not ( = ?auto_471842 ?auto_471844 ) ) ( not ( = ?auto_471842 ?auto_471845 ) ) ( not ( = ?auto_471843 ?auto_471844 ) ) ( not ( = ?auto_471843 ?auto_471845 ) ) ( not ( = ?auto_471844 ?auto_471845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_471844 ?auto_471845 )
      ( !STACK ?auto_471844 ?auto_471843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_471871 - BLOCK
      ?auto_471872 - BLOCK
      ?auto_471873 - BLOCK
      ?auto_471874 - BLOCK
      ?auto_471875 - BLOCK
      ?auto_471876 - BLOCK
      ?auto_471877 - BLOCK
      ?auto_471878 - BLOCK
    )
    :vars
    (
      ?auto_471879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471878 ?auto_471879 ) ( ON-TABLE ?auto_471871 ) ( ON ?auto_471872 ?auto_471871 ) ( ON ?auto_471873 ?auto_471872 ) ( ON ?auto_471874 ?auto_471873 ) ( ON ?auto_471875 ?auto_471874 ) ( ON ?auto_471876 ?auto_471875 ) ( not ( = ?auto_471871 ?auto_471872 ) ) ( not ( = ?auto_471871 ?auto_471873 ) ) ( not ( = ?auto_471871 ?auto_471874 ) ) ( not ( = ?auto_471871 ?auto_471875 ) ) ( not ( = ?auto_471871 ?auto_471876 ) ) ( not ( = ?auto_471871 ?auto_471877 ) ) ( not ( = ?auto_471871 ?auto_471878 ) ) ( not ( = ?auto_471871 ?auto_471879 ) ) ( not ( = ?auto_471872 ?auto_471873 ) ) ( not ( = ?auto_471872 ?auto_471874 ) ) ( not ( = ?auto_471872 ?auto_471875 ) ) ( not ( = ?auto_471872 ?auto_471876 ) ) ( not ( = ?auto_471872 ?auto_471877 ) ) ( not ( = ?auto_471872 ?auto_471878 ) ) ( not ( = ?auto_471872 ?auto_471879 ) ) ( not ( = ?auto_471873 ?auto_471874 ) ) ( not ( = ?auto_471873 ?auto_471875 ) ) ( not ( = ?auto_471873 ?auto_471876 ) ) ( not ( = ?auto_471873 ?auto_471877 ) ) ( not ( = ?auto_471873 ?auto_471878 ) ) ( not ( = ?auto_471873 ?auto_471879 ) ) ( not ( = ?auto_471874 ?auto_471875 ) ) ( not ( = ?auto_471874 ?auto_471876 ) ) ( not ( = ?auto_471874 ?auto_471877 ) ) ( not ( = ?auto_471874 ?auto_471878 ) ) ( not ( = ?auto_471874 ?auto_471879 ) ) ( not ( = ?auto_471875 ?auto_471876 ) ) ( not ( = ?auto_471875 ?auto_471877 ) ) ( not ( = ?auto_471875 ?auto_471878 ) ) ( not ( = ?auto_471875 ?auto_471879 ) ) ( not ( = ?auto_471876 ?auto_471877 ) ) ( not ( = ?auto_471876 ?auto_471878 ) ) ( not ( = ?auto_471876 ?auto_471879 ) ) ( not ( = ?auto_471877 ?auto_471878 ) ) ( not ( = ?auto_471877 ?auto_471879 ) ) ( not ( = ?auto_471878 ?auto_471879 ) ) ( CLEAR ?auto_471876 ) ( ON ?auto_471877 ?auto_471878 ) ( CLEAR ?auto_471877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_471871 ?auto_471872 ?auto_471873 ?auto_471874 ?auto_471875 ?auto_471876 ?auto_471877 )
      ( MAKE-8PILE ?auto_471871 ?auto_471872 ?auto_471873 ?auto_471874 ?auto_471875 ?auto_471876 ?auto_471877 ?auto_471878 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_471905 - BLOCK
      ?auto_471906 - BLOCK
      ?auto_471907 - BLOCK
      ?auto_471908 - BLOCK
      ?auto_471909 - BLOCK
      ?auto_471910 - BLOCK
      ?auto_471911 - BLOCK
      ?auto_471912 - BLOCK
    )
    :vars
    (
      ?auto_471913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471912 ?auto_471913 ) ( ON-TABLE ?auto_471905 ) ( ON ?auto_471906 ?auto_471905 ) ( ON ?auto_471907 ?auto_471906 ) ( ON ?auto_471908 ?auto_471907 ) ( ON ?auto_471909 ?auto_471908 ) ( not ( = ?auto_471905 ?auto_471906 ) ) ( not ( = ?auto_471905 ?auto_471907 ) ) ( not ( = ?auto_471905 ?auto_471908 ) ) ( not ( = ?auto_471905 ?auto_471909 ) ) ( not ( = ?auto_471905 ?auto_471910 ) ) ( not ( = ?auto_471905 ?auto_471911 ) ) ( not ( = ?auto_471905 ?auto_471912 ) ) ( not ( = ?auto_471905 ?auto_471913 ) ) ( not ( = ?auto_471906 ?auto_471907 ) ) ( not ( = ?auto_471906 ?auto_471908 ) ) ( not ( = ?auto_471906 ?auto_471909 ) ) ( not ( = ?auto_471906 ?auto_471910 ) ) ( not ( = ?auto_471906 ?auto_471911 ) ) ( not ( = ?auto_471906 ?auto_471912 ) ) ( not ( = ?auto_471906 ?auto_471913 ) ) ( not ( = ?auto_471907 ?auto_471908 ) ) ( not ( = ?auto_471907 ?auto_471909 ) ) ( not ( = ?auto_471907 ?auto_471910 ) ) ( not ( = ?auto_471907 ?auto_471911 ) ) ( not ( = ?auto_471907 ?auto_471912 ) ) ( not ( = ?auto_471907 ?auto_471913 ) ) ( not ( = ?auto_471908 ?auto_471909 ) ) ( not ( = ?auto_471908 ?auto_471910 ) ) ( not ( = ?auto_471908 ?auto_471911 ) ) ( not ( = ?auto_471908 ?auto_471912 ) ) ( not ( = ?auto_471908 ?auto_471913 ) ) ( not ( = ?auto_471909 ?auto_471910 ) ) ( not ( = ?auto_471909 ?auto_471911 ) ) ( not ( = ?auto_471909 ?auto_471912 ) ) ( not ( = ?auto_471909 ?auto_471913 ) ) ( not ( = ?auto_471910 ?auto_471911 ) ) ( not ( = ?auto_471910 ?auto_471912 ) ) ( not ( = ?auto_471910 ?auto_471913 ) ) ( not ( = ?auto_471911 ?auto_471912 ) ) ( not ( = ?auto_471911 ?auto_471913 ) ) ( not ( = ?auto_471912 ?auto_471913 ) ) ( ON ?auto_471911 ?auto_471912 ) ( CLEAR ?auto_471909 ) ( ON ?auto_471910 ?auto_471911 ) ( CLEAR ?auto_471910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_471905 ?auto_471906 ?auto_471907 ?auto_471908 ?auto_471909 ?auto_471910 )
      ( MAKE-8PILE ?auto_471905 ?auto_471906 ?auto_471907 ?auto_471908 ?auto_471909 ?auto_471910 ?auto_471911 ?auto_471912 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_471939 - BLOCK
      ?auto_471940 - BLOCK
      ?auto_471941 - BLOCK
      ?auto_471942 - BLOCK
      ?auto_471943 - BLOCK
      ?auto_471944 - BLOCK
      ?auto_471945 - BLOCK
      ?auto_471946 - BLOCK
    )
    :vars
    (
      ?auto_471947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471946 ?auto_471947 ) ( ON-TABLE ?auto_471939 ) ( ON ?auto_471940 ?auto_471939 ) ( ON ?auto_471941 ?auto_471940 ) ( ON ?auto_471942 ?auto_471941 ) ( not ( = ?auto_471939 ?auto_471940 ) ) ( not ( = ?auto_471939 ?auto_471941 ) ) ( not ( = ?auto_471939 ?auto_471942 ) ) ( not ( = ?auto_471939 ?auto_471943 ) ) ( not ( = ?auto_471939 ?auto_471944 ) ) ( not ( = ?auto_471939 ?auto_471945 ) ) ( not ( = ?auto_471939 ?auto_471946 ) ) ( not ( = ?auto_471939 ?auto_471947 ) ) ( not ( = ?auto_471940 ?auto_471941 ) ) ( not ( = ?auto_471940 ?auto_471942 ) ) ( not ( = ?auto_471940 ?auto_471943 ) ) ( not ( = ?auto_471940 ?auto_471944 ) ) ( not ( = ?auto_471940 ?auto_471945 ) ) ( not ( = ?auto_471940 ?auto_471946 ) ) ( not ( = ?auto_471940 ?auto_471947 ) ) ( not ( = ?auto_471941 ?auto_471942 ) ) ( not ( = ?auto_471941 ?auto_471943 ) ) ( not ( = ?auto_471941 ?auto_471944 ) ) ( not ( = ?auto_471941 ?auto_471945 ) ) ( not ( = ?auto_471941 ?auto_471946 ) ) ( not ( = ?auto_471941 ?auto_471947 ) ) ( not ( = ?auto_471942 ?auto_471943 ) ) ( not ( = ?auto_471942 ?auto_471944 ) ) ( not ( = ?auto_471942 ?auto_471945 ) ) ( not ( = ?auto_471942 ?auto_471946 ) ) ( not ( = ?auto_471942 ?auto_471947 ) ) ( not ( = ?auto_471943 ?auto_471944 ) ) ( not ( = ?auto_471943 ?auto_471945 ) ) ( not ( = ?auto_471943 ?auto_471946 ) ) ( not ( = ?auto_471943 ?auto_471947 ) ) ( not ( = ?auto_471944 ?auto_471945 ) ) ( not ( = ?auto_471944 ?auto_471946 ) ) ( not ( = ?auto_471944 ?auto_471947 ) ) ( not ( = ?auto_471945 ?auto_471946 ) ) ( not ( = ?auto_471945 ?auto_471947 ) ) ( not ( = ?auto_471946 ?auto_471947 ) ) ( ON ?auto_471945 ?auto_471946 ) ( ON ?auto_471944 ?auto_471945 ) ( CLEAR ?auto_471942 ) ( ON ?auto_471943 ?auto_471944 ) ( CLEAR ?auto_471943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_471939 ?auto_471940 ?auto_471941 ?auto_471942 ?auto_471943 )
      ( MAKE-8PILE ?auto_471939 ?auto_471940 ?auto_471941 ?auto_471942 ?auto_471943 ?auto_471944 ?auto_471945 ?auto_471946 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_471973 - BLOCK
      ?auto_471974 - BLOCK
      ?auto_471975 - BLOCK
      ?auto_471976 - BLOCK
      ?auto_471977 - BLOCK
      ?auto_471978 - BLOCK
      ?auto_471979 - BLOCK
      ?auto_471980 - BLOCK
    )
    :vars
    (
      ?auto_471981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_471980 ?auto_471981 ) ( ON-TABLE ?auto_471973 ) ( ON ?auto_471974 ?auto_471973 ) ( ON ?auto_471975 ?auto_471974 ) ( not ( = ?auto_471973 ?auto_471974 ) ) ( not ( = ?auto_471973 ?auto_471975 ) ) ( not ( = ?auto_471973 ?auto_471976 ) ) ( not ( = ?auto_471973 ?auto_471977 ) ) ( not ( = ?auto_471973 ?auto_471978 ) ) ( not ( = ?auto_471973 ?auto_471979 ) ) ( not ( = ?auto_471973 ?auto_471980 ) ) ( not ( = ?auto_471973 ?auto_471981 ) ) ( not ( = ?auto_471974 ?auto_471975 ) ) ( not ( = ?auto_471974 ?auto_471976 ) ) ( not ( = ?auto_471974 ?auto_471977 ) ) ( not ( = ?auto_471974 ?auto_471978 ) ) ( not ( = ?auto_471974 ?auto_471979 ) ) ( not ( = ?auto_471974 ?auto_471980 ) ) ( not ( = ?auto_471974 ?auto_471981 ) ) ( not ( = ?auto_471975 ?auto_471976 ) ) ( not ( = ?auto_471975 ?auto_471977 ) ) ( not ( = ?auto_471975 ?auto_471978 ) ) ( not ( = ?auto_471975 ?auto_471979 ) ) ( not ( = ?auto_471975 ?auto_471980 ) ) ( not ( = ?auto_471975 ?auto_471981 ) ) ( not ( = ?auto_471976 ?auto_471977 ) ) ( not ( = ?auto_471976 ?auto_471978 ) ) ( not ( = ?auto_471976 ?auto_471979 ) ) ( not ( = ?auto_471976 ?auto_471980 ) ) ( not ( = ?auto_471976 ?auto_471981 ) ) ( not ( = ?auto_471977 ?auto_471978 ) ) ( not ( = ?auto_471977 ?auto_471979 ) ) ( not ( = ?auto_471977 ?auto_471980 ) ) ( not ( = ?auto_471977 ?auto_471981 ) ) ( not ( = ?auto_471978 ?auto_471979 ) ) ( not ( = ?auto_471978 ?auto_471980 ) ) ( not ( = ?auto_471978 ?auto_471981 ) ) ( not ( = ?auto_471979 ?auto_471980 ) ) ( not ( = ?auto_471979 ?auto_471981 ) ) ( not ( = ?auto_471980 ?auto_471981 ) ) ( ON ?auto_471979 ?auto_471980 ) ( ON ?auto_471978 ?auto_471979 ) ( ON ?auto_471977 ?auto_471978 ) ( CLEAR ?auto_471975 ) ( ON ?auto_471976 ?auto_471977 ) ( CLEAR ?auto_471976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_471973 ?auto_471974 ?auto_471975 ?auto_471976 )
      ( MAKE-8PILE ?auto_471973 ?auto_471974 ?auto_471975 ?auto_471976 ?auto_471977 ?auto_471978 ?auto_471979 ?auto_471980 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_472007 - BLOCK
      ?auto_472008 - BLOCK
      ?auto_472009 - BLOCK
      ?auto_472010 - BLOCK
      ?auto_472011 - BLOCK
      ?auto_472012 - BLOCK
      ?auto_472013 - BLOCK
      ?auto_472014 - BLOCK
    )
    :vars
    (
      ?auto_472015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472014 ?auto_472015 ) ( ON-TABLE ?auto_472007 ) ( ON ?auto_472008 ?auto_472007 ) ( not ( = ?auto_472007 ?auto_472008 ) ) ( not ( = ?auto_472007 ?auto_472009 ) ) ( not ( = ?auto_472007 ?auto_472010 ) ) ( not ( = ?auto_472007 ?auto_472011 ) ) ( not ( = ?auto_472007 ?auto_472012 ) ) ( not ( = ?auto_472007 ?auto_472013 ) ) ( not ( = ?auto_472007 ?auto_472014 ) ) ( not ( = ?auto_472007 ?auto_472015 ) ) ( not ( = ?auto_472008 ?auto_472009 ) ) ( not ( = ?auto_472008 ?auto_472010 ) ) ( not ( = ?auto_472008 ?auto_472011 ) ) ( not ( = ?auto_472008 ?auto_472012 ) ) ( not ( = ?auto_472008 ?auto_472013 ) ) ( not ( = ?auto_472008 ?auto_472014 ) ) ( not ( = ?auto_472008 ?auto_472015 ) ) ( not ( = ?auto_472009 ?auto_472010 ) ) ( not ( = ?auto_472009 ?auto_472011 ) ) ( not ( = ?auto_472009 ?auto_472012 ) ) ( not ( = ?auto_472009 ?auto_472013 ) ) ( not ( = ?auto_472009 ?auto_472014 ) ) ( not ( = ?auto_472009 ?auto_472015 ) ) ( not ( = ?auto_472010 ?auto_472011 ) ) ( not ( = ?auto_472010 ?auto_472012 ) ) ( not ( = ?auto_472010 ?auto_472013 ) ) ( not ( = ?auto_472010 ?auto_472014 ) ) ( not ( = ?auto_472010 ?auto_472015 ) ) ( not ( = ?auto_472011 ?auto_472012 ) ) ( not ( = ?auto_472011 ?auto_472013 ) ) ( not ( = ?auto_472011 ?auto_472014 ) ) ( not ( = ?auto_472011 ?auto_472015 ) ) ( not ( = ?auto_472012 ?auto_472013 ) ) ( not ( = ?auto_472012 ?auto_472014 ) ) ( not ( = ?auto_472012 ?auto_472015 ) ) ( not ( = ?auto_472013 ?auto_472014 ) ) ( not ( = ?auto_472013 ?auto_472015 ) ) ( not ( = ?auto_472014 ?auto_472015 ) ) ( ON ?auto_472013 ?auto_472014 ) ( ON ?auto_472012 ?auto_472013 ) ( ON ?auto_472011 ?auto_472012 ) ( ON ?auto_472010 ?auto_472011 ) ( CLEAR ?auto_472008 ) ( ON ?auto_472009 ?auto_472010 ) ( CLEAR ?auto_472009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_472007 ?auto_472008 ?auto_472009 )
      ( MAKE-8PILE ?auto_472007 ?auto_472008 ?auto_472009 ?auto_472010 ?auto_472011 ?auto_472012 ?auto_472013 ?auto_472014 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_472041 - BLOCK
      ?auto_472042 - BLOCK
      ?auto_472043 - BLOCK
      ?auto_472044 - BLOCK
      ?auto_472045 - BLOCK
      ?auto_472046 - BLOCK
      ?auto_472047 - BLOCK
      ?auto_472048 - BLOCK
    )
    :vars
    (
      ?auto_472049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472048 ?auto_472049 ) ( ON-TABLE ?auto_472041 ) ( not ( = ?auto_472041 ?auto_472042 ) ) ( not ( = ?auto_472041 ?auto_472043 ) ) ( not ( = ?auto_472041 ?auto_472044 ) ) ( not ( = ?auto_472041 ?auto_472045 ) ) ( not ( = ?auto_472041 ?auto_472046 ) ) ( not ( = ?auto_472041 ?auto_472047 ) ) ( not ( = ?auto_472041 ?auto_472048 ) ) ( not ( = ?auto_472041 ?auto_472049 ) ) ( not ( = ?auto_472042 ?auto_472043 ) ) ( not ( = ?auto_472042 ?auto_472044 ) ) ( not ( = ?auto_472042 ?auto_472045 ) ) ( not ( = ?auto_472042 ?auto_472046 ) ) ( not ( = ?auto_472042 ?auto_472047 ) ) ( not ( = ?auto_472042 ?auto_472048 ) ) ( not ( = ?auto_472042 ?auto_472049 ) ) ( not ( = ?auto_472043 ?auto_472044 ) ) ( not ( = ?auto_472043 ?auto_472045 ) ) ( not ( = ?auto_472043 ?auto_472046 ) ) ( not ( = ?auto_472043 ?auto_472047 ) ) ( not ( = ?auto_472043 ?auto_472048 ) ) ( not ( = ?auto_472043 ?auto_472049 ) ) ( not ( = ?auto_472044 ?auto_472045 ) ) ( not ( = ?auto_472044 ?auto_472046 ) ) ( not ( = ?auto_472044 ?auto_472047 ) ) ( not ( = ?auto_472044 ?auto_472048 ) ) ( not ( = ?auto_472044 ?auto_472049 ) ) ( not ( = ?auto_472045 ?auto_472046 ) ) ( not ( = ?auto_472045 ?auto_472047 ) ) ( not ( = ?auto_472045 ?auto_472048 ) ) ( not ( = ?auto_472045 ?auto_472049 ) ) ( not ( = ?auto_472046 ?auto_472047 ) ) ( not ( = ?auto_472046 ?auto_472048 ) ) ( not ( = ?auto_472046 ?auto_472049 ) ) ( not ( = ?auto_472047 ?auto_472048 ) ) ( not ( = ?auto_472047 ?auto_472049 ) ) ( not ( = ?auto_472048 ?auto_472049 ) ) ( ON ?auto_472047 ?auto_472048 ) ( ON ?auto_472046 ?auto_472047 ) ( ON ?auto_472045 ?auto_472046 ) ( ON ?auto_472044 ?auto_472045 ) ( ON ?auto_472043 ?auto_472044 ) ( CLEAR ?auto_472041 ) ( ON ?auto_472042 ?auto_472043 ) ( CLEAR ?auto_472042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_472041 ?auto_472042 )
      ( MAKE-8PILE ?auto_472041 ?auto_472042 ?auto_472043 ?auto_472044 ?auto_472045 ?auto_472046 ?auto_472047 ?auto_472048 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_472075 - BLOCK
      ?auto_472076 - BLOCK
      ?auto_472077 - BLOCK
      ?auto_472078 - BLOCK
      ?auto_472079 - BLOCK
      ?auto_472080 - BLOCK
      ?auto_472081 - BLOCK
      ?auto_472082 - BLOCK
    )
    :vars
    (
      ?auto_472083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472082 ?auto_472083 ) ( not ( = ?auto_472075 ?auto_472076 ) ) ( not ( = ?auto_472075 ?auto_472077 ) ) ( not ( = ?auto_472075 ?auto_472078 ) ) ( not ( = ?auto_472075 ?auto_472079 ) ) ( not ( = ?auto_472075 ?auto_472080 ) ) ( not ( = ?auto_472075 ?auto_472081 ) ) ( not ( = ?auto_472075 ?auto_472082 ) ) ( not ( = ?auto_472075 ?auto_472083 ) ) ( not ( = ?auto_472076 ?auto_472077 ) ) ( not ( = ?auto_472076 ?auto_472078 ) ) ( not ( = ?auto_472076 ?auto_472079 ) ) ( not ( = ?auto_472076 ?auto_472080 ) ) ( not ( = ?auto_472076 ?auto_472081 ) ) ( not ( = ?auto_472076 ?auto_472082 ) ) ( not ( = ?auto_472076 ?auto_472083 ) ) ( not ( = ?auto_472077 ?auto_472078 ) ) ( not ( = ?auto_472077 ?auto_472079 ) ) ( not ( = ?auto_472077 ?auto_472080 ) ) ( not ( = ?auto_472077 ?auto_472081 ) ) ( not ( = ?auto_472077 ?auto_472082 ) ) ( not ( = ?auto_472077 ?auto_472083 ) ) ( not ( = ?auto_472078 ?auto_472079 ) ) ( not ( = ?auto_472078 ?auto_472080 ) ) ( not ( = ?auto_472078 ?auto_472081 ) ) ( not ( = ?auto_472078 ?auto_472082 ) ) ( not ( = ?auto_472078 ?auto_472083 ) ) ( not ( = ?auto_472079 ?auto_472080 ) ) ( not ( = ?auto_472079 ?auto_472081 ) ) ( not ( = ?auto_472079 ?auto_472082 ) ) ( not ( = ?auto_472079 ?auto_472083 ) ) ( not ( = ?auto_472080 ?auto_472081 ) ) ( not ( = ?auto_472080 ?auto_472082 ) ) ( not ( = ?auto_472080 ?auto_472083 ) ) ( not ( = ?auto_472081 ?auto_472082 ) ) ( not ( = ?auto_472081 ?auto_472083 ) ) ( not ( = ?auto_472082 ?auto_472083 ) ) ( ON ?auto_472081 ?auto_472082 ) ( ON ?auto_472080 ?auto_472081 ) ( ON ?auto_472079 ?auto_472080 ) ( ON ?auto_472078 ?auto_472079 ) ( ON ?auto_472077 ?auto_472078 ) ( ON ?auto_472076 ?auto_472077 ) ( ON ?auto_472075 ?auto_472076 ) ( CLEAR ?auto_472075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_472075 )
      ( MAKE-8PILE ?auto_472075 ?auto_472076 ?auto_472077 ?auto_472078 ?auto_472079 ?auto_472080 ?auto_472081 ?auto_472082 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472110 - BLOCK
      ?auto_472111 - BLOCK
      ?auto_472112 - BLOCK
      ?auto_472113 - BLOCK
      ?auto_472114 - BLOCK
      ?auto_472115 - BLOCK
      ?auto_472116 - BLOCK
      ?auto_472117 - BLOCK
      ?auto_472118 - BLOCK
    )
    :vars
    (
      ?auto_472119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_472117 ) ( ON ?auto_472118 ?auto_472119 ) ( CLEAR ?auto_472118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_472110 ) ( ON ?auto_472111 ?auto_472110 ) ( ON ?auto_472112 ?auto_472111 ) ( ON ?auto_472113 ?auto_472112 ) ( ON ?auto_472114 ?auto_472113 ) ( ON ?auto_472115 ?auto_472114 ) ( ON ?auto_472116 ?auto_472115 ) ( ON ?auto_472117 ?auto_472116 ) ( not ( = ?auto_472110 ?auto_472111 ) ) ( not ( = ?auto_472110 ?auto_472112 ) ) ( not ( = ?auto_472110 ?auto_472113 ) ) ( not ( = ?auto_472110 ?auto_472114 ) ) ( not ( = ?auto_472110 ?auto_472115 ) ) ( not ( = ?auto_472110 ?auto_472116 ) ) ( not ( = ?auto_472110 ?auto_472117 ) ) ( not ( = ?auto_472110 ?auto_472118 ) ) ( not ( = ?auto_472110 ?auto_472119 ) ) ( not ( = ?auto_472111 ?auto_472112 ) ) ( not ( = ?auto_472111 ?auto_472113 ) ) ( not ( = ?auto_472111 ?auto_472114 ) ) ( not ( = ?auto_472111 ?auto_472115 ) ) ( not ( = ?auto_472111 ?auto_472116 ) ) ( not ( = ?auto_472111 ?auto_472117 ) ) ( not ( = ?auto_472111 ?auto_472118 ) ) ( not ( = ?auto_472111 ?auto_472119 ) ) ( not ( = ?auto_472112 ?auto_472113 ) ) ( not ( = ?auto_472112 ?auto_472114 ) ) ( not ( = ?auto_472112 ?auto_472115 ) ) ( not ( = ?auto_472112 ?auto_472116 ) ) ( not ( = ?auto_472112 ?auto_472117 ) ) ( not ( = ?auto_472112 ?auto_472118 ) ) ( not ( = ?auto_472112 ?auto_472119 ) ) ( not ( = ?auto_472113 ?auto_472114 ) ) ( not ( = ?auto_472113 ?auto_472115 ) ) ( not ( = ?auto_472113 ?auto_472116 ) ) ( not ( = ?auto_472113 ?auto_472117 ) ) ( not ( = ?auto_472113 ?auto_472118 ) ) ( not ( = ?auto_472113 ?auto_472119 ) ) ( not ( = ?auto_472114 ?auto_472115 ) ) ( not ( = ?auto_472114 ?auto_472116 ) ) ( not ( = ?auto_472114 ?auto_472117 ) ) ( not ( = ?auto_472114 ?auto_472118 ) ) ( not ( = ?auto_472114 ?auto_472119 ) ) ( not ( = ?auto_472115 ?auto_472116 ) ) ( not ( = ?auto_472115 ?auto_472117 ) ) ( not ( = ?auto_472115 ?auto_472118 ) ) ( not ( = ?auto_472115 ?auto_472119 ) ) ( not ( = ?auto_472116 ?auto_472117 ) ) ( not ( = ?auto_472116 ?auto_472118 ) ) ( not ( = ?auto_472116 ?auto_472119 ) ) ( not ( = ?auto_472117 ?auto_472118 ) ) ( not ( = ?auto_472117 ?auto_472119 ) ) ( not ( = ?auto_472118 ?auto_472119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_472118 ?auto_472119 )
      ( !STACK ?auto_472118 ?auto_472117 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472148 - BLOCK
      ?auto_472149 - BLOCK
      ?auto_472150 - BLOCK
      ?auto_472151 - BLOCK
      ?auto_472152 - BLOCK
      ?auto_472153 - BLOCK
      ?auto_472154 - BLOCK
      ?auto_472155 - BLOCK
      ?auto_472156 - BLOCK
    )
    :vars
    (
      ?auto_472157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472156 ?auto_472157 ) ( ON-TABLE ?auto_472148 ) ( ON ?auto_472149 ?auto_472148 ) ( ON ?auto_472150 ?auto_472149 ) ( ON ?auto_472151 ?auto_472150 ) ( ON ?auto_472152 ?auto_472151 ) ( ON ?auto_472153 ?auto_472152 ) ( ON ?auto_472154 ?auto_472153 ) ( not ( = ?auto_472148 ?auto_472149 ) ) ( not ( = ?auto_472148 ?auto_472150 ) ) ( not ( = ?auto_472148 ?auto_472151 ) ) ( not ( = ?auto_472148 ?auto_472152 ) ) ( not ( = ?auto_472148 ?auto_472153 ) ) ( not ( = ?auto_472148 ?auto_472154 ) ) ( not ( = ?auto_472148 ?auto_472155 ) ) ( not ( = ?auto_472148 ?auto_472156 ) ) ( not ( = ?auto_472148 ?auto_472157 ) ) ( not ( = ?auto_472149 ?auto_472150 ) ) ( not ( = ?auto_472149 ?auto_472151 ) ) ( not ( = ?auto_472149 ?auto_472152 ) ) ( not ( = ?auto_472149 ?auto_472153 ) ) ( not ( = ?auto_472149 ?auto_472154 ) ) ( not ( = ?auto_472149 ?auto_472155 ) ) ( not ( = ?auto_472149 ?auto_472156 ) ) ( not ( = ?auto_472149 ?auto_472157 ) ) ( not ( = ?auto_472150 ?auto_472151 ) ) ( not ( = ?auto_472150 ?auto_472152 ) ) ( not ( = ?auto_472150 ?auto_472153 ) ) ( not ( = ?auto_472150 ?auto_472154 ) ) ( not ( = ?auto_472150 ?auto_472155 ) ) ( not ( = ?auto_472150 ?auto_472156 ) ) ( not ( = ?auto_472150 ?auto_472157 ) ) ( not ( = ?auto_472151 ?auto_472152 ) ) ( not ( = ?auto_472151 ?auto_472153 ) ) ( not ( = ?auto_472151 ?auto_472154 ) ) ( not ( = ?auto_472151 ?auto_472155 ) ) ( not ( = ?auto_472151 ?auto_472156 ) ) ( not ( = ?auto_472151 ?auto_472157 ) ) ( not ( = ?auto_472152 ?auto_472153 ) ) ( not ( = ?auto_472152 ?auto_472154 ) ) ( not ( = ?auto_472152 ?auto_472155 ) ) ( not ( = ?auto_472152 ?auto_472156 ) ) ( not ( = ?auto_472152 ?auto_472157 ) ) ( not ( = ?auto_472153 ?auto_472154 ) ) ( not ( = ?auto_472153 ?auto_472155 ) ) ( not ( = ?auto_472153 ?auto_472156 ) ) ( not ( = ?auto_472153 ?auto_472157 ) ) ( not ( = ?auto_472154 ?auto_472155 ) ) ( not ( = ?auto_472154 ?auto_472156 ) ) ( not ( = ?auto_472154 ?auto_472157 ) ) ( not ( = ?auto_472155 ?auto_472156 ) ) ( not ( = ?auto_472155 ?auto_472157 ) ) ( not ( = ?auto_472156 ?auto_472157 ) ) ( CLEAR ?auto_472154 ) ( ON ?auto_472155 ?auto_472156 ) ( CLEAR ?auto_472155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_472148 ?auto_472149 ?auto_472150 ?auto_472151 ?auto_472152 ?auto_472153 ?auto_472154 ?auto_472155 )
      ( MAKE-9PILE ?auto_472148 ?auto_472149 ?auto_472150 ?auto_472151 ?auto_472152 ?auto_472153 ?auto_472154 ?auto_472155 ?auto_472156 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472186 - BLOCK
      ?auto_472187 - BLOCK
      ?auto_472188 - BLOCK
      ?auto_472189 - BLOCK
      ?auto_472190 - BLOCK
      ?auto_472191 - BLOCK
      ?auto_472192 - BLOCK
      ?auto_472193 - BLOCK
      ?auto_472194 - BLOCK
    )
    :vars
    (
      ?auto_472195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472194 ?auto_472195 ) ( ON-TABLE ?auto_472186 ) ( ON ?auto_472187 ?auto_472186 ) ( ON ?auto_472188 ?auto_472187 ) ( ON ?auto_472189 ?auto_472188 ) ( ON ?auto_472190 ?auto_472189 ) ( ON ?auto_472191 ?auto_472190 ) ( not ( = ?auto_472186 ?auto_472187 ) ) ( not ( = ?auto_472186 ?auto_472188 ) ) ( not ( = ?auto_472186 ?auto_472189 ) ) ( not ( = ?auto_472186 ?auto_472190 ) ) ( not ( = ?auto_472186 ?auto_472191 ) ) ( not ( = ?auto_472186 ?auto_472192 ) ) ( not ( = ?auto_472186 ?auto_472193 ) ) ( not ( = ?auto_472186 ?auto_472194 ) ) ( not ( = ?auto_472186 ?auto_472195 ) ) ( not ( = ?auto_472187 ?auto_472188 ) ) ( not ( = ?auto_472187 ?auto_472189 ) ) ( not ( = ?auto_472187 ?auto_472190 ) ) ( not ( = ?auto_472187 ?auto_472191 ) ) ( not ( = ?auto_472187 ?auto_472192 ) ) ( not ( = ?auto_472187 ?auto_472193 ) ) ( not ( = ?auto_472187 ?auto_472194 ) ) ( not ( = ?auto_472187 ?auto_472195 ) ) ( not ( = ?auto_472188 ?auto_472189 ) ) ( not ( = ?auto_472188 ?auto_472190 ) ) ( not ( = ?auto_472188 ?auto_472191 ) ) ( not ( = ?auto_472188 ?auto_472192 ) ) ( not ( = ?auto_472188 ?auto_472193 ) ) ( not ( = ?auto_472188 ?auto_472194 ) ) ( not ( = ?auto_472188 ?auto_472195 ) ) ( not ( = ?auto_472189 ?auto_472190 ) ) ( not ( = ?auto_472189 ?auto_472191 ) ) ( not ( = ?auto_472189 ?auto_472192 ) ) ( not ( = ?auto_472189 ?auto_472193 ) ) ( not ( = ?auto_472189 ?auto_472194 ) ) ( not ( = ?auto_472189 ?auto_472195 ) ) ( not ( = ?auto_472190 ?auto_472191 ) ) ( not ( = ?auto_472190 ?auto_472192 ) ) ( not ( = ?auto_472190 ?auto_472193 ) ) ( not ( = ?auto_472190 ?auto_472194 ) ) ( not ( = ?auto_472190 ?auto_472195 ) ) ( not ( = ?auto_472191 ?auto_472192 ) ) ( not ( = ?auto_472191 ?auto_472193 ) ) ( not ( = ?auto_472191 ?auto_472194 ) ) ( not ( = ?auto_472191 ?auto_472195 ) ) ( not ( = ?auto_472192 ?auto_472193 ) ) ( not ( = ?auto_472192 ?auto_472194 ) ) ( not ( = ?auto_472192 ?auto_472195 ) ) ( not ( = ?auto_472193 ?auto_472194 ) ) ( not ( = ?auto_472193 ?auto_472195 ) ) ( not ( = ?auto_472194 ?auto_472195 ) ) ( ON ?auto_472193 ?auto_472194 ) ( CLEAR ?auto_472191 ) ( ON ?auto_472192 ?auto_472193 ) ( CLEAR ?auto_472192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_472186 ?auto_472187 ?auto_472188 ?auto_472189 ?auto_472190 ?auto_472191 ?auto_472192 )
      ( MAKE-9PILE ?auto_472186 ?auto_472187 ?auto_472188 ?auto_472189 ?auto_472190 ?auto_472191 ?auto_472192 ?auto_472193 ?auto_472194 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472224 - BLOCK
      ?auto_472225 - BLOCK
      ?auto_472226 - BLOCK
      ?auto_472227 - BLOCK
      ?auto_472228 - BLOCK
      ?auto_472229 - BLOCK
      ?auto_472230 - BLOCK
      ?auto_472231 - BLOCK
      ?auto_472232 - BLOCK
    )
    :vars
    (
      ?auto_472233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472232 ?auto_472233 ) ( ON-TABLE ?auto_472224 ) ( ON ?auto_472225 ?auto_472224 ) ( ON ?auto_472226 ?auto_472225 ) ( ON ?auto_472227 ?auto_472226 ) ( ON ?auto_472228 ?auto_472227 ) ( not ( = ?auto_472224 ?auto_472225 ) ) ( not ( = ?auto_472224 ?auto_472226 ) ) ( not ( = ?auto_472224 ?auto_472227 ) ) ( not ( = ?auto_472224 ?auto_472228 ) ) ( not ( = ?auto_472224 ?auto_472229 ) ) ( not ( = ?auto_472224 ?auto_472230 ) ) ( not ( = ?auto_472224 ?auto_472231 ) ) ( not ( = ?auto_472224 ?auto_472232 ) ) ( not ( = ?auto_472224 ?auto_472233 ) ) ( not ( = ?auto_472225 ?auto_472226 ) ) ( not ( = ?auto_472225 ?auto_472227 ) ) ( not ( = ?auto_472225 ?auto_472228 ) ) ( not ( = ?auto_472225 ?auto_472229 ) ) ( not ( = ?auto_472225 ?auto_472230 ) ) ( not ( = ?auto_472225 ?auto_472231 ) ) ( not ( = ?auto_472225 ?auto_472232 ) ) ( not ( = ?auto_472225 ?auto_472233 ) ) ( not ( = ?auto_472226 ?auto_472227 ) ) ( not ( = ?auto_472226 ?auto_472228 ) ) ( not ( = ?auto_472226 ?auto_472229 ) ) ( not ( = ?auto_472226 ?auto_472230 ) ) ( not ( = ?auto_472226 ?auto_472231 ) ) ( not ( = ?auto_472226 ?auto_472232 ) ) ( not ( = ?auto_472226 ?auto_472233 ) ) ( not ( = ?auto_472227 ?auto_472228 ) ) ( not ( = ?auto_472227 ?auto_472229 ) ) ( not ( = ?auto_472227 ?auto_472230 ) ) ( not ( = ?auto_472227 ?auto_472231 ) ) ( not ( = ?auto_472227 ?auto_472232 ) ) ( not ( = ?auto_472227 ?auto_472233 ) ) ( not ( = ?auto_472228 ?auto_472229 ) ) ( not ( = ?auto_472228 ?auto_472230 ) ) ( not ( = ?auto_472228 ?auto_472231 ) ) ( not ( = ?auto_472228 ?auto_472232 ) ) ( not ( = ?auto_472228 ?auto_472233 ) ) ( not ( = ?auto_472229 ?auto_472230 ) ) ( not ( = ?auto_472229 ?auto_472231 ) ) ( not ( = ?auto_472229 ?auto_472232 ) ) ( not ( = ?auto_472229 ?auto_472233 ) ) ( not ( = ?auto_472230 ?auto_472231 ) ) ( not ( = ?auto_472230 ?auto_472232 ) ) ( not ( = ?auto_472230 ?auto_472233 ) ) ( not ( = ?auto_472231 ?auto_472232 ) ) ( not ( = ?auto_472231 ?auto_472233 ) ) ( not ( = ?auto_472232 ?auto_472233 ) ) ( ON ?auto_472231 ?auto_472232 ) ( ON ?auto_472230 ?auto_472231 ) ( CLEAR ?auto_472228 ) ( ON ?auto_472229 ?auto_472230 ) ( CLEAR ?auto_472229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_472224 ?auto_472225 ?auto_472226 ?auto_472227 ?auto_472228 ?auto_472229 )
      ( MAKE-9PILE ?auto_472224 ?auto_472225 ?auto_472226 ?auto_472227 ?auto_472228 ?auto_472229 ?auto_472230 ?auto_472231 ?auto_472232 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472262 - BLOCK
      ?auto_472263 - BLOCK
      ?auto_472264 - BLOCK
      ?auto_472265 - BLOCK
      ?auto_472266 - BLOCK
      ?auto_472267 - BLOCK
      ?auto_472268 - BLOCK
      ?auto_472269 - BLOCK
      ?auto_472270 - BLOCK
    )
    :vars
    (
      ?auto_472271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472270 ?auto_472271 ) ( ON-TABLE ?auto_472262 ) ( ON ?auto_472263 ?auto_472262 ) ( ON ?auto_472264 ?auto_472263 ) ( ON ?auto_472265 ?auto_472264 ) ( not ( = ?auto_472262 ?auto_472263 ) ) ( not ( = ?auto_472262 ?auto_472264 ) ) ( not ( = ?auto_472262 ?auto_472265 ) ) ( not ( = ?auto_472262 ?auto_472266 ) ) ( not ( = ?auto_472262 ?auto_472267 ) ) ( not ( = ?auto_472262 ?auto_472268 ) ) ( not ( = ?auto_472262 ?auto_472269 ) ) ( not ( = ?auto_472262 ?auto_472270 ) ) ( not ( = ?auto_472262 ?auto_472271 ) ) ( not ( = ?auto_472263 ?auto_472264 ) ) ( not ( = ?auto_472263 ?auto_472265 ) ) ( not ( = ?auto_472263 ?auto_472266 ) ) ( not ( = ?auto_472263 ?auto_472267 ) ) ( not ( = ?auto_472263 ?auto_472268 ) ) ( not ( = ?auto_472263 ?auto_472269 ) ) ( not ( = ?auto_472263 ?auto_472270 ) ) ( not ( = ?auto_472263 ?auto_472271 ) ) ( not ( = ?auto_472264 ?auto_472265 ) ) ( not ( = ?auto_472264 ?auto_472266 ) ) ( not ( = ?auto_472264 ?auto_472267 ) ) ( not ( = ?auto_472264 ?auto_472268 ) ) ( not ( = ?auto_472264 ?auto_472269 ) ) ( not ( = ?auto_472264 ?auto_472270 ) ) ( not ( = ?auto_472264 ?auto_472271 ) ) ( not ( = ?auto_472265 ?auto_472266 ) ) ( not ( = ?auto_472265 ?auto_472267 ) ) ( not ( = ?auto_472265 ?auto_472268 ) ) ( not ( = ?auto_472265 ?auto_472269 ) ) ( not ( = ?auto_472265 ?auto_472270 ) ) ( not ( = ?auto_472265 ?auto_472271 ) ) ( not ( = ?auto_472266 ?auto_472267 ) ) ( not ( = ?auto_472266 ?auto_472268 ) ) ( not ( = ?auto_472266 ?auto_472269 ) ) ( not ( = ?auto_472266 ?auto_472270 ) ) ( not ( = ?auto_472266 ?auto_472271 ) ) ( not ( = ?auto_472267 ?auto_472268 ) ) ( not ( = ?auto_472267 ?auto_472269 ) ) ( not ( = ?auto_472267 ?auto_472270 ) ) ( not ( = ?auto_472267 ?auto_472271 ) ) ( not ( = ?auto_472268 ?auto_472269 ) ) ( not ( = ?auto_472268 ?auto_472270 ) ) ( not ( = ?auto_472268 ?auto_472271 ) ) ( not ( = ?auto_472269 ?auto_472270 ) ) ( not ( = ?auto_472269 ?auto_472271 ) ) ( not ( = ?auto_472270 ?auto_472271 ) ) ( ON ?auto_472269 ?auto_472270 ) ( ON ?auto_472268 ?auto_472269 ) ( ON ?auto_472267 ?auto_472268 ) ( CLEAR ?auto_472265 ) ( ON ?auto_472266 ?auto_472267 ) ( CLEAR ?auto_472266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_472262 ?auto_472263 ?auto_472264 ?auto_472265 ?auto_472266 )
      ( MAKE-9PILE ?auto_472262 ?auto_472263 ?auto_472264 ?auto_472265 ?auto_472266 ?auto_472267 ?auto_472268 ?auto_472269 ?auto_472270 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472300 - BLOCK
      ?auto_472301 - BLOCK
      ?auto_472302 - BLOCK
      ?auto_472303 - BLOCK
      ?auto_472304 - BLOCK
      ?auto_472305 - BLOCK
      ?auto_472306 - BLOCK
      ?auto_472307 - BLOCK
      ?auto_472308 - BLOCK
    )
    :vars
    (
      ?auto_472309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472308 ?auto_472309 ) ( ON-TABLE ?auto_472300 ) ( ON ?auto_472301 ?auto_472300 ) ( ON ?auto_472302 ?auto_472301 ) ( not ( = ?auto_472300 ?auto_472301 ) ) ( not ( = ?auto_472300 ?auto_472302 ) ) ( not ( = ?auto_472300 ?auto_472303 ) ) ( not ( = ?auto_472300 ?auto_472304 ) ) ( not ( = ?auto_472300 ?auto_472305 ) ) ( not ( = ?auto_472300 ?auto_472306 ) ) ( not ( = ?auto_472300 ?auto_472307 ) ) ( not ( = ?auto_472300 ?auto_472308 ) ) ( not ( = ?auto_472300 ?auto_472309 ) ) ( not ( = ?auto_472301 ?auto_472302 ) ) ( not ( = ?auto_472301 ?auto_472303 ) ) ( not ( = ?auto_472301 ?auto_472304 ) ) ( not ( = ?auto_472301 ?auto_472305 ) ) ( not ( = ?auto_472301 ?auto_472306 ) ) ( not ( = ?auto_472301 ?auto_472307 ) ) ( not ( = ?auto_472301 ?auto_472308 ) ) ( not ( = ?auto_472301 ?auto_472309 ) ) ( not ( = ?auto_472302 ?auto_472303 ) ) ( not ( = ?auto_472302 ?auto_472304 ) ) ( not ( = ?auto_472302 ?auto_472305 ) ) ( not ( = ?auto_472302 ?auto_472306 ) ) ( not ( = ?auto_472302 ?auto_472307 ) ) ( not ( = ?auto_472302 ?auto_472308 ) ) ( not ( = ?auto_472302 ?auto_472309 ) ) ( not ( = ?auto_472303 ?auto_472304 ) ) ( not ( = ?auto_472303 ?auto_472305 ) ) ( not ( = ?auto_472303 ?auto_472306 ) ) ( not ( = ?auto_472303 ?auto_472307 ) ) ( not ( = ?auto_472303 ?auto_472308 ) ) ( not ( = ?auto_472303 ?auto_472309 ) ) ( not ( = ?auto_472304 ?auto_472305 ) ) ( not ( = ?auto_472304 ?auto_472306 ) ) ( not ( = ?auto_472304 ?auto_472307 ) ) ( not ( = ?auto_472304 ?auto_472308 ) ) ( not ( = ?auto_472304 ?auto_472309 ) ) ( not ( = ?auto_472305 ?auto_472306 ) ) ( not ( = ?auto_472305 ?auto_472307 ) ) ( not ( = ?auto_472305 ?auto_472308 ) ) ( not ( = ?auto_472305 ?auto_472309 ) ) ( not ( = ?auto_472306 ?auto_472307 ) ) ( not ( = ?auto_472306 ?auto_472308 ) ) ( not ( = ?auto_472306 ?auto_472309 ) ) ( not ( = ?auto_472307 ?auto_472308 ) ) ( not ( = ?auto_472307 ?auto_472309 ) ) ( not ( = ?auto_472308 ?auto_472309 ) ) ( ON ?auto_472307 ?auto_472308 ) ( ON ?auto_472306 ?auto_472307 ) ( ON ?auto_472305 ?auto_472306 ) ( ON ?auto_472304 ?auto_472305 ) ( CLEAR ?auto_472302 ) ( ON ?auto_472303 ?auto_472304 ) ( CLEAR ?auto_472303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_472300 ?auto_472301 ?auto_472302 ?auto_472303 )
      ( MAKE-9PILE ?auto_472300 ?auto_472301 ?auto_472302 ?auto_472303 ?auto_472304 ?auto_472305 ?auto_472306 ?auto_472307 ?auto_472308 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472338 - BLOCK
      ?auto_472339 - BLOCK
      ?auto_472340 - BLOCK
      ?auto_472341 - BLOCK
      ?auto_472342 - BLOCK
      ?auto_472343 - BLOCK
      ?auto_472344 - BLOCK
      ?auto_472345 - BLOCK
      ?auto_472346 - BLOCK
    )
    :vars
    (
      ?auto_472347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472346 ?auto_472347 ) ( ON-TABLE ?auto_472338 ) ( ON ?auto_472339 ?auto_472338 ) ( not ( = ?auto_472338 ?auto_472339 ) ) ( not ( = ?auto_472338 ?auto_472340 ) ) ( not ( = ?auto_472338 ?auto_472341 ) ) ( not ( = ?auto_472338 ?auto_472342 ) ) ( not ( = ?auto_472338 ?auto_472343 ) ) ( not ( = ?auto_472338 ?auto_472344 ) ) ( not ( = ?auto_472338 ?auto_472345 ) ) ( not ( = ?auto_472338 ?auto_472346 ) ) ( not ( = ?auto_472338 ?auto_472347 ) ) ( not ( = ?auto_472339 ?auto_472340 ) ) ( not ( = ?auto_472339 ?auto_472341 ) ) ( not ( = ?auto_472339 ?auto_472342 ) ) ( not ( = ?auto_472339 ?auto_472343 ) ) ( not ( = ?auto_472339 ?auto_472344 ) ) ( not ( = ?auto_472339 ?auto_472345 ) ) ( not ( = ?auto_472339 ?auto_472346 ) ) ( not ( = ?auto_472339 ?auto_472347 ) ) ( not ( = ?auto_472340 ?auto_472341 ) ) ( not ( = ?auto_472340 ?auto_472342 ) ) ( not ( = ?auto_472340 ?auto_472343 ) ) ( not ( = ?auto_472340 ?auto_472344 ) ) ( not ( = ?auto_472340 ?auto_472345 ) ) ( not ( = ?auto_472340 ?auto_472346 ) ) ( not ( = ?auto_472340 ?auto_472347 ) ) ( not ( = ?auto_472341 ?auto_472342 ) ) ( not ( = ?auto_472341 ?auto_472343 ) ) ( not ( = ?auto_472341 ?auto_472344 ) ) ( not ( = ?auto_472341 ?auto_472345 ) ) ( not ( = ?auto_472341 ?auto_472346 ) ) ( not ( = ?auto_472341 ?auto_472347 ) ) ( not ( = ?auto_472342 ?auto_472343 ) ) ( not ( = ?auto_472342 ?auto_472344 ) ) ( not ( = ?auto_472342 ?auto_472345 ) ) ( not ( = ?auto_472342 ?auto_472346 ) ) ( not ( = ?auto_472342 ?auto_472347 ) ) ( not ( = ?auto_472343 ?auto_472344 ) ) ( not ( = ?auto_472343 ?auto_472345 ) ) ( not ( = ?auto_472343 ?auto_472346 ) ) ( not ( = ?auto_472343 ?auto_472347 ) ) ( not ( = ?auto_472344 ?auto_472345 ) ) ( not ( = ?auto_472344 ?auto_472346 ) ) ( not ( = ?auto_472344 ?auto_472347 ) ) ( not ( = ?auto_472345 ?auto_472346 ) ) ( not ( = ?auto_472345 ?auto_472347 ) ) ( not ( = ?auto_472346 ?auto_472347 ) ) ( ON ?auto_472345 ?auto_472346 ) ( ON ?auto_472344 ?auto_472345 ) ( ON ?auto_472343 ?auto_472344 ) ( ON ?auto_472342 ?auto_472343 ) ( ON ?auto_472341 ?auto_472342 ) ( CLEAR ?auto_472339 ) ( ON ?auto_472340 ?auto_472341 ) ( CLEAR ?auto_472340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_472338 ?auto_472339 ?auto_472340 )
      ( MAKE-9PILE ?auto_472338 ?auto_472339 ?auto_472340 ?auto_472341 ?auto_472342 ?auto_472343 ?auto_472344 ?auto_472345 ?auto_472346 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472376 - BLOCK
      ?auto_472377 - BLOCK
      ?auto_472378 - BLOCK
      ?auto_472379 - BLOCK
      ?auto_472380 - BLOCK
      ?auto_472381 - BLOCK
      ?auto_472382 - BLOCK
      ?auto_472383 - BLOCK
      ?auto_472384 - BLOCK
    )
    :vars
    (
      ?auto_472385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472384 ?auto_472385 ) ( ON-TABLE ?auto_472376 ) ( not ( = ?auto_472376 ?auto_472377 ) ) ( not ( = ?auto_472376 ?auto_472378 ) ) ( not ( = ?auto_472376 ?auto_472379 ) ) ( not ( = ?auto_472376 ?auto_472380 ) ) ( not ( = ?auto_472376 ?auto_472381 ) ) ( not ( = ?auto_472376 ?auto_472382 ) ) ( not ( = ?auto_472376 ?auto_472383 ) ) ( not ( = ?auto_472376 ?auto_472384 ) ) ( not ( = ?auto_472376 ?auto_472385 ) ) ( not ( = ?auto_472377 ?auto_472378 ) ) ( not ( = ?auto_472377 ?auto_472379 ) ) ( not ( = ?auto_472377 ?auto_472380 ) ) ( not ( = ?auto_472377 ?auto_472381 ) ) ( not ( = ?auto_472377 ?auto_472382 ) ) ( not ( = ?auto_472377 ?auto_472383 ) ) ( not ( = ?auto_472377 ?auto_472384 ) ) ( not ( = ?auto_472377 ?auto_472385 ) ) ( not ( = ?auto_472378 ?auto_472379 ) ) ( not ( = ?auto_472378 ?auto_472380 ) ) ( not ( = ?auto_472378 ?auto_472381 ) ) ( not ( = ?auto_472378 ?auto_472382 ) ) ( not ( = ?auto_472378 ?auto_472383 ) ) ( not ( = ?auto_472378 ?auto_472384 ) ) ( not ( = ?auto_472378 ?auto_472385 ) ) ( not ( = ?auto_472379 ?auto_472380 ) ) ( not ( = ?auto_472379 ?auto_472381 ) ) ( not ( = ?auto_472379 ?auto_472382 ) ) ( not ( = ?auto_472379 ?auto_472383 ) ) ( not ( = ?auto_472379 ?auto_472384 ) ) ( not ( = ?auto_472379 ?auto_472385 ) ) ( not ( = ?auto_472380 ?auto_472381 ) ) ( not ( = ?auto_472380 ?auto_472382 ) ) ( not ( = ?auto_472380 ?auto_472383 ) ) ( not ( = ?auto_472380 ?auto_472384 ) ) ( not ( = ?auto_472380 ?auto_472385 ) ) ( not ( = ?auto_472381 ?auto_472382 ) ) ( not ( = ?auto_472381 ?auto_472383 ) ) ( not ( = ?auto_472381 ?auto_472384 ) ) ( not ( = ?auto_472381 ?auto_472385 ) ) ( not ( = ?auto_472382 ?auto_472383 ) ) ( not ( = ?auto_472382 ?auto_472384 ) ) ( not ( = ?auto_472382 ?auto_472385 ) ) ( not ( = ?auto_472383 ?auto_472384 ) ) ( not ( = ?auto_472383 ?auto_472385 ) ) ( not ( = ?auto_472384 ?auto_472385 ) ) ( ON ?auto_472383 ?auto_472384 ) ( ON ?auto_472382 ?auto_472383 ) ( ON ?auto_472381 ?auto_472382 ) ( ON ?auto_472380 ?auto_472381 ) ( ON ?auto_472379 ?auto_472380 ) ( ON ?auto_472378 ?auto_472379 ) ( CLEAR ?auto_472376 ) ( ON ?auto_472377 ?auto_472378 ) ( CLEAR ?auto_472377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_472376 ?auto_472377 )
      ( MAKE-9PILE ?auto_472376 ?auto_472377 ?auto_472378 ?auto_472379 ?auto_472380 ?auto_472381 ?auto_472382 ?auto_472383 ?auto_472384 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_472414 - BLOCK
      ?auto_472415 - BLOCK
      ?auto_472416 - BLOCK
      ?auto_472417 - BLOCK
      ?auto_472418 - BLOCK
      ?auto_472419 - BLOCK
      ?auto_472420 - BLOCK
      ?auto_472421 - BLOCK
      ?auto_472422 - BLOCK
    )
    :vars
    (
      ?auto_472423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472422 ?auto_472423 ) ( not ( = ?auto_472414 ?auto_472415 ) ) ( not ( = ?auto_472414 ?auto_472416 ) ) ( not ( = ?auto_472414 ?auto_472417 ) ) ( not ( = ?auto_472414 ?auto_472418 ) ) ( not ( = ?auto_472414 ?auto_472419 ) ) ( not ( = ?auto_472414 ?auto_472420 ) ) ( not ( = ?auto_472414 ?auto_472421 ) ) ( not ( = ?auto_472414 ?auto_472422 ) ) ( not ( = ?auto_472414 ?auto_472423 ) ) ( not ( = ?auto_472415 ?auto_472416 ) ) ( not ( = ?auto_472415 ?auto_472417 ) ) ( not ( = ?auto_472415 ?auto_472418 ) ) ( not ( = ?auto_472415 ?auto_472419 ) ) ( not ( = ?auto_472415 ?auto_472420 ) ) ( not ( = ?auto_472415 ?auto_472421 ) ) ( not ( = ?auto_472415 ?auto_472422 ) ) ( not ( = ?auto_472415 ?auto_472423 ) ) ( not ( = ?auto_472416 ?auto_472417 ) ) ( not ( = ?auto_472416 ?auto_472418 ) ) ( not ( = ?auto_472416 ?auto_472419 ) ) ( not ( = ?auto_472416 ?auto_472420 ) ) ( not ( = ?auto_472416 ?auto_472421 ) ) ( not ( = ?auto_472416 ?auto_472422 ) ) ( not ( = ?auto_472416 ?auto_472423 ) ) ( not ( = ?auto_472417 ?auto_472418 ) ) ( not ( = ?auto_472417 ?auto_472419 ) ) ( not ( = ?auto_472417 ?auto_472420 ) ) ( not ( = ?auto_472417 ?auto_472421 ) ) ( not ( = ?auto_472417 ?auto_472422 ) ) ( not ( = ?auto_472417 ?auto_472423 ) ) ( not ( = ?auto_472418 ?auto_472419 ) ) ( not ( = ?auto_472418 ?auto_472420 ) ) ( not ( = ?auto_472418 ?auto_472421 ) ) ( not ( = ?auto_472418 ?auto_472422 ) ) ( not ( = ?auto_472418 ?auto_472423 ) ) ( not ( = ?auto_472419 ?auto_472420 ) ) ( not ( = ?auto_472419 ?auto_472421 ) ) ( not ( = ?auto_472419 ?auto_472422 ) ) ( not ( = ?auto_472419 ?auto_472423 ) ) ( not ( = ?auto_472420 ?auto_472421 ) ) ( not ( = ?auto_472420 ?auto_472422 ) ) ( not ( = ?auto_472420 ?auto_472423 ) ) ( not ( = ?auto_472421 ?auto_472422 ) ) ( not ( = ?auto_472421 ?auto_472423 ) ) ( not ( = ?auto_472422 ?auto_472423 ) ) ( ON ?auto_472421 ?auto_472422 ) ( ON ?auto_472420 ?auto_472421 ) ( ON ?auto_472419 ?auto_472420 ) ( ON ?auto_472418 ?auto_472419 ) ( ON ?auto_472417 ?auto_472418 ) ( ON ?auto_472416 ?auto_472417 ) ( ON ?auto_472415 ?auto_472416 ) ( ON ?auto_472414 ?auto_472415 ) ( CLEAR ?auto_472414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_472414 )
      ( MAKE-9PILE ?auto_472414 ?auto_472415 ?auto_472416 ?auto_472417 ?auto_472418 ?auto_472419 ?auto_472420 ?auto_472421 ?auto_472422 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472453 - BLOCK
      ?auto_472454 - BLOCK
      ?auto_472455 - BLOCK
      ?auto_472456 - BLOCK
      ?auto_472457 - BLOCK
      ?auto_472458 - BLOCK
      ?auto_472459 - BLOCK
      ?auto_472460 - BLOCK
      ?auto_472461 - BLOCK
      ?auto_472462 - BLOCK
    )
    :vars
    (
      ?auto_472463 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_472461 ) ( ON ?auto_472462 ?auto_472463 ) ( CLEAR ?auto_472462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_472453 ) ( ON ?auto_472454 ?auto_472453 ) ( ON ?auto_472455 ?auto_472454 ) ( ON ?auto_472456 ?auto_472455 ) ( ON ?auto_472457 ?auto_472456 ) ( ON ?auto_472458 ?auto_472457 ) ( ON ?auto_472459 ?auto_472458 ) ( ON ?auto_472460 ?auto_472459 ) ( ON ?auto_472461 ?auto_472460 ) ( not ( = ?auto_472453 ?auto_472454 ) ) ( not ( = ?auto_472453 ?auto_472455 ) ) ( not ( = ?auto_472453 ?auto_472456 ) ) ( not ( = ?auto_472453 ?auto_472457 ) ) ( not ( = ?auto_472453 ?auto_472458 ) ) ( not ( = ?auto_472453 ?auto_472459 ) ) ( not ( = ?auto_472453 ?auto_472460 ) ) ( not ( = ?auto_472453 ?auto_472461 ) ) ( not ( = ?auto_472453 ?auto_472462 ) ) ( not ( = ?auto_472453 ?auto_472463 ) ) ( not ( = ?auto_472454 ?auto_472455 ) ) ( not ( = ?auto_472454 ?auto_472456 ) ) ( not ( = ?auto_472454 ?auto_472457 ) ) ( not ( = ?auto_472454 ?auto_472458 ) ) ( not ( = ?auto_472454 ?auto_472459 ) ) ( not ( = ?auto_472454 ?auto_472460 ) ) ( not ( = ?auto_472454 ?auto_472461 ) ) ( not ( = ?auto_472454 ?auto_472462 ) ) ( not ( = ?auto_472454 ?auto_472463 ) ) ( not ( = ?auto_472455 ?auto_472456 ) ) ( not ( = ?auto_472455 ?auto_472457 ) ) ( not ( = ?auto_472455 ?auto_472458 ) ) ( not ( = ?auto_472455 ?auto_472459 ) ) ( not ( = ?auto_472455 ?auto_472460 ) ) ( not ( = ?auto_472455 ?auto_472461 ) ) ( not ( = ?auto_472455 ?auto_472462 ) ) ( not ( = ?auto_472455 ?auto_472463 ) ) ( not ( = ?auto_472456 ?auto_472457 ) ) ( not ( = ?auto_472456 ?auto_472458 ) ) ( not ( = ?auto_472456 ?auto_472459 ) ) ( not ( = ?auto_472456 ?auto_472460 ) ) ( not ( = ?auto_472456 ?auto_472461 ) ) ( not ( = ?auto_472456 ?auto_472462 ) ) ( not ( = ?auto_472456 ?auto_472463 ) ) ( not ( = ?auto_472457 ?auto_472458 ) ) ( not ( = ?auto_472457 ?auto_472459 ) ) ( not ( = ?auto_472457 ?auto_472460 ) ) ( not ( = ?auto_472457 ?auto_472461 ) ) ( not ( = ?auto_472457 ?auto_472462 ) ) ( not ( = ?auto_472457 ?auto_472463 ) ) ( not ( = ?auto_472458 ?auto_472459 ) ) ( not ( = ?auto_472458 ?auto_472460 ) ) ( not ( = ?auto_472458 ?auto_472461 ) ) ( not ( = ?auto_472458 ?auto_472462 ) ) ( not ( = ?auto_472458 ?auto_472463 ) ) ( not ( = ?auto_472459 ?auto_472460 ) ) ( not ( = ?auto_472459 ?auto_472461 ) ) ( not ( = ?auto_472459 ?auto_472462 ) ) ( not ( = ?auto_472459 ?auto_472463 ) ) ( not ( = ?auto_472460 ?auto_472461 ) ) ( not ( = ?auto_472460 ?auto_472462 ) ) ( not ( = ?auto_472460 ?auto_472463 ) ) ( not ( = ?auto_472461 ?auto_472462 ) ) ( not ( = ?auto_472461 ?auto_472463 ) ) ( not ( = ?auto_472462 ?auto_472463 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_472462 ?auto_472463 )
      ( !STACK ?auto_472462 ?auto_472461 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472495 - BLOCK
      ?auto_472496 - BLOCK
      ?auto_472497 - BLOCK
      ?auto_472498 - BLOCK
      ?auto_472499 - BLOCK
      ?auto_472500 - BLOCK
      ?auto_472501 - BLOCK
      ?auto_472502 - BLOCK
      ?auto_472503 - BLOCK
      ?auto_472504 - BLOCK
    )
    :vars
    (
      ?auto_472505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472504 ?auto_472505 ) ( ON-TABLE ?auto_472495 ) ( ON ?auto_472496 ?auto_472495 ) ( ON ?auto_472497 ?auto_472496 ) ( ON ?auto_472498 ?auto_472497 ) ( ON ?auto_472499 ?auto_472498 ) ( ON ?auto_472500 ?auto_472499 ) ( ON ?auto_472501 ?auto_472500 ) ( ON ?auto_472502 ?auto_472501 ) ( not ( = ?auto_472495 ?auto_472496 ) ) ( not ( = ?auto_472495 ?auto_472497 ) ) ( not ( = ?auto_472495 ?auto_472498 ) ) ( not ( = ?auto_472495 ?auto_472499 ) ) ( not ( = ?auto_472495 ?auto_472500 ) ) ( not ( = ?auto_472495 ?auto_472501 ) ) ( not ( = ?auto_472495 ?auto_472502 ) ) ( not ( = ?auto_472495 ?auto_472503 ) ) ( not ( = ?auto_472495 ?auto_472504 ) ) ( not ( = ?auto_472495 ?auto_472505 ) ) ( not ( = ?auto_472496 ?auto_472497 ) ) ( not ( = ?auto_472496 ?auto_472498 ) ) ( not ( = ?auto_472496 ?auto_472499 ) ) ( not ( = ?auto_472496 ?auto_472500 ) ) ( not ( = ?auto_472496 ?auto_472501 ) ) ( not ( = ?auto_472496 ?auto_472502 ) ) ( not ( = ?auto_472496 ?auto_472503 ) ) ( not ( = ?auto_472496 ?auto_472504 ) ) ( not ( = ?auto_472496 ?auto_472505 ) ) ( not ( = ?auto_472497 ?auto_472498 ) ) ( not ( = ?auto_472497 ?auto_472499 ) ) ( not ( = ?auto_472497 ?auto_472500 ) ) ( not ( = ?auto_472497 ?auto_472501 ) ) ( not ( = ?auto_472497 ?auto_472502 ) ) ( not ( = ?auto_472497 ?auto_472503 ) ) ( not ( = ?auto_472497 ?auto_472504 ) ) ( not ( = ?auto_472497 ?auto_472505 ) ) ( not ( = ?auto_472498 ?auto_472499 ) ) ( not ( = ?auto_472498 ?auto_472500 ) ) ( not ( = ?auto_472498 ?auto_472501 ) ) ( not ( = ?auto_472498 ?auto_472502 ) ) ( not ( = ?auto_472498 ?auto_472503 ) ) ( not ( = ?auto_472498 ?auto_472504 ) ) ( not ( = ?auto_472498 ?auto_472505 ) ) ( not ( = ?auto_472499 ?auto_472500 ) ) ( not ( = ?auto_472499 ?auto_472501 ) ) ( not ( = ?auto_472499 ?auto_472502 ) ) ( not ( = ?auto_472499 ?auto_472503 ) ) ( not ( = ?auto_472499 ?auto_472504 ) ) ( not ( = ?auto_472499 ?auto_472505 ) ) ( not ( = ?auto_472500 ?auto_472501 ) ) ( not ( = ?auto_472500 ?auto_472502 ) ) ( not ( = ?auto_472500 ?auto_472503 ) ) ( not ( = ?auto_472500 ?auto_472504 ) ) ( not ( = ?auto_472500 ?auto_472505 ) ) ( not ( = ?auto_472501 ?auto_472502 ) ) ( not ( = ?auto_472501 ?auto_472503 ) ) ( not ( = ?auto_472501 ?auto_472504 ) ) ( not ( = ?auto_472501 ?auto_472505 ) ) ( not ( = ?auto_472502 ?auto_472503 ) ) ( not ( = ?auto_472502 ?auto_472504 ) ) ( not ( = ?auto_472502 ?auto_472505 ) ) ( not ( = ?auto_472503 ?auto_472504 ) ) ( not ( = ?auto_472503 ?auto_472505 ) ) ( not ( = ?auto_472504 ?auto_472505 ) ) ( CLEAR ?auto_472502 ) ( ON ?auto_472503 ?auto_472504 ) ( CLEAR ?auto_472503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_472495 ?auto_472496 ?auto_472497 ?auto_472498 ?auto_472499 ?auto_472500 ?auto_472501 ?auto_472502 ?auto_472503 )
      ( MAKE-10PILE ?auto_472495 ?auto_472496 ?auto_472497 ?auto_472498 ?auto_472499 ?auto_472500 ?auto_472501 ?auto_472502 ?auto_472503 ?auto_472504 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472537 - BLOCK
      ?auto_472538 - BLOCK
      ?auto_472539 - BLOCK
      ?auto_472540 - BLOCK
      ?auto_472541 - BLOCK
      ?auto_472542 - BLOCK
      ?auto_472543 - BLOCK
      ?auto_472544 - BLOCK
      ?auto_472545 - BLOCK
      ?auto_472546 - BLOCK
    )
    :vars
    (
      ?auto_472547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472546 ?auto_472547 ) ( ON-TABLE ?auto_472537 ) ( ON ?auto_472538 ?auto_472537 ) ( ON ?auto_472539 ?auto_472538 ) ( ON ?auto_472540 ?auto_472539 ) ( ON ?auto_472541 ?auto_472540 ) ( ON ?auto_472542 ?auto_472541 ) ( ON ?auto_472543 ?auto_472542 ) ( not ( = ?auto_472537 ?auto_472538 ) ) ( not ( = ?auto_472537 ?auto_472539 ) ) ( not ( = ?auto_472537 ?auto_472540 ) ) ( not ( = ?auto_472537 ?auto_472541 ) ) ( not ( = ?auto_472537 ?auto_472542 ) ) ( not ( = ?auto_472537 ?auto_472543 ) ) ( not ( = ?auto_472537 ?auto_472544 ) ) ( not ( = ?auto_472537 ?auto_472545 ) ) ( not ( = ?auto_472537 ?auto_472546 ) ) ( not ( = ?auto_472537 ?auto_472547 ) ) ( not ( = ?auto_472538 ?auto_472539 ) ) ( not ( = ?auto_472538 ?auto_472540 ) ) ( not ( = ?auto_472538 ?auto_472541 ) ) ( not ( = ?auto_472538 ?auto_472542 ) ) ( not ( = ?auto_472538 ?auto_472543 ) ) ( not ( = ?auto_472538 ?auto_472544 ) ) ( not ( = ?auto_472538 ?auto_472545 ) ) ( not ( = ?auto_472538 ?auto_472546 ) ) ( not ( = ?auto_472538 ?auto_472547 ) ) ( not ( = ?auto_472539 ?auto_472540 ) ) ( not ( = ?auto_472539 ?auto_472541 ) ) ( not ( = ?auto_472539 ?auto_472542 ) ) ( not ( = ?auto_472539 ?auto_472543 ) ) ( not ( = ?auto_472539 ?auto_472544 ) ) ( not ( = ?auto_472539 ?auto_472545 ) ) ( not ( = ?auto_472539 ?auto_472546 ) ) ( not ( = ?auto_472539 ?auto_472547 ) ) ( not ( = ?auto_472540 ?auto_472541 ) ) ( not ( = ?auto_472540 ?auto_472542 ) ) ( not ( = ?auto_472540 ?auto_472543 ) ) ( not ( = ?auto_472540 ?auto_472544 ) ) ( not ( = ?auto_472540 ?auto_472545 ) ) ( not ( = ?auto_472540 ?auto_472546 ) ) ( not ( = ?auto_472540 ?auto_472547 ) ) ( not ( = ?auto_472541 ?auto_472542 ) ) ( not ( = ?auto_472541 ?auto_472543 ) ) ( not ( = ?auto_472541 ?auto_472544 ) ) ( not ( = ?auto_472541 ?auto_472545 ) ) ( not ( = ?auto_472541 ?auto_472546 ) ) ( not ( = ?auto_472541 ?auto_472547 ) ) ( not ( = ?auto_472542 ?auto_472543 ) ) ( not ( = ?auto_472542 ?auto_472544 ) ) ( not ( = ?auto_472542 ?auto_472545 ) ) ( not ( = ?auto_472542 ?auto_472546 ) ) ( not ( = ?auto_472542 ?auto_472547 ) ) ( not ( = ?auto_472543 ?auto_472544 ) ) ( not ( = ?auto_472543 ?auto_472545 ) ) ( not ( = ?auto_472543 ?auto_472546 ) ) ( not ( = ?auto_472543 ?auto_472547 ) ) ( not ( = ?auto_472544 ?auto_472545 ) ) ( not ( = ?auto_472544 ?auto_472546 ) ) ( not ( = ?auto_472544 ?auto_472547 ) ) ( not ( = ?auto_472545 ?auto_472546 ) ) ( not ( = ?auto_472545 ?auto_472547 ) ) ( not ( = ?auto_472546 ?auto_472547 ) ) ( ON ?auto_472545 ?auto_472546 ) ( CLEAR ?auto_472543 ) ( ON ?auto_472544 ?auto_472545 ) ( CLEAR ?auto_472544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_472537 ?auto_472538 ?auto_472539 ?auto_472540 ?auto_472541 ?auto_472542 ?auto_472543 ?auto_472544 )
      ( MAKE-10PILE ?auto_472537 ?auto_472538 ?auto_472539 ?auto_472540 ?auto_472541 ?auto_472542 ?auto_472543 ?auto_472544 ?auto_472545 ?auto_472546 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472579 - BLOCK
      ?auto_472580 - BLOCK
      ?auto_472581 - BLOCK
      ?auto_472582 - BLOCK
      ?auto_472583 - BLOCK
      ?auto_472584 - BLOCK
      ?auto_472585 - BLOCK
      ?auto_472586 - BLOCK
      ?auto_472587 - BLOCK
      ?auto_472588 - BLOCK
    )
    :vars
    (
      ?auto_472589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472588 ?auto_472589 ) ( ON-TABLE ?auto_472579 ) ( ON ?auto_472580 ?auto_472579 ) ( ON ?auto_472581 ?auto_472580 ) ( ON ?auto_472582 ?auto_472581 ) ( ON ?auto_472583 ?auto_472582 ) ( ON ?auto_472584 ?auto_472583 ) ( not ( = ?auto_472579 ?auto_472580 ) ) ( not ( = ?auto_472579 ?auto_472581 ) ) ( not ( = ?auto_472579 ?auto_472582 ) ) ( not ( = ?auto_472579 ?auto_472583 ) ) ( not ( = ?auto_472579 ?auto_472584 ) ) ( not ( = ?auto_472579 ?auto_472585 ) ) ( not ( = ?auto_472579 ?auto_472586 ) ) ( not ( = ?auto_472579 ?auto_472587 ) ) ( not ( = ?auto_472579 ?auto_472588 ) ) ( not ( = ?auto_472579 ?auto_472589 ) ) ( not ( = ?auto_472580 ?auto_472581 ) ) ( not ( = ?auto_472580 ?auto_472582 ) ) ( not ( = ?auto_472580 ?auto_472583 ) ) ( not ( = ?auto_472580 ?auto_472584 ) ) ( not ( = ?auto_472580 ?auto_472585 ) ) ( not ( = ?auto_472580 ?auto_472586 ) ) ( not ( = ?auto_472580 ?auto_472587 ) ) ( not ( = ?auto_472580 ?auto_472588 ) ) ( not ( = ?auto_472580 ?auto_472589 ) ) ( not ( = ?auto_472581 ?auto_472582 ) ) ( not ( = ?auto_472581 ?auto_472583 ) ) ( not ( = ?auto_472581 ?auto_472584 ) ) ( not ( = ?auto_472581 ?auto_472585 ) ) ( not ( = ?auto_472581 ?auto_472586 ) ) ( not ( = ?auto_472581 ?auto_472587 ) ) ( not ( = ?auto_472581 ?auto_472588 ) ) ( not ( = ?auto_472581 ?auto_472589 ) ) ( not ( = ?auto_472582 ?auto_472583 ) ) ( not ( = ?auto_472582 ?auto_472584 ) ) ( not ( = ?auto_472582 ?auto_472585 ) ) ( not ( = ?auto_472582 ?auto_472586 ) ) ( not ( = ?auto_472582 ?auto_472587 ) ) ( not ( = ?auto_472582 ?auto_472588 ) ) ( not ( = ?auto_472582 ?auto_472589 ) ) ( not ( = ?auto_472583 ?auto_472584 ) ) ( not ( = ?auto_472583 ?auto_472585 ) ) ( not ( = ?auto_472583 ?auto_472586 ) ) ( not ( = ?auto_472583 ?auto_472587 ) ) ( not ( = ?auto_472583 ?auto_472588 ) ) ( not ( = ?auto_472583 ?auto_472589 ) ) ( not ( = ?auto_472584 ?auto_472585 ) ) ( not ( = ?auto_472584 ?auto_472586 ) ) ( not ( = ?auto_472584 ?auto_472587 ) ) ( not ( = ?auto_472584 ?auto_472588 ) ) ( not ( = ?auto_472584 ?auto_472589 ) ) ( not ( = ?auto_472585 ?auto_472586 ) ) ( not ( = ?auto_472585 ?auto_472587 ) ) ( not ( = ?auto_472585 ?auto_472588 ) ) ( not ( = ?auto_472585 ?auto_472589 ) ) ( not ( = ?auto_472586 ?auto_472587 ) ) ( not ( = ?auto_472586 ?auto_472588 ) ) ( not ( = ?auto_472586 ?auto_472589 ) ) ( not ( = ?auto_472587 ?auto_472588 ) ) ( not ( = ?auto_472587 ?auto_472589 ) ) ( not ( = ?auto_472588 ?auto_472589 ) ) ( ON ?auto_472587 ?auto_472588 ) ( ON ?auto_472586 ?auto_472587 ) ( CLEAR ?auto_472584 ) ( ON ?auto_472585 ?auto_472586 ) ( CLEAR ?auto_472585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_472579 ?auto_472580 ?auto_472581 ?auto_472582 ?auto_472583 ?auto_472584 ?auto_472585 )
      ( MAKE-10PILE ?auto_472579 ?auto_472580 ?auto_472581 ?auto_472582 ?auto_472583 ?auto_472584 ?auto_472585 ?auto_472586 ?auto_472587 ?auto_472588 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472621 - BLOCK
      ?auto_472622 - BLOCK
      ?auto_472623 - BLOCK
      ?auto_472624 - BLOCK
      ?auto_472625 - BLOCK
      ?auto_472626 - BLOCK
      ?auto_472627 - BLOCK
      ?auto_472628 - BLOCK
      ?auto_472629 - BLOCK
      ?auto_472630 - BLOCK
    )
    :vars
    (
      ?auto_472631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472630 ?auto_472631 ) ( ON-TABLE ?auto_472621 ) ( ON ?auto_472622 ?auto_472621 ) ( ON ?auto_472623 ?auto_472622 ) ( ON ?auto_472624 ?auto_472623 ) ( ON ?auto_472625 ?auto_472624 ) ( not ( = ?auto_472621 ?auto_472622 ) ) ( not ( = ?auto_472621 ?auto_472623 ) ) ( not ( = ?auto_472621 ?auto_472624 ) ) ( not ( = ?auto_472621 ?auto_472625 ) ) ( not ( = ?auto_472621 ?auto_472626 ) ) ( not ( = ?auto_472621 ?auto_472627 ) ) ( not ( = ?auto_472621 ?auto_472628 ) ) ( not ( = ?auto_472621 ?auto_472629 ) ) ( not ( = ?auto_472621 ?auto_472630 ) ) ( not ( = ?auto_472621 ?auto_472631 ) ) ( not ( = ?auto_472622 ?auto_472623 ) ) ( not ( = ?auto_472622 ?auto_472624 ) ) ( not ( = ?auto_472622 ?auto_472625 ) ) ( not ( = ?auto_472622 ?auto_472626 ) ) ( not ( = ?auto_472622 ?auto_472627 ) ) ( not ( = ?auto_472622 ?auto_472628 ) ) ( not ( = ?auto_472622 ?auto_472629 ) ) ( not ( = ?auto_472622 ?auto_472630 ) ) ( not ( = ?auto_472622 ?auto_472631 ) ) ( not ( = ?auto_472623 ?auto_472624 ) ) ( not ( = ?auto_472623 ?auto_472625 ) ) ( not ( = ?auto_472623 ?auto_472626 ) ) ( not ( = ?auto_472623 ?auto_472627 ) ) ( not ( = ?auto_472623 ?auto_472628 ) ) ( not ( = ?auto_472623 ?auto_472629 ) ) ( not ( = ?auto_472623 ?auto_472630 ) ) ( not ( = ?auto_472623 ?auto_472631 ) ) ( not ( = ?auto_472624 ?auto_472625 ) ) ( not ( = ?auto_472624 ?auto_472626 ) ) ( not ( = ?auto_472624 ?auto_472627 ) ) ( not ( = ?auto_472624 ?auto_472628 ) ) ( not ( = ?auto_472624 ?auto_472629 ) ) ( not ( = ?auto_472624 ?auto_472630 ) ) ( not ( = ?auto_472624 ?auto_472631 ) ) ( not ( = ?auto_472625 ?auto_472626 ) ) ( not ( = ?auto_472625 ?auto_472627 ) ) ( not ( = ?auto_472625 ?auto_472628 ) ) ( not ( = ?auto_472625 ?auto_472629 ) ) ( not ( = ?auto_472625 ?auto_472630 ) ) ( not ( = ?auto_472625 ?auto_472631 ) ) ( not ( = ?auto_472626 ?auto_472627 ) ) ( not ( = ?auto_472626 ?auto_472628 ) ) ( not ( = ?auto_472626 ?auto_472629 ) ) ( not ( = ?auto_472626 ?auto_472630 ) ) ( not ( = ?auto_472626 ?auto_472631 ) ) ( not ( = ?auto_472627 ?auto_472628 ) ) ( not ( = ?auto_472627 ?auto_472629 ) ) ( not ( = ?auto_472627 ?auto_472630 ) ) ( not ( = ?auto_472627 ?auto_472631 ) ) ( not ( = ?auto_472628 ?auto_472629 ) ) ( not ( = ?auto_472628 ?auto_472630 ) ) ( not ( = ?auto_472628 ?auto_472631 ) ) ( not ( = ?auto_472629 ?auto_472630 ) ) ( not ( = ?auto_472629 ?auto_472631 ) ) ( not ( = ?auto_472630 ?auto_472631 ) ) ( ON ?auto_472629 ?auto_472630 ) ( ON ?auto_472628 ?auto_472629 ) ( ON ?auto_472627 ?auto_472628 ) ( CLEAR ?auto_472625 ) ( ON ?auto_472626 ?auto_472627 ) ( CLEAR ?auto_472626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_472621 ?auto_472622 ?auto_472623 ?auto_472624 ?auto_472625 ?auto_472626 )
      ( MAKE-10PILE ?auto_472621 ?auto_472622 ?auto_472623 ?auto_472624 ?auto_472625 ?auto_472626 ?auto_472627 ?auto_472628 ?auto_472629 ?auto_472630 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472663 - BLOCK
      ?auto_472664 - BLOCK
      ?auto_472665 - BLOCK
      ?auto_472666 - BLOCK
      ?auto_472667 - BLOCK
      ?auto_472668 - BLOCK
      ?auto_472669 - BLOCK
      ?auto_472670 - BLOCK
      ?auto_472671 - BLOCK
      ?auto_472672 - BLOCK
    )
    :vars
    (
      ?auto_472673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472672 ?auto_472673 ) ( ON-TABLE ?auto_472663 ) ( ON ?auto_472664 ?auto_472663 ) ( ON ?auto_472665 ?auto_472664 ) ( ON ?auto_472666 ?auto_472665 ) ( not ( = ?auto_472663 ?auto_472664 ) ) ( not ( = ?auto_472663 ?auto_472665 ) ) ( not ( = ?auto_472663 ?auto_472666 ) ) ( not ( = ?auto_472663 ?auto_472667 ) ) ( not ( = ?auto_472663 ?auto_472668 ) ) ( not ( = ?auto_472663 ?auto_472669 ) ) ( not ( = ?auto_472663 ?auto_472670 ) ) ( not ( = ?auto_472663 ?auto_472671 ) ) ( not ( = ?auto_472663 ?auto_472672 ) ) ( not ( = ?auto_472663 ?auto_472673 ) ) ( not ( = ?auto_472664 ?auto_472665 ) ) ( not ( = ?auto_472664 ?auto_472666 ) ) ( not ( = ?auto_472664 ?auto_472667 ) ) ( not ( = ?auto_472664 ?auto_472668 ) ) ( not ( = ?auto_472664 ?auto_472669 ) ) ( not ( = ?auto_472664 ?auto_472670 ) ) ( not ( = ?auto_472664 ?auto_472671 ) ) ( not ( = ?auto_472664 ?auto_472672 ) ) ( not ( = ?auto_472664 ?auto_472673 ) ) ( not ( = ?auto_472665 ?auto_472666 ) ) ( not ( = ?auto_472665 ?auto_472667 ) ) ( not ( = ?auto_472665 ?auto_472668 ) ) ( not ( = ?auto_472665 ?auto_472669 ) ) ( not ( = ?auto_472665 ?auto_472670 ) ) ( not ( = ?auto_472665 ?auto_472671 ) ) ( not ( = ?auto_472665 ?auto_472672 ) ) ( not ( = ?auto_472665 ?auto_472673 ) ) ( not ( = ?auto_472666 ?auto_472667 ) ) ( not ( = ?auto_472666 ?auto_472668 ) ) ( not ( = ?auto_472666 ?auto_472669 ) ) ( not ( = ?auto_472666 ?auto_472670 ) ) ( not ( = ?auto_472666 ?auto_472671 ) ) ( not ( = ?auto_472666 ?auto_472672 ) ) ( not ( = ?auto_472666 ?auto_472673 ) ) ( not ( = ?auto_472667 ?auto_472668 ) ) ( not ( = ?auto_472667 ?auto_472669 ) ) ( not ( = ?auto_472667 ?auto_472670 ) ) ( not ( = ?auto_472667 ?auto_472671 ) ) ( not ( = ?auto_472667 ?auto_472672 ) ) ( not ( = ?auto_472667 ?auto_472673 ) ) ( not ( = ?auto_472668 ?auto_472669 ) ) ( not ( = ?auto_472668 ?auto_472670 ) ) ( not ( = ?auto_472668 ?auto_472671 ) ) ( not ( = ?auto_472668 ?auto_472672 ) ) ( not ( = ?auto_472668 ?auto_472673 ) ) ( not ( = ?auto_472669 ?auto_472670 ) ) ( not ( = ?auto_472669 ?auto_472671 ) ) ( not ( = ?auto_472669 ?auto_472672 ) ) ( not ( = ?auto_472669 ?auto_472673 ) ) ( not ( = ?auto_472670 ?auto_472671 ) ) ( not ( = ?auto_472670 ?auto_472672 ) ) ( not ( = ?auto_472670 ?auto_472673 ) ) ( not ( = ?auto_472671 ?auto_472672 ) ) ( not ( = ?auto_472671 ?auto_472673 ) ) ( not ( = ?auto_472672 ?auto_472673 ) ) ( ON ?auto_472671 ?auto_472672 ) ( ON ?auto_472670 ?auto_472671 ) ( ON ?auto_472669 ?auto_472670 ) ( ON ?auto_472668 ?auto_472669 ) ( CLEAR ?auto_472666 ) ( ON ?auto_472667 ?auto_472668 ) ( CLEAR ?auto_472667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_472663 ?auto_472664 ?auto_472665 ?auto_472666 ?auto_472667 )
      ( MAKE-10PILE ?auto_472663 ?auto_472664 ?auto_472665 ?auto_472666 ?auto_472667 ?auto_472668 ?auto_472669 ?auto_472670 ?auto_472671 ?auto_472672 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472705 - BLOCK
      ?auto_472706 - BLOCK
      ?auto_472707 - BLOCK
      ?auto_472708 - BLOCK
      ?auto_472709 - BLOCK
      ?auto_472710 - BLOCK
      ?auto_472711 - BLOCK
      ?auto_472712 - BLOCK
      ?auto_472713 - BLOCK
      ?auto_472714 - BLOCK
    )
    :vars
    (
      ?auto_472715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472714 ?auto_472715 ) ( ON-TABLE ?auto_472705 ) ( ON ?auto_472706 ?auto_472705 ) ( ON ?auto_472707 ?auto_472706 ) ( not ( = ?auto_472705 ?auto_472706 ) ) ( not ( = ?auto_472705 ?auto_472707 ) ) ( not ( = ?auto_472705 ?auto_472708 ) ) ( not ( = ?auto_472705 ?auto_472709 ) ) ( not ( = ?auto_472705 ?auto_472710 ) ) ( not ( = ?auto_472705 ?auto_472711 ) ) ( not ( = ?auto_472705 ?auto_472712 ) ) ( not ( = ?auto_472705 ?auto_472713 ) ) ( not ( = ?auto_472705 ?auto_472714 ) ) ( not ( = ?auto_472705 ?auto_472715 ) ) ( not ( = ?auto_472706 ?auto_472707 ) ) ( not ( = ?auto_472706 ?auto_472708 ) ) ( not ( = ?auto_472706 ?auto_472709 ) ) ( not ( = ?auto_472706 ?auto_472710 ) ) ( not ( = ?auto_472706 ?auto_472711 ) ) ( not ( = ?auto_472706 ?auto_472712 ) ) ( not ( = ?auto_472706 ?auto_472713 ) ) ( not ( = ?auto_472706 ?auto_472714 ) ) ( not ( = ?auto_472706 ?auto_472715 ) ) ( not ( = ?auto_472707 ?auto_472708 ) ) ( not ( = ?auto_472707 ?auto_472709 ) ) ( not ( = ?auto_472707 ?auto_472710 ) ) ( not ( = ?auto_472707 ?auto_472711 ) ) ( not ( = ?auto_472707 ?auto_472712 ) ) ( not ( = ?auto_472707 ?auto_472713 ) ) ( not ( = ?auto_472707 ?auto_472714 ) ) ( not ( = ?auto_472707 ?auto_472715 ) ) ( not ( = ?auto_472708 ?auto_472709 ) ) ( not ( = ?auto_472708 ?auto_472710 ) ) ( not ( = ?auto_472708 ?auto_472711 ) ) ( not ( = ?auto_472708 ?auto_472712 ) ) ( not ( = ?auto_472708 ?auto_472713 ) ) ( not ( = ?auto_472708 ?auto_472714 ) ) ( not ( = ?auto_472708 ?auto_472715 ) ) ( not ( = ?auto_472709 ?auto_472710 ) ) ( not ( = ?auto_472709 ?auto_472711 ) ) ( not ( = ?auto_472709 ?auto_472712 ) ) ( not ( = ?auto_472709 ?auto_472713 ) ) ( not ( = ?auto_472709 ?auto_472714 ) ) ( not ( = ?auto_472709 ?auto_472715 ) ) ( not ( = ?auto_472710 ?auto_472711 ) ) ( not ( = ?auto_472710 ?auto_472712 ) ) ( not ( = ?auto_472710 ?auto_472713 ) ) ( not ( = ?auto_472710 ?auto_472714 ) ) ( not ( = ?auto_472710 ?auto_472715 ) ) ( not ( = ?auto_472711 ?auto_472712 ) ) ( not ( = ?auto_472711 ?auto_472713 ) ) ( not ( = ?auto_472711 ?auto_472714 ) ) ( not ( = ?auto_472711 ?auto_472715 ) ) ( not ( = ?auto_472712 ?auto_472713 ) ) ( not ( = ?auto_472712 ?auto_472714 ) ) ( not ( = ?auto_472712 ?auto_472715 ) ) ( not ( = ?auto_472713 ?auto_472714 ) ) ( not ( = ?auto_472713 ?auto_472715 ) ) ( not ( = ?auto_472714 ?auto_472715 ) ) ( ON ?auto_472713 ?auto_472714 ) ( ON ?auto_472712 ?auto_472713 ) ( ON ?auto_472711 ?auto_472712 ) ( ON ?auto_472710 ?auto_472711 ) ( ON ?auto_472709 ?auto_472710 ) ( CLEAR ?auto_472707 ) ( ON ?auto_472708 ?auto_472709 ) ( CLEAR ?auto_472708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_472705 ?auto_472706 ?auto_472707 ?auto_472708 )
      ( MAKE-10PILE ?auto_472705 ?auto_472706 ?auto_472707 ?auto_472708 ?auto_472709 ?auto_472710 ?auto_472711 ?auto_472712 ?auto_472713 ?auto_472714 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472747 - BLOCK
      ?auto_472748 - BLOCK
      ?auto_472749 - BLOCK
      ?auto_472750 - BLOCK
      ?auto_472751 - BLOCK
      ?auto_472752 - BLOCK
      ?auto_472753 - BLOCK
      ?auto_472754 - BLOCK
      ?auto_472755 - BLOCK
      ?auto_472756 - BLOCK
    )
    :vars
    (
      ?auto_472757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472756 ?auto_472757 ) ( ON-TABLE ?auto_472747 ) ( ON ?auto_472748 ?auto_472747 ) ( not ( = ?auto_472747 ?auto_472748 ) ) ( not ( = ?auto_472747 ?auto_472749 ) ) ( not ( = ?auto_472747 ?auto_472750 ) ) ( not ( = ?auto_472747 ?auto_472751 ) ) ( not ( = ?auto_472747 ?auto_472752 ) ) ( not ( = ?auto_472747 ?auto_472753 ) ) ( not ( = ?auto_472747 ?auto_472754 ) ) ( not ( = ?auto_472747 ?auto_472755 ) ) ( not ( = ?auto_472747 ?auto_472756 ) ) ( not ( = ?auto_472747 ?auto_472757 ) ) ( not ( = ?auto_472748 ?auto_472749 ) ) ( not ( = ?auto_472748 ?auto_472750 ) ) ( not ( = ?auto_472748 ?auto_472751 ) ) ( not ( = ?auto_472748 ?auto_472752 ) ) ( not ( = ?auto_472748 ?auto_472753 ) ) ( not ( = ?auto_472748 ?auto_472754 ) ) ( not ( = ?auto_472748 ?auto_472755 ) ) ( not ( = ?auto_472748 ?auto_472756 ) ) ( not ( = ?auto_472748 ?auto_472757 ) ) ( not ( = ?auto_472749 ?auto_472750 ) ) ( not ( = ?auto_472749 ?auto_472751 ) ) ( not ( = ?auto_472749 ?auto_472752 ) ) ( not ( = ?auto_472749 ?auto_472753 ) ) ( not ( = ?auto_472749 ?auto_472754 ) ) ( not ( = ?auto_472749 ?auto_472755 ) ) ( not ( = ?auto_472749 ?auto_472756 ) ) ( not ( = ?auto_472749 ?auto_472757 ) ) ( not ( = ?auto_472750 ?auto_472751 ) ) ( not ( = ?auto_472750 ?auto_472752 ) ) ( not ( = ?auto_472750 ?auto_472753 ) ) ( not ( = ?auto_472750 ?auto_472754 ) ) ( not ( = ?auto_472750 ?auto_472755 ) ) ( not ( = ?auto_472750 ?auto_472756 ) ) ( not ( = ?auto_472750 ?auto_472757 ) ) ( not ( = ?auto_472751 ?auto_472752 ) ) ( not ( = ?auto_472751 ?auto_472753 ) ) ( not ( = ?auto_472751 ?auto_472754 ) ) ( not ( = ?auto_472751 ?auto_472755 ) ) ( not ( = ?auto_472751 ?auto_472756 ) ) ( not ( = ?auto_472751 ?auto_472757 ) ) ( not ( = ?auto_472752 ?auto_472753 ) ) ( not ( = ?auto_472752 ?auto_472754 ) ) ( not ( = ?auto_472752 ?auto_472755 ) ) ( not ( = ?auto_472752 ?auto_472756 ) ) ( not ( = ?auto_472752 ?auto_472757 ) ) ( not ( = ?auto_472753 ?auto_472754 ) ) ( not ( = ?auto_472753 ?auto_472755 ) ) ( not ( = ?auto_472753 ?auto_472756 ) ) ( not ( = ?auto_472753 ?auto_472757 ) ) ( not ( = ?auto_472754 ?auto_472755 ) ) ( not ( = ?auto_472754 ?auto_472756 ) ) ( not ( = ?auto_472754 ?auto_472757 ) ) ( not ( = ?auto_472755 ?auto_472756 ) ) ( not ( = ?auto_472755 ?auto_472757 ) ) ( not ( = ?auto_472756 ?auto_472757 ) ) ( ON ?auto_472755 ?auto_472756 ) ( ON ?auto_472754 ?auto_472755 ) ( ON ?auto_472753 ?auto_472754 ) ( ON ?auto_472752 ?auto_472753 ) ( ON ?auto_472751 ?auto_472752 ) ( ON ?auto_472750 ?auto_472751 ) ( CLEAR ?auto_472748 ) ( ON ?auto_472749 ?auto_472750 ) ( CLEAR ?auto_472749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_472747 ?auto_472748 ?auto_472749 )
      ( MAKE-10PILE ?auto_472747 ?auto_472748 ?auto_472749 ?auto_472750 ?auto_472751 ?auto_472752 ?auto_472753 ?auto_472754 ?auto_472755 ?auto_472756 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472789 - BLOCK
      ?auto_472790 - BLOCK
      ?auto_472791 - BLOCK
      ?auto_472792 - BLOCK
      ?auto_472793 - BLOCK
      ?auto_472794 - BLOCK
      ?auto_472795 - BLOCK
      ?auto_472796 - BLOCK
      ?auto_472797 - BLOCK
      ?auto_472798 - BLOCK
    )
    :vars
    (
      ?auto_472799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472798 ?auto_472799 ) ( ON-TABLE ?auto_472789 ) ( not ( = ?auto_472789 ?auto_472790 ) ) ( not ( = ?auto_472789 ?auto_472791 ) ) ( not ( = ?auto_472789 ?auto_472792 ) ) ( not ( = ?auto_472789 ?auto_472793 ) ) ( not ( = ?auto_472789 ?auto_472794 ) ) ( not ( = ?auto_472789 ?auto_472795 ) ) ( not ( = ?auto_472789 ?auto_472796 ) ) ( not ( = ?auto_472789 ?auto_472797 ) ) ( not ( = ?auto_472789 ?auto_472798 ) ) ( not ( = ?auto_472789 ?auto_472799 ) ) ( not ( = ?auto_472790 ?auto_472791 ) ) ( not ( = ?auto_472790 ?auto_472792 ) ) ( not ( = ?auto_472790 ?auto_472793 ) ) ( not ( = ?auto_472790 ?auto_472794 ) ) ( not ( = ?auto_472790 ?auto_472795 ) ) ( not ( = ?auto_472790 ?auto_472796 ) ) ( not ( = ?auto_472790 ?auto_472797 ) ) ( not ( = ?auto_472790 ?auto_472798 ) ) ( not ( = ?auto_472790 ?auto_472799 ) ) ( not ( = ?auto_472791 ?auto_472792 ) ) ( not ( = ?auto_472791 ?auto_472793 ) ) ( not ( = ?auto_472791 ?auto_472794 ) ) ( not ( = ?auto_472791 ?auto_472795 ) ) ( not ( = ?auto_472791 ?auto_472796 ) ) ( not ( = ?auto_472791 ?auto_472797 ) ) ( not ( = ?auto_472791 ?auto_472798 ) ) ( not ( = ?auto_472791 ?auto_472799 ) ) ( not ( = ?auto_472792 ?auto_472793 ) ) ( not ( = ?auto_472792 ?auto_472794 ) ) ( not ( = ?auto_472792 ?auto_472795 ) ) ( not ( = ?auto_472792 ?auto_472796 ) ) ( not ( = ?auto_472792 ?auto_472797 ) ) ( not ( = ?auto_472792 ?auto_472798 ) ) ( not ( = ?auto_472792 ?auto_472799 ) ) ( not ( = ?auto_472793 ?auto_472794 ) ) ( not ( = ?auto_472793 ?auto_472795 ) ) ( not ( = ?auto_472793 ?auto_472796 ) ) ( not ( = ?auto_472793 ?auto_472797 ) ) ( not ( = ?auto_472793 ?auto_472798 ) ) ( not ( = ?auto_472793 ?auto_472799 ) ) ( not ( = ?auto_472794 ?auto_472795 ) ) ( not ( = ?auto_472794 ?auto_472796 ) ) ( not ( = ?auto_472794 ?auto_472797 ) ) ( not ( = ?auto_472794 ?auto_472798 ) ) ( not ( = ?auto_472794 ?auto_472799 ) ) ( not ( = ?auto_472795 ?auto_472796 ) ) ( not ( = ?auto_472795 ?auto_472797 ) ) ( not ( = ?auto_472795 ?auto_472798 ) ) ( not ( = ?auto_472795 ?auto_472799 ) ) ( not ( = ?auto_472796 ?auto_472797 ) ) ( not ( = ?auto_472796 ?auto_472798 ) ) ( not ( = ?auto_472796 ?auto_472799 ) ) ( not ( = ?auto_472797 ?auto_472798 ) ) ( not ( = ?auto_472797 ?auto_472799 ) ) ( not ( = ?auto_472798 ?auto_472799 ) ) ( ON ?auto_472797 ?auto_472798 ) ( ON ?auto_472796 ?auto_472797 ) ( ON ?auto_472795 ?auto_472796 ) ( ON ?auto_472794 ?auto_472795 ) ( ON ?auto_472793 ?auto_472794 ) ( ON ?auto_472792 ?auto_472793 ) ( ON ?auto_472791 ?auto_472792 ) ( CLEAR ?auto_472789 ) ( ON ?auto_472790 ?auto_472791 ) ( CLEAR ?auto_472790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_472789 ?auto_472790 )
      ( MAKE-10PILE ?auto_472789 ?auto_472790 ?auto_472791 ?auto_472792 ?auto_472793 ?auto_472794 ?auto_472795 ?auto_472796 ?auto_472797 ?auto_472798 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_472831 - BLOCK
      ?auto_472832 - BLOCK
      ?auto_472833 - BLOCK
      ?auto_472834 - BLOCK
      ?auto_472835 - BLOCK
      ?auto_472836 - BLOCK
      ?auto_472837 - BLOCK
      ?auto_472838 - BLOCK
      ?auto_472839 - BLOCK
      ?auto_472840 - BLOCK
    )
    :vars
    (
      ?auto_472841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472840 ?auto_472841 ) ( not ( = ?auto_472831 ?auto_472832 ) ) ( not ( = ?auto_472831 ?auto_472833 ) ) ( not ( = ?auto_472831 ?auto_472834 ) ) ( not ( = ?auto_472831 ?auto_472835 ) ) ( not ( = ?auto_472831 ?auto_472836 ) ) ( not ( = ?auto_472831 ?auto_472837 ) ) ( not ( = ?auto_472831 ?auto_472838 ) ) ( not ( = ?auto_472831 ?auto_472839 ) ) ( not ( = ?auto_472831 ?auto_472840 ) ) ( not ( = ?auto_472831 ?auto_472841 ) ) ( not ( = ?auto_472832 ?auto_472833 ) ) ( not ( = ?auto_472832 ?auto_472834 ) ) ( not ( = ?auto_472832 ?auto_472835 ) ) ( not ( = ?auto_472832 ?auto_472836 ) ) ( not ( = ?auto_472832 ?auto_472837 ) ) ( not ( = ?auto_472832 ?auto_472838 ) ) ( not ( = ?auto_472832 ?auto_472839 ) ) ( not ( = ?auto_472832 ?auto_472840 ) ) ( not ( = ?auto_472832 ?auto_472841 ) ) ( not ( = ?auto_472833 ?auto_472834 ) ) ( not ( = ?auto_472833 ?auto_472835 ) ) ( not ( = ?auto_472833 ?auto_472836 ) ) ( not ( = ?auto_472833 ?auto_472837 ) ) ( not ( = ?auto_472833 ?auto_472838 ) ) ( not ( = ?auto_472833 ?auto_472839 ) ) ( not ( = ?auto_472833 ?auto_472840 ) ) ( not ( = ?auto_472833 ?auto_472841 ) ) ( not ( = ?auto_472834 ?auto_472835 ) ) ( not ( = ?auto_472834 ?auto_472836 ) ) ( not ( = ?auto_472834 ?auto_472837 ) ) ( not ( = ?auto_472834 ?auto_472838 ) ) ( not ( = ?auto_472834 ?auto_472839 ) ) ( not ( = ?auto_472834 ?auto_472840 ) ) ( not ( = ?auto_472834 ?auto_472841 ) ) ( not ( = ?auto_472835 ?auto_472836 ) ) ( not ( = ?auto_472835 ?auto_472837 ) ) ( not ( = ?auto_472835 ?auto_472838 ) ) ( not ( = ?auto_472835 ?auto_472839 ) ) ( not ( = ?auto_472835 ?auto_472840 ) ) ( not ( = ?auto_472835 ?auto_472841 ) ) ( not ( = ?auto_472836 ?auto_472837 ) ) ( not ( = ?auto_472836 ?auto_472838 ) ) ( not ( = ?auto_472836 ?auto_472839 ) ) ( not ( = ?auto_472836 ?auto_472840 ) ) ( not ( = ?auto_472836 ?auto_472841 ) ) ( not ( = ?auto_472837 ?auto_472838 ) ) ( not ( = ?auto_472837 ?auto_472839 ) ) ( not ( = ?auto_472837 ?auto_472840 ) ) ( not ( = ?auto_472837 ?auto_472841 ) ) ( not ( = ?auto_472838 ?auto_472839 ) ) ( not ( = ?auto_472838 ?auto_472840 ) ) ( not ( = ?auto_472838 ?auto_472841 ) ) ( not ( = ?auto_472839 ?auto_472840 ) ) ( not ( = ?auto_472839 ?auto_472841 ) ) ( not ( = ?auto_472840 ?auto_472841 ) ) ( ON ?auto_472839 ?auto_472840 ) ( ON ?auto_472838 ?auto_472839 ) ( ON ?auto_472837 ?auto_472838 ) ( ON ?auto_472836 ?auto_472837 ) ( ON ?auto_472835 ?auto_472836 ) ( ON ?auto_472834 ?auto_472835 ) ( ON ?auto_472833 ?auto_472834 ) ( ON ?auto_472832 ?auto_472833 ) ( ON ?auto_472831 ?auto_472832 ) ( CLEAR ?auto_472831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_472831 )
      ( MAKE-10PILE ?auto_472831 ?auto_472832 ?auto_472833 ?auto_472834 ?auto_472835 ?auto_472836 ?auto_472837 ?auto_472838 ?auto_472839 ?auto_472840 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_472874 - BLOCK
      ?auto_472875 - BLOCK
      ?auto_472876 - BLOCK
      ?auto_472877 - BLOCK
      ?auto_472878 - BLOCK
      ?auto_472879 - BLOCK
      ?auto_472880 - BLOCK
      ?auto_472881 - BLOCK
      ?auto_472882 - BLOCK
      ?auto_472883 - BLOCK
      ?auto_472884 - BLOCK
    )
    :vars
    (
      ?auto_472885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_472883 ) ( ON ?auto_472884 ?auto_472885 ) ( CLEAR ?auto_472884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_472874 ) ( ON ?auto_472875 ?auto_472874 ) ( ON ?auto_472876 ?auto_472875 ) ( ON ?auto_472877 ?auto_472876 ) ( ON ?auto_472878 ?auto_472877 ) ( ON ?auto_472879 ?auto_472878 ) ( ON ?auto_472880 ?auto_472879 ) ( ON ?auto_472881 ?auto_472880 ) ( ON ?auto_472882 ?auto_472881 ) ( ON ?auto_472883 ?auto_472882 ) ( not ( = ?auto_472874 ?auto_472875 ) ) ( not ( = ?auto_472874 ?auto_472876 ) ) ( not ( = ?auto_472874 ?auto_472877 ) ) ( not ( = ?auto_472874 ?auto_472878 ) ) ( not ( = ?auto_472874 ?auto_472879 ) ) ( not ( = ?auto_472874 ?auto_472880 ) ) ( not ( = ?auto_472874 ?auto_472881 ) ) ( not ( = ?auto_472874 ?auto_472882 ) ) ( not ( = ?auto_472874 ?auto_472883 ) ) ( not ( = ?auto_472874 ?auto_472884 ) ) ( not ( = ?auto_472874 ?auto_472885 ) ) ( not ( = ?auto_472875 ?auto_472876 ) ) ( not ( = ?auto_472875 ?auto_472877 ) ) ( not ( = ?auto_472875 ?auto_472878 ) ) ( not ( = ?auto_472875 ?auto_472879 ) ) ( not ( = ?auto_472875 ?auto_472880 ) ) ( not ( = ?auto_472875 ?auto_472881 ) ) ( not ( = ?auto_472875 ?auto_472882 ) ) ( not ( = ?auto_472875 ?auto_472883 ) ) ( not ( = ?auto_472875 ?auto_472884 ) ) ( not ( = ?auto_472875 ?auto_472885 ) ) ( not ( = ?auto_472876 ?auto_472877 ) ) ( not ( = ?auto_472876 ?auto_472878 ) ) ( not ( = ?auto_472876 ?auto_472879 ) ) ( not ( = ?auto_472876 ?auto_472880 ) ) ( not ( = ?auto_472876 ?auto_472881 ) ) ( not ( = ?auto_472876 ?auto_472882 ) ) ( not ( = ?auto_472876 ?auto_472883 ) ) ( not ( = ?auto_472876 ?auto_472884 ) ) ( not ( = ?auto_472876 ?auto_472885 ) ) ( not ( = ?auto_472877 ?auto_472878 ) ) ( not ( = ?auto_472877 ?auto_472879 ) ) ( not ( = ?auto_472877 ?auto_472880 ) ) ( not ( = ?auto_472877 ?auto_472881 ) ) ( not ( = ?auto_472877 ?auto_472882 ) ) ( not ( = ?auto_472877 ?auto_472883 ) ) ( not ( = ?auto_472877 ?auto_472884 ) ) ( not ( = ?auto_472877 ?auto_472885 ) ) ( not ( = ?auto_472878 ?auto_472879 ) ) ( not ( = ?auto_472878 ?auto_472880 ) ) ( not ( = ?auto_472878 ?auto_472881 ) ) ( not ( = ?auto_472878 ?auto_472882 ) ) ( not ( = ?auto_472878 ?auto_472883 ) ) ( not ( = ?auto_472878 ?auto_472884 ) ) ( not ( = ?auto_472878 ?auto_472885 ) ) ( not ( = ?auto_472879 ?auto_472880 ) ) ( not ( = ?auto_472879 ?auto_472881 ) ) ( not ( = ?auto_472879 ?auto_472882 ) ) ( not ( = ?auto_472879 ?auto_472883 ) ) ( not ( = ?auto_472879 ?auto_472884 ) ) ( not ( = ?auto_472879 ?auto_472885 ) ) ( not ( = ?auto_472880 ?auto_472881 ) ) ( not ( = ?auto_472880 ?auto_472882 ) ) ( not ( = ?auto_472880 ?auto_472883 ) ) ( not ( = ?auto_472880 ?auto_472884 ) ) ( not ( = ?auto_472880 ?auto_472885 ) ) ( not ( = ?auto_472881 ?auto_472882 ) ) ( not ( = ?auto_472881 ?auto_472883 ) ) ( not ( = ?auto_472881 ?auto_472884 ) ) ( not ( = ?auto_472881 ?auto_472885 ) ) ( not ( = ?auto_472882 ?auto_472883 ) ) ( not ( = ?auto_472882 ?auto_472884 ) ) ( not ( = ?auto_472882 ?auto_472885 ) ) ( not ( = ?auto_472883 ?auto_472884 ) ) ( not ( = ?auto_472883 ?auto_472885 ) ) ( not ( = ?auto_472884 ?auto_472885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_472884 ?auto_472885 )
      ( !STACK ?auto_472884 ?auto_472883 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_472920 - BLOCK
      ?auto_472921 - BLOCK
      ?auto_472922 - BLOCK
      ?auto_472923 - BLOCK
      ?auto_472924 - BLOCK
      ?auto_472925 - BLOCK
      ?auto_472926 - BLOCK
      ?auto_472927 - BLOCK
      ?auto_472928 - BLOCK
      ?auto_472929 - BLOCK
      ?auto_472930 - BLOCK
    )
    :vars
    (
      ?auto_472931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472930 ?auto_472931 ) ( ON-TABLE ?auto_472920 ) ( ON ?auto_472921 ?auto_472920 ) ( ON ?auto_472922 ?auto_472921 ) ( ON ?auto_472923 ?auto_472922 ) ( ON ?auto_472924 ?auto_472923 ) ( ON ?auto_472925 ?auto_472924 ) ( ON ?auto_472926 ?auto_472925 ) ( ON ?auto_472927 ?auto_472926 ) ( ON ?auto_472928 ?auto_472927 ) ( not ( = ?auto_472920 ?auto_472921 ) ) ( not ( = ?auto_472920 ?auto_472922 ) ) ( not ( = ?auto_472920 ?auto_472923 ) ) ( not ( = ?auto_472920 ?auto_472924 ) ) ( not ( = ?auto_472920 ?auto_472925 ) ) ( not ( = ?auto_472920 ?auto_472926 ) ) ( not ( = ?auto_472920 ?auto_472927 ) ) ( not ( = ?auto_472920 ?auto_472928 ) ) ( not ( = ?auto_472920 ?auto_472929 ) ) ( not ( = ?auto_472920 ?auto_472930 ) ) ( not ( = ?auto_472920 ?auto_472931 ) ) ( not ( = ?auto_472921 ?auto_472922 ) ) ( not ( = ?auto_472921 ?auto_472923 ) ) ( not ( = ?auto_472921 ?auto_472924 ) ) ( not ( = ?auto_472921 ?auto_472925 ) ) ( not ( = ?auto_472921 ?auto_472926 ) ) ( not ( = ?auto_472921 ?auto_472927 ) ) ( not ( = ?auto_472921 ?auto_472928 ) ) ( not ( = ?auto_472921 ?auto_472929 ) ) ( not ( = ?auto_472921 ?auto_472930 ) ) ( not ( = ?auto_472921 ?auto_472931 ) ) ( not ( = ?auto_472922 ?auto_472923 ) ) ( not ( = ?auto_472922 ?auto_472924 ) ) ( not ( = ?auto_472922 ?auto_472925 ) ) ( not ( = ?auto_472922 ?auto_472926 ) ) ( not ( = ?auto_472922 ?auto_472927 ) ) ( not ( = ?auto_472922 ?auto_472928 ) ) ( not ( = ?auto_472922 ?auto_472929 ) ) ( not ( = ?auto_472922 ?auto_472930 ) ) ( not ( = ?auto_472922 ?auto_472931 ) ) ( not ( = ?auto_472923 ?auto_472924 ) ) ( not ( = ?auto_472923 ?auto_472925 ) ) ( not ( = ?auto_472923 ?auto_472926 ) ) ( not ( = ?auto_472923 ?auto_472927 ) ) ( not ( = ?auto_472923 ?auto_472928 ) ) ( not ( = ?auto_472923 ?auto_472929 ) ) ( not ( = ?auto_472923 ?auto_472930 ) ) ( not ( = ?auto_472923 ?auto_472931 ) ) ( not ( = ?auto_472924 ?auto_472925 ) ) ( not ( = ?auto_472924 ?auto_472926 ) ) ( not ( = ?auto_472924 ?auto_472927 ) ) ( not ( = ?auto_472924 ?auto_472928 ) ) ( not ( = ?auto_472924 ?auto_472929 ) ) ( not ( = ?auto_472924 ?auto_472930 ) ) ( not ( = ?auto_472924 ?auto_472931 ) ) ( not ( = ?auto_472925 ?auto_472926 ) ) ( not ( = ?auto_472925 ?auto_472927 ) ) ( not ( = ?auto_472925 ?auto_472928 ) ) ( not ( = ?auto_472925 ?auto_472929 ) ) ( not ( = ?auto_472925 ?auto_472930 ) ) ( not ( = ?auto_472925 ?auto_472931 ) ) ( not ( = ?auto_472926 ?auto_472927 ) ) ( not ( = ?auto_472926 ?auto_472928 ) ) ( not ( = ?auto_472926 ?auto_472929 ) ) ( not ( = ?auto_472926 ?auto_472930 ) ) ( not ( = ?auto_472926 ?auto_472931 ) ) ( not ( = ?auto_472927 ?auto_472928 ) ) ( not ( = ?auto_472927 ?auto_472929 ) ) ( not ( = ?auto_472927 ?auto_472930 ) ) ( not ( = ?auto_472927 ?auto_472931 ) ) ( not ( = ?auto_472928 ?auto_472929 ) ) ( not ( = ?auto_472928 ?auto_472930 ) ) ( not ( = ?auto_472928 ?auto_472931 ) ) ( not ( = ?auto_472929 ?auto_472930 ) ) ( not ( = ?auto_472929 ?auto_472931 ) ) ( not ( = ?auto_472930 ?auto_472931 ) ) ( CLEAR ?auto_472928 ) ( ON ?auto_472929 ?auto_472930 ) ( CLEAR ?auto_472929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_472920 ?auto_472921 ?auto_472922 ?auto_472923 ?auto_472924 ?auto_472925 ?auto_472926 ?auto_472927 ?auto_472928 ?auto_472929 )
      ( MAKE-11PILE ?auto_472920 ?auto_472921 ?auto_472922 ?auto_472923 ?auto_472924 ?auto_472925 ?auto_472926 ?auto_472927 ?auto_472928 ?auto_472929 ?auto_472930 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_472966 - BLOCK
      ?auto_472967 - BLOCK
      ?auto_472968 - BLOCK
      ?auto_472969 - BLOCK
      ?auto_472970 - BLOCK
      ?auto_472971 - BLOCK
      ?auto_472972 - BLOCK
      ?auto_472973 - BLOCK
      ?auto_472974 - BLOCK
      ?auto_472975 - BLOCK
      ?auto_472976 - BLOCK
    )
    :vars
    (
      ?auto_472977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_472976 ?auto_472977 ) ( ON-TABLE ?auto_472966 ) ( ON ?auto_472967 ?auto_472966 ) ( ON ?auto_472968 ?auto_472967 ) ( ON ?auto_472969 ?auto_472968 ) ( ON ?auto_472970 ?auto_472969 ) ( ON ?auto_472971 ?auto_472970 ) ( ON ?auto_472972 ?auto_472971 ) ( ON ?auto_472973 ?auto_472972 ) ( not ( = ?auto_472966 ?auto_472967 ) ) ( not ( = ?auto_472966 ?auto_472968 ) ) ( not ( = ?auto_472966 ?auto_472969 ) ) ( not ( = ?auto_472966 ?auto_472970 ) ) ( not ( = ?auto_472966 ?auto_472971 ) ) ( not ( = ?auto_472966 ?auto_472972 ) ) ( not ( = ?auto_472966 ?auto_472973 ) ) ( not ( = ?auto_472966 ?auto_472974 ) ) ( not ( = ?auto_472966 ?auto_472975 ) ) ( not ( = ?auto_472966 ?auto_472976 ) ) ( not ( = ?auto_472966 ?auto_472977 ) ) ( not ( = ?auto_472967 ?auto_472968 ) ) ( not ( = ?auto_472967 ?auto_472969 ) ) ( not ( = ?auto_472967 ?auto_472970 ) ) ( not ( = ?auto_472967 ?auto_472971 ) ) ( not ( = ?auto_472967 ?auto_472972 ) ) ( not ( = ?auto_472967 ?auto_472973 ) ) ( not ( = ?auto_472967 ?auto_472974 ) ) ( not ( = ?auto_472967 ?auto_472975 ) ) ( not ( = ?auto_472967 ?auto_472976 ) ) ( not ( = ?auto_472967 ?auto_472977 ) ) ( not ( = ?auto_472968 ?auto_472969 ) ) ( not ( = ?auto_472968 ?auto_472970 ) ) ( not ( = ?auto_472968 ?auto_472971 ) ) ( not ( = ?auto_472968 ?auto_472972 ) ) ( not ( = ?auto_472968 ?auto_472973 ) ) ( not ( = ?auto_472968 ?auto_472974 ) ) ( not ( = ?auto_472968 ?auto_472975 ) ) ( not ( = ?auto_472968 ?auto_472976 ) ) ( not ( = ?auto_472968 ?auto_472977 ) ) ( not ( = ?auto_472969 ?auto_472970 ) ) ( not ( = ?auto_472969 ?auto_472971 ) ) ( not ( = ?auto_472969 ?auto_472972 ) ) ( not ( = ?auto_472969 ?auto_472973 ) ) ( not ( = ?auto_472969 ?auto_472974 ) ) ( not ( = ?auto_472969 ?auto_472975 ) ) ( not ( = ?auto_472969 ?auto_472976 ) ) ( not ( = ?auto_472969 ?auto_472977 ) ) ( not ( = ?auto_472970 ?auto_472971 ) ) ( not ( = ?auto_472970 ?auto_472972 ) ) ( not ( = ?auto_472970 ?auto_472973 ) ) ( not ( = ?auto_472970 ?auto_472974 ) ) ( not ( = ?auto_472970 ?auto_472975 ) ) ( not ( = ?auto_472970 ?auto_472976 ) ) ( not ( = ?auto_472970 ?auto_472977 ) ) ( not ( = ?auto_472971 ?auto_472972 ) ) ( not ( = ?auto_472971 ?auto_472973 ) ) ( not ( = ?auto_472971 ?auto_472974 ) ) ( not ( = ?auto_472971 ?auto_472975 ) ) ( not ( = ?auto_472971 ?auto_472976 ) ) ( not ( = ?auto_472971 ?auto_472977 ) ) ( not ( = ?auto_472972 ?auto_472973 ) ) ( not ( = ?auto_472972 ?auto_472974 ) ) ( not ( = ?auto_472972 ?auto_472975 ) ) ( not ( = ?auto_472972 ?auto_472976 ) ) ( not ( = ?auto_472972 ?auto_472977 ) ) ( not ( = ?auto_472973 ?auto_472974 ) ) ( not ( = ?auto_472973 ?auto_472975 ) ) ( not ( = ?auto_472973 ?auto_472976 ) ) ( not ( = ?auto_472973 ?auto_472977 ) ) ( not ( = ?auto_472974 ?auto_472975 ) ) ( not ( = ?auto_472974 ?auto_472976 ) ) ( not ( = ?auto_472974 ?auto_472977 ) ) ( not ( = ?auto_472975 ?auto_472976 ) ) ( not ( = ?auto_472975 ?auto_472977 ) ) ( not ( = ?auto_472976 ?auto_472977 ) ) ( ON ?auto_472975 ?auto_472976 ) ( CLEAR ?auto_472973 ) ( ON ?auto_472974 ?auto_472975 ) ( CLEAR ?auto_472974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_472966 ?auto_472967 ?auto_472968 ?auto_472969 ?auto_472970 ?auto_472971 ?auto_472972 ?auto_472973 ?auto_472974 )
      ( MAKE-11PILE ?auto_472966 ?auto_472967 ?auto_472968 ?auto_472969 ?auto_472970 ?auto_472971 ?auto_472972 ?auto_472973 ?auto_472974 ?auto_472975 ?auto_472976 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473012 - BLOCK
      ?auto_473013 - BLOCK
      ?auto_473014 - BLOCK
      ?auto_473015 - BLOCK
      ?auto_473016 - BLOCK
      ?auto_473017 - BLOCK
      ?auto_473018 - BLOCK
      ?auto_473019 - BLOCK
      ?auto_473020 - BLOCK
      ?auto_473021 - BLOCK
      ?auto_473022 - BLOCK
    )
    :vars
    (
      ?auto_473023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473022 ?auto_473023 ) ( ON-TABLE ?auto_473012 ) ( ON ?auto_473013 ?auto_473012 ) ( ON ?auto_473014 ?auto_473013 ) ( ON ?auto_473015 ?auto_473014 ) ( ON ?auto_473016 ?auto_473015 ) ( ON ?auto_473017 ?auto_473016 ) ( ON ?auto_473018 ?auto_473017 ) ( not ( = ?auto_473012 ?auto_473013 ) ) ( not ( = ?auto_473012 ?auto_473014 ) ) ( not ( = ?auto_473012 ?auto_473015 ) ) ( not ( = ?auto_473012 ?auto_473016 ) ) ( not ( = ?auto_473012 ?auto_473017 ) ) ( not ( = ?auto_473012 ?auto_473018 ) ) ( not ( = ?auto_473012 ?auto_473019 ) ) ( not ( = ?auto_473012 ?auto_473020 ) ) ( not ( = ?auto_473012 ?auto_473021 ) ) ( not ( = ?auto_473012 ?auto_473022 ) ) ( not ( = ?auto_473012 ?auto_473023 ) ) ( not ( = ?auto_473013 ?auto_473014 ) ) ( not ( = ?auto_473013 ?auto_473015 ) ) ( not ( = ?auto_473013 ?auto_473016 ) ) ( not ( = ?auto_473013 ?auto_473017 ) ) ( not ( = ?auto_473013 ?auto_473018 ) ) ( not ( = ?auto_473013 ?auto_473019 ) ) ( not ( = ?auto_473013 ?auto_473020 ) ) ( not ( = ?auto_473013 ?auto_473021 ) ) ( not ( = ?auto_473013 ?auto_473022 ) ) ( not ( = ?auto_473013 ?auto_473023 ) ) ( not ( = ?auto_473014 ?auto_473015 ) ) ( not ( = ?auto_473014 ?auto_473016 ) ) ( not ( = ?auto_473014 ?auto_473017 ) ) ( not ( = ?auto_473014 ?auto_473018 ) ) ( not ( = ?auto_473014 ?auto_473019 ) ) ( not ( = ?auto_473014 ?auto_473020 ) ) ( not ( = ?auto_473014 ?auto_473021 ) ) ( not ( = ?auto_473014 ?auto_473022 ) ) ( not ( = ?auto_473014 ?auto_473023 ) ) ( not ( = ?auto_473015 ?auto_473016 ) ) ( not ( = ?auto_473015 ?auto_473017 ) ) ( not ( = ?auto_473015 ?auto_473018 ) ) ( not ( = ?auto_473015 ?auto_473019 ) ) ( not ( = ?auto_473015 ?auto_473020 ) ) ( not ( = ?auto_473015 ?auto_473021 ) ) ( not ( = ?auto_473015 ?auto_473022 ) ) ( not ( = ?auto_473015 ?auto_473023 ) ) ( not ( = ?auto_473016 ?auto_473017 ) ) ( not ( = ?auto_473016 ?auto_473018 ) ) ( not ( = ?auto_473016 ?auto_473019 ) ) ( not ( = ?auto_473016 ?auto_473020 ) ) ( not ( = ?auto_473016 ?auto_473021 ) ) ( not ( = ?auto_473016 ?auto_473022 ) ) ( not ( = ?auto_473016 ?auto_473023 ) ) ( not ( = ?auto_473017 ?auto_473018 ) ) ( not ( = ?auto_473017 ?auto_473019 ) ) ( not ( = ?auto_473017 ?auto_473020 ) ) ( not ( = ?auto_473017 ?auto_473021 ) ) ( not ( = ?auto_473017 ?auto_473022 ) ) ( not ( = ?auto_473017 ?auto_473023 ) ) ( not ( = ?auto_473018 ?auto_473019 ) ) ( not ( = ?auto_473018 ?auto_473020 ) ) ( not ( = ?auto_473018 ?auto_473021 ) ) ( not ( = ?auto_473018 ?auto_473022 ) ) ( not ( = ?auto_473018 ?auto_473023 ) ) ( not ( = ?auto_473019 ?auto_473020 ) ) ( not ( = ?auto_473019 ?auto_473021 ) ) ( not ( = ?auto_473019 ?auto_473022 ) ) ( not ( = ?auto_473019 ?auto_473023 ) ) ( not ( = ?auto_473020 ?auto_473021 ) ) ( not ( = ?auto_473020 ?auto_473022 ) ) ( not ( = ?auto_473020 ?auto_473023 ) ) ( not ( = ?auto_473021 ?auto_473022 ) ) ( not ( = ?auto_473021 ?auto_473023 ) ) ( not ( = ?auto_473022 ?auto_473023 ) ) ( ON ?auto_473021 ?auto_473022 ) ( ON ?auto_473020 ?auto_473021 ) ( CLEAR ?auto_473018 ) ( ON ?auto_473019 ?auto_473020 ) ( CLEAR ?auto_473019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_473012 ?auto_473013 ?auto_473014 ?auto_473015 ?auto_473016 ?auto_473017 ?auto_473018 ?auto_473019 )
      ( MAKE-11PILE ?auto_473012 ?auto_473013 ?auto_473014 ?auto_473015 ?auto_473016 ?auto_473017 ?auto_473018 ?auto_473019 ?auto_473020 ?auto_473021 ?auto_473022 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473058 - BLOCK
      ?auto_473059 - BLOCK
      ?auto_473060 - BLOCK
      ?auto_473061 - BLOCK
      ?auto_473062 - BLOCK
      ?auto_473063 - BLOCK
      ?auto_473064 - BLOCK
      ?auto_473065 - BLOCK
      ?auto_473066 - BLOCK
      ?auto_473067 - BLOCK
      ?auto_473068 - BLOCK
    )
    :vars
    (
      ?auto_473069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473068 ?auto_473069 ) ( ON-TABLE ?auto_473058 ) ( ON ?auto_473059 ?auto_473058 ) ( ON ?auto_473060 ?auto_473059 ) ( ON ?auto_473061 ?auto_473060 ) ( ON ?auto_473062 ?auto_473061 ) ( ON ?auto_473063 ?auto_473062 ) ( not ( = ?auto_473058 ?auto_473059 ) ) ( not ( = ?auto_473058 ?auto_473060 ) ) ( not ( = ?auto_473058 ?auto_473061 ) ) ( not ( = ?auto_473058 ?auto_473062 ) ) ( not ( = ?auto_473058 ?auto_473063 ) ) ( not ( = ?auto_473058 ?auto_473064 ) ) ( not ( = ?auto_473058 ?auto_473065 ) ) ( not ( = ?auto_473058 ?auto_473066 ) ) ( not ( = ?auto_473058 ?auto_473067 ) ) ( not ( = ?auto_473058 ?auto_473068 ) ) ( not ( = ?auto_473058 ?auto_473069 ) ) ( not ( = ?auto_473059 ?auto_473060 ) ) ( not ( = ?auto_473059 ?auto_473061 ) ) ( not ( = ?auto_473059 ?auto_473062 ) ) ( not ( = ?auto_473059 ?auto_473063 ) ) ( not ( = ?auto_473059 ?auto_473064 ) ) ( not ( = ?auto_473059 ?auto_473065 ) ) ( not ( = ?auto_473059 ?auto_473066 ) ) ( not ( = ?auto_473059 ?auto_473067 ) ) ( not ( = ?auto_473059 ?auto_473068 ) ) ( not ( = ?auto_473059 ?auto_473069 ) ) ( not ( = ?auto_473060 ?auto_473061 ) ) ( not ( = ?auto_473060 ?auto_473062 ) ) ( not ( = ?auto_473060 ?auto_473063 ) ) ( not ( = ?auto_473060 ?auto_473064 ) ) ( not ( = ?auto_473060 ?auto_473065 ) ) ( not ( = ?auto_473060 ?auto_473066 ) ) ( not ( = ?auto_473060 ?auto_473067 ) ) ( not ( = ?auto_473060 ?auto_473068 ) ) ( not ( = ?auto_473060 ?auto_473069 ) ) ( not ( = ?auto_473061 ?auto_473062 ) ) ( not ( = ?auto_473061 ?auto_473063 ) ) ( not ( = ?auto_473061 ?auto_473064 ) ) ( not ( = ?auto_473061 ?auto_473065 ) ) ( not ( = ?auto_473061 ?auto_473066 ) ) ( not ( = ?auto_473061 ?auto_473067 ) ) ( not ( = ?auto_473061 ?auto_473068 ) ) ( not ( = ?auto_473061 ?auto_473069 ) ) ( not ( = ?auto_473062 ?auto_473063 ) ) ( not ( = ?auto_473062 ?auto_473064 ) ) ( not ( = ?auto_473062 ?auto_473065 ) ) ( not ( = ?auto_473062 ?auto_473066 ) ) ( not ( = ?auto_473062 ?auto_473067 ) ) ( not ( = ?auto_473062 ?auto_473068 ) ) ( not ( = ?auto_473062 ?auto_473069 ) ) ( not ( = ?auto_473063 ?auto_473064 ) ) ( not ( = ?auto_473063 ?auto_473065 ) ) ( not ( = ?auto_473063 ?auto_473066 ) ) ( not ( = ?auto_473063 ?auto_473067 ) ) ( not ( = ?auto_473063 ?auto_473068 ) ) ( not ( = ?auto_473063 ?auto_473069 ) ) ( not ( = ?auto_473064 ?auto_473065 ) ) ( not ( = ?auto_473064 ?auto_473066 ) ) ( not ( = ?auto_473064 ?auto_473067 ) ) ( not ( = ?auto_473064 ?auto_473068 ) ) ( not ( = ?auto_473064 ?auto_473069 ) ) ( not ( = ?auto_473065 ?auto_473066 ) ) ( not ( = ?auto_473065 ?auto_473067 ) ) ( not ( = ?auto_473065 ?auto_473068 ) ) ( not ( = ?auto_473065 ?auto_473069 ) ) ( not ( = ?auto_473066 ?auto_473067 ) ) ( not ( = ?auto_473066 ?auto_473068 ) ) ( not ( = ?auto_473066 ?auto_473069 ) ) ( not ( = ?auto_473067 ?auto_473068 ) ) ( not ( = ?auto_473067 ?auto_473069 ) ) ( not ( = ?auto_473068 ?auto_473069 ) ) ( ON ?auto_473067 ?auto_473068 ) ( ON ?auto_473066 ?auto_473067 ) ( ON ?auto_473065 ?auto_473066 ) ( CLEAR ?auto_473063 ) ( ON ?auto_473064 ?auto_473065 ) ( CLEAR ?auto_473064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_473058 ?auto_473059 ?auto_473060 ?auto_473061 ?auto_473062 ?auto_473063 ?auto_473064 )
      ( MAKE-11PILE ?auto_473058 ?auto_473059 ?auto_473060 ?auto_473061 ?auto_473062 ?auto_473063 ?auto_473064 ?auto_473065 ?auto_473066 ?auto_473067 ?auto_473068 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473104 - BLOCK
      ?auto_473105 - BLOCK
      ?auto_473106 - BLOCK
      ?auto_473107 - BLOCK
      ?auto_473108 - BLOCK
      ?auto_473109 - BLOCK
      ?auto_473110 - BLOCK
      ?auto_473111 - BLOCK
      ?auto_473112 - BLOCK
      ?auto_473113 - BLOCK
      ?auto_473114 - BLOCK
    )
    :vars
    (
      ?auto_473115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473114 ?auto_473115 ) ( ON-TABLE ?auto_473104 ) ( ON ?auto_473105 ?auto_473104 ) ( ON ?auto_473106 ?auto_473105 ) ( ON ?auto_473107 ?auto_473106 ) ( ON ?auto_473108 ?auto_473107 ) ( not ( = ?auto_473104 ?auto_473105 ) ) ( not ( = ?auto_473104 ?auto_473106 ) ) ( not ( = ?auto_473104 ?auto_473107 ) ) ( not ( = ?auto_473104 ?auto_473108 ) ) ( not ( = ?auto_473104 ?auto_473109 ) ) ( not ( = ?auto_473104 ?auto_473110 ) ) ( not ( = ?auto_473104 ?auto_473111 ) ) ( not ( = ?auto_473104 ?auto_473112 ) ) ( not ( = ?auto_473104 ?auto_473113 ) ) ( not ( = ?auto_473104 ?auto_473114 ) ) ( not ( = ?auto_473104 ?auto_473115 ) ) ( not ( = ?auto_473105 ?auto_473106 ) ) ( not ( = ?auto_473105 ?auto_473107 ) ) ( not ( = ?auto_473105 ?auto_473108 ) ) ( not ( = ?auto_473105 ?auto_473109 ) ) ( not ( = ?auto_473105 ?auto_473110 ) ) ( not ( = ?auto_473105 ?auto_473111 ) ) ( not ( = ?auto_473105 ?auto_473112 ) ) ( not ( = ?auto_473105 ?auto_473113 ) ) ( not ( = ?auto_473105 ?auto_473114 ) ) ( not ( = ?auto_473105 ?auto_473115 ) ) ( not ( = ?auto_473106 ?auto_473107 ) ) ( not ( = ?auto_473106 ?auto_473108 ) ) ( not ( = ?auto_473106 ?auto_473109 ) ) ( not ( = ?auto_473106 ?auto_473110 ) ) ( not ( = ?auto_473106 ?auto_473111 ) ) ( not ( = ?auto_473106 ?auto_473112 ) ) ( not ( = ?auto_473106 ?auto_473113 ) ) ( not ( = ?auto_473106 ?auto_473114 ) ) ( not ( = ?auto_473106 ?auto_473115 ) ) ( not ( = ?auto_473107 ?auto_473108 ) ) ( not ( = ?auto_473107 ?auto_473109 ) ) ( not ( = ?auto_473107 ?auto_473110 ) ) ( not ( = ?auto_473107 ?auto_473111 ) ) ( not ( = ?auto_473107 ?auto_473112 ) ) ( not ( = ?auto_473107 ?auto_473113 ) ) ( not ( = ?auto_473107 ?auto_473114 ) ) ( not ( = ?auto_473107 ?auto_473115 ) ) ( not ( = ?auto_473108 ?auto_473109 ) ) ( not ( = ?auto_473108 ?auto_473110 ) ) ( not ( = ?auto_473108 ?auto_473111 ) ) ( not ( = ?auto_473108 ?auto_473112 ) ) ( not ( = ?auto_473108 ?auto_473113 ) ) ( not ( = ?auto_473108 ?auto_473114 ) ) ( not ( = ?auto_473108 ?auto_473115 ) ) ( not ( = ?auto_473109 ?auto_473110 ) ) ( not ( = ?auto_473109 ?auto_473111 ) ) ( not ( = ?auto_473109 ?auto_473112 ) ) ( not ( = ?auto_473109 ?auto_473113 ) ) ( not ( = ?auto_473109 ?auto_473114 ) ) ( not ( = ?auto_473109 ?auto_473115 ) ) ( not ( = ?auto_473110 ?auto_473111 ) ) ( not ( = ?auto_473110 ?auto_473112 ) ) ( not ( = ?auto_473110 ?auto_473113 ) ) ( not ( = ?auto_473110 ?auto_473114 ) ) ( not ( = ?auto_473110 ?auto_473115 ) ) ( not ( = ?auto_473111 ?auto_473112 ) ) ( not ( = ?auto_473111 ?auto_473113 ) ) ( not ( = ?auto_473111 ?auto_473114 ) ) ( not ( = ?auto_473111 ?auto_473115 ) ) ( not ( = ?auto_473112 ?auto_473113 ) ) ( not ( = ?auto_473112 ?auto_473114 ) ) ( not ( = ?auto_473112 ?auto_473115 ) ) ( not ( = ?auto_473113 ?auto_473114 ) ) ( not ( = ?auto_473113 ?auto_473115 ) ) ( not ( = ?auto_473114 ?auto_473115 ) ) ( ON ?auto_473113 ?auto_473114 ) ( ON ?auto_473112 ?auto_473113 ) ( ON ?auto_473111 ?auto_473112 ) ( ON ?auto_473110 ?auto_473111 ) ( CLEAR ?auto_473108 ) ( ON ?auto_473109 ?auto_473110 ) ( CLEAR ?auto_473109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_473104 ?auto_473105 ?auto_473106 ?auto_473107 ?auto_473108 ?auto_473109 )
      ( MAKE-11PILE ?auto_473104 ?auto_473105 ?auto_473106 ?auto_473107 ?auto_473108 ?auto_473109 ?auto_473110 ?auto_473111 ?auto_473112 ?auto_473113 ?auto_473114 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473150 - BLOCK
      ?auto_473151 - BLOCK
      ?auto_473152 - BLOCK
      ?auto_473153 - BLOCK
      ?auto_473154 - BLOCK
      ?auto_473155 - BLOCK
      ?auto_473156 - BLOCK
      ?auto_473157 - BLOCK
      ?auto_473158 - BLOCK
      ?auto_473159 - BLOCK
      ?auto_473160 - BLOCK
    )
    :vars
    (
      ?auto_473161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473160 ?auto_473161 ) ( ON-TABLE ?auto_473150 ) ( ON ?auto_473151 ?auto_473150 ) ( ON ?auto_473152 ?auto_473151 ) ( ON ?auto_473153 ?auto_473152 ) ( not ( = ?auto_473150 ?auto_473151 ) ) ( not ( = ?auto_473150 ?auto_473152 ) ) ( not ( = ?auto_473150 ?auto_473153 ) ) ( not ( = ?auto_473150 ?auto_473154 ) ) ( not ( = ?auto_473150 ?auto_473155 ) ) ( not ( = ?auto_473150 ?auto_473156 ) ) ( not ( = ?auto_473150 ?auto_473157 ) ) ( not ( = ?auto_473150 ?auto_473158 ) ) ( not ( = ?auto_473150 ?auto_473159 ) ) ( not ( = ?auto_473150 ?auto_473160 ) ) ( not ( = ?auto_473150 ?auto_473161 ) ) ( not ( = ?auto_473151 ?auto_473152 ) ) ( not ( = ?auto_473151 ?auto_473153 ) ) ( not ( = ?auto_473151 ?auto_473154 ) ) ( not ( = ?auto_473151 ?auto_473155 ) ) ( not ( = ?auto_473151 ?auto_473156 ) ) ( not ( = ?auto_473151 ?auto_473157 ) ) ( not ( = ?auto_473151 ?auto_473158 ) ) ( not ( = ?auto_473151 ?auto_473159 ) ) ( not ( = ?auto_473151 ?auto_473160 ) ) ( not ( = ?auto_473151 ?auto_473161 ) ) ( not ( = ?auto_473152 ?auto_473153 ) ) ( not ( = ?auto_473152 ?auto_473154 ) ) ( not ( = ?auto_473152 ?auto_473155 ) ) ( not ( = ?auto_473152 ?auto_473156 ) ) ( not ( = ?auto_473152 ?auto_473157 ) ) ( not ( = ?auto_473152 ?auto_473158 ) ) ( not ( = ?auto_473152 ?auto_473159 ) ) ( not ( = ?auto_473152 ?auto_473160 ) ) ( not ( = ?auto_473152 ?auto_473161 ) ) ( not ( = ?auto_473153 ?auto_473154 ) ) ( not ( = ?auto_473153 ?auto_473155 ) ) ( not ( = ?auto_473153 ?auto_473156 ) ) ( not ( = ?auto_473153 ?auto_473157 ) ) ( not ( = ?auto_473153 ?auto_473158 ) ) ( not ( = ?auto_473153 ?auto_473159 ) ) ( not ( = ?auto_473153 ?auto_473160 ) ) ( not ( = ?auto_473153 ?auto_473161 ) ) ( not ( = ?auto_473154 ?auto_473155 ) ) ( not ( = ?auto_473154 ?auto_473156 ) ) ( not ( = ?auto_473154 ?auto_473157 ) ) ( not ( = ?auto_473154 ?auto_473158 ) ) ( not ( = ?auto_473154 ?auto_473159 ) ) ( not ( = ?auto_473154 ?auto_473160 ) ) ( not ( = ?auto_473154 ?auto_473161 ) ) ( not ( = ?auto_473155 ?auto_473156 ) ) ( not ( = ?auto_473155 ?auto_473157 ) ) ( not ( = ?auto_473155 ?auto_473158 ) ) ( not ( = ?auto_473155 ?auto_473159 ) ) ( not ( = ?auto_473155 ?auto_473160 ) ) ( not ( = ?auto_473155 ?auto_473161 ) ) ( not ( = ?auto_473156 ?auto_473157 ) ) ( not ( = ?auto_473156 ?auto_473158 ) ) ( not ( = ?auto_473156 ?auto_473159 ) ) ( not ( = ?auto_473156 ?auto_473160 ) ) ( not ( = ?auto_473156 ?auto_473161 ) ) ( not ( = ?auto_473157 ?auto_473158 ) ) ( not ( = ?auto_473157 ?auto_473159 ) ) ( not ( = ?auto_473157 ?auto_473160 ) ) ( not ( = ?auto_473157 ?auto_473161 ) ) ( not ( = ?auto_473158 ?auto_473159 ) ) ( not ( = ?auto_473158 ?auto_473160 ) ) ( not ( = ?auto_473158 ?auto_473161 ) ) ( not ( = ?auto_473159 ?auto_473160 ) ) ( not ( = ?auto_473159 ?auto_473161 ) ) ( not ( = ?auto_473160 ?auto_473161 ) ) ( ON ?auto_473159 ?auto_473160 ) ( ON ?auto_473158 ?auto_473159 ) ( ON ?auto_473157 ?auto_473158 ) ( ON ?auto_473156 ?auto_473157 ) ( ON ?auto_473155 ?auto_473156 ) ( CLEAR ?auto_473153 ) ( ON ?auto_473154 ?auto_473155 ) ( CLEAR ?auto_473154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_473150 ?auto_473151 ?auto_473152 ?auto_473153 ?auto_473154 )
      ( MAKE-11PILE ?auto_473150 ?auto_473151 ?auto_473152 ?auto_473153 ?auto_473154 ?auto_473155 ?auto_473156 ?auto_473157 ?auto_473158 ?auto_473159 ?auto_473160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473196 - BLOCK
      ?auto_473197 - BLOCK
      ?auto_473198 - BLOCK
      ?auto_473199 - BLOCK
      ?auto_473200 - BLOCK
      ?auto_473201 - BLOCK
      ?auto_473202 - BLOCK
      ?auto_473203 - BLOCK
      ?auto_473204 - BLOCK
      ?auto_473205 - BLOCK
      ?auto_473206 - BLOCK
    )
    :vars
    (
      ?auto_473207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473206 ?auto_473207 ) ( ON-TABLE ?auto_473196 ) ( ON ?auto_473197 ?auto_473196 ) ( ON ?auto_473198 ?auto_473197 ) ( not ( = ?auto_473196 ?auto_473197 ) ) ( not ( = ?auto_473196 ?auto_473198 ) ) ( not ( = ?auto_473196 ?auto_473199 ) ) ( not ( = ?auto_473196 ?auto_473200 ) ) ( not ( = ?auto_473196 ?auto_473201 ) ) ( not ( = ?auto_473196 ?auto_473202 ) ) ( not ( = ?auto_473196 ?auto_473203 ) ) ( not ( = ?auto_473196 ?auto_473204 ) ) ( not ( = ?auto_473196 ?auto_473205 ) ) ( not ( = ?auto_473196 ?auto_473206 ) ) ( not ( = ?auto_473196 ?auto_473207 ) ) ( not ( = ?auto_473197 ?auto_473198 ) ) ( not ( = ?auto_473197 ?auto_473199 ) ) ( not ( = ?auto_473197 ?auto_473200 ) ) ( not ( = ?auto_473197 ?auto_473201 ) ) ( not ( = ?auto_473197 ?auto_473202 ) ) ( not ( = ?auto_473197 ?auto_473203 ) ) ( not ( = ?auto_473197 ?auto_473204 ) ) ( not ( = ?auto_473197 ?auto_473205 ) ) ( not ( = ?auto_473197 ?auto_473206 ) ) ( not ( = ?auto_473197 ?auto_473207 ) ) ( not ( = ?auto_473198 ?auto_473199 ) ) ( not ( = ?auto_473198 ?auto_473200 ) ) ( not ( = ?auto_473198 ?auto_473201 ) ) ( not ( = ?auto_473198 ?auto_473202 ) ) ( not ( = ?auto_473198 ?auto_473203 ) ) ( not ( = ?auto_473198 ?auto_473204 ) ) ( not ( = ?auto_473198 ?auto_473205 ) ) ( not ( = ?auto_473198 ?auto_473206 ) ) ( not ( = ?auto_473198 ?auto_473207 ) ) ( not ( = ?auto_473199 ?auto_473200 ) ) ( not ( = ?auto_473199 ?auto_473201 ) ) ( not ( = ?auto_473199 ?auto_473202 ) ) ( not ( = ?auto_473199 ?auto_473203 ) ) ( not ( = ?auto_473199 ?auto_473204 ) ) ( not ( = ?auto_473199 ?auto_473205 ) ) ( not ( = ?auto_473199 ?auto_473206 ) ) ( not ( = ?auto_473199 ?auto_473207 ) ) ( not ( = ?auto_473200 ?auto_473201 ) ) ( not ( = ?auto_473200 ?auto_473202 ) ) ( not ( = ?auto_473200 ?auto_473203 ) ) ( not ( = ?auto_473200 ?auto_473204 ) ) ( not ( = ?auto_473200 ?auto_473205 ) ) ( not ( = ?auto_473200 ?auto_473206 ) ) ( not ( = ?auto_473200 ?auto_473207 ) ) ( not ( = ?auto_473201 ?auto_473202 ) ) ( not ( = ?auto_473201 ?auto_473203 ) ) ( not ( = ?auto_473201 ?auto_473204 ) ) ( not ( = ?auto_473201 ?auto_473205 ) ) ( not ( = ?auto_473201 ?auto_473206 ) ) ( not ( = ?auto_473201 ?auto_473207 ) ) ( not ( = ?auto_473202 ?auto_473203 ) ) ( not ( = ?auto_473202 ?auto_473204 ) ) ( not ( = ?auto_473202 ?auto_473205 ) ) ( not ( = ?auto_473202 ?auto_473206 ) ) ( not ( = ?auto_473202 ?auto_473207 ) ) ( not ( = ?auto_473203 ?auto_473204 ) ) ( not ( = ?auto_473203 ?auto_473205 ) ) ( not ( = ?auto_473203 ?auto_473206 ) ) ( not ( = ?auto_473203 ?auto_473207 ) ) ( not ( = ?auto_473204 ?auto_473205 ) ) ( not ( = ?auto_473204 ?auto_473206 ) ) ( not ( = ?auto_473204 ?auto_473207 ) ) ( not ( = ?auto_473205 ?auto_473206 ) ) ( not ( = ?auto_473205 ?auto_473207 ) ) ( not ( = ?auto_473206 ?auto_473207 ) ) ( ON ?auto_473205 ?auto_473206 ) ( ON ?auto_473204 ?auto_473205 ) ( ON ?auto_473203 ?auto_473204 ) ( ON ?auto_473202 ?auto_473203 ) ( ON ?auto_473201 ?auto_473202 ) ( ON ?auto_473200 ?auto_473201 ) ( CLEAR ?auto_473198 ) ( ON ?auto_473199 ?auto_473200 ) ( CLEAR ?auto_473199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_473196 ?auto_473197 ?auto_473198 ?auto_473199 )
      ( MAKE-11PILE ?auto_473196 ?auto_473197 ?auto_473198 ?auto_473199 ?auto_473200 ?auto_473201 ?auto_473202 ?auto_473203 ?auto_473204 ?auto_473205 ?auto_473206 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473242 - BLOCK
      ?auto_473243 - BLOCK
      ?auto_473244 - BLOCK
      ?auto_473245 - BLOCK
      ?auto_473246 - BLOCK
      ?auto_473247 - BLOCK
      ?auto_473248 - BLOCK
      ?auto_473249 - BLOCK
      ?auto_473250 - BLOCK
      ?auto_473251 - BLOCK
      ?auto_473252 - BLOCK
    )
    :vars
    (
      ?auto_473253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473252 ?auto_473253 ) ( ON-TABLE ?auto_473242 ) ( ON ?auto_473243 ?auto_473242 ) ( not ( = ?auto_473242 ?auto_473243 ) ) ( not ( = ?auto_473242 ?auto_473244 ) ) ( not ( = ?auto_473242 ?auto_473245 ) ) ( not ( = ?auto_473242 ?auto_473246 ) ) ( not ( = ?auto_473242 ?auto_473247 ) ) ( not ( = ?auto_473242 ?auto_473248 ) ) ( not ( = ?auto_473242 ?auto_473249 ) ) ( not ( = ?auto_473242 ?auto_473250 ) ) ( not ( = ?auto_473242 ?auto_473251 ) ) ( not ( = ?auto_473242 ?auto_473252 ) ) ( not ( = ?auto_473242 ?auto_473253 ) ) ( not ( = ?auto_473243 ?auto_473244 ) ) ( not ( = ?auto_473243 ?auto_473245 ) ) ( not ( = ?auto_473243 ?auto_473246 ) ) ( not ( = ?auto_473243 ?auto_473247 ) ) ( not ( = ?auto_473243 ?auto_473248 ) ) ( not ( = ?auto_473243 ?auto_473249 ) ) ( not ( = ?auto_473243 ?auto_473250 ) ) ( not ( = ?auto_473243 ?auto_473251 ) ) ( not ( = ?auto_473243 ?auto_473252 ) ) ( not ( = ?auto_473243 ?auto_473253 ) ) ( not ( = ?auto_473244 ?auto_473245 ) ) ( not ( = ?auto_473244 ?auto_473246 ) ) ( not ( = ?auto_473244 ?auto_473247 ) ) ( not ( = ?auto_473244 ?auto_473248 ) ) ( not ( = ?auto_473244 ?auto_473249 ) ) ( not ( = ?auto_473244 ?auto_473250 ) ) ( not ( = ?auto_473244 ?auto_473251 ) ) ( not ( = ?auto_473244 ?auto_473252 ) ) ( not ( = ?auto_473244 ?auto_473253 ) ) ( not ( = ?auto_473245 ?auto_473246 ) ) ( not ( = ?auto_473245 ?auto_473247 ) ) ( not ( = ?auto_473245 ?auto_473248 ) ) ( not ( = ?auto_473245 ?auto_473249 ) ) ( not ( = ?auto_473245 ?auto_473250 ) ) ( not ( = ?auto_473245 ?auto_473251 ) ) ( not ( = ?auto_473245 ?auto_473252 ) ) ( not ( = ?auto_473245 ?auto_473253 ) ) ( not ( = ?auto_473246 ?auto_473247 ) ) ( not ( = ?auto_473246 ?auto_473248 ) ) ( not ( = ?auto_473246 ?auto_473249 ) ) ( not ( = ?auto_473246 ?auto_473250 ) ) ( not ( = ?auto_473246 ?auto_473251 ) ) ( not ( = ?auto_473246 ?auto_473252 ) ) ( not ( = ?auto_473246 ?auto_473253 ) ) ( not ( = ?auto_473247 ?auto_473248 ) ) ( not ( = ?auto_473247 ?auto_473249 ) ) ( not ( = ?auto_473247 ?auto_473250 ) ) ( not ( = ?auto_473247 ?auto_473251 ) ) ( not ( = ?auto_473247 ?auto_473252 ) ) ( not ( = ?auto_473247 ?auto_473253 ) ) ( not ( = ?auto_473248 ?auto_473249 ) ) ( not ( = ?auto_473248 ?auto_473250 ) ) ( not ( = ?auto_473248 ?auto_473251 ) ) ( not ( = ?auto_473248 ?auto_473252 ) ) ( not ( = ?auto_473248 ?auto_473253 ) ) ( not ( = ?auto_473249 ?auto_473250 ) ) ( not ( = ?auto_473249 ?auto_473251 ) ) ( not ( = ?auto_473249 ?auto_473252 ) ) ( not ( = ?auto_473249 ?auto_473253 ) ) ( not ( = ?auto_473250 ?auto_473251 ) ) ( not ( = ?auto_473250 ?auto_473252 ) ) ( not ( = ?auto_473250 ?auto_473253 ) ) ( not ( = ?auto_473251 ?auto_473252 ) ) ( not ( = ?auto_473251 ?auto_473253 ) ) ( not ( = ?auto_473252 ?auto_473253 ) ) ( ON ?auto_473251 ?auto_473252 ) ( ON ?auto_473250 ?auto_473251 ) ( ON ?auto_473249 ?auto_473250 ) ( ON ?auto_473248 ?auto_473249 ) ( ON ?auto_473247 ?auto_473248 ) ( ON ?auto_473246 ?auto_473247 ) ( ON ?auto_473245 ?auto_473246 ) ( CLEAR ?auto_473243 ) ( ON ?auto_473244 ?auto_473245 ) ( CLEAR ?auto_473244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_473242 ?auto_473243 ?auto_473244 )
      ( MAKE-11PILE ?auto_473242 ?auto_473243 ?auto_473244 ?auto_473245 ?auto_473246 ?auto_473247 ?auto_473248 ?auto_473249 ?auto_473250 ?auto_473251 ?auto_473252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473288 - BLOCK
      ?auto_473289 - BLOCK
      ?auto_473290 - BLOCK
      ?auto_473291 - BLOCK
      ?auto_473292 - BLOCK
      ?auto_473293 - BLOCK
      ?auto_473294 - BLOCK
      ?auto_473295 - BLOCK
      ?auto_473296 - BLOCK
      ?auto_473297 - BLOCK
      ?auto_473298 - BLOCK
    )
    :vars
    (
      ?auto_473299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473298 ?auto_473299 ) ( ON-TABLE ?auto_473288 ) ( not ( = ?auto_473288 ?auto_473289 ) ) ( not ( = ?auto_473288 ?auto_473290 ) ) ( not ( = ?auto_473288 ?auto_473291 ) ) ( not ( = ?auto_473288 ?auto_473292 ) ) ( not ( = ?auto_473288 ?auto_473293 ) ) ( not ( = ?auto_473288 ?auto_473294 ) ) ( not ( = ?auto_473288 ?auto_473295 ) ) ( not ( = ?auto_473288 ?auto_473296 ) ) ( not ( = ?auto_473288 ?auto_473297 ) ) ( not ( = ?auto_473288 ?auto_473298 ) ) ( not ( = ?auto_473288 ?auto_473299 ) ) ( not ( = ?auto_473289 ?auto_473290 ) ) ( not ( = ?auto_473289 ?auto_473291 ) ) ( not ( = ?auto_473289 ?auto_473292 ) ) ( not ( = ?auto_473289 ?auto_473293 ) ) ( not ( = ?auto_473289 ?auto_473294 ) ) ( not ( = ?auto_473289 ?auto_473295 ) ) ( not ( = ?auto_473289 ?auto_473296 ) ) ( not ( = ?auto_473289 ?auto_473297 ) ) ( not ( = ?auto_473289 ?auto_473298 ) ) ( not ( = ?auto_473289 ?auto_473299 ) ) ( not ( = ?auto_473290 ?auto_473291 ) ) ( not ( = ?auto_473290 ?auto_473292 ) ) ( not ( = ?auto_473290 ?auto_473293 ) ) ( not ( = ?auto_473290 ?auto_473294 ) ) ( not ( = ?auto_473290 ?auto_473295 ) ) ( not ( = ?auto_473290 ?auto_473296 ) ) ( not ( = ?auto_473290 ?auto_473297 ) ) ( not ( = ?auto_473290 ?auto_473298 ) ) ( not ( = ?auto_473290 ?auto_473299 ) ) ( not ( = ?auto_473291 ?auto_473292 ) ) ( not ( = ?auto_473291 ?auto_473293 ) ) ( not ( = ?auto_473291 ?auto_473294 ) ) ( not ( = ?auto_473291 ?auto_473295 ) ) ( not ( = ?auto_473291 ?auto_473296 ) ) ( not ( = ?auto_473291 ?auto_473297 ) ) ( not ( = ?auto_473291 ?auto_473298 ) ) ( not ( = ?auto_473291 ?auto_473299 ) ) ( not ( = ?auto_473292 ?auto_473293 ) ) ( not ( = ?auto_473292 ?auto_473294 ) ) ( not ( = ?auto_473292 ?auto_473295 ) ) ( not ( = ?auto_473292 ?auto_473296 ) ) ( not ( = ?auto_473292 ?auto_473297 ) ) ( not ( = ?auto_473292 ?auto_473298 ) ) ( not ( = ?auto_473292 ?auto_473299 ) ) ( not ( = ?auto_473293 ?auto_473294 ) ) ( not ( = ?auto_473293 ?auto_473295 ) ) ( not ( = ?auto_473293 ?auto_473296 ) ) ( not ( = ?auto_473293 ?auto_473297 ) ) ( not ( = ?auto_473293 ?auto_473298 ) ) ( not ( = ?auto_473293 ?auto_473299 ) ) ( not ( = ?auto_473294 ?auto_473295 ) ) ( not ( = ?auto_473294 ?auto_473296 ) ) ( not ( = ?auto_473294 ?auto_473297 ) ) ( not ( = ?auto_473294 ?auto_473298 ) ) ( not ( = ?auto_473294 ?auto_473299 ) ) ( not ( = ?auto_473295 ?auto_473296 ) ) ( not ( = ?auto_473295 ?auto_473297 ) ) ( not ( = ?auto_473295 ?auto_473298 ) ) ( not ( = ?auto_473295 ?auto_473299 ) ) ( not ( = ?auto_473296 ?auto_473297 ) ) ( not ( = ?auto_473296 ?auto_473298 ) ) ( not ( = ?auto_473296 ?auto_473299 ) ) ( not ( = ?auto_473297 ?auto_473298 ) ) ( not ( = ?auto_473297 ?auto_473299 ) ) ( not ( = ?auto_473298 ?auto_473299 ) ) ( ON ?auto_473297 ?auto_473298 ) ( ON ?auto_473296 ?auto_473297 ) ( ON ?auto_473295 ?auto_473296 ) ( ON ?auto_473294 ?auto_473295 ) ( ON ?auto_473293 ?auto_473294 ) ( ON ?auto_473292 ?auto_473293 ) ( ON ?auto_473291 ?auto_473292 ) ( ON ?auto_473290 ?auto_473291 ) ( CLEAR ?auto_473288 ) ( ON ?auto_473289 ?auto_473290 ) ( CLEAR ?auto_473289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_473288 ?auto_473289 )
      ( MAKE-11PILE ?auto_473288 ?auto_473289 ?auto_473290 ?auto_473291 ?auto_473292 ?auto_473293 ?auto_473294 ?auto_473295 ?auto_473296 ?auto_473297 ?auto_473298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_473334 - BLOCK
      ?auto_473335 - BLOCK
      ?auto_473336 - BLOCK
      ?auto_473337 - BLOCK
      ?auto_473338 - BLOCK
      ?auto_473339 - BLOCK
      ?auto_473340 - BLOCK
      ?auto_473341 - BLOCK
      ?auto_473342 - BLOCK
      ?auto_473343 - BLOCK
      ?auto_473344 - BLOCK
    )
    :vars
    (
      ?auto_473345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473344 ?auto_473345 ) ( not ( = ?auto_473334 ?auto_473335 ) ) ( not ( = ?auto_473334 ?auto_473336 ) ) ( not ( = ?auto_473334 ?auto_473337 ) ) ( not ( = ?auto_473334 ?auto_473338 ) ) ( not ( = ?auto_473334 ?auto_473339 ) ) ( not ( = ?auto_473334 ?auto_473340 ) ) ( not ( = ?auto_473334 ?auto_473341 ) ) ( not ( = ?auto_473334 ?auto_473342 ) ) ( not ( = ?auto_473334 ?auto_473343 ) ) ( not ( = ?auto_473334 ?auto_473344 ) ) ( not ( = ?auto_473334 ?auto_473345 ) ) ( not ( = ?auto_473335 ?auto_473336 ) ) ( not ( = ?auto_473335 ?auto_473337 ) ) ( not ( = ?auto_473335 ?auto_473338 ) ) ( not ( = ?auto_473335 ?auto_473339 ) ) ( not ( = ?auto_473335 ?auto_473340 ) ) ( not ( = ?auto_473335 ?auto_473341 ) ) ( not ( = ?auto_473335 ?auto_473342 ) ) ( not ( = ?auto_473335 ?auto_473343 ) ) ( not ( = ?auto_473335 ?auto_473344 ) ) ( not ( = ?auto_473335 ?auto_473345 ) ) ( not ( = ?auto_473336 ?auto_473337 ) ) ( not ( = ?auto_473336 ?auto_473338 ) ) ( not ( = ?auto_473336 ?auto_473339 ) ) ( not ( = ?auto_473336 ?auto_473340 ) ) ( not ( = ?auto_473336 ?auto_473341 ) ) ( not ( = ?auto_473336 ?auto_473342 ) ) ( not ( = ?auto_473336 ?auto_473343 ) ) ( not ( = ?auto_473336 ?auto_473344 ) ) ( not ( = ?auto_473336 ?auto_473345 ) ) ( not ( = ?auto_473337 ?auto_473338 ) ) ( not ( = ?auto_473337 ?auto_473339 ) ) ( not ( = ?auto_473337 ?auto_473340 ) ) ( not ( = ?auto_473337 ?auto_473341 ) ) ( not ( = ?auto_473337 ?auto_473342 ) ) ( not ( = ?auto_473337 ?auto_473343 ) ) ( not ( = ?auto_473337 ?auto_473344 ) ) ( not ( = ?auto_473337 ?auto_473345 ) ) ( not ( = ?auto_473338 ?auto_473339 ) ) ( not ( = ?auto_473338 ?auto_473340 ) ) ( not ( = ?auto_473338 ?auto_473341 ) ) ( not ( = ?auto_473338 ?auto_473342 ) ) ( not ( = ?auto_473338 ?auto_473343 ) ) ( not ( = ?auto_473338 ?auto_473344 ) ) ( not ( = ?auto_473338 ?auto_473345 ) ) ( not ( = ?auto_473339 ?auto_473340 ) ) ( not ( = ?auto_473339 ?auto_473341 ) ) ( not ( = ?auto_473339 ?auto_473342 ) ) ( not ( = ?auto_473339 ?auto_473343 ) ) ( not ( = ?auto_473339 ?auto_473344 ) ) ( not ( = ?auto_473339 ?auto_473345 ) ) ( not ( = ?auto_473340 ?auto_473341 ) ) ( not ( = ?auto_473340 ?auto_473342 ) ) ( not ( = ?auto_473340 ?auto_473343 ) ) ( not ( = ?auto_473340 ?auto_473344 ) ) ( not ( = ?auto_473340 ?auto_473345 ) ) ( not ( = ?auto_473341 ?auto_473342 ) ) ( not ( = ?auto_473341 ?auto_473343 ) ) ( not ( = ?auto_473341 ?auto_473344 ) ) ( not ( = ?auto_473341 ?auto_473345 ) ) ( not ( = ?auto_473342 ?auto_473343 ) ) ( not ( = ?auto_473342 ?auto_473344 ) ) ( not ( = ?auto_473342 ?auto_473345 ) ) ( not ( = ?auto_473343 ?auto_473344 ) ) ( not ( = ?auto_473343 ?auto_473345 ) ) ( not ( = ?auto_473344 ?auto_473345 ) ) ( ON ?auto_473343 ?auto_473344 ) ( ON ?auto_473342 ?auto_473343 ) ( ON ?auto_473341 ?auto_473342 ) ( ON ?auto_473340 ?auto_473341 ) ( ON ?auto_473339 ?auto_473340 ) ( ON ?auto_473338 ?auto_473339 ) ( ON ?auto_473337 ?auto_473338 ) ( ON ?auto_473336 ?auto_473337 ) ( ON ?auto_473335 ?auto_473336 ) ( ON ?auto_473334 ?auto_473335 ) ( CLEAR ?auto_473334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_473334 )
      ( MAKE-11PILE ?auto_473334 ?auto_473335 ?auto_473336 ?auto_473337 ?auto_473338 ?auto_473339 ?auto_473340 ?auto_473341 ?auto_473342 ?auto_473343 ?auto_473344 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473381 - BLOCK
      ?auto_473382 - BLOCK
      ?auto_473383 - BLOCK
      ?auto_473384 - BLOCK
      ?auto_473385 - BLOCK
      ?auto_473386 - BLOCK
      ?auto_473387 - BLOCK
      ?auto_473388 - BLOCK
      ?auto_473389 - BLOCK
      ?auto_473390 - BLOCK
      ?auto_473391 - BLOCK
      ?auto_473392 - BLOCK
    )
    :vars
    (
      ?auto_473393 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_473391 ) ( ON ?auto_473392 ?auto_473393 ) ( CLEAR ?auto_473392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_473381 ) ( ON ?auto_473382 ?auto_473381 ) ( ON ?auto_473383 ?auto_473382 ) ( ON ?auto_473384 ?auto_473383 ) ( ON ?auto_473385 ?auto_473384 ) ( ON ?auto_473386 ?auto_473385 ) ( ON ?auto_473387 ?auto_473386 ) ( ON ?auto_473388 ?auto_473387 ) ( ON ?auto_473389 ?auto_473388 ) ( ON ?auto_473390 ?auto_473389 ) ( ON ?auto_473391 ?auto_473390 ) ( not ( = ?auto_473381 ?auto_473382 ) ) ( not ( = ?auto_473381 ?auto_473383 ) ) ( not ( = ?auto_473381 ?auto_473384 ) ) ( not ( = ?auto_473381 ?auto_473385 ) ) ( not ( = ?auto_473381 ?auto_473386 ) ) ( not ( = ?auto_473381 ?auto_473387 ) ) ( not ( = ?auto_473381 ?auto_473388 ) ) ( not ( = ?auto_473381 ?auto_473389 ) ) ( not ( = ?auto_473381 ?auto_473390 ) ) ( not ( = ?auto_473381 ?auto_473391 ) ) ( not ( = ?auto_473381 ?auto_473392 ) ) ( not ( = ?auto_473381 ?auto_473393 ) ) ( not ( = ?auto_473382 ?auto_473383 ) ) ( not ( = ?auto_473382 ?auto_473384 ) ) ( not ( = ?auto_473382 ?auto_473385 ) ) ( not ( = ?auto_473382 ?auto_473386 ) ) ( not ( = ?auto_473382 ?auto_473387 ) ) ( not ( = ?auto_473382 ?auto_473388 ) ) ( not ( = ?auto_473382 ?auto_473389 ) ) ( not ( = ?auto_473382 ?auto_473390 ) ) ( not ( = ?auto_473382 ?auto_473391 ) ) ( not ( = ?auto_473382 ?auto_473392 ) ) ( not ( = ?auto_473382 ?auto_473393 ) ) ( not ( = ?auto_473383 ?auto_473384 ) ) ( not ( = ?auto_473383 ?auto_473385 ) ) ( not ( = ?auto_473383 ?auto_473386 ) ) ( not ( = ?auto_473383 ?auto_473387 ) ) ( not ( = ?auto_473383 ?auto_473388 ) ) ( not ( = ?auto_473383 ?auto_473389 ) ) ( not ( = ?auto_473383 ?auto_473390 ) ) ( not ( = ?auto_473383 ?auto_473391 ) ) ( not ( = ?auto_473383 ?auto_473392 ) ) ( not ( = ?auto_473383 ?auto_473393 ) ) ( not ( = ?auto_473384 ?auto_473385 ) ) ( not ( = ?auto_473384 ?auto_473386 ) ) ( not ( = ?auto_473384 ?auto_473387 ) ) ( not ( = ?auto_473384 ?auto_473388 ) ) ( not ( = ?auto_473384 ?auto_473389 ) ) ( not ( = ?auto_473384 ?auto_473390 ) ) ( not ( = ?auto_473384 ?auto_473391 ) ) ( not ( = ?auto_473384 ?auto_473392 ) ) ( not ( = ?auto_473384 ?auto_473393 ) ) ( not ( = ?auto_473385 ?auto_473386 ) ) ( not ( = ?auto_473385 ?auto_473387 ) ) ( not ( = ?auto_473385 ?auto_473388 ) ) ( not ( = ?auto_473385 ?auto_473389 ) ) ( not ( = ?auto_473385 ?auto_473390 ) ) ( not ( = ?auto_473385 ?auto_473391 ) ) ( not ( = ?auto_473385 ?auto_473392 ) ) ( not ( = ?auto_473385 ?auto_473393 ) ) ( not ( = ?auto_473386 ?auto_473387 ) ) ( not ( = ?auto_473386 ?auto_473388 ) ) ( not ( = ?auto_473386 ?auto_473389 ) ) ( not ( = ?auto_473386 ?auto_473390 ) ) ( not ( = ?auto_473386 ?auto_473391 ) ) ( not ( = ?auto_473386 ?auto_473392 ) ) ( not ( = ?auto_473386 ?auto_473393 ) ) ( not ( = ?auto_473387 ?auto_473388 ) ) ( not ( = ?auto_473387 ?auto_473389 ) ) ( not ( = ?auto_473387 ?auto_473390 ) ) ( not ( = ?auto_473387 ?auto_473391 ) ) ( not ( = ?auto_473387 ?auto_473392 ) ) ( not ( = ?auto_473387 ?auto_473393 ) ) ( not ( = ?auto_473388 ?auto_473389 ) ) ( not ( = ?auto_473388 ?auto_473390 ) ) ( not ( = ?auto_473388 ?auto_473391 ) ) ( not ( = ?auto_473388 ?auto_473392 ) ) ( not ( = ?auto_473388 ?auto_473393 ) ) ( not ( = ?auto_473389 ?auto_473390 ) ) ( not ( = ?auto_473389 ?auto_473391 ) ) ( not ( = ?auto_473389 ?auto_473392 ) ) ( not ( = ?auto_473389 ?auto_473393 ) ) ( not ( = ?auto_473390 ?auto_473391 ) ) ( not ( = ?auto_473390 ?auto_473392 ) ) ( not ( = ?auto_473390 ?auto_473393 ) ) ( not ( = ?auto_473391 ?auto_473392 ) ) ( not ( = ?auto_473391 ?auto_473393 ) ) ( not ( = ?auto_473392 ?auto_473393 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_473392 ?auto_473393 )
      ( !STACK ?auto_473392 ?auto_473391 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473431 - BLOCK
      ?auto_473432 - BLOCK
      ?auto_473433 - BLOCK
      ?auto_473434 - BLOCK
      ?auto_473435 - BLOCK
      ?auto_473436 - BLOCK
      ?auto_473437 - BLOCK
      ?auto_473438 - BLOCK
      ?auto_473439 - BLOCK
      ?auto_473440 - BLOCK
      ?auto_473441 - BLOCK
      ?auto_473442 - BLOCK
    )
    :vars
    (
      ?auto_473443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473442 ?auto_473443 ) ( ON-TABLE ?auto_473431 ) ( ON ?auto_473432 ?auto_473431 ) ( ON ?auto_473433 ?auto_473432 ) ( ON ?auto_473434 ?auto_473433 ) ( ON ?auto_473435 ?auto_473434 ) ( ON ?auto_473436 ?auto_473435 ) ( ON ?auto_473437 ?auto_473436 ) ( ON ?auto_473438 ?auto_473437 ) ( ON ?auto_473439 ?auto_473438 ) ( ON ?auto_473440 ?auto_473439 ) ( not ( = ?auto_473431 ?auto_473432 ) ) ( not ( = ?auto_473431 ?auto_473433 ) ) ( not ( = ?auto_473431 ?auto_473434 ) ) ( not ( = ?auto_473431 ?auto_473435 ) ) ( not ( = ?auto_473431 ?auto_473436 ) ) ( not ( = ?auto_473431 ?auto_473437 ) ) ( not ( = ?auto_473431 ?auto_473438 ) ) ( not ( = ?auto_473431 ?auto_473439 ) ) ( not ( = ?auto_473431 ?auto_473440 ) ) ( not ( = ?auto_473431 ?auto_473441 ) ) ( not ( = ?auto_473431 ?auto_473442 ) ) ( not ( = ?auto_473431 ?auto_473443 ) ) ( not ( = ?auto_473432 ?auto_473433 ) ) ( not ( = ?auto_473432 ?auto_473434 ) ) ( not ( = ?auto_473432 ?auto_473435 ) ) ( not ( = ?auto_473432 ?auto_473436 ) ) ( not ( = ?auto_473432 ?auto_473437 ) ) ( not ( = ?auto_473432 ?auto_473438 ) ) ( not ( = ?auto_473432 ?auto_473439 ) ) ( not ( = ?auto_473432 ?auto_473440 ) ) ( not ( = ?auto_473432 ?auto_473441 ) ) ( not ( = ?auto_473432 ?auto_473442 ) ) ( not ( = ?auto_473432 ?auto_473443 ) ) ( not ( = ?auto_473433 ?auto_473434 ) ) ( not ( = ?auto_473433 ?auto_473435 ) ) ( not ( = ?auto_473433 ?auto_473436 ) ) ( not ( = ?auto_473433 ?auto_473437 ) ) ( not ( = ?auto_473433 ?auto_473438 ) ) ( not ( = ?auto_473433 ?auto_473439 ) ) ( not ( = ?auto_473433 ?auto_473440 ) ) ( not ( = ?auto_473433 ?auto_473441 ) ) ( not ( = ?auto_473433 ?auto_473442 ) ) ( not ( = ?auto_473433 ?auto_473443 ) ) ( not ( = ?auto_473434 ?auto_473435 ) ) ( not ( = ?auto_473434 ?auto_473436 ) ) ( not ( = ?auto_473434 ?auto_473437 ) ) ( not ( = ?auto_473434 ?auto_473438 ) ) ( not ( = ?auto_473434 ?auto_473439 ) ) ( not ( = ?auto_473434 ?auto_473440 ) ) ( not ( = ?auto_473434 ?auto_473441 ) ) ( not ( = ?auto_473434 ?auto_473442 ) ) ( not ( = ?auto_473434 ?auto_473443 ) ) ( not ( = ?auto_473435 ?auto_473436 ) ) ( not ( = ?auto_473435 ?auto_473437 ) ) ( not ( = ?auto_473435 ?auto_473438 ) ) ( not ( = ?auto_473435 ?auto_473439 ) ) ( not ( = ?auto_473435 ?auto_473440 ) ) ( not ( = ?auto_473435 ?auto_473441 ) ) ( not ( = ?auto_473435 ?auto_473442 ) ) ( not ( = ?auto_473435 ?auto_473443 ) ) ( not ( = ?auto_473436 ?auto_473437 ) ) ( not ( = ?auto_473436 ?auto_473438 ) ) ( not ( = ?auto_473436 ?auto_473439 ) ) ( not ( = ?auto_473436 ?auto_473440 ) ) ( not ( = ?auto_473436 ?auto_473441 ) ) ( not ( = ?auto_473436 ?auto_473442 ) ) ( not ( = ?auto_473436 ?auto_473443 ) ) ( not ( = ?auto_473437 ?auto_473438 ) ) ( not ( = ?auto_473437 ?auto_473439 ) ) ( not ( = ?auto_473437 ?auto_473440 ) ) ( not ( = ?auto_473437 ?auto_473441 ) ) ( not ( = ?auto_473437 ?auto_473442 ) ) ( not ( = ?auto_473437 ?auto_473443 ) ) ( not ( = ?auto_473438 ?auto_473439 ) ) ( not ( = ?auto_473438 ?auto_473440 ) ) ( not ( = ?auto_473438 ?auto_473441 ) ) ( not ( = ?auto_473438 ?auto_473442 ) ) ( not ( = ?auto_473438 ?auto_473443 ) ) ( not ( = ?auto_473439 ?auto_473440 ) ) ( not ( = ?auto_473439 ?auto_473441 ) ) ( not ( = ?auto_473439 ?auto_473442 ) ) ( not ( = ?auto_473439 ?auto_473443 ) ) ( not ( = ?auto_473440 ?auto_473441 ) ) ( not ( = ?auto_473440 ?auto_473442 ) ) ( not ( = ?auto_473440 ?auto_473443 ) ) ( not ( = ?auto_473441 ?auto_473442 ) ) ( not ( = ?auto_473441 ?auto_473443 ) ) ( not ( = ?auto_473442 ?auto_473443 ) ) ( CLEAR ?auto_473440 ) ( ON ?auto_473441 ?auto_473442 ) ( CLEAR ?auto_473441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_473431 ?auto_473432 ?auto_473433 ?auto_473434 ?auto_473435 ?auto_473436 ?auto_473437 ?auto_473438 ?auto_473439 ?auto_473440 ?auto_473441 )
      ( MAKE-12PILE ?auto_473431 ?auto_473432 ?auto_473433 ?auto_473434 ?auto_473435 ?auto_473436 ?auto_473437 ?auto_473438 ?auto_473439 ?auto_473440 ?auto_473441 ?auto_473442 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473481 - BLOCK
      ?auto_473482 - BLOCK
      ?auto_473483 - BLOCK
      ?auto_473484 - BLOCK
      ?auto_473485 - BLOCK
      ?auto_473486 - BLOCK
      ?auto_473487 - BLOCK
      ?auto_473488 - BLOCK
      ?auto_473489 - BLOCK
      ?auto_473490 - BLOCK
      ?auto_473491 - BLOCK
      ?auto_473492 - BLOCK
    )
    :vars
    (
      ?auto_473493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473492 ?auto_473493 ) ( ON-TABLE ?auto_473481 ) ( ON ?auto_473482 ?auto_473481 ) ( ON ?auto_473483 ?auto_473482 ) ( ON ?auto_473484 ?auto_473483 ) ( ON ?auto_473485 ?auto_473484 ) ( ON ?auto_473486 ?auto_473485 ) ( ON ?auto_473487 ?auto_473486 ) ( ON ?auto_473488 ?auto_473487 ) ( ON ?auto_473489 ?auto_473488 ) ( not ( = ?auto_473481 ?auto_473482 ) ) ( not ( = ?auto_473481 ?auto_473483 ) ) ( not ( = ?auto_473481 ?auto_473484 ) ) ( not ( = ?auto_473481 ?auto_473485 ) ) ( not ( = ?auto_473481 ?auto_473486 ) ) ( not ( = ?auto_473481 ?auto_473487 ) ) ( not ( = ?auto_473481 ?auto_473488 ) ) ( not ( = ?auto_473481 ?auto_473489 ) ) ( not ( = ?auto_473481 ?auto_473490 ) ) ( not ( = ?auto_473481 ?auto_473491 ) ) ( not ( = ?auto_473481 ?auto_473492 ) ) ( not ( = ?auto_473481 ?auto_473493 ) ) ( not ( = ?auto_473482 ?auto_473483 ) ) ( not ( = ?auto_473482 ?auto_473484 ) ) ( not ( = ?auto_473482 ?auto_473485 ) ) ( not ( = ?auto_473482 ?auto_473486 ) ) ( not ( = ?auto_473482 ?auto_473487 ) ) ( not ( = ?auto_473482 ?auto_473488 ) ) ( not ( = ?auto_473482 ?auto_473489 ) ) ( not ( = ?auto_473482 ?auto_473490 ) ) ( not ( = ?auto_473482 ?auto_473491 ) ) ( not ( = ?auto_473482 ?auto_473492 ) ) ( not ( = ?auto_473482 ?auto_473493 ) ) ( not ( = ?auto_473483 ?auto_473484 ) ) ( not ( = ?auto_473483 ?auto_473485 ) ) ( not ( = ?auto_473483 ?auto_473486 ) ) ( not ( = ?auto_473483 ?auto_473487 ) ) ( not ( = ?auto_473483 ?auto_473488 ) ) ( not ( = ?auto_473483 ?auto_473489 ) ) ( not ( = ?auto_473483 ?auto_473490 ) ) ( not ( = ?auto_473483 ?auto_473491 ) ) ( not ( = ?auto_473483 ?auto_473492 ) ) ( not ( = ?auto_473483 ?auto_473493 ) ) ( not ( = ?auto_473484 ?auto_473485 ) ) ( not ( = ?auto_473484 ?auto_473486 ) ) ( not ( = ?auto_473484 ?auto_473487 ) ) ( not ( = ?auto_473484 ?auto_473488 ) ) ( not ( = ?auto_473484 ?auto_473489 ) ) ( not ( = ?auto_473484 ?auto_473490 ) ) ( not ( = ?auto_473484 ?auto_473491 ) ) ( not ( = ?auto_473484 ?auto_473492 ) ) ( not ( = ?auto_473484 ?auto_473493 ) ) ( not ( = ?auto_473485 ?auto_473486 ) ) ( not ( = ?auto_473485 ?auto_473487 ) ) ( not ( = ?auto_473485 ?auto_473488 ) ) ( not ( = ?auto_473485 ?auto_473489 ) ) ( not ( = ?auto_473485 ?auto_473490 ) ) ( not ( = ?auto_473485 ?auto_473491 ) ) ( not ( = ?auto_473485 ?auto_473492 ) ) ( not ( = ?auto_473485 ?auto_473493 ) ) ( not ( = ?auto_473486 ?auto_473487 ) ) ( not ( = ?auto_473486 ?auto_473488 ) ) ( not ( = ?auto_473486 ?auto_473489 ) ) ( not ( = ?auto_473486 ?auto_473490 ) ) ( not ( = ?auto_473486 ?auto_473491 ) ) ( not ( = ?auto_473486 ?auto_473492 ) ) ( not ( = ?auto_473486 ?auto_473493 ) ) ( not ( = ?auto_473487 ?auto_473488 ) ) ( not ( = ?auto_473487 ?auto_473489 ) ) ( not ( = ?auto_473487 ?auto_473490 ) ) ( not ( = ?auto_473487 ?auto_473491 ) ) ( not ( = ?auto_473487 ?auto_473492 ) ) ( not ( = ?auto_473487 ?auto_473493 ) ) ( not ( = ?auto_473488 ?auto_473489 ) ) ( not ( = ?auto_473488 ?auto_473490 ) ) ( not ( = ?auto_473488 ?auto_473491 ) ) ( not ( = ?auto_473488 ?auto_473492 ) ) ( not ( = ?auto_473488 ?auto_473493 ) ) ( not ( = ?auto_473489 ?auto_473490 ) ) ( not ( = ?auto_473489 ?auto_473491 ) ) ( not ( = ?auto_473489 ?auto_473492 ) ) ( not ( = ?auto_473489 ?auto_473493 ) ) ( not ( = ?auto_473490 ?auto_473491 ) ) ( not ( = ?auto_473490 ?auto_473492 ) ) ( not ( = ?auto_473490 ?auto_473493 ) ) ( not ( = ?auto_473491 ?auto_473492 ) ) ( not ( = ?auto_473491 ?auto_473493 ) ) ( not ( = ?auto_473492 ?auto_473493 ) ) ( ON ?auto_473491 ?auto_473492 ) ( CLEAR ?auto_473489 ) ( ON ?auto_473490 ?auto_473491 ) ( CLEAR ?auto_473490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_473481 ?auto_473482 ?auto_473483 ?auto_473484 ?auto_473485 ?auto_473486 ?auto_473487 ?auto_473488 ?auto_473489 ?auto_473490 )
      ( MAKE-12PILE ?auto_473481 ?auto_473482 ?auto_473483 ?auto_473484 ?auto_473485 ?auto_473486 ?auto_473487 ?auto_473488 ?auto_473489 ?auto_473490 ?auto_473491 ?auto_473492 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473531 - BLOCK
      ?auto_473532 - BLOCK
      ?auto_473533 - BLOCK
      ?auto_473534 - BLOCK
      ?auto_473535 - BLOCK
      ?auto_473536 - BLOCK
      ?auto_473537 - BLOCK
      ?auto_473538 - BLOCK
      ?auto_473539 - BLOCK
      ?auto_473540 - BLOCK
      ?auto_473541 - BLOCK
      ?auto_473542 - BLOCK
    )
    :vars
    (
      ?auto_473543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473542 ?auto_473543 ) ( ON-TABLE ?auto_473531 ) ( ON ?auto_473532 ?auto_473531 ) ( ON ?auto_473533 ?auto_473532 ) ( ON ?auto_473534 ?auto_473533 ) ( ON ?auto_473535 ?auto_473534 ) ( ON ?auto_473536 ?auto_473535 ) ( ON ?auto_473537 ?auto_473536 ) ( ON ?auto_473538 ?auto_473537 ) ( not ( = ?auto_473531 ?auto_473532 ) ) ( not ( = ?auto_473531 ?auto_473533 ) ) ( not ( = ?auto_473531 ?auto_473534 ) ) ( not ( = ?auto_473531 ?auto_473535 ) ) ( not ( = ?auto_473531 ?auto_473536 ) ) ( not ( = ?auto_473531 ?auto_473537 ) ) ( not ( = ?auto_473531 ?auto_473538 ) ) ( not ( = ?auto_473531 ?auto_473539 ) ) ( not ( = ?auto_473531 ?auto_473540 ) ) ( not ( = ?auto_473531 ?auto_473541 ) ) ( not ( = ?auto_473531 ?auto_473542 ) ) ( not ( = ?auto_473531 ?auto_473543 ) ) ( not ( = ?auto_473532 ?auto_473533 ) ) ( not ( = ?auto_473532 ?auto_473534 ) ) ( not ( = ?auto_473532 ?auto_473535 ) ) ( not ( = ?auto_473532 ?auto_473536 ) ) ( not ( = ?auto_473532 ?auto_473537 ) ) ( not ( = ?auto_473532 ?auto_473538 ) ) ( not ( = ?auto_473532 ?auto_473539 ) ) ( not ( = ?auto_473532 ?auto_473540 ) ) ( not ( = ?auto_473532 ?auto_473541 ) ) ( not ( = ?auto_473532 ?auto_473542 ) ) ( not ( = ?auto_473532 ?auto_473543 ) ) ( not ( = ?auto_473533 ?auto_473534 ) ) ( not ( = ?auto_473533 ?auto_473535 ) ) ( not ( = ?auto_473533 ?auto_473536 ) ) ( not ( = ?auto_473533 ?auto_473537 ) ) ( not ( = ?auto_473533 ?auto_473538 ) ) ( not ( = ?auto_473533 ?auto_473539 ) ) ( not ( = ?auto_473533 ?auto_473540 ) ) ( not ( = ?auto_473533 ?auto_473541 ) ) ( not ( = ?auto_473533 ?auto_473542 ) ) ( not ( = ?auto_473533 ?auto_473543 ) ) ( not ( = ?auto_473534 ?auto_473535 ) ) ( not ( = ?auto_473534 ?auto_473536 ) ) ( not ( = ?auto_473534 ?auto_473537 ) ) ( not ( = ?auto_473534 ?auto_473538 ) ) ( not ( = ?auto_473534 ?auto_473539 ) ) ( not ( = ?auto_473534 ?auto_473540 ) ) ( not ( = ?auto_473534 ?auto_473541 ) ) ( not ( = ?auto_473534 ?auto_473542 ) ) ( not ( = ?auto_473534 ?auto_473543 ) ) ( not ( = ?auto_473535 ?auto_473536 ) ) ( not ( = ?auto_473535 ?auto_473537 ) ) ( not ( = ?auto_473535 ?auto_473538 ) ) ( not ( = ?auto_473535 ?auto_473539 ) ) ( not ( = ?auto_473535 ?auto_473540 ) ) ( not ( = ?auto_473535 ?auto_473541 ) ) ( not ( = ?auto_473535 ?auto_473542 ) ) ( not ( = ?auto_473535 ?auto_473543 ) ) ( not ( = ?auto_473536 ?auto_473537 ) ) ( not ( = ?auto_473536 ?auto_473538 ) ) ( not ( = ?auto_473536 ?auto_473539 ) ) ( not ( = ?auto_473536 ?auto_473540 ) ) ( not ( = ?auto_473536 ?auto_473541 ) ) ( not ( = ?auto_473536 ?auto_473542 ) ) ( not ( = ?auto_473536 ?auto_473543 ) ) ( not ( = ?auto_473537 ?auto_473538 ) ) ( not ( = ?auto_473537 ?auto_473539 ) ) ( not ( = ?auto_473537 ?auto_473540 ) ) ( not ( = ?auto_473537 ?auto_473541 ) ) ( not ( = ?auto_473537 ?auto_473542 ) ) ( not ( = ?auto_473537 ?auto_473543 ) ) ( not ( = ?auto_473538 ?auto_473539 ) ) ( not ( = ?auto_473538 ?auto_473540 ) ) ( not ( = ?auto_473538 ?auto_473541 ) ) ( not ( = ?auto_473538 ?auto_473542 ) ) ( not ( = ?auto_473538 ?auto_473543 ) ) ( not ( = ?auto_473539 ?auto_473540 ) ) ( not ( = ?auto_473539 ?auto_473541 ) ) ( not ( = ?auto_473539 ?auto_473542 ) ) ( not ( = ?auto_473539 ?auto_473543 ) ) ( not ( = ?auto_473540 ?auto_473541 ) ) ( not ( = ?auto_473540 ?auto_473542 ) ) ( not ( = ?auto_473540 ?auto_473543 ) ) ( not ( = ?auto_473541 ?auto_473542 ) ) ( not ( = ?auto_473541 ?auto_473543 ) ) ( not ( = ?auto_473542 ?auto_473543 ) ) ( ON ?auto_473541 ?auto_473542 ) ( ON ?auto_473540 ?auto_473541 ) ( CLEAR ?auto_473538 ) ( ON ?auto_473539 ?auto_473540 ) ( CLEAR ?auto_473539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_473531 ?auto_473532 ?auto_473533 ?auto_473534 ?auto_473535 ?auto_473536 ?auto_473537 ?auto_473538 ?auto_473539 )
      ( MAKE-12PILE ?auto_473531 ?auto_473532 ?auto_473533 ?auto_473534 ?auto_473535 ?auto_473536 ?auto_473537 ?auto_473538 ?auto_473539 ?auto_473540 ?auto_473541 ?auto_473542 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473581 - BLOCK
      ?auto_473582 - BLOCK
      ?auto_473583 - BLOCK
      ?auto_473584 - BLOCK
      ?auto_473585 - BLOCK
      ?auto_473586 - BLOCK
      ?auto_473587 - BLOCK
      ?auto_473588 - BLOCK
      ?auto_473589 - BLOCK
      ?auto_473590 - BLOCK
      ?auto_473591 - BLOCK
      ?auto_473592 - BLOCK
    )
    :vars
    (
      ?auto_473593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473592 ?auto_473593 ) ( ON-TABLE ?auto_473581 ) ( ON ?auto_473582 ?auto_473581 ) ( ON ?auto_473583 ?auto_473582 ) ( ON ?auto_473584 ?auto_473583 ) ( ON ?auto_473585 ?auto_473584 ) ( ON ?auto_473586 ?auto_473585 ) ( ON ?auto_473587 ?auto_473586 ) ( not ( = ?auto_473581 ?auto_473582 ) ) ( not ( = ?auto_473581 ?auto_473583 ) ) ( not ( = ?auto_473581 ?auto_473584 ) ) ( not ( = ?auto_473581 ?auto_473585 ) ) ( not ( = ?auto_473581 ?auto_473586 ) ) ( not ( = ?auto_473581 ?auto_473587 ) ) ( not ( = ?auto_473581 ?auto_473588 ) ) ( not ( = ?auto_473581 ?auto_473589 ) ) ( not ( = ?auto_473581 ?auto_473590 ) ) ( not ( = ?auto_473581 ?auto_473591 ) ) ( not ( = ?auto_473581 ?auto_473592 ) ) ( not ( = ?auto_473581 ?auto_473593 ) ) ( not ( = ?auto_473582 ?auto_473583 ) ) ( not ( = ?auto_473582 ?auto_473584 ) ) ( not ( = ?auto_473582 ?auto_473585 ) ) ( not ( = ?auto_473582 ?auto_473586 ) ) ( not ( = ?auto_473582 ?auto_473587 ) ) ( not ( = ?auto_473582 ?auto_473588 ) ) ( not ( = ?auto_473582 ?auto_473589 ) ) ( not ( = ?auto_473582 ?auto_473590 ) ) ( not ( = ?auto_473582 ?auto_473591 ) ) ( not ( = ?auto_473582 ?auto_473592 ) ) ( not ( = ?auto_473582 ?auto_473593 ) ) ( not ( = ?auto_473583 ?auto_473584 ) ) ( not ( = ?auto_473583 ?auto_473585 ) ) ( not ( = ?auto_473583 ?auto_473586 ) ) ( not ( = ?auto_473583 ?auto_473587 ) ) ( not ( = ?auto_473583 ?auto_473588 ) ) ( not ( = ?auto_473583 ?auto_473589 ) ) ( not ( = ?auto_473583 ?auto_473590 ) ) ( not ( = ?auto_473583 ?auto_473591 ) ) ( not ( = ?auto_473583 ?auto_473592 ) ) ( not ( = ?auto_473583 ?auto_473593 ) ) ( not ( = ?auto_473584 ?auto_473585 ) ) ( not ( = ?auto_473584 ?auto_473586 ) ) ( not ( = ?auto_473584 ?auto_473587 ) ) ( not ( = ?auto_473584 ?auto_473588 ) ) ( not ( = ?auto_473584 ?auto_473589 ) ) ( not ( = ?auto_473584 ?auto_473590 ) ) ( not ( = ?auto_473584 ?auto_473591 ) ) ( not ( = ?auto_473584 ?auto_473592 ) ) ( not ( = ?auto_473584 ?auto_473593 ) ) ( not ( = ?auto_473585 ?auto_473586 ) ) ( not ( = ?auto_473585 ?auto_473587 ) ) ( not ( = ?auto_473585 ?auto_473588 ) ) ( not ( = ?auto_473585 ?auto_473589 ) ) ( not ( = ?auto_473585 ?auto_473590 ) ) ( not ( = ?auto_473585 ?auto_473591 ) ) ( not ( = ?auto_473585 ?auto_473592 ) ) ( not ( = ?auto_473585 ?auto_473593 ) ) ( not ( = ?auto_473586 ?auto_473587 ) ) ( not ( = ?auto_473586 ?auto_473588 ) ) ( not ( = ?auto_473586 ?auto_473589 ) ) ( not ( = ?auto_473586 ?auto_473590 ) ) ( not ( = ?auto_473586 ?auto_473591 ) ) ( not ( = ?auto_473586 ?auto_473592 ) ) ( not ( = ?auto_473586 ?auto_473593 ) ) ( not ( = ?auto_473587 ?auto_473588 ) ) ( not ( = ?auto_473587 ?auto_473589 ) ) ( not ( = ?auto_473587 ?auto_473590 ) ) ( not ( = ?auto_473587 ?auto_473591 ) ) ( not ( = ?auto_473587 ?auto_473592 ) ) ( not ( = ?auto_473587 ?auto_473593 ) ) ( not ( = ?auto_473588 ?auto_473589 ) ) ( not ( = ?auto_473588 ?auto_473590 ) ) ( not ( = ?auto_473588 ?auto_473591 ) ) ( not ( = ?auto_473588 ?auto_473592 ) ) ( not ( = ?auto_473588 ?auto_473593 ) ) ( not ( = ?auto_473589 ?auto_473590 ) ) ( not ( = ?auto_473589 ?auto_473591 ) ) ( not ( = ?auto_473589 ?auto_473592 ) ) ( not ( = ?auto_473589 ?auto_473593 ) ) ( not ( = ?auto_473590 ?auto_473591 ) ) ( not ( = ?auto_473590 ?auto_473592 ) ) ( not ( = ?auto_473590 ?auto_473593 ) ) ( not ( = ?auto_473591 ?auto_473592 ) ) ( not ( = ?auto_473591 ?auto_473593 ) ) ( not ( = ?auto_473592 ?auto_473593 ) ) ( ON ?auto_473591 ?auto_473592 ) ( ON ?auto_473590 ?auto_473591 ) ( ON ?auto_473589 ?auto_473590 ) ( CLEAR ?auto_473587 ) ( ON ?auto_473588 ?auto_473589 ) ( CLEAR ?auto_473588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_473581 ?auto_473582 ?auto_473583 ?auto_473584 ?auto_473585 ?auto_473586 ?auto_473587 ?auto_473588 )
      ( MAKE-12PILE ?auto_473581 ?auto_473582 ?auto_473583 ?auto_473584 ?auto_473585 ?auto_473586 ?auto_473587 ?auto_473588 ?auto_473589 ?auto_473590 ?auto_473591 ?auto_473592 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473631 - BLOCK
      ?auto_473632 - BLOCK
      ?auto_473633 - BLOCK
      ?auto_473634 - BLOCK
      ?auto_473635 - BLOCK
      ?auto_473636 - BLOCK
      ?auto_473637 - BLOCK
      ?auto_473638 - BLOCK
      ?auto_473639 - BLOCK
      ?auto_473640 - BLOCK
      ?auto_473641 - BLOCK
      ?auto_473642 - BLOCK
    )
    :vars
    (
      ?auto_473643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473642 ?auto_473643 ) ( ON-TABLE ?auto_473631 ) ( ON ?auto_473632 ?auto_473631 ) ( ON ?auto_473633 ?auto_473632 ) ( ON ?auto_473634 ?auto_473633 ) ( ON ?auto_473635 ?auto_473634 ) ( ON ?auto_473636 ?auto_473635 ) ( not ( = ?auto_473631 ?auto_473632 ) ) ( not ( = ?auto_473631 ?auto_473633 ) ) ( not ( = ?auto_473631 ?auto_473634 ) ) ( not ( = ?auto_473631 ?auto_473635 ) ) ( not ( = ?auto_473631 ?auto_473636 ) ) ( not ( = ?auto_473631 ?auto_473637 ) ) ( not ( = ?auto_473631 ?auto_473638 ) ) ( not ( = ?auto_473631 ?auto_473639 ) ) ( not ( = ?auto_473631 ?auto_473640 ) ) ( not ( = ?auto_473631 ?auto_473641 ) ) ( not ( = ?auto_473631 ?auto_473642 ) ) ( not ( = ?auto_473631 ?auto_473643 ) ) ( not ( = ?auto_473632 ?auto_473633 ) ) ( not ( = ?auto_473632 ?auto_473634 ) ) ( not ( = ?auto_473632 ?auto_473635 ) ) ( not ( = ?auto_473632 ?auto_473636 ) ) ( not ( = ?auto_473632 ?auto_473637 ) ) ( not ( = ?auto_473632 ?auto_473638 ) ) ( not ( = ?auto_473632 ?auto_473639 ) ) ( not ( = ?auto_473632 ?auto_473640 ) ) ( not ( = ?auto_473632 ?auto_473641 ) ) ( not ( = ?auto_473632 ?auto_473642 ) ) ( not ( = ?auto_473632 ?auto_473643 ) ) ( not ( = ?auto_473633 ?auto_473634 ) ) ( not ( = ?auto_473633 ?auto_473635 ) ) ( not ( = ?auto_473633 ?auto_473636 ) ) ( not ( = ?auto_473633 ?auto_473637 ) ) ( not ( = ?auto_473633 ?auto_473638 ) ) ( not ( = ?auto_473633 ?auto_473639 ) ) ( not ( = ?auto_473633 ?auto_473640 ) ) ( not ( = ?auto_473633 ?auto_473641 ) ) ( not ( = ?auto_473633 ?auto_473642 ) ) ( not ( = ?auto_473633 ?auto_473643 ) ) ( not ( = ?auto_473634 ?auto_473635 ) ) ( not ( = ?auto_473634 ?auto_473636 ) ) ( not ( = ?auto_473634 ?auto_473637 ) ) ( not ( = ?auto_473634 ?auto_473638 ) ) ( not ( = ?auto_473634 ?auto_473639 ) ) ( not ( = ?auto_473634 ?auto_473640 ) ) ( not ( = ?auto_473634 ?auto_473641 ) ) ( not ( = ?auto_473634 ?auto_473642 ) ) ( not ( = ?auto_473634 ?auto_473643 ) ) ( not ( = ?auto_473635 ?auto_473636 ) ) ( not ( = ?auto_473635 ?auto_473637 ) ) ( not ( = ?auto_473635 ?auto_473638 ) ) ( not ( = ?auto_473635 ?auto_473639 ) ) ( not ( = ?auto_473635 ?auto_473640 ) ) ( not ( = ?auto_473635 ?auto_473641 ) ) ( not ( = ?auto_473635 ?auto_473642 ) ) ( not ( = ?auto_473635 ?auto_473643 ) ) ( not ( = ?auto_473636 ?auto_473637 ) ) ( not ( = ?auto_473636 ?auto_473638 ) ) ( not ( = ?auto_473636 ?auto_473639 ) ) ( not ( = ?auto_473636 ?auto_473640 ) ) ( not ( = ?auto_473636 ?auto_473641 ) ) ( not ( = ?auto_473636 ?auto_473642 ) ) ( not ( = ?auto_473636 ?auto_473643 ) ) ( not ( = ?auto_473637 ?auto_473638 ) ) ( not ( = ?auto_473637 ?auto_473639 ) ) ( not ( = ?auto_473637 ?auto_473640 ) ) ( not ( = ?auto_473637 ?auto_473641 ) ) ( not ( = ?auto_473637 ?auto_473642 ) ) ( not ( = ?auto_473637 ?auto_473643 ) ) ( not ( = ?auto_473638 ?auto_473639 ) ) ( not ( = ?auto_473638 ?auto_473640 ) ) ( not ( = ?auto_473638 ?auto_473641 ) ) ( not ( = ?auto_473638 ?auto_473642 ) ) ( not ( = ?auto_473638 ?auto_473643 ) ) ( not ( = ?auto_473639 ?auto_473640 ) ) ( not ( = ?auto_473639 ?auto_473641 ) ) ( not ( = ?auto_473639 ?auto_473642 ) ) ( not ( = ?auto_473639 ?auto_473643 ) ) ( not ( = ?auto_473640 ?auto_473641 ) ) ( not ( = ?auto_473640 ?auto_473642 ) ) ( not ( = ?auto_473640 ?auto_473643 ) ) ( not ( = ?auto_473641 ?auto_473642 ) ) ( not ( = ?auto_473641 ?auto_473643 ) ) ( not ( = ?auto_473642 ?auto_473643 ) ) ( ON ?auto_473641 ?auto_473642 ) ( ON ?auto_473640 ?auto_473641 ) ( ON ?auto_473639 ?auto_473640 ) ( ON ?auto_473638 ?auto_473639 ) ( CLEAR ?auto_473636 ) ( ON ?auto_473637 ?auto_473638 ) ( CLEAR ?auto_473637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_473631 ?auto_473632 ?auto_473633 ?auto_473634 ?auto_473635 ?auto_473636 ?auto_473637 )
      ( MAKE-12PILE ?auto_473631 ?auto_473632 ?auto_473633 ?auto_473634 ?auto_473635 ?auto_473636 ?auto_473637 ?auto_473638 ?auto_473639 ?auto_473640 ?auto_473641 ?auto_473642 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473681 - BLOCK
      ?auto_473682 - BLOCK
      ?auto_473683 - BLOCK
      ?auto_473684 - BLOCK
      ?auto_473685 - BLOCK
      ?auto_473686 - BLOCK
      ?auto_473687 - BLOCK
      ?auto_473688 - BLOCK
      ?auto_473689 - BLOCK
      ?auto_473690 - BLOCK
      ?auto_473691 - BLOCK
      ?auto_473692 - BLOCK
    )
    :vars
    (
      ?auto_473693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473692 ?auto_473693 ) ( ON-TABLE ?auto_473681 ) ( ON ?auto_473682 ?auto_473681 ) ( ON ?auto_473683 ?auto_473682 ) ( ON ?auto_473684 ?auto_473683 ) ( ON ?auto_473685 ?auto_473684 ) ( not ( = ?auto_473681 ?auto_473682 ) ) ( not ( = ?auto_473681 ?auto_473683 ) ) ( not ( = ?auto_473681 ?auto_473684 ) ) ( not ( = ?auto_473681 ?auto_473685 ) ) ( not ( = ?auto_473681 ?auto_473686 ) ) ( not ( = ?auto_473681 ?auto_473687 ) ) ( not ( = ?auto_473681 ?auto_473688 ) ) ( not ( = ?auto_473681 ?auto_473689 ) ) ( not ( = ?auto_473681 ?auto_473690 ) ) ( not ( = ?auto_473681 ?auto_473691 ) ) ( not ( = ?auto_473681 ?auto_473692 ) ) ( not ( = ?auto_473681 ?auto_473693 ) ) ( not ( = ?auto_473682 ?auto_473683 ) ) ( not ( = ?auto_473682 ?auto_473684 ) ) ( not ( = ?auto_473682 ?auto_473685 ) ) ( not ( = ?auto_473682 ?auto_473686 ) ) ( not ( = ?auto_473682 ?auto_473687 ) ) ( not ( = ?auto_473682 ?auto_473688 ) ) ( not ( = ?auto_473682 ?auto_473689 ) ) ( not ( = ?auto_473682 ?auto_473690 ) ) ( not ( = ?auto_473682 ?auto_473691 ) ) ( not ( = ?auto_473682 ?auto_473692 ) ) ( not ( = ?auto_473682 ?auto_473693 ) ) ( not ( = ?auto_473683 ?auto_473684 ) ) ( not ( = ?auto_473683 ?auto_473685 ) ) ( not ( = ?auto_473683 ?auto_473686 ) ) ( not ( = ?auto_473683 ?auto_473687 ) ) ( not ( = ?auto_473683 ?auto_473688 ) ) ( not ( = ?auto_473683 ?auto_473689 ) ) ( not ( = ?auto_473683 ?auto_473690 ) ) ( not ( = ?auto_473683 ?auto_473691 ) ) ( not ( = ?auto_473683 ?auto_473692 ) ) ( not ( = ?auto_473683 ?auto_473693 ) ) ( not ( = ?auto_473684 ?auto_473685 ) ) ( not ( = ?auto_473684 ?auto_473686 ) ) ( not ( = ?auto_473684 ?auto_473687 ) ) ( not ( = ?auto_473684 ?auto_473688 ) ) ( not ( = ?auto_473684 ?auto_473689 ) ) ( not ( = ?auto_473684 ?auto_473690 ) ) ( not ( = ?auto_473684 ?auto_473691 ) ) ( not ( = ?auto_473684 ?auto_473692 ) ) ( not ( = ?auto_473684 ?auto_473693 ) ) ( not ( = ?auto_473685 ?auto_473686 ) ) ( not ( = ?auto_473685 ?auto_473687 ) ) ( not ( = ?auto_473685 ?auto_473688 ) ) ( not ( = ?auto_473685 ?auto_473689 ) ) ( not ( = ?auto_473685 ?auto_473690 ) ) ( not ( = ?auto_473685 ?auto_473691 ) ) ( not ( = ?auto_473685 ?auto_473692 ) ) ( not ( = ?auto_473685 ?auto_473693 ) ) ( not ( = ?auto_473686 ?auto_473687 ) ) ( not ( = ?auto_473686 ?auto_473688 ) ) ( not ( = ?auto_473686 ?auto_473689 ) ) ( not ( = ?auto_473686 ?auto_473690 ) ) ( not ( = ?auto_473686 ?auto_473691 ) ) ( not ( = ?auto_473686 ?auto_473692 ) ) ( not ( = ?auto_473686 ?auto_473693 ) ) ( not ( = ?auto_473687 ?auto_473688 ) ) ( not ( = ?auto_473687 ?auto_473689 ) ) ( not ( = ?auto_473687 ?auto_473690 ) ) ( not ( = ?auto_473687 ?auto_473691 ) ) ( not ( = ?auto_473687 ?auto_473692 ) ) ( not ( = ?auto_473687 ?auto_473693 ) ) ( not ( = ?auto_473688 ?auto_473689 ) ) ( not ( = ?auto_473688 ?auto_473690 ) ) ( not ( = ?auto_473688 ?auto_473691 ) ) ( not ( = ?auto_473688 ?auto_473692 ) ) ( not ( = ?auto_473688 ?auto_473693 ) ) ( not ( = ?auto_473689 ?auto_473690 ) ) ( not ( = ?auto_473689 ?auto_473691 ) ) ( not ( = ?auto_473689 ?auto_473692 ) ) ( not ( = ?auto_473689 ?auto_473693 ) ) ( not ( = ?auto_473690 ?auto_473691 ) ) ( not ( = ?auto_473690 ?auto_473692 ) ) ( not ( = ?auto_473690 ?auto_473693 ) ) ( not ( = ?auto_473691 ?auto_473692 ) ) ( not ( = ?auto_473691 ?auto_473693 ) ) ( not ( = ?auto_473692 ?auto_473693 ) ) ( ON ?auto_473691 ?auto_473692 ) ( ON ?auto_473690 ?auto_473691 ) ( ON ?auto_473689 ?auto_473690 ) ( ON ?auto_473688 ?auto_473689 ) ( ON ?auto_473687 ?auto_473688 ) ( CLEAR ?auto_473685 ) ( ON ?auto_473686 ?auto_473687 ) ( CLEAR ?auto_473686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_473681 ?auto_473682 ?auto_473683 ?auto_473684 ?auto_473685 ?auto_473686 )
      ( MAKE-12PILE ?auto_473681 ?auto_473682 ?auto_473683 ?auto_473684 ?auto_473685 ?auto_473686 ?auto_473687 ?auto_473688 ?auto_473689 ?auto_473690 ?auto_473691 ?auto_473692 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473731 - BLOCK
      ?auto_473732 - BLOCK
      ?auto_473733 - BLOCK
      ?auto_473734 - BLOCK
      ?auto_473735 - BLOCK
      ?auto_473736 - BLOCK
      ?auto_473737 - BLOCK
      ?auto_473738 - BLOCK
      ?auto_473739 - BLOCK
      ?auto_473740 - BLOCK
      ?auto_473741 - BLOCK
      ?auto_473742 - BLOCK
    )
    :vars
    (
      ?auto_473743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473742 ?auto_473743 ) ( ON-TABLE ?auto_473731 ) ( ON ?auto_473732 ?auto_473731 ) ( ON ?auto_473733 ?auto_473732 ) ( ON ?auto_473734 ?auto_473733 ) ( not ( = ?auto_473731 ?auto_473732 ) ) ( not ( = ?auto_473731 ?auto_473733 ) ) ( not ( = ?auto_473731 ?auto_473734 ) ) ( not ( = ?auto_473731 ?auto_473735 ) ) ( not ( = ?auto_473731 ?auto_473736 ) ) ( not ( = ?auto_473731 ?auto_473737 ) ) ( not ( = ?auto_473731 ?auto_473738 ) ) ( not ( = ?auto_473731 ?auto_473739 ) ) ( not ( = ?auto_473731 ?auto_473740 ) ) ( not ( = ?auto_473731 ?auto_473741 ) ) ( not ( = ?auto_473731 ?auto_473742 ) ) ( not ( = ?auto_473731 ?auto_473743 ) ) ( not ( = ?auto_473732 ?auto_473733 ) ) ( not ( = ?auto_473732 ?auto_473734 ) ) ( not ( = ?auto_473732 ?auto_473735 ) ) ( not ( = ?auto_473732 ?auto_473736 ) ) ( not ( = ?auto_473732 ?auto_473737 ) ) ( not ( = ?auto_473732 ?auto_473738 ) ) ( not ( = ?auto_473732 ?auto_473739 ) ) ( not ( = ?auto_473732 ?auto_473740 ) ) ( not ( = ?auto_473732 ?auto_473741 ) ) ( not ( = ?auto_473732 ?auto_473742 ) ) ( not ( = ?auto_473732 ?auto_473743 ) ) ( not ( = ?auto_473733 ?auto_473734 ) ) ( not ( = ?auto_473733 ?auto_473735 ) ) ( not ( = ?auto_473733 ?auto_473736 ) ) ( not ( = ?auto_473733 ?auto_473737 ) ) ( not ( = ?auto_473733 ?auto_473738 ) ) ( not ( = ?auto_473733 ?auto_473739 ) ) ( not ( = ?auto_473733 ?auto_473740 ) ) ( not ( = ?auto_473733 ?auto_473741 ) ) ( not ( = ?auto_473733 ?auto_473742 ) ) ( not ( = ?auto_473733 ?auto_473743 ) ) ( not ( = ?auto_473734 ?auto_473735 ) ) ( not ( = ?auto_473734 ?auto_473736 ) ) ( not ( = ?auto_473734 ?auto_473737 ) ) ( not ( = ?auto_473734 ?auto_473738 ) ) ( not ( = ?auto_473734 ?auto_473739 ) ) ( not ( = ?auto_473734 ?auto_473740 ) ) ( not ( = ?auto_473734 ?auto_473741 ) ) ( not ( = ?auto_473734 ?auto_473742 ) ) ( not ( = ?auto_473734 ?auto_473743 ) ) ( not ( = ?auto_473735 ?auto_473736 ) ) ( not ( = ?auto_473735 ?auto_473737 ) ) ( not ( = ?auto_473735 ?auto_473738 ) ) ( not ( = ?auto_473735 ?auto_473739 ) ) ( not ( = ?auto_473735 ?auto_473740 ) ) ( not ( = ?auto_473735 ?auto_473741 ) ) ( not ( = ?auto_473735 ?auto_473742 ) ) ( not ( = ?auto_473735 ?auto_473743 ) ) ( not ( = ?auto_473736 ?auto_473737 ) ) ( not ( = ?auto_473736 ?auto_473738 ) ) ( not ( = ?auto_473736 ?auto_473739 ) ) ( not ( = ?auto_473736 ?auto_473740 ) ) ( not ( = ?auto_473736 ?auto_473741 ) ) ( not ( = ?auto_473736 ?auto_473742 ) ) ( not ( = ?auto_473736 ?auto_473743 ) ) ( not ( = ?auto_473737 ?auto_473738 ) ) ( not ( = ?auto_473737 ?auto_473739 ) ) ( not ( = ?auto_473737 ?auto_473740 ) ) ( not ( = ?auto_473737 ?auto_473741 ) ) ( not ( = ?auto_473737 ?auto_473742 ) ) ( not ( = ?auto_473737 ?auto_473743 ) ) ( not ( = ?auto_473738 ?auto_473739 ) ) ( not ( = ?auto_473738 ?auto_473740 ) ) ( not ( = ?auto_473738 ?auto_473741 ) ) ( not ( = ?auto_473738 ?auto_473742 ) ) ( not ( = ?auto_473738 ?auto_473743 ) ) ( not ( = ?auto_473739 ?auto_473740 ) ) ( not ( = ?auto_473739 ?auto_473741 ) ) ( not ( = ?auto_473739 ?auto_473742 ) ) ( not ( = ?auto_473739 ?auto_473743 ) ) ( not ( = ?auto_473740 ?auto_473741 ) ) ( not ( = ?auto_473740 ?auto_473742 ) ) ( not ( = ?auto_473740 ?auto_473743 ) ) ( not ( = ?auto_473741 ?auto_473742 ) ) ( not ( = ?auto_473741 ?auto_473743 ) ) ( not ( = ?auto_473742 ?auto_473743 ) ) ( ON ?auto_473741 ?auto_473742 ) ( ON ?auto_473740 ?auto_473741 ) ( ON ?auto_473739 ?auto_473740 ) ( ON ?auto_473738 ?auto_473739 ) ( ON ?auto_473737 ?auto_473738 ) ( ON ?auto_473736 ?auto_473737 ) ( CLEAR ?auto_473734 ) ( ON ?auto_473735 ?auto_473736 ) ( CLEAR ?auto_473735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_473731 ?auto_473732 ?auto_473733 ?auto_473734 ?auto_473735 )
      ( MAKE-12PILE ?auto_473731 ?auto_473732 ?auto_473733 ?auto_473734 ?auto_473735 ?auto_473736 ?auto_473737 ?auto_473738 ?auto_473739 ?auto_473740 ?auto_473741 ?auto_473742 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473781 - BLOCK
      ?auto_473782 - BLOCK
      ?auto_473783 - BLOCK
      ?auto_473784 - BLOCK
      ?auto_473785 - BLOCK
      ?auto_473786 - BLOCK
      ?auto_473787 - BLOCK
      ?auto_473788 - BLOCK
      ?auto_473789 - BLOCK
      ?auto_473790 - BLOCK
      ?auto_473791 - BLOCK
      ?auto_473792 - BLOCK
    )
    :vars
    (
      ?auto_473793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473792 ?auto_473793 ) ( ON-TABLE ?auto_473781 ) ( ON ?auto_473782 ?auto_473781 ) ( ON ?auto_473783 ?auto_473782 ) ( not ( = ?auto_473781 ?auto_473782 ) ) ( not ( = ?auto_473781 ?auto_473783 ) ) ( not ( = ?auto_473781 ?auto_473784 ) ) ( not ( = ?auto_473781 ?auto_473785 ) ) ( not ( = ?auto_473781 ?auto_473786 ) ) ( not ( = ?auto_473781 ?auto_473787 ) ) ( not ( = ?auto_473781 ?auto_473788 ) ) ( not ( = ?auto_473781 ?auto_473789 ) ) ( not ( = ?auto_473781 ?auto_473790 ) ) ( not ( = ?auto_473781 ?auto_473791 ) ) ( not ( = ?auto_473781 ?auto_473792 ) ) ( not ( = ?auto_473781 ?auto_473793 ) ) ( not ( = ?auto_473782 ?auto_473783 ) ) ( not ( = ?auto_473782 ?auto_473784 ) ) ( not ( = ?auto_473782 ?auto_473785 ) ) ( not ( = ?auto_473782 ?auto_473786 ) ) ( not ( = ?auto_473782 ?auto_473787 ) ) ( not ( = ?auto_473782 ?auto_473788 ) ) ( not ( = ?auto_473782 ?auto_473789 ) ) ( not ( = ?auto_473782 ?auto_473790 ) ) ( not ( = ?auto_473782 ?auto_473791 ) ) ( not ( = ?auto_473782 ?auto_473792 ) ) ( not ( = ?auto_473782 ?auto_473793 ) ) ( not ( = ?auto_473783 ?auto_473784 ) ) ( not ( = ?auto_473783 ?auto_473785 ) ) ( not ( = ?auto_473783 ?auto_473786 ) ) ( not ( = ?auto_473783 ?auto_473787 ) ) ( not ( = ?auto_473783 ?auto_473788 ) ) ( not ( = ?auto_473783 ?auto_473789 ) ) ( not ( = ?auto_473783 ?auto_473790 ) ) ( not ( = ?auto_473783 ?auto_473791 ) ) ( not ( = ?auto_473783 ?auto_473792 ) ) ( not ( = ?auto_473783 ?auto_473793 ) ) ( not ( = ?auto_473784 ?auto_473785 ) ) ( not ( = ?auto_473784 ?auto_473786 ) ) ( not ( = ?auto_473784 ?auto_473787 ) ) ( not ( = ?auto_473784 ?auto_473788 ) ) ( not ( = ?auto_473784 ?auto_473789 ) ) ( not ( = ?auto_473784 ?auto_473790 ) ) ( not ( = ?auto_473784 ?auto_473791 ) ) ( not ( = ?auto_473784 ?auto_473792 ) ) ( not ( = ?auto_473784 ?auto_473793 ) ) ( not ( = ?auto_473785 ?auto_473786 ) ) ( not ( = ?auto_473785 ?auto_473787 ) ) ( not ( = ?auto_473785 ?auto_473788 ) ) ( not ( = ?auto_473785 ?auto_473789 ) ) ( not ( = ?auto_473785 ?auto_473790 ) ) ( not ( = ?auto_473785 ?auto_473791 ) ) ( not ( = ?auto_473785 ?auto_473792 ) ) ( not ( = ?auto_473785 ?auto_473793 ) ) ( not ( = ?auto_473786 ?auto_473787 ) ) ( not ( = ?auto_473786 ?auto_473788 ) ) ( not ( = ?auto_473786 ?auto_473789 ) ) ( not ( = ?auto_473786 ?auto_473790 ) ) ( not ( = ?auto_473786 ?auto_473791 ) ) ( not ( = ?auto_473786 ?auto_473792 ) ) ( not ( = ?auto_473786 ?auto_473793 ) ) ( not ( = ?auto_473787 ?auto_473788 ) ) ( not ( = ?auto_473787 ?auto_473789 ) ) ( not ( = ?auto_473787 ?auto_473790 ) ) ( not ( = ?auto_473787 ?auto_473791 ) ) ( not ( = ?auto_473787 ?auto_473792 ) ) ( not ( = ?auto_473787 ?auto_473793 ) ) ( not ( = ?auto_473788 ?auto_473789 ) ) ( not ( = ?auto_473788 ?auto_473790 ) ) ( not ( = ?auto_473788 ?auto_473791 ) ) ( not ( = ?auto_473788 ?auto_473792 ) ) ( not ( = ?auto_473788 ?auto_473793 ) ) ( not ( = ?auto_473789 ?auto_473790 ) ) ( not ( = ?auto_473789 ?auto_473791 ) ) ( not ( = ?auto_473789 ?auto_473792 ) ) ( not ( = ?auto_473789 ?auto_473793 ) ) ( not ( = ?auto_473790 ?auto_473791 ) ) ( not ( = ?auto_473790 ?auto_473792 ) ) ( not ( = ?auto_473790 ?auto_473793 ) ) ( not ( = ?auto_473791 ?auto_473792 ) ) ( not ( = ?auto_473791 ?auto_473793 ) ) ( not ( = ?auto_473792 ?auto_473793 ) ) ( ON ?auto_473791 ?auto_473792 ) ( ON ?auto_473790 ?auto_473791 ) ( ON ?auto_473789 ?auto_473790 ) ( ON ?auto_473788 ?auto_473789 ) ( ON ?auto_473787 ?auto_473788 ) ( ON ?auto_473786 ?auto_473787 ) ( ON ?auto_473785 ?auto_473786 ) ( CLEAR ?auto_473783 ) ( ON ?auto_473784 ?auto_473785 ) ( CLEAR ?auto_473784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_473781 ?auto_473782 ?auto_473783 ?auto_473784 )
      ( MAKE-12PILE ?auto_473781 ?auto_473782 ?auto_473783 ?auto_473784 ?auto_473785 ?auto_473786 ?auto_473787 ?auto_473788 ?auto_473789 ?auto_473790 ?auto_473791 ?auto_473792 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473831 - BLOCK
      ?auto_473832 - BLOCK
      ?auto_473833 - BLOCK
      ?auto_473834 - BLOCK
      ?auto_473835 - BLOCK
      ?auto_473836 - BLOCK
      ?auto_473837 - BLOCK
      ?auto_473838 - BLOCK
      ?auto_473839 - BLOCK
      ?auto_473840 - BLOCK
      ?auto_473841 - BLOCK
      ?auto_473842 - BLOCK
    )
    :vars
    (
      ?auto_473843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473842 ?auto_473843 ) ( ON-TABLE ?auto_473831 ) ( ON ?auto_473832 ?auto_473831 ) ( not ( = ?auto_473831 ?auto_473832 ) ) ( not ( = ?auto_473831 ?auto_473833 ) ) ( not ( = ?auto_473831 ?auto_473834 ) ) ( not ( = ?auto_473831 ?auto_473835 ) ) ( not ( = ?auto_473831 ?auto_473836 ) ) ( not ( = ?auto_473831 ?auto_473837 ) ) ( not ( = ?auto_473831 ?auto_473838 ) ) ( not ( = ?auto_473831 ?auto_473839 ) ) ( not ( = ?auto_473831 ?auto_473840 ) ) ( not ( = ?auto_473831 ?auto_473841 ) ) ( not ( = ?auto_473831 ?auto_473842 ) ) ( not ( = ?auto_473831 ?auto_473843 ) ) ( not ( = ?auto_473832 ?auto_473833 ) ) ( not ( = ?auto_473832 ?auto_473834 ) ) ( not ( = ?auto_473832 ?auto_473835 ) ) ( not ( = ?auto_473832 ?auto_473836 ) ) ( not ( = ?auto_473832 ?auto_473837 ) ) ( not ( = ?auto_473832 ?auto_473838 ) ) ( not ( = ?auto_473832 ?auto_473839 ) ) ( not ( = ?auto_473832 ?auto_473840 ) ) ( not ( = ?auto_473832 ?auto_473841 ) ) ( not ( = ?auto_473832 ?auto_473842 ) ) ( not ( = ?auto_473832 ?auto_473843 ) ) ( not ( = ?auto_473833 ?auto_473834 ) ) ( not ( = ?auto_473833 ?auto_473835 ) ) ( not ( = ?auto_473833 ?auto_473836 ) ) ( not ( = ?auto_473833 ?auto_473837 ) ) ( not ( = ?auto_473833 ?auto_473838 ) ) ( not ( = ?auto_473833 ?auto_473839 ) ) ( not ( = ?auto_473833 ?auto_473840 ) ) ( not ( = ?auto_473833 ?auto_473841 ) ) ( not ( = ?auto_473833 ?auto_473842 ) ) ( not ( = ?auto_473833 ?auto_473843 ) ) ( not ( = ?auto_473834 ?auto_473835 ) ) ( not ( = ?auto_473834 ?auto_473836 ) ) ( not ( = ?auto_473834 ?auto_473837 ) ) ( not ( = ?auto_473834 ?auto_473838 ) ) ( not ( = ?auto_473834 ?auto_473839 ) ) ( not ( = ?auto_473834 ?auto_473840 ) ) ( not ( = ?auto_473834 ?auto_473841 ) ) ( not ( = ?auto_473834 ?auto_473842 ) ) ( not ( = ?auto_473834 ?auto_473843 ) ) ( not ( = ?auto_473835 ?auto_473836 ) ) ( not ( = ?auto_473835 ?auto_473837 ) ) ( not ( = ?auto_473835 ?auto_473838 ) ) ( not ( = ?auto_473835 ?auto_473839 ) ) ( not ( = ?auto_473835 ?auto_473840 ) ) ( not ( = ?auto_473835 ?auto_473841 ) ) ( not ( = ?auto_473835 ?auto_473842 ) ) ( not ( = ?auto_473835 ?auto_473843 ) ) ( not ( = ?auto_473836 ?auto_473837 ) ) ( not ( = ?auto_473836 ?auto_473838 ) ) ( not ( = ?auto_473836 ?auto_473839 ) ) ( not ( = ?auto_473836 ?auto_473840 ) ) ( not ( = ?auto_473836 ?auto_473841 ) ) ( not ( = ?auto_473836 ?auto_473842 ) ) ( not ( = ?auto_473836 ?auto_473843 ) ) ( not ( = ?auto_473837 ?auto_473838 ) ) ( not ( = ?auto_473837 ?auto_473839 ) ) ( not ( = ?auto_473837 ?auto_473840 ) ) ( not ( = ?auto_473837 ?auto_473841 ) ) ( not ( = ?auto_473837 ?auto_473842 ) ) ( not ( = ?auto_473837 ?auto_473843 ) ) ( not ( = ?auto_473838 ?auto_473839 ) ) ( not ( = ?auto_473838 ?auto_473840 ) ) ( not ( = ?auto_473838 ?auto_473841 ) ) ( not ( = ?auto_473838 ?auto_473842 ) ) ( not ( = ?auto_473838 ?auto_473843 ) ) ( not ( = ?auto_473839 ?auto_473840 ) ) ( not ( = ?auto_473839 ?auto_473841 ) ) ( not ( = ?auto_473839 ?auto_473842 ) ) ( not ( = ?auto_473839 ?auto_473843 ) ) ( not ( = ?auto_473840 ?auto_473841 ) ) ( not ( = ?auto_473840 ?auto_473842 ) ) ( not ( = ?auto_473840 ?auto_473843 ) ) ( not ( = ?auto_473841 ?auto_473842 ) ) ( not ( = ?auto_473841 ?auto_473843 ) ) ( not ( = ?auto_473842 ?auto_473843 ) ) ( ON ?auto_473841 ?auto_473842 ) ( ON ?auto_473840 ?auto_473841 ) ( ON ?auto_473839 ?auto_473840 ) ( ON ?auto_473838 ?auto_473839 ) ( ON ?auto_473837 ?auto_473838 ) ( ON ?auto_473836 ?auto_473837 ) ( ON ?auto_473835 ?auto_473836 ) ( ON ?auto_473834 ?auto_473835 ) ( CLEAR ?auto_473832 ) ( ON ?auto_473833 ?auto_473834 ) ( CLEAR ?auto_473833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_473831 ?auto_473832 ?auto_473833 )
      ( MAKE-12PILE ?auto_473831 ?auto_473832 ?auto_473833 ?auto_473834 ?auto_473835 ?auto_473836 ?auto_473837 ?auto_473838 ?auto_473839 ?auto_473840 ?auto_473841 ?auto_473842 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473881 - BLOCK
      ?auto_473882 - BLOCK
      ?auto_473883 - BLOCK
      ?auto_473884 - BLOCK
      ?auto_473885 - BLOCK
      ?auto_473886 - BLOCK
      ?auto_473887 - BLOCK
      ?auto_473888 - BLOCK
      ?auto_473889 - BLOCK
      ?auto_473890 - BLOCK
      ?auto_473891 - BLOCK
      ?auto_473892 - BLOCK
    )
    :vars
    (
      ?auto_473893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473892 ?auto_473893 ) ( ON-TABLE ?auto_473881 ) ( not ( = ?auto_473881 ?auto_473882 ) ) ( not ( = ?auto_473881 ?auto_473883 ) ) ( not ( = ?auto_473881 ?auto_473884 ) ) ( not ( = ?auto_473881 ?auto_473885 ) ) ( not ( = ?auto_473881 ?auto_473886 ) ) ( not ( = ?auto_473881 ?auto_473887 ) ) ( not ( = ?auto_473881 ?auto_473888 ) ) ( not ( = ?auto_473881 ?auto_473889 ) ) ( not ( = ?auto_473881 ?auto_473890 ) ) ( not ( = ?auto_473881 ?auto_473891 ) ) ( not ( = ?auto_473881 ?auto_473892 ) ) ( not ( = ?auto_473881 ?auto_473893 ) ) ( not ( = ?auto_473882 ?auto_473883 ) ) ( not ( = ?auto_473882 ?auto_473884 ) ) ( not ( = ?auto_473882 ?auto_473885 ) ) ( not ( = ?auto_473882 ?auto_473886 ) ) ( not ( = ?auto_473882 ?auto_473887 ) ) ( not ( = ?auto_473882 ?auto_473888 ) ) ( not ( = ?auto_473882 ?auto_473889 ) ) ( not ( = ?auto_473882 ?auto_473890 ) ) ( not ( = ?auto_473882 ?auto_473891 ) ) ( not ( = ?auto_473882 ?auto_473892 ) ) ( not ( = ?auto_473882 ?auto_473893 ) ) ( not ( = ?auto_473883 ?auto_473884 ) ) ( not ( = ?auto_473883 ?auto_473885 ) ) ( not ( = ?auto_473883 ?auto_473886 ) ) ( not ( = ?auto_473883 ?auto_473887 ) ) ( not ( = ?auto_473883 ?auto_473888 ) ) ( not ( = ?auto_473883 ?auto_473889 ) ) ( not ( = ?auto_473883 ?auto_473890 ) ) ( not ( = ?auto_473883 ?auto_473891 ) ) ( not ( = ?auto_473883 ?auto_473892 ) ) ( not ( = ?auto_473883 ?auto_473893 ) ) ( not ( = ?auto_473884 ?auto_473885 ) ) ( not ( = ?auto_473884 ?auto_473886 ) ) ( not ( = ?auto_473884 ?auto_473887 ) ) ( not ( = ?auto_473884 ?auto_473888 ) ) ( not ( = ?auto_473884 ?auto_473889 ) ) ( not ( = ?auto_473884 ?auto_473890 ) ) ( not ( = ?auto_473884 ?auto_473891 ) ) ( not ( = ?auto_473884 ?auto_473892 ) ) ( not ( = ?auto_473884 ?auto_473893 ) ) ( not ( = ?auto_473885 ?auto_473886 ) ) ( not ( = ?auto_473885 ?auto_473887 ) ) ( not ( = ?auto_473885 ?auto_473888 ) ) ( not ( = ?auto_473885 ?auto_473889 ) ) ( not ( = ?auto_473885 ?auto_473890 ) ) ( not ( = ?auto_473885 ?auto_473891 ) ) ( not ( = ?auto_473885 ?auto_473892 ) ) ( not ( = ?auto_473885 ?auto_473893 ) ) ( not ( = ?auto_473886 ?auto_473887 ) ) ( not ( = ?auto_473886 ?auto_473888 ) ) ( not ( = ?auto_473886 ?auto_473889 ) ) ( not ( = ?auto_473886 ?auto_473890 ) ) ( not ( = ?auto_473886 ?auto_473891 ) ) ( not ( = ?auto_473886 ?auto_473892 ) ) ( not ( = ?auto_473886 ?auto_473893 ) ) ( not ( = ?auto_473887 ?auto_473888 ) ) ( not ( = ?auto_473887 ?auto_473889 ) ) ( not ( = ?auto_473887 ?auto_473890 ) ) ( not ( = ?auto_473887 ?auto_473891 ) ) ( not ( = ?auto_473887 ?auto_473892 ) ) ( not ( = ?auto_473887 ?auto_473893 ) ) ( not ( = ?auto_473888 ?auto_473889 ) ) ( not ( = ?auto_473888 ?auto_473890 ) ) ( not ( = ?auto_473888 ?auto_473891 ) ) ( not ( = ?auto_473888 ?auto_473892 ) ) ( not ( = ?auto_473888 ?auto_473893 ) ) ( not ( = ?auto_473889 ?auto_473890 ) ) ( not ( = ?auto_473889 ?auto_473891 ) ) ( not ( = ?auto_473889 ?auto_473892 ) ) ( not ( = ?auto_473889 ?auto_473893 ) ) ( not ( = ?auto_473890 ?auto_473891 ) ) ( not ( = ?auto_473890 ?auto_473892 ) ) ( not ( = ?auto_473890 ?auto_473893 ) ) ( not ( = ?auto_473891 ?auto_473892 ) ) ( not ( = ?auto_473891 ?auto_473893 ) ) ( not ( = ?auto_473892 ?auto_473893 ) ) ( ON ?auto_473891 ?auto_473892 ) ( ON ?auto_473890 ?auto_473891 ) ( ON ?auto_473889 ?auto_473890 ) ( ON ?auto_473888 ?auto_473889 ) ( ON ?auto_473887 ?auto_473888 ) ( ON ?auto_473886 ?auto_473887 ) ( ON ?auto_473885 ?auto_473886 ) ( ON ?auto_473884 ?auto_473885 ) ( ON ?auto_473883 ?auto_473884 ) ( CLEAR ?auto_473881 ) ( ON ?auto_473882 ?auto_473883 ) ( CLEAR ?auto_473882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_473881 ?auto_473882 )
      ( MAKE-12PILE ?auto_473881 ?auto_473882 ?auto_473883 ?auto_473884 ?auto_473885 ?auto_473886 ?auto_473887 ?auto_473888 ?auto_473889 ?auto_473890 ?auto_473891 ?auto_473892 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_473931 - BLOCK
      ?auto_473932 - BLOCK
      ?auto_473933 - BLOCK
      ?auto_473934 - BLOCK
      ?auto_473935 - BLOCK
      ?auto_473936 - BLOCK
      ?auto_473937 - BLOCK
      ?auto_473938 - BLOCK
      ?auto_473939 - BLOCK
      ?auto_473940 - BLOCK
      ?auto_473941 - BLOCK
      ?auto_473942 - BLOCK
    )
    :vars
    (
      ?auto_473943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_473942 ?auto_473943 ) ( not ( = ?auto_473931 ?auto_473932 ) ) ( not ( = ?auto_473931 ?auto_473933 ) ) ( not ( = ?auto_473931 ?auto_473934 ) ) ( not ( = ?auto_473931 ?auto_473935 ) ) ( not ( = ?auto_473931 ?auto_473936 ) ) ( not ( = ?auto_473931 ?auto_473937 ) ) ( not ( = ?auto_473931 ?auto_473938 ) ) ( not ( = ?auto_473931 ?auto_473939 ) ) ( not ( = ?auto_473931 ?auto_473940 ) ) ( not ( = ?auto_473931 ?auto_473941 ) ) ( not ( = ?auto_473931 ?auto_473942 ) ) ( not ( = ?auto_473931 ?auto_473943 ) ) ( not ( = ?auto_473932 ?auto_473933 ) ) ( not ( = ?auto_473932 ?auto_473934 ) ) ( not ( = ?auto_473932 ?auto_473935 ) ) ( not ( = ?auto_473932 ?auto_473936 ) ) ( not ( = ?auto_473932 ?auto_473937 ) ) ( not ( = ?auto_473932 ?auto_473938 ) ) ( not ( = ?auto_473932 ?auto_473939 ) ) ( not ( = ?auto_473932 ?auto_473940 ) ) ( not ( = ?auto_473932 ?auto_473941 ) ) ( not ( = ?auto_473932 ?auto_473942 ) ) ( not ( = ?auto_473932 ?auto_473943 ) ) ( not ( = ?auto_473933 ?auto_473934 ) ) ( not ( = ?auto_473933 ?auto_473935 ) ) ( not ( = ?auto_473933 ?auto_473936 ) ) ( not ( = ?auto_473933 ?auto_473937 ) ) ( not ( = ?auto_473933 ?auto_473938 ) ) ( not ( = ?auto_473933 ?auto_473939 ) ) ( not ( = ?auto_473933 ?auto_473940 ) ) ( not ( = ?auto_473933 ?auto_473941 ) ) ( not ( = ?auto_473933 ?auto_473942 ) ) ( not ( = ?auto_473933 ?auto_473943 ) ) ( not ( = ?auto_473934 ?auto_473935 ) ) ( not ( = ?auto_473934 ?auto_473936 ) ) ( not ( = ?auto_473934 ?auto_473937 ) ) ( not ( = ?auto_473934 ?auto_473938 ) ) ( not ( = ?auto_473934 ?auto_473939 ) ) ( not ( = ?auto_473934 ?auto_473940 ) ) ( not ( = ?auto_473934 ?auto_473941 ) ) ( not ( = ?auto_473934 ?auto_473942 ) ) ( not ( = ?auto_473934 ?auto_473943 ) ) ( not ( = ?auto_473935 ?auto_473936 ) ) ( not ( = ?auto_473935 ?auto_473937 ) ) ( not ( = ?auto_473935 ?auto_473938 ) ) ( not ( = ?auto_473935 ?auto_473939 ) ) ( not ( = ?auto_473935 ?auto_473940 ) ) ( not ( = ?auto_473935 ?auto_473941 ) ) ( not ( = ?auto_473935 ?auto_473942 ) ) ( not ( = ?auto_473935 ?auto_473943 ) ) ( not ( = ?auto_473936 ?auto_473937 ) ) ( not ( = ?auto_473936 ?auto_473938 ) ) ( not ( = ?auto_473936 ?auto_473939 ) ) ( not ( = ?auto_473936 ?auto_473940 ) ) ( not ( = ?auto_473936 ?auto_473941 ) ) ( not ( = ?auto_473936 ?auto_473942 ) ) ( not ( = ?auto_473936 ?auto_473943 ) ) ( not ( = ?auto_473937 ?auto_473938 ) ) ( not ( = ?auto_473937 ?auto_473939 ) ) ( not ( = ?auto_473937 ?auto_473940 ) ) ( not ( = ?auto_473937 ?auto_473941 ) ) ( not ( = ?auto_473937 ?auto_473942 ) ) ( not ( = ?auto_473937 ?auto_473943 ) ) ( not ( = ?auto_473938 ?auto_473939 ) ) ( not ( = ?auto_473938 ?auto_473940 ) ) ( not ( = ?auto_473938 ?auto_473941 ) ) ( not ( = ?auto_473938 ?auto_473942 ) ) ( not ( = ?auto_473938 ?auto_473943 ) ) ( not ( = ?auto_473939 ?auto_473940 ) ) ( not ( = ?auto_473939 ?auto_473941 ) ) ( not ( = ?auto_473939 ?auto_473942 ) ) ( not ( = ?auto_473939 ?auto_473943 ) ) ( not ( = ?auto_473940 ?auto_473941 ) ) ( not ( = ?auto_473940 ?auto_473942 ) ) ( not ( = ?auto_473940 ?auto_473943 ) ) ( not ( = ?auto_473941 ?auto_473942 ) ) ( not ( = ?auto_473941 ?auto_473943 ) ) ( not ( = ?auto_473942 ?auto_473943 ) ) ( ON ?auto_473941 ?auto_473942 ) ( ON ?auto_473940 ?auto_473941 ) ( ON ?auto_473939 ?auto_473940 ) ( ON ?auto_473938 ?auto_473939 ) ( ON ?auto_473937 ?auto_473938 ) ( ON ?auto_473936 ?auto_473937 ) ( ON ?auto_473935 ?auto_473936 ) ( ON ?auto_473934 ?auto_473935 ) ( ON ?auto_473933 ?auto_473934 ) ( ON ?auto_473932 ?auto_473933 ) ( ON ?auto_473931 ?auto_473932 ) ( CLEAR ?auto_473931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_473931 )
      ( MAKE-12PILE ?auto_473931 ?auto_473932 ?auto_473933 ?auto_473934 ?auto_473935 ?auto_473936 ?auto_473937 ?auto_473938 ?auto_473939 ?auto_473940 ?auto_473941 ?auto_473942 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_473982 - BLOCK
      ?auto_473983 - BLOCK
      ?auto_473984 - BLOCK
      ?auto_473985 - BLOCK
      ?auto_473986 - BLOCK
      ?auto_473987 - BLOCK
      ?auto_473988 - BLOCK
      ?auto_473989 - BLOCK
      ?auto_473990 - BLOCK
      ?auto_473991 - BLOCK
      ?auto_473992 - BLOCK
      ?auto_473993 - BLOCK
      ?auto_473994 - BLOCK
    )
    :vars
    (
      ?auto_473995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_473993 ) ( ON ?auto_473994 ?auto_473995 ) ( CLEAR ?auto_473994 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_473982 ) ( ON ?auto_473983 ?auto_473982 ) ( ON ?auto_473984 ?auto_473983 ) ( ON ?auto_473985 ?auto_473984 ) ( ON ?auto_473986 ?auto_473985 ) ( ON ?auto_473987 ?auto_473986 ) ( ON ?auto_473988 ?auto_473987 ) ( ON ?auto_473989 ?auto_473988 ) ( ON ?auto_473990 ?auto_473989 ) ( ON ?auto_473991 ?auto_473990 ) ( ON ?auto_473992 ?auto_473991 ) ( ON ?auto_473993 ?auto_473992 ) ( not ( = ?auto_473982 ?auto_473983 ) ) ( not ( = ?auto_473982 ?auto_473984 ) ) ( not ( = ?auto_473982 ?auto_473985 ) ) ( not ( = ?auto_473982 ?auto_473986 ) ) ( not ( = ?auto_473982 ?auto_473987 ) ) ( not ( = ?auto_473982 ?auto_473988 ) ) ( not ( = ?auto_473982 ?auto_473989 ) ) ( not ( = ?auto_473982 ?auto_473990 ) ) ( not ( = ?auto_473982 ?auto_473991 ) ) ( not ( = ?auto_473982 ?auto_473992 ) ) ( not ( = ?auto_473982 ?auto_473993 ) ) ( not ( = ?auto_473982 ?auto_473994 ) ) ( not ( = ?auto_473982 ?auto_473995 ) ) ( not ( = ?auto_473983 ?auto_473984 ) ) ( not ( = ?auto_473983 ?auto_473985 ) ) ( not ( = ?auto_473983 ?auto_473986 ) ) ( not ( = ?auto_473983 ?auto_473987 ) ) ( not ( = ?auto_473983 ?auto_473988 ) ) ( not ( = ?auto_473983 ?auto_473989 ) ) ( not ( = ?auto_473983 ?auto_473990 ) ) ( not ( = ?auto_473983 ?auto_473991 ) ) ( not ( = ?auto_473983 ?auto_473992 ) ) ( not ( = ?auto_473983 ?auto_473993 ) ) ( not ( = ?auto_473983 ?auto_473994 ) ) ( not ( = ?auto_473983 ?auto_473995 ) ) ( not ( = ?auto_473984 ?auto_473985 ) ) ( not ( = ?auto_473984 ?auto_473986 ) ) ( not ( = ?auto_473984 ?auto_473987 ) ) ( not ( = ?auto_473984 ?auto_473988 ) ) ( not ( = ?auto_473984 ?auto_473989 ) ) ( not ( = ?auto_473984 ?auto_473990 ) ) ( not ( = ?auto_473984 ?auto_473991 ) ) ( not ( = ?auto_473984 ?auto_473992 ) ) ( not ( = ?auto_473984 ?auto_473993 ) ) ( not ( = ?auto_473984 ?auto_473994 ) ) ( not ( = ?auto_473984 ?auto_473995 ) ) ( not ( = ?auto_473985 ?auto_473986 ) ) ( not ( = ?auto_473985 ?auto_473987 ) ) ( not ( = ?auto_473985 ?auto_473988 ) ) ( not ( = ?auto_473985 ?auto_473989 ) ) ( not ( = ?auto_473985 ?auto_473990 ) ) ( not ( = ?auto_473985 ?auto_473991 ) ) ( not ( = ?auto_473985 ?auto_473992 ) ) ( not ( = ?auto_473985 ?auto_473993 ) ) ( not ( = ?auto_473985 ?auto_473994 ) ) ( not ( = ?auto_473985 ?auto_473995 ) ) ( not ( = ?auto_473986 ?auto_473987 ) ) ( not ( = ?auto_473986 ?auto_473988 ) ) ( not ( = ?auto_473986 ?auto_473989 ) ) ( not ( = ?auto_473986 ?auto_473990 ) ) ( not ( = ?auto_473986 ?auto_473991 ) ) ( not ( = ?auto_473986 ?auto_473992 ) ) ( not ( = ?auto_473986 ?auto_473993 ) ) ( not ( = ?auto_473986 ?auto_473994 ) ) ( not ( = ?auto_473986 ?auto_473995 ) ) ( not ( = ?auto_473987 ?auto_473988 ) ) ( not ( = ?auto_473987 ?auto_473989 ) ) ( not ( = ?auto_473987 ?auto_473990 ) ) ( not ( = ?auto_473987 ?auto_473991 ) ) ( not ( = ?auto_473987 ?auto_473992 ) ) ( not ( = ?auto_473987 ?auto_473993 ) ) ( not ( = ?auto_473987 ?auto_473994 ) ) ( not ( = ?auto_473987 ?auto_473995 ) ) ( not ( = ?auto_473988 ?auto_473989 ) ) ( not ( = ?auto_473988 ?auto_473990 ) ) ( not ( = ?auto_473988 ?auto_473991 ) ) ( not ( = ?auto_473988 ?auto_473992 ) ) ( not ( = ?auto_473988 ?auto_473993 ) ) ( not ( = ?auto_473988 ?auto_473994 ) ) ( not ( = ?auto_473988 ?auto_473995 ) ) ( not ( = ?auto_473989 ?auto_473990 ) ) ( not ( = ?auto_473989 ?auto_473991 ) ) ( not ( = ?auto_473989 ?auto_473992 ) ) ( not ( = ?auto_473989 ?auto_473993 ) ) ( not ( = ?auto_473989 ?auto_473994 ) ) ( not ( = ?auto_473989 ?auto_473995 ) ) ( not ( = ?auto_473990 ?auto_473991 ) ) ( not ( = ?auto_473990 ?auto_473992 ) ) ( not ( = ?auto_473990 ?auto_473993 ) ) ( not ( = ?auto_473990 ?auto_473994 ) ) ( not ( = ?auto_473990 ?auto_473995 ) ) ( not ( = ?auto_473991 ?auto_473992 ) ) ( not ( = ?auto_473991 ?auto_473993 ) ) ( not ( = ?auto_473991 ?auto_473994 ) ) ( not ( = ?auto_473991 ?auto_473995 ) ) ( not ( = ?auto_473992 ?auto_473993 ) ) ( not ( = ?auto_473992 ?auto_473994 ) ) ( not ( = ?auto_473992 ?auto_473995 ) ) ( not ( = ?auto_473993 ?auto_473994 ) ) ( not ( = ?auto_473993 ?auto_473995 ) ) ( not ( = ?auto_473994 ?auto_473995 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_473994 ?auto_473995 )
      ( !STACK ?auto_473994 ?auto_473993 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474036 - BLOCK
      ?auto_474037 - BLOCK
      ?auto_474038 - BLOCK
      ?auto_474039 - BLOCK
      ?auto_474040 - BLOCK
      ?auto_474041 - BLOCK
      ?auto_474042 - BLOCK
      ?auto_474043 - BLOCK
      ?auto_474044 - BLOCK
      ?auto_474045 - BLOCK
      ?auto_474046 - BLOCK
      ?auto_474047 - BLOCK
      ?auto_474048 - BLOCK
    )
    :vars
    (
      ?auto_474049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474048 ?auto_474049 ) ( ON-TABLE ?auto_474036 ) ( ON ?auto_474037 ?auto_474036 ) ( ON ?auto_474038 ?auto_474037 ) ( ON ?auto_474039 ?auto_474038 ) ( ON ?auto_474040 ?auto_474039 ) ( ON ?auto_474041 ?auto_474040 ) ( ON ?auto_474042 ?auto_474041 ) ( ON ?auto_474043 ?auto_474042 ) ( ON ?auto_474044 ?auto_474043 ) ( ON ?auto_474045 ?auto_474044 ) ( ON ?auto_474046 ?auto_474045 ) ( not ( = ?auto_474036 ?auto_474037 ) ) ( not ( = ?auto_474036 ?auto_474038 ) ) ( not ( = ?auto_474036 ?auto_474039 ) ) ( not ( = ?auto_474036 ?auto_474040 ) ) ( not ( = ?auto_474036 ?auto_474041 ) ) ( not ( = ?auto_474036 ?auto_474042 ) ) ( not ( = ?auto_474036 ?auto_474043 ) ) ( not ( = ?auto_474036 ?auto_474044 ) ) ( not ( = ?auto_474036 ?auto_474045 ) ) ( not ( = ?auto_474036 ?auto_474046 ) ) ( not ( = ?auto_474036 ?auto_474047 ) ) ( not ( = ?auto_474036 ?auto_474048 ) ) ( not ( = ?auto_474036 ?auto_474049 ) ) ( not ( = ?auto_474037 ?auto_474038 ) ) ( not ( = ?auto_474037 ?auto_474039 ) ) ( not ( = ?auto_474037 ?auto_474040 ) ) ( not ( = ?auto_474037 ?auto_474041 ) ) ( not ( = ?auto_474037 ?auto_474042 ) ) ( not ( = ?auto_474037 ?auto_474043 ) ) ( not ( = ?auto_474037 ?auto_474044 ) ) ( not ( = ?auto_474037 ?auto_474045 ) ) ( not ( = ?auto_474037 ?auto_474046 ) ) ( not ( = ?auto_474037 ?auto_474047 ) ) ( not ( = ?auto_474037 ?auto_474048 ) ) ( not ( = ?auto_474037 ?auto_474049 ) ) ( not ( = ?auto_474038 ?auto_474039 ) ) ( not ( = ?auto_474038 ?auto_474040 ) ) ( not ( = ?auto_474038 ?auto_474041 ) ) ( not ( = ?auto_474038 ?auto_474042 ) ) ( not ( = ?auto_474038 ?auto_474043 ) ) ( not ( = ?auto_474038 ?auto_474044 ) ) ( not ( = ?auto_474038 ?auto_474045 ) ) ( not ( = ?auto_474038 ?auto_474046 ) ) ( not ( = ?auto_474038 ?auto_474047 ) ) ( not ( = ?auto_474038 ?auto_474048 ) ) ( not ( = ?auto_474038 ?auto_474049 ) ) ( not ( = ?auto_474039 ?auto_474040 ) ) ( not ( = ?auto_474039 ?auto_474041 ) ) ( not ( = ?auto_474039 ?auto_474042 ) ) ( not ( = ?auto_474039 ?auto_474043 ) ) ( not ( = ?auto_474039 ?auto_474044 ) ) ( not ( = ?auto_474039 ?auto_474045 ) ) ( not ( = ?auto_474039 ?auto_474046 ) ) ( not ( = ?auto_474039 ?auto_474047 ) ) ( not ( = ?auto_474039 ?auto_474048 ) ) ( not ( = ?auto_474039 ?auto_474049 ) ) ( not ( = ?auto_474040 ?auto_474041 ) ) ( not ( = ?auto_474040 ?auto_474042 ) ) ( not ( = ?auto_474040 ?auto_474043 ) ) ( not ( = ?auto_474040 ?auto_474044 ) ) ( not ( = ?auto_474040 ?auto_474045 ) ) ( not ( = ?auto_474040 ?auto_474046 ) ) ( not ( = ?auto_474040 ?auto_474047 ) ) ( not ( = ?auto_474040 ?auto_474048 ) ) ( not ( = ?auto_474040 ?auto_474049 ) ) ( not ( = ?auto_474041 ?auto_474042 ) ) ( not ( = ?auto_474041 ?auto_474043 ) ) ( not ( = ?auto_474041 ?auto_474044 ) ) ( not ( = ?auto_474041 ?auto_474045 ) ) ( not ( = ?auto_474041 ?auto_474046 ) ) ( not ( = ?auto_474041 ?auto_474047 ) ) ( not ( = ?auto_474041 ?auto_474048 ) ) ( not ( = ?auto_474041 ?auto_474049 ) ) ( not ( = ?auto_474042 ?auto_474043 ) ) ( not ( = ?auto_474042 ?auto_474044 ) ) ( not ( = ?auto_474042 ?auto_474045 ) ) ( not ( = ?auto_474042 ?auto_474046 ) ) ( not ( = ?auto_474042 ?auto_474047 ) ) ( not ( = ?auto_474042 ?auto_474048 ) ) ( not ( = ?auto_474042 ?auto_474049 ) ) ( not ( = ?auto_474043 ?auto_474044 ) ) ( not ( = ?auto_474043 ?auto_474045 ) ) ( not ( = ?auto_474043 ?auto_474046 ) ) ( not ( = ?auto_474043 ?auto_474047 ) ) ( not ( = ?auto_474043 ?auto_474048 ) ) ( not ( = ?auto_474043 ?auto_474049 ) ) ( not ( = ?auto_474044 ?auto_474045 ) ) ( not ( = ?auto_474044 ?auto_474046 ) ) ( not ( = ?auto_474044 ?auto_474047 ) ) ( not ( = ?auto_474044 ?auto_474048 ) ) ( not ( = ?auto_474044 ?auto_474049 ) ) ( not ( = ?auto_474045 ?auto_474046 ) ) ( not ( = ?auto_474045 ?auto_474047 ) ) ( not ( = ?auto_474045 ?auto_474048 ) ) ( not ( = ?auto_474045 ?auto_474049 ) ) ( not ( = ?auto_474046 ?auto_474047 ) ) ( not ( = ?auto_474046 ?auto_474048 ) ) ( not ( = ?auto_474046 ?auto_474049 ) ) ( not ( = ?auto_474047 ?auto_474048 ) ) ( not ( = ?auto_474047 ?auto_474049 ) ) ( not ( = ?auto_474048 ?auto_474049 ) ) ( CLEAR ?auto_474046 ) ( ON ?auto_474047 ?auto_474048 ) ( CLEAR ?auto_474047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_474036 ?auto_474037 ?auto_474038 ?auto_474039 ?auto_474040 ?auto_474041 ?auto_474042 ?auto_474043 ?auto_474044 ?auto_474045 ?auto_474046 ?auto_474047 )
      ( MAKE-13PILE ?auto_474036 ?auto_474037 ?auto_474038 ?auto_474039 ?auto_474040 ?auto_474041 ?auto_474042 ?auto_474043 ?auto_474044 ?auto_474045 ?auto_474046 ?auto_474047 ?auto_474048 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474090 - BLOCK
      ?auto_474091 - BLOCK
      ?auto_474092 - BLOCK
      ?auto_474093 - BLOCK
      ?auto_474094 - BLOCK
      ?auto_474095 - BLOCK
      ?auto_474096 - BLOCK
      ?auto_474097 - BLOCK
      ?auto_474098 - BLOCK
      ?auto_474099 - BLOCK
      ?auto_474100 - BLOCK
      ?auto_474101 - BLOCK
      ?auto_474102 - BLOCK
    )
    :vars
    (
      ?auto_474103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474102 ?auto_474103 ) ( ON-TABLE ?auto_474090 ) ( ON ?auto_474091 ?auto_474090 ) ( ON ?auto_474092 ?auto_474091 ) ( ON ?auto_474093 ?auto_474092 ) ( ON ?auto_474094 ?auto_474093 ) ( ON ?auto_474095 ?auto_474094 ) ( ON ?auto_474096 ?auto_474095 ) ( ON ?auto_474097 ?auto_474096 ) ( ON ?auto_474098 ?auto_474097 ) ( ON ?auto_474099 ?auto_474098 ) ( not ( = ?auto_474090 ?auto_474091 ) ) ( not ( = ?auto_474090 ?auto_474092 ) ) ( not ( = ?auto_474090 ?auto_474093 ) ) ( not ( = ?auto_474090 ?auto_474094 ) ) ( not ( = ?auto_474090 ?auto_474095 ) ) ( not ( = ?auto_474090 ?auto_474096 ) ) ( not ( = ?auto_474090 ?auto_474097 ) ) ( not ( = ?auto_474090 ?auto_474098 ) ) ( not ( = ?auto_474090 ?auto_474099 ) ) ( not ( = ?auto_474090 ?auto_474100 ) ) ( not ( = ?auto_474090 ?auto_474101 ) ) ( not ( = ?auto_474090 ?auto_474102 ) ) ( not ( = ?auto_474090 ?auto_474103 ) ) ( not ( = ?auto_474091 ?auto_474092 ) ) ( not ( = ?auto_474091 ?auto_474093 ) ) ( not ( = ?auto_474091 ?auto_474094 ) ) ( not ( = ?auto_474091 ?auto_474095 ) ) ( not ( = ?auto_474091 ?auto_474096 ) ) ( not ( = ?auto_474091 ?auto_474097 ) ) ( not ( = ?auto_474091 ?auto_474098 ) ) ( not ( = ?auto_474091 ?auto_474099 ) ) ( not ( = ?auto_474091 ?auto_474100 ) ) ( not ( = ?auto_474091 ?auto_474101 ) ) ( not ( = ?auto_474091 ?auto_474102 ) ) ( not ( = ?auto_474091 ?auto_474103 ) ) ( not ( = ?auto_474092 ?auto_474093 ) ) ( not ( = ?auto_474092 ?auto_474094 ) ) ( not ( = ?auto_474092 ?auto_474095 ) ) ( not ( = ?auto_474092 ?auto_474096 ) ) ( not ( = ?auto_474092 ?auto_474097 ) ) ( not ( = ?auto_474092 ?auto_474098 ) ) ( not ( = ?auto_474092 ?auto_474099 ) ) ( not ( = ?auto_474092 ?auto_474100 ) ) ( not ( = ?auto_474092 ?auto_474101 ) ) ( not ( = ?auto_474092 ?auto_474102 ) ) ( not ( = ?auto_474092 ?auto_474103 ) ) ( not ( = ?auto_474093 ?auto_474094 ) ) ( not ( = ?auto_474093 ?auto_474095 ) ) ( not ( = ?auto_474093 ?auto_474096 ) ) ( not ( = ?auto_474093 ?auto_474097 ) ) ( not ( = ?auto_474093 ?auto_474098 ) ) ( not ( = ?auto_474093 ?auto_474099 ) ) ( not ( = ?auto_474093 ?auto_474100 ) ) ( not ( = ?auto_474093 ?auto_474101 ) ) ( not ( = ?auto_474093 ?auto_474102 ) ) ( not ( = ?auto_474093 ?auto_474103 ) ) ( not ( = ?auto_474094 ?auto_474095 ) ) ( not ( = ?auto_474094 ?auto_474096 ) ) ( not ( = ?auto_474094 ?auto_474097 ) ) ( not ( = ?auto_474094 ?auto_474098 ) ) ( not ( = ?auto_474094 ?auto_474099 ) ) ( not ( = ?auto_474094 ?auto_474100 ) ) ( not ( = ?auto_474094 ?auto_474101 ) ) ( not ( = ?auto_474094 ?auto_474102 ) ) ( not ( = ?auto_474094 ?auto_474103 ) ) ( not ( = ?auto_474095 ?auto_474096 ) ) ( not ( = ?auto_474095 ?auto_474097 ) ) ( not ( = ?auto_474095 ?auto_474098 ) ) ( not ( = ?auto_474095 ?auto_474099 ) ) ( not ( = ?auto_474095 ?auto_474100 ) ) ( not ( = ?auto_474095 ?auto_474101 ) ) ( not ( = ?auto_474095 ?auto_474102 ) ) ( not ( = ?auto_474095 ?auto_474103 ) ) ( not ( = ?auto_474096 ?auto_474097 ) ) ( not ( = ?auto_474096 ?auto_474098 ) ) ( not ( = ?auto_474096 ?auto_474099 ) ) ( not ( = ?auto_474096 ?auto_474100 ) ) ( not ( = ?auto_474096 ?auto_474101 ) ) ( not ( = ?auto_474096 ?auto_474102 ) ) ( not ( = ?auto_474096 ?auto_474103 ) ) ( not ( = ?auto_474097 ?auto_474098 ) ) ( not ( = ?auto_474097 ?auto_474099 ) ) ( not ( = ?auto_474097 ?auto_474100 ) ) ( not ( = ?auto_474097 ?auto_474101 ) ) ( not ( = ?auto_474097 ?auto_474102 ) ) ( not ( = ?auto_474097 ?auto_474103 ) ) ( not ( = ?auto_474098 ?auto_474099 ) ) ( not ( = ?auto_474098 ?auto_474100 ) ) ( not ( = ?auto_474098 ?auto_474101 ) ) ( not ( = ?auto_474098 ?auto_474102 ) ) ( not ( = ?auto_474098 ?auto_474103 ) ) ( not ( = ?auto_474099 ?auto_474100 ) ) ( not ( = ?auto_474099 ?auto_474101 ) ) ( not ( = ?auto_474099 ?auto_474102 ) ) ( not ( = ?auto_474099 ?auto_474103 ) ) ( not ( = ?auto_474100 ?auto_474101 ) ) ( not ( = ?auto_474100 ?auto_474102 ) ) ( not ( = ?auto_474100 ?auto_474103 ) ) ( not ( = ?auto_474101 ?auto_474102 ) ) ( not ( = ?auto_474101 ?auto_474103 ) ) ( not ( = ?auto_474102 ?auto_474103 ) ) ( ON ?auto_474101 ?auto_474102 ) ( CLEAR ?auto_474099 ) ( ON ?auto_474100 ?auto_474101 ) ( CLEAR ?auto_474100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_474090 ?auto_474091 ?auto_474092 ?auto_474093 ?auto_474094 ?auto_474095 ?auto_474096 ?auto_474097 ?auto_474098 ?auto_474099 ?auto_474100 )
      ( MAKE-13PILE ?auto_474090 ?auto_474091 ?auto_474092 ?auto_474093 ?auto_474094 ?auto_474095 ?auto_474096 ?auto_474097 ?auto_474098 ?auto_474099 ?auto_474100 ?auto_474101 ?auto_474102 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474144 - BLOCK
      ?auto_474145 - BLOCK
      ?auto_474146 - BLOCK
      ?auto_474147 - BLOCK
      ?auto_474148 - BLOCK
      ?auto_474149 - BLOCK
      ?auto_474150 - BLOCK
      ?auto_474151 - BLOCK
      ?auto_474152 - BLOCK
      ?auto_474153 - BLOCK
      ?auto_474154 - BLOCK
      ?auto_474155 - BLOCK
      ?auto_474156 - BLOCK
    )
    :vars
    (
      ?auto_474157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474156 ?auto_474157 ) ( ON-TABLE ?auto_474144 ) ( ON ?auto_474145 ?auto_474144 ) ( ON ?auto_474146 ?auto_474145 ) ( ON ?auto_474147 ?auto_474146 ) ( ON ?auto_474148 ?auto_474147 ) ( ON ?auto_474149 ?auto_474148 ) ( ON ?auto_474150 ?auto_474149 ) ( ON ?auto_474151 ?auto_474150 ) ( ON ?auto_474152 ?auto_474151 ) ( not ( = ?auto_474144 ?auto_474145 ) ) ( not ( = ?auto_474144 ?auto_474146 ) ) ( not ( = ?auto_474144 ?auto_474147 ) ) ( not ( = ?auto_474144 ?auto_474148 ) ) ( not ( = ?auto_474144 ?auto_474149 ) ) ( not ( = ?auto_474144 ?auto_474150 ) ) ( not ( = ?auto_474144 ?auto_474151 ) ) ( not ( = ?auto_474144 ?auto_474152 ) ) ( not ( = ?auto_474144 ?auto_474153 ) ) ( not ( = ?auto_474144 ?auto_474154 ) ) ( not ( = ?auto_474144 ?auto_474155 ) ) ( not ( = ?auto_474144 ?auto_474156 ) ) ( not ( = ?auto_474144 ?auto_474157 ) ) ( not ( = ?auto_474145 ?auto_474146 ) ) ( not ( = ?auto_474145 ?auto_474147 ) ) ( not ( = ?auto_474145 ?auto_474148 ) ) ( not ( = ?auto_474145 ?auto_474149 ) ) ( not ( = ?auto_474145 ?auto_474150 ) ) ( not ( = ?auto_474145 ?auto_474151 ) ) ( not ( = ?auto_474145 ?auto_474152 ) ) ( not ( = ?auto_474145 ?auto_474153 ) ) ( not ( = ?auto_474145 ?auto_474154 ) ) ( not ( = ?auto_474145 ?auto_474155 ) ) ( not ( = ?auto_474145 ?auto_474156 ) ) ( not ( = ?auto_474145 ?auto_474157 ) ) ( not ( = ?auto_474146 ?auto_474147 ) ) ( not ( = ?auto_474146 ?auto_474148 ) ) ( not ( = ?auto_474146 ?auto_474149 ) ) ( not ( = ?auto_474146 ?auto_474150 ) ) ( not ( = ?auto_474146 ?auto_474151 ) ) ( not ( = ?auto_474146 ?auto_474152 ) ) ( not ( = ?auto_474146 ?auto_474153 ) ) ( not ( = ?auto_474146 ?auto_474154 ) ) ( not ( = ?auto_474146 ?auto_474155 ) ) ( not ( = ?auto_474146 ?auto_474156 ) ) ( not ( = ?auto_474146 ?auto_474157 ) ) ( not ( = ?auto_474147 ?auto_474148 ) ) ( not ( = ?auto_474147 ?auto_474149 ) ) ( not ( = ?auto_474147 ?auto_474150 ) ) ( not ( = ?auto_474147 ?auto_474151 ) ) ( not ( = ?auto_474147 ?auto_474152 ) ) ( not ( = ?auto_474147 ?auto_474153 ) ) ( not ( = ?auto_474147 ?auto_474154 ) ) ( not ( = ?auto_474147 ?auto_474155 ) ) ( not ( = ?auto_474147 ?auto_474156 ) ) ( not ( = ?auto_474147 ?auto_474157 ) ) ( not ( = ?auto_474148 ?auto_474149 ) ) ( not ( = ?auto_474148 ?auto_474150 ) ) ( not ( = ?auto_474148 ?auto_474151 ) ) ( not ( = ?auto_474148 ?auto_474152 ) ) ( not ( = ?auto_474148 ?auto_474153 ) ) ( not ( = ?auto_474148 ?auto_474154 ) ) ( not ( = ?auto_474148 ?auto_474155 ) ) ( not ( = ?auto_474148 ?auto_474156 ) ) ( not ( = ?auto_474148 ?auto_474157 ) ) ( not ( = ?auto_474149 ?auto_474150 ) ) ( not ( = ?auto_474149 ?auto_474151 ) ) ( not ( = ?auto_474149 ?auto_474152 ) ) ( not ( = ?auto_474149 ?auto_474153 ) ) ( not ( = ?auto_474149 ?auto_474154 ) ) ( not ( = ?auto_474149 ?auto_474155 ) ) ( not ( = ?auto_474149 ?auto_474156 ) ) ( not ( = ?auto_474149 ?auto_474157 ) ) ( not ( = ?auto_474150 ?auto_474151 ) ) ( not ( = ?auto_474150 ?auto_474152 ) ) ( not ( = ?auto_474150 ?auto_474153 ) ) ( not ( = ?auto_474150 ?auto_474154 ) ) ( not ( = ?auto_474150 ?auto_474155 ) ) ( not ( = ?auto_474150 ?auto_474156 ) ) ( not ( = ?auto_474150 ?auto_474157 ) ) ( not ( = ?auto_474151 ?auto_474152 ) ) ( not ( = ?auto_474151 ?auto_474153 ) ) ( not ( = ?auto_474151 ?auto_474154 ) ) ( not ( = ?auto_474151 ?auto_474155 ) ) ( not ( = ?auto_474151 ?auto_474156 ) ) ( not ( = ?auto_474151 ?auto_474157 ) ) ( not ( = ?auto_474152 ?auto_474153 ) ) ( not ( = ?auto_474152 ?auto_474154 ) ) ( not ( = ?auto_474152 ?auto_474155 ) ) ( not ( = ?auto_474152 ?auto_474156 ) ) ( not ( = ?auto_474152 ?auto_474157 ) ) ( not ( = ?auto_474153 ?auto_474154 ) ) ( not ( = ?auto_474153 ?auto_474155 ) ) ( not ( = ?auto_474153 ?auto_474156 ) ) ( not ( = ?auto_474153 ?auto_474157 ) ) ( not ( = ?auto_474154 ?auto_474155 ) ) ( not ( = ?auto_474154 ?auto_474156 ) ) ( not ( = ?auto_474154 ?auto_474157 ) ) ( not ( = ?auto_474155 ?auto_474156 ) ) ( not ( = ?auto_474155 ?auto_474157 ) ) ( not ( = ?auto_474156 ?auto_474157 ) ) ( ON ?auto_474155 ?auto_474156 ) ( ON ?auto_474154 ?auto_474155 ) ( CLEAR ?auto_474152 ) ( ON ?auto_474153 ?auto_474154 ) ( CLEAR ?auto_474153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_474144 ?auto_474145 ?auto_474146 ?auto_474147 ?auto_474148 ?auto_474149 ?auto_474150 ?auto_474151 ?auto_474152 ?auto_474153 )
      ( MAKE-13PILE ?auto_474144 ?auto_474145 ?auto_474146 ?auto_474147 ?auto_474148 ?auto_474149 ?auto_474150 ?auto_474151 ?auto_474152 ?auto_474153 ?auto_474154 ?auto_474155 ?auto_474156 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474198 - BLOCK
      ?auto_474199 - BLOCK
      ?auto_474200 - BLOCK
      ?auto_474201 - BLOCK
      ?auto_474202 - BLOCK
      ?auto_474203 - BLOCK
      ?auto_474204 - BLOCK
      ?auto_474205 - BLOCK
      ?auto_474206 - BLOCK
      ?auto_474207 - BLOCK
      ?auto_474208 - BLOCK
      ?auto_474209 - BLOCK
      ?auto_474210 - BLOCK
    )
    :vars
    (
      ?auto_474211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474210 ?auto_474211 ) ( ON-TABLE ?auto_474198 ) ( ON ?auto_474199 ?auto_474198 ) ( ON ?auto_474200 ?auto_474199 ) ( ON ?auto_474201 ?auto_474200 ) ( ON ?auto_474202 ?auto_474201 ) ( ON ?auto_474203 ?auto_474202 ) ( ON ?auto_474204 ?auto_474203 ) ( ON ?auto_474205 ?auto_474204 ) ( not ( = ?auto_474198 ?auto_474199 ) ) ( not ( = ?auto_474198 ?auto_474200 ) ) ( not ( = ?auto_474198 ?auto_474201 ) ) ( not ( = ?auto_474198 ?auto_474202 ) ) ( not ( = ?auto_474198 ?auto_474203 ) ) ( not ( = ?auto_474198 ?auto_474204 ) ) ( not ( = ?auto_474198 ?auto_474205 ) ) ( not ( = ?auto_474198 ?auto_474206 ) ) ( not ( = ?auto_474198 ?auto_474207 ) ) ( not ( = ?auto_474198 ?auto_474208 ) ) ( not ( = ?auto_474198 ?auto_474209 ) ) ( not ( = ?auto_474198 ?auto_474210 ) ) ( not ( = ?auto_474198 ?auto_474211 ) ) ( not ( = ?auto_474199 ?auto_474200 ) ) ( not ( = ?auto_474199 ?auto_474201 ) ) ( not ( = ?auto_474199 ?auto_474202 ) ) ( not ( = ?auto_474199 ?auto_474203 ) ) ( not ( = ?auto_474199 ?auto_474204 ) ) ( not ( = ?auto_474199 ?auto_474205 ) ) ( not ( = ?auto_474199 ?auto_474206 ) ) ( not ( = ?auto_474199 ?auto_474207 ) ) ( not ( = ?auto_474199 ?auto_474208 ) ) ( not ( = ?auto_474199 ?auto_474209 ) ) ( not ( = ?auto_474199 ?auto_474210 ) ) ( not ( = ?auto_474199 ?auto_474211 ) ) ( not ( = ?auto_474200 ?auto_474201 ) ) ( not ( = ?auto_474200 ?auto_474202 ) ) ( not ( = ?auto_474200 ?auto_474203 ) ) ( not ( = ?auto_474200 ?auto_474204 ) ) ( not ( = ?auto_474200 ?auto_474205 ) ) ( not ( = ?auto_474200 ?auto_474206 ) ) ( not ( = ?auto_474200 ?auto_474207 ) ) ( not ( = ?auto_474200 ?auto_474208 ) ) ( not ( = ?auto_474200 ?auto_474209 ) ) ( not ( = ?auto_474200 ?auto_474210 ) ) ( not ( = ?auto_474200 ?auto_474211 ) ) ( not ( = ?auto_474201 ?auto_474202 ) ) ( not ( = ?auto_474201 ?auto_474203 ) ) ( not ( = ?auto_474201 ?auto_474204 ) ) ( not ( = ?auto_474201 ?auto_474205 ) ) ( not ( = ?auto_474201 ?auto_474206 ) ) ( not ( = ?auto_474201 ?auto_474207 ) ) ( not ( = ?auto_474201 ?auto_474208 ) ) ( not ( = ?auto_474201 ?auto_474209 ) ) ( not ( = ?auto_474201 ?auto_474210 ) ) ( not ( = ?auto_474201 ?auto_474211 ) ) ( not ( = ?auto_474202 ?auto_474203 ) ) ( not ( = ?auto_474202 ?auto_474204 ) ) ( not ( = ?auto_474202 ?auto_474205 ) ) ( not ( = ?auto_474202 ?auto_474206 ) ) ( not ( = ?auto_474202 ?auto_474207 ) ) ( not ( = ?auto_474202 ?auto_474208 ) ) ( not ( = ?auto_474202 ?auto_474209 ) ) ( not ( = ?auto_474202 ?auto_474210 ) ) ( not ( = ?auto_474202 ?auto_474211 ) ) ( not ( = ?auto_474203 ?auto_474204 ) ) ( not ( = ?auto_474203 ?auto_474205 ) ) ( not ( = ?auto_474203 ?auto_474206 ) ) ( not ( = ?auto_474203 ?auto_474207 ) ) ( not ( = ?auto_474203 ?auto_474208 ) ) ( not ( = ?auto_474203 ?auto_474209 ) ) ( not ( = ?auto_474203 ?auto_474210 ) ) ( not ( = ?auto_474203 ?auto_474211 ) ) ( not ( = ?auto_474204 ?auto_474205 ) ) ( not ( = ?auto_474204 ?auto_474206 ) ) ( not ( = ?auto_474204 ?auto_474207 ) ) ( not ( = ?auto_474204 ?auto_474208 ) ) ( not ( = ?auto_474204 ?auto_474209 ) ) ( not ( = ?auto_474204 ?auto_474210 ) ) ( not ( = ?auto_474204 ?auto_474211 ) ) ( not ( = ?auto_474205 ?auto_474206 ) ) ( not ( = ?auto_474205 ?auto_474207 ) ) ( not ( = ?auto_474205 ?auto_474208 ) ) ( not ( = ?auto_474205 ?auto_474209 ) ) ( not ( = ?auto_474205 ?auto_474210 ) ) ( not ( = ?auto_474205 ?auto_474211 ) ) ( not ( = ?auto_474206 ?auto_474207 ) ) ( not ( = ?auto_474206 ?auto_474208 ) ) ( not ( = ?auto_474206 ?auto_474209 ) ) ( not ( = ?auto_474206 ?auto_474210 ) ) ( not ( = ?auto_474206 ?auto_474211 ) ) ( not ( = ?auto_474207 ?auto_474208 ) ) ( not ( = ?auto_474207 ?auto_474209 ) ) ( not ( = ?auto_474207 ?auto_474210 ) ) ( not ( = ?auto_474207 ?auto_474211 ) ) ( not ( = ?auto_474208 ?auto_474209 ) ) ( not ( = ?auto_474208 ?auto_474210 ) ) ( not ( = ?auto_474208 ?auto_474211 ) ) ( not ( = ?auto_474209 ?auto_474210 ) ) ( not ( = ?auto_474209 ?auto_474211 ) ) ( not ( = ?auto_474210 ?auto_474211 ) ) ( ON ?auto_474209 ?auto_474210 ) ( ON ?auto_474208 ?auto_474209 ) ( ON ?auto_474207 ?auto_474208 ) ( CLEAR ?auto_474205 ) ( ON ?auto_474206 ?auto_474207 ) ( CLEAR ?auto_474206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_474198 ?auto_474199 ?auto_474200 ?auto_474201 ?auto_474202 ?auto_474203 ?auto_474204 ?auto_474205 ?auto_474206 )
      ( MAKE-13PILE ?auto_474198 ?auto_474199 ?auto_474200 ?auto_474201 ?auto_474202 ?auto_474203 ?auto_474204 ?auto_474205 ?auto_474206 ?auto_474207 ?auto_474208 ?auto_474209 ?auto_474210 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474252 - BLOCK
      ?auto_474253 - BLOCK
      ?auto_474254 - BLOCK
      ?auto_474255 - BLOCK
      ?auto_474256 - BLOCK
      ?auto_474257 - BLOCK
      ?auto_474258 - BLOCK
      ?auto_474259 - BLOCK
      ?auto_474260 - BLOCK
      ?auto_474261 - BLOCK
      ?auto_474262 - BLOCK
      ?auto_474263 - BLOCK
      ?auto_474264 - BLOCK
    )
    :vars
    (
      ?auto_474265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474264 ?auto_474265 ) ( ON-TABLE ?auto_474252 ) ( ON ?auto_474253 ?auto_474252 ) ( ON ?auto_474254 ?auto_474253 ) ( ON ?auto_474255 ?auto_474254 ) ( ON ?auto_474256 ?auto_474255 ) ( ON ?auto_474257 ?auto_474256 ) ( ON ?auto_474258 ?auto_474257 ) ( not ( = ?auto_474252 ?auto_474253 ) ) ( not ( = ?auto_474252 ?auto_474254 ) ) ( not ( = ?auto_474252 ?auto_474255 ) ) ( not ( = ?auto_474252 ?auto_474256 ) ) ( not ( = ?auto_474252 ?auto_474257 ) ) ( not ( = ?auto_474252 ?auto_474258 ) ) ( not ( = ?auto_474252 ?auto_474259 ) ) ( not ( = ?auto_474252 ?auto_474260 ) ) ( not ( = ?auto_474252 ?auto_474261 ) ) ( not ( = ?auto_474252 ?auto_474262 ) ) ( not ( = ?auto_474252 ?auto_474263 ) ) ( not ( = ?auto_474252 ?auto_474264 ) ) ( not ( = ?auto_474252 ?auto_474265 ) ) ( not ( = ?auto_474253 ?auto_474254 ) ) ( not ( = ?auto_474253 ?auto_474255 ) ) ( not ( = ?auto_474253 ?auto_474256 ) ) ( not ( = ?auto_474253 ?auto_474257 ) ) ( not ( = ?auto_474253 ?auto_474258 ) ) ( not ( = ?auto_474253 ?auto_474259 ) ) ( not ( = ?auto_474253 ?auto_474260 ) ) ( not ( = ?auto_474253 ?auto_474261 ) ) ( not ( = ?auto_474253 ?auto_474262 ) ) ( not ( = ?auto_474253 ?auto_474263 ) ) ( not ( = ?auto_474253 ?auto_474264 ) ) ( not ( = ?auto_474253 ?auto_474265 ) ) ( not ( = ?auto_474254 ?auto_474255 ) ) ( not ( = ?auto_474254 ?auto_474256 ) ) ( not ( = ?auto_474254 ?auto_474257 ) ) ( not ( = ?auto_474254 ?auto_474258 ) ) ( not ( = ?auto_474254 ?auto_474259 ) ) ( not ( = ?auto_474254 ?auto_474260 ) ) ( not ( = ?auto_474254 ?auto_474261 ) ) ( not ( = ?auto_474254 ?auto_474262 ) ) ( not ( = ?auto_474254 ?auto_474263 ) ) ( not ( = ?auto_474254 ?auto_474264 ) ) ( not ( = ?auto_474254 ?auto_474265 ) ) ( not ( = ?auto_474255 ?auto_474256 ) ) ( not ( = ?auto_474255 ?auto_474257 ) ) ( not ( = ?auto_474255 ?auto_474258 ) ) ( not ( = ?auto_474255 ?auto_474259 ) ) ( not ( = ?auto_474255 ?auto_474260 ) ) ( not ( = ?auto_474255 ?auto_474261 ) ) ( not ( = ?auto_474255 ?auto_474262 ) ) ( not ( = ?auto_474255 ?auto_474263 ) ) ( not ( = ?auto_474255 ?auto_474264 ) ) ( not ( = ?auto_474255 ?auto_474265 ) ) ( not ( = ?auto_474256 ?auto_474257 ) ) ( not ( = ?auto_474256 ?auto_474258 ) ) ( not ( = ?auto_474256 ?auto_474259 ) ) ( not ( = ?auto_474256 ?auto_474260 ) ) ( not ( = ?auto_474256 ?auto_474261 ) ) ( not ( = ?auto_474256 ?auto_474262 ) ) ( not ( = ?auto_474256 ?auto_474263 ) ) ( not ( = ?auto_474256 ?auto_474264 ) ) ( not ( = ?auto_474256 ?auto_474265 ) ) ( not ( = ?auto_474257 ?auto_474258 ) ) ( not ( = ?auto_474257 ?auto_474259 ) ) ( not ( = ?auto_474257 ?auto_474260 ) ) ( not ( = ?auto_474257 ?auto_474261 ) ) ( not ( = ?auto_474257 ?auto_474262 ) ) ( not ( = ?auto_474257 ?auto_474263 ) ) ( not ( = ?auto_474257 ?auto_474264 ) ) ( not ( = ?auto_474257 ?auto_474265 ) ) ( not ( = ?auto_474258 ?auto_474259 ) ) ( not ( = ?auto_474258 ?auto_474260 ) ) ( not ( = ?auto_474258 ?auto_474261 ) ) ( not ( = ?auto_474258 ?auto_474262 ) ) ( not ( = ?auto_474258 ?auto_474263 ) ) ( not ( = ?auto_474258 ?auto_474264 ) ) ( not ( = ?auto_474258 ?auto_474265 ) ) ( not ( = ?auto_474259 ?auto_474260 ) ) ( not ( = ?auto_474259 ?auto_474261 ) ) ( not ( = ?auto_474259 ?auto_474262 ) ) ( not ( = ?auto_474259 ?auto_474263 ) ) ( not ( = ?auto_474259 ?auto_474264 ) ) ( not ( = ?auto_474259 ?auto_474265 ) ) ( not ( = ?auto_474260 ?auto_474261 ) ) ( not ( = ?auto_474260 ?auto_474262 ) ) ( not ( = ?auto_474260 ?auto_474263 ) ) ( not ( = ?auto_474260 ?auto_474264 ) ) ( not ( = ?auto_474260 ?auto_474265 ) ) ( not ( = ?auto_474261 ?auto_474262 ) ) ( not ( = ?auto_474261 ?auto_474263 ) ) ( not ( = ?auto_474261 ?auto_474264 ) ) ( not ( = ?auto_474261 ?auto_474265 ) ) ( not ( = ?auto_474262 ?auto_474263 ) ) ( not ( = ?auto_474262 ?auto_474264 ) ) ( not ( = ?auto_474262 ?auto_474265 ) ) ( not ( = ?auto_474263 ?auto_474264 ) ) ( not ( = ?auto_474263 ?auto_474265 ) ) ( not ( = ?auto_474264 ?auto_474265 ) ) ( ON ?auto_474263 ?auto_474264 ) ( ON ?auto_474262 ?auto_474263 ) ( ON ?auto_474261 ?auto_474262 ) ( ON ?auto_474260 ?auto_474261 ) ( CLEAR ?auto_474258 ) ( ON ?auto_474259 ?auto_474260 ) ( CLEAR ?auto_474259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_474252 ?auto_474253 ?auto_474254 ?auto_474255 ?auto_474256 ?auto_474257 ?auto_474258 ?auto_474259 )
      ( MAKE-13PILE ?auto_474252 ?auto_474253 ?auto_474254 ?auto_474255 ?auto_474256 ?auto_474257 ?auto_474258 ?auto_474259 ?auto_474260 ?auto_474261 ?auto_474262 ?auto_474263 ?auto_474264 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474306 - BLOCK
      ?auto_474307 - BLOCK
      ?auto_474308 - BLOCK
      ?auto_474309 - BLOCK
      ?auto_474310 - BLOCK
      ?auto_474311 - BLOCK
      ?auto_474312 - BLOCK
      ?auto_474313 - BLOCK
      ?auto_474314 - BLOCK
      ?auto_474315 - BLOCK
      ?auto_474316 - BLOCK
      ?auto_474317 - BLOCK
      ?auto_474318 - BLOCK
    )
    :vars
    (
      ?auto_474319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474318 ?auto_474319 ) ( ON-TABLE ?auto_474306 ) ( ON ?auto_474307 ?auto_474306 ) ( ON ?auto_474308 ?auto_474307 ) ( ON ?auto_474309 ?auto_474308 ) ( ON ?auto_474310 ?auto_474309 ) ( ON ?auto_474311 ?auto_474310 ) ( not ( = ?auto_474306 ?auto_474307 ) ) ( not ( = ?auto_474306 ?auto_474308 ) ) ( not ( = ?auto_474306 ?auto_474309 ) ) ( not ( = ?auto_474306 ?auto_474310 ) ) ( not ( = ?auto_474306 ?auto_474311 ) ) ( not ( = ?auto_474306 ?auto_474312 ) ) ( not ( = ?auto_474306 ?auto_474313 ) ) ( not ( = ?auto_474306 ?auto_474314 ) ) ( not ( = ?auto_474306 ?auto_474315 ) ) ( not ( = ?auto_474306 ?auto_474316 ) ) ( not ( = ?auto_474306 ?auto_474317 ) ) ( not ( = ?auto_474306 ?auto_474318 ) ) ( not ( = ?auto_474306 ?auto_474319 ) ) ( not ( = ?auto_474307 ?auto_474308 ) ) ( not ( = ?auto_474307 ?auto_474309 ) ) ( not ( = ?auto_474307 ?auto_474310 ) ) ( not ( = ?auto_474307 ?auto_474311 ) ) ( not ( = ?auto_474307 ?auto_474312 ) ) ( not ( = ?auto_474307 ?auto_474313 ) ) ( not ( = ?auto_474307 ?auto_474314 ) ) ( not ( = ?auto_474307 ?auto_474315 ) ) ( not ( = ?auto_474307 ?auto_474316 ) ) ( not ( = ?auto_474307 ?auto_474317 ) ) ( not ( = ?auto_474307 ?auto_474318 ) ) ( not ( = ?auto_474307 ?auto_474319 ) ) ( not ( = ?auto_474308 ?auto_474309 ) ) ( not ( = ?auto_474308 ?auto_474310 ) ) ( not ( = ?auto_474308 ?auto_474311 ) ) ( not ( = ?auto_474308 ?auto_474312 ) ) ( not ( = ?auto_474308 ?auto_474313 ) ) ( not ( = ?auto_474308 ?auto_474314 ) ) ( not ( = ?auto_474308 ?auto_474315 ) ) ( not ( = ?auto_474308 ?auto_474316 ) ) ( not ( = ?auto_474308 ?auto_474317 ) ) ( not ( = ?auto_474308 ?auto_474318 ) ) ( not ( = ?auto_474308 ?auto_474319 ) ) ( not ( = ?auto_474309 ?auto_474310 ) ) ( not ( = ?auto_474309 ?auto_474311 ) ) ( not ( = ?auto_474309 ?auto_474312 ) ) ( not ( = ?auto_474309 ?auto_474313 ) ) ( not ( = ?auto_474309 ?auto_474314 ) ) ( not ( = ?auto_474309 ?auto_474315 ) ) ( not ( = ?auto_474309 ?auto_474316 ) ) ( not ( = ?auto_474309 ?auto_474317 ) ) ( not ( = ?auto_474309 ?auto_474318 ) ) ( not ( = ?auto_474309 ?auto_474319 ) ) ( not ( = ?auto_474310 ?auto_474311 ) ) ( not ( = ?auto_474310 ?auto_474312 ) ) ( not ( = ?auto_474310 ?auto_474313 ) ) ( not ( = ?auto_474310 ?auto_474314 ) ) ( not ( = ?auto_474310 ?auto_474315 ) ) ( not ( = ?auto_474310 ?auto_474316 ) ) ( not ( = ?auto_474310 ?auto_474317 ) ) ( not ( = ?auto_474310 ?auto_474318 ) ) ( not ( = ?auto_474310 ?auto_474319 ) ) ( not ( = ?auto_474311 ?auto_474312 ) ) ( not ( = ?auto_474311 ?auto_474313 ) ) ( not ( = ?auto_474311 ?auto_474314 ) ) ( not ( = ?auto_474311 ?auto_474315 ) ) ( not ( = ?auto_474311 ?auto_474316 ) ) ( not ( = ?auto_474311 ?auto_474317 ) ) ( not ( = ?auto_474311 ?auto_474318 ) ) ( not ( = ?auto_474311 ?auto_474319 ) ) ( not ( = ?auto_474312 ?auto_474313 ) ) ( not ( = ?auto_474312 ?auto_474314 ) ) ( not ( = ?auto_474312 ?auto_474315 ) ) ( not ( = ?auto_474312 ?auto_474316 ) ) ( not ( = ?auto_474312 ?auto_474317 ) ) ( not ( = ?auto_474312 ?auto_474318 ) ) ( not ( = ?auto_474312 ?auto_474319 ) ) ( not ( = ?auto_474313 ?auto_474314 ) ) ( not ( = ?auto_474313 ?auto_474315 ) ) ( not ( = ?auto_474313 ?auto_474316 ) ) ( not ( = ?auto_474313 ?auto_474317 ) ) ( not ( = ?auto_474313 ?auto_474318 ) ) ( not ( = ?auto_474313 ?auto_474319 ) ) ( not ( = ?auto_474314 ?auto_474315 ) ) ( not ( = ?auto_474314 ?auto_474316 ) ) ( not ( = ?auto_474314 ?auto_474317 ) ) ( not ( = ?auto_474314 ?auto_474318 ) ) ( not ( = ?auto_474314 ?auto_474319 ) ) ( not ( = ?auto_474315 ?auto_474316 ) ) ( not ( = ?auto_474315 ?auto_474317 ) ) ( not ( = ?auto_474315 ?auto_474318 ) ) ( not ( = ?auto_474315 ?auto_474319 ) ) ( not ( = ?auto_474316 ?auto_474317 ) ) ( not ( = ?auto_474316 ?auto_474318 ) ) ( not ( = ?auto_474316 ?auto_474319 ) ) ( not ( = ?auto_474317 ?auto_474318 ) ) ( not ( = ?auto_474317 ?auto_474319 ) ) ( not ( = ?auto_474318 ?auto_474319 ) ) ( ON ?auto_474317 ?auto_474318 ) ( ON ?auto_474316 ?auto_474317 ) ( ON ?auto_474315 ?auto_474316 ) ( ON ?auto_474314 ?auto_474315 ) ( ON ?auto_474313 ?auto_474314 ) ( CLEAR ?auto_474311 ) ( ON ?auto_474312 ?auto_474313 ) ( CLEAR ?auto_474312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_474306 ?auto_474307 ?auto_474308 ?auto_474309 ?auto_474310 ?auto_474311 ?auto_474312 )
      ( MAKE-13PILE ?auto_474306 ?auto_474307 ?auto_474308 ?auto_474309 ?auto_474310 ?auto_474311 ?auto_474312 ?auto_474313 ?auto_474314 ?auto_474315 ?auto_474316 ?auto_474317 ?auto_474318 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474360 - BLOCK
      ?auto_474361 - BLOCK
      ?auto_474362 - BLOCK
      ?auto_474363 - BLOCK
      ?auto_474364 - BLOCK
      ?auto_474365 - BLOCK
      ?auto_474366 - BLOCK
      ?auto_474367 - BLOCK
      ?auto_474368 - BLOCK
      ?auto_474369 - BLOCK
      ?auto_474370 - BLOCK
      ?auto_474371 - BLOCK
      ?auto_474372 - BLOCK
    )
    :vars
    (
      ?auto_474373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474372 ?auto_474373 ) ( ON-TABLE ?auto_474360 ) ( ON ?auto_474361 ?auto_474360 ) ( ON ?auto_474362 ?auto_474361 ) ( ON ?auto_474363 ?auto_474362 ) ( ON ?auto_474364 ?auto_474363 ) ( not ( = ?auto_474360 ?auto_474361 ) ) ( not ( = ?auto_474360 ?auto_474362 ) ) ( not ( = ?auto_474360 ?auto_474363 ) ) ( not ( = ?auto_474360 ?auto_474364 ) ) ( not ( = ?auto_474360 ?auto_474365 ) ) ( not ( = ?auto_474360 ?auto_474366 ) ) ( not ( = ?auto_474360 ?auto_474367 ) ) ( not ( = ?auto_474360 ?auto_474368 ) ) ( not ( = ?auto_474360 ?auto_474369 ) ) ( not ( = ?auto_474360 ?auto_474370 ) ) ( not ( = ?auto_474360 ?auto_474371 ) ) ( not ( = ?auto_474360 ?auto_474372 ) ) ( not ( = ?auto_474360 ?auto_474373 ) ) ( not ( = ?auto_474361 ?auto_474362 ) ) ( not ( = ?auto_474361 ?auto_474363 ) ) ( not ( = ?auto_474361 ?auto_474364 ) ) ( not ( = ?auto_474361 ?auto_474365 ) ) ( not ( = ?auto_474361 ?auto_474366 ) ) ( not ( = ?auto_474361 ?auto_474367 ) ) ( not ( = ?auto_474361 ?auto_474368 ) ) ( not ( = ?auto_474361 ?auto_474369 ) ) ( not ( = ?auto_474361 ?auto_474370 ) ) ( not ( = ?auto_474361 ?auto_474371 ) ) ( not ( = ?auto_474361 ?auto_474372 ) ) ( not ( = ?auto_474361 ?auto_474373 ) ) ( not ( = ?auto_474362 ?auto_474363 ) ) ( not ( = ?auto_474362 ?auto_474364 ) ) ( not ( = ?auto_474362 ?auto_474365 ) ) ( not ( = ?auto_474362 ?auto_474366 ) ) ( not ( = ?auto_474362 ?auto_474367 ) ) ( not ( = ?auto_474362 ?auto_474368 ) ) ( not ( = ?auto_474362 ?auto_474369 ) ) ( not ( = ?auto_474362 ?auto_474370 ) ) ( not ( = ?auto_474362 ?auto_474371 ) ) ( not ( = ?auto_474362 ?auto_474372 ) ) ( not ( = ?auto_474362 ?auto_474373 ) ) ( not ( = ?auto_474363 ?auto_474364 ) ) ( not ( = ?auto_474363 ?auto_474365 ) ) ( not ( = ?auto_474363 ?auto_474366 ) ) ( not ( = ?auto_474363 ?auto_474367 ) ) ( not ( = ?auto_474363 ?auto_474368 ) ) ( not ( = ?auto_474363 ?auto_474369 ) ) ( not ( = ?auto_474363 ?auto_474370 ) ) ( not ( = ?auto_474363 ?auto_474371 ) ) ( not ( = ?auto_474363 ?auto_474372 ) ) ( not ( = ?auto_474363 ?auto_474373 ) ) ( not ( = ?auto_474364 ?auto_474365 ) ) ( not ( = ?auto_474364 ?auto_474366 ) ) ( not ( = ?auto_474364 ?auto_474367 ) ) ( not ( = ?auto_474364 ?auto_474368 ) ) ( not ( = ?auto_474364 ?auto_474369 ) ) ( not ( = ?auto_474364 ?auto_474370 ) ) ( not ( = ?auto_474364 ?auto_474371 ) ) ( not ( = ?auto_474364 ?auto_474372 ) ) ( not ( = ?auto_474364 ?auto_474373 ) ) ( not ( = ?auto_474365 ?auto_474366 ) ) ( not ( = ?auto_474365 ?auto_474367 ) ) ( not ( = ?auto_474365 ?auto_474368 ) ) ( not ( = ?auto_474365 ?auto_474369 ) ) ( not ( = ?auto_474365 ?auto_474370 ) ) ( not ( = ?auto_474365 ?auto_474371 ) ) ( not ( = ?auto_474365 ?auto_474372 ) ) ( not ( = ?auto_474365 ?auto_474373 ) ) ( not ( = ?auto_474366 ?auto_474367 ) ) ( not ( = ?auto_474366 ?auto_474368 ) ) ( not ( = ?auto_474366 ?auto_474369 ) ) ( not ( = ?auto_474366 ?auto_474370 ) ) ( not ( = ?auto_474366 ?auto_474371 ) ) ( not ( = ?auto_474366 ?auto_474372 ) ) ( not ( = ?auto_474366 ?auto_474373 ) ) ( not ( = ?auto_474367 ?auto_474368 ) ) ( not ( = ?auto_474367 ?auto_474369 ) ) ( not ( = ?auto_474367 ?auto_474370 ) ) ( not ( = ?auto_474367 ?auto_474371 ) ) ( not ( = ?auto_474367 ?auto_474372 ) ) ( not ( = ?auto_474367 ?auto_474373 ) ) ( not ( = ?auto_474368 ?auto_474369 ) ) ( not ( = ?auto_474368 ?auto_474370 ) ) ( not ( = ?auto_474368 ?auto_474371 ) ) ( not ( = ?auto_474368 ?auto_474372 ) ) ( not ( = ?auto_474368 ?auto_474373 ) ) ( not ( = ?auto_474369 ?auto_474370 ) ) ( not ( = ?auto_474369 ?auto_474371 ) ) ( not ( = ?auto_474369 ?auto_474372 ) ) ( not ( = ?auto_474369 ?auto_474373 ) ) ( not ( = ?auto_474370 ?auto_474371 ) ) ( not ( = ?auto_474370 ?auto_474372 ) ) ( not ( = ?auto_474370 ?auto_474373 ) ) ( not ( = ?auto_474371 ?auto_474372 ) ) ( not ( = ?auto_474371 ?auto_474373 ) ) ( not ( = ?auto_474372 ?auto_474373 ) ) ( ON ?auto_474371 ?auto_474372 ) ( ON ?auto_474370 ?auto_474371 ) ( ON ?auto_474369 ?auto_474370 ) ( ON ?auto_474368 ?auto_474369 ) ( ON ?auto_474367 ?auto_474368 ) ( ON ?auto_474366 ?auto_474367 ) ( CLEAR ?auto_474364 ) ( ON ?auto_474365 ?auto_474366 ) ( CLEAR ?auto_474365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_474360 ?auto_474361 ?auto_474362 ?auto_474363 ?auto_474364 ?auto_474365 )
      ( MAKE-13PILE ?auto_474360 ?auto_474361 ?auto_474362 ?auto_474363 ?auto_474364 ?auto_474365 ?auto_474366 ?auto_474367 ?auto_474368 ?auto_474369 ?auto_474370 ?auto_474371 ?auto_474372 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474414 - BLOCK
      ?auto_474415 - BLOCK
      ?auto_474416 - BLOCK
      ?auto_474417 - BLOCK
      ?auto_474418 - BLOCK
      ?auto_474419 - BLOCK
      ?auto_474420 - BLOCK
      ?auto_474421 - BLOCK
      ?auto_474422 - BLOCK
      ?auto_474423 - BLOCK
      ?auto_474424 - BLOCK
      ?auto_474425 - BLOCK
      ?auto_474426 - BLOCK
    )
    :vars
    (
      ?auto_474427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474426 ?auto_474427 ) ( ON-TABLE ?auto_474414 ) ( ON ?auto_474415 ?auto_474414 ) ( ON ?auto_474416 ?auto_474415 ) ( ON ?auto_474417 ?auto_474416 ) ( not ( = ?auto_474414 ?auto_474415 ) ) ( not ( = ?auto_474414 ?auto_474416 ) ) ( not ( = ?auto_474414 ?auto_474417 ) ) ( not ( = ?auto_474414 ?auto_474418 ) ) ( not ( = ?auto_474414 ?auto_474419 ) ) ( not ( = ?auto_474414 ?auto_474420 ) ) ( not ( = ?auto_474414 ?auto_474421 ) ) ( not ( = ?auto_474414 ?auto_474422 ) ) ( not ( = ?auto_474414 ?auto_474423 ) ) ( not ( = ?auto_474414 ?auto_474424 ) ) ( not ( = ?auto_474414 ?auto_474425 ) ) ( not ( = ?auto_474414 ?auto_474426 ) ) ( not ( = ?auto_474414 ?auto_474427 ) ) ( not ( = ?auto_474415 ?auto_474416 ) ) ( not ( = ?auto_474415 ?auto_474417 ) ) ( not ( = ?auto_474415 ?auto_474418 ) ) ( not ( = ?auto_474415 ?auto_474419 ) ) ( not ( = ?auto_474415 ?auto_474420 ) ) ( not ( = ?auto_474415 ?auto_474421 ) ) ( not ( = ?auto_474415 ?auto_474422 ) ) ( not ( = ?auto_474415 ?auto_474423 ) ) ( not ( = ?auto_474415 ?auto_474424 ) ) ( not ( = ?auto_474415 ?auto_474425 ) ) ( not ( = ?auto_474415 ?auto_474426 ) ) ( not ( = ?auto_474415 ?auto_474427 ) ) ( not ( = ?auto_474416 ?auto_474417 ) ) ( not ( = ?auto_474416 ?auto_474418 ) ) ( not ( = ?auto_474416 ?auto_474419 ) ) ( not ( = ?auto_474416 ?auto_474420 ) ) ( not ( = ?auto_474416 ?auto_474421 ) ) ( not ( = ?auto_474416 ?auto_474422 ) ) ( not ( = ?auto_474416 ?auto_474423 ) ) ( not ( = ?auto_474416 ?auto_474424 ) ) ( not ( = ?auto_474416 ?auto_474425 ) ) ( not ( = ?auto_474416 ?auto_474426 ) ) ( not ( = ?auto_474416 ?auto_474427 ) ) ( not ( = ?auto_474417 ?auto_474418 ) ) ( not ( = ?auto_474417 ?auto_474419 ) ) ( not ( = ?auto_474417 ?auto_474420 ) ) ( not ( = ?auto_474417 ?auto_474421 ) ) ( not ( = ?auto_474417 ?auto_474422 ) ) ( not ( = ?auto_474417 ?auto_474423 ) ) ( not ( = ?auto_474417 ?auto_474424 ) ) ( not ( = ?auto_474417 ?auto_474425 ) ) ( not ( = ?auto_474417 ?auto_474426 ) ) ( not ( = ?auto_474417 ?auto_474427 ) ) ( not ( = ?auto_474418 ?auto_474419 ) ) ( not ( = ?auto_474418 ?auto_474420 ) ) ( not ( = ?auto_474418 ?auto_474421 ) ) ( not ( = ?auto_474418 ?auto_474422 ) ) ( not ( = ?auto_474418 ?auto_474423 ) ) ( not ( = ?auto_474418 ?auto_474424 ) ) ( not ( = ?auto_474418 ?auto_474425 ) ) ( not ( = ?auto_474418 ?auto_474426 ) ) ( not ( = ?auto_474418 ?auto_474427 ) ) ( not ( = ?auto_474419 ?auto_474420 ) ) ( not ( = ?auto_474419 ?auto_474421 ) ) ( not ( = ?auto_474419 ?auto_474422 ) ) ( not ( = ?auto_474419 ?auto_474423 ) ) ( not ( = ?auto_474419 ?auto_474424 ) ) ( not ( = ?auto_474419 ?auto_474425 ) ) ( not ( = ?auto_474419 ?auto_474426 ) ) ( not ( = ?auto_474419 ?auto_474427 ) ) ( not ( = ?auto_474420 ?auto_474421 ) ) ( not ( = ?auto_474420 ?auto_474422 ) ) ( not ( = ?auto_474420 ?auto_474423 ) ) ( not ( = ?auto_474420 ?auto_474424 ) ) ( not ( = ?auto_474420 ?auto_474425 ) ) ( not ( = ?auto_474420 ?auto_474426 ) ) ( not ( = ?auto_474420 ?auto_474427 ) ) ( not ( = ?auto_474421 ?auto_474422 ) ) ( not ( = ?auto_474421 ?auto_474423 ) ) ( not ( = ?auto_474421 ?auto_474424 ) ) ( not ( = ?auto_474421 ?auto_474425 ) ) ( not ( = ?auto_474421 ?auto_474426 ) ) ( not ( = ?auto_474421 ?auto_474427 ) ) ( not ( = ?auto_474422 ?auto_474423 ) ) ( not ( = ?auto_474422 ?auto_474424 ) ) ( not ( = ?auto_474422 ?auto_474425 ) ) ( not ( = ?auto_474422 ?auto_474426 ) ) ( not ( = ?auto_474422 ?auto_474427 ) ) ( not ( = ?auto_474423 ?auto_474424 ) ) ( not ( = ?auto_474423 ?auto_474425 ) ) ( not ( = ?auto_474423 ?auto_474426 ) ) ( not ( = ?auto_474423 ?auto_474427 ) ) ( not ( = ?auto_474424 ?auto_474425 ) ) ( not ( = ?auto_474424 ?auto_474426 ) ) ( not ( = ?auto_474424 ?auto_474427 ) ) ( not ( = ?auto_474425 ?auto_474426 ) ) ( not ( = ?auto_474425 ?auto_474427 ) ) ( not ( = ?auto_474426 ?auto_474427 ) ) ( ON ?auto_474425 ?auto_474426 ) ( ON ?auto_474424 ?auto_474425 ) ( ON ?auto_474423 ?auto_474424 ) ( ON ?auto_474422 ?auto_474423 ) ( ON ?auto_474421 ?auto_474422 ) ( ON ?auto_474420 ?auto_474421 ) ( ON ?auto_474419 ?auto_474420 ) ( CLEAR ?auto_474417 ) ( ON ?auto_474418 ?auto_474419 ) ( CLEAR ?auto_474418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_474414 ?auto_474415 ?auto_474416 ?auto_474417 ?auto_474418 )
      ( MAKE-13PILE ?auto_474414 ?auto_474415 ?auto_474416 ?auto_474417 ?auto_474418 ?auto_474419 ?auto_474420 ?auto_474421 ?auto_474422 ?auto_474423 ?auto_474424 ?auto_474425 ?auto_474426 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474468 - BLOCK
      ?auto_474469 - BLOCK
      ?auto_474470 - BLOCK
      ?auto_474471 - BLOCK
      ?auto_474472 - BLOCK
      ?auto_474473 - BLOCK
      ?auto_474474 - BLOCK
      ?auto_474475 - BLOCK
      ?auto_474476 - BLOCK
      ?auto_474477 - BLOCK
      ?auto_474478 - BLOCK
      ?auto_474479 - BLOCK
      ?auto_474480 - BLOCK
    )
    :vars
    (
      ?auto_474481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474480 ?auto_474481 ) ( ON-TABLE ?auto_474468 ) ( ON ?auto_474469 ?auto_474468 ) ( ON ?auto_474470 ?auto_474469 ) ( not ( = ?auto_474468 ?auto_474469 ) ) ( not ( = ?auto_474468 ?auto_474470 ) ) ( not ( = ?auto_474468 ?auto_474471 ) ) ( not ( = ?auto_474468 ?auto_474472 ) ) ( not ( = ?auto_474468 ?auto_474473 ) ) ( not ( = ?auto_474468 ?auto_474474 ) ) ( not ( = ?auto_474468 ?auto_474475 ) ) ( not ( = ?auto_474468 ?auto_474476 ) ) ( not ( = ?auto_474468 ?auto_474477 ) ) ( not ( = ?auto_474468 ?auto_474478 ) ) ( not ( = ?auto_474468 ?auto_474479 ) ) ( not ( = ?auto_474468 ?auto_474480 ) ) ( not ( = ?auto_474468 ?auto_474481 ) ) ( not ( = ?auto_474469 ?auto_474470 ) ) ( not ( = ?auto_474469 ?auto_474471 ) ) ( not ( = ?auto_474469 ?auto_474472 ) ) ( not ( = ?auto_474469 ?auto_474473 ) ) ( not ( = ?auto_474469 ?auto_474474 ) ) ( not ( = ?auto_474469 ?auto_474475 ) ) ( not ( = ?auto_474469 ?auto_474476 ) ) ( not ( = ?auto_474469 ?auto_474477 ) ) ( not ( = ?auto_474469 ?auto_474478 ) ) ( not ( = ?auto_474469 ?auto_474479 ) ) ( not ( = ?auto_474469 ?auto_474480 ) ) ( not ( = ?auto_474469 ?auto_474481 ) ) ( not ( = ?auto_474470 ?auto_474471 ) ) ( not ( = ?auto_474470 ?auto_474472 ) ) ( not ( = ?auto_474470 ?auto_474473 ) ) ( not ( = ?auto_474470 ?auto_474474 ) ) ( not ( = ?auto_474470 ?auto_474475 ) ) ( not ( = ?auto_474470 ?auto_474476 ) ) ( not ( = ?auto_474470 ?auto_474477 ) ) ( not ( = ?auto_474470 ?auto_474478 ) ) ( not ( = ?auto_474470 ?auto_474479 ) ) ( not ( = ?auto_474470 ?auto_474480 ) ) ( not ( = ?auto_474470 ?auto_474481 ) ) ( not ( = ?auto_474471 ?auto_474472 ) ) ( not ( = ?auto_474471 ?auto_474473 ) ) ( not ( = ?auto_474471 ?auto_474474 ) ) ( not ( = ?auto_474471 ?auto_474475 ) ) ( not ( = ?auto_474471 ?auto_474476 ) ) ( not ( = ?auto_474471 ?auto_474477 ) ) ( not ( = ?auto_474471 ?auto_474478 ) ) ( not ( = ?auto_474471 ?auto_474479 ) ) ( not ( = ?auto_474471 ?auto_474480 ) ) ( not ( = ?auto_474471 ?auto_474481 ) ) ( not ( = ?auto_474472 ?auto_474473 ) ) ( not ( = ?auto_474472 ?auto_474474 ) ) ( not ( = ?auto_474472 ?auto_474475 ) ) ( not ( = ?auto_474472 ?auto_474476 ) ) ( not ( = ?auto_474472 ?auto_474477 ) ) ( not ( = ?auto_474472 ?auto_474478 ) ) ( not ( = ?auto_474472 ?auto_474479 ) ) ( not ( = ?auto_474472 ?auto_474480 ) ) ( not ( = ?auto_474472 ?auto_474481 ) ) ( not ( = ?auto_474473 ?auto_474474 ) ) ( not ( = ?auto_474473 ?auto_474475 ) ) ( not ( = ?auto_474473 ?auto_474476 ) ) ( not ( = ?auto_474473 ?auto_474477 ) ) ( not ( = ?auto_474473 ?auto_474478 ) ) ( not ( = ?auto_474473 ?auto_474479 ) ) ( not ( = ?auto_474473 ?auto_474480 ) ) ( not ( = ?auto_474473 ?auto_474481 ) ) ( not ( = ?auto_474474 ?auto_474475 ) ) ( not ( = ?auto_474474 ?auto_474476 ) ) ( not ( = ?auto_474474 ?auto_474477 ) ) ( not ( = ?auto_474474 ?auto_474478 ) ) ( not ( = ?auto_474474 ?auto_474479 ) ) ( not ( = ?auto_474474 ?auto_474480 ) ) ( not ( = ?auto_474474 ?auto_474481 ) ) ( not ( = ?auto_474475 ?auto_474476 ) ) ( not ( = ?auto_474475 ?auto_474477 ) ) ( not ( = ?auto_474475 ?auto_474478 ) ) ( not ( = ?auto_474475 ?auto_474479 ) ) ( not ( = ?auto_474475 ?auto_474480 ) ) ( not ( = ?auto_474475 ?auto_474481 ) ) ( not ( = ?auto_474476 ?auto_474477 ) ) ( not ( = ?auto_474476 ?auto_474478 ) ) ( not ( = ?auto_474476 ?auto_474479 ) ) ( not ( = ?auto_474476 ?auto_474480 ) ) ( not ( = ?auto_474476 ?auto_474481 ) ) ( not ( = ?auto_474477 ?auto_474478 ) ) ( not ( = ?auto_474477 ?auto_474479 ) ) ( not ( = ?auto_474477 ?auto_474480 ) ) ( not ( = ?auto_474477 ?auto_474481 ) ) ( not ( = ?auto_474478 ?auto_474479 ) ) ( not ( = ?auto_474478 ?auto_474480 ) ) ( not ( = ?auto_474478 ?auto_474481 ) ) ( not ( = ?auto_474479 ?auto_474480 ) ) ( not ( = ?auto_474479 ?auto_474481 ) ) ( not ( = ?auto_474480 ?auto_474481 ) ) ( ON ?auto_474479 ?auto_474480 ) ( ON ?auto_474478 ?auto_474479 ) ( ON ?auto_474477 ?auto_474478 ) ( ON ?auto_474476 ?auto_474477 ) ( ON ?auto_474475 ?auto_474476 ) ( ON ?auto_474474 ?auto_474475 ) ( ON ?auto_474473 ?auto_474474 ) ( ON ?auto_474472 ?auto_474473 ) ( CLEAR ?auto_474470 ) ( ON ?auto_474471 ?auto_474472 ) ( CLEAR ?auto_474471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_474468 ?auto_474469 ?auto_474470 ?auto_474471 )
      ( MAKE-13PILE ?auto_474468 ?auto_474469 ?auto_474470 ?auto_474471 ?auto_474472 ?auto_474473 ?auto_474474 ?auto_474475 ?auto_474476 ?auto_474477 ?auto_474478 ?auto_474479 ?auto_474480 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474522 - BLOCK
      ?auto_474523 - BLOCK
      ?auto_474524 - BLOCK
      ?auto_474525 - BLOCK
      ?auto_474526 - BLOCK
      ?auto_474527 - BLOCK
      ?auto_474528 - BLOCK
      ?auto_474529 - BLOCK
      ?auto_474530 - BLOCK
      ?auto_474531 - BLOCK
      ?auto_474532 - BLOCK
      ?auto_474533 - BLOCK
      ?auto_474534 - BLOCK
    )
    :vars
    (
      ?auto_474535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474534 ?auto_474535 ) ( ON-TABLE ?auto_474522 ) ( ON ?auto_474523 ?auto_474522 ) ( not ( = ?auto_474522 ?auto_474523 ) ) ( not ( = ?auto_474522 ?auto_474524 ) ) ( not ( = ?auto_474522 ?auto_474525 ) ) ( not ( = ?auto_474522 ?auto_474526 ) ) ( not ( = ?auto_474522 ?auto_474527 ) ) ( not ( = ?auto_474522 ?auto_474528 ) ) ( not ( = ?auto_474522 ?auto_474529 ) ) ( not ( = ?auto_474522 ?auto_474530 ) ) ( not ( = ?auto_474522 ?auto_474531 ) ) ( not ( = ?auto_474522 ?auto_474532 ) ) ( not ( = ?auto_474522 ?auto_474533 ) ) ( not ( = ?auto_474522 ?auto_474534 ) ) ( not ( = ?auto_474522 ?auto_474535 ) ) ( not ( = ?auto_474523 ?auto_474524 ) ) ( not ( = ?auto_474523 ?auto_474525 ) ) ( not ( = ?auto_474523 ?auto_474526 ) ) ( not ( = ?auto_474523 ?auto_474527 ) ) ( not ( = ?auto_474523 ?auto_474528 ) ) ( not ( = ?auto_474523 ?auto_474529 ) ) ( not ( = ?auto_474523 ?auto_474530 ) ) ( not ( = ?auto_474523 ?auto_474531 ) ) ( not ( = ?auto_474523 ?auto_474532 ) ) ( not ( = ?auto_474523 ?auto_474533 ) ) ( not ( = ?auto_474523 ?auto_474534 ) ) ( not ( = ?auto_474523 ?auto_474535 ) ) ( not ( = ?auto_474524 ?auto_474525 ) ) ( not ( = ?auto_474524 ?auto_474526 ) ) ( not ( = ?auto_474524 ?auto_474527 ) ) ( not ( = ?auto_474524 ?auto_474528 ) ) ( not ( = ?auto_474524 ?auto_474529 ) ) ( not ( = ?auto_474524 ?auto_474530 ) ) ( not ( = ?auto_474524 ?auto_474531 ) ) ( not ( = ?auto_474524 ?auto_474532 ) ) ( not ( = ?auto_474524 ?auto_474533 ) ) ( not ( = ?auto_474524 ?auto_474534 ) ) ( not ( = ?auto_474524 ?auto_474535 ) ) ( not ( = ?auto_474525 ?auto_474526 ) ) ( not ( = ?auto_474525 ?auto_474527 ) ) ( not ( = ?auto_474525 ?auto_474528 ) ) ( not ( = ?auto_474525 ?auto_474529 ) ) ( not ( = ?auto_474525 ?auto_474530 ) ) ( not ( = ?auto_474525 ?auto_474531 ) ) ( not ( = ?auto_474525 ?auto_474532 ) ) ( not ( = ?auto_474525 ?auto_474533 ) ) ( not ( = ?auto_474525 ?auto_474534 ) ) ( not ( = ?auto_474525 ?auto_474535 ) ) ( not ( = ?auto_474526 ?auto_474527 ) ) ( not ( = ?auto_474526 ?auto_474528 ) ) ( not ( = ?auto_474526 ?auto_474529 ) ) ( not ( = ?auto_474526 ?auto_474530 ) ) ( not ( = ?auto_474526 ?auto_474531 ) ) ( not ( = ?auto_474526 ?auto_474532 ) ) ( not ( = ?auto_474526 ?auto_474533 ) ) ( not ( = ?auto_474526 ?auto_474534 ) ) ( not ( = ?auto_474526 ?auto_474535 ) ) ( not ( = ?auto_474527 ?auto_474528 ) ) ( not ( = ?auto_474527 ?auto_474529 ) ) ( not ( = ?auto_474527 ?auto_474530 ) ) ( not ( = ?auto_474527 ?auto_474531 ) ) ( not ( = ?auto_474527 ?auto_474532 ) ) ( not ( = ?auto_474527 ?auto_474533 ) ) ( not ( = ?auto_474527 ?auto_474534 ) ) ( not ( = ?auto_474527 ?auto_474535 ) ) ( not ( = ?auto_474528 ?auto_474529 ) ) ( not ( = ?auto_474528 ?auto_474530 ) ) ( not ( = ?auto_474528 ?auto_474531 ) ) ( not ( = ?auto_474528 ?auto_474532 ) ) ( not ( = ?auto_474528 ?auto_474533 ) ) ( not ( = ?auto_474528 ?auto_474534 ) ) ( not ( = ?auto_474528 ?auto_474535 ) ) ( not ( = ?auto_474529 ?auto_474530 ) ) ( not ( = ?auto_474529 ?auto_474531 ) ) ( not ( = ?auto_474529 ?auto_474532 ) ) ( not ( = ?auto_474529 ?auto_474533 ) ) ( not ( = ?auto_474529 ?auto_474534 ) ) ( not ( = ?auto_474529 ?auto_474535 ) ) ( not ( = ?auto_474530 ?auto_474531 ) ) ( not ( = ?auto_474530 ?auto_474532 ) ) ( not ( = ?auto_474530 ?auto_474533 ) ) ( not ( = ?auto_474530 ?auto_474534 ) ) ( not ( = ?auto_474530 ?auto_474535 ) ) ( not ( = ?auto_474531 ?auto_474532 ) ) ( not ( = ?auto_474531 ?auto_474533 ) ) ( not ( = ?auto_474531 ?auto_474534 ) ) ( not ( = ?auto_474531 ?auto_474535 ) ) ( not ( = ?auto_474532 ?auto_474533 ) ) ( not ( = ?auto_474532 ?auto_474534 ) ) ( not ( = ?auto_474532 ?auto_474535 ) ) ( not ( = ?auto_474533 ?auto_474534 ) ) ( not ( = ?auto_474533 ?auto_474535 ) ) ( not ( = ?auto_474534 ?auto_474535 ) ) ( ON ?auto_474533 ?auto_474534 ) ( ON ?auto_474532 ?auto_474533 ) ( ON ?auto_474531 ?auto_474532 ) ( ON ?auto_474530 ?auto_474531 ) ( ON ?auto_474529 ?auto_474530 ) ( ON ?auto_474528 ?auto_474529 ) ( ON ?auto_474527 ?auto_474528 ) ( ON ?auto_474526 ?auto_474527 ) ( ON ?auto_474525 ?auto_474526 ) ( CLEAR ?auto_474523 ) ( ON ?auto_474524 ?auto_474525 ) ( CLEAR ?auto_474524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_474522 ?auto_474523 ?auto_474524 )
      ( MAKE-13PILE ?auto_474522 ?auto_474523 ?auto_474524 ?auto_474525 ?auto_474526 ?auto_474527 ?auto_474528 ?auto_474529 ?auto_474530 ?auto_474531 ?auto_474532 ?auto_474533 ?auto_474534 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474576 - BLOCK
      ?auto_474577 - BLOCK
      ?auto_474578 - BLOCK
      ?auto_474579 - BLOCK
      ?auto_474580 - BLOCK
      ?auto_474581 - BLOCK
      ?auto_474582 - BLOCK
      ?auto_474583 - BLOCK
      ?auto_474584 - BLOCK
      ?auto_474585 - BLOCK
      ?auto_474586 - BLOCK
      ?auto_474587 - BLOCK
      ?auto_474588 - BLOCK
    )
    :vars
    (
      ?auto_474589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474588 ?auto_474589 ) ( ON-TABLE ?auto_474576 ) ( not ( = ?auto_474576 ?auto_474577 ) ) ( not ( = ?auto_474576 ?auto_474578 ) ) ( not ( = ?auto_474576 ?auto_474579 ) ) ( not ( = ?auto_474576 ?auto_474580 ) ) ( not ( = ?auto_474576 ?auto_474581 ) ) ( not ( = ?auto_474576 ?auto_474582 ) ) ( not ( = ?auto_474576 ?auto_474583 ) ) ( not ( = ?auto_474576 ?auto_474584 ) ) ( not ( = ?auto_474576 ?auto_474585 ) ) ( not ( = ?auto_474576 ?auto_474586 ) ) ( not ( = ?auto_474576 ?auto_474587 ) ) ( not ( = ?auto_474576 ?auto_474588 ) ) ( not ( = ?auto_474576 ?auto_474589 ) ) ( not ( = ?auto_474577 ?auto_474578 ) ) ( not ( = ?auto_474577 ?auto_474579 ) ) ( not ( = ?auto_474577 ?auto_474580 ) ) ( not ( = ?auto_474577 ?auto_474581 ) ) ( not ( = ?auto_474577 ?auto_474582 ) ) ( not ( = ?auto_474577 ?auto_474583 ) ) ( not ( = ?auto_474577 ?auto_474584 ) ) ( not ( = ?auto_474577 ?auto_474585 ) ) ( not ( = ?auto_474577 ?auto_474586 ) ) ( not ( = ?auto_474577 ?auto_474587 ) ) ( not ( = ?auto_474577 ?auto_474588 ) ) ( not ( = ?auto_474577 ?auto_474589 ) ) ( not ( = ?auto_474578 ?auto_474579 ) ) ( not ( = ?auto_474578 ?auto_474580 ) ) ( not ( = ?auto_474578 ?auto_474581 ) ) ( not ( = ?auto_474578 ?auto_474582 ) ) ( not ( = ?auto_474578 ?auto_474583 ) ) ( not ( = ?auto_474578 ?auto_474584 ) ) ( not ( = ?auto_474578 ?auto_474585 ) ) ( not ( = ?auto_474578 ?auto_474586 ) ) ( not ( = ?auto_474578 ?auto_474587 ) ) ( not ( = ?auto_474578 ?auto_474588 ) ) ( not ( = ?auto_474578 ?auto_474589 ) ) ( not ( = ?auto_474579 ?auto_474580 ) ) ( not ( = ?auto_474579 ?auto_474581 ) ) ( not ( = ?auto_474579 ?auto_474582 ) ) ( not ( = ?auto_474579 ?auto_474583 ) ) ( not ( = ?auto_474579 ?auto_474584 ) ) ( not ( = ?auto_474579 ?auto_474585 ) ) ( not ( = ?auto_474579 ?auto_474586 ) ) ( not ( = ?auto_474579 ?auto_474587 ) ) ( not ( = ?auto_474579 ?auto_474588 ) ) ( not ( = ?auto_474579 ?auto_474589 ) ) ( not ( = ?auto_474580 ?auto_474581 ) ) ( not ( = ?auto_474580 ?auto_474582 ) ) ( not ( = ?auto_474580 ?auto_474583 ) ) ( not ( = ?auto_474580 ?auto_474584 ) ) ( not ( = ?auto_474580 ?auto_474585 ) ) ( not ( = ?auto_474580 ?auto_474586 ) ) ( not ( = ?auto_474580 ?auto_474587 ) ) ( not ( = ?auto_474580 ?auto_474588 ) ) ( not ( = ?auto_474580 ?auto_474589 ) ) ( not ( = ?auto_474581 ?auto_474582 ) ) ( not ( = ?auto_474581 ?auto_474583 ) ) ( not ( = ?auto_474581 ?auto_474584 ) ) ( not ( = ?auto_474581 ?auto_474585 ) ) ( not ( = ?auto_474581 ?auto_474586 ) ) ( not ( = ?auto_474581 ?auto_474587 ) ) ( not ( = ?auto_474581 ?auto_474588 ) ) ( not ( = ?auto_474581 ?auto_474589 ) ) ( not ( = ?auto_474582 ?auto_474583 ) ) ( not ( = ?auto_474582 ?auto_474584 ) ) ( not ( = ?auto_474582 ?auto_474585 ) ) ( not ( = ?auto_474582 ?auto_474586 ) ) ( not ( = ?auto_474582 ?auto_474587 ) ) ( not ( = ?auto_474582 ?auto_474588 ) ) ( not ( = ?auto_474582 ?auto_474589 ) ) ( not ( = ?auto_474583 ?auto_474584 ) ) ( not ( = ?auto_474583 ?auto_474585 ) ) ( not ( = ?auto_474583 ?auto_474586 ) ) ( not ( = ?auto_474583 ?auto_474587 ) ) ( not ( = ?auto_474583 ?auto_474588 ) ) ( not ( = ?auto_474583 ?auto_474589 ) ) ( not ( = ?auto_474584 ?auto_474585 ) ) ( not ( = ?auto_474584 ?auto_474586 ) ) ( not ( = ?auto_474584 ?auto_474587 ) ) ( not ( = ?auto_474584 ?auto_474588 ) ) ( not ( = ?auto_474584 ?auto_474589 ) ) ( not ( = ?auto_474585 ?auto_474586 ) ) ( not ( = ?auto_474585 ?auto_474587 ) ) ( not ( = ?auto_474585 ?auto_474588 ) ) ( not ( = ?auto_474585 ?auto_474589 ) ) ( not ( = ?auto_474586 ?auto_474587 ) ) ( not ( = ?auto_474586 ?auto_474588 ) ) ( not ( = ?auto_474586 ?auto_474589 ) ) ( not ( = ?auto_474587 ?auto_474588 ) ) ( not ( = ?auto_474587 ?auto_474589 ) ) ( not ( = ?auto_474588 ?auto_474589 ) ) ( ON ?auto_474587 ?auto_474588 ) ( ON ?auto_474586 ?auto_474587 ) ( ON ?auto_474585 ?auto_474586 ) ( ON ?auto_474584 ?auto_474585 ) ( ON ?auto_474583 ?auto_474584 ) ( ON ?auto_474582 ?auto_474583 ) ( ON ?auto_474581 ?auto_474582 ) ( ON ?auto_474580 ?auto_474581 ) ( ON ?auto_474579 ?auto_474580 ) ( ON ?auto_474578 ?auto_474579 ) ( CLEAR ?auto_474576 ) ( ON ?auto_474577 ?auto_474578 ) ( CLEAR ?auto_474577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_474576 ?auto_474577 )
      ( MAKE-13PILE ?auto_474576 ?auto_474577 ?auto_474578 ?auto_474579 ?auto_474580 ?auto_474581 ?auto_474582 ?auto_474583 ?auto_474584 ?auto_474585 ?auto_474586 ?auto_474587 ?auto_474588 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_474630 - BLOCK
      ?auto_474631 - BLOCK
      ?auto_474632 - BLOCK
      ?auto_474633 - BLOCK
      ?auto_474634 - BLOCK
      ?auto_474635 - BLOCK
      ?auto_474636 - BLOCK
      ?auto_474637 - BLOCK
      ?auto_474638 - BLOCK
      ?auto_474639 - BLOCK
      ?auto_474640 - BLOCK
      ?auto_474641 - BLOCK
      ?auto_474642 - BLOCK
    )
    :vars
    (
      ?auto_474643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474642 ?auto_474643 ) ( not ( = ?auto_474630 ?auto_474631 ) ) ( not ( = ?auto_474630 ?auto_474632 ) ) ( not ( = ?auto_474630 ?auto_474633 ) ) ( not ( = ?auto_474630 ?auto_474634 ) ) ( not ( = ?auto_474630 ?auto_474635 ) ) ( not ( = ?auto_474630 ?auto_474636 ) ) ( not ( = ?auto_474630 ?auto_474637 ) ) ( not ( = ?auto_474630 ?auto_474638 ) ) ( not ( = ?auto_474630 ?auto_474639 ) ) ( not ( = ?auto_474630 ?auto_474640 ) ) ( not ( = ?auto_474630 ?auto_474641 ) ) ( not ( = ?auto_474630 ?auto_474642 ) ) ( not ( = ?auto_474630 ?auto_474643 ) ) ( not ( = ?auto_474631 ?auto_474632 ) ) ( not ( = ?auto_474631 ?auto_474633 ) ) ( not ( = ?auto_474631 ?auto_474634 ) ) ( not ( = ?auto_474631 ?auto_474635 ) ) ( not ( = ?auto_474631 ?auto_474636 ) ) ( not ( = ?auto_474631 ?auto_474637 ) ) ( not ( = ?auto_474631 ?auto_474638 ) ) ( not ( = ?auto_474631 ?auto_474639 ) ) ( not ( = ?auto_474631 ?auto_474640 ) ) ( not ( = ?auto_474631 ?auto_474641 ) ) ( not ( = ?auto_474631 ?auto_474642 ) ) ( not ( = ?auto_474631 ?auto_474643 ) ) ( not ( = ?auto_474632 ?auto_474633 ) ) ( not ( = ?auto_474632 ?auto_474634 ) ) ( not ( = ?auto_474632 ?auto_474635 ) ) ( not ( = ?auto_474632 ?auto_474636 ) ) ( not ( = ?auto_474632 ?auto_474637 ) ) ( not ( = ?auto_474632 ?auto_474638 ) ) ( not ( = ?auto_474632 ?auto_474639 ) ) ( not ( = ?auto_474632 ?auto_474640 ) ) ( not ( = ?auto_474632 ?auto_474641 ) ) ( not ( = ?auto_474632 ?auto_474642 ) ) ( not ( = ?auto_474632 ?auto_474643 ) ) ( not ( = ?auto_474633 ?auto_474634 ) ) ( not ( = ?auto_474633 ?auto_474635 ) ) ( not ( = ?auto_474633 ?auto_474636 ) ) ( not ( = ?auto_474633 ?auto_474637 ) ) ( not ( = ?auto_474633 ?auto_474638 ) ) ( not ( = ?auto_474633 ?auto_474639 ) ) ( not ( = ?auto_474633 ?auto_474640 ) ) ( not ( = ?auto_474633 ?auto_474641 ) ) ( not ( = ?auto_474633 ?auto_474642 ) ) ( not ( = ?auto_474633 ?auto_474643 ) ) ( not ( = ?auto_474634 ?auto_474635 ) ) ( not ( = ?auto_474634 ?auto_474636 ) ) ( not ( = ?auto_474634 ?auto_474637 ) ) ( not ( = ?auto_474634 ?auto_474638 ) ) ( not ( = ?auto_474634 ?auto_474639 ) ) ( not ( = ?auto_474634 ?auto_474640 ) ) ( not ( = ?auto_474634 ?auto_474641 ) ) ( not ( = ?auto_474634 ?auto_474642 ) ) ( not ( = ?auto_474634 ?auto_474643 ) ) ( not ( = ?auto_474635 ?auto_474636 ) ) ( not ( = ?auto_474635 ?auto_474637 ) ) ( not ( = ?auto_474635 ?auto_474638 ) ) ( not ( = ?auto_474635 ?auto_474639 ) ) ( not ( = ?auto_474635 ?auto_474640 ) ) ( not ( = ?auto_474635 ?auto_474641 ) ) ( not ( = ?auto_474635 ?auto_474642 ) ) ( not ( = ?auto_474635 ?auto_474643 ) ) ( not ( = ?auto_474636 ?auto_474637 ) ) ( not ( = ?auto_474636 ?auto_474638 ) ) ( not ( = ?auto_474636 ?auto_474639 ) ) ( not ( = ?auto_474636 ?auto_474640 ) ) ( not ( = ?auto_474636 ?auto_474641 ) ) ( not ( = ?auto_474636 ?auto_474642 ) ) ( not ( = ?auto_474636 ?auto_474643 ) ) ( not ( = ?auto_474637 ?auto_474638 ) ) ( not ( = ?auto_474637 ?auto_474639 ) ) ( not ( = ?auto_474637 ?auto_474640 ) ) ( not ( = ?auto_474637 ?auto_474641 ) ) ( not ( = ?auto_474637 ?auto_474642 ) ) ( not ( = ?auto_474637 ?auto_474643 ) ) ( not ( = ?auto_474638 ?auto_474639 ) ) ( not ( = ?auto_474638 ?auto_474640 ) ) ( not ( = ?auto_474638 ?auto_474641 ) ) ( not ( = ?auto_474638 ?auto_474642 ) ) ( not ( = ?auto_474638 ?auto_474643 ) ) ( not ( = ?auto_474639 ?auto_474640 ) ) ( not ( = ?auto_474639 ?auto_474641 ) ) ( not ( = ?auto_474639 ?auto_474642 ) ) ( not ( = ?auto_474639 ?auto_474643 ) ) ( not ( = ?auto_474640 ?auto_474641 ) ) ( not ( = ?auto_474640 ?auto_474642 ) ) ( not ( = ?auto_474640 ?auto_474643 ) ) ( not ( = ?auto_474641 ?auto_474642 ) ) ( not ( = ?auto_474641 ?auto_474643 ) ) ( not ( = ?auto_474642 ?auto_474643 ) ) ( ON ?auto_474641 ?auto_474642 ) ( ON ?auto_474640 ?auto_474641 ) ( ON ?auto_474639 ?auto_474640 ) ( ON ?auto_474638 ?auto_474639 ) ( ON ?auto_474637 ?auto_474638 ) ( ON ?auto_474636 ?auto_474637 ) ( ON ?auto_474635 ?auto_474636 ) ( ON ?auto_474634 ?auto_474635 ) ( ON ?auto_474633 ?auto_474634 ) ( ON ?auto_474632 ?auto_474633 ) ( ON ?auto_474631 ?auto_474632 ) ( ON ?auto_474630 ?auto_474631 ) ( CLEAR ?auto_474630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_474630 )
      ( MAKE-13PILE ?auto_474630 ?auto_474631 ?auto_474632 ?auto_474633 ?auto_474634 ?auto_474635 ?auto_474636 ?auto_474637 ?auto_474638 ?auto_474639 ?auto_474640 ?auto_474641 ?auto_474642 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_474685 - BLOCK
      ?auto_474686 - BLOCK
      ?auto_474687 - BLOCK
      ?auto_474688 - BLOCK
      ?auto_474689 - BLOCK
      ?auto_474690 - BLOCK
      ?auto_474691 - BLOCK
      ?auto_474692 - BLOCK
      ?auto_474693 - BLOCK
      ?auto_474694 - BLOCK
      ?auto_474695 - BLOCK
      ?auto_474696 - BLOCK
      ?auto_474697 - BLOCK
      ?auto_474698 - BLOCK
    )
    :vars
    (
      ?auto_474699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_474697 ) ( ON ?auto_474698 ?auto_474699 ) ( CLEAR ?auto_474698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_474685 ) ( ON ?auto_474686 ?auto_474685 ) ( ON ?auto_474687 ?auto_474686 ) ( ON ?auto_474688 ?auto_474687 ) ( ON ?auto_474689 ?auto_474688 ) ( ON ?auto_474690 ?auto_474689 ) ( ON ?auto_474691 ?auto_474690 ) ( ON ?auto_474692 ?auto_474691 ) ( ON ?auto_474693 ?auto_474692 ) ( ON ?auto_474694 ?auto_474693 ) ( ON ?auto_474695 ?auto_474694 ) ( ON ?auto_474696 ?auto_474695 ) ( ON ?auto_474697 ?auto_474696 ) ( not ( = ?auto_474685 ?auto_474686 ) ) ( not ( = ?auto_474685 ?auto_474687 ) ) ( not ( = ?auto_474685 ?auto_474688 ) ) ( not ( = ?auto_474685 ?auto_474689 ) ) ( not ( = ?auto_474685 ?auto_474690 ) ) ( not ( = ?auto_474685 ?auto_474691 ) ) ( not ( = ?auto_474685 ?auto_474692 ) ) ( not ( = ?auto_474685 ?auto_474693 ) ) ( not ( = ?auto_474685 ?auto_474694 ) ) ( not ( = ?auto_474685 ?auto_474695 ) ) ( not ( = ?auto_474685 ?auto_474696 ) ) ( not ( = ?auto_474685 ?auto_474697 ) ) ( not ( = ?auto_474685 ?auto_474698 ) ) ( not ( = ?auto_474685 ?auto_474699 ) ) ( not ( = ?auto_474686 ?auto_474687 ) ) ( not ( = ?auto_474686 ?auto_474688 ) ) ( not ( = ?auto_474686 ?auto_474689 ) ) ( not ( = ?auto_474686 ?auto_474690 ) ) ( not ( = ?auto_474686 ?auto_474691 ) ) ( not ( = ?auto_474686 ?auto_474692 ) ) ( not ( = ?auto_474686 ?auto_474693 ) ) ( not ( = ?auto_474686 ?auto_474694 ) ) ( not ( = ?auto_474686 ?auto_474695 ) ) ( not ( = ?auto_474686 ?auto_474696 ) ) ( not ( = ?auto_474686 ?auto_474697 ) ) ( not ( = ?auto_474686 ?auto_474698 ) ) ( not ( = ?auto_474686 ?auto_474699 ) ) ( not ( = ?auto_474687 ?auto_474688 ) ) ( not ( = ?auto_474687 ?auto_474689 ) ) ( not ( = ?auto_474687 ?auto_474690 ) ) ( not ( = ?auto_474687 ?auto_474691 ) ) ( not ( = ?auto_474687 ?auto_474692 ) ) ( not ( = ?auto_474687 ?auto_474693 ) ) ( not ( = ?auto_474687 ?auto_474694 ) ) ( not ( = ?auto_474687 ?auto_474695 ) ) ( not ( = ?auto_474687 ?auto_474696 ) ) ( not ( = ?auto_474687 ?auto_474697 ) ) ( not ( = ?auto_474687 ?auto_474698 ) ) ( not ( = ?auto_474687 ?auto_474699 ) ) ( not ( = ?auto_474688 ?auto_474689 ) ) ( not ( = ?auto_474688 ?auto_474690 ) ) ( not ( = ?auto_474688 ?auto_474691 ) ) ( not ( = ?auto_474688 ?auto_474692 ) ) ( not ( = ?auto_474688 ?auto_474693 ) ) ( not ( = ?auto_474688 ?auto_474694 ) ) ( not ( = ?auto_474688 ?auto_474695 ) ) ( not ( = ?auto_474688 ?auto_474696 ) ) ( not ( = ?auto_474688 ?auto_474697 ) ) ( not ( = ?auto_474688 ?auto_474698 ) ) ( not ( = ?auto_474688 ?auto_474699 ) ) ( not ( = ?auto_474689 ?auto_474690 ) ) ( not ( = ?auto_474689 ?auto_474691 ) ) ( not ( = ?auto_474689 ?auto_474692 ) ) ( not ( = ?auto_474689 ?auto_474693 ) ) ( not ( = ?auto_474689 ?auto_474694 ) ) ( not ( = ?auto_474689 ?auto_474695 ) ) ( not ( = ?auto_474689 ?auto_474696 ) ) ( not ( = ?auto_474689 ?auto_474697 ) ) ( not ( = ?auto_474689 ?auto_474698 ) ) ( not ( = ?auto_474689 ?auto_474699 ) ) ( not ( = ?auto_474690 ?auto_474691 ) ) ( not ( = ?auto_474690 ?auto_474692 ) ) ( not ( = ?auto_474690 ?auto_474693 ) ) ( not ( = ?auto_474690 ?auto_474694 ) ) ( not ( = ?auto_474690 ?auto_474695 ) ) ( not ( = ?auto_474690 ?auto_474696 ) ) ( not ( = ?auto_474690 ?auto_474697 ) ) ( not ( = ?auto_474690 ?auto_474698 ) ) ( not ( = ?auto_474690 ?auto_474699 ) ) ( not ( = ?auto_474691 ?auto_474692 ) ) ( not ( = ?auto_474691 ?auto_474693 ) ) ( not ( = ?auto_474691 ?auto_474694 ) ) ( not ( = ?auto_474691 ?auto_474695 ) ) ( not ( = ?auto_474691 ?auto_474696 ) ) ( not ( = ?auto_474691 ?auto_474697 ) ) ( not ( = ?auto_474691 ?auto_474698 ) ) ( not ( = ?auto_474691 ?auto_474699 ) ) ( not ( = ?auto_474692 ?auto_474693 ) ) ( not ( = ?auto_474692 ?auto_474694 ) ) ( not ( = ?auto_474692 ?auto_474695 ) ) ( not ( = ?auto_474692 ?auto_474696 ) ) ( not ( = ?auto_474692 ?auto_474697 ) ) ( not ( = ?auto_474692 ?auto_474698 ) ) ( not ( = ?auto_474692 ?auto_474699 ) ) ( not ( = ?auto_474693 ?auto_474694 ) ) ( not ( = ?auto_474693 ?auto_474695 ) ) ( not ( = ?auto_474693 ?auto_474696 ) ) ( not ( = ?auto_474693 ?auto_474697 ) ) ( not ( = ?auto_474693 ?auto_474698 ) ) ( not ( = ?auto_474693 ?auto_474699 ) ) ( not ( = ?auto_474694 ?auto_474695 ) ) ( not ( = ?auto_474694 ?auto_474696 ) ) ( not ( = ?auto_474694 ?auto_474697 ) ) ( not ( = ?auto_474694 ?auto_474698 ) ) ( not ( = ?auto_474694 ?auto_474699 ) ) ( not ( = ?auto_474695 ?auto_474696 ) ) ( not ( = ?auto_474695 ?auto_474697 ) ) ( not ( = ?auto_474695 ?auto_474698 ) ) ( not ( = ?auto_474695 ?auto_474699 ) ) ( not ( = ?auto_474696 ?auto_474697 ) ) ( not ( = ?auto_474696 ?auto_474698 ) ) ( not ( = ?auto_474696 ?auto_474699 ) ) ( not ( = ?auto_474697 ?auto_474698 ) ) ( not ( = ?auto_474697 ?auto_474699 ) ) ( not ( = ?auto_474698 ?auto_474699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_474698 ?auto_474699 )
      ( !STACK ?auto_474698 ?auto_474697 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_474743 - BLOCK
      ?auto_474744 - BLOCK
      ?auto_474745 - BLOCK
      ?auto_474746 - BLOCK
      ?auto_474747 - BLOCK
      ?auto_474748 - BLOCK
      ?auto_474749 - BLOCK
      ?auto_474750 - BLOCK
      ?auto_474751 - BLOCK
      ?auto_474752 - BLOCK
      ?auto_474753 - BLOCK
      ?auto_474754 - BLOCK
      ?auto_474755 - BLOCK
      ?auto_474756 - BLOCK
    )
    :vars
    (
      ?auto_474757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474756 ?auto_474757 ) ( ON-TABLE ?auto_474743 ) ( ON ?auto_474744 ?auto_474743 ) ( ON ?auto_474745 ?auto_474744 ) ( ON ?auto_474746 ?auto_474745 ) ( ON ?auto_474747 ?auto_474746 ) ( ON ?auto_474748 ?auto_474747 ) ( ON ?auto_474749 ?auto_474748 ) ( ON ?auto_474750 ?auto_474749 ) ( ON ?auto_474751 ?auto_474750 ) ( ON ?auto_474752 ?auto_474751 ) ( ON ?auto_474753 ?auto_474752 ) ( ON ?auto_474754 ?auto_474753 ) ( not ( = ?auto_474743 ?auto_474744 ) ) ( not ( = ?auto_474743 ?auto_474745 ) ) ( not ( = ?auto_474743 ?auto_474746 ) ) ( not ( = ?auto_474743 ?auto_474747 ) ) ( not ( = ?auto_474743 ?auto_474748 ) ) ( not ( = ?auto_474743 ?auto_474749 ) ) ( not ( = ?auto_474743 ?auto_474750 ) ) ( not ( = ?auto_474743 ?auto_474751 ) ) ( not ( = ?auto_474743 ?auto_474752 ) ) ( not ( = ?auto_474743 ?auto_474753 ) ) ( not ( = ?auto_474743 ?auto_474754 ) ) ( not ( = ?auto_474743 ?auto_474755 ) ) ( not ( = ?auto_474743 ?auto_474756 ) ) ( not ( = ?auto_474743 ?auto_474757 ) ) ( not ( = ?auto_474744 ?auto_474745 ) ) ( not ( = ?auto_474744 ?auto_474746 ) ) ( not ( = ?auto_474744 ?auto_474747 ) ) ( not ( = ?auto_474744 ?auto_474748 ) ) ( not ( = ?auto_474744 ?auto_474749 ) ) ( not ( = ?auto_474744 ?auto_474750 ) ) ( not ( = ?auto_474744 ?auto_474751 ) ) ( not ( = ?auto_474744 ?auto_474752 ) ) ( not ( = ?auto_474744 ?auto_474753 ) ) ( not ( = ?auto_474744 ?auto_474754 ) ) ( not ( = ?auto_474744 ?auto_474755 ) ) ( not ( = ?auto_474744 ?auto_474756 ) ) ( not ( = ?auto_474744 ?auto_474757 ) ) ( not ( = ?auto_474745 ?auto_474746 ) ) ( not ( = ?auto_474745 ?auto_474747 ) ) ( not ( = ?auto_474745 ?auto_474748 ) ) ( not ( = ?auto_474745 ?auto_474749 ) ) ( not ( = ?auto_474745 ?auto_474750 ) ) ( not ( = ?auto_474745 ?auto_474751 ) ) ( not ( = ?auto_474745 ?auto_474752 ) ) ( not ( = ?auto_474745 ?auto_474753 ) ) ( not ( = ?auto_474745 ?auto_474754 ) ) ( not ( = ?auto_474745 ?auto_474755 ) ) ( not ( = ?auto_474745 ?auto_474756 ) ) ( not ( = ?auto_474745 ?auto_474757 ) ) ( not ( = ?auto_474746 ?auto_474747 ) ) ( not ( = ?auto_474746 ?auto_474748 ) ) ( not ( = ?auto_474746 ?auto_474749 ) ) ( not ( = ?auto_474746 ?auto_474750 ) ) ( not ( = ?auto_474746 ?auto_474751 ) ) ( not ( = ?auto_474746 ?auto_474752 ) ) ( not ( = ?auto_474746 ?auto_474753 ) ) ( not ( = ?auto_474746 ?auto_474754 ) ) ( not ( = ?auto_474746 ?auto_474755 ) ) ( not ( = ?auto_474746 ?auto_474756 ) ) ( not ( = ?auto_474746 ?auto_474757 ) ) ( not ( = ?auto_474747 ?auto_474748 ) ) ( not ( = ?auto_474747 ?auto_474749 ) ) ( not ( = ?auto_474747 ?auto_474750 ) ) ( not ( = ?auto_474747 ?auto_474751 ) ) ( not ( = ?auto_474747 ?auto_474752 ) ) ( not ( = ?auto_474747 ?auto_474753 ) ) ( not ( = ?auto_474747 ?auto_474754 ) ) ( not ( = ?auto_474747 ?auto_474755 ) ) ( not ( = ?auto_474747 ?auto_474756 ) ) ( not ( = ?auto_474747 ?auto_474757 ) ) ( not ( = ?auto_474748 ?auto_474749 ) ) ( not ( = ?auto_474748 ?auto_474750 ) ) ( not ( = ?auto_474748 ?auto_474751 ) ) ( not ( = ?auto_474748 ?auto_474752 ) ) ( not ( = ?auto_474748 ?auto_474753 ) ) ( not ( = ?auto_474748 ?auto_474754 ) ) ( not ( = ?auto_474748 ?auto_474755 ) ) ( not ( = ?auto_474748 ?auto_474756 ) ) ( not ( = ?auto_474748 ?auto_474757 ) ) ( not ( = ?auto_474749 ?auto_474750 ) ) ( not ( = ?auto_474749 ?auto_474751 ) ) ( not ( = ?auto_474749 ?auto_474752 ) ) ( not ( = ?auto_474749 ?auto_474753 ) ) ( not ( = ?auto_474749 ?auto_474754 ) ) ( not ( = ?auto_474749 ?auto_474755 ) ) ( not ( = ?auto_474749 ?auto_474756 ) ) ( not ( = ?auto_474749 ?auto_474757 ) ) ( not ( = ?auto_474750 ?auto_474751 ) ) ( not ( = ?auto_474750 ?auto_474752 ) ) ( not ( = ?auto_474750 ?auto_474753 ) ) ( not ( = ?auto_474750 ?auto_474754 ) ) ( not ( = ?auto_474750 ?auto_474755 ) ) ( not ( = ?auto_474750 ?auto_474756 ) ) ( not ( = ?auto_474750 ?auto_474757 ) ) ( not ( = ?auto_474751 ?auto_474752 ) ) ( not ( = ?auto_474751 ?auto_474753 ) ) ( not ( = ?auto_474751 ?auto_474754 ) ) ( not ( = ?auto_474751 ?auto_474755 ) ) ( not ( = ?auto_474751 ?auto_474756 ) ) ( not ( = ?auto_474751 ?auto_474757 ) ) ( not ( = ?auto_474752 ?auto_474753 ) ) ( not ( = ?auto_474752 ?auto_474754 ) ) ( not ( = ?auto_474752 ?auto_474755 ) ) ( not ( = ?auto_474752 ?auto_474756 ) ) ( not ( = ?auto_474752 ?auto_474757 ) ) ( not ( = ?auto_474753 ?auto_474754 ) ) ( not ( = ?auto_474753 ?auto_474755 ) ) ( not ( = ?auto_474753 ?auto_474756 ) ) ( not ( = ?auto_474753 ?auto_474757 ) ) ( not ( = ?auto_474754 ?auto_474755 ) ) ( not ( = ?auto_474754 ?auto_474756 ) ) ( not ( = ?auto_474754 ?auto_474757 ) ) ( not ( = ?auto_474755 ?auto_474756 ) ) ( not ( = ?auto_474755 ?auto_474757 ) ) ( not ( = ?auto_474756 ?auto_474757 ) ) ( CLEAR ?auto_474754 ) ( ON ?auto_474755 ?auto_474756 ) ( CLEAR ?auto_474755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_474743 ?auto_474744 ?auto_474745 ?auto_474746 ?auto_474747 ?auto_474748 ?auto_474749 ?auto_474750 ?auto_474751 ?auto_474752 ?auto_474753 ?auto_474754 ?auto_474755 )
      ( MAKE-14PILE ?auto_474743 ?auto_474744 ?auto_474745 ?auto_474746 ?auto_474747 ?auto_474748 ?auto_474749 ?auto_474750 ?auto_474751 ?auto_474752 ?auto_474753 ?auto_474754 ?auto_474755 ?auto_474756 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_474801 - BLOCK
      ?auto_474802 - BLOCK
      ?auto_474803 - BLOCK
      ?auto_474804 - BLOCK
      ?auto_474805 - BLOCK
      ?auto_474806 - BLOCK
      ?auto_474807 - BLOCK
      ?auto_474808 - BLOCK
      ?auto_474809 - BLOCK
      ?auto_474810 - BLOCK
      ?auto_474811 - BLOCK
      ?auto_474812 - BLOCK
      ?auto_474813 - BLOCK
      ?auto_474814 - BLOCK
    )
    :vars
    (
      ?auto_474815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474814 ?auto_474815 ) ( ON-TABLE ?auto_474801 ) ( ON ?auto_474802 ?auto_474801 ) ( ON ?auto_474803 ?auto_474802 ) ( ON ?auto_474804 ?auto_474803 ) ( ON ?auto_474805 ?auto_474804 ) ( ON ?auto_474806 ?auto_474805 ) ( ON ?auto_474807 ?auto_474806 ) ( ON ?auto_474808 ?auto_474807 ) ( ON ?auto_474809 ?auto_474808 ) ( ON ?auto_474810 ?auto_474809 ) ( ON ?auto_474811 ?auto_474810 ) ( not ( = ?auto_474801 ?auto_474802 ) ) ( not ( = ?auto_474801 ?auto_474803 ) ) ( not ( = ?auto_474801 ?auto_474804 ) ) ( not ( = ?auto_474801 ?auto_474805 ) ) ( not ( = ?auto_474801 ?auto_474806 ) ) ( not ( = ?auto_474801 ?auto_474807 ) ) ( not ( = ?auto_474801 ?auto_474808 ) ) ( not ( = ?auto_474801 ?auto_474809 ) ) ( not ( = ?auto_474801 ?auto_474810 ) ) ( not ( = ?auto_474801 ?auto_474811 ) ) ( not ( = ?auto_474801 ?auto_474812 ) ) ( not ( = ?auto_474801 ?auto_474813 ) ) ( not ( = ?auto_474801 ?auto_474814 ) ) ( not ( = ?auto_474801 ?auto_474815 ) ) ( not ( = ?auto_474802 ?auto_474803 ) ) ( not ( = ?auto_474802 ?auto_474804 ) ) ( not ( = ?auto_474802 ?auto_474805 ) ) ( not ( = ?auto_474802 ?auto_474806 ) ) ( not ( = ?auto_474802 ?auto_474807 ) ) ( not ( = ?auto_474802 ?auto_474808 ) ) ( not ( = ?auto_474802 ?auto_474809 ) ) ( not ( = ?auto_474802 ?auto_474810 ) ) ( not ( = ?auto_474802 ?auto_474811 ) ) ( not ( = ?auto_474802 ?auto_474812 ) ) ( not ( = ?auto_474802 ?auto_474813 ) ) ( not ( = ?auto_474802 ?auto_474814 ) ) ( not ( = ?auto_474802 ?auto_474815 ) ) ( not ( = ?auto_474803 ?auto_474804 ) ) ( not ( = ?auto_474803 ?auto_474805 ) ) ( not ( = ?auto_474803 ?auto_474806 ) ) ( not ( = ?auto_474803 ?auto_474807 ) ) ( not ( = ?auto_474803 ?auto_474808 ) ) ( not ( = ?auto_474803 ?auto_474809 ) ) ( not ( = ?auto_474803 ?auto_474810 ) ) ( not ( = ?auto_474803 ?auto_474811 ) ) ( not ( = ?auto_474803 ?auto_474812 ) ) ( not ( = ?auto_474803 ?auto_474813 ) ) ( not ( = ?auto_474803 ?auto_474814 ) ) ( not ( = ?auto_474803 ?auto_474815 ) ) ( not ( = ?auto_474804 ?auto_474805 ) ) ( not ( = ?auto_474804 ?auto_474806 ) ) ( not ( = ?auto_474804 ?auto_474807 ) ) ( not ( = ?auto_474804 ?auto_474808 ) ) ( not ( = ?auto_474804 ?auto_474809 ) ) ( not ( = ?auto_474804 ?auto_474810 ) ) ( not ( = ?auto_474804 ?auto_474811 ) ) ( not ( = ?auto_474804 ?auto_474812 ) ) ( not ( = ?auto_474804 ?auto_474813 ) ) ( not ( = ?auto_474804 ?auto_474814 ) ) ( not ( = ?auto_474804 ?auto_474815 ) ) ( not ( = ?auto_474805 ?auto_474806 ) ) ( not ( = ?auto_474805 ?auto_474807 ) ) ( not ( = ?auto_474805 ?auto_474808 ) ) ( not ( = ?auto_474805 ?auto_474809 ) ) ( not ( = ?auto_474805 ?auto_474810 ) ) ( not ( = ?auto_474805 ?auto_474811 ) ) ( not ( = ?auto_474805 ?auto_474812 ) ) ( not ( = ?auto_474805 ?auto_474813 ) ) ( not ( = ?auto_474805 ?auto_474814 ) ) ( not ( = ?auto_474805 ?auto_474815 ) ) ( not ( = ?auto_474806 ?auto_474807 ) ) ( not ( = ?auto_474806 ?auto_474808 ) ) ( not ( = ?auto_474806 ?auto_474809 ) ) ( not ( = ?auto_474806 ?auto_474810 ) ) ( not ( = ?auto_474806 ?auto_474811 ) ) ( not ( = ?auto_474806 ?auto_474812 ) ) ( not ( = ?auto_474806 ?auto_474813 ) ) ( not ( = ?auto_474806 ?auto_474814 ) ) ( not ( = ?auto_474806 ?auto_474815 ) ) ( not ( = ?auto_474807 ?auto_474808 ) ) ( not ( = ?auto_474807 ?auto_474809 ) ) ( not ( = ?auto_474807 ?auto_474810 ) ) ( not ( = ?auto_474807 ?auto_474811 ) ) ( not ( = ?auto_474807 ?auto_474812 ) ) ( not ( = ?auto_474807 ?auto_474813 ) ) ( not ( = ?auto_474807 ?auto_474814 ) ) ( not ( = ?auto_474807 ?auto_474815 ) ) ( not ( = ?auto_474808 ?auto_474809 ) ) ( not ( = ?auto_474808 ?auto_474810 ) ) ( not ( = ?auto_474808 ?auto_474811 ) ) ( not ( = ?auto_474808 ?auto_474812 ) ) ( not ( = ?auto_474808 ?auto_474813 ) ) ( not ( = ?auto_474808 ?auto_474814 ) ) ( not ( = ?auto_474808 ?auto_474815 ) ) ( not ( = ?auto_474809 ?auto_474810 ) ) ( not ( = ?auto_474809 ?auto_474811 ) ) ( not ( = ?auto_474809 ?auto_474812 ) ) ( not ( = ?auto_474809 ?auto_474813 ) ) ( not ( = ?auto_474809 ?auto_474814 ) ) ( not ( = ?auto_474809 ?auto_474815 ) ) ( not ( = ?auto_474810 ?auto_474811 ) ) ( not ( = ?auto_474810 ?auto_474812 ) ) ( not ( = ?auto_474810 ?auto_474813 ) ) ( not ( = ?auto_474810 ?auto_474814 ) ) ( not ( = ?auto_474810 ?auto_474815 ) ) ( not ( = ?auto_474811 ?auto_474812 ) ) ( not ( = ?auto_474811 ?auto_474813 ) ) ( not ( = ?auto_474811 ?auto_474814 ) ) ( not ( = ?auto_474811 ?auto_474815 ) ) ( not ( = ?auto_474812 ?auto_474813 ) ) ( not ( = ?auto_474812 ?auto_474814 ) ) ( not ( = ?auto_474812 ?auto_474815 ) ) ( not ( = ?auto_474813 ?auto_474814 ) ) ( not ( = ?auto_474813 ?auto_474815 ) ) ( not ( = ?auto_474814 ?auto_474815 ) ) ( ON ?auto_474813 ?auto_474814 ) ( CLEAR ?auto_474811 ) ( ON ?auto_474812 ?auto_474813 ) ( CLEAR ?auto_474812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_474801 ?auto_474802 ?auto_474803 ?auto_474804 ?auto_474805 ?auto_474806 ?auto_474807 ?auto_474808 ?auto_474809 ?auto_474810 ?auto_474811 ?auto_474812 )
      ( MAKE-14PILE ?auto_474801 ?auto_474802 ?auto_474803 ?auto_474804 ?auto_474805 ?auto_474806 ?auto_474807 ?auto_474808 ?auto_474809 ?auto_474810 ?auto_474811 ?auto_474812 ?auto_474813 ?auto_474814 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_474859 - BLOCK
      ?auto_474860 - BLOCK
      ?auto_474861 - BLOCK
      ?auto_474862 - BLOCK
      ?auto_474863 - BLOCK
      ?auto_474864 - BLOCK
      ?auto_474865 - BLOCK
      ?auto_474866 - BLOCK
      ?auto_474867 - BLOCK
      ?auto_474868 - BLOCK
      ?auto_474869 - BLOCK
      ?auto_474870 - BLOCK
      ?auto_474871 - BLOCK
      ?auto_474872 - BLOCK
    )
    :vars
    (
      ?auto_474873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474872 ?auto_474873 ) ( ON-TABLE ?auto_474859 ) ( ON ?auto_474860 ?auto_474859 ) ( ON ?auto_474861 ?auto_474860 ) ( ON ?auto_474862 ?auto_474861 ) ( ON ?auto_474863 ?auto_474862 ) ( ON ?auto_474864 ?auto_474863 ) ( ON ?auto_474865 ?auto_474864 ) ( ON ?auto_474866 ?auto_474865 ) ( ON ?auto_474867 ?auto_474866 ) ( ON ?auto_474868 ?auto_474867 ) ( not ( = ?auto_474859 ?auto_474860 ) ) ( not ( = ?auto_474859 ?auto_474861 ) ) ( not ( = ?auto_474859 ?auto_474862 ) ) ( not ( = ?auto_474859 ?auto_474863 ) ) ( not ( = ?auto_474859 ?auto_474864 ) ) ( not ( = ?auto_474859 ?auto_474865 ) ) ( not ( = ?auto_474859 ?auto_474866 ) ) ( not ( = ?auto_474859 ?auto_474867 ) ) ( not ( = ?auto_474859 ?auto_474868 ) ) ( not ( = ?auto_474859 ?auto_474869 ) ) ( not ( = ?auto_474859 ?auto_474870 ) ) ( not ( = ?auto_474859 ?auto_474871 ) ) ( not ( = ?auto_474859 ?auto_474872 ) ) ( not ( = ?auto_474859 ?auto_474873 ) ) ( not ( = ?auto_474860 ?auto_474861 ) ) ( not ( = ?auto_474860 ?auto_474862 ) ) ( not ( = ?auto_474860 ?auto_474863 ) ) ( not ( = ?auto_474860 ?auto_474864 ) ) ( not ( = ?auto_474860 ?auto_474865 ) ) ( not ( = ?auto_474860 ?auto_474866 ) ) ( not ( = ?auto_474860 ?auto_474867 ) ) ( not ( = ?auto_474860 ?auto_474868 ) ) ( not ( = ?auto_474860 ?auto_474869 ) ) ( not ( = ?auto_474860 ?auto_474870 ) ) ( not ( = ?auto_474860 ?auto_474871 ) ) ( not ( = ?auto_474860 ?auto_474872 ) ) ( not ( = ?auto_474860 ?auto_474873 ) ) ( not ( = ?auto_474861 ?auto_474862 ) ) ( not ( = ?auto_474861 ?auto_474863 ) ) ( not ( = ?auto_474861 ?auto_474864 ) ) ( not ( = ?auto_474861 ?auto_474865 ) ) ( not ( = ?auto_474861 ?auto_474866 ) ) ( not ( = ?auto_474861 ?auto_474867 ) ) ( not ( = ?auto_474861 ?auto_474868 ) ) ( not ( = ?auto_474861 ?auto_474869 ) ) ( not ( = ?auto_474861 ?auto_474870 ) ) ( not ( = ?auto_474861 ?auto_474871 ) ) ( not ( = ?auto_474861 ?auto_474872 ) ) ( not ( = ?auto_474861 ?auto_474873 ) ) ( not ( = ?auto_474862 ?auto_474863 ) ) ( not ( = ?auto_474862 ?auto_474864 ) ) ( not ( = ?auto_474862 ?auto_474865 ) ) ( not ( = ?auto_474862 ?auto_474866 ) ) ( not ( = ?auto_474862 ?auto_474867 ) ) ( not ( = ?auto_474862 ?auto_474868 ) ) ( not ( = ?auto_474862 ?auto_474869 ) ) ( not ( = ?auto_474862 ?auto_474870 ) ) ( not ( = ?auto_474862 ?auto_474871 ) ) ( not ( = ?auto_474862 ?auto_474872 ) ) ( not ( = ?auto_474862 ?auto_474873 ) ) ( not ( = ?auto_474863 ?auto_474864 ) ) ( not ( = ?auto_474863 ?auto_474865 ) ) ( not ( = ?auto_474863 ?auto_474866 ) ) ( not ( = ?auto_474863 ?auto_474867 ) ) ( not ( = ?auto_474863 ?auto_474868 ) ) ( not ( = ?auto_474863 ?auto_474869 ) ) ( not ( = ?auto_474863 ?auto_474870 ) ) ( not ( = ?auto_474863 ?auto_474871 ) ) ( not ( = ?auto_474863 ?auto_474872 ) ) ( not ( = ?auto_474863 ?auto_474873 ) ) ( not ( = ?auto_474864 ?auto_474865 ) ) ( not ( = ?auto_474864 ?auto_474866 ) ) ( not ( = ?auto_474864 ?auto_474867 ) ) ( not ( = ?auto_474864 ?auto_474868 ) ) ( not ( = ?auto_474864 ?auto_474869 ) ) ( not ( = ?auto_474864 ?auto_474870 ) ) ( not ( = ?auto_474864 ?auto_474871 ) ) ( not ( = ?auto_474864 ?auto_474872 ) ) ( not ( = ?auto_474864 ?auto_474873 ) ) ( not ( = ?auto_474865 ?auto_474866 ) ) ( not ( = ?auto_474865 ?auto_474867 ) ) ( not ( = ?auto_474865 ?auto_474868 ) ) ( not ( = ?auto_474865 ?auto_474869 ) ) ( not ( = ?auto_474865 ?auto_474870 ) ) ( not ( = ?auto_474865 ?auto_474871 ) ) ( not ( = ?auto_474865 ?auto_474872 ) ) ( not ( = ?auto_474865 ?auto_474873 ) ) ( not ( = ?auto_474866 ?auto_474867 ) ) ( not ( = ?auto_474866 ?auto_474868 ) ) ( not ( = ?auto_474866 ?auto_474869 ) ) ( not ( = ?auto_474866 ?auto_474870 ) ) ( not ( = ?auto_474866 ?auto_474871 ) ) ( not ( = ?auto_474866 ?auto_474872 ) ) ( not ( = ?auto_474866 ?auto_474873 ) ) ( not ( = ?auto_474867 ?auto_474868 ) ) ( not ( = ?auto_474867 ?auto_474869 ) ) ( not ( = ?auto_474867 ?auto_474870 ) ) ( not ( = ?auto_474867 ?auto_474871 ) ) ( not ( = ?auto_474867 ?auto_474872 ) ) ( not ( = ?auto_474867 ?auto_474873 ) ) ( not ( = ?auto_474868 ?auto_474869 ) ) ( not ( = ?auto_474868 ?auto_474870 ) ) ( not ( = ?auto_474868 ?auto_474871 ) ) ( not ( = ?auto_474868 ?auto_474872 ) ) ( not ( = ?auto_474868 ?auto_474873 ) ) ( not ( = ?auto_474869 ?auto_474870 ) ) ( not ( = ?auto_474869 ?auto_474871 ) ) ( not ( = ?auto_474869 ?auto_474872 ) ) ( not ( = ?auto_474869 ?auto_474873 ) ) ( not ( = ?auto_474870 ?auto_474871 ) ) ( not ( = ?auto_474870 ?auto_474872 ) ) ( not ( = ?auto_474870 ?auto_474873 ) ) ( not ( = ?auto_474871 ?auto_474872 ) ) ( not ( = ?auto_474871 ?auto_474873 ) ) ( not ( = ?auto_474872 ?auto_474873 ) ) ( ON ?auto_474871 ?auto_474872 ) ( ON ?auto_474870 ?auto_474871 ) ( CLEAR ?auto_474868 ) ( ON ?auto_474869 ?auto_474870 ) ( CLEAR ?auto_474869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_474859 ?auto_474860 ?auto_474861 ?auto_474862 ?auto_474863 ?auto_474864 ?auto_474865 ?auto_474866 ?auto_474867 ?auto_474868 ?auto_474869 )
      ( MAKE-14PILE ?auto_474859 ?auto_474860 ?auto_474861 ?auto_474862 ?auto_474863 ?auto_474864 ?auto_474865 ?auto_474866 ?auto_474867 ?auto_474868 ?auto_474869 ?auto_474870 ?auto_474871 ?auto_474872 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_474917 - BLOCK
      ?auto_474918 - BLOCK
      ?auto_474919 - BLOCK
      ?auto_474920 - BLOCK
      ?auto_474921 - BLOCK
      ?auto_474922 - BLOCK
      ?auto_474923 - BLOCK
      ?auto_474924 - BLOCK
      ?auto_474925 - BLOCK
      ?auto_474926 - BLOCK
      ?auto_474927 - BLOCK
      ?auto_474928 - BLOCK
      ?auto_474929 - BLOCK
      ?auto_474930 - BLOCK
    )
    :vars
    (
      ?auto_474931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474930 ?auto_474931 ) ( ON-TABLE ?auto_474917 ) ( ON ?auto_474918 ?auto_474917 ) ( ON ?auto_474919 ?auto_474918 ) ( ON ?auto_474920 ?auto_474919 ) ( ON ?auto_474921 ?auto_474920 ) ( ON ?auto_474922 ?auto_474921 ) ( ON ?auto_474923 ?auto_474922 ) ( ON ?auto_474924 ?auto_474923 ) ( ON ?auto_474925 ?auto_474924 ) ( not ( = ?auto_474917 ?auto_474918 ) ) ( not ( = ?auto_474917 ?auto_474919 ) ) ( not ( = ?auto_474917 ?auto_474920 ) ) ( not ( = ?auto_474917 ?auto_474921 ) ) ( not ( = ?auto_474917 ?auto_474922 ) ) ( not ( = ?auto_474917 ?auto_474923 ) ) ( not ( = ?auto_474917 ?auto_474924 ) ) ( not ( = ?auto_474917 ?auto_474925 ) ) ( not ( = ?auto_474917 ?auto_474926 ) ) ( not ( = ?auto_474917 ?auto_474927 ) ) ( not ( = ?auto_474917 ?auto_474928 ) ) ( not ( = ?auto_474917 ?auto_474929 ) ) ( not ( = ?auto_474917 ?auto_474930 ) ) ( not ( = ?auto_474917 ?auto_474931 ) ) ( not ( = ?auto_474918 ?auto_474919 ) ) ( not ( = ?auto_474918 ?auto_474920 ) ) ( not ( = ?auto_474918 ?auto_474921 ) ) ( not ( = ?auto_474918 ?auto_474922 ) ) ( not ( = ?auto_474918 ?auto_474923 ) ) ( not ( = ?auto_474918 ?auto_474924 ) ) ( not ( = ?auto_474918 ?auto_474925 ) ) ( not ( = ?auto_474918 ?auto_474926 ) ) ( not ( = ?auto_474918 ?auto_474927 ) ) ( not ( = ?auto_474918 ?auto_474928 ) ) ( not ( = ?auto_474918 ?auto_474929 ) ) ( not ( = ?auto_474918 ?auto_474930 ) ) ( not ( = ?auto_474918 ?auto_474931 ) ) ( not ( = ?auto_474919 ?auto_474920 ) ) ( not ( = ?auto_474919 ?auto_474921 ) ) ( not ( = ?auto_474919 ?auto_474922 ) ) ( not ( = ?auto_474919 ?auto_474923 ) ) ( not ( = ?auto_474919 ?auto_474924 ) ) ( not ( = ?auto_474919 ?auto_474925 ) ) ( not ( = ?auto_474919 ?auto_474926 ) ) ( not ( = ?auto_474919 ?auto_474927 ) ) ( not ( = ?auto_474919 ?auto_474928 ) ) ( not ( = ?auto_474919 ?auto_474929 ) ) ( not ( = ?auto_474919 ?auto_474930 ) ) ( not ( = ?auto_474919 ?auto_474931 ) ) ( not ( = ?auto_474920 ?auto_474921 ) ) ( not ( = ?auto_474920 ?auto_474922 ) ) ( not ( = ?auto_474920 ?auto_474923 ) ) ( not ( = ?auto_474920 ?auto_474924 ) ) ( not ( = ?auto_474920 ?auto_474925 ) ) ( not ( = ?auto_474920 ?auto_474926 ) ) ( not ( = ?auto_474920 ?auto_474927 ) ) ( not ( = ?auto_474920 ?auto_474928 ) ) ( not ( = ?auto_474920 ?auto_474929 ) ) ( not ( = ?auto_474920 ?auto_474930 ) ) ( not ( = ?auto_474920 ?auto_474931 ) ) ( not ( = ?auto_474921 ?auto_474922 ) ) ( not ( = ?auto_474921 ?auto_474923 ) ) ( not ( = ?auto_474921 ?auto_474924 ) ) ( not ( = ?auto_474921 ?auto_474925 ) ) ( not ( = ?auto_474921 ?auto_474926 ) ) ( not ( = ?auto_474921 ?auto_474927 ) ) ( not ( = ?auto_474921 ?auto_474928 ) ) ( not ( = ?auto_474921 ?auto_474929 ) ) ( not ( = ?auto_474921 ?auto_474930 ) ) ( not ( = ?auto_474921 ?auto_474931 ) ) ( not ( = ?auto_474922 ?auto_474923 ) ) ( not ( = ?auto_474922 ?auto_474924 ) ) ( not ( = ?auto_474922 ?auto_474925 ) ) ( not ( = ?auto_474922 ?auto_474926 ) ) ( not ( = ?auto_474922 ?auto_474927 ) ) ( not ( = ?auto_474922 ?auto_474928 ) ) ( not ( = ?auto_474922 ?auto_474929 ) ) ( not ( = ?auto_474922 ?auto_474930 ) ) ( not ( = ?auto_474922 ?auto_474931 ) ) ( not ( = ?auto_474923 ?auto_474924 ) ) ( not ( = ?auto_474923 ?auto_474925 ) ) ( not ( = ?auto_474923 ?auto_474926 ) ) ( not ( = ?auto_474923 ?auto_474927 ) ) ( not ( = ?auto_474923 ?auto_474928 ) ) ( not ( = ?auto_474923 ?auto_474929 ) ) ( not ( = ?auto_474923 ?auto_474930 ) ) ( not ( = ?auto_474923 ?auto_474931 ) ) ( not ( = ?auto_474924 ?auto_474925 ) ) ( not ( = ?auto_474924 ?auto_474926 ) ) ( not ( = ?auto_474924 ?auto_474927 ) ) ( not ( = ?auto_474924 ?auto_474928 ) ) ( not ( = ?auto_474924 ?auto_474929 ) ) ( not ( = ?auto_474924 ?auto_474930 ) ) ( not ( = ?auto_474924 ?auto_474931 ) ) ( not ( = ?auto_474925 ?auto_474926 ) ) ( not ( = ?auto_474925 ?auto_474927 ) ) ( not ( = ?auto_474925 ?auto_474928 ) ) ( not ( = ?auto_474925 ?auto_474929 ) ) ( not ( = ?auto_474925 ?auto_474930 ) ) ( not ( = ?auto_474925 ?auto_474931 ) ) ( not ( = ?auto_474926 ?auto_474927 ) ) ( not ( = ?auto_474926 ?auto_474928 ) ) ( not ( = ?auto_474926 ?auto_474929 ) ) ( not ( = ?auto_474926 ?auto_474930 ) ) ( not ( = ?auto_474926 ?auto_474931 ) ) ( not ( = ?auto_474927 ?auto_474928 ) ) ( not ( = ?auto_474927 ?auto_474929 ) ) ( not ( = ?auto_474927 ?auto_474930 ) ) ( not ( = ?auto_474927 ?auto_474931 ) ) ( not ( = ?auto_474928 ?auto_474929 ) ) ( not ( = ?auto_474928 ?auto_474930 ) ) ( not ( = ?auto_474928 ?auto_474931 ) ) ( not ( = ?auto_474929 ?auto_474930 ) ) ( not ( = ?auto_474929 ?auto_474931 ) ) ( not ( = ?auto_474930 ?auto_474931 ) ) ( ON ?auto_474929 ?auto_474930 ) ( ON ?auto_474928 ?auto_474929 ) ( ON ?auto_474927 ?auto_474928 ) ( CLEAR ?auto_474925 ) ( ON ?auto_474926 ?auto_474927 ) ( CLEAR ?auto_474926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_474917 ?auto_474918 ?auto_474919 ?auto_474920 ?auto_474921 ?auto_474922 ?auto_474923 ?auto_474924 ?auto_474925 ?auto_474926 )
      ( MAKE-14PILE ?auto_474917 ?auto_474918 ?auto_474919 ?auto_474920 ?auto_474921 ?auto_474922 ?auto_474923 ?auto_474924 ?auto_474925 ?auto_474926 ?auto_474927 ?auto_474928 ?auto_474929 ?auto_474930 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_474975 - BLOCK
      ?auto_474976 - BLOCK
      ?auto_474977 - BLOCK
      ?auto_474978 - BLOCK
      ?auto_474979 - BLOCK
      ?auto_474980 - BLOCK
      ?auto_474981 - BLOCK
      ?auto_474982 - BLOCK
      ?auto_474983 - BLOCK
      ?auto_474984 - BLOCK
      ?auto_474985 - BLOCK
      ?auto_474986 - BLOCK
      ?auto_474987 - BLOCK
      ?auto_474988 - BLOCK
    )
    :vars
    (
      ?auto_474989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_474988 ?auto_474989 ) ( ON-TABLE ?auto_474975 ) ( ON ?auto_474976 ?auto_474975 ) ( ON ?auto_474977 ?auto_474976 ) ( ON ?auto_474978 ?auto_474977 ) ( ON ?auto_474979 ?auto_474978 ) ( ON ?auto_474980 ?auto_474979 ) ( ON ?auto_474981 ?auto_474980 ) ( ON ?auto_474982 ?auto_474981 ) ( not ( = ?auto_474975 ?auto_474976 ) ) ( not ( = ?auto_474975 ?auto_474977 ) ) ( not ( = ?auto_474975 ?auto_474978 ) ) ( not ( = ?auto_474975 ?auto_474979 ) ) ( not ( = ?auto_474975 ?auto_474980 ) ) ( not ( = ?auto_474975 ?auto_474981 ) ) ( not ( = ?auto_474975 ?auto_474982 ) ) ( not ( = ?auto_474975 ?auto_474983 ) ) ( not ( = ?auto_474975 ?auto_474984 ) ) ( not ( = ?auto_474975 ?auto_474985 ) ) ( not ( = ?auto_474975 ?auto_474986 ) ) ( not ( = ?auto_474975 ?auto_474987 ) ) ( not ( = ?auto_474975 ?auto_474988 ) ) ( not ( = ?auto_474975 ?auto_474989 ) ) ( not ( = ?auto_474976 ?auto_474977 ) ) ( not ( = ?auto_474976 ?auto_474978 ) ) ( not ( = ?auto_474976 ?auto_474979 ) ) ( not ( = ?auto_474976 ?auto_474980 ) ) ( not ( = ?auto_474976 ?auto_474981 ) ) ( not ( = ?auto_474976 ?auto_474982 ) ) ( not ( = ?auto_474976 ?auto_474983 ) ) ( not ( = ?auto_474976 ?auto_474984 ) ) ( not ( = ?auto_474976 ?auto_474985 ) ) ( not ( = ?auto_474976 ?auto_474986 ) ) ( not ( = ?auto_474976 ?auto_474987 ) ) ( not ( = ?auto_474976 ?auto_474988 ) ) ( not ( = ?auto_474976 ?auto_474989 ) ) ( not ( = ?auto_474977 ?auto_474978 ) ) ( not ( = ?auto_474977 ?auto_474979 ) ) ( not ( = ?auto_474977 ?auto_474980 ) ) ( not ( = ?auto_474977 ?auto_474981 ) ) ( not ( = ?auto_474977 ?auto_474982 ) ) ( not ( = ?auto_474977 ?auto_474983 ) ) ( not ( = ?auto_474977 ?auto_474984 ) ) ( not ( = ?auto_474977 ?auto_474985 ) ) ( not ( = ?auto_474977 ?auto_474986 ) ) ( not ( = ?auto_474977 ?auto_474987 ) ) ( not ( = ?auto_474977 ?auto_474988 ) ) ( not ( = ?auto_474977 ?auto_474989 ) ) ( not ( = ?auto_474978 ?auto_474979 ) ) ( not ( = ?auto_474978 ?auto_474980 ) ) ( not ( = ?auto_474978 ?auto_474981 ) ) ( not ( = ?auto_474978 ?auto_474982 ) ) ( not ( = ?auto_474978 ?auto_474983 ) ) ( not ( = ?auto_474978 ?auto_474984 ) ) ( not ( = ?auto_474978 ?auto_474985 ) ) ( not ( = ?auto_474978 ?auto_474986 ) ) ( not ( = ?auto_474978 ?auto_474987 ) ) ( not ( = ?auto_474978 ?auto_474988 ) ) ( not ( = ?auto_474978 ?auto_474989 ) ) ( not ( = ?auto_474979 ?auto_474980 ) ) ( not ( = ?auto_474979 ?auto_474981 ) ) ( not ( = ?auto_474979 ?auto_474982 ) ) ( not ( = ?auto_474979 ?auto_474983 ) ) ( not ( = ?auto_474979 ?auto_474984 ) ) ( not ( = ?auto_474979 ?auto_474985 ) ) ( not ( = ?auto_474979 ?auto_474986 ) ) ( not ( = ?auto_474979 ?auto_474987 ) ) ( not ( = ?auto_474979 ?auto_474988 ) ) ( not ( = ?auto_474979 ?auto_474989 ) ) ( not ( = ?auto_474980 ?auto_474981 ) ) ( not ( = ?auto_474980 ?auto_474982 ) ) ( not ( = ?auto_474980 ?auto_474983 ) ) ( not ( = ?auto_474980 ?auto_474984 ) ) ( not ( = ?auto_474980 ?auto_474985 ) ) ( not ( = ?auto_474980 ?auto_474986 ) ) ( not ( = ?auto_474980 ?auto_474987 ) ) ( not ( = ?auto_474980 ?auto_474988 ) ) ( not ( = ?auto_474980 ?auto_474989 ) ) ( not ( = ?auto_474981 ?auto_474982 ) ) ( not ( = ?auto_474981 ?auto_474983 ) ) ( not ( = ?auto_474981 ?auto_474984 ) ) ( not ( = ?auto_474981 ?auto_474985 ) ) ( not ( = ?auto_474981 ?auto_474986 ) ) ( not ( = ?auto_474981 ?auto_474987 ) ) ( not ( = ?auto_474981 ?auto_474988 ) ) ( not ( = ?auto_474981 ?auto_474989 ) ) ( not ( = ?auto_474982 ?auto_474983 ) ) ( not ( = ?auto_474982 ?auto_474984 ) ) ( not ( = ?auto_474982 ?auto_474985 ) ) ( not ( = ?auto_474982 ?auto_474986 ) ) ( not ( = ?auto_474982 ?auto_474987 ) ) ( not ( = ?auto_474982 ?auto_474988 ) ) ( not ( = ?auto_474982 ?auto_474989 ) ) ( not ( = ?auto_474983 ?auto_474984 ) ) ( not ( = ?auto_474983 ?auto_474985 ) ) ( not ( = ?auto_474983 ?auto_474986 ) ) ( not ( = ?auto_474983 ?auto_474987 ) ) ( not ( = ?auto_474983 ?auto_474988 ) ) ( not ( = ?auto_474983 ?auto_474989 ) ) ( not ( = ?auto_474984 ?auto_474985 ) ) ( not ( = ?auto_474984 ?auto_474986 ) ) ( not ( = ?auto_474984 ?auto_474987 ) ) ( not ( = ?auto_474984 ?auto_474988 ) ) ( not ( = ?auto_474984 ?auto_474989 ) ) ( not ( = ?auto_474985 ?auto_474986 ) ) ( not ( = ?auto_474985 ?auto_474987 ) ) ( not ( = ?auto_474985 ?auto_474988 ) ) ( not ( = ?auto_474985 ?auto_474989 ) ) ( not ( = ?auto_474986 ?auto_474987 ) ) ( not ( = ?auto_474986 ?auto_474988 ) ) ( not ( = ?auto_474986 ?auto_474989 ) ) ( not ( = ?auto_474987 ?auto_474988 ) ) ( not ( = ?auto_474987 ?auto_474989 ) ) ( not ( = ?auto_474988 ?auto_474989 ) ) ( ON ?auto_474987 ?auto_474988 ) ( ON ?auto_474986 ?auto_474987 ) ( ON ?auto_474985 ?auto_474986 ) ( ON ?auto_474984 ?auto_474985 ) ( CLEAR ?auto_474982 ) ( ON ?auto_474983 ?auto_474984 ) ( CLEAR ?auto_474983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_474975 ?auto_474976 ?auto_474977 ?auto_474978 ?auto_474979 ?auto_474980 ?auto_474981 ?auto_474982 ?auto_474983 )
      ( MAKE-14PILE ?auto_474975 ?auto_474976 ?auto_474977 ?auto_474978 ?auto_474979 ?auto_474980 ?auto_474981 ?auto_474982 ?auto_474983 ?auto_474984 ?auto_474985 ?auto_474986 ?auto_474987 ?auto_474988 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475033 - BLOCK
      ?auto_475034 - BLOCK
      ?auto_475035 - BLOCK
      ?auto_475036 - BLOCK
      ?auto_475037 - BLOCK
      ?auto_475038 - BLOCK
      ?auto_475039 - BLOCK
      ?auto_475040 - BLOCK
      ?auto_475041 - BLOCK
      ?auto_475042 - BLOCK
      ?auto_475043 - BLOCK
      ?auto_475044 - BLOCK
      ?auto_475045 - BLOCK
      ?auto_475046 - BLOCK
    )
    :vars
    (
      ?auto_475047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475046 ?auto_475047 ) ( ON-TABLE ?auto_475033 ) ( ON ?auto_475034 ?auto_475033 ) ( ON ?auto_475035 ?auto_475034 ) ( ON ?auto_475036 ?auto_475035 ) ( ON ?auto_475037 ?auto_475036 ) ( ON ?auto_475038 ?auto_475037 ) ( ON ?auto_475039 ?auto_475038 ) ( not ( = ?auto_475033 ?auto_475034 ) ) ( not ( = ?auto_475033 ?auto_475035 ) ) ( not ( = ?auto_475033 ?auto_475036 ) ) ( not ( = ?auto_475033 ?auto_475037 ) ) ( not ( = ?auto_475033 ?auto_475038 ) ) ( not ( = ?auto_475033 ?auto_475039 ) ) ( not ( = ?auto_475033 ?auto_475040 ) ) ( not ( = ?auto_475033 ?auto_475041 ) ) ( not ( = ?auto_475033 ?auto_475042 ) ) ( not ( = ?auto_475033 ?auto_475043 ) ) ( not ( = ?auto_475033 ?auto_475044 ) ) ( not ( = ?auto_475033 ?auto_475045 ) ) ( not ( = ?auto_475033 ?auto_475046 ) ) ( not ( = ?auto_475033 ?auto_475047 ) ) ( not ( = ?auto_475034 ?auto_475035 ) ) ( not ( = ?auto_475034 ?auto_475036 ) ) ( not ( = ?auto_475034 ?auto_475037 ) ) ( not ( = ?auto_475034 ?auto_475038 ) ) ( not ( = ?auto_475034 ?auto_475039 ) ) ( not ( = ?auto_475034 ?auto_475040 ) ) ( not ( = ?auto_475034 ?auto_475041 ) ) ( not ( = ?auto_475034 ?auto_475042 ) ) ( not ( = ?auto_475034 ?auto_475043 ) ) ( not ( = ?auto_475034 ?auto_475044 ) ) ( not ( = ?auto_475034 ?auto_475045 ) ) ( not ( = ?auto_475034 ?auto_475046 ) ) ( not ( = ?auto_475034 ?auto_475047 ) ) ( not ( = ?auto_475035 ?auto_475036 ) ) ( not ( = ?auto_475035 ?auto_475037 ) ) ( not ( = ?auto_475035 ?auto_475038 ) ) ( not ( = ?auto_475035 ?auto_475039 ) ) ( not ( = ?auto_475035 ?auto_475040 ) ) ( not ( = ?auto_475035 ?auto_475041 ) ) ( not ( = ?auto_475035 ?auto_475042 ) ) ( not ( = ?auto_475035 ?auto_475043 ) ) ( not ( = ?auto_475035 ?auto_475044 ) ) ( not ( = ?auto_475035 ?auto_475045 ) ) ( not ( = ?auto_475035 ?auto_475046 ) ) ( not ( = ?auto_475035 ?auto_475047 ) ) ( not ( = ?auto_475036 ?auto_475037 ) ) ( not ( = ?auto_475036 ?auto_475038 ) ) ( not ( = ?auto_475036 ?auto_475039 ) ) ( not ( = ?auto_475036 ?auto_475040 ) ) ( not ( = ?auto_475036 ?auto_475041 ) ) ( not ( = ?auto_475036 ?auto_475042 ) ) ( not ( = ?auto_475036 ?auto_475043 ) ) ( not ( = ?auto_475036 ?auto_475044 ) ) ( not ( = ?auto_475036 ?auto_475045 ) ) ( not ( = ?auto_475036 ?auto_475046 ) ) ( not ( = ?auto_475036 ?auto_475047 ) ) ( not ( = ?auto_475037 ?auto_475038 ) ) ( not ( = ?auto_475037 ?auto_475039 ) ) ( not ( = ?auto_475037 ?auto_475040 ) ) ( not ( = ?auto_475037 ?auto_475041 ) ) ( not ( = ?auto_475037 ?auto_475042 ) ) ( not ( = ?auto_475037 ?auto_475043 ) ) ( not ( = ?auto_475037 ?auto_475044 ) ) ( not ( = ?auto_475037 ?auto_475045 ) ) ( not ( = ?auto_475037 ?auto_475046 ) ) ( not ( = ?auto_475037 ?auto_475047 ) ) ( not ( = ?auto_475038 ?auto_475039 ) ) ( not ( = ?auto_475038 ?auto_475040 ) ) ( not ( = ?auto_475038 ?auto_475041 ) ) ( not ( = ?auto_475038 ?auto_475042 ) ) ( not ( = ?auto_475038 ?auto_475043 ) ) ( not ( = ?auto_475038 ?auto_475044 ) ) ( not ( = ?auto_475038 ?auto_475045 ) ) ( not ( = ?auto_475038 ?auto_475046 ) ) ( not ( = ?auto_475038 ?auto_475047 ) ) ( not ( = ?auto_475039 ?auto_475040 ) ) ( not ( = ?auto_475039 ?auto_475041 ) ) ( not ( = ?auto_475039 ?auto_475042 ) ) ( not ( = ?auto_475039 ?auto_475043 ) ) ( not ( = ?auto_475039 ?auto_475044 ) ) ( not ( = ?auto_475039 ?auto_475045 ) ) ( not ( = ?auto_475039 ?auto_475046 ) ) ( not ( = ?auto_475039 ?auto_475047 ) ) ( not ( = ?auto_475040 ?auto_475041 ) ) ( not ( = ?auto_475040 ?auto_475042 ) ) ( not ( = ?auto_475040 ?auto_475043 ) ) ( not ( = ?auto_475040 ?auto_475044 ) ) ( not ( = ?auto_475040 ?auto_475045 ) ) ( not ( = ?auto_475040 ?auto_475046 ) ) ( not ( = ?auto_475040 ?auto_475047 ) ) ( not ( = ?auto_475041 ?auto_475042 ) ) ( not ( = ?auto_475041 ?auto_475043 ) ) ( not ( = ?auto_475041 ?auto_475044 ) ) ( not ( = ?auto_475041 ?auto_475045 ) ) ( not ( = ?auto_475041 ?auto_475046 ) ) ( not ( = ?auto_475041 ?auto_475047 ) ) ( not ( = ?auto_475042 ?auto_475043 ) ) ( not ( = ?auto_475042 ?auto_475044 ) ) ( not ( = ?auto_475042 ?auto_475045 ) ) ( not ( = ?auto_475042 ?auto_475046 ) ) ( not ( = ?auto_475042 ?auto_475047 ) ) ( not ( = ?auto_475043 ?auto_475044 ) ) ( not ( = ?auto_475043 ?auto_475045 ) ) ( not ( = ?auto_475043 ?auto_475046 ) ) ( not ( = ?auto_475043 ?auto_475047 ) ) ( not ( = ?auto_475044 ?auto_475045 ) ) ( not ( = ?auto_475044 ?auto_475046 ) ) ( not ( = ?auto_475044 ?auto_475047 ) ) ( not ( = ?auto_475045 ?auto_475046 ) ) ( not ( = ?auto_475045 ?auto_475047 ) ) ( not ( = ?auto_475046 ?auto_475047 ) ) ( ON ?auto_475045 ?auto_475046 ) ( ON ?auto_475044 ?auto_475045 ) ( ON ?auto_475043 ?auto_475044 ) ( ON ?auto_475042 ?auto_475043 ) ( ON ?auto_475041 ?auto_475042 ) ( CLEAR ?auto_475039 ) ( ON ?auto_475040 ?auto_475041 ) ( CLEAR ?auto_475040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_475033 ?auto_475034 ?auto_475035 ?auto_475036 ?auto_475037 ?auto_475038 ?auto_475039 ?auto_475040 )
      ( MAKE-14PILE ?auto_475033 ?auto_475034 ?auto_475035 ?auto_475036 ?auto_475037 ?auto_475038 ?auto_475039 ?auto_475040 ?auto_475041 ?auto_475042 ?auto_475043 ?auto_475044 ?auto_475045 ?auto_475046 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475091 - BLOCK
      ?auto_475092 - BLOCK
      ?auto_475093 - BLOCK
      ?auto_475094 - BLOCK
      ?auto_475095 - BLOCK
      ?auto_475096 - BLOCK
      ?auto_475097 - BLOCK
      ?auto_475098 - BLOCK
      ?auto_475099 - BLOCK
      ?auto_475100 - BLOCK
      ?auto_475101 - BLOCK
      ?auto_475102 - BLOCK
      ?auto_475103 - BLOCK
      ?auto_475104 - BLOCK
    )
    :vars
    (
      ?auto_475105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475104 ?auto_475105 ) ( ON-TABLE ?auto_475091 ) ( ON ?auto_475092 ?auto_475091 ) ( ON ?auto_475093 ?auto_475092 ) ( ON ?auto_475094 ?auto_475093 ) ( ON ?auto_475095 ?auto_475094 ) ( ON ?auto_475096 ?auto_475095 ) ( not ( = ?auto_475091 ?auto_475092 ) ) ( not ( = ?auto_475091 ?auto_475093 ) ) ( not ( = ?auto_475091 ?auto_475094 ) ) ( not ( = ?auto_475091 ?auto_475095 ) ) ( not ( = ?auto_475091 ?auto_475096 ) ) ( not ( = ?auto_475091 ?auto_475097 ) ) ( not ( = ?auto_475091 ?auto_475098 ) ) ( not ( = ?auto_475091 ?auto_475099 ) ) ( not ( = ?auto_475091 ?auto_475100 ) ) ( not ( = ?auto_475091 ?auto_475101 ) ) ( not ( = ?auto_475091 ?auto_475102 ) ) ( not ( = ?auto_475091 ?auto_475103 ) ) ( not ( = ?auto_475091 ?auto_475104 ) ) ( not ( = ?auto_475091 ?auto_475105 ) ) ( not ( = ?auto_475092 ?auto_475093 ) ) ( not ( = ?auto_475092 ?auto_475094 ) ) ( not ( = ?auto_475092 ?auto_475095 ) ) ( not ( = ?auto_475092 ?auto_475096 ) ) ( not ( = ?auto_475092 ?auto_475097 ) ) ( not ( = ?auto_475092 ?auto_475098 ) ) ( not ( = ?auto_475092 ?auto_475099 ) ) ( not ( = ?auto_475092 ?auto_475100 ) ) ( not ( = ?auto_475092 ?auto_475101 ) ) ( not ( = ?auto_475092 ?auto_475102 ) ) ( not ( = ?auto_475092 ?auto_475103 ) ) ( not ( = ?auto_475092 ?auto_475104 ) ) ( not ( = ?auto_475092 ?auto_475105 ) ) ( not ( = ?auto_475093 ?auto_475094 ) ) ( not ( = ?auto_475093 ?auto_475095 ) ) ( not ( = ?auto_475093 ?auto_475096 ) ) ( not ( = ?auto_475093 ?auto_475097 ) ) ( not ( = ?auto_475093 ?auto_475098 ) ) ( not ( = ?auto_475093 ?auto_475099 ) ) ( not ( = ?auto_475093 ?auto_475100 ) ) ( not ( = ?auto_475093 ?auto_475101 ) ) ( not ( = ?auto_475093 ?auto_475102 ) ) ( not ( = ?auto_475093 ?auto_475103 ) ) ( not ( = ?auto_475093 ?auto_475104 ) ) ( not ( = ?auto_475093 ?auto_475105 ) ) ( not ( = ?auto_475094 ?auto_475095 ) ) ( not ( = ?auto_475094 ?auto_475096 ) ) ( not ( = ?auto_475094 ?auto_475097 ) ) ( not ( = ?auto_475094 ?auto_475098 ) ) ( not ( = ?auto_475094 ?auto_475099 ) ) ( not ( = ?auto_475094 ?auto_475100 ) ) ( not ( = ?auto_475094 ?auto_475101 ) ) ( not ( = ?auto_475094 ?auto_475102 ) ) ( not ( = ?auto_475094 ?auto_475103 ) ) ( not ( = ?auto_475094 ?auto_475104 ) ) ( not ( = ?auto_475094 ?auto_475105 ) ) ( not ( = ?auto_475095 ?auto_475096 ) ) ( not ( = ?auto_475095 ?auto_475097 ) ) ( not ( = ?auto_475095 ?auto_475098 ) ) ( not ( = ?auto_475095 ?auto_475099 ) ) ( not ( = ?auto_475095 ?auto_475100 ) ) ( not ( = ?auto_475095 ?auto_475101 ) ) ( not ( = ?auto_475095 ?auto_475102 ) ) ( not ( = ?auto_475095 ?auto_475103 ) ) ( not ( = ?auto_475095 ?auto_475104 ) ) ( not ( = ?auto_475095 ?auto_475105 ) ) ( not ( = ?auto_475096 ?auto_475097 ) ) ( not ( = ?auto_475096 ?auto_475098 ) ) ( not ( = ?auto_475096 ?auto_475099 ) ) ( not ( = ?auto_475096 ?auto_475100 ) ) ( not ( = ?auto_475096 ?auto_475101 ) ) ( not ( = ?auto_475096 ?auto_475102 ) ) ( not ( = ?auto_475096 ?auto_475103 ) ) ( not ( = ?auto_475096 ?auto_475104 ) ) ( not ( = ?auto_475096 ?auto_475105 ) ) ( not ( = ?auto_475097 ?auto_475098 ) ) ( not ( = ?auto_475097 ?auto_475099 ) ) ( not ( = ?auto_475097 ?auto_475100 ) ) ( not ( = ?auto_475097 ?auto_475101 ) ) ( not ( = ?auto_475097 ?auto_475102 ) ) ( not ( = ?auto_475097 ?auto_475103 ) ) ( not ( = ?auto_475097 ?auto_475104 ) ) ( not ( = ?auto_475097 ?auto_475105 ) ) ( not ( = ?auto_475098 ?auto_475099 ) ) ( not ( = ?auto_475098 ?auto_475100 ) ) ( not ( = ?auto_475098 ?auto_475101 ) ) ( not ( = ?auto_475098 ?auto_475102 ) ) ( not ( = ?auto_475098 ?auto_475103 ) ) ( not ( = ?auto_475098 ?auto_475104 ) ) ( not ( = ?auto_475098 ?auto_475105 ) ) ( not ( = ?auto_475099 ?auto_475100 ) ) ( not ( = ?auto_475099 ?auto_475101 ) ) ( not ( = ?auto_475099 ?auto_475102 ) ) ( not ( = ?auto_475099 ?auto_475103 ) ) ( not ( = ?auto_475099 ?auto_475104 ) ) ( not ( = ?auto_475099 ?auto_475105 ) ) ( not ( = ?auto_475100 ?auto_475101 ) ) ( not ( = ?auto_475100 ?auto_475102 ) ) ( not ( = ?auto_475100 ?auto_475103 ) ) ( not ( = ?auto_475100 ?auto_475104 ) ) ( not ( = ?auto_475100 ?auto_475105 ) ) ( not ( = ?auto_475101 ?auto_475102 ) ) ( not ( = ?auto_475101 ?auto_475103 ) ) ( not ( = ?auto_475101 ?auto_475104 ) ) ( not ( = ?auto_475101 ?auto_475105 ) ) ( not ( = ?auto_475102 ?auto_475103 ) ) ( not ( = ?auto_475102 ?auto_475104 ) ) ( not ( = ?auto_475102 ?auto_475105 ) ) ( not ( = ?auto_475103 ?auto_475104 ) ) ( not ( = ?auto_475103 ?auto_475105 ) ) ( not ( = ?auto_475104 ?auto_475105 ) ) ( ON ?auto_475103 ?auto_475104 ) ( ON ?auto_475102 ?auto_475103 ) ( ON ?auto_475101 ?auto_475102 ) ( ON ?auto_475100 ?auto_475101 ) ( ON ?auto_475099 ?auto_475100 ) ( ON ?auto_475098 ?auto_475099 ) ( CLEAR ?auto_475096 ) ( ON ?auto_475097 ?auto_475098 ) ( CLEAR ?auto_475097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_475091 ?auto_475092 ?auto_475093 ?auto_475094 ?auto_475095 ?auto_475096 ?auto_475097 )
      ( MAKE-14PILE ?auto_475091 ?auto_475092 ?auto_475093 ?auto_475094 ?auto_475095 ?auto_475096 ?auto_475097 ?auto_475098 ?auto_475099 ?auto_475100 ?auto_475101 ?auto_475102 ?auto_475103 ?auto_475104 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475149 - BLOCK
      ?auto_475150 - BLOCK
      ?auto_475151 - BLOCK
      ?auto_475152 - BLOCK
      ?auto_475153 - BLOCK
      ?auto_475154 - BLOCK
      ?auto_475155 - BLOCK
      ?auto_475156 - BLOCK
      ?auto_475157 - BLOCK
      ?auto_475158 - BLOCK
      ?auto_475159 - BLOCK
      ?auto_475160 - BLOCK
      ?auto_475161 - BLOCK
      ?auto_475162 - BLOCK
    )
    :vars
    (
      ?auto_475163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475162 ?auto_475163 ) ( ON-TABLE ?auto_475149 ) ( ON ?auto_475150 ?auto_475149 ) ( ON ?auto_475151 ?auto_475150 ) ( ON ?auto_475152 ?auto_475151 ) ( ON ?auto_475153 ?auto_475152 ) ( not ( = ?auto_475149 ?auto_475150 ) ) ( not ( = ?auto_475149 ?auto_475151 ) ) ( not ( = ?auto_475149 ?auto_475152 ) ) ( not ( = ?auto_475149 ?auto_475153 ) ) ( not ( = ?auto_475149 ?auto_475154 ) ) ( not ( = ?auto_475149 ?auto_475155 ) ) ( not ( = ?auto_475149 ?auto_475156 ) ) ( not ( = ?auto_475149 ?auto_475157 ) ) ( not ( = ?auto_475149 ?auto_475158 ) ) ( not ( = ?auto_475149 ?auto_475159 ) ) ( not ( = ?auto_475149 ?auto_475160 ) ) ( not ( = ?auto_475149 ?auto_475161 ) ) ( not ( = ?auto_475149 ?auto_475162 ) ) ( not ( = ?auto_475149 ?auto_475163 ) ) ( not ( = ?auto_475150 ?auto_475151 ) ) ( not ( = ?auto_475150 ?auto_475152 ) ) ( not ( = ?auto_475150 ?auto_475153 ) ) ( not ( = ?auto_475150 ?auto_475154 ) ) ( not ( = ?auto_475150 ?auto_475155 ) ) ( not ( = ?auto_475150 ?auto_475156 ) ) ( not ( = ?auto_475150 ?auto_475157 ) ) ( not ( = ?auto_475150 ?auto_475158 ) ) ( not ( = ?auto_475150 ?auto_475159 ) ) ( not ( = ?auto_475150 ?auto_475160 ) ) ( not ( = ?auto_475150 ?auto_475161 ) ) ( not ( = ?auto_475150 ?auto_475162 ) ) ( not ( = ?auto_475150 ?auto_475163 ) ) ( not ( = ?auto_475151 ?auto_475152 ) ) ( not ( = ?auto_475151 ?auto_475153 ) ) ( not ( = ?auto_475151 ?auto_475154 ) ) ( not ( = ?auto_475151 ?auto_475155 ) ) ( not ( = ?auto_475151 ?auto_475156 ) ) ( not ( = ?auto_475151 ?auto_475157 ) ) ( not ( = ?auto_475151 ?auto_475158 ) ) ( not ( = ?auto_475151 ?auto_475159 ) ) ( not ( = ?auto_475151 ?auto_475160 ) ) ( not ( = ?auto_475151 ?auto_475161 ) ) ( not ( = ?auto_475151 ?auto_475162 ) ) ( not ( = ?auto_475151 ?auto_475163 ) ) ( not ( = ?auto_475152 ?auto_475153 ) ) ( not ( = ?auto_475152 ?auto_475154 ) ) ( not ( = ?auto_475152 ?auto_475155 ) ) ( not ( = ?auto_475152 ?auto_475156 ) ) ( not ( = ?auto_475152 ?auto_475157 ) ) ( not ( = ?auto_475152 ?auto_475158 ) ) ( not ( = ?auto_475152 ?auto_475159 ) ) ( not ( = ?auto_475152 ?auto_475160 ) ) ( not ( = ?auto_475152 ?auto_475161 ) ) ( not ( = ?auto_475152 ?auto_475162 ) ) ( not ( = ?auto_475152 ?auto_475163 ) ) ( not ( = ?auto_475153 ?auto_475154 ) ) ( not ( = ?auto_475153 ?auto_475155 ) ) ( not ( = ?auto_475153 ?auto_475156 ) ) ( not ( = ?auto_475153 ?auto_475157 ) ) ( not ( = ?auto_475153 ?auto_475158 ) ) ( not ( = ?auto_475153 ?auto_475159 ) ) ( not ( = ?auto_475153 ?auto_475160 ) ) ( not ( = ?auto_475153 ?auto_475161 ) ) ( not ( = ?auto_475153 ?auto_475162 ) ) ( not ( = ?auto_475153 ?auto_475163 ) ) ( not ( = ?auto_475154 ?auto_475155 ) ) ( not ( = ?auto_475154 ?auto_475156 ) ) ( not ( = ?auto_475154 ?auto_475157 ) ) ( not ( = ?auto_475154 ?auto_475158 ) ) ( not ( = ?auto_475154 ?auto_475159 ) ) ( not ( = ?auto_475154 ?auto_475160 ) ) ( not ( = ?auto_475154 ?auto_475161 ) ) ( not ( = ?auto_475154 ?auto_475162 ) ) ( not ( = ?auto_475154 ?auto_475163 ) ) ( not ( = ?auto_475155 ?auto_475156 ) ) ( not ( = ?auto_475155 ?auto_475157 ) ) ( not ( = ?auto_475155 ?auto_475158 ) ) ( not ( = ?auto_475155 ?auto_475159 ) ) ( not ( = ?auto_475155 ?auto_475160 ) ) ( not ( = ?auto_475155 ?auto_475161 ) ) ( not ( = ?auto_475155 ?auto_475162 ) ) ( not ( = ?auto_475155 ?auto_475163 ) ) ( not ( = ?auto_475156 ?auto_475157 ) ) ( not ( = ?auto_475156 ?auto_475158 ) ) ( not ( = ?auto_475156 ?auto_475159 ) ) ( not ( = ?auto_475156 ?auto_475160 ) ) ( not ( = ?auto_475156 ?auto_475161 ) ) ( not ( = ?auto_475156 ?auto_475162 ) ) ( not ( = ?auto_475156 ?auto_475163 ) ) ( not ( = ?auto_475157 ?auto_475158 ) ) ( not ( = ?auto_475157 ?auto_475159 ) ) ( not ( = ?auto_475157 ?auto_475160 ) ) ( not ( = ?auto_475157 ?auto_475161 ) ) ( not ( = ?auto_475157 ?auto_475162 ) ) ( not ( = ?auto_475157 ?auto_475163 ) ) ( not ( = ?auto_475158 ?auto_475159 ) ) ( not ( = ?auto_475158 ?auto_475160 ) ) ( not ( = ?auto_475158 ?auto_475161 ) ) ( not ( = ?auto_475158 ?auto_475162 ) ) ( not ( = ?auto_475158 ?auto_475163 ) ) ( not ( = ?auto_475159 ?auto_475160 ) ) ( not ( = ?auto_475159 ?auto_475161 ) ) ( not ( = ?auto_475159 ?auto_475162 ) ) ( not ( = ?auto_475159 ?auto_475163 ) ) ( not ( = ?auto_475160 ?auto_475161 ) ) ( not ( = ?auto_475160 ?auto_475162 ) ) ( not ( = ?auto_475160 ?auto_475163 ) ) ( not ( = ?auto_475161 ?auto_475162 ) ) ( not ( = ?auto_475161 ?auto_475163 ) ) ( not ( = ?auto_475162 ?auto_475163 ) ) ( ON ?auto_475161 ?auto_475162 ) ( ON ?auto_475160 ?auto_475161 ) ( ON ?auto_475159 ?auto_475160 ) ( ON ?auto_475158 ?auto_475159 ) ( ON ?auto_475157 ?auto_475158 ) ( ON ?auto_475156 ?auto_475157 ) ( ON ?auto_475155 ?auto_475156 ) ( CLEAR ?auto_475153 ) ( ON ?auto_475154 ?auto_475155 ) ( CLEAR ?auto_475154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_475149 ?auto_475150 ?auto_475151 ?auto_475152 ?auto_475153 ?auto_475154 )
      ( MAKE-14PILE ?auto_475149 ?auto_475150 ?auto_475151 ?auto_475152 ?auto_475153 ?auto_475154 ?auto_475155 ?auto_475156 ?auto_475157 ?auto_475158 ?auto_475159 ?auto_475160 ?auto_475161 ?auto_475162 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475207 - BLOCK
      ?auto_475208 - BLOCK
      ?auto_475209 - BLOCK
      ?auto_475210 - BLOCK
      ?auto_475211 - BLOCK
      ?auto_475212 - BLOCK
      ?auto_475213 - BLOCK
      ?auto_475214 - BLOCK
      ?auto_475215 - BLOCK
      ?auto_475216 - BLOCK
      ?auto_475217 - BLOCK
      ?auto_475218 - BLOCK
      ?auto_475219 - BLOCK
      ?auto_475220 - BLOCK
    )
    :vars
    (
      ?auto_475221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475220 ?auto_475221 ) ( ON-TABLE ?auto_475207 ) ( ON ?auto_475208 ?auto_475207 ) ( ON ?auto_475209 ?auto_475208 ) ( ON ?auto_475210 ?auto_475209 ) ( not ( = ?auto_475207 ?auto_475208 ) ) ( not ( = ?auto_475207 ?auto_475209 ) ) ( not ( = ?auto_475207 ?auto_475210 ) ) ( not ( = ?auto_475207 ?auto_475211 ) ) ( not ( = ?auto_475207 ?auto_475212 ) ) ( not ( = ?auto_475207 ?auto_475213 ) ) ( not ( = ?auto_475207 ?auto_475214 ) ) ( not ( = ?auto_475207 ?auto_475215 ) ) ( not ( = ?auto_475207 ?auto_475216 ) ) ( not ( = ?auto_475207 ?auto_475217 ) ) ( not ( = ?auto_475207 ?auto_475218 ) ) ( not ( = ?auto_475207 ?auto_475219 ) ) ( not ( = ?auto_475207 ?auto_475220 ) ) ( not ( = ?auto_475207 ?auto_475221 ) ) ( not ( = ?auto_475208 ?auto_475209 ) ) ( not ( = ?auto_475208 ?auto_475210 ) ) ( not ( = ?auto_475208 ?auto_475211 ) ) ( not ( = ?auto_475208 ?auto_475212 ) ) ( not ( = ?auto_475208 ?auto_475213 ) ) ( not ( = ?auto_475208 ?auto_475214 ) ) ( not ( = ?auto_475208 ?auto_475215 ) ) ( not ( = ?auto_475208 ?auto_475216 ) ) ( not ( = ?auto_475208 ?auto_475217 ) ) ( not ( = ?auto_475208 ?auto_475218 ) ) ( not ( = ?auto_475208 ?auto_475219 ) ) ( not ( = ?auto_475208 ?auto_475220 ) ) ( not ( = ?auto_475208 ?auto_475221 ) ) ( not ( = ?auto_475209 ?auto_475210 ) ) ( not ( = ?auto_475209 ?auto_475211 ) ) ( not ( = ?auto_475209 ?auto_475212 ) ) ( not ( = ?auto_475209 ?auto_475213 ) ) ( not ( = ?auto_475209 ?auto_475214 ) ) ( not ( = ?auto_475209 ?auto_475215 ) ) ( not ( = ?auto_475209 ?auto_475216 ) ) ( not ( = ?auto_475209 ?auto_475217 ) ) ( not ( = ?auto_475209 ?auto_475218 ) ) ( not ( = ?auto_475209 ?auto_475219 ) ) ( not ( = ?auto_475209 ?auto_475220 ) ) ( not ( = ?auto_475209 ?auto_475221 ) ) ( not ( = ?auto_475210 ?auto_475211 ) ) ( not ( = ?auto_475210 ?auto_475212 ) ) ( not ( = ?auto_475210 ?auto_475213 ) ) ( not ( = ?auto_475210 ?auto_475214 ) ) ( not ( = ?auto_475210 ?auto_475215 ) ) ( not ( = ?auto_475210 ?auto_475216 ) ) ( not ( = ?auto_475210 ?auto_475217 ) ) ( not ( = ?auto_475210 ?auto_475218 ) ) ( not ( = ?auto_475210 ?auto_475219 ) ) ( not ( = ?auto_475210 ?auto_475220 ) ) ( not ( = ?auto_475210 ?auto_475221 ) ) ( not ( = ?auto_475211 ?auto_475212 ) ) ( not ( = ?auto_475211 ?auto_475213 ) ) ( not ( = ?auto_475211 ?auto_475214 ) ) ( not ( = ?auto_475211 ?auto_475215 ) ) ( not ( = ?auto_475211 ?auto_475216 ) ) ( not ( = ?auto_475211 ?auto_475217 ) ) ( not ( = ?auto_475211 ?auto_475218 ) ) ( not ( = ?auto_475211 ?auto_475219 ) ) ( not ( = ?auto_475211 ?auto_475220 ) ) ( not ( = ?auto_475211 ?auto_475221 ) ) ( not ( = ?auto_475212 ?auto_475213 ) ) ( not ( = ?auto_475212 ?auto_475214 ) ) ( not ( = ?auto_475212 ?auto_475215 ) ) ( not ( = ?auto_475212 ?auto_475216 ) ) ( not ( = ?auto_475212 ?auto_475217 ) ) ( not ( = ?auto_475212 ?auto_475218 ) ) ( not ( = ?auto_475212 ?auto_475219 ) ) ( not ( = ?auto_475212 ?auto_475220 ) ) ( not ( = ?auto_475212 ?auto_475221 ) ) ( not ( = ?auto_475213 ?auto_475214 ) ) ( not ( = ?auto_475213 ?auto_475215 ) ) ( not ( = ?auto_475213 ?auto_475216 ) ) ( not ( = ?auto_475213 ?auto_475217 ) ) ( not ( = ?auto_475213 ?auto_475218 ) ) ( not ( = ?auto_475213 ?auto_475219 ) ) ( not ( = ?auto_475213 ?auto_475220 ) ) ( not ( = ?auto_475213 ?auto_475221 ) ) ( not ( = ?auto_475214 ?auto_475215 ) ) ( not ( = ?auto_475214 ?auto_475216 ) ) ( not ( = ?auto_475214 ?auto_475217 ) ) ( not ( = ?auto_475214 ?auto_475218 ) ) ( not ( = ?auto_475214 ?auto_475219 ) ) ( not ( = ?auto_475214 ?auto_475220 ) ) ( not ( = ?auto_475214 ?auto_475221 ) ) ( not ( = ?auto_475215 ?auto_475216 ) ) ( not ( = ?auto_475215 ?auto_475217 ) ) ( not ( = ?auto_475215 ?auto_475218 ) ) ( not ( = ?auto_475215 ?auto_475219 ) ) ( not ( = ?auto_475215 ?auto_475220 ) ) ( not ( = ?auto_475215 ?auto_475221 ) ) ( not ( = ?auto_475216 ?auto_475217 ) ) ( not ( = ?auto_475216 ?auto_475218 ) ) ( not ( = ?auto_475216 ?auto_475219 ) ) ( not ( = ?auto_475216 ?auto_475220 ) ) ( not ( = ?auto_475216 ?auto_475221 ) ) ( not ( = ?auto_475217 ?auto_475218 ) ) ( not ( = ?auto_475217 ?auto_475219 ) ) ( not ( = ?auto_475217 ?auto_475220 ) ) ( not ( = ?auto_475217 ?auto_475221 ) ) ( not ( = ?auto_475218 ?auto_475219 ) ) ( not ( = ?auto_475218 ?auto_475220 ) ) ( not ( = ?auto_475218 ?auto_475221 ) ) ( not ( = ?auto_475219 ?auto_475220 ) ) ( not ( = ?auto_475219 ?auto_475221 ) ) ( not ( = ?auto_475220 ?auto_475221 ) ) ( ON ?auto_475219 ?auto_475220 ) ( ON ?auto_475218 ?auto_475219 ) ( ON ?auto_475217 ?auto_475218 ) ( ON ?auto_475216 ?auto_475217 ) ( ON ?auto_475215 ?auto_475216 ) ( ON ?auto_475214 ?auto_475215 ) ( ON ?auto_475213 ?auto_475214 ) ( ON ?auto_475212 ?auto_475213 ) ( CLEAR ?auto_475210 ) ( ON ?auto_475211 ?auto_475212 ) ( CLEAR ?auto_475211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_475207 ?auto_475208 ?auto_475209 ?auto_475210 ?auto_475211 )
      ( MAKE-14PILE ?auto_475207 ?auto_475208 ?auto_475209 ?auto_475210 ?auto_475211 ?auto_475212 ?auto_475213 ?auto_475214 ?auto_475215 ?auto_475216 ?auto_475217 ?auto_475218 ?auto_475219 ?auto_475220 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475265 - BLOCK
      ?auto_475266 - BLOCK
      ?auto_475267 - BLOCK
      ?auto_475268 - BLOCK
      ?auto_475269 - BLOCK
      ?auto_475270 - BLOCK
      ?auto_475271 - BLOCK
      ?auto_475272 - BLOCK
      ?auto_475273 - BLOCK
      ?auto_475274 - BLOCK
      ?auto_475275 - BLOCK
      ?auto_475276 - BLOCK
      ?auto_475277 - BLOCK
      ?auto_475278 - BLOCK
    )
    :vars
    (
      ?auto_475279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475278 ?auto_475279 ) ( ON-TABLE ?auto_475265 ) ( ON ?auto_475266 ?auto_475265 ) ( ON ?auto_475267 ?auto_475266 ) ( not ( = ?auto_475265 ?auto_475266 ) ) ( not ( = ?auto_475265 ?auto_475267 ) ) ( not ( = ?auto_475265 ?auto_475268 ) ) ( not ( = ?auto_475265 ?auto_475269 ) ) ( not ( = ?auto_475265 ?auto_475270 ) ) ( not ( = ?auto_475265 ?auto_475271 ) ) ( not ( = ?auto_475265 ?auto_475272 ) ) ( not ( = ?auto_475265 ?auto_475273 ) ) ( not ( = ?auto_475265 ?auto_475274 ) ) ( not ( = ?auto_475265 ?auto_475275 ) ) ( not ( = ?auto_475265 ?auto_475276 ) ) ( not ( = ?auto_475265 ?auto_475277 ) ) ( not ( = ?auto_475265 ?auto_475278 ) ) ( not ( = ?auto_475265 ?auto_475279 ) ) ( not ( = ?auto_475266 ?auto_475267 ) ) ( not ( = ?auto_475266 ?auto_475268 ) ) ( not ( = ?auto_475266 ?auto_475269 ) ) ( not ( = ?auto_475266 ?auto_475270 ) ) ( not ( = ?auto_475266 ?auto_475271 ) ) ( not ( = ?auto_475266 ?auto_475272 ) ) ( not ( = ?auto_475266 ?auto_475273 ) ) ( not ( = ?auto_475266 ?auto_475274 ) ) ( not ( = ?auto_475266 ?auto_475275 ) ) ( not ( = ?auto_475266 ?auto_475276 ) ) ( not ( = ?auto_475266 ?auto_475277 ) ) ( not ( = ?auto_475266 ?auto_475278 ) ) ( not ( = ?auto_475266 ?auto_475279 ) ) ( not ( = ?auto_475267 ?auto_475268 ) ) ( not ( = ?auto_475267 ?auto_475269 ) ) ( not ( = ?auto_475267 ?auto_475270 ) ) ( not ( = ?auto_475267 ?auto_475271 ) ) ( not ( = ?auto_475267 ?auto_475272 ) ) ( not ( = ?auto_475267 ?auto_475273 ) ) ( not ( = ?auto_475267 ?auto_475274 ) ) ( not ( = ?auto_475267 ?auto_475275 ) ) ( not ( = ?auto_475267 ?auto_475276 ) ) ( not ( = ?auto_475267 ?auto_475277 ) ) ( not ( = ?auto_475267 ?auto_475278 ) ) ( not ( = ?auto_475267 ?auto_475279 ) ) ( not ( = ?auto_475268 ?auto_475269 ) ) ( not ( = ?auto_475268 ?auto_475270 ) ) ( not ( = ?auto_475268 ?auto_475271 ) ) ( not ( = ?auto_475268 ?auto_475272 ) ) ( not ( = ?auto_475268 ?auto_475273 ) ) ( not ( = ?auto_475268 ?auto_475274 ) ) ( not ( = ?auto_475268 ?auto_475275 ) ) ( not ( = ?auto_475268 ?auto_475276 ) ) ( not ( = ?auto_475268 ?auto_475277 ) ) ( not ( = ?auto_475268 ?auto_475278 ) ) ( not ( = ?auto_475268 ?auto_475279 ) ) ( not ( = ?auto_475269 ?auto_475270 ) ) ( not ( = ?auto_475269 ?auto_475271 ) ) ( not ( = ?auto_475269 ?auto_475272 ) ) ( not ( = ?auto_475269 ?auto_475273 ) ) ( not ( = ?auto_475269 ?auto_475274 ) ) ( not ( = ?auto_475269 ?auto_475275 ) ) ( not ( = ?auto_475269 ?auto_475276 ) ) ( not ( = ?auto_475269 ?auto_475277 ) ) ( not ( = ?auto_475269 ?auto_475278 ) ) ( not ( = ?auto_475269 ?auto_475279 ) ) ( not ( = ?auto_475270 ?auto_475271 ) ) ( not ( = ?auto_475270 ?auto_475272 ) ) ( not ( = ?auto_475270 ?auto_475273 ) ) ( not ( = ?auto_475270 ?auto_475274 ) ) ( not ( = ?auto_475270 ?auto_475275 ) ) ( not ( = ?auto_475270 ?auto_475276 ) ) ( not ( = ?auto_475270 ?auto_475277 ) ) ( not ( = ?auto_475270 ?auto_475278 ) ) ( not ( = ?auto_475270 ?auto_475279 ) ) ( not ( = ?auto_475271 ?auto_475272 ) ) ( not ( = ?auto_475271 ?auto_475273 ) ) ( not ( = ?auto_475271 ?auto_475274 ) ) ( not ( = ?auto_475271 ?auto_475275 ) ) ( not ( = ?auto_475271 ?auto_475276 ) ) ( not ( = ?auto_475271 ?auto_475277 ) ) ( not ( = ?auto_475271 ?auto_475278 ) ) ( not ( = ?auto_475271 ?auto_475279 ) ) ( not ( = ?auto_475272 ?auto_475273 ) ) ( not ( = ?auto_475272 ?auto_475274 ) ) ( not ( = ?auto_475272 ?auto_475275 ) ) ( not ( = ?auto_475272 ?auto_475276 ) ) ( not ( = ?auto_475272 ?auto_475277 ) ) ( not ( = ?auto_475272 ?auto_475278 ) ) ( not ( = ?auto_475272 ?auto_475279 ) ) ( not ( = ?auto_475273 ?auto_475274 ) ) ( not ( = ?auto_475273 ?auto_475275 ) ) ( not ( = ?auto_475273 ?auto_475276 ) ) ( not ( = ?auto_475273 ?auto_475277 ) ) ( not ( = ?auto_475273 ?auto_475278 ) ) ( not ( = ?auto_475273 ?auto_475279 ) ) ( not ( = ?auto_475274 ?auto_475275 ) ) ( not ( = ?auto_475274 ?auto_475276 ) ) ( not ( = ?auto_475274 ?auto_475277 ) ) ( not ( = ?auto_475274 ?auto_475278 ) ) ( not ( = ?auto_475274 ?auto_475279 ) ) ( not ( = ?auto_475275 ?auto_475276 ) ) ( not ( = ?auto_475275 ?auto_475277 ) ) ( not ( = ?auto_475275 ?auto_475278 ) ) ( not ( = ?auto_475275 ?auto_475279 ) ) ( not ( = ?auto_475276 ?auto_475277 ) ) ( not ( = ?auto_475276 ?auto_475278 ) ) ( not ( = ?auto_475276 ?auto_475279 ) ) ( not ( = ?auto_475277 ?auto_475278 ) ) ( not ( = ?auto_475277 ?auto_475279 ) ) ( not ( = ?auto_475278 ?auto_475279 ) ) ( ON ?auto_475277 ?auto_475278 ) ( ON ?auto_475276 ?auto_475277 ) ( ON ?auto_475275 ?auto_475276 ) ( ON ?auto_475274 ?auto_475275 ) ( ON ?auto_475273 ?auto_475274 ) ( ON ?auto_475272 ?auto_475273 ) ( ON ?auto_475271 ?auto_475272 ) ( ON ?auto_475270 ?auto_475271 ) ( ON ?auto_475269 ?auto_475270 ) ( CLEAR ?auto_475267 ) ( ON ?auto_475268 ?auto_475269 ) ( CLEAR ?auto_475268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_475265 ?auto_475266 ?auto_475267 ?auto_475268 )
      ( MAKE-14PILE ?auto_475265 ?auto_475266 ?auto_475267 ?auto_475268 ?auto_475269 ?auto_475270 ?auto_475271 ?auto_475272 ?auto_475273 ?auto_475274 ?auto_475275 ?auto_475276 ?auto_475277 ?auto_475278 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475323 - BLOCK
      ?auto_475324 - BLOCK
      ?auto_475325 - BLOCK
      ?auto_475326 - BLOCK
      ?auto_475327 - BLOCK
      ?auto_475328 - BLOCK
      ?auto_475329 - BLOCK
      ?auto_475330 - BLOCK
      ?auto_475331 - BLOCK
      ?auto_475332 - BLOCK
      ?auto_475333 - BLOCK
      ?auto_475334 - BLOCK
      ?auto_475335 - BLOCK
      ?auto_475336 - BLOCK
    )
    :vars
    (
      ?auto_475337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475336 ?auto_475337 ) ( ON-TABLE ?auto_475323 ) ( ON ?auto_475324 ?auto_475323 ) ( not ( = ?auto_475323 ?auto_475324 ) ) ( not ( = ?auto_475323 ?auto_475325 ) ) ( not ( = ?auto_475323 ?auto_475326 ) ) ( not ( = ?auto_475323 ?auto_475327 ) ) ( not ( = ?auto_475323 ?auto_475328 ) ) ( not ( = ?auto_475323 ?auto_475329 ) ) ( not ( = ?auto_475323 ?auto_475330 ) ) ( not ( = ?auto_475323 ?auto_475331 ) ) ( not ( = ?auto_475323 ?auto_475332 ) ) ( not ( = ?auto_475323 ?auto_475333 ) ) ( not ( = ?auto_475323 ?auto_475334 ) ) ( not ( = ?auto_475323 ?auto_475335 ) ) ( not ( = ?auto_475323 ?auto_475336 ) ) ( not ( = ?auto_475323 ?auto_475337 ) ) ( not ( = ?auto_475324 ?auto_475325 ) ) ( not ( = ?auto_475324 ?auto_475326 ) ) ( not ( = ?auto_475324 ?auto_475327 ) ) ( not ( = ?auto_475324 ?auto_475328 ) ) ( not ( = ?auto_475324 ?auto_475329 ) ) ( not ( = ?auto_475324 ?auto_475330 ) ) ( not ( = ?auto_475324 ?auto_475331 ) ) ( not ( = ?auto_475324 ?auto_475332 ) ) ( not ( = ?auto_475324 ?auto_475333 ) ) ( not ( = ?auto_475324 ?auto_475334 ) ) ( not ( = ?auto_475324 ?auto_475335 ) ) ( not ( = ?auto_475324 ?auto_475336 ) ) ( not ( = ?auto_475324 ?auto_475337 ) ) ( not ( = ?auto_475325 ?auto_475326 ) ) ( not ( = ?auto_475325 ?auto_475327 ) ) ( not ( = ?auto_475325 ?auto_475328 ) ) ( not ( = ?auto_475325 ?auto_475329 ) ) ( not ( = ?auto_475325 ?auto_475330 ) ) ( not ( = ?auto_475325 ?auto_475331 ) ) ( not ( = ?auto_475325 ?auto_475332 ) ) ( not ( = ?auto_475325 ?auto_475333 ) ) ( not ( = ?auto_475325 ?auto_475334 ) ) ( not ( = ?auto_475325 ?auto_475335 ) ) ( not ( = ?auto_475325 ?auto_475336 ) ) ( not ( = ?auto_475325 ?auto_475337 ) ) ( not ( = ?auto_475326 ?auto_475327 ) ) ( not ( = ?auto_475326 ?auto_475328 ) ) ( not ( = ?auto_475326 ?auto_475329 ) ) ( not ( = ?auto_475326 ?auto_475330 ) ) ( not ( = ?auto_475326 ?auto_475331 ) ) ( not ( = ?auto_475326 ?auto_475332 ) ) ( not ( = ?auto_475326 ?auto_475333 ) ) ( not ( = ?auto_475326 ?auto_475334 ) ) ( not ( = ?auto_475326 ?auto_475335 ) ) ( not ( = ?auto_475326 ?auto_475336 ) ) ( not ( = ?auto_475326 ?auto_475337 ) ) ( not ( = ?auto_475327 ?auto_475328 ) ) ( not ( = ?auto_475327 ?auto_475329 ) ) ( not ( = ?auto_475327 ?auto_475330 ) ) ( not ( = ?auto_475327 ?auto_475331 ) ) ( not ( = ?auto_475327 ?auto_475332 ) ) ( not ( = ?auto_475327 ?auto_475333 ) ) ( not ( = ?auto_475327 ?auto_475334 ) ) ( not ( = ?auto_475327 ?auto_475335 ) ) ( not ( = ?auto_475327 ?auto_475336 ) ) ( not ( = ?auto_475327 ?auto_475337 ) ) ( not ( = ?auto_475328 ?auto_475329 ) ) ( not ( = ?auto_475328 ?auto_475330 ) ) ( not ( = ?auto_475328 ?auto_475331 ) ) ( not ( = ?auto_475328 ?auto_475332 ) ) ( not ( = ?auto_475328 ?auto_475333 ) ) ( not ( = ?auto_475328 ?auto_475334 ) ) ( not ( = ?auto_475328 ?auto_475335 ) ) ( not ( = ?auto_475328 ?auto_475336 ) ) ( not ( = ?auto_475328 ?auto_475337 ) ) ( not ( = ?auto_475329 ?auto_475330 ) ) ( not ( = ?auto_475329 ?auto_475331 ) ) ( not ( = ?auto_475329 ?auto_475332 ) ) ( not ( = ?auto_475329 ?auto_475333 ) ) ( not ( = ?auto_475329 ?auto_475334 ) ) ( not ( = ?auto_475329 ?auto_475335 ) ) ( not ( = ?auto_475329 ?auto_475336 ) ) ( not ( = ?auto_475329 ?auto_475337 ) ) ( not ( = ?auto_475330 ?auto_475331 ) ) ( not ( = ?auto_475330 ?auto_475332 ) ) ( not ( = ?auto_475330 ?auto_475333 ) ) ( not ( = ?auto_475330 ?auto_475334 ) ) ( not ( = ?auto_475330 ?auto_475335 ) ) ( not ( = ?auto_475330 ?auto_475336 ) ) ( not ( = ?auto_475330 ?auto_475337 ) ) ( not ( = ?auto_475331 ?auto_475332 ) ) ( not ( = ?auto_475331 ?auto_475333 ) ) ( not ( = ?auto_475331 ?auto_475334 ) ) ( not ( = ?auto_475331 ?auto_475335 ) ) ( not ( = ?auto_475331 ?auto_475336 ) ) ( not ( = ?auto_475331 ?auto_475337 ) ) ( not ( = ?auto_475332 ?auto_475333 ) ) ( not ( = ?auto_475332 ?auto_475334 ) ) ( not ( = ?auto_475332 ?auto_475335 ) ) ( not ( = ?auto_475332 ?auto_475336 ) ) ( not ( = ?auto_475332 ?auto_475337 ) ) ( not ( = ?auto_475333 ?auto_475334 ) ) ( not ( = ?auto_475333 ?auto_475335 ) ) ( not ( = ?auto_475333 ?auto_475336 ) ) ( not ( = ?auto_475333 ?auto_475337 ) ) ( not ( = ?auto_475334 ?auto_475335 ) ) ( not ( = ?auto_475334 ?auto_475336 ) ) ( not ( = ?auto_475334 ?auto_475337 ) ) ( not ( = ?auto_475335 ?auto_475336 ) ) ( not ( = ?auto_475335 ?auto_475337 ) ) ( not ( = ?auto_475336 ?auto_475337 ) ) ( ON ?auto_475335 ?auto_475336 ) ( ON ?auto_475334 ?auto_475335 ) ( ON ?auto_475333 ?auto_475334 ) ( ON ?auto_475332 ?auto_475333 ) ( ON ?auto_475331 ?auto_475332 ) ( ON ?auto_475330 ?auto_475331 ) ( ON ?auto_475329 ?auto_475330 ) ( ON ?auto_475328 ?auto_475329 ) ( ON ?auto_475327 ?auto_475328 ) ( ON ?auto_475326 ?auto_475327 ) ( CLEAR ?auto_475324 ) ( ON ?auto_475325 ?auto_475326 ) ( CLEAR ?auto_475325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_475323 ?auto_475324 ?auto_475325 )
      ( MAKE-14PILE ?auto_475323 ?auto_475324 ?auto_475325 ?auto_475326 ?auto_475327 ?auto_475328 ?auto_475329 ?auto_475330 ?auto_475331 ?auto_475332 ?auto_475333 ?auto_475334 ?auto_475335 ?auto_475336 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475381 - BLOCK
      ?auto_475382 - BLOCK
      ?auto_475383 - BLOCK
      ?auto_475384 - BLOCK
      ?auto_475385 - BLOCK
      ?auto_475386 - BLOCK
      ?auto_475387 - BLOCK
      ?auto_475388 - BLOCK
      ?auto_475389 - BLOCK
      ?auto_475390 - BLOCK
      ?auto_475391 - BLOCK
      ?auto_475392 - BLOCK
      ?auto_475393 - BLOCK
      ?auto_475394 - BLOCK
    )
    :vars
    (
      ?auto_475395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475394 ?auto_475395 ) ( ON-TABLE ?auto_475381 ) ( not ( = ?auto_475381 ?auto_475382 ) ) ( not ( = ?auto_475381 ?auto_475383 ) ) ( not ( = ?auto_475381 ?auto_475384 ) ) ( not ( = ?auto_475381 ?auto_475385 ) ) ( not ( = ?auto_475381 ?auto_475386 ) ) ( not ( = ?auto_475381 ?auto_475387 ) ) ( not ( = ?auto_475381 ?auto_475388 ) ) ( not ( = ?auto_475381 ?auto_475389 ) ) ( not ( = ?auto_475381 ?auto_475390 ) ) ( not ( = ?auto_475381 ?auto_475391 ) ) ( not ( = ?auto_475381 ?auto_475392 ) ) ( not ( = ?auto_475381 ?auto_475393 ) ) ( not ( = ?auto_475381 ?auto_475394 ) ) ( not ( = ?auto_475381 ?auto_475395 ) ) ( not ( = ?auto_475382 ?auto_475383 ) ) ( not ( = ?auto_475382 ?auto_475384 ) ) ( not ( = ?auto_475382 ?auto_475385 ) ) ( not ( = ?auto_475382 ?auto_475386 ) ) ( not ( = ?auto_475382 ?auto_475387 ) ) ( not ( = ?auto_475382 ?auto_475388 ) ) ( not ( = ?auto_475382 ?auto_475389 ) ) ( not ( = ?auto_475382 ?auto_475390 ) ) ( not ( = ?auto_475382 ?auto_475391 ) ) ( not ( = ?auto_475382 ?auto_475392 ) ) ( not ( = ?auto_475382 ?auto_475393 ) ) ( not ( = ?auto_475382 ?auto_475394 ) ) ( not ( = ?auto_475382 ?auto_475395 ) ) ( not ( = ?auto_475383 ?auto_475384 ) ) ( not ( = ?auto_475383 ?auto_475385 ) ) ( not ( = ?auto_475383 ?auto_475386 ) ) ( not ( = ?auto_475383 ?auto_475387 ) ) ( not ( = ?auto_475383 ?auto_475388 ) ) ( not ( = ?auto_475383 ?auto_475389 ) ) ( not ( = ?auto_475383 ?auto_475390 ) ) ( not ( = ?auto_475383 ?auto_475391 ) ) ( not ( = ?auto_475383 ?auto_475392 ) ) ( not ( = ?auto_475383 ?auto_475393 ) ) ( not ( = ?auto_475383 ?auto_475394 ) ) ( not ( = ?auto_475383 ?auto_475395 ) ) ( not ( = ?auto_475384 ?auto_475385 ) ) ( not ( = ?auto_475384 ?auto_475386 ) ) ( not ( = ?auto_475384 ?auto_475387 ) ) ( not ( = ?auto_475384 ?auto_475388 ) ) ( not ( = ?auto_475384 ?auto_475389 ) ) ( not ( = ?auto_475384 ?auto_475390 ) ) ( not ( = ?auto_475384 ?auto_475391 ) ) ( not ( = ?auto_475384 ?auto_475392 ) ) ( not ( = ?auto_475384 ?auto_475393 ) ) ( not ( = ?auto_475384 ?auto_475394 ) ) ( not ( = ?auto_475384 ?auto_475395 ) ) ( not ( = ?auto_475385 ?auto_475386 ) ) ( not ( = ?auto_475385 ?auto_475387 ) ) ( not ( = ?auto_475385 ?auto_475388 ) ) ( not ( = ?auto_475385 ?auto_475389 ) ) ( not ( = ?auto_475385 ?auto_475390 ) ) ( not ( = ?auto_475385 ?auto_475391 ) ) ( not ( = ?auto_475385 ?auto_475392 ) ) ( not ( = ?auto_475385 ?auto_475393 ) ) ( not ( = ?auto_475385 ?auto_475394 ) ) ( not ( = ?auto_475385 ?auto_475395 ) ) ( not ( = ?auto_475386 ?auto_475387 ) ) ( not ( = ?auto_475386 ?auto_475388 ) ) ( not ( = ?auto_475386 ?auto_475389 ) ) ( not ( = ?auto_475386 ?auto_475390 ) ) ( not ( = ?auto_475386 ?auto_475391 ) ) ( not ( = ?auto_475386 ?auto_475392 ) ) ( not ( = ?auto_475386 ?auto_475393 ) ) ( not ( = ?auto_475386 ?auto_475394 ) ) ( not ( = ?auto_475386 ?auto_475395 ) ) ( not ( = ?auto_475387 ?auto_475388 ) ) ( not ( = ?auto_475387 ?auto_475389 ) ) ( not ( = ?auto_475387 ?auto_475390 ) ) ( not ( = ?auto_475387 ?auto_475391 ) ) ( not ( = ?auto_475387 ?auto_475392 ) ) ( not ( = ?auto_475387 ?auto_475393 ) ) ( not ( = ?auto_475387 ?auto_475394 ) ) ( not ( = ?auto_475387 ?auto_475395 ) ) ( not ( = ?auto_475388 ?auto_475389 ) ) ( not ( = ?auto_475388 ?auto_475390 ) ) ( not ( = ?auto_475388 ?auto_475391 ) ) ( not ( = ?auto_475388 ?auto_475392 ) ) ( not ( = ?auto_475388 ?auto_475393 ) ) ( not ( = ?auto_475388 ?auto_475394 ) ) ( not ( = ?auto_475388 ?auto_475395 ) ) ( not ( = ?auto_475389 ?auto_475390 ) ) ( not ( = ?auto_475389 ?auto_475391 ) ) ( not ( = ?auto_475389 ?auto_475392 ) ) ( not ( = ?auto_475389 ?auto_475393 ) ) ( not ( = ?auto_475389 ?auto_475394 ) ) ( not ( = ?auto_475389 ?auto_475395 ) ) ( not ( = ?auto_475390 ?auto_475391 ) ) ( not ( = ?auto_475390 ?auto_475392 ) ) ( not ( = ?auto_475390 ?auto_475393 ) ) ( not ( = ?auto_475390 ?auto_475394 ) ) ( not ( = ?auto_475390 ?auto_475395 ) ) ( not ( = ?auto_475391 ?auto_475392 ) ) ( not ( = ?auto_475391 ?auto_475393 ) ) ( not ( = ?auto_475391 ?auto_475394 ) ) ( not ( = ?auto_475391 ?auto_475395 ) ) ( not ( = ?auto_475392 ?auto_475393 ) ) ( not ( = ?auto_475392 ?auto_475394 ) ) ( not ( = ?auto_475392 ?auto_475395 ) ) ( not ( = ?auto_475393 ?auto_475394 ) ) ( not ( = ?auto_475393 ?auto_475395 ) ) ( not ( = ?auto_475394 ?auto_475395 ) ) ( ON ?auto_475393 ?auto_475394 ) ( ON ?auto_475392 ?auto_475393 ) ( ON ?auto_475391 ?auto_475392 ) ( ON ?auto_475390 ?auto_475391 ) ( ON ?auto_475389 ?auto_475390 ) ( ON ?auto_475388 ?auto_475389 ) ( ON ?auto_475387 ?auto_475388 ) ( ON ?auto_475386 ?auto_475387 ) ( ON ?auto_475385 ?auto_475386 ) ( ON ?auto_475384 ?auto_475385 ) ( ON ?auto_475383 ?auto_475384 ) ( CLEAR ?auto_475381 ) ( ON ?auto_475382 ?auto_475383 ) ( CLEAR ?auto_475382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_475381 ?auto_475382 )
      ( MAKE-14PILE ?auto_475381 ?auto_475382 ?auto_475383 ?auto_475384 ?auto_475385 ?auto_475386 ?auto_475387 ?auto_475388 ?auto_475389 ?auto_475390 ?auto_475391 ?auto_475392 ?auto_475393 ?auto_475394 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_475439 - BLOCK
      ?auto_475440 - BLOCK
      ?auto_475441 - BLOCK
      ?auto_475442 - BLOCK
      ?auto_475443 - BLOCK
      ?auto_475444 - BLOCK
      ?auto_475445 - BLOCK
      ?auto_475446 - BLOCK
      ?auto_475447 - BLOCK
      ?auto_475448 - BLOCK
      ?auto_475449 - BLOCK
      ?auto_475450 - BLOCK
      ?auto_475451 - BLOCK
      ?auto_475452 - BLOCK
    )
    :vars
    (
      ?auto_475453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475452 ?auto_475453 ) ( not ( = ?auto_475439 ?auto_475440 ) ) ( not ( = ?auto_475439 ?auto_475441 ) ) ( not ( = ?auto_475439 ?auto_475442 ) ) ( not ( = ?auto_475439 ?auto_475443 ) ) ( not ( = ?auto_475439 ?auto_475444 ) ) ( not ( = ?auto_475439 ?auto_475445 ) ) ( not ( = ?auto_475439 ?auto_475446 ) ) ( not ( = ?auto_475439 ?auto_475447 ) ) ( not ( = ?auto_475439 ?auto_475448 ) ) ( not ( = ?auto_475439 ?auto_475449 ) ) ( not ( = ?auto_475439 ?auto_475450 ) ) ( not ( = ?auto_475439 ?auto_475451 ) ) ( not ( = ?auto_475439 ?auto_475452 ) ) ( not ( = ?auto_475439 ?auto_475453 ) ) ( not ( = ?auto_475440 ?auto_475441 ) ) ( not ( = ?auto_475440 ?auto_475442 ) ) ( not ( = ?auto_475440 ?auto_475443 ) ) ( not ( = ?auto_475440 ?auto_475444 ) ) ( not ( = ?auto_475440 ?auto_475445 ) ) ( not ( = ?auto_475440 ?auto_475446 ) ) ( not ( = ?auto_475440 ?auto_475447 ) ) ( not ( = ?auto_475440 ?auto_475448 ) ) ( not ( = ?auto_475440 ?auto_475449 ) ) ( not ( = ?auto_475440 ?auto_475450 ) ) ( not ( = ?auto_475440 ?auto_475451 ) ) ( not ( = ?auto_475440 ?auto_475452 ) ) ( not ( = ?auto_475440 ?auto_475453 ) ) ( not ( = ?auto_475441 ?auto_475442 ) ) ( not ( = ?auto_475441 ?auto_475443 ) ) ( not ( = ?auto_475441 ?auto_475444 ) ) ( not ( = ?auto_475441 ?auto_475445 ) ) ( not ( = ?auto_475441 ?auto_475446 ) ) ( not ( = ?auto_475441 ?auto_475447 ) ) ( not ( = ?auto_475441 ?auto_475448 ) ) ( not ( = ?auto_475441 ?auto_475449 ) ) ( not ( = ?auto_475441 ?auto_475450 ) ) ( not ( = ?auto_475441 ?auto_475451 ) ) ( not ( = ?auto_475441 ?auto_475452 ) ) ( not ( = ?auto_475441 ?auto_475453 ) ) ( not ( = ?auto_475442 ?auto_475443 ) ) ( not ( = ?auto_475442 ?auto_475444 ) ) ( not ( = ?auto_475442 ?auto_475445 ) ) ( not ( = ?auto_475442 ?auto_475446 ) ) ( not ( = ?auto_475442 ?auto_475447 ) ) ( not ( = ?auto_475442 ?auto_475448 ) ) ( not ( = ?auto_475442 ?auto_475449 ) ) ( not ( = ?auto_475442 ?auto_475450 ) ) ( not ( = ?auto_475442 ?auto_475451 ) ) ( not ( = ?auto_475442 ?auto_475452 ) ) ( not ( = ?auto_475442 ?auto_475453 ) ) ( not ( = ?auto_475443 ?auto_475444 ) ) ( not ( = ?auto_475443 ?auto_475445 ) ) ( not ( = ?auto_475443 ?auto_475446 ) ) ( not ( = ?auto_475443 ?auto_475447 ) ) ( not ( = ?auto_475443 ?auto_475448 ) ) ( not ( = ?auto_475443 ?auto_475449 ) ) ( not ( = ?auto_475443 ?auto_475450 ) ) ( not ( = ?auto_475443 ?auto_475451 ) ) ( not ( = ?auto_475443 ?auto_475452 ) ) ( not ( = ?auto_475443 ?auto_475453 ) ) ( not ( = ?auto_475444 ?auto_475445 ) ) ( not ( = ?auto_475444 ?auto_475446 ) ) ( not ( = ?auto_475444 ?auto_475447 ) ) ( not ( = ?auto_475444 ?auto_475448 ) ) ( not ( = ?auto_475444 ?auto_475449 ) ) ( not ( = ?auto_475444 ?auto_475450 ) ) ( not ( = ?auto_475444 ?auto_475451 ) ) ( not ( = ?auto_475444 ?auto_475452 ) ) ( not ( = ?auto_475444 ?auto_475453 ) ) ( not ( = ?auto_475445 ?auto_475446 ) ) ( not ( = ?auto_475445 ?auto_475447 ) ) ( not ( = ?auto_475445 ?auto_475448 ) ) ( not ( = ?auto_475445 ?auto_475449 ) ) ( not ( = ?auto_475445 ?auto_475450 ) ) ( not ( = ?auto_475445 ?auto_475451 ) ) ( not ( = ?auto_475445 ?auto_475452 ) ) ( not ( = ?auto_475445 ?auto_475453 ) ) ( not ( = ?auto_475446 ?auto_475447 ) ) ( not ( = ?auto_475446 ?auto_475448 ) ) ( not ( = ?auto_475446 ?auto_475449 ) ) ( not ( = ?auto_475446 ?auto_475450 ) ) ( not ( = ?auto_475446 ?auto_475451 ) ) ( not ( = ?auto_475446 ?auto_475452 ) ) ( not ( = ?auto_475446 ?auto_475453 ) ) ( not ( = ?auto_475447 ?auto_475448 ) ) ( not ( = ?auto_475447 ?auto_475449 ) ) ( not ( = ?auto_475447 ?auto_475450 ) ) ( not ( = ?auto_475447 ?auto_475451 ) ) ( not ( = ?auto_475447 ?auto_475452 ) ) ( not ( = ?auto_475447 ?auto_475453 ) ) ( not ( = ?auto_475448 ?auto_475449 ) ) ( not ( = ?auto_475448 ?auto_475450 ) ) ( not ( = ?auto_475448 ?auto_475451 ) ) ( not ( = ?auto_475448 ?auto_475452 ) ) ( not ( = ?auto_475448 ?auto_475453 ) ) ( not ( = ?auto_475449 ?auto_475450 ) ) ( not ( = ?auto_475449 ?auto_475451 ) ) ( not ( = ?auto_475449 ?auto_475452 ) ) ( not ( = ?auto_475449 ?auto_475453 ) ) ( not ( = ?auto_475450 ?auto_475451 ) ) ( not ( = ?auto_475450 ?auto_475452 ) ) ( not ( = ?auto_475450 ?auto_475453 ) ) ( not ( = ?auto_475451 ?auto_475452 ) ) ( not ( = ?auto_475451 ?auto_475453 ) ) ( not ( = ?auto_475452 ?auto_475453 ) ) ( ON ?auto_475451 ?auto_475452 ) ( ON ?auto_475450 ?auto_475451 ) ( ON ?auto_475449 ?auto_475450 ) ( ON ?auto_475448 ?auto_475449 ) ( ON ?auto_475447 ?auto_475448 ) ( ON ?auto_475446 ?auto_475447 ) ( ON ?auto_475445 ?auto_475446 ) ( ON ?auto_475444 ?auto_475445 ) ( ON ?auto_475443 ?auto_475444 ) ( ON ?auto_475442 ?auto_475443 ) ( ON ?auto_475441 ?auto_475442 ) ( ON ?auto_475440 ?auto_475441 ) ( ON ?auto_475439 ?auto_475440 ) ( CLEAR ?auto_475439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_475439 )
      ( MAKE-14PILE ?auto_475439 ?auto_475440 ?auto_475441 ?auto_475442 ?auto_475443 ?auto_475444 ?auto_475445 ?auto_475446 ?auto_475447 ?auto_475448 ?auto_475449 ?auto_475450 ?auto_475451 ?auto_475452 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475498 - BLOCK
      ?auto_475499 - BLOCK
      ?auto_475500 - BLOCK
      ?auto_475501 - BLOCK
      ?auto_475502 - BLOCK
      ?auto_475503 - BLOCK
      ?auto_475504 - BLOCK
      ?auto_475505 - BLOCK
      ?auto_475506 - BLOCK
      ?auto_475507 - BLOCK
      ?auto_475508 - BLOCK
      ?auto_475509 - BLOCK
      ?auto_475510 - BLOCK
      ?auto_475511 - BLOCK
      ?auto_475512 - BLOCK
    )
    :vars
    (
      ?auto_475513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_475511 ) ( ON ?auto_475512 ?auto_475513 ) ( CLEAR ?auto_475512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_475498 ) ( ON ?auto_475499 ?auto_475498 ) ( ON ?auto_475500 ?auto_475499 ) ( ON ?auto_475501 ?auto_475500 ) ( ON ?auto_475502 ?auto_475501 ) ( ON ?auto_475503 ?auto_475502 ) ( ON ?auto_475504 ?auto_475503 ) ( ON ?auto_475505 ?auto_475504 ) ( ON ?auto_475506 ?auto_475505 ) ( ON ?auto_475507 ?auto_475506 ) ( ON ?auto_475508 ?auto_475507 ) ( ON ?auto_475509 ?auto_475508 ) ( ON ?auto_475510 ?auto_475509 ) ( ON ?auto_475511 ?auto_475510 ) ( not ( = ?auto_475498 ?auto_475499 ) ) ( not ( = ?auto_475498 ?auto_475500 ) ) ( not ( = ?auto_475498 ?auto_475501 ) ) ( not ( = ?auto_475498 ?auto_475502 ) ) ( not ( = ?auto_475498 ?auto_475503 ) ) ( not ( = ?auto_475498 ?auto_475504 ) ) ( not ( = ?auto_475498 ?auto_475505 ) ) ( not ( = ?auto_475498 ?auto_475506 ) ) ( not ( = ?auto_475498 ?auto_475507 ) ) ( not ( = ?auto_475498 ?auto_475508 ) ) ( not ( = ?auto_475498 ?auto_475509 ) ) ( not ( = ?auto_475498 ?auto_475510 ) ) ( not ( = ?auto_475498 ?auto_475511 ) ) ( not ( = ?auto_475498 ?auto_475512 ) ) ( not ( = ?auto_475498 ?auto_475513 ) ) ( not ( = ?auto_475499 ?auto_475500 ) ) ( not ( = ?auto_475499 ?auto_475501 ) ) ( not ( = ?auto_475499 ?auto_475502 ) ) ( not ( = ?auto_475499 ?auto_475503 ) ) ( not ( = ?auto_475499 ?auto_475504 ) ) ( not ( = ?auto_475499 ?auto_475505 ) ) ( not ( = ?auto_475499 ?auto_475506 ) ) ( not ( = ?auto_475499 ?auto_475507 ) ) ( not ( = ?auto_475499 ?auto_475508 ) ) ( not ( = ?auto_475499 ?auto_475509 ) ) ( not ( = ?auto_475499 ?auto_475510 ) ) ( not ( = ?auto_475499 ?auto_475511 ) ) ( not ( = ?auto_475499 ?auto_475512 ) ) ( not ( = ?auto_475499 ?auto_475513 ) ) ( not ( = ?auto_475500 ?auto_475501 ) ) ( not ( = ?auto_475500 ?auto_475502 ) ) ( not ( = ?auto_475500 ?auto_475503 ) ) ( not ( = ?auto_475500 ?auto_475504 ) ) ( not ( = ?auto_475500 ?auto_475505 ) ) ( not ( = ?auto_475500 ?auto_475506 ) ) ( not ( = ?auto_475500 ?auto_475507 ) ) ( not ( = ?auto_475500 ?auto_475508 ) ) ( not ( = ?auto_475500 ?auto_475509 ) ) ( not ( = ?auto_475500 ?auto_475510 ) ) ( not ( = ?auto_475500 ?auto_475511 ) ) ( not ( = ?auto_475500 ?auto_475512 ) ) ( not ( = ?auto_475500 ?auto_475513 ) ) ( not ( = ?auto_475501 ?auto_475502 ) ) ( not ( = ?auto_475501 ?auto_475503 ) ) ( not ( = ?auto_475501 ?auto_475504 ) ) ( not ( = ?auto_475501 ?auto_475505 ) ) ( not ( = ?auto_475501 ?auto_475506 ) ) ( not ( = ?auto_475501 ?auto_475507 ) ) ( not ( = ?auto_475501 ?auto_475508 ) ) ( not ( = ?auto_475501 ?auto_475509 ) ) ( not ( = ?auto_475501 ?auto_475510 ) ) ( not ( = ?auto_475501 ?auto_475511 ) ) ( not ( = ?auto_475501 ?auto_475512 ) ) ( not ( = ?auto_475501 ?auto_475513 ) ) ( not ( = ?auto_475502 ?auto_475503 ) ) ( not ( = ?auto_475502 ?auto_475504 ) ) ( not ( = ?auto_475502 ?auto_475505 ) ) ( not ( = ?auto_475502 ?auto_475506 ) ) ( not ( = ?auto_475502 ?auto_475507 ) ) ( not ( = ?auto_475502 ?auto_475508 ) ) ( not ( = ?auto_475502 ?auto_475509 ) ) ( not ( = ?auto_475502 ?auto_475510 ) ) ( not ( = ?auto_475502 ?auto_475511 ) ) ( not ( = ?auto_475502 ?auto_475512 ) ) ( not ( = ?auto_475502 ?auto_475513 ) ) ( not ( = ?auto_475503 ?auto_475504 ) ) ( not ( = ?auto_475503 ?auto_475505 ) ) ( not ( = ?auto_475503 ?auto_475506 ) ) ( not ( = ?auto_475503 ?auto_475507 ) ) ( not ( = ?auto_475503 ?auto_475508 ) ) ( not ( = ?auto_475503 ?auto_475509 ) ) ( not ( = ?auto_475503 ?auto_475510 ) ) ( not ( = ?auto_475503 ?auto_475511 ) ) ( not ( = ?auto_475503 ?auto_475512 ) ) ( not ( = ?auto_475503 ?auto_475513 ) ) ( not ( = ?auto_475504 ?auto_475505 ) ) ( not ( = ?auto_475504 ?auto_475506 ) ) ( not ( = ?auto_475504 ?auto_475507 ) ) ( not ( = ?auto_475504 ?auto_475508 ) ) ( not ( = ?auto_475504 ?auto_475509 ) ) ( not ( = ?auto_475504 ?auto_475510 ) ) ( not ( = ?auto_475504 ?auto_475511 ) ) ( not ( = ?auto_475504 ?auto_475512 ) ) ( not ( = ?auto_475504 ?auto_475513 ) ) ( not ( = ?auto_475505 ?auto_475506 ) ) ( not ( = ?auto_475505 ?auto_475507 ) ) ( not ( = ?auto_475505 ?auto_475508 ) ) ( not ( = ?auto_475505 ?auto_475509 ) ) ( not ( = ?auto_475505 ?auto_475510 ) ) ( not ( = ?auto_475505 ?auto_475511 ) ) ( not ( = ?auto_475505 ?auto_475512 ) ) ( not ( = ?auto_475505 ?auto_475513 ) ) ( not ( = ?auto_475506 ?auto_475507 ) ) ( not ( = ?auto_475506 ?auto_475508 ) ) ( not ( = ?auto_475506 ?auto_475509 ) ) ( not ( = ?auto_475506 ?auto_475510 ) ) ( not ( = ?auto_475506 ?auto_475511 ) ) ( not ( = ?auto_475506 ?auto_475512 ) ) ( not ( = ?auto_475506 ?auto_475513 ) ) ( not ( = ?auto_475507 ?auto_475508 ) ) ( not ( = ?auto_475507 ?auto_475509 ) ) ( not ( = ?auto_475507 ?auto_475510 ) ) ( not ( = ?auto_475507 ?auto_475511 ) ) ( not ( = ?auto_475507 ?auto_475512 ) ) ( not ( = ?auto_475507 ?auto_475513 ) ) ( not ( = ?auto_475508 ?auto_475509 ) ) ( not ( = ?auto_475508 ?auto_475510 ) ) ( not ( = ?auto_475508 ?auto_475511 ) ) ( not ( = ?auto_475508 ?auto_475512 ) ) ( not ( = ?auto_475508 ?auto_475513 ) ) ( not ( = ?auto_475509 ?auto_475510 ) ) ( not ( = ?auto_475509 ?auto_475511 ) ) ( not ( = ?auto_475509 ?auto_475512 ) ) ( not ( = ?auto_475509 ?auto_475513 ) ) ( not ( = ?auto_475510 ?auto_475511 ) ) ( not ( = ?auto_475510 ?auto_475512 ) ) ( not ( = ?auto_475510 ?auto_475513 ) ) ( not ( = ?auto_475511 ?auto_475512 ) ) ( not ( = ?auto_475511 ?auto_475513 ) ) ( not ( = ?auto_475512 ?auto_475513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_475512 ?auto_475513 )
      ( !STACK ?auto_475512 ?auto_475511 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475560 - BLOCK
      ?auto_475561 - BLOCK
      ?auto_475562 - BLOCK
      ?auto_475563 - BLOCK
      ?auto_475564 - BLOCK
      ?auto_475565 - BLOCK
      ?auto_475566 - BLOCK
      ?auto_475567 - BLOCK
      ?auto_475568 - BLOCK
      ?auto_475569 - BLOCK
      ?auto_475570 - BLOCK
      ?auto_475571 - BLOCK
      ?auto_475572 - BLOCK
      ?auto_475573 - BLOCK
      ?auto_475574 - BLOCK
    )
    :vars
    (
      ?auto_475575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475574 ?auto_475575 ) ( ON-TABLE ?auto_475560 ) ( ON ?auto_475561 ?auto_475560 ) ( ON ?auto_475562 ?auto_475561 ) ( ON ?auto_475563 ?auto_475562 ) ( ON ?auto_475564 ?auto_475563 ) ( ON ?auto_475565 ?auto_475564 ) ( ON ?auto_475566 ?auto_475565 ) ( ON ?auto_475567 ?auto_475566 ) ( ON ?auto_475568 ?auto_475567 ) ( ON ?auto_475569 ?auto_475568 ) ( ON ?auto_475570 ?auto_475569 ) ( ON ?auto_475571 ?auto_475570 ) ( ON ?auto_475572 ?auto_475571 ) ( not ( = ?auto_475560 ?auto_475561 ) ) ( not ( = ?auto_475560 ?auto_475562 ) ) ( not ( = ?auto_475560 ?auto_475563 ) ) ( not ( = ?auto_475560 ?auto_475564 ) ) ( not ( = ?auto_475560 ?auto_475565 ) ) ( not ( = ?auto_475560 ?auto_475566 ) ) ( not ( = ?auto_475560 ?auto_475567 ) ) ( not ( = ?auto_475560 ?auto_475568 ) ) ( not ( = ?auto_475560 ?auto_475569 ) ) ( not ( = ?auto_475560 ?auto_475570 ) ) ( not ( = ?auto_475560 ?auto_475571 ) ) ( not ( = ?auto_475560 ?auto_475572 ) ) ( not ( = ?auto_475560 ?auto_475573 ) ) ( not ( = ?auto_475560 ?auto_475574 ) ) ( not ( = ?auto_475560 ?auto_475575 ) ) ( not ( = ?auto_475561 ?auto_475562 ) ) ( not ( = ?auto_475561 ?auto_475563 ) ) ( not ( = ?auto_475561 ?auto_475564 ) ) ( not ( = ?auto_475561 ?auto_475565 ) ) ( not ( = ?auto_475561 ?auto_475566 ) ) ( not ( = ?auto_475561 ?auto_475567 ) ) ( not ( = ?auto_475561 ?auto_475568 ) ) ( not ( = ?auto_475561 ?auto_475569 ) ) ( not ( = ?auto_475561 ?auto_475570 ) ) ( not ( = ?auto_475561 ?auto_475571 ) ) ( not ( = ?auto_475561 ?auto_475572 ) ) ( not ( = ?auto_475561 ?auto_475573 ) ) ( not ( = ?auto_475561 ?auto_475574 ) ) ( not ( = ?auto_475561 ?auto_475575 ) ) ( not ( = ?auto_475562 ?auto_475563 ) ) ( not ( = ?auto_475562 ?auto_475564 ) ) ( not ( = ?auto_475562 ?auto_475565 ) ) ( not ( = ?auto_475562 ?auto_475566 ) ) ( not ( = ?auto_475562 ?auto_475567 ) ) ( not ( = ?auto_475562 ?auto_475568 ) ) ( not ( = ?auto_475562 ?auto_475569 ) ) ( not ( = ?auto_475562 ?auto_475570 ) ) ( not ( = ?auto_475562 ?auto_475571 ) ) ( not ( = ?auto_475562 ?auto_475572 ) ) ( not ( = ?auto_475562 ?auto_475573 ) ) ( not ( = ?auto_475562 ?auto_475574 ) ) ( not ( = ?auto_475562 ?auto_475575 ) ) ( not ( = ?auto_475563 ?auto_475564 ) ) ( not ( = ?auto_475563 ?auto_475565 ) ) ( not ( = ?auto_475563 ?auto_475566 ) ) ( not ( = ?auto_475563 ?auto_475567 ) ) ( not ( = ?auto_475563 ?auto_475568 ) ) ( not ( = ?auto_475563 ?auto_475569 ) ) ( not ( = ?auto_475563 ?auto_475570 ) ) ( not ( = ?auto_475563 ?auto_475571 ) ) ( not ( = ?auto_475563 ?auto_475572 ) ) ( not ( = ?auto_475563 ?auto_475573 ) ) ( not ( = ?auto_475563 ?auto_475574 ) ) ( not ( = ?auto_475563 ?auto_475575 ) ) ( not ( = ?auto_475564 ?auto_475565 ) ) ( not ( = ?auto_475564 ?auto_475566 ) ) ( not ( = ?auto_475564 ?auto_475567 ) ) ( not ( = ?auto_475564 ?auto_475568 ) ) ( not ( = ?auto_475564 ?auto_475569 ) ) ( not ( = ?auto_475564 ?auto_475570 ) ) ( not ( = ?auto_475564 ?auto_475571 ) ) ( not ( = ?auto_475564 ?auto_475572 ) ) ( not ( = ?auto_475564 ?auto_475573 ) ) ( not ( = ?auto_475564 ?auto_475574 ) ) ( not ( = ?auto_475564 ?auto_475575 ) ) ( not ( = ?auto_475565 ?auto_475566 ) ) ( not ( = ?auto_475565 ?auto_475567 ) ) ( not ( = ?auto_475565 ?auto_475568 ) ) ( not ( = ?auto_475565 ?auto_475569 ) ) ( not ( = ?auto_475565 ?auto_475570 ) ) ( not ( = ?auto_475565 ?auto_475571 ) ) ( not ( = ?auto_475565 ?auto_475572 ) ) ( not ( = ?auto_475565 ?auto_475573 ) ) ( not ( = ?auto_475565 ?auto_475574 ) ) ( not ( = ?auto_475565 ?auto_475575 ) ) ( not ( = ?auto_475566 ?auto_475567 ) ) ( not ( = ?auto_475566 ?auto_475568 ) ) ( not ( = ?auto_475566 ?auto_475569 ) ) ( not ( = ?auto_475566 ?auto_475570 ) ) ( not ( = ?auto_475566 ?auto_475571 ) ) ( not ( = ?auto_475566 ?auto_475572 ) ) ( not ( = ?auto_475566 ?auto_475573 ) ) ( not ( = ?auto_475566 ?auto_475574 ) ) ( not ( = ?auto_475566 ?auto_475575 ) ) ( not ( = ?auto_475567 ?auto_475568 ) ) ( not ( = ?auto_475567 ?auto_475569 ) ) ( not ( = ?auto_475567 ?auto_475570 ) ) ( not ( = ?auto_475567 ?auto_475571 ) ) ( not ( = ?auto_475567 ?auto_475572 ) ) ( not ( = ?auto_475567 ?auto_475573 ) ) ( not ( = ?auto_475567 ?auto_475574 ) ) ( not ( = ?auto_475567 ?auto_475575 ) ) ( not ( = ?auto_475568 ?auto_475569 ) ) ( not ( = ?auto_475568 ?auto_475570 ) ) ( not ( = ?auto_475568 ?auto_475571 ) ) ( not ( = ?auto_475568 ?auto_475572 ) ) ( not ( = ?auto_475568 ?auto_475573 ) ) ( not ( = ?auto_475568 ?auto_475574 ) ) ( not ( = ?auto_475568 ?auto_475575 ) ) ( not ( = ?auto_475569 ?auto_475570 ) ) ( not ( = ?auto_475569 ?auto_475571 ) ) ( not ( = ?auto_475569 ?auto_475572 ) ) ( not ( = ?auto_475569 ?auto_475573 ) ) ( not ( = ?auto_475569 ?auto_475574 ) ) ( not ( = ?auto_475569 ?auto_475575 ) ) ( not ( = ?auto_475570 ?auto_475571 ) ) ( not ( = ?auto_475570 ?auto_475572 ) ) ( not ( = ?auto_475570 ?auto_475573 ) ) ( not ( = ?auto_475570 ?auto_475574 ) ) ( not ( = ?auto_475570 ?auto_475575 ) ) ( not ( = ?auto_475571 ?auto_475572 ) ) ( not ( = ?auto_475571 ?auto_475573 ) ) ( not ( = ?auto_475571 ?auto_475574 ) ) ( not ( = ?auto_475571 ?auto_475575 ) ) ( not ( = ?auto_475572 ?auto_475573 ) ) ( not ( = ?auto_475572 ?auto_475574 ) ) ( not ( = ?auto_475572 ?auto_475575 ) ) ( not ( = ?auto_475573 ?auto_475574 ) ) ( not ( = ?auto_475573 ?auto_475575 ) ) ( not ( = ?auto_475574 ?auto_475575 ) ) ( CLEAR ?auto_475572 ) ( ON ?auto_475573 ?auto_475574 ) ( CLEAR ?auto_475573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_475560 ?auto_475561 ?auto_475562 ?auto_475563 ?auto_475564 ?auto_475565 ?auto_475566 ?auto_475567 ?auto_475568 ?auto_475569 ?auto_475570 ?auto_475571 ?auto_475572 ?auto_475573 )
      ( MAKE-15PILE ?auto_475560 ?auto_475561 ?auto_475562 ?auto_475563 ?auto_475564 ?auto_475565 ?auto_475566 ?auto_475567 ?auto_475568 ?auto_475569 ?auto_475570 ?auto_475571 ?auto_475572 ?auto_475573 ?auto_475574 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475622 - BLOCK
      ?auto_475623 - BLOCK
      ?auto_475624 - BLOCK
      ?auto_475625 - BLOCK
      ?auto_475626 - BLOCK
      ?auto_475627 - BLOCK
      ?auto_475628 - BLOCK
      ?auto_475629 - BLOCK
      ?auto_475630 - BLOCK
      ?auto_475631 - BLOCK
      ?auto_475632 - BLOCK
      ?auto_475633 - BLOCK
      ?auto_475634 - BLOCK
      ?auto_475635 - BLOCK
      ?auto_475636 - BLOCK
    )
    :vars
    (
      ?auto_475637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475636 ?auto_475637 ) ( ON-TABLE ?auto_475622 ) ( ON ?auto_475623 ?auto_475622 ) ( ON ?auto_475624 ?auto_475623 ) ( ON ?auto_475625 ?auto_475624 ) ( ON ?auto_475626 ?auto_475625 ) ( ON ?auto_475627 ?auto_475626 ) ( ON ?auto_475628 ?auto_475627 ) ( ON ?auto_475629 ?auto_475628 ) ( ON ?auto_475630 ?auto_475629 ) ( ON ?auto_475631 ?auto_475630 ) ( ON ?auto_475632 ?auto_475631 ) ( ON ?auto_475633 ?auto_475632 ) ( not ( = ?auto_475622 ?auto_475623 ) ) ( not ( = ?auto_475622 ?auto_475624 ) ) ( not ( = ?auto_475622 ?auto_475625 ) ) ( not ( = ?auto_475622 ?auto_475626 ) ) ( not ( = ?auto_475622 ?auto_475627 ) ) ( not ( = ?auto_475622 ?auto_475628 ) ) ( not ( = ?auto_475622 ?auto_475629 ) ) ( not ( = ?auto_475622 ?auto_475630 ) ) ( not ( = ?auto_475622 ?auto_475631 ) ) ( not ( = ?auto_475622 ?auto_475632 ) ) ( not ( = ?auto_475622 ?auto_475633 ) ) ( not ( = ?auto_475622 ?auto_475634 ) ) ( not ( = ?auto_475622 ?auto_475635 ) ) ( not ( = ?auto_475622 ?auto_475636 ) ) ( not ( = ?auto_475622 ?auto_475637 ) ) ( not ( = ?auto_475623 ?auto_475624 ) ) ( not ( = ?auto_475623 ?auto_475625 ) ) ( not ( = ?auto_475623 ?auto_475626 ) ) ( not ( = ?auto_475623 ?auto_475627 ) ) ( not ( = ?auto_475623 ?auto_475628 ) ) ( not ( = ?auto_475623 ?auto_475629 ) ) ( not ( = ?auto_475623 ?auto_475630 ) ) ( not ( = ?auto_475623 ?auto_475631 ) ) ( not ( = ?auto_475623 ?auto_475632 ) ) ( not ( = ?auto_475623 ?auto_475633 ) ) ( not ( = ?auto_475623 ?auto_475634 ) ) ( not ( = ?auto_475623 ?auto_475635 ) ) ( not ( = ?auto_475623 ?auto_475636 ) ) ( not ( = ?auto_475623 ?auto_475637 ) ) ( not ( = ?auto_475624 ?auto_475625 ) ) ( not ( = ?auto_475624 ?auto_475626 ) ) ( not ( = ?auto_475624 ?auto_475627 ) ) ( not ( = ?auto_475624 ?auto_475628 ) ) ( not ( = ?auto_475624 ?auto_475629 ) ) ( not ( = ?auto_475624 ?auto_475630 ) ) ( not ( = ?auto_475624 ?auto_475631 ) ) ( not ( = ?auto_475624 ?auto_475632 ) ) ( not ( = ?auto_475624 ?auto_475633 ) ) ( not ( = ?auto_475624 ?auto_475634 ) ) ( not ( = ?auto_475624 ?auto_475635 ) ) ( not ( = ?auto_475624 ?auto_475636 ) ) ( not ( = ?auto_475624 ?auto_475637 ) ) ( not ( = ?auto_475625 ?auto_475626 ) ) ( not ( = ?auto_475625 ?auto_475627 ) ) ( not ( = ?auto_475625 ?auto_475628 ) ) ( not ( = ?auto_475625 ?auto_475629 ) ) ( not ( = ?auto_475625 ?auto_475630 ) ) ( not ( = ?auto_475625 ?auto_475631 ) ) ( not ( = ?auto_475625 ?auto_475632 ) ) ( not ( = ?auto_475625 ?auto_475633 ) ) ( not ( = ?auto_475625 ?auto_475634 ) ) ( not ( = ?auto_475625 ?auto_475635 ) ) ( not ( = ?auto_475625 ?auto_475636 ) ) ( not ( = ?auto_475625 ?auto_475637 ) ) ( not ( = ?auto_475626 ?auto_475627 ) ) ( not ( = ?auto_475626 ?auto_475628 ) ) ( not ( = ?auto_475626 ?auto_475629 ) ) ( not ( = ?auto_475626 ?auto_475630 ) ) ( not ( = ?auto_475626 ?auto_475631 ) ) ( not ( = ?auto_475626 ?auto_475632 ) ) ( not ( = ?auto_475626 ?auto_475633 ) ) ( not ( = ?auto_475626 ?auto_475634 ) ) ( not ( = ?auto_475626 ?auto_475635 ) ) ( not ( = ?auto_475626 ?auto_475636 ) ) ( not ( = ?auto_475626 ?auto_475637 ) ) ( not ( = ?auto_475627 ?auto_475628 ) ) ( not ( = ?auto_475627 ?auto_475629 ) ) ( not ( = ?auto_475627 ?auto_475630 ) ) ( not ( = ?auto_475627 ?auto_475631 ) ) ( not ( = ?auto_475627 ?auto_475632 ) ) ( not ( = ?auto_475627 ?auto_475633 ) ) ( not ( = ?auto_475627 ?auto_475634 ) ) ( not ( = ?auto_475627 ?auto_475635 ) ) ( not ( = ?auto_475627 ?auto_475636 ) ) ( not ( = ?auto_475627 ?auto_475637 ) ) ( not ( = ?auto_475628 ?auto_475629 ) ) ( not ( = ?auto_475628 ?auto_475630 ) ) ( not ( = ?auto_475628 ?auto_475631 ) ) ( not ( = ?auto_475628 ?auto_475632 ) ) ( not ( = ?auto_475628 ?auto_475633 ) ) ( not ( = ?auto_475628 ?auto_475634 ) ) ( not ( = ?auto_475628 ?auto_475635 ) ) ( not ( = ?auto_475628 ?auto_475636 ) ) ( not ( = ?auto_475628 ?auto_475637 ) ) ( not ( = ?auto_475629 ?auto_475630 ) ) ( not ( = ?auto_475629 ?auto_475631 ) ) ( not ( = ?auto_475629 ?auto_475632 ) ) ( not ( = ?auto_475629 ?auto_475633 ) ) ( not ( = ?auto_475629 ?auto_475634 ) ) ( not ( = ?auto_475629 ?auto_475635 ) ) ( not ( = ?auto_475629 ?auto_475636 ) ) ( not ( = ?auto_475629 ?auto_475637 ) ) ( not ( = ?auto_475630 ?auto_475631 ) ) ( not ( = ?auto_475630 ?auto_475632 ) ) ( not ( = ?auto_475630 ?auto_475633 ) ) ( not ( = ?auto_475630 ?auto_475634 ) ) ( not ( = ?auto_475630 ?auto_475635 ) ) ( not ( = ?auto_475630 ?auto_475636 ) ) ( not ( = ?auto_475630 ?auto_475637 ) ) ( not ( = ?auto_475631 ?auto_475632 ) ) ( not ( = ?auto_475631 ?auto_475633 ) ) ( not ( = ?auto_475631 ?auto_475634 ) ) ( not ( = ?auto_475631 ?auto_475635 ) ) ( not ( = ?auto_475631 ?auto_475636 ) ) ( not ( = ?auto_475631 ?auto_475637 ) ) ( not ( = ?auto_475632 ?auto_475633 ) ) ( not ( = ?auto_475632 ?auto_475634 ) ) ( not ( = ?auto_475632 ?auto_475635 ) ) ( not ( = ?auto_475632 ?auto_475636 ) ) ( not ( = ?auto_475632 ?auto_475637 ) ) ( not ( = ?auto_475633 ?auto_475634 ) ) ( not ( = ?auto_475633 ?auto_475635 ) ) ( not ( = ?auto_475633 ?auto_475636 ) ) ( not ( = ?auto_475633 ?auto_475637 ) ) ( not ( = ?auto_475634 ?auto_475635 ) ) ( not ( = ?auto_475634 ?auto_475636 ) ) ( not ( = ?auto_475634 ?auto_475637 ) ) ( not ( = ?auto_475635 ?auto_475636 ) ) ( not ( = ?auto_475635 ?auto_475637 ) ) ( not ( = ?auto_475636 ?auto_475637 ) ) ( ON ?auto_475635 ?auto_475636 ) ( CLEAR ?auto_475633 ) ( ON ?auto_475634 ?auto_475635 ) ( CLEAR ?auto_475634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_475622 ?auto_475623 ?auto_475624 ?auto_475625 ?auto_475626 ?auto_475627 ?auto_475628 ?auto_475629 ?auto_475630 ?auto_475631 ?auto_475632 ?auto_475633 ?auto_475634 )
      ( MAKE-15PILE ?auto_475622 ?auto_475623 ?auto_475624 ?auto_475625 ?auto_475626 ?auto_475627 ?auto_475628 ?auto_475629 ?auto_475630 ?auto_475631 ?auto_475632 ?auto_475633 ?auto_475634 ?auto_475635 ?auto_475636 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475684 - BLOCK
      ?auto_475685 - BLOCK
      ?auto_475686 - BLOCK
      ?auto_475687 - BLOCK
      ?auto_475688 - BLOCK
      ?auto_475689 - BLOCK
      ?auto_475690 - BLOCK
      ?auto_475691 - BLOCK
      ?auto_475692 - BLOCK
      ?auto_475693 - BLOCK
      ?auto_475694 - BLOCK
      ?auto_475695 - BLOCK
      ?auto_475696 - BLOCK
      ?auto_475697 - BLOCK
      ?auto_475698 - BLOCK
    )
    :vars
    (
      ?auto_475699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475698 ?auto_475699 ) ( ON-TABLE ?auto_475684 ) ( ON ?auto_475685 ?auto_475684 ) ( ON ?auto_475686 ?auto_475685 ) ( ON ?auto_475687 ?auto_475686 ) ( ON ?auto_475688 ?auto_475687 ) ( ON ?auto_475689 ?auto_475688 ) ( ON ?auto_475690 ?auto_475689 ) ( ON ?auto_475691 ?auto_475690 ) ( ON ?auto_475692 ?auto_475691 ) ( ON ?auto_475693 ?auto_475692 ) ( ON ?auto_475694 ?auto_475693 ) ( not ( = ?auto_475684 ?auto_475685 ) ) ( not ( = ?auto_475684 ?auto_475686 ) ) ( not ( = ?auto_475684 ?auto_475687 ) ) ( not ( = ?auto_475684 ?auto_475688 ) ) ( not ( = ?auto_475684 ?auto_475689 ) ) ( not ( = ?auto_475684 ?auto_475690 ) ) ( not ( = ?auto_475684 ?auto_475691 ) ) ( not ( = ?auto_475684 ?auto_475692 ) ) ( not ( = ?auto_475684 ?auto_475693 ) ) ( not ( = ?auto_475684 ?auto_475694 ) ) ( not ( = ?auto_475684 ?auto_475695 ) ) ( not ( = ?auto_475684 ?auto_475696 ) ) ( not ( = ?auto_475684 ?auto_475697 ) ) ( not ( = ?auto_475684 ?auto_475698 ) ) ( not ( = ?auto_475684 ?auto_475699 ) ) ( not ( = ?auto_475685 ?auto_475686 ) ) ( not ( = ?auto_475685 ?auto_475687 ) ) ( not ( = ?auto_475685 ?auto_475688 ) ) ( not ( = ?auto_475685 ?auto_475689 ) ) ( not ( = ?auto_475685 ?auto_475690 ) ) ( not ( = ?auto_475685 ?auto_475691 ) ) ( not ( = ?auto_475685 ?auto_475692 ) ) ( not ( = ?auto_475685 ?auto_475693 ) ) ( not ( = ?auto_475685 ?auto_475694 ) ) ( not ( = ?auto_475685 ?auto_475695 ) ) ( not ( = ?auto_475685 ?auto_475696 ) ) ( not ( = ?auto_475685 ?auto_475697 ) ) ( not ( = ?auto_475685 ?auto_475698 ) ) ( not ( = ?auto_475685 ?auto_475699 ) ) ( not ( = ?auto_475686 ?auto_475687 ) ) ( not ( = ?auto_475686 ?auto_475688 ) ) ( not ( = ?auto_475686 ?auto_475689 ) ) ( not ( = ?auto_475686 ?auto_475690 ) ) ( not ( = ?auto_475686 ?auto_475691 ) ) ( not ( = ?auto_475686 ?auto_475692 ) ) ( not ( = ?auto_475686 ?auto_475693 ) ) ( not ( = ?auto_475686 ?auto_475694 ) ) ( not ( = ?auto_475686 ?auto_475695 ) ) ( not ( = ?auto_475686 ?auto_475696 ) ) ( not ( = ?auto_475686 ?auto_475697 ) ) ( not ( = ?auto_475686 ?auto_475698 ) ) ( not ( = ?auto_475686 ?auto_475699 ) ) ( not ( = ?auto_475687 ?auto_475688 ) ) ( not ( = ?auto_475687 ?auto_475689 ) ) ( not ( = ?auto_475687 ?auto_475690 ) ) ( not ( = ?auto_475687 ?auto_475691 ) ) ( not ( = ?auto_475687 ?auto_475692 ) ) ( not ( = ?auto_475687 ?auto_475693 ) ) ( not ( = ?auto_475687 ?auto_475694 ) ) ( not ( = ?auto_475687 ?auto_475695 ) ) ( not ( = ?auto_475687 ?auto_475696 ) ) ( not ( = ?auto_475687 ?auto_475697 ) ) ( not ( = ?auto_475687 ?auto_475698 ) ) ( not ( = ?auto_475687 ?auto_475699 ) ) ( not ( = ?auto_475688 ?auto_475689 ) ) ( not ( = ?auto_475688 ?auto_475690 ) ) ( not ( = ?auto_475688 ?auto_475691 ) ) ( not ( = ?auto_475688 ?auto_475692 ) ) ( not ( = ?auto_475688 ?auto_475693 ) ) ( not ( = ?auto_475688 ?auto_475694 ) ) ( not ( = ?auto_475688 ?auto_475695 ) ) ( not ( = ?auto_475688 ?auto_475696 ) ) ( not ( = ?auto_475688 ?auto_475697 ) ) ( not ( = ?auto_475688 ?auto_475698 ) ) ( not ( = ?auto_475688 ?auto_475699 ) ) ( not ( = ?auto_475689 ?auto_475690 ) ) ( not ( = ?auto_475689 ?auto_475691 ) ) ( not ( = ?auto_475689 ?auto_475692 ) ) ( not ( = ?auto_475689 ?auto_475693 ) ) ( not ( = ?auto_475689 ?auto_475694 ) ) ( not ( = ?auto_475689 ?auto_475695 ) ) ( not ( = ?auto_475689 ?auto_475696 ) ) ( not ( = ?auto_475689 ?auto_475697 ) ) ( not ( = ?auto_475689 ?auto_475698 ) ) ( not ( = ?auto_475689 ?auto_475699 ) ) ( not ( = ?auto_475690 ?auto_475691 ) ) ( not ( = ?auto_475690 ?auto_475692 ) ) ( not ( = ?auto_475690 ?auto_475693 ) ) ( not ( = ?auto_475690 ?auto_475694 ) ) ( not ( = ?auto_475690 ?auto_475695 ) ) ( not ( = ?auto_475690 ?auto_475696 ) ) ( not ( = ?auto_475690 ?auto_475697 ) ) ( not ( = ?auto_475690 ?auto_475698 ) ) ( not ( = ?auto_475690 ?auto_475699 ) ) ( not ( = ?auto_475691 ?auto_475692 ) ) ( not ( = ?auto_475691 ?auto_475693 ) ) ( not ( = ?auto_475691 ?auto_475694 ) ) ( not ( = ?auto_475691 ?auto_475695 ) ) ( not ( = ?auto_475691 ?auto_475696 ) ) ( not ( = ?auto_475691 ?auto_475697 ) ) ( not ( = ?auto_475691 ?auto_475698 ) ) ( not ( = ?auto_475691 ?auto_475699 ) ) ( not ( = ?auto_475692 ?auto_475693 ) ) ( not ( = ?auto_475692 ?auto_475694 ) ) ( not ( = ?auto_475692 ?auto_475695 ) ) ( not ( = ?auto_475692 ?auto_475696 ) ) ( not ( = ?auto_475692 ?auto_475697 ) ) ( not ( = ?auto_475692 ?auto_475698 ) ) ( not ( = ?auto_475692 ?auto_475699 ) ) ( not ( = ?auto_475693 ?auto_475694 ) ) ( not ( = ?auto_475693 ?auto_475695 ) ) ( not ( = ?auto_475693 ?auto_475696 ) ) ( not ( = ?auto_475693 ?auto_475697 ) ) ( not ( = ?auto_475693 ?auto_475698 ) ) ( not ( = ?auto_475693 ?auto_475699 ) ) ( not ( = ?auto_475694 ?auto_475695 ) ) ( not ( = ?auto_475694 ?auto_475696 ) ) ( not ( = ?auto_475694 ?auto_475697 ) ) ( not ( = ?auto_475694 ?auto_475698 ) ) ( not ( = ?auto_475694 ?auto_475699 ) ) ( not ( = ?auto_475695 ?auto_475696 ) ) ( not ( = ?auto_475695 ?auto_475697 ) ) ( not ( = ?auto_475695 ?auto_475698 ) ) ( not ( = ?auto_475695 ?auto_475699 ) ) ( not ( = ?auto_475696 ?auto_475697 ) ) ( not ( = ?auto_475696 ?auto_475698 ) ) ( not ( = ?auto_475696 ?auto_475699 ) ) ( not ( = ?auto_475697 ?auto_475698 ) ) ( not ( = ?auto_475697 ?auto_475699 ) ) ( not ( = ?auto_475698 ?auto_475699 ) ) ( ON ?auto_475697 ?auto_475698 ) ( ON ?auto_475696 ?auto_475697 ) ( CLEAR ?auto_475694 ) ( ON ?auto_475695 ?auto_475696 ) ( CLEAR ?auto_475695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_475684 ?auto_475685 ?auto_475686 ?auto_475687 ?auto_475688 ?auto_475689 ?auto_475690 ?auto_475691 ?auto_475692 ?auto_475693 ?auto_475694 ?auto_475695 )
      ( MAKE-15PILE ?auto_475684 ?auto_475685 ?auto_475686 ?auto_475687 ?auto_475688 ?auto_475689 ?auto_475690 ?auto_475691 ?auto_475692 ?auto_475693 ?auto_475694 ?auto_475695 ?auto_475696 ?auto_475697 ?auto_475698 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475746 - BLOCK
      ?auto_475747 - BLOCK
      ?auto_475748 - BLOCK
      ?auto_475749 - BLOCK
      ?auto_475750 - BLOCK
      ?auto_475751 - BLOCK
      ?auto_475752 - BLOCK
      ?auto_475753 - BLOCK
      ?auto_475754 - BLOCK
      ?auto_475755 - BLOCK
      ?auto_475756 - BLOCK
      ?auto_475757 - BLOCK
      ?auto_475758 - BLOCK
      ?auto_475759 - BLOCK
      ?auto_475760 - BLOCK
    )
    :vars
    (
      ?auto_475761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475760 ?auto_475761 ) ( ON-TABLE ?auto_475746 ) ( ON ?auto_475747 ?auto_475746 ) ( ON ?auto_475748 ?auto_475747 ) ( ON ?auto_475749 ?auto_475748 ) ( ON ?auto_475750 ?auto_475749 ) ( ON ?auto_475751 ?auto_475750 ) ( ON ?auto_475752 ?auto_475751 ) ( ON ?auto_475753 ?auto_475752 ) ( ON ?auto_475754 ?auto_475753 ) ( ON ?auto_475755 ?auto_475754 ) ( not ( = ?auto_475746 ?auto_475747 ) ) ( not ( = ?auto_475746 ?auto_475748 ) ) ( not ( = ?auto_475746 ?auto_475749 ) ) ( not ( = ?auto_475746 ?auto_475750 ) ) ( not ( = ?auto_475746 ?auto_475751 ) ) ( not ( = ?auto_475746 ?auto_475752 ) ) ( not ( = ?auto_475746 ?auto_475753 ) ) ( not ( = ?auto_475746 ?auto_475754 ) ) ( not ( = ?auto_475746 ?auto_475755 ) ) ( not ( = ?auto_475746 ?auto_475756 ) ) ( not ( = ?auto_475746 ?auto_475757 ) ) ( not ( = ?auto_475746 ?auto_475758 ) ) ( not ( = ?auto_475746 ?auto_475759 ) ) ( not ( = ?auto_475746 ?auto_475760 ) ) ( not ( = ?auto_475746 ?auto_475761 ) ) ( not ( = ?auto_475747 ?auto_475748 ) ) ( not ( = ?auto_475747 ?auto_475749 ) ) ( not ( = ?auto_475747 ?auto_475750 ) ) ( not ( = ?auto_475747 ?auto_475751 ) ) ( not ( = ?auto_475747 ?auto_475752 ) ) ( not ( = ?auto_475747 ?auto_475753 ) ) ( not ( = ?auto_475747 ?auto_475754 ) ) ( not ( = ?auto_475747 ?auto_475755 ) ) ( not ( = ?auto_475747 ?auto_475756 ) ) ( not ( = ?auto_475747 ?auto_475757 ) ) ( not ( = ?auto_475747 ?auto_475758 ) ) ( not ( = ?auto_475747 ?auto_475759 ) ) ( not ( = ?auto_475747 ?auto_475760 ) ) ( not ( = ?auto_475747 ?auto_475761 ) ) ( not ( = ?auto_475748 ?auto_475749 ) ) ( not ( = ?auto_475748 ?auto_475750 ) ) ( not ( = ?auto_475748 ?auto_475751 ) ) ( not ( = ?auto_475748 ?auto_475752 ) ) ( not ( = ?auto_475748 ?auto_475753 ) ) ( not ( = ?auto_475748 ?auto_475754 ) ) ( not ( = ?auto_475748 ?auto_475755 ) ) ( not ( = ?auto_475748 ?auto_475756 ) ) ( not ( = ?auto_475748 ?auto_475757 ) ) ( not ( = ?auto_475748 ?auto_475758 ) ) ( not ( = ?auto_475748 ?auto_475759 ) ) ( not ( = ?auto_475748 ?auto_475760 ) ) ( not ( = ?auto_475748 ?auto_475761 ) ) ( not ( = ?auto_475749 ?auto_475750 ) ) ( not ( = ?auto_475749 ?auto_475751 ) ) ( not ( = ?auto_475749 ?auto_475752 ) ) ( not ( = ?auto_475749 ?auto_475753 ) ) ( not ( = ?auto_475749 ?auto_475754 ) ) ( not ( = ?auto_475749 ?auto_475755 ) ) ( not ( = ?auto_475749 ?auto_475756 ) ) ( not ( = ?auto_475749 ?auto_475757 ) ) ( not ( = ?auto_475749 ?auto_475758 ) ) ( not ( = ?auto_475749 ?auto_475759 ) ) ( not ( = ?auto_475749 ?auto_475760 ) ) ( not ( = ?auto_475749 ?auto_475761 ) ) ( not ( = ?auto_475750 ?auto_475751 ) ) ( not ( = ?auto_475750 ?auto_475752 ) ) ( not ( = ?auto_475750 ?auto_475753 ) ) ( not ( = ?auto_475750 ?auto_475754 ) ) ( not ( = ?auto_475750 ?auto_475755 ) ) ( not ( = ?auto_475750 ?auto_475756 ) ) ( not ( = ?auto_475750 ?auto_475757 ) ) ( not ( = ?auto_475750 ?auto_475758 ) ) ( not ( = ?auto_475750 ?auto_475759 ) ) ( not ( = ?auto_475750 ?auto_475760 ) ) ( not ( = ?auto_475750 ?auto_475761 ) ) ( not ( = ?auto_475751 ?auto_475752 ) ) ( not ( = ?auto_475751 ?auto_475753 ) ) ( not ( = ?auto_475751 ?auto_475754 ) ) ( not ( = ?auto_475751 ?auto_475755 ) ) ( not ( = ?auto_475751 ?auto_475756 ) ) ( not ( = ?auto_475751 ?auto_475757 ) ) ( not ( = ?auto_475751 ?auto_475758 ) ) ( not ( = ?auto_475751 ?auto_475759 ) ) ( not ( = ?auto_475751 ?auto_475760 ) ) ( not ( = ?auto_475751 ?auto_475761 ) ) ( not ( = ?auto_475752 ?auto_475753 ) ) ( not ( = ?auto_475752 ?auto_475754 ) ) ( not ( = ?auto_475752 ?auto_475755 ) ) ( not ( = ?auto_475752 ?auto_475756 ) ) ( not ( = ?auto_475752 ?auto_475757 ) ) ( not ( = ?auto_475752 ?auto_475758 ) ) ( not ( = ?auto_475752 ?auto_475759 ) ) ( not ( = ?auto_475752 ?auto_475760 ) ) ( not ( = ?auto_475752 ?auto_475761 ) ) ( not ( = ?auto_475753 ?auto_475754 ) ) ( not ( = ?auto_475753 ?auto_475755 ) ) ( not ( = ?auto_475753 ?auto_475756 ) ) ( not ( = ?auto_475753 ?auto_475757 ) ) ( not ( = ?auto_475753 ?auto_475758 ) ) ( not ( = ?auto_475753 ?auto_475759 ) ) ( not ( = ?auto_475753 ?auto_475760 ) ) ( not ( = ?auto_475753 ?auto_475761 ) ) ( not ( = ?auto_475754 ?auto_475755 ) ) ( not ( = ?auto_475754 ?auto_475756 ) ) ( not ( = ?auto_475754 ?auto_475757 ) ) ( not ( = ?auto_475754 ?auto_475758 ) ) ( not ( = ?auto_475754 ?auto_475759 ) ) ( not ( = ?auto_475754 ?auto_475760 ) ) ( not ( = ?auto_475754 ?auto_475761 ) ) ( not ( = ?auto_475755 ?auto_475756 ) ) ( not ( = ?auto_475755 ?auto_475757 ) ) ( not ( = ?auto_475755 ?auto_475758 ) ) ( not ( = ?auto_475755 ?auto_475759 ) ) ( not ( = ?auto_475755 ?auto_475760 ) ) ( not ( = ?auto_475755 ?auto_475761 ) ) ( not ( = ?auto_475756 ?auto_475757 ) ) ( not ( = ?auto_475756 ?auto_475758 ) ) ( not ( = ?auto_475756 ?auto_475759 ) ) ( not ( = ?auto_475756 ?auto_475760 ) ) ( not ( = ?auto_475756 ?auto_475761 ) ) ( not ( = ?auto_475757 ?auto_475758 ) ) ( not ( = ?auto_475757 ?auto_475759 ) ) ( not ( = ?auto_475757 ?auto_475760 ) ) ( not ( = ?auto_475757 ?auto_475761 ) ) ( not ( = ?auto_475758 ?auto_475759 ) ) ( not ( = ?auto_475758 ?auto_475760 ) ) ( not ( = ?auto_475758 ?auto_475761 ) ) ( not ( = ?auto_475759 ?auto_475760 ) ) ( not ( = ?auto_475759 ?auto_475761 ) ) ( not ( = ?auto_475760 ?auto_475761 ) ) ( ON ?auto_475759 ?auto_475760 ) ( ON ?auto_475758 ?auto_475759 ) ( ON ?auto_475757 ?auto_475758 ) ( CLEAR ?auto_475755 ) ( ON ?auto_475756 ?auto_475757 ) ( CLEAR ?auto_475756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_475746 ?auto_475747 ?auto_475748 ?auto_475749 ?auto_475750 ?auto_475751 ?auto_475752 ?auto_475753 ?auto_475754 ?auto_475755 ?auto_475756 )
      ( MAKE-15PILE ?auto_475746 ?auto_475747 ?auto_475748 ?auto_475749 ?auto_475750 ?auto_475751 ?auto_475752 ?auto_475753 ?auto_475754 ?auto_475755 ?auto_475756 ?auto_475757 ?auto_475758 ?auto_475759 ?auto_475760 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475808 - BLOCK
      ?auto_475809 - BLOCK
      ?auto_475810 - BLOCK
      ?auto_475811 - BLOCK
      ?auto_475812 - BLOCK
      ?auto_475813 - BLOCK
      ?auto_475814 - BLOCK
      ?auto_475815 - BLOCK
      ?auto_475816 - BLOCK
      ?auto_475817 - BLOCK
      ?auto_475818 - BLOCK
      ?auto_475819 - BLOCK
      ?auto_475820 - BLOCK
      ?auto_475821 - BLOCK
      ?auto_475822 - BLOCK
    )
    :vars
    (
      ?auto_475823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475822 ?auto_475823 ) ( ON-TABLE ?auto_475808 ) ( ON ?auto_475809 ?auto_475808 ) ( ON ?auto_475810 ?auto_475809 ) ( ON ?auto_475811 ?auto_475810 ) ( ON ?auto_475812 ?auto_475811 ) ( ON ?auto_475813 ?auto_475812 ) ( ON ?auto_475814 ?auto_475813 ) ( ON ?auto_475815 ?auto_475814 ) ( ON ?auto_475816 ?auto_475815 ) ( not ( = ?auto_475808 ?auto_475809 ) ) ( not ( = ?auto_475808 ?auto_475810 ) ) ( not ( = ?auto_475808 ?auto_475811 ) ) ( not ( = ?auto_475808 ?auto_475812 ) ) ( not ( = ?auto_475808 ?auto_475813 ) ) ( not ( = ?auto_475808 ?auto_475814 ) ) ( not ( = ?auto_475808 ?auto_475815 ) ) ( not ( = ?auto_475808 ?auto_475816 ) ) ( not ( = ?auto_475808 ?auto_475817 ) ) ( not ( = ?auto_475808 ?auto_475818 ) ) ( not ( = ?auto_475808 ?auto_475819 ) ) ( not ( = ?auto_475808 ?auto_475820 ) ) ( not ( = ?auto_475808 ?auto_475821 ) ) ( not ( = ?auto_475808 ?auto_475822 ) ) ( not ( = ?auto_475808 ?auto_475823 ) ) ( not ( = ?auto_475809 ?auto_475810 ) ) ( not ( = ?auto_475809 ?auto_475811 ) ) ( not ( = ?auto_475809 ?auto_475812 ) ) ( not ( = ?auto_475809 ?auto_475813 ) ) ( not ( = ?auto_475809 ?auto_475814 ) ) ( not ( = ?auto_475809 ?auto_475815 ) ) ( not ( = ?auto_475809 ?auto_475816 ) ) ( not ( = ?auto_475809 ?auto_475817 ) ) ( not ( = ?auto_475809 ?auto_475818 ) ) ( not ( = ?auto_475809 ?auto_475819 ) ) ( not ( = ?auto_475809 ?auto_475820 ) ) ( not ( = ?auto_475809 ?auto_475821 ) ) ( not ( = ?auto_475809 ?auto_475822 ) ) ( not ( = ?auto_475809 ?auto_475823 ) ) ( not ( = ?auto_475810 ?auto_475811 ) ) ( not ( = ?auto_475810 ?auto_475812 ) ) ( not ( = ?auto_475810 ?auto_475813 ) ) ( not ( = ?auto_475810 ?auto_475814 ) ) ( not ( = ?auto_475810 ?auto_475815 ) ) ( not ( = ?auto_475810 ?auto_475816 ) ) ( not ( = ?auto_475810 ?auto_475817 ) ) ( not ( = ?auto_475810 ?auto_475818 ) ) ( not ( = ?auto_475810 ?auto_475819 ) ) ( not ( = ?auto_475810 ?auto_475820 ) ) ( not ( = ?auto_475810 ?auto_475821 ) ) ( not ( = ?auto_475810 ?auto_475822 ) ) ( not ( = ?auto_475810 ?auto_475823 ) ) ( not ( = ?auto_475811 ?auto_475812 ) ) ( not ( = ?auto_475811 ?auto_475813 ) ) ( not ( = ?auto_475811 ?auto_475814 ) ) ( not ( = ?auto_475811 ?auto_475815 ) ) ( not ( = ?auto_475811 ?auto_475816 ) ) ( not ( = ?auto_475811 ?auto_475817 ) ) ( not ( = ?auto_475811 ?auto_475818 ) ) ( not ( = ?auto_475811 ?auto_475819 ) ) ( not ( = ?auto_475811 ?auto_475820 ) ) ( not ( = ?auto_475811 ?auto_475821 ) ) ( not ( = ?auto_475811 ?auto_475822 ) ) ( not ( = ?auto_475811 ?auto_475823 ) ) ( not ( = ?auto_475812 ?auto_475813 ) ) ( not ( = ?auto_475812 ?auto_475814 ) ) ( not ( = ?auto_475812 ?auto_475815 ) ) ( not ( = ?auto_475812 ?auto_475816 ) ) ( not ( = ?auto_475812 ?auto_475817 ) ) ( not ( = ?auto_475812 ?auto_475818 ) ) ( not ( = ?auto_475812 ?auto_475819 ) ) ( not ( = ?auto_475812 ?auto_475820 ) ) ( not ( = ?auto_475812 ?auto_475821 ) ) ( not ( = ?auto_475812 ?auto_475822 ) ) ( not ( = ?auto_475812 ?auto_475823 ) ) ( not ( = ?auto_475813 ?auto_475814 ) ) ( not ( = ?auto_475813 ?auto_475815 ) ) ( not ( = ?auto_475813 ?auto_475816 ) ) ( not ( = ?auto_475813 ?auto_475817 ) ) ( not ( = ?auto_475813 ?auto_475818 ) ) ( not ( = ?auto_475813 ?auto_475819 ) ) ( not ( = ?auto_475813 ?auto_475820 ) ) ( not ( = ?auto_475813 ?auto_475821 ) ) ( not ( = ?auto_475813 ?auto_475822 ) ) ( not ( = ?auto_475813 ?auto_475823 ) ) ( not ( = ?auto_475814 ?auto_475815 ) ) ( not ( = ?auto_475814 ?auto_475816 ) ) ( not ( = ?auto_475814 ?auto_475817 ) ) ( not ( = ?auto_475814 ?auto_475818 ) ) ( not ( = ?auto_475814 ?auto_475819 ) ) ( not ( = ?auto_475814 ?auto_475820 ) ) ( not ( = ?auto_475814 ?auto_475821 ) ) ( not ( = ?auto_475814 ?auto_475822 ) ) ( not ( = ?auto_475814 ?auto_475823 ) ) ( not ( = ?auto_475815 ?auto_475816 ) ) ( not ( = ?auto_475815 ?auto_475817 ) ) ( not ( = ?auto_475815 ?auto_475818 ) ) ( not ( = ?auto_475815 ?auto_475819 ) ) ( not ( = ?auto_475815 ?auto_475820 ) ) ( not ( = ?auto_475815 ?auto_475821 ) ) ( not ( = ?auto_475815 ?auto_475822 ) ) ( not ( = ?auto_475815 ?auto_475823 ) ) ( not ( = ?auto_475816 ?auto_475817 ) ) ( not ( = ?auto_475816 ?auto_475818 ) ) ( not ( = ?auto_475816 ?auto_475819 ) ) ( not ( = ?auto_475816 ?auto_475820 ) ) ( not ( = ?auto_475816 ?auto_475821 ) ) ( not ( = ?auto_475816 ?auto_475822 ) ) ( not ( = ?auto_475816 ?auto_475823 ) ) ( not ( = ?auto_475817 ?auto_475818 ) ) ( not ( = ?auto_475817 ?auto_475819 ) ) ( not ( = ?auto_475817 ?auto_475820 ) ) ( not ( = ?auto_475817 ?auto_475821 ) ) ( not ( = ?auto_475817 ?auto_475822 ) ) ( not ( = ?auto_475817 ?auto_475823 ) ) ( not ( = ?auto_475818 ?auto_475819 ) ) ( not ( = ?auto_475818 ?auto_475820 ) ) ( not ( = ?auto_475818 ?auto_475821 ) ) ( not ( = ?auto_475818 ?auto_475822 ) ) ( not ( = ?auto_475818 ?auto_475823 ) ) ( not ( = ?auto_475819 ?auto_475820 ) ) ( not ( = ?auto_475819 ?auto_475821 ) ) ( not ( = ?auto_475819 ?auto_475822 ) ) ( not ( = ?auto_475819 ?auto_475823 ) ) ( not ( = ?auto_475820 ?auto_475821 ) ) ( not ( = ?auto_475820 ?auto_475822 ) ) ( not ( = ?auto_475820 ?auto_475823 ) ) ( not ( = ?auto_475821 ?auto_475822 ) ) ( not ( = ?auto_475821 ?auto_475823 ) ) ( not ( = ?auto_475822 ?auto_475823 ) ) ( ON ?auto_475821 ?auto_475822 ) ( ON ?auto_475820 ?auto_475821 ) ( ON ?auto_475819 ?auto_475820 ) ( ON ?auto_475818 ?auto_475819 ) ( CLEAR ?auto_475816 ) ( ON ?auto_475817 ?auto_475818 ) ( CLEAR ?auto_475817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_475808 ?auto_475809 ?auto_475810 ?auto_475811 ?auto_475812 ?auto_475813 ?auto_475814 ?auto_475815 ?auto_475816 ?auto_475817 )
      ( MAKE-15PILE ?auto_475808 ?auto_475809 ?auto_475810 ?auto_475811 ?auto_475812 ?auto_475813 ?auto_475814 ?auto_475815 ?auto_475816 ?auto_475817 ?auto_475818 ?auto_475819 ?auto_475820 ?auto_475821 ?auto_475822 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475870 - BLOCK
      ?auto_475871 - BLOCK
      ?auto_475872 - BLOCK
      ?auto_475873 - BLOCK
      ?auto_475874 - BLOCK
      ?auto_475875 - BLOCK
      ?auto_475876 - BLOCK
      ?auto_475877 - BLOCK
      ?auto_475878 - BLOCK
      ?auto_475879 - BLOCK
      ?auto_475880 - BLOCK
      ?auto_475881 - BLOCK
      ?auto_475882 - BLOCK
      ?auto_475883 - BLOCK
      ?auto_475884 - BLOCK
    )
    :vars
    (
      ?auto_475885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475884 ?auto_475885 ) ( ON-TABLE ?auto_475870 ) ( ON ?auto_475871 ?auto_475870 ) ( ON ?auto_475872 ?auto_475871 ) ( ON ?auto_475873 ?auto_475872 ) ( ON ?auto_475874 ?auto_475873 ) ( ON ?auto_475875 ?auto_475874 ) ( ON ?auto_475876 ?auto_475875 ) ( ON ?auto_475877 ?auto_475876 ) ( not ( = ?auto_475870 ?auto_475871 ) ) ( not ( = ?auto_475870 ?auto_475872 ) ) ( not ( = ?auto_475870 ?auto_475873 ) ) ( not ( = ?auto_475870 ?auto_475874 ) ) ( not ( = ?auto_475870 ?auto_475875 ) ) ( not ( = ?auto_475870 ?auto_475876 ) ) ( not ( = ?auto_475870 ?auto_475877 ) ) ( not ( = ?auto_475870 ?auto_475878 ) ) ( not ( = ?auto_475870 ?auto_475879 ) ) ( not ( = ?auto_475870 ?auto_475880 ) ) ( not ( = ?auto_475870 ?auto_475881 ) ) ( not ( = ?auto_475870 ?auto_475882 ) ) ( not ( = ?auto_475870 ?auto_475883 ) ) ( not ( = ?auto_475870 ?auto_475884 ) ) ( not ( = ?auto_475870 ?auto_475885 ) ) ( not ( = ?auto_475871 ?auto_475872 ) ) ( not ( = ?auto_475871 ?auto_475873 ) ) ( not ( = ?auto_475871 ?auto_475874 ) ) ( not ( = ?auto_475871 ?auto_475875 ) ) ( not ( = ?auto_475871 ?auto_475876 ) ) ( not ( = ?auto_475871 ?auto_475877 ) ) ( not ( = ?auto_475871 ?auto_475878 ) ) ( not ( = ?auto_475871 ?auto_475879 ) ) ( not ( = ?auto_475871 ?auto_475880 ) ) ( not ( = ?auto_475871 ?auto_475881 ) ) ( not ( = ?auto_475871 ?auto_475882 ) ) ( not ( = ?auto_475871 ?auto_475883 ) ) ( not ( = ?auto_475871 ?auto_475884 ) ) ( not ( = ?auto_475871 ?auto_475885 ) ) ( not ( = ?auto_475872 ?auto_475873 ) ) ( not ( = ?auto_475872 ?auto_475874 ) ) ( not ( = ?auto_475872 ?auto_475875 ) ) ( not ( = ?auto_475872 ?auto_475876 ) ) ( not ( = ?auto_475872 ?auto_475877 ) ) ( not ( = ?auto_475872 ?auto_475878 ) ) ( not ( = ?auto_475872 ?auto_475879 ) ) ( not ( = ?auto_475872 ?auto_475880 ) ) ( not ( = ?auto_475872 ?auto_475881 ) ) ( not ( = ?auto_475872 ?auto_475882 ) ) ( not ( = ?auto_475872 ?auto_475883 ) ) ( not ( = ?auto_475872 ?auto_475884 ) ) ( not ( = ?auto_475872 ?auto_475885 ) ) ( not ( = ?auto_475873 ?auto_475874 ) ) ( not ( = ?auto_475873 ?auto_475875 ) ) ( not ( = ?auto_475873 ?auto_475876 ) ) ( not ( = ?auto_475873 ?auto_475877 ) ) ( not ( = ?auto_475873 ?auto_475878 ) ) ( not ( = ?auto_475873 ?auto_475879 ) ) ( not ( = ?auto_475873 ?auto_475880 ) ) ( not ( = ?auto_475873 ?auto_475881 ) ) ( not ( = ?auto_475873 ?auto_475882 ) ) ( not ( = ?auto_475873 ?auto_475883 ) ) ( not ( = ?auto_475873 ?auto_475884 ) ) ( not ( = ?auto_475873 ?auto_475885 ) ) ( not ( = ?auto_475874 ?auto_475875 ) ) ( not ( = ?auto_475874 ?auto_475876 ) ) ( not ( = ?auto_475874 ?auto_475877 ) ) ( not ( = ?auto_475874 ?auto_475878 ) ) ( not ( = ?auto_475874 ?auto_475879 ) ) ( not ( = ?auto_475874 ?auto_475880 ) ) ( not ( = ?auto_475874 ?auto_475881 ) ) ( not ( = ?auto_475874 ?auto_475882 ) ) ( not ( = ?auto_475874 ?auto_475883 ) ) ( not ( = ?auto_475874 ?auto_475884 ) ) ( not ( = ?auto_475874 ?auto_475885 ) ) ( not ( = ?auto_475875 ?auto_475876 ) ) ( not ( = ?auto_475875 ?auto_475877 ) ) ( not ( = ?auto_475875 ?auto_475878 ) ) ( not ( = ?auto_475875 ?auto_475879 ) ) ( not ( = ?auto_475875 ?auto_475880 ) ) ( not ( = ?auto_475875 ?auto_475881 ) ) ( not ( = ?auto_475875 ?auto_475882 ) ) ( not ( = ?auto_475875 ?auto_475883 ) ) ( not ( = ?auto_475875 ?auto_475884 ) ) ( not ( = ?auto_475875 ?auto_475885 ) ) ( not ( = ?auto_475876 ?auto_475877 ) ) ( not ( = ?auto_475876 ?auto_475878 ) ) ( not ( = ?auto_475876 ?auto_475879 ) ) ( not ( = ?auto_475876 ?auto_475880 ) ) ( not ( = ?auto_475876 ?auto_475881 ) ) ( not ( = ?auto_475876 ?auto_475882 ) ) ( not ( = ?auto_475876 ?auto_475883 ) ) ( not ( = ?auto_475876 ?auto_475884 ) ) ( not ( = ?auto_475876 ?auto_475885 ) ) ( not ( = ?auto_475877 ?auto_475878 ) ) ( not ( = ?auto_475877 ?auto_475879 ) ) ( not ( = ?auto_475877 ?auto_475880 ) ) ( not ( = ?auto_475877 ?auto_475881 ) ) ( not ( = ?auto_475877 ?auto_475882 ) ) ( not ( = ?auto_475877 ?auto_475883 ) ) ( not ( = ?auto_475877 ?auto_475884 ) ) ( not ( = ?auto_475877 ?auto_475885 ) ) ( not ( = ?auto_475878 ?auto_475879 ) ) ( not ( = ?auto_475878 ?auto_475880 ) ) ( not ( = ?auto_475878 ?auto_475881 ) ) ( not ( = ?auto_475878 ?auto_475882 ) ) ( not ( = ?auto_475878 ?auto_475883 ) ) ( not ( = ?auto_475878 ?auto_475884 ) ) ( not ( = ?auto_475878 ?auto_475885 ) ) ( not ( = ?auto_475879 ?auto_475880 ) ) ( not ( = ?auto_475879 ?auto_475881 ) ) ( not ( = ?auto_475879 ?auto_475882 ) ) ( not ( = ?auto_475879 ?auto_475883 ) ) ( not ( = ?auto_475879 ?auto_475884 ) ) ( not ( = ?auto_475879 ?auto_475885 ) ) ( not ( = ?auto_475880 ?auto_475881 ) ) ( not ( = ?auto_475880 ?auto_475882 ) ) ( not ( = ?auto_475880 ?auto_475883 ) ) ( not ( = ?auto_475880 ?auto_475884 ) ) ( not ( = ?auto_475880 ?auto_475885 ) ) ( not ( = ?auto_475881 ?auto_475882 ) ) ( not ( = ?auto_475881 ?auto_475883 ) ) ( not ( = ?auto_475881 ?auto_475884 ) ) ( not ( = ?auto_475881 ?auto_475885 ) ) ( not ( = ?auto_475882 ?auto_475883 ) ) ( not ( = ?auto_475882 ?auto_475884 ) ) ( not ( = ?auto_475882 ?auto_475885 ) ) ( not ( = ?auto_475883 ?auto_475884 ) ) ( not ( = ?auto_475883 ?auto_475885 ) ) ( not ( = ?auto_475884 ?auto_475885 ) ) ( ON ?auto_475883 ?auto_475884 ) ( ON ?auto_475882 ?auto_475883 ) ( ON ?auto_475881 ?auto_475882 ) ( ON ?auto_475880 ?auto_475881 ) ( ON ?auto_475879 ?auto_475880 ) ( CLEAR ?auto_475877 ) ( ON ?auto_475878 ?auto_475879 ) ( CLEAR ?auto_475878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_475870 ?auto_475871 ?auto_475872 ?auto_475873 ?auto_475874 ?auto_475875 ?auto_475876 ?auto_475877 ?auto_475878 )
      ( MAKE-15PILE ?auto_475870 ?auto_475871 ?auto_475872 ?auto_475873 ?auto_475874 ?auto_475875 ?auto_475876 ?auto_475877 ?auto_475878 ?auto_475879 ?auto_475880 ?auto_475881 ?auto_475882 ?auto_475883 ?auto_475884 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475932 - BLOCK
      ?auto_475933 - BLOCK
      ?auto_475934 - BLOCK
      ?auto_475935 - BLOCK
      ?auto_475936 - BLOCK
      ?auto_475937 - BLOCK
      ?auto_475938 - BLOCK
      ?auto_475939 - BLOCK
      ?auto_475940 - BLOCK
      ?auto_475941 - BLOCK
      ?auto_475942 - BLOCK
      ?auto_475943 - BLOCK
      ?auto_475944 - BLOCK
      ?auto_475945 - BLOCK
      ?auto_475946 - BLOCK
    )
    :vars
    (
      ?auto_475947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_475946 ?auto_475947 ) ( ON-TABLE ?auto_475932 ) ( ON ?auto_475933 ?auto_475932 ) ( ON ?auto_475934 ?auto_475933 ) ( ON ?auto_475935 ?auto_475934 ) ( ON ?auto_475936 ?auto_475935 ) ( ON ?auto_475937 ?auto_475936 ) ( ON ?auto_475938 ?auto_475937 ) ( not ( = ?auto_475932 ?auto_475933 ) ) ( not ( = ?auto_475932 ?auto_475934 ) ) ( not ( = ?auto_475932 ?auto_475935 ) ) ( not ( = ?auto_475932 ?auto_475936 ) ) ( not ( = ?auto_475932 ?auto_475937 ) ) ( not ( = ?auto_475932 ?auto_475938 ) ) ( not ( = ?auto_475932 ?auto_475939 ) ) ( not ( = ?auto_475932 ?auto_475940 ) ) ( not ( = ?auto_475932 ?auto_475941 ) ) ( not ( = ?auto_475932 ?auto_475942 ) ) ( not ( = ?auto_475932 ?auto_475943 ) ) ( not ( = ?auto_475932 ?auto_475944 ) ) ( not ( = ?auto_475932 ?auto_475945 ) ) ( not ( = ?auto_475932 ?auto_475946 ) ) ( not ( = ?auto_475932 ?auto_475947 ) ) ( not ( = ?auto_475933 ?auto_475934 ) ) ( not ( = ?auto_475933 ?auto_475935 ) ) ( not ( = ?auto_475933 ?auto_475936 ) ) ( not ( = ?auto_475933 ?auto_475937 ) ) ( not ( = ?auto_475933 ?auto_475938 ) ) ( not ( = ?auto_475933 ?auto_475939 ) ) ( not ( = ?auto_475933 ?auto_475940 ) ) ( not ( = ?auto_475933 ?auto_475941 ) ) ( not ( = ?auto_475933 ?auto_475942 ) ) ( not ( = ?auto_475933 ?auto_475943 ) ) ( not ( = ?auto_475933 ?auto_475944 ) ) ( not ( = ?auto_475933 ?auto_475945 ) ) ( not ( = ?auto_475933 ?auto_475946 ) ) ( not ( = ?auto_475933 ?auto_475947 ) ) ( not ( = ?auto_475934 ?auto_475935 ) ) ( not ( = ?auto_475934 ?auto_475936 ) ) ( not ( = ?auto_475934 ?auto_475937 ) ) ( not ( = ?auto_475934 ?auto_475938 ) ) ( not ( = ?auto_475934 ?auto_475939 ) ) ( not ( = ?auto_475934 ?auto_475940 ) ) ( not ( = ?auto_475934 ?auto_475941 ) ) ( not ( = ?auto_475934 ?auto_475942 ) ) ( not ( = ?auto_475934 ?auto_475943 ) ) ( not ( = ?auto_475934 ?auto_475944 ) ) ( not ( = ?auto_475934 ?auto_475945 ) ) ( not ( = ?auto_475934 ?auto_475946 ) ) ( not ( = ?auto_475934 ?auto_475947 ) ) ( not ( = ?auto_475935 ?auto_475936 ) ) ( not ( = ?auto_475935 ?auto_475937 ) ) ( not ( = ?auto_475935 ?auto_475938 ) ) ( not ( = ?auto_475935 ?auto_475939 ) ) ( not ( = ?auto_475935 ?auto_475940 ) ) ( not ( = ?auto_475935 ?auto_475941 ) ) ( not ( = ?auto_475935 ?auto_475942 ) ) ( not ( = ?auto_475935 ?auto_475943 ) ) ( not ( = ?auto_475935 ?auto_475944 ) ) ( not ( = ?auto_475935 ?auto_475945 ) ) ( not ( = ?auto_475935 ?auto_475946 ) ) ( not ( = ?auto_475935 ?auto_475947 ) ) ( not ( = ?auto_475936 ?auto_475937 ) ) ( not ( = ?auto_475936 ?auto_475938 ) ) ( not ( = ?auto_475936 ?auto_475939 ) ) ( not ( = ?auto_475936 ?auto_475940 ) ) ( not ( = ?auto_475936 ?auto_475941 ) ) ( not ( = ?auto_475936 ?auto_475942 ) ) ( not ( = ?auto_475936 ?auto_475943 ) ) ( not ( = ?auto_475936 ?auto_475944 ) ) ( not ( = ?auto_475936 ?auto_475945 ) ) ( not ( = ?auto_475936 ?auto_475946 ) ) ( not ( = ?auto_475936 ?auto_475947 ) ) ( not ( = ?auto_475937 ?auto_475938 ) ) ( not ( = ?auto_475937 ?auto_475939 ) ) ( not ( = ?auto_475937 ?auto_475940 ) ) ( not ( = ?auto_475937 ?auto_475941 ) ) ( not ( = ?auto_475937 ?auto_475942 ) ) ( not ( = ?auto_475937 ?auto_475943 ) ) ( not ( = ?auto_475937 ?auto_475944 ) ) ( not ( = ?auto_475937 ?auto_475945 ) ) ( not ( = ?auto_475937 ?auto_475946 ) ) ( not ( = ?auto_475937 ?auto_475947 ) ) ( not ( = ?auto_475938 ?auto_475939 ) ) ( not ( = ?auto_475938 ?auto_475940 ) ) ( not ( = ?auto_475938 ?auto_475941 ) ) ( not ( = ?auto_475938 ?auto_475942 ) ) ( not ( = ?auto_475938 ?auto_475943 ) ) ( not ( = ?auto_475938 ?auto_475944 ) ) ( not ( = ?auto_475938 ?auto_475945 ) ) ( not ( = ?auto_475938 ?auto_475946 ) ) ( not ( = ?auto_475938 ?auto_475947 ) ) ( not ( = ?auto_475939 ?auto_475940 ) ) ( not ( = ?auto_475939 ?auto_475941 ) ) ( not ( = ?auto_475939 ?auto_475942 ) ) ( not ( = ?auto_475939 ?auto_475943 ) ) ( not ( = ?auto_475939 ?auto_475944 ) ) ( not ( = ?auto_475939 ?auto_475945 ) ) ( not ( = ?auto_475939 ?auto_475946 ) ) ( not ( = ?auto_475939 ?auto_475947 ) ) ( not ( = ?auto_475940 ?auto_475941 ) ) ( not ( = ?auto_475940 ?auto_475942 ) ) ( not ( = ?auto_475940 ?auto_475943 ) ) ( not ( = ?auto_475940 ?auto_475944 ) ) ( not ( = ?auto_475940 ?auto_475945 ) ) ( not ( = ?auto_475940 ?auto_475946 ) ) ( not ( = ?auto_475940 ?auto_475947 ) ) ( not ( = ?auto_475941 ?auto_475942 ) ) ( not ( = ?auto_475941 ?auto_475943 ) ) ( not ( = ?auto_475941 ?auto_475944 ) ) ( not ( = ?auto_475941 ?auto_475945 ) ) ( not ( = ?auto_475941 ?auto_475946 ) ) ( not ( = ?auto_475941 ?auto_475947 ) ) ( not ( = ?auto_475942 ?auto_475943 ) ) ( not ( = ?auto_475942 ?auto_475944 ) ) ( not ( = ?auto_475942 ?auto_475945 ) ) ( not ( = ?auto_475942 ?auto_475946 ) ) ( not ( = ?auto_475942 ?auto_475947 ) ) ( not ( = ?auto_475943 ?auto_475944 ) ) ( not ( = ?auto_475943 ?auto_475945 ) ) ( not ( = ?auto_475943 ?auto_475946 ) ) ( not ( = ?auto_475943 ?auto_475947 ) ) ( not ( = ?auto_475944 ?auto_475945 ) ) ( not ( = ?auto_475944 ?auto_475946 ) ) ( not ( = ?auto_475944 ?auto_475947 ) ) ( not ( = ?auto_475945 ?auto_475946 ) ) ( not ( = ?auto_475945 ?auto_475947 ) ) ( not ( = ?auto_475946 ?auto_475947 ) ) ( ON ?auto_475945 ?auto_475946 ) ( ON ?auto_475944 ?auto_475945 ) ( ON ?auto_475943 ?auto_475944 ) ( ON ?auto_475942 ?auto_475943 ) ( ON ?auto_475941 ?auto_475942 ) ( ON ?auto_475940 ?auto_475941 ) ( CLEAR ?auto_475938 ) ( ON ?auto_475939 ?auto_475940 ) ( CLEAR ?auto_475939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_475932 ?auto_475933 ?auto_475934 ?auto_475935 ?auto_475936 ?auto_475937 ?auto_475938 ?auto_475939 )
      ( MAKE-15PILE ?auto_475932 ?auto_475933 ?auto_475934 ?auto_475935 ?auto_475936 ?auto_475937 ?auto_475938 ?auto_475939 ?auto_475940 ?auto_475941 ?auto_475942 ?auto_475943 ?auto_475944 ?auto_475945 ?auto_475946 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_475994 - BLOCK
      ?auto_475995 - BLOCK
      ?auto_475996 - BLOCK
      ?auto_475997 - BLOCK
      ?auto_475998 - BLOCK
      ?auto_475999 - BLOCK
      ?auto_476000 - BLOCK
      ?auto_476001 - BLOCK
      ?auto_476002 - BLOCK
      ?auto_476003 - BLOCK
      ?auto_476004 - BLOCK
      ?auto_476005 - BLOCK
      ?auto_476006 - BLOCK
      ?auto_476007 - BLOCK
      ?auto_476008 - BLOCK
    )
    :vars
    (
      ?auto_476009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476008 ?auto_476009 ) ( ON-TABLE ?auto_475994 ) ( ON ?auto_475995 ?auto_475994 ) ( ON ?auto_475996 ?auto_475995 ) ( ON ?auto_475997 ?auto_475996 ) ( ON ?auto_475998 ?auto_475997 ) ( ON ?auto_475999 ?auto_475998 ) ( not ( = ?auto_475994 ?auto_475995 ) ) ( not ( = ?auto_475994 ?auto_475996 ) ) ( not ( = ?auto_475994 ?auto_475997 ) ) ( not ( = ?auto_475994 ?auto_475998 ) ) ( not ( = ?auto_475994 ?auto_475999 ) ) ( not ( = ?auto_475994 ?auto_476000 ) ) ( not ( = ?auto_475994 ?auto_476001 ) ) ( not ( = ?auto_475994 ?auto_476002 ) ) ( not ( = ?auto_475994 ?auto_476003 ) ) ( not ( = ?auto_475994 ?auto_476004 ) ) ( not ( = ?auto_475994 ?auto_476005 ) ) ( not ( = ?auto_475994 ?auto_476006 ) ) ( not ( = ?auto_475994 ?auto_476007 ) ) ( not ( = ?auto_475994 ?auto_476008 ) ) ( not ( = ?auto_475994 ?auto_476009 ) ) ( not ( = ?auto_475995 ?auto_475996 ) ) ( not ( = ?auto_475995 ?auto_475997 ) ) ( not ( = ?auto_475995 ?auto_475998 ) ) ( not ( = ?auto_475995 ?auto_475999 ) ) ( not ( = ?auto_475995 ?auto_476000 ) ) ( not ( = ?auto_475995 ?auto_476001 ) ) ( not ( = ?auto_475995 ?auto_476002 ) ) ( not ( = ?auto_475995 ?auto_476003 ) ) ( not ( = ?auto_475995 ?auto_476004 ) ) ( not ( = ?auto_475995 ?auto_476005 ) ) ( not ( = ?auto_475995 ?auto_476006 ) ) ( not ( = ?auto_475995 ?auto_476007 ) ) ( not ( = ?auto_475995 ?auto_476008 ) ) ( not ( = ?auto_475995 ?auto_476009 ) ) ( not ( = ?auto_475996 ?auto_475997 ) ) ( not ( = ?auto_475996 ?auto_475998 ) ) ( not ( = ?auto_475996 ?auto_475999 ) ) ( not ( = ?auto_475996 ?auto_476000 ) ) ( not ( = ?auto_475996 ?auto_476001 ) ) ( not ( = ?auto_475996 ?auto_476002 ) ) ( not ( = ?auto_475996 ?auto_476003 ) ) ( not ( = ?auto_475996 ?auto_476004 ) ) ( not ( = ?auto_475996 ?auto_476005 ) ) ( not ( = ?auto_475996 ?auto_476006 ) ) ( not ( = ?auto_475996 ?auto_476007 ) ) ( not ( = ?auto_475996 ?auto_476008 ) ) ( not ( = ?auto_475996 ?auto_476009 ) ) ( not ( = ?auto_475997 ?auto_475998 ) ) ( not ( = ?auto_475997 ?auto_475999 ) ) ( not ( = ?auto_475997 ?auto_476000 ) ) ( not ( = ?auto_475997 ?auto_476001 ) ) ( not ( = ?auto_475997 ?auto_476002 ) ) ( not ( = ?auto_475997 ?auto_476003 ) ) ( not ( = ?auto_475997 ?auto_476004 ) ) ( not ( = ?auto_475997 ?auto_476005 ) ) ( not ( = ?auto_475997 ?auto_476006 ) ) ( not ( = ?auto_475997 ?auto_476007 ) ) ( not ( = ?auto_475997 ?auto_476008 ) ) ( not ( = ?auto_475997 ?auto_476009 ) ) ( not ( = ?auto_475998 ?auto_475999 ) ) ( not ( = ?auto_475998 ?auto_476000 ) ) ( not ( = ?auto_475998 ?auto_476001 ) ) ( not ( = ?auto_475998 ?auto_476002 ) ) ( not ( = ?auto_475998 ?auto_476003 ) ) ( not ( = ?auto_475998 ?auto_476004 ) ) ( not ( = ?auto_475998 ?auto_476005 ) ) ( not ( = ?auto_475998 ?auto_476006 ) ) ( not ( = ?auto_475998 ?auto_476007 ) ) ( not ( = ?auto_475998 ?auto_476008 ) ) ( not ( = ?auto_475998 ?auto_476009 ) ) ( not ( = ?auto_475999 ?auto_476000 ) ) ( not ( = ?auto_475999 ?auto_476001 ) ) ( not ( = ?auto_475999 ?auto_476002 ) ) ( not ( = ?auto_475999 ?auto_476003 ) ) ( not ( = ?auto_475999 ?auto_476004 ) ) ( not ( = ?auto_475999 ?auto_476005 ) ) ( not ( = ?auto_475999 ?auto_476006 ) ) ( not ( = ?auto_475999 ?auto_476007 ) ) ( not ( = ?auto_475999 ?auto_476008 ) ) ( not ( = ?auto_475999 ?auto_476009 ) ) ( not ( = ?auto_476000 ?auto_476001 ) ) ( not ( = ?auto_476000 ?auto_476002 ) ) ( not ( = ?auto_476000 ?auto_476003 ) ) ( not ( = ?auto_476000 ?auto_476004 ) ) ( not ( = ?auto_476000 ?auto_476005 ) ) ( not ( = ?auto_476000 ?auto_476006 ) ) ( not ( = ?auto_476000 ?auto_476007 ) ) ( not ( = ?auto_476000 ?auto_476008 ) ) ( not ( = ?auto_476000 ?auto_476009 ) ) ( not ( = ?auto_476001 ?auto_476002 ) ) ( not ( = ?auto_476001 ?auto_476003 ) ) ( not ( = ?auto_476001 ?auto_476004 ) ) ( not ( = ?auto_476001 ?auto_476005 ) ) ( not ( = ?auto_476001 ?auto_476006 ) ) ( not ( = ?auto_476001 ?auto_476007 ) ) ( not ( = ?auto_476001 ?auto_476008 ) ) ( not ( = ?auto_476001 ?auto_476009 ) ) ( not ( = ?auto_476002 ?auto_476003 ) ) ( not ( = ?auto_476002 ?auto_476004 ) ) ( not ( = ?auto_476002 ?auto_476005 ) ) ( not ( = ?auto_476002 ?auto_476006 ) ) ( not ( = ?auto_476002 ?auto_476007 ) ) ( not ( = ?auto_476002 ?auto_476008 ) ) ( not ( = ?auto_476002 ?auto_476009 ) ) ( not ( = ?auto_476003 ?auto_476004 ) ) ( not ( = ?auto_476003 ?auto_476005 ) ) ( not ( = ?auto_476003 ?auto_476006 ) ) ( not ( = ?auto_476003 ?auto_476007 ) ) ( not ( = ?auto_476003 ?auto_476008 ) ) ( not ( = ?auto_476003 ?auto_476009 ) ) ( not ( = ?auto_476004 ?auto_476005 ) ) ( not ( = ?auto_476004 ?auto_476006 ) ) ( not ( = ?auto_476004 ?auto_476007 ) ) ( not ( = ?auto_476004 ?auto_476008 ) ) ( not ( = ?auto_476004 ?auto_476009 ) ) ( not ( = ?auto_476005 ?auto_476006 ) ) ( not ( = ?auto_476005 ?auto_476007 ) ) ( not ( = ?auto_476005 ?auto_476008 ) ) ( not ( = ?auto_476005 ?auto_476009 ) ) ( not ( = ?auto_476006 ?auto_476007 ) ) ( not ( = ?auto_476006 ?auto_476008 ) ) ( not ( = ?auto_476006 ?auto_476009 ) ) ( not ( = ?auto_476007 ?auto_476008 ) ) ( not ( = ?auto_476007 ?auto_476009 ) ) ( not ( = ?auto_476008 ?auto_476009 ) ) ( ON ?auto_476007 ?auto_476008 ) ( ON ?auto_476006 ?auto_476007 ) ( ON ?auto_476005 ?auto_476006 ) ( ON ?auto_476004 ?auto_476005 ) ( ON ?auto_476003 ?auto_476004 ) ( ON ?auto_476002 ?auto_476003 ) ( ON ?auto_476001 ?auto_476002 ) ( CLEAR ?auto_475999 ) ( ON ?auto_476000 ?auto_476001 ) ( CLEAR ?auto_476000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_475994 ?auto_475995 ?auto_475996 ?auto_475997 ?auto_475998 ?auto_475999 ?auto_476000 )
      ( MAKE-15PILE ?auto_475994 ?auto_475995 ?auto_475996 ?auto_475997 ?auto_475998 ?auto_475999 ?auto_476000 ?auto_476001 ?auto_476002 ?auto_476003 ?auto_476004 ?auto_476005 ?auto_476006 ?auto_476007 ?auto_476008 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_476056 - BLOCK
      ?auto_476057 - BLOCK
      ?auto_476058 - BLOCK
      ?auto_476059 - BLOCK
      ?auto_476060 - BLOCK
      ?auto_476061 - BLOCK
      ?auto_476062 - BLOCK
      ?auto_476063 - BLOCK
      ?auto_476064 - BLOCK
      ?auto_476065 - BLOCK
      ?auto_476066 - BLOCK
      ?auto_476067 - BLOCK
      ?auto_476068 - BLOCK
      ?auto_476069 - BLOCK
      ?auto_476070 - BLOCK
    )
    :vars
    (
      ?auto_476071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476070 ?auto_476071 ) ( ON-TABLE ?auto_476056 ) ( ON ?auto_476057 ?auto_476056 ) ( ON ?auto_476058 ?auto_476057 ) ( ON ?auto_476059 ?auto_476058 ) ( ON ?auto_476060 ?auto_476059 ) ( not ( = ?auto_476056 ?auto_476057 ) ) ( not ( = ?auto_476056 ?auto_476058 ) ) ( not ( = ?auto_476056 ?auto_476059 ) ) ( not ( = ?auto_476056 ?auto_476060 ) ) ( not ( = ?auto_476056 ?auto_476061 ) ) ( not ( = ?auto_476056 ?auto_476062 ) ) ( not ( = ?auto_476056 ?auto_476063 ) ) ( not ( = ?auto_476056 ?auto_476064 ) ) ( not ( = ?auto_476056 ?auto_476065 ) ) ( not ( = ?auto_476056 ?auto_476066 ) ) ( not ( = ?auto_476056 ?auto_476067 ) ) ( not ( = ?auto_476056 ?auto_476068 ) ) ( not ( = ?auto_476056 ?auto_476069 ) ) ( not ( = ?auto_476056 ?auto_476070 ) ) ( not ( = ?auto_476056 ?auto_476071 ) ) ( not ( = ?auto_476057 ?auto_476058 ) ) ( not ( = ?auto_476057 ?auto_476059 ) ) ( not ( = ?auto_476057 ?auto_476060 ) ) ( not ( = ?auto_476057 ?auto_476061 ) ) ( not ( = ?auto_476057 ?auto_476062 ) ) ( not ( = ?auto_476057 ?auto_476063 ) ) ( not ( = ?auto_476057 ?auto_476064 ) ) ( not ( = ?auto_476057 ?auto_476065 ) ) ( not ( = ?auto_476057 ?auto_476066 ) ) ( not ( = ?auto_476057 ?auto_476067 ) ) ( not ( = ?auto_476057 ?auto_476068 ) ) ( not ( = ?auto_476057 ?auto_476069 ) ) ( not ( = ?auto_476057 ?auto_476070 ) ) ( not ( = ?auto_476057 ?auto_476071 ) ) ( not ( = ?auto_476058 ?auto_476059 ) ) ( not ( = ?auto_476058 ?auto_476060 ) ) ( not ( = ?auto_476058 ?auto_476061 ) ) ( not ( = ?auto_476058 ?auto_476062 ) ) ( not ( = ?auto_476058 ?auto_476063 ) ) ( not ( = ?auto_476058 ?auto_476064 ) ) ( not ( = ?auto_476058 ?auto_476065 ) ) ( not ( = ?auto_476058 ?auto_476066 ) ) ( not ( = ?auto_476058 ?auto_476067 ) ) ( not ( = ?auto_476058 ?auto_476068 ) ) ( not ( = ?auto_476058 ?auto_476069 ) ) ( not ( = ?auto_476058 ?auto_476070 ) ) ( not ( = ?auto_476058 ?auto_476071 ) ) ( not ( = ?auto_476059 ?auto_476060 ) ) ( not ( = ?auto_476059 ?auto_476061 ) ) ( not ( = ?auto_476059 ?auto_476062 ) ) ( not ( = ?auto_476059 ?auto_476063 ) ) ( not ( = ?auto_476059 ?auto_476064 ) ) ( not ( = ?auto_476059 ?auto_476065 ) ) ( not ( = ?auto_476059 ?auto_476066 ) ) ( not ( = ?auto_476059 ?auto_476067 ) ) ( not ( = ?auto_476059 ?auto_476068 ) ) ( not ( = ?auto_476059 ?auto_476069 ) ) ( not ( = ?auto_476059 ?auto_476070 ) ) ( not ( = ?auto_476059 ?auto_476071 ) ) ( not ( = ?auto_476060 ?auto_476061 ) ) ( not ( = ?auto_476060 ?auto_476062 ) ) ( not ( = ?auto_476060 ?auto_476063 ) ) ( not ( = ?auto_476060 ?auto_476064 ) ) ( not ( = ?auto_476060 ?auto_476065 ) ) ( not ( = ?auto_476060 ?auto_476066 ) ) ( not ( = ?auto_476060 ?auto_476067 ) ) ( not ( = ?auto_476060 ?auto_476068 ) ) ( not ( = ?auto_476060 ?auto_476069 ) ) ( not ( = ?auto_476060 ?auto_476070 ) ) ( not ( = ?auto_476060 ?auto_476071 ) ) ( not ( = ?auto_476061 ?auto_476062 ) ) ( not ( = ?auto_476061 ?auto_476063 ) ) ( not ( = ?auto_476061 ?auto_476064 ) ) ( not ( = ?auto_476061 ?auto_476065 ) ) ( not ( = ?auto_476061 ?auto_476066 ) ) ( not ( = ?auto_476061 ?auto_476067 ) ) ( not ( = ?auto_476061 ?auto_476068 ) ) ( not ( = ?auto_476061 ?auto_476069 ) ) ( not ( = ?auto_476061 ?auto_476070 ) ) ( not ( = ?auto_476061 ?auto_476071 ) ) ( not ( = ?auto_476062 ?auto_476063 ) ) ( not ( = ?auto_476062 ?auto_476064 ) ) ( not ( = ?auto_476062 ?auto_476065 ) ) ( not ( = ?auto_476062 ?auto_476066 ) ) ( not ( = ?auto_476062 ?auto_476067 ) ) ( not ( = ?auto_476062 ?auto_476068 ) ) ( not ( = ?auto_476062 ?auto_476069 ) ) ( not ( = ?auto_476062 ?auto_476070 ) ) ( not ( = ?auto_476062 ?auto_476071 ) ) ( not ( = ?auto_476063 ?auto_476064 ) ) ( not ( = ?auto_476063 ?auto_476065 ) ) ( not ( = ?auto_476063 ?auto_476066 ) ) ( not ( = ?auto_476063 ?auto_476067 ) ) ( not ( = ?auto_476063 ?auto_476068 ) ) ( not ( = ?auto_476063 ?auto_476069 ) ) ( not ( = ?auto_476063 ?auto_476070 ) ) ( not ( = ?auto_476063 ?auto_476071 ) ) ( not ( = ?auto_476064 ?auto_476065 ) ) ( not ( = ?auto_476064 ?auto_476066 ) ) ( not ( = ?auto_476064 ?auto_476067 ) ) ( not ( = ?auto_476064 ?auto_476068 ) ) ( not ( = ?auto_476064 ?auto_476069 ) ) ( not ( = ?auto_476064 ?auto_476070 ) ) ( not ( = ?auto_476064 ?auto_476071 ) ) ( not ( = ?auto_476065 ?auto_476066 ) ) ( not ( = ?auto_476065 ?auto_476067 ) ) ( not ( = ?auto_476065 ?auto_476068 ) ) ( not ( = ?auto_476065 ?auto_476069 ) ) ( not ( = ?auto_476065 ?auto_476070 ) ) ( not ( = ?auto_476065 ?auto_476071 ) ) ( not ( = ?auto_476066 ?auto_476067 ) ) ( not ( = ?auto_476066 ?auto_476068 ) ) ( not ( = ?auto_476066 ?auto_476069 ) ) ( not ( = ?auto_476066 ?auto_476070 ) ) ( not ( = ?auto_476066 ?auto_476071 ) ) ( not ( = ?auto_476067 ?auto_476068 ) ) ( not ( = ?auto_476067 ?auto_476069 ) ) ( not ( = ?auto_476067 ?auto_476070 ) ) ( not ( = ?auto_476067 ?auto_476071 ) ) ( not ( = ?auto_476068 ?auto_476069 ) ) ( not ( = ?auto_476068 ?auto_476070 ) ) ( not ( = ?auto_476068 ?auto_476071 ) ) ( not ( = ?auto_476069 ?auto_476070 ) ) ( not ( = ?auto_476069 ?auto_476071 ) ) ( not ( = ?auto_476070 ?auto_476071 ) ) ( ON ?auto_476069 ?auto_476070 ) ( ON ?auto_476068 ?auto_476069 ) ( ON ?auto_476067 ?auto_476068 ) ( ON ?auto_476066 ?auto_476067 ) ( ON ?auto_476065 ?auto_476066 ) ( ON ?auto_476064 ?auto_476065 ) ( ON ?auto_476063 ?auto_476064 ) ( ON ?auto_476062 ?auto_476063 ) ( CLEAR ?auto_476060 ) ( ON ?auto_476061 ?auto_476062 ) ( CLEAR ?auto_476061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_476056 ?auto_476057 ?auto_476058 ?auto_476059 ?auto_476060 ?auto_476061 )
      ( MAKE-15PILE ?auto_476056 ?auto_476057 ?auto_476058 ?auto_476059 ?auto_476060 ?auto_476061 ?auto_476062 ?auto_476063 ?auto_476064 ?auto_476065 ?auto_476066 ?auto_476067 ?auto_476068 ?auto_476069 ?auto_476070 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_476118 - BLOCK
      ?auto_476119 - BLOCK
      ?auto_476120 - BLOCK
      ?auto_476121 - BLOCK
      ?auto_476122 - BLOCK
      ?auto_476123 - BLOCK
      ?auto_476124 - BLOCK
      ?auto_476125 - BLOCK
      ?auto_476126 - BLOCK
      ?auto_476127 - BLOCK
      ?auto_476128 - BLOCK
      ?auto_476129 - BLOCK
      ?auto_476130 - BLOCK
      ?auto_476131 - BLOCK
      ?auto_476132 - BLOCK
    )
    :vars
    (
      ?auto_476133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476132 ?auto_476133 ) ( ON-TABLE ?auto_476118 ) ( ON ?auto_476119 ?auto_476118 ) ( ON ?auto_476120 ?auto_476119 ) ( ON ?auto_476121 ?auto_476120 ) ( not ( = ?auto_476118 ?auto_476119 ) ) ( not ( = ?auto_476118 ?auto_476120 ) ) ( not ( = ?auto_476118 ?auto_476121 ) ) ( not ( = ?auto_476118 ?auto_476122 ) ) ( not ( = ?auto_476118 ?auto_476123 ) ) ( not ( = ?auto_476118 ?auto_476124 ) ) ( not ( = ?auto_476118 ?auto_476125 ) ) ( not ( = ?auto_476118 ?auto_476126 ) ) ( not ( = ?auto_476118 ?auto_476127 ) ) ( not ( = ?auto_476118 ?auto_476128 ) ) ( not ( = ?auto_476118 ?auto_476129 ) ) ( not ( = ?auto_476118 ?auto_476130 ) ) ( not ( = ?auto_476118 ?auto_476131 ) ) ( not ( = ?auto_476118 ?auto_476132 ) ) ( not ( = ?auto_476118 ?auto_476133 ) ) ( not ( = ?auto_476119 ?auto_476120 ) ) ( not ( = ?auto_476119 ?auto_476121 ) ) ( not ( = ?auto_476119 ?auto_476122 ) ) ( not ( = ?auto_476119 ?auto_476123 ) ) ( not ( = ?auto_476119 ?auto_476124 ) ) ( not ( = ?auto_476119 ?auto_476125 ) ) ( not ( = ?auto_476119 ?auto_476126 ) ) ( not ( = ?auto_476119 ?auto_476127 ) ) ( not ( = ?auto_476119 ?auto_476128 ) ) ( not ( = ?auto_476119 ?auto_476129 ) ) ( not ( = ?auto_476119 ?auto_476130 ) ) ( not ( = ?auto_476119 ?auto_476131 ) ) ( not ( = ?auto_476119 ?auto_476132 ) ) ( not ( = ?auto_476119 ?auto_476133 ) ) ( not ( = ?auto_476120 ?auto_476121 ) ) ( not ( = ?auto_476120 ?auto_476122 ) ) ( not ( = ?auto_476120 ?auto_476123 ) ) ( not ( = ?auto_476120 ?auto_476124 ) ) ( not ( = ?auto_476120 ?auto_476125 ) ) ( not ( = ?auto_476120 ?auto_476126 ) ) ( not ( = ?auto_476120 ?auto_476127 ) ) ( not ( = ?auto_476120 ?auto_476128 ) ) ( not ( = ?auto_476120 ?auto_476129 ) ) ( not ( = ?auto_476120 ?auto_476130 ) ) ( not ( = ?auto_476120 ?auto_476131 ) ) ( not ( = ?auto_476120 ?auto_476132 ) ) ( not ( = ?auto_476120 ?auto_476133 ) ) ( not ( = ?auto_476121 ?auto_476122 ) ) ( not ( = ?auto_476121 ?auto_476123 ) ) ( not ( = ?auto_476121 ?auto_476124 ) ) ( not ( = ?auto_476121 ?auto_476125 ) ) ( not ( = ?auto_476121 ?auto_476126 ) ) ( not ( = ?auto_476121 ?auto_476127 ) ) ( not ( = ?auto_476121 ?auto_476128 ) ) ( not ( = ?auto_476121 ?auto_476129 ) ) ( not ( = ?auto_476121 ?auto_476130 ) ) ( not ( = ?auto_476121 ?auto_476131 ) ) ( not ( = ?auto_476121 ?auto_476132 ) ) ( not ( = ?auto_476121 ?auto_476133 ) ) ( not ( = ?auto_476122 ?auto_476123 ) ) ( not ( = ?auto_476122 ?auto_476124 ) ) ( not ( = ?auto_476122 ?auto_476125 ) ) ( not ( = ?auto_476122 ?auto_476126 ) ) ( not ( = ?auto_476122 ?auto_476127 ) ) ( not ( = ?auto_476122 ?auto_476128 ) ) ( not ( = ?auto_476122 ?auto_476129 ) ) ( not ( = ?auto_476122 ?auto_476130 ) ) ( not ( = ?auto_476122 ?auto_476131 ) ) ( not ( = ?auto_476122 ?auto_476132 ) ) ( not ( = ?auto_476122 ?auto_476133 ) ) ( not ( = ?auto_476123 ?auto_476124 ) ) ( not ( = ?auto_476123 ?auto_476125 ) ) ( not ( = ?auto_476123 ?auto_476126 ) ) ( not ( = ?auto_476123 ?auto_476127 ) ) ( not ( = ?auto_476123 ?auto_476128 ) ) ( not ( = ?auto_476123 ?auto_476129 ) ) ( not ( = ?auto_476123 ?auto_476130 ) ) ( not ( = ?auto_476123 ?auto_476131 ) ) ( not ( = ?auto_476123 ?auto_476132 ) ) ( not ( = ?auto_476123 ?auto_476133 ) ) ( not ( = ?auto_476124 ?auto_476125 ) ) ( not ( = ?auto_476124 ?auto_476126 ) ) ( not ( = ?auto_476124 ?auto_476127 ) ) ( not ( = ?auto_476124 ?auto_476128 ) ) ( not ( = ?auto_476124 ?auto_476129 ) ) ( not ( = ?auto_476124 ?auto_476130 ) ) ( not ( = ?auto_476124 ?auto_476131 ) ) ( not ( = ?auto_476124 ?auto_476132 ) ) ( not ( = ?auto_476124 ?auto_476133 ) ) ( not ( = ?auto_476125 ?auto_476126 ) ) ( not ( = ?auto_476125 ?auto_476127 ) ) ( not ( = ?auto_476125 ?auto_476128 ) ) ( not ( = ?auto_476125 ?auto_476129 ) ) ( not ( = ?auto_476125 ?auto_476130 ) ) ( not ( = ?auto_476125 ?auto_476131 ) ) ( not ( = ?auto_476125 ?auto_476132 ) ) ( not ( = ?auto_476125 ?auto_476133 ) ) ( not ( = ?auto_476126 ?auto_476127 ) ) ( not ( = ?auto_476126 ?auto_476128 ) ) ( not ( = ?auto_476126 ?auto_476129 ) ) ( not ( = ?auto_476126 ?auto_476130 ) ) ( not ( = ?auto_476126 ?auto_476131 ) ) ( not ( = ?auto_476126 ?auto_476132 ) ) ( not ( = ?auto_476126 ?auto_476133 ) ) ( not ( = ?auto_476127 ?auto_476128 ) ) ( not ( = ?auto_476127 ?auto_476129 ) ) ( not ( = ?auto_476127 ?auto_476130 ) ) ( not ( = ?auto_476127 ?auto_476131 ) ) ( not ( = ?auto_476127 ?auto_476132 ) ) ( not ( = ?auto_476127 ?auto_476133 ) ) ( not ( = ?auto_476128 ?auto_476129 ) ) ( not ( = ?auto_476128 ?auto_476130 ) ) ( not ( = ?auto_476128 ?auto_476131 ) ) ( not ( = ?auto_476128 ?auto_476132 ) ) ( not ( = ?auto_476128 ?auto_476133 ) ) ( not ( = ?auto_476129 ?auto_476130 ) ) ( not ( = ?auto_476129 ?auto_476131 ) ) ( not ( = ?auto_476129 ?auto_476132 ) ) ( not ( = ?auto_476129 ?auto_476133 ) ) ( not ( = ?auto_476130 ?auto_476131 ) ) ( not ( = ?auto_476130 ?auto_476132 ) ) ( not ( = ?auto_476130 ?auto_476133 ) ) ( not ( = ?auto_476131 ?auto_476132 ) ) ( not ( = ?auto_476131 ?auto_476133 ) ) ( not ( = ?auto_476132 ?auto_476133 ) ) ( ON ?auto_476131 ?auto_476132 ) ( ON ?auto_476130 ?auto_476131 ) ( ON ?auto_476129 ?auto_476130 ) ( ON ?auto_476128 ?auto_476129 ) ( ON ?auto_476127 ?auto_476128 ) ( ON ?auto_476126 ?auto_476127 ) ( ON ?auto_476125 ?auto_476126 ) ( ON ?auto_476124 ?auto_476125 ) ( ON ?auto_476123 ?auto_476124 ) ( CLEAR ?auto_476121 ) ( ON ?auto_476122 ?auto_476123 ) ( CLEAR ?auto_476122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_476118 ?auto_476119 ?auto_476120 ?auto_476121 ?auto_476122 )
      ( MAKE-15PILE ?auto_476118 ?auto_476119 ?auto_476120 ?auto_476121 ?auto_476122 ?auto_476123 ?auto_476124 ?auto_476125 ?auto_476126 ?auto_476127 ?auto_476128 ?auto_476129 ?auto_476130 ?auto_476131 ?auto_476132 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_476180 - BLOCK
      ?auto_476181 - BLOCK
      ?auto_476182 - BLOCK
      ?auto_476183 - BLOCK
      ?auto_476184 - BLOCK
      ?auto_476185 - BLOCK
      ?auto_476186 - BLOCK
      ?auto_476187 - BLOCK
      ?auto_476188 - BLOCK
      ?auto_476189 - BLOCK
      ?auto_476190 - BLOCK
      ?auto_476191 - BLOCK
      ?auto_476192 - BLOCK
      ?auto_476193 - BLOCK
      ?auto_476194 - BLOCK
    )
    :vars
    (
      ?auto_476195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476194 ?auto_476195 ) ( ON-TABLE ?auto_476180 ) ( ON ?auto_476181 ?auto_476180 ) ( ON ?auto_476182 ?auto_476181 ) ( not ( = ?auto_476180 ?auto_476181 ) ) ( not ( = ?auto_476180 ?auto_476182 ) ) ( not ( = ?auto_476180 ?auto_476183 ) ) ( not ( = ?auto_476180 ?auto_476184 ) ) ( not ( = ?auto_476180 ?auto_476185 ) ) ( not ( = ?auto_476180 ?auto_476186 ) ) ( not ( = ?auto_476180 ?auto_476187 ) ) ( not ( = ?auto_476180 ?auto_476188 ) ) ( not ( = ?auto_476180 ?auto_476189 ) ) ( not ( = ?auto_476180 ?auto_476190 ) ) ( not ( = ?auto_476180 ?auto_476191 ) ) ( not ( = ?auto_476180 ?auto_476192 ) ) ( not ( = ?auto_476180 ?auto_476193 ) ) ( not ( = ?auto_476180 ?auto_476194 ) ) ( not ( = ?auto_476180 ?auto_476195 ) ) ( not ( = ?auto_476181 ?auto_476182 ) ) ( not ( = ?auto_476181 ?auto_476183 ) ) ( not ( = ?auto_476181 ?auto_476184 ) ) ( not ( = ?auto_476181 ?auto_476185 ) ) ( not ( = ?auto_476181 ?auto_476186 ) ) ( not ( = ?auto_476181 ?auto_476187 ) ) ( not ( = ?auto_476181 ?auto_476188 ) ) ( not ( = ?auto_476181 ?auto_476189 ) ) ( not ( = ?auto_476181 ?auto_476190 ) ) ( not ( = ?auto_476181 ?auto_476191 ) ) ( not ( = ?auto_476181 ?auto_476192 ) ) ( not ( = ?auto_476181 ?auto_476193 ) ) ( not ( = ?auto_476181 ?auto_476194 ) ) ( not ( = ?auto_476181 ?auto_476195 ) ) ( not ( = ?auto_476182 ?auto_476183 ) ) ( not ( = ?auto_476182 ?auto_476184 ) ) ( not ( = ?auto_476182 ?auto_476185 ) ) ( not ( = ?auto_476182 ?auto_476186 ) ) ( not ( = ?auto_476182 ?auto_476187 ) ) ( not ( = ?auto_476182 ?auto_476188 ) ) ( not ( = ?auto_476182 ?auto_476189 ) ) ( not ( = ?auto_476182 ?auto_476190 ) ) ( not ( = ?auto_476182 ?auto_476191 ) ) ( not ( = ?auto_476182 ?auto_476192 ) ) ( not ( = ?auto_476182 ?auto_476193 ) ) ( not ( = ?auto_476182 ?auto_476194 ) ) ( not ( = ?auto_476182 ?auto_476195 ) ) ( not ( = ?auto_476183 ?auto_476184 ) ) ( not ( = ?auto_476183 ?auto_476185 ) ) ( not ( = ?auto_476183 ?auto_476186 ) ) ( not ( = ?auto_476183 ?auto_476187 ) ) ( not ( = ?auto_476183 ?auto_476188 ) ) ( not ( = ?auto_476183 ?auto_476189 ) ) ( not ( = ?auto_476183 ?auto_476190 ) ) ( not ( = ?auto_476183 ?auto_476191 ) ) ( not ( = ?auto_476183 ?auto_476192 ) ) ( not ( = ?auto_476183 ?auto_476193 ) ) ( not ( = ?auto_476183 ?auto_476194 ) ) ( not ( = ?auto_476183 ?auto_476195 ) ) ( not ( = ?auto_476184 ?auto_476185 ) ) ( not ( = ?auto_476184 ?auto_476186 ) ) ( not ( = ?auto_476184 ?auto_476187 ) ) ( not ( = ?auto_476184 ?auto_476188 ) ) ( not ( = ?auto_476184 ?auto_476189 ) ) ( not ( = ?auto_476184 ?auto_476190 ) ) ( not ( = ?auto_476184 ?auto_476191 ) ) ( not ( = ?auto_476184 ?auto_476192 ) ) ( not ( = ?auto_476184 ?auto_476193 ) ) ( not ( = ?auto_476184 ?auto_476194 ) ) ( not ( = ?auto_476184 ?auto_476195 ) ) ( not ( = ?auto_476185 ?auto_476186 ) ) ( not ( = ?auto_476185 ?auto_476187 ) ) ( not ( = ?auto_476185 ?auto_476188 ) ) ( not ( = ?auto_476185 ?auto_476189 ) ) ( not ( = ?auto_476185 ?auto_476190 ) ) ( not ( = ?auto_476185 ?auto_476191 ) ) ( not ( = ?auto_476185 ?auto_476192 ) ) ( not ( = ?auto_476185 ?auto_476193 ) ) ( not ( = ?auto_476185 ?auto_476194 ) ) ( not ( = ?auto_476185 ?auto_476195 ) ) ( not ( = ?auto_476186 ?auto_476187 ) ) ( not ( = ?auto_476186 ?auto_476188 ) ) ( not ( = ?auto_476186 ?auto_476189 ) ) ( not ( = ?auto_476186 ?auto_476190 ) ) ( not ( = ?auto_476186 ?auto_476191 ) ) ( not ( = ?auto_476186 ?auto_476192 ) ) ( not ( = ?auto_476186 ?auto_476193 ) ) ( not ( = ?auto_476186 ?auto_476194 ) ) ( not ( = ?auto_476186 ?auto_476195 ) ) ( not ( = ?auto_476187 ?auto_476188 ) ) ( not ( = ?auto_476187 ?auto_476189 ) ) ( not ( = ?auto_476187 ?auto_476190 ) ) ( not ( = ?auto_476187 ?auto_476191 ) ) ( not ( = ?auto_476187 ?auto_476192 ) ) ( not ( = ?auto_476187 ?auto_476193 ) ) ( not ( = ?auto_476187 ?auto_476194 ) ) ( not ( = ?auto_476187 ?auto_476195 ) ) ( not ( = ?auto_476188 ?auto_476189 ) ) ( not ( = ?auto_476188 ?auto_476190 ) ) ( not ( = ?auto_476188 ?auto_476191 ) ) ( not ( = ?auto_476188 ?auto_476192 ) ) ( not ( = ?auto_476188 ?auto_476193 ) ) ( not ( = ?auto_476188 ?auto_476194 ) ) ( not ( = ?auto_476188 ?auto_476195 ) ) ( not ( = ?auto_476189 ?auto_476190 ) ) ( not ( = ?auto_476189 ?auto_476191 ) ) ( not ( = ?auto_476189 ?auto_476192 ) ) ( not ( = ?auto_476189 ?auto_476193 ) ) ( not ( = ?auto_476189 ?auto_476194 ) ) ( not ( = ?auto_476189 ?auto_476195 ) ) ( not ( = ?auto_476190 ?auto_476191 ) ) ( not ( = ?auto_476190 ?auto_476192 ) ) ( not ( = ?auto_476190 ?auto_476193 ) ) ( not ( = ?auto_476190 ?auto_476194 ) ) ( not ( = ?auto_476190 ?auto_476195 ) ) ( not ( = ?auto_476191 ?auto_476192 ) ) ( not ( = ?auto_476191 ?auto_476193 ) ) ( not ( = ?auto_476191 ?auto_476194 ) ) ( not ( = ?auto_476191 ?auto_476195 ) ) ( not ( = ?auto_476192 ?auto_476193 ) ) ( not ( = ?auto_476192 ?auto_476194 ) ) ( not ( = ?auto_476192 ?auto_476195 ) ) ( not ( = ?auto_476193 ?auto_476194 ) ) ( not ( = ?auto_476193 ?auto_476195 ) ) ( not ( = ?auto_476194 ?auto_476195 ) ) ( ON ?auto_476193 ?auto_476194 ) ( ON ?auto_476192 ?auto_476193 ) ( ON ?auto_476191 ?auto_476192 ) ( ON ?auto_476190 ?auto_476191 ) ( ON ?auto_476189 ?auto_476190 ) ( ON ?auto_476188 ?auto_476189 ) ( ON ?auto_476187 ?auto_476188 ) ( ON ?auto_476186 ?auto_476187 ) ( ON ?auto_476185 ?auto_476186 ) ( ON ?auto_476184 ?auto_476185 ) ( CLEAR ?auto_476182 ) ( ON ?auto_476183 ?auto_476184 ) ( CLEAR ?auto_476183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_476180 ?auto_476181 ?auto_476182 ?auto_476183 )
      ( MAKE-15PILE ?auto_476180 ?auto_476181 ?auto_476182 ?auto_476183 ?auto_476184 ?auto_476185 ?auto_476186 ?auto_476187 ?auto_476188 ?auto_476189 ?auto_476190 ?auto_476191 ?auto_476192 ?auto_476193 ?auto_476194 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_476242 - BLOCK
      ?auto_476243 - BLOCK
      ?auto_476244 - BLOCK
      ?auto_476245 - BLOCK
      ?auto_476246 - BLOCK
      ?auto_476247 - BLOCK
      ?auto_476248 - BLOCK
      ?auto_476249 - BLOCK
      ?auto_476250 - BLOCK
      ?auto_476251 - BLOCK
      ?auto_476252 - BLOCK
      ?auto_476253 - BLOCK
      ?auto_476254 - BLOCK
      ?auto_476255 - BLOCK
      ?auto_476256 - BLOCK
    )
    :vars
    (
      ?auto_476257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476256 ?auto_476257 ) ( ON-TABLE ?auto_476242 ) ( ON ?auto_476243 ?auto_476242 ) ( not ( = ?auto_476242 ?auto_476243 ) ) ( not ( = ?auto_476242 ?auto_476244 ) ) ( not ( = ?auto_476242 ?auto_476245 ) ) ( not ( = ?auto_476242 ?auto_476246 ) ) ( not ( = ?auto_476242 ?auto_476247 ) ) ( not ( = ?auto_476242 ?auto_476248 ) ) ( not ( = ?auto_476242 ?auto_476249 ) ) ( not ( = ?auto_476242 ?auto_476250 ) ) ( not ( = ?auto_476242 ?auto_476251 ) ) ( not ( = ?auto_476242 ?auto_476252 ) ) ( not ( = ?auto_476242 ?auto_476253 ) ) ( not ( = ?auto_476242 ?auto_476254 ) ) ( not ( = ?auto_476242 ?auto_476255 ) ) ( not ( = ?auto_476242 ?auto_476256 ) ) ( not ( = ?auto_476242 ?auto_476257 ) ) ( not ( = ?auto_476243 ?auto_476244 ) ) ( not ( = ?auto_476243 ?auto_476245 ) ) ( not ( = ?auto_476243 ?auto_476246 ) ) ( not ( = ?auto_476243 ?auto_476247 ) ) ( not ( = ?auto_476243 ?auto_476248 ) ) ( not ( = ?auto_476243 ?auto_476249 ) ) ( not ( = ?auto_476243 ?auto_476250 ) ) ( not ( = ?auto_476243 ?auto_476251 ) ) ( not ( = ?auto_476243 ?auto_476252 ) ) ( not ( = ?auto_476243 ?auto_476253 ) ) ( not ( = ?auto_476243 ?auto_476254 ) ) ( not ( = ?auto_476243 ?auto_476255 ) ) ( not ( = ?auto_476243 ?auto_476256 ) ) ( not ( = ?auto_476243 ?auto_476257 ) ) ( not ( = ?auto_476244 ?auto_476245 ) ) ( not ( = ?auto_476244 ?auto_476246 ) ) ( not ( = ?auto_476244 ?auto_476247 ) ) ( not ( = ?auto_476244 ?auto_476248 ) ) ( not ( = ?auto_476244 ?auto_476249 ) ) ( not ( = ?auto_476244 ?auto_476250 ) ) ( not ( = ?auto_476244 ?auto_476251 ) ) ( not ( = ?auto_476244 ?auto_476252 ) ) ( not ( = ?auto_476244 ?auto_476253 ) ) ( not ( = ?auto_476244 ?auto_476254 ) ) ( not ( = ?auto_476244 ?auto_476255 ) ) ( not ( = ?auto_476244 ?auto_476256 ) ) ( not ( = ?auto_476244 ?auto_476257 ) ) ( not ( = ?auto_476245 ?auto_476246 ) ) ( not ( = ?auto_476245 ?auto_476247 ) ) ( not ( = ?auto_476245 ?auto_476248 ) ) ( not ( = ?auto_476245 ?auto_476249 ) ) ( not ( = ?auto_476245 ?auto_476250 ) ) ( not ( = ?auto_476245 ?auto_476251 ) ) ( not ( = ?auto_476245 ?auto_476252 ) ) ( not ( = ?auto_476245 ?auto_476253 ) ) ( not ( = ?auto_476245 ?auto_476254 ) ) ( not ( = ?auto_476245 ?auto_476255 ) ) ( not ( = ?auto_476245 ?auto_476256 ) ) ( not ( = ?auto_476245 ?auto_476257 ) ) ( not ( = ?auto_476246 ?auto_476247 ) ) ( not ( = ?auto_476246 ?auto_476248 ) ) ( not ( = ?auto_476246 ?auto_476249 ) ) ( not ( = ?auto_476246 ?auto_476250 ) ) ( not ( = ?auto_476246 ?auto_476251 ) ) ( not ( = ?auto_476246 ?auto_476252 ) ) ( not ( = ?auto_476246 ?auto_476253 ) ) ( not ( = ?auto_476246 ?auto_476254 ) ) ( not ( = ?auto_476246 ?auto_476255 ) ) ( not ( = ?auto_476246 ?auto_476256 ) ) ( not ( = ?auto_476246 ?auto_476257 ) ) ( not ( = ?auto_476247 ?auto_476248 ) ) ( not ( = ?auto_476247 ?auto_476249 ) ) ( not ( = ?auto_476247 ?auto_476250 ) ) ( not ( = ?auto_476247 ?auto_476251 ) ) ( not ( = ?auto_476247 ?auto_476252 ) ) ( not ( = ?auto_476247 ?auto_476253 ) ) ( not ( = ?auto_476247 ?auto_476254 ) ) ( not ( = ?auto_476247 ?auto_476255 ) ) ( not ( = ?auto_476247 ?auto_476256 ) ) ( not ( = ?auto_476247 ?auto_476257 ) ) ( not ( = ?auto_476248 ?auto_476249 ) ) ( not ( = ?auto_476248 ?auto_476250 ) ) ( not ( = ?auto_476248 ?auto_476251 ) ) ( not ( = ?auto_476248 ?auto_476252 ) ) ( not ( = ?auto_476248 ?auto_476253 ) ) ( not ( = ?auto_476248 ?auto_476254 ) ) ( not ( = ?auto_476248 ?auto_476255 ) ) ( not ( = ?auto_476248 ?auto_476256 ) ) ( not ( = ?auto_476248 ?auto_476257 ) ) ( not ( = ?auto_476249 ?auto_476250 ) ) ( not ( = ?auto_476249 ?auto_476251 ) ) ( not ( = ?auto_476249 ?auto_476252 ) ) ( not ( = ?auto_476249 ?auto_476253 ) ) ( not ( = ?auto_476249 ?auto_476254 ) ) ( not ( = ?auto_476249 ?auto_476255 ) ) ( not ( = ?auto_476249 ?auto_476256 ) ) ( not ( = ?auto_476249 ?auto_476257 ) ) ( not ( = ?auto_476250 ?auto_476251 ) ) ( not ( = ?auto_476250 ?auto_476252 ) ) ( not ( = ?auto_476250 ?auto_476253 ) ) ( not ( = ?auto_476250 ?auto_476254 ) ) ( not ( = ?auto_476250 ?auto_476255 ) ) ( not ( = ?auto_476250 ?auto_476256 ) ) ( not ( = ?auto_476250 ?auto_476257 ) ) ( not ( = ?auto_476251 ?auto_476252 ) ) ( not ( = ?auto_476251 ?auto_476253 ) ) ( not ( = ?auto_476251 ?auto_476254 ) ) ( not ( = ?auto_476251 ?auto_476255 ) ) ( not ( = ?auto_476251 ?auto_476256 ) ) ( not ( = ?auto_476251 ?auto_476257 ) ) ( not ( = ?auto_476252 ?auto_476253 ) ) ( not ( = ?auto_476252 ?auto_476254 ) ) ( not ( = ?auto_476252 ?auto_476255 ) ) ( not ( = ?auto_476252 ?auto_476256 ) ) ( not ( = ?auto_476252 ?auto_476257 ) ) ( not ( = ?auto_476253 ?auto_476254 ) ) ( not ( = ?auto_476253 ?auto_476255 ) ) ( not ( = ?auto_476253 ?auto_476256 ) ) ( not ( = ?auto_476253 ?auto_476257 ) ) ( not ( = ?auto_476254 ?auto_476255 ) ) ( not ( = ?auto_476254 ?auto_476256 ) ) ( not ( = ?auto_476254 ?auto_476257 ) ) ( not ( = ?auto_476255 ?auto_476256 ) ) ( not ( = ?auto_476255 ?auto_476257 ) ) ( not ( = ?auto_476256 ?auto_476257 ) ) ( ON ?auto_476255 ?auto_476256 ) ( ON ?auto_476254 ?auto_476255 ) ( ON ?auto_476253 ?auto_476254 ) ( ON ?auto_476252 ?auto_476253 ) ( ON ?auto_476251 ?auto_476252 ) ( ON ?auto_476250 ?auto_476251 ) ( ON ?auto_476249 ?auto_476250 ) ( ON ?auto_476248 ?auto_476249 ) ( ON ?auto_476247 ?auto_476248 ) ( ON ?auto_476246 ?auto_476247 ) ( ON ?auto_476245 ?auto_476246 ) ( CLEAR ?auto_476243 ) ( ON ?auto_476244 ?auto_476245 ) ( CLEAR ?auto_476244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_476242 ?auto_476243 ?auto_476244 )
      ( MAKE-15PILE ?auto_476242 ?auto_476243 ?auto_476244 ?auto_476245 ?auto_476246 ?auto_476247 ?auto_476248 ?auto_476249 ?auto_476250 ?auto_476251 ?auto_476252 ?auto_476253 ?auto_476254 ?auto_476255 ?auto_476256 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_476304 - BLOCK
      ?auto_476305 - BLOCK
      ?auto_476306 - BLOCK
      ?auto_476307 - BLOCK
      ?auto_476308 - BLOCK
      ?auto_476309 - BLOCK
      ?auto_476310 - BLOCK
      ?auto_476311 - BLOCK
      ?auto_476312 - BLOCK
      ?auto_476313 - BLOCK
      ?auto_476314 - BLOCK
      ?auto_476315 - BLOCK
      ?auto_476316 - BLOCK
      ?auto_476317 - BLOCK
      ?auto_476318 - BLOCK
    )
    :vars
    (
      ?auto_476319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476318 ?auto_476319 ) ( ON-TABLE ?auto_476304 ) ( not ( = ?auto_476304 ?auto_476305 ) ) ( not ( = ?auto_476304 ?auto_476306 ) ) ( not ( = ?auto_476304 ?auto_476307 ) ) ( not ( = ?auto_476304 ?auto_476308 ) ) ( not ( = ?auto_476304 ?auto_476309 ) ) ( not ( = ?auto_476304 ?auto_476310 ) ) ( not ( = ?auto_476304 ?auto_476311 ) ) ( not ( = ?auto_476304 ?auto_476312 ) ) ( not ( = ?auto_476304 ?auto_476313 ) ) ( not ( = ?auto_476304 ?auto_476314 ) ) ( not ( = ?auto_476304 ?auto_476315 ) ) ( not ( = ?auto_476304 ?auto_476316 ) ) ( not ( = ?auto_476304 ?auto_476317 ) ) ( not ( = ?auto_476304 ?auto_476318 ) ) ( not ( = ?auto_476304 ?auto_476319 ) ) ( not ( = ?auto_476305 ?auto_476306 ) ) ( not ( = ?auto_476305 ?auto_476307 ) ) ( not ( = ?auto_476305 ?auto_476308 ) ) ( not ( = ?auto_476305 ?auto_476309 ) ) ( not ( = ?auto_476305 ?auto_476310 ) ) ( not ( = ?auto_476305 ?auto_476311 ) ) ( not ( = ?auto_476305 ?auto_476312 ) ) ( not ( = ?auto_476305 ?auto_476313 ) ) ( not ( = ?auto_476305 ?auto_476314 ) ) ( not ( = ?auto_476305 ?auto_476315 ) ) ( not ( = ?auto_476305 ?auto_476316 ) ) ( not ( = ?auto_476305 ?auto_476317 ) ) ( not ( = ?auto_476305 ?auto_476318 ) ) ( not ( = ?auto_476305 ?auto_476319 ) ) ( not ( = ?auto_476306 ?auto_476307 ) ) ( not ( = ?auto_476306 ?auto_476308 ) ) ( not ( = ?auto_476306 ?auto_476309 ) ) ( not ( = ?auto_476306 ?auto_476310 ) ) ( not ( = ?auto_476306 ?auto_476311 ) ) ( not ( = ?auto_476306 ?auto_476312 ) ) ( not ( = ?auto_476306 ?auto_476313 ) ) ( not ( = ?auto_476306 ?auto_476314 ) ) ( not ( = ?auto_476306 ?auto_476315 ) ) ( not ( = ?auto_476306 ?auto_476316 ) ) ( not ( = ?auto_476306 ?auto_476317 ) ) ( not ( = ?auto_476306 ?auto_476318 ) ) ( not ( = ?auto_476306 ?auto_476319 ) ) ( not ( = ?auto_476307 ?auto_476308 ) ) ( not ( = ?auto_476307 ?auto_476309 ) ) ( not ( = ?auto_476307 ?auto_476310 ) ) ( not ( = ?auto_476307 ?auto_476311 ) ) ( not ( = ?auto_476307 ?auto_476312 ) ) ( not ( = ?auto_476307 ?auto_476313 ) ) ( not ( = ?auto_476307 ?auto_476314 ) ) ( not ( = ?auto_476307 ?auto_476315 ) ) ( not ( = ?auto_476307 ?auto_476316 ) ) ( not ( = ?auto_476307 ?auto_476317 ) ) ( not ( = ?auto_476307 ?auto_476318 ) ) ( not ( = ?auto_476307 ?auto_476319 ) ) ( not ( = ?auto_476308 ?auto_476309 ) ) ( not ( = ?auto_476308 ?auto_476310 ) ) ( not ( = ?auto_476308 ?auto_476311 ) ) ( not ( = ?auto_476308 ?auto_476312 ) ) ( not ( = ?auto_476308 ?auto_476313 ) ) ( not ( = ?auto_476308 ?auto_476314 ) ) ( not ( = ?auto_476308 ?auto_476315 ) ) ( not ( = ?auto_476308 ?auto_476316 ) ) ( not ( = ?auto_476308 ?auto_476317 ) ) ( not ( = ?auto_476308 ?auto_476318 ) ) ( not ( = ?auto_476308 ?auto_476319 ) ) ( not ( = ?auto_476309 ?auto_476310 ) ) ( not ( = ?auto_476309 ?auto_476311 ) ) ( not ( = ?auto_476309 ?auto_476312 ) ) ( not ( = ?auto_476309 ?auto_476313 ) ) ( not ( = ?auto_476309 ?auto_476314 ) ) ( not ( = ?auto_476309 ?auto_476315 ) ) ( not ( = ?auto_476309 ?auto_476316 ) ) ( not ( = ?auto_476309 ?auto_476317 ) ) ( not ( = ?auto_476309 ?auto_476318 ) ) ( not ( = ?auto_476309 ?auto_476319 ) ) ( not ( = ?auto_476310 ?auto_476311 ) ) ( not ( = ?auto_476310 ?auto_476312 ) ) ( not ( = ?auto_476310 ?auto_476313 ) ) ( not ( = ?auto_476310 ?auto_476314 ) ) ( not ( = ?auto_476310 ?auto_476315 ) ) ( not ( = ?auto_476310 ?auto_476316 ) ) ( not ( = ?auto_476310 ?auto_476317 ) ) ( not ( = ?auto_476310 ?auto_476318 ) ) ( not ( = ?auto_476310 ?auto_476319 ) ) ( not ( = ?auto_476311 ?auto_476312 ) ) ( not ( = ?auto_476311 ?auto_476313 ) ) ( not ( = ?auto_476311 ?auto_476314 ) ) ( not ( = ?auto_476311 ?auto_476315 ) ) ( not ( = ?auto_476311 ?auto_476316 ) ) ( not ( = ?auto_476311 ?auto_476317 ) ) ( not ( = ?auto_476311 ?auto_476318 ) ) ( not ( = ?auto_476311 ?auto_476319 ) ) ( not ( = ?auto_476312 ?auto_476313 ) ) ( not ( = ?auto_476312 ?auto_476314 ) ) ( not ( = ?auto_476312 ?auto_476315 ) ) ( not ( = ?auto_476312 ?auto_476316 ) ) ( not ( = ?auto_476312 ?auto_476317 ) ) ( not ( = ?auto_476312 ?auto_476318 ) ) ( not ( = ?auto_476312 ?auto_476319 ) ) ( not ( = ?auto_476313 ?auto_476314 ) ) ( not ( = ?auto_476313 ?auto_476315 ) ) ( not ( = ?auto_476313 ?auto_476316 ) ) ( not ( = ?auto_476313 ?auto_476317 ) ) ( not ( = ?auto_476313 ?auto_476318 ) ) ( not ( = ?auto_476313 ?auto_476319 ) ) ( not ( = ?auto_476314 ?auto_476315 ) ) ( not ( = ?auto_476314 ?auto_476316 ) ) ( not ( = ?auto_476314 ?auto_476317 ) ) ( not ( = ?auto_476314 ?auto_476318 ) ) ( not ( = ?auto_476314 ?auto_476319 ) ) ( not ( = ?auto_476315 ?auto_476316 ) ) ( not ( = ?auto_476315 ?auto_476317 ) ) ( not ( = ?auto_476315 ?auto_476318 ) ) ( not ( = ?auto_476315 ?auto_476319 ) ) ( not ( = ?auto_476316 ?auto_476317 ) ) ( not ( = ?auto_476316 ?auto_476318 ) ) ( not ( = ?auto_476316 ?auto_476319 ) ) ( not ( = ?auto_476317 ?auto_476318 ) ) ( not ( = ?auto_476317 ?auto_476319 ) ) ( not ( = ?auto_476318 ?auto_476319 ) ) ( ON ?auto_476317 ?auto_476318 ) ( ON ?auto_476316 ?auto_476317 ) ( ON ?auto_476315 ?auto_476316 ) ( ON ?auto_476314 ?auto_476315 ) ( ON ?auto_476313 ?auto_476314 ) ( ON ?auto_476312 ?auto_476313 ) ( ON ?auto_476311 ?auto_476312 ) ( ON ?auto_476310 ?auto_476311 ) ( ON ?auto_476309 ?auto_476310 ) ( ON ?auto_476308 ?auto_476309 ) ( ON ?auto_476307 ?auto_476308 ) ( ON ?auto_476306 ?auto_476307 ) ( CLEAR ?auto_476304 ) ( ON ?auto_476305 ?auto_476306 ) ( CLEAR ?auto_476305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_476304 ?auto_476305 )
      ( MAKE-15PILE ?auto_476304 ?auto_476305 ?auto_476306 ?auto_476307 ?auto_476308 ?auto_476309 ?auto_476310 ?auto_476311 ?auto_476312 ?auto_476313 ?auto_476314 ?auto_476315 ?auto_476316 ?auto_476317 ?auto_476318 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_476366 - BLOCK
      ?auto_476367 - BLOCK
      ?auto_476368 - BLOCK
      ?auto_476369 - BLOCK
      ?auto_476370 - BLOCK
      ?auto_476371 - BLOCK
      ?auto_476372 - BLOCK
      ?auto_476373 - BLOCK
      ?auto_476374 - BLOCK
      ?auto_476375 - BLOCK
      ?auto_476376 - BLOCK
      ?auto_476377 - BLOCK
      ?auto_476378 - BLOCK
      ?auto_476379 - BLOCK
      ?auto_476380 - BLOCK
    )
    :vars
    (
      ?auto_476381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476380 ?auto_476381 ) ( not ( = ?auto_476366 ?auto_476367 ) ) ( not ( = ?auto_476366 ?auto_476368 ) ) ( not ( = ?auto_476366 ?auto_476369 ) ) ( not ( = ?auto_476366 ?auto_476370 ) ) ( not ( = ?auto_476366 ?auto_476371 ) ) ( not ( = ?auto_476366 ?auto_476372 ) ) ( not ( = ?auto_476366 ?auto_476373 ) ) ( not ( = ?auto_476366 ?auto_476374 ) ) ( not ( = ?auto_476366 ?auto_476375 ) ) ( not ( = ?auto_476366 ?auto_476376 ) ) ( not ( = ?auto_476366 ?auto_476377 ) ) ( not ( = ?auto_476366 ?auto_476378 ) ) ( not ( = ?auto_476366 ?auto_476379 ) ) ( not ( = ?auto_476366 ?auto_476380 ) ) ( not ( = ?auto_476366 ?auto_476381 ) ) ( not ( = ?auto_476367 ?auto_476368 ) ) ( not ( = ?auto_476367 ?auto_476369 ) ) ( not ( = ?auto_476367 ?auto_476370 ) ) ( not ( = ?auto_476367 ?auto_476371 ) ) ( not ( = ?auto_476367 ?auto_476372 ) ) ( not ( = ?auto_476367 ?auto_476373 ) ) ( not ( = ?auto_476367 ?auto_476374 ) ) ( not ( = ?auto_476367 ?auto_476375 ) ) ( not ( = ?auto_476367 ?auto_476376 ) ) ( not ( = ?auto_476367 ?auto_476377 ) ) ( not ( = ?auto_476367 ?auto_476378 ) ) ( not ( = ?auto_476367 ?auto_476379 ) ) ( not ( = ?auto_476367 ?auto_476380 ) ) ( not ( = ?auto_476367 ?auto_476381 ) ) ( not ( = ?auto_476368 ?auto_476369 ) ) ( not ( = ?auto_476368 ?auto_476370 ) ) ( not ( = ?auto_476368 ?auto_476371 ) ) ( not ( = ?auto_476368 ?auto_476372 ) ) ( not ( = ?auto_476368 ?auto_476373 ) ) ( not ( = ?auto_476368 ?auto_476374 ) ) ( not ( = ?auto_476368 ?auto_476375 ) ) ( not ( = ?auto_476368 ?auto_476376 ) ) ( not ( = ?auto_476368 ?auto_476377 ) ) ( not ( = ?auto_476368 ?auto_476378 ) ) ( not ( = ?auto_476368 ?auto_476379 ) ) ( not ( = ?auto_476368 ?auto_476380 ) ) ( not ( = ?auto_476368 ?auto_476381 ) ) ( not ( = ?auto_476369 ?auto_476370 ) ) ( not ( = ?auto_476369 ?auto_476371 ) ) ( not ( = ?auto_476369 ?auto_476372 ) ) ( not ( = ?auto_476369 ?auto_476373 ) ) ( not ( = ?auto_476369 ?auto_476374 ) ) ( not ( = ?auto_476369 ?auto_476375 ) ) ( not ( = ?auto_476369 ?auto_476376 ) ) ( not ( = ?auto_476369 ?auto_476377 ) ) ( not ( = ?auto_476369 ?auto_476378 ) ) ( not ( = ?auto_476369 ?auto_476379 ) ) ( not ( = ?auto_476369 ?auto_476380 ) ) ( not ( = ?auto_476369 ?auto_476381 ) ) ( not ( = ?auto_476370 ?auto_476371 ) ) ( not ( = ?auto_476370 ?auto_476372 ) ) ( not ( = ?auto_476370 ?auto_476373 ) ) ( not ( = ?auto_476370 ?auto_476374 ) ) ( not ( = ?auto_476370 ?auto_476375 ) ) ( not ( = ?auto_476370 ?auto_476376 ) ) ( not ( = ?auto_476370 ?auto_476377 ) ) ( not ( = ?auto_476370 ?auto_476378 ) ) ( not ( = ?auto_476370 ?auto_476379 ) ) ( not ( = ?auto_476370 ?auto_476380 ) ) ( not ( = ?auto_476370 ?auto_476381 ) ) ( not ( = ?auto_476371 ?auto_476372 ) ) ( not ( = ?auto_476371 ?auto_476373 ) ) ( not ( = ?auto_476371 ?auto_476374 ) ) ( not ( = ?auto_476371 ?auto_476375 ) ) ( not ( = ?auto_476371 ?auto_476376 ) ) ( not ( = ?auto_476371 ?auto_476377 ) ) ( not ( = ?auto_476371 ?auto_476378 ) ) ( not ( = ?auto_476371 ?auto_476379 ) ) ( not ( = ?auto_476371 ?auto_476380 ) ) ( not ( = ?auto_476371 ?auto_476381 ) ) ( not ( = ?auto_476372 ?auto_476373 ) ) ( not ( = ?auto_476372 ?auto_476374 ) ) ( not ( = ?auto_476372 ?auto_476375 ) ) ( not ( = ?auto_476372 ?auto_476376 ) ) ( not ( = ?auto_476372 ?auto_476377 ) ) ( not ( = ?auto_476372 ?auto_476378 ) ) ( not ( = ?auto_476372 ?auto_476379 ) ) ( not ( = ?auto_476372 ?auto_476380 ) ) ( not ( = ?auto_476372 ?auto_476381 ) ) ( not ( = ?auto_476373 ?auto_476374 ) ) ( not ( = ?auto_476373 ?auto_476375 ) ) ( not ( = ?auto_476373 ?auto_476376 ) ) ( not ( = ?auto_476373 ?auto_476377 ) ) ( not ( = ?auto_476373 ?auto_476378 ) ) ( not ( = ?auto_476373 ?auto_476379 ) ) ( not ( = ?auto_476373 ?auto_476380 ) ) ( not ( = ?auto_476373 ?auto_476381 ) ) ( not ( = ?auto_476374 ?auto_476375 ) ) ( not ( = ?auto_476374 ?auto_476376 ) ) ( not ( = ?auto_476374 ?auto_476377 ) ) ( not ( = ?auto_476374 ?auto_476378 ) ) ( not ( = ?auto_476374 ?auto_476379 ) ) ( not ( = ?auto_476374 ?auto_476380 ) ) ( not ( = ?auto_476374 ?auto_476381 ) ) ( not ( = ?auto_476375 ?auto_476376 ) ) ( not ( = ?auto_476375 ?auto_476377 ) ) ( not ( = ?auto_476375 ?auto_476378 ) ) ( not ( = ?auto_476375 ?auto_476379 ) ) ( not ( = ?auto_476375 ?auto_476380 ) ) ( not ( = ?auto_476375 ?auto_476381 ) ) ( not ( = ?auto_476376 ?auto_476377 ) ) ( not ( = ?auto_476376 ?auto_476378 ) ) ( not ( = ?auto_476376 ?auto_476379 ) ) ( not ( = ?auto_476376 ?auto_476380 ) ) ( not ( = ?auto_476376 ?auto_476381 ) ) ( not ( = ?auto_476377 ?auto_476378 ) ) ( not ( = ?auto_476377 ?auto_476379 ) ) ( not ( = ?auto_476377 ?auto_476380 ) ) ( not ( = ?auto_476377 ?auto_476381 ) ) ( not ( = ?auto_476378 ?auto_476379 ) ) ( not ( = ?auto_476378 ?auto_476380 ) ) ( not ( = ?auto_476378 ?auto_476381 ) ) ( not ( = ?auto_476379 ?auto_476380 ) ) ( not ( = ?auto_476379 ?auto_476381 ) ) ( not ( = ?auto_476380 ?auto_476381 ) ) ( ON ?auto_476379 ?auto_476380 ) ( ON ?auto_476378 ?auto_476379 ) ( ON ?auto_476377 ?auto_476378 ) ( ON ?auto_476376 ?auto_476377 ) ( ON ?auto_476375 ?auto_476376 ) ( ON ?auto_476374 ?auto_476375 ) ( ON ?auto_476373 ?auto_476374 ) ( ON ?auto_476372 ?auto_476373 ) ( ON ?auto_476371 ?auto_476372 ) ( ON ?auto_476370 ?auto_476371 ) ( ON ?auto_476369 ?auto_476370 ) ( ON ?auto_476368 ?auto_476369 ) ( ON ?auto_476367 ?auto_476368 ) ( ON ?auto_476366 ?auto_476367 ) ( CLEAR ?auto_476366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_476366 )
      ( MAKE-15PILE ?auto_476366 ?auto_476367 ?auto_476368 ?auto_476369 ?auto_476370 ?auto_476371 ?auto_476372 ?auto_476373 ?auto_476374 ?auto_476375 ?auto_476376 ?auto_476377 ?auto_476378 ?auto_476379 ?auto_476380 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476429 - BLOCK
      ?auto_476430 - BLOCK
      ?auto_476431 - BLOCK
      ?auto_476432 - BLOCK
      ?auto_476433 - BLOCK
      ?auto_476434 - BLOCK
      ?auto_476435 - BLOCK
      ?auto_476436 - BLOCK
      ?auto_476437 - BLOCK
      ?auto_476438 - BLOCK
      ?auto_476439 - BLOCK
      ?auto_476440 - BLOCK
      ?auto_476441 - BLOCK
      ?auto_476442 - BLOCK
      ?auto_476443 - BLOCK
      ?auto_476444 - BLOCK
    )
    :vars
    (
      ?auto_476445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_476443 ) ( ON ?auto_476444 ?auto_476445 ) ( CLEAR ?auto_476444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_476429 ) ( ON ?auto_476430 ?auto_476429 ) ( ON ?auto_476431 ?auto_476430 ) ( ON ?auto_476432 ?auto_476431 ) ( ON ?auto_476433 ?auto_476432 ) ( ON ?auto_476434 ?auto_476433 ) ( ON ?auto_476435 ?auto_476434 ) ( ON ?auto_476436 ?auto_476435 ) ( ON ?auto_476437 ?auto_476436 ) ( ON ?auto_476438 ?auto_476437 ) ( ON ?auto_476439 ?auto_476438 ) ( ON ?auto_476440 ?auto_476439 ) ( ON ?auto_476441 ?auto_476440 ) ( ON ?auto_476442 ?auto_476441 ) ( ON ?auto_476443 ?auto_476442 ) ( not ( = ?auto_476429 ?auto_476430 ) ) ( not ( = ?auto_476429 ?auto_476431 ) ) ( not ( = ?auto_476429 ?auto_476432 ) ) ( not ( = ?auto_476429 ?auto_476433 ) ) ( not ( = ?auto_476429 ?auto_476434 ) ) ( not ( = ?auto_476429 ?auto_476435 ) ) ( not ( = ?auto_476429 ?auto_476436 ) ) ( not ( = ?auto_476429 ?auto_476437 ) ) ( not ( = ?auto_476429 ?auto_476438 ) ) ( not ( = ?auto_476429 ?auto_476439 ) ) ( not ( = ?auto_476429 ?auto_476440 ) ) ( not ( = ?auto_476429 ?auto_476441 ) ) ( not ( = ?auto_476429 ?auto_476442 ) ) ( not ( = ?auto_476429 ?auto_476443 ) ) ( not ( = ?auto_476429 ?auto_476444 ) ) ( not ( = ?auto_476429 ?auto_476445 ) ) ( not ( = ?auto_476430 ?auto_476431 ) ) ( not ( = ?auto_476430 ?auto_476432 ) ) ( not ( = ?auto_476430 ?auto_476433 ) ) ( not ( = ?auto_476430 ?auto_476434 ) ) ( not ( = ?auto_476430 ?auto_476435 ) ) ( not ( = ?auto_476430 ?auto_476436 ) ) ( not ( = ?auto_476430 ?auto_476437 ) ) ( not ( = ?auto_476430 ?auto_476438 ) ) ( not ( = ?auto_476430 ?auto_476439 ) ) ( not ( = ?auto_476430 ?auto_476440 ) ) ( not ( = ?auto_476430 ?auto_476441 ) ) ( not ( = ?auto_476430 ?auto_476442 ) ) ( not ( = ?auto_476430 ?auto_476443 ) ) ( not ( = ?auto_476430 ?auto_476444 ) ) ( not ( = ?auto_476430 ?auto_476445 ) ) ( not ( = ?auto_476431 ?auto_476432 ) ) ( not ( = ?auto_476431 ?auto_476433 ) ) ( not ( = ?auto_476431 ?auto_476434 ) ) ( not ( = ?auto_476431 ?auto_476435 ) ) ( not ( = ?auto_476431 ?auto_476436 ) ) ( not ( = ?auto_476431 ?auto_476437 ) ) ( not ( = ?auto_476431 ?auto_476438 ) ) ( not ( = ?auto_476431 ?auto_476439 ) ) ( not ( = ?auto_476431 ?auto_476440 ) ) ( not ( = ?auto_476431 ?auto_476441 ) ) ( not ( = ?auto_476431 ?auto_476442 ) ) ( not ( = ?auto_476431 ?auto_476443 ) ) ( not ( = ?auto_476431 ?auto_476444 ) ) ( not ( = ?auto_476431 ?auto_476445 ) ) ( not ( = ?auto_476432 ?auto_476433 ) ) ( not ( = ?auto_476432 ?auto_476434 ) ) ( not ( = ?auto_476432 ?auto_476435 ) ) ( not ( = ?auto_476432 ?auto_476436 ) ) ( not ( = ?auto_476432 ?auto_476437 ) ) ( not ( = ?auto_476432 ?auto_476438 ) ) ( not ( = ?auto_476432 ?auto_476439 ) ) ( not ( = ?auto_476432 ?auto_476440 ) ) ( not ( = ?auto_476432 ?auto_476441 ) ) ( not ( = ?auto_476432 ?auto_476442 ) ) ( not ( = ?auto_476432 ?auto_476443 ) ) ( not ( = ?auto_476432 ?auto_476444 ) ) ( not ( = ?auto_476432 ?auto_476445 ) ) ( not ( = ?auto_476433 ?auto_476434 ) ) ( not ( = ?auto_476433 ?auto_476435 ) ) ( not ( = ?auto_476433 ?auto_476436 ) ) ( not ( = ?auto_476433 ?auto_476437 ) ) ( not ( = ?auto_476433 ?auto_476438 ) ) ( not ( = ?auto_476433 ?auto_476439 ) ) ( not ( = ?auto_476433 ?auto_476440 ) ) ( not ( = ?auto_476433 ?auto_476441 ) ) ( not ( = ?auto_476433 ?auto_476442 ) ) ( not ( = ?auto_476433 ?auto_476443 ) ) ( not ( = ?auto_476433 ?auto_476444 ) ) ( not ( = ?auto_476433 ?auto_476445 ) ) ( not ( = ?auto_476434 ?auto_476435 ) ) ( not ( = ?auto_476434 ?auto_476436 ) ) ( not ( = ?auto_476434 ?auto_476437 ) ) ( not ( = ?auto_476434 ?auto_476438 ) ) ( not ( = ?auto_476434 ?auto_476439 ) ) ( not ( = ?auto_476434 ?auto_476440 ) ) ( not ( = ?auto_476434 ?auto_476441 ) ) ( not ( = ?auto_476434 ?auto_476442 ) ) ( not ( = ?auto_476434 ?auto_476443 ) ) ( not ( = ?auto_476434 ?auto_476444 ) ) ( not ( = ?auto_476434 ?auto_476445 ) ) ( not ( = ?auto_476435 ?auto_476436 ) ) ( not ( = ?auto_476435 ?auto_476437 ) ) ( not ( = ?auto_476435 ?auto_476438 ) ) ( not ( = ?auto_476435 ?auto_476439 ) ) ( not ( = ?auto_476435 ?auto_476440 ) ) ( not ( = ?auto_476435 ?auto_476441 ) ) ( not ( = ?auto_476435 ?auto_476442 ) ) ( not ( = ?auto_476435 ?auto_476443 ) ) ( not ( = ?auto_476435 ?auto_476444 ) ) ( not ( = ?auto_476435 ?auto_476445 ) ) ( not ( = ?auto_476436 ?auto_476437 ) ) ( not ( = ?auto_476436 ?auto_476438 ) ) ( not ( = ?auto_476436 ?auto_476439 ) ) ( not ( = ?auto_476436 ?auto_476440 ) ) ( not ( = ?auto_476436 ?auto_476441 ) ) ( not ( = ?auto_476436 ?auto_476442 ) ) ( not ( = ?auto_476436 ?auto_476443 ) ) ( not ( = ?auto_476436 ?auto_476444 ) ) ( not ( = ?auto_476436 ?auto_476445 ) ) ( not ( = ?auto_476437 ?auto_476438 ) ) ( not ( = ?auto_476437 ?auto_476439 ) ) ( not ( = ?auto_476437 ?auto_476440 ) ) ( not ( = ?auto_476437 ?auto_476441 ) ) ( not ( = ?auto_476437 ?auto_476442 ) ) ( not ( = ?auto_476437 ?auto_476443 ) ) ( not ( = ?auto_476437 ?auto_476444 ) ) ( not ( = ?auto_476437 ?auto_476445 ) ) ( not ( = ?auto_476438 ?auto_476439 ) ) ( not ( = ?auto_476438 ?auto_476440 ) ) ( not ( = ?auto_476438 ?auto_476441 ) ) ( not ( = ?auto_476438 ?auto_476442 ) ) ( not ( = ?auto_476438 ?auto_476443 ) ) ( not ( = ?auto_476438 ?auto_476444 ) ) ( not ( = ?auto_476438 ?auto_476445 ) ) ( not ( = ?auto_476439 ?auto_476440 ) ) ( not ( = ?auto_476439 ?auto_476441 ) ) ( not ( = ?auto_476439 ?auto_476442 ) ) ( not ( = ?auto_476439 ?auto_476443 ) ) ( not ( = ?auto_476439 ?auto_476444 ) ) ( not ( = ?auto_476439 ?auto_476445 ) ) ( not ( = ?auto_476440 ?auto_476441 ) ) ( not ( = ?auto_476440 ?auto_476442 ) ) ( not ( = ?auto_476440 ?auto_476443 ) ) ( not ( = ?auto_476440 ?auto_476444 ) ) ( not ( = ?auto_476440 ?auto_476445 ) ) ( not ( = ?auto_476441 ?auto_476442 ) ) ( not ( = ?auto_476441 ?auto_476443 ) ) ( not ( = ?auto_476441 ?auto_476444 ) ) ( not ( = ?auto_476441 ?auto_476445 ) ) ( not ( = ?auto_476442 ?auto_476443 ) ) ( not ( = ?auto_476442 ?auto_476444 ) ) ( not ( = ?auto_476442 ?auto_476445 ) ) ( not ( = ?auto_476443 ?auto_476444 ) ) ( not ( = ?auto_476443 ?auto_476445 ) ) ( not ( = ?auto_476444 ?auto_476445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_476444 ?auto_476445 )
      ( !STACK ?auto_476444 ?auto_476443 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476462 - BLOCK
      ?auto_476463 - BLOCK
      ?auto_476464 - BLOCK
      ?auto_476465 - BLOCK
      ?auto_476466 - BLOCK
      ?auto_476467 - BLOCK
      ?auto_476468 - BLOCK
      ?auto_476469 - BLOCK
      ?auto_476470 - BLOCK
      ?auto_476471 - BLOCK
      ?auto_476472 - BLOCK
      ?auto_476473 - BLOCK
      ?auto_476474 - BLOCK
      ?auto_476475 - BLOCK
      ?auto_476476 - BLOCK
      ?auto_476477 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_476476 ) ( ON-TABLE ?auto_476477 ) ( CLEAR ?auto_476477 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_476462 ) ( ON ?auto_476463 ?auto_476462 ) ( ON ?auto_476464 ?auto_476463 ) ( ON ?auto_476465 ?auto_476464 ) ( ON ?auto_476466 ?auto_476465 ) ( ON ?auto_476467 ?auto_476466 ) ( ON ?auto_476468 ?auto_476467 ) ( ON ?auto_476469 ?auto_476468 ) ( ON ?auto_476470 ?auto_476469 ) ( ON ?auto_476471 ?auto_476470 ) ( ON ?auto_476472 ?auto_476471 ) ( ON ?auto_476473 ?auto_476472 ) ( ON ?auto_476474 ?auto_476473 ) ( ON ?auto_476475 ?auto_476474 ) ( ON ?auto_476476 ?auto_476475 ) ( not ( = ?auto_476462 ?auto_476463 ) ) ( not ( = ?auto_476462 ?auto_476464 ) ) ( not ( = ?auto_476462 ?auto_476465 ) ) ( not ( = ?auto_476462 ?auto_476466 ) ) ( not ( = ?auto_476462 ?auto_476467 ) ) ( not ( = ?auto_476462 ?auto_476468 ) ) ( not ( = ?auto_476462 ?auto_476469 ) ) ( not ( = ?auto_476462 ?auto_476470 ) ) ( not ( = ?auto_476462 ?auto_476471 ) ) ( not ( = ?auto_476462 ?auto_476472 ) ) ( not ( = ?auto_476462 ?auto_476473 ) ) ( not ( = ?auto_476462 ?auto_476474 ) ) ( not ( = ?auto_476462 ?auto_476475 ) ) ( not ( = ?auto_476462 ?auto_476476 ) ) ( not ( = ?auto_476462 ?auto_476477 ) ) ( not ( = ?auto_476463 ?auto_476464 ) ) ( not ( = ?auto_476463 ?auto_476465 ) ) ( not ( = ?auto_476463 ?auto_476466 ) ) ( not ( = ?auto_476463 ?auto_476467 ) ) ( not ( = ?auto_476463 ?auto_476468 ) ) ( not ( = ?auto_476463 ?auto_476469 ) ) ( not ( = ?auto_476463 ?auto_476470 ) ) ( not ( = ?auto_476463 ?auto_476471 ) ) ( not ( = ?auto_476463 ?auto_476472 ) ) ( not ( = ?auto_476463 ?auto_476473 ) ) ( not ( = ?auto_476463 ?auto_476474 ) ) ( not ( = ?auto_476463 ?auto_476475 ) ) ( not ( = ?auto_476463 ?auto_476476 ) ) ( not ( = ?auto_476463 ?auto_476477 ) ) ( not ( = ?auto_476464 ?auto_476465 ) ) ( not ( = ?auto_476464 ?auto_476466 ) ) ( not ( = ?auto_476464 ?auto_476467 ) ) ( not ( = ?auto_476464 ?auto_476468 ) ) ( not ( = ?auto_476464 ?auto_476469 ) ) ( not ( = ?auto_476464 ?auto_476470 ) ) ( not ( = ?auto_476464 ?auto_476471 ) ) ( not ( = ?auto_476464 ?auto_476472 ) ) ( not ( = ?auto_476464 ?auto_476473 ) ) ( not ( = ?auto_476464 ?auto_476474 ) ) ( not ( = ?auto_476464 ?auto_476475 ) ) ( not ( = ?auto_476464 ?auto_476476 ) ) ( not ( = ?auto_476464 ?auto_476477 ) ) ( not ( = ?auto_476465 ?auto_476466 ) ) ( not ( = ?auto_476465 ?auto_476467 ) ) ( not ( = ?auto_476465 ?auto_476468 ) ) ( not ( = ?auto_476465 ?auto_476469 ) ) ( not ( = ?auto_476465 ?auto_476470 ) ) ( not ( = ?auto_476465 ?auto_476471 ) ) ( not ( = ?auto_476465 ?auto_476472 ) ) ( not ( = ?auto_476465 ?auto_476473 ) ) ( not ( = ?auto_476465 ?auto_476474 ) ) ( not ( = ?auto_476465 ?auto_476475 ) ) ( not ( = ?auto_476465 ?auto_476476 ) ) ( not ( = ?auto_476465 ?auto_476477 ) ) ( not ( = ?auto_476466 ?auto_476467 ) ) ( not ( = ?auto_476466 ?auto_476468 ) ) ( not ( = ?auto_476466 ?auto_476469 ) ) ( not ( = ?auto_476466 ?auto_476470 ) ) ( not ( = ?auto_476466 ?auto_476471 ) ) ( not ( = ?auto_476466 ?auto_476472 ) ) ( not ( = ?auto_476466 ?auto_476473 ) ) ( not ( = ?auto_476466 ?auto_476474 ) ) ( not ( = ?auto_476466 ?auto_476475 ) ) ( not ( = ?auto_476466 ?auto_476476 ) ) ( not ( = ?auto_476466 ?auto_476477 ) ) ( not ( = ?auto_476467 ?auto_476468 ) ) ( not ( = ?auto_476467 ?auto_476469 ) ) ( not ( = ?auto_476467 ?auto_476470 ) ) ( not ( = ?auto_476467 ?auto_476471 ) ) ( not ( = ?auto_476467 ?auto_476472 ) ) ( not ( = ?auto_476467 ?auto_476473 ) ) ( not ( = ?auto_476467 ?auto_476474 ) ) ( not ( = ?auto_476467 ?auto_476475 ) ) ( not ( = ?auto_476467 ?auto_476476 ) ) ( not ( = ?auto_476467 ?auto_476477 ) ) ( not ( = ?auto_476468 ?auto_476469 ) ) ( not ( = ?auto_476468 ?auto_476470 ) ) ( not ( = ?auto_476468 ?auto_476471 ) ) ( not ( = ?auto_476468 ?auto_476472 ) ) ( not ( = ?auto_476468 ?auto_476473 ) ) ( not ( = ?auto_476468 ?auto_476474 ) ) ( not ( = ?auto_476468 ?auto_476475 ) ) ( not ( = ?auto_476468 ?auto_476476 ) ) ( not ( = ?auto_476468 ?auto_476477 ) ) ( not ( = ?auto_476469 ?auto_476470 ) ) ( not ( = ?auto_476469 ?auto_476471 ) ) ( not ( = ?auto_476469 ?auto_476472 ) ) ( not ( = ?auto_476469 ?auto_476473 ) ) ( not ( = ?auto_476469 ?auto_476474 ) ) ( not ( = ?auto_476469 ?auto_476475 ) ) ( not ( = ?auto_476469 ?auto_476476 ) ) ( not ( = ?auto_476469 ?auto_476477 ) ) ( not ( = ?auto_476470 ?auto_476471 ) ) ( not ( = ?auto_476470 ?auto_476472 ) ) ( not ( = ?auto_476470 ?auto_476473 ) ) ( not ( = ?auto_476470 ?auto_476474 ) ) ( not ( = ?auto_476470 ?auto_476475 ) ) ( not ( = ?auto_476470 ?auto_476476 ) ) ( not ( = ?auto_476470 ?auto_476477 ) ) ( not ( = ?auto_476471 ?auto_476472 ) ) ( not ( = ?auto_476471 ?auto_476473 ) ) ( not ( = ?auto_476471 ?auto_476474 ) ) ( not ( = ?auto_476471 ?auto_476475 ) ) ( not ( = ?auto_476471 ?auto_476476 ) ) ( not ( = ?auto_476471 ?auto_476477 ) ) ( not ( = ?auto_476472 ?auto_476473 ) ) ( not ( = ?auto_476472 ?auto_476474 ) ) ( not ( = ?auto_476472 ?auto_476475 ) ) ( not ( = ?auto_476472 ?auto_476476 ) ) ( not ( = ?auto_476472 ?auto_476477 ) ) ( not ( = ?auto_476473 ?auto_476474 ) ) ( not ( = ?auto_476473 ?auto_476475 ) ) ( not ( = ?auto_476473 ?auto_476476 ) ) ( not ( = ?auto_476473 ?auto_476477 ) ) ( not ( = ?auto_476474 ?auto_476475 ) ) ( not ( = ?auto_476474 ?auto_476476 ) ) ( not ( = ?auto_476474 ?auto_476477 ) ) ( not ( = ?auto_476475 ?auto_476476 ) ) ( not ( = ?auto_476475 ?auto_476477 ) ) ( not ( = ?auto_476476 ?auto_476477 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_476477 )
      ( !STACK ?auto_476477 ?auto_476476 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476494 - BLOCK
      ?auto_476495 - BLOCK
      ?auto_476496 - BLOCK
      ?auto_476497 - BLOCK
      ?auto_476498 - BLOCK
      ?auto_476499 - BLOCK
      ?auto_476500 - BLOCK
      ?auto_476501 - BLOCK
      ?auto_476502 - BLOCK
      ?auto_476503 - BLOCK
      ?auto_476504 - BLOCK
      ?auto_476505 - BLOCK
      ?auto_476506 - BLOCK
      ?auto_476507 - BLOCK
      ?auto_476508 - BLOCK
      ?auto_476509 - BLOCK
    )
    :vars
    (
      ?auto_476510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476509 ?auto_476510 ) ( ON-TABLE ?auto_476494 ) ( ON ?auto_476495 ?auto_476494 ) ( ON ?auto_476496 ?auto_476495 ) ( ON ?auto_476497 ?auto_476496 ) ( ON ?auto_476498 ?auto_476497 ) ( ON ?auto_476499 ?auto_476498 ) ( ON ?auto_476500 ?auto_476499 ) ( ON ?auto_476501 ?auto_476500 ) ( ON ?auto_476502 ?auto_476501 ) ( ON ?auto_476503 ?auto_476502 ) ( ON ?auto_476504 ?auto_476503 ) ( ON ?auto_476505 ?auto_476504 ) ( ON ?auto_476506 ?auto_476505 ) ( ON ?auto_476507 ?auto_476506 ) ( not ( = ?auto_476494 ?auto_476495 ) ) ( not ( = ?auto_476494 ?auto_476496 ) ) ( not ( = ?auto_476494 ?auto_476497 ) ) ( not ( = ?auto_476494 ?auto_476498 ) ) ( not ( = ?auto_476494 ?auto_476499 ) ) ( not ( = ?auto_476494 ?auto_476500 ) ) ( not ( = ?auto_476494 ?auto_476501 ) ) ( not ( = ?auto_476494 ?auto_476502 ) ) ( not ( = ?auto_476494 ?auto_476503 ) ) ( not ( = ?auto_476494 ?auto_476504 ) ) ( not ( = ?auto_476494 ?auto_476505 ) ) ( not ( = ?auto_476494 ?auto_476506 ) ) ( not ( = ?auto_476494 ?auto_476507 ) ) ( not ( = ?auto_476494 ?auto_476508 ) ) ( not ( = ?auto_476494 ?auto_476509 ) ) ( not ( = ?auto_476494 ?auto_476510 ) ) ( not ( = ?auto_476495 ?auto_476496 ) ) ( not ( = ?auto_476495 ?auto_476497 ) ) ( not ( = ?auto_476495 ?auto_476498 ) ) ( not ( = ?auto_476495 ?auto_476499 ) ) ( not ( = ?auto_476495 ?auto_476500 ) ) ( not ( = ?auto_476495 ?auto_476501 ) ) ( not ( = ?auto_476495 ?auto_476502 ) ) ( not ( = ?auto_476495 ?auto_476503 ) ) ( not ( = ?auto_476495 ?auto_476504 ) ) ( not ( = ?auto_476495 ?auto_476505 ) ) ( not ( = ?auto_476495 ?auto_476506 ) ) ( not ( = ?auto_476495 ?auto_476507 ) ) ( not ( = ?auto_476495 ?auto_476508 ) ) ( not ( = ?auto_476495 ?auto_476509 ) ) ( not ( = ?auto_476495 ?auto_476510 ) ) ( not ( = ?auto_476496 ?auto_476497 ) ) ( not ( = ?auto_476496 ?auto_476498 ) ) ( not ( = ?auto_476496 ?auto_476499 ) ) ( not ( = ?auto_476496 ?auto_476500 ) ) ( not ( = ?auto_476496 ?auto_476501 ) ) ( not ( = ?auto_476496 ?auto_476502 ) ) ( not ( = ?auto_476496 ?auto_476503 ) ) ( not ( = ?auto_476496 ?auto_476504 ) ) ( not ( = ?auto_476496 ?auto_476505 ) ) ( not ( = ?auto_476496 ?auto_476506 ) ) ( not ( = ?auto_476496 ?auto_476507 ) ) ( not ( = ?auto_476496 ?auto_476508 ) ) ( not ( = ?auto_476496 ?auto_476509 ) ) ( not ( = ?auto_476496 ?auto_476510 ) ) ( not ( = ?auto_476497 ?auto_476498 ) ) ( not ( = ?auto_476497 ?auto_476499 ) ) ( not ( = ?auto_476497 ?auto_476500 ) ) ( not ( = ?auto_476497 ?auto_476501 ) ) ( not ( = ?auto_476497 ?auto_476502 ) ) ( not ( = ?auto_476497 ?auto_476503 ) ) ( not ( = ?auto_476497 ?auto_476504 ) ) ( not ( = ?auto_476497 ?auto_476505 ) ) ( not ( = ?auto_476497 ?auto_476506 ) ) ( not ( = ?auto_476497 ?auto_476507 ) ) ( not ( = ?auto_476497 ?auto_476508 ) ) ( not ( = ?auto_476497 ?auto_476509 ) ) ( not ( = ?auto_476497 ?auto_476510 ) ) ( not ( = ?auto_476498 ?auto_476499 ) ) ( not ( = ?auto_476498 ?auto_476500 ) ) ( not ( = ?auto_476498 ?auto_476501 ) ) ( not ( = ?auto_476498 ?auto_476502 ) ) ( not ( = ?auto_476498 ?auto_476503 ) ) ( not ( = ?auto_476498 ?auto_476504 ) ) ( not ( = ?auto_476498 ?auto_476505 ) ) ( not ( = ?auto_476498 ?auto_476506 ) ) ( not ( = ?auto_476498 ?auto_476507 ) ) ( not ( = ?auto_476498 ?auto_476508 ) ) ( not ( = ?auto_476498 ?auto_476509 ) ) ( not ( = ?auto_476498 ?auto_476510 ) ) ( not ( = ?auto_476499 ?auto_476500 ) ) ( not ( = ?auto_476499 ?auto_476501 ) ) ( not ( = ?auto_476499 ?auto_476502 ) ) ( not ( = ?auto_476499 ?auto_476503 ) ) ( not ( = ?auto_476499 ?auto_476504 ) ) ( not ( = ?auto_476499 ?auto_476505 ) ) ( not ( = ?auto_476499 ?auto_476506 ) ) ( not ( = ?auto_476499 ?auto_476507 ) ) ( not ( = ?auto_476499 ?auto_476508 ) ) ( not ( = ?auto_476499 ?auto_476509 ) ) ( not ( = ?auto_476499 ?auto_476510 ) ) ( not ( = ?auto_476500 ?auto_476501 ) ) ( not ( = ?auto_476500 ?auto_476502 ) ) ( not ( = ?auto_476500 ?auto_476503 ) ) ( not ( = ?auto_476500 ?auto_476504 ) ) ( not ( = ?auto_476500 ?auto_476505 ) ) ( not ( = ?auto_476500 ?auto_476506 ) ) ( not ( = ?auto_476500 ?auto_476507 ) ) ( not ( = ?auto_476500 ?auto_476508 ) ) ( not ( = ?auto_476500 ?auto_476509 ) ) ( not ( = ?auto_476500 ?auto_476510 ) ) ( not ( = ?auto_476501 ?auto_476502 ) ) ( not ( = ?auto_476501 ?auto_476503 ) ) ( not ( = ?auto_476501 ?auto_476504 ) ) ( not ( = ?auto_476501 ?auto_476505 ) ) ( not ( = ?auto_476501 ?auto_476506 ) ) ( not ( = ?auto_476501 ?auto_476507 ) ) ( not ( = ?auto_476501 ?auto_476508 ) ) ( not ( = ?auto_476501 ?auto_476509 ) ) ( not ( = ?auto_476501 ?auto_476510 ) ) ( not ( = ?auto_476502 ?auto_476503 ) ) ( not ( = ?auto_476502 ?auto_476504 ) ) ( not ( = ?auto_476502 ?auto_476505 ) ) ( not ( = ?auto_476502 ?auto_476506 ) ) ( not ( = ?auto_476502 ?auto_476507 ) ) ( not ( = ?auto_476502 ?auto_476508 ) ) ( not ( = ?auto_476502 ?auto_476509 ) ) ( not ( = ?auto_476502 ?auto_476510 ) ) ( not ( = ?auto_476503 ?auto_476504 ) ) ( not ( = ?auto_476503 ?auto_476505 ) ) ( not ( = ?auto_476503 ?auto_476506 ) ) ( not ( = ?auto_476503 ?auto_476507 ) ) ( not ( = ?auto_476503 ?auto_476508 ) ) ( not ( = ?auto_476503 ?auto_476509 ) ) ( not ( = ?auto_476503 ?auto_476510 ) ) ( not ( = ?auto_476504 ?auto_476505 ) ) ( not ( = ?auto_476504 ?auto_476506 ) ) ( not ( = ?auto_476504 ?auto_476507 ) ) ( not ( = ?auto_476504 ?auto_476508 ) ) ( not ( = ?auto_476504 ?auto_476509 ) ) ( not ( = ?auto_476504 ?auto_476510 ) ) ( not ( = ?auto_476505 ?auto_476506 ) ) ( not ( = ?auto_476505 ?auto_476507 ) ) ( not ( = ?auto_476505 ?auto_476508 ) ) ( not ( = ?auto_476505 ?auto_476509 ) ) ( not ( = ?auto_476505 ?auto_476510 ) ) ( not ( = ?auto_476506 ?auto_476507 ) ) ( not ( = ?auto_476506 ?auto_476508 ) ) ( not ( = ?auto_476506 ?auto_476509 ) ) ( not ( = ?auto_476506 ?auto_476510 ) ) ( not ( = ?auto_476507 ?auto_476508 ) ) ( not ( = ?auto_476507 ?auto_476509 ) ) ( not ( = ?auto_476507 ?auto_476510 ) ) ( not ( = ?auto_476508 ?auto_476509 ) ) ( not ( = ?auto_476508 ?auto_476510 ) ) ( not ( = ?auto_476509 ?auto_476510 ) ) ( CLEAR ?auto_476507 ) ( ON ?auto_476508 ?auto_476509 ) ( CLEAR ?auto_476508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_476494 ?auto_476495 ?auto_476496 ?auto_476497 ?auto_476498 ?auto_476499 ?auto_476500 ?auto_476501 ?auto_476502 ?auto_476503 ?auto_476504 ?auto_476505 ?auto_476506 ?auto_476507 ?auto_476508 )
      ( MAKE-16PILE ?auto_476494 ?auto_476495 ?auto_476496 ?auto_476497 ?auto_476498 ?auto_476499 ?auto_476500 ?auto_476501 ?auto_476502 ?auto_476503 ?auto_476504 ?auto_476505 ?auto_476506 ?auto_476507 ?auto_476508 ?auto_476509 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476527 - BLOCK
      ?auto_476528 - BLOCK
      ?auto_476529 - BLOCK
      ?auto_476530 - BLOCK
      ?auto_476531 - BLOCK
      ?auto_476532 - BLOCK
      ?auto_476533 - BLOCK
      ?auto_476534 - BLOCK
      ?auto_476535 - BLOCK
      ?auto_476536 - BLOCK
      ?auto_476537 - BLOCK
      ?auto_476538 - BLOCK
      ?auto_476539 - BLOCK
      ?auto_476540 - BLOCK
      ?auto_476541 - BLOCK
      ?auto_476542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476542 ) ( ON-TABLE ?auto_476527 ) ( ON ?auto_476528 ?auto_476527 ) ( ON ?auto_476529 ?auto_476528 ) ( ON ?auto_476530 ?auto_476529 ) ( ON ?auto_476531 ?auto_476530 ) ( ON ?auto_476532 ?auto_476531 ) ( ON ?auto_476533 ?auto_476532 ) ( ON ?auto_476534 ?auto_476533 ) ( ON ?auto_476535 ?auto_476534 ) ( ON ?auto_476536 ?auto_476535 ) ( ON ?auto_476537 ?auto_476536 ) ( ON ?auto_476538 ?auto_476537 ) ( ON ?auto_476539 ?auto_476538 ) ( ON ?auto_476540 ?auto_476539 ) ( not ( = ?auto_476527 ?auto_476528 ) ) ( not ( = ?auto_476527 ?auto_476529 ) ) ( not ( = ?auto_476527 ?auto_476530 ) ) ( not ( = ?auto_476527 ?auto_476531 ) ) ( not ( = ?auto_476527 ?auto_476532 ) ) ( not ( = ?auto_476527 ?auto_476533 ) ) ( not ( = ?auto_476527 ?auto_476534 ) ) ( not ( = ?auto_476527 ?auto_476535 ) ) ( not ( = ?auto_476527 ?auto_476536 ) ) ( not ( = ?auto_476527 ?auto_476537 ) ) ( not ( = ?auto_476527 ?auto_476538 ) ) ( not ( = ?auto_476527 ?auto_476539 ) ) ( not ( = ?auto_476527 ?auto_476540 ) ) ( not ( = ?auto_476527 ?auto_476541 ) ) ( not ( = ?auto_476527 ?auto_476542 ) ) ( not ( = ?auto_476528 ?auto_476529 ) ) ( not ( = ?auto_476528 ?auto_476530 ) ) ( not ( = ?auto_476528 ?auto_476531 ) ) ( not ( = ?auto_476528 ?auto_476532 ) ) ( not ( = ?auto_476528 ?auto_476533 ) ) ( not ( = ?auto_476528 ?auto_476534 ) ) ( not ( = ?auto_476528 ?auto_476535 ) ) ( not ( = ?auto_476528 ?auto_476536 ) ) ( not ( = ?auto_476528 ?auto_476537 ) ) ( not ( = ?auto_476528 ?auto_476538 ) ) ( not ( = ?auto_476528 ?auto_476539 ) ) ( not ( = ?auto_476528 ?auto_476540 ) ) ( not ( = ?auto_476528 ?auto_476541 ) ) ( not ( = ?auto_476528 ?auto_476542 ) ) ( not ( = ?auto_476529 ?auto_476530 ) ) ( not ( = ?auto_476529 ?auto_476531 ) ) ( not ( = ?auto_476529 ?auto_476532 ) ) ( not ( = ?auto_476529 ?auto_476533 ) ) ( not ( = ?auto_476529 ?auto_476534 ) ) ( not ( = ?auto_476529 ?auto_476535 ) ) ( not ( = ?auto_476529 ?auto_476536 ) ) ( not ( = ?auto_476529 ?auto_476537 ) ) ( not ( = ?auto_476529 ?auto_476538 ) ) ( not ( = ?auto_476529 ?auto_476539 ) ) ( not ( = ?auto_476529 ?auto_476540 ) ) ( not ( = ?auto_476529 ?auto_476541 ) ) ( not ( = ?auto_476529 ?auto_476542 ) ) ( not ( = ?auto_476530 ?auto_476531 ) ) ( not ( = ?auto_476530 ?auto_476532 ) ) ( not ( = ?auto_476530 ?auto_476533 ) ) ( not ( = ?auto_476530 ?auto_476534 ) ) ( not ( = ?auto_476530 ?auto_476535 ) ) ( not ( = ?auto_476530 ?auto_476536 ) ) ( not ( = ?auto_476530 ?auto_476537 ) ) ( not ( = ?auto_476530 ?auto_476538 ) ) ( not ( = ?auto_476530 ?auto_476539 ) ) ( not ( = ?auto_476530 ?auto_476540 ) ) ( not ( = ?auto_476530 ?auto_476541 ) ) ( not ( = ?auto_476530 ?auto_476542 ) ) ( not ( = ?auto_476531 ?auto_476532 ) ) ( not ( = ?auto_476531 ?auto_476533 ) ) ( not ( = ?auto_476531 ?auto_476534 ) ) ( not ( = ?auto_476531 ?auto_476535 ) ) ( not ( = ?auto_476531 ?auto_476536 ) ) ( not ( = ?auto_476531 ?auto_476537 ) ) ( not ( = ?auto_476531 ?auto_476538 ) ) ( not ( = ?auto_476531 ?auto_476539 ) ) ( not ( = ?auto_476531 ?auto_476540 ) ) ( not ( = ?auto_476531 ?auto_476541 ) ) ( not ( = ?auto_476531 ?auto_476542 ) ) ( not ( = ?auto_476532 ?auto_476533 ) ) ( not ( = ?auto_476532 ?auto_476534 ) ) ( not ( = ?auto_476532 ?auto_476535 ) ) ( not ( = ?auto_476532 ?auto_476536 ) ) ( not ( = ?auto_476532 ?auto_476537 ) ) ( not ( = ?auto_476532 ?auto_476538 ) ) ( not ( = ?auto_476532 ?auto_476539 ) ) ( not ( = ?auto_476532 ?auto_476540 ) ) ( not ( = ?auto_476532 ?auto_476541 ) ) ( not ( = ?auto_476532 ?auto_476542 ) ) ( not ( = ?auto_476533 ?auto_476534 ) ) ( not ( = ?auto_476533 ?auto_476535 ) ) ( not ( = ?auto_476533 ?auto_476536 ) ) ( not ( = ?auto_476533 ?auto_476537 ) ) ( not ( = ?auto_476533 ?auto_476538 ) ) ( not ( = ?auto_476533 ?auto_476539 ) ) ( not ( = ?auto_476533 ?auto_476540 ) ) ( not ( = ?auto_476533 ?auto_476541 ) ) ( not ( = ?auto_476533 ?auto_476542 ) ) ( not ( = ?auto_476534 ?auto_476535 ) ) ( not ( = ?auto_476534 ?auto_476536 ) ) ( not ( = ?auto_476534 ?auto_476537 ) ) ( not ( = ?auto_476534 ?auto_476538 ) ) ( not ( = ?auto_476534 ?auto_476539 ) ) ( not ( = ?auto_476534 ?auto_476540 ) ) ( not ( = ?auto_476534 ?auto_476541 ) ) ( not ( = ?auto_476534 ?auto_476542 ) ) ( not ( = ?auto_476535 ?auto_476536 ) ) ( not ( = ?auto_476535 ?auto_476537 ) ) ( not ( = ?auto_476535 ?auto_476538 ) ) ( not ( = ?auto_476535 ?auto_476539 ) ) ( not ( = ?auto_476535 ?auto_476540 ) ) ( not ( = ?auto_476535 ?auto_476541 ) ) ( not ( = ?auto_476535 ?auto_476542 ) ) ( not ( = ?auto_476536 ?auto_476537 ) ) ( not ( = ?auto_476536 ?auto_476538 ) ) ( not ( = ?auto_476536 ?auto_476539 ) ) ( not ( = ?auto_476536 ?auto_476540 ) ) ( not ( = ?auto_476536 ?auto_476541 ) ) ( not ( = ?auto_476536 ?auto_476542 ) ) ( not ( = ?auto_476537 ?auto_476538 ) ) ( not ( = ?auto_476537 ?auto_476539 ) ) ( not ( = ?auto_476537 ?auto_476540 ) ) ( not ( = ?auto_476537 ?auto_476541 ) ) ( not ( = ?auto_476537 ?auto_476542 ) ) ( not ( = ?auto_476538 ?auto_476539 ) ) ( not ( = ?auto_476538 ?auto_476540 ) ) ( not ( = ?auto_476538 ?auto_476541 ) ) ( not ( = ?auto_476538 ?auto_476542 ) ) ( not ( = ?auto_476539 ?auto_476540 ) ) ( not ( = ?auto_476539 ?auto_476541 ) ) ( not ( = ?auto_476539 ?auto_476542 ) ) ( not ( = ?auto_476540 ?auto_476541 ) ) ( not ( = ?auto_476540 ?auto_476542 ) ) ( not ( = ?auto_476541 ?auto_476542 ) ) ( CLEAR ?auto_476540 ) ( ON ?auto_476541 ?auto_476542 ) ( CLEAR ?auto_476541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_476527 ?auto_476528 ?auto_476529 ?auto_476530 ?auto_476531 ?auto_476532 ?auto_476533 ?auto_476534 ?auto_476535 ?auto_476536 ?auto_476537 ?auto_476538 ?auto_476539 ?auto_476540 ?auto_476541 )
      ( MAKE-16PILE ?auto_476527 ?auto_476528 ?auto_476529 ?auto_476530 ?auto_476531 ?auto_476532 ?auto_476533 ?auto_476534 ?auto_476535 ?auto_476536 ?auto_476537 ?auto_476538 ?auto_476539 ?auto_476540 ?auto_476541 ?auto_476542 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476559 - BLOCK
      ?auto_476560 - BLOCK
      ?auto_476561 - BLOCK
      ?auto_476562 - BLOCK
      ?auto_476563 - BLOCK
      ?auto_476564 - BLOCK
      ?auto_476565 - BLOCK
      ?auto_476566 - BLOCK
      ?auto_476567 - BLOCK
      ?auto_476568 - BLOCK
      ?auto_476569 - BLOCK
      ?auto_476570 - BLOCK
      ?auto_476571 - BLOCK
      ?auto_476572 - BLOCK
      ?auto_476573 - BLOCK
      ?auto_476574 - BLOCK
    )
    :vars
    (
      ?auto_476575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476574 ?auto_476575 ) ( ON-TABLE ?auto_476559 ) ( ON ?auto_476560 ?auto_476559 ) ( ON ?auto_476561 ?auto_476560 ) ( ON ?auto_476562 ?auto_476561 ) ( ON ?auto_476563 ?auto_476562 ) ( ON ?auto_476564 ?auto_476563 ) ( ON ?auto_476565 ?auto_476564 ) ( ON ?auto_476566 ?auto_476565 ) ( ON ?auto_476567 ?auto_476566 ) ( ON ?auto_476568 ?auto_476567 ) ( ON ?auto_476569 ?auto_476568 ) ( ON ?auto_476570 ?auto_476569 ) ( ON ?auto_476571 ?auto_476570 ) ( not ( = ?auto_476559 ?auto_476560 ) ) ( not ( = ?auto_476559 ?auto_476561 ) ) ( not ( = ?auto_476559 ?auto_476562 ) ) ( not ( = ?auto_476559 ?auto_476563 ) ) ( not ( = ?auto_476559 ?auto_476564 ) ) ( not ( = ?auto_476559 ?auto_476565 ) ) ( not ( = ?auto_476559 ?auto_476566 ) ) ( not ( = ?auto_476559 ?auto_476567 ) ) ( not ( = ?auto_476559 ?auto_476568 ) ) ( not ( = ?auto_476559 ?auto_476569 ) ) ( not ( = ?auto_476559 ?auto_476570 ) ) ( not ( = ?auto_476559 ?auto_476571 ) ) ( not ( = ?auto_476559 ?auto_476572 ) ) ( not ( = ?auto_476559 ?auto_476573 ) ) ( not ( = ?auto_476559 ?auto_476574 ) ) ( not ( = ?auto_476559 ?auto_476575 ) ) ( not ( = ?auto_476560 ?auto_476561 ) ) ( not ( = ?auto_476560 ?auto_476562 ) ) ( not ( = ?auto_476560 ?auto_476563 ) ) ( not ( = ?auto_476560 ?auto_476564 ) ) ( not ( = ?auto_476560 ?auto_476565 ) ) ( not ( = ?auto_476560 ?auto_476566 ) ) ( not ( = ?auto_476560 ?auto_476567 ) ) ( not ( = ?auto_476560 ?auto_476568 ) ) ( not ( = ?auto_476560 ?auto_476569 ) ) ( not ( = ?auto_476560 ?auto_476570 ) ) ( not ( = ?auto_476560 ?auto_476571 ) ) ( not ( = ?auto_476560 ?auto_476572 ) ) ( not ( = ?auto_476560 ?auto_476573 ) ) ( not ( = ?auto_476560 ?auto_476574 ) ) ( not ( = ?auto_476560 ?auto_476575 ) ) ( not ( = ?auto_476561 ?auto_476562 ) ) ( not ( = ?auto_476561 ?auto_476563 ) ) ( not ( = ?auto_476561 ?auto_476564 ) ) ( not ( = ?auto_476561 ?auto_476565 ) ) ( not ( = ?auto_476561 ?auto_476566 ) ) ( not ( = ?auto_476561 ?auto_476567 ) ) ( not ( = ?auto_476561 ?auto_476568 ) ) ( not ( = ?auto_476561 ?auto_476569 ) ) ( not ( = ?auto_476561 ?auto_476570 ) ) ( not ( = ?auto_476561 ?auto_476571 ) ) ( not ( = ?auto_476561 ?auto_476572 ) ) ( not ( = ?auto_476561 ?auto_476573 ) ) ( not ( = ?auto_476561 ?auto_476574 ) ) ( not ( = ?auto_476561 ?auto_476575 ) ) ( not ( = ?auto_476562 ?auto_476563 ) ) ( not ( = ?auto_476562 ?auto_476564 ) ) ( not ( = ?auto_476562 ?auto_476565 ) ) ( not ( = ?auto_476562 ?auto_476566 ) ) ( not ( = ?auto_476562 ?auto_476567 ) ) ( not ( = ?auto_476562 ?auto_476568 ) ) ( not ( = ?auto_476562 ?auto_476569 ) ) ( not ( = ?auto_476562 ?auto_476570 ) ) ( not ( = ?auto_476562 ?auto_476571 ) ) ( not ( = ?auto_476562 ?auto_476572 ) ) ( not ( = ?auto_476562 ?auto_476573 ) ) ( not ( = ?auto_476562 ?auto_476574 ) ) ( not ( = ?auto_476562 ?auto_476575 ) ) ( not ( = ?auto_476563 ?auto_476564 ) ) ( not ( = ?auto_476563 ?auto_476565 ) ) ( not ( = ?auto_476563 ?auto_476566 ) ) ( not ( = ?auto_476563 ?auto_476567 ) ) ( not ( = ?auto_476563 ?auto_476568 ) ) ( not ( = ?auto_476563 ?auto_476569 ) ) ( not ( = ?auto_476563 ?auto_476570 ) ) ( not ( = ?auto_476563 ?auto_476571 ) ) ( not ( = ?auto_476563 ?auto_476572 ) ) ( not ( = ?auto_476563 ?auto_476573 ) ) ( not ( = ?auto_476563 ?auto_476574 ) ) ( not ( = ?auto_476563 ?auto_476575 ) ) ( not ( = ?auto_476564 ?auto_476565 ) ) ( not ( = ?auto_476564 ?auto_476566 ) ) ( not ( = ?auto_476564 ?auto_476567 ) ) ( not ( = ?auto_476564 ?auto_476568 ) ) ( not ( = ?auto_476564 ?auto_476569 ) ) ( not ( = ?auto_476564 ?auto_476570 ) ) ( not ( = ?auto_476564 ?auto_476571 ) ) ( not ( = ?auto_476564 ?auto_476572 ) ) ( not ( = ?auto_476564 ?auto_476573 ) ) ( not ( = ?auto_476564 ?auto_476574 ) ) ( not ( = ?auto_476564 ?auto_476575 ) ) ( not ( = ?auto_476565 ?auto_476566 ) ) ( not ( = ?auto_476565 ?auto_476567 ) ) ( not ( = ?auto_476565 ?auto_476568 ) ) ( not ( = ?auto_476565 ?auto_476569 ) ) ( not ( = ?auto_476565 ?auto_476570 ) ) ( not ( = ?auto_476565 ?auto_476571 ) ) ( not ( = ?auto_476565 ?auto_476572 ) ) ( not ( = ?auto_476565 ?auto_476573 ) ) ( not ( = ?auto_476565 ?auto_476574 ) ) ( not ( = ?auto_476565 ?auto_476575 ) ) ( not ( = ?auto_476566 ?auto_476567 ) ) ( not ( = ?auto_476566 ?auto_476568 ) ) ( not ( = ?auto_476566 ?auto_476569 ) ) ( not ( = ?auto_476566 ?auto_476570 ) ) ( not ( = ?auto_476566 ?auto_476571 ) ) ( not ( = ?auto_476566 ?auto_476572 ) ) ( not ( = ?auto_476566 ?auto_476573 ) ) ( not ( = ?auto_476566 ?auto_476574 ) ) ( not ( = ?auto_476566 ?auto_476575 ) ) ( not ( = ?auto_476567 ?auto_476568 ) ) ( not ( = ?auto_476567 ?auto_476569 ) ) ( not ( = ?auto_476567 ?auto_476570 ) ) ( not ( = ?auto_476567 ?auto_476571 ) ) ( not ( = ?auto_476567 ?auto_476572 ) ) ( not ( = ?auto_476567 ?auto_476573 ) ) ( not ( = ?auto_476567 ?auto_476574 ) ) ( not ( = ?auto_476567 ?auto_476575 ) ) ( not ( = ?auto_476568 ?auto_476569 ) ) ( not ( = ?auto_476568 ?auto_476570 ) ) ( not ( = ?auto_476568 ?auto_476571 ) ) ( not ( = ?auto_476568 ?auto_476572 ) ) ( not ( = ?auto_476568 ?auto_476573 ) ) ( not ( = ?auto_476568 ?auto_476574 ) ) ( not ( = ?auto_476568 ?auto_476575 ) ) ( not ( = ?auto_476569 ?auto_476570 ) ) ( not ( = ?auto_476569 ?auto_476571 ) ) ( not ( = ?auto_476569 ?auto_476572 ) ) ( not ( = ?auto_476569 ?auto_476573 ) ) ( not ( = ?auto_476569 ?auto_476574 ) ) ( not ( = ?auto_476569 ?auto_476575 ) ) ( not ( = ?auto_476570 ?auto_476571 ) ) ( not ( = ?auto_476570 ?auto_476572 ) ) ( not ( = ?auto_476570 ?auto_476573 ) ) ( not ( = ?auto_476570 ?auto_476574 ) ) ( not ( = ?auto_476570 ?auto_476575 ) ) ( not ( = ?auto_476571 ?auto_476572 ) ) ( not ( = ?auto_476571 ?auto_476573 ) ) ( not ( = ?auto_476571 ?auto_476574 ) ) ( not ( = ?auto_476571 ?auto_476575 ) ) ( not ( = ?auto_476572 ?auto_476573 ) ) ( not ( = ?auto_476572 ?auto_476574 ) ) ( not ( = ?auto_476572 ?auto_476575 ) ) ( not ( = ?auto_476573 ?auto_476574 ) ) ( not ( = ?auto_476573 ?auto_476575 ) ) ( not ( = ?auto_476574 ?auto_476575 ) ) ( ON ?auto_476573 ?auto_476574 ) ( CLEAR ?auto_476571 ) ( ON ?auto_476572 ?auto_476573 ) ( CLEAR ?auto_476572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_476559 ?auto_476560 ?auto_476561 ?auto_476562 ?auto_476563 ?auto_476564 ?auto_476565 ?auto_476566 ?auto_476567 ?auto_476568 ?auto_476569 ?auto_476570 ?auto_476571 ?auto_476572 )
      ( MAKE-16PILE ?auto_476559 ?auto_476560 ?auto_476561 ?auto_476562 ?auto_476563 ?auto_476564 ?auto_476565 ?auto_476566 ?auto_476567 ?auto_476568 ?auto_476569 ?auto_476570 ?auto_476571 ?auto_476572 ?auto_476573 ?auto_476574 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476592 - BLOCK
      ?auto_476593 - BLOCK
      ?auto_476594 - BLOCK
      ?auto_476595 - BLOCK
      ?auto_476596 - BLOCK
      ?auto_476597 - BLOCK
      ?auto_476598 - BLOCK
      ?auto_476599 - BLOCK
      ?auto_476600 - BLOCK
      ?auto_476601 - BLOCK
      ?auto_476602 - BLOCK
      ?auto_476603 - BLOCK
      ?auto_476604 - BLOCK
      ?auto_476605 - BLOCK
      ?auto_476606 - BLOCK
      ?auto_476607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476607 ) ( ON-TABLE ?auto_476592 ) ( ON ?auto_476593 ?auto_476592 ) ( ON ?auto_476594 ?auto_476593 ) ( ON ?auto_476595 ?auto_476594 ) ( ON ?auto_476596 ?auto_476595 ) ( ON ?auto_476597 ?auto_476596 ) ( ON ?auto_476598 ?auto_476597 ) ( ON ?auto_476599 ?auto_476598 ) ( ON ?auto_476600 ?auto_476599 ) ( ON ?auto_476601 ?auto_476600 ) ( ON ?auto_476602 ?auto_476601 ) ( ON ?auto_476603 ?auto_476602 ) ( ON ?auto_476604 ?auto_476603 ) ( not ( = ?auto_476592 ?auto_476593 ) ) ( not ( = ?auto_476592 ?auto_476594 ) ) ( not ( = ?auto_476592 ?auto_476595 ) ) ( not ( = ?auto_476592 ?auto_476596 ) ) ( not ( = ?auto_476592 ?auto_476597 ) ) ( not ( = ?auto_476592 ?auto_476598 ) ) ( not ( = ?auto_476592 ?auto_476599 ) ) ( not ( = ?auto_476592 ?auto_476600 ) ) ( not ( = ?auto_476592 ?auto_476601 ) ) ( not ( = ?auto_476592 ?auto_476602 ) ) ( not ( = ?auto_476592 ?auto_476603 ) ) ( not ( = ?auto_476592 ?auto_476604 ) ) ( not ( = ?auto_476592 ?auto_476605 ) ) ( not ( = ?auto_476592 ?auto_476606 ) ) ( not ( = ?auto_476592 ?auto_476607 ) ) ( not ( = ?auto_476593 ?auto_476594 ) ) ( not ( = ?auto_476593 ?auto_476595 ) ) ( not ( = ?auto_476593 ?auto_476596 ) ) ( not ( = ?auto_476593 ?auto_476597 ) ) ( not ( = ?auto_476593 ?auto_476598 ) ) ( not ( = ?auto_476593 ?auto_476599 ) ) ( not ( = ?auto_476593 ?auto_476600 ) ) ( not ( = ?auto_476593 ?auto_476601 ) ) ( not ( = ?auto_476593 ?auto_476602 ) ) ( not ( = ?auto_476593 ?auto_476603 ) ) ( not ( = ?auto_476593 ?auto_476604 ) ) ( not ( = ?auto_476593 ?auto_476605 ) ) ( not ( = ?auto_476593 ?auto_476606 ) ) ( not ( = ?auto_476593 ?auto_476607 ) ) ( not ( = ?auto_476594 ?auto_476595 ) ) ( not ( = ?auto_476594 ?auto_476596 ) ) ( not ( = ?auto_476594 ?auto_476597 ) ) ( not ( = ?auto_476594 ?auto_476598 ) ) ( not ( = ?auto_476594 ?auto_476599 ) ) ( not ( = ?auto_476594 ?auto_476600 ) ) ( not ( = ?auto_476594 ?auto_476601 ) ) ( not ( = ?auto_476594 ?auto_476602 ) ) ( not ( = ?auto_476594 ?auto_476603 ) ) ( not ( = ?auto_476594 ?auto_476604 ) ) ( not ( = ?auto_476594 ?auto_476605 ) ) ( not ( = ?auto_476594 ?auto_476606 ) ) ( not ( = ?auto_476594 ?auto_476607 ) ) ( not ( = ?auto_476595 ?auto_476596 ) ) ( not ( = ?auto_476595 ?auto_476597 ) ) ( not ( = ?auto_476595 ?auto_476598 ) ) ( not ( = ?auto_476595 ?auto_476599 ) ) ( not ( = ?auto_476595 ?auto_476600 ) ) ( not ( = ?auto_476595 ?auto_476601 ) ) ( not ( = ?auto_476595 ?auto_476602 ) ) ( not ( = ?auto_476595 ?auto_476603 ) ) ( not ( = ?auto_476595 ?auto_476604 ) ) ( not ( = ?auto_476595 ?auto_476605 ) ) ( not ( = ?auto_476595 ?auto_476606 ) ) ( not ( = ?auto_476595 ?auto_476607 ) ) ( not ( = ?auto_476596 ?auto_476597 ) ) ( not ( = ?auto_476596 ?auto_476598 ) ) ( not ( = ?auto_476596 ?auto_476599 ) ) ( not ( = ?auto_476596 ?auto_476600 ) ) ( not ( = ?auto_476596 ?auto_476601 ) ) ( not ( = ?auto_476596 ?auto_476602 ) ) ( not ( = ?auto_476596 ?auto_476603 ) ) ( not ( = ?auto_476596 ?auto_476604 ) ) ( not ( = ?auto_476596 ?auto_476605 ) ) ( not ( = ?auto_476596 ?auto_476606 ) ) ( not ( = ?auto_476596 ?auto_476607 ) ) ( not ( = ?auto_476597 ?auto_476598 ) ) ( not ( = ?auto_476597 ?auto_476599 ) ) ( not ( = ?auto_476597 ?auto_476600 ) ) ( not ( = ?auto_476597 ?auto_476601 ) ) ( not ( = ?auto_476597 ?auto_476602 ) ) ( not ( = ?auto_476597 ?auto_476603 ) ) ( not ( = ?auto_476597 ?auto_476604 ) ) ( not ( = ?auto_476597 ?auto_476605 ) ) ( not ( = ?auto_476597 ?auto_476606 ) ) ( not ( = ?auto_476597 ?auto_476607 ) ) ( not ( = ?auto_476598 ?auto_476599 ) ) ( not ( = ?auto_476598 ?auto_476600 ) ) ( not ( = ?auto_476598 ?auto_476601 ) ) ( not ( = ?auto_476598 ?auto_476602 ) ) ( not ( = ?auto_476598 ?auto_476603 ) ) ( not ( = ?auto_476598 ?auto_476604 ) ) ( not ( = ?auto_476598 ?auto_476605 ) ) ( not ( = ?auto_476598 ?auto_476606 ) ) ( not ( = ?auto_476598 ?auto_476607 ) ) ( not ( = ?auto_476599 ?auto_476600 ) ) ( not ( = ?auto_476599 ?auto_476601 ) ) ( not ( = ?auto_476599 ?auto_476602 ) ) ( not ( = ?auto_476599 ?auto_476603 ) ) ( not ( = ?auto_476599 ?auto_476604 ) ) ( not ( = ?auto_476599 ?auto_476605 ) ) ( not ( = ?auto_476599 ?auto_476606 ) ) ( not ( = ?auto_476599 ?auto_476607 ) ) ( not ( = ?auto_476600 ?auto_476601 ) ) ( not ( = ?auto_476600 ?auto_476602 ) ) ( not ( = ?auto_476600 ?auto_476603 ) ) ( not ( = ?auto_476600 ?auto_476604 ) ) ( not ( = ?auto_476600 ?auto_476605 ) ) ( not ( = ?auto_476600 ?auto_476606 ) ) ( not ( = ?auto_476600 ?auto_476607 ) ) ( not ( = ?auto_476601 ?auto_476602 ) ) ( not ( = ?auto_476601 ?auto_476603 ) ) ( not ( = ?auto_476601 ?auto_476604 ) ) ( not ( = ?auto_476601 ?auto_476605 ) ) ( not ( = ?auto_476601 ?auto_476606 ) ) ( not ( = ?auto_476601 ?auto_476607 ) ) ( not ( = ?auto_476602 ?auto_476603 ) ) ( not ( = ?auto_476602 ?auto_476604 ) ) ( not ( = ?auto_476602 ?auto_476605 ) ) ( not ( = ?auto_476602 ?auto_476606 ) ) ( not ( = ?auto_476602 ?auto_476607 ) ) ( not ( = ?auto_476603 ?auto_476604 ) ) ( not ( = ?auto_476603 ?auto_476605 ) ) ( not ( = ?auto_476603 ?auto_476606 ) ) ( not ( = ?auto_476603 ?auto_476607 ) ) ( not ( = ?auto_476604 ?auto_476605 ) ) ( not ( = ?auto_476604 ?auto_476606 ) ) ( not ( = ?auto_476604 ?auto_476607 ) ) ( not ( = ?auto_476605 ?auto_476606 ) ) ( not ( = ?auto_476605 ?auto_476607 ) ) ( not ( = ?auto_476606 ?auto_476607 ) ) ( ON ?auto_476606 ?auto_476607 ) ( CLEAR ?auto_476604 ) ( ON ?auto_476605 ?auto_476606 ) ( CLEAR ?auto_476605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_476592 ?auto_476593 ?auto_476594 ?auto_476595 ?auto_476596 ?auto_476597 ?auto_476598 ?auto_476599 ?auto_476600 ?auto_476601 ?auto_476602 ?auto_476603 ?auto_476604 ?auto_476605 )
      ( MAKE-16PILE ?auto_476592 ?auto_476593 ?auto_476594 ?auto_476595 ?auto_476596 ?auto_476597 ?auto_476598 ?auto_476599 ?auto_476600 ?auto_476601 ?auto_476602 ?auto_476603 ?auto_476604 ?auto_476605 ?auto_476606 ?auto_476607 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476624 - BLOCK
      ?auto_476625 - BLOCK
      ?auto_476626 - BLOCK
      ?auto_476627 - BLOCK
      ?auto_476628 - BLOCK
      ?auto_476629 - BLOCK
      ?auto_476630 - BLOCK
      ?auto_476631 - BLOCK
      ?auto_476632 - BLOCK
      ?auto_476633 - BLOCK
      ?auto_476634 - BLOCK
      ?auto_476635 - BLOCK
      ?auto_476636 - BLOCK
      ?auto_476637 - BLOCK
      ?auto_476638 - BLOCK
      ?auto_476639 - BLOCK
    )
    :vars
    (
      ?auto_476640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476639 ?auto_476640 ) ( ON-TABLE ?auto_476624 ) ( ON ?auto_476625 ?auto_476624 ) ( ON ?auto_476626 ?auto_476625 ) ( ON ?auto_476627 ?auto_476626 ) ( ON ?auto_476628 ?auto_476627 ) ( ON ?auto_476629 ?auto_476628 ) ( ON ?auto_476630 ?auto_476629 ) ( ON ?auto_476631 ?auto_476630 ) ( ON ?auto_476632 ?auto_476631 ) ( ON ?auto_476633 ?auto_476632 ) ( ON ?auto_476634 ?auto_476633 ) ( ON ?auto_476635 ?auto_476634 ) ( not ( = ?auto_476624 ?auto_476625 ) ) ( not ( = ?auto_476624 ?auto_476626 ) ) ( not ( = ?auto_476624 ?auto_476627 ) ) ( not ( = ?auto_476624 ?auto_476628 ) ) ( not ( = ?auto_476624 ?auto_476629 ) ) ( not ( = ?auto_476624 ?auto_476630 ) ) ( not ( = ?auto_476624 ?auto_476631 ) ) ( not ( = ?auto_476624 ?auto_476632 ) ) ( not ( = ?auto_476624 ?auto_476633 ) ) ( not ( = ?auto_476624 ?auto_476634 ) ) ( not ( = ?auto_476624 ?auto_476635 ) ) ( not ( = ?auto_476624 ?auto_476636 ) ) ( not ( = ?auto_476624 ?auto_476637 ) ) ( not ( = ?auto_476624 ?auto_476638 ) ) ( not ( = ?auto_476624 ?auto_476639 ) ) ( not ( = ?auto_476624 ?auto_476640 ) ) ( not ( = ?auto_476625 ?auto_476626 ) ) ( not ( = ?auto_476625 ?auto_476627 ) ) ( not ( = ?auto_476625 ?auto_476628 ) ) ( not ( = ?auto_476625 ?auto_476629 ) ) ( not ( = ?auto_476625 ?auto_476630 ) ) ( not ( = ?auto_476625 ?auto_476631 ) ) ( not ( = ?auto_476625 ?auto_476632 ) ) ( not ( = ?auto_476625 ?auto_476633 ) ) ( not ( = ?auto_476625 ?auto_476634 ) ) ( not ( = ?auto_476625 ?auto_476635 ) ) ( not ( = ?auto_476625 ?auto_476636 ) ) ( not ( = ?auto_476625 ?auto_476637 ) ) ( not ( = ?auto_476625 ?auto_476638 ) ) ( not ( = ?auto_476625 ?auto_476639 ) ) ( not ( = ?auto_476625 ?auto_476640 ) ) ( not ( = ?auto_476626 ?auto_476627 ) ) ( not ( = ?auto_476626 ?auto_476628 ) ) ( not ( = ?auto_476626 ?auto_476629 ) ) ( not ( = ?auto_476626 ?auto_476630 ) ) ( not ( = ?auto_476626 ?auto_476631 ) ) ( not ( = ?auto_476626 ?auto_476632 ) ) ( not ( = ?auto_476626 ?auto_476633 ) ) ( not ( = ?auto_476626 ?auto_476634 ) ) ( not ( = ?auto_476626 ?auto_476635 ) ) ( not ( = ?auto_476626 ?auto_476636 ) ) ( not ( = ?auto_476626 ?auto_476637 ) ) ( not ( = ?auto_476626 ?auto_476638 ) ) ( not ( = ?auto_476626 ?auto_476639 ) ) ( not ( = ?auto_476626 ?auto_476640 ) ) ( not ( = ?auto_476627 ?auto_476628 ) ) ( not ( = ?auto_476627 ?auto_476629 ) ) ( not ( = ?auto_476627 ?auto_476630 ) ) ( not ( = ?auto_476627 ?auto_476631 ) ) ( not ( = ?auto_476627 ?auto_476632 ) ) ( not ( = ?auto_476627 ?auto_476633 ) ) ( not ( = ?auto_476627 ?auto_476634 ) ) ( not ( = ?auto_476627 ?auto_476635 ) ) ( not ( = ?auto_476627 ?auto_476636 ) ) ( not ( = ?auto_476627 ?auto_476637 ) ) ( not ( = ?auto_476627 ?auto_476638 ) ) ( not ( = ?auto_476627 ?auto_476639 ) ) ( not ( = ?auto_476627 ?auto_476640 ) ) ( not ( = ?auto_476628 ?auto_476629 ) ) ( not ( = ?auto_476628 ?auto_476630 ) ) ( not ( = ?auto_476628 ?auto_476631 ) ) ( not ( = ?auto_476628 ?auto_476632 ) ) ( not ( = ?auto_476628 ?auto_476633 ) ) ( not ( = ?auto_476628 ?auto_476634 ) ) ( not ( = ?auto_476628 ?auto_476635 ) ) ( not ( = ?auto_476628 ?auto_476636 ) ) ( not ( = ?auto_476628 ?auto_476637 ) ) ( not ( = ?auto_476628 ?auto_476638 ) ) ( not ( = ?auto_476628 ?auto_476639 ) ) ( not ( = ?auto_476628 ?auto_476640 ) ) ( not ( = ?auto_476629 ?auto_476630 ) ) ( not ( = ?auto_476629 ?auto_476631 ) ) ( not ( = ?auto_476629 ?auto_476632 ) ) ( not ( = ?auto_476629 ?auto_476633 ) ) ( not ( = ?auto_476629 ?auto_476634 ) ) ( not ( = ?auto_476629 ?auto_476635 ) ) ( not ( = ?auto_476629 ?auto_476636 ) ) ( not ( = ?auto_476629 ?auto_476637 ) ) ( not ( = ?auto_476629 ?auto_476638 ) ) ( not ( = ?auto_476629 ?auto_476639 ) ) ( not ( = ?auto_476629 ?auto_476640 ) ) ( not ( = ?auto_476630 ?auto_476631 ) ) ( not ( = ?auto_476630 ?auto_476632 ) ) ( not ( = ?auto_476630 ?auto_476633 ) ) ( not ( = ?auto_476630 ?auto_476634 ) ) ( not ( = ?auto_476630 ?auto_476635 ) ) ( not ( = ?auto_476630 ?auto_476636 ) ) ( not ( = ?auto_476630 ?auto_476637 ) ) ( not ( = ?auto_476630 ?auto_476638 ) ) ( not ( = ?auto_476630 ?auto_476639 ) ) ( not ( = ?auto_476630 ?auto_476640 ) ) ( not ( = ?auto_476631 ?auto_476632 ) ) ( not ( = ?auto_476631 ?auto_476633 ) ) ( not ( = ?auto_476631 ?auto_476634 ) ) ( not ( = ?auto_476631 ?auto_476635 ) ) ( not ( = ?auto_476631 ?auto_476636 ) ) ( not ( = ?auto_476631 ?auto_476637 ) ) ( not ( = ?auto_476631 ?auto_476638 ) ) ( not ( = ?auto_476631 ?auto_476639 ) ) ( not ( = ?auto_476631 ?auto_476640 ) ) ( not ( = ?auto_476632 ?auto_476633 ) ) ( not ( = ?auto_476632 ?auto_476634 ) ) ( not ( = ?auto_476632 ?auto_476635 ) ) ( not ( = ?auto_476632 ?auto_476636 ) ) ( not ( = ?auto_476632 ?auto_476637 ) ) ( not ( = ?auto_476632 ?auto_476638 ) ) ( not ( = ?auto_476632 ?auto_476639 ) ) ( not ( = ?auto_476632 ?auto_476640 ) ) ( not ( = ?auto_476633 ?auto_476634 ) ) ( not ( = ?auto_476633 ?auto_476635 ) ) ( not ( = ?auto_476633 ?auto_476636 ) ) ( not ( = ?auto_476633 ?auto_476637 ) ) ( not ( = ?auto_476633 ?auto_476638 ) ) ( not ( = ?auto_476633 ?auto_476639 ) ) ( not ( = ?auto_476633 ?auto_476640 ) ) ( not ( = ?auto_476634 ?auto_476635 ) ) ( not ( = ?auto_476634 ?auto_476636 ) ) ( not ( = ?auto_476634 ?auto_476637 ) ) ( not ( = ?auto_476634 ?auto_476638 ) ) ( not ( = ?auto_476634 ?auto_476639 ) ) ( not ( = ?auto_476634 ?auto_476640 ) ) ( not ( = ?auto_476635 ?auto_476636 ) ) ( not ( = ?auto_476635 ?auto_476637 ) ) ( not ( = ?auto_476635 ?auto_476638 ) ) ( not ( = ?auto_476635 ?auto_476639 ) ) ( not ( = ?auto_476635 ?auto_476640 ) ) ( not ( = ?auto_476636 ?auto_476637 ) ) ( not ( = ?auto_476636 ?auto_476638 ) ) ( not ( = ?auto_476636 ?auto_476639 ) ) ( not ( = ?auto_476636 ?auto_476640 ) ) ( not ( = ?auto_476637 ?auto_476638 ) ) ( not ( = ?auto_476637 ?auto_476639 ) ) ( not ( = ?auto_476637 ?auto_476640 ) ) ( not ( = ?auto_476638 ?auto_476639 ) ) ( not ( = ?auto_476638 ?auto_476640 ) ) ( not ( = ?auto_476639 ?auto_476640 ) ) ( ON ?auto_476638 ?auto_476639 ) ( ON ?auto_476637 ?auto_476638 ) ( CLEAR ?auto_476635 ) ( ON ?auto_476636 ?auto_476637 ) ( CLEAR ?auto_476636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_476624 ?auto_476625 ?auto_476626 ?auto_476627 ?auto_476628 ?auto_476629 ?auto_476630 ?auto_476631 ?auto_476632 ?auto_476633 ?auto_476634 ?auto_476635 ?auto_476636 )
      ( MAKE-16PILE ?auto_476624 ?auto_476625 ?auto_476626 ?auto_476627 ?auto_476628 ?auto_476629 ?auto_476630 ?auto_476631 ?auto_476632 ?auto_476633 ?auto_476634 ?auto_476635 ?auto_476636 ?auto_476637 ?auto_476638 ?auto_476639 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476657 - BLOCK
      ?auto_476658 - BLOCK
      ?auto_476659 - BLOCK
      ?auto_476660 - BLOCK
      ?auto_476661 - BLOCK
      ?auto_476662 - BLOCK
      ?auto_476663 - BLOCK
      ?auto_476664 - BLOCK
      ?auto_476665 - BLOCK
      ?auto_476666 - BLOCK
      ?auto_476667 - BLOCK
      ?auto_476668 - BLOCK
      ?auto_476669 - BLOCK
      ?auto_476670 - BLOCK
      ?auto_476671 - BLOCK
      ?auto_476672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476672 ) ( ON-TABLE ?auto_476657 ) ( ON ?auto_476658 ?auto_476657 ) ( ON ?auto_476659 ?auto_476658 ) ( ON ?auto_476660 ?auto_476659 ) ( ON ?auto_476661 ?auto_476660 ) ( ON ?auto_476662 ?auto_476661 ) ( ON ?auto_476663 ?auto_476662 ) ( ON ?auto_476664 ?auto_476663 ) ( ON ?auto_476665 ?auto_476664 ) ( ON ?auto_476666 ?auto_476665 ) ( ON ?auto_476667 ?auto_476666 ) ( ON ?auto_476668 ?auto_476667 ) ( not ( = ?auto_476657 ?auto_476658 ) ) ( not ( = ?auto_476657 ?auto_476659 ) ) ( not ( = ?auto_476657 ?auto_476660 ) ) ( not ( = ?auto_476657 ?auto_476661 ) ) ( not ( = ?auto_476657 ?auto_476662 ) ) ( not ( = ?auto_476657 ?auto_476663 ) ) ( not ( = ?auto_476657 ?auto_476664 ) ) ( not ( = ?auto_476657 ?auto_476665 ) ) ( not ( = ?auto_476657 ?auto_476666 ) ) ( not ( = ?auto_476657 ?auto_476667 ) ) ( not ( = ?auto_476657 ?auto_476668 ) ) ( not ( = ?auto_476657 ?auto_476669 ) ) ( not ( = ?auto_476657 ?auto_476670 ) ) ( not ( = ?auto_476657 ?auto_476671 ) ) ( not ( = ?auto_476657 ?auto_476672 ) ) ( not ( = ?auto_476658 ?auto_476659 ) ) ( not ( = ?auto_476658 ?auto_476660 ) ) ( not ( = ?auto_476658 ?auto_476661 ) ) ( not ( = ?auto_476658 ?auto_476662 ) ) ( not ( = ?auto_476658 ?auto_476663 ) ) ( not ( = ?auto_476658 ?auto_476664 ) ) ( not ( = ?auto_476658 ?auto_476665 ) ) ( not ( = ?auto_476658 ?auto_476666 ) ) ( not ( = ?auto_476658 ?auto_476667 ) ) ( not ( = ?auto_476658 ?auto_476668 ) ) ( not ( = ?auto_476658 ?auto_476669 ) ) ( not ( = ?auto_476658 ?auto_476670 ) ) ( not ( = ?auto_476658 ?auto_476671 ) ) ( not ( = ?auto_476658 ?auto_476672 ) ) ( not ( = ?auto_476659 ?auto_476660 ) ) ( not ( = ?auto_476659 ?auto_476661 ) ) ( not ( = ?auto_476659 ?auto_476662 ) ) ( not ( = ?auto_476659 ?auto_476663 ) ) ( not ( = ?auto_476659 ?auto_476664 ) ) ( not ( = ?auto_476659 ?auto_476665 ) ) ( not ( = ?auto_476659 ?auto_476666 ) ) ( not ( = ?auto_476659 ?auto_476667 ) ) ( not ( = ?auto_476659 ?auto_476668 ) ) ( not ( = ?auto_476659 ?auto_476669 ) ) ( not ( = ?auto_476659 ?auto_476670 ) ) ( not ( = ?auto_476659 ?auto_476671 ) ) ( not ( = ?auto_476659 ?auto_476672 ) ) ( not ( = ?auto_476660 ?auto_476661 ) ) ( not ( = ?auto_476660 ?auto_476662 ) ) ( not ( = ?auto_476660 ?auto_476663 ) ) ( not ( = ?auto_476660 ?auto_476664 ) ) ( not ( = ?auto_476660 ?auto_476665 ) ) ( not ( = ?auto_476660 ?auto_476666 ) ) ( not ( = ?auto_476660 ?auto_476667 ) ) ( not ( = ?auto_476660 ?auto_476668 ) ) ( not ( = ?auto_476660 ?auto_476669 ) ) ( not ( = ?auto_476660 ?auto_476670 ) ) ( not ( = ?auto_476660 ?auto_476671 ) ) ( not ( = ?auto_476660 ?auto_476672 ) ) ( not ( = ?auto_476661 ?auto_476662 ) ) ( not ( = ?auto_476661 ?auto_476663 ) ) ( not ( = ?auto_476661 ?auto_476664 ) ) ( not ( = ?auto_476661 ?auto_476665 ) ) ( not ( = ?auto_476661 ?auto_476666 ) ) ( not ( = ?auto_476661 ?auto_476667 ) ) ( not ( = ?auto_476661 ?auto_476668 ) ) ( not ( = ?auto_476661 ?auto_476669 ) ) ( not ( = ?auto_476661 ?auto_476670 ) ) ( not ( = ?auto_476661 ?auto_476671 ) ) ( not ( = ?auto_476661 ?auto_476672 ) ) ( not ( = ?auto_476662 ?auto_476663 ) ) ( not ( = ?auto_476662 ?auto_476664 ) ) ( not ( = ?auto_476662 ?auto_476665 ) ) ( not ( = ?auto_476662 ?auto_476666 ) ) ( not ( = ?auto_476662 ?auto_476667 ) ) ( not ( = ?auto_476662 ?auto_476668 ) ) ( not ( = ?auto_476662 ?auto_476669 ) ) ( not ( = ?auto_476662 ?auto_476670 ) ) ( not ( = ?auto_476662 ?auto_476671 ) ) ( not ( = ?auto_476662 ?auto_476672 ) ) ( not ( = ?auto_476663 ?auto_476664 ) ) ( not ( = ?auto_476663 ?auto_476665 ) ) ( not ( = ?auto_476663 ?auto_476666 ) ) ( not ( = ?auto_476663 ?auto_476667 ) ) ( not ( = ?auto_476663 ?auto_476668 ) ) ( not ( = ?auto_476663 ?auto_476669 ) ) ( not ( = ?auto_476663 ?auto_476670 ) ) ( not ( = ?auto_476663 ?auto_476671 ) ) ( not ( = ?auto_476663 ?auto_476672 ) ) ( not ( = ?auto_476664 ?auto_476665 ) ) ( not ( = ?auto_476664 ?auto_476666 ) ) ( not ( = ?auto_476664 ?auto_476667 ) ) ( not ( = ?auto_476664 ?auto_476668 ) ) ( not ( = ?auto_476664 ?auto_476669 ) ) ( not ( = ?auto_476664 ?auto_476670 ) ) ( not ( = ?auto_476664 ?auto_476671 ) ) ( not ( = ?auto_476664 ?auto_476672 ) ) ( not ( = ?auto_476665 ?auto_476666 ) ) ( not ( = ?auto_476665 ?auto_476667 ) ) ( not ( = ?auto_476665 ?auto_476668 ) ) ( not ( = ?auto_476665 ?auto_476669 ) ) ( not ( = ?auto_476665 ?auto_476670 ) ) ( not ( = ?auto_476665 ?auto_476671 ) ) ( not ( = ?auto_476665 ?auto_476672 ) ) ( not ( = ?auto_476666 ?auto_476667 ) ) ( not ( = ?auto_476666 ?auto_476668 ) ) ( not ( = ?auto_476666 ?auto_476669 ) ) ( not ( = ?auto_476666 ?auto_476670 ) ) ( not ( = ?auto_476666 ?auto_476671 ) ) ( not ( = ?auto_476666 ?auto_476672 ) ) ( not ( = ?auto_476667 ?auto_476668 ) ) ( not ( = ?auto_476667 ?auto_476669 ) ) ( not ( = ?auto_476667 ?auto_476670 ) ) ( not ( = ?auto_476667 ?auto_476671 ) ) ( not ( = ?auto_476667 ?auto_476672 ) ) ( not ( = ?auto_476668 ?auto_476669 ) ) ( not ( = ?auto_476668 ?auto_476670 ) ) ( not ( = ?auto_476668 ?auto_476671 ) ) ( not ( = ?auto_476668 ?auto_476672 ) ) ( not ( = ?auto_476669 ?auto_476670 ) ) ( not ( = ?auto_476669 ?auto_476671 ) ) ( not ( = ?auto_476669 ?auto_476672 ) ) ( not ( = ?auto_476670 ?auto_476671 ) ) ( not ( = ?auto_476670 ?auto_476672 ) ) ( not ( = ?auto_476671 ?auto_476672 ) ) ( ON ?auto_476671 ?auto_476672 ) ( ON ?auto_476670 ?auto_476671 ) ( CLEAR ?auto_476668 ) ( ON ?auto_476669 ?auto_476670 ) ( CLEAR ?auto_476669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_476657 ?auto_476658 ?auto_476659 ?auto_476660 ?auto_476661 ?auto_476662 ?auto_476663 ?auto_476664 ?auto_476665 ?auto_476666 ?auto_476667 ?auto_476668 ?auto_476669 )
      ( MAKE-16PILE ?auto_476657 ?auto_476658 ?auto_476659 ?auto_476660 ?auto_476661 ?auto_476662 ?auto_476663 ?auto_476664 ?auto_476665 ?auto_476666 ?auto_476667 ?auto_476668 ?auto_476669 ?auto_476670 ?auto_476671 ?auto_476672 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476689 - BLOCK
      ?auto_476690 - BLOCK
      ?auto_476691 - BLOCK
      ?auto_476692 - BLOCK
      ?auto_476693 - BLOCK
      ?auto_476694 - BLOCK
      ?auto_476695 - BLOCK
      ?auto_476696 - BLOCK
      ?auto_476697 - BLOCK
      ?auto_476698 - BLOCK
      ?auto_476699 - BLOCK
      ?auto_476700 - BLOCK
      ?auto_476701 - BLOCK
      ?auto_476702 - BLOCK
      ?auto_476703 - BLOCK
      ?auto_476704 - BLOCK
    )
    :vars
    (
      ?auto_476705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476704 ?auto_476705 ) ( ON-TABLE ?auto_476689 ) ( ON ?auto_476690 ?auto_476689 ) ( ON ?auto_476691 ?auto_476690 ) ( ON ?auto_476692 ?auto_476691 ) ( ON ?auto_476693 ?auto_476692 ) ( ON ?auto_476694 ?auto_476693 ) ( ON ?auto_476695 ?auto_476694 ) ( ON ?auto_476696 ?auto_476695 ) ( ON ?auto_476697 ?auto_476696 ) ( ON ?auto_476698 ?auto_476697 ) ( ON ?auto_476699 ?auto_476698 ) ( not ( = ?auto_476689 ?auto_476690 ) ) ( not ( = ?auto_476689 ?auto_476691 ) ) ( not ( = ?auto_476689 ?auto_476692 ) ) ( not ( = ?auto_476689 ?auto_476693 ) ) ( not ( = ?auto_476689 ?auto_476694 ) ) ( not ( = ?auto_476689 ?auto_476695 ) ) ( not ( = ?auto_476689 ?auto_476696 ) ) ( not ( = ?auto_476689 ?auto_476697 ) ) ( not ( = ?auto_476689 ?auto_476698 ) ) ( not ( = ?auto_476689 ?auto_476699 ) ) ( not ( = ?auto_476689 ?auto_476700 ) ) ( not ( = ?auto_476689 ?auto_476701 ) ) ( not ( = ?auto_476689 ?auto_476702 ) ) ( not ( = ?auto_476689 ?auto_476703 ) ) ( not ( = ?auto_476689 ?auto_476704 ) ) ( not ( = ?auto_476689 ?auto_476705 ) ) ( not ( = ?auto_476690 ?auto_476691 ) ) ( not ( = ?auto_476690 ?auto_476692 ) ) ( not ( = ?auto_476690 ?auto_476693 ) ) ( not ( = ?auto_476690 ?auto_476694 ) ) ( not ( = ?auto_476690 ?auto_476695 ) ) ( not ( = ?auto_476690 ?auto_476696 ) ) ( not ( = ?auto_476690 ?auto_476697 ) ) ( not ( = ?auto_476690 ?auto_476698 ) ) ( not ( = ?auto_476690 ?auto_476699 ) ) ( not ( = ?auto_476690 ?auto_476700 ) ) ( not ( = ?auto_476690 ?auto_476701 ) ) ( not ( = ?auto_476690 ?auto_476702 ) ) ( not ( = ?auto_476690 ?auto_476703 ) ) ( not ( = ?auto_476690 ?auto_476704 ) ) ( not ( = ?auto_476690 ?auto_476705 ) ) ( not ( = ?auto_476691 ?auto_476692 ) ) ( not ( = ?auto_476691 ?auto_476693 ) ) ( not ( = ?auto_476691 ?auto_476694 ) ) ( not ( = ?auto_476691 ?auto_476695 ) ) ( not ( = ?auto_476691 ?auto_476696 ) ) ( not ( = ?auto_476691 ?auto_476697 ) ) ( not ( = ?auto_476691 ?auto_476698 ) ) ( not ( = ?auto_476691 ?auto_476699 ) ) ( not ( = ?auto_476691 ?auto_476700 ) ) ( not ( = ?auto_476691 ?auto_476701 ) ) ( not ( = ?auto_476691 ?auto_476702 ) ) ( not ( = ?auto_476691 ?auto_476703 ) ) ( not ( = ?auto_476691 ?auto_476704 ) ) ( not ( = ?auto_476691 ?auto_476705 ) ) ( not ( = ?auto_476692 ?auto_476693 ) ) ( not ( = ?auto_476692 ?auto_476694 ) ) ( not ( = ?auto_476692 ?auto_476695 ) ) ( not ( = ?auto_476692 ?auto_476696 ) ) ( not ( = ?auto_476692 ?auto_476697 ) ) ( not ( = ?auto_476692 ?auto_476698 ) ) ( not ( = ?auto_476692 ?auto_476699 ) ) ( not ( = ?auto_476692 ?auto_476700 ) ) ( not ( = ?auto_476692 ?auto_476701 ) ) ( not ( = ?auto_476692 ?auto_476702 ) ) ( not ( = ?auto_476692 ?auto_476703 ) ) ( not ( = ?auto_476692 ?auto_476704 ) ) ( not ( = ?auto_476692 ?auto_476705 ) ) ( not ( = ?auto_476693 ?auto_476694 ) ) ( not ( = ?auto_476693 ?auto_476695 ) ) ( not ( = ?auto_476693 ?auto_476696 ) ) ( not ( = ?auto_476693 ?auto_476697 ) ) ( not ( = ?auto_476693 ?auto_476698 ) ) ( not ( = ?auto_476693 ?auto_476699 ) ) ( not ( = ?auto_476693 ?auto_476700 ) ) ( not ( = ?auto_476693 ?auto_476701 ) ) ( not ( = ?auto_476693 ?auto_476702 ) ) ( not ( = ?auto_476693 ?auto_476703 ) ) ( not ( = ?auto_476693 ?auto_476704 ) ) ( not ( = ?auto_476693 ?auto_476705 ) ) ( not ( = ?auto_476694 ?auto_476695 ) ) ( not ( = ?auto_476694 ?auto_476696 ) ) ( not ( = ?auto_476694 ?auto_476697 ) ) ( not ( = ?auto_476694 ?auto_476698 ) ) ( not ( = ?auto_476694 ?auto_476699 ) ) ( not ( = ?auto_476694 ?auto_476700 ) ) ( not ( = ?auto_476694 ?auto_476701 ) ) ( not ( = ?auto_476694 ?auto_476702 ) ) ( not ( = ?auto_476694 ?auto_476703 ) ) ( not ( = ?auto_476694 ?auto_476704 ) ) ( not ( = ?auto_476694 ?auto_476705 ) ) ( not ( = ?auto_476695 ?auto_476696 ) ) ( not ( = ?auto_476695 ?auto_476697 ) ) ( not ( = ?auto_476695 ?auto_476698 ) ) ( not ( = ?auto_476695 ?auto_476699 ) ) ( not ( = ?auto_476695 ?auto_476700 ) ) ( not ( = ?auto_476695 ?auto_476701 ) ) ( not ( = ?auto_476695 ?auto_476702 ) ) ( not ( = ?auto_476695 ?auto_476703 ) ) ( not ( = ?auto_476695 ?auto_476704 ) ) ( not ( = ?auto_476695 ?auto_476705 ) ) ( not ( = ?auto_476696 ?auto_476697 ) ) ( not ( = ?auto_476696 ?auto_476698 ) ) ( not ( = ?auto_476696 ?auto_476699 ) ) ( not ( = ?auto_476696 ?auto_476700 ) ) ( not ( = ?auto_476696 ?auto_476701 ) ) ( not ( = ?auto_476696 ?auto_476702 ) ) ( not ( = ?auto_476696 ?auto_476703 ) ) ( not ( = ?auto_476696 ?auto_476704 ) ) ( not ( = ?auto_476696 ?auto_476705 ) ) ( not ( = ?auto_476697 ?auto_476698 ) ) ( not ( = ?auto_476697 ?auto_476699 ) ) ( not ( = ?auto_476697 ?auto_476700 ) ) ( not ( = ?auto_476697 ?auto_476701 ) ) ( not ( = ?auto_476697 ?auto_476702 ) ) ( not ( = ?auto_476697 ?auto_476703 ) ) ( not ( = ?auto_476697 ?auto_476704 ) ) ( not ( = ?auto_476697 ?auto_476705 ) ) ( not ( = ?auto_476698 ?auto_476699 ) ) ( not ( = ?auto_476698 ?auto_476700 ) ) ( not ( = ?auto_476698 ?auto_476701 ) ) ( not ( = ?auto_476698 ?auto_476702 ) ) ( not ( = ?auto_476698 ?auto_476703 ) ) ( not ( = ?auto_476698 ?auto_476704 ) ) ( not ( = ?auto_476698 ?auto_476705 ) ) ( not ( = ?auto_476699 ?auto_476700 ) ) ( not ( = ?auto_476699 ?auto_476701 ) ) ( not ( = ?auto_476699 ?auto_476702 ) ) ( not ( = ?auto_476699 ?auto_476703 ) ) ( not ( = ?auto_476699 ?auto_476704 ) ) ( not ( = ?auto_476699 ?auto_476705 ) ) ( not ( = ?auto_476700 ?auto_476701 ) ) ( not ( = ?auto_476700 ?auto_476702 ) ) ( not ( = ?auto_476700 ?auto_476703 ) ) ( not ( = ?auto_476700 ?auto_476704 ) ) ( not ( = ?auto_476700 ?auto_476705 ) ) ( not ( = ?auto_476701 ?auto_476702 ) ) ( not ( = ?auto_476701 ?auto_476703 ) ) ( not ( = ?auto_476701 ?auto_476704 ) ) ( not ( = ?auto_476701 ?auto_476705 ) ) ( not ( = ?auto_476702 ?auto_476703 ) ) ( not ( = ?auto_476702 ?auto_476704 ) ) ( not ( = ?auto_476702 ?auto_476705 ) ) ( not ( = ?auto_476703 ?auto_476704 ) ) ( not ( = ?auto_476703 ?auto_476705 ) ) ( not ( = ?auto_476704 ?auto_476705 ) ) ( ON ?auto_476703 ?auto_476704 ) ( ON ?auto_476702 ?auto_476703 ) ( ON ?auto_476701 ?auto_476702 ) ( CLEAR ?auto_476699 ) ( ON ?auto_476700 ?auto_476701 ) ( CLEAR ?auto_476700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_476689 ?auto_476690 ?auto_476691 ?auto_476692 ?auto_476693 ?auto_476694 ?auto_476695 ?auto_476696 ?auto_476697 ?auto_476698 ?auto_476699 ?auto_476700 )
      ( MAKE-16PILE ?auto_476689 ?auto_476690 ?auto_476691 ?auto_476692 ?auto_476693 ?auto_476694 ?auto_476695 ?auto_476696 ?auto_476697 ?auto_476698 ?auto_476699 ?auto_476700 ?auto_476701 ?auto_476702 ?auto_476703 ?auto_476704 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476722 - BLOCK
      ?auto_476723 - BLOCK
      ?auto_476724 - BLOCK
      ?auto_476725 - BLOCK
      ?auto_476726 - BLOCK
      ?auto_476727 - BLOCK
      ?auto_476728 - BLOCK
      ?auto_476729 - BLOCK
      ?auto_476730 - BLOCK
      ?auto_476731 - BLOCK
      ?auto_476732 - BLOCK
      ?auto_476733 - BLOCK
      ?auto_476734 - BLOCK
      ?auto_476735 - BLOCK
      ?auto_476736 - BLOCK
      ?auto_476737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476737 ) ( ON-TABLE ?auto_476722 ) ( ON ?auto_476723 ?auto_476722 ) ( ON ?auto_476724 ?auto_476723 ) ( ON ?auto_476725 ?auto_476724 ) ( ON ?auto_476726 ?auto_476725 ) ( ON ?auto_476727 ?auto_476726 ) ( ON ?auto_476728 ?auto_476727 ) ( ON ?auto_476729 ?auto_476728 ) ( ON ?auto_476730 ?auto_476729 ) ( ON ?auto_476731 ?auto_476730 ) ( ON ?auto_476732 ?auto_476731 ) ( not ( = ?auto_476722 ?auto_476723 ) ) ( not ( = ?auto_476722 ?auto_476724 ) ) ( not ( = ?auto_476722 ?auto_476725 ) ) ( not ( = ?auto_476722 ?auto_476726 ) ) ( not ( = ?auto_476722 ?auto_476727 ) ) ( not ( = ?auto_476722 ?auto_476728 ) ) ( not ( = ?auto_476722 ?auto_476729 ) ) ( not ( = ?auto_476722 ?auto_476730 ) ) ( not ( = ?auto_476722 ?auto_476731 ) ) ( not ( = ?auto_476722 ?auto_476732 ) ) ( not ( = ?auto_476722 ?auto_476733 ) ) ( not ( = ?auto_476722 ?auto_476734 ) ) ( not ( = ?auto_476722 ?auto_476735 ) ) ( not ( = ?auto_476722 ?auto_476736 ) ) ( not ( = ?auto_476722 ?auto_476737 ) ) ( not ( = ?auto_476723 ?auto_476724 ) ) ( not ( = ?auto_476723 ?auto_476725 ) ) ( not ( = ?auto_476723 ?auto_476726 ) ) ( not ( = ?auto_476723 ?auto_476727 ) ) ( not ( = ?auto_476723 ?auto_476728 ) ) ( not ( = ?auto_476723 ?auto_476729 ) ) ( not ( = ?auto_476723 ?auto_476730 ) ) ( not ( = ?auto_476723 ?auto_476731 ) ) ( not ( = ?auto_476723 ?auto_476732 ) ) ( not ( = ?auto_476723 ?auto_476733 ) ) ( not ( = ?auto_476723 ?auto_476734 ) ) ( not ( = ?auto_476723 ?auto_476735 ) ) ( not ( = ?auto_476723 ?auto_476736 ) ) ( not ( = ?auto_476723 ?auto_476737 ) ) ( not ( = ?auto_476724 ?auto_476725 ) ) ( not ( = ?auto_476724 ?auto_476726 ) ) ( not ( = ?auto_476724 ?auto_476727 ) ) ( not ( = ?auto_476724 ?auto_476728 ) ) ( not ( = ?auto_476724 ?auto_476729 ) ) ( not ( = ?auto_476724 ?auto_476730 ) ) ( not ( = ?auto_476724 ?auto_476731 ) ) ( not ( = ?auto_476724 ?auto_476732 ) ) ( not ( = ?auto_476724 ?auto_476733 ) ) ( not ( = ?auto_476724 ?auto_476734 ) ) ( not ( = ?auto_476724 ?auto_476735 ) ) ( not ( = ?auto_476724 ?auto_476736 ) ) ( not ( = ?auto_476724 ?auto_476737 ) ) ( not ( = ?auto_476725 ?auto_476726 ) ) ( not ( = ?auto_476725 ?auto_476727 ) ) ( not ( = ?auto_476725 ?auto_476728 ) ) ( not ( = ?auto_476725 ?auto_476729 ) ) ( not ( = ?auto_476725 ?auto_476730 ) ) ( not ( = ?auto_476725 ?auto_476731 ) ) ( not ( = ?auto_476725 ?auto_476732 ) ) ( not ( = ?auto_476725 ?auto_476733 ) ) ( not ( = ?auto_476725 ?auto_476734 ) ) ( not ( = ?auto_476725 ?auto_476735 ) ) ( not ( = ?auto_476725 ?auto_476736 ) ) ( not ( = ?auto_476725 ?auto_476737 ) ) ( not ( = ?auto_476726 ?auto_476727 ) ) ( not ( = ?auto_476726 ?auto_476728 ) ) ( not ( = ?auto_476726 ?auto_476729 ) ) ( not ( = ?auto_476726 ?auto_476730 ) ) ( not ( = ?auto_476726 ?auto_476731 ) ) ( not ( = ?auto_476726 ?auto_476732 ) ) ( not ( = ?auto_476726 ?auto_476733 ) ) ( not ( = ?auto_476726 ?auto_476734 ) ) ( not ( = ?auto_476726 ?auto_476735 ) ) ( not ( = ?auto_476726 ?auto_476736 ) ) ( not ( = ?auto_476726 ?auto_476737 ) ) ( not ( = ?auto_476727 ?auto_476728 ) ) ( not ( = ?auto_476727 ?auto_476729 ) ) ( not ( = ?auto_476727 ?auto_476730 ) ) ( not ( = ?auto_476727 ?auto_476731 ) ) ( not ( = ?auto_476727 ?auto_476732 ) ) ( not ( = ?auto_476727 ?auto_476733 ) ) ( not ( = ?auto_476727 ?auto_476734 ) ) ( not ( = ?auto_476727 ?auto_476735 ) ) ( not ( = ?auto_476727 ?auto_476736 ) ) ( not ( = ?auto_476727 ?auto_476737 ) ) ( not ( = ?auto_476728 ?auto_476729 ) ) ( not ( = ?auto_476728 ?auto_476730 ) ) ( not ( = ?auto_476728 ?auto_476731 ) ) ( not ( = ?auto_476728 ?auto_476732 ) ) ( not ( = ?auto_476728 ?auto_476733 ) ) ( not ( = ?auto_476728 ?auto_476734 ) ) ( not ( = ?auto_476728 ?auto_476735 ) ) ( not ( = ?auto_476728 ?auto_476736 ) ) ( not ( = ?auto_476728 ?auto_476737 ) ) ( not ( = ?auto_476729 ?auto_476730 ) ) ( not ( = ?auto_476729 ?auto_476731 ) ) ( not ( = ?auto_476729 ?auto_476732 ) ) ( not ( = ?auto_476729 ?auto_476733 ) ) ( not ( = ?auto_476729 ?auto_476734 ) ) ( not ( = ?auto_476729 ?auto_476735 ) ) ( not ( = ?auto_476729 ?auto_476736 ) ) ( not ( = ?auto_476729 ?auto_476737 ) ) ( not ( = ?auto_476730 ?auto_476731 ) ) ( not ( = ?auto_476730 ?auto_476732 ) ) ( not ( = ?auto_476730 ?auto_476733 ) ) ( not ( = ?auto_476730 ?auto_476734 ) ) ( not ( = ?auto_476730 ?auto_476735 ) ) ( not ( = ?auto_476730 ?auto_476736 ) ) ( not ( = ?auto_476730 ?auto_476737 ) ) ( not ( = ?auto_476731 ?auto_476732 ) ) ( not ( = ?auto_476731 ?auto_476733 ) ) ( not ( = ?auto_476731 ?auto_476734 ) ) ( not ( = ?auto_476731 ?auto_476735 ) ) ( not ( = ?auto_476731 ?auto_476736 ) ) ( not ( = ?auto_476731 ?auto_476737 ) ) ( not ( = ?auto_476732 ?auto_476733 ) ) ( not ( = ?auto_476732 ?auto_476734 ) ) ( not ( = ?auto_476732 ?auto_476735 ) ) ( not ( = ?auto_476732 ?auto_476736 ) ) ( not ( = ?auto_476732 ?auto_476737 ) ) ( not ( = ?auto_476733 ?auto_476734 ) ) ( not ( = ?auto_476733 ?auto_476735 ) ) ( not ( = ?auto_476733 ?auto_476736 ) ) ( not ( = ?auto_476733 ?auto_476737 ) ) ( not ( = ?auto_476734 ?auto_476735 ) ) ( not ( = ?auto_476734 ?auto_476736 ) ) ( not ( = ?auto_476734 ?auto_476737 ) ) ( not ( = ?auto_476735 ?auto_476736 ) ) ( not ( = ?auto_476735 ?auto_476737 ) ) ( not ( = ?auto_476736 ?auto_476737 ) ) ( ON ?auto_476736 ?auto_476737 ) ( ON ?auto_476735 ?auto_476736 ) ( ON ?auto_476734 ?auto_476735 ) ( CLEAR ?auto_476732 ) ( ON ?auto_476733 ?auto_476734 ) ( CLEAR ?auto_476733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_476722 ?auto_476723 ?auto_476724 ?auto_476725 ?auto_476726 ?auto_476727 ?auto_476728 ?auto_476729 ?auto_476730 ?auto_476731 ?auto_476732 ?auto_476733 )
      ( MAKE-16PILE ?auto_476722 ?auto_476723 ?auto_476724 ?auto_476725 ?auto_476726 ?auto_476727 ?auto_476728 ?auto_476729 ?auto_476730 ?auto_476731 ?auto_476732 ?auto_476733 ?auto_476734 ?auto_476735 ?auto_476736 ?auto_476737 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476754 - BLOCK
      ?auto_476755 - BLOCK
      ?auto_476756 - BLOCK
      ?auto_476757 - BLOCK
      ?auto_476758 - BLOCK
      ?auto_476759 - BLOCK
      ?auto_476760 - BLOCK
      ?auto_476761 - BLOCK
      ?auto_476762 - BLOCK
      ?auto_476763 - BLOCK
      ?auto_476764 - BLOCK
      ?auto_476765 - BLOCK
      ?auto_476766 - BLOCK
      ?auto_476767 - BLOCK
      ?auto_476768 - BLOCK
      ?auto_476769 - BLOCK
    )
    :vars
    (
      ?auto_476770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476769 ?auto_476770 ) ( ON-TABLE ?auto_476754 ) ( ON ?auto_476755 ?auto_476754 ) ( ON ?auto_476756 ?auto_476755 ) ( ON ?auto_476757 ?auto_476756 ) ( ON ?auto_476758 ?auto_476757 ) ( ON ?auto_476759 ?auto_476758 ) ( ON ?auto_476760 ?auto_476759 ) ( ON ?auto_476761 ?auto_476760 ) ( ON ?auto_476762 ?auto_476761 ) ( ON ?auto_476763 ?auto_476762 ) ( not ( = ?auto_476754 ?auto_476755 ) ) ( not ( = ?auto_476754 ?auto_476756 ) ) ( not ( = ?auto_476754 ?auto_476757 ) ) ( not ( = ?auto_476754 ?auto_476758 ) ) ( not ( = ?auto_476754 ?auto_476759 ) ) ( not ( = ?auto_476754 ?auto_476760 ) ) ( not ( = ?auto_476754 ?auto_476761 ) ) ( not ( = ?auto_476754 ?auto_476762 ) ) ( not ( = ?auto_476754 ?auto_476763 ) ) ( not ( = ?auto_476754 ?auto_476764 ) ) ( not ( = ?auto_476754 ?auto_476765 ) ) ( not ( = ?auto_476754 ?auto_476766 ) ) ( not ( = ?auto_476754 ?auto_476767 ) ) ( not ( = ?auto_476754 ?auto_476768 ) ) ( not ( = ?auto_476754 ?auto_476769 ) ) ( not ( = ?auto_476754 ?auto_476770 ) ) ( not ( = ?auto_476755 ?auto_476756 ) ) ( not ( = ?auto_476755 ?auto_476757 ) ) ( not ( = ?auto_476755 ?auto_476758 ) ) ( not ( = ?auto_476755 ?auto_476759 ) ) ( not ( = ?auto_476755 ?auto_476760 ) ) ( not ( = ?auto_476755 ?auto_476761 ) ) ( not ( = ?auto_476755 ?auto_476762 ) ) ( not ( = ?auto_476755 ?auto_476763 ) ) ( not ( = ?auto_476755 ?auto_476764 ) ) ( not ( = ?auto_476755 ?auto_476765 ) ) ( not ( = ?auto_476755 ?auto_476766 ) ) ( not ( = ?auto_476755 ?auto_476767 ) ) ( not ( = ?auto_476755 ?auto_476768 ) ) ( not ( = ?auto_476755 ?auto_476769 ) ) ( not ( = ?auto_476755 ?auto_476770 ) ) ( not ( = ?auto_476756 ?auto_476757 ) ) ( not ( = ?auto_476756 ?auto_476758 ) ) ( not ( = ?auto_476756 ?auto_476759 ) ) ( not ( = ?auto_476756 ?auto_476760 ) ) ( not ( = ?auto_476756 ?auto_476761 ) ) ( not ( = ?auto_476756 ?auto_476762 ) ) ( not ( = ?auto_476756 ?auto_476763 ) ) ( not ( = ?auto_476756 ?auto_476764 ) ) ( not ( = ?auto_476756 ?auto_476765 ) ) ( not ( = ?auto_476756 ?auto_476766 ) ) ( not ( = ?auto_476756 ?auto_476767 ) ) ( not ( = ?auto_476756 ?auto_476768 ) ) ( not ( = ?auto_476756 ?auto_476769 ) ) ( not ( = ?auto_476756 ?auto_476770 ) ) ( not ( = ?auto_476757 ?auto_476758 ) ) ( not ( = ?auto_476757 ?auto_476759 ) ) ( not ( = ?auto_476757 ?auto_476760 ) ) ( not ( = ?auto_476757 ?auto_476761 ) ) ( not ( = ?auto_476757 ?auto_476762 ) ) ( not ( = ?auto_476757 ?auto_476763 ) ) ( not ( = ?auto_476757 ?auto_476764 ) ) ( not ( = ?auto_476757 ?auto_476765 ) ) ( not ( = ?auto_476757 ?auto_476766 ) ) ( not ( = ?auto_476757 ?auto_476767 ) ) ( not ( = ?auto_476757 ?auto_476768 ) ) ( not ( = ?auto_476757 ?auto_476769 ) ) ( not ( = ?auto_476757 ?auto_476770 ) ) ( not ( = ?auto_476758 ?auto_476759 ) ) ( not ( = ?auto_476758 ?auto_476760 ) ) ( not ( = ?auto_476758 ?auto_476761 ) ) ( not ( = ?auto_476758 ?auto_476762 ) ) ( not ( = ?auto_476758 ?auto_476763 ) ) ( not ( = ?auto_476758 ?auto_476764 ) ) ( not ( = ?auto_476758 ?auto_476765 ) ) ( not ( = ?auto_476758 ?auto_476766 ) ) ( not ( = ?auto_476758 ?auto_476767 ) ) ( not ( = ?auto_476758 ?auto_476768 ) ) ( not ( = ?auto_476758 ?auto_476769 ) ) ( not ( = ?auto_476758 ?auto_476770 ) ) ( not ( = ?auto_476759 ?auto_476760 ) ) ( not ( = ?auto_476759 ?auto_476761 ) ) ( not ( = ?auto_476759 ?auto_476762 ) ) ( not ( = ?auto_476759 ?auto_476763 ) ) ( not ( = ?auto_476759 ?auto_476764 ) ) ( not ( = ?auto_476759 ?auto_476765 ) ) ( not ( = ?auto_476759 ?auto_476766 ) ) ( not ( = ?auto_476759 ?auto_476767 ) ) ( not ( = ?auto_476759 ?auto_476768 ) ) ( not ( = ?auto_476759 ?auto_476769 ) ) ( not ( = ?auto_476759 ?auto_476770 ) ) ( not ( = ?auto_476760 ?auto_476761 ) ) ( not ( = ?auto_476760 ?auto_476762 ) ) ( not ( = ?auto_476760 ?auto_476763 ) ) ( not ( = ?auto_476760 ?auto_476764 ) ) ( not ( = ?auto_476760 ?auto_476765 ) ) ( not ( = ?auto_476760 ?auto_476766 ) ) ( not ( = ?auto_476760 ?auto_476767 ) ) ( not ( = ?auto_476760 ?auto_476768 ) ) ( not ( = ?auto_476760 ?auto_476769 ) ) ( not ( = ?auto_476760 ?auto_476770 ) ) ( not ( = ?auto_476761 ?auto_476762 ) ) ( not ( = ?auto_476761 ?auto_476763 ) ) ( not ( = ?auto_476761 ?auto_476764 ) ) ( not ( = ?auto_476761 ?auto_476765 ) ) ( not ( = ?auto_476761 ?auto_476766 ) ) ( not ( = ?auto_476761 ?auto_476767 ) ) ( not ( = ?auto_476761 ?auto_476768 ) ) ( not ( = ?auto_476761 ?auto_476769 ) ) ( not ( = ?auto_476761 ?auto_476770 ) ) ( not ( = ?auto_476762 ?auto_476763 ) ) ( not ( = ?auto_476762 ?auto_476764 ) ) ( not ( = ?auto_476762 ?auto_476765 ) ) ( not ( = ?auto_476762 ?auto_476766 ) ) ( not ( = ?auto_476762 ?auto_476767 ) ) ( not ( = ?auto_476762 ?auto_476768 ) ) ( not ( = ?auto_476762 ?auto_476769 ) ) ( not ( = ?auto_476762 ?auto_476770 ) ) ( not ( = ?auto_476763 ?auto_476764 ) ) ( not ( = ?auto_476763 ?auto_476765 ) ) ( not ( = ?auto_476763 ?auto_476766 ) ) ( not ( = ?auto_476763 ?auto_476767 ) ) ( not ( = ?auto_476763 ?auto_476768 ) ) ( not ( = ?auto_476763 ?auto_476769 ) ) ( not ( = ?auto_476763 ?auto_476770 ) ) ( not ( = ?auto_476764 ?auto_476765 ) ) ( not ( = ?auto_476764 ?auto_476766 ) ) ( not ( = ?auto_476764 ?auto_476767 ) ) ( not ( = ?auto_476764 ?auto_476768 ) ) ( not ( = ?auto_476764 ?auto_476769 ) ) ( not ( = ?auto_476764 ?auto_476770 ) ) ( not ( = ?auto_476765 ?auto_476766 ) ) ( not ( = ?auto_476765 ?auto_476767 ) ) ( not ( = ?auto_476765 ?auto_476768 ) ) ( not ( = ?auto_476765 ?auto_476769 ) ) ( not ( = ?auto_476765 ?auto_476770 ) ) ( not ( = ?auto_476766 ?auto_476767 ) ) ( not ( = ?auto_476766 ?auto_476768 ) ) ( not ( = ?auto_476766 ?auto_476769 ) ) ( not ( = ?auto_476766 ?auto_476770 ) ) ( not ( = ?auto_476767 ?auto_476768 ) ) ( not ( = ?auto_476767 ?auto_476769 ) ) ( not ( = ?auto_476767 ?auto_476770 ) ) ( not ( = ?auto_476768 ?auto_476769 ) ) ( not ( = ?auto_476768 ?auto_476770 ) ) ( not ( = ?auto_476769 ?auto_476770 ) ) ( ON ?auto_476768 ?auto_476769 ) ( ON ?auto_476767 ?auto_476768 ) ( ON ?auto_476766 ?auto_476767 ) ( ON ?auto_476765 ?auto_476766 ) ( CLEAR ?auto_476763 ) ( ON ?auto_476764 ?auto_476765 ) ( CLEAR ?auto_476764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_476754 ?auto_476755 ?auto_476756 ?auto_476757 ?auto_476758 ?auto_476759 ?auto_476760 ?auto_476761 ?auto_476762 ?auto_476763 ?auto_476764 )
      ( MAKE-16PILE ?auto_476754 ?auto_476755 ?auto_476756 ?auto_476757 ?auto_476758 ?auto_476759 ?auto_476760 ?auto_476761 ?auto_476762 ?auto_476763 ?auto_476764 ?auto_476765 ?auto_476766 ?auto_476767 ?auto_476768 ?auto_476769 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476787 - BLOCK
      ?auto_476788 - BLOCK
      ?auto_476789 - BLOCK
      ?auto_476790 - BLOCK
      ?auto_476791 - BLOCK
      ?auto_476792 - BLOCK
      ?auto_476793 - BLOCK
      ?auto_476794 - BLOCK
      ?auto_476795 - BLOCK
      ?auto_476796 - BLOCK
      ?auto_476797 - BLOCK
      ?auto_476798 - BLOCK
      ?auto_476799 - BLOCK
      ?auto_476800 - BLOCK
      ?auto_476801 - BLOCK
      ?auto_476802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476802 ) ( ON-TABLE ?auto_476787 ) ( ON ?auto_476788 ?auto_476787 ) ( ON ?auto_476789 ?auto_476788 ) ( ON ?auto_476790 ?auto_476789 ) ( ON ?auto_476791 ?auto_476790 ) ( ON ?auto_476792 ?auto_476791 ) ( ON ?auto_476793 ?auto_476792 ) ( ON ?auto_476794 ?auto_476793 ) ( ON ?auto_476795 ?auto_476794 ) ( ON ?auto_476796 ?auto_476795 ) ( not ( = ?auto_476787 ?auto_476788 ) ) ( not ( = ?auto_476787 ?auto_476789 ) ) ( not ( = ?auto_476787 ?auto_476790 ) ) ( not ( = ?auto_476787 ?auto_476791 ) ) ( not ( = ?auto_476787 ?auto_476792 ) ) ( not ( = ?auto_476787 ?auto_476793 ) ) ( not ( = ?auto_476787 ?auto_476794 ) ) ( not ( = ?auto_476787 ?auto_476795 ) ) ( not ( = ?auto_476787 ?auto_476796 ) ) ( not ( = ?auto_476787 ?auto_476797 ) ) ( not ( = ?auto_476787 ?auto_476798 ) ) ( not ( = ?auto_476787 ?auto_476799 ) ) ( not ( = ?auto_476787 ?auto_476800 ) ) ( not ( = ?auto_476787 ?auto_476801 ) ) ( not ( = ?auto_476787 ?auto_476802 ) ) ( not ( = ?auto_476788 ?auto_476789 ) ) ( not ( = ?auto_476788 ?auto_476790 ) ) ( not ( = ?auto_476788 ?auto_476791 ) ) ( not ( = ?auto_476788 ?auto_476792 ) ) ( not ( = ?auto_476788 ?auto_476793 ) ) ( not ( = ?auto_476788 ?auto_476794 ) ) ( not ( = ?auto_476788 ?auto_476795 ) ) ( not ( = ?auto_476788 ?auto_476796 ) ) ( not ( = ?auto_476788 ?auto_476797 ) ) ( not ( = ?auto_476788 ?auto_476798 ) ) ( not ( = ?auto_476788 ?auto_476799 ) ) ( not ( = ?auto_476788 ?auto_476800 ) ) ( not ( = ?auto_476788 ?auto_476801 ) ) ( not ( = ?auto_476788 ?auto_476802 ) ) ( not ( = ?auto_476789 ?auto_476790 ) ) ( not ( = ?auto_476789 ?auto_476791 ) ) ( not ( = ?auto_476789 ?auto_476792 ) ) ( not ( = ?auto_476789 ?auto_476793 ) ) ( not ( = ?auto_476789 ?auto_476794 ) ) ( not ( = ?auto_476789 ?auto_476795 ) ) ( not ( = ?auto_476789 ?auto_476796 ) ) ( not ( = ?auto_476789 ?auto_476797 ) ) ( not ( = ?auto_476789 ?auto_476798 ) ) ( not ( = ?auto_476789 ?auto_476799 ) ) ( not ( = ?auto_476789 ?auto_476800 ) ) ( not ( = ?auto_476789 ?auto_476801 ) ) ( not ( = ?auto_476789 ?auto_476802 ) ) ( not ( = ?auto_476790 ?auto_476791 ) ) ( not ( = ?auto_476790 ?auto_476792 ) ) ( not ( = ?auto_476790 ?auto_476793 ) ) ( not ( = ?auto_476790 ?auto_476794 ) ) ( not ( = ?auto_476790 ?auto_476795 ) ) ( not ( = ?auto_476790 ?auto_476796 ) ) ( not ( = ?auto_476790 ?auto_476797 ) ) ( not ( = ?auto_476790 ?auto_476798 ) ) ( not ( = ?auto_476790 ?auto_476799 ) ) ( not ( = ?auto_476790 ?auto_476800 ) ) ( not ( = ?auto_476790 ?auto_476801 ) ) ( not ( = ?auto_476790 ?auto_476802 ) ) ( not ( = ?auto_476791 ?auto_476792 ) ) ( not ( = ?auto_476791 ?auto_476793 ) ) ( not ( = ?auto_476791 ?auto_476794 ) ) ( not ( = ?auto_476791 ?auto_476795 ) ) ( not ( = ?auto_476791 ?auto_476796 ) ) ( not ( = ?auto_476791 ?auto_476797 ) ) ( not ( = ?auto_476791 ?auto_476798 ) ) ( not ( = ?auto_476791 ?auto_476799 ) ) ( not ( = ?auto_476791 ?auto_476800 ) ) ( not ( = ?auto_476791 ?auto_476801 ) ) ( not ( = ?auto_476791 ?auto_476802 ) ) ( not ( = ?auto_476792 ?auto_476793 ) ) ( not ( = ?auto_476792 ?auto_476794 ) ) ( not ( = ?auto_476792 ?auto_476795 ) ) ( not ( = ?auto_476792 ?auto_476796 ) ) ( not ( = ?auto_476792 ?auto_476797 ) ) ( not ( = ?auto_476792 ?auto_476798 ) ) ( not ( = ?auto_476792 ?auto_476799 ) ) ( not ( = ?auto_476792 ?auto_476800 ) ) ( not ( = ?auto_476792 ?auto_476801 ) ) ( not ( = ?auto_476792 ?auto_476802 ) ) ( not ( = ?auto_476793 ?auto_476794 ) ) ( not ( = ?auto_476793 ?auto_476795 ) ) ( not ( = ?auto_476793 ?auto_476796 ) ) ( not ( = ?auto_476793 ?auto_476797 ) ) ( not ( = ?auto_476793 ?auto_476798 ) ) ( not ( = ?auto_476793 ?auto_476799 ) ) ( not ( = ?auto_476793 ?auto_476800 ) ) ( not ( = ?auto_476793 ?auto_476801 ) ) ( not ( = ?auto_476793 ?auto_476802 ) ) ( not ( = ?auto_476794 ?auto_476795 ) ) ( not ( = ?auto_476794 ?auto_476796 ) ) ( not ( = ?auto_476794 ?auto_476797 ) ) ( not ( = ?auto_476794 ?auto_476798 ) ) ( not ( = ?auto_476794 ?auto_476799 ) ) ( not ( = ?auto_476794 ?auto_476800 ) ) ( not ( = ?auto_476794 ?auto_476801 ) ) ( not ( = ?auto_476794 ?auto_476802 ) ) ( not ( = ?auto_476795 ?auto_476796 ) ) ( not ( = ?auto_476795 ?auto_476797 ) ) ( not ( = ?auto_476795 ?auto_476798 ) ) ( not ( = ?auto_476795 ?auto_476799 ) ) ( not ( = ?auto_476795 ?auto_476800 ) ) ( not ( = ?auto_476795 ?auto_476801 ) ) ( not ( = ?auto_476795 ?auto_476802 ) ) ( not ( = ?auto_476796 ?auto_476797 ) ) ( not ( = ?auto_476796 ?auto_476798 ) ) ( not ( = ?auto_476796 ?auto_476799 ) ) ( not ( = ?auto_476796 ?auto_476800 ) ) ( not ( = ?auto_476796 ?auto_476801 ) ) ( not ( = ?auto_476796 ?auto_476802 ) ) ( not ( = ?auto_476797 ?auto_476798 ) ) ( not ( = ?auto_476797 ?auto_476799 ) ) ( not ( = ?auto_476797 ?auto_476800 ) ) ( not ( = ?auto_476797 ?auto_476801 ) ) ( not ( = ?auto_476797 ?auto_476802 ) ) ( not ( = ?auto_476798 ?auto_476799 ) ) ( not ( = ?auto_476798 ?auto_476800 ) ) ( not ( = ?auto_476798 ?auto_476801 ) ) ( not ( = ?auto_476798 ?auto_476802 ) ) ( not ( = ?auto_476799 ?auto_476800 ) ) ( not ( = ?auto_476799 ?auto_476801 ) ) ( not ( = ?auto_476799 ?auto_476802 ) ) ( not ( = ?auto_476800 ?auto_476801 ) ) ( not ( = ?auto_476800 ?auto_476802 ) ) ( not ( = ?auto_476801 ?auto_476802 ) ) ( ON ?auto_476801 ?auto_476802 ) ( ON ?auto_476800 ?auto_476801 ) ( ON ?auto_476799 ?auto_476800 ) ( ON ?auto_476798 ?auto_476799 ) ( CLEAR ?auto_476796 ) ( ON ?auto_476797 ?auto_476798 ) ( CLEAR ?auto_476797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_476787 ?auto_476788 ?auto_476789 ?auto_476790 ?auto_476791 ?auto_476792 ?auto_476793 ?auto_476794 ?auto_476795 ?auto_476796 ?auto_476797 )
      ( MAKE-16PILE ?auto_476787 ?auto_476788 ?auto_476789 ?auto_476790 ?auto_476791 ?auto_476792 ?auto_476793 ?auto_476794 ?auto_476795 ?auto_476796 ?auto_476797 ?auto_476798 ?auto_476799 ?auto_476800 ?auto_476801 ?auto_476802 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476819 - BLOCK
      ?auto_476820 - BLOCK
      ?auto_476821 - BLOCK
      ?auto_476822 - BLOCK
      ?auto_476823 - BLOCK
      ?auto_476824 - BLOCK
      ?auto_476825 - BLOCK
      ?auto_476826 - BLOCK
      ?auto_476827 - BLOCK
      ?auto_476828 - BLOCK
      ?auto_476829 - BLOCK
      ?auto_476830 - BLOCK
      ?auto_476831 - BLOCK
      ?auto_476832 - BLOCK
      ?auto_476833 - BLOCK
      ?auto_476834 - BLOCK
    )
    :vars
    (
      ?auto_476835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476834 ?auto_476835 ) ( ON-TABLE ?auto_476819 ) ( ON ?auto_476820 ?auto_476819 ) ( ON ?auto_476821 ?auto_476820 ) ( ON ?auto_476822 ?auto_476821 ) ( ON ?auto_476823 ?auto_476822 ) ( ON ?auto_476824 ?auto_476823 ) ( ON ?auto_476825 ?auto_476824 ) ( ON ?auto_476826 ?auto_476825 ) ( ON ?auto_476827 ?auto_476826 ) ( not ( = ?auto_476819 ?auto_476820 ) ) ( not ( = ?auto_476819 ?auto_476821 ) ) ( not ( = ?auto_476819 ?auto_476822 ) ) ( not ( = ?auto_476819 ?auto_476823 ) ) ( not ( = ?auto_476819 ?auto_476824 ) ) ( not ( = ?auto_476819 ?auto_476825 ) ) ( not ( = ?auto_476819 ?auto_476826 ) ) ( not ( = ?auto_476819 ?auto_476827 ) ) ( not ( = ?auto_476819 ?auto_476828 ) ) ( not ( = ?auto_476819 ?auto_476829 ) ) ( not ( = ?auto_476819 ?auto_476830 ) ) ( not ( = ?auto_476819 ?auto_476831 ) ) ( not ( = ?auto_476819 ?auto_476832 ) ) ( not ( = ?auto_476819 ?auto_476833 ) ) ( not ( = ?auto_476819 ?auto_476834 ) ) ( not ( = ?auto_476819 ?auto_476835 ) ) ( not ( = ?auto_476820 ?auto_476821 ) ) ( not ( = ?auto_476820 ?auto_476822 ) ) ( not ( = ?auto_476820 ?auto_476823 ) ) ( not ( = ?auto_476820 ?auto_476824 ) ) ( not ( = ?auto_476820 ?auto_476825 ) ) ( not ( = ?auto_476820 ?auto_476826 ) ) ( not ( = ?auto_476820 ?auto_476827 ) ) ( not ( = ?auto_476820 ?auto_476828 ) ) ( not ( = ?auto_476820 ?auto_476829 ) ) ( not ( = ?auto_476820 ?auto_476830 ) ) ( not ( = ?auto_476820 ?auto_476831 ) ) ( not ( = ?auto_476820 ?auto_476832 ) ) ( not ( = ?auto_476820 ?auto_476833 ) ) ( not ( = ?auto_476820 ?auto_476834 ) ) ( not ( = ?auto_476820 ?auto_476835 ) ) ( not ( = ?auto_476821 ?auto_476822 ) ) ( not ( = ?auto_476821 ?auto_476823 ) ) ( not ( = ?auto_476821 ?auto_476824 ) ) ( not ( = ?auto_476821 ?auto_476825 ) ) ( not ( = ?auto_476821 ?auto_476826 ) ) ( not ( = ?auto_476821 ?auto_476827 ) ) ( not ( = ?auto_476821 ?auto_476828 ) ) ( not ( = ?auto_476821 ?auto_476829 ) ) ( not ( = ?auto_476821 ?auto_476830 ) ) ( not ( = ?auto_476821 ?auto_476831 ) ) ( not ( = ?auto_476821 ?auto_476832 ) ) ( not ( = ?auto_476821 ?auto_476833 ) ) ( not ( = ?auto_476821 ?auto_476834 ) ) ( not ( = ?auto_476821 ?auto_476835 ) ) ( not ( = ?auto_476822 ?auto_476823 ) ) ( not ( = ?auto_476822 ?auto_476824 ) ) ( not ( = ?auto_476822 ?auto_476825 ) ) ( not ( = ?auto_476822 ?auto_476826 ) ) ( not ( = ?auto_476822 ?auto_476827 ) ) ( not ( = ?auto_476822 ?auto_476828 ) ) ( not ( = ?auto_476822 ?auto_476829 ) ) ( not ( = ?auto_476822 ?auto_476830 ) ) ( not ( = ?auto_476822 ?auto_476831 ) ) ( not ( = ?auto_476822 ?auto_476832 ) ) ( not ( = ?auto_476822 ?auto_476833 ) ) ( not ( = ?auto_476822 ?auto_476834 ) ) ( not ( = ?auto_476822 ?auto_476835 ) ) ( not ( = ?auto_476823 ?auto_476824 ) ) ( not ( = ?auto_476823 ?auto_476825 ) ) ( not ( = ?auto_476823 ?auto_476826 ) ) ( not ( = ?auto_476823 ?auto_476827 ) ) ( not ( = ?auto_476823 ?auto_476828 ) ) ( not ( = ?auto_476823 ?auto_476829 ) ) ( not ( = ?auto_476823 ?auto_476830 ) ) ( not ( = ?auto_476823 ?auto_476831 ) ) ( not ( = ?auto_476823 ?auto_476832 ) ) ( not ( = ?auto_476823 ?auto_476833 ) ) ( not ( = ?auto_476823 ?auto_476834 ) ) ( not ( = ?auto_476823 ?auto_476835 ) ) ( not ( = ?auto_476824 ?auto_476825 ) ) ( not ( = ?auto_476824 ?auto_476826 ) ) ( not ( = ?auto_476824 ?auto_476827 ) ) ( not ( = ?auto_476824 ?auto_476828 ) ) ( not ( = ?auto_476824 ?auto_476829 ) ) ( not ( = ?auto_476824 ?auto_476830 ) ) ( not ( = ?auto_476824 ?auto_476831 ) ) ( not ( = ?auto_476824 ?auto_476832 ) ) ( not ( = ?auto_476824 ?auto_476833 ) ) ( not ( = ?auto_476824 ?auto_476834 ) ) ( not ( = ?auto_476824 ?auto_476835 ) ) ( not ( = ?auto_476825 ?auto_476826 ) ) ( not ( = ?auto_476825 ?auto_476827 ) ) ( not ( = ?auto_476825 ?auto_476828 ) ) ( not ( = ?auto_476825 ?auto_476829 ) ) ( not ( = ?auto_476825 ?auto_476830 ) ) ( not ( = ?auto_476825 ?auto_476831 ) ) ( not ( = ?auto_476825 ?auto_476832 ) ) ( not ( = ?auto_476825 ?auto_476833 ) ) ( not ( = ?auto_476825 ?auto_476834 ) ) ( not ( = ?auto_476825 ?auto_476835 ) ) ( not ( = ?auto_476826 ?auto_476827 ) ) ( not ( = ?auto_476826 ?auto_476828 ) ) ( not ( = ?auto_476826 ?auto_476829 ) ) ( not ( = ?auto_476826 ?auto_476830 ) ) ( not ( = ?auto_476826 ?auto_476831 ) ) ( not ( = ?auto_476826 ?auto_476832 ) ) ( not ( = ?auto_476826 ?auto_476833 ) ) ( not ( = ?auto_476826 ?auto_476834 ) ) ( not ( = ?auto_476826 ?auto_476835 ) ) ( not ( = ?auto_476827 ?auto_476828 ) ) ( not ( = ?auto_476827 ?auto_476829 ) ) ( not ( = ?auto_476827 ?auto_476830 ) ) ( not ( = ?auto_476827 ?auto_476831 ) ) ( not ( = ?auto_476827 ?auto_476832 ) ) ( not ( = ?auto_476827 ?auto_476833 ) ) ( not ( = ?auto_476827 ?auto_476834 ) ) ( not ( = ?auto_476827 ?auto_476835 ) ) ( not ( = ?auto_476828 ?auto_476829 ) ) ( not ( = ?auto_476828 ?auto_476830 ) ) ( not ( = ?auto_476828 ?auto_476831 ) ) ( not ( = ?auto_476828 ?auto_476832 ) ) ( not ( = ?auto_476828 ?auto_476833 ) ) ( not ( = ?auto_476828 ?auto_476834 ) ) ( not ( = ?auto_476828 ?auto_476835 ) ) ( not ( = ?auto_476829 ?auto_476830 ) ) ( not ( = ?auto_476829 ?auto_476831 ) ) ( not ( = ?auto_476829 ?auto_476832 ) ) ( not ( = ?auto_476829 ?auto_476833 ) ) ( not ( = ?auto_476829 ?auto_476834 ) ) ( not ( = ?auto_476829 ?auto_476835 ) ) ( not ( = ?auto_476830 ?auto_476831 ) ) ( not ( = ?auto_476830 ?auto_476832 ) ) ( not ( = ?auto_476830 ?auto_476833 ) ) ( not ( = ?auto_476830 ?auto_476834 ) ) ( not ( = ?auto_476830 ?auto_476835 ) ) ( not ( = ?auto_476831 ?auto_476832 ) ) ( not ( = ?auto_476831 ?auto_476833 ) ) ( not ( = ?auto_476831 ?auto_476834 ) ) ( not ( = ?auto_476831 ?auto_476835 ) ) ( not ( = ?auto_476832 ?auto_476833 ) ) ( not ( = ?auto_476832 ?auto_476834 ) ) ( not ( = ?auto_476832 ?auto_476835 ) ) ( not ( = ?auto_476833 ?auto_476834 ) ) ( not ( = ?auto_476833 ?auto_476835 ) ) ( not ( = ?auto_476834 ?auto_476835 ) ) ( ON ?auto_476833 ?auto_476834 ) ( ON ?auto_476832 ?auto_476833 ) ( ON ?auto_476831 ?auto_476832 ) ( ON ?auto_476830 ?auto_476831 ) ( ON ?auto_476829 ?auto_476830 ) ( CLEAR ?auto_476827 ) ( ON ?auto_476828 ?auto_476829 ) ( CLEAR ?auto_476828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_476819 ?auto_476820 ?auto_476821 ?auto_476822 ?auto_476823 ?auto_476824 ?auto_476825 ?auto_476826 ?auto_476827 ?auto_476828 )
      ( MAKE-16PILE ?auto_476819 ?auto_476820 ?auto_476821 ?auto_476822 ?auto_476823 ?auto_476824 ?auto_476825 ?auto_476826 ?auto_476827 ?auto_476828 ?auto_476829 ?auto_476830 ?auto_476831 ?auto_476832 ?auto_476833 ?auto_476834 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476852 - BLOCK
      ?auto_476853 - BLOCK
      ?auto_476854 - BLOCK
      ?auto_476855 - BLOCK
      ?auto_476856 - BLOCK
      ?auto_476857 - BLOCK
      ?auto_476858 - BLOCK
      ?auto_476859 - BLOCK
      ?auto_476860 - BLOCK
      ?auto_476861 - BLOCK
      ?auto_476862 - BLOCK
      ?auto_476863 - BLOCK
      ?auto_476864 - BLOCK
      ?auto_476865 - BLOCK
      ?auto_476866 - BLOCK
      ?auto_476867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476867 ) ( ON-TABLE ?auto_476852 ) ( ON ?auto_476853 ?auto_476852 ) ( ON ?auto_476854 ?auto_476853 ) ( ON ?auto_476855 ?auto_476854 ) ( ON ?auto_476856 ?auto_476855 ) ( ON ?auto_476857 ?auto_476856 ) ( ON ?auto_476858 ?auto_476857 ) ( ON ?auto_476859 ?auto_476858 ) ( ON ?auto_476860 ?auto_476859 ) ( not ( = ?auto_476852 ?auto_476853 ) ) ( not ( = ?auto_476852 ?auto_476854 ) ) ( not ( = ?auto_476852 ?auto_476855 ) ) ( not ( = ?auto_476852 ?auto_476856 ) ) ( not ( = ?auto_476852 ?auto_476857 ) ) ( not ( = ?auto_476852 ?auto_476858 ) ) ( not ( = ?auto_476852 ?auto_476859 ) ) ( not ( = ?auto_476852 ?auto_476860 ) ) ( not ( = ?auto_476852 ?auto_476861 ) ) ( not ( = ?auto_476852 ?auto_476862 ) ) ( not ( = ?auto_476852 ?auto_476863 ) ) ( not ( = ?auto_476852 ?auto_476864 ) ) ( not ( = ?auto_476852 ?auto_476865 ) ) ( not ( = ?auto_476852 ?auto_476866 ) ) ( not ( = ?auto_476852 ?auto_476867 ) ) ( not ( = ?auto_476853 ?auto_476854 ) ) ( not ( = ?auto_476853 ?auto_476855 ) ) ( not ( = ?auto_476853 ?auto_476856 ) ) ( not ( = ?auto_476853 ?auto_476857 ) ) ( not ( = ?auto_476853 ?auto_476858 ) ) ( not ( = ?auto_476853 ?auto_476859 ) ) ( not ( = ?auto_476853 ?auto_476860 ) ) ( not ( = ?auto_476853 ?auto_476861 ) ) ( not ( = ?auto_476853 ?auto_476862 ) ) ( not ( = ?auto_476853 ?auto_476863 ) ) ( not ( = ?auto_476853 ?auto_476864 ) ) ( not ( = ?auto_476853 ?auto_476865 ) ) ( not ( = ?auto_476853 ?auto_476866 ) ) ( not ( = ?auto_476853 ?auto_476867 ) ) ( not ( = ?auto_476854 ?auto_476855 ) ) ( not ( = ?auto_476854 ?auto_476856 ) ) ( not ( = ?auto_476854 ?auto_476857 ) ) ( not ( = ?auto_476854 ?auto_476858 ) ) ( not ( = ?auto_476854 ?auto_476859 ) ) ( not ( = ?auto_476854 ?auto_476860 ) ) ( not ( = ?auto_476854 ?auto_476861 ) ) ( not ( = ?auto_476854 ?auto_476862 ) ) ( not ( = ?auto_476854 ?auto_476863 ) ) ( not ( = ?auto_476854 ?auto_476864 ) ) ( not ( = ?auto_476854 ?auto_476865 ) ) ( not ( = ?auto_476854 ?auto_476866 ) ) ( not ( = ?auto_476854 ?auto_476867 ) ) ( not ( = ?auto_476855 ?auto_476856 ) ) ( not ( = ?auto_476855 ?auto_476857 ) ) ( not ( = ?auto_476855 ?auto_476858 ) ) ( not ( = ?auto_476855 ?auto_476859 ) ) ( not ( = ?auto_476855 ?auto_476860 ) ) ( not ( = ?auto_476855 ?auto_476861 ) ) ( not ( = ?auto_476855 ?auto_476862 ) ) ( not ( = ?auto_476855 ?auto_476863 ) ) ( not ( = ?auto_476855 ?auto_476864 ) ) ( not ( = ?auto_476855 ?auto_476865 ) ) ( not ( = ?auto_476855 ?auto_476866 ) ) ( not ( = ?auto_476855 ?auto_476867 ) ) ( not ( = ?auto_476856 ?auto_476857 ) ) ( not ( = ?auto_476856 ?auto_476858 ) ) ( not ( = ?auto_476856 ?auto_476859 ) ) ( not ( = ?auto_476856 ?auto_476860 ) ) ( not ( = ?auto_476856 ?auto_476861 ) ) ( not ( = ?auto_476856 ?auto_476862 ) ) ( not ( = ?auto_476856 ?auto_476863 ) ) ( not ( = ?auto_476856 ?auto_476864 ) ) ( not ( = ?auto_476856 ?auto_476865 ) ) ( not ( = ?auto_476856 ?auto_476866 ) ) ( not ( = ?auto_476856 ?auto_476867 ) ) ( not ( = ?auto_476857 ?auto_476858 ) ) ( not ( = ?auto_476857 ?auto_476859 ) ) ( not ( = ?auto_476857 ?auto_476860 ) ) ( not ( = ?auto_476857 ?auto_476861 ) ) ( not ( = ?auto_476857 ?auto_476862 ) ) ( not ( = ?auto_476857 ?auto_476863 ) ) ( not ( = ?auto_476857 ?auto_476864 ) ) ( not ( = ?auto_476857 ?auto_476865 ) ) ( not ( = ?auto_476857 ?auto_476866 ) ) ( not ( = ?auto_476857 ?auto_476867 ) ) ( not ( = ?auto_476858 ?auto_476859 ) ) ( not ( = ?auto_476858 ?auto_476860 ) ) ( not ( = ?auto_476858 ?auto_476861 ) ) ( not ( = ?auto_476858 ?auto_476862 ) ) ( not ( = ?auto_476858 ?auto_476863 ) ) ( not ( = ?auto_476858 ?auto_476864 ) ) ( not ( = ?auto_476858 ?auto_476865 ) ) ( not ( = ?auto_476858 ?auto_476866 ) ) ( not ( = ?auto_476858 ?auto_476867 ) ) ( not ( = ?auto_476859 ?auto_476860 ) ) ( not ( = ?auto_476859 ?auto_476861 ) ) ( not ( = ?auto_476859 ?auto_476862 ) ) ( not ( = ?auto_476859 ?auto_476863 ) ) ( not ( = ?auto_476859 ?auto_476864 ) ) ( not ( = ?auto_476859 ?auto_476865 ) ) ( not ( = ?auto_476859 ?auto_476866 ) ) ( not ( = ?auto_476859 ?auto_476867 ) ) ( not ( = ?auto_476860 ?auto_476861 ) ) ( not ( = ?auto_476860 ?auto_476862 ) ) ( not ( = ?auto_476860 ?auto_476863 ) ) ( not ( = ?auto_476860 ?auto_476864 ) ) ( not ( = ?auto_476860 ?auto_476865 ) ) ( not ( = ?auto_476860 ?auto_476866 ) ) ( not ( = ?auto_476860 ?auto_476867 ) ) ( not ( = ?auto_476861 ?auto_476862 ) ) ( not ( = ?auto_476861 ?auto_476863 ) ) ( not ( = ?auto_476861 ?auto_476864 ) ) ( not ( = ?auto_476861 ?auto_476865 ) ) ( not ( = ?auto_476861 ?auto_476866 ) ) ( not ( = ?auto_476861 ?auto_476867 ) ) ( not ( = ?auto_476862 ?auto_476863 ) ) ( not ( = ?auto_476862 ?auto_476864 ) ) ( not ( = ?auto_476862 ?auto_476865 ) ) ( not ( = ?auto_476862 ?auto_476866 ) ) ( not ( = ?auto_476862 ?auto_476867 ) ) ( not ( = ?auto_476863 ?auto_476864 ) ) ( not ( = ?auto_476863 ?auto_476865 ) ) ( not ( = ?auto_476863 ?auto_476866 ) ) ( not ( = ?auto_476863 ?auto_476867 ) ) ( not ( = ?auto_476864 ?auto_476865 ) ) ( not ( = ?auto_476864 ?auto_476866 ) ) ( not ( = ?auto_476864 ?auto_476867 ) ) ( not ( = ?auto_476865 ?auto_476866 ) ) ( not ( = ?auto_476865 ?auto_476867 ) ) ( not ( = ?auto_476866 ?auto_476867 ) ) ( ON ?auto_476866 ?auto_476867 ) ( ON ?auto_476865 ?auto_476866 ) ( ON ?auto_476864 ?auto_476865 ) ( ON ?auto_476863 ?auto_476864 ) ( ON ?auto_476862 ?auto_476863 ) ( CLEAR ?auto_476860 ) ( ON ?auto_476861 ?auto_476862 ) ( CLEAR ?auto_476861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_476852 ?auto_476853 ?auto_476854 ?auto_476855 ?auto_476856 ?auto_476857 ?auto_476858 ?auto_476859 ?auto_476860 ?auto_476861 )
      ( MAKE-16PILE ?auto_476852 ?auto_476853 ?auto_476854 ?auto_476855 ?auto_476856 ?auto_476857 ?auto_476858 ?auto_476859 ?auto_476860 ?auto_476861 ?auto_476862 ?auto_476863 ?auto_476864 ?auto_476865 ?auto_476866 ?auto_476867 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476884 - BLOCK
      ?auto_476885 - BLOCK
      ?auto_476886 - BLOCK
      ?auto_476887 - BLOCK
      ?auto_476888 - BLOCK
      ?auto_476889 - BLOCK
      ?auto_476890 - BLOCK
      ?auto_476891 - BLOCK
      ?auto_476892 - BLOCK
      ?auto_476893 - BLOCK
      ?auto_476894 - BLOCK
      ?auto_476895 - BLOCK
      ?auto_476896 - BLOCK
      ?auto_476897 - BLOCK
      ?auto_476898 - BLOCK
      ?auto_476899 - BLOCK
    )
    :vars
    (
      ?auto_476900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476899 ?auto_476900 ) ( ON-TABLE ?auto_476884 ) ( ON ?auto_476885 ?auto_476884 ) ( ON ?auto_476886 ?auto_476885 ) ( ON ?auto_476887 ?auto_476886 ) ( ON ?auto_476888 ?auto_476887 ) ( ON ?auto_476889 ?auto_476888 ) ( ON ?auto_476890 ?auto_476889 ) ( ON ?auto_476891 ?auto_476890 ) ( not ( = ?auto_476884 ?auto_476885 ) ) ( not ( = ?auto_476884 ?auto_476886 ) ) ( not ( = ?auto_476884 ?auto_476887 ) ) ( not ( = ?auto_476884 ?auto_476888 ) ) ( not ( = ?auto_476884 ?auto_476889 ) ) ( not ( = ?auto_476884 ?auto_476890 ) ) ( not ( = ?auto_476884 ?auto_476891 ) ) ( not ( = ?auto_476884 ?auto_476892 ) ) ( not ( = ?auto_476884 ?auto_476893 ) ) ( not ( = ?auto_476884 ?auto_476894 ) ) ( not ( = ?auto_476884 ?auto_476895 ) ) ( not ( = ?auto_476884 ?auto_476896 ) ) ( not ( = ?auto_476884 ?auto_476897 ) ) ( not ( = ?auto_476884 ?auto_476898 ) ) ( not ( = ?auto_476884 ?auto_476899 ) ) ( not ( = ?auto_476884 ?auto_476900 ) ) ( not ( = ?auto_476885 ?auto_476886 ) ) ( not ( = ?auto_476885 ?auto_476887 ) ) ( not ( = ?auto_476885 ?auto_476888 ) ) ( not ( = ?auto_476885 ?auto_476889 ) ) ( not ( = ?auto_476885 ?auto_476890 ) ) ( not ( = ?auto_476885 ?auto_476891 ) ) ( not ( = ?auto_476885 ?auto_476892 ) ) ( not ( = ?auto_476885 ?auto_476893 ) ) ( not ( = ?auto_476885 ?auto_476894 ) ) ( not ( = ?auto_476885 ?auto_476895 ) ) ( not ( = ?auto_476885 ?auto_476896 ) ) ( not ( = ?auto_476885 ?auto_476897 ) ) ( not ( = ?auto_476885 ?auto_476898 ) ) ( not ( = ?auto_476885 ?auto_476899 ) ) ( not ( = ?auto_476885 ?auto_476900 ) ) ( not ( = ?auto_476886 ?auto_476887 ) ) ( not ( = ?auto_476886 ?auto_476888 ) ) ( not ( = ?auto_476886 ?auto_476889 ) ) ( not ( = ?auto_476886 ?auto_476890 ) ) ( not ( = ?auto_476886 ?auto_476891 ) ) ( not ( = ?auto_476886 ?auto_476892 ) ) ( not ( = ?auto_476886 ?auto_476893 ) ) ( not ( = ?auto_476886 ?auto_476894 ) ) ( not ( = ?auto_476886 ?auto_476895 ) ) ( not ( = ?auto_476886 ?auto_476896 ) ) ( not ( = ?auto_476886 ?auto_476897 ) ) ( not ( = ?auto_476886 ?auto_476898 ) ) ( not ( = ?auto_476886 ?auto_476899 ) ) ( not ( = ?auto_476886 ?auto_476900 ) ) ( not ( = ?auto_476887 ?auto_476888 ) ) ( not ( = ?auto_476887 ?auto_476889 ) ) ( not ( = ?auto_476887 ?auto_476890 ) ) ( not ( = ?auto_476887 ?auto_476891 ) ) ( not ( = ?auto_476887 ?auto_476892 ) ) ( not ( = ?auto_476887 ?auto_476893 ) ) ( not ( = ?auto_476887 ?auto_476894 ) ) ( not ( = ?auto_476887 ?auto_476895 ) ) ( not ( = ?auto_476887 ?auto_476896 ) ) ( not ( = ?auto_476887 ?auto_476897 ) ) ( not ( = ?auto_476887 ?auto_476898 ) ) ( not ( = ?auto_476887 ?auto_476899 ) ) ( not ( = ?auto_476887 ?auto_476900 ) ) ( not ( = ?auto_476888 ?auto_476889 ) ) ( not ( = ?auto_476888 ?auto_476890 ) ) ( not ( = ?auto_476888 ?auto_476891 ) ) ( not ( = ?auto_476888 ?auto_476892 ) ) ( not ( = ?auto_476888 ?auto_476893 ) ) ( not ( = ?auto_476888 ?auto_476894 ) ) ( not ( = ?auto_476888 ?auto_476895 ) ) ( not ( = ?auto_476888 ?auto_476896 ) ) ( not ( = ?auto_476888 ?auto_476897 ) ) ( not ( = ?auto_476888 ?auto_476898 ) ) ( not ( = ?auto_476888 ?auto_476899 ) ) ( not ( = ?auto_476888 ?auto_476900 ) ) ( not ( = ?auto_476889 ?auto_476890 ) ) ( not ( = ?auto_476889 ?auto_476891 ) ) ( not ( = ?auto_476889 ?auto_476892 ) ) ( not ( = ?auto_476889 ?auto_476893 ) ) ( not ( = ?auto_476889 ?auto_476894 ) ) ( not ( = ?auto_476889 ?auto_476895 ) ) ( not ( = ?auto_476889 ?auto_476896 ) ) ( not ( = ?auto_476889 ?auto_476897 ) ) ( not ( = ?auto_476889 ?auto_476898 ) ) ( not ( = ?auto_476889 ?auto_476899 ) ) ( not ( = ?auto_476889 ?auto_476900 ) ) ( not ( = ?auto_476890 ?auto_476891 ) ) ( not ( = ?auto_476890 ?auto_476892 ) ) ( not ( = ?auto_476890 ?auto_476893 ) ) ( not ( = ?auto_476890 ?auto_476894 ) ) ( not ( = ?auto_476890 ?auto_476895 ) ) ( not ( = ?auto_476890 ?auto_476896 ) ) ( not ( = ?auto_476890 ?auto_476897 ) ) ( not ( = ?auto_476890 ?auto_476898 ) ) ( not ( = ?auto_476890 ?auto_476899 ) ) ( not ( = ?auto_476890 ?auto_476900 ) ) ( not ( = ?auto_476891 ?auto_476892 ) ) ( not ( = ?auto_476891 ?auto_476893 ) ) ( not ( = ?auto_476891 ?auto_476894 ) ) ( not ( = ?auto_476891 ?auto_476895 ) ) ( not ( = ?auto_476891 ?auto_476896 ) ) ( not ( = ?auto_476891 ?auto_476897 ) ) ( not ( = ?auto_476891 ?auto_476898 ) ) ( not ( = ?auto_476891 ?auto_476899 ) ) ( not ( = ?auto_476891 ?auto_476900 ) ) ( not ( = ?auto_476892 ?auto_476893 ) ) ( not ( = ?auto_476892 ?auto_476894 ) ) ( not ( = ?auto_476892 ?auto_476895 ) ) ( not ( = ?auto_476892 ?auto_476896 ) ) ( not ( = ?auto_476892 ?auto_476897 ) ) ( not ( = ?auto_476892 ?auto_476898 ) ) ( not ( = ?auto_476892 ?auto_476899 ) ) ( not ( = ?auto_476892 ?auto_476900 ) ) ( not ( = ?auto_476893 ?auto_476894 ) ) ( not ( = ?auto_476893 ?auto_476895 ) ) ( not ( = ?auto_476893 ?auto_476896 ) ) ( not ( = ?auto_476893 ?auto_476897 ) ) ( not ( = ?auto_476893 ?auto_476898 ) ) ( not ( = ?auto_476893 ?auto_476899 ) ) ( not ( = ?auto_476893 ?auto_476900 ) ) ( not ( = ?auto_476894 ?auto_476895 ) ) ( not ( = ?auto_476894 ?auto_476896 ) ) ( not ( = ?auto_476894 ?auto_476897 ) ) ( not ( = ?auto_476894 ?auto_476898 ) ) ( not ( = ?auto_476894 ?auto_476899 ) ) ( not ( = ?auto_476894 ?auto_476900 ) ) ( not ( = ?auto_476895 ?auto_476896 ) ) ( not ( = ?auto_476895 ?auto_476897 ) ) ( not ( = ?auto_476895 ?auto_476898 ) ) ( not ( = ?auto_476895 ?auto_476899 ) ) ( not ( = ?auto_476895 ?auto_476900 ) ) ( not ( = ?auto_476896 ?auto_476897 ) ) ( not ( = ?auto_476896 ?auto_476898 ) ) ( not ( = ?auto_476896 ?auto_476899 ) ) ( not ( = ?auto_476896 ?auto_476900 ) ) ( not ( = ?auto_476897 ?auto_476898 ) ) ( not ( = ?auto_476897 ?auto_476899 ) ) ( not ( = ?auto_476897 ?auto_476900 ) ) ( not ( = ?auto_476898 ?auto_476899 ) ) ( not ( = ?auto_476898 ?auto_476900 ) ) ( not ( = ?auto_476899 ?auto_476900 ) ) ( ON ?auto_476898 ?auto_476899 ) ( ON ?auto_476897 ?auto_476898 ) ( ON ?auto_476896 ?auto_476897 ) ( ON ?auto_476895 ?auto_476896 ) ( ON ?auto_476894 ?auto_476895 ) ( ON ?auto_476893 ?auto_476894 ) ( CLEAR ?auto_476891 ) ( ON ?auto_476892 ?auto_476893 ) ( CLEAR ?auto_476892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_476884 ?auto_476885 ?auto_476886 ?auto_476887 ?auto_476888 ?auto_476889 ?auto_476890 ?auto_476891 ?auto_476892 )
      ( MAKE-16PILE ?auto_476884 ?auto_476885 ?auto_476886 ?auto_476887 ?auto_476888 ?auto_476889 ?auto_476890 ?auto_476891 ?auto_476892 ?auto_476893 ?auto_476894 ?auto_476895 ?auto_476896 ?auto_476897 ?auto_476898 ?auto_476899 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476917 - BLOCK
      ?auto_476918 - BLOCK
      ?auto_476919 - BLOCK
      ?auto_476920 - BLOCK
      ?auto_476921 - BLOCK
      ?auto_476922 - BLOCK
      ?auto_476923 - BLOCK
      ?auto_476924 - BLOCK
      ?auto_476925 - BLOCK
      ?auto_476926 - BLOCK
      ?auto_476927 - BLOCK
      ?auto_476928 - BLOCK
      ?auto_476929 - BLOCK
      ?auto_476930 - BLOCK
      ?auto_476931 - BLOCK
      ?auto_476932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476932 ) ( ON-TABLE ?auto_476917 ) ( ON ?auto_476918 ?auto_476917 ) ( ON ?auto_476919 ?auto_476918 ) ( ON ?auto_476920 ?auto_476919 ) ( ON ?auto_476921 ?auto_476920 ) ( ON ?auto_476922 ?auto_476921 ) ( ON ?auto_476923 ?auto_476922 ) ( ON ?auto_476924 ?auto_476923 ) ( not ( = ?auto_476917 ?auto_476918 ) ) ( not ( = ?auto_476917 ?auto_476919 ) ) ( not ( = ?auto_476917 ?auto_476920 ) ) ( not ( = ?auto_476917 ?auto_476921 ) ) ( not ( = ?auto_476917 ?auto_476922 ) ) ( not ( = ?auto_476917 ?auto_476923 ) ) ( not ( = ?auto_476917 ?auto_476924 ) ) ( not ( = ?auto_476917 ?auto_476925 ) ) ( not ( = ?auto_476917 ?auto_476926 ) ) ( not ( = ?auto_476917 ?auto_476927 ) ) ( not ( = ?auto_476917 ?auto_476928 ) ) ( not ( = ?auto_476917 ?auto_476929 ) ) ( not ( = ?auto_476917 ?auto_476930 ) ) ( not ( = ?auto_476917 ?auto_476931 ) ) ( not ( = ?auto_476917 ?auto_476932 ) ) ( not ( = ?auto_476918 ?auto_476919 ) ) ( not ( = ?auto_476918 ?auto_476920 ) ) ( not ( = ?auto_476918 ?auto_476921 ) ) ( not ( = ?auto_476918 ?auto_476922 ) ) ( not ( = ?auto_476918 ?auto_476923 ) ) ( not ( = ?auto_476918 ?auto_476924 ) ) ( not ( = ?auto_476918 ?auto_476925 ) ) ( not ( = ?auto_476918 ?auto_476926 ) ) ( not ( = ?auto_476918 ?auto_476927 ) ) ( not ( = ?auto_476918 ?auto_476928 ) ) ( not ( = ?auto_476918 ?auto_476929 ) ) ( not ( = ?auto_476918 ?auto_476930 ) ) ( not ( = ?auto_476918 ?auto_476931 ) ) ( not ( = ?auto_476918 ?auto_476932 ) ) ( not ( = ?auto_476919 ?auto_476920 ) ) ( not ( = ?auto_476919 ?auto_476921 ) ) ( not ( = ?auto_476919 ?auto_476922 ) ) ( not ( = ?auto_476919 ?auto_476923 ) ) ( not ( = ?auto_476919 ?auto_476924 ) ) ( not ( = ?auto_476919 ?auto_476925 ) ) ( not ( = ?auto_476919 ?auto_476926 ) ) ( not ( = ?auto_476919 ?auto_476927 ) ) ( not ( = ?auto_476919 ?auto_476928 ) ) ( not ( = ?auto_476919 ?auto_476929 ) ) ( not ( = ?auto_476919 ?auto_476930 ) ) ( not ( = ?auto_476919 ?auto_476931 ) ) ( not ( = ?auto_476919 ?auto_476932 ) ) ( not ( = ?auto_476920 ?auto_476921 ) ) ( not ( = ?auto_476920 ?auto_476922 ) ) ( not ( = ?auto_476920 ?auto_476923 ) ) ( not ( = ?auto_476920 ?auto_476924 ) ) ( not ( = ?auto_476920 ?auto_476925 ) ) ( not ( = ?auto_476920 ?auto_476926 ) ) ( not ( = ?auto_476920 ?auto_476927 ) ) ( not ( = ?auto_476920 ?auto_476928 ) ) ( not ( = ?auto_476920 ?auto_476929 ) ) ( not ( = ?auto_476920 ?auto_476930 ) ) ( not ( = ?auto_476920 ?auto_476931 ) ) ( not ( = ?auto_476920 ?auto_476932 ) ) ( not ( = ?auto_476921 ?auto_476922 ) ) ( not ( = ?auto_476921 ?auto_476923 ) ) ( not ( = ?auto_476921 ?auto_476924 ) ) ( not ( = ?auto_476921 ?auto_476925 ) ) ( not ( = ?auto_476921 ?auto_476926 ) ) ( not ( = ?auto_476921 ?auto_476927 ) ) ( not ( = ?auto_476921 ?auto_476928 ) ) ( not ( = ?auto_476921 ?auto_476929 ) ) ( not ( = ?auto_476921 ?auto_476930 ) ) ( not ( = ?auto_476921 ?auto_476931 ) ) ( not ( = ?auto_476921 ?auto_476932 ) ) ( not ( = ?auto_476922 ?auto_476923 ) ) ( not ( = ?auto_476922 ?auto_476924 ) ) ( not ( = ?auto_476922 ?auto_476925 ) ) ( not ( = ?auto_476922 ?auto_476926 ) ) ( not ( = ?auto_476922 ?auto_476927 ) ) ( not ( = ?auto_476922 ?auto_476928 ) ) ( not ( = ?auto_476922 ?auto_476929 ) ) ( not ( = ?auto_476922 ?auto_476930 ) ) ( not ( = ?auto_476922 ?auto_476931 ) ) ( not ( = ?auto_476922 ?auto_476932 ) ) ( not ( = ?auto_476923 ?auto_476924 ) ) ( not ( = ?auto_476923 ?auto_476925 ) ) ( not ( = ?auto_476923 ?auto_476926 ) ) ( not ( = ?auto_476923 ?auto_476927 ) ) ( not ( = ?auto_476923 ?auto_476928 ) ) ( not ( = ?auto_476923 ?auto_476929 ) ) ( not ( = ?auto_476923 ?auto_476930 ) ) ( not ( = ?auto_476923 ?auto_476931 ) ) ( not ( = ?auto_476923 ?auto_476932 ) ) ( not ( = ?auto_476924 ?auto_476925 ) ) ( not ( = ?auto_476924 ?auto_476926 ) ) ( not ( = ?auto_476924 ?auto_476927 ) ) ( not ( = ?auto_476924 ?auto_476928 ) ) ( not ( = ?auto_476924 ?auto_476929 ) ) ( not ( = ?auto_476924 ?auto_476930 ) ) ( not ( = ?auto_476924 ?auto_476931 ) ) ( not ( = ?auto_476924 ?auto_476932 ) ) ( not ( = ?auto_476925 ?auto_476926 ) ) ( not ( = ?auto_476925 ?auto_476927 ) ) ( not ( = ?auto_476925 ?auto_476928 ) ) ( not ( = ?auto_476925 ?auto_476929 ) ) ( not ( = ?auto_476925 ?auto_476930 ) ) ( not ( = ?auto_476925 ?auto_476931 ) ) ( not ( = ?auto_476925 ?auto_476932 ) ) ( not ( = ?auto_476926 ?auto_476927 ) ) ( not ( = ?auto_476926 ?auto_476928 ) ) ( not ( = ?auto_476926 ?auto_476929 ) ) ( not ( = ?auto_476926 ?auto_476930 ) ) ( not ( = ?auto_476926 ?auto_476931 ) ) ( not ( = ?auto_476926 ?auto_476932 ) ) ( not ( = ?auto_476927 ?auto_476928 ) ) ( not ( = ?auto_476927 ?auto_476929 ) ) ( not ( = ?auto_476927 ?auto_476930 ) ) ( not ( = ?auto_476927 ?auto_476931 ) ) ( not ( = ?auto_476927 ?auto_476932 ) ) ( not ( = ?auto_476928 ?auto_476929 ) ) ( not ( = ?auto_476928 ?auto_476930 ) ) ( not ( = ?auto_476928 ?auto_476931 ) ) ( not ( = ?auto_476928 ?auto_476932 ) ) ( not ( = ?auto_476929 ?auto_476930 ) ) ( not ( = ?auto_476929 ?auto_476931 ) ) ( not ( = ?auto_476929 ?auto_476932 ) ) ( not ( = ?auto_476930 ?auto_476931 ) ) ( not ( = ?auto_476930 ?auto_476932 ) ) ( not ( = ?auto_476931 ?auto_476932 ) ) ( ON ?auto_476931 ?auto_476932 ) ( ON ?auto_476930 ?auto_476931 ) ( ON ?auto_476929 ?auto_476930 ) ( ON ?auto_476928 ?auto_476929 ) ( ON ?auto_476927 ?auto_476928 ) ( ON ?auto_476926 ?auto_476927 ) ( CLEAR ?auto_476924 ) ( ON ?auto_476925 ?auto_476926 ) ( CLEAR ?auto_476925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_476917 ?auto_476918 ?auto_476919 ?auto_476920 ?auto_476921 ?auto_476922 ?auto_476923 ?auto_476924 ?auto_476925 )
      ( MAKE-16PILE ?auto_476917 ?auto_476918 ?auto_476919 ?auto_476920 ?auto_476921 ?auto_476922 ?auto_476923 ?auto_476924 ?auto_476925 ?auto_476926 ?auto_476927 ?auto_476928 ?auto_476929 ?auto_476930 ?auto_476931 ?auto_476932 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476949 - BLOCK
      ?auto_476950 - BLOCK
      ?auto_476951 - BLOCK
      ?auto_476952 - BLOCK
      ?auto_476953 - BLOCK
      ?auto_476954 - BLOCK
      ?auto_476955 - BLOCK
      ?auto_476956 - BLOCK
      ?auto_476957 - BLOCK
      ?auto_476958 - BLOCK
      ?auto_476959 - BLOCK
      ?auto_476960 - BLOCK
      ?auto_476961 - BLOCK
      ?auto_476962 - BLOCK
      ?auto_476963 - BLOCK
      ?auto_476964 - BLOCK
    )
    :vars
    (
      ?auto_476965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_476964 ?auto_476965 ) ( ON-TABLE ?auto_476949 ) ( ON ?auto_476950 ?auto_476949 ) ( ON ?auto_476951 ?auto_476950 ) ( ON ?auto_476952 ?auto_476951 ) ( ON ?auto_476953 ?auto_476952 ) ( ON ?auto_476954 ?auto_476953 ) ( ON ?auto_476955 ?auto_476954 ) ( not ( = ?auto_476949 ?auto_476950 ) ) ( not ( = ?auto_476949 ?auto_476951 ) ) ( not ( = ?auto_476949 ?auto_476952 ) ) ( not ( = ?auto_476949 ?auto_476953 ) ) ( not ( = ?auto_476949 ?auto_476954 ) ) ( not ( = ?auto_476949 ?auto_476955 ) ) ( not ( = ?auto_476949 ?auto_476956 ) ) ( not ( = ?auto_476949 ?auto_476957 ) ) ( not ( = ?auto_476949 ?auto_476958 ) ) ( not ( = ?auto_476949 ?auto_476959 ) ) ( not ( = ?auto_476949 ?auto_476960 ) ) ( not ( = ?auto_476949 ?auto_476961 ) ) ( not ( = ?auto_476949 ?auto_476962 ) ) ( not ( = ?auto_476949 ?auto_476963 ) ) ( not ( = ?auto_476949 ?auto_476964 ) ) ( not ( = ?auto_476949 ?auto_476965 ) ) ( not ( = ?auto_476950 ?auto_476951 ) ) ( not ( = ?auto_476950 ?auto_476952 ) ) ( not ( = ?auto_476950 ?auto_476953 ) ) ( not ( = ?auto_476950 ?auto_476954 ) ) ( not ( = ?auto_476950 ?auto_476955 ) ) ( not ( = ?auto_476950 ?auto_476956 ) ) ( not ( = ?auto_476950 ?auto_476957 ) ) ( not ( = ?auto_476950 ?auto_476958 ) ) ( not ( = ?auto_476950 ?auto_476959 ) ) ( not ( = ?auto_476950 ?auto_476960 ) ) ( not ( = ?auto_476950 ?auto_476961 ) ) ( not ( = ?auto_476950 ?auto_476962 ) ) ( not ( = ?auto_476950 ?auto_476963 ) ) ( not ( = ?auto_476950 ?auto_476964 ) ) ( not ( = ?auto_476950 ?auto_476965 ) ) ( not ( = ?auto_476951 ?auto_476952 ) ) ( not ( = ?auto_476951 ?auto_476953 ) ) ( not ( = ?auto_476951 ?auto_476954 ) ) ( not ( = ?auto_476951 ?auto_476955 ) ) ( not ( = ?auto_476951 ?auto_476956 ) ) ( not ( = ?auto_476951 ?auto_476957 ) ) ( not ( = ?auto_476951 ?auto_476958 ) ) ( not ( = ?auto_476951 ?auto_476959 ) ) ( not ( = ?auto_476951 ?auto_476960 ) ) ( not ( = ?auto_476951 ?auto_476961 ) ) ( not ( = ?auto_476951 ?auto_476962 ) ) ( not ( = ?auto_476951 ?auto_476963 ) ) ( not ( = ?auto_476951 ?auto_476964 ) ) ( not ( = ?auto_476951 ?auto_476965 ) ) ( not ( = ?auto_476952 ?auto_476953 ) ) ( not ( = ?auto_476952 ?auto_476954 ) ) ( not ( = ?auto_476952 ?auto_476955 ) ) ( not ( = ?auto_476952 ?auto_476956 ) ) ( not ( = ?auto_476952 ?auto_476957 ) ) ( not ( = ?auto_476952 ?auto_476958 ) ) ( not ( = ?auto_476952 ?auto_476959 ) ) ( not ( = ?auto_476952 ?auto_476960 ) ) ( not ( = ?auto_476952 ?auto_476961 ) ) ( not ( = ?auto_476952 ?auto_476962 ) ) ( not ( = ?auto_476952 ?auto_476963 ) ) ( not ( = ?auto_476952 ?auto_476964 ) ) ( not ( = ?auto_476952 ?auto_476965 ) ) ( not ( = ?auto_476953 ?auto_476954 ) ) ( not ( = ?auto_476953 ?auto_476955 ) ) ( not ( = ?auto_476953 ?auto_476956 ) ) ( not ( = ?auto_476953 ?auto_476957 ) ) ( not ( = ?auto_476953 ?auto_476958 ) ) ( not ( = ?auto_476953 ?auto_476959 ) ) ( not ( = ?auto_476953 ?auto_476960 ) ) ( not ( = ?auto_476953 ?auto_476961 ) ) ( not ( = ?auto_476953 ?auto_476962 ) ) ( not ( = ?auto_476953 ?auto_476963 ) ) ( not ( = ?auto_476953 ?auto_476964 ) ) ( not ( = ?auto_476953 ?auto_476965 ) ) ( not ( = ?auto_476954 ?auto_476955 ) ) ( not ( = ?auto_476954 ?auto_476956 ) ) ( not ( = ?auto_476954 ?auto_476957 ) ) ( not ( = ?auto_476954 ?auto_476958 ) ) ( not ( = ?auto_476954 ?auto_476959 ) ) ( not ( = ?auto_476954 ?auto_476960 ) ) ( not ( = ?auto_476954 ?auto_476961 ) ) ( not ( = ?auto_476954 ?auto_476962 ) ) ( not ( = ?auto_476954 ?auto_476963 ) ) ( not ( = ?auto_476954 ?auto_476964 ) ) ( not ( = ?auto_476954 ?auto_476965 ) ) ( not ( = ?auto_476955 ?auto_476956 ) ) ( not ( = ?auto_476955 ?auto_476957 ) ) ( not ( = ?auto_476955 ?auto_476958 ) ) ( not ( = ?auto_476955 ?auto_476959 ) ) ( not ( = ?auto_476955 ?auto_476960 ) ) ( not ( = ?auto_476955 ?auto_476961 ) ) ( not ( = ?auto_476955 ?auto_476962 ) ) ( not ( = ?auto_476955 ?auto_476963 ) ) ( not ( = ?auto_476955 ?auto_476964 ) ) ( not ( = ?auto_476955 ?auto_476965 ) ) ( not ( = ?auto_476956 ?auto_476957 ) ) ( not ( = ?auto_476956 ?auto_476958 ) ) ( not ( = ?auto_476956 ?auto_476959 ) ) ( not ( = ?auto_476956 ?auto_476960 ) ) ( not ( = ?auto_476956 ?auto_476961 ) ) ( not ( = ?auto_476956 ?auto_476962 ) ) ( not ( = ?auto_476956 ?auto_476963 ) ) ( not ( = ?auto_476956 ?auto_476964 ) ) ( not ( = ?auto_476956 ?auto_476965 ) ) ( not ( = ?auto_476957 ?auto_476958 ) ) ( not ( = ?auto_476957 ?auto_476959 ) ) ( not ( = ?auto_476957 ?auto_476960 ) ) ( not ( = ?auto_476957 ?auto_476961 ) ) ( not ( = ?auto_476957 ?auto_476962 ) ) ( not ( = ?auto_476957 ?auto_476963 ) ) ( not ( = ?auto_476957 ?auto_476964 ) ) ( not ( = ?auto_476957 ?auto_476965 ) ) ( not ( = ?auto_476958 ?auto_476959 ) ) ( not ( = ?auto_476958 ?auto_476960 ) ) ( not ( = ?auto_476958 ?auto_476961 ) ) ( not ( = ?auto_476958 ?auto_476962 ) ) ( not ( = ?auto_476958 ?auto_476963 ) ) ( not ( = ?auto_476958 ?auto_476964 ) ) ( not ( = ?auto_476958 ?auto_476965 ) ) ( not ( = ?auto_476959 ?auto_476960 ) ) ( not ( = ?auto_476959 ?auto_476961 ) ) ( not ( = ?auto_476959 ?auto_476962 ) ) ( not ( = ?auto_476959 ?auto_476963 ) ) ( not ( = ?auto_476959 ?auto_476964 ) ) ( not ( = ?auto_476959 ?auto_476965 ) ) ( not ( = ?auto_476960 ?auto_476961 ) ) ( not ( = ?auto_476960 ?auto_476962 ) ) ( not ( = ?auto_476960 ?auto_476963 ) ) ( not ( = ?auto_476960 ?auto_476964 ) ) ( not ( = ?auto_476960 ?auto_476965 ) ) ( not ( = ?auto_476961 ?auto_476962 ) ) ( not ( = ?auto_476961 ?auto_476963 ) ) ( not ( = ?auto_476961 ?auto_476964 ) ) ( not ( = ?auto_476961 ?auto_476965 ) ) ( not ( = ?auto_476962 ?auto_476963 ) ) ( not ( = ?auto_476962 ?auto_476964 ) ) ( not ( = ?auto_476962 ?auto_476965 ) ) ( not ( = ?auto_476963 ?auto_476964 ) ) ( not ( = ?auto_476963 ?auto_476965 ) ) ( not ( = ?auto_476964 ?auto_476965 ) ) ( ON ?auto_476963 ?auto_476964 ) ( ON ?auto_476962 ?auto_476963 ) ( ON ?auto_476961 ?auto_476962 ) ( ON ?auto_476960 ?auto_476961 ) ( ON ?auto_476959 ?auto_476960 ) ( ON ?auto_476958 ?auto_476959 ) ( ON ?auto_476957 ?auto_476958 ) ( CLEAR ?auto_476955 ) ( ON ?auto_476956 ?auto_476957 ) ( CLEAR ?auto_476956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_476949 ?auto_476950 ?auto_476951 ?auto_476952 ?auto_476953 ?auto_476954 ?auto_476955 ?auto_476956 )
      ( MAKE-16PILE ?auto_476949 ?auto_476950 ?auto_476951 ?auto_476952 ?auto_476953 ?auto_476954 ?auto_476955 ?auto_476956 ?auto_476957 ?auto_476958 ?auto_476959 ?auto_476960 ?auto_476961 ?auto_476962 ?auto_476963 ?auto_476964 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_476982 - BLOCK
      ?auto_476983 - BLOCK
      ?auto_476984 - BLOCK
      ?auto_476985 - BLOCK
      ?auto_476986 - BLOCK
      ?auto_476987 - BLOCK
      ?auto_476988 - BLOCK
      ?auto_476989 - BLOCK
      ?auto_476990 - BLOCK
      ?auto_476991 - BLOCK
      ?auto_476992 - BLOCK
      ?auto_476993 - BLOCK
      ?auto_476994 - BLOCK
      ?auto_476995 - BLOCK
      ?auto_476996 - BLOCK
      ?auto_476997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_476997 ) ( ON-TABLE ?auto_476982 ) ( ON ?auto_476983 ?auto_476982 ) ( ON ?auto_476984 ?auto_476983 ) ( ON ?auto_476985 ?auto_476984 ) ( ON ?auto_476986 ?auto_476985 ) ( ON ?auto_476987 ?auto_476986 ) ( ON ?auto_476988 ?auto_476987 ) ( not ( = ?auto_476982 ?auto_476983 ) ) ( not ( = ?auto_476982 ?auto_476984 ) ) ( not ( = ?auto_476982 ?auto_476985 ) ) ( not ( = ?auto_476982 ?auto_476986 ) ) ( not ( = ?auto_476982 ?auto_476987 ) ) ( not ( = ?auto_476982 ?auto_476988 ) ) ( not ( = ?auto_476982 ?auto_476989 ) ) ( not ( = ?auto_476982 ?auto_476990 ) ) ( not ( = ?auto_476982 ?auto_476991 ) ) ( not ( = ?auto_476982 ?auto_476992 ) ) ( not ( = ?auto_476982 ?auto_476993 ) ) ( not ( = ?auto_476982 ?auto_476994 ) ) ( not ( = ?auto_476982 ?auto_476995 ) ) ( not ( = ?auto_476982 ?auto_476996 ) ) ( not ( = ?auto_476982 ?auto_476997 ) ) ( not ( = ?auto_476983 ?auto_476984 ) ) ( not ( = ?auto_476983 ?auto_476985 ) ) ( not ( = ?auto_476983 ?auto_476986 ) ) ( not ( = ?auto_476983 ?auto_476987 ) ) ( not ( = ?auto_476983 ?auto_476988 ) ) ( not ( = ?auto_476983 ?auto_476989 ) ) ( not ( = ?auto_476983 ?auto_476990 ) ) ( not ( = ?auto_476983 ?auto_476991 ) ) ( not ( = ?auto_476983 ?auto_476992 ) ) ( not ( = ?auto_476983 ?auto_476993 ) ) ( not ( = ?auto_476983 ?auto_476994 ) ) ( not ( = ?auto_476983 ?auto_476995 ) ) ( not ( = ?auto_476983 ?auto_476996 ) ) ( not ( = ?auto_476983 ?auto_476997 ) ) ( not ( = ?auto_476984 ?auto_476985 ) ) ( not ( = ?auto_476984 ?auto_476986 ) ) ( not ( = ?auto_476984 ?auto_476987 ) ) ( not ( = ?auto_476984 ?auto_476988 ) ) ( not ( = ?auto_476984 ?auto_476989 ) ) ( not ( = ?auto_476984 ?auto_476990 ) ) ( not ( = ?auto_476984 ?auto_476991 ) ) ( not ( = ?auto_476984 ?auto_476992 ) ) ( not ( = ?auto_476984 ?auto_476993 ) ) ( not ( = ?auto_476984 ?auto_476994 ) ) ( not ( = ?auto_476984 ?auto_476995 ) ) ( not ( = ?auto_476984 ?auto_476996 ) ) ( not ( = ?auto_476984 ?auto_476997 ) ) ( not ( = ?auto_476985 ?auto_476986 ) ) ( not ( = ?auto_476985 ?auto_476987 ) ) ( not ( = ?auto_476985 ?auto_476988 ) ) ( not ( = ?auto_476985 ?auto_476989 ) ) ( not ( = ?auto_476985 ?auto_476990 ) ) ( not ( = ?auto_476985 ?auto_476991 ) ) ( not ( = ?auto_476985 ?auto_476992 ) ) ( not ( = ?auto_476985 ?auto_476993 ) ) ( not ( = ?auto_476985 ?auto_476994 ) ) ( not ( = ?auto_476985 ?auto_476995 ) ) ( not ( = ?auto_476985 ?auto_476996 ) ) ( not ( = ?auto_476985 ?auto_476997 ) ) ( not ( = ?auto_476986 ?auto_476987 ) ) ( not ( = ?auto_476986 ?auto_476988 ) ) ( not ( = ?auto_476986 ?auto_476989 ) ) ( not ( = ?auto_476986 ?auto_476990 ) ) ( not ( = ?auto_476986 ?auto_476991 ) ) ( not ( = ?auto_476986 ?auto_476992 ) ) ( not ( = ?auto_476986 ?auto_476993 ) ) ( not ( = ?auto_476986 ?auto_476994 ) ) ( not ( = ?auto_476986 ?auto_476995 ) ) ( not ( = ?auto_476986 ?auto_476996 ) ) ( not ( = ?auto_476986 ?auto_476997 ) ) ( not ( = ?auto_476987 ?auto_476988 ) ) ( not ( = ?auto_476987 ?auto_476989 ) ) ( not ( = ?auto_476987 ?auto_476990 ) ) ( not ( = ?auto_476987 ?auto_476991 ) ) ( not ( = ?auto_476987 ?auto_476992 ) ) ( not ( = ?auto_476987 ?auto_476993 ) ) ( not ( = ?auto_476987 ?auto_476994 ) ) ( not ( = ?auto_476987 ?auto_476995 ) ) ( not ( = ?auto_476987 ?auto_476996 ) ) ( not ( = ?auto_476987 ?auto_476997 ) ) ( not ( = ?auto_476988 ?auto_476989 ) ) ( not ( = ?auto_476988 ?auto_476990 ) ) ( not ( = ?auto_476988 ?auto_476991 ) ) ( not ( = ?auto_476988 ?auto_476992 ) ) ( not ( = ?auto_476988 ?auto_476993 ) ) ( not ( = ?auto_476988 ?auto_476994 ) ) ( not ( = ?auto_476988 ?auto_476995 ) ) ( not ( = ?auto_476988 ?auto_476996 ) ) ( not ( = ?auto_476988 ?auto_476997 ) ) ( not ( = ?auto_476989 ?auto_476990 ) ) ( not ( = ?auto_476989 ?auto_476991 ) ) ( not ( = ?auto_476989 ?auto_476992 ) ) ( not ( = ?auto_476989 ?auto_476993 ) ) ( not ( = ?auto_476989 ?auto_476994 ) ) ( not ( = ?auto_476989 ?auto_476995 ) ) ( not ( = ?auto_476989 ?auto_476996 ) ) ( not ( = ?auto_476989 ?auto_476997 ) ) ( not ( = ?auto_476990 ?auto_476991 ) ) ( not ( = ?auto_476990 ?auto_476992 ) ) ( not ( = ?auto_476990 ?auto_476993 ) ) ( not ( = ?auto_476990 ?auto_476994 ) ) ( not ( = ?auto_476990 ?auto_476995 ) ) ( not ( = ?auto_476990 ?auto_476996 ) ) ( not ( = ?auto_476990 ?auto_476997 ) ) ( not ( = ?auto_476991 ?auto_476992 ) ) ( not ( = ?auto_476991 ?auto_476993 ) ) ( not ( = ?auto_476991 ?auto_476994 ) ) ( not ( = ?auto_476991 ?auto_476995 ) ) ( not ( = ?auto_476991 ?auto_476996 ) ) ( not ( = ?auto_476991 ?auto_476997 ) ) ( not ( = ?auto_476992 ?auto_476993 ) ) ( not ( = ?auto_476992 ?auto_476994 ) ) ( not ( = ?auto_476992 ?auto_476995 ) ) ( not ( = ?auto_476992 ?auto_476996 ) ) ( not ( = ?auto_476992 ?auto_476997 ) ) ( not ( = ?auto_476993 ?auto_476994 ) ) ( not ( = ?auto_476993 ?auto_476995 ) ) ( not ( = ?auto_476993 ?auto_476996 ) ) ( not ( = ?auto_476993 ?auto_476997 ) ) ( not ( = ?auto_476994 ?auto_476995 ) ) ( not ( = ?auto_476994 ?auto_476996 ) ) ( not ( = ?auto_476994 ?auto_476997 ) ) ( not ( = ?auto_476995 ?auto_476996 ) ) ( not ( = ?auto_476995 ?auto_476997 ) ) ( not ( = ?auto_476996 ?auto_476997 ) ) ( ON ?auto_476996 ?auto_476997 ) ( ON ?auto_476995 ?auto_476996 ) ( ON ?auto_476994 ?auto_476995 ) ( ON ?auto_476993 ?auto_476994 ) ( ON ?auto_476992 ?auto_476993 ) ( ON ?auto_476991 ?auto_476992 ) ( ON ?auto_476990 ?auto_476991 ) ( CLEAR ?auto_476988 ) ( ON ?auto_476989 ?auto_476990 ) ( CLEAR ?auto_476989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_476982 ?auto_476983 ?auto_476984 ?auto_476985 ?auto_476986 ?auto_476987 ?auto_476988 ?auto_476989 )
      ( MAKE-16PILE ?auto_476982 ?auto_476983 ?auto_476984 ?auto_476985 ?auto_476986 ?auto_476987 ?auto_476988 ?auto_476989 ?auto_476990 ?auto_476991 ?auto_476992 ?auto_476993 ?auto_476994 ?auto_476995 ?auto_476996 ?auto_476997 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477014 - BLOCK
      ?auto_477015 - BLOCK
      ?auto_477016 - BLOCK
      ?auto_477017 - BLOCK
      ?auto_477018 - BLOCK
      ?auto_477019 - BLOCK
      ?auto_477020 - BLOCK
      ?auto_477021 - BLOCK
      ?auto_477022 - BLOCK
      ?auto_477023 - BLOCK
      ?auto_477024 - BLOCK
      ?auto_477025 - BLOCK
      ?auto_477026 - BLOCK
      ?auto_477027 - BLOCK
      ?auto_477028 - BLOCK
      ?auto_477029 - BLOCK
    )
    :vars
    (
      ?auto_477030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477029 ?auto_477030 ) ( ON-TABLE ?auto_477014 ) ( ON ?auto_477015 ?auto_477014 ) ( ON ?auto_477016 ?auto_477015 ) ( ON ?auto_477017 ?auto_477016 ) ( ON ?auto_477018 ?auto_477017 ) ( ON ?auto_477019 ?auto_477018 ) ( not ( = ?auto_477014 ?auto_477015 ) ) ( not ( = ?auto_477014 ?auto_477016 ) ) ( not ( = ?auto_477014 ?auto_477017 ) ) ( not ( = ?auto_477014 ?auto_477018 ) ) ( not ( = ?auto_477014 ?auto_477019 ) ) ( not ( = ?auto_477014 ?auto_477020 ) ) ( not ( = ?auto_477014 ?auto_477021 ) ) ( not ( = ?auto_477014 ?auto_477022 ) ) ( not ( = ?auto_477014 ?auto_477023 ) ) ( not ( = ?auto_477014 ?auto_477024 ) ) ( not ( = ?auto_477014 ?auto_477025 ) ) ( not ( = ?auto_477014 ?auto_477026 ) ) ( not ( = ?auto_477014 ?auto_477027 ) ) ( not ( = ?auto_477014 ?auto_477028 ) ) ( not ( = ?auto_477014 ?auto_477029 ) ) ( not ( = ?auto_477014 ?auto_477030 ) ) ( not ( = ?auto_477015 ?auto_477016 ) ) ( not ( = ?auto_477015 ?auto_477017 ) ) ( not ( = ?auto_477015 ?auto_477018 ) ) ( not ( = ?auto_477015 ?auto_477019 ) ) ( not ( = ?auto_477015 ?auto_477020 ) ) ( not ( = ?auto_477015 ?auto_477021 ) ) ( not ( = ?auto_477015 ?auto_477022 ) ) ( not ( = ?auto_477015 ?auto_477023 ) ) ( not ( = ?auto_477015 ?auto_477024 ) ) ( not ( = ?auto_477015 ?auto_477025 ) ) ( not ( = ?auto_477015 ?auto_477026 ) ) ( not ( = ?auto_477015 ?auto_477027 ) ) ( not ( = ?auto_477015 ?auto_477028 ) ) ( not ( = ?auto_477015 ?auto_477029 ) ) ( not ( = ?auto_477015 ?auto_477030 ) ) ( not ( = ?auto_477016 ?auto_477017 ) ) ( not ( = ?auto_477016 ?auto_477018 ) ) ( not ( = ?auto_477016 ?auto_477019 ) ) ( not ( = ?auto_477016 ?auto_477020 ) ) ( not ( = ?auto_477016 ?auto_477021 ) ) ( not ( = ?auto_477016 ?auto_477022 ) ) ( not ( = ?auto_477016 ?auto_477023 ) ) ( not ( = ?auto_477016 ?auto_477024 ) ) ( not ( = ?auto_477016 ?auto_477025 ) ) ( not ( = ?auto_477016 ?auto_477026 ) ) ( not ( = ?auto_477016 ?auto_477027 ) ) ( not ( = ?auto_477016 ?auto_477028 ) ) ( not ( = ?auto_477016 ?auto_477029 ) ) ( not ( = ?auto_477016 ?auto_477030 ) ) ( not ( = ?auto_477017 ?auto_477018 ) ) ( not ( = ?auto_477017 ?auto_477019 ) ) ( not ( = ?auto_477017 ?auto_477020 ) ) ( not ( = ?auto_477017 ?auto_477021 ) ) ( not ( = ?auto_477017 ?auto_477022 ) ) ( not ( = ?auto_477017 ?auto_477023 ) ) ( not ( = ?auto_477017 ?auto_477024 ) ) ( not ( = ?auto_477017 ?auto_477025 ) ) ( not ( = ?auto_477017 ?auto_477026 ) ) ( not ( = ?auto_477017 ?auto_477027 ) ) ( not ( = ?auto_477017 ?auto_477028 ) ) ( not ( = ?auto_477017 ?auto_477029 ) ) ( not ( = ?auto_477017 ?auto_477030 ) ) ( not ( = ?auto_477018 ?auto_477019 ) ) ( not ( = ?auto_477018 ?auto_477020 ) ) ( not ( = ?auto_477018 ?auto_477021 ) ) ( not ( = ?auto_477018 ?auto_477022 ) ) ( not ( = ?auto_477018 ?auto_477023 ) ) ( not ( = ?auto_477018 ?auto_477024 ) ) ( not ( = ?auto_477018 ?auto_477025 ) ) ( not ( = ?auto_477018 ?auto_477026 ) ) ( not ( = ?auto_477018 ?auto_477027 ) ) ( not ( = ?auto_477018 ?auto_477028 ) ) ( not ( = ?auto_477018 ?auto_477029 ) ) ( not ( = ?auto_477018 ?auto_477030 ) ) ( not ( = ?auto_477019 ?auto_477020 ) ) ( not ( = ?auto_477019 ?auto_477021 ) ) ( not ( = ?auto_477019 ?auto_477022 ) ) ( not ( = ?auto_477019 ?auto_477023 ) ) ( not ( = ?auto_477019 ?auto_477024 ) ) ( not ( = ?auto_477019 ?auto_477025 ) ) ( not ( = ?auto_477019 ?auto_477026 ) ) ( not ( = ?auto_477019 ?auto_477027 ) ) ( not ( = ?auto_477019 ?auto_477028 ) ) ( not ( = ?auto_477019 ?auto_477029 ) ) ( not ( = ?auto_477019 ?auto_477030 ) ) ( not ( = ?auto_477020 ?auto_477021 ) ) ( not ( = ?auto_477020 ?auto_477022 ) ) ( not ( = ?auto_477020 ?auto_477023 ) ) ( not ( = ?auto_477020 ?auto_477024 ) ) ( not ( = ?auto_477020 ?auto_477025 ) ) ( not ( = ?auto_477020 ?auto_477026 ) ) ( not ( = ?auto_477020 ?auto_477027 ) ) ( not ( = ?auto_477020 ?auto_477028 ) ) ( not ( = ?auto_477020 ?auto_477029 ) ) ( not ( = ?auto_477020 ?auto_477030 ) ) ( not ( = ?auto_477021 ?auto_477022 ) ) ( not ( = ?auto_477021 ?auto_477023 ) ) ( not ( = ?auto_477021 ?auto_477024 ) ) ( not ( = ?auto_477021 ?auto_477025 ) ) ( not ( = ?auto_477021 ?auto_477026 ) ) ( not ( = ?auto_477021 ?auto_477027 ) ) ( not ( = ?auto_477021 ?auto_477028 ) ) ( not ( = ?auto_477021 ?auto_477029 ) ) ( not ( = ?auto_477021 ?auto_477030 ) ) ( not ( = ?auto_477022 ?auto_477023 ) ) ( not ( = ?auto_477022 ?auto_477024 ) ) ( not ( = ?auto_477022 ?auto_477025 ) ) ( not ( = ?auto_477022 ?auto_477026 ) ) ( not ( = ?auto_477022 ?auto_477027 ) ) ( not ( = ?auto_477022 ?auto_477028 ) ) ( not ( = ?auto_477022 ?auto_477029 ) ) ( not ( = ?auto_477022 ?auto_477030 ) ) ( not ( = ?auto_477023 ?auto_477024 ) ) ( not ( = ?auto_477023 ?auto_477025 ) ) ( not ( = ?auto_477023 ?auto_477026 ) ) ( not ( = ?auto_477023 ?auto_477027 ) ) ( not ( = ?auto_477023 ?auto_477028 ) ) ( not ( = ?auto_477023 ?auto_477029 ) ) ( not ( = ?auto_477023 ?auto_477030 ) ) ( not ( = ?auto_477024 ?auto_477025 ) ) ( not ( = ?auto_477024 ?auto_477026 ) ) ( not ( = ?auto_477024 ?auto_477027 ) ) ( not ( = ?auto_477024 ?auto_477028 ) ) ( not ( = ?auto_477024 ?auto_477029 ) ) ( not ( = ?auto_477024 ?auto_477030 ) ) ( not ( = ?auto_477025 ?auto_477026 ) ) ( not ( = ?auto_477025 ?auto_477027 ) ) ( not ( = ?auto_477025 ?auto_477028 ) ) ( not ( = ?auto_477025 ?auto_477029 ) ) ( not ( = ?auto_477025 ?auto_477030 ) ) ( not ( = ?auto_477026 ?auto_477027 ) ) ( not ( = ?auto_477026 ?auto_477028 ) ) ( not ( = ?auto_477026 ?auto_477029 ) ) ( not ( = ?auto_477026 ?auto_477030 ) ) ( not ( = ?auto_477027 ?auto_477028 ) ) ( not ( = ?auto_477027 ?auto_477029 ) ) ( not ( = ?auto_477027 ?auto_477030 ) ) ( not ( = ?auto_477028 ?auto_477029 ) ) ( not ( = ?auto_477028 ?auto_477030 ) ) ( not ( = ?auto_477029 ?auto_477030 ) ) ( ON ?auto_477028 ?auto_477029 ) ( ON ?auto_477027 ?auto_477028 ) ( ON ?auto_477026 ?auto_477027 ) ( ON ?auto_477025 ?auto_477026 ) ( ON ?auto_477024 ?auto_477025 ) ( ON ?auto_477023 ?auto_477024 ) ( ON ?auto_477022 ?auto_477023 ) ( ON ?auto_477021 ?auto_477022 ) ( CLEAR ?auto_477019 ) ( ON ?auto_477020 ?auto_477021 ) ( CLEAR ?auto_477020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_477014 ?auto_477015 ?auto_477016 ?auto_477017 ?auto_477018 ?auto_477019 ?auto_477020 )
      ( MAKE-16PILE ?auto_477014 ?auto_477015 ?auto_477016 ?auto_477017 ?auto_477018 ?auto_477019 ?auto_477020 ?auto_477021 ?auto_477022 ?auto_477023 ?auto_477024 ?auto_477025 ?auto_477026 ?auto_477027 ?auto_477028 ?auto_477029 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477047 - BLOCK
      ?auto_477048 - BLOCK
      ?auto_477049 - BLOCK
      ?auto_477050 - BLOCK
      ?auto_477051 - BLOCK
      ?auto_477052 - BLOCK
      ?auto_477053 - BLOCK
      ?auto_477054 - BLOCK
      ?auto_477055 - BLOCK
      ?auto_477056 - BLOCK
      ?auto_477057 - BLOCK
      ?auto_477058 - BLOCK
      ?auto_477059 - BLOCK
      ?auto_477060 - BLOCK
      ?auto_477061 - BLOCK
      ?auto_477062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477062 ) ( ON-TABLE ?auto_477047 ) ( ON ?auto_477048 ?auto_477047 ) ( ON ?auto_477049 ?auto_477048 ) ( ON ?auto_477050 ?auto_477049 ) ( ON ?auto_477051 ?auto_477050 ) ( ON ?auto_477052 ?auto_477051 ) ( not ( = ?auto_477047 ?auto_477048 ) ) ( not ( = ?auto_477047 ?auto_477049 ) ) ( not ( = ?auto_477047 ?auto_477050 ) ) ( not ( = ?auto_477047 ?auto_477051 ) ) ( not ( = ?auto_477047 ?auto_477052 ) ) ( not ( = ?auto_477047 ?auto_477053 ) ) ( not ( = ?auto_477047 ?auto_477054 ) ) ( not ( = ?auto_477047 ?auto_477055 ) ) ( not ( = ?auto_477047 ?auto_477056 ) ) ( not ( = ?auto_477047 ?auto_477057 ) ) ( not ( = ?auto_477047 ?auto_477058 ) ) ( not ( = ?auto_477047 ?auto_477059 ) ) ( not ( = ?auto_477047 ?auto_477060 ) ) ( not ( = ?auto_477047 ?auto_477061 ) ) ( not ( = ?auto_477047 ?auto_477062 ) ) ( not ( = ?auto_477048 ?auto_477049 ) ) ( not ( = ?auto_477048 ?auto_477050 ) ) ( not ( = ?auto_477048 ?auto_477051 ) ) ( not ( = ?auto_477048 ?auto_477052 ) ) ( not ( = ?auto_477048 ?auto_477053 ) ) ( not ( = ?auto_477048 ?auto_477054 ) ) ( not ( = ?auto_477048 ?auto_477055 ) ) ( not ( = ?auto_477048 ?auto_477056 ) ) ( not ( = ?auto_477048 ?auto_477057 ) ) ( not ( = ?auto_477048 ?auto_477058 ) ) ( not ( = ?auto_477048 ?auto_477059 ) ) ( not ( = ?auto_477048 ?auto_477060 ) ) ( not ( = ?auto_477048 ?auto_477061 ) ) ( not ( = ?auto_477048 ?auto_477062 ) ) ( not ( = ?auto_477049 ?auto_477050 ) ) ( not ( = ?auto_477049 ?auto_477051 ) ) ( not ( = ?auto_477049 ?auto_477052 ) ) ( not ( = ?auto_477049 ?auto_477053 ) ) ( not ( = ?auto_477049 ?auto_477054 ) ) ( not ( = ?auto_477049 ?auto_477055 ) ) ( not ( = ?auto_477049 ?auto_477056 ) ) ( not ( = ?auto_477049 ?auto_477057 ) ) ( not ( = ?auto_477049 ?auto_477058 ) ) ( not ( = ?auto_477049 ?auto_477059 ) ) ( not ( = ?auto_477049 ?auto_477060 ) ) ( not ( = ?auto_477049 ?auto_477061 ) ) ( not ( = ?auto_477049 ?auto_477062 ) ) ( not ( = ?auto_477050 ?auto_477051 ) ) ( not ( = ?auto_477050 ?auto_477052 ) ) ( not ( = ?auto_477050 ?auto_477053 ) ) ( not ( = ?auto_477050 ?auto_477054 ) ) ( not ( = ?auto_477050 ?auto_477055 ) ) ( not ( = ?auto_477050 ?auto_477056 ) ) ( not ( = ?auto_477050 ?auto_477057 ) ) ( not ( = ?auto_477050 ?auto_477058 ) ) ( not ( = ?auto_477050 ?auto_477059 ) ) ( not ( = ?auto_477050 ?auto_477060 ) ) ( not ( = ?auto_477050 ?auto_477061 ) ) ( not ( = ?auto_477050 ?auto_477062 ) ) ( not ( = ?auto_477051 ?auto_477052 ) ) ( not ( = ?auto_477051 ?auto_477053 ) ) ( not ( = ?auto_477051 ?auto_477054 ) ) ( not ( = ?auto_477051 ?auto_477055 ) ) ( not ( = ?auto_477051 ?auto_477056 ) ) ( not ( = ?auto_477051 ?auto_477057 ) ) ( not ( = ?auto_477051 ?auto_477058 ) ) ( not ( = ?auto_477051 ?auto_477059 ) ) ( not ( = ?auto_477051 ?auto_477060 ) ) ( not ( = ?auto_477051 ?auto_477061 ) ) ( not ( = ?auto_477051 ?auto_477062 ) ) ( not ( = ?auto_477052 ?auto_477053 ) ) ( not ( = ?auto_477052 ?auto_477054 ) ) ( not ( = ?auto_477052 ?auto_477055 ) ) ( not ( = ?auto_477052 ?auto_477056 ) ) ( not ( = ?auto_477052 ?auto_477057 ) ) ( not ( = ?auto_477052 ?auto_477058 ) ) ( not ( = ?auto_477052 ?auto_477059 ) ) ( not ( = ?auto_477052 ?auto_477060 ) ) ( not ( = ?auto_477052 ?auto_477061 ) ) ( not ( = ?auto_477052 ?auto_477062 ) ) ( not ( = ?auto_477053 ?auto_477054 ) ) ( not ( = ?auto_477053 ?auto_477055 ) ) ( not ( = ?auto_477053 ?auto_477056 ) ) ( not ( = ?auto_477053 ?auto_477057 ) ) ( not ( = ?auto_477053 ?auto_477058 ) ) ( not ( = ?auto_477053 ?auto_477059 ) ) ( not ( = ?auto_477053 ?auto_477060 ) ) ( not ( = ?auto_477053 ?auto_477061 ) ) ( not ( = ?auto_477053 ?auto_477062 ) ) ( not ( = ?auto_477054 ?auto_477055 ) ) ( not ( = ?auto_477054 ?auto_477056 ) ) ( not ( = ?auto_477054 ?auto_477057 ) ) ( not ( = ?auto_477054 ?auto_477058 ) ) ( not ( = ?auto_477054 ?auto_477059 ) ) ( not ( = ?auto_477054 ?auto_477060 ) ) ( not ( = ?auto_477054 ?auto_477061 ) ) ( not ( = ?auto_477054 ?auto_477062 ) ) ( not ( = ?auto_477055 ?auto_477056 ) ) ( not ( = ?auto_477055 ?auto_477057 ) ) ( not ( = ?auto_477055 ?auto_477058 ) ) ( not ( = ?auto_477055 ?auto_477059 ) ) ( not ( = ?auto_477055 ?auto_477060 ) ) ( not ( = ?auto_477055 ?auto_477061 ) ) ( not ( = ?auto_477055 ?auto_477062 ) ) ( not ( = ?auto_477056 ?auto_477057 ) ) ( not ( = ?auto_477056 ?auto_477058 ) ) ( not ( = ?auto_477056 ?auto_477059 ) ) ( not ( = ?auto_477056 ?auto_477060 ) ) ( not ( = ?auto_477056 ?auto_477061 ) ) ( not ( = ?auto_477056 ?auto_477062 ) ) ( not ( = ?auto_477057 ?auto_477058 ) ) ( not ( = ?auto_477057 ?auto_477059 ) ) ( not ( = ?auto_477057 ?auto_477060 ) ) ( not ( = ?auto_477057 ?auto_477061 ) ) ( not ( = ?auto_477057 ?auto_477062 ) ) ( not ( = ?auto_477058 ?auto_477059 ) ) ( not ( = ?auto_477058 ?auto_477060 ) ) ( not ( = ?auto_477058 ?auto_477061 ) ) ( not ( = ?auto_477058 ?auto_477062 ) ) ( not ( = ?auto_477059 ?auto_477060 ) ) ( not ( = ?auto_477059 ?auto_477061 ) ) ( not ( = ?auto_477059 ?auto_477062 ) ) ( not ( = ?auto_477060 ?auto_477061 ) ) ( not ( = ?auto_477060 ?auto_477062 ) ) ( not ( = ?auto_477061 ?auto_477062 ) ) ( ON ?auto_477061 ?auto_477062 ) ( ON ?auto_477060 ?auto_477061 ) ( ON ?auto_477059 ?auto_477060 ) ( ON ?auto_477058 ?auto_477059 ) ( ON ?auto_477057 ?auto_477058 ) ( ON ?auto_477056 ?auto_477057 ) ( ON ?auto_477055 ?auto_477056 ) ( ON ?auto_477054 ?auto_477055 ) ( CLEAR ?auto_477052 ) ( ON ?auto_477053 ?auto_477054 ) ( CLEAR ?auto_477053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_477047 ?auto_477048 ?auto_477049 ?auto_477050 ?auto_477051 ?auto_477052 ?auto_477053 )
      ( MAKE-16PILE ?auto_477047 ?auto_477048 ?auto_477049 ?auto_477050 ?auto_477051 ?auto_477052 ?auto_477053 ?auto_477054 ?auto_477055 ?auto_477056 ?auto_477057 ?auto_477058 ?auto_477059 ?auto_477060 ?auto_477061 ?auto_477062 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477079 - BLOCK
      ?auto_477080 - BLOCK
      ?auto_477081 - BLOCK
      ?auto_477082 - BLOCK
      ?auto_477083 - BLOCK
      ?auto_477084 - BLOCK
      ?auto_477085 - BLOCK
      ?auto_477086 - BLOCK
      ?auto_477087 - BLOCK
      ?auto_477088 - BLOCK
      ?auto_477089 - BLOCK
      ?auto_477090 - BLOCK
      ?auto_477091 - BLOCK
      ?auto_477092 - BLOCK
      ?auto_477093 - BLOCK
      ?auto_477094 - BLOCK
    )
    :vars
    (
      ?auto_477095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477094 ?auto_477095 ) ( ON-TABLE ?auto_477079 ) ( ON ?auto_477080 ?auto_477079 ) ( ON ?auto_477081 ?auto_477080 ) ( ON ?auto_477082 ?auto_477081 ) ( ON ?auto_477083 ?auto_477082 ) ( not ( = ?auto_477079 ?auto_477080 ) ) ( not ( = ?auto_477079 ?auto_477081 ) ) ( not ( = ?auto_477079 ?auto_477082 ) ) ( not ( = ?auto_477079 ?auto_477083 ) ) ( not ( = ?auto_477079 ?auto_477084 ) ) ( not ( = ?auto_477079 ?auto_477085 ) ) ( not ( = ?auto_477079 ?auto_477086 ) ) ( not ( = ?auto_477079 ?auto_477087 ) ) ( not ( = ?auto_477079 ?auto_477088 ) ) ( not ( = ?auto_477079 ?auto_477089 ) ) ( not ( = ?auto_477079 ?auto_477090 ) ) ( not ( = ?auto_477079 ?auto_477091 ) ) ( not ( = ?auto_477079 ?auto_477092 ) ) ( not ( = ?auto_477079 ?auto_477093 ) ) ( not ( = ?auto_477079 ?auto_477094 ) ) ( not ( = ?auto_477079 ?auto_477095 ) ) ( not ( = ?auto_477080 ?auto_477081 ) ) ( not ( = ?auto_477080 ?auto_477082 ) ) ( not ( = ?auto_477080 ?auto_477083 ) ) ( not ( = ?auto_477080 ?auto_477084 ) ) ( not ( = ?auto_477080 ?auto_477085 ) ) ( not ( = ?auto_477080 ?auto_477086 ) ) ( not ( = ?auto_477080 ?auto_477087 ) ) ( not ( = ?auto_477080 ?auto_477088 ) ) ( not ( = ?auto_477080 ?auto_477089 ) ) ( not ( = ?auto_477080 ?auto_477090 ) ) ( not ( = ?auto_477080 ?auto_477091 ) ) ( not ( = ?auto_477080 ?auto_477092 ) ) ( not ( = ?auto_477080 ?auto_477093 ) ) ( not ( = ?auto_477080 ?auto_477094 ) ) ( not ( = ?auto_477080 ?auto_477095 ) ) ( not ( = ?auto_477081 ?auto_477082 ) ) ( not ( = ?auto_477081 ?auto_477083 ) ) ( not ( = ?auto_477081 ?auto_477084 ) ) ( not ( = ?auto_477081 ?auto_477085 ) ) ( not ( = ?auto_477081 ?auto_477086 ) ) ( not ( = ?auto_477081 ?auto_477087 ) ) ( not ( = ?auto_477081 ?auto_477088 ) ) ( not ( = ?auto_477081 ?auto_477089 ) ) ( not ( = ?auto_477081 ?auto_477090 ) ) ( not ( = ?auto_477081 ?auto_477091 ) ) ( not ( = ?auto_477081 ?auto_477092 ) ) ( not ( = ?auto_477081 ?auto_477093 ) ) ( not ( = ?auto_477081 ?auto_477094 ) ) ( not ( = ?auto_477081 ?auto_477095 ) ) ( not ( = ?auto_477082 ?auto_477083 ) ) ( not ( = ?auto_477082 ?auto_477084 ) ) ( not ( = ?auto_477082 ?auto_477085 ) ) ( not ( = ?auto_477082 ?auto_477086 ) ) ( not ( = ?auto_477082 ?auto_477087 ) ) ( not ( = ?auto_477082 ?auto_477088 ) ) ( not ( = ?auto_477082 ?auto_477089 ) ) ( not ( = ?auto_477082 ?auto_477090 ) ) ( not ( = ?auto_477082 ?auto_477091 ) ) ( not ( = ?auto_477082 ?auto_477092 ) ) ( not ( = ?auto_477082 ?auto_477093 ) ) ( not ( = ?auto_477082 ?auto_477094 ) ) ( not ( = ?auto_477082 ?auto_477095 ) ) ( not ( = ?auto_477083 ?auto_477084 ) ) ( not ( = ?auto_477083 ?auto_477085 ) ) ( not ( = ?auto_477083 ?auto_477086 ) ) ( not ( = ?auto_477083 ?auto_477087 ) ) ( not ( = ?auto_477083 ?auto_477088 ) ) ( not ( = ?auto_477083 ?auto_477089 ) ) ( not ( = ?auto_477083 ?auto_477090 ) ) ( not ( = ?auto_477083 ?auto_477091 ) ) ( not ( = ?auto_477083 ?auto_477092 ) ) ( not ( = ?auto_477083 ?auto_477093 ) ) ( not ( = ?auto_477083 ?auto_477094 ) ) ( not ( = ?auto_477083 ?auto_477095 ) ) ( not ( = ?auto_477084 ?auto_477085 ) ) ( not ( = ?auto_477084 ?auto_477086 ) ) ( not ( = ?auto_477084 ?auto_477087 ) ) ( not ( = ?auto_477084 ?auto_477088 ) ) ( not ( = ?auto_477084 ?auto_477089 ) ) ( not ( = ?auto_477084 ?auto_477090 ) ) ( not ( = ?auto_477084 ?auto_477091 ) ) ( not ( = ?auto_477084 ?auto_477092 ) ) ( not ( = ?auto_477084 ?auto_477093 ) ) ( not ( = ?auto_477084 ?auto_477094 ) ) ( not ( = ?auto_477084 ?auto_477095 ) ) ( not ( = ?auto_477085 ?auto_477086 ) ) ( not ( = ?auto_477085 ?auto_477087 ) ) ( not ( = ?auto_477085 ?auto_477088 ) ) ( not ( = ?auto_477085 ?auto_477089 ) ) ( not ( = ?auto_477085 ?auto_477090 ) ) ( not ( = ?auto_477085 ?auto_477091 ) ) ( not ( = ?auto_477085 ?auto_477092 ) ) ( not ( = ?auto_477085 ?auto_477093 ) ) ( not ( = ?auto_477085 ?auto_477094 ) ) ( not ( = ?auto_477085 ?auto_477095 ) ) ( not ( = ?auto_477086 ?auto_477087 ) ) ( not ( = ?auto_477086 ?auto_477088 ) ) ( not ( = ?auto_477086 ?auto_477089 ) ) ( not ( = ?auto_477086 ?auto_477090 ) ) ( not ( = ?auto_477086 ?auto_477091 ) ) ( not ( = ?auto_477086 ?auto_477092 ) ) ( not ( = ?auto_477086 ?auto_477093 ) ) ( not ( = ?auto_477086 ?auto_477094 ) ) ( not ( = ?auto_477086 ?auto_477095 ) ) ( not ( = ?auto_477087 ?auto_477088 ) ) ( not ( = ?auto_477087 ?auto_477089 ) ) ( not ( = ?auto_477087 ?auto_477090 ) ) ( not ( = ?auto_477087 ?auto_477091 ) ) ( not ( = ?auto_477087 ?auto_477092 ) ) ( not ( = ?auto_477087 ?auto_477093 ) ) ( not ( = ?auto_477087 ?auto_477094 ) ) ( not ( = ?auto_477087 ?auto_477095 ) ) ( not ( = ?auto_477088 ?auto_477089 ) ) ( not ( = ?auto_477088 ?auto_477090 ) ) ( not ( = ?auto_477088 ?auto_477091 ) ) ( not ( = ?auto_477088 ?auto_477092 ) ) ( not ( = ?auto_477088 ?auto_477093 ) ) ( not ( = ?auto_477088 ?auto_477094 ) ) ( not ( = ?auto_477088 ?auto_477095 ) ) ( not ( = ?auto_477089 ?auto_477090 ) ) ( not ( = ?auto_477089 ?auto_477091 ) ) ( not ( = ?auto_477089 ?auto_477092 ) ) ( not ( = ?auto_477089 ?auto_477093 ) ) ( not ( = ?auto_477089 ?auto_477094 ) ) ( not ( = ?auto_477089 ?auto_477095 ) ) ( not ( = ?auto_477090 ?auto_477091 ) ) ( not ( = ?auto_477090 ?auto_477092 ) ) ( not ( = ?auto_477090 ?auto_477093 ) ) ( not ( = ?auto_477090 ?auto_477094 ) ) ( not ( = ?auto_477090 ?auto_477095 ) ) ( not ( = ?auto_477091 ?auto_477092 ) ) ( not ( = ?auto_477091 ?auto_477093 ) ) ( not ( = ?auto_477091 ?auto_477094 ) ) ( not ( = ?auto_477091 ?auto_477095 ) ) ( not ( = ?auto_477092 ?auto_477093 ) ) ( not ( = ?auto_477092 ?auto_477094 ) ) ( not ( = ?auto_477092 ?auto_477095 ) ) ( not ( = ?auto_477093 ?auto_477094 ) ) ( not ( = ?auto_477093 ?auto_477095 ) ) ( not ( = ?auto_477094 ?auto_477095 ) ) ( ON ?auto_477093 ?auto_477094 ) ( ON ?auto_477092 ?auto_477093 ) ( ON ?auto_477091 ?auto_477092 ) ( ON ?auto_477090 ?auto_477091 ) ( ON ?auto_477089 ?auto_477090 ) ( ON ?auto_477088 ?auto_477089 ) ( ON ?auto_477087 ?auto_477088 ) ( ON ?auto_477086 ?auto_477087 ) ( ON ?auto_477085 ?auto_477086 ) ( CLEAR ?auto_477083 ) ( ON ?auto_477084 ?auto_477085 ) ( CLEAR ?auto_477084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_477079 ?auto_477080 ?auto_477081 ?auto_477082 ?auto_477083 ?auto_477084 )
      ( MAKE-16PILE ?auto_477079 ?auto_477080 ?auto_477081 ?auto_477082 ?auto_477083 ?auto_477084 ?auto_477085 ?auto_477086 ?auto_477087 ?auto_477088 ?auto_477089 ?auto_477090 ?auto_477091 ?auto_477092 ?auto_477093 ?auto_477094 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477112 - BLOCK
      ?auto_477113 - BLOCK
      ?auto_477114 - BLOCK
      ?auto_477115 - BLOCK
      ?auto_477116 - BLOCK
      ?auto_477117 - BLOCK
      ?auto_477118 - BLOCK
      ?auto_477119 - BLOCK
      ?auto_477120 - BLOCK
      ?auto_477121 - BLOCK
      ?auto_477122 - BLOCK
      ?auto_477123 - BLOCK
      ?auto_477124 - BLOCK
      ?auto_477125 - BLOCK
      ?auto_477126 - BLOCK
      ?auto_477127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477127 ) ( ON-TABLE ?auto_477112 ) ( ON ?auto_477113 ?auto_477112 ) ( ON ?auto_477114 ?auto_477113 ) ( ON ?auto_477115 ?auto_477114 ) ( ON ?auto_477116 ?auto_477115 ) ( not ( = ?auto_477112 ?auto_477113 ) ) ( not ( = ?auto_477112 ?auto_477114 ) ) ( not ( = ?auto_477112 ?auto_477115 ) ) ( not ( = ?auto_477112 ?auto_477116 ) ) ( not ( = ?auto_477112 ?auto_477117 ) ) ( not ( = ?auto_477112 ?auto_477118 ) ) ( not ( = ?auto_477112 ?auto_477119 ) ) ( not ( = ?auto_477112 ?auto_477120 ) ) ( not ( = ?auto_477112 ?auto_477121 ) ) ( not ( = ?auto_477112 ?auto_477122 ) ) ( not ( = ?auto_477112 ?auto_477123 ) ) ( not ( = ?auto_477112 ?auto_477124 ) ) ( not ( = ?auto_477112 ?auto_477125 ) ) ( not ( = ?auto_477112 ?auto_477126 ) ) ( not ( = ?auto_477112 ?auto_477127 ) ) ( not ( = ?auto_477113 ?auto_477114 ) ) ( not ( = ?auto_477113 ?auto_477115 ) ) ( not ( = ?auto_477113 ?auto_477116 ) ) ( not ( = ?auto_477113 ?auto_477117 ) ) ( not ( = ?auto_477113 ?auto_477118 ) ) ( not ( = ?auto_477113 ?auto_477119 ) ) ( not ( = ?auto_477113 ?auto_477120 ) ) ( not ( = ?auto_477113 ?auto_477121 ) ) ( not ( = ?auto_477113 ?auto_477122 ) ) ( not ( = ?auto_477113 ?auto_477123 ) ) ( not ( = ?auto_477113 ?auto_477124 ) ) ( not ( = ?auto_477113 ?auto_477125 ) ) ( not ( = ?auto_477113 ?auto_477126 ) ) ( not ( = ?auto_477113 ?auto_477127 ) ) ( not ( = ?auto_477114 ?auto_477115 ) ) ( not ( = ?auto_477114 ?auto_477116 ) ) ( not ( = ?auto_477114 ?auto_477117 ) ) ( not ( = ?auto_477114 ?auto_477118 ) ) ( not ( = ?auto_477114 ?auto_477119 ) ) ( not ( = ?auto_477114 ?auto_477120 ) ) ( not ( = ?auto_477114 ?auto_477121 ) ) ( not ( = ?auto_477114 ?auto_477122 ) ) ( not ( = ?auto_477114 ?auto_477123 ) ) ( not ( = ?auto_477114 ?auto_477124 ) ) ( not ( = ?auto_477114 ?auto_477125 ) ) ( not ( = ?auto_477114 ?auto_477126 ) ) ( not ( = ?auto_477114 ?auto_477127 ) ) ( not ( = ?auto_477115 ?auto_477116 ) ) ( not ( = ?auto_477115 ?auto_477117 ) ) ( not ( = ?auto_477115 ?auto_477118 ) ) ( not ( = ?auto_477115 ?auto_477119 ) ) ( not ( = ?auto_477115 ?auto_477120 ) ) ( not ( = ?auto_477115 ?auto_477121 ) ) ( not ( = ?auto_477115 ?auto_477122 ) ) ( not ( = ?auto_477115 ?auto_477123 ) ) ( not ( = ?auto_477115 ?auto_477124 ) ) ( not ( = ?auto_477115 ?auto_477125 ) ) ( not ( = ?auto_477115 ?auto_477126 ) ) ( not ( = ?auto_477115 ?auto_477127 ) ) ( not ( = ?auto_477116 ?auto_477117 ) ) ( not ( = ?auto_477116 ?auto_477118 ) ) ( not ( = ?auto_477116 ?auto_477119 ) ) ( not ( = ?auto_477116 ?auto_477120 ) ) ( not ( = ?auto_477116 ?auto_477121 ) ) ( not ( = ?auto_477116 ?auto_477122 ) ) ( not ( = ?auto_477116 ?auto_477123 ) ) ( not ( = ?auto_477116 ?auto_477124 ) ) ( not ( = ?auto_477116 ?auto_477125 ) ) ( not ( = ?auto_477116 ?auto_477126 ) ) ( not ( = ?auto_477116 ?auto_477127 ) ) ( not ( = ?auto_477117 ?auto_477118 ) ) ( not ( = ?auto_477117 ?auto_477119 ) ) ( not ( = ?auto_477117 ?auto_477120 ) ) ( not ( = ?auto_477117 ?auto_477121 ) ) ( not ( = ?auto_477117 ?auto_477122 ) ) ( not ( = ?auto_477117 ?auto_477123 ) ) ( not ( = ?auto_477117 ?auto_477124 ) ) ( not ( = ?auto_477117 ?auto_477125 ) ) ( not ( = ?auto_477117 ?auto_477126 ) ) ( not ( = ?auto_477117 ?auto_477127 ) ) ( not ( = ?auto_477118 ?auto_477119 ) ) ( not ( = ?auto_477118 ?auto_477120 ) ) ( not ( = ?auto_477118 ?auto_477121 ) ) ( not ( = ?auto_477118 ?auto_477122 ) ) ( not ( = ?auto_477118 ?auto_477123 ) ) ( not ( = ?auto_477118 ?auto_477124 ) ) ( not ( = ?auto_477118 ?auto_477125 ) ) ( not ( = ?auto_477118 ?auto_477126 ) ) ( not ( = ?auto_477118 ?auto_477127 ) ) ( not ( = ?auto_477119 ?auto_477120 ) ) ( not ( = ?auto_477119 ?auto_477121 ) ) ( not ( = ?auto_477119 ?auto_477122 ) ) ( not ( = ?auto_477119 ?auto_477123 ) ) ( not ( = ?auto_477119 ?auto_477124 ) ) ( not ( = ?auto_477119 ?auto_477125 ) ) ( not ( = ?auto_477119 ?auto_477126 ) ) ( not ( = ?auto_477119 ?auto_477127 ) ) ( not ( = ?auto_477120 ?auto_477121 ) ) ( not ( = ?auto_477120 ?auto_477122 ) ) ( not ( = ?auto_477120 ?auto_477123 ) ) ( not ( = ?auto_477120 ?auto_477124 ) ) ( not ( = ?auto_477120 ?auto_477125 ) ) ( not ( = ?auto_477120 ?auto_477126 ) ) ( not ( = ?auto_477120 ?auto_477127 ) ) ( not ( = ?auto_477121 ?auto_477122 ) ) ( not ( = ?auto_477121 ?auto_477123 ) ) ( not ( = ?auto_477121 ?auto_477124 ) ) ( not ( = ?auto_477121 ?auto_477125 ) ) ( not ( = ?auto_477121 ?auto_477126 ) ) ( not ( = ?auto_477121 ?auto_477127 ) ) ( not ( = ?auto_477122 ?auto_477123 ) ) ( not ( = ?auto_477122 ?auto_477124 ) ) ( not ( = ?auto_477122 ?auto_477125 ) ) ( not ( = ?auto_477122 ?auto_477126 ) ) ( not ( = ?auto_477122 ?auto_477127 ) ) ( not ( = ?auto_477123 ?auto_477124 ) ) ( not ( = ?auto_477123 ?auto_477125 ) ) ( not ( = ?auto_477123 ?auto_477126 ) ) ( not ( = ?auto_477123 ?auto_477127 ) ) ( not ( = ?auto_477124 ?auto_477125 ) ) ( not ( = ?auto_477124 ?auto_477126 ) ) ( not ( = ?auto_477124 ?auto_477127 ) ) ( not ( = ?auto_477125 ?auto_477126 ) ) ( not ( = ?auto_477125 ?auto_477127 ) ) ( not ( = ?auto_477126 ?auto_477127 ) ) ( ON ?auto_477126 ?auto_477127 ) ( ON ?auto_477125 ?auto_477126 ) ( ON ?auto_477124 ?auto_477125 ) ( ON ?auto_477123 ?auto_477124 ) ( ON ?auto_477122 ?auto_477123 ) ( ON ?auto_477121 ?auto_477122 ) ( ON ?auto_477120 ?auto_477121 ) ( ON ?auto_477119 ?auto_477120 ) ( ON ?auto_477118 ?auto_477119 ) ( CLEAR ?auto_477116 ) ( ON ?auto_477117 ?auto_477118 ) ( CLEAR ?auto_477117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_477112 ?auto_477113 ?auto_477114 ?auto_477115 ?auto_477116 ?auto_477117 )
      ( MAKE-16PILE ?auto_477112 ?auto_477113 ?auto_477114 ?auto_477115 ?auto_477116 ?auto_477117 ?auto_477118 ?auto_477119 ?auto_477120 ?auto_477121 ?auto_477122 ?auto_477123 ?auto_477124 ?auto_477125 ?auto_477126 ?auto_477127 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477144 - BLOCK
      ?auto_477145 - BLOCK
      ?auto_477146 - BLOCK
      ?auto_477147 - BLOCK
      ?auto_477148 - BLOCK
      ?auto_477149 - BLOCK
      ?auto_477150 - BLOCK
      ?auto_477151 - BLOCK
      ?auto_477152 - BLOCK
      ?auto_477153 - BLOCK
      ?auto_477154 - BLOCK
      ?auto_477155 - BLOCK
      ?auto_477156 - BLOCK
      ?auto_477157 - BLOCK
      ?auto_477158 - BLOCK
      ?auto_477159 - BLOCK
    )
    :vars
    (
      ?auto_477160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477159 ?auto_477160 ) ( ON-TABLE ?auto_477144 ) ( ON ?auto_477145 ?auto_477144 ) ( ON ?auto_477146 ?auto_477145 ) ( ON ?auto_477147 ?auto_477146 ) ( not ( = ?auto_477144 ?auto_477145 ) ) ( not ( = ?auto_477144 ?auto_477146 ) ) ( not ( = ?auto_477144 ?auto_477147 ) ) ( not ( = ?auto_477144 ?auto_477148 ) ) ( not ( = ?auto_477144 ?auto_477149 ) ) ( not ( = ?auto_477144 ?auto_477150 ) ) ( not ( = ?auto_477144 ?auto_477151 ) ) ( not ( = ?auto_477144 ?auto_477152 ) ) ( not ( = ?auto_477144 ?auto_477153 ) ) ( not ( = ?auto_477144 ?auto_477154 ) ) ( not ( = ?auto_477144 ?auto_477155 ) ) ( not ( = ?auto_477144 ?auto_477156 ) ) ( not ( = ?auto_477144 ?auto_477157 ) ) ( not ( = ?auto_477144 ?auto_477158 ) ) ( not ( = ?auto_477144 ?auto_477159 ) ) ( not ( = ?auto_477144 ?auto_477160 ) ) ( not ( = ?auto_477145 ?auto_477146 ) ) ( not ( = ?auto_477145 ?auto_477147 ) ) ( not ( = ?auto_477145 ?auto_477148 ) ) ( not ( = ?auto_477145 ?auto_477149 ) ) ( not ( = ?auto_477145 ?auto_477150 ) ) ( not ( = ?auto_477145 ?auto_477151 ) ) ( not ( = ?auto_477145 ?auto_477152 ) ) ( not ( = ?auto_477145 ?auto_477153 ) ) ( not ( = ?auto_477145 ?auto_477154 ) ) ( not ( = ?auto_477145 ?auto_477155 ) ) ( not ( = ?auto_477145 ?auto_477156 ) ) ( not ( = ?auto_477145 ?auto_477157 ) ) ( not ( = ?auto_477145 ?auto_477158 ) ) ( not ( = ?auto_477145 ?auto_477159 ) ) ( not ( = ?auto_477145 ?auto_477160 ) ) ( not ( = ?auto_477146 ?auto_477147 ) ) ( not ( = ?auto_477146 ?auto_477148 ) ) ( not ( = ?auto_477146 ?auto_477149 ) ) ( not ( = ?auto_477146 ?auto_477150 ) ) ( not ( = ?auto_477146 ?auto_477151 ) ) ( not ( = ?auto_477146 ?auto_477152 ) ) ( not ( = ?auto_477146 ?auto_477153 ) ) ( not ( = ?auto_477146 ?auto_477154 ) ) ( not ( = ?auto_477146 ?auto_477155 ) ) ( not ( = ?auto_477146 ?auto_477156 ) ) ( not ( = ?auto_477146 ?auto_477157 ) ) ( not ( = ?auto_477146 ?auto_477158 ) ) ( not ( = ?auto_477146 ?auto_477159 ) ) ( not ( = ?auto_477146 ?auto_477160 ) ) ( not ( = ?auto_477147 ?auto_477148 ) ) ( not ( = ?auto_477147 ?auto_477149 ) ) ( not ( = ?auto_477147 ?auto_477150 ) ) ( not ( = ?auto_477147 ?auto_477151 ) ) ( not ( = ?auto_477147 ?auto_477152 ) ) ( not ( = ?auto_477147 ?auto_477153 ) ) ( not ( = ?auto_477147 ?auto_477154 ) ) ( not ( = ?auto_477147 ?auto_477155 ) ) ( not ( = ?auto_477147 ?auto_477156 ) ) ( not ( = ?auto_477147 ?auto_477157 ) ) ( not ( = ?auto_477147 ?auto_477158 ) ) ( not ( = ?auto_477147 ?auto_477159 ) ) ( not ( = ?auto_477147 ?auto_477160 ) ) ( not ( = ?auto_477148 ?auto_477149 ) ) ( not ( = ?auto_477148 ?auto_477150 ) ) ( not ( = ?auto_477148 ?auto_477151 ) ) ( not ( = ?auto_477148 ?auto_477152 ) ) ( not ( = ?auto_477148 ?auto_477153 ) ) ( not ( = ?auto_477148 ?auto_477154 ) ) ( not ( = ?auto_477148 ?auto_477155 ) ) ( not ( = ?auto_477148 ?auto_477156 ) ) ( not ( = ?auto_477148 ?auto_477157 ) ) ( not ( = ?auto_477148 ?auto_477158 ) ) ( not ( = ?auto_477148 ?auto_477159 ) ) ( not ( = ?auto_477148 ?auto_477160 ) ) ( not ( = ?auto_477149 ?auto_477150 ) ) ( not ( = ?auto_477149 ?auto_477151 ) ) ( not ( = ?auto_477149 ?auto_477152 ) ) ( not ( = ?auto_477149 ?auto_477153 ) ) ( not ( = ?auto_477149 ?auto_477154 ) ) ( not ( = ?auto_477149 ?auto_477155 ) ) ( not ( = ?auto_477149 ?auto_477156 ) ) ( not ( = ?auto_477149 ?auto_477157 ) ) ( not ( = ?auto_477149 ?auto_477158 ) ) ( not ( = ?auto_477149 ?auto_477159 ) ) ( not ( = ?auto_477149 ?auto_477160 ) ) ( not ( = ?auto_477150 ?auto_477151 ) ) ( not ( = ?auto_477150 ?auto_477152 ) ) ( not ( = ?auto_477150 ?auto_477153 ) ) ( not ( = ?auto_477150 ?auto_477154 ) ) ( not ( = ?auto_477150 ?auto_477155 ) ) ( not ( = ?auto_477150 ?auto_477156 ) ) ( not ( = ?auto_477150 ?auto_477157 ) ) ( not ( = ?auto_477150 ?auto_477158 ) ) ( not ( = ?auto_477150 ?auto_477159 ) ) ( not ( = ?auto_477150 ?auto_477160 ) ) ( not ( = ?auto_477151 ?auto_477152 ) ) ( not ( = ?auto_477151 ?auto_477153 ) ) ( not ( = ?auto_477151 ?auto_477154 ) ) ( not ( = ?auto_477151 ?auto_477155 ) ) ( not ( = ?auto_477151 ?auto_477156 ) ) ( not ( = ?auto_477151 ?auto_477157 ) ) ( not ( = ?auto_477151 ?auto_477158 ) ) ( not ( = ?auto_477151 ?auto_477159 ) ) ( not ( = ?auto_477151 ?auto_477160 ) ) ( not ( = ?auto_477152 ?auto_477153 ) ) ( not ( = ?auto_477152 ?auto_477154 ) ) ( not ( = ?auto_477152 ?auto_477155 ) ) ( not ( = ?auto_477152 ?auto_477156 ) ) ( not ( = ?auto_477152 ?auto_477157 ) ) ( not ( = ?auto_477152 ?auto_477158 ) ) ( not ( = ?auto_477152 ?auto_477159 ) ) ( not ( = ?auto_477152 ?auto_477160 ) ) ( not ( = ?auto_477153 ?auto_477154 ) ) ( not ( = ?auto_477153 ?auto_477155 ) ) ( not ( = ?auto_477153 ?auto_477156 ) ) ( not ( = ?auto_477153 ?auto_477157 ) ) ( not ( = ?auto_477153 ?auto_477158 ) ) ( not ( = ?auto_477153 ?auto_477159 ) ) ( not ( = ?auto_477153 ?auto_477160 ) ) ( not ( = ?auto_477154 ?auto_477155 ) ) ( not ( = ?auto_477154 ?auto_477156 ) ) ( not ( = ?auto_477154 ?auto_477157 ) ) ( not ( = ?auto_477154 ?auto_477158 ) ) ( not ( = ?auto_477154 ?auto_477159 ) ) ( not ( = ?auto_477154 ?auto_477160 ) ) ( not ( = ?auto_477155 ?auto_477156 ) ) ( not ( = ?auto_477155 ?auto_477157 ) ) ( not ( = ?auto_477155 ?auto_477158 ) ) ( not ( = ?auto_477155 ?auto_477159 ) ) ( not ( = ?auto_477155 ?auto_477160 ) ) ( not ( = ?auto_477156 ?auto_477157 ) ) ( not ( = ?auto_477156 ?auto_477158 ) ) ( not ( = ?auto_477156 ?auto_477159 ) ) ( not ( = ?auto_477156 ?auto_477160 ) ) ( not ( = ?auto_477157 ?auto_477158 ) ) ( not ( = ?auto_477157 ?auto_477159 ) ) ( not ( = ?auto_477157 ?auto_477160 ) ) ( not ( = ?auto_477158 ?auto_477159 ) ) ( not ( = ?auto_477158 ?auto_477160 ) ) ( not ( = ?auto_477159 ?auto_477160 ) ) ( ON ?auto_477158 ?auto_477159 ) ( ON ?auto_477157 ?auto_477158 ) ( ON ?auto_477156 ?auto_477157 ) ( ON ?auto_477155 ?auto_477156 ) ( ON ?auto_477154 ?auto_477155 ) ( ON ?auto_477153 ?auto_477154 ) ( ON ?auto_477152 ?auto_477153 ) ( ON ?auto_477151 ?auto_477152 ) ( ON ?auto_477150 ?auto_477151 ) ( ON ?auto_477149 ?auto_477150 ) ( CLEAR ?auto_477147 ) ( ON ?auto_477148 ?auto_477149 ) ( CLEAR ?auto_477148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_477144 ?auto_477145 ?auto_477146 ?auto_477147 ?auto_477148 )
      ( MAKE-16PILE ?auto_477144 ?auto_477145 ?auto_477146 ?auto_477147 ?auto_477148 ?auto_477149 ?auto_477150 ?auto_477151 ?auto_477152 ?auto_477153 ?auto_477154 ?auto_477155 ?auto_477156 ?auto_477157 ?auto_477158 ?auto_477159 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477177 - BLOCK
      ?auto_477178 - BLOCK
      ?auto_477179 - BLOCK
      ?auto_477180 - BLOCK
      ?auto_477181 - BLOCK
      ?auto_477182 - BLOCK
      ?auto_477183 - BLOCK
      ?auto_477184 - BLOCK
      ?auto_477185 - BLOCK
      ?auto_477186 - BLOCK
      ?auto_477187 - BLOCK
      ?auto_477188 - BLOCK
      ?auto_477189 - BLOCK
      ?auto_477190 - BLOCK
      ?auto_477191 - BLOCK
      ?auto_477192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477192 ) ( ON-TABLE ?auto_477177 ) ( ON ?auto_477178 ?auto_477177 ) ( ON ?auto_477179 ?auto_477178 ) ( ON ?auto_477180 ?auto_477179 ) ( not ( = ?auto_477177 ?auto_477178 ) ) ( not ( = ?auto_477177 ?auto_477179 ) ) ( not ( = ?auto_477177 ?auto_477180 ) ) ( not ( = ?auto_477177 ?auto_477181 ) ) ( not ( = ?auto_477177 ?auto_477182 ) ) ( not ( = ?auto_477177 ?auto_477183 ) ) ( not ( = ?auto_477177 ?auto_477184 ) ) ( not ( = ?auto_477177 ?auto_477185 ) ) ( not ( = ?auto_477177 ?auto_477186 ) ) ( not ( = ?auto_477177 ?auto_477187 ) ) ( not ( = ?auto_477177 ?auto_477188 ) ) ( not ( = ?auto_477177 ?auto_477189 ) ) ( not ( = ?auto_477177 ?auto_477190 ) ) ( not ( = ?auto_477177 ?auto_477191 ) ) ( not ( = ?auto_477177 ?auto_477192 ) ) ( not ( = ?auto_477178 ?auto_477179 ) ) ( not ( = ?auto_477178 ?auto_477180 ) ) ( not ( = ?auto_477178 ?auto_477181 ) ) ( not ( = ?auto_477178 ?auto_477182 ) ) ( not ( = ?auto_477178 ?auto_477183 ) ) ( not ( = ?auto_477178 ?auto_477184 ) ) ( not ( = ?auto_477178 ?auto_477185 ) ) ( not ( = ?auto_477178 ?auto_477186 ) ) ( not ( = ?auto_477178 ?auto_477187 ) ) ( not ( = ?auto_477178 ?auto_477188 ) ) ( not ( = ?auto_477178 ?auto_477189 ) ) ( not ( = ?auto_477178 ?auto_477190 ) ) ( not ( = ?auto_477178 ?auto_477191 ) ) ( not ( = ?auto_477178 ?auto_477192 ) ) ( not ( = ?auto_477179 ?auto_477180 ) ) ( not ( = ?auto_477179 ?auto_477181 ) ) ( not ( = ?auto_477179 ?auto_477182 ) ) ( not ( = ?auto_477179 ?auto_477183 ) ) ( not ( = ?auto_477179 ?auto_477184 ) ) ( not ( = ?auto_477179 ?auto_477185 ) ) ( not ( = ?auto_477179 ?auto_477186 ) ) ( not ( = ?auto_477179 ?auto_477187 ) ) ( not ( = ?auto_477179 ?auto_477188 ) ) ( not ( = ?auto_477179 ?auto_477189 ) ) ( not ( = ?auto_477179 ?auto_477190 ) ) ( not ( = ?auto_477179 ?auto_477191 ) ) ( not ( = ?auto_477179 ?auto_477192 ) ) ( not ( = ?auto_477180 ?auto_477181 ) ) ( not ( = ?auto_477180 ?auto_477182 ) ) ( not ( = ?auto_477180 ?auto_477183 ) ) ( not ( = ?auto_477180 ?auto_477184 ) ) ( not ( = ?auto_477180 ?auto_477185 ) ) ( not ( = ?auto_477180 ?auto_477186 ) ) ( not ( = ?auto_477180 ?auto_477187 ) ) ( not ( = ?auto_477180 ?auto_477188 ) ) ( not ( = ?auto_477180 ?auto_477189 ) ) ( not ( = ?auto_477180 ?auto_477190 ) ) ( not ( = ?auto_477180 ?auto_477191 ) ) ( not ( = ?auto_477180 ?auto_477192 ) ) ( not ( = ?auto_477181 ?auto_477182 ) ) ( not ( = ?auto_477181 ?auto_477183 ) ) ( not ( = ?auto_477181 ?auto_477184 ) ) ( not ( = ?auto_477181 ?auto_477185 ) ) ( not ( = ?auto_477181 ?auto_477186 ) ) ( not ( = ?auto_477181 ?auto_477187 ) ) ( not ( = ?auto_477181 ?auto_477188 ) ) ( not ( = ?auto_477181 ?auto_477189 ) ) ( not ( = ?auto_477181 ?auto_477190 ) ) ( not ( = ?auto_477181 ?auto_477191 ) ) ( not ( = ?auto_477181 ?auto_477192 ) ) ( not ( = ?auto_477182 ?auto_477183 ) ) ( not ( = ?auto_477182 ?auto_477184 ) ) ( not ( = ?auto_477182 ?auto_477185 ) ) ( not ( = ?auto_477182 ?auto_477186 ) ) ( not ( = ?auto_477182 ?auto_477187 ) ) ( not ( = ?auto_477182 ?auto_477188 ) ) ( not ( = ?auto_477182 ?auto_477189 ) ) ( not ( = ?auto_477182 ?auto_477190 ) ) ( not ( = ?auto_477182 ?auto_477191 ) ) ( not ( = ?auto_477182 ?auto_477192 ) ) ( not ( = ?auto_477183 ?auto_477184 ) ) ( not ( = ?auto_477183 ?auto_477185 ) ) ( not ( = ?auto_477183 ?auto_477186 ) ) ( not ( = ?auto_477183 ?auto_477187 ) ) ( not ( = ?auto_477183 ?auto_477188 ) ) ( not ( = ?auto_477183 ?auto_477189 ) ) ( not ( = ?auto_477183 ?auto_477190 ) ) ( not ( = ?auto_477183 ?auto_477191 ) ) ( not ( = ?auto_477183 ?auto_477192 ) ) ( not ( = ?auto_477184 ?auto_477185 ) ) ( not ( = ?auto_477184 ?auto_477186 ) ) ( not ( = ?auto_477184 ?auto_477187 ) ) ( not ( = ?auto_477184 ?auto_477188 ) ) ( not ( = ?auto_477184 ?auto_477189 ) ) ( not ( = ?auto_477184 ?auto_477190 ) ) ( not ( = ?auto_477184 ?auto_477191 ) ) ( not ( = ?auto_477184 ?auto_477192 ) ) ( not ( = ?auto_477185 ?auto_477186 ) ) ( not ( = ?auto_477185 ?auto_477187 ) ) ( not ( = ?auto_477185 ?auto_477188 ) ) ( not ( = ?auto_477185 ?auto_477189 ) ) ( not ( = ?auto_477185 ?auto_477190 ) ) ( not ( = ?auto_477185 ?auto_477191 ) ) ( not ( = ?auto_477185 ?auto_477192 ) ) ( not ( = ?auto_477186 ?auto_477187 ) ) ( not ( = ?auto_477186 ?auto_477188 ) ) ( not ( = ?auto_477186 ?auto_477189 ) ) ( not ( = ?auto_477186 ?auto_477190 ) ) ( not ( = ?auto_477186 ?auto_477191 ) ) ( not ( = ?auto_477186 ?auto_477192 ) ) ( not ( = ?auto_477187 ?auto_477188 ) ) ( not ( = ?auto_477187 ?auto_477189 ) ) ( not ( = ?auto_477187 ?auto_477190 ) ) ( not ( = ?auto_477187 ?auto_477191 ) ) ( not ( = ?auto_477187 ?auto_477192 ) ) ( not ( = ?auto_477188 ?auto_477189 ) ) ( not ( = ?auto_477188 ?auto_477190 ) ) ( not ( = ?auto_477188 ?auto_477191 ) ) ( not ( = ?auto_477188 ?auto_477192 ) ) ( not ( = ?auto_477189 ?auto_477190 ) ) ( not ( = ?auto_477189 ?auto_477191 ) ) ( not ( = ?auto_477189 ?auto_477192 ) ) ( not ( = ?auto_477190 ?auto_477191 ) ) ( not ( = ?auto_477190 ?auto_477192 ) ) ( not ( = ?auto_477191 ?auto_477192 ) ) ( ON ?auto_477191 ?auto_477192 ) ( ON ?auto_477190 ?auto_477191 ) ( ON ?auto_477189 ?auto_477190 ) ( ON ?auto_477188 ?auto_477189 ) ( ON ?auto_477187 ?auto_477188 ) ( ON ?auto_477186 ?auto_477187 ) ( ON ?auto_477185 ?auto_477186 ) ( ON ?auto_477184 ?auto_477185 ) ( ON ?auto_477183 ?auto_477184 ) ( ON ?auto_477182 ?auto_477183 ) ( CLEAR ?auto_477180 ) ( ON ?auto_477181 ?auto_477182 ) ( CLEAR ?auto_477181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_477177 ?auto_477178 ?auto_477179 ?auto_477180 ?auto_477181 )
      ( MAKE-16PILE ?auto_477177 ?auto_477178 ?auto_477179 ?auto_477180 ?auto_477181 ?auto_477182 ?auto_477183 ?auto_477184 ?auto_477185 ?auto_477186 ?auto_477187 ?auto_477188 ?auto_477189 ?auto_477190 ?auto_477191 ?auto_477192 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477209 - BLOCK
      ?auto_477210 - BLOCK
      ?auto_477211 - BLOCK
      ?auto_477212 - BLOCK
      ?auto_477213 - BLOCK
      ?auto_477214 - BLOCK
      ?auto_477215 - BLOCK
      ?auto_477216 - BLOCK
      ?auto_477217 - BLOCK
      ?auto_477218 - BLOCK
      ?auto_477219 - BLOCK
      ?auto_477220 - BLOCK
      ?auto_477221 - BLOCK
      ?auto_477222 - BLOCK
      ?auto_477223 - BLOCK
      ?auto_477224 - BLOCK
    )
    :vars
    (
      ?auto_477225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477224 ?auto_477225 ) ( ON-TABLE ?auto_477209 ) ( ON ?auto_477210 ?auto_477209 ) ( ON ?auto_477211 ?auto_477210 ) ( not ( = ?auto_477209 ?auto_477210 ) ) ( not ( = ?auto_477209 ?auto_477211 ) ) ( not ( = ?auto_477209 ?auto_477212 ) ) ( not ( = ?auto_477209 ?auto_477213 ) ) ( not ( = ?auto_477209 ?auto_477214 ) ) ( not ( = ?auto_477209 ?auto_477215 ) ) ( not ( = ?auto_477209 ?auto_477216 ) ) ( not ( = ?auto_477209 ?auto_477217 ) ) ( not ( = ?auto_477209 ?auto_477218 ) ) ( not ( = ?auto_477209 ?auto_477219 ) ) ( not ( = ?auto_477209 ?auto_477220 ) ) ( not ( = ?auto_477209 ?auto_477221 ) ) ( not ( = ?auto_477209 ?auto_477222 ) ) ( not ( = ?auto_477209 ?auto_477223 ) ) ( not ( = ?auto_477209 ?auto_477224 ) ) ( not ( = ?auto_477209 ?auto_477225 ) ) ( not ( = ?auto_477210 ?auto_477211 ) ) ( not ( = ?auto_477210 ?auto_477212 ) ) ( not ( = ?auto_477210 ?auto_477213 ) ) ( not ( = ?auto_477210 ?auto_477214 ) ) ( not ( = ?auto_477210 ?auto_477215 ) ) ( not ( = ?auto_477210 ?auto_477216 ) ) ( not ( = ?auto_477210 ?auto_477217 ) ) ( not ( = ?auto_477210 ?auto_477218 ) ) ( not ( = ?auto_477210 ?auto_477219 ) ) ( not ( = ?auto_477210 ?auto_477220 ) ) ( not ( = ?auto_477210 ?auto_477221 ) ) ( not ( = ?auto_477210 ?auto_477222 ) ) ( not ( = ?auto_477210 ?auto_477223 ) ) ( not ( = ?auto_477210 ?auto_477224 ) ) ( not ( = ?auto_477210 ?auto_477225 ) ) ( not ( = ?auto_477211 ?auto_477212 ) ) ( not ( = ?auto_477211 ?auto_477213 ) ) ( not ( = ?auto_477211 ?auto_477214 ) ) ( not ( = ?auto_477211 ?auto_477215 ) ) ( not ( = ?auto_477211 ?auto_477216 ) ) ( not ( = ?auto_477211 ?auto_477217 ) ) ( not ( = ?auto_477211 ?auto_477218 ) ) ( not ( = ?auto_477211 ?auto_477219 ) ) ( not ( = ?auto_477211 ?auto_477220 ) ) ( not ( = ?auto_477211 ?auto_477221 ) ) ( not ( = ?auto_477211 ?auto_477222 ) ) ( not ( = ?auto_477211 ?auto_477223 ) ) ( not ( = ?auto_477211 ?auto_477224 ) ) ( not ( = ?auto_477211 ?auto_477225 ) ) ( not ( = ?auto_477212 ?auto_477213 ) ) ( not ( = ?auto_477212 ?auto_477214 ) ) ( not ( = ?auto_477212 ?auto_477215 ) ) ( not ( = ?auto_477212 ?auto_477216 ) ) ( not ( = ?auto_477212 ?auto_477217 ) ) ( not ( = ?auto_477212 ?auto_477218 ) ) ( not ( = ?auto_477212 ?auto_477219 ) ) ( not ( = ?auto_477212 ?auto_477220 ) ) ( not ( = ?auto_477212 ?auto_477221 ) ) ( not ( = ?auto_477212 ?auto_477222 ) ) ( not ( = ?auto_477212 ?auto_477223 ) ) ( not ( = ?auto_477212 ?auto_477224 ) ) ( not ( = ?auto_477212 ?auto_477225 ) ) ( not ( = ?auto_477213 ?auto_477214 ) ) ( not ( = ?auto_477213 ?auto_477215 ) ) ( not ( = ?auto_477213 ?auto_477216 ) ) ( not ( = ?auto_477213 ?auto_477217 ) ) ( not ( = ?auto_477213 ?auto_477218 ) ) ( not ( = ?auto_477213 ?auto_477219 ) ) ( not ( = ?auto_477213 ?auto_477220 ) ) ( not ( = ?auto_477213 ?auto_477221 ) ) ( not ( = ?auto_477213 ?auto_477222 ) ) ( not ( = ?auto_477213 ?auto_477223 ) ) ( not ( = ?auto_477213 ?auto_477224 ) ) ( not ( = ?auto_477213 ?auto_477225 ) ) ( not ( = ?auto_477214 ?auto_477215 ) ) ( not ( = ?auto_477214 ?auto_477216 ) ) ( not ( = ?auto_477214 ?auto_477217 ) ) ( not ( = ?auto_477214 ?auto_477218 ) ) ( not ( = ?auto_477214 ?auto_477219 ) ) ( not ( = ?auto_477214 ?auto_477220 ) ) ( not ( = ?auto_477214 ?auto_477221 ) ) ( not ( = ?auto_477214 ?auto_477222 ) ) ( not ( = ?auto_477214 ?auto_477223 ) ) ( not ( = ?auto_477214 ?auto_477224 ) ) ( not ( = ?auto_477214 ?auto_477225 ) ) ( not ( = ?auto_477215 ?auto_477216 ) ) ( not ( = ?auto_477215 ?auto_477217 ) ) ( not ( = ?auto_477215 ?auto_477218 ) ) ( not ( = ?auto_477215 ?auto_477219 ) ) ( not ( = ?auto_477215 ?auto_477220 ) ) ( not ( = ?auto_477215 ?auto_477221 ) ) ( not ( = ?auto_477215 ?auto_477222 ) ) ( not ( = ?auto_477215 ?auto_477223 ) ) ( not ( = ?auto_477215 ?auto_477224 ) ) ( not ( = ?auto_477215 ?auto_477225 ) ) ( not ( = ?auto_477216 ?auto_477217 ) ) ( not ( = ?auto_477216 ?auto_477218 ) ) ( not ( = ?auto_477216 ?auto_477219 ) ) ( not ( = ?auto_477216 ?auto_477220 ) ) ( not ( = ?auto_477216 ?auto_477221 ) ) ( not ( = ?auto_477216 ?auto_477222 ) ) ( not ( = ?auto_477216 ?auto_477223 ) ) ( not ( = ?auto_477216 ?auto_477224 ) ) ( not ( = ?auto_477216 ?auto_477225 ) ) ( not ( = ?auto_477217 ?auto_477218 ) ) ( not ( = ?auto_477217 ?auto_477219 ) ) ( not ( = ?auto_477217 ?auto_477220 ) ) ( not ( = ?auto_477217 ?auto_477221 ) ) ( not ( = ?auto_477217 ?auto_477222 ) ) ( not ( = ?auto_477217 ?auto_477223 ) ) ( not ( = ?auto_477217 ?auto_477224 ) ) ( not ( = ?auto_477217 ?auto_477225 ) ) ( not ( = ?auto_477218 ?auto_477219 ) ) ( not ( = ?auto_477218 ?auto_477220 ) ) ( not ( = ?auto_477218 ?auto_477221 ) ) ( not ( = ?auto_477218 ?auto_477222 ) ) ( not ( = ?auto_477218 ?auto_477223 ) ) ( not ( = ?auto_477218 ?auto_477224 ) ) ( not ( = ?auto_477218 ?auto_477225 ) ) ( not ( = ?auto_477219 ?auto_477220 ) ) ( not ( = ?auto_477219 ?auto_477221 ) ) ( not ( = ?auto_477219 ?auto_477222 ) ) ( not ( = ?auto_477219 ?auto_477223 ) ) ( not ( = ?auto_477219 ?auto_477224 ) ) ( not ( = ?auto_477219 ?auto_477225 ) ) ( not ( = ?auto_477220 ?auto_477221 ) ) ( not ( = ?auto_477220 ?auto_477222 ) ) ( not ( = ?auto_477220 ?auto_477223 ) ) ( not ( = ?auto_477220 ?auto_477224 ) ) ( not ( = ?auto_477220 ?auto_477225 ) ) ( not ( = ?auto_477221 ?auto_477222 ) ) ( not ( = ?auto_477221 ?auto_477223 ) ) ( not ( = ?auto_477221 ?auto_477224 ) ) ( not ( = ?auto_477221 ?auto_477225 ) ) ( not ( = ?auto_477222 ?auto_477223 ) ) ( not ( = ?auto_477222 ?auto_477224 ) ) ( not ( = ?auto_477222 ?auto_477225 ) ) ( not ( = ?auto_477223 ?auto_477224 ) ) ( not ( = ?auto_477223 ?auto_477225 ) ) ( not ( = ?auto_477224 ?auto_477225 ) ) ( ON ?auto_477223 ?auto_477224 ) ( ON ?auto_477222 ?auto_477223 ) ( ON ?auto_477221 ?auto_477222 ) ( ON ?auto_477220 ?auto_477221 ) ( ON ?auto_477219 ?auto_477220 ) ( ON ?auto_477218 ?auto_477219 ) ( ON ?auto_477217 ?auto_477218 ) ( ON ?auto_477216 ?auto_477217 ) ( ON ?auto_477215 ?auto_477216 ) ( ON ?auto_477214 ?auto_477215 ) ( ON ?auto_477213 ?auto_477214 ) ( CLEAR ?auto_477211 ) ( ON ?auto_477212 ?auto_477213 ) ( CLEAR ?auto_477212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_477209 ?auto_477210 ?auto_477211 ?auto_477212 )
      ( MAKE-16PILE ?auto_477209 ?auto_477210 ?auto_477211 ?auto_477212 ?auto_477213 ?auto_477214 ?auto_477215 ?auto_477216 ?auto_477217 ?auto_477218 ?auto_477219 ?auto_477220 ?auto_477221 ?auto_477222 ?auto_477223 ?auto_477224 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477242 - BLOCK
      ?auto_477243 - BLOCK
      ?auto_477244 - BLOCK
      ?auto_477245 - BLOCK
      ?auto_477246 - BLOCK
      ?auto_477247 - BLOCK
      ?auto_477248 - BLOCK
      ?auto_477249 - BLOCK
      ?auto_477250 - BLOCK
      ?auto_477251 - BLOCK
      ?auto_477252 - BLOCK
      ?auto_477253 - BLOCK
      ?auto_477254 - BLOCK
      ?auto_477255 - BLOCK
      ?auto_477256 - BLOCK
      ?auto_477257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477257 ) ( ON-TABLE ?auto_477242 ) ( ON ?auto_477243 ?auto_477242 ) ( ON ?auto_477244 ?auto_477243 ) ( not ( = ?auto_477242 ?auto_477243 ) ) ( not ( = ?auto_477242 ?auto_477244 ) ) ( not ( = ?auto_477242 ?auto_477245 ) ) ( not ( = ?auto_477242 ?auto_477246 ) ) ( not ( = ?auto_477242 ?auto_477247 ) ) ( not ( = ?auto_477242 ?auto_477248 ) ) ( not ( = ?auto_477242 ?auto_477249 ) ) ( not ( = ?auto_477242 ?auto_477250 ) ) ( not ( = ?auto_477242 ?auto_477251 ) ) ( not ( = ?auto_477242 ?auto_477252 ) ) ( not ( = ?auto_477242 ?auto_477253 ) ) ( not ( = ?auto_477242 ?auto_477254 ) ) ( not ( = ?auto_477242 ?auto_477255 ) ) ( not ( = ?auto_477242 ?auto_477256 ) ) ( not ( = ?auto_477242 ?auto_477257 ) ) ( not ( = ?auto_477243 ?auto_477244 ) ) ( not ( = ?auto_477243 ?auto_477245 ) ) ( not ( = ?auto_477243 ?auto_477246 ) ) ( not ( = ?auto_477243 ?auto_477247 ) ) ( not ( = ?auto_477243 ?auto_477248 ) ) ( not ( = ?auto_477243 ?auto_477249 ) ) ( not ( = ?auto_477243 ?auto_477250 ) ) ( not ( = ?auto_477243 ?auto_477251 ) ) ( not ( = ?auto_477243 ?auto_477252 ) ) ( not ( = ?auto_477243 ?auto_477253 ) ) ( not ( = ?auto_477243 ?auto_477254 ) ) ( not ( = ?auto_477243 ?auto_477255 ) ) ( not ( = ?auto_477243 ?auto_477256 ) ) ( not ( = ?auto_477243 ?auto_477257 ) ) ( not ( = ?auto_477244 ?auto_477245 ) ) ( not ( = ?auto_477244 ?auto_477246 ) ) ( not ( = ?auto_477244 ?auto_477247 ) ) ( not ( = ?auto_477244 ?auto_477248 ) ) ( not ( = ?auto_477244 ?auto_477249 ) ) ( not ( = ?auto_477244 ?auto_477250 ) ) ( not ( = ?auto_477244 ?auto_477251 ) ) ( not ( = ?auto_477244 ?auto_477252 ) ) ( not ( = ?auto_477244 ?auto_477253 ) ) ( not ( = ?auto_477244 ?auto_477254 ) ) ( not ( = ?auto_477244 ?auto_477255 ) ) ( not ( = ?auto_477244 ?auto_477256 ) ) ( not ( = ?auto_477244 ?auto_477257 ) ) ( not ( = ?auto_477245 ?auto_477246 ) ) ( not ( = ?auto_477245 ?auto_477247 ) ) ( not ( = ?auto_477245 ?auto_477248 ) ) ( not ( = ?auto_477245 ?auto_477249 ) ) ( not ( = ?auto_477245 ?auto_477250 ) ) ( not ( = ?auto_477245 ?auto_477251 ) ) ( not ( = ?auto_477245 ?auto_477252 ) ) ( not ( = ?auto_477245 ?auto_477253 ) ) ( not ( = ?auto_477245 ?auto_477254 ) ) ( not ( = ?auto_477245 ?auto_477255 ) ) ( not ( = ?auto_477245 ?auto_477256 ) ) ( not ( = ?auto_477245 ?auto_477257 ) ) ( not ( = ?auto_477246 ?auto_477247 ) ) ( not ( = ?auto_477246 ?auto_477248 ) ) ( not ( = ?auto_477246 ?auto_477249 ) ) ( not ( = ?auto_477246 ?auto_477250 ) ) ( not ( = ?auto_477246 ?auto_477251 ) ) ( not ( = ?auto_477246 ?auto_477252 ) ) ( not ( = ?auto_477246 ?auto_477253 ) ) ( not ( = ?auto_477246 ?auto_477254 ) ) ( not ( = ?auto_477246 ?auto_477255 ) ) ( not ( = ?auto_477246 ?auto_477256 ) ) ( not ( = ?auto_477246 ?auto_477257 ) ) ( not ( = ?auto_477247 ?auto_477248 ) ) ( not ( = ?auto_477247 ?auto_477249 ) ) ( not ( = ?auto_477247 ?auto_477250 ) ) ( not ( = ?auto_477247 ?auto_477251 ) ) ( not ( = ?auto_477247 ?auto_477252 ) ) ( not ( = ?auto_477247 ?auto_477253 ) ) ( not ( = ?auto_477247 ?auto_477254 ) ) ( not ( = ?auto_477247 ?auto_477255 ) ) ( not ( = ?auto_477247 ?auto_477256 ) ) ( not ( = ?auto_477247 ?auto_477257 ) ) ( not ( = ?auto_477248 ?auto_477249 ) ) ( not ( = ?auto_477248 ?auto_477250 ) ) ( not ( = ?auto_477248 ?auto_477251 ) ) ( not ( = ?auto_477248 ?auto_477252 ) ) ( not ( = ?auto_477248 ?auto_477253 ) ) ( not ( = ?auto_477248 ?auto_477254 ) ) ( not ( = ?auto_477248 ?auto_477255 ) ) ( not ( = ?auto_477248 ?auto_477256 ) ) ( not ( = ?auto_477248 ?auto_477257 ) ) ( not ( = ?auto_477249 ?auto_477250 ) ) ( not ( = ?auto_477249 ?auto_477251 ) ) ( not ( = ?auto_477249 ?auto_477252 ) ) ( not ( = ?auto_477249 ?auto_477253 ) ) ( not ( = ?auto_477249 ?auto_477254 ) ) ( not ( = ?auto_477249 ?auto_477255 ) ) ( not ( = ?auto_477249 ?auto_477256 ) ) ( not ( = ?auto_477249 ?auto_477257 ) ) ( not ( = ?auto_477250 ?auto_477251 ) ) ( not ( = ?auto_477250 ?auto_477252 ) ) ( not ( = ?auto_477250 ?auto_477253 ) ) ( not ( = ?auto_477250 ?auto_477254 ) ) ( not ( = ?auto_477250 ?auto_477255 ) ) ( not ( = ?auto_477250 ?auto_477256 ) ) ( not ( = ?auto_477250 ?auto_477257 ) ) ( not ( = ?auto_477251 ?auto_477252 ) ) ( not ( = ?auto_477251 ?auto_477253 ) ) ( not ( = ?auto_477251 ?auto_477254 ) ) ( not ( = ?auto_477251 ?auto_477255 ) ) ( not ( = ?auto_477251 ?auto_477256 ) ) ( not ( = ?auto_477251 ?auto_477257 ) ) ( not ( = ?auto_477252 ?auto_477253 ) ) ( not ( = ?auto_477252 ?auto_477254 ) ) ( not ( = ?auto_477252 ?auto_477255 ) ) ( not ( = ?auto_477252 ?auto_477256 ) ) ( not ( = ?auto_477252 ?auto_477257 ) ) ( not ( = ?auto_477253 ?auto_477254 ) ) ( not ( = ?auto_477253 ?auto_477255 ) ) ( not ( = ?auto_477253 ?auto_477256 ) ) ( not ( = ?auto_477253 ?auto_477257 ) ) ( not ( = ?auto_477254 ?auto_477255 ) ) ( not ( = ?auto_477254 ?auto_477256 ) ) ( not ( = ?auto_477254 ?auto_477257 ) ) ( not ( = ?auto_477255 ?auto_477256 ) ) ( not ( = ?auto_477255 ?auto_477257 ) ) ( not ( = ?auto_477256 ?auto_477257 ) ) ( ON ?auto_477256 ?auto_477257 ) ( ON ?auto_477255 ?auto_477256 ) ( ON ?auto_477254 ?auto_477255 ) ( ON ?auto_477253 ?auto_477254 ) ( ON ?auto_477252 ?auto_477253 ) ( ON ?auto_477251 ?auto_477252 ) ( ON ?auto_477250 ?auto_477251 ) ( ON ?auto_477249 ?auto_477250 ) ( ON ?auto_477248 ?auto_477249 ) ( ON ?auto_477247 ?auto_477248 ) ( ON ?auto_477246 ?auto_477247 ) ( CLEAR ?auto_477244 ) ( ON ?auto_477245 ?auto_477246 ) ( CLEAR ?auto_477245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_477242 ?auto_477243 ?auto_477244 ?auto_477245 )
      ( MAKE-16PILE ?auto_477242 ?auto_477243 ?auto_477244 ?auto_477245 ?auto_477246 ?auto_477247 ?auto_477248 ?auto_477249 ?auto_477250 ?auto_477251 ?auto_477252 ?auto_477253 ?auto_477254 ?auto_477255 ?auto_477256 ?auto_477257 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477274 - BLOCK
      ?auto_477275 - BLOCK
      ?auto_477276 - BLOCK
      ?auto_477277 - BLOCK
      ?auto_477278 - BLOCK
      ?auto_477279 - BLOCK
      ?auto_477280 - BLOCK
      ?auto_477281 - BLOCK
      ?auto_477282 - BLOCK
      ?auto_477283 - BLOCK
      ?auto_477284 - BLOCK
      ?auto_477285 - BLOCK
      ?auto_477286 - BLOCK
      ?auto_477287 - BLOCK
      ?auto_477288 - BLOCK
      ?auto_477289 - BLOCK
    )
    :vars
    (
      ?auto_477290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477289 ?auto_477290 ) ( ON-TABLE ?auto_477274 ) ( ON ?auto_477275 ?auto_477274 ) ( not ( = ?auto_477274 ?auto_477275 ) ) ( not ( = ?auto_477274 ?auto_477276 ) ) ( not ( = ?auto_477274 ?auto_477277 ) ) ( not ( = ?auto_477274 ?auto_477278 ) ) ( not ( = ?auto_477274 ?auto_477279 ) ) ( not ( = ?auto_477274 ?auto_477280 ) ) ( not ( = ?auto_477274 ?auto_477281 ) ) ( not ( = ?auto_477274 ?auto_477282 ) ) ( not ( = ?auto_477274 ?auto_477283 ) ) ( not ( = ?auto_477274 ?auto_477284 ) ) ( not ( = ?auto_477274 ?auto_477285 ) ) ( not ( = ?auto_477274 ?auto_477286 ) ) ( not ( = ?auto_477274 ?auto_477287 ) ) ( not ( = ?auto_477274 ?auto_477288 ) ) ( not ( = ?auto_477274 ?auto_477289 ) ) ( not ( = ?auto_477274 ?auto_477290 ) ) ( not ( = ?auto_477275 ?auto_477276 ) ) ( not ( = ?auto_477275 ?auto_477277 ) ) ( not ( = ?auto_477275 ?auto_477278 ) ) ( not ( = ?auto_477275 ?auto_477279 ) ) ( not ( = ?auto_477275 ?auto_477280 ) ) ( not ( = ?auto_477275 ?auto_477281 ) ) ( not ( = ?auto_477275 ?auto_477282 ) ) ( not ( = ?auto_477275 ?auto_477283 ) ) ( not ( = ?auto_477275 ?auto_477284 ) ) ( not ( = ?auto_477275 ?auto_477285 ) ) ( not ( = ?auto_477275 ?auto_477286 ) ) ( not ( = ?auto_477275 ?auto_477287 ) ) ( not ( = ?auto_477275 ?auto_477288 ) ) ( not ( = ?auto_477275 ?auto_477289 ) ) ( not ( = ?auto_477275 ?auto_477290 ) ) ( not ( = ?auto_477276 ?auto_477277 ) ) ( not ( = ?auto_477276 ?auto_477278 ) ) ( not ( = ?auto_477276 ?auto_477279 ) ) ( not ( = ?auto_477276 ?auto_477280 ) ) ( not ( = ?auto_477276 ?auto_477281 ) ) ( not ( = ?auto_477276 ?auto_477282 ) ) ( not ( = ?auto_477276 ?auto_477283 ) ) ( not ( = ?auto_477276 ?auto_477284 ) ) ( not ( = ?auto_477276 ?auto_477285 ) ) ( not ( = ?auto_477276 ?auto_477286 ) ) ( not ( = ?auto_477276 ?auto_477287 ) ) ( not ( = ?auto_477276 ?auto_477288 ) ) ( not ( = ?auto_477276 ?auto_477289 ) ) ( not ( = ?auto_477276 ?auto_477290 ) ) ( not ( = ?auto_477277 ?auto_477278 ) ) ( not ( = ?auto_477277 ?auto_477279 ) ) ( not ( = ?auto_477277 ?auto_477280 ) ) ( not ( = ?auto_477277 ?auto_477281 ) ) ( not ( = ?auto_477277 ?auto_477282 ) ) ( not ( = ?auto_477277 ?auto_477283 ) ) ( not ( = ?auto_477277 ?auto_477284 ) ) ( not ( = ?auto_477277 ?auto_477285 ) ) ( not ( = ?auto_477277 ?auto_477286 ) ) ( not ( = ?auto_477277 ?auto_477287 ) ) ( not ( = ?auto_477277 ?auto_477288 ) ) ( not ( = ?auto_477277 ?auto_477289 ) ) ( not ( = ?auto_477277 ?auto_477290 ) ) ( not ( = ?auto_477278 ?auto_477279 ) ) ( not ( = ?auto_477278 ?auto_477280 ) ) ( not ( = ?auto_477278 ?auto_477281 ) ) ( not ( = ?auto_477278 ?auto_477282 ) ) ( not ( = ?auto_477278 ?auto_477283 ) ) ( not ( = ?auto_477278 ?auto_477284 ) ) ( not ( = ?auto_477278 ?auto_477285 ) ) ( not ( = ?auto_477278 ?auto_477286 ) ) ( not ( = ?auto_477278 ?auto_477287 ) ) ( not ( = ?auto_477278 ?auto_477288 ) ) ( not ( = ?auto_477278 ?auto_477289 ) ) ( not ( = ?auto_477278 ?auto_477290 ) ) ( not ( = ?auto_477279 ?auto_477280 ) ) ( not ( = ?auto_477279 ?auto_477281 ) ) ( not ( = ?auto_477279 ?auto_477282 ) ) ( not ( = ?auto_477279 ?auto_477283 ) ) ( not ( = ?auto_477279 ?auto_477284 ) ) ( not ( = ?auto_477279 ?auto_477285 ) ) ( not ( = ?auto_477279 ?auto_477286 ) ) ( not ( = ?auto_477279 ?auto_477287 ) ) ( not ( = ?auto_477279 ?auto_477288 ) ) ( not ( = ?auto_477279 ?auto_477289 ) ) ( not ( = ?auto_477279 ?auto_477290 ) ) ( not ( = ?auto_477280 ?auto_477281 ) ) ( not ( = ?auto_477280 ?auto_477282 ) ) ( not ( = ?auto_477280 ?auto_477283 ) ) ( not ( = ?auto_477280 ?auto_477284 ) ) ( not ( = ?auto_477280 ?auto_477285 ) ) ( not ( = ?auto_477280 ?auto_477286 ) ) ( not ( = ?auto_477280 ?auto_477287 ) ) ( not ( = ?auto_477280 ?auto_477288 ) ) ( not ( = ?auto_477280 ?auto_477289 ) ) ( not ( = ?auto_477280 ?auto_477290 ) ) ( not ( = ?auto_477281 ?auto_477282 ) ) ( not ( = ?auto_477281 ?auto_477283 ) ) ( not ( = ?auto_477281 ?auto_477284 ) ) ( not ( = ?auto_477281 ?auto_477285 ) ) ( not ( = ?auto_477281 ?auto_477286 ) ) ( not ( = ?auto_477281 ?auto_477287 ) ) ( not ( = ?auto_477281 ?auto_477288 ) ) ( not ( = ?auto_477281 ?auto_477289 ) ) ( not ( = ?auto_477281 ?auto_477290 ) ) ( not ( = ?auto_477282 ?auto_477283 ) ) ( not ( = ?auto_477282 ?auto_477284 ) ) ( not ( = ?auto_477282 ?auto_477285 ) ) ( not ( = ?auto_477282 ?auto_477286 ) ) ( not ( = ?auto_477282 ?auto_477287 ) ) ( not ( = ?auto_477282 ?auto_477288 ) ) ( not ( = ?auto_477282 ?auto_477289 ) ) ( not ( = ?auto_477282 ?auto_477290 ) ) ( not ( = ?auto_477283 ?auto_477284 ) ) ( not ( = ?auto_477283 ?auto_477285 ) ) ( not ( = ?auto_477283 ?auto_477286 ) ) ( not ( = ?auto_477283 ?auto_477287 ) ) ( not ( = ?auto_477283 ?auto_477288 ) ) ( not ( = ?auto_477283 ?auto_477289 ) ) ( not ( = ?auto_477283 ?auto_477290 ) ) ( not ( = ?auto_477284 ?auto_477285 ) ) ( not ( = ?auto_477284 ?auto_477286 ) ) ( not ( = ?auto_477284 ?auto_477287 ) ) ( not ( = ?auto_477284 ?auto_477288 ) ) ( not ( = ?auto_477284 ?auto_477289 ) ) ( not ( = ?auto_477284 ?auto_477290 ) ) ( not ( = ?auto_477285 ?auto_477286 ) ) ( not ( = ?auto_477285 ?auto_477287 ) ) ( not ( = ?auto_477285 ?auto_477288 ) ) ( not ( = ?auto_477285 ?auto_477289 ) ) ( not ( = ?auto_477285 ?auto_477290 ) ) ( not ( = ?auto_477286 ?auto_477287 ) ) ( not ( = ?auto_477286 ?auto_477288 ) ) ( not ( = ?auto_477286 ?auto_477289 ) ) ( not ( = ?auto_477286 ?auto_477290 ) ) ( not ( = ?auto_477287 ?auto_477288 ) ) ( not ( = ?auto_477287 ?auto_477289 ) ) ( not ( = ?auto_477287 ?auto_477290 ) ) ( not ( = ?auto_477288 ?auto_477289 ) ) ( not ( = ?auto_477288 ?auto_477290 ) ) ( not ( = ?auto_477289 ?auto_477290 ) ) ( ON ?auto_477288 ?auto_477289 ) ( ON ?auto_477287 ?auto_477288 ) ( ON ?auto_477286 ?auto_477287 ) ( ON ?auto_477285 ?auto_477286 ) ( ON ?auto_477284 ?auto_477285 ) ( ON ?auto_477283 ?auto_477284 ) ( ON ?auto_477282 ?auto_477283 ) ( ON ?auto_477281 ?auto_477282 ) ( ON ?auto_477280 ?auto_477281 ) ( ON ?auto_477279 ?auto_477280 ) ( ON ?auto_477278 ?auto_477279 ) ( ON ?auto_477277 ?auto_477278 ) ( CLEAR ?auto_477275 ) ( ON ?auto_477276 ?auto_477277 ) ( CLEAR ?auto_477276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_477274 ?auto_477275 ?auto_477276 )
      ( MAKE-16PILE ?auto_477274 ?auto_477275 ?auto_477276 ?auto_477277 ?auto_477278 ?auto_477279 ?auto_477280 ?auto_477281 ?auto_477282 ?auto_477283 ?auto_477284 ?auto_477285 ?auto_477286 ?auto_477287 ?auto_477288 ?auto_477289 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477307 - BLOCK
      ?auto_477308 - BLOCK
      ?auto_477309 - BLOCK
      ?auto_477310 - BLOCK
      ?auto_477311 - BLOCK
      ?auto_477312 - BLOCK
      ?auto_477313 - BLOCK
      ?auto_477314 - BLOCK
      ?auto_477315 - BLOCK
      ?auto_477316 - BLOCK
      ?auto_477317 - BLOCK
      ?auto_477318 - BLOCK
      ?auto_477319 - BLOCK
      ?auto_477320 - BLOCK
      ?auto_477321 - BLOCK
      ?auto_477322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477322 ) ( ON-TABLE ?auto_477307 ) ( ON ?auto_477308 ?auto_477307 ) ( not ( = ?auto_477307 ?auto_477308 ) ) ( not ( = ?auto_477307 ?auto_477309 ) ) ( not ( = ?auto_477307 ?auto_477310 ) ) ( not ( = ?auto_477307 ?auto_477311 ) ) ( not ( = ?auto_477307 ?auto_477312 ) ) ( not ( = ?auto_477307 ?auto_477313 ) ) ( not ( = ?auto_477307 ?auto_477314 ) ) ( not ( = ?auto_477307 ?auto_477315 ) ) ( not ( = ?auto_477307 ?auto_477316 ) ) ( not ( = ?auto_477307 ?auto_477317 ) ) ( not ( = ?auto_477307 ?auto_477318 ) ) ( not ( = ?auto_477307 ?auto_477319 ) ) ( not ( = ?auto_477307 ?auto_477320 ) ) ( not ( = ?auto_477307 ?auto_477321 ) ) ( not ( = ?auto_477307 ?auto_477322 ) ) ( not ( = ?auto_477308 ?auto_477309 ) ) ( not ( = ?auto_477308 ?auto_477310 ) ) ( not ( = ?auto_477308 ?auto_477311 ) ) ( not ( = ?auto_477308 ?auto_477312 ) ) ( not ( = ?auto_477308 ?auto_477313 ) ) ( not ( = ?auto_477308 ?auto_477314 ) ) ( not ( = ?auto_477308 ?auto_477315 ) ) ( not ( = ?auto_477308 ?auto_477316 ) ) ( not ( = ?auto_477308 ?auto_477317 ) ) ( not ( = ?auto_477308 ?auto_477318 ) ) ( not ( = ?auto_477308 ?auto_477319 ) ) ( not ( = ?auto_477308 ?auto_477320 ) ) ( not ( = ?auto_477308 ?auto_477321 ) ) ( not ( = ?auto_477308 ?auto_477322 ) ) ( not ( = ?auto_477309 ?auto_477310 ) ) ( not ( = ?auto_477309 ?auto_477311 ) ) ( not ( = ?auto_477309 ?auto_477312 ) ) ( not ( = ?auto_477309 ?auto_477313 ) ) ( not ( = ?auto_477309 ?auto_477314 ) ) ( not ( = ?auto_477309 ?auto_477315 ) ) ( not ( = ?auto_477309 ?auto_477316 ) ) ( not ( = ?auto_477309 ?auto_477317 ) ) ( not ( = ?auto_477309 ?auto_477318 ) ) ( not ( = ?auto_477309 ?auto_477319 ) ) ( not ( = ?auto_477309 ?auto_477320 ) ) ( not ( = ?auto_477309 ?auto_477321 ) ) ( not ( = ?auto_477309 ?auto_477322 ) ) ( not ( = ?auto_477310 ?auto_477311 ) ) ( not ( = ?auto_477310 ?auto_477312 ) ) ( not ( = ?auto_477310 ?auto_477313 ) ) ( not ( = ?auto_477310 ?auto_477314 ) ) ( not ( = ?auto_477310 ?auto_477315 ) ) ( not ( = ?auto_477310 ?auto_477316 ) ) ( not ( = ?auto_477310 ?auto_477317 ) ) ( not ( = ?auto_477310 ?auto_477318 ) ) ( not ( = ?auto_477310 ?auto_477319 ) ) ( not ( = ?auto_477310 ?auto_477320 ) ) ( not ( = ?auto_477310 ?auto_477321 ) ) ( not ( = ?auto_477310 ?auto_477322 ) ) ( not ( = ?auto_477311 ?auto_477312 ) ) ( not ( = ?auto_477311 ?auto_477313 ) ) ( not ( = ?auto_477311 ?auto_477314 ) ) ( not ( = ?auto_477311 ?auto_477315 ) ) ( not ( = ?auto_477311 ?auto_477316 ) ) ( not ( = ?auto_477311 ?auto_477317 ) ) ( not ( = ?auto_477311 ?auto_477318 ) ) ( not ( = ?auto_477311 ?auto_477319 ) ) ( not ( = ?auto_477311 ?auto_477320 ) ) ( not ( = ?auto_477311 ?auto_477321 ) ) ( not ( = ?auto_477311 ?auto_477322 ) ) ( not ( = ?auto_477312 ?auto_477313 ) ) ( not ( = ?auto_477312 ?auto_477314 ) ) ( not ( = ?auto_477312 ?auto_477315 ) ) ( not ( = ?auto_477312 ?auto_477316 ) ) ( not ( = ?auto_477312 ?auto_477317 ) ) ( not ( = ?auto_477312 ?auto_477318 ) ) ( not ( = ?auto_477312 ?auto_477319 ) ) ( not ( = ?auto_477312 ?auto_477320 ) ) ( not ( = ?auto_477312 ?auto_477321 ) ) ( not ( = ?auto_477312 ?auto_477322 ) ) ( not ( = ?auto_477313 ?auto_477314 ) ) ( not ( = ?auto_477313 ?auto_477315 ) ) ( not ( = ?auto_477313 ?auto_477316 ) ) ( not ( = ?auto_477313 ?auto_477317 ) ) ( not ( = ?auto_477313 ?auto_477318 ) ) ( not ( = ?auto_477313 ?auto_477319 ) ) ( not ( = ?auto_477313 ?auto_477320 ) ) ( not ( = ?auto_477313 ?auto_477321 ) ) ( not ( = ?auto_477313 ?auto_477322 ) ) ( not ( = ?auto_477314 ?auto_477315 ) ) ( not ( = ?auto_477314 ?auto_477316 ) ) ( not ( = ?auto_477314 ?auto_477317 ) ) ( not ( = ?auto_477314 ?auto_477318 ) ) ( not ( = ?auto_477314 ?auto_477319 ) ) ( not ( = ?auto_477314 ?auto_477320 ) ) ( not ( = ?auto_477314 ?auto_477321 ) ) ( not ( = ?auto_477314 ?auto_477322 ) ) ( not ( = ?auto_477315 ?auto_477316 ) ) ( not ( = ?auto_477315 ?auto_477317 ) ) ( not ( = ?auto_477315 ?auto_477318 ) ) ( not ( = ?auto_477315 ?auto_477319 ) ) ( not ( = ?auto_477315 ?auto_477320 ) ) ( not ( = ?auto_477315 ?auto_477321 ) ) ( not ( = ?auto_477315 ?auto_477322 ) ) ( not ( = ?auto_477316 ?auto_477317 ) ) ( not ( = ?auto_477316 ?auto_477318 ) ) ( not ( = ?auto_477316 ?auto_477319 ) ) ( not ( = ?auto_477316 ?auto_477320 ) ) ( not ( = ?auto_477316 ?auto_477321 ) ) ( not ( = ?auto_477316 ?auto_477322 ) ) ( not ( = ?auto_477317 ?auto_477318 ) ) ( not ( = ?auto_477317 ?auto_477319 ) ) ( not ( = ?auto_477317 ?auto_477320 ) ) ( not ( = ?auto_477317 ?auto_477321 ) ) ( not ( = ?auto_477317 ?auto_477322 ) ) ( not ( = ?auto_477318 ?auto_477319 ) ) ( not ( = ?auto_477318 ?auto_477320 ) ) ( not ( = ?auto_477318 ?auto_477321 ) ) ( not ( = ?auto_477318 ?auto_477322 ) ) ( not ( = ?auto_477319 ?auto_477320 ) ) ( not ( = ?auto_477319 ?auto_477321 ) ) ( not ( = ?auto_477319 ?auto_477322 ) ) ( not ( = ?auto_477320 ?auto_477321 ) ) ( not ( = ?auto_477320 ?auto_477322 ) ) ( not ( = ?auto_477321 ?auto_477322 ) ) ( ON ?auto_477321 ?auto_477322 ) ( ON ?auto_477320 ?auto_477321 ) ( ON ?auto_477319 ?auto_477320 ) ( ON ?auto_477318 ?auto_477319 ) ( ON ?auto_477317 ?auto_477318 ) ( ON ?auto_477316 ?auto_477317 ) ( ON ?auto_477315 ?auto_477316 ) ( ON ?auto_477314 ?auto_477315 ) ( ON ?auto_477313 ?auto_477314 ) ( ON ?auto_477312 ?auto_477313 ) ( ON ?auto_477311 ?auto_477312 ) ( ON ?auto_477310 ?auto_477311 ) ( CLEAR ?auto_477308 ) ( ON ?auto_477309 ?auto_477310 ) ( CLEAR ?auto_477309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_477307 ?auto_477308 ?auto_477309 )
      ( MAKE-16PILE ?auto_477307 ?auto_477308 ?auto_477309 ?auto_477310 ?auto_477311 ?auto_477312 ?auto_477313 ?auto_477314 ?auto_477315 ?auto_477316 ?auto_477317 ?auto_477318 ?auto_477319 ?auto_477320 ?auto_477321 ?auto_477322 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477339 - BLOCK
      ?auto_477340 - BLOCK
      ?auto_477341 - BLOCK
      ?auto_477342 - BLOCK
      ?auto_477343 - BLOCK
      ?auto_477344 - BLOCK
      ?auto_477345 - BLOCK
      ?auto_477346 - BLOCK
      ?auto_477347 - BLOCK
      ?auto_477348 - BLOCK
      ?auto_477349 - BLOCK
      ?auto_477350 - BLOCK
      ?auto_477351 - BLOCK
      ?auto_477352 - BLOCK
      ?auto_477353 - BLOCK
      ?auto_477354 - BLOCK
    )
    :vars
    (
      ?auto_477355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477354 ?auto_477355 ) ( ON-TABLE ?auto_477339 ) ( not ( = ?auto_477339 ?auto_477340 ) ) ( not ( = ?auto_477339 ?auto_477341 ) ) ( not ( = ?auto_477339 ?auto_477342 ) ) ( not ( = ?auto_477339 ?auto_477343 ) ) ( not ( = ?auto_477339 ?auto_477344 ) ) ( not ( = ?auto_477339 ?auto_477345 ) ) ( not ( = ?auto_477339 ?auto_477346 ) ) ( not ( = ?auto_477339 ?auto_477347 ) ) ( not ( = ?auto_477339 ?auto_477348 ) ) ( not ( = ?auto_477339 ?auto_477349 ) ) ( not ( = ?auto_477339 ?auto_477350 ) ) ( not ( = ?auto_477339 ?auto_477351 ) ) ( not ( = ?auto_477339 ?auto_477352 ) ) ( not ( = ?auto_477339 ?auto_477353 ) ) ( not ( = ?auto_477339 ?auto_477354 ) ) ( not ( = ?auto_477339 ?auto_477355 ) ) ( not ( = ?auto_477340 ?auto_477341 ) ) ( not ( = ?auto_477340 ?auto_477342 ) ) ( not ( = ?auto_477340 ?auto_477343 ) ) ( not ( = ?auto_477340 ?auto_477344 ) ) ( not ( = ?auto_477340 ?auto_477345 ) ) ( not ( = ?auto_477340 ?auto_477346 ) ) ( not ( = ?auto_477340 ?auto_477347 ) ) ( not ( = ?auto_477340 ?auto_477348 ) ) ( not ( = ?auto_477340 ?auto_477349 ) ) ( not ( = ?auto_477340 ?auto_477350 ) ) ( not ( = ?auto_477340 ?auto_477351 ) ) ( not ( = ?auto_477340 ?auto_477352 ) ) ( not ( = ?auto_477340 ?auto_477353 ) ) ( not ( = ?auto_477340 ?auto_477354 ) ) ( not ( = ?auto_477340 ?auto_477355 ) ) ( not ( = ?auto_477341 ?auto_477342 ) ) ( not ( = ?auto_477341 ?auto_477343 ) ) ( not ( = ?auto_477341 ?auto_477344 ) ) ( not ( = ?auto_477341 ?auto_477345 ) ) ( not ( = ?auto_477341 ?auto_477346 ) ) ( not ( = ?auto_477341 ?auto_477347 ) ) ( not ( = ?auto_477341 ?auto_477348 ) ) ( not ( = ?auto_477341 ?auto_477349 ) ) ( not ( = ?auto_477341 ?auto_477350 ) ) ( not ( = ?auto_477341 ?auto_477351 ) ) ( not ( = ?auto_477341 ?auto_477352 ) ) ( not ( = ?auto_477341 ?auto_477353 ) ) ( not ( = ?auto_477341 ?auto_477354 ) ) ( not ( = ?auto_477341 ?auto_477355 ) ) ( not ( = ?auto_477342 ?auto_477343 ) ) ( not ( = ?auto_477342 ?auto_477344 ) ) ( not ( = ?auto_477342 ?auto_477345 ) ) ( not ( = ?auto_477342 ?auto_477346 ) ) ( not ( = ?auto_477342 ?auto_477347 ) ) ( not ( = ?auto_477342 ?auto_477348 ) ) ( not ( = ?auto_477342 ?auto_477349 ) ) ( not ( = ?auto_477342 ?auto_477350 ) ) ( not ( = ?auto_477342 ?auto_477351 ) ) ( not ( = ?auto_477342 ?auto_477352 ) ) ( not ( = ?auto_477342 ?auto_477353 ) ) ( not ( = ?auto_477342 ?auto_477354 ) ) ( not ( = ?auto_477342 ?auto_477355 ) ) ( not ( = ?auto_477343 ?auto_477344 ) ) ( not ( = ?auto_477343 ?auto_477345 ) ) ( not ( = ?auto_477343 ?auto_477346 ) ) ( not ( = ?auto_477343 ?auto_477347 ) ) ( not ( = ?auto_477343 ?auto_477348 ) ) ( not ( = ?auto_477343 ?auto_477349 ) ) ( not ( = ?auto_477343 ?auto_477350 ) ) ( not ( = ?auto_477343 ?auto_477351 ) ) ( not ( = ?auto_477343 ?auto_477352 ) ) ( not ( = ?auto_477343 ?auto_477353 ) ) ( not ( = ?auto_477343 ?auto_477354 ) ) ( not ( = ?auto_477343 ?auto_477355 ) ) ( not ( = ?auto_477344 ?auto_477345 ) ) ( not ( = ?auto_477344 ?auto_477346 ) ) ( not ( = ?auto_477344 ?auto_477347 ) ) ( not ( = ?auto_477344 ?auto_477348 ) ) ( not ( = ?auto_477344 ?auto_477349 ) ) ( not ( = ?auto_477344 ?auto_477350 ) ) ( not ( = ?auto_477344 ?auto_477351 ) ) ( not ( = ?auto_477344 ?auto_477352 ) ) ( not ( = ?auto_477344 ?auto_477353 ) ) ( not ( = ?auto_477344 ?auto_477354 ) ) ( not ( = ?auto_477344 ?auto_477355 ) ) ( not ( = ?auto_477345 ?auto_477346 ) ) ( not ( = ?auto_477345 ?auto_477347 ) ) ( not ( = ?auto_477345 ?auto_477348 ) ) ( not ( = ?auto_477345 ?auto_477349 ) ) ( not ( = ?auto_477345 ?auto_477350 ) ) ( not ( = ?auto_477345 ?auto_477351 ) ) ( not ( = ?auto_477345 ?auto_477352 ) ) ( not ( = ?auto_477345 ?auto_477353 ) ) ( not ( = ?auto_477345 ?auto_477354 ) ) ( not ( = ?auto_477345 ?auto_477355 ) ) ( not ( = ?auto_477346 ?auto_477347 ) ) ( not ( = ?auto_477346 ?auto_477348 ) ) ( not ( = ?auto_477346 ?auto_477349 ) ) ( not ( = ?auto_477346 ?auto_477350 ) ) ( not ( = ?auto_477346 ?auto_477351 ) ) ( not ( = ?auto_477346 ?auto_477352 ) ) ( not ( = ?auto_477346 ?auto_477353 ) ) ( not ( = ?auto_477346 ?auto_477354 ) ) ( not ( = ?auto_477346 ?auto_477355 ) ) ( not ( = ?auto_477347 ?auto_477348 ) ) ( not ( = ?auto_477347 ?auto_477349 ) ) ( not ( = ?auto_477347 ?auto_477350 ) ) ( not ( = ?auto_477347 ?auto_477351 ) ) ( not ( = ?auto_477347 ?auto_477352 ) ) ( not ( = ?auto_477347 ?auto_477353 ) ) ( not ( = ?auto_477347 ?auto_477354 ) ) ( not ( = ?auto_477347 ?auto_477355 ) ) ( not ( = ?auto_477348 ?auto_477349 ) ) ( not ( = ?auto_477348 ?auto_477350 ) ) ( not ( = ?auto_477348 ?auto_477351 ) ) ( not ( = ?auto_477348 ?auto_477352 ) ) ( not ( = ?auto_477348 ?auto_477353 ) ) ( not ( = ?auto_477348 ?auto_477354 ) ) ( not ( = ?auto_477348 ?auto_477355 ) ) ( not ( = ?auto_477349 ?auto_477350 ) ) ( not ( = ?auto_477349 ?auto_477351 ) ) ( not ( = ?auto_477349 ?auto_477352 ) ) ( not ( = ?auto_477349 ?auto_477353 ) ) ( not ( = ?auto_477349 ?auto_477354 ) ) ( not ( = ?auto_477349 ?auto_477355 ) ) ( not ( = ?auto_477350 ?auto_477351 ) ) ( not ( = ?auto_477350 ?auto_477352 ) ) ( not ( = ?auto_477350 ?auto_477353 ) ) ( not ( = ?auto_477350 ?auto_477354 ) ) ( not ( = ?auto_477350 ?auto_477355 ) ) ( not ( = ?auto_477351 ?auto_477352 ) ) ( not ( = ?auto_477351 ?auto_477353 ) ) ( not ( = ?auto_477351 ?auto_477354 ) ) ( not ( = ?auto_477351 ?auto_477355 ) ) ( not ( = ?auto_477352 ?auto_477353 ) ) ( not ( = ?auto_477352 ?auto_477354 ) ) ( not ( = ?auto_477352 ?auto_477355 ) ) ( not ( = ?auto_477353 ?auto_477354 ) ) ( not ( = ?auto_477353 ?auto_477355 ) ) ( not ( = ?auto_477354 ?auto_477355 ) ) ( ON ?auto_477353 ?auto_477354 ) ( ON ?auto_477352 ?auto_477353 ) ( ON ?auto_477351 ?auto_477352 ) ( ON ?auto_477350 ?auto_477351 ) ( ON ?auto_477349 ?auto_477350 ) ( ON ?auto_477348 ?auto_477349 ) ( ON ?auto_477347 ?auto_477348 ) ( ON ?auto_477346 ?auto_477347 ) ( ON ?auto_477345 ?auto_477346 ) ( ON ?auto_477344 ?auto_477345 ) ( ON ?auto_477343 ?auto_477344 ) ( ON ?auto_477342 ?auto_477343 ) ( ON ?auto_477341 ?auto_477342 ) ( CLEAR ?auto_477339 ) ( ON ?auto_477340 ?auto_477341 ) ( CLEAR ?auto_477340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_477339 ?auto_477340 )
      ( MAKE-16PILE ?auto_477339 ?auto_477340 ?auto_477341 ?auto_477342 ?auto_477343 ?auto_477344 ?auto_477345 ?auto_477346 ?auto_477347 ?auto_477348 ?auto_477349 ?auto_477350 ?auto_477351 ?auto_477352 ?auto_477353 ?auto_477354 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477372 - BLOCK
      ?auto_477373 - BLOCK
      ?auto_477374 - BLOCK
      ?auto_477375 - BLOCK
      ?auto_477376 - BLOCK
      ?auto_477377 - BLOCK
      ?auto_477378 - BLOCK
      ?auto_477379 - BLOCK
      ?auto_477380 - BLOCK
      ?auto_477381 - BLOCK
      ?auto_477382 - BLOCK
      ?auto_477383 - BLOCK
      ?auto_477384 - BLOCK
      ?auto_477385 - BLOCK
      ?auto_477386 - BLOCK
      ?auto_477387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477387 ) ( ON-TABLE ?auto_477372 ) ( not ( = ?auto_477372 ?auto_477373 ) ) ( not ( = ?auto_477372 ?auto_477374 ) ) ( not ( = ?auto_477372 ?auto_477375 ) ) ( not ( = ?auto_477372 ?auto_477376 ) ) ( not ( = ?auto_477372 ?auto_477377 ) ) ( not ( = ?auto_477372 ?auto_477378 ) ) ( not ( = ?auto_477372 ?auto_477379 ) ) ( not ( = ?auto_477372 ?auto_477380 ) ) ( not ( = ?auto_477372 ?auto_477381 ) ) ( not ( = ?auto_477372 ?auto_477382 ) ) ( not ( = ?auto_477372 ?auto_477383 ) ) ( not ( = ?auto_477372 ?auto_477384 ) ) ( not ( = ?auto_477372 ?auto_477385 ) ) ( not ( = ?auto_477372 ?auto_477386 ) ) ( not ( = ?auto_477372 ?auto_477387 ) ) ( not ( = ?auto_477373 ?auto_477374 ) ) ( not ( = ?auto_477373 ?auto_477375 ) ) ( not ( = ?auto_477373 ?auto_477376 ) ) ( not ( = ?auto_477373 ?auto_477377 ) ) ( not ( = ?auto_477373 ?auto_477378 ) ) ( not ( = ?auto_477373 ?auto_477379 ) ) ( not ( = ?auto_477373 ?auto_477380 ) ) ( not ( = ?auto_477373 ?auto_477381 ) ) ( not ( = ?auto_477373 ?auto_477382 ) ) ( not ( = ?auto_477373 ?auto_477383 ) ) ( not ( = ?auto_477373 ?auto_477384 ) ) ( not ( = ?auto_477373 ?auto_477385 ) ) ( not ( = ?auto_477373 ?auto_477386 ) ) ( not ( = ?auto_477373 ?auto_477387 ) ) ( not ( = ?auto_477374 ?auto_477375 ) ) ( not ( = ?auto_477374 ?auto_477376 ) ) ( not ( = ?auto_477374 ?auto_477377 ) ) ( not ( = ?auto_477374 ?auto_477378 ) ) ( not ( = ?auto_477374 ?auto_477379 ) ) ( not ( = ?auto_477374 ?auto_477380 ) ) ( not ( = ?auto_477374 ?auto_477381 ) ) ( not ( = ?auto_477374 ?auto_477382 ) ) ( not ( = ?auto_477374 ?auto_477383 ) ) ( not ( = ?auto_477374 ?auto_477384 ) ) ( not ( = ?auto_477374 ?auto_477385 ) ) ( not ( = ?auto_477374 ?auto_477386 ) ) ( not ( = ?auto_477374 ?auto_477387 ) ) ( not ( = ?auto_477375 ?auto_477376 ) ) ( not ( = ?auto_477375 ?auto_477377 ) ) ( not ( = ?auto_477375 ?auto_477378 ) ) ( not ( = ?auto_477375 ?auto_477379 ) ) ( not ( = ?auto_477375 ?auto_477380 ) ) ( not ( = ?auto_477375 ?auto_477381 ) ) ( not ( = ?auto_477375 ?auto_477382 ) ) ( not ( = ?auto_477375 ?auto_477383 ) ) ( not ( = ?auto_477375 ?auto_477384 ) ) ( not ( = ?auto_477375 ?auto_477385 ) ) ( not ( = ?auto_477375 ?auto_477386 ) ) ( not ( = ?auto_477375 ?auto_477387 ) ) ( not ( = ?auto_477376 ?auto_477377 ) ) ( not ( = ?auto_477376 ?auto_477378 ) ) ( not ( = ?auto_477376 ?auto_477379 ) ) ( not ( = ?auto_477376 ?auto_477380 ) ) ( not ( = ?auto_477376 ?auto_477381 ) ) ( not ( = ?auto_477376 ?auto_477382 ) ) ( not ( = ?auto_477376 ?auto_477383 ) ) ( not ( = ?auto_477376 ?auto_477384 ) ) ( not ( = ?auto_477376 ?auto_477385 ) ) ( not ( = ?auto_477376 ?auto_477386 ) ) ( not ( = ?auto_477376 ?auto_477387 ) ) ( not ( = ?auto_477377 ?auto_477378 ) ) ( not ( = ?auto_477377 ?auto_477379 ) ) ( not ( = ?auto_477377 ?auto_477380 ) ) ( not ( = ?auto_477377 ?auto_477381 ) ) ( not ( = ?auto_477377 ?auto_477382 ) ) ( not ( = ?auto_477377 ?auto_477383 ) ) ( not ( = ?auto_477377 ?auto_477384 ) ) ( not ( = ?auto_477377 ?auto_477385 ) ) ( not ( = ?auto_477377 ?auto_477386 ) ) ( not ( = ?auto_477377 ?auto_477387 ) ) ( not ( = ?auto_477378 ?auto_477379 ) ) ( not ( = ?auto_477378 ?auto_477380 ) ) ( not ( = ?auto_477378 ?auto_477381 ) ) ( not ( = ?auto_477378 ?auto_477382 ) ) ( not ( = ?auto_477378 ?auto_477383 ) ) ( not ( = ?auto_477378 ?auto_477384 ) ) ( not ( = ?auto_477378 ?auto_477385 ) ) ( not ( = ?auto_477378 ?auto_477386 ) ) ( not ( = ?auto_477378 ?auto_477387 ) ) ( not ( = ?auto_477379 ?auto_477380 ) ) ( not ( = ?auto_477379 ?auto_477381 ) ) ( not ( = ?auto_477379 ?auto_477382 ) ) ( not ( = ?auto_477379 ?auto_477383 ) ) ( not ( = ?auto_477379 ?auto_477384 ) ) ( not ( = ?auto_477379 ?auto_477385 ) ) ( not ( = ?auto_477379 ?auto_477386 ) ) ( not ( = ?auto_477379 ?auto_477387 ) ) ( not ( = ?auto_477380 ?auto_477381 ) ) ( not ( = ?auto_477380 ?auto_477382 ) ) ( not ( = ?auto_477380 ?auto_477383 ) ) ( not ( = ?auto_477380 ?auto_477384 ) ) ( not ( = ?auto_477380 ?auto_477385 ) ) ( not ( = ?auto_477380 ?auto_477386 ) ) ( not ( = ?auto_477380 ?auto_477387 ) ) ( not ( = ?auto_477381 ?auto_477382 ) ) ( not ( = ?auto_477381 ?auto_477383 ) ) ( not ( = ?auto_477381 ?auto_477384 ) ) ( not ( = ?auto_477381 ?auto_477385 ) ) ( not ( = ?auto_477381 ?auto_477386 ) ) ( not ( = ?auto_477381 ?auto_477387 ) ) ( not ( = ?auto_477382 ?auto_477383 ) ) ( not ( = ?auto_477382 ?auto_477384 ) ) ( not ( = ?auto_477382 ?auto_477385 ) ) ( not ( = ?auto_477382 ?auto_477386 ) ) ( not ( = ?auto_477382 ?auto_477387 ) ) ( not ( = ?auto_477383 ?auto_477384 ) ) ( not ( = ?auto_477383 ?auto_477385 ) ) ( not ( = ?auto_477383 ?auto_477386 ) ) ( not ( = ?auto_477383 ?auto_477387 ) ) ( not ( = ?auto_477384 ?auto_477385 ) ) ( not ( = ?auto_477384 ?auto_477386 ) ) ( not ( = ?auto_477384 ?auto_477387 ) ) ( not ( = ?auto_477385 ?auto_477386 ) ) ( not ( = ?auto_477385 ?auto_477387 ) ) ( not ( = ?auto_477386 ?auto_477387 ) ) ( ON ?auto_477386 ?auto_477387 ) ( ON ?auto_477385 ?auto_477386 ) ( ON ?auto_477384 ?auto_477385 ) ( ON ?auto_477383 ?auto_477384 ) ( ON ?auto_477382 ?auto_477383 ) ( ON ?auto_477381 ?auto_477382 ) ( ON ?auto_477380 ?auto_477381 ) ( ON ?auto_477379 ?auto_477380 ) ( ON ?auto_477378 ?auto_477379 ) ( ON ?auto_477377 ?auto_477378 ) ( ON ?auto_477376 ?auto_477377 ) ( ON ?auto_477375 ?auto_477376 ) ( ON ?auto_477374 ?auto_477375 ) ( CLEAR ?auto_477372 ) ( ON ?auto_477373 ?auto_477374 ) ( CLEAR ?auto_477373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_477372 ?auto_477373 )
      ( MAKE-16PILE ?auto_477372 ?auto_477373 ?auto_477374 ?auto_477375 ?auto_477376 ?auto_477377 ?auto_477378 ?auto_477379 ?auto_477380 ?auto_477381 ?auto_477382 ?auto_477383 ?auto_477384 ?auto_477385 ?auto_477386 ?auto_477387 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477404 - BLOCK
      ?auto_477405 - BLOCK
      ?auto_477406 - BLOCK
      ?auto_477407 - BLOCK
      ?auto_477408 - BLOCK
      ?auto_477409 - BLOCK
      ?auto_477410 - BLOCK
      ?auto_477411 - BLOCK
      ?auto_477412 - BLOCK
      ?auto_477413 - BLOCK
      ?auto_477414 - BLOCK
      ?auto_477415 - BLOCK
      ?auto_477416 - BLOCK
      ?auto_477417 - BLOCK
      ?auto_477418 - BLOCK
      ?auto_477419 - BLOCK
    )
    :vars
    (
      ?auto_477420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_477419 ?auto_477420 ) ( not ( = ?auto_477404 ?auto_477405 ) ) ( not ( = ?auto_477404 ?auto_477406 ) ) ( not ( = ?auto_477404 ?auto_477407 ) ) ( not ( = ?auto_477404 ?auto_477408 ) ) ( not ( = ?auto_477404 ?auto_477409 ) ) ( not ( = ?auto_477404 ?auto_477410 ) ) ( not ( = ?auto_477404 ?auto_477411 ) ) ( not ( = ?auto_477404 ?auto_477412 ) ) ( not ( = ?auto_477404 ?auto_477413 ) ) ( not ( = ?auto_477404 ?auto_477414 ) ) ( not ( = ?auto_477404 ?auto_477415 ) ) ( not ( = ?auto_477404 ?auto_477416 ) ) ( not ( = ?auto_477404 ?auto_477417 ) ) ( not ( = ?auto_477404 ?auto_477418 ) ) ( not ( = ?auto_477404 ?auto_477419 ) ) ( not ( = ?auto_477404 ?auto_477420 ) ) ( not ( = ?auto_477405 ?auto_477406 ) ) ( not ( = ?auto_477405 ?auto_477407 ) ) ( not ( = ?auto_477405 ?auto_477408 ) ) ( not ( = ?auto_477405 ?auto_477409 ) ) ( not ( = ?auto_477405 ?auto_477410 ) ) ( not ( = ?auto_477405 ?auto_477411 ) ) ( not ( = ?auto_477405 ?auto_477412 ) ) ( not ( = ?auto_477405 ?auto_477413 ) ) ( not ( = ?auto_477405 ?auto_477414 ) ) ( not ( = ?auto_477405 ?auto_477415 ) ) ( not ( = ?auto_477405 ?auto_477416 ) ) ( not ( = ?auto_477405 ?auto_477417 ) ) ( not ( = ?auto_477405 ?auto_477418 ) ) ( not ( = ?auto_477405 ?auto_477419 ) ) ( not ( = ?auto_477405 ?auto_477420 ) ) ( not ( = ?auto_477406 ?auto_477407 ) ) ( not ( = ?auto_477406 ?auto_477408 ) ) ( not ( = ?auto_477406 ?auto_477409 ) ) ( not ( = ?auto_477406 ?auto_477410 ) ) ( not ( = ?auto_477406 ?auto_477411 ) ) ( not ( = ?auto_477406 ?auto_477412 ) ) ( not ( = ?auto_477406 ?auto_477413 ) ) ( not ( = ?auto_477406 ?auto_477414 ) ) ( not ( = ?auto_477406 ?auto_477415 ) ) ( not ( = ?auto_477406 ?auto_477416 ) ) ( not ( = ?auto_477406 ?auto_477417 ) ) ( not ( = ?auto_477406 ?auto_477418 ) ) ( not ( = ?auto_477406 ?auto_477419 ) ) ( not ( = ?auto_477406 ?auto_477420 ) ) ( not ( = ?auto_477407 ?auto_477408 ) ) ( not ( = ?auto_477407 ?auto_477409 ) ) ( not ( = ?auto_477407 ?auto_477410 ) ) ( not ( = ?auto_477407 ?auto_477411 ) ) ( not ( = ?auto_477407 ?auto_477412 ) ) ( not ( = ?auto_477407 ?auto_477413 ) ) ( not ( = ?auto_477407 ?auto_477414 ) ) ( not ( = ?auto_477407 ?auto_477415 ) ) ( not ( = ?auto_477407 ?auto_477416 ) ) ( not ( = ?auto_477407 ?auto_477417 ) ) ( not ( = ?auto_477407 ?auto_477418 ) ) ( not ( = ?auto_477407 ?auto_477419 ) ) ( not ( = ?auto_477407 ?auto_477420 ) ) ( not ( = ?auto_477408 ?auto_477409 ) ) ( not ( = ?auto_477408 ?auto_477410 ) ) ( not ( = ?auto_477408 ?auto_477411 ) ) ( not ( = ?auto_477408 ?auto_477412 ) ) ( not ( = ?auto_477408 ?auto_477413 ) ) ( not ( = ?auto_477408 ?auto_477414 ) ) ( not ( = ?auto_477408 ?auto_477415 ) ) ( not ( = ?auto_477408 ?auto_477416 ) ) ( not ( = ?auto_477408 ?auto_477417 ) ) ( not ( = ?auto_477408 ?auto_477418 ) ) ( not ( = ?auto_477408 ?auto_477419 ) ) ( not ( = ?auto_477408 ?auto_477420 ) ) ( not ( = ?auto_477409 ?auto_477410 ) ) ( not ( = ?auto_477409 ?auto_477411 ) ) ( not ( = ?auto_477409 ?auto_477412 ) ) ( not ( = ?auto_477409 ?auto_477413 ) ) ( not ( = ?auto_477409 ?auto_477414 ) ) ( not ( = ?auto_477409 ?auto_477415 ) ) ( not ( = ?auto_477409 ?auto_477416 ) ) ( not ( = ?auto_477409 ?auto_477417 ) ) ( not ( = ?auto_477409 ?auto_477418 ) ) ( not ( = ?auto_477409 ?auto_477419 ) ) ( not ( = ?auto_477409 ?auto_477420 ) ) ( not ( = ?auto_477410 ?auto_477411 ) ) ( not ( = ?auto_477410 ?auto_477412 ) ) ( not ( = ?auto_477410 ?auto_477413 ) ) ( not ( = ?auto_477410 ?auto_477414 ) ) ( not ( = ?auto_477410 ?auto_477415 ) ) ( not ( = ?auto_477410 ?auto_477416 ) ) ( not ( = ?auto_477410 ?auto_477417 ) ) ( not ( = ?auto_477410 ?auto_477418 ) ) ( not ( = ?auto_477410 ?auto_477419 ) ) ( not ( = ?auto_477410 ?auto_477420 ) ) ( not ( = ?auto_477411 ?auto_477412 ) ) ( not ( = ?auto_477411 ?auto_477413 ) ) ( not ( = ?auto_477411 ?auto_477414 ) ) ( not ( = ?auto_477411 ?auto_477415 ) ) ( not ( = ?auto_477411 ?auto_477416 ) ) ( not ( = ?auto_477411 ?auto_477417 ) ) ( not ( = ?auto_477411 ?auto_477418 ) ) ( not ( = ?auto_477411 ?auto_477419 ) ) ( not ( = ?auto_477411 ?auto_477420 ) ) ( not ( = ?auto_477412 ?auto_477413 ) ) ( not ( = ?auto_477412 ?auto_477414 ) ) ( not ( = ?auto_477412 ?auto_477415 ) ) ( not ( = ?auto_477412 ?auto_477416 ) ) ( not ( = ?auto_477412 ?auto_477417 ) ) ( not ( = ?auto_477412 ?auto_477418 ) ) ( not ( = ?auto_477412 ?auto_477419 ) ) ( not ( = ?auto_477412 ?auto_477420 ) ) ( not ( = ?auto_477413 ?auto_477414 ) ) ( not ( = ?auto_477413 ?auto_477415 ) ) ( not ( = ?auto_477413 ?auto_477416 ) ) ( not ( = ?auto_477413 ?auto_477417 ) ) ( not ( = ?auto_477413 ?auto_477418 ) ) ( not ( = ?auto_477413 ?auto_477419 ) ) ( not ( = ?auto_477413 ?auto_477420 ) ) ( not ( = ?auto_477414 ?auto_477415 ) ) ( not ( = ?auto_477414 ?auto_477416 ) ) ( not ( = ?auto_477414 ?auto_477417 ) ) ( not ( = ?auto_477414 ?auto_477418 ) ) ( not ( = ?auto_477414 ?auto_477419 ) ) ( not ( = ?auto_477414 ?auto_477420 ) ) ( not ( = ?auto_477415 ?auto_477416 ) ) ( not ( = ?auto_477415 ?auto_477417 ) ) ( not ( = ?auto_477415 ?auto_477418 ) ) ( not ( = ?auto_477415 ?auto_477419 ) ) ( not ( = ?auto_477415 ?auto_477420 ) ) ( not ( = ?auto_477416 ?auto_477417 ) ) ( not ( = ?auto_477416 ?auto_477418 ) ) ( not ( = ?auto_477416 ?auto_477419 ) ) ( not ( = ?auto_477416 ?auto_477420 ) ) ( not ( = ?auto_477417 ?auto_477418 ) ) ( not ( = ?auto_477417 ?auto_477419 ) ) ( not ( = ?auto_477417 ?auto_477420 ) ) ( not ( = ?auto_477418 ?auto_477419 ) ) ( not ( = ?auto_477418 ?auto_477420 ) ) ( not ( = ?auto_477419 ?auto_477420 ) ) ( ON ?auto_477418 ?auto_477419 ) ( ON ?auto_477417 ?auto_477418 ) ( ON ?auto_477416 ?auto_477417 ) ( ON ?auto_477415 ?auto_477416 ) ( ON ?auto_477414 ?auto_477415 ) ( ON ?auto_477413 ?auto_477414 ) ( ON ?auto_477412 ?auto_477413 ) ( ON ?auto_477411 ?auto_477412 ) ( ON ?auto_477410 ?auto_477411 ) ( ON ?auto_477409 ?auto_477410 ) ( ON ?auto_477408 ?auto_477409 ) ( ON ?auto_477407 ?auto_477408 ) ( ON ?auto_477406 ?auto_477407 ) ( ON ?auto_477405 ?auto_477406 ) ( ON ?auto_477404 ?auto_477405 ) ( CLEAR ?auto_477404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477404 )
      ( MAKE-16PILE ?auto_477404 ?auto_477405 ?auto_477406 ?auto_477407 ?auto_477408 ?auto_477409 ?auto_477410 ?auto_477411 ?auto_477412 ?auto_477413 ?auto_477414 ?auto_477415 ?auto_477416 ?auto_477417 ?auto_477418 ?auto_477419 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477437 - BLOCK
      ?auto_477438 - BLOCK
      ?auto_477439 - BLOCK
      ?auto_477440 - BLOCK
      ?auto_477441 - BLOCK
      ?auto_477442 - BLOCK
      ?auto_477443 - BLOCK
      ?auto_477444 - BLOCK
      ?auto_477445 - BLOCK
      ?auto_477446 - BLOCK
      ?auto_477447 - BLOCK
      ?auto_477448 - BLOCK
      ?auto_477449 - BLOCK
      ?auto_477450 - BLOCK
      ?auto_477451 - BLOCK
      ?auto_477452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_477452 ) ( not ( = ?auto_477437 ?auto_477438 ) ) ( not ( = ?auto_477437 ?auto_477439 ) ) ( not ( = ?auto_477437 ?auto_477440 ) ) ( not ( = ?auto_477437 ?auto_477441 ) ) ( not ( = ?auto_477437 ?auto_477442 ) ) ( not ( = ?auto_477437 ?auto_477443 ) ) ( not ( = ?auto_477437 ?auto_477444 ) ) ( not ( = ?auto_477437 ?auto_477445 ) ) ( not ( = ?auto_477437 ?auto_477446 ) ) ( not ( = ?auto_477437 ?auto_477447 ) ) ( not ( = ?auto_477437 ?auto_477448 ) ) ( not ( = ?auto_477437 ?auto_477449 ) ) ( not ( = ?auto_477437 ?auto_477450 ) ) ( not ( = ?auto_477437 ?auto_477451 ) ) ( not ( = ?auto_477437 ?auto_477452 ) ) ( not ( = ?auto_477438 ?auto_477439 ) ) ( not ( = ?auto_477438 ?auto_477440 ) ) ( not ( = ?auto_477438 ?auto_477441 ) ) ( not ( = ?auto_477438 ?auto_477442 ) ) ( not ( = ?auto_477438 ?auto_477443 ) ) ( not ( = ?auto_477438 ?auto_477444 ) ) ( not ( = ?auto_477438 ?auto_477445 ) ) ( not ( = ?auto_477438 ?auto_477446 ) ) ( not ( = ?auto_477438 ?auto_477447 ) ) ( not ( = ?auto_477438 ?auto_477448 ) ) ( not ( = ?auto_477438 ?auto_477449 ) ) ( not ( = ?auto_477438 ?auto_477450 ) ) ( not ( = ?auto_477438 ?auto_477451 ) ) ( not ( = ?auto_477438 ?auto_477452 ) ) ( not ( = ?auto_477439 ?auto_477440 ) ) ( not ( = ?auto_477439 ?auto_477441 ) ) ( not ( = ?auto_477439 ?auto_477442 ) ) ( not ( = ?auto_477439 ?auto_477443 ) ) ( not ( = ?auto_477439 ?auto_477444 ) ) ( not ( = ?auto_477439 ?auto_477445 ) ) ( not ( = ?auto_477439 ?auto_477446 ) ) ( not ( = ?auto_477439 ?auto_477447 ) ) ( not ( = ?auto_477439 ?auto_477448 ) ) ( not ( = ?auto_477439 ?auto_477449 ) ) ( not ( = ?auto_477439 ?auto_477450 ) ) ( not ( = ?auto_477439 ?auto_477451 ) ) ( not ( = ?auto_477439 ?auto_477452 ) ) ( not ( = ?auto_477440 ?auto_477441 ) ) ( not ( = ?auto_477440 ?auto_477442 ) ) ( not ( = ?auto_477440 ?auto_477443 ) ) ( not ( = ?auto_477440 ?auto_477444 ) ) ( not ( = ?auto_477440 ?auto_477445 ) ) ( not ( = ?auto_477440 ?auto_477446 ) ) ( not ( = ?auto_477440 ?auto_477447 ) ) ( not ( = ?auto_477440 ?auto_477448 ) ) ( not ( = ?auto_477440 ?auto_477449 ) ) ( not ( = ?auto_477440 ?auto_477450 ) ) ( not ( = ?auto_477440 ?auto_477451 ) ) ( not ( = ?auto_477440 ?auto_477452 ) ) ( not ( = ?auto_477441 ?auto_477442 ) ) ( not ( = ?auto_477441 ?auto_477443 ) ) ( not ( = ?auto_477441 ?auto_477444 ) ) ( not ( = ?auto_477441 ?auto_477445 ) ) ( not ( = ?auto_477441 ?auto_477446 ) ) ( not ( = ?auto_477441 ?auto_477447 ) ) ( not ( = ?auto_477441 ?auto_477448 ) ) ( not ( = ?auto_477441 ?auto_477449 ) ) ( not ( = ?auto_477441 ?auto_477450 ) ) ( not ( = ?auto_477441 ?auto_477451 ) ) ( not ( = ?auto_477441 ?auto_477452 ) ) ( not ( = ?auto_477442 ?auto_477443 ) ) ( not ( = ?auto_477442 ?auto_477444 ) ) ( not ( = ?auto_477442 ?auto_477445 ) ) ( not ( = ?auto_477442 ?auto_477446 ) ) ( not ( = ?auto_477442 ?auto_477447 ) ) ( not ( = ?auto_477442 ?auto_477448 ) ) ( not ( = ?auto_477442 ?auto_477449 ) ) ( not ( = ?auto_477442 ?auto_477450 ) ) ( not ( = ?auto_477442 ?auto_477451 ) ) ( not ( = ?auto_477442 ?auto_477452 ) ) ( not ( = ?auto_477443 ?auto_477444 ) ) ( not ( = ?auto_477443 ?auto_477445 ) ) ( not ( = ?auto_477443 ?auto_477446 ) ) ( not ( = ?auto_477443 ?auto_477447 ) ) ( not ( = ?auto_477443 ?auto_477448 ) ) ( not ( = ?auto_477443 ?auto_477449 ) ) ( not ( = ?auto_477443 ?auto_477450 ) ) ( not ( = ?auto_477443 ?auto_477451 ) ) ( not ( = ?auto_477443 ?auto_477452 ) ) ( not ( = ?auto_477444 ?auto_477445 ) ) ( not ( = ?auto_477444 ?auto_477446 ) ) ( not ( = ?auto_477444 ?auto_477447 ) ) ( not ( = ?auto_477444 ?auto_477448 ) ) ( not ( = ?auto_477444 ?auto_477449 ) ) ( not ( = ?auto_477444 ?auto_477450 ) ) ( not ( = ?auto_477444 ?auto_477451 ) ) ( not ( = ?auto_477444 ?auto_477452 ) ) ( not ( = ?auto_477445 ?auto_477446 ) ) ( not ( = ?auto_477445 ?auto_477447 ) ) ( not ( = ?auto_477445 ?auto_477448 ) ) ( not ( = ?auto_477445 ?auto_477449 ) ) ( not ( = ?auto_477445 ?auto_477450 ) ) ( not ( = ?auto_477445 ?auto_477451 ) ) ( not ( = ?auto_477445 ?auto_477452 ) ) ( not ( = ?auto_477446 ?auto_477447 ) ) ( not ( = ?auto_477446 ?auto_477448 ) ) ( not ( = ?auto_477446 ?auto_477449 ) ) ( not ( = ?auto_477446 ?auto_477450 ) ) ( not ( = ?auto_477446 ?auto_477451 ) ) ( not ( = ?auto_477446 ?auto_477452 ) ) ( not ( = ?auto_477447 ?auto_477448 ) ) ( not ( = ?auto_477447 ?auto_477449 ) ) ( not ( = ?auto_477447 ?auto_477450 ) ) ( not ( = ?auto_477447 ?auto_477451 ) ) ( not ( = ?auto_477447 ?auto_477452 ) ) ( not ( = ?auto_477448 ?auto_477449 ) ) ( not ( = ?auto_477448 ?auto_477450 ) ) ( not ( = ?auto_477448 ?auto_477451 ) ) ( not ( = ?auto_477448 ?auto_477452 ) ) ( not ( = ?auto_477449 ?auto_477450 ) ) ( not ( = ?auto_477449 ?auto_477451 ) ) ( not ( = ?auto_477449 ?auto_477452 ) ) ( not ( = ?auto_477450 ?auto_477451 ) ) ( not ( = ?auto_477450 ?auto_477452 ) ) ( not ( = ?auto_477451 ?auto_477452 ) ) ( ON ?auto_477451 ?auto_477452 ) ( ON ?auto_477450 ?auto_477451 ) ( ON ?auto_477449 ?auto_477450 ) ( ON ?auto_477448 ?auto_477449 ) ( ON ?auto_477447 ?auto_477448 ) ( ON ?auto_477446 ?auto_477447 ) ( ON ?auto_477445 ?auto_477446 ) ( ON ?auto_477444 ?auto_477445 ) ( ON ?auto_477443 ?auto_477444 ) ( ON ?auto_477442 ?auto_477443 ) ( ON ?auto_477441 ?auto_477442 ) ( ON ?auto_477440 ?auto_477441 ) ( ON ?auto_477439 ?auto_477440 ) ( ON ?auto_477438 ?auto_477439 ) ( ON ?auto_477437 ?auto_477438 ) ( CLEAR ?auto_477437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_477437 )
      ( MAKE-16PILE ?auto_477437 ?auto_477438 ?auto_477439 ?auto_477440 ?auto_477441 ?auto_477442 ?auto_477443 ?auto_477444 ?auto_477445 ?auto_477446 ?auto_477447 ?auto_477448 ?auto_477449 ?auto_477450 ?auto_477451 ?auto_477452 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_477469 - BLOCK
      ?auto_477470 - BLOCK
      ?auto_477471 - BLOCK
      ?auto_477472 - BLOCK
      ?auto_477473 - BLOCK
      ?auto_477474 - BLOCK
      ?auto_477475 - BLOCK
      ?auto_477476 - BLOCK
      ?auto_477477 - BLOCK
      ?auto_477478 - BLOCK
      ?auto_477479 - BLOCK
      ?auto_477480 - BLOCK
      ?auto_477481 - BLOCK
      ?auto_477482 - BLOCK
      ?auto_477483 - BLOCK
      ?auto_477484 - BLOCK
    )
    :vars
    (
      ?auto_477485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_477469 ?auto_477470 ) ) ( not ( = ?auto_477469 ?auto_477471 ) ) ( not ( = ?auto_477469 ?auto_477472 ) ) ( not ( = ?auto_477469 ?auto_477473 ) ) ( not ( = ?auto_477469 ?auto_477474 ) ) ( not ( = ?auto_477469 ?auto_477475 ) ) ( not ( = ?auto_477469 ?auto_477476 ) ) ( not ( = ?auto_477469 ?auto_477477 ) ) ( not ( = ?auto_477469 ?auto_477478 ) ) ( not ( = ?auto_477469 ?auto_477479 ) ) ( not ( = ?auto_477469 ?auto_477480 ) ) ( not ( = ?auto_477469 ?auto_477481 ) ) ( not ( = ?auto_477469 ?auto_477482 ) ) ( not ( = ?auto_477469 ?auto_477483 ) ) ( not ( = ?auto_477469 ?auto_477484 ) ) ( not ( = ?auto_477470 ?auto_477471 ) ) ( not ( = ?auto_477470 ?auto_477472 ) ) ( not ( = ?auto_477470 ?auto_477473 ) ) ( not ( = ?auto_477470 ?auto_477474 ) ) ( not ( = ?auto_477470 ?auto_477475 ) ) ( not ( = ?auto_477470 ?auto_477476 ) ) ( not ( = ?auto_477470 ?auto_477477 ) ) ( not ( = ?auto_477470 ?auto_477478 ) ) ( not ( = ?auto_477470 ?auto_477479 ) ) ( not ( = ?auto_477470 ?auto_477480 ) ) ( not ( = ?auto_477470 ?auto_477481 ) ) ( not ( = ?auto_477470 ?auto_477482 ) ) ( not ( = ?auto_477470 ?auto_477483 ) ) ( not ( = ?auto_477470 ?auto_477484 ) ) ( not ( = ?auto_477471 ?auto_477472 ) ) ( not ( = ?auto_477471 ?auto_477473 ) ) ( not ( = ?auto_477471 ?auto_477474 ) ) ( not ( = ?auto_477471 ?auto_477475 ) ) ( not ( = ?auto_477471 ?auto_477476 ) ) ( not ( = ?auto_477471 ?auto_477477 ) ) ( not ( = ?auto_477471 ?auto_477478 ) ) ( not ( = ?auto_477471 ?auto_477479 ) ) ( not ( = ?auto_477471 ?auto_477480 ) ) ( not ( = ?auto_477471 ?auto_477481 ) ) ( not ( = ?auto_477471 ?auto_477482 ) ) ( not ( = ?auto_477471 ?auto_477483 ) ) ( not ( = ?auto_477471 ?auto_477484 ) ) ( not ( = ?auto_477472 ?auto_477473 ) ) ( not ( = ?auto_477472 ?auto_477474 ) ) ( not ( = ?auto_477472 ?auto_477475 ) ) ( not ( = ?auto_477472 ?auto_477476 ) ) ( not ( = ?auto_477472 ?auto_477477 ) ) ( not ( = ?auto_477472 ?auto_477478 ) ) ( not ( = ?auto_477472 ?auto_477479 ) ) ( not ( = ?auto_477472 ?auto_477480 ) ) ( not ( = ?auto_477472 ?auto_477481 ) ) ( not ( = ?auto_477472 ?auto_477482 ) ) ( not ( = ?auto_477472 ?auto_477483 ) ) ( not ( = ?auto_477472 ?auto_477484 ) ) ( not ( = ?auto_477473 ?auto_477474 ) ) ( not ( = ?auto_477473 ?auto_477475 ) ) ( not ( = ?auto_477473 ?auto_477476 ) ) ( not ( = ?auto_477473 ?auto_477477 ) ) ( not ( = ?auto_477473 ?auto_477478 ) ) ( not ( = ?auto_477473 ?auto_477479 ) ) ( not ( = ?auto_477473 ?auto_477480 ) ) ( not ( = ?auto_477473 ?auto_477481 ) ) ( not ( = ?auto_477473 ?auto_477482 ) ) ( not ( = ?auto_477473 ?auto_477483 ) ) ( not ( = ?auto_477473 ?auto_477484 ) ) ( not ( = ?auto_477474 ?auto_477475 ) ) ( not ( = ?auto_477474 ?auto_477476 ) ) ( not ( = ?auto_477474 ?auto_477477 ) ) ( not ( = ?auto_477474 ?auto_477478 ) ) ( not ( = ?auto_477474 ?auto_477479 ) ) ( not ( = ?auto_477474 ?auto_477480 ) ) ( not ( = ?auto_477474 ?auto_477481 ) ) ( not ( = ?auto_477474 ?auto_477482 ) ) ( not ( = ?auto_477474 ?auto_477483 ) ) ( not ( = ?auto_477474 ?auto_477484 ) ) ( not ( = ?auto_477475 ?auto_477476 ) ) ( not ( = ?auto_477475 ?auto_477477 ) ) ( not ( = ?auto_477475 ?auto_477478 ) ) ( not ( = ?auto_477475 ?auto_477479 ) ) ( not ( = ?auto_477475 ?auto_477480 ) ) ( not ( = ?auto_477475 ?auto_477481 ) ) ( not ( = ?auto_477475 ?auto_477482 ) ) ( not ( = ?auto_477475 ?auto_477483 ) ) ( not ( = ?auto_477475 ?auto_477484 ) ) ( not ( = ?auto_477476 ?auto_477477 ) ) ( not ( = ?auto_477476 ?auto_477478 ) ) ( not ( = ?auto_477476 ?auto_477479 ) ) ( not ( = ?auto_477476 ?auto_477480 ) ) ( not ( = ?auto_477476 ?auto_477481 ) ) ( not ( = ?auto_477476 ?auto_477482 ) ) ( not ( = ?auto_477476 ?auto_477483 ) ) ( not ( = ?auto_477476 ?auto_477484 ) ) ( not ( = ?auto_477477 ?auto_477478 ) ) ( not ( = ?auto_477477 ?auto_477479 ) ) ( not ( = ?auto_477477 ?auto_477480 ) ) ( not ( = ?auto_477477 ?auto_477481 ) ) ( not ( = ?auto_477477 ?auto_477482 ) ) ( not ( = ?auto_477477 ?auto_477483 ) ) ( not ( = ?auto_477477 ?auto_477484 ) ) ( not ( = ?auto_477478 ?auto_477479 ) ) ( not ( = ?auto_477478 ?auto_477480 ) ) ( not ( = ?auto_477478 ?auto_477481 ) ) ( not ( = ?auto_477478 ?auto_477482 ) ) ( not ( = ?auto_477478 ?auto_477483 ) ) ( not ( = ?auto_477478 ?auto_477484 ) ) ( not ( = ?auto_477479 ?auto_477480 ) ) ( not ( = ?auto_477479 ?auto_477481 ) ) ( not ( = ?auto_477479 ?auto_477482 ) ) ( not ( = ?auto_477479 ?auto_477483 ) ) ( not ( = ?auto_477479 ?auto_477484 ) ) ( not ( = ?auto_477480 ?auto_477481 ) ) ( not ( = ?auto_477480 ?auto_477482 ) ) ( not ( = ?auto_477480 ?auto_477483 ) ) ( not ( = ?auto_477480 ?auto_477484 ) ) ( not ( = ?auto_477481 ?auto_477482 ) ) ( not ( = ?auto_477481 ?auto_477483 ) ) ( not ( = ?auto_477481 ?auto_477484 ) ) ( not ( = ?auto_477482 ?auto_477483 ) ) ( not ( = ?auto_477482 ?auto_477484 ) ) ( not ( = ?auto_477483 ?auto_477484 ) ) ( ON ?auto_477469 ?auto_477485 ) ( not ( = ?auto_477484 ?auto_477485 ) ) ( not ( = ?auto_477483 ?auto_477485 ) ) ( not ( = ?auto_477482 ?auto_477485 ) ) ( not ( = ?auto_477481 ?auto_477485 ) ) ( not ( = ?auto_477480 ?auto_477485 ) ) ( not ( = ?auto_477479 ?auto_477485 ) ) ( not ( = ?auto_477478 ?auto_477485 ) ) ( not ( = ?auto_477477 ?auto_477485 ) ) ( not ( = ?auto_477476 ?auto_477485 ) ) ( not ( = ?auto_477475 ?auto_477485 ) ) ( not ( = ?auto_477474 ?auto_477485 ) ) ( not ( = ?auto_477473 ?auto_477485 ) ) ( not ( = ?auto_477472 ?auto_477485 ) ) ( not ( = ?auto_477471 ?auto_477485 ) ) ( not ( = ?auto_477470 ?auto_477485 ) ) ( not ( = ?auto_477469 ?auto_477485 ) ) ( ON ?auto_477470 ?auto_477469 ) ( ON ?auto_477471 ?auto_477470 ) ( ON ?auto_477472 ?auto_477471 ) ( ON ?auto_477473 ?auto_477472 ) ( ON ?auto_477474 ?auto_477473 ) ( ON ?auto_477475 ?auto_477474 ) ( ON ?auto_477476 ?auto_477475 ) ( ON ?auto_477477 ?auto_477476 ) ( ON ?auto_477478 ?auto_477477 ) ( ON ?auto_477479 ?auto_477478 ) ( ON ?auto_477480 ?auto_477479 ) ( ON ?auto_477481 ?auto_477480 ) ( ON ?auto_477482 ?auto_477481 ) ( ON ?auto_477483 ?auto_477482 ) ( ON ?auto_477484 ?auto_477483 ) ( CLEAR ?auto_477484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_477484 ?auto_477483 ?auto_477482 ?auto_477481 ?auto_477480 ?auto_477479 ?auto_477478 ?auto_477477 ?auto_477476 ?auto_477475 ?auto_477474 ?auto_477473 ?auto_477472 ?auto_477471 ?auto_477470 ?auto_477469 )
      ( MAKE-16PILE ?auto_477469 ?auto_477470 ?auto_477471 ?auto_477472 ?auto_477473 ?auto_477474 ?auto_477475 ?auto_477476 ?auto_477477 ?auto_477478 ?auto_477479 ?auto_477480 ?auto_477481 ?auto_477482 ?auto_477483 ?auto_477484 ) )
  )

)
