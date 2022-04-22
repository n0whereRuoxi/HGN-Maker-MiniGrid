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
      ?auto_801260 - BLOCK
    )
    :vars
    (
      ?auto_801261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801260 ?auto_801261 ) ( CLEAR ?auto_801260 ) ( HAND-EMPTY ) ( not ( = ?auto_801260 ?auto_801261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801260 ?auto_801261 )
      ( !PUTDOWN ?auto_801260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_801267 - BLOCK
      ?auto_801268 - BLOCK
    )
    :vars
    (
      ?auto_801269 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801267 ) ( ON ?auto_801268 ?auto_801269 ) ( CLEAR ?auto_801268 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801267 ) ( not ( = ?auto_801267 ?auto_801268 ) ) ( not ( = ?auto_801267 ?auto_801269 ) ) ( not ( = ?auto_801268 ?auto_801269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801268 ?auto_801269 )
      ( !STACK ?auto_801268 ?auto_801267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_801277 - BLOCK
      ?auto_801278 - BLOCK
    )
    :vars
    (
      ?auto_801279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801278 ?auto_801279 ) ( not ( = ?auto_801277 ?auto_801278 ) ) ( not ( = ?auto_801277 ?auto_801279 ) ) ( not ( = ?auto_801278 ?auto_801279 ) ) ( ON ?auto_801277 ?auto_801278 ) ( CLEAR ?auto_801277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801277 )
      ( MAKE-2PILE ?auto_801277 ?auto_801278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_801288 - BLOCK
      ?auto_801289 - BLOCK
      ?auto_801290 - BLOCK
    )
    :vars
    (
      ?auto_801291 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801289 ) ( ON ?auto_801290 ?auto_801291 ) ( CLEAR ?auto_801290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801288 ) ( ON ?auto_801289 ?auto_801288 ) ( not ( = ?auto_801288 ?auto_801289 ) ) ( not ( = ?auto_801288 ?auto_801290 ) ) ( not ( = ?auto_801288 ?auto_801291 ) ) ( not ( = ?auto_801289 ?auto_801290 ) ) ( not ( = ?auto_801289 ?auto_801291 ) ) ( not ( = ?auto_801290 ?auto_801291 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801290 ?auto_801291 )
      ( !STACK ?auto_801290 ?auto_801289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_801302 - BLOCK
      ?auto_801303 - BLOCK
      ?auto_801304 - BLOCK
    )
    :vars
    (
      ?auto_801305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801304 ?auto_801305 ) ( ON-TABLE ?auto_801302 ) ( not ( = ?auto_801302 ?auto_801303 ) ) ( not ( = ?auto_801302 ?auto_801304 ) ) ( not ( = ?auto_801302 ?auto_801305 ) ) ( not ( = ?auto_801303 ?auto_801304 ) ) ( not ( = ?auto_801303 ?auto_801305 ) ) ( not ( = ?auto_801304 ?auto_801305 ) ) ( CLEAR ?auto_801302 ) ( ON ?auto_801303 ?auto_801304 ) ( CLEAR ?auto_801303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801302 ?auto_801303 )
      ( MAKE-3PILE ?auto_801302 ?auto_801303 ?auto_801304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_801316 - BLOCK
      ?auto_801317 - BLOCK
      ?auto_801318 - BLOCK
    )
    :vars
    (
      ?auto_801319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801318 ?auto_801319 ) ( not ( = ?auto_801316 ?auto_801317 ) ) ( not ( = ?auto_801316 ?auto_801318 ) ) ( not ( = ?auto_801316 ?auto_801319 ) ) ( not ( = ?auto_801317 ?auto_801318 ) ) ( not ( = ?auto_801317 ?auto_801319 ) ) ( not ( = ?auto_801318 ?auto_801319 ) ) ( ON ?auto_801317 ?auto_801318 ) ( ON ?auto_801316 ?auto_801317 ) ( CLEAR ?auto_801316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801316 )
      ( MAKE-3PILE ?auto_801316 ?auto_801317 ?auto_801318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_801331 - BLOCK
      ?auto_801332 - BLOCK
      ?auto_801333 - BLOCK
      ?auto_801334 - BLOCK
    )
    :vars
    (
      ?auto_801335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801333 ) ( ON ?auto_801334 ?auto_801335 ) ( CLEAR ?auto_801334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801331 ) ( ON ?auto_801332 ?auto_801331 ) ( ON ?auto_801333 ?auto_801332 ) ( not ( = ?auto_801331 ?auto_801332 ) ) ( not ( = ?auto_801331 ?auto_801333 ) ) ( not ( = ?auto_801331 ?auto_801334 ) ) ( not ( = ?auto_801331 ?auto_801335 ) ) ( not ( = ?auto_801332 ?auto_801333 ) ) ( not ( = ?auto_801332 ?auto_801334 ) ) ( not ( = ?auto_801332 ?auto_801335 ) ) ( not ( = ?auto_801333 ?auto_801334 ) ) ( not ( = ?auto_801333 ?auto_801335 ) ) ( not ( = ?auto_801334 ?auto_801335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801334 ?auto_801335 )
      ( !STACK ?auto_801334 ?auto_801333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_801349 - BLOCK
      ?auto_801350 - BLOCK
      ?auto_801351 - BLOCK
      ?auto_801352 - BLOCK
    )
    :vars
    (
      ?auto_801353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801352 ?auto_801353 ) ( ON-TABLE ?auto_801349 ) ( ON ?auto_801350 ?auto_801349 ) ( not ( = ?auto_801349 ?auto_801350 ) ) ( not ( = ?auto_801349 ?auto_801351 ) ) ( not ( = ?auto_801349 ?auto_801352 ) ) ( not ( = ?auto_801349 ?auto_801353 ) ) ( not ( = ?auto_801350 ?auto_801351 ) ) ( not ( = ?auto_801350 ?auto_801352 ) ) ( not ( = ?auto_801350 ?auto_801353 ) ) ( not ( = ?auto_801351 ?auto_801352 ) ) ( not ( = ?auto_801351 ?auto_801353 ) ) ( not ( = ?auto_801352 ?auto_801353 ) ) ( CLEAR ?auto_801350 ) ( ON ?auto_801351 ?auto_801352 ) ( CLEAR ?auto_801351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_801349 ?auto_801350 ?auto_801351 )
      ( MAKE-4PILE ?auto_801349 ?auto_801350 ?auto_801351 ?auto_801352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_801367 - BLOCK
      ?auto_801368 - BLOCK
      ?auto_801369 - BLOCK
      ?auto_801370 - BLOCK
    )
    :vars
    (
      ?auto_801371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801370 ?auto_801371 ) ( ON-TABLE ?auto_801367 ) ( not ( = ?auto_801367 ?auto_801368 ) ) ( not ( = ?auto_801367 ?auto_801369 ) ) ( not ( = ?auto_801367 ?auto_801370 ) ) ( not ( = ?auto_801367 ?auto_801371 ) ) ( not ( = ?auto_801368 ?auto_801369 ) ) ( not ( = ?auto_801368 ?auto_801370 ) ) ( not ( = ?auto_801368 ?auto_801371 ) ) ( not ( = ?auto_801369 ?auto_801370 ) ) ( not ( = ?auto_801369 ?auto_801371 ) ) ( not ( = ?auto_801370 ?auto_801371 ) ) ( ON ?auto_801369 ?auto_801370 ) ( CLEAR ?auto_801367 ) ( ON ?auto_801368 ?auto_801369 ) ( CLEAR ?auto_801368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801367 ?auto_801368 )
      ( MAKE-4PILE ?auto_801367 ?auto_801368 ?auto_801369 ?auto_801370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_801385 - BLOCK
      ?auto_801386 - BLOCK
      ?auto_801387 - BLOCK
      ?auto_801388 - BLOCK
    )
    :vars
    (
      ?auto_801389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801388 ?auto_801389 ) ( not ( = ?auto_801385 ?auto_801386 ) ) ( not ( = ?auto_801385 ?auto_801387 ) ) ( not ( = ?auto_801385 ?auto_801388 ) ) ( not ( = ?auto_801385 ?auto_801389 ) ) ( not ( = ?auto_801386 ?auto_801387 ) ) ( not ( = ?auto_801386 ?auto_801388 ) ) ( not ( = ?auto_801386 ?auto_801389 ) ) ( not ( = ?auto_801387 ?auto_801388 ) ) ( not ( = ?auto_801387 ?auto_801389 ) ) ( not ( = ?auto_801388 ?auto_801389 ) ) ( ON ?auto_801387 ?auto_801388 ) ( ON ?auto_801386 ?auto_801387 ) ( ON ?auto_801385 ?auto_801386 ) ( CLEAR ?auto_801385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801385 )
      ( MAKE-4PILE ?auto_801385 ?auto_801386 ?auto_801387 ?auto_801388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_801404 - BLOCK
      ?auto_801405 - BLOCK
      ?auto_801406 - BLOCK
      ?auto_801407 - BLOCK
      ?auto_801408 - BLOCK
    )
    :vars
    (
      ?auto_801409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801407 ) ( ON ?auto_801408 ?auto_801409 ) ( CLEAR ?auto_801408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801404 ) ( ON ?auto_801405 ?auto_801404 ) ( ON ?auto_801406 ?auto_801405 ) ( ON ?auto_801407 ?auto_801406 ) ( not ( = ?auto_801404 ?auto_801405 ) ) ( not ( = ?auto_801404 ?auto_801406 ) ) ( not ( = ?auto_801404 ?auto_801407 ) ) ( not ( = ?auto_801404 ?auto_801408 ) ) ( not ( = ?auto_801404 ?auto_801409 ) ) ( not ( = ?auto_801405 ?auto_801406 ) ) ( not ( = ?auto_801405 ?auto_801407 ) ) ( not ( = ?auto_801405 ?auto_801408 ) ) ( not ( = ?auto_801405 ?auto_801409 ) ) ( not ( = ?auto_801406 ?auto_801407 ) ) ( not ( = ?auto_801406 ?auto_801408 ) ) ( not ( = ?auto_801406 ?auto_801409 ) ) ( not ( = ?auto_801407 ?auto_801408 ) ) ( not ( = ?auto_801407 ?auto_801409 ) ) ( not ( = ?auto_801408 ?auto_801409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801408 ?auto_801409 )
      ( !STACK ?auto_801408 ?auto_801407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_801426 - BLOCK
      ?auto_801427 - BLOCK
      ?auto_801428 - BLOCK
      ?auto_801429 - BLOCK
      ?auto_801430 - BLOCK
    )
    :vars
    (
      ?auto_801431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801430 ?auto_801431 ) ( ON-TABLE ?auto_801426 ) ( ON ?auto_801427 ?auto_801426 ) ( ON ?auto_801428 ?auto_801427 ) ( not ( = ?auto_801426 ?auto_801427 ) ) ( not ( = ?auto_801426 ?auto_801428 ) ) ( not ( = ?auto_801426 ?auto_801429 ) ) ( not ( = ?auto_801426 ?auto_801430 ) ) ( not ( = ?auto_801426 ?auto_801431 ) ) ( not ( = ?auto_801427 ?auto_801428 ) ) ( not ( = ?auto_801427 ?auto_801429 ) ) ( not ( = ?auto_801427 ?auto_801430 ) ) ( not ( = ?auto_801427 ?auto_801431 ) ) ( not ( = ?auto_801428 ?auto_801429 ) ) ( not ( = ?auto_801428 ?auto_801430 ) ) ( not ( = ?auto_801428 ?auto_801431 ) ) ( not ( = ?auto_801429 ?auto_801430 ) ) ( not ( = ?auto_801429 ?auto_801431 ) ) ( not ( = ?auto_801430 ?auto_801431 ) ) ( CLEAR ?auto_801428 ) ( ON ?auto_801429 ?auto_801430 ) ( CLEAR ?auto_801429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_801426 ?auto_801427 ?auto_801428 ?auto_801429 )
      ( MAKE-5PILE ?auto_801426 ?auto_801427 ?auto_801428 ?auto_801429 ?auto_801430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_801448 - BLOCK
      ?auto_801449 - BLOCK
      ?auto_801450 - BLOCK
      ?auto_801451 - BLOCK
      ?auto_801452 - BLOCK
    )
    :vars
    (
      ?auto_801453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801452 ?auto_801453 ) ( ON-TABLE ?auto_801448 ) ( ON ?auto_801449 ?auto_801448 ) ( not ( = ?auto_801448 ?auto_801449 ) ) ( not ( = ?auto_801448 ?auto_801450 ) ) ( not ( = ?auto_801448 ?auto_801451 ) ) ( not ( = ?auto_801448 ?auto_801452 ) ) ( not ( = ?auto_801448 ?auto_801453 ) ) ( not ( = ?auto_801449 ?auto_801450 ) ) ( not ( = ?auto_801449 ?auto_801451 ) ) ( not ( = ?auto_801449 ?auto_801452 ) ) ( not ( = ?auto_801449 ?auto_801453 ) ) ( not ( = ?auto_801450 ?auto_801451 ) ) ( not ( = ?auto_801450 ?auto_801452 ) ) ( not ( = ?auto_801450 ?auto_801453 ) ) ( not ( = ?auto_801451 ?auto_801452 ) ) ( not ( = ?auto_801451 ?auto_801453 ) ) ( not ( = ?auto_801452 ?auto_801453 ) ) ( ON ?auto_801451 ?auto_801452 ) ( CLEAR ?auto_801449 ) ( ON ?auto_801450 ?auto_801451 ) ( CLEAR ?auto_801450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_801448 ?auto_801449 ?auto_801450 )
      ( MAKE-5PILE ?auto_801448 ?auto_801449 ?auto_801450 ?auto_801451 ?auto_801452 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_801470 - BLOCK
      ?auto_801471 - BLOCK
      ?auto_801472 - BLOCK
      ?auto_801473 - BLOCK
      ?auto_801474 - BLOCK
    )
    :vars
    (
      ?auto_801475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801474 ?auto_801475 ) ( ON-TABLE ?auto_801470 ) ( not ( = ?auto_801470 ?auto_801471 ) ) ( not ( = ?auto_801470 ?auto_801472 ) ) ( not ( = ?auto_801470 ?auto_801473 ) ) ( not ( = ?auto_801470 ?auto_801474 ) ) ( not ( = ?auto_801470 ?auto_801475 ) ) ( not ( = ?auto_801471 ?auto_801472 ) ) ( not ( = ?auto_801471 ?auto_801473 ) ) ( not ( = ?auto_801471 ?auto_801474 ) ) ( not ( = ?auto_801471 ?auto_801475 ) ) ( not ( = ?auto_801472 ?auto_801473 ) ) ( not ( = ?auto_801472 ?auto_801474 ) ) ( not ( = ?auto_801472 ?auto_801475 ) ) ( not ( = ?auto_801473 ?auto_801474 ) ) ( not ( = ?auto_801473 ?auto_801475 ) ) ( not ( = ?auto_801474 ?auto_801475 ) ) ( ON ?auto_801473 ?auto_801474 ) ( ON ?auto_801472 ?auto_801473 ) ( CLEAR ?auto_801470 ) ( ON ?auto_801471 ?auto_801472 ) ( CLEAR ?auto_801471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801470 ?auto_801471 )
      ( MAKE-5PILE ?auto_801470 ?auto_801471 ?auto_801472 ?auto_801473 ?auto_801474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_801492 - BLOCK
      ?auto_801493 - BLOCK
      ?auto_801494 - BLOCK
      ?auto_801495 - BLOCK
      ?auto_801496 - BLOCK
    )
    :vars
    (
      ?auto_801497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801496 ?auto_801497 ) ( not ( = ?auto_801492 ?auto_801493 ) ) ( not ( = ?auto_801492 ?auto_801494 ) ) ( not ( = ?auto_801492 ?auto_801495 ) ) ( not ( = ?auto_801492 ?auto_801496 ) ) ( not ( = ?auto_801492 ?auto_801497 ) ) ( not ( = ?auto_801493 ?auto_801494 ) ) ( not ( = ?auto_801493 ?auto_801495 ) ) ( not ( = ?auto_801493 ?auto_801496 ) ) ( not ( = ?auto_801493 ?auto_801497 ) ) ( not ( = ?auto_801494 ?auto_801495 ) ) ( not ( = ?auto_801494 ?auto_801496 ) ) ( not ( = ?auto_801494 ?auto_801497 ) ) ( not ( = ?auto_801495 ?auto_801496 ) ) ( not ( = ?auto_801495 ?auto_801497 ) ) ( not ( = ?auto_801496 ?auto_801497 ) ) ( ON ?auto_801495 ?auto_801496 ) ( ON ?auto_801494 ?auto_801495 ) ( ON ?auto_801493 ?auto_801494 ) ( ON ?auto_801492 ?auto_801493 ) ( CLEAR ?auto_801492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801492 )
      ( MAKE-5PILE ?auto_801492 ?auto_801493 ?auto_801494 ?auto_801495 ?auto_801496 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_801515 - BLOCK
      ?auto_801516 - BLOCK
      ?auto_801517 - BLOCK
      ?auto_801518 - BLOCK
      ?auto_801519 - BLOCK
      ?auto_801520 - BLOCK
    )
    :vars
    (
      ?auto_801521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801519 ) ( ON ?auto_801520 ?auto_801521 ) ( CLEAR ?auto_801520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801515 ) ( ON ?auto_801516 ?auto_801515 ) ( ON ?auto_801517 ?auto_801516 ) ( ON ?auto_801518 ?auto_801517 ) ( ON ?auto_801519 ?auto_801518 ) ( not ( = ?auto_801515 ?auto_801516 ) ) ( not ( = ?auto_801515 ?auto_801517 ) ) ( not ( = ?auto_801515 ?auto_801518 ) ) ( not ( = ?auto_801515 ?auto_801519 ) ) ( not ( = ?auto_801515 ?auto_801520 ) ) ( not ( = ?auto_801515 ?auto_801521 ) ) ( not ( = ?auto_801516 ?auto_801517 ) ) ( not ( = ?auto_801516 ?auto_801518 ) ) ( not ( = ?auto_801516 ?auto_801519 ) ) ( not ( = ?auto_801516 ?auto_801520 ) ) ( not ( = ?auto_801516 ?auto_801521 ) ) ( not ( = ?auto_801517 ?auto_801518 ) ) ( not ( = ?auto_801517 ?auto_801519 ) ) ( not ( = ?auto_801517 ?auto_801520 ) ) ( not ( = ?auto_801517 ?auto_801521 ) ) ( not ( = ?auto_801518 ?auto_801519 ) ) ( not ( = ?auto_801518 ?auto_801520 ) ) ( not ( = ?auto_801518 ?auto_801521 ) ) ( not ( = ?auto_801519 ?auto_801520 ) ) ( not ( = ?auto_801519 ?auto_801521 ) ) ( not ( = ?auto_801520 ?auto_801521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801520 ?auto_801521 )
      ( !STACK ?auto_801520 ?auto_801519 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_801541 - BLOCK
      ?auto_801542 - BLOCK
      ?auto_801543 - BLOCK
      ?auto_801544 - BLOCK
      ?auto_801545 - BLOCK
      ?auto_801546 - BLOCK
    )
    :vars
    (
      ?auto_801547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801546 ?auto_801547 ) ( ON-TABLE ?auto_801541 ) ( ON ?auto_801542 ?auto_801541 ) ( ON ?auto_801543 ?auto_801542 ) ( ON ?auto_801544 ?auto_801543 ) ( not ( = ?auto_801541 ?auto_801542 ) ) ( not ( = ?auto_801541 ?auto_801543 ) ) ( not ( = ?auto_801541 ?auto_801544 ) ) ( not ( = ?auto_801541 ?auto_801545 ) ) ( not ( = ?auto_801541 ?auto_801546 ) ) ( not ( = ?auto_801541 ?auto_801547 ) ) ( not ( = ?auto_801542 ?auto_801543 ) ) ( not ( = ?auto_801542 ?auto_801544 ) ) ( not ( = ?auto_801542 ?auto_801545 ) ) ( not ( = ?auto_801542 ?auto_801546 ) ) ( not ( = ?auto_801542 ?auto_801547 ) ) ( not ( = ?auto_801543 ?auto_801544 ) ) ( not ( = ?auto_801543 ?auto_801545 ) ) ( not ( = ?auto_801543 ?auto_801546 ) ) ( not ( = ?auto_801543 ?auto_801547 ) ) ( not ( = ?auto_801544 ?auto_801545 ) ) ( not ( = ?auto_801544 ?auto_801546 ) ) ( not ( = ?auto_801544 ?auto_801547 ) ) ( not ( = ?auto_801545 ?auto_801546 ) ) ( not ( = ?auto_801545 ?auto_801547 ) ) ( not ( = ?auto_801546 ?auto_801547 ) ) ( CLEAR ?auto_801544 ) ( ON ?auto_801545 ?auto_801546 ) ( CLEAR ?auto_801545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_801541 ?auto_801542 ?auto_801543 ?auto_801544 ?auto_801545 )
      ( MAKE-6PILE ?auto_801541 ?auto_801542 ?auto_801543 ?auto_801544 ?auto_801545 ?auto_801546 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_801567 - BLOCK
      ?auto_801568 - BLOCK
      ?auto_801569 - BLOCK
      ?auto_801570 - BLOCK
      ?auto_801571 - BLOCK
      ?auto_801572 - BLOCK
    )
    :vars
    (
      ?auto_801573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801572 ?auto_801573 ) ( ON-TABLE ?auto_801567 ) ( ON ?auto_801568 ?auto_801567 ) ( ON ?auto_801569 ?auto_801568 ) ( not ( = ?auto_801567 ?auto_801568 ) ) ( not ( = ?auto_801567 ?auto_801569 ) ) ( not ( = ?auto_801567 ?auto_801570 ) ) ( not ( = ?auto_801567 ?auto_801571 ) ) ( not ( = ?auto_801567 ?auto_801572 ) ) ( not ( = ?auto_801567 ?auto_801573 ) ) ( not ( = ?auto_801568 ?auto_801569 ) ) ( not ( = ?auto_801568 ?auto_801570 ) ) ( not ( = ?auto_801568 ?auto_801571 ) ) ( not ( = ?auto_801568 ?auto_801572 ) ) ( not ( = ?auto_801568 ?auto_801573 ) ) ( not ( = ?auto_801569 ?auto_801570 ) ) ( not ( = ?auto_801569 ?auto_801571 ) ) ( not ( = ?auto_801569 ?auto_801572 ) ) ( not ( = ?auto_801569 ?auto_801573 ) ) ( not ( = ?auto_801570 ?auto_801571 ) ) ( not ( = ?auto_801570 ?auto_801572 ) ) ( not ( = ?auto_801570 ?auto_801573 ) ) ( not ( = ?auto_801571 ?auto_801572 ) ) ( not ( = ?auto_801571 ?auto_801573 ) ) ( not ( = ?auto_801572 ?auto_801573 ) ) ( ON ?auto_801571 ?auto_801572 ) ( CLEAR ?auto_801569 ) ( ON ?auto_801570 ?auto_801571 ) ( CLEAR ?auto_801570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_801567 ?auto_801568 ?auto_801569 ?auto_801570 )
      ( MAKE-6PILE ?auto_801567 ?auto_801568 ?auto_801569 ?auto_801570 ?auto_801571 ?auto_801572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_801593 - BLOCK
      ?auto_801594 - BLOCK
      ?auto_801595 - BLOCK
      ?auto_801596 - BLOCK
      ?auto_801597 - BLOCK
      ?auto_801598 - BLOCK
    )
    :vars
    (
      ?auto_801599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801598 ?auto_801599 ) ( ON-TABLE ?auto_801593 ) ( ON ?auto_801594 ?auto_801593 ) ( not ( = ?auto_801593 ?auto_801594 ) ) ( not ( = ?auto_801593 ?auto_801595 ) ) ( not ( = ?auto_801593 ?auto_801596 ) ) ( not ( = ?auto_801593 ?auto_801597 ) ) ( not ( = ?auto_801593 ?auto_801598 ) ) ( not ( = ?auto_801593 ?auto_801599 ) ) ( not ( = ?auto_801594 ?auto_801595 ) ) ( not ( = ?auto_801594 ?auto_801596 ) ) ( not ( = ?auto_801594 ?auto_801597 ) ) ( not ( = ?auto_801594 ?auto_801598 ) ) ( not ( = ?auto_801594 ?auto_801599 ) ) ( not ( = ?auto_801595 ?auto_801596 ) ) ( not ( = ?auto_801595 ?auto_801597 ) ) ( not ( = ?auto_801595 ?auto_801598 ) ) ( not ( = ?auto_801595 ?auto_801599 ) ) ( not ( = ?auto_801596 ?auto_801597 ) ) ( not ( = ?auto_801596 ?auto_801598 ) ) ( not ( = ?auto_801596 ?auto_801599 ) ) ( not ( = ?auto_801597 ?auto_801598 ) ) ( not ( = ?auto_801597 ?auto_801599 ) ) ( not ( = ?auto_801598 ?auto_801599 ) ) ( ON ?auto_801597 ?auto_801598 ) ( ON ?auto_801596 ?auto_801597 ) ( CLEAR ?auto_801594 ) ( ON ?auto_801595 ?auto_801596 ) ( CLEAR ?auto_801595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_801593 ?auto_801594 ?auto_801595 )
      ( MAKE-6PILE ?auto_801593 ?auto_801594 ?auto_801595 ?auto_801596 ?auto_801597 ?auto_801598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_801619 - BLOCK
      ?auto_801620 - BLOCK
      ?auto_801621 - BLOCK
      ?auto_801622 - BLOCK
      ?auto_801623 - BLOCK
      ?auto_801624 - BLOCK
    )
    :vars
    (
      ?auto_801625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801624 ?auto_801625 ) ( ON-TABLE ?auto_801619 ) ( not ( = ?auto_801619 ?auto_801620 ) ) ( not ( = ?auto_801619 ?auto_801621 ) ) ( not ( = ?auto_801619 ?auto_801622 ) ) ( not ( = ?auto_801619 ?auto_801623 ) ) ( not ( = ?auto_801619 ?auto_801624 ) ) ( not ( = ?auto_801619 ?auto_801625 ) ) ( not ( = ?auto_801620 ?auto_801621 ) ) ( not ( = ?auto_801620 ?auto_801622 ) ) ( not ( = ?auto_801620 ?auto_801623 ) ) ( not ( = ?auto_801620 ?auto_801624 ) ) ( not ( = ?auto_801620 ?auto_801625 ) ) ( not ( = ?auto_801621 ?auto_801622 ) ) ( not ( = ?auto_801621 ?auto_801623 ) ) ( not ( = ?auto_801621 ?auto_801624 ) ) ( not ( = ?auto_801621 ?auto_801625 ) ) ( not ( = ?auto_801622 ?auto_801623 ) ) ( not ( = ?auto_801622 ?auto_801624 ) ) ( not ( = ?auto_801622 ?auto_801625 ) ) ( not ( = ?auto_801623 ?auto_801624 ) ) ( not ( = ?auto_801623 ?auto_801625 ) ) ( not ( = ?auto_801624 ?auto_801625 ) ) ( ON ?auto_801623 ?auto_801624 ) ( ON ?auto_801622 ?auto_801623 ) ( ON ?auto_801621 ?auto_801622 ) ( CLEAR ?auto_801619 ) ( ON ?auto_801620 ?auto_801621 ) ( CLEAR ?auto_801620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801619 ?auto_801620 )
      ( MAKE-6PILE ?auto_801619 ?auto_801620 ?auto_801621 ?auto_801622 ?auto_801623 ?auto_801624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_801645 - BLOCK
      ?auto_801646 - BLOCK
      ?auto_801647 - BLOCK
      ?auto_801648 - BLOCK
      ?auto_801649 - BLOCK
      ?auto_801650 - BLOCK
    )
    :vars
    (
      ?auto_801651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801650 ?auto_801651 ) ( not ( = ?auto_801645 ?auto_801646 ) ) ( not ( = ?auto_801645 ?auto_801647 ) ) ( not ( = ?auto_801645 ?auto_801648 ) ) ( not ( = ?auto_801645 ?auto_801649 ) ) ( not ( = ?auto_801645 ?auto_801650 ) ) ( not ( = ?auto_801645 ?auto_801651 ) ) ( not ( = ?auto_801646 ?auto_801647 ) ) ( not ( = ?auto_801646 ?auto_801648 ) ) ( not ( = ?auto_801646 ?auto_801649 ) ) ( not ( = ?auto_801646 ?auto_801650 ) ) ( not ( = ?auto_801646 ?auto_801651 ) ) ( not ( = ?auto_801647 ?auto_801648 ) ) ( not ( = ?auto_801647 ?auto_801649 ) ) ( not ( = ?auto_801647 ?auto_801650 ) ) ( not ( = ?auto_801647 ?auto_801651 ) ) ( not ( = ?auto_801648 ?auto_801649 ) ) ( not ( = ?auto_801648 ?auto_801650 ) ) ( not ( = ?auto_801648 ?auto_801651 ) ) ( not ( = ?auto_801649 ?auto_801650 ) ) ( not ( = ?auto_801649 ?auto_801651 ) ) ( not ( = ?auto_801650 ?auto_801651 ) ) ( ON ?auto_801649 ?auto_801650 ) ( ON ?auto_801648 ?auto_801649 ) ( ON ?auto_801647 ?auto_801648 ) ( ON ?auto_801646 ?auto_801647 ) ( ON ?auto_801645 ?auto_801646 ) ( CLEAR ?auto_801645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801645 )
      ( MAKE-6PILE ?auto_801645 ?auto_801646 ?auto_801647 ?auto_801648 ?auto_801649 ?auto_801650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801672 - BLOCK
      ?auto_801673 - BLOCK
      ?auto_801674 - BLOCK
      ?auto_801675 - BLOCK
      ?auto_801676 - BLOCK
      ?auto_801677 - BLOCK
      ?auto_801678 - BLOCK
    )
    :vars
    (
      ?auto_801679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801677 ) ( ON ?auto_801678 ?auto_801679 ) ( CLEAR ?auto_801678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801672 ) ( ON ?auto_801673 ?auto_801672 ) ( ON ?auto_801674 ?auto_801673 ) ( ON ?auto_801675 ?auto_801674 ) ( ON ?auto_801676 ?auto_801675 ) ( ON ?auto_801677 ?auto_801676 ) ( not ( = ?auto_801672 ?auto_801673 ) ) ( not ( = ?auto_801672 ?auto_801674 ) ) ( not ( = ?auto_801672 ?auto_801675 ) ) ( not ( = ?auto_801672 ?auto_801676 ) ) ( not ( = ?auto_801672 ?auto_801677 ) ) ( not ( = ?auto_801672 ?auto_801678 ) ) ( not ( = ?auto_801672 ?auto_801679 ) ) ( not ( = ?auto_801673 ?auto_801674 ) ) ( not ( = ?auto_801673 ?auto_801675 ) ) ( not ( = ?auto_801673 ?auto_801676 ) ) ( not ( = ?auto_801673 ?auto_801677 ) ) ( not ( = ?auto_801673 ?auto_801678 ) ) ( not ( = ?auto_801673 ?auto_801679 ) ) ( not ( = ?auto_801674 ?auto_801675 ) ) ( not ( = ?auto_801674 ?auto_801676 ) ) ( not ( = ?auto_801674 ?auto_801677 ) ) ( not ( = ?auto_801674 ?auto_801678 ) ) ( not ( = ?auto_801674 ?auto_801679 ) ) ( not ( = ?auto_801675 ?auto_801676 ) ) ( not ( = ?auto_801675 ?auto_801677 ) ) ( not ( = ?auto_801675 ?auto_801678 ) ) ( not ( = ?auto_801675 ?auto_801679 ) ) ( not ( = ?auto_801676 ?auto_801677 ) ) ( not ( = ?auto_801676 ?auto_801678 ) ) ( not ( = ?auto_801676 ?auto_801679 ) ) ( not ( = ?auto_801677 ?auto_801678 ) ) ( not ( = ?auto_801677 ?auto_801679 ) ) ( not ( = ?auto_801678 ?auto_801679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801678 ?auto_801679 )
      ( !STACK ?auto_801678 ?auto_801677 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801702 - BLOCK
      ?auto_801703 - BLOCK
      ?auto_801704 - BLOCK
      ?auto_801705 - BLOCK
      ?auto_801706 - BLOCK
      ?auto_801707 - BLOCK
      ?auto_801708 - BLOCK
    )
    :vars
    (
      ?auto_801709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801708 ?auto_801709 ) ( ON-TABLE ?auto_801702 ) ( ON ?auto_801703 ?auto_801702 ) ( ON ?auto_801704 ?auto_801703 ) ( ON ?auto_801705 ?auto_801704 ) ( ON ?auto_801706 ?auto_801705 ) ( not ( = ?auto_801702 ?auto_801703 ) ) ( not ( = ?auto_801702 ?auto_801704 ) ) ( not ( = ?auto_801702 ?auto_801705 ) ) ( not ( = ?auto_801702 ?auto_801706 ) ) ( not ( = ?auto_801702 ?auto_801707 ) ) ( not ( = ?auto_801702 ?auto_801708 ) ) ( not ( = ?auto_801702 ?auto_801709 ) ) ( not ( = ?auto_801703 ?auto_801704 ) ) ( not ( = ?auto_801703 ?auto_801705 ) ) ( not ( = ?auto_801703 ?auto_801706 ) ) ( not ( = ?auto_801703 ?auto_801707 ) ) ( not ( = ?auto_801703 ?auto_801708 ) ) ( not ( = ?auto_801703 ?auto_801709 ) ) ( not ( = ?auto_801704 ?auto_801705 ) ) ( not ( = ?auto_801704 ?auto_801706 ) ) ( not ( = ?auto_801704 ?auto_801707 ) ) ( not ( = ?auto_801704 ?auto_801708 ) ) ( not ( = ?auto_801704 ?auto_801709 ) ) ( not ( = ?auto_801705 ?auto_801706 ) ) ( not ( = ?auto_801705 ?auto_801707 ) ) ( not ( = ?auto_801705 ?auto_801708 ) ) ( not ( = ?auto_801705 ?auto_801709 ) ) ( not ( = ?auto_801706 ?auto_801707 ) ) ( not ( = ?auto_801706 ?auto_801708 ) ) ( not ( = ?auto_801706 ?auto_801709 ) ) ( not ( = ?auto_801707 ?auto_801708 ) ) ( not ( = ?auto_801707 ?auto_801709 ) ) ( not ( = ?auto_801708 ?auto_801709 ) ) ( CLEAR ?auto_801706 ) ( ON ?auto_801707 ?auto_801708 ) ( CLEAR ?auto_801707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_801702 ?auto_801703 ?auto_801704 ?auto_801705 ?auto_801706 ?auto_801707 )
      ( MAKE-7PILE ?auto_801702 ?auto_801703 ?auto_801704 ?auto_801705 ?auto_801706 ?auto_801707 ?auto_801708 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801732 - BLOCK
      ?auto_801733 - BLOCK
      ?auto_801734 - BLOCK
      ?auto_801735 - BLOCK
      ?auto_801736 - BLOCK
      ?auto_801737 - BLOCK
      ?auto_801738 - BLOCK
    )
    :vars
    (
      ?auto_801739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801738 ?auto_801739 ) ( ON-TABLE ?auto_801732 ) ( ON ?auto_801733 ?auto_801732 ) ( ON ?auto_801734 ?auto_801733 ) ( ON ?auto_801735 ?auto_801734 ) ( not ( = ?auto_801732 ?auto_801733 ) ) ( not ( = ?auto_801732 ?auto_801734 ) ) ( not ( = ?auto_801732 ?auto_801735 ) ) ( not ( = ?auto_801732 ?auto_801736 ) ) ( not ( = ?auto_801732 ?auto_801737 ) ) ( not ( = ?auto_801732 ?auto_801738 ) ) ( not ( = ?auto_801732 ?auto_801739 ) ) ( not ( = ?auto_801733 ?auto_801734 ) ) ( not ( = ?auto_801733 ?auto_801735 ) ) ( not ( = ?auto_801733 ?auto_801736 ) ) ( not ( = ?auto_801733 ?auto_801737 ) ) ( not ( = ?auto_801733 ?auto_801738 ) ) ( not ( = ?auto_801733 ?auto_801739 ) ) ( not ( = ?auto_801734 ?auto_801735 ) ) ( not ( = ?auto_801734 ?auto_801736 ) ) ( not ( = ?auto_801734 ?auto_801737 ) ) ( not ( = ?auto_801734 ?auto_801738 ) ) ( not ( = ?auto_801734 ?auto_801739 ) ) ( not ( = ?auto_801735 ?auto_801736 ) ) ( not ( = ?auto_801735 ?auto_801737 ) ) ( not ( = ?auto_801735 ?auto_801738 ) ) ( not ( = ?auto_801735 ?auto_801739 ) ) ( not ( = ?auto_801736 ?auto_801737 ) ) ( not ( = ?auto_801736 ?auto_801738 ) ) ( not ( = ?auto_801736 ?auto_801739 ) ) ( not ( = ?auto_801737 ?auto_801738 ) ) ( not ( = ?auto_801737 ?auto_801739 ) ) ( not ( = ?auto_801738 ?auto_801739 ) ) ( ON ?auto_801737 ?auto_801738 ) ( CLEAR ?auto_801735 ) ( ON ?auto_801736 ?auto_801737 ) ( CLEAR ?auto_801736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_801732 ?auto_801733 ?auto_801734 ?auto_801735 ?auto_801736 )
      ( MAKE-7PILE ?auto_801732 ?auto_801733 ?auto_801734 ?auto_801735 ?auto_801736 ?auto_801737 ?auto_801738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801762 - BLOCK
      ?auto_801763 - BLOCK
      ?auto_801764 - BLOCK
      ?auto_801765 - BLOCK
      ?auto_801766 - BLOCK
      ?auto_801767 - BLOCK
      ?auto_801768 - BLOCK
    )
    :vars
    (
      ?auto_801769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801768 ?auto_801769 ) ( ON-TABLE ?auto_801762 ) ( ON ?auto_801763 ?auto_801762 ) ( ON ?auto_801764 ?auto_801763 ) ( not ( = ?auto_801762 ?auto_801763 ) ) ( not ( = ?auto_801762 ?auto_801764 ) ) ( not ( = ?auto_801762 ?auto_801765 ) ) ( not ( = ?auto_801762 ?auto_801766 ) ) ( not ( = ?auto_801762 ?auto_801767 ) ) ( not ( = ?auto_801762 ?auto_801768 ) ) ( not ( = ?auto_801762 ?auto_801769 ) ) ( not ( = ?auto_801763 ?auto_801764 ) ) ( not ( = ?auto_801763 ?auto_801765 ) ) ( not ( = ?auto_801763 ?auto_801766 ) ) ( not ( = ?auto_801763 ?auto_801767 ) ) ( not ( = ?auto_801763 ?auto_801768 ) ) ( not ( = ?auto_801763 ?auto_801769 ) ) ( not ( = ?auto_801764 ?auto_801765 ) ) ( not ( = ?auto_801764 ?auto_801766 ) ) ( not ( = ?auto_801764 ?auto_801767 ) ) ( not ( = ?auto_801764 ?auto_801768 ) ) ( not ( = ?auto_801764 ?auto_801769 ) ) ( not ( = ?auto_801765 ?auto_801766 ) ) ( not ( = ?auto_801765 ?auto_801767 ) ) ( not ( = ?auto_801765 ?auto_801768 ) ) ( not ( = ?auto_801765 ?auto_801769 ) ) ( not ( = ?auto_801766 ?auto_801767 ) ) ( not ( = ?auto_801766 ?auto_801768 ) ) ( not ( = ?auto_801766 ?auto_801769 ) ) ( not ( = ?auto_801767 ?auto_801768 ) ) ( not ( = ?auto_801767 ?auto_801769 ) ) ( not ( = ?auto_801768 ?auto_801769 ) ) ( ON ?auto_801767 ?auto_801768 ) ( ON ?auto_801766 ?auto_801767 ) ( CLEAR ?auto_801764 ) ( ON ?auto_801765 ?auto_801766 ) ( CLEAR ?auto_801765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_801762 ?auto_801763 ?auto_801764 ?auto_801765 )
      ( MAKE-7PILE ?auto_801762 ?auto_801763 ?auto_801764 ?auto_801765 ?auto_801766 ?auto_801767 ?auto_801768 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801792 - BLOCK
      ?auto_801793 - BLOCK
      ?auto_801794 - BLOCK
      ?auto_801795 - BLOCK
      ?auto_801796 - BLOCK
      ?auto_801797 - BLOCK
      ?auto_801798 - BLOCK
    )
    :vars
    (
      ?auto_801799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801798 ?auto_801799 ) ( ON-TABLE ?auto_801792 ) ( ON ?auto_801793 ?auto_801792 ) ( not ( = ?auto_801792 ?auto_801793 ) ) ( not ( = ?auto_801792 ?auto_801794 ) ) ( not ( = ?auto_801792 ?auto_801795 ) ) ( not ( = ?auto_801792 ?auto_801796 ) ) ( not ( = ?auto_801792 ?auto_801797 ) ) ( not ( = ?auto_801792 ?auto_801798 ) ) ( not ( = ?auto_801792 ?auto_801799 ) ) ( not ( = ?auto_801793 ?auto_801794 ) ) ( not ( = ?auto_801793 ?auto_801795 ) ) ( not ( = ?auto_801793 ?auto_801796 ) ) ( not ( = ?auto_801793 ?auto_801797 ) ) ( not ( = ?auto_801793 ?auto_801798 ) ) ( not ( = ?auto_801793 ?auto_801799 ) ) ( not ( = ?auto_801794 ?auto_801795 ) ) ( not ( = ?auto_801794 ?auto_801796 ) ) ( not ( = ?auto_801794 ?auto_801797 ) ) ( not ( = ?auto_801794 ?auto_801798 ) ) ( not ( = ?auto_801794 ?auto_801799 ) ) ( not ( = ?auto_801795 ?auto_801796 ) ) ( not ( = ?auto_801795 ?auto_801797 ) ) ( not ( = ?auto_801795 ?auto_801798 ) ) ( not ( = ?auto_801795 ?auto_801799 ) ) ( not ( = ?auto_801796 ?auto_801797 ) ) ( not ( = ?auto_801796 ?auto_801798 ) ) ( not ( = ?auto_801796 ?auto_801799 ) ) ( not ( = ?auto_801797 ?auto_801798 ) ) ( not ( = ?auto_801797 ?auto_801799 ) ) ( not ( = ?auto_801798 ?auto_801799 ) ) ( ON ?auto_801797 ?auto_801798 ) ( ON ?auto_801796 ?auto_801797 ) ( ON ?auto_801795 ?auto_801796 ) ( CLEAR ?auto_801793 ) ( ON ?auto_801794 ?auto_801795 ) ( CLEAR ?auto_801794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_801792 ?auto_801793 ?auto_801794 )
      ( MAKE-7PILE ?auto_801792 ?auto_801793 ?auto_801794 ?auto_801795 ?auto_801796 ?auto_801797 ?auto_801798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801822 - BLOCK
      ?auto_801823 - BLOCK
      ?auto_801824 - BLOCK
      ?auto_801825 - BLOCK
      ?auto_801826 - BLOCK
      ?auto_801827 - BLOCK
      ?auto_801828 - BLOCK
    )
    :vars
    (
      ?auto_801829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801828 ?auto_801829 ) ( ON-TABLE ?auto_801822 ) ( not ( = ?auto_801822 ?auto_801823 ) ) ( not ( = ?auto_801822 ?auto_801824 ) ) ( not ( = ?auto_801822 ?auto_801825 ) ) ( not ( = ?auto_801822 ?auto_801826 ) ) ( not ( = ?auto_801822 ?auto_801827 ) ) ( not ( = ?auto_801822 ?auto_801828 ) ) ( not ( = ?auto_801822 ?auto_801829 ) ) ( not ( = ?auto_801823 ?auto_801824 ) ) ( not ( = ?auto_801823 ?auto_801825 ) ) ( not ( = ?auto_801823 ?auto_801826 ) ) ( not ( = ?auto_801823 ?auto_801827 ) ) ( not ( = ?auto_801823 ?auto_801828 ) ) ( not ( = ?auto_801823 ?auto_801829 ) ) ( not ( = ?auto_801824 ?auto_801825 ) ) ( not ( = ?auto_801824 ?auto_801826 ) ) ( not ( = ?auto_801824 ?auto_801827 ) ) ( not ( = ?auto_801824 ?auto_801828 ) ) ( not ( = ?auto_801824 ?auto_801829 ) ) ( not ( = ?auto_801825 ?auto_801826 ) ) ( not ( = ?auto_801825 ?auto_801827 ) ) ( not ( = ?auto_801825 ?auto_801828 ) ) ( not ( = ?auto_801825 ?auto_801829 ) ) ( not ( = ?auto_801826 ?auto_801827 ) ) ( not ( = ?auto_801826 ?auto_801828 ) ) ( not ( = ?auto_801826 ?auto_801829 ) ) ( not ( = ?auto_801827 ?auto_801828 ) ) ( not ( = ?auto_801827 ?auto_801829 ) ) ( not ( = ?auto_801828 ?auto_801829 ) ) ( ON ?auto_801827 ?auto_801828 ) ( ON ?auto_801826 ?auto_801827 ) ( ON ?auto_801825 ?auto_801826 ) ( ON ?auto_801824 ?auto_801825 ) ( CLEAR ?auto_801822 ) ( ON ?auto_801823 ?auto_801824 ) ( CLEAR ?auto_801823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_801822 ?auto_801823 )
      ( MAKE-7PILE ?auto_801822 ?auto_801823 ?auto_801824 ?auto_801825 ?auto_801826 ?auto_801827 ?auto_801828 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_801852 - BLOCK
      ?auto_801853 - BLOCK
      ?auto_801854 - BLOCK
      ?auto_801855 - BLOCK
      ?auto_801856 - BLOCK
      ?auto_801857 - BLOCK
      ?auto_801858 - BLOCK
    )
    :vars
    (
      ?auto_801859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801858 ?auto_801859 ) ( not ( = ?auto_801852 ?auto_801853 ) ) ( not ( = ?auto_801852 ?auto_801854 ) ) ( not ( = ?auto_801852 ?auto_801855 ) ) ( not ( = ?auto_801852 ?auto_801856 ) ) ( not ( = ?auto_801852 ?auto_801857 ) ) ( not ( = ?auto_801852 ?auto_801858 ) ) ( not ( = ?auto_801852 ?auto_801859 ) ) ( not ( = ?auto_801853 ?auto_801854 ) ) ( not ( = ?auto_801853 ?auto_801855 ) ) ( not ( = ?auto_801853 ?auto_801856 ) ) ( not ( = ?auto_801853 ?auto_801857 ) ) ( not ( = ?auto_801853 ?auto_801858 ) ) ( not ( = ?auto_801853 ?auto_801859 ) ) ( not ( = ?auto_801854 ?auto_801855 ) ) ( not ( = ?auto_801854 ?auto_801856 ) ) ( not ( = ?auto_801854 ?auto_801857 ) ) ( not ( = ?auto_801854 ?auto_801858 ) ) ( not ( = ?auto_801854 ?auto_801859 ) ) ( not ( = ?auto_801855 ?auto_801856 ) ) ( not ( = ?auto_801855 ?auto_801857 ) ) ( not ( = ?auto_801855 ?auto_801858 ) ) ( not ( = ?auto_801855 ?auto_801859 ) ) ( not ( = ?auto_801856 ?auto_801857 ) ) ( not ( = ?auto_801856 ?auto_801858 ) ) ( not ( = ?auto_801856 ?auto_801859 ) ) ( not ( = ?auto_801857 ?auto_801858 ) ) ( not ( = ?auto_801857 ?auto_801859 ) ) ( not ( = ?auto_801858 ?auto_801859 ) ) ( ON ?auto_801857 ?auto_801858 ) ( ON ?auto_801856 ?auto_801857 ) ( ON ?auto_801855 ?auto_801856 ) ( ON ?auto_801854 ?auto_801855 ) ( ON ?auto_801853 ?auto_801854 ) ( ON ?auto_801852 ?auto_801853 ) ( CLEAR ?auto_801852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_801852 )
      ( MAKE-7PILE ?auto_801852 ?auto_801853 ?auto_801854 ?auto_801855 ?auto_801856 ?auto_801857 ?auto_801858 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_801883 - BLOCK
      ?auto_801884 - BLOCK
      ?auto_801885 - BLOCK
      ?auto_801886 - BLOCK
      ?auto_801887 - BLOCK
      ?auto_801888 - BLOCK
      ?auto_801889 - BLOCK
      ?auto_801890 - BLOCK
    )
    :vars
    (
      ?auto_801891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_801889 ) ( ON ?auto_801890 ?auto_801891 ) ( CLEAR ?auto_801890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_801883 ) ( ON ?auto_801884 ?auto_801883 ) ( ON ?auto_801885 ?auto_801884 ) ( ON ?auto_801886 ?auto_801885 ) ( ON ?auto_801887 ?auto_801886 ) ( ON ?auto_801888 ?auto_801887 ) ( ON ?auto_801889 ?auto_801888 ) ( not ( = ?auto_801883 ?auto_801884 ) ) ( not ( = ?auto_801883 ?auto_801885 ) ) ( not ( = ?auto_801883 ?auto_801886 ) ) ( not ( = ?auto_801883 ?auto_801887 ) ) ( not ( = ?auto_801883 ?auto_801888 ) ) ( not ( = ?auto_801883 ?auto_801889 ) ) ( not ( = ?auto_801883 ?auto_801890 ) ) ( not ( = ?auto_801883 ?auto_801891 ) ) ( not ( = ?auto_801884 ?auto_801885 ) ) ( not ( = ?auto_801884 ?auto_801886 ) ) ( not ( = ?auto_801884 ?auto_801887 ) ) ( not ( = ?auto_801884 ?auto_801888 ) ) ( not ( = ?auto_801884 ?auto_801889 ) ) ( not ( = ?auto_801884 ?auto_801890 ) ) ( not ( = ?auto_801884 ?auto_801891 ) ) ( not ( = ?auto_801885 ?auto_801886 ) ) ( not ( = ?auto_801885 ?auto_801887 ) ) ( not ( = ?auto_801885 ?auto_801888 ) ) ( not ( = ?auto_801885 ?auto_801889 ) ) ( not ( = ?auto_801885 ?auto_801890 ) ) ( not ( = ?auto_801885 ?auto_801891 ) ) ( not ( = ?auto_801886 ?auto_801887 ) ) ( not ( = ?auto_801886 ?auto_801888 ) ) ( not ( = ?auto_801886 ?auto_801889 ) ) ( not ( = ?auto_801886 ?auto_801890 ) ) ( not ( = ?auto_801886 ?auto_801891 ) ) ( not ( = ?auto_801887 ?auto_801888 ) ) ( not ( = ?auto_801887 ?auto_801889 ) ) ( not ( = ?auto_801887 ?auto_801890 ) ) ( not ( = ?auto_801887 ?auto_801891 ) ) ( not ( = ?auto_801888 ?auto_801889 ) ) ( not ( = ?auto_801888 ?auto_801890 ) ) ( not ( = ?auto_801888 ?auto_801891 ) ) ( not ( = ?auto_801889 ?auto_801890 ) ) ( not ( = ?auto_801889 ?auto_801891 ) ) ( not ( = ?auto_801890 ?auto_801891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801890 ?auto_801891 )
      ( !STACK ?auto_801890 ?auto_801889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_801917 - BLOCK
      ?auto_801918 - BLOCK
      ?auto_801919 - BLOCK
      ?auto_801920 - BLOCK
      ?auto_801921 - BLOCK
      ?auto_801922 - BLOCK
      ?auto_801923 - BLOCK
      ?auto_801924 - BLOCK
    )
    :vars
    (
      ?auto_801925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801924 ?auto_801925 ) ( ON-TABLE ?auto_801917 ) ( ON ?auto_801918 ?auto_801917 ) ( ON ?auto_801919 ?auto_801918 ) ( ON ?auto_801920 ?auto_801919 ) ( ON ?auto_801921 ?auto_801920 ) ( ON ?auto_801922 ?auto_801921 ) ( not ( = ?auto_801917 ?auto_801918 ) ) ( not ( = ?auto_801917 ?auto_801919 ) ) ( not ( = ?auto_801917 ?auto_801920 ) ) ( not ( = ?auto_801917 ?auto_801921 ) ) ( not ( = ?auto_801917 ?auto_801922 ) ) ( not ( = ?auto_801917 ?auto_801923 ) ) ( not ( = ?auto_801917 ?auto_801924 ) ) ( not ( = ?auto_801917 ?auto_801925 ) ) ( not ( = ?auto_801918 ?auto_801919 ) ) ( not ( = ?auto_801918 ?auto_801920 ) ) ( not ( = ?auto_801918 ?auto_801921 ) ) ( not ( = ?auto_801918 ?auto_801922 ) ) ( not ( = ?auto_801918 ?auto_801923 ) ) ( not ( = ?auto_801918 ?auto_801924 ) ) ( not ( = ?auto_801918 ?auto_801925 ) ) ( not ( = ?auto_801919 ?auto_801920 ) ) ( not ( = ?auto_801919 ?auto_801921 ) ) ( not ( = ?auto_801919 ?auto_801922 ) ) ( not ( = ?auto_801919 ?auto_801923 ) ) ( not ( = ?auto_801919 ?auto_801924 ) ) ( not ( = ?auto_801919 ?auto_801925 ) ) ( not ( = ?auto_801920 ?auto_801921 ) ) ( not ( = ?auto_801920 ?auto_801922 ) ) ( not ( = ?auto_801920 ?auto_801923 ) ) ( not ( = ?auto_801920 ?auto_801924 ) ) ( not ( = ?auto_801920 ?auto_801925 ) ) ( not ( = ?auto_801921 ?auto_801922 ) ) ( not ( = ?auto_801921 ?auto_801923 ) ) ( not ( = ?auto_801921 ?auto_801924 ) ) ( not ( = ?auto_801921 ?auto_801925 ) ) ( not ( = ?auto_801922 ?auto_801923 ) ) ( not ( = ?auto_801922 ?auto_801924 ) ) ( not ( = ?auto_801922 ?auto_801925 ) ) ( not ( = ?auto_801923 ?auto_801924 ) ) ( not ( = ?auto_801923 ?auto_801925 ) ) ( not ( = ?auto_801924 ?auto_801925 ) ) ( CLEAR ?auto_801922 ) ( ON ?auto_801923 ?auto_801924 ) ( CLEAR ?auto_801923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_801917 ?auto_801918 ?auto_801919 ?auto_801920 ?auto_801921 ?auto_801922 ?auto_801923 )
      ( MAKE-8PILE ?auto_801917 ?auto_801918 ?auto_801919 ?auto_801920 ?auto_801921 ?auto_801922 ?auto_801923 ?auto_801924 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_801951 - BLOCK
      ?auto_801952 - BLOCK
      ?auto_801953 - BLOCK
      ?auto_801954 - BLOCK
      ?auto_801955 - BLOCK
      ?auto_801956 - BLOCK
      ?auto_801957 - BLOCK
      ?auto_801958 - BLOCK
    )
    :vars
    (
      ?auto_801959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801958 ?auto_801959 ) ( ON-TABLE ?auto_801951 ) ( ON ?auto_801952 ?auto_801951 ) ( ON ?auto_801953 ?auto_801952 ) ( ON ?auto_801954 ?auto_801953 ) ( ON ?auto_801955 ?auto_801954 ) ( not ( = ?auto_801951 ?auto_801952 ) ) ( not ( = ?auto_801951 ?auto_801953 ) ) ( not ( = ?auto_801951 ?auto_801954 ) ) ( not ( = ?auto_801951 ?auto_801955 ) ) ( not ( = ?auto_801951 ?auto_801956 ) ) ( not ( = ?auto_801951 ?auto_801957 ) ) ( not ( = ?auto_801951 ?auto_801958 ) ) ( not ( = ?auto_801951 ?auto_801959 ) ) ( not ( = ?auto_801952 ?auto_801953 ) ) ( not ( = ?auto_801952 ?auto_801954 ) ) ( not ( = ?auto_801952 ?auto_801955 ) ) ( not ( = ?auto_801952 ?auto_801956 ) ) ( not ( = ?auto_801952 ?auto_801957 ) ) ( not ( = ?auto_801952 ?auto_801958 ) ) ( not ( = ?auto_801952 ?auto_801959 ) ) ( not ( = ?auto_801953 ?auto_801954 ) ) ( not ( = ?auto_801953 ?auto_801955 ) ) ( not ( = ?auto_801953 ?auto_801956 ) ) ( not ( = ?auto_801953 ?auto_801957 ) ) ( not ( = ?auto_801953 ?auto_801958 ) ) ( not ( = ?auto_801953 ?auto_801959 ) ) ( not ( = ?auto_801954 ?auto_801955 ) ) ( not ( = ?auto_801954 ?auto_801956 ) ) ( not ( = ?auto_801954 ?auto_801957 ) ) ( not ( = ?auto_801954 ?auto_801958 ) ) ( not ( = ?auto_801954 ?auto_801959 ) ) ( not ( = ?auto_801955 ?auto_801956 ) ) ( not ( = ?auto_801955 ?auto_801957 ) ) ( not ( = ?auto_801955 ?auto_801958 ) ) ( not ( = ?auto_801955 ?auto_801959 ) ) ( not ( = ?auto_801956 ?auto_801957 ) ) ( not ( = ?auto_801956 ?auto_801958 ) ) ( not ( = ?auto_801956 ?auto_801959 ) ) ( not ( = ?auto_801957 ?auto_801958 ) ) ( not ( = ?auto_801957 ?auto_801959 ) ) ( not ( = ?auto_801958 ?auto_801959 ) ) ( ON ?auto_801957 ?auto_801958 ) ( CLEAR ?auto_801955 ) ( ON ?auto_801956 ?auto_801957 ) ( CLEAR ?auto_801956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_801951 ?auto_801952 ?auto_801953 ?auto_801954 ?auto_801955 ?auto_801956 )
      ( MAKE-8PILE ?auto_801951 ?auto_801952 ?auto_801953 ?auto_801954 ?auto_801955 ?auto_801956 ?auto_801957 ?auto_801958 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_801985 - BLOCK
      ?auto_801986 - BLOCK
      ?auto_801987 - BLOCK
      ?auto_801988 - BLOCK
      ?auto_801989 - BLOCK
      ?auto_801990 - BLOCK
      ?auto_801991 - BLOCK
      ?auto_801992 - BLOCK
    )
    :vars
    (
      ?auto_801993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_801992 ?auto_801993 ) ( ON-TABLE ?auto_801985 ) ( ON ?auto_801986 ?auto_801985 ) ( ON ?auto_801987 ?auto_801986 ) ( ON ?auto_801988 ?auto_801987 ) ( not ( = ?auto_801985 ?auto_801986 ) ) ( not ( = ?auto_801985 ?auto_801987 ) ) ( not ( = ?auto_801985 ?auto_801988 ) ) ( not ( = ?auto_801985 ?auto_801989 ) ) ( not ( = ?auto_801985 ?auto_801990 ) ) ( not ( = ?auto_801985 ?auto_801991 ) ) ( not ( = ?auto_801985 ?auto_801992 ) ) ( not ( = ?auto_801985 ?auto_801993 ) ) ( not ( = ?auto_801986 ?auto_801987 ) ) ( not ( = ?auto_801986 ?auto_801988 ) ) ( not ( = ?auto_801986 ?auto_801989 ) ) ( not ( = ?auto_801986 ?auto_801990 ) ) ( not ( = ?auto_801986 ?auto_801991 ) ) ( not ( = ?auto_801986 ?auto_801992 ) ) ( not ( = ?auto_801986 ?auto_801993 ) ) ( not ( = ?auto_801987 ?auto_801988 ) ) ( not ( = ?auto_801987 ?auto_801989 ) ) ( not ( = ?auto_801987 ?auto_801990 ) ) ( not ( = ?auto_801987 ?auto_801991 ) ) ( not ( = ?auto_801987 ?auto_801992 ) ) ( not ( = ?auto_801987 ?auto_801993 ) ) ( not ( = ?auto_801988 ?auto_801989 ) ) ( not ( = ?auto_801988 ?auto_801990 ) ) ( not ( = ?auto_801988 ?auto_801991 ) ) ( not ( = ?auto_801988 ?auto_801992 ) ) ( not ( = ?auto_801988 ?auto_801993 ) ) ( not ( = ?auto_801989 ?auto_801990 ) ) ( not ( = ?auto_801989 ?auto_801991 ) ) ( not ( = ?auto_801989 ?auto_801992 ) ) ( not ( = ?auto_801989 ?auto_801993 ) ) ( not ( = ?auto_801990 ?auto_801991 ) ) ( not ( = ?auto_801990 ?auto_801992 ) ) ( not ( = ?auto_801990 ?auto_801993 ) ) ( not ( = ?auto_801991 ?auto_801992 ) ) ( not ( = ?auto_801991 ?auto_801993 ) ) ( not ( = ?auto_801992 ?auto_801993 ) ) ( ON ?auto_801991 ?auto_801992 ) ( ON ?auto_801990 ?auto_801991 ) ( CLEAR ?auto_801988 ) ( ON ?auto_801989 ?auto_801990 ) ( CLEAR ?auto_801989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_801985 ?auto_801986 ?auto_801987 ?auto_801988 ?auto_801989 )
      ( MAKE-8PILE ?auto_801985 ?auto_801986 ?auto_801987 ?auto_801988 ?auto_801989 ?auto_801990 ?auto_801991 ?auto_801992 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_802019 - BLOCK
      ?auto_802020 - BLOCK
      ?auto_802021 - BLOCK
      ?auto_802022 - BLOCK
      ?auto_802023 - BLOCK
      ?auto_802024 - BLOCK
      ?auto_802025 - BLOCK
      ?auto_802026 - BLOCK
    )
    :vars
    (
      ?auto_802027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802026 ?auto_802027 ) ( ON-TABLE ?auto_802019 ) ( ON ?auto_802020 ?auto_802019 ) ( ON ?auto_802021 ?auto_802020 ) ( not ( = ?auto_802019 ?auto_802020 ) ) ( not ( = ?auto_802019 ?auto_802021 ) ) ( not ( = ?auto_802019 ?auto_802022 ) ) ( not ( = ?auto_802019 ?auto_802023 ) ) ( not ( = ?auto_802019 ?auto_802024 ) ) ( not ( = ?auto_802019 ?auto_802025 ) ) ( not ( = ?auto_802019 ?auto_802026 ) ) ( not ( = ?auto_802019 ?auto_802027 ) ) ( not ( = ?auto_802020 ?auto_802021 ) ) ( not ( = ?auto_802020 ?auto_802022 ) ) ( not ( = ?auto_802020 ?auto_802023 ) ) ( not ( = ?auto_802020 ?auto_802024 ) ) ( not ( = ?auto_802020 ?auto_802025 ) ) ( not ( = ?auto_802020 ?auto_802026 ) ) ( not ( = ?auto_802020 ?auto_802027 ) ) ( not ( = ?auto_802021 ?auto_802022 ) ) ( not ( = ?auto_802021 ?auto_802023 ) ) ( not ( = ?auto_802021 ?auto_802024 ) ) ( not ( = ?auto_802021 ?auto_802025 ) ) ( not ( = ?auto_802021 ?auto_802026 ) ) ( not ( = ?auto_802021 ?auto_802027 ) ) ( not ( = ?auto_802022 ?auto_802023 ) ) ( not ( = ?auto_802022 ?auto_802024 ) ) ( not ( = ?auto_802022 ?auto_802025 ) ) ( not ( = ?auto_802022 ?auto_802026 ) ) ( not ( = ?auto_802022 ?auto_802027 ) ) ( not ( = ?auto_802023 ?auto_802024 ) ) ( not ( = ?auto_802023 ?auto_802025 ) ) ( not ( = ?auto_802023 ?auto_802026 ) ) ( not ( = ?auto_802023 ?auto_802027 ) ) ( not ( = ?auto_802024 ?auto_802025 ) ) ( not ( = ?auto_802024 ?auto_802026 ) ) ( not ( = ?auto_802024 ?auto_802027 ) ) ( not ( = ?auto_802025 ?auto_802026 ) ) ( not ( = ?auto_802025 ?auto_802027 ) ) ( not ( = ?auto_802026 ?auto_802027 ) ) ( ON ?auto_802025 ?auto_802026 ) ( ON ?auto_802024 ?auto_802025 ) ( ON ?auto_802023 ?auto_802024 ) ( CLEAR ?auto_802021 ) ( ON ?auto_802022 ?auto_802023 ) ( CLEAR ?auto_802022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_802019 ?auto_802020 ?auto_802021 ?auto_802022 )
      ( MAKE-8PILE ?auto_802019 ?auto_802020 ?auto_802021 ?auto_802022 ?auto_802023 ?auto_802024 ?auto_802025 ?auto_802026 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_802053 - BLOCK
      ?auto_802054 - BLOCK
      ?auto_802055 - BLOCK
      ?auto_802056 - BLOCK
      ?auto_802057 - BLOCK
      ?auto_802058 - BLOCK
      ?auto_802059 - BLOCK
      ?auto_802060 - BLOCK
    )
    :vars
    (
      ?auto_802061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802060 ?auto_802061 ) ( ON-TABLE ?auto_802053 ) ( ON ?auto_802054 ?auto_802053 ) ( not ( = ?auto_802053 ?auto_802054 ) ) ( not ( = ?auto_802053 ?auto_802055 ) ) ( not ( = ?auto_802053 ?auto_802056 ) ) ( not ( = ?auto_802053 ?auto_802057 ) ) ( not ( = ?auto_802053 ?auto_802058 ) ) ( not ( = ?auto_802053 ?auto_802059 ) ) ( not ( = ?auto_802053 ?auto_802060 ) ) ( not ( = ?auto_802053 ?auto_802061 ) ) ( not ( = ?auto_802054 ?auto_802055 ) ) ( not ( = ?auto_802054 ?auto_802056 ) ) ( not ( = ?auto_802054 ?auto_802057 ) ) ( not ( = ?auto_802054 ?auto_802058 ) ) ( not ( = ?auto_802054 ?auto_802059 ) ) ( not ( = ?auto_802054 ?auto_802060 ) ) ( not ( = ?auto_802054 ?auto_802061 ) ) ( not ( = ?auto_802055 ?auto_802056 ) ) ( not ( = ?auto_802055 ?auto_802057 ) ) ( not ( = ?auto_802055 ?auto_802058 ) ) ( not ( = ?auto_802055 ?auto_802059 ) ) ( not ( = ?auto_802055 ?auto_802060 ) ) ( not ( = ?auto_802055 ?auto_802061 ) ) ( not ( = ?auto_802056 ?auto_802057 ) ) ( not ( = ?auto_802056 ?auto_802058 ) ) ( not ( = ?auto_802056 ?auto_802059 ) ) ( not ( = ?auto_802056 ?auto_802060 ) ) ( not ( = ?auto_802056 ?auto_802061 ) ) ( not ( = ?auto_802057 ?auto_802058 ) ) ( not ( = ?auto_802057 ?auto_802059 ) ) ( not ( = ?auto_802057 ?auto_802060 ) ) ( not ( = ?auto_802057 ?auto_802061 ) ) ( not ( = ?auto_802058 ?auto_802059 ) ) ( not ( = ?auto_802058 ?auto_802060 ) ) ( not ( = ?auto_802058 ?auto_802061 ) ) ( not ( = ?auto_802059 ?auto_802060 ) ) ( not ( = ?auto_802059 ?auto_802061 ) ) ( not ( = ?auto_802060 ?auto_802061 ) ) ( ON ?auto_802059 ?auto_802060 ) ( ON ?auto_802058 ?auto_802059 ) ( ON ?auto_802057 ?auto_802058 ) ( ON ?auto_802056 ?auto_802057 ) ( CLEAR ?auto_802054 ) ( ON ?auto_802055 ?auto_802056 ) ( CLEAR ?auto_802055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_802053 ?auto_802054 ?auto_802055 )
      ( MAKE-8PILE ?auto_802053 ?auto_802054 ?auto_802055 ?auto_802056 ?auto_802057 ?auto_802058 ?auto_802059 ?auto_802060 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_802087 - BLOCK
      ?auto_802088 - BLOCK
      ?auto_802089 - BLOCK
      ?auto_802090 - BLOCK
      ?auto_802091 - BLOCK
      ?auto_802092 - BLOCK
      ?auto_802093 - BLOCK
      ?auto_802094 - BLOCK
    )
    :vars
    (
      ?auto_802095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802094 ?auto_802095 ) ( ON-TABLE ?auto_802087 ) ( not ( = ?auto_802087 ?auto_802088 ) ) ( not ( = ?auto_802087 ?auto_802089 ) ) ( not ( = ?auto_802087 ?auto_802090 ) ) ( not ( = ?auto_802087 ?auto_802091 ) ) ( not ( = ?auto_802087 ?auto_802092 ) ) ( not ( = ?auto_802087 ?auto_802093 ) ) ( not ( = ?auto_802087 ?auto_802094 ) ) ( not ( = ?auto_802087 ?auto_802095 ) ) ( not ( = ?auto_802088 ?auto_802089 ) ) ( not ( = ?auto_802088 ?auto_802090 ) ) ( not ( = ?auto_802088 ?auto_802091 ) ) ( not ( = ?auto_802088 ?auto_802092 ) ) ( not ( = ?auto_802088 ?auto_802093 ) ) ( not ( = ?auto_802088 ?auto_802094 ) ) ( not ( = ?auto_802088 ?auto_802095 ) ) ( not ( = ?auto_802089 ?auto_802090 ) ) ( not ( = ?auto_802089 ?auto_802091 ) ) ( not ( = ?auto_802089 ?auto_802092 ) ) ( not ( = ?auto_802089 ?auto_802093 ) ) ( not ( = ?auto_802089 ?auto_802094 ) ) ( not ( = ?auto_802089 ?auto_802095 ) ) ( not ( = ?auto_802090 ?auto_802091 ) ) ( not ( = ?auto_802090 ?auto_802092 ) ) ( not ( = ?auto_802090 ?auto_802093 ) ) ( not ( = ?auto_802090 ?auto_802094 ) ) ( not ( = ?auto_802090 ?auto_802095 ) ) ( not ( = ?auto_802091 ?auto_802092 ) ) ( not ( = ?auto_802091 ?auto_802093 ) ) ( not ( = ?auto_802091 ?auto_802094 ) ) ( not ( = ?auto_802091 ?auto_802095 ) ) ( not ( = ?auto_802092 ?auto_802093 ) ) ( not ( = ?auto_802092 ?auto_802094 ) ) ( not ( = ?auto_802092 ?auto_802095 ) ) ( not ( = ?auto_802093 ?auto_802094 ) ) ( not ( = ?auto_802093 ?auto_802095 ) ) ( not ( = ?auto_802094 ?auto_802095 ) ) ( ON ?auto_802093 ?auto_802094 ) ( ON ?auto_802092 ?auto_802093 ) ( ON ?auto_802091 ?auto_802092 ) ( ON ?auto_802090 ?auto_802091 ) ( ON ?auto_802089 ?auto_802090 ) ( CLEAR ?auto_802087 ) ( ON ?auto_802088 ?auto_802089 ) ( CLEAR ?auto_802088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_802087 ?auto_802088 )
      ( MAKE-8PILE ?auto_802087 ?auto_802088 ?auto_802089 ?auto_802090 ?auto_802091 ?auto_802092 ?auto_802093 ?auto_802094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_802121 - BLOCK
      ?auto_802122 - BLOCK
      ?auto_802123 - BLOCK
      ?auto_802124 - BLOCK
      ?auto_802125 - BLOCK
      ?auto_802126 - BLOCK
      ?auto_802127 - BLOCK
      ?auto_802128 - BLOCK
    )
    :vars
    (
      ?auto_802129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802128 ?auto_802129 ) ( not ( = ?auto_802121 ?auto_802122 ) ) ( not ( = ?auto_802121 ?auto_802123 ) ) ( not ( = ?auto_802121 ?auto_802124 ) ) ( not ( = ?auto_802121 ?auto_802125 ) ) ( not ( = ?auto_802121 ?auto_802126 ) ) ( not ( = ?auto_802121 ?auto_802127 ) ) ( not ( = ?auto_802121 ?auto_802128 ) ) ( not ( = ?auto_802121 ?auto_802129 ) ) ( not ( = ?auto_802122 ?auto_802123 ) ) ( not ( = ?auto_802122 ?auto_802124 ) ) ( not ( = ?auto_802122 ?auto_802125 ) ) ( not ( = ?auto_802122 ?auto_802126 ) ) ( not ( = ?auto_802122 ?auto_802127 ) ) ( not ( = ?auto_802122 ?auto_802128 ) ) ( not ( = ?auto_802122 ?auto_802129 ) ) ( not ( = ?auto_802123 ?auto_802124 ) ) ( not ( = ?auto_802123 ?auto_802125 ) ) ( not ( = ?auto_802123 ?auto_802126 ) ) ( not ( = ?auto_802123 ?auto_802127 ) ) ( not ( = ?auto_802123 ?auto_802128 ) ) ( not ( = ?auto_802123 ?auto_802129 ) ) ( not ( = ?auto_802124 ?auto_802125 ) ) ( not ( = ?auto_802124 ?auto_802126 ) ) ( not ( = ?auto_802124 ?auto_802127 ) ) ( not ( = ?auto_802124 ?auto_802128 ) ) ( not ( = ?auto_802124 ?auto_802129 ) ) ( not ( = ?auto_802125 ?auto_802126 ) ) ( not ( = ?auto_802125 ?auto_802127 ) ) ( not ( = ?auto_802125 ?auto_802128 ) ) ( not ( = ?auto_802125 ?auto_802129 ) ) ( not ( = ?auto_802126 ?auto_802127 ) ) ( not ( = ?auto_802126 ?auto_802128 ) ) ( not ( = ?auto_802126 ?auto_802129 ) ) ( not ( = ?auto_802127 ?auto_802128 ) ) ( not ( = ?auto_802127 ?auto_802129 ) ) ( not ( = ?auto_802128 ?auto_802129 ) ) ( ON ?auto_802127 ?auto_802128 ) ( ON ?auto_802126 ?auto_802127 ) ( ON ?auto_802125 ?auto_802126 ) ( ON ?auto_802124 ?auto_802125 ) ( ON ?auto_802123 ?auto_802124 ) ( ON ?auto_802122 ?auto_802123 ) ( ON ?auto_802121 ?auto_802122 ) ( CLEAR ?auto_802121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_802121 )
      ( MAKE-8PILE ?auto_802121 ?auto_802122 ?auto_802123 ?auto_802124 ?auto_802125 ?auto_802126 ?auto_802127 ?auto_802128 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802156 - BLOCK
      ?auto_802157 - BLOCK
      ?auto_802158 - BLOCK
      ?auto_802159 - BLOCK
      ?auto_802160 - BLOCK
      ?auto_802161 - BLOCK
      ?auto_802162 - BLOCK
      ?auto_802163 - BLOCK
      ?auto_802164 - BLOCK
    )
    :vars
    (
      ?auto_802165 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_802163 ) ( ON ?auto_802164 ?auto_802165 ) ( CLEAR ?auto_802164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_802156 ) ( ON ?auto_802157 ?auto_802156 ) ( ON ?auto_802158 ?auto_802157 ) ( ON ?auto_802159 ?auto_802158 ) ( ON ?auto_802160 ?auto_802159 ) ( ON ?auto_802161 ?auto_802160 ) ( ON ?auto_802162 ?auto_802161 ) ( ON ?auto_802163 ?auto_802162 ) ( not ( = ?auto_802156 ?auto_802157 ) ) ( not ( = ?auto_802156 ?auto_802158 ) ) ( not ( = ?auto_802156 ?auto_802159 ) ) ( not ( = ?auto_802156 ?auto_802160 ) ) ( not ( = ?auto_802156 ?auto_802161 ) ) ( not ( = ?auto_802156 ?auto_802162 ) ) ( not ( = ?auto_802156 ?auto_802163 ) ) ( not ( = ?auto_802156 ?auto_802164 ) ) ( not ( = ?auto_802156 ?auto_802165 ) ) ( not ( = ?auto_802157 ?auto_802158 ) ) ( not ( = ?auto_802157 ?auto_802159 ) ) ( not ( = ?auto_802157 ?auto_802160 ) ) ( not ( = ?auto_802157 ?auto_802161 ) ) ( not ( = ?auto_802157 ?auto_802162 ) ) ( not ( = ?auto_802157 ?auto_802163 ) ) ( not ( = ?auto_802157 ?auto_802164 ) ) ( not ( = ?auto_802157 ?auto_802165 ) ) ( not ( = ?auto_802158 ?auto_802159 ) ) ( not ( = ?auto_802158 ?auto_802160 ) ) ( not ( = ?auto_802158 ?auto_802161 ) ) ( not ( = ?auto_802158 ?auto_802162 ) ) ( not ( = ?auto_802158 ?auto_802163 ) ) ( not ( = ?auto_802158 ?auto_802164 ) ) ( not ( = ?auto_802158 ?auto_802165 ) ) ( not ( = ?auto_802159 ?auto_802160 ) ) ( not ( = ?auto_802159 ?auto_802161 ) ) ( not ( = ?auto_802159 ?auto_802162 ) ) ( not ( = ?auto_802159 ?auto_802163 ) ) ( not ( = ?auto_802159 ?auto_802164 ) ) ( not ( = ?auto_802159 ?auto_802165 ) ) ( not ( = ?auto_802160 ?auto_802161 ) ) ( not ( = ?auto_802160 ?auto_802162 ) ) ( not ( = ?auto_802160 ?auto_802163 ) ) ( not ( = ?auto_802160 ?auto_802164 ) ) ( not ( = ?auto_802160 ?auto_802165 ) ) ( not ( = ?auto_802161 ?auto_802162 ) ) ( not ( = ?auto_802161 ?auto_802163 ) ) ( not ( = ?auto_802161 ?auto_802164 ) ) ( not ( = ?auto_802161 ?auto_802165 ) ) ( not ( = ?auto_802162 ?auto_802163 ) ) ( not ( = ?auto_802162 ?auto_802164 ) ) ( not ( = ?auto_802162 ?auto_802165 ) ) ( not ( = ?auto_802163 ?auto_802164 ) ) ( not ( = ?auto_802163 ?auto_802165 ) ) ( not ( = ?auto_802164 ?auto_802165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_802164 ?auto_802165 )
      ( !STACK ?auto_802164 ?auto_802163 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802194 - BLOCK
      ?auto_802195 - BLOCK
      ?auto_802196 - BLOCK
      ?auto_802197 - BLOCK
      ?auto_802198 - BLOCK
      ?auto_802199 - BLOCK
      ?auto_802200 - BLOCK
      ?auto_802201 - BLOCK
      ?auto_802202 - BLOCK
    )
    :vars
    (
      ?auto_802203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802202 ?auto_802203 ) ( ON-TABLE ?auto_802194 ) ( ON ?auto_802195 ?auto_802194 ) ( ON ?auto_802196 ?auto_802195 ) ( ON ?auto_802197 ?auto_802196 ) ( ON ?auto_802198 ?auto_802197 ) ( ON ?auto_802199 ?auto_802198 ) ( ON ?auto_802200 ?auto_802199 ) ( not ( = ?auto_802194 ?auto_802195 ) ) ( not ( = ?auto_802194 ?auto_802196 ) ) ( not ( = ?auto_802194 ?auto_802197 ) ) ( not ( = ?auto_802194 ?auto_802198 ) ) ( not ( = ?auto_802194 ?auto_802199 ) ) ( not ( = ?auto_802194 ?auto_802200 ) ) ( not ( = ?auto_802194 ?auto_802201 ) ) ( not ( = ?auto_802194 ?auto_802202 ) ) ( not ( = ?auto_802194 ?auto_802203 ) ) ( not ( = ?auto_802195 ?auto_802196 ) ) ( not ( = ?auto_802195 ?auto_802197 ) ) ( not ( = ?auto_802195 ?auto_802198 ) ) ( not ( = ?auto_802195 ?auto_802199 ) ) ( not ( = ?auto_802195 ?auto_802200 ) ) ( not ( = ?auto_802195 ?auto_802201 ) ) ( not ( = ?auto_802195 ?auto_802202 ) ) ( not ( = ?auto_802195 ?auto_802203 ) ) ( not ( = ?auto_802196 ?auto_802197 ) ) ( not ( = ?auto_802196 ?auto_802198 ) ) ( not ( = ?auto_802196 ?auto_802199 ) ) ( not ( = ?auto_802196 ?auto_802200 ) ) ( not ( = ?auto_802196 ?auto_802201 ) ) ( not ( = ?auto_802196 ?auto_802202 ) ) ( not ( = ?auto_802196 ?auto_802203 ) ) ( not ( = ?auto_802197 ?auto_802198 ) ) ( not ( = ?auto_802197 ?auto_802199 ) ) ( not ( = ?auto_802197 ?auto_802200 ) ) ( not ( = ?auto_802197 ?auto_802201 ) ) ( not ( = ?auto_802197 ?auto_802202 ) ) ( not ( = ?auto_802197 ?auto_802203 ) ) ( not ( = ?auto_802198 ?auto_802199 ) ) ( not ( = ?auto_802198 ?auto_802200 ) ) ( not ( = ?auto_802198 ?auto_802201 ) ) ( not ( = ?auto_802198 ?auto_802202 ) ) ( not ( = ?auto_802198 ?auto_802203 ) ) ( not ( = ?auto_802199 ?auto_802200 ) ) ( not ( = ?auto_802199 ?auto_802201 ) ) ( not ( = ?auto_802199 ?auto_802202 ) ) ( not ( = ?auto_802199 ?auto_802203 ) ) ( not ( = ?auto_802200 ?auto_802201 ) ) ( not ( = ?auto_802200 ?auto_802202 ) ) ( not ( = ?auto_802200 ?auto_802203 ) ) ( not ( = ?auto_802201 ?auto_802202 ) ) ( not ( = ?auto_802201 ?auto_802203 ) ) ( not ( = ?auto_802202 ?auto_802203 ) ) ( CLEAR ?auto_802200 ) ( ON ?auto_802201 ?auto_802202 ) ( CLEAR ?auto_802201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_802194 ?auto_802195 ?auto_802196 ?auto_802197 ?auto_802198 ?auto_802199 ?auto_802200 ?auto_802201 )
      ( MAKE-9PILE ?auto_802194 ?auto_802195 ?auto_802196 ?auto_802197 ?auto_802198 ?auto_802199 ?auto_802200 ?auto_802201 ?auto_802202 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802232 - BLOCK
      ?auto_802233 - BLOCK
      ?auto_802234 - BLOCK
      ?auto_802235 - BLOCK
      ?auto_802236 - BLOCK
      ?auto_802237 - BLOCK
      ?auto_802238 - BLOCK
      ?auto_802239 - BLOCK
      ?auto_802240 - BLOCK
    )
    :vars
    (
      ?auto_802241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802240 ?auto_802241 ) ( ON-TABLE ?auto_802232 ) ( ON ?auto_802233 ?auto_802232 ) ( ON ?auto_802234 ?auto_802233 ) ( ON ?auto_802235 ?auto_802234 ) ( ON ?auto_802236 ?auto_802235 ) ( ON ?auto_802237 ?auto_802236 ) ( not ( = ?auto_802232 ?auto_802233 ) ) ( not ( = ?auto_802232 ?auto_802234 ) ) ( not ( = ?auto_802232 ?auto_802235 ) ) ( not ( = ?auto_802232 ?auto_802236 ) ) ( not ( = ?auto_802232 ?auto_802237 ) ) ( not ( = ?auto_802232 ?auto_802238 ) ) ( not ( = ?auto_802232 ?auto_802239 ) ) ( not ( = ?auto_802232 ?auto_802240 ) ) ( not ( = ?auto_802232 ?auto_802241 ) ) ( not ( = ?auto_802233 ?auto_802234 ) ) ( not ( = ?auto_802233 ?auto_802235 ) ) ( not ( = ?auto_802233 ?auto_802236 ) ) ( not ( = ?auto_802233 ?auto_802237 ) ) ( not ( = ?auto_802233 ?auto_802238 ) ) ( not ( = ?auto_802233 ?auto_802239 ) ) ( not ( = ?auto_802233 ?auto_802240 ) ) ( not ( = ?auto_802233 ?auto_802241 ) ) ( not ( = ?auto_802234 ?auto_802235 ) ) ( not ( = ?auto_802234 ?auto_802236 ) ) ( not ( = ?auto_802234 ?auto_802237 ) ) ( not ( = ?auto_802234 ?auto_802238 ) ) ( not ( = ?auto_802234 ?auto_802239 ) ) ( not ( = ?auto_802234 ?auto_802240 ) ) ( not ( = ?auto_802234 ?auto_802241 ) ) ( not ( = ?auto_802235 ?auto_802236 ) ) ( not ( = ?auto_802235 ?auto_802237 ) ) ( not ( = ?auto_802235 ?auto_802238 ) ) ( not ( = ?auto_802235 ?auto_802239 ) ) ( not ( = ?auto_802235 ?auto_802240 ) ) ( not ( = ?auto_802235 ?auto_802241 ) ) ( not ( = ?auto_802236 ?auto_802237 ) ) ( not ( = ?auto_802236 ?auto_802238 ) ) ( not ( = ?auto_802236 ?auto_802239 ) ) ( not ( = ?auto_802236 ?auto_802240 ) ) ( not ( = ?auto_802236 ?auto_802241 ) ) ( not ( = ?auto_802237 ?auto_802238 ) ) ( not ( = ?auto_802237 ?auto_802239 ) ) ( not ( = ?auto_802237 ?auto_802240 ) ) ( not ( = ?auto_802237 ?auto_802241 ) ) ( not ( = ?auto_802238 ?auto_802239 ) ) ( not ( = ?auto_802238 ?auto_802240 ) ) ( not ( = ?auto_802238 ?auto_802241 ) ) ( not ( = ?auto_802239 ?auto_802240 ) ) ( not ( = ?auto_802239 ?auto_802241 ) ) ( not ( = ?auto_802240 ?auto_802241 ) ) ( ON ?auto_802239 ?auto_802240 ) ( CLEAR ?auto_802237 ) ( ON ?auto_802238 ?auto_802239 ) ( CLEAR ?auto_802238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_802232 ?auto_802233 ?auto_802234 ?auto_802235 ?auto_802236 ?auto_802237 ?auto_802238 )
      ( MAKE-9PILE ?auto_802232 ?auto_802233 ?auto_802234 ?auto_802235 ?auto_802236 ?auto_802237 ?auto_802238 ?auto_802239 ?auto_802240 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802270 - BLOCK
      ?auto_802271 - BLOCK
      ?auto_802272 - BLOCK
      ?auto_802273 - BLOCK
      ?auto_802274 - BLOCK
      ?auto_802275 - BLOCK
      ?auto_802276 - BLOCK
      ?auto_802277 - BLOCK
      ?auto_802278 - BLOCK
    )
    :vars
    (
      ?auto_802279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802278 ?auto_802279 ) ( ON-TABLE ?auto_802270 ) ( ON ?auto_802271 ?auto_802270 ) ( ON ?auto_802272 ?auto_802271 ) ( ON ?auto_802273 ?auto_802272 ) ( ON ?auto_802274 ?auto_802273 ) ( not ( = ?auto_802270 ?auto_802271 ) ) ( not ( = ?auto_802270 ?auto_802272 ) ) ( not ( = ?auto_802270 ?auto_802273 ) ) ( not ( = ?auto_802270 ?auto_802274 ) ) ( not ( = ?auto_802270 ?auto_802275 ) ) ( not ( = ?auto_802270 ?auto_802276 ) ) ( not ( = ?auto_802270 ?auto_802277 ) ) ( not ( = ?auto_802270 ?auto_802278 ) ) ( not ( = ?auto_802270 ?auto_802279 ) ) ( not ( = ?auto_802271 ?auto_802272 ) ) ( not ( = ?auto_802271 ?auto_802273 ) ) ( not ( = ?auto_802271 ?auto_802274 ) ) ( not ( = ?auto_802271 ?auto_802275 ) ) ( not ( = ?auto_802271 ?auto_802276 ) ) ( not ( = ?auto_802271 ?auto_802277 ) ) ( not ( = ?auto_802271 ?auto_802278 ) ) ( not ( = ?auto_802271 ?auto_802279 ) ) ( not ( = ?auto_802272 ?auto_802273 ) ) ( not ( = ?auto_802272 ?auto_802274 ) ) ( not ( = ?auto_802272 ?auto_802275 ) ) ( not ( = ?auto_802272 ?auto_802276 ) ) ( not ( = ?auto_802272 ?auto_802277 ) ) ( not ( = ?auto_802272 ?auto_802278 ) ) ( not ( = ?auto_802272 ?auto_802279 ) ) ( not ( = ?auto_802273 ?auto_802274 ) ) ( not ( = ?auto_802273 ?auto_802275 ) ) ( not ( = ?auto_802273 ?auto_802276 ) ) ( not ( = ?auto_802273 ?auto_802277 ) ) ( not ( = ?auto_802273 ?auto_802278 ) ) ( not ( = ?auto_802273 ?auto_802279 ) ) ( not ( = ?auto_802274 ?auto_802275 ) ) ( not ( = ?auto_802274 ?auto_802276 ) ) ( not ( = ?auto_802274 ?auto_802277 ) ) ( not ( = ?auto_802274 ?auto_802278 ) ) ( not ( = ?auto_802274 ?auto_802279 ) ) ( not ( = ?auto_802275 ?auto_802276 ) ) ( not ( = ?auto_802275 ?auto_802277 ) ) ( not ( = ?auto_802275 ?auto_802278 ) ) ( not ( = ?auto_802275 ?auto_802279 ) ) ( not ( = ?auto_802276 ?auto_802277 ) ) ( not ( = ?auto_802276 ?auto_802278 ) ) ( not ( = ?auto_802276 ?auto_802279 ) ) ( not ( = ?auto_802277 ?auto_802278 ) ) ( not ( = ?auto_802277 ?auto_802279 ) ) ( not ( = ?auto_802278 ?auto_802279 ) ) ( ON ?auto_802277 ?auto_802278 ) ( ON ?auto_802276 ?auto_802277 ) ( CLEAR ?auto_802274 ) ( ON ?auto_802275 ?auto_802276 ) ( CLEAR ?auto_802275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_802270 ?auto_802271 ?auto_802272 ?auto_802273 ?auto_802274 ?auto_802275 )
      ( MAKE-9PILE ?auto_802270 ?auto_802271 ?auto_802272 ?auto_802273 ?auto_802274 ?auto_802275 ?auto_802276 ?auto_802277 ?auto_802278 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802308 - BLOCK
      ?auto_802309 - BLOCK
      ?auto_802310 - BLOCK
      ?auto_802311 - BLOCK
      ?auto_802312 - BLOCK
      ?auto_802313 - BLOCK
      ?auto_802314 - BLOCK
      ?auto_802315 - BLOCK
      ?auto_802316 - BLOCK
    )
    :vars
    (
      ?auto_802317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802316 ?auto_802317 ) ( ON-TABLE ?auto_802308 ) ( ON ?auto_802309 ?auto_802308 ) ( ON ?auto_802310 ?auto_802309 ) ( ON ?auto_802311 ?auto_802310 ) ( not ( = ?auto_802308 ?auto_802309 ) ) ( not ( = ?auto_802308 ?auto_802310 ) ) ( not ( = ?auto_802308 ?auto_802311 ) ) ( not ( = ?auto_802308 ?auto_802312 ) ) ( not ( = ?auto_802308 ?auto_802313 ) ) ( not ( = ?auto_802308 ?auto_802314 ) ) ( not ( = ?auto_802308 ?auto_802315 ) ) ( not ( = ?auto_802308 ?auto_802316 ) ) ( not ( = ?auto_802308 ?auto_802317 ) ) ( not ( = ?auto_802309 ?auto_802310 ) ) ( not ( = ?auto_802309 ?auto_802311 ) ) ( not ( = ?auto_802309 ?auto_802312 ) ) ( not ( = ?auto_802309 ?auto_802313 ) ) ( not ( = ?auto_802309 ?auto_802314 ) ) ( not ( = ?auto_802309 ?auto_802315 ) ) ( not ( = ?auto_802309 ?auto_802316 ) ) ( not ( = ?auto_802309 ?auto_802317 ) ) ( not ( = ?auto_802310 ?auto_802311 ) ) ( not ( = ?auto_802310 ?auto_802312 ) ) ( not ( = ?auto_802310 ?auto_802313 ) ) ( not ( = ?auto_802310 ?auto_802314 ) ) ( not ( = ?auto_802310 ?auto_802315 ) ) ( not ( = ?auto_802310 ?auto_802316 ) ) ( not ( = ?auto_802310 ?auto_802317 ) ) ( not ( = ?auto_802311 ?auto_802312 ) ) ( not ( = ?auto_802311 ?auto_802313 ) ) ( not ( = ?auto_802311 ?auto_802314 ) ) ( not ( = ?auto_802311 ?auto_802315 ) ) ( not ( = ?auto_802311 ?auto_802316 ) ) ( not ( = ?auto_802311 ?auto_802317 ) ) ( not ( = ?auto_802312 ?auto_802313 ) ) ( not ( = ?auto_802312 ?auto_802314 ) ) ( not ( = ?auto_802312 ?auto_802315 ) ) ( not ( = ?auto_802312 ?auto_802316 ) ) ( not ( = ?auto_802312 ?auto_802317 ) ) ( not ( = ?auto_802313 ?auto_802314 ) ) ( not ( = ?auto_802313 ?auto_802315 ) ) ( not ( = ?auto_802313 ?auto_802316 ) ) ( not ( = ?auto_802313 ?auto_802317 ) ) ( not ( = ?auto_802314 ?auto_802315 ) ) ( not ( = ?auto_802314 ?auto_802316 ) ) ( not ( = ?auto_802314 ?auto_802317 ) ) ( not ( = ?auto_802315 ?auto_802316 ) ) ( not ( = ?auto_802315 ?auto_802317 ) ) ( not ( = ?auto_802316 ?auto_802317 ) ) ( ON ?auto_802315 ?auto_802316 ) ( ON ?auto_802314 ?auto_802315 ) ( ON ?auto_802313 ?auto_802314 ) ( CLEAR ?auto_802311 ) ( ON ?auto_802312 ?auto_802313 ) ( CLEAR ?auto_802312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_802308 ?auto_802309 ?auto_802310 ?auto_802311 ?auto_802312 )
      ( MAKE-9PILE ?auto_802308 ?auto_802309 ?auto_802310 ?auto_802311 ?auto_802312 ?auto_802313 ?auto_802314 ?auto_802315 ?auto_802316 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802346 - BLOCK
      ?auto_802347 - BLOCK
      ?auto_802348 - BLOCK
      ?auto_802349 - BLOCK
      ?auto_802350 - BLOCK
      ?auto_802351 - BLOCK
      ?auto_802352 - BLOCK
      ?auto_802353 - BLOCK
      ?auto_802354 - BLOCK
    )
    :vars
    (
      ?auto_802355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802354 ?auto_802355 ) ( ON-TABLE ?auto_802346 ) ( ON ?auto_802347 ?auto_802346 ) ( ON ?auto_802348 ?auto_802347 ) ( not ( = ?auto_802346 ?auto_802347 ) ) ( not ( = ?auto_802346 ?auto_802348 ) ) ( not ( = ?auto_802346 ?auto_802349 ) ) ( not ( = ?auto_802346 ?auto_802350 ) ) ( not ( = ?auto_802346 ?auto_802351 ) ) ( not ( = ?auto_802346 ?auto_802352 ) ) ( not ( = ?auto_802346 ?auto_802353 ) ) ( not ( = ?auto_802346 ?auto_802354 ) ) ( not ( = ?auto_802346 ?auto_802355 ) ) ( not ( = ?auto_802347 ?auto_802348 ) ) ( not ( = ?auto_802347 ?auto_802349 ) ) ( not ( = ?auto_802347 ?auto_802350 ) ) ( not ( = ?auto_802347 ?auto_802351 ) ) ( not ( = ?auto_802347 ?auto_802352 ) ) ( not ( = ?auto_802347 ?auto_802353 ) ) ( not ( = ?auto_802347 ?auto_802354 ) ) ( not ( = ?auto_802347 ?auto_802355 ) ) ( not ( = ?auto_802348 ?auto_802349 ) ) ( not ( = ?auto_802348 ?auto_802350 ) ) ( not ( = ?auto_802348 ?auto_802351 ) ) ( not ( = ?auto_802348 ?auto_802352 ) ) ( not ( = ?auto_802348 ?auto_802353 ) ) ( not ( = ?auto_802348 ?auto_802354 ) ) ( not ( = ?auto_802348 ?auto_802355 ) ) ( not ( = ?auto_802349 ?auto_802350 ) ) ( not ( = ?auto_802349 ?auto_802351 ) ) ( not ( = ?auto_802349 ?auto_802352 ) ) ( not ( = ?auto_802349 ?auto_802353 ) ) ( not ( = ?auto_802349 ?auto_802354 ) ) ( not ( = ?auto_802349 ?auto_802355 ) ) ( not ( = ?auto_802350 ?auto_802351 ) ) ( not ( = ?auto_802350 ?auto_802352 ) ) ( not ( = ?auto_802350 ?auto_802353 ) ) ( not ( = ?auto_802350 ?auto_802354 ) ) ( not ( = ?auto_802350 ?auto_802355 ) ) ( not ( = ?auto_802351 ?auto_802352 ) ) ( not ( = ?auto_802351 ?auto_802353 ) ) ( not ( = ?auto_802351 ?auto_802354 ) ) ( not ( = ?auto_802351 ?auto_802355 ) ) ( not ( = ?auto_802352 ?auto_802353 ) ) ( not ( = ?auto_802352 ?auto_802354 ) ) ( not ( = ?auto_802352 ?auto_802355 ) ) ( not ( = ?auto_802353 ?auto_802354 ) ) ( not ( = ?auto_802353 ?auto_802355 ) ) ( not ( = ?auto_802354 ?auto_802355 ) ) ( ON ?auto_802353 ?auto_802354 ) ( ON ?auto_802352 ?auto_802353 ) ( ON ?auto_802351 ?auto_802352 ) ( ON ?auto_802350 ?auto_802351 ) ( CLEAR ?auto_802348 ) ( ON ?auto_802349 ?auto_802350 ) ( CLEAR ?auto_802349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_802346 ?auto_802347 ?auto_802348 ?auto_802349 )
      ( MAKE-9PILE ?auto_802346 ?auto_802347 ?auto_802348 ?auto_802349 ?auto_802350 ?auto_802351 ?auto_802352 ?auto_802353 ?auto_802354 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802384 - BLOCK
      ?auto_802385 - BLOCK
      ?auto_802386 - BLOCK
      ?auto_802387 - BLOCK
      ?auto_802388 - BLOCK
      ?auto_802389 - BLOCK
      ?auto_802390 - BLOCK
      ?auto_802391 - BLOCK
      ?auto_802392 - BLOCK
    )
    :vars
    (
      ?auto_802393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802392 ?auto_802393 ) ( ON-TABLE ?auto_802384 ) ( ON ?auto_802385 ?auto_802384 ) ( not ( = ?auto_802384 ?auto_802385 ) ) ( not ( = ?auto_802384 ?auto_802386 ) ) ( not ( = ?auto_802384 ?auto_802387 ) ) ( not ( = ?auto_802384 ?auto_802388 ) ) ( not ( = ?auto_802384 ?auto_802389 ) ) ( not ( = ?auto_802384 ?auto_802390 ) ) ( not ( = ?auto_802384 ?auto_802391 ) ) ( not ( = ?auto_802384 ?auto_802392 ) ) ( not ( = ?auto_802384 ?auto_802393 ) ) ( not ( = ?auto_802385 ?auto_802386 ) ) ( not ( = ?auto_802385 ?auto_802387 ) ) ( not ( = ?auto_802385 ?auto_802388 ) ) ( not ( = ?auto_802385 ?auto_802389 ) ) ( not ( = ?auto_802385 ?auto_802390 ) ) ( not ( = ?auto_802385 ?auto_802391 ) ) ( not ( = ?auto_802385 ?auto_802392 ) ) ( not ( = ?auto_802385 ?auto_802393 ) ) ( not ( = ?auto_802386 ?auto_802387 ) ) ( not ( = ?auto_802386 ?auto_802388 ) ) ( not ( = ?auto_802386 ?auto_802389 ) ) ( not ( = ?auto_802386 ?auto_802390 ) ) ( not ( = ?auto_802386 ?auto_802391 ) ) ( not ( = ?auto_802386 ?auto_802392 ) ) ( not ( = ?auto_802386 ?auto_802393 ) ) ( not ( = ?auto_802387 ?auto_802388 ) ) ( not ( = ?auto_802387 ?auto_802389 ) ) ( not ( = ?auto_802387 ?auto_802390 ) ) ( not ( = ?auto_802387 ?auto_802391 ) ) ( not ( = ?auto_802387 ?auto_802392 ) ) ( not ( = ?auto_802387 ?auto_802393 ) ) ( not ( = ?auto_802388 ?auto_802389 ) ) ( not ( = ?auto_802388 ?auto_802390 ) ) ( not ( = ?auto_802388 ?auto_802391 ) ) ( not ( = ?auto_802388 ?auto_802392 ) ) ( not ( = ?auto_802388 ?auto_802393 ) ) ( not ( = ?auto_802389 ?auto_802390 ) ) ( not ( = ?auto_802389 ?auto_802391 ) ) ( not ( = ?auto_802389 ?auto_802392 ) ) ( not ( = ?auto_802389 ?auto_802393 ) ) ( not ( = ?auto_802390 ?auto_802391 ) ) ( not ( = ?auto_802390 ?auto_802392 ) ) ( not ( = ?auto_802390 ?auto_802393 ) ) ( not ( = ?auto_802391 ?auto_802392 ) ) ( not ( = ?auto_802391 ?auto_802393 ) ) ( not ( = ?auto_802392 ?auto_802393 ) ) ( ON ?auto_802391 ?auto_802392 ) ( ON ?auto_802390 ?auto_802391 ) ( ON ?auto_802389 ?auto_802390 ) ( ON ?auto_802388 ?auto_802389 ) ( ON ?auto_802387 ?auto_802388 ) ( CLEAR ?auto_802385 ) ( ON ?auto_802386 ?auto_802387 ) ( CLEAR ?auto_802386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_802384 ?auto_802385 ?auto_802386 )
      ( MAKE-9PILE ?auto_802384 ?auto_802385 ?auto_802386 ?auto_802387 ?auto_802388 ?auto_802389 ?auto_802390 ?auto_802391 ?auto_802392 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802422 - BLOCK
      ?auto_802423 - BLOCK
      ?auto_802424 - BLOCK
      ?auto_802425 - BLOCK
      ?auto_802426 - BLOCK
      ?auto_802427 - BLOCK
      ?auto_802428 - BLOCK
      ?auto_802429 - BLOCK
      ?auto_802430 - BLOCK
    )
    :vars
    (
      ?auto_802431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802430 ?auto_802431 ) ( ON-TABLE ?auto_802422 ) ( not ( = ?auto_802422 ?auto_802423 ) ) ( not ( = ?auto_802422 ?auto_802424 ) ) ( not ( = ?auto_802422 ?auto_802425 ) ) ( not ( = ?auto_802422 ?auto_802426 ) ) ( not ( = ?auto_802422 ?auto_802427 ) ) ( not ( = ?auto_802422 ?auto_802428 ) ) ( not ( = ?auto_802422 ?auto_802429 ) ) ( not ( = ?auto_802422 ?auto_802430 ) ) ( not ( = ?auto_802422 ?auto_802431 ) ) ( not ( = ?auto_802423 ?auto_802424 ) ) ( not ( = ?auto_802423 ?auto_802425 ) ) ( not ( = ?auto_802423 ?auto_802426 ) ) ( not ( = ?auto_802423 ?auto_802427 ) ) ( not ( = ?auto_802423 ?auto_802428 ) ) ( not ( = ?auto_802423 ?auto_802429 ) ) ( not ( = ?auto_802423 ?auto_802430 ) ) ( not ( = ?auto_802423 ?auto_802431 ) ) ( not ( = ?auto_802424 ?auto_802425 ) ) ( not ( = ?auto_802424 ?auto_802426 ) ) ( not ( = ?auto_802424 ?auto_802427 ) ) ( not ( = ?auto_802424 ?auto_802428 ) ) ( not ( = ?auto_802424 ?auto_802429 ) ) ( not ( = ?auto_802424 ?auto_802430 ) ) ( not ( = ?auto_802424 ?auto_802431 ) ) ( not ( = ?auto_802425 ?auto_802426 ) ) ( not ( = ?auto_802425 ?auto_802427 ) ) ( not ( = ?auto_802425 ?auto_802428 ) ) ( not ( = ?auto_802425 ?auto_802429 ) ) ( not ( = ?auto_802425 ?auto_802430 ) ) ( not ( = ?auto_802425 ?auto_802431 ) ) ( not ( = ?auto_802426 ?auto_802427 ) ) ( not ( = ?auto_802426 ?auto_802428 ) ) ( not ( = ?auto_802426 ?auto_802429 ) ) ( not ( = ?auto_802426 ?auto_802430 ) ) ( not ( = ?auto_802426 ?auto_802431 ) ) ( not ( = ?auto_802427 ?auto_802428 ) ) ( not ( = ?auto_802427 ?auto_802429 ) ) ( not ( = ?auto_802427 ?auto_802430 ) ) ( not ( = ?auto_802427 ?auto_802431 ) ) ( not ( = ?auto_802428 ?auto_802429 ) ) ( not ( = ?auto_802428 ?auto_802430 ) ) ( not ( = ?auto_802428 ?auto_802431 ) ) ( not ( = ?auto_802429 ?auto_802430 ) ) ( not ( = ?auto_802429 ?auto_802431 ) ) ( not ( = ?auto_802430 ?auto_802431 ) ) ( ON ?auto_802429 ?auto_802430 ) ( ON ?auto_802428 ?auto_802429 ) ( ON ?auto_802427 ?auto_802428 ) ( ON ?auto_802426 ?auto_802427 ) ( ON ?auto_802425 ?auto_802426 ) ( ON ?auto_802424 ?auto_802425 ) ( CLEAR ?auto_802422 ) ( ON ?auto_802423 ?auto_802424 ) ( CLEAR ?auto_802423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_802422 ?auto_802423 )
      ( MAKE-9PILE ?auto_802422 ?auto_802423 ?auto_802424 ?auto_802425 ?auto_802426 ?auto_802427 ?auto_802428 ?auto_802429 ?auto_802430 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_802460 - BLOCK
      ?auto_802461 - BLOCK
      ?auto_802462 - BLOCK
      ?auto_802463 - BLOCK
      ?auto_802464 - BLOCK
      ?auto_802465 - BLOCK
      ?auto_802466 - BLOCK
      ?auto_802467 - BLOCK
      ?auto_802468 - BLOCK
    )
    :vars
    (
      ?auto_802469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802468 ?auto_802469 ) ( not ( = ?auto_802460 ?auto_802461 ) ) ( not ( = ?auto_802460 ?auto_802462 ) ) ( not ( = ?auto_802460 ?auto_802463 ) ) ( not ( = ?auto_802460 ?auto_802464 ) ) ( not ( = ?auto_802460 ?auto_802465 ) ) ( not ( = ?auto_802460 ?auto_802466 ) ) ( not ( = ?auto_802460 ?auto_802467 ) ) ( not ( = ?auto_802460 ?auto_802468 ) ) ( not ( = ?auto_802460 ?auto_802469 ) ) ( not ( = ?auto_802461 ?auto_802462 ) ) ( not ( = ?auto_802461 ?auto_802463 ) ) ( not ( = ?auto_802461 ?auto_802464 ) ) ( not ( = ?auto_802461 ?auto_802465 ) ) ( not ( = ?auto_802461 ?auto_802466 ) ) ( not ( = ?auto_802461 ?auto_802467 ) ) ( not ( = ?auto_802461 ?auto_802468 ) ) ( not ( = ?auto_802461 ?auto_802469 ) ) ( not ( = ?auto_802462 ?auto_802463 ) ) ( not ( = ?auto_802462 ?auto_802464 ) ) ( not ( = ?auto_802462 ?auto_802465 ) ) ( not ( = ?auto_802462 ?auto_802466 ) ) ( not ( = ?auto_802462 ?auto_802467 ) ) ( not ( = ?auto_802462 ?auto_802468 ) ) ( not ( = ?auto_802462 ?auto_802469 ) ) ( not ( = ?auto_802463 ?auto_802464 ) ) ( not ( = ?auto_802463 ?auto_802465 ) ) ( not ( = ?auto_802463 ?auto_802466 ) ) ( not ( = ?auto_802463 ?auto_802467 ) ) ( not ( = ?auto_802463 ?auto_802468 ) ) ( not ( = ?auto_802463 ?auto_802469 ) ) ( not ( = ?auto_802464 ?auto_802465 ) ) ( not ( = ?auto_802464 ?auto_802466 ) ) ( not ( = ?auto_802464 ?auto_802467 ) ) ( not ( = ?auto_802464 ?auto_802468 ) ) ( not ( = ?auto_802464 ?auto_802469 ) ) ( not ( = ?auto_802465 ?auto_802466 ) ) ( not ( = ?auto_802465 ?auto_802467 ) ) ( not ( = ?auto_802465 ?auto_802468 ) ) ( not ( = ?auto_802465 ?auto_802469 ) ) ( not ( = ?auto_802466 ?auto_802467 ) ) ( not ( = ?auto_802466 ?auto_802468 ) ) ( not ( = ?auto_802466 ?auto_802469 ) ) ( not ( = ?auto_802467 ?auto_802468 ) ) ( not ( = ?auto_802467 ?auto_802469 ) ) ( not ( = ?auto_802468 ?auto_802469 ) ) ( ON ?auto_802467 ?auto_802468 ) ( ON ?auto_802466 ?auto_802467 ) ( ON ?auto_802465 ?auto_802466 ) ( ON ?auto_802464 ?auto_802465 ) ( ON ?auto_802463 ?auto_802464 ) ( ON ?auto_802462 ?auto_802463 ) ( ON ?auto_802461 ?auto_802462 ) ( ON ?auto_802460 ?auto_802461 ) ( CLEAR ?auto_802460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_802460 )
      ( MAKE-9PILE ?auto_802460 ?auto_802461 ?auto_802462 ?auto_802463 ?auto_802464 ?auto_802465 ?auto_802466 ?auto_802467 ?auto_802468 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802499 - BLOCK
      ?auto_802500 - BLOCK
      ?auto_802501 - BLOCK
      ?auto_802502 - BLOCK
      ?auto_802503 - BLOCK
      ?auto_802504 - BLOCK
      ?auto_802505 - BLOCK
      ?auto_802506 - BLOCK
      ?auto_802507 - BLOCK
      ?auto_802508 - BLOCK
    )
    :vars
    (
      ?auto_802509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_802507 ) ( ON ?auto_802508 ?auto_802509 ) ( CLEAR ?auto_802508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_802499 ) ( ON ?auto_802500 ?auto_802499 ) ( ON ?auto_802501 ?auto_802500 ) ( ON ?auto_802502 ?auto_802501 ) ( ON ?auto_802503 ?auto_802502 ) ( ON ?auto_802504 ?auto_802503 ) ( ON ?auto_802505 ?auto_802504 ) ( ON ?auto_802506 ?auto_802505 ) ( ON ?auto_802507 ?auto_802506 ) ( not ( = ?auto_802499 ?auto_802500 ) ) ( not ( = ?auto_802499 ?auto_802501 ) ) ( not ( = ?auto_802499 ?auto_802502 ) ) ( not ( = ?auto_802499 ?auto_802503 ) ) ( not ( = ?auto_802499 ?auto_802504 ) ) ( not ( = ?auto_802499 ?auto_802505 ) ) ( not ( = ?auto_802499 ?auto_802506 ) ) ( not ( = ?auto_802499 ?auto_802507 ) ) ( not ( = ?auto_802499 ?auto_802508 ) ) ( not ( = ?auto_802499 ?auto_802509 ) ) ( not ( = ?auto_802500 ?auto_802501 ) ) ( not ( = ?auto_802500 ?auto_802502 ) ) ( not ( = ?auto_802500 ?auto_802503 ) ) ( not ( = ?auto_802500 ?auto_802504 ) ) ( not ( = ?auto_802500 ?auto_802505 ) ) ( not ( = ?auto_802500 ?auto_802506 ) ) ( not ( = ?auto_802500 ?auto_802507 ) ) ( not ( = ?auto_802500 ?auto_802508 ) ) ( not ( = ?auto_802500 ?auto_802509 ) ) ( not ( = ?auto_802501 ?auto_802502 ) ) ( not ( = ?auto_802501 ?auto_802503 ) ) ( not ( = ?auto_802501 ?auto_802504 ) ) ( not ( = ?auto_802501 ?auto_802505 ) ) ( not ( = ?auto_802501 ?auto_802506 ) ) ( not ( = ?auto_802501 ?auto_802507 ) ) ( not ( = ?auto_802501 ?auto_802508 ) ) ( not ( = ?auto_802501 ?auto_802509 ) ) ( not ( = ?auto_802502 ?auto_802503 ) ) ( not ( = ?auto_802502 ?auto_802504 ) ) ( not ( = ?auto_802502 ?auto_802505 ) ) ( not ( = ?auto_802502 ?auto_802506 ) ) ( not ( = ?auto_802502 ?auto_802507 ) ) ( not ( = ?auto_802502 ?auto_802508 ) ) ( not ( = ?auto_802502 ?auto_802509 ) ) ( not ( = ?auto_802503 ?auto_802504 ) ) ( not ( = ?auto_802503 ?auto_802505 ) ) ( not ( = ?auto_802503 ?auto_802506 ) ) ( not ( = ?auto_802503 ?auto_802507 ) ) ( not ( = ?auto_802503 ?auto_802508 ) ) ( not ( = ?auto_802503 ?auto_802509 ) ) ( not ( = ?auto_802504 ?auto_802505 ) ) ( not ( = ?auto_802504 ?auto_802506 ) ) ( not ( = ?auto_802504 ?auto_802507 ) ) ( not ( = ?auto_802504 ?auto_802508 ) ) ( not ( = ?auto_802504 ?auto_802509 ) ) ( not ( = ?auto_802505 ?auto_802506 ) ) ( not ( = ?auto_802505 ?auto_802507 ) ) ( not ( = ?auto_802505 ?auto_802508 ) ) ( not ( = ?auto_802505 ?auto_802509 ) ) ( not ( = ?auto_802506 ?auto_802507 ) ) ( not ( = ?auto_802506 ?auto_802508 ) ) ( not ( = ?auto_802506 ?auto_802509 ) ) ( not ( = ?auto_802507 ?auto_802508 ) ) ( not ( = ?auto_802507 ?auto_802509 ) ) ( not ( = ?auto_802508 ?auto_802509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_802508 ?auto_802509 )
      ( !STACK ?auto_802508 ?auto_802507 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802541 - BLOCK
      ?auto_802542 - BLOCK
      ?auto_802543 - BLOCK
      ?auto_802544 - BLOCK
      ?auto_802545 - BLOCK
      ?auto_802546 - BLOCK
      ?auto_802547 - BLOCK
      ?auto_802548 - BLOCK
      ?auto_802549 - BLOCK
      ?auto_802550 - BLOCK
    )
    :vars
    (
      ?auto_802551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802550 ?auto_802551 ) ( ON-TABLE ?auto_802541 ) ( ON ?auto_802542 ?auto_802541 ) ( ON ?auto_802543 ?auto_802542 ) ( ON ?auto_802544 ?auto_802543 ) ( ON ?auto_802545 ?auto_802544 ) ( ON ?auto_802546 ?auto_802545 ) ( ON ?auto_802547 ?auto_802546 ) ( ON ?auto_802548 ?auto_802547 ) ( not ( = ?auto_802541 ?auto_802542 ) ) ( not ( = ?auto_802541 ?auto_802543 ) ) ( not ( = ?auto_802541 ?auto_802544 ) ) ( not ( = ?auto_802541 ?auto_802545 ) ) ( not ( = ?auto_802541 ?auto_802546 ) ) ( not ( = ?auto_802541 ?auto_802547 ) ) ( not ( = ?auto_802541 ?auto_802548 ) ) ( not ( = ?auto_802541 ?auto_802549 ) ) ( not ( = ?auto_802541 ?auto_802550 ) ) ( not ( = ?auto_802541 ?auto_802551 ) ) ( not ( = ?auto_802542 ?auto_802543 ) ) ( not ( = ?auto_802542 ?auto_802544 ) ) ( not ( = ?auto_802542 ?auto_802545 ) ) ( not ( = ?auto_802542 ?auto_802546 ) ) ( not ( = ?auto_802542 ?auto_802547 ) ) ( not ( = ?auto_802542 ?auto_802548 ) ) ( not ( = ?auto_802542 ?auto_802549 ) ) ( not ( = ?auto_802542 ?auto_802550 ) ) ( not ( = ?auto_802542 ?auto_802551 ) ) ( not ( = ?auto_802543 ?auto_802544 ) ) ( not ( = ?auto_802543 ?auto_802545 ) ) ( not ( = ?auto_802543 ?auto_802546 ) ) ( not ( = ?auto_802543 ?auto_802547 ) ) ( not ( = ?auto_802543 ?auto_802548 ) ) ( not ( = ?auto_802543 ?auto_802549 ) ) ( not ( = ?auto_802543 ?auto_802550 ) ) ( not ( = ?auto_802543 ?auto_802551 ) ) ( not ( = ?auto_802544 ?auto_802545 ) ) ( not ( = ?auto_802544 ?auto_802546 ) ) ( not ( = ?auto_802544 ?auto_802547 ) ) ( not ( = ?auto_802544 ?auto_802548 ) ) ( not ( = ?auto_802544 ?auto_802549 ) ) ( not ( = ?auto_802544 ?auto_802550 ) ) ( not ( = ?auto_802544 ?auto_802551 ) ) ( not ( = ?auto_802545 ?auto_802546 ) ) ( not ( = ?auto_802545 ?auto_802547 ) ) ( not ( = ?auto_802545 ?auto_802548 ) ) ( not ( = ?auto_802545 ?auto_802549 ) ) ( not ( = ?auto_802545 ?auto_802550 ) ) ( not ( = ?auto_802545 ?auto_802551 ) ) ( not ( = ?auto_802546 ?auto_802547 ) ) ( not ( = ?auto_802546 ?auto_802548 ) ) ( not ( = ?auto_802546 ?auto_802549 ) ) ( not ( = ?auto_802546 ?auto_802550 ) ) ( not ( = ?auto_802546 ?auto_802551 ) ) ( not ( = ?auto_802547 ?auto_802548 ) ) ( not ( = ?auto_802547 ?auto_802549 ) ) ( not ( = ?auto_802547 ?auto_802550 ) ) ( not ( = ?auto_802547 ?auto_802551 ) ) ( not ( = ?auto_802548 ?auto_802549 ) ) ( not ( = ?auto_802548 ?auto_802550 ) ) ( not ( = ?auto_802548 ?auto_802551 ) ) ( not ( = ?auto_802549 ?auto_802550 ) ) ( not ( = ?auto_802549 ?auto_802551 ) ) ( not ( = ?auto_802550 ?auto_802551 ) ) ( CLEAR ?auto_802548 ) ( ON ?auto_802549 ?auto_802550 ) ( CLEAR ?auto_802549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_802541 ?auto_802542 ?auto_802543 ?auto_802544 ?auto_802545 ?auto_802546 ?auto_802547 ?auto_802548 ?auto_802549 )
      ( MAKE-10PILE ?auto_802541 ?auto_802542 ?auto_802543 ?auto_802544 ?auto_802545 ?auto_802546 ?auto_802547 ?auto_802548 ?auto_802549 ?auto_802550 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802583 - BLOCK
      ?auto_802584 - BLOCK
      ?auto_802585 - BLOCK
      ?auto_802586 - BLOCK
      ?auto_802587 - BLOCK
      ?auto_802588 - BLOCK
      ?auto_802589 - BLOCK
      ?auto_802590 - BLOCK
      ?auto_802591 - BLOCK
      ?auto_802592 - BLOCK
    )
    :vars
    (
      ?auto_802593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802592 ?auto_802593 ) ( ON-TABLE ?auto_802583 ) ( ON ?auto_802584 ?auto_802583 ) ( ON ?auto_802585 ?auto_802584 ) ( ON ?auto_802586 ?auto_802585 ) ( ON ?auto_802587 ?auto_802586 ) ( ON ?auto_802588 ?auto_802587 ) ( ON ?auto_802589 ?auto_802588 ) ( not ( = ?auto_802583 ?auto_802584 ) ) ( not ( = ?auto_802583 ?auto_802585 ) ) ( not ( = ?auto_802583 ?auto_802586 ) ) ( not ( = ?auto_802583 ?auto_802587 ) ) ( not ( = ?auto_802583 ?auto_802588 ) ) ( not ( = ?auto_802583 ?auto_802589 ) ) ( not ( = ?auto_802583 ?auto_802590 ) ) ( not ( = ?auto_802583 ?auto_802591 ) ) ( not ( = ?auto_802583 ?auto_802592 ) ) ( not ( = ?auto_802583 ?auto_802593 ) ) ( not ( = ?auto_802584 ?auto_802585 ) ) ( not ( = ?auto_802584 ?auto_802586 ) ) ( not ( = ?auto_802584 ?auto_802587 ) ) ( not ( = ?auto_802584 ?auto_802588 ) ) ( not ( = ?auto_802584 ?auto_802589 ) ) ( not ( = ?auto_802584 ?auto_802590 ) ) ( not ( = ?auto_802584 ?auto_802591 ) ) ( not ( = ?auto_802584 ?auto_802592 ) ) ( not ( = ?auto_802584 ?auto_802593 ) ) ( not ( = ?auto_802585 ?auto_802586 ) ) ( not ( = ?auto_802585 ?auto_802587 ) ) ( not ( = ?auto_802585 ?auto_802588 ) ) ( not ( = ?auto_802585 ?auto_802589 ) ) ( not ( = ?auto_802585 ?auto_802590 ) ) ( not ( = ?auto_802585 ?auto_802591 ) ) ( not ( = ?auto_802585 ?auto_802592 ) ) ( not ( = ?auto_802585 ?auto_802593 ) ) ( not ( = ?auto_802586 ?auto_802587 ) ) ( not ( = ?auto_802586 ?auto_802588 ) ) ( not ( = ?auto_802586 ?auto_802589 ) ) ( not ( = ?auto_802586 ?auto_802590 ) ) ( not ( = ?auto_802586 ?auto_802591 ) ) ( not ( = ?auto_802586 ?auto_802592 ) ) ( not ( = ?auto_802586 ?auto_802593 ) ) ( not ( = ?auto_802587 ?auto_802588 ) ) ( not ( = ?auto_802587 ?auto_802589 ) ) ( not ( = ?auto_802587 ?auto_802590 ) ) ( not ( = ?auto_802587 ?auto_802591 ) ) ( not ( = ?auto_802587 ?auto_802592 ) ) ( not ( = ?auto_802587 ?auto_802593 ) ) ( not ( = ?auto_802588 ?auto_802589 ) ) ( not ( = ?auto_802588 ?auto_802590 ) ) ( not ( = ?auto_802588 ?auto_802591 ) ) ( not ( = ?auto_802588 ?auto_802592 ) ) ( not ( = ?auto_802588 ?auto_802593 ) ) ( not ( = ?auto_802589 ?auto_802590 ) ) ( not ( = ?auto_802589 ?auto_802591 ) ) ( not ( = ?auto_802589 ?auto_802592 ) ) ( not ( = ?auto_802589 ?auto_802593 ) ) ( not ( = ?auto_802590 ?auto_802591 ) ) ( not ( = ?auto_802590 ?auto_802592 ) ) ( not ( = ?auto_802590 ?auto_802593 ) ) ( not ( = ?auto_802591 ?auto_802592 ) ) ( not ( = ?auto_802591 ?auto_802593 ) ) ( not ( = ?auto_802592 ?auto_802593 ) ) ( ON ?auto_802591 ?auto_802592 ) ( CLEAR ?auto_802589 ) ( ON ?auto_802590 ?auto_802591 ) ( CLEAR ?auto_802590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_802583 ?auto_802584 ?auto_802585 ?auto_802586 ?auto_802587 ?auto_802588 ?auto_802589 ?auto_802590 )
      ( MAKE-10PILE ?auto_802583 ?auto_802584 ?auto_802585 ?auto_802586 ?auto_802587 ?auto_802588 ?auto_802589 ?auto_802590 ?auto_802591 ?auto_802592 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802625 - BLOCK
      ?auto_802626 - BLOCK
      ?auto_802627 - BLOCK
      ?auto_802628 - BLOCK
      ?auto_802629 - BLOCK
      ?auto_802630 - BLOCK
      ?auto_802631 - BLOCK
      ?auto_802632 - BLOCK
      ?auto_802633 - BLOCK
      ?auto_802634 - BLOCK
    )
    :vars
    (
      ?auto_802635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802634 ?auto_802635 ) ( ON-TABLE ?auto_802625 ) ( ON ?auto_802626 ?auto_802625 ) ( ON ?auto_802627 ?auto_802626 ) ( ON ?auto_802628 ?auto_802627 ) ( ON ?auto_802629 ?auto_802628 ) ( ON ?auto_802630 ?auto_802629 ) ( not ( = ?auto_802625 ?auto_802626 ) ) ( not ( = ?auto_802625 ?auto_802627 ) ) ( not ( = ?auto_802625 ?auto_802628 ) ) ( not ( = ?auto_802625 ?auto_802629 ) ) ( not ( = ?auto_802625 ?auto_802630 ) ) ( not ( = ?auto_802625 ?auto_802631 ) ) ( not ( = ?auto_802625 ?auto_802632 ) ) ( not ( = ?auto_802625 ?auto_802633 ) ) ( not ( = ?auto_802625 ?auto_802634 ) ) ( not ( = ?auto_802625 ?auto_802635 ) ) ( not ( = ?auto_802626 ?auto_802627 ) ) ( not ( = ?auto_802626 ?auto_802628 ) ) ( not ( = ?auto_802626 ?auto_802629 ) ) ( not ( = ?auto_802626 ?auto_802630 ) ) ( not ( = ?auto_802626 ?auto_802631 ) ) ( not ( = ?auto_802626 ?auto_802632 ) ) ( not ( = ?auto_802626 ?auto_802633 ) ) ( not ( = ?auto_802626 ?auto_802634 ) ) ( not ( = ?auto_802626 ?auto_802635 ) ) ( not ( = ?auto_802627 ?auto_802628 ) ) ( not ( = ?auto_802627 ?auto_802629 ) ) ( not ( = ?auto_802627 ?auto_802630 ) ) ( not ( = ?auto_802627 ?auto_802631 ) ) ( not ( = ?auto_802627 ?auto_802632 ) ) ( not ( = ?auto_802627 ?auto_802633 ) ) ( not ( = ?auto_802627 ?auto_802634 ) ) ( not ( = ?auto_802627 ?auto_802635 ) ) ( not ( = ?auto_802628 ?auto_802629 ) ) ( not ( = ?auto_802628 ?auto_802630 ) ) ( not ( = ?auto_802628 ?auto_802631 ) ) ( not ( = ?auto_802628 ?auto_802632 ) ) ( not ( = ?auto_802628 ?auto_802633 ) ) ( not ( = ?auto_802628 ?auto_802634 ) ) ( not ( = ?auto_802628 ?auto_802635 ) ) ( not ( = ?auto_802629 ?auto_802630 ) ) ( not ( = ?auto_802629 ?auto_802631 ) ) ( not ( = ?auto_802629 ?auto_802632 ) ) ( not ( = ?auto_802629 ?auto_802633 ) ) ( not ( = ?auto_802629 ?auto_802634 ) ) ( not ( = ?auto_802629 ?auto_802635 ) ) ( not ( = ?auto_802630 ?auto_802631 ) ) ( not ( = ?auto_802630 ?auto_802632 ) ) ( not ( = ?auto_802630 ?auto_802633 ) ) ( not ( = ?auto_802630 ?auto_802634 ) ) ( not ( = ?auto_802630 ?auto_802635 ) ) ( not ( = ?auto_802631 ?auto_802632 ) ) ( not ( = ?auto_802631 ?auto_802633 ) ) ( not ( = ?auto_802631 ?auto_802634 ) ) ( not ( = ?auto_802631 ?auto_802635 ) ) ( not ( = ?auto_802632 ?auto_802633 ) ) ( not ( = ?auto_802632 ?auto_802634 ) ) ( not ( = ?auto_802632 ?auto_802635 ) ) ( not ( = ?auto_802633 ?auto_802634 ) ) ( not ( = ?auto_802633 ?auto_802635 ) ) ( not ( = ?auto_802634 ?auto_802635 ) ) ( ON ?auto_802633 ?auto_802634 ) ( ON ?auto_802632 ?auto_802633 ) ( CLEAR ?auto_802630 ) ( ON ?auto_802631 ?auto_802632 ) ( CLEAR ?auto_802631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_802625 ?auto_802626 ?auto_802627 ?auto_802628 ?auto_802629 ?auto_802630 ?auto_802631 )
      ( MAKE-10PILE ?auto_802625 ?auto_802626 ?auto_802627 ?auto_802628 ?auto_802629 ?auto_802630 ?auto_802631 ?auto_802632 ?auto_802633 ?auto_802634 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802667 - BLOCK
      ?auto_802668 - BLOCK
      ?auto_802669 - BLOCK
      ?auto_802670 - BLOCK
      ?auto_802671 - BLOCK
      ?auto_802672 - BLOCK
      ?auto_802673 - BLOCK
      ?auto_802674 - BLOCK
      ?auto_802675 - BLOCK
      ?auto_802676 - BLOCK
    )
    :vars
    (
      ?auto_802677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802676 ?auto_802677 ) ( ON-TABLE ?auto_802667 ) ( ON ?auto_802668 ?auto_802667 ) ( ON ?auto_802669 ?auto_802668 ) ( ON ?auto_802670 ?auto_802669 ) ( ON ?auto_802671 ?auto_802670 ) ( not ( = ?auto_802667 ?auto_802668 ) ) ( not ( = ?auto_802667 ?auto_802669 ) ) ( not ( = ?auto_802667 ?auto_802670 ) ) ( not ( = ?auto_802667 ?auto_802671 ) ) ( not ( = ?auto_802667 ?auto_802672 ) ) ( not ( = ?auto_802667 ?auto_802673 ) ) ( not ( = ?auto_802667 ?auto_802674 ) ) ( not ( = ?auto_802667 ?auto_802675 ) ) ( not ( = ?auto_802667 ?auto_802676 ) ) ( not ( = ?auto_802667 ?auto_802677 ) ) ( not ( = ?auto_802668 ?auto_802669 ) ) ( not ( = ?auto_802668 ?auto_802670 ) ) ( not ( = ?auto_802668 ?auto_802671 ) ) ( not ( = ?auto_802668 ?auto_802672 ) ) ( not ( = ?auto_802668 ?auto_802673 ) ) ( not ( = ?auto_802668 ?auto_802674 ) ) ( not ( = ?auto_802668 ?auto_802675 ) ) ( not ( = ?auto_802668 ?auto_802676 ) ) ( not ( = ?auto_802668 ?auto_802677 ) ) ( not ( = ?auto_802669 ?auto_802670 ) ) ( not ( = ?auto_802669 ?auto_802671 ) ) ( not ( = ?auto_802669 ?auto_802672 ) ) ( not ( = ?auto_802669 ?auto_802673 ) ) ( not ( = ?auto_802669 ?auto_802674 ) ) ( not ( = ?auto_802669 ?auto_802675 ) ) ( not ( = ?auto_802669 ?auto_802676 ) ) ( not ( = ?auto_802669 ?auto_802677 ) ) ( not ( = ?auto_802670 ?auto_802671 ) ) ( not ( = ?auto_802670 ?auto_802672 ) ) ( not ( = ?auto_802670 ?auto_802673 ) ) ( not ( = ?auto_802670 ?auto_802674 ) ) ( not ( = ?auto_802670 ?auto_802675 ) ) ( not ( = ?auto_802670 ?auto_802676 ) ) ( not ( = ?auto_802670 ?auto_802677 ) ) ( not ( = ?auto_802671 ?auto_802672 ) ) ( not ( = ?auto_802671 ?auto_802673 ) ) ( not ( = ?auto_802671 ?auto_802674 ) ) ( not ( = ?auto_802671 ?auto_802675 ) ) ( not ( = ?auto_802671 ?auto_802676 ) ) ( not ( = ?auto_802671 ?auto_802677 ) ) ( not ( = ?auto_802672 ?auto_802673 ) ) ( not ( = ?auto_802672 ?auto_802674 ) ) ( not ( = ?auto_802672 ?auto_802675 ) ) ( not ( = ?auto_802672 ?auto_802676 ) ) ( not ( = ?auto_802672 ?auto_802677 ) ) ( not ( = ?auto_802673 ?auto_802674 ) ) ( not ( = ?auto_802673 ?auto_802675 ) ) ( not ( = ?auto_802673 ?auto_802676 ) ) ( not ( = ?auto_802673 ?auto_802677 ) ) ( not ( = ?auto_802674 ?auto_802675 ) ) ( not ( = ?auto_802674 ?auto_802676 ) ) ( not ( = ?auto_802674 ?auto_802677 ) ) ( not ( = ?auto_802675 ?auto_802676 ) ) ( not ( = ?auto_802675 ?auto_802677 ) ) ( not ( = ?auto_802676 ?auto_802677 ) ) ( ON ?auto_802675 ?auto_802676 ) ( ON ?auto_802674 ?auto_802675 ) ( ON ?auto_802673 ?auto_802674 ) ( CLEAR ?auto_802671 ) ( ON ?auto_802672 ?auto_802673 ) ( CLEAR ?auto_802672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_802667 ?auto_802668 ?auto_802669 ?auto_802670 ?auto_802671 ?auto_802672 )
      ( MAKE-10PILE ?auto_802667 ?auto_802668 ?auto_802669 ?auto_802670 ?auto_802671 ?auto_802672 ?auto_802673 ?auto_802674 ?auto_802675 ?auto_802676 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802709 - BLOCK
      ?auto_802710 - BLOCK
      ?auto_802711 - BLOCK
      ?auto_802712 - BLOCK
      ?auto_802713 - BLOCK
      ?auto_802714 - BLOCK
      ?auto_802715 - BLOCK
      ?auto_802716 - BLOCK
      ?auto_802717 - BLOCK
      ?auto_802718 - BLOCK
    )
    :vars
    (
      ?auto_802719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802718 ?auto_802719 ) ( ON-TABLE ?auto_802709 ) ( ON ?auto_802710 ?auto_802709 ) ( ON ?auto_802711 ?auto_802710 ) ( ON ?auto_802712 ?auto_802711 ) ( not ( = ?auto_802709 ?auto_802710 ) ) ( not ( = ?auto_802709 ?auto_802711 ) ) ( not ( = ?auto_802709 ?auto_802712 ) ) ( not ( = ?auto_802709 ?auto_802713 ) ) ( not ( = ?auto_802709 ?auto_802714 ) ) ( not ( = ?auto_802709 ?auto_802715 ) ) ( not ( = ?auto_802709 ?auto_802716 ) ) ( not ( = ?auto_802709 ?auto_802717 ) ) ( not ( = ?auto_802709 ?auto_802718 ) ) ( not ( = ?auto_802709 ?auto_802719 ) ) ( not ( = ?auto_802710 ?auto_802711 ) ) ( not ( = ?auto_802710 ?auto_802712 ) ) ( not ( = ?auto_802710 ?auto_802713 ) ) ( not ( = ?auto_802710 ?auto_802714 ) ) ( not ( = ?auto_802710 ?auto_802715 ) ) ( not ( = ?auto_802710 ?auto_802716 ) ) ( not ( = ?auto_802710 ?auto_802717 ) ) ( not ( = ?auto_802710 ?auto_802718 ) ) ( not ( = ?auto_802710 ?auto_802719 ) ) ( not ( = ?auto_802711 ?auto_802712 ) ) ( not ( = ?auto_802711 ?auto_802713 ) ) ( not ( = ?auto_802711 ?auto_802714 ) ) ( not ( = ?auto_802711 ?auto_802715 ) ) ( not ( = ?auto_802711 ?auto_802716 ) ) ( not ( = ?auto_802711 ?auto_802717 ) ) ( not ( = ?auto_802711 ?auto_802718 ) ) ( not ( = ?auto_802711 ?auto_802719 ) ) ( not ( = ?auto_802712 ?auto_802713 ) ) ( not ( = ?auto_802712 ?auto_802714 ) ) ( not ( = ?auto_802712 ?auto_802715 ) ) ( not ( = ?auto_802712 ?auto_802716 ) ) ( not ( = ?auto_802712 ?auto_802717 ) ) ( not ( = ?auto_802712 ?auto_802718 ) ) ( not ( = ?auto_802712 ?auto_802719 ) ) ( not ( = ?auto_802713 ?auto_802714 ) ) ( not ( = ?auto_802713 ?auto_802715 ) ) ( not ( = ?auto_802713 ?auto_802716 ) ) ( not ( = ?auto_802713 ?auto_802717 ) ) ( not ( = ?auto_802713 ?auto_802718 ) ) ( not ( = ?auto_802713 ?auto_802719 ) ) ( not ( = ?auto_802714 ?auto_802715 ) ) ( not ( = ?auto_802714 ?auto_802716 ) ) ( not ( = ?auto_802714 ?auto_802717 ) ) ( not ( = ?auto_802714 ?auto_802718 ) ) ( not ( = ?auto_802714 ?auto_802719 ) ) ( not ( = ?auto_802715 ?auto_802716 ) ) ( not ( = ?auto_802715 ?auto_802717 ) ) ( not ( = ?auto_802715 ?auto_802718 ) ) ( not ( = ?auto_802715 ?auto_802719 ) ) ( not ( = ?auto_802716 ?auto_802717 ) ) ( not ( = ?auto_802716 ?auto_802718 ) ) ( not ( = ?auto_802716 ?auto_802719 ) ) ( not ( = ?auto_802717 ?auto_802718 ) ) ( not ( = ?auto_802717 ?auto_802719 ) ) ( not ( = ?auto_802718 ?auto_802719 ) ) ( ON ?auto_802717 ?auto_802718 ) ( ON ?auto_802716 ?auto_802717 ) ( ON ?auto_802715 ?auto_802716 ) ( ON ?auto_802714 ?auto_802715 ) ( CLEAR ?auto_802712 ) ( ON ?auto_802713 ?auto_802714 ) ( CLEAR ?auto_802713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_802709 ?auto_802710 ?auto_802711 ?auto_802712 ?auto_802713 )
      ( MAKE-10PILE ?auto_802709 ?auto_802710 ?auto_802711 ?auto_802712 ?auto_802713 ?auto_802714 ?auto_802715 ?auto_802716 ?auto_802717 ?auto_802718 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802751 - BLOCK
      ?auto_802752 - BLOCK
      ?auto_802753 - BLOCK
      ?auto_802754 - BLOCK
      ?auto_802755 - BLOCK
      ?auto_802756 - BLOCK
      ?auto_802757 - BLOCK
      ?auto_802758 - BLOCK
      ?auto_802759 - BLOCK
      ?auto_802760 - BLOCK
    )
    :vars
    (
      ?auto_802761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802760 ?auto_802761 ) ( ON-TABLE ?auto_802751 ) ( ON ?auto_802752 ?auto_802751 ) ( ON ?auto_802753 ?auto_802752 ) ( not ( = ?auto_802751 ?auto_802752 ) ) ( not ( = ?auto_802751 ?auto_802753 ) ) ( not ( = ?auto_802751 ?auto_802754 ) ) ( not ( = ?auto_802751 ?auto_802755 ) ) ( not ( = ?auto_802751 ?auto_802756 ) ) ( not ( = ?auto_802751 ?auto_802757 ) ) ( not ( = ?auto_802751 ?auto_802758 ) ) ( not ( = ?auto_802751 ?auto_802759 ) ) ( not ( = ?auto_802751 ?auto_802760 ) ) ( not ( = ?auto_802751 ?auto_802761 ) ) ( not ( = ?auto_802752 ?auto_802753 ) ) ( not ( = ?auto_802752 ?auto_802754 ) ) ( not ( = ?auto_802752 ?auto_802755 ) ) ( not ( = ?auto_802752 ?auto_802756 ) ) ( not ( = ?auto_802752 ?auto_802757 ) ) ( not ( = ?auto_802752 ?auto_802758 ) ) ( not ( = ?auto_802752 ?auto_802759 ) ) ( not ( = ?auto_802752 ?auto_802760 ) ) ( not ( = ?auto_802752 ?auto_802761 ) ) ( not ( = ?auto_802753 ?auto_802754 ) ) ( not ( = ?auto_802753 ?auto_802755 ) ) ( not ( = ?auto_802753 ?auto_802756 ) ) ( not ( = ?auto_802753 ?auto_802757 ) ) ( not ( = ?auto_802753 ?auto_802758 ) ) ( not ( = ?auto_802753 ?auto_802759 ) ) ( not ( = ?auto_802753 ?auto_802760 ) ) ( not ( = ?auto_802753 ?auto_802761 ) ) ( not ( = ?auto_802754 ?auto_802755 ) ) ( not ( = ?auto_802754 ?auto_802756 ) ) ( not ( = ?auto_802754 ?auto_802757 ) ) ( not ( = ?auto_802754 ?auto_802758 ) ) ( not ( = ?auto_802754 ?auto_802759 ) ) ( not ( = ?auto_802754 ?auto_802760 ) ) ( not ( = ?auto_802754 ?auto_802761 ) ) ( not ( = ?auto_802755 ?auto_802756 ) ) ( not ( = ?auto_802755 ?auto_802757 ) ) ( not ( = ?auto_802755 ?auto_802758 ) ) ( not ( = ?auto_802755 ?auto_802759 ) ) ( not ( = ?auto_802755 ?auto_802760 ) ) ( not ( = ?auto_802755 ?auto_802761 ) ) ( not ( = ?auto_802756 ?auto_802757 ) ) ( not ( = ?auto_802756 ?auto_802758 ) ) ( not ( = ?auto_802756 ?auto_802759 ) ) ( not ( = ?auto_802756 ?auto_802760 ) ) ( not ( = ?auto_802756 ?auto_802761 ) ) ( not ( = ?auto_802757 ?auto_802758 ) ) ( not ( = ?auto_802757 ?auto_802759 ) ) ( not ( = ?auto_802757 ?auto_802760 ) ) ( not ( = ?auto_802757 ?auto_802761 ) ) ( not ( = ?auto_802758 ?auto_802759 ) ) ( not ( = ?auto_802758 ?auto_802760 ) ) ( not ( = ?auto_802758 ?auto_802761 ) ) ( not ( = ?auto_802759 ?auto_802760 ) ) ( not ( = ?auto_802759 ?auto_802761 ) ) ( not ( = ?auto_802760 ?auto_802761 ) ) ( ON ?auto_802759 ?auto_802760 ) ( ON ?auto_802758 ?auto_802759 ) ( ON ?auto_802757 ?auto_802758 ) ( ON ?auto_802756 ?auto_802757 ) ( ON ?auto_802755 ?auto_802756 ) ( CLEAR ?auto_802753 ) ( ON ?auto_802754 ?auto_802755 ) ( CLEAR ?auto_802754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_802751 ?auto_802752 ?auto_802753 ?auto_802754 )
      ( MAKE-10PILE ?auto_802751 ?auto_802752 ?auto_802753 ?auto_802754 ?auto_802755 ?auto_802756 ?auto_802757 ?auto_802758 ?auto_802759 ?auto_802760 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802793 - BLOCK
      ?auto_802794 - BLOCK
      ?auto_802795 - BLOCK
      ?auto_802796 - BLOCK
      ?auto_802797 - BLOCK
      ?auto_802798 - BLOCK
      ?auto_802799 - BLOCK
      ?auto_802800 - BLOCK
      ?auto_802801 - BLOCK
      ?auto_802802 - BLOCK
    )
    :vars
    (
      ?auto_802803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802802 ?auto_802803 ) ( ON-TABLE ?auto_802793 ) ( ON ?auto_802794 ?auto_802793 ) ( not ( = ?auto_802793 ?auto_802794 ) ) ( not ( = ?auto_802793 ?auto_802795 ) ) ( not ( = ?auto_802793 ?auto_802796 ) ) ( not ( = ?auto_802793 ?auto_802797 ) ) ( not ( = ?auto_802793 ?auto_802798 ) ) ( not ( = ?auto_802793 ?auto_802799 ) ) ( not ( = ?auto_802793 ?auto_802800 ) ) ( not ( = ?auto_802793 ?auto_802801 ) ) ( not ( = ?auto_802793 ?auto_802802 ) ) ( not ( = ?auto_802793 ?auto_802803 ) ) ( not ( = ?auto_802794 ?auto_802795 ) ) ( not ( = ?auto_802794 ?auto_802796 ) ) ( not ( = ?auto_802794 ?auto_802797 ) ) ( not ( = ?auto_802794 ?auto_802798 ) ) ( not ( = ?auto_802794 ?auto_802799 ) ) ( not ( = ?auto_802794 ?auto_802800 ) ) ( not ( = ?auto_802794 ?auto_802801 ) ) ( not ( = ?auto_802794 ?auto_802802 ) ) ( not ( = ?auto_802794 ?auto_802803 ) ) ( not ( = ?auto_802795 ?auto_802796 ) ) ( not ( = ?auto_802795 ?auto_802797 ) ) ( not ( = ?auto_802795 ?auto_802798 ) ) ( not ( = ?auto_802795 ?auto_802799 ) ) ( not ( = ?auto_802795 ?auto_802800 ) ) ( not ( = ?auto_802795 ?auto_802801 ) ) ( not ( = ?auto_802795 ?auto_802802 ) ) ( not ( = ?auto_802795 ?auto_802803 ) ) ( not ( = ?auto_802796 ?auto_802797 ) ) ( not ( = ?auto_802796 ?auto_802798 ) ) ( not ( = ?auto_802796 ?auto_802799 ) ) ( not ( = ?auto_802796 ?auto_802800 ) ) ( not ( = ?auto_802796 ?auto_802801 ) ) ( not ( = ?auto_802796 ?auto_802802 ) ) ( not ( = ?auto_802796 ?auto_802803 ) ) ( not ( = ?auto_802797 ?auto_802798 ) ) ( not ( = ?auto_802797 ?auto_802799 ) ) ( not ( = ?auto_802797 ?auto_802800 ) ) ( not ( = ?auto_802797 ?auto_802801 ) ) ( not ( = ?auto_802797 ?auto_802802 ) ) ( not ( = ?auto_802797 ?auto_802803 ) ) ( not ( = ?auto_802798 ?auto_802799 ) ) ( not ( = ?auto_802798 ?auto_802800 ) ) ( not ( = ?auto_802798 ?auto_802801 ) ) ( not ( = ?auto_802798 ?auto_802802 ) ) ( not ( = ?auto_802798 ?auto_802803 ) ) ( not ( = ?auto_802799 ?auto_802800 ) ) ( not ( = ?auto_802799 ?auto_802801 ) ) ( not ( = ?auto_802799 ?auto_802802 ) ) ( not ( = ?auto_802799 ?auto_802803 ) ) ( not ( = ?auto_802800 ?auto_802801 ) ) ( not ( = ?auto_802800 ?auto_802802 ) ) ( not ( = ?auto_802800 ?auto_802803 ) ) ( not ( = ?auto_802801 ?auto_802802 ) ) ( not ( = ?auto_802801 ?auto_802803 ) ) ( not ( = ?auto_802802 ?auto_802803 ) ) ( ON ?auto_802801 ?auto_802802 ) ( ON ?auto_802800 ?auto_802801 ) ( ON ?auto_802799 ?auto_802800 ) ( ON ?auto_802798 ?auto_802799 ) ( ON ?auto_802797 ?auto_802798 ) ( ON ?auto_802796 ?auto_802797 ) ( CLEAR ?auto_802794 ) ( ON ?auto_802795 ?auto_802796 ) ( CLEAR ?auto_802795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_802793 ?auto_802794 ?auto_802795 )
      ( MAKE-10PILE ?auto_802793 ?auto_802794 ?auto_802795 ?auto_802796 ?auto_802797 ?auto_802798 ?auto_802799 ?auto_802800 ?auto_802801 ?auto_802802 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802835 - BLOCK
      ?auto_802836 - BLOCK
      ?auto_802837 - BLOCK
      ?auto_802838 - BLOCK
      ?auto_802839 - BLOCK
      ?auto_802840 - BLOCK
      ?auto_802841 - BLOCK
      ?auto_802842 - BLOCK
      ?auto_802843 - BLOCK
      ?auto_802844 - BLOCK
    )
    :vars
    (
      ?auto_802845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802844 ?auto_802845 ) ( ON-TABLE ?auto_802835 ) ( not ( = ?auto_802835 ?auto_802836 ) ) ( not ( = ?auto_802835 ?auto_802837 ) ) ( not ( = ?auto_802835 ?auto_802838 ) ) ( not ( = ?auto_802835 ?auto_802839 ) ) ( not ( = ?auto_802835 ?auto_802840 ) ) ( not ( = ?auto_802835 ?auto_802841 ) ) ( not ( = ?auto_802835 ?auto_802842 ) ) ( not ( = ?auto_802835 ?auto_802843 ) ) ( not ( = ?auto_802835 ?auto_802844 ) ) ( not ( = ?auto_802835 ?auto_802845 ) ) ( not ( = ?auto_802836 ?auto_802837 ) ) ( not ( = ?auto_802836 ?auto_802838 ) ) ( not ( = ?auto_802836 ?auto_802839 ) ) ( not ( = ?auto_802836 ?auto_802840 ) ) ( not ( = ?auto_802836 ?auto_802841 ) ) ( not ( = ?auto_802836 ?auto_802842 ) ) ( not ( = ?auto_802836 ?auto_802843 ) ) ( not ( = ?auto_802836 ?auto_802844 ) ) ( not ( = ?auto_802836 ?auto_802845 ) ) ( not ( = ?auto_802837 ?auto_802838 ) ) ( not ( = ?auto_802837 ?auto_802839 ) ) ( not ( = ?auto_802837 ?auto_802840 ) ) ( not ( = ?auto_802837 ?auto_802841 ) ) ( not ( = ?auto_802837 ?auto_802842 ) ) ( not ( = ?auto_802837 ?auto_802843 ) ) ( not ( = ?auto_802837 ?auto_802844 ) ) ( not ( = ?auto_802837 ?auto_802845 ) ) ( not ( = ?auto_802838 ?auto_802839 ) ) ( not ( = ?auto_802838 ?auto_802840 ) ) ( not ( = ?auto_802838 ?auto_802841 ) ) ( not ( = ?auto_802838 ?auto_802842 ) ) ( not ( = ?auto_802838 ?auto_802843 ) ) ( not ( = ?auto_802838 ?auto_802844 ) ) ( not ( = ?auto_802838 ?auto_802845 ) ) ( not ( = ?auto_802839 ?auto_802840 ) ) ( not ( = ?auto_802839 ?auto_802841 ) ) ( not ( = ?auto_802839 ?auto_802842 ) ) ( not ( = ?auto_802839 ?auto_802843 ) ) ( not ( = ?auto_802839 ?auto_802844 ) ) ( not ( = ?auto_802839 ?auto_802845 ) ) ( not ( = ?auto_802840 ?auto_802841 ) ) ( not ( = ?auto_802840 ?auto_802842 ) ) ( not ( = ?auto_802840 ?auto_802843 ) ) ( not ( = ?auto_802840 ?auto_802844 ) ) ( not ( = ?auto_802840 ?auto_802845 ) ) ( not ( = ?auto_802841 ?auto_802842 ) ) ( not ( = ?auto_802841 ?auto_802843 ) ) ( not ( = ?auto_802841 ?auto_802844 ) ) ( not ( = ?auto_802841 ?auto_802845 ) ) ( not ( = ?auto_802842 ?auto_802843 ) ) ( not ( = ?auto_802842 ?auto_802844 ) ) ( not ( = ?auto_802842 ?auto_802845 ) ) ( not ( = ?auto_802843 ?auto_802844 ) ) ( not ( = ?auto_802843 ?auto_802845 ) ) ( not ( = ?auto_802844 ?auto_802845 ) ) ( ON ?auto_802843 ?auto_802844 ) ( ON ?auto_802842 ?auto_802843 ) ( ON ?auto_802841 ?auto_802842 ) ( ON ?auto_802840 ?auto_802841 ) ( ON ?auto_802839 ?auto_802840 ) ( ON ?auto_802838 ?auto_802839 ) ( ON ?auto_802837 ?auto_802838 ) ( CLEAR ?auto_802835 ) ( ON ?auto_802836 ?auto_802837 ) ( CLEAR ?auto_802836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_802835 ?auto_802836 )
      ( MAKE-10PILE ?auto_802835 ?auto_802836 ?auto_802837 ?auto_802838 ?auto_802839 ?auto_802840 ?auto_802841 ?auto_802842 ?auto_802843 ?auto_802844 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_802877 - BLOCK
      ?auto_802878 - BLOCK
      ?auto_802879 - BLOCK
      ?auto_802880 - BLOCK
      ?auto_802881 - BLOCK
      ?auto_802882 - BLOCK
      ?auto_802883 - BLOCK
      ?auto_802884 - BLOCK
      ?auto_802885 - BLOCK
      ?auto_802886 - BLOCK
    )
    :vars
    (
      ?auto_802887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802886 ?auto_802887 ) ( not ( = ?auto_802877 ?auto_802878 ) ) ( not ( = ?auto_802877 ?auto_802879 ) ) ( not ( = ?auto_802877 ?auto_802880 ) ) ( not ( = ?auto_802877 ?auto_802881 ) ) ( not ( = ?auto_802877 ?auto_802882 ) ) ( not ( = ?auto_802877 ?auto_802883 ) ) ( not ( = ?auto_802877 ?auto_802884 ) ) ( not ( = ?auto_802877 ?auto_802885 ) ) ( not ( = ?auto_802877 ?auto_802886 ) ) ( not ( = ?auto_802877 ?auto_802887 ) ) ( not ( = ?auto_802878 ?auto_802879 ) ) ( not ( = ?auto_802878 ?auto_802880 ) ) ( not ( = ?auto_802878 ?auto_802881 ) ) ( not ( = ?auto_802878 ?auto_802882 ) ) ( not ( = ?auto_802878 ?auto_802883 ) ) ( not ( = ?auto_802878 ?auto_802884 ) ) ( not ( = ?auto_802878 ?auto_802885 ) ) ( not ( = ?auto_802878 ?auto_802886 ) ) ( not ( = ?auto_802878 ?auto_802887 ) ) ( not ( = ?auto_802879 ?auto_802880 ) ) ( not ( = ?auto_802879 ?auto_802881 ) ) ( not ( = ?auto_802879 ?auto_802882 ) ) ( not ( = ?auto_802879 ?auto_802883 ) ) ( not ( = ?auto_802879 ?auto_802884 ) ) ( not ( = ?auto_802879 ?auto_802885 ) ) ( not ( = ?auto_802879 ?auto_802886 ) ) ( not ( = ?auto_802879 ?auto_802887 ) ) ( not ( = ?auto_802880 ?auto_802881 ) ) ( not ( = ?auto_802880 ?auto_802882 ) ) ( not ( = ?auto_802880 ?auto_802883 ) ) ( not ( = ?auto_802880 ?auto_802884 ) ) ( not ( = ?auto_802880 ?auto_802885 ) ) ( not ( = ?auto_802880 ?auto_802886 ) ) ( not ( = ?auto_802880 ?auto_802887 ) ) ( not ( = ?auto_802881 ?auto_802882 ) ) ( not ( = ?auto_802881 ?auto_802883 ) ) ( not ( = ?auto_802881 ?auto_802884 ) ) ( not ( = ?auto_802881 ?auto_802885 ) ) ( not ( = ?auto_802881 ?auto_802886 ) ) ( not ( = ?auto_802881 ?auto_802887 ) ) ( not ( = ?auto_802882 ?auto_802883 ) ) ( not ( = ?auto_802882 ?auto_802884 ) ) ( not ( = ?auto_802882 ?auto_802885 ) ) ( not ( = ?auto_802882 ?auto_802886 ) ) ( not ( = ?auto_802882 ?auto_802887 ) ) ( not ( = ?auto_802883 ?auto_802884 ) ) ( not ( = ?auto_802883 ?auto_802885 ) ) ( not ( = ?auto_802883 ?auto_802886 ) ) ( not ( = ?auto_802883 ?auto_802887 ) ) ( not ( = ?auto_802884 ?auto_802885 ) ) ( not ( = ?auto_802884 ?auto_802886 ) ) ( not ( = ?auto_802884 ?auto_802887 ) ) ( not ( = ?auto_802885 ?auto_802886 ) ) ( not ( = ?auto_802885 ?auto_802887 ) ) ( not ( = ?auto_802886 ?auto_802887 ) ) ( ON ?auto_802885 ?auto_802886 ) ( ON ?auto_802884 ?auto_802885 ) ( ON ?auto_802883 ?auto_802884 ) ( ON ?auto_802882 ?auto_802883 ) ( ON ?auto_802881 ?auto_802882 ) ( ON ?auto_802880 ?auto_802881 ) ( ON ?auto_802879 ?auto_802880 ) ( ON ?auto_802878 ?auto_802879 ) ( ON ?auto_802877 ?auto_802878 ) ( CLEAR ?auto_802877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_802877 )
      ( MAKE-10PILE ?auto_802877 ?auto_802878 ?auto_802879 ?auto_802880 ?auto_802881 ?auto_802882 ?auto_802883 ?auto_802884 ?auto_802885 ?auto_802886 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_802920 - BLOCK
      ?auto_802921 - BLOCK
      ?auto_802922 - BLOCK
      ?auto_802923 - BLOCK
      ?auto_802924 - BLOCK
      ?auto_802925 - BLOCK
      ?auto_802926 - BLOCK
      ?auto_802927 - BLOCK
      ?auto_802928 - BLOCK
      ?auto_802929 - BLOCK
      ?auto_802930 - BLOCK
    )
    :vars
    (
      ?auto_802931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_802929 ) ( ON ?auto_802930 ?auto_802931 ) ( CLEAR ?auto_802930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_802920 ) ( ON ?auto_802921 ?auto_802920 ) ( ON ?auto_802922 ?auto_802921 ) ( ON ?auto_802923 ?auto_802922 ) ( ON ?auto_802924 ?auto_802923 ) ( ON ?auto_802925 ?auto_802924 ) ( ON ?auto_802926 ?auto_802925 ) ( ON ?auto_802927 ?auto_802926 ) ( ON ?auto_802928 ?auto_802927 ) ( ON ?auto_802929 ?auto_802928 ) ( not ( = ?auto_802920 ?auto_802921 ) ) ( not ( = ?auto_802920 ?auto_802922 ) ) ( not ( = ?auto_802920 ?auto_802923 ) ) ( not ( = ?auto_802920 ?auto_802924 ) ) ( not ( = ?auto_802920 ?auto_802925 ) ) ( not ( = ?auto_802920 ?auto_802926 ) ) ( not ( = ?auto_802920 ?auto_802927 ) ) ( not ( = ?auto_802920 ?auto_802928 ) ) ( not ( = ?auto_802920 ?auto_802929 ) ) ( not ( = ?auto_802920 ?auto_802930 ) ) ( not ( = ?auto_802920 ?auto_802931 ) ) ( not ( = ?auto_802921 ?auto_802922 ) ) ( not ( = ?auto_802921 ?auto_802923 ) ) ( not ( = ?auto_802921 ?auto_802924 ) ) ( not ( = ?auto_802921 ?auto_802925 ) ) ( not ( = ?auto_802921 ?auto_802926 ) ) ( not ( = ?auto_802921 ?auto_802927 ) ) ( not ( = ?auto_802921 ?auto_802928 ) ) ( not ( = ?auto_802921 ?auto_802929 ) ) ( not ( = ?auto_802921 ?auto_802930 ) ) ( not ( = ?auto_802921 ?auto_802931 ) ) ( not ( = ?auto_802922 ?auto_802923 ) ) ( not ( = ?auto_802922 ?auto_802924 ) ) ( not ( = ?auto_802922 ?auto_802925 ) ) ( not ( = ?auto_802922 ?auto_802926 ) ) ( not ( = ?auto_802922 ?auto_802927 ) ) ( not ( = ?auto_802922 ?auto_802928 ) ) ( not ( = ?auto_802922 ?auto_802929 ) ) ( not ( = ?auto_802922 ?auto_802930 ) ) ( not ( = ?auto_802922 ?auto_802931 ) ) ( not ( = ?auto_802923 ?auto_802924 ) ) ( not ( = ?auto_802923 ?auto_802925 ) ) ( not ( = ?auto_802923 ?auto_802926 ) ) ( not ( = ?auto_802923 ?auto_802927 ) ) ( not ( = ?auto_802923 ?auto_802928 ) ) ( not ( = ?auto_802923 ?auto_802929 ) ) ( not ( = ?auto_802923 ?auto_802930 ) ) ( not ( = ?auto_802923 ?auto_802931 ) ) ( not ( = ?auto_802924 ?auto_802925 ) ) ( not ( = ?auto_802924 ?auto_802926 ) ) ( not ( = ?auto_802924 ?auto_802927 ) ) ( not ( = ?auto_802924 ?auto_802928 ) ) ( not ( = ?auto_802924 ?auto_802929 ) ) ( not ( = ?auto_802924 ?auto_802930 ) ) ( not ( = ?auto_802924 ?auto_802931 ) ) ( not ( = ?auto_802925 ?auto_802926 ) ) ( not ( = ?auto_802925 ?auto_802927 ) ) ( not ( = ?auto_802925 ?auto_802928 ) ) ( not ( = ?auto_802925 ?auto_802929 ) ) ( not ( = ?auto_802925 ?auto_802930 ) ) ( not ( = ?auto_802925 ?auto_802931 ) ) ( not ( = ?auto_802926 ?auto_802927 ) ) ( not ( = ?auto_802926 ?auto_802928 ) ) ( not ( = ?auto_802926 ?auto_802929 ) ) ( not ( = ?auto_802926 ?auto_802930 ) ) ( not ( = ?auto_802926 ?auto_802931 ) ) ( not ( = ?auto_802927 ?auto_802928 ) ) ( not ( = ?auto_802927 ?auto_802929 ) ) ( not ( = ?auto_802927 ?auto_802930 ) ) ( not ( = ?auto_802927 ?auto_802931 ) ) ( not ( = ?auto_802928 ?auto_802929 ) ) ( not ( = ?auto_802928 ?auto_802930 ) ) ( not ( = ?auto_802928 ?auto_802931 ) ) ( not ( = ?auto_802929 ?auto_802930 ) ) ( not ( = ?auto_802929 ?auto_802931 ) ) ( not ( = ?auto_802930 ?auto_802931 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_802930 ?auto_802931 )
      ( !STACK ?auto_802930 ?auto_802929 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_802966 - BLOCK
      ?auto_802967 - BLOCK
      ?auto_802968 - BLOCK
      ?auto_802969 - BLOCK
      ?auto_802970 - BLOCK
      ?auto_802971 - BLOCK
      ?auto_802972 - BLOCK
      ?auto_802973 - BLOCK
      ?auto_802974 - BLOCK
      ?auto_802975 - BLOCK
      ?auto_802976 - BLOCK
    )
    :vars
    (
      ?auto_802977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_802976 ?auto_802977 ) ( ON-TABLE ?auto_802966 ) ( ON ?auto_802967 ?auto_802966 ) ( ON ?auto_802968 ?auto_802967 ) ( ON ?auto_802969 ?auto_802968 ) ( ON ?auto_802970 ?auto_802969 ) ( ON ?auto_802971 ?auto_802970 ) ( ON ?auto_802972 ?auto_802971 ) ( ON ?auto_802973 ?auto_802972 ) ( ON ?auto_802974 ?auto_802973 ) ( not ( = ?auto_802966 ?auto_802967 ) ) ( not ( = ?auto_802966 ?auto_802968 ) ) ( not ( = ?auto_802966 ?auto_802969 ) ) ( not ( = ?auto_802966 ?auto_802970 ) ) ( not ( = ?auto_802966 ?auto_802971 ) ) ( not ( = ?auto_802966 ?auto_802972 ) ) ( not ( = ?auto_802966 ?auto_802973 ) ) ( not ( = ?auto_802966 ?auto_802974 ) ) ( not ( = ?auto_802966 ?auto_802975 ) ) ( not ( = ?auto_802966 ?auto_802976 ) ) ( not ( = ?auto_802966 ?auto_802977 ) ) ( not ( = ?auto_802967 ?auto_802968 ) ) ( not ( = ?auto_802967 ?auto_802969 ) ) ( not ( = ?auto_802967 ?auto_802970 ) ) ( not ( = ?auto_802967 ?auto_802971 ) ) ( not ( = ?auto_802967 ?auto_802972 ) ) ( not ( = ?auto_802967 ?auto_802973 ) ) ( not ( = ?auto_802967 ?auto_802974 ) ) ( not ( = ?auto_802967 ?auto_802975 ) ) ( not ( = ?auto_802967 ?auto_802976 ) ) ( not ( = ?auto_802967 ?auto_802977 ) ) ( not ( = ?auto_802968 ?auto_802969 ) ) ( not ( = ?auto_802968 ?auto_802970 ) ) ( not ( = ?auto_802968 ?auto_802971 ) ) ( not ( = ?auto_802968 ?auto_802972 ) ) ( not ( = ?auto_802968 ?auto_802973 ) ) ( not ( = ?auto_802968 ?auto_802974 ) ) ( not ( = ?auto_802968 ?auto_802975 ) ) ( not ( = ?auto_802968 ?auto_802976 ) ) ( not ( = ?auto_802968 ?auto_802977 ) ) ( not ( = ?auto_802969 ?auto_802970 ) ) ( not ( = ?auto_802969 ?auto_802971 ) ) ( not ( = ?auto_802969 ?auto_802972 ) ) ( not ( = ?auto_802969 ?auto_802973 ) ) ( not ( = ?auto_802969 ?auto_802974 ) ) ( not ( = ?auto_802969 ?auto_802975 ) ) ( not ( = ?auto_802969 ?auto_802976 ) ) ( not ( = ?auto_802969 ?auto_802977 ) ) ( not ( = ?auto_802970 ?auto_802971 ) ) ( not ( = ?auto_802970 ?auto_802972 ) ) ( not ( = ?auto_802970 ?auto_802973 ) ) ( not ( = ?auto_802970 ?auto_802974 ) ) ( not ( = ?auto_802970 ?auto_802975 ) ) ( not ( = ?auto_802970 ?auto_802976 ) ) ( not ( = ?auto_802970 ?auto_802977 ) ) ( not ( = ?auto_802971 ?auto_802972 ) ) ( not ( = ?auto_802971 ?auto_802973 ) ) ( not ( = ?auto_802971 ?auto_802974 ) ) ( not ( = ?auto_802971 ?auto_802975 ) ) ( not ( = ?auto_802971 ?auto_802976 ) ) ( not ( = ?auto_802971 ?auto_802977 ) ) ( not ( = ?auto_802972 ?auto_802973 ) ) ( not ( = ?auto_802972 ?auto_802974 ) ) ( not ( = ?auto_802972 ?auto_802975 ) ) ( not ( = ?auto_802972 ?auto_802976 ) ) ( not ( = ?auto_802972 ?auto_802977 ) ) ( not ( = ?auto_802973 ?auto_802974 ) ) ( not ( = ?auto_802973 ?auto_802975 ) ) ( not ( = ?auto_802973 ?auto_802976 ) ) ( not ( = ?auto_802973 ?auto_802977 ) ) ( not ( = ?auto_802974 ?auto_802975 ) ) ( not ( = ?auto_802974 ?auto_802976 ) ) ( not ( = ?auto_802974 ?auto_802977 ) ) ( not ( = ?auto_802975 ?auto_802976 ) ) ( not ( = ?auto_802975 ?auto_802977 ) ) ( not ( = ?auto_802976 ?auto_802977 ) ) ( CLEAR ?auto_802974 ) ( ON ?auto_802975 ?auto_802976 ) ( CLEAR ?auto_802975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_802966 ?auto_802967 ?auto_802968 ?auto_802969 ?auto_802970 ?auto_802971 ?auto_802972 ?auto_802973 ?auto_802974 ?auto_802975 )
      ( MAKE-11PILE ?auto_802966 ?auto_802967 ?auto_802968 ?auto_802969 ?auto_802970 ?auto_802971 ?auto_802972 ?auto_802973 ?auto_802974 ?auto_802975 ?auto_802976 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803012 - BLOCK
      ?auto_803013 - BLOCK
      ?auto_803014 - BLOCK
      ?auto_803015 - BLOCK
      ?auto_803016 - BLOCK
      ?auto_803017 - BLOCK
      ?auto_803018 - BLOCK
      ?auto_803019 - BLOCK
      ?auto_803020 - BLOCK
      ?auto_803021 - BLOCK
      ?auto_803022 - BLOCK
    )
    :vars
    (
      ?auto_803023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803022 ?auto_803023 ) ( ON-TABLE ?auto_803012 ) ( ON ?auto_803013 ?auto_803012 ) ( ON ?auto_803014 ?auto_803013 ) ( ON ?auto_803015 ?auto_803014 ) ( ON ?auto_803016 ?auto_803015 ) ( ON ?auto_803017 ?auto_803016 ) ( ON ?auto_803018 ?auto_803017 ) ( ON ?auto_803019 ?auto_803018 ) ( not ( = ?auto_803012 ?auto_803013 ) ) ( not ( = ?auto_803012 ?auto_803014 ) ) ( not ( = ?auto_803012 ?auto_803015 ) ) ( not ( = ?auto_803012 ?auto_803016 ) ) ( not ( = ?auto_803012 ?auto_803017 ) ) ( not ( = ?auto_803012 ?auto_803018 ) ) ( not ( = ?auto_803012 ?auto_803019 ) ) ( not ( = ?auto_803012 ?auto_803020 ) ) ( not ( = ?auto_803012 ?auto_803021 ) ) ( not ( = ?auto_803012 ?auto_803022 ) ) ( not ( = ?auto_803012 ?auto_803023 ) ) ( not ( = ?auto_803013 ?auto_803014 ) ) ( not ( = ?auto_803013 ?auto_803015 ) ) ( not ( = ?auto_803013 ?auto_803016 ) ) ( not ( = ?auto_803013 ?auto_803017 ) ) ( not ( = ?auto_803013 ?auto_803018 ) ) ( not ( = ?auto_803013 ?auto_803019 ) ) ( not ( = ?auto_803013 ?auto_803020 ) ) ( not ( = ?auto_803013 ?auto_803021 ) ) ( not ( = ?auto_803013 ?auto_803022 ) ) ( not ( = ?auto_803013 ?auto_803023 ) ) ( not ( = ?auto_803014 ?auto_803015 ) ) ( not ( = ?auto_803014 ?auto_803016 ) ) ( not ( = ?auto_803014 ?auto_803017 ) ) ( not ( = ?auto_803014 ?auto_803018 ) ) ( not ( = ?auto_803014 ?auto_803019 ) ) ( not ( = ?auto_803014 ?auto_803020 ) ) ( not ( = ?auto_803014 ?auto_803021 ) ) ( not ( = ?auto_803014 ?auto_803022 ) ) ( not ( = ?auto_803014 ?auto_803023 ) ) ( not ( = ?auto_803015 ?auto_803016 ) ) ( not ( = ?auto_803015 ?auto_803017 ) ) ( not ( = ?auto_803015 ?auto_803018 ) ) ( not ( = ?auto_803015 ?auto_803019 ) ) ( not ( = ?auto_803015 ?auto_803020 ) ) ( not ( = ?auto_803015 ?auto_803021 ) ) ( not ( = ?auto_803015 ?auto_803022 ) ) ( not ( = ?auto_803015 ?auto_803023 ) ) ( not ( = ?auto_803016 ?auto_803017 ) ) ( not ( = ?auto_803016 ?auto_803018 ) ) ( not ( = ?auto_803016 ?auto_803019 ) ) ( not ( = ?auto_803016 ?auto_803020 ) ) ( not ( = ?auto_803016 ?auto_803021 ) ) ( not ( = ?auto_803016 ?auto_803022 ) ) ( not ( = ?auto_803016 ?auto_803023 ) ) ( not ( = ?auto_803017 ?auto_803018 ) ) ( not ( = ?auto_803017 ?auto_803019 ) ) ( not ( = ?auto_803017 ?auto_803020 ) ) ( not ( = ?auto_803017 ?auto_803021 ) ) ( not ( = ?auto_803017 ?auto_803022 ) ) ( not ( = ?auto_803017 ?auto_803023 ) ) ( not ( = ?auto_803018 ?auto_803019 ) ) ( not ( = ?auto_803018 ?auto_803020 ) ) ( not ( = ?auto_803018 ?auto_803021 ) ) ( not ( = ?auto_803018 ?auto_803022 ) ) ( not ( = ?auto_803018 ?auto_803023 ) ) ( not ( = ?auto_803019 ?auto_803020 ) ) ( not ( = ?auto_803019 ?auto_803021 ) ) ( not ( = ?auto_803019 ?auto_803022 ) ) ( not ( = ?auto_803019 ?auto_803023 ) ) ( not ( = ?auto_803020 ?auto_803021 ) ) ( not ( = ?auto_803020 ?auto_803022 ) ) ( not ( = ?auto_803020 ?auto_803023 ) ) ( not ( = ?auto_803021 ?auto_803022 ) ) ( not ( = ?auto_803021 ?auto_803023 ) ) ( not ( = ?auto_803022 ?auto_803023 ) ) ( ON ?auto_803021 ?auto_803022 ) ( CLEAR ?auto_803019 ) ( ON ?auto_803020 ?auto_803021 ) ( CLEAR ?auto_803020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_803012 ?auto_803013 ?auto_803014 ?auto_803015 ?auto_803016 ?auto_803017 ?auto_803018 ?auto_803019 ?auto_803020 )
      ( MAKE-11PILE ?auto_803012 ?auto_803013 ?auto_803014 ?auto_803015 ?auto_803016 ?auto_803017 ?auto_803018 ?auto_803019 ?auto_803020 ?auto_803021 ?auto_803022 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803058 - BLOCK
      ?auto_803059 - BLOCK
      ?auto_803060 - BLOCK
      ?auto_803061 - BLOCK
      ?auto_803062 - BLOCK
      ?auto_803063 - BLOCK
      ?auto_803064 - BLOCK
      ?auto_803065 - BLOCK
      ?auto_803066 - BLOCK
      ?auto_803067 - BLOCK
      ?auto_803068 - BLOCK
    )
    :vars
    (
      ?auto_803069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803068 ?auto_803069 ) ( ON-TABLE ?auto_803058 ) ( ON ?auto_803059 ?auto_803058 ) ( ON ?auto_803060 ?auto_803059 ) ( ON ?auto_803061 ?auto_803060 ) ( ON ?auto_803062 ?auto_803061 ) ( ON ?auto_803063 ?auto_803062 ) ( ON ?auto_803064 ?auto_803063 ) ( not ( = ?auto_803058 ?auto_803059 ) ) ( not ( = ?auto_803058 ?auto_803060 ) ) ( not ( = ?auto_803058 ?auto_803061 ) ) ( not ( = ?auto_803058 ?auto_803062 ) ) ( not ( = ?auto_803058 ?auto_803063 ) ) ( not ( = ?auto_803058 ?auto_803064 ) ) ( not ( = ?auto_803058 ?auto_803065 ) ) ( not ( = ?auto_803058 ?auto_803066 ) ) ( not ( = ?auto_803058 ?auto_803067 ) ) ( not ( = ?auto_803058 ?auto_803068 ) ) ( not ( = ?auto_803058 ?auto_803069 ) ) ( not ( = ?auto_803059 ?auto_803060 ) ) ( not ( = ?auto_803059 ?auto_803061 ) ) ( not ( = ?auto_803059 ?auto_803062 ) ) ( not ( = ?auto_803059 ?auto_803063 ) ) ( not ( = ?auto_803059 ?auto_803064 ) ) ( not ( = ?auto_803059 ?auto_803065 ) ) ( not ( = ?auto_803059 ?auto_803066 ) ) ( not ( = ?auto_803059 ?auto_803067 ) ) ( not ( = ?auto_803059 ?auto_803068 ) ) ( not ( = ?auto_803059 ?auto_803069 ) ) ( not ( = ?auto_803060 ?auto_803061 ) ) ( not ( = ?auto_803060 ?auto_803062 ) ) ( not ( = ?auto_803060 ?auto_803063 ) ) ( not ( = ?auto_803060 ?auto_803064 ) ) ( not ( = ?auto_803060 ?auto_803065 ) ) ( not ( = ?auto_803060 ?auto_803066 ) ) ( not ( = ?auto_803060 ?auto_803067 ) ) ( not ( = ?auto_803060 ?auto_803068 ) ) ( not ( = ?auto_803060 ?auto_803069 ) ) ( not ( = ?auto_803061 ?auto_803062 ) ) ( not ( = ?auto_803061 ?auto_803063 ) ) ( not ( = ?auto_803061 ?auto_803064 ) ) ( not ( = ?auto_803061 ?auto_803065 ) ) ( not ( = ?auto_803061 ?auto_803066 ) ) ( not ( = ?auto_803061 ?auto_803067 ) ) ( not ( = ?auto_803061 ?auto_803068 ) ) ( not ( = ?auto_803061 ?auto_803069 ) ) ( not ( = ?auto_803062 ?auto_803063 ) ) ( not ( = ?auto_803062 ?auto_803064 ) ) ( not ( = ?auto_803062 ?auto_803065 ) ) ( not ( = ?auto_803062 ?auto_803066 ) ) ( not ( = ?auto_803062 ?auto_803067 ) ) ( not ( = ?auto_803062 ?auto_803068 ) ) ( not ( = ?auto_803062 ?auto_803069 ) ) ( not ( = ?auto_803063 ?auto_803064 ) ) ( not ( = ?auto_803063 ?auto_803065 ) ) ( not ( = ?auto_803063 ?auto_803066 ) ) ( not ( = ?auto_803063 ?auto_803067 ) ) ( not ( = ?auto_803063 ?auto_803068 ) ) ( not ( = ?auto_803063 ?auto_803069 ) ) ( not ( = ?auto_803064 ?auto_803065 ) ) ( not ( = ?auto_803064 ?auto_803066 ) ) ( not ( = ?auto_803064 ?auto_803067 ) ) ( not ( = ?auto_803064 ?auto_803068 ) ) ( not ( = ?auto_803064 ?auto_803069 ) ) ( not ( = ?auto_803065 ?auto_803066 ) ) ( not ( = ?auto_803065 ?auto_803067 ) ) ( not ( = ?auto_803065 ?auto_803068 ) ) ( not ( = ?auto_803065 ?auto_803069 ) ) ( not ( = ?auto_803066 ?auto_803067 ) ) ( not ( = ?auto_803066 ?auto_803068 ) ) ( not ( = ?auto_803066 ?auto_803069 ) ) ( not ( = ?auto_803067 ?auto_803068 ) ) ( not ( = ?auto_803067 ?auto_803069 ) ) ( not ( = ?auto_803068 ?auto_803069 ) ) ( ON ?auto_803067 ?auto_803068 ) ( ON ?auto_803066 ?auto_803067 ) ( CLEAR ?auto_803064 ) ( ON ?auto_803065 ?auto_803066 ) ( CLEAR ?auto_803065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_803058 ?auto_803059 ?auto_803060 ?auto_803061 ?auto_803062 ?auto_803063 ?auto_803064 ?auto_803065 )
      ( MAKE-11PILE ?auto_803058 ?auto_803059 ?auto_803060 ?auto_803061 ?auto_803062 ?auto_803063 ?auto_803064 ?auto_803065 ?auto_803066 ?auto_803067 ?auto_803068 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803104 - BLOCK
      ?auto_803105 - BLOCK
      ?auto_803106 - BLOCK
      ?auto_803107 - BLOCK
      ?auto_803108 - BLOCK
      ?auto_803109 - BLOCK
      ?auto_803110 - BLOCK
      ?auto_803111 - BLOCK
      ?auto_803112 - BLOCK
      ?auto_803113 - BLOCK
      ?auto_803114 - BLOCK
    )
    :vars
    (
      ?auto_803115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803114 ?auto_803115 ) ( ON-TABLE ?auto_803104 ) ( ON ?auto_803105 ?auto_803104 ) ( ON ?auto_803106 ?auto_803105 ) ( ON ?auto_803107 ?auto_803106 ) ( ON ?auto_803108 ?auto_803107 ) ( ON ?auto_803109 ?auto_803108 ) ( not ( = ?auto_803104 ?auto_803105 ) ) ( not ( = ?auto_803104 ?auto_803106 ) ) ( not ( = ?auto_803104 ?auto_803107 ) ) ( not ( = ?auto_803104 ?auto_803108 ) ) ( not ( = ?auto_803104 ?auto_803109 ) ) ( not ( = ?auto_803104 ?auto_803110 ) ) ( not ( = ?auto_803104 ?auto_803111 ) ) ( not ( = ?auto_803104 ?auto_803112 ) ) ( not ( = ?auto_803104 ?auto_803113 ) ) ( not ( = ?auto_803104 ?auto_803114 ) ) ( not ( = ?auto_803104 ?auto_803115 ) ) ( not ( = ?auto_803105 ?auto_803106 ) ) ( not ( = ?auto_803105 ?auto_803107 ) ) ( not ( = ?auto_803105 ?auto_803108 ) ) ( not ( = ?auto_803105 ?auto_803109 ) ) ( not ( = ?auto_803105 ?auto_803110 ) ) ( not ( = ?auto_803105 ?auto_803111 ) ) ( not ( = ?auto_803105 ?auto_803112 ) ) ( not ( = ?auto_803105 ?auto_803113 ) ) ( not ( = ?auto_803105 ?auto_803114 ) ) ( not ( = ?auto_803105 ?auto_803115 ) ) ( not ( = ?auto_803106 ?auto_803107 ) ) ( not ( = ?auto_803106 ?auto_803108 ) ) ( not ( = ?auto_803106 ?auto_803109 ) ) ( not ( = ?auto_803106 ?auto_803110 ) ) ( not ( = ?auto_803106 ?auto_803111 ) ) ( not ( = ?auto_803106 ?auto_803112 ) ) ( not ( = ?auto_803106 ?auto_803113 ) ) ( not ( = ?auto_803106 ?auto_803114 ) ) ( not ( = ?auto_803106 ?auto_803115 ) ) ( not ( = ?auto_803107 ?auto_803108 ) ) ( not ( = ?auto_803107 ?auto_803109 ) ) ( not ( = ?auto_803107 ?auto_803110 ) ) ( not ( = ?auto_803107 ?auto_803111 ) ) ( not ( = ?auto_803107 ?auto_803112 ) ) ( not ( = ?auto_803107 ?auto_803113 ) ) ( not ( = ?auto_803107 ?auto_803114 ) ) ( not ( = ?auto_803107 ?auto_803115 ) ) ( not ( = ?auto_803108 ?auto_803109 ) ) ( not ( = ?auto_803108 ?auto_803110 ) ) ( not ( = ?auto_803108 ?auto_803111 ) ) ( not ( = ?auto_803108 ?auto_803112 ) ) ( not ( = ?auto_803108 ?auto_803113 ) ) ( not ( = ?auto_803108 ?auto_803114 ) ) ( not ( = ?auto_803108 ?auto_803115 ) ) ( not ( = ?auto_803109 ?auto_803110 ) ) ( not ( = ?auto_803109 ?auto_803111 ) ) ( not ( = ?auto_803109 ?auto_803112 ) ) ( not ( = ?auto_803109 ?auto_803113 ) ) ( not ( = ?auto_803109 ?auto_803114 ) ) ( not ( = ?auto_803109 ?auto_803115 ) ) ( not ( = ?auto_803110 ?auto_803111 ) ) ( not ( = ?auto_803110 ?auto_803112 ) ) ( not ( = ?auto_803110 ?auto_803113 ) ) ( not ( = ?auto_803110 ?auto_803114 ) ) ( not ( = ?auto_803110 ?auto_803115 ) ) ( not ( = ?auto_803111 ?auto_803112 ) ) ( not ( = ?auto_803111 ?auto_803113 ) ) ( not ( = ?auto_803111 ?auto_803114 ) ) ( not ( = ?auto_803111 ?auto_803115 ) ) ( not ( = ?auto_803112 ?auto_803113 ) ) ( not ( = ?auto_803112 ?auto_803114 ) ) ( not ( = ?auto_803112 ?auto_803115 ) ) ( not ( = ?auto_803113 ?auto_803114 ) ) ( not ( = ?auto_803113 ?auto_803115 ) ) ( not ( = ?auto_803114 ?auto_803115 ) ) ( ON ?auto_803113 ?auto_803114 ) ( ON ?auto_803112 ?auto_803113 ) ( ON ?auto_803111 ?auto_803112 ) ( CLEAR ?auto_803109 ) ( ON ?auto_803110 ?auto_803111 ) ( CLEAR ?auto_803110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_803104 ?auto_803105 ?auto_803106 ?auto_803107 ?auto_803108 ?auto_803109 ?auto_803110 )
      ( MAKE-11PILE ?auto_803104 ?auto_803105 ?auto_803106 ?auto_803107 ?auto_803108 ?auto_803109 ?auto_803110 ?auto_803111 ?auto_803112 ?auto_803113 ?auto_803114 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803150 - BLOCK
      ?auto_803151 - BLOCK
      ?auto_803152 - BLOCK
      ?auto_803153 - BLOCK
      ?auto_803154 - BLOCK
      ?auto_803155 - BLOCK
      ?auto_803156 - BLOCK
      ?auto_803157 - BLOCK
      ?auto_803158 - BLOCK
      ?auto_803159 - BLOCK
      ?auto_803160 - BLOCK
    )
    :vars
    (
      ?auto_803161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803160 ?auto_803161 ) ( ON-TABLE ?auto_803150 ) ( ON ?auto_803151 ?auto_803150 ) ( ON ?auto_803152 ?auto_803151 ) ( ON ?auto_803153 ?auto_803152 ) ( ON ?auto_803154 ?auto_803153 ) ( not ( = ?auto_803150 ?auto_803151 ) ) ( not ( = ?auto_803150 ?auto_803152 ) ) ( not ( = ?auto_803150 ?auto_803153 ) ) ( not ( = ?auto_803150 ?auto_803154 ) ) ( not ( = ?auto_803150 ?auto_803155 ) ) ( not ( = ?auto_803150 ?auto_803156 ) ) ( not ( = ?auto_803150 ?auto_803157 ) ) ( not ( = ?auto_803150 ?auto_803158 ) ) ( not ( = ?auto_803150 ?auto_803159 ) ) ( not ( = ?auto_803150 ?auto_803160 ) ) ( not ( = ?auto_803150 ?auto_803161 ) ) ( not ( = ?auto_803151 ?auto_803152 ) ) ( not ( = ?auto_803151 ?auto_803153 ) ) ( not ( = ?auto_803151 ?auto_803154 ) ) ( not ( = ?auto_803151 ?auto_803155 ) ) ( not ( = ?auto_803151 ?auto_803156 ) ) ( not ( = ?auto_803151 ?auto_803157 ) ) ( not ( = ?auto_803151 ?auto_803158 ) ) ( not ( = ?auto_803151 ?auto_803159 ) ) ( not ( = ?auto_803151 ?auto_803160 ) ) ( not ( = ?auto_803151 ?auto_803161 ) ) ( not ( = ?auto_803152 ?auto_803153 ) ) ( not ( = ?auto_803152 ?auto_803154 ) ) ( not ( = ?auto_803152 ?auto_803155 ) ) ( not ( = ?auto_803152 ?auto_803156 ) ) ( not ( = ?auto_803152 ?auto_803157 ) ) ( not ( = ?auto_803152 ?auto_803158 ) ) ( not ( = ?auto_803152 ?auto_803159 ) ) ( not ( = ?auto_803152 ?auto_803160 ) ) ( not ( = ?auto_803152 ?auto_803161 ) ) ( not ( = ?auto_803153 ?auto_803154 ) ) ( not ( = ?auto_803153 ?auto_803155 ) ) ( not ( = ?auto_803153 ?auto_803156 ) ) ( not ( = ?auto_803153 ?auto_803157 ) ) ( not ( = ?auto_803153 ?auto_803158 ) ) ( not ( = ?auto_803153 ?auto_803159 ) ) ( not ( = ?auto_803153 ?auto_803160 ) ) ( not ( = ?auto_803153 ?auto_803161 ) ) ( not ( = ?auto_803154 ?auto_803155 ) ) ( not ( = ?auto_803154 ?auto_803156 ) ) ( not ( = ?auto_803154 ?auto_803157 ) ) ( not ( = ?auto_803154 ?auto_803158 ) ) ( not ( = ?auto_803154 ?auto_803159 ) ) ( not ( = ?auto_803154 ?auto_803160 ) ) ( not ( = ?auto_803154 ?auto_803161 ) ) ( not ( = ?auto_803155 ?auto_803156 ) ) ( not ( = ?auto_803155 ?auto_803157 ) ) ( not ( = ?auto_803155 ?auto_803158 ) ) ( not ( = ?auto_803155 ?auto_803159 ) ) ( not ( = ?auto_803155 ?auto_803160 ) ) ( not ( = ?auto_803155 ?auto_803161 ) ) ( not ( = ?auto_803156 ?auto_803157 ) ) ( not ( = ?auto_803156 ?auto_803158 ) ) ( not ( = ?auto_803156 ?auto_803159 ) ) ( not ( = ?auto_803156 ?auto_803160 ) ) ( not ( = ?auto_803156 ?auto_803161 ) ) ( not ( = ?auto_803157 ?auto_803158 ) ) ( not ( = ?auto_803157 ?auto_803159 ) ) ( not ( = ?auto_803157 ?auto_803160 ) ) ( not ( = ?auto_803157 ?auto_803161 ) ) ( not ( = ?auto_803158 ?auto_803159 ) ) ( not ( = ?auto_803158 ?auto_803160 ) ) ( not ( = ?auto_803158 ?auto_803161 ) ) ( not ( = ?auto_803159 ?auto_803160 ) ) ( not ( = ?auto_803159 ?auto_803161 ) ) ( not ( = ?auto_803160 ?auto_803161 ) ) ( ON ?auto_803159 ?auto_803160 ) ( ON ?auto_803158 ?auto_803159 ) ( ON ?auto_803157 ?auto_803158 ) ( ON ?auto_803156 ?auto_803157 ) ( CLEAR ?auto_803154 ) ( ON ?auto_803155 ?auto_803156 ) ( CLEAR ?auto_803155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_803150 ?auto_803151 ?auto_803152 ?auto_803153 ?auto_803154 ?auto_803155 )
      ( MAKE-11PILE ?auto_803150 ?auto_803151 ?auto_803152 ?auto_803153 ?auto_803154 ?auto_803155 ?auto_803156 ?auto_803157 ?auto_803158 ?auto_803159 ?auto_803160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803196 - BLOCK
      ?auto_803197 - BLOCK
      ?auto_803198 - BLOCK
      ?auto_803199 - BLOCK
      ?auto_803200 - BLOCK
      ?auto_803201 - BLOCK
      ?auto_803202 - BLOCK
      ?auto_803203 - BLOCK
      ?auto_803204 - BLOCK
      ?auto_803205 - BLOCK
      ?auto_803206 - BLOCK
    )
    :vars
    (
      ?auto_803207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803206 ?auto_803207 ) ( ON-TABLE ?auto_803196 ) ( ON ?auto_803197 ?auto_803196 ) ( ON ?auto_803198 ?auto_803197 ) ( ON ?auto_803199 ?auto_803198 ) ( not ( = ?auto_803196 ?auto_803197 ) ) ( not ( = ?auto_803196 ?auto_803198 ) ) ( not ( = ?auto_803196 ?auto_803199 ) ) ( not ( = ?auto_803196 ?auto_803200 ) ) ( not ( = ?auto_803196 ?auto_803201 ) ) ( not ( = ?auto_803196 ?auto_803202 ) ) ( not ( = ?auto_803196 ?auto_803203 ) ) ( not ( = ?auto_803196 ?auto_803204 ) ) ( not ( = ?auto_803196 ?auto_803205 ) ) ( not ( = ?auto_803196 ?auto_803206 ) ) ( not ( = ?auto_803196 ?auto_803207 ) ) ( not ( = ?auto_803197 ?auto_803198 ) ) ( not ( = ?auto_803197 ?auto_803199 ) ) ( not ( = ?auto_803197 ?auto_803200 ) ) ( not ( = ?auto_803197 ?auto_803201 ) ) ( not ( = ?auto_803197 ?auto_803202 ) ) ( not ( = ?auto_803197 ?auto_803203 ) ) ( not ( = ?auto_803197 ?auto_803204 ) ) ( not ( = ?auto_803197 ?auto_803205 ) ) ( not ( = ?auto_803197 ?auto_803206 ) ) ( not ( = ?auto_803197 ?auto_803207 ) ) ( not ( = ?auto_803198 ?auto_803199 ) ) ( not ( = ?auto_803198 ?auto_803200 ) ) ( not ( = ?auto_803198 ?auto_803201 ) ) ( not ( = ?auto_803198 ?auto_803202 ) ) ( not ( = ?auto_803198 ?auto_803203 ) ) ( not ( = ?auto_803198 ?auto_803204 ) ) ( not ( = ?auto_803198 ?auto_803205 ) ) ( not ( = ?auto_803198 ?auto_803206 ) ) ( not ( = ?auto_803198 ?auto_803207 ) ) ( not ( = ?auto_803199 ?auto_803200 ) ) ( not ( = ?auto_803199 ?auto_803201 ) ) ( not ( = ?auto_803199 ?auto_803202 ) ) ( not ( = ?auto_803199 ?auto_803203 ) ) ( not ( = ?auto_803199 ?auto_803204 ) ) ( not ( = ?auto_803199 ?auto_803205 ) ) ( not ( = ?auto_803199 ?auto_803206 ) ) ( not ( = ?auto_803199 ?auto_803207 ) ) ( not ( = ?auto_803200 ?auto_803201 ) ) ( not ( = ?auto_803200 ?auto_803202 ) ) ( not ( = ?auto_803200 ?auto_803203 ) ) ( not ( = ?auto_803200 ?auto_803204 ) ) ( not ( = ?auto_803200 ?auto_803205 ) ) ( not ( = ?auto_803200 ?auto_803206 ) ) ( not ( = ?auto_803200 ?auto_803207 ) ) ( not ( = ?auto_803201 ?auto_803202 ) ) ( not ( = ?auto_803201 ?auto_803203 ) ) ( not ( = ?auto_803201 ?auto_803204 ) ) ( not ( = ?auto_803201 ?auto_803205 ) ) ( not ( = ?auto_803201 ?auto_803206 ) ) ( not ( = ?auto_803201 ?auto_803207 ) ) ( not ( = ?auto_803202 ?auto_803203 ) ) ( not ( = ?auto_803202 ?auto_803204 ) ) ( not ( = ?auto_803202 ?auto_803205 ) ) ( not ( = ?auto_803202 ?auto_803206 ) ) ( not ( = ?auto_803202 ?auto_803207 ) ) ( not ( = ?auto_803203 ?auto_803204 ) ) ( not ( = ?auto_803203 ?auto_803205 ) ) ( not ( = ?auto_803203 ?auto_803206 ) ) ( not ( = ?auto_803203 ?auto_803207 ) ) ( not ( = ?auto_803204 ?auto_803205 ) ) ( not ( = ?auto_803204 ?auto_803206 ) ) ( not ( = ?auto_803204 ?auto_803207 ) ) ( not ( = ?auto_803205 ?auto_803206 ) ) ( not ( = ?auto_803205 ?auto_803207 ) ) ( not ( = ?auto_803206 ?auto_803207 ) ) ( ON ?auto_803205 ?auto_803206 ) ( ON ?auto_803204 ?auto_803205 ) ( ON ?auto_803203 ?auto_803204 ) ( ON ?auto_803202 ?auto_803203 ) ( ON ?auto_803201 ?auto_803202 ) ( CLEAR ?auto_803199 ) ( ON ?auto_803200 ?auto_803201 ) ( CLEAR ?auto_803200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_803196 ?auto_803197 ?auto_803198 ?auto_803199 ?auto_803200 )
      ( MAKE-11PILE ?auto_803196 ?auto_803197 ?auto_803198 ?auto_803199 ?auto_803200 ?auto_803201 ?auto_803202 ?auto_803203 ?auto_803204 ?auto_803205 ?auto_803206 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803242 - BLOCK
      ?auto_803243 - BLOCK
      ?auto_803244 - BLOCK
      ?auto_803245 - BLOCK
      ?auto_803246 - BLOCK
      ?auto_803247 - BLOCK
      ?auto_803248 - BLOCK
      ?auto_803249 - BLOCK
      ?auto_803250 - BLOCK
      ?auto_803251 - BLOCK
      ?auto_803252 - BLOCK
    )
    :vars
    (
      ?auto_803253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803252 ?auto_803253 ) ( ON-TABLE ?auto_803242 ) ( ON ?auto_803243 ?auto_803242 ) ( ON ?auto_803244 ?auto_803243 ) ( not ( = ?auto_803242 ?auto_803243 ) ) ( not ( = ?auto_803242 ?auto_803244 ) ) ( not ( = ?auto_803242 ?auto_803245 ) ) ( not ( = ?auto_803242 ?auto_803246 ) ) ( not ( = ?auto_803242 ?auto_803247 ) ) ( not ( = ?auto_803242 ?auto_803248 ) ) ( not ( = ?auto_803242 ?auto_803249 ) ) ( not ( = ?auto_803242 ?auto_803250 ) ) ( not ( = ?auto_803242 ?auto_803251 ) ) ( not ( = ?auto_803242 ?auto_803252 ) ) ( not ( = ?auto_803242 ?auto_803253 ) ) ( not ( = ?auto_803243 ?auto_803244 ) ) ( not ( = ?auto_803243 ?auto_803245 ) ) ( not ( = ?auto_803243 ?auto_803246 ) ) ( not ( = ?auto_803243 ?auto_803247 ) ) ( not ( = ?auto_803243 ?auto_803248 ) ) ( not ( = ?auto_803243 ?auto_803249 ) ) ( not ( = ?auto_803243 ?auto_803250 ) ) ( not ( = ?auto_803243 ?auto_803251 ) ) ( not ( = ?auto_803243 ?auto_803252 ) ) ( not ( = ?auto_803243 ?auto_803253 ) ) ( not ( = ?auto_803244 ?auto_803245 ) ) ( not ( = ?auto_803244 ?auto_803246 ) ) ( not ( = ?auto_803244 ?auto_803247 ) ) ( not ( = ?auto_803244 ?auto_803248 ) ) ( not ( = ?auto_803244 ?auto_803249 ) ) ( not ( = ?auto_803244 ?auto_803250 ) ) ( not ( = ?auto_803244 ?auto_803251 ) ) ( not ( = ?auto_803244 ?auto_803252 ) ) ( not ( = ?auto_803244 ?auto_803253 ) ) ( not ( = ?auto_803245 ?auto_803246 ) ) ( not ( = ?auto_803245 ?auto_803247 ) ) ( not ( = ?auto_803245 ?auto_803248 ) ) ( not ( = ?auto_803245 ?auto_803249 ) ) ( not ( = ?auto_803245 ?auto_803250 ) ) ( not ( = ?auto_803245 ?auto_803251 ) ) ( not ( = ?auto_803245 ?auto_803252 ) ) ( not ( = ?auto_803245 ?auto_803253 ) ) ( not ( = ?auto_803246 ?auto_803247 ) ) ( not ( = ?auto_803246 ?auto_803248 ) ) ( not ( = ?auto_803246 ?auto_803249 ) ) ( not ( = ?auto_803246 ?auto_803250 ) ) ( not ( = ?auto_803246 ?auto_803251 ) ) ( not ( = ?auto_803246 ?auto_803252 ) ) ( not ( = ?auto_803246 ?auto_803253 ) ) ( not ( = ?auto_803247 ?auto_803248 ) ) ( not ( = ?auto_803247 ?auto_803249 ) ) ( not ( = ?auto_803247 ?auto_803250 ) ) ( not ( = ?auto_803247 ?auto_803251 ) ) ( not ( = ?auto_803247 ?auto_803252 ) ) ( not ( = ?auto_803247 ?auto_803253 ) ) ( not ( = ?auto_803248 ?auto_803249 ) ) ( not ( = ?auto_803248 ?auto_803250 ) ) ( not ( = ?auto_803248 ?auto_803251 ) ) ( not ( = ?auto_803248 ?auto_803252 ) ) ( not ( = ?auto_803248 ?auto_803253 ) ) ( not ( = ?auto_803249 ?auto_803250 ) ) ( not ( = ?auto_803249 ?auto_803251 ) ) ( not ( = ?auto_803249 ?auto_803252 ) ) ( not ( = ?auto_803249 ?auto_803253 ) ) ( not ( = ?auto_803250 ?auto_803251 ) ) ( not ( = ?auto_803250 ?auto_803252 ) ) ( not ( = ?auto_803250 ?auto_803253 ) ) ( not ( = ?auto_803251 ?auto_803252 ) ) ( not ( = ?auto_803251 ?auto_803253 ) ) ( not ( = ?auto_803252 ?auto_803253 ) ) ( ON ?auto_803251 ?auto_803252 ) ( ON ?auto_803250 ?auto_803251 ) ( ON ?auto_803249 ?auto_803250 ) ( ON ?auto_803248 ?auto_803249 ) ( ON ?auto_803247 ?auto_803248 ) ( ON ?auto_803246 ?auto_803247 ) ( CLEAR ?auto_803244 ) ( ON ?auto_803245 ?auto_803246 ) ( CLEAR ?auto_803245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_803242 ?auto_803243 ?auto_803244 ?auto_803245 )
      ( MAKE-11PILE ?auto_803242 ?auto_803243 ?auto_803244 ?auto_803245 ?auto_803246 ?auto_803247 ?auto_803248 ?auto_803249 ?auto_803250 ?auto_803251 ?auto_803252 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803288 - BLOCK
      ?auto_803289 - BLOCK
      ?auto_803290 - BLOCK
      ?auto_803291 - BLOCK
      ?auto_803292 - BLOCK
      ?auto_803293 - BLOCK
      ?auto_803294 - BLOCK
      ?auto_803295 - BLOCK
      ?auto_803296 - BLOCK
      ?auto_803297 - BLOCK
      ?auto_803298 - BLOCK
    )
    :vars
    (
      ?auto_803299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803298 ?auto_803299 ) ( ON-TABLE ?auto_803288 ) ( ON ?auto_803289 ?auto_803288 ) ( not ( = ?auto_803288 ?auto_803289 ) ) ( not ( = ?auto_803288 ?auto_803290 ) ) ( not ( = ?auto_803288 ?auto_803291 ) ) ( not ( = ?auto_803288 ?auto_803292 ) ) ( not ( = ?auto_803288 ?auto_803293 ) ) ( not ( = ?auto_803288 ?auto_803294 ) ) ( not ( = ?auto_803288 ?auto_803295 ) ) ( not ( = ?auto_803288 ?auto_803296 ) ) ( not ( = ?auto_803288 ?auto_803297 ) ) ( not ( = ?auto_803288 ?auto_803298 ) ) ( not ( = ?auto_803288 ?auto_803299 ) ) ( not ( = ?auto_803289 ?auto_803290 ) ) ( not ( = ?auto_803289 ?auto_803291 ) ) ( not ( = ?auto_803289 ?auto_803292 ) ) ( not ( = ?auto_803289 ?auto_803293 ) ) ( not ( = ?auto_803289 ?auto_803294 ) ) ( not ( = ?auto_803289 ?auto_803295 ) ) ( not ( = ?auto_803289 ?auto_803296 ) ) ( not ( = ?auto_803289 ?auto_803297 ) ) ( not ( = ?auto_803289 ?auto_803298 ) ) ( not ( = ?auto_803289 ?auto_803299 ) ) ( not ( = ?auto_803290 ?auto_803291 ) ) ( not ( = ?auto_803290 ?auto_803292 ) ) ( not ( = ?auto_803290 ?auto_803293 ) ) ( not ( = ?auto_803290 ?auto_803294 ) ) ( not ( = ?auto_803290 ?auto_803295 ) ) ( not ( = ?auto_803290 ?auto_803296 ) ) ( not ( = ?auto_803290 ?auto_803297 ) ) ( not ( = ?auto_803290 ?auto_803298 ) ) ( not ( = ?auto_803290 ?auto_803299 ) ) ( not ( = ?auto_803291 ?auto_803292 ) ) ( not ( = ?auto_803291 ?auto_803293 ) ) ( not ( = ?auto_803291 ?auto_803294 ) ) ( not ( = ?auto_803291 ?auto_803295 ) ) ( not ( = ?auto_803291 ?auto_803296 ) ) ( not ( = ?auto_803291 ?auto_803297 ) ) ( not ( = ?auto_803291 ?auto_803298 ) ) ( not ( = ?auto_803291 ?auto_803299 ) ) ( not ( = ?auto_803292 ?auto_803293 ) ) ( not ( = ?auto_803292 ?auto_803294 ) ) ( not ( = ?auto_803292 ?auto_803295 ) ) ( not ( = ?auto_803292 ?auto_803296 ) ) ( not ( = ?auto_803292 ?auto_803297 ) ) ( not ( = ?auto_803292 ?auto_803298 ) ) ( not ( = ?auto_803292 ?auto_803299 ) ) ( not ( = ?auto_803293 ?auto_803294 ) ) ( not ( = ?auto_803293 ?auto_803295 ) ) ( not ( = ?auto_803293 ?auto_803296 ) ) ( not ( = ?auto_803293 ?auto_803297 ) ) ( not ( = ?auto_803293 ?auto_803298 ) ) ( not ( = ?auto_803293 ?auto_803299 ) ) ( not ( = ?auto_803294 ?auto_803295 ) ) ( not ( = ?auto_803294 ?auto_803296 ) ) ( not ( = ?auto_803294 ?auto_803297 ) ) ( not ( = ?auto_803294 ?auto_803298 ) ) ( not ( = ?auto_803294 ?auto_803299 ) ) ( not ( = ?auto_803295 ?auto_803296 ) ) ( not ( = ?auto_803295 ?auto_803297 ) ) ( not ( = ?auto_803295 ?auto_803298 ) ) ( not ( = ?auto_803295 ?auto_803299 ) ) ( not ( = ?auto_803296 ?auto_803297 ) ) ( not ( = ?auto_803296 ?auto_803298 ) ) ( not ( = ?auto_803296 ?auto_803299 ) ) ( not ( = ?auto_803297 ?auto_803298 ) ) ( not ( = ?auto_803297 ?auto_803299 ) ) ( not ( = ?auto_803298 ?auto_803299 ) ) ( ON ?auto_803297 ?auto_803298 ) ( ON ?auto_803296 ?auto_803297 ) ( ON ?auto_803295 ?auto_803296 ) ( ON ?auto_803294 ?auto_803295 ) ( ON ?auto_803293 ?auto_803294 ) ( ON ?auto_803292 ?auto_803293 ) ( ON ?auto_803291 ?auto_803292 ) ( CLEAR ?auto_803289 ) ( ON ?auto_803290 ?auto_803291 ) ( CLEAR ?auto_803290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_803288 ?auto_803289 ?auto_803290 )
      ( MAKE-11PILE ?auto_803288 ?auto_803289 ?auto_803290 ?auto_803291 ?auto_803292 ?auto_803293 ?auto_803294 ?auto_803295 ?auto_803296 ?auto_803297 ?auto_803298 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803334 - BLOCK
      ?auto_803335 - BLOCK
      ?auto_803336 - BLOCK
      ?auto_803337 - BLOCK
      ?auto_803338 - BLOCK
      ?auto_803339 - BLOCK
      ?auto_803340 - BLOCK
      ?auto_803341 - BLOCK
      ?auto_803342 - BLOCK
      ?auto_803343 - BLOCK
      ?auto_803344 - BLOCK
    )
    :vars
    (
      ?auto_803345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803344 ?auto_803345 ) ( ON-TABLE ?auto_803334 ) ( not ( = ?auto_803334 ?auto_803335 ) ) ( not ( = ?auto_803334 ?auto_803336 ) ) ( not ( = ?auto_803334 ?auto_803337 ) ) ( not ( = ?auto_803334 ?auto_803338 ) ) ( not ( = ?auto_803334 ?auto_803339 ) ) ( not ( = ?auto_803334 ?auto_803340 ) ) ( not ( = ?auto_803334 ?auto_803341 ) ) ( not ( = ?auto_803334 ?auto_803342 ) ) ( not ( = ?auto_803334 ?auto_803343 ) ) ( not ( = ?auto_803334 ?auto_803344 ) ) ( not ( = ?auto_803334 ?auto_803345 ) ) ( not ( = ?auto_803335 ?auto_803336 ) ) ( not ( = ?auto_803335 ?auto_803337 ) ) ( not ( = ?auto_803335 ?auto_803338 ) ) ( not ( = ?auto_803335 ?auto_803339 ) ) ( not ( = ?auto_803335 ?auto_803340 ) ) ( not ( = ?auto_803335 ?auto_803341 ) ) ( not ( = ?auto_803335 ?auto_803342 ) ) ( not ( = ?auto_803335 ?auto_803343 ) ) ( not ( = ?auto_803335 ?auto_803344 ) ) ( not ( = ?auto_803335 ?auto_803345 ) ) ( not ( = ?auto_803336 ?auto_803337 ) ) ( not ( = ?auto_803336 ?auto_803338 ) ) ( not ( = ?auto_803336 ?auto_803339 ) ) ( not ( = ?auto_803336 ?auto_803340 ) ) ( not ( = ?auto_803336 ?auto_803341 ) ) ( not ( = ?auto_803336 ?auto_803342 ) ) ( not ( = ?auto_803336 ?auto_803343 ) ) ( not ( = ?auto_803336 ?auto_803344 ) ) ( not ( = ?auto_803336 ?auto_803345 ) ) ( not ( = ?auto_803337 ?auto_803338 ) ) ( not ( = ?auto_803337 ?auto_803339 ) ) ( not ( = ?auto_803337 ?auto_803340 ) ) ( not ( = ?auto_803337 ?auto_803341 ) ) ( not ( = ?auto_803337 ?auto_803342 ) ) ( not ( = ?auto_803337 ?auto_803343 ) ) ( not ( = ?auto_803337 ?auto_803344 ) ) ( not ( = ?auto_803337 ?auto_803345 ) ) ( not ( = ?auto_803338 ?auto_803339 ) ) ( not ( = ?auto_803338 ?auto_803340 ) ) ( not ( = ?auto_803338 ?auto_803341 ) ) ( not ( = ?auto_803338 ?auto_803342 ) ) ( not ( = ?auto_803338 ?auto_803343 ) ) ( not ( = ?auto_803338 ?auto_803344 ) ) ( not ( = ?auto_803338 ?auto_803345 ) ) ( not ( = ?auto_803339 ?auto_803340 ) ) ( not ( = ?auto_803339 ?auto_803341 ) ) ( not ( = ?auto_803339 ?auto_803342 ) ) ( not ( = ?auto_803339 ?auto_803343 ) ) ( not ( = ?auto_803339 ?auto_803344 ) ) ( not ( = ?auto_803339 ?auto_803345 ) ) ( not ( = ?auto_803340 ?auto_803341 ) ) ( not ( = ?auto_803340 ?auto_803342 ) ) ( not ( = ?auto_803340 ?auto_803343 ) ) ( not ( = ?auto_803340 ?auto_803344 ) ) ( not ( = ?auto_803340 ?auto_803345 ) ) ( not ( = ?auto_803341 ?auto_803342 ) ) ( not ( = ?auto_803341 ?auto_803343 ) ) ( not ( = ?auto_803341 ?auto_803344 ) ) ( not ( = ?auto_803341 ?auto_803345 ) ) ( not ( = ?auto_803342 ?auto_803343 ) ) ( not ( = ?auto_803342 ?auto_803344 ) ) ( not ( = ?auto_803342 ?auto_803345 ) ) ( not ( = ?auto_803343 ?auto_803344 ) ) ( not ( = ?auto_803343 ?auto_803345 ) ) ( not ( = ?auto_803344 ?auto_803345 ) ) ( ON ?auto_803343 ?auto_803344 ) ( ON ?auto_803342 ?auto_803343 ) ( ON ?auto_803341 ?auto_803342 ) ( ON ?auto_803340 ?auto_803341 ) ( ON ?auto_803339 ?auto_803340 ) ( ON ?auto_803338 ?auto_803339 ) ( ON ?auto_803337 ?auto_803338 ) ( ON ?auto_803336 ?auto_803337 ) ( CLEAR ?auto_803334 ) ( ON ?auto_803335 ?auto_803336 ) ( CLEAR ?auto_803335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_803334 ?auto_803335 )
      ( MAKE-11PILE ?auto_803334 ?auto_803335 ?auto_803336 ?auto_803337 ?auto_803338 ?auto_803339 ?auto_803340 ?auto_803341 ?auto_803342 ?auto_803343 ?auto_803344 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_803380 - BLOCK
      ?auto_803381 - BLOCK
      ?auto_803382 - BLOCK
      ?auto_803383 - BLOCK
      ?auto_803384 - BLOCK
      ?auto_803385 - BLOCK
      ?auto_803386 - BLOCK
      ?auto_803387 - BLOCK
      ?auto_803388 - BLOCK
      ?auto_803389 - BLOCK
      ?auto_803390 - BLOCK
    )
    :vars
    (
      ?auto_803391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803390 ?auto_803391 ) ( not ( = ?auto_803380 ?auto_803381 ) ) ( not ( = ?auto_803380 ?auto_803382 ) ) ( not ( = ?auto_803380 ?auto_803383 ) ) ( not ( = ?auto_803380 ?auto_803384 ) ) ( not ( = ?auto_803380 ?auto_803385 ) ) ( not ( = ?auto_803380 ?auto_803386 ) ) ( not ( = ?auto_803380 ?auto_803387 ) ) ( not ( = ?auto_803380 ?auto_803388 ) ) ( not ( = ?auto_803380 ?auto_803389 ) ) ( not ( = ?auto_803380 ?auto_803390 ) ) ( not ( = ?auto_803380 ?auto_803391 ) ) ( not ( = ?auto_803381 ?auto_803382 ) ) ( not ( = ?auto_803381 ?auto_803383 ) ) ( not ( = ?auto_803381 ?auto_803384 ) ) ( not ( = ?auto_803381 ?auto_803385 ) ) ( not ( = ?auto_803381 ?auto_803386 ) ) ( not ( = ?auto_803381 ?auto_803387 ) ) ( not ( = ?auto_803381 ?auto_803388 ) ) ( not ( = ?auto_803381 ?auto_803389 ) ) ( not ( = ?auto_803381 ?auto_803390 ) ) ( not ( = ?auto_803381 ?auto_803391 ) ) ( not ( = ?auto_803382 ?auto_803383 ) ) ( not ( = ?auto_803382 ?auto_803384 ) ) ( not ( = ?auto_803382 ?auto_803385 ) ) ( not ( = ?auto_803382 ?auto_803386 ) ) ( not ( = ?auto_803382 ?auto_803387 ) ) ( not ( = ?auto_803382 ?auto_803388 ) ) ( not ( = ?auto_803382 ?auto_803389 ) ) ( not ( = ?auto_803382 ?auto_803390 ) ) ( not ( = ?auto_803382 ?auto_803391 ) ) ( not ( = ?auto_803383 ?auto_803384 ) ) ( not ( = ?auto_803383 ?auto_803385 ) ) ( not ( = ?auto_803383 ?auto_803386 ) ) ( not ( = ?auto_803383 ?auto_803387 ) ) ( not ( = ?auto_803383 ?auto_803388 ) ) ( not ( = ?auto_803383 ?auto_803389 ) ) ( not ( = ?auto_803383 ?auto_803390 ) ) ( not ( = ?auto_803383 ?auto_803391 ) ) ( not ( = ?auto_803384 ?auto_803385 ) ) ( not ( = ?auto_803384 ?auto_803386 ) ) ( not ( = ?auto_803384 ?auto_803387 ) ) ( not ( = ?auto_803384 ?auto_803388 ) ) ( not ( = ?auto_803384 ?auto_803389 ) ) ( not ( = ?auto_803384 ?auto_803390 ) ) ( not ( = ?auto_803384 ?auto_803391 ) ) ( not ( = ?auto_803385 ?auto_803386 ) ) ( not ( = ?auto_803385 ?auto_803387 ) ) ( not ( = ?auto_803385 ?auto_803388 ) ) ( not ( = ?auto_803385 ?auto_803389 ) ) ( not ( = ?auto_803385 ?auto_803390 ) ) ( not ( = ?auto_803385 ?auto_803391 ) ) ( not ( = ?auto_803386 ?auto_803387 ) ) ( not ( = ?auto_803386 ?auto_803388 ) ) ( not ( = ?auto_803386 ?auto_803389 ) ) ( not ( = ?auto_803386 ?auto_803390 ) ) ( not ( = ?auto_803386 ?auto_803391 ) ) ( not ( = ?auto_803387 ?auto_803388 ) ) ( not ( = ?auto_803387 ?auto_803389 ) ) ( not ( = ?auto_803387 ?auto_803390 ) ) ( not ( = ?auto_803387 ?auto_803391 ) ) ( not ( = ?auto_803388 ?auto_803389 ) ) ( not ( = ?auto_803388 ?auto_803390 ) ) ( not ( = ?auto_803388 ?auto_803391 ) ) ( not ( = ?auto_803389 ?auto_803390 ) ) ( not ( = ?auto_803389 ?auto_803391 ) ) ( not ( = ?auto_803390 ?auto_803391 ) ) ( ON ?auto_803389 ?auto_803390 ) ( ON ?auto_803388 ?auto_803389 ) ( ON ?auto_803387 ?auto_803388 ) ( ON ?auto_803386 ?auto_803387 ) ( ON ?auto_803385 ?auto_803386 ) ( ON ?auto_803384 ?auto_803385 ) ( ON ?auto_803383 ?auto_803384 ) ( ON ?auto_803382 ?auto_803383 ) ( ON ?auto_803381 ?auto_803382 ) ( ON ?auto_803380 ?auto_803381 ) ( CLEAR ?auto_803380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_803380 )
      ( MAKE-11PILE ?auto_803380 ?auto_803381 ?auto_803382 ?auto_803383 ?auto_803384 ?auto_803385 ?auto_803386 ?auto_803387 ?auto_803388 ?auto_803389 ?auto_803390 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803427 - BLOCK
      ?auto_803428 - BLOCK
      ?auto_803429 - BLOCK
      ?auto_803430 - BLOCK
      ?auto_803431 - BLOCK
      ?auto_803432 - BLOCK
      ?auto_803433 - BLOCK
      ?auto_803434 - BLOCK
      ?auto_803435 - BLOCK
      ?auto_803436 - BLOCK
      ?auto_803437 - BLOCK
      ?auto_803438 - BLOCK
    )
    :vars
    (
      ?auto_803439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_803437 ) ( ON ?auto_803438 ?auto_803439 ) ( CLEAR ?auto_803438 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_803427 ) ( ON ?auto_803428 ?auto_803427 ) ( ON ?auto_803429 ?auto_803428 ) ( ON ?auto_803430 ?auto_803429 ) ( ON ?auto_803431 ?auto_803430 ) ( ON ?auto_803432 ?auto_803431 ) ( ON ?auto_803433 ?auto_803432 ) ( ON ?auto_803434 ?auto_803433 ) ( ON ?auto_803435 ?auto_803434 ) ( ON ?auto_803436 ?auto_803435 ) ( ON ?auto_803437 ?auto_803436 ) ( not ( = ?auto_803427 ?auto_803428 ) ) ( not ( = ?auto_803427 ?auto_803429 ) ) ( not ( = ?auto_803427 ?auto_803430 ) ) ( not ( = ?auto_803427 ?auto_803431 ) ) ( not ( = ?auto_803427 ?auto_803432 ) ) ( not ( = ?auto_803427 ?auto_803433 ) ) ( not ( = ?auto_803427 ?auto_803434 ) ) ( not ( = ?auto_803427 ?auto_803435 ) ) ( not ( = ?auto_803427 ?auto_803436 ) ) ( not ( = ?auto_803427 ?auto_803437 ) ) ( not ( = ?auto_803427 ?auto_803438 ) ) ( not ( = ?auto_803427 ?auto_803439 ) ) ( not ( = ?auto_803428 ?auto_803429 ) ) ( not ( = ?auto_803428 ?auto_803430 ) ) ( not ( = ?auto_803428 ?auto_803431 ) ) ( not ( = ?auto_803428 ?auto_803432 ) ) ( not ( = ?auto_803428 ?auto_803433 ) ) ( not ( = ?auto_803428 ?auto_803434 ) ) ( not ( = ?auto_803428 ?auto_803435 ) ) ( not ( = ?auto_803428 ?auto_803436 ) ) ( not ( = ?auto_803428 ?auto_803437 ) ) ( not ( = ?auto_803428 ?auto_803438 ) ) ( not ( = ?auto_803428 ?auto_803439 ) ) ( not ( = ?auto_803429 ?auto_803430 ) ) ( not ( = ?auto_803429 ?auto_803431 ) ) ( not ( = ?auto_803429 ?auto_803432 ) ) ( not ( = ?auto_803429 ?auto_803433 ) ) ( not ( = ?auto_803429 ?auto_803434 ) ) ( not ( = ?auto_803429 ?auto_803435 ) ) ( not ( = ?auto_803429 ?auto_803436 ) ) ( not ( = ?auto_803429 ?auto_803437 ) ) ( not ( = ?auto_803429 ?auto_803438 ) ) ( not ( = ?auto_803429 ?auto_803439 ) ) ( not ( = ?auto_803430 ?auto_803431 ) ) ( not ( = ?auto_803430 ?auto_803432 ) ) ( not ( = ?auto_803430 ?auto_803433 ) ) ( not ( = ?auto_803430 ?auto_803434 ) ) ( not ( = ?auto_803430 ?auto_803435 ) ) ( not ( = ?auto_803430 ?auto_803436 ) ) ( not ( = ?auto_803430 ?auto_803437 ) ) ( not ( = ?auto_803430 ?auto_803438 ) ) ( not ( = ?auto_803430 ?auto_803439 ) ) ( not ( = ?auto_803431 ?auto_803432 ) ) ( not ( = ?auto_803431 ?auto_803433 ) ) ( not ( = ?auto_803431 ?auto_803434 ) ) ( not ( = ?auto_803431 ?auto_803435 ) ) ( not ( = ?auto_803431 ?auto_803436 ) ) ( not ( = ?auto_803431 ?auto_803437 ) ) ( not ( = ?auto_803431 ?auto_803438 ) ) ( not ( = ?auto_803431 ?auto_803439 ) ) ( not ( = ?auto_803432 ?auto_803433 ) ) ( not ( = ?auto_803432 ?auto_803434 ) ) ( not ( = ?auto_803432 ?auto_803435 ) ) ( not ( = ?auto_803432 ?auto_803436 ) ) ( not ( = ?auto_803432 ?auto_803437 ) ) ( not ( = ?auto_803432 ?auto_803438 ) ) ( not ( = ?auto_803432 ?auto_803439 ) ) ( not ( = ?auto_803433 ?auto_803434 ) ) ( not ( = ?auto_803433 ?auto_803435 ) ) ( not ( = ?auto_803433 ?auto_803436 ) ) ( not ( = ?auto_803433 ?auto_803437 ) ) ( not ( = ?auto_803433 ?auto_803438 ) ) ( not ( = ?auto_803433 ?auto_803439 ) ) ( not ( = ?auto_803434 ?auto_803435 ) ) ( not ( = ?auto_803434 ?auto_803436 ) ) ( not ( = ?auto_803434 ?auto_803437 ) ) ( not ( = ?auto_803434 ?auto_803438 ) ) ( not ( = ?auto_803434 ?auto_803439 ) ) ( not ( = ?auto_803435 ?auto_803436 ) ) ( not ( = ?auto_803435 ?auto_803437 ) ) ( not ( = ?auto_803435 ?auto_803438 ) ) ( not ( = ?auto_803435 ?auto_803439 ) ) ( not ( = ?auto_803436 ?auto_803437 ) ) ( not ( = ?auto_803436 ?auto_803438 ) ) ( not ( = ?auto_803436 ?auto_803439 ) ) ( not ( = ?auto_803437 ?auto_803438 ) ) ( not ( = ?auto_803437 ?auto_803439 ) ) ( not ( = ?auto_803438 ?auto_803439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_803438 ?auto_803439 )
      ( !STACK ?auto_803438 ?auto_803437 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803477 - BLOCK
      ?auto_803478 - BLOCK
      ?auto_803479 - BLOCK
      ?auto_803480 - BLOCK
      ?auto_803481 - BLOCK
      ?auto_803482 - BLOCK
      ?auto_803483 - BLOCK
      ?auto_803484 - BLOCK
      ?auto_803485 - BLOCK
      ?auto_803486 - BLOCK
      ?auto_803487 - BLOCK
      ?auto_803488 - BLOCK
    )
    :vars
    (
      ?auto_803489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803488 ?auto_803489 ) ( ON-TABLE ?auto_803477 ) ( ON ?auto_803478 ?auto_803477 ) ( ON ?auto_803479 ?auto_803478 ) ( ON ?auto_803480 ?auto_803479 ) ( ON ?auto_803481 ?auto_803480 ) ( ON ?auto_803482 ?auto_803481 ) ( ON ?auto_803483 ?auto_803482 ) ( ON ?auto_803484 ?auto_803483 ) ( ON ?auto_803485 ?auto_803484 ) ( ON ?auto_803486 ?auto_803485 ) ( not ( = ?auto_803477 ?auto_803478 ) ) ( not ( = ?auto_803477 ?auto_803479 ) ) ( not ( = ?auto_803477 ?auto_803480 ) ) ( not ( = ?auto_803477 ?auto_803481 ) ) ( not ( = ?auto_803477 ?auto_803482 ) ) ( not ( = ?auto_803477 ?auto_803483 ) ) ( not ( = ?auto_803477 ?auto_803484 ) ) ( not ( = ?auto_803477 ?auto_803485 ) ) ( not ( = ?auto_803477 ?auto_803486 ) ) ( not ( = ?auto_803477 ?auto_803487 ) ) ( not ( = ?auto_803477 ?auto_803488 ) ) ( not ( = ?auto_803477 ?auto_803489 ) ) ( not ( = ?auto_803478 ?auto_803479 ) ) ( not ( = ?auto_803478 ?auto_803480 ) ) ( not ( = ?auto_803478 ?auto_803481 ) ) ( not ( = ?auto_803478 ?auto_803482 ) ) ( not ( = ?auto_803478 ?auto_803483 ) ) ( not ( = ?auto_803478 ?auto_803484 ) ) ( not ( = ?auto_803478 ?auto_803485 ) ) ( not ( = ?auto_803478 ?auto_803486 ) ) ( not ( = ?auto_803478 ?auto_803487 ) ) ( not ( = ?auto_803478 ?auto_803488 ) ) ( not ( = ?auto_803478 ?auto_803489 ) ) ( not ( = ?auto_803479 ?auto_803480 ) ) ( not ( = ?auto_803479 ?auto_803481 ) ) ( not ( = ?auto_803479 ?auto_803482 ) ) ( not ( = ?auto_803479 ?auto_803483 ) ) ( not ( = ?auto_803479 ?auto_803484 ) ) ( not ( = ?auto_803479 ?auto_803485 ) ) ( not ( = ?auto_803479 ?auto_803486 ) ) ( not ( = ?auto_803479 ?auto_803487 ) ) ( not ( = ?auto_803479 ?auto_803488 ) ) ( not ( = ?auto_803479 ?auto_803489 ) ) ( not ( = ?auto_803480 ?auto_803481 ) ) ( not ( = ?auto_803480 ?auto_803482 ) ) ( not ( = ?auto_803480 ?auto_803483 ) ) ( not ( = ?auto_803480 ?auto_803484 ) ) ( not ( = ?auto_803480 ?auto_803485 ) ) ( not ( = ?auto_803480 ?auto_803486 ) ) ( not ( = ?auto_803480 ?auto_803487 ) ) ( not ( = ?auto_803480 ?auto_803488 ) ) ( not ( = ?auto_803480 ?auto_803489 ) ) ( not ( = ?auto_803481 ?auto_803482 ) ) ( not ( = ?auto_803481 ?auto_803483 ) ) ( not ( = ?auto_803481 ?auto_803484 ) ) ( not ( = ?auto_803481 ?auto_803485 ) ) ( not ( = ?auto_803481 ?auto_803486 ) ) ( not ( = ?auto_803481 ?auto_803487 ) ) ( not ( = ?auto_803481 ?auto_803488 ) ) ( not ( = ?auto_803481 ?auto_803489 ) ) ( not ( = ?auto_803482 ?auto_803483 ) ) ( not ( = ?auto_803482 ?auto_803484 ) ) ( not ( = ?auto_803482 ?auto_803485 ) ) ( not ( = ?auto_803482 ?auto_803486 ) ) ( not ( = ?auto_803482 ?auto_803487 ) ) ( not ( = ?auto_803482 ?auto_803488 ) ) ( not ( = ?auto_803482 ?auto_803489 ) ) ( not ( = ?auto_803483 ?auto_803484 ) ) ( not ( = ?auto_803483 ?auto_803485 ) ) ( not ( = ?auto_803483 ?auto_803486 ) ) ( not ( = ?auto_803483 ?auto_803487 ) ) ( not ( = ?auto_803483 ?auto_803488 ) ) ( not ( = ?auto_803483 ?auto_803489 ) ) ( not ( = ?auto_803484 ?auto_803485 ) ) ( not ( = ?auto_803484 ?auto_803486 ) ) ( not ( = ?auto_803484 ?auto_803487 ) ) ( not ( = ?auto_803484 ?auto_803488 ) ) ( not ( = ?auto_803484 ?auto_803489 ) ) ( not ( = ?auto_803485 ?auto_803486 ) ) ( not ( = ?auto_803485 ?auto_803487 ) ) ( not ( = ?auto_803485 ?auto_803488 ) ) ( not ( = ?auto_803485 ?auto_803489 ) ) ( not ( = ?auto_803486 ?auto_803487 ) ) ( not ( = ?auto_803486 ?auto_803488 ) ) ( not ( = ?auto_803486 ?auto_803489 ) ) ( not ( = ?auto_803487 ?auto_803488 ) ) ( not ( = ?auto_803487 ?auto_803489 ) ) ( not ( = ?auto_803488 ?auto_803489 ) ) ( CLEAR ?auto_803486 ) ( ON ?auto_803487 ?auto_803488 ) ( CLEAR ?auto_803487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_803477 ?auto_803478 ?auto_803479 ?auto_803480 ?auto_803481 ?auto_803482 ?auto_803483 ?auto_803484 ?auto_803485 ?auto_803486 ?auto_803487 )
      ( MAKE-12PILE ?auto_803477 ?auto_803478 ?auto_803479 ?auto_803480 ?auto_803481 ?auto_803482 ?auto_803483 ?auto_803484 ?auto_803485 ?auto_803486 ?auto_803487 ?auto_803488 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803527 - BLOCK
      ?auto_803528 - BLOCK
      ?auto_803529 - BLOCK
      ?auto_803530 - BLOCK
      ?auto_803531 - BLOCK
      ?auto_803532 - BLOCK
      ?auto_803533 - BLOCK
      ?auto_803534 - BLOCK
      ?auto_803535 - BLOCK
      ?auto_803536 - BLOCK
      ?auto_803537 - BLOCK
      ?auto_803538 - BLOCK
    )
    :vars
    (
      ?auto_803539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803538 ?auto_803539 ) ( ON-TABLE ?auto_803527 ) ( ON ?auto_803528 ?auto_803527 ) ( ON ?auto_803529 ?auto_803528 ) ( ON ?auto_803530 ?auto_803529 ) ( ON ?auto_803531 ?auto_803530 ) ( ON ?auto_803532 ?auto_803531 ) ( ON ?auto_803533 ?auto_803532 ) ( ON ?auto_803534 ?auto_803533 ) ( ON ?auto_803535 ?auto_803534 ) ( not ( = ?auto_803527 ?auto_803528 ) ) ( not ( = ?auto_803527 ?auto_803529 ) ) ( not ( = ?auto_803527 ?auto_803530 ) ) ( not ( = ?auto_803527 ?auto_803531 ) ) ( not ( = ?auto_803527 ?auto_803532 ) ) ( not ( = ?auto_803527 ?auto_803533 ) ) ( not ( = ?auto_803527 ?auto_803534 ) ) ( not ( = ?auto_803527 ?auto_803535 ) ) ( not ( = ?auto_803527 ?auto_803536 ) ) ( not ( = ?auto_803527 ?auto_803537 ) ) ( not ( = ?auto_803527 ?auto_803538 ) ) ( not ( = ?auto_803527 ?auto_803539 ) ) ( not ( = ?auto_803528 ?auto_803529 ) ) ( not ( = ?auto_803528 ?auto_803530 ) ) ( not ( = ?auto_803528 ?auto_803531 ) ) ( not ( = ?auto_803528 ?auto_803532 ) ) ( not ( = ?auto_803528 ?auto_803533 ) ) ( not ( = ?auto_803528 ?auto_803534 ) ) ( not ( = ?auto_803528 ?auto_803535 ) ) ( not ( = ?auto_803528 ?auto_803536 ) ) ( not ( = ?auto_803528 ?auto_803537 ) ) ( not ( = ?auto_803528 ?auto_803538 ) ) ( not ( = ?auto_803528 ?auto_803539 ) ) ( not ( = ?auto_803529 ?auto_803530 ) ) ( not ( = ?auto_803529 ?auto_803531 ) ) ( not ( = ?auto_803529 ?auto_803532 ) ) ( not ( = ?auto_803529 ?auto_803533 ) ) ( not ( = ?auto_803529 ?auto_803534 ) ) ( not ( = ?auto_803529 ?auto_803535 ) ) ( not ( = ?auto_803529 ?auto_803536 ) ) ( not ( = ?auto_803529 ?auto_803537 ) ) ( not ( = ?auto_803529 ?auto_803538 ) ) ( not ( = ?auto_803529 ?auto_803539 ) ) ( not ( = ?auto_803530 ?auto_803531 ) ) ( not ( = ?auto_803530 ?auto_803532 ) ) ( not ( = ?auto_803530 ?auto_803533 ) ) ( not ( = ?auto_803530 ?auto_803534 ) ) ( not ( = ?auto_803530 ?auto_803535 ) ) ( not ( = ?auto_803530 ?auto_803536 ) ) ( not ( = ?auto_803530 ?auto_803537 ) ) ( not ( = ?auto_803530 ?auto_803538 ) ) ( not ( = ?auto_803530 ?auto_803539 ) ) ( not ( = ?auto_803531 ?auto_803532 ) ) ( not ( = ?auto_803531 ?auto_803533 ) ) ( not ( = ?auto_803531 ?auto_803534 ) ) ( not ( = ?auto_803531 ?auto_803535 ) ) ( not ( = ?auto_803531 ?auto_803536 ) ) ( not ( = ?auto_803531 ?auto_803537 ) ) ( not ( = ?auto_803531 ?auto_803538 ) ) ( not ( = ?auto_803531 ?auto_803539 ) ) ( not ( = ?auto_803532 ?auto_803533 ) ) ( not ( = ?auto_803532 ?auto_803534 ) ) ( not ( = ?auto_803532 ?auto_803535 ) ) ( not ( = ?auto_803532 ?auto_803536 ) ) ( not ( = ?auto_803532 ?auto_803537 ) ) ( not ( = ?auto_803532 ?auto_803538 ) ) ( not ( = ?auto_803532 ?auto_803539 ) ) ( not ( = ?auto_803533 ?auto_803534 ) ) ( not ( = ?auto_803533 ?auto_803535 ) ) ( not ( = ?auto_803533 ?auto_803536 ) ) ( not ( = ?auto_803533 ?auto_803537 ) ) ( not ( = ?auto_803533 ?auto_803538 ) ) ( not ( = ?auto_803533 ?auto_803539 ) ) ( not ( = ?auto_803534 ?auto_803535 ) ) ( not ( = ?auto_803534 ?auto_803536 ) ) ( not ( = ?auto_803534 ?auto_803537 ) ) ( not ( = ?auto_803534 ?auto_803538 ) ) ( not ( = ?auto_803534 ?auto_803539 ) ) ( not ( = ?auto_803535 ?auto_803536 ) ) ( not ( = ?auto_803535 ?auto_803537 ) ) ( not ( = ?auto_803535 ?auto_803538 ) ) ( not ( = ?auto_803535 ?auto_803539 ) ) ( not ( = ?auto_803536 ?auto_803537 ) ) ( not ( = ?auto_803536 ?auto_803538 ) ) ( not ( = ?auto_803536 ?auto_803539 ) ) ( not ( = ?auto_803537 ?auto_803538 ) ) ( not ( = ?auto_803537 ?auto_803539 ) ) ( not ( = ?auto_803538 ?auto_803539 ) ) ( ON ?auto_803537 ?auto_803538 ) ( CLEAR ?auto_803535 ) ( ON ?auto_803536 ?auto_803537 ) ( CLEAR ?auto_803536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_803527 ?auto_803528 ?auto_803529 ?auto_803530 ?auto_803531 ?auto_803532 ?auto_803533 ?auto_803534 ?auto_803535 ?auto_803536 )
      ( MAKE-12PILE ?auto_803527 ?auto_803528 ?auto_803529 ?auto_803530 ?auto_803531 ?auto_803532 ?auto_803533 ?auto_803534 ?auto_803535 ?auto_803536 ?auto_803537 ?auto_803538 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803577 - BLOCK
      ?auto_803578 - BLOCK
      ?auto_803579 - BLOCK
      ?auto_803580 - BLOCK
      ?auto_803581 - BLOCK
      ?auto_803582 - BLOCK
      ?auto_803583 - BLOCK
      ?auto_803584 - BLOCK
      ?auto_803585 - BLOCK
      ?auto_803586 - BLOCK
      ?auto_803587 - BLOCK
      ?auto_803588 - BLOCK
    )
    :vars
    (
      ?auto_803589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803588 ?auto_803589 ) ( ON-TABLE ?auto_803577 ) ( ON ?auto_803578 ?auto_803577 ) ( ON ?auto_803579 ?auto_803578 ) ( ON ?auto_803580 ?auto_803579 ) ( ON ?auto_803581 ?auto_803580 ) ( ON ?auto_803582 ?auto_803581 ) ( ON ?auto_803583 ?auto_803582 ) ( ON ?auto_803584 ?auto_803583 ) ( not ( = ?auto_803577 ?auto_803578 ) ) ( not ( = ?auto_803577 ?auto_803579 ) ) ( not ( = ?auto_803577 ?auto_803580 ) ) ( not ( = ?auto_803577 ?auto_803581 ) ) ( not ( = ?auto_803577 ?auto_803582 ) ) ( not ( = ?auto_803577 ?auto_803583 ) ) ( not ( = ?auto_803577 ?auto_803584 ) ) ( not ( = ?auto_803577 ?auto_803585 ) ) ( not ( = ?auto_803577 ?auto_803586 ) ) ( not ( = ?auto_803577 ?auto_803587 ) ) ( not ( = ?auto_803577 ?auto_803588 ) ) ( not ( = ?auto_803577 ?auto_803589 ) ) ( not ( = ?auto_803578 ?auto_803579 ) ) ( not ( = ?auto_803578 ?auto_803580 ) ) ( not ( = ?auto_803578 ?auto_803581 ) ) ( not ( = ?auto_803578 ?auto_803582 ) ) ( not ( = ?auto_803578 ?auto_803583 ) ) ( not ( = ?auto_803578 ?auto_803584 ) ) ( not ( = ?auto_803578 ?auto_803585 ) ) ( not ( = ?auto_803578 ?auto_803586 ) ) ( not ( = ?auto_803578 ?auto_803587 ) ) ( not ( = ?auto_803578 ?auto_803588 ) ) ( not ( = ?auto_803578 ?auto_803589 ) ) ( not ( = ?auto_803579 ?auto_803580 ) ) ( not ( = ?auto_803579 ?auto_803581 ) ) ( not ( = ?auto_803579 ?auto_803582 ) ) ( not ( = ?auto_803579 ?auto_803583 ) ) ( not ( = ?auto_803579 ?auto_803584 ) ) ( not ( = ?auto_803579 ?auto_803585 ) ) ( not ( = ?auto_803579 ?auto_803586 ) ) ( not ( = ?auto_803579 ?auto_803587 ) ) ( not ( = ?auto_803579 ?auto_803588 ) ) ( not ( = ?auto_803579 ?auto_803589 ) ) ( not ( = ?auto_803580 ?auto_803581 ) ) ( not ( = ?auto_803580 ?auto_803582 ) ) ( not ( = ?auto_803580 ?auto_803583 ) ) ( not ( = ?auto_803580 ?auto_803584 ) ) ( not ( = ?auto_803580 ?auto_803585 ) ) ( not ( = ?auto_803580 ?auto_803586 ) ) ( not ( = ?auto_803580 ?auto_803587 ) ) ( not ( = ?auto_803580 ?auto_803588 ) ) ( not ( = ?auto_803580 ?auto_803589 ) ) ( not ( = ?auto_803581 ?auto_803582 ) ) ( not ( = ?auto_803581 ?auto_803583 ) ) ( not ( = ?auto_803581 ?auto_803584 ) ) ( not ( = ?auto_803581 ?auto_803585 ) ) ( not ( = ?auto_803581 ?auto_803586 ) ) ( not ( = ?auto_803581 ?auto_803587 ) ) ( not ( = ?auto_803581 ?auto_803588 ) ) ( not ( = ?auto_803581 ?auto_803589 ) ) ( not ( = ?auto_803582 ?auto_803583 ) ) ( not ( = ?auto_803582 ?auto_803584 ) ) ( not ( = ?auto_803582 ?auto_803585 ) ) ( not ( = ?auto_803582 ?auto_803586 ) ) ( not ( = ?auto_803582 ?auto_803587 ) ) ( not ( = ?auto_803582 ?auto_803588 ) ) ( not ( = ?auto_803582 ?auto_803589 ) ) ( not ( = ?auto_803583 ?auto_803584 ) ) ( not ( = ?auto_803583 ?auto_803585 ) ) ( not ( = ?auto_803583 ?auto_803586 ) ) ( not ( = ?auto_803583 ?auto_803587 ) ) ( not ( = ?auto_803583 ?auto_803588 ) ) ( not ( = ?auto_803583 ?auto_803589 ) ) ( not ( = ?auto_803584 ?auto_803585 ) ) ( not ( = ?auto_803584 ?auto_803586 ) ) ( not ( = ?auto_803584 ?auto_803587 ) ) ( not ( = ?auto_803584 ?auto_803588 ) ) ( not ( = ?auto_803584 ?auto_803589 ) ) ( not ( = ?auto_803585 ?auto_803586 ) ) ( not ( = ?auto_803585 ?auto_803587 ) ) ( not ( = ?auto_803585 ?auto_803588 ) ) ( not ( = ?auto_803585 ?auto_803589 ) ) ( not ( = ?auto_803586 ?auto_803587 ) ) ( not ( = ?auto_803586 ?auto_803588 ) ) ( not ( = ?auto_803586 ?auto_803589 ) ) ( not ( = ?auto_803587 ?auto_803588 ) ) ( not ( = ?auto_803587 ?auto_803589 ) ) ( not ( = ?auto_803588 ?auto_803589 ) ) ( ON ?auto_803587 ?auto_803588 ) ( ON ?auto_803586 ?auto_803587 ) ( CLEAR ?auto_803584 ) ( ON ?auto_803585 ?auto_803586 ) ( CLEAR ?auto_803585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_803577 ?auto_803578 ?auto_803579 ?auto_803580 ?auto_803581 ?auto_803582 ?auto_803583 ?auto_803584 ?auto_803585 )
      ( MAKE-12PILE ?auto_803577 ?auto_803578 ?auto_803579 ?auto_803580 ?auto_803581 ?auto_803582 ?auto_803583 ?auto_803584 ?auto_803585 ?auto_803586 ?auto_803587 ?auto_803588 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803627 - BLOCK
      ?auto_803628 - BLOCK
      ?auto_803629 - BLOCK
      ?auto_803630 - BLOCK
      ?auto_803631 - BLOCK
      ?auto_803632 - BLOCK
      ?auto_803633 - BLOCK
      ?auto_803634 - BLOCK
      ?auto_803635 - BLOCK
      ?auto_803636 - BLOCK
      ?auto_803637 - BLOCK
      ?auto_803638 - BLOCK
    )
    :vars
    (
      ?auto_803639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803638 ?auto_803639 ) ( ON-TABLE ?auto_803627 ) ( ON ?auto_803628 ?auto_803627 ) ( ON ?auto_803629 ?auto_803628 ) ( ON ?auto_803630 ?auto_803629 ) ( ON ?auto_803631 ?auto_803630 ) ( ON ?auto_803632 ?auto_803631 ) ( ON ?auto_803633 ?auto_803632 ) ( not ( = ?auto_803627 ?auto_803628 ) ) ( not ( = ?auto_803627 ?auto_803629 ) ) ( not ( = ?auto_803627 ?auto_803630 ) ) ( not ( = ?auto_803627 ?auto_803631 ) ) ( not ( = ?auto_803627 ?auto_803632 ) ) ( not ( = ?auto_803627 ?auto_803633 ) ) ( not ( = ?auto_803627 ?auto_803634 ) ) ( not ( = ?auto_803627 ?auto_803635 ) ) ( not ( = ?auto_803627 ?auto_803636 ) ) ( not ( = ?auto_803627 ?auto_803637 ) ) ( not ( = ?auto_803627 ?auto_803638 ) ) ( not ( = ?auto_803627 ?auto_803639 ) ) ( not ( = ?auto_803628 ?auto_803629 ) ) ( not ( = ?auto_803628 ?auto_803630 ) ) ( not ( = ?auto_803628 ?auto_803631 ) ) ( not ( = ?auto_803628 ?auto_803632 ) ) ( not ( = ?auto_803628 ?auto_803633 ) ) ( not ( = ?auto_803628 ?auto_803634 ) ) ( not ( = ?auto_803628 ?auto_803635 ) ) ( not ( = ?auto_803628 ?auto_803636 ) ) ( not ( = ?auto_803628 ?auto_803637 ) ) ( not ( = ?auto_803628 ?auto_803638 ) ) ( not ( = ?auto_803628 ?auto_803639 ) ) ( not ( = ?auto_803629 ?auto_803630 ) ) ( not ( = ?auto_803629 ?auto_803631 ) ) ( not ( = ?auto_803629 ?auto_803632 ) ) ( not ( = ?auto_803629 ?auto_803633 ) ) ( not ( = ?auto_803629 ?auto_803634 ) ) ( not ( = ?auto_803629 ?auto_803635 ) ) ( not ( = ?auto_803629 ?auto_803636 ) ) ( not ( = ?auto_803629 ?auto_803637 ) ) ( not ( = ?auto_803629 ?auto_803638 ) ) ( not ( = ?auto_803629 ?auto_803639 ) ) ( not ( = ?auto_803630 ?auto_803631 ) ) ( not ( = ?auto_803630 ?auto_803632 ) ) ( not ( = ?auto_803630 ?auto_803633 ) ) ( not ( = ?auto_803630 ?auto_803634 ) ) ( not ( = ?auto_803630 ?auto_803635 ) ) ( not ( = ?auto_803630 ?auto_803636 ) ) ( not ( = ?auto_803630 ?auto_803637 ) ) ( not ( = ?auto_803630 ?auto_803638 ) ) ( not ( = ?auto_803630 ?auto_803639 ) ) ( not ( = ?auto_803631 ?auto_803632 ) ) ( not ( = ?auto_803631 ?auto_803633 ) ) ( not ( = ?auto_803631 ?auto_803634 ) ) ( not ( = ?auto_803631 ?auto_803635 ) ) ( not ( = ?auto_803631 ?auto_803636 ) ) ( not ( = ?auto_803631 ?auto_803637 ) ) ( not ( = ?auto_803631 ?auto_803638 ) ) ( not ( = ?auto_803631 ?auto_803639 ) ) ( not ( = ?auto_803632 ?auto_803633 ) ) ( not ( = ?auto_803632 ?auto_803634 ) ) ( not ( = ?auto_803632 ?auto_803635 ) ) ( not ( = ?auto_803632 ?auto_803636 ) ) ( not ( = ?auto_803632 ?auto_803637 ) ) ( not ( = ?auto_803632 ?auto_803638 ) ) ( not ( = ?auto_803632 ?auto_803639 ) ) ( not ( = ?auto_803633 ?auto_803634 ) ) ( not ( = ?auto_803633 ?auto_803635 ) ) ( not ( = ?auto_803633 ?auto_803636 ) ) ( not ( = ?auto_803633 ?auto_803637 ) ) ( not ( = ?auto_803633 ?auto_803638 ) ) ( not ( = ?auto_803633 ?auto_803639 ) ) ( not ( = ?auto_803634 ?auto_803635 ) ) ( not ( = ?auto_803634 ?auto_803636 ) ) ( not ( = ?auto_803634 ?auto_803637 ) ) ( not ( = ?auto_803634 ?auto_803638 ) ) ( not ( = ?auto_803634 ?auto_803639 ) ) ( not ( = ?auto_803635 ?auto_803636 ) ) ( not ( = ?auto_803635 ?auto_803637 ) ) ( not ( = ?auto_803635 ?auto_803638 ) ) ( not ( = ?auto_803635 ?auto_803639 ) ) ( not ( = ?auto_803636 ?auto_803637 ) ) ( not ( = ?auto_803636 ?auto_803638 ) ) ( not ( = ?auto_803636 ?auto_803639 ) ) ( not ( = ?auto_803637 ?auto_803638 ) ) ( not ( = ?auto_803637 ?auto_803639 ) ) ( not ( = ?auto_803638 ?auto_803639 ) ) ( ON ?auto_803637 ?auto_803638 ) ( ON ?auto_803636 ?auto_803637 ) ( ON ?auto_803635 ?auto_803636 ) ( CLEAR ?auto_803633 ) ( ON ?auto_803634 ?auto_803635 ) ( CLEAR ?auto_803634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_803627 ?auto_803628 ?auto_803629 ?auto_803630 ?auto_803631 ?auto_803632 ?auto_803633 ?auto_803634 )
      ( MAKE-12PILE ?auto_803627 ?auto_803628 ?auto_803629 ?auto_803630 ?auto_803631 ?auto_803632 ?auto_803633 ?auto_803634 ?auto_803635 ?auto_803636 ?auto_803637 ?auto_803638 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803677 - BLOCK
      ?auto_803678 - BLOCK
      ?auto_803679 - BLOCK
      ?auto_803680 - BLOCK
      ?auto_803681 - BLOCK
      ?auto_803682 - BLOCK
      ?auto_803683 - BLOCK
      ?auto_803684 - BLOCK
      ?auto_803685 - BLOCK
      ?auto_803686 - BLOCK
      ?auto_803687 - BLOCK
      ?auto_803688 - BLOCK
    )
    :vars
    (
      ?auto_803689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803688 ?auto_803689 ) ( ON-TABLE ?auto_803677 ) ( ON ?auto_803678 ?auto_803677 ) ( ON ?auto_803679 ?auto_803678 ) ( ON ?auto_803680 ?auto_803679 ) ( ON ?auto_803681 ?auto_803680 ) ( ON ?auto_803682 ?auto_803681 ) ( not ( = ?auto_803677 ?auto_803678 ) ) ( not ( = ?auto_803677 ?auto_803679 ) ) ( not ( = ?auto_803677 ?auto_803680 ) ) ( not ( = ?auto_803677 ?auto_803681 ) ) ( not ( = ?auto_803677 ?auto_803682 ) ) ( not ( = ?auto_803677 ?auto_803683 ) ) ( not ( = ?auto_803677 ?auto_803684 ) ) ( not ( = ?auto_803677 ?auto_803685 ) ) ( not ( = ?auto_803677 ?auto_803686 ) ) ( not ( = ?auto_803677 ?auto_803687 ) ) ( not ( = ?auto_803677 ?auto_803688 ) ) ( not ( = ?auto_803677 ?auto_803689 ) ) ( not ( = ?auto_803678 ?auto_803679 ) ) ( not ( = ?auto_803678 ?auto_803680 ) ) ( not ( = ?auto_803678 ?auto_803681 ) ) ( not ( = ?auto_803678 ?auto_803682 ) ) ( not ( = ?auto_803678 ?auto_803683 ) ) ( not ( = ?auto_803678 ?auto_803684 ) ) ( not ( = ?auto_803678 ?auto_803685 ) ) ( not ( = ?auto_803678 ?auto_803686 ) ) ( not ( = ?auto_803678 ?auto_803687 ) ) ( not ( = ?auto_803678 ?auto_803688 ) ) ( not ( = ?auto_803678 ?auto_803689 ) ) ( not ( = ?auto_803679 ?auto_803680 ) ) ( not ( = ?auto_803679 ?auto_803681 ) ) ( not ( = ?auto_803679 ?auto_803682 ) ) ( not ( = ?auto_803679 ?auto_803683 ) ) ( not ( = ?auto_803679 ?auto_803684 ) ) ( not ( = ?auto_803679 ?auto_803685 ) ) ( not ( = ?auto_803679 ?auto_803686 ) ) ( not ( = ?auto_803679 ?auto_803687 ) ) ( not ( = ?auto_803679 ?auto_803688 ) ) ( not ( = ?auto_803679 ?auto_803689 ) ) ( not ( = ?auto_803680 ?auto_803681 ) ) ( not ( = ?auto_803680 ?auto_803682 ) ) ( not ( = ?auto_803680 ?auto_803683 ) ) ( not ( = ?auto_803680 ?auto_803684 ) ) ( not ( = ?auto_803680 ?auto_803685 ) ) ( not ( = ?auto_803680 ?auto_803686 ) ) ( not ( = ?auto_803680 ?auto_803687 ) ) ( not ( = ?auto_803680 ?auto_803688 ) ) ( not ( = ?auto_803680 ?auto_803689 ) ) ( not ( = ?auto_803681 ?auto_803682 ) ) ( not ( = ?auto_803681 ?auto_803683 ) ) ( not ( = ?auto_803681 ?auto_803684 ) ) ( not ( = ?auto_803681 ?auto_803685 ) ) ( not ( = ?auto_803681 ?auto_803686 ) ) ( not ( = ?auto_803681 ?auto_803687 ) ) ( not ( = ?auto_803681 ?auto_803688 ) ) ( not ( = ?auto_803681 ?auto_803689 ) ) ( not ( = ?auto_803682 ?auto_803683 ) ) ( not ( = ?auto_803682 ?auto_803684 ) ) ( not ( = ?auto_803682 ?auto_803685 ) ) ( not ( = ?auto_803682 ?auto_803686 ) ) ( not ( = ?auto_803682 ?auto_803687 ) ) ( not ( = ?auto_803682 ?auto_803688 ) ) ( not ( = ?auto_803682 ?auto_803689 ) ) ( not ( = ?auto_803683 ?auto_803684 ) ) ( not ( = ?auto_803683 ?auto_803685 ) ) ( not ( = ?auto_803683 ?auto_803686 ) ) ( not ( = ?auto_803683 ?auto_803687 ) ) ( not ( = ?auto_803683 ?auto_803688 ) ) ( not ( = ?auto_803683 ?auto_803689 ) ) ( not ( = ?auto_803684 ?auto_803685 ) ) ( not ( = ?auto_803684 ?auto_803686 ) ) ( not ( = ?auto_803684 ?auto_803687 ) ) ( not ( = ?auto_803684 ?auto_803688 ) ) ( not ( = ?auto_803684 ?auto_803689 ) ) ( not ( = ?auto_803685 ?auto_803686 ) ) ( not ( = ?auto_803685 ?auto_803687 ) ) ( not ( = ?auto_803685 ?auto_803688 ) ) ( not ( = ?auto_803685 ?auto_803689 ) ) ( not ( = ?auto_803686 ?auto_803687 ) ) ( not ( = ?auto_803686 ?auto_803688 ) ) ( not ( = ?auto_803686 ?auto_803689 ) ) ( not ( = ?auto_803687 ?auto_803688 ) ) ( not ( = ?auto_803687 ?auto_803689 ) ) ( not ( = ?auto_803688 ?auto_803689 ) ) ( ON ?auto_803687 ?auto_803688 ) ( ON ?auto_803686 ?auto_803687 ) ( ON ?auto_803685 ?auto_803686 ) ( ON ?auto_803684 ?auto_803685 ) ( CLEAR ?auto_803682 ) ( ON ?auto_803683 ?auto_803684 ) ( CLEAR ?auto_803683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_803677 ?auto_803678 ?auto_803679 ?auto_803680 ?auto_803681 ?auto_803682 ?auto_803683 )
      ( MAKE-12PILE ?auto_803677 ?auto_803678 ?auto_803679 ?auto_803680 ?auto_803681 ?auto_803682 ?auto_803683 ?auto_803684 ?auto_803685 ?auto_803686 ?auto_803687 ?auto_803688 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803727 - BLOCK
      ?auto_803728 - BLOCK
      ?auto_803729 - BLOCK
      ?auto_803730 - BLOCK
      ?auto_803731 - BLOCK
      ?auto_803732 - BLOCK
      ?auto_803733 - BLOCK
      ?auto_803734 - BLOCK
      ?auto_803735 - BLOCK
      ?auto_803736 - BLOCK
      ?auto_803737 - BLOCK
      ?auto_803738 - BLOCK
    )
    :vars
    (
      ?auto_803739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803738 ?auto_803739 ) ( ON-TABLE ?auto_803727 ) ( ON ?auto_803728 ?auto_803727 ) ( ON ?auto_803729 ?auto_803728 ) ( ON ?auto_803730 ?auto_803729 ) ( ON ?auto_803731 ?auto_803730 ) ( not ( = ?auto_803727 ?auto_803728 ) ) ( not ( = ?auto_803727 ?auto_803729 ) ) ( not ( = ?auto_803727 ?auto_803730 ) ) ( not ( = ?auto_803727 ?auto_803731 ) ) ( not ( = ?auto_803727 ?auto_803732 ) ) ( not ( = ?auto_803727 ?auto_803733 ) ) ( not ( = ?auto_803727 ?auto_803734 ) ) ( not ( = ?auto_803727 ?auto_803735 ) ) ( not ( = ?auto_803727 ?auto_803736 ) ) ( not ( = ?auto_803727 ?auto_803737 ) ) ( not ( = ?auto_803727 ?auto_803738 ) ) ( not ( = ?auto_803727 ?auto_803739 ) ) ( not ( = ?auto_803728 ?auto_803729 ) ) ( not ( = ?auto_803728 ?auto_803730 ) ) ( not ( = ?auto_803728 ?auto_803731 ) ) ( not ( = ?auto_803728 ?auto_803732 ) ) ( not ( = ?auto_803728 ?auto_803733 ) ) ( not ( = ?auto_803728 ?auto_803734 ) ) ( not ( = ?auto_803728 ?auto_803735 ) ) ( not ( = ?auto_803728 ?auto_803736 ) ) ( not ( = ?auto_803728 ?auto_803737 ) ) ( not ( = ?auto_803728 ?auto_803738 ) ) ( not ( = ?auto_803728 ?auto_803739 ) ) ( not ( = ?auto_803729 ?auto_803730 ) ) ( not ( = ?auto_803729 ?auto_803731 ) ) ( not ( = ?auto_803729 ?auto_803732 ) ) ( not ( = ?auto_803729 ?auto_803733 ) ) ( not ( = ?auto_803729 ?auto_803734 ) ) ( not ( = ?auto_803729 ?auto_803735 ) ) ( not ( = ?auto_803729 ?auto_803736 ) ) ( not ( = ?auto_803729 ?auto_803737 ) ) ( not ( = ?auto_803729 ?auto_803738 ) ) ( not ( = ?auto_803729 ?auto_803739 ) ) ( not ( = ?auto_803730 ?auto_803731 ) ) ( not ( = ?auto_803730 ?auto_803732 ) ) ( not ( = ?auto_803730 ?auto_803733 ) ) ( not ( = ?auto_803730 ?auto_803734 ) ) ( not ( = ?auto_803730 ?auto_803735 ) ) ( not ( = ?auto_803730 ?auto_803736 ) ) ( not ( = ?auto_803730 ?auto_803737 ) ) ( not ( = ?auto_803730 ?auto_803738 ) ) ( not ( = ?auto_803730 ?auto_803739 ) ) ( not ( = ?auto_803731 ?auto_803732 ) ) ( not ( = ?auto_803731 ?auto_803733 ) ) ( not ( = ?auto_803731 ?auto_803734 ) ) ( not ( = ?auto_803731 ?auto_803735 ) ) ( not ( = ?auto_803731 ?auto_803736 ) ) ( not ( = ?auto_803731 ?auto_803737 ) ) ( not ( = ?auto_803731 ?auto_803738 ) ) ( not ( = ?auto_803731 ?auto_803739 ) ) ( not ( = ?auto_803732 ?auto_803733 ) ) ( not ( = ?auto_803732 ?auto_803734 ) ) ( not ( = ?auto_803732 ?auto_803735 ) ) ( not ( = ?auto_803732 ?auto_803736 ) ) ( not ( = ?auto_803732 ?auto_803737 ) ) ( not ( = ?auto_803732 ?auto_803738 ) ) ( not ( = ?auto_803732 ?auto_803739 ) ) ( not ( = ?auto_803733 ?auto_803734 ) ) ( not ( = ?auto_803733 ?auto_803735 ) ) ( not ( = ?auto_803733 ?auto_803736 ) ) ( not ( = ?auto_803733 ?auto_803737 ) ) ( not ( = ?auto_803733 ?auto_803738 ) ) ( not ( = ?auto_803733 ?auto_803739 ) ) ( not ( = ?auto_803734 ?auto_803735 ) ) ( not ( = ?auto_803734 ?auto_803736 ) ) ( not ( = ?auto_803734 ?auto_803737 ) ) ( not ( = ?auto_803734 ?auto_803738 ) ) ( not ( = ?auto_803734 ?auto_803739 ) ) ( not ( = ?auto_803735 ?auto_803736 ) ) ( not ( = ?auto_803735 ?auto_803737 ) ) ( not ( = ?auto_803735 ?auto_803738 ) ) ( not ( = ?auto_803735 ?auto_803739 ) ) ( not ( = ?auto_803736 ?auto_803737 ) ) ( not ( = ?auto_803736 ?auto_803738 ) ) ( not ( = ?auto_803736 ?auto_803739 ) ) ( not ( = ?auto_803737 ?auto_803738 ) ) ( not ( = ?auto_803737 ?auto_803739 ) ) ( not ( = ?auto_803738 ?auto_803739 ) ) ( ON ?auto_803737 ?auto_803738 ) ( ON ?auto_803736 ?auto_803737 ) ( ON ?auto_803735 ?auto_803736 ) ( ON ?auto_803734 ?auto_803735 ) ( ON ?auto_803733 ?auto_803734 ) ( CLEAR ?auto_803731 ) ( ON ?auto_803732 ?auto_803733 ) ( CLEAR ?auto_803732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_803727 ?auto_803728 ?auto_803729 ?auto_803730 ?auto_803731 ?auto_803732 )
      ( MAKE-12PILE ?auto_803727 ?auto_803728 ?auto_803729 ?auto_803730 ?auto_803731 ?auto_803732 ?auto_803733 ?auto_803734 ?auto_803735 ?auto_803736 ?auto_803737 ?auto_803738 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803777 - BLOCK
      ?auto_803778 - BLOCK
      ?auto_803779 - BLOCK
      ?auto_803780 - BLOCK
      ?auto_803781 - BLOCK
      ?auto_803782 - BLOCK
      ?auto_803783 - BLOCK
      ?auto_803784 - BLOCK
      ?auto_803785 - BLOCK
      ?auto_803786 - BLOCK
      ?auto_803787 - BLOCK
      ?auto_803788 - BLOCK
    )
    :vars
    (
      ?auto_803789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803788 ?auto_803789 ) ( ON-TABLE ?auto_803777 ) ( ON ?auto_803778 ?auto_803777 ) ( ON ?auto_803779 ?auto_803778 ) ( ON ?auto_803780 ?auto_803779 ) ( not ( = ?auto_803777 ?auto_803778 ) ) ( not ( = ?auto_803777 ?auto_803779 ) ) ( not ( = ?auto_803777 ?auto_803780 ) ) ( not ( = ?auto_803777 ?auto_803781 ) ) ( not ( = ?auto_803777 ?auto_803782 ) ) ( not ( = ?auto_803777 ?auto_803783 ) ) ( not ( = ?auto_803777 ?auto_803784 ) ) ( not ( = ?auto_803777 ?auto_803785 ) ) ( not ( = ?auto_803777 ?auto_803786 ) ) ( not ( = ?auto_803777 ?auto_803787 ) ) ( not ( = ?auto_803777 ?auto_803788 ) ) ( not ( = ?auto_803777 ?auto_803789 ) ) ( not ( = ?auto_803778 ?auto_803779 ) ) ( not ( = ?auto_803778 ?auto_803780 ) ) ( not ( = ?auto_803778 ?auto_803781 ) ) ( not ( = ?auto_803778 ?auto_803782 ) ) ( not ( = ?auto_803778 ?auto_803783 ) ) ( not ( = ?auto_803778 ?auto_803784 ) ) ( not ( = ?auto_803778 ?auto_803785 ) ) ( not ( = ?auto_803778 ?auto_803786 ) ) ( not ( = ?auto_803778 ?auto_803787 ) ) ( not ( = ?auto_803778 ?auto_803788 ) ) ( not ( = ?auto_803778 ?auto_803789 ) ) ( not ( = ?auto_803779 ?auto_803780 ) ) ( not ( = ?auto_803779 ?auto_803781 ) ) ( not ( = ?auto_803779 ?auto_803782 ) ) ( not ( = ?auto_803779 ?auto_803783 ) ) ( not ( = ?auto_803779 ?auto_803784 ) ) ( not ( = ?auto_803779 ?auto_803785 ) ) ( not ( = ?auto_803779 ?auto_803786 ) ) ( not ( = ?auto_803779 ?auto_803787 ) ) ( not ( = ?auto_803779 ?auto_803788 ) ) ( not ( = ?auto_803779 ?auto_803789 ) ) ( not ( = ?auto_803780 ?auto_803781 ) ) ( not ( = ?auto_803780 ?auto_803782 ) ) ( not ( = ?auto_803780 ?auto_803783 ) ) ( not ( = ?auto_803780 ?auto_803784 ) ) ( not ( = ?auto_803780 ?auto_803785 ) ) ( not ( = ?auto_803780 ?auto_803786 ) ) ( not ( = ?auto_803780 ?auto_803787 ) ) ( not ( = ?auto_803780 ?auto_803788 ) ) ( not ( = ?auto_803780 ?auto_803789 ) ) ( not ( = ?auto_803781 ?auto_803782 ) ) ( not ( = ?auto_803781 ?auto_803783 ) ) ( not ( = ?auto_803781 ?auto_803784 ) ) ( not ( = ?auto_803781 ?auto_803785 ) ) ( not ( = ?auto_803781 ?auto_803786 ) ) ( not ( = ?auto_803781 ?auto_803787 ) ) ( not ( = ?auto_803781 ?auto_803788 ) ) ( not ( = ?auto_803781 ?auto_803789 ) ) ( not ( = ?auto_803782 ?auto_803783 ) ) ( not ( = ?auto_803782 ?auto_803784 ) ) ( not ( = ?auto_803782 ?auto_803785 ) ) ( not ( = ?auto_803782 ?auto_803786 ) ) ( not ( = ?auto_803782 ?auto_803787 ) ) ( not ( = ?auto_803782 ?auto_803788 ) ) ( not ( = ?auto_803782 ?auto_803789 ) ) ( not ( = ?auto_803783 ?auto_803784 ) ) ( not ( = ?auto_803783 ?auto_803785 ) ) ( not ( = ?auto_803783 ?auto_803786 ) ) ( not ( = ?auto_803783 ?auto_803787 ) ) ( not ( = ?auto_803783 ?auto_803788 ) ) ( not ( = ?auto_803783 ?auto_803789 ) ) ( not ( = ?auto_803784 ?auto_803785 ) ) ( not ( = ?auto_803784 ?auto_803786 ) ) ( not ( = ?auto_803784 ?auto_803787 ) ) ( not ( = ?auto_803784 ?auto_803788 ) ) ( not ( = ?auto_803784 ?auto_803789 ) ) ( not ( = ?auto_803785 ?auto_803786 ) ) ( not ( = ?auto_803785 ?auto_803787 ) ) ( not ( = ?auto_803785 ?auto_803788 ) ) ( not ( = ?auto_803785 ?auto_803789 ) ) ( not ( = ?auto_803786 ?auto_803787 ) ) ( not ( = ?auto_803786 ?auto_803788 ) ) ( not ( = ?auto_803786 ?auto_803789 ) ) ( not ( = ?auto_803787 ?auto_803788 ) ) ( not ( = ?auto_803787 ?auto_803789 ) ) ( not ( = ?auto_803788 ?auto_803789 ) ) ( ON ?auto_803787 ?auto_803788 ) ( ON ?auto_803786 ?auto_803787 ) ( ON ?auto_803785 ?auto_803786 ) ( ON ?auto_803784 ?auto_803785 ) ( ON ?auto_803783 ?auto_803784 ) ( ON ?auto_803782 ?auto_803783 ) ( CLEAR ?auto_803780 ) ( ON ?auto_803781 ?auto_803782 ) ( CLEAR ?auto_803781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_803777 ?auto_803778 ?auto_803779 ?auto_803780 ?auto_803781 )
      ( MAKE-12PILE ?auto_803777 ?auto_803778 ?auto_803779 ?auto_803780 ?auto_803781 ?auto_803782 ?auto_803783 ?auto_803784 ?auto_803785 ?auto_803786 ?auto_803787 ?auto_803788 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803827 - BLOCK
      ?auto_803828 - BLOCK
      ?auto_803829 - BLOCK
      ?auto_803830 - BLOCK
      ?auto_803831 - BLOCK
      ?auto_803832 - BLOCK
      ?auto_803833 - BLOCK
      ?auto_803834 - BLOCK
      ?auto_803835 - BLOCK
      ?auto_803836 - BLOCK
      ?auto_803837 - BLOCK
      ?auto_803838 - BLOCK
    )
    :vars
    (
      ?auto_803839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803838 ?auto_803839 ) ( ON-TABLE ?auto_803827 ) ( ON ?auto_803828 ?auto_803827 ) ( ON ?auto_803829 ?auto_803828 ) ( not ( = ?auto_803827 ?auto_803828 ) ) ( not ( = ?auto_803827 ?auto_803829 ) ) ( not ( = ?auto_803827 ?auto_803830 ) ) ( not ( = ?auto_803827 ?auto_803831 ) ) ( not ( = ?auto_803827 ?auto_803832 ) ) ( not ( = ?auto_803827 ?auto_803833 ) ) ( not ( = ?auto_803827 ?auto_803834 ) ) ( not ( = ?auto_803827 ?auto_803835 ) ) ( not ( = ?auto_803827 ?auto_803836 ) ) ( not ( = ?auto_803827 ?auto_803837 ) ) ( not ( = ?auto_803827 ?auto_803838 ) ) ( not ( = ?auto_803827 ?auto_803839 ) ) ( not ( = ?auto_803828 ?auto_803829 ) ) ( not ( = ?auto_803828 ?auto_803830 ) ) ( not ( = ?auto_803828 ?auto_803831 ) ) ( not ( = ?auto_803828 ?auto_803832 ) ) ( not ( = ?auto_803828 ?auto_803833 ) ) ( not ( = ?auto_803828 ?auto_803834 ) ) ( not ( = ?auto_803828 ?auto_803835 ) ) ( not ( = ?auto_803828 ?auto_803836 ) ) ( not ( = ?auto_803828 ?auto_803837 ) ) ( not ( = ?auto_803828 ?auto_803838 ) ) ( not ( = ?auto_803828 ?auto_803839 ) ) ( not ( = ?auto_803829 ?auto_803830 ) ) ( not ( = ?auto_803829 ?auto_803831 ) ) ( not ( = ?auto_803829 ?auto_803832 ) ) ( not ( = ?auto_803829 ?auto_803833 ) ) ( not ( = ?auto_803829 ?auto_803834 ) ) ( not ( = ?auto_803829 ?auto_803835 ) ) ( not ( = ?auto_803829 ?auto_803836 ) ) ( not ( = ?auto_803829 ?auto_803837 ) ) ( not ( = ?auto_803829 ?auto_803838 ) ) ( not ( = ?auto_803829 ?auto_803839 ) ) ( not ( = ?auto_803830 ?auto_803831 ) ) ( not ( = ?auto_803830 ?auto_803832 ) ) ( not ( = ?auto_803830 ?auto_803833 ) ) ( not ( = ?auto_803830 ?auto_803834 ) ) ( not ( = ?auto_803830 ?auto_803835 ) ) ( not ( = ?auto_803830 ?auto_803836 ) ) ( not ( = ?auto_803830 ?auto_803837 ) ) ( not ( = ?auto_803830 ?auto_803838 ) ) ( not ( = ?auto_803830 ?auto_803839 ) ) ( not ( = ?auto_803831 ?auto_803832 ) ) ( not ( = ?auto_803831 ?auto_803833 ) ) ( not ( = ?auto_803831 ?auto_803834 ) ) ( not ( = ?auto_803831 ?auto_803835 ) ) ( not ( = ?auto_803831 ?auto_803836 ) ) ( not ( = ?auto_803831 ?auto_803837 ) ) ( not ( = ?auto_803831 ?auto_803838 ) ) ( not ( = ?auto_803831 ?auto_803839 ) ) ( not ( = ?auto_803832 ?auto_803833 ) ) ( not ( = ?auto_803832 ?auto_803834 ) ) ( not ( = ?auto_803832 ?auto_803835 ) ) ( not ( = ?auto_803832 ?auto_803836 ) ) ( not ( = ?auto_803832 ?auto_803837 ) ) ( not ( = ?auto_803832 ?auto_803838 ) ) ( not ( = ?auto_803832 ?auto_803839 ) ) ( not ( = ?auto_803833 ?auto_803834 ) ) ( not ( = ?auto_803833 ?auto_803835 ) ) ( not ( = ?auto_803833 ?auto_803836 ) ) ( not ( = ?auto_803833 ?auto_803837 ) ) ( not ( = ?auto_803833 ?auto_803838 ) ) ( not ( = ?auto_803833 ?auto_803839 ) ) ( not ( = ?auto_803834 ?auto_803835 ) ) ( not ( = ?auto_803834 ?auto_803836 ) ) ( not ( = ?auto_803834 ?auto_803837 ) ) ( not ( = ?auto_803834 ?auto_803838 ) ) ( not ( = ?auto_803834 ?auto_803839 ) ) ( not ( = ?auto_803835 ?auto_803836 ) ) ( not ( = ?auto_803835 ?auto_803837 ) ) ( not ( = ?auto_803835 ?auto_803838 ) ) ( not ( = ?auto_803835 ?auto_803839 ) ) ( not ( = ?auto_803836 ?auto_803837 ) ) ( not ( = ?auto_803836 ?auto_803838 ) ) ( not ( = ?auto_803836 ?auto_803839 ) ) ( not ( = ?auto_803837 ?auto_803838 ) ) ( not ( = ?auto_803837 ?auto_803839 ) ) ( not ( = ?auto_803838 ?auto_803839 ) ) ( ON ?auto_803837 ?auto_803838 ) ( ON ?auto_803836 ?auto_803837 ) ( ON ?auto_803835 ?auto_803836 ) ( ON ?auto_803834 ?auto_803835 ) ( ON ?auto_803833 ?auto_803834 ) ( ON ?auto_803832 ?auto_803833 ) ( ON ?auto_803831 ?auto_803832 ) ( CLEAR ?auto_803829 ) ( ON ?auto_803830 ?auto_803831 ) ( CLEAR ?auto_803830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_803827 ?auto_803828 ?auto_803829 ?auto_803830 )
      ( MAKE-12PILE ?auto_803827 ?auto_803828 ?auto_803829 ?auto_803830 ?auto_803831 ?auto_803832 ?auto_803833 ?auto_803834 ?auto_803835 ?auto_803836 ?auto_803837 ?auto_803838 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803877 - BLOCK
      ?auto_803878 - BLOCK
      ?auto_803879 - BLOCK
      ?auto_803880 - BLOCK
      ?auto_803881 - BLOCK
      ?auto_803882 - BLOCK
      ?auto_803883 - BLOCK
      ?auto_803884 - BLOCK
      ?auto_803885 - BLOCK
      ?auto_803886 - BLOCK
      ?auto_803887 - BLOCK
      ?auto_803888 - BLOCK
    )
    :vars
    (
      ?auto_803889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803888 ?auto_803889 ) ( ON-TABLE ?auto_803877 ) ( ON ?auto_803878 ?auto_803877 ) ( not ( = ?auto_803877 ?auto_803878 ) ) ( not ( = ?auto_803877 ?auto_803879 ) ) ( not ( = ?auto_803877 ?auto_803880 ) ) ( not ( = ?auto_803877 ?auto_803881 ) ) ( not ( = ?auto_803877 ?auto_803882 ) ) ( not ( = ?auto_803877 ?auto_803883 ) ) ( not ( = ?auto_803877 ?auto_803884 ) ) ( not ( = ?auto_803877 ?auto_803885 ) ) ( not ( = ?auto_803877 ?auto_803886 ) ) ( not ( = ?auto_803877 ?auto_803887 ) ) ( not ( = ?auto_803877 ?auto_803888 ) ) ( not ( = ?auto_803877 ?auto_803889 ) ) ( not ( = ?auto_803878 ?auto_803879 ) ) ( not ( = ?auto_803878 ?auto_803880 ) ) ( not ( = ?auto_803878 ?auto_803881 ) ) ( not ( = ?auto_803878 ?auto_803882 ) ) ( not ( = ?auto_803878 ?auto_803883 ) ) ( not ( = ?auto_803878 ?auto_803884 ) ) ( not ( = ?auto_803878 ?auto_803885 ) ) ( not ( = ?auto_803878 ?auto_803886 ) ) ( not ( = ?auto_803878 ?auto_803887 ) ) ( not ( = ?auto_803878 ?auto_803888 ) ) ( not ( = ?auto_803878 ?auto_803889 ) ) ( not ( = ?auto_803879 ?auto_803880 ) ) ( not ( = ?auto_803879 ?auto_803881 ) ) ( not ( = ?auto_803879 ?auto_803882 ) ) ( not ( = ?auto_803879 ?auto_803883 ) ) ( not ( = ?auto_803879 ?auto_803884 ) ) ( not ( = ?auto_803879 ?auto_803885 ) ) ( not ( = ?auto_803879 ?auto_803886 ) ) ( not ( = ?auto_803879 ?auto_803887 ) ) ( not ( = ?auto_803879 ?auto_803888 ) ) ( not ( = ?auto_803879 ?auto_803889 ) ) ( not ( = ?auto_803880 ?auto_803881 ) ) ( not ( = ?auto_803880 ?auto_803882 ) ) ( not ( = ?auto_803880 ?auto_803883 ) ) ( not ( = ?auto_803880 ?auto_803884 ) ) ( not ( = ?auto_803880 ?auto_803885 ) ) ( not ( = ?auto_803880 ?auto_803886 ) ) ( not ( = ?auto_803880 ?auto_803887 ) ) ( not ( = ?auto_803880 ?auto_803888 ) ) ( not ( = ?auto_803880 ?auto_803889 ) ) ( not ( = ?auto_803881 ?auto_803882 ) ) ( not ( = ?auto_803881 ?auto_803883 ) ) ( not ( = ?auto_803881 ?auto_803884 ) ) ( not ( = ?auto_803881 ?auto_803885 ) ) ( not ( = ?auto_803881 ?auto_803886 ) ) ( not ( = ?auto_803881 ?auto_803887 ) ) ( not ( = ?auto_803881 ?auto_803888 ) ) ( not ( = ?auto_803881 ?auto_803889 ) ) ( not ( = ?auto_803882 ?auto_803883 ) ) ( not ( = ?auto_803882 ?auto_803884 ) ) ( not ( = ?auto_803882 ?auto_803885 ) ) ( not ( = ?auto_803882 ?auto_803886 ) ) ( not ( = ?auto_803882 ?auto_803887 ) ) ( not ( = ?auto_803882 ?auto_803888 ) ) ( not ( = ?auto_803882 ?auto_803889 ) ) ( not ( = ?auto_803883 ?auto_803884 ) ) ( not ( = ?auto_803883 ?auto_803885 ) ) ( not ( = ?auto_803883 ?auto_803886 ) ) ( not ( = ?auto_803883 ?auto_803887 ) ) ( not ( = ?auto_803883 ?auto_803888 ) ) ( not ( = ?auto_803883 ?auto_803889 ) ) ( not ( = ?auto_803884 ?auto_803885 ) ) ( not ( = ?auto_803884 ?auto_803886 ) ) ( not ( = ?auto_803884 ?auto_803887 ) ) ( not ( = ?auto_803884 ?auto_803888 ) ) ( not ( = ?auto_803884 ?auto_803889 ) ) ( not ( = ?auto_803885 ?auto_803886 ) ) ( not ( = ?auto_803885 ?auto_803887 ) ) ( not ( = ?auto_803885 ?auto_803888 ) ) ( not ( = ?auto_803885 ?auto_803889 ) ) ( not ( = ?auto_803886 ?auto_803887 ) ) ( not ( = ?auto_803886 ?auto_803888 ) ) ( not ( = ?auto_803886 ?auto_803889 ) ) ( not ( = ?auto_803887 ?auto_803888 ) ) ( not ( = ?auto_803887 ?auto_803889 ) ) ( not ( = ?auto_803888 ?auto_803889 ) ) ( ON ?auto_803887 ?auto_803888 ) ( ON ?auto_803886 ?auto_803887 ) ( ON ?auto_803885 ?auto_803886 ) ( ON ?auto_803884 ?auto_803885 ) ( ON ?auto_803883 ?auto_803884 ) ( ON ?auto_803882 ?auto_803883 ) ( ON ?auto_803881 ?auto_803882 ) ( ON ?auto_803880 ?auto_803881 ) ( CLEAR ?auto_803878 ) ( ON ?auto_803879 ?auto_803880 ) ( CLEAR ?auto_803879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_803877 ?auto_803878 ?auto_803879 )
      ( MAKE-12PILE ?auto_803877 ?auto_803878 ?auto_803879 ?auto_803880 ?auto_803881 ?auto_803882 ?auto_803883 ?auto_803884 ?auto_803885 ?auto_803886 ?auto_803887 ?auto_803888 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803927 - BLOCK
      ?auto_803928 - BLOCK
      ?auto_803929 - BLOCK
      ?auto_803930 - BLOCK
      ?auto_803931 - BLOCK
      ?auto_803932 - BLOCK
      ?auto_803933 - BLOCK
      ?auto_803934 - BLOCK
      ?auto_803935 - BLOCK
      ?auto_803936 - BLOCK
      ?auto_803937 - BLOCK
      ?auto_803938 - BLOCK
    )
    :vars
    (
      ?auto_803939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803938 ?auto_803939 ) ( ON-TABLE ?auto_803927 ) ( not ( = ?auto_803927 ?auto_803928 ) ) ( not ( = ?auto_803927 ?auto_803929 ) ) ( not ( = ?auto_803927 ?auto_803930 ) ) ( not ( = ?auto_803927 ?auto_803931 ) ) ( not ( = ?auto_803927 ?auto_803932 ) ) ( not ( = ?auto_803927 ?auto_803933 ) ) ( not ( = ?auto_803927 ?auto_803934 ) ) ( not ( = ?auto_803927 ?auto_803935 ) ) ( not ( = ?auto_803927 ?auto_803936 ) ) ( not ( = ?auto_803927 ?auto_803937 ) ) ( not ( = ?auto_803927 ?auto_803938 ) ) ( not ( = ?auto_803927 ?auto_803939 ) ) ( not ( = ?auto_803928 ?auto_803929 ) ) ( not ( = ?auto_803928 ?auto_803930 ) ) ( not ( = ?auto_803928 ?auto_803931 ) ) ( not ( = ?auto_803928 ?auto_803932 ) ) ( not ( = ?auto_803928 ?auto_803933 ) ) ( not ( = ?auto_803928 ?auto_803934 ) ) ( not ( = ?auto_803928 ?auto_803935 ) ) ( not ( = ?auto_803928 ?auto_803936 ) ) ( not ( = ?auto_803928 ?auto_803937 ) ) ( not ( = ?auto_803928 ?auto_803938 ) ) ( not ( = ?auto_803928 ?auto_803939 ) ) ( not ( = ?auto_803929 ?auto_803930 ) ) ( not ( = ?auto_803929 ?auto_803931 ) ) ( not ( = ?auto_803929 ?auto_803932 ) ) ( not ( = ?auto_803929 ?auto_803933 ) ) ( not ( = ?auto_803929 ?auto_803934 ) ) ( not ( = ?auto_803929 ?auto_803935 ) ) ( not ( = ?auto_803929 ?auto_803936 ) ) ( not ( = ?auto_803929 ?auto_803937 ) ) ( not ( = ?auto_803929 ?auto_803938 ) ) ( not ( = ?auto_803929 ?auto_803939 ) ) ( not ( = ?auto_803930 ?auto_803931 ) ) ( not ( = ?auto_803930 ?auto_803932 ) ) ( not ( = ?auto_803930 ?auto_803933 ) ) ( not ( = ?auto_803930 ?auto_803934 ) ) ( not ( = ?auto_803930 ?auto_803935 ) ) ( not ( = ?auto_803930 ?auto_803936 ) ) ( not ( = ?auto_803930 ?auto_803937 ) ) ( not ( = ?auto_803930 ?auto_803938 ) ) ( not ( = ?auto_803930 ?auto_803939 ) ) ( not ( = ?auto_803931 ?auto_803932 ) ) ( not ( = ?auto_803931 ?auto_803933 ) ) ( not ( = ?auto_803931 ?auto_803934 ) ) ( not ( = ?auto_803931 ?auto_803935 ) ) ( not ( = ?auto_803931 ?auto_803936 ) ) ( not ( = ?auto_803931 ?auto_803937 ) ) ( not ( = ?auto_803931 ?auto_803938 ) ) ( not ( = ?auto_803931 ?auto_803939 ) ) ( not ( = ?auto_803932 ?auto_803933 ) ) ( not ( = ?auto_803932 ?auto_803934 ) ) ( not ( = ?auto_803932 ?auto_803935 ) ) ( not ( = ?auto_803932 ?auto_803936 ) ) ( not ( = ?auto_803932 ?auto_803937 ) ) ( not ( = ?auto_803932 ?auto_803938 ) ) ( not ( = ?auto_803932 ?auto_803939 ) ) ( not ( = ?auto_803933 ?auto_803934 ) ) ( not ( = ?auto_803933 ?auto_803935 ) ) ( not ( = ?auto_803933 ?auto_803936 ) ) ( not ( = ?auto_803933 ?auto_803937 ) ) ( not ( = ?auto_803933 ?auto_803938 ) ) ( not ( = ?auto_803933 ?auto_803939 ) ) ( not ( = ?auto_803934 ?auto_803935 ) ) ( not ( = ?auto_803934 ?auto_803936 ) ) ( not ( = ?auto_803934 ?auto_803937 ) ) ( not ( = ?auto_803934 ?auto_803938 ) ) ( not ( = ?auto_803934 ?auto_803939 ) ) ( not ( = ?auto_803935 ?auto_803936 ) ) ( not ( = ?auto_803935 ?auto_803937 ) ) ( not ( = ?auto_803935 ?auto_803938 ) ) ( not ( = ?auto_803935 ?auto_803939 ) ) ( not ( = ?auto_803936 ?auto_803937 ) ) ( not ( = ?auto_803936 ?auto_803938 ) ) ( not ( = ?auto_803936 ?auto_803939 ) ) ( not ( = ?auto_803937 ?auto_803938 ) ) ( not ( = ?auto_803937 ?auto_803939 ) ) ( not ( = ?auto_803938 ?auto_803939 ) ) ( ON ?auto_803937 ?auto_803938 ) ( ON ?auto_803936 ?auto_803937 ) ( ON ?auto_803935 ?auto_803936 ) ( ON ?auto_803934 ?auto_803935 ) ( ON ?auto_803933 ?auto_803934 ) ( ON ?auto_803932 ?auto_803933 ) ( ON ?auto_803931 ?auto_803932 ) ( ON ?auto_803930 ?auto_803931 ) ( ON ?auto_803929 ?auto_803930 ) ( CLEAR ?auto_803927 ) ( ON ?auto_803928 ?auto_803929 ) ( CLEAR ?auto_803928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_803927 ?auto_803928 )
      ( MAKE-12PILE ?auto_803927 ?auto_803928 ?auto_803929 ?auto_803930 ?auto_803931 ?auto_803932 ?auto_803933 ?auto_803934 ?auto_803935 ?auto_803936 ?auto_803937 ?auto_803938 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_803977 - BLOCK
      ?auto_803978 - BLOCK
      ?auto_803979 - BLOCK
      ?auto_803980 - BLOCK
      ?auto_803981 - BLOCK
      ?auto_803982 - BLOCK
      ?auto_803983 - BLOCK
      ?auto_803984 - BLOCK
      ?auto_803985 - BLOCK
      ?auto_803986 - BLOCK
      ?auto_803987 - BLOCK
      ?auto_803988 - BLOCK
    )
    :vars
    (
      ?auto_803989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_803988 ?auto_803989 ) ( not ( = ?auto_803977 ?auto_803978 ) ) ( not ( = ?auto_803977 ?auto_803979 ) ) ( not ( = ?auto_803977 ?auto_803980 ) ) ( not ( = ?auto_803977 ?auto_803981 ) ) ( not ( = ?auto_803977 ?auto_803982 ) ) ( not ( = ?auto_803977 ?auto_803983 ) ) ( not ( = ?auto_803977 ?auto_803984 ) ) ( not ( = ?auto_803977 ?auto_803985 ) ) ( not ( = ?auto_803977 ?auto_803986 ) ) ( not ( = ?auto_803977 ?auto_803987 ) ) ( not ( = ?auto_803977 ?auto_803988 ) ) ( not ( = ?auto_803977 ?auto_803989 ) ) ( not ( = ?auto_803978 ?auto_803979 ) ) ( not ( = ?auto_803978 ?auto_803980 ) ) ( not ( = ?auto_803978 ?auto_803981 ) ) ( not ( = ?auto_803978 ?auto_803982 ) ) ( not ( = ?auto_803978 ?auto_803983 ) ) ( not ( = ?auto_803978 ?auto_803984 ) ) ( not ( = ?auto_803978 ?auto_803985 ) ) ( not ( = ?auto_803978 ?auto_803986 ) ) ( not ( = ?auto_803978 ?auto_803987 ) ) ( not ( = ?auto_803978 ?auto_803988 ) ) ( not ( = ?auto_803978 ?auto_803989 ) ) ( not ( = ?auto_803979 ?auto_803980 ) ) ( not ( = ?auto_803979 ?auto_803981 ) ) ( not ( = ?auto_803979 ?auto_803982 ) ) ( not ( = ?auto_803979 ?auto_803983 ) ) ( not ( = ?auto_803979 ?auto_803984 ) ) ( not ( = ?auto_803979 ?auto_803985 ) ) ( not ( = ?auto_803979 ?auto_803986 ) ) ( not ( = ?auto_803979 ?auto_803987 ) ) ( not ( = ?auto_803979 ?auto_803988 ) ) ( not ( = ?auto_803979 ?auto_803989 ) ) ( not ( = ?auto_803980 ?auto_803981 ) ) ( not ( = ?auto_803980 ?auto_803982 ) ) ( not ( = ?auto_803980 ?auto_803983 ) ) ( not ( = ?auto_803980 ?auto_803984 ) ) ( not ( = ?auto_803980 ?auto_803985 ) ) ( not ( = ?auto_803980 ?auto_803986 ) ) ( not ( = ?auto_803980 ?auto_803987 ) ) ( not ( = ?auto_803980 ?auto_803988 ) ) ( not ( = ?auto_803980 ?auto_803989 ) ) ( not ( = ?auto_803981 ?auto_803982 ) ) ( not ( = ?auto_803981 ?auto_803983 ) ) ( not ( = ?auto_803981 ?auto_803984 ) ) ( not ( = ?auto_803981 ?auto_803985 ) ) ( not ( = ?auto_803981 ?auto_803986 ) ) ( not ( = ?auto_803981 ?auto_803987 ) ) ( not ( = ?auto_803981 ?auto_803988 ) ) ( not ( = ?auto_803981 ?auto_803989 ) ) ( not ( = ?auto_803982 ?auto_803983 ) ) ( not ( = ?auto_803982 ?auto_803984 ) ) ( not ( = ?auto_803982 ?auto_803985 ) ) ( not ( = ?auto_803982 ?auto_803986 ) ) ( not ( = ?auto_803982 ?auto_803987 ) ) ( not ( = ?auto_803982 ?auto_803988 ) ) ( not ( = ?auto_803982 ?auto_803989 ) ) ( not ( = ?auto_803983 ?auto_803984 ) ) ( not ( = ?auto_803983 ?auto_803985 ) ) ( not ( = ?auto_803983 ?auto_803986 ) ) ( not ( = ?auto_803983 ?auto_803987 ) ) ( not ( = ?auto_803983 ?auto_803988 ) ) ( not ( = ?auto_803983 ?auto_803989 ) ) ( not ( = ?auto_803984 ?auto_803985 ) ) ( not ( = ?auto_803984 ?auto_803986 ) ) ( not ( = ?auto_803984 ?auto_803987 ) ) ( not ( = ?auto_803984 ?auto_803988 ) ) ( not ( = ?auto_803984 ?auto_803989 ) ) ( not ( = ?auto_803985 ?auto_803986 ) ) ( not ( = ?auto_803985 ?auto_803987 ) ) ( not ( = ?auto_803985 ?auto_803988 ) ) ( not ( = ?auto_803985 ?auto_803989 ) ) ( not ( = ?auto_803986 ?auto_803987 ) ) ( not ( = ?auto_803986 ?auto_803988 ) ) ( not ( = ?auto_803986 ?auto_803989 ) ) ( not ( = ?auto_803987 ?auto_803988 ) ) ( not ( = ?auto_803987 ?auto_803989 ) ) ( not ( = ?auto_803988 ?auto_803989 ) ) ( ON ?auto_803987 ?auto_803988 ) ( ON ?auto_803986 ?auto_803987 ) ( ON ?auto_803985 ?auto_803986 ) ( ON ?auto_803984 ?auto_803985 ) ( ON ?auto_803983 ?auto_803984 ) ( ON ?auto_803982 ?auto_803983 ) ( ON ?auto_803981 ?auto_803982 ) ( ON ?auto_803980 ?auto_803981 ) ( ON ?auto_803979 ?auto_803980 ) ( ON ?auto_803978 ?auto_803979 ) ( ON ?auto_803977 ?auto_803978 ) ( CLEAR ?auto_803977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_803977 )
      ( MAKE-12PILE ?auto_803977 ?auto_803978 ?auto_803979 ?auto_803980 ?auto_803981 ?auto_803982 ?auto_803983 ?auto_803984 ?auto_803985 ?auto_803986 ?auto_803987 ?auto_803988 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804028 - BLOCK
      ?auto_804029 - BLOCK
      ?auto_804030 - BLOCK
      ?auto_804031 - BLOCK
      ?auto_804032 - BLOCK
      ?auto_804033 - BLOCK
      ?auto_804034 - BLOCK
      ?auto_804035 - BLOCK
      ?auto_804036 - BLOCK
      ?auto_804037 - BLOCK
      ?auto_804038 - BLOCK
      ?auto_804039 - BLOCK
      ?auto_804040 - BLOCK
    )
    :vars
    (
      ?auto_804041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_804039 ) ( ON ?auto_804040 ?auto_804041 ) ( CLEAR ?auto_804040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_804028 ) ( ON ?auto_804029 ?auto_804028 ) ( ON ?auto_804030 ?auto_804029 ) ( ON ?auto_804031 ?auto_804030 ) ( ON ?auto_804032 ?auto_804031 ) ( ON ?auto_804033 ?auto_804032 ) ( ON ?auto_804034 ?auto_804033 ) ( ON ?auto_804035 ?auto_804034 ) ( ON ?auto_804036 ?auto_804035 ) ( ON ?auto_804037 ?auto_804036 ) ( ON ?auto_804038 ?auto_804037 ) ( ON ?auto_804039 ?auto_804038 ) ( not ( = ?auto_804028 ?auto_804029 ) ) ( not ( = ?auto_804028 ?auto_804030 ) ) ( not ( = ?auto_804028 ?auto_804031 ) ) ( not ( = ?auto_804028 ?auto_804032 ) ) ( not ( = ?auto_804028 ?auto_804033 ) ) ( not ( = ?auto_804028 ?auto_804034 ) ) ( not ( = ?auto_804028 ?auto_804035 ) ) ( not ( = ?auto_804028 ?auto_804036 ) ) ( not ( = ?auto_804028 ?auto_804037 ) ) ( not ( = ?auto_804028 ?auto_804038 ) ) ( not ( = ?auto_804028 ?auto_804039 ) ) ( not ( = ?auto_804028 ?auto_804040 ) ) ( not ( = ?auto_804028 ?auto_804041 ) ) ( not ( = ?auto_804029 ?auto_804030 ) ) ( not ( = ?auto_804029 ?auto_804031 ) ) ( not ( = ?auto_804029 ?auto_804032 ) ) ( not ( = ?auto_804029 ?auto_804033 ) ) ( not ( = ?auto_804029 ?auto_804034 ) ) ( not ( = ?auto_804029 ?auto_804035 ) ) ( not ( = ?auto_804029 ?auto_804036 ) ) ( not ( = ?auto_804029 ?auto_804037 ) ) ( not ( = ?auto_804029 ?auto_804038 ) ) ( not ( = ?auto_804029 ?auto_804039 ) ) ( not ( = ?auto_804029 ?auto_804040 ) ) ( not ( = ?auto_804029 ?auto_804041 ) ) ( not ( = ?auto_804030 ?auto_804031 ) ) ( not ( = ?auto_804030 ?auto_804032 ) ) ( not ( = ?auto_804030 ?auto_804033 ) ) ( not ( = ?auto_804030 ?auto_804034 ) ) ( not ( = ?auto_804030 ?auto_804035 ) ) ( not ( = ?auto_804030 ?auto_804036 ) ) ( not ( = ?auto_804030 ?auto_804037 ) ) ( not ( = ?auto_804030 ?auto_804038 ) ) ( not ( = ?auto_804030 ?auto_804039 ) ) ( not ( = ?auto_804030 ?auto_804040 ) ) ( not ( = ?auto_804030 ?auto_804041 ) ) ( not ( = ?auto_804031 ?auto_804032 ) ) ( not ( = ?auto_804031 ?auto_804033 ) ) ( not ( = ?auto_804031 ?auto_804034 ) ) ( not ( = ?auto_804031 ?auto_804035 ) ) ( not ( = ?auto_804031 ?auto_804036 ) ) ( not ( = ?auto_804031 ?auto_804037 ) ) ( not ( = ?auto_804031 ?auto_804038 ) ) ( not ( = ?auto_804031 ?auto_804039 ) ) ( not ( = ?auto_804031 ?auto_804040 ) ) ( not ( = ?auto_804031 ?auto_804041 ) ) ( not ( = ?auto_804032 ?auto_804033 ) ) ( not ( = ?auto_804032 ?auto_804034 ) ) ( not ( = ?auto_804032 ?auto_804035 ) ) ( not ( = ?auto_804032 ?auto_804036 ) ) ( not ( = ?auto_804032 ?auto_804037 ) ) ( not ( = ?auto_804032 ?auto_804038 ) ) ( not ( = ?auto_804032 ?auto_804039 ) ) ( not ( = ?auto_804032 ?auto_804040 ) ) ( not ( = ?auto_804032 ?auto_804041 ) ) ( not ( = ?auto_804033 ?auto_804034 ) ) ( not ( = ?auto_804033 ?auto_804035 ) ) ( not ( = ?auto_804033 ?auto_804036 ) ) ( not ( = ?auto_804033 ?auto_804037 ) ) ( not ( = ?auto_804033 ?auto_804038 ) ) ( not ( = ?auto_804033 ?auto_804039 ) ) ( not ( = ?auto_804033 ?auto_804040 ) ) ( not ( = ?auto_804033 ?auto_804041 ) ) ( not ( = ?auto_804034 ?auto_804035 ) ) ( not ( = ?auto_804034 ?auto_804036 ) ) ( not ( = ?auto_804034 ?auto_804037 ) ) ( not ( = ?auto_804034 ?auto_804038 ) ) ( not ( = ?auto_804034 ?auto_804039 ) ) ( not ( = ?auto_804034 ?auto_804040 ) ) ( not ( = ?auto_804034 ?auto_804041 ) ) ( not ( = ?auto_804035 ?auto_804036 ) ) ( not ( = ?auto_804035 ?auto_804037 ) ) ( not ( = ?auto_804035 ?auto_804038 ) ) ( not ( = ?auto_804035 ?auto_804039 ) ) ( not ( = ?auto_804035 ?auto_804040 ) ) ( not ( = ?auto_804035 ?auto_804041 ) ) ( not ( = ?auto_804036 ?auto_804037 ) ) ( not ( = ?auto_804036 ?auto_804038 ) ) ( not ( = ?auto_804036 ?auto_804039 ) ) ( not ( = ?auto_804036 ?auto_804040 ) ) ( not ( = ?auto_804036 ?auto_804041 ) ) ( not ( = ?auto_804037 ?auto_804038 ) ) ( not ( = ?auto_804037 ?auto_804039 ) ) ( not ( = ?auto_804037 ?auto_804040 ) ) ( not ( = ?auto_804037 ?auto_804041 ) ) ( not ( = ?auto_804038 ?auto_804039 ) ) ( not ( = ?auto_804038 ?auto_804040 ) ) ( not ( = ?auto_804038 ?auto_804041 ) ) ( not ( = ?auto_804039 ?auto_804040 ) ) ( not ( = ?auto_804039 ?auto_804041 ) ) ( not ( = ?auto_804040 ?auto_804041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_804040 ?auto_804041 )
      ( !STACK ?auto_804040 ?auto_804039 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804082 - BLOCK
      ?auto_804083 - BLOCK
      ?auto_804084 - BLOCK
      ?auto_804085 - BLOCK
      ?auto_804086 - BLOCK
      ?auto_804087 - BLOCK
      ?auto_804088 - BLOCK
      ?auto_804089 - BLOCK
      ?auto_804090 - BLOCK
      ?auto_804091 - BLOCK
      ?auto_804092 - BLOCK
      ?auto_804093 - BLOCK
      ?auto_804094 - BLOCK
    )
    :vars
    (
      ?auto_804095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804094 ?auto_804095 ) ( ON-TABLE ?auto_804082 ) ( ON ?auto_804083 ?auto_804082 ) ( ON ?auto_804084 ?auto_804083 ) ( ON ?auto_804085 ?auto_804084 ) ( ON ?auto_804086 ?auto_804085 ) ( ON ?auto_804087 ?auto_804086 ) ( ON ?auto_804088 ?auto_804087 ) ( ON ?auto_804089 ?auto_804088 ) ( ON ?auto_804090 ?auto_804089 ) ( ON ?auto_804091 ?auto_804090 ) ( ON ?auto_804092 ?auto_804091 ) ( not ( = ?auto_804082 ?auto_804083 ) ) ( not ( = ?auto_804082 ?auto_804084 ) ) ( not ( = ?auto_804082 ?auto_804085 ) ) ( not ( = ?auto_804082 ?auto_804086 ) ) ( not ( = ?auto_804082 ?auto_804087 ) ) ( not ( = ?auto_804082 ?auto_804088 ) ) ( not ( = ?auto_804082 ?auto_804089 ) ) ( not ( = ?auto_804082 ?auto_804090 ) ) ( not ( = ?auto_804082 ?auto_804091 ) ) ( not ( = ?auto_804082 ?auto_804092 ) ) ( not ( = ?auto_804082 ?auto_804093 ) ) ( not ( = ?auto_804082 ?auto_804094 ) ) ( not ( = ?auto_804082 ?auto_804095 ) ) ( not ( = ?auto_804083 ?auto_804084 ) ) ( not ( = ?auto_804083 ?auto_804085 ) ) ( not ( = ?auto_804083 ?auto_804086 ) ) ( not ( = ?auto_804083 ?auto_804087 ) ) ( not ( = ?auto_804083 ?auto_804088 ) ) ( not ( = ?auto_804083 ?auto_804089 ) ) ( not ( = ?auto_804083 ?auto_804090 ) ) ( not ( = ?auto_804083 ?auto_804091 ) ) ( not ( = ?auto_804083 ?auto_804092 ) ) ( not ( = ?auto_804083 ?auto_804093 ) ) ( not ( = ?auto_804083 ?auto_804094 ) ) ( not ( = ?auto_804083 ?auto_804095 ) ) ( not ( = ?auto_804084 ?auto_804085 ) ) ( not ( = ?auto_804084 ?auto_804086 ) ) ( not ( = ?auto_804084 ?auto_804087 ) ) ( not ( = ?auto_804084 ?auto_804088 ) ) ( not ( = ?auto_804084 ?auto_804089 ) ) ( not ( = ?auto_804084 ?auto_804090 ) ) ( not ( = ?auto_804084 ?auto_804091 ) ) ( not ( = ?auto_804084 ?auto_804092 ) ) ( not ( = ?auto_804084 ?auto_804093 ) ) ( not ( = ?auto_804084 ?auto_804094 ) ) ( not ( = ?auto_804084 ?auto_804095 ) ) ( not ( = ?auto_804085 ?auto_804086 ) ) ( not ( = ?auto_804085 ?auto_804087 ) ) ( not ( = ?auto_804085 ?auto_804088 ) ) ( not ( = ?auto_804085 ?auto_804089 ) ) ( not ( = ?auto_804085 ?auto_804090 ) ) ( not ( = ?auto_804085 ?auto_804091 ) ) ( not ( = ?auto_804085 ?auto_804092 ) ) ( not ( = ?auto_804085 ?auto_804093 ) ) ( not ( = ?auto_804085 ?auto_804094 ) ) ( not ( = ?auto_804085 ?auto_804095 ) ) ( not ( = ?auto_804086 ?auto_804087 ) ) ( not ( = ?auto_804086 ?auto_804088 ) ) ( not ( = ?auto_804086 ?auto_804089 ) ) ( not ( = ?auto_804086 ?auto_804090 ) ) ( not ( = ?auto_804086 ?auto_804091 ) ) ( not ( = ?auto_804086 ?auto_804092 ) ) ( not ( = ?auto_804086 ?auto_804093 ) ) ( not ( = ?auto_804086 ?auto_804094 ) ) ( not ( = ?auto_804086 ?auto_804095 ) ) ( not ( = ?auto_804087 ?auto_804088 ) ) ( not ( = ?auto_804087 ?auto_804089 ) ) ( not ( = ?auto_804087 ?auto_804090 ) ) ( not ( = ?auto_804087 ?auto_804091 ) ) ( not ( = ?auto_804087 ?auto_804092 ) ) ( not ( = ?auto_804087 ?auto_804093 ) ) ( not ( = ?auto_804087 ?auto_804094 ) ) ( not ( = ?auto_804087 ?auto_804095 ) ) ( not ( = ?auto_804088 ?auto_804089 ) ) ( not ( = ?auto_804088 ?auto_804090 ) ) ( not ( = ?auto_804088 ?auto_804091 ) ) ( not ( = ?auto_804088 ?auto_804092 ) ) ( not ( = ?auto_804088 ?auto_804093 ) ) ( not ( = ?auto_804088 ?auto_804094 ) ) ( not ( = ?auto_804088 ?auto_804095 ) ) ( not ( = ?auto_804089 ?auto_804090 ) ) ( not ( = ?auto_804089 ?auto_804091 ) ) ( not ( = ?auto_804089 ?auto_804092 ) ) ( not ( = ?auto_804089 ?auto_804093 ) ) ( not ( = ?auto_804089 ?auto_804094 ) ) ( not ( = ?auto_804089 ?auto_804095 ) ) ( not ( = ?auto_804090 ?auto_804091 ) ) ( not ( = ?auto_804090 ?auto_804092 ) ) ( not ( = ?auto_804090 ?auto_804093 ) ) ( not ( = ?auto_804090 ?auto_804094 ) ) ( not ( = ?auto_804090 ?auto_804095 ) ) ( not ( = ?auto_804091 ?auto_804092 ) ) ( not ( = ?auto_804091 ?auto_804093 ) ) ( not ( = ?auto_804091 ?auto_804094 ) ) ( not ( = ?auto_804091 ?auto_804095 ) ) ( not ( = ?auto_804092 ?auto_804093 ) ) ( not ( = ?auto_804092 ?auto_804094 ) ) ( not ( = ?auto_804092 ?auto_804095 ) ) ( not ( = ?auto_804093 ?auto_804094 ) ) ( not ( = ?auto_804093 ?auto_804095 ) ) ( not ( = ?auto_804094 ?auto_804095 ) ) ( CLEAR ?auto_804092 ) ( ON ?auto_804093 ?auto_804094 ) ( CLEAR ?auto_804093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_804082 ?auto_804083 ?auto_804084 ?auto_804085 ?auto_804086 ?auto_804087 ?auto_804088 ?auto_804089 ?auto_804090 ?auto_804091 ?auto_804092 ?auto_804093 )
      ( MAKE-13PILE ?auto_804082 ?auto_804083 ?auto_804084 ?auto_804085 ?auto_804086 ?auto_804087 ?auto_804088 ?auto_804089 ?auto_804090 ?auto_804091 ?auto_804092 ?auto_804093 ?auto_804094 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804136 - BLOCK
      ?auto_804137 - BLOCK
      ?auto_804138 - BLOCK
      ?auto_804139 - BLOCK
      ?auto_804140 - BLOCK
      ?auto_804141 - BLOCK
      ?auto_804142 - BLOCK
      ?auto_804143 - BLOCK
      ?auto_804144 - BLOCK
      ?auto_804145 - BLOCK
      ?auto_804146 - BLOCK
      ?auto_804147 - BLOCK
      ?auto_804148 - BLOCK
    )
    :vars
    (
      ?auto_804149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804148 ?auto_804149 ) ( ON-TABLE ?auto_804136 ) ( ON ?auto_804137 ?auto_804136 ) ( ON ?auto_804138 ?auto_804137 ) ( ON ?auto_804139 ?auto_804138 ) ( ON ?auto_804140 ?auto_804139 ) ( ON ?auto_804141 ?auto_804140 ) ( ON ?auto_804142 ?auto_804141 ) ( ON ?auto_804143 ?auto_804142 ) ( ON ?auto_804144 ?auto_804143 ) ( ON ?auto_804145 ?auto_804144 ) ( not ( = ?auto_804136 ?auto_804137 ) ) ( not ( = ?auto_804136 ?auto_804138 ) ) ( not ( = ?auto_804136 ?auto_804139 ) ) ( not ( = ?auto_804136 ?auto_804140 ) ) ( not ( = ?auto_804136 ?auto_804141 ) ) ( not ( = ?auto_804136 ?auto_804142 ) ) ( not ( = ?auto_804136 ?auto_804143 ) ) ( not ( = ?auto_804136 ?auto_804144 ) ) ( not ( = ?auto_804136 ?auto_804145 ) ) ( not ( = ?auto_804136 ?auto_804146 ) ) ( not ( = ?auto_804136 ?auto_804147 ) ) ( not ( = ?auto_804136 ?auto_804148 ) ) ( not ( = ?auto_804136 ?auto_804149 ) ) ( not ( = ?auto_804137 ?auto_804138 ) ) ( not ( = ?auto_804137 ?auto_804139 ) ) ( not ( = ?auto_804137 ?auto_804140 ) ) ( not ( = ?auto_804137 ?auto_804141 ) ) ( not ( = ?auto_804137 ?auto_804142 ) ) ( not ( = ?auto_804137 ?auto_804143 ) ) ( not ( = ?auto_804137 ?auto_804144 ) ) ( not ( = ?auto_804137 ?auto_804145 ) ) ( not ( = ?auto_804137 ?auto_804146 ) ) ( not ( = ?auto_804137 ?auto_804147 ) ) ( not ( = ?auto_804137 ?auto_804148 ) ) ( not ( = ?auto_804137 ?auto_804149 ) ) ( not ( = ?auto_804138 ?auto_804139 ) ) ( not ( = ?auto_804138 ?auto_804140 ) ) ( not ( = ?auto_804138 ?auto_804141 ) ) ( not ( = ?auto_804138 ?auto_804142 ) ) ( not ( = ?auto_804138 ?auto_804143 ) ) ( not ( = ?auto_804138 ?auto_804144 ) ) ( not ( = ?auto_804138 ?auto_804145 ) ) ( not ( = ?auto_804138 ?auto_804146 ) ) ( not ( = ?auto_804138 ?auto_804147 ) ) ( not ( = ?auto_804138 ?auto_804148 ) ) ( not ( = ?auto_804138 ?auto_804149 ) ) ( not ( = ?auto_804139 ?auto_804140 ) ) ( not ( = ?auto_804139 ?auto_804141 ) ) ( not ( = ?auto_804139 ?auto_804142 ) ) ( not ( = ?auto_804139 ?auto_804143 ) ) ( not ( = ?auto_804139 ?auto_804144 ) ) ( not ( = ?auto_804139 ?auto_804145 ) ) ( not ( = ?auto_804139 ?auto_804146 ) ) ( not ( = ?auto_804139 ?auto_804147 ) ) ( not ( = ?auto_804139 ?auto_804148 ) ) ( not ( = ?auto_804139 ?auto_804149 ) ) ( not ( = ?auto_804140 ?auto_804141 ) ) ( not ( = ?auto_804140 ?auto_804142 ) ) ( not ( = ?auto_804140 ?auto_804143 ) ) ( not ( = ?auto_804140 ?auto_804144 ) ) ( not ( = ?auto_804140 ?auto_804145 ) ) ( not ( = ?auto_804140 ?auto_804146 ) ) ( not ( = ?auto_804140 ?auto_804147 ) ) ( not ( = ?auto_804140 ?auto_804148 ) ) ( not ( = ?auto_804140 ?auto_804149 ) ) ( not ( = ?auto_804141 ?auto_804142 ) ) ( not ( = ?auto_804141 ?auto_804143 ) ) ( not ( = ?auto_804141 ?auto_804144 ) ) ( not ( = ?auto_804141 ?auto_804145 ) ) ( not ( = ?auto_804141 ?auto_804146 ) ) ( not ( = ?auto_804141 ?auto_804147 ) ) ( not ( = ?auto_804141 ?auto_804148 ) ) ( not ( = ?auto_804141 ?auto_804149 ) ) ( not ( = ?auto_804142 ?auto_804143 ) ) ( not ( = ?auto_804142 ?auto_804144 ) ) ( not ( = ?auto_804142 ?auto_804145 ) ) ( not ( = ?auto_804142 ?auto_804146 ) ) ( not ( = ?auto_804142 ?auto_804147 ) ) ( not ( = ?auto_804142 ?auto_804148 ) ) ( not ( = ?auto_804142 ?auto_804149 ) ) ( not ( = ?auto_804143 ?auto_804144 ) ) ( not ( = ?auto_804143 ?auto_804145 ) ) ( not ( = ?auto_804143 ?auto_804146 ) ) ( not ( = ?auto_804143 ?auto_804147 ) ) ( not ( = ?auto_804143 ?auto_804148 ) ) ( not ( = ?auto_804143 ?auto_804149 ) ) ( not ( = ?auto_804144 ?auto_804145 ) ) ( not ( = ?auto_804144 ?auto_804146 ) ) ( not ( = ?auto_804144 ?auto_804147 ) ) ( not ( = ?auto_804144 ?auto_804148 ) ) ( not ( = ?auto_804144 ?auto_804149 ) ) ( not ( = ?auto_804145 ?auto_804146 ) ) ( not ( = ?auto_804145 ?auto_804147 ) ) ( not ( = ?auto_804145 ?auto_804148 ) ) ( not ( = ?auto_804145 ?auto_804149 ) ) ( not ( = ?auto_804146 ?auto_804147 ) ) ( not ( = ?auto_804146 ?auto_804148 ) ) ( not ( = ?auto_804146 ?auto_804149 ) ) ( not ( = ?auto_804147 ?auto_804148 ) ) ( not ( = ?auto_804147 ?auto_804149 ) ) ( not ( = ?auto_804148 ?auto_804149 ) ) ( ON ?auto_804147 ?auto_804148 ) ( CLEAR ?auto_804145 ) ( ON ?auto_804146 ?auto_804147 ) ( CLEAR ?auto_804146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_804136 ?auto_804137 ?auto_804138 ?auto_804139 ?auto_804140 ?auto_804141 ?auto_804142 ?auto_804143 ?auto_804144 ?auto_804145 ?auto_804146 )
      ( MAKE-13PILE ?auto_804136 ?auto_804137 ?auto_804138 ?auto_804139 ?auto_804140 ?auto_804141 ?auto_804142 ?auto_804143 ?auto_804144 ?auto_804145 ?auto_804146 ?auto_804147 ?auto_804148 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804190 - BLOCK
      ?auto_804191 - BLOCK
      ?auto_804192 - BLOCK
      ?auto_804193 - BLOCK
      ?auto_804194 - BLOCK
      ?auto_804195 - BLOCK
      ?auto_804196 - BLOCK
      ?auto_804197 - BLOCK
      ?auto_804198 - BLOCK
      ?auto_804199 - BLOCK
      ?auto_804200 - BLOCK
      ?auto_804201 - BLOCK
      ?auto_804202 - BLOCK
    )
    :vars
    (
      ?auto_804203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804202 ?auto_804203 ) ( ON-TABLE ?auto_804190 ) ( ON ?auto_804191 ?auto_804190 ) ( ON ?auto_804192 ?auto_804191 ) ( ON ?auto_804193 ?auto_804192 ) ( ON ?auto_804194 ?auto_804193 ) ( ON ?auto_804195 ?auto_804194 ) ( ON ?auto_804196 ?auto_804195 ) ( ON ?auto_804197 ?auto_804196 ) ( ON ?auto_804198 ?auto_804197 ) ( not ( = ?auto_804190 ?auto_804191 ) ) ( not ( = ?auto_804190 ?auto_804192 ) ) ( not ( = ?auto_804190 ?auto_804193 ) ) ( not ( = ?auto_804190 ?auto_804194 ) ) ( not ( = ?auto_804190 ?auto_804195 ) ) ( not ( = ?auto_804190 ?auto_804196 ) ) ( not ( = ?auto_804190 ?auto_804197 ) ) ( not ( = ?auto_804190 ?auto_804198 ) ) ( not ( = ?auto_804190 ?auto_804199 ) ) ( not ( = ?auto_804190 ?auto_804200 ) ) ( not ( = ?auto_804190 ?auto_804201 ) ) ( not ( = ?auto_804190 ?auto_804202 ) ) ( not ( = ?auto_804190 ?auto_804203 ) ) ( not ( = ?auto_804191 ?auto_804192 ) ) ( not ( = ?auto_804191 ?auto_804193 ) ) ( not ( = ?auto_804191 ?auto_804194 ) ) ( not ( = ?auto_804191 ?auto_804195 ) ) ( not ( = ?auto_804191 ?auto_804196 ) ) ( not ( = ?auto_804191 ?auto_804197 ) ) ( not ( = ?auto_804191 ?auto_804198 ) ) ( not ( = ?auto_804191 ?auto_804199 ) ) ( not ( = ?auto_804191 ?auto_804200 ) ) ( not ( = ?auto_804191 ?auto_804201 ) ) ( not ( = ?auto_804191 ?auto_804202 ) ) ( not ( = ?auto_804191 ?auto_804203 ) ) ( not ( = ?auto_804192 ?auto_804193 ) ) ( not ( = ?auto_804192 ?auto_804194 ) ) ( not ( = ?auto_804192 ?auto_804195 ) ) ( not ( = ?auto_804192 ?auto_804196 ) ) ( not ( = ?auto_804192 ?auto_804197 ) ) ( not ( = ?auto_804192 ?auto_804198 ) ) ( not ( = ?auto_804192 ?auto_804199 ) ) ( not ( = ?auto_804192 ?auto_804200 ) ) ( not ( = ?auto_804192 ?auto_804201 ) ) ( not ( = ?auto_804192 ?auto_804202 ) ) ( not ( = ?auto_804192 ?auto_804203 ) ) ( not ( = ?auto_804193 ?auto_804194 ) ) ( not ( = ?auto_804193 ?auto_804195 ) ) ( not ( = ?auto_804193 ?auto_804196 ) ) ( not ( = ?auto_804193 ?auto_804197 ) ) ( not ( = ?auto_804193 ?auto_804198 ) ) ( not ( = ?auto_804193 ?auto_804199 ) ) ( not ( = ?auto_804193 ?auto_804200 ) ) ( not ( = ?auto_804193 ?auto_804201 ) ) ( not ( = ?auto_804193 ?auto_804202 ) ) ( not ( = ?auto_804193 ?auto_804203 ) ) ( not ( = ?auto_804194 ?auto_804195 ) ) ( not ( = ?auto_804194 ?auto_804196 ) ) ( not ( = ?auto_804194 ?auto_804197 ) ) ( not ( = ?auto_804194 ?auto_804198 ) ) ( not ( = ?auto_804194 ?auto_804199 ) ) ( not ( = ?auto_804194 ?auto_804200 ) ) ( not ( = ?auto_804194 ?auto_804201 ) ) ( not ( = ?auto_804194 ?auto_804202 ) ) ( not ( = ?auto_804194 ?auto_804203 ) ) ( not ( = ?auto_804195 ?auto_804196 ) ) ( not ( = ?auto_804195 ?auto_804197 ) ) ( not ( = ?auto_804195 ?auto_804198 ) ) ( not ( = ?auto_804195 ?auto_804199 ) ) ( not ( = ?auto_804195 ?auto_804200 ) ) ( not ( = ?auto_804195 ?auto_804201 ) ) ( not ( = ?auto_804195 ?auto_804202 ) ) ( not ( = ?auto_804195 ?auto_804203 ) ) ( not ( = ?auto_804196 ?auto_804197 ) ) ( not ( = ?auto_804196 ?auto_804198 ) ) ( not ( = ?auto_804196 ?auto_804199 ) ) ( not ( = ?auto_804196 ?auto_804200 ) ) ( not ( = ?auto_804196 ?auto_804201 ) ) ( not ( = ?auto_804196 ?auto_804202 ) ) ( not ( = ?auto_804196 ?auto_804203 ) ) ( not ( = ?auto_804197 ?auto_804198 ) ) ( not ( = ?auto_804197 ?auto_804199 ) ) ( not ( = ?auto_804197 ?auto_804200 ) ) ( not ( = ?auto_804197 ?auto_804201 ) ) ( not ( = ?auto_804197 ?auto_804202 ) ) ( not ( = ?auto_804197 ?auto_804203 ) ) ( not ( = ?auto_804198 ?auto_804199 ) ) ( not ( = ?auto_804198 ?auto_804200 ) ) ( not ( = ?auto_804198 ?auto_804201 ) ) ( not ( = ?auto_804198 ?auto_804202 ) ) ( not ( = ?auto_804198 ?auto_804203 ) ) ( not ( = ?auto_804199 ?auto_804200 ) ) ( not ( = ?auto_804199 ?auto_804201 ) ) ( not ( = ?auto_804199 ?auto_804202 ) ) ( not ( = ?auto_804199 ?auto_804203 ) ) ( not ( = ?auto_804200 ?auto_804201 ) ) ( not ( = ?auto_804200 ?auto_804202 ) ) ( not ( = ?auto_804200 ?auto_804203 ) ) ( not ( = ?auto_804201 ?auto_804202 ) ) ( not ( = ?auto_804201 ?auto_804203 ) ) ( not ( = ?auto_804202 ?auto_804203 ) ) ( ON ?auto_804201 ?auto_804202 ) ( ON ?auto_804200 ?auto_804201 ) ( CLEAR ?auto_804198 ) ( ON ?auto_804199 ?auto_804200 ) ( CLEAR ?auto_804199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_804190 ?auto_804191 ?auto_804192 ?auto_804193 ?auto_804194 ?auto_804195 ?auto_804196 ?auto_804197 ?auto_804198 ?auto_804199 )
      ( MAKE-13PILE ?auto_804190 ?auto_804191 ?auto_804192 ?auto_804193 ?auto_804194 ?auto_804195 ?auto_804196 ?auto_804197 ?auto_804198 ?auto_804199 ?auto_804200 ?auto_804201 ?auto_804202 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804244 - BLOCK
      ?auto_804245 - BLOCK
      ?auto_804246 - BLOCK
      ?auto_804247 - BLOCK
      ?auto_804248 - BLOCK
      ?auto_804249 - BLOCK
      ?auto_804250 - BLOCK
      ?auto_804251 - BLOCK
      ?auto_804252 - BLOCK
      ?auto_804253 - BLOCK
      ?auto_804254 - BLOCK
      ?auto_804255 - BLOCK
      ?auto_804256 - BLOCK
    )
    :vars
    (
      ?auto_804257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804256 ?auto_804257 ) ( ON-TABLE ?auto_804244 ) ( ON ?auto_804245 ?auto_804244 ) ( ON ?auto_804246 ?auto_804245 ) ( ON ?auto_804247 ?auto_804246 ) ( ON ?auto_804248 ?auto_804247 ) ( ON ?auto_804249 ?auto_804248 ) ( ON ?auto_804250 ?auto_804249 ) ( ON ?auto_804251 ?auto_804250 ) ( not ( = ?auto_804244 ?auto_804245 ) ) ( not ( = ?auto_804244 ?auto_804246 ) ) ( not ( = ?auto_804244 ?auto_804247 ) ) ( not ( = ?auto_804244 ?auto_804248 ) ) ( not ( = ?auto_804244 ?auto_804249 ) ) ( not ( = ?auto_804244 ?auto_804250 ) ) ( not ( = ?auto_804244 ?auto_804251 ) ) ( not ( = ?auto_804244 ?auto_804252 ) ) ( not ( = ?auto_804244 ?auto_804253 ) ) ( not ( = ?auto_804244 ?auto_804254 ) ) ( not ( = ?auto_804244 ?auto_804255 ) ) ( not ( = ?auto_804244 ?auto_804256 ) ) ( not ( = ?auto_804244 ?auto_804257 ) ) ( not ( = ?auto_804245 ?auto_804246 ) ) ( not ( = ?auto_804245 ?auto_804247 ) ) ( not ( = ?auto_804245 ?auto_804248 ) ) ( not ( = ?auto_804245 ?auto_804249 ) ) ( not ( = ?auto_804245 ?auto_804250 ) ) ( not ( = ?auto_804245 ?auto_804251 ) ) ( not ( = ?auto_804245 ?auto_804252 ) ) ( not ( = ?auto_804245 ?auto_804253 ) ) ( not ( = ?auto_804245 ?auto_804254 ) ) ( not ( = ?auto_804245 ?auto_804255 ) ) ( not ( = ?auto_804245 ?auto_804256 ) ) ( not ( = ?auto_804245 ?auto_804257 ) ) ( not ( = ?auto_804246 ?auto_804247 ) ) ( not ( = ?auto_804246 ?auto_804248 ) ) ( not ( = ?auto_804246 ?auto_804249 ) ) ( not ( = ?auto_804246 ?auto_804250 ) ) ( not ( = ?auto_804246 ?auto_804251 ) ) ( not ( = ?auto_804246 ?auto_804252 ) ) ( not ( = ?auto_804246 ?auto_804253 ) ) ( not ( = ?auto_804246 ?auto_804254 ) ) ( not ( = ?auto_804246 ?auto_804255 ) ) ( not ( = ?auto_804246 ?auto_804256 ) ) ( not ( = ?auto_804246 ?auto_804257 ) ) ( not ( = ?auto_804247 ?auto_804248 ) ) ( not ( = ?auto_804247 ?auto_804249 ) ) ( not ( = ?auto_804247 ?auto_804250 ) ) ( not ( = ?auto_804247 ?auto_804251 ) ) ( not ( = ?auto_804247 ?auto_804252 ) ) ( not ( = ?auto_804247 ?auto_804253 ) ) ( not ( = ?auto_804247 ?auto_804254 ) ) ( not ( = ?auto_804247 ?auto_804255 ) ) ( not ( = ?auto_804247 ?auto_804256 ) ) ( not ( = ?auto_804247 ?auto_804257 ) ) ( not ( = ?auto_804248 ?auto_804249 ) ) ( not ( = ?auto_804248 ?auto_804250 ) ) ( not ( = ?auto_804248 ?auto_804251 ) ) ( not ( = ?auto_804248 ?auto_804252 ) ) ( not ( = ?auto_804248 ?auto_804253 ) ) ( not ( = ?auto_804248 ?auto_804254 ) ) ( not ( = ?auto_804248 ?auto_804255 ) ) ( not ( = ?auto_804248 ?auto_804256 ) ) ( not ( = ?auto_804248 ?auto_804257 ) ) ( not ( = ?auto_804249 ?auto_804250 ) ) ( not ( = ?auto_804249 ?auto_804251 ) ) ( not ( = ?auto_804249 ?auto_804252 ) ) ( not ( = ?auto_804249 ?auto_804253 ) ) ( not ( = ?auto_804249 ?auto_804254 ) ) ( not ( = ?auto_804249 ?auto_804255 ) ) ( not ( = ?auto_804249 ?auto_804256 ) ) ( not ( = ?auto_804249 ?auto_804257 ) ) ( not ( = ?auto_804250 ?auto_804251 ) ) ( not ( = ?auto_804250 ?auto_804252 ) ) ( not ( = ?auto_804250 ?auto_804253 ) ) ( not ( = ?auto_804250 ?auto_804254 ) ) ( not ( = ?auto_804250 ?auto_804255 ) ) ( not ( = ?auto_804250 ?auto_804256 ) ) ( not ( = ?auto_804250 ?auto_804257 ) ) ( not ( = ?auto_804251 ?auto_804252 ) ) ( not ( = ?auto_804251 ?auto_804253 ) ) ( not ( = ?auto_804251 ?auto_804254 ) ) ( not ( = ?auto_804251 ?auto_804255 ) ) ( not ( = ?auto_804251 ?auto_804256 ) ) ( not ( = ?auto_804251 ?auto_804257 ) ) ( not ( = ?auto_804252 ?auto_804253 ) ) ( not ( = ?auto_804252 ?auto_804254 ) ) ( not ( = ?auto_804252 ?auto_804255 ) ) ( not ( = ?auto_804252 ?auto_804256 ) ) ( not ( = ?auto_804252 ?auto_804257 ) ) ( not ( = ?auto_804253 ?auto_804254 ) ) ( not ( = ?auto_804253 ?auto_804255 ) ) ( not ( = ?auto_804253 ?auto_804256 ) ) ( not ( = ?auto_804253 ?auto_804257 ) ) ( not ( = ?auto_804254 ?auto_804255 ) ) ( not ( = ?auto_804254 ?auto_804256 ) ) ( not ( = ?auto_804254 ?auto_804257 ) ) ( not ( = ?auto_804255 ?auto_804256 ) ) ( not ( = ?auto_804255 ?auto_804257 ) ) ( not ( = ?auto_804256 ?auto_804257 ) ) ( ON ?auto_804255 ?auto_804256 ) ( ON ?auto_804254 ?auto_804255 ) ( ON ?auto_804253 ?auto_804254 ) ( CLEAR ?auto_804251 ) ( ON ?auto_804252 ?auto_804253 ) ( CLEAR ?auto_804252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_804244 ?auto_804245 ?auto_804246 ?auto_804247 ?auto_804248 ?auto_804249 ?auto_804250 ?auto_804251 ?auto_804252 )
      ( MAKE-13PILE ?auto_804244 ?auto_804245 ?auto_804246 ?auto_804247 ?auto_804248 ?auto_804249 ?auto_804250 ?auto_804251 ?auto_804252 ?auto_804253 ?auto_804254 ?auto_804255 ?auto_804256 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804298 - BLOCK
      ?auto_804299 - BLOCK
      ?auto_804300 - BLOCK
      ?auto_804301 - BLOCK
      ?auto_804302 - BLOCK
      ?auto_804303 - BLOCK
      ?auto_804304 - BLOCK
      ?auto_804305 - BLOCK
      ?auto_804306 - BLOCK
      ?auto_804307 - BLOCK
      ?auto_804308 - BLOCK
      ?auto_804309 - BLOCK
      ?auto_804310 - BLOCK
    )
    :vars
    (
      ?auto_804311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804310 ?auto_804311 ) ( ON-TABLE ?auto_804298 ) ( ON ?auto_804299 ?auto_804298 ) ( ON ?auto_804300 ?auto_804299 ) ( ON ?auto_804301 ?auto_804300 ) ( ON ?auto_804302 ?auto_804301 ) ( ON ?auto_804303 ?auto_804302 ) ( ON ?auto_804304 ?auto_804303 ) ( not ( = ?auto_804298 ?auto_804299 ) ) ( not ( = ?auto_804298 ?auto_804300 ) ) ( not ( = ?auto_804298 ?auto_804301 ) ) ( not ( = ?auto_804298 ?auto_804302 ) ) ( not ( = ?auto_804298 ?auto_804303 ) ) ( not ( = ?auto_804298 ?auto_804304 ) ) ( not ( = ?auto_804298 ?auto_804305 ) ) ( not ( = ?auto_804298 ?auto_804306 ) ) ( not ( = ?auto_804298 ?auto_804307 ) ) ( not ( = ?auto_804298 ?auto_804308 ) ) ( not ( = ?auto_804298 ?auto_804309 ) ) ( not ( = ?auto_804298 ?auto_804310 ) ) ( not ( = ?auto_804298 ?auto_804311 ) ) ( not ( = ?auto_804299 ?auto_804300 ) ) ( not ( = ?auto_804299 ?auto_804301 ) ) ( not ( = ?auto_804299 ?auto_804302 ) ) ( not ( = ?auto_804299 ?auto_804303 ) ) ( not ( = ?auto_804299 ?auto_804304 ) ) ( not ( = ?auto_804299 ?auto_804305 ) ) ( not ( = ?auto_804299 ?auto_804306 ) ) ( not ( = ?auto_804299 ?auto_804307 ) ) ( not ( = ?auto_804299 ?auto_804308 ) ) ( not ( = ?auto_804299 ?auto_804309 ) ) ( not ( = ?auto_804299 ?auto_804310 ) ) ( not ( = ?auto_804299 ?auto_804311 ) ) ( not ( = ?auto_804300 ?auto_804301 ) ) ( not ( = ?auto_804300 ?auto_804302 ) ) ( not ( = ?auto_804300 ?auto_804303 ) ) ( not ( = ?auto_804300 ?auto_804304 ) ) ( not ( = ?auto_804300 ?auto_804305 ) ) ( not ( = ?auto_804300 ?auto_804306 ) ) ( not ( = ?auto_804300 ?auto_804307 ) ) ( not ( = ?auto_804300 ?auto_804308 ) ) ( not ( = ?auto_804300 ?auto_804309 ) ) ( not ( = ?auto_804300 ?auto_804310 ) ) ( not ( = ?auto_804300 ?auto_804311 ) ) ( not ( = ?auto_804301 ?auto_804302 ) ) ( not ( = ?auto_804301 ?auto_804303 ) ) ( not ( = ?auto_804301 ?auto_804304 ) ) ( not ( = ?auto_804301 ?auto_804305 ) ) ( not ( = ?auto_804301 ?auto_804306 ) ) ( not ( = ?auto_804301 ?auto_804307 ) ) ( not ( = ?auto_804301 ?auto_804308 ) ) ( not ( = ?auto_804301 ?auto_804309 ) ) ( not ( = ?auto_804301 ?auto_804310 ) ) ( not ( = ?auto_804301 ?auto_804311 ) ) ( not ( = ?auto_804302 ?auto_804303 ) ) ( not ( = ?auto_804302 ?auto_804304 ) ) ( not ( = ?auto_804302 ?auto_804305 ) ) ( not ( = ?auto_804302 ?auto_804306 ) ) ( not ( = ?auto_804302 ?auto_804307 ) ) ( not ( = ?auto_804302 ?auto_804308 ) ) ( not ( = ?auto_804302 ?auto_804309 ) ) ( not ( = ?auto_804302 ?auto_804310 ) ) ( not ( = ?auto_804302 ?auto_804311 ) ) ( not ( = ?auto_804303 ?auto_804304 ) ) ( not ( = ?auto_804303 ?auto_804305 ) ) ( not ( = ?auto_804303 ?auto_804306 ) ) ( not ( = ?auto_804303 ?auto_804307 ) ) ( not ( = ?auto_804303 ?auto_804308 ) ) ( not ( = ?auto_804303 ?auto_804309 ) ) ( not ( = ?auto_804303 ?auto_804310 ) ) ( not ( = ?auto_804303 ?auto_804311 ) ) ( not ( = ?auto_804304 ?auto_804305 ) ) ( not ( = ?auto_804304 ?auto_804306 ) ) ( not ( = ?auto_804304 ?auto_804307 ) ) ( not ( = ?auto_804304 ?auto_804308 ) ) ( not ( = ?auto_804304 ?auto_804309 ) ) ( not ( = ?auto_804304 ?auto_804310 ) ) ( not ( = ?auto_804304 ?auto_804311 ) ) ( not ( = ?auto_804305 ?auto_804306 ) ) ( not ( = ?auto_804305 ?auto_804307 ) ) ( not ( = ?auto_804305 ?auto_804308 ) ) ( not ( = ?auto_804305 ?auto_804309 ) ) ( not ( = ?auto_804305 ?auto_804310 ) ) ( not ( = ?auto_804305 ?auto_804311 ) ) ( not ( = ?auto_804306 ?auto_804307 ) ) ( not ( = ?auto_804306 ?auto_804308 ) ) ( not ( = ?auto_804306 ?auto_804309 ) ) ( not ( = ?auto_804306 ?auto_804310 ) ) ( not ( = ?auto_804306 ?auto_804311 ) ) ( not ( = ?auto_804307 ?auto_804308 ) ) ( not ( = ?auto_804307 ?auto_804309 ) ) ( not ( = ?auto_804307 ?auto_804310 ) ) ( not ( = ?auto_804307 ?auto_804311 ) ) ( not ( = ?auto_804308 ?auto_804309 ) ) ( not ( = ?auto_804308 ?auto_804310 ) ) ( not ( = ?auto_804308 ?auto_804311 ) ) ( not ( = ?auto_804309 ?auto_804310 ) ) ( not ( = ?auto_804309 ?auto_804311 ) ) ( not ( = ?auto_804310 ?auto_804311 ) ) ( ON ?auto_804309 ?auto_804310 ) ( ON ?auto_804308 ?auto_804309 ) ( ON ?auto_804307 ?auto_804308 ) ( ON ?auto_804306 ?auto_804307 ) ( CLEAR ?auto_804304 ) ( ON ?auto_804305 ?auto_804306 ) ( CLEAR ?auto_804305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_804298 ?auto_804299 ?auto_804300 ?auto_804301 ?auto_804302 ?auto_804303 ?auto_804304 ?auto_804305 )
      ( MAKE-13PILE ?auto_804298 ?auto_804299 ?auto_804300 ?auto_804301 ?auto_804302 ?auto_804303 ?auto_804304 ?auto_804305 ?auto_804306 ?auto_804307 ?auto_804308 ?auto_804309 ?auto_804310 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804352 - BLOCK
      ?auto_804353 - BLOCK
      ?auto_804354 - BLOCK
      ?auto_804355 - BLOCK
      ?auto_804356 - BLOCK
      ?auto_804357 - BLOCK
      ?auto_804358 - BLOCK
      ?auto_804359 - BLOCK
      ?auto_804360 - BLOCK
      ?auto_804361 - BLOCK
      ?auto_804362 - BLOCK
      ?auto_804363 - BLOCK
      ?auto_804364 - BLOCK
    )
    :vars
    (
      ?auto_804365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804364 ?auto_804365 ) ( ON-TABLE ?auto_804352 ) ( ON ?auto_804353 ?auto_804352 ) ( ON ?auto_804354 ?auto_804353 ) ( ON ?auto_804355 ?auto_804354 ) ( ON ?auto_804356 ?auto_804355 ) ( ON ?auto_804357 ?auto_804356 ) ( not ( = ?auto_804352 ?auto_804353 ) ) ( not ( = ?auto_804352 ?auto_804354 ) ) ( not ( = ?auto_804352 ?auto_804355 ) ) ( not ( = ?auto_804352 ?auto_804356 ) ) ( not ( = ?auto_804352 ?auto_804357 ) ) ( not ( = ?auto_804352 ?auto_804358 ) ) ( not ( = ?auto_804352 ?auto_804359 ) ) ( not ( = ?auto_804352 ?auto_804360 ) ) ( not ( = ?auto_804352 ?auto_804361 ) ) ( not ( = ?auto_804352 ?auto_804362 ) ) ( not ( = ?auto_804352 ?auto_804363 ) ) ( not ( = ?auto_804352 ?auto_804364 ) ) ( not ( = ?auto_804352 ?auto_804365 ) ) ( not ( = ?auto_804353 ?auto_804354 ) ) ( not ( = ?auto_804353 ?auto_804355 ) ) ( not ( = ?auto_804353 ?auto_804356 ) ) ( not ( = ?auto_804353 ?auto_804357 ) ) ( not ( = ?auto_804353 ?auto_804358 ) ) ( not ( = ?auto_804353 ?auto_804359 ) ) ( not ( = ?auto_804353 ?auto_804360 ) ) ( not ( = ?auto_804353 ?auto_804361 ) ) ( not ( = ?auto_804353 ?auto_804362 ) ) ( not ( = ?auto_804353 ?auto_804363 ) ) ( not ( = ?auto_804353 ?auto_804364 ) ) ( not ( = ?auto_804353 ?auto_804365 ) ) ( not ( = ?auto_804354 ?auto_804355 ) ) ( not ( = ?auto_804354 ?auto_804356 ) ) ( not ( = ?auto_804354 ?auto_804357 ) ) ( not ( = ?auto_804354 ?auto_804358 ) ) ( not ( = ?auto_804354 ?auto_804359 ) ) ( not ( = ?auto_804354 ?auto_804360 ) ) ( not ( = ?auto_804354 ?auto_804361 ) ) ( not ( = ?auto_804354 ?auto_804362 ) ) ( not ( = ?auto_804354 ?auto_804363 ) ) ( not ( = ?auto_804354 ?auto_804364 ) ) ( not ( = ?auto_804354 ?auto_804365 ) ) ( not ( = ?auto_804355 ?auto_804356 ) ) ( not ( = ?auto_804355 ?auto_804357 ) ) ( not ( = ?auto_804355 ?auto_804358 ) ) ( not ( = ?auto_804355 ?auto_804359 ) ) ( not ( = ?auto_804355 ?auto_804360 ) ) ( not ( = ?auto_804355 ?auto_804361 ) ) ( not ( = ?auto_804355 ?auto_804362 ) ) ( not ( = ?auto_804355 ?auto_804363 ) ) ( not ( = ?auto_804355 ?auto_804364 ) ) ( not ( = ?auto_804355 ?auto_804365 ) ) ( not ( = ?auto_804356 ?auto_804357 ) ) ( not ( = ?auto_804356 ?auto_804358 ) ) ( not ( = ?auto_804356 ?auto_804359 ) ) ( not ( = ?auto_804356 ?auto_804360 ) ) ( not ( = ?auto_804356 ?auto_804361 ) ) ( not ( = ?auto_804356 ?auto_804362 ) ) ( not ( = ?auto_804356 ?auto_804363 ) ) ( not ( = ?auto_804356 ?auto_804364 ) ) ( not ( = ?auto_804356 ?auto_804365 ) ) ( not ( = ?auto_804357 ?auto_804358 ) ) ( not ( = ?auto_804357 ?auto_804359 ) ) ( not ( = ?auto_804357 ?auto_804360 ) ) ( not ( = ?auto_804357 ?auto_804361 ) ) ( not ( = ?auto_804357 ?auto_804362 ) ) ( not ( = ?auto_804357 ?auto_804363 ) ) ( not ( = ?auto_804357 ?auto_804364 ) ) ( not ( = ?auto_804357 ?auto_804365 ) ) ( not ( = ?auto_804358 ?auto_804359 ) ) ( not ( = ?auto_804358 ?auto_804360 ) ) ( not ( = ?auto_804358 ?auto_804361 ) ) ( not ( = ?auto_804358 ?auto_804362 ) ) ( not ( = ?auto_804358 ?auto_804363 ) ) ( not ( = ?auto_804358 ?auto_804364 ) ) ( not ( = ?auto_804358 ?auto_804365 ) ) ( not ( = ?auto_804359 ?auto_804360 ) ) ( not ( = ?auto_804359 ?auto_804361 ) ) ( not ( = ?auto_804359 ?auto_804362 ) ) ( not ( = ?auto_804359 ?auto_804363 ) ) ( not ( = ?auto_804359 ?auto_804364 ) ) ( not ( = ?auto_804359 ?auto_804365 ) ) ( not ( = ?auto_804360 ?auto_804361 ) ) ( not ( = ?auto_804360 ?auto_804362 ) ) ( not ( = ?auto_804360 ?auto_804363 ) ) ( not ( = ?auto_804360 ?auto_804364 ) ) ( not ( = ?auto_804360 ?auto_804365 ) ) ( not ( = ?auto_804361 ?auto_804362 ) ) ( not ( = ?auto_804361 ?auto_804363 ) ) ( not ( = ?auto_804361 ?auto_804364 ) ) ( not ( = ?auto_804361 ?auto_804365 ) ) ( not ( = ?auto_804362 ?auto_804363 ) ) ( not ( = ?auto_804362 ?auto_804364 ) ) ( not ( = ?auto_804362 ?auto_804365 ) ) ( not ( = ?auto_804363 ?auto_804364 ) ) ( not ( = ?auto_804363 ?auto_804365 ) ) ( not ( = ?auto_804364 ?auto_804365 ) ) ( ON ?auto_804363 ?auto_804364 ) ( ON ?auto_804362 ?auto_804363 ) ( ON ?auto_804361 ?auto_804362 ) ( ON ?auto_804360 ?auto_804361 ) ( ON ?auto_804359 ?auto_804360 ) ( CLEAR ?auto_804357 ) ( ON ?auto_804358 ?auto_804359 ) ( CLEAR ?auto_804358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_804352 ?auto_804353 ?auto_804354 ?auto_804355 ?auto_804356 ?auto_804357 ?auto_804358 )
      ( MAKE-13PILE ?auto_804352 ?auto_804353 ?auto_804354 ?auto_804355 ?auto_804356 ?auto_804357 ?auto_804358 ?auto_804359 ?auto_804360 ?auto_804361 ?auto_804362 ?auto_804363 ?auto_804364 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804406 - BLOCK
      ?auto_804407 - BLOCK
      ?auto_804408 - BLOCK
      ?auto_804409 - BLOCK
      ?auto_804410 - BLOCK
      ?auto_804411 - BLOCK
      ?auto_804412 - BLOCK
      ?auto_804413 - BLOCK
      ?auto_804414 - BLOCK
      ?auto_804415 - BLOCK
      ?auto_804416 - BLOCK
      ?auto_804417 - BLOCK
      ?auto_804418 - BLOCK
    )
    :vars
    (
      ?auto_804419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804418 ?auto_804419 ) ( ON-TABLE ?auto_804406 ) ( ON ?auto_804407 ?auto_804406 ) ( ON ?auto_804408 ?auto_804407 ) ( ON ?auto_804409 ?auto_804408 ) ( ON ?auto_804410 ?auto_804409 ) ( not ( = ?auto_804406 ?auto_804407 ) ) ( not ( = ?auto_804406 ?auto_804408 ) ) ( not ( = ?auto_804406 ?auto_804409 ) ) ( not ( = ?auto_804406 ?auto_804410 ) ) ( not ( = ?auto_804406 ?auto_804411 ) ) ( not ( = ?auto_804406 ?auto_804412 ) ) ( not ( = ?auto_804406 ?auto_804413 ) ) ( not ( = ?auto_804406 ?auto_804414 ) ) ( not ( = ?auto_804406 ?auto_804415 ) ) ( not ( = ?auto_804406 ?auto_804416 ) ) ( not ( = ?auto_804406 ?auto_804417 ) ) ( not ( = ?auto_804406 ?auto_804418 ) ) ( not ( = ?auto_804406 ?auto_804419 ) ) ( not ( = ?auto_804407 ?auto_804408 ) ) ( not ( = ?auto_804407 ?auto_804409 ) ) ( not ( = ?auto_804407 ?auto_804410 ) ) ( not ( = ?auto_804407 ?auto_804411 ) ) ( not ( = ?auto_804407 ?auto_804412 ) ) ( not ( = ?auto_804407 ?auto_804413 ) ) ( not ( = ?auto_804407 ?auto_804414 ) ) ( not ( = ?auto_804407 ?auto_804415 ) ) ( not ( = ?auto_804407 ?auto_804416 ) ) ( not ( = ?auto_804407 ?auto_804417 ) ) ( not ( = ?auto_804407 ?auto_804418 ) ) ( not ( = ?auto_804407 ?auto_804419 ) ) ( not ( = ?auto_804408 ?auto_804409 ) ) ( not ( = ?auto_804408 ?auto_804410 ) ) ( not ( = ?auto_804408 ?auto_804411 ) ) ( not ( = ?auto_804408 ?auto_804412 ) ) ( not ( = ?auto_804408 ?auto_804413 ) ) ( not ( = ?auto_804408 ?auto_804414 ) ) ( not ( = ?auto_804408 ?auto_804415 ) ) ( not ( = ?auto_804408 ?auto_804416 ) ) ( not ( = ?auto_804408 ?auto_804417 ) ) ( not ( = ?auto_804408 ?auto_804418 ) ) ( not ( = ?auto_804408 ?auto_804419 ) ) ( not ( = ?auto_804409 ?auto_804410 ) ) ( not ( = ?auto_804409 ?auto_804411 ) ) ( not ( = ?auto_804409 ?auto_804412 ) ) ( not ( = ?auto_804409 ?auto_804413 ) ) ( not ( = ?auto_804409 ?auto_804414 ) ) ( not ( = ?auto_804409 ?auto_804415 ) ) ( not ( = ?auto_804409 ?auto_804416 ) ) ( not ( = ?auto_804409 ?auto_804417 ) ) ( not ( = ?auto_804409 ?auto_804418 ) ) ( not ( = ?auto_804409 ?auto_804419 ) ) ( not ( = ?auto_804410 ?auto_804411 ) ) ( not ( = ?auto_804410 ?auto_804412 ) ) ( not ( = ?auto_804410 ?auto_804413 ) ) ( not ( = ?auto_804410 ?auto_804414 ) ) ( not ( = ?auto_804410 ?auto_804415 ) ) ( not ( = ?auto_804410 ?auto_804416 ) ) ( not ( = ?auto_804410 ?auto_804417 ) ) ( not ( = ?auto_804410 ?auto_804418 ) ) ( not ( = ?auto_804410 ?auto_804419 ) ) ( not ( = ?auto_804411 ?auto_804412 ) ) ( not ( = ?auto_804411 ?auto_804413 ) ) ( not ( = ?auto_804411 ?auto_804414 ) ) ( not ( = ?auto_804411 ?auto_804415 ) ) ( not ( = ?auto_804411 ?auto_804416 ) ) ( not ( = ?auto_804411 ?auto_804417 ) ) ( not ( = ?auto_804411 ?auto_804418 ) ) ( not ( = ?auto_804411 ?auto_804419 ) ) ( not ( = ?auto_804412 ?auto_804413 ) ) ( not ( = ?auto_804412 ?auto_804414 ) ) ( not ( = ?auto_804412 ?auto_804415 ) ) ( not ( = ?auto_804412 ?auto_804416 ) ) ( not ( = ?auto_804412 ?auto_804417 ) ) ( not ( = ?auto_804412 ?auto_804418 ) ) ( not ( = ?auto_804412 ?auto_804419 ) ) ( not ( = ?auto_804413 ?auto_804414 ) ) ( not ( = ?auto_804413 ?auto_804415 ) ) ( not ( = ?auto_804413 ?auto_804416 ) ) ( not ( = ?auto_804413 ?auto_804417 ) ) ( not ( = ?auto_804413 ?auto_804418 ) ) ( not ( = ?auto_804413 ?auto_804419 ) ) ( not ( = ?auto_804414 ?auto_804415 ) ) ( not ( = ?auto_804414 ?auto_804416 ) ) ( not ( = ?auto_804414 ?auto_804417 ) ) ( not ( = ?auto_804414 ?auto_804418 ) ) ( not ( = ?auto_804414 ?auto_804419 ) ) ( not ( = ?auto_804415 ?auto_804416 ) ) ( not ( = ?auto_804415 ?auto_804417 ) ) ( not ( = ?auto_804415 ?auto_804418 ) ) ( not ( = ?auto_804415 ?auto_804419 ) ) ( not ( = ?auto_804416 ?auto_804417 ) ) ( not ( = ?auto_804416 ?auto_804418 ) ) ( not ( = ?auto_804416 ?auto_804419 ) ) ( not ( = ?auto_804417 ?auto_804418 ) ) ( not ( = ?auto_804417 ?auto_804419 ) ) ( not ( = ?auto_804418 ?auto_804419 ) ) ( ON ?auto_804417 ?auto_804418 ) ( ON ?auto_804416 ?auto_804417 ) ( ON ?auto_804415 ?auto_804416 ) ( ON ?auto_804414 ?auto_804415 ) ( ON ?auto_804413 ?auto_804414 ) ( ON ?auto_804412 ?auto_804413 ) ( CLEAR ?auto_804410 ) ( ON ?auto_804411 ?auto_804412 ) ( CLEAR ?auto_804411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_804406 ?auto_804407 ?auto_804408 ?auto_804409 ?auto_804410 ?auto_804411 )
      ( MAKE-13PILE ?auto_804406 ?auto_804407 ?auto_804408 ?auto_804409 ?auto_804410 ?auto_804411 ?auto_804412 ?auto_804413 ?auto_804414 ?auto_804415 ?auto_804416 ?auto_804417 ?auto_804418 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804460 - BLOCK
      ?auto_804461 - BLOCK
      ?auto_804462 - BLOCK
      ?auto_804463 - BLOCK
      ?auto_804464 - BLOCK
      ?auto_804465 - BLOCK
      ?auto_804466 - BLOCK
      ?auto_804467 - BLOCK
      ?auto_804468 - BLOCK
      ?auto_804469 - BLOCK
      ?auto_804470 - BLOCK
      ?auto_804471 - BLOCK
      ?auto_804472 - BLOCK
    )
    :vars
    (
      ?auto_804473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804472 ?auto_804473 ) ( ON-TABLE ?auto_804460 ) ( ON ?auto_804461 ?auto_804460 ) ( ON ?auto_804462 ?auto_804461 ) ( ON ?auto_804463 ?auto_804462 ) ( not ( = ?auto_804460 ?auto_804461 ) ) ( not ( = ?auto_804460 ?auto_804462 ) ) ( not ( = ?auto_804460 ?auto_804463 ) ) ( not ( = ?auto_804460 ?auto_804464 ) ) ( not ( = ?auto_804460 ?auto_804465 ) ) ( not ( = ?auto_804460 ?auto_804466 ) ) ( not ( = ?auto_804460 ?auto_804467 ) ) ( not ( = ?auto_804460 ?auto_804468 ) ) ( not ( = ?auto_804460 ?auto_804469 ) ) ( not ( = ?auto_804460 ?auto_804470 ) ) ( not ( = ?auto_804460 ?auto_804471 ) ) ( not ( = ?auto_804460 ?auto_804472 ) ) ( not ( = ?auto_804460 ?auto_804473 ) ) ( not ( = ?auto_804461 ?auto_804462 ) ) ( not ( = ?auto_804461 ?auto_804463 ) ) ( not ( = ?auto_804461 ?auto_804464 ) ) ( not ( = ?auto_804461 ?auto_804465 ) ) ( not ( = ?auto_804461 ?auto_804466 ) ) ( not ( = ?auto_804461 ?auto_804467 ) ) ( not ( = ?auto_804461 ?auto_804468 ) ) ( not ( = ?auto_804461 ?auto_804469 ) ) ( not ( = ?auto_804461 ?auto_804470 ) ) ( not ( = ?auto_804461 ?auto_804471 ) ) ( not ( = ?auto_804461 ?auto_804472 ) ) ( not ( = ?auto_804461 ?auto_804473 ) ) ( not ( = ?auto_804462 ?auto_804463 ) ) ( not ( = ?auto_804462 ?auto_804464 ) ) ( not ( = ?auto_804462 ?auto_804465 ) ) ( not ( = ?auto_804462 ?auto_804466 ) ) ( not ( = ?auto_804462 ?auto_804467 ) ) ( not ( = ?auto_804462 ?auto_804468 ) ) ( not ( = ?auto_804462 ?auto_804469 ) ) ( not ( = ?auto_804462 ?auto_804470 ) ) ( not ( = ?auto_804462 ?auto_804471 ) ) ( not ( = ?auto_804462 ?auto_804472 ) ) ( not ( = ?auto_804462 ?auto_804473 ) ) ( not ( = ?auto_804463 ?auto_804464 ) ) ( not ( = ?auto_804463 ?auto_804465 ) ) ( not ( = ?auto_804463 ?auto_804466 ) ) ( not ( = ?auto_804463 ?auto_804467 ) ) ( not ( = ?auto_804463 ?auto_804468 ) ) ( not ( = ?auto_804463 ?auto_804469 ) ) ( not ( = ?auto_804463 ?auto_804470 ) ) ( not ( = ?auto_804463 ?auto_804471 ) ) ( not ( = ?auto_804463 ?auto_804472 ) ) ( not ( = ?auto_804463 ?auto_804473 ) ) ( not ( = ?auto_804464 ?auto_804465 ) ) ( not ( = ?auto_804464 ?auto_804466 ) ) ( not ( = ?auto_804464 ?auto_804467 ) ) ( not ( = ?auto_804464 ?auto_804468 ) ) ( not ( = ?auto_804464 ?auto_804469 ) ) ( not ( = ?auto_804464 ?auto_804470 ) ) ( not ( = ?auto_804464 ?auto_804471 ) ) ( not ( = ?auto_804464 ?auto_804472 ) ) ( not ( = ?auto_804464 ?auto_804473 ) ) ( not ( = ?auto_804465 ?auto_804466 ) ) ( not ( = ?auto_804465 ?auto_804467 ) ) ( not ( = ?auto_804465 ?auto_804468 ) ) ( not ( = ?auto_804465 ?auto_804469 ) ) ( not ( = ?auto_804465 ?auto_804470 ) ) ( not ( = ?auto_804465 ?auto_804471 ) ) ( not ( = ?auto_804465 ?auto_804472 ) ) ( not ( = ?auto_804465 ?auto_804473 ) ) ( not ( = ?auto_804466 ?auto_804467 ) ) ( not ( = ?auto_804466 ?auto_804468 ) ) ( not ( = ?auto_804466 ?auto_804469 ) ) ( not ( = ?auto_804466 ?auto_804470 ) ) ( not ( = ?auto_804466 ?auto_804471 ) ) ( not ( = ?auto_804466 ?auto_804472 ) ) ( not ( = ?auto_804466 ?auto_804473 ) ) ( not ( = ?auto_804467 ?auto_804468 ) ) ( not ( = ?auto_804467 ?auto_804469 ) ) ( not ( = ?auto_804467 ?auto_804470 ) ) ( not ( = ?auto_804467 ?auto_804471 ) ) ( not ( = ?auto_804467 ?auto_804472 ) ) ( not ( = ?auto_804467 ?auto_804473 ) ) ( not ( = ?auto_804468 ?auto_804469 ) ) ( not ( = ?auto_804468 ?auto_804470 ) ) ( not ( = ?auto_804468 ?auto_804471 ) ) ( not ( = ?auto_804468 ?auto_804472 ) ) ( not ( = ?auto_804468 ?auto_804473 ) ) ( not ( = ?auto_804469 ?auto_804470 ) ) ( not ( = ?auto_804469 ?auto_804471 ) ) ( not ( = ?auto_804469 ?auto_804472 ) ) ( not ( = ?auto_804469 ?auto_804473 ) ) ( not ( = ?auto_804470 ?auto_804471 ) ) ( not ( = ?auto_804470 ?auto_804472 ) ) ( not ( = ?auto_804470 ?auto_804473 ) ) ( not ( = ?auto_804471 ?auto_804472 ) ) ( not ( = ?auto_804471 ?auto_804473 ) ) ( not ( = ?auto_804472 ?auto_804473 ) ) ( ON ?auto_804471 ?auto_804472 ) ( ON ?auto_804470 ?auto_804471 ) ( ON ?auto_804469 ?auto_804470 ) ( ON ?auto_804468 ?auto_804469 ) ( ON ?auto_804467 ?auto_804468 ) ( ON ?auto_804466 ?auto_804467 ) ( ON ?auto_804465 ?auto_804466 ) ( CLEAR ?auto_804463 ) ( ON ?auto_804464 ?auto_804465 ) ( CLEAR ?auto_804464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_804460 ?auto_804461 ?auto_804462 ?auto_804463 ?auto_804464 )
      ( MAKE-13PILE ?auto_804460 ?auto_804461 ?auto_804462 ?auto_804463 ?auto_804464 ?auto_804465 ?auto_804466 ?auto_804467 ?auto_804468 ?auto_804469 ?auto_804470 ?auto_804471 ?auto_804472 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804514 - BLOCK
      ?auto_804515 - BLOCK
      ?auto_804516 - BLOCK
      ?auto_804517 - BLOCK
      ?auto_804518 - BLOCK
      ?auto_804519 - BLOCK
      ?auto_804520 - BLOCK
      ?auto_804521 - BLOCK
      ?auto_804522 - BLOCK
      ?auto_804523 - BLOCK
      ?auto_804524 - BLOCK
      ?auto_804525 - BLOCK
      ?auto_804526 - BLOCK
    )
    :vars
    (
      ?auto_804527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804526 ?auto_804527 ) ( ON-TABLE ?auto_804514 ) ( ON ?auto_804515 ?auto_804514 ) ( ON ?auto_804516 ?auto_804515 ) ( not ( = ?auto_804514 ?auto_804515 ) ) ( not ( = ?auto_804514 ?auto_804516 ) ) ( not ( = ?auto_804514 ?auto_804517 ) ) ( not ( = ?auto_804514 ?auto_804518 ) ) ( not ( = ?auto_804514 ?auto_804519 ) ) ( not ( = ?auto_804514 ?auto_804520 ) ) ( not ( = ?auto_804514 ?auto_804521 ) ) ( not ( = ?auto_804514 ?auto_804522 ) ) ( not ( = ?auto_804514 ?auto_804523 ) ) ( not ( = ?auto_804514 ?auto_804524 ) ) ( not ( = ?auto_804514 ?auto_804525 ) ) ( not ( = ?auto_804514 ?auto_804526 ) ) ( not ( = ?auto_804514 ?auto_804527 ) ) ( not ( = ?auto_804515 ?auto_804516 ) ) ( not ( = ?auto_804515 ?auto_804517 ) ) ( not ( = ?auto_804515 ?auto_804518 ) ) ( not ( = ?auto_804515 ?auto_804519 ) ) ( not ( = ?auto_804515 ?auto_804520 ) ) ( not ( = ?auto_804515 ?auto_804521 ) ) ( not ( = ?auto_804515 ?auto_804522 ) ) ( not ( = ?auto_804515 ?auto_804523 ) ) ( not ( = ?auto_804515 ?auto_804524 ) ) ( not ( = ?auto_804515 ?auto_804525 ) ) ( not ( = ?auto_804515 ?auto_804526 ) ) ( not ( = ?auto_804515 ?auto_804527 ) ) ( not ( = ?auto_804516 ?auto_804517 ) ) ( not ( = ?auto_804516 ?auto_804518 ) ) ( not ( = ?auto_804516 ?auto_804519 ) ) ( not ( = ?auto_804516 ?auto_804520 ) ) ( not ( = ?auto_804516 ?auto_804521 ) ) ( not ( = ?auto_804516 ?auto_804522 ) ) ( not ( = ?auto_804516 ?auto_804523 ) ) ( not ( = ?auto_804516 ?auto_804524 ) ) ( not ( = ?auto_804516 ?auto_804525 ) ) ( not ( = ?auto_804516 ?auto_804526 ) ) ( not ( = ?auto_804516 ?auto_804527 ) ) ( not ( = ?auto_804517 ?auto_804518 ) ) ( not ( = ?auto_804517 ?auto_804519 ) ) ( not ( = ?auto_804517 ?auto_804520 ) ) ( not ( = ?auto_804517 ?auto_804521 ) ) ( not ( = ?auto_804517 ?auto_804522 ) ) ( not ( = ?auto_804517 ?auto_804523 ) ) ( not ( = ?auto_804517 ?auto_804524 ) ) ( not ( = ?auto_804517 ?auto_804525 ) ) ( not ( = ?auto_804517 ?auto_804526 ) ) ( not ( = ?auto_804517 ?auto_804527 ) ) ( not ( = ?auto_804518 ?auto_804519 ) ) ( not ( = ?auto_804518 ?auto_804520 ) ) ( not ( = ?auto_804518 ?auto_804521 ) ) ( not ( = ?auto_804518 ?auto_804522 ) ) ( not ( = ?auto_804518 ?auto_804523 ) ) ( not ( = ?auto_804518 ?auto_804524 ) ) ( not ( = ?auto_804518 ?auto_804525 ) ) ( not ( = ?auto_804518 ?auto_804526 ) ) ( not ( = ?auto_804518 ?auto_804527 ) ) ( not ( = ?auto_804519 ?auto_804520 ) ) ( not ( = ?auto_804519 ?auto_804521 ) ) ( not ( = ?auto_804519 ?auto_804522 ) ) ( not ( = ?auto_804519 ?auto_804523 ) ) ( not ( = ?auto_804519 ?auto_804524 ) ) ( not ( = ?auto_804519 ?auto_804525 ) ) ( not ( = ?auto_804519 ?auto_804526 ) ) ( not ( = ?auto_804519 ?auto_804527 ) ) ( not ( = ?auto_804520 ?auto_804521 ) ) ( not ( = ?auto_804520 ?auto_804522 ) ) ( not ( = ?auto_804520 ?auto_804523 ) ) ( not ( = ?auto_804520 ?auto_804524 ) ) ( not ( = ?auto_804520 ?auto_804525 ) ) ( not ( = ?auto_804520 ?auto_804526 ) ) ( not ( = ?auto_804520 ?auto_804527 ) ) ( not ( = ?auto_804521 ?auto_804522 ) ) ( not ( = ?auto_804521 ?auto_804523 ) ) ( not ( = ?auto_804521 ?auto_804524 ) ) ( not ( = ?auto_804521 ?auto_804525 ) ) ( not ( = ?auto_804521 ?auto_804526 ) ) ( not ( = ?auto_804521 ?auto_804527 ) ) ( not ( = ?auto_804522 ?auto_804523 ) ) ( not ( = ?auto_804522 ?auto_804524 ) ) ( not ( = ?auto_804522 ?auto_804525 ) ) ( not ( = ?auto_804522 ?auto_804526 ) ) ( not ( = ?auto_804522 ?auto_804527 ) ) ( not ( = ?auto_804523 ?auto_804524 ) ) ( not ( = ?auto_804523 ?auto_804525 ) ) ( not ( = ?auto_804523 ?auto_804526 ) ) ( not ( = ?auto_804523 ?auto_804527 ) ) ( not ( = ?auto_804524 ?auto_804525 ) ) ( not ( = ?auto_804524 ?auto_804526 ) ) ( not ( = ?auto_804524 ?auto_804527 ) ) ( not ( = ?auto_804525 ?auto_804526 ) ) ( not ( = ?auto_804525 ?auto_804527 ) ) ( not ( = ?auto_804526 ?auto_804527 ) ) ( ON ?auto_804525 ?auto_804526 ) ( ON ?auto_804524 ?auto_804525 ) ( ON ?auto_804523 ?auto_804524 ) ( ON ?auto_804522 ?auto_804523 ) ( ON ?auto_804521 ?auto_804522 ) ( ON ?auto_804520 ?auto_804521 ) ( ON ?auto_804519 ?auto_804520 ) ( ON ?auto_804518 ?auto_804519 ) ( CLEAR ?auto_804516 ) ( ON ?auto_804517 ?auto_804518 ) ( CLEAR ?auto_804517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_804514 ?auto_804515 ?auto_804516 ?auto_804517 )
      ( MAKE-13PILE ?auto_804514 ?auto_804515 ?auto_804516 ?auto_804517 ?auto_804518 ?auto_804519 ?auto_804520 ?auto_804521 ?auto_804522 ?auto_804523 ?auto_804524 ?auto_804525 ?auto_804526 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804568 - BLOCK
      ?auto_804569 - BLOCK
      ?auto_804570 - BLOCK
      ?auto_804571 - BLOCK
      ?auto_804572 - BLOCK
      ?auto_804573 - BLOCK
      ?auto_804574 - BLOCK
      ?auto_804575 - BLOCK
      ?auto_804576 - BLOCK
      ?auto_804577 - BLOCK
      ?auto_804578 - BLOCK
      ?auto_804579 - BLOCK
      ?auto_804580 - BLOCK
    )
    :vars
    (
      ?auto_804581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804580 ?auto_804581 ) ( ON-TABLE ?auto_804568 ) ( ON ?auto_804569 ?auto_804568 ) ( not ( = ?auto_804568 ?auto_804569 ) ) ( not ( = ?auto_804568 ?auto_804570 ) ) ( not ( = ?auto_804568 ?auto_804571 ) ) ( not ( = ?auto_804568 ?auto_804572 ) ) ( not ( = ?auto_804568 ?auto_804573 ) ) ( not ( = ?auto_804568 ?auto_804574 ) ) ( not ( = ?auto_804568 ?auto_804575 ) ) ( not ( = ?auto_804568 ?auto_804576 ) ) ( not ( = ?auto_804568 ?auto_804577 ) ) ( not ( = ?auto_804568 ?auto_804578 ) ) ( not ( = ?auto_804568 ?auto_804579 ) ) ( not ( = ?auto_804568 ?auto_804580 ) ) ( not ( = ?auto_804568 ?auto_804581 ) ) ( not ( = ?auto_804569 ?auto_804570 ) ) ( not ( = ?auto_804569 ?auto_804571 ) ) ( not ( = ?auto_804569 ?auto_804572 ) ) ( not ( = ?auto_804569 ?auto_804573 ) ) ( not ( = ?auto_804569 ?auto_804574 ) ) ( not ( = ?auto_804569 ?auto_804575 ) ) ( not ( = ?auto_804569 ?auto_804576 ) ) ( not ( = ?auto_804569 ?auto_804577 ) ) ( not ( = ?auto_804569 ?auto_804578 ) ) ( not ( = ?auto_804569 ?auto_804579 ) ) ( not ( = ?auto_804569 ?auto_804580 ) ) ( not ( = ?auto_804569 ?auto_804581 ) ) ( not ( = ?auto_804570 ?auto_804571 ) ) ( not ( = ?auto_804570 ?auto_804572 ) ) ( not ( = ?auto_804570 ?auto_804573 ) ) ( not ( = ?auto_804570 ?auto_804574 ) ) ( not ( = ?auto_804570 ?auto_804575 ) ) ( not ( = ?auto_804570 ?auto_804576 ) ) ( not ( = ?auto_804570 ?auto_804577 ) ) ( not ( = ?auto_804570 ?auto_804578 ) ) ( not ( = ?auto_804570 ?auto_804579 ) ) ( not ( = ?auto_804570 ?auto_804580 ) ) ( not ( = ?auto_804570 ?auto_804581 ) ) ( not ( = ?auto_804571 ?auto_804572 ) ) ( not ( = ?auto_804571 ?auto_804573 ) ) ( not ( = ?auto_804571 ?auto_804574 ) ) ( not ( = ?auto_804571 ?auto_804575 ) ) ( not ( = ?auto_804571 ?auto_804576 ) ) ( not ( = ?auto_804571 ?auto_804577 ) ) ( not ( = ?auto_804571 ?auto_804578 ) ) ( not ( = ?auto_804571 ?auto_804579 ) ) ( not ( = ?auto_804571 ?auto_804580 ) ) ( not ( = ?auto_804571 ?auto_804581 ) ) ( not ( = ?auto_804572 ?auto_804573 ) ) ( not ( = ?auto_804572 ?auto_804574 ) ) ( not ( = ?auto_804572 ?auto_804575 ) ) ( not ( = ?auto_804572 ?auto_804576 ) ) ( not ( = ?auto_804572 ?auto_804577 ) ) ( not ( = ?auto_804572 ?auto_804578 ) ) ( not ( = ?auto_804572 ?auto_804579 ) ) ( not ( = ?auto_804572 ?auto_804580 ) ) ( not ( = ?auto_804572 ?auto_804581 ) ) ( not ( = ?auto_804573 ?auto_804574 ) ) ( not ( = ?auto_804573 ?auto_804575 ) ) ( not ( = ?auto_804573 ?auto_804576 ) ) ( not ( = ?auto_804573 ?auto_804577 ) ) ( not ( = ?auto_804573 ?auto_804578 ) ) ( not ( = ?auto_804573 ?auto_804579 ) ) ( not ( = ?auto_804573 ?auto_804580 ) ) ( not ( = ?auto_804573 ?auto_804581 ) ) ( not ( = ?auto_804574 ?auto_804575 ) ) ( not ( = ?auto_804574 ?auto_804576 ) ) ( not ( = ?auto_804574 ?auto_804577 ) ) ( not ( = ?auto_804574 ?auto_804578 ) ) ( not ( = ?auto_804574 ?auto_804579 ) ) ( not ( = ?auto_804574 ?auto_804580 ) ) ( not ( = ?auto_804574 ?auto_804581 ) ) ( not ( = ?auto_804575 ?auto_804576 ) ) ( not ( = ?auto_804575 ?auto_804577 ) ) ( not ( = ?auto_804575 ?auto_804578 ) ) ( not ( = ?auto_804575 ?auto_804579 ) ) ( not ( = ?auto_804575 ?auto_804580 ) ) ( not ( = ?auto_804575 ?auto_804581 ) ) ( not ( = ?auto_804576 ?auto_804577 ) ) ( not ( = ?auto_804576 ?auto_804578 ) ) ( not ( = ?auto_804576 ?auto_804579 ) ) ( not ( = ?auto_804576 ?auto_804580 ) ) ( not ( = ?auto_804576 ?auto_804581 ) ) ( not ( = ?auto_804577 ?auto_804578 ) ) ( not ( = ?auto_804577 ?auto_804579 ) ) ( not ( = ?auto_804577 ?auto_804580 ) ) ( not ( = ?auto_804577 ?auto_804581 ) ) ( not ( = ?auto_804578 ?auto_804579 ) ) ( not ( = ?auto_804578 ?auto_804580 ) ) ( not ( = ?auto_804578 ?auto_804581 ) ) ( not ( = ?auto_804579 ?auto_804580 ) ) ( not ( = ?auto_804579 ?auto_804581 ) ) ( not ( = ?auto_804580 ?auto_804581 ) ) ( ON ?auto_804579 ?auto_804580 ) ( ON ?auto_804578 ?auto_804579 ) ( ON ?auto_804577 ?auto_804578 ) ( ON ?auto_804576 ?auto_804577 ) ( ON ?auto_804575 ?auto_804576 ) ( ON ?auto_804574 ?auto_804575 ) ( ON ?auto_804573 ?auto_804574 ) ( ON ?auto_804572 ?auto_804573 ) ( ON ?auto_804571 ?auto_804572 ) ( CLEAR ?auto_804569 ) ( ON ?auto_804570 ?auto_804571 ) ( CLEAR ?auto_804570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_804568 ?auto_804569 ?auto_804570 )
      ( MAKE-13PILE ?auto_804568 ?auto_804569 ?auto_804570 ?auto_804571 ?auto_804572 ?auto_804573 ?auto_804574 ?auto_804575 ?auto_804576 ?auto_804577 ?auto_804578 ?auto_804579 ?auto_804580 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804622 - BLOCK
      ?auto_804623 - BLOCK
      ?auto_804624 - BLOCK
      ?auto_804625 - BLOCK
      ?auto_804626 - BLOCK
      ?auto_804627 - BLOCK
      ?auto_804628 - BLOCK
      ?auto_804629 - BLOCK
      ?auto_804630 - BLOCK
      ?auto_804631 - BLOCK
      ?auto_804632 - BLOCK
      ?auto_804633 - BLOCK
      ?auto_804634 - BLOCK
    )
    :vars
    (
      ?auto_804635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804634 ?auto_804635 ) ( ON-TABLE ?auto_804622 ) ( not ( = ?auto_804622 ?auto_804623 ) ) ( not ( = ?auto_804622 ?auto_804624 ) ) ( not ( = ?auto_804622 ?auto_804625 ) ) ( not ( = ?auto_804622 ?auto_804626 ) ) ( not ( = ?auto_804622 ?auto_804627 ) ) ( not ( = ?auto_804622 ?auto_804628 ) ) ( not ( = ?auto_804622 ?auto_804629 ) ) ( not ( = ?auto_804622 ?auto_804630 ) ) ( not ( = ?auto_804622 ?auto_804631 ) ) ( not ( = ?auto_804622 ?auto_804632 ) ) ( not ( = ?auto_804622 ?auto_804633 ) ) ( not ( = ?auto_804622 ?auto_804634 ) ) ( not ( = ?auto_804622 ?auto_804635 ) ) ( not ( = ?auto_804623 ?auto_804624 ) ) ( not ( = ?auto_804623 ?auto_804625 ) ) ( not ( = ?auto_804623 ?auto_804626 ) ) ( not ( = ?auto_804623 ?auto_804627 ) ) ( not ( = ?auto_804623 ?auto_804628 ) ) ( not ( = ?auto_804623 ?auto_804629 ) ) ( not ( = ?auto_804623 ?auto_804630 ) ) ( not ( = ?auto_804623 ?auto_804631 ) ) ( not ( = ?auto_804623 ?auto_804632 ) ) ( not ( = ?auto_804623 ?auto_804633 ) ) ( not ( = ?auto_804623 ?auto_804634 ) ) ( not ( = ?auto_804623 ?auto_804635 ) ) ( not ( = ?auto_804624 ?auto_804625 ) ) ( not ( = ?auto_804624 ?auto_804626 ) ) ( not ( = ?auto_804624 ?auto_804627 ) ) ( not ( = ?auto_804624 ?auto_804628 ) ) ( not ( = ?auto_804624 ?auto_804629 ) ) ( not ( = ?auto_804624 ?auto_804630 ) ) ( not ( = ?auto_804624 ?auto_804631 ) ) ( not ( = ?auto_804624 ?auto_804632 ) ) ( not ( = ?auto_804624 ?auto_804633 ) ) ( not ( = ?auto_804624 ?auto_804634 ) ) ( not ( = ?auto_804624 ?auto_804635 ) ) ( not ( = ?auto_804625 ?auto_804626 ) ) ( not ( = ?auto_804625 ?auto_804627 ) ) ( not ( = ?auto_804625 ?auto_804628 ) ) ( not ( = ?auto_804625 ?auto_804629 ) ) ( not ( = ?auto_804625 ?auto_804630 ) ) ( not ( = ?auto_804625 ?auto_804631 ) ) ( not ( = ?auto_804625 ?auto_804632 ) ) ( not ( = ?auto_804625 ?auto_804633 ) ) ( not ( = ?auto_804625 ?auto_804634 ) ) ( not ( = ?auto_804625 ?auto_804635 ) ) ( not ( = ?auto_804626 ?auto_804627 ) ) ( not ( = ?auto_804626 ?auto_804628 ) ) ( not ( = ?auto_804626 ?auto_804629 ) ) ( not ( = ?auto_804626 ?auto_804630 ) ) ( not ( = ?auto_804626 ?auto_804631 ) ) ( not ( = ?auto_804626 ?auto_804632 ) ) ( not ( = ?auto_804626 ?auto_804633 ) ) ( not ( = ?auto_804626 ?auto_804634 ) ) ( not ( = ?auto_804626 ?auto_804635 ) ) ( not ( = ?auto_804627 ?auto_804628 ) ) ( not ( = ?auto_804627 ?auto_804629 ) ) ( not ( = ?auto_804627 ?auto_804630 ) ) ( not ( = ?auto_804627 ?auto_804631 ) ) ( not ( = ?auto_804627 ?auto_804632 ) ) ( not ( = ?auto_804627 ?auto_804633 ) ) ( not ( = ?auto_804627 ?auto_804634 ) ) ( not ( = ?auto_804627 ?auto_804635 ) ) ( not ( = ?auto_804628 ?auto_804629 ) ) ( not ( = ?auto_804628 ?auto_804630 ) ) ( not ( = ?auto_804628 ?auto_804631 ) ) ( not ( = ?auto_804628 ?auto_804632 ) ) ( not ( = ?auto_804628 ?auto_804633 ) ) ( not ( = ?auto_804628 ?auto_804634 ) ) ( not ( = ?auto_804628 ?auto_804635 ) ) ( not ( = ?auto_804629 ?auto_804630 ) ) ( not ( = ?auto_804629 ?auto_804631 ) ) ( not ( = ?auto_804629 ?auto_804632 ) ) ( not ( = ?auto_804629 ?auto_804633 ) ) ( not ( = ?auto_804629 ?auto_804634 ) ) ( not ( = ?auto_804629 ?auto_804635 ) ) ( not ( = ?auto_804630 ?auto_804631 ) ) ( not ( = ?auto_804630 ?auto_804632 ) ) ( not ( = ?auto_804630 ?auto_804633 ) ) ( not ( = ?auto_804630 ?auto_804634 ) ) ( not ( = ?auto_804630 ?auto_804635 ) ) ( not ( = ?auto_804631 ?auto_804632 ) ) ( not ( = ?auto_804631 ?auto_804633 ) ) ( not ( = ?auto_804631 ?auto_804634 ) ) ( not ( = ?auto_804631 ?auto_804635 ) ) ( not ( = ?auto_804632 ?auto_804633 ) ) ( not ( = ?auto_804632 ?auto_804634 ) ) ( not ( = ?auto_804632 ?auto_804635 ) ) ( not ( = ?auto_804633 ?auto_804634 ) ) ( not ( = ?auto_804633 ?auto_804635 ) ) ( not ( = ?auto_804634 ?auto_804635 ) ) ( ON ?auto_804633 ?auto_804634 ) ( ON ?auto_804632 ?auto_804633 ) ( ON ?auto_804631 ?auto_804632 ) ( ON ?auto_804630 ?auto_804631 ) ( ON ?auto_804629 ?auto_804630 ) ( ON ?auto_804628 ?auto_804629 ) ( ON ?auto_804627 ?auto_804628 ) ( ON ?auto_804626 ?auto_804627 ) ( ON ?auto_804625 ?auto_804626 ) ( ON ?auto_804624 ?auto_804625 ) ( CLEAR ?auto_804622 ) ( ON ?auto_804623 ?auto_804624 ) ( CLEAR ?auto_804623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_804622 ?auto_804623 )
      ( MAKE-13PILE ?auto_804622 ?auto_804623 ?auto_804624 ?auto_804625 ?auto_804626 ?auto_804627 ?auto_804628 ?auto_804629 ?auto_804630 ?auto_804631 ?auto_804632 ?auto_804633 ?auto_804634 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_804676 - BLOCK
      ?auto_804677 - BLOCK
      ?auto_804678 - BLOCK
      ?auto_804679 - BLOCK
      ?auto_804680 - BLOCK
      ?auto_804681 - BLOCK
      ?auto_804682 - BLOCK
      ?auto_804683 - BLOCK
      ?auto_804684 - BLOCK
      ?auto_804685 - BLOCK
      ?auto_804686 - BLOCK
      ?auto_804687 - BLOCK
      ?auto_804688 - BLOCK
    )
    :vars
    (
      ?auto_804689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804688 ?auto_804689 ) ( not ( = ?auto_804676 ?auto_804677 ) ) ( not ( = ?auto_804676 ?auto_804678 ) ) ( not ( = ?auto_804676 ?auto_804679 ) ) ( not ( = ?auto_804676 ?auto_804680 ) ) ( not ( = ?auto_804676 ?auto_804681 ) ) ( not ( = ?auto_804676 ?auto_804682 ) ) ( not ( = ?auto_804676 ?auto_804683 ) ) ( not ( = ?auto_804676 ?auto_804684 ) ) ( not ( = ?auto_804676 ?auto_804685 ) ) ( not ( = ?auto_804676 ?auto_804686 ) ) ( not ( = ?auto_804676 ?auto_804687 ) ) ( not ( = ?auto_804676 ?auto_804688 ) ) ( not ( = ?auto_804676 ?auto_804689 ) ) ( not ( = ?auto_804677 ?auto_804678 ) ) ( not ( = ?auto_804677 ?auto_804679 ) ) ( not ( = ?auto_804677 ?auto_804680 ) ) ( not ( = ?auto_804677 ?auto_804681 ) ) ( not ( = ?auto_804677 ?auto_804682 ) ) ( not ( = ?auto_804677 ?auto_804683 ) ) ( not ( = ?auto_804677 ?auto_804684 ) ) ( not ( = ?auto_804677 ?auto_804685 ) ) ( not ( = ?auto_804677 ?auto_804686 ) ) ( not ( = ?auto_804677 ?auto_804687 ) ) ( not ( = ?auto_804677 ?auto_804688 ) ) ( not ( = ?auto_804677 ?auto_804689 ) ) ( not ( = ?auto_804678 ?auto_804679 ) ) ( not ( = ?auto_804678 ?auto_804680 ) ) ( not ( = ?auto_804678 ?auto_804681 ) ) ( not ( = ?auto_804678 ?auto_804682 ) ) ( not ( = ?auto_804678 ?auto_804683 ) ) ( not ( = ?auto_804678 ?auto_804684 ) ) ( not ( = ?auto_804678 ?auto_804685 ) ) ( not ( = ?auto_804678 ?auto_804686 ) ) ( not ( = ?auto_804678 ?auto_804687 ) ) ( not ( = ?auto_804678 ?auto_804688 ) ) ( not ( = ?auto_804678 ?auto_804689 ) ) ( not ( = ?auto_804679 ?auto_804680 ) ) ( not ( = ?auto_804679 ?auto_804681 ) ) ( not ( = ?auto_804679 ?auto_804682 ) ) ( not ( = ?auto_804679 ?auto_804683 ) ) ( not ( = ?auto_804679 ?auto_804684 ) ) ( not ( = ?auto_804679 ?auto_804685 ) ) ( not ( = ?auto_804679 ?auto_804686 ) ) ( not ( = ?auto_804679 ?auto_804687 ) ) ( not ( = ?auto_804679 ?auto_804688 ) ) ( not ( = ?auto_804679 ?auto_804689 ) ) ( not ( = ?auto_804680 ?auto_804681 ) ) ( not ( = ?auto_804680 ?auto_804682 ) ) ( not ( = ?auto_804680 ?auto_804683 ) ) ( not ( = ?auto_804680 ?auto_804684 ) ) ( not ( = ?auto_804680 ?auto_804685 ) ) ( not ( = ?auto_804680 ?auto_804686 ) ) ( not ( = ?auto_804680 ?auto_804687 ) ) ( not ( = ?auto_804680 ?auto_804688 ) ) ( not ( = ?auto_804680 ?auto_804689 ) ) ( not ( = ?auto_804681 ?auto_804682 ) ) ( not ( = ?auto_804681 ?auto_804683 ) ) ( not ( = ?auto_804681 ?auto_804684 ) ) ( not ( = ?auto_804681 ?auto_804685 ) ) ( not ( = ?auto_804681 ?auto_804686 ) ) ( not ( = ?auto_804681 ?auto_804687 ) ) ( not ( = ?auto_804681 ?auto_804688 ) ) ( not ( = ?auto_804681 ?auto_804689 ) ) ( not ( = ?auto_804682 ?auto_804683 ) ) ( not ( = ?auto_804682 ?auto_804684 ) ) ( not ( = ?auto_804682 ?auto_804685 ) ) ( not ( = ?auto_804682 ?auto_804686 ) ) ( not ( = ?auto_804682 ?auto_804687 ) ) ( not ( = ?auto_804682 ?auto_804688 ) ) ( not ( = ?auto_804682 ?auto_804689 ) ) ( not ( = ?auto_804683 ?auto_804684 ) ) ( not ( = ?auto_804683 ?auto_804685 ) ) ( not ( = ?auto_804683 ?auto_804686 ) ) ( not ( = ?auto_804683 ?auto_804687 ) ) ( not ( = ?auto_804683 ?auto_804688 ) ) ( not ( = ?auto_804683 ?auto_804689 ) ) ( not ( = ?auto_804684 ?auto_804685 ) ) ( not ( = ?auto_804684 ?auto_804686 ) ) ( not ( = ?auto_804684 ?auto_804687 ) ) ( not ( = ?auto_804684 ?auto_804688 ) ) ( not ( = ?auto_804684 ?auto_804689 ) ) ( not ( = ?auto_804685 ?auto_804686 ) ) ( not ( = ?auto_804685 ?auto_804687 ) ) ( not ( = ?auto_804685 ?auto_804688 ) ) ( not ( = ?auto_804685 ?auto_804689 ) ) ( not ( = ?auto_804686 ?auto_804687 ) ) ( not ( = ?auto_804686 ?auto_804688 ) ) ( not ( = ?auto_804686 ?auto_804689 ) ) ( not ( = ?auto_804687 ?auto_804688 ) ) ( not ( = ?auto_804687 ?auto_804689 ) ) ( not ( = ?auto_804688 ?auto_804689 ) ) ( ON ?auto_804687 ?auto_804688 ) ( ON ?auto_804686 ?auto_804687 ) ( ON ?auto_804685 ?auto_804686 ) ( ON ?auto_804684 ?auto_804685 ) ( ON ?auto_804683 ?auto_804684 ) ( ON ?auto_804682 ?auto_804683 ) ( ON ?auto_804681 ?auto_804682 ) ( ON ?auto_804680 ?auto_804681 ) ( ON ?auto_804679 ?auto_804680 ) ( ON ?auto_804678 ?auto_804679 ) ( ON ?auto_804677 ?auto_804678 ) ( ON ?auto_804676 ?auto_804677 ) ( CLEAR ?auto_804676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_804676 )
      ( MAKE-13PILE ?auto_804676 ?auto_804677 ?auto_804678 ?auto_804679 ?auto_804680 ?auto_804681 ?auto_804682 ?auto_804683 ?auto_804684 ?auto_804685 ?auto_804686 ?auto_804687 ?auto_804688 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_804731 - BLOCK
      ?auto_804732 - BLOCK
      ?auto_804733 - BLOCK
      ?auto_804734 - BLOCK
      ?auto_804735 - BLOCK
      ?auto_804736 - BLOCK
      ?auto_804737 - BLOCK
      ?auto_804738 - BLOCK
      ?auto_804739 - BLOCK
      ?auto_804740 - BLOCK
      ?auto_804741 - BLOCK
      ?auto_804742 - BLOCK
      ?auto_804743 - BLOCK
      ?auto_804744 - BLOCK
    )
    :vars
    (
      ?auto_804745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_804743 ) ( ON ?auto_804744 ?auto_804745 ) ( CLEAR ?auto_804744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_804731 ) ( ON ?auto_804732 ?auto_804731 ) ( ON ?auto_804733 ?auto_804732 ) ( ON ?auto_804734 ?auto_804733 ) ( ON ?auto_804735 ?auto_804734 ) ( ON ?auto_804736 ?auto_804735 ) ( ON ?auto_804737 ?auto_804736 ) ( ON ?auto_804738 ?auto_804737 ) ( ON ?auto_804739 ?auto_804738 ) ( ON ?auto_804740 ?auto_804739 ) ( ON ?auto_804741 ?auto_804740 ) ( ON ?auto_804742 ?auto_804741 ) ( ON ?auto_804743 ?auto_804742 ) ( not ( = ?auto_804731 ?auto_804732 ) ) ( not ( = ?auto_804731 ?auto_804733 ) ) ( not ( = ?auto_804731 ?auto_804734 ) ) ( not ( = ?auto_804731 ?auto_804735 ) ) ( not ( = ?auto_804731 ?auto_804736 ) ) ( not ( = ?auto_804731 ?auto_804737 ) ) ( not ( = ?auto_804731 ?auto_804738 ) ) ( not ( = ?auto_804731 ?auto_804739 ) ) ( not ( = ?auto_804731 ?auto_804740 ) ) ( not ( = ?auto_804731 ?auto_804741 ) ) ( not ( = ?auto_804731 ?auto_804742 ) ) ( not ( = ?auto_804731 ?auto_804743 ) ) ( not ( = ?auto_804731 ?auto_804744 ) ) ( not ( = ?auto_804731 ?auto_804745 ) ) ( not ( = ?auto_804732 ?auto_804733 ) ) ( not ( = ?auto_804732 ?auto_804734 ) ) ( not ( = ?auto_804732 ?auto_804735 ) ) ( not ( = ?auto_804732 ?auto_804736 ) ) ( not ( = ?auto_804732 ?auto_804737 ) ) ( not ( = ?auto_804732 ?auto_804738 ) ) ( not ( = ?auto_804732 ?auto_804739 ) ) ( not ( = ?auto_804732 ?auto_804740 ) ) ( not ( = ?auto_804732 ?auto_804741 ) ) ( not ( = ?auto_804732 ?auto_804742 ) ) ( not ( = ?auto_804732 ?auto_804743 ) ) ( not ( = ?auto_804732 ?auto_804744 ) ) ( not ( = ?auto_804732 ?auto_804745 ) ) ( not ( = ?auto_804733 ?auto_804734 ) ) ( not ( = ?auto_804733 ?auto_804735 ) ) ( not ( = ?auto_804733 ?auto_804736 ) ) ( not ( = ?auto_804733 ?auto_804737 ) ) ( not ( = ?auto_804733 ?auto_804738 ) ) ( not ( = ?auto_804733 ?auto_804739 ) ) ( not ( = ?auto_804733 ?auto_804740 ) ) ( not ( = ?auto_804733 ?auto_804741 ) ) ( not ( = ?auto_804733 ?auto_804742 ) ) ( not ( = ?auto_804733 ?auto_804743 ) ) ( not ( = ?auto_804733 ?auto_804744 ) ) ( not ( = ?auto_804733 ?auto_804745 ) ) ( not ( = ?auto_804734 ?auto_804735 ) ) ( not ( = ?auto_804734 ?auto_804736 ) ) ( not ( = ?auto_804734 ?auto_804737 ) ) ( not ( = ?auto_804734 ?auto_804738 ) ) ( not ( = ?auto_804734 ?auto_804739 ) ) ( not ( = ?auto_804734 ?auto_804740 ) ) ( not ( = ?auto_804734 ?auto_804741 ) ) ( not ( = ?auto_804734 ?auto_804742 ) ) ( not ( = ?auto_804734 ?auto_804743 ) ) ( not ( = ?auto_804734 ?auto_804744 ) ) ( not ( = ?auto_804734 ?auto_804745 ) ) ( not ( = ?auto_804735 ?auto_804736 ) ) ( not ( = ?auto_804735 ?auto_804737 ) ) ( not ( = ?auto_804735 ?auto_804738 ) ) ( not ( = ?auto_804735 ?auto_804739 ) ) ( not ( = ?auto_804735 ?auto_804740 ) ) ( not ( = ?auto_804735 ?auto_804741 ) ) ( not ( = ?auto_804735 ?auto_804742 ) ) ( not ( = ?auto_804735 ?auto_804743 ) ) ( not ( = ?auto_804735 ?auto_804744 ) ) ( not ( = ?auto_804735 ?auto_804745 ) ) ( not ( = ?auto_804736 ?auto_804737 ) ) ( not ( = ?auto_804736 ?auto_804738 ) ) ( not ( = ?auto_804736 ?auto_804739 ) ) ( not ( = ?auto_804736 ?auto_804740 ) ) ( not ( = ?auto_804736 ?auto_804741 ) ) ( not ( = ?auto_804736 ?auto_804742 ) ) ( not ( = ?auto_804736 ?auto_804743 ) ) ( not ( = ?auto_804736 ?auto_804744 ) ) ( not ( = ?auto_804736 ?auto_804745 ) ) ( not ( = ?auto_804737 ?auto_804738 ) ) ( not ( = ?auto_804737 ?auto_804739 ) ) ( not ( = ?auto_804737 ?auto_804740 ) ) ( not ( = ?auto_804737 ?auto_804741 ) ) ( not ( = ?auto_804737 ?auto_804742 ) ) ( not ( = ?auto_804737 ?auto_804743 ) ) ( not ( = ?auto_804737 ?auto_804744 ) ) ( not ( = ?auto_804737 ?auto_804745 ) ) ( not ( = ?auto_804738 ?auto_804739 ) ) ( not ( = ?auto_804738 ?auto_804740 ) ) ( not ( = ?auto_804738 ?auto_804741 ) ) ( not ( = ?auto_804738 ?auto_804742 ) ) ( not ( = ?auto_804738 ?auto_804743 ) ) ( not ( = ?auto_804738 ?auto_804744 ) ) ( not ( = ?auto_804738 ?auto_804745 ) ) ( not ( = ?auto_804739 ?auto_804740 ) ) ( not ( = ?auto_804739 ?auto_804741 ) ) ( not ( = ?auto_804739 ?auto_804742 ) ) ( not ( = ?auto_804739 ?auto_804743 ) ) ( not ( = ?auto_804739 ?auto_804744 ) ) ( not ( = ?auto_804739 ?auto_804745 ) ) ( not ( = ?auto_804740 ?auto_804741 ) ) ( not ( = ?auto_804740 ?auto_804742 ) ) ( not ( = ?auto_804740 ?auto_804743 ) ) ( not ( = ?auto_804740 ?auto_804744 ) ) ( not ( = ?auto_804740 ?auto_804745 ) ) ( not ( = ?auto_804741 ?auto_804742 ) ) ( not ( = ?auto_804741 ?auto_804743 ) ) ( not ( = ?auto_804741 ?auto_804744 ) ) ( not ( = ?auto_804741 ?auto_804745 ) ) ( not ( = ?auto_804742 ?auto_804743 ) ) ( not ( = ?auto_804742 ?auto_804744 ) ) ( not ( = ?auto_804742 ?auto_804745 ) ) ( not ( = ?auto_804743 ?auto_804744 ) ) ( not ( = ?auto_804743 ?auto_804745 ) ) ( not ( = ?auto_804744 ?auto_804745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_804744 ?auto_804745 )
      ( !STACK ?auto_804744 ?auto_804743 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_804789 - BLOCK
      ?auto_804790 - BLOCK
      ?auto_804791 - BLOCK
      ?auto_804792 - BLOCK
      ?auto_804793 - BLOCK
      ?auto_804794 - BLOCK
      ?auto_804795 - BLOCK
      ?auto_804796 - BLOCK
      ?auto_804797 - BLOCK
      ?auto_804798 - BLOCK
      ?auto_804799 - BLOCK
      ?auto_804800 - BLOCK
      ?auto_804801 - BLOCK
      ?auto_804802 - BLOCK
    )
    :vars
    (
      ?auto_804803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804802 ?auto_804803 ) ( ON-TABLE ?auto_804789 ) ( ON ?auto_804790 ?auto_804789 ) ( ON ?auto_804791 ?auto_804790 ) ( ON ?auto_804792 ?auto_804791 ) ( ON ?auto_804793 ?auto_804792 ) ( ON ?auto_804794 ?auto_804793 ) ( ON ?auto_804795 ?auto_804794 ) ( ON ?auto_804796 ?auto_804795 ) ( ON ?auto_804797 ?auto_804796 ) ( ON ?auto_804798 ?auto_804797 ) ( ON ?auto_804799 ?auto_804798 ) ( ON ?auto_804800 ?auto_804799 ) ( not ( = ?auto_804789 ?auto_804790 ) ) ( not ( = ?auto_804789 ?auto_804791 ) ) ( not ( = ?auto_804789 ?auto_804792 ) ) ( not ( = ?auto_804789 ?auto_804793 ) ) ( not ( = ?auto_804789 ?auto_804794 ) ) ( not ( = ?auto_804789 ?auto_804795 ) ) ( not ( = ?auto_804789 ?auto_804796 ) ) ( not ( = ?auto_804789 ?auto_804797 ) ) ( not ( = ?auto_804789 ?auto_804798 ) ) ( not ( = ?auto_804789 ?auto_804799 ) ) ( not ( = ?auto_804789 ?auto_804800 ) ) ( not ( = ?auto_804789 ?auto_804801 ) ) ( not ( = ?auto_804789 ?auto_804802 ) ) ( not ( = ?auto_804789 ?auto_804803 ) ) ( not ( = ?auto_804790 ?auto_804791 ) ) ( not ( = ?auto_804790 ?auto_804792 ) ) ( not ( = ?auto_804790 ?auto_804793 ) ) ( not ( = ?auto_804790 ?auto_804794 ) ) ( not ( = ?auto_804790 ?auto_804795 ) ) ( not ( = ?auto_804790 ?auto_804796 ) ) ( not ( = ?auto_804790 ?auto_804797 ) ) ( not ( = ?auto_804790 ?auto_804798 ) ) ( not ( = ?auto_804790 ?auto_804799 ) ) ( not ( = ?auto_804790 ?auto_804800 ) ) ( not ( = ?auto_804790 ?auto_804801 ) ) ( not ( = ?auto_804790 ?auto_804802 ) ) ( not ( = ?auto_804790 ?auto_804803 ) ) ( not ( = ?auto_804791 ?auto_804792 ) ) ( not ( = ?auto_804791 ?auto_804793 ) ) ( not ( = ?auto_804791 ?auto_804794 ) ) ( not ( = ?auto_804791 ?auto_804795 ) ) ( not ( = ?auto_804791 ?auto_804796 ) ) ( not ( = ?auto_804791 ?auto_804797 ) ) ( not ( = ?auto_804791 ?auto_804798 ) ) ( not ( = ?auto_804791 ?auto_804799 ) ) ( not ( = ?auto_804791 ?auto_804800 ) ) ( not ( = ?auto_804791 ?auto_804801 ) ) ( not ( = ?auto_804791 ?auto_804802 ) ) ( not ( = ?auto_804791 ?auto_804803 ) ) ( not ( = ?auto_804792 ?auto_804793 ) ) ( not ( = ?auto_804792 ?auto_804794 ) ) ( not ( = ?auto_804792 ?auto_804795 ) ) ( not ( = ?auto_804792 ?auto_804796 ) ) ( not ( = ?auto_804792 ?auto_804797 ) ) ( not ( = ?auto_804792 ?auto_804798 ) ) ( not ( = ?auto_804792 ?auto_804799 ) ) ( not ( = ?auto_804792 ?auto_804800 ) ) ( not ( = ?auto_804792 ?auto_804801 ) ) ( not ( = ?auto_804792 ?auto_804802 ) ) ( not ( = ?auto_804792 ?auto_804803 ) ) ( not ( = ?auto_804793 ?auto_804794 ) ) ( not ( = ?auto_804793 ?auto_804795 ) ) ( not ( = ?auto_804793 ?auto_804796 ) ) ( not ( = ?auto_804793 ?auto_804797 ) ) ( not ( = ?auto_804793 ?auto_804798 ) ) ( not ( = ?auto_804793 ?auto_804799 ) ) ( not ( = ?auto_804793 ?auto_804800 ) ) ( not ( = ?auto_804793 ?auto_804801 ) ) ( not ( = ?auto_804793 ?auto_804802 ) ) ( not ( = ?auto_804793 ?auto_804803 ) ) ( not ( = ?auto_804794 ?auto_804795 ) ) ( not ( = ?auto_804794 ?auto_804796 ) ) ( not ( = ?auto_804794 ?auto_804797 ) ) ( not ( = ?auto_804794 ?auto_804798 ) ) ( not ( = ?auto_804794 ?auto_804799 ) ) ( not ( = ?auto_804794 ?auto_804800 ) ) ( not ( = ?auto_804794 ?auto_804801 ) ) ( not ( = ?auto_804794 ?auto_804802 ) ) ( not ( = ?auto_804794 ?auto_804803 ) ) ( not ( = ?auto_804795 ?auto_804796 ) ) ( not ( = ?auto_804795 ?auto_804797 ) ) ( not ( = ?auto_804795 ?auto_804798 ) ) ( not ( = ?auto_804795 ?auto_804799 ) ) ( not ( = ?auto_804795 ?auto_804800 ) ) ( not ( = ?auto_804795 ?auto_804801 ) ) ( not ( = ?auto_804795 ?auto_804802 ) ) ( not ( = ?auto_804795 ?auto_804803 ) ) ( not ( = ?auto_804796 ?auto_804797 ) ) ( not ( = ?auto_804796 ?auto_804798 ) ) ( not ( = ?auto_804796 ?auto_804799 ) ) ( not ( = ?auto_804796 ?auto_804800 ) ) ( not ( = ?auto_804796 ?auto_804801 ) ) ( not ( = ?auto_804796 ?auto_804802 ) ) ( not ( = ?auto_804796 ?auto_804803 ) ) ( not ( = ?auto_804797 ?auto_804798 ) ) ( not ( = ?auto_804797 ?auto_804799 ) ) ( not ( = ?auto_804797 ?auto_804800 ) ) ( not ( = ?auto_804797 ?auto_804801 ) ) ( not ( = ?auto_804797 ?auto_804802 ) ) ( not ( = ?auto_804797 ?auto_804803 ) ) ( not ( = ?auto_804798 ?auto_804799 ) ) ( not ( = ?auto_804798 ?auto_804800 ) ) ( not ( = ?auto_804798 ?auto_804801 ) ) ( not ( = ?auto_804798 ?auto_804802 ) ) ( not ( = ?auto_804798 ?auto_804803 ) ) ( not ( = ?auto_804799 ?auto_804800 ) ) ( not ( = ?auto_804799 ?auto_804801 ) ) ( not ( = ?auto_804799 ?auto_804802 ) ) ( not ( = ?auto_804799 ?auto_804803 ) ) ( not ( = ?auto_804800 ?auto_804801 ) ) ( not ( = ?auto_804800 ?auto_804802 ) ) ( not ( = ?auto_804800 ?auto_804803 ) ) ( not ( = ?auto_804801 ?auto_804802 ) ) ( not ( = ?auto_804801 ?auto_804803 ) ) ( not ( = ?auto_804802 ?auto_804803 ) ) ( CLEAR ?auto_804800 ) ( ON ?auto_804801 ?auto_804802 ) ( CLEAR ?auto_804801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_804789 ?auto_804790 ?auto_804791 ?auto_804792 ?auto_804793 ?auto_804794 ?auto_804795 ?auto_804796 ?auto_804797 ?auto_804798 ?auto_804799 ?auto_804800 ?auto_804801 )
      ( MAKE-14PILE ?auto_804789 ?auto_804790 ?auto_804791 ?auto_804792 ?auto_804793 ?auto_804794 ?auto_804795 ?auto_804796 ?auto_804797 ?auto_804798 ?auto_804799 ?auto_804800 ?auto_804801 ?auto_804802 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_804847 - BLOCK
      ?auto_804848 - BLOCK
      ?auto_804849 - BLOCK
      ?auto_804850 - BLOCK
      ?auto_804851 - BLOCK
      ?auto_804852 - BLOCK
      ?auto_804853 - BLOCK
      ?auto_804854 - BLOCK
      ?auto_804855 - BLOCK
      ?auto_804856 - BLOCK
      ?auto_804857 - BLOCK
      ?auto_804858 - BLOCK
      ?auto_804859 - BLOCK
      ?auto_804860 - BLOCK
    )
    :vars
    (
      ?auto_804861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804860 ?auto_804861 ) ( ON-TABLE ?auto_804847 ) ( ON ?auto_804848 ?auto_804847 ) ( ON ?auto_804849 ?auto_804848 ) ( ON ?auto_804850 ?auto_804849 ) ( ON ?auto_804851 ?auto_804850 ) ( ON ?auto_804852 ?auto_804851 ) ( ON ?auto_804853 ?auto_804852 ) ( ON ?auto_804854 ?auto_804853 ) ( ON ?auto_804855 ?auto_804854 ) ( ON ?auto_804856 ?auto_804855 ) ( ON ?auto_804857 ?auto_804856 ) ( not ( = ?auto_804847 ?auto_804848 ) ) ( not ( = ?auto_804847 ?auto_804849 ) ) ( not ( = ?auto_804847 ?auto_804850 ) ) ( not ( = ?auto_804847 ?auto_804851 ) ) ( not ( = ?auto_804847 ?auto_804852 ) ) ( not ( = ?auto_804847 ?auto_804853 ) ) ( not ( = ?auto_804847 ?auto_804854 ) ) ( not ( = ?auto_804847 ?auto_804855 ) ) ( not ( = ?auto_804847 ?auto_804856 ) ) ( not ( = ?auto_804847 ?auto_804857 ) ) ( not ( = ?auto_804847 ?auto_804858 ) ) ( not ( = ?auto_804847 ?auto_804859 ) ) ( not ( = ?auto_804847 ?auto_804860 ) ) ( not ( = ?auto_804847 ?auto_804861 ) ) ( not ( = ?auto_804848 ?auto_804849 ) ) ( not ( = ?auto_804848 ?auto_804850 ) ) ( not ( = ?auto_804848 ?auto_804851 ) ) ( not ( = ?auto_804848 ?auto_804852 ) ) ( not ( = ?auto_804848 ?auto_804853 ) ) ( not ( = ?auto_804848 ?auto_804854 ) ) ( not ( = ?auto_804848 ?auto_804855 ) ) ( not ( = ?auto_804848 ?auto_804856 ) ) ( not ( = ?auto_804848 ?auto_804857 ) ) ( not ( = ?auto_804848 ?auto_804858 ) ) ( not ( = ?auto_804848 ?auto_804859 ) ) ( not ( = ?auto_804848 ?auto_804860 ) ) ( not ( = ?auto_804848 ?auto_804861 ) ) ( not ( = ?auto_804849 ?auto_804850 ) ) ( not ( = ?auto_804849 ?auto_804851 ) ) ( not ( = ?auto_804849 ?auto_804852 ) ) ( not ( = ?auto_804849 ?auto_804853 ) ) ( not ( = ?auto_804849 ?auto_804854 ) ) ( not ( = ?auto_804849 ?auto_804855 ) ) ( not ( = ?auto_804849 ?auto_804856 ) ) ( not ( = ?auto_804849 ?auto_804857 ) ) ( not ( = ?auto_804849 ?auto_804858 ) ) ( not ( = ?auto_804849 ?auto_804859 ) ) ( not ( = ?auto_804849 ?auto_804860 ) ) ( not ( = ?auto_804849 ?auto_804861 ) ) ( not ( = ?auto_804850 ?auto_804851 ) ) ( not ( = ?auto_804850 ?auto_804852 ) ) ( not ( = ?auto_804850 ?auto_804853 ) ) ( not ( = ?auto_804850 ?auto_804854 ) ) ( not ( = ?auto_804850 ?auto_804855 ) ) ( not ( = ?auto_804850 ?auto_804856 ) ) ( not ( = ?auto_804850 ?auto_804857 ) ) ( not ( = ?auto_804850 ?auto_804858 ) ) ( not ( = ?auto_804850 ?auto_804859 ) ) ( not ( = ?auto_804850 ?auto_804860 ) ) ( not ( = ?auto_804850 ?auto_804861 ) ) ( not ( = ?auto_804851 ?auto_804852 ) ) ( not ( = ?auto_804851 ?auto_804853 ) ) ( not ( = ?auto_804851 ?auto_804854 ) ) ( not ( = ?auto_804851 ?auto_804855 ) ) ( not ( = ?auto_804851 ?auto_804856 ) ) ( not ( = ?auto_804851 ?auto_804857 ) ) ( not ( = ?auto_804851 ?auto_804858 ) ) ( not ( = ?auto_804851 ?auto_804859 ) ) ( not ( = ?auto_804851 ?auto_804860 ) ) ( not ( = ?auto_804851 ?auto_804861 ) ) ( not ( = ?auto_804852 ?auto_804853 ) ) ( not ( = ?auto_804852 ?auto_804854 ) ) ( not ( = ?auto_804852 ?auto_804855 ) ) ( not ( = ?auto_804852 ?auto_804856 ) ) ( not ( = ?auto_804852 ?auto_804857 ) ) ( not ( = ?auto_804852 ?auto_804858 ) ) ( not ( = ?auto_804852 ?auto_804859 ) ) ( not ( = ?auto_804852 ?auto_804860 ) ) ( not ( = ?auto_804852 ?auto_804861 ) ) ( not ( = ?auto_804853 ?auto_804854 ) ) ( not ( = ?auto_804853 ?auto_804855 ) ) ( not ( = ?auto_804853 ?auto_804856 ) ) ( not ( = ?auto_804853 ?auto_804857 ) ) ( not ( = ?auto_804853 ?auto_804858 ) ) ( not ( = ?auto_804853 ?auto_804859 ) ) ( not ( = ?auto_804853 ?auto_804860 ) ) ( not ( = ?auto_804853 ?auto_804861 ) ) ( not ( = ?auto_804854 ?auto_804855 ) ) ( not ( = ?auto_804854 ?auto_804856 ) ) ( not ( = ?auto_804854 ?auto_804857 ) ) ( not ( = ?auto_804854 ?auto_804858 ) ) ( not ( = ?auto_804854 ?auto_804859 ) ) ( not ( = ?auto_804854 ?auto_804860 ) ) ( not ( = ?auto_804854 ?auto_804861 ) ) ( not ( = ?auto_804855 ?auto_804856 ) ) ( not ( = ?auto_804855 ?auto_804857 ) ) ( not ( = ?auto_804855 ?auto_804858 ) ) ( not ( = ?auto_804855 ?auto_804859 ) ) ( not ( = ?auto_804855 ?auto_804860 ) ) ( not ( = ?auto_804855 ?auto_804861 ) ) ( not ( = ?auto_804856 ?auto_804857 ) ) ( not ( = ?auto_804856 ?auto_804858 ) ) ( not ( = ?auto_804856 ?auto_804859 ) ) ( not ( = ?auto_804856 ?auto_804860 ) ) ( not ( = ?auto_804856 ?auto_804861 ) ) ( not ( = ?auto_804857 ?auto_804858 ) ) ( not ( = ?auto_804857 ?auto_804859 ) ) ( not ( = ?auto_804857 ?auto_804860 ) ) ( not ( = ?auto_804857 ?auto_804861 ) ) ( not ( = ?auto_804858 ?auto_804859 ) ) ( not ( = ?auto_804858 ?auto_804860 ) ) ( not ( = ?auto_804858 ?auto_804861 ) ) ( not ( = ?auto_804859 ?auto_804860 ) ) ( not ( = ?auto_804859 ?auto_804861 ) ) ( not ( = ?auto_804860 ?auto_804861 ) ) ( ON ?auto_804859 ?auto_804860 ) ( CLEAR ?auto_804857 ) ( ON ?auto_804858 ?auto_804859 ) ( CLEAR ?auto_804858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_804847 ?auto_804848 ?auto_804849 ?auto_804850 ?auto_804851 ?auto_804852 ?auto_804853 ?auto_804854 ?auto_804855 ?auto_804856 ?auto_804857 ?auto_804858 )
      ( MAKE-14PILE ?auto_804847 ?auto_804848 ?auto_804849 ?auto_804850 ?auto_804851 ?auto_804852 ?auto_804853 ?auto_804854 ?auto_804855 ?auto_804856 ?auto_804857 ?auto_804858 ?auto_804859 ?auto_804860 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_804905 - BLOCK
      ?auto_804906 - BLOCK
      ?auto_804907 - BLOCK
      ?auto_804908 - BLOCK
      ?auto_804909 - BLOCK
      ?auto_804910 - BLOCK
      ?auto_804911 - BLOCK
      ?auto_804912 - BLOCK
      ?auto_804913 - BLOCK
      ?auto_804914 - BLOCK
      ?auto_804915 - BLOCK
      ?auto_804916 - BLOCK
      ?auto_804917 - BLOCK
      ?auto_804918 - BLOCK
    )
    :vars
    (
      ?auto_804919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804918 ?auto_804919 ) ( ON-TABLE ?auto_804905 ) ( ON ?auto_804906 ?auto_804905 ) ( ON ?auto_804907 ?auto_804906 ) ( ON ?auto_804908 ?auto_804907 ) ( ON ?auto_804909 ?auto_804908 ) ( ON ?auto_804910 ?auto_804909 ) ( ON ?auto_804911 ?auto_804910 ) ( ON ?auto_804912 ?auto_804911 ) ( ON ?auto_804913 ?auto_804912 ) ( ON ?auto_804914 ?auto_804913 ) ( not ( = ?auto_804905 ?auto_804906 ) ) ( not ( = ?auto_804905 ?auto_804907 ) ) ( not ( = ?auto_804905 ?auto_804908 ) ) ( not ( = ?auto_804905 ?auto_804909 ) ) ( not ( = ?auto_804905 ?auto_804910 ) ) ( not ( = ?auto_804905 ?auto_804911 ) ) ( not ( = ?auto_804905 ?auto_804912 ) ) ( not ( = ?auto_804905 ?auto_804913 ) ) ( not ( = ?auto_804905 ?auto_804914 ) ) ( not ( = ?auto_804905 ?auto_804915 ) ) ( not ( = ?auto_804905 ?auto_804916 ) ) ( not ( = ?auto_804905 ?auto_804917 ) ) ( not ( = ?auto_804905 ?auto_804918 ) ) ( not ( = ?auto_804905 ?auto_804919 ) ) ( not ( = ?auto_804906 ?auto_804907 ) ) ( not ( = ?auto_804906 ?auto_804908 ) ) ( not ( = ?auto_804906 ?auto_804909 ) ) ( not ( = ?auto_804906 ?auto_804910 ) ) ( not ( = ?auto_804906 ?auto_804911 ) ) ( not ( = ?auto_804906 ?auto_804912 ) ) ( not ( = ?auto_804906 ?auto_804913 ) ) ( not ( = ?auto_804906 ?auto_804914 ) ) ( not ( = ?auto_804906 ?auto_804915 ) ) ( not ( = ?auto_804906 ?auto_804916 ) ) ( not ( = ?auto_804906 ?auto_804917 ) ) ( not ( = ?auto_804906 ?auto_804918 ) ) ( not ( = ?auto_804906 ?auto_804919 ) ) ( not ( = ?auto_804907 ?auto_804908 ) ) ( not ( = ?auto_804907 ?auto_804909 ) ) ( not ( = ?auto_804907 ?auto_804910 ) ) ( not ( = ?auto_804907 ?auto_804911 ) ) ( not ( = ?auto_804907 ?auto_804912 ) ) ( not ( = ?auto_804907 ?auto_804913 ) ) ( not ( = ?auto_804907 ?auto_804914 ) ) ( not ( = ?auto_804907 ?auto_804915 ) ) ( not ( = ?auto_804907 ?auto_804916 ) ) ( not ( = ?auto_804907 ?auto_804917 ) ) ( not ( = ?auto_804907 ?auto_804918 ) ) ( not ( = ?auto_804907 ?auto_804919 ) ) ( not ( = ?auto_804908 ?auto_804909 ) ) ( not ( = ?auto_804908 ?auto_804910 ) ) ( not ( = ?auto_804908 ?auto_804911 ) ) ( not ( = ?auto_804908 ?auto_804912 ) ) ( not ( = ?auto_804908 ?auto_804913 ) ) ( not ( = ?auto_804908 ?auto_804914 ) ) ( not ( = ?auto_804908 ?auto_804915 ) ) ( not ( = ?auto_804908 ?auto_804916 ) ) ( not ( = ?auto_804908 ?auto_804917 ) ) ( not ( = ?auto_804908 ?auto_804918 ) ) ( not ( = ?auto_804908 ?auto_804919 ) ) ( not ( = ?auto_804909 ?auto_804910 ) ) ( not ( = ?auto_804909 ?auto_804911 ) ) ( not ( = ?auto_804909 ?auto_804912 ) ) ( not ( = ?auto_804909 ?auto_804913 ) ) ( not ( = ?auto_804909 ?auto_804914 ) ) ( not ( = ?auto_804909 ?auto_804915 ) ) ( not ( = ?auto_804909 ?auto_804916 ) ) ( not ( = ?auto_804909 ?auto_804917 ) ) ( not ( = ?auto_804909 ?auto_804918 ) ) ( not ( = ?auto_804909 ?auto_804919 ) ) ( not ( = ?auto_804910 ?auto_804911 ) ) ( not ( = ?auto_804910 ?auto_804912 ) ) ( not ( = ?auto_804910 ?auto_804913 ) ) ( not ( = ?auto_804910 ?auto_804914 ) ) ( not ( = ?auto_804910 ?auto_804915 ) ) ( not ( = ?auto_804910 ?auto_804916 ) ) ( not ( = ?auto_804910 ?auto_804917 ) ) ( not ( = ?auto_804910 ?auto_804918 ) ) ( not ( = ?auto_804910 ?auto_804919 ) ) ( not ( = ?auto_804911 ?auto_804912 ) ) ( not ( = ?auto_804911 ?auto_804913 ) ) ( not ( = ?auto_804911 ?auto_804914 ) ) ( not ( = ?auto_804911 ?auto_804915 ) ) ( not ( = ?auto_804911 ?auto_804916 ) ) ( not ( = ?auto_804911 ?auto_804917 ) ) ( not ( = ?auto_804911 ?auto_804918 ) ) ( not ( = ?auto_804911 ?auto_804919 ) ) ( not ( = ?auto_804912 ?auto_804913 ) ) ( not ( = ?auto_804912 ?auto_804914 ) ) ( not ( = ?auto_804912 ?auto_804915 ) ) ( not ( = ?auto_804912 ?auto_804916 ) ) ( not ( = ?auto_804912 ?auto_804917 ) ) ( not ( = ?auto_804912 ?auto_804918 ) ) ( not ( = ?auto_804912 ?auto_804919 ) ) ( not ( = ?auto_804913 ?auto_804914 ) ) ( not ( = ?auto_804913 ?auto_804915 ) ) ( not ( = ?auto_804913 ?auto_804916 ) ) ( not ( = ?auto_804913 ?auto_804917 ) ) ( not ( = ?auto_804913 ?auto_804918 ) ) ( not ( = ?auto_804913 ?auto_804919 ) ) ( not ( = ?auto_804914 ?auto_804915 ) ) ( not ( = ?auto_804914 ?auto_804916 ) ) ( not ( = ?auto_804914 ?auto_804917 ) ) ( not ( = ?auto_804914 ?auto_804918 ) ) ( not ( = ?auto_804914 ?auto_804919 ) ) ( not ( = ?auto_804915 ?auto_804916 ) ) ( not ( = ?auto_804915 ?auto_804917 ) ) ( not ( = ?auto_804915 ?auto_804918 ) ) ( not ( = ?auto_804915 ?auto_804919 ) ) ( not ( = ?auto_804916 ?auto_804917 ) ) ( not ( = ?auto_804916 ?auto_804918 ) ) ( not ( = ?auto_804916 ?auto_804919 ) ) ( not ( = ?auto_804917 ?auto_804918 ) ) ( not ( = ?auto_804917 ?auto_804919 ) ) ( not ( = ?auto_804918 ?auto_804919 ) ) ( ON ?auto_804917 ?auto_804918 ) ( ON ?auto_804916 ?auto_804917 ) ( CLEAR ?auto_804914 ) ( ON ?auto_804915 ?auto_804916 ) ( CLEAR ?auto_804915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_804905 ?auto_804906 ?auto_804907 ?auto_804908 ?auto_804909 ?auto_804910 ?auto_804911 ?auto_804912 ?auto_804913 ?auto_804914 ?auto_804915 )
      ( MAKE-14PILE ?auto_804905 ?auto_804906 ?auto_804907 ?auto_804908 ?auto_804909 ?auto_804910 ?auto_804911 ?auto_804912 ?auto_804913 ?auto_804914 ?auto_804915 ?auto_804916 ?auto_804917 ?auto_804918 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_804963 - BLOCK
      ?auto_804964 - BLOCK
      ?auto_804965 - BLOCK
      ?auto_804966 - BLOCK
      ?auto_804967 - BLOCK
      ?auto_804968 - BLOCK
      ?auto_804969 - BLOCK
      ?auto_804970 - BLOCK
      ?auto_804971 - BLOCK
      ?auto_804972 - BLOCK
      ?auto_804973 - BLOCK
      ?auto_804974 - BLOCK
      ?auto_804975 - BLOCK
      ?auto_804976 - BLOCK
    )
    :vars
    (
      ?auto_804977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_804976 ?auto_804977 ) ( ON-TABLE ?auto_804963 ) ( ON ?auto_804964 ?auto_804963 ) ( ON ?auto_804965 ?auto_804964 ) ( ON ?auto_804966 ?auto_804965 ) ( ON ?auto_804967 ?auto_804966 ) ( ON ?auto_804968 ?auto_804967 ) ( ON ?auto_804969 ?auto_804968 ) ( ON ?auto_804970 ?auto_804969 ) ( ON ?auto_804971 ?auto_804970 ) ( not ( = ?auto_804963 ?auto_804964 ) ) ( not ( = ?auto_804963 ?auto_804965 ) ) ( not ( = ?auto_804963 ?auto_804966 ) ) ( not ( = ?auto_804963 ?auto_804967 ) ) ( not ( = ?auto_804963 ?auto_804968 ) ) ( not ( = ?auto_804963 ?auto_804969 ) ) ( not ( = ?auto_804963 ?auto_804970 ) ) ( not ( = ?auto_804963 ?auto_804971 ) ) ( not ( = ?auto_804963 ?auto_804972 ) ) ( not ( = ?auto_804963 ?auto_804973 ) ) ( not ( = ?auto_804963 ?auto_804974 ) ) ( not ( = ?auto_804963 ?auto_804975 ) ) ( not ( = ?auto_804963 ?auto_804976 ) ) ( not ( = ?auto_804963 ?auto_804977 ) ) ( not ( = ?auto_804964 ?auto_804965 ) ) ( not ( = ?auto_804964 ?auto_804966 ) ) ( not ( = ?auto_804964 ?auto_804967 ) ) ( not ( = ?auto_804964 ?auto_804968 ) ) ( not ( = ?auto_804964 ?auto_804969 ) ) ( not ( = ?auto_804964 ?auto_804970 ) ) ( not ( = ?auto_804964 ?auto_804971 ) ) ( not ( = ?auto_804964 ?auto_804972 ) ) ( not ( = ?auto_804964 ?auto_804973 ) ) ( not ( = ?auto_804964 ?auto_804974 ) ) ( not ( = ?auto_804964 ?auto_804975 ) ) ( not ( = ?auto_804964 ?auto_804976 ) ) ( not ( = ?auto_804964 ?auto_804977 ) ) ( not ( = ?auto_804965 ?auto_804966 ) ) ( not ( = ?auto_804965 ?auto_804967 ) ) ( not ( = ?auto_804965 ?auto_804968 ) ) ( not ( = ?auto_804965 ?auto_804969 ) ) ( not ( = ?auto_804965 ?auto_804970 ) ) ( not ( = ?auto_804965 ?auto_804971 ) ) ( not ( = ?auto_804965 ?auto_804972 ) ) ( not ( = ?auto_804965 ?auto_804973 ) ) ( not ( = ?auto_804965 ?auto_804974 ) ) ( not ( = ?auto_804965 ?auto_804975 ) ) ( not ( = ?auto_804965 ?auto_804976 ) ) ( not ( = ?auto_804965 ?auto_804977 ) ) ( not ( = ?auto_804966 ?auto_804967 ) ) ( not ( = ?auto_804966 ?auto_804968 ) ) ( not ( = ?auto_804966 ?auto_804969 ) ) ( not ( = ?auto_804966 ?auto_804970 ) ) ( not ( = ?auto_804966 ?auto_804971 ) ) ( not ( = ?auto_804966 ?auto_804972 ) ) ( not ( = ?auto_804966 ?auto_804973 ) ) ( not ( = ?auto_804966 ?auto_804974 ) ) ( not ( = ?auto_804966 ?auto_804975 ) ) ( not ( = ?auto_804966 ?auto_804976 ) ) ( not ( = ?auto_804966 ?auto_804977 ) ) ( not ( = ?auto_804967 ?auto_804968 ) ) ( not ( = ?auto_804967 ?auto_804969 ) ) ( not ( = ?auto_804967 ?auto_804970 ) ) ( not ( = ?auto_804967 ?auto_804971 ) ) ( not ( = ?auto_804967 ?auto_804972 ) ) ( not ( = ?auto_804967 ?auto_804973 ) ) ( not ( = ?auto_804967 ?auto_804974 ) ) ( not ( = ?auto_804967 ?auto_804975 ) ) ( not ( = ?auto_804967 ?auto_804976 ) ) ( not ( = ?auto_804967 ?auto_804977 ) ) ( not ( = ?auto_804968 ?auto_804969 ) ) ( not ( = ?auto_804968 ?auto_804970 ) ) ( not ( = ?auto_804968 ?auto_804971 ) ) ( not ( = ?auto_804968 ?auto_804972 ) ) ( not ( = ?auto_804968 ?auto_804973 ) ) ( not ( = ?auto_804968 ?auto_804974 ) ) ( not ( = ?auto_804968 ?auto_804975 ) ) ( not ( = ?auto_804968 ?auto_804976 ) ) ( not ( = ?auto_804968 ?auto_804977 ) ) ( not ( = ?auto_804969 ?auto_804970 ) ) ( not ( = ?auto_804969 ?auto_804971 ) ) ( not ( = ?auto_804969 ?auto_804972 ) ) ( not ( = ?auto_804969 ?auto_804973 ) ) ( not ( = ?auto_804969 ?auto_804974 ) ) ( not ( = ?auto_804969 ?auto_804975 ) ) ( not ( = ?auto_804969 ?auto_804976 ) ) ( not ( = ?auto_804969 ?auto_804977 ) ) ( not ( = ?auto_804970 ?auto_804971 ) ) ( not ( = ?auto_804970 ?auto_804972 ) ) ( not ( = ?auto_804970 ?auto_804973 ) ) ( not ( = ?auto_804970 ?auto_804974 ) ) ( not ( = ?auto_804970 ?auto_804975 ) ) ( not ( = ?auto_804970 ?auto_804976 ) ) ( not ( = ?auto_804970 ?auto_804977 ) ) ( not ( = ?auto_804971 ?auto_804972 ) ) ( not ( = ?auto_804971 ?auto_804973 ) ) ( not ( = ?auto_804971 ?auto_804974 ) ) ( not ( = ?auto_804971 ?auto_804975 ) ) ( not ( = ?auto_804971 ?auto_804976 ) ) ( not ( = ?auto_804971 ?auto_804977 ) ) ( not ( = ?auto_804972 ?auto_804973 ) ) ( not ( = ?auto_804972 ?auto_804974 ) ) ( not ( = ?auto_804972 ?auto_804975 ) ) ( not ( = ?auto_804972 ?auto_804976 ) ) ( not ( = ?auto_804972 ?auto_804977 ) ) ( not ( = ?auto_804973 ?auto_804974 ) ) ( not ( = ?auto_804973 ?auto_804975 ) ) ( not ( = ?auto_804973 ?auto_804976 ) ) ( not ( = ?auto_804973 ?auto_804977 ) ) ( not ( = ?auto_804974 ?auto_804975 ) ) ( not ( = ?auto_804974 ?auto_804976 ) ) ( not ( = ?auto_804974 ?auto_804977 ) ) ( not ( = ?auto_804975 ?auto_804976 ) ) ( not ( = ?auto_804975 ?auto_804977 ) ) ( not ( = ?auto_804976 ?auto_804977 ) ) ( ON ?auto_804975 ?auto_804976 ) ( ON ?auto_804974 ?auto_804975 ) ( ON ?auto_804973 ?auto_804974 ) ( CLEAR ?auto_804971 ) ( ON ?auto_804972 ?auto_804973 ) ( CLEAR ?auto_804972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_804963 ?auto_804964 ?auto_804965 ?auto_804966 ?auto_804967 ?auto_804968 ?auto_804969 ?auto_804970 ?auto_804971 ?auto_804972 )
      ( MAKE-14PILE ?auto_804963 ?auto_804964 ?auto_804965 ?auto_804966 ?auto_804967 ?auto_804968 ?auto_804969 ?auto_804970 ?auto_804971 ?auto_804972 ?auto_804973 ?auto_804974 ?auto_804975 ?auto_804976 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805021 - BLOCK
      ?auto_805022 - BLOCK
      ?auto_805023 - BLOCK
      ?auto_805024 - BLOCK
      ?auto_805025 - BLOCK
      ?auto_805026 - BLOCK
      ?auto_805027 - BLOCK
      ?auto_805028 - BLOCK
      ?auto_805029 - BLOCK
      ?auto_805030 - BLOCK
      ?auto_805031 - BLOCK
      ?auto_805032 - BLOCK
      ?auto_805033 - BLOCK
      ?auto_805034 - BLOCK
    )
    :vars
    (
      ?auto_805035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805034 ?auto_805035 ) ( ON-TABLE ?auto_805021 ) ( ON ?auto_805022 ?auto_805021 ) ( ON ?auto_805023 ?auto_805022 ) ( ON ?auto_805024 ?auto_805023 ) ( ON ?auto_805025 ?auto_805024 ) ( ON ?auto_805026 ?auto_805025 ) ( ON ?auto_805027 ?auto_805026 ) ( ON ?auto_805028 ?auto_805027 ) ( not ( = ?auto_805021 ?auto_805022 ) ) ( not ( = ?auto_805021 ?auto_805023 ) ) ( not ( = ?auto_805021 ?auto_805024 ) ) ( not ( = ?auto_805021 ?auto_805025 ) ) ( not ( = ?auto_805021 ?auto_805026 ) ) ( not ( = ?auto_805021 ?auto_805027 ) ) ( not ( = ?auto_805021 ?auto_805028 ) ) ( not ( = ?auto_805021 ?auto_805029 ) ) ( not ( = ?auto_805021 ?auto_805030 ) ) ( not ( = ?auto_805021 ?auto_805031 ) ) ( not ( = ?auto_805021 ?auto_805032 ) ) ( not ( = ?auto_805021 ?auto_805033 ) ) ( not ( = ?auto_805021 ?auto_805034 ) ) ( not ( = ?auto_805021 ?auto_805035 ) ) ( not ( = ?auto_805022 ?auto_805023 ) ) ( not ( = ?auto_805022 ?auto_805024 ) ) ( not ( = ?auto_805022 ?auto_805025 ) ) ( not ( = ?auto_805022 ?auto_805026 ) ) ( not ( = ?auto_805022 ?auto_805027 ) ) ( not ( = ?auto_805022 ?auto_805028 ) ) ( not ( = ?auto_805022 ?auto_805029 ) ) ( not ( = ?auto_805022 ?auto_805030 ) ) ( not ( = ?auto_805022 ?auto_805031 ) ) ( not ( = ?auto_805022 ?auto_805032 ) ) ( not ( = ?auto_805022 ?auto_805033 ) ) ( not ( = ?auto_805022 ?auto_805034 ) ) ( not ( = ?auto_805022 ?auto_805035 ) ) ( not ( = ?auto_805023 ?auto_805024 ) ) ( not ( = ?auto_805023 ?auto_805025 ) ) ( not ( = ?auto_805023 ?auto_805026 ) ) ( not ( = ?auto_805023 ?auto_805027 ) ) ( not ( = ?auto_805023 ?auto_805028 ) ) ( not ( = ?auto_805023 ?auto_805029 ) ) ( not ( = ?auto_805023 ?auto_805030 ) ) ( not ( = ?auto_805023 ?auto_805031 ) ) ( not ( = ?auto_805023 ?auto_805032 ) ) ( not ( = ?auto_805023 ?auto_805033 ) ) ( not ( = ?auto_805023 ?auto_805034 ) ) ( not ( = ?auto_805023 ?auto_805035 ) ) ( not ( = ?auto_805024 ?auto_805025 ) ) ( not ( = ?auto_805024 ?auto_805026 ) ) ( not ( = ?auto_805024 ?auto_805027 ) ) ( not ( = ?auto_805024 ?auto_805028 ) ) ( not ( = ?auto_805024 ?auto_805029 ) ) ( not ( = ?auto_805024 ?auto_805030 ) ) ( not ( = ?auto_805024 ?auto_805031 ) ) ( not ( = ?auto_805024 ?auto_805032 ) ) ( not ( = ?auto_805024 ?auto_805033 ) ) ( not ( = ?auto_805024 ?auto_805034 ) ) ( not ( = ?auto_805024 ?auto_805035 ) ) ( not ( = ?auto_805025 ?auto_805026 ) ) ( not ( = ?auto_805025 ?auto_805027 ) ) ( not ( = ?auto_805025 ?auto_805028 ) ) ( not ( = ?auto_805025 ?auto_805029 ) ) ( not ( = ?auto_805025 ?auto_805030 ) ) ( not ( = ?auto_805025 ?auto_805031 ) ) ( not ( = ?auto_805025 ?auto_805032 ) ) ( not ( = ?auto_805025 ?auto_805033 ) ) ( not ( = ?auto_805025 ?auto_805034 ) ) ( not ( = ?auto_805025 ?auto_805035 ) ) ( not ( = ?auto_805026 ?auto_805027 ) ) ( not ( = ?auto_805026 ?auto_805028 ) ) ( not ( = ?auto_805026 ?auto_805029 ) ) ( not ( = ?auto_805026 ?auto_805030 ) ) ( not ( = ?auto_805026 ?auto_805031 ) ) ( not ( = ?auto_805026 ?auto_805032 ) ) ( not ( = ?auto_805026 ?auto_805033 ) ) ( not ( = ?auto_805026 ?auto_805034 ) ) ( not ( = ?auto_805026 ?auto_805035 ) ) ( not ( = ?auto_805027 ?auto_805028 ) ) ( not ( = ?auto_805027 ?auto_805029 ) ) ( not ( = ?auto_805027 ?auto_805030 ) ) ( not ( = ?auto_805027 ?auto_805031 ) ) ( not ( = ?auto_805027 ?auto_805032 ) ) ( not ( = ?auto_805027 ?auto_805033 ) ) ( not ( = ?auto_805027 ?auto_805034 ) ) ( not ( = ?auto_805027 ?auto_805035 ) ) ( not ( = ?auto_805028 ?auto_805029 ) ) ( not ( = ?auto_805028 ?auto_805030 ) ) ( not ( = ?auto_805028 ?auto_805031 ) ) ( not ( = ?auto_805028 ?auto_805032 ) ) ( not ( = ?auto_805028 ?auto_805033 ) ) ( not ( = ?auto_805028 ?auto_805034 ) ) ( not ( = ?auto_805028 ?auto_805035 ) ) ( not ( = ?auto_805029 ?auto_805030 ) ) ( not ( = ?auto_805029 ?auto_805031 ) ) ( not ( = ?auto_805029 ?auto_805032 ) ) ( not ( = ?auto_805029 ?auto_805033 ) ) ( not ( = ?auto_805029 ?auto_805034 ) ) ( not ( = ?auto_805029 ?auto_805035 ) ) ( not ( = ?auto_805030 ?auto_805031 ) ) ( not ( = ?auto_805030 ?auto_805032 ) ) ( not ( = ?auto_805030 ?auto_805033 ) ) ( not ( = ?auto_805030 ?auto_805034 ) ) ( not ( = ?auto_805030 ?auto_805035 ) ) ( not ( = ?auto_805031 ?auto_805032 ) ) ( not ( = ?auto_805031 ?auto_805033 ) ) ( not ( = ?auto_805031 ?auto_805034 ) ) ( not ( = ?auto_805031 ?auto_805035 ) ) ( not ( = ?auto_805032 ?auto_805033 ) ) ( not ( = ?auto_805032 ?auto_805034 ) ) ( not ( = ?auto_805032 ?auto_805035 ) ) ( not ( = ?auto_805033 ?auto_805034 ) ) ( not ( = ?auto_805033 ?auto_805035 ) ) ( not ( = ?auto_805034 ?auto_805035 ) ) ( ON ?auto_805033 ?auto_805034 ) ( ON ?auto_805032 ?auto_805033 ) ( ON ?auto_805031 ?auto_805032 ) ( ON ?auto_805030 ?auto_805031 ) ( CLEAR ?auto_805028 ) ( ON ?auto_805029 ?auto_805030 ) ( CLEAR ?auto_805029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_805021 ?auto_805022 ?auto_805023 ?auto_805024 ?auto_805025 ?auto_805026 ?auto_805027 ?auto_805028 ?auto_805029 )
      ( MAKE-14PILE ?auto_805021 ?auto_805022 ?auto_805023 ?auto_805024 ?auto_805025 ?auto_805026 ?auto_805027 ?auto_805028 ?auto_805029 ?auto_805030 ?auto_805031 ?auto_805032 ?auto_805033 ?auto_805034 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805079 - BLOCK
      ?auto_805080 - BLOCK
      ?auto_805081 - BLOCK
      ?auto_805082 - BLOCK
      ?auto_805083 - BLOCK
      ?auto_805084 - BLOCK
      ?auto_805085 - BLOCK
      ?auto_805086 - BLOCK
      ?auto_805087 - BLOCK
      ?auto_805088 - BLOCK
      ?auto_805089 - BLOCK
      ?auto_805090 - BLOCK
      ?auto_805091 - BLOCK
      ?auto_805092 - BLOCK
    )
    :vars
    (
      ?auto_805093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805092 ?auto_805093 ) ( ON-TABLE ?auto_805079 ) ( ON ?auto_805080 ?auto_805079 ) ( ON ?auto_805081 ?auto_805080 ) ( ON ?auto_805082 ?auto_805081 ) ( ON ?auto_805083 ?auto_805082 ) ( ON ?auto_805084 ?auto_805083 ) ( ON ?auto_805085 ?auto_805084 ) ( not ( = ?auto_805079 ?auto_805080 ) ) ( not ( = ?auto_805079 ?auto_805081 ) ) ( not ( = ?auto_805079 ?auto_805082 ) ) ( not ( = ?auto_805079 ?auto_805083 ) ) ( not ( = ?auto_805079 ?auto_805084 ) ) ( not ( = ?auto_805079 ?auto_805085 ) ) ( not ( = ?auto_805079 ?auto_805086 ) ) ( not ( = ?auto_805079 ?auto_805087 ) ) ( not ( = ?auto_805079 ?auto_805088 ) ) ( not ( = ?auto_805079 ?auto_805089 ) ) ( not ( = ?auto_805079 ?auto_805090 ) ) ( not ( = ?auto_805079 ?auto_805091 ) ) ( not ( = ?auto_805079 ?auto_805092 ) ) ( not ( = ?auto_805079 ?auto_805093 ) ) ( not ( = ?auto_805080 ?auto_805081 ) ) ( not ( = ?auto_805080 ?auto_805082 ) ) ( not ( = ?auto_805080 ?auto_805083 ) ) ( not ( = ?auto_805080 ?auto_805084 ) ) ( not ( = ?auto_805080 ?auto_805085 ) ) ( not ( = ?auto_805080 ?auto_805086 ) ) ( not ( = ?auto_805080 ?auto_805087 ) ) ( not ( = ?auto_805080 ?auto_805088 ) ) ( not ( = ?auto_805080 ?auto_805089 ) ) ( not ( = ?auto_805080 ?auto_805090 ) ) ( not ( = ?auto_805080 ?auto_805091 ) ) ( not ( = ?auto_805080 ?auto_805092 ) ) ( not ( = ?auto_805080 ?auto_805093 ) ) ( not ( = ?auto_805081 ?auto_805082 ) ) ( not ( = ?auto_805081 ?auto_805083 ) ) ( not ( = ?auto_805081 ?auto_805084 ) ) ( not ( = ?auto_805081 ?auto_805085 ) ) ( not ( = ?auto_805081 ?auto_805086 ) ) ( not ( = ?auto_805081 ?auto_805087 ) ) ( not ( = ?auto_805081 ?auto_805088 ) ) ( not ( = ?auto_805081 ?auto_805089 ) ) ( not ( = ?auto_805081 ?auto_805090 ) ) ( not ( = ?auto_805081 ?auto_805091 ) ) ( not ( = ?auto_805081 ?auto_805092 ) ) ( not ( = ?auto_805081 ?auto_805093 ) ) ( not ( = ?auto_805082 ?auto_805083 ) ) ( not ( = ?auto_805082 ?auto_805084 ) ) ( not ( = ?auto_805082 ?auto_805085 ) ) ( not ( = ?auto_805082 ?auto_805086 ) ) ( not ( = ?auto_805082 ?auto_805087 ) ) ( not ( = ?auto_805082 ?auto_805088 ) ) ( not ( = ?auto_805082 ?auto_805089 ) ) ( not ( = ?auto_805082 ?auto_805090 ) ) ( not ( = ?auto_805082 ?auto_805091 ) ) ( not ( = ?auto_805082 ?auto_805092 ) ) ( not ( = ?auto_805082 ?auto_805093 ) ) ( not ( = ?auto_805083 ?auto_805084 ) ) ( not ( = ?auto_805083 ?auto_805085 ) ) ( not ( = ?auto_805083 ?auto_805086 ) ) ( not ( = ?auto_805083 ?auto_805087 ) ) ( not ( = ?auto_805083 ?auto_805088 ) ) ( not ( = ?auto_805083 ?auto_805089 ) ) ( not ( = ?auto_805083 ?auto_805090 ) ) ( not ( = ?auto_805083 ?auto_805091 ) ) ( not ( = ?auto_805083 ?auto_805092 ) ) ( not ( = ?auto_805083 ?auto_805093 ) ) ( not ( = ?auto_805084 ?auto_805085 ) ) ( not ( = ?auto_805084 ?auto_805086 ) ) ( not ( = ?auto_805084 ?auto_805087 ) ) ( not ( = ?auto_805084 ?auto_805088 ) ) ( not ( = ?auto_805084 ?auto_805089 ) ) ( not ( = ?auto_805084 ?auto_805090 ) ) ( not ( = ?auto_805084 ?auto_805091 ) ) ( not ( = ?auto_805084 ?auto_805092 ) ) ( not ( = ?auto_805084 ?auto_805093 ) ) ( not ( = ?auto_805085 ?auto_805086 ) ) ( not ( = ?auto_805085 ?auto_805087 ) ) ( not ( = ?auto_805085 ?auto_805088 ) ) ( not ( = ?auto_805085 ?auto_805089 ) ) ( not ( = ?auto_805085 ?auto_805090 ) ) ( not ( = ?auto_805085 ?auto_805091 ) ) ( not ( = ?auto_805085 ?auto_805092 ) ) ( not ( = ?auto_805085 ?auto_805093 ) ) ( not ( = ?auto_805086 ?auto_805087 ) ) ( not ( = ?auto_805086 ?auto_805088 ) ) ( not ( = ?auto_805086 ?auto_805089 ) ) ( not ( = ?auto_805086 ?auto_805090 ) ) ( not ( = ?auto_805086 ?auto_805091 ) ) ( not ( = ?auto_805086 ?auto_805092 ) ) ( not ( = ?auto_805086 ?auto_805093 ) ) ( not ( = ?auto_805087 ?auto_805088 ) ) ( not ( = ?auto_805087 ?auto_805089 ) ) ( not ( = ?auto_805087 ?auto_805090 ) ) ( not ( = ?auto_805087 ?auto_805091 ) ) ( not ( = ?auto_805087 ?auto_805092 ) ) ( not ( = ?auto_805087 ?auto_805093 ) ) ( not ( = ?auto_805088 ?auto_805089 ) ) ( not ( = ?auto_805088 ?auto_805090 ) ) ( not ( = ?auto_805088 ?auto_805091 ) ) ( not ( = ?auto_805088 ?auto_805092 ) ) ( not ( = ?auto_805088 ?auto_805093 ) ) ( not ( = ?auto_805089 ?auto_805090 ) ) ( not ( = ?auto_805089 ?auto_805091 ) ) ( not ( = ?auto_805089 ?auto_805092 ) ) ( not ( = ?auto_805089 ?auto_805093 ) ) ( not ( = ?auto_805090 ?auto_805091 ) ) ( not ( = ?auto_805090 ?auto_805092 ) ) ( not ( = ?auto_805090 ?auto_805093 ) ) ( not ( = ?auto_805091 ?auto_805092 ) ) ( not ( = ?auto_805091 ?auto_805093 ) ) ( not ( = ?auto_805092 ?auto_805093 ) ) ( ON ?auto_805091 ?auto_805092 ) ( ON ?auto_805090 ?auto_805091 ) ( ON ?auto_805089 ?auto_805090 ) ( ON ?auto_805088 ?auto_805089 ) ( ON ?auto_805087 ?auto_805088 ) ( CLEAR ?auto_805085 ) ( ON ?auto_805086 ?auto_805087 ) ( CLEAR ?auto_805086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_805079 ?auto_805080 ?auto_805081 ?auto_805082 ?auto_805083 ?auto_805084 ?auto_805085 ?auto_805086 )
      ( MAKE-14PILE ?auto_805079 ?auto_805080 ?auto_805081 ?auto_805082 ?auto_805083 ?auto_805084 ?auto_805085 ?auto_805086 ?auto_805087 ?auto_805088 ?auto_805089 ?auto_805090 ?auto_805091 ?auto_805092 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805137 - BLOCK
      ?auto_805138 - BLOCK
      ?auto_805139 - BLOCK
      ?auto_805140 - BLOCK
      ?auto_805141 - BLOCK
      ?auto_805142 - BLOCK
      ?auto_805143 - BLOCK
      ?auto_805144 - BLOCK
      ?auto_805145 - BLOCK
      ?auto_805146 - BLOCK
      ?auto_805147 - BLOCK
      ?auto_805148 - BLOCK
      ?auto_805149 - BLOCK
      ?auto_805150 - BLOCK
    )
    :vars
    (
      ?auto_805151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805150 ?auto_805151 ) ( ON-TABLE ?auto_805137 ) ( ON ?auto_805138 ?auto_805137 ) ( ON ?auto_805139 ?auto_805138 ) ( ON ?auto_805140 ?auto_805139 ) ( ON ?auto_805141 ?auto_805140 ) ( ON ?auto_805142 ?auto_805141 ) ( not ( = ?auto_805137 ?auto_805138 ) ) ( not ( = ?auto_805137 ?auto_805139 ) ) ( not ( = ?auto_805137 ?auto_805140 ) ) ( not ( = ?auto_805137 ?auto_805141 ) ) ( not ( = ?auto_805137 ?auto_805142 ) ) ( not ( = ?auto_805137 ?auto_805143 ) ) ( not ( = ?auto_805137 ?auto_805144 ) ) ( not ( = ?auto_805137 ?auto_805145 ) ) ( not ( = ?auto_805137 ?auto_805146 ) ) ( not ( = ?auto_805137 ?auto_805147 ) ) ( not ( = ?auto_805137 ?auto_805148 ) ) ( not ( = ?auto_805137 ?auto_805149 ) ) ( not ( = ?auto_805137 ?auto_805150 ) ) ( not ( = ?auto_805137 ?auto_805151 ) ) ( not ( = ?auto_805138 ?auto_805139 ) ) ( not ( = ?auto_805138 ?auto_805140 ) ) ( not ( = ?auto_805138 ?auto_805141 ) ) ( not ( = ?auto_805138 ?auto_805142 ) ) ( not ( = ?auto_805138 ?auto_805143 ) ) ( not ( = ?auto_805138 ?auto_805144 ) ) ( not ( = ?auto_805138 ?auto_805145 ) ) ( not ( = ?auto_805138 ?auto_805146 ) ) ( not ( = ?auto_805138 ?auto_805147 ) ) ( not ( = ?auto_805138 ?auto_805148 ) ) ( not ( = ?auto_805138 ?auto_805149 ) ) ( not ( = ?auto_805138 ?auto_805150 ) ) ( not ( = ?auto_805138 ?auto_805151 ) ) ( not ( = ?auto_805139 ?auto_805140 ) ) ( not ( = ?auto_805139 ?auto_805141 ) ) ( not ( = ?auto_805139 ?auto_805142 ) ) ( not ( = ?auto_805139 ?auto_805143 ) ) ( not ( = ?auto_805139 ?auto_805144 ) ) ( not ( = ?auto_805139 ?auto_805145 ) ) ( not ( = ?auto_805139 ?auto_805146 ) ) ( not ( = ?auto_805139 ?auto_805147 ) ) ( not ( = ?auto_805139 ?auto_805148 ) ) ( not ( = ?auto_805139 ?auto_805149 ) ) ( not ( = ?auto_805139 ?auto_805150 ) ) ( not ( = ?auto_805139 ?auto_805151 ) ) ( not ( = ?auto_805140 ?auto_805141 ) ) ( not ( = ?auto_805140 ?auto_805142 ) ) ( not ( = ?auto_805140 ?auto_805143 ) ) ( not ( = ?auto_805140 ?auto_805144 ) ) ( not ( = ?auto_805140 ?auto_805145 ) ) ( not ( = ?auto_805140 ?auto_805146 ) ) ( not ( = ?auto_805140 ?auto_805147 ) ) ( not ( = ?auto_805140 ?auto_805148 ) ) ( not ( = ?auto_805140 ?auto_805149 ) ) ( not ( = ?auto_805140 ?auto_805150 ) ) ( not ( = ?auto_805140 ?auto_805151 ) ) ( not ( = ?auto_805141 ?auto_805142 ) ) ( not ( = ?auto_805141 ?auto_805143 ) ) ( not ( = ?auto_805141 ?auto_805144 ) ) ( not ( = ?auto_805141 ?auto_805145 ) ) ( not ( = ?auto_805141 ?auto_805146 ) ) ( not ( = ?auto_805141 ?auto_805147 ) ) ( not ( = ?auto_805141 ?auto_805148 ) ) ( not ( = ?auto_805141 ?auto_805149 ) ) ( not ( = ?auto_805141 ?auto_805150 ) ) ( not ( = ?auto_805141 ?auto_805151 ) ) ( not ( = ?auto_805142 ?auto_805143 ) ) ( not ( = ?auto_805142 ?auto_805144 ) ) ( not ( = ?auto_805142 ?auto_805145 ) ) ( not ( = ?auto_805142 ?auto_805146 ) ) ( not ( = ?auto_805142 ?auto_805147 ) ) ( not ( = ?auto_805142 ?auto_805148 ) ) ( not ( = ?auto_805142 ?auto_805149 ) ) ( not ( = ?auto_805142 ?auto_805150 ) ) ( not ( = ?auto_805142 ?auto_805151 ) ) ( not ( = ?auto_805143 ?auto_805144 ) ) ( not ( = ?auto_805143 ?auto_805145 ) ) ( not ( = ?auto_805143 ?auto_805146 ) ) ( not ( = ?auto_805143 ?auto_805147 ) ) ( not ( = ?auto_805143 ?auto_805148 ) ) ( not ( = ?auto_805143 ?auto_805149 ) ) ( not ( = ?auto_805143 ?auto_805150 ) ) ( not ( = ?auto_805143 ?auto_805151 ) ) ( not ( = ?auto_805144 ?auto_805145 ) ) ( not ( = ?auto_805144 ?auto_805146 ) ) ( not ( = ?auto_805144 ?auto_805147 ) ) ( not ( = ?auto_805144 ?auto_805148 ) ) ( not ( = ?auto_805144 ?auto_805149 ) ) ( not ( = ?auto_805144 ?auto_805150 ) ) ( not ( = ?auto_805144 ?auto_805151 ) ) ( not ( = ?auto_805145 ?auto_805146 ) ) ( not ( = ?auto_805145 ?auto_805147 ) ) ( not ( = ?auto_805145 ?auto_805148 ) ) ( not ( = ?auto_805145 ?auto_805149 ) ) ( not ( = ?auto_805145 ?auto_805150 ) ) ( not ( = ?auto_805145 ?auto_805151 ) ) ( not ( = ?auto_805146 ?auto_805147 ) ) ( not ( = ?auto_805146 ?auto_805148 ) ) ( not ( = ?auto_805146 ?auto_805149 ) ) ( not ( = ?auto_805146 ?auto_805150 ) ) ( not ( = ?auto_805146 ?auto_805151 ) ) ( not ( = ?auto_805147 ?auto_805148 ) ) ( not ( = ?auto_805147 ?auto_805149 ) ) ( not ( = ?auto_805147 ?auto_805150 ) ) ( not ( = ?auto_805147 ?auto_805151 ) ) ( not ( = ?auto_805148 ?auto_805149 ) ) ( not ( = ?auto_805148 ?auto_805150 ) ) ( not ( = ?auto_805148 ?auto_805151 ) ) ( not ( = ?auto_805149 ?auto_805150 ) ) ( not ( = ?auto_805149 ?auto_805151 ) ) ( not ( = ?auto_805150 ?auto_805151 ) ) ( ON ?auto_805149 ?auto_805150 ) ( ON ?auto_805148 ?auto_805149 ) ( ON ?auto_805147 ?auto_805148 ) ( ON ?auto_805146 ?auto_805147 ) ( ON ?auto_805145 ?auto_805146 ) ( ON ?auto_805144 ?auto_805145 ) ( CLEAR ?auto_805142 ) ( ON ?auto_805143 ?auto_805144 ) ( CLEAR ?auto_805143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_805137 ?auto_805138 ?auto_805139 ?auto_805140 ?auto_805141 ?auto_805142 ?auto_805143 )
      ( MAKE-14PILE ?auto_805137 ?auto_805138 ?auto_805139 ?auto_805140 ?auto_805141 ?auto_805142 ?auto_805143 ?auto_805144 ?auto_805145 ?auto_805146 ?auto_805147 ?auto_805148 ?auto_805149 ?auto_805150 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805195 - BLOCK
      ?auto_805196 - BLOCK
      ?auto_805197 - BLOCK
      ?auto_805198 - BLOCK
      ?auto_805199 - BLOCK
      ?auto_805200 - BLOCK
      ?auto_805201 - BLOCK
      ?auto_805202 - BLOCK
      ?auto_805203 - BLOCK
      ?auto_805204 - BLOCK
      ?auto_805205 - BLOCK
      ?auto_805206 - BLOCK
      ?auto_805207 - BLOCK
      ?auto_805208 - BLOCK
    )
    :vars
    (
      ?auto_805209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805208 ?auto_805209 ) ( ON-TABLE ?auto_805195 ) ( ON ?auto_805196 ?auto_805195 ) ( ON ?auto_805197 ?auto_805196 ) ( ON ?auto_805198 ?auto_805197 ) ( ON ?auto_805199 ?auto_805198 ) ( not ( = ?auto_805195 ?auto_805196 ) ) ( not ( = ?auto_805195 ?auto_805197 ) ) ( not ( = ?auto_805195 ?auto_805198 ) ) ( not ( = ?auto_805195 ?auto_805199 ) ) ( not ( = ?auto_805195 ?auto_805200 ) ) ( not ( = ?auto_805195 ?auto_805201 ) ) ( not ( = ?auto_805195 ?auto_805202 ) ) ( not ( = ?auto_805195 ?auto_805203 ) ) ( not ( = ?auto_805195 ?auto_805204 ) ) ( not ( = ?auto_805195 ?auto_805205 ) ) ( not ( = ?auto_805195 ?auto_805206 ) ) ( not ( = ?auto_805195 ?auto_805207 ) ) ( not ( = ?auto_805195 ?auto_805208 ) ) ( not ( = ?auto_805195 ?auto_805209 ) ) ( not ( = ?auto_805196 ?auto_805197 ) ) ( not ( = ?auto_805196 ?auto_805198 ) ) ( not ( = ?auto_805196 ?auto_805199 ) ) ( not ( = ?auto_805196 ?auto_805200 ) ) ( not ( = ?auto_805196 ?auto_805201 ) ) ( not ( = ?auto_805196 ?auto_805202 ) ) ( not ( = ?auto_805196 ?auto_805203 ) ) ( not ( = ?auto_805196 ?auto_805204 ) ) ( not ( = ?auto_805196 ?auto_805205 ) ) ( not ( = ?auto_805196 ?auto_805206 ) ) ( not ( = ?auto_805196 ?auto_805207 ) ) ( not ( = ?auto_805196 ?auto_805208 ) ) ( not ( = ?auto_805196 ?auto_805209 ) ) ( not ( = ?auto_805197 ?auto_805198 ) ) ( not ( = ?auto_805197 ?auto_805199 ) ) ( not ( = ?auto_805197 ?auto_805200 ) ) ( not ( = ?auto_805197 ?auto_805201 ) ) ( not ( = ?auto_805197 ?auto_805202 ) ) ( not ( = ?auto_805197 ?auto_805203 ) ) ( not ( = ?auto_805197 ?auto_805204 ) ) ( not ( = ?auto_805197 ?auto_805205 ) ) ( not ( = ?auto_805197 ?auto_805206 ) ) ( not ( = ?auto_805197 ?auto_805207 ) ) ( not ( = ?auto_805197 ?auto_805208 ) ) ( not ( = ?auto_805197 ?auto_805209 ) ) ( not ( = ?auto_805198 ?auto_805199 ) ) ( not ( = ?auto_805198 ?auto_805200 ) ) ( not ( = ?auto_805198 ?auto_805201 ) ) ( not ( = ?auto_805198 ?auto_805202 ) ) ( not ( = ?auto_805198 ?auto_805203 ) ) ( not ( = ?auto_805198 ?auto_805204 ) ) ( not ( = ?auto_805198 ?auto_805205 ) ) ( not ( = ?auto_805198 ?auto_805206 ) ) ( not ( = ?auto_805198 ?auto_805207 ) ) ( not ( = ?auto_805198 ?auto_805208 ) ) ( not ( = ?auto_805198 ?auto_805209 ) ) ( not ( = ?auto_805199 ?auto_805200 ) ) ( not ( = ?auto_805199 ?auto_805201 ) ) ( not ( = ?auto_805199 ?auto_805202 ) ) ( not ( = ?auto_805199 ?auto_805203 ) ) ( not ( = ?auto_805199 ?auto_805204 ) ) ( not ( = ?auto_805199 ?auto_805205 ) ) ( not ( = ?auto_805199 ?auto_805206 ) ) ( not ( = ?auto_805199 ?auto_805207 ) ) ( not ( = ?auto_805199 ?auto_805208 ) ) ( not ( = ?auto_805199 ?auto_805209 ) ) ( not ( = ?auto_805200 ?auto_805201 ) ) ( not ( = ?auto_805200 ?auto_805202 ) ) ( not ( = ?auto_805200 ?auto_805203 ) ) ( not ( = ?auto_805200 ?auto_805204 ) ) ( not ( = ?auto_805200 ?auto_805205 ) ) ( not ( = ?auto_805200 ?auto_805206 ) ) ( not ( = ?auto_805200 ?auto_805207 ) ) ( not ( = ?auto_805200 ?auto_805208 ) ) ( not ( = ?auto_805200 ?auto_805209 ) ) ( not ( = ?auto_805201 ?auto_805202 ) ) ( not ( = ?auto_805201 ?auto_805203 ) ) ( not ( = ?auto_805201 ?auto_805204 ) ) ( not ( = ?auto_805201 ?auto_805205 ) ) ( not ( = ?auto_805201 ?auto_805206 ) ) ( not ( = ?auto_805201 ?auto_805207 ) ) ( not ( = ?auto_805201 ?auto_805208 ) ) ( not ( = ?auto_805201 ?auto_805209 ) ) ( not ( = ?auto_805202 ?auto_805203 ) ) ( not ( = ?auto_805202 ?auto_805204 ) ) ( not ( = ?auto_805202 ?auto_805205 ) ) ( not ( = ?auto_805202 ?auto_805206 ) ) ( not ( = ?auto_805202 ?auto_805207 ) ) ( not ( = ?auto_805202 ?auto_805208 ) ) ( not ( = ?auto_805202 ?auto_805209 ) ) ( not ( = ?auto_805203 ?auto_805204 ) ) ( not ( = ?auto_805203 ?auto_805205 ) ) ( not ( = ?auto_805203 ?auto_805206 ) ) ( not ( = ?auto_805203 ?auto_805207 ) ) ( not ( = ?auto_805203 ?auto_805208 ) ) ( not ( = ?auto_805203 ?auto_805209 ) ) ( not ( = ?auto_805204 ?auto_805205 ) ) ( not ( = ?auto_805204 ?auto_805206 ) ) ( not ( = ?auto_805204 ?auto_805207 ) ) ( not ( = ?auto_805204 ?auto_805208 ) ) ( not ( = ?auto_805204 ?auto_805209 ) ) ( not ( = ?auto_805205 ?auto_805206 ) ) ( not ( = ?auto_805205 ?auto_805207 ) ) ( not ( = ?auto_805205 ?auto_805208 ) ) ( not ( = ?auto_805205 ?auto_805209 ) ) ( not ( = ?auto_805206 ?auto_805207 ) ) ( not ( = ?auto_805206 ?auto_805208 ) ) ( not ( = ?auto_805206 ?auto_805209 ) ) ( not ( = ?auto_805207 ?auto_805208 ) ) ( not ( = ?auto_805207 ?auto_805209 ) ) ( not ( = ?auto_805208 ?auto_805209 ) ) ( ON ?auto_805207 ?auto_805208 ) ( ON ?auto_805206 ?auto_805207 ) ( ON ?auto_805205 ?auto_805206 ) ( ON ?auto_805204 ?auto_805205 ) ( ON ?auto_805203 ?auto_805204 ) ( ON ?auto_805202 ?auto_805203 ) ( ON ?auto_805201 ?auto_805202 ) ( CLEAR ?auto_805199 ) ( ON ?auto_805200 ?auto_805201 ) ( CLEAR ?auto_805200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_805195 ?auto_805196 ?auto_805197 ?auto_805198 ?auto_805199 ?auto_805200 )
      ( MAKE-14PILE ?auto_805195 ?auto_805196 ?auto_805197 ?auto_805198 ?auto_805199 ?auto_805200 ?auto_805201 ?auto_805202 ?auto_805203 ?auto_805204 ?auto_805205 ?auto_805206 ?auto_805207 ?auto_805208 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805253 - BLOCK
      ?auto_805254 - BLOCK
      ?auto_805255 - BLOCK
      ?auto_805256 - BLOCK
      ?auto_805257 - BLOCK
      ?auto_805258 - BLOCK
      ?auto_805259 - BLOCK
      ?auto_805260 - BLOCK
      ?auto_805261 - BLOCK
      ?auto_805262 - BLOCK
      ?auto_805263 - BLOCK
      ?auto_805264 - BLOCK
      ?auto_805265 - BLOCK
      ?auto_805266 - BLOCK
    )
    :vars
    (
      ?auto_805267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805266 ?auto_805267 ) ( ON-TABLE ?auto_805253 ) ( ON ?auto_805254 ?auto_805253 ) ( ON ?auto_805255 ?auto_805254 ) ( ON ?auto_805256 ?auto_805255 ) ( not ( = ?auto_805253 ?auto_805254 ) ) ( not ( = ?auto_805253 ?auto_805255 ) ) ( not ( = ?auto_805253 ?auto_805256 ) ) ( not ( = ?auto_805253 ?auto_805257 ) ) ( not ( = ?auto_805253 ?auto_805258 ) ) ( not ( = ?auto_805253 ?auto_805259 ) ) ( not ( = ?auto_805253 ?auto_805260 ) ) ( not ( = ?auto_805253 ?auto_805261 ) ) ( not ( = ?auto_805253 ?auto_805262 ) ) ( not ( = ?auto_805253 ?auto_805263 ) ) ( not ( = ?auto_805253 ?auto_805264 ) ) ( not ( = ?auto_805253 ?auto_805265 ) ) ( not ( = ?auto_805253 ?auto_805266 ) ) ( not ( = ?auto_805253 ?auto_805267 ) ) ( not ( = ?auto_805254 ?auto_805255 ) ) ( not ( = ?auto_805254 ?auto_805256 ) ) ( not ( = ?auto_805254 ?auto_805257 ) ) ( not ( = ?auto_805254 ?auto_805258 ) ) ( not ( = ?auto_805254 ?auto_805259 ) ) ( not ( = ?auto_805254 ?auto_805260 ) ) ( not ( = ?auto_805254 ?auto_805261 ) ) ( not ( = ?auto_805254 ?auto_805262 ) ) ( not ( = ?auto_805254 ?auto_805263 ) ) ( not ( = ?auto_805254 ?auto_805264 ) ) ( not ( = ?auto_805254 ?auto_805265 ) ) ( not ( = ?auto_805254 ?auto_805266 ) ) ( not ( = ?auto_805254 ?auto_805267 ) ) ( not ( = ?auto_805255 ?auto_805256 ) ) ( not ( = ?auto_805255 ?auto_805257 ) ) ( not ( = ?auto_805255 ?auto_805258 ) ) ( not ( = ?auto_805255 ?auto_805259 ) ) ( not ( = ?auto_805255 ?auto_805260 ) ) ( not ( = ?auto_805255 ?auto_805261 ) ) ( not ( = ?auto_805255 ?auto_805262 ) ) ( not ( = ?auto_805255 ?auto_805263 ) ) ( not ( = ?auto_805255 ?auto_805264 ) ) ( not ( = ?auto_805255 ?auto_805265 ) ) ( not ( = ?auto_805255 ?auto_805266 ) ) ( not ( = ?auto_805255 ?auto_805267 ) ) ( not ( = ?auto_805256 ?auto_805257 ) ) ( not ( = ?auto_805256 ?auto_805258 ) ) ( not ( = ?auto_805256 ?auto_805259 ) ) ( not ( = ?auto_805256 ?auto_805260 ) ) ( not ( = ?auto_805256 ?auto_805261 ) ) ( not ( = ?auto_805256 ?auto_805262 ) ) ( not ( = ?auto_805256 ?auto_805263 ) ) ( not ( = ?auto_805256 ?auto_805264 ) ) ( not ( = ?auto_805256 ?auto_805265 ) ) ( not ( = ?auto_805256 ?auto_805266 ) ) ( not ( = ?auto_805256 ?auto_805267 ) ) ( not ( = ?auto_805257 ?auto_805258 ) ) ( not ( = ?auto_805257 ?auto_805259 ) ) ( not ( = ?auto_805257 ?auto_805260 ) ) ( not ( = ?auto_805257 ?auto_805261 ) ) ( not ( = ?auto_805257 ?auto_805262 ) ) ( not ( = ?auto_805257 ?auto_805263 ) ) ( not ( = ?auto_805257 ?auto_805264 ) ) ( not ( = ?auto_805257 ?auto_805265 ) ) ( not ( = ?auto_805257 ?auto_805266 ) ) ( not ( = ?auto_805257 ?auto_805267 ) ) ( not ( = ?auto_805258 ?auto_805259 ) ) ( not ( = ?auto_805258 ?auto_805260 ) ) ( not ( = ?auto_805258 ?auto_805261 ) ) ( not ( = ?auto_805258 ?auto_805262 ) ) ( not ( = ?auto_805258 ?auto_805263 ) ) ( not ( = ?auto_805258 ?auto_805264 ) ) ( not ( = ?auto_805258 ?auto_805265 ) ) ( not ( = ?auto_805258 ?auto_805266 ) ) ( not ( = ?auto_805258 ?auto_805267 ) ) ( not ( = ?auto_805259 ?auto_805260 ) ) ( not ( = ?auto_805259 ?auto_805261 ) ) ( not ( = ?auto_805259 ?auto_805262 ) ) ( not ( = ?auto_805259 ?auto_805263 ) ) ( not ( = ?auto_805259 ?auto_805264 ) ) ( not ( = ?auto_805259 ?auto_805265 ) ) ( not ( = ?auto_805259 ?auto_805266 ) ) ( not ( = ?auto_805259 ?auto_805267 ) ) ( not ( = ?auto_805260 ?auto_805261 ) ) ( not ( = ?auto_805260 ?auto_805262 ) ) ( not ( = ?auto_805260 ?auto_805263 ) ) ( not ( = ?auto_805260 ?auto_805264 ) ) ( not ( = ?auto_805260 ?auto_805265 ) ) ( not ( = ?auto_805260 ?auto_805266 ) ) ( not ( = ?auto_805260 ?auto_805267 ) ) ( not ( = ?auto_805261 ?auto_805262 ) ) ( not ( = ?auto_805261 ?auto_805263 ) ) ( not ( = ?auto_805261 ?auto_805264 ) ) ( not ( = ?auto_805261 ?auto_805265 ) ) ( not ( = ?auto_805261 ?auto_805266 ) ) ( not ( = ?auto_805261 ?auto_805267 ) ) ( not ( = ?auto_805262 ?auto_805263 ) ) ( not ( = ?auto_805262 ?auto_805264 ) ) ( not ( = ?auto_805262 ?auto_805265 ) ) ( not ( = ?auto_805262 ?auto_805266 ) ) ( not ( = ?auto_805262 ?auto_805267 ) ) ( not ( = ?auto_805263 ?auto_805264 ) ) ( not ( = ?auto_805263 ?auto_805265 ) ) ( not ( = ?auto_805263 ?auto_805266 ) ) ( not ( = ?auto_805263 ?auto_805267 ) ) ( not ( = ?auto_805264 ?auto_805265 ) ) ( not ( = ?auto_805264 ?auto_805266 ) ) ( not ( = ?auto_805264 ?auto_805267 ) ) ( not ( = ?auto_805265 ?auto_805266 ) ) ( not ( = ?auto_805265 ?auto_805267 ) ) ( not ( = ?auto_805266 ?auto_805267 ) ) ( ON ?auto_805265 ?auto_805266 ) ( ON ?auto_805264 ?auto_805265 ) ( ON ?auto_805263 ?auto_805264 ) ( ON ?auto_805262 ?auto_805263 ) ( ON ?auto_805261 ?auto_805262 ) ( ON ?auto_805260 ?auto_805261 ) ( ON ?auto_805259 ?auto_805260 ) ( ON ?auto_805258 ?auto_805259 ) ( CLEAR ?auto_805256 ) ( ON ?auto_805257 ?auto_805258 ) ( CLEAR ?auto_805257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_805253 ?auto_805254 ?auto_805255 ?auto_805256 ?auto_805257 )
      ( MAKE-14PILE ?auto_805253 ?auto_805254 ?auto_805255 ?auto_805256 ?auto_805257 ?auto_805258 ?auto_805259 ?auto_805260 ?auto_805261 ?auto_805262 ?auto_805263 ?auto_805264 ?auto_805265 ?auto_805266 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805311 - BLOCK
      ?auto_805312 - BLOCK
      ?auto_805313 - BLOCK
      ?auto_805314 - BLOCK
      ?auto_805315 - BLOCK
      ?auto_805316 - BLOCK
      ?auto_805317 - BLOCK
      ?auto_805318 - BLOCK
      ?auto_805319 - BLOCK
      ?auto_805320 - BLOCK
      ?auto_805321 - BLOCK
      ?auto_805322 - BLOCK
      ?auto_805323 - BLOCK
      ?auto_805324 - BLOCK
    )
    :vars
    (
      ?auto_805325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805324 ?auto_805325 ) ( ON-TABLE ?auto_805311 ) ( ON ?auto_805312 ?auto_805311 ) ( ON ?auto_805313 ?auto_805312 ) ( not ( = ?auto_805311 ?auto_805312 ) ) ( not ( = ?auto_805311 ?auto_805313 ) ) ( not ( = ?auto_805311 ?auto_805314 ) ) ( not ( = ?auto_805311 ?auto_805315 ) ) ( not ( = ?auto_805311 ?auto_805316 ) ) ( not ( = ?auto_805311 ?auto_805317 ) ) ( not ( = ?auto_805311 ?auto_805318 ) ) ( not ( = ?auto_805311 ?auto_805319 ) ) ( not ( = ?auto_805311 ?auto_805320 ) ) ( not ( = ?auto_805311 ?auto_805321 ) ) ( not ( = ?auto_805311 ?auto_805322 ) ) ( not ( = ?auto_805311 ?auto_805323 ) ) ( not ( = ?auto_805311 ?auto_805324 ) ) ( not ( = ?auto_805311 ?auto_805325 ) ) ( not ( = ?auto_805312 ?auto_805313 ) ) ( not ( = ?auto_805312 ?auto_805314 ) ) ( not ( = ?auto_805312 ?auto_805315 ) ) ( not ( = ?auto_805312 ?auto_805316 ) ) ( not ( = ?auto_805312 ?auto_805317 ) ) ( not ( = ?auto_805312 ?auto_805318 ) ) ( not ( = ?auto_805312 ?auto_805319 ) ) ( not ( = ?auto_805312 ?auto_805320 ) ) ( not ( = ?auto_805312 ?auto_805321 ) ) ( not ( = ?auto_805312 ?auto_805322 ) ) ( not ( = ?auto_805312 ?auto_805323 ) ) ( not ( = ?auto_805312 ?auto_805324 ) ) ( not ( = ?auto_805312 ?auto_805325 ) ) ( not ( = ?auto_805313 ?auto_805314 ) ) ( not ( = ?auto_805313 ?auto_805315 ) ) ( not ( = ?auto_805313 ?auto_805316 ) ) ( not ( = ?auto_805313 ?auto_805317 ) ) ( not ( = ?auto_805313 ?auto_805318 ) ) ( not ( = ?auto_805313 ?auto_805319 ) ) ( not ( = ?auto_805313 ?auto_805320 ) ) ( not ( = ?auto_805313 ?auto_805321 ) ) ( not ( = ?auto_805313 ?auto_805322 ) ) ( not ( = ?auto_805313 ?auto_805323 ) ) ( not ( = ?auto_805313 ?auto_805324 ) ) ( not ( = ?auto_805313 ?auto_805325 ) ) ( not ( = ?auto_805314 ?auto_805315 ) ) ( not ( = ?auto_805314 ?auto_805316 ) ) ( not ( = ?auto_805314 ?auto_805317 ) ) ( not ( = ?auto_805314 ?auto_805318 ) ) ( not ( = ?auto_805314 ?auto_805319 ) ) ( not ( = ?auto_805314 ?auto_805320 ) ) ( not ( = ?auto_805314 ?auto_805321 ) ) ( not ( = ?auto_805314 ?auto_805322 ) ) ( not ( = ?auto_805314 ?auto_805323 ) ) ( not ( = ?auto_805314 ?auto_805324 ) ) ( not ( = ?auto_805314 ?auto_805325 ) ) ( not ( = ?auto_805315 ?auto_805316 ) ) ( not ( = ?auto_805315 ?auto_805317 ) ) ( not ( = ?auto_805315 ?auto_805318 ) ) ( not ( = ?auto_805315 ?auto_805319 ) ) ( not ( = ?auto_805315 ?auto_805320 ) ) ( not ( = ?auto_805315 ?auto_805321 ) ) ( not ( = ?auto_805315 ?auto_805322 ) ) ( not ( = ?auto_805315 ?auto_805323 ) ) ( not ( = ?auto_805315 ?auto_805324 ) ) ( not ( = ?auto_805315 ?auto_805325 ) ) ( not ( = ?auto_805316 ?auto_805317 ) ) ( not ( = ?auto_805316 ?auto_805318 ) ) ( not ( = ?auto_805316 ?auto_805319 ) ) ( not ( = ?auto_805316 ?auto_805320 ) ) ( not ( = ?auto_805316 ?auto_805321 ) ) ( not ( = ?auto_805316 ?auto_805322 ) ) ( not ( = ?auto_805316 ?auto_805323 ) ) ( not ( = ?auto_805316 ?auto_805324 ) ) ( not ( = ?auto_805316 ?auto_805325 ) ) ( not ( = ?auto_805317 ?auto_805318 ) ) ( not ( = ?auto_805317 ?auto_805319 ) ) ( not ( = ?auto_805317 ?auto_805320 ) ) ( not ( = ?auto_805317 ?auto_805321 ) ) ( not ( = ?auto_805317 ?auto_805322 ) ) ( not ( = ?auto_805317 ?auto_805323 ) ) ( not ( = ?auto_805317 ?auto_805324 ) ) ( not ( = ?auto_805317 ?auto_805325 ) ) ( not ( = ?auto_805318 ?auto_805319 ) ) ( not ( = ?auto_805318 ?auto_805320 ) ) ( not ( = ?auto_805318 ?auto_805321 ) ) ( not ( = ?auto_805318 ?auto_805322 ) ) ( not ( = ?auto_805318 ?auto_805323 ) ) ( not ( = ?auto_805318 ?auto_805324 ) ) ( not ( = ?auto_805318 ?auto_805325 ) ) ( not ( = ?auto_805319 ?auto_805320 ) ) ( not ( = ?auto_805319 ?auto_805321 ) ) ( not ( = ?auto_805319 ?auto_805322 ) ) ( not ( = ?auto_805319 ?auto_805323 ) ) ( not ( = ?auto_805319 ?auto_805324 ) ) ( not ( = ?auto_805319 ?auto_805325 ) ) ( not ( = ?auto_805320 ?auto_805321 ) ) ( not ( = ?auto_805320 ?auto_805322 ) ) ( not ( = ?auto_805320 ?auto_805323 ) ) ( not ( = ?auto_805320 ?auto_805324 ) ) ( not ( = ?auto_805320 ?auto_805325 ) ) ( not ( = ?auto_805321 ?auto_805322 ) ) ( not ( = ?auto_805321 ?auto_805323 ) ) ( not ( = ?auto_805321 ?auto_805324 ) ) ( not ( = ?auto_805321 ?auto_805325 ) ) ( not ( = ?auto_805322 ?auto_805323 ) ) ( not ( = ?auto_805322 ?auto_805324 ) ) ( not ( = ?auto_805322 ?auto_805325 ) ) ( not ( = ?auto_805323 ?auto_805324 ) ) ( not ( = ?auto_805323 ?auto_805325 ) ) ( not ( = ?auto_805324 ?auto_805325 ) ) ( ON ?auto_805323 ?auto_805324 ) ( ON ?auto_805322 ?auto_805323 ) ( ON ?auto_805321 ?auto_805322 ) ( ON ?auto_805320 ?auto_805321 ) ( ON ?auto_805319 ?auto_805320 ) ( ON ?auto_805318 ?auto_805319 ) ( ON ?auto_805317 ?auto_805318 ) ( ON ?auto_805316 ?auto_805317 ) ( ON ?auto_805315 ?auto_805316 ) ( CLEAR ?auto_805313 ) ( ON ?auto_805314 ?auto_805315 ) ( CLEAR ?auto_805314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_805311 ?auto_805312 ?auto_805313 ?auto_805314 )
      ( MAKE-14PILE ?auto_805311 ?auto_805312 ?auto_805313 ?auto_805314 ?auto_805315 ?auto_805316 ?auto_805317 ?auto_805318 ?auto_805319 ?auto_805320 ?auto_805321 ?auto_805322 ?auto_805323 ?auto_805324 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805369 - BLOCK
      ?auto_805370 - BLOCK
      ?auto_805371 - BLOCK
      ?auto_805372 - BLOCK
      ?auto_805373 - BLOCK
      ?auto_805374 - BLOCK
      ?auto_805375 - BLOCK
      ?auto_805376 - BLOCK
      ?auto_805377 - BLOCK
      ?auto_805378 - BLOCK
      ?auto_805379 - BLOCK
      ?auto_805380 - BLOCK
      ?auto_805381 - BLOCK
      ?auto_805382 - BLOCK
    )
    :vars
    (
      ?auto_805383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805382 ?auto_805383 ) ( ON-TABLE ?auto_805369 ) ( ON ?auto_805370 ?auto_805369 ) ( not ( = ?auto_805369 ?auto_805370 ) ) ( not ( = ?auto_805369 ?auto_805371 ) ) ( not ( = ?auto_805369 ?auto_805372 ) ) ( not ( = ?auto_805369 ?auto_805373 ) ) ( not ( = ?auto_805369 ?auto_805374 ) ) ( not ( = ?auto_805369 ?auto_805375 ) ) ( not ( = ?auto_805369 ?auto_805376 ) ) ( not ( = ?auto_805369 ?auto_805377 ) ) ( not ( = ?auto_805369 ?auto_805378 ) ) ( not ( = ?auto_805369 ?auto_805379 ) ) ( not ( = ?auto_805369 ?auto_805380 ) ) ( not ( = ?auto_805369 ?auto_805381 ) ) ( not ( = ?auto_805369 ?auto_805382 ) ) ( not ( = ?auto_805369 ?auto_805383 ) ) ( not ( = ?auto_805370 ?auto_805371 ) ) ( not ( = ?auto_805370 ?auto_805372 ) ) ( not ( = ?auto_805370 ?auto_805373 ) ) ( not ( = ?auto_805370 ?auto_805374 ) ) ( not ( = ?auto_805370 ?auto_805375 ) ) ( not ( = ?auto_805370 ?auto_805376 ) ) ( not ( = ?auto_805370 ?auto_805377 ) ) ( not ( = ?auto_805370 ?auto_805378 ) ) ( not ( = ?auto_805370 ?auto_805379 ) ) ( not ( = ?auto_805370 ?auto_805380 ) ) ( not ( = ?auto_805370 ?auto_805381 ) ) ( not ( = ?auto_805370 ?auto_805382 ) ) ( not ( = ?auto_805370 ?auto_805383 ) ) ( not ( = ?auto_805371 ?auto_805372 ) ) ( not ( = ?auto_805371 ?auto_805373 ) ) ( not ( = ?auto_805371 ?auto_805374 ) ) ( not ( = ?auto_805371 ?auto_805375 ) ) ( not ( = ?auto_805371 ?auto_805376 ) ) ( not ( = ?auto_805371 ?auto_805377 ) ) ( not ( = ?auto_805371 ?auto_805378 ) ) ( not ( = ?auto_805371 ?auto_805379 ) ) ( not ( = ?auto_805371 ?auto_805380 ) ) ( not ( = ?auto_805371 ?auto_805381 ) ) ( not ( = ?auto_805371 ?auto_805382 ) ) ( not ( = ?auto_805371 ?auto_805383 ) ) ( not ( = ?auto_805372 ?auto_805373 ) ) ( not ( = ?auto_805372 ?auto_805374 ) ) ( not ( = ?auto_805372 ?auto_805375 ) ) ( not ( = ?auto_805372 ?auto_805376 ) ) ( not ( = ?auto_805372 ?auto_805377 ) ) ( not ( = ?auto_805372 ?auto_805378 ) ) ( not ( = ?auto_805372 ?auto_805379 ) ) ( not ( = ?auto_805372 ?auto_805380 ) ) ( not ( = ?auto_805372 ?auto_805381 ) ) ( not ( = ?auto_805372 ?auto_805382 ) ) ( not ( = ?auto_805372 ?auto_805383 ) ) ( not ( = ?auto_805373 ?auto_805374 ) ) ( not ( = ?auto_805373 ?auto_805375 ) ) ( not ( = ?auto_805373 ?auto_805376 ) ) ( not ( = ?auto_805373 ?auto_805377 ) ) ( not ( = ?auto_805373 ?auto_805378 ) ) ( not ( = ?auto_805373 ?auto_805379 ) ) ( not ( = ?auto_805373 ?auto_805380 ) ) ( not ( = ?auto_805373 ?auto_805381 ) ) ( not ( = ?auto_805373 ?auto_805382 ) ) ( not ( = ?auto_805373 ?auto_805383 ) ) ( not ( = ?auto_805374 ?auto_805375 ) ) ( not ( = ?auto_805374 ?auto_805376 ) ) ( not ( = ?auto_805374 ?auto_805377 ) ) ( not ( = ?auto_805374 ?auto_805378 ) ) ( not ( = ?auto_805374 ?auto_805379 ) ) ( not ( = ?auto_805374 ?auto_805380 ) ) ( not ( = ?auto_805374 ?auto_805381 ) ) ( not ( = ?auto_805374 ?auto_805382 ) ) ( not ( = ?auto_805374 ?auto_805383 ) ) ( not ( = ?auto_805375 ?auto_805376 ) ) ( not ( = ?auto_805375 ?auto_805377 ) ) ( not ( = ?auto_805375 ?auto_805378 ) ) ( not ( = ?auto_805375 ?auto_805379 ) ) ( not ( = ?auto_805375 ?auto_805380 ) ) ( not ( = ?auto_805375 ?auto_805381 ) ) ( not ( = ?auto_805375 ?auto_805382 ) ) ( not ( = ?auto_805375 ?auto_805383 ) ) ( not ( = ?auto_805376 ?auto_805377 ) ) ( not ( = ?auto_805376 ?auto_805378 ) ) ( not ( = ?auto_805376 ?auto_805379 ) ) ( not ( = ?auto_805376 ?auto_805380 ) ) ( not ( = ?auto_805376 ?auto_805381 ) ) ( not ( = ?auto_805376 ?auto_805382 ) ) ( not ( = ?auto_805376 ?auto_805383 ) ) ( not ( = ?auto_805377 ?auto_805378 ) ) ( not ( = ?auto_805377 ?auto_805379 ) ) ( not ( = ?auto_805377 ?auto_805380 ) ) ( not ( = ?auto_805377 ?auto_805381 ) ) ( not ( = ?auto_805377 ?auto_805382 ) ) ( not ( = ?auto_805377 ?auto_805383 ) ) ( not ( = ?auto_805378 ?auto_805379 ) ) ( not ( = ?auto_805378 ?auto_805380 ) ) ( not ( = ?auto_805378 ?auto_805381 ) ) ( not ( = ?auto_805378 ?auto_805382 ) ) ( not ( = ?auto_805378 ?auto_805383 ) ) ( not ( = ?auto_805379 ?auto_805380 ) ) ( not ( = ?auto_805379 ?auto_805381 ) ) ( not ( = ?auto_805379 ?auto_805382 ) ) ( not ( = ?auto_805379 ?auto_805383 ) ) ( not ( = ?auto_805380 ?auto_805381 ) ) ( not ( = ?auto_805380 ?auto_805382 ) ) ( not ( = ?auto_805380 ?auto_805383 ) ) ( not ( = ?auto_805381 ?auto_805382 ) ) ( not ( = ?auto_805381 ?auto_805383 ) ) ( not ( = ?auto_805382 ?auto_805383 ) ) ( ON ?auto_805381 ?auto_805382 ) ( ON ?auto_805380 ?auto_805381 ) ( ON ?auto_805379 ?auto_805380 ) ( ON ?auto_805378 ?auto_805379 ) ( ON ?auto_805377 ?auto_805378 ) ( ON ?auto_805376 ?auto_805377 ) ( ON ?auto_805375 ?auto_805376 ) ( ON ?auto_805374 ?auto_805375 ) ( ON ?auto_805373 ?auto_805374 ) ( ON ?auto_805372 ?auto_805373 ) ( CLEAR ?auto_805370 ) ( ON ?auto_805371 ?auto_805372 ) ( CLEAR ?auto_805371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_805369 ?auto_805370 ?auto_805371 )
      ( MAKE-14PILE ?auto_805369 ?auto_805370 ?auto_805371 ?auto_805372 ?auto_805373 ?auto_805374 ?auto_805375 ?auto_805376 ?auto_805377 ?auto_805378 ?auto_805379 ?auto_805380 ?auto_805381 ?auto_805382 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805427 - BLOCK
      ?auto_805428 - BLOCK
      ?auto_805429 - BLOCK
      ?auto_805430 - BLOCK
      ?auto_805431 - BLOCK
      ?auto_805432 - BLOCK
      ?auto_805433 - BLOCK
      ?auto_805434 - BLOCK
      ?auto_805435 - BLOCK
      ?auto_805436 - BLOCK
      ?auto_805437 - BLOCK
      ?auto_805438 - BLOCK
      ?auto_805439 - BLOCK
      ?auto_805440 - BLOCK
    )
    :vars
    (
      ?auto_805441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805440 ?auto_805441 ) ( ON-TABLE ?auto_805427 ) ( not ( = ?auto_805427 ?auto_805428 ) ) ( not ( = ?auto_805427 ?auto_805429 ) ) ( not ( = ?auto_805427 ?auto_805430 ) ) ( not ( = ?auto_805427 ?auto_805431 ) ) ( not ( = ?auto_805427 ?auto_805432 ) ) ( not ( = ?auto_805427 ?auto_805433 ) ) ( not ( = ?auto_805427 ?auto_805434 ) ) ( not ( = ?auto_805427 ?auto_805435 ) ) ( not ( = ?auto_805427 ?auto_805436 ) ) ( not ( = ?auto_805427 ?auto_805437 ) ) ( not ( = ?auto_805427 ?auto_805438 ) ) ( not ( = ?auto_805427 ?auto_805439 ) ) ( not ( = ?auto_805427 ?auto_805440 ) ) ( not ( = ?auto_805427 ?auto_805441 ) ) ( not ( = ?auto_805428 ?auto_805429 ) ) ( not ( = ?auto_805428 ?auto_805430 ) ) ( not ( = ?auto_805428 ?auto_805431 ) ) ( not ( = ?auto_805428 ?auto_805432 ) ) ( not ( = ?auto_805428 ?auto_805433 ) ) ( not ( = ?auto_805428 ?auto_805434 ) ) ( not ( = ?auto_805428 ?auto_805435 ) ) ( not ( = ?auto_805428 ?auto_805436 ) ) ( not ( = ?auto_805428 ?auto_805437 ) ) ( not ( = ?auto_805428 ?auto_805438 ) ) ( not ( = ?auto_805428 ?auto_805439 ) ) ( not ( = ?auto_805428 ?auto_805440 ) ) ( not ( = ?auto_805428 ?auto_805441 ) ) ( not ( = ?auto_805429 ?auto_805430 ) ) ( not ( = ?auto_805429 ?auto_805431 ) ) ( not ( = ?auto_805429 ?auto_805432 ) ) ( not ( = ?auto_805429 ?auto_805433 ) ) ( not ( = ?auto_805429 ?auto_805434 ) ) ( not ( = ?auto_805429 ?auto_805435 ) ) ( not ( = ?auto_805429 ?auto_805436 ) ) ( not ( = ?auto_805429 ?auto_805437 ) ) ( not ( = ?auto_805429 ?auto_805438 ) ) ( not ( = ?auto_805429 ?auto_805439 ) ) ( not ( = ?auto_805429 ?auto_805440 ) ) ( not ( = ?auto_805429 ?auto_805441 ) ) ( not ( = ?auto_805430 ?auto_805431 ) ) ( not ( = ?auto_805430 ?auto_805432 ) ) ( not ( = ?auto_805430 ?auto_805433 ) ) ( not ( = ?auto_805430 ?auto_805434 ) ) ( not ( = ?auto_805430 ?auto_805435 ) ) ( not ( = ?auto_805430 ?auto_805436 ) ) ( not ( = ?auto_805430 ?auto_805437 ) ) ( not ( = ?auto_805430 ?auto_805438 ) ) ( not ( = ?auto_805430 ?auto_805439 ) ) ( not ( = ?auto_805430 ?auto_805440 ) ) ( not ( = ?auto_805430 ?auto_805441 ) ) ( not ( = ?auto_805431 ?auto_805432 ) ) ( not ( = ?auto_805431 ?auto_805433 ) ) ( not ( = ?auto_805431 ?auto_805434 ) ) ( not ( = ?auto_805431 ?auto_805435 ) ) ( not ( = ?auto_805431 ?auto_805436 ) ) ( not ( = ?auto_805431 ?auto_805437 ) ) ( not ( = ?auto_805431 ?auto_805438 ) ) ( not ( = ?auto_805431 ?auto_805439 ) ) ( not ( = ?auto_805431 ?auto_805440 ) ) ( not ( = ?auto_805431 ?auto_805441 ) ) ( not ( = ?auto_805432 ?auto_805433 ) ) ( not ( = ?auto_805432 ?auto_805434 ) ) ( not ( = ?auto_805432 ?auto_805435 ) ) ( not ( = ?auto_805432 ?auto_805436 ) ) ( not ( = ?auto_805432 ?auto_805437 ) ) ( not ( = ?auto_805432 ?auto_805438 ) ) ( not ( = ?auto_805432 ?auto_805439 ) ) ( not ( = ?auto_805432 ?auto_805440 ) ) ( not ( = ?auto_805432 ?auto_805441 ) ) ( not ( = ?auto_805433 ?auto_805434 ) ) ( not ( = ?auto_805433 ?auto_805435 ) ) ( not ( = ?auto_805433 ?auto_805436 ) ) ( not ( = ?auto_805433 ?auto_805437 ) ) ( not ( = ?auto_805433 ?auto_805438 ) ) ( not ( = ?auto_805433 ?auto_805439 ) ) ( not ( = ?auto_805433 ?auto_805440 ) ) ( not ( = ?auto_805433 ?auto_805441 ) ) ( not ( = ?auto_805434 ?auto_805435 ) ) ( not ( = ?auto_805434 ?auto_805436 ) ) ( not ( = ?auto_805434 ?auto_805437 ) ) ( not ( = ?auto_805434 ?auto_805438 ) ) ( not ( = ?auto_805434 ?auto_805439 ) ) ( not ( = ?auto_805434 ?auto_805440 ) ) ( not ( = ?auto_805434 ?auto_805441 ) ) ( not ( = ?auto_805435 ?auto_805436 ) ) ( not ( = ?auto_805435 ?auto_805437 ) ) ( not ( = ?auto_805435 ?auto_805438 ) ) ( not ( = ?auto_805435 ?auto_805439 ) ) ( not ( = ?auto_805435 ?auto_805440 ) ) ( not ( = ?auto_805435 ?auto_805441 ) ) ( not ( = ?auto_805436 ?auto_805437 ) ) ( not ( = ?auto_805436 ?auto_805438 ) ) ( not ( = ?auto_805436 ?auto_805439 ) ) ( not ( = ?auto_805436 ?auto_805440 ) ) ( not ( = ?auto_805436 ?auto_805441 ) ) ( not ( = ?auto_805437 ?auto_805438 ) ) ( not ( = ?auto_805437 ?auto_805439 ) ) ( not ( = ?auto_805437 ?auto_805440 ) ) ( not ( = ?auto_805437 ?auto_805441 ) ) ( not ( = ?auto_805438 ?auto_805439 ) ) ( not ( = ?auto_805438 ?auto_805440 ) ) ( not ( = ?auto_805438 ?auto_805441 ) ) ( not ( = ?auto_805439 ?auto_805440 ) ) ( not ( = ?auto_805439 ?auto_805441 ) ) ( not ( = ?auto_805440 ?auto_805441 ) ) ( ON ?auto_805439 ?auto_805440 ) ( ON ?auto_805438 ?auto_805439 ) ( ON ?auto_805437 ?auto_805438 ) ( ON ?auto_805436 ?auto_805437 ) ( ON ?auto_805435 ?auto_805436 ) ( ON ?auto_805434 ?auto_805435 ) ( ON ?auto_805433 ?auto_805434 ) ( ON ?auto_805432 ?auto_805433 ) ( ON ?auto_805431 ?auto_805432 ) ( ON ?auto_805430 ?auto_805431 ) ( ON ?auto_805429 ?auto_805430 ) ( CLEAR ?auto_805427 ) ( ON ?auto_805428 ?auto_805429 ) ( CLEAR ?auto_805428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_805427 ?auto_805428 )
      ( MAKE-14PILE ?auto_805427 ?auto_805428 ?auto_805429 ?auto_805430 ?auto_805431 ?auto_805432 ?auto_805433 ?auto_805434 ?auto_805435 ?auto_805436 ?auto_805437 ?auto_805438 ?auto_805439 ?auto_805440 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_805485 - BLOCK
      ?auto_805486 - BLOCK
      ?auto_805487 - BLOCK
      ?auto_805488 - BLOCK
      ?auto_805489 - BLOCK
      ?auto_805490 - BLOCK
      ?auto_805491 - BLOCK
      ?auto_805492 - BLOCK
      ?auto_805493 - BLOCK
      ?auto_805494 - BLOCK
      ?auto_805495 - BLOCK
      ?auto_805496 - BLOCK
      ?auto_805497 - BLOCK
      ?auto_805498 - BLOCK
    )
    :vars
    (
      ?auto_805499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805498 ?auto_805499 ) ( not ( = ?auto_805485 ?auto_805486 ) ) ( not ( = ?auto_805485 ?auto_805487 ) ) ( not ( = ?auto_805485 ?auto_805488 ) ) ( not ( = ?auto_805485 ?auto_805489 ) ) ( not ( = ?auto_805485 ?auto_805490 ) ) ( not ( = ?auto_805485 ?auto_805491 ) ) ( not ( = ?auto_805485 ?auto_805492 ) ) ( not ( = ?auto_805485 ?auto_805493 ) ) ( not ( = ?auto_805485 ?auto_805494 ) ) ( not ( = ?auto_805485 ?auto_805495 ) ) ( not ( = ?auto_805485 ?auto_805496 ) ) ( not ( = ?auto_805485 ?auto_805497 ) ) ( not ( = ?auto_805485 ?auto_805498 ) ) ( not ( = ?auto_805485 ?auto_805499 ) ) ( not ( = ?auto_805486 ?auto_805487 ) ) ( not ( = ?auto_805486 ?auto_805488 ) ) ( not ( = ?auto_805486 ?auto_805489 ) ) ( not ( = ?auto_805486 ?auto_805490 ) ) ( not ( = ?auto_805486 ?auto_805491 ) ) ( not ( = ?auto_805486 ?auto_805492 ) ) ( not ( = ?auto_805486 ?auto_805493 ) ) ( not ( = ?auto_805486 ?auto_805494 ) ) ( not ( = ?auto_805486 ?auto_805495 ) ) ( not ( = ?auto_805486 ?auto_805496 ) ) ( not ( = ?auto_805486 ?auto_805497 ) ) ( not ( = ?auto_805486 ?auto_805498 ) ) ( not ( = ?auto_805486 ?auto_805499 ) ) ( not ( = ?auto_805487 ?auto_805488 ) ) ( not ( = ?auto_805487 ?auto_805489 ) ) ( not ( = ?auto_805487 ?auto_805490 ) ) ( not ( = ?auto_805487 ?auto_805491 ) ) ( not ( = ?auto_805487 ?auto_805492 ) ) ( not ( = ?auto_805487 ?auto_805493 ) ) ( not ( = ?auto_805487 ?auto_805494 ) ) ( not ( = ?auto_805487 ?auto_805495 ) ) ( not ( = ?auto_805487 ?auto_805496 ) ) ( not ( = ?auto_805487 ?auto_805497 ) ) ( not ( = ?auto_805487 ?auto_805498 ) ) ( not ( = ?auto_805487 ?auto_805499 ) ) ( not ( = ?auto_805488 ?auto_805489 ) ) ( not ( = ?auto_805488 ?auto_805490 ) ) ( not ( = ?auto_805488 ?auto_805491 ) ) ( not ( = ?auto_805488 ?auto_805492 ) ) ( not ( = ?auto_805488 ?auto_805493 ) ) ( not ( = ?auto_805488 ?auto_805494 ) ) ( not ( = ?auto_805488 ?auto_805495 ) ) ( not ( = ?auto_805488 ?auto_805496 ) ) ( not ( = ?auto_805488 ?auto_805497 ) ) ( not ( = ?auto_805488 ?auto_805498 ) ) ( not ( = ?auto_805488 ?auto_805499 ) ) ( not ( = ?auto_805489 ?auto_805490 ) ) ( not ( = ?auto_805489 ?auto_805491 ) ) ( not ( = ?auto_805489 ?auto_805492 ) ) ( not ( = ?auto_805489 ?auto_805493 ) ) ( not ( = ?auto_805489 ?auto_805494 ) ) ( not ( = ?auto_805489 ?auto_805495 ) ) ( not ( = ?auto_805489 ?auto_805496 ) ) ( not ( = ?auto_805489 ?auto_805497 ) ) ( not ( = ?auto_805489 ?auto_805498 ) ) ( not ( = ?auto_805489 ?auto_805499 ) ) ( not ( = ?auto_805490 ?auto_805491 ) ) ( not ( = ?auto_805490 ?auto_805492 ) ) ( not ( = ?auto_805490 ?auto_805493 ) ) ( not ( = ?auto_805490 ?auto_805494 ) ) ( not ( = ?auto_805490 ?auto_805495 ) ) ( not ( = ?auto_805490 ?auto_805496 ) ) ( not ( = ?auto_805490 ?auto_805497 ) ) ( not ( = ?auto_805490 ?auto_805498 ) ) ( not ( = ?auto_805490 ?auto_805499 ) ) ( not ( = ?auto_805491 ?auto_805492 ) ) ( not ( = ?auto_805491 ?auto_805493 ) ) ( not ( = ?auto_805491 ?auto_805494 ) ) ( not ( = ?auto_805491 ?auto_805495 ) ) ( not ( = ?auto_805491 ?auto_805496 ) ) ( not ( = ?auto_805491 ?auto_805497 ) ) ( not ( = ?auto_805491 ?auto_805498 ) ) ( not ( = ?auto_805491 ?auto_805499 ) ) ( not ( = ?auto_805492 ?auto_805493 ) ) ( not ( = ?auto_805492 ?auto_805494 ) ) ( not ( = ?auto_805492 ?auto_805495 ) ) ( not ( = ?auto_805492 ?auto_805496 ) ) ( not ( = ?auto_805492 ?auto_805497 ) ) ( not ( = ?auto_805492 ?auto_805498 ) ) ( not ( = ?auto_805492 ?auto_805499 ) ) ( not ( = ?auto_805493 ?auto_805494 ) ) ( not ( = ?auto_805493 ?auto_805495 ) ) ( not ( = ?auto_805493 ?auto_805496 ) ) ( not ( = ?auto_805493 ?auto_805497 ) ) ( not ( = ?auto_805493 ?auto_805498 ) ) ( not ( = ?auto_805493 ?auto_805499 ) ) ( not ( = ?auto_805494 ?auto_805495 ) ) ( not ( = ?auto_805494 ?auto_805496 ) ) ( not ( = ?auto_805494 ?auto_805497 ) ) ( not ( = ?auto_805494 ?auto_805498 ) ) ( not ( = ?auto_805494 ?auto_805499 ) ) ( not ( = ?auto_805495 ?auto_805496 ) ) ( not ( = ?auto_805495 ?auto_805497 ) ) ( not ( = ?auto_805495 ?auto_805498 ) ) ( not ( = ?auto_805495 ?auto_805499 ) ) ( not ( = ?auto_805496 ?auto_805497 ) ) ( not ( = ?auto_805496 ?auto_805498 ) ) ( not ( = ?auto_805496 ?auto_805499 ) ) ( not ( = ?auto_805497 ?auto_805498 ) ) ( not ( = ?auto_805497 ?auto_805499 ) ) ( not ( = ?auto_805498 ?auto_805499 ) ) ( ON ?auto_805497 ?auto_805498 ) ( ON ?auto_805496 ?auto_805497 ) ( ON ?auto_805495 ?auto_805496 ) ( ON ?auto_805494 ?auto_805495 ) ( ON ?auto_805493 ?auto_805494 ) ( ON ?auto_805492 ?auto_805493 ) ( ON ?auto_805491 ?auto_805492 ) ( ON ?auto_805490 ?auto_805491 ) ( ON ?auto_805489 ?auto_805490 ) ( ON ?auto_805488 ?auto_805489 ) ( ON ?auto_805487 ?auto_805488 ) ( ON ?auto_805486 ?auto_805487 ) ( ON ?auto_805485 ?auto_805486 ) ( CLEAR ?auto_805485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_805485 )
      ( MAKE-14PILE ?auto_805485 ?auto_805486 ?auto_805487 ?auto_805488 ?auto_805489 ?auto_805490 ?auto_805491 ?auto_805492 ?auto_805493 ?auto_805494 ?auto_805495 ?auto_805496 ?auto_805497 ?auto_805498 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805544 - BLOCK
      ?auto_805545 - BLOCK
      ?auto_805546 - BLOCK
      ?auto_805547 - BLOCK
      ?auto_805548 - BLOCK
      ?auto_805549 - BLOCK
      ?auto_805550 - BLOCK
      ?auto_805551 - BLOCK
      ?auto_805552 - BLOCK
      ?auto_805553 - BLOCK
      ?auto_805554 - BLOCK
      ?auto_805555 - BLOCK
      ?auto_805556 - BLOCK
      ?auto_805557 - BLOCK
      ?auto_805558 - BLOCK
    )
    :vars
    (
      ?auto_805559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_805557 ) ( ON ?auto_805558 ?auto_805559 ) ( CLEAR ?auto_805558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_805544 ) ( ON ?auto_805545 ?auto_805544 ) ( ON ?auto_805546 ?auto_805545 ) ( ON ?auto_805547 ?auto_805546 ) ( ON ?auto_805548 ?auto_805547 ) ( ON ?auto_805549 ?auto_805548 ) ( ON ?auto_805550 ?auto_805549 ) ( ON ?auto_805551 ?auto_805550 ) ( ON ?auto_805552 ?auto_805551 ) ( ON ?auto_805553 ?auto_805552 ) ( ON ?auto_805554 ?auto_805553 ) ( ON ?auto_805555 ?auto_805554 ) ( ON ?auto_805556 ?auto_805555 ) ( ON ?auto_805557 ?auto_805556 ) ( not ( = ?auto_805544 ?auto_805545 ) ) ( not ( = ?auto_805544 ?auto_805546 ) ) ( not ( = ?auto_805544 ?auto_805547 ) ) ( not ( = ?auto_805544 ?auto_805548 ) ) ( not ( = ?auto_805544 ?auto_805549 ) ) ( not ( = ?auto_805544 ?auto_805550 ) ) ( not ( = ?auto_805544 ?auto_805551 ) ) ( not ( = ?auto_805544 ?auto_805552 ) ) ( not ( = ?auto_805544 ?auto_805553 ) ) ( not ( = ?auto_805544 ?auto_805554 ) ) ( not ( = ?auto_805544 ?auto_805555 ) ) ( not ( = ?auto_805544 ?auto_805556 ) ) ( not ( = ?auto_805544 ?auto_805557 ) ) ( not ( = ?auto_805544 ?auto_805558 ) ) ( not ( = ?auto_805544 ?auto_805559 ) ) ( not ( = ?auto_805545 ?auto_805546 ) ) ( not ( = ?auto_805545 ?auto_805547 ) ) ( not ( = ?auto_805545 ?auto_805548 ) ) ( not ( = ?auto_805545 ?auto_805549 ) ) ( not ( = ?auto_805545 ?auto_805550 ) ) ( not ( = ?auto_805545 ?auto_805551 ) ) ( not ( = ?auto_805545 ?auto_805552 ) ) ( not ( = ?auto_805545 ?auto_805553 ) ) ( not ( = ?auto_805545 ?auto_805554 ) ) ( not ( = ?auto_805545 ?auto_805555 ) ) ( not ( = ?auto_805545 ?auto_805556 ) ) ( not ( = ?auto_805545 ?auto_805557 ) ) ( not ( = ?auto_805545 ?auto_805558 ) ) ( not ( = ?auto_805545 ?auto_805559 ) ) ( not ( = ?auto_805546 ?auto_805547 ) ) ( not ( = ?auto_805546 ?auto_805548 ) ) ( not ( = ?auto_805546 ?auto_805549 ) ) ( not ( = ?auto_805546 ?auto_805550 ) ) ( not ( = ?auto_805546 ?auto_805551 ) ) ( not ( = ?auto_805546 ?auto_805552 ) ) ( not ( = ?auto_805546 ?auto_805553 ) ) ( not ( = ?auto_805546 ?auto_805554 ) ) ( not ( = ?auto_805546 ?auto_805555 ) ) ( not ( = ?auto_805546 ?auto_805556 ) ) ( not ( = ?auto_805546 ?auto_805557 ) ) ( not ( = ?auto_805546 ?auto_805558 ) ) ( not ( = ?auto_805546 ?auto_805559 ) ) ( not ( = ?auto_805547 ?auto_805548 ) ) ( not ( = ?auto_805547 ?auto_805549 ) ) ( not ( = ?auto_805547 ?auto_805550 ) ) ( not ( = ?auto_805547 ?auto_805551 ) ) ( not ( = ?auto_805547 ?auto_805552 ) ) ( not ( = ?auto_805547 ?auto_805553 ) ) ( not ( = ?auto_805547 ?auto_805554 ) ) ( not ( = ?auto_805547 ?auto_805555 ) ) ( not ( = ?auto_805547 ?auto_805556 ) ) ( not ( = ?auto_805547 ?auto_805557 ) ) ( not ( = ?auto_805547 ?auto_805558 ) ) ( not ( = ?auto_805547 ?auto_805559 ) ) ( not ( = ?auto_805548 ?auto_805549 ) ) ( not ( = ?auto_805548 ?auto_805550 ) ) ( not ( = ?auto_805548 ?auto_805551 ) ) ( not ( = ?auto_805548 ?auto_805552 ) ) ( not ( = ?auto_805548 ?auto_805553 ) ) ( not ( = ?auto_805548 ?auto_805554 ) ) ( not ( = ?auto_805548 ?auto_805555 ) ) ( not ( = ?auto_805548 ?auto_805556 ) ) ( not ( = ?auto_805548 ?auto_805557 ) ) ( not ( = ?auto_805548 ?auto_805558 ) ) ( not ( = ?auto_805548 ?auto_805559 ) ) ( not ( = ?auto_805549 ?auto_805550 ) ) ( not ( = ?auto_805549 ?auto_805551 ) ) ( not ( = ?auto_805549 ?auto_805552 ) ) ( not ( = ?auto_805549 ?auto_805553 ) ) ( not ( = ?auto_805549 ?auto_805554 ) ) ( not ( = ?auto_805549 ?auto_805555 ) ) ( not ( = ?auto_805549 ?auto_805556 ) ) ( not ( = ?auto_805549 ?auto_805557 ) ) ( not ( = ?auto_805549 ?auto_805558 ) ) ( not ( = ?auto_805549 ?auto_805559 ) ) ( not ( = ?auto_805550 ?auto_805551 ) ) ( not ( = ?auto_805550 ?auto_805552 ) ) ( not ( = ?auto_805550 ?auto_805553 ) ) ( not ( = ?auto_805550 ?auto_805554 ) ) ( not ( = ?auto_805550 ?auto_805555 ) ) ( not ( = ?auto_805550 ?auto_805556 ) ) ( not ( = ?auto_805550 ?auto_805557 ) ) ( not ( = ?auto_805550 ?auto_805558 ) ) ( not ( = ?auto_805550 ?auto_805559 ) ) ( not ( = ?auto_805551 ?auto_805552 ) ) ( not ( = ?auto_805551 ?auto_805553 ) ) ( not ( = ?auto_805551 ?auto_805554 ) ) ( not ( = ?auto_805551 ?auto_805555 ) ) ( not ( = ?auto_805551 ?auto_805556 ) ) ( not ( = ?auto_805551 ?auto_805557 ) ) ( not ( = ?auto_805551 ?auto_805558 ) ) ( not ( = ?auto_805551 ?auto_805559 ) ) ( not ( = ?auto_805552 ?auto_805553 ) ) ( not ( = ?auto_805552 ?auto_805554 ) ) ( not ( = ?auto_805552 ?auto_805555 ) ) ( not ( = ?auto_805552 ?auto_805556 ) ) ( not ( = ?auto_805552 ?auto_805557 ) ) ( not ( = ?auto_805552 ?auto_805558 ) ) ( not ( = ?auto_805552 ?auto_805559 ) ) ( not ( = ?auto_805553 ?auto_805554 ) ) ( not ( = ?auto_805553 ?auto_805555 ) ) ( not ( = ?auto_805553 ?auto_805556 ) ) ( not ( = ?auto_805553 ?auto_805557 ) ) ( not ( = ?auto_805553 ?auto_805558 ) ) ( not ( = ?auto_805553 ?auto_805559 ) ) ( not ( = ?auto_805554 ?auto_805555 ) ) ( not ( = ?auto_805554 ?auto_805556 ) ) ( not ( = ?auto_805554 ?auto_805557 ) ) ( not ( = ?auto_805554 ?auto_805558 ) ) ( not ( = ?auto_805554 ?auto_805559 ) ) ( not ( = ?auto_805555 ?auto_805556 ) ) ( not ( = ?auto_805555 ?auto_805557 ) ) ( not ( = ?auto_805555 ?auto_805558 ) ) ( not ( = ?auto_805555 ?auto_805559 ) ) ( not ( = ?auto_805556 ?auto_805557 ) ) ( not ( = ?auto_805556 ?auto_805558 ) ) ( not ( = ?auto_805556 ?auto_805559 ) ) ( not ( = ?auto_805557 ?auto_805558 ) ) ( not ( = ?auto_805557 ?auto_805559 ) ) ( not ( = ?auto_805558 ?auto_805559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_805558 ?auto_805559 )
      ( !STACK ?auto_805558 ?auto_805557 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805606 - BLOCK
      ?auto_805607 - BLOCK
      ?auto_805608 - BLOCK
      ?auto_805609 - BLOCK
      ?auto_805610 - BLOCK
      ?auto_805611 - BLOCK
      ?auto_805612 - BLOCK
      ?auto_805613 - BLOCK
      ?auto_805614 - BLOCK
      ?auto_805615 - BLOCK
      ?auto_805616 - BLOCK
      ?auto_805617 - BLOCK
      ?auto_805618 - BLOCK
      ?auto_805619 - BLOCK
      ?auto_805620 - BLOCK
    )
    :vars
    (
      ?auto_805621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805620 ?auto_805621 ) ( ON-TABLE ?auto_805606 ) ( ON ?auto_805607 ?auto_805606 ) ( ON ?auto_805608 ?auto_805607 ) ( ON ?auto_805609 ?auto_805608 ) ( ON ?auto_805610 ?auto_805609 ) ( ON ?auto_805611 ?auto_805610 ) ( ON ?auto_805612 ?auto_805611 ) ( ON ?auto_805613 ?auto_805612 ) ( ON ?auto_805614 ?auto_805613 ) ( ON ?auto_805615 ?auto_805614 ) ( ON ?auto_805616 ?auto_805615 ) ( ON ?auto_805617 ?auto_805616 ) ( ON ?auto_805618 ?auto_805617 ) ( not ( = ?auto_805606 ?auto_805607 ) ) ( not ( = ?auto_805606 ?auto_805608 ) ) ( not ( = ?auto_805606 ?auto_805609 ) ) ( not ( = ?auto_805606 ?auto_805610 ) ) ( not ( = ?auto_805606 ?auto_805611 ) ) ( not ( = ?auto_805606 ?auto_805612 ) ) ( not ( = ?auto_805606 ?auto_805613 ) ) ( not ( = ?auto_805606 ?auto_805614 ) ) ( not ( = ?auto_805606 ?auto_805615 ) ) ( not ( = ?auto_805606 ?auto_805616 ) ) ( not ( = ?auto_805606 ?auto_805617 ) ) ( not ( = ?auto_805606 ?auto_805618 ) ) ( not ( = ?auto_805606 ?auto_805619 ) ) ( not ( = ?auto_805606 ?auto_805620 ) ) ( not ( = ?auto_805606 ?auto_805621 ) ) ( not ( = ?auto_805607 ?auto_805608 ) ) ( not ( = ?auto_805607 ?auto_805609 ) ) ( not ( = ?auto_805607 ?auto_805610 ) ) ( not ( = ?auto_805607 ?auto_805611 ) ) ( not ( = ?auto_805607 ?auto_805612 ) ) ( not ( = ?auto_805607 ?auto_805613 ) ) ( not ( = ?auto_805607 ?auto_805614 ) ) ( not ( = ?auto_805607 ?auto_805615 ) ) ( not ( = ?auto_805607 ?auto_805616 ) ) ( not ( = ?auto_805607 ?auto_805617 ) ) ( not ( = ?auto_805607 ?auto_805618 ) ) ( not ( = ?auto_805607 ?auto_805619 ) ) ( not ( = ?auto_805607 ?auto_805620 ) ) ( not ( = ?auto_805607 ?auto_805621 ) ) ( not ( = ?auto_805608 ?auto_805609 ) ) ( not ( = ?auto_805608 ?auto_805610 ) ) ( not ( = ?auto_805608 ?auto_805611 ) ) ( not ( = ?auto_805608 ?auto_805612 ) ) ( not ( = ?auto_805608 ?auto_805613 ) ) ( not ( = ?auto_805608 ?auto_805614 ) ) ( not ( = ?auto_805608 ?auto_805615 ) ) ( not ( = ?auto_805608 ?auto_805616 ) ) ( not ( = ?auto_805608 ?auto_805617 ) ) ( not ( = ?auto_805608 ?auto_805618 ) ) ( not ( = ?auto_805608 ?auto_805619 ) ) ( not ( = ?auto_805608 ?auto_805620 ) ) ( not ( = ?auto_805608 ?auto_805621 ) ) ( not ( = ?auto_805609 ?auto_805610 ) ) ( not ( = ?auto_805609 ?auto_805611 ) ) ( not ( = ?auto_805609 ?auto_805612 ) ) ( not ( = ?auto_805609 ?auto_805613 ) ) ( not ( = ?auto_805609 ?auto_805614 ) ) ( not ( = ?auto_805609 ?auto_805615 ) ) ( not ( = ?auto_805609 ?auto_805616 ) ) ( not ( = ?auto_805609 ?auto_805617 ) ) ( not ( = ?auto_805609 ?auto_805618 ) ) ( not ( = ?auto_805609 ?auto_805619 ) ) ( not ( = ?auto_805609 ?auto_805620 ) ) ( not ( = ?auto_805609 ?auto_805621 ) ) ( not ( = ?auto_805610 ?auto_805611 ) ) ( not ( = ?auto_805610 ?auto_805612 ) ) ( not ( = ?auto_805610 ?auto_805613 ) ) ( not ( = ?auto_805610 ?auto_805614 ) ) ( not ( = ?auto_805610 ?auto_805615 ) ) ( not ( = ?auto_805610 ?auto_805616 ) ) ( not ( = ?auto_805610 ?auto_805617 ) ) ( not ( = ?auto_805610 ?auto_805618 ) ) ( not ( = ?auto_805610 ?auto_805619 ) ) ( not ( = ?auto_805610 ?auto_805620 ) ) ( not ( = ?auto_805610 ?auto_805621 ) ) ( not ( = ?auto_805611 ?auto_805612 ) ) ( not ( = ?auto_805611 ?auto_805613 ) ) ( not ( = ?auto_805611 ?auto_805614 ) ) ( not ( = ?auto_805611 ?auto_805615 ) ) ( not ( = ?auto_805611 ?auto_805616 ) ) ( not ( = ?auto_805611 ?auto_805617 ) ) ( not ( = ?auto_805611 ?auto_805618 ) ) ( not ( = ?auto_805611 ?auto_805619 ) ) ( not ( = ?auto_805611 ?auto_805620 ) ) ( not ( = ?auto_805611 ?auto_805621 ) ) ( not ( = ?auto_805612 ?auto_805613 ) ) ( not ( = ?auto_805612 ?auto_805614 ) ) ( not ( = ?auto_805612 ?auto_805615 ) ) ( not ( = ?auto_805612 ?auto_805616 ) ) ( not ( = ?auto_805612 ?auto_805617 ) ) ( not ( = ?auto_805612 ?auto_805618 ) ) ( not ( = ?auto_805612 ?auto_805619 ) ) ( not ( = ?auto_805612 ?auto_805620 ) ) ( not ( = ?auto_805612 ?auto_805621 ) ) ( not ( = ?auto_805613 ?auto_805614 ) ) ( not ( = ?auto_805613 ?auto_805615 ) ) ( not ( = ?auto_805613 ?auto_805616 ) ) ( not ( = ?auto_805613 ?auto_805617 ) ) ( not ( = ?auto_805613 ?auto_805618 ) ) ( not ( = ?auto_805613 ?auto_805619 ) ) ( not ( = ?auto_805613 ?auto_805620 ) ) ( not ( = ?auto_805613 ?auto_805621 ) ) ( not ( = ?auto_805614 ?auto_805615 ) ) ( not ( = ?auto_805614 ?auto_805616 ) ) ( not ( = ?auto_805614 ?auto_805617 ) ) ( not ( = ?auto_805614 ?auto_805618 ) ) ( not ( = ?auto_805614 ?auto_805619 ) ) ( not ( = ?auto_805614 ?auto_805620 ) ) ( not ( = ?auto_805614 ?auto_805621 ) ) ( not ( = ?auto_805615 ?auto_805616 ) ) ( not ( = ?auto_805615 ?auto_805617 ) ) ( not ( = ?auto_805615 ?auto_805618 ) ) ( not ( = ?auto_805615 ?auto_805619 ) ) ( not ( = ?auto_805615 ?auto_805620 ) ) ( not ( = ?auto_805615 ?auto_805621 ) ) ( not ( = ?auto_805616 ?auto_805617 ) ) ( not ( = ?auto_805616 ?auto_805618 ) ) ( not ( = ?auto_805616 ?auto_805619 ) ) ( not ( = ?auto_805616 ?auto_805620 ) ) ( not ( = ?auto_805616 ?auto_805621 ) ) ( not ( = ?auto_805617 ?auto_805618 ) ) ( not ( = ?auto_805617 ?auto_805619 ) ) ( not ( = ?auto_805617 ?auto_805620 ) ) ( not ( = ?auto_805617 ?auto_805621 ) ) ( not ( = ?auto_805618 ?auto_805619 ) ) ( not ( = ?auto_805618 ?auto_805620 ) ) ( not ( = ?auto_805618 ?auto_805621 ) ) ( not ( = ?auto_805619 ?auto_805620 ) ) ( not ( = ?auto_805619 ?auto_805621 ) ) ( not ( = ?auto_805620 ?auto_805621 ) ) ( CLEAR ?auto_805618 ) ( ON ?auto_805619 ?auto_805620 ) ( CLEAR ?auto_805619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_805606 ?auto_805607 ?auto_805608 ?auto_805609 ?auto_805610 ?auto_805611 ?auto_805612 ?auto_805613 ?auto_805614 ?auto_805615 ?auto_805616 ?auto_805617 ?auto_805618 ?auto_805619 )
      ( MAKE-15PILE ?auto_805606 ?auto_805607 ?auto_805608 ?auto_805609 ?auto_805610 ?auto_805611 ?auto_805612 ?auto_805613 ?auto_805614 ?auto_805615 ?auto_805616 ?auto_805617 ?auto_805618 ?auto_805619 ?auto_805620 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805668 - BLOCK
      ?auto_805669 - BLOCK
      ?auto_805670 - BLOCK
      ?auto_805671 - BLOCK
      ?auto_805672 - BLOCK
      ?auto_805673 - BLOCK
      ?auto_805674 - BLOCK
      ?auto_805675 - BLOCK
      ?auto_805676 - BLOCK
      ?auto_805677 - BLOCK
      ?auto_805678 - BLOCK
      ?auto_805679 - BLOCK
      ?auto_805680 - BLOCK
      ?auto_805681 - BLOCK
      ?auto_805682 - BLOCK
    )
    :vars
    (
      ?auto_805683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805682 ?auto_805683 ) ( ON-TABLE ?auto_805668 ) ( ON ?auto_805669 ?auto_805668 ) ( ON ?auto_805670 ?auto_805669 ) ( ON ?auto_805671 ?auto_805670 ) ( ON ?auto_805672 ?auto_805671 ) ( ON ?auto_805673 ?auto_805672 ) ( ON ?auto_805674 ?auto_805673 ) ( ON ?auto_805675 ?auto_805674 ) ( ON ?auto_805676 ?auto_805675 ) ( ON ?auto_805677 ?auto_805676 ) ( ON ?auto_805678 ?auto_805677 ) ( ON ?auto_805679 ?auto_805678 ) ( not ( = ?auto_805668 ?auto_805669 ) ) ( not ( = ?auto_805668 ?auto_805670 ) ) ( not ( = ?auto_805668 ?auto_805671 ) ) ( not ( = ?auto_805668 ?auto_805672 ) ) ( not ( = ?auto_805668 ?auto_805673 ) ) ( not ( = ?auto_805668 ?auto_805674 ) ) ( not ( = ?auto_805668 ?auto_805675 ) ) ( not ( = ?auto_805668 ?auto_805676 ) ) ( not ( = ?auto_805668 ?auto_805677 ) ) ( not ( = ?auto_805668 ?auto_805678 ) ) ( not ( = ?auto_805668 ?auto_805679 ) ) ( not ( = ?auto_805668 ?auto_805680 ) ) ( not ( = ?auto_805668 ?auto_805681 ) ) ( not ( = ?auto_805668 ?auto_805682 ) ) ( not ( = ?auto_805668 ?auto_805683 ) ) ( not ( = ?auto_805669 ?auto_805670 ) ) ( not ( = ?auto_805669 ?auto_805671 ) ) ( not ( = ?auto_805669 ?auto_805672 ) ) ( not ( = ?auto_805669 ?auto_805673 ) ) ( not ( = ?auto_805669 ?auto_805674 ) ) ( not ( = ?auto_805669 ?auto_805675 ) ) ( not ( = ?auto_805669 ?auto_805676 ) ) ( not ( = ?auto_805669 ?auto_805677 ) ) ( not ( = ?auto_805669 ?auto_805678 ) ) ( not ( = ?auto_805669 ?auto_805679 ) ) ( not ( = ?auto_805669 ?auto_805680 ) ) ( not ( = ?auto_805669 ?auto_805681 ) ) ( not ( = ?auto_805669 ?auto_805682 ) ) ( not ( = ?auto_805669 ?auto_805683 ) ) ( not ( = ?auto_805670 ?auto_805671 ) ) ( not ( = ?auto_805670 ?auto_805672 ) ) ( not ( = ?auto_805670 ?auto_805673 ) ) ( not ( = ?auto_805670 ?auto_805674 ) ) ( not ( = ?auto_805670 ?auto_805675 ) ) ( not ( = ?auto_805670 ?auto_805676 ) ) ( not ( = ?auto_805670 ?auto_805677 ) ) ( not ( = ?auto_805670 ?auto_805678 ) ) ( not ( = ?auto_805670 ?auto_805679 ) ) ( not ( = ?auto_805670 ?auto_805680 ) ) ( not ( = ?auto_805670 ?auto_805681 ) ) ( not ( = ?auto_805670 ?auto_805682 ) ) ( not ( = ?auto_805670 ?auto_805683 ) ) ( not ( = ?auto_805671 ?auto_805672 ) ) ( not ( = ?auto_805671 ?auto_805673 ) ) ( not ( = ?auto_805671 ?auto_805674 ) ) ( not ( = ?auto_805671 ?auto_805675 ) ) ( not ( = ?auto_805671 ?auto_805676 ) ) ( not ( = ?auto_805671 ?auto_805677 ) ) ( not ( = ?auto_805671 ?auto_805678 ) ) ( not ( = ?auto_805671 ?auto_805679 ) ) ( not ( = ?auto_805671 ?auto_805680 ) ) ( not ( = ?auto_805671 ?auto_805681 ) ) ( not ( = ?auto_805671 ?auto_805682 ) ) ( not ( = ?auto_805671 ?auto_805683 ) ) ( not ( = ?auto_805672 ?auto_805673 ) ) ( not ( = ?auto_805672 ?auto_805674 ) ) ( not ( = ?auto_805672 ?auto_805675 ) ) ( not ( = ?auto_805672 ?auto_805676 ) ) ( not ( = ?auto_805672 ?auto_805677 ) ) ( not ( = ?auto_805672 ?auto_805678 ) ) ( not ( = ?auto_805672 ?auto_805679 ) ) ( not ( = ?auto_805672 ?auto_805680 ) ) ( not ( = ?auto_805672 ?auto_805681 ) ) ( not ( = ?auto_805672 ?auto_805682 ) ) ( not ( = ?auto_805672 ?auto_805683 ) ) ( not ( = ?auto_805673 ?auto_805674 ) ) ( not ( = ?auto_805673 ?auto_805675 ) ) ( not ( = ?auto_805673 ?auto_805676 ) ) ( not ( = ?auto_805673 ?auto_805677 ) ) ( not ( = ?auto_805673 ?auto_805678 ) ) ( not ( = ?auto_805673 ?auto_805679 ) ) ( not ( = ?auto_805673 ?auto_805680 ) ) ( not ( = ?auto_805673 ?auto_805681 ) ) ( not ( = ?auto_805673 ?auto_805682 ) ) ( not ( = ?auto_805673 ?auto_805683 ) ) ( not ( = ?auto_805674 ?auto_805675 ) ) ( not ( = ?auto_805674 ?auto_805676 ) ) ( not ( = ?auto_805674 ?auto_805677 ) ) ( not ( = ?auto_805674 ?auto_805678 ) ) ( not ( = ?auto_805674 ?auto_805679 ) ) ( not ( = ?auto_805674 ?auto_805680 ) ) ( not ( = ?auto_805674 ?auto_805681 ) ) ( not ( = ?auto_805674 ?auto_805682 ) ) ( not ( = ?auto_805674 ?auto_805683 ) ) ( not ( = ?auto_805675 ?auto_805676 ) ) ( not ( = ?auto_805675 ?auto_805677 ) ) ( not ( = ?auto_805675 ?auto_805678 ) ) ( not ( = ?auto_805675 ?auto_805679 ) ) ( not ( = ?auto_805675 ?auto_805680 ) ) ( not ( = ?auto_805675 ?auto_805681 ) ) ( not ( = ?auto_805675 ?auto_805682 ) ) ( not ( = ?auto_805675 ?auto_805683 ) ) ( not ( = ?auto_805676 ?auto_805677 ) ) ( not ( = ?auto_805676 ?auto_805678 ) ) ( not ( = ?auto_805676 ?auto_805679 ) ) ( not ( = ?auto_805676 ?auto_805680 ) ) ( not ( = ?auto_805676 ?auto_805681 ) ) ( not ( = ?auto_805676 ?auto_805682 ) ) ( not ( = ?auto_805676 ?auto_805683 ) ) ( not ( = ?auto_805677 ?auto_805678 ) ) ( not ( = ?auto_805677 ?auto_805679 ) ) ( not ( = ?auto_805677 ?auto_805680 ) ) ( not ( = ?auto_805677 ?auto_805681 ) ) ( not ( = ?auto_805677 ?auto_805682 ) ) ( not ( = ?auto_805677 ?auto_805683 ) ) ( not ( = ?auto_805678 ?auto_805679 ) ) ( not ( = ?auto_805678 ?auto_805680 ) ) ( not ( = ?auto_805678 ?auto_805681 ) ) ( not ( = ?auto_805678 ?auto_805682 ) ) ( not ( = ?auto_805678 ?auto_805683 ) ) ( not ( = ?auto_805679 ?auto_805680 ) ) ( not ( = ?auto_805679 ?auto_805681 ) ) ( not ( = ?auto_805679 ?auto_805682 ) ) ( not ( = ?auto_805679 ?auto_805683 ) ) ( not ( = ?auto_805680 ?auto_805681 ) ) ( not ( = ?auto_805680 ?auto_805682 ) ) ( not ( = ?auto_805680 ?auto_805683 ) ) ( not ( = ?auto_805681 ?auto_805682 ) ) ( not ( = ?auto_805681 ?auto_805683 ) ) ( not ( = ?auto_805682 ?auto_805683 ) ) ( ON ?auto_805681 ?auto_805682 ) ( CLEAR ?auto_805679 ) ( ON ?auto_805680 ?auto_805681 ) ( CLEAR ?auto_805680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_805668 ?auto_805669 ?auto_805670 ?auto_805671 ?auto_805672 ?auto_805673 ?auto_805674 ?auto_805675 ?auto_805676 ?auto_805677 ?auto_805678 ?auto_805679 ?auto_805680 )
      ( MAKE-15PILE ?auto_805668 ?auto_805669 ?auto_805670 ?auto_805671 ?auto_805672 ?auto_805673 ?auto_805674 ?auto_805675 ?auto_805676 ?auto_805677 ?auto_805678 ?auto_805679 ?auto_805680 ?auto_805681 ?auto_805682 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805730 - BLOCK
      ?auto_805731 - BLOCK
      ?auto_805732 - BLOCK
      ?auto_805733 - BLOCK
      ?auto_805734 - BLOCK
      ?auto_805735 - BLOCK
      ?auto_805736 - BLOCK
      ?auto_805737 - BLOCK
      ?auto_805738 - BLOCK
      ?auto_805739 - BLOCK
      ?auto_805740 - BLOCK
      ?auto_805741 - BLOCK
      ?auto_805742 - BLOCK
      ?auto_805743 - BLOCK
      ?auto_805744 - BLOCK
    )
    :vars
    (
      ?auto_805745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805744 ?auto_805745 ) ( ON-TABLE ?auto_805730 ) ( ON ?auto_805731 ?auto_805730 ) ( ON ?auto_805732 ?auto_805731 ) ( ON ?auto_805733 ?auto_805732 ) ( ON ?auto_805734 ?auto_805733 ) ( ON ?auto_805735 ?auto_805734 ) ( ON ?auto_805736 ?auto_805735 ) ( ON ?auto_805737 ?auto_805736 ) ( ON ?auto_805738 ?auto_805737 ) ( ON ?auto_805739 ?auto_805738 ) ( ON ?auto_805740 ?auto_805739 ) ( not ( = ?auto_805730 ?auto_805731 ) ) ( not ( = ?auto_805730 ?auto_805732 ) ) ( not ( = ?auto_805730 ?auto_805733 ) ) ( not ( = ?auto_805730 ?auto_805734 ) ) ( not ( = ?auto_805730 ?auto_805735 ) ) ( not ( = ?auto_805730 ?auto_805736 ) ) ( not ( = ?auto_805730 ?auto_805737 ) ) ( not ( = ?auto_805730 ?auto_805738 ) ) ( not ( = ?auto_805730 ?auto_805739 ) ) ( not ( = ?auto_805730 ?auto_805740 ) ) ( not ( = ?auto_805730 ?auto_805741 ) ) ( not ( = ?auto_805730 ?auto_805742 ) ) ( not ( = ?auto_805730 ?auto_805743 ) ) ( not ( = ?auto_805730 ?auto_805744 ) ) ( not ( = ?auto_805730 ?auto_805745 ) ) ( not ( = ?auto_805731 ?auto_805732 ) ) ( not ( = ?auto_805731 ?auto_805733 ) ) ( not ( = ?auto_805731 ?auto_805734 ) ) ( not ( = ?auto_805731 ?auto_805735 ) ) ( not ( = ?auto_805731 ?auto_805736 ) ) ( not ( = ?auto_805731 ?auto_805737 ) ) ( not ( = ?auto_805731 ?auto_805738 ) ) ( not ( = ?auto_805731 ?auto_805739 ) ) ( not ( = ?auto_805731 ?auto_805740 ) ) ( not ( = ?auto_805731 ?auto_805741 ) ) ( not ( = ?auto_805731 ?auto_805742 ) ) ( not ( = ?auto_805731 ?auto_805743 ) ) ( not ( = ?auto_805731 ?auto_805744 ) ) ( not ( = ?auto_805731 ?auto_805745 ) ) ( not ( = ?auto_805732 ?auto_805733 ) ) ( not ( = ?auto_805732 ?auto_805734 ) ) ( not ( = ?auto_805732 ?auto_805735 ) ) ( not ( = ?auto_805732 ?auto_805736 ) ) ( not ( = ?auto_805732 ?auto_805737 ) ) ( not ( = ?auto_805732 ?auto_805738 ) ) ( not ( = ?auto_805732 ?auto_805739 ) ) ( not ( = ?auto_805732 ?auto_805740 ) ) ( not ( = ?auto_805732 ?auto_805741 ) ) ( not ( = ?auto_805732 ?auto_805742 ) ) ( not ( = ?auto_805732 ?auto_805743 ) ) ( not ( = ?auto_805732 ?auto_805744 ) ) ( not ( = ?auto_805732 ?auto_805745 ) ) ( not ( = ?auto_805733 ?auto_805734 ) ) ( not ( = ?auto_805733 ?auto_805735 ) ) ( not ( = ?auto_805733 ?auto_805736 ) ) ( not ( = ?auto_805733 ?auto_805737 ) ) ( not ( = ?auto_805733 ?auto_805738 ) ) ( not ( = ?auto_805733 ?auto_805739 ) ) ( not ( = ?auto_805733 ?auto_805740 ) ) ( not ( = ?auto_805733 ?auto_805741 ) ) ( not ( = ?auto_805733 ?auto_805742 ) ) ( not ( = ?auto_805733 ?auto_805743 ) ) ( not ( = ?auto_805733 ?auto_805744 ) ) ( not ( = ?auto_805733 ?auto_805745 ) ) ( not ( = ?auto_805734 ?auto_805735 ) ) ( not ( = ?auto_805734 ?auto_805736 ) ) ( not ( = ?auto_805734 ?auto_805737 ) ) ( not ( = ?auto_805734 ?auto_805738 ) ) ( not ( = ?auto_805734 ?auto_805739 ) ) ( not ( = ?auto_805734 ?auto_805740 ) ) ( not ( = ?auto_805734 ?auto_805741 ) ) ( not ( = ?auto_805734 ?auto_805742 ) ) ( not ( = ?auto_805734 ?auto_805743 ) ) ( not ( = ?auto_805734 ?auto_805744 ) ) ( not ( = ?auto_805734 ?auto_805745 ) ) ( not ( = ?auto_805735 ?auto_805736 ) ) ( not ( = ?auto_805735 ?auto_805737 ) ) ( not ( = ?auto_805735 ?auto_805738 ) ) ( not ( = ?auto_805735 ?auto_805739 ) ) ( not ( = ?auto_805735 ?auto_805740 ) ) ( not ( = ?auto_805735 ?auto_805741 ) ) ( not ( = ?auto_805735 ?auto_805742 ) ) ( not ( = ?auto_805735 ?auto_805743 ) ) ( not ( = ?auto_805735 ?auto_805744 ) ) ( not ( = ?auto_805735 ?auto_805745 ) ) ( not ( = ?auto_805736 ?auto_805737 ) ) ( not ( = ?auto_805736 ?auto_805738 ) ) ( not ( = ?auto_805736 ?auto_805739 ) ) ( not ( = ?auto_805736 ?auto_805740 ) ) ( not ( = ?auto_805736 ?auto_805741 ) ) ( not ( = ?auto_805736 ?auto_805742 ) ) ( not ( = ?auto_805736 ?auto_805743 ) ) ( not ( = ?auto_805736 ?auto_805744 ) ) ( not ( = ?auto_805736 ?auto_805745 ) ) ( not ( = ?auto_805737 ?auto_805738 ) ) ( not ( = ?auto_805737 ?auto_805739 ) ) ( not ( = ?auto_805737 ?auto_805740 ) ) ( not ( = ?auto_805737 ?auto_805741 ) ) ( not ( = ?auto_805737 ?auto_805742 ) ) ( not ( = ?auto_805737 ?auto_805743 ) ) ( not ( = ?auto_805737 ?auto_805744 ) ) ( not ( = ?auto_805737 ?auto_805745 ) ) ( not ( = ?auto_805738 ?auto_805739 ) ) ( not ( = ?auto_805738 ?auto_805740 ) ) ( not ( = ?auto_805738 ?auto_805741 ) ) ( not ( = ?auto_805738 ?auto_805742 ) ) ( not ( = ?auto_805738 ?auto_805743 ) ) ( not ( = ?auto_805738 ?auto_805744 ) ) ( not ( = ?auto_805738 ?auto_805745 ) ) ( not ( = ?auto_805739 ?auto_805740 ) ) ( not ( = ?auto_805739 ?auto_805741 ) ) ( not ( = ?auto_805739 ?auto_805742 ) ) ( not ( = ?auto_805739 ?auto_805743 ) ) ( not ( = ?auto_805739 ?auto_805744 ) ) ( not ( = ?auto_805739 ?auto_805745 ) ) ( not ( = ?auto_805740 ?auto_805741 ) ) ( not ( = ?auto_805740 ?auto_805742 ) ) ( not ( = ?auto_805740 ?auto_805743 ) ) ( not ( = ?auto_805740 ?auto_805744 ) ) ( not ( = ?auto_805740 ?auto_805745 ) ) ( not ( = ?auto_805741 ?auto_805742 ) ) ( not ( = ?auto_805741 ?auto_805743 ) ) ( not ( = ?auto_805741 ?auto_805744 ) ) ( not ( = ?auto_805741 ?auto_805745 ) ) ( not ( = ?auto_805742 ?auto_805743 ) ) ( not ( = ?auto_805742 ?auto_805744 ) ) ( not ( = ?auto_805742 ?auto_805745 ) ) ( not ( = ?auto_805743 ?auto_805744 ) ) ( not ( = ?auto_805743 ?auto_805745 ) ) ( not ( = ?auto_805744 ?auto_805745 ) ) ( ON ?auto_805743 ?auto_805744 ) ( ON ?auto_805742 ?auto_805743 ) ( CLEAR ?auto_805740 ) ( ON ?auto_805741 ?auto_805742 ) ( CLEAR ?auto_805741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_805730 ?auto_805731 ?auto_805732 ?auto_805733 ?auto_805734 ?auto_805735 ?auto_805736 ?auto_805737 ?auto_805738 ?auto_805739 ?auto_805740 ?auto_805741 )
      ( MAKE-15PILE ?auto_805730 ?auto_805731 ?auto_805732 ?auto_805733 ?auto_805734 ?auto_805735 ?auto_805736 ?auto_805737 ?auto_805738 ?auto_805739 ?auto_805740 ?auto_805741 ?auto_805742 ?auto_805743 ?auto_805744 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805792 - BLOCK
      ?auto_805793 - BLOCK
      ?auto_805794 - BLOCK
      ?auto_805795 - BLOCK
      ?auto_805796 - BLOCK
      ?auto_805797 - BLOCK
      ?auto_805798 - BLOCK
      ?auto_805799 - BLOCK
      ?auto_805800 - BLOCK
      ?auto_805801 - BLOCK
      ?auto_805802 - BLOCK
      ?auto_805803 - BLOCK
      ?auto_805804 - BLOCK
      ?auto_805805 - BLOCK
      ?auto_805806 - BLOCK
    )
    :vars
    (
      ?auto_805807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805806 ?auto_805807 ) ( ON-TABLE ?auto_805792 ) ( ON ?auto_805793 ?auto_805792 ) ( ON ?auto_805794 ?auto_805793 ) ( ON ?auto_805795 ?auto_805794 ) ( ON ?auto_805796 ?auto_805795 ) ( ON ?auto_805797 ?auto_805796 ) ( ON ?auto_805798 ?auto_805797 ) ( ON ?auto_805799 ?auto_805798 ) ( ON ?auto_805800 ?auto_805799 ) ( ON ?auto_805801 ?auto_805800 ) ( not ( = ?auto_805792 ?auto_805793 ) ) ( not ( = ?auto_805792 ?auto_805794 ) ) ( not ( = ?auto_805792 ?auto_805795 ) ) ( not ( = ?auto_805792 ?auto_805796 ) ) ( not ( = ?auto_805792 ?auto_805797 ) ) ( not ( = ?auto_805792 ?auto_805798 ) ) ( not ( = ?auto_805792 ?auto_805799 ) ) ( not ( = ?auto_805792 ?auto_805800 ) ) ( not ( = ?auto_805792 ?auto_805801 ) ) ( not ( = ?auto_805792 ?auto_805802 ) ) ( not ( = ?auto_805792 ?auto_805803 ) ) ( not ( = ?auto_805792 ?auto_805804 ) ) ( not ( = ?auto_805792 ?auto_805805 ) ) ( not ( = ?auto_805792 ?auto_805806 ) ) ( not ( = ?auto_805792 ?auto_805807 ) ) ( not ( = ?auto_805793 ?auto_805794 ) ) ( not ( = ?auto_805793 ?auto_805795 ) ) ( not ( = ?auto_805793 ?auto_805796 ) ) ( not ( = ?auto_805793 ?auto_805797 ) ) ( not ( = ?auto_805793 ?auto_805798 ) ) ( not ( = ?auto_805793 ?auto_805799 ) ) ( not ( = ?auto_805793 ?auto_805800 ) ) ( not ( = ?auto_805793 ?auto_805801 ) ) ( not ( = ?auto_805793 ?auto_805802 ) ) ( not ( = ?auto_805793 ?auto_805803 ) ) ( not ( = ?auto_805793 ?auto_805804 ) ) ( not ( = ?auto_805793 ?auto_805805 ) ) ( not ( = ?auto_805793 ?auto_805806 ) ) ( not ( = ?auto_805793 ?auto_805807 ) ) ( not ( = ?auto_805794 ?auto_805795 ) ) ( not ( = ?auto_805794 ?auto_805796 ) ) ( not ( = ?auto_805794 ?auto_805797 ) ) ( not ( = ?auto_805794 ?auto_805798 ) ) ( not ( = ?auto_805794 ?auto_805799 ) ) ( not ( = ?auto_805794 ?auto_805800 ) ) ( not ( = ?auto_805794 ?auto_805801 ) ) ( not ( = ?auto_805794 ?auto_805802 ) ) ( not ( = ?auto_805794 ?auto_805803 ) ) ( not ( = ?auto_805794 ?auto_805804 ) ) ( not ( = ?auto_805794 ?auto_805805 ) ) ( not ( = ?auto_805794 ?auto_805806 ) ) ( not ( = ?auto_805794 ?auto_805807 ) ) ( not ( = ?auto_805795 ?auto_805796 ) ) ( not ( = ?auto_805795 ?auto_805797 ) ) ( not ( = ?auto_805795 ?auto_805798 ) ) ( not ( = ?auto_805795 ?auto_805799 ) ) ( not ( = ?auto_805795 ?auto_805800 ) ) ( not ( = ?auto_805795 ?auto_805801 ) ) ( not ( = ?auto_805795 ?auto_805802 ) ) ( not ( = ?auto_805795 ?auto_805803 ) ) ( not ( = ?auto_805795 ?auto_805804 ) ) ( not ( = ?auto_805795 ?auto_805805 ) ) ( not ( = ?auto_805795 ?auto_805806 ) ) ( not ( = ?auto_805795 ?auto_805807 ) ) ( not ( = ?auto_805796 ?auto_805797 ) ) ( not ( = ?auto_805796 ?auto_805798 ) ) ( not ( = ?auto_805796 ?auto_805799 ) ) ( not ( = ?auto_805796 ?auto_805800 ) ) ( not ( = ?auto_805796 ?auto_805801 ) ) ( not ( = ?auto_805796 ?auto_805802 ) ) ( not ( = ?auto_805796 ?auto_805803 ) ) ( not ( = ?auto_805796 ?auto_805804 ) ) ( not ( = ?auto_805796 ?auto_805805 ) ) ( not ( = ?auto_805796 ?auto_805806 ) ) ( not ( = ?auto_805796 ?auto_805807 ) ) ( not ( = ?auto_805797 ?auto_805798 ) ) ( not ( = ?auto_805797 ?auto_805799 ) ) ( not ( = ?auto_805797 ?auto_805800 ) ) ( not ( = ?auto_805797 ?auto_805801 ) ) ( not ( = ?auto_805797 ?auto_805802 ) ) ( not ( = ?auto_805797 ?auto_805803 ) ) ( not ( = ?auto_805797 ?auto_805804 ) ) ( not ( = ?auto_805797 ?auto_805805 ) ) ( not ( = ?auto_805797 ?auto_805806 ) ) ( not ( = ?auto_805797 ?auto_805807 ) ) ( not ( = ?auto_805798 ?auto_805799 ) ) ( not ( = ?auto_805798 ?auto_805800 ) ) ( not ( = ?auto_805798 ?auto_805801 ) ) ( not ( = ?auto_805798 ?auto_805802 ) ) ( not ( = ?auto_805798 ?auto_805803 ) ) ( not ( = ?auto_805798 ?auto_805804 ) ) ( not ( = ?auto_805798 ?auto_805805 ) ) ( not ( = ?auto_805798 ?auto_805806 ) ) ( not ( = ?auto_805798 ?auto_805807 ) ) ( not ( = ?auto_805799 ?auto_805800 ) ) ( not ( = ?auto_805799 ?auto_805801 ) ) ( not ( = ?auto_805799 ?auto_805802 ) ) ( not ( = ?auto_805799 ?auto_805803 ) ) ( not ( = ?auto_805799 ?auto_805804 ) ) ( not ( = ?auto_805799 ?auto_805805 ) ) ( not ( = ?auto_805799 ?auto_805806 ) ) ( not ( = ?auto_805799 ?auto_805807 ) ) ( not ( = ?auto_805800 ?auto_805801 ) ) ( not ( = ?auto_805800 ?auto_805802 ) ) ( not ( = ?auto_805800 ?auto_805803 ) ) ( not ( = ?auto_805800 ?auto_805804 ) ) ( not ( = ?auto_805800 ?auto_805805 ) ) ( not ( = ?auto_805800 ?auto_805806 ) ) ( not ( = ?auto_805800 ?auto_805807 ) ) ( not ( = ?auto_805801 ?auto_805802 ) ) ( not ( = ?auto_805801 ?auto_805803 ) ) ( not ( = ?auto_805801 ?auto_805804 ) ) ( not ( = ?auto_805801 ?auto_805805 ) ) ( not ( = ?auto_805801 ?auto_805806 ) ) ( not ( = ?auto_805801 ?auto_805807 ) ) ( not ( = ?auto_805802 ?auto_805803 ) ) ( not ( = ?auto_805802 ?auto_805804 ) ) ( not ( = ?auto_805802 ?auto_805805 ) ) ( not ( = ?auto_805802 ?auto_805806 ) ) ( not ( = ?auto_805802 ?auto_805807 ) ) ( not ( = ?auto_805803 ?auto_805804 ) ) ( not ( = ?auto_805803 ?auto_805805 ) ) ( not ( = ?auto_805803 ?auto_805806 ) ) ( not ( = ?auto_805803 ?auto_805807 ) ) ( not ( = ?auto_805804 ?auto_805805 ) ) ( not ( = ?auto_805804 ?auto_805806 ) ) ( not ( = ?auto_805804 ?auto_805807 ) ) ( not ( = ?auto_805805 ?auto_805806 ) ) ( not ( = ?auto_805805 ?auto_805807 ) ) ( not ( = ?auto_805806 ?auto_805807 ) ) ( ON ?auto_805805 ?auto_805806 ) ( ON ?auto_805804 ?auto_805805 ) ( ON ?auto_805803 ?auto_805804 ) ( CLEAR ?auto_805801 ) ( ON ?auto_805802 ?auto_805803 ) ( CLEAR ?auto_805802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_805792 ?auto_805793 ?auto_805794 ?auto_805795 ?auto_805796 ?auto_805797 ?auto_805798 ?auto_805799 ?auto_805800 ?auto_805801 ?auto_805802 )
      ( MAKE-15PILE ?auto_805792 ?auto_805793 ?auto_805794 ?auto_805795 ?auto_805796 ?auto_805797 ?auto_805798 ?auto_805799 ?auto_805800 ?auto_805801 ?auto_805802 ?auto_805803 ?auto_805804 ?auto_805805 ?auto_805806 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805854 - BLOCK
      ?auto_805855 - BLOCK
      ?auto_805856 - BLOCK
      ?auto_805857 - BLOCK
      ?auto_805858 - BLOCK
      ?auto_805859 - BLOCK
      ?auto_805860 - BLOCK
      ?auto_805861 - BLOCK
      ?auto_805862 - BLOCK
      ?auto_805863 - BLOCK
      ?auto_805864 - BLOCK
      ?auto_805865 - BLOCK
      ?auto_805866 - BLOCK
      ?auto_805867 - BLOCK
      ?auto_805868 - BLOCK
    )
    :vars
    (
      ?auto_805869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805868 ?auto_805869 ) ( ON-TABLE ?auto_805854 ) ( ON ?auto_805855 ?auto_805854 ) ( ON ?auto_805856 ?auto_805855 ) ( ON ?auto_805857 ?auto_805856 ) ( ON ?auto_805858 ?auto_805857 ) ( ON ?auto_805859 ?auto_805858 ) ( ON ?auto_805860 ?auto_805859 ) ( ON ?auto_805861 ?auto_805860 ) ( ON ?auto_805862 ?auto_805861 ) ( not ( = ?auto_805854 ?auto_805855 ) ) ( not ( = ?auto_805854 ?auto_805856 ) ) ( not ( = ?auto_805854 ?auto_805857 ) ) ( not ( = ?auto_805854 ?auto_805858 ) ) ( not ( = ?auto_805854 ?auto_805859 ) ) ( not ( = ?auto_805854 ?auto_805860 ) ) ( not ( = ?auto_805854 ?auto_805861 ) ) ( not ( = ?auto_805854 ?auto_805862 ) ) ( not ( = ?auto_805854 ?auto_805863 ) ) ( not ( = ?auto_805854 ?auto_805864 ) ) ( not ( = ?auto_805854 ?auto_805865 ) ) ( not ( = ?auto_805854 ?auto_805866 ) ) ( not ( = ?auto_805854 ?auto_805867 ) ) ( not ( = ?auto_805854 ?auto_805868 ) ) ( not ( = ?auto_805854 ?auto_805869 ) ) ( not ( = ?auto_805855 ?auto_805856 ) ) ( not ( = ?auto_805855 ?auto_805857 ) ) ( not ( = ?auto_805855 ?auto_805858 ) ) ( not ( = ?auto_805855 ?auto_805859 ) ) ( not ( = ?auto_805855 ?auto_805860 ) ) ( not ( = ?auto_805855 ?auto_805861 ) ) ( not ( = ?auto_805855 ?auto_805862 ) ) ( not ( = ?auto_805855 ?auto_805863 ) ) ( not ( = ?auto_805855 ?auto_805864 ) ) ( not ( = ?auto_805855 ?auto_805865 ) ) ( not ( = ?auto_805855 ?auto_805866 ) ) ( not ( = ?auto_805855 ?auto_805867 ) ) ( not ( = ?auto_805855 ?auto_805868 ) ) ( not ( = ?auto_805855 ?auto_805869 ) ) ( not ( = ?auto_805856 ?auto_805857 ) ) ( not ( = ?auto_805856 ?auto_805858 ) ) ( not ( = ?auto_805856 ?auto_805859 ) ) ( not ( = ?auto_805856 ?auto_805860 ) ) ( not ( = ?auto_805856 ?auto_805861 ) ) ( not ( = ?auto_805856 ?auto_805862 ) ) ( not ( = ?auto_805856 ?auto_805863 ) ) ( not ( = ?auto_805856 ?auto_805864 ) ) ( not ( = ?auto_805856 ?auto_805865 ) ) ( not ( = ?auto_805856 ?auto_805866 ) ) ( not ( = ?auto_805856 ?auto_805867 ) ) ( not ( = ?auto_805856 ?auto_805868 ) ) ( not ( = ?auto_805856 ?auto_805869 ) ) ( not ( = ?auto_805857 ?auto_805858 ) ) ( not ( = ?auto_805857 ?auto_805859 ) ) ( not ( = ?auto_805857 ?auto_805860 ) ) ( not ( = ?auto_805857 ?auto_805861 ) ) ( not ( = ?auto_805857 ?auto_805862 ) ) ( not ( = ?auto_805857 ?auto_805863 ) ) ( not ( = ?auto_805857 ?auto_805864 ) ) ( not ( = ?auto_805857 ?auto_805865 ) ) ( not ( = ?auto_805857 ?auto_805866 ) ) ( not ( = ?auto_805857 ?auto_805867 ) ) ( not ( = ?auto_805857 ?auto_805868 ) ) ( not ( = ?auto_805857 ?auto_805869 ) ) ( not ( = ?auto_805858 ?auto_805859 ) ) ( not ( = ?auto_805858 ?auto_805860 ) ) ( not ( = ?auto_805858 ?auto_805861 ) ) ( not ( = ?auto_805858 ?auto_805862 ) ) ( not ( = ?auto_805858 ?auto_805863 ) ) ( not ( = ?auto_805858 ?auto_805864 ) ) ( not ( = ?auto_805858 ?auto_805865 ) ) ( not ( = ?auto_805858 ?auto_805866 ) ) ( not ( = ?auto_805858 ?auto_805867 ) ) ( not ( = ?auto_805858 ?auto_805868 ) ) ( not ( = ?auto_805858 ?auto_805869 ) ) ( not ( = ?auto_805859 ?auto_805860 ) ) ( not ( = ?auto_805859 ?auto_805861 ) ) ( not ( = ?auto_805859 ?auto_805862 ) ) ( not ( = ?auto_805859 ?auto_805863 ) ) ( not ( = ?auto_805859 ?auto_805864 ) ) ( not ( = ?auto_805859 ?auto_805865 ) ) ( not ( = ?auto_805859 ?auto_805866 ) ) ( not ( = ?auto_805859 ?auto_805867 ) ) ( not ( = ?auto_805859 ?auto_805868 ) ) ( not ( = ?auto_805859 ?auto_805869 ) ) ( not ( = ?auto_805860 ?auto_805861 ) ) ( not ( = ?auto_805860 ?auto_805862 ) ) ( not ( = ?auto_805860 ?auto_805863 ) ) ( not ( = ?auto_805860 ?auto_805864 ) ) ( not ( = ?auto_805860 ?auto_805865 ) ) ( not ( = ?auto_805860 ?auto_805866 ) ) ( not ( = ?auto_805860 ?auto_805867 ) ) ( not ( = ?auto_805860 ?auto_805868 ) ) ( not ( = ?auto_805860 ?auto_805869 ) ) ( not ( = ?auto_805861 ?auto_805862 ) ) ( not ( = ?auto_805861 ?auto_805863 ) ) ( not ( = ?auto_805861 ?auto_805864 ) ) ( not ( = ?auto_805861 ?auto_805865 ) ) ( not ( = ?auto_805861 ?auto_805866 ) ) ( not ( = ?auto_805861 ?auto_805867 ) ) ( not ( = ?auto_805861 ?auto_805868 ) ) ( not ( = ?auto_805861 ?auto_805869 ) ) ( not ( = ?auto_805862 ?auto_805863 ) ) ( not ( = ?auto_805862 ?auto_805864 ) ) ( not ( = ?auto_805862 ?auto_805865 ) ) ( not ( = ?auto_805862 ?auto_805866 ) ) ( not ( = ?auto_805862 ?auto_805867 ) ) ( not ( = ?auto_805862 ?auto_805868 ) ) ( not ( = ?auto_805862 ?auto_805869 ) ) ( not ( = ?auto_805863 ?auto_805864 ) ) ( not ( = ?auto_805863 ?auto_805865 ) ) ( not ( = ?auto_805863 ?auto_805866 ) ) ( not ( = ?auto_805863 ?auto_805867 ) ) ( not ( = ?auto_805863 ?auto_805868 ) ) ( not ( = ?auto_805863 ?auto_805869 ) ) ( not ( = ?auto_805864 ?auto_805865 ) ) ( not ( = ?auto_805864 ?auto_805866 ) ) ( not ( = ?auto_805864 ?auto_805867 ) ) ( not ( = ?auto_805864 ?auto_805868 ) ) ( not ( = ?auto_805864 ?auto_805869 ) ) ( not ( = ?auto_805865 ?auto_805866 ) ) ( not ( = ?auto_805865 ?auto_805867 ) ) ( not ( = ?auto_805865 ?auto_805868 ) ) ( not ( = ?auto_805865 ?auto_805869 ) ) ( not ( = ?auto_805866 ?auto_805867 ) ) ( not ( = ?auto_805866 ?auto_805868 ) ) ( not ( = ?auto_805866 ?auto_805869 ) ) ( not ( = ?auto_805867 ?auto_805868 ) ) ( not ( = ?auto_805867 ?auto_805869 ) ) ( not ( = ?auto_805868 ?auto_805869 ) ) ( ON ?auto_805867 ?auto_805868 ) ( ON ?auto_805866 ?auto_805867 ) ( ON ?auto_805865 ?auto_805866 ) ( ON ?auto_805864 ?auto_805865 ) ( CLEAR ?auto_805862 ) ( ON ?auto_805863 ?auto_805864 ) ( CLEAR ?auto_805863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_805854 ?auto_805855 ?auto_805856 ?auto_805857 ?auto_805858 ?auto_805859 ?auto_805860 ?auto_805861 ?auto_805862 ?auto_805863 )
      ( MAKE-15PILE ?auto_805854 ?auto_805855 ?auto_805856 ?auto_805857 ?auto_805858 ?auto_805859 ?auto_805860 ?auto_805861 ?auto_805862 ?auto_805863 ?auto_805864 ?auto_805865 ?auto_805866 ?auto_805867 ?auto_805868 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805916 - BLOCK
      ?auto_805917 - BLOCK
      ?auto_805918 - BLOCK
      ?auto_805919 - BLOCK
      ?auto_805920 - BLOCK
      ?auto_805921 - BLOCK
      ?auto_805922 - BLOCK
      ?auto_805923 - BLOCK
      ?auto_805924 - BLOCK
      ?auto_805925 - BLOCK
      ?auto_805926 - BLOCK
      ?auto_805927 - BLOCK
      ?auto_805928 - BLOCK
      ?auto_805929 - BLOCK
      ?auto_805930 - BLOCK
    )
    :vars
    (
      ?auto_805931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805930 ?auto_805931 ) ( ON-TABLE ?auto_805916 ) ( ON ?auto_805917 ?auto_805916 ) ( ON ?auto_805918 ?auto_805917 ) ( ON ?auto_805919 ?auto_805918 ) ( ON ?auto_805920 ?auto_805919 ) ( ON ?auto_805921 ?auto_805920 ) ( ON ?auto_805922 ?auto_805921 ) ( ON ?auto_805923 ?auto_805922 ) ( not ( = ?auto_805916 ?auto_805917 ) ) ( not ( = ?auto_805916 ?auto_805918 ) ) ( not ( = ?auto_805916 ?auto_805919 ) ) ( not ( = ?auto_805916 ?auto_805920 ) ) ( not ( = ?auto_805916 ?auto_805921 ) ) ( not ( = ?auto_805916 ?auto_805922 ) ) ( not ( = ?auto_805916 ?auto_805923 ) ) ( not ( = ?auto_805916 ?auto_805924 ) ) ( not ( = ?auto_805916 ?auto_805925 ) ) ( not ( = ?auto_805916 ?auto_805926 ) ) ( not ( = ?auto_805916 ?auto_805927 ) ) ( not ( = ?auto_805916 ?auto_805928 ) ) ( not ( = ?auto_805916 ?auto_805929 ) ) ( not ( = ?auto_805916 ?auto_805930 ) ) ( not ( = ?auto_805916 ?auto_805931 ) ) ( not ( = ?auto_805917 ?auto_805918 ) ) ( not ( = ?auto_805917 ?auto_805919 ) ) ( not ( = ?auto_805917 ?auto_805920 ) ) ( not ( = ?auto_805917 ?auto_805921 ) ) ( not ( = ?auto_805917 ?auto_805922 ) ) ( not ( = ?auto_805917 ?auto_805923 ) ) ( not ( = ?auto_805917 ?auto_805924 ) ) ( not ( = ?auto_805917 ?auto_805925 ) ) ( not ( = ?auto_805917 ?auto_805926 ) ) ( not ( = ?auto_805917 ?auto_805927 ) ) ( not ( = ?auto_805917 ?auto_805928 ) ) ( not ( = ?auto_805917 ?auto_805929 ) ) ( not ( = ?auto_805917 ?auto_805930 ) ) ( not ( = ?auto_805917 ?auto_805931 ) ) ( not ( = ?auto_805918 ?auto_805919 ) ) ( not ( = ?auto_805918 ?auto_805920 ) ) ( not ( = ?auto_805918 ?auto_805921 ) ) ( not ( = ?auto_805918 ?auto_805922 ) ) ( not ( = ?auto_805918 ?auto_805923 ) ) ( not ( = ?auto_805918 ?auto_805924 ) ) ( not ( = ?auto_805918 ?auto_805925 ) ) ( not ( = ?auto_805918 ?auto_805926 ) ) ( not ( = ?auto_805918 ?auto_805927 ) ) ( not ( = ?auto_805918 ?auto_805928 ) ) ( not ( = ?auto_805918 ?auto_805929 ) ) ( not ( = ?auto_805918 ?auto_805930 ) ) ( not ( = ?auto_805918 ?auto_805931 ) ) ( not ( = ?auto_805919 ?auto_805920 ) ) ( not ( = ?auto_805919 ?auto_805921 ) ) ( not ( = ?auto_805919 ?auto_805922 ) ) ( not ( = ?auto_805919 ?auto_805923 ) ) ( not ( = ?auto_805919 ?auto_805924 ) ) ( not ( = ?auto_805919 ?auto_805925 ) ) ( not ( = ?auto_805919 ?auto_805926 ) ) ( not ( = ?auto_805919 ?auto_805927 ) ) ( not ( = ?auto_805919 ?auto_805928 ) ) ( not ( = ?auto_805919 ?auto_805929 ) ) ( not ( = ?auto_805919 ?auto_805930 ) ) ( not ( = ?auto_805919 ?auto_805931 ) ) ( not ( = ?auto_805920 ?auto_805921 ) ) ( not ( = ?auto_805920 ?auto_805922 ) ) ( not ( = ?auto_805920 ?auto_805923 ) ) ( not ( = ?auto_805920 ?auto_805924 ) ) ( not ( = ?auto_805920 ?auto_805925 ) ) ( not ( = ?auto_805920 ?auto_805926 ) ) ( not ( = ?auto_805920 ?auto_805927 ) ) ( not ( = ?auto_805920 ?auto_805928 ) ) ( not ( = ?auto_805920 ?auto_805929 ) ) ( not ( = ?auto_805920 ?auto_805930 ) ) ( not ( = ?auto_805920 ?auto_805931 ) ) ( not ( = ?auto_805921 ?auto_805922 ) ) ( not ( = ?auto_805921 ?auto_805923 ) ) ( not ( = ?auto_805921 ?auto_805924 ) ) ( not ( = ?auto_805921 ?auto_805925 ) ) ( not ( = ?auto_805921 ?auto_805926 ) ) ( not ( = ?auto_805921 ?auto_805927 ) ) ( not ( = ?auto_805921 ?auto_805928 ) ) ( not ( = ?auto_805921 ?auto_805929 ) ) ( not ( = ?auto_805921 ?auto_805930 ) ) ( not ( = ?auto_805921 ?auto_805931 ) ) ( not ( = ?auto_805922 ?auto_805923 ) ) ( not ( = ?auto_805922 ?auto_805924 ) ) ( not ( = ?auto_805922 ?auto_805925 ) ) ( not ( = ?auto_805922 ?auto_805926 ) ) ( not ( = ?auto_805922 ?auto_805927 ) ) ( not ( = ?auto_805922 ?auto_805928 ) ) ( not ( = ?auto_805922 ?auto_805929 ) ) ( not ( = ?auto_805922 ?auto_805930 ) ) ( not ( = ?auto_805922 ?auto_805931 ) ) ( not ( = ?auto_805923 ?auto_805924 ) ) ( not ( = ?auto_805923 ?auto_805925 ) ) ( not ( = ?auto_805923 ?auto_805926 ) ) ( not ( = ?auto_805923 ?auto_805927 ) ) ( not ( = ?auto_805923 ?auto_805928 ) ) ( not ( = ?auto_805923 ?auto_805929 ) ) ( not ( = ?auto_805923 ?auto_805930 ) ) ( not ( = ?auto_805923 ?auto_805931 ) ) ( not ( = ?auto_805924 ?auto_805925 ) ) ( not ( = ?auto_805924 ?auto_805926 ) ) ( not ( = ?auto_805924 ?auto_805927 ) ) ( not ( = ?auto_805924 ?auto_805928 ) ) ( not ( = ?auto_805924 ?auto_805929 ) ) ( not ( = ?auto_805924 ?auto_805930 ) ) ( not ( = ?auto_805924 ?auto_805931 ) ) ( not ( = ?auto_805925 ?auto_805926 ) ) ( not ( = ?auto_805925 ?auto_805927 ) ) ( not ( = ?auto_805925 ?auto_805928 ) ) ( not ( = ?auto_805925 ?auto_805929 ) ) ( not ( = ?auto_805925 ?auto_805930 ) ) ( not ( = ?auto_805925 ?auto_805931 ) ) ( not ( = ?auto_805926 ?auto_805927 ) ) ( not ( = ?auto_805926 ?auto_805928 ) ) ( not ( = ?auto_805926 ?auto_805929 ) ) ( not ( = ?auto_805926 ?auto_805930 ) ) ( not ( = ?auto_805926 ?auto_805931 ) ) ( not ( = ?auto_805927 ?auto_805928 ) ) ( not ( = ?auto_805927 ?auto_805929 ) ) ( not ( = ?auto_805927 ?auto_805930 ) ) ( not ( = ?auto_805927 ?auto_805931 ) ) ( not ( = ?auto_805928 ?auto_805929 ) ) ( not ( = ?auto_805928 ?auto_805930 ) ) ( not ( = ?auto_805928 ?auto_805931 ) ) ( not ( = ?auto_805929 ?auto_805930 ) ) ( not ( = ?auto_805929 ?auto_805931 ) ) ( not ( = ?auto_805930 ?auto_805931 ) ) ( ON ?auto_805929 ?auto_805930 ) ( ON ?auto_805928 ?auto_805929 ) ( ON ?auto_805927 ?auto_805928 ) ( ON ?auto_805926 ?auto_805927 ) ( ON ?auto_805925 ?auto_805926 ) ( CLEAR ?auto_805923 ) ( ON ?auto_805924 ?auto_805925 ) ( CLEAR ?auto_805924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_805916 ?auto_805917 ?auto_805918 ?auto_805919 ?auto_805920 ?auto_805921 ?auto_805922 ?auto_805923 ?auto_805924 )
      ( MAKE-15PILE ?auto_805916 ?auto_805917 ?auto_805918 ?auto_805919 ?auto_805920 ?auto_805921 ?auto_805922 ?auto_805923 ?auto_805924 ?auto_805925 ?auto_805926 ?auto_805927 ?auto_805928 ?auto_805929 ?auto_805930 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_805978 - BLOCK
      ?auto_805979 - BLOCK
      ?auto_805980 - BLOCK
      ?auto_805981 - BLOCK
      ?auto_805982 - BLOCK
      ?auto_805983 - BLOCK
      ?auto_805984 - BLOCK
      ?auto_805985 - BLOCK
      ?auto_805986 - BLOCK
      ?auto_805987 - BLOCK
      ?auto_805988 - BLOCK
      ?auto_805989 - BLOCK
      ?auto_805990 - BLOCK
      ?auto_805991 - BLOCK
      ?auto_805992 - BLOCK
    )
    :vars
    (
      ?auto_805993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_805992 ?auto_805993 ) ( ON-TABLE ?auto_805978 ) ( ON ?auto_805979 ?auto_805978 ) ( ON ?auto_805980 ?auto_805979 ) ( ON ?auto_805981 ?auto_805980 ) ( ON ?auto_805982 ?auto_805981 ) ( ON ?auto_805983 ?auto_805982 ) ( ON ?auto_805984 ?auto_805983 ) ( not ( = ?auto_805978 ?auto_805979 ) ) ( not ( = ?auto_805978 ?auto_805980 ) ) ( not ( = ?auto_805978 ?auto_805981 ) ) ( not ( = ?auto_805978 ?auto_805982 ) ) ( not ( = ?auto_805978 ?auto_805983 ) ) ( not ( = ?auto_805978 ?auto_805984 ) ) ( not ( = ?auto_805978 ?auto_805985 ) ) ( not ( = ?auto_805978 ?auto_805986 ) ) ( not ( = ?auto_805978 ?auto_805987 ) ) ( not ( = ?auto_805978 ?auto_805988 ) ) ( not ( = ?auto_805978 ?auto_805989 ) ) ( not ( = ?auto_805978 ?auto_805990 ) ) ( not ( = ?auto_805978 ?auto_805991 ) ) ( not ( = ?auto_805978 ?auto_805992 ) ) ( not ( = ?auto_805978 ?auto_805993 ) ) ( not ( = ?auto_805979 ?auto_805980 ) ) ( not ( = ?auto_805979 ?auto_805981 ) ) ( not ( = ?auto_805979 ?auto_805982 ) ) ( not ( = ?auto_805979 ?auto_805983 ) ) ( not ( = ?auto_805979 ?auto_805984 ) ) ( not ( = ?auto_805979 ?auto_805985 ) ) ( not ( = ?auto_805979 ?auto_805986 ) ) ( not ( = ?auto_805979 ?auto_805987 ) ) ( not ( = ?auto_805979 ?auto_805988 ) ) ( not ( = ?auto_805979 ?auto_805989 ) ) ( not ( = ?auto_805979 ?auto_805990 ) ) ( not ( = ?auto_805979 ?auto_805991 ) ) ( not ( = ?auto_805979 ?auto_805992 ) ) ( not ( = ?auto_805979 ?auto_805993 ) ) ( not ( = ?auto_805980 ?auto_805981 ) ) ( not ( = ?auto_805980 ?auto_805982 ) ) ( not ( = ?auto_805980 ?auto_805983 ) ) ( not ( = ?auto_805980 ?auto_805984 ) ) ( not ( = ?auto_805980 ?auto_805985 ) ) ( not ( = ?auto_805980 ?auto_805986 ) ) ( not ( = ?auto_805980 ?auto_805987 ) ) ( not ( = ?auto_805980 ?auto_805988 ) ) ( not ( = ?auto_805980 ?auto_805989 ) ) ( not ( = ?auto_805980 ?auto_805990 ) ) ( not ( = ?auto_805980 ?auto_805991 ) ) ( not ( = ?auto_805980 ?auto_805992 ) ) ( not ( = ?auto_805980 ?auto_805993 ) ) ( not ( = ?auto_805981 ?auto_805982 ) ) ( not ( = ?auto_805981 ?auto_805983 ) ) ( not ( = ?auto_805981 ?auto_805984 ) ) ( not ( = ?auto_805981 ?auto_805985 ) ) ( not ( = ?auto_805981 ?auto_805986 ) ) ( not ( = ?auto_805981 ?auto_805987 ) ) ( not ( = ?auto_805981 ?auto_805988 ) ) ( not ( = ?auto_805981 ?auto_805989 ) ) ( not ( = ?auto_805981 ?auto_805990 ) ) ( not ( = ?auto_805981 ?auto_805991 ) ) ( not ( = ?auto_805981 ?auto_805992 ) ) ( not ( = ?auto_805981 ?auto_805993 ) ) ( not ( = ?auto_805982 ?auto_805983 ) ) ( not ( = ?auto_805982 ?auto_805984 ) ) ( not ( = ?auto_805982 ?auto_805985 ) ) ( not ( = ?auto_805982 ?auto_805986 ) ) ( not ( = ?auto_805982 ?auto_805987 ) ) ( not ( = ?auto_805982 ?auto_805988 ) ) ( not ( = ?auto_805982 ?auto_805989 ) ) ( not ( = ?auto_805982 ?auto_805990 ) ) ( not ( = ?auto_805982 ?auto_805991 ) ) ( not ( = ?auto_805982 ?auto_805992 ) ) ( not ( = ?auto_805982 ?auto_805993 ) ) ( not ( = ?auto_805983 ?auto_805984 ) ) ( not ( = ?auto_805983 ?auto_805985 ) ) ( not ( = ?auto_805983 ?auto_805986 ) ) ( not ( = ?auto_805983 ?auto_805987 ) ) ( not ( = ?auto_805983 ?auto_805988 ) ) ( not ( = ?auto_805983 ?auto_805989 ) ) ( not ( = ?auto_805983 ?auto_805990 ) ) ( not ( = ?auto_805983 ?auto_805991 ) ) ( not ( = ?auto_805983 ?auto_805992 ) ) ( not ( = ?auto_805983 ?auto_805993 ) ) ( not ( = ?auto_805984 ?auto_805985 ) ) ( not ( = ?auto_805984 ?auto_805986 ) ) ( not ( = ?auto_805984 ?auto_805987 ) ) ( not ( = ?auto_805984 ?auto_805988 ) ) ( not ( = ?auto_805984 ?auto_805989 ) ) ( not ( = ?auto_805984 ?auto_805990 ) ) ( not ( = ?auto_805984 ?auto_805991 ) ) ( not ( = ?auto_805984 ?auto_805992 ) ) ( not ( = ?auto_805984 ?auto_805993 ) ) ( not ( = ?auto_805985 ?auto_805986 ) ) ( not ( = ?auto_805985 ?auto_805987 ) ) ( not ( = ?auto_805985 ?auto_805988 ) ) ( not ( = ?auto_805985 ?auto_805989 ) ) ( not ( = ?auto_805985 ?auto_805990 ) ) ( not ( = ?auto_805985 ?auto_805991 ) ) ( not ( = ?auto_805985 ?auto_805992 ) ) ( not ( = ?auto_805985 ?auto_805993 ) ) ( not ( = ?auto_805986 ?auto_805987 ) ) ( not ( = ?auto_805986 ?auto_805988 ) ) ( not ( = ?auto_805986 ?auto_805989 ) ) ( not ( = ?auto_805986 ?auto_805990 ) ) ( not ( = ?auto_805986 ?auto_805991 ) ) ( not ( = ?auto_805986 ?auto_805992 ) ) ( not ( = ?auto_805986 ?auto_805993 ) ) ( not ( = ?auto_805987 ?auto_805988 ) ) ( not ( = ?auto_805987 ?auto_805989 ) ) ( not ( = ?auto_805987 ?auto_805990 ) ) ( not ( = ?auto_805987 ?auto_805991 ) ) ( not ( = ?auto_805987 ?auto_805992 ) ) ( not ( = ?auto_805987 ?auto_805993 ) ) ( not ( = ?auto_805988 ?auto_805989 ) ) ( not ( = ?auto_805988 ?auto_805990 ) ) ( not ( = ?auto_805988 ?auto_805991 ) ) ( not ( = ?auto_805988 ?auto_805992 ) ) ( not ( = ?auto_805988 ?auto_805993 ) ) ( not ( = ?auto_805989 ?auto_805990 ) ) ( not ( = ?auto_805989 ?auto_805991 ) ) ( not ( = ?auto_805989 ?auto_805992 ) ) ( not ( = ?auto_805989 ?auto_805993 ) ) ( not ( = ?auto_805990 ?auto_805991 ) ) ( not ( = ?auto_805990 ?auto_805992 ) ) ( not ( = ?auto_805990 ?auto_805993 ) ) ( not ( = ?auto_805991 ?auto_805992 ) ) ( not ( = ?auto_805991 ?auto_805993 ) ) ( not ( = ?auto_805992 ?auto_805993 ) ) ( ON ?auto_805991 ?auto_805992 ) ( ON ?auto_805990 ?auto_805991 ) ( ON ?auto_805989 ?auto_805990 ) ( ON ?auto_805988 ?auto_805989 ) ( ON ?auto_805987 ?auto_805988 ) ( ON ?auto_805986 ?auto_805987 ) ( CLEAR ?auto_805984 ) ( ON ?auto_805985 ?auto_805986 ) ( CLEAR ?auto_805985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_805978 ?auto_805979 ?auto_805980 ?auto_805981 ?auto_805982 ?auto_805983 ?auto_805984 ?auto_805985 )
      ( MAKE-15PILE ?auto_805978 ?auto_805979 ?auto_805980 ?auto_805981 ?auto_805982 ?auto_805983 ?auto_805984 ?auto_805985 ?auto_805986 ?auto_805987 ?auto_805988 ?auto_805989 ?auto_805990 ?auto_805991 ?auto_805992 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806040 - BLOCK
      ?auto_806041 - BLOCK
      ?auto_806042 - BLOCK
      ?auto_806043 - BLOCK
      ?auto_806044 - BLOCK
      ?auto_806045 - BLOCK
      ?auto_806046 - BLOCK
      ?auto_806047 - BLOCK
      ?auto_806048 - BLOCK
      ?auto_806049 - BLOCK
      ?auto_806050 - BLOCK
      ?auto_806051 - BLOCK
      ?auto_806052 - BLOCK
      ?auto_806053 - BLOCK
      ?auto_806054 - BLOCK
    )
    :vars
    (
      ?auto_806055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806054 ?auto_806055 ) ( ON-TABLE ?auto_806040 ) ( ON ?auto_806041 ?auto_806040 ) ( ON ?auto_806042 ?auto_806041 ) ( ON ?auto_806043 ?auto_806042 ) ( ON ?auto_806044 ?auto_806043 ) ( ON ?auto_806045 ?auto_806044 ) ( not ( = ?auto_806040 ?auto_806041 ) ) ( not ( = ?auto_806040 ?auto_806042 ) ) ( not ( = ?auto_806040 ?auto_806043 ) ) ( not ( = ?auto_806040 ?auto_806044 ) ) ( not ( = ?auto_806040 ?auto_806045 ) ) ( not ( = ?auto_806040 ?auto_806046 ) ) ( not ( = ?auto_806040 ?auto_806047 ) ) ( not ( = ?auto_806040 ?auto_806048 ) ) ( not ( = ?auto_806040 ?auto_806049 ) ) ( not ( = ?auto_806040 ?auto_806050 ) ) ( not ( = ?auto_806040 ?auto_806051 ) ) ( not ( = ?auto_806040 ?auto_806052 ) ) ( not ( = ?auto_806040 ?auto_806053 ) ) ( not ( = ?auto_806040 ?auto_806054 ) ) ( not ( = ?auto_806040 ?auto_806055 ) ) ( not ( = ?auto_806041 ?auto_806042 ) ) ( not ( = ?auto_806041 ?auto_806043 ) ) ( not ( = ?auto_806041 ?auto_806044 ) ) ( not ( = ?auto_806041 ?auto_806045 ) ) ( not ( = ?auto_806041 ?auto_806046 ) ) ( not ( = ?auto_806041 ?auto_806047 ) ) ( not ( = ?auto_806041 ?auto_806048 ) ) ( not ( = ?auto_806041 ?auto_806049 ) ) ( not ( = ?auto_806041 ?auto_806050 ) ) ( not ( = ?auto_806041 ?auto_806051 ) ) ( not ( = ?auto_806041 ?auto_806052 ) ) ( not ( = ?auto_806041 ?auto_806053 ) ) ( not ( = ?auto_806041 ?auto_806054 ) ) ( not ( = ?auto_806041 ?auto_806055 ) ) ( not ( = ?auto_806042 ?auto_806043 ) ) ( not ( = ?auto_806042 ?auto_806044 ) ) ( not ( = ?auto_806042 ?auto_806045 ) ) ( not ( = ?auto_806042 ?auto_806046 ) ) ( not ( = ?auto_806042 ?auto_806047 ) ) ( not ( = ?auto_806042 ?auto_806048 ) ) ( not ( = ?auto_806042 ?auto_806049 ) ) ( not ( = ?auto_806042 ?auto_806050 ) ) ( not ( = ?auto_806042 ?auto_806051 ) ) ( not ( = ?auto_806042 ?auto_806052 ) ) ( not ( = ?auto_806042 ?auto_806053 ) ) ( not ( = ?auto_806042 ?auto_806054 ) ) ( not ( = ?auto_806042 ?auto_806055 ) ) ( not ( = ?auto_806043 ?auto_806044 ) ) ( not ( = ?auto_806043 ?auto_806045 ) ) ( not ( = ?auto_806043 ?auto_806046 ) ) ( not ( = ?auto_806043 ?auto_806047 ) ) ( not ( = ?auto_806043 ?auto_806048 ) ) ( not ( = ?auto_806043 ?auto_806049 ) ) ( not ( = ?auto_806043 ?auto_806050 ) ) ( not ( = ?auto_806043 ?auto_806051 ) ) ( not ( = ?auto_806043 ?auto_806052 ) ) ( not ( = ?auto_806043 ?auto_806053 ) ) ( not ( = ?auto_806043 ?auto_806054 ) ) ( not ( = ?auto_806043 ?auto_806055 ) ) ( not ( = ?auto_806044 ?auto_806045 ) ) ( not ( = ?auto_806044 ?auto_806046 ) ) ( not ( = ?auto_806044 ?auto_806047 ) ) ( not ( = ?auto_806044 ?auto_806048 ) ) ( not ( = ?auto_806044 ?auto_806049 ) ) ( not ( = ?auto_806044 ?auto_806050 ) ) ( not ( = ?auto_806044 ?auto_806051 ) ) ( not ( = ?auto_806044 ?auto_806052 ) ) ( not ( = ?auto_806044 ?auto_806053 ) ) ( not ( = ?auto_806044 ?auto_806054 ) ) ( not ( = ?auto_806044 ?auto_806055 ) ) ( not ( = ?auto_806045 ?auto_806046 ) ) ( not ( = ?auto_806045 ?auto_806047 ) ) ( not ( = ?auto_806045 ?auto_806048 ) ) ( not ( = ?auto_806045 ?auto_806049 ) ) ( not ( = ?auto_806045 ?auto_806050 ) ) ( not ( = ?auto_806045 ?auto_806051 ) ) ( not ( = ?auto_806045 ?auto_806052 ) ) ( not ( = ?auto_806045 ?auto_806053 ) ) ( not ( = ?auto_806045 ?auto_806054 ) ) ( not ( = ?auto_806045 ?auto_806055 ) ) ( not ( = ?auto_806046 ?auto_806047 ) ) ( not ( = ?auto_806046 ?auto_806048 ) ) ( not ( = ?auto_806046 ?auto_806049 ) ) ( not ( = ?auto_806046 ?auto_806050 ) ) ( not ( = ?auto_806046 ?auto_806051 ) ) ( not ( = ?auto_806046 ?auto_806052 ) ) ( not ( = ?auto_806046 ?auto_806053 ) ) ( not ( = ?auto_806046 ?auto_806054 ) ) ( not ( = ?auto_806046 ?auto_806055 ) ) ( not ( = ?auto_806047 ?auto_806048 ) ) ( not ( = ?auto_806047 ?auto_806049 ) ) ( not ( = ?auto_806047 ?auto_806050 ) ) ( not ( = ?auto_806047 ?auto_806051 ) ) ( not ( = ?auto_806047 ?auto_806052 ) ) ( not ( = ?auto_806047 ?auto_806053 ) ) ( not ( = ?auto_806047 ?auto_806054 ) ) ( not ( = ?auto_806047 ?auto_806055 ) ) ( not ( = ?auto_806048 ?auto_806049 ) ) ( not ( = ?auto_806048 ?auto_806050 ) ) ( not ( = ?auto_806048 ?auto_806051 ) ) ( not ( = ?auto_806048 ?auto_806052 ) ) ( not ( = ?auto_806048 ?auto_806053 ) ) ( not ( = ?auto_806048 ?auto_806054 ) ) ( not ( = ?auto_806048 ?auto_806055 ) ) ( not ( = ?auto_806049 ?auto_806050 ) ) ( not ( = ?auto_806049 ?auto_806051 ) ) ( not ( = ?auto_806049 ?auto_806052 ) ) ( not ( = ?auto_806049 ?auto_806053 ) ) ( not ( = ?auto_806049 ?auto_806054 ) ) ( not ( = ?auto_806049 ?auto_806055 ) ) ( not ( = ?auto_806050 ?auto_806051 ) ) ( not ( = ?auto_806050 ?auto_806052 ) ) ( not ( = ?auto_806050 ?auto_806053 ) ) ( not ( = ?auto_806050 ?auto_806054 ) ) ( not ( = ?auto_806050 ?auto_806055 ) ) ( not ( = ?auto_806051 ?auto_806052 ) ) ( not ( = ?auto_806051 ?auto_806053 ) ) ( not ( = ?auto_806051 ?auto_806054 ) ) ( not ( = ?auto_806051 ?auto_806055 ) ) ( not ( = ?auto_806052 ?auto_806053 ) ) ( not ( = ?auto_806052 ?auto_806054 ) ) ( not ( = ?auto_806052 ?auto_806055 ) ) ( not ( = ?auto_806053 ?auto_806054 ) ) ( not ( = ?auto_806053 ?auto_806055 ) ) ( not ( = ?auto_806054 ?auto_806055 ) ) ( ON ?auto_806053 ?auto_806054 ) ( ON ?auto_806052 ?auto_806053 ) ( ON ?auto_806051 ?auto_806052 ) ( ON ?auto_806050 ?auto_806051 ) ( ON ?auto_806049 ?auto_806050 ) ( ON ?auto_806048 ?auto_806049 ) ( ON ?auto_806047 ?auto_806048 ) ( CLEAR ?auto_806045 ) ( ON ?auto_806046 ?auto_806047 ) ( CLEAR ?auto_806046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_806040 ?auto_806041 ?auto_806042 ?auto_806043 ?auto_806044 ?auto_806045 ?auto_806046 )
      ( MAKE-15PILE ?auto_806040 ?auto_806041 ?auto_806042 ?auto_806043 ?auto_806044 ?auto_806045 ?auto_806046 ?auto_806047 ?auto_806048 ?auto_806049 ?auto_806050 ?auto_806051 ?auto_806052 ?auto_806053 ?auto_806054 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806102 - BLOCK
      ?auto_806103 - BLOCK
      ?auto_806104 - BLOCK
      ?auto_806105 - BLOCK
      ?auto_806106 - BLOCK
      ?auto_806107 - BLOCK
      ?auto_806108 - BLOCK
      ?auto_806109 - BLOCK
      ?auto_806110 - BLOCK
      ?auto_806111 - BLOCK
      ?auto_806112 - BLOCK
      ?auto_806113 - BLOCK
      ?auto_806114 - BLOCK
      ?auto_806115 - BLOCK
      ?auto_806116 - BLOCK
    )
    :vars
    (
      ?auto_806117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806116 ?auto_806117 ) ( ON-TABLE ?auto_806102 ) ( ON ?auto_806103 ?auto_806102 ) ( ON ?auto_806104 ?auto_806103 ) ( ON ?auto_806105 ?auto_806104 ) ( ON ?auto_806106 ?auto_806105 ) ( not ( = ?auto_806102 ?auto_806103 ) ) ( not ( = ?auto_806102 ?auto_806104 ) ) ( not ( = ?auto_806102 ?auto_806105 ) ) ( not ( = ?auto_806102 ?auto_806106 ) ) ( not ( = ?auto_806102 ?auto_806107 ) ) ( not ( = ?auto_806102 ?auto_806108 ) ) ( not ( = ?auto_806102 ?auto_806109 ) ) ( not ( = ?auto_806102 ?auto_806110 ) ) ( not ( = ?auto_806102 ?auto_806111 ) ) ( not ( = ?auto_806102 ?auto_806112 ) ) ( not ( = ?auto_806102 ?auto_806113 ) ) ( not ( = ?auto_806102 ?auto_806114 ) ) ( not ( = ?auto_806102 ?auto_806115 ) ) ( not ( = ?auto_806102 ?auto_806116 ) ) ( not ( = ?auto_806102 ?auto_806117 ) ) ( not ( = ?auto_806103 ?auto_806104 ) ) ( not ( = ?auto_806103 ?auto_806105 ) ) ( not ( = ?auto_806103 ?auto_806106 ) ) ( not ( = ?auto_806103 ?auto_806107 ) ) ( not ( = ?auto_806103 ?auto_806108 ) ) ( not ( = ?auto_806103 ?auto_806109 ) ) ( not ( = ?auto_806103 ?auto_806110 ) ) ( not ( = ?auto_806103 ?auto_806111 ) ) ( not ( = ?auto_806103 ?auto_806112 ) ) ( not ( = ?auto_806103 ?auto_806113 ) ) ( not ( = ?auto_806103 ?auto_806114 ) ) ( not ( = ?auto_806103 ?auto_806115 ) ) ( not ( = ?auto_806103 ?auto_806116 ) ) ( not ( = ?auto_806103 ?auto_806117 ) ) ( not ( = ?auto_806104 ?auto_806105 ) ) ( not ( = ?auto_806104 ?auto_806106 ) ) ( not ( = ?auto_806104 ?auto_806107 ) ) ( not ( = ?auto_806104 ?auto_806108 ) ) ( not ( = ?auto_806104 ?auto_806109 ) ) ( not ( = ?auto_806104 ?auto_806110 ) ) ( not ( = ?auto_806104 ?auto_806111 ) ) ( not ( = ?auto_806104 ?auto_806112 ) ) ( not ( = ?auto_806104 ?auto_806113 ) ) ( not ( = ?auto_806104 ?auto_806114 ) ) ( not ( = ?auto_806104 ?auto_806115 ) ) ( not ( = ?auto_806104 ?auto_806116 ) ) ( not ( = ?auto_806104 ?auto_806117 ) ) ( not ( = ?auto_806105 ?auto_806106 ) ) ( not ( = ?auto_806105 ?auto_806107 ) ) ( not ( = ?auto_806105 ?auto_806108 ) ) ( not ( = ?auto_806105 ?auto_806109 ) ) ( not ( = ?auto_806105 ?auto_806110 ) ) ( not ( = ?auto_806105 ?auto_806111 ) ) ( not ( = ?auto_806105 ?auto_806112 ) ) ( not ( = ?auto_806105 ?auto_806113 ) ) ( not ( = ?auto_806105 ?auto_806114 ) ) ( not ( = ?auto_806105 ?auto_806115 ) ) ( not ( = ?auto_806105 ?auto_806116 ) ) ( not ( = ?auto_806105 ?auto_806117 ) ) ( not ( = ?auto_806106 ?auto_806107 ) ) ( not ( = ?auto_806106 ?auto_806108 ) ) ( not ( = ?auto_806106 ?auto_806109 ) ) ( not ( = ?auto_806106 ?auto_806110 ) ) ( not ( = ?auto_806106 ?auto_806111 ) ) ( not ( = ?auto_806106 ?auto_806112 ) ) ( not ( = ?auto_806106 ?auto_806113 ) ) ( not ( = ?auto_806106 ?auto_806114 ) ) ( not ( = ?auto_806106 ?auto_806115 ) ) ( not ( = ?auto_806106 ?auto_806116 ) ) ( not ( = ?auto_806106 ?auto_806117 ) ) ( not ( = ?auto_806107 ?auto_806108 ) ) ( not ( = ?auto_806107 ?auto_806109 ) ) ( not ( = ?auto_806107 ?auto_806110 ) ) ( not ( = ?auto_806107 ?auto_806111 ) ) ( not ( = ?auto_806107 ?auto_806112 ) ) ( not ( = ?auto_806107 ?auto_806113 ) ) ( not ( = ?auto_806107 ?auto_806114 ) ) ( not ( = ?auto_806107 ?auto_806115 ) ) ( not ( = ?auto_806107 ?auto_806116 ) ) ( not ( = ?auto_806107 ?auto_806117 ) ) ( not ( = ?auto_806108 ?auto_806109 ) ) ( not ( = ?auto_806108 ?auto_806110 ) ) ( not ( = ?auto_806108 ?auto_806111 ) ) ( not ( = ?auto_806108 ?auto_806112 ) ) ( not ( = ?auto_806108 ?auto_806113 ) ) ( not ( = ?auto_806108 ?auto_806114 ) ) ( not ( = ?auto_806108 ?auto_806115 ) ) ( not ( = ?auto_806108 ?auto_806116 ) ) ( not ( = ?auto_806108 ?auto_806117 ) ) ( not ( = ?auto_806109 ?auto_806110 ) ) ( not ( = ?auto_806109 ?auto_806111 ) ) ( not ( = ?auto_806109 ?auto_806112 ) ) ( not ( = ?auto_806109 ?auto_806113 ) ) ( not ( = ?auto_806109 ?auto_806114 ) ) ( not ( = ?auto_806109 ?auto_806115 ) ) ( not ( = ?auto_806109 ?auto_806116 ) ) ( not ( = ?auto_806109 ?auto_806117 ) ) ( not ( = ?auto_806110 ?auto_806111 ) ) ( not ( = ?auto_806110 ?auto_806112 ) ) ( not ( = ?auto_806110 ?auto_806113 ) ) ( not ( = ?auto_806110 ?auto_806114 ) ) ( not ( = ?auto_806110 ?auto_806115 ) ) ( not ( = ?auto_806110 ?auto_806116 ) ) ( not ( = ?auto_806110 ?auto_806117 ) ) ( not ( = ?auto_806111 ?auto_806112 ) ) ( not ( = ?auto_806111 ?auto_806113 ) ) ( not ( = ?auto_806111 ?auto_806114 ) ) ( not ( = ?auto_806111 ?auto_806115 ) ) ( not ( = ?auto_806111 ?auto_806116 ) ) ( not ( = ?auto_806111 ?auto_806117 ) ) ( not ( = ?auto_806112 ?auto_806113 ) ) ( not ( = ?auto_806112 ?auto_806114 ) ) ( not ( = ?auto_806112 ?auto_806115 ) ) ( not ( = ?auto_806112 ?auto_806116 ) ) ( not ( = ?auto_806112 ?auto_806117 ) ) ( not ( = ?auto_806113 ?auto_806114 ) ) ( not ( = ?auto_806113 ?auto_806115 ) ) ( not ( = ?auto_806113 ?auto_806116 ) ) ( not ( = ?auto_806113 ?auto_806117 ) ) ( not ( = ?auto_806114 ?auto_806115 ) ) ( not ( = ?auto_806114 ?auto_806116 ) ) ( not ( = ?auto_806114 ?auto_806117 ) ) ( not ( = ?auto_806115 ?auto_806116 ) ) ( not ( = ?auto_806115 ?auto_806117 ) ) ( not ( = ?auto_806116 ?auto_806117 ) ) ( ON ?auto_806115 ?auto_806116 ) ( ON ?auto_806114 ?auto_806115 ) ( ON ?auto_806113 ?auto_806114 ) ( ON ?auto_806112 ?auto_806113 ) ( ON ?auto_806111 ?auto_806112 ) ( ON ?auto_806110 ?auto_806111 ) ( ON ?auto_806109 ?auto_806110 ) ( ON ?auto_806108 ?auto_806109 ) ( CLEAR ?auto_806106 ) ( ON ?auto_806107 ?auto_806108 ) ( CLEAR ?auto_806107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_806102 ?auto_806103 ?auto_806104 ?auto_806105 ?auto_806106 ?auto_806107 )
      ( MAKE-15PILE ?auto_806102 ?auto_806103 ?auto_806104 ?auto_806105 ?auto_806106 ?auto_806107 ?auto_806108 ?auto_806109 ?auto_806110 ?auto_806111 ?auto_806112 ?auto_806113 ?auto_806114 ?auto_806115 ?auto_806116 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806164 - BLOCK
      ?auto_806165 - BLOCK
      ?auto_806166 - BLOCK
      ?auto_806167 - BLOCK
      ?auto_806168 - BLOCK
      ?auto_806169 - BLOCK
      ?auto_806170 - BLOCK
      ?auto_806171 - BLOCK
      ?auto_806172 - BLOCK
      ?auto_806173 - BLOCK
      ?auto_806174 - BLOCK
      ?auto_806175 - BLOCK
      ?auto_806176 - BLOCK
      ?auto_806177 - BLOCK
      ?auto_806178 - BLOCK
    )
    :vars
    (
      ?auto_806179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806178 ?auto_806179 ) ( ON-TABLE ?auto_806164 ) ( ON ?auto_806165 ?auto_806164 ) ( ON ?auto_806166 ?auto_806165 ) ( ON ?auto_806167 ?auto_806166 ) ( not ( = ?auto_806164 ?auto_806165 ) ) ( not ( = ?auto_806164 ?auto_806166 ) ) ( not ( = ?auto_806164 ?auto_806167 ) ) ( not ( = ?auto_806164 ?auto_806168 ) ) ( not ( = ?auto_806164 ?auto_806169 ) ) ( not ( = ?auto_806164 ?auto_806170 ) ) ( not ( = ?auto_806164 ?auto_806171 ) ) ( not ( = ?auto_806164 ?auto_806172 ) ) ( not ( = ?auto_806164 ?auto_806173 ) ) ( not ( = ?auto_806164 ?auto_806174 ) ) ( not ( = ?auto_806164 ?auto_806175 ) ) ( not ( = ?auto_806164 ?auto_806176 ) ) ( not ( = ?auto_806164 ?auto_806177 ) ) ( not ( = ?auto_806164 ?auto_806178 ) ) ( not ( = ?auto_806164 ?auto_806179 ) ) ( not ( = ?auto_806165 ?auto_806166 ) ) ( not ( = ?auto_806165 ?auto_806167 ) ) ( not ( = ?auto_806165 ?auto_806168 ) ) ( not ( = ?auto_806165 ?auto_806169 ) ) ( not ( = ?auto_806165 ?auto_806170 ) ) ( not ( = ?auto_806165 ?auto_806171 ) ) ( not ( = ?auto_806165 ?auto_806172 ) ) ( not ( = ?auto_806165 ?auto_806173 ) ) ( not ( = ?auto_806165 ?auto_806174 ) ) ( not ( = ?auto_806165 ?auto_806175 ) ) ( not ( = ?auto_806165 ?auto_806176 ) ) ( not ( = ?auto_806165 ?auto_806177 ) ) ( not ( = ?auto_806165 ?auto_806178 ) ) ( not ( = ?auto_806165 ?auto_806179 ) ) ( not ( = ?auto_806166 ?auto_806167 ) ) ( not ( = ?auto_806166 ?auto_806168 ) ) ( not ( = ?auto_806166 ?auto_806169 ) ) ( not ( = ?auto_806166 ?auto_806170 ) ) ( not ( = ?auto_806166 ?auto_806171 ) ) ( not ( = ?auto_806166 ?auto_806172 ) ) ( not ( = ?auto_806166 ?auto_806173 ) ) ( not ( = ?auto_806166 ?auto_806174 ) ) ( not ( = ?auto_806166 ?auto_806175 ) ) ( not ( = ?auto_806166 ?auto_806176 ) ) ( not ( = ?auto_806166 ?auto_806177 ) ) ( not ( = ?auto_806166 ?auto_806178 ) ) ( not ( = ?auto_806166 ?auto_806179 ) ) ( not ( = ?auto_806167 ?auto_806168 ) ) ( not ( = ?auto_806167 ?auto_806169 ) ) ( not ( = ?auto_806167 ?auto_806170 ) ) ( not ( = ?auto_806167 ?auto_806171 ) ) ( not ( = ?auto_806167 ?auto_806172 ) ) ( not ( = ?auto_806167 ?auto_806173 ) ) ( not ( = ?auto_806167 ?auto_806174 ) ) ( not ( = ?auto_806167 ?auto_806175 ) ) ( not ( = ?auto_806167 ?auto_806176 ) ) ( not ( = ?auto_806167 ?auto_806177 ) ) ( not ( = ?auto_806167 ?auto_806178 ) ) ( not ( = ?auto_806167 ?auto_806179 ) ) ( not ( = ?auto_806168 ?auto_806169 ) ) ( not ( = ?auto_806168 ?auto_806170 ) ) ( not ( = ?auto_806168 ?auto_806171 ) ) ( not ( = ?auto_806168 ?auto_806172 ) ) ( not ( = ?auto_806168 ?auto_806173 ) ) ( not ( = ?auto_806168 ?auto_806174 ) ) ( not ( = ?auto_806168 ?auto_806175 ) ) ( not ( = ?auto_806168 ?auto_806176 ) ) ( not ( = ?auto_806168 ?auto_806177 ) ) ( not ( = ?auto_806168 ?auto_806178 ) ) ( not ( = ?auto_806168 ?auto_806179 ) ) ( not ( = ?auto_806169 ?auto_806170 ) ) ( not ( = ?auto_806169 ?auto_806171 ) ) ( not ( = ?auto_806169 ?auto_806172 ) ) ( not ( = ?auto_806169 ?auto_806173 ) ) ( not ( = ?auto_806169 ?auto_806174 ) ) ( not ( = ?auto_806169 ?auto_806175 ) ) ( not ( = ?auto_806169 ?auto_806176 ) ) ( not ( = ?auto_806169 ?auto_806177 ) ) ( not ( = ?auto_806169 ?auto_806178 ) ) ( not ( = ?auto_806169 ?auto_806179 ) ) ( not ( = ?auto_806170 ?auto_806171 ) ) ( not ( = ?auto_806170 ?auto_806172 ) ) ( not ( = ?auto_806170 ?auto_806173 ) ) ( not ( = ?auto_806170 ?auto_806174 ) ) ( not ( = ?auto_806170 ?auto_806175 ) ) ( not ( = ?auto_806170 ?auto_806176 ) ) ( not ( = ?auto_806170 ?auto_806177 ) ) ( not ( = ?auto_806170 ?auto_806178 ) ) ( not ( = ?auto_806170 ?auto_806179 ) ) ( not ( = ?auto_806171 ?auto_806172 ) ) ( not ( = ?auto_806171 ?auto_806173 ) ) ( not ( = ?auto_806171 ?auto_806174 ) ) ( not ( = ?auto_806171 ?auto_806175 ) ) ( not ( = ?auto_806171 ?auto_806176 ) ) ( not ( = ?auto_806171 ?auto_806177 ) ) ( not ( = ?auto_806171 ?auto_806178 ) ) ( not ( = ?auto_806171 ?auto_806179 ) ) ( not ( = ?auto_806172 ?auto_806173 ) ) ( not ( = ?auto_806172 ?auto_806174 ) ) ( not ( = ?auto_806172 ?auto_806175 ) ) ( not ( = ?auto_806172 ?auto_806176 ) ) ( not ( = ?auto_806172 ?auto_806177 ) ) ( not ( = ?auto_806172 ?auto_806178 ) ) ( not ( = ?auto_806172 ?auto_806179 ) ) ( not ( = ?auto_806173 ?auto_806174 ) ) ( not ( = ?auto_806173 ?auto_806175 ) ) ( not ( = ?auto_806173 ?auto_806176 ) ) ( not ( = ?auto_806173 ?auto_806177 ) ) ( not ( = ?auto_806173 ?auto_806178 ) ) ( not ( = ?auto_806173 ?auto_806179 ) ) ( not ( = ?auto_806174 ?auto_806175 ) ) ( not ( = ?auto_806174 ?auto_806176 ) ) ( not ( = ?auto_806174 ?auto_806177 ) ) ( not ( = ?auto_806174 ?auto_806178 ) ) ( not ( = ?auto_806174 ?auto_806179 ) ) ( not ( = ?auto_806175 ?auto_806176 ) ) ( not ( = ?auto_806175 ?auto_806177 ) ) ( not ( = ?auto_806175 ?auto_806178 ) ) ( not ( = ?auto_806175 ?auto_806179 ) ) ( not ( = ?auto_806176 ?auto_806177 ) ) ( not ( = ?auto_806176 ?auto_806178 ) ) ( not ( = ?auto_806176 ?auto_806179 ) ) ( not ( = ?auto_806177 ?auto_806178 ) ) ( not ( = ?auto_806177 ?auto_806179 ) ) ( not ( = ?auto_806178 ?auto_806179 ) ) ( ON ?auto_806177 ?auto_806178 ) ( ON ?auto_806176 ?auto_806177 ) ( ON ?auto_806175 ?auto_806176 ) ( ON ?auto_806174 ?auto_806175 ) ( ON ?auto_806173 ?auto_806174 ) ( ON ?auto_806172 ?auto_806173 ) ( ON ?auto_806171 ?auto_806172 ) ( ON ?auto_806170 ?auto_806171 ) ( ON ?auto_806169 ?auto_806170 ) ( CLEAR ?auto_806167 ) ( ON ?auto_806168 ?auto_806169 ) ( CLEAR ?auto_806168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_806164 ?auto_806165 ?auto_806166 ?auto_806167 ?auto_806168 )
      ( MAKE-15PILE ?auto_806164 ?auto_806165 ?auto_806166 ?auto_806167 ?auto_806168 ?auto_806169 ?auto_806170 ?auto_806171 ?auto_806172 ?auto_806173 ?auto_806174 ?auto_806175 ?auto_806176 ?auto_806177 ?auto_806178 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806226 - BLOCK
      ?auto_806227 - BLOCK
      ?auto_806228 - BLOCK
      ?auto_806229 - BLOCK
      ?auto_806230 - BLOCK
      ?auto_806231 - BLOCK
      ?auto_806232 - BLOCK
      ?auto_806233 - BLOCK
      ?auto_806234 - BLOCK
      ?auto_806235 - BLOCK
      ?auto_806236 - BLOCK
      ?auto_806237 - BLOCK
      ?auto_806238 - BLOCK
      ?auto_806239 - BLOCK
      ?auto_806240 - BLOCK
    )
    :vars
    (
      ?auto_806241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806240 ?auto_806241 ) ( ON-TABLE ?auto_806226 ) ( ON ?auto_806227 ?auto_806226 ) ( ON ?auto_806228 ?auto_806227 ) ( not ( = ?auto_806226 ?auto_806227 ) ) ( not ( = ?auto_806226 ?auto_806228 ) ) ( not ( = ?auto_806226 ?auto_806229 ) ) ( not ( = ?auto_806226 ?auto_806230 ) ) ( not ( = ?auto_806226 ?auto_806231 ) ) ( not ( = ?auto_806226 ?auto_806232 ) ) ( not ( = ?auto_806226 ?auto_806233 ) ) ( not ( = ?auto_806226 ?auto_806234 ) ) ( not ( = ?auto_806226 ?auto_806235 ) ) ( not ( = ?auto_806226 ?auto_806236 ) ) ( not ( = ?auto_806226 ?auto_806237 ) ) ( not ( = ?auto_806226 ?auto_806238 ) ) ( not ( = ?auto_806226 ?auto_806239 ) ) ( not ( = ?auto_806226 ?auto_806240 ) ) ( not ( = ?auto_806226 ?auto_806241 ) ) ( not ( = ?auto_806227 ?auto_806228 ) ) ( not ( = ?auto_806227 ?auto_806229 ) ) ( not ( = ?auto_806227 ?auto_806230 ) ) ( not ( = ?auto_806227 ?auto_806231 ) ) ( not ( = ?auto_806227 ?auto_806232 ) ) ( not ( = ?auto_806227 ?auto_806233 ) ) ( not ( = ?auto_806227 ?auto_806234 ) ) ( not ( = ?auto_806227 ?auto_806235 ) ) ( not ( = ?auto_806227 ?auto_806236 ) ) ( not ( = ?auto_806227 ?auto_806237 ) ) ( not ( = ?auto_806227 ?auto_806238 ) ) ( not ( = ?auto_806227 ?auto_806239 ) ) ( not ( = ?auto_806227 ?auto_806240 ) ) ( not ( = ?auto_806227 ?auto_806241 ) ) ( not ( = ?auto_806228 ?auto_806229 ) ) ( not ( = ?auto_806228 ?auto_806230 ) ) ( not ( = ?auto_806228 ?auto_806231 ) ) ( not ( = ?auto_806228 ?auto_806232 ) ) ( not ( = ?auto_806228 ?auto_806233 ) ) ( not ( = ?auto_806228 ?auto_806234 ) ) ( not ( = ?auto_806228 ?auto_806235 ) ) ( not ( = ?auto_806228 ?auto_806236 ) ) ( not ( = ?auto_806228 ?auto_806237 ) ) ( not ( = ?auto_806228 ?auto_806238 ) ) ( not ( = ?auto_806228 ?auto_806239 ) ) ( not ( = ?auto_806228 ?auto_806240 ) ) ( not ( = ?auto_806228 ?auto_806241 ) ) ( not ( = ?auto_806229 ?auto_806230 ) ) ( not ( = ?auto_806229 ?auto_806231 ) ) ( not ( = ?auto_806229 ?auto_806232 ) ) ( not ( = ?auto_806229 ?auto_806233 ) ) ( not ( = ?auto_806229 ?auto_806234 ) ) ( not ( = ?auto_806229 ?auto_806235 ) ) ( not ( = ?auto_806229 ?auto_806236 ) ) ( not ( = ?auto_806229 ?auto_806237 ) ) ( not ( = ?auto_806229 ?auto_806238 ) ) ( not ( = ?auto_806229 ?auto_806239 ) ) ( not ( = ?auto_806229 ?auto_806240 ) ) ( not ( = ?auto_806229 ?auto_806241 ) ) ( not ( = ?auto_806230 ?auto_806231 ) ) ( not ( = ?auto_806230 ?auto_806232 ) ) ( not ( = ?auto_806230 ?auto_806233 ) ) ( not ( = ?auto_806230 ?auto_806234 ) ) ( not ( = ?auto_806230 ?auto_806235 ) ) ( not ( = ?auto_806230 ?auto_806236 ) ) ( not ( = ?auto_806230 ?auto_806237 ) ) ( not ( = ?auto_806230 ?auto_806238 ) ) ( not ( = ?auto_806230 ?auto_806239 ) ) ( not ( = ?auto_806230 ?auto_806240 ) ) ( not ( = ?auto_806230 ?auto_806241 ) ) ( not ( = ?auto_806231 ?auto_806232 ) ) ( not ( = ?auto_806231 ?auto_806233 ) ) ( not ( = ?auto_806231 ?auto_806234 ) ) ( not ( = ?auto_806231 ?auto_806235 ) ) ( not ( = ?auto_806231 ?auto_806236 ) ) ( not ( = ?auto_806231 ?auto_806237 ) ) ( not ( = ?auto_806231 ?auto_806238 ) ) ( not ( = ?auto_806231 ?auto_806239 ) ) ( not ( = ?auto_806231 ?auto_806240 ) ) ( not ( = ?auto_806231 ?auto_806241 ) ) ( not ( = ?auto_806232 ?auto_806233 ) ) ( not ( = ?auto_806232 ?auto_806234 ) ) ( not ( = ?auto_806232 ?auto_806235 ) ) ( not ( = ?auto_806232 ?auto_806236 ) ) ( not ( = ?auto_806232 ?auto_806237 ) ) ( not ( = ?auto_806232 ?auto_806238 ) ) ( not ( = ?auto_806232 ?auto_806239 ) ) ( not ( = ?auto_806232 ?auto_806240 ) ) ( not ( = ?auto_806232 ?auto_806241 ) ) ( not ( = ?auto_806233 ?auto_806234 ) ) ( not ( = ?auto_806233 ?auto_806235 ) ) ( not ( = ?auto_806233 ?auto_806236 ) ) ( not ( = ?auto_806233 ?auto_806237 ) ) ( not ( = ?auto_806233 ?auto_806238 ) ) ( not ( = ?auto_806233 ?auto_806239 ) ) ( not ( = ?auto_806233 ?auto_806240 ) ) ( not ( = ?auto_806233 ?auto_806241 ) ) ( not ( = ?auto_806234 ?auto_806235 ) ) ( not ( = ?auto_806234 ?auto_806236 ) ) ( not ( = ?auto_806234 ?auto_806237 ) ) ( not ( = ?auto_806234 ?auto_806238 ) ) ( not ( = ?auto_806234 ?auto_806239 ) ) ( not ( = ?auto_806234 ?auto_806240 ) ) ( not ( = ?auto_806234 ?auto_806241 ) ) ( not ( = ?auto_806235 ?auto_806236 ) ) ( not ( = ?auto_806235 ?auto_806237 ) ) ( not ( = ?auto_806235 ?auto_806238 ) ) ( not ( = ?auto_806235 ?auto_806239 ) ) ( not ( = ?auto_806235 ?auto_806240 ) ) ( not ( = ?auto_806235 ?auto_806241 ) ) ( not ( = ?auto_806236 ?auto_806237 ) ) ( not ( = ?auto_806236 ?auto_806238 ) ) ( not ( = ?auto_806236 ?auto_806239 ) ) ( not ( = ?auto_806236 ?auto_806240 ) ) ( not ( = ?auto_806236 ?auto_806241 ) ) ( not ( = ?auto_806237 ?auto_806238 ) ) ( not ( = ?auto_806237 ?auto_806239 ) ) ( not ( = ?auto_806237 ?auto_806240 ) ) ( not ( = ?auto_806237 ?auto_806241 ) ) ( not ( = ?auto_806238 ?auto_806239 ) ) ( not ( = ?auto_806238 ?auto_806240 ) ) ( not ( = ?auto_806238 ?auto_806241 ) ) ( not ( = ?auto_806239 ?auto_806240 ) ) ( not ( = ?auto_806239 ?auto_806241 ) ) ( not ( = ?auto_806240 ?auto_806241 ) ) ( ON ?auto_806239 ?auto_806240 ) ( ON ?auto_806238 ?auto_806239 ) ( ON ?auto_806237 ?auto_806238 ) ( ON ?auto_806236 ?auto_806237 ) ( ON ?auto_806235 ?auto_806236 ) ( ON ?auto_806234 ?auto_806235 ) ( ON ?auto_806233 ?auto_806234 ) ( ON ?auto_806232 ?auto_806233 ) ( ON ?auto_806231 ?auto_806232 ) ( ON ?auto_806230 ?auto_806231 ) ( CLEAR ?auto_806228 ) ( ON ?auto_806229 ?auto_806230 ) ( CLEAR ?auto_806229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_806226 ?auto_806227 ?auto_806228 ?auto_806229 )
      ( MAKE-15PILE ?auto_806226 ?auto_806227 ?auto_806228 ?auto_806229 ?auto_806230 ?auto_806231 ?auto_806232 ?auto_806233 ?auto_806234 ?auto_806235 ?auto_806236 ?auto_806237 ?auto_806238 ?auto_806239 ?auto_806240 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806288 - BLOCK
      ?auto_806289 - BLOCK
      ?auto_806290 - BLOCK
      ?auto_806291 - BLOCK
      ?auto_806292 - BLOCK
      ?auto_806293 - BLOCK
      ?auto_806294 - BLOCK
      ?auto_806295 - BLOCK
      ?auto_806296 - BLOCK
      ?auto_806297 - BLOCK
      ?auto_806298 - BLOCK
      ?auto_806299 - BLOCK
      ?auto_806300 - BLOCK
      ?auto_806301 - BLOCK
      ?auto_806302 - BLOCK
    )
    :vars
    (
      ?auto_806303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806302 ?auto_806303 ) ( ON-TABLE ?auto_806288 ) ( ON ?auto_806289 ?auto_806288 ) ( not ( = ?auto_806288 ?auto_806289 ) ) ( not ( = ?auto_806288 ?auto_806290 ) ) ( not ( = ?auto_806288 ?auto_806291 ) ) ( not ( = ?auto_806288 ?auto_806292 ) ) ( not ( = ?auto_806288 ?auto_806293 ) ) ( not ( = ?auto_806288 ?auto_806294 ) ) ( not ( = ?auto_806288 ?auto_806295 ) ) ( not ( = ?auto_806288 ?auto_806296 ) ) ( not ( = ?auto_806288 ?auto_806297 ) ) ( not ( = ?auto_806288 ?auto_806298 ) ) ( not ( = ?auto_806288 ?auto_806299 ) ) ( not ( = ?auto_806288 ?auto_806300 ) ) ( not ( = ?auto_806288 ?auto_806301 ) ) ( not ( = ?auto_806288 ?auto_806302 ) ) ( not ( = ?auto_806288 ?auto_806303 ) ) ( not ( = ?auto_806289 ?auto_806290 ) ) ( not ( = ?auto_806289 ?auto_806291 ) ) ( not ( = ?auto_806289 ?auto_806292 ) ) ( not ( = ?auto_806289 ?auto_806293 ) ) ( not ( = ?auto_806289 ?auto_806294 ) ) ( not ( = ?auto_806289 ?auto_806295 ) ) ( not ( = ?auto_806289 ?auto_806296 ) ) ( not ( = ?auto_806289 ?auto_806297 ) ) ( not ( = ?auto_806289 ?auto_806298 ) ) ( not ( = ?auto_806289 ?auto_806299 ) ) ( not ( = ?auto_806289 ?auto_806300 ) ) ( not ( = ?auto_806289 ?auto_806301 ) ) ( not ( = ?auto_806289 ?auto_806302 ) ) ( not ( = ?auto_806289 ?auto_806303 ) ) ( not ( = ?auto_806290 ?auto_806291 ) ) ( not ( = ?auto_806290 ?auto_806292 ) ) ( not ( = ?auto_806290 ?auto_806293 ) ) ( not ( = ?auto_806290 ?auto_806294 ) ) ( not ( = ?auto_806290 ?auto_806295 ) ) ( not ( = ?auto_806290 ?auto_806296 ) ) ( not ( = ?auto_806290 ?auto_806297 ) ) ( not ( = ?auto_806290 ?auto_806298 ) ) ( not ( = ?auto_806290 ?auto_806299 ) ) ( not ( = ?auto_806290 ?auto_806300 ) ) ( not ( = ?auto_806290 ?auto_806301 ) ) ( not ( = ?auto_806290 ?auto_806302 ) ) ( not ( = ?auto_806290 ?auto_806303 ) ) ( not ( = ?auto_806291 ?auto_806292 ) ) ( not ( = ?auto_806291 ?auto_806293 ) ) ( not ( = ?auto_806291 ?auto_806294 ) ) ( not ( = ?auto_806291 ?auto_806295 ) ) ( not ( = ?auto_806291 ?auto_806296 ) ) ( not ( = ?auto_806291 ?auto_806297 ) ) ( not ( = ?auto_806291 ?auto_806298 ) ) ( not ( = ?auto_806291 ?auto_806299 ) ) ( not ( = ?auto_806291 ?auto_806300 ) ) ( not ( = ?auto_806291 ?auto_806301 ) ) ( not ( = ?auto_806291 ?auto_806302 ) ) ( not ( = ?auto_806291 ?auto_806303 ) ) ( not ( = ?auto_806292 ?auto_806293 ) ) ( not ( = ?auto_806292 ?auto_806294 ) ) ( not ( = ?auto_806292 ?auto_806295 ) ) ( not ( = ?auto_806292 ?auto_806296 ) ) ( not ( = ?auto_806292 ?auto_806297 ) ) ( not ( = ?auto_806292 ?auto_806298 ) ) ( not ( = ?auto_806292 ?auto_806299 ) ) ( not ( = ?auto_806292 ?auto_806300 ) ) ( not ( = ?auto_806292 ?auto_806301 ) ) ( not ( = ?auto_806292 ?auto_806302 ) ) ( not ( = ?auto_806292 ?auto_806303 ) ) ( not ( = ?auto_806293 ?auto_806294 ) ) ( not ( = ?auto_806293 ?auto_806295 ) ) ( not ( = ?auto_806293 ?auto_806296 ) ) ( not ( = ?auto_806293 ?auto_806297 ) ) ( not ( = ?auto_806293 ?auto_806298 ) ) ( not ( = ?auto_806293 ?auto_806299 ) ) ( not ( = ?auto_806293 ?auto_806300 ) ) ( not ( = ?auto_806293 ?auto_806301 ) ) ( not ( = ?auto_806293 ?auto_806302 ) ) ( not ( = ?auto_806293 ?auto_806303 ) ) ( not ( = ?auto_806294 ?auto_806295 ) ) ( not ( = ?auto_806294 ?auto_806296 ) ) ( not ( = ?auto_806294 ?auto_806297 ) ) ( not ( = ?auto_806294 ?auto_806298 ) ) ( not ( = ?auto_806294 ?auto_806299 ) ) ( not ( = ?auto_806294 ?auto_806300 ) ) ( not ( = ?auto_806294 ?auto_806301 ) ) ( not ( = ?auto_806294 ?auto_806302 ) ) ( not ( = ?auto_806294 ?auto_806303 ) ) ( not ( = ?auto_806295 ?auto_806296 ) ) ( not ( = ?auto_806295 ?auto_806297 ) ) ( not ( = ?auto_806295 ?auto_806298 ) ) ( not ( = ?auto_806295 ?auto_806299 ) ) ( not ( = ?auto_806295 ?auto_806300 ) ) ( not ( = ?auto_806295 ?auto_806301 ) ) ( not ( = ?auto_806295 ?auto_806302 ) ) ( not ( = ?auto_806295 ?auto_806303 ) ) ( not ( = ?auto_806296 ?auto_806297 ) ) ( not ( = ?auto_806296 ?auto_806298 ) ) ( not ( = ?auto_806296 ?auto_806299 ) ) ( not ( = ?auto_806296 ?auto_806300 ) ) ( not ( = ?auto_806296 ?auto_806301 ) ) ( not ( = ?auto_806296 ?auto_806302 ) ) ( not ( = ?auto_806296 ?auto_806303 ) ) ( not ( = ?auto_806297 ?auto_806298 ) ) ( not ( = ?auto_806297 ?auto_806299 ) ) ( not ( = ?auto_806297 ?auto_806300 ) ) ( not ( = ?auto_806297 ?auto_806301 ) ) ( not ( = ?auto_806297 ?auto_806302 ) ) ( not ( = ?auto_806297 ?auto_806303 ) ) ( not ( = ?auto_806298 ?auto_806299 ) ) ( not ( = ?auto_806298 ?auto_806300 ) ) ( not ( = ?auto_806298 ?auto_806301 ) ) ( not ( = ?auto_806298 ?auto_806302 ) ) ( not ( = ?auto_806298 ?auto_806303 ) ) ( not ( = ?auto_806299 ?auto_806300 ) ) ( not ( = ?auto_806299 ?auto_806301 ) ) ( not ( = ?auto_806299 ?auto_806302 ) ) ( not ( = ?auto_806299 ?auto_806303 ) ) ( not ( = ?auto_806300 ?auto_806301 ) ) ( not ( = ?auto_806300 ?auto_806302 ) ) ( not ( = ?auto_806300 ?auto_806303 ) ) ( not ( = ?auto_806301 ?auto_806302 ) ) ( not ( = ?auto_806301 ?auto_806303 ) ) ( not ( = ?auto_806302 ?auto_806303 ) ) ( ON ?auto_806301 ?auto_806302 ) ( ON ?auto_806300 ?auto_806301 ) ( ON ?auto_806299 ?auto_806300 ) ( ON ?auto_806298 ?auto_806299 ) ( ON ?auto_806297 ?auto_806298 ) ( ON ?auto_806296 ?auto_806297 ) ( ON ?auto_806295 ?auto_806296 ) ( ON ?auto_806294 ?auto_806295 ) ( ON ?auto_806293 ?auto_806294 ) ( ON ?auto_806292 ?auto_806293 ) ( ON ?auto_806291 ?auto_806292 ) ( CLEAR ?auto_806289 ) ( ON ?auto_806290 ?auto_806291 ) ( CLEAR ?auto_806290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_806288 ?auto_806289 ?auto_806290 )
      ( MAKE-15PILE ?auto_806288 ?auto_806289 ?auto_806290 ?auto_806291 ?auto_806292 ?auto_806293 ?auto_806294 ?auto_806295 ?auto_806296 ?auto_806297 ?auto_806298 ?auto_806299 ?auto_806300 ?auto_806301 ?auto_806302 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806350 - BLOCK
      ?auto_806351 - BLOCK
      ?auto_806352 - BLOCK
      ?auto_806353 - BLOCK
      ?auto_806354 - BLOCK
      ?auto_806355 - BLOCK
      ?auto_806356 - BLOCK
      ?auto_806357 - BLOCK
      ?auto_806358 - BLOCK
      ?auto_806359 - BLOCK
      ?auto_806360 - BLOCK
      ?auto_806361 - BLOCK
      ?auto_806362 - BLOCK
      ?auto_806363 - BLOCK
      ?auto_806364 - BLOCK
    )
    :vars
    (
      ?auto_806365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806364 ?auto_806365 ) ( ON-TABLE ?auto_806350 ) ( not ( = ?auto_806350 ?auto_806351 ) ) ( not ( = ?auto_806350 ?auto_806352 ) ) ( not ( = ?auto_806350 ?auto_806353 ) ) ( not ( = ?auto_806350 ?auto_806354 ) ) ( not ( = ?auto_806350 ?auto_806355 ) ) ( not ( = ?auto_806350 ?auto_806356 ) ) ( not ( = ?auto_806350 ?auto_806357 ) ) ( not ( = ?auto_806350 ?auto_806358 ) ) ( not ( = ?auto_806350 ?auto_806359 ) ) ( not ( = ?auto_806350 ?auto_806360 ) ) ( not ( = ?auto_806350 ?auto_806361 ) ) ( not ( = ?auto_806350 ?auto_806362 ) ) ( not ( = ?auto_806350 ?auto_806363 ) ) ( not ( = ?auto_806350 ?auto_806364 ) ) ( not ( = ?auto_806350 ?auto_806365 ) ) ( not ( = ?auto_806351 ?auto_806352 ) ) ( not ( = ?auto_806351 ?auto_806353 ) ) ( not ( = ?auto_806351 ?auto_806354 ) ) ( not ( = ?auto_806351 ?auto_806355 ) ) ( not ( = ?auto_806351 ?auto_806356 ) ) ( not ( = ?auto_806351 ?auto_806357 ) ) ( not ( = ?auto_806351 ?auto_806358 ) ) ( not ( = ?auto_806351 ?auto_806359 ) ) ( not ( = ?auto_806351 ?auto_806360 ) ) ( not ( = ?auto_806351 ?auto_806361 ) ) ( not ( = ?auto_806351 ?auto_806362 ) ) ( not ( = ?auto_806351 ?auto_806363 ) ) ( not ( = ?auto_806351 ?auto_806364 ) ) ( not ( = ?auto_806351 ?auto_806365 ) ) ( not ( = ?auto_806352 ?auto_806353 ) ) ( not ( = ?auto_806352 ?auto_806354 ) ) ( not ( = ?auto_806352 ?auto_806355 ) ) ( not ( = ?auto_806352 ?auto_806356 ) ) ( not ( = ?auto_806352 ?auto_806357 ) ) ( not ( = ?auto_806352 ?auto_806358 ) ) ( not ( = ?auto_806352 ?auto_806359 ) ) ( not ( = ?auto_806352 ?auto_806360 ) ) ( not ( = ?auto_806352 ?auto_806361 ) ) ( not ( = ?auto_806352 ?auto_806362 ) ) ( not ( = ?auto_806352 ?auto_806363 ) ) ( not ( = ?auto_806352 ?auto_806364 ) ) ( not ( = ?auto_806352 ?auto_806365 ) ) ( not ( = ?auto_806353 ?auto_806354 ) ) ( not ( = ?auto_806353 ?auto_806355 ) ) ( not ( = ?auto_806353 ?auto_806356 ) ) ( not ( = ?auto_806353 ?auto_806357 ) ) ( not ( = ?auto_806353 ?auto_806358 ) ) ( not ( = ?auto_806353 ?auto_806359 ) ) ( not ( = ?auto_806353 ?auto_806360 ) ) ( not ( = ?auto_806353 ?auto_806361 ) ) ( not ( = ?auto_806353 ?auto_806362 ) ) ( not ( = ?auto_806353 ?auto_806363 ) ) ( not ( = ?auto_806353 ?auto_806364 ) ) ( not ( = ?auto_806353 ?auto_806365 ) ) ( not ( = ?auto_806354 ?auto_806355 ) ) ( not ( = ?auto_806354 ?auto_806356 ) ) ( not ( = ?auto_806354 ?auto_806357 ) ) ( not ( = ?auto_806354 ?auto_806358 ) ) ( not ( = ?auto_806354 ?auto_806359 ) ) ( not ( = ?auto_806354 ?auto_806360 ) ) ( not ( = ?auto_806354 ?auto_806361 ) ) ( not ( = ?auto_806354 ?auto_806362 ) ) ( not ( = ?auto_806354 ?auto_806363 ) ) ( not ( = ?auto_806354 ?auto_806364 ) ) ( not ( = ?auto_806354 ?auto_806365 ) ) ( not ( = ?auto_806355 ?auto_806356 ) ) ( not ( = ?auto_806355 ?auto_806357 ) ) ( not ( = ?auto_806355 ?auto_806358 ) ) ( not ( = ?auto_806355 ?auto_806359 ) ) ( not ( = ?auto_806355 ?auto_806360 ) ) ( not ( = ?auto_806355 ?auto_806361 ) ) ( not ( = ?auto_806355 ?auto_806362 ) ) ( not ( = ?auto_806355 ?auto_806363 ) ) ( not ( = ?auto_806355 ?auto_806364 ) ) ( not ( = ?auto_806355 ?auto_806365 ) ) ( not ( = ?auto_806356 ?auto_806357 ) ) ( not ( = ?auto_806356 ?auto_806358 ) ) ( not ( = ?auto_806356 ?auto_806359 ) ) ( not ( = ?auto_806356 ?auto_806360 ) ) ( not ( = ?auto_806356 ?auto_806361 ) ) ( not ( = ?auto_806356 ?auto_806362 ) ) ( not ( = ?auto_806356 ?auto_806363 ) ) ( not ( = ?auto_806356 ?auto_806364 ) ) ( not ( = ?auto_806356 ?auto_806365 ) ) ( not ( = ?auto_806357 ?auto_806358 ) ) ( not ( = ?auto_806357 ?auto_806359 ) ) ( not ( = ?auto_806357 ?auto_806360 ) ) ( not ( = ?auto_806357 ?auto_806361 ) ) ( not ( = ?auto_806357 ?auto_806362 ) ) ( not ( = ?auto_806357 ?auto_806363 ) ) ( not ( = ?auto_806357 ?auto_806364 ) ) ( not ( = ?auto_806357 ?auto_806365 ) ) ( not ( = ?auto_806358 ?auto_806359 ) ) ( not ( = ?auto_806358 ?auto_806360 ) ) ( not ( = ?auto_806358 ?auto_806361 ) ) ( not ( = ?auto_806358 ?auto_806362 ) ) ( not ( = ?auto_806358 ?auto_806363 ) ) ( not ( = ?auto_806358 ?auto_806364 ) ) ( not ( = ?auto_806358 ?auto_806365 ) ) ( not ( = ?auto_806359 ?auto_806360 ) ) ( not ( = ?auto_806359 ?auto_806361 ) ) ( not ( = ?auto_806359 ?auto_806362 ) ) ( not ( = ?auto_806359 ?auto_806363 ) ) ( not ( = ?auto_806359 ?auto_806364 ) ) ( not ( = ?auto_806359 ?auto_806365 ) ) ( not ( = ?auto_806360 ?auto_806361 ) ) ( not ( = ?auto_806360 ?auto_806362 ) ) ( not ( = ?auto_806360 ?auto_806363 ) ) ( not ( = ?auto_806360 ?auto_806364 ) ) ( not ( = ?auto_806360 ?auto_806365 ) ) ( not ( = ?auto_806361 ?auto_806362 ) ) ( not ( = ?auto_806361 ?auto_806363 ) ) ( not ( = ?auto_806361 ?auto_806364 ) ) ( not ( = ?auto_806361 ?auto_806365 ) ) ( not ( = ?auto_806362 ?auto_806363 ) ) ( not ( = ?auto_806362 ?auto_806364 ) ) ( not ( = ?auto_806362 ?auto_806365 ) ) ( not ( = ?auto_806363 ?auto_806364 ) ) ( not ( = ?auto_806363 ?auto_806365 ) ) ( not ( = ?auto_806364 ?auto_806365 ) ) ( ON ?auto_806363 ?auto_806364 ) ( ON ?auto_806362 ?auto_806363 ) ( ON ?auto_806361 ?auto_806362 ) ( ON ?auto_806360 ?auto_806361 ) ( ON ?auto_806359 ?auto_806360 ) ( ON ?auto_806358 ?auto_806359 ) ( ON ?auto_806357 ?auto_806358 ) ( ON ?auto_806356 ?auto_806357 ) ( ON ?auto_806355 ?auto_806356 ) ( ON ?auto_806354 ?auto_806355 ) ( ON ?auto_806353 ?auto_806354 ) ( ON ?auto_806352 ?auto_806353 ) ( CLEAR ?auto_806350 ) ( ON ?auto_806351 ?auto_806352 ) ( CLEAR ?auto_806351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_806350 ?auto_806351 )
      ( MAKE-15PILE ?auto_806350 ?auto_806351 ?auto_806352 ?auto_806353 ?auto_806354 ?auto_806355 ?auto_806356 ?auto_806357 ?auto_806358 ?auto_806359 ?auto_806360 ?auto_806361 ?auto_806362 ?auto_806363 ?auto_806364 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_806412 - BLOCK
      ?auto_806413 - BLOCK
      ?auto_806414 - BLOCK
      ?auto_806415 - BLOCK
      ?auto_806416 - BLOCK
      ?auto_806417 - BLOCK
      ?auto_806418 - BLOCK
      ?auto_806419 - BLOCK
      ?auto_806420 - BLOCK
      ?auto_806421 - BLOCK
      ?auto_806422 - BLOCK
      ?auto_806423 - BLOCK
      ?auto_806424 - BLOCK
      ?auto_806425 - BLOCK
      ?auto_806426 - BLOCK
    )
    :vars
    (
      ?auto_806427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806426 ?auto_806427 ) ( not ( = ?auto_806412 ?auto_806413 ) ) ( not ( = ?auto_806412 ?auto_806414 ) ) ( not ( = ?auto_806412 ?auto_806415 ) ) ( not ( = ?auto_806412 ?auto_806416 ) ) ( not ( = ?auto_806412 ?auto_806417 ) ) ( not ( = ?auto_806412 ?auto_806418 ) ) ( not ( = ?auto_806412 ?auto_806419 ) ) ( not ( = ?auto_806412 ?auto_806420 ) ) ( not ( = ?auto_806412 ?auto_806421 ) ) ( not ( = ?auto_806412 ?auto_806422 ) ) ( not ( = ?auto_806412 ?auto_806423 ) ) ( not ( = ?auto_806412 ?auto_806424 ) ) ( not ( = ?auto_806412 ?auto_806425 ) ) ( not ( = ?auto_806412 ?auto_806426 ) ) ( not ( = ?auto_806412 ?auto_806427 ) ) ( not ( = ?auto_806413 ?auto_806414 ) ) ( not ( = ?auto_806413 ?auto_806415 ) ) ( not ( = ?auto_806413 ?auto_806416 ) ) ( not ( = ?auto_806413 ?auto_806417 ) ) ( not ( = ?auto_806413 ?auto_806418 ) ) ( not ( = ?auto_806413 ?auto_806419 ) ) ( not ( = ?auto_806413 ?auto_806420 ) ) ( not ( = ?auto_806413 ?auto_806421 ) ) ( not ( = ?auto_806413 ?auto_806422 ) ) ( not ( = ?auto_806413 ?auto_806423 ) ) ( not ( = ?auto_806413 ?auto_806424 ) ) ( not ( = ?auto_806413 ?auto_806425 ) ) ( not ( = ?auto_806413 ?auto_806426 ) ) ( not ( = ?auto_806413 ?auto_806427 ) ) ( not ( = ?auto_806414 ?auto_806415 ) ) ( not ( = ?auto_806414 ?auto_806416 ) ) ( not ( = ?auto_806414 ?auto_806417 ) ) ( not ( = ?auto_806414 ?auto_806418 ) ) ( not ( = ?auto_806414 ?auto_806419 ) ) ( not ( = ?auto_806414 ?auto_806420 ) ) ( not ( = ?auto_806414 ?auto_806421 ) ) ( not ( = ?auto_806414 ?auto_806422 ) ) ( not ( = ?auto_806414 ?auto_806423 ) ) ( not ( = ?auto_806414 ?auto_806424 ) ) ( not ( = ?auto_806414 ?auto_806425 ) ) ( not ( = ?auto_806414 ?auto_806426 ) ) ( not ( = ?auto_806414 ?auto_806427 ) ) ( not ( = ?auto_806415 ?auto_806416 ) ) ( not ( = ?auto_806415 ?auto_806417 ) ) ( not ( = ?auto_806415 ?auto_806418 ) ) ( not ( = ?auto_806415 ?auto_806419 ) ) ( not ( = ?auto_806415 ?auto_806420 ) ) ( not ( = ?auto_806415 ?auto_806421 ) ) ( not ( = ?auto_806415 ?auto_806422 ) ) ( not ( = ?auto_806415 ?auto_806423 ) ) ( not ( = ?auto_806415 ?auto_806424 ) ) ( not ( = ?auto_806415 ?auto_806425 ) ) ( not ( = ?auto_806415 ?auto_806426 ) ) ( not ( = ?auto_806415 ?auto_806427 ) ) ( not ( = ?auto_806416 ?auto_806417 ) ) ( not ( = ?auto_806416 ?auto_806418 ) ) ( not ( = ?auto_806416 ?auto_806419 ) ) ( not ( = ?auto_806416 ?auto_806420 ) ) ( not ( = ?auto_806416 ?auto_806421 ) ) ( not ( = ?auto_806416 ?auto_806422 ) ) ( not ( = ?auto_806416 ?auto_806423 ) ) ( not ( = ?auto_806416 ?auto_806424 ) ) ( not ( = ?auto_806416 ?auto_806425 ) ) ( not ( = ?auto_806416 ?auto_806426 ) ) ( not ( = ?auto_806416 ?auto_806427 ) ) ( not ( = ?auto_806417 ?auto_806418 ) ) ( not ( = ?auto_806417 ?auto_806419 ) ) ( not ( = ?auto_806417 ?auto_806420 ) ) ( not ( = ?auto_806417 ?auto_806421 ) ) ( not ( = ?auto_806417 ?auto_806422 ) ) ( not ( = ?auto_806417 ?auto_806423 ) ) ( not ( = ?auto_806417 ?auto_806424 ) ) ( not ( = ?auto_806417 ?auto_806425 ) ) ( not ( = ?auto_806417 ?auto_806426 ) ) ( not ( = ?auto_806417 ?auto_806427 ) ) ( not ( = ?auto_806418 ?auto_806419 ) ) ( not ( = ?auto_806418 ?auto_806420 ) ) ( not ( = ?auto_806418 ?auto_806421 ) ) ( not ( = ?auto_806418 ?auto_806422 ) ) ( not ( = ?auto_806418 ?auto_806423 ) ) ( not ( = ?auto_806418 ?auto_806424 ) ) ( not ( = ?auto_806418 ?auto_806425 ) ) ( not ( = ?auto_806418 ?auto_806426 ) ) ( not ( = ?auto_806418 ?auto_806427 ) ) ( not ( = ?auto_806419 ?auto_806420 ) ) ( not ( = ?auto_806419 ?auto_806421 ) ) ( not ( = ?auto_806419 ?auto_806422 ) ) ( not ( = ?auto_806419 ?auto_806423 ) ) ( not ( = ?auto_806419 ?auto_806424 ) ) ( not ( = ?auto_806419 ?auto_806425 ) ) ( not ( = ?auto_806419 ?auto_806426 ) ) ( not ( = ?auto_806419 ?auto_806427 ) ) ( not ( = ?auto_806420 ?auto_806421 ) ) ( not ( = ?auto_806420 ?auto_806422 ) ) ( not ( = ?auto_806420 ?auto_806423 ) ) ( not ( = ?auto_806420 ?auto_806424 ) ) ( not ( = ?auto_806420 ?auto_806425 ) ) ( not ( = ?auto_806420 ?auto_806426 ) ) ( not ( = ?auto_806420 ?auto_806427 ) ) ( not ( = ?auto_806421 ?auto_806422 ) ) ( not ( = ?auto_806421 ?auto_806423 ) ) ( not ( = ?auto_806421 ?auto_806424 ) ) ( not ( = ?auto_806421 ?auto_806425 ) ) ( not ( = ?auto_806421 ?auto_806426 ) ) ( not ( = ?auto_806421 ?auto_806427 ) ) ( not ( = ?auto_806422 ?auto_806423 ) ) ( not ( = ?auto_806422 ?auto_806424 ) ) ( not ( = ?auto_806422 ?auto_806425 ) ) ( not ( = ?auto_806422 ?auto_806426 ) ) ( not ( = ?auto_806422 ?auto_806427 ) ) ( not ( = ?auto_806423 ?auto_806424 ) ) ( not ( = ?auto_806423 ?auto_806425 ) ) ( not ( = ?auto_806423 ?auto_806426 ) ) ( not ( = ?auto_806423 ?auto_806427 ) ) ( not ( = ?auto_806424 ?auto_806425 ) ) ( not ( = ?auto_806424 ?auto_806426 ) ) ( not ( = ?auto_806424 ?auto_806427 ) ) ( not ( = ?auto_806425 ?auto_806426 ) ) ( not ( = ?auto_806425 ?auto_806427 ) ) ( not ( = ?auto_806426 ?auto_806427 ) ) ( ON ?auto_806425 ?auto_806426 ) ( ON ?auto_806424 ?auto_806425 ) ( ON ?auto_806423 ?auto_806424 ) ( ON ?auto_806422 ?auto_806423 ) ( ON ?auto_806421 ?auto_806422 ) ( ON ?auto_806420 ?auto_806421 ) ( ON ?auto_806419 ?auto_806420 ) ( ON ?auto_806418 ?auto_806419 ) ( ON ?auto_806417 ?auto_806418 ) ( ON ?auto_806416 ?auto_806417 ) ( ON ?auto_806415 ?auto_806416 ) ( ON ?auto_806414 ?auto_806415 ) ( ON ?auto_806413 ?auto_806414 ) ( ON ?auto_806412 ?auto_806413 ) ( CLEAR ?auto_806412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_806412 )
      ( MAKE-15PILE ?auto_806412 ?auto_806413 ?auto_806414 ?auto_806415 ?auto_806416 ?auto_806417 ?auto_806418 ?auto_806419 ?auto_806420 ?auto_806421 ?auto_806422 ?auto_806423 ?auto_806424 ?auto_806425 ?auto_806426 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806475 - BLOCK
      ?auto_806476 - BLOCK
      ?auto_806477 - BLOCK
      ?auto_806478 - BLOCK
      ?auto_806479 - BLOCK
      ?auto_806480 - BLOCK
      ?auto_806481 - BLOCK
      ?auto_806482 - BLOCK
      ?auto_806483 - BLOCK
      ?auto_806484 - BLOCK
      ?auto_806485 - BLOCK
      ?auto_806486 - BLOCK
      ?auto_806487 - BLOCK
      ?auto_806488 - BLOCK
      ?auto_806489 - BLOCK
      ?auto_806490 - BLOCK
    )
    :vars
    (
      ?auto_806491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_806489 ) ( ON ?auto_806490 ?auto_806491 ) ( CLEAR ?auto_806490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_806475 ) ( ON ?auto_806476 ?auto_806475 ) ( ON ?auto_806477 ?auto_806476 ) ( ON ?auto_806478 ?auto_806477 ) ( ON ?auto_806479 ?auto_806478 ) ( ON ?auto_806480 ?auto_806479 ) ( ON ?auto_806481 ?auto_806480 ) ( ON ?auto_806482 ?auto_806481 ) ( ON ?auto_806483 ?auto_806482 ) ( ON ?auto_806484 ?auto_806483 ) ( ON ?auto_806485 ?auto_806484 ) ( ON ?auto_806486 ?auto_806485 ) ( ON ?auto_806487 ?auto_806486 ) ( ON ?auto_806488 ?auto_806487 ) ( ON ?auto_806489 ?auto_806488 ) ( not ( = ?auto_806475 ?auto_806476 ) ) ( not ( = ?auto_806475 ?auto_806477 ) ) ( not ( = ?auto_806475 ?auto_806478 ) ) ( not ( = ?auto_806475 ?auto_806479 ) ) ( not ( = ?auto_806475 ?auto_806480 ) ) ( not ( = ?auto_806475 ?auto_806481 ) ) ( not ( = ?auto_806475 ?auto_806482 ) ) ( not ( = ?auto_806475 ?auto_806483 ) ) ( not ( = ?auto_806475 ?auto_806484 ) ) ( not ( = ?auto_806475 ?auto_806485 ) ) ( not ( = ?auto_806475 ?auto_806486 ) ) ( not ( = ?auto_806475 ?auto_806487 ) ) ( not ( = ?auto_806475 ?auto_806488 ) ) ( not ( = ?auto_806475 ?auto_806489 ) ) ( not ( = ?auto_806475 ?auto_806490 ) ) ( not ( = ?auto_806475 ?auto_806491 ) ) ( not ( = ?auto_806476 ?auto_806477 ) ) ( not ( = ?auto_806476 ?auto_806478 ) ) ( not ( = ?auto_806476 ?auto_806479 ) ) ( not ( = ?auto_806476 ?auto_806480 ) ) ( not ( = ?auto_806476 ?auto_806481 ) ) ( not ( = ?auto_806476 ?auto_806482 ) ) ( not ( = ?auto_806476 ?auto_806483 ) ) ( not ( = ?auto_806476 ?auto_806484 ) ) ( not ( = ?auto_806476 ?auto_806485 ) ) ( not ( = ?auto_806476 ?auto_806486 ) ) ( not ( = ?auto_806476 ?auto_806487 ) ) ( not ( = ?auto_806476 ?auto_806488 ) ) ( not ( = ?auto_806476 ?auto_806489 ) ) ( not ( = ?auto_806476 ?auto_806490 ) ) ( not ( = ?auto_806476 ?auto_806491 ) ) ( not ( = ?auto_806477 ?auto_806478 ) ) ( not ( = ?auto_806477 ?auto_806479 ) ) ( not ( = ?auto_806477 ?auto_806480 ) ) ( not ( = ?auto_806477 ?auto_806481 ) ) ( not ( = ?auto_806477 ?auto_806482 ) ) ( not ( = ?auto_806477 ?auto_806483 ) ) ( not ( = ?auto_806477 ?auto_806484 ) ) ( not ( = ?auto_806477 ?auto_806485 ) ) ( not ( = ?auto_806477 ?auto_806486 ) ) ( not ( = ?auto_806477 ?auto_806487 ) ) ( not ( = ?auto_806477 ?auto_806488 ) ) ( not ( = ?auto_806477 ?auto_806489 ) ) ( not ( = ?auto_806477 ?auto_806490 ) ) ( not ( = ?auto_806477 ?auto_806491 ) ) ( not ( = ?auto_806478 ?auto_806479 ) ) ( not ( = ?auto_806478 ?auto_806480 ) ) ( not ( = ?auto_806478 ?auto_806481 ) ) ( not ( = ?auto_806478 ?auto_806482 ) ) ( not ( = ?auto_806478 ?auto_806483 ) ) ( not ( = ?auto_806478 ?auto_806484 ) ) ( not ( = ?auto_806478 ?auto_806485 ) ) ( not ( = ?auto_806478 ?auto_806486 ) ) ( not ( = ?auto_806478 ?auto_806487 ) ) ( not ( = ?auto_806478 ?auto_806488 ) ) ( not ( = ?auto_806478 ?auto_806489 ) ) ( not ( = ?auto_806478 ?auto_806490 ) ) ( not ( = ?auto_806478 ?auto_806491 ) ) ( not ( = ?auto_806479 ?auto_806480 ) ) ( not ( = ?auto_806479 ?auto_806481 ) ) ( not ( = ?auto_806479 ?auto_806482 ) ) ( not ( = ?auto_806479 ?auto_806483 ) ) ( not ( = ?auto_806479 ?auto_806484 ) ) ( not ( = ?auto_806479 ?auto_806485 ) ) ( not ( = ?auto_806479 ?auto_806486 ) ) ( not ( = ?auto_806479 ?auto_806487 ) ) ( not ( = ?auto_806479 ?auto_806488 ) ) ( not ( = ?auto_806479 ?auto_806489 ) ) ( not ( = ?auto_806479 ?auto_806490 ) ) ( not ( = ?auto_806479 ?auto_806491 ) ) ( not ( = ?auto_806480 ?auto_806481 ) ) ( not ( = ?auto_806480 ?auto_806482 ) ) ( not ( = ?auto_806480 ?auto_806483 ) ) ( not ( = ?auto_806480 ?auto_806484 ) ) ( not ( = ?auto_806480 ?auto_806485 ) ) ( not ( = ?auto_806480 ?auto_806486 ) ) ( not ( = ?auto_806480 ?auto_806487 ) ) ( not ( = ?auto_806480 ?auto_806488 ) ) ( not ( = ?auto_806480 ?auto_806489 ) ) ( not ( = ?auto_806480 ?auto_806490 ) ) ( not ( = ?auto_806480 ?auto_806491 ) ) ( not ( = ?auto_806481 ?auto_806482 ) ) ( not ( = ?auto_806481 ?auto_806483 ) ) ( not ( = ?auto_806481 ?auto_806484 ) ) ( not ( = ?auto_806481 ?auto_806485 ) ) ( not ( = ?auto_806481 ?auto_806486 ) ) ( not ( = ?auto_806481 ?auto_806487 ) ) ( not ( = ?auto_806481 ?auto_806488 ) ) ( not ( = ?auto_806481 ?auto_806489 ) ) ( not ( = ?auto_806481 ?auto_806490 ) ) ( not ( = ?auto_806481 ?auto_806491 ) ) ( not ( = ?auto_806482 ?auto_806483 ) ) ( not ( = ?auto_806482 ?auto_806484 ) ) ( not ( = ?auto_806482 ?auto_806485 ) ) ( not ( = ?auto_806482 ?auto_806486 ) ) ( not ( = ?auto_806482 ?auto_806487 ) ) ( not ( = ?auto_806482 ?auto_806488 ) ) ( not ( = ?auto_806482 ?auto_806489 ) ) ( not ( = ?auto_806482 ?auto_806490 ) ) ( not ( = ?auto_806482 ?auto_806491 ) ) ( not ( = ?auto_806483 ?auto_806484 ) ) ( not ( = ?auto_806483 ?auto_806485 ) ) ( not ( = ?auto_806483 ?auto_806486 ) ) ( not ( = ?auto_806483 ?auto_806487 ) ) ( not ( = ?auto_806483 ?auto_806488 ) ) ( not ( = ?auto_806483 ?auto_806489 ) ) ( not ( = ?auto_806483 ?auto_806490 ) ) ( not ( = ?auto_806483 ?auto_806491 ) ) ( not ( = ?auto_806484 ?auto_806485 ) ) ( not ( = ?auto_806484 ?auto_806486 ) ) ( not ( = ?auto_806484 ?auto_806487 ) ) ( not ( = ?auto_806484 ?auto_806488 ) ) ( not ( = ?auto_806484 ?auto_806489 ) ) ( not ( = ?auto_806484 ?auto_806490 ) ) ( not ( = ?auto_806484 ?auto_806491 ) ) ( not ( = ?auto_806485 ?auto_806486 ) ) ( not ( = ?auto_806485 ?auto_806487 ) ) ( not ( = ?auto_806485 ?auto_806488 ) ) ( not ( = ?auto_806485 ?auto_806489 ) ) ( not ( = ?auto_806485 ?auto_806490 ) ) ( not ( = ?auto_806485 ?auto_806491 ) ) ( not ( = ?auto_806486 ?auto_806487 ) ) ( not ( = ?auto_806486 ?auto_806488 ) ) ( not ( = ?auto_806486 ?auto_806489 ) ) ( not ( = ?auto_806486 ?auto_806490 ) ) ( not ( = ?auto_806486 ?auto_806491 ) ) ( not ( = ?auto_806487 ?auto_806488 ) ) ( not ( = ?auto_806487 ?auto_806489 ) ) ( not ( = ?auto_806487 ?auto_806490 ) ) ( not ( = ?auto_806487 ?auto_806491 ) ) ( not ( = ?auto_806488 ?auto_806489 ) ) ( not ( = ?auto_806488 ?auto_806490 ) ) ( not ( = ?auto_806488 ?auto_806491 ) ) ( not ( = ?auto_806489 ?auto_806490 ) ) ( not ( = ?auto_806489 ?auto_806491 ) ) ( not ( = ?auto_806490 ?auto_806491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_806490 ?auto_806491 )
      ( !STACK ?auto_806490 ?auto_806489 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806541 - BLOCK
      ?auto_806542 - BLOCK
      ?auto_806543 - BLOCK
      ?auto_806544 - BLOCK
      ?auto_806545 - BLOCK
      ?auto_806546 - BLOCK
      ?auto_806547 - BLOCK
      ?auto_806548 - BLOCK
      ?auto_806549 - BLOCK
      ?auto_806550 - BLOCK
      ?auto_806551 - BLOCK
      ?auto_806552 - BLOCK
      ?auto_806553 - BLOCK
      ?auto_806554 - BLOCK
      ?auto_806555 - BLOCK
      ?auto_806556 - BLOCK
    )
    :vars
    (
      ?auto_806557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806556 ?auto_806557 ) ( ON-TABLE ?auto_806541 ) ( ON ?auto_806542 ?auto_806541 ) ( ON ?auto_806543 ?auto_806542 ) ( ON ?auto_806544 ?auto_806543 ) ( ON ?auto_806545 ?auto_806544 ) ( ON ?auto_806546 ?auto_806545 ) ( ON ?auto_806547 ?auto_806546 ) ( ON ?auto_806548 ?auto_806547 ) ( ON ?auto_806549 ?auto_806548 ) ( ON ?auto_806550 ?auto_806549 ) ( ON ?auto_806551 ?auto_806550 ) ( ON ?auto_806552 ?auto_806551 ) ( ON ?auto_806553 ?auto_806552 ) ( ON ?auto_806554 ?auto_806553 ) ( not ( = ?auto_806541 ?auto_806542 ) ) ( not ( = ?auto_806541 ?auto_806543 ) ) ( not ( = ?auto_806541 ?auto_806544 ) ) ( not ( = ?auto_806541 ?auto_806545 ) ) ( not ( = ?auto_806541 ?auto_806546 ) ) ( not ( = ?auto_806541 ?auto_806547 ) ) ( not ( = ?auto_806541 ?auto_806548 ) ) ( not ( = ?auto_806541 ?auto_806549 ) ) ( not ( = ?auto_806541 ?auto_806550 ) ) ( not ( = ?auto_806541 ?auto_806551 ) ) ( not ( = ?auto_806541 ?auto_806552 ) ) ( not ( = ?auto_806541 ?auto_806553 ) ) ( not ( = ?auto_806541 ?auto_806554 ) ) ( not ( = ?auto_806541 ?auto_806555 ) ) ( not ( = ?auto_806541 ?auto_806556 ) ) ( not ( = ?auto_806541 ?auto_806557 ) ) ( not ( = ?auto_806542 ?auto_806543 ) ) ( not ( = ?auto_806542 ?auto_806544 ) ) ( not ( = ?auto_806542 ?auto_806545 ) ) ( not ( = ?auto_806542 ?auto_806546 ) ) ( not ( = ?auto_806542 ?auto_806547 ) ) ( not ( = ?auto_806542 ?auto_806548 ) ) ( not ( = ?auto_806542 ?auto_806549 ) ) ( not ( = ?auto_806542 ?auto_806550 ) ) ( not ( = ?auto_806542 ?auto_806551 ) ) ( not ( = ?auto_806542 ?auto_806552 ) ) ( not ( = ?auto_806542 ?auto_806553 ) ) ( not ( = ?auto_806542 ?auto_806554 ) ) ( not ( = ?auto_806542 ?auto_806555 ) ) ( not ( = ?auto_806542 ?auto_806556 ) ) ( not ( = ?auto_806542 ?auto_806557 ) ) ( not ( = ?auto_806543 ?auto_806544 ) ) ( not ( = ?auto_806543 ?auto_806545 ) ) ( not ( = ?auto_806543 ?auto_806546 ) ) ( not ( = ?auto_806543 ?auto_806547 ) ) ( not ( = ?auto_806543 ?auto_806548 ) ) ( not ( = ?auto_806543 ?auto_806549 ) ) ( not ( = ?auto_806543 ?auto_806550 ) ) ( not ( = ?auto_806543 ?auto_806551 ) ) ( not ( = ?auto_806543 ?auto_806552 ) ) ( not ( = ?auto_806543 ?auto_806553 ) ) ( not ( = ?auto_806543 ?auto_806554 ) ) ( not ( = ?auto_806543 ?auto_806555 ) ) ( not ( = ?auto_806543 ?auto_806556 ) ) ( not ( = ?auto_806543 ?auto_806557 ) ) ( not ( = ?auto_806544 ?auto_806545 ) ) ( not ( = ?auto_806544 ?auto_806546 ) ) ( not ( = ?auto_806544 ?auto_806547 ) ) ( not ( = ?auto_806544 ?auto_806548 ) ) ( not ( = ?auto_806544 ?auto_806549 ) ) ( not ( = ?auto_806544 ?auto_806550 ) ) ( not ( = ?auto_806544 ?auto_806551 ) ) ( not ( = ?auto_806544 ?auto_806552 ) ) ( not ( = ?auto_806544 ?auto_806553 ) ) ( not ( = ?auto_806544 ?auto_806554 ) ) ( not ( = ?auto_806544 ?auto_806555 ) ) ( not ( = ?auto_806544 ?auto_806556 ) ) ( not ( = ?auto_806544 ?auto_806557 ) ) ( not ( = ?auto_806545 ?auto_806546 ) ) ( not ( = ?auto_806545 ?auto_806547 ) ) ( not ( = ?auto_806545 ?auto_806548 ) ) ( not ( = ?auto_806545 ?auto_806549 ) ) ( not ( = ?auto_806545 ?auto_806550 ) ) ( not ( = ?auto_806545 ?auto_806551 ) ) ( not ( = ?auto_806545 ?auto_806552 ) ) ( not ( = ?auto_806545 ?auto_806553 ) ) ( not ( = ?auto_806545 ?auto_806554 ) ) ( not ( = ?auto_806545 ?auto_806555 ) ) ( not ( = ?auto_806545 ?auto_806556 ) ) ( not ( = ?auto_806545 ?auto_806557 ) ) ( not ( = ?auto_806546 ?auto_806547 ) ) ( not ( = ?auto_806546 ?auto_806548 ) ) ( not ( = ?auto_806546 ?auto_806549 ) ) ( not ( = ?auto_806546 ?auto_806550 ) ) ( not ( = ?auto_806546 ?auto_806551 ) ) ( not ( = ?auto_806546 ?auto_806552 ) ) ( not ( = ?auto_806546 ?auto_806553 ) ) ( not ( = ?auto_806546 ?auto_806554 ) ) ( not ( = ?auto_806546 ?auto_806555 ) ) ( not ( = ?auto_806546 ?auto_806556 ) ) ( not ( = ?auto_806546 ?auto_806557 ) ) ( not ( = ?auto_806547 ?auto_806548 ) ) ( not ( = ?auto_806547 ?auto_806549 ) ) ( not ( = ?auto_806547 ?auto_806550 ) ) ( not ( = ?auto_806547 ?auto_806551 ) ) ( not ( = ?auto_806547 ?auto_806552 ) ) ( not ( = ?auto_806547 ?auto_806553 ) ) ( not ( = ?auto_806547 ?auto_806554 ) ) ( not ( = ?auto_806547 ?auto_806555 ) ) ( not ( = ?auto_806547 ?auto_806556 ) ) ( not ( = ?auto_806547 ?auto_806557 ) ) ( not ( = ?auto_806548 ?auto_806549 ) ) ( not ( = ?auto_806548 ?auto_806550 ) ) ( not ( = ?auto_806548 ?auto_806551 ) ) ( not ( = ?auto_806548 ?auto_806552 ) ) ( not ( = ?auto_806548 ?auto_806553 ) ) ( not ( = ?auto_806548 ?auto_806554 ) ) ( not ( = ?auto_806548 ?auto_806555 ) ) ( not ( = ?auto_806548 ?auto_806556 ) ) ( not ( = ?auto_806548 ?auto_806557 ) ) ( not ( = ?auto_806549 ?auto_806550 ) ) ( not ( = ?auto_806549 ?auto_806551 ) ) ( not ( = ?auto_806549 ?auto_806552 ) ) ( not ( = ?auto_806549 ?auto_806553 ) ) ( not ( = ?auto_806549 ?auto_806554 ) ) ( not ( = ?auto_806549 ?auto_806555 ) ) ( not ( = ?auto_806549 ?auto_806556 ) ) ( not ( = ?auto_806549 ?auto_806557 ) ) ( not ( = ?auto_806550 ?auto_806551 ) ) ( not ( = ?auto_806550 ?auto_806552 ) ) ( not ( = ?auto_806550 ?auto_806553 ) ) ( not ( = ?auto_806550 ?auto_806554 ) ) ( not ( = ?auto_806550 ?auto_806555 ) ) ( not ( = ?auto_806550 ?auto_806556 ) ) ( not ( = ?auto_806550 ?auto_806557 ) ) ( not ( = ?auto_806551 ?auto_806552 ) ) ( not ( = ?auto_806551 ?auto_806553 ) ) ( not ( = ?auto_806551 ?auto_806554 ) ) ( not ( = ?auto_806551 ?auto_806555 ) ) ( not ( = ?auto_806551 ?auto_806556 ) ) ( not ( = ?auto_806551 ?auto_806557 ) ) ( not ( = ?auto_806552 ?auto_806553 ) ) ( not ( = ?auto_806552 ?auto_806554 ) ) ( not ( = ?auto_806552 ?auto_806555 ) ) ( not ( = ?auto_806552 ?auto_806556 ) ) ( not ( = ?auto_806552 ?auto_806557 ) ) ( not ( = ?auto_806553 ?auto_806554 ) ) ( not ( = ?auto_806553 ?auto_806555 ) ) ( not ( = ?auto_806553 ?auto_806556 ) ) ( not ( = ?auto_806553 ?auto_806557 ) ) ( not ( = ?auto_806554 ?auto_806555 ) ) ( not ( = ?auto_806554 ?auto_806556 ) ) ( not ( = ?auto_806554 ?auto_806557 ) ) ( not ( = ?auto_806555 ?auto_806556 ) ) ( not ( = ?auto_806555 ?auto_806557 ) ) ( not ( = ?auto_806556 ?auto_806557 ) ) ( CLEAR ?auto_806554 ) ( ON ?auto_806555 ?auto_806556 ) ( CLEAR ?auto_806555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_806541 ?auto_806542 ?auto_806543 ?auto_806544 ?auto_806545 ?auto_806546 ?auto_806547 ?auto_806548 ?auto_806549 ?auto_806550 ?auto_806551 ?auto_806552 ?auto_806553 ?auto_806554 ?auto_806555 )
      ( MAKE-16PILE ?auto_806541 ?auto_806542 ?auto_806543 ?auto_806544 ?auto_806545 ?auto_806546 ?auto_806547 ?auto_806548 ?auto_806549 ?auto_806550 ?auto_806551 ?auto_806552 ?auto_806553 ?auto_806554 ?auto_806555 ?auto_806556 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806607 - BLOCK
      ?auto_806608 - BLOCK
      ?auto_806609 - BLOCK
      ?auto_806610 - BLOCK
      ?auto_806611 - BLOCK
      ?auto_806612 - BLOCK
      ?auto_806613 - BLOCK
      ?auto_806614 - BLOCK
      ?auto_806615 - BLOCK
      ?auto_806616 - BLOCK
      ?auto_806617 - BLOCK
      ?auto_806618 - BLOCK
      ?auto_806619 - BLOCK
      ?auto_806620 - BLOCK
      ?auto_806621 - BLOCK
      ?auto_806622 - BLOCK
    )
    :vars
    (
      ?auto_806623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806622 ?auto_806623 ) ( ON-TABLE ?auto_806607 ) ( ON ?auto_806608 ?auto_806607 ) ( ON ?auto_806609 ?auto_806608 ) ( ON ?auto_806610 ?auto_806609 ) ( ON ?auto_806611 ?auto_806610 ) ( ON ?auto_806612 ?auto_806611 ) ( ON ?auto_806613 ?auto_806612 ) ( ON ?auto_806614 ?auto_806613 ) ( ON ?auto_806615 ?auto_806614 ) ( ON ?auto_806616 ?auto_806615 ) ( ON ?auto_806617 ?auto_806616 ) ( ON ?auto_806618 ?auto_806617 ) ( ON ?auto_806619 ?auto_806618 ) ( not ( = ?auto_806607 ?auto_806608 ) ) ( not ( = ?auto_806607 ?auto_806609 ) ) ( not ( = ?auto_806607 ?auto_806610 ) ) ( not ( = ?auto_806607 ?auto_806611 ) ) ( not ( = ?auto_806607 ?auto_806612 ) ) ( not ( = ?auto_806607 ?auto_806613 ) ) ( not ( = ?auto_806607 ?auto_806614 ) ) ( not ( = ?auto_806607 ?auto_806615 ) ) ( not ( = ?auto_806607 ?auto_806616 ) ) ( not ( = ?auto_806607 ?auto_806617 ) ) ( not ( = ?auto_806607 ?auto_806618 ) ) ( not ( = ?auto_806607 ?auto_806619 ) ) ( not ( = ?auto_806607 ?auto_806620 ) ) ( not ( = ?auto_806607 ?auto_806621 ) ) ( not ( = ?auto_806607 ?auto_806622 ) ) ( not ( = ?auto_806607 ?auto_806623 ) ) ( not ( = ?auto_806608 ?auto_806609 ) ) ( not ( = ?auto_806608 ?auto_806610 ) ) ( not ( = ?auto_806608 ?auto_806611 ) ) ( not ( = ?auto_806608 ?auto_806612 ) ) ( not ( = ?auto_806608 ?auto_806613 ) ) ( not ( = ?auto_806608 ?auto_806614 ) ) ( not ( = ?auto_806608 ?auto_806615 ) ) ( not ( = ?auto_806608 ?auto_806616 ) ) ( not ( = ?auto_806608 ?auto_806617 ) ) ( not ( = ?auto_806608 ?auto_806618 ) ) ( not ( = ?auto_806608 ?auto_806619 ) ) ( not ( = ?auto_806608 ?auto_806620 ) ) ( not ( = ?auto_806608 ?auto_806621 ) ) ( not ( = ?auto_806608 ?auto_806622 ) ) ( not ( = ?auto_806608 ?auto_806623 ) ) ( not ( = ?auto_806609 ?auto_806610 ) ) ( not ( = ?auto_806609 ?auto_806611 ) ) ( not ( = ?auto_806609 ?auto_806612 ) ) ( not ( = ?auto_806609 ?auto_806613 ) ) ( not ( = ?auto_806609 ?auto_806614 ) ) ( not ( = ?auto_806609 ?auto_806615 ) ) ( not ( = ?auto_806609 ?auto_806616 ) ) ( not ( = ?auto_806609 ?auto_806617 ) ) ( not ( = ?auto_806609 ?auto_806618 ) ) ( not ( = ?auto_806609 ?auto_806619 ) ) ( not ( = ?auto_806609 ?auto_806620 ) ) ( not ( = ?auto_806609 ?auto_806621 ) ) ( not ( = ?auto_806609 ?auto_806622 ) ) ( not ( = ?auto_806609 ?auto_806623 ) ) ( not ( = ?auto_806610 ?auto_806611 ) ) ( not ( = ?auto_806610 ?auto_806612 ) ) ( not ( = ?auto_806610 ?auto_806613 ) ) ( not ( = ?auto_806610 ?auto_806614 ) ) ( not ( = ?auto_806610 ?auto_806615 ) ) ( not ( = ?auto_806610 ?auto_806616 ) ) ( not ( = ?auto_806610 ?auto_806617 ) ) ( not ( = ?auto_806610 ?auto_806618 ) ) ( not ( = ?auto_806610 ?auto_806619 ) ) ( not ( = ?auto_806610 ?auto_806620 ) ) ( not ( = ?auto_806610 ?auto_806621 ) ) ( not ( = ?auto_806610 ?auto_806622 ) ) ( not ( = ?auto_806610 ?auto_806623 ) ) ( not ( = ?auto_806611 ?auto_806612 ) ) ( not ( = ?auto_806611 ?auto_806613 ) ) ( not ( = ?auto_806611 ?auto_806614 ) ) ( not ( = ?auto_806611 ?auto_806615 ) ) ( not ( = ?auto_806611 ?auto_806616 ) ) ( not ( = ?auto_806611 ?auto_806617 ) ) ( not ( = ?auto_806611 ?auto_806618 ) ) ( not ( = ?auto_806611 ?auto_806619 ) ) ( not ( = ?auto_806611 ?auto_806620 ) ) ( not ( = ?auto_806611 ?auto_806621 ) ) ( not ( = ?auto_806611 ?auto_806622 ) ) ( not ( = ?auto_806611 ?auto_806623 ) ) ( not ( = ?auto_806612 ?auto_806613 ) ) ( not ( = ?auto_806612 ?auto_806614 ) ) ( not ( = ?auto_806612 ?auto_806615 ) ) ( not ( = ?auto_806612 ?auto_806616 ) ) ( not ( = ?auto_806612 ?auto_806617 ) ) ( not ( = ?auto_806612 ?auto_806618 ) ) ( not ( = ?auto_806612 ?auto_806619 ) ) ( not ( = ?auto_806612 ?auto_806620 ) ) ( not ( = ?auto_806612 ?auto_806621 ) ) ( not ( = ?auto_806612 ?auto_806622 ) ) ( not ( = ?auto_806612 ?auto_806623 ) ) ( not ( = ?auto_806613 ?auto_806614 ) ) ( not ( = ?auto_806613 ?auto_806615 ) ) ( not ( = ?auto_806613 ?auto_806616 ) ) ( not ( = ?auto_806613 ?auto_806617 ) ) ( not ( = ?auto_806613 ?auto_806618 ) ) ( not ( = ?auto_806613 ?auto_806619 ) ) ( not ( = ?auto_806613 ?auto_806620 ) ) ( not ( = ?auto_806613 ?auto_806621 ) ) ( not ( = ?auto_806613 ?auto_806622 ) ) ( not ( = ?auto_806613 ?auto_806623 ) ) ( not ( = ?auto_806614 ?auto_806615 ) ) ( not ( = ?auto_806614 ?auto_806616 ) ) ( not ( = ?auto_806614 ?auto_806617 ) ) ( not ( = ?auto_806614 ?auto_806618 ) ) ( not ( = ?auto_806614 ?auto_806619 ) ) ( not ( = ?auto_806614 ?auto_806620 ) ) ( not ( = ?auto_806614 ?auto_806621 ) ) ( not ( = ?auto_806614 ?auto_806622 ) ) ( not ( = ?auto_806614 ?auto_806623 ) ) ( not ( = ?auto_806615 ?auto_806616 ) ) ( not ( = ?auto_806615 ?auto_806617 ) ) ( not ( = ?auto_806615 ?auto_806618 ) ) ( not ( = ?auto_806615 ?auto_806619 ) ) ( not ( = ?auto_806615 ?auto_806620 ) ) ( not ( = ?auto_806615 ?auto_806621 ) ) ( not ( = ?auto_806615 ?auto_806622 ) ) ( not ( = ?auto_806615 ?auto_806623 ) ) ( not ( = ?auto_806616 ?auto_806617 ) ) ( not ( = ?auto_806616 ?auto_806618 ) ) ( not ( = ?auto_806616 ?auto_806619 ) ) ( not ( = ?auto_806616 ?auto_806620 ) ) ( not ( = ?auto_806616 ?auto_806621 ) ) ( not ( = ?auto_806616 ?auto_806622 ) ) ( not ( = ?auto_806616 ?auto_806623 ) ) ( not ( = ?auto_806617 ?auto_806618 ) ) ( not ( = ?auto_806617 ?auto_806619 ) ) ( not ( = ?auto_806617 ?auto_806620 ) ) ( not ( = ?auto_806617 ?auto_806621 ) ) ( not ( = ?auto_806617 ?auto_806622 ) ) ( not ( = ?auto_806617 ?auto_806623 ) ) ( not ( = ?auto_806618 ?auto_806619 ) ) ( not ( = ?auto_806618 ?auto_806620 ) ) ( not ( = ?auto_806618 ?auto_806621 ) ) ( not ( = ?auto_806618 ?auto_806622 ) ) ( not ( = ?auto_806618 ?auto_806623 ) ) ( not ( = ?auto_806619 ?auto_806620 ) ) ( not ( = ?auto_806619 ?auto_806621 ) ) ( not ( = ?auto_806619 ?auto_806622 ) ) ( not ( = ?auto_806619 ?auto_806623 ) ) ( not ( = ?auto_806620 ?auto_806621 ) ) ( not ( = ?auto_806620 ?auto_806622 ) ) ( not ( = ?auto_806620 ?auto_806623 ) ) ( not ( = ?auto_806621 ?auto_806622 ) ) ( not ( = ?auto_806621 ?auto_806623 ) ) ( not ( = ?auto_806622 ?auto_806623 ) ) ( ON ?auto_806621 ?auto_806622 ) ( CLEAR ?auto_806619 ) ( ON ?auto_806620 ?auto_806621 ) ( CLEAR ?auto_806620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_806607 ?auto_806608 ?auto_806609 ?auto_806610 ?auto_806611 ?auto_806612 ?auto_806613 ?auto_806614 ?auto_806615 ?auto_806616 ?auto_806617 ?auto_806618 ?auto_806619 ?auto_806620 )
      ( MAKE-16PILE ?auto_806607 ?auto_806608 ?auto_806609 ?auto_806610 ?auto_806611 ?auto_806612 ?auto_806613 ?auto_806614 ?auto_806615 ?auto_806616 ?auto_806617 ?auto_806618 ?auto_806619 ?auto_806620 ?auto_806621 ?auto_806622 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806673 - BLOCK
      ?auto_806674 - BLOCK
      ?auto_806675 - BLOCK
      ?auto_806676 - BLOCK
      ?auto_806677 - BLOCK
      ?auto_806678 - BLOCK
      ?auto_806679 - BLOCK
      ?auto_806680 - BLOCK
      ?auto_806681 - BLOCK
      ?auto_806682 - BLOCK
      ?auto_806683 - BLOCK
      ?auto_806684 - BLOCK
      ?auto_806685 - BLOCK
      ?auto_806686 - BLOCK
      ?auto_806687 - BLOCK
      ?auto_806688 - BLOCK
    )
    :vars
    (
      ?auto_806689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806688 ?auto_806689 ) ( ON-TABLE ?auto_806673 ) ( ON ?auto_806674 ?auto_806673 ) ( ON ?auto_806675 ?auto_806674 ) ( ON ?auto_806676 ?auto_806675 ) ( ON ?auto_806677 ?auto_806676 ) ( ON ?auto_806678 ?auto_806677 ) ( ON ?auto_806679 ?auto_806678 ) ( ON ?auto_806680 ?auto_806679 ) ( ON ?auto_806681 ?auto_806680 ) ( ON ?auto_806682 ?auto_806681 ) ( ON ?auto_806683 ?auto_806682 ) ( ON ?auto_806684 ?auto_806683 ) ( not ( = ?auto_806673 ?auto_806674 ) ) ( not ( = ?auto_806673 ?auto_806675 ) ) ( not ( = ?auto_806673 ?auto_806676 ) ) ( not ( = ?auto_806673 ?auto_806677 ) ) ( not ( = ?auto_806673 ?auto_806678 ) ) ( not ( = ?auto_806673 ?auto_806679 ) ) ( not ( = ?auto_806673 ?auto_806680 ) ) ( not ( = ?auto_806673 ?auto_806681 ) ) ( not ( = ?auto_806673 ?auto_806682 ) ) ( not ( = ?auto_806673 ?auto_806683 ) ) ( not ( = ?auto_806673 ?auto_806684 ) ) ( not ( = ?auto_806673 ?auto_806685 ) ) ( not ( = ?auto_806673 ?auto_806686 ) ) ( not ( = ?auto_806673 ?auto_806687 ) ) ( not ( = ?auto_806673 ?auto_806688 ) ) ( not ( = ?auto_806673 ?auto_806689 ) ) ( not ( = ?auto_806674 ?auto_806675 ) ) ( not ( = ?auto_806674 ?auto_806676 ) ) ( not ( = ?auto_806674 ?auto_806677 ) ) ( not ( = ?auto_806674 ?auto_806678 ) ) ( not ( = ?auto_806674 ?auto_806679 ) ) ( not ( = ?auto_806674 ?auto_806680 ) ) ( not ( = ?auto_806674 ?auto_806681 ) ) ( not ( = ?auto_806674 ?auto_806682 ) ) ( not ( = ?auto_806674 ?auto_806683 ) ) ( not ( = ?auto_806674 ?auto_806684 ) ) ( not ( = ?auto_806674 ?auto_806685 ) ) ( not ( = ?auto_806674 ?auto_806686 ) ) ( not ( = ?auto_806674 ?auto_806687 ) ) ( not ( = ?auto_806674 ?auto_806688 ) ) ( not ( = ?auto_806674 ?auto_806689 ) ) ( not ( = ?auto_806675 ?auto_806676 ) ) ( not ( = ?auto_806675 ?auto_806677 ) ) ( not ( = ?auto_806675 ?auto_806678 ) ) ( not ( = ?auto_806675 ?auto_806679 ) ) ( not ( = ?auto_806675 ?auto_806680 ) ) ( not ( = ?auto_806675 ?auto_806681 ) ) ( not ( = ?auto_806675 ?auto_806682 ) ) ( not ( = ?auto_806675 ?auto_806683 ) ) ( not ( = ?auto_806675 ?auto_806684 ) ) ( not ( = ?auto_806675 ?auto_806685 ) ) ( not ( = ?auto_806675 ?auto_806686 ) ) ( not ( = ?auto_806675 ?auto_806687 ) ) ( not ( = ?auto_806675 ?auto_806688 ) ) ( not ( = ?auto_806675 ?auto_806689 ) ) ( not ( = ?auto_806676 ?auto_806677 ) ) ( not ( = ?auto_806676 ?auto_806678 ) ) ( not ( = ?auto_806676 ?auto_806679 ) ) ( not ( = ?auto_806676 ?auto_806680 ) ) ( not ( = ?auto_806676 ?auto_806681 ) ) ( not ( = ?auto_806676 ?auto_806682 ) ) ( not ( = ?auto_806676 ?auto_806683 ) ) ( not ( = ?auto_806676 ?auto_806684 ) ) ( not ( = ?auto_806676 ?auto_806685 ) ) ( not ( = ?auto_806676 ?auto_806686 ) ) ( not ( = ?auto_806676 ?auto_806687 ) ) ( not ( = ?auto_806676 ?auto_806688 ) ) ( not ( = ?auto_806676 ?auto_806689 ) ) ( not ( = ?auto_806677 ?auto_806678 ) ) ( not ( = ?auto_806677 ?auto_806679 ) ) ( not ( = ?auto_806677 ?auto_806680 ) ) ( not ( = ?auto_806677 ?auto_806681 ) ) ( not ( = ?auto_806677 ?auto_806682 ) ) ( not ( = ?auto_806677 ?auto_806683 ) ) ( not ( = ?auto_806677 ?auto_806684 ) ) ( not ( = ?auto_806677 ?auto_806685 ) ) ( not ( = ?auto_806677 ?auto_806686 ) ) ( not ( = ?auto_806677 ?auto_806687 ) ) ( not ( = ?auto_806677 ?auto_806688 ) ) ( not ( = ?auto_806677 ?auto_806689 ) ) ( not ( = ?auto_806678 ?auto_806679 ) ) ( not ( = ?auto_806678 ?auto_806680 ) ) ( not ( = ?auto_806678 ?auto_806681 ) ) ( not ( = ?auto_806678 ?auto_806682 ) ) ( not ( = ?auto_806678 ?auto_806683 ) ) ( not ( = ?auto_806678 ?auto_806684 ) ) ( not ( = ?auto_806678 ?auto_806685 ) ) ( not ( = ?auto_806678 ?auto_806686 ) ) ( not ( = ?auto_806678 ?auto_806687 ) ) ( not ( = ?auto_806678 ?auto_806688 ) ) ( not ( = ?auto_806678 ?auto_806689 ) ) ( not ( = ?auto_806679 ?auto_806680 ) ) ( not ( = ?auto_806679 ?auto_806681 ) ) ( not ( = ?auto_806679 ?auto_806682 ) ) ( not ( = ?auto_806679 ?auto_806683 ) ) ( not ( = ?auto_806679 ?auto_806684 ) ) ( not ( = ?auto_806679 ?auto_806685 ) ) ( not ( = ?auto_806679 ?auto_806686 ) ) ( not ( = ?auto_806679 ?auto_806687 ) ) ( not ( = ?auto_806679 ?auto_806688 ) ) ( not ( = ?auto_806679 ?auto_806689 ) ) ( not ( = ?auto_806680 ?auto_806681 ) ) ( not ( = ?auto_806680 ?auto_806682 ) ) ( not ( = ?auto_806680 ?auto_806683 ) ) ( not ( = ?auto_806680 ?auto_806684 ) ) ( not ( = ?auto_806680 ?auto_806685 ) ) ( not ( = ?auto_806680 ?auto_806686 ) ) ( not ( = ?auto_806680 ?auto_806687 ) ) ( not ( = ?auto_806680 ?auto_806688 ) ) ( not ( = ?auto_806680 ?auto_806689 ) ) ( not ( = ?auto_806681 ?auto_806682 ) ) ( not ( = ?auto_806681 ?auto_806683 ) ) ( not ( = ?auto_806681 ?auto_806684 ) ) ( not ( = ?auto_806681 ?auto_806685 ) ) ( not ( = ?auto_806681 ?auto_806686 ) ) ( not ( = ?auto_806681 ?auto_806687 ) ) ( not ( = ?auto_806681 ?auto_806688 ) ) ( not ( = ?auto_806681 ?auto_806689 ) ) ( not ( = ?auto_806682 ?auto_806683 ) ) ( not ( = ?auto_806682 ?auto_806684 ) ) ( not ( = ?auto_806682 ?auto_806685 ) ) ( not ( = ?auto_806682 ?auto_806686 ) ) ( not ( = ?auto_806682 ?auto_806687 ) ) ( not ( = ?auto_806682 ?auto_806688 ) ) ( not ( = ?auto_806682 ?auto_806689 ) ) ( not ( = ?auto_806683 ?auto_806684 ) ) ( not ( = ?auto_806683 ?auto_806685 ) ) ( not ( = ?auto_806683 ?auto_806686 ) ) ( not ( = ?auto_806683 ?auto_806687 ) ) ( not ( = ?auto_806683 ?auto_806688 ) ) ( not ( = ?auto_806683 ?auto_806689 ) ) ( not ( = ?auto_806684 ?auto_806685 ) ) ( not ( = ?auto_806684 ?auto_806686 ) ) ( not ( = ?auto_806684 ?auto_806687 ) ) ( not ( = ?auto_806684 ?auto_806688 ) ) ( not ( = ?auto_806684 ?auto_806689 ) ) ( not ( = ?auto_806685 ?auto_806686 ) ) ( not ( = ?auto_806685 ?auto_806687 ) ) ( not ( = ?auto_806685 ?auto_806688 ) ) ( not ( = ?auto_806685 ?auto_806689 ) ) ( not ( = ?auto_806686 ?auto_806687 ) ) ( not ( = ?auto_806686 ?auto_806688 ) ) ( not ( = ?auto_806686 ?auto_806689 ) ) ( not ( = ?auto_806687 ?auto_806688 ) ) ( not ( = ?auto_806687 ?auto_806689 ) ) ( not ( = ?auto_806688 ?auto_806689 ) ) ( ON ?auto_806687 ?auto_806688 ) ( ON ?auto_806686 ?auto_806687 ) ( CLEAR ?auto_806684 ) ( ON ?auto_806685 ?auto_806686 ) ( CLEAR ?auto_806685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_806673 ?auto_806674 ?auto_806675 ?auto_806676 ?auto_806677 ?auto_806678 ?auto_806679 ?auto_806680 ?auto_806681 ?auto_806682 ?auto_806683 ?auto_806684 ?auto_806685 )
      ( MAKE-16PILE ?auto_806673 ?auto_806674 ?auto_806675 ?auto_806676 ?auto_806677 ?auto_806678 ?auto_806679 ?auto_806680 ?auto_806681 ?auto_806682 ?auto_806683 ?auto_806684 ?auto_806685 ?auto_806686 ?auto_806687 ?auto_806688 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806739 - BLOCK
      ?auto_806740 - BLOCK
      ?auto_806741 - BLOCK
      ?auto_806742 - BLOCK
      ?auto_806743 - BLOCK
      ?auto_806744 - BLOCK
      ?auto_806745 - BLOCK
      ?auto_806746 - BLOCK
      ?auto_806747 - BLOCK
      ?auto_806748 - BLOCK
      ?auto_806749 - BLOCK
      ?auto_806750 - BLOCK
      ?auto_806751 - BLOCK
      ?auto_806752 - BLOCK
      ?auto_806753 - BLOCK
      ?auto_806754 - BLOCK
    )
    :vars
    (
      ?auto_806755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806754 ?auto_806755 ) ( ON-TABLE ?auto_806739 ) ( ON ?auto_806740 ?auto_806739 ) ( ON ?auto_806741 ?auto_806740 ) ( ON ?auto_806742 ?auto_806741 ) ( ON ?auto_806743 ?auto_806742 ) ( ON ?auto_806744 ?auto_806743 ) ( ON ?auto_806745 ?auto_806744 ) ( ON ?auto_806746 ?auto_806745 ) ( ON ?auto_806747 ?auto_806746 ) ( ON ?auto_806748 ?auto_806747 ) ( ON ?auto_806749 ?auto_806748 ) ( not ( = ?auto_806739 ?auto_806740 ) ) ( not ( = ?auto_806739 ?auto_806741 ) ) ( not ( = ?auto_806739 ?auto_806742 ) ) ( not ( = ?auto_806739 ?auto_806743 ) ) ( not ( = ?auto_806739 ?auto_806744 ) ) ( not ( = ?auto_806739 ?auto_806745 ) ) ( not ( = ?auto_806739 ?auto_806746 ) ) ( not ( = ?auto_806739 ?auto_806747 ) ) ( not ( = ?auto_806739 ?auto_806748 ) ) ( not ( = ?auto_806739 ?auto_806749 ) ) ( not ( = ?auto_806739 ?auto_806750 ) ) ( not ( = ?auto_806739 ?auto_806751 ) ) ( not ( = ?auto_806739 ?auto_806752 ) ) ( not ( = ?auto_806739 ?auto_806753 ) ) ( not ( = ?auto_806739 ?auto_806754 ) ) ( not ( = ?auto_806739 ?auto_806755 ) ) ( not ( = ?auto_806740 ?auto_806741 ) ) ( not ( = ?auto_806740 ?auto_806742 ) ) ( not ( = ?auto_806740 ?auto_806743 ) ) ( not ( = ?auto_806740 ?auto_806744 ) ) ( not ( = ?auto_806740 ?auto_806745 ) ) ( not ( = ?auto_806740 ?auto_806746 ) ) ( not ( = ?auto_806740 ?auto_806747 ) ) ( not ( = ?auto_806740 ?auto_806748 ) ) ( not ( = ?auto_806740 ?auto_806749 ) ) ( not ( = ?auto_806740 ?auto_806750 ) ) ( not ( = ?auto_806740 ?auto_806751 ) ) ( not ( = ?auto_806740 ?auto_806752 ) ) ( not ( = ?auto_806740 ?auto_806753 ) ) ( not ( = ?auto_806740 ?auto_806754 ) ) ( not ( = ?auto_806740 ?auto_806755 ) ) ( not ( = ?auto_806741 ?auto_806742 ) ) ( not ( = ?auto_806741 ?auto_806743 ) ) ( not ( = ?auto_806741 ?auto_806744 ) ) ( not ( = ?auto_806741 ?auto_806745 ) ) ( not ( = ?auto_806741 ?auto_806746 ) ) ( not ( = ?auto_806741 ?auto_806747 ) ) ( not ( = ?auto_806741 ?auto_806748 ) ) ( not ( = ?auto_806741 ?auto_806749 ) ) ( not ( = ?auto_806741 ?auto_806750 ) ) ( not ( = ?auto_806741 ?auto_806751 ) ) ( not ( = ?auto_806741 ?auto_806752 ) ) ( not ( = ?auto_806741 ?auto_806753 ) ) ( not ( = ?auto_806741 ?auto_806754 ) ) ( not ( = ?auto_806741 ?auto_806755 ) ) ( not ( = ?auto_806742 ?auto_806743 ) ) ( not ( = ?auto_806742 ?auto_806744 ) ) ( not ( = ?auto_806742 ?auto_806745 ) ) ( not ( = ?auto_806742 ?auto_806746 ) ) ( not ( = ?auto_806742 ?auto_806747 ) ) ( not ( = ?auto_806742 ?auto_806748 ) ) ( not ( = ?auto_806742 ?auto_806749 ) ) ( not ( = ?auto_806742 ?auto_806750 ) ) ( not ( = ?auto_806742 ?auto_806751 ) ) ( not ( = ?auto_806742 ?auto_806752 ) ) ( not ( = ?auto_806742 ?auto_806753 ) ) ( not ( = ?auto_806742 ?auto_806754 ) ) ( not ( = ?auto_806742 ?auto_806755 ) ) ( not ( = ?auto_806743 ?auto_806744 ) ) ( not ( = ?auto_806743 ?auto_806745 ) ) ( not ( = ?auto_806743 ?auto_806746 ) ) ( not ( = ?auto_806743 ?auto_806747 ) ) ( not ( = ?auto_806743 ?auto_806748 ) ) ( not ( = ?auto_806743 ?auto_806749 ) ) ( not ( = ?auto_806743 ?auto_806750 ) ) ( not ( = ?auto_806743 ?auto_806751 ) ) ( not ( = ?auto_806743 ?auto_806752 ) ) ( not ( = ?auto_806743 ?auto_806753 ) ) ( not ( = ?auto_806743 ?auto_806754 ) ) ( not ( = ?auto_806743 ?auto_806755 ) ) ( not ( = ?auto_806744 ?auto_806745 ) ) ( not ( = ?auto_806744 ?auto_806746 ) ) ( not ( = ?auto_806744 ?auto_806747 ) ) ( not ( = ?auto_806744 ?auto_806748 ) ) ( not ( = ?auto_806744 ?auto_806749 ) ) ( not ( = ?auto_806744 ?auto_806750 ) ) ( not ( = ?auto_806744 ?auto_806751 ) ) ( not ( = ?auto_806744 ?auto_806752 ) ) ( not ( = ?auto_806744 ?auto_806753 ) ) ( not ( = ?auto_806744 ?auto_806754 ) ) ( not ( = ?auto_806744 ?auto_806755 ) ) ( not ( = ?auto_806745 ?auto_806746 ) ) ( not ( = ?auto_806745 ?auto_806747 ) ) ( not ( = ?auto_806745 ?auto_806748 ) ) ( not ( = ?auto_806745 ?auto_806749 ) ) ( not ( = ?auto_806745 ?auto_806750 ) ) ( not ( = ?auto_806745 ?auto_806751 ) ) ( not ( = ?auto_806745 ?auto_806752 ) ) ( not ( = ?auto_806745 ?auto_806753 ) ) ( not ( = ?auto_806745 ?auto_806754 ) ) ( not ( = ?auto_806745 ?auto_806755 ) ) ( not ( = ?auto_806746 ?auto_806747 ) ) ( not ( = ?auto_806746 ?auto_806748 ) ) ( not ( = ?auto_806746 ?auto_806749 ) ) ( not ( = ?auto_806746 ?auto_806750 ) ) ( not ( = ?auto_806746 ?auto_806751 ) ) ( not ( = ?auto_806746 ?auto_806752 ) ) ( not ( = ?auto_806746 ?auto_806753 ) ) ( not ( = ?auto_806746 ?auto_806754 ) ) ( not ( = ?auto_806746 ?auto_806755 ) ) ( not ( = ?auto_806747 ?auto_806748 ) ) ( not ( = ?auto_806747 ?auto_806749 ) ) ( not ( = ?auto_806747 ?auto_806750 ) ) ( not ( = ?auto_806747 ?auto_806751 ) ) ( not ( = ?auto_806747 ?auto_806752 ) ) ( not ( = ?auto_806747 ?auto_806753 ) ) ( not ( = ?auto_806747 ?auto_806754 ) ) ( not ( = ?auto_806747 ?auto_806755 ) ) ( not ( = ?auto_806748 ?auto_806749 ) ) ( not ( = ?auto_806748 ?auto_806750 ) ) ( not ( = ?auto_806748 ?auto_806751 ) ) ( not ( = ?auto_806748 ?auto_806752 ) ) ( not ( = ?auto_806748 ?auto_806753 ) ) ( not ( = ?auto_806748 ?auto_806754 ) ) ( not ( = ?auto_806748 ?auto_806755 ) ) ( not ( = ?auto_806749 ?auto_806750 ) ) ( not ( = ?auto_806749 ?auto_806751 ) ) ( not ( = ?auto_806749 ?auto_806752 ) ) ( not ( = ?auto_806749 ?auto_806753 ) ) ( not ( = ?auto_806749 ?auto_806754 ) ) ( not ( = ?auto_806749 ?auto_806755 ) ) ( not ( = ?auto_806750 ?auto_806751 ) ) ( not ( = ?auto_806750 ?auto_806752 ) ) ( not ( = ?auto_806750 ?auto_806753 ) ) ( not ( = ?auto_806750 ?auto_806754 ) ) ( not ( = ?auto_806750 ?auto_806755 ) ) ( not ( = ?auto_806751 ?auto_806752 ) ) ( not ( = ?auto_806751 ?auto_806753 ) ) ( not ( = ?auto_806751 ?auto_806754 ) ) ( not ( = ?auto_806751 ?auto_806755 ) ) ( not ( = ?auto_806752 ?auto_806753 ) ) ( not ( = ?auto_806752 ?auto_806754 ) ) ( not ( = ?auto_806752 ?auto_806755 ) ) ( not ( = ?auto_806753 ?auto_806754 ) ) ( not ( = ?auto_806753 ?auto_806755 ) ) ( not ( = ?auto_806754 ?auto_806755 ) ) ( ON ?auto_806753 ?auto_806754 ) ( ON ?auto_806752 ?auto_806753 ) ( ON ?auto_806751 ?auto_806752 ) ( CLEAR ?auto_806749 ) ( ON ?auto_806750 ?auto_806751 ) ( CLEAR ?auto_806750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_806739 ?auto_806740 ?auto_806741 ?auto_806742 ?auto_806743 ?auto_806744 ?auto_806745 ?auto_806746 ?auto_806747 ?auto_806748 ?auto_806749 ?auto_806750 )
      ( MAKE-16PILE ?auto_806739 ?auto_806740 ?auto_806741 ?auto_806742 ?auto_806743 ?auto_806744 ?auto_806745 ?auto_806746 ?auto_806747 ?auto_806748 ?auto_806749 ?auto_806750 ?auto_806751 ?auto_806752 ?auto_806753 ?auto_806754 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806805 - BLOCK
      ?auto_806806 - BLOCK
      ?auto_806807 - BLOCK
      ?auto_806808 - BLOCK
      ?auto_806809 - BLOCK
      ?auto_806810 - BLOCK
      ?auto_806811 - BLOCK
      ?auto_806812 - BLOCK
      ?auto_806813 - BLOCK
      ?auto_806814 - BLOCK
      ?auto_806815 - BLOCK
      ?auto_806816 - BLOCK
      ?auto_806817 - BLOCK
      ?auto_806818 - BLOCK
      ?auto_806819 - BLOCK
      ?auto_806820 - BLOCK
    )
    :vars
    (
      ?auto_806821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806820 ?auto_806821 ) ( ON-TABLE ?auto_806805 ) ( ON ?auto_806806 ?auto_806805 ) ( ON ?auto_806807 ?auto_806806 ) ( ON ?auto_806808 ?auto_806807 ) ( ON ?auto_806809 ?auto_806808 ) ( ON ?auto_806810 ?auto_806809 ) ( ON ?auto_806811 ?auto_806810 ) ( ON ?auto_806812 ?auto_806811 ) ( ON ?auto_806813 ?auto_806812 ) ( ON ?auto_806814 ?auto_806813 ) ( not ( = ?auto_806805 ?auto_806806 ) ) ( not ( = ?auto_806805 ?auto_806807 ) ) ( not ( = ?auto_806805 ?auto_806808 ) ) ( not ( = ?auto_806805 ?auto_806809 ) ) ( not ( = ?auto_806805 ?auto_806810 ) ) ( not ( = ?auto_806805 ?auto_806811 ) ) ( not ( = ?auto_806805 ?auto_806812 ) ) ( not ( = ?auto_806805 ?auto_806813 ) ) ( not ( = ?auto_806805 ?auto_806814 ) ) ( not ( = ?auto_806805 ?auto_806815 ) ) ( not ( = ?auto_806805 ?auto_806816 ) ) ( not ( = ?auto_806805 ?auto_806817 ) ) ( not ( = ?auto_806805 ?auto_806818 ) ) ( not ( = ?auto_806805 ?auto_806819 ) ) ( not ( = ?auto_806805 ?auto_806820 ) ) ( not ( = ?auto_806805 ?auto_806821 ) ) ( not ( = ?auto_806806 ?auto_806807 ) ) ( not ( = ?auto_806806 ?auto_806808 ) ) ( not ( = ?auto_806806 ?auto_806809 ) ) ( not ( = ?auto_806806 ?auto_806810 ) ) ( not ( = ?auto_806806 ?auto_806811 ) ) ( not ( = ?auto_806806 ?auto_806812 ) ) ( not ( = ?auto_806806 ?auto_806813 ) ) ( not ( = ?auto_806806 ?auto_806814 ) ) ( not ( = ?auto_806806 ?auto_806815 ) ) ( not ( = ?auto_806806 ?auto_806816 ) ) ( not ( = ?auto_806806 ?auto_806817 ) ) ( not ( = ?auto_806806 ?auto_806818 ) ) ( not ( = ?auto_806806 ?auto_806819 ) ) ( not ( = ?auto_806806 ?auto_806820 ) ) ( not ( = ?auto_806806 ?auto_806821 ) ) ( not ( = ?auto_806807 ?auto_806808 ) ) ( not ( = ?auto_806807 ?auto_806809 ) ) ( not ( = ?auto_806807 ?auto_806810 ) ) ( not ( = ?auto_806807 ?auto_806811 ) ) ( not ( = ?auto_806807 ?auto_806812 ) ) ( not ( = ?auto_806807 ?auto_806813 ) ) ( not ( = ?auto_806807 ?auto_806814 ) ) ( not ( = ?auto_806807 ?auto_806815 ) ) ( not ( = ?auto_806807 ?auto_806816 ) ) ( not ( = ?auto_806807 ?auto_806817 ) ) ( not ( = ?auto_806807 ?auto_806818 ) ) ( not ( = ?auto_806807 ?auto_806819 ) ) ( not ( = ?auto_806807 ?auto_806820 ) ) ( not ( = ?auto_806807 ?auto_806821 ) ) ( not ( = ?auto_806808 ?auto_806809 ) ) ( not ( = ?auto_806808 ?auto_806810 ) ) ( not ( = ?auto_806808 ?auto_806811 ) ) ( not ( = ?auto_806808 ?auto_806812 ) ) ( not ( = ?auto_806808 ?auto_806813 ) ) ( not ( = ?auto_806808 ?auto_806814 ) ) ( not ( = ?auto_806808 ?auto_806815 ) ) ( not ( = ?auto_806808 ?auto_806816 ) ) ( not ( = ?auto_806808 ?auto_806817 ) ) ( not ( = ?auto_806808 ?auto_806818 ) ) ( not ( = ?auto_806808 ?auto_806819 ) ) ( not ( = ?auto_806808 ?auto_806820 ) ) ( not ( = ?auto_806808 ?auto_806821 ) ) ( not ( = ?auto_806809 ?auto_806810 ) ) ( not ( = ?auto_806809 ?auto_806811 ) ) ( not ( = ?auto_806809 ?auto_806812 ) ) ( not ( = ?auto_806809 ?auto_806813 ) ) ( not ( = ?auto_806809 ?auto_806814 ) ) ( not ( = ?auto_806809 ?auto_806815 ) ) ( not ( = ?auto_806809 ?auto_806816 ) ) ( not ( = ?auto_806809 ?auto_806817 ) ) ( not ( = ?auto_806809 ?auto_806818 ) ) ( not ( = ?auto_806809 ?auto_806819 ) ) ( not ( = ?auto_806809 ?auto_806820 ) ) ( not ( = ?auto_806809 ?auto_806821 ) ) ( not ( = ?auto_806810 ?auto_806811 ) ) ( not ( = ?auto_806810 ?auto_806812 ) ) ( not ( = ?auto_806810 ?auto_806813 ) ) ( not ( = ?auto_806810 ?auto_806814 ) ) ( not ( = ?auto_806810 ?auto_806815 ) ) ( not ( = ?auto_806810 ?auto_806816 ) ) ( not ( = ?auto_806810 ?auto_806817 ) ) ( not ( = ?auto_806810 ?auto_806818 ) ) ( not ( = ?auto_806810 ?auto_806819 ) ) ( not ( = ?auto_806810 ?auto_806820 ) ) ( not ( = ?auto_806810 ?auto_806821 ) ) ( not ( = ?auto_806811 ?auto_806812 ) ) ( not ( = ?auto_806811 ?auto_806813 ) ) ( not ( = ?auto_806811 ?auto_806814 ) ) ( not ( = ?auto_806811 ?auto_806815 ) ) ( not ( = ?auto_806811 ?auto_806816 ) ) ( not ( = ?auto_806811 ?auto_806817 ) ) ( not ( = ?auto_806811 ?auto_806818 ) ) ( not ( = ?auto_806811 ?auto_806819 ) ) ( not ( = ?auto_806811 ?auto_806820 ) ) ( not ( = ?auto_806811 ?auto_806821 ) ) ( not ( = ?auto_806812 ?auto_806813 ) ) ( not ( = ?auto_806812 ?auto_806814 ) ) ( not ( = ?auto_806812 ?auto_806815 ) ) ( not ( = ?auto_806812 ?auto_806816 ) ) ( not ( = ?auto_806812 ?auto_806817 ) ) ( not ( = ?auto_806812 ?auto_806818 ) ) ( not ( = ?auto_806812 ?auto_806819 ) ) ( not ( = ?auto_806812 ?auto_806820 ) ) ( not ( = ?auto_806812 ?auto_806821 ) ) ( not ( = ?auto_806813 ?auto_806814 ) ) ( not ( = ?auto_806813 ?auto_806815 ) ) ( not ( = ?auto_806813 ?auto_806816 ) ) ( not ( = ?auto_806813 ?auto_806817 ) ) ( not ( = ?auto_806813 ?auto_806818 ) ) ( not ( = ?auto_806813 ?auto_806819 ) ) ( not ( = ?auto_806813 ?auto_806820 ) ) ( not ( = ?auto_806813 ?auto_806821 ) ) ( not ( = ?auto_806814 ?auto_806815 ) ) ( not ( = ?auto_806814 ?auto_806816 ) ) ( not ( = ?auto_806814 ?auto_806817 ) ) ( not ( = ?auto_806814 ?auto_806818 ) ) ( not ( = ?auto_806814 ?auto_806819 ) ) ( not ( = ?auto_806814 ?auto_806820 ) ) ( not ( = ?auto_806814 ?auto_806821 ) ) ( not ( = ?auto_806815 ?auto_806816 ) ) ( not ( = ?auto_806815 ?auto_806817 ) ) ( not ( = ?auto_806815 ?auto_806818 ) ) ( not ( = ?auto_806815 ?auto_806819 ) ) ( not ( = ?auto_806815 ?auto_806820 ) ) ( not ( = ?auto_806815 ?auto_806821 ) ) ( not ( = ?auto_806816 ?auto_806817 ) ) ( not ( = ?auto_806816 ?auto_806818 ) ) ( not ( = ?auto_806816 ?auto_806819 ) ) ( not ( = ?auto_806816 ?auto_806820 ) ) ( not ( = ?auto_806816 ?auto_806821 ) ) ( not ( = ?auto_806817 ?auto_806818 ) ) ( not ( = ?auto_806817 ?auto_806819 ) ) ( not ( = ?auto_806817 ?auto_806820 ) ) ( not ( = ?auto_806817 ?auto_806821 ) ) ( not ( = ?auto_806818 ?auto_806819 ) ) ( not ( = ?auto_806818 ?auto_806820 ) ) ( not ( = ?auto_806818 ?auto_806821 ) ) ( not ( = ?auto_806819 ?auto_806820 ) ) ( not ( = ?auto_806819 ?auto_806821 ) ) ( not ( = ?auto_806820 ?auto_806821 ) ) ( ON ?auto_806819 ?auto_806820 ) ( ON ?auto_806818 ?auto_806819 ) ( ON ?auto_806817 ?auto_806818 ) ( ON ?auto_806816 ?auto_806817 ) ( CLEAR ?auto_806814 ) ( ON ?auto_806815 ?auto_806816 ) ( CLEAR ?auto_806815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_806805 ?auto_806806 ?auto_806807 ?auto_806808 ?auto_806809 ?auto_806810 ?auto_806811 ?auto_806812 ?auto_806813 ?auto_806814 ?auto_806815 )
      ( MAKE-16PILE ?auto_806805 ?auto_806806 ?auto_806807 ?auto_806808 ?auto_806809 ?auto_806810 ?auto_806811 ?auto_806812 ?auto_806813 ?auto_806814 ?auto_806815 ?auto_806816 ?auto_806817 ?auto_806818 ?auto_806819 ?auto_806820 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806871 - BLOCK
      ?auto_806872 - BLOCK
      ?auto_806873 - BLOCK
      ?auto_806874 - BLOCK
      ?auto_806875 - BLOCK
      ?auto_806876 - BLOCK
      ?auto_806877 - BLOCK
      ?auto_806878 - BLOCK
      ?auto_806879 - BLOCK
      ?auto_806880 - BLOCK
      ?auto_806881 - BLOCK
      ?auto_806882 - BLOCK
      ?auto_806883 - BLOCK
      ?auto_806884 - BLOCK
      ?auto_806885 - BLOCK
      ?auto_806886 - BLOCK
    )
    :vars
    (
      ?auto_806887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806886 ?auto_806887 ) ( ON-TABLE ?auto_806871 ) ( ON ?auto_806872 ?auto_806871 ) ( ON ?auto_806873 ?auto_806872 ) ( ON ?auto_806874 ?auto_806873 ) ( ON ?auto_806875 ?auto_806874 ) ( ON ?auto_806876 ?auto_806875 ) ( ON ?auto_806877 ?auto_806876 ) ( ON ?auto_806878 ?auto_806877 ) ( ON ?auto_806879 ?auto_806878 ) ( not ( = ?auto_806871 ?auto_806872 ) ) ( not ( = ?auto_806871 ?auto_806873 ) ) ( not ( = ?auto_806871 ?auto_806874 ) ) ( not ( = ?auto_806871 ?auto_806875 ) ) ( not ( = ?auto_806871 ?auto_806876 ) ) ( not ( = ?auto_806871 ?auto_806877 ) ) ( not ( = ?auto_806871 ?auto_806878 ) ) ( not ( = ?auto_806871 ?auto_806879 ) ) ( not ( = ?auto_806871 ?auto_806880 ) ) ( not ( = ?auto_806871 ?auto_806881 ) ) ( not ( = ?auto_806871 ?auto_806882 ) ) ( not ( = ?auto_806871 ?auto_806883 ) ) ( not ( = ?auto_806871 ?auto_806884 ) ) ( not ( = ?auto_806871 ?auto_806885 ) ) ( not ( = ?auto_806871 ?auto_806886 ) ) ( not ( = ?auto_806871 ?auto_806887 ) ) ( not ( = ?auto_806872 ?auto_806873 ) ) ( not ( = ?auto_806872 ?auto_806874 ) ) ( not ( = ?auto_806872 ?auto_806875 ) ) ( not ( = ?auto_806872 ?auto_806876 ) ) ( not ( = ?auto_806872 ?auto_806877 ) ) ( not ( = ?auto_806872 ?auto_806878 ) ) ( not ( = ?auto_806872 ?auto_806879 ) ) ( not ( = ?auto_806872 ?auto_806880 ) ) ( not ( = ?auto_806872 ?auto_806881 ) ) ( not ( = ?auto_806872 ?auto_806882 ) ) ( not ( = ?auto_806872 ?auto_806883 ) ) ( not ( = ?auto_806872 ?auto_806884 ) ) ( not ( = ?auto_806872 ?auto_806885 ) ) ( not ( = ?auto_806872 ?auto_806886 ) ) ( not ( = ?auto_806872 ?auto_806887 ) ) ( not ( = ?auto_806873 ?auto_806874 ) ) ( not ( = ?auto_806873 ?auto_806875 ) ) ( not ( = ?auto_806873 ?auto_806876 ) ) ( not ( = ?auto_806873 ?auto_806877 ) ) ( not ( = ?auto_806873 ?auto_806878 ) ) ( not ( = ?auto_806873 ?auto_806879 ) ) ( not ( = ?auto_806873 ?auto_806880 ) ) ( not ( = ?auto_806873 ?auto_806881 ) ) ( not ( = ?auto_806873 ?auto_806882 ) ) ( not ( = ?auto_806873 ?auto_806883 ) ) ( not ( = ?auto_806873 ?auto_806884 ) ) ( not ( = ?auto_806873 ?auto_806885 ) ) ( not ( = ?auto_806873 ?auto_806886 ) ) ( not ( = ?auto_806873 ?auto_806887 ) ) ( not ( = ?auto_806874 ?auto_806875 ) ) ( not ( = ?auto_806874 ?auto_806876 ) ) ( not ( = ?auto_806874 ?auto_806877 ) ) ( not ( = ?auto_806874 ?auto_806878 ) ) ( not ( = ?auto_806874 ?auto_806879 ) ) ( not ( = ?auto_806874 ?auto_806880 ) ) ( not ( = ?auto_806874 ?auto_806881 ) ) ( not ( = ?auto_806874 ?auto_806882 ) ) ( not ( = ?auto_806874 ?auto_806883 ) ) ( not ( = ?auto_806874 ?auto_806884 ) ) ( not ( = ?auto_806874 ?auto_806885 ) ) ( not ( = ?auto_806874 ?auto_806886 ) ) ( not ( = ?auto_806874 ?auto_806887 ) ) ( not ( = ?auto_806875 ?auto_806876 ) ) ( not ( = ?auto_806875 ?auto_806877 ) ) ( not ( = ?auto_806875 ?auto_806878 ) ) ( not ( = ?auto_806875 ?auto_806879 ) ) ( not ( = ?auto_806875 ?auto_806880 ) ) ( not ( = ?auto_806875 ?auto_806881 ) ) ( not ( = ?auto_806875 ?auto_806882 ) ) ( not ( = ?auto_806875 ?auto_806883 ) ) ( not ( = ?auto_806875 ?auto_806884 ) ) ( not ( = ?auto_806875 ?auto_806885 ) ) ( not ( = ?auto_806875 ?auto_806886 ) ) ( not ( = ?auto_806875 ?auto_806887 ) ) ( not ( = ?auto_806876 ?auto_806877 ) ) ( not ( = ?auto_806876 ?auto_806878 ) ) ( not ( = ?auto_806876 ?auto_806879 ) ) ( not ( = ?auto_806876 ?auto_806880 ) ) ( not ( = ?auto_806876 ?auto_806881 ) ) ( not ( = ?auto_806876 ?auto_806882 ) ) ( not ( = ?auto_806876 ?auto_806883 ) ) ( not ( = ?auto_806876 ?auto_806884 ) ) ( not ( = ?auto_806876 ?auto_806885 ) ) ( not ( = ?auto_806876 ?auto_806886 ) ) ( not ( = ?auto_806876 ?auto_806887 ) ) ( not ( = ?auto_806877 ?auto_806878 ) ) ( not ( = ?auto_806877 ?auto_806879 ) ) ( not ( = ?auto_806877 ?auto_806880 ) ) ( not ( = ?auto_806877 ?auto_806881 ) ) ( not ( = ?auto_806877 ?auto_806882 ) ) ( not ( = ?auto_806877 ?auto_806883 ) ) ( not ( = ?auto_806877 ?auto_806884 ) ) ( not ( = ?auto_806877 ?auto_806885 ) ) ( not ( = ?auto_806877 ?auto_806886 ) ) ( not ( = ?auto_806877 ?auto_806887 ) ) ( not ( = ?auto_806878 ?auto_806879 ) ) ( not ( = ?auto_806878 ?auto_806880 ) ) ( not ( = ?auto_806878 ?auto_806881 ) ) ( not ( = ?auto_806878 ?auto_806882 ) ) ( not ( = ?auto_806878 ?auto_806883 ) ) ( not ( = ?auto_806878 ?auto_806884 ) ) ( not ( = ?auto_806878 ?auto_806885 ) ) ( not ( = ?auto_806878 ?auto_806886 ) ) ( not ( = ?auto_806878 ?auto_806887 ) ) ( not ( = ?auto_806879 ?auto_806880 ) ) ( not ( = ?auto_806879 ?auto_806881 ) ) ( not ( = ?auto_806879 ?auto_806882 ) ) ( not ( = ?auto_806879 ?auto_806883 ) ) ( not ( = ?auto_806879 ?auto_806884 ) ) ( not ( = ?auto_806879 ?auto_806885 ) ) ( not ( = ?auto_806879 ?auto_806886 ) ) ( not ( = ?auto_806879 ?auto_806887 ) ) ( not ( = ?auto_806880 ?auto_806881 ) ) ( not ( = ?auto_806880 ?auto_806882 ) ) ( not ( = ?auto_806880 ?auto_806883 ) ) ( not ( = ?auto_806880 ?auto_806884 ) ) ( not ( = ?auto_806880 ?auto_806885 ) ) ( not ( = ?auto_806880 ?auto_806886 ) ) ( not ( = ?auto_806880 ?auto_806887 ) ) ( not ( = ?auto_806881 ?auto_806882 ) ) ( not ( = ?auto_806881 ?auto_806883 ) ) ( not ( = ?auto_806881 ?auto_806884 ) ) ( not ( = ?auto_806881 ?auto_806885 ) ) ( not ( = ?auto_806881 ?auto_806886 ) ) ( not ( = ?auto_806881 ?auto_806887 ) ) ( not ( = ?auto_806882 ?auto_806883 ) ) ( not ( = ?auto_806882 ?auto_806884 ) ) ( not ( = ?auto_806882 ?auto_806885 ) ) ( not ( = ?auto_806882 ?auto_806886 ) ) ( not ( = ?auto_806882 ?auto_806887 ) ) ( not ( = ?auto_806883 ?auto_806884 ) ) ( not ( = ?auto_806883 ?auto_806885 ) ) ( not ( = ?auto_806883 ?auto_806886 ) ) ( not ( = ?auto_806883 ?auto_806887 ) ) ( not ( = ?auto_806884 ?auto_806885 ) ) ( not ( = ?auto_806884 ?auto_806886 ) ) ( not ( = ?auto_806884 ?auto_806887 ) ) ( not ( = ?auto_806885 ?auto_806886 ) ) ( not ( = ?auto_806885 ?auto_806887 ) ) ( not ( = ?auto_806886 ?auto_806887 ) ) ( ON ?auto_806885 ?auto_806886 ) ( ON ?auto_806884 ?auto_806885 ) ( ON ?auto_806883 ?auto_806884 ) ( ON ?auto_806882 ?auto_806883 ) ( ON ?auto_806881 ?auto_806882 ) ( CLEAR ?auto_806879 ) ( ON ?auto_806880 ?auto_806881 ) ( CLEAR ?auto_806880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_806871 ?auto_806872 ?auto_806873 ?auto_806874 ?auto_806875 ?auto_806876 ?auto_806877 ?auto_806878 ?auto_806879 ?auto_806880 )
      ( MAKE-16PILE ?auto_806871 ?auto_806872 ?auto_806873 ?auto_806874 ?auto_806875 ?auto_806876 ?auto_806877 ?auto_806878 ?auto_806879 ?auto_806880 ?auto_806881 ?auto_806882 ?auto_806883 ?auto_806884 ?auto_806885 ?auto_806886 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_806937 - BLOCK
      ?auto_806938 - BLOCK
      ?auto_806939 - BLOCK
      ?auto_806940 - BLOCK
      ?auto_806941 - BLOCK
      ?auto_806942 - BLOCK
      ?auto_806943 - BLOCK
      ?auto_806944 - BLOCK
      ?auto_806945 - BLOCK
      ?auto_806946 - BLOCK
      ?auto_806947 - BLOCK
      ?auto_806948 - BLOCK
      ?auto_806949 - BLOCK
      ?auto_806950 - BLOCK
      ?auto_806951 - BLOCK
      ?auto_806952 - BLOCK
    )
    :vars
    (
      ?auto_806953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_806952 ?auto_806953 ) ( ON-TABLE ?auto_806937 ) ( ON ?auto_806938 ?auto_806937 ) ( ON ?auto_806939 ?auto_806938 ) ( ON ?auto_806940 ?auto_806939 ) ( ON ?auto_806941 ?auto_806940 ) ( ON ?auto_806942 ?auto_806941 ) ( ON ?auto_806943 ?auto_806942 ) ( ON ?auto_806944 ?auto_806943 ) ( not ( = ?auto_806937 ?auto_806938 ) ) ( not ( = ?auto_806937 ?auto_806939 ) ) ( not ( = ?auto_806937 ?auto_806940 ) ) ( not ( = ?auto_806937 ?auto_806941 ) ) ( not ( = ?auto_806937 ?auto_806942 ) ) ( not ( = ?auto_806937 ?auto_806943 ) ) ( not ( = ?auto_806937 ?auto_806944 ) ) ( not ( = ?auto_806937 ?auto_806945 ) ) ( not ( = ?auto_806937 ?auto_806946 ) ) ( not ( = ?auto_806937 ?auto_806947 ) ) ( not ( = ?auto_806937 ?auto_806948 ) ) ( not ( = ?auto_806937 ?auto_806949 ) ) ( not ( = ?auto_806937 ?auto_806950 ) ) ( not ( = ?auto_806937 ?auto_806951 ) ) ( not ( = ?auto_806937 ?auto_806952 ) ) ( not ( = ?auto_806937 ?auto_806953 ) ) ( not ( = ?auto_806938 ?auto_806939 ) ) ( not ( = ?auto_806938 ?auto_806940 ) ) ( not ( = ?auto_806938 ?auto_806941 ) ) ( not ( = ?auto_806938 ?auto_806942 ) ) ( not ( = ?auto_806938 ?auto_806943 ) ) ( not ( = ?auto_806938 ?auto_806944 ) ) ( not ( = ?auto_806938 ?auto_806945 ) ) ( not ( = ?auto_806938 ?auto_806946 ) ) ( not ( = ?auto_806938 ?auto_806947 ) ) ( not ( = ?auto_806938 ?auto_806948 ) ) ( not ( = ?auto_806938 ?auto_806949 ) ) ( not ( = ?auto_806938 ?auto_806950 ) ) ( not ( = ?auto_806938 ?auto_806951 ) ) ( not ( = ?auto_806938 ?auto_806952 ) ) ( not ( = ?auto_806938 ?auto_806953 ) ) ( not ( = ?auto_806939 ?auto_806940 ) ) ( not ( = ?auto_806939 ?auto_806941 ) ) ( not ( = ?auto_806939 ?auto_806942 ) ) ( not ( = ?auto_806939 ?auto_806943 ) ) ( not ( = ?auto_806939 ?auto_806944 ) ) ( not ( = ?auto_806939 ?auto_806945 ) ) ( not ( = ?auto_806939 ?auto_806946 ) ) ( not ( = ?auto_806939 ?auto_806947 ) ) ( not ( = ?auto_806939 ?auto_806948 ) ) ( not ( = ?auto_806939 ?auto_806949 ) ) ( not ( = ?auto_806939 ?auto_806950 ) ) ( not ( = ?auto_806939 ?auto_806951 ) ) ( not ( = ?auto_806939 ?auto_806952 ) ) ( not ( = ?auto_806939 ?auto_806953 ) ) ( not ( = ?auto_806940 ?auto_806941 ) ) ( not ( = ?auto_806940 ?auto_806942 ) ) ( not ( = ?auto_806940 ?auto_806943 ) ) ( not ( = ?auto_806940 ?auto_806944 ) ) ( not ( = ?auto_806940 ?auto_806945 ) ) ( not ( = ?auto_806940 ?auto_806946 ) ) ( not ( = ?auto_806940 ?auto_806947 ) ) ( not ( = ?auto_806940 ?auto_806948 ) ) ( not ( = ?auto_806940 ?auto_806949 ) ) ( not ( = ?auto_806940 ?auto_806950 ) ) ( not ( = ?auto_806940 ?auto_806951 ) ) ( not ( = ?auto_806940 ?auto_806952 ) ) ( not ( = ?auto_806940 ?auto_806953 ) ) ( not ( = ?auto_806941 ?auto_806942 ) ) ( not ( = ?auto_806941 ?auto_806943 ) ) ( not ( = ?auto_806941 ?auto_806944 ) ) ( not ( = ?auto_806941 ?auto_806945 ) ) ( not ( = ?auto_806941 ?auto_806946 ) ) ( not ( = ?auto_806941 ?auto_806947 ) ) ( not ( = ?auto_806941 ?auto_806948 ) ) ( not ( = ?auto_806941 ?auto_806949 ) ) ( not ( = ?auto_806941 ?auto_806950 ) ) ( not ( = ?auto_806941 ?auto_806951 ) ) ( not ( = ?auto_806941 ?auto_806952 ) ) ( not ( = ?auto_806941 ?auto_806953 ) ) ( not ( = ?auto_806942 ?auto_806943 ) ) ( not ( = ?auto_806942 ?auto_806944 ) ) ( not ( = ?auto_806942 ?auto_806945 ) ) ( not ( = ?auto_806942 ?auto_806946 ) ) ( not ( = ?auto_806942 ?auto_806947 ) ) ( not ( = ?auto_806942 ?auto_806948 ) ) ( not ( = ?auto_806942 ?auto_806949 ) ) ( not ( = ?auto_806942 ?auto_806950 ) ) ( not ( = ?auto_806942 ?auto_806951 ) ) ( not ( = ?auto_806942 ?auto_806952 ) ) ( not ( = ?auto_806942 ?auto_806953 ) ) ( not ( = ?auto_806943 ?auto_806944 ) ) ( not ( = ?auto_806943 ?auto_806945 ) ) ( not ( = ?auto_806943 ?auto_806946 ) ) ( not ( = ?auto_806943 ?auto_806947 ) ) ( not ( = ?auto_806943 ?auto_806948 ) ) ( not ( = ?auto_806943 ?auto_806949 ) ) ( not ( = ?auto_806943 ?auto_806950 ) ) ( not ( = ?auto_806943 ?auto_806951 ) ) ( not ( = ?auto_806943 ?auto_806952 ) ) ( not ( = ?auto_806943 ?auto_806953 ) ) ( not ( = ?auto_806944 ?auto_806945 ) ) ( not ( = ?auto_806944 ?auto_806946 ) ) ( not ( = ?auto_806944 ?auto_806947 ) ) ( not ( = ?auto_806944 ?auto_806948 ) ) ( not ( = ?auto_806944 ?auto_806949 ) ) ( not ( = ?auto_806944 ?auto_806950 ) ) ( not ( = ?auto_806944 ?auto_806951 ) ) ( not ( = ?auto_806944 ?auto_806952 ) ) ( not ( = ?auto_806944 ?auto_806953 ) ) ( not ( = ?auto_806945 ?auto_806946 ) ) ( not ( = ?auto_806945 ?auto_806947 ) ) ( not ( = ?auto_806945 ?auto_806948 ) ) ( not ( = ?auto_806945 ?auto_806949 ) ) ( not ( = ?auto_806945 ?auto_806950 ) ) ( not ( = ?auto_806945 ?auto_806951 ) ) ( not ( = ?auto_806945 ?auto_806952 ) ) ( not ( = ?auto_806945 ?auto_806953 ) ) ( not ( = ?auto_806946 ?auto_806947 ) ) ( not ( = ?auto_806946 ?auto_806948 ) ) ( not ( = ?auto_806946 ?auto_806949 ) ) ( not ( = ?auto_806946 ?auto_806950 ) ) ( not ( = ?auto_806946 ?auto_806951 ) ) ( not ( = ?auto_806946 ?auto_806952 ) ) ( not ( = ?auto_806946 ?auto_806953 ) ) ( not ( = ?auto_806947 ?auto_806948 ) ) ( not ( = ?auto_806947 ?auto_806949 ) ) ( not ( = ?auto_806947 ?auto_806950 ) ) ( not ( = ?auto_806947 ?auto_806951 ) ) ( not ( = ?auto_806947 ?auto_806952 ) ) ( not ( = ?auto_806947 ?auto_806953 ) ) ( not ( = ?auto_806948 ?auto_806949 ) ) ( not ( = ?auto_806948 ?auto_806950 ) ) ( not ( = ?auto_806948 ?auto_806951 ) ) ( not ( = ?auto_806948 ?auto_806952 ) ) ( not ( = ?auto_806948 ?auto_806953 ) ) ( not ( = ?auto_806949 ?auto_806950 ) ) ( not ( = ?auto_806949 ?auto_806951 ) ) ( not ( = ?auto_806949 ?auto_806952 ) ) ( not ( = ?auto_806949 ?auto_806953 ) ) ( not ( = ?auto_806950 ?auto_806951 ) ) ( not ( = ?auto_806950 ?auto_806952 ) ) ( not ( = ?auto_806950 ?auto_806953 ) ) ( not ( = ?auto_806951 ?auto_806952 ) ) ( not ( = ?auto_806951 ?auto_806953 ) ) ( not ( = ?auto_806952 ?auto_806953 ) ) ( ON ?auto_806951 ?auto_806952 ) ( ON ?auto_806950 ?auto_806951 ) ( ON ?auto_806949 ?auto_806950 ) ( ON ?auto_806948 ?auto_806949 ) ( ON ?auto_806947 ?auto_806948 ) ( ON ?auto_806946 ?auto_806947 ) ( CLEAR ?auto_806944 ) ( ON ?auto_806945 ?auto_806946 ) ( CLEAR ?auto_806945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_806937 ?auto_806938 ?auto_806939 ?auto_806940 ?auto_806941 ?auto_806942 ?auto_806943 ?auto_806944 ?auto_806945 )
      ( MAKE-16PILE ?auto_806937 ?auto_806938 ?auto_806939 ?auto_806940 ?auto_806941 ?auto_806942 ?auto_806943 ?auto_806944 ?auto_806945 ?auto_806946 ?auto_806947 ?auto_806948 ?auto_806949 ?auto_806950 ?auto_806951 ?auto_806952 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807003 - BLOCK
      ?auto_807004 - BLOCK
      ?auto_807005 - BLOCK
      ?auto_807006 - BLOCK
      ?auto_807007 - BLOCK
      ?auto_807008 - BLOCK
      ?auto_807009 - BLOCK
      ?auto_807010 - BLOCK
      ?auto_807011 - BLOCK
      ?auto_807012 - BLOCK
      ?auto_807013 - BLOCK
      ?auto_807014 - BLOCK
      ?auto_807015 - BLOCK
      ?auto_807016 - BLOCK
      ?auto_807017 - BLOCK
      ?auto_807018 - BLOCK
    )
    :vars
    (
      ?auto_807019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807018 ?auto_807019 ) ( ON-TABLE ?auto_807003 ) ( ON ?auto_807004 ?auto_807003 ) ( ON ?auto_807005 ?auto_807004 ) ( ON ?auto_807006 ?auto_807005 ) ( ON ?auto_807007 ?auto_807006 ) ( ON ?auto_807008 ?auto_807007 ) ( ON ?auto_807009 ?auto_807008 ) ( not ( = ?auto_807003 ?auto_807004 ) ) ( not ( = ?auto_807003 ?auto_807005 ) ) ( not ( = ?auto_807003 ?auto_807006 ) ) ( not ( = ?auto_807003 ?auto_807007 ) ) ( not ( = ?auto_807003 ?auto_807008 ) ) ( not ( = ?auto_807003 ?auto_807009 ) ) ( not ( = ?auto_807003 ?auto_807010 ) ) ( not ( = ?auto_807003 ?auto_807011 ) ) ( not ( = ?auto_807003 ?auto_807012 ) ) ( not ( = ?auto_807003 ?auto_807013 ) ) ( not ( = ?auto_807003 ?auto_807014 ) ) ( not ( = ?auto_807003 ?auto_807015 ) ) ( not ( = ?auto_807003 ?auto_807016 ) ) ( not ( = ?auto_807003 ?auto_807017 ) ) ( not ( = ?auto_807003 ?auto_807018 ) ) ( not ( = ?auto_807003 ?auto_807019 ) ) ( not ( = ?auto_807004 ?auto_807005 ) ) ( not ( = ?auto_807004 ?auto_807006 ) ) ( not ( = ?auto_807004 ?auto_807007 ) ) ( not ( = ?auto_807004 ?auto_807008 ) ) ( not ( = ?auto_807004 ?auto_807009 ) ) ( not ( = ?auto_807004 ?auto_807010 ) ) ( not ( = ?auto_807004 ?auto_807011 ) ) ( not ( = ?auto_807004 ?auto_807012 ) ) ( not ( = ?auto_807004 ?auto_807013 ) ) ( not ( = ?auto_807004 ?auto_807014 ) ) ( not ( = ?auto_807004 ?auto_807015 ) ) ( not ( = ?auto_807004 ?auto_807016 ) ) ( not ( = ?auto_807004 ?auto_807017 ) ) ( not ( = ?auto_807004 ?auto_807018 ) ) ( not ( = ?auto_807004 ?auto_807019 ) ) ( not ( = ?auto_807005 ?auto_807006 ) ) ( not ( = ?auto_807005 ?auto_807007 ) ) ( not ( = ?auto_807005 ?auto_807008 ) ) ( not ( = ?auto_807005 ?auto_807009 ) ) ( not ( = ?auto_807005 ?auto_807010 ) ) ( not ( = ?auto_807005 ?auto_807011 ) ) ( not ( = ?auto_807005 ?auto_807012 ) ) ( not ( = ?auto_807005 ?auto_807013 ) ) ( not ( = ?auto_807005 ?auto_807014 ) ) ( not ( = ?auto_807005 ?auto_807015 ) ) ( not ( = ?auto_807005 ?auto_807016 ) ) ( not ( = ?auto_807005 ?auto_807017 ) ) ( not ( = ?auto_807005 ?auto_807018 ) ) ( not ( = ?auto_807005 ?auto_807019 ) ) ( not ( = ?auto_807006 ?auto_807007 ) ) ( not ( = ?auto_807006 ?auto_807008 ) ) ( not ( = ?auto_807006 ?auto_807009 ) ) ( not ( = ?auto_807006 ?auto_807010 ) ) ( not ( = ?auto_807006 ?auto_807011 ) ) ( not ( = ?auto_807006 ?auto_807012 ) ) ( not ( = ?auto_807006 ?auto_807013 ) ) ( not ( = ?auto_807006 ?auto_807014 ) ) ( not ( = ?auto_807006 ?auto_807015 ) ) ( not ( = ?auto_807006 ?auto_807016 ) ) ( not ( = ?auto_807006 ?auto_807017 ) ) ( not ( = ?auto_807006 ?auto_807018 ) ) ( not ( = ?auto_807006 ?auto_807019 ) ) ( not ( = ?auto_807007 ?auto_807008 ) ) ( not ( = ?auto_807007 ?auto_807009 ) ) ( not ( = ?auto_807007 ?auto_807010 ) ) ( not ( = ?auto_807007 ?auto_807011 ) ) ( not ( = ?auto_807007 ?auto_807012 ) ) ( not ( = ?auto_807007 ?auto_807013 ) ) ( not ( = ?auto_807007 ?auto_807014 ) ) ( not ( = ?auto_807007 ?auto_807015 ) ) ( not ( = ?auto_807007 ?auto_807016 ) ) ( not ( = ?auto_807007 ?auto_807017 ) ) ( not ( = ?auto_807007 ?auto_807018 ) ) ( not ( = ?auto_807007 ?auto_807019 ) ) ( not ( = ?auto_807008 ?auto_807009 ) ) ( not ( = ?auto_807008 ?auto_807010 ) ) ( not ( = ?auto_807008 ?auto_807011 ) ) ( not ( = ?auto_807008 ?auto_807012 ) ) ( not ( = ?auto_807008 ?auto_807013 ) ) ( not ( = ?auto_807008 ?auto_807014 ) ) ( not ( = ?auto_807008 ?auto_807015 ) ) ( not ( = ?auto_807008 ?auto_807016 ) ) ( not ( = ?auto_807008 ?auto_807017 ) ) ( not ( = ?auto_807008 ?auto_807018 ) ) ( not ( = ?auto_807008 ?auto_807019 ) ) ( not ( = ?auto_807009 ?auto_807010 ) ) ( not ( = ?auto_807009 ?auto_807011 ) ) ( not ( = ?auto_807009 ?auto_807012 ) ) ( not ( = ?auto_807009 ?auto_807013 ) ) ( not ( = ?auto_807009 ?auto_807014 ) ) ( not ( = ?auto_807009 ?auto_807015 ) ) ( not ( = ?auto_807009 ?auto_807016 ) ) ( not ( = ?auto_807009 ?auto_807017 ) ) ( not ( = ?auto_807009 ?auto_807018 ) ) ( not ( = ?auto_807009 ?auto_807019 ) ) ( not ( = ?auto_807010 ?auto_807011 ) ) ( not ( = ?auto_807010 ?auto_807012 ) ) ( not ( = ?auto_807010 ?auto_807013 ) ) ( not ( = ?auto_807010 ?auto_807014 ) ) ( not ( = ?auto_807010 ?auto_807015 ) ) ( not ( = ?auto_807010 ?auto_807016 ) ) ( not ( = ?auto_807010 ?auto_807017 ) ) ( not ( = ?auto_807010 ?auto_807018 ) ) ( not ( = ?auto_807010 ?auto_807019 ) ) ( not ( = ?auto_807011 ?auto_807012 ) ) ( not ( = ?auto_807011 ?auto_807013 ) ) ( not ( = ?auto_807011 ?auto_807014 ) ) ( not ( = ?auto_807011 ?auto_807015 ) ) ( not ( = ?auto_807011 ?auto_807016 ) ) ( not ( = ?auto_807011 ?auto_807017 ) ) ( not ( = ?auto_807011 ?auto_807018 ) ) ( not ( = ?auto_807011 ?auto_807019 ) ) ( not ( = ?auto_807012 ?auto_807013 ) ) ( not ( = ?auto_807012 ?auto_807014 ) ) ( not ( = ?auto_807012 ?auto_807015 ) ) ( not ( = ?auto_807012 ?auto_807016 ) ) ( not ( = ?auto_807012 ?auto_807017 ) ) ( not ( = ?auto_807012 ?auto_807018 ) ) ( not ( = ?auto_807012 ?auto_807019 ) ) ( not ( = ?auto_807013 ?auto_807014 ) ) ( not ( = ?auto_807013 ?auto_807015 ) ) ( not ( = ?auto_807013 ?auto_807016 ) ) ( not ( = ?auto_807013 ?auto_807017 ) ) ( not ( = ?auto_807013 ?auto_807018 ) ) ( not ( = ?auto_807013 ?auto_807019 ) ) ( not ( = ?auto_807014 ?auto_807015 ) ) ( not ( = ?auto_807014 ?auto_807016 ) ) ( not ( = ?auto_807014 ?auto_807017 ) ) ( not ( = ?auto_807014 ?auto_807018 ) ) ( not ( = ?auto_807014 ?auto_807019 ) ) ( not ( = ?auto_807015 ?auto_807016 ) ) ( not ( = ?auto_807015 ?auto_807017 ) ) ( not ( = ?auto_807015 ?auto_807018 ) ) ( not ( = ?auto_807015 ?auto_807019 ) ) ( not ( = ?auto_807016 ?auto_807017 ) ) ( not ( = ?auto_807016 ?auto_807018 ) ) ( not ( = ?auto_807016 ?auto_807019 ) ) ( not ( = ?auto_807017 ?auto_807018 ) ) ( not ( = ?auto_807017 ?auto_807019 ) ) ( not ( = ?auto_807018 ?auto_807019 ) ) ( ON ?auto_807017 ?auto_807018 ) ( ON ?auto_807016 ?auto_807017 ) ( ON ?auto_807015 ?auto_807016 ) ( ON ?auto_807014 ?auto_807015 ) ( ON ?auto_807013 ?auto_807014 ) ( ON ?auto_807012 ?auto_807013 ) ( ON ?auto_807011 ?auto_807012 ) ( CLEAR ?auto_807009 ) ( ON ?auto_807010 ?auto_807011 ) ( CLEAR ?auto_807010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_807003 ?auto_807004 ?auto_807005 ?auto_807006 ?auto_807007 ?auto_807008 ?auto_807009 ?auto_807010 )
      ( MAKE-16PILE ?auto_807003 ?auto_807004 ?auto_807005 ?auto_807006 ?auto_807007 ?auto_807008 ?auto_807009 ?auto_807010 ?auto_807011 ?auto_807012 ?auto_807013 ?auto_807014 ?auto_807015 ?auto_807016 ?auto_807017 ?auto_807018 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807069 - BLOCK
      ?auto_807070 - BLOCK
      ?auto_807071 - BLOCK
      ?auto_807072 - BLOCK
      ?auto_807073 - BLOCK
      ?auto_807074 - BLOCK
      ?auto_807075 - BLOCK
      ?auto_807076 - BLOCK
      ?auto_807077 - BLOCK
      ?auto_807078 - BLOCK
      ?auto_807079 - BLOCK
      ?auto_807080 - BLOCK
      ?auto_807081 - BLOCK
      ?auto_807082 - BLOCK
      ?auto_807083 - BLOCK
      ?auto_807084 - BLOCK
    )
    :vars
    (
      ?auto_807085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807084 ?auto_807085 ) ( ON-TABLE ?auto_807069 ) ( ON ?auto_807070 ?auto_807069 ) ( ON ?auto_807071 ?auto_807070 ) ( ON ?auto_807072 ?auto_807071 ) ( ON ?auto_807073 ?auto_807072 ) ( ON ?auto_807074 ?auto_807073 ) ( not ( = ?auto_807069 ?auto_807070 ) ) ( not ( = ?auto_807069 ?auto_807071 ) ) ( not ( = ?auto_807069 ?auto_807072 ) ) ( not ( = ?auto_807069 ?auto_807073 ) ) ( not ( = ?auto_807069 ?auto_807074 ) ) ( not ( = ?auto_807069 ?auto_807075 ) ) ( not ( = ?auto_807069 ?auto_807076 ) ) ( not ( = ?auto_807069 ?auto_807077 ) ) ( not ( = ?auto_807069 ?auto_807078 ) ) ( not ( = ?auto_807069 ?auto_807079 ) ) ( not ( = ?auto_807069 ?auto_807080 ) ) ( not ( = ?auto_807069 ?auto_807081 ) ) ( not ( = ?auto_807069 ?auto_807082 ) ) ( not ( = ?auto_807069 ?auto_807083 ) ) ( not ( = ?auto_807069 ?auto_807084 ) ) ( not ( = ?auto_807069 ?auto_807085 ) ) ( not ( = ?auto_807070 ?auto_807071 ) ) ( not ( = ?auto_807070 ?auto_807072 ) ) ( not ( = ?auto_807070 ?auto_807073 ) ) ( not ( = ?auto_807070 ?auto_807074 ) ) ( not ( = ?auto_807070 ?auto_807075 ) ) ( not ( = ?auto_807070 ?auto_807076 ) ) ( not ( = ?auto_807070 ?auto_807077 ) ) ( not ( = ?auto_807070 ?auto_807078 ) ) ( not ( = ?auto_807070 ?auto_807079 ) ) ( not ( = ?auto_807070 ?auto_807080 ) ) ( not ( = ?auto_807070 ?auto_807081 ) ) ( not ( = ?auto_807070 ?auto_807082 ) ) ( not ( = ?auto_807070 ?auto_807083 ) ) ( not ( = ?auto_807070 ?auto_807084 ) ) ( not ( = ?auto_807070 ?auto_807085 ) ) ( not ( = ?auto_807071 ?auto_807072 ) ) ( not ( = ?auto_807071 ?auto_807073 ) ) ( not ( = ?auto_807071 ?auto_807074 ) ) ( not ( = ?auto_807071 ?auto_807075 ) ) ( not ( = ?auto_807071 ?auto_807076 ) ) ( not ( = ?auto_807071 ?auto_807077 ) ) ( not ( = ?auto_807071 ?auto_807078 ) ) ( not ( = ?auto_807071 ?auto_807079 ) ) ( not ( = ?auto_807071 ?auto_807080 ) ) ( not ( = ?auto_807071 ?auto_807081 ) ) ( not ( = ?auto_807071 ?auto_807082 ) ) ( not ( = ?auto_807071 ?auto_807083 ) ) ( not ( = ?auto_807071 ?auto_807084 ) ) ( not ( = ?auto_807071 ?auto_807085 ) ) ( not ( = ?auto_807072 ?auto_807073 ) ) ( not ( = ?auto_807072 ?auto_807074 ) ) ( not ( = ?auto_807072 ?auto_807075 ) ) ( not ( = ?auto_807072 ?auto_807076 ) ) ( not ( = ?auto_807072 ?auto_807077 ) ) ( not ( = ?auto_807072 ?auto_807078 ) ) ( not ( = ?auto_807072 ?auto_807079 ) ) ( not ( = ?auto_807072 ?auto_807080 ) ) ( not ( = ?auto_807072 ?auto_807081 ) ) ( not ( = ?auto_807072 ?auto_807082 ) ) ( not ( = ?auto_807072 ?auto_807083 ) ) ( not ( = ?auto_807072 ?auto_807084 ) ) ( not ( = ?auto_807072 ?auto_807085 ) ) ( not ( = ?auto_807073 ?auto_807074 ) ) ( not ( = ?auto_807073 ?auto_807075 ) ) ( not ( = ?auto_807073 ?auto_807076 ) ) ( not ( = ?auto_807073 ?auto_807077 ) ) ( not ( = ?auto_807073 ?auto_807078 ) ) ( not ( = ?auto_807073 ?auto_807079 ) ) ( not ( = ?auto_807073 ?auto_807080 ) ) ( not ( = ?auto_807073 ?auto_807081 ) ) ( not ( = ?auto_807073 ?auto_807082 ) ) ( not ( = ?auto_807073 ?auto_807083 ) ) ( not ( = ?auto_807073 ?auto_807084 ) ) ( not ( = ?auto_807073 ?auto_807085 ) ) ( not ( = ?auto_807074 ?auto_807075 ) ) ( not ( = ?auto_807074 ?auto_807076 ) ) ( not ( = ?auto_807074 ?auto_807077 ) ) ( not ( = ?auto_807074 ?auto_807078 ) ) ( not ( = ?auto_807074 ?auto_807079 ) ) ( not ( = ?auto_807074 ?auto_807080 ) ) ( not ( = ?auto_807074 ?auto_807081 ) ) ( not ( = ?auto_807074 ?auto_807082 ) ) ( not ( = ?auto_807074 ?auto_807083 ) ) ( not ( = ?auto_807074 ?auto_807084 ) ) ( not ( = ?auto_807074 ?auto_807085 ) ) ( not ( = ?auto_807075 ?auto_807076 ) ) ( not ( = ?auto_807075 ?auto_807077 ) ) ( not ( = ?auto_807075 ?auto_807078 ) ) ( not ( = ?auto_807075 ?auto_807079 ) ) ( not ( = ?auto_807075 ?auto_807080 ) ) ( not ( = ?auto_807075 ?auto_807081 ) ) ( not ( = ?auto_807075 ?auto_807082 ) ) ( not ( = ?auto_807075 ?auto_807083 ) ) ( not ( = ?auto_807075 ?auto_807084 ) ) ( not ( = ?auto_807075 ?auto_807085 ) ) ( not ( = ?auto_807076 ?auto_807077 ) ) ( not ( = ?auto_807076 ?auto_807078 ) ) ( not ( = ?auto_807076 ?auto_807079 ) ) ( not ( = ?auto_807076 ?auto_807080 ) ) ( not ( = ?auto_807076 ?auto_807081 ) ) ( not ( = ?auto_807076 ?auto_807082 ) ) ( not ( = ?auto_807076 ?auto_807083 ) ) ( not ( = ?auto_807076 ?auto_807084 ) ) ( not ( = ?auto_807076 ?auto_807085 ) ) ( not ( = ?auto_807077 ?auto_807078 ) ) ( not ( = ?auto_807077 ?auto_807079 ) ) ( not ( = ?auto_807077 ?auto_807080 ) ) ( not ( = ?auto_807077 ?auto_807081 ) ) ( not ( = ?auto_807077 ?auto_807082 ) ) ( not ( = ?auto_807077 ?auto_807083 ) ) ( not ( = ?auto_807077 ?auto_807084 ) ) ( not ( = ?auto_807077 ?auto_807085 ) ) ( not ( = ?auto_807078 ?auto_807079 ) ) ( not ( = ?auto_807078 ?auto_807080 ) ) ( not ( = ?auto_807078 ?auto_807081 ) ) ( not ( = ?auto_807078 ?auto_807082 ) ) ( not ( = ?auto_807078 ?auto_807083 ) ) ( not ( = ?auto_807078 ?auto_807084 ) ) ( not ( = ?auto_807078 ?auto_807085 ) ) ( not ( = ?auto_807079 ?auto_807080 ) ) ( not ( = ?auto_807079 ?auto_807081 ) ) ( not ( = ?auto_807079 ?auto_807082 ) ) ( not ( = ?auto_807079 ?auto_807083 ) ) ( not ( = ?auto_807079 ?auto_807084 ) ) ( not ( = ?auto_807079 ?auto_807085 ) ) ( not ( = ?auto_807080 ?auto_807081 ) ) ( not ( = ?auto_807080 ?auto_807082 ) ) ( not ( = ?auto_807080 ?auto_807083 ) ) ( not ( = ?auto_807080 ?auto_807084 ) ) ( not ( = ?auto_807080 ?auto_807085 ) ) ( not ( = ?auto_807081 ?auto_807082 ) ) ( not ( = ?auto_807081 ?auto_807083 ) ) ( not ( = ?auto_807081 ?auto_807084 ) ) ( not ( = ?auto_807081 ?auto_807085 ) ) ( not ( = ?auto_807082 ?auto_807083 ) ) ( not ( = ?auto_807082 ?auto_807084 ) ) ( not ( = ?auto_807082 ?auto_807085 ) ) ( not ( = ?auto_807083 ?auto_807084 ) ) ( not ( = ?auto_807083 ?auto_807085 ) ) ( not ( = ?auto_807084 ?auto_807085 ) ) ( ON ?auto_807083 ?auto_807084 ) ( ON ?auto_807082 ?auto_807083 ) ( ON ?auto_807081 ?auto_807082 ) ( ON ?auto_807080 ?auto_807081 ) ( ON ?auto_807079 ?auto_807080 ) ( ON ?auto_807078 ?auto_807079 ) ( ON ?auto_807077 ?auto_807078 ) ( ON ?auto_807076 ?auto_807077 ) ( CLEAR ?auto_807074 ) ( ON ?auto_807075 ?auto_807076 ) ( CLEAR ?auto_807075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_807069 ?auto_807070 ?auto_807071 ?auto_807072 ?auto_807073 ?auto_807074 ?auto_807075 )
      ( MAKE-16PILE ?auto_807069 ?auto_807070 ?auto_807071 ?auto_807072 ?auto_807073 ?auto_807074 ?auto_807075 ?auto_807076 ?auto_807077 ?auto_807078 ?auto_807079 ?auto_807080 ?auto_807081 ?auto_807082 ?auto_807083 ?auto_807084 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807135 - BLOCK
      ?auto_807136 - BLOCK
      ?auto_807137 - BLOCK
      ?auto_807138 - BLOCK
      ?auto_807139 - BLOCK
      ?auto_807140 - BLOCK
      ?auto_807141 - BLOCK
      ?auto_807142 - BLOCK
      ?auto_807143 - BLOCK
      ?auto_807144 - BLOCK
      ?auto_807145 - BLOCK
      ?auto_807146 - BLOCK
      ?auto_807147 - BLOCK
      ?auto_807148 - BLOCK
      ?auto_807149 - BLOCK
      ?auto_807150 - BLOCK
    )
    :vars
    (
      ?auto_807151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807150 ?auto_807151 ) ( ON-TABLE ?auto_807135 ) ( ON ?auto_807136 ?auto_807135 ) ( ON ?auto_807137 ?auto_807136 ) ( ON ?auto_807138 ?auto_807137 ) ( ON ?auto_807139 ?auto_807138 ) ( not ( = ?auto_807135 ?auto_807136 ) ) ( not ( = ?auto_807135 ?auto_807137 ) ) ( not ( = ?auto_807135 ?auto_807138 ) ) ( not ( = ?auto_807135 ?auto_807139 ) ) ( not ( = ?auto_807135 ?auto_807140 ) ) ( not ( = ?auto_807135 ?auto_807141 ) ) ( not ( = ?auto_807135 ?auto_807142 ) ) ( not ( = ?auto_807135 ?auto_807143 ) ) ( not ( = ?auto_807135 ?auto_807144 ) ) ( not ( = ?auto_807135 ?auto_807145 ) ) ( not ( = ?auto_807135 ?auto_807146 ) ) ( not ( = ?auto_807135 ?auto_807147 ) ) ( not ( = ?auto_807135 ?auto_807148 ) ) ( not ( = ?auto_807135 ?auto_807149 ) ) ( not ( = ?auto_807135 ?auto_807150 ) ) ( not ( = ?auto_807135 ?auto_807151 ) ) ( not ( = ?auto_807136 ?auto_807137 ) ) ( not ( = ?auto_807136 ?auto_807138 ) ) ( not ( = ?auto_807136 ?auto_807139 ) ) ( not ( = ?auto_807136 ?auto_807140 ) ) ( not ( = ?auto_807136 ?auto_807141 ) ) ( not ( = ?auto_807136 ?auto_807142 ) ) ( not ( = ?auto_807136 ?auto_807143 ) ) ( not ( = ?auto_807136 ?auto_807144 ) ) ( not ( = ?auto_807136 ?auto_807145 ) ) ( not ( = ?auto_807136 ?auto_807146 ) ) ( not ( = ?auto_807136 ?auto_807147 ) ) ( not ( = ?auto_807136 ?auto_807148 ) ) ( not ( = ?auto_807136 ?auto_807149 ) ) ( not ( = ?auto_807136 ?auto_807150 ) ) ( not ( = ?auto_807136 ?auto_807151 ) ) ( not ( = ?auto_807137 ?auto_807138 ) ) ( not ( = ?auto_807137 ?auto_807139 ) ) ( not ( = ?auto_807137 ?auto_807140 ) ) ( not ( = ?auto_807137 ?auto_807141 ) ) ( not ( = ?auto_807137 ?auto_807142 ) ) ( not ( = ?auto_807137 ?auto_807143 ) ) ( not ( = ?auto_807137 ?auto_807144 ) ) ( not ( = ?auto_807137 ?auto_807145 ) ) ( not ( = ?auto_807137 ?auto_807146 ) ) ( not ( = ?auto_807137 ?auto_807147 ) ) ( not ( = ?auto_807137 ?auto_807148 ) ) ( not ( = ?auto_807137 ?auto_807149 ) ) ( not ( = ?auto_807137 ?auto_807150 ) ) ( not ( = ?auto_807137 ?auto_807151 ) ) ( not ( = ?auto_807138 ?auto_807139 ) ) ( not ( = ?auto_807138 ?auto_807140 ) ) ( not ( = ?auto_807138 ?auto_807141 ) ) ( not ( = ?auto_807138 ?auto_807142 ) ) ( not ( = ?auto_807138 ?auto_807143 ) ) ( not ( = ?auto_807138 ?auto_807144 ) ) ( not ( = ?auto_807138 ?auto_807145 ) ) ( not ( = ?auto_807138 ?auto_807146 ) ) ( not ( = ?auto_807138 ?auto_807147 ) ) ( not ( = ?auto_807138 ?auto_807148 ) ) ( not ( = ?auto_807138 ?auto_807149 ) ) ( not ( = ?auto_807138 ?auto_807150 ) ) ( not ( = ?auto_807138 ?auto_807151 ) ) ( not ( = ?auto_807139 ?auto_807140 ) ) ( not ( = ?auto_807139 ?auto_807141 ) ) ( not ( = ?auto_807139 ?auto_807142 ) ) ( not ( = ?auto_807139 ?auto_807143 ) ) ( not ( = ?auto_807139 ?auto_807144 ) ) ( not ( = ?auto_807139 ?auto_807145 ) ) ( not ( = ?auto_807139 ?auto_807146 ) ) ( not ( = ?auto_807139 ?auto_807147 ) ) ( not ( = ?auto_807139 ?auto_807148 ) ) ( not ( = ?auto_807139 ?auto_807149 ) ) ( not ( = ?auto_807139 ?auto_807150 ) ) ( not ( = ?auto_807139 ?auto_807151 ) ) ( not ( = ?auto_807140 ?auto_807141 ) ) ( not ( = ?auto_807140 ?auto_807142 ) ) ( not ( = ?auto_807140 ?auto_807143 ) ) ( not ( = ?auto_807140 ?auto_807144 ) ) ( not ( = ?auto_807140 ?auto_807145 ) ) ( not ( = ?auto_807140 ?auto_807146 ) ) ( not ( = ?auto_807140 ?auto_807147 ) ) ( not ( = ?auto_807140 ?auto_807148 ) ) ( not ( = ?auto_807140 ?auto_807149 ) ) ( not ( = ?auto_807140 ?auto_807150 ) ) ( not ( = ?auto_807140 ?auto_807151 ) ) ( not ( = ?auto_807141 ?auto_807142 ) ) ( not ( = ?auto_807141 ?auto_807143 ) ) ( not ( = ?auto_807141 ?auto_807144 ) ) ( not ( = ?auto_807141 ?auto_807145 ) ) ( not ( = ?auto_807141 ?auto_807146 ) ) ( not ( = ?auto_807141 ?auto_807147 ) ) ( not ( = ?auto_807141 ?auto_807148 ) ) ( not ( = ?auto_807141 ?auto_807149 ) ) ( not ( = ?auto_807141 ?auto_807150 ) ) ( not ( = ?auto_807141 ?auto_807151 ) ) ( not ( = ?auto_807142 ?auto_807143 ) ) ( not ( = ?auto_807142 ?auto_807144 ) ) ( not ( = ?auto_807142 ?auto_807145 ) ) ( not ( = ?auto_807142 ?auto_807146 ) ) ( not ( = ?auto_807142 ?auto_807147 ) ) ( not ( = ?auto_807142 ?auto_807148 ) ) ( not ( = ?auto_807142 ?auto_807149 ) ) ( not ( = ?auto_807142 ?auto_807150 ) ) ( not ( = ?auto_807142 ?auto_807151 ) ) ( not ( = ?auto_807143 ?auto_807144 ) ) ( not ( = ?auto_807143 ?auto_807145 ) ) ( not ( = ?auto_807143 ?auto_807146 ) ) ( not ( = ?auto_807143 ?auto_807147 ) ) ( not ( = ?auto_807143 ?auto_807148 ) ) ( not ( = ?auto_807143 ?auto_807149 ) ) ( not ( = ?auto_807143 ?auto_807150 ) ) ( not ( = ?auto_807143 ?auto_807151 ) ) ( not ( = ?auto_807144 ?auto_807145 ) ) ( not ( = ?auto_807144 ?auto_807146 ) ) ( not ( = ?auto_807144 ?auto_807147 ) ) ( not ( = ?auto_807144 ?auto_807148 ) ) ( not ( = ?auto_807144 ?auto_807149 ) ) ( not ( = ?auto_807144 ?auto_807150 ) ) ( not ( = ?auto_807144 ?auto_807151 ) ) ( not ( = ?auto_807145 ?auto_807146 ) ) ( not ( = ?auto_807145 ?auto_807147 ) ) ( not ( = ?auto_807145 ?auto_807148 ) ) ( not ( = ?auto_807145 ?auto_807149 ) ) ( not ( = ?auto_807145 ?auto_807150 ) ) ( not ( = ?auto_807145 ?auto_807151 ) ) ( not ( = ?auto_807146 ?auto_807147 ) ) ( not ( = ?auto_807146 ?auto_807148 ) ) ( not ( = ?auto_807146 ?auto_807149 ) ) ( not ( = ?auto_807146 ?auto_807150 ) ) ( not ( = ?auto_807146 ?auto_807151 ) ) ( not ( = ?auto_807147 ?auto_807148 ) ) ( not ( = ?auto_807147 ?auto_807149 ) ) ( not ( = ?auto_807147 ?auto_807150 ) ) ( not ( = ?auto_807147 ?auto_807151 ) ) ( not ( = ?auto_807148 ?auto_807149 ) ) ( not ( = ?auto_807148 ?auto_807150 ) ) ( not ( = ?auto_807148 ?auto_807151 ) ) ( not ( = ?auto_807149 ?auto_807150 ) ) ( not ( = ?auto_807149 ?auto_807151 ) ) ( not ( = ?auto_807150 ?auto_807151 ) ) ( ON ?auto_807149 ?auto_807150 ) ( ON ?auto_807148 ?auto_807149 ) ( ON ?auto_807147 ?auto_807148 ) ( ON ?auto_807146 ?auto_807147 ) ( ON ?auto_807145 ?auto_807146 ) ( ON ?auto_807144 ?auto_807145 ) ( ON ?auto_807143 ?auto_807144 ) ( ON ?auto_807142 ?auto_807143 ) ( ON ?auto_807141 ?auto_807142 ) ( CLEAR ?auto_807139 ) ( ON ?auto_807140 ?auto_807141 ) ( CLEAR ?auto_807140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_807135 ?auto_807136 ?auto_807137 ?auto_807138 ?auto_807139 ?auto_807140 )
      ( MAKE-16PILE ?auto_807135 ?auto_807136 ?auto_807137 ?auto_807138 ?auto_807139 ?auto_807140 ?auto_807141 ?auto_807142 ?auto_807143 ?auto_807144 ?auto_807145 ?auto_807146 ?auto_807147 ?auto_807148 ?auto_807149 ?auto_807150 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807201 - BLOCK
      ?auto_807202 - BLOCK
      ?auto_807203 - BLOCK
      ?auto_807204 - BLOCK
      ?auto_807205 - BLOCK
      ?auto_807206 - BLOCK
      ?auto_807207 - BLOCK
      ?auto_807208 - BLOCK
      ?auto_807209 - BLOCK
      ?auto_807210 - BLOCK
      ?auto_807211 - BLOCK
      ?auto_807212 - BLOCK
      ?auto_807213 - BLOCK
      ?auto_807214 - BLOCK
      ?auto_807215 - BLOCK
      ?auto_807216 - BLOCK
    )
    :vars
    (
      ?auto_807217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807216 ?auto_807217 ) ( ON-TABLE ?auto_807201 ) ( ON ?auto_807202 ?auto_807201 ) ( ON ?auto_807203 ?auto_807202 ) ( ON ?auto_807204 ?auto_807203 ) ( not ( = ?auto_807201 ?auto_807202 ) ) ( not ( = ?auto_807201 ?auto_807203 ) ) ( not ( = ?auto_807201 ?auto_807204 ) ) ( not ( = ?auto_807201 ?auto_807205 ) ) ( not ( = ?auto_807201 ?auto_807206 ) ) ( not ( = ?auto_807201 ?auto_807207 ) ) ( not ( = ?auto_807201 ?auto_807208 ) ) ( not ( = ?auto_807201 ?auto_807209 ) ) ( not ( = ?auto_807201 ?auto_807210 ) ) ( not ( = ?auto_807201 ?auto_807211 ) ) ( not ( = ?auto_807201 ?auto_807212 ) ) ( not ( = ?auto_807201 ?auto_807213 ) ) ( not ( = ?auto_807201 ?auto_807214 ) ) ( not ( = ?auto_807201 ?auto_807215 ) ) ( not ( = ?auto_807201 ?auto_807216 ) ) ( not ( = ?auto_807201 ?auto_807217 ) ) ( not ( = ?auto_807202 ?auto_807203 ) ) ( not ( = ?auto_807202 ?auto_807204 ) ) ( not ( = ?auto_807202 ?auto_807205 ) ) ( not ( = ?auto_807202 ?auto_807206 ) ) ( not ( = ?auto_807202 ?auto_807207 ) ) ( not ( = ?auto_807202 ?auto_807208 ) ) ( not ( = ?auto_807202 ?auto_807209 ) ) ( not ( = ?auto_807202 ?auto_807210 ) ) ( not ( = ?auto_807202 ?auto_807211 ) ) ( not ( = ?auto_807202 ?auto_807212 ) ) ( not ( = ?auto_807202 ?auto_807213 ) ) ( not ( = ?auto_807202 ?auto_807214 ) ) ( not ( = ?auto_807202 ?auto_807215 ) ) ( not ( = ?auto_807202 ?auto_807216 ) ) ( not ( = ?auto_807202 ?auto_807217 ) ) ( not ( = ?auto_807203 ?auto_807204 ) ) ( not ( = ?auto_807203 ?auto_807205 ) ) ( not ( = ?auto_807203 ?auto_807206 ) ) ( not ( = ?auto_807203 ?auto_807207 ) ) ( not ( = ?auto_807203 ?auto_807208 ) ) ( not ( = ?auto_807203 ?auto_807209 ) ) ( not ( = ?auto_807203 ?auto_807210 ) ) ( not ( = ?auto_807203 ?auto_807211 ) ) ( not ( = ?auto_807203 ?auto_807212 ) ) ( not ( = ?auto_807203 ?auto_807213 ) ) ( not ( = ?auto_807203 ?auto_807214 ) ) ( not ( = ?auto_807203 ?auto_807215 ) ) ( not ( = ?auto_807203 ?auto_807216 ) ) ( not ( = ?auto_807203 ?auto_807217 ) ) ( not ( = ?auto_807204 ?auto_807205 ) ) ( not ( = ?auto_807204 ?auto_807206 ) ) ( not ( = ?auto_807204 ?auto_807207 ) ) ( not ( = ?auto_807204 ?auto_807208 ) ) ( not ( = ?auto_807204 ?auto_807209 ) ) ( not ( = ?auto_807204 ?auto_807210 ) ) ( not ( = ?auto_807204 ?auto_807211 ) ) ( not ( = ?auto_807204 ?auto_807212 ) ) ( not ( = ?auto_807204 ?auto_807213 ) ) ( not ( = ?auto_807204 ?auto_807214 ) ) ( not ( = ?auto_807204 ?auto_807215 ) ) ( not ( = ?auto_807204 ?auto_807216 ) ) ( not ( = ?auto_807204 ?auto_807217 ) ) ( not ( = ?auto_807205 ?auto_807206 ) ) ( not ( = ?auto_807205 ?auto_807207 ) ) ( not ( = ?auto_807205 ?auto_807208 ) ) ( not ( = ?auto_807205 ?auto_807209 ) ) ( not ( = ?auto_807205 ?auto_807210 ) ) ( not ( = ?auto_807205 ?auto_807211 ) ) ( not ( = ?auto_807205 ?auto_807212 ) ) ( not ( = ?auto_807205 ?auto_807213 ) ) ( not ( = ?auto_807205 ?auto_807214 ) ) ( not ( = ?auto_807205 ?auto_807215 ) ) ( not ( = ?auto_807205 ?auto_807216 ) ) ( not ( = ?auto_807205 ?auto_807217 ) ) ( not ( = ?auto_807206 ?auto_807207 ) ) ( not ( = ?auto_807206 ?auto_807208 ) ) ( not ( = ?auto_807206 ?auto_807209 ) ) ( not ( = ?auto_807206 ?auto_807210 ) ) ( not ( = ?auto_807206 ?auto_807211 ) ) ( not ( = ?auto_807206 ?auto_807212 ) ) ( not ( = ?auto_807206 ?auto_807213 ) ) ( not ( = ?auto_807206 ?auto_807214 ) ) ( not ( = ?auto_807206 ?auto_807215 ) ) ( not ( = ?auto_807206 ?auto_807216 ) ) ( not ( = ?auto_807206 ?auto_807217 ) ) ( not ( = ?auto_807207 ?auto_807208 ) ) ( not ( = ?auto_807207 ?auto_807209 ) ) ( not ( = ?auto_807207 ?auto_807210 ) ) ( not ( = ?auto_807207 ?auto_807211 ) ) ( not ( = ?auto_807207 ?auto_807212 ) ) ( not ( = ?auto_807207 ?auto_807213 ) ) ( not ( = ?auto_807207 ?auto_807214 ) ) ( not ( = ?auto_807207 ?auto_807215 ) ) ( not ( = ?auto_807207 ?auto_807216 ) ) ( not ( = ?auto_807207 ?auto_807217 ) ) ( not ( = ?auto_807208 ?auto_807209 ) ) ( not ( = ?auto_807208 ?auto_807210 ) ) ( not ( = ?auto_807208 ?auto_807211 ) ) ( not ( = ?auto_807208 ?auto_807212 ) ) ( not ( = ?auto_807208 ?auto_807213 ) ) ( not ( = ?auto_807208 ?auto_807214 ) ) ( not ( = ?auto_807208 ?auto_807215 ) ) ( not ( = ?auto_807208 ?auto_807216 ) ) ( not ( = ?auto_807208 ?auto_807217 ) ) ( not ( = ?auto_807209 ?auto_807210 ) ) ( not ( = ?auto_807209 ?auto_807211 ) ) ( not ( = ?auto_807209 ?auto_807212 ) ) ( not ( = ?auto_807209 ?auto_807213 ) ) ( not ( = ?auto_807209 ?auto_807214 ) ) ( not ( = ?auto_807209 ?auto_807215 ) ) ( not ( = ?auto_807209 ?auto_807216 ) ) ( not ( = ?auto_807209 ?auto_807217 ) ) ( not ( = ?auto_807210 ?auto_807211 ) ) ( not ( = ?auto_807210 ?auto_807212 ) ) ( not ( = ?auto_807210 ?auto_807213 ) ) ( not ( = ?auto_807210 ?auto_807214 ) ) ( not ( = ?auto_807210 ?auto_807215 ) ) ( not ( = ?auto_807210 ?auto_807216 ) ) ( not ( = ?auto_807210 ?auto_807217 ) ) ( not ( = ?auto_807211 ?auto_807212 ) ) ( not ( = ?auto_807211 ?auto_807213 ) ) ( not ( = ?auto_807211 ?auto_807214 ) ) ( not ( = ?auto_807211 ?auto_807215 ) ) ( not ( = ?auto_807211 ?auto_807216 ) ) ( not ( = ?auto_807211 ?auto_807217 ) ) ( not ( = ?auto_807212 ?auto_807213 ) ) ( not ( = ?auto_807212 ?auto_807214 ) ) ( not ( = ?auto_807212 ?auto_807215 ) ) ( not ( = ?auto_807212 ?auto_807216 ) ) ( not ( = ?auto_807212 ?auto_807217 ) ) ( not ( = ?auto_807213 ?auto_807214 ) ) ( not ( = ?auto_807213 ?auto_807215 ) ) ( not ( = ?auto_807213 ?auto_807216 ) ) ( not ( = ?auto_807213 ?auto_807217 ) ) ( not ( = ?auto_807214 ?auto_807215 ) ) ( not ( = ?auto_807214 ?auto_807216 ) ) ( not ( = ?auto_807214 ?auto_807217 ) ) ( not ( = ?auto_807215 ?auto_807216 ) ) ( not ( = ?auto_807215 ?auto_807217 ) ) ( not ( = ?auto_807216 ?auto_807217 ) ) ( ON ?auto_807215 ?auto_807216 ) ( ON ?auto_807214 ?auto_807215 ) ( ON ?auto_807213 ?auto_807214 ) ( ON ?auto_807212 ?auto_807213 ) ( ON ?auto_807211 ?auto_807212 ) ( ON ?auto_807210 ?auto_807211 ) ( ON ?auto_807209 ?auto_807210 ) ( ON ?auto_807208 ?auto_807209 ) ( ON ?auto_807207 ?auto_807208 ) ( ON ?auto_807206 ?auto_807207 ) ( CLEAR ?auto_807204 ) ( ON ?auto_807205 ?auto_807206 ) ( CLEAR ?auto_807205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_807201 ?auto_807202 ?auto_807203 ?auto_807204 ?auto_807205 )
      ( MAKE-16PILE ?auto_807201 ?auto_807202 ?auto_807203 ?auto_807204 ?auto_807205 ?auto_807206 ?auto_807207 ?auto_807208 ?auto_807209 ?auto_807210 ?auto_807211 ?auto_807212 ?auto_807213 ?auto_807214 ?auto_807215 ?auto_807216 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807267 - BLOCK
      ?auto_807268 - BLOCK
      ?auto_807269 - BLOCK
      ?auto_807270 - BLOCK
      ?auto_807271 - BLOCK
      ?auto_807272 - BLOCK
      ?auto_807273 - BLOCK
      ?auto_807274 - BLOCK
      ?auto_807275 - BLOCK
      ?auto_807276 - BLOCK
      ?auto_807277 - BLOCK
      ?auto_807278 - BLOCK
      ?auto_807279 - BLOCK
      ?auto_807280 - BLOCK
      ?auto_807281 - BLOCK
      ?auto_807282 - BLOCK
    )
    :vars
    (
      ?auto_807283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807282 ?auto_807283 ) ( ON-TABLE ?auto_807267 ) ( ON ?auto_807268 ?auto_807267 ) ( ON ?auto_807269 ?auto_807268 ) ( not ( = ?auto_807267 ?auto_807268 ) ) ( not ( = ?auto_807267 ?auto_807269 ) ) ( not ( = ?auto_807267 ?auto_807270 ) ) ( not ( = ?auto_807267 ?auto_807271 ) ) ( not ( = ?auto_807267 ?auto_807272 ) ) ( not ( = ?auto_807267 ?auto_807273 ) ) ( not ( = ?auto_807267 ?auto_807274 ) ) ( not ( = ?auto_807267 ?auto_807275 ) ) ( not ( = ?auto_807267 ?auto_807276 ) ) ( not ( = ?auto_807267 ?auto_807277 ) ) ( not ( = ?auto_807267 ?auto_807278 ) ) ( not ( = ?auto_807267 ?auto_807279 ) ) ( not ( = ?auto_807267 ?auto_807280 ) ) ( not ( = ?auto_807267 ?auto_807281 ) ) ( not ( = ?auto_807267 ?auto_807282 ) ) ( not ( = ?auto_807267 ?auto_807283 ) ) ( not ( = ?auto_807268 ?auto_807269 ) ) ( not ( = ?auto_807268 ?auto_807270 ) ) ( not ( = ?auto_807268 ?auto_807271 ) ) ( not ( = ?auto_807268 ?auto_807272 ) ) ( not ( = ?auto_807268 ?auto_807273 ) ) ( not ( = ?auto_807268 ?auto_807274 ) ) ( not ( = ?auto_807268 ?auto_807275 ) ) ( not ( = ?auto_807268 ?auto_807276 ) ) ( not ( = ?auto_807268 ?auto_807277 ) ) ( not ( = ?auto_807268 ?auto_807278 ) ) ( not ( = ?auto_807268 ?auto_807279 ) ) ( not ( = ?auto_807268 ?auto_807280 ) ) ( not ( = ?auto_807268 ?auto_807281 ) ) ( not ( = ?auto_807268 ?auto_807282 ) ) ( not ( = ?auto_807268 ?auto_807283 ) ) ( not ( = ?auto_807269 ?auto_807270 ) ) ( not ( = ?auto_807269 ?auto_807271 ) ) ( not ( = ?auto_807269 ?auto_807272 ) ) ( not ( = ?auto_807269 ?auto_807273 ) ) ( not ( = ?auto_807269 ?auto_807274 ) ) ( not ( = ?auto_807269 ?auto_807275 ) ) ( not ( = ?auto_807269 ?auto_807276 ) ) ( not ( = ?auto_807269 ?auto_807277 ) ) ( not ( = ?auto_807269 ?auto_807278 ) ) ( not ( = ?auto_807269 ?auto_807279 ) ) ( not ( = ?auto_807269 ?auto_807280 ) ) ( not ( = ?auto_807269 ?auto_807281 ) ) ( not ( = ?auto_807269 ?auto_807282 ) ) ( not ( = ?auto_807269 ?auto_807283 ) ) ( not ( = ?auto_807270 ?auto_807271 ) ) ( not ( = ?auto_807270 ?auto_807272 ) ) ( not ( = ?auto_807270 ?auto_807273 ) ) ( not ( = ?auto_807270 ?auto_807274 ) ) ( not ( = ?auto_807270 ?auto_807275 ) ) ( not ( = ?auto_807270 ?auto_807276 ) ) ( not ( = ?auto_807270 ?auto_807277 ) ) ( not ( = ?auto_807270 ?auto_807278 ) ) ( not ( = ?auto_807270 ?auto_807279 ) ) ( not ( = ?auto_807270 ?auto_807280 ) ) ( not ( = ?auto_807270 ?auto_807281 ) ) ( not ( = ?auto_807270 ?auto_807282 ) ) ( not ( = ?auto_807270 ?auto_807283 ) ) ( not ( = ?auto_807271 ?auto_807272 ) ) ( not ( = ?auto_807271 ?auto_807273 ) ) ( not ( = ?auto_807271 ?auto_807274 ) ) ( not ( = ?auto_807271 ?auto_807275 ) ) ( not ( = ?auto_807271 ?auto_807276 ) ) ( not ( = ?auto_807271 ?auto_807277 ) ) ( not ( = ?auto_807271 ?auto_807278 ) ) ( not ( = ?auto_807271 ?auto_807279 ) ) ( not ( = ?auto_807271 ?auto_807280 ) ) ( not ( = ?auto_807271 ?auto_807281 ) ) ( not ( = ?auto_807271 ?auto_807282 ) ) ( not ( = ?auto_807271 ?auto_807283 ) ) ( not ( = ?auto_807272 ?auto_807273 ) ) ( not ( = ?auto_807272 ?auto_807274 ) ) ( not ( = ?auto_807272 ?auto_807275 ) ) ( not ( = ?auto_807272 ?auto_807276 ) ) ( not ( = ?auto_807272 ?auto_807277 ) ) ( not ( = ?auto_807272 ?auto_807278 ) ) ( not ( = ?auto_807272 ?auto_807279 ) ) ( not ( = ?auto_807272 ?auto_807280 ) ) ( not ( = ?auto_807272 ?auto_807281 ) ) ( not ( = ?auto_807272 ?auto_807282 ) ) ( not ( = ?auto_807272 ?auto_807283 ) ) ( not ( = ?auto_807273 ?auto_807274 ) ) ( not ( = ?auto_807273 ?auto_807275 ) ) ( not ( = ?auto_807273 ?auto_807276 ) ) ( not ( = ?auto_807273 ?auto_807277 ) ) ( not ( = ?auto_807273 ?auto_807278 ) ) ( not ( = ?auto_807273 ?auto_807279 ) ) ( not ( = ?auto_807273 ?auto_807280 ) ) ( not ( = ?auto_807273 ?auto_807281 ) ) ( not ( = ?auto_807273 ?auto_807282 ) ) ( not ( = ?auto_807273 ?auto_807283 ) ) ( not ( = ?auto_807274 ?auto_807275 ) ) ( not ( = ?auto_807274 ?auto_807276 ) ) ( not ( = ?auto_807274 ?auto_807277 ) ) ( not ( = ?auto_807274 ?auto_807278 ) ) ( not ( = ?auto_807274 ?auto_807279 ) ) ( not ( = ?auto_807274 ?auto_807280 ) ) ( not ( = ?auto_807274 ?auto_807281 ) ) ( not ( = ?auto_807274 ?auto_807282 ) ) ( not ( = ?auto_807274 ?auto_807283 ) ) ( not ( = ?auto_807275 ?auto_807276 ) ) ( not ( = ?auto_807275 ?auto_807277 ) ) ( not ( = ?auto_807275 ?auto_807278 ) ) ( not ( = ?auto_807275 ?auto_807279 ) ) ( not ( = ?auto_807275 ?auto_807280 ) ) ( not ( = ?auto_807275 ?auto_807281 ) ) ( not ( = ?auto_807275 ?auto_807282 ) ) ( not ( = ?auto_807275 ?auto_807283 ) ) ( not ( = ?auto_807276 ?auto_807277 ) ) ( not ( = ?auto_807276 ?auto_807278 ) ) ( not ( = ?auto_807276 ?auto_807279 ) ) ( not ( = ?auto_807276 ?auto_807280 ) ) ( not ( = ?auto_807276 ?auto_807281 ) ) ( not ( = ?auto_807276 ?auto_807282 ) ) ( not ( = ?auto_807276 ?auto_807283 ) ) ( not ( = ?auto_807277 ?auto_807278 ) ) ( not ( = ?auto_807277 ?auto_807279 ) ) ( not ( = ?auto_807277 ?auto_807280 ) ) ( not ( = ?auto_807277 ?auto_807281 ) ) ( not ( = ?auto_807277 ?auto_807282 ) ) ( not ( = ?auto_807277 ?auto_807283 ) ) ( not ( = ?auto_807278 ?auto_807279 ) ) ( not ( = ?auto_807278 ?auto_807280 ) ) ( not ( = ?auto_807278 ?auto_807281 ) ) ( not ( = ?auto_807278 ?auto_807282 ) ) ( not ( = ?auto_807278 ?auto_807283 ) ) ( not ( = ?auto_807279 ?auto_807280 ) ) ( not ( = ?auto_807279 ?auto_807281 ) ) ( not ( = ?auto_807279 ?auto_807282 ) ) ( not ( = ?auto_807279 ?auto_807283 ) ) ( not ( = ?auto_807280 ?auto_807281 ) ) ( not ( = ?auto_807280 ?auto_807282 ) ) ( not ( = ?auto_807280 ?auto_807283 ) ) ( not ( = ?auto_807281 ?auto_807282 ) ) ( not ( = ?auto_807281 ?auto_807283 ) ) ( not ( = ?auto_807282 ?auto_807283 ) ) ( ON ?auto_807281 ?auto_807282 ) ( ON ?auto_807280 ?auto_807281 ) ( ON ?auto_807279 ?auto_807280 ) ( ON ?auto_807278 ?auto_807279 ) ( ON ?auto_807277 ?auto_807278 ) ( ON ?auto_807276 ?auto_807277 ) ( ON ?auto_807275 ?auto_807276 ) ( ON ?auto_807274 ?auto_807275 ) ( ON ?auto_807273 ?auto_807274 ) ( ON ?auto_807272 ?auto_807273 ) ( ON ?auto_807271 ?auto_807272 ) ( CLEAR ?auto_807269 ) ( ON ?auto_807270 ?auto_807271 ) ( CLEAR ?auto_807270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_807267 ?auto_807268 ?auto_807269 ?auto_807270 )
      ( MAKE-16PILE ?auto_807267 ?auto_807268 ?auto_807269 ?auto_807270 ?auto_807271 ?auto_807272 ?auto_807273 ?auto_807274 ?auto_807275 ?auto_807276 ?auto_807277 ?auto_807278 ?auto_807279 ?auto_807280 ?auto_807281 ?auto_807282 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807333 - BLOCK
      ?auto_807334 - BLOCK
      ?auto_807335 - BLOCK
      ?auto_807336 - BLOCK
      ?auto_807337 - BLOCK
      ?auto_807338 - BLOCK
      ?auto_807339 - BLOCK
      ?auto_807340 - BLOCK
      ?auto_807341 - BLOCK
      ?auto_807342 - BLOCK
      ?auto_807343 - BLOCK
      ?auto_807344 - BLOCK
      ?auto_807345 - BLOCK
      ?auto_807346 - BLOCK
      ?auto_807347 - BLOCK
      ?auto_807348 - BLOCK
    )
    :vars
    (
      ?auto_807349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807348 ?auto_807349 ) ( ON-TABLE ?auto_807333 ) ( ON ?auto_807334 ?auto_807333 ) ( not ( = ?auto_807333 ?auto_807334 ) ) ( not ( = ?auto_807333 ?auto_807335 ) ) ( not ( = ?auto_807333 ?auto_807336 ) ) ( not ( = ?auto_807333 ?auto_807337 ) ) ( not ( = ?auto_807333 ?auto_807338 ) ) ( not ( = ?auto_807333 ?auto_807339 ) ) ( not ( = ?auto_807333 ?auto_807340 ) ) ( not ( = ?auto_807333 ?auto_807341 ) ) ( not ( = ?auto_807333 ?auto_807342 ) ) ( not ( = ?auto_807333 ?auto_807343 ) ) ( not ( = ?auto_807333 ?auto_807344 ) ) ( not ( = ?auto_807333 ?auto_807345 ) ) ( not ( = ?auto_807333 ?auto_807346 ) ) ( not ( = ?auto_807333 ?auto_807347 ) ) ( not ( = ?auto_807333 ?auto_807348 ) ) ( not ( = ?auto_807333 ?auto_807349 ) ) ( not ( = ?auto_807334 ?auto_807335 ) ) ( not ( = ?auto_807334 ?auto_807336 ) ) ( not ( = ?auto_807334 ?auto_807337 ) ) ( not ( = ?auto_807334 ?auto_807338 ) ) ( not ( = ?auto_807334 ?auto_807339 ) ) ( not ( = ?auto_807334 ?auto_807340 ) ) ( not ( = ?auto_807334 ?auto_807341 ) ) ( not ( = ?auto_807334 ?auto_807342 ) ) ( not ( = ?auto_807334 ?auto_807343 ) ) ( not ( = ?auto_807334 ?auto_807344 ) ) ( not ( = ?auto_807334 ?auto_807345 ) ) ( not ( = ?auto_807334 ?auto_807346 ) ) ( not ( = ?auto_807334 ?auto_807347 ) ) ( not ( = ?auto_807334 ?auto_807348 ) ) ( not ( = ?auto_807334 ?auto_807349 ) ) ( not ( = ?auto_807335 ?auto_807336 ) ) ( not ( = ?auto_807335 ?auto_807337 ) ) ( not ( = ?auto_807335 ?auto_807338 ) ) ( not ( = ?auto_807335 ?auto_807339 ) ) ( not ( = ?auto_807335 ?auto_807340 ) ) ( not ( = ?auto_807335 ?auto_807341 ) ) ( not ( = ?auto_807335 ?auto_807342 ) ) ( not ( = ?auto_807335 ?auto_807343 ) ) ( not ( = ?auto_807335 ?auto_807344 ) ) ( not ( = ?auto_807335 ?auto_807345 ) ) ( not ( = ?auto_807335 ?auto_807346 ) ) ( not ( = ?auto_807335 ?auto_807347 ) ) ( not ( = ?auto_807335 ?auto_807348 ) ) ( not ( = ?auto_807335 ?auto_807349 ) ) ( not ( = ?auto_807336 ?auto_807337 ) ) ( not ( = ?auto_807336 ?auto_807338 ) ) ( not ( = ?auto_807336 ?auto_807339 ) ) ( not ( = ?auto_807336 ?auto_807340 ) ) ( not ( = ?auto_807336 ?auto_807341 ) ) ( not ( = ?auto_807336 ?auto_807342 ) ) ( not ( = ?auto_807336 ?auto_807343 ) ) ( not ( = ?auto_807336 ?auto_807344 ) ) ( not ( = ?auto_807336 ?auto_807345 ) ) ( not ( = ?auto_807336 ?auto_807346 ) ) ( not ( = ?auto_807336 ?auto_807347 ) ) ( not ( = ?auto_807336 ?auto_807348 ) ) ( not ( = ?auto_807336 ?auto_807349 ) ) ( not ( = ?auto_807337 ?auto_807338 ) ) ( not ( = ?auto_807337 ?auto_807339 ) ) ( not ( = ?auto_807337 ?auto_807340 ) ) ( not ( = ?auto_807337 ?auto_807341 ) ) ( not ( = ?auto_807337 ?auto_807342 ) ) ( not ( = ?auto_807337 ?auto_807343 ) ) ( not ( = ?auto_807337 ?auto_807344 ) ) ( not ( = ?auto_807337 ?auto_807345 ) ) ( not ( = ?auto_807337 ?auto_807346 ) ) ( not ( = ?auto_807337 ?auto_807347 ) ) ( not ( = ?auto_807337 ?auto_807348 ) ) ( not ( = ?auto_807337 ?auto_807349 ) ) ( not ( = ?auto_807338 ?auto_807339 ) ) ( not ( = ?auto_807338 ?auto_807340 ) ) ( not ( = ?auto_807338 ?auto_807341 ) ) ( not ( = ?auto_807338 ?auto_807342 ) ) ( not ( = ?auto_807338 ?auto_807343 ) ) ( not ( = ?auto_807338 ?auto_807344 ) ) ( not ( = ?auto_807338 ?auto_807345 ) ) ( not ( = ?auto_807338 ?auto_807346 ) ) ( not ( = ?auto_807338 ?auto_807347 ) ) ( not ( = ?auto_807338 ?auto_807348 ) ) ( not ( = ?auto_807338 ?auto_807349 ) ) ( not ( = ?auto_807339 ?auto_807340 ) ) ( not ( = ?auto_807339 ?auto_807341 ) ) ( not ( = ?auto_807339 ?auto_807342 ) ) ( not ( = ?auto_807339 ?auto_807343 ) ) ( not ( = ?auto_807339 ?auto_807344 ) ) ( not ( = ?auto_807339 ?auto_807345 ) ) ( not ( = ?auto_807339 ?auto_807346 ) ) ( not ( = ?auto_807339 ?auto_807347 ) ) ( not ( = ?auto_807339 ?auto_807348 ) ) ( not ( = ?auto_807339 ?auto_807349 ) ) ( not ( = ?auto_807340 ?auto_807341 ) ) ( not ( = ?auto_807340 ?auto_807342 ) ) ( not ( = ?auto_807340 ?auto_807343 ) ) ( not ( = ?auto_807340 ?auto_807344 ) ) ( not ( = ?auto_807340 ?auto_807345 ) ) ( not ( = ?auto_807340 ?auto_807346 ) ) ( not ( = ?auto_807340 ?auto_807347 ) ) ( not ( = ?auto_807340 ?auto_807348 ) ) ( not ( = ?auto_807340 ?auto_807349 ) ) ( not ( = ?auto_807341 ?auto_807342 ) ) ( not ( = ?auto_807341 ?auto_807343 ) ) ( not ( = ?auto_807341 ?auto_807344 ) ) ( not ( = ?auto_807341 ?auto_807345 ) ) ( not ( = ?auto_807341 ?auto_807346 ) ) ( not ( = ?auto_807341 ?auto_807347 ) ) ( not ( = ?auto_807341 ?auto_807348 ) ) ( not ( = ?auto_807341 ?auto_807349 ) ) ( not ( = ?auto_807342 ?auto_807343 ) ) ( not ( = ?auto_807342 ?auto_807344 ) ) ( not ( = ?auto_807342 ?auto_807345 ) ) ( not ( = ?auto_807342 ?auto_807346 ) ) ( not ( = ?auto_807342 ?auto_807347 ) ) ( not ( = ?auto_807342 ?auto_807348 ) ) ( not ( = ?auto_807342 ?auto_807349 ) ) ( not ( = ?auto_807343 ?auto_807344 ) ) ( not ( = ?auto_807343 ?auto_807345 ) ) ( not ( = ?auto_807343 ?auto_807346 ) ) ( not ( = ?auto_807343 ?auto_807347 ) ) ( not ( = ?auto_807343 ?auto_807348 ) ) ( not ( = ?auto_807343 ?auto_807349 ) ) ( not ( = ?auto_807344 ?auto_807345 ) ) ( not ( = ?auto_807344 ?auto_807346 ) ) ( not ( = ?auto_807344 ?auto_807347 ) ) ( not ( = ?auto_807344 ?auto_807348 ) ) ( not ( = ?auto_807344 ?auto_807349 ) ) ( not ( = ?auto_807345 ?auto_807346 ) ) ( not ( = ?auto_807345 ?auto_807347 ) ) ( not ( = ?auto_807345 ?auto_807348 ) ) ( not ( = ?auto_807345 ?auto_807349 ) ) ( not ( = ?auto_807346 ?auto_807347 ) ) ( not ( = ?auto_807346 ?auto_807348 ) ) ( not ( = ?auto_807346 ?auto_807349 ) ) ( not ( = ?auto_807347 ?auto_807348 ) ) ( not ( = ?auto_807347 ?auto_807349 ) ) ( not ( = ?auto_807348 ?auto_807349 ) ) ( ON ?auto_807347 ?auto_807348 ) ( ON ?auto_807346 ?auto_807347 ) ( ON ?auto_807345 ?auto_807346 ) ( ON ?auto_807344 ?auto_807345 ) ( ON ?auto_807343 ?auto_807344 ) ( ON ?auto_807342 ?auto_807343 ) ( ON ?auto_807341 ?auto_807342 ) ( ON ?auto_807340 ?auto_807341 ) ( ON ?auto_807339 ?auto_807340 ) ( ON ?auto_807338 ?auto_807339 ) ( ON ?auto_807337 ?auto_807338 ) ( ON ?auto_807336 ?auto_807337 ) ( CLEAR ?auto_807334 ) ( ON ?auto_807335 ?auto_807336 ) ( CLEAR ?auto_807335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_807333 ?auto_807334 ?auto_807335 )
      ( MAKE-16PILE ?auto_807333 ?auto_807334 ?auto_807335 ?auto_807336 ?auto_807337 ?auto_807338 ?auto_807339 ?auto_807340 ?auto_807341 ?auto_807342 ?auto_807343 ?auto_807344 ?auto_807345 ?auto_807346 ?auto_807347 ?auto_807348 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807399 - BLOCK
      ?auto_807400 - BLOCK
      ?auto_807401 - BLOCK
      ?auto_807402 - BLOCK
      ?auto_807403 - BLOCK
      ?auto_807404 - BLOCK
      ?auto_807405 - BLOCK
      ?auto_807406 - BLOCK
      ?auto_807407 - BLOCK
      ?auto_807408 - BLOCK
      ?auto_807409 - BLOCK
      ?auto_807410 - BLOCK
      ?auto_807411 - BLOCK
      ?auto_807412 - BLOCK
      ?auto_807413 - BLOCK
      ?auto_807414 - BLOCK
    )
    :vars
    (
      ?auto_807415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807414 ?auto_807415 ) ( ON-TABLE ?auto_807399 ) ( not ( = ?auto_807399 ?auto_807400 ) ) ( not ( = ?auto_807399 ?auto_807401 ) ) ( not ( = ?auto_807399 ?auto_807402 ) ) ( not ( = ?auto_807399 ?auto_807403 ) ) ( not ( = ?auto_807399 ?auto_807404 ) ) ( not ( = ?auto_807399 ?auto_807405 ) ) ( not ( = ?auto_807399 ?auto_807406 ) ) ( not ( = ?auto_807399 ?auto_807407 ) ) ( not ( = ?auto_807399 ?auto_807408 ) ) ( not ( = ?auto_807399 ?auto_807409 ) ) ( not ( = ?auto_807399 ?auto_807410 ) ) ( not ( = ?auto_807399 ?auto_807411 ) ) ( not ( = ?auto_807399 ?auto_807412 ) ) ( not ( = ?auto_807399 ?auto_807413 ) ) ( not ( = ?auto_807399 ?auto_807414 ) ) ( not ( = ?auto_807399 ?auto_807415 ) ) ( not ( = ?auto_807400 ?auto_807401 ) ) ( not ( = ?auto_807400 ?auto_807402 ) ) ( not ( = ?auto_807400 ?auto_807403 ) ) ( not ( = ?auto_807400 ?auto_807404 ) ) ( not ( = ?auto_807400 ?auto_807405 ) ) ( not ( = ?auto_807400 ?auto_807406 ) ) ( not ( = ?auto_807400 ?auto_807407 ) ) ( not ( = ?auto_807400 ?auto_807408 ) ) ( not ( = ?auto_807400 ?auto_807409 ) ) ( not ( = ?auto_807400 ?auto_807410 ) ) ( not ( = ?auto_807400 ?auto_807411 ) ) ( not ( = ?auto_807400 ?auto_807412 ) ) ( not ( = ?auto_807400 ?auto_807413 ) ) ( not ( = ?auto_807400 ?auto_807414 ) ) ( not ( = ?auto_807400 ?auto_807415 ) ) ( not ( = ?auto_807401 ?auto_807402 ) ) ( not ( = ?auto_807401 ?auto_807403 ) ) ( not ( = ?auto_807401 ?auto_807404 ) ) ( not ( = ?auto_807401 ?auto_807405 ) ) ( not ( = ?auto_807401 ?auto_807406 ) ) ( not ( = ?auto_807401 ?auto_807407 ) ) ( not ( = ?auto_807401 ?auto_807408 ) ) ( not ( = ?auto_807401 ?auto_807409 ) ) ( not ( = ?auto_807401 ?auto_807410 ) ) ( not ( = ?auto_807401 ?auto_807411 ) ) ( not ( = ?auto_807401 ?auto_807412 ) ) ( not ( = ?auto_807401 ?auto_807413 ) ) ( not ( = ?auto_807401 ?auto_807414 ) ) ( not ( = ?auto_807401 ?auto_807415 ) ) ( not ( = ?auto_807402 ?auto_807403 ) ) ( not ( = ?auto_807402 ?auto_807404 ) ) ( not ( = ?auto_807402 ?auto_807405 ) ) ( not ( = ?auto_807402 ?auto_807406 ) ) ( not ( = ?auto_807402 ?auto_807407 ) ) ( not ( = ?auto_807402 ?auto_807408 ) ) ( not ( = ?auto_807402 ?auto_807409 ) ) ( not ( = ?auto_807402 ?auto_807410 ) ) ( not ( = ?auto_807402 ?auto_807411 ) ) ( not ( = ?auto_807402 ?auto_807412 ) ) ( not ( = ?auto_807402 ?auto_807413 ) ) ( not ( = ?auto_807402 ?auto_807414 ) ) ( not ( = ?auto_807402 ?auto_807415 ) ) ( not ( = ?auto_807403 ?auto_807404 ) ) ( not ( = ?auto_807403 ?auto_807405 ) ) ( not ( = ?auto_807403 ?auto_807406 ) ) ( not ( = ?auto_807403 ?auto_807407 ) ) ( not ( = ?auto_807403 ?auto_807408 ) ) ( not ( = ?auto_807403 ?auto_807409 ) ) ( not ( = ?auto_807403 ?auto_807410 ) ) ( not ( = ?auto_807403 ?auto_807411 ) ) ( not ( = ?auto_807403 ?auto_807412 ) ) ( not ( = ?auto_807403 ?auto_807413 ) ) ( not ( = ?auto_807403 ?auto_807414 ) ) ( not ( = ?auto_807403 ?auto_807415 ) ) ( not ( = ?auto_807404 ?auto_807405 ) ) ( not ( = ?auto_807404 ?auto_807406 ) ) ( not ( = ?auto_807404 ?auto_807407 ) ) ( not ( = ?auto_807404 ?auto_807408 ) ) ( not ( = ?auto_807404 ?auto_807409 ) ) ( not ( = ?auto_807404 ?auto_807410 ) ) ( not ( = ?auto_807404 ?auto_807411 ) ) ( not ( = ?auto_807404 ?auto_807412 ) ) ( not ( = ?auto_807404 ?auto_807413 ) ) ( not ( = ?auto_807404 ?auto_807414 ) ) ( not ( = ?auto_807404 ?auto_807415 ) ) ( not ( = ?auto_807405 ?auto_807406 ) ) ( not ( = ?auto_807405 ?auto_807407 ) ) ( not ( = ?auto_807405 ?auto_807408 ) ) ( not ( = ?auto_807405 ?auto_807409 ) ) ( not ( = ?auto_807405 ?auto_807410 ) ) ( not ( = ?auto_807405 ?auto_807411 ) ) ( not ( = ?auto_807405 ?auto_807412 ) ) ( not ( = ?auto_807405 ?auto_807413 ) ) ( not ( = ?auto_807405 ?auto_807414 ) ) ( not ( = ?auto_807405 ?auto_807415 ) ) ( not ( = ?auto_807406 ?auto_807407 ) ) ( not ( = ?auto_807406 ?auto_807408 ) ) ( not ( = ?auto_807406 ?auto_807409 ) ) ( not ( = ?auto_807406 ?auto_807410 ) ) ( not ( = ?auto_807406 ?auto_807411 ) ) ( not ( = ?auto_807406 ?auto_807412 ) ) ( not ( = ?auto_807406 ?auto_807413 ) ) ( not ( = ?auto_807406 ?auto_807414 ) ) ( not ( = ?auto_807406 ?auto_807415 ) ) ( not ( = ?auto_807407 ?auto_807408 ) ) ( not ( = ?auto_807407 ?auto_807409 ) ) ( not ( = ?auto_807407 ?auto_807410 ) ) ( not ( = ?auto_807407 ?auto_807411 ) ) ( not ( = ?auto_807407 ?auto_807412 ) ) ( not ( = ?auto_807407 ?auto_807413 ) ) ( not ( = ?auto_807407 ?auto_807414 ) ) ( not ( = ?auto_807407 ?auto_807415 ) ) ( not ( = ?auto_807408 ?auto_807409 ) ) ( not ( = ?auto_807408 ?auto_807410 ) ) ( not ( = ?auto_807408 ?auto_807411 ) ) ( not ( = ?auto_807408 ?auto_807412 ) ) ( not ( = ?auto_807408 ?auto_807413 ) ) ( not ( = ?auto_807408 ?auto_807414 ) ) ( not ( = ?auto_807408 ?auto_807415 ) ) ( not ( = ?auto_807409 ?auto_807410 ) ) ( not ( = ?auto_807409 ?auto_807411 ) ) ( not ( = ?auto_807409 ?auto_807412 ) ) ( not ( = ?auto_807409 ?auto_807413 ) ) ( not ( = ?auto_807409 ?auto_807414 ) ) ( not ( = ?auto_807409 ?auto_807415 ) ) ( not ( = ?auto_807410 ?auto_807411 ) ) ( not ( = ?auto_807410 ?auto_807412 ) ) ( not ( = ?auto_807410 ?auto_807413 ) ) ( not ( = ?auto_807410 ?auto_807414 ) ) ( not ( = ?auto_807410 ?auto_807415 ) ) ( not ( = ?auto_807411 ?auto_807412 ) ) ( not ( = ?auto_807411 ?auto_807413 ) ) ( not ( = ?auto_807411 ?auto_807414 ) ) ( not ( = ?auto_807411 ?auto_807415 ) ) ( not ( = ?auto_807412 ?auto_807413 ) ) ( not ( = ?auto_807412 ?auto_807414 ) ) ( not ( = ?auto_807412 ?auto_807415 ) ) ( not ( = ?auto_807413 ?auto_807414 ) ) ( not ( = ?auto_807413 ?auto_807415 ) ) ( not ( = ?auto_807414 ?auto_807415 ) ) ( ON ?auto_807413 ?auto_807414 ) ( ON ?auto_807412 ?auto_807413 ) ( ON ?auto_807411 ?auto_807412 ) ( ON ?auto_807410 ?auto_807411 ) ( ON ?auto_807409 ?auto_807410 ) ( ON ?auto_807408 ?auto_807409 ) ( ON ?auto_807407 ?auto_807408 ) ( ON ?auto_807406 ?auto_807407 ) ( ON ?auto_807405 ?auto_807406 ) ( ON ?auto_807404 ?auto_807405 ) ( ON ?auto_807403 ?auto_807404 ) ( ON ?auto_807402 ?auto_807403 ) ( ON ?auto_807401 ?auto_807402 ) ( CLEAR ?auto_807399 ) ( ON ?auto_807400 ?auto_807401 ) ( CLEAR ?auto_807400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_807399 ?auto_807400 )
      ( MAKE-16PILE ?auto_807399 ?auto_807400 ?auto_807401 ?auto_807402 ?auto_807403 ?auto_807404 ?auto_807405 ?auto_807406 ?auto_807407 ?auto_807408 ?auto_807409 ?auto_807410 ?auto_807411 ?auto_807412 ?auto_807413 ?auto_807414 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_807465 - BLOCK
      ?auto_807466 - BLOCK
      ?auto_807467 - BLOCK
      ?auto_807468 - BLOCK
      ?auto_807469 - BLOCK
      ?auto_807470 - BLOCK
      ?auto_807471 - BLOCK
      ?auto_807472 - BLOCK
      ?auto_807473 - BLOCK
      ?auto_807474 - BLOCK
      ?auto_807475 - BLOCK
      ?auto_807476 - BLOCK
      ?auto_807477 - BLOCK
      ?auto_807478 - BLOCK
      ?auto_807479 - BLOCK
      ?auto_807480 - BLOCK
    )
    :vars
    (
      ?auto_807481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807480 ?auto_807481 ) ( not ( = ?auto_807465 ?auto_807466 ) ) ( not ( = ?auto_807465 ?auto_807467 ) ) ( not ( = ?auto_807465 ?auto_807468 ) ) ( not ( = ?auto_807465 ?auto_807469 ) ) ( not ( = ?auto_807465 ?auto_807470 ) ) ( not ( = ?auto_807465 ?auto_807471 ) ) ( not ( = ?auto_807465 ?auto_807472 ) ) ( not ( = ?auto_807465 ?auto_807473 ) ) ( not ( = ?auto_807465 ?auto_807474 ) ) ( not ( = ?auto_807465 ?auto_807475 ) ) ( not ( = ?auto_807465 ?auto_807476 ) ) ( not ( = ?auto_807465 ?auto_807477 ) ) ( not ( = ?auto_807465 ?auto_807478 ) ) ( not ( = ?auto_807465 ?auto_807479 ) ) ( not ( = ?auto_807465 ?auto_807480 ) ) ( not ( = ?auto_807465 ?auto_807481 ) ) ( not ( = ?auto_807466 ?auto_807467 ) ) ( not ( = ?auto_807466 ?auto_807468 ) ) ( not ( = ?auto_807466 ?auto_807469 ) ) ( not ( = ?auto_807466 ?auto_807470 ) ) ( not ( = ?auto_807466 ?auto_807471 ) ) ( not ( = ?auto_807466 ?auto_807472 ) ) ( not ( = ?auto_807466 ?auto_807473 ) ) ( not ( = ?auto_807466 ?auto_807474 ) ) ( not ( = ?auto_807466 ?auto_807475 ) ) ( not ( = ?auto_807466 ?auto_807476 ) ) ( not ( = ?auto_807466 ?auto_807477 ) ) ( not ( = ?auto_807466 ?auto_807478 ) ) ( not ( = ?auto_807466 ?auto_807479 ) ) ( not ( = ?auto_807466 ?auto_807480 ) ) ( not ( = ?auto_807466 ?auto_807481 ) ) ( not ( = ?auto_807467 ?auto_807468 ) ) ( not ( = ?auto_807467 ?auto_807469 ) ) ( not ( = ?auto_807467 ?auto_807470 ) ) ( not ( = ?auto_807467 ?auto_807471 ) ) ( not ( = ?auto_807467 ?auto_807472 ) ) ( not ( = ?auto_807467 ?auto_807473 ) ) ( not ( = ?auto_807467 ?auto_807474 ) ) ( not ( = ?auto_807467 ?auto_807475 ) ) ( not ( = ?auto_807467 ?auto_807476 ) ) ( not ( = ?auto_807467 ?auto_807477 ) ) ( not ( = ?auto_807467 ?auto_807478 ) ) ( not ( = ?auto_807467 ?auto_807479 ) ) ( not ( = ?auto_807467 ?auto_807480 ) ) ( not ( = ?auto_807467 ?auto_807481 ) ) ( not ( = ?auto_807468 ?auto_807469 ) ) ( not ( = ?auto_807468 ?auto_807470 ) ) ( not ( = ?auto_807468 ?auto_807471 ) ) ( not ( = ?auto_807468 ?auto_807472 ) ) ( not ( = ?auto_807468 ?auto_807473 ) ) ( not ( = ?auto_807468 ?auto_807474 ) ) ( not ( = ?auto_807468 ?auto_807475 ) ) ( not ( = ?auto_807468 ?auto_807476 ) ) ( not ( = ?auto_807468 ?auto_807477 ) ) ( not ( = ?auto_807468 ?auto_807478 ) ) ( not ( = ?auto_807468 ?auto_807479 ) ) ( not ( = ?auto_807468 ?auto_807480 ) ) ( not ( = ?auto_807468 ?auto_807481 ) ) ( not ( = ?auto_807469 ?auto_807470 ) ) ( not ( = ?auto_807469 ?auto_807471 ) ) ( not ( = ?auto_807469 ?auto_807472 ) ) ( not ( = ?auto_807469 ?auto_807473 ) ) ( not ( = ?auto_807469 ?auto_807474 ) ) ( not ( = ?auto_807469 ?auto_807475 ) ) ( not ( = ?auto_807469 ?auto_807476 ) ) ( not ( = ?auto_807469 ?auto_807477 ) ) ( not ( = ?auto_807469 ?auto_807478 ) ) ( not ( = ?auto_807469 ?auto_807479 ) ) ( not ( = ?auto_807469 ?auto_807480 ) ) ( not ( = ?auto_807469 ?auto_807481 ) ) ( not ( = ?auto_807470 ?auto_807471 ) ) ( not ( = ?auto_807470 ?auto_807472 ) ) ( not ( = ?auto_807470 ?auto_807473 ) ) ( not ( = ?auto_807470 ?auto_807474 ) ) ( not ( = ?auto_807470 ?auto_807475 ) ) ( not ( = ?auto_807470 ?auto_807476 ) ) ( not ( = ?auto_807470 ?auto_807477 ) ) ( not ( = ?auto_807470 ?auto_807478 ) ) ( not ( = ?auto_807470 ?auto_807479 ) ) ( not ( = ?auto_807470 ?auto_807480 ) ) ( not ( = ?auto_807470 ?auto_807481 ) ) ( not ( = ?auto_807471 ?auto_807472 ) ) ( not ( = ?auto_807471 ?auto_807473 ) ) ( not ( = ?auto_807471 ?auto_807474 ) ) ( not ( = ?auto_807471 ?auto_807475 ) ) ( not ( = ?auto_807471 ?auto_807476 ) ) ( not ( = ?auto_807471 ?auto_807477 ) ) ( not ( = ?auto_807471 ?auto_807478 ) ) ( not ( = ?auto_807471 ?auto_807479 ) ) ( not ( = ?auto_807471 ?auto_807480 ) ) ( not ( = ?auto_807471 ?auto_807481 ) ) ( not ( = ?auto_807472 ?auto_807473 ) ) ( not ( = ?auto_807472 ?auto_807474 ) ) ( not ( = ?auto_807472 ?auto_807475 ) ) ( not ( = ?auto_807472 ?auto_807476 ) ) ( not ( = ?auto_807472 ?auto_807477 ) ) ( not ( = ?auto_807472 ?auto_807478 ) ) ( not ( = ?auto_807472 ?auto_807479 ) ) ( not ( = ?auto_807472 ?auto_807480 ) ) ( not ( = ?auto_807472 ?auto_807481 ) ) ( not ( = ?auto_807473 ?auto_807474 ) ) ( not ( = ?auto_807473 ?auto_807475 ) ) ( not ( = ?auto_807473 ?auto_807476 ) ) ( not ( = ?auto_807473 ?auto_807477 ) ) ( not ( = ?auto_807473 ?auto_807478 ) ) ( not ( = ?auto_807473 ?auto_807479 ) ) ( not ( = ?auto_807473 ?auto_807480 ) ) ( not ( = ?auto_807473 ?auto_807481 ) ) ( not ( = ?auto_807474 ?auto_807475 ) ) ( not ( = ?auto_807474 ?auto_807476 ) ) ( not ( = ?auto_807474 ?auto_807477 ) ) ( not ( = ?auto_807474 ?auto_807478 ) ) ( not ( = ?auto_807474 ?auto_807479 ) ) ( not ( = ?auto_807474 ?auto_807480 ) ) ( not ( = ?auto_807474 ?auto_807481 ) ) ( not ( = ?auto_807475 ?auto_807476 ) ) ( not ( = ?auto_807475 ?auto_807477 ) ) ( not ( = ?auto_807475 ?auto_807478 ) ) ( not ( = ?auto_807475 ?auto_807479 ) ) ( not ( = ?auto_807475 ?auto_807480 ) ) ( not ( = ?auto_807475 ?auto_807481 ) ) ( not ( = ?auto_807476 ?auto_807477 ) ) ( not ( = ?auto_807476 ?auto_807478 ) ) ( not ( = ?auto_807476 ?auto_807479 ) ) ( not ( = ?auto_807476 ?auto_807480 ) ) ( not ( = ?auto_807476 ?auto_807481 ) ) ( not ( = ?auto_807477 ?auto_807478 ) ) ( not ( = ?auto_807477 ?auto_807479 ) ) ( not ( = ?auto_807477 ?auto_807480 ) ) ( not ( = ?auto_807477 ?auto_807481 ) ) ( not ( = ?auto_807478 ?auto_807479 ) ) ( not ( = ?auto_807478 ?auto_807480 ) ) ( not ( = ?auto_807478 ?auto_807481 ) ) ( not ( = ?auto_807479 ?auto_807480 ) ) ( not ( = ?auto_807479 ?auto_807481 ) ) ( not ( = ?auto_807480 ?auto_807481 ) ) ( ON ?auto_807479 ?auto_807480 ) ( ON ?auto_807478 ?auto_807479 ) ( ON ?auto_807477 ?auto_807478 ) ( ON ?auto_807476 ?auto_807477 ) ( ON ?auto_807475 ?auto_807476 ) ( ON ?auto_807474 ?auto_807475 ) ( ON ?auto_807473 ?auto_807474 ) ( ON ?auto_807472 ?auto_807473 ) ( ON ?auto_807471 ?auto_807472 ) ( ON ?auto_807470 ?auto_807471 ) ( ON ?auto_807469 ?auto_807470 ) ( ON ?auto_807468 ?auto_807469 ) ( ON ?auto_807467 ?auto_807468 ) ( ON ?auto_807466 ?auto_807467 ) ( ON ?auto_807465 ?auto_807466 ) ( CLEAR ?auto_807465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_807465 )
      ( MAKE-16PILE ?auto_807465 ?auto_807466 ?auto_807467 ?auto_807468 ?auto_807469 ?auto_807470 ?auto_807471 ?auto_807472 ?auto_807473 ?auto_807474 ?auto_807475 ?auto_807476 ?auto_807477 ?auto_807478 ?auto_807479 ?auto_807480 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807532 - BLOCK
      ?auto_807533 - BLOCK
      ?auto_807534 - BLOCK
      ?auto_807535 - BLOCK
      ?auto_807536 - BLOCK
      ?auto_807537 - BLOCK
      ?auto_807538 - BLOCK
      ?auto_807539 - BLOCK
      ?auto_807540 - BLOCK
      ?auto_807541 - BLOCK
      ?auto_807542 - BLOCK
      ?auto_807543 - BLOCK
      ?auto_807544 - BLOCK
      ?auto_807545 - BLOCK
      ?auto_807546 - BLOCK
      ?auto_807547 - BLOCK
      ?auto_807548 - BLOCK
    )
    :vars
    (
      ?auto_807549 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_807547 ) ( ON ?auto_807548 ?auto_807549 ) ( CLEAR ?auto_807548 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_807532 ) ( ON ?auto_807533 ?auto_807532 ) ( ON ?auto_807534 ?auto_807533 ) ( ON ?auto_807535 ?auto_807534 ) ( ON ?auto_807536 ?auto_807535 ) ( ON ?auto_807537 ?auto_807536 ) ( ON ?auto_807538 ?auto_807537 ) ( ON ?auto_807539 ?auto_807538 ) ( ON ?auto_807540 ?auto_807539 ) ( ON ?auto_807541 ?auto_807540 ) ( ON ?auto_807542 ?auto_807541 ) ( ON ?auto_807543 ?auto_807542 ) ( ON ?auto_807544 ?auto_807543 ) ( ON ?auto_807545 ?auto_807544 ) ( ON ?auto_807546 ?auto_807545 ) ( ON ?auto_807547 ?auto_807546 ) ( not ( = ?auto_807532 ?auto_807533 ) ) ( not ( = ?auto_807532 ?auto_807534 ) ) ( not ( = ?auto_807532 ?auto_807535 ) ) ( not ( = ?auto_807532 ?auto_807536 ) ) ( not ( = ?auto_807532 ?auto_807537 ) ) ( not ( = ?auto_807532 ?auto_807538 ) ) ( not ( = ?auto_807532 ?auto_807539 ) ) ( not ( = ?auto_807532 ?auto_807540 ) ) ( not ( = ?auto_807532 ?auto_807541 ) ) ( not ( = ?auto_807532 ?auto_807542 ) ) ( not ( = ?auto_807532 ?auto_807543 ) ) ( not ( = ?auto_807532 ?auto_807544 ) ) ( not ( = ?auto_807532 ?auto_807545 ) ) ( not ( = ?auto_807532 ?auto_807546 ) ) ( not ( = ?auto_807532 ?auto_807547 ) ) ( not ( = ?auto_807532 ?auto_807548 ) ) ( not ( = ?auto_807532 ?auto_807549 ) ) ( not ( = ?auto_807533 ?auto_807534 ) ) ( not ( = ?auto_807533 ?auto_807535 ) ) ( not ( = ?auto_807533 ?auto_807536 ) ) ( not ( = ?auto_807533 ?auto_807537 ) ) ( not ( = ?auto_807533 ?auto_807538 ) ) ( not ( = ?auto_807533 ?auto_807539 ) ) ( not ( = ?auto_807533 ?auto_807540 ) ) ( not ( = ?auto_807533 ?auto_807541 ) ) ( not ( = ?auto_807533 ?auto_807542 ) ) ( not ( = ?auto_807533 ?auto_807543 ) ) ( not ( = ?auto_807533 ?auto_807544 ) ) ( not ( = ?auto_807533 ?auto_807545 ) ) ( not ( = ?auto_807533 ?auto_807546 ) ) ( not ( = ?auto_807533 ?auto_807547 ) ) ( not ( = ?auto_807533 ?auto_807548 ) ) ( not ( = ?auto_807533 ?auto_807549 ) ) ( not ( = ?auto_807534 ?auto_807535 ) ) ( not ( = ?auto_807534 ?auto_807536 ) ) ( not ( = ?auto_807534 ?auto_807537 ) ) ( not ( = ?auto_807534 ?auto_807538 ) ) ( not ( = ?auto_807534 ?auto_807539 ) ) ( not ( = ?auto_807534 ?auto_807540 ) ) ( not ( = ?auto_807534 ?auto_807541 ) ) ( not ( = ?auto_807534 ?auto_807542 ) ) ( not ( = ?auto_807534 ?auto_807543 ) ) ( not ( = ?auto_807534 ?auto_807544 ) ) ( not ( = ?auto_807534 ?auto_807545 ) ) ( not ( = ?auto_807534 ?auto_807546 ) ) ( not ( = ?auto_807534 ?auto_807547 ) ) ( not ( = ?auto_807534 ?auto_807548 ) ) ( not ( = ?auto_807534 ?auto_807549 ) ) ( not ( = ?auto_807535 ?auto_807536 ) ) ( not ( = ?auto_807535 ?auto_807537 ) ) ( not ( = ?auto_807535 ?auto_807538 ) ) ( not ( = ?auto_807535 ?auto_807539 ) ) ( not ( = ?auto_807535 ?auto_807540 ) ) ( not ( = ?auto_807535 ?auto_807541 ) ) ( not ( = ?auto_807535 ?auto_807542 ) ) ( not ( = ?auto_807535 ?auto_807543 ) ) ( not ( = ?auto_807535 ?auto_807544 ) ) ( not ( = ?auto_807535 ?auto_807545 ) ) ( not ( = ?auto_807535 ?auto_807546 ) ) ( not ( = ?auto_807535 ?auto_807547 ) ) ( not ( = ?auto_807535 ?auto_807548 ) ) ( not ( = ?auto_807535 ?auto_807549 ) ) ( not ( = ?auto_807536 ?auto_807537 ) ) ( not ( = ?auto_807536 ?auto_807538 ) ) ( not ( = ?auto_807536 ?auto_807539 ) ) ( not ( = ?auto_807536 ?auto_807540 ) ) ( not ( = ?auto_807536 ?auto_807541 ) ) ( not ( = ?auto_807536 ?auto_807542 ) ) ( not ( = ?auto_807536 ?auto_807543 ) ) ( not ( = ?auto_807536 ?auto_807544 ) ) ( not ( = ?auto_807536 ?auto_807545 ) ) ( not ( = ?auto_807536 ?auto_807546 ) ) ( not ( = ?auto_807536 ?auto_807547 ) ) ( not ( = ?auto_807536 ?auto_807548 ) ) ( not ( = ?auto_807536 ?auto_807549 ) ) ( not ( = ?auto_807537 ?auto_807538 ) ) ( not ( = ?auto_807537 ?auto_807539 ) ) ( not ( = ?auto_807537 ?auto_807540 ) ) ( not ( = ?auto_807537 ?auto_807541 ) ) ( not ( = ?auto_807537 ?auto_807542 ) ) ( not ( = ?auto_807537 ?auto_807543 ) ) ( not ( = ?auto_807537 ?auto_807544 ) ) ( not ( = ?auto_807537 ?auto_807545 ) ) ( not ( = ?auto_807537 ?auto_807546 ) ) ( not ( = ?auto_807537 ?auto_807547 ) ) ( not ( = ?auto_807537 ?auto_807548 ) ) ( not ( = ?auto_807537 ?auto_807549 ) ) ( not ( = ?auto_807538 ?auto_807539 ) ) ( not ( = ?auto_807538 ?auto_807540 ) ) ( not ( = ?auto_807538 ?auto_807541 ) ) ( not ( = ?auto_807538 ?auto_807542 ) ) ( not ( = ?auto_807538 ?auto_807543 ) ) ( not ( = ?auto_807538 ?auto_807544 ) ) ( not ( = ?auto_807538 ?auto_807545 ) ) ( not ( = ?auto_807538 ?auto_807546 ) ) ( not ( = ?auto_807538 ?auto_807547 ) ) ( not ( = ?auto_807538 ?auto_807548 ) ) ( not ( = ?auto_807538 ?auto_807549 ) ) ( not ( = ?auto_807539 ?auto_807540 ) ) ( not ( = ?auto_807539 ?auto_807541 ) ) ( not ( = ?auto_807539 ?auto_807542 ) ) ( not ( = ?auto_807539 ?auto_807543 ) ) ( not ( = ?auto_807539 ?auto_807544 ) ) ( not ( = ?auto_807539 ?auto_807545 ) ) ( not ( = ?auto_807539 ?auto_807546 ) ) ( not ( = ?auto_807539 ?auto_807547 ) ) ( not ( = ?auto_807539 ?auto_807548 ) ) ( not ( = ?auto_807539 ?auto_807549 ) ) ( not ( = ?auto_807540 ?auto_807541 ) ) ( not ( = ?auto_807540 ?auto_807542 ) ) ( not ( = ?auto_807540 ?auto_807543 ) ) ( not ( = ?auto_807540 ?auto_807544 ) ) ( not ( = ?auto_807540 ?auto_807545 ) ) ( not ( = ?auto_807540 ?auto_807546 ) ) ( not ( = ?auto_807540 ?auto_807547 ) ) ( not ( = ?auto_807540 ?auto_807548 ) ) ( not ( = ?auto_807540 ?auto_807549 ) ) ( not ( = ?auto_807541 ?auto_807542 ) ) ( not ( = ?auto_807541 ?auto_807543 ) ) ( not ( = ?auto_807541 ?auto_807544 ) ) ( not ( = ?auto_807541 ?auto_807545 ) ) ( not ( = ?auto_807541 ?auto_807546 ) ) ( not ( = ?auto_807541 ?auto_807547 ) ) ( not ( = ?auto_807541 ?auto_807548 ) ) ( not ( = ?auto_807541 ?auto_807549 ) ) ( not ( = ?auto_807542 ?auto_807543 ) ) ( not ( = ?auto_807542 ?auto_807544 ) ) ( not ( = ?auto_807542 ?auto_807545 ) ) ( not ( = ?auto_807542 ?auto_807546 ) ) ( not ( = ?auto_807542 ?auto_807547 ) ) ( not ( = ?auto_807542 ?auto_807548 ) ) ( not ( = ?auto_807542 ?auto_807549 ) ) ( not ( = ?auto_807543 ?auto_807544 ) ) ( not ( = ?auto_807543 ?auto_807545 ) ) ( not ( = ?auto_807543 ?auto_807546 ) ) ( not ( = ?auto_807543 ?auto_807547 ) ) ( not ( = ?auto_807543 ?auto_807548 ) ) ( not ( = ?auto_807543 ?auto_807549 ) ) ( not ( = ?auto_807544 ?auto_807545 ) ) ( not ( = ?auto_807544 ?auto_807546 ) ) ( not ( = ?auto_807544 ?auto_807547 ) ) ( not ( = ?auto_807544 ?auto_807548 ) ) ( not ( = ?auto_807544 ?auto_807549 ) ) ( not ( = ?auto_807545 ?auto_807546 ) ) ( not ( = ?auto_807545 ?auto_807547 ) ) ( not ( = ?auto_807545 ?auto_807548 ) ) ( not ( = ?auto_807545 ?auto_807549 ) ) ( not ( = ?auto_807546 ?auto_807547 ) ) ( not ( = ?auto_807546 ?auto_807548 ) ) ( not ( = ?auto_807546 ?auto_807549 ) ) ( not ( = ?auto_807547 ?auto_807548 ) ) ( not ( = ?auto_807547 ?auto_807549 ) ) ( not ( = ?auto_807548 ?auto_807549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_807548 ?auto_807549 )
      ( !STACK ?auto_807548 ?auto_807547 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807602 - BLOCK
      ?auto_807603 - BLOCK
      ?auto_807604 - BLOCK
      ?auto_807605 - BLOCK
      ?auto_807606 - BLOCK
      ?auto_807607 - BLOCK
      ?auto_807608 - BLOCK
      ?auto_807609 - BLOCK
      ?auto_807610 - BLOCK
      ?auto_807611 - BLOCK
      ?auto_807612 - BLOCK
      ?auto_807613 - BLOCK
      ?auto_807614 - BLOCK
      ?auto_807615 - BLOCK
      ?auto_807616 - BLOCK
      ?auto_807617 - BLOCK
      ?auto_807618 - BLOCK
    )
    :vars
    (
      ?auto_807619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807618 ?auto_807619 ) ( ON-TABLE ?auto_807602 ) ( ON ?auto_807603 ?auto_807602 ) ( ON ?auto_807604 ?auto_807603 ) ( ON ?auto_807605 ?auto_807604 ) ( ON ?auto_807606 ?auto_807605 ) ( ON ?auto_807607 ?auto_807606 ) ( ON ?auto_807608 ?auto_807607 ) ( ON ?auto_807609 ?auto_807608 ) ( ON ?auto_807610 ?auto_807609 ) ( ON ?auto_807611 ?auto_807610 ) ( ON ?auto_807612 ?auto_807611 ) ( ON ?auto_807613 ?auto_807612 ) ( ON ?auto_807614 ?auto_807613 ) ( ON ?auto_807615 ?auto_807614 ) ( ON ?auto_807616 ?auto_807615 ) ( not ( = ?auto_807602 ?auto_807603 ) ) ( not ( = ?auto_807602 ?auto_807604 ) ) ( not ( = ?auto_807602 ?auto_807605 ) ) ( not ( = ?auto_807602 ?auto_807606 ) ) ( not ( = ?auto_807602 ?auto_807607 ) ) ( not ( = ?auto_807602 ?auto_807608 ) ) ( not ( = ?auto_807602 ?auto_807609 ) ) ( not ( = ?auto_807602 ?auto_807610 ) ) ( not ( = ?auto_807602 ?auto_807611 ) ) ( not ( = ?auto_807602 ?auto_807612 ) ) ( not ( = ?auto_807602 ?auto_807613 ) ) ( not ( = ?auto_807602 ?auto_807614 ) ) ( not ( = ?auto_807602 ?auto_807615 ) ) ( not ( = ?auto_807602 ?auto_807616 ) ) ( not ( = ?auto_807602 ?auto_807617 ) ) ( not ( = ?auto_807602 ?auto_807618 ) ) ( not ( = ?auto_807602 ?auto_807619 ) ) ( not ( = ?auto_807603 ?auto_807604 ) ) ( not ( = ?auto_807603 ?auto_807605 ) ) ( not ( = ?auto_807603 ?auto_807606 ) ) ( not ( = ?auto_807603 ?auto_807607 ) ) ( not ( = ?auto_807603 ?auto_807608 ) ) ( not ( = ?auto_807603 ?auto_807609 ) ) ( not ( = ?auto_807603 ?auto_807610 ) ) ( not ( = ?auto_807603 ?auto_807611 ) ) ( not ( = ?auto_807603 ?auto_807612 ) ) ( not ( = ?auto_807603 ?auto_807613 ) ) ( not ( = ?auto_807603 ?auto_807614 ) ) ( not ( = ?auto_807603 ?auto_807615 ) ) ( not ( = ?auto_807603 ?auto_807616 ) ) ( not ( = ?auto_807603 ?auto_807617 ) ) ( not ( = ?auto_807603 ?auto_807618 ) ) ( not ( = ?auto_807603 ?auto_807619 ) ) ( not ( = ?auto_807604 ?auto_807605 ) ) ( not ( = ?auto_807604 ?auto_807606 ) ) ( not ( = ?auto_807604 ?auto_807607 ) ) ( not ( = ?auto_807604 ?auto_807608 ) ) ( not ( = ?auto_807604 ?auto_807609 ) ) ( not ( = ?auto_807604 ?auto_807610 ) ) ( not ( = ?auto_807604 ?auto_807611 ) ) ( not ( = ?auto_807604 ?auto_807612 ) ) ( not ( = ?auto_807604 ?auto_807613 ) ) ( not ( = ?auto_807604 ?auto_807614 ) ) ( not ( = ?auto_807604 ?auto_807615 ) ) ( not ( = ?auto_807604 ?auto_807616 ) ) ( not ( = ?auto_807604 ?auto_807617 ) ) ( not ( = ?auto_807604 ?auto_807618 ) ) ( not ( = ?auto_807604 ?auto_807619 ) ) ( not ( = ?auto_807605 ?auto_807606 ) ) ( not ( = ?auto_807605 ?auto_807607 ) ) ( not ( = ?auto_807605 ?auto_807608 ) ) ( not ( = ?auto_807605 ?auto_807609 ) ) ( not ( = ?auto_807605 ?auto_807610 ) ) ( not ( = ?auto_807605 ?auto_807611 ) ) ( not ( = ?auto_807605 ?auto_807612 ) ) ( not ( = ?auto_807605 ?auto_807613 ) ) ( not ( = ?auto_807605 ?auto_807614 ) ) ( not ( = ?auto_807605 ?auto_807615 ) ) ( not ( = ?auto_807605 ?auto_807616 ) ) ( not ( = ?auto_807605 ?auto_807617 ) ) ( not ( = ?auto_807605 ?auto_807618 ) ) ( not ( = ?auto_807605 ?auto_807619 ) ) ( not ( = ?auto_807606 ?auto_807607 ) ) ( not ( = ?auto_807606 ?auto_807608 ) ) ( not ( = ?auto_807606 ?auto_807609 ) ) ( not ( = ?auto_807606 ?auto_807610 ) ) ( not ( = ?auto_807606 ?auto_807611 ) ) ( not ( = ?auto_807606 ?auto_807612 ) ) ( not ( = ?auto_807606 ?auto_807613 ) ) ( not ( = ?auto_807606 ?auto_807614 ) ) ( not ( = ?auto_807606 ?auto_807615 ) ) ( not ( = ?auto_807606 ?auto_807616 ) ) ( not ( = ?auto_807606 ?auto_807617 ) ) ( not ( = ?auto_807606 ?auto_807618 ) ) ( not ( = ?auto_807606 ?auto_807619 ) ) ( not ( = ?auto_807607 ?auto_807608 ) ) ( not ( = ?auto_807607 ?auto_807609 ) ) ( not ( = ?auto_807607 ?auto_807610 ) ) ( not ( = ?auto_807607 ?auto_807611 ) ) ( not ( = ?auto_807607 ?auto_807612 ) ) ( not ( = ?auto_807607 ?auto_807613 ) ) ( not ( = ?auto_807607 ?auto_807614 ) ) ( not ( = ?auto_807607 ?auto_807615 ) ) ( not ( = ?auto_807607 ?auto_807616 ) ) ( not ( = ?auto_807607 ?auto_807617 ) ) ( not ( = ?auto_807607 ?auto_807618 ) ) ( not ( = ?auto_807607 ?auto_807619 ) ) ( not ( = ?auto_807608 ?auto_807609 ) ) ( not ( = ?auto_807608 ?auto_807610 ) ) ( not ( = ?auto_807608 ?auto_807611 ) ) ( not ( = ?auto_807608 ?auto_807612 ) ) ( not ( = ?auto_807608 ?auto_807613 ) ) ( not ( = ?auto_807608 ?auto_807614 ) ) ( not ( = ?auto_807608 ?auto_807615 ) ) ( not ( = ?auto_807608 ?auto_807616 ) ) ( not ( = ?auto_807608 ?auto_807617 ) ) ( not ( = ?auto_807608 ?auto_807618 ) ) ( not ( = ?auto_807608 ?auto_807619 ) ) ( not ( = ?auto_807609 ?auto_807610 ) ) ( not ( = ?auto_807609 ?auto_807611 ) ) ( not ( = ?auto_807609 ?auto_807612 ) ) ( not ( = ?auto_807609 ?auto_807613 ) ) ( not ( = ?auto_807609 ?auto_807614 ) ) ( not ( = ?auto_807609 ?auto_807615 ) ) ( not ( = ?auto_807609 ?auto_807616 ) ) ( not ( = ?auto_807609 ?auto_807617 ) ) ( not ( = ?auto_807609 ?auto_807618 ) ) ( not ( = ?auto_807609 ?auto_807619 ) ) ( not ( = ?auto_807610 ?auto_807611 ) ) ( not ( = ?auto_807610 ?auto_807612 ) ) ( not ( = ?auto_807610 ?auto_807613 ) ) ( not ( = ?auto_807610 ?auto_807614 ) ) ( not ( = ?auto_807610 ?auto_807615 ) ) ( not ( = ?auto_807610 ?auto_807616 ) ) ( not ( = ?auto_807610 ?auto_807617 ) ) ( not ( = ?auto_807610 ?auto_807618 ) ) ( not ( = ?auto_807610 ?auto_807619 ) ) ( not ( = ?auto_807611 ?auto_807612 ) ) ( not ( = ?auto_807611 ?auto_807613 ) ) ( not ( = ?auto_807611 ?auto_807614 ) ) ( not ( = ?auto_807611 ?auto_807615 ) ) ( not ( = ?auto_807611 ?auto_807616 ) ) ( not ( = ?auto_807611 ?auto_807617 ) ) ( not ( = ?auto_807611 ?auto_807618 ) ) ( not ( = ?auto_807611 ?auto_807619 ) ) ( not ( = ?auto_807612 ?auto_807613 ) ) ( not ( = ?auto_807612 ?auto_807614 ) ) ( not ( = ?auto_807612 ?auto_807615 ) ) ( not ( = ?auto_807612 ?auto_807616 ) ) ( not ( = ?auto_807612 ?auto_807617 ) ) ( not ( = ?auto_807612 ?auto_807618 ) ) ( not ( = ?auto_807612 ?auto_807619 ) ) ( not ( = ?auto_807613 ?auto_807614 ) ) ( not ( = ?auto_807613 ?auto_807615 ) ) ( not ( = ?auto_807613 ?auto_807616 ) ) ( not ( = ?auto_807613 ?auto_807617 ) ) ( not ( = ?auto_807613 ?auto_807618 ) ) ( not ( = ?auto_807613 ?auto_807619 ) ) ( not ( = ?auto_807614 ?auto_807615 ) ) ( not ( = ?auto_807614 ?auto_807616 ) ) ( not ( = ?auto_807614 ?auto_807617 ) ) ( not ( = ?auto_807614 ?auto_807618 ) ) ( not ( = ?auto_807614 ?auto_807619 ) ) ( not ( = ?auto_807615 ?auto_807616 ) ) ( not ( = ?auto_807615 ?auto_807617 ) ) ( not ( = ?auto_807615 ?auto_807618 ) ) ( not ( = ?auto_807615 ?auto_807619 ) ) ( not ( = ?auto_807616 ?auto_807617 ) ) ( not ( = ?auto_807616 ?auto_807618 ) ) ( not ( = ?auto_807616 ?auto_807619 ) ) ( not ( = ?auto_807617 ?auto_807618 ) ) ( not ( = ?auto_807617 ?auto_807619 ) ) ( not ( = ?auto_807618 ?auto_807619 ) ) ( CLEAR ?auto_807616 ) ( ON ?auto_807617 ?auto_807618 ) ( CLEAR ?auto_807617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_807602 ?auto_807603 ?auto_807604 ?auto_807605 ?auto_807606 ?auto_807607 ?auto_807608 ?auto_807609 ?auto_807610 ?auto_807611 ?auto_807612 ?auto_807613 ?auto_807614 ?auto_807615 ?auto_807616 ?auto_807617 )
      ( MAKE-17PILE ?auto_807602 ?auto_807603 ?auto_807604 ?auto_807605 ?auto_807606 ?auto_807607 ?auto_807608 ?auto_807609 ?auto_807610 ?auto_807611 ?auto_807612 ?auto_807613 ?auto_807614 ?auto_807615 ?auto_807616 ?auto_807617 ?auto_807618 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807672 - BLOCK
      ?auto_807673 - BLOCK
      ?auto_807674 - BLOCK
      ?auto_807675 - BLOCK
      ?auto_807676 - BLOCK
      ?auto_807677 - BLOCK
      ?auto_807678 - BLOCK
      ?auto_807679 - BLOCK
      ?auto_807680 - BLOCK
      ?auto_807681 - BLOCK
      ?auto_807682 - BLOCK
      ?auto_807683 - BLOCK
      ?auto_807684 - BLOCK
      ?auto_807685 - BLOCK
      ?auto_807686 - BLOCK
      ?auto_807687 - BLOCK
      ?auto_807688 - BLOCK
    )
    :vars
    (
      ?auto_807689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807688 ?auto_807689 ) ( ON-TABLE ?auto_807672 ) ( ON ?auto_807673 ?auto_807672 ) ( ON ?auto_807674 ?auto_807673 ) ( ON ?auto_807675 ?auto_807674 ) ( ON ?auto_807676 ?auto_807675 ) ( ON ?auto_807677 ?auto_807676 ) ( ON ?auto_807678 ?auto_807677 ) ( ON ?auto_807679 ?auto_807678 ) ( ON ?auto_807680 ?auto_807679 ) ( ON ?auto_807681 ?auto_807680 ) ( ON ?auto_807682 ?auto_807681 ) ( ON ?auto_807683 ?auto_807682 ) ( ON ?auto_807684 ?auto_807683 ) ( ON ?auto_807685 ?auto_807684 ) ( not ( = ?auto_807672 ?auto_807673 ) ) ( not ( = ?auto_807672 ?auto_807674 ) ) ( not ( = ?auto_807672 ?auto_807675 ) ) ( not ( = ?auto_807672 ?auto_807676 ) ) ( not ( = ?auto_807672 ?auto_807677 ) ) ( not ( = ?auto_807672 ?auto_807678 ) ) ( not ( = ?auto_807672 ?auto_807679 ) ) ( not ( = ?auto_807672 ?auto_807680 ) ) ( not ( = ?auto_807672 ?auto_807681 ) ) ( not ( = ?auto_807672 ?auto_807682 ) ) ( not ( = ?auto_807672 ?auto_807683 ) ) ( not ( = ?auto_807672 ?auto_807684 ) ) ( not ( = ?auto_807672 ?auto_807685 ) ) ( not ( = ?auto_807672 ?auto_807686 ) ) ( not ( = ?auto_807672 ?auto_807687 ) ) ( not ( = ?auto_807672 ?auto_807688 ) ) ( not ( = ?auto_807672 ?auto_807689 ) ) ( not ( = ?auto_807673 ?auto_807674 ) ) ( not ( = ?auto_807673 ?auto_807675 ) ) ( not ( = ?auto_807673 ?auto_807676 ) ) ( not ( = ?auto_807673 ?auto_807677 ) ) ( not ( = ?auto_807673 ?auto_807678 ) ) ( not ( = ?auto_807673 ?auto_807679 ) ) ( not ( = ?auto_807673 ?auto_807680 ) ) ( not ( = ?auto_807673 ?auto_807681 ) ) ( not ( = ?auto_807673 ?auto_807682 ) ) ( not ( = ?auto_807673 ?auto_807683 ) ) ( not ( = ?auto_807673 ?auto_807684 ) ) ( not ( = ?auto_807673 ?auto_807685 ) ) ( not ( = ?auto_807673 ?auto_807686 ) ) ( not ( = ?auto_807673 ?auto_807687 ) ) ( not ( = ?auto_807673 ?auto_807688 ) ) ( not ( = ?auto_807673 ?auto_807689 ) ) ( not ( = ?auto_807674 ?auto_807675 ) ) ( not ( = ?auto_807674 ?auto_807676 ) ) ( not ( = ?auto_807674 ?auto_807677 ) ) ( not ( = ?auto_807674 ?auto_807678 ) ) ( not ( = ?auto_807674 ?auto_807679 ) ) ( not ( = ?auto_807674 ?auto_807680 ) ) ( not ( = ?auto_807674 ?auto_807681 ) ) ( not ( = ?auto_807674 ?auto_807682 ) ) ( not ( = ?auto_807674 ?auto_807683 ) ) ( not ( = ?auto_807674 ?auto_807684 ) ) ( not ( = ?auto_807674 ?auto_807685 ) ) ( not ( = ?auto_807674 ?auto_807686 ) ) ( not ( = ?auto_807674 ?auto_807687 ) ) ( not ( = ?auto_807674 ?auto_807688 ) ) ( not ( = ?auto_807674 ?auto_807689 ) ) ( not ( = ?auto_807675 ?auto_807676 ) ) ( not ( = ?auto_807675 ?auto_807677 ) ) ( not ( = ?auto_807675 ?auto_807678 ) ) ( not ( = ?auto_807675 ?auto_807679 ) ) ( not ( = ?auto_807675 ?auto_807680 ) ) ( not ( = ?auto_807675 ?auto_807681 ) ) ( not ( = ?auto_807675 ?auto_807682 ) ) ( not ( = ?auto_807675 ?auto_807683 ) ) ( not ( = ?auto_807675 ?auto_807684 ) ) ( not ( = ?auto_807675 ?auto_807685 ) ) ( not ( = ?auto_807675 ?auto_807686 ) ) ( not ( = ?auto_807675 ?auto_807687 ) ) ( not ( = ?auto_807675 ?auto_807688 ) ) ( not ( = ?auto_807675 ?auto_807689 ) ) ( not ( = ?auto_807676 ?auto_807677 ) ) ( not ( = ?auto_807676 ?auto_807678 ) ) ( not ( = ?auto_807676 ?auto_807679 ) ) ( not ( = ?auto_807676 ?auto_807680 ) ) ( not ( = ?auto_807676 ?auto_807681 ) ) ( not ( = ?auto_807676 ?auto_807682 ) ) ( not ( = ?auto_807676 ?auto_807683 ) ) ( not ( = ?auto_807676 ?auto_807684 ) ) ( not ( = ?auto_807676 ?auto_807685 ) ) ( not ( = ?auto_807676 ?auto_807686 ) ) ( not ( = ?auto_807676 ?auto_807687 ) ) ( not ( = ?auto_807676 ?auto_807688 ) ) ( not ( = ?auto_807676 ?auto_807689 ) ) ( not ( = ?auto_807677 ?auto_807678 ) ) ( not ( = ?auto_807677 ?auto_807679 ) ) ( not ( = ?auto_807677 ?auto_807680 ) ) ( not ( = ?auto_807677 ?auto_807681 ) ) ( not ( = ?auto_807677 ?auto_807682 ) ) ( not ( = ?auto_807677 ?auto_807683 ) ) ( not ( = ?auto_807677 ?auto_807684 ) ) ( not ( = ?auto_807677 ?auto_807685 ) ) ( not ( = ?auto_807677 ?auto_807686 ) ) ( not ( = ?auto_807677 ?auto_807687 ) ) ( not ( = ?auto_807677 ?auto_807688 ) ) ( not ( = ?auto_807677 ?auto_807689 ) ) ( not ( = ?auto_807678 ?auto_807679 ) ) ( not ( = ?auto_807678 ?auto_807680 ) ) ( not ( = ?auto_807678 ?auto_807681 ) ) ( not ( = ?auto_807678 ?auto_807682 ) ) ( not ( = ?auto_807678 ?auto_807683 ) ) ( not ( = ?auto_807678 ?auto_807684 ) ) ( not ( = ?auto_807678 ?auto_807685 ) ) ( not ( = ?auto_807678 ?auto_807686 ) ) ( not ( = ?auto_807678 ?auto_807687 ) ) ( not ( = ?auto_807678 ?auto_807688 ) ) ( not ( = ?auto_807678 ?auto_807689 ) ) ( not ( = ?auto_807679 ?auto_807680 ) ) ( not ( = ?auto_807679 ?auto_807681 ) ) ( not ( = ?auto_807679 ?auto_807682 ) ) ( not ( = ?auto_807679 ?auto_807683 ) ) ( not ( = ?auto_807679 ?auto_807684 ) ) ( not ( = ?auto_807679 ?auto_807685 ) ) ( not ( = ?auto_807679 ?auto_807686 ) ) ( not ( = ?auto_807679 ?auto_807687 ) ) ( not ( = ?auto_807679 ?auto_807688 ) ) ( not ( = ?auto_807679 ?auto_807689 ) ) ( not ( = ?auto_807680 ?auto_807681 ) ) ( not ( = ?auto_807680 ?auto_807682 ) ) ( not ( = ?auto_807680 ?auto_807683 ) ) ( not ( = ?auto_807680 ?auto_807684 ) ) ( not ( = ?auto_807680 ?auto_807685 ) ) ( not ( = ?auto_807680 ?auto_807686 ) ) ( not ( = ?auto_807680 ?auto_807687 ) ) ( not ( = ?auto_807680 ?auto_807688 ) ) ( not ( = ?auto_807680 ?auto_807689 ) ) ( not ( = ?auto_807681 ?auto_807682 ) ) ( not ( = ?auto_807681 ?auto_807683 ) ) ( not ( = ?auto_807681 ?auto_807684 ) ) ( not ( = ?auto_807681 ?auto_807685 ) ) ( not ( = ?auto_807681 ?auto_807686 ) ) ( not ( = ?auto_807681 ?auto_807687 ) ) ( not ( = ?auto_807681 ?auto_807688 ) ) ( not ( = ?auto_807681 ?auto_807689 ) ) ( not ( = ?auto_807682 ?auto_807683 ) ) ( not ( = ?auto_807682 ?auto_807684 ) ) ( not ( = ?auto_807682 ?auto_807685 ) ) ( not ( = ?auto_807682 ?auto_807686 ) ) ( not ( = ?auto_807682 ?auto_807687 ) ) ( not ( = ?auto_807682 ?auto_807688 ) ) ( not ( = ?auto_807682 ?auto_807689 ) ) ( not ( = ?auto_807683 ?auto_807684 ) ) ( not ( = ?auto_807683 ?auto_807685 ) ) ( not ( = ?auto_807683 ?auto_807686 ) ) ( not ( = ?auto_807683 ?auto_807687 ) ) ( not ( = ?auto_807683 ?auto_807688 ) ) ( not ( = ?auto_807683 ?auto_807689 ) ) ( not ( = ?auto_807684 ?auto_807685 ) ) ( not ( = ?auto_807684 ?auto_807686 ) ) ( not ( = ?auto_807684 ?auto_807687 ) ) ( not ( = ?auto_807684 ?auto_807688 ) ) ( not ( = ?auto_807684 ?auto_807689 ) ) ( not ( = ?auto_807685 ?auto_807686 ) ) ( not ( = ?auto_807685 ?auto_807687 ) ) ( not ( = ?auto_807685 ?auto_807688 ) ) ( not ( = ?auto_807685 ?auto_807689 ) ) ( not ( = ?auto_807686 ?auto_807687 ) ) ( not ( = ?auto_807686 ?auto_807688 ) ) ( not ( = ?auto_807686 ?auto_807689 ) ) ( not ( = ?auto_807687 ?auto_807688 ) ) ( not ( = ?auto_807687 ?auto_807689 ) ) ( not ( = ?auto_807688 ?auto_807689 ) ) ( ON ?auto_807687 ?auto_807688 ) ( CLEAR ?auto_807685 ) ( ON ?auto_807686 ?auto_807687 ) ( CLEAR ?auto_807686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_807672 ?auto_807673 ?auto_807674 ?auto_807675 ?auto_807676 ?auto_807677 ?auto_807678 ?auto_807679 ?auto_807680 ?auto_807681 ?auto_807682 ?auto_807683 ?auto_807684 ?auto_807685 ?auto_807686 )
      ( MAKE-17PILE ?auto_807672 ?auto_807673 ?auto_807674 ?auto_807675 ?auto_807676 ?auto_807677 ?auto_807678 ?auto_807679 ?auto_807680 ?auto_807681 ?auto_807682 ?auto_807683 ?auto_807684 ?auto_807685 ?auto_807686 ?auto_807687 ?auto_807688 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807742 - BLOCK
      ?auto_807743 - BLOCK
      ?auto_807744 - BLOCK
      ?auto_807745 - BLOCK
      ?auto_807746 - BLOCK
      ?auto_807747 - BLOCK
      ?auto_807748 - BLOCK
      ?auto_807749 - BLOCK
      ?auto_807750 - BLOCK
      ?auto_807751 - BLOCK
      ?auto_807752 - BLOCK
      ?auto_807753 - BLOCK
      ?auto_807754 - BLOCK
      ?auto_807755 - BLOCK
      ?auto_807756 - BLOCK
      ?auto_807757 - BLOCK
      ?auto_807758 - BLOCK
    )
    :vars
    (
      ?auto_807759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807758 ?auto_807759 ) ( ON-TABLE ?auto_807742 ) ( ON ?auto_807743 ?auto_807742 ) ( ON ?auto_807744 ?auto_807743 ) ( ON ?auto_807745 ?auto_807744 ) ( ON ?auto_807746 ?auto_807745 ) ( ON ?auto_807747 ?auto_807746 ) ( ON ?auto_807748 ?auto_807747 ) ( ON ?auto_807749 ?auto_807748 ) ( ON ?auto_807750 ?auto_807749 ) ( ON ?auto_807751 ?auto_807750 ) ( ON ?auto_807752 ?auto_807751 ) ( ON ?auto_807753 ?auto_807752 ) ( ON ?auto_807754 ?auto_807753 ) ( not ( = ?auto_807742 ?auto_807743 ) ) ( not ( = ?auto_807742 ?auto_807744 ) ) ( not ( = ?auto_807742 ?auto_807745 ) ) ( not ( = ?auto_807742 ?auto_807746 ) ) ( not ( = ?auto_807742 ?auto_807747 ) ) ( not ( = ?auto_807742 ?auto_807748 ) ) ( not ( = ?auto_807742 ?auto_807749 ) ) ( not ( = ?auto_807742 ?auto_807750 ) ) ( not ( = ?auto_807742 ?auto_807751 ) ) ( not ( = ?auto_807742 ?auto_807752 ) ) ( not ( = ?auto_807742 ?auto_807753 ) ) ( not ( = ?auto_807742 ?auto_807754 ) ) ( not ( = ?auto_807742 ?auto_807755 ) ) ( not ( = ?auto_807742 ?auto_807756 ) ) ( not ( = ?auto_807742 ?auto_807757 ) ) ( not ( = ?auto_807742 ?auto_807758 ) ) ( not ( = ?auto_807742 ?auto_807759 ) ) ( not ( = ?auto_807743 ?auto_807744 ) ) ( not ( = ?auto_807743 ?auto_807745 ) ) ( not ( = ?auto_807743 ?auto_807746 ) ) ( not ( = ?auto_807743 ?auto_807747 ) ) ( not ( = ?auto_807743 ?auto_807748 ) ) ( not ( = ?auto_807743 ?auto_807749 ) ) ( not ( = ?auto_807743 ?auto_807750 ) ) ( not ( = ?auto_807743 ?auto_807751 ) ) ( not ( = ?auto_807743 ?auto_807752 ) ) ( not ( = ?auto_807743 ?auto_807753 ) ) ( not ( = ?auto_807743 ?auto_807754 ) ) ( not ( = ?auto_807743 ?auto_807755 ) ) ( not ( = ?auto_807743 ?auto_807756 ) ) ( not ( = ?auto_807743 ?auto_807757 ) ) ( not ( = ?auto_807743 ?auto_807758 ) ) ( not ( = ?auto_807743 ?auto_807759 ) ) ( not ( = ?auto_807744 ?auto_807745 ) ) ( not ( = ?auto_807744 ?auto_807746 ) ) ( not ( = ?auto_807744 ?auto_807747 ) ) ( not ( = ?auto_807744 ?auto_807748 ) ) ( not ( = ?auto_807744 ?auto_807749 ) ) ( not ( = ?auto_807744 ?auto_807750 ) ) ( not ( = ?auto_807744 ?auto_807751 ) ) ( not ( = ?auto_807744 ?auto_807752 ) ) ( not ( = ?auto_807744 ?auto_807753 ) ) ( not ( = ?auto_807744 ?auto_807754 ) ) ( not ( = ?auto_807744 ?auto_807755 ) ) ( not ( = ?auto_807744 ?auto_807756 ) ) ( not ( = ?auto_807744 ?auto_807757 ) ) ( not ( = ?auto_807744 ?auto_807758 ) ) ( not ( = ?auto_807744 ?auto_807759 ) ) ( not ( = ?auto_807745 ?auto_807746 ) ) ( not ( = ?auto_807745 ?auto_807747 ) ) ( not ( = ?auto_807745 ?auto_807748 ) ) ( not ( = ?auto_807745 ?auto_807749 ) ) ( not ( = ?auto_807745 ?auto_807750 ) ) ( not ( = ?auto_807745 ?auto_807751 ) ) ( not ( = ?auto_807745 ?auto_807752 ) ) ( not ( = ?auto_807745 ?auto_807753 ) ) ( not ( = ?auto_807745 ?auto_807754 ) ) ( not ( = ?auto_807745 ?auto_807755 ) ) ( not ( = ?auto_807745 ?auto_807756 ) ) ( not ( = ?auto_807745 ?auto_807757 ) ) ( not ( = ?auto_807745 ?auto_807758 ) ) ( not ( = ?auto_807745 ?auto_807759 ) ) ( not ( = ?auto_807746 ?auto_807747 ) ) ( not ( = ?auto_807746 ?auto_807748 ) ) ( not ( = ?auto_807746 ?auto_807749 ) ) ( not ( = ?auto_807746 ?auto_807750 ) ) ( not ( = ?auto_807746 ?auto_807751 ) ) ( not ( = ?auto_807746 ?auto_807752 ) ) ( not ( = ?auto_807746 ?auto_807753 ) ) ( not ( = ?auto_807746 ?auto_807754 ) ) ( not ( = ?auto_807746 ?auto_807755 ) ) ( not ( = ?auto_807746 ?auto_807756 ) ) ( not ( = ?auto_807746 ?auto_807757 ) ) ( not ( = ?auto_807746 ?auto_807758 ) ) ( not ( = ?auto_807746 ?auto_807759 ) ) ( not ( = ?auto_807747 ?auto_807748 ) ) ( not ( = ?auto_807747 ?auto_807749 ) ) ( not ( = ?auto_807747 ?auto_807750 ) ) ( not ( = ?auto_807747 ?auto_807751 ) ) ( not ( = ?auto_807747 ?auto_807752 ) ) ( not ( = ?auto_807747 ?auto_807753 ) ) ( not ( = ?auto_807747 ?auto_807754 ) ) ( not ( = ?auto_807747 ?auto_807755 ) ) ( not ( = ?auto_807747 ?auto_807756 ) ) ( not ( = ?auto_807747 ?auto_807757 ) ) ( not ( = ?auto_807747 ?auto_807758 ) ) ( not ( = ?auto_807747 ?auto_807759 ) ) ( not ( = ?auto_807748 ?auto_807749 ) ) ( not ( = ?auto_807748 ?auto_807750 ) ) ( not ( = ?auto_807748 ?auto_807751 ) ) ( not ( = ?auto_807748 ?auto_807752 ) ) ( not ( = ?auto_807748 ?auto_807753 ) ) ( not ( = ?auto_807748 ?auto_807754 ) ) ( not ( = ?auto_807748 ?auto_807755 ) ) ( not ( = ?auto_807748 ?auto_807756 ) ) ( not ( = ?auto_807748 ?auto_807757 ) ) ( not ( = ?auto_807748 ?auto_807758 ) ) ( not ( = ?auto_807748 ?auto_807759 ) ) ( not ( = ?auto_807749 ?auto_807750 ) ) ( not ( = ?auto_807749 ?auto_807751 ) ) ( not ( = ?auto_807749 ?auto_807752 ) ) ( not ( = ?auto_807749 ?auto_807753 ) ) ( not ( = ?auto_807749 ?auto_807754 ) ) ( not ( = ?auto_807749 ?auto_807755 ) ) ( not ( = ?auto_807749 ?auto_807756 ) ) ( not ( = ?auto_807749 ?auto_807757 ) ) ( not ( = ?auto_807749 ?auto_807758 ) ) ( not ( = ?auto_807749 ?auto_807759 ) ) ( not ( = ?auto_807750 ?auto_807751 ) ) ( not ( = ?auto_807750 ?auto_807752 ) ) ( not ( = ?auto_807750 ?auto_807753 ) ) ( not ( = ?auto_807750 ?auto_807754 ) ) ( not ( = ?auto_807750 ?auto_807755 ) ) ( not ( = ?auto_807750 ?auto_807756 ) ) ( not ( = ?auto_807750 ?auto_807757 ) ) ( not ( = ?auto_807750 ?auto_807758 ) ) ( not ( = ?auto_807750 ?auto_807759 ) ) ( not ( = ?auto_807751 ?auto_807752 ) ) ( not ( = ?auto_807751 ?auto_807753 ) ) ( not ( = ?auto_807751 ?auto_807754 ) ) ( not ( = ?auto_807751 ?auto_807755 ) ) ( not ( = ?auto_807751 ?auto_807756 ) ) ( not ( = ?auto_807751 ?auto_807757 ) ) ( not ( = ?auto_807751 ?auto_807758 ) ) ( not ( = ?auto_807751 ?auto_807759 ) ) ( not ( = ?auto_807752 ?auto_807753 ) ) ( not ( = ?auto_807752 ?auto_807754 ) ) ( not ( = ?auto_807752 ?auto_807755 ) ) ( not ( = ?auto_807752 ?auto_807756 ) ) ( not ( = ?auto_807752 ?auto_807757 ) ) ( not ( = ?auto_807752 ?auto_807758 ) ) ( not ( = ?auto_807752 ?auto_807759 ) ) ( not ( = ?auto_807753 ?auto_807754 ) ) ( not ( = ?auto_807753 ?auto_807755 ) ) ( not ( = ?auto_807753 ?auto_807756 ) ) ( not ( = ?auto_807753 ?auto_807757 ) ) ( not ( = ?auto_807753 ?auto_807758 ) ) ( not ( = ?auto_807753 ?auto_807759 ) ) ( not ( = ?auto_807754 ?auto_807755 ) ) ( not ( = ?auto_807754 ?auto_807756 ) ) ( not ( = ?auto_807754 ?auto_807757 ) ) ( not ( = ?auto_807754 ?auto_807758 ) ) ( not ( = ?auto_807754 ?auto_807759 ) ) ( not ( = ?auto_807755 ?auto_807756 ) ) ( not ( = ?auto_807755 ?auto_807757 ) ) ( not ( = ?auto_807755 ?auto_807758 ) ) ( not ( = ?auto_807755 ?auto_807759 ) ) ( not ( = ?auto_807756 ?auto_807757 ) ) ( not ( = ?auto_807756 ?auto_807758 ) ) ( not ( = ?auto_807756 ?auto_807759 ) ) ( not ( = ?auto_807757 ?auto_807758 ) ) ( not ( = ?auto_807757 ?auto_807759 ) ) ( not ( = ?auto_807758 ?auto_807759 ) ) ( ON ?auto_807757 ?auto_807758 ) ( ON ?auto_807756 ?auto_807757 ) ( CLEAR ?auto_807754 ) ( ON ?auto_807755 ?auto_807756 ) ( CLEAR ?auto_807755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_807742 ?auto_807743 ?auto_807744 ?auto_807745 ?auto_807746 ?auto_807747 ?auto_807748 ?auto_807749 ?auto_807750 ?auto_807751 ?auto_807752 ?auto_807753 ?auto_807754 ?auto_807755 )
      ( MAKE-17PILE ?auto_807742 ?auto_807743 ?auto_807744 ?auto_807745 ?auto_807746 ?auto_807747 ?auto_807748 ?auto_807749 ?auto_807750 ?auto_807751 ?auto_807752 ?auto_807753 ?auto_807754 ?auto_807755 ?auto_807756 ?auto_807757 ?auto_807758 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807812 - BLOCK
      ?auto_807813 - BLOCK
      ?auto_807814 - BLOCK
      ?auto_807815 - BLOCK
      ?auto_807816 - BLOCK
      ?auto_807817 - BLOCK
      ?auto_807818 - BLOCK
      ?auto_807819 - BLOCK
      ?auto_807820 - BLOCK
      ?auto_807821 - BLOCK
      ?auto_807822 - BLOCK
      ?auto_807823 - BLOCK
      ?auto_807824 - BLOCK
      ?auto_807825 - BLOCK
      ?auto_807826 - BLOCK
      ?auto_807827 - BLOCK
      ?auto_807828 - BLOCK
    )
    :vars
    (
      ?auto_807829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807828 ?auto_807829 ) ( ON-TABLE ?auto_807812 ) ( ON ?auto_807813 ?auto_807812 ) ( ON ?auto_807814 ?auto_807813 ) ( ON ?auto_807815 ?auto_807814 ) ( ON ?auto_807816 ?auto_807815 ) ( ON ?auto_807817 ?auto_807816 ) ( ON ?auto_807818 ?auto_807817 ) ( ON ?auto_807819 ?auto_807818 ) ( ON ?auto_807820 ?auto_807819 ) ( ON ?auto_807821 ?auto_807820 ) ( ON ?auto_807822 ?auto_807821 ) ( ON ?auto_807823 ?auto_807822 ) ( not ( = ?auto_807812 ?auto_807813 ) ) ( not ( = ?auto_807812 ?auto_807814 ) ) ( not ( = ?auto_807812 ?auto_807815 ) ) ( not ( = ?auto_807812 ?auto_807816 ) ) ( not ( = ?auto_807812 ?auto_807817 ) ) ( not ( = ?auto_807812 ?auto_807818 ) ) ( not ( = ?auto_807812 ?auto_807819 ) ) ( not ( = ?auto_807812 ?auto_807820 ) ) ( not ( = ?auto_807812 ?auto_807821 ) ) ( not ( = ?auto_807812 ?auto_807822 ) ) ( not ( = ?auto_807812 ?auto_807823 ) ) ( not ( = ?auto_807812 ?auto_807824 ) ) ( not ( = ?auto_807812 ?auto_807825 ) ) ( not ( = ?auto_807812 ?auto_807826 ) ) ( not ( = ?auto_807812 ?auto_807827 ) ) ( not ( = ?auto_807812 ?auto_807828 ) ) ( not ( = ?auto_807812 ?auto_807829 ) ) ( not ( = ?auto_807813 ?auto_807814 ) ) ( not ( = ?auto_807813 ?auto_807815 ) ) ( not ( = ?auto_807813 ?auto_807816 ) ) ( not ( = ?auto_807813 ?auto_807817 ) ) ( not ( = ?auto_807813 ?auto_807818 ) ) ( not ( = ?auto_807813 ?auto_807819 ) ) ( not ( = ?auto_807813 ?auto_807820 ) ) ( not ( = ?auto_807813 ?auto_807821 ) ) ( not ( = ?auto_807813 ?auto_807822 ) ) ( not ( = ?auto_807813 ?auto_807823 ) ) ( not ( = ?auto_807813 ?auto_807824 ) ) ( not ( = ?auto_807813 ?auto_807825 ) ) ( not ( = ?auto_807813 ?auto_807826 ) ) ( not ( = ?auto_807813 ?auto_807827 ) ) ( not ( = ?auto_807813 ?auto_807828 ) ) ( not ( = ?auto_807813 ?auto_807829 ) ) ( not ( = ?auto_807814 ?auto_807815 ) ) ( not ( = ?auto_807814 ?auto_807816 ) ) ( not ( = ?auto_807814 ?auto_807817 ) ) ( not ( = ?auto_807814 ?auto_807818 ) ) ( not ( = ?auto_807814 ?auto_807819 ) ) ( not ( = ?auto_807814 ?auto_807820 ) ) ( not ( = ?auto_807814 ?auto_807821 ) ) ( not ( = ?auto_807814 ?auto_807822 ) ) ( not ( = ?auto_807814 ?auto_807823 ) ) ( not ( = ?auto_807814 ?auto_807824 ) ) ( not ( = ?auto_807814 ?auto_807825 ) ) ( not ( = ?auto_807814 ?auto_807826 ) ) ( not ( = ?auto_807814 ?auto_807827 ) ) ( not ( = ?auto_807814 ?auto_807828 ) ) ( not ( = ?auto_807814 ?auto_807829 ) ) ( not ( = ?auto_807815 ?auto_807816 ) ) ( not ( = ?auto_807815 ?auto_807817 ) ) ( not ( = ?auto_807815 ?auto_807818 ) ) ( not ( = ?auto_807815 ?auto_807819 ) ) ( not ( = ?auto_807815 ?auto_807820 ) ) ( not ( = ?auto_807815 ?auto_807821 ) ) ( not ( = ?auto_807815 ?auto_807822 ) ) ( not ( = ?auto_807815 ?auto_807823 ) ) ( not ( = ?auto_807815 ?auto_807824 ) ) ( not ( = ?auto_807815 ?auto_807825 ) ) ( not ( = ?auto_807815 ?auto_807826 ) ) ( not ( = ?auto_807815 ?auto_807827 ) ) ( not ( = ?auto_807815 ?auto_807828 ) ) ( not ( = ?auto_807815 ?auto_807829 ) ) ( not ( = ?auto_807816 ?auto_807817 ) ) ( not ( = ?auto_807816 ?auto_807818 ) ) ( not ( = ?auto_807816 ?auto_807819 ) ) ( not ( = ?auto_807816 ?auto_807820 ) ) ( not ( = ?auto_807816 ?auto_807821 ) ) ( not ( = ?auto_807816 ?auto_807822 ) ) ( not ( = ?auto_807816 ?auto_807823 ) ) ( not ( = ?auto_807816 ?auto_807824 ) ) ( not ( = ?auto_807816 ?auto_807825 ) ) ( not ( = ?auto_807816 ?auto_807826 ) ) ( not ( = ?auto_807816 ?auto_807827 ) ) ( not ( = ?auto_807816 ?auto_807828 ) ) ( not ( = ?auto_807816 ?auto_807829 ) ) ( not ( = ?auto_807817 ?auto_807818 ) ) ( not ( = ?auto_807817 ?auto_807819 ) ) ( not ( = ?auto_807817 ?auto_807820 ) ) ( not ( = ?auto_807817 ?auto_807821 ) ) ( not ( = ?auto_807817 ?auto_807822 ) ) ( not ( = ?auto_807817 ?auto_807823 ) ) ( not ( = ?auto_807817 ?auto_807824 ) ) ( not ( = ?auto_807817 ?auto_807825 ) ) ( not ( = ?auto_807817 ?auto_807826 ) ) ( not ( = ?auto_807817 ?auto_807827 ) ) ( not ( = ?auto_807817 ?auto_807828 ) ) ( not ( = ?auto_807817 ?auto_807829 ) ) ( not ( = ?auto_807818 ?auto_807819 ) ) ( not ( = ?auto_807818 ?auto_807820 ) ) ( not ( = ?auto_807818 ?auto_807821 ) ) ( not ( = ?auto_807818 ?auto_807822 ) ) ( not ( = ?auto_807818 ?auto_807823 ) ) ( not ( = ?auto_807818 ?auto_807824 ) ) ( not ( = ?auto_807818 ?auto_807825 ) ) ( not ( = ?auto_807818 ?auto_807826 ) ) ( not ( = ?auto_807818 ?auto_807827 ) ) ( not ( = ?auto_807818 ?auto_807828 ) ) ( not ( = ?auto_807818 ?auto_807829 ) ) ( not ( = ?auto_807819 ?auto_807820 ) ) ( not ( = ?auto_807819 ?auto_807821 ) ) ( not ( = ?auto_807819 ?auto_807822 ) ) ( not ( = ?auto_807819 ?auto_807823 ) ) ( not ( = ?auto_807819 ?auto_807824 ) ) ( not ( = ?auto_807819 ?auto_807825 ) ) ( not ( = ?auto_807819 ?auto_807826 ) ) ( not ( = ?auto_807819 ?auto_807827 ) ) ( not ( = ?auto_807819 ?auto_807828 ) ) ( not ( = ?auto_807819 ?auto_807829 ) ) ( not ( = ?auto_807820 ?auto_807821 ) ) ( not ( = ?auto_807820 ?auto_807822 ) ) ( not ( = ?auto_807820 ?auto_807823 ) ) ( not ( = ?auto_807820 ?auto_807824 ) ) ( not ( = ?auto_807820 ?auto_807825 ) ) ( not ( = ?auto_807820 ?auto_807826 ) ) ( not ( = ?auto_807820 ?auto_807827 ) ) ( not ( = ?auto_807820 ?auto_807828 ) ) ( not ( = ?auto_807820 ?auto_807829 ) ) ( not ( = ?auto_807821 ?auto_807822 ) ) ( not ( = ?auto_807821 ?auto_807823 ) ) ( not ( = ?auto_807821 ?auto_807824 ) ) ( not ( = ?auto_807821 ?auto_807825 ) ) ( not ( = ?auto_807821 ?auto_807826 ) ) ( not ( = ?auto_807821 ?auto_807827 ) ) ( not ( = ?auto_807821 ?auto_807828 ) ) ( not ( = ?auto_807821 ?auto_807829 ) ) ( not ( = ?auto_807822 ?auto_807823 ) ) ( not ( = ?auto_807822 ?auto_807824 ) ) ( not ( = ?auto_807822 ?auto_807825 ) ) ( not ( = ?auto_807822 ?auto_807826 ) ) ( not ( = ?auto_807822 ?auto_807827 ) ) ( not ( = ?auto_807822 ?auto_807828 ) ) ( not ( = ?auto_807822 ?auto_807829 ) ) ( not ( = ?auto_807823 ?auto_807824 ) ) ( not ( = ?auto_807823 ?auto_807825 ) ) ( not ( = ?auto_807823 ?auto_807826 ) ) ( not ( = ?auto_807823 ?auto_807827 ) ) ( not ( = ?auto_807823 ?auto_807828 ) ) ( not ( = ?auto_807823 ?auto_807829 ) ) ( not ( = ?auto_807824 ?auto_807825 ) ) ( not ( = ?auto_807824 ?auto_807826 ) ) ( not ( = ?auto_807824 ?auto_807827 ) ) ( not ( = ?auto_807824 ?auto_807828 ) ) ( not ( = ?auto_807824 ?auto_807829 ) ) ( not ( = ?auto_807825 ?auto_807826 ) ) ( not ( = ?auto_807825 ?auto_807827 ) ) ( not ( = ?auto_807825 ?auto_807828 ) ) ( not ( = ?auto_807825 ?auto_807829 ) ) ( not ( = ?auto_807826 ?auto_807827 ) ) ( not ( = ?auto_807826 ?auto_807828 ) ) ( not ( = ?auto_807826 ?auto_807829 ) ) ( not ( = ?auto_807827 ?auto_807828 ) ) ( not ( = ?auto_807827 ?auto_807829 ) ) ( not ( = ?auto_807828 ?auto_807829 ) ) ( ON ?auto_807827 ?auto_807828 ) ( ON ?auto_807826 ?auto_807827 ) ( ON ?auto_807825 ?auto_807826 ) ( CLEAR ?auto_807823 ) ( ON ?auto_807824 ?auto_807825 ) ( CLEAR ?auto_807824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_807812 ?auto_807813 ?auto_807814 ?auto_807815 ?auto_807816 ?auto_807817 ?auto_807818 ?auto_807819 ?auto_807820 ?auto_807821 ?auto_807822 ?auto_807823 ?auto_807824 )
      ( MAKE-17PILE ?auto_807812 ?auto_807813 ?auto_807814 ?auto_807815 ?auto_807816 ?auto_807817 ?auto_807818 ?auto_807819 ?auto_807820 ?auto_807821 ?auto_807822 ?auto_807823 ?auto_807824 ?auto_807825 ?auto_807826 ?auto_807827 ?auto_807828 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807882 - BLOCK
      ?auto_807883 - BLOCK
      ?auto_807884 - BLOCK
      ?auto_807885 - BLOCK
      ?auto_807886 - BLOCK
      ?auto_807887 - BLOCK
      ?auto_807888 - BLOCK
      ?auto_807889 - BLOCK
      ?auto_807890 - BLOCK
      ?auto_807891 - BLOCK
      ?auto_807892 - BLOCK
      ?auto_807893 - BLOCK
      ?auto_807894 - BLOCK
      ?auto_807895 - BLOCK
      ?auto_807896 - BLOCK
      ?auto_807897 - BLOCK
      ?auto_807898 - BLOCK
    )
    :vars
    (
      ?auto_807899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807898 ?auto_807899 ) ( ON-TABLE ?auto_807882 ) ( ON ?auto_807883 ?auto_807882 ) ( ON ?auto_807884 ?auto_807883 ) ( ON ?auto_807885 ?auto_807884 ) ( ON ?auto_807886 ?auto_807885 ) ( ON ?auto_807887 ?auto_807886 ) ( ON ?auto_807888 ?auto_807887 ) ( ON ?auto_807889 ?auto_807888 ) ( ON ?auto_807890 ?auto_807889 ) ( ON ?auto_807891 ?auto_807890 ) ( ON ?auto_807892 ?auto_807891 ) ( not ( = ?auto_807882 ?auto_807883 ) ) ( not ( = ?auto_807882 ?auto_807884 ) ) ( not ( = ?auto_807882 ?auto_807885 ) ) ( not ( = ?auto_807882 ?auto_807886 ) ) ( not ( = ?auto_807882 ?auto_807887 ) ) ( not ( = ?auto_807882 ?auto_807888 ) ) ( not ( = ?auto_807882 ?auto_807889 ) ) ( not ( = ?auto_807882 ?auto_807890 ) ) ( not ( = ?auto_807882 ?auto_807891 ) ) ( not ( = ?auto_807882 ?auto_807892 ) ) ( not ( = ?auto_807882 ?auto_807893 ) ) ( not ( = ?auto_807882 ?auto_807894 ) ) ( not ( = ?auto_807882 ?auto_807895 ) ) ( not ( = ?auto_807882 ?auto_807896 ) ) ( not ( = ?auto_807882 ?auto_807897 ) ) ( not ( = ?auto_807882 ?auto_807898 ) ) ( not ( = ?auto_807882 ?auto_807899 ) ) ( not ( = ?auto_807883 ?auto_807884 ) ) ( not ( = ?auto_807883 ?auto_807885 ) ) ( not ( = ?auto_807883 ?auto_807886 ) ) ( not ( = ?auto_807883 ?auto_807887 ) ) ( not ( = ?auto_807883 ?auto_807888 ) ) ( not ( = ?auto_807883 ?auto_807889 ) ) ( not ( = ?auto_807883 ?auto_807890 ) ) ( not ( = ?auto_807883 ?auto_807891 ) ) ( not ( = ?auto_807883 ?auto_807892 ) ) ( not ( = ?auto_807883 ?auto_807893 ) ) ( not ( = ?auto_807883 ?auto_807894 ) ) ( not ( = ?auto_807883 ?auto_807895 ) ) ( not ( = ?auto_807883 ?auto_807896 ) ) ( not ( = ?auto_807883 ?auto_807897 ) ) ( not ( = ?auto_807883 ?auto_807898 ) ) ( not ( = ?auto_807883 ?auto_807899 ) ) ( not ( = ?auto_807884 ?auto_807885 ) ) ( not ( = ?auto_807884 ?auto_807886 ) ) ( not ( = ?auto_807884 ?auto_807887 ) ) ( not ( = ?auto_807884 ?auto_807888 ) ) ( not ( = ?auto_807884 ?auto_807889 ) ) ( not ( = ?auto_807884 ?auto_807890 ) ) ( not ( = ?auto_807884 ?auto_807891 ) ) ( not ( = ?auto_807884 ?auto_807892 ) ) ( not ( = ?auto_807884 ?auto_807893 ) ) ( not ( = ?auto_807884 ?auto_807894 ) ) ( not ( = ?auto_807884 ?auto_807895 ) ) ( not ( = ?auto_807884 ?auto_807896 ) ) ( not ( = ?auto_807884 ?auto_807897 ) ) ( not ( = ?auto_807884 ?auto_807898 ) ) ( not ( = ?auto_807884 ?auto_807899 ) ) ( not ( = ?auto_807885 ?auto_807886 ) ) ( not ( = ?auto_807885 ?auto_807887 ) ) ( not ( = ?auto_807885 ?auto_807888 ) ) ( not ( = ?auto_807885 ?auto_807889 ) ) ( not ( = ?auto_807885 ?auto_807890 ) ) ( not ( = ?auto_807885 ?auto_807891 ) ) ( not ( = ?auto_807885 ?auto_807892 ) ) ( not ( = ?auto_807885 ?auto_807893 ) ) ( not ( = ?auto_807885 ?auto_807894 ) ) ( not ( = ?auto_807885 ?auto_807895 ) ) ( not ( = ?auto_807885 ?auto_807896 ) ) ( not ( = ?auto_807885 ?auto_807897 ) ) ( not ( = ?auto_807885 ?auto_807898 ) ) ( not ( = ?auto_807885 ?auto_807899 ) ) ( not ( = ?auto_807886 ?auto_807887 ) ) ( not ( = ?auto_807886 ?auto_807888 ) ) ( not ( = ?auto_807886 ?auto_807889 ) ) ( not ( = ?auto_807886 ?auto_807890 ) ) ( not ( = ?auto_807886 ?auto_807891 ) ) ( not ( = ?auto_807886 ?auto_807892 ) ) ( not ( = ?auto_807886 ?auto_807893 ) ) ( not ( = ?auto_807886 ?auto_807894 ) ) ( not ( = ?auto_807886 ?auto_807895 ) ) ( not ( = ?auto_807886 ?auto_807896 ) ) ( not ( = ?auto_807886 ?auto_807897 ) ) ( not ( = ?auto_807886 ?auto_807898 ) ) ( not ( = ?auto_807886 ?auto_807899 ) ) ( not ( = ?auto_807887 ?auto_807888 ) ) ( not ( = ?auto_807887 ?auto_807889 ) ) ( not ( = ?auto_807887 ?auto_807890 ) ) ( not ( = ?auto_807887 ?auto_807891 ) ) ( not ( = ?auto_807887 ?auto_807892 ) ) ( not ( = ?auto_807887 ?auto_807893 ) ) ( not ( = ?auto_807887 ?auto_807894 ) ) ( not ( = ?auto_807887 ?auto_807895 ) ) ( not ( = ?auto_807887 ?auto_807896 ) ) ( not ( = ?auto_807887 ?auto_807897 ) ) ( not ( = ?auto_807887 ?auto_807898 ) ) ( not ( = ?auto_807887 ?auto_807899 ) ) ( not ( = ?auto_807888 ?auto_807889 ) ) ( not ( = ?auto_807888 ?auto_807890 ) ) ( not ( = ?auto_807888 ?auto_807891 ) ) ( not ( = ?auto_807888 ?auto_807892 ) ) ( not ( = ?auto_807888 ?auto_807893 ) ) ( not ( = ?auto_807888 ?auto_807894 ) ) ( not ( = ?auto_807888 ?auto_807895 ) ) ( not ( = ?auto_807888 ?auto_807896 ) ) ( not ( = ?auto_807888 ?auto_807897 ) ) ( not ( = ?auto_807888 ?auto_807898 ) ) ( not ( = ?auto_807888 ?auto_807899 ) ) ( not ( = ?auto_807889 ?auto_807890 ) ) ( not ( = ?auto_807889 ?auto_807891 ) ) ( not ( = ?auto_807889 ?auto_807892 ) ) ( not ( = ?auto_807889 ?auto_807893 ) ) ( not ( = ?auto_807889 ?auto_807894 ) ) ( not ( = ?auto_807889 ?auto_807895 ) ) ( not ( = ?auto_807889 ?auto_807896 ) ) ( not ( = ?auto_807889 ?auto_807897 ) ) ( not ( = ?auto_807889 ?auto_807898 ) ) ( not ( = ?auto_807889 ?auto_807899 ) ) ( not ( = ?auto_807890 ?auto_807891 ) ) ( not ( = ?auto_807890 ?auto_807892 ) ) ( not ( = ?auto_807890 ?auto_807893 ) ) ( not ( = ?auto_807890 ?auto_807894 ) ) ( not ( = ?auto_807890 ?auto_807895 ) ) ( not ( = ?auto_807890 ?auto_807896 ) ) ( not ( = ?auto_807890 ?auto_807897 ) ) ( not ( = ?auto_807890 ?auto_807898 ) ) ( not ( = ?auto_807890 ?auto_807899 ) ) ( not ( = ?auto_807891 ?auto_807892 ) ) ( not ( = ?auto_807891 ?auto_807893 ) ) ( not ( = ?auto_807891 ?auto_807894 ) ) ( not ( = ?auto_807891 ?auto_807895 ) ) ( not ( = ?auto_807891 ?auto_807896 ) ) ( not ( = ?auto_807891 ?auto_807897 ) ) ( not ( = ?auto_807891 ?auto_807898 ) ) ( not ( = ?auto_807891 ?auto_807899 ) ) ( not ( = ?auto_807892 ?auto_807893 ) ) ( not ( = ?auto_807892 ?auto_807894 ) ) ( not ( = ?auto_807892 ?auto_807895 ) ) ( not ( = ?auto_807892 ?auto_807896 ) ) ( not ( = ?auto_807892 ?auto_807897 ) ) ( not ( = ?auto_807892 ?auto_807898 ) ) ( not ( = ?auto_807892 ?auto_807899 ) ) ( not ( = ?auto_807893 ?auto_807894 ) ) ( not ( = ?auto_807893 ?auto_807895 ) ) ( not ( = ?auto_807893 ?auto_807896 ) ) ( not ( = ?auto_807893 ?auto_807897 ) ) ( not ( = ?auto_807893 ?auto_807898 ) ) ( not ( = ?auto_807893 ?auto_807899 ) ) ( not ( = ?auto_807894 ?auto_807895 ) ) ( not ( = ?auto_807894 ?auto_807896 ) ) ( not ( = ?auto_807894 ?auto_807897 ) ) ( not ( = ?auto_807894 ?auto_807898 ) ) ( not ( = ?auto_807894 ?auto_807899 ) ) ( not ( = ?auto_807895 ?auto_807896 ) ) ( not ( = ?auto_807895 ?auto_807897 ) ) ( not ( = ?auto_807895 ?auto_807898 ) ) ( not ( = ?auto_807895 ?auto_807899 ) ) ( not ( = ?auto_807896 ?auto_807897 ) ) ( not ( = ?auto_807896 ?auto_807898 ) ) ( not ( = ?auto_807896 ?auto_807899 ) ) ( not ( = ?auto_807897 ?auto_807898 ) ) ( not ( = ?auto_807897 ?auto_807899 ) ) ( not ( = ?auto_807898 ?auto_807899 ) ) ( ON ?auto_807897 ?auto_807898 ) ( ON ?auto_807896 ?auto_807897 ) ( ON ?auto_807895 ?auto_807896 ) ( ON ?auto_807894 ?auto_807895 ) ( CLEAR ?auto_807892 ) ( ON ?auto_807893 ?auto_807894 ) ( CLEAR ?auto_807893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_807882 ?auto_807883 ?auto_807884 ?auto_807885 ?auto_807886 ?auto_807887 ?auto_807888 ?auto_807889 ?auto_807890 ?auto_807891 ?auto_807892 ?auto_807893 )
      ( MAKE-17PILE ?auto_807882 ?auto_807883 ?auto_807884 ?auto_807885 ?auto_807886 ?auto_807887 ?auto_807888 ?auto_807889 ?auto_807890 ?auto_807891 ?auto_807892 ?auto_807893 ?auto_807894 ?auto_807895 ?auto_807896 ?auto_807897 ?auto_807898 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_807952 - BLOCK
      ?auto_807953 - BLOCK
      ?auto_807954 - BLOCK
      ?auto_807955 - BLOCK
      ?auto_807956 - BLOCK
      ?auto_807957 - BLOCK
      ?auto_807958 - BLOCK
      ?auto_807959 - BLOCK
      ?auto_807960 - BLOCK
      ?auto_807961 - BLOCK
      ?auto_807962 - BLOCK
      ?auto_807963 - BLOCK
      ?auto_807964 - BLOCK
      ?auto_807965 - BLOCK
      ?auto_807966 - BLOCK
      ?auto_807967 - BLOCK
      ?auto_807968 - BLOCK
    )
    :vars
    (
      ?auto_807969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_807968 ?auto_807969 ) ( ON-TABLE ?auto_807952 ) ( ON ?auto_807953 ?auto_807952 ) ( ON ?auto_807954 ?auto_807953 ) ( ON ?auto_807955 ?auto_807954 ) ( ON ?auto_807956 ?auto_807955 ) ( ON ?auto_807957 ?auto_807956 ) ( ON ?auto_807958 ?auto_807957 ) ( ON ?auto_807959 ?auto_807958 ) ( ON ?auto_807960 ?auto_807959 ) ( ON ?auto_807961 ?auto_807960 ) ( not ( = ?auto_807952 ?auto_807953 ) ) ( not ( = ?auto_807952 ?auto_807954 ) ) ( not ( = ?auto_807952 ?auto_807955 ) ) ( not ( = ?auto_807952 ?auto_807956 ) ) ( not ( = ?auto_807952 ?auto_807957 ) ) ( not ( = ?auto_807952 ?auto_807958 ) ) ( not ( = ?auto_807952 ?auto_807959 ) ) ( not ( = ?auto_807952 ?auto_807960 ) ) ( not ( = ?auto_807952 ?auto_807961 ) ) ( not ( = ?auto_807952 ?auto_807962 ) ) ( not ( = ?auto_807952 ?auto_807963 ) ) ( not ( = ?auto_807952 ?auto_807964 ) ) ( not ( = ?auto_807952 ?auto_807965 ) ) ( not ( = ?auto_807952 ?auto_807966 ) ) ( not ( = ?auto_807952 ?auto_807967 ) ) ( not ( = ?auto_807952 ?auto_807968 ) ) ( not ( = ?auto_807952 ?auto_807969 ) ) ( not ( = ?auto_807953 ?auto_807954 ) ) ( not ( = ?auto_807953 ?auto_807955 ) ) ( not ( = ?auto_807953 ?auto_807956 ) ) ( not ( = ?auto_807953 ?auto_807957 ) ) ( not ( = ?auto_807953 ?auto_807958 ) ) ( not ( = ?auto_807953 ?auto_807959 ) ) ( not ( = ?auto_807953 ?auto_807960 ) ) ( not ( = ?auto_807953 ?auto_807961 ) ) ( not ( = ?auto_807953 ?auto_807962 ) ) ( not ( = ?auto_807953 ?auto_807963 ) ) ( not ( = ?auto_807953 ?auto_807964 ) ) ( not ( = ?auto_807953 ?auto_807965 ) ) ( not ( = ?auto_807953 ?auto_807966 ) ) ( not ( = ?auto_807953 ?auto_807967 ) ) ( not ( = ?auto_807953 ?auto_807968 ) ) ( not ( = ?auto_807953 ?auto_807969 ) ) ( not ( = ?auto_807954 ?auto_807955 ) ) ( not ( = ?auto_807954 ?auto_807956 ) ) ( not ( = ?auto_807954 ?auto_807957 ) ) ( not ( = ?auto_807954 ?auto_807958 ) ) ( not ( = ?auto_807954 ?auto_807959 ) ) ( not ( = ?auto_807954 ?auto_807960 ) ) ( not ( = ?auto_807954 ?auto_807961 ) ) ( not ( = ?auto_807954 ?auto_807962 ) ) ( not ( = ?auto_807954 ?auto_807963 ) ) ( not ( = ?auto_807954 ?auto_807964 ) ) ( not ( = ?auto_807954 ?auto_807965 ) ) ( not ( = ?auto_807954 ?auto_807966 ) ) ( not ( = ?auto_807954 ?auto_807967 ) ) ( not ( = ?auto_807954 ?auto_807968 ) ) ( not ( = ?auto_807954 ?auto_807969 ) ) ( not ( = ?auto_807955 ?auto_807956 ) ) ( not ( = ?auto_807955 ?auto_807957 ) ) ( not ( = ?auto_807955 ?auto_807958 ) ) ( not ( = ?auto_807955 ?auto_807959 ) ) ( not ( = ?auto_807955 ?auto_807960 ) ) ( not ( = ?auto_807955 ?auto_807961 ) ) ( not ( = ?auto_807955 ?auto_807962 ) ) ( not ( = ?auto_807955 ?auto_807963 ) ) ( not ( = ?auto_807955 ?auto_807964 ) ) ( not ( = ?auto_807955 ?auto_807965 ) ) ( not ( = ?auto_807955 ?auto_807966 ) ) ( not ( = ?auto_807955 ?auto_807967 ) ) ( not ( = ?auto_807955 ?auto_807968 ) ) ( not ( = ?auto_807955 ?auto_807969 ) ) ( not ( = ?auto_807956 ?auto_807957 ) ) ( not ( = ?auto_807956 ?auto_807958 ) ) ( not ( = ?auto_807956 ?auto_807959 ) ) ( not ( = ?auto_807956 ?auto_807960 ) ) ( not ( = ?auto_807956 ?auto_807961 ) ) ( not ( = ?auto_807956 ?auto_807962 ) ) ( not ( = ?auto_807956 ?auto_807963 ) ) ( not ( = ?auto_807956 ?auto_807964 ) ) ( not ( = ?auto_807956 ?auto_807965 ) ) ( not ( = ?auto_807956 ?auto_807966 ) ) ( not ( = ?auto_807956 ?auto_807967 ) ) ( not ( = ?auto_807956 ?auto_807968 ) ) ( not ( = ?auto_807956 ?auto_807969 ) ) ( not ( = ?auto_807957 ?auto_807958 ) ) ( not ( = ?auto_807957 ?auto_807959 ) ) ( not ( = ?auto_807957 ?auto_807960 ) ) ( not ( = ?auto_807957 ?auto_807961 ) ) ( not ( = ?auto_807957 ?auto_807962 ) ) ( not ( = ?auto_807957 ?auto_807963 ) ) ( not ( = ?auto_807957 ?auto_807964 ) ) ( not ( = ?auto_807957 ?auto_807965 ) ) ( not ( = ?auto_807957 ?auto_807966 ) ) ( not ( = ?auto_807957 ?auto_807967 ) ) ( not ( = ?auto_807957 ?auto_807968 ) ) ( not ( = ?auto_807957 ?auto_807969 ) ) ( not ( = ?auto_807958 ?auto_807959 ) ) ( not ( = ?auto_807958 ?auto_807960 ) ) ( not ( = ?auto_807958 ?auto_807961 ) ) ( not ( = ?auto_807958 ?auto_807962 ) ) ( not ( = ?auto_807958 ?auto_807963 ) ) ( not ( = ?auto_807958 ?auto_807964 ) ) ( not ( = ?auto_807958 ?auto_807965 ) ) ( not ( = ?auto_807958 ?auto_807966 ) ) ( not ( = ?auto_807958 ?auto_807967 ) ) ( not ( = ?auto_807958 ?auto_807968 ) ) ( not ( = ?auto_807958 ?auto_807969 ) ) ( not ( = ?auto_807959 ?auto_807960 ) ) ( not ( = ?auto_807959 ?auto_807961 ) ) ( not ( = ?auto_807959 ?auto_807962 ) ) ( not ( = ?auto_807959 ?auto_807963 ) ) ( not ( = ?auto_807959 ?auto_807964 ) ) ( not ( = ?auto_807959 ?auto_807965 ) ) ( not ( = ?auto_807959 ?auto_807966 ) ) ( not ( = ?auto_807959 ?auto_807967 ) ) ( not ( = ?auto_807959 ?auto_807968 ) ) ( not ( = ?auto_807959 ?auto_807969 ) ) ( not ( = ?auto_807960 ?auto_807961 ) ) ( not ( = ?auto_807960 ?auto_807962 ) ) ( not ( = ?auto_807960 ?auto_807963 ) ) ( not ( = ?auto_807960 ?auto_807964 ) ) ( not ( = ?auto_807960 ?auto_807965 ) ) ( not ( = ?auto_807960 ?auto_807966 ) ) ( not ( = ?auto_807960 ?auto_807967 ) ) ( not ( = ?auto_807960 ?auto_807968 ) ) ( not ( = ?auto_807960 ?auto_807969 ) ) ( not ( = ?auto_807961 ?auto_807962 ) ) ( not ( = ?auto_807961 ?auto_807963 ) ) ( not ( = ?auto_807961 ?auto_807964 ) ) ( not ( = ?auto_807961 ?auto_807965 ) ) ( not ( = ?auto_807961 ?auto_807966 ) ) ( not ( = ?auto_807961 ?auto_807967 ) ) ( not ( = ?auto_807961 ?auto_807968 ) ) ( not ( = ?auto_807961 ?auto_807969 ) ) ( not ( = ?auto_807962 ?auto_807963 ) ) ( not ( = ?auto_807962 ?auto_807964 ) ) ( not ( = ?auto_807962 ?auto_807965 ) ) ( not ( = ?auto_807962 ?auto_807966 ) ) ( not ( = ?auto_807962 ?auto_807967 ) ) ( not ( = ?auto_807962 ?auto_807968 ) ) ( not ( = ?auto_807962 ?auto_807969 ) ) ( not ( = ?auto_807963 ?auto_807964 ) ) ( not ( = ?auto_807963 ?auto_807965 ) ) ( not ( = ?auto_807963 ?auto_807966 ) ) ( not ( = ?auto_807963 ?auto_807967 ) ) ( not ( = ?auto_807963 ?auto_807968 ) ) ( not ( = ?auto_807963 ?auto_807969 ) ) ( not ( = ?auto_807964 ?auto_807965 ) ) ( not ( = ?auto_807964 ?auto_807966 ) ) ( not ( = ?auto_807964 ?auto_807967 ) ) ( not ( = ?auto_807964 ?auto_807968 ) ) ( not ( = ?auto_807964 ?auto_807969 ) ) ( not ( = ?auto_807965 ?auto_807966 ) ) ( not ( = ?auto_807965 ?auto_807967 ) ) ( not ( = ?auto_807965 ?auto_807968 ) ) ( not ( = ?auto_807965 ?auto_807969 ) ) ( not ( = ?auto_807966 ?auto_807967 ) ) ( not ( = ?auto_807966 ?auto_807968 ) ) ( not ( = ?auto_807966 ?auto_807969 ) ) ( not ( = ?auto_807967 ?auto_807968 ) ) ( not ( = ?auto_807967 ?auto_807969 ) ) ( not ( = ?auto_807968 ?auto_807969 ) ) ( ON ?auto_807967 ?auto_807968 ) ( ON ?auto_807966 ?auto_807967 ) ( ON ?auto_807965 ?auto_807966 ) ( ON ?auto_807964 ?auto_807965 ) ( ON ?auto_807963 ?auto_807964 ) ( CLEAR ?auto_807961 ) ( ON ?auto_807962 ?auto_807963 ) ( CLEAR ?auto_807962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_807952 ?auto_807953 ?auto_807954 ?auto_807955 ?auto_807956 ?auto_807957 ?auto_807958 ?auto_807959 ?auto_807960 ?auto_807961 ?auto_807962 )
      ( MAKE-17PILE ?auto_807952 ?auto_807953 ?auto_807954 ?auto_807955 ?auto_807956 ?auto_807957 ?auto_807958 ?auto_807959 ?auto_807960 ?auto_807961 ?auto_807962 ?auto_807963 ?auto_807964 ?auto_807965 ?auto_807966 ?auto_807967 ?auto_807968 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808022 - BLOCK
      ?auto_808023 - BLOCK
      ?auto_808024 - BLOCK
      ?auto_808025 - BLOCK
      ?auto_808026 - BLOCK
      ?auto_808027 - BLOCK
      ?auto_808028 - BLOCK
      ?auto_808029 - BLOCK
      ?auto_808030 - BLOCK
      ?auto_808031 - BLOCK
      ?auto_808032 - BLOCK
      ?auto_808033 - BLOCK
      ?auto_808034 - BLOCK
      ?auto_808035 - BLOCK
      ?auto_808036 - BLOCK
      ?auto_808037 - BLOCK
      ?auto_808038 - BLOCK
    )
    :vars
    (
      ?auto_808039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808038 ?auto_808039 ) ( ON-TABLE ?auto_808022 ) ( ON ?auto_808023 ?auto_808022 ) ( ON ?auto_808024 ?auto_808023 ) ( ON ?auto_808025 ?auto_808024 ) ( ON ?auto_808026 ?auto_808025 ) ( ON ?auto_808027 ?auto_808026 ) ( ON ?auto_808028 ?auto_808027 ) ( ON ?auto_808029 ?auto_808028 ) ( ON ?auto_808030 ?auto_808029 ) ( not ( = ?auto_808022 ?auto_808023 ) ) ( not ( = ?auto_808022 ?auto_808024 ) ) ( not ( = ?auto_808022 ?auto_808025 ) ) ( not ( = ?auto_808022 ?auto_808026 ) ) ( not ( = ?auto_808022 ?auto_808027 ) ) ( not ( = ?auto_808022 ?auto_808028 ) ) ( not ( = ?auto_808022 ?auto_808029 ) ) ( not ( = ?auto_808022 ?auto_808030 ) ) ( not ( = ?auto_808022 ?auto_808031 ) ) ( not ( = ?auto_808022 ?auto_808032 ) ) ( not ( = ?auto_808022 ?auto_808033 ) ) ( not ( = ?auto_808022 ?auto_808034 ) ) ( not ( = ?auto_808022 ?auto_808035 ) ) ( not ( = ?auto_808022 ?auto_808036 ) ) ( not ( = ?auto_808022 ?auto_808037 ) ) ( not ( = ?auto_808022 ?auto_808038 ) ) ( not ( = ?auto_808022 ?auto_808039 ) ) ( not ( = ?auto_808023 ?auto_808024 ) ) ( not ( = ?auto_808023 ?auto_808025 ) ) ( not ( = ?auto_808023 ?auto_808026 ) ) ( not ( = ?auto_808023 ?auto_808027 ) ) ( not ( = ?auto_808023 ?auto_808028 ) ) ( not ( = ?auto_808023 ?auto_808029 ) ) ( not ( = ?auto_808023 ?auto_808030 ) ) ( not ( = ?auto_808023 ?auto_808031 ) ) ( not ( = ?auto_808023 ?auto_808032 ) ) ( not ( = ?auto_808023 ?auto_808033 ) ) ( not ( = ?auto_808023 ?auto_808034 ) ) ( not ( = ?auto_808023 ?auto_808035 ) ) ( not ( = ?auto_808023 ?auto_808036 ) ) ( not ( = ?auto_808023 ?auto_808037 ) ) ( not ( = ?auto_808023 ?auto_808038 ) ) ( not ( = ?auto_808023 ?auto_808039 ) ) ( not ( = ?auto_808024 ?auto_808025 ) ) ( not ( = ?auto_808024 ?auto_808026 ) ) ( not ( = ?auto_808024 ?auto_808027 ) ) ( not ( = ?auto_808024 ?auto_808028 ) ) ( not ( = ?auto_808024 ?auto_808029 ) ) ( not ( = ?auto_808024 ?auto_808030 ) ) ( not ( = ?auto_808024 ?auto_808031 ) ) ( not ( = ?auto_808024 ?auto_808032 ) ) ( not ( = ?auto_808024 ?auto_808033 ) ) ( not ( = ?auto_808024 ?auto_808034 ) ) ( not ( = ?auto_808024 ?auto_808035 ) ) ( not ( = ?auto_808024 ?auto_808036 ) ) ( not ( = ?auto_808024 ?auto_808037 ) ) ( not ( = ?auto_808024 ?auto_808038 ) ) ( not ( = ?auto_808024 ?auto_808039 ) ) ( not ( = ?auto_808025 ?auto_808026 ) ) ( not ( = ?auto_808025 ?auto_808027 ) ) ( not ( = ?auto_808025 ?auto_808028 ) ) ( not ( = ?auto_808025 ?auto_808029 ) ) ( not ( = ?auto_808025 ?auto_808030 ) ) ( not ( = ?auto_808025 ?auto_808031 ) ) ( not ( = ?auto_808025 ?auto_808032 ) ) ( not ( = ?auto_808025 ?auto_808033 ) ) ( not ( = ?auto_808025 ?auto_808034 ) ) ( not ( = ?auto_808025 ?auto_808035 ) ) ( not ( = ?auto_808025 ?auto_808036 ) ) ( not ( = ?auto_808025 ?auto_808037 ) ) ( not ( = ?auto_808025 ?auto_808038 ) ) ( not ( = ?auto_808025 ?auto_808039 ) ) ( not ( = ?auto_808026 ?auto_808027 ) ) ( not ( = ?auto_808026 ?auto_808028 ) ) ( not ( = ?auto_808026 ?auto_808029 ) ) ( not ( = ?auto_808026 ?auto_808030 ) ) ( not ( = ?auto_808026 ?auto_808031 ) ) ( not ( = ?auto_808026 ?auto_808032 ) ) ( not ( = ?auto_808026 ?auto_808033 ) ) ( not ( = ?auto_808026 ?auto_808034 ) ) ( not ( = ?auto_808026 ?auto_808035 ) ) ( not ( = ?auto_808026 ?auto_808036 ) ) ( not ( = ?auto_808026 ?auto_808037 ) ) ( not ( = ?auto_808026 ?auto_808038 ) ) ( not ( = ?auto_808026 ?auto_808039 ) ) ( not ( = ?auto_808027 ?auto_808028 ) ) ( not ( = ?auto_808027 ?auto_808029 ) ) ( not ( = ?auto_808027 ?auto_808030 ) ) ( not ( = ?auto_808027 ?auto_808031 ) ) ( not ( = ?auto_808027 ?auto_808032 ) ) ( not ( = ?auto_808027 ?auto_808033 ) ) ( not ( = ?auto_808027 ?auto_808034 ) ) ( not ( = ?auto_808027 ?auto_808035 ) ) ( not ( = ?auto_808027 ?auto_808036 ) ) ( not ( = ?auto_808027 ?auto_808037 ) ) ( not ( = ?auto_808027 ?auto_808038 ) ) ( not ( = ?auto_808027 ?auto_808039 ) ) ( not ( = ?auto_808028 ?auto_808029 ) ) ( not ( = ?auto_808028 ?auto_808030 ) ) ( not ( = ?auto_808028 ?auto_808031 ) ) ( not ( = ?auto_808028 ?auto_808032 ) ) ( not ( = ?auto_808028 ?auto_808033 ) ) ( not ( = ?auto_808028 ?auto_808034 ) ) ( not ( = ?auto_808028 ?auto_808035 ) ) ( not ( = ?auto_808028 ?auto_808036 ) ) ( not ( = ?auto_808028 ?auto_808037 ) ) ( not ( = ?auto_808028 ?auto_808038 ) ) ( not ( = ?auto_808028 ?auto_808039 ) ) ( not ( = ?auto_808029 ?auto_808030 ) ) ( not ( = ?auto_808029 ?auto_808031 ) ) ( not ( = ?auto_808029 ?auto_808032 ) ) ( not ( = ?auto_808029 ?auto_808033 ) ) ( not ( = ?auto_808029 ?auto_808034 ) ) ( not ( = ?auto_808029 ?auto_808035 ) ) ( not ( = ?auto_808029 ?auto_808036 ) ) ( not ( = ?auto_808029 ?auto_808037 ) ) ( not ( = ?auto_808029 ?auto_808038 ) ) ( not ( = ?auto_808029 ?auto_808039 ) ) ( not ( = ?auto_808030 ?auto_808031 ) ) ( not ( = ?auto_808030 ?auto_808032 ) ) ( not ( = ?auto_808030 ?auto_808033 ) ) ( not ( = ?auto_808030 ?auto_808034 ) ) ( not ( = ?auto_808030 ?auto_808035 ) ) ( not ( = ?auto_808030 ?auto_808036 ) ) ( not ( = ?auto_808030 ?auto_808037 ) ) ( not ( = ?auto_808030 ?auto_808038 ) ) ( not ( = ?auto_808030 ?auto_808039 ) ) ( not ( = ?auto_808031 ?auto_808032 ) ) ( not ( = ?auto_808031 ?auto_808033 ) ) ( not ( = ?auto_808031 ?auto_808034 ) ) ( not ( = ?auto_808031 ?auto_808035 ) ) ( not ( = ?auto_808031 ?auto_808036 ) ) ( not ( = ?auto_808031 ?auto_808037 ) ) ( not ( = ?auto_808031 ?auto_808038 ) ) ( not ( = ?auto_808031 ?auto_808039 ) ) ( not ( = ?auto_808032 ?auto_808033 ) ) ( not ( = ?auto_808032 ?auto_808034 ) ) ( not ( = ?auto_808032 ?auto_808035 ) ) ( not ( = ?auto_808032 ?auto_808036 ) ) ( not ( = ?auto_808032 ?auto_808037 ) ) ( not ( = ?auto_808032 ?auto_808038 ) ) ( not ( = ?auto_808032 ?auto_808039 ) ) ( not ( = ?auto_808033 ?auto_808034 ) ) ( not ( = ?auto_808033 ?auto_808035 ) ) ( not ( = ?auto_808033 ?auto_808036 ) ) ( not ( = ?auto_808033 ?auto_808037 ) ) ( not ( = ?auto_808033 ?auto_808038 ) ) ( not ( = ?auto_808033 ?auto_808039 ) ) ( not ( = ?auto_808034 ?auto_808035 ) ) ( not ( = ?auto_808034 ?auto_808036 ) ) ( not ( = ?auto_808034 ?auto_808037 ) ) ( not ( = ?auto_808034 ?auto_808038 ) ) ( not ( = ?auto_808034 ?auto_808039 ) ) ( not ( = ?auto_808035 ?auto_808036 ) ) ( not ( = ?auto_808035 ?auto_808037 ) ) ( not ( = ?auto_808035 ?auto_808038 ) ) ( not ( = ?auto_808035 ?auto_808039 ) ) ( not ( = ?auto_808036 ?auto_808037 ) ) ( not ( = ?auto_808036 ?auto_808038 ) ) ( not ( = ?auto_808036 ?auto_808039 ) ) ( not ( = ?auto_808037 ?auto_808038 ) ) ( not ( = ?auto_808037 ?auto_808039 ) ) ( not ( = ?auto_808038 ?auto_808039 ) ) ( ON ?auto_808037 ?auto_808038 ) ( ON ?auto_808036 ?auto_808037 ) ( ON ?auto_808035 ?auto_808036 ) ( ON ?auto_808034 ?auto_808035 ) ( ON ?auto_808033 ?auto_808034 ) ( ON ?auto_808032 ?auto_808033 ) ( CLEAR ?auto_808030 ) ( ON ?auto_808031 ?auto_808032 ) ( CLEAR ?auto_808031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_808022 ?auto_808023 ?auto_808024 ?auto_808025 ?auto_808026 ?auto_808027 ?auto_808028 ?auto_808029 ?auto_808030 ?auto_808031 )
      ( MAKE-17PILE ?auto_808022 ?auto_808023 ?auto_808024 ?auto_808025 ?auto_808026 ?auto_808027 ?auto_808028 ?auto_808029 ?auto_808030 ?auto_808031 ?auto_808032 ?auto_808033 ?auto_808034 ?auto_808035 ?auto_808036 ?auto_808037 ?auto_808038 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808092 - BLOCK
      ?auto_808093 - BLOCK
      ?auto_808094 - BLOCK
      ?auto_808095 - BLOCK
      ?auto_808096 - BLOCK
      ?auto_808097 - BLOCK
      ?auto_808098 - BLOCK
      ?auto_808099 - BLOCK
      ?auto_808100 - BLOCK
      ?auto_808101 - BLOCK
      ?auto_808102 - BLOCK
      ?auto_808103 - BLOCK
      ?auto_808104 - BLOCK
      ?auto_808105 - BLOCK
      ?auto_808106 - BLOCK
      ?auto_808107 - BLOCK
      ?auto_808108 - BLOCK
    )
    :vars
    (
      ?auto_808109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808108 ?auto_808109 ) ( ON-TABLE ?auto_808092 ) ( ON ?auto_808093 ?auto_808092 ) ( ON ?auto_808094 ?auto_808093 ) ( ON ?auto_808095 ?auto_808094 ) ( ON ?auto_808096 ?auto_808095 ) ( ON ?auto_808097 ?auto_808096 ) ( ON ?auto_808098 ?auto_808097 ) ( ON ?auto_808099 ?auto_808098 ) ( not ( = ?auto_808092 ?auto_808093 ) ) ( not ( = ?auto_808092 ?auto_808094 ) ) ( not ( = ?auto_808092 ?auto_808095 ) ) ( not ( = ?auto_808092 ?auto_808096 ) ) ( not ( = ?auto_808092 ?auto_808097 ) ) ( not ( = ?auto_808092 ?auto_808098 ) ) ( not ( = ?auto_808092 ?auto_808099 ) ) ( not ( = ?auto_808092 ?auto_808100 ) ) ( not ( = ?auto_808092 ?auto_808101 ) ) ( not ( = ?auto_808092 ?auto_808102 ) ) ( not ( = ?auto_808092 ?auto_808103 ) ) ( not ( = ?auto_808092 ?auto_808104 ) ) ( not ( = ?auto_808092 ?auto_808105 ) ) ( not ( = ?auto_808092 ?auto_808106 ) ) ( not ( = ?auto_808092 ?auto_808107 ) ) ( not ( = ?auto_808092 ?auto_808108 ) ) ( not ( = ?auto_808092 ?auto_808109 ) ) ( not ( = ?auto_808093 ?auto_808094 ) ) ( not ( = ?auto_808093 ?auto_808095 ) ) ( not ( = ?auto_808093 ?auto_808096 ) ) ( not ( = ?auto_808093 ?auto_808097 ) ) ( not ( = ?auto_808093 ?auto_808098 ) ) ( not ( = ?auto_808093 ?auto_808099 ) ) ( not ( = ?auto_808093 ?auto_808100 ) ) ( not ( = ?auto_808093 ?auto_808101 ) ) ( not ( = ?auto_808093 ?auto_808102 ) ) ( not ( = ?auto_808093 ?auto_808103 ) ) ( not ( = ?auto_808093 ?auto_808104 ) ) ( not ( = ?auto_808093 ?auto_808105 ) ) ( not ( = ?auto_808093 ?auto_808106 ) ) ( not ( = ?auto_808093 ?auto_808107 ) ) ( not ( = ?auto_808093 ?auto_808108 ) ) ( not ( = ?auto_808093 ?auto_808109 ) ) ( not ( = ?auto_808094 ?auto_808095 ) ) ( not ( = ?auto_808094 ?auto_808096 ) ) ( not ( = ?auto_808094 ?auto_808097 ) ) ( not ( = ?auto_808094 ?auto_808098 ) ) ( not ( = ?auto_808094 ?auto_808099 ) ) ( not ( = ?auto_808094 ?auto_808100 ) ) ( not ( = ?auto_808094 ?auto_808101 ) ) ( not ( = ?auto_808094 ?auto_808102 ) ) ( not ( = ?auto_808094 ?auto_808103 ) ) ( not ( = ?auto_808094 ?auto_808104 ) ) ( not ( = ?auto_808094 ?auto_808105 ) ) ( not ( = ?auto_808094 ?auto_808106 ) ) ( not ( = ?auto_808094 ?auto_808107 ) ) ( not ( = ?auto_808094 ?auto_808108 ) ) ( not ( = ?auto_808094 ?auto_808109 ) ) ( not ( = ?auto_808095 ?auto_808096 ) ) ( not ( = ?auto_808095 ?auto_808097 ) ) ( not ( = ?auto_808095 ?auto_808098 ) ) ( not ( = ?auto_808095 ?auto_808099 ) ) ( not ( = ?auto_808095 ?auto_808100 ) ) ( not ( = ?auto_808095 ?auto_808101 ) ) ( not ( = ?auto_808095 ?auto_808102 ) ) ( not ( = ?auto_808095 ?auto_808103 ) ) ( not ( = ?auto_808095 ?auto_808104 ) ) ( not ( = ?auto_808095 ?auto_808105 ) ) ( not ( = ?auto_808095 ?auto_808106 ) ) ( not ( = ?auto_808095 ?auto_808107 ) ) ( not ( = ?auto_808095 ?auto_808108 ) ) ( not ( = ?auto_808095 ?auto_808109 ) ) ( not ( = ?auto_808096 ?auto_808097 ) ) ( not ( = ?auto_808096 ?auto_808098 ) ) ( not ( = ?auto_808096 ?auto_808099 ) ) ( not ( = ?auto_808096 ?auto_808100 ) ) ( not ( = ?auto_808096 ?auto_808101 ) ) ( not ( = ?auto_808096 ?auto_808102 ) ) ( not ( = ?auto_808096 ?auto_808103 ) ) ( not ( = ?auto_808096 ?auto_808104 ) ) ( not ( = ?auto_808096 ?auto_808105 ) ) ( not ( = ?auto_808096 ?auto_808106 ) ) ( not ( = ?auto_808096 ?auto_808107 ) ) ( not ( = ?auto_808096 ?auto_808108 ) ) ( not ( = ?auto_808096 ?auto_808109 ) ) ( not ( = ?auto_808097 ?auto_808098 ) ) ( not ( = ?auto_808097 ?auto_808099 ) ) ( not ( = ?auto_808097 ?auto_808100 ) ) ( not ( = ?auto_808097 ?auto_808101 ) ) ( not ( = ?auto_808097 ?auto_808102 ) ) ( not ( = ?auto_808097 ?auto_808103 ) ) ( not ( = ?auto_808097 ?auto_808104 ) ) ( not ( = ?auto_808097 ?auto_808105 ) ) ( not ( = ?auto_808097 ?auto_808106 ) ) ( not ( = ?auto_808097 ?auto_808107 ) ) ( not ( = ?auto_808097 ?auto_808108 ) ) ( not ( = ?auto_808097 ?auto_808109 ) ) ( not ( = ?auto_808098 ?auto_808099 ) ) ( not ( = ?auto_808098 ?auto_808100 ) ) ( not ( = ?auto_808098 ?auto_808101 ) ) ( not ( = ?auto_808098 ?auto_808102 ) ) ( not ( = ?auto_808098 ?auto_808103 ) ) ( not ( = ?auto_808098 ?auto_808104 ) ) ( not ( = ?auto_808098 ?auto_808105 ) ) ( not ( = ?auto_808098 ?auto_808106 ) ) ( not ( = ?auto_808098 ?auto_808107 ) ) ( not ( = ?auto_808098 ?auto_808108 ) ) ( not ( = ?auto_808098 ?auto_808109 ) ) ( not ( = ?auto_808099 ?auto_808100 ) ) ( not ( = ?auto_808099 ?auto_808101 ) ) ( not ( = ?auto_808099 ?auto_808102 ) ) ( not ( = ?auto_808099 ?auto_808103 ) ) ( not ( = ?auto_808099 ?auto_808104 ) ) ( not ( = ?auto_808099 ?auto_808105 ) ) ( not ( = ?auto_808099 ?auto_808106 ) ) ( not ( = ?auto_808099 ?auto_808107 ) ) ( not ( = ?auto_808099 ?auto_808108 ) ) ( not ( = ?auto_808099 ?auto_808109 ) ) ( not ( = ?auto_808100 ?auto_808101 ) ) ( not ( = ?auto_808100 ?auto_808102 ) ) ( not ( = ?auto_808100 ?auto_808103 ) ) ( not ( = ?auto_808100 ?auto_808104 ) ) ( not ( = ?auto_808100 ?auto_808105 ) ) ( not ( = ?auto_808100 ?auto_808106 ) ) ( not ( = ?auto_808100 ?auto_808107 ) ) ( not ( = ?auto_808100 ?auto_808108 ) ) ( not ( = ?auto_808100 ?auto_808109 ) ) ( not ( = ?auto_808101 ?auto_808102 ) ) ( not ( = ?auto_808101 ?auto_808103 ) ) ( not ( = ?auto_808101 ?auto_808104 ) ) ( not ( = ?auto_808101 ?auto_808105 ) ) ( not ( = ?auto_808101 ?auto_808106 ) ) ( not ( = ?auto_808101 ?auto_808107 ) ) ( not ( = ?auto_808101 ?auto_808108 ) ) ( not ( = ?auto_808101 ?auto_808109 ) ) ( not ( = ?auto_808102 ?auto_808103 ) ) ( not ( = ?auto_808102 ?auto_808104 ) ) ( not ( = ?auto_808102 ?auto_808105 ) ) ( not ( = ?auto_808102 ?auto_808106 ) ) ( not ( = ?auto_808102 ?auto_808107 ) ) ( not ( = ?auto_808102 ?auto_808108 ) ) ( not ( = ?auto_808102 ?auto_808109 ) ) ( not ( = ?auto_808103 ?auto_808104 ) ) ( not ( = ?auto_808103 ?auto_808105 ) ) ( not ( = ?auto_808103 ?auto_808106 ) ) ( not ( = ?auto_808103 ?auto_808107 ) ) ( not ( = ?auto_808103 ?auto_808108 ) ) ( not ( = ?auto_808103 ?auto_808109 ) ) ( not ( = ?auto_808104 ?auto_808105 ) ) ( not ( = ?auto_808104 ?auto_808106 ) ) ( not ( = ?auto_808104 ?auto_808107 ) ) ( not ( = ?auto_808104 ?auto_808108 ) ) ( not ( = ?auto_808104 ?auto_808109 ) ) ( not ( = ?auto_808105 ?auto_808106 ) ) ( not ( = ?auto_808105 ?auto_808107 ) ) ( not ( = ?auto_808105 ?auto_808108 ) ) ( not ( = ?auto_808105 ?auto_808109 ) ) ( not ( = ?auto_808106 ?auto_808107 ) ) ( not ( = ?auto_808106 ?auto_808108 ) ) ( not ( = ?auto_808106 ?auto_808109 ) ) ( not ( = ?auto_808107 ?auto_808108 ) ) ( not ( = ?auto_808107 ?auto_808109 ) ) ( not ( = ?auto_808108 ?auto_808109 ) ) ( ON ?auto_808107 ?auto_808108 ) ( ON ?auto_808106 ?auto_808107 ) ( ON ?auto_808105 ?auto_808106 ) ( ON ?auto_808104 ?auto_808105 ) ( ON ?auto_808103 ?auto_808104 ) ( ON ?auto_808102 ?auto_808103 ) ( ON ?auto_808101 ?auto_808102 ) ( CLEAR ?auto_808099 ) ( ON ?auto_808100 ?auto_808101 ) ( CLEAR ?auto_808100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_808092 ?auto_808093 ?auto_808094 ?auto_808095 ?auto_808096 ?auto_808097 ?auto_808098 ?auto_808099 ?auto_808100 )
      ( MAKE-17PILE ?auto_808092 ?auto_808093 ?auto_808094 ?auto_808095 ?auto_808096 ?auto_808097 ?auto_808098 ?auto_808099 ?auto_808100 ?auto_808101 ?auto_808102 ?auto_808103 ?auto_808104 ?auto_808105 ?auto_808106 ?auto_808107 ?auto_808108 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808162 - BLOCK
      ?auto_808163 - BLOCK
      ?auto_808164 - BLOCK
      ?auto_808165 - BLOCK
      ?auto_808166 - BLOCK
      ?auto_808167 - BLOCK
      ?auto_808168 - BLOCK
      ?auto_808169 - BLOCK
      ?auto_808170 - BLOCK
      ?auto_808171 - BLOCK
      ?auto_808172 - BLOCK
      ?auto_808173 - BLOCK
      ?auto_808174 - BLOCK
      ?auto_808175 - BLOCK
      ?auto_808176 - BLOCK
      ?auto_808177 - BLOCK
      ?auto_808178 - BLOCK
    )
    :vars
    (
      ?auto_808179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808178 ?auto_808179 ) ( ON-TABLE ?auto_808162 ) ( ON ?auto_808163 ?auto_808162 ) ( ON ?auto_808164 ?auto_808163 ) ( ON ?auto_808165 ?auto_808164 ) ( ON ?auto_808166 ?auto_808165 ) ( ON ?auto_808167 ?auto_808166 ) ( ON ?auto_808168 ?auto_808167 ) ( not ( = ?auto_808162 ?auto_808163 ) ) ( not ( = ?auto_808162 ?auto_808164 ) ) ( not ( = ?auto_808162 ?auto_808165 ) ) ( not ( = ?auto_808162 ?auto_808166 ) ) ( not ( = ?auto_808162 ?auto_808167 ) ) ( not ( = ?auto_808162 ?auto_808168 ) ) ( not ( = ?auto_808162 ?auto_808169 ) ) ( not ( = ?auto_808162 ?auto_808170 ) ) ( not ( = ?auto_808162 ?auto_808171 ) ) ( not ( = ?auto_808162 ?auto_808172 ) ) ( not ( = ?auto_808162 ?auto_808173 ) ) ( not ( = ?auto_808162 ?auto_808174 ) ) ( not ( = ?auto_808162 ?auto_808175 ) ) ( not ( = ?auto_808162 ?auto_808176 ) ) ( not ( = ?auto_808162 ?auto_808177 ) ) ( not ( = ?auto_808162 ?auto_808178 ) ) ( not ( = ?auto_808162 ?auto_808179 ) ) ( not ( = ?auto_808163 ?auto_808164 ) ) ( not ( = ?auto_808163 ?auto_808165 ) ) ( not ( = ?auto_808163 ?auto_808166 ) ) ( not ( = ?auto_808163 ?auto_808167 ) ) ( not ( = ?auto_808163 ?auto_808168 ) ) ( not ( = ?auto_808163 ?auto_808169 ) ) ( not ( = ?auto_808163 ?auto_808170 ) ) ( not ( = ?auto_808163 ?auto_808171 ) ) ( not ( = ?auto_808163 ?auto_808172 ) ) ( not ( = ?auto_808163 ?auto_808173 ) ) ( not ( = ?auto_808163 ?auto_808174 ) ) ( not ( = ?auto_808163 ?auto_808175 ) ) ( not ( = ?auto_808163 ?auto_808176 ) ) ( not ( = ?auto_808163 ?auto_808177 ) ) ( not ( = ?auto_808163 ?auto_808178 ) ) ( not ( = ?auto_808163 ?auto_808179 ) ) ( not ( = ?auto_808164 ?auto_808165 ) ) ( not ( = ?auto_808164 ?auto_808166 ) ) ( not ( = ?auto_808164 ?auto_808167 ) ) ( not ( = ?auto_808164 ?auto_808168 ) ) ( not ( = ?auto_808164 ?auto_808169 ) ) ( not ( = ?auto_808164 ?auto_808170 ) ) ( not ( = ?auto_808164 ?auto_808171 ) ) ( not ( = ?auto_808164 ?auto_808172 ) ) ( not ( = ?auto_808164 ?auto_808173 ) ) ( not ( = ?auto_808164 ?auto_808174 ) ) ( not ( = ?auto_808164 ?auto_808175 ) ) ( not ( = ?auto_808164 ?auto_808176 ) ) ( not ( = ?auto_808164 ?auto_808177 ) ) ( not ( = ?auto_808164 ?auto_808178 ) ) ( not ( = ?auto_808164 ?auto_808179 ) ) ( not ( = ?auto_808165 ?auto_808166 ) ) ( not ( = ?auto_808165 ?auto_808167 ) ) ( not ( = ?auto_808165 ?auto_808168 ) ) ( not ( = ?auto_808165 ?auto_808169 ) ) ( not ( = ?auto_808165 ?auto_808170 ) ) ( not ( = ?auto_808165 ?auto_808171 ) ) ( not ( = ?auto_808165 ?auto_808172 ) ) ( not ( = ?auto_808165 ?auto_808173 ) ) ( not ( = ?auto_808165 ?auto_808174 ) ) ( not ( = ?auto_808165 ?auto_808175 ) ) ( not ( = ?auto_808165 ?auto_808176 ) ) ( not ( = ?auto_808165 ?auto_808177 ) ) ( not ( = ?auto_808165 ?auto_808178 ) ) ( not ( = ?auto_808165 ?auto_808179 ) ) ( not ( = ?auto_808166 ?auto_808167 ) ) ( not ( = ?auto_808166 ?auto_808168 ) ) ( not ( = ?auto_808166 ?auto_808169 ) ) ( not ( = ?auto_808166 ?auto_808170 ) ) ( not ( = ?auto_808166 ?auto_808171 ) ) ( not ( = ?auto_808166 ?auto_808172 ) ) ( not ( = ?auto_808166 ?auto_808173 ) ) ( not ( = ?auto_808166 ?auto_808174 ) ) ( not ( = ?auto_808166 ?auto_808175 ) ) ( not ( = ?auto_808166 ?auto_808176 ) ) ( not ( = ?auto_808166 ?auto_808177 ) ) ( not ( = ?auto_808166 ?auto_808178 ) ) ( not ( = ?auto_808166 ?auto_808179 ) ) ( not ( = ?auto_808167 ?auto_808168 ) ) ( not ( = ?auto_808167 ?auto_808169 ) ) ( not ( = ?auto_808167 ?auto_808170 ) ) ( not ( = ?auto_808167 ?auto_808171 ) ) ( not ( = ?auto_808167 ?auto_808172 ) ) ( not ( = ?auto_808167 ?auto_808173 ) ) ( not ( = ?auto_808167 ?auto_808174 ) ) ( not ( = ?auto_808167 ?auto_808175 ) ) ( not ( = ?auto_808167 ?auto_808176 ) ) ( not ( = ?auto_808167 ?auto_808177 ) ) ( not ( = ?auto_808167 ?auto_808178 ) ) ( not ( = ?auto_808167 ?auto_808179 ) ) ( not ( = ?auto_808168 ?auto_808169 ) ) ( not ( = ?auto_808168 ?auto_808170 ) ) ( not ( = ?auto_808168 ?auto_808171 ) ) ( not ( = ?auto_808168 ?auto_808172 ) ) ( not ( = ?auto_808168 ?auto_808173 ) ) ( not ( = ?auto_808168 ?auto_808174 ) ) ( not ( = ?auto_808168 ?auto_808175 ) ) ( not ( = ?auto_808168 ?auto_808176 ) ) ( not ( = ?auto_808168 ?auto_808177 ) ) ( not ( = ?auto_808168 ?auto_808178 ) ) ( not ( = ?auto_808168 ?auto_808179 ) ) ( not ( = ?auto_808169 ?auto_808170 ) ) ( not ( = ?auto_808169 ?auto_808171 ) ) ( not ( = ?auto_808169 ?auto_808172 ) ) ( not ( = ?auto_808169 ?auto_808173 ) ) ( not ( = ?auto_808169 ?auto_808174 ) ) ( not ( = ?auto_808169 ?auto_808175 ) ) ( not ( = ?auto_808169 ?auto_808176 ) ) ( not ( = ?auto_808169 ?auto_808177 ) ) ( not ( = ?auto_808169 ?auto_808178 ) ) ( not ( = ?auto_808169 ?auto_808179 ) ) ( not ( = ?auto_808170 ?auto_808171 ) ) ( not ( = ?auto_808170 ?auto_808172 ) ) ( not ( = ?auto_808170 ?auto_808173 ) ) ( not ( = ?auto_808170 ?auto_808174 ) ) ( not ( = ?auto_808170 ?auto_808175 ) ) ( not ( = ?auto_808170 ?auto_808176 ) ) ( not ( = ?auto_808170 ?auto_808177 ) ) ( not ( = ?auto_808170 ?auto_808178 ) ) ( not ( = ?auto_808170 ?auto_808179 ) ) ( not ( = ?auto_808171 ?auto_808172 ) ) ( not ( = ?auto_808171 ?auto_808173 ) ) ( not ( = ?auto_808171 ?auto_808174 ) ) ( not ( = ?auto_808171 ?auto_808175 ) ) ( not ( = ?auto_808171 ?auto_808176 ) ) ( not ( = ?auto_808171 ?auto_808177 ) ) ( not ( = ?auto_808171 ?auto_808178 ) ) ( not ( = ?auto_808171 ?auto_808179 ) ) ( not ( = ?auto_808172 ?auto_808173 ) ) ( not ( = ?auto_808172 ?auto_808174 ) ) ( not ( = ?auto_808172 ?auto_808175 ) ) ( not ( = ?auto_808172 ?auto_808176 ) ) ( not ( = ?auto_808172 ?auto_808177 ) ) ( not ( = ?auto_808172 ?auto_808178 ) ) ( not ( = ?auto_808172 ?auto_808179 ) ) ( not ( = ?auto_808173 ?auto_808174 ) ) ( not ( = ?auto_808173 ?auto_808175 ) ) ( not ( = ?auto_808173 ?auto_808176 ) ) ( not ( = ?auto_808173 ?auto_808177 ) ) ( not ( = ?auto_808173 ?auto_808178 ) ) ( not ( = ?auto_808173 ?auto_808179 ) ) ( not ( = ?auto_808174 ?auto_808175 ) ) ( not ( = ?auto_808174 ?auto_808176 ) ) ( not ( = ?auto_808174 ?auto_808177 ) ) ( not ( = ?auto_808174 ?auto_808178 ) ) ( not ( = ?auto_808174 ?auto_808179 ) ) ( not ( = ?auto_808175 ?auto_808176 ) ) ( not ( = ?auto_808175 ?auto_808177 ) ) ( not ( = ?auto_808175 ?auto_808178 ) ) ( not ( = ?auto_808175 ?auto_808179 ) ) ( not ( = ?auto_808176 ?auto_808177 ) ) ( not ( = ?auto_808176 ?auto_808178 ) ) ( not ( = ?auto_808176 ?auto_808179 ) ) ( not ( = ?auto_808177 ?auto_808178 ) ) ( not ( = ?auto_808177 ?auto_808179 ) ) ( not ( = ?auto_808178 ?auto_808179 ) ) ( ON ?auto_808177 ?auto_808178 ) ( ON ?auto_808176 ?auto_808177 ) ( ON ?auto_808175 ?auto_808176 ) ( ON ?auto_808174 ?auto_808175 ) ( ON ?auto_808173 ?auto_808174 ) ( ON ?auto_808172 ?auto_808173 ) ( ON ?auto_808171 ?auto_808172 ) ( ON ?auto_808170 ?auto_808171 ) ( CLEAR ?auto_808168 ) ( ON ?auto_808169 ?auto_808170 ) ( CLEAR ?auto_808169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_808162 ?auto_808163 ?auto_808164 ?auto_808165 ?auto_808166 ?auto_808167 ?auto_808168 ?auto_808169 )
      ( MAKE-17PILE ?auto_808162 ?auto_808163 ?auto_808164 ?auto_808165 ?auto_808166 ?auto_808167 ?auto_808168 ?auto_808169 ?auto_808170 ?auto_808171 ?auto_808172 ?auto_808173 ?auto_808174 ?auto_808175 ?auto_808176 ?auto_808177 ?auto_808178 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808232 - BLOCK
      ?auto_808233 - BLOCK
      ?auto_808234 - BLOCK
      ?auto_808235 - BLOCK
      ?auto_808236 - BLOCK
      ?auto_808237 - BLOCK
      ?auto_808238 - BLOCK
      ?auto_808239 - BLOCK
      ?auto_808240 - BLOCK
      ?auto_808241 - BLOCK
      ?auto_808242 - BLOCK
      ?auto_808243 - BLOCK
      ?auto_808244 - BLOCK
      ?auto_808245 - BLOCK
      ?auto_808246 - BLOCK
      ?auto_808247 - BLOCK
      ?auto_808248 - BLOCK
    )
    :vars
    (
      ?auto_808249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808248 ?auto_808249 ) ( ON-TABLE ?auto_808232 ) ( ON ?auto_808233 ?auto_808232 ) ( ON ?auto_808234 ?auto_808233 ) ( ON ?auto_808235 ?auto_808234 ) ( ON ?auto_808236 ?auto_808235 ) ( ON ?auto_808237 ?auto_808236 ) ( not ( = ?auto_808232 ?auto_808233 ) ) ( not ( = ?auto_808232 ?auto_808234 ) ) ( not ( = ?auto_808232 ?auto_808235 ) ) ( not ( = ?auto_808232 ?auto_808236 ) ) ( not ( = ?auto_808232 ?auto_808237 ) ) ( not ( = ?auto_808232 ?auto_808238 ) ) ( not ( = ?auto_808232 ?auto_808239 ) ) ( not ( = ?auto_808232 ?auto_808240 ) ) ( not ( = ?auto_808232 ?auto_808241 ) ) ( not ( = ?auto_808232 ?auto_808242 ) ) ( not ( = ?auto_808232 ?auto_808243 ) ) ( not ( = ?auto_808232 ?auto_808244 ) ) ( not ( = ?auto_808232 ?auto_808245 ) ) ( not ( = ?auto_808232 ?auto_808246 ) ) ( not ( = ?auto_808232 ?auto_808247 ) ) ( not ( = ?auto_808232 ?auto_808248 ) ) ( not ( = ?auto_808232 ?auto_808249 ) ) ( not ( = ?auto_808233 ?auto_808234 ) ) ( not ( = ?auto_808233 ?auto_808235 ) ) ( not ( = ?auto_808233 ?auto_808236 ) ) ( not ( = ?auto_808233 ?auto_808237 ) ) ( not ( = ?auto_808233 ?auto_808238 ) ) ( not ( = ?auto_808233 ?auto_808239 ) ) ( not ( = ?auto_808233 ?auto_808240 ) ) ( not ( = ?auto_808233 ?auto_808241 ) ) ( not ( = ?auto_808233 ?auto_808242 ) ) ( not ( = ?auto_808233 ?auto_808243 ) ) ( not ( = ?auto_808233 ?auto_808244 ) ) ( not ( = ?auto_808233 ?auto_808245 ) ) ( not ( = ?auto_808233 ?auto_808246 ) ) ( not ( = ?auto_808233 ?auto_808247 ) ) ( not ( = ?auto_808233 ?auto_808248 ) ) ( not ( = ?auto_808233 ?auto_808249 ) ) ( not ( = ?auto_808234 ?auto_808235 ) ) ( not ( = ?auto_808234 ?auto_808236 ) ) ( not ( = ?auto_808234 ?auto_808237 ) ) ( not ( = ?auto_808234 ?auto_808238 ) ) ( not ( = ?auto_808234 ?auto_808239 ) ) ( not ( = ?auto_808234 ?auto_808240 ) ) ( not ( = ?auto_808234 ?auto_808241 ) ) ( not ( = ?auto_808234 ?auto_808242 ) ) ( not ( = ?auto_808234 ?auto_808243 ) ) ( not ( = ?auto_808234 ?auto_808244 ) ) ( not ( = ?auto_808234 ?auto_808245 ) ) ( not ( = ?auto_808234 ?auto_808246 ) ) ( not ( = ?auto_808234 ?auto_808247 ) ) ( not ( = ?auto_808234 ?auto_808248 ) ) ( not ( = ?auto_808234 ?auto_808249 ) ) ( not ( = ?auto_808235 ?auto_808236 ) ) ( not ( = ?auto_808235 ?auto_808237 ) ) ( not ( = ?auto_808235 ?auto_808238 ) ) ( not ( = ?auto_808235 ?auto_808239 ) ) ( not ( = ?auto_808235 ?auto_808240 ) ) ( not ( = ?auto_808235 ?auto_808241 ) ) ( not ( = ?auto_808235 ?auto_808242 ) ) ( not ( = ?auto_808235 ?auto_808243 ) ) ( not ( = ?auto_808235 ?auto_808244 ) ) ( not ( = ?auto_808235 ?auto_808245 ) ) ( not ( = ?auto_808235 ?auto_808246 ) ) ( not ( = ?auto_808235 ?auto_808247 ) ) ( not ( = ?auto_808235 ?auto_808248 ) ) ( not ( = ?auto_808235 ?auto_808249 ) ) ( not ( = ?auto_808236 ?auto_808237 ) ) ( not ( = ?auto_808236 ?auto_808238 ) ) ( not ( = ?auto_808236 ?auto_808239 ) ) ( not ( = ?auto_808236 ?auto_808240 ) ) ( not ( = ?auto_808236 ?auto_808241 ) ) ( not ( = ?auto_808236 ?auto_808242 ) ) ( not ( = ?auto_808236 ?auto_808243 ) ) ( not ( = ?auto_808236 ?auto_808244 ) ) ( not ( = ?auto_808236 ?auto_808245 ) ) ( not ( = ?auto_808236 ?auto_808246 ) ) ( not ( = ?auto_808236 ?auto_808247 ) ) ( not ( = ?auto_808236 ?auto_808248 ) ) ( not ( = ?auto_808236 ?auto_808249 ) ) ( not ( = ?auto_808237 ?auto_808238 ) ) ( not ( = ?auto_808237 ?auto_808239 ) ) ( not ( = ?auto_808237 ?auto_808240 ) ) ( not ( = ?auto_808237 ?auto_808241 ) ) ( not ( = ?auto_808237 ?auto_808242 ) ) ( not ( = ?auto_808237 ?auto_808243 ) ) ( not ( = ?auto_808237 ?auto_808244 ) ) ( not ( = ?auto_808237 ?auto_808245 ) ) ( not ( = ?auto_808237 ?auto_808246 ) ) ( not ( = ?auto_808237 ?auto_808247 ) ) ( not ( = ?auto_808237 ?auto_808248 ) ) ( not ( = ?auto_808237 ?auto_808249 ) ) ( not ( = ?auto_808238 ?auto_808239 ) ) ( not ( = ?auto_808238 ?auto_808240 ) ) ( not ( = ?auto_808238 ?auto_808241 ) ) ( not ( = ?auto_808238 ?auto_808242 ) ) ( not ( = ?auto_808238 ?auto_808243 ) ) ( not ( = ?auto_808238 ?auto_808244 ) ) ( not ( = ?auto_808238 ?auto_808245 ) ) ( not ( = ?auto_808238 ?auto_808246 ) ) ( not ( = ?auto_808238 ?auto_808247 ) ) ( not ( = ?auto_808238 ?auto_808248 ) ) ( not ( = ?auto_808238 ?auto_808249 ) ) ( not ( = ?auto_808239 ?auto_808240 ) ) ( not ( = ?auto_808239 ?auto_808241 ) ) ( not ( = ?auto_808239 ?auto_808242 ) ) ( not ( = ?auto_808239 ?auto_808243 ) ) ( not ( = ?auto_808239 ?auto_808244 ) ) ( not ( = ?auto_808239 ?auto_808245 ) ) ( not ( = ?auto_808239 ?auto_808246 ) ) ( not ( = ?auto_808239 ?auto_808247 ) ) ( not ( = ?auto_808239 ?auto_808248 ) ) ( not ( = ?auto_808239 ?auto_808249 ) ) ( not ( = ?auto_808240 ?auto_808241 ) ) ( not ( = ?auto_808240 ?auto_808242 ) ) ( not ( = ?auto_808240 ?auto_808243 ) ) ( not ( = ?auto_808240 ?auto_808244 ) ) ( not ( = ?auto_808240 ?auto_808245 ) ) ( not ( = ?auto_808240 ?auto_808246 ) ) ( not ( = ?auto_808240 ?auto_808247 ) ) ( not ( = ?auto_808240 ?auto_808248 ) ) ( not ( = ?auto_808240 ?auto_808249 ) ) ( not ( = ?auto_808241 ?auto_808242 ) ) ( not ( = ?auto_808241 ?auto_808243 ) ) ( not ( = ?auto_808241 ?auto_808244 ) ) ( not ( = ?auto_808241 ?auto_808245 ) ) ( not ( = ?auto_808241 ?auto_808246 ) ) ( not ( = ?auto_808241 ?auto_808247 ) ) ( not ( = ?auto_808241 ?auto_808248 ) ) ( not ( = ?auto_808241 ?auto_808249 ) ) ( not ( = ?auto_808242 ?auto_808243 ) ) ( not ( = ?auto_808242 ?auto_808244 ) ) ( not ( = ?auto_808242 ?auto_808245 ) ) ( not ( = ?auto_808242 ?auto_808246 ) ) ( not ( = ?auto_808242 ?auto_808247 ) ) ( not ( = ?auto_808242 ?auto_808248 ) ) ( not ( = ?auto_808242 ?auto_808249 ) ) ( not ( = ?auto_808243 ?auto_808244 ) ) ( not ( = ?auto_808243 ?auto_808245 ) ) ( not ( = ?auto_808243 ?auto_808246 ) ) ( not ( = ?auto_808243 ?auto_808247 ) ) ( not ( = ?auto_808243 ?auto_808248 ) ) ( not ( = ?auto_808243 ?auto_808249 ) ) ( not ( = ?auto_808244 ?auto_808245 ) ) ( not ( = ?auto_808244 ?auto_808246 ) ) ( not ( = ?auto_808244 ?auto_808247 ) ) ( not ( = ?auto_808244 ?auto_808248 ) ) ( not ( = ?auto_808244 ?auto_808249 ) ) ( not ( = ?auto_808245 ?auto_808246 ) ) ( not ( = ?auto_808245 ?auto_808247 ) ) ( not ( = ?auto_808245 ?auto_808248 ) ) ( not ( = ?auto_808245 ?auto_808249 ) ) ( not ( = ?auto_808246 ?auto_808247 ) ) ( not ( = ?auto_808246 ?auto_808248 ) ) ( not ( = ?auto_808246 ?auto_808249 ) ) ( not ( = ?auto_808247 ?auto_808248 ) ) ( not ( = ?auto_808247 ?auto_808249 ) ) ( not ( = ?auto_808248 ?auto_808249 ) ) ( ON ?auto_808247 ?auto_808248 ) ( ON ?auto_808246 ?auto_808247 ) ( ON ?auto_808245 ?auto_808246 ) ( ON ?auto_808244 ?auto_808245 ) ( ON ?auto_808243 ?auto_808244 ) ( ON ?auto_808242 ?auto_808243 ) ( ON ?auto_808241 ?auto_808242 ) ( ON ?auto_808240 ?auto_808241 ) ( ON ?auto_808239 ?auto_808240 ) ( CLEAR ?auto_808237 ) ( ON ?auto_808238 ?auto_808239 ) ( CLEAR ?auto_808238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_808232 ?auto_808233 ?auto_808234 ?auto_808235 ?auto_808236 ?auto_808237 ?auto_808238 )
      ( MAKE-17PILE ?auto_808232 ?auto_808233 ?auto_808234 ?auto_808235 ?auto_808236 ?auto_808237 ?auto_808238 ?auto_808239 ?auto_808240 ?auto_808241 ?auto_808242 ?auto_808243 ?auto_808244 ?auto_808245 ?auto_808246 ?auto_808247 ?auto_808248 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808302 - BLOCK
      ?auto_808303 - BLOCK
      ?auto_808304 - BLOCK
      ?auto_808305 - BLOCK
      ?auto_808306 - BLOCK
      ?auto_808307 - BLOCK
      ?auto_808308 - BLOCK
      ?auto_808309 - BLOCK
      ?auto_808310 - BLOCK
      ?auto_808311 - BLOCK
      ?auto_808312 - BLOCK
      ?auto_808313 - BLOCK
      ?auto_808314 - BLOCK
      ?auto_808315 - BLOCK
      ?auto_808316 - BLOCK
      ?auto_808317 - BLOCK
      ?auto_808318 - BLOCK
    )
    :vars
    (
      ?auto_808319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808318 ?auto_808319 ) ( ON-TABLE ?auto_808302 ) ( ON ?auto_808303 ?auto_808302 ) ( ON ?auto_808304 ?auto_808303 ) ( ON ?auto_808305 ?auto_808304 ) ( ON ?auto_808306 ?auto_808305 ) ( not ( = ?auto_808302 ?auto_808303 ) ) ( not ( = ?auto_808302 ?auto_808304 ) ) ( not ( = ?auto_808302 ?auto_808305 ) ) ( not ( = ?auto_808302 ?auto_808306 ) ) ( not ( = ?auto_808302 ?auto_808307 ) ) ( not ( = ?auto_808302 ?auto_808308 ) ) ( not ( = ?auto_808302 ?auto_808309 ) ) ( not ( = ?auto_808302 ?auto_808310 ) ) ( not ( = ?auto_808302 ?auto_808311 ) ) ( not ( = ?auto_808302 ?auto_808312 ) ) ( not ( = ?auto_808302 ?auto_808313 ) ) ( not ( = ?auto_808302 ?auto_808314 ) ) ( not ( = ?auto_808302 ?auto_808315 ) ) ( not ( = ?auto_808302 ?auto_808316 ) ) ( not ( = ?auto_808302 ?auto_808317 ) ) ( not ( = ?auto_808302 ?auto_808318 ) ) ( not ( = ?auto_808302 ?auto_808319 ) ) ( not ( = ?auto_808303 ?auto_808304 ) ) ( not ( = ?auto_808303 ?auto_808305 ) ) ( not ( = ?auto_808303 ?auto_808306 ) ) ( not ( = ?auto_808303 ?auto_808307 ) ) ( not ( = ?auto_808303 ?auto_808308 ) ) ( not ( = ?auto_808303 ?auto_808309 ) ) ( not ( = ?auto_808303 ?auto_808310 ) ) ( not ( = ?auto_808303 ?auto_808311 ) ) ( not ( = ?auto_808303 ?auto_808312 ) ) ( not ( = ?auto_808303 ?auto_808313 ) ) ( not ( = ?auto_808303 ?auto_808314 ) ) ( not ( = ?auto_808303 ?auto_808315 ) ) ( not ( = ?auto_808303 ?auto_808316 ) ) ( not ( = ?auto_808303 ?auto_808317 ) ) ( not ( = ?auto_808303 ?auto_808318 ) ) ( not ( = ?auto_808303 ?auto_808319 ) ) ( not ( = ?auto_808304 ?auto_808305 ) ) ( not ( = ?auto_808304 ?auto_808306 ) ) ( not ( = ?auto_808304 ?auto_808307 ) ) ( not ( = ?auto_808304 ?auto_808308 ) ) ( not ( = ?auto_808304 ?auto_808309 ) ) ( not ( = ?auto_808304 ?auto_808310 ) ) ( not ( = ?auto_808304 ?auto_808311 ) ) ( not ( = ?auto_808304 ?auto_808312 ) ) ( not ( = ?auto_808304 ?auto_808313 ) ) ( not ( = ?auto_808304 ?auto_808314 ) ) ( not ( = ?auto_808304 ?auto_808315 ) ) ( not ( = ?auto_808304 ?auto_808316 ) ) ( not ( = ?auto_808304 ?auto_808317 ) ) ( not ( = ?auto_808304 ?auto_808318 ) ) ( not ( = ?auto_808304 ?auto_808319 ) ) ( not ( = ?auto_808305 ?auto_808306 ) ) ( not ( = ?auto_808305 ?auto_808307 ) ) ( not ( = ?auto_808305 ?auto_808308 ) ) ( not ( = ?auto_808305 ?auto_808309 ) ) ( not ( = ?auto_808305 ?auto_808310 ) ) ( not ( = ?auto_808305 ?auto_808311 ) ) ( not ( = ?auto_808305 ?auto_808312 ) ) ( not ( = ?auto_808305 ?auto_808313 ) ) ( not ( = ?auto_808305 ?auto_808314 ) ) ( not ( = ?auto_808305 ?auto_808315 ) ) ( not ( = ?auto_808305 ?auto_808316 ) ) ( not ( = ?auto_808305 ?auto_808317 ) ) ( not ( = ?auto_808305 ?auto_808318 ) ) ( not ( = ?auto_808305 ?auto_808319 ) ) ( not ( = ?auto_808306 ?auto_808307 ) ) ( not ( = ?auto_808306 ?auto_808308 ) ) ( not ( = ?auto_808306 ?auto_808309 ) ) ( not ( = ?auto_808306 ?auto_808310 ) ) ( not ( = ?auto_808306 ?auto_808311 ) ) ( not ( = ?auto_808306 ?auto_808312 ) ) ( not ( = ?auto_808306 ?auto_808313 ) ) ( not ( = ?auto_808306 ?auto_808314 ) ) ( not ( = ?auto_808306 ?auto_808315 ) ) ( not ( = ?auto_808306 ?auto_808316 ) ) ( not ( = ?auto_808306 ?auto_808317 ) ) ( not ( = ?auto_808306 ?auto_808318 ) ) ( not ( = ?auto_808306 ?auto_808319 ) ) ( not ( = ?auto_808307 ?auto_808308 ) ) ( not ( = ?auto_808307 ?auto_808309 ) ) ( not ( = ?auto_808307 ?auto_808310 ) ) ( not ( = ?auto_808307 ?auto_808311 ) ) ( not ( = ?auto_808307 ?auto_808312 ) ) ( not ( = ?auto_808307 ?auto_808313 ) ) ( not ( = ?auto_808307 ?auto_808314 ) ) ( not ( = ?auto_808307 ?auto_808315 ) ) ( not ( = ?auto_808307 ?auto_808316 ) ) ( not ( = ?auto_808307 ?auto_808317 ) ) ( not ( = ?auto_808307 ?auto_808318 ) ) ( not ( = ?auto_808307 ?auto_808319 ) ) ( not ( = ?auto_808308 ?auto_808309 ) ) ( not ( = ?auto_808308 ?auto_808310 ) ) ( not ( = ?auto_808308 ?auto_808311 ) ) ( not ( = ?auto_808308 ?auto_808312 ) ) ( not ( = ?auto_808308 ?auto_808313 ) ) ( not ( = ?auto_808308 ?auto_808314 ) ) ( not ( = ?auto_808308 ?auto_808315 ) ) ( not ( = ?auto_808308 ?auto_808316 ) ) ( not ( = ?auto_808308 ?auto_808317 ) ) ( not ( = ?auto_808308 ?auto_808318 ) ) ( not ( = ?auto_808308 ?auto_808319 ) ) ( not ( = ?auto_808309 ?auto_808310 ) ) ( not ( = ?auto_808309 ?auto_808311 ) ) ( not ( = ?auto_808309 ?auto_808312 ) ) ( not ( = ?auto_808309 ?auto_808313 ) ) ( not ( = ?auto_808309 ?auto_808314 ) ) ( not ( = ?auto_808309 ?auto_808315 ) ) ( not ( = ?auto_808309 ?auto_808316 ) ) ( not ( = ?auto_808309 ?auto_808317 ) ) ( not ( = ?auto_808309 ?auto_808318 ) ) ( not ( = ?auto_808309 ?auto_808319 ) ) ( not ( = ?auto_808310 ?auto_808311 ) ) ( not ( = ?auto_808310 ?auto_808312 ) ) ( not ( = ?auto_808310 ?auto_808313 ) ) ( not ( = ?auto_808310 ?auto_808314 ) ) ( not ( = ?auto_808310 ?auto_808315 ) ) ( not ( = ?auto_808310 ?auto_808316 ) ) ( not ( = ?auto_808310 ?auto_808317 ) ) ( not ( = ?auto_808310 ?auto_808318 ) ) ( not ( = ?auto_808310 ?auto_808319 ) ) ( not ( = ?auto_808311 ?auto_808312 ) ) ( not ( = ?auto_808311 ?auto_808313 ) ) ( not ( = ?auto_808311 ?auto_808314 ) ) ( not ( = ?auto_808311 ?auto_808315 ) ) ( not ( = ?auto_808311 ?auto_808316 ) ) ( not ( = ?auto_808311 ?auto_808317 ) ) ( not ( = ?auto_808311 ?auto_808318 ) ) ( not ( = ?auto_808311 ?auto_808319 ) ) ( not ( = ?auto_808312 ?auto_808313 ) ) ( not ( = ?auto_808312 ?auto_808314 ) ) ( not ( = ?auto_808312 ?auto_808315 ) ) ( not ( = ?auto_808312 ?auto_808316 ) ) ( not ( = ?auto_808312 ?auto_808317 ) ) ( not ( = ?auto_808312 ?auto_808318 ) ) ( not ( = ?auto_808312 ?auto_808319 ) ) ( not ( = ?auto_808313 ?auto_808314 ) ) ( not ( = ?auto_808313 ?auto_808315 ) ) ( not ( = ?auto_808313 ?auto_808316 ) ) ( not ( = ?auto_808313 ?auto_808317 ) ) ( not ( = ?auto_808313 ?auto_808318 ) ) ( not ( = ?auto_808313 ?auto_808319 ) ) ( not ( = ?auto_808314 ?auto_808315 ) ) ( not ( = ?auto_808314 ?auto_808316 ) ) ( not ( = ?auto_808314 ?auto_808317 ) ) ( not ( = ?auto_808314 ?auto_808318 ) ) ( not ( = ?auto_808314 ?auto_808319 ) ) ( not ( = ?auto_808315 ?auto_808316 ) ) ( not ( = ?auto_808315 ?auto_808317 ) ) ( not ( = ?auto_808315 ?auto_808318 ) ) ( not ( = ?auto_808315 ?auto_808319 ) ) ( not ( = ?auto_808316 ?auto_808317 ) ) ( not ( = ?auto_808316 ?auto_808318 ) ) ( not ( = ?auto_808316 ?auto_808319 ) ) ( not ( = ?auto_808317 ?auto_808318 ) ) ( not ( = ?auto_808317 ?auto_808319 ) ) ( not ( = ?auto_808318 ?auto_808319 ) ) ( ON ?auto_808317 ?auto_808318 ) ( ON ?auto_808316 ?auto_808317 ) ( ON ?auto_808315 ?auto_808316 ) ( ON ?auto_808314 ?auto_808315 ) ( ON ?auto_808313 ?auto_808314 ) ( ON ?auto_808312 ?auto_808313 ) ( ON ?auto_808311 ?auto_808312 ) ( ON ?auto_808310 ?auto_808311 ) ( ON ?auto_808309 ?auto_808310 ) ( ON ?auto_808308 ?auto_808309 ) ( CLEAR ?auto_808306 ) ( ON ?auto_808307 ?auto_808308 ) ( CLEAR ?auto_808307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_808302 ?auto_808303 ?auto_808304 ?auto_808305 ?auto_808306 ?auto_808307 )
      ( MAKE-17PILE ?auto_808302 ?auto_808303 ?auto_808304 ?auto_808305 ?auto_808306 ?auto_808307 ?auto_808308 ?auto_808309 ?auto_808310 ?auto_808311 ?auto_808312 ?auto_808313 ?auto_808314 ?auto_808315 ?auto_808316 ?auto_808317 ?auto_808318 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808372 - BLOCK
      ?auto_808373 - BLOCK
      ?auto_808374 - BLOCK
      ?auto_808375 - BLOCK
      ?auto_808376 - BLOCK
      ?auto_808377 - BLOCK
      ?auto_808378 - BLOCK
      ?auto_808379 - BLOCK
      ?auto_808380 - BLOCK
      ?auto_808381 - BLOCK
      ?auto_808382 - BLOCK
      ?auto_808383 - BLOCK
      ?auto_808384 - BLOCK
      ?auto_808385 - BLOCK
      ?auto_808386 - BLOCK
      ?auto_808387 - BLOCK
      ?auto_808388 - BLOCK
    )
    :vars
    (
      ?auto_808389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808388 ?auto_808389 ) ( ON-TABLE ?auto_808372 ) ( ON ?auto_808373 ?auto_808372 ) ( ON ?auto_808374 ?auto_808373 ) ( ON ?auto_808375 ?auto_808374 ) ( not ( = ?auto_808372 ?auto_808373 ) ) ( not ( = ?auto_808372 ?auto_808374 ) ) ( not ( = ?auto_808372 ?auto_808375 ) ) ( not ( = ?auto_808372 ?auto_808376 ) ) ( not ( = ?auto_808372 ?auto_808377 ) ) ( not ( = ?auto_808372 ?auto_808378 ) ) ( not ( = ?auto_808372 ?auto_808379 ) ) ( not ( = ?auto_808372 ?auto_808380 ) ) ( not ( = ?auto_808372 ?auto_808381 ) ) ( not ( = ?auto_808372 ?auto_808382 ) ) ( not ( = ?auto_808372 ?auto_808383 ) ) ( not ( = ?auto_808372 ?auto_808384 ) ) ( not ( = ?auto_808372 ?auto_808385 ) ) ( not ( = ?auto_808372 ?auto_808386 ) ) ( not ( = ?auto_808372 ?auto_808387 ) ) ( not ( = ?auto_808372 ?auto_808388 ) ) ( not ( = ?auto_808372 ?auto_808389 ) ) ( not ( = ?auto_808373 ?auto_808374 ) ) ( not ( = ?auto_808373 ?auto_808375 ) ) ( not ( = ?auto_808373 ?auto_808376 ) ) ( not ( = ?auto_808373 ?auto_808377 ) ) ( not ( = ?auto_808373 ?auto_808378 ) ) ( not ( = ?auto_808373 ?auto_808379 ) ) ( not ( = ?auto_808373 ?auto_808380 ) ) ( not ( = ?auto_808373 ?auto_808381 ) ) ( not ( = ?auto_808373 ?auto_808382 ) ) ( not ( = ?auto_808373 ?auto_808383 ) ) ( not ( = ?auto_808373 ?auto_808384 ) ) ( not ( = ?auto_808373 ?auto_808385 ) ) ( not ( = ?auto_808373 ?auto_808386 ) ) ( not ( = ?auto_808373 ?auto_808387 ) ) ( not ( = ?auto_808373 ?auto_808388 ) ) ( not ( = ?auto_808373 ?auto_808389 ) ) ( not ( = ?auto_808374 ?auto_808375 ) ) ( not ( = ?auto_808374 ?auto_808376 ) ) ( not ( = ?auto_808374 ?auto_808377 ) ) ( not ( = ?auto_808374 ?auto_808378 ) ) ( not ( = ?auto_808374 ?auto_808379 ) ) ( not ( = ?auto_808374 ?auto_808380 ) ) ( not ( = ?auto_808374 ?auto_808381 ) ) ( not ( = ?auto_808374 ?auto_808382 ) ) ( not ( = ?auto_808374 ?auto_808383 ) ) ( not ( = ?auto_808374 ?auto_808384 ) ) ( not ( = ?auto_808374 ?auto_808385 ) ) ( not ( = ?auto_808374 ?auto_808386 ) ) ( not ( = ?auto_808374 ?auto_808387 ) ) ( not ( = ?auto_808374 ?auto_808388 ) ) ( not ( = ?auto_808374 ?auto_808389 ) ) ( not ( = ?auto_808375 ?auto_808376 ) ) ( not ( = ?auto_808375 ?auto_808377 ) ) ( not ( = ?auto_808375 ?auto_808378 ) ) ( not ( = ?auto_808375 ?auto_808379 ) ) ( not ( = ?auto_808375 ?auto_808380 ) ) ( not ( = ?auto_808375 ?auto_808381 ) ) ( not ( = ?auto_808375 ?auto_808382 ) ) ( not ( = ?auto_808375 ?auto_808383 ) ) ( not ( = ?auto_808375 ?auto_808384 ) ) ( not ( = ?auto_808375 ?auto_808385 ) ) ( not ( = ?auto_808375 ?auto_808386 ) ) ( not ( = ?auto_808375 ?auto_808387 ) ) ( not ( = ?auto_808375 ?auto_808388 ) ) ( not ( = ?auto_808375 ?auto_808389 ) ) ( not ( = ?auto_808376 ?auto_808377 ) ) ( not ( = ?auto_808376 ?auto_808378 ) ) ( not ( = ?auto_808376 ?auto_808379 ) ) ( not ( = ?auto_808376 ?auto_808380 ) ) ( not ( = ?auto_808376 ?auto_808381 ) ) ( not ( = ?auto_808376 ?auto_808382 ) ) ( not ( = ?auto_808376 ?auto_808383 ) ) ( not ( = ?auto_808376 ?auto_808384 ) ) ( not ( = ?auto_808376 ?auto_808385 ) ) ( not ( = ?auto_808376 ?auto_808386 ) ) ( not ( = ?auto_808376 ?auto_808387 ) ) ( not ( = ?auto_808376 ?auto_808388 ) ) ( not ( = ?auto_808376 ?auto_808389 ) ) ( not ( = ?auto_808377 ?auto_808378 ) ) ( not ( = ?auto_808377 ?auto_808379 ) ) ( not ( = ?auto_808377 ?auto_808380 ) ) ( not ( = ?auto_808377 ?auto_808381 ) ) ( not ( = ?auto_808377 ?auto_808382 ) ) ( not ( = ?auto_808377 ?auto_808383 ) ) ( not ( = ?auto_808377 ?auto_808384 ) ) ( not ( = ?auto_808377 ?auto_808385 ) ) ( not ( = ?auto_808377 ?auto_808386 ) ) ( not ( = ?auto_808377 ?auto_808387 ) ) ( not ( = ?auto_808377 ?auto_808388 ) ) ( not ( = ?auto_808377 ?auto_808389 ) ) ( not ( = ?auto_808378 ?auto_808379 ) ) ( not ( = ?auto_808378 ?auto_808380 ) ) ( not ( = ?auto_808378 ?auto_808381 ) ) ( not ( = ?auto_808378 ?auto_808382 ) ) ( not ( = ?auto_808378 ?auto_808383 ) ) ( not ( = ?auto_808378 ?auto_808384 ) ) ( not ( = ?auto_808378 ?auto_808385 ) ) ( not ( = ?auto_808378 ?auto_808386 ) ) ( not ( = ?auto_808378 ?auto_808387 ) ) ( not ( = ?auto_808378 ?auto_808388 ) ) ( not ( = ?auto_808378 ?auto_808389 ) ) ( not ( = ?auto_808379 ?auto_808380 ) ) ( not ( = ?auto_808379 ?auto_808381 ) ) ( not ( = ?auto_808379 ?auto_808382 ) ) ( not ( = ?auto_808379 ?auto_808383 ) ) ( not ( = ?auto_808379 ?auto_808384 ) ) ( not ( = ?auto_808379 ?auto_808385 ) ) ( not ( = ?auto_808379 ?auto_808386 ) ) ( not ( = ?auto_808379 ?auto_808387 ) ) ( not ( = ?auto_808379 ?auto_808388 ) ) ( not ( = ?auto_808379 ?auto_808389 ) ) ( not ( = ?auto_808380 ?auto_808381 ) ) ( not ( = ?auto_808380 ?auto_808382 ) ) ( not ( = ?auto_808380 ?auto_808383 ) ) ( not ( = ?auto_808380 ?auto_808384 ) ) ( not ( = ?auto_808380 ?auto_808385 ) ) ( not ( = ?auto_808380 ?auto_808386 ) ) ( not ( = ?auto_808380 ?auto_808387 ) ) ( not ( = ?auto_808380 ?auto_808388 ) ) ( not ( = ?auto_808380 ?auto_808389 ) ) ( not ( = ?auto_808381 ?auto_808382 ) ) ( not ( = ?auto_808381 ?auto_808383 ) ) ( not ( = ?auto_808381 ?auto_808384 ) ) ( not ( = ?auto_808381 ?auto_808385 ) ) ( not ( = ?auto_808381 ?auto_808386 ) ) ( not ( = ?auto_808381 ?auto_808387 ) ) ( not ( = ?auto_808381 ?auto_808388 ) ) ( not ( = ?auto_808381 ?auto_808389 ) ) ( not ( = ?auto_808382 ?auto_808383 ) ) ( not ( = ?auto_808382 ?auto_808384 ) ) ( not ( = ?auto_808382 ?auto_808385 ) ) ( not ( = ?auto_808382 ?auto_808386 ) ) ( not ( = ?auto_808382 ?auto_808387 ) ) ( not ( = ?auto_808382 ?auto_808388 ) ) ( not ( = ?auto_808382 ?auto_808389 ) ) ( not ( = ?auto_808383 ?auto_808384 ) ) ( not ( = ?auto_808383 ?auto_808385 ) ) ( not ( = ?auto_808383 ?auto_808386 ) ) ( not ( = ?auto_808383 ?auto_808387 ) ) ( not ( = ?auto_808383 ?auto_808388 ) ) ( not ( = ?auto_808383 ?auto_808389 ) ) ( not ( = ?auto_808384 ?auto_808385 ) ) ( not ( = ?auto_808384 ?auto_808386 ) ) ( not ( = ?auto_808384 ?auto_808387 ) ) ( not ( = ?auto_808384 ?auto_808388 ) ) ( not ( = ?auto_808384 ?auto_808389 ) ) ( not ( = ?auto_808385 ?auto_808386 ) ) ( not ( = ?auto_808385 ?auto_808387 ) ) ( not ( = ?auto_808385 ?auto_808388 ) ) ( not ( = ?auto_808385 ?auto_808389 ) ) ( not ( = ?auto_808386 ?auto_808387 ) ) ( not ( = ?auto_808386 ?auto_808388 ) ) ( not ( = ?auto_808386 ?auto_808389 ) ) ( not ( = ?auto_808387 ?auto_808388 ) ) ( not ( = ?auto_808387 ?auto_808389 ) ) ( not ( = ?auto_808388 ?auto_808389 ) ) ( ON ?auto_808387 ?auto_808388 ) ( ON ?auto_808386 ?auto_808387 ) ( ON ?auto_808385 ?auto_808386 ) ( ON ?auto_808384 ?auto_808385 ) ( ON ?auto_808383 ?auto_808384 ) ( ON ?auto_808382 ?auto_808383 ) ( ON ?auto_808381 ?auto_808382 ) ( ON ?auto_808380 ?auto_808381 ) ( ON ?auto_808379 ?auto_808380 ) ( ON ?auto_808378 ?auto_808379 ) ( ON ?auto_808377 ?auto_808378 ) ( CLEAR ?auto_808375 ) ( ON ?auto_808376 ?auto_808377 ) ( CLEAR ?auto_808376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_808372 ?auto_808373 ?auto_808374 ?auto_808375 ?auto_808376 )
      ( MAKE-17PILE ?auto_808372 ?auto_808373 ?auto_808374 ?auto_808375 ?auto_808376 ?auto_808377 ?auto_808378 ?auto_808379 ?auto_808380 ?auto_808381 ?auto_808382 ?auto_808383 ?auto_808384 ?auto_808385 ?auto_808386 ?auto_808387 ?auto_808388 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808442 - BLOCK
      ?auto_808443 - BLOCK
      ?auto_808444 - BLOCK
      ?auto_808445 - BLOCK
      ?auto_808446 - BLOCK
      ?auto_808447 - BLOCK
      ?auto_808448 - BLOCK
      ?auto_808449 - BLOCK
      ?auto_808450 - BLOCK
      ?auto_808451 - BLOCK
      ?auto_808452 - BLOCK
      ?auto_808453 - BLOCK
      ?auto_808454 - BLOCK
      ?auto_808455 - BLOCK
      ?auto_808456 - BLOCK
      ?auto_808457 - BLOCK
      ?auto_808458 - BLOCK
    )
    :vars
    (
      ?auto_808459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808458 ?auto_808459 ) ( ON-TABLE ?auto_808442 ) ( ON ?auto_808443 ?auto_808442 ) ( ON ?auto_808444 ?auto_808443 ) ( not ( = ?auto_808442 ?auto_808443 ) ) ( not ( = ?auto_808442 ?auto_808444 ) ) ( not ( = ?auto_808442 ?auto_808445 ) ) ( not ( = ?auto_808442 ?auto_808446 ) ) ( not ( = ?auto_808442 ?auto_808447 ) ) ( not ( = ?auto_808442 ?auto_808448 ) ) ( not ( = ?auto_808442 ?auto_808449 ) ) ( not ( = ?auto_808442 ?auto_808450 ) ) ( not ( = ?auto_808442 ?auto_808451 ) ) ( not ( = ?auto_808442 ?auto_808452 ) ) ( not ( = ?auto_808442 ?auto_808453 ) ) ( not ( = ?auto_808442 ?auto_808454 ) ) ( not ( = ?auto_808442 ?auto_808455 ) ) ( not ( = ?auto_808442 ?auto_808456 ) ) ( not ( = ?auto_808442 ?auto_808457 ) ) ( not ( = ?auto_808442 ?auto_808458 ) ) ( not ( = ?auto_808442 ?auto_808459 ) ) ( not ( = ?auto_808443 ?auto_808444 ) ) ( not ( = ?auto_808443 ?auto_808445 ) ) ( not ( = ?auto_808443 ?auto_808446 ) ) ( not ( = ?auto_808443 ?auto_808447 ) ) ( not ( = ?auto_808443 ?auto_808448 ) ) ( not ( = ?auto_808443 ?auto_808449 ) ) ( not ( = ?auto_808443 ?auto_808450 ) ) ( not ( = ?auto_808443 ?auto_808451 ) ) ( not ( = ?auto_808443 ?auto_808452 ) ) ( not ( = ?auto_808443 ?auto_808453 ) ) ( not ( = ?auto_808443 ?auto_808454 ) ) ( not ( = ?auto_808443 ?auto_808455 ) ) ( not ( = ?auto_808443 ?auto_808456 ) ) ( not ( = ?auto_808443 ?auto_808457 ) ) ( not ( = ?auto_808443 ?auto_808458 ) ) ( not ( = ?auto_808443 ?auto_808459 ) ) ( not ( = ?auto_808444 ?auto_808445 ) ) ( not ( = ?auto_808444 ?auto_808446 ) ) ( not ( = ?auto_808444 ?auto_808447 ) ) ( not ( = ?auto_808444 ?auto_808448 ) ) ( not ( = ?auto_808444 ?auto_808449 ) ) ( not ( = ?auto_808444 ?auto_808450 ) ) ( not ( = ?auto_808444 ?auto_808451 ) ) ( not ( = ?auto_808444 ?auto_808452 ) ) ( not ( = ?auto_808444 ?auto_808453 ) ) ( not ( = ?auto_808444 ?auto_808454 ) ) ( not ( = ?auto_808444 ?auto_808455 ) ) ( not ( = ?auto_808444 ?auto_808456 ) ) ( not ( = ?auto_808444 ?auto_808457 ) ) ( not ( = ?auto_808444 ?auto_808458 ) ) ( not ( = ?auto_808444 ?auto_808459 ) ) ( not ( = ?auto_808445 ?auto_808446 ) ) ( not ( = ?auto_808445 ?auto_808447 ) ) ( not ( = ?auto_808445 ?auto_808448 ) ) ( not ( = ?auto_808445 ?auto_808449 ) ) ( not ( = ?auto_808445 ?auto_808450 ) ) ( not ( = ?auto_808445 ?auto_808451 ) ) ( not ( = ?auto_808445 ?auto_808452 ) ) ( not ( = ?auto_808445 ?auto_808453 ) ) ( not ( = ?auto_808445 ?auto_808454 ) ) ( not ( = ?auto_808445 ?auto_808455 ) ) ( not ( = ?auto_808445 ?auto_808456 ) ) ( not ( = ?auto_808445 ?auto_808457 ) ) ( not ( = ?auto_808445 ?auto_808458 ) ) ( not ( = ?auto_808445 ?auto_808459 ) ) ( not ( = ?auto_808446 ?auto_808447 ) ) ( not ( = ?auto_808446 ?auto_808448 ) ) ( not ( = ?auto_808446 ?auto_808449 ) ) ( not ( = ?auto_808446 ?auto_808450 ) ) ( not ( = ?auto_808446 ?auto_808451 ) ) ( not ( = ?auto_808446 ?auto_808452 ) ) ( not ( = ?auto_808446 ?auto_808453 ) ) ( not ( = ?auto_808446 ?auto_808454 ) ) ( not ( = ?auto_808446 ?auto_808455 ) ) ( not ( = ?auto_808446 ?auto_808456 ) ) ( not ( = ?auto_808446 ?auto_808457 ) ) ( not ( = ?auto_808446 ?auto_808458 ) ) ( not ( = ?auto_808446 ?auto_808459 ) ) ( not ( = ?auto_808447 ?auto_808448 ) ) ( not ( = ?auto_808447 ?auto_808449 ) ) ( not ( = ?auto_808447 ?auto_808450 ) ) ( not ( = ?auto_808447 ?auto_808451 ) ) ( not ( = ?auto_808447 ?auto_808452 ) ) ( not ( = ?auto_808447 ?auto_808453 ) ) ( not ( = ?auto_808447 ?auto_808454 ) ) ( not ( = ?auto_808447 ?auto_808455 ) ) ( not ( = ?auto_808447 ?auto_808456 ) ) ( not ( = ?auto_808447 ?auto_808457 ) ) ( not ( = ?auto_808447 ?auto_808458 ) ) ( not ( = ?auto_808447 ?auto_808459 ) ) ( not ( = ?auto_808448 ?auto_808449 ) ) ( not ( = ?auto_808448 ?auto_808450 ) ) ( not ( = ?auto_808448 ?auto_808451 ) ) ( not ( = ?auto_808448 ?auto_808452 ) ) ( not ( = ?auto_808448 ?auto_808453 ) ) ( not ( = ?auto_808448 ?auto_808454 ) ) ( not ( = ?auto_808448 ?auto_808455 ) ) ( not ( = ?auto_808448 ?auto_808456 ) ) ( not ( = ?auto_808448 ?auto_808457 ) ) ( not ( = ?auto_808448 ?auto_808458 ) ) ( not ( = ?auto_808448 ?auto_808459 ) ) ( not ( = ?auto_808449 ?auto_808450 ) ) ( not ( = ?auto_808449 ?auto_808451 ) ) ( not ( = ?auto_808449 ?auto_808452 ) ) ( not ( = ?auto_808449 ?auto_808453 ) ) ( not ( = ?auto_808449 ?auto_808454 ) ) ( not ( = ?auto_808449 ?auto_808455 ) ) ( not ( = ?auto_808449 ?auto_808456 ) ) ( not ( = ?auto_808449 ?auto_808457 ) ) ( not ( = ?auto_808449 ?auto_808458 ) ) ( not ( = ?auto_808449 ?auto_808459 ) ) ( not ( = ?auto_808450 ?auto_808451 ) ) ( not ( = ?auto_808450 ?auto_808452 ) ) ( not ( = ?auto_808450 ?auto_808453 ) ) ( not ( = ?auto_808450 ?auto_808454 ) ) ( not ( = ?auto_808450 ?auto_808455 ) ) ( not ( = ?auto_808450 ?auto_808456 ) ) ( not ( = ?auto_808450 ?auto_808457 ) ) ( not ( = ?auto_808450 ?auto_808458 ) ) ( not ( = ?auto_808450 ?auto_808459 ) ) ( not ( = ?auto_808451 ?auto_808452 ) ) ( not ( = ?auto_808451 ?auto_808453 ) ) ( not ( = ?auto_808451 ?auto_808454 ) ) ( not ( = ?auto_808451 ?auto_808455 ) ) ( not ( = ?auto_808451 ?auto_808456 ) ) ( not ( = ?auto_808451 ?auto_808457 ) ) ( not ( = ?auto_808451 ?auto_808458 ) ) ( not ( = ?auto_808451 ?auto_808459 ) ) ( not ( = ?auto_808452 ?auto_808453 ) ) ( not ( = ?auto_808452 ?auto_808454 ) ) ( not ( = ?auto_808452 ?auto_808455 ) ) ( not ( = ?auto_808452 ?auto_808456 ) ) ( not ( = ?auto_808452 ?auto_808457 ) ) ( not ( = ?auto_808452 ?auto_808458 ) ) ( not ( = ?auto_808452 ?auto_808459 ) ) ( not ( = ?auto_808453 ?auto_808454 ) ) ( not ( = ?auto_808453 ?auto_808455 ) ) ( not ( = ?auto_808453 ?auto_808456 ) ) ( not ( = ?auto_808453 ?auto_808457 ) ) ( not ( = ?auto_808453 ?auto_808458 ) ) ( not ( = ?auto_808453 ?auto_808459 ) ) ( not ( = ?auto_808454 ?auto_808455 ) ) ( not ( = ?auto_808454 ?auto_808456 ) ) ( not ( = ?auto_808454 ?auto_808457 ) ) ( not ( = ?auto_808454 ?auto_808458 ) ) ( not ( = ?auto_808454 ?auto_808459 ) ) ( not ( = ?auto_808455 ?auto_808456 ) ) ( not ( = ?auto_808455 ?auto_808457 ) ) ( not ( = ?auto_808455 ?auto_808458 ) ) ( not ( = ?auto_808455 ?auto_808459 ) ) ( not ( = ?auto_808456 ?auto_808457 ) ) ( not ( = ?auto_808456 ?auto_808458 ) ) ( not ( = ?auto_808456 ?auto_808459 ) ) ( not ( = ?auto_808457 ?auto_808458 ) ) ( not ( = ?auto_808457 ?auto_808459 ) ) ( not ( = ?auto_808458 ?auto_808459 ) ) ( ON ?auto_808457 ?auto_808458 ) ( ON ?auto_808456 ?auto_808457 ) ( ON ?auto_808455 ?auto_808456 ) ( ON ?auto_808454 ?auto_808455 ) ( ON ?auto_808453 ?auto_808454 ) ( ON ?auto_808452 ?auto_808453 ) ( ON ?auto_808451 ?auto_808452 ) ( ON ?auto_808450 ?auto_808451 ) ( ON ?auto_808449 ?auto_808450 ) ( ON ?auto_808448 ?auto_808449 ) ( ON ?auto_808447 ?auto_808448 ) ( ON ?auto_808446 ?auto_808447 ) ( CLEAR ?auto_808444 ) ( ON ?auto_808445 ?auto_808446 ) ( CLEAR ?auto_808445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_808442 ?auto_808443 ?auto_808444 ?auto_808445 )
      ( MAKE-17PILE ?auto_808442 ?auto_808443 ?auto_808444 ?auto_808445 ?auto_808446 ?auto_808447 ?auto_808448 ?auto_808449 ?auto_808450 ?auto_808451 ?auto_808452 ?auto_808453 ?auto_808454 ?auto_808455 ?auto_808456 ?auto_808457 ?auto_808458 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808512 - BLOCK
      ?auto_808513 - BLOCK
      ?auto_808514 - BLOCK
      ?auto_808515 - BLOCK
      ?auto_808516 - BLOCK
      ?auto_808517 - BLOCK
      ?auto_808518 - BLOCK
      ?auto_808519 - BLOCK
      ?auto_808520 - BLOCK
      ?auto_808521 - BLOCK
      ?auto_808522 - BLOCK
      ?auto_808523 - BLOCK
      ?auto_808524 - BLOCK
      ?auto_808525 - BLOCK
      ?auto_808526 - BLOCK
      ?auto_808527 - BLOCK
      ?auto_808528 - BLOCK
    )
    :vars
    (
      ?auto_808529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808528 ?auto_808529 ) ( ON-TABLE ?auto_808512 ) ( ON ?auto_808513 ?auto_808512 ) ( not ( = ?auto_808512 ?auto_808513 ) ) ( not ( = ?auto_808512 ?auto_808514 ) ) ( not ( = ?auto_808512 ?auto_808515 ) ) ( not ( = ?auto_808512 ?auto_808516 ) ) ( not ( = ?auto_808512 ?auto_808517 ) ) ( not ( = ?auto_808512 ?auto_808518 ) ) ( not ( = ?auto_808512 ?auto_808519 ) ) ( not ( = ?auto_808512 ?auto_808520 ) ) ( not ( = ?auto_808512 ?auto_808521 ) ) ( not ( = ?auto_808512 ?auto_808522 ) ) ( not ( = ?auto_808512 ?auto_808523 ) ) ( not ( = ?auto_808512 ?auto_808524 ) ) ( not ( = ?auto_808512 ?auto_808525 ) ) ( not ( = ?auto_808512 ?auto_808526 ) ) ( not ( = ?auto_808512 ?auto_808527 ) ) ( not ( = ?auto_808512 ?auto_808528 ) ) ( not ( = ?auto_808512 ?auto_808529 ) ) ( not ( = ?auto_808513 ?auto_808514 ) ) ( not ( = ?auto_808513 ?auto_808515 ) ) ( not ( = ?auto_808513 ?auto_808516 ) ) ( not ( = ?auto_808513 ?auto_808517 ) ) ( not ( = ?auto_808513 ?auto_808518 ) ) ( not ( = ?auto_808513 ?auto_808519 ) ) ( not ( = ?auto_808513 ?auto_808520 ) ) ( not ( = ?auto_808513 ?auto_808521 ) ) ( not ( = ?auto_808513 ?auto_808522 ) ) ( not ( = ?auto_808513 ?auto_808523 ) ) ( not ( = ?auto_808513 ?auto_808524 ) ) ( not ( = ?auto_808513 ?auto_808525 ) ) ( not ( = ?auto_808513 ?auto_808526 ) ) ( not ( = ?auto_808513 ?auto_808527 ) ) ( not ( = ?auto_808513 ?auto_808528 ) ) ( not ( = ?auto_808513 ?auto_808529 ) ) ( not ( = ?auto_808514 ?auto_808515 ) ) ( not ( = ?auto_808514 ?auto_808516 ) ) ( not ( = ?auto_808514 ?auto_808517 ) ) ( not ( = ?auto_808514 ?auto_808518 ) ) ( not ( = ?auto_808514 ?auto_808519 ) ) ( not ( = ?auto_808514 ?auto_808520 ) ) ( not ( = ?auto_808514 ?auto_808521 ) ) ( not ( = ?auto_808514 ?auto_808522 ) ) ( not ( = ?auto_808514 ?auto_808523 ) ) ( not ( = ?auto_808514 ?auto_808524 ) ) ( not ( = ?auto_808514 ?auto_808525 ) ) ( not ( = ?auto_808514 ?auto_808526 ) ) ( not ( = ?auto_808514 ?auto_808527 ) ) ( not ( = ?auto_808514 ?auto_808528 ) ) ( not ( = ?auto_808514 ?auto_808529 ) ) ( not ( = ?auto_808515 ?auto_808516 ) ) ( not ( = ?auto_808515 ?auto_808517 ) ) ( not ( = ?auto_808515 ?auto_808518 ) ) ( not ( = ?auto_808515 ?auto_808519 ) ) ( not ( = ?auto_808515 ?auto_808520 ) ) ( not ( = ?auto_808515 ?auto_808521 ) ) ( not ( = ?auto_808515 ?auto_808522 ) ) ( not ( = ?auto_808515 ?auto_808523 ) ) ( not ( = ?auto_808515 ?auto_808524 ) ) ( not ( = ?auto_808515 ?auto_808525 ) ) ( not ( = ?auto_808515 ?auto_808526 ) ) ( not ( = ?auto_808515 ?auto_808527 ) ) ( not ( = ?auto_808515 ?auto_808528 ) ) ( not ( = ?auto_808515 ?auto_808529 ) ) ( not ( = ?auto_808516 ?auto_808517 ) ) ( not ( = ?auto_808516 ?auto_808518 ) ) ( not ( = ?auto_808516 ?auto_808519 ) ) ( not ( = ?auto_808516 ?auto_808520 ) ) ( not ( = ?auto_808516 ?auto_808521 ) ) ( not ( = ?auto_808516 ?auto_808522 ) ) ( not ( = ?auto_808516 ?auto_808523 ) ) ( not ( = ?auto_808516 ?auto_808524 ) ) ( not ( = ?auto_808516 ?auto_808525 ) ) ( not ( = ?auto_808516 ?auto_808526 ) ) ( not ( = ?auto_808516 ?auto_808527 ) ) ( not ( = ?auto_808516 ?auto_808528 ) ) ( not ( = ?auto_808516 ?auto_808529 ) ) ( not ( = ?auto_808517 ?auto_808518 ) ) ( not ( = ?auto_808517 ?auto_808519 ) ) ( not ( = ?auto_808517 ?auto_808520 ) ) ( not ( = ?auto_808517 ?auto_808521 ) ) ( not ( = ?auto_808517 ?auto_808522 ) ) ( not ( = ?auto_808517 ?auto_808523 ) ) ( not ( = ?auto_808517 ?auto_808524 ) ) ( not ( = ?auto_808517 ?auto_808525 ) ) ( not ( = ?auto_808517 ?auto_808526 ) ) ( not ( = ?auto_808517 ?auto_808527 ) ) ( not ( = ?auto_808517 ?auto_808528 ) ) ( not ( = ?auto_808517 ?auto_808529 ) ) ( not ( = ?auto_808518 ?auto_808519 ) ) ( not ( = ?auto_808518 ?auto_808520 ) ) ( not ( = ?auto_808518 ?auto_808521 ) ) ( not ( = ?auto_808518 ?auto_808522 ) ) ( not ( = ?auto_808518 ?auto_808523 ) ) ( not ( = ?auto_808518 ?auto_808524 ) ) ( not ( = ?auto_808518 ?auto_808525 ) ) ( not ( = ?auto_808518 ?auto_808526 ) ) ( not ( = ?auto_808518 ?auto_808527 ) ) ( not ( = ?auto_808518 ?auto_808528 ) ) ( not ( = ?auto_808518 ?auto_808529 ) ) ( not ( = ?auto_808519 ?auto_808520 ) ) ( not ( = ?auto_808519 ?auto_808521 ) ) ( not ( = ?auto_808519 ?auto_808522 ) ) ( not ( = ?auto_808519 ?auto_808523 ) ) ( not ( = ?auto_808519 ?auto_808524 ) ) ( not ( = ?auto_808519 ?auto_808525 ) ) ( not ( = ?auto_808519 ?auto_808526 ) ) ( not ( = ?auto_808519 ?auto_808527 ) ) ( not ( = ?auto_808519 ?auto_808528 ) ) ( not ( = ?auto_808519 ?auto_808529 ) ) ( not ( = ?auto_808520 ?auto_808521 ) ) ( not ( = ?auto_808520 ?auto_808522 ) ) ( not ( = ?auto_808520 ?auto_808523 ) ) ( not ( = ?auto_808520 ?auto_808524 ) ) ( not ( = ?auto_808520 ?auto_808525 ) ) ( not ( = ?auto_808520 ?auto_808526 ) ) ( not ( = ?auto_808520 ?auto_808527 ) ) ( not ( = ?auto_808520 ?auto_808528 ) ) ( not ( = ?auto_808520 ?auto_808529 ) ) ( not ( = ?auto_808521 ?auto_808522 ) ) ( not ( = ?auto_808521 ?auto_808523 ) ) ( not ( = ?auto_808521 ?auto_808524 ) ) ( not ( = ?auto_808521 ?auto_808525 ) ) ( not ( = ?auto_808521 ?auto_808526 ) ) ( not ( = ?auto_808521 ?auto_808527 ) ) ( not ( = ?auto_808521 ?auto_808528 ) ) ( not ( = ?auto_808521 ?auto_808529 ) ) ( not ( = ?auto_808522 ?auto_808523 ) ) ( not ( = ?auto_808522 ?auto_808524 ) ) ( not ( = ?auto_808522 ?auto_808525 ) ) ( not ( = ?auto_808522 ?auto_808526 ) ) ( not ( = ?auto_808522 ?auto_808527 ) ) ( not ( = ?auto_808522 ?auto_808528 ) ) ( not ( = ?auto_808522 ?auto_808529 ) ) ( not ( = ?auto_808523 ?auto_808524 ) ) ( not ( = ?auto_808523 ?auto_808525 ) ) ( not ( = ?auto_808523 ?auto_808526 ) ) ( not ( = ?auto_808523 ?auto_808527 ) ) ( not ( = ?auto_808523 ?auto_808528 ) ) ( not ( = ?auto_808523 ?auto_808529 ) ) ( not ( = ?auto_808524 ?auto_808525 ) ) ( not ( = ?auto_808524 ?auto_808526 ) ) ( not ( = ?auto_808524 ?auto_808527 ) ) ( not ( = ?auto_808524 ?auto_808528 ) ) ( not ( = ?auto_808524 ?auto_808529 ) ) ( not ( = ?auto_808525 ?auto_808526 ) ) ( not ( = ?auto_808525 ?auto_808527 ) ) ( not ( = ?auto_808525 ?auto_808528 ) ) ( not ( = ?auto_808525 ?auto_808529 ) ) ( not ( = ?auto_808526 ?auto_808527 ) ) ( not ( = ?auto_808526 ?auto_808528 ) ) ( not ( = ?auto_808526 ?auto_808529 ) ) ( not ( = ?auto_808527 ?auto_808528 ) ) ( not ( = ?auto_808527 ?auto_808529 ) ) ( not ( = ?auto_808528 ?auto_808529 ) ) ( ON ?auto_808527 ?auto_808528 ) ( ON ?auto_808526 ?auto_808527 ) ( ON ?auto_808525 ?auto_808526 ) ( ON ?auto_808524 ?auto_808525 ) ( ON ?auto_808523 ?auto_808524 ) ( ON ?auto_808522 ?auto_808523 ) ( ON ?auto_808521 ?auto_808522 ) ( ON ?auto_808520 ?auto_808521 ) ( ON ?auto_808519 ?auto_808520 ) ( ON ?auto_808518 ?auto_808519 ) ( ON ?auto_808517 ?auto_808518 ) ( ON ?auto_808516 ?auto_808517 ) ( ON ?auto_808515 ?auto_808516 ) ( CLEAR ?auto_808513 ) ( ON ?auto_808514 ?auto_808515 ) ( CLEAR ?auto_808514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_808512 ?auto_808513 ?auto_808514 )
      ( MAKE-17PILE ?auto_808512 ?auto_808513 ?auto_808514 ?auto_808515 ?auto_808516 ?auto_808517 ?auto_808518 ?auto_808519 ?auto_808520 ?auto_808521 ?auto_808522 ?auto_808523 ?auto_808524 ?auto_808525 ?auto_808526 ?auto_808527 ?auto_808528 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808582 - BLOCK
      ?auto_808583 - BLOCK
      ?auto_808584 - BLOCK
      ?auto_808585 - BLOCK
      ?auto_808586 - BLOCK
      ?auto_808587 - BLOCK
      ?auto_808588 - BLOCK
      ?auto_808589 - BLOCK
      ?auto_808590 - BLOCK
      ?auto_808591 - BLOCK
      ?auto_808592 - BLOCK
      ?auto_808593 - BLOCK
      ?auto_808594 - BLOCK
      ?auto_808595 - BLOCK
      ?auto_808596 - BLOCK
      ?auto_808597 - BLOCK
      ?auto_808598 - BLOCK
    )
    :vars
    (
      ?auto_808599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808598 ?auto_808599 ) ( ON-TABLE ?auto_808582 ) ( not ( = ?auto_808582 ?auto_808583 ) ) ( not ( = ?auto_808582 ?auto_808584 ) ) ( not ( = ?auto_808582 ?auto_808585 ) ) ( not ( = ?auto_808582 ?auto_808586 ) ) ( not ( = ?auto_808582 ?auto_808587 ) ) ( not ( = ?auto_808582 ?auto_808588 ) ) ( not ( = ?auto_808582 ?auto_808589 ) ) ( not ( = ?auto_808582 ?auto_808590 ) ) ( not ( = ?auto_808582 ?auto_808591 ) ) ( not ( = ?auto_808582 ?auto_808592 ) ) ( not ( = ?auto_808582 ?auto_808593 ) ) ( not ( = ?auto_808582 ?auto_808594 ) ) ( not ( = ?auto_808582 ?auto_808595 ) ) ( not ( = ?auto_808582 ?auto_808596 ) ) ( not ( = ?auto_808582 ?auto_808597 ) ) ( not ( = ?auto_808582 ?auto_808598 ) ) ( not ( = ?auto_808582 ?auto_808599 ) ) ( not ( = ?auto_808583 ?auto_808584 ) ) ( not ( = ?auto_808583 ?auto_808585 ) ) ( not ( = ?auto_808583 ?auto_808586 ) ) ( not ( = ?auto_808583 ?auto_808587 ) ) ( not ( = ?auto_808583 ?auto_808588 ) ) ( not ( = ?auto_808583 ?auto_808589 ) ) ( not ( = ?auto_808583 ?auto_808590 ) ) ( not ( = ?auto_808583 ?auto_808591 ) ) ( not ( = ?auto_808583 ?auto_808592 ) ) ( not ( = ?auto_808583 ?auto_808593 ) ) ( not ( = ?auto_808583 ?auto_808594 ) ) ( not ( = ?auto_808583 ?auto_808595 ) ) ( not ( = ?auto_808583 ?auto_808596 ) ) ( not ( = ?auto_808583 ?auto_808597 ) ) ( not ( = ?auto_808583 ?auto_808598 ) ) ( not ( = ?auto_808583 ?auto_808599 ) ) ( not ( = ?auto_808584 ?auto_808585 ) ) ( not ( = ?auto_808584 ?auto_808586 ) ) ( not ( = ?auto_808584 ?auto_808587 ) ) ( not ( = ?auto_808584 ?auto_808588 ) ) ( not ( = ?auto_808584 ?auto_808589 ) ) ( not ( = ?auto_808584 ?auto_808590 ) ) ( not ( = ?auto_808584 ?auto_808591 ) ) ( not ( = ?auto_808584 ?auto_808592 ) ) ( not ( = ?auto_808584 ?auto_808593 ) ) ( not ( = ?auto_808584 ?auto_808594 ) ) ( not ( = ?auto_808584 ?auto_808595 ) ) ( not ( = ?auto_808584 ?auto_808596 ) ) ( not ( = ?auto_808584 ?auto_808597 ) ) ( not ( = ?auto_808584 ?auto_808598 ) ) ( not ( = ?auto_808584 ?auto_808599 ) ) ( not ( = ?auto_808585 ?auto_808586 ) ) ( not ( = ?auto_808585 ?auto_808587 ) ) ( not ( = ?auto_808585 ?auto_808588 ) ) ( not ( = ?auto_808585 ?auto_808589 ) ) ( not ( = ?auto_808585 ?auto_808590 ) ) ( not ( = ?auto_808585 ?auto_808591 ) ) ( not ( = ?auto_808585 ?auto_808592 ) ) ( not ( = ?auto_808585 ?auto_808593 ) ) ( not ( = ?auto_808585 ?auto_808594 ) ) ( not ( = ?auto_808585 ?auto_808595 ) ) ( not ( = ?auto_808585 ?auto_808596 ) ) ( not ( = ?auto_808585 ?auto_808597 ) ) ( not ( = ?auto_808585 ?auto_808598 ) ) ( not ( = ?auto_808585 ?auto_808599 ) ) ( not ( = ?auto_808586 ?auto_808587 ) ) ( not ( = ?auto_808586 ?auto_808588 ) ) ( not ( = ?auto_808586 ?auto_808589 ) ) ( not ( = ?auto_808586 ?auto_808590 ) ) ( not ( = ?auto_808586 ?auto_808591 ) ) ( not ( = ?auto_808586 ?auto_808592 ) ) ( not ( = ?auto_808586 ?auto_808593 ) ) ( not ( = ?auto_808586 ?auto_808594 ) ) ( not ( = ?auto_808586 ?auto_808595 ) ) ( not ( = ?auto_808586 ?auto_808596 ) ) ( not ( = ?auto_808586 ?auto_808597 ) ) ( not ( = ?auto_808586 ?auto_808598 ) ) ( not ( = ?auto_808586 ?auto_808599 ) ) ( not ( = ?auto_808587 ?auto_808588 ) ) ( not ( = ?auto_808587 ?auto_808589 ) ) ( not ( = ?auto_808587 ?auto_808590 ) ) ( not ( = ?auto_808587 ?auto_808591 ) ) ( not ( = ?auto_808587 ?auto_808592 ) ) ( not ( = ?auto_808587 ?auto_808593 ) ) ( not ( = ?auto_808587 ?auto_808594 ) ) ( not ( = ?auto_808587 ?auto_808595 ) ) ( not ( = ?auto_808587 ?auto_808596 ) ) ( not ( = ?auto_808587 ?auto_808597 ) ) ( not ( = ?auto_808587 ?auto_808598 ) ) ( not ( = ?auto_808587 ?auto_808599 ) ) ( not ( = ?auto_808588 ?auto_808589 ) ) ( not ( = ?auto_808588 ?auto_808590 ) ) ( not ( = ?auto_808588 ?auto_808591 ) ) ( not ( = ?auto_808588 ?auto_808592 ) ) ( not ( = ?auto_808588 ?auto_808593 ) ) ( not ( = ?auto_808588 ?auto_808594 ) ) ( not ( = ?auto_808588 ?auto_808595 ) ) ( not ( = ?auto_808588 ?auto_808596 ) ) ( not ( = ?auto_808588 ?auto_808597 ) ) ( not ( = ?auto_808588 ?auto_808598 ) ) ( not ( = ?auto_808588 ?auto_808599 ) ) ( not ( = ?auto_808589 ?auto_808590 ) ) ( not ( = ?auto_808589 ?auto_808591 ) ) ( not ( = ?auto_808589 ?auto_808592 ) ) ( not ( = ?auto_808589 ?auto_808593 ) ) ( not ( = ?auto_808589 ?auto_808594 ) ) ( not ( = ?auto_808589 ?auto_808595 ) ) ( not ( = ?auto_808589 ?auto_808596 ) ) ( not ( = ?auto_808589 ?auto_808597 ) ) ( not ( = ?auto_808589 ?auto_808598 ) ) ( not ( = ?auto_808589 ?auto_808599 ) ) ( not ( = ?auto_808590 ?auto_808591 ) ) ( not ( = ?auto_808590 ?auto_808592 ) ) ( not ( = ?auto_808590 ?auto_808593 ) ) ( not ( = ?auto_808590 ?auto_808594 ) ) ( not ( = ?auto_808590 ?auto_808595 ) ) ( not ( = ?auto_808590 ?auto_808596 ) ) ( not ( = ?auto_808590 ?auto_808597 ) ) ( not ( = ?auto_808590 ?auto_808598 ) ) ( not ( = ?auto_808590 ?auto_808599 ) ) ( not ( = ?auto_808591 ?auto_808592 ) ) ( not ( = ?auto_808591 ?auto_808593 ) ) ( not ( = ?auto_808591 ?auto_808594 ) ) ( not ( = ?auto_808591 ?auto_808595 ) ) ( not ( = ?auto_808591 ?auto_808596 ) ) ( not ( = ?auto_808591 ?auto_808597 ) ) ( not ( = ?auto_808591 ?auto_808598 ) ) ( not ( = ?auto_808591 ?auto_808599 ) ) ( not ( = ?auto_808592 ?auto_808593 ) ) ( not ( = ?auto_808592 ?auto_808594 ) ) ( not ( = ?auto_808592 ?auto_808595 ) ) ( not ( = ?auto_808592 ?auto_808596 ) ) ( not ( = ?auto_808592 ?auto_808597 ) ) ( not ( = ?auto_808592 ?auto_808598 ) ) ( not ( = ?auto_808592 ?auto_808599 ) ) ( not ( = ?auto_808593 ?auto_808594 ) ) ( not ( = ?auto_808593 ?auto_808595 ) ) ( not ( = ?auto_808593 ?auto_808596 ) ) ( not ( = ?auto_808593 ?auto_808597 ) ) ( not ( = ?auto_808593 ?auto_808598 ) ) ( not ( = ?auto_808593 ?auto_808599 ) ) ( not ( = ?auto_808594 ?auto_808595 ) ) ( not ( = ?auto_808594 ?auto_808596 ) ) ( not ( = ?auto_808594 ?auto_808597 ) ) ( not ( = ?auto_808594 ?auto_808598 ) ) ( not ( = ?auto_808594 ?auto_808599 ) ) ( not ( = ?auto_808595 ?auto_808596 ) ) ( not ( = ?auto_808595 ?auto_808597 ) ) ( not ( = ?auto_808595 ?auto_808598 ) ) ( not ( = ?auto_808595 ?auto_808599 ) ) ( not ( = ?auto_808596 ?auto_808597 ) ) ( not ( = ?auto_808596 ?auto_808598 ) ) ( not ( = ?auto_808596 ?auto_808599 ) ) ( not ( = ?auto_808597 ?auto_808598 ) ) ( not ( = ?auto_808597 ?auto_808599 ) ) ( not ( = ?auto_808598 ?auto_808599 ) ) ( ON ?auto_808597 ?auto_808598 ) ( ON ?auto_808596 ?auto_808597 ) ( ON ?auto_808595 ?auto_808596 ) ( ON ?auto_808594 ?auto_808595 ) ( ON ?auto_808593 ?auto_808594 ) ( ON ?auto_808592 ?auto_808593 ) ( ON ?auto_808591 ?auto_808592 ) ( ON ?auto_808590 ?auto_808591 ) ( ON ?auto_808589 ?auto_808590 ) ( ON ?auto_808588 ?auto_808589 ) ( ON ?auto_808587 ?auto_808588 ) ( ON ?auto_808586 ?auto_808587 ) ( ON ?auto_808585 ?auto_808586 ) ( ON ?auto_808584 ?auto_808585 ) ( CLEAR ?auto_808582 ) ( ON ?auto_808583 ?auto_808584 ) ( CLEAR ?auto_808583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_808582 ?auto_808583 )
      ( MAKE-17PILE ?auto_808582 ?auto_808583 ?auto_808584 ?auto_808585 ?auto_808586 ?auto_808587 ?auto_808588 ?auto_808589 ?auto_808590 ?auto_808591 ?auto_808592 ?auto_808593 ?auto_808594 ?auto_808595 ?auto_808596 ?auto_808597 ?auto_808598 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_808652 - BLOCK
      ?auto_808653 - BLOCK
      ?auto_808654 - BLOCK
      ?auto_808655 - BLOCK
      ?auto_808656 - BLOCK
      ?auto_808657 - BLOCK
      ?auto_808658 - BLOCK
      ?auto_808659 - BLOCK
      ?auto_808660 - BLOCK
      ?auto_808661 - BLOCK
      ?auto_808662 - BLOCK
      ?auto_808663 - BLOCK
      ?auto_808664 - BLOCK
      ?auto_808665 - BLOCK
      ?auto_808666 - BLOCK
      ?auto_808667 - BLOCK
      ?auto_808668 - BLOCK
    )
    :vars
    (
      ?auto_808669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808668 ?auto_808669 ) ( not ( = ?auto_808652 ?auto_808653 ) ) ( not ( = ?auto_808652 ?auto_808654 ) ) ( not ( = ?auto_808652 ?auto_808655 ) ) ( not ( = ?auto_808652 ?auto_808656 ) ) ( not ( = ?auto_808652 ?auto_808657 ) ) ( not ( = ?auto_808652 ?auto_808658 ) ) ( not ( = ?auto_808652 ?auto_808659 ) ) ( not ( = ?auto_808652 ?auto_808660 ) ) ( not ( = ?auto_808652 ?auto_808661 ) ) ( not ( = ?auto_808652 ?auto_808662 ) ) ( not ( = ?auto_808652 ?auto_808663 ) ) ( not ( = ?auto_808652 ?auto_808664 ) ) ( not ( = ?auto_808652 ?auto_808665 ) ) ( not ( = ?auto_808652 ?auto_808666 ) ) ( not ( = ?auto_808652 ?auto_808667 ) ) ( not ( = ?auto_808652 ?auto_808668 ) ) ( not ( = ?auto_808652 ?auto_808669 ) ) ( not ( = ?auto_808653 ?auto_808654 ) ) ( not ( = ?auto_808653 ?auto_808655 ) ) ( not ( = ?auto_808653 ?auto_808656 ) ) ( not ( = ?auto_808653 ?auto_808657 ) ) ( not ( = ?auto_808653 ?auto_808658 ) ) ( not ( = ?auto_808653 ?auto_808659 ) ) ( not ( = ?auto_808653 ?auto_808660 ) ) ( not ( = ?auto_808653 ?auto_808661 ) ) ( not ( = ?auto_808653 ?auto_808662 ) ) ( not ( = ?auto_808653 ?auto_808663 ) ) ( not ( = ?auto_808653 ?auto_808664 ) ) ( not ( = ?auto_808653 ?auto_808665 ) ) ( not ( = ?auto_808653 ?auto_808666 ) ) ( not ( = ?auto_808653 ?auto_808667 ) ) ( not ( = ?auto_808653 ?auto_808668 ) ) ( not ( = ?auto_808653 ?auto_808669 ) ) ( not ( = ?auto_808654 ?auto_808655 ) ) ( not ( = ?auto_808654 ?auto_808656 ) ) ( not ( = ?auto_808654 ?auto_808657 ) ) ( not ( = ?auto_808654 ?auto_808658 ) ) ( not ( = ?auto_808654 ?auto_808659 ) ) ( not ( = ?auto_808654 ?auto_808660 ) ) ( not ( = ?auto_808654 ?auto_808661 ) ) ( not ( = ?auto_808654 ?auto_808662 ) ) ( not ( = ?auto_808654 ?auto_808663 ) ) ( not ( = ?auto_808654 ?auto_808664 ) ) ( not ( = ?auto_808654 ?auto_808665 ) ) ( not ( = ?auto_808654 ?auto_808666 ) ) ( not ( = ?auto_808654 ?auto_808667 ) ) ( not ( = ?auto_808654 ?auto_808668 ) ) ( not ( = ?auto_808654 ?auto_808669 ) ) ( not ( = ?auto_808655 ?auto_808656 ) ) ( not ( = ?auto_808655 ?auto_808657 ) ) ( not ( = ?auto_808655 ?auto_808658 ) ) ( not ( = ?auto_808655 ?auto_808659 ) ) ( not ( = ?auto_808655 ?auto_808660 ) ) ( not ( = ?auto_808655 ?auto_808661 ) ) ( not ( = ?auto_808655 ?auto_808662 ) ) ( not ( = ?auto_808655 ?auto_808663 ) ) ( not ( = ?auto_808655 ?auto_808664 ) ) ( not ( = ?auto_808655 ?auto_808665 ) ) ( not ( = ?auto_808655 ?auto_808666 ) ) ( not ( = ?auto_808655 ?auto_808667 ) ) ( not ( = ?auto_808655 ?auto_808668 ) ) ( not ( = ?auto_808655 ?auto_808669 ) ) ( not ( = ?auto_808656 ?auto_808657 ) ) ( not ( = ?auto_808656 ?auto_808658 ) ) ( not ( = ?auto_808656 ?auto_808659 ) ) ( not ( = ?auto_808656 ?auto_808660 ) ) ( not ( = ?auto_808656 ?auto_808661 ) ) ( not ( = ?auto_808656 ?auto_808662 ) ) ( not ( = ?auto_808656 ?auto_808663 ) ) ( not ( = ?auto_808656 ?auto_808664 ) ) ( not ( = ?auto_808656 ?auto_808665 ) ) ( not ( = ?auto_808656 ?auto_808666 ) ) ( not ( = ?auto_808656 ?auto_808667 ) ) ( not ( = ?auto_808656 ?auto_808668 ) ) ( not ( = ?auto_808656 ?auto_808669 ) ) ( not ( = ?auto_808657 ?auto_808658 ) ) ( not ( = ?auto_808657 ?auto_808659 ) ) ( not ( = ?auto_808657 ?auto_808660 ) ) ( not ( = ?auto_808657 ?auto_808661 ) ) ( not ( = ?auto_808657 ?auto_808662 ) ) ( not ( = ?auto_808657 ?auto_808663 ) ) ( not ( = ?auto_808657 ?auto_808664 ) ) ( not ( = ?auto_808657 ?auto_808665 ) ) ( not ( = ?auto_808657 ?auto_808666 ) ) ( not ( = ?auto_808657 ?auto_808667 ) ) ( not ( = ?auto_808657 ?auto_808668 ) ) ( not ( = ?auto_808657 ?auto_808669 ) ) ( not ( = ?auto_808658 ?auto_808659 ) ) ( not ( = ?auto_808658 ?auto_808660 ) ) ( not ( = ?auto_808658 ?auto_808661 ) ) ( not ( = ?auto_808658 ?auto_808662 ) ) ( not ( = ?auto_808658 ?auto_808663 ) ) ( not ( = ?auto_808658 ?auto_808664 ) ) ( not ( = ?auto_808658 ?auto_808665 ) ) ( not ( = ?auto_808658 ?auto_808666 ) ) ( not ( = ?auto_808658 ?auto_808667 ) ) ( not ( = ?auto_808658 ?auto_808668 ) ) ( not ( = ?auto_808658 ?auto_808669 ) ) ( not ( = ?auto_808659 ?auto_808660 ) ) ( not ( = ?auto_808659 ?auto_808661 ) ) ( not ( = ?auto_808659 ?auto_808662 ) ) ( not ( = ?auto_808659 ?auto_808663 ) ) ( not ( = ?auto_808659 ?auto_808664 ) ) ( not ( = ?auto_808659 ?auto_808665 ) ) ( not ( = ?auto_808659 ?auto_808666 ) ) ( not ( = ?auto_808659 ?auto_808667 ) ) ( not ( = ?auto_808659 ?auto_808668 ) ) ( not ( = ?auto_808659 ?auto_808669 ) ) ( not ( = ?auto_808660 ?auto_808661 ) ) ( not ( = ?auto_808660 ?auto_808662 ) ) ( not ( = ?auto_808660 ?auto_808663 ) ) ( not ( = ?auto_808660 ?auto_808664 ) ) ( not ( = ?auto_808660 ?auto_808665 ) ) ( not ( = ?auto_808660 ?auto_808666 ) ) ( not ( = ?auto_808660 ?auto_808667 ) ) ( not ( = ?auto_808660 ?auto_808668 ) ) ( not ( = ?auto_808660 ?auto_808669 ) ) ( not ( = ?auto_808661 ?auto_808662 ) ) ( not ( = ?auto_808661 ?auto_808663 ) ) ( not ( = ?auto_808661 ?auto_808664 ) ) ( not ( = ?auto_808661 ?auto_808665 ) ) ( not ( = ?auto_808661 ?auto_808666 ) ) ( not ( = ?auto_808661 ?auto_808667 ) ) ( not ( = ?auto_808661 ?auto_808668 ) ) ( not ( = ?auto_808661 ?auto_808669 ) ) ( not ( = ?auto_808662 ?auto_808663 ) ) ( not ( = ?auto_808662 ?auto_808664 ) ) ( not ( = ?auto_808662 ?auto_808665 ) ) ( not ( = ?auto_808662 ?auto_808666 ) ) ( not ( = ?auto_808662 ?auto_808667 ) ) ( not ( = ?auto_808662 ?auto_808668 ) ) ( not ( = ?auto_808662 ?auto_808669 ) ) ( not ( = ?auto_808663 ?auto_808664 ) ) ( not ( = ?auto_808663 ?auto_808665 ) ) ( not ( = ?auto_808663 ?auto_808666 ) ) ( not ( = ?auto_808663 ?auto_808667 ) ) ( not ( = ?auto_808663 ?auto_808668 ) ) ( not ( = ?auto_808663 ?auto_808669 ) ) ( not ( = ?auto_808664 ?auto_808665 ) ) ( not ( = ?auto_808664 ?auto_808666 ) ) ( not ( = ?auto_808664 ?auto_808667 ) ) ( not ( = ?auto_808664 ?auto_808668 ) ) ( not ( = ?auto_808664 ?auto_808669 ) ) ( not ( = ?auto_808665 ?auto_808666 ) ) ( not ( = ?auto_808665 ?auto_808667 ) ) ( not ( = ?auto_808665 ?auto_808668 ) ) ( not ( = ?auto_808665 ?auto_808669 ) ) ( not ( = ?auto_808666 ?auto_808667 ) ) ( not ( = ?auto_808666 ?auto_808668 ) ) ( not ( = ?auto_808666 ?auto_808669 ) ) ( not ( = ?auto_808667 ?auto_808668 ) ) ( not ( = ?auto_808667 ?auto_808669 ) ) ( not ( = ?auto_808668 ?auto_808669 ) ) ( ON ?auto_808667 ?auto_808668 ) ( ON ?auto_808666 ?auto_808667 ) ( ON ?auto_808665 ?auto_808666 ) ( ON ?auto_808664 ?auto_808665 ) ( ON ?auto_808663 ?auto_808664 ) ( ON ?auto_808662 ?auto_808663 ) ( ON ?auto_808661 ?auto_808662 ) ( ON ?auto_808660 ?auto_808661 ) ( ON ?auto_808659 ?auto_808660 ) ( ON ?auto_808658 ?auto_808659 ) ( ON ?auto_808657 ?auto_808658 ) ( ON ?auto_808656 ?auto_808657 ) ( ON ?auto_808655 ?auto_808656 ) ( ON ?auto_808654 ?auto_808655 ) ( ON ?auto_808653 ?auto_808654 ) ( ON ?auto_808652 ?auto_808653 ) ( CLEAR ?auto_808652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_808652 )
      ( MAKE-17PILE ?auto_808652 ?auto_808653 ?auto_808654 ?auto_808655 ?auto_808656 ?auto_808657 ?auto_808658 ?auto_808659 ?auto_808660 ?auto_808661 ?auto_808662 ?auto_808663 ?auto_808664 ?auto_808665 ?auto_808666 ?auto_808667 ?auto_808668 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808723 - BLOCK
      ?auto_808724 - BLOCK
      ?auto_808725 - BLOCK
      ?auto_808726 - BLOCK
      ?auto_808727 - BLOCK
      ?auto_808728 - BLOCK
      ?auto_808729 - BLOCK
      ?auto_808730 - BLOCK
      ?auto_808731 - BLOCK
      ?auto_808732 - BLOCK
      ?auto_808733 - BLOCK
      ?auto_808734 - BLOCK
      ?auto_808735 - BLOCK
      ?auto_808736 - BLOCK
      ?auto_808737 - BLOCK
      ?auto_808738 - BLOCK
      ?auto_808739 - BLOCK
      ?auto_808740 - BLOCK
    )
    :vars
    (
      ?auto_808741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_808739 ) ( ON ?auto_808740 ?auto_808741 ) ( CLEAR ?auto_808740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_808723 ) ( ON ?auto_808724 ?auto_808723 ) ( ON ?auto_808725 ?auto_808724 ) ( ON ?auto_808726 ?auto_808725 ) ( ON ?auto_808727 ?auto_808726 ) ( ON ?auto_808728 ?auto_808727 ) ( ON ?auto_808729 ?auto_808728 ) ( ON ?auto_808730 ?auto_808729 ) ( ON ?auto_808731 ?auto_808730 ) ( ON ?auto_808732 ?auto_808731 ) ( ON ?auto_808733 ?auto_808732 ) ( ON ?auto_808734 ?auto_808733 ) ( ON ?auto_808735 ?auto_808734 ) ( ON ?auto_808736 ?auto_808735 ) ( ON ?auto_808737 ?auto_808736 ) ( ON ?auto_808738 ?auto_808737 ) ( ON ?auto_808739 ?auto_808738 ) ( not ( = ?auto_808723 ?auto_808724 ) ) ( not ( = ?auto_808723 ?auto_808725 ) ) ( not ( = ?auto_808723 ?auto_808726 ) ) ( not ( = ?auto_808723 ?auto_808727 ) ) ( not ( = ?auto_808723 ?auto_808728 ) ) ( not ( = ?auto_808723 ?auto_808729 ) ) ( not ( = ?auto_808723 ?auto_808730 ) ) ( not ( = ?auto_808723 ?auto_808731 ) ) ( not ( = ?auto_808723 ?auto_808732 ) ) ( not ( = ?auto_808723 ?auto_808733 ) ) ( not ( = ?auto_808723 ?auto_808734 ) ) ( not ( = ?auto_808723 ?auto_808735 ) ) ( not ( = ?auto_808723 ?auto_808736 ) ) ( not ( = ?auto_808723 ?auto_808737 ) ) ( not ( = ?auto_808723 ?auto_808738 ) ) ( not ( = ?auto_808723 ?auto_808739 ) ) ( not ( = ?auto_808723 ?auto_808740 ) ) ( not ( = ?auto_808723 ?auto_808741 ) ) ( not ( = ?auto_808724 ?auto_808725 ) ) ( not ( = ?auto_808724 ?auto_808726 ) ) ( not ( = ?auto_808724 ?auto_808727 ) ) ( not ( = ?auto_808724 ?auto_808728 ) ) ( not ( = ?auto_808724 ?auto_808729 ) ) ( not ( = ?auto_808724 ?auto_808730 ) ) ( not ( = ?auto_808724 ?auto_808731 ) ) ( not ( = ?auto_808724 ?auto_808732 ) ) ( not ( = ?auto_808724 ?auto_808733 ) ) ( not ( = ?auto_808724 ?auto_808734 ) ) ( not ( = ?auto_808724 ?auto_808735 ) ) ( not ( = ?auto_808724 ?auto_808736 ) ) ( not ( = ?auto_808724 ?auto_808737 ) ) ( not ( = ?auto_808724 ?auto_808738 ) ) ( not ( = ?auto_808724 ?auto_808739 ) ) ( not ( = ?auto_808724 ?auto_808740 ) ) ( not ( = ?auto_808724 ?auto_808741 ) ) ( not ( = ?auto_808725 ?auto_808726 ) ) ( not ( = ?auto_808725 ?auto_808727 ) ) ( not ( = ?auto_808725 ?auto_808728 ) ) ( not ( = ?auto_808725 ?auto_808729 ) ) ( not ( = ?auto_808725 ?auto_808730 ) ) ( not ( = ?auto_808725 ?auto_808731 ) ) ( not ( = ?auto_808725 ?auto_808732 ) ) ( not ( = ?auto_808725 ?auto_808733 ) ) ( not ( = ?auto_808725 ?auto_808734 ) ) ( not ( = ?auto_808725 ?auto_808735 ) ) ( not ( = ?auto_808725 ?auto_808736 ) ) ( not ( = ?auto_808725 ?auto_808737 ) ) ( not ( = ?auto_808725 ?auto_808738 ) ) ( not ( = ?auto_808725 ?auto_808739 ) ) ( not ( = ?auto_808725 ?auto_808740 ) ) ( not ( = ?auto_808725 ?auto_808741 ) ) ( not ( = ?auto_808726 ?auto_808727 ) ) ( not ( = ?auto_808726 ?auto_808728 ) ) ( not ( = ?auto_808726 ?auto_808729 ) ) ( not ( = ?auto_808726 ?auto_808730 ) ) ( not ( = ?auto_808726 ?auto_808731 ) ) ( not ( = ?auto_808726 ?auto_808732 ) ) ( not ( = ?auto_808726 ?auto_808733 ) ) ( not ( = ?auto_808726 ?auto_808734 ) ) ( not ( = ?auto_808726 ?auto_808735 ) ) ( not ( = ?auto_808726 ?auto_808736 ) ) ( not ( = ?auto_808726 ?auto_808737 ) ) ( not ( = ?auto_808726 ?auto_808738 ) ) ( not ( = ?auto_808726 ?auto_808739 ) ) ( not ( = ?auto_808726 ?auto_808740 ) ) ( not ( = ?auto_808726 ?auto_808741 ) ) ( not ( = ?auto_808727 ?auto_808728 ) ) ( not ( = ?auto_808727 ?auto_808729 ) ) ( not ( = ?auto_808727 ?auto_808730 ) ) ( not ( = ?auto_808727 ?auto_808731 ) ) ( not ( = ?auto_808727 ?auto_808732 ) ) ( not ( = ?auto_808727 ?auto_808733 ) ) ( not ( = ?auto_808727 ?auto_808734 ) ) ( not ( = ?auto_808727 ?auto_808735 ) ) ( not ( = ?auto_808727 ?auto_808736 ) ) ( not ( = ?auto_808727 ?auto_808737 ) ) ( not ( = ?auto_808727 ?auto_808738 ) ) ( not ( = ?auto_808727 ?auto_808739 ) ) ( not ( = ?auto_808727 ?auto_808740 ) ) ( not ( = ?auto_808727 ?auto_808741 ) ) ( not ( = ?auto_808728 ?auto_808729 ) ) ( not ( = ?auto_808728 ?auto_808730 ) ) ( not ( = ?auto_808728 ?auto_808731 ) ) ( not ( = ?auto_808728 ?auto_808732 ) ) ( not ( = ?auto_808728 ?auto_808733 ) ) ( not ( = ?auto_808728 ?auto_808734 ) ) ( not ( = ?auto_808728 ?auto_808735 ) ) ( not ( = ?auto_808728 ?auto_808736 ) ) ( not ( = ?auto_808728 ?auto_808737 ) ) ( not ( = ?auto_808728 ?auto_808738 ) ) ( not ( = ?auto_808728 ?auto_808739 ) ) ( not ( = ?auto_808728 ?auto_808740 ) ) ( not ( = ?auto_808728 ?auto_808741 ) ) ( not ( = ?auto_808729 ?auto_808730 ) ) ( not ( = ?auto_808729 ?auto_808731 ) ) ( not ( = ?auto_808729 ?auto_808732 ) ) ( not ( = ?auto_808729 ?auto_808733 ) ) ( not ( = ?auto_808729 ?auto_808734 ) ) ( not ( = ?auto_808729 ?auto_808735 ) ) ( not ( = ?auto_808729 ?auto_808736 ) ) ( not ( = ?auto_808729 ?auto_808737 ) ) ( not ( = ?auto_808729 ?auto_808738 ) ) ( not ( = ?auto_808729 ?auto_808739 ) ) ( not ( = ?auto_808729 ?auto_808740 ) ) ( not ( = ?auto_808729 ?auto_808741 ) ) ( not ( = ?auto_808730 ?auto_808731 ) ) ( not ( = ?auto_808730 ?auto_808732 ) ) ( not ( = ?auto_808730 ?auto_808733 ) ) ( not ( = ?auto_808730 ?auto_808734 ) ) ( not ( = ?auto_808730 ?auto_808735 ) ) ( not ( = ?auto_808730 ?auto_808736 ) ) ( not ( = ?auto_808730 ?auto_808737 ) ) ( not ( = ?auto_808730 ?auto_808738 ) ) ( not ( = ?auto_808730 ?auto_808739 ) ) ( not ( = ?auto_808730 ?auto_808740 ) ) ( not ( = ?auto_808730 ?auto_808741 ) ) ( not ( = ?auto_808731 ?auto_808732 ) ) ( not ( = ?auto_808731 ?auto_808733 ) ) ( not ( = ?auto_808731 ?auto_808734 ) ) ( not ( = ?auto_808731 ?auto_808735 ) ) ( not ( = ?auto_808731 ?auto_808736 ) ) ( not ( = ?auto_808731 ?auto_808737 ) ) ( not ( = ?auto_808731 ?auto_808738 ) ) ( not ( = ?auto_808731 ?auto_808739 ) ) ( not ( = ?auto_808731 ?auto_808740 ) ) ( not ( = ?auto_808731 ?auto_808741 ) ) ( not ( = ?auto_808732 ?auto_808733 ) ) ( not ( = ?auto_808732 ?auto_808734 ) ) ( not ( = ?auto_808732 ?auto_808735 ) ) ( not ( = ?auto_808732 ?auto_808736 ) ) ( not ( = ?auto_808732 ?auto_808737 ) ) ( not ( = ?auto_808732 ?auto_808738 ) ) ( not ( = ?auto_808732 ?auto_808739 ) ) ( not ( = ?auto_808732 ?auto_808740 ) ) ( not ( = ?auto_808732 ?auto_808741 ) ) ( not ( = ?auto_808733 ?auto_808734 ) ) ( not ( = ?auto_808733 ?auto_808735 ) ) ( not ( = ?auto_808733 ?auto_808736 ) ) ( not ( = ?auto_808733 ?auto_808737 ) ) ( not ( = ?auto_808733 ?auto_808738 ) ) ( not ( = ?auto_808733 ?auto_808739 ) ) ( not ( = ?auto_808733 ?auto_808740 ) ) ( not ( = ?auto_808733 ?auto_808741 ) ) ( not ( = ?auto_808734 ?auto_808735 ) ) ( not ( = ?auto_808734 ?auto_808736 ) ) ( not ( = ?auto_808734 ?auto_808737 ) ) ( not ( = ?auto_808734 ?auto_808738 ) ) ( not ( = ?auto_808734 ?auto_808739 ) ) ( not ( = ?auto_808734 ?auto_808740 ) ) ( not ( = ?auto_808734 ?auto_808741 ) ) ( not ( = ?auto_808735 ?auto_808736 ) ) ( not ( = ?auto_808735 ?auto_808737 ) ) ( not ( = ?auto_808735 ?auto_808738 ) ) ( not ( = ?auto_808735 ?auto_808739 ) ) ( not ( = ?auto_808735 ?auto_808740 ) ) ( not ( = ?auto_808735 ?auto_808741 ) ) ( not ( = ?auto_808736 ?auto_808737 ) ) ( not ( = ?auto_808736 ?auto_808738 ) ) ( not ( = ?auto_808736 ?auto_808739 ) ) ( not ( = ?auto_808736 ?auto_808740 ) ) ( not ( = ?auto_808736 ?auto_808741 ) ) ( not ( = ?auto_808737 ?auto_808738 ) ) ( not ( = ?auto_808737 ?auto_808739 ) ) ( not ( = ?auto_808737 ?auto_808740 ) ) ( not ( = ?auto_808737 ?auto_808741 ) ) ( not ( = ?auto_808738 ?auto_808739 ) ) ( not ( = ?auto_808738 ?auto_808740 ) ) ( not ( = ?auto_808738 ?auto_808741 ) ) ( not ( = ?auto_808739 ?auto_808740 ) ) ( not ( = ?auto_808739 ?auto_808741 ) ) ( not ( = ?auto_808740 ?auto_808741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_808740 ?auto_808741 )
      ( !STACK ?auto_808740 ?auto_808739 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808760 - BLOCK
      ?auto_808761 - BLOCK
      ?auto_808762 - BLOCK
      ?auto_808763 - BLOCK
      ?auto_808764 - BLOCK
      ?auto_808765 - BLOCK
      ?auto_808766 - BLOCK
      ?auto_808767 - BLOCK
      ?auto_808768 - BLOCK
      ?auto_808769 - BLOCK
      ?auto_808770 - BLOCK
      ?auto_808771 - BLOCK
      ?auto_808772 - BLOCK
      ?auto_808773 - BLOCK
      ?auto_808774 - BLOCK
      ?auto_808775 - BLOCK
      ?auto_808776 - BLOCK
      ?auto_808777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_808776 ) ( ON-TABLE ?auto_808777 ) ( CLEAR ?auto_808777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_808760 ) ( ON ?auto_808761 ?auto_808760 ) ( ON ?auto_808762 ?auto_808761 ) ( ON ?auto_808763 ?auto_808762 ) ( ON ?auto_808764 ?auto_808763 ) ( ON ?auto_808765 ?auto_808764 ) ( ON ?auto_808766 ?auto_808765 ) ( ON ?auto_808767 ?auto_808766 ) ( ON ?auto_808768 ?auto_808767 ) ( ON ?auto_808769 ?auto_808768 ) ( ON ?auto_808770 ?auto_808769 ) ( ON ?auto_808771 ?auto_808770 ) ( ON ?auto_808772 ?auto_808771 ) ( ON ?auto_808773 ?auto_808772 ) ( ON ?auto_808774 ?auto_808773 ) ( ON ?auto_808775 ?auto_808774 ) ( ON ?auto_808776 ?auto_808775 ) ( not ( = ?auto_808760 ?auto_808761 ) ) ( not ( = ?auto_808760 ?auto_808762 ) ) ( not ( = ?auto_808760 ?auto_808763 ) ) ( not ( = ?auto_808760 ?auto_808764 ) ) ( not ( = ?auto_808760 ?auto_808765 ) ) ( not ( = ?auto_808760 ?auto_808766 ) ) ( not ( = ?auto_808760 ?auto_808767 ) ) ( not ( = ?auto_808760 ?auto_808768 ) ) ( not ( = ?auto_808760 ?auto_808769 ) ) ( not ( = ?auto_808760 ?auto_808770 ) ) ( not ( = ?auto_808760 ?auto_808771 ) ) ( not ( = ?auto_808760 ?auto_808772 ) ) ( not ( = ?auto_808760 ?auto_808773 ) ) ( not ( = ?auto_808760 ?auto_808774 ) ) ( not ( = ?auto_808760 ?auto_808775 ) ) ( not ( = ?auto_808760 ?auto_808776 ) ) ( not ( = ?auto_808760 ?auto_808777 ) ) ( not ( = ?auto_808761 ?auto_808762 ) ) ( not ( = ?auto_808761 ?auto_808763 ) ) ( not ( = ?auto_808761 ?auto_808764 ) ) ( not ( = ?auto_808761 ?auto_808765 ) ) ( not ( = ?auto_808761 ?auto_808766 ) ) ( not ( = ?auto_808761 ?auto_808767 ) ) ( not ( = ?auto_808761 ?auto_808768 ) ) ( not ( = ?auto_808761 ?auto_808769 ) ) ( not ( = ?auto_808761 ?auto_808770 ) ) ( not ( = ?auto_808761 ?auto_808771 ) ) ( not ( = ?auto_808761 ?auto_808772 ) ) ( not ( = ?auto_808761 ?auto_808773 ) ) ( not ( = ?auto_808761 ?auto_808774 ) ) ( not ( = ?auto_808761 ?auto_808775 ) ) ( not ( = ?auto_808761 ?auto_808776 ) ) ( not ( = ?auto_808761 ?auto_808777 ) ) ( not ( = ?auto_808762 ?auto_808763 ) ) ( not ( = ?auto_808762 ?auto_808764 ) ) ( not ( = ?auto_808762 ?auto_808765 ) ) ( not ( = ?auto_808762 ?auto_808766 ) ) ( not ( = ?auto_808762 ?auto_808767 ) ) ( not ( = ?auto_808762 ?auto_808768 ) ) ( not ( = ?auto_808762 ?auto_808769 ) ) ( not ( = ?auto_808762 ?auto_808770 ) ) ( not ( = ?auto_808762 ?auto_808771 ) ) ( not ( = ?auto_808762 ?auto_808772 ) ) ( not ( = ?auto_808762 ?auto_808773 ) ) ( not ( = ?auto_808762 ?auto_808774 ) ) ( not ( = ?auto_808762 ?auto_808775 ) ) ( not ( = ?auto_808762 ?auto_808776 ) ) ( not ( = ?auto_808762 ?auto_808777 ) ) ( not ( = ?auto_808763 ?auto_808764 ) ) ( not ( = ?auto_808763 ?auto_808765 ) ) ( not ( = ?auto_808763 ?auto_808766 ) ) ( not ( = ?auto_808763 ?auto_808767 ) ) ( not ( = ?auto_808763 ?auto_808768 ) ) ( not ( = ?auto_808763 ?auto_808769 ) ) ( not ( = ?auto_808763 ?auto_808770 ) ) ( not ( = ?auto_808763 ?auto_808771 ) ) ( not ( = ?auto_808763 ?auto_808772 ) ) ( not ( = ?auto_808763 ?auto_808773 ) ) ( not ( = ?auto_808763 ?auto_808774 ) ) ( not ( = ?auto_808763 ?auto_808775 ) ) ( not ( = ?auto_808763 ?auto_808776 ) ) ( not ( = ?auto_808763 ?auto_808777 ) ) ( not ( = ?auto_808764 ?auto_808765 ) ) ( not ( = ?auto_808764 ?auto_808766 ) ) ( not ( = ?auto_808764 ?auto_808767 ) ) ( not ( = ?auto_808764 ?auto_808768 ) ) ( not ( = ?auto_808764 ?auto_808769 ) ) ( not ( = ?auto_808764 ?auto_808770 ) ) ( not ( = ?auto_808764 ?auto_808771 ) ) ( not ( = ?auto_808764 ?auto_808772 ) ) ( not ( = ?auto_808764 ?auto_808773 ) ) ( not ( = ?auto_808764 ?auto_808774 ) ) ( not ( = ?auto_808764 ?auto_808775 ) ) ( not ( = ?auto_808764 ?auto_808776 ) ) ( not ( = ?auto_808764 ?auto_808777 ) ) ( not ( = ?auto_808765 ?auto_808766 ) ) ( not ( = ?auto_808765 ?auto_808767 ) ) ( not ( = ?auto_808765 ?auto_808768 ) ) ( not ( = ?auto_808765 ?auto_808769 ) ) ( not ( = ?auto_808765 ?auto_808770 ) ) ( not ( = ?auto_808765 ?auto_808771 ) ) ( not ( = ?auto_808765 ?auto_808772 ) ) ( not ( = ?auto_808765 ?auto_808773 ) ) ( not ( = ?auto_808765 ?auto_808774 ) ) ( not ( = ?auto_808765 ?auto_808775 ) ) ( not ( = ?auto_808765 ?auto_808776 ) ) ( not ( = ?auto_808765 ?auto_808777 ) ) ( not ( = ?auto_808766 ?auto_808767 ) ) ( not ( = ?auto_808766 ?auto_808768 ) ) ( not ( = ?auto_808766 ?auto_808769 ) ) ( not ( = ?auto_808766 ?auto_808770 ) ) ( not ( = ?auto_808766 ?auto_808771 ) ) ( not ( = ?auto_808766 ?auto_808772 ) ) ( not ( = ?auto_808766 ?auto_808773 ) ) ( not ( = ?auto_808766 ?auto_808774 ) ) ( not ( = ?auto_808766 ?auto_808775 ) ) ( not ( = ?auto_808766 ?auto_808776 ) ) ( not ( = ?auto_808766 ?auto_808777 ) ) ( not ( = ?auto_808767 ?auto_808768 ) ) ( not ( = ?auto_808767 ?auto_808769 ) ) ( not ( = ?auto_808767 ?auto_808770 ) ) ( not ( = ?auto_808767 ?auto_808771 ) ) ( not ( = ?auto_808767 ?auto_808772 ) ) ( not ( = ?auto_808767 ?auto_808773 ) ) ( not ( = ?auto_808767 ?auto_808774 ) ) ( not ( = ?auto_808767 ?auto_808775 ) ) ( not ( = ?auto_808767 ?auto_808776 ) ) ( not ( = ?auto_808767 ?auto_808777 ) ) ( not ( = ?auto_808768 ?auto_808769 ) ) ( not ( = ?auto_808768 ?auto_808770 ) ) ( not ( = ?auto_808768 ?auto_808771 ) ) ( not ( = ?auto_808768 ?auto_808772 ) ) ( not ( = ?auto_808768 ?auto_808773 ) ) ( not ( = ?auto_808768 ?auto_808774 ) ) ( not ( = ?auto_808768 ?auto_808775 ) ) ( not ( = ?auto_808768 ?auto_808776 ) ) ( not ( = ?auto_808768 ?auto_808777 ) ) ( not ( = ?auto_808769 ?auto_808770 ) ) ( not ( = ?auto_808769 ?auto_808771 ) ) ( not ( = ?auto_808769 ?auto_808772 ) ) ( not ( = ?auto_808769 ?auto_808773 ) ) ( not ( = ?auto_808769 ?auto_808774 ) ) ( not ( = ?auto_808769 ?auto_808775 ) ) ( not ( = ?auto_808769 ?auto_808776 ) ) ( not ( = ?auto_808769 ?auto_808777 ) ) ( not ( = ?auto_808770 ?auto_808771 ) ) ( not ( = ?auto_808770 ?auto_808772 ) ) ( not ( = ?auto_808770 ?auto_808773 ) ) ( not ( = ?auto_808770 ?auto_808774 ) ) ( not ( = ?auto_808770 ?auto_808775 ) ) ( not ( = ?auto_808770 ?auto_808776 ) ) ( not ( = ?auto_808770 ?auto_808777 ) ) ( not ( = ?auto_808771 ?auto_808772 ) ) ( not ( = ?auto_808771 ?auto_808773 ) ) ( not ( = ?auto_808771 ?auto_808774 ) ) ( not ( = ?auto_808771 ?auto_808775 ) ) ( not ( = ?auto_808771 ?auto_808776 ) ) ( not ( = ?auto_808771 ?auto_808777 ) ) ( not ( = ?auto_808772 ?auto_808773 ) ) ( not ( = ?auto_808772 ?auto_808774 ) ) ( not ( = ?auto_808772 ?auto_808775 ) ) ( not ( = ?auto_808772 ?auto_808776 ) ) ( not ( = ?auto_808772 ?auto_808777 ) ) ( not ( = ?auto_808773 ?auto_808774 ) ) ( not ( = ?auto_808773 ?auto_808775 ) ) ( not ( = ?auto_808773 ?auto_808776 ) ) ( not ( = ?auto_808773 ?auto_808777 ) ) ( not ( = ?auto_808774 ?auto_808775 ) ) ( not ( = ?auto_808774 ?auto_808776 ) ) ( not ( = ?auto_808774 ?auto_808777 ) ) ( not ( = ?auto_808775 ?auto_808776 ) ) ( not ( = ?auto_808775 ?auto_808777 ) ) ( not ( = ?auto_808776 ?auto_808777 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_808777 )
      ( !STACK ?auto_808777 ?auto_808776 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808796 - BLOCK
      ?auto_808797 - BLOCK
      ?auto_808798 - BLOCK
      ?auto_808799 - BLOCK
      ?auto_808800 - BLOCK
      ?auto_808801 - BLOCK
      ?auto_808802 - BLOCK
      ?auto_808803 - BLOCK
      ?auto_808804 - BLOCK
      ?auto_808805 - BLOCK
      ?auto_808806 - BLOCK
      ?auto_808807 - BLOCK
      ?auto_808808 - BLOCK
      ?auto_808809 - BLOCK
      ?auto_808810 - BLOCK
      ?auto_808811 - BLOCK
      ?auto_808812 - BLOCK
      ?auto_808813 - BLOCK
    )
    :vars
    (
      ?auto_808814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808813 ?auto_808814 ) ( ON-TABLE ?auto_808796 ) ( ON ?auto_808797 ?auto_808796 ) ( ON ?auto_808798 ?auto_808797 ) ( ON ?auto_808799 ?auto_808798 ) ( ON ?auto_808800 ?auto_808799 ) ( ON ?auto_808801 ?auto_808800 ) ( ON ?auto_808802 ?auto_808801 ) ( ON ?auto_808803 ?auto_808802 ) ( ON ?auto_808804 ?auto_808803 ) ( ON ?auto_808805 ?auto_808804 ) ( ON ?auto_808806 ?auto_808805 ) ( ON ?auto_808807 ?auto_808806 ) ( ON ?auto_808808 ?auto_808807 ) ( ON ?auto_808809 ?auto_808808 ) ( ON ?auto_808810 ?auto_808809 ) ( ON ?auto_808811 ?auto_808810 ) ( not ( = ?auto_808796 ?auto_808797 ) ) ( not ( = ?auto_808796 ?auto_808798 ) ) ( not ( = ?auto_808796 ?auto_808799 ) ) ( not ( = ?auto_808796 ?auto_808800 ) ) ( not ( = ?auto_808796 ?auto_808801 ) ) ( not ( = ?auto_808796 ?auto_808802 ) ) ( not ( = ?auto_808796 ?auto_808803 ) ) ( not ( = ?auto_808796 ?auto_808804 ) ) ( not ( = ?auto_808796 ?auto_808805 ) ) ( not ( = ?auto_808796 ?auto_808806 ) ) ( not ( = ?auto_808796 ?auto_808807 ) ) ( not ( = ?auto_808796 ?auto_808808 ) ) ( not ( = ?auto_808796 ?auto_808809 ) ) ( not ( = ?auto_808796 ?auto_808810 ) ) ( not ( = ?auto_808796 ?auto_808811 ) ) ( not ( = ?auto_808796 ?auto_808812 ) ) ( not ( = ?auto_808796 ?auto_808813 ) ) ( not ( = ?auto_808796 ?auto_808814 ) ) ( not ( = ?auto_808797 ?auto_808798 ) ) ( not ( = ?auto_808797 ?auto_808799 ) ) ( not ( = ?auto_808797 ?auto_808800 ) ) ( not ( = ?auto_808797 ?auto_808801 ) ) ( not ( = ?auto_808797 ?auto_808802 ) ) ( not ( = ?auto_808797 ?auto_808803 ) ) ( not ( = ?auto_808797 ?auto_808804 ) ) ( not ( = ?auto_808797 ?auto_808805 ) ) ( not ( = ?auto_808797 ?auto_808806 ) ) ( not ( = ?auto_808797 ?auto_808807 ) ) ( not ( = ?auto_808797 ?auto_808808 ) ) ( not ( = ?auto_808797 ?auto_808809 ) ) ( not ( = ?auto_808797 ?auto_808810 ) ) ( not ( = ?auto_808797 ?auto_808811 ) ) ( not ( = ?auto_808797 ?auto_808812 ) ) ( not ( = ?auto_808797 ?auto_808813 ) ) ( not ( = ?auto_808797 ?auto_808814 ) ) ( not ( = ?auto_808798 ?auto_808799 ) ) ( not ( = ?auto_808798 ?auto_808800 ) ) ( not ( = ?auto_808798 ?auto_808801 ) ) ( not ( = ?auto_808798 ?auto_808802 ) ) ( not ( = ?auto_808798 ?auto_808803 ) ) ( not ( = ?auto_808798 ?auto_808804 ) ) ( not ( = ?auto_808798 ?auto_808805 ) ) ( not ( = ?auto_808798 ?auto_808806 ) ) ( not ( = ?auto_808798 ?auto_808807 ) ) ( not ( = ?auto_808798 ?auto_808808 ) ) ( not ( = ?auto_808798 ?auto_808809 ) ) ( not ( = ?auto_808798 ?auto_808810 ) ) ( not ( = ?auto_808798 ?auto_808811 ) ) ( not ( = ?auto_808798 ?auto_808812 ) ) ( not ( = ?auto_808798 ?auto_808813 ) ) ( not ( = ?auto_808798 ?auto_808814 ) ) ( not ( = ?auto_808799 ?auto_808800 ) ) ( not ( = ?auto_808799 ?auto_808801 ) ) ( not ( = ?auto_808799 ?auto_808802 ) ) ( not ( = ?auto_808799 ?auto_808803 ) ) ( not ( = ?auto_808799 ?auto_808804 ) ) ( not ( = ?auto_808799 ?auto_808805 ) ) ( not ( = ?auto_808799 ?auto_808806 ) ) ( not ( = ?auto_808799 ?auto_808807 ) ) ( not ( = ?auto_808799 ?auto_808808 ) ) ( not ( = ?auto_808799 ?auto_808809 ) ) ( not ( = ?auto_808799 ?auto_808810 ) ) ( not ( = ?auto_808799 ?auto_808811 ) ) ( not ( = ?auto_808799 ?auto_808812 ) ) ( not ( = ?auto_808799 ?auto_808813 ) ) ( not ( = ?auto_808799 ?auto_808814 ) ) ( not ( = ?auto_808800 ?auto_808801 ) ) ( not ( = ?auto_808800 ?auto_808802 ) ) ( not ( = ?auto_808800 ?auto_808803 ) ) ( not ( = ?auto_808800 ?auto_808804 ) ) ( not ( = ?auto_808800 ?auto_808805 ) ) ( not ( = ?auto_808800 ?auto_808806 ) ) ( not ( = ?auto_808800 ?auto_808807 ) ) ( not ( = ?auto_808800 ?auto_808808 ) ) ( not ( = ?auto_808800 ?auto_808809 ) ) ( not ( = ?auto_808800 ?auto_808810 ) ) ( not ( = ?auto_808800 ?auto_808811 ) ) ( not ( = ?auto_808800 ?auto_808812 ) ) ( not ( = ?auto_808800 ?auto_808813 ) ) ( not ( = ?auto_808800 ?auto_808814 ) ) ( not ( = ?auto_808801 ?auto_808802 ) ) ( not ( = ?auto_808801 ?auto_808803 ) ) ( not ( = ?auto_808801 ?auto_808804 ) ) ( not ( = ?auto_808801 ?auto_808805 ) ) ( not ( = ?auto_808801 ?auto_808806 ) ) ( not ( = ?auto_808801 ?auto_808807 ) ) ( not ( = ?auto_808801 ?auto_808808 ) ) ( not ( = ?auto_808801 ?auto_808809 ) ) ( not ( = ?auto_808801 ?auto_808810 ) ) ( not ( = ?auto_808801 ?auto_808811 ) ) ( not ( = ?auto_808801 ?auto_808812 ) ) ( not ( = ?auto_808801 ?auto_808813 ) ) ( not ( = ?auto_808801 ?auto_808814 ) ) ( not ( = ?auto_808802 ?auto_808803 ) ) ( not ( = ?auto_808802 ?auto_808804 ) ) ( not ( = ?auto_808802 ?auto_808805 ) ) ( not ( = ?auto_808802 ?auto_808806 ) ) ( not ( = ?auto_808802 ?auto_808807 ) ) ( not ( = ?auto_808802 ?auto_808808 ) ) ( not ( = ?auto_808802 ?auto_808809 ) ) ( not ( = ?auto_808802 ?auto_808810 ) ) ( not ( = ?auto_808802 ?auto_808811 ) ) ( not ( = ?auto_808802 ?auto_808812 ) ) ( not ( = ?auto_808802 ?auto_808813 ) ) ( not ( = ?auto_808802 ?auto_808814 ) ) ( not ( = ?auto_808803 ?auto_808804 ) ) ( not ( = ?auto_808803 ?auto_808805 ) ) ( not ( = ?auto_808803 ?auto_808806 ) ) ( not ( = ?auto_808803 ?auto_808807 ) ) ( not ( = ?auto_808803 ?auto_808808 ) ) ( not ( = ?auto_808803 ?auto_808809 ) ) ( not ( = ?auto_808803 ?auto_808810 ) ) ( not ( = ?auto_808803 ?auto_808811 ) ) ( not ( = ?auto_808803 ?auto_808812 ) ) ( not ( = ?auto_808803 ?auto_808813 ) ) ( not ( = ?auto_808803 ?auto_808814 ) ) ( not ( = ?auto_808804 ?auto_808805 ) ) ( not ( = ?auto_808804 ?auto_808806 ) ) ( not ( = ?auto_808804 ?auto_808807 ) ) ( not ( = ?auto_808804 ?auto_808808 ) ) ( not ( = ?auto_808804 ?auto_808809 ) ) ( not ( = ?auto_808804 ?auto_808810 ) ) ( not ( = ?auto_808804 ?auto_808811 ) ) ( not ( = ?auto_808804 ?auto_808812 ) ) ( not ( = ?auto_808804 ?auto_808813 ) ) ( not ( = ?auto_808804 ?auto_808814 ) ) ( not ( = ?auto_808805 ?auto_808806 ) ) ( not ( = ?auto_808805 ?auto_808807 ) ) ( not ( = ?auto_808805 ?auto_808808 ) ) ( not ( = ?auto_808805 ?auto_808809 ) ) ( not ( = ?auto_808805 ?auto_808810 ) ) ( not ( = ?auto_808805 ?auto_808811 ) ) ( not ( = ?auto_808805 ?auto_808812 ) ) ( not ( = ?auto_808805 ?auto_808813 ) ) ( not ( = ?auto_808805 ?auto_808814 ) ) ( not ( = ?auto_808806 ?auto_808807 ) ) ( not ( = ?auto_808806 ?auto_808808 ) ) ( not ( = ?auto_808806 ?auto_808809 ) ) ( not ( = ?auto_808806 ?auto_808810 ) ) ( not ( = ?auto_808806 ?auto_808811 ) ) ( not ( = ?auto_808806 ?auto_808812 ) ) ( not ( = ?auto_808806 ?auto_808813 ) ) ( not ( = ?auto_808806 ?auto_808814 ) ) ( not ( = ?auto_808807 ?auto_808808 ) ) ( not ( = ?auto_808807 ?auto_808809 ) ) ( not ( = ?auto_808807 ?auto_808810 ) ) ( not ( = ?auto_808807 ?auto_808811 ) ) ( not ( = ?auto_808807 ?auto_808812 ) ) ( not ( = ?auto_808807 ?auto_808813 ) ) ( not ( = ?auto_808807 ?auto_808814 ) ) ( not ( = ?auto_808808 ?auto_808809 ) ) ( not ( = ?auto_808808 ?auto_808810 ) ) ( not ( = ?auto_808808 ?auto_808811 ) ) ( not ( = ?auto_808808 ?auto_808812 ) ) ( not ( = ?auto_808808 ?auto_808813 ) ) ( not ( = ?auto_808808 ?auto_808814 ) ) ( not ( = ?auto_808809 ?auto_808810 ) ) ( not ( = ?auto_808809 ?auto_808811 ) ) ( not ( = ?auto_808809 ?auto_808812 ) ) ( not ( = ?auto_808809 ?auto_808813 ) ) ( not ( = ?auto_808809 ?auto_808814 ) ) ( not ( = ?auto_808810 ?auto_808811 ) ) ( not ( = ?auto_808810 ?auto_808812 ) ) ( not ( = ?auto_808810 ?auto_808813 ) ) ( not ( = ?auto_808810 ?auto_808814 ) ) ( not ( = ?auto_808811 ?auto_808812 ) ) ( not ( = ?auto_808811 ?auto_808813 ) ) ( not ( = ?auto_808811 ?auto_808814 ) ) ( not ( = ?auto_808812 ?auto_808813 ) ) ( not ( = ?auto_808812 ?auto_808814 ) ) ( not ( = ?auto_808813 ?auto_808814 ) ) ( CLEAR ?auto_808811 ) ( ON ?auto_808812 ?auto_808813 ) ( CLEAR ?auto_808812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_808796 ?auto_808797 ?auto_808798 ?auto_808799 ?auto_808800 ?auto_808801 ?auto_808802 ?auto_808803 ?auto_808804 ?auto_808805 ?auto_808806 ?auto_808807 ?auto_808808 ?auto_808809 ?auto_808810 ?auto_808811 ?auto_808812 )
      ( MAKE-18PILE ?auto_808796 ?auto_808797 ?auto_808798 ?auto_808799 ?auto_808800 ?auto_808801 ?auto_808802 ?auto_808803 ?auto_808804 ?auto_808805 ?auto_808806 ?auto_808807 ?auto_808808 ?auto_808809 ?auto_808810 ?auto_808811 ?auto_808812 ?auto_808813 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808833 - BLOCK
      ?auto_808834 - BLOCK
      ?auto_808835 - BLOCK
      ?auto_808836 - BLOCK
      ?auto_808837 - BLOCK
      ?auto_808838 - BLOCK
      ?auto_808839 - BLOCK
      ?auto_808840 - BLOCK
      ?auto_808841 - BLOCK
      ?auto_808842 - BLOCK
      ?auto_808843 - BLOCK
      ?auto_808844 - BLOCK
      ?auto_808845 - BLOCK
      ?auto_808846 - BLOCK
      ?auto_808847 - BLOCK
      ?auto_808848 - BLOCK
      ?auto_808849 - BLOCK
      ?auto_808850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_808850 ) ( ON-TABLE ?auto_808833 ) ( ON ?auto_808834 ?auto_808833 ) ( ON ?auto_808835 ?auto_808834 ) ( ON ?auto_808836 ?auto_808835 ) ( ON ?auto_808837 ?auto_808836 ) ( ON ?auto_808838 ?auto_808837 ) ( ON ?auto_808839 ?auto_808838 ) ( ON ?auto_808840 ?auto_808839 ) ( ON ?auto_808841 ?auto_808840 ) ( ON ?auto_808842 ?auto_808841 ) ( ON ?auto_808843 ?auto_808842 ) ( ON ?auto_808844 ?auto_808843 ) ( ON ?auto_808845 ?auto_808844 ) ( ON ?auto_808846 ?auto_808845 ) ( ON ?auto_808847 ?auto_808846 ) ( ON ?auto_808848 ?auto_808847 ) ( not ( = ?auto_808833 ?auto_808834 ) ) ( not ( = ?auto_808833 ?auto_808835 ) ) ( not ( = ?auto_808833 ?auto_808836 ) ) ( not ( = ?auto_808833 ?auto_808837 ) ) ( not ( = ?auto_808833 ?auto_808838 ) ) ( not ( = ?auto_808833 ?auto_808839 ) ) ( not ( = ?auto_808833 ?auto_808840 ) ) ( not ( = ?auto_808833 ?auto_808841 ) ) ( not ( = ?auto_808833 ?auto_808842 ) ) ( not ( = ?auto_808833 ?auto_808843 ) ) ( not ( = ?auto_808833 ?auto_808844 ) ) ( not ( = ?auto_808833 ?auto_808845 ) ) ( not ( = ?auto_808833 ?auto_808846 ) ) ( not ( = ?auto_808833 ?auto_808847 ) ) ( not ( = ?auto_808833 ?auto_808848 ) ) ( not ( = ?auto_808833 ?auto_808849 ) ) ( not ( = ?auto_808833 ?auto_808850 ) ) ( not ( = ?auto_808834 ?auto_808835 ) ) ( not ( = ?auto_808834 ?auto_808836 ) ) ( not ( = ?auto_808834 ?auto_808837 ) ) ( not ( = ?auto_808834 ?auto_808838 ) ) ( not ( = ?auto_808834 ?auto_808839 ) ) ( not ( = ?auto_808834 ?auto_808840 ) ) ( not ( = ?auto_808834 ?auto_808841 ) ) ( not ( = ?auto_808834 ?auto_808842 ) ) ( not ( = ?auto_808834 ?auto_808843 ) ) ( not ( = ?auto_808834 ?auto_808844 ) ) ( not ( = ?auto_808834 ?auto_808845 ) ) ( not ( = ?auto_808834 ?auto_808846 ) ) ( not ( = ?auto_808834 ?auto_808847 ) ) ( not ( = ?auto_808834 ?auto_808848 ) ) ( not ( = ?auto_808834 ?auto_808849 ) ) ( not ( = ?auto_808834 ?auto_808850 ) ) ( not ( = ?auto_808835 ?auto_808836 ) ) ( not ( = ?auto_808835 ?auto_808837 ) ) ( not ( = ?auto_808835 ?auto_808838 ) ) ( not ( = ?auto_808835 ?auto_808839 ) ) ( not ( = ?auto_808835 ?auto_808840 ) ) ( not ( = ?auto_808835 ?auto_808841 ) ) ( not ( = ?auto_808835 ?auto_808842 ) ) ( not ( = ?auto_808835 ?auto_808843 ) ) ( not ( = ?auto_808835 ?auto_808844 ) ) ( not ( = ?auto_808835 ?auto_808845 ) ) ( not ( = ?auto_808835 ?auto_808846 ) ) ( not ( = ?auto_808835 ?auto_808847 ) ) ( not ( = ?auto_808835 ?auto_808848 ) ) ( not ( = ?auto_808835 ?auto_808849 ) ) ( not ( = ?auto_808835 ?auto_808850 ) ) ( not ( = ?auto_808836 ?auto_808837 ) ) ( not ( = ?auto_808836 ?auto_808838 ) ) ( not ( = ?auto_808836 ?auto_808839 ) ) ( not ( = ?auto_808836 ?auto_808840 ) ) ( not ( = ?auto_808836 ?auto_808841 ) ) ( not ( = ?auto_808836 ?auto_808842 ) ) ( not ( = ?auto_808836 ?auto_808843 ) ) ( not ( = ?auto_808836 ?auto_808844 ) ) ( not ( = ?auto_808836 ?auto_808845 ) ) ( not ( = ?auto_808836 ?auto_808846 ) ) ( not ( = ?auto_808836 ?auto_808847 ) ) ( not ( = ?auto_808836 ?auto_808848 ) ) ( not ( = ?auto_808836 ?auto_808849 ) ) ( not ( = ?auto_808836 ?auto_808850 ) ) ( not ( = ?auto_808837 ?auto_808838 ) ) ( not ( = ?auto_808837 ?auto_808839 ) ) ( not ( = ?auto_808837 ?auto_808840 ) ) ( not ( = ?auto_808837 ?auto_808841 ) ) ( not ( = ?auto_808837 ?auto_808842 ) ) ( not ( = ?auto_808837 ?auto_808843 ) ) ( not ( = ?auto_808837 ?auto_808844 ) ) ( not ( = ?auto_808837 ?auto_808845 ) ) ( not ( = ?auto_808837 ?auto_808846 ) ) ( not ( = ?auto_808837 ?auto_808847 ) ) ( not ( = ?auto_808837 ?auto_808848 ) ) ( not ( = ?auto_808837 ?auto_808849 ) ) ( not ( = ?auto_808837 ?auto_808850 ) ) ( not ( = ?auto_808838 ?auto_808839 ) ) ( not ( = ?auto_808838 ?auto_808840 ) ) ( not ( = ?auto_808838 ?auto_808841 ) ) ( not ( = ?auto_808838 ?auto_808842 ) ) ( not ( = ?auto_808838 ?auto_808843 ) ) ( not ( = ?auto_808838 ?auto_808844 ) ) ( not ( = ?auto_808838 ?auto_808845 ) ) ( not ( = ?auto_808838 ?auto_808846 ) ) ( not ( = ?auto_808838 ?auto_808847 ) ) ( not ( = ?auto_808838 ?auto_808848 ) ) ( not ( = ?auto_808838 ?auto_808849 ) ) ( not ( = ?auto_808838 ?auto_808850 ) ) ( not ( = ?auto_808839 ?auto_808840 ) ) ( not ( = ?auto_808839 ?auto_808841 ) ) ( not ( = ?auto_808839 ?auto_808842 ) ) ( not ( = ?auto_808839 ?auto_808843 ) ) ( not ( = ?auto_808839 ?auto_808844 ) ) ( not ( = ?auto_808839 ?auto_808845 ) ) ( not ( = ?auto_808839 ?auto_808846 ) ) ( not ( = ?auto_808839 ?auto_808847 ) ) ( not ( = ?auto_808839 ?auto_808848 ) ) ( not ( = ?auto_808839 ?auto_808849 ) ) ( not ( = ?auto_808839 ?auto_808850 ) ) ( not ( = ?auto_808840 ?auto_808841 ) ) ( not ( = ?auto_808840 ?auto_808842 ) ) ( not ( = ?auto_808840 ?auto_808843 ) ) ( not ( = ?auto_808840 ?auto_808844 ) ) ( not ( = ?auto_808840 ?auto_808845 ) ) ( not ( = ?auto_808840 ?auto_808846 ) ) ( not ( = ?auto_808840 ?auto_808847 ) ) ( not ( = ?auto_808840 ?auto_808848 ) ) ( not ( = ?auto_808840 ?auto_808849 ) ) ( not ( = ?auto_808840 ?auto_808850 ) ) ( not ( = ?auto_808841 ?auto_808842 ) ) ( not ( = ?auto_808841 ?auto_808843 ) ) ( not ( = ?auto_808841 ?auto_808844 ) ) ( not ( = ?auto_808841 ?auto_808845 ) ) ( not ( = ?auto_808841 ?auto_808846 ) ) ( not ( = ?auto_808841 ?auto_808847 ) ) ( not ( = ?auto_808841 ?auto_808848 ) ) ( not ( = ?auto_808841 ?auto_808849 ) ) ( not ( = ?auto_808841 ?auto_808850 ) ) ( not ( = ?auto_808842 ?auto_808843 ) ) ( not ( = ?auto_808842 ?auto_808844 ) ) ( not ( = ?auto_808842 ?auto_808845 ) ) ( not ( = ?auto_808842 ?auto_808846 ) ) ( not ( = ?auto_808842 ?auto_808847 ) ) ( not ( = ?auto_808842 ?auto_808848 ) ) ( not ( = ?auto_808842 ?auto_808849 ) ) ( not ( = ?auto_808842 ?auto_808850 ) ) ( not ( = ?auto_808843 ?auto_808844 ) ) ( not ( = ?auto_808843 ?auto_808845 ) ) ( not ( = ?auto_808843 ?auto_808846 ) ) ( not ( = ?auto_808843 ?auto_808847 ) ) ( not ( = ?auto_808843 ?auto_808848 ) ) ( not ( = ?auto_808843 ?auto_808849 ) ) ( not ( = ?auto_808843 ?auto_808850 ) ) ( not ( = ?auto_808844 ?auto_808845 ) ) ( not ( = ?auto_808844 ?auto_808846 ) ) ( not ( = ?auto_808844 ?auto_808847 ) ) ( not ( = ?auto_808844 ?auto_808848 ) ) ( not ( = ?auto_808844 ?auto_808849 ) ) ( not ( = ?auto_808844 ?auto_808850 ) ) ( not ( = ?auto_808845 ?auto_808846 ) ) ( not ( = ?auto_808845 ?auto_808847 ) ) ( not ( = ?auto_808845 ?auto_808848 ) ) ( not ( = ?auto_808845 ?auto_808849 ) ) ( not ( = ?auto_808845 ?auto_808850 ) ) ( not ( = ?auto_808846 ?auto_808847 ) ) ( not ( = ?auto_808846 ?auto_808848 ) ) ( not ( = ?auto_808846 ?auto_808849 ) ) ( not ( = ?auto_808846 ?auto_808850 ) ) ( not ( = ?auto_808847 ?auto_808848 ) ) ( not ( = ?auto_808847 ?auto_808849 ) ) ( not ( = ?auto_808847 ?auto_808850 ) ) ( not ( = ?auto_808848 ?auto_808849 ) ) ( not ( = ?auto_808848 ?auto_808850 ) ) ( not ( = ?auto_808849 ?auto_808850 ) ) ( CLEAR ?auto_808848 ) ( ON ?auto_808849 ?auto_808850 ) ( CLEAR ?auto_808849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_808833 ?auto_808834 ?auto_808835 ?auto_808836 ?auto_808837 ?auto_808838 ?auto_808839 ?auto_808840 ?auto_808841 ?auto_808842 ?auto_808843 ?auto_808844 ?auto_808845 ?auto_808846 ?auto_808847 ?auto_808848 ?auto_808849 )
      ( MAKE-18PILE ?auto_808833 ?auto_808834 ?auto_808835 ?auto_808836 ?auto_808837 ?auto_808838 ?auto_808839 ?auto_808840 ?auto_808841 ?auto_808842 ?auto_808843 ?auto_808844 ?auto_808845 ?auto_808846 ?auto_808847 ?auto_808848 ?auto_808849 ?auto_808850 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808869 - BLOCK
      ?auto_808870 - BLOCK
      ?auto_808871 - BLOCK
      ?auto_808872 - BLOCK
      ?auto_808873 - BLOCK
      ?auto_808874 - BLOCK
      ?auto_808875 - BLOCK
      ?auto_808876 - BLOCK
      ?auto_808877 - BLOCK
      ?auto_808878 - BLOCK
      ?auto_808879 - BLOCK
      ?auto_808880 - BLOCK
      ?auto_808881 - BLOCK
      ?auto_808882 - BLOCK
      ?auto_808883 - BLOCK
      ?auto_808884 - BLOCK
      ?auto_808885 - BLOCK
      ?auto_808886 - BLOCK
    )
    :vars
    (
      ?auto_808887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808886 ?auto_808887 ) ( ON-TABLE ?auto_808869 ) ( ON ?auto_808870 ?auto_808869 ) ( ON ?auto_808871 ?auto_808870 ) ( ON ?auto_808872 ?auto_808871 ) ( ON ?auto_808873 ?auto_808872 ) ( ON ?auto_808874 ?auto_808873 ) ( ON ?auto_808875 ?auto_808874 ) ( ON ?auto_808876 ?auto_808875 ) ( ON ?auto_808877 ?auto_808876 ) ( ON ?auto_808878 ?auto_808877 ) ( ON ?auto_808879 ?auto_808878 ) ( ON ?auto_808880 ?auto_808879 ) ( ON ?auto_808881 ?auto_808880 ) ( ON ?auto_808882 ?auto_808881 ) ( ON ?auto_808883 ?auto_808882 ) ( not ( = ?auto_808869 ?auto_808870 ) ) ( not ( = ?auto_808869 ?auto_808871 ) ) ( not ( = ?auto_808869 ?auto_808872 ) ) ( not ( = ?auto_808869 ?auto_808873 ) ) ( not ( = ?auto_808869 ?auto_808874 ) ) ( not ( = ?auto_808869 ?auto_808875 ) ) ( not ( = ?auto_808869 ?auto_808876 ) ) ( not ( = ?auto_808869 ?auto_808877 ) ) ( not ( = ?auto_808869 ?auto_808878 ) ) ( not ( = ?auto_808869 ?auto_808879 ) ) ( not ( = ?auto_808869 ?auto_808880 ) ) ( not ( = ?auto_808869 ?auto_808881 ) ) ( not ( = ?auto_808869 ?auto_808882 ) ) ( not ( = ?auto_808869 ?auto_808883 ) ) ( not ( = ?auto_808869 ?auto_808884 ) ) ( not ( = ?auto_808869 ?auto_808885 ) ) ( not ( = ?auto_808869 ?auto_808886 ) ) ( not ( = ?auto_808869 ?auto_808887 ) ) ( not ( = ?auto_808870 ?auto_808871 ) ) ( not ( = ?auto_808870 ?auto_808872 ) ) ( not ( = ?auto_808870 ?auto_808873 ) ) ( not ( = ?auto_808870 ?auto_808874 ) ) ( not ( = ?auto_808870 ?auto_808875 ) ) ( not ( = ?auto_808870 ?auto_808876 ) ) ( not ( = ?auto_808870 ?auto_808877 ) ) ( not ( = ?auto_808870 ?auto_808878 ) ) ( not ( = ?auto_808870 ?auto_808879 ) ) ( not ( = ?auto_808870 ?auto_808880 ) ) ( not ( = ?auto_808870 ?auto_808881 ) ) ( not ( = ?auto_808870 ?auto_808882 ) ) ( not ( = ?auto_808870 ?auto_808883 ) ) ( not ( = ?auto_808870 ?auto_808884 ) ) ( not ( = ?auto_808870 ?auto_808885 ) ) ( not ( = ?auto_808870 ?auto_808886 ) ) ( not ( = ?auto_808870 ?auto_808887 ) ) ( not ( = ?auto_808871 ?auto_808872 ) ) ( not ( = ?auto_808871 ?auto_808873 ) ) ( not ( = ?auto_808871 ?auto_808874 ) ) ( not ( = ?auto_808871 ?auto_808875 ) ) ( not ( = ?auto_808871 ?auto_808876 ) ) ( not ( = ?auto_808871 ?auto_808877 ) ) ( not ( = ?auto_808871 ?auto_808878 ) ) ( not ( = ?auto_808871 ?auto_808879 ) ) ( not ( = ?auto_808871 ?auto_808880 ) ) ( not ( = ?auto_808871 ?auto_808881 ) ) ( not ( = ?auto_808871 ?auto_808882 ) ) ( not ( = ?auto_808871 ?auto_808883 ) ) ( not ( = ?auto_808871 ?auto_808884 ) ) ( not ( = ?auto_808871 ?auto_808885 ) ) ( not ( = ?auto_808871 ?auto_808886 ) ) ( not ( = ?auto_808871 ?auto_808887 ) ) ( not ( = ?auto_808872 ?auto_808873 ) ) ( not ( = ?auto_808872 ?auto_808874 ) ) ( not ( = ?auto_808872 ?auto_808875 ) ) ( not ( = ?auto_808872 ?auto_808876 ) ) ( not ( = ?auto_808872 ?auto_808877 ) ) ( not ( = ?auto_808872 ?auto_808878 ) ) ( not ( = ?auto_808872 ?auto_808879 ) ) ( not ( = ?auto_808872 ?auto_808880 ) ) ( not ( = ?auto_808872 ?auto_808881 ) ) ( not ( = ?auto_808872 ?auto_808882 ) ) ( not ( = ?auto_808872 ?auto_808883 ) ) ( not ( = ?auto_808872 ?auto_808884 ) ) ( not ( = ?auto_808872 ?auto_808885 ) ) ( not ( = ?auto_808872 ?auto_808886 ) ) ( not ( = ?auto_808872 ?auto_808887 ) ) ( not ( = ?auto_808873 ?auto_808874 ) ) ( not ( = ?auto_808873 ?auto_808875 ) ) ( not ( = ?auto_808873 ?auto_808876 ) ) ( not ( = ?auto_808873 ?auto_808877 ) ) ( not ( = ?auto_808873 ?auto_808878 ) ) ( not ( = ?auto_808873 ?auto_808879 ) ) ( not ( = ?auto_808873 ?auto_808880 ) ) ( not ( = ?auto_808873 ?auto_808881 ) ) ( not ( = ?auto_808873 ?auto_808882 ) ) ( not ( = ?auto_808873 ?auto_808883 ) ) ( not ( = ?auto_808873 ?auto_808884 ) ) ( not ( = ?auto_808873 ?auto_808885 ) ) ( not ( = ?auto_808873 ?auto_808886 ) ) ( not ( = ?auto_808873 ?auto_808887 ) ) ( not ( = ?auto_808874 ?auto_808875 ) ) ( not ( = ?auto_808874 ?auto_808876 ) ) ( not ( = ?auto_808874 ?auto_808877 ) ) ( not ( = ?auto_808874 ?auto_808878 ) ) ( not ( = ?auto_808874 ?auto_808879 ) ) ( not ( = ?auto_808874 ?auto_808880 ) ) ( not ( = ?auto_808874 ?auto_808881 ) ) ( not ( = ?auto_808874 ?auto_808882 ) ) ( not ( = ?auto_808874 ?auto_808883 ) ) ( not ( = ?auto_808874 ?auto_808884 ) ) ( not ( = ?auto_808874 ?auto_808885 ) ) ( not ( = ?auto_808874 ?auto_808886 ) ) ( not ( = ?auto_808874 ?auto_808887 ) ) ( not ( = ?auto_808875 ?auto_808876 ) ) ( not ( = ?auto_808875 ?auto_808877 ) ) ( not ( = ?auto_808875 ?auto_808878 ) ) ( not ( = ?auto_808875 ?auto_808879 ) ) ( not ( = ?auto_808875 ?auto_808880 ) ) ( not ( = ?auto_808875 ?auto_808881 ) ) ( not ( = ?auto_808875 ?auto_808882 ) ) ( not ( = ?auto_808875 ?auto_808883 ) ) ( not ( = ?auto_808875 ?auto_808884 ) ) ( not ( = ?auto_808875 ?auto_808885 ) ) ( not ( = ?auto_808875 ?auto_808886 ) ) ( not ( = ?auto_808875 ?auto_808887 ) ) ( not ( = ?auto_808876 ?auto_808877 ) ) ( not ( = ?auto_808876 ?auto_808878 ) ) ( not ( = ?auto_808876 ?auto_808879 ) ) ( not ( = ?auto_808876 ?auto_808880 ) ) ( not ( = ?auto_808876 ?auto_808881 ) ) ( not ( = ?auto_808876 ?auto_808882 ) ) ( not ( = ?auto_808876 ?auto_808883 ) ) ( not ( = ?auto_808876 ?auto_808884 ) ) ( not ( = ?auto_808876 ?auto_808885 ) ) ( not ( = ?auto_808876 ?auto_808886 ) ) ( not ( = ?auto_808876 ?auto_808887 ) ) ( not ( = ?auto_808877 ?auto_808878 ) ) ( not ( = ?auto_808877 ?auto_808879 ) ) ( not ( = ?auto_808877 ?auto_808880 ) ) ( not ( = ?auto_808877 ?auto_808881 ) ) ( not ( = ?auto_808877 ?auto_808882 ) ) ( not ( = ?auto_808877 ?auto_808883 ) ) ( not ( = ?auto_808877 ?auto_808884 ) ) ( not ( = ?auto_808877 ?auto_808885 ) ) ( not ( = ?auto_808877 ?auto_808886 ) ) ( not ( = ?auto_808877 ?auto_808887 ) ) ( not ( = ?auto_808878 ?auto_808879 ) ) ( not ( = ?auto_808878 ?auto_808880 ) ) ( not ( = ?auto_808878 ?auto_808881 ) ) ( not ( = ?auto_808878 ?auto_808882 ) ) ( not ( = ?auto_808878 ?auto_808883 ) ) ( not ( = ?auto_808878 ?auto_808884 ) ) ( not ( = ?auto_808878 ?auto_808885 ) ) ( not ( = ?auto_808878 ?auto_808886 ) ) ( not ( = ?auto_808878 ?auto_808887 ) ) ( not ( = ?auto_808879 ?auto_808880 ) ) ( not ( = ?auto_808879 ?auto_808881 ) ) ( not ( = ?auto_808879 ?auto_808882 ) ) ( not ( = ?auto_808879 ?auto_808883 ) ) ( not ( = ?auto_808879 ?auto_808884 ) ) ( not ( = ?auto_808879 ?auto_808885 ) ) ( not ( = ?auto_808879 ?auto_808886 ) ) ( not ( = ?auto_808879 ?auto_808887 ) ) ( not ( = ?auto_808880 ?auto_808881 ) ) ( not ( = ?auto_808880 ?auto_808882 ) ) ( not ( = ?auto_808880 ?auto_808883 ) ) ( not ( = ?auto_808880 ?auto_808884 ) ) ( not ( = ?auto_808880 ?auto_808885 ) ) ( not ( = ?auto_808880 ?auto_808886 ) ) ( not ( = ?auto_808880 ?auto_808887 ) ) ( not ( = ?auto_808881 ?auto_808882 ) ) ( not ( = ?auto_808881 ?auto_808883 ) ) ( not ( = ?auto_808881 ?auto_808884 ) ) ( not ( = ?auto_808881 ?auto_808885 ) ) ( not ( = ?auto_808881 ?auto_808886 ) ) ( not ( = ?auto_808881 ?auto_808887 ) ) ( not ( = ?auto_808882 ?auto_808883 ) ) ( not ( = ?auto_808882 ?auto_808884 ) ) ( not ( = ?auto_808882 ?auto_808885 ) ) ( not ( = ?auto_808882 ?auto_808886 ) ) ( not ( = ?auto_808882 ?auto_808887 ) ) ( not ( = ?auto_808883 ?auto_808884 ) ) ( not ( = ?auto_808883 ?auto_808885 ) ) ( not ( = ?auto_808883 ?auto_808886 ) ) ( not ( = ?auto_808883 ?auto_808887 ) ) ( not ( = ?auto_808884 ?auto_808885 ) ) ( not ( = ?auto_808884 ?auto_808886 ) ) ( not ( = ?auto_808884 ?auto_808887 ) ) ( not ( = ?auto_808885 ?auto_808886 ) ) ( not ( = ?auto_808885 ?auto_808887 ) ) ( not ( = ?auto_808886 ?auto_808887 ) ) ( ON ?auto_808885 ?auto_808886 ) ( CLEAR ?auto_808883 ) ( ON ?auto_808884 ?auto_808885 ) ( CLEAR ?auto_808884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_808869 ?auto_808870 ?auto_808871 ?auto_808872 ?auto_808873 ?auto_808874 ?auto_808875 ?auto_808876 ?auto_808877 ?auto_808878 ?auto_808879 ?auto_808880 ?auto_808881 ?auto_808882 ?auto_808883 ?auto_808884 )
      ( MAKE-18PILE ?auto_808869 ?auto_808870 ?auto_808871 ?auto_808872 ?auto_808873 ?auto_808874 ?auto_808875 ?auto_808876 ?auto_808877 ?auto_808878 ?auto_808879 ?auto_808880 ?auto_808881 ?auto_808882 ?auto_808883 ?auto_808884 ?auto_808885 ?auto_808886 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808906 - BLOCK
      ?auto_808907 - BLOCK
      ?auto_808908 - BLOCK
      ?auto_808909 - BLOCK
      ?auto_808910 - BLOCK
      ?auto_808911 - BLOCK
      ?auto_808912 - BLOCK
      ?auto_808913 - BLOCK
      ?auto_808914 - BLOCK
      ?auto_808915 - BLOCK
      ?auto_808916 - BLOCK
      ?auto_808917 - BLOCK
      ?auto_808918 - BLOCK
      ?auto_808919 - BLOCK
      ?auto_808920 - BLOCK
      ?auto_808921 - BLOCK
      ?auto_808922 - BLOCK
      ?auto_808923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_808923 ) ( ON-TABLE ?auto_808906 ) ( ON ?auto_808907 ?auto_808906 ) ( ON ?auto_808908 ?auto_808907 ) ( ON ?auto_808909 ?auto_808908 ) ( ON ?auto_808910 ?auto_808909 ) ( ON ?auto_808911 ?auto_808910 ) ( ON ?auto_808912 ?auto_808911 ) ( ON ?auto_808913 ?auto_808912 ) ( ON ?auto_808914 ?auto_808913 ) ( ON ?auto_808915 ?auto_808914 ) ( ON ?auto_808916 ?auto_808915 ) ( ON ?auto_808917 ?auto_808916 ) ( ON ?auto_808918 ?auto_808917 ) ( ON ?auto_808919 ?auto_808918 ) ( ON ?auto_808920 ?auto_808919 ) ( not ( = ?auto_808906 ?auto_808907 ) ) ( not ( = ?auto_808906 ?auto_808908 ) ) ( not ( = ?auto_808906 ?auto_808909 ) ) ( not ( = ?auto_808906 ?auto_808910 ) ) ( not ( = ?auto_808906 ?auto_808911 ) ) ( not ( = ?auto_808906 ?auto_808912 ) ) ( not ( = ?auto_808906 ?auto_808913 ) ) ( not ( = ?auto_808906 ?auto_808914 ) ) ( not ( = ?auto_808906 ?auto_808915 ) ) ( not ( = ?auto_808906 ?auto_808916 ) ) ( not ( = ?auto_808906 ?auto_808917 ) ) ( not ( = ?auto_808906 ?auto_808918 ) ) ( not ( = ?auto_808906 ?auto_808919 ) ) ( not ( = ?auto_808906 ?auto_808920 ) ) ( not ( = ?auto_808906 ?auto_808921 ) ) ( not ( = ?auto_808906 ?auto_808922 ) ) ( not ( = ?auto_808906 ?auto_808923 ) ) ( not ( = ?auto_808907 ?auto_808908 ) ) ( not ( = ?auto_808907 ?auto_808909 ) ) ( not ( = ?auto_808907 ?auto_808910 ) ) ( not ( = ?auto_808907 ?auto_808911 ) ) ( not ( = ?auto_808907 ?auto_808912 ) ) ( not ( = ?auto_808907 ?auto_808913 ) ) ( not ( = ?auto_808907 ?auto_808914 ) ) ( not ( = ?auto_808907 ?auto_808915 ) ) ( not ( = ?auto_808907 ?auto_808916 ) ) ( not ( = ?auto_808907 ?auto_808917 ) ) ( not ( = ?auto_808907 ?auto_808918 ) ) ( not ( = ?auto_808907 ?auto_808919 ) ) ( not ( = ?auto_808907 ?auto_808920 ) ) ( not ( = ?auto_808907 ?auto_808921 ) ) ( not ( = ?auto_808907 ?auto_808922 ) ) ( not ( = ?auto_808907 ?auto_808923 ) ) ( not ( = ?auto_808908 ?auto_808909 ) ) ( not ( = ?auto_808908 ?auto_808910 ) ) ( not ( = ?auto_808908 ?auto_808911 ) ) ( not ( = ?auto_808908 ?auto_808912 ) ) ( not ( = ?auto_808908 ?auto_808913 ) ) ( not ( = ?auto_808908 ?auto_808914 ) ) ( not ( = ?auto_808908 ?auto_808915 ) ) ( not ( = ?auto_808908 ?auto_808916 ) ) ( not ( = ?auto_808908 ?auto_808917 ) ) ( not ( = ?auto_808908 ?auto_808918 ) ) ( not ( = ?auto_808908 ?auto_808919 ) ) ( not ( = ?auto_808908 ?auto_808920 ) ) ( not ( = ?auto_808908 ?auto_808921 ) ) ( not ( = ?auto_808908 ?auto_808922 ) ) ( not ( = ?auto_808908 ?auto_808923 ) ) ( not ( = ?auto_808909 ?auto_808910 ) ) ( not ( = ?auto_808909 ?auto_808911 ) ) ( not ( = ?auto_808909 ?auto_808912 ) ) ( not ( = ?auto_808909 ?auto_808913 ) ) ( not ( = ?auto_808909 ?auto_808914 ) ) ( not ( = ?auto_808909 ?auto_808915 ) ) ( not ( = ?auto_808909 ?auto_808916 ) ) ( not ( = ?auto_808909 ?auto_808917 ) ) ( not ( = ?auto_808909 ?auto_808918 ) ) ( not ( = ?auto_808909 ?auto_808919 ) ) ( not ( = ?auto_808909 ?auto_808920 ) ) ( not ( = ?auto_808909 ?auto_808921 ) ) ( not ( = ?auto_808909 ?auto_808922 ) ) ( not ( = ?auto_808909 ?auto_808923 ) ) ( not ( = ?auto_808910 ?auto_808911 ) ) ( not ( = ?auto_808910 ?auto_808912 ) ) ( not ( = ?auto_808910 ?auto_808913 ) ) ( not ( = ?auto_808910 ?auto_808914 ) ) ( not ( = ?auto_808910 ?auto_808915 ) ) ( not ( = ?auto_808910 ?auto_808916 ) ) ( not ( = ?auto_808910 ?auto_808917 ) ) ( not ( = ?auto_808910 ?auto_808918 ) ) ( not ( = ?auto_808910 ?auto_808919 ) ) ( not ( = ?auto_808910 ?auto_808920 ) ) ( not ( = ?auto_808910 ?auto_808921 ) ) ( not ( = ?auto_808910 ?auto_808922 ) ) ( not ( = ?auto_808910 ?auto_808923 ) ) ( not ( = ?auto_808911 ?auto_808912 ) ) ( not ( = ?auto_808911 ?auto_808913 ) ) ( not ( = ?auto_808911 ?auto_808914 ) ) ( not ( = ?auto_808911 ?auto_808915 ) ) ( not ( = ?auto_808911 ?auto_808916 ) ) ( not ( = ?auto_808911 ?auto_808917 ) ) ( not ( = ?auto_808911 ?auto_808918 ) ) ( not ( = ?auto_808911 ?auto_808919 ) ) ( not ( = ?auto_808911 ?auto_808920 ) ) ( not ( = ?auto_808911 ?auto_808921 ) ) ( not ( = ?auto_808911 ?auto_808922 ) ) ( not ( = ?auto_808911 ?auto_808923 ) ) ( not ( = ?auto_808912 ?auto_808913 ) ) ( not ( = ?auto_808912 ?auto_808914 ) ) ( not ( = ?auto_808912 ?auto_808915 ) ) ( not ( = ?auto_808912 ?auto_808916 ) ) ( not ( = ?auto_808912 ?auto_808917 ) ) ( not ( = ?auto_808912 ?auto_808918 ) ) ( not ( = ?auto_808912 ?auto_808919 ) ) ( not ( = ?auto_808912 ?auto_808920 ) ) ( not ( = ?auto_808912 ?auto_808921 ) ) ( not ( = ?auto_808912 ?auto_808922 ) ) ( not ( = ?auto_808912 ?auto_808923 ) ) ( not ( = ?auto_808913 ?auto_808914 ) ) ( not ( = ?auto_808913 ?auto_808915 ) ) ( not ( = ?auto_808913 ?auto_808916 ) ) ( not ( = ?auto_808913 ?auto_808917 ) ) ( not ( = ?auto_808913 ?auto_808918 ) ) ( not ( = ?auto_808913 ?auto_808919 ) ) ( not ( = ?auto_808913 ?auto_808920 ) ) ( not ( = ?auto_808913 ?auto_808921 ) ) ( not ( = ?auto_808913 ?auto_808922 ) ) ( not ( = ?auto_808913 ?auto_808923 ) ) ( not ( = ?auto_808914 ?auto_808915 ) ) ( not ( = ?auto_808914 ?auto_808916 ) ) ( not ( = ?auto_808914 ?auto_808917 ) ) ( not ( = ?auto_808914 ?auto_808918 ) ) ( not ( = ?auto_808914 ?auto_808919 ) ) ( not ( = ?auto_808914 ?auto_808920 ) ) ( not ( = ?auto_808914 ?auto_808921 ) ) ( not ( = ?auto_808914 ?auto_808922 ) ) ( not ( = ?auto_808914 ?auto_808923 ) ) ( not ( = ?auto_808915 ?auto_808916 ) ) ( not ( = ?auto_808915 ?auto_808917 ) ) ( not ( = ?auto_808915 ?auto_808918 ) ) ( not ( = ?auto_808915 ?auto_808919 ) ) ( not ( = ?auto_808915 ?auto_808920 ) ) ( not ( = ?auto_808915 ?auto_808921 ) ) ( not ( = ?auto_808915 ?auto_808922 ) ) ( not ( = ?auto_808915 ?auto_808923 ) ) ( not ( = ?auto_808916 ?auto_808917 ) ) ( not ( = ?auto_808916 ?auto_808918 ) ) ( not ( = ?auto_808916 ?auto_808919 ) ) ( not ( = ?auto_808916 ?auto_808920 ) ) ( not ( = ?auto_808916 ?auto_808921 ) ) ( not ( = ?auto_808916 ?auto_808922 ) ) ( not ( = ?auto_808916 ?auto_808923 ) ) ( not ( = ?auto_808917 ?auto_808918 ) ) ( not ( = ?auto_808917 ?auto_808919 ) ) ( not ( = ?auto_808917 ?auto_808920 ) ) ( not ( = ?auto_808917 ?auto_808921 ) ) ( not ( = ?auto_808917 ?auto_808922 ) ) ( not ( = ?auto_808917 ?auto_808923 ) ) ( not ( = ?auto_808918 ?auto_808919 ) ) ( not ( = ?auto_808918 ?auto_808920 ) ) ( not ( = ?auto_808918 ?auto_808921 ) ) ( not ( = ?auto_808918 ?auto_808922 ) ) ( not ( = ?auto_808918 ?auto_808923 ) ) ( not ( = ?auto_808919 ?auto_808920 ) ) ( not ( = ?auto_808919 ?auto_808921 ) ) ( not ( = ?auto_808919 ?auto_808922 ) ) ( not ( = ?auto_808919 ?auto_808923 ) ) ( not ( = ?auto_808920 ?auto_808921 ) ) ( not ( = ?auto_808920 ?auto_808922 ) ) ( not ( = ?auto_808920 ?auto_808923 ) ) ( not ( = ?auto_808921 ?auto_808922 ) ) ( not ( = ?auto_808921 ?auto_808923 ) ) ( not ( = ?auto_808922 ?auto_808923 ) ) ( ON ?auto_808922 ?auto_808923 ) ( CLEAR ?auto_808920 ) ( ON ?auto_808921 ?auto_808922 ) ( CLEAR ?auto_808921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_808906 ?auto_808907 ?auto_808908 ?auto_808909 ?auto_808910 ?auto_808911 ?auto_808912 ?auto_808913 ?auto_808914 ?auto_808915 ?auto_808916 ?auto_808917 ?auto_808918 ?auto_808919 ?auto_808920 ?auto_808921 )
      ( MAKE-18PILE ?auto_808906 ?auto_808907 ?auto_808908 ?auto_808909 ?auto_808910 ?auto_808911 ?auto_808912 ?auto_808913 ?auto_808914 ?auto_808915 ?auto_808916 ?auto_808917 ?auto_808918 ?auto_808919 ?auto_808920 ?auto_808921 ?auto_808922 ?auto_808923 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808942 - BLOCK
      ?auto_808943 - BLOCK
      ?auto_808944 - BLOCK
      ?auto_808945 - BLOCK
      ?auto_808946 - BLOCK
      ?auto_808947 - BLOCK
      ?auto_808948 - BLOCK
      ?auto_808949 - BLOCK
      ?auto_808950 - BLOCK
      ?auto_808951 - BLOCK
      ?auto_808952 - BLOCK
      ?auto_808953 - BLOCK
      ?auto_808954 - BLOCK
      ?auto_808955 - BLOCK
      ?auto_808956 - BLOCK
      ?auto_808957 - BLOCK
      ?auto_808958 - BLOCK
      ?auto_808959 - BLOCK
    )
    :vars
    (
      ?auto_808960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_808959 ?auto_808960 ) ( ON-TABLE ?auto_808942 ) ( ON ?auto_808943 ?auto_808942 ) ( ON ?auto_808944 ?auto_808943 ) ( ON ?auto_808945 ?auto_808944 ) ( ON ?auto_808946 ?auto_808945 ) ( ON ?auto_808947 ?auto_808946 ) ( ON ?auto_808948 ?auto_808947 ) ( ON ?auto_808949 ?auto_808948 ) ( ON ?auto_808950 ?auto_808949 ) ( ON ?auto_808951 ?auto_808950 ) ( ON ?auto_808952 ?auto_808951 ) ( ON ?auto_808953 ?auto_808952 ) ( ON ?auto_808954 ?auto_808953 ) ( ON ?auto_808955 ?auto_808954 ) ( not ( = ?auto_808942 ?auto_808943 ) ) ( not ( = ?auto_808942 ?auto_808944 ) ) ( not ( = ?auto_808942 ?auto_808945 ) ) ( not ( = ?auto_808942 ?auto_808946 ) ) ( not ( = ?auto_808942 ?auto_808947 ) ) ( not ( = ?auto_808942 ?auto_808948 ) ) ( not ( = ?auto_808942 ?auto_808949 ) ) ( not ( = ?auto_808942 ?auto_808950 ) ) ( not ( = ?auto_808942 ?auto_808951 ) ) ( not ( = ?auto_808942 ?auto_808952 ) ) ( not ( = ?auto_808942 ?auto_808953 ) ) ( not ( = ?auto_808942 ?auto_808954 ) ) ( not ( = ?auto_808942 ?auto_808955 ) ) ( not ( = ?auto_808942 ?auto_808956 ) ) ( not ( = ?auto_808942 ?auto_808957 ) ) ( not ( = ?auto_808942 ?auto_808958 ) ) ( not ( = ?auto_808942 ?auto_808959 ) ) ( not ( = ?auto_808942 ?auto_808960 ) ) ( not ( = ?auto_808943 ?auto_808944 ) ) ( not ( = ?auto_808943 ?auto_808945 ) ) ( not ( = ?auto_808943 ?auto_808946 ) ) ( not ( = ?auto_808943 ?auto_808947 ) ) ( not ( = ?auto_808943 ?auto_808948 ) ) ( not ( = ?auto_808943 ?auto_808949 ) ) ( not ( = ?auto_808943 ?auto_808950 ) ) ( not ( = ?auto_808943 ?auto_808951 ) ) ( not ( = ?auto_808943 ?auto_808952 ) ) ( not ( = ?auto_808943 ?auto_808953 ) ) ( not ( = ?auto_808943 ?auto_808954 ) ) ( not ( = ?auto_808943 ?auto_808955 ) ) ( not ( = ?auto_808943 ?auto_808956 ) ) ( not ( = ?auto_808943 ?auto_808957 ) ) ( not ( = ?auto_808943 ?auto_808958 ) ) ( not ( = ?auto_808943 ?auto_808959 ) ) ( not ( = ?auto_808943 ?auto_808960 ) ) ( not ( = ?auto_808944 ?auto_808945 ) ) ( not ( = ?auto_808944 ?auto_808946 ) ) ( not ( = ?auto_808944 ?auto_808947 ) ) ( not ( = ?auto_808944 ?auto_808948 ) ) ( not ( = ?auto_808944 ?auto_808949 ) ) ( not ( = ?auto_808944 ?auto_808950 ) ) ( not ( = ?auto_808944 ?auto_808951 ) ) ( not ( = ?auto_808944 ?auto_808952 ) ) ( not ( = ?auto_808944 ?auto_808953 ) ) ( not ( = ?auto_808944 ?auto_808954 ) ) ( not ( = ?auto_808944 ?auto_808955 ) ) ( not ( = ?auto_808944 ?auto_808956 ) ) ( not ( = ?auto_808944 ?auto_808957 ) ) ( not ( = ?auto_808944 ?auto_808958 ) ) ( not ( = ?auto_808944 ?auto_808959 ) ) ( not ( = ?auto_808944 ?auto_808960 ) ) ( not ( = ?auto_808945 ?auto_808946 ) ) ( not ( = ?auto_808945 ?auto_808947 ) ) ( not ( = ?auto_808945 ?auto_808948 ) ) ( not ( = ?auto_808945 ?auto_808949 ) ) ( not ( = ?auto_808945 ?auto_808950 ) ) ( not ( = ?auto_808945 ?auto_808951 ) ) ( not ( = ?auto_808945 ?auto_808952 ) ) ( not ( = ?auto_808945 ?auto_808953 ) ) ( not ( = ?auto_808945 ?auto_808954 ) ) ( not ( = ?auto_808945 ?auto_808955 ) ) ( not ( = ?auto_808945 ?auto_808956 ) ) ( not ( = ?auto_808945 ?auto_808957 ) ) ( not ( = ?auto_808945 ?auto_808958 ) ) ( not ( = ?auto_808945 ?auto_808959 ) ) ( not ( = ?auto_808945 ?auto_808960 ) ) ( not ( = ?auto_808946 ?auto_808947 ) ) ( not ( = ?auto_808946 ?auto_808948 ) ) ( not ( = ?auto_808946 ?auto_808949 ) ) ( not ( = ?auto_808946 ?auto_808950 ) ) ( not ( = ?auto_808946 ?auto_808951 ) ) ( not ( = ?auto_808946 ?auto_808952 ) ) ( not ( = ?auto_808946 ?auto_808953 ) ) ( not ( = ?auto_808946 ?auto_808954 ) ) ( not ( = ?auto_808946 ?auto_808955 ) ) ( not ( = ?auto_808946 ?auto_808956 ) ) ( not ( = ?auto_808946 ?auto_808957 ) ) ( not ( = ?auto_808946 ?auto_808958 ) ) ( not ( = ?auto_808946 ?auto_808959 ) ) ( not ( = ?auto_808946 ?auto_808960 ) ) ( not ( = ?auto_808947 ?auto_808948 ) ) ( not ( = ?auto_808947 ?auto_808949 ) ) ( not ( = ?auto_808947 ?auto_808950 ) ) ( not ( = ?auto_808947 ?auto_808951 ) ) ( not ( = ?auto_808947 ?auto_808952 ) ) ( not ( = ?auto_808947 ?auto_808953 ) ) ( not ( = ?auto_808947 ?auto_808954 ) ) ( not ( = ?auto_808947 ?auto_808955 ) ) ( not ( = ?auto_808947 ?auto_808956 ) ) ( not ( = ?auto_808947 ?auto_808957 ) ) ( not ( = ?auto_808947 ?auto_808958 ) ) ( not ( = ?auto_808947 ?auto_808959 ) ) ( not ( = ?auto_808947 ?auto_808960 ) ) ( not ( = ?auto_808948 ?auto_808949 ) ) ( not ( = ?auto_808948 ?auto_808950 ) ) ( not ( = ?auto_808948 ?auto_808951 ) ) ( not ( = ?auto_808948 ?auto_808952 ) ) ( not ( = ?auto_808948 ?auto_808953 ) ) ( not ( = ?auto_808948 ?auto_808954 ) ) ( not ( = ?auto_808948 ?auto_808955 ) ) ( not ( = ?auto_808948 ?auto_808956 ) ) ( not ( = ?auto_808948 ?auto_808957 ) ) ( not ( = ?auto_808948 ?auto_808958 ) ) ( not ( = ?auto_808948 ?auto_808959 ) ) ( not ( = ?auto_808948 ?auto_808960 ) ) ( not ( = ?auto_808949 ?auto_808950 ) ) ( not ( = ?auto_808949 ?auto_808951 ) ) ( not ( = ?auto_808949 ?auto_808952 ) ) ( not ( = ?auto_808949 ?auto_808953 ) ) ( not ( = ?auto_808949 ?auto_808954 ) ) ( not ( = ?auto_808949 ?auto_808955 ) ) ( not ( = ?auto_808949 ?auto_808956 ) ) ( not ( = ?auto_808949 ?auto_808957 ) ) ( not ( = ?auto_808949 ?auto_808958 ) ) ( not ( = ?auto_808949 ?auto_808959 ) ) ( not ( = ?auto_808949 ?auto_808960 ) ) ( not ( = ?auto_808950 ?auto_808951 ) ) ( not ( = ?auto_808950 ?auto_808952 ) ) ( not ( = ?auto_808950 ?auto_808953 ) ) ( not ( = ?auto_808950 ?auto_808954 ) ) ( not ( = ?auto_808950 ?auto_808955 ) ) ( not ( = ?auto_808950 ?auto_808956 ) ) ( not ( = ?auto_808950 ?auto_808957 ) ) ( not ( = ?auto_808950 ?auto_808958 ) ) ( not ( = ?auto_808950 ?auto_808959 ) ) ( not ( = ?auto_808950 ?auto_808960 ) ) ( not ( = ?auto_808951 ?auto_808952 ) ) ( not ( = ?auto_808951 ?auto_808953 ) ) ( not ( = ?auto_808951 ?auto_808954 ) ) ( not ( = ?auto_808951 ?auto_808955 ) ) ( not ( = ?auto_808951 ?auto_808956 ) ) ( not ( = ?auto_808951 ?auto_808957 ) ) ( not ( = ?auto_808951 ?auto_808958 ) ) ( not ( = ?auto_808951 ?auto_808959 ) ) ( not ( = ?auto_808951 ?auto_808960 ) ) ( not ( = ?auto_808952 ?auto_808953 ) ) ( not ( = ?auto_808952 ?auto_808954 ) ) ( not ( = ?auto_808952 ?auto_808955 ) ) ( not ( = ?auto_808952 ?auto_808956 ) ) ( not ( = ?auto_808952 ?auto_808957 ) ) ( not ( = ?auto_808952 ?auto_808958 ) ) ( not ( = ?auto_808952 ?auto_808959 ) ) ( not ( = ?auto_808952 ?auto_808960 ) ) ( not ( = ?auto_808953 ?auto_808954 ) ) ( not ( = ?auto_808953 ?auto_808955 ) ) ( not ( = ?auto_808953 ?auto_808956 ) ) ( not ( = ?auto_808953 ?auto_808957 ) ) ( not ( = ?auto_808953 ?auto_808958 ) ) ( not ( = ?auto_808953 ?auto_808959 ) ) ( not ( = ?auto_808953 ?auto_808960 ) ) ( not ( = ?auto_808954 ?auto_808955 ) ) ( not ( = ?auto_808954 ?auto_808956 ) ) ( not ( = ?auto_808954 ?auto_808957 ) ) ( not ( = ?auto_808954 ?auto_808958 ) ) ( not ( = ?auto_808954 ?auto_808959 ) ) ( not ( = ?auto_808954 ?auto_808960 ) ) ( not ( = ?auto_808955 ?auto_808956 ) ) ( not ( = ?auto_808955 ?auto_808957 ) ) ( not ( = ?auto_808955 ?auto_808958 ) ) ( not ( = ?auto_808955 ?auto_808959 ) ) ( not ( = ?auto_808955 ?auto_808960 ) ) ( not ( = ?auto_808956 ?auto_808957 ) ) ( not ( = ?auto_808956 ?auto_808958 ) ) ( not ( = ?auto_808956 ?auto_808959 ) ) ( not ( = ?auto_808956 ?auto_808960 ) ) ( not ( = ?auto_808957 ?auto_808958 ) ) ( not ( = ?auto_808957 ?auto_808959 ) ) ( not ( = ?auto_808957 ?auto_808960 ) ) ( not ( = ?auto_808958 ?auto_808959 ) ) ( not ( = ?auto_808958 ?auto_808960 ) ) ( not ( = ?auto_808959 ?auto_808960 ) ) ( ON ?auto_808958 ?auto_808959 ) ( ON ?auto_808957 ?auto_808958 ) ( CLEAR ?auto_808955 ) ( ON ?auto_808956 ?auto_808957 ) ( CLEAR ?auto_808956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_808942 ?auto_808943 ?auto_808944 ?auto_808945 ?auto_808946 ?auto_808947 ?auto_808948 ?auto_808949 ?auto_808950 ?auto_808951 ?auto_808952 ?auto_808953 ?auto_808954 ?auto_808955 ?auto_808956 )
      ( MAKE-18PILE ?auto_808942 ?auto_808943 ?auto_808944 ?auto_808945 ?auto_808946 ?auto_808947 ?auto_808948 ?auto_808949 ?auto_808950 ?auto_808951 ?auto_808952 ?auto_808953 ?auto_808954 ?auto_808955 ?auto_808956 ?auto_808957 ?auto_808958 ?auto_808959 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_808979 - BLOCK
      ?auto_808980 - BLOCK
      ?auto_808981 - BLOCK
      ?auto_808982 - BLOCK
      ?auto_808983 - BLOCK
      ?auto_808984 - BLOCK
      ?auto_808985 - BLOCK
      ?auto_808986 - BLOCK
      ?auto_808987 - BLOCK
      ?auto_808988 - BLOCK
      ?auto_808989 - BLOCK
      ?auto_808990 - BLOCK
      ?auto_808991 - BLOCK
      ?auto_808992 - BLOCK
      ?auto_808993 - BLOCK
      ?auto_808994 - BLOCK
      ?auto_808995 - BLOCK
      ?auto_808996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_808996 ) ( ON-TABLE ?auto_808979 ) ( ON ?auto_808980 ?auto_808979 ) ( ON ?auto_808981 ?auto_808980 ) ( ON ?auto_808982 ?auto_808981 ) ( ON ?auto_808983 ?auto_808982 ) ( ON ?auto_808984 ?auto_808983 ) ( ON ?auto_808985 ?auto_808984 ) ( ON ?auto_808986 ?auto_808985 ) ( ON ?auto_808987 ?auto_808986 ) ( ON ?auto_808988 ?auto_808987 ) ( ON ?auto_808989 ?auto_808988 ) ( ON ?auto_808990 ?auto_808989 ) ( ON ?auto_808991 ?auto_808990 ) ( ON ?auto_808992 ?auto_808991 ) ( not ( = ?auto_808979 ?auto_808980 ) ) ( not ( = ?auto_808979 ?auto_808981 ) ) ( not ( = ?auto_808979 ?auto_808982 ) ) ( not ( = ?auto_808979 ?auto_808983 ) ) ( not ( = ?auto_808979 ?auto_808984 ) ) ( not ( = ?auto_808979 ?auto_808985 ) ) ( not ( = ?auto_808979 ?auto_808986 ) ) ( not ( = ?auto_808979 ?auto_808987 ) ) ( not ( = ?auto_808979 ?auto_808988 ) ) ( not ( = ?auto_808979 ?auto_808989 ) ) ( not ( = ?auto_808979 ?auto_808990 ) ) ( not ( = ?auto_808979 ?auto_808991 ) ) ( not ( = ?auto_808979 ?auto_808992 ) ) ( not ( = ?auto_808979 ?auto_808993 ) ) ( not ( = ?auto_808979 ?auto_808994 ) ) ( not ( = ?auto_808979 ?auto_808995 ) ) ( not ( = ?auto_808979 ?auto_808996 ) ) ( not ( = ?auto_808980 ?auto_808981 ) ) ( not ( = ?auto_808980 ?auto_808982 ) ) ( not ( = ?auto_808980 ?auto_808983 ) ) ( not ( = ?auto_808980 ?auto_808984 ) ) ( not ( = ?auto_808980 ?auto_808985 ) ) ( not ( = ?auto_808980 ?auto_808986 ) ) ( not ( = ?auto_808980 ?auto_808987 ) ) ( not ( = ?auto_808980 ?auto_808988 ) ) ( not ( = ?auto_808980 ?auto_808989 ) ) ( not ( = ?auto_808980 ?auto_808990 ) ) ( not ( = ?auto_808980 ?auto_808991 ) ) ( not ( = ?auto_808980 ?auto_808992 ) ) ( not ( = ?auto_808980 ?auto_808993 ) ) ( not ( = ?auto_808980 ?auto_808994 ) ) ( not ( = ?auto_808980 ?auto_808995 ) ) ( not ( = ?auto_808980 ?auto_808996 ) ) ( not ( = ?auto_808981 ?auto_808982 ) ) ( not ( = ?auto_808981 ?auto_808983 ) ) ( not ( = ?auto_808981 ?auto_808984 ) ) ( not ( = ?auto_808981 ?auto_808985 ) ) ( not ( = ?auto_808981 ?auto_808986 ) ) ( not ( = ?auto_808981 ?auto_808987 ) ) ( not ( = ?auto_808981 ?auto_808988 ) ) ( not ( = ?auto_808981 ?auto_808989 ) ) ( not ( = ?auto_808981 ?auto_808990 ) ) ( not ( = ?auto_808981 ?auto_808991 ) ) ( not ( = ?auto_808981 ?auto_808992 ) ) ( not ( = ?auto_808981 ?auto_808993 ) ) ( not ( = ?auto_808981 ?auto_808994 ) ) ( not ( = ?auto_808981 ?auto_808995 ) ) ( not ( = ?auto_808981 ?auto_808996 ) ) ( not ( = ?auto_808982 ?auto_808983 ) ) ( not ( = ?auto_808982 ?auto_808984 ) ) ( not ( = ?auto_808982 ?auto_808985 ) ) ( not ( = ?auto_808982 ?auto_808986 ) ) ( not ( = ?auto_808982 ?auto_808987 ) ) ( not ( = ?auto_808982 ?auto_808988 ) ) ( not ( = ?auto_808982 ?auto_808989 ) ) ( not ( = ?auto_808982 ?auto_808990 ) ) ( not ( = ?auto_808982 ?auto_808991 ) ) ( not ( = ?auto_808982 ?auto_808992 ) ) ( not ( = ?auto_808982 ?auto_808993 ) ) ( not ( = ?auto_808982 ?auto_808994 ) ) ( not ( = ?auto_808982 ?auto_808995 ) ) ( not ( = ?auto_808982 ?auto_808996 ) ) ( not ( = ?auto_808983 ?auto_808984 ) ) ( not ( = ?auto_808983 ?auto_808985 ) ) ( not ( = ?auto_808983 ?auto_808986 ) ) ( not ( = ?auto_808983 ?auto_808987 ) ) ( not ( = ?auto_808983 ?auto_808988 ) ) ( not ( = ?auto_808983 ?auto_808989 ) ) ( not ( = ?auto_808983 ?auto_808990 ) ) ( not ( = ?auto_808983 ?auto_808991 ) ) ( not ( = ?auto_808983 ?auto_808992 ) ) ( not ( = ?auto_808983 ?auto_808993 ) ) ( not ( = ?auto_808983 ?auto_808994 ) ) ( not ( = ?auto_808983 ?auto_808995 ) ) ( not ( = ?auto_808983 ?auto_808996 ) ) ( not ( = ?auto_808984 ?auto_808985 ) ) ( not ( = ?auto_808984 ?auto_808986 ) ) ( not ( = ?auto_808984 ?auto_808987 ) ) ( not ( = ?auto_808984 ?auto_808988 ) ) ( not ( = ?auto_808984 ?auto_808989 ) ) ( not ( = ?auto_808984 ?auto_808990 ) ) ( not ( = ?auto_808984 ?auto_808991 ) ) ( not ( = ?auto_808984 ?auto_808992 ) ) ( not ( = ?auto_808984 ?auto_808993 ) ) ( not ( = ?auto_808984 ?auto_808994 ) ) ( not ( = ?auto_808984 ?auto_808995 ) ) ( not ( = ?auto_808984 ?auto_808996 ) ) ( not ( = ?auto_808985 ?auto_808986 ) ) ( not ( = ?auto_808985 ?auto_808987 ) ) ( not ( = ?auto_808985 ?auto_808988 ) ) ( not ( = ?auto_808985 ?auto_808989 ) ) ( not ( = ?auto_808985 ?auto_808990 ) ) ( not ( = ?auto_808985 ?auto_808991 ) ) ( not ( = ?auto_808985 ?auto_808992 ) ) ( not ( = ?auto_808985 ?auto_808993 ) ) ( not ( = ?auto_808985 ?auto_808994 ) ) ( not ( = ?auto_808985 ?auto_808995 ) ) ( not ( = ?auto_808985 ?auto_808996 ) ) ( not ( = ?auto_808986 ?auto_808987 ) ) ( not ( = ?auto_808986 ?auto_808988 ) ) ( not ( = ?auto_808986 ?auto_808989 ) ) ( not ( = ?auto_808986 ?auto_808990 ) ) ( not ( = ?auto_808986 ?auto_808991 ) ) ( not ( = ?auto_808986 ?auto_808992 ) ) ( not ( = ?auto_808986 ?auto_808993 ) ) ( not ( = ?auto_808986 ?auto_808994 ) ) ( not ( = ?auto_808986 ?auto_808995 ) ) ( not ( = ?auto_808986 ?auto_808996 ) ) ( not ( = ?auto_808987 ?auto_808988 ) ) ( not ( = ?auto_808987 ?auto_808989 ) ) ( not ( = ?auto_808987 ?auto_808990 ) ) ( not ( = ?auto_808987 ?auto_808991 ) ) ( not ( = ?auto_808987 ?auto_808992 ) ) ( not ( = ?auto_808987 ?auto_808993 ) ) ( not ( = ?auto_808987 ?auto_808994 ) ) ( not ( = ?auto_808987 ?auto_808995 ) ) ( not ( = ?auto_808987 ?auto_808996 ) ) ( not ( = ?auto_808988 ?auto_808989 ) ) ( not ( = ?auto_808988 ?auto_808990 ) ) ( not ( = ?auto_808988 ?auto_808991 ) ) ( not ( = ?auto_808988 ?auto_808992 ) ) ( not ( = ?auto_808988 ?auto_808993 ) ) ( not ( = ?auto_808988 ?auto_808994 ) ) ( not ( = ?auto_808988 ?auto_808995 ) ) ( not ( = ?auto_808988 ?auto_808996 ) ) ( not ( = ?auto_808989 ?auto_808990 ) ) ( not ( = ?auto_808989 ?auto_808991 ) ) ( not ( = ?auto_808989 ?auto_808992 ) ) ( not ( = ?auto_808989 ?auto_808993 ) ) ( not ( = ?auto_808989 ?auto_808994 ) ) ( not ( = ?auto_808989 ?auto_808995 ) ) ( not ( = ?auto_808989 ?auto_808996 ) ) ( not ( = ?auto_808990 ?auto_808991 ) ) ( not ( = ?auto_808990 ?auto_808992 ) ) ( not ( = ?auto_808990 ?auto_808993 ) ) ( not ( = ?auto_808990 ?auto_808994 ) ) ( not ( = ?auto_808990 ?auto_808995 ) ) ( not ( = ?auto_808990 ?auto_808996 ) ) ( not ( = ?auto_808991 ?auto_808992 ) ) ( not ( = ?auto_808991 ?auto_808993 ) ) ( not ( = ?auto_808991 ?auto_808994 ) ) ( not ( = ?auto_808991 ?auto_808995 ) ) ( not ( = ?auto_808991 ?auto_808996 ) ) ( not ( = ?auto_808992 ?auto_808993 ) ) ( not ( = ?auto_808992 ?auto_808994 ) ) ( not ( = ?auto_808992 ?auto_808995 ) ) ( not ( = ?auto_808992 ?auto_808996 ) ) ( not ( = ?auto_808993 ?auto_808994 ) ) ( not ( = ?auto_808993 ?auto_808995 ) ) ( not ( = ?auto_808993 ?auto_808996 ) ) ( not ( = ?auto_808994 ?auto_808995 ) ) ( not ( = ?auto_808994 ?auto_808996 ) ) ( not ( = ?auto_808995 ?auto_808996 ) ) ( ON ?auto_808995 ?auto_808996 ) ( ON ?auto_808994 ?auto_808995 ) ( CLEAR ?auto_808992 ) ( ON ?auto_808993 ?auto_808994 ) ( CLEAR ?auto_808993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_808979 ?auto_808980 ?auto_808981 ?auto_808982 ?auto_808983 ?auto_808984 ?auto_808985 ?auto_808986 ?auto_808987 ?auto_808988 ?auto_808989 ?auto_808990 ?auto_808991 ?auto_808992 ?auto_808993 )
      ( MAKE-18PILE ?auto_808979 ?auto_808980 ?auto_808981 ?auto_808982 ?auto_808983 ?auto_808984 ?auto_808985 ?auto_808986 ?auto_808987 ?auto_808988 ?auto_808989 ?auto_808990 ?auto_808991 ?auto_808992 ?auto_808993 ?auto_808994 ?auto_808995 ?auto_808996 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809015 - BLOCK
      ?auto_809016 - BLOCK
      ?auto_809017 - BLOCK
      ?auto_809018 - BLOCK
      ?auto_809019 - BLOCK
      ?auto_809020 - BLOCK
      ?auto_809021 - BLOCK
      ?auto_809022 - BLOCK
      ?auto_809023 - BLOCK
      ?auto_809024 - BLOCK
      ?auto_809025 - BLOCK
      ?auto_809026 - BLOCK
      ?auto_809027 - BLOCK
      ?auto_809028 - BLOCK
      ?auto_809029 - BLOCK
      ?auto_809030 - BLOCK
      ?auto_809031 - BLOCK
      ?auto_809032 - BLOCK
    )
    :vars
    (
      ?auto_809033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809032 ?auto_809033 ) ( ON-TABLE ?auto_809015 ) ( ON ?auto_809016 ?auto_809015 ) ( ON ?auto_809017 ?auto_809016 ) ( ON ?auto_809018 ?auto_809017 ) ( ON ?auto_809019 ?auto_809018 ) ( ON ?auto_809020 ?auto_809019 ) ( ON ?auto_809021 ?auto_809020 ) ( ON ?auto_809022 ?auto_809021 ) ( ON ?auto_809023 ?auto_809022 ) ( ON ?auto_809024 ?auto_809023 ) ( ON ?auto_809025 ?auto_809024 ) ( ON ?auto_809026 ?auto_809025 ) ( ON ?auto_809027 ?auto_809026 ) ( not ( = ?auto_809015 ?auto_809016 ) ) ( not ( = ?auto_809015 ?auto_809017 ) ) ( not ( = ?auto_809015 ?auto_809018 ) ) ( not ( = ?auto_809015 ?auto_809019 ) ) ( not ( = ?auto_809015 ?auto_809020 ) ) ( not ( = ?auto_809015 ?auto_809021 ) ) ( not ( = ?auto_809015 ?auto_809022 ) ) ( not ( = ?auto_809015 ?auto_809023 ) ) ( not ( = ?auto_809015 ?auto_809024 ) ) ( not ( = ?auto_809015 ?auto_809025 ) ) ( not ( = ?auto_809015 ?auto_809026 ) ) ( not ( = ?auto_809015 ?auto_809027 ) ) ( not ( = ?auto_809015 ?auto_809028 ) ) ( not ( = ?auto_809015 ?auto_809029 ) ) ( not ( = ?auto_809015 ?auto_809030 ) ) ( not ( = ?auto_809015 ?auto_809031 ) ) ( not ( = ?auto_809015 ?auto_809032 ) ) ( not ( = ?auto_809015 ?auto_809033 ) ) ( not ( = ?auto_809016 ?auto_809017 ) ) ( not ( = ?auto_809016 ?auto_809018 ) ) ( not ( = ?auto_809016 ?auto_809019 ) ) ( not ( = ?auto_809016 ?auto_809020 ) ) ( not ( = ?auto_809016 ?auto_809021 ) ) ( not ( = ?auto_809016 ?auto_809022 ) ) ( not ( = ?auto_809016 ?auto_809023 ) ) ( not ( = ?auto_809016 ?auto_809024 ) ) ( not ( = ?auto_809016 ?auto_809025 ) ) ( not ( = ?auto_809016 ?auto_809026 ) ) ( not ( = ?auto_809016 ?auto_809027 ) ) ( not ( = ?auto_809016 ?auto_809028 ) ) ( not ( = ?auto_809016 ?auto_809029 ) ) ( not ( = ?auto_809016 ?auto_809030 ) ) ( not ( = ?auto_809016 ?auto_809031 ) ) ( not ( = ?auto_809016 ?auto_809032 ) ) ( not ( = ?auto_809016 ?auto_809033 ) ) ( not ( = ?auto_809017 ?auto_809018 ) ) ( not ( = ?auto_809017 ?auto_809019 ) ) ( not ( = ?auto_809017 ?auto_809020 ) ) ( not ( = ?auto_809017 ?auto_809021 ) ) ( not ( = ?auto_809017 ?auto_809022 ) ) ( not ( = ?auto_809017 ?auto_809023 ) ) ( not ( = ?auto_809017 ?auto_809024 ) ) ( not ( = ?auto_809017 ?auto_809025 ) ) ( not ( = ?auto_809017 ?auto_809026 ) ) ( not ( = ?auto_809017 ?auto_809027 ) ) ( not ( = ?auto_809017 ?auto_809028 ) ) ( not ( = ?auto_809017 ?auto_809029 ) ) ( not ( = ?auto_809017 ?auto_809030 ) ) ( not ( = ?auto_809017 ?auto_809031 ) ) ( not ( = ?auto_809017 ?auto_809032 ) ) ( not ( = ?auto_809017 ?auto_809033 ) ) ( not ( = ?auto_809018 ?auto_809019 ) ) ( not ( = ?auto_809018 ?auto_809020 ) ) ( not ( = ?auto_809018 ?auto_809021 ) ) ( not ( = ?auto_809018 ?auto_809022 ) ) ( not ( = ?auto_809018 ?auto_809023 ) ) ( not ( = ?auto_809018 ?auto_809024 ) ) ( not ( = ?auto_809018 ?auto_809025 ) ) ( not ( = ?auto_809018 ?auto_809026 ) ) ( not ( = ?auto_809018 ?auto_809027 ) ) ( not ( = ?auto_809018 ?auto_809028 ) ) ( not ( = ?auto_809018 ?auto_809029 ) ) ( not ( = ?auto_809018 ?auto_809030 ) ) ( not ( = ?auto_809018 ?auto_809031 ) ) ( not ( = ?auto_809018 ?auto_809032 ) ) ( not ( = ?auto_809018 ?auto_809033 ) ) ( not ( = ?auto_809019 ?auto_809020 ) ) ( not ( = ?auto_809019 ?auto_809021 ) ) ( not ( = ?auto_809019 ?auto_809022 ) ) ( not ( = ?auto_809019 ?auto_809023 ) ) ( not ( = ?auto_809019 ?auto_809024 ) ) ( not ( = ?auto_809019 ?auto_809025 ) ) ( not ( = ?auto_809019 ?auto_809026 ) ) ( not ( = ?auto_809019 ?auto_809027 ) ) ( not ( = ?auto_809019 ?auto_809028 ) ) ( not ( = ?auto_809019 ?auto_809029 ) ) ( not ( = ?auto_809019 ?auto_809030 ) ) ( not ( = ?auto_809019 ?auto_809031 ) ) ( not ( = ?auto_809019 ?auto_809032 ) ) ( not ( = ?auto_809019 ?auto_809033 ) ) ( not ( = ?auto_809020 ?auto_809021 ) ) ( not ( = ?auto_809020 ?auto_809022 ) ) ( not ( = ?auto_809020 ?auto_809023 ) ) ( not ( = ?auto_809020 ?auto_809024 ) ) ( not ( = ?auto_809020 ?auto_809025 ) ) ( not ( = ?auto_809020 ?auto_809026 ) ) ( not ( = ?auto_809020 ?auto_809027 ) ) ( not ( = ?auto_809020 ?auto_809028 ) ) ( not ( = ?auto_809020 ?auto_809029 ) ) ( not ( = ?auto_809020 ?auto_809030 ) ) ( not ( = ?auto_809020 ?auto_809031 ) ) ( not ( = ?auto_809020 ?auto_809032 ) ) ( not ( = ?auto_809020 ?auto_809033 ) ) ( not ( = ?auto_809021 ?auto_809022 ) ) ( not ( = ?auto_809021 ?auto_809023 ) ) ( not ( = ?auto_809021 ?auto_809024 ) ) ( not ( = ?auto_809021 ?auto_809025 ) ) ( not ( = ?auto_809021 ?auto_809026 ) ) ( not ( = ?auto_809021 ?auto_809027 ) ) ( not ( = ?auto_809021 ?auto_809028 ) ) ( not ( = ?auto_809021 ?auto_809029 ) ) ( not ( = ?auto_809021 ?auto_809030 ) ) ( not ( = ?auto_809021 ?auto_809031 ) ) ( not ( = ?auto_809021 ?auto_809032 ) ) ( not ( = ?auto_809021 ?auto_809033 ) ) ( not ( = ?auto_809022 ?auto_809023 ) ) ( not ( = ?auto_809022 ?auto_809024 ) ) ( not ( = ?auto_809022 ?auto_809025 ) ) ( not ( = ?auto_809022 ?auto_809026 ) ) ( not ( = ?auto_809022 ?auto_809027 ) ) ( not ( = ?auto_809022 ?auto_809028 ) ) ( not ( = ?auto_809022 ?auto_809029 ) ) ( not ( = ?auto_809022 ?auto_809030 ) ) ( not ( = ?auto_809022 ?auto_809031 ) ) ( not ( = ?auto_809022 ?auto_809032 ) ) ( not ( = ?auto_809022 ?auto_809033 ) ) ( not ( = ?auto_809023 ?auto_809024 ) ) ( not ( = ?auto_809023 ?auto_809025 ) ) ( not ( = ?auto_809023 ?auto_809026 ) ) ( not ( = ?auto_809023 ?auto_809027 ) ) ( not ( = ?auto_809023 ?auto_809028 ) ) ( not ( = ?auto_809023 ?auto_809029 ) ) ( not ( = ?auto_809023 ?auto_809030 ) ) ( not ( = ?auto_809023 ?auto_809031 ) ) ( not ( = ?auto_809023 ?auto_809032 ) ) ( not ( = ?auto_809023 ?auto_809033 ) ) ( not ( = ?auto_809024 ?auto_809025 ) ) ( not ( = ?auto_809024 ?auto_809026 ) ) ( not ( = ?auto_809024 ?auto_809027 ) ) ( not ( = ?auto_809024 ?auto_809028 ) ) ( not ( = ?auto_809024 ?auto_809029 ) ) ( not ( = ?auto_809024 ?auto_809030 ) ) ( not ( = ?auto_809024 ?auto_809031 ) ) ( not ( = ?auto_809024 ?auto_809032 ) ) ( not ( = ?auto_809024 ?auto_809033 ) ) ( not ( = ?auto_809025 ?auto_809026 ) ) ( not ( = ?auto_809025 ?auto_809027 ) ) ( not ( = ?auto_809025 ?auto_809028 ) ) ( not ( = ?auto_809025 ?auto_809029 ) ) ( not ( = ?auto_809025 ?auto_809030 ) ) ( not ( = ?auto_809025 ?auto_809031 ) ) ( not ( = ?auto_809025 ?auto_809032 ) ) ( not ( = ?auto_809025 ?auto_809033 ) ) ( not ( = ?auto_809026 ?auto_809027 ) ) ( not ( = ?auto_809026 ?auto_809028 ) ) ( not ( = ?auto_809026 ?auto_809029 ) ) ( not ( = ?auto_809026 ?auto_809030 ) ) ( not ( = ?auto_809026 ?auto_809031 ) ) ( not ( = ?auto_809026 ?auto_809032 ) ) ( not ( = ?auto_809026 ?auto_809033 ) ) ( not ( = ?auto_809027 ?auto_809028 ) ) ( not ( = ?auto_809027 ?auto_809029 ) ) ( not ( = ?auto_809027 ?auto_809030 ) ) ( not ( = ?auto_809027 ?auto_809031 ) ) ( not ( = ?auto_809027 ?auto_809032 ) ) ( not ( = ?auto_809027 ?auto_809033 ) ) ( not ( = ?auto_809028 ?auto_809029 ) ) ( not ( = ?auto_809028 ?auto_809030 ) ) ( not ( = ?auto_809028 ?auto_809031 ) ) ( not ( = ?auto_809028 ?auto_809032 ) ) ( not ( = ?auto_809028 ?auto_809033 ) ) ( not ( = ?auto_809029 ?auto_809030 ) ) ( not ( = ?auto_809029 ?auto_809031 ) ) ( not ( = ?auto_809029 ?auto_809032 ) ) ( not ( = ?auto_809029 ?auto_809033 ) ) ( not ( = ?auto_809030 ?auto_809031 ) ) ( not ( = ?auto_809030 ?auto_809032 ) ) ( not ( = ?auto_809030 ?auto_809033 ) ) ( not ( = ?auto_809031 ?auto_809032 ) ) ( not ( = ?auto_809031 ?auto_809033 ) ) ( not ( = ?auto_809032 ?auto_809033 ) ) ( ON ?auto_809031 ?auto_809032 ) ( ON ?auto_809030 ?auto_809031 ) ( ON ?auto_809029 ?auto_809030 ) ( CLEAR ?auto_809027 ) ( ON ?auto_809028 ?auto_809029 ) ( CLEAR ?auto_809028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_809015 ?auto_809016 ?auto_809017 ?auto_809018 ?auto_809019 ?auto_809020 ?auto_809021 ?auto_809022 ?auto_809023 ?auto_809024 ?auto_809025 ?auto_809026 ?auto_809027 ?auto_809028 )
      ( MAKE-18PILE ?auto_809015 ?auto_809016 ?auto_809017 ?auto_809018 ?auto_809019 ?auto_809020 ?auto_809021 ?auto_809022 ?auto_809023 ?auto_809024 ?auto_809025 ?auto_809026 ?auto_809027 ?auto_809028 ?auto_809029 ?auto_809030 ?auto_809031 ?auto_809032 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809052 - BLOCK
      ?auto_809053 - BLOCK
      ?auto_809054 - BLOCK
      ?auto_809055 - BLOCK
      ?auto_809056 - BLOCK
      ?auto_809057 - BLOCK
      ?auto_809058 - BLOCK
      ?auto_809059 - BLOCK
      ?auto_809060 - BLOCK
      ?auto_809061 - BLOCK
      ?auto_809062 - BLOCK
      ?auto_809063 - BLOCK
      ?auto_809064 - BLOCK
      ?auto_809065 - BLOCK
      ?auto_809066 - BLOCK
      ?auto_809067 - BLOCK
      ?auto_809068 - BLOCK
      ?auto_809069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809069 ) ( ON-TABLE ?auto_809052 ) ( ON ?auto_809053 ?auto_809052 ) ( ON ?auto_809054 ?auto_809053 ) ( ON ?auto_809055 ?auto_809054 ) ( ON ?auto_809056 ?auto_809055 ) ( ON ?auto_809057 ?auto_809056 ) ( ON ?auto_809058 ?auto_809057 ) ( ON ?auto_809059 ?auto_809058 ) ( ON ?auto_809060 ?auto_809059 ) ( ON ?auto_809061 ?auto_809060 ) ( ON ?auto_809062 ?auto_809061 ) ( ON ?auto_809063 ?auto_809062 ) ( ON ?auto_809064 ?auto_809063 ) ( not ( = ?auto_809052 ?auto_809053 ) ) ( not ( = ?auto_809052 ?auto_809054 ) ) ( not ( = ?auto_809052 ?auto_809055 ) ) ( not ( = ?auto_809052 ?auto_809056 ) ) ( not ( = ?auto_809052 ?auto_809057 ) ) ( not ( = ?auto_809052 ?auto_809058 ) ) ( not ( = ?auto_809052 ?auto_809059 ) ) ( not ( = ?auto_809052 ?auto_809060 ) ) ( not ( = ?auto_809052 ?auto_809061 ) ) ( not ( = ?auto_809052 ?auto_809062 ) ) ( not ( = ?auto_809052 ?auto_809063 ) ) ( not ( = ?auto_809052 ?auto_809064 ) ) ( not ( = ?auto_809052 ?auto_809065 ) ) ( not ( = ?auto_809052 ?auto_809066 ) ) ( not ( = ?auto_809052 ?auto_809067 ) ) ( not ( = ?auto_809052 ?auto_809068 ) ) ( not ( = ?auto_809052 ?auto_809069 ) ) ( not ( = ?auto_809053 ?auto_809054 ) ) ( not ( = ?auto_809053 ?auto_809055 ) ) ( not ( = ?auto_809053 ?auto_809056 ) ) ( not ( = ?auto_809053 ?auto_809057 ) ) ( not ( = ?auto_809053 ?auto_809058 ) ) ( not ( = ?auto_809053 ?auto_809059 ) ) ( not ( = ?auto_809053 ?auto_809060 ) ) ( not ( = ?auto_809053 ?auto_809061 ) ) ( not ( = ?auto_809053 ?auto_809062 ) ) ( not ( = ?auto_809053 ?auto_809063 ) ) ( not ( = ?auto_809053 ?auto_809064 ) ) ( not ( = ?auto_809053 ?auto_809065 ) ) ( not ( = ?auto_809053 ?auto_809066 ) ) ( not ( = ?auto_809053 ?auto_809067 ) ) ( not ( = ?auto_809053 ?auto_809068 ) ) ( not ( = ?auto_809053 ?auto_809069 ) ) ( not ( = ?auto_809054 ?auto_809055 ) ) ( not ( = ?auto_809054 ?auto_809056 ) ) ( not ( = ?auto_809054 ?auto_809057 ) ) ( not ( = ?auto_809054 ?auto_809058 ) ) ( not ( = ?auto_809054 ?auto_809059 ) ) ( not ( = ?auto_809054 ?auto_809060 ) ) ( not ( = ?auto_809054 ?auto_809061 ) ) ( not ( = ?auto_809054 ?auto_809062 ) ) ( not ( = ?auto_809054 ?auto_809063 ) ) ( not ( = ?auto_809054 ?auto_809064 ) ) ( not ( = ?auto_809054 ?auto_809065 ) ) ( not ( = ?auto_809054 ?auto_809066 ) ) ( not ( = ?auto_809054 ?auto_809067 ) ) ( not ( = ?auto_809054 ?auto_809068 ) ) ( not ( = ?auto_809054 ?auto_809069 ) ) ( not ( = ?auto_809055 ?auto_809056 ) ) ( not ( = ?auto_809055 ?auto_809057 ) ) ( not ( = ?auto_809055 ?auto_809058 ) ) ( not ( = ?auto_809055 ?auto_809059 ) ) ( not ( = ?auto_809055 ?auto_809060 ) ) ( not ( = ?auto_809055 ?auto_809061 ) ) ( not ( = ?auto_809055 ?auto_809062 ) ) ( not ( = ?auto_809055 ?auto_809063 ) ) ( not ( = ?auto_809055 ?auto_809064 ) ) ( not ( = ?auto_809055 ?auto_809065 ) ) ( not ( = ?auto_809055 ?auto_809066 ) ) ( not ( = ?auto_809055 ?auto_809067 ) ) ( not ( = ?auto_809055 ?auto_809068 ) ) ( not ( = ?auto_809055 ?auto_809069 ) ) ( not ( = ?auto_809056 ?auto_809057 ) ) ( not ( = ?auto_809056 ?auto_809058 ) ) ( not ( = ?auto_809056 ?auto_809059 ) ) ( not ( = ?auto_809056 ?auto_809060 ) ) ( not ( = ?auto_809056 ?auto_809061 ) ) ( not ( = ?auto_809056 ?auto_809062 ) ) ( not ( = ?auto_809056 ?auto_809063 ) ) ( not ( = ?auto_809056 ?auto_809064 ) ) ( not ( = ?auto_809056 ?auto_809065 ) ) ( not ( = ?auto_809056 ?auto_809066 ) ) ( not ( = ?auto_809056 ?auto_809067 ) ) ( not ( = ?auto_809056 ?auto_809068 ) ) ( not ( = ?auto_809056 ?auto_809069 ) ) ( not ( = ?auto_809057 ?auto_809058 ) ) ( not ( = ?auto_809057 ?auto_809059 ) ) ( not ( = ?auto_809057 ?auto_809060 ) ) ( not ( = ?auto_809057 ?auto_809061 ) ) ( not ( = ?auto_809057 ?auto_809062 ) ) ( not ( = ?auto_809057 ?auto_809063 ) ) ( not ( = ?auto_809057 ?auto_809064 ) ) ( not ( = ?auto_809057 ?auto_809065 ) ) ( not ( = ?auto_809057 ?auto_809066 ) ) ( not ( = ?auto_809057 ?auto_809067 ) ) ( not ( = ?auto_809057 ?auto_809068 ) ) ( not ( = ?auto_809057 ?auto_809069 ) ) ( not ( = ?auto_809058 ?auto_809059 ) ) ( not ( = ?auto_809058 ?auto_809060 ) ) ( not ( = ?auto_809058 ?auto_809061 ) ) ( not ( = ?auto_809058 ?auto_809062 ) ) ( not ( = ?auto_809058 ?auto_809063 ) ) ( not ( = ?auto_809058 ?auto_809064 ) ) ( not ( = ?auto_809058 ?auto_809065 ) ) ( not ( = ?auto_809058 ?auto_809066 ) ) ( not ( = ?auto_809058 ?auto_809067 ) ) ( not ( = ?auto_809058 ?auto_809068 ) ) ( not ( = ?auto_809058 ?auto_809069 ) ) ( not ( = ?auto_809059 ?auto_809060 ) ) ( not ( = ?auto_809059 ?auto_809061 ) ) ( not ( = ?auto_809059 ?auto_809062 ) ) ( not ( = ?auto_809059 ?auto_809063 ) ) ( not ( = ?auto_809059 ?auto_809064 ) ) ( not ( = ?auto_809059 ?auto_809065 ) ) ( not ( = ?auto_809059 ?auto_809066 ) ) ( not ( = ?auto_809059 ?auto_809067 ) ) ( not ( = ?auto_809059 ?auto_809068 ) ) ( not ( = ?auto_809059 ?auto_809069 ) ) ( not ( = ?auto_809060 ?auto_809061 ) ) ( not ( = ?auto_809060 ?auto_809062 ) ) ( not ( = ?auto_809060 ?auto_809063 ) ) ( not ( = ?auto_809060 ?auto_809064 ) ) ( not ( = ?auto_809060 ?auto_809065 ) ) ( not ( = ?auto_809060 ?auto_809066 ) ) ( not ( = ?auto_809060 ?auto_809067 ) ) ( not ( = ?auto_809060 ?auto_809068 ) ) ( not ( = ?auto_809060 ?auto_809069 ) ) ( not ( = ?auto_809061 ?auto_809062 ) ) ( not ( = ?auto_809061 ?auto_809063 ) ) ( not ( = ?auto_809061 ?auto_809064 ) ) ( not ( = ?auto_809061 ?auto_809065 ) ) ( not ( = ?auto_809061 ?auto_809066 ) ) ( not ( = ?auto_809061 ?auto_809067 ) ) ( not ( = ?auto_809061 ?auto_809068 ) ) ( not ( = ?auto_809061 ?auto_809069 ) ) ( not ( = ?auto_809062 ?auto_809063 ) ) ( not ( = ?auto_809062 ?auto_809064 ) ) ( not ( = ?auto_809062 ?auto_809065 ) ) ( not ( = ?auto_809062 ?auto_809066 ) ) ( not ( = ?auto_809062 ?auto_809067 ) ) ( not ( = ?auto_809062 ?auto_809068 ) ) ( not ( = ?auto_809062 ?auto_809069 ) ) ( not ( = ?auto_809063 ?auto_809064 ) ) ( not ( = ?auto_809063 ?auto_809065 ) ) ( not ( = ?auto_809063 ?auto_809066 ) ) ( not ( = ?auto_809063 ?auto_809067 ) ) ( not ( = ?auto_809063 ?auto_809068 ) ) ( not ( = ?auto_809063 ?auto_809069 ) ) ( not ( = ?auto_809064 ?auto_809065 ) ) ( not ( = ?auto_809064 ?auto_809066 ) ) ( not ( = ?auto_809064 ?auto_809067 ) ) ( not ( = ?auto_809064 ?auto_809068 ) ) ( not ( = ?auto_809064 ?auto_809069 ) ) ( not ( = ?auto_809065 ?auto_809066 ) ) ( not ( = ?auto_809065 ?auto_809067 ) ) ( not ( = ?auto_809065 ?auto_809068 ) ) ( not ( = ?auto_809065 ?auto_809069 ) ) ( not ( = ?auto_809066 ?auto_809067 ) ) ( not ( = ?auto_809066 ?auto_809068 ) ) ( not ( = ?auto_809066 ?auto_809069 ) ) ( not ( = ?auto_809067 ?auto_809068 ) ) ( not ( = ?auto_809067 ?auto_809069 ) ) ( not ( = ?auto_809068 ?auto_809069 ) ) ( ON ?auto_809068 ?auto_809069 ) ( ON ?auto_809067 ?auto_809068 ) ( ON ?auto_809066 ?auto_809067 ) ( CLEAR ?auto_809064 ) ( ON ?auto_809065 ?auto_809066 ) ( CLEAR ?auto_809065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_809052 ?auto_809053 ?auto_809054 ?auto_809055 ?auto_809056 ?auto_809057 ?auto_809058 ?auto_809059 ?auto_809060 ?auto_809061 ?auto_809062 ?auto_809063 ?auto_809064 ?auto_809065 )
      ( MAKE-18PILE ?auto_809052 ?auto_809053 ?auto_809054 ?auto_809055 ?auto_809056 ?auto_809057 ?auto_809058 ?auto_809059 ?auto_809060 ?auto_809061 ?auto_809062 ?auto_809063 ?auto_809064 ?auto_809065 ?auto_809066 ?auto_809067 ?auto_809068 ?auto_809069 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809088 - BLOCK
      ?auto_809089 - BLOCK
      ?auto_809090 - BLOCK
      ?auto_809091 - BLOCK
      ?auto_809092 - BLOCK
      ?auto_809093 - BLOCK
      ?auto_809094 - BLOCK
      ?auto_809095 - BLOCK
      ?auto_809096 - BLOCK
      ?auto_809097 - BLOCK
      ?auto_809098 - BLOCK
      ?auto_809099 - BLOCK
      ?auto_809100 - BLOCK
      ?auto_809101 - BLOCK
      ?auto_809102 - BLOCK
      ?auto_809103 - BLOCK
      ?auto_809104 - BLOCK
      ?auto_809105 - BLOCK
    )
    :vars
    (
      ?auto_809106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809105 ?auto_809106 ) ( ON-TABLE ?auto_809088 ) ( ON ?auto_809089 ?auto_809088 ) ( ON ?auto_809090 ?auto_809089 ) ( ON ?auto_809091 ?auto_809090 ) ( ON ?auto_809092 ?auto_809091 ) ( ON ?auto_809093 ?auto_809092 ) ( ON ?auto_809094 ?auto_809093 ) ( ON ?auto_809095 ?auto_809094 ) ( ON ?auto_809096 ?auto_809095 ) ( ON ?auto_809097 ?auto_809096 ) ( ON ?auto_809098 ?auto_809097 ) ( ON ?auto_809099 ?auto_809098 ) ( not ( = ?auto_809088 ?auto_809089 ) ) ( not ( = ?auto_809088 ?auto_809090 ) ) ( not ( = ?auto_809088 ?auto_809091 ) ) ( not ( = ?auto_809088 ?auto_809092 ) ) ( not ( = ?auto_809088 ?auto_809093 ) ) ( not ( = ?auto_809088 ?auto_809094 ) ) ( not ( = ?auto_809088 ?auto_809095 ) ) ( not ( = ?auto_809088 ?auto_809096 ) ) ( not ( = ?auto_809088 ?auto_809097 ) ) ( not ( = ?auto_809088 ?auto_809098 ) ) ( not ( = ?auto_809088 ?auto_809099 ) ) ( not ( = ?auto_809088 ?auto_809100 ) ) ( not ( = ?auto_809088 ?auto_809101 ) ) ( not ( = ?auto_809088 ?auto_809102 ) ) ( not ( = ?auto_809088 ?auto_809103 ) ) ( not ( = ?auto_809088 ?auto_809104 ) ) ( not ( = ?auto_809088 ?auto_809105 ) ) ( not ( = ?auto_809088 ?auto_809106 ) ) ( not ( = ?auto_809089 ?auto_809090 ) ) ( not ( = ?auto_809089 ?auto_809091 ) ) ( not ( = ?auto_809089 ?auto_809092 ) ) ( not ( = ?auto_809089 ?auto_809093 ) ) ( not ( = ?auto_809089 ?auto_809094 ) ) ( not ( = ?auto_809089 ?auto_809095 ) ) ( not ( = ?auto_809089 ?auto_809096 ) ) ( not ( = ?auto_809089 ?auto_809097 ) ) ( not ( = ?auto_809089 ?auto_809098 ) ) ( not ( = ?auto_809089 ?auto_809099 ) ) ( not ( = ?auto_809089 ?auto_809100 ) ) ( not ( = ?auto_809089 ?auto_809101 ) ) ( not ( = ?auto_809089 ?auto_809102 ) ) ( not ( = ?auto_809089 ?auto_809103 ) ) ( not ( = ?auto_809089 ?auto_809104 ) ) ( not ( = ?auto_809089 ?auto_809105 ) ) ( not ( = ?auto_809089 ?auto_809106 ) ) ( not ( = ?auto_809090 ?auto_809091 ) ) ( not ( = ?auto_809090 ?auto_809092 ) ) ( not ( = ?auto_809090 ?auto_809093 ) ) ( not ( = ?auto_809090 ?auto_809094 ) ) ( not ( = ?auto_809090 ?auto_809095 ) ) ( not ( = ?auto_809090 ?auto_809096 ) ) ( not ( = ?auto_809090 ?auto_809097 ) ) ( not ( = ?auto_809090 ?auto_809098 ) ) ( not ( = ?auto_809090 ?auto_809099 ) ) ( not ( = ?auto_809090 ?auto_809100 ) ) ( not ( = ?auto_809090 ?auto_809101 ) ) ( not ( = ?auto_809090 ?auto_809102 ) ) ( not ( = ?auto_809090 ?auto_809103 ) ) ( not ( = ?auto_809090 ?auto_809104 ) ) ( not ( = ?auto_809090 ?auto_809105 ) ) ( not ( = ?auto_809090 ?auto_809106 ) ) ( not ( = ?auto_809091 ?auto_809092 ) ) ( not ( = ?auto_809091 ?auto_809093 ) ) ( not ( = ?auto_809091 ?auto_809094 ) ) ( not ( = ?auto_809091 ?auto_809095 ) ) ( not ( = ?auto_809091 ?auto_809096 ) ) ( not ( = ?auto_809091 ?auto_809097 ) ) ( not ( = ?auto_809091 ?auto_809098 ) ) ( not ( = ?auto_809091 ?auto_809099 ) ) ( not ( = ?auto_809091 ?auto_809100 ) ) ( not ( = ?auto_809091 ?auto_809101 ) ) ( not ( = ?auto_809091 ?auto_809102 ) ) ( not ( = ?auto_809091 ?auto_809103 ) ) ( not ( = ?auto_809091 ?auto_809104 ) ) ( not ( = ?auto_809091 ?auto_809105 ) ) ( not ( = ?auto_809091 ?auto_809106 ) ) ( not ( = ?auto_809092 ?auto_809093 ) ) ( not ( = ?auto_809092 ?auto_809094 ) ) ( not ( = ?auto_809092 ?auto_809095 ) ) ( not ( = ?auto_809092 ?auto_809096 ) ) ( not ( = ?auto_809092 ?auto_809097 ) ) ( not ( = ?auto_809092 ?auto_809098 ) ) ( not ( = ?auto_809092 ?auto_809099 ) ) ( not ( = ?auto_809092 ?auto_809100 ) ) ( not ( = ?auto_809092 ?auto_809101 ) ) ( not ( = ?auto_809092 ?auto_809102 ) ) ( not ( = ?auto_809092 ?auto_809103 ) ) ( not ( = ?auto_809092 ?auto_809104 ) ) ( not ( = ?auto_809092 ?auto_809105 ) ) ( not ( = ?auto_809092 ?auto_809106 ) ) ( not ( = ?auto_809093 ?auto_809094 ) ) ( not ( = ?auto_809093 ?auto_809095 ) ) ( not ( = ?auto_809093 ?auto_809096 ) ) ( not ( = ?auto_809093 ?auto_809097 ) ) ( not ( = ?auto_809093 ?auto_809098 ) ) ( not ( = ?auto_809093 ?auto_809099 ) ) ( not ( = ?auto_809093 ?auto_809100 ) ) ( not ( = ?auto_809093 ?auto_809101 ) ) ( not ( = ?auto_809093 ?auto_809102 ) ) ( not ( = ?auto_809093 ?auto_809103 ) ) ( not ( = ?auto_809093 ?auto_809104 ) ) ( not ( = ?auto_809093 ?auto_809105 ) ) ( not ( = ?auto_809093 ?auto_809106 ) ) ( not ( = ?auto_809094 ?auto_809095 ) ) ( not ( = ?auto_809094 ?auto_809096 ) ) ( not ( = ?auto_809094 ?auto_809097 ) ) ( not ( = ?auto_809094 ?auto_809098 ) ) ( not ( = ?auto_809094 ?auto_809099 ) ) ( not ( = ?auto_809094 ?auto_809100 ) ) ( not ( = ?auto_809094 ?auto_809101 ) ) ( not ( = ?auto_809094 ?auto_809102 ) ) ( not ( = ?auto_809094 ?auto_809103 ) ) ( not ( = ?auto_809094 ?auto_809104 ) ) ( not ( = ?auto_809094 ?auto_809105 ) ) ( not ( = ?auto_809094 ?auto_809106 ) ) ( not ( = ?auto_809095 ?auto_809096 ) ) ( not ( = ?auto_809095 ?auto_809097 ) ) ( not ( = ?auto_809095 ?auto_809098 ) ) ( not ( = ?auto_809095 ?auto_809099 ) ) ( not ( = ?auto_809095 ?auto_809100 ) ) ( not ( = ?auto_809095 ?auto_809101 ) ) ( not ( = ?auto_809095 ?auto_809102 ) ) ( not ( = ?auto_809095 ?auto_809103 ) ) ( not ( = ?auto_809095 ?auto_809104 ) ) ( not ( = ?auto_809095 ?auto_809105 ) ) ( not ( = ?auto_809095 ?auto_809106 ) ) ( not ( = ?auto_809096 ?auto_809097 ) ) ( not ( = ?auto_809096 ?auto_809098 ) ) ( not ( = ?auto_809096 ?auto_809099 ) ) ( not ( = ?auto_809096 ?auto_809100 ) ) ( not ( = ?auto_809096 ?auto_809101 ) ) ( not ( = ?auto_809096 ?auto_809102 ) ) ( not ( = ?auto_809096 ?auto_809103 ) ) ( not ( = ?auto_809096 ?auto_809104 ) ) ( not ( = ?auto_809096 ?auto_809105 ) ) ( not ( = ?auto_809096 ?auto_809106 ) ) ( not ( = ?auto_809097 ?auto_809098 ) ) ( not ( = ?auto_809097 ?auto_809099 ) ) ( not ( = ?auto_809097 ?auto_809100 ) ) ( not ( = ?auto_809097 ?auto_809101 ) ) ( not ( = ?auto_809097 ?auto_809102 ) ) ( not ( = ?auto_809097 ?auto_809103 ) ) ( not ( = ?auto_809097 ?auto_809104 ) ) ( not ( = ?auto_809097 ?auto_809105 ) ) ( not ( = ?auto_809097 ?auto_809106 ) ) ( not ( = ?auto_809098 ?auto_809099 ) ) ( not ( = ?auto_809098 ?auto_809100 ) ) ( not ( = ?auto_809098 ?auto_809101 ) ) ( not ( = ?auto_809098 ?auto_809102 ) ) ( not ( = ?auto_809098 ?auto_809103 ) ) ( not ( = ?auto_809098 ?auto_809104 ) ) ( not ( = ?auto_809098 ?auto_809105 ) ) ( not ( = ?auto_809098 ?auto_809106 ) ) ( not ( = ?auto_809099 ?auto_809100 ) ) ( not ( = ?auto_809099 ?auto_809101 ) ) ( not ( = ?auto_809099 ?auto_809102 ) ) ( not ( = ?auto_809099 ?auto_809103 ) ) ( not ( = ?auto_809099 ?auto_809104 ) ) ( not ( = ?auto_809099 ?auto_809105 ) ) ( not ( = ?auto_809099 ?auto_809106 ) ) ( not ( = ?auto_809100 ?auto_809101 ) ) ( not ( = ?auto_809100 ?auto_809102 ) ) ( not ( = ?auto_809100 ?auto_809103 ) ) ( not ( = ?auto_809100 ?auto_809104 ) ) ( not ( = ?auto_809100 ?auto_809105 ) ) ( not ( = ?auto_809100 ?auto_809106 ) ) ( not ( = ?auto_809101 ?auto_809102 ) ) ( not ( = ?auto_809101 ?auto_809103 ) ) ( not ( = ?auto_809101 ?auto_809104 ) ) ( not ( = ?auto_809101 ?auto_809105 ) ) ( not ( = ?auto_809101 ?auto_809106 ) ) ( not ( = ?auto_809102 ?auto_809103 ) ) ( not ( = ?auto_809102 ?auto_809104 ) ) ( not ( = ?auto_809102 ?auto_809105 ) ) ( not ( = ?auto_809102 ?auto_809106 ) ) ( not ( = ?auto_809103 ?auto_809104 ) ) ( not ( = ?auto_809103 ?auto_809105 ) ) ( not ( = ?auto_809103 ?auto_809106 ) ) ( not ( = ?auto_809104 ?auto_809105 ) ) ( not ( = ?auto_809104 ?auto_809106 ) ) ( not ( = ?auto_809105 ?auto_809106 ) ) ( ON ?auto_809104 ?auto_809105 ) ( ON ?auto_809103 ?auto_809104 ) ( ON ?auto_809102 ?auto_809103 ) ( ON ?auto_809101 ?auto_809102 ) ( CLEAR ?auto_809099 ) ( ON ?auto_809100 ?auto_809101 ) ( CLEAR ?auto_809100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_809088 ?auto_809089 ?auto_809090 ?auto_809091 ?auto_809092 ?auto_809093 ?auto_809094 ?auto_809095 ?auto_809096 ?auto_809097 ?auto_809098 ?auto_809099 ?auto_809100 )
      ( MAKE-18PILE ?auto_809088 ?auto_809089 ?auto_809090 ?auto_809091 ?auto_809092 ?auto_809093 ?auto_809094 ?auto_809095 ?auto_809096 ?auto_809097 ?auto_809098 ?auto_809099 ?auto_809100 ?auto_809101 ?auto_809102 ?auto_809103 ?auto_809104 ?auto_809105 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809125 - BLOCK
      ?auto_809126 - BLOCK
      ?auto_809127 - BLOCK
      ?auto_809128 - BLOCK
      ?auto_809129 - BLOCK
      ?auto_809130 - BLOCK
      ?auto_809131 - BLOCK
      ?auto_809132 - BLOCK
      ?auto_809133 - BLOCK
      ?auto_809134 - BLOCK
      ?auto_809135 - BLOCK
      ?auto_809136 - BLOCK
      ?auto_809137 - BLOCK
      ?auto_809138 - BLOCK
      ?auto_809139 - BLOCK
      ?auto_809140 - BLOCK
      ?auto_809141 - BLOCK
      ?auto_809142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809142 ) ( ON-TABLE ?auto_809125 ) ( ON ?auto_809126 ?auto_809125 ) ( ON ?auto_809127 ?auto_809126 ) ( ON ?auto_809128 ?auto_809127 ) ( ON ?auto_809129 ?auto_809128 ) ( ON ?auto_809130 ?auto_809129 ) ( ON ?auto_809131 ?auto_809130 ) ( ON ?auto_809132 ?auto_809131 ) ( ON ?auto_809133 ?auto_809132 ) ( ON ?auto_809134 ?auto_809133 ) ( ON ?auto_809135 ?auto_809134 ) ( ON ?auto_809136 ?auto_809135 ) ( not ( = ?auto_809125 ?auto_809126 ) ) ( not ( = ?auto_809125 ?auto_809127 ) ) ( not ( = ?auto_809125 ?auto_809128 ) ) ( not ( = ?auto_809125 ?auto_809129 ) ) ( not ( = ?auto_809125 ?auto_809130 ) ) ( not ( = ?auto_809125 ?auto_809131 ) ) ( not ( = ?auto_809125 ?auto_809132 ) ) ( not ( = ?auto_809125 ?auto_809133 ) ) ( not ( = ?auto_809125 ?auto_809134 ) ) ( not ( = ?auto_809125 ?auto_809135 ) ) ( not ( = ?auto_809125 ?auto_809136 ) ) ( not ( = ?auto_809125 ?auto_809137 ) ) ( not ( = ?auto_809125 ?auto_809138 ) ) ( not ( = ?auto_809125 ?auto_809139 ) ) ( not ( = ?auto_809125 ?auto_809140 ) ) ( not ( = ?auto_809125 ?auto_809141 ) ) ( not ( = ?auto_809125 ?auto_809142 ) ) ( not ( = ?auto_809126 ?auto_809127 ) ) ( not ( = ?auto_809126 ?auto_809128 ) ) ( not ( = ?auto_809126 ?auto_809129 ) ) ( not ( = ?auto_809126 ?auto_809130 ) ) ( not ( = ?auto_809126 ?auto_809131 ) ) ( not ( = ?auto_809126 ?auto_809132 ) ) ( not ( = ?auto_809126 ?auto_809133 ) ) ( not ( = ?auto_809126 ?auto_809134 ) ) ( not ( = ?auto_809126 ?auto_809135 ) ) ( not ( = ?auto_809126 ?auto_809136 ) ) ( not ( = ?auto_809126 ?auto_809137 ) ) ( not ( = ?auto_809126 ?auto_809138 ) ) ( not ( = ?auto_809126 ?auto_809139 ) ) ( not ( = ?auto_809126 ?auto_809140 ) ) ( not ( = ?auto_809126 ?auto_809141 ) ) ( not ( = ?auto_809126 ?auto_809142 ) ) ( not ( = ?auto_809127 ?auto_809128 ) ) ( not ( = ?auto_809127 ?auto_809129 ) ) ( not ( = ?auto_809127 ?auto_809130 ) ) ( not ( = ?auto_809127 ?auto_809131 ) ) ( not ( = ?auto_809127 ?auto_809132 ) ) ( not ( = ?auto_809127 ?auto_809133 ) ) ( not ( = ?auto_809127 ?auto_809134 ) ) ( not ( = ?auto_809127 ?auto_809135 ) ) ( not ( = ?auto_809127 ?auto_809136 ) ) ( not ( = ?auto_809127 ?auto_809137 ) ) ( not ( = ?auto_809127 ?auto_809138 ) ) ( not ( = ?auto_809127 ?auto_809139 ) ) ( not ( = ?auto_809127 ?auto_809140 ) ) ( not ( = ?auto_809127 ?auto_809141 ) ) ( not ( = ?auto_809127 ?auto_809142 ) ) ( not ( = ?auto_809128 ?auto_809129 ) ) ( not ( = ?auto_809128 ?auto_809130 ) ) ( not ( = ?auto_809128 ?auto_809131 ) ) ( not ( = ?auto_809128 ?auto_809132 ) ) ( not ( = ?auto_809128 ?auto_809133 ) ) ( not ( = ?auto_809128 ?auto_809134 ) ) ( not ( = ?auto_809128 ?auto_809135 ) ) ( not ( = ?auto_809128 ?auto_809136 ) ) ( not ( = ?auto_809128 ?auto_809137 ) ) ( not ( = ?auto_809128 ?auto_809138 ) ) ( not ( = ?auto_809128 ?auto_809139 ) ) ( not ( = ?auto_809128 ?auto_809140 ) ) ( not ( = ?auto_809128 ?auto_809141 ) ) ( not ( = ?auto_809128 ?auto_809142 ) ) ( not ( = ?auto_809129 ?auto_809130 ) ) ( not ( = ?auto_809129 ?auto_809131 ) ) ( not ( = ?auto_809129 ?auto_809132 ) ) ( not ( = ?auto_809129 ?auto_809133 ) ) ( not ( = ?auto_809129 ?auto_809134 ) ) ( not ( = ?auto_809129 ?auto_809135 ) ) ( not ( = ?auto_809129 ?auto_809136 ) ) ( not ( = ?auto_809129 ?auto_809137 ) ) ( not ( = ?auto_809129 ?auto_809138 ) ) ( not ( = ?auto_809129 ?auto_809139 ) ) ( not ( = ?auto_809129 ?auto_809140 ) ) ( not ( = ?auto_809129 ?auto_809141 ) ) ( not ( = ?auto_809129 ?auto_809142 ) ) ( not ( = ?auto_809130 ?auto_809131 ) ) ( not ( = ?auto_809130 ?auto_809132 ) ) ( not ( = ?auto_809130 ?auto_809133 ) ) ( not ( = ?auto_809130 ?auto_809134 ) ) ( not ( = ?auto_809130 ?auto_809135 ) ) ( not ( = ?auto_809130 ?auto_809136 ) ) ( not ( = ?auto_809130 ?auto_809137 ) ) ( not ( = ?auto_809130 ?auto_809138 ) ) ( not ( = ?auto_809130 ?auto_809139 ) ) ( not ( = ?auto_809130 ?auto_809140 ) ) ( not ( = ?auto_809130 ?auto_809141 ) ) ( not ( = ?auto_809130 ?auto_809142 ) ) ( not ( = ?auto_809131 ?auto_809132 ) ) ( not ( = ?auto_809131 ?auto_809133 ) ) ( not ( = ?auto_809131 ?auto_809134 ) ) ( not ( = ?auto_809131 ?auto_809135 ) ) ( not ( = ?auto_809131 ?auto_809136 ) ) ( not ( = ?auto_809131 ?auto_809137 ) ) ( not ( = ?auto_809131 ?auto_809138 ) ) ( not ( = ?auto_809131 ?auto_809139 ) ) ( not ( = ?auto_809131 ?auto_809140 ) ) ( not ( = ?auto_809131 ?auto_809141 ) ) ( not ( = ?auto_809131 ?auto_809142 ) ) ( not ( = ?auto_809132 ?auto_809133 ) ) ( not ( = ?auto_809132 ?auto_809134 ) ) ( not ( = ?auto_809132 ?auto_809135 ) ) ( not ( = ?auto_809132 ?auto_809136 ) ) ( not ( = ?auto_809132 ?auto_809137 ) ) ( not ( = ?auto_809132 ?auto_809138 ) ) ( not ( = ?auto_809132 ?auto_809139 ) ) ( not ( = ?auto_809132 ?auto_809140 ) ) ( not ( = ?auto_809132 ?auto_809141 ) ) ( not ( = ?auto_809132 ?auto_809142 ) ) ( not ( = ?auto_809133 ?auto_809134 ) ) ( not ( = ?auto_809133 ?auto_809135 ) ) ( not ( = ?auto_809133 ?auto_809136 ) ) ( not ( = ?auto_809133 ?auto_809137 ) ) ( not ( = ?auto_809133 ?auto_809138 ) ) ( not ( = ?auto_809133 ?auto_809139 ) ) ( not ( = ?auto_809133 ?auto_809140 ) ) ( not ( = ?auto_809133 ?auto_809141 ) ) ( not ( = ?auto_809133 ?auto_809142 ) ) ( not ( = ?auto_809134 ?auto_809135 ) ) ( not ( = ?auto_809134 ?auto_809136 ) ) ( not ( = ?auto_809134 ?auto_809137 ) ) ( not ( = ?auto_809134 ?auto_809138 ) ) ( not ( = ?auto_809134 ?auto_809139 ) ) ( not ( = ?auto_809134 ?auto_809140 ) ) ( not ( = ?auto_809134 ?auto_809141 ) ) ( not ( = ?auto_809134 ?auto_809142 ) ) ( not ( = ?auto_809135 ?auto_809136 ) ) ( not ( = ?auto_809135 ?auto_809137 ) ) ( not ( = ?auto_809135 ?auto_809138 ) ) ( not ( = ?auto_809135 ?auto_809139 ) ) ( not ( = ?auto_809135 ?auto_809140 ) ) ( not ( = ?auto_809135 ?auto_809141 ) ) ( not ( = ?auto_809135 ?auto_809142 ) ) ( not ( = ?auto_809136 ?auto_809137 ) ) ( not ( = ?auto_809136 ?auto_809138 ) ) ( not ( = ?auto_809136 ?auto_809139 ) ) ( not ( = ?auto_809136 ?auto_809140 ) ) ( not ( = ?auto_809136 ?auto_809141 ) ) ( not ( = ?auto_809136 ?auto_809142 ) ) ( not ( = ?auto_809137 ?auto_809138 ) ) ( not ( = ?auto_809137 ?auto_809139 ) ) ( not ( = ?auto_809137 ?auto_809140 ) ) ( not ( = ?auto_809137 ?auto_809141 ) ) ( not ( = ?auto_809137 ?auto_809142 ) ) ( not ( = ?auto_809138 ?auto_809139 ) ) ( not ( = ?auto_809138 ?auto_809140 ) ) ( not ( = ?auto_809138 ?auto_809141 ) ) ( not ( = ?auto_809138 ?auto_809142 ) ) ( not ( = ?auto_809139 ?auto_809140 ) ) ( not ( = ?auto_809139 ?auto_809141 ) ) ( not ( = ?auto_809139 ?auto_809142 ) ) ( not ( = ?auto_809140 ?auto_809141 ) ) ( not ( = ?auto_809140 ?auto_809142 ) ) ( not ( = ?auto_809141 ?auto_809142 ) ) ( ON ?auto_809141 ?auto_809142 ) ( ON ?auto_809140 ?auto_809141 ) ( ON ?auto_809139 ?auto_809140 ) ( ON ?auto_809138 ?auto_809139 ) ( CLEAR ?auto_809136 ) ( ON ?auto_809137 ?auto_809138 ) ( CLEAR ?auto_809137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_809125 ?auto_809126 ?auto_809127 ?auto_809128 ?auto_809129 ?auto_809130 ?auto_809131 ?auto_809132 ?auto_809133 ?auto_809134 ?auto_809135 ?auto_809136 ?auto_809137 )
      ( MAKE-18PILE ?auto_809125 ?auto_809126 ?auto_809127 ?auto_809128 ?auto_809129 ?auto_809130 ?auto_809131 ?auto_809132 ?auto_809133 ?auto_809134 ?auto_809135 ?auto_809136 ?auto_809137 ?auto_809138 ?auto_809139 ?auto_809140 ?auto_809141 ?auto_809142 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809161 - BLOCK
      ?auto_809162 - BLOCK
      ?auto_809163 - BLOCK
      ?auto_809164 - BLOCK
      ?auto_809165 - BLOCK
      ?auto_809166 - BLOCK
      ?auto_809167 - BLOCK
      ?auto_809168 - BLOCK
      ?auto_809169 - BLOCK
      ?auto_809170 - BLOCK
      ?auto_809171 - BLOCK
      ?auto_809172 - BLOCK
      ?auto_809173 - BLOCK
      ?auto_809174 - BLOCK
      ?auto_809175 - BLOCK
      ?auto_809176 - BLOCK
      ?auto_809177 - BLOCK
      ?auto_809178 - BLOCK
    )
    :vars
    (
      ?auto_809179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809178 ?auto_809179 ) ( ON-TABLE ?auto_809161 ) ( ON ?auto_809162 ?auto_809161 ) ( ON ?auto_809163 ?auto_809162 ) ( ON ?auto_809164 ?auto_809163 ) ( ON ?auto_809165 ?auto_809164 ) ( ON ?auto_809166 ?auto_809165 ) ( ON ?auto_809167 ?auto_809166 ) ( ON ?auto_809168 ?auto_809167 ) ( ON ?auto_809169 ?auto_809168 ) ( ON ?auto_809170 ?auto_809169 ) ( ON ?auto_809171 ?auto_809170 ) ( not ( = ?auto_809161 ?auto_809162 ) ) ( not ( = ?auto_809161 ?auto_809163 ) ) ( not ( = ?auto_809161 ?auto_809164 ) ) ( not ( = ?auto_809161 ?auto_809165 ) ) ( not ( = ?auto_809161 ?auto_809166 ) ) ( not ( = ?auto_809161 ?auto_809167 ) ) ( not ( = ?auto_809161 ?auto_809168 ) ) ( not ( = ?auto_809161 ?auto_809169 ) ) ( not ( = ?auto_809161 ?auto_809170 ) ) ( not ( = ?auto_809161 ?auto_809171 ) ) ( not ( = ?auto_809161 ?auto_809172 ) ) ( not ( = ?auto_809161 ?auto_809173 ) ) ( not ( = ?auto_809161 ?auto_809174 ) ) ( not ( = ?auto_809161 ?auto_809175 ) ) ( not ( = ?auto_809161 ?auto_809176 ) ) ( not ( = ?auto_809161 ?auto_809177 ) ) ( not ( = ?auto_809161 ?auto_809178 ) ) ( not ( = ?auto_809161 ?auto_809179 ) ) ( not ( = ?auto_809162 ?auto_809163 ) ) ( not ( = ?auto_809162 ?auto_809164 ) ) ( not ( = ?auto_809162 ?auto_809165 ) ) ( not ( = ?auto_809162 ?auto_809166 ) ) ( not ( = ?auto_809162 ?auto_809167 ) ) ( not ( = ?auto_809162 ?auto_809168 ) ) ( not ( = ?auto_809162 ?auto_809169 ) ) ( not ( = ?auto_809162 ?auto_809170 ) ) ( not ( = ?auto_809162 ?auto_809171 ) ) ( not ( = ?auto_809162 ?auto_809172 ) ) ( not ( = ?auto_809162 ?auto_809173 ) ) ( not ( = ?auto_809162 ?auto_809174 ) ) ( not ( = ?auto_809162 ?auto_809175 ) ) ( not ( = ?auto_809162 ?auto_809176 ) ) ( not ( = ?auto_809162 ?auto_809177 ) ) ( not ( = ?auto_809162 ?auto_809178 ) ) ( not ( = ?auto_809162 ?auto_809179 ) ) ( not ( = ?auto_809163 ?auto_809164 ) ) ( not ( = ?auto_809163 ?auto_809165 ) ) ( not ( = ?auto_809163 ?auto_809166 ) ) ( not ( = ?auto_809163 ?auto_809167 ) ) ( not ( = ?auto_809163 ?auto_809168 ) ) ( not ( = ?auto_809163 ?auto_809169 ) ) ( not ( = ?auto_809163 ?auto_809170 ) ) ( not ( = ?auto_809163 ?auto_809171 ) ) ( not ( = ?auto_809163 ?auto_809172 ) ) ( not ( = ?auto_809163 ?auto_809173 ) ) ( not ( = ?auto_809163 ?auto_809174 ) ) ( not ( = ?auto_809163 ?auto_809175 ) ) ( not ( = ?auto_809163 ?auto_809176 ) ) ( not ( = ?auto_809163 ?auto_809177 ) ) ( not ( = ?auto_809163 ?auto_809178 ) ) ( not ( = ?auto_809163 ?auto_809179 ) ) ( not ( = ?auto_809164 ?auto_809165 ) ) ( not ( = ?auto_809164 ?auto_809166 ) ) ( not ( = ?auto_809164 ?auto_809167 ) ) ( not ( = ?auto_809164 ?auto_809168 ) ) ( not ( = ?auto_809164 ?auto_809169 ) ) ( not ( = ?auto_809164 ?auto_809170 ) ) ( not ( = ?auto_809164 ?auto_809171 ) ) ( not ( = ?auto_809164 ?auto_809172 ) ) ( not ( = ?auto_809164 ?auto_809173 ) ) ( not ( = ?auto_809164 ?auto_809174 ) ) ( not ( = ?auto_809164 ?auto_809175 ) ) ( not ( = ?auto_809164 ?auto_809176 ) ) ( not ( = ?auto_809164 ?auto_809177 ) ) ( not ( = ?auto_809164 ?auto_809178 ) ) ( not ( = ?auto_809164 ?auto_809179 ) ) ( not ( = ?auto_809165 ?auto_809166 ) ) ( not ( = ?auto_809165 ?auto_809167 ) ) ( not ( = ?auto_809165 ?auto_809168 ) ) ( not ( = ?auto_809165 ?auto_809169 ) ) ( not ( = ?auto_809165 ?auto_809170 ) ) ( not ( = ?auto_809165 ?auto_809171 ) ) ( not ( = ?auto_809165 ?auto_809172 ) ) ( not ( = ?auto_809165 ?auto_809173 ) ) ( not ( = ?auto_809165 ?auto_809174 ) ) ( not ( = ?auto_809165 ?auto_809175 ) ) ( not ( = ?auto_809165 ?auto_809176 ) ) ( not ( = ?auto_809165 ?auto_809177 ) ) ( not ( = ?auto_809165 ?auto_809178 ) ) ( not ( = ?auto_809165 ?auto_809179 ) ) ( not ( = ?auto_809166 ?auto_809167 ) ) ( not ( = ?auto_809166 ?auto_809168 ) ) ( not ( = ?auto_809166 ?auto_809169 ) ) ( not ( = ?auto_809166 ?auto_809170 ) ) ( not ( = ?auto_809166 ?auto_809171 ) ) ( not ( = ?auto_809166 ?auto_809172 ) ) ( not ( = ?auto_809166 ?auto_809173 ) ) ( not ( = ?auto_809166 ?auto_809174 ) ) ( not ( = ?auto_809166 ?auto_809175 ) ) ( not ( = ?auto_809166 ?auto_809176 ) ) ( not ( = ?auto_809166 ?auto_809177 ) ) ( not ( = ?auto_809166 ?auto_809178 ) ) ( not ( = ?auto_809166 ?auto_809179 ) ) ( not ( = ?auto_809167 ?auto_809168 ) ) ( not ( = ?auto_809167 ?auto_809169 ) ) ( not ( = ?auto_809167 ?auto_809170 ) ) ( not ( = ?auto_809167 ?auto_809171 ) ) ( not ( = ?auto_809167 ?auto_809172 ) ) ( not ( = ?auto_809167 ?auto_809173 ) ) ( not ( = ?auto_809167 ?auto_809174 ) ) ( not ( = ?auto_809167 ?auto_809175 ) ) ( not ( = ?auto_809167 ?auto_809176 ) ) ( not ( = ?auto_809167 ?auto_809177 ) ) ( not ( = ?auto_809167 ?auto_809178 ) ) ( not ( = ?auto_809167 ?auto_809179 ) ) ( not ( = ?auto_809168 ?auto_809169 ) ) ( not ( = ?auto_809168 ?auto_809170 ) ) ( not ( = ?auto_809168 ?auto_809171 ) ) ( not ( = ?auto_809168 ?auto_809172 ) ) ( not ( = ?auto_809168 ?auto_809173 ) ) ( not ( = ?auto_809168 ?auto_809174 ) ) ( not ( = ?auto_809168 ?auto_809175 ) ) ( not ( = ?auto_809168 ?auto_809176 ) ) ( not ( = ?auto_809168 ?auto_809177 ) ) ( not ( = ?auto_809168 ?auto_809178 ) ) ( not ( = ?auto_809168 ?auto_809179 ) ) ( not ( = ?auto_809169 ?auto_809170 ) ) ( not ( = ?auto_809169 ?auto_809171 ) ) ( not ( = ?auto_809169 ?auto_809172 ) ) ( not ( = ?auto_809169 ?auto_809173 ) ) ( not ( = ?auto_809169 ?auto_809174 ) ) ( not ( = ?auto_809169 ?auto_809175 ) ) ( not ( = ?auto_809169 ?auto_809176 ) ) ( not ( = ?auto_809169 ?auto_809177 ) ) ( not ( = ?auto_809169 ?auto_809178 ) ) ( not ( = ?auto_809169 ?auto_809179 ) ) ( not ( = ?auto_809170 ?auto_809171 ) ) ( not ( = ?auto_809170 ?auto_809172 ) ) ( not ( = ?auto_809170 ?auto_809173 ) ) ( not ( = ?auto_809170 ?auto_809174 ) ) ( not ( = ?auto_809170 ?auto_809175 ) ) ( not ( = ?auto_809170 ?auto_809176 ) ) ( not ( = ?auto_809170 ?auto_809177 ) ) ( not ( = ?auto_809170 ?auto_809178 ) ) ( not ( = ?auto_809170 ?auto_809179 ) ) ( not ( = ?auto_809171 ?auto_809172 ) ) ( not ( = ?auto_809171 ?auto_809173 ) ) ( not ( = ?auto_809171 ?auto_809174 ) ) ( not ( = ?auto_809171 ?auto_809175 ) ) ( not ( = ?auto_809171 ?auto_809176 ) ) ( not ( = ?auto_809171 ?auto_809177 ) ) ( not ( = ?auto_809171 ?auto_809178 ) ) ( not ( = ?auto_809171 ?auto_809179 ) ) ( not ( = ?auto_809172 ?auto_809173 ) ) ( not ( = ?auto_809172 ?auto_809174 ) ) ( not ( = ?auto_809172 ?auto_809175 ) ) ( not ( = ?auto_809172 ?auto_809176 ) ) ( not ( = ?auto_809172 ?auto_809177 ) ) ( not ( = ?auto_809172 ?auto_809178 ) ) ( not ( = ?auto_809172 ?auto_809179 ) ) ( not ( = ?auto_809173 ?auto_809174 ) ) ( not ( = ?auto_809173 ?auto_809175 ) ) ( not ( = ?auto_809173 ?auto_809176 ) ) ( not ( = ?auto_809173 ?auto_809177 ) ) ( not ( = ?auto_809173 ?auto_809178 ) ) ( not ( = ?auto_809173 ?auto_809179 ) ) ( not ( = ?auto_809174 ?auto_809175 ) ) ( not ( = ?auto_809174 ?auto_809176 ) ) ( not ( = ?auto_809174 ?auto_809177 ) ) ( not ( = ?auto_809174 ?auto_809178 ) ) ( not ( = ?auto_809174 ?auto_809179 ) ) ( not ( = ?auto_809175 ?auto_809176 ) ) ( not ( = ?auto_809175 ?auto_809177 ) ) ( not ( = ?auto_809175 ?auto_809178 ) ) ( not ( = ?auto_809175 ?auto_809179 ) ) ( not ( = ?auto_809176 ?auto_809177 ) ) ( not ( = ?auto_809176 ?auto_809178 ) ) ( not ( = ?auto_809176 ?auto_809179 ) ) ( not ( = ?auto_809177 ?auto_809178 ) ) ( not ( = ?auto_809177 ?auto_809179 ) ) ( not ( = ?auto_809178 ?auto_809179 ) ) ( ON ?auto_809177 ?auto_809178 ) ( ON ?auto_809176 ?auto_809177 ) ( ON ?auto_809175 ?auto_809176 ) ( ON ?auto_809174 ?auto_809175 ) ( ON ?auto_809173 ?auto_809174 ) ( CLEAR ?auto_809171 ) ( ON ?auto_809172 ?auto_809173 ) ( CLEAR ?auto_809172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_809161 ?auto_809162 ?auto_809163 ?auto_809164 ?auto_809165 ?auto_809166 ?auto_809167 ?auto_809168 ?auto_809169 ?auto_809170 ?auto_809171 ?auto_809172 )
      ( MAKE-18PILE ?auto_809161 ?auto_809162 ?auto_809163 ?auto_809164 ?auto_809165 ?auto_809166 ?auto_809167 ?auto_809168 ?auto_809169 ?auto_809170 ?auto_809171 ?auto_809172 ?auto_809173 ?auto_809174 ?auto_809175 ?auto_809176 ?auto_809177 ?auto_809178 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809198 - BLOCK
      ?auto_809199 - BLOCK
      ?auto_809200 - BLOCK
      ?auto_809201 - BLOCK
      ?auto_809202 - BLOCK
      ?auto_809203 - BLOCK
      ?auto_809204 - BLOCK
      ?auto_809205 - BLOCK
      ?auto_809206 - BLOCK
      ?auto_809207 - BLOCK
      ?auto_809208 - BLOCK
      ?auto_809209 - BLOCK
      ?auto_809210 - BLOCK
      ?auto_809211 - BLOCK
      ?auto_809212 - BLOCK
      ?auto_809213 - BLOCK
      ?auto_809214 - BLOCK
      ?auto_809215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809215 ) ( ON-TABLE ?auto_809198 ) ( ON ?auto_809199 ?auto_809198 ) ( ON ?auto_809200 ?auto_809199 ) ( ON ?auto_809201 ?auto_809200 ) ( ON ?auto_809202 ?auto_809201 ) ( ON ?auto_809203 ?auto_809202 ) ( ON ?auto_809204 ?auto_809203 ) ( ON ?auto_809205 ?auto_809204 ) ( ON ?auto_809206 ?auto_809205 ) ( ON ?auto_809207 ?auto_809206 ) ( ON ?auto_809208 ?auto_809207 ) ( not ( = ?auto_809198 ?auto_809199 ) ) ( not ( = ?auto_809198 ?auto_809200 ) ) ( not ( = ?auto_809198 ?auto_809201 ) ) ( not ( = ?auto_809198 ?auto_809202 ) ) ( not ( = ?auto_809198 ?auto_809203 ) ) ( not ( = ?auto_809198 ?auto_809204 ) ) ( not ( = ?auto_809198 ?auto_809205 ) ) ( not ( = ?auto_809198 ?auto_809206 ) ) ( not ( = ?auto_809198 ?auto_809207 ) ) ( not ( = ?auto_809198 ?auto_809208 ) ) ( not ( = ?auto_809198 ?auto_809209 ) ) ( not ( = ?auto_809198 ?auto_809210 ) ) ( not ( = ?auto_809198 ?auto_809211 ) ) ( not ( = ?auto_809198 ?auto_809212 ) ) ( not ( = ?auto_809198 ?auto_809213 ) ) ( not ( = ?auto_809198 ?auto_809214 ) ) ( not ( = ?auto_809198 ?auto_809215 ) ) ( not ( = ?auto_809199 ?auto_809200 ) ) ( not ( = ?auto_809199 ?auto_809201 ) ) ( not ( = ?auto_809199 ?auto_809202 ) ) ( not ( = ?auto_809199 ?auto_809203 ) ) ( not ( = ?auto_809199 ?auto_809204 ) ) ( not ( = ?auto_809199 ?auto_809205 ) ) ( not ( = ?auto_809199 ?auto_809206 ) ) ( not ( = ?auto_809199 ?auto_809207 ) ) ( not ( = ?auto_809199 ?auto_809208 ) ) ( not ( = ?auto_809199 ?auto_809209 ) ) ( not ( = ?auto_809199 ?auto_809210 ) ) ( not ( = ?auto_809199 ?auto_809211 ) ) ( not ( = ?auto_809199 ?auto_809212 ) ) ( not ( = ?auto_809199 ?auto_809213 ) ) ( not ( = ?auto_809199 ?auto_809214 ) ) ( not ( = ?auto_809199 ?auto_809215 ) ) ( not ( = ?auto_809200 ?auto_809201 ) ) ( not ( = ?auto_809200 ?auto_809202 ) ) ( not ( = ?auto_809200 ?auto_809203 ) ) ( not ( = ?auto_809200 ?auto_809204 ) ) ( not ( = ?auto_809200 ?auto_809205 ) ) ( not ( = ?auto_809200 ?auto_809206 ) ) ( not ( = ?auto_809200 ?auto_809207 ) ) ( not ( = ?auto_809200 ?auto_809208 ) ) ( not ( = ?auto_809200 ?auto_809209 ) ) ( not ( = ?auto_809200 ?auto_809210 ) ) ( not ( = ?auto_809200 ?auto_809211 ) ) ( not ( = ?auto_809200 ?auto_809212 ) ) ( not ( = ?auto_809200 ?auto_809213 ) ) ( not ( = ?auto_809200 ?auto_809214 ) ) ( not ( = ?auto_809200 ?auto_809215 ) ) ( not ( = ?auto_809201 ?auto_809202 ) ) ( not ( = ?auto_809201 ?auto_809203 ) ) ( not ( = ?auto_809201 ?auto_809204 ) ) ( not ( = ?auto_809201 ?auto_809205 ) ) ( not ( = ?auto_809201 ?auto_809206 ) ) ( not ( = ?auto_809201 ?auto_809207 ) ) ( not ( = ?auto_809201 ?auto_809208 ) ) ( not ( = ?auto_809201 ?auto_809209 ) ) ( not ( = ?auto_809201 ?auto_809210 ) ) ( not ( = ?auto_809201 ?auto_809211 ) ) ( not ( = ?auto_809201 ?auto_809212 ) ) ( not ( = ?auto_809201 ?auto_809213 ) ) ( not ( = ?auto_809201 ?auto_809214 ) ) ( not ( = ?auto_809201 ?auto_809215 ) ) ( not ( = ?auto_809202 ?auto_809203 ) ) ( not ( = ?auto_809202 ?auto_809204 ) ) ( not ( = ?auto_809202 ?auto_809205 ) ) ( not ( = ?auto_809202 ?auto_809206 ) ) ( not ( = ?auto_809202 ?auto_809207 ) ) ( not ( = ?auto_809202 ?auto_809208 ) ) ( not ( = ?auto_809202 ?auto_809209 ) ) ( not ( = ?auto_809202 ?auto_809210 ) ) ( not ( = ?auto_809202 ?auto_809211 ) ) ( not ( = ?auto_809202 ?auto_809212 ) ) ( not ( = ?auto_809202 ?auto_809213 ) ) ( not ( = ?auto_809202 ?auto_809214 ) ) ( not ( = ?auto_809202 ?auto_809215 ) ) ( not ( = ?auto_809203 ?auto_809204 ) ) ( not ( = ?auto_809203 ?auto_809205 ) ) ( not ( = ?auto_809203 ?auto_809206 ) ) ( not ( = ?auto_809203 ?auto_809207 ) ) ( not ( = ?auto_809203 ?auto_809208 ) ) ( not ( = ?auto_809203 ?auto_809209 ) ) ( not ( = ?auto_809203 ?auto_809210 ) ) ( not ( = ?auto_809203 ?auto_809211 ) ) ( not ( = ?auto_809203 ?auto_809212 ) ) ( not ( = ?auto_809203 ?auto_809213 ) ) ( not ( = ?auto_809203 ?auto_809214 ) ) ( not ( = ?auto_809203 ?auto_809215 ) ) ( not ( = ?auto_809204 ?auto_809205 ) ) ( not ( = ?auto_809204 ?auto_809206 ) ) ( not ( = ?auto_809204 ?auto_809207 ) ) ( not ( = ?auto_809204 ?auto_809208 ) ) ( not ( = ?auto_809204 ?auto_809209 ) ) ( not ( = ?auto_809204 ?auto_809210 ) ) ( not ( = ?auto_809204 ?auto_809211 ) ) ( not ( = ?auto_809204 ?auto_809212 ) ) ( not ( = ?auto_809204 ?auto_809213 ) ) ( not ( = ?auto_809204 ?auto_809214 ) ) ( not ( = ?auto_809204 ?auto_809215 ) ) ( not ( = ?auto_809205 ?auto_809206 ) ) ( not ( = ?auto_809205 ?auto_809207 ) ) ( not ( = ?auto_809205 ?auto_809208 ) ) ( not ( = ?auto_809205 ?auto_809209 ) ) ( not ( = ?auto_809205 ?auto_809210 ) ) ( not ( = ?auto_809205 ?auto_809211 ) ) ( not ( = ?auto_809205 ?auto_809212 ) ) ( not ( = ?auto_809205 ?auto_809213 ) ) ( not ( = ?auto_809205 ?auto_809214 ) ) ( not ( = ?auto_809205 ?auto_809215 ) ) ( not ( = ?auto_809206 ?auto_809207 ) ) ( not ( = ?auto_809206 ?auto_809208 ) ) ( not ( = ?auto_809206 ?auto_809209 ) ) ( not ( = ?auto_809206 ?auto_809210 ) ) ( not ( = ?auto_809206 ?auto_809211 ) ) ( not ( = ?auto_809206 ?auto_809212 ) ) ( not ( = ?auto_809206 ?auto_809213 ) ) ( not ( = ?auto_809206 ?auto_809214 ) ) ( not ( = ?auto_809206 ?auto_809215 ) ) ( not ( = ?auto_809207 ?auto_809208 ) ) ( not ( = ?auto_809207 ?auto_809209 ) ) ( not ( = ?auto_809207 ?auto_809210 ) ) ( not ( = ?auto_809207 ?auto_809211 ) ) ( not ( = ?auto_809207 ?auto_809212 ) ) ( not ( = ?auto_809207 ?auto_809213 ) ) ( not ( = ?auto_809207 ?auto_809214 ) ) ( not ( = ?auto_809207 ?auto_809215 ) ) ( not ( = ?auto_809208 ?auto_809209 ) ) ( not ( = ?auto_809208 ?auto_809210 ) ) ( not ( = ?auto_809208 ?auto_809211 ) ) ( not ( = ?auto_809208 ?auto_809212 ) ) ( not ( = ?auto_809208 ?auto_809213 ) ) ( not ( = ?auto_809208 ?auto_809214 ) ) ( not ( = ?auto_809208 ?auto_809215 ) ) ( not ( = ?auto_809209 ?auto_809210 ) ) ( not ( = ?auto_809209 ?auto_809211 ) ) ( not ( = ?auto_809209 ?auto_809212 ) ) ( not ( = ?auto_809209 ?auto_809213 ) ) ( not ( = ?auto_809209 ?auto_809214 ) ) ( not ( = ?auto_809209 ?auto_809215 ) ) ( not ( = ?auto_809210 ?auto_809211 ) ) ( not ( = ?auto_809210 ?auto_809212 ) ) ( not ( = ?auto_809210 ?auto_809213 ) ) ( not ( = ?auto_809210 ?auto_809214 ) ) ( not ( = ?auto_809210 ?auto_809215 ) ) ( not ( = ?auto_809211 ?auto_809212 ) ) ( not ( = ?auto_809211 ?auto_809213 ) ) ( not ( = ?auto_809211 ?auto_809214 ) ) ( not ( = ?auto_809211 ?auto_809215 ) ) ( not ( = ?auto_809212 ?auto_809213 ) ) ( not ( = ?auto_809212 ?auto_809214 ) ) ( not ( = ?auto_809212 ?auto_809215 ) ) ( not ( = ?auto_809213 ?auto_809214 ) ) ( not ( = ?auto_809213 ?auto_809215 ) ) ( not ( = ?auto_809214 ?auto_809215 ) ) ( ON ?auto_809214 ?auto_809215 ) ( ON ?auto_809213 ?auto_809214 ) ( ON ?auto_809212 ?auto_809213 ) ( ON ?auto_809211 ?auto_809212 ) ( ON ?auto_809210 ?auto_809211 ) ( CLEAR ?auto_809208 ) ( ON ?auto_809209 ?auto_809210 ) ( CLEAR ?auto_809209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_809198 ?auto_809199 ?auto_809200 ?auto_809201 ?auto_809202 ?auto_809203 ?auto_809204 ?auto_809205 ?auto_809206 ?auto_809207 ?auto_809208 ?auto_809209 )
      ( MAKE-18PILE ?auto_809198 ?auto_809199 ?auto_809200 ?auto_809201 ?auto_809202 ?auto_809203 ?auto_809204 ?auto_809205 ?auto_809206 ?auto_809207 ?auto_809208 ?auto_809209 ?auto_809210 ?auto_809211 ?auto_809212 ?auto_809213 ?auto_809214 ?auto_809215 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809234 - BLOCK
      ?auto_809235 - BLOCK
      ?auto_809236 - BLOCK
      ?auto_809237 - BLOCK
      ?auto_809238 - BLOCK
      ?auto_809239 - BLOCK
      ?auto_809240 - BLOCK
      ?auto_809241 - BLOCK
      ?auto_809242 - BLOCK
      ?auto_809243 - BLOCK
      ?auto_809244 - BLOCK
      ?auto_809245 - BLOCK
      ?auto_809246 - BLOCK
      ?auto_809247 - BLOCK
      ?auto_809248 - BLOCK
      ?auto_809249 - BLOCK
      ?auto_809250 - BLOCK
      ?auto_809251 - BLOCK
    )
    :vars
    (
      ?auto_809252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809251 ?auto_809252 ) ( ON-TABLE ?auto_809234 ) ( ON ?auto_809235 ?auto_809234 ) ( ON ?auto_809236 ?auto_809235 ) ( ON ?auto_809237 ?auto_809236 ) ( ON ?auto_809238 ?auto_809237 ) ( ON ?auto_809239 ?auto_809238 ) ( ON ?auto_809240 ?auto_809239 ) ( ON ?auto_809241 ?auto_809240 ) ( ON ?auto_809242 ?auto_809241 ) ( ON ?auto_809243 ?auto_809242 ) ( not ( = ?auto_809234 ?auto_809235 ) ) ( not ( = ?auto_809234 ?auto_809236 ) ) ( not ( = ?auto_809234 ?auto_809237 ) ) ( not ( = ?auto_809234 ?auto_809238 ) ) ( not ( = ?auto_809234 ?auto_809239 ) ) ( not ( = ?auto_809234 ?auto_809240 ) ) ( not ( = ?auto_809234 ?auto_809241 ) ) ( not ( = ?auto_809234 ?auto_809242 ) ) ( not ( = ?auto_809234 ?auto_809243 ) ) ( not ( = ?auto_809234 ?auto_809244 ) ) ( not ( = ?auto_809234 ?auto_809245 ) ) ( not ( = ?auto_809234 ?auto_809246 ) ) ( not ( = ?auto_809234 ?auto_809247 ) ) ( not ( = ?auto_809234 ?auto_809248 ) ) ( not ( = ?auto_809234 ?auto_809249 ) ) ( not ( = ?auto_809234 ?auto_809250 ) ) ( not ( = ?auto_809234 ?auto_809251 ) ) ( not ( = ?auto_809234 ?auto_809252 ) ) ( not ( = ?auto_809235 ?auto_809236 ) ) ( not ( = ?auto_809235 ?auto_809237 ) ) ( not ( = ?auto_809235 ?auto_809238 ) ) ( not ( = ?auto_809235 ?auto_809239 ) ) ( not ( = ?auto_809235 ?auto_809240 ) ) ( not ( = ?auto_809235 ?auto_809241 ) ) ( not ( = ?auto_809235 ?auto_809242 ) ) ( not ( = ?auto_809235 ?auto_809243 ) ) ( not ( = ?auto_809235 ?auto_809244 ) ) ( not ( = ?auto_809235 ?auto_809245 ) ) ( not ( = ?auto_809235 ?auto_809246 ) ) ( not ( = ?auto_809235 ?auto_809247 ) ) ( not ( = ?auto_809235 ?auto_809248 ) ) ( not ( = ?auto_809235 ?auto_809249 ) ) ( not ( = ?auto_809235 ?auto_809250 ) ) ( not ( = ?auto_809235 ?auto_809251 ) ) ( not ( = ?auto_809235 ?auto_809252 ) ) ( not ( = ?auto_809236 ?auto_809237 ) ) ( not ( = ?auto_809236 ?auto_809238 ) ) ( not ( = ?auto_809236 ?auto_809239 ) ) ( not ( = ?auto_809236 ?auto_809240 ) ) ( not ( = ?auto_809236 ?auto_809241 ) ) ( not ( = ?auto_809236 ?auto_809242 ) ) ( not ( = ?auto_809236 ?auto_809243 ) ) ( not ( = ?auto_809236 ?auto_809244 ) ) ( not ( = ?auto_809236 ?auto_809245 ) ) ( not ( = ?auto_809236 ?auto_809246 ) ) ( not ( = ?auto_809236 ?auto_809247 ) ) ( not ( = ?auto_809236 ?auto_809248 ) ) ( not ( = ?auto_809236 ?auto_809249 ) ) ( not ( = ?auto_809236 ?auto_809250 ) ) ( not ( = ?auto_809236 ?auto_809251 ) ) ( not ( = ?auto_809236 ?auto_809252 ) ) ( not ( = ?auto_809237 ?auto_809238 ) ) ( not ( = ?auto_809237 ?auto_809239 ) ) ( not ( = ?auto_809237 ?auto_809240 ) ) ( not ( = ?auto_809237 ?auto_809241 ) ) ( not ( = ?auto_809237 ?auto_809242 ) ) ( not ( = ?auto_809237 ?auto_809243 ) ) ( not ( = ?auto_809237 ?auto_809244 ) ) ( not ( = ?auto_809237 ?auto_809245 ) ) ( not ( = ?auto_809237 ?auto_809246 ) ) ( not ( = ?auto_809237 ?auto_809247 ) ) ( not ( = ?auto_809237 ?auto_809248 ) ) ( not ( = ?auto_809237 ?auto_809249 ) ) ( not ( = ?auto_809237 ?auto_809250 ) ) ( not ( = ?auto_809237 ?auto_809251 ) ) ( not ( = ?auto_809237 ?auto_809252 ) ) ( not ( = ?auto_809238 ?auto_809239 ) ) ( not ( = ?auto_809238 ?auto_809240 ) ) ( not ( = ?auto_809238 ?auto_809241 ) ) ( not ( = ?auto_809238 ?auto_809242 ) ) ( not ( = ?auto_809238 ?auto_809243 ) ) ( not ( = ?auto_809238 ?auto_809244 ) ) ( not ( = ?auto_809238 ?auto_809245 ) ) ( not ( = ?auto_809238 ?auto_809246 ) ) ( not ( = ?auto_809238 ?auto_809247 ) ) ( not ( = ?auto_809238 ?auto_809248 ) ) ( not ( = ?auto_809238 ?auto_809249 ) ) ( not ( = ?auto_809238 ?auto_809250 ) ) ( not ( = ?auto_809238 ?auto_809251 ) ) ( not ( = ?auto_809238 ?auto_809252 ) ) ( not ( = ?auto_809239 ?auto_809240 ) ) ( not ( = ?auto_809239 ?auto_809241 ) ) ( not ( = ?auto_809239 ?auto_809242 ) ) ( not ( = ?auto_809239 ?auto_809243 ) ) ( not ( = ?auto_809239 ?auto_809244 ) ) ( not ( = ?auto_809239 ?auto_809245 ) ) ( not ( = ?auto_809239 ?auto_809246 ) ) ( not ( = ?auto_809239 ?auto_809247 ) ) ( not ( = ?auto_809239 ?auto_809248 ) ) ( not ( = ?auto_809239 ?auto_809249 ) ) ( not ( = ?auto_809239 ?auto_809250 ) ) ( not ( = ?auto_809239 ?auto_809251 ) ) ( not ( = ?auto_809239 ?auto_809252 ) ) ( not ( = ?auto_809240 ?auto_809241 ) ) ( not ( = ?auto_809240 ?auto_809242 ) ) ( not ( = ?auto_809240 ?auto_809243 ) ) ( not ( = ?auto_809240 ?auto_809244 ) ) ( not ( = ?auto_809240 ?auto_809245 ) ) ( not ( = ?auto_809240 ?auto_809246 ) ) ( not ( = ?auto_809240 ?auto_809247 ) ) ( not ( = ?auto_809240 ?auto_809248 ) ) ( not ( = ?auto_809240 ?auto_809249 ) ) ( not ( = ?auto_809240 ?auto_809250 ) ) ( not ( = ?auto_809240 ?auto_809251 ) ) ( not ( = ?auto_809240 ?auto_809252 ) ) ( not ( = ?auto_809241 ?auto_809242 ) ) ( not ( = ?auto_809241 ?auto_809243 ) ) ( not ( = ?auto_809241 ?auto_809244 ) ) ( not ( = ?auto_809241 ?auto_809245 ) ) ( not ( = ?auto_809241 ?auto_809246 ) ) ( not ( = ?auto_809241 ?auto_809247 ) ) ( not ( = ?auto_809241 ?auto_809248 ) ) ( not ( = ?auto_809241 ?auto_809249 ) ) ( not ( = ?auto_809241 ?auto_809250 ) ) ( not ( = ?auto_809241 ?auto_809251 ) ) ( not ( = ?auto_809241 ?auto_809252 ) ) ( not ( = ?auto_809242 ?auto_809243 ) ) ( not ( = ?auto_809242 ?auto_809244 ) ) ( not ( = ?auto_809242 ?auto_809245 ) ) ( not ( = ?auto_809242 ?auto_809246 ) ) ( not ( = ?auto_809242 ?auto_809247 ) ) ( not ( = ?auto_809242 ?auto_809248 ) ) ( not ( = ?auto_809242 ?auto_809249 ) ) ( not ( = ?auto_809242 ?auto_809250 ) ) ( not ( = ?auto_809242 ?auto_809251 ) ) ( not ( = ?auto_809242 ?auto_809252 ) ) ( not ( = ?auto_809243 ?auto_809244 ) ) ( not ( = ?auto_809243 ?auto_809245 ) ) ( not ( = ?auto_809243 ?auto_809246 ) ) ( not ( = ?auto_809243 ?auto_809247 ) ) ( not ( = ?auto_809243 ?auto_809248 ) ) ( not ( = ?auto_809243 ?auto_809249 ) ) ( not ( = ?auto_809243 ?auto_809250 ) ) ( not ( = ?auto_809243 ?auto_809251 ) ) ( not ( = ?auto_809243 ?auto_809252 ) ) ( not ( = ?auto_809244 ?auto_809245 ) ) ( not ( = ?auto_809244 ?auto_809246 ) ) ( not ( = ?auto_809244 ?auto_809247 ) ) ( not ( = ?auto_809244 ?auto_809248 ) ) ( not ( = ?auto_809244 ?auto_809249 ) ) ( not ( = ?auto_809244 ?auto_809250 ) ) ( not ( = ?auto_809244 ?auto_809251 ) ) ( not ( = ?auto_809244 ?auto_809252 ) ) ( not ( = ?auto_809245 ?auto_809246 ) ) ( not ( = ?auto_809245 ?auto_809247 ) ) ( not ( = ?auto_809245 ?auto_809248 ) ) ( not ( = ?auto_809245 ?auto_809249 ) ) ( not ( = ?auto_809245 ?auto_809250 ) ) ( not ( = ?auto_809245 ?auto_809251 ) ) ( not ( = ?auto_809245 ?auto_809252 ) ) ( not ( = ?auto_809246 ?auto_809247 ) ) ( not ( = ?auto_809246 ?auto_809248 ) ) ( not ( = ?auto_809246 ?auto_809249 ) ) ( not ( = ?auto_809246 ?auto_809250 ) ) ( not ( = ?auto_809246 ?auto_809251 ) ) ( not ( = ?auto_809246 ?auto_809252 ) ) ( not ( = ?auto_809247 ?auto_809248 ) ) ( not ( = ?auto_809247 ?auto_809249 ) ) ( not ( = ?auto_809247 ?auto_809250 ) ) ( not ( = ?auto_809247 ?auto_809251 ) ) ( not ( = ?auto_809247 ?auto_809252 ) ) ( not ( = ?auto_809248 ?auto_809249 ) ) ( not ( = ?auto_809248 ?auto_809250 ) ) ( not ( = ?auto_809248 ?auto_809251 ) ) ( not ( = ?auto_809248 ?auto_809252 ) ) ( not ( = ?auto_809249 ?auto_809250 ) ) ( not ( = ?auto_809249 ?auto_809251 ) ) ( not ( = ?auto_809249 ?auto_809252 ) ) ( not ( = ?auto_809250 ?auto_809251 ) ) ( not ( = ?auto_809250 ?auto_809252 ) ) ( not ( = ?auto_809251 ?auto_809252 ) ) ( ON ?auto_809250 ?auto_809251 ) ( ON ?auto_809249 ?auto_809250 ) ( ON ?auto_809248 ?auto_809249 ) ( ON ?auto_809247 ?auto_809248 ) ( ON ?auto_809246 ?auto_809247 ) ( ON ?auto_809245 ?auto_809246 ) ( CLEAR ?auto_809243 ) ( ON ?auto_809244 ?auto_809245 ) ( CLEAR ?auto_809244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_809234 ?auto_809235 ?auto_809236 ?auto_809237 ?auto_809238 ?auto_809239 ?auto_809240 ?auto_809241 ?auto_809242 ?auto_809243 ?auto_809244 )
      ( MAKE-18PILE ?auto_809234 ?auto_809235 ?auto_809236 ?auto_809237 ?auto_809238 ?auto_809239 ?auto_809240 ?auto_809241 ?auto_809242 ?auto_809243 ?auto_809244 ?auto_809245 ?auto_809246 ?auto_809247 ?auto_809248 ?auto_809249 ?auto_809250 ?auto_809251 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809271 - BLOCK
      ?auto_809272 - BLOCK
      ?auto_809273 - BLOCK
      ?auto_809274 - BLOCK
      ?auto_809275 - BLOCK
      ?auto_809276 - BLOCK
      ?auto_809277 - BLOCK
      ?auto_809278 - BLOCK
      ?auto_809279 - BLOCK
      ?auto_809280 - BLOCK
      ?auto_809281 - BLOCK
      ?auto_809282 - BLOCK
      ?auto_809283 - BLOCK
      ?auto_809284 - BLOCK
      ?auto_809285 - BLOCK
      ?auto_809286 - BLOCK
      ?auto_809287 - BLOCK
      ?auto_809288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809288 ) ( ON-TABLE ?auto_809271 ) ( ON ?auto_809272 ?auto_809271 ) ( ON ?auto_809273 ?auto_809272 ) ( ON ?auto_809274 ?auto_809273 ) ( ON ?auto_809275 ?auto_809274 ) ( ON ?auto_809276 ?auto_809275 ) ( ON ?auto_809277 ?auto_809276 ) ( ON ?auto_809278 ?auto_809277 ) ( ON ?auto_809279 ?auto_809278 ) ( ON ?auto_809280 ?auto_809279 ) ( not ( = ?auto_809271 ?auto_809272 ) ) ( not ( = ?auto_809271 ?auto_809273 ) ) ( not ( = ?auto_809271 ?auto_809274 ) ) ( not ( = ?auto_809271 ?auto_809275 ) ) ( not ( = ?auto_809271 ?auto_809276 ) ) ( not ( = ?auto_809271 ?auto_809277 ) ) ( not ( = ?auto_809271 ?auto_809278 ) ) ( not ( = ?auto_809271 ?auto_809279 ) ) ( not ( = ?auto_809271 ?auto_809280 ) ) ( not ( = ?auto_809271 ?auto_809281 ) ) ( not ( = ?auto_809271 ?auto_809282 ) ) ( not ( = ?auto_809271 ?auto_809283 ) ) ( not ( = ?auto_809271 ?auto_809284 ) ) ( not ( = ?auto_809271 ?auto_809285 ) ) ( not ( = ?auto_809271 ?auto_809286 ) ) ( not ( = ?auto_809271 ?auto_809287 ) ) ( not ( = ?auto_809271 ?auto_809288 ) ) ( not ( = ?auto_809272 ?auto_809273 ) ) ( not ( = ?auto_809272 ?auto_809274 ) ) ( not ( = ?auto_809272 ?auto_809275 ) ) ( not ( = ?auto_809272 ?auto_809276 ) ) ( not ( = ?auto_809272 ?auto_809277 ) ) ( not ( = ?auto_809272 ?auto_809278 ) ) ( not ( = ?auto_809272 ?auto_809279 ) ) ( not ( = ?auto_809272 ?auto_809280 ) ) ( not ( = ?auto_809272 ?auto_809281 ) ) ( not ( = ?auto_809272 ?auto_809282 ) ) ( not ( = ?auto_809272 ?auto_809283 ) ) ( not ( = ?auto_809272 ?auto_809284 ) ) ( not ( = ?auto_809272 ?auto_809285 ) ) ( not ( = ?auto_809272 ?auto_809286 ) ) ( not ( = ?auto_809272 ?auto_809287 ) ) ( not ( = ?auto_809272 ?auto_809288 ) ) ( not ( = ?auto_809273 ?auto_809274 ) ) ( not ( = ?auto_809273 ?auto_809275 ) ) ( not ( = ?auto_809273 ?auto_809276 ) ) ( not ( = ?auto_809273 ?auto_809277 ) ) ( not ( = ?auto_809273 ?auto_809278 ) ) ( not ( = ?auto_809273 ?auto_809279 ) ) ( not ( = ?auto_809273 ?auto_809280 ) ) ( not ( = ?auto_809273 ?auto_809281 ) ) ( not ( = ?auto_809273 ?auto_809282 ) ) ( not ( = ?auto_809273 ?auto_809283 ) ) ( not ( = ?auto_809273 ?auto_809284 ) ) ( not ( = ?auto_809273 ?auto_809285 ) ) ( not ( = ?auto_809273 ?auto_809286 ) ) ( not ( = ?auto_809273 ?auto_809287 ) ) ( not ( = ?auto_809273 ?auto_809288 ) ) ( not ( = ?auto_809274 ?auto_809275 ) ) ( not ( = ?auto_809274 ?auto_809276 ) ) ( not ( = ?auto_809274 ?auto_809277 ) ) ( not ( = ?auto_809274 ?auto_809278 ) ) ( not ( = ?auto_809274 ?auto_809279 ) ) ( not ( = ?auto_809274 ?auto_809280 ) ) ( not ( = ?auto_809274 ?auto_809281 ) ) ( not ( = ?auto_809274 ?auto_809282 ) ) ( not ( = ?auto_809274 ?auto_809283 ) ) ( not ( = ?auto_809274 ?auto_809284 ) ) ( not ( = ?auto_809274 ?auto_809285 ) ) ( not ( = ?auto_809274 ?auto_809286 ) ) ( not ( = ?auto_809274 ?auto_809287 ) ) ( not ( = ?auto_809274 ?auto_809288 ) ) ( not ( = ?auto_809275 ?auto_809276 ) ) ( not ( = ?auto_809275 ?auto_809277 ) ) ( not ( = ?auto_809275 ?auto_809278 ) ) ( not ( = ?auto_809275 ?auto_809279 ) ) ( not ( = ?auto_809275 ?auto_809280 ) ) ( not ( = ?auto_809275 ?auto_809281 ) ) ( not ( = ?auto_809275 ?auto_809282 ) ) ( not ( = ?auto_809275 ?auto_809283 ) ) ( not ( = ?auto_809275 ?auto_809284 ) ) ( not ( = ?auto_809275 ?auto_809285 ) ) ( not ( = ?auto_809275 ?auto_809286 ) ) ( not ( = ?auto_809275 ?auto_809287 ) ) ( not ( = ?auto_809275 ?auto_809288 ) ) ( not ( = ?auto_809276 ?auto_809277 ) ) ( not ( = ?auto_809276 ?auto_809278 ) ) ( not ( = ?auto_809276 ?auto_809279 ) ) ( not ( = ?auto_809276 ?auto_809280 ) ) ( not ( = ?auto_809276 ?auto_809281 ) ) ( not ( = ?auto_809276 ?auto_809282 ) ) ( not ( = ?auto_809276 ?auto_809283 ) ) ( not ( = ?auto_809276 ?auto_809284 ) ) ( not ( = ?auto_809276 ?auto_809285 ) ) ( not ( = ?auto_809276 ?auto_809286 ) ) ( not ( = ?auto_809276 ?auto_809287 ) ) ( not ( = ?auto_809276 ?auto_809288 ) ) ( not ( = ?auto_809277 ?auto_809278 ) ) ( not ( = ?auto_809277 ?auto_809279 ) ) ( not ( = ?auto_809277 ?auto_809280 ) ) ( not ( = ?auto_809277 ?auto_809281 ) ) ( not ( = ?auto_809277 ?auto_809282 ) ) ( not ( = ?auto_809277 ?auto_809283 ) ) ( not ( = ?auto_809277 ?auto_809284 ) ) ( not ( = ?auto_809277 ?auto_809285 ) ) ( not ( = ?auto_809277 ?auto_809286 ) ) ( not ( = ?auto_809277 ?auto_809287 ) ) ( not ( = ?auto_809277 ?auto_809288 ) ) ( not ( = ?auto_809278 ?auto_809279 ) ) ( not ( = ?auto_809278 ?auto_809280 ) ) ( not ( = ?auto_809278 ?auto_809281 ) ) ( not ( = ?auto_809278 ?auto_809282 ) ) ( not ( = ?auto_809278 ?auto_809283 ) ) ( not ( = ?auto_809278 ?auto_809284 ) ) ( not ( = ?auto_809278 ?auto_809285 ) ) ( not ( = ?auto_809278 ?auto_809286 ) ) ( not ( = ?auto_809278 ?auto_809287 ) ) ( not ( = ?auto_809278 ?auto_809288 ) ) ( not ( = ?auto_809279 ?auto_809280 ) ) ( not ( = ?auto_809279 ?auto_809281 ) ) ( not ( = ?auto_809279 ?auto_809282 ) ) ( not ( = ?auto_809279 ?auto_809283 ) ) ( not ( = ?auto_809279 ?auto_809284 ) ) ( not ( = ?auto_809279 ?auto_809285 ) ) ( not ( = ?auto_809279 ?auto_809286 ) ) ( not ( = ?auto_809279 ?auto_809287 ) ) ( not ( = ?auto_809279 ?auto_809288 ) ) ( not ( = ?auto_809280 ?auto_809281 ) ) ( not ( = ?auto_809280 ?auto_809282 ) ) ( not ( = ?auto_809280 ?auto_809283 ) ) ( not ( = ?auto_809280 ?auto_809284 ) ) ( not ( = ?auto_809280 ?auto_809285 ) ) ( not ( = ?auto_809280 ?auto_809286 ) ) ( not ( = ?auto_809280 ?auto_809287 ) ) ( not ( = ?auto_809280 ?auto_809288 ) ) ( not ( = ?auto_809281 ?auto_809282 ) ) ( not ( = ?auto_809281 ?auto_809283 ) ) ( not ( = ?auto_809281 ?auto_809284 ) ) ( not ( = ?auto_809281 ?auto_809285 ) ) ( not ( = ?auto_809281 ?auto_809286 ) ) ( not ( = ?auto_809281 ?auto_809287 ) ) ( not ( = ?auto_809281 ?auto_809288 ) ) ( not ( = ?auto_809282 ?auto_809283 ) ) ( not ( = ?auto_809282 ?auto_809284 ) ) ( not ( = ?auto_809282 ?auto_809285 ) ) ( not ( = ?auto_809282 ?auto_809286 ) ) ( not ( = ?auto_809282 ?auto_809287 ) ) ( not ( = ?auto_809282 ?auto_809288 ) ) ( not ( = ?auto_809283 ?auto_809284 ) ) ( not ( = ?auto_809283 ?auto_809285 ) ) ( not ( = ?auto_809283 ?auto_809286 ) ) ( not ( = ?auto_809283 ?auto_809287 ) ) ( not ( = ?auto_809283 ?auto_809288 ) ) ( not ( = ?auto_809284 ?auto_809285 ) ) ( not ( = ?auto_809284 ?auto_809286 ) ) ( not ( = ?auto_809284 ?auto_809287 ) ) ( not ( = ?auto_809284 ?auto_809288 ) ) ( not ( = ?auto_809285 ?auto_809286 ) ) ( not ( = ?auto_809285 ?auto_809287 ) ) ( not ( = ?auto_809285 ?auto_809288 ) ) ( not ( = ?auto_809286 ?auto_809287 ) ) ( not ( = ?auto_809286 ?auto_809288 ) ) ( not ( = ?auto_809287 ?auto_809288 ) ) ( ON ?auto_809287 ?auto_809288 ) ( ON ?auto_809286 ?auto_809287 ) ( ON ?auto_809285 ?auto_809286 ) ( ON ?auto_809284 ?auto_809285 ) ( ON ?auto_809283 ?auto_809284 ) ( ON ?auto_809282 ?auto_809283 ) ( CLEAR ?auto_809280 ) ( ON ?auto_809281 ?auto_809282 ) ( CLEAR ?auto_809281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_809271 ?auto_809272 ?auto_809273 ?auto_809274 ?auto_809275 ?auto_809276 ?auto_809277 ?auto_809278 ?auto_809279 ?auto_809280 ?auto_809281 )
      ( MAKE-18PILE ?auto_809271 ?auto_809272 ?auto_809273 ?auto_809274 ?auto_809275 ?auto_809276 ?auto_809277 ?auto_809278 ?auto_809279 ?auto_809280 ?auto_809281 ?auto_809282 ?auto_809283 ?auto_809284 ?auto_809285 ?auto_809286 ?auto_809287 ?auto_809288 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809307 - BLOCK
      ?auto_809308 - BLOCK
      ?auto_809309 - BLOCK
      ?auto_809310 - BLOCK
      ?auto_809311 - BLOCK
      ?auto_809312 - BLOCK
      ?auto_809313 - BLOCK
      ?auto_809314 - BLOCK
      ?auto_809315 - BLOCK
      ?auto_809316 - BLOCK
      ?auto_809317 - BLOCK
      ?auto_809318 - BLOCK
      ?auto_809319 - BLOCK
      ?auto_809320 - BLOCK
      ?auto_809321 - BLOCK
      ?auto_809322 - BLOCK
      ?auto_809323 - BLOCK
      ?auto_809324 - BLOCK
    )
    :vars
    (
      ?auto_809325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809324 ?auto_809325 ) ( ON-TABLE ?auto_809307 ) ( ON ?auto_809308 ?auto_809307 ) ( ON ?auto_809309 ?auto_809308 ) ( ON ?auto_809310 ?auto_809309 ) ( ON ?auto_809311 ?auto_809310 ) ( ON ?auto_809312 ?auto_809311 ) ( ON ?auto_809313 ?auto_809312 ) ( ON ?auto_809314 ?auto_809313 ) ( ON ?auto_809315 ?auto_809314 ) ( not ( = ?auto_809307 ?auto_809308 ) ) ( not ( = ?auto_809307 ?auto_809309 ) ) ( not ( = ?auto_809307 ?auto_809310 ) ) ( not ( = ?auto_809307 ?auto_809311 ) ) ( not ( = ?auto_809307 ?auto_809312 ) ) ( not ( = ?auto_809307 ?auto_809313 ) ) ( not ( = ?auto_809307 ?auto_809314 ) ) ( not ( = ?auto_809307 ?auto_809315 ) ) ( not ( = ?auto_809307 ?auto_809316 ) ) ( not ( = ?auto_809307 ?auto_809317 ) ) ( not ( = ?auto_809307 ?auto_809318 ) ) ( not ( = ?auto_809307 ?auto_809319 ) ) ( not ( = ?auto_809307 ?auto_809320 ) ) ( not ( = ?auto_809307 ?auto_809321 ) ) ( not ( = ?auto_809307 ?auto_809322 ) ) ( not ( = ?auto_809307 ?auto_809323 ) ) ( not ( = ?auto_809307 ?auto_809324 ) ) ( not ( = ?auto_809307 ?auto_809325 ) ) ( not ( = ?auto_809308 ?auto_809309 ) ) ( not ( = ?auto_809308 ?auto_809310 ) ) ( not ( = ?auto_809308 ?auto_809311 ) ) ( not ( = ?auto_809308 ?auto_809312 ) ) ( not ( = ?auto_809308 ?auto_809313 ) ) ( not ( = ?auto_809308 ?auto_809314 ) ) ( not ( = ?auto_809308 ?auto_809315 ) ) ( not ( = ?auto_809308 ?auto_809316 ) ) ( not ( = ?auto_809308 ?auto_809317 ) ) ( not ( = ?auto_809308 ?auto_809318 ) ) ( not ( = ?auto_809308 ?auto_809319 ) ) ( not ( = ?auto_809308 ?auto_809320 ) ) ( not ( = ?auto_809308 ?auto_809321 ) ) ( not ( = ?auto_809308 ?auto_809322 ) ) ( not ( = ?auto_809308 ?auto_809323 ) ) ( not ( = ?auto_809308 ?auto_809324 ) ) ( not ( = ?auto_809308 ?auto_809325 ) ) ( not ( = ?auto_809309 ?auto_809310 ) ) ( not ( = ?auto_809309 ?auto_809311 ) ) ( not ( = ?auto_809309 ?auto_809312 ) ) ( not ( = ?auto_809309 ?auto_809313 ) ) ( not ( = ?auto_809309 ?auto_809314 ) ) ( not ( = ?auto_809309 ?auto_809315 ) ) ( not ( = ?auto_809309 ?auto_809316 ) ) ( not ( = ?auto_809309 ?auto_809317 ) ) ( not ( = ?auto_809309 ?auto_809318 ) ) ( not ( = ?auto_809309 ?auto_809319 ) ) ( not ( = ?auto_809309 ?auto_809320 ) ) ( not ( = ?auto_809309 ?auto_809321 ) ) ( not ( = ?auto_809309 ?auto_809322 ) ) ( not ( = ?auto_809309 ?auto_809323 ) ) ( not ( = ?auto_809309 ?auto_809324 ) ) ( not ( = ?auto_809309 ?auto_809325 ) ) ( not ( = ?auto_809310 ?auto_809311 ) ) ( not ( = ?auto_809310 ?auto_809312 ) ) ( not ( = ?auto_809310 ?auto_809313 ) ) ( not ( = ?auto_809310 ?auto_809314 ) ) ( not ( = ?auto_809310 ?auto_809315 ) ) ( not ( = ?auto_809310 ?auto_809316 ) ) ( not ( = ?auto_809310 ?auto_809317 ) ) ( not ( = ?auto_809310 ?auto_809318 ) ) ( not ( = ?auto_809310 ?auto_809319 ) ) ( not ( = ?auto_809310 ?auto_809320 ) ) ( not ( = ?auto_809310 ?auto_809321 ) ) ( not ( = ?auto_809310 ?auto_809322 ) ) ( not ( = ?auto_809310 ?auto_809323 ) ) ( not ( = ?auto_809310 ?auto_809324 ) ) ( not ( = ?auto_809310 ?auto_809325 ) ) ( not ( = ?auto_809311 ?auto_809312 ) ) ( not ( = ?auto_809311 ?auto_809313 ) ) ( not ( = ?auto_809311 ?auto_809314 ) ) ( not ( = ?auto_809311 ?auto_809315 ) ) ( not ( = ?auto_809311 ?auto_809316 ) ) ( not ( = ?auto_809311 ?auto_809317 ) ) ( not ( = ?auto_809311 ?auto_809318 ) ) ( not ( = ?auto_809311 ?auto_809319 ) ) ( not ( = ?auto_809311 ?auto_809320 ) ) ( not ( = ?auto_809311 ?auto_809321 ) ) ( not ( = ?auto_809311 ?auto_809322 ) ) ( not ( = ?auto_809311 ?auto_809323 ) ) ( not ( = ?auto_809311 ?auto_809324 ) ) ( not ( = ?auto_809311 ?auto_809325 ) ) ( not ( = ?auto_809312 ?auto_809313 ) ) ( not ( = ?auto_809312 ?auto_809314 ) ) ( not ( = ?auto_809312 ?auto_809315 ) ) ( not ( = ?auto_809312 ?auto_809316 ) ) ( not ( = ?auto_809312 ?auto_809317 ) ) ( not ( = ?auto_809312 ?auto_809318 ) ) ( not ( = ?auto_809312 ?auto_809319 ) ) ( not ( = ?auto_809312 ?auto_809320 ) ) ( not ( = ?auto_809312 ?auto_809321 ) ) ( not ( = ?auto_809312 ?auto_809322 ) ) ( not ( = ?auto_809312 ?auto_809323 ) ) ( not ( = ?auto_809312 ?auto_809324 ) ) ( not ( = ?auto_809312 ?auto_809325 ) ) ( not ( = ?auto_809313 ?auto_809314 ) ) ( not ( = ?auto_809313 ?auto_809315 ) ) ( not ( = ?auto_809313 ?auto_809316 ) ) ( not ( = ?auto_809313 ?auto_809317 ) ) ( not ( = ?auto_809313 ?auto_809318 ) ) ( not ( = ?auto_809313 ?auto_809319 ) ) ( not ( = ?auto_809313 ?auto_809320 ) ) ( not ( = ?auto_809313 ?auto_809321 ) ) ( not ( = ?auto_809313 ?auto_809322 ) ) ( not ( = ?auto_809313 ?auto_809323 ) ) ( not ( = ?auto_809313 ?auto_809324 ) ) ( not ( = ?auto_809313 ?auto_809325 ) ) ( not ( = ?auto_809314 ?auto_809315 ) ) ( not ( = ?auto_809314 ?auto_809316 ) ) ( not ( = ?auto_809314 ?auto_809317 ) ) ( not ( = ?auto_809314 ?auto_809318 ) ) ( not ( = ?auto_809314 ?auto_809319 ) ) ( not ( = ?auto_809314 ?auto_809320 ) ) ( not ( = ?auto_809314 ?auto_809321 ) ) ( not ( = ?auto_809314 ?auto_809322 ) ) ( not ( = ?auto_809314 ?auto_809323 ) ) ( not ( = ?auto_809314 ?auto_809324 ) ) ( not ( = ?auto_809314 ?auto_809325 ) ) ( not ( = ?auto_809315 ?auto_809316 ) ) ( not ( = ?auto_809315 ?auto_809317 ) ) ( not ( = ?auto_809315 ?auto_809318 ) ) ( not ( = ?auto_809315 ?auto_809319 ) ) ( not ( = ?auto_809315 ?auto_809320 ) ) ( not ( = ?auto_809315 ?auto_809321 ) ) ( not ( = ?auto_809315 ?auto_809322 ) ) ( not ( = ?auto_809315 ?auto_809323 ) ) ( not ( = ?auto_809315 ?auto_809324 ) ) ( not ( = ?auto_809315 ?auto_809325 ) ) ( not ( = ?auto_809316 ?auto_809317 ) ) ( not ( = ?auto_809316 ?auto_809318 ) ) ( not ( = ?auto_809316 ?auto_809319 ) ) ( not ( = ?auto_809316 ?auto_809320 ) ) ( not ( = ?auto_809316 ?auto_809321 ) ) ( not ( = ?auto_809316 ?auto_809322 ) ) ( not ( = ?auto_809316 ?auto_809323 ) ) ( not ( = ?auto_809316 ?auto_809324 ) ) ( not ( = ?auto_809316 ?auto_809325 ) ) ( not ( = ?auto_809317 ?auto_809318 ) ) ( not ( = ?auto_809317 ?auto_809319 ) ) ( not ( = ?auto_809317 ?auto_809320 ) ) ( not ( = ?auto_809317 ?auto_809321 ) ) ( not ( = ?auto_809317 ?auto_809322 ) ) ( not ( = ?auto_809317 ?auto_809323 ) ) ( not ( = ?auto_809317 ?auto_809324 ) ) ( not ( = ?auto_809317 ?auto_809325 ) ) ( not ( = ?auto_809318 ?auto_809319 ) ) ( not ( = ?auto_809318 ?auto_809320 ) ) ( not ( = ?auto_809318 ?auto_809321 ) ) ( not ( = ?auto_809318 ?auto_809322 ) ) ( not ( = ?auto_809318 ?auto_809323 ) ) ( not ( = ?auto_809318 ?auto_809324 ) ) ( not ( = ?auto_809318 ?auto_809325 ) ) ( not ( = ?auto_809319 ?auto_809320 ) ) ( not ( = ?auto_809319 ?auto_809321 ) ) ( not ( = ?auto_809319 ?auto_809322 ) ) ( not ( = ?auto_809319 ?auto_809323 ) ) ( not ( = ?auto_809319 ?auto_809324 ) ) ( not ( = ?auto_809319 ?auto_809325 ) ) ( not ( = ?auto_809320 ?auto_809321 ) ) ( not ( = ?auto_809320 ?auto_809322 ) ) ( not ( = ?auto_809320 ?auto_809323 ) ) ( not ( = ?auto_809320 ?auto_809324 ) ) ( not ( = ?auto_809320 ?auto_809325 ) ) ( not ( = ?auto_809321 ?auto_809322 ) ) ( not ( = ?auto_809321 ?auto_809323 ) ) ( not ( = ?auto_809321 ?auto_809324 ) ) ( not ( = ?auto_809321 ?auto_809325 ) ) ( not ( = ?auto_809322 ?auto_809323 ) ) ( not ( = ?auto_809322 ?auto_809324 ) ) ( not ( = ?auto_809322 ?auto_809325 ) ) ( not ( = ?auto_809323 ?auto_809324 ) ) ( not ( = ?auto_809323 ?auto_809325 ) ) ( not ( = ?auto_809324 ?auto_809325 ) ) ( ON ?auto_809323 ?auto_809324 ) ( ON ?auto_809322 ?auto_809323 ) ( ON ?auto_809321 ?auto_809322 ) ( ON ?auto_809320 ?auto_809321 ) ( ON ?auto_809319 ?auto_809320 ) ( ON ?auto_809318 ?auto_809319 ) ( ON ?auto_809317 ?auto_809318 ) ( CLEAR ?auto_809315 ) ( ON ?auto_809316 ?auto_809317 ) ( CLEAR ?auto_809316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_809307 ?auto_809308 ?auto_809309 ?auto_809310 ?auto_809311 ?auto_809312 ?auto_809313 ?auto_809314 ?auto_809315 ?auto_809316 )
      ( MAKE-18PILE ?auto_809307 ?auto_809308 ?auto_809309 ?auto_809310 ?auto_809311 ?auto_809312 ?auto_809313 ?auto_809314 ?auto_809315 ?auto_809316 ?auto_809317 ?auto_809318 ?auto_809319 ?auto_809320 ?auto_809321 ?auto_809322 ?auto_809323 ?auto_809324 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809344 - BLOCK
      ?auto_809345 - BLOCK
      ?auto_809346 - BLOCK
      ?auto_809347 - BLOCK
      ?auto_809348 - BLOCK
      ?auto_809349 - BLOCK
      ?auto_809350 - BLOCK
      ?auto_809351 - BLOCK
      ?auto_809352 - BLOCK
      ?auto_809353 - BLOCK
      ?auto_809354 - BLOCK
      ?auto_809355 - BLOCK
      ?auto_809356 - BLOCK
      ?auto_809357 - BLOCK
      ?auto_809358 - BLOCK
      ?auto_809359 - BLOCK
      ?auto_809360 - BLOCK
      ?auto_809361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809361 ) ( ON-TABLE ?auto_809344 ) ( ON ?auto_809345 ?auto_809344 ) ( ON ?auto_809346 ?auto_809345 ) ( ON ?auto_809347 ?auto_809346 ) ( ON ?auto_809348 ?auto_809347 ) ( ON ?auto_809349 ?auto_809348 ) ( ON ?auto_809350 ?auto_809349 ) ( ON ?auto_809351 ?auto_809350 ) ( ON ?auto_809352 ?auto_809351 ) ( not ( = ?auto_809344 ?auto_809345 ) ) ( not ( = ?auto_809344 ?auto_809346 ) ) ( not ( = ?auto_809344 ?auto_809347 ) ) ( not ( = ?auto_809344 ?auto_809348 ) ) ( not ( = ?auto_809344 ?auto_809349 ) ) ( not ( = ?auto_809344 ?auto_809350 ) ) ( not ( = ?auto_809344 ?auto_809351 ) ) ( not ( = ?auto_809344 ?auto_809352 ) ) ( not ( = ?auto_809344 ?auto_809353 ) ) ( not ( = ?auto_809344 ?auto_809354 ) ) ( not ( = ?auto_809344 ?auto_809355 ) ) ( not ( = ?auto_809344 ?auto_809356 ) ) ( not ( = ?auto_809344 ?auto_809357 ) ) ( not ( = ?auto_809344 ?auto_809358 ) ) ( not ( = ?auto_809344 ?auto_809359 ) ) ( not ( = ?auto_809344 ?auto_809360 ) ) ( not ( = ?auto_809344 ?auto_809361 ) ) ( not ( = ?auto_809345 ?auto_809346 ) ) ( not ( = ?auto_809345 ?auto_809347 ) ) ( not ( = ?auto_809345 ?auto_809348 ) ) ( not ( = ?auto_809345 ?auto_809349 ) ) ( not ( = ?auto_809345 ?auto_809350 ) ) ( not ( = ?auto_809345 ?auto_809351 ) ) ( not ( = ?auto_809345 ?auto_809352 ) ) ( not ( = ?auto_809345 ?auto_809353 ) ) ( not ( = ?auto_809345 ?auto_809354 ) ) ( not ( = ?auto_809345 ?auto_809355 ) ) ( not ( = ?auto_809345 ?auto_809356 ) ) ( not ( = ?auto_809345 ?auto_809357 ) ) ( not ( = ?auto_809345 ?auto_809358 ) ) ( not ( = ?auto_809345 ?auto_809359 ) ) ( not ( = ?auto_809345 ?auto_809360 ) ) ( not ( = ?auto_809345 ?auto_809361 ) ) ( not ( = ?auto_809346 ?auto_809347 ) ) ( not ( = ?auto_809346 ?auto_809348 ) ) ( not ( = ?auto_809346 ?auto_809349 ) ) ( not ( = ?auto_809346 ?auto_809350 ) ) ( not ( = ?auto_809346 ?auto_809351 ) ) ( not ( = ?auto_809346 ?auto_809352 ) ) ( not ( = ?auto_809346 ?auto_809353 ) ) ( not ( = ?auto_809346 ?auto_809354 ) ) ( not ( = ?auto_809346 ?auto_809355 ) ) ( not ( = ?auto_809346 ?auto_809356 ) ) ( not ( = ?auto_809346 ?auto_809357 ) ) ( not ( = ?auto_809346 ?auto_809358 ) ) ( not ( = ?auto_809346 ?auto_809359 ) ) ( not ( = ?auto_809346 ?auto_809360 ) ) ( not ( = ?auto_809346 ?auto_809361 ) ) ( not ( = ?auto_809347 ?auto_809348 ) ) ( not ( = ?auto_809347 ?auto_809349 ) ) ( not ( = ?auto_809347 ?auto_809350 ) ) ( not ( = ?auto_809347 ?auto_809351 ) ) ( not ( = ?auto_809347 ?auto_809352 ) ) ( not ( = ?auto_809347 ?auto_809353 ) ) ( not ( = ?auto_809347 ?auto_809354 ) ) ( not ( = ?auto_809347 ?auto_809355 ) ) ( not ( = ?auto_809347 ?auto_809356 ) ) ( not ( = ?auto_809347 ?auto_809357 ) ) ( not ( = ?auto_809347 ?auto_809358 ) ) ( not ( = ?auto_809347 ?auto_809359 ) ) ( not ( = ?auto_809347 ?auto_809360 ) ) ( not ( = ?auto_809347 ?auto_809361 ) ) ( not ( = ?auto_809348 ?auto_809349 ) ) ( not ( = ?auto_809348 ?auto_809350 ) ) ( not ( = ?auto_809348 ?auto_809351 ) ) ( not ( = ?auto_809348 ?auto_809352 ) ) ( not ( = ?auto_809348 ?auto_809353 ) ) ( not ( = ?auto_809348 ?auto_809354 ) ) ( not ( = ?auto_809348 ?auto_809355 ) ) ( not ( = ?auto_809348 ?auto_809356 ) ) ( not ( = ?auto_809348 ?auto_809357 ) ) ( not ( = ?auto_809348 ?auto_809358 ) ) ( not ( = ?auto_809348 ?auto_809359 ) ) ( not ( = ?auto_809348 ?auto_809360 ) ) ( not ( = ?auto_809348 ?auto_809361 ) ) ( not ( = ?auto_809349 ?auto_809350 ) ) ( not ( = ?auto_809349 ?auto_809351 ) ) ( not ( = ?auto_809349 ?auto_809352 ) ) ( not ( = ?auto_809349 ?auto_809353 ) ) ( not ( = ?auto_809349 ?auto_809354 ) ) ( not ( = ?auto_809349 ?auto_809355 ) ) ( not ( = ?auto_809349 ?auto_809356 ) ) ( not ( = ?auto_809349 ?auto_809357 ) ) ( not ( = ?auto_809349 ?auto_809358 ) ) ( not ( = ?auto_809349 ?auto_809359 ) ) ( not ( = ?auto_809349 ?auto_809360 ) ) ( not ( = ?auto_809349 ?auto_809361 ) ) ( not ( = ?auto_809350 ?auto_809351 ) ) ( not ( = ?auto_809350 ?auto_809352 ) ) ( not ( = ?auto_809350 ?auto_809353 ) ) ( not ( = ?auto_809350 ?auto_809354 ) ) ( not ( = ?auto_809350 ?auto_809355 ) ) ( not ( = ?auto_809350 ?auto_809356 ) ) ( not ( = ?auto_809350 ?auto_809357 ) ) ( not ( = ?auto_809350 ?auto_809358 ) ) ( not ( = ?auto_809350 ?auto_809359 ) ) ( not ( = ?auto_809350 ?auto_809360 ) ) ( not ( = ?auto_809350 ?auto_809361 ) ) ( not ( = ?auto_809351 ?auto_809352 ) ) ( not ( = ?auto_809351 ?auto_809353 ) ) ( not ( = ?auto_809351 ?auto_809354 ) ) ( not ( = ?auto_809351 ?auto_809355 ) ) ( not ( = ?auto_809351 ?auto_809356 ) ) ( not ( = ?auto_809351 ?auto_809357 ) ) ( not ( = ?auto_809351 ?auto_809358 ) ) ( not ( = ?auto_809351 ?auto_809359 ) ) ( not ( = ?auto_809351 ?auto_809360 ) ) ( not ( = ?auto_809351 ?auto_809361 ) ) ( not ( = ?auto_809352 ?auto_809353 ) ) ( not ( = ?auto_809352 ?auto_809354 ) ) ( not ( = ?auto_809352 ?auto_809355 ) ) ( not ( = ?auto_809352 ?auto_809356 ) ) ( not ( = ?auto_809352 ?auto_809357 ) ) ( not ( = ?auto_809352 ?auto_809358 ) ) ( not ( = ?auto_809352 ?auto_809359 ) ) ( not ( = ?auto_809352 ?auto_809360 ) ) ( not ( = ?auto_809352 ?auto_809361 ) ) ( not ( = ?auto_809353 ?auto_809354 ) ) ( not ( = ?auto_809353 ?auto_809355 ) ) ( not ( = ?auto_809353 ?auto_809356 ) ) ( not ( = ?auto_809353 ?auto_809357 ) ) ( not ( = ?auto_809353 ?auto_809358 ) ) ( not ( = ?auto_809353 ?auto_809359 ) ) ( not ( = ?auto_809353 ?auto_809360 ) ) ( not ( = ?auto_809353 ?auto_809361 ) ) ( not ( = ?auto_809354 ?auto_809355 ) ) ( not ( = ?auto_809354 ?auto_809356 ) ) ( not ( = ?auto_809354 ?auto_809357 ) ) ( not ( = ?auto_809354 ?auto_809358 ) ) ( not ( = ?auto_809354 ?auto_809359 ) ) ( not ( = ?auto_809354 ?auto_809360 ) ) ( not ( = ?auto_809354 ?auto_809361 ) ) ( not ( = ?auto_809355 ?auto_809356 ) ) ( not ( = ?auto_809355 ?auto_809357 ) ) ( not ( = ?auto_809355 ?auto_809358 ) ) ( not ( = ?auto_809355 ?auto_809359 ) ) ( not ( = ?auto_809355 ?auto_809360 ) ) ( not ( = ?auto_809355 ?auto_809361 ) ) ( not ( = ?auto_809356 ?auto_809357 ) ) ( not ( = ?auto_809356 ?auto_809358 ) ) ( not ( = ?auto_809356 ?auto_809359 ) ) ( not ( = ?auto_809356 ?auto_809360 ) ) ( not ( = ?auto_809356 ?auto_809361 ) ) ( not ( = ?auto_809357 ?auto_809358 ) ) ( not ( = ?auto_809357 ?auto_809359 ) ) ( not ( = ?auto_809357 ?auto_809360 ) ) ( not ( = ?auto_809357 ?auto_809361 ) ) ( not ( = ?auto_809358 ?auto_809359 ) ) ( not ( = ?auto_809358 ?auto_809360 ) ) ( not ( = ?auto_809358 ?auto_809361 ) ) ( not ( = ?auto_809359 ?auto_809360 ) ) ( not ( = ?auto_809359 ?auto_809361 ) ) ( not ( = ?auto_809360 ?auto_809361 ) ) ( ON ?auto_809360 ?auto_809361 ) ( ON ?auto_809359 ?auto_809360 ) ( ON ?auto_809358 ?auto_809359 ) ( ON ?auto_809357 ?auto_809358 ) ( ON ?auto_809356 ?auto_809357 ) ( ON ?auto_809355 ?auto_809356 ) ( ON ?auto_809354 ?auto_809355 ) ( CLEAR ?auto_809352 ) ( ON ?auto_809353 ?auto_809354 ) ( CLEAR ?auto_809353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_809344 ?auto_809345 ?auto_809346 ?auto_809347 ?auto_809348 ?auto_809349 ?auto_809350 ?auto_809351 ?auto_809352 ?auto_809353 )
      ( MAKE-18PILE ?auto_809344 ?auto_809345 ?auto_809346 ?auto_809347 ?auto_809348 ?auto_809349 ?auto_809350 ?auto_809351 ?auto_809352 ?auto_809353 ?auto_809354 ?auto_809355 ?auto_809356 ?auto_809357 ?auto_809358 ?auto_809359 ?auto_809360 ?auto_809361 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809380 - BLOCK
      ?auto_809381 - BLOCK
      ?auto_809382 - BLOCK
      ?auto_809383 - BLOCK
      ?auto_809384 - BLOCK
      ?auto_809385 - BLOCK
      ?auto_809386 - BLOCK
      ?auto_809387 - BLOCK
      ?auto_809388 - BLOCK
      ?auto_809389 - BLOCK
      ?auto_809390 - BLOCK
      ?auto_809391 - BLOCK
      ?auto_809392 - BLOCK
      ?auto_809393 - BLOCK
      ?auto_809394 - BLOCK
      ?auto_809395 - BLOCK
      ?auto_809396 - BLOCK
      ?auto_809397 - BLOCK
    )
    :vars
    (
      ?auto_809398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809397 ?auto_809398 ) ( ON-TABLE ?auto_809380 ) ( ON ?auto_809381 ?auto_809380 ) ( ON ?auto_809382 ?auto_809381 ) ( ON ?auto_809383 ?auto_809382 ) ( ON ?auto_809384 ?auto_809383 ) ( ON ?auto_809385 ?auto_809384 ) ( ON ?auto_809386 ?auto_809385 ) ( ON ?auto_809387 ?auto_809386 ) ( not ( = ?auto_809380 ?auto_809381 ) ) ( not ( = ?auto_809380 ?auto_809382 ) ) ( not ( = ?auto_809380 ?auto_809383 ) ) ( not ( = ?auto_809380 ?auto_809384 ) ) ( not ( = ?auto_809380 ?auto_809385 ) ) ( not ( = ?auto_809380 ?auto_809386 ) ) ( not ( = ?auto_809380 ?auto_809387 ) ) ( not ( = ?auto_809380 ?auto_809388 ) ) ( not ( = ?auto_809380 ?auto_809389 ) ) ( not ( = ?auto_809380 ?auto_809390 ) ) ( not ( = ?auto_809380 ?auto_809391 ) ) ( not ( = ?auto_809380 ?auto_809392 ) ) ( not ( = ?auto_809380 ?auto_809393 ) ) ( not ( = ?auto_809380 ?auto_809394 ) ) ( not ( = ?auto_809380 ?auto_809395 ) ) ( not ( = ?auto_809380 ?auto_809396 ) ) ( not ( = ?auto_809380 ?auto_809397 ) ) ( not ( = ?auto_809380 ?auto_809398 ) ) ( not ( = ?auto_809381 ?auto_809382 ) ) ( not ( = ?auto_809381 ?auto_809383 ) ) ( not ( = ?auto_809381 ?auto_809384 ) ) ( not ( = ?auto_809381 ?auto_809385 ) ) ( not ( = ?auto_809381 ?auto_809386 ) ) ( not ( = ?auto_809381 ?auto_809387 ) ) ( not ( = ?auto_809381 ?auto_809388 ) ) ( not ( = ?auto_809381 ?auto_809389 ) ) ( not ( = ?auto_809381 ?auto_809390 ) ) ( not ( = ?auto_809381 ?auto_809391 ) ) ( not ( = ?auto_809381 ?auto_809392 ) ) ( not ( = ?auto_809381 ?auto_809393 ) ) ( not ( = ?auto_809381 ?auto_809394 ) ) ( not ( = ?auto_809381 ?auto_809395 ) ) ( not ( = ?auto_809381 ?auto_809396 ) ) ( not ( = ?auto_809381 ?auto_809397 ) ) ( not ( = ?auto_809381 ?auto_809398 ) ) ( not ( = ?auto_809382 ?auto_809383 ) ) ( not ( = ?auto_809382 ?auto_809384 ) ) ( not ( = ?auto_809382 ?auto_809385 ) ) ( not ( = ?auto_809382 ?auto_809386 ) ) ( not ( = ?auto_809382 ?auto_809387 ) ) ( not ( = ?auto_809382 ?auto_809388 ) ) ( not ( = ?auto_809382 ?auto_809389 ) ) ( not ( = ?auto_809382 ?auto_809390 ) ) ( not ( = ?auto_809382 ?auto_809391 ) ) ( not ( = ?auto_809382 ?auto_809392 ) ) ( not ( = ?auto_809382 ?auto_809393 ) ) ( not ( = ?auto_809382 ?auto_809394 ) ) ( not ( = ?auto_809382 ?auto_809395 ) ) ( not ( = ?auto_809382 ?auto_809396 ) ) ( not ( = ?auto_809382 ?auto_809397 ) ) ( not ( = ?auto_809382 ?auto_809398 ) ) ( not ( = ?auto_809383 ?auto_809384 ) ) ( not ( = ?auto_809383 ?auto_809385 ) ) ( not ( = ?auto_809383 ?auto_809386 ) ) ( not ( = ?auto_809383 ?auto_809387 ) ) ( not ( = ?auto_809383 ?auto_809388 ) ) ( not ( = ?auto_809383 ?auto_809389 ) ) ( not ( = ?auto_809383 ?auto_809390 ) ) ( not ( = ?auto_809383 ?auto_809391 ) ) ( not ( = ?auto_809383 ?auto_809392 ) ) ( not ( = ?auto_809383 ?auto_809393 ) ) ( not ( = ?auto_809383 ?auto_809394 ) ) ( not ( = ?auto_809383 ?auto_809395 ) ) ( not ( = ?auto_809383 ?auto_809396 ) ) ( not ( = ?auto_809383 ?auto_809397 ) ) ( not ( = ?auto_809383 ?auto_809398 ) ) ( not ( = ?auto_809384 ?auto_809385 ) ) ( not ( = ?auto_809384 ?auto_809386 ) ) ( not ( = ?auto_809384 ?auto_809387 ) ) ( not ( = ?auto_809384 ?auto_809388 ) ) ( not ( = ?auto_809384 ?auto_809389 ) ) ( not ( = ?auto_809384 ?auto_809390 ) ) ( not ( = ?auto_809384 ?auto_809391 ) ) ( not ( = ?auto_809384 ?auto_809392 ) ) ( not ( = ?auto_809384 ?auto_809393 ) ) ( not ( = ?auto_809384 ?auto_809394 ) ) ( not ( = ?auto_809384 ?auto_809395 ) ) ( not ( = ?auto_809384 ?auto_809396 ) ) ( not ( = ?auto_809384 ?auto_809397 ) ) ( not ( = ?auto_809384 ?auto_809398 ) ) ( not ( = ?auto_809385 ?auto_809386 ) ) ( not ( = ?auto_809385 ?auto_809387 ) ) ( not ( = ?auto_809385 ?auto_809388 ) ) ( not ( = ?auto_809385 ?auto_809389 ) ) ( not ( = ?auto_809385 ?auto_809390 ) ) ( not ( = ?auto_809385 ?auto_809391 ) ) ( not ( = ?auto_809385 ?auto_809392 ) ) ( not ( = ?auto_809385 ?auto_809393 ) ) ( not ( = ?auto_809385 ?auto_809394 ) ) ( not ( = ?auto_809385 ?auto_809395 ) ) ( not ( = ?auto_809385 ?auto_809396 ) ) ( not ( = ?auto_809385 ?auto_809397 ) ) ( not ( = ?auto_809385 ?auto_809398 ) ) ( not ( = ?auto_809386 ?auto_809387 ) ) ( not ( = ?auto_809386 ?auto_809388 ) ) ( not ( = ?auto_809386 ?auto_809389 ) ) ( not ( = ?auto_809386 ?auto_809390 ) ) ( not ( = ?auto_809386 ?auto_809391 ) ) ( not ( = ?auto_809386 ?auto_809392 ) ) ( not ( = ?auto_809386 ?auto_809393 ) ) ( not ( = ?auto_809386 ?auto_809394 ) ) ( not ( = ?auto_809386 ?auto_809395 ) ) ( not ( = ?auto_809386 ?auto_809396 ) ) ( not ( = ?auto_809386 ?auto_809397 ) ) ( not ( = ?auto_809386 ?auto_809398 ) ) ( not ( = ?auto_809387 ?auto_809388 ) ) ( not ( = ?auto_809387 ?auto_809389 ) ) ( not ( = ?auto_809387 ?auto_809390 ) ) ( not ( = ?auto_809387 ?auto_809391 ) ) ( not ( = ?auto_809387 ?auto_809392 ) ) ( not ( = ?auto_809387 ?auto_809393 ) ) ( not ( = ?auto_809387 ?auto_809394 ) ) ( not ( = ?auto_809387 ?auto_809395 ) ) ( not ( = ?auto_809387 ?auto_809396 ) ) ( not ( = ?auto_809387 ?auto_809397 ) ) ( not ( = ?auto_809387 ?auto_809398 ) ) ( not ( = ?auto_809388 ?auto_809389 ) ) ( not ( = ?auto_809388 ?auto_809390 ) ) ( not ( = ?auto_809388 ?auto_809391 ) ) ( not ( = ?auto_809388 ?auto_809392 ) ) ( not ( = ?auto_809388 ?auto_809393 ) ) ( not ( = ?auto_809388 ?auto_809394 ) ) ( not ( = ?auto_809388 ?auto_809395 ) ) ( not ( = ?auto_809388 ?auto_809396 ) ) ( not ( = ?auto_809388 ?auto_809397 ) ) ( not ( = ?auto_809388 ?auto_809398 ) ) ( not ( = ?auto_809389 ?auto_809390 ) ) ( not ( = ?auto_809389 ?auto_809391 ) ) ( not ( = ?auto_809389 ?auto_809392 ) ) ( not ( = ?auto_809389 ?auto_809393 ) ) ( not ( = ?auto_809389 ?auto_809394 ) ) ( not ( = ?auto_809389 ?auto_809395 ) ) ( not ( = ?auto_809389 ?auto_809396 ) ) ( not ( = ?auto_809389 ?auto_809397 ) ) ( not ( = ?auto_809389 ?auto_809398 ) ) ( not ( = ?auto_809390 ?auto_809391 ) ) ( not ( = ?auto_809390 ?auto_809392 ) ) ( not ( = ?auto_809390 ?auto_809393 ) ) ( not ( = ?auto_809390 ?auto_809394 ) ) ( not ( = ?auto_809390 ?auto_809395 ) ) ( not ( = ?auto_809390 ?auto_809396 ) ) ( not ( = ?auto_809390 ?auto_809397 ) ) ( not ( = ?auto_809390 ?auto_809398 ) ) ( not ( = ?auto_809391 ?auto_809392 ) ) ( not ( = ?auto_809391 ?auto_809393 ) ) ( not ( = ?auto_809391 ?auto_809394 ) ) ( not ( = ?auto_809391 ?auto_809395 ) ) ( not ( = ?auto_809391 ?auto_809396 ) ) ( not ( = ?auto_809391 ?auto_809397 ) ) ( not ( = ?auto_809391 ?auto_809398 ) ) ( not ( = ?auto_809392 ?auto_809393 ) ) ( not ( = ?auto_809392 ?auto_809394 ) ) ( not ( = ?auto_809392 ?auto_809395 ) ) ( not ( = ?auto_809392 ?auto_809396 ) ) ( not ( = ?auto_809392 ?auto_809397 ) ) ( not ( = ?auto_809392 ?auto_809398 ) ) ( not ( = ?auto_809393 ?auto_809394 ) ) ( not ( = ?auto_809393 ?auto_809395 ) ) ( not ( = ?auto_809393 ?auto_809396 ) ) ( not ( = ?auto_809393 ?auto_809397 ) ) ( not ( = ?auto_809393 ?auto_809398 ) ) ( not ( = ?auto_809394 ?auto_809395 ) ) ( not ( = ?auto_809394 ?auto_809396 ) ) ( not ( = ?auto_809394 ?auto_809397 ) ) ( not ( = ?auto_809394 ?auto_809398 ) ) ( not ( = ?auto_809395 ?auto_809396 ) ) ( not ( = ?auto_809395 ?auto_809397 ) ) ( not ( = ?auto_809395 ?auto_809398 ) ) ( not ( = ?auto_809396 ?auto_809397 ) ) ( not ( = ?auto_809396 ?auto_809398 ) ) ( not ( = ?auto_809397 ?auto_809398 ) ) ( ON ?auto_809396 ?auto_809397 ) ( ON ?auto_809395 ?auto_809396 ) ( ON ?auto_809394 ?auto_809395 ) ( ON ?auto_809393 ?auto_809394 ) ( ON ?auto_809392 ?auto_809393 ) ( ON ?auto_809391 ?auto_809392 ) ( ON ?auto_809390 ?auto_809391 ) ( ON ?auto_809389 ?auto_809390 ) ( CLEAR ?auto_809387 ) ( ON ?auto_809388 ?auto_809389 ) ( CLEAR ?auto_809388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_809380 ?auto_809381 ?auto_809382 ?auto_809383 ?auto_809384 ?auto_809385 ?auto_809386 ?auto_809387 ?auto_809388 )
      ( MAKE-18PILE ?auto_809380 ?auto_809381 ?auto_809382 ?auto_809383 ?auto_809384 ?auto_809385 ?auto_809386 ?auto_809387 ?auto_809388 ?auto_809389 ?auto_809390 ?auto_809391 ?auto_809392 ?auto_809393 ?auto_809394 ?auto_809395 ?auto_809396 ?auto_809397 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809417 - BLOCK
      ?auto_809418 - BLOCK
      ?auto_809419 - BLOCK
      ?auto_809420 - BLOCK
      ?auto_809421 - BLOCK
      ?auto_809422 - BLOCK
      ?auto_809423 - BLOCK
      ?auto_809424 - BLOCK
      ?auto_809425 - BLOCK
      ?auto_809426 - BLOCK
      ?auto_809427 - BLOCK
      ?auto_809428 - BLOCK
      ?auto_809429 - BLOCK
      ?auto_809430 - BLOCK
      ?auto_809431 - BLOCK
      ?auto_809432 - BLOCK
      ?auto_809433 - BLOCK
      ?auto_809434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809434 ) ( ON-TABLE ?auto_809417 ) ( ON ?auto_809418 ?auto_809417 ) ( ON ?auto_809419 ?auto_809418 ) ( ON ?auto_809420 ?auto_809419 ) ( ON ?auto_809421 ?auto_809420 ) ( ON ?auto_809422 ?auto_809421 ) ( ON ?auto_809423 ?auto_809422 ) ( ON ?auto_809424 ?auto_809423 ) ( not ( = ?auto_809417 ?auto_809418 ) ) ( not ( = ?auto_809417 ?auto_809419 ) ) ( not ( = ?auto_809417 ?auto_809420 ) ) ( not ( = ?auto_809417 ?auto_809421 ) ) ( not ( = ?auto_809417 ?auto_809422 ) ) ( not ( = ?auto_809417 ?auto_809423 ) ) ( not ( = ?auto_809417 ?auto_809424 ) ) ( not ( = ?auto_809417 ?auto_809425 ) ) ( not ( = ?auto_809417 ?auto_809426 ) ) ( not ( = ?auto_809417 ?auto_809427 ) ) ( not ( = ?auto_809417 ?auto_809428 ) ) ( not ( = ?auto_809417 ?auto_809429 ) ) ( not ( = ?auto_809417 ?auto_809430 ) ) ( not ( = ?auto_809417 ?auto_809431 ) ) ( not ( = ?auto_809417 ?auto_809432 ) ) ( not ( = ?auto_809417 ?auto_809433 ) ) ( not ( = ?auto_809417 ?auto_809434 ) ) ( not ( = ?auto_809418 ?auto_809419 ) ) ( not ( = ?auto_809418 ?auto_809420 ) ) ( not ( = ?auto_809418 ?auto_809421 ) ) ( not ( = ?auto_809418 ?auto_809422 ) ) ( not ( = ?auto_809418 ?auto_809423 ) ) ( not ( = ?auto_809418 ?auto_809424 ) ) ( not ( = ?auto_809418 ?auto_809425 ) ) ( not ( = ?auto_809418 ?auto_809426 ) ) ( not ( = ?auto_809418 ?auto_809427 ) ) ( not ( = ?auto_809418 ?auto_809428 ) ) ( not ( = ?auto_809418 ?auto_809429 ) ) ( not ( = ?auto_809418 ?auto_809430 ) ) ( not ( = ?auto_809418 ?auto_809431 ) ) ( not ( = ?auto_809418 ?auto_809432 ) ) ( not ( = ?auto_809418 ?auto_809433 ) ) ( not ( = ?auto_809418 ?auto_809434 ) ) ( not ( = ?auto_809419 ?auto_809420 ) ) ( not ( = ?auto_809419 ?auto_809421 ) ) ( not ( = ?auto_809419 ?auto_809422 ) ) ( not ( = ?auto_809419 ?auto_809423 ) ) ( not ( = ?auto_809419 ?auto_809424 ) ) ( not ( = ?auto_809419 ?auto_809425 ) ) ( not ( = ?auto_809419 ?auto_809426 ) ) ( not ( = ?auto_809419 ?auto_809427 ) ) ( not ( = ?auto_809419 ?auto_809428 ) ) ( not ( = ?auto_809419 ?auto_809429 ) ) ( not ( = ?auto_809419 ?auto_809430 ) ) ( not ( = ?auto_809419 ?auto_809431 ) ) ( not ( = ?auto_809419 ?auto_809432 ) ) ( not ( = ?auto_809419 ?auto_809433 ) ) ( not ( = ?auto_809419 ?auto_809434 ) ) ( not ( = ?auto_809420 ?auto_809421 ) ) ( not ( = ?auto_809420 ?auto_809422 ) ) ( not ( = ?auto_809420 ?auto_809423 ) ) ( not ( = ?auto_809420 ?auto_809424 ) ) ( not ( = ?auto_809420 ?auto_809425 ) ) ( not ( = ?auto_809420 ?auto_809426 ) ) ( not ( = ?auto_809420 ?auto_809427 ) ) ( not ( = ?auto_809420 ?auto_809428 ) ) ( not ( = ?auto_809420 ?auto_809429 ) ) ( not ( = ?auto_809420 ?auto_809430 ) ) ( not ( = ?auto_809420 ?auto_809431 ) ) ( not ( = ?auto_809420 ?auto_809432 ) ) ( not ( = ?auto_809420 ?auto_809433 ) ) ( not ( = ?auto_809420 ?auto_809434 ) ) ( not ( = ?auto_809421 ?auto_809422 ) ) ( not ( = ?auto_809421 ?auto_809423 ) ) ( not ( = ?auto_809421 ?auto_809424 ) ) ( not ( = ?auto_809421 ?auto_809425 ) ) ( not ( = ?auto_809421 ?auto_809426 ) ) ( not ( = ?auto_809421 ?auto_809427 ) ) ( not ( = ?auto_809421 ?auto_809428 ) ) ( not ( = ?auto_809421 ?auto_809429 ) ) ( not ( = ?auto_809421 ?auto_809430 ) ) ( not ( = ?auto_809421 ?auto_809431 ) ) ( not ( = ?auto_809421 ?auto_809432 ) ) ( not ( = ?auto_809421 ?auto_809433 ) ) ( not ( = ?auto_809421 ?auto_809434 ) ) ( not ( = ?auto_809422 ?auto_809423 ) ) ( not ( = ?auto_809422 ?auto_809424 ) ) ( not ( = ?auto_809422 ?auto_809425 ) ) ( not ( = ?auto_809422 ?auto_809426 ) ) ( not ( = ?auto_809422 ?auto_809427 ) ) ( not ( = ?auto_809422 ?auto_809428 ) ) ( not ( = ?auto_809422 ?auto_809429 ) ) ( not ( = ?auto_809422 ?auto_809430 ) ) ( not ( = ?auto_809422 ?auto_809431 ) ) ( not ( = ?auto_809422 ?auto_809432 ) ) ( not ( = ?auto_809422 ?auto_809433 ) ) ( not ( = ?auto_809422 ?auto_809434 ) ) ( not ( = ?auto_809423 ?auto_809424 ) ) ( not ( = ?auto_809423 ?auto_809425 ) ) ( not ( = ?auto_809423 ?auto_809426 ) ) ( not ( = ?auto_809423 ?auto_809427 ) ) ( not ( = ?auto_809423 ?auto_809428 ) ) ( not ( = ?auto_809423 ?auto_809429 ) ) ( not ( = ?auto_809423 ?auto_809430 ) ) ( not ( = ?auto_809423 ?auto_809431 ) ) ( not ( = ?auto_809423 ?auto_809432 ) ) ( not ( = ?auto_809423 ?auto_809433 ) ) ( not ( = ?auto_809423 ?auto_809434 ) ) ( not ( = ?auto_809424 ?auto_809425 ) ) ( not ( = ?auto_809424 ?auto_809426 ) ) ( not ( = ?auto_809424 ?auto_809427 ) ) ( not ( = ?auto_809424 ?auto_809428 ) ) ( not ( = ?auto_809424 ?auto_809429 ) ) ( not ( = ?auto_809424 ?auto_809430 ) ) ( not ( = ?auto_809424 ?auto_809431 ) ) ( not ( = ?auto_809424 ?auto_809432 ) ) ( not ( = ?auto_809424 ?auto_809433 ) ) ( not ( = ?auto_809424 ?auto_809434 ) ) ( not ( = ?auto_809425 ?auto_809426 ) ) ( not ( = ?auto_809425 ?auto_809427 ) ) ( not ( = ?auto_809425 ?auto_809428 ) ) ( not ( = ?auto_809425 ?auto_809429 ) ) ( not ( = ?auto_809425 ?auto_809430 ) ) ( not ( = ?auto_809425 ?auto_809431 ) ) ( not ( = ?auto_809425 ?auto_809432 ) ) ( not ( = ?auto_809425 ?auto_809433 ) ) ( not ( = ?auto_809425 ?auto_809434 ) ) ( not ( = ?auto_809426 ?auto_809427 ) ) ( not ( = ?auto_809426 ?auto_809428 ) ) ( not ( = ?auto_809426 ?auto_809429 ) ) ( not ( = ?auto_809426 ?auto_809430 ) ) ( not ( = ?auto_809426 ?auto_809431 ) ) ( not ( = ?auto_809426 ?auto_809432 ) ) ( not ( = ?auto_809426 ?auto_809433 ) ) ( not ( = ?auto_809426 ?auto_809434 ) ) ( not ( = ?auto_809427 ?auto_809428 ) ) ( not ( = ?auto_809427 ?auto_809429 ) ) ( not ( = ?auto_809427 ?auto_809430 ) ) ( not ( = ?auto_809427 ?auto_809431 ) ) ( not ( = ?auto_809427 ?auto_809432 ) ) ( not ( = ?auto_809427 ?auto_809433 ) ) ( not ( = ?auto_809427 ?auto_809434 ) ) ( not ( = ?auto_809428 ?auto_809429 ) ) ( not ( = ?auto_809428 ?auto_809430 ) ) ( not ( = ?auto_809428 ?auto_809431 ) ) ( not ( = ?auto_809428 ?auto_809432 ) ) ( not ( = ?auto_809428 ?auto_809433 ) ) ( not ( = ?auto_809428 ?auto_809434 ) ) ( not ( = ?auto_809429 ?auto_809430 ) ) ( not ( = ?auto_809429 ?auto_809431 ) ) ( not ( = ?auto_809429 ?auto_809432 ) ) ( not ( = ?auto_809429 ?auto_809433 ) ) ( not ( = ?auto_809429 ?auto_809434 ) ) ( not ( = ?auto_809430 ?auto_809431 ) ) ( not ( = ?auto_809430 ?auto_809432 ) ) ( not ( = ?auto_809430 ?auto_809433 ) ) ( not ( = ?auto_809430 ?auto_809434 ) ) ( not ( = ?auto_809431 ?auto_809432 ) ) ( not ( = ?auto_809431 ?auto_809433 ) ) ( not ( = ?auto_809431 ?auto_809434 ) ) ( not ( = ?auto_809432 ?auto_809433 ) ) ( not ( = ?auto_809432 ?auto_809434 ) ) ( not ( = ?auto_809433 ?auto_809434 ) ) ( ON ?auto_809433 ?auto_809434 ) ( ON ?auto_809432 ?auto_809433 ) ( ON ?auto_809431 ?auto_809432 ) ( ON ?auto_809430 ?auto_809431 ) ( ON ?auto_809429 ?auto_809430 ) ( ON ?auto_809428 ?auto_809429 ) ( ON ?auto_809427 ?auto_809428 ) ( ON ?auto_809426 ?auto_809427 ) ( CLEAR ?auto_809424 ) ( ON ?auto_809425 ?auto_809426 ) ( CLEAR ?auto_809425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_809417 ?auto_809418 ?auto_809419 ?auto_809420 ?auto_809421 ?auto_809422 ?auto_809423 ?auto_809424 ?auto_809425 )
      ( MAKE-18PILE ?auto_809417 ?auto_809418 ?auto_809419 ?auto_809420 ?auto_809421 ?auto_809422 ?auto_809423 ?auto_809424 ?auto_809425 ?auto_809426 ?auto_809427 ?auto_809428 ?auto_809429 ?auto_809430 ?auto_809431 ?auto_809432 ?auto_809433 ?auto_809434 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809453 - BLOCK
      ?auto_809454 - BLOCK
      ?auto_809455 - BLOCK
      ?auto_809456 - BLOCK
      ?auto_809457 - BLOCK
      ?auto_809458 - BLOCK
      ?auto_809459 - BLOCK
      ?auto_809460 - BLOCK
      ?auto_809461 - BLOCK
      ?auto_809462 - BLOCK
      ?auto_809463 - BLOCK
      ?auto_809464 - BLOCK
      ?auto_809465 - BLOCK
      ?auto_809466 - BLOCK
      ?auto_809467 - BLOCK
      ?auto_809468 - BLOCK
      ?auto_809469 - BLOCK
      ?auto_809470 - BLOCK
    )
    :vars
    (
      ?auto_809471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809470 ?auto_809471 ) ( ON-TABLE ?auto_809453 ) ( ON ?auto_809454 ?auto_809453 ) ( ON ?auto_809455 ?auto_809454 ) ( ON ?auto_809456 ?auto_809455 ) ( ON ?auto_809457 ?auto_809456 ) ( ON ?auto_809458 ?auto_809457 ) ( ON ?auto_809459 ?auto_809458 ) ( not ( = ?auto_809453 ?auto_809454 ) ) ( not ( = ?auto_809453 ?auto_809455 ) ) ( not ( = ?auto_809453 ?auto_809456 ) ) ( not ( = ?auto_809453 ?auto_809457 ) ) ( not ( = ?auto_809453 ?auto_809458 ) ) ( not ( = ?auto_809453 ?auto_809459 ) ) ( not ( = ?auto_809453 ?auto_809460 ) ) ( not ( = ?auto_809453 ?auto_809461 ) ) ( not ( = ?auto_809453 ?auto_809462 ) ) ( not ( = ?auto_809453 ?auto_809463 ) ) ( not ( = ?auto_809453 ?auto_809464 ) ) ( not ( = ?auto_809453 ?auto_809465 ) ) ( not ( = ?auto_809453 ?auto_809466 ) ) ( not ( = ?auto_809453 ?auto_809467 ) ) ( not ( = ?auto_809453 ?auto_809468 ) ) ( not ( = ?auto_809453 ?auto_809469 ) ) ( not ( = ?auto_809453 ?auto_809470 ) ) ( not ( = ?auto_809453 ?auto_809471 ) ) ( not ( = ?auto_809454 ?auto_809455 ) ) ( not ( = ?auto_809454 ?auto_809456 ) ) ( not ( = ?auto_809454 ?auto_809457 ) ) ( not ( = ?auto_809454 ?auto_809458 ) ) ( not ( = ?auto_809454 ?auto_809459 ) ) ( not ( = ?auto_809454 ?auto_809460 ) ) ( not ( = ?auto_809454 ?auto_809461 ) ) ( not ( = ?auto_809454 ?auto_809462 ) ) ( not ( = ?auto_809454 ?auto_809463 ) ) ( not ( = ?auto_809454 ?auto_809464 ) ) ( not ( = ?auto_809454 ?auto_809465 ) ) ( not ( = ?auto_809454 ?auto_809466 ) ) ( not ( = ?auto_809454 ?auto_809467 ) ) ( not ( = ?auto_809454 ?auto_809468 ) ) ( not ( = ?auto_809454 ?auto_809469 ) ) ( not ( = ?auto_809454 ?auto_809470 ) ) ( not ( = ?auto_809454 ?auto_809471 ) ) ( not ( = ?auto_809455 ?auto_809456 ) ) ( not ( = ?auto_809455 ?auto_809457 ) ) ( not ( = ?auto_809455 ?auto_809458 ) ) ( not ( = ?auto_809455 ?auto_809459 ) ) ( not ( = ?auto_809455 ?auto_809460 ) ) ( not ( = ?auto_809455 ?auto_809461 ) ) ( not ( = ?auto_809455 ?auto_809462 ) ) ( not ( = ?auto_809455 ?auto_809463 ) ) ( not ( = ?auto_809455 ?auto_809464 ) ) ( not ( = ?auto_809455 ?auto_809465 ) ) ( not ( = ?auto_809455 ?auto_809466 ) ) ( not ( = ?auto_809455 ?auto_809467 ) ) ( not ( = ?auto_809455 ?auto_809468 ) ) ( not ( = ?auto_809455 ?auto_809469 ) ) ( not ( = ?auto_809455 ?auto_809470 ) ) ( not ( = ?auto_809455 ?auto_809471 ) ) ( not ( = ?auto_809456 ?auto_809457 ) ) ( not ( = ?auto_809456 ?auto_809458 ) ) ( not ( = ?auto_809456 ?auto_809459 ) ) ( not ( = ?auto_809456 ?auto_809460 ) ) ( not ( = ?auto_809456 ?auto_809461 ) ) ( not ( = ?auto_809456 ?auto_809462 ) ) ( not ( = ?auto_809456 ?auto_809463 ) ) ( not ( = ?auto_809456 ?auto_809464 ) ) ( not ( = ?auto_809456 ?auto_809465 ) ) ( not ( = ?auto_809456 ?auto_809466 ) ) ( not ( = ?auto_809456 ?auto_809467 ) ) ( not ( = ?auto_809456 ?auto_809468 ) ) ( not ( = ?auto_809456 ?auto_809469 ) ) ( not ( = ?auto_809456 ?auto_809470 ) ) ( not ( = ?auto_809456 ?auto_809471 ) ) ( not ( = ?auto_809457 ?auto_809458 ) ) ( not ( = ?auto_809457 ?auto_809459 ) ) ( not ( = ?auto_809457 ?auto_809460 ) ) ( not ( = ?auto_809457 ?auto_809461 ) ) ( not ( = ?auto_809457 ?auto_809462 ) ) ( not ( = ?auto_809457 ?auto_809463 ) ) ( not ( = ?auto_809457 ?auto_809464 ) ) ( not ( = ?auto_809457 ?auto_809465 ) ) ( not ( = ?auto_809457 ?auto_809466 ) ) ( not ( = ?auto_809457 ?auto_809467 ) ) ( not ( = ?auto_809457 ?auto_809468 ) ) ( not ( = ?auto_809457 ?auto_809469 ) ) ( not ( = ?auto_809457 ?auto_809470 ) ) ( not ( = ?auto_809457 ?auto_809471 ) ) ( not ( = ?auto_809458 ?auto_809459 ) ) ( not ( = ?auto_809458 ?auto_809460 ) ) ( not ( = ?auto_809458 ?auto_809461 ) ) ( not ( = ?auto_809458 ?auto_809462 ) ) ( not ( = ?auto_809458 ?auto_809463 ) ) ( not ( = ?auto_809458 ?auto_809464 ) ) ( not ( = ?auto_809458 ?auto_809465 ) ) ( not ( = ?auto_809458 ?auto_809466 ) ) ( not ( = ?auto_809458 ?auto_809467 ) ) ( not ( = ?auto_809458 ?auto_809468 ) ) ( not ( = ?auto_809458 ?auto_809469 ) ) ( not ( = ?auto_809458 ?auto_809470 ) ) ( not ( = ?auto_809458 ?auto_809471 ) ) ( not ( = ?auto_809459 ?auto_809460 ) ) ( not ( = ?auto_809459 ?auto_809461 ) ) ( not ( = ?auto_809459 ?auto_809462 ) ) ( not ( = ?auto_809459 ?auto_809463 ) ) ( not ( = ?auto_809459 ?auto_809464 ) ) ( not ( = ?auto_809459 ?auto_809465 ) ) ( not ( = ?auto_809459 ?auto_809466 ) ) ( not ( = ?auto_809459 ?auto_809467 ) ) ( not ( = ?auto_809459 ?auto_809468 ) ) ( not ( = ?auto_809459 ?auto_809469 ) ) ( not ( = ?auto_809459 ?auto_809470 ) ) ( not ( = ?auto_809459 ?auto_809471 ) ) ( not ( = ?auto_809460 ?auto_809461 ) ) ( not ( = ?auto_809460 ?auto_809462 ) ) ( not ( = ?auto_809460 ?auto_809463 ) ) ( not ( = ?auto_809460 ?auto_809464 ) ) ( not ( = ?auto_809460 ?auto_809465 ) ) ( not ( = ?auto_809460 ?auto_809466 ) ) ( not ( = ?auto_809460 ?auto_809467 ) ) ( not ( = ?auto_809460 ?auto_809468 ) ) ( not ( = ?auto_809460 ?auto_809469 ) ) ( not ( = ?auto_809460 ?auto_809470 ) ) ( not ( = ?auto_809460 ?auto_809471 ) ) ( not ( = ?auto_809461 ?auto_809462 ) ) ( not ( = ?auto_809461 ?auto_809463 ) ) ( not ( = ?auto_809461 ?auto_809464 ) ) ( not ( = ?auto_809461 ?auto_809465 ) ) ( not ( = ?auto_809461 ?auto_809466 ) ) ( not ( = ?auto_809461 ?auto_809467 ) ) ( not ( = ?auto_809461 ?auto_809468 ) ) ( not ( = ?auto_809461 ?auto_809469 ) ) ( not ( = ?auto_809461 ?auto_809470 ) ) ( not ( = ?auto_809461 ?auto_809471 ) ) ( not ( = ?auto_809462 ?auto_809463 ) ) ( not ( = ?auto_809462 ?auto_809464 ) ) ( not ( = ?auto_809462 ?auto_809465 ) ) ( not ( = ?auto_809462 ?auto_809466 ) ) ( not ( = ?auto_809462 ?auto_809467 ) ) ( not ( = ?auto_809462 ?auto_809468 ) ) ( not ( = ?auto_809462 ?auto_809469 ) ) ( not ( = ?auto_809462 ?auto_809470 ) ) ( not ( = ?auto_809462 ?auto_809471 ) ) ( not ( = ?auto_809463 ?auto_809464 ) ) ( not ( = ?auto_809463 ?auto_809465 ) ) ( not ( = ?auto_809463 ?auto_809466 ) ) ( not ( = ?auto_809463 ?auto_809467 ) ) ( not ( = ?auto_809463 ?auto_809468 ) ) ( not ( = ?auto_809463 ?auto_809469 ) ) ( not ( = ?auto_809463 ?auto_809470 ) ) ( not ( = ?auto_809463 ?auto_809471 ) ) ( not ( = ?auto_809464 ?auto_809465 ) ) ( not ( = ?auto_809464 ?auto_809466 ) ) ( not ( = ?auto_809464 ?auto_809467 ) ) ( not ( = ?auto_809464 ?auto_809468 ) ) ( not ( = ?auto_809464 ?auto_809469 ) ) ( not ( = ?auto_809464 ?auto_809470 ) ) ( not ( = ?auto_809464 ?auto_809471 ) ) ( not ( = ?auto_809465 ?auto_809466 ) ) ( not ( = ?auto_809465 ?auto_809467 ) ) ( not ( = ?auto_809465 ?auto_809468 ) ) ( not ( = ?auto_809465 ?auto_809469 ) ) ( not ( = ?auto_809465 ?auto_809470 ) ) ( not ( = ?auto_809465 ?auto_809471 ) ) ( not ( = ?auto_809466 ?auto_809467 ) ) ( not ( = ?auto_809466 ?auto_809468 ) ) ( not ( = ?auto_809466 ?auto_809469 ) ) ( not ( = ?auto_809466 ?auto_809470 ) ) ( not ( = ?auto_809466 ?auto_809471 ) ) ( not ( = ?auto_809467 ?auto_809468 ) ) ( not ( = ?auto_809467 ?auto_809469 ) ) ( not ( = ?auto_809467 ?auto_809470 ) ) ( not ( = ?auto_809467 ?auto_809471 ) ) ( not ( = ?auto_809468 ?auto_809469 ) ) ( not ( = ?auto_809468 ?auto_809470 ) ) ( not ( = ?auto_809468 ?auto_809471 ) ) ( not ( = ?auto_809469 ?auto_809470 ) ) ( not ( = ?auto_809469 ?auto_809471 ) ) ( not ( = ?auto_809470 ?auto_809471 ) ) ( ON ?auto_809469 ?auto_809470 ) ( ON ?auto_809468 ?auto_809469 ) ( ON ?auto_809467 ?auto_809468 ) ( ON ?auto_809466 ?auto_809467 ) ( ON ?auto_809465 ?auto_809466 ) ( ON ?auto_809464 ?auto_809465 ) ( ON ?auto_809463 ?auto_809464 ) ( ON ?auto_809462 ?auto_809463 ) ( ON ?auto_809461 ?auto_809462 ) ( CLEAR ?auto_809459 ) ( ON ?auto_809460 ?auto_809461 ) ( CLEAR ?auto_809460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_809453 ?auto_809454 ?auto_809455 ?auto_809456 ?auto_809457 ?auto_809458 ?auto_809459 ?auto_809460 )
      ( MAKE-18PILE ?auto_809453 ?auto_809454 ?auto_809455 ?auto_809456 ?auto_809457 ?auto_809458 ?auto_809459 ?auto_809460 ?auto_809461 ?auto_809462 ?auto_809463 ?auto_809464 ?auto_809465 ?auto_809466 ?auto_809467 ?auto_809468 ?auto_809469 ?auto_809470 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809490 - BLOCK
      ?auto_809491 - BLOCK
      ?auto_809492 - BLOCK
      ?auto_809493 - BLOCK
      ?auto_809494 - BLOCK
      ?auto_809495 - BLOCK
      ?auto_809496 - BLOCK
      ?auto_809497 - BLOCK
      ?auto_809498 - BLOCK
      ?auto_809499 - BLOCK
      ?auto_809500 - BLOCK
      ?auto_809501 - BLOCK
      ?auto_809502 - BLOCK
      ?auto_809503 - BLOCK
      ?auto_809504 - BLOCK
      ?auto_809505 - BLOCK
      ?auto_809506 - BLOCK
      ?auto_809507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809507 ) ( ON-TABLE ?auto_809490 ) ( ON ?auto_809491 ?auto_809490 ) ( ON ?auto_809492 ?auto_809491 ) ( ON ?auto_809493 ?auto_809492 ) ( ON ?auto_809494 ?auto_809493 ) ( ON ?auto_809495 ?auto_809494 ) ( ON ?auto_809496 ?auto_809495 ) ( not ( = ?auto_809490 ?auto_809491 ) ) ( not ( = ?auto_809490 ?auto_809492 ) ) ( not ( = ?auto_809490 ?auto_809493 ) ) ( not ( = ?auto_809490 ?auto_809494 ) ) ( not ( = ?auto_809490 ?auto_809495 ) ) ( not ( = ?auto_809490 ?auto_809496 ) ) ( not ( = ?auto_809490 ?auto_809497 ) ) ( not ( = ?auto_809490 ?auto_809498 ) ) ( not ( = ?auto_809490 ?auto_809499 ) ) ( not ( = ?auto_809490 ?auto_809500 ) ) ( not ( = ?auto_809490 ?auto_809501 ) ) ( not ( = ?auto_809490 ?auto_809502 ) ) ( not ( = ?auto_809490 ?auto_809503 ) ) ( not ( = ?auto_809490 ?auto_809504 ) ) ( not ( = ?auto_809490 ?auto_809505 ) ) ( not ( = ?auto_809490 ?auto_809506 ) ) ( not ( = ?auto_809490 ?auto_809507 ) ) ( not ( = ?auto_809491 ?auto_809492 ) ) ( not ( = ?auto_809491 ?auto_809493 ) ) ( not ( = ?auto_809491 ?auto_809494 ) ) ( not ( = ?auto_809491 ?auto_809495 ) ) ( not ( = ?auto_809491 ?auto_809496 ) ) ( not ( = ?auto_809491 ?auto_809497 ) ) ( not ( = ?auto_809491 ?auto_809498 ) ) ( not ( = ?auto_809491 ?auto_809499 ) ) ( not ( = ?auto_809491 ?auto_809500 ) ) ( not ( = ?auto_809491 ?auto_809501 ) ) ( not ( = ?auto_809491 ?auto_809502 ) ) ( not ( = ?auto_809491 ?auto_809503 ) ) ( not ( = ?auto_809491 ?auto_809504 ) ) ( not ( = ?auto_809491 ?auto_809505 ) ) ( not ( = ?auto_809491 ?auto_809506 ) ) ( not ( = ?auto_809491 ?auto_809507 ) ) ( not ( = ?auto_809492 ?auto_809493 ) ) ( not ( = ?auto_809492 ?auto_809494 ) ) ( not ( = ?auto_809492 ?auto_809495 ) ) ( not ( = ?auto_809492 ?auto_809496 ) ) ( not ( = ?auto_809492 ?auto_809497 ) ) ( not ( = ?auto_809492 ?auto_809498 ) ) ( not ( = ?auto_809492 ?auto_809499 ) ) ( not ( = ?auto_809492 ?auto_809500 ) ) ( not ( = ?auto_809492 ?auto_809501 ) ) ( not ( = ?auto_809492 ?auto_809502 ) ) ( not ( = ?auto_809492 ?auto_809503 ) ) ( not ( = ?auto_809492 ?auto_809504 ) ) ( not ( = ?auto_809492 ?auto_809505 ) ) ( not ( = ?auto_809492 ?auto_809506 ) ) ( not ( = ?auto_809492 ?auto_809507 ) ) ( not ( = ?auto_809493 ?auto_809494 ) ) ( not ( = ?auto_809493 ?auto_809495 ) ) ( not ( = ?auto_809493 ?auto_809496 ) ) ( not ( = ?auto_809493 ?auto_809497 ) ) ( not ( = ?auto_809493 ?auto_809498 ) ) ( not ( = ?auto_809493 ?auto_809499 ) ) ( not ( = ?auto_809493 ?auto_809500 ) ) ( not ( = ?auto_809493 ?auto_809501 ) ) ( not ( = ?auto_809493 ?auto_809502 ) ) ( not ( = ?auto_809493 ?auto_809503 ) ) ( not ( = ?auto_809493 ?auto_809504 ) ) ( not ( = ?auto_809493 ?auto_809505 ) ) ( not ( = ?auto_809493 ?auto_809506 ) ) ( not ( = ?auto_809493 ?auto_809507 ) ) ( not ( = ?auto_809494 ?auto_809495 ) ) ( not ( = ?auto_809494 ?auto_809496 ) ) ( not ( = ?auto_809494 ?auto_809497 ) ) ( not ( = ?auto_809494 ?auto_809498 ) ) ( not ( = ?auto_809494 ?auto_809499 ) ) ( not ( = ?auto_809494 ?auto_809500 ) ) ( not ( = ?auto_809494 ?auto_809501 ) ) ( not ( = ?auto_809494 ?auto_809502 ) ) ( not ( = ?auto_809494 ?auto_809503 ) ) ( not ( = ?auto_809494 ?auto_809504 ) ) ( not ( = ?auto_809494 ?auto_809505 ) ) ( not ( = ?auto_809494 ?auto_809506 ) ) ( not ( = ?auto_809494 ?auto_809507 ) ) ( not ( = ?auto_809495 ?auto_809496 ) ) ( not ( = ?auto_809495 ?auto_809497 ) ) ( not ( = ?auto_809495 ?auto_809498 ) ) ( not ( = ?auto_809495 ?auto_809499 ) ) ( not ( = ?auto_809495 ?auto_809500 ) ) ( not ( = ?auto_809495 ?auto_809501 ) ) ( not ( = ?auto_809495 ?auto_809502 ) ) ( not ( = ?auto_809495 ?auto_809503 ) ) ( not ( = ?auto_809495 ?auto_809504 ) ) ( not ( = ?auto_809495 ?auto_809505 ) ) ( not ( = ?auto_809495 ?auto_809506 ) ) ( not ( = ?auto_809495 ?auto_809507 ) ) ( not ( = ?auto_809496 ?auto_809497 ) ) ( not ( = ?auto_809496 ?auto_809498 ) ) ( not ( = ?auto_809496 ?auto_809499 ) ) ( not ( = ?auto_809496 ?auto_809500 ) ) ( not ( = ?auto_809496 ?auto_809501 ) ) ( not ( = ?auto_809496 ?auto_809502 ) ) ( not ( = ?auto_809496 ?auto_809503 ) ) ( not ( = ?auto_809496 ?auto_809504 ) ) ( not ( = ?auto_809496 ?auto_809505 ) ) ( not ( = ?auto_809496 ?auto_809506 ) ) ( not ( = ?auto_809496 ?auto_809507 ) ) ( not ( = ?auto_809497 ?auto_809498 ) ) ( not ( = ?auto_809497 ?auto_809499 ) ) ( not ( = ?auto_809497 ?auto_809500 ) ) ( not ( = ?auto_809497 ?auto_809501 ) ) ( not ( = ?auto_809497 ?auto_809502 ) ) ( not ( = ?auto_809497 ?auto_809503 ) ) ( not ( = ?auto_809497 ?auto_809504 ) ) ( not ( = ?auto_809497 ?auto_809505 ) ) ( not ( = ?auto_809497 ?auto_809506 ) ) ( not ( = ?auto_809497 ?auto_809507 ) ) ( not ( = ?auto_809498 ?auto_809499 ) ) ( not ( = ?auto_809498 ?auto_809500 ) ) ( not ( = ?auto_809498 ?auto_809501 ) ) ( not ( = ?auto_809498 ?auto_809502 ) ) ( not ( = ?auto_809498 ?auto_809503 ) ) ( not ( = ?auto_809498 ?auto_809504 ) ) ( not ( = ?auto_809498 ?auto_809505 ) ) ( not ( = ?auto_809498 ?auto_809506 ) ) ( not ( = ?auto_809498 ?auto_809507 ) ) ( not ( = ?auto_809499 ?auto_809500 ) ) ( not ( = ?auto_809499 ?auto_809501 ) ) ( not ( = ?auto_809499 ?auto_809502 ) ) ( not ( = ?auto_809499 ?auto_809503 ) ) ( not ( = ?auto_809499 ?auto_809504 ) ) ( not ( = ?auto_809499 ?auto_809505 ) ) ( not ( = ?auto_809499 ?auto_809506 ) ) ( not ( = ?auto_809499 ?auto_809507 ) ) ( not ( = ?auto_809500 ?auto_809501 ) ) ( not ( = ?auto_809500 ?auto_809502 ) ) ( not ( = ?auto_809500 ?auto_809503 ) ) ( not ( = ?auto_809500 ?auto_809504 ) ) ( not ( = ?auto_809500 ?auto_809505 ) ) ( not ( = ?auto_809500 ?auto_809506 ) ) ( not ( = ?auto_809500 ?auto_809507 ) ) ( not ( = ?auto_809501 ?auto_809502 ) ) ( not ( = ?auto_809501 ?auto_809503 ) ) ( not ( = ?auto_809501 ?auto_809504 ) ) ( not ( = ?auto_809501 ?auto_809505 ) ) ( not ( = ?auto_809501 ?auto_809506 ) ) ( not ( = ?auto_809501 ?auto_809507 ) ) ( not ( = ?auto_809502 ?auto_809503 ) ) ( not ( = ?auto_809502 ?auto_809504 ) ) ( not ( = ?auto_809502 ?auto_809505 ) ) ( not ( = ?auto_809502 ?auto_809506 ) ) ( not ( = ?auto_809502 ?auto_809507 ) ) ( not ( = ?auto_809503 ?auto_809504 ) ) ( not ( = ?auto_809503 ?auto_809505 ) ) ( not ( = ?auto_809503 ?auto_809506 ) ) ( not ( = ?auto_809503 ?auto_809507 ) ) ( not ( = ?auto_809504 ?auto_809505 ) ) ( not ( = ?auto_809504 ?auto_809506 ) ) ( not ( = ?auto_809504 ?auto_809507 ) ) ( not ( = ?auto_809505 ?auto_809506 ) ) ( not ( = ?auto_809505 ?auto_809507 ) ) ( not ( = ?auto_809506 ?auto_809507 ) ) ( ON ?auto_809506 ?auto_809507 ) ( ON ?auto_809505 ?auto_809506 ) ( ON ?auto_809504 ?auto_809505 ) ( ON ?auto_809503 ?auto_809504 ) ( ON ?auto_809502 ?auto_809503 ) ( ON ?auto_809501 ?auto_809502 ) ( ON ?auto_809500 ?auto_809501 ) ( ON ?auto_809499 ?auto_809500 ) ( ON ?auto_809498 ?auto_809499 ) ( CLEAR ?auto_809496 ) ( ON ?auto_809497 ?auto_809498 ) ( CLEAR ?auto_809497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_809490 ?auto_809491 ?auto_809492 ?auto_809493 ?auto_809494 ?auto_809495 ?auto_809496 ?auto_809497 )
      ( MAKE-18PILE ?auto_809490 ?auto_809491 ?auto_809492 ?auto_809493 ?auto_809494 ?auto_809495 ?auto_809496 ?auto_809497 ?auto_809498 ?auto_809499 ?auto_809500 ?auto_809501 ?auto_809502 ?auto_809503 ?auto_809504 ?auto_809505 ?auto_809506 ?auto_809507 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809526 - BLOCK
      ?auto_809527 - BLOCK
      ?auto_809528 - BLOCK
      ?auto_809529 - BLOCK
      ?auto_809530 - BLOCK
      ?auto_809531 - BLOCK
      ?auto_809532 - BLOCK
      ?auto_809533 - BLOCK
      ?auto_809534 - BLOCK
      ?auto_809535 - BLOCK
      ?auto_809536 - BLOCK
      ?auto_809537 - BLOCK
      ?auto_809538 - BLOCK
      ?auto_809539 - BLOCK
      ?auto_809540 - BLOCK
      ?auto_809541 - BLOCK
      ?auto_809542 - BLOCK
      ?auto_809543 - BLOCK
    )
    :vars
    (
      ?auto_809544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809543 ?auto_809544 ) ( ON-TABLE ?auto_809526 ) ( ON ?auto_809527 ?auto_809526 ) ( ON ?auto_809528 ?auto_809527 ) ( ON ?auto_809529 ?auto_809528 ) ( ON ?auto_809530 ?auto_809529 ) ( ON ?auto_809531 ?auto_809530 ) ( not ( = ?auto_809526 ?auto_809527 ) ) ( not ( = ?auto_809526 ?auto_809528 ) ) ( not ( = ?auto_809526 ?auto_809529 ) ) ( not ( = ?auto_809526 ?auto_809530 ) ) ( not ( = ?auto_809526 ?auto_809531 ) ) ( not ( = ?auto_809526 ?auto_809532 ) ) ( not ( = ?auto_809526 ?auto_809533 ) ) ( not ( = ?auto_809526 ?auto_809534 ) ) ( not ( = ?auto_809526 ?auto_809535 ) ) ( not ( = ?auto_809526 ?auto_809536 ) ) ( not ( = ?auto_809526 ?auto_809537 ) ) ( not ( = ?auto_809526 ?auto_809538 ) ) ( not ( = ?auto_809526 ?auto_809539 ) ) ( not ( = ?auto_809526 ?auto_809540 ) ) ( not ( = ?auto_809526 ?auto_809541 ) ) ( not ( = ?auto_809526 ?auto_809542 ) ) ( not ( = ?auto_809526 ?auto_809543 ) ) ( not ( = ?auto_809526 ?auto_809544 ) ) ( not ( = ?auto_809527 ?auto_809528 ) ) ( not ( = ?auto_809527 ?auto_809529 ) ) ( not ( = ?auto_809527 ?auto_809530 ) ) ( not ( = ?auto_809527 ?auto_809531 ) ) ( not ( = ?auto_809527 ?auto_809532 ) ) ( not ( = ?auto_809527 ?auto_809533 ) ) ( not ( = ?auto_809527 ?auto_809534 ) ) ( not ( = ?auto_809527 ?auto_809535 ) ) ( not ( = ?auto_809527 ?auto_809536 ) ) ( not ( = ?auto_809527 ?auto_809537 ) ) ( not ( = ?auto_809527 ?auto_809538 ) ) ( not ( = ?auto_809527 ?auto_809539 ) ) ( not ( = ?auto_809527 ?auto_809540 ) ) ( not ( = ?auto_809527 ?auto_809541 ) ) ( not ( = ?auto_809527 ?auto_809542 ) ) ( not ( = ?auto_809527 ?auto_809543 ) ) ( not ( = ?auto_809527 ?auto_809544 ) ) ( not ( = ?auto_809528 ?auto_809529 ) ) ( not ( = ?auto_809528 ?auto_809530 ) ) ( not ( = ?auto_809528 ?auto_809531 ) ) ( not ( = ?auto_809528 ?auto_809532 ) ) ( not ( = ?auto_809528 ?auto_809533 ) ) ( not ( = ?auto_809528 ?auto_809534 ) ) ( not ( = ?auto_809528 ?auto_809535 ) ) ( not ( = ?auto_809528 ?auto_809536 ) ) ( not ( = ?auto_809528 ?auto_809537 ) ) ( not ( = ?auto_809528 ?auto_809538 ) ) ( not ( = ?auto_809528 ?auto_809539 ) ) ( not ( = ?auto_809528 ?auto_809540 ) ) ( not ( = ?auto_809528 ?auto_809541 ) ) ( not ( = ?auto_809528 ?auto_809542 ) ) ( not ( = ?auto_809528 ?auto_809543 ) ) ( not ( = ?auto_809528 ?auto_809544 ) ) ( not ( = ?auto_809529 ?auto_809530 ) ) ( not ( = ?auto_809529 ?auto_809531 ) ) ( not ( = ?auto_809529 ?auto_809532 ) ) ( not ( = ?auto_809529 ?auto_809533 ) ) ( not ( = ?auto_809529 ?auto_809534 ) ) ( not ( = ?auto_809529 ?auto_809535 ) ) ( not ( = ?auto_809529 ?auto_809536 ) ) ( not ( = ?auto_809529 ?auto_809537 ) ) ( not ( = ?auto_809529 ?auto_809538 ) ) ( not ( = ?auto_809529 ?auto_809539 ) ) ( not ( = ?auto_809529 ?auto_809540 ) ) ( not ( = ?auto_809529 ?auto_809541 ) ) ( not ( = ?auto_809529 ?auto_809542 ) ) ( not ( = ?auto_809529 ?auto_809543 ) ) ( not ( = ?auto_809529 ?auto_809544 ) ) ( not ( = ?auto_809530 ?auto_809531 ) ) ( not ( = ?auto_809530 ?auto_809532 ) ) ( not ( = ?auto_809530 ?auto_809533 ) ) ( not ( = ?auto_809530 ?auto_809534 ) ) ( not ( = ?auto_809530 ?auto_809535 ) ) ( not ( = ?auto_809530 ?auto_809536 ) ) ( not ( = ?auto_809530 ?auto_809537 ) ) ( not ( = ?auto_809530 ?auto_809538 ) ) ( not ( = ?auto_809530 ?auto_809539 ) ) ( not ( = ?auto_809530 ?auto_809540 ) ) ( not ( = ?auto_809530 ?auto_809541 ) ) ( not ( = ?auto_809530 ?auto_809542 ) ) ( not ( = ?auto_809530 ?auto_809543 ) ) ( not ( = ?auto_809530 ?auto_809544 ) ) ( not ( = ?auto_809531 ?auto_809532 ) ) ( not ( = ?auto_809531 ?auto_809533 ) ) ( not ( = ?auto_809531 ?auto_809534 ) ) ( not ( = ?auto_809531 ?auto_809535 ) ) ( not ( = ?auto_809531 ?auto_809536 ) ) ( not ( = ?auto_809531 ?auto_809537 ) ) ( not ( = ?auto_809531 ?auto_809538 ) ) ( not ( = ?auto_809531 ?auto_809539 ) ) ( not ( = ?auto_809531 ?auto_809540 ) ) ( not ( = ?auto_809531 ?auto_809541 ) ) ( not ( = ?auto_809531 ?auto_809542 ) ) ( not ( = ?auto_809531 ?auto_809543 ) ) ( not ( = ?auto_809531 ?auto_809544 ) ) ( not ( = ?auto_809532 ?auto_809533 ) ) ( not ( = ?auto_809532 ?auto_809534 ) ) ( not ( = ?auto_809532 ?auto_809535 ) ) ( not ( = ?auto_809532 ?auto_809536 ) ) ( not ( = ?auto_809532 ?auto_809537 ) ) ( not ( = ?auto_809532 ?auto_809538 ) ) ( not ( = ?auto_809532 ?auto_809539 ) ) ( not ( = ?auto_809532 ?auto_809540 ) ) ( not ( = ?auto_809532 ?auto_809541 ) ) ( not ( = ?auto_809532 ?auto_809542 ) ) ( not ( = ?auto_809532 ?auto_809543 ) ) ( not ( = ?auto_809532 ?auto_809544 ) ) ( not ( = ?auto_809533 ?auto_809534 ) ) ( not ( = ?auto_809533 ?auto_809535 ) ) ( not ( = ?auto_809533 ?auto_809536 ) ) ( not ( = ?auto_809533 ?auto_809537 ) ) ( not ( = ?auto_809533 ?auto_809538 ) ) ( not ( = ?auto_809533 ?auto_809539 ) ) ( not ( = ?auto_809533 ?auto_809540 ) ) ( not ( = ?auto_809533 ?auto_809541 ) ) ( not ( = ?auto_809533 ?auto_809542 ) ) ( not ( = ?auto_809533 ?auto_809543 ) ) ( not ( = ?auto_809533 ?auto_809544 ) ) ( not ( = ?auto_809534 ?auto_809535 ) ) ( not ( = ?auto_809534 ?auto_809536 ) ) ( not ( = ?auto_809534 ?auto_809537 ) ) ( not ( = ?auto_809534 ?auto_809538 ) ) ( not ( = ?auto_809534 ?auto_809539 ) ) ( not ( = ?auto_809534 ?auto_809540 ) ) ( not ( = ?auto_809534 ?auto_809541 ) ) ( not ( = ?auto_809534 ?auto_809542 ) ) ( not ( = ?auto_809534 ?auto_809543 ) ) ( not ( = ?auto_809534 ?auto_809544 ) ) ( not ( = ?auto_809535 ?auto_809536 ) ) ( not ( = ?auto_809535 ?auto_809537 ) ) ( not ( = ?auto_809535 ?auto_809538 ) ) ( not ( = ?auto_809535 ?auto_809539 ) ) ( not ( = ?auto_809535 ?auto_809540 ) ) ( not ( = ?auto_809535 ?auto_809541 ) ) ( not ( = ?auto_809535 ?auto_809542 ) ) ( not ( = ?auto_809535 ?auto_809543 ) ) ( not ( = ?auto_809535 ?auto_809544 ) ) ( not ( = ?auto_809536 ?auto_809537 ) ) ( not ( = ?auto_809536 ?auto_809538 ) ) ( not ( = ?auto_809536 ?auto_809539 ) ) ( not ( = ?auto_809536 ?auto_809540 ) ) ( not ( = ?auto_809536 ?auto_809541 ) ) ( not ( = ?auto_809536 ?auto_809542 ) ) ( not ( = ?auto_809536 ?auto_809543 ) ) ( not ( = ?auto_809536 ?auto_809544 ) ) ( not ( = ?auto_809537 ?auto_809538 ) ) ( not ( = ?auto_809537 ?auto_809539 ) ) ( not ( = ?auto_809537 ?auto_809540 ) ) ( not ( = ?auto_809537 ?auto_809541 ) ) ( not ( = ?auto_809537 ?auto_809542 ) ) ( not ( = ?auto_809537 ?auto_809543 ) ) ( not ( = ?auto_809537 ?auto_809544 ) ) ( not ( = ?auto_809538 ?auto_809539 ) ) ( not ( = ?auto_809538 ?auto_809540 ) ) ( not ( = ?auto_809538 ?auto_809541 ) ) ( not ( = ?auto_809538 ?auto_809542 ) ) ( not ( = ?auto_809538 ?auto_809543 ) ) ( not ( = ?auto_809538 ?auto_809544 ) ) ( not ( = ?auto_809539 ?auto_809540 ) ) ( not ( = ?auto_809539 ?auto_809541 ) ) ( not ( = ?auto_809539 ?auto_809542 ) ) ( not ( = ?auto_809539 ?auto_809543 ) ) ( not ( = ?auto_809539 ?auto_809544 ) ) ( not ( = ?auto_809540 ?auto_809541 ) ) ( not ( = ?auto_809540 ?auto_809542 ) ) ( not ( = ?auto_809540 ?auto_809543 ) ) ( not ( = ?auto_809540 ?auto_809544 ) ) ( not ( = ?auto_809541 ?auto_809542 ) ) ( not ( = ?auto_809541 ?auto_809543 ) ) ( not ( = ?auto_809541 ?auto_809544 ) ) ( not ( = ?auto_809542 ?auto_809543 ) ) ( not ( = ?auto_809542 ?auto_809544 ) ) ( not ( = ?auto_809543 ?auto_809544 ) ) ( ON ?auto_809542 ?auto_809543 ) ( ON ?auto_809541 ?auto_809542 ) ( ON ?auto_809540 ?auto_809541 ) ( ON ?auto_809539 ?auto_809540 ) ( ON ?auto_809538 ?auto_809539 ) ( ON ?auto_809537 ?auto_809538 ) ( ON ?auto_809536 ?auto_809537 ) ( ON ?auto_809535 ?auto_809536 ) ( ON ?auto_809534 ?auto_809535 ) ( ON ?auto_809533 ?auto_809534 ) ( CLEAR ?auto_809531 ) ( ON ?auto_809532 ?auto_809533 ) ( CLEAR ?auto_809532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_809526 ?auto_809527 ?auto_809528 ?auto_809529 ?auto_809530 ?auto_809531 ?auto_809532 )
      ( MAKE-18PILE ?auto_809526 ?auto_809527 ?auto_809528 ?auto_809529 ?auto_809530 ?auto_809531 ?auto_809532 ?auto_809533 ?auto_809534 ?auto_809535 ?auto_809536 ?auto_809537 ?auto_809538 ?auto_809539 ?auto_809540 ?auto_809541 ?auto_809542 ?auto_809543 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809563 - BLOCK
      ?auto_809564 - BLOCK
      ?auto_809565 - BLOCK
      ?auto_809566 - BLOCK
      ?auto_809567 - BLOCK
      ?auto_809568 - BLOCK
      ?auto_809569 - BLOCK
      ?auto_809570 - BLOCK
      ?auto_809571 - BLOCK
      ?auto_809572 - BLOCK
      ?auto_809573 - BLOCK
      ?auto_809574 - BLOCK
      ?auto_809575 - BLOCK
      ?auto_809576 - BLOCK
      ?auto_809577 - BLOCK
      ?auto_809578 - BLOCK
      ?auto_809579 - BLOCK
      ?auto_809580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809580 ) ( ON-TABLE ?auto_809563 ) ( ON ?auto_809564 ?auto_809563 ) ( ON ?auto_809565 ?auto_809564 ) ( ON ?auto_809566 ?auto_809565 ) ( ON ?auto_809567 ?auto_809566 ) ( ON ?auto_809568 ?auto_809567 ) ( not ( = ?auto_809563 ?auto_809564 ) ) ( not ( = ?auto_809563 ?auto_809565 ) ) ( not ( = ?auto_809563 ?auto_809566 ) ) ( not ( = ?auto_809563 ?auto_809567 ) ) ( not ( = ?auto_809563 ?auto_809568 ) ) ( not ( = ?auto_809563 ?auto_809569 ) ) ( not ( = ?auto_809563 ?auto_809570 ) ) ( not ( = ?auto_809563 ?auto_809571 ) ) ( not ( = ?auto_809563 ?auto_809572 ) ) ( not ( = ?auto_809563 ?auto_809573 ) ) ( not ( = ?auto_809563 ?auto_809574 ) ) ( not ( = ?auto_809563 ?auto_809575 ) ) ( not ( = ?auto_809563 ?auto_809576 ) ) ( not ( = ?auto_809563 ?auto_809577 ) ) ( not ( = ?auto_809563 ?auto_809578 ) ) ( not ( = ?auto_809563 ?auto_809579 ) ) ( not ( = ?auto_809563 ?auto_809580 ) ) ( not ( = ?auto_809564 ?auto_809565 ) ) ( not ( = ?auto_809564 ?auto_809566 ) ) ( not ( = ?auto_809564 ?auto_809567 ) ) ( not ( = ?auto_809564 ?auto_809568 ) ) ( not ( = ?auto_809564 ?auto_809569 ) ) ( not ( = ?auto_809564 ?auto_809570 ) ) ( not ( = ?auto_809564 ?auto_809571 ) ) ( not ( = ?auto_809564 ?auto_809572 ) ) ( not ( = ?auto_809564 ?auto_809573 ) ) ( not ( = ?auto_809564 ?auto_809574 ) ) ( not ( = ?auto_809564 ?auto_809575 ) ) ( not ( = ?auto_809564 ?auto_809576 ) ) ( not ( = ?auto_809564 ?auto_809577 ) ) ( not ( = ?auto_809564 ?auto_809578 ) ) ( not ( = ?auto_809564 ?auto_809579 ) ) ( not ( = ?auto_809564 ?auto_809580 ) ) ( not ( = ?auto_809565 ?auto_809566 ) ) ( not ( = ?auto_809565 ?auto_809567 ) ) ( not ( = ?auto_809565 ?auto_809568 ) ) ( not ( = ?auto_809565 ?auto_809569 ) ) ( not ( = ?auto_809565 ?auto_809570 ) ) ( not ( = ?auto_809565 ?auto_809571 ) ) ( not ( = ?auto_809565 ?auto_809572 ) ) ( not ( = ?auto_809565 ?auto_809573 ) ) ( not ( = ?auto_809565 ?auto_809574 ) ) ( not ( = ?auto_809565 ?auto_809575 ) ) ( not ( = ?auto_809565 ?auto_809576 ) ) ( not ( = ?auto_809565 ?auto_809577 ) ) ( not ( = ?auto_809565 ?auto_809578 ) ) ( not ( = ?auto_809565 ?auto_809579 ) ) ( not ( = ?auto_809565 ?auto_809580 ) ) ( not ( = ?auto_809566 ?auto_809567 ) ) ( not ( = ?auto_809566 ?auto_809568 ) ) ( not ( = ?auto_809566 ?auto_809569 ) ) ( not ( = ?auto_809566 ?auto_809570 ) ) ( not ( = ?auto_809566 ?auto_809571 ) ) ( not ( = ?auto_809566 ?auto_809572 ) ) ( not ( = ?auto_809566 ?auto_809573 ) ) ( not ( = ?auto_809566 ?auto_809574 ) ) ( not ( = ?auto_809566 ?auto_809575 ) ) ( not ( = ?auto_809566 ?auto_809576 ) ) ( not ( = ?auto_809566 ?auto_809577 ) ) ( not ( = ?auto_809566 ?auto_809578 ) ) ( not ( = ?auto_809566 ?auto_809579 ) ) ( not ( = ?auto_809566 ?auto_809580 ) ) ( not ( = ?auto_809567 ?auto_809568 ) ) ( not ( = ?auto_809567 ?auto_809569 ) ) ( not ( = ?auto_809567 ?auto_809570 ) ) ( not ( = ?auto_809567 ?auto_809571 ) ) ( not ( = ?auto_809567 ?auto_809572 ) ) ( not ( = ?auto_809567 ?auto_809573 ) ) ( not ( = ?auto_809567 ?auto_809574 ) ) ( not ( = ?auto_809567 ?auto_809575 ) ) ( not ( = ?auto_809567 ?auto_809576 ) ) ( not ( = ?auto_809567 ?auto_809577 ) ) ( not ( = ?auto_809567 ?auto_809578 ) ) ( not ( = ?auto_809567 ?auto_809579 ) ) ( not ( = ?auto_809567 ?auto_809580 ) ) ( not ( = ?auto_809568 ?auto_809569 ) ) ( not ( = ?auto_809568 ?auto_809570 ) ) ( not ( = ?auto_809568 ?auto_809571 ) ) ( not ( = ?auto_809568 ?auto_809572 ) ) ( not ( = ?auto_809568 ?auto_809573 ) ) ( not ( = ?auto_809568 ?auto_809574 ) ) ( not ( = ?auto_809568 ?auto_809575 ) ) ( not ( = ?auto_809568 ?auto_809576 ) ) ( not ( = ?auto_809568 ?auto_809577 ) ) ( not ( = ?auto_809568 ?auto_809578 ) ) ( not ( = ?auto_809568 ?auto_809579 ) ) ( not ( = ?auto_809568 ?auto_809580 ) ) ( not ( = ?auto_809569 ?auto_809570 ) ) ( not ( = ?auto_809569 ?auto_809571 ) ) ( not ( = ?auto_809569 ?auto_809572 ) ) ( not ( = ?auto_809569 ?auto_809573 ) ) ( not ( = ?auto_809569 ?auto_809574 ) ) ( not ( = ?auto_809569 ?auto_809575 ) ) ( not ( = ?auto_809569 ?auto_809576 ) ) ( not ( = ?auto_809569 ?auto_809577 ) ) ( not ( = ?auto_809569 ?auto_809578 ) ) ( not ( = ?auto_809569 ?auto_809579 ) ) ( not ( = ?auto_809569 ?auto_809580 ) ) ( not ( = ?auto_809570 ?auto_809571 ) ) ( not ( = ?auto_809570 ?auto_809572 ) ) ( not ( = ?auto_809570 ?auto_809573 ) ) ( not ( = ?auto_809570 ?auto_809574 ) ) ( not ( = ?auto_809570 ?auto_809575 ) ) ( not ( = ?auto_809570 ?auto_809576 ) ) ( not ( = ?auto_809570 ?auto_809577 ) ) ( not ( = ?auto_809570 ?auto_809578 ) ) ( not ( = ?auto_809570 ?auto_809579 ) ) ( not ( = ?auto_809570 ?auto_809580 ) ) ( not ( = ?auto_809571 ?auto_809572 ) ) ( not ( = ?auto_809571 ?auto_809573 ) ) ( not ( = ?auto_809571 ?auto_809574 ) ) ( not ( = ?auto_809571 ?auto_809575 ) ) ( not ( = ?auto_809571 ?auto_809576 ) ) ( not ( = ?auto_809571 ?auto_809577 ) ) ( not ( = ?auto_809571 ?auto_809578 ) ) ( not ( = ?auto_809571 ?auto_809579 ) ) ( not ( = ?auto_809571 ?auto_809580 ) ) ( not ( = ?auto_809572 ?auto_809573 ) ) ( not ( = ?auto_809572 ?auto_809574 ) ) ( not ( = ?auto_809572 ?auto_809575 ) ) ( not ( = ?auto_809572 ?auto_809576 ) ) ( not ( = ?auto_809572 ?auto_809577 ) ) ( not ( = ?auto_809572 ?auto_809578 ) ) ( not ( = ?auto_809572 ?auto_809579 ) ) ( not ( = ?auto_809572 ?auto_809580 ) ) ( not ( = ?auto_809573 ?auto_809574 ) ) ( not ( = ?auto_809573 ?auto_809575 ) ) ( not ( = ?auto_809573 ?auto_809576 ) ) ( not ( = ?auto_809573 ?auto_809577 ) ) ( not ( = ?auto_809573 ?auto_809578 ) ) ( not ( = ?auto_809573 ?auto_809579 ) ) ( not ( = ?auto_809573 ?auto_809580 ) ) ( not ( = ?auto_809574 ?auto_809575 ) ) ( not ( = ?auto_809574 ?auto_809576 ) ) ( not ( = ?auto_809574 ?auto_809577 ) ) ( not ( = ?auto_809574 ?auto_809578 ) ) ( not ( = ?auto_809574 ?auto_809579 ) ) ( not ( = ?auto_809574 ?auto_809580 ) ) ( not ( = ?auto_809575 ?auto_809576 ) ) ( not ( = ?auto_809575 ?auto_809577 ) ) ( not ( = ?auto_809575 ?auto_809578 ) ) ( not ( = ?auto_809575 ?auto_809579 ) ) ( not ( = ?auto_809575 ?auto_809580 ) ) ( not ( = ?auto_809576 ?auto_809577 ) ) ( not ( = ?auto_809576 ?auto_809578 ) ) ( not ( = ?auto_809576 ?auto_809579 ) ) ( not ( = ?auto_809576 ?auto_809580 ) ) ( not ( = ?auto_809577 ?auto_809578 ) ) ( not ( = ?auto_809577 ?auto_809579 ) ) ( not ( = ?auto_809577 ?auto_809580 ) ) ( not ( = ?auto_809578 ?auto_809579 ) ) ( not ( = ?auto_809578 ?auto_809580 ) ) ( not ( = ?auto_809579 ?auto_809580 ) ) ( ON ?auto_809579 ?auto_809580 ) ( ON ?auto_809578 ?auto_809579 ) ( ON ?auto_809577 ?auto_809578 ) ( ON ?auto_809576 ?auto_809577 ) ( ON ?auto_809575 ?auto_809576 ) ( ON ?auto_809574 ?auto_809575 ) ( ON ?auto_809573 ?auto_809574 ) ( ON ?auto_809572 ?auto_809573 ) ( ON ?auto_809571 ?auto_809572 ) ( ON ?auto_809570 ?auto_809571 ) ( CLEAR ?auto_809568 ) ( ON ?auto_809569 ?auto_809570 ) ( CLEAR ?auto_809569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_809563 ?auto_809564 ?auto_809565 ?auto_809566 ?auto_809567 ?auto_809568 ?auto_809569 )
      ( MAKE-18PILE ?auto_809563 ?auto_809564 ?auto_809565 ?auto_809566 ?auto_809567 ?auto_809568 ?auto_809569 ?auto_809570 ?auto_809571 ?auto_809572 ?auto_809573 ?auto_809574 ?auto_809575 ?auto_809576 ?auto_809577 ?auto_809578 ?auto_809579 ?auto_809580 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809599 - BLOCK
      ?auto_809600 - BLOCK
      ?auto_809601 - BLOCK
      ?auto_809602 - BLOCK
      ?auto_809603 - BLOCK
      ?auto_809604 - BLOCK
      ?auto_809605 - BLOCK
      ?auto_809606 - BLOCK
      ?auto_809607 - BLOCK
      ?auto_809608 - BLOCK
      ?auto_809609 - BLOCK
      ?auto_809610 - BLOCK
      ?auto_809611 - BLOCK
      ?auto_809612 - BLOCK
      ?auto_809613 - BLOCK
      ?auto_809614 - BLOCK
      ?auto_809615 - BLOCK
      ?auto_809616 - BLOCK
    )
    :vars
    (
      ?auto_809617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809616 ?auto_809617 ) ( ON-TABLE ?auto_809599 ) ( ON ?auto_809600 ?auto_809599 ) ( ON ?auto_809601 ?auto_809600 ) ( ON ?auto_809602 ?auto_809601 ) ( ON ?auto_809603 ?auto_809602 ) ( not ( = ?auto_809599 ?auto_809600 ) ) ( not ( = ?auto_809599 ?auto_809601 ) ) ( not ( = ?auto_809599 ?auto_809602 ) ) ( not ( = ?auto_809599 ?auto_809603 ) ) ( not ( = ?auto_809599 ?auto_809604 ) ) ( not ( = ?auto_809599 ?auto_809605 ) ) ( not ( = ?auto_809599 ?auto_809606 ) ) ( not ( = ?auto_809599 ?auto_809607 ) ) ( not ( = ?auto_809599 ?auto_809608 ) ) ( not ( = ?auto_809599 ?auto_809609 ) ) ( not ( = ?auto_809599 ?auto_809610 ) ) ( not ( = ?auto_809599 ?auto_809611 ) ) ( not ( = ?auto_809599 ?auto_809612 ) ) ( not ( = ?auto_809599 ?auto_809613 ) ) ( not ( = ?auto_809599 ?auto_809614 ) ) ( not ( = ?auto_809599 ?auto_809615 ) ) ( not ( = ?auto_809599 ?auto_809616 ) ) ( not ( = ?auto_809599 ?auto_809617 ) ) ( not ( = ?auto_809600 ?auto_809601 ) ) ( not ( = ?auto_809600 ?auto_809602 ) ) ( not ( = ?auto_809600 ?auto_809603 ) ) ( not ( = ?auto_809600 ?auto_809604 ) ) ( not ( = ?auto_809600 ?auto_809605 ) ) ( not ( = ?auto_809600 ?auto_809606 ) ) ( not ( = ?auto_809600 ?auto_809607 ) ) ( not ( = ?auto_809600 ?auto_809608 ) ) ( not ( = ?auto_809600 ?auto_809609 ) ) ( not ( = ?auto_809600 ?auto_809610 ) ) ( not ( = ?auto_809600 ?auto_809611 ) ) ( not ( = ?auto_809600 ?auto_809612 ) ) ( not ( = ?auto_809600 ?auto_809613 ) ) ( not ( = ?auto_809600 ?auto_809614 ) ) ( not ( = ?auto_809600 ?auto_809615 ) ) ( not ( = ?auto_809600 ?auto_809616 ) ) ( not ( = ?auto_809600 ?auto_809617 ) ) ( not ( = ?auto_809601 ?auto_809602 ) ) ( not ( = ?auto_809601 ?auto_809603 ) ) ( not ( = ?auto_809601 ?auto_809604 ) ) ( not ( = ?auto_809601 ?auto_809605 ) ) ( not ( = ?auto_809601 ?auto_809606 ) ) ( not ( = ?auto_809601 ?auto_809607 ) ) ( not ( = ?auto_809601 ?auto_809608 ) ) ( not ( = ?auto_809601 ?auto_809609 ) ) ( not ( = ?auto_809601 ?auto_809610 ) ) ( not ( = ?auto_809601 ?auto_809611 ) ) ( not ( = ?auto_809601 ?auto_809612 ) ) ( not ( = ?auto_809601 ?auto_809613 ) ) ( not ( = ?auto_809601 ?auto_809614 ) ) ( not ( = ?auto_809601 ?auto_809615 ) ) ( not ( = ?auto_809601 ?auto_809616 ) ) ( not ( = ?auto_809601 ?auto_809617 ) ) ( not ( = ?auto_809602 ?auto_809603 ) ) ( not ( = ?auto_809602 ?auto_809604 ) ) ( not ( = ?auto_809602 ?auto_809605 ) ) ( not ( = ?auto_809602 ?auto_809606 ) ) ( not ( = ?auto_809602 ?auto_809607 ) ) ( not ( = ?auto_809602 ?auto_809608 ) ) ( not ( = ?auto_809602 ?auto_809609 ) ) ( not ( = ?auto_809602 ?auto_809610 ) ) ( not ( = ?auto_809602 ?auto_809611 ) ) ( not ( = ?auto_809602 ?auto_809612 ) ) ( not ( = ?auto_809602 ?auto_809613 ) ) ( not ( = ?auto_809602 ?auto_809614 ) ) ( not ( = ?auto_809602 ?auto_809615 ) ) ( not ( = ?auto_809602 ?auto_809616 ) ) ( not ( = ?auto_809602 ?auto_809617 ) ) ( not ( = ?auto_809603 ?auto_809604 ) ) ( not ( = ?auto_809603 ?auto_809605 ) ) ( not ( = ?auto_809603 ?auto_809606 ) ) ( not ( = ?auto_809603 ?auto_809607 ) ) ( not ( = ?auto_809603 ?auto_809608 ) ) ( not ( = ?auto_809603 ?auto_809609 ) ) ( not ( = ?auto_809603 ?auto_809610 ) ) ( not ( = ?auto_809603 ?auto_809611 ) ) ( not ( = ?auto_809603 ?auto_809612 ) ) ( not ( = ?auto_809603 ?auto_809613 ) ) ( not ( = ?auto_809603 ?auto_809614 ) ) ( not ( = ?auto_809603 ?auto_809615 ) ) ( not ( = ?auto_809603 ?auto_809616 ) ) ( not ( = ?auto_809603 ?auto_809617 ) ) ( not ( = ?auto_809604 ?auto_809605 ) ) ( not ( = ?auto_809604 ?auto_809606 ) ) ( not ( = ?auto_809604 ?auto_809607 ) ) ( not ( = ?auto_809604 ?auto_809608 ) ) ( not ( = ?auto_809604 ?auto_809609 ) ) ( not ( = ?auto_809604 ?auto_809610 ) ) ( not ( = ?auto_809604 ?auto_809611 ) ) ( not ( = ?auto_809604 ?auto_809612 ) ) ( not ( = ?auto_809604 ?auto_809613 ) ) ( not ( = ?auto_809604 ?auto_809614 ) ) ( not ( = ?auto_809604 ?auto_809615 ) ) ( not ( = ?auto_809604 ?auto_809616 ) ) ( not ( = ?auto_809604 ?auto_809617 ) ) ( not ( = ?auto_809605 ?auto_809606 ) ) ( not ( = ?auto_809605 ?auto_809607 ) ) ( not ( = ?auto_809605 ?auto_809608 ) ) ( not ( = ?auto_809605 ?auto_809609 ) ) ( not ( = ?auto_809605 ?auto_809610 ) ) ( not ( = ?auto_809605 ?auto_809611 ) ) ( not ( = ?auto_809605 ?auto_809612 ) ) ( not ( = ?auto_809605 ?auto_809613 ) ) ( not ( = ?auto_809605 ?auto_809614 ) ) ( not ( = ?auto_809605 ?auto_809615 ) ) ( not ( = ?auto_809605 ?auto_809616 ) ) ( not ( = ?auto_809605 ?auto_809617 ) ) ( not ( = ?auto_809606 ?auto_809607 ) ) ( not ( = ?auto_809606 ?auto_809608 ) ) ( not ( = ?auto_809606 ?auto_809609 ) ) ( not ( = ?auto_809606 ?auto_809610 ) ) ( not ( = ?auto_809606 ?auto_809611 ) ) ( not ( = ?auto_809606 ?auto_809612 ) ) ( not ( = ?auto_809606 ?auto_809613 ) ) ( not ( = ?auto_809606 ?auto_809614 ) ) ( not ( = ?auto_809606 ?auto_809615 ) ) ( not ( = ?auto_809606 ?auto_809616 ) ) ( not ( = ?auto_809606 ?auto_809617 ) ) ( not ( = ?auto_809607 ?auto_809608 ) ) ( not ( = ?auto_809607 ?auto_809609 ) ) ( not ( = ?auto_809607 ?auto_809610 ) ) ( not ( = ?auto_809607 ?auto_809611 ) ) ( not ( = ?auto_809607 ?auto_809612 ) ) ( not ( = ?auto_809607 ?auto_809613 ) ) ( not ( = ?auto_809607 ?auto_809614 ) ) ( not ( = ?auto_809607 ?auto_809615 ) ) ( not ( = ?auto_809607 ?auto_809616 ) ) ( not ( = ?auto_809607 ?auto_809617 ) ) ( not ( = ?auto_809608 ?auto_809609 ) ) ( not ( = ?auto_809608 ?auto_809610 ) ) ( not ( = ?auto_809608 ?auto_809611 ) ) ( not ( = ?auto_809608 ?auto_809612 ) ) ( not ( = ?auto_809608 ?auto_809613 ) ) ( not ( = ?auto_809608 ?auto_809614 ) ) ( not ( = ?auto_809608 ?auto_809615 ) ) ( not ( = ?auto_809608 ?auto_809616 ) ) ( not ( = ?auto_809608 ?auto_809617 ) ) ( not ( = ?auto_809609 ?auto_809610 ) ) ( not ( = ?auto_809609 ?auto_809611 ) ) ( not ( = ?auto_809609 ?auto_809612 ) ) ( not ( = ?auto_809609 ?auto_809613 ) ) ( not ( = ?auto_809609 ?auto_809614 ) ) ( not ( = ?auto_809609 ?auto_809615 ) ) ( not ( = ?auto_809609 ?auto_809616 ) ) ( not ( = ?auto_809609 ?auto_809617 ) ) ( not ( = ?auto_809610 ?auto_809611 ) ) ( not ( = ?auto_809610 ?auto_809612 ) ) ( not ( = ?auto_809610 ?auto_809613 ) ) ( not ( = ?auto_809610 ?auto_809614 ) ) ( not ( = ?auto_809610 ?auto_809615 ) ) ( not ( = ?auto_809610 ?auto_809616 ) ) ( not ( = ?auto_809610 ?auto_809617 ) ) ( not ( = ?auto_809611 ?auto_809612 ) ) ( not ( = ?auto_809611 ?auto_809613 ) ) ( not ( = ?auto_809611 ?auto_809614 ) ) ( not ( = ?auto_809611 ?auto_809615 ) ) ( not ( = ?auto_809611 ?auto_809616 ) ) ( not ( = ?auto_809611 ?auto_809617 ) ) ( not ( = ?auto_809612 ?auto_809613 ) ) ( not ( = ?auto_809612 ?auto_809614 ) ) ( not ( = ?auto_809612 ?auto_809615 ) ) ( not ( = ?auto_809612 ?auto_809616 ) ) ( not ( = ?auto_809612 ?auto_809617 ) ) ( not ( = ?auto_809613 ?auto_809614 ) ) ( not ( = ?auto_809613 ?auto_809615 ) ) ( not ( = ?auto_809613 ?auto_809616 ) ) ( not ( = ?auto_809613 ?auto_809617 ) ) ( not ( = ?auto_809614 ?auto_809615 ) ) ( not ( = ?auto_809614 ?auto_809616 ) ) ( not ( = ?auto_809614 ?auto_809617 ) ) ( not ( = ?auto_809615 ?auto_809616 ) ) ( not ( = ?auto_809615 ?auto_809617 ) ) ( not ( = ?auto_809616 ?auto_809617 ) ) ( ON ?auto_809615 ?auto_809616 ) ( ON ?auto_809614 ?auto_809615 ) ( ON ?auto_809613 ?auto_809614 ) ( ON ?auto_809612 ?auto_809613 ) ( ON ?auto_809611 ?auto_809612 ) ( ON ?auto_809610 ?auto_809611 ) ( ON ?auto_809609 ?auto_809610 ) ( ON ?auto_809608 ?auto_809609 ) ( ON ?auto_809607 ?auto_809608 ) ( ON ?auto_809606 ?auto_809607 ) ( ON ?auto_809605 ?auto_809606 ) ( CLEAR ?auto_809603 ) ( ON ?auto_809604 ?auto_809605 ) ( CLEAR ?auto_809604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_809599 ?auto_809600 ?auto_809601 ?auto_809602 ?auto_809603 ?auto_809604 )
      ( MAKE-18PILE ?auto_809599 ?auto_809600 ?auto_809601 ?auto_809602 ?auto_809603 ?auto_809604 ?auto_809605 ?auto_809606 ?auto_809607 ?auto_809608 ?auto_809609 ?auto_809610 ?auto_809611 ?auto_809612 ?auto_809613 ?auto_809614 ?auto_809615 ?auto_809616 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809636 - BLOCK
      ?auto_809637 - BLOCK
      ?auto_809638 - BLOCK
      ?auto_809639 - BLOCK
      ?auto_809640 - BLOCK
      ?auto_809641 - BLOCK
      ?auto_809642 - BLOCK
      ?auto_809643 - BLOCK
      ?auto_809644 - BLOCK
      ?auto_809645 - BLOCK
      ?auto_809646 - BLOCK
      ?auto_809647 - BLOCK
      ?auto_809648 - BLOCK
      ?auto_809649 - BLOCK
      ?auto_809650 - BLOCK
      ?auto_809651 - BLOCK
      ?auto_809652 - BLOCK
      ?auto_809653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809653 ) ( ON-TABLE ?auto_809636 ) ( ON ?auto_809637 ?auto_809636 ) ( ON ?auto_809638 ?auto_809637 ) ( ON ?auto_809639 ?auto_809638 ) ( ON ?auto_809640 ?auto_809639 ) ( not ( = ?auto_809636 ?auto_809637 ) ) ( not ( = ?auto_809636 ?auto_809638 ) ) ( not ( = ?auto_809636 ?auto_809639 ) ) ( not ( = ?auto_809636 ?auto_809640 ) ) ( not ( = ?auto_809636 ?auto_809641 ) ) ( not ( = ?auto_809636 ?auto_809642 ) ) ( not ( = ?auto_809636 ?auto_809643 ) ) ( not ( = ?auto_809636 ?auto_809644 ) ) ( not ( = ?auto_809636 ?auto_809645 ) ) ( not ( = ?auto_809636 ?auto_809646 ) ) ( not ( = ?auto_809636 ?auto_809647 ) ) ( not ( = ?auto_809636 ?auto_809648 ) ) ( not ( = ?auto_809636 ?auto_809649 ) ) ( not ( = ?auto_809636 ?auto_809650 ) ) ( not ( = ?auto_809636 ?auto_809651 ) ) ( not ( = ?auto_809636 ?auto_809652 ) ) ( not ( = ?auto_809636 ?auto_809653 ) ) ( not ( = ?auto_809637 ?auto_809638 ) ) ( not ( = ?auto_809637 ?auto_809639 ) ) ( not ( = ?auto_809637 ?auto_809640 ) ) ( not ( = ?auto_809637 ?auto_809641 ) ) ( not ( = ?auto_809637 ?auto_809642 ) ) ( not ( = ?auto_809637 ?auto_809643 ) ) ( not ( = ?auto_809637 ?auto_809644 ) ) ( not ( = ?auto_809637 ?auto_809645 ) ) ( not ( = ?auto_809637 ?auto_809646 ) ) ( not ( = ?auto_809637 ?auto_809647 ) ) ( not ( = ?auto_809637 ?auto_809648 ) ) ( not ( = ?auto_809637 ?auto_809649 ) ) ( not ( = ?auto_809637 ?auto_809650 ) ) ( not ( = ?auto_809637 ?auto_809651 ) ) ( not ( = ?auto_809637 ?auto_809652 ) ) ( not ( = ?auto_809637 ?auto_809653 ) ) ( not ( = ?auto_809638 ?auto_809639 ) ) ( not ( = ?auto_809638 ?auto_809640 ) ) ( not ( = ?auto_809638 ?auto_809641 ) ) ( not ( = ?auto_809638 ?auto_809642 ) ) ( not ( = ?auto_809638 ?auto_809643 ) ) ( not ( = ?auto_809638 ?auto_809644 ) ) ( not ( = ?auto_809638 ?auto_809645 ) ) ( not ( = ?auto_809638 ?auto_809646 ) ) ( not ( = ?auto_809638 ?auto_809647 ) ) ( not ( = ?auto_809638 ?auto_809648 ) ) ( not ( = ?auto_809638 ?auto_809649 ) ) ( not ( = ?auto_809638 ?auto_809650 ) ) ( not ( = ?auto_809638 ?auto_809651 ) ) ( not ( = ?auto_809638 ?auto_809652 ) ) ( not ( = ?auto_809638 ?auto_809653 ) ) ( not ( = ?auto_809639 ?auto_809640 ) ) ( not ( = ?auto_809639 ?auto_809641 ) ) ( not ( = ?auto_809639 ?auto_809642 ) ) ( not ( = ?auto_809639 ?auto_809643 ) ) ( not ( = ?auto_809639 ?auto_809644 ) ) ( not ( = ?auto_809639 ?auto_809645 ) ) ( not ( = ?auto_809639 ?auto_809646 ) ) ( not ( = ?auto_809639 ?auto_809647 ) ) ( not ( = ?auto_809639 ?auto_809648 ) ) ( not ( = ?auto_809639 ?auto_809649 ) ) ( not ( = ?auto_809639 ?auto_809650 ) ) ( not ( = ?auto_809639 ?auto_809651 ) ) ( not ( = ?auto_809639 ?auto_809652 ) ) ( not ( = ?auto_809639 ?auto_809653 ) ) ( not ( = ?auto_809640 ?auto_809641 ) ) ( not ( = ?auto_809640 ?auto_809642 ) ) ( not ( = ?auto_809640 ?auto_809643 ) ) ( not ( = ?auto_809640 ?auto_809644 ) ) ( not ( = ?auto_809640 ?auto_809645 ) ) ( not ( = ?auto_809640 ?auto_809646 ) ) ( not ( = ?auto_809640 ?auto_809647 ) ) ( not ( = ?auto_809640 ?auto_809648 ) ) ( not ( = ?auto_809640 ?auto_809649 ) ) ( not ( = ?auto_809640 ?auto_809650 ) ) ( not ( = ?auto_809640 ?auto_809651 ) ) ( not ( = ?auto_809640 ?auto_809652 ) ) ( not ( = ?auto_809640 ?auto_809653 ) ) ( not ( = ?auto_809641 ?auto_809642 ) ) ( not ( = ?auto_809641 ?auto_809643 ) ) ( not ( = ?auto_809641 ?auto_809644 ) ) ( not ( = ?auto_809641 ?auto_809645 ) ) ( not ( = ?auto_809641 ?auto_809646 ) ) ( not ( = ?auto_809641 ?auto_809647 ) ) ( not ( = ?auto_809641 ?auto_809648 ) ) ( not ( = ?auto_809641 ?auto_809649 ) ) ( not ( = ?auto_809641 ?auto_809650 ) ) ( not ( = ?auto_809641 ?auto_809651 ) ) ( not ( = ?auto_809641 ?auto_809652 ) ) ( not ( = ?auto_809641 ?auto_809653 ) ) ( not ( = ?auto_809642 ?auto_809643 ) ) ( not ( = ?auto_809642 ?auto_809644 ) ) ( not ( = ?auto_809642 ?auto_809645 ) ) ( not ( = ?auto_809642 ?auto_809646 ) ) ( not ( = ?auto_809642 ?auto_809647 ) ) ( not ( = ?auto_809642 ?auto_809648 ) ) ( not ( = ?auto_809642 ?auto_809649 ) ) ( not ( = ?auto_809642 ?auto_809650 ) ) ( not ( = ?auto_809642 ?auto_809651 ) ) ( not ( = ?auto_809642 ?auto_809652 ) ) ( not ( = ?auto_809642 ?auto_809653 ) ) ( not ( = ?auto_809643 ?auto_809644 ) ) ( not ( = ?auto_809643 ?auto_809645 ) ) ( not ( = ?auto_809643 ?auto_809646 ) ) ( not ( = ?auto_809643 ?auto_809647 ) ) ( not ( = ?auto_809643 ?auto_809648 ) ) ( not ( = ?auto_809643 ?auto_809649 ) ) ( not ( = ?auto_809643 ?auto_809650 ) ) ( not ( = ?auto_809643 ?auto_809651 ) ) ( not ( = ?auto_809643 ?auto_809652 ) ) ( not ( = ?auto_809643 ?auto_809653 ) ) ( not ( = ?auto_809644 ?auto_809645 ) ) ( not ( = ?auto_809644 ?auto_809646 ) ) ( not ( = ?auto_809644 ?auto_809647 ) ) ( not ( = ?auto_809644 ?auto_809648 ) ) ( not ( = ?auto_809644 ?auto_809649 ) ) ( not ( = ?auto_809644 ?auto_809650 ) ) ( not ( = ?auto_809644 ?auto_809651 ) ) ( not ( = ?auto_809644 ?auto_809652 ) ) ( not ( = ?auto_809644 ?auto_809653 ) ) ( not ( = ?auto_809645 ?auto_809646 ) ) ( not ( = ?auto_809645 ?auto_809647 ) ) ( not ( = ?auto_809645 ?auto_809648 ) ) ( not ( = ?auto_809645 ?auto_809649 ) ) ( not ( = ?auto_809645 ?auto_809650 ) ) ( not ( = ?auto_809645 ?auto_809651 ) ) ( not ( = ?auto_809645 ?auto_809652 ) ) ( not ( = ?auto_809645 ?auto_809653 ) ) ( not ( = ?auto_809646 ?auto_809647 ) ) ( not ( = ?auto_809646 ?auto_809648 ) ) ( not ( = ?auto_809646 ?auto_809649 ) ) ( not ( = ?auto_809646 ?auto_809650 ) ) ( not ( = ?auto_809646 ?auto_809651 ) ) ( not ( = ?auto_809646 ?auto_809652 ) ) ( not ( = ?auto_809646 ?auto_809653 ) ) ( not ( = ?auto_809647 ?auto_809648 ) ) ( not ( = ?auto_809647 ?auto_809649 ) ) ( not ( = ?auto_809647 ?auto_809650 ) ) ( not ( = ?auto_809647 ?auto_809651 ) ) ( not ( = ?auto_809647 ?auto_809652 ) ) ( not ( = ?auto_809647 ?auto_809653 ) ) ( not ( = ?auto_809648 ?auto_809649 ) ) ( not ( = ?auto_809648 ?auto_809650 ) ) ( not ( = ?auto_809648 ?auto_809651 ) ) ( not ( = ?auto_809648 ?auto_809652 ) ) ( not ( = ?auto_809648 ?auto_809653 ) ) ( not ( = ?auto_809649 ?auto_809650 ) ) ( not ( = ?auto_809649 ?auto_809651 ) ) ( not ( = ?auto_809649 ?auto_809652 ) ) ( not ( = ?auto_809649 ?auto_809653 ) ) ( not ( = ?auto_809650 ?auto_809651 ) ) ( not ( = ?auto_809650 ?auto_809652 ) ) ( not ( = ?auto_809650 ?auto_809653 ) ) ( not ( = ?auto_809651 ?auto_809652 ) ) ( not ( = ?auto_809651 ?auto_809653 ) ) ( not ( = ?auto_809652 ?auto_809653 ) ) ( ON ?auto_809652 ?auto_809653 ) ( ON ?auto_809651 ?auto_809652 ) ( ON ?auto_809650 ?auto_809651 ) ( ON ?auto_809649 ?auto_809650 ) ( ON ?auto_809648 ?auto_809649 ) ( ON ?auto_809647 ?auto_809648 ) ( ON ?auto_809646 ?auto_809647 ) ( ON ?auto_809645 ?auto_809646 ) ( ON ?auto_809644 ?auto_809645 ) ( ON ?auto_809643 ?auto_809644 ) ( ON ?auto_809642 ?auto_809643 ) ( CLEAR ?auto_809640 ) ( ON ?auto_809641 ?auto_809642 ) ( CLEAR ?auto_809641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_809636 ?auto_809637 ?auto_809638 ?auto_809639 ?auto_809640 ?auto_809641 )
      ( MAKE-18PILE ?auto_809636 ?auto_809637 ?auto_809638 ?auto_809639 ?auto_809640 ?auto_809641 ?auto_809642 ?auto_809643 ?auto_809644 ?auto_809645 ?auto_809646 ?auto_809647 ?auto_809648 ?auto_809649 ?auto_809650 ?auto_809651 ?auto_809652 ?auto_809653 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809672 - BLOCK
      ?auto_809673 - BLOCK
      ?auto_809674 - BLOCK
      ?auto_809675 - BLOCK
      ?auto_809676 - BLOCK
      ?auto_809677 - BLOCK
      ?auto_809678 - BLOCK
      ?auto_809679 - BLOCK
      ?auto_809680 - BLOCK
      ?auto_809681 - BLOCK
      ?auto_809682 - BLOCK
      ?auto_809683 - BLOCK
      ?auto_809684 - BLOCK
      ?auto_809685 - BLOCK
      ?auto_809686 - BLOCK
      ?auto_809687 - BLOCK
      ?auto_809688 - BLOCK
      ?auto_809689 - BLOCK
    )
    :vars
    (
      ?auto_809690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809689 ?auto_809690 ) ( ON-TABLE ?auto_809672 ) ( ON ?auto_809673 ?auto_809672 ) ( ON ?auto_809674 ?auto_809673 ) ( ON ?auto_809675 ?auto_809674 ) ( not ( = ?auto_809672 ?auto_809673 ) ) ( not ( = ?auto_809672 ?auto_809674 ) ) ( not ( = ?auto_809672 ?auto_809675 ) ) ( not ( = ?auto_809672 ?auto_809676 ) ) ( not ( = ?auto_809672 ?auto_809677 ) ) ( not ( = ?auto_809672 ?auto_809678 ) ) ( not ( = ?auto_809672 ?auto_809679 ) ) ( not ( = ?auto_809672 ?auto_809680 ) ) ( not ( = ?auto_809672 ?auto_809681 ) ) ( not ( = ?auto_809672 ?auto_809682 ) ) ( not ( = ?auto_809672 ?auto_809683 ) ) ( not ( = ?auto_809672 ?auto_809684 ) ) ( not ( = ?auto_809672 ?auto_809685 ) ) ( not ( = ?auto_809672 ?auto_809686 ) ) ( not ( = ?auto_809672 ?auto_809687 ) ) ( not ( = ?auto_809672 ?auto_809688 ) ) ( not ( = ?auto_809672 ?auto_809689 ) ) ( not ( = ?auto_809672 ?auto_809690 ) ) ( not ( = ?auto_809673 ?auto_809674 ) ) ( not ( = ?auto_809673 ?auto_809675 ) ) ( not ( = ?auto_809673 ?auto_809676 ) ) ( not ( = ?auto_809673 ?auto_809677 ) ) ( not ( = ?auto_809673 ?auto_809678 ) ) ( not ( = ?auto_809673 ?auto_809679 ) ) ( not ( = ?auto_809673 ?auto_809680 ) ) ( not ( = ?auto_809673 ?auto_809681 ) ) ( not ( = ?auto_809673 ?auto_809682 ) ) ( not ( = ?auto_809673 ?auto_809683 ) ) ( not ( = ?auto_809673 ?auto_809684 ) ) ( not ( = ?auto_809673 ?auto_809685 ) ) ( not ( = ?auto_809673 ?auto_809686 ) ) ( not ( = ?auto_809673 ?auto_809687 ) ) ( not ( = ?auto_809673 ?auto_809688 ) ) ( not ( = ?auto_809673 ?auto_809689 ) ) ( not ( = ?auto_809673 ?auto_809690 ) ) ( not ( = ?auto_809674 ?auto_809675 ) ) ( not ( = ?auto_809674 ?auto_809676 ) ) ( not ( = ?auto_809674 ?auto_809677 ) ) ( not ( = ?auto_809674 ?auto_809678 ) ) ( not ( = ?auto_809674 ?auto_809679 ) ) ( not ( = ?auto_809674 ?auto_809680 ) ) ( not ( = ?auto_809674 ?auto_809681 ) ) ( not ( = ?auto_809674 ?auto_809682 ) ) ( not ( = ?auto_809674 ?auto_809683 ) ) ( not ( = ?auto_809674 ?auto_809684 ) ) ( not ( = ?auto_809674 ?auto_809685 ) ) ( not ( = ?auto_809674 ?auto_809686 ) ) ( not ( = ?auto_809674 ?auto_809687 ) ) ( not ( = ?auto_809674 ?auto_809688 ) ) ( not ( = ?auto_809674 ?auto_809689 ) ) ( not ( = ?auto_809674 ?auto_809690 ) ) ( not ( = ?auto_809675 ?auto_809676 ) ) ( not ( = ?auto_809675 ?auto_809677 ) ) ( not ( = ?auto_809675 ?auto_809678 ) ) ( not ( = ?auto_809675 ?auto_809679 ) ) ( not ( = ?auto_809675 ?auto_809680 ) ) ( not ( = ?auto_809675 ?auto_809681 ) ) ( not ( = ?auto_809675 ?auto_809682 ) ) ( not ( = ?auto_809675 ?auto_809683 ) ) ( not ( = ?auto_809675 ?auto_809684 ) ) ( not ( = ?auto_809675 ?auto_809685 ) ) ( not ( = ?auto_809675 ?auto_809686 ) ) ( not ( = ?auto_809675 ?auto_809687 ) ) ( not ( = ?auto_809675 ?auto_809688 ) ) ( not ( = ?auto_809675 ?auto_809689 ) ) ( not ( = ?auto_809675 ?auto_809690 ) ) ( not ( = ?auto_809676 ?auto_809677 ) ) ( not ( = ?auto_809676 ?auto_809678 ) ) ( not ( = ?auto_809676 ?auto_809679 ) ) ( not ( = ?auto_809676 ?auto_809680 ) ) ( not ( = ?auto_809676 ?auto_809681 ) ) ( not ( = ?auto_809676 ?auto_809682 ) ) ( not ( = ?auto_809676 ?auto_809683 ) ) ( not ( = ?auto_809676 ?auto_809684 ) ) ( not ( = ?auto_809676 ?auto_809685 ) ) ( not ( = ?auto_809676 ?auto_809686 ) ) ( not ( = ?auto_809676 ?auto_809687 ) ) ( not ( = ?auto_809676 ?auto_809688 ) ) ( not ( = ?auto_809676 ?auto_809689 ) ) ( not ( = ?auto_809676 ?auto_809690 ) ) ( not ( = ?auto_809677 ?auto_809678 ) ) ( not ( = ?auto_809677 ?auto_809679 ) ) ( not ( = ?auto_809677 ?auto_809680 ) ) ( not ( = ?auto_809677 ?auto_809681 ) ) ( not ( = ?auto_809677 ?auto_809682 ) ) ( not ( = ?auto_809677 ?auto_809683 ) ) ( not ( = ?auto_809677 ?auto_809684 ) ) ( not ( = ?auto_809677 ?auto_809685 ) ) ( not ( = ?auto_809677 ?auto_809686 ) ) ( not ( = ?auto_809677 ?auto_809687 ) ) ( not ( = ?auto_809677 ?auto_809688 ) ) ( not ( = ?auto_809677 ?auto_809689 ) ) ( not ( = ?auto_809677 ?auto_809690 ) ) ( not ( = ?auto_809678 ?auto_809679 ) ) ( not ( = ?auto_809678 ?auto_809680 ) ) ( not ( = ?auto_809678 ?auto_809681 ) ) ( not ( = ?auto_809678 ?auto_809682 ) ) ( not ( = ?auto_809678 ?auto_809683 ) ) ( not ( = ?auto_809678 ?auto_809684 ) ) ( not ( = ?auto_809678 ?auto_809685 ) ) ( not ( = ?auto_809678 ?auto_809686 ) ) ( not ( = ?auto_809678 ?auto_809687 ) ) ( not ( = ?auto_809678 ?auto_809688 ) ) ( not ( = ?auto_809678 ?auto_809689 ) ) ( not ( = ?auto_809678 ?auto_809690 ) ) ( not ( = ?auto_809679 ?auto_809680 ) ) ( not ( = ?auto_809679 ?auto_809681 ) ) ( not ( = ?auto_809679 ?auto_809682 ) ) ( not ( = ?auto_809679 ?auto_809683 ) ) ( not ( = ?auto_809679 ?auto_809684 ) ) ( not ( = ?auto_809679 ?auto_809685 ) ) ( not ( = ?auto_809679 ?auto_809686 ) ) ( not ( = ?auto_809679 ?auto_809687 ) ) ( not ( = ?auto_809679 ?auto_809688 ) ) ( not ( = ?auto_809679 ?auto_809689 ) ) ( not ( = ?auto_809679 ?auto_809690 ) ) ( not ( = ?auto_809680 ?auto_809681 ) ) ( not ( = ?auto_809680 ?auto_809682 ) ) ( not ( = ?auto_809680 ?auto_809683 ) ) ( not ( = ?auto_809680 ?auto_809684 ) ) ( not ( = ?auto_809680 ?auto_809685 ) ) ( not ( = ?auto_809680 ?auto_809686 ) ) ( not ( = ?auto_809680 ?auto_809687 ) ) ( not ( = ?auto_809680 ?auto_809688 ) ) ( not ( = ?auto_809680 ?auto_809689 ) ) ( not ( = ?auto_809680 ?auto_809690 ) ) ( not ( = ?auto_809681 ?auto_809682 ) ) ( not ( = ?auto_809681 ?auto_809683 ) ) ( not ( = ?auto_809681 ?auto_809684 ) ) ( not ( = ?auto_809681 ?auto_809685 ) ) ( not ( = ?auto_809681 ?auto_809686 ) ) ( not ( = ?auto_809681 ?auto_809687 ) ) ( not ( = ?auto_809681 ?auto_809688 ) ) ( not ( = ?auto_809681 ?auto_809689 ) ) ( not ( = ?auto_809681 ?auto_809690 ) ) ( not ( = ?auto_809682 ?auto_809683 ) ) ( not ( = ?auto_809682 ?auto_809684 ) ) ( not ( = ?auto_809682 ?auto_809685 ) ) ( not ( = ?auto_809682 ?auto_809686 ) ) ( not ( = ?auto_809682 ?auto_809687 ) ) ( not ( = ?auto_809682 ?auto_809688 ) ) ( not ( = ?auto_809682 ?auto_809689 ) ) ( not ( = ?auto_809682 ?auto_809690 ) ) ( not ( = ?auto_809683 ?auto_809684 ) ) ( not ( = ?auto_809683 ?auto_809685 ) ) ( not ( = ?auto_809683 ?auto_809686 ) ) ( not ( = ?auto_809683 ?auto_809687 ) ) ( not ( = ?auto_809683 ?auto_809688 ) ) ( not ( = ?auto_809683 ?auto_809689 ) ) ( not ( = ?auto_809683 ?auto_809690 ) ) ( not ( = ?auto_809684 ?auto_809685 ) ) ( not ( = ?auto_809684 ?auto_809686 ) ) ( not ( = ?auto_809684 ?auto_809687 ) ) ( not ( = ?auto_809684 ?auto_809688 ) ) ( not ( = ?auto_809684 ?auto_809689 ) ) ( not ( = ?auto_809684 ?auto_809690 ) ) ( not ( = ?auto_809685 ?auto_809686 ) ) ( not ( = ?auto_809685 ?auto_809687 ) ) ( not ( = ?auto_809685 ?auto_809688 ) ) ( not ( = ?auto_809685 ?auto_809689 ) ) ( not ( = ?auto_809685 ?auto_809690 ) ) ( not ( = ?auto_809686 ?auto_809687 ) ) ( not ( = ?auto_809686 ?auto_809688 ) ) ( not ( = ?auto_809686 ?auto_809689 ) ) ( not ( = ?auto_809686 ?auto_809690 ) ) ( not ( = ?auto_809687 ?auto_809688 ) ) ( not ( = ?auto_809687 ?auto_809689 ) ) ( not ( = ?auto_809687 ?auto_809690 ) ) ( not ( = ?auto_809688 ?auto_809689 ) ) ( not ( = ?auto_809688 ?auto_809690 ) ) ( not ( = ?auto_809689 ?auto_809690 ) ) ( ON ?auto_809688 ?auto_809689 ) ( ON ?auto_809687 ?auto_809688 ) ( ON ?auto_809686 ?auto_809687 ) ( ON ?auto_809685 ?auto_809686 ) ( ON ?auto_809684 ?auto_809685 ) ( ON ?auto_809683 ?auto_809684 ) ( ON ?auto_809682 ?auto_809683 ) ( ON ?auto_809681 ?auto_809682 ) ( ON ?auto_809680 ?auto_809681 ) ( ON ?auto_809679 ?auto_809680 ) ( ON ?auto_809678 ?auto_809679 ) ( ON ?auto_809677 ?auto_809678 ) ( CLEAR ?auto_809675 ) ( ON ?auto_809676 ?auto_809677 ) ( CLEAR ?auto_809676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_809672 ?auto_809673 ?auto_809674 ?auto_809675 ?auto_809676 )
      ( MAKE-18PILE ?auto_809672 ?auto_809673 ?auto_809674 ?auto_809675 ?auto_809676 ?auto_809677 ?auto_809678 ?auto_809679 ?auto_809680 ?auto_809681 ?auto_809682 ?auto_809683 ?auto_809684 ?auto_809685 ?auto_809686 ?auto_809687 ?auto_809688 ?auto_809689 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809709 - BLOCK
      ?auto_809710 - BLOCK
      ?auto_809711 - BLOCK
      ?auto_809712 - BLOCK
      ?auto_809713 - BLOCK
      ?auto_809714 - BLOCK
      ?auto_809715 - BLOCK
      ?auto_809716 - BLOCK
      ?auto_809717 - BLOCK
      ?auto_809718 - BLOCK
      ?auto_809719 - BLOCK
      ?auto_809720 - BLOCK
      ?auto_809721 - BLOCK
      ?auto_809722 - BLOCK
      ?auto_809723 - BLOCK
      ?auto_809724 - BLOCK
      ?auto_809725 - BLOCK
      ?auto_809726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809726 ) ( ON-TABLE ?auto_809709 ) ( ON ?auto_809710 ?auto_809709 ) ( ON ?auto_809711 ?auto_809710 ) ( ON ?auto_809712 ?auto_809711 ) ( not ( = ?auto_809709 ?auto_809710 ) ) ( not ( = ?auto_809709 ?auto_809711 ) ) ( not ( = ?auto_809709 ?auto_809712 ) ) ( not ( = ?auto_809709 ?auto_809713 ) ) ( not ( = ?auto_809709 ?auto_809714 ) ) ( not ( = ?auto_809709 ?auto_809715 ) ) ( not ( = ?auto_809709 ?auto_809716 ) ) ( not ( = ?auto_809709 ?auto_809717 ) ) ( not ( = ?auto_809709 ?auto_809718 ) ) ( not ( = ?auto_809709 ?auto_809719 ) ) ( not ( = ?auto_809709 ?auto_809720 ) ) ( not ( = ?auto_809709 ?auto_809721 ) ) ( not ( = ?auto_809709 ?auto_809722 ) ) ( not ( = ?auto_809709 ?auto_809723 ) ) ( not ( = ?auto_809709 ?auto_809724 ) ) ( not ( = ?auto_809709 ?auto_809725 ) ) ( not ( = ?auto_809709 ?auto_809726 ) ) ( not ( = ?auto_809710 ?auto_809711 ) ) ( not ( = ?auto_809710 ?auto_809712 ) ) ( not ( = ?auto_809710 ?auto_809713 ) ) ( not ( = ?auto_809710 ?auto_809714 ) ) ( not ( = ?auto_809710 ?auto_809715 ) ) ( not ( = ?auto_809710 ?auto_809716 ) ) ( not ( = ?auto_809710 ?auto_809717 ) ) ( not ( = ?auto_809710 ?auto_809718 ) ) ( not ( = ?auto_809710 ?auto_809719 ) ) ( not ( = ?auto_809710 ?auto_809720 ) ) ( not ( = ?auto_809710 ?auto_809721 ) ) ( not ( = ?auto_809710 ?auto_809722 ) ) ( not ( = ?auto_809710 ?auto_809723 ) ) ( not ( = ?auto_809710 ?auto_809724 ) ) ( not ( = ?auto_809710 ?auto_809725 ) ) ( not ( = ?auto_809710 ?auto_809726 ) ) ( not ( = ?auto_809711 ?auto_809712 ) ) ( not ( = ?auto_809711 ?auto_809713 ) ) ( not ( = ?auto_809711 ?auto_809714 ) ) ( not ( = ?auto_809711 ?auto_809715 ) ) ( not ( = ?auto_809711 ?auto_809716 ) ) ( not ( = ?auto_809711 ?auto_809717 ) ) ( not ( = ?auto_809711 ?auto_809718 ) ) ( not ( = ?auto_809711 ?auto_809719 ) ) ( not ( = ?auto_809711 ?auto_809720 ) ) ( not ( = ?auto_809711 ?auto_809721 ) ) ( not ( = ?auto_809711 ?auto_809722 ) ) ( not ( = ?auto_809711 ?auto_809723 ) ) ( not ( = ?auto_809711 ?auto_809724 ) ) ( not ( = ?auto_809711 ?auto_809725 ) ) ( not ( = ?auto_809711 ?auto_809726 ) ) ( not ( = ?auto_809712 ?auto_809713 ) ) ( not ( = ?auto_809712 ?auto_809714 ) ) ( not ( = ?auto_809712 ?auto_809715 ) ) ( not ( = ?auto_809712 ?auto_809716 ) ) ( not ( = ?auto_809712 ?auto_809717 ) ) ( not ( = ?auto_809712 ?auto_809718 ) ) ( not ( = ?auto_809712 ?auto_809719 ) ) ( not ( = ?auto_809712 ?auto_809720 ) ) ( not ( = ?auto_809712 ?auto_809721 ) ) ( not ( = ?auto_809712 ?auto_809722 ) ) ( not ( = ?auto_809712 ?auto_809723 ) ) ( not ( = ?auto_809712 ?auto_809724 ) ) ( not ( = ?auto_809712 ?auto_809725 ) ) ( not ( = ?auto_809712 ?auto_809726 ) ) ( not ( = ?auto_809713 ?auto_809714 ) ) ( not ( = ?auto_809713 ?auto_809715 ) ) ( not ( = ?auto_809713 ?auto_809716 ) ) ( not ( = ?auto_809713 ?auto_809717 ) ) ( not ( = ?auto_809713 ?auto_809718 ) ) ( not ( = ?auto_809713 ?auto_809719 ) ) ( not ( = ?auto_809713 ?auto_809720 ) ) ( not ( = ?auto_809713 ?auto_809721 ) ) ( not ( = ?auto_809713 ?auto_809722 ) ) ( not ( = ?auto_809713 ?auto_809723 ) ) ( not ( = ?auto_809713 ?auto_809724 ) ) ( not ( = ?auto_809713 ?auto_809725 ) ) ( not ( = ?auto_809713 ?auto_809726 ) ) ( not ( = ?auto_809714 ?auto_809715 ) ) ( not ( = ?auto_809714 ?auto_809716 ) ) ( not ( = ?auto_809714 ?auto_809717 ) ) ( not ( = ?auto_809714 ?auto_809718 ) ) ( not ( = ?auto_809714 ?auto_809719 ) ) ( not ( = ?auto_809714 ?auto_809720 ) ) ( not ( = ?auto_809714 ?auto_809721 ) ) ( not ( = ?auto_809714 ?auto_809722 ) ) ( not ( = ?auto_809714 ?auto_809723 ) ) ( not ( = ?auto_809714 ?auto_809724 ) ) ( not ( = ?auto_809714 ?auto_809725 ) ) ( not ( = ?auto_809714 ?auto_809726 ) ) ( not ( = ?auto_809715 ?auto_809716 ) ) ( not ( = ?auto_809715 ?auto_809717 ) ) ( not ( = ?auto_809715 ?auto_809718 ) ) ( not ( = ?auto_809715 ?auto_809719 ) ) ( not ( = ?auto_809715 ?auto_809720 ) ) ( not ( = ?auto_809715 ?auto_809721 ) ) ( not ( = ?auto_809715 ?auto_809722 ) ) ( not ( = ?auto_809715 ?auto_809723 ) ) ( not ( = ?auto_809715 ?auto_809724 ) ) ( not ( = ?auto_809715 ?auto_809725 ) ) ( not ( = ?auto_809715 ?auto_809726 ) ) ( not ( = ?auto_809716 ?auto_809717 ) ) ( not ( = ?auto_809716 ?auto_809718 ) ) ( not ( = ?auto_809716 ?auto_809719 ) ) ( not ( = ?auto_809716 ?auto_809720 ) ) ( not ( = ?auto_809716 ?auto_809721 ) ) ( not ( = ?auto_809716 ?auto_809722 ) ) ( not ( = ?auto_809716 ?auto_809723 ) ) ( not ( = ?auto_809716 ?auto_809724 ) ) ( not ( = ?auto_809716 ?auto_809725 ) ) ( not ( = ?auto_809716 ?auto_809726 ) ) ( not ( = ?auto_809717 ?auto_809718 ) ) ( not ( = ?auto_809717 ?auto_809719 ) ) ( not ( = ?auto_809717 ?auto_809720 ) ) ( not ( = ?auto_809717 ?auto_809721 ) ) ( not ( = ?auto_809717 ?auto_809722 ) ) ( not ( = ?auto_809717 ?auto_809723 ) ) ( not ( = ?auto_809717 ?auto_809724 ) ) ( not ( = ?auto_809717 ?auto_809725 ) ) ( not ( = ?auto_809717 ?auto_809726 ) ) ( not ( = ?auto_809718 ?auto_809719 ) ) ( not ( = ?auto_809718 ?auto_809720 ) ) ( not ( = ?auto_809718 ?auto_809721 ) ) ( not ( = ?auto_809718 ?auto_809722 ) ) ( not ( = ?auto_809718 ?auto_809723 ) ) ( not ( = ?auto_809718 ?auto_809724 ) ) ( not ( = ?auto_809718 ?auto_809725 ) ) ( not ( = ?auto_809718 ?auto_809726 ) ) ( not ( = ?auto_809719 ?auto_809720 ) ) ( not ( = ?auto_809719 ?auto_809721 ) ) ( not ( = ?auto_809719 ?auto_809722 ) ) ( not ( = ?auto_809719 ?auto_809723 ) ) ( not ( = ?auto_809719 ?auto_809724 ) ) ( not ( = ?auto_809719 ?auto_809725 ) ) ( not ( = ?auto_809719 ?auto_809726 ) ) ( not ( = ?auto_809720 ?auto_809721 ) ) ( not ( = ?auto_809720 ?auto_809722 ) ) ( not ( = ?auto_809720 ?auto_809723 ) ) ( not ( = ?auto_809720 ?auto_809724 ) ) ( not ( = ?auto_809720 ?auto_809725 ) ) ( not ( = ?auto_809720 ?auto_809726 ) ) ( not ( = ?auto_809721 ?auto_809722 ) ) ( not ( = ?auto_809721 ?auto_809723 ) ) ( not ( = ?auto_809721 ?auto_809724 ) ) ( not ( = ?auto_809721 ?auto_809725 ) ) ( not ( = ?auto_809721 ?auto_809726 ) ) ( not ( = ?auto_809722 ?auto_809723 ) ) ( not ( = ?auto_809722 ?auto_809724 ) ) ( not ( = ?auto_809722 ?auto_809725 ) ) ( not ( = ?auto_809722 ?auto_809726 ) ) ( not ( = ?auto_809723 ?auto_809724 ) ) ( not ( = ?auto_809723 ?auto_809725 ) ) ( not ( = ?auto_809723 ?auto_809726 ) ) ( not ( = ?auto_809724 ?auto_809725 ) ) ( not ( = ?auto_809724 ?auto_809726 ) ) ( not ( = ?auto_809725 ?auto_809726 ) ) ( ON ?auto_809725 ?auto_809726 ) ( ON ?auto_809724 ?auto_809725 ) ( ON ?auto_809723 ?auto_809724 ) ( ON ?auto_809722 ?auto_809723 ) ( ON ?auto_809721 ?auto_809722 ) ( ON ?auto_809720 ?auto_809721 ) ( ON ?auto_809719 ?auto_809720 ) ( ON ?auto_809718 ?auto_809719 ) ( ON ?auto_809717 ?auto_809718 ) ( ON ?auto_809716 ?auto_809717 ) ( ON ?auto_809715 ?auto_809716 ) ( ON ?auto_809714 ?auto_809715 ) ( CLEAR ?auto_809712 ) ( ON ?auto_809713 ?auto_809714 ) ( CLEAR ?auto_809713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_809709 ?auto_809710 ?auto_809711 ?auto_809712 ?auto_809713 )
      ( MAKE-18PILE ?auto_809709 ?auto_809710 ?auto_809711 ?auto_809712 ?auto_809713 ?auto_809714 ?auto_809715 ?auto_809716 ?auto_809717 ?auto_809718 ?auto_809719 ?auto_809720 ?auto_809721 ?auto_809722 ?auto_809723 ?auto_809724 ?auto_809725 ?auto_809726 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809745 - BLOCK
      ?auto_809746 - BLOCK
      ?auto_809747 - BLOCK
      ?auto_809748 - BLOCK
      ?auto_809749 - BLOCK
      ?auto_809750 - BLOCK
      ?auto_809751 - BLOCK
      ?auto_809752 - BLOCK
      ?auto_809753 - BLOCK
      ?auto_809754 - BLOCK
      ?auto_809755 - BLOCK
      ?auto_809756 - BLOCK
      ?auto_809757 - BLOCK
      ?auto_809758 - BLOCK
      ?auto_809759 - BLOCK
      ?auto_809760 - BLOCK
      ?auto_809761 - BLOCK
      ?auto_809762 - BLOCK
    )
    :vars
    (
      ?auto_809763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809762 ?auto_809763 ) ( ON-TABLE ?auto_809745 ) ( ON ?auto_809746 ?auto_809745 ) ( ON ?auto_809747 ?auto_809746 ) ( not ( = ?auto_809745 ?auto_809746 ) ) ( not ( = ?auto_809745 ?auto_809747 ) ) ( not ( = ?auto_809745 ?auto_809748 ) ) ( not ( = ?auto_809745 ?auto_809749 ) ) ( not ( = ?auto_809745 ?auto_809750 ) ) ( not ( = ?auto_809745 ?auto_809751 ) ) ( not ( = ?auto_809745 ?auto_809752 ) ) ( not ( = ?auto_809745 ?auto_809753 ) ) ( not ( = ?auto_809745 ?auto_809754 ) ) ( not ( = ?auto_809745 ?auto_809755 ) ) ( not ( = ?auto_809745 ?auto_809756 ) ) ( not ( = ?auto_809745 ?auto_809757 ) ) ( not ( = ?auto_809745 ?auto_809758 ) ) ( not ( = ?auto_809745 ?auto_809759 ) ) ( not ( = ?auto_809745 ?auto_809760 ) ) ( not ( = ?auto_809745 ?auto_809761 ) ) ( not ( = ?auto_809745 ?auto_809762 ) ) ( not ( = ?auto_809745 ?auto_809763 ) ) ( not ( = ?auto_809746 ?auto_809747 ) ) ( not ( = ?auto_809746 ?auto_809748 ) ) ( not ( = ?auto_809746 ?auto_809749 ) ) ( not ( = ?auto_809746 ?auto_809750 ) ) ( not ( = ?auto_809746 ?auto_809751 ) ) ( not ( = ?auto_809746 ?auto_809752 ) ) ( not ( = ?auto_809746 ?auto_809753 ) ) ( not ( = ?auto_809746 ?auto_809754 ) ) ( not ( = ?auto_809746 ?auto_809755 ) ) ( not ( = ?auto_809746 ?auto_809756 ) ) ( not ( = ?auto_809746 ?auto_809757 ) ) ( not ( = ?auto_809746 ?auto_809758 ) ) ( not ( = ?auto_809746 ?auto_809759 ) ) ( not ( = ?auto_809746 ?auto_809760 ) ) ( not ( = ?auto_809746 ?auto_809761 ) ) ( not ( = ?auto_809746 ?auto_809762 ) ) ( not ( = ?auto_809746 ?auto_809763 ) ) ( not ( = ?auto_809747 ?auto_809748 ) ) ( not ( = ?auto_809747 ?auto_809749 ) ) ( not ( = ?auto_809747 ?auto_809750 ) ) ( not ( = ?auto_809747 ?auto_809751 ) ) ( not ( = ?auto_809747 ?auto_809752 ) ) ( not ( = ?auto_809747 ?auto_809753 ) ) ( not ( = ?auto_809747 ?auto_809754 ) ) ( not ( = ?auto_809747 ?auto_809755 ) ) ( not ( = ?auto_809747 ?auto_809756 ) ) ( not ( = ?auto_809747 ?auto_809757 ) ) ( not ( = ?auto_809747 ?auto_809758 ) ) ( not ( = ?auto_809747 ?auto_809759 ) ) ( not ( = ?auto_809747 ?auto_809760 ) ) ( not ( = ?auto_809747 ?auto_809761 ) ) ( not ( = ?auto_809747 ?auto_809762 ) ) ( not ( = ?auto_809747 ?auto_809763 ) ) ( not ( = ?auto_809748 ?auto_809749 ) ) ( not ( = ?auto_809748 ?auto_809750 ) ) ( not ( = ?auto_809748 ?auto_809751 ) ) ( not ( = ?auto_809748 ?auto_809752 ) ) ( not ( = ?auto_809748 ?auto_809753 ) ) ( not ( = ?auto_809748 ?auto_809754 ) ) ( not ( = ?auto_809748 ?auto_809755 ) ) ( not ( = ?auto_809748 ?auto_809756 ) ) ( not ( = ?auto_809748 ?auto_809757 ) ) ( not ( = ?auto_809748 ?auto_809758 ) ) ( not ( = ?auto_809748 ?auto_809759 ) ) ( not ( = ?auto_809748 ?auto_809760 ) ) ( not ( = ?auto_809748 ?auto_809761 ) ) ( not ( = ?auto_809748 ?auto_809762 ) ) ( not ( = ?auto_809748 ?auto_809763 ) ) ( not ( = ?auto_809749 ?auto_809750 ) ) ( not ( = ?auto_809749 ?auto_809751 ) ) ( not ( = ?auto_809749 ?auto_809752 ) ) ( not ( = ?auto_809749 ?auto_809753 ) ) ( not ( = ?auto_809749 ?auto_809754 ) ) ( not ( = ?auto_809749 ?auto_809755 ) ) ( not ( = ?auto_809749 ?auto_809756 ) ) ( not ( = ?auto_809749 ?auto_809757 ) ) ( not ( = ?auto_809749 ?auto_809758 ) ) ( not ( = ?auto_809749 ?auto_809759 ) ) ( not ( = ?auto_809749 ?auto_809760 ) ) ( not ( = ?auto_809749 ?auto_809761 ) ) ( not ( = ?auto_809749 ?auto_809762 ) ) ( not ( = ?auto_809749 ?auto_809763 ) ) ( not ( = ?auto_809750 ?auto_809751 ) ) ( not ( = ?auto_809750 ?auto_809752 ) ) ( not ( = ?auto_809750 ?auto_809753 ) ) ( not ( = ?auto_809750 ?auto_809754 ) ) ( not ( = ?auto_809750 ?auto_809755 ) ) ( not ( = ?auto_809750 ?auto_809756 ) ) ( not ( = ?auto_809750 ?auto_809757 ) ) ( not ( = ?auto_809750 ?auto_809758 ) ) ( not ( = ?auto_809750 ?auto_809759 ) ) ( not ( = ?auto_809750 ?auto_809760 ) ) ( not ( = ?auto_809750 ?auto_809761 ) ) ( not ( = ?auto_809750 ?auto_809762 ) ) ( not ( = ?auto_809750 ?auto_809763 ) ) ( not ( = ?auto_809751 ?auto_809752 ) ) ( not ( = ?auto_809751 ?auto_809753 ) ) ( not ( = ?auto_809751 ?auto_809754 ) ) ( not ( = ?auto_809751 ?auto_809755 ) ) ( not ( = ?auto_809751 ?auto_809756 ) ) ( not ( = ?auto_809751 ?auto_809757 ) ) ( not ( = ?auto_809751 ?auto_809758 ) ) ( not ( = ?auto_809751 ?auto_809759 ) ) ( not ( = ?auto_809751 ?auto_809760 ) ) ( not ( = ?auto_809751 ?auto_809761 ) ) ( not ( = ?auto_809751 ?auto_809762 ) ) ( not ( = ?auto_809751 ?auto_809763 ) ) ( not ( = ?auto_809752 ?auto_809753 ) ) ( not ( = ?auto_809752 ?auto_809754 ) ) ( not ( = ?auto_809752 ?auto_809755 ) ) ( not ( = ?auto_809752 ?auto_809756 ) ) ( not ( = ?auto_809752 ?auto_809757 ) ) ( not ( = ?auto_809752 ?auto_809758 ) ) ( not ( = ?auto_809752 ?auto_809759 ) ) ( not ( = ?auto_809752 ?auto_809760 ) ) ( not ( = ?auto_809752 ?auto_809761 ) ) ( not ( = ?auto_809752 ?auto_809762 ) ) ( not ( = ?auto_809752 ?auto_809763 ) ) ( not ( = ?auto_809753 ?auto_809754 ) ) ( not ( = ?auto_809753 ?auto_809755 ) ) ( not ( = ?auto_809753 ?auto_809756 ) ) ( not ( = ?auto_809753 ?auto_809757 ) ) ( not ( = ?auto_809753 ?auto_809758 ) ) ( not ( = ?auto_809753 ?auto_809759 ) ) ( not ( = ?auto_809753 ?auto_809760 ) ) ( not ( = ?auto_809753 ?auto_809761 ) ) ( not ( = ?auto_809753 ?auto_809762 ) ) ( not ( = ?auto_809753 ?auto_809763 ) ) ( not ( = ?auto_809754 ?auto_809755 ) ) ( not ( = ?auto_809754 ?auto_809756 ) ) ( not ( = ?auto_809754 ?auto_809757 ) ) ( not ( = ?auto_809754 ?auto_809758 ) ) ( not ( = ?auto_809754 ?auto_809759 ) ) ( not ( = ?auto_809754 ?auto_809760 ) ) ( not ( = ?auto_809754 ?auto_809761 ) ) ( not ( = ?auto_809754 ?auto_809762 ) ) ( not ( = ?auto_809754 ?auto_809763 ) ) ( not ( = ?auto_809755 ?auto_809756 ) ) ( not ( = ?auto_809755 ?auto_809757 ) ) ( not ( = ?auto_809755 ?auto_809758 ) ) ( not ( = ?auto_809755 ?auto_809759 ) ) ( not ( = ?auto_809755 ?auto_809760 ) ) ( not ( = ?auto_809755 ?auto_809761 ) ) ( not ( = ?auto_809755 ?auto_809762 ) ) ( not ( = ?auto_809755 ?auto_809763 ) ) ( not ( = ?auto_809756 ?auto_809757 ) ) ( not ( = ?auto_809756 ?auto_809758 ) ) ( not ( = ?auto_809756 ?auto_809759 ) ) ( not ( = ?auto_809756 ?auto_809760 ) ) ( not ( = ?auto_809756 ?auto_809761 ) ) ( not ( = ?auto_809756 ?auto_809762 ) ) ( not ( = ?auto_809756 ?auto_809763 ) ) ( not ( = ?auto_809757 ?auto_809758 ) ) ( not ( = ?auto_809757 ?auto_809759 ) ) ( not ( = ?auto_809757 ?auto_809760 ) ) ( not ( = ?auto_809757 ?auto_809761 ) ) ( not ( = ?auto_809757 ?auto_809762 ) ) ( not ( = ?auto_809757 ?auto_809763 ) ) ( not ( = ?auto_809758 ?auto_809759 ) ) ( not ( = ?auto_809758 ?auto_809760 ) ) ( not ( = ?auto_809758 ?auto_809761 ) ) ( not ( = ?auto_809758 ?auto_809762 ) ) ( not ( = ?auto_809758 ?auto_809763 ) ) ( not ( = ?auto_809759 ?auto_809760 ) ) ( not ( = ?auto_809759 ?auto_809761 ) ) ( not ( = ?auto_809759 ?auto_809762 ) ) ( not ( = ?auto_809759 ?auto_809763 ) ) ( not ( = ?auto_809760 ?auto_809761 ) ) ( not ( = ?auto_809760 ?auto_809762 ) ) ( not ( = ?auto_809760 ?auto_809763 ) ) ( not ( = ?auto_809761 ?auto_809762 ) ) ( not ( = ?auto_809761 ?auto_809763 ) ) ( not ( = ?auto_809762 ?auto_809763 ) ) ( ON ?auto_809761 ?auto_809762 ) ( ON ?auto_809760 ?auto_809761 ) ( ON ?auto_809759 ?auto_809760 ) ( ON ?auto_809758 ?auto_809759 ) ( ON ?auto_809757 ?auto_809758 ) ( ON ?auto_809756 ?auto_809757 ) ( ON ?auto_809755 ?auto_809756 ) ( ON ?auto_809754 ?auto_809755 ) ( ON ?auto_809753 ?auto_809754 ) ( ON ?auto_809752 ?auto_809753 ) ( ON ?auto_809751 ?auto_809752 ) ( ON ?auto_809750 ?auto_809751 ) ( ON ?auto_809749 ?auto_809750 ) ( CLEAR ?auto_809747 ) ( ON ?auto_809748 ?auto_809749 ) ( CLEAR ?auto_809748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_809745 ?auto_809746 ?auto_809747 ?auto_809748 )
      ( MAKE-18PILE ?auto_809745 ?auto_809746 ?auto_809747 ?auto_809748 ?auto_809749 ?auto_809750 ?auto_809751 ?auto_809752 ?auto_809753 ?auto_809754 ?auto_809755 ?auto_809756 ?auto_809757 ?auto_809758 ?auto_809759 ?auto_809760 ?auto_809761 ?auto_809762 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809782 - BLOCK
      ?auto_809783 - BLOCK
      ?auto_809784 - BLOCK
      ?auto_809785 - BLOCK
      ?auto_809786 - BLOCK
      ?auto_809787 - BLOCK
      ?auto_809788 - BLOCK
      ?auto_809789 - BLOCK
      ?auto_809790 - BLOCK
      ?auto_809791 - BLOCK
      ?auto_809792 - BLOCK
      ?auto_809793 - BLOCK
      ?auto_809794 - BLOCK
      ?auto_809795 - BLOCK
      ?auto_809796 - BLOCK
      ?auto_809797 - BLOCK
      ?auto_809798 - BLOCK
      ?auto_809799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809799 ) ( ON-TABLE ?auto_809782 ) ( ON ?auto_809783 ?auto_809782 ) ( ON ?auto_809784 ?auto_809783 ) ( not ( = ?auto_809782 ?auto_809783 ) ) ( not ( = ?auto_809782 ?auto_809784 ) ) ( not ( = ?auto_809782 ?auto_809785 ) ) ( not ( = ?auto_809782 ?auto_809786 ) ) ( not ( = ?auto_809782 ?auto_809787 ) ) ( not ( = ?auto_809782 ?auto_809788 ) ) ( not ( = ?auto_809782 ?auto_809789 ) ) ( not ( = ?auto_809782 ?auto_809790 ) ) ( not ( = ?auto_809782 ?auto_809791 ) ) ( not ( = ?auto_809782 ?auto_809792 ) ) ( not ( = ?auto_809782 ?auto_809793 ) ) ( not ( = ?auto_809782 ?auto_809794 ) ) ( not ( = ?auto_809782 ?auto_809795 ) ) ( not ( = ?auto_809782 ?auto_809796 ) ) ( not ( = ?auto_809782 ?auto_809797 ) ) ( not ( = ?auto_809782 ?auto_809798 ) ) ( not ( = ?auto_809782 ?auto_809799 ) ) ( not ( = ?auto_809783 ?auto_809784 ) ) ( not ( = ?auto_809783 ?auto_809785 ) ) ( not ( = ?auto_809783 ?auto_809786 ) ) ( not ( = ?auto_809783 ?auto_809787 ) ) ( not ( = ?auto_809783 ?auto_809788 ) ) ( not ( = ?auto_809783 ?auto_809789 ) ) ( not ( = ?auto_809783 ?auto_809790 ) ) ( not ( = ?auto_809783 ?auto_809791 ) ) ( not ( = ?auto_809783 ?auto_809792 ) ) ( not ( = ?auto_809783 ?auto_809793 ) ) ( not ( = ?auto_809783 ?auto_809794 ) ) ( not ( = ?auto_809783 ?auto_809795 ) ) ( not ( = ?auto_809783 ?auto_809796 ) ) ( not ( = ?auto_809783 ?auto_809797 ) ) ( not ( = ?auto_809783 ?auto_809798 ) ) ( not ( = ?auto_809783 ?auto_809799 ) ) ( not ( = ?auto_809784 ?auto_809785 ) ) ( not ( = ?auto_809784 ?auto_809786 ) ) ( not ( = ?auto_809784 ?auto_809787 ) ) ( not ( = ?auto_809784 ?auto_809788 ) ) ( not ( = ?auto_809784 ?auto_809789 ) ) ( not ( = ?auto_809784 ?auto_809790 ) ) ( not ( = ?auto_809784 ?auto_809791 ) ) ( not ( = ?auto_809784 ?auto_809792 ) ) ( not ( = ?auto_809784 ?auto_809793 ) ) ( not ( = ?auto_809784 ?auto_809794 ) ) ( not ( = ?auto_809784 ?auto_809795 ) ) ( not ( = ?auto_809784 ?auto_809796 ) ) ( not ( = ?auto_809784 ?auto_809797 ) ) ( not ( = ?auto_809784 ?auto_809798 ) ) ( not ( = ?auto_809784 ?auto_809799 ) ) ( not ( = ?auto_809785 ?auto_809786 ) ) ( not ( = ?auto_809785 ?auto_809787 ) ) ( not ( = ?auto_809785 ?auto_809788 ) ) ( not ( = ?auto_809785 ?auto_809789 ) ) ( not ( = ?auto_809785 ?auto_809790 ) ) ( not ( = ?auto_809785 ?auto_809791 ) ) ( not ( = ?auto_809785 ?auto_809792 ) ) ( not ( = ?auto_809785 ?auto_809793 ) ) ( not ( = ?auto_809785 ?auto_809794 ) ) ( not ( = ?auto_809785 ?auto_809795 ) ) ( not ( = ?auto_809785 ?auto_809796 ) ) ( not ( = ?auto_809785 ?auto_809797 ) ) ( not ( = ?auto_809785 ?auto_809798 ) ) ( not ( = ?auto_809785 ?auto_809799 ) ) ( not ( = ?auto_809786 ?auto_809787 ) ) ( not ( = ?auto_809786 ?auto_809788 ) ) ( not ( = ?auto_809786 ?auto_809789 ) ) ( not ( = ?auto_809786 ?auto_809790 ) ) ( not ( = ?auto_809786 ?auto_809791 ) ) ( not ( = ?auto_809786 ?auto_809792 ) ) ( not ( = ?auto_809786 ?auto_809793 ) ) ( not ( = ?auto_809786 ?auto_809794 ) ) ( not ( = ?auto_809786 ?auto_809795 ) ) ( not ( = ?auto_809786 ?auto_809796 ) ) ( not ( = ?auto_809786 ?auto_809797 ) ) ( not ( = ?auto_809786 ?auto_809798 ) ) ( not ( = ?auto_809786 ?auto_809799 ) ) ( not ( = ?auto_809787 ?auto_809788 ) ) ( not ( = ?auto_809787 ?auto_809789 ) ) ( not ( = ?auto_809787 ?auto_809790 ) ) ( not ( = ?auto_809787 ?auto_809791 ) ) ( not ( = ?auto_809787 ?auto_809792 ) ) ( not ( = ?auto_809787 ?auto_809793 ) ) ( not ( = ?auto_809787 ?auto_809794 ) ) ( not ( = ?auto_809787 ?auto_809795 ) ) ( not ( = ?auto_809787 ?auto_809796 ) ) ( not ( = ?auto_809787 ?auto_809797 ) ) ( not ( = ?auto_809787 ?auto_809798 ) ) ( not ( = ?auto_809787 ?auto_809799 ) ) ( not ( = ?auto_809788 ?auto_809789 ) ) ( not ( = ?auto_809788 ?auto_809790 ) ) ( not ( = ?auto_809788 ?auto_809791 ) ) ( not ( = ?auto_809788 ?auto_809792 ) ) ( not ( = ?auto_809788 ?auto_809793 ) ) ( not ( = ?auto_809788 ?auto_809794 ) ) ( not ( = ?auto_809788 ?auto_809795 ) ) ( not ( = ?auto_809788 ?auto_809796 ) ) ( not ( = ?auto_809788 ?auto_809797 ) ) ( not ( = ?auto_809788 ?auto_809798 ) ) ( not ( = ?auto_809788 ?auto_809799 ) ) ( not ( = ?auto_809789 ?auto_809790 ) ) ( not ( = ?auto_809789 ?auto_809791 ) ) ( not ( = ?auto_809789 ?auto_809792 ) ) ( not ( = ?auto_809789 ?auto_809793 ) ) ( not ( = ?auto_809789 ?auto_809794 ) ) ( not ( = ?auto_809789 ?auto_809795 ) ) ( not ( = ?auto_809789 ?auto_809796 ) ) ( not ( = ?auto_809789 ?auto_809797 ) ) ( not ( = ?auto_809789 ?auto_809798 ) ) ( not ( = ?auto_809789 ?auto_809799 ) ) ( not ( = ?auto_809790 ?auto_809791 ) ) ( not ( = ?auto_809790 ?auto_809792 ) ) ( not ( = ?auto_809790 ?auto_809793 ) ) ( not ( = ?auto_809790 ?auto_809794 ) ) ( not ( = ?auto_809790 ?auto_809795 ) ) ( not ( = ?auto_809790 ?auto_809796 ) ) ( not ( = ?auto_809790 ?auto_809797 ) ) ( not ( = ?auto_809790 ?auto_809798 ) ) ( not ( = ?auto_809790 ?auto_809799 ) ) ( not ( = ?auto_809791 ?auto_809792 ) ) ( not ( = ?auto_809791 ?auto_809793 ) ) ( not ( = ?auto_809791 ?auto_809794 ) ) ( not ( = ?auto_809791 ?auto_809795 ) ) ( not ( = ?auto_809791 ?auto_809796 ) ) ( not ( = ?auto_809791 ?auto_809797 ) ) ( not ( = ?auto_809791 ?auto_809798 ) ) ( not ( = ?auto_809791 ?auto_809799 ) ) ( not ( = ?auto_809792 ?auto_809793 ) ) ( not ( = ?auto_809792 ?auto_809794 ) ) ( not ( = ?auto_809792 ?auto_809795 ) ) ( not ( = ?auto_809792 ?auto_809796 ) ) ( not ( = ?auto_809792 ?auto_809797 ) ) ( not ( = ?auto_809792 ?auto_809798 ) ) ( not ( = ?auto_809792 ?auto_809799 ) ) ( not ( = ?auto_809793 ?auto_809794 ) ) ( not ( = ?auto_809793 ?auto_809795 ) ) ( not ( = ?auto_809793 ?auto_809796 ) ) ( not ( = ?auto_809793 ?auto_809797 ) ) ( not ( = ?auto_809793 ?auto_809798 ) ) ( not ( = ?auto_809793 ?auto_809799 ) ) ( not ( = ?auto_809794 ?auto_809795 ) ) ( not ( = ?auto_809794 ?auto_809796 ) ) ( not ( = ?auto_809794 ?auto_809797 ) ) ( not ( = ?auto_809794 ?auto_809798 ) ) ( not ( = ?auto_809794 ?auto_809799 ) ) ( not ( = ?auto_809795 ?auto_809796 ) ) ( not ( = ?auto_809795 ?auto_809797 ) ) ( not ( = ?auto_809795 ?auto_809798 ) ) ( not ( = ?auto_809795 ?auto_809799 ) ) ( not ( = ?auto_809796 ?auto_809797 ) ) ( not ( = ?auto_809796 ?auto_809798 ) ) ( not ( = ?auto_809796 ?auto_809799 ) ) ( not ( = ?auto_809797 ?auto_809798 ) ) ( not ( = ?auto_809797 ?auto_809799 ) ) ( not ( = ?auto_809798 ?auto_809799 ) ) ( ON ?auto_809798 ?auto_809799 ) ( ON ?auto_809797 ?auto_809798 ) ( ON ?auto_809796 ?auto_809797 ) ( ON ?auto_809795 ?auto_809796 ) ( ON ?auto_809794 ?auto_809795 ) ( ON ?auto_809793 ?auto_809794 ) ( ON ?auto_809792 ?auto_809793 ) ( ON ?auto_809791 ?auto_809792 ) ( ON ?auto_809790 ?auto_809791 ) ( ON ?auto_809789 ?auto_809790 ) ( ON ?auto_809788 ?auto_809789 ) ( ON ?auto_809787 ?auto_809788 ) ( ON ?auto_809786 ?auto_809787 ) ( CLEAR ?auto_809784 ) ( ON ?auto_809785 ?auto_809786 ) ( CLEAR ?auto_809785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_809782 ?auto_809783 ?auto_809784 ?auto_809785 )
      ( MAKE-18PILE ?auto_809782 ?auto_809783 ?auto_809784 ?auto_809785 ?auto_809786 ?auto_809787 ?auto_809788 ?auto_809789 ?auto_809790 ?auto_809791 ?auto_809792 ?auto_809793 ?auto_809794 ?auto_809795 ?auto_809796 ?auto_809797 ?auto_809798 ?auto_809799 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809818 - BLOCK
      ?auto_809819 - BLOCK
      ?auto_809820 - BLOCK
      ?auto_809821 - BLOCK
      ?auto_809822 - BLOCK
      ?auto_809823 - BLOCK
      ?auto_809824 - BLOCK
      ?auto_809825 - BLOCK
      ?auto_809826 - BLOCK
      ?auto_809827 - BLOCK
      ?auto_809828 - BLOCK
      ?auto_809829 - BLOCK
      ?auto_809830 - BLOCK
      ?auto_809831 - BLOCK
      ?auto_809832 - BLOCK
      ?auto_809833 - BLOCK
      ?auto_809834 - BLOCK
      ?auto_809835 - BLOCK
    )
    :vars
    (
      ?auto_809836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809835 ?auto_809836 ) ( ON-TABLE ?auto_809818 ) ( ON ?auto_809819 ?auto_809818 ) ( not ( = ?auto_809818 ?auto_809819 ) ) ( not ( = ?auto_809818 ?auto_809820 ) ) ( not ( = ?auto_809818 ?auto_809821 ) ) ( not ( = ?auto_809818 ?auto_809822 ) ) ( not ( = ?auto_809818 ?auto_809823 ) ) ( not ( = ?auto_809818 ?auto_809824 ) ) ( not ( = ?auto_809818 ?auto_809825 ) ) ( not ( = ?auto_809818 ?auto_809826 ) ) ( not ( = ?auto_809818 ?auto_809827 ) ) ( not ( = ?auto_809818 ?auto_809828 ) ) ( not ( = ?auto_809818 ?auto_809829 ) ) ( not ( = ?auto_809818 ?auto_809830 ) ) ( not ( = ?auto_809818 ?auto_809831 ) ) ( not ( = ?auto_809818 ?auto_809832 ) ) ( not ( = ?auto_809818 ?auto_809833 ) ) ( not ( = ?auto_809818 ?auto_809834 ) ) ( not ( = ?auto_809818 ?auto_809835 ) ) ( not ( = ?auto_809818 ?auto_809836 ) ) ( not ( = ?auto_809819 ?auto_809820 ) ) ( not ( = ?auto_809819 ?auto_809821 ) ) ( not ( = ?auto_809819 ?auto_809822 ) ) ( not ( = ?auto_809819 ?auto_809823 ) ) ( not ( = ?auto_809819 ?auto_809824 ) ) ( not ( = ?auto_809819 ?auto_809825 ) ) ( not ( = ?auto_809819 ?auto_809826 ) ) ( not ( = ?auto_809819 ?auto_809827 ) ) ( not ( = ?auto_809819 ?auto_809828 ) ) ( not ( = ?auto_809819 ?auto_809829 ) ) ( not ( = ?auto_809819 ?auto_809830 ) ) ( not ( = ?auto_809819 ?auto_809831 ) ) ( not ( = ?auto_809819 ?auto_809832 ) ) ( not ( = ?auto_809819 ?auto_809833 ) ) ( not ( = ?auto_809819 ?auto_809834 ) ) ( not ( = ?auto_809819 ?auto_809835 ) ) ( not ( = ?auto_809819 ?auto_809836 ) ) ( not ( = ?auto_809820 ?auto_809821 ) ) ( not ( = ?auto_809820 ?auto_809822 ) ) ( not ( = ?auto_809820 ?auto_809823 ) ) ( not ( = ?auto_809820 ?auto_809824 ) ) ( not ( = ?auto_809820 ?auto_809825 ) ) ( not ( = ?auto_809820 ?auto_809826 ) ) ( not ( = ?auto_809820 ?auto_809827 ) ) ( not ( = ?auto_809820 ?auto_809828 ) ) ( not ( = ?auto_809820 ?auto_809829 ) ) ( not ( = ?auto_809820 ?auto_809830 ) ) ( not ( = ?auto_809820 ?auto_809831 ) ) ( not ( = ?auto_809820 ?auto_809832 ) ) ( not ( = ?auto_809820 ?auto_809833 ) ) ( not ( = ?auto_809820 ?auto_809834 ) ) ( not ( = ?auto_809820 ?auto_809835 ) ) ( not ( = ?auto_809820 ?auto_809836 ) ) ( not ( = ?auto_809821 ?auto_809822 ) ) ( not ( = ?auto_809821 ?auto_809823 ) ) ( not ( = ?auto_809821 ?auto_809824 ) ) ( not ( = ?auto_809821 ?auto_809825 ) ) ( not ( = ?auto_809821 ?auto_809826 ) ) ( not ( = ?auto_809821 ?auto_809827 ) ) ( not ( = ?auto_809821 ?auto_809828 ) ) ( not ( = ?auto_809821 ?auto_809829 ) ) ( not ( = ?auto_809821 ?auto_809830 ) ) ( not ( = ?auto_809821 ?auto_809831 ) ) ( not ( = ?auto_809821 ?auto_809832 ) ) ( not ( = ?auto_809821 ?auto_809833 ) ) ( not ( = ?auto_809821 ?auto_809834 ) ) ( not ( = ?auto_809821 ?auto_809835 ) ) ( not ( = ?auto_809821 ?auto_809836 ) ) ( not ( = ?auto_809822 ?auto_809823 ) ) ( not ( = ?auto_809822 ?auto_809824 ) ) ( not ( = ?auto_809822 ?auto_809825 ) ) ( not ( = ?auto_809822 ?auto_809826 ) ) ( not ( = ?auto_809822 ?auto_809827 ) ) ( not ( = ?auto_809822 ?auto_809828 ) ) ( not ( = ?auto_809822 ?auto_809829 ) ) ( not ( = ?auto_809822 ?auto_809830 ) ) ( not ( = ?auto_809822 ?auto_809831 ) ) ( not ( = ?auto_809822 ?auto_809832 ) ) ( not ( = ?auto_809822 ?auto_809833 ) ) ( not ( = ?auto_809822 ?auto_809834 ) ) ( not ( = ?auto_809822 ?auto_809835 ) ) ( not ( = ?auto_809822 ?auto_809836 ) ) ( not ( = ?auto_809823 ?auto_809824 ) ) ( not ( = ?auto_809823 ?auto_809825 ) ) ( not ( = ?auto_809823 ?auto_809826 ) ) ( not ( = ?auto_809823 ?auto_809827 ) ) ( not ( = ?auto_809823 ?auto_809828 ) ) ( not ( = ?auto_809823 ?auto_809829 ) ) ( not ( = ?auto_809823 ?auto_809830 ) ) ( not ( = ?auto_809823 ?auto_809831 ) ) ( not ( = ?auto_809823 ?auto_809832 ) ) ( not ( = ?auto_809823 ?auto_809833 ) ) ( not ( = ?auto_809823 ?auto_809834 ) ) ( not ( = ?auto_809823 ?auto_809835 ) ) ( not ( = ?auto_809823 ?auto_809836 ) ) ( not ( = ?auto_809824 ?auto_809825 ) ) ( not ( = ?auto_809824 ?auto_809826 ) ) ( not ( = ?auto_809824 ?auto_809827 ) ) ( not ( = ?auto_809824 ?auto_809828 ) ) ( not ( = ?auto_809824 ?auto_809829 ) ) ( not ( = ?auto_809824 ?auto_809830 ) ) ( not ( = ?auto_809824 ?auto_809831 ) ) ( not ( = ?auto_809824 ?auto_809832 ) ) ( not ( = ?auto_809824 ?auto_809833 ) ) ( not ( = ?auto_809824 ?auto_809834 ) ) ( not ( = ?auto_809824 ?auto_809835 ) ) ( not ( = ?auto_809824 ?auto_809836 ) ) ( not ( = ?auto_809825 ?auto_809826 ) ) ( not ( = ?auto_809825 ?auto_809827 ) ) ( not ( = ?auto_809825 ?auto_809828 ) ) ( not ( = ?auto_809825 ?auto_809829 ) ) ( not ( = ?auto_809825 ?auto_809830 ) ) ( not ( = ?auto_809825 ?auto_809831 ) ) ( not ( = ?auto_809825 ?auto_809832 ) ) ( not ( = ?auto_809825 ?auto_809833 ) ) ( not ( = ?auto_809825 ?auto_809834 ) ) ( not ( = ?auto_809825 ?auto_809835 ) ) ( not ( = ?auto_809825 ?auto_809836 ) ) ( not ( = ?auto_809826 ?auto_809827 ) ) ( not ( = ?auto_809826 ?auto_809828 ) ) ( not ( = ?auto_809826 ?auto_809829 ) ) ( not ( = ?auto_809826 ?auto_809830 ) ) ( not ( = ?auto_809826 ?auto_809831 ) ) ( not ( = ?auto_809826 ?auto_809832 ) ) ( not ( = ?auto_809826 ?auto_809833 ) ) ( not ( = ?auto_809826 ?auto_809834 ) ) ( not ( = ?auto_809826 ?auto_809835 ) ) ( not ( = ?auto_809826 ?auto_809836 ) ) ( not ( = ?auto_809827 ?auto_809828 ) ) ( not ( = ?auto_809827 ?auto_809829 ) ) ( not ( = ?auto_809827 ?auto_809830 ) ) ( not ( = ?auto_809827 ?auto_809831 ) ) ( not ( = ?auto_809827 ?auto_809832 ) ) ( not ( = ?auto_809827 ?auto_809833 ) ) ( not ( = ?auto_809827 ?auto_809834 ) ) ( not ( = ?auto_809827 ?auto_809835 ) ) ( not ( = ?auto_809827 ?auto_809836 ) ) ( not ( = ?auto_809828 ?auto_809829 ) ) ( not ( = ?auto_809828 ?auto_809830 ) ) ( not ( = ?auto_809828 ?auto_809831 ) ) ( not ( = ?auto_809828 ?auto_809832 ) ) ( not ( = ?auto_809828 ?auto_809833 ) ) ( not ( = ?auto_809828 ?auto_809834 ) ) ( not ( = ?auto_809828 ?auto_809835 ) ) ( not ( = ?auto_809828 ?auto_809836 ) ) ( not ( = ?auto_809829 ?auto_809830 ) ) ( not ( = ?auto_809829 ?auto_809831 ) ) ( not ( = ?auto_809829 ?auto_809832 ) ) ( not ( = ?auto_809829 ?auto_809833 ) ) ( not ( = ?auto_809829 ?auto_809834 ) ) ( not ( = ?auto_809829 ?auto_809835 ) ) ( not ( = ?auto_809829 ?auto_809836 ) ) ( not ( = ?auto_809830 ?auto_809831 ) ) ( not ( = ?auto_809830 ?auto_809832 ) ) ( not ( = ?auto_809830 ?auto_809833 ) ) ( not ( = ?auto_809830 ?auto_809834 ) ) ( not ( = ?auto_809830 ?auto_809835 ) ) ( not ( = ?auto_809830 ?auto_809836 ) ) ( not ( = ?auto_809831 ?auto_809832 ) ) ( not ( = ?auto_809831 ?auto_809833 ) ) ( not ( = ?auto_809831 ?auto_809834 ) ) ( not ( = ?auto_809831 ?auto_809835 ) ) ( not ( = ?auto_809831 ?auto_809836 ) ) ( not ( = ?auto_809832 ?auto_809833 ) ) ( not ( = ?auto_809832 ?auto_809834 ) ) ( not ( = ?auto_809832 ?auto_809835 ) ) ( not ( = ?auto_809832 ?auto_809836 ) ) ( not ( = ?auto_809833 ?auto_809834 ) ) ( not ( = ?auto_809833 ?auto_809835 ) ) ( not ( = ?auto_809833 ?auto_809836 ) ) ( not ( = ?auto_809834 ?auto_809835 ) ) ( not ( = ?auto_809834 ?auto_809836 ) ) ( not ( = ?auto_809835 ?auto_809836 ) ) ( ON ?auto_809834 ?auto_809835 ) ( ON ?auto_809833 ?auto_809834 ) ( ON ?auto_809832 ?auto_809833 ) ( ON ?auto_809831 ?auto_809832 ) ( ON ?auto_809830 ?auto_809831 ) ( ON ?auto_809829 ?auto_809830 ) ( ON ?auto_809828 ?auto_809829 ) ( ON ?auto_809827 ?auto_809828 ) ( ON ?auto_809826 ?auto_809827 ) ( ON ?auto_809825 ?auto_809826 ) ( ON ?auto_809824 ?auto_809825 ) ( ON ?auto_809823 ?auto_809824 ) ( ON ?auto_809822 ?auto_809823 ) ( ON ?auto_809821 ?auto_809822 ) ( CLEAR ?auto_809819 ) ( ON ?auto_809820 ?auto_809821 ) ( CLEAR ?auto_809820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_809818 ?auto_809819 ?auto_809820 )
      ( MAKE-18PILE ?auto_809818 ?auto_809819 ?auto_809820 ?auto_809821 ?auto_809822 ?auto_809823 ?auto_809824 ?auto_809825 ?auto_809826 ?auto_809827 ?auto_809828 ?auto_809829 ?auto_809830 ?auto_809831 ?auto_809832 ?auto_809833 ?auto_809834 ?auto_809835 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809855 - BLOCK
      ?auto_809856 - BLOCK
      ?auto_809857 - BLOCK
      ?auto_809858 - BLOCK
      ?auto_809859 - BLOCK
      ?auto_809860 - BLOCK
      ?auto_809861 - BLOCK
      ?auto_809862 - BLOCK
      ?auto_809863 - BLOCK
      ?auto_809864 - BLOCK
      ?auto_809865 - BLOCK
      ?auto_809866 - BLOCK
      ?auto_809867 - BLOCK
      ?auto_809868 - BLOCK
      ?auto_809869 - BLOCK
      ?auto_809870 - BLOCK
      ?auto_809871 - BLOCK
      ?auto_809872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809872 ) ( ON-TABLE ?auto_809855 ) ( ON ?auto_809856 ?auto_809855 ) ( not ( = ?auto_809855 ?auto_809856 ) ) ( not ( = ?auto_809855 ?auto_809857 ) ) ( not ( = ?auto_809855 ?auto_809858 ) ) ( not ( = ?auto_809855 ?auto_809859 ) ) ( not ( = ?auto_809855 ?auto_809860 ) ) ( not ( = ?auto_809855 ?auto_809861 ) ) ( not ( = ?auto_809855 ?auto_809862 ) ) ( not ( = ?auto_809855 ?auto_809863 ) ) ( not ( = ?auto_809855 ?auto_809864 ) ) ( not ( = ?auto_809855 ?auto_809865 ) ) ( not ( = ?auto_809855 ?auto_809866 ) ) ( not ( = ?auto_809855 ?auto_809867 ) ) ( not ( = ?auto_809855 ?auto_809868 ) ) ( not ( = ?auto_809855 ?auto_809869 ) ) ( not ( = ?auto_809855 ?auto_809870 ) ) ( not ( = ?auto_809855 ?auto_809871 ) ) ( not ( = ?auto_809855 ?auto_809872 ) ) ( not ( = ?auto_809856 ?auto_809857 ) ) ( not ( = ?auto_809856 ?auto_809858 ) ) ( not ( = ?auto_809856 ?auto_809859 ) ) ( not ( = ?auto_809856 ?auto_809860 ) ) ( not ( = ?auto_809856 ?auto_809861 ) ) ( not ( = ?auto_809856 ?auto_809862 ) ) ( not ( = ?auto_809856 ?auto_809863 ) ) ( not ( = ?auto_809856 ?auto_809864 ) ) ( not ( = ?auto_809856 ?auto_809865 ) ) ( not ( = ?auto_809856 ?auto_809866 ) ) ( not ( = ?auto_809856 ?auto_809867 ) ) ( not ( = ?auto_809856 ?auto_809868 ) ) ( not ( = ?auto_809856 ?auto_809869 ) ) ( not ( = ?auto_809856 ?auto_809870 ) ) ( not ( = ?auto_809856 ?auto_809871 ) ) ( not ( = ?auto_809856 ?auto_809872 ) ) ( not ( = ?auto_809857 ?auto_809858 ) ) ( not ( = ?auto_809857 ?auto_809859 ) ) ( not ( = ?auto_809857 ?auto_809860 ) ) ( not ( = ?auto_809857 ?auto_809861 ) ) ( not ( = ?auto_809857 ?auto_809862 ) ) ( not ( = ?auto_809857 ?auto_809863 ) ) ( not ( = ?auto_809857 ?auto_809864 ) ) ( not ( = ?auto_809857 ?auto_809865 ) ) ( not ( = ?auto_809857 ?auto_809866 ) ) ( not ( = ?auto_809857 ?auto_809867 ) ) ( not ( = ?auto_809857 ?auto_809868 ) ) ( not ( = ?auto_809857 ?auto_809869 ) ) ( not ( = ?auto_809857 ?auto_809870 ) ) ( not ( = ?auto_809857 ?auto_809871 ) ) ( not ( = ?auto_809857 ?auto_809872 ) ) ( not ( = ?auto_809858 ?auto_809859 ) ) ( not ( = ?auto_809858 ?auto_809860 ) ) ( not ( = ?auto_809858 ?auto_809861 ) ) ( not ( = ?auto_809858 ?auto_809862 ) ) ( not ( = ?auto_809858 ?auto_809863 ) ) ( not ( = ?auto_809858 ?auto_809864 ) ) ( not ( = ?auto_809858 ?auto_809865 ) ) ( not ( = ?auto_809858 ?auto_809866 ) ) ( not ( = ?auto_809858 ?auto_809867 ) ) ( not ( = ?auto_809858 ?auto_809868 ) ) ( not ( = ?auto_809858 ?auto_809869 ) ) ( not ( = ?auto_809858 ?auto_809870 ) ) ( not ( = ?auto_809858 ?auto_809871 ) ) ( not ( = ?auto_809858 ?auto_809872 ) ) ( not ( = ?auto_809859 ?auto_809860 ) ) ( not ( = ?auto_809859 ?auto_809861 ) ) ( not ( = ?auto_809859 ?auto_809862 ) ) ( not ( = ?auto_809859 ?auto_809863 ) ) ( not ( = ?auto_809859 ?auto_809864 ) ) ( not ( = ?auto_809859 ?auto_809865 ) ) ( not ( = ?auto_809859 ?auto_809866 ) ) ( not ( = ?auto_809859 ?auto_809867 ) ) ( not ( = ?auto_809859 ?auto_809868 ) ) ( not ( = ?auto_809859 ?auto_809869 ) ) ( not ( = ?auto_809859 ?auto_809870 ) ) ( not ( = ?auto_809859 ?auto_809871 ) ) ( not ( = ?auto_809859 ?auto_809872 ) ) ( not ( = ?auto_809860 ?auto_809861 ) ) ( not ( = ?auto_809860 ?auto_809862 ) ) ( not ( = ?auto_809860 ?auto_809863 ) ) ( not ( = ?auto_809860 ?auto_809864 ) ) ( not ( = ?auto_809860 ?auto_809865 ) ) ( not ( = ?auto_809860 ?auto_809866 ) ) ( not ( = ?auto_809860 ?auto_809867 ) ) ( not ( = ?auto_809860 ?auto_809868 ) ) ( not ( = ?auto_809860 ?auto_809869 ) ) ( not ( = ?auto_809860 ?auto_809870 ) ) ( not ( = ?auto_809860 ?auto_809871 ) ) ( not ( = ?auto_809860 ?auto_809872 ) ) ( not ( = ?auto_809861 ?auto_809862 ) ) ( not ( = ?auto_809861 ?auto_809863 ) ) ( not ( = ?auto_809861 ?auto_809864 ) ) ( not ( = ?auto_809861 ?auto_809865 ) ) ( not ( = ?auto_809861 ?auto_809866 ) ) ( not ( = ?auto_809861 ?auto_809867 ) ) ( not ( = ?auto_809861 ?auto_809868 ) ) ( not ( = ?auto_809861 ?auto_809869 ) ) ( not ( = ?auto_809861 ?auto_809870 ) ) ( not ( = ?auto_809861 ?auto_809871 ) ) ( not ( = ?auto_809861 ?auto_809872 ) ) ( not ( = ?auto_809862 ?auto_809863 ) ) ( not ( = ?auto_809862 ?auto_809864 ) ) ( not ( = ?auto_809862 ?auto_809865 ) ) ( not ( = ?auto_809862 ?auto_809866 ) ) ( not ( = ?auto_809862 ?auto_809867 ) ) ( not ( = ?auto_809862 ?auto_809868 ) ) ( not ( = ?auto_809862 ?auto_809869 ) ) ( not ( = ?auto_809862 ?auto_809870 ) ) ( not ( = ?auto_809862 ?auto_809871 ) ) ( not ( = ?auto_809862 ?auto_809872 ) ) ( not ( = ?auto_809863 ?auto_809864 ) ) ( not ( = ?auto_809863 ?auto_809865 ) ) ( not ( = ?auto_809863 ?auto_809866 ) ) ( not ( = ?auto_809863 ?auto_809867 ) ) ( not ( = ?auto_809863 ?auto_809868 ) ) ( not ( = ?auto_809863 ?auto_809869 ) ) ( not ( = ?auto_809863 ?auto_809870 ) ) ( not ( = ?auto_809863 ?auto_809871 ) ) ( not ( = ?auto_809863 ?auto_809872 ) ) ( not ( = ?auto_809864 ?auto_809865 ) ) ( not ( = ?auto_809864 ?auto_809866 ) ) ( not ( = ?auto_809864 ?auto_809867 ) ) ( not ( = ?auto_809864 ?auto_809868 ) ) ( not ( = ?auto_809864 ?auto_809869 ) ) ( not ( = ?auto_809864 ?auto_809870 ) ) ( not ( = ?auto_809864 ?auto_809871 ) ) ( not ( = ?auto_809864 ?auto_809872 ) ) ( not ( = ?auto_809865 ?auto_809866 ) ) ( not ( = ?auto_809865 ?auto_809867 ) ) ( not ( = ?auto_809865 ?auto_809868 ) ) ( not ( = ?auto_809865 ?auto_809869 ) ) ( not ( = ?auto_809865 ?auto_809870 ) ) ( not ( = ?auto_809865 ?auto_809871 ) ) ( not ( = ?auto_809865 ?auto_809872 ) ) ( not ( = ?auto_809866 ?auto_809867 ) ) ( not ( = ?auto_809866 ?auto_809868 ) ) ( not ( = ?auto_809866 ?auto_809869 ) ) ( not ( = ?auto_809866 ?auto_809870 ) ) ( not ( = ?auto_809866 ?auto_809871 ) ) ( not ( = ?auto_809866 ?auto_809872 ) ) ( not ( = ?auto_809867 ?auto_809868 ) ) ( not ( = ?auto_809867 ?auto_809869 ) ) ( not ( = ?auto_809867 ?auto_809870 ) ) ( not ( = ?auto_809867 ?auto_809871 ) ) ( not ( = ?auto_809867 ?auto_809872 ) ) ( not ( = ?auto_809868 ?auto_809869 ) ) ( not ( = ?auto_809868 ?auto_809870 ) ) ( not ( = ?auto_809868 ?auto_809871 ) ) ( not ( = ?auto_809868 ?auto_809872 ) ) ( not ( = ?auto_809869 ?auto_809870 ) ) ( not ( = ?auto_809869 ?auto_809871 ) ) ( not ( = ?auto_809869 ?auto_809872 ) ) ( not ( = ?auto_809870 ?auto_809871 ) ) ( not ( = ?auto_809870 ?auto_809872 ) ) ( not ( = ?auto_809871 ?auto_809872 ) ) ( ON ?auto_809871 ?auto_809872 ) ( ON ?auto_809870 ?auto_809871 ) ( ON ?auto_809869 ?auto_809870 ) ( ON ?auto_809868 ?auto_809869 ) ( ON ?auto_809867 ?auto_809868 ) ( ON ?auto_809866 ?auto_809867 ) ( ON ?auto_809865 ?auto_809866 ) ( ON ?auto_809864 ?auto_809865 ) ( ON ?auto_809863 ?auto_809864 ) ( ON ?auto_809862 ?auto_809863 ) ( ON ?auto_809861 ?auto_809862 ) ( ON ?auto_809860 ?auto_809861 ) ( ON ?auto_809859 ?auto_809860 ) ( ON ?auto_809858 ?auto_809859 ) ( CLEAR ?auto_809856 ) ( ON ?auto_809857 ?auto_809858 ) ( CLEAR ?auto_809857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_809855 ?auto_809856 ?auto_809857 )
      ( MAKE-18PILE ?auto_809855 ?auto_809856 ?auto_809857 ?auto_809858 ?auto_809859 ?auto_809860 ?auto_809861 ?auto_809862 ?auto_809863 ?auto_809864 ?auto_809865 ?auto_809866 ?auto_809867 ?auto_809868 ?auto_809869 ?auto_809870 ?auto_809871 ?auto_809872 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809891 - BLOCK
      ?auto_809892 - BLOCK
      ?auto_809893 - BLOCK
      ?auto_809894 - BLOCK
      ?auto_809895 - BLOCK
      ?auto_809896 - BLOCK
      ?auto_809897 - BLOCK
      ?auto_809898 - BLOCK
      ?auto_809899 - BLOCK
      ?auto_809900 - BLOCK
      ?auto_809901 - BLOCK
      ?auto_809902 - BLOCK
      ?auto_809903 - BLOCK
      ?auto_809904 - BLOCK
      ?auto_809905 - BLOCK
      ?auto_809906 - BLOCK
      ?auto_809907 - BLOCK
      ?auto_809908 - BLOCK
    )
    :vars
    (
      ?auto_809909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809908 ?auto_809909 ) ( ON-TABLE ?auto_809891 ) ( not ( = ?auto_809891 ?auto_809892 ) ) ( not ( = ?auto_809891 ?auto_809893 ) ) ( not ( = ?auto_809891 ?auto_809894 ) ) ( not ( = ?auto_809891 ?auto_809895 ) ) ( not ( = ?auto_809891 ?auto_809896 ) ) ( not ( = ?auto_809891 ?auto_809897 ) ) ( not ( = ?auto_809891 ?auto_809898 ) ) ( not ( = ?auto_809891 ?auto_809899 ) ) ( not ( = ?auto_809891 ?auto_809900 ) ) ( not ( = ?auto_809891 ?auto_809901 ) ) ( not ( = ?auto_809891 ?auto_809902 ) ) ( not ( = ?auto_809891 ?auto_809903 ) ) ( not ( = ?auto_809891 ?auto_809904 ) ) ( not ( = ?auto_809891 ?auto_809905 ) ) ( not ( = ?auto_809891 ?auto_809906 ) ) ( not ( = ?auto_809891 ?auto_809907 ) ) ( not ( = ?auto_809891 ?auto_809908 ) ) ( not ( = ?auto_809891 ?auto_809909 ) ) ( not ( = ?auto_809892 ?auto_809893 ) ) ( not ( = ?auto_809892 ?auto_809894 ) ) ( not ( = ?auto_809892 ?auto_809895 ) ) ( not ( = ?auto_809892 ?auto_809896 ) ) ( not ( = ?auto_809892 ?auto_809897 ) ) ( not ( = ?auto_809892 ?auto_809898 ) ) ( not ( = ?auto_809892 ?auto_809899 ) ) ( not ( = ?auto_809892 ?auto_809900 ) ) ( not ( = ?auto_809892 ?auto_809901 ) ) ( not ( = ?auto_809892 ?auto_809902 ) ) ( not ( = ?auto_809892 ?auto_809903 ) ) ( not ( = ?auto_809892 ?auto_809904 ) ) ( not ( = ?auto_809892 ?auto_809905 ) ) ( not ( = ?auto_809892 ?auto_809906 ) ) ( not ( = ?auto_809892 ?auto_809907 ) ) ( not ( = ?auto_809892 ?auto_809908 ) ) ( not ( = ?auto_809892 ?auto_809909 ) ) ( not ( = ?auto_809893 ?auto_809894 ) ) ( not ( = ?auto_809893 ?auto_809895 ) ) ( not ( = ?auto_809893 ?auto_809896 ) ) ( not ( = ?auto_809893 ?auto_809897 ) ) ( not ( = ?auto_809893 ?auto_809898 ) ) ( not ( = ?auto_809893 ?auto_809899 ) ) ( not ( = ?auto_809893 ?auto_809900 ) ) ( not ( = ?auto_809893 ?auto_809901 ) ) ( not ( = ?auto_809893 ?auto_809902 ) ) ( not ( = ?auto_809893 ?auto_809903 ) ) ( not ( = ?auto_809893 ?auto_809904 ) ) ( not ( = ?auto_809893 ?auto_809905 ) ) ( not ( = ?auto_809893 ?auto_809906 ) ) ( not ( = ?auto_809893 ?auto_809907 ) ) ( not ( = ?auto_809893 ?auto_809908 ) ) ( not ( = ?auto_809893 ?auto_809909 ) ) ( not ( = ?auto_809894 ?auto_809895 ) ) ( not ( = ?auto_809894 ?auto_809896 ) ) ( not ( = ?auto_809894 ?auto_809897 ) ) ( not ( = ?auto_809894 ?auto_809898 ) ) ( not ( = ?auto_809894 ?auto_809899 ) ) ( not ( = ?auto_809894 ?auto_809900 ) ) ( not ( = ?auto_809894 ?auto_809901 ) ) ( not ( = ?auto_809894 ?auto_809902 ) ) ( not ( = ?auto_809894 ?auto_809903 ) ) ( not ( = ?auto_809894 ?auto_809904 ) ) ( not ( = ?auto_809894 ?auto_809905 ) ) ( not ( = ?auto_809894 ?auto_809906 ) ) ( not ( = ?auto_809894 ?auto_809907 ) ) ( not ( = ?auto_809894 ?auto_809908 ) ) ( not ( = ?auto_809894 ?auto_809909 ) ) ( not ( = ?auto_809895 ?auto_809896 ) ) ( not ( = ?auto_809895 ?auto_809897 ) ) ( not ( = ?auto_809895 ?auto_809898 ) ) ( not ( = ?auto_809895 ?auto_809899 ) ) ( not ( = ?auto_809895 ?auto_809900 ) ) ( not ( = ?auto_809895 ?auto_809901 ) ) ( not ( = ?auto_809895 ?auto_809902 ) ) ( not ( = ?auto_809895 ?auto_809903 ) ) ( not ( = ?auto_809895 ?auto_809904 ) ) ( not ( = ?auto_809895 ?auto_809905 ) ) ( not ( = ?auto_809895 ?auto_809906 ) ) ( not ( = ?auto_809895 ?auto_809907 ) ) ( not ( = ?auto_809895 ?auto_809908 ) ) ( not ( = ?auto_809895 ?auto_809909 ) ) ( not ( = ?auto_809896 ?auto_809897 ) ) ( not ( = ?auto_809896 ?auto_809898 ) ) ( not ( = ?auto_809896 ?auto_809899 ) ) ( not ( = ?auto_809896 ?auto_809900 ) ) ( not ( = ?auto_809896 ?auto_809901 ) ) ( not ( = ?auto_809896 ?auto_809902 ) ) ( not ( = ?auto_809896 ?auto_809903 ) ) ( not ( = ?auto_809896 ?auto_809904 ) ) ( not ( = ?auto_809896 ?auto_809905 ) ) ( not ( = ?auto_809896 ?auto_809906 ) ) ( not ( = ?auto_809896 ?auto_809907 ) ) ( not ( = ?auto_809896 ?auto_809908 ) ) ( not ( = ?auto_809896 ?auto_809909 ) ) ( not ( = ?auto_809897 ?auto_809898 ) ) ( not ( = ?auto_809897 ?auto_809899 ) ) ( not ( = ?auto_809897 ?auto_809900 ) ) ( not ( = ?auto_809897 ?auto_809901 ) ) ( not ( = ?auto_809897 ?auto_809902 ) ) ( not ( = ?auto_809897 ?auto_809903 ) ) ( not ( = ?auto_809897 ?auto_809904 ) ) ( not ( = ?auto_809897 ?auto_809905 ) ) ( not ( = ?auto_809897 ?auto_809906 ) ) ( not ( = ?auto_809897 ?auto_809907 ) ) ( not ( = ?auto_809897 ?auto_809908 ) ) ( not ( = ?auto_809897 ?auto_809909 ) ) ( not ( = ?auto_809898 ?auto_809899 ) ) ( not ( = ?auto_809898 ?auto_809900 ) ) ( not ( = ?auto_809898 ?auto_809901 ) ) ( not ( = ?auto_809898 ?auto_809902 ) ) ( not ( = ?auto_809898 ?auto_809903 ) ) ( not ( = ?auto_809898 ?auto_809904 ) ) ( not ( = ?auto_809898 ?auto_809905 ) ) ( not ( = ?auto_809898 ?auto_809906 ) ) ( not ( = ?auto_809898 ?auto_809907 ) ) ( not ( = ?auto_809898 ?auto_809908 ) ) ( not ( = ?auto_809898 ?auto_809909 ) ) ( not ( = ?auto_809899 ?auto_809900 ) ) ( not ( = ?auto_809899 ?auto_809901 ) ) ( not ( = ?auto_809899 ?auto_809902 ) ) ( not ( = ?auto_809899 ?auto_809903 ) ) ( not ( = ?auto_809899 ?auto_809904 ) ) ( not ( = ?auto_809899 ?auto_809905 ) ) ( not ( = ?auto_809899 ?auto_809906 ) ) ( not ( = ?auto_809899 ?auto_809907 ) ) ( not ( = ?auto_809899 ?auto_809908 ) ) ( not ( = ?auto_809899 ?auto_809909 ) ) ( not ( = ?auto_809900 ?auto_809901 ) ) ( not ( = ?auto_809900 ?auto_809902 ) ) ( not ( = ?auto_809900 ?auto_809903 ) ) ( not ( = ?auto_809900 ?auto_809904 ) ) ( not ( = ?auto_809900 ?auto_809905 ) ) ( not ( = ?auto_809900 ?auto_809906 ) ) ( not ( = ?auto_809900 ?auto_809907 ) ) ( not ( = ?auto_809900 ?auto_809908 ) ) ( not ( = ?auto_809900 ?auto_809909 ) ) ( not ( = ?auto_809901 ?auto_809902 ) ) ( not ( = ?auto_809901 ?auto_809903 ) ) ( not ( = ?auto_809901 ?auto_809904 ) ) ( not ( = ?auto_809901 ?auto_809905 ) ) ( not ( = ?auto_809901 ?auto_809906 ) ) ( not ( = ?auto_809901 ?auto_809907 ) ) ( not ( = ?auto_809901 ?auto_809908 ) ) ( not ( = ?auto_809901 ?auto_809909 ) ) ( not ( = ?auto_809902 ?auto_809903 ) ) ( not ( = ?auto_809902 ?auto_809904 ) ) ( not ( = ?auto_809902 ?auto_809905 ) ) ( not ( = ?auto_809902 ?auto_809906 ) ) ( not ( = ?auto_809902 ?auto_809907 ) ) ( not ( = ?auto_809902 ?auto_809908 ) ) ( not ( = ?auto_809902 ?auto_809909 ) ) ( not ( = ?auto_809903 ?auto_809904 ) ) ( not ( = ?auto_809903 ?auto_809905 ) ) ( not ( = ?auto_809903 ?auto_809906 ) ) ( not ( = ?auto_809903 ?auto_809907 ) ) ( not ( = ?auto_809903 ?auto_809908 ) ) ( not ( = ?auto_809903 ?auto_809909 ) ) ( not ( = ?auto_809904 ?auto_809905 ) ) ( not ( = ?auto_809904 ?auto_809906 ) ) ( not ( = ?auto_809904 ?auto_809907 ) ) ( not ( = ?auto_809904 ?auto_809908 ) ) ( not ( = ?auto_809904 ?auto_809909 ) ) ( not ( = ?auto_809905 ?auto_809906 ) ) ( not ( = ?auto_809905 ?auto_809907 ) ) ( not ( = ?auto_809905 ?auto_809908 ) ) ( not ( = ?auto_809905 ?auto_809909 ) ) ( not ( = ?auto_809906 ?auto_809907 ) ) ( not ( = ?auto_809906 ?auto_809908 ) ) ( not ( = ?auto_809906 ?auto_809909 ) ) ( not ( = ?auto_809907 ?auto_809908 ) ) ( not ( = ?auto_809907 ?auto_809909 ) ) ( not ( = ?auto_809908 ?auto_809909 ) ) ( ON ?auto_809907 ?auto_809908 ) ( ON ?auto_809906 ?auto_809907 ) ( ON ?auto_809905 ?auto_809906 ) ( ON ?auto_809904 ?auto_809905 ) ( ON ?auto_809903 ?auto_809904 ) ( ON ?auto_809902 ?auto_809903 ) ( ON ?auto_809901 ?auto_809902 ) ( ON ?auto_809900 ?auto_809901 ) ( ON ?auto_809899 ?auto_809900 ) ( ON ?auto_809898 ?auto_809899 ) ( ON ?auto_809897 ?auto_809898 ) ( ON ?auto_809896 ?auto_809897 ) ( ON ?auto_809895 ?auto_809896 ) ( ON ?auto_809894 ?auto_809895 ) ( ON ?auto_809893 ?auto_809894 ) ( CLEAR ?auto_809891 ) ( ON ?auto_809892 ?auto_809893 ) ( CLEAR ?auto_809892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_809891 ?auto_809892 )
      ( MAKE-18PILE ?auto_809891 ?auto_809892 ?auto_809893 ?auto_809894 ?auto_809895 ?auto_809896 ?auto_809897 ?auto_809898 ?auto_809899 ?auto_809900 ?auto_809901 ?auto_809902 ?auto_809903 ?auto_809904 ?auto_809905 ?auto_809906 ?auto_809907 ?auto_809908 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809928 - BLOCK
      ?auto_809929 - BLOCK
      ?auto_809930 - BLOCK
      ?auto_809931 - BLOCK
      ?auto_809932 - BLOCK
      ?auto_809933 - BLOCK
      ?auto_809934 - BLOCK
      ?auto_809935 - BLOCK
      ?auto_809936 - BLOCK
      ?auto_809937 - BLOCK
      ?auto_809938 - BLOCK
      ?auto_809939 - BLOCK
      ?auto_809940 - BLOCK
      ?auto_809941 - BLOCK
      ?auto_809942 - BLOCK
      ?auto_809943 - BLOCK
      ?auto_809944 - BLOCK
      ?auto_809945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_809945 ) ( ON-TABLE ?auto_809928 ) ( not ( = ?auto_809928 ?auto_809929 ) ) ( not ( = ?auto_809928 ?auto_809930 ) ) ( not ( = ?auto_809928 ?auto_809931 ) ) ( not ( = ?auto_809928 ?auto_809932 ) ) ( not ( = ?auto_809928 ?auto_809933 ) ) ( not ( = ?auto_809928 ?auto_809934 ) ) ( not ( = ?auto_809928 ?auto_809935 ) ) ( not ( = ?auto_809928 ?auto_809936 ) ) ( not ( = ?auto_809928 ?auto_809937 ) ) ( not ( = ?auto_809928 ?auto_809938 ) ) ( not ( = ?auto_809928 ?auto_809939 ) ) ( not ( = ?auto_809928 ?auto_809940 ) ) ( not ( = ?auto_809928 ?auto_809941 ) ) ( not ( = ?auto_809928 ?auto_809942 ) ) ( not ( = ?auto_809928 ?auto_809943 ) ) ( not ( = ?auto_809928 ?auto_809944 ) ) ( not ( = ?auto_809928 ?auto_809945 ) ) ( not ( = ?auto_809929 ?auto_809930 ) ) ( not ( = ?auto_809929 ?auto_809931 ) ) ( not ( = ?auto_809929 ?auto_809932 ) ) ( not ( = ?auto_809929 ?auto_809933 ) ) ( not ( = ?auto_809929 ?auto_809934 ) ) ( not ( = ?auto_809929 ?auto_809935 ) ) ( not ( = ?auto_809929 ?auto_809936 ) ) ( not ( = ?auto_809929 ?auto_809937 ) ) ( not ( = ?auto_809929 ?auto_809938 ) ) ( not ( = ?auto_809929 ?auto_809939 ) ) ( not ( = ?auto_809929 ?auto_809940 ) ) ( not ( = ?auto_809929 ?auto_809941 ) ) ( not ( = ?auto_809929 ?auto_809942 ) ) ( not ( = ?auto_809929 ?auto_809943 ) ) ( not ( = ?auto_809929 ?auto_809944 ) ) ( not ( = ?auto_809929 ?auto_809945 ) ) ( not ( = ?auto_809930 ?auto_809931 ) ) ( not ( = ?auto_809930 ?auto_809932 ) ) ( not ( = ?auto_809930 ?auto_809933 ) ) ( not ( = ?auto_809930 ?auto_809934 ) ) ( not ( = ?auto_809930 ?auto_809935 ) ) ( not ( = ?auto_809930 ?auto_809936 ) ) ( not ( = ?auto_809930 ?auto_809937 ) ) ( not ( = ?auto_809930 ?auto_809938 ) ) ( not ( = ?auto_809930 ?auto_809939 ) ) ( not ( = ?auto_809930 ?auto_809940 ) ) ( not ( = ?auto_809930 ?auto_809941 ) ) ( not ( = ?auto_809930 ?auto_809942 ) ) ( not ( = ?auto_809930 ?auto_809943 ) ) ( not ( = ?auto_809930 ?auto_809944 ) ) ( not ( = ?auto_809930 ?auto_809945 ) ) ( not ( = ?auto_809931 ?auto_809932 ) ) ( not ( = ?auto_809931 ?auto_809933 ) ) ( not ( = ?auto_809931 ?auto_809934 ) ) ( not ( = ?auto_809931 ?auto_809935 ) ) ( not ( = ?auto_809931 ?auto_809936 ) ) ( not ( = ?auto_809931 ?auto_809937 ) ) ( not ( = ?auto_809931 ?auto_809938 ) ) ( not ( = ?auto_809931 ?auto_809939 ) ) ( not ( = ?auto_809931 ?auto_809940 ) ) ( not ( = ?auto_809931 ?auto_809941 ) ) ( not ( = ?auto_809931 ?auto_809942 ) ) ( not ( = ?auto_809931 ?auto_809943 ) ) ( not ( = ?auto_809931 ?auto_809944 ) ) ( not ( = ?auto_809931 ?auto_809945 ) ) ( not ( = ?auto_809932 ?auto_809933 ) ) ( not ( = ?auto_809932 ?auto_809934 ) ) ( not ( = ?auto_809932 ?auto_809935 ) ) ( not ( = ?auto_809932 ?auto_809936 ) ) ( not ( = ?auto_809932 ?auto_809937 ) ) ( not ( = ?auto_809932 ?auto_809938 ) ) ( not ( = ?auto_809932 ?auto_809939 ) ) ( not ( = ?auto_809932 ?auto_809940 ) ) ( not ( = ?auto_809932 ?auto_809941 ) ) ( not ( = ?auto_809932 ?auto_809942 ) ) ( not ( = ?auto_809932 ?auto_809943 ) ) ( not ( = ?auto_809932 ?auto_809944 ) ) ( not ( = ?auto_809932 ?auto_809945 ) ) ( not ( = ?auto_809933 ?auto_809934 ) ) ( not ( = ?auto_809933 ?auto_809935 ) ) ( not ( = ?auto_809933 ?auto_809936 ) ) ( not ( = ?auto_809933 ?auto_809937 ) ) ( not ( = ?auto_809933 ?auto_809938 ) ) ( not ( = ?auto_809933 ?auto_809939 ) ) ( not ( = ?auto_809933 ?auto_809940 ) ) ( not ( = ?auto_809933 ?auto_809941 ) ) ( not ( = ?auto_809933 ?auto_809942 ) ) ( not ( = ?auto_809933 ?auto_809943 ) ) ( not ( = ?auto_809933 ?auto_809944 ) ) ( not ( = ?auto_809933 ?auto_809945 ) ) ( not ( = ?auto_809934 ?auto_809935 ) ) ( not ( = ?auto_809934 ?auto_809936 ) ) ( not ( = ?auto_809934 ?auto_809937 ) ) ( not ( = ?auto_809934 ?auto_809938 ) ) ( not ( = ?auto_809934 ?auto_809939 ) ) ( not ( = ?auto_809934 ?auto_809940 ) ) ( not ( = ?auto_809934 ?auto_809941 ) ) ( not ( = ?auto_809934 ?auto_809942 ) ) ( not ( = ?auto_809934 ?auto_809943 ) ) ( not ( = ?auto_809934 ?auto_809944 ) ) ( not ( = ?auto_809934 ?auto_809945 ) ) ( not ( = ?auto_809935 ?auto_809936 ) ) ( not ( = ?auto_809935 ?auto_809937 ) ) ( not ( = ?auto_809935 ?auto_809938 ) ) ( not ( = ?auto_809935 ?auto_809939 ) ) ( not ( = ?auto_809935 ?auto_809940 ) ) ( not ( = ?auto_809935 ?auto_809941 ) ) ( not ( = ?auto_809935 ?auto_809942 ) ) ( not ( = ?auto_809935 ?auto_809943 ) ) ( not ( = ?auto_809935 ?auto_809944 ) ) ( not ( = ?auto_809935 ?auto_809945 ) ) ( not ( = ?auto_809936 ?auto_809937 ) ) ( not ( = ?auto_809936 ?auto_809938 ) ) ( not ( = ?auto_809936 ?auto_809939 ) ) ( not ( = ?auto_809936 ?auto_809940 ) ) ( not ( = ?auto_809936 ?auto_809941 ) ) ( not ( = ?auto_809936 ?auto_809942 ) ) ( not ( = ?auto_809936 ?auto_809943 ) ) ( not ( = ?auto_809936 ?auto_809944 ) ) ( not ( = ?auto_809936 ?auto_809945 ) ) ( not ( = ?auto_809937 ?auto_809938 ) ) ( not ( = ?auto_809937 ?auto_809939 ) ) ( not ( = ?auto_809937 ?auto_809940 ) ) ( not ( = ?auto_809937 ?auto_809941 ) ) ( not ( = ?auto_809937 ?auto_809942 ) ) ( not ( = ?auto_809937 ?auto_809943 ) ) ( not ( = ?auto_809937 ?auto_809944 ) ) ( not ( = ?auto_809937 ?auto_809945 ) ) ( not ( = ?auto_809938 ?auto_809939 ) ) ( not ( = ?auto_809938 ?auto_809940 ) ) ( not ( = ?auto_809938 ?auto_809941 ) ) ( not ( = ?auto_809938 ?auto_809942 ) ) ( not ( = ?auto_809938 ?auto_809943 ) ) ( not ( = ?auto_809938 ?auto_809944 ) ) ( not ( = ?auto_809938 ?auto_809945 ) ) ( not ( = ?auto_809939 ?auto_809940 ) ) ( not ( = ?auto_809939 ?auto_809941 ) ) ( not ( = ?auto_809939 ?auto_809942 ) ) ( not ( = ?auto_809939 ?auto_809943 ) ) ( not ( = ?auto_809939 ?auto_809944 ) ) ( not ( = ?auto_809939 ?auto_809945 ) ) ( not ( = ?auto_809940 ?auto_809941 ) ) ( not ( = ?auto_809940 ?auto_809942 ) ) ( not ( = ?auto_809940 ?auto_809943 ) ) ( not ( = ?auto_809940 ?auto_809944 ) ) ( not ( = ?auto_809940 ?auto_809945 ) ) ( not ( = ?auto_809941 ?auto_809942 ) ) ( not ( = ?auto_809941 ?auto_809943 ) ) ( not ( = ?auto_809941 ?auto_809944 ) ) ( not ( = ?auto_809941 ?auto_809945 ) ) ( not ( = ?auto_809942 ?auto_809943 ) ) ( not ( = ?auto_809942 ?auto_809944 ) ) ( not ( = ?auto_809942 ?auto_809945 ) ) ( not ( = ?auto_809943 ?auto_809944 ) ) ( not ( = ?auto_809943 ?auto_809945 ) ) ( not ( = ?auto_809944 ?auto_809945 ) ) ( ON ?auto_809944 ?auto_809945 ) ( ON ?auto_809943 ?auto_809944 ) ( ON ?auto_809942 ?auto_809943 ) ( ON ?auto_809941 ?auto_809942 ) ( ON ?auto_809940 ?auto_809941 ) ( ON ?auto_809939 ?auto_809940 ) ( ON ?auto_809938 ?auto_809939 ) ( ON ?auto_809937 ?auto_809938 ) ( ON ?auto_809936 ?auto_809937 ) ( ON ?auto_809935 ?auto_809936 ) ( ON ?auto_809934 ?auto_809935 ) ( ON ?auto_809933 ?auto_809934 ) ( ON ?auto_809932 ?auto_809933 ) ( ON ?auto_809931 ?auto_809932 ) ( ON ?auto_809930 ?auto_809931 ) ( CLEAR ?auto_809928 ) ( ON ?auto_809929 ?auto_809930 ) ( CLEAR ?auto_809929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_809928 ?auto_809929 )
      ( MAKE-18PILE ?auto_809928 ?auto_809929 ?auto_809930 ?auto_809931 ?auto_809932 ?auto_809933 ?auto_809934 ?auto_809935 ?auto_809936 ?auto_809937 ?auto_809938 ?auto_809939 ?auto_809940 ?auto_809941 ?auto_809942 ?auto_809943 ?auto_809944 ?auto_809945 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_809964 - BLOCK
      ?auto_809965 - BLOCK
      ?auto_809966 - BLOCK
      ?auto_809967 - BLOCK
      ?auto_809968 - BLOCK
      ?auto_809969 - BLOCK
      ?auto_809970 - BLOCK
      ?auto_809971 - BLOCK
      ?auto_809972 - BLOCK
      ?auto_809973 - BLOCK
      ?auto_809974 - BLOCK
      ?auto_809975 - BLOCK
      ?auto_809976 - BLOCK
      ?auto_809977 - BLOCK
      ?auto_809978 - BLOCK
      ?auto_809979 - BLOCK
      ?auto_809980 - BLOCK
      ?auto_809981 - BLOCK
    )
    :vars
    (
      ?auto_809982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_809981 ?auto_809982 ) ( not ( = ?auto_809964 ?auto_809965 ) ) ( not ( = ?auto_809964 ?auto_809966 ) ) ( not ( = ?auto_809964 ?auto_809967 ) ) ( not ( = ?auto_809964 ?auto_809968 ) ) ( not ( = ?auto_809964 ?auto_809969 ) ) ( not ( = ?auto_809964 ?auto_809970 ) ) ( not ( = ?auto_809964 ?auto_809971 ) ) ( not ( = ?auto_809964 ?auto_809972 ) ) ( not ( = ?auto_809964 ?auto_809973 ) ) ( not ( = ?auto_809964 ?auto_809974 ) ) ( not ( = ?auto_809964 ?auto_809975 ) ) ( not ( = ?auto_809964 ?auto_809976 ) ) ( not ( = ?auto_809964 ?auto_809977 ) ) ( not ( = ?auto_809964 ?auto_809978 ) ) ( not ( = ?auto_809964 ?auto_809979 ) ) ( not ( = ?auto_809964 ?auto_809980 ) ) ( not ( = ?auto_809964 ?auto_809981 ) ) ( not ( = ?auto_809964 ?auto_809982 ) ) ( not ( = ?auto_809965 ?auto_809966 ) ) ( not ( = ?auto_809965 ?auto_809967 ) ) ( not ( = ?auto_809965 ?auto_809968 ) ) ( not ( = ?auto_809965 ?auto_809969 ) ) ( not ( = ?auto_809965 ?auto_809970 ) ) ( not ( = ?auto_809965 ?auto_809971 ) ) ( not ( = ?auto_809965 ?auto_809972 ) ) ( not ( = ?auto_809965 ?auto_809973 ) ) ( not ( = ?auto_809965 ?auto_809974 ) ) ( not ( = ?auto_809965 ?auto_809975 ) ) ( not ( = ?auto_809965 ?auto_809976 ) ) ( not ( = ?auto_809965 ?auto_809977 ) ) ( not ( = ?auto_809965 ?auto_809978 ) ) ( not ( = ?auto_809965 ?auto_809979 ) ) ( not ( = ?auto_809965 ?auto_809980 ) ) ( not ( = ?auto_809965 ?auto_809981 ) ) ( not ( = ?auto_809965 ?auto_809982 ) ) ( not ( = ?auto_809966 ?auto_809967 ) ) ( not ( = ?auto_809966 ?auto_809968 ) ) ( not ( = ?auto_809966 ?auto_809969 ) ) ( not ( = ?auto_809966 ?auto_809970 ) ) ( not ( = ?auto_809966 ?auto_809971 ) ) ( not ( = ?auto_809966 ?auto_809972 ) ) ( not ( = ?auto_809966 ?auto_809973 ) ) ( not ( = ?auto_809966 ?auto_809974 ) ) ( not ( = ?auto_809966 ?auto_809975 ) ) ( not ( = ?auto_809966 ?auto_809976 ) ) ( not ( = ?auto_809966 ?auto_809977 ) ) ( not ( = ?auto_809966 ?auto_809978 ) ) ( not ( = ?auto_809966 ?auto_809979 ) ) ( not ( = ?auto_809966 ?auto_809980 ) ) ( not ( = ?auto_809966 ?auto_809981 ) ) ( not ( = ?auto_809966 ?auto_809982 ) ) ( not ( = ?auto_809967 ?auto_809968 ) ) ( not ( = ?auto_809967 ?auto_809969 ) ) ( not ( = ?auto_809967 ?auto_809970 ) ) ( not ( = ?auto_809967 ?auto_809971 ) ) ( not ( = ?auto_809967 ?auto_809972 ) ) ( not ( = ?auto_809967 ?auto_809973 ) ) ( not ( = ?auto_809967 ?auto_809974 ) ) ( not ( = ?auto_809967 ?auto_809975 ) ) ( not ( = ?auto_809967 ?auto_809976 ) ) ( not ( = ?auto_809967 ?auto_809977 ) ) ( not ( = ?auto_809967 ?auto_809978 ) ) ( not ( = ?auto_809967 ?auto_809979 ) ) ( not ( = ?auto_809967 ?auto_809980 ) ) ( not ( = ?auto_809967 ?auto_809981 ) ) ( not ( = ?auto_809967 ?auto_809982 ) ) ( not ( = ?auto_809968 ?auto_809969 ) ) ( not ( = ?auto_809968 ?auto_809970 ) ) ( not ( = ?auto_809968 ?auto_809971 ) ) ( not ( = ?auto_809968 ?auto_809972 ) ) ( not ( = ?auto_809968 ?auto_809973 ) ) ( not ( = ?auto_809968 ?auto_809974 ) ) ( not ( = ?auto_809968 ?auto_809975 ) ) ( not ( = ?auto_809968 ?auto_809976 ) ) ( not ( = ?auto_809968 ?auto_809977 ) ) ( not ( = ?auto_809968 ?auto_809978 ) ) ( not ( = ?auto_809968 ?auto_809979 ) ) ( not ( = ?auto_809968 ?auto_809980 ) ) ( not ( = ?auto_809968 ?auto_809981 ) ) ( not ( = ?auto_809968 ?auto_809982 ) ) ( not ( = ?auto_809969 ?auto_809970 ) ) ( not ( = ?auto_809969 ?auto_809971 ) ) ( not ( = ?auto_809969 ?auto_809972 ) ) ( not ( = ?auto_809969 ?auto_809973 ) ) ( not ( = ?auto_809969 ?auto_809974 ) ) ( not ( = ?auto_809969 ?auto_809975 ) ) ( not ( = ?auto_809969 ?auto_809976 ) ) ( not ( = ?auto_809969 ?auto_809977 ) ) ( not ( = ?auto_809969 ?auto_809978 ) ) ( not ( = ?auto_809969 ?auto_809979 ) ) ( not ( = ?auto_809969 ?auto_809980 ) ) ( not ( = ?auto_809969 ?auto_809981 ) ) ( not ( = ?auto_809969 ?auto_809982 ) ) ( not ( = ?auto_809970 ?auto_809971 ) ) ( not ( = ?auto_809970 ?auto_809972 ) ) ( not ( = ?auto_809970 ?auto_809973 ) ) ( not ( = ?auto_809970 ?auto_809974 ) ) ( not ( = ?auto_809970 ?auto_809975 ) ) ( not ( = ?auto_809970 ?auto_809976 ) ) ( not ( = ?auto_809970 ?auto_809977 ) ) ( not ( = ?auto_809970 ?auto_809978 ) ) ( not ( = ?auto_809970 ?auto_809979 ) ) ( not ( = ?auto_809970 ?auto_809980 ) ) ( not ( = ?auto_809970 ?auto_809981 ) ) ( not ( = ?auto_809970 ?auto_809982 ) ) ( not ( = ?auto_809971 ?auto_809972 ) ) ( not ( = ?auto_809971 ?auto_809973 ) ) ( not ( = ?auto_809971 ?auto_809974 ) ) ( not ( = ?auto_809971 ?auto_809975 ) ) ( not ( = ?auto_809971 ?auto_809976 ) ) ( not ( = ?auto_809971 ?auto_809977 ) ) ( not ( = ?auto_809971 ?auto_809978 ) ) ( not ( = ?auto_809971 ?auto_809979 ) ) ( not ( = ?auto_809971 ?auto_809980 ) ) ( not ( = ?auto_809971 ?auto_809981 ) ) ( not ( = ?auto_809971 ?auto_809982 ) ) ( not ( = ?auto_809972 ?auto_809973 ) ) ( not ( = ?auto_809972 ?auto_809974 ) ) ( not ( = ?auto_809972 ?auto_809975 ) ) ( not ( = ?auto_809972 ?auto_809976 ) ) ( not ( = ?auto_809972 ?auto_809977 ) ) ( not ( = ?auto_809972 ?auto_809978 ) ) ( not ( = ?auto_809972 ?auto_809979 ) ) ( not ( = ?auto_809972 ?auto_809980 ) ) ( not ( = ?auto_809972 ?auto_809981 ) ) ( not ( = ?auto_809972 ?auto_809982 ) ) ( not ( = ?auto_809973 ?auto_809974 ) ) ( not ( = ?auto_809973 ?auto_809975 ) ) ( not ( = ?auto_809973 ?auto_809976 ) ) ( not ( = ?auto_809973 ?auto_809977 ) ) ( not ( = ?auto_809973 ?auto_809978 ) ) ( not ( = ?auto_809973 ?auto_809979 ) ) ( not ( = ?auto_809973 ?auto_809980 ) ) ( not ( = ?auto_809973 ?auto_809981 ) ) ( not ( = ?auto_809973 ?auto_809982 ) ) ( not ( = ?auto_809974 ?auto_809975 ) ) ( not ( = ?auto_809974 ?auto_809976 ) ) ( not ( = ?auto_809974 ?auto_809977 ) ) ( not ( = ?auto_809974 ?auto_809978 ) ) ( not ( = ?auto_809974 ?auto_809979 ) ) ( not ( = ?auto_809974 ?auto_809980 ) ) ( not ( = ?auto_809974 ?auto_809981 ) ) ( not ( = ?auto_809974 ?auto_809982 ) ) ( not ( = ?auto_809975 ?auto_809976 ) ) ( not ( = ?auto_809975 ?auto_809977 ) ) ( not ( = ?auto_809975 ?auto_809978 ) ) ( not ( = ?auto_809975 ?auto_809979 ) ) ( not ( = ?auto_809975 ?auto_809980 ) ) ( not ( = ?auto_809975 ?auto_809981 ) ) ( not ( = ?auto_809975 ?auto_809982 ) ) ( not ( = ?auto_809976 ?auto_809977 ) ) ( not ( = ?auto_809976 ?auto_809978 ) ) ( not ( = ?auto_809976 ?auto_809979 ) ) ( not ( = ?auto_809976 ?auto_809980 ) ) ( not ( = ?auto_809976 ?auto_809981 ) ) ( not ( = ?auto_809976 ?auto_809982 ) ) ( not ( = ?auto_809977 ?auto_809978 ) ) ( not ( = ?auto_809977 ?auto_809979 ) ) ( not ( = ?auto_809977 ?auto_809980 ) ) ( not ( = ?auto_809977 ?auto_809981 ) ) ( not ( = ?auto_809977 ?auto_809982 ) ) ( not ( = ?auto_809978 ?auto_809979 ) ) ( not ( = ?auto_809978 ?auto_809980 ) ) ( not ( = ?auto_809978 ?auto_809981 ) ) ( not ( = ?auto_809978 ?auto_809982 ) ) ( not ( = ?auto_809979 ?auto_809980 ) ) ( not ( = ?auto_809979 ?auto_809981 ) ) ( not ( = ?auto_809979 ?auto_809982 ) ) ( not ( = ?auto_809980 ?auto_809981 ) ) ( not ( = ?auto_809980 ?auto_809982 ) ) ( not ( = ?auto_809981 ?auto_809982 ) ) ( ON ?auto_809980 ?auto_809981 ) ( ON ?auto_809979 ?auto_809980 ) ( ON ?auto_809978 ?auto_809979 ) ( ON ?auto_809977 ?auto_809978 ) ( ON ?auto_809976 ?auto_809977 ) ( ON ?auto_809975 ?auto_809976 ) ( ON ?auto_809974 ?auto_809975 ) ( ON ?auto_809973 ?auto_809974 ) ( ON ?auto_809972 ?auto_809973 ) ( ON ?auto_809971 ?auto_809972 ) ( ON ?auto_809970 ?auto_809971 ) ( ON ?auto_809969 ?auto_809970 ) ( ON ?auto_809968 ?auto_809969 ) ( ON ?auto_809967 ?auto_809968 ) ( ON ?auto_809966 ?auto_809967 ) ( ON ?auto_809965 ?auto_809966 ) ( ON ?auto_809964 ?auto_809965 ) ( CLEAR ?auto_809964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_809964 )
      ( MAKE-18PILE ?auto_809964 ?auto_809965 ?auto_809966 ?auto_809967 ?auto_809968 ?auto_809969 ?auto_809970 ?auto_809971 ?auto_809972 ?auto_809973 ?auto_809974 ?auto_809975 ?auto_809976 ?auto_809977 ?auto_809978 ?auto_809979 ?auto_809980 ?auto_809981 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_810001 - BLOCK
      ?auto_810002 - BLOCK
      ?auto_810003 - BLOCK
      ?auto_810004 - BLOCK
      ?auto_810005 - BLOCK
      ?auto_810006 - BLOCK
      ?auto_810007 - BLOCK
      ?auto_810008 - BLOCK
      ?auto_810009 - BLOCK
      ?auto_810010 - BLOCK
      ?auto_810011 - BLOCK
      ?auto_810012 - BLOCK
      ?auto_810013 - BLOCK
      ?auto_810014 - BLOCK
      ?auto_810015 - BLOCK
      ?auto_810016 - BLOCK
      ?auto_810017 - BLOCK
      ?auto_810018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_810018 ) ( not ( = ?auto_810001 ?auto_810002 ) ) ( not ( = ?auto_810001 ?auto_810003 ) ) ( not ( = ?auto_810001 ?auto_810004 ) ) ( not ( = ?auto_810001 ?auto_810005 ) ) ( not ( = ?auto_810001 ?auto_810006 ) ) ( not ( = ?auto_810001 ?auto_810007 ) ) ( not ( = ?auto_810001 ?auto_810008 ) ) ( not ( = ?auto_810001 ?auto_810009 ) ) ( not ( = ?auto_810001 ?auto_810010 ) ) ( not ( = ?auto_810001 ?auto_810011 ) ) ( not ( = ?auto_810001 ?auto_810012 ) ) ( not ( = ?auto_810001 ?auto_810013 ) ) ( not ( = ?auto_810001 ?auto_810014 ) ) ( not ( = ?auto_810001 ?auto_810015 ) ) ( not ( = ?auto_810001 ?auto_810016 ) ) ( not ( = ?auto_810001 ?auto_810017 ) ) ( not ( = ?auto_810001 ?auto_810018 ) ) ( not ( = ?auto_810002 ?auto_810003 ) ) ( not ( = ?auto_810002 ?auto_810004 ) ) ( not ( = ?auto_810002 ?auto_810005 ) ) ( not ( = ?auto_810002 ?auto_810006 ) ) ( not ( = ?auto_810002 ?auto_810007 ) ) ( not ( = ?auto_810002 ?auto_810008 ) ) ( not ( = ?auto_810002 ?auto_810009 ) ) ( not ( = ?auto_810002 ?auto_810010 ) ) ( not ( = ?auto_810002 ?auto_810011 ) ) ( not ( = ?auto_810002 ?auto_810012 ) ) ( not ( = ?auto_810002 ?auto_810013 ) ) ( not ( = ?auto_810002 ?auto_810014 ) ) ( not ( = ?auto_810002 ?auto_810015 ) ) ( not ( = ?auto_810002 ?auto_810016 ) ) ( not ( = ?auto_810002 ?auto_810017 ) ) ( not ( = ?auto_810002 ?auto_810018 ) ) ( not ( = ?auto_810003 ?auto_810004 ) ) ( not ( = ?auto_810003 ?auto_810005 ) ) ( not ( = ?auto_810003 ?auto_810006 ) ) ( not ( = ?auto_810003 ?auto_810007 ) ) ( not ( = ?auto_810003 ?auto_810008 ) ) ( not ( = ?auto_810003 ?auto_810009 ) ) ( not ( = ?auto_810003 ?auto_810010 ) ) ( not ( = ?auto_810003 ?auto_810011 ) ) ( not ( = ?auto_810003 ?auto_810012 ) ) ( not ( = ?auto_810003 ?auto_810013 ) ) ( not ( = ?auto_810003 ?auto_810014 ) ) ( not ( = ?auto_810003 ?auto_810015 ) ) ( not ( = ?auto_810003 ?auto_810016 ) ) ( not ( = ?auto_810003 ?auto_810017 ) ) ( not ( = ?auto_810003 ?auto_810018 ) ) ( not ( = ?auto_810004 ?auto_810005 ) ) ( not ( = ?auto_810004 ?auto_810006 ) ) ( not ( = ?auto_810004 ?auto_810007 ) ) ( not ( = ?auto_810004 ?auto_810008 ) ) ( not ( = ?auto_810004 ?auto_810009 ) ) ( not ( = ?auto_810004 ?auto_810010 ) ) ( not ( = ?auto_810004 ?auto_810011 ) ) ( not ( = ?auto_810004 ?auto_810012 ) ) ( not ( = ?auto_810004 ?auto_810013 ) ) ( not ( = ?auto_810004 ?auto_810014 ) ) ( not ( = ?auto_810004 ?auto_810015 ) ) ( not ( = ?auto_810004 ?auto_810016 ) ) ( not ( = ?auto_810004 ?auto_810017 ) ) ( not ( = ?auto_810004 ?auto_810018 ) ) ( not ( = ?auto_810005 ?auto_810006 ) ) ( not ( = ?auto_810005 ?auto_810007 ) ) ( not ( = ?auto_810005 ?auto_810008 ) ) ( not ( = ?auto_810005 ?auto_810009 ) ) ( not ( = ?auto_810005 ?auto_810010 ) ) ( not ( = ?auto_810005 ?auto_810011 ) ) ( not ( = ?auto_810005 ?auto_810012 ) ) ( not ( = ?auto_810005 ?auto_810013 ) ) ( not ( = ?auto_810005 ?auto_810014 ) ) ( not ( = ?auto_810005 ?auto_810015 ) ) ( not ( = ?auto_810005 ?auto_810016 ) ) ( not ( = ?auto_810005 ?auto_810017 ) ) ( not ( = ?auto_810005 ?auto_810018 ) ) ( not ( = ?auto_810006 ?auto_810007 ) ) ( not ( = ?auto_810006 ?auto_810008 ) ) ( not ( = ?auto_810006 ?auto_810009 ) ) ( not ( = ?auto_810006 ?auto_810010 ) ) ( not ( = ?auto_810006 ?auto_810011 ) ) ( not ( = ?auto_810006 ?auto_810012 ) ) ( not ( = ?auto_810006 ?auto_810013 ) ) ( not ( = ?auto_810006 ?auto_810014 ) ) ( not ( = ?auto_810006 ?auto_810015 ) ) ( not ( = ?auto_810006 ?auto_810016 ) ) ( not ( = ?auto_810006 ?auto_810017 ) ) ( not ( = ?auto_810006 ?auto_810018 ) ) ( not ( = ?auto_810007 ?auto_810008 ) ) ( not ( = ?auto_810007 ?auto_810009 ) ) ( not ( = ?auto_810007 ?auto_810010 ) ) ( not ( = ?auto_810007 ?auto_810011 ) ) ( not ( = ?auto_810007 ?auto_810012 ) ) ( not ( = ?auto_810007 ?auto_810013 ) ) ( not ( = ?auto_810007 ?auto_810014 ) ) ( not ( = ?auto_810007 ?auto_810015 ) ) ( not ( = ?auto_810007 ?auto_810016 ) ) ( not ( = ?auto_810007 ?auto_810017 ) ) ( not ( = ?auto_810007 ?auto_810018 ) ) ( not ( = ?auto_810008 ?auto_810009 ) ) ( not ( = ?auto_810008 ?auto_810010 ) ) ( not ( = ?auto_810008 ?auto_810011 ) ) ( not ( = ?auto_810008 ?auto_810012 ) ) ( not ( = ?auto_810008 ?auto_810013 ) ) ( not ( = ?auto_810008 ?auto_810014 ) ) ( not ( = ?auto_810008 ?auto_810015 ) ) ( not ( = ?auto_810008 ?auto_810016 ) ) ( not ( = ?auto_810008 ?auto_810017 ) ) ( not ( = ?auto_810008 ?auto_810018 ) ) ( not ( = ?auto_810009 ?auto_810010 ) ) ( not ( = ?auto_810009 ?auto_810011 ) ) ( not ( = ?auto_810009 ?auto_810012 ) ) ( not ( = ?auto_810009 ?auto_810013 ) ) ( not ( = ?auto_810009 ?auto_810014 ) ) ( not ( = ?auto_810009 ?auto_810015 ) ) ( not ( = ?auto_810009 ?auto_810016 ) ) ( not ( = ?auto_810009 ?auto_810017 ) ) ( not ( = ?auto_810009 ?auto_810018 ) ) ( not ( = ?auto_810010 ?auto_810011 ) ) ( not ( = ?auto_810010 ?auto_810012 ) ) ( not ( = ?auto_810010 ?auto_810013 ) ) ( not ( = ?auto_810010 ?auto_810014 ) ) ( not ( = ?auto_810010 ?auto_810015 ) ) ( not ( = ?auto_810010 ?auto_810016 ) ) ( not ( = ?auto_810010 ?auto_810017 ) ) ( not ( = ?auto_810010 ?auto_810018 ) ) ( not ( = ?auto_810011 ?auto_810012 ) ) ( not ( = ?auto_810011 ?auto_810013 ) ) ( not ( = ?auto_810011 ?auto_810014 ) ) ( not ( = ?auto_810011 ?auto_810015 ) ) ( not ( = ?auto_810011 ?auto_810016 ) ) ( not ( = ?auto_810011 ?auto_810017 ) ) ( not ( = ?auto_810011 ?auto_810018 ) ) ( not ( = ?auto_810012 ?auto_810013 ) ) ( not ( = ?auto_810012 ?auto_810014 ) ) ( not ( = ?auto_810012 ?auto_810015 ) ) ( not ( = ?auto_810012 ?auto_810016 ) ) ( not ( = ?auto_810012 ?auto_810017 ) ) ( not ( = ?auto_810012 ?auto_810018 ) ) ( not ( = ?auto_810013 ?auto_810014 ) ) ( not ( = ?auto_810013 ?auto_810015 ) ) ( not ( = ?auto_810013 ?auto_810016 ) ) ( not ( = ?auto_810013 ?auto_810017 ) ) ( not ( = ?auto_810013 ?auto_810018 ) ) ( not ( = ?auto_810014 ?auto_810015 ) ) ( not ( = ?auto_810014 ?auto_810016 ) ) ( not ( = ?auto_810014 ?auto_810017 ) ) ( not ( = ?auto_810014 ?auto_810018 ) ) ( not ( = ?auto_810015 ?auto_810016 ) ) ( not ( = ?auto_810015 ?auto_810017 ) ) ( not ( = ?auto_810015 ?auto_810018 ) ) ( not ( = ?auto_810016 ?auto_810017 ) ) ( not ( = ?auto_810016 ?auto_810018 ) ) ( not ( = ?auto_810017 ?auto_810018 ) ) ( ON ?auto_810017 ?auto_810018 ) ( ON ?auto_810016 ?auto_810017 ) ( ON ?auto_810015 ?auto_810016 ) ( ON ?auto_810014 ?auto_810015 ) ( ON ?auto_810013 ?auto_810014 ) ( ON ?auto_810012 ?auto_810013 ) ( ON ?auto_810011 ?auto_810012 ) ( ON ?auto_810010 ?auto_810011 ) ( ON ?auto_810009 ?auto_810010 ) ( ON ?auto_810008 ?auto_810009 ) ( ON ?auto_810007 ?auto_810008 ) ( ON ?auto_810006 ?auto_810007 ) ( ON ?auto_810005 ?auto_810006 ) ( ON ?auto_810004 ?auto_810005 ) ( ON ?auto_810003 ?auto_810004 ) ( ON ?auto_810002 ?auto_810003 ) ( ON ?auto_810001 ?auto_810002 ) ( CLEAR ?auto_810001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_810001 )
      ( MAKE-18PILE ?auto_810001 ?auto_810002 ?auto_810003 ?auto_810004 ?auto_810005 ?auto_810006 ?auto_810007 ?auto_810008 ?auto_810009 ?auto_810010 ?auto_810011 ?auto_810012 ?auto_810013 ?auto_810014 ?auto_810015 ?auto_810016 ?auto_810017 ?auto_810018 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_810037 - BLOCK
      ?auto_810038 - BLOCK
      ?auto_810039 - BLOCK
      ?auto_810040 - BLOCK
      ?auto_810041 - BLOCK
      ?auto_810042 - BLOCK
      ?auto_810043 - BLOCK
      ?auto_810044 - BLOCK
      ?auto_810045 - BLOCK
      ?auto_810046 - BLOCK
      ?auto_810047 - BLOCK
      ?auto_810048 - BLOCK
      ?auto_810049 - BLOCK
      ?auto_810050 - BLOCK
      ?auto_810051 - BLOCK
      ?auto_810052 - BLOCK
      ?auto_810053 - BLOCK
      ?auto_810054 - BLOCK
    )
    :vars
    (
      ?auto_810055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_810037 ?auto_810038 ) ) ( not ( = ?auto_810037 ?auto_810039 ) ) ( not ( = ?auto_810037 ?auto_810040 ) ) ( not ( = ?auto_810037 ?auto_810041 ) ) ( not ( = ?auto_810037 ?auto_810042 ) ) ( not ( = ?auto_810037 ?auto_810043 ) ) ( not ( = ?auto_810037 ?auto_810044 ) ) ( not ( = ?auto_810037 ?auto_810045 ) ) ( not ( = ?auto_810037 ?auto_810046 ) ) ( not ( = ?auto_810037 ?auto_810047 ) ) ( not ( = ?auto_810037 ?auto_810048 ) ) ( not ( = ?auto_810037 ?auto_810049 ) ) ( not ( = ?auto_810037 ?auto_810050 ) ) ( not ( = ?auto_810037 ?auto_810051 ) ) ( not ( = ?auto_810037 ?auto_810052 ) ) ( not ( = ?auto_810037 ?auto_810053 ) ) ( not ( = ?auto_810037 ?auto_810054 ) ) ( not ( = ?auto_810038 ?auto_810039 ) ) ( not ( = ?auto_810038 ?auto_810040 ) ) ( not ( = ?auto_810038 ?auto_810041 ) ) ( not ( = ?auto_810038 ?auto_810042 ) ) ( not ( = ?auto_810038 ?auto_810043 ) ) ( not ( = ?auto_810038 ?auto_810044 ) ) ( not ( = ?auto_810038 ?auto_810045 ) ) ( not ( = ?auto_810038 ?auto_810046 ) ) ( not ( = ?auto_810038 ?auto_810047 ) ) ( not ( = ?auto_810038 ?auto_810048 ) ) ( not ( = ?auto_810038 ?auto_810049 ) ) ( not ( = ?auto_810038 ?auto_810050 ) ) ( not ( = ?auto_810038 ?auto_810051 ) ) ( not ( = ?auto_810038 ?auto_810052 ) ) ( not ( = ?auto_810038 ?auto_810053 ) ) ( not ( = ?auto_810038 ?auto_810054 ) ) ( not ( = ?auto_810039 ?auto_810040 ) ) ( not ( = ?auto_810039 ?auto_810041 ) ) ( not ( = ?auto_810039 ?auto_810042 ) ) ( not ( = ?auto_810039 ?auto_810043 ) ) ( not ( = ?auto_810039 ?auto_810044 ) ) ( not ( = ?auto_810039 ?auto_810045 ) ) ( not ( = ?auto_810039 ?auto_810046 ) ) ( not ( = ?auto_810039 ?auto_810047 ) ) ( not ( = ?auto_810039 ?auto_810048 ) ) ( not ( = ?auto_810039 ?auto_810049 ) ) ( not ( = ?auto_810039 ?auto_810050 ) ) ( not ( = ?auto_810039 ?auto_810051 ) ) ( not ( = ?auto_810039 ?auto_810052 ) ) ( not ( = ?auto_810039 ?auto_810053 ) ) ( not ( = ?auto_810039 ?auto_810054 ) ) ( not ( = ?auto_810040 ?auto_810041 ) ) ( not ( = ?auto_810040 ?auto_810042 ) ) ( not ( = ?auto_810040 ?auto_810043 ) ) ( not ( = ?auto_810040 ?auto_810044 ) ) ( not ( = ?auto_810040 ?auto_810045 ) ) ( not ( = ?auto_810040 ?auto_810046 ) ) ( not ( = ?auto_810040 ?auto_810047 ) ) ( not ( = ?auto_810040 ?auto_810048 ) ) ( not ( = ?auto_810040 ?auto_810049 ) ) ( not ( = ?auto_810040 ?auto_810050 ) ) ( not ( = ?auto_810040 ?auto_810051 ) ) ( not ( = ?auto_810040 ?auto_810052 ) ) ( not ( = ?auto_810040 ?auto_810053 ) ) ( not ( = ?auto_810040 ?auto_810054 ) ) ( not ( = ?auto_810041 ?auto_810042 ) ) ( not ( = ?auto_810041 ?auto_810043 ) ) ( not ( = ?auto_810041 ?auto_810044 ) ) ( not ( = ?auto_810041 ?auto_810045 ) ) ( not ( = ?auto_810041 ?auto_810046 ) ) ( not ( = ?auto_810041 ?auto_810047 ) ) ( not ( = ?auto_810041 ?auto_810048 ) ) ( not ( = ?auto_810041 ?auto_810049 ) ) ( not ( = ?auto_810041 ?auto_810050 ) ) ( not ( = ?auto_810041 ?auto_810051 ) ) ( not ( = ?auto_810041 ?auto_810052 ) ) ( not ( = ?auto_810041 ?auto_810053 ) ) ( not ( = ?auto_810041 ?auto_810054 ) ) ( not ( = ?auto_810042 ?auto_810043 ) ) ( not ( = ?auto_810042 ?auto_810044 ) ) ( not ( = ?auto_810042 ?auto_810045 ) ) ( not ( = ?auto_810042 ?auto_810046 ) ) ( not ( = ?auto_810042 ?auto_810047 ) ) ( not ( = ?auto_810042 ?auto_810048 ) ) ( not ( = ?auto_810042 ?auto_810049 ) ) ( not ( = ?auto_810042 ?auto_810050 ) ) ( not ( = ?auto_810042 ?auto_810051 ) ) ( not ( = ?auto_810042 ?auto_810052 ) ) ( not ( = ?auto_810042 ?auto_810053 ) ) ( not ( = ?auto_810042 ?auto_810054 ) ) ( not ( = ?auto_810043 ?auto_810044 ) ) ( not ( = ?auto_810043 ?auto_810045 ) ) ( not ( = ?auto_810043 ?auto_810046 ) ) ( not ( = ?auto_810043 ?auto_810047 ) ) ( not ( = ?auto_810043 ?auto_810048 ) ) ( not ( = ?auto_810043 ?auto_810049 ) ) ( not ( = ?auto_810043 ?auto_810050 ) ) ( not ( = ?auto_810043 ?auto_810051 ) ) ( not ( = ?auto_810043 ?auto_810052 ) ) ( not ( = ?auto_810043 ?auto_810053 ) ) ( not ( = ?auto_810043 ?auto_810054 ) ) ( not ( = ?auto_810044 ?auto_810045 ) ) ( not ( = ?auto_810044 ?auto_810046 ) ) ( not ( = ?auto_810044 ?auto_810047 ) ) ( not ( = ?auto_810044 ?auto_810048 ) ) ( not ( = ?auto_810044 ?auto_810049 ) ) ( not ( = ?auto_810044 ?auto_810050 ) ) ( not ( = ?auto_810044 ?auto_810051 ) ) ( not ( = ?auto_810044 ?auto_810052 ) ) ( not ( = ?auto_810044 ?auto_810053 ) ) ( not ( = ?auto_810044 ?auto_810054 ) ) ( not ( = ?auto_810045 ?auto_810046 ) ) ( not ( = ?auto_810045 ?auto_810047 ) ) ( not ( = ?auto_810045 ?auto_810048 ) ) ( not ( = ?auto_810045 ?auto_810049 ) ) ( not ( = ?auto_810045 ?auto_810050 ) ) ( not ( = ?auto_810045 ?auto_810051 ) ) ( not ( = ?auto_810045 ?auto_810052 ) ) ( not ( = ?auto_810045 ?auto_810053 ) ) ( not ( = ?auto_810045 ?auto_810054 ) ) ( not ( = ?auto_810046 ?auto_810047 ) ) ( not ( = ?auto_810046 ?auto_810048 ) ) ( not ( = ?auto_810046 ?auto_810049 ) ) ( not ( = ?auto_810046 ?auto_810050 ) ) ( not ( = ?auto_810046 ?auto_810051 ) ) ( not ( = ?auto_810046 ?auto_810052 ) ) ( not ( = ?auto_810046 ?auto_810053 ) ) ( not ( = ?auto_810046 ?auto_810054 ) ) ( not ( = ?auto_810047 ?auto_810048 ) ) ( not ( = ?auto_810047 ?auto_810049 ) ) ( not ( = ?auto_810047 ?auto_810050 ) ) ( not ( = ?auto_810047 ?auto_810051 ) ) ( not ( = ?auto_810047 ?auto_810052 ) ) ( not ( = ?auto_810047 ?auto_810053 ) ) ( not ( = ?auto_810047 ?auto_810054 ) ) ( not ( = ?auto_810048 ?auto_810049 ) ) ( not ( = ?auto_810048 ?auto_810050 ) ) ( not ( = ?auto_810048 ?auto_810051 ) ) ( not ( = ?auto_810048 ?auto_810052 ) ) ( not ( = ?auto_810048 ?auto_810053 ) ) ( not ( = ?auto_810048 ?auto_810054 ) ) ( not ( = ?auto_810049 ?auto_810050 ) ) ( not ( = ?auto_810049 ?auto_810051 ) ) ( not ( = ?auto_810049 ?auto_810052 ) ) ( not ( = ?auto_810049 ?auto_810053 ) ) ( not ( = ?auto_810049 ?auto_810054 ) ) ( not ( = ?auto_810050 ?auto_810051 ) ) ( not ( = ?auto_810050 ?auto_810052 ) ) ( not ( = ?auto_810050 ?auto_810053 ) ) ( not ( = ?auto_810050 ?auto_810054 ) ) ( not ( = ?auto_810051 ?auto_810052 ) ) ( not ( = ?auto_810051 ?auto_810053 ) ) ( not ( = ?auto_810051 ?auto_810054 ) ) ( not ( = ?auto_810052 ?auto_810053 ) ) ( not ( = ?auto_810052 ?auto_810054 ) ) ( not ( = ?auto_810053 ?auto_810054 ) ) ( ON ?auto_810037 ?auto_810055 ) ( not ( = ?auto_810054 ?auto_810055 ) ) ( not ( = ?auto_810053 ?auto_810055 ) ) ( not ( = ?auto_810052 ?auto_810055 ) ) ( not ( = ?auto_810051 ?auto_810055 ) ) ( not ( = ?auto_810050 ?auto_810055 ) ) ( not ( = ?auto_810049 ?auto_810055 ) ) ( not ( = ?auto_810048 ?auto_810055 ) ) ( not ( = ?auto_810047 ?auto_810055 ) ) ( not ( = ?auto_810046 ?auto_810055 ) ) ( not ( = ?auto_810045 ?auto_810055 ) ) ( not ( = ?auto_810044 ?auto_810055 ) ) ( not ( = ?auto_810043 ?auto_810055 ) ) ( not ( = ?auto_810042 ?auto_810055 ) ) ( not ( = ?auto_810041 ?auto_810055 ) ) ( not ( = ?auto_810040 ?auto_810055 ) ) ( not ( = ?auto_810039 ?auto_810055 ) ) ( not ( = ?auto_810038 ?auto_810055 ) ) ( not ( = ?auto_810037 ?auto_810055 ) ) ( ON ?auto_810038 ?auto_810037 ) ( ON ?auto_810039 ?auto_810038 ) ( ON ?auto_810040 ?auto_810039 ) ( ON ?auto_810041 ?auto_810040 ) ( ON ?auto_810042 ?auto_810041 ) ( ON ?auto_810043 ?auto_810042 ) ( ON ?auto_810044 ?auto_810043 ) ( ON ?auto_810045 ?auto_810044 ) ( ON ?auto_810046 ?auto_810045 ) ( ON ?auto_810047 ?auto_810046 ) ( ON ?auto_810048 ?auto_810047 ) ( ON ?auto_810049 ?auto_810048 ) ( ON ?auto_810050 ?auto_810049 ) ( ON ?auto_810051 ?auto_810050 ) ( ON ?auto_810052 ?auto_810051 ) ( ON ?auto_810053 ?auto_810052 ) ( ON ?auto_810054 ?auto_810053 ) ( CLEAR ?auto_810054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_810054 ?auto_810053 ?auto_810052 ?auto_810051 ?auto_810050 ?auto_810049 ?auto_810048 ?auto_810047 ?auto_810046 ?auto_810045 ?auto_810044 ?auto_810043 ?auto_810042 ?auto_810041 ?auto_810040 ?auto_810039 ?auto_810038 ?auto_810037 )
      ( MAKE-18PILE ?auto_810037 ?auto_810038 ?auto_810039 ?auto_810040 ?auto_810041 ?auto_810042 ?auto_810043 ?auto_810044 ?auto_810045 ?auto_810046 ?auto_810047 ?auto_810048 ?auto_810049 ?auto_810050 ?auto_810051 ?auto_810052 ?auto_810053 ?auto_810054 ) )
  )

)

