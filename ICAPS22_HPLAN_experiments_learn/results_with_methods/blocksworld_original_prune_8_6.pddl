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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_139394 - BLOCK
      ?auto_139395 - BLOCK
      ?auto_139396 - BLOCK
      ?auto_139397 - BLOCK
      ?auto_139398 - BLOCK
      ?auto_139399 - BLOCK
      ?auto_139400 - BLOCK
      ?auto_139401 - BLOCK
    )
    :vars
    (
      ?auto_139402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139402 ?auto_139401 ) ( CLEAR ?auto_139402 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139394 ) ( ON ?auto_139395 ?auto_139394 ) ( ON ?auto_139396 ?auto_139395 ) ( ON ?auto_139397 ?auto_139396 ) ( ON ?auto_139398 ?auto_139397 ) ( ON ?auto_139399 ?auto_139398 ) ( ON ?auto_139400 ?auto_139399 ) ( ON ?auto_139401 ?auto_139400 ) ( not ( = ?auto_139394 ?auto_139395 ) ) ( not ( = ?auto_139394 ?auto_139396 ) ) ( not ( = ?auto_139394 ?auto_139397 ) ) ( not ( = ?auto_139394 ?auto_139398 ) ) ( not ( = ?auto_139394 ?auto_139399 ) ) ( not ( = ?auto_139394 ?auto_139400 ) ) ( not ( = ?auto_139394 ?auto_139401 ) ) ( not ( = ?auto_139394 ?auto_139402 ) ) ( not ( = ?auto_139395 ?auto_139396 ) ) ( not ( = ?auto_139395 ?auto_139397 ) ) ( not ( = ?auto_139395 ?auto_139398 ) ) ( not ( = ?auto_139395 ?auto_139399 ) ) ( not ( = ?auto_139395 ?auto_139400 ) ) ( not ( = ?auto_139395 ?auto_139401 ) ) ( not ( = ?auto_139395 ?auto_139402 ) ) ( not ( = ?auto_139396 ?auto_139397 ) ) ( not ( = ?auto_139396 ?auto_139398 ) ) ( not ( = ?auto_139396 ?auto_139399 ) ) ( not ( = ?auto_139396 ?auto_139400 ) ) ( not ( = ?auto_139396 ?auto_139401 ) ) ( not ( = ?auto_139396 ?auto_139402 ) ) ( not ( = ?auto_139397 ?auto_139398 ) ) ( not ( = ?auto_139397 ?auto_139399 ) ) ( not ( = ?auto_139397 ?auto_139400 ) ) ( not ( = ?auto_139397 ?auto_139401 ) ) ( not ( = ?auto_139397 ?auto_139402 ) ) ( not ( = ?auto_139398 ?auto_139399 ) ) ( not ( = ?auto_139398 ?auto_139400 ) ) ( not ( = ?auto_139398 ?auto_139401 ) ) ( not ( = ?auto_139398 ?auto_139402 ) ) ( not ( = ?auto_139399 ?auto_139400 ) ) ( not ( = ?auto_139399 ?auto_139401 ) ) ( not ( = ?auto_139399 ?auto_139402 ) ) ( not ( = ?auto_139400 ?auto_139401 ) ) ( not ( = ?auto_139400 ?auto_139402 ) ) ( not ( = ?auto_139401 ?auto_139402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139402 ?auto_139401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_139404 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139404 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_139404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_139405 - BLOCK
    )
    :vars
    (
      ?auto_139406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139405 ?auto_139406 ) ( CLEAR ?auto_139405 ) ( HAND-EMPTY ) ( not ( = ?auto_139405 ?auto_139406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139405 ?auto_139406 )
      ( MAKE-1PILE ?auto_139405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139414 - BLOCK
      ?auto_139415 - BLOCK
      ?auto_139416 - BLOCK
      ?auto_139417 - BLOCK
      ?auto_139418 - BLOCK
      ?auto_139419 - BLOCK
      ?auto_139420 - BLOCK
    )
    :vars
    (
      ?auto_139421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139421 ?auto_139420 ) ( CLEAR ?auto_139421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139414 ) ( ON ?auto_139415 ?auto_139414 ) ( ON ?auto_139416 ?auto_139415 ) ( ON ?auto_139417 ?auto_139416 ) ( ON ?auto_139418 ?auto_139417 ) ( ON ?auto_139419 ?auto_139418 ) ( ON ?auto_139420 ?auto_139419 ) ( not ( = ?auto_139414 ?auto_139415 ) ) ( not ( = ?auto_139414 ?auto_139416 ) ) ( not ( = ?auto_139414 ?auto_139417 ) ) ( not ( = ?auto_139414 ?auto_139418 ) ) ( not ( = ?auto_139414 ?auto_139419 ) ) ( not ( = ?auto_139414 ?auto_139420 ) ) ( not ( = ?auto_139414 ?auto_139421 ) ) ( not ( = ?auto_139415 ?auto_139416 ) ) ( not ( = ?auto_139415 ?auto_139417 ) ) ( not ( = ?auto_139415 ?auto_139418 ) ) ( not ( = ?auto_139415 ?auto_139419 ) ) ( not ( = ?auto_139415 ?auto_139420 ) ) ( not ( = ?auto_139415 ?auto_139421 ) ) ( not ( = ?auto_139416 ?auto_139417 ) ) ( not ( = ?auto_139416 ?auto_139418 ) ) ( not ( = ?auto_139416 ?auto_139419 ) ) ( not ( = ?auto_139416 ?auto_139420 ) ) ( not ( = ?auto_139416 ?auto_139421 ) ) ( not ( = ?auto_139417 ?auto_139418 ) ) ( not ( = ?auto_139417 ?auto_139419 ) ) ( not ( = ?auto_139417 ?auto_139420 ) ) ( not ( = ?auto_139417 ?auto_139421 ) ) ( not ( = ?auto_139418 ?auto_139419 ) ) ( not ( = ?auto_139418 ?auto_139420 ) ) ( not ( = ?auto_139418 ?auto_139421 ) ) ( not ( = ?auto_139419 ?auto_139420 ) ) ( not ( = ?auto_139419 ?auto_139421 ) ) ( not ( = ?auto_139420 ?auto_139421 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139421 ?auto_139420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139422 - BLOCK
      ?auto_139423 - BLOCK
      ?auto_139424 - BLOCK
      ?auto_139425 - BLOCK
      ?auto_139426 - BLOCK
      ?auto_139427 - BLOCK
      ?auto_139428 - BLOCK
    )
    :vars
    (
      ?auto_139429 - BLOCK
      ?auto_139430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139429 ?auto_139428 ) ( CLEAR ?auto_139429 ) ( ON-TABLE ?auto_139422 ) ( ON ?auto_139423 ?auto_139422 ) ( ON ?auto_139424 ?auto_139423 ) ( ON ?auto_139425 ?auto_139424 ) ( ON ?auto_139426 ?auto_139425 ) ( ON ?auto_139427 ?auto_139426 ) ( ON ?auto_139428 ?auto_139427 ) ( not ( = ?auto_139422 ?auto_139423 ) ) ( not ( = ?auto_139422 ?auto_139424 ) ) ( not ( = ?auto_139422 ?auto_139425 ) ) ( not ( = ?auto_139422 ?auto_139426 ) ) ( not ( = ?auto_139422 ?auto_139427 ) ) ( not ( = ?auto_139422 ?auto_139428 ) ) ( not ( = ?auto_139422 ?auto_139429 ) ) ( not ( = ?auto_139423 ?auto_139424 ) ) ( not ( = ?auto_139423 ?auto_139425 ) ) ( not ( = ?auto_139423 ?auto_139426 ) ) ( not ( = ?auto_139423 ?auto_139427 ) ) ( not ( = ?auto_139423 ?auto_139428 ) ) ( not ( = ?auto_139423 ?auto_139429 ) ) ( not ( = ?auto_139424 ?auto_139425 ) ) ( not ( = ?auto_139424 ?auto_139426 ) ) ( not ( = ?auto_139424 ?auto_139427 ) ) ( not ( = ?auto_139424 ?auto_139428 ) ) ( not ( = ?auto_139424 ?auto_139429 ) ) ( not ( = ?auto_139425 ?auto_139426 ) ) ( not ( = ?auto_139425 ?auto_139427 ) ) ( not ( = ?auto_139425 ?auto_139428 ) ) ( not ( = ?auto_139425 ?auto_139429 ) ) ( not ( = ?auto_139426 ?auto_139427 ) ) ( not ( = ?auto_139426 ?auto_139428 ) ) ( not ( = ?auto_139426 ?auto_139429 ) ) ( not ( = ?auto_139427 ?auto_139428 ) ) ( not ( = ?auto_139427 ?auto_139429 ) ) ( not ( = ?auto_139428 ?auto_139429 ) ) ( HOLDING ?auto_139430 ) ( not ( = ?auto_139422 ?auto_139430 ) ) ( not ( = ?auto_139423 ?auto_139430 ) ) ( not ( = ?auto_139424 ?auto_139430 ) ) ( not ( = ?auto_139425 ?auto_139430 ) ) ( not ( = ?auto_139426 ?auto_139430 ) ) ( not ( = ?auto_139427 ?auto_139430 ) ) ( not ( = ?auto_139428 ?auto_139430 ) ) ( not ( = ?auto_139429 ?auto_139430 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_139430 )
      ( MAKE-7PILE ?auto_139422 ?auto_139423 ?auto_139424 ?auto_139425 ?auto_139426 ?auto_139427 ?auto_139428 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_139431 - BLOCK
      ?auto_139432 - BLOCK
      ?auto_139433 - BLOCK
      ?auto_139434 - BLOCK
      ?auto_139435 - BLOCK
      ?auto_139436 - BLOCK
      ?auto_139437 - BLOCK
    )
    :vars
    (
      ?auto_139439 - BLOCK
      ?auto_139438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139439 ?auto_139437 ) ( ON-TABLE ?auto_139431 ) ( ON ?auto_139432 ?auto_139431 ) ( ON ?auto_139433 ?auto_139432 ) ( ON ?auto_139434 ?auto_139433 ) ( ON ?auto_139435 ?auto_139434 ) ( ON ?auto_139436 ?auto_139435 ) ( ON ?auto_139437 ?auto_139436 ) ( not ( = ?auto_139431 ?auto_139432 ) ) ( not ( = ?auto_139431 ?auto_139433 ) ) ( not ( = ?auto_139431 ?auto_139434 ) ) ( not ( = ?auto_139431 ?auto_139435 ) ) ( not ( = ?auto_139431 ?auto_139436 ) ) ( not ( = ?auto_139431 ?auto_139437 ) ) ( not ( = ?auto_139431 ?auto_139439 ) ) ( not ( = ?auto_139432 ?auto_139433 ) ) ( not ( = ?auto_139432 ?auto_139434 ) ) ( not ( = ?auto_139432 ?auto_139435 ) ) ( not ( = ?auto_139432 ?auto_139436 ) ) ( not ( = ?auto_139432 ?auto_139437 ) ) ( not ( = ?auto_139432 ?auto_139439 ) ) ( not ( = ?auto_139433 ?auto_139434 ) ) ( not ( = ?auto_139433 ?auto_139435 ) ) ( not ( = ?auto_139433 ?auto_139436 ) ) ( not ( = ?auto_139433 ?auto_139437 ) ) ( not ( = ?auto_139433 ?auto_139439 ) ) ( not ( = ?auto_139434 ?auto_139435 ) ) ( not ( = ?auto_139434 ?auto_139436 ) ) ( not ( = ?auto_139434 ?auto_139437 ) ) ( not ( = ?auto_139434 ?auto_139439 ) ) ( not ( = ?auto_139435 ?auto_139436 ) ) ( not ( = ?auto_139435 ?auto_139437 ) ) ( not ( = ?auto_139435 ?auto_139439 ) ) ( not ( = ?auto_139436 ?auto_139437 ) ) ( not ( = ?auto_139436 ?auto_139439 ) ) ( not ( = ?auto_139437 ?auto_139439 ) ) ( not ( = ?auto_139431 ?auto_139438 ) ) ( not ( = ?auto_139432 ?auto_139438 ) ) ( not ( = ?auto_139433 ?auto_139438 ) ) ( not ( = ?auto_139434 ?auto_139438 ) ) ( not ( = ?auto_139435 ?auto_139438 ) ) ( not ( = ?auto_139436 ?auto_139438 ) ) ( not ( = ?auto_139437 ?auto_139438 ) ) ( not ( = ?auto_139439 ?auto_139438 ) ) ( ON ?auto_139438 ?auto_139439 ) ( CLEAR ?auto_139438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139431 ?auto_139432 ?auto_139433 ?auto_139434 ?auto_139435 ?auto_139436 ?auto_139437 ?auto_139439 )
      ( MAKE-7PILE ?auto_139431 ?auto_139432 ?auto_139433 ?auto_139434 ?auto_139435 ?auto_139436 ?auto_139437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139442 - BLOCK
      ?auto_139443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139443 ) ( CLEAR ?auto_139442 ) ( ON-TABLE ?auto_139442 ) ( not ( = ?auto_139442 ?auto_139443 ) ) )
    :subtasks
    ( ( !STACK ?auto_139443 ?auto_139442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139444 - BLOCK
      ?auto_139445 - BLOCK
    )
    :vars
    (
      ?auto_139446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139444 ) ( ON-TABLE ?auto_139444 ) ( not ( = ?auto_139444 ?auto_139445 ) ) ( ON ?auto_139445 ?auto_139446 ) ( CLEAR ?auto_139445 ) ( HAND-EMPTY ) ( not ( = ?auto_139444 ?auto_139446 ) ) ( not ( = ?auto_139445 ?auto_139446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139445 ?auto_139446 )
      ( MAKE-2PILE ?auto_139444 ?auto_139445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139447 - BLOCK
      ?auto_139448 - BLOCK
    )
    :vars
    (
      ?auto_139449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139447 ?auto_139448 ) ) ( ON ?auto_139448 ?auto_139449 ) ( CLEAR ?auto_139448 ) ( not ( = ?auto_139447 ?auto_139449 ) ) ( not ( = ?auto_139448 ?auto_139449 ) ) ( HOLDING ?auto_139447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139447 )
      ( MAKE-2PILE ?auto_139447 ?auto_139448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_139450 - BLOCK
      ?auto_139451 - BLOCK
    )
    :vars
    (
      ?auto_139452 - BLOCK
      ?auto_139454 - BLOCK
      ?auto_139456 - BLOCK
      ?auto_139458 - BLOCK
      ?auto_139453 - BLOCK
      ?auto_139455 - BLOCK
      ?auto_139457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139450 ?auto_139451 ) ) ( ON ?auto_139451 ?auto_139452 ) ( not ( = ?auto_139450 ?auto_139452 ) ) ( not ( = ?auto_139451 ?auto_139452 ) ) ( ON ?auto_139450 ?auto_139451 ) ( CLEAR ?auto_139450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139454 ) ( ON ?auto_139456 ?auto_139454 ) ( ON ?auto_139458 ?auto_139456 ) ( ON ?auto_139453 ?auto_139458 ) ( ON ?auto_139455 ?auto_139453 ) ( ON ?auto_139457 ?auto_139455 ) ( ON ?auto_139452 ?auto_139457 ) ( not ( = ?auto_139454 ?auto_139456 ) ) ( not ( = ?auto_139454 ?auto_139458 ) ) ( not ( = ?auto_139454 ?auto_139453 ) ) ( not ( = ?auto_139454 ?auto_139455 ) ) ( not ( = ?auto_139454 ?auto_139457 ) ) ( not ( = ?auto_139454 ?auto_139452 ) ) ( not ( = ?auto_139454 ?auto_139451 ) ) ( not ( = ?auto_139454 ?auto_139450 ) ) ( not ( = ?auto_139456 ?auto_139458 ) ) ( not ( = ?auto_139456 ?auto_139453 ) ) ( not ( = ?auto_139456 ?auto_139455 ) ) ( not ( = ?auto_139456 ?auto_139457 ) ) ( not ( = ?auto_139456 ?auto_139452 ) ) ( not ( = ?auto_139456 ?auto_139451 ) ) ( not ( = ?auto_139456 ?auto_139450 ) ) ( not ( = ?auto_139458 ?auto_139453 ) ) ( not ( = ?auto_139458 ?auto_139455 ) ) ( not ( = ?auto_139458 ?auto_139457 ) ) ( not ( = ?auto_139458 ?auto_139452 ) ) ( not ( = ?auto_139458 ?auto_139451 ) ) ( not ( = ?auto_139458 ?auto_139450 ) ) ( not ( = ?auto_139453 ?auto_139455 ) ) ( not ( = ?auto_139453 ?auto_139457 ) ) ( not ( = ?auto_139453 ?auto_139452 ) ) ( not ( = ?auto_139453 ?auto_139451 ) ) ( not ( = ?auto_139453 ?auto_139450 ) ) ( not ( = ?auto_139455 ?auto_139457 ) ) ( not ( = ?auto_139455 ?auto_139452 ) ) ( not ( = ?auto_139455 ?auto_139451 ) ) ( not ( = ?auto_139455 ?auto_139450 ) ) ( not ( = ?auto_139457 ?auto_139452 ) ) ( not ( = ?auto_139457 ?auto_139451 ) ) ( not ( = ?auto_139457 ?auto_139450 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139454 ?auto_139456 ?auto_139458 ?auto_139453 ?auto_139455 ?auto_139457 ?auto_139452 ?auto_139451 )
      ( MAKE-2PILE ?auto_139450 ?auto_139451 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139465 - BLOCK
      ?auto_139466 - BLOCK
      ?auto_139467 - BLOCK
      ?auto_139468 - BLOCK
      ?auto_139469 - BLOCK
      ?auto_139470 - BLOCK
    )
    :vars
    (
      ?auto_139471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139471 ?auto_139470 ) ( CLEAR ?auto_139471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139465 ) ( ON ?auto_139466 ?auto_139465 ) ( ON ?auto_139467 ?auto_139466 ) ( ON ?auto_139468 ?auto_139467 ) ( ON ?auto_139469 ?auto_139468 ) ( ON ?auto_139470 ?auto_139469 ) ( not ( = ?auto_139465 ?auto_139466 ) ) ( not ( = ?auto_139465 ?auto_139467 ) ) ( not ( = ?auto_139465 ?auto_139468 ) ) ( not ( = ?auto_139465 ?auto_139469 ) ) ( not ( = ?auto_139465 ?auto_139470 ) ) ( not ( = ?auto_139465 ?auto_139471 ) ) ( not ( = ?auto_139466 ?auto_139467 ) ) ( not ( = ?auto_139466 ?auto_139468 ) ) ( not ( = ?auto_139466 ?auto_139469 ) ) ( not ( = ?auto_139466 ?auto_139470 ) ) ( not ( = ?auto_139466 ?auto_139471 ) ) ( not ( = ?auto_139467 ?auto_139468 ) ) ( not ( = ?auto_139467 ?auto_139469 ) ) ( not ( = ?auto_139467 ?auto_139470 ) ) ( not ( = ?auto_139467 ?auto_139471 ) ) ( not ( = ?auto_139468 ?auto_139469 ) ) ( not ( = ?auto_139468 ?auto_139470 ) ) ( not ( = ?auto_139468 ?auto_139471 ) ) ( not ( = ?auto_139469 ?auto_139470 ) ) ( not ( = ?auto_139469 ?auto_139471 ) ) ( not ( = ?auto_139470 ?auto_139471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139471 ?auto_139470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139472 - BLOCK
      ?auto_139473 - BLOCK
      ?auto_139474 - BLOCK
      ?auto_139475 - BLOCK
      ?auto_139476 - BLOCK
      ?auto_139477 - BLOCK
    )
    :vars
    (
      ?auto_139478 - BLOCK
      ?auto_139479 - BLOCK
      ?auto_139480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139478 ?auto_139477 ) ( CLEAR ?auto_139478 ) ( ON-TABLE ?auto_139472 ) ( ON ?auto_139473 ?auto_139472 ) ( ON ?auto_139474 ?auto_139473 ) ( ON ?auto_139475 ?auto_139474 ) ( ON ?auto_139476 ?auto_139475 ) ( ON ?auto_139477 ?auto_139476 ) ( not ( = ?auto_139472 ?auto_139473 ) ) ( not ( = ?auto_139472 ?auto_139474 ) ) ( not ( = ?auto_139472 ?auto_139475 ) ) ( not ( = ?auto_139472 ?auto_139476 ) ) ( not ( = ?auto_139472 ?auto_139477 ) ) ( not ( = ?auto_139472 ?auto_139478 ) ) ( not ( = ?auto_139473 ?auto_139474 ) ) ( not ( = ?auto_139473 ?auto_139475 ) ) ( not ( = ?auto_139473 ?auto_139476 ) ) ( not ( = ?auto_139473 ?auto_139477 ) ) ( not ( = ?auto_139473 ?auto_139478 ) ) ( not ( = ?auto_139474 ?auto_139475 ) ) ( not ( = ?auto_139474 ?auto_139476 ) ) ( not ( = ?auto_139474 ?auto_139477 ) ) ( not ( = ?auto_139474 ?auto_139478 ) ) ( not ( = ?auto_139475 ?auto_139476 ) ) ( not ( = ?auto_139475 ?auto_139477 ) ) ( not ( = ?auto_139475 ?auto_139478 ) ) ( not ( = ?auto_139476 ?auto_139477 ) ) ( not ( = ?auto_139476 ?auto_139478 ) ) ( not ( = ?auto_139477 ?auto_139478 ) ) ( HOLDING ?auto_139479 ) ( CLEAR ?auto_139480 ) ( not ( = ?auto_139472 ?auto_139479 ) ) ( not ( = ?auto_139472 ?auto_139480 ) ) ( not ( = ?auto_139473 ?auto_139479 ) ) ( not ( = ?auto_139473 ?auto_139480 ) ) ( not ( = ?auto_139474 ?auto_139479 ) ) ( not ( = ?auto_139474 ?auto_139480 ) ) ( not ( = ?auto_139475 ?auto_139479 ) ) ( not ( = ?auto_139475 ?auto_139480 ) ) ( not ( = ?auto_139476 ?auto_139479 ) ) ( not ( = ?auto_139476 ?auto_139480 ) ) ( not ( = ?auto_139477 ?auto_139479 ) ) ( not ( = ?auto_139477 ?auto_139480 ) ) ( not ( = ?auto_139478 ?auto_139479 ) ) ( not ( = ?auto_139478 ?auto_139480 ) ) ( not ( = ?auto_139479 ?auto_139480 ) ) )
    :subtasks
    ( ( !STACK ?auto_139479 ?auto_139480 )
      ( MAKE-6PILE ?auto_139472 ?auto_139473 ?auto_139474 ?auto_139475 ?auto_139476 ?auto_139477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140812 - BLOCK
      ?auto_140813 - BLOCK
      ?auto_140814 - BLOCK
      ?auto_140815 - BLOCK
      ?auto_140816 - BLOCK
      ?auto_140817 - BLOCK
    )
    :vars
    (
      ?auto_140819 - BLOCK
      ?auto_140818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140819 ?auto_140817 ) ( ON-TABLE ?auto_140812 ) ( ON ?auto_140813 ?auto_140812 ) ( ON ?auto_140814 ?auto_140813 ) ( ON ?auto_140815 ?auto_140814 ) ( ON ?auto_140816 ?auto_140815 ) ( ON ?auto_140817 ?auto_140816 ) ( not ( = ?auto_140812 ?auto_140813 ) ) ( not ( = ?auto_140812 ?auto_140814 ) ) ( not ( = ?auto_140812 ?auto_140815 ) ) ( not ( = ?auto_140812 ?auto_140816 ) ) ( not ( = ?auto_140812 ?auto_140817 ) ) ( not ( = ?auto_140812 ?auto_140819 ) ) ( not ( = ?auto_140813 ?auto_140814 ) ) ( not ( = ?auto_140813 ?auto_140815 ) ) ( not ( = ?auto_140813 ?auto_140816 ) ) ( not ( = ?auto_140813 ?auto_140817 ) ) ( not ( = ?auto_140813 ?auto_140819 ) ) ( not ( = ?auto_140814 ?auto_140815 ) ) ( not ( = ?auto_140814 ?auto_140816 ) ) ( not ( = ?auto_140814 ?auto_140817 ) ) ( not ( = ?auto_140814 ?auto_140819 ) ) ( not ( = ?auto_140815 ?auto_140816 ) ) ( not ( = ?auto_140815 ?auto_140817 ) ) ( not ( = ?auto_140815 ?auto_140819 ) ) ( not ( = ?auto_140816 ?auto_140817 ) ) ( not ( = ?auto_140816 ?auto_140819 ) ) ( not ( = ?auto_140817 ?auto_140819 ) ) ( not ( = ?auto_140812 ?auto_140818 ) ) ( not ( = ?auto_140813 ?auto_140818 ) ) ( not ( = ?auto_140814 ?auto_140818 ) ) ( not ( = ?auto_140815 ?auto_140818 ) ) ( not ( = ?auto_140816 ?auto_140818 ) ) ( not ( = ?auto_140817 ?auto_140818 ) ) ( not ( = ?auto_140819 ?auto_140818 ) ) ( ON ?auto_140818 ?auto_140819 ) ( CLEAR ?auto_140818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140812 ?auto_140813 ?auto_140814 ?auto_140815 ?auto_140816 ?auto_140817 ?auto_140819 )
      ( MAKE-6PILE ?auto_140812 ?auto_140813 ?auto_140814 ?auto_140815 ?auto_140816 ?auto_140817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139490 - BLOCK
      ?auto_139491 - BLOCK
      ?auto_139492 - BLOCK
      ?auto_139493 - BLOCK
      ?auto_139494 - BLOCK
      ?auto_139495 - BLOCK
    )
    :vars
    (
      ?auto_139497 - BLOCK
      ?auto_139498 - BLOCK
      ?auto_139496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139497 ?auto_139495 ) ( ON-TABLE ?auto_139490 ) ( ON ?auto_139491 ?auto_139490 ) ( ON ?auto_139492 ?auto_139491 ) ( ON ?auto_139493 ?auto_139492 ) ( ON ?auto_139494 ?auto_139493 ) ( ON ?auto_139495 ?auto_139494 ) ( not ( = ?auto_139490 ?auto_139491 ) ) ( not ( = ?auto_139490 ?auto_139492 ) ) ( not ( = ?auto_139490 ?auto_139493 ) ) ( not ( = ?auto_139490 ?auto_139494 ) ) ( not ( = ?auto_139490 ?auto_139495 ) ) ( not ( = ?auto_139490 ?auto_139497 ) ) ( not ( = ?auto_139491 ?auto_139492 ) ) ( not ( = ?auto_139491 ?auto_139493 ) ) ( not ( = ?auto_139491 ?auto_139494 ) ) ( not ( = ?auto_139491 ?auto_139495 ) ) ( not ( = ?auto_139491 ?auto_139497 ) ) ( not ( = ?auto_139492 ?auto_139493 ) ) ( not ( = ?auto_139492 ?auto_139494 ) ) ( not ( = ?auto_139492 ?auto_139495 ) ) ( not ( = ?auto_139492 ?auto_139497 ) ) ( not ( = ?auto_139493 ?auto_139494 ) ) ( not ( = ?auto_139493 ?auto_139495 ) ) ( not ( = ?auto_139493 ?auto_139497 ) ) ( not ( = ?auto_139494 ?auto_139495 ) ) ( not ( = ?auto_139494 ?auto_139497 ) ) ( not ( = ?auto_139495 ?auto_139497 ) ) ( not ( = ?auto_139490 ?auto_139498 ) ) ( not ( = ?auto_139490 ?auto_139496 ) ) ( not ( = ?auto_139491 ?auto_139498 ) ) ( not ( = ?auto_139491 ?auto_139496 ) ) ( not ( = ?auto_139492 ?auto_139498 ) ) ( not ( = ?auto_139492 ?auto_139496 ) ) ( not ( = ?auto_139493 ?auto_139498 ) ) ( not ( = ?auto_139493 ?auto_139496 ) ) ( not ( = ?auto_139494 ?auto_139498 ) ) ( not ( = ?auto_139494 ?auto_139496 ) ) ( not ( = ?auto_139495 ?auto_139498 ) ) ( not ( = ?auto_139495 ?auto_139496 ) ) ( not ( = ?auto_139497 ?auto_139498 ) ) ( not ( = ?auto_139497 ?auto_139496 ) ) ( not ( = ?auto_139498 ?auto_139496 ) ) ( ON ?auto_139498 ?auto_139497 ) ( CLEAR ?auto_139498 ) ( HOLDING ?auto_139496 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139496 )
      ( MAKE-6PILE ?auto_139490 ?auto_139491 ?auto_139492 ?auto_139493 ?auto_139494 ?auto_139495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139499 - BLOCK
      ?auto_139500 - BLOCK
      ?auto_139501 - BLOCK
      ?auto_139502 - BLOCK
      ?auto_139503 - BLOCK
      ?auto_139504 - BLOCK
    )
    :vars
    (
      ?auto_139506 - BLOCK
      ?auto_139507 - BLOCK
      ?auto_139505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139506 ?auto_139504 ) ( ON-TABLE ?auto_139499 ) ( ON ?auto_139500 ?auto_139499 ) ( ON ?auto_139501 ?auto_139500 ) ( ON ?auto_139502 ?auto_139501 ) ( ON ?auto_139503 ?auto_139502 ) ( ON ?auto_139504 ?auto_139503 ) ( not ( = ?auto_139499 ?auto_139500 ) ) ( not ( = ?auto_139499 ?auto_139501 ) ) ( not ( = ?auto_139499 ?auto_139502 ) ) ( not ( = ?auto_139499 ?auto_139503 ) ) ( not ( = ?auto_139499 ?auto_139504 ) ) ( not ( = ?auto_139499 ?auto_139506 ) ) ( not ( = ?auto_139500 ?auto_139501 ) ) ( not ( = ?auto_139500 ?auto_139502 ) ) ( not ( = ?auto_139500 ?auto_139503 ) ) ( not ( = ?auto_139500 ?auto_139504 ) ) ( not ( = ?auto_139500 ?auto_139506 ) ) ( not ( = ?auto_139501 ?auto_139502 ) ) ( not ( = ?auto_139501 ?auto_139503 ) ) ( not ( = ?auto_139501 ?auto_139504 ) ) ( not ( = ?auto_139501 ?auto_139506 ) ) ( not ( = ?auto_139502 ?auto_139503 ) ) ( not ( = ?auto_139502 ?auto_139504 ) ) ( not ( = ?auto_139502 ?auto_139506 ) ) ( not ( = ?auto_139503 ?auto_139504 ) ) ( not ( = ?auto_139503 ?auto_139506 ) ) ( not ( = ?auto_139504 ?auto_139506 ) ) ( not ( = ?auto_139499 ?auto_139507 ) ) ( not ( = ?auto_139499 ?auto_139505 ) ) ( not ( = ?auto_139500 ?auto_139507 ) ) ( not ( = ?auto_139500 ?auto_139505 ) ) ( not ( = ?auto_139501 ?auto_139507 ) ) ( not ( = ?auto_139501 ?auto_139505 ) ) ( not ( = ?auto_139502 ?auto_139507 ) ) ( not ( = ?auto_139502 ?auto_139505 ) ) ( not ( = ?auto_139503 ?auto_139507 ) ) ( not ( = ?auto_139503 ?auto_139505 ) ) ( not ( = ?auto_139504 ?auto_139507 ) ) ( not ( = ?auto_139504 ?auto_139505 ) ) ( not ( = ?auto_139506 ?auto_139507 ) ) ( not ( = ?auto_139506 ?auto_139505 ) ) ( not ( = ?auto_139507 ?auto_139505 ) ) ( ON ?auto_139507 ?auto_139506 ) ( ON ?auto_139505 ?auto_139507 ) ( CLEAR ?auto_139505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139499 ?auto_139500 ?auto_139501 ?auto_139502 ?auto_139503 ?auto_139504 ?auto_139506 ?auto_139507 )
      ( MAKE-6PILE ?auto_139499 ?auto_139500 ?auto_139501 ?auto_139502 ?auto_139503 ?auto_139504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139511 - BLOCK
      ?auto_139512 - BLOCK
      ?auto_139513 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139513 ) ( CLEAR ?auto_139512 ) ( ON-TABLE ?auto_139511 ) ( ON ?auto_139512 ?auto_139511 ) ( not ( = ?auto_139511 ?auto_139512 ) ) ( not ( = ?auto_139511 ?auto_139513 ) ) ( not ( = ?auto_139512 ?auto_139513 ) ) )
    :subtasks
    ( ( !STACK ?auto_139513 ?auto_139512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139514 - BLOCK
      ?auto_139515 - BLOCK
      ?auto_139516 - BLOCK
    )
    :vars
    (
      ?auto_139517 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139515 ) ( ON-TABLE ?auto_139514 ) ( ON ?auto_139515 ?auto_139514 ) ( not ( = ?auto_139514 ?auto_139515 ) ) ( not ( = ?auto_139514 ?auto_139516 ) ) ( not ( = ?auto_139515 ?auto_139516 ) ) ( ON ?auto_139516 ?auto_139517 ) ( CLEAR ?auto_139516 ) ( HAND-EMPTY ) ( not ( = ?auto_139514 ?auto_139517 ) ) ( not ( = ?auto_139515 ?auto_139517 ) ) ( not ( = ?auto_139516 ?auto_139517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139516 ?auto_139517 )
      ( MAKE-3PILE ?auto_139514 ?auto_139515 ?auto_139516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139518 - BLOCK
      ?auto_139519 - BLOCK
      ?auto_139520 - BLOCK
    )
    :vars
    (
      ?auto_139521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139518 ) ( not ( = ?auto_139518 ?auto_139519 ) ) ( not ( = ?auto_139518 ?auto_139520 ) ) ( not ( = ?auto_139519 ?auto_139520 ) ) ( ON ?auto_139520 ?auto_139521 ) ( CLEAR ?auto_139520 ) ( not ( = ?auto_139518 ?auto_139521 ) ) ( not ( = ?auto_139519 ?auto_139521 ) ) ( not ( = ?auto_139520 ?auto_139521 ) ) ( HOLDING ?auto_139519 ) ( CLEAR ?auto_139518 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139518 ?auto_139519 )
      ( MAKE-3PILE ?auto_139518 ?auto_139519 ?auto_139520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139522 - BLOCK
      ?auto_139523 - BLOCK
      ?auto_139524 - BLOCK
    )
    :vars
    (
      ?auto_139525 - BLOCK
      ?auto_139526 - BLOCK
      ?auto_139528 - BLOCK
      ?auto_139530 - BLOCK
      ?auto_139529 - BLOCK
      ?auto_139527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139522 ) ( not ( = ?auto_139522 ?auto_139523 ) ) ( not ( = ?auto_139522 ?auto_139524 ) ) ( not ( = ?auto_139523 ?auto_139524 ) ) ( ON ?auto_139524 ?auto_139525 ) ( not ( = ?auto_139522 ?auto_139525 ) ) ( not ( = ?auto_139523 ?auto_139525 ) ) ( not ( = ?auto_139524 ?auto_139525 ) ) ( CLEAR ?auto_139522 ) ( ON ?auto_139523 ?auto_139524 ) ( CLEAR ?auto_139523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139526 ) ( ON ?auto_139528 ?auto_139526 ) ( ON ?auto_139530 ?auto_139528 ) ( ON ?auto_139529 ?auto_139530 ) ( ON ?auto_139527 ?auto_139529 ) ( ON ?auto_139525 ?auto_139527 ) ( not ( = ?auto_139526 ?auto_139528 ) ) ( not ( = ?auto_139526 ?auto_139530 ) ) ( not ( = ?auto_139526 ?auto_139529 ) ) ( not ( = ?auto_139526 ?auto_139527 ) ) ( not ( = ?auto_139526 ?auto_139525 ) ) ( not ( = ?auto_139526 ?auto_139524 ) ) ( not ( = ?auto_139526 ?auto_139523 ) ) ( not ( = ?auto_139528 ?auto_139530 ) ) ( not ( = ?auto_139528 ?auto_139529 ) ) ( not ( = ?auto_139528 ?auto_139527 ) ) ( not ( = ?auto_139528 ?auto_139525 ) ) ( not ( = ?auto_139528 ?auto_139524 ) ) ( not ( = ?auto_139528 ?auto_139523 ) ) ( not ( = ?auto_139530 ?auto_139529 ) ) ( not ( = ?auto_139530 ?auto_139527 ) ) ( not ( = ?auto_139530 ?auto_139525 ) ) ( not ( = ?auto_139530 ?auto_139524 ) ) ( not ( = ?auto_139530 ?auto_139523 ) ) ( not ( = ?auto_139529 ?auto_139527 ) ) ( not ( = ?auto_139529 ?auto_139525 ) ) ( not ( = ?auto_139529 ?auto_139524 ) ) ( not ( = ?auto_139529 ?auto_139523 ) ) ( not ( = ?auto_139527 ?auto_139525 ) ) ( not ( = ?auto_139527 ?auto_139524 ) ) ( not ( = ?auto_139527 ?auto_139523 ) ) ( not ( = ?auto_139522 ?auto_139526 ) ) ( not ( = ?auto_139522 ?auto_139528 ) ) ( not ( = ?auto_139522 ?auto_139530 ) ) ( not ( = ?auto_139522 ?auto_139529 ) ) ( not ( = ?auto_139522 ?auto_139527 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139526 ?auto_139528 ?auto_139530 ?auto_139529 ?auto_139527 ?auto_139525 ?auto_139524 )
      ( MAKE-3PILE ?auto_139522 ?auto_139523 ?auto_139524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139531 - BLOCK
      ?auto_139532 - BLOCK
      ?auto_139533 - BLOCK
    )
    :vars
    (
      ?auto_139535 - BLOCK
      ?auto_139538 - BLOCK
      ?auto_139536 - BLOCK
      ?auto_139534 - BLOCK
      ?auto_139539 - BLOCK
      ?auto_139537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139531 ?auto_139532 ) ) ( not ( = ?auto_139531 ?auto_139533 ) ) ( not ( = ?auto_139532 ?auto_139533 ) ) ( ON ?auto_139533 ?auto_139535 ) ( not ( = ?auto_139531 ?auto_139535 ) ) ( not ( = ?auto_139532 ?auto_139535 ) ) ( not ( = ?auto_139533 ?auto_139535 ) ) ( ON ?auto_139532 ?auto_139533 ) ( CLEAR ?auto_139532 ) ( ON-TABLE ?auto_139538 ) ( ON ?auto_139536 ?auto_139538 ) ( ON ?auto_139534 ?auto_139536 ) ( ON ?auto_139539 ?auto_139534 ) ( ON ?auto_139537 ?auto_139539 ) ( ON ?auto_139535 ?auto_139537 ) ( not ( = ?auto_139538 ?auto_139536 ) ) ( not ( = ?auto_139538 ?auto_139534 ) ) ( not ( = ?auto_139538 ?auto_139539 ) ) ( not ( = ?auto_139538 ?auto_139537 ) ) ( not ( = ?auto_139538 ?auto_139535 ) ) ( not ( = ?auto_139538 ?auto_139533 ) ) ( not ( = ?auto_139538 ?auto_139532 ) ) ( not ( = ?auto_139536 ?auto_139534 ) ) ( not ( = ?auto_139536 ?auto_139539 ) ) ( not ( = ?auto_139536 ?auto_139537 ) ) ( not ( = ?auto_139536 ?auto_139535 ) ) ( not ( = ?auto_139536 ?auto_139533 ) ) ( not ( = ?auto_139536 ?auto_139532 ) ) ( not ( = ?auto_139534 ?auto_139539 ) ) ( not ( = ?auto_139534 ?auto_139537 ) ) ( not ( = ?auto_139534 ?auto_139535 ) ) ( not ( = ?auto_139534 ?auto_139533 ) ) ( not ( = ?auto_139534 ?auto_139532 ) ) ( not ( = ?auto_139539 ?auto_139537 ) ) ( not ( = ?auto_139539 ?auto_139535 ) ) ( not ( = ?auto_139539 ?auto_139533 ) ) ( not ( = ?auto_139539 ?auto_139532 ) ) ( not ( = ?auto_139537 ?auto_139535 ) ) ( not ( = ?auto_139537 ?auto_139533 ) ) ( not ( = ?auto_139537 ?auto_139532 ) ) ( not ( = ?auto_139531 ?auto_139538 ) ) ( not ( = ?auto_139531 ?auto_139536 ) ) ( not ( = ?auto_139531 ?auto_139534 ) ) ( not ( = ?auto_139531 ?auto_139539 ) ) ( not ( = ?auto_139531 ?auto_139537 ) ) ( HOLDING ?auto_139531 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139531 )
      ( MAKE-3PILE ?auto_139531 ?auto_139532 ?auto_139533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139540 - BLOCK
      ?auto_139541 - BLOCK
      ?auto_139542 - BLOCK
    )
    :vars
    (
      ?auto_139544 - BLOCK
      ?auto_139543 - BLOCK
      ?auto_139547 - BLOCK
      ?auto_139548 - BLOCK
      ?auto_139546 - BLOCK
      ?auto_139545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139540 ?auto_139541 ) ) ( not ( = ?auto_139540 ?auto_139542 ) ) ( not ( = ?auto_139541 ?auto_139542 ) ) ( ON ?auto_139542 ?auto_139544 ) ( not ( = ?auto_139540 ?auto_139544 ) ) ( not ( = ?auto_139541 ?auto_139544 ) ) ( not ( = ?auto_139542 ?auto_139544 ) ) ( ON ?auto_139541 ?auto_139542 ) ( ON-TABLE ?auto_139543 ) ( ON ?auto_139547 ?auto_139543 ) ( ON ?auto_139548 ?auto_139547 ) ( ON ?auto_139546 ?auto_139548 ) ( ON ?auto_139545 ?auto_139546 ) ( ON ?auto_139544 ?auto_139545 ) ( not ( = ?auto_139543 ?auto_139547 ) ) ( not ( = ?auto_139543 ?auto_139548 ) ) ( not ( = ?auto_139543 ?auto_139546 ) ) ( not ( = ?auto_139543 ?auto_139545 ) ) ( not ( = ?auto_139543 ?auto_139544 ) ) ( not ( = ?auto_139543 ?auto_139542 ) ) ( not ( = ?auto_139543 ?auto_139541 ) ) ( not ( = ?auto_139547 ?auto_139548 ) ) ( not ( = ?auto_139547 ?auto_139546 ) ) ( not ( = ?auto_139547 ?auto_139545 ) ) ( not ( = ?auto_139547 ?auto_139544 ) ) ( not ( = ?auto_139547 ?auto_139542 ) ) ( not ( = ?auto_139547 ?auto_139541 ) ) ( not ( = ?auto_139548 ?auto_139546 ) ) ( not ( = ?auto_139548 ?auto_139545 ) ) ( not ( = ?auto_139548 ?auto_139544 ) ) ( not ( = ?auto_139548 ?auto_139542 ) ) ( not ( = ?auto_139548 ?auto_139541 ) ) ( not ( = ?auto_139546 ?auto_139545 ) ) ( not ( = ?auto_139546 ?auto_139544 ) ) ( not ( = ?auto_139546 ?auto_139542 ) ) ( not ( = ?auto_139546 ?auto_139541 ) ) ( not ( = ?auto_139545 ?auto_139544 ) ) ( not ( = ?auto_139545 ?auto_139542 ) ) ( not ( = ?auto_139545 ?auto_139541 ) ) ( not ( = ?auto_139540 ?auto_139543 ) ) ( not ( = ?auto_139540 ?auto_139547 ) ) ( not ( = ?auto_139540 ?auto_139548 ) ) ( not ( = ?auto_139540 ?auto_139546 ) ) ( not ( = ?auto_139540 ?auto_139545 ) ) ( ON ?auto_139540 ?auto_139541 ) ( CLEAR ?auto_139540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139543 ?auto_139547 ?auto_139548 ?auto_139546 ?auto_139545 ?auto_139544 ?auto_139542 ?auto_139541 )
      ( MAKE-3PILE ?auto_139540 ?auto_139541 ?auto_139542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139554 - BLOCK
      ?auto_139555 - BLOCK
      ?auto_139556 - BLOCK
      ?auto_139557 - BLOCK
      ?auto_139558 - BLOCK
    )
    :vars
    (
      ?auto_139559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139559 ?auto_139558 ) ( CLEAR ?auto_139559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139554 ) ( ON ?auto_139555 ?auto_139554 ) ( ON ?auto_139556 ?auto_139555 ) ( ON ?auto_139557 ?auto_139556 ) ( ON ?auto_139558 ?auto_139557 ) ( not ( = ?auto_139554 ?auto_139555 ) ) ( not ( = ?auto_139554 ?auto_139556 ) ) ( not ( = ?auto_139554 ?auto_139557 ) ) ( not ( = ?auto_139554 ?auto_139558 ) ) ( not ( = ?auto_139554 ?auto_139559 ) ) ( not ( = ?auto_139555 ?auto_139556 ) ) ( not ( = ?auto_139555 ?auto_139557 ) ) ( not ( = ?auto_139555 ?auto_139558 ) ) ( not ( = ?auto_139555 ?auto_139559 ) ) ( not ( = ?auto_139556 ?auto_139557 ) ) ( not ( = ?auto_139556 ?auto_139558 ) ) ( not ( = ?auto_139556 ?auto_139559 ) ) ( not ( = ?auto_139557 ?auto_139558 ) ) ( not ( = ?auto_139557 ?auto_139559 ) ) ( not ( = ?auto_139558 ?auto_139559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139559 ?auto_139558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139560 - BLOCK
      ?auto_139561 - BLOCK
      ?auto_139562 - BLOCK
      ?auto_139563 - BLOCK
      ?auto_139564 - BLOCK
    )
    :vars
    (
      ?auto_139565 - BLOCK
      ?auto_139566 - BLOCK
      ?auto_139567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139565 ?auto_139564 ) ( CLEAR ?auto_139565 ) ( ON-TABLE ?auto_139560 ) ( ON ?auto_139561 ?auto_139560 ) ( ON ?auto_139562 ?auto_139561 ) ( ON ?auto_139563 ?auto_139562 ) ( ON ?auto_139564 ?auto_139563 ) ( not ( = ?auto_139560 ?auto_139561 ) ) ( not ( = ?auto_139560 ?auto_139562 ) ) ( not ( = ?auto_139560 ?auto_139563 ) ) ( not ( = ?auto_139560 ?auto_139564 ) ) ( not ( = ?auto_139560 ?auto_139565 ) ) ( not ( = ?auto_139561 ?auto_139562 ) ) ( not ( = ?auto_139561 ?auto_139563 ) ) ( not ( = ?auto_139561 ?auto_139564 ) ) ( not ( = ?auto_139561 ?auto_139565 ) ) ( not ( = ?auto_139562 ?auto_139563 ) ) ( not ( = ?auto_139562 ?auto_139564 ) ) ( not ( = ?auto_139562 ?auto_139565 ) ) ( not ( = ?auto_139563 ?auto_139564 ) ) ( not ( = ?auto_139563 ?auto_139565 ) ) ( not ( = ?auto_139564 ?auto_139565 ) ) ( HOLDING ?auto_139566 ) ( CLEAR ?auto_139567 ) ( not ( = ?auto_139560 ?auto_139566 ) ) ( not ( = ?auto_139560 ?auto_139567 ) ) ( not ( = ?auto_139561 ?auto_139566 ) ) ( not ( = ?auto_139561 ?auto_139567 ) ) ( not ( = ?auto_139562 ?auto_139566 ) ) ( not ( = ?auto_139562 ?auto_139567 ) ) ( not ( = ?auto_139563 ?auto_139566 ) ) ( not ( = ?auto_139563 ?auto_139567 ) ) ( not ( = ?auto_139564 ?auto_139566 ) ) ( not ( = ?auto_139564 ?auto_139567 ) ) ( not ( = ?auto_139565 ?auto_139566 ) ) ( not ( = ?auto_139565 ?auto_139567 ) ) ( not ( = ?auto_139566 ?auto_139567 ) ) )
    :subtasks
    ( ( !STACK ?auto_139566 ?auto_139567 )
      ( MAKE-5PILE ?auto_139560 ?auto_139561 ?auto_139562 ?auto_139563 ?auto_139564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139568 - BLOCK
      ?auto_139569 - BLOCK
      ?auto_139570 - BLOCK
      ?auto_139571 - BLOCK
      ?auto_139572 - BLOCK
    )
    :vars
    (
      ?auto_139573 - BLOCK
      ?auto_139574 - BLOCK
      ?auto_139575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139573 ?auto_139572 ) ( ON-TABLE ?auto_139568 ) ( ON ?auto_139569 ?auto_139568 ) ( ON ?auto_139570 ?auto_139569 ) ( ON ?auto_139571 ?auto_139570 ) ( ON ?auto_139572 ?auto_139571 ) ( not ( = ?auto_139568 ?auto_139569 ) ) ( not ( = ?auto_139568 ?auto_139570 ) ) ( not ( = ?auto_139568 ?auto_139571 ) ) ( not ( = ?auto_139568 ?auto_139572 ) ) ( not ( = ?auto_139568 ?auto_139573 ) ) ( not ( = ?auto_139569 ?auto_139570 ) ) ( not ( = ?auto_139569 ?auto_139571 ) ) ( not ( = ?auto_139569 ?auto_139572 ) ) ( not ( = ?auto_139569 ?auto_139573 ) ) ( not ( = ?auto_139570 ?auto_139571 ) ) ( not ( = ?auto_139570 ?auto_139572 ) ) ( not ( = ?auto_139570 ?auto_139573 ) ) ( not ( = ?auto_139571 ?auto_139572 ) ) ( not ( = ?auto_139571 ?auto_139573 ) ) ( not ( = ?auto_139572 ?auto_139573 ) ) ( CLEAR ?auto_139574 ) ( not ( = ?auto_139568 ?auto_139575 ) ) ( not ( = ?auto_139568 ?auto_139574 ) ) ( not ( = ?auto_139569 ?auto_139575 ) ) ( not ( = ?auto_139569 ?auto_139574 ) ) ( not ( = ?auto_139570 ?auto_139575 ) ) ( not ( = ?auto_139570 ?auto_139574 ) ) ( not ( = ?auto_139571 ?auto_139575 ) ) ( not ( = ?auto_139571 ?auto_139574 ) ) ( not ( = ?auto_139572 ?auto_139575 ) ) ( not ( = ?auto_139572 ?auto_139574 ) ) ( not ( = ?auto_139573 ?auto_139575 ) ) ( not ( = ?auto_139573 ?auto_139574 ) ) ( not ( = ?auto_139575 ?auto_139574 ) ) ( ON ?auto_139575 ?auto_139573 ) ( CLEAR ?auto_139575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139568 ?auto_139569 ?auto_139570 ?auto_139571 ?auto_139572 ?auto_139573 )
      ( MAKE-5PILE ?auto_139568 ?auto_139569 ?auto_139570 ?auto_139571 ?auto_139572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139576 - BLOCK
      ?auto_139577 - BLOCK
      ?auto_139578 - BLOCK
      ?auto_139579 - BLOCK
      ?auto_139580 - BLOCK
    )
    :vars
    (
      ?auto_139583 - BLOCK
      ?auto_139582 - BLOCK
      ?auto_139581 - BLOCK
      ?auto_139584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139583 ?auto_139580 ) ( ON-TABLE ?auto_139576 ) ( ON ?auto_139577 ?auto_139576 ) ( ON ?auto_139578 ?auto_139577 ) ( ON ?auto_139579 ?auto_139578 ) ( ON ?auto_139580 ?auto_139579 ) ( not ( = ?auto_139576 ?auto_139577 ) ) ( not ( = ?auto_139576 ?auto_139578 ) ) ( not ( = ?auto_139576 ?auto_139579 ) ) ( not ( = ?auto_139576 ?auto_139580 ) ) ( not ( = ?auto_139576 ?auto_139583 ) ) ( not ( = ?auto_139577 ?auto_139578 ) ) ( not ( = ?auto_139577 ?auto_139579 ) ) ( not ( = ?auto_139577 ?auto_139580 ) ) ( not ( = ?auto_139577 ?auto_139583 ) ) ( not ( = ?auto_139578 ?auto_139579 ) ) ( not ( = ?auto_139578 ?auto_139580 ) ) ( not ( = ?auto_139578 ?auto_139583 ) ) ( not ( = ?auto_139579 ?auto_139580 ) ) ( not ( = ?auto_139579 ?auto_139583 ) ) ( not ( = ?auto_139580 ?auto_139583 ) ) ( not ( = ?auto_139576 ?auto_139582 ) ) ( not ( = ?auto_139576 ?auto_139581 ) ) ( not ( = ?auto_139577 ?auto_139582 ) ) ( not ( = ?auto_139577 ?auto_139581 ) ) ( not ( = ?auto_139578 ?auto_139582 ) ) ( not ( = ?auto_139578 ?auto_139581 ) ) ( not ( = ?auto_139579 ?auto_139582 ) ) ( not ( = ?auto_139579 ?auto_139581 ) ) ( not ( = ?auto_139580 ?auto_139582 ) ) ( not ( = ?auto_139580 ?auto_139581 ) ) ( not ( = ?auto_139583 ?auto_139582 ) ) ( not ( = ?auto_139583 ?auto_139581 ) ) ( not ( = ?auto_139582 ?auto_139581 ) ) ( ON ?auto_139582 ?auto_139583 ) ( CLEAR ?auto_139582 ) ( HOLDING ?auto_139581 ) ( CLEAR ?auto_139584 ) ( ON-TABLE ?auto_139584 ) ( not ( = ?auto_139584 ?auto_139581 ) ) ( not ( = ?auto_139576 ?auto_139584 ) ) ( not ( = ?auto_139577 ?auto_139584 ) ) ( not ( = ?auto_139578 ?auto_139584 ) ) ( not ( = ?auto_139579 ?auto_139584 ) ) ( not ( = ?auto_139580 ?auto_139584 ) ) ( not ( = ?auto_139583 ?auto_139584 ) ) ( not ( = ?auto_139582 ?auto_139584 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139584 ?auto_139581 )
      ( MAKE-5PILE ?auto_139576 ?auto_139577 ?auto_139578 ?auto_139579 ?auto_139580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141104 - BLOCK
      ?auto_141105 - BLOCK
      ?auto_141106 - BLOCK
      ?auto_141107 - BLOCK
      ?auto_141108 - BLOCK
    )
    :vars
    (
      ?auto_141111 - BLOCK
      ?auto_141109 - BLOCK
      ?auto_141110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141111 ?auto_141108 ) ( ON-TABLE ?auto_141104 ) ( ON ?auto_141105 ?auto_141104 ) ( ON ?auto_141106 ?auto_141105 ) ( ON ?auto_141107 ?auto_141106 ) ( ON ?auto_141108 ?auto_141107 ) ( not ( = ?auto_141104 ?auto_141105 ) ) ( not ( = ?auto_141104 ?auto_141106 ) ) ( not ( = ?auto_141104 ?auto_141107 ) ) ( not ( = ?auto_141104 ?auto_141108 ) ) ( not ( = ?auto_141104 ?auto_141111 ) ) ( not ( = ?auto_141105 ?auto_141106 ) ) ( not ( = ?auto_141105 ?auto_141107 ) ) ( not ( = ?auto_141105 ?auto_141108 ) ) ( not ( = ?auto_141105 ?auto_141111 ) ) ( not ( = ?auto_141106 ?auto_141107 ) ) ( not ( = ?auto_141106 ?auto_141108 ) ) ( not ( = ?auto_141106 ?auto_141111 ) ) ( not ( = ?auto_141107 ?auto_141108 ) ) ( not ( = ?auto_141107 ?auto_141111 ) ) ( not ( = ?auto_141108 ?auto_141111 ) ) ( not ( = ?auto_141104 ?auto_141109 ) ) ( not ( = ?auto_141104 ?auto_141110 ) ) ( not ( = ?auto_141105 ?auto_141109 ) ) ( not ( = ?auto_141105 ?auto_141110 ) ) ( not ( = ?auto_141106 ?auto_141109 ) ) ( not ( = ?auto_141106 ?auto_141110 ) ) ( not ( = ?auto_141107 ?auto_141109 ) ) ( not ( = ?auto_141107 ?auto_141110 ) ) ( not ( = ?auto_141108 ?auto_141109 ) ) ( not ( = ?auto_141108 ?auto_141110 ) ) ( not ( = ?auto_141111 ?auto_141109 ) ) ( not ( = ?auto_141111 ?auto_141110 ) ) ( not ( = ?auto_141109 ?auto_141110 ) ) ( ON ?auto_141109 ?auto_141111 ) ( ON ?auto_141110 ?auto_141109 ) ( CLEAR ?auto_141110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141104 ?auto_141105 ?auto_141106 ?auto_141107 ?auto_141108 ?auto_141111 ?auto_141109 )
      ( MAKE-5PILE ?auto_141104 ?auto_141105 ?auto_141106 ?auto_141107 ?auto_141108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139594 - BLOCK
      ?auto_139595 - BLOCK
      ?auto_139596 - BLOCK
      ?auto_139597 - BLOCK
      ?auto_139598 - BLOCK
    )
    :vars
    (
      ?auto_139600 - BLOCK
      ?auto_139601 - BLOCK
      ?auto_139602 - BLOCK
      ?auto_139599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139600 ?auto_139598 ) ( ON-TABLE ?auto_139594 ) ( ON ?auto_139595 ?auto_139594 ) ( ON ?auto_139596 ?auto_139595 ) ( ON ?auto_139597 ?auto_139596 ) ( ON ?auto_139598 ?auto_139597 ) ( not ( = ?auto_139594 ?auto_139595 ) ) ( not ( = ?auto_139594 ?auto_139596 ) ) ( not ( = ?auto_139594 ?auto_139597 ) ) ( not ( = ?auto_139594 ?auto_139598 ) ) ( not ( = ?auto_139594 ?auto_139600 ) ) ( not ( = ?auto_139595 ?auto_139596 ) ) ( not ( = ?auto_139595 ?auto_139597 ) ) ( not ( = ?auto_139595 ?auto_139598 ) ) ( not ( = ?auto_139595 ?auto_139600 ) ) ( not ( = ?auto_139596 ?auto_139597 ) ) ( not ( = ?auto_139596 ?auto_139598 ) ) ( not ( = ?auto_139596 ?auto_139600 ) ) ( not ( = ?auto_139597 ?auto_139598 ) ) ( not ( = ?auto_139597 ?auto_139600 ) ) ( not ( = ?auto_139598 ?auto_139600 ) ) ( not ( = ?auto_139594 ?auto_139601 ) ) ( not ( = ?auto_139594 ?auto_139602 ) ) ( not ( = ?auto_139595 ?auto_139601 ) ) ( not ( = ?auto_139595 ?auto_139602 ) ) ( not ( = ?auto_139596 ?auto_139601 ) ) ( not ( = ?auto_139596 ?auto_139602 ) ) ( not ( = ?auto_139597 ?auto_139601 ) ) ( not ( = ?auto_139597 ?auto_139602 ) ) ( not ( = ?auto_139598 ?auto_139601 ) ) ( not ( = ?auto_139598 ?auto_139602 ) ) ( not ( = ?auto_139600 ?auto_139601 ) ) ( not ( = ?auto_139600 ?auto_139602 ) ) ( not ( = ?auto_139601 ?auto_139602 ) ) ( ON ?auto_139601 ?auto_139600 ) ( not ( = ?auto_139599 ?auto_139602 ) ) ( not ( = ?auto_139594 ?auto_139599 ) ) ( not ( = ?auto_139595 ?auto_139599 ) ) ( not ( = ?auto_139596 ?auto_139599 ) ) ( not ( = ?auto_139597 ?auto_139599 ) ) ( not ( = ?auto_139598 ?auto_139599 ) ) ( not ( = ?auto_139600 ?auto_139599 ) ) ( not ( = ?auto_139601 ?auto_139599 ) ) ( ON ?auto_139602 ?auto_139601 ) ( CLEAR ?auto_139602 ) ( HOLDING ?auto_139599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139599 )
      ( MAKE-5PILE ?auto_139594 ?auto_139595 ?auto_139596 ?auto_139597 ?auto_139598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139603 - BLOCK
      ?auto_139604 - BLOCK
      ?auto_139605 - BLOCK
      ?auto_139606 - BLOCK
      ?auto_139607 - BLOCK
    )
    :vars
    (
      ?auto_139611 - BLOCK
      ?auto_139608 - BLOCK
      ?auto_139610 - BLOCK
      ?auto_139609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139611 ?auto_139607 ) ( ON-TABLE ?auto_139603 ) ( ON ?auto_139604 ?auto_139603 ) ( ON ?auto_139605 ?auto_139604 ) ( ON ?auto_139606 ?auto_139605 ) ( ON ?auto_139607 ?auto_139606 ) ( not ( = ?auto_139603 ?auto_139604 ) ) ( not ( = ?auto_139603 ?auto_139605 ) ) ( not ( = ?auto_139603 ?auto_139606 ) ) ( not ( = ?auto_139603 ?auto_139607 ) ) ( not ( = ?auto_139603 ?auto_139611 ) ) ( not ( = ?auto_139604 ?auto_139605 ) ) ( not ( = ?auto_139604 ?auto_139606 ) ) ( not ( = ?auto_139604 ?auto_139607 ) ) ( not ( = ?auto_139604 ?auto_139611 ) ) ( not ( = ?auto_139605 ?auto_139606 ) ) ( not ( = ?auto_139605 ?auto_139607 ) ) ( not ( = ?auto_139605 ?auto_139611 ) ) ( not ( = ?auto_139606 ?auto_139607 ) ) ( not ( = ?auto_139606 ?auto_139611 ) ) ( not ( = ?auto_139607 ?auto_139611 ) ) ( not ( = ?auto_139603 ?auto_139608 ) ) ( not ( = ?auto_139603 ?auto_139610 ) ) ( not ( = ?auto_139604 ?auto_139608 ) ) ( not ( = ?auto_139604 ?auto_139610 ) ) ( not ( = ?auto_139605 ?auto_139608 ) ) ( not ( = ?auto_139605 ?auto_139610 ) ) ( not ( = ?auto_139606 ?auto_139608 ) ) ( not ( = ?auto_139606 ?auto_139610 ) ) ( not ( = ?auto_139607 ?auto_139608 ) ) ( not ( = ?auto_139607 ?auto_139610 ) ) ( not ( = ?auto_139611 ?auto_139608 ) ) ( not ( = ?auto_139611 ?auto_139610 ) ) ( not ( = ?auto_139608 ?auto_139610 ) ) ( ON ?auto_139608 ?auto_139611 ) ( not ( = ?auto_139609 ?auto_139610 ) ) ( not ( = ?auto_139603 ?auto_139609 ) ) ( not ( = ?auto_139604 ?auto_139609 ) ) ( not ( = ?auto_139605 ?auto_139609 ) ) ( not ( = ?auto_139606 ?auto_139609 ) ) ( not ( = ?auto_139607 ?auto_139609 ) ) ( not ( = ?auto_139611 ?auto_139609 ) ) ( not ( = ?auto_139608 ?auto_139609 ) ) ( ON ?auto_139610 ?auto_139608 ) ( ON ?auto_139609 ?auto_139610 ) ( CLEAR ?auto_139609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139603 ?auto_139604 ?auto_139605 ?auto_139606 ?auto_139607 ?auto_139611 ?auto_139608 ?auto_139610 )
      ( MAKE-5PILE ?auto_139603 ?auto_139604 ?auto_139605 ?auto_139606 ?auto_139607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139616 - BLOCK
      ?auto_139617 - BLOCK
      ?auto_139618 - BLOCK
      ?auto_139619 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139619 ) ( CLEAR ?auto_139618 ) ( ON-TABLE ?auto_139616 ) ( ON ?auto_139617 ?auto_139616 ) ( ON ?auto_139618 ?auto_139617 ) ( not ( = ?auto_139616 ?auto_139617 ) ) ( not ( = ?auto_139616 ?auto_139618 ) ) ( not ( = ?auto_139616 ?auto_139619 ) ) ( not ( = ?auto_139617 ?auto_139618 ) ) ( not ( = ?auto_139617 ?auto_139619 ) ) ( not ( = ?auto_139618 ?auto_139619 ) ) )
    :subtasks
    ( ( !STACK ?auto_139619 ?auto_139618 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139620 - BLOCK
      ?auto_139621 - BLOCK
      ?auto_139622 - BLOCK
      ?auto_139623 - BLOCK
    )
    :vars
    (
      ?auto_139624 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139622 ) ( ON-TABLE ?auto_139620 ) ( ON ?auto_139621 ?auto_139620 ) ( ON ?auto_139622 ?auto_139621 ) ( not ( = ?auto_139620 ?auto_139621 ) ) ( not ( = ?auto_139620 ?auto_139622 ) ) ( not ( = ?auto_139620 ?auto_139623 ) ) ( not ( = ?auto_139621 ?auto_139622 ) ) ( not ( = ?auto_139621 ?auto_139623 ) ) ( not ( = ?auto_139622 ?auto_139623 ) ) ( ON ?auto_139623 ?auto_139624 ) ( CLEAR ?auto_139623 ) ( HAND-EMPTY ) ( not ( = ?auto_139620 ?auto_139624 ) ) ( not ( = ?auto_139621 ?auto_139624 ) ) ( not ( = ?auto_139622 ?auto_139624 ) ) ( not ( = ?auto_139623 ?auto_139624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139623 ?auto_139624 )
      ( MAKE-4PILE ?auto_139620 ?auto_139621 ?auto_139622 ?auto_139623 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139625 - BLOCK
      ?auto_139626 - BLOCK
      ?auto_139627 - BLOCK
      ?auto_139628 - BLOCK
    )
    :vars
    (
      ?auto_139629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139625 ) ( ON ?auto_139626 ?auto_139625 ) ( not ( = ?auto_139625 ?auto_139626 ) ) ( not ( = ?auto_139625 ?auto_139627 ) ) ( not ( = ?auto_139625 ?auto_139628 ) ) ( not ( = ?auto_139626 ?auto_139627 ) ) ( not ( = ?auto_139626 ?auto_139628 ) ) ( not ( = ?auto_139627 ?auto_139628 ) ) ( ON ?auto_139628 ?auto_139629 ) ( CLEAR ?auto_139628 ) ( not ( = ?auto_139625 ?auto_139629 ) ) ( not ( = ?auto_139626 ?auto_139629 ) ) ( not ( = ?auto_139627 ?auto_139629 ) ) ( not ( = ?auto_139628 ?auto_139629 ) ) ( HOLDING ?auto_139627 ) ( CLEAR ?auto_139626 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139625 ?auto_139626 ?auto_139627 )
      ( MAKE-4PILE ?auto_139625 ?auto_139626 ?auto_139627 ?auto_139628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139630 - BLOCK
      ?auto_139631 - BLOCK
      ?auto_139632 - BLOCK
      ?auto_139633 - BLOCK
    )
    :vars
    (
      ?auto_139634 - BLOCK
      ?auto_139635 - BLOCK
      ?auto_139637 - BLOCK
      ?auto_139636 - BLOCK
      ?auto_139638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139630 ) ( ON ?auto_139631 ?auto_139630 ) ( not ( = ?auto_139630 ?auto_139631 ) ) ( not ( = ?auto_139630 ?auto_139632 ) ) ( not ( = ?auto_139630 ?auto_139633 ) ) ( not ( = ?auto_139631 ?auto_139632 ) ) ( not ( = ?auto_139631 ?auto_139633 ) ) ( not ( = ?auto_139632 ?auto_139633 ) ) ( ON ?auto_139633 ?auto_139634 ) ( not ( = ?auto_139630 ?auto_139634 ) ) ( not ( = ?auto_139631 ?auto_139634 ) ) ( not ( = ?auto_139632 ?auto_139634 ) ) ( not ( = ?auto_139633 ?auto_139634 ) ) ( CLEAR ?auto_139631 ) ( ON ?auto_139632 ?auto_139633 ) ( CLEAR ?auto_139632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139635 ) ( ON ?auto_139637 ?auto_139635 ) ( ON ?auto_139636 ?auto_139637 ) ( ON ?auto_139638 ?auto_139636 ) ( ON ?auto_139634 ?auto_139638 ) ( not ( = ?auto_139635 ?auto_139637 ) ) ( not ( = ?auto_139635 ?auto_139636 ) ) ( not ( = ?auto_139635 ?auto_139638 ) ) ( not ( = ?auto_139635 ?auto_139634 ) ) ( not ( = ?auto_139635 ?auto_139633 ) ) ( not ( = ?auto_139635 ?auto_139632 ) ) ( not ( = ?auto_139637 ?auto_139636 ) ) ( not ( = ?auto_139637 ?auto_139638 ) ) ( not ( = ?auto_139637 ?auto_139634 ) ) ( not ( = ?auto_139637 ?auto_139633 ) ) ( not ( = ?auto_139637 ?auto_139632 ) ) ( not ( = ?auto_139636 ?auto_139638 ) ) ( not ( = ?auto_139636 ?auto_139634 ) ) ( not ( = ?auto_139636 ?auto_139633 ) ) ( not ( = ?auto_139636 ?auto_139632 ) ) ( not ( = ?auto_139638 ?auto_139634 ) ) ( not ( = ?auto_139638 ?auto_139633 ) ) ( not ( = ?auto_139638 ?auto_139632 ) ) ( not ( = ?auto_139630 ?auto_139635 ) ) ( not ( = ?auto_139630 ?auto_139637 ) ) ( not ( = ?auto_139630 ?auto_139636 ) ) ( not ( = ?auto_139630 ?auto_139638 ) ) ( not ( = ?auto_139631 ?auto_139635 ) ) ( not ( = ?auto_139631 ?auto_139637 ) ) ( not ( = ?auto_139631 ?auto_139636 ) ) ( not ( = ?auto_139631 ?auto_139638 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139635 ?auto_139637 ?auto_139636 ?auto_139638 ?auto_139634 ?auto_139633 )
      ( MAKE-4PILE ?auto_139630 ?auto_139631 ?auto_139632 ?auto_139633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139639 - BLOCK
      ?auto_139640 - BLOCK
      ?auto_139641 - BLOCK
      ?auto_139642 - BLOCK
    )
    :vars
    (
      ?auto_139644 - BLOCK
      ?auto_139643 - BLOCK
      ?auto_139647 - BLOCK
      ?auto_139646 - BLOCK
      ?auto_139645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139639 ) ( not ( = ?auto_139639 ?auto_139640 ) ) ( not ( = ?auto_139639 ?auto_139641 ) ) ( not ( = ?auto_139639 ?auto_139642 ) ) ( not ( = ?auto_139640 ?auto_139641 ) ) ( not ( = ?auto_139640 ?auto_139642 ) ) ( not ( = ?auto_139641 ?auto_139642 ) ) ( ON ?auto_139642 ?auto_139644 ) ( not ( = ?auto_139639 ?auto_139644 ) ) ( not ( = ?auto_139640 ?auto_139644 ) ) ( not ( = ?auto_139641 ?auto_139644 ) ) ( not ( = ?auto_139642 ?auto_139644 ) ) ( ON ?auto_139641 ?auto_139642 ) ( CLEAR ?auto_139641 ) ( ON-TABLE ?auto_139643 ) ( ON ?auto_139647 ?auto_139643 ) ( ON ?auto_139646 ?auto_139647 ) ( ON ?auto_139645 ?auto_139646 ) ( ON ?auto_139644 ?auto_139645 ) ( not ( = ?auto_139643 ?auto_139647 ) ) ( not ( = ?auto_139643 ?auto_139646 ) ) ( not ( = ?auto_139643 ?auto_139645 ) ) ( not ( = ?auto_139643 ?auto_139644 ) ) ( not ( = ?auto_139643 ?auto_139642 ) ) ( not ( = ?auto_139643 ?auto_139641 ) ) ( not ( = ?auto_139647 ?auto_139646 ) ) ( not ( = ?auto_139647 ?auto_139645 ) ) ( not ( = ?auto_139647 ?auto_139644 ) ) ( not ( = ?auto_139647 ?auto_139642 ) ) ( not ( = ?auto_139647 ?auto_139641 ) ) ( not ( = ?auto_139646 ?auto_139645 ) ) ( not ( = ?auto_139646 ?auto_139644 ) ) ( not ( = ?auto_139646 ?auto_139642 ) ) ( not ( = ?auto_139646 ?auto_139641 ) ) ( not ( = ?auto_139645 ?auto_139644 ) ) ( not ( = ?auto_139645 ?auto_139642 ) ) ( not ( = ?auto_139645 ?auto_139641 ) ) ( not ( = ?auto_139639 ?auto_139643 ) ) ( not ( = ?auto_139639 ?auto_139647 ) ) ( not ( = ?auto_139639 ?auto_139646 ) ) ( not ( = ?auto_139639 ?auto_139645 ) ) ( not ( = ?auto_139640 ?auto_139643 ) ) ( not ( = ?auto_139640 ?auto_139647 ) ) ( not ( = ?auto_139640 ?auto_139646 ) ) ( not ( = ?auto_139640 ?auto_139645 ) ) ( HOLDING ?auto_139640 ) ( CLEAR ?auto_139639 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139639 ?auto_139640 )
      ( MAKE-4PILE ?auto_139639 ?auto_139640 ?auto_139641 ?auto_139642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139648 - BLOCK
      ?auto_139649 - BLOCK
      ?auto_139650 - BLOCK
      ?auto_139651 - BLOCK
    )
    :vars
    (
      ?auto_139655 - BLOCK
      ?auto_139656 - BLOCK
      ?auto_139652 - BLOCK
      ?auto_139653 - BLOCK
      ?auto_139654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139648 ) ( not ( = ?auto_139648 ?auto_139649 ) ) ( not ( = ?auto_139648 ?auto_139650 ) ) ( not ( = ?auto_139648 ?auto_139651 ) ) ( not ( = ?auto_139649 ?auto_139650 ) ) ( not ( = ?auto_139649 ?auto_139651 ) ) ( not ( = ?auto_139650 ?auto_139651 ) ) ( ON ?auto_139651 ?auto_139655 ) ( not ( = ?auto_139648 ?auto_139655 ) ) ( not ( = ?auto_139649 ?auto_139655 ) ) ( not ( = ?auto_139650 ?auto_139655 ) ) ( not ( = ?auto_139651 ?auto_139655 ) ) ( ON ?auto_139650 ?auto_139651 ) ( ON-TABLE ?auto_139656 ) ( ON ?auto_139652 ?auto_139656 ) ( ON ?auto_139653 ?auto_139652 ) ( ON ?auto_139654 ?auto_139653 ) ( ON ?auto_139655 ?auto_139654 ) ( not ( = ?auto_139656 ?auto_139652 ) ) ( not ( = ?auto_139656 ?auto_139653 ) ) ( not ( = ?auto_139656 ?auto_139654 ) ) ( not ( = ?auto_139656 ?auto_139655 ) ) ( not ( = ?auto_139656 ?auto_139651 ) ) ( not ( = ?auto_139656 ?auto_139650 ) ) ( not ( = ?auto_139652 ?auto_139653 ) ) ( not ( = ?auto_139652 ?auto_139654 ) ) ( not ( = ?auto_139652 ?auto_139655 ) ) ( not ( = ?auto_139652 ?auto_139651 ) ) ( not ( = ?auto_139652 ?auto_139650 ) ) ( not ( = ?auto_139653 ?auto_139654 ) ) ( not ( = ?auto_139653 ?auto_139655 ) ) ( not ( = ?auto_139653 ?auto_139651 ) ) ( not ( = ?auto_139653 ?auto_139650 ) ) ( not ( = ?auto_139654 ?auto_139655 ) ) ( not ( = ?auto_139654 ?auto_139651 ) ) ( not ( = ?auto_139654 ?auto_139650 ) ) ( not ( = ?auto_139648 ?auto_139656 ) ) ( not ( = ?auto_139648 ?auto_139652 ) ) ( not ( = ?auto_139648 ?auto_139653 ) ) ( not ( = ?auto_139648 ?auto_139654 ) ) ( not ( = ?auto_139649 ?auto_139656 ) ) ( not ( = ?auto_139649 ?auto_139652 ) ) ( not ( = ?auto_139649 ?auto_139653 ) ) ( not ( = ?auto_139649 ?auto_139654 ) ) ( CLEAR ?auto_139648 ) ( ON ?auto_139649 ?auto_139650 ) ( CLEAR ?auto_139649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139656 ?auto_139652 ?auto_139653 ?auto_139654 ?auto_139655 ?auto_139651 ?auto_139650 )
      ( MAKE-4PILE ?auto_139648 ?auto_139649 ?auto_139650 ?auto_139651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139657 - BLOCK
      ?auto_139658 - BLOCK
      ?auto_139659 - BLOCK
      ?auto_139660 - BLOCK
    )
    :vars
    (
      ?auto_139662 - BLOCK
      ?auto_139664 - BLOCK
      ?auto_139663 - BLOCK
      ?auto_139665 - BLOCK
      ?auto_139661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139657 ?auto_139658 ) ) ( not ( = ?auto_139657 ?auto_139659 ) ) ( not ( = ?auto_139657 ?auto_139660 ) ) ( not ( = ?auto_139658 ?auto_139659 ) ) ( not ( = ?auto_139658 ?auto_139660 ) ) ( not ( = ?auto_139659 ?auto_139660 ) ) ( ON ?auto_139660 ?auto_139662 ) ( not ( = ?auto_139657 ?auto_139662 ) ) ( not ( = ?auto_139658 ?auto_139662 ) ) ( not ( = ?auto_139659 ?auto_139662 ) ) ( not ( = ?auto_139660 ?auto_139662 ) ) ( ON ?auto_139659 ?auto_139660 ) ( ON-TABLE ?auto_139664 ) ( ON ?auto_139663 ?auto_139664 ) ( ON ?auto_139665 ?auto_139663 ) ( ON ?auto_139661 ?auto_139665 ) ( ON ?auto_139662 ?auto_139661 ) ( not ( = ?auto_139664 ?auto_139663 ) ) ( not ( = ?auto_139664 ?auto_139665 ) ) ( not ( = ?auto_139664 ?auto_139661 ) ) ( not ( = ?auto_139664 ?auto_139662 ) ) ( not ( = ?auto_139664 ?auto_139660 ) ) ( not ( = ?auto_139664 ?auto_139659 ) ) ( not ( = ?auto_139663 ?auto_139665 ) ) ( not ( = ?auto_139663 ?auto_139661 ) ) ( not ( = ?auto_139663 ?auto_139662 ) ) ( not ( = ?auto_139663 ?auto_139660 ) ) ( not ( = ?auto_139663 ?auto_139659 ) ) ( not ( = ?auto_139665 ?auto_139661 ) ) ( not ( = ?auto_139665 ?auto_139662 ) ) ( not ( = ?auto_139665 ?auto_139660 ) ) ( not ( = ?auto_139665 ?auto_139659 ) ) ( not ( = ?auto_139661 ?auto_139662 ) ) ( not ( = ?auto_139661 ?auto_139660 ) ) ( not ( = ?auto_139661 ?auto_139659 ) ) ( not ( = ?auto_139657 ?auto_139664 ) ) ( not ( = ?auto_139657 ?auto_139663 ) ) ( not ( = ?auto_139657 ?auto_139665 ) ) ( not ( = ?auto_139657 ?auto_139661 ) ) ( not ( = ?auto_139658 ?auto_139664 ) ) ( not ( = ?auto_139658 ?auto_139663 ) ) ( not ( = ?auto_139658 ?auto_139665 ) ) ( not ( = ?auto_139658 ?auto_139661 ) ) ( ON ?auto_139658 ?auto_139659 ) ( CLEAR ?auto_139658 ) ( HOLDING ?auto_139657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139657 )
      ( MAKE-4PILE ?auto_139657 ?auto_139658 ?auto_139659 ?auto_139660 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139666 - BLOCK
      ?auto_139667 - BLOCK
      ?auto_139668 - BLOCK
      ?auto_139669 - BLOCK
    )
    :vars
    (
      ?auto_139670 - BLOCK
      ?auto_139672 - BLOCK
      ?auto_139671 - BLOCK
      ?auto_139673 - BLOCK
      ?auto_139674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139666 ?auto_139667 ) ) ( not ( = ?auto_139666 ?auto_139668 ) ) ( not ( = ?auto_139666 ?auto_139669 ) ) ( not ( = ?auto_139667 ?auto_139668 ) ) ( not ( = ?auto_139667 ?auto_139669 ) ) ( not ( = ?auto_139668 ?auto_139669 ) ) ( ON ?auto_139669 ?auto_139670 ) ( not ( = ?auto_139666 ?auto_139670 ) ) ( not ( = ?auto_139667 ?auto_139670 ) ) ( not ( = ?auto_139668 ?auto_139670 ) ) ( not ( = ?auto_139669 ?auto_139670 ) ) ( ON ?auto_139668 ?auto_139669 ) ( ON-TABLE ?auto_139672 ) ( ON ?auto_139671 ?auto_139672 ) ( ON ?auto_139673 ?auto_139671 ) ( ON ?auto_139674 ?auto_139673 ) ( ON ?auto_139670 ?auto_139674 ) ( not ( = ?auto_139672 ?auto_139671 ) ) ( not ( = ?auto_139672 ?auto_139673 ) ) ( not ( = ?auto_139672 ?auto_139674 ) ) ( not ( = ?auto_139672 ?auto_139670 ) ) ( not ( = ?auto_139672 ?auto_139669 ) ) ( not ( = ?auto_139672 ?auto_139668 ) ) ( not ( = ?auto_139671 ?auto_139673 ) ) ( not ( = ?auto_139671 ?auto_139674 ) ) ( not ( = ?auto_139671 ?auto_139670 ) ) ( not ( = ?auto_139671 ?auto_139669 ) ) ( not ( = ?auto_139671 ?auto_139668 ) ) ( not ( = ?auto_139673 ?auto_139674 ) ) ( not ( = ?auto_139673 ?auto_139670 ) ) ( not ( = ?auto_139673 ?auto_139669 ) ) ( not ( = ?auto_139673 ?auto_139668 ) ) ( not ( = ?auto_139674 ?auto_139670 ) ) ( not ( = ?auto_139674 ?auto_139669 ) ) ( not ( = ?auto_139674 ?auto_139668 ) ) ( not ( = ?auto_139666 ?auto_139672 ) ) ( not ( = ?auto_139666 ?auto_139671 ) ) ( not ( = ?auto_139666 ?auto_139673 ) ) ( not ( = ?auto_139666 ?auto_139674 ) ) ( not ( = ?auto_139667 ?auto_139672 ) ) ( not ( = ?auto_139667 ?auto_139671 ) ) ( not ( = ?auto_139667 ?auto_139673 ) ) ( not ( = ?auto_139667 ?auto_139674 ) ) ( ON ?auto_139667 ?auto_139668 ) ( ON ?auto_139666 ?auto_139667 ) ( CLEAR ?auto_139666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139672 ?auto_139671 ?auto_139673 ?auto_139674 ?auto_139670 ?auto_139669 ?auto_139668 ?auto_139667 )
      ( MAKE-4PILE ?auto_139666 ?auto_139667 ?auto_139668 ?auto_139669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139679 - BLOCK
      ?auto_139680 - BLOCK
      ?auto_139681 - BLOCK
      ?auto_139682 - BLOCK
    )
    :vars
    (
      ?auto_139683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139683 ?auto_139682 ) ( CLEAR ?auto_139683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139679 ) ( ON ?auto_139680 ?auto_139679 ) ( ON ?auto_139681 ?auto_139680 ) ( ON ?auto_139682 ?auto_139681 ) ( not ( = ?auto_139679 ?auto_139680 ) ) ( not ( = ?auto_139679 ?auto_139681 ) ) ( not ( = ?auto_139679 ?auto_139682 ) ) ( not ( = ?auto_139679 ?auto_139683 ) ) ( not ( = ?auto_139680 ?auto_139681 ) ) ( not ( = ?auto_139680 ?auto_139682 ) ) ( not ( = ?auto_139680 ?auto_139683 ) ) ( not ( = ?auto_139681 ?auto_139682 ) ) ( not ( = ?auto_139681 ?auto_139683 ) ) ( not ( = ?auto_139682 ?auto_139683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139683 ?auto_139682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139684 - BLOCK
      ?auto_139685 - BLOCK
      ?auto_139686 - BLOCK
      ?auto_139687 - BLOCK
    )
    :vars
    (
      ?auto_139688 - BLOCK
      ?auto_139689 - BLOCK
      ?auto_139690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139688 ?auto_139687 ) ( CLEAR ?auto_139688 ) ( ON-TABLE ?auto_139684 ) ( ON ?auto_139685 ?auto_139684 ) ( ON ?auto_139686 ?auto_139685 ) ( ON ?auto_139687 ?auto_139686 ) ( not ( = ?auto_139684 ?auto_139685 ) ) ( not ( = ?auto_139684 ?auto_139686 ) ) ( not ( = ?auto_139684 ?auto_139687 ) ) ( not ( = ?auto_139684 ?auto_139688 ) ) ( not ( = ?auto_139685 ?auto_139686 ) ) ( not ( = ?auto_139685 ?auto_139687 ) ) ( not ( = ?auto_139685 ?auto_139688 ) ) ( not ( = ?auto_139686 ?auto_139687 ) ) ( not ( = ?auto_139686 ?auto_139688 ) ) ( not ( = ?auto_139687 ?auto_139688 ) ) ( HOLDING ?auto_139689 ) ( CLEAR ?auto_139690 ) ( not ( = ?auto_139684 ?auto_139689 ) ) ( not ( = ?auto_139684 ?auto_139690 ) ) ( not ( = ?auto_139685 ?auto_139689 ) ) ( not ( = ?auto_139685 ?auto_139690 ) ) ( not ( = ?auto_139686 ?auto_139689 ) ) ( not ( = ?auto_139686 ?auto_139690 ) ) ( not ( = ?auto_139687 ?auto_139689 ) ) ( not ( = ?auto_139687 ?auto_139690 ) ) ( not ( = ?auto_139688 ?auto_139689 ) ) ( not ( = ?auto_139688 ?auto_139690 ) ) ( not ( = ?auto_139689 ?auto_139690 ) ) )
    :subtasks
    ( ( !STACK ?auto_139689 ?auto_139690 )
      ( MAKE-4PILE ?auto_139684 ?auto_139685 ?auto_139686 ?auto_139687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139691 - BLOCK
      ?auto_139692 - BLOCK
      ?auto_139693 - BLOCK
      ?auto_139694 - BLOCK
    )
    :vars
    (
      ?auto_139696 - BLOCK
      ?auto_139697 - BLOCK
      ?auto_139695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139696 ?auto_139694 ) ( ON-TABLE ?auto_139691 ) ( ON ?auto_139692 ?auto_139691 ) ( ON ?auto_139693 ?auto_139692 ) ( ON ?auto_139694 ?auto_139693 ) ( not ( = ?auto_139691 ?auto_139692 ) ) ( not ( = ?auto_139691 ?auto_139693 ) ) ( not ( = ?auto_139691 ?auto_139694 ) ) ( not ( = ?auto_139691 ?auto_139696 ) ) ( not ( = ?auto_139692 ?auto_139693 ) ) ( not ( = ?auto_139692 ?auto_139694 ) ) ( not ( = ?auto_139692 ?auto_139696 ) ) ( not ( = ?auto_139693 ?auto_139694 ) ) ( not ( = ?auto_139693 ?auto_139696 ) ) ( not ( = ?auto_139694 ?auto_139696 ) ) ( CLEAR ?auto_139697 ) ( not ( = ?auto_139691 ?auto_139695 ) ) ( not ( = ?auto_139691 ?auto_139697 ) ) ( not ( = ?auto_139692 ?auto_139695 ) ) ( not ( = ?auto_139692 ?auto_139697 ) ) ( not ( = ?auto_139693 ?auto_139695 ) ) ( not ( = ?auto_139693 ?auto_139697 ) ) ( not ( = ?auto_139694 ?auto_139695 ) ) ( not ( = ?auto_139694 ?auto_139697 ) ) ( not ( = ?auto_139696 ?auto_139695 ) ) ( not ( = ?auto_139696 ?auto_139697 ) ) ( not ( = ?auto_139695 ?auto_139697 ) ) ( ON ?auto_139695 ?auto_139696 ) ( CLEAR ?auto_139695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139691 ?auto_139692 ?auto_139693 ?auto_139694 ?auto_139696 )
      ( MAKE-4PILE ?auto_139691 ?auto_139692 ?auto_139693 ?auto_139694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139698 - BLOCK
      ?auto_139699 - BLOCK
      ?auto_139700 - BLOCK
      ?auto_139701 - BLOCK
    )
    :vars
    (
      ?auto_139704 - BLOCK
      ?auto_139702 - BLOCK
      ?auto_139703 - BLOCK
      ?auto_139705 - BLOCK
      ?auto_139706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139704 ?auto_139701 ) ( ON-TABLE ?auto_139698 ) ( ON ?auto_139699 ?auto_139698 ) ( ON ?auto_139700 ?auto_139699 ) ( ON ?auto_139701 ?auto_139700 ) ( not ( = ?auto_139698 ?auto_139699 ) ) ( not ( = ?auto_139698 ?auto_139700 ) ) ( not ( = ?auto_139698 ?auto_139701 ) ) ( not ( = ?auto_139698 ?auto_139704 ) ) ( not ( = ?auto_139699 ?auto_139700 ) ) ( not ( = ?auto_139699 ?auto_139701 ) ) ( not ( = ?auto_139699 ?auto_139704 ) ) ( not ( = ?auto_139700 ?auto_139701 ) ) ( not ( = ?auto_139700 ?auto_139704 ) ) ( not ( = ?auto_139701 ?auto_139704 ) ) ( not ( = ?auto_139698 ?auto_139702 ) ) ( not ( = ?auto_139698 ?auto_139703 ) ) ( not ( = ?auto_139699 ?auto_139702 ) ) ( not ( = ?auto_139699 ?auto_139703 ) ) ( not ( = ?auto_139700 ?auto_139702 ) ) ( not ( = ?auto_139700 ?auto_139703 ) ) ( not ( = ?auto_139701 ?auto_139702 ) ) ( not ( = ?auto_139701 ?auto_139703 ) ) ( not ( = ?auto_139704 ?auto_139702 ) ) ( not ( = ?auto_139704 ?auto_139703 ) ) ( not ( = ?auto_139702 ?auto_139703 ) ) ( ON ?auto_139702 ?auto_139704 ) ( CLEAR ?auto_139702 ) ( HOLDING ?auto_139703 ) ( CLEAR ?auto_139705 ) ( ON-TABLE ?auto_139706 ) ( ON ?auto_139705 ?auto_139706 ) ( not ( = ?auto_139706 ?auto_139705 ) ) ( not ( = ?auto_139706 ?auto_139703 ) ) ( not ( = ?auto_139705 ?auto_139703 ) ) ( not ( = ?auto_139698 ?auto_139705 ) ) ( not ( = ?auto_139698 ?auto_139706 ) ) ( not ( = ?auto_139699 ?auto_139705 ) ) ( not ( = ?auto_139699 ?auto_139706 ) ) ( not ( = ?auto_139700 ?auto_139705 ) ) ( not ( = ?auto_139700 ?auto_139706 ) ) ( not ( = ?auto_139701 ?auto_139705 ) ) ( not ( = ?auto_139701 ?auto_139706 ) ) ( not ( = ?auto_139704 ?auto_139705 ) ) ( not ( = ?auto_139704 ?auto_139706 ) ) ( not ( = ?auto_139702 ?auto_139705 ) ) ( not ( = ?auto_139702 ?auto_139706 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139706 ?auto_139705 ?auto_139703 )
      ( MAKE-4PILE ?auto_139698 ?auto_139699 ?auto_139700 ?auto_139701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139707 - BLOCK
      ?auto_139708 - BLOCK
      ?auto_139709 - BLOCK
      ?auto_139710 - BLOCK
    )
    :vars
    (
      ?auto_139714 - BLOCK
      ?auto_139715 - BLOCK
      ?auto_139713 - BLOCK
      ?auto_139711 - BLOCK
      ?auto_139712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139714 ?auto_139710 ) ( ON-TABLE ?auto_139707 ) ( ON ?auto_139708 ?auto_139707 ) ( ON ?auto_139709 ?auto_139708 ) ( ON ?auto_139710 ?auto_139709 ) ( not ( = ?auto_139707 ?auto_139708 ) ) ( not ( = ?auto_139707 ?auto_139709 ) ) ( not ( = ?auto_139707 ?auto_139710 ) ) ( not ( = ?auto_139707 ?auto_139714 ) ) ( not ( = ?auto_139708 ?auto_139709 ) ) ( not ( = ?auto_139708 ?auto_139710 ) ) ( not ( = ?auto_139708 ?auto_139714 ) ) ( not ( = ?auto_139709 ?auto_139710 ) ) ( not ( = ?auto_139709 ?auto_139714 ) ) ( not ( = ?auto_139710 ?auto_139714 ) ) ( not ( = ?auto_139707 ?auto_139715 ) ) ( not ( = ?auto_139707 ?auto_139713 ) ) ( not ( = ?auto_139708 ?auto_139715 ) ) ( not ( = ?auto_139708 ?auto_139713 ) ) ( not ( = ?auto_139709 ?auto_139715 ) ) ( not ( = ?auto_139709 ?auto_139713 ) ) ( not ( = ?auto_139710 ?auto_139715 ) ) ( not ( = ?auto_139710 ?auto_139713 ) ) ( not ( = ?auto_139714 ?auto_139715 ) ) ( not ( = ?auto_139714 ?auto_139713 ) ) ( not ( = ?auto_139715 ?auto_139713 ) ) ( ON ?auto_139715 ?auto_139714 ) ( CLEAR ?auto_139711 ) ( ON-TABLE ?auto_139712 ) ( ON ?auto_139711 ?auto_139712 ) ( not ( = ?auto_139712 ?auto_139711 ) ) ( not ( = ?auto_139712 ?auto_139713 ) ) ( not ( = ?auto_139711 ?auto_139713 ) ) ( not ( = ?auto_139707 ?auto_139711 ) ) ( not ( = ?auto_139707 ?auto_139712 ) ) ( not ( = ?auto_139708 ?auto_139711 ) ) ( not ( = ?auto_139708 ?auto_139712 ) ) ( not ( = ?auto_139709 ?auto_139711 ) ) ( not ( = ?auto_139709 ?auto_139712 ) ) ( not ( = ?auto_139710 ?auto_139711 ) ) ( not ( = ?auto_139710 ?auto_139712 ) ) ( not ( = ?auto_139714 ?auto_139711 ) ) ( not ( = ?auto_139714 ?auto_139712 ) ) ( not ( = ?auto_139715 ?auto_139711 ) ) ( not ( = ?auto_139715 ?auto_139712 ) ) ( ON ?auto_139713 ?auto_139715 ) ( CLEAR ?auto_139713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139707 ?auto_139708 ?auto_139709 ?auto_139710 ?auto_139714 ?auto_139715 )
      ( MAKE-4PILE ?auto_139707 ?auto_139708 ?auto_139709 ?auto_139710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139716 - BLOCK
      ?auto_139717 - BLOCK
      ?auto_139718 - BLOCK
      ?auto_139719 - BLOCK
    )
    :vars
    (
      ?auto_139721 - BLOCK
      ?auto_139723 - BLOCK
      ?auto_139724 - BLOCK
      ?auto_139720 - BLOCK
      ?auto_139722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139721 ?auto_139719 ) ( ON-TABLE ?auto_139716 ) ( ON ?auto_139717 ?auto_139716 ) ( ON ?auto_139718 ?auto_139717 ) ( ON ?auto_139719 ?auto_139718 ) ( not ( = ?auto_139716 ?auto_139717 ) ) ( not ( = ?auto_139716 ?auto_139718 ) ) ( not ( = ?auto_139716 ?auto_139719 ) ) ( not ( = ?auto_139716 ?auto_139721 ) ) ( not ( = ?auto_139717 ?auto_139718 ) ) ( not ( = ?auto_139717 ?auto_139719 ) ) ( not ( = ?auto_139717 ?auto_139721 ) ) ( not ( = ?auto_139718 ?auto_139719 ) ) ( not ( = ?auto_139718 ?auto_139721 ) ) ( not ( = ?auto_139719 ?auto_139721 ) ) ( not ( = ?auto_139716 ?auto_139723 ) ) ( not ( = ?auto_139716 ?auto_139724 ) ) ( not ( = ?auto_139717 ?auto_139723 ) ) ( not ( = ?auto_139717 ?auto_139724 ) ) ( not ( = ?auto_139718 ?auto_139723 ) ) ( not ( = ?auto_139718 ?auto_139724 ) ) ( not ( = ?auto_139719 ?auto_139723 ) ) ( not ( = ?auto_139719 ?auto_139724 ) ) ( not ( = ?auto_139721 ?auto_139723 ) ) ( not ( = ?auto_139721 ?auto_139724 ) ) ( not ( = ?auto_139723 ?auto_139724 ) ) ( ON ?auto_139723 ?auto_139721 ) ( ON-TABLE ?auto_139720 ) ( not ( = ?auto_139720 ?auto_139722 ) ) ( not ( = ?auto_139720 ?auto_139724 ) ) ( not ( = ?auto_139722 ?auto_139724 ) ) ( not ( = ?auto_139716 ?auto_139722 ) ) ( not ( = ?auto_139716 ?auto_139720 ) ) ( not ( = ?auto_139717 ?auto_139722 ) ) ( not ( = ?auto_139717 ?auto_139720 ) ) ( not ( = ?auto_139718 ?auto_139722 ) ) ( not ( = ?auto_139718 ?auto_139720 ) ) ( not ( = ?auto_139719 ?auto_139722 ) ) ( not ( = ?auto_139719 ?auto_139720 ) ) ( not ( = ?auto_139721 ?auto_139722 ) ) ( not ( = ?auto_139721 ?auto_139720 ) ) ( not ( = ?auto_139723 ?auto_139722 ) ) ( not ( = ?auto_139723 ?auto_139720 ) ) ( ON ?auto_139724 ?auto_139723 ) ( CLEAR ?auto_139724 ) ( HOLDING ?auto_139722 ) ( CLEAR ?auto_139720 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139720 ?auto_139722 )
      ( MAKE-4PILE ?auto_139716 ?auto_139717 ?auto_139718 ?auto_139719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141418 - BLOCK
      ?auto_141419 - BLOCK
      ?auto_141420 - BLOCK
      ?auto_141421 - BLOCK
    )
    :vars
    (
      ?auto_141425 - BLOCK
      ?auto_141422 - BLOCK
      ?auto_141423 - BLOCK
      ?auto_141424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141425 ?auto_141421 ) ( ON-TABLE ?auto_141418 ) ( ON ?auto_141419 ?auto_141418 ) ( ON ?auto_141420 ?auto_141419 ) ( ON ?auto_141421 ?auto_141420 ) ( not ( = ?auto_141418 ?auto_141419 ) ) ( not ( = ?auto_141418 ?auto_141420 ) ) ( not ( = ?auto_141418 ?auto_141421 ) ) ( not ( = ?auto_141418 ?auto_141425 ) ) ( not ( = ?auto_141419 ?auto_141420 ) ) ( not ( = ?auto_141419 ?auto_141421 ) ) ( not ( = ?auto_141419 ?auto_141425 ) ) ( not ( = ?auto_141420 ?auto_141421 ) ) ( not ( = ?auto_141420 ?auto_141425 ) ) ( not ( = ?auto_141421 ?auto_141425 ) ) ( not ( = ?auto_141418 ?auto_141422 ) ) ( not ( = ?auto_141418 ?auto_141423 ) ) ( not ( = ?auto_141419 ?auto_141422 ) ) ( not ( = ?auto_141419 ?auto_141423 ) ) ( not ( = ?auto_141420 ?auto_141422 ) ) ( not ( = ?auto_141420 ?auto_141423 ) ) ( not ( = ?auto_141421 ?auto_141422 ) ) ( not ( = ?auto_141421 ?auto_141423 ) ) ( not ( = ?auto_141425 ?auto_141422 ) ) ( not ( = ?auto_141425 ?auto_141423 ) ) ( not ( = ?auto_141422 ?auto_141423 ) ) ( ON ?auto_141422 ?auto_141425 ) ( not ( = ?auto_141424 ?auto_141423 ) ) ( not ( = ?auto_141418 ?auto_141424 ) ) ( not ( = ?auto_141419 ?auto_141424 ) ) ( not ( = ?auto_141420 ?auto_141424 ) ) ( not ( = ?auto_141421 ?auto_141424 ) ) ( not ( = ?auto_141425 ?auto_141424 ) ) ( not ( = ?auto_141422 ?auto_141424 ) ) ( ON ?auto_141423 ?auto_141422 ) ( ON ?auto_141424 ?auto_141423 ) ( CLEAR ?auto_141424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141418 ?auto_141419 ?auto_141420 ?auto_141421 ?auto_141425 ?auto_141422 ?auto_141423 )
      ( MAKE-4PILE ?auto_141418 ?auto_141419 ?auto_141420 ?auto_141421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139734 - BLOCK
      ?auto_139735 - BLOCK
      ?auto_139736 - BLOCK
      ?auto_139737 - BLOCK
    )
    :vars
    (
      ?auto_139741 - BLOCK
      ?auto_139740 - BLOCK
      ?auto_139742 - BLOCK
      ?auto_139738 - BLOCK
      ?auto_139739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139741 ?auto_139737 ) ( ON-TABLE ?auto_139734 ) ( ON ?auto_139735 ?auto_139734 ) ( ON ?auto_139736 ?auto_139735 ) ( ON ?auto_139737 ?auto_139736 ) ( not ( = ?auto_139734 ?auto_139735 ) ) ( not ( = ?auto_139734 ?auto_139736 ) ) ( not ( = ?auto_139734 ?auto_139737 ) ) ( not ( = ?auto_139734 ?auto_139741 ) ) ( not ( = ?auto_139735 ?auto_139736 ) ) ( not ( = ?auto_139735 ?auto_139737 ) ) ( not ( = ?auto_139735 ?auto_139741 ) ) ( not ( = ?auto_139736 ?auto_139737 ) ) ( not ( = ?auto_139736 ?auto_139741 ) ) ( not ( = ?auto_139737 ?auto_139741 ) ) ( not ( = ?auto_139734 ?auto_139740 ) ) ( not ( = ?auto_139734 ?auto_139742 ) ) ( not ( = ?auto_139735 ?auto_139740 ) ) ( not ( = ?auto_139735 ?auto_139742 ) ) ( not ( = ?auto_139736 ?auto_139740 ) ) ( not ( = ?auto_139736 ?auto_139742 ) ) ( not ( = ?auto_139737 ?auto_139740 ) ) ( not ( = ?auto_139737 ?auto_139742 ) ) ( not ( = ?auto_139741 ?auto_139740 ) ) ( not ( = ?auto_139741 ?auto_139742 ) ) ( not ( = ?auto_139740 ?auto_139742 ) ) ( ON ?auto_139740 ?auto_139741 ) ( not ( = ?auto_139738 ?auto_139739 ) ) ( not ( = ?auto_139738 ?auto_139742 ) ) ( not ( = ?auto_139739 ?auto_139742 ) ) ( not ( = ?auto_139734 ?auto_139739 ) ) ( not ( = ?auto_139734 ?auto_139738 ) ) ( not ( = ?auto_139735 ?auto_139739 ) ) ( not ( = ?auto_139735 ?auto_139738 ) ) ( not ( = ?auto_139736 ?auto_139739 ) ) ( not ( = ?auto_139736 ?auto_139738 ) ) ( not ( = ?auto_139737 ?auto_139739 ) ) ( not ( = ?auto_139737 ?auto_139738 ) ) ( not ( = ?auto_139741 ?auto_139739 ) ) ( not ( = ?auto_139741 ?auto_139738 ) ) ( not ( = ?auto_139740 ?auto_139739 ) ) ( not ( = ?auto_139740 ?auto_139738 ) ) ( ON ?auto_139742 ?auto_139740 ) ( ON ?auto_139739 ?auto_139742 ) ( CLEAR ?auto_139739 ) ( HOLDING ?auto_139738 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139738 )
      ( MAKE-4PILE ?auto_139734 ?auto_139735 ?auto_139736 ?auto_139737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139743 - BLOCK
      ?auto_139744 - BLOCK
      ?auto_139745 - BLOCK
      ?auto_139746 - BLOCK
    )
    :vars
    (
      ?auto_139751 - BLOCK
      ?auto_139747 - BLOCK
      ?auto_139748 - BLOCK
      ?auto_139750 - BLOCK
      ?auto_139749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139751 ?auto_139746 ) ( ON-TABLE ?auto_139743 ) ( ON ?auto_139744 ?auto_139743 ) ( ON ?auto_139745 ?auto_139744 ) ( ON ?auto_139746 ?auto_139745 ) ( not ( = ?auto_139743 ?auto_139744 ) ) ( not ( = ?auto_139743 ?auto_139745 ) ) ( not ( = ?auto_139743 ?auto_139746 ) ) ( not ( = ?auto_139743 ?auto_139751 ) ) ( not ( = ?auto_139744 ?auto_139745 ) ) ( not ( = ?auto_139744 ?auto_139746 ) ) ( not ( = ?auto_139744 ?auto_139751 ) ) ( not ( = ?auto_139745 ?auto_139746 ) ) ( not ( = ?auto_139745 ?auto_139751 ) ) ( not ( = ?auto_139746 ?auto_139751 ) ) ( not ( = ?auto_139743 ?auto_139747 ) ) ( not ( = ?auto_139743 ?auto_139748 ) ) ( not ( = ?auto_139744 ?auto_139747 ) ) ( not ( = ?auto_139744 ?auto_139748 ) ) ( not ( = ?auto_139745 ?auto_139747 ) ) ( not ( = ?auto_139745 ?auto_139748 ) ) ( not ( = ?auto_139746 ?auto_139747 ) ) ( not ( = ?auto_139746 ?auto_139748 ) ) ( not ( = ?auto_139751 ?auto_139747 ) ) ( not ( = ?auto_139751 ?auto_139748 ) ) ( not ( = ?auto_139747 ?auto_139748 ) ) ( ON ?auto_139747 ?auto_139751 ) ( not ( = ?auto_139750 ?auto_139749 ) ) ( not ( = ?auto_139750 ?auto_139748 ) ) ( not ( = ?auto_139749 ?auto_139748 ) ) ( not ( = ?auto_139743 ?auto_139749 ) ) ( not ( = ?auto_139743 ?auto_139750 ) ) ( not ( = ?auto_139744 ?auto_139749 ) ) ( not ( = ?auto_139744 ?auto_139750 ) ) ( not ( = ?auto_139745 ?auto_139749 ) ) ( not ( = ?auto_139745 ?auto_139750 ) ) ( not ( = ?auto_139746 ?auto_139749 ) ) ( not ( = ?auto_139746 ?auto_139750 ) ) ( not ( = ?auto_139751 ?auto_139749 ) ) ( not ( = ?auto_139751 ?auto_139750 ) ) ( not ( = ?auto_139747 ?auto_139749 ) ) ( not ( = ?auto_139747 ?auto_139750 ) ) ( ON ?auto_139748 ?auto_139747 ) ( ON ?auto_139749 ?auto_139748 ) ( ON ?auto_139750 ?auto_139749 ) ( CLEAR ?auto_139750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139743 ?auto_139744 ?auto_139745 ?auto_139746 ?auto_139751 ?auto_139747 ?auto_139748 ?auto_139749 )
      ( MAKE-4PILE ?auto_139743 ?auto_139744 ?auto_139745 ?auto_139746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139757 - BLOCK
      ?auto_139758 - BLOCK
      ?auto_139759 - BLOCK
      ?auto_139760 - BLOCK
      ?auto_139761 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139761 ) ( CLEAR ?auto_139760 ) ( ON-TABLE ?auto_139757 ) ( ON ?auto_139758 ?auto_139757 ) ( ON ?auto_139759 ?auto_139758 ) ( ON ?auto_139760 ?auto_139759 ) ( not ( = ?auto_139757 ?auto_139758 ) ) ( not ( = ?auto_139757 ?auto_139759 ) ) ( not ( = ?auto_139757 ?auto_139760 ) ) ( not ( = ?auto_139757 ?auto_139761 ) ) ( not ( = ?auto_139758 ?auto_139759 ) ) ( not ( = ?auto_139758 ?auto_139760 ) ) ( not ( = ?auto_139758 ?auto_139761 ) ) ( not ( = ?auto_139759 ?auto_139760 ) ) ( not ( = ?auto_139759 ?auto_139761 ) ) ( not ( = ?auto_139760 ?auto_139761 ) ) )
    :subtasks
    ( ( !STACK ?auto_139761 ?auto_139760 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139762 - BLOCK
      ?auto_139763 - BLOCK
      ?auto_139764 - BLOCK
      ?auto_139765 - BLOCK
      ?auto_139766 - BLOCK
    )
    :vars
    (
      ?auto_139767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139765 ) ( ON-TABLE ?auto_139762 ) ( ON ?auto_139763 ?auto_139762 ) ( ON ?auto_139764 ?auto_139763 ) ( ON ?auto_139765 ?auto_139764 ) ( not ( = ?auto_139762 ?auto_139763 ) ) ( not ( = ?auto_139762 ?auto_139764 ) ) ( not ( = ?auto_139762 ?auto_139765 ) ) ( not ( = ?auto_139762 ?auto_139766 ) ) ( not ( = ?auto_139763 ?auto_139764 ) ) ( not ( = ?auto_139763 ?auto_139765 ) ) ( not ( = ?auto_139763 ?auto_139766 ) ) ( not ( = ?auto_139764 ?auto_139765 ) ) ( not ( = ?auto_139764 ?auto_139766 ) ) ( not ( = ?auto_139765 ?auto_139766 ) ) ( ON ?auto_139766 ?auto_139767 ) ( CLEAR ?auto_139766 ) ( HAND-EMPTY ) ( not ( = ?auto_139762 ?auto_139767 ) ) ( not ( = ?auto_139763 ?auto_139767 ) ) ( not ( = ?auto_139764 ?auto_139767 ) ) ( not ( = ?auto_139765 ?auto_139767 ) ) ( not ( = ?auto_139766 ?auto_139767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139766 ?auto_139767 )
      ( MAKE-5PILE ?auto_139762 ?auto_139763 ?auto_139764 ?auto_139765 ?auto_139766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139768 - BLOCK
      ?auto_139769 - BLOCK
      ?auto_139770 - BLOCK
      ?auto_139771 - BLOCK
      ?auto_139772 - BLOCK
    )
    :vars
    (
      ?auto_139773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139768 ) ( ON ?auto_139769 ?auto_139768 ) ( ON ?auto_139770 ?auto_139769 ) ( not ( = ?auto_139768 ?auto_139769 ) ) ( not ( = ?auto_139768 ?auto_139770 ) ) ( not ( = ?auto_139768 ?auto_139771 ) ) ( not ( = ?auto_139768 ?auto_139772 ) ) ( not ( = ?auto_139769 ?auto_139770 ) ) ( not ( = ?auto_139769 ?auto_139771 ) ) ( not ( = ?auto_139769 ?auto_139772 ) ) ( not ( = ?auto_139770 ?auto_139771 ) ) ( not ( = ?auto_139770 ?auto_139772 ) ) ( not ( = ?auto_139771 ?auto_139772 ) ) ( ON ?auto_139772 ?auto_139773 ) ( CLEAR ?auto_139772 ) ( not ( = ?auto_139768 ?auto_139773 ) ) ( not ( = ?auto_139769 ?auto_139773 ) ) ( not ( = ?auto_139770 ?auto_139773 ) ) ( not ( = ?auto_139771 ?auto_139773 ) ) ( not ( = ?auto_139772 ?auto_139773 ) ) ( HOLDING ?auto_139771 ) ( CLEAR ?auto_139770 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139768 ?auto_139769 ?auto_139770 ?auto_139771 )
      ( MAKE-5PILE ?auto_139768 ?auto_139769 ?auto_139770 ?auto_139771 ?auto_139772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139774 - BLOCK
      ?auto_139775 - BLOCK
      ?auto_139776 - BLOCK
      ?auto_139777 - BLOCK
      ?auto_139778 - BLOCK
    )
    :vars
    (
      ?auto_139779 - BLOCK
      ?auto_139780 - BLOCK
      ?auto_139782 - BLOCK
      ?auto_139781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139774 ) ( ON ?auto_139775 ?auto_139774 ) ( ON ?auto_139776 ?auto_139775 ) ( not ( = ?auto_139774 ?auto_139775 ) ) ( not ( = ?auto_139774 ?auto_139776 ) ) ( not ( = ?auto_139774 ?auto_139777 ) ) ( not ( = ?auto_139774 ?auto_139778 ) ) ( not ( = ?auto_139775 ?auto_139776 ) ) ( not ( = ?auto_139775 ?auto_139777 ) ) ( not ( = ?auto_139775 ?auto_139778 ) ) ( not ( = ?auto_139776 ?auto_139777 ) ) ( not ( = ?auto_139776 ?auto_139778 ) ) ( not ( = ?auto_139777 ?auto_139778 ) ) ( ON ?auto_139778 ?auto_139779 ) ( not ( = ?auto_139774 ?auto_139779 ) ) ( not ( = ?auto_139775 ?auto_139779 ) ) ( not ( = ?auto_139776 ?auto_139779 ) ) ( not ( = ?auto_139777 ?auto_139779 ) ) ( not ( = ?auto_139778 ?auto_139779 ) ) ( CLEAR ?auto_139776 ) ( ON ?auto_139777 ?auto_139778 ) ( CLEAR ?auto_139777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139780 ) ( ON ?auto_139782 ?auto_139780 ) ( ON ?auto_139781 ?auto_139782 ) ( ON ?auto_139779 ?auto_139781 ) ( not ( = ?auto_139780 ?auto_139782 ) ) ( not ( = ?auto_139780 ?auto_139781 ) ) ( not ( = ?auto_139780 ?auto_139779 ) ) ( not ( = ?auto_139780 ?auto_139778 ) ) ( not ( = ?auto_139780 ?auto_139777 ) ) ( not ( = ?auto_139782 ?auto_139781 ) ) ( not ( = ?auto_139782 ?auto_139779 ) ) ( not ( = ?auto_139782 ?auto_139778 ) ) ( not ( = ?auto_139782 ?auto_139777 ) ) ( not ( = ?auto_139781 ?auto_139779 ) ) ( not ( = ?auto_139781 ?auto_139778 ) ) ( not ( = ?auto_139781 ?auto_139777 ) ) ( not ( = ?auto_139774 ?auto_139780 ) ) ( not ( = ?auto_139774 ?auto_139782 ) ) ( not ( = ?auto_139774 ?auto_139781 ) ) ( not ( = ?auto_139775 ?auto_139780 ) ) ( not ( = ?auto_139775 ?auto_139782 ) ) ( not ( = ?auto_139775 ?auto_139781 ) ) ( not ( = ?auto_139776 ?auto_139780 ) ) ( not ( = ?auto_139776 ?auto_139782 ) ) ( not ( = ?auto_139776 ?auto_139781 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139780 ?auto_139782 ?auto_139781 ?auto_139779 ?auto_139778 )
      ( MAKE-5PILE ?auto_139774 ?auto_139775 ?auto_139776 ?auto_139777 ?auto_139778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139783 - BLOCK
      ?auto_139784 - BLOCK
      ?auto_139785 - BLOCK
      ?auto_139786 - BLOCK
      ?auto_139787 - BLOCK
    )
    :vars
    (
      ?auto_139791 - BLOCK
      ?auto_139789 - BLOCK
      ?auto_139790 - BLOCK
      ?auto_139788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139783 ) ( ON ?auto_139784 ?auto_139783 ) ( not ( = ?auto_139783 ?auto_139784 ) ) ( not ( = ?auto_139783 ?auto_139785 ) ) ( not ( = ?auto_139783 ?auto_139786 ) ) ( not ( = ?auto_139783 ?auto_139787 ) ) ( not ( = ?auto_139784 ?auto_139785 ) ) ( not ( = ?auto_139784 ?auto_139786 ) ) ( not ( = ?auto_139784 ?auto_139787 ) ) ( not ( = ?auto_139785 ?auto_139786 ) ) ( not ( = ?auto_139785 ?auto_139787 ) ) ( not ( = ?auto_139786 ?auto_139787 ) ) ( ON ?auto_139787 ?auto_139791 ) ( not ( = ?auto_139783 ?auto_139791 ) ) ( not ( = ?auto_139784 ?auto_139791 ) ) ( not ( = ?auto_139785 ?auto_139791 ) ) ( not ( = ?auto_139786 ?auto_139791 ) ) ( not ( = ?auto_139787 ?auto_139791 ) ) ( ON ?auto_139786 ?auto_139787 ) ( CLEAR ?auto_139786 ) ( ON-TABLE ?auto_139789 ) ( ON ?auto_139790 ?auto_139789 ) ( ON ?auto_139788 ?auto_139790 ) ( ON ?auto_139791 ?auto_139788 ) ( not ( = ?auto_139789 ?auto_139790 ) ) ( not ( = ?auto_139789 ?auto_139788 ) ) ( not ( = ?auto_139789 ?auto_139791 ) ) ( not ( = ?auto_139789 ?auto_139787 ) ) ( not ( = ?auto_139789 ?auto_139786 ) ) ( not ( = ?auto_139790 ?auto_139788 ) ) ( not ( = ?auto_139790 ?auto_139791 ) ) ( not ( = ?auto_139790 ?auto_139787 ) ) ( not ( = ?auto_139790 ?auto_139786 ) ) ( not ( = ?auto_139788 ?auto_139791 ) ) ( not ( = ?auto_139788 ?auto_139787 ) ) ( not ( = ?auto_139788 ?auto_139786 ) ) ( not ( = ?auto_139783 ?auto_139789 ) ) ( not ( = ?auto_139783 ?auto_139790 ) ) ( not ( = ?auto_139783 ?auto_139788 ) ) ( not ( = ?auto_139784 ?auto_139789 ) ) ( not ( = ?auto_139784 ?auto_139790 ) ) ( not ( = ?auto_139784 ?auto_139788 ) ) ( not ( = ?auto_139785 ?auto_139789 ) ) ( not ( = ?auto_139785 ?auto_139790 ) ) ( not ( = ?auto_139785 ?auto_139788 ) ) ( HOLDING ?auto_139785 ) ( CLEAR ?auto_139784 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139783 ?auto_139784 ?auto_139785 )
      ( MAKE-5PILE ?auto_139783 ?auto_139784 ?auto_139785 ?auto_139786 ?auto_139787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139792 - BLOCK
      ?auto_139793 - BLOCK
      ?auto_139794 - BLOCK
      ?auto_139795 - BLOCK
      ?auto_139796 - BLOCK
    )
    :vars
    (
      ?auto_139799 - BLOCK
      ?auto_139798 - BLOCK
      ?auto_139797 - BLOCK
      ?auto_139800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139792 ) ( ON ?auto_139793 ?auto_139792 ) ( not ( = ?auto_139792 ?auto_139793 ) ) ( not ( = ?auto_139792 ?auto_139794 ) ) ( not ( = ?auto_139792 ?auto_139795 ) ) ( not ( = ?auto_139792 ?auto_139796 ) ) ( not ( = ?auto_139793 ?auto_139794 ) ) ( not ( = ?auto_139793 ?auto_139795 ) ) ( not ( = ?auto_139793 ?auto_139796 ) ) ( not ( = ?auto_139794 ?auto_139795 ) ) ( not ( = ?auto_139794 ?auto_139796 ) ) ( not ( = ?auto_139795 ?auto_139796 ) ) ( ON ?auto_139796 ?auto_139799 ) ( not ( = ?auto_139792 ?auto_139799 ) ) ( not ( = ?auto_139793 ?auto_139799 ) ) ( not ( = ?auto_139794 ?auto_139799 ) ) ( not ( = ?auto_139795 ?auto_139799 ) ) ( not ( = ?auto_139796 ?auto_139799 ) ) ( ON ?auto_139795 ?auto_139796 ) ( ON-TABLE ?auto_139798 ) ( ON ?auto_139797 ?auto_139798 ) ( ON ?auto_139800 ?auto_139797 ) ( ON ?auto_139799 ?auto_139800 ) ( not ( = ?auto_139798 ?auto_139797 ) ) ( not ( = ?auto_139798 ?auto_139800 ) ) ( not ( = ?auto_139798 ?auto_139799 ) ) ( not ( = ?auto_139798 ?auto_139796 ) ) ( not ( = ?auto_139798 ?auto_139795 ) ) ( not ( = ?auto_139797 ?auto_139800 ) ) ( not ( = ?auto_139797 ?auto_139799 ) ) ( not ( = ?auto_139797 ?auto_139796 ) ) ( not ( = ?auto_139797 ?auto_139795 ) ) ( not ( = ?auto_139800 ?auto_139799 ) ) ( not ( = ?auto_139800 ?auto_139796 ) ) ( not ( = ?auto_139800 ?auto_139795 ) ) ( not ( = ?auto_139792 ?auto_139798 ) ) ( not ( = ?auto_139792 ?auto_139797 ) ) ( not ( = ?auto_139792 ?auto_139800 ) ) ( not ( = ?auto_139793 ?auto_139798 ) ) ( not ( = ?auto_139793 ?auto_139797 ) ) ( not ( = ?auto_139793 ?auto_139800 ) ) ( not ( = ?auto_139794 ?auto_139798 ) ) ( not ( = ?auto_139794 ?auto_139797 ) ) ( not ( = ?auto_139794 ?auto_139800 ) ) ( CLEAR ?auto_139793 ) ( ON ?auto_139794 ?auto_139795 ) ( CLEAR ?auto_139794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139798 ?auto_139797 ?auto_139800 ?auto_139799 ?auto_139796 ?auto_139795 )
      ( MAKE-5PILE ?auto_139792 ?auto_139793 ?auto_139794 ?auto_139795 ?auto_139796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139801 - BLOCK
      ?auto_139802 - BLOCK
      ?auto_139803 - BLOCK
      ?auto_139804 - BLOCK
      ?auto_139805 - BLOCK
    )
    :vars
    (
      ?auto_139806 - BLOCK
      ?auto_139807 - BLOCK
      ?auto_139808 - BLOCK
      ?auto_139809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139801 ) ( not ( = ?auto_139801 ?auto_139802 ) ) ( not ( = ?auto_139801 ?auto_139803 ) ) ( not ( = ?auto_139801 ?auto_139804 ) ) ( not ( = ?auto_139801 ?auto_139805 ) ) ( not ( = ?auto_139802 ?auto_139803 ) ) ( not ( = ?auto_139802 ?auto_139804 ) ) ( not ( = ?auto_139802 ?auto_139805 ) ) ( not ( = ?auto_139803 ?auto_139804 ) ) ( not ( = ?auto_139803 ?auto_139805 ) ) ( not ( = ?auto_139804 ?auto_139805 ) ) ( ON ?auto_139805 ?auto_139806 ) ( not ( = ?auto_139801 ?auto_139806 ) ) ( not ( = ?auto_139802 ?auto_139806 ) ) ( not ( = ?auto_139803 ?auto_139806 ) ) ( not ( = ?auto_139804 ?auto_139806 ) ) ( not ( = ?auto_139805 ?auto_139806 ) ) ( ON ?auto_139804 ?auto_139805 ) ( ON-TABLE ?auto_139807 ) ( ON ?auto_139808 ?auto_139807 ) ( ON ?auto_139809 ?auto_139808 ) ( ON ?auto_139806 ?auto_139809 ) ( not ( = ?auto_139807 ?auto_139808 ) ) ( not ( = ?auto_139807 ?auto_139809 ) ) ( not ( = ?auto_139807 ?auto_139806 ) ) ( not ( = ?auto_139807 ?auto_139805 ) ) ( not ( = ?auto_139807 ?auto_139804 ) ) ( not ( = ?auto_139808 ?auto_139809 ) ) ( not ( = ?auto_139808 ?auto_139806 ) ) ( not ( = ?auto_139808 ?auto_139805 ) ) ( not ( = ?auto_139808 ?auto_139804 ) ) ( not ( = ?auto_139809 ?auto_139806 ) ) ( not ( = ?auto_139809 ?auto_139805 ) ) ( not ( = ?auto_139809 ?auto_139804 ) ) ( not ( = ?auto_139801 ?auto_139807 ) ) ( not ( = ?auto_139801 ?auto_139808 ) ) ( not ( = ?auto_139801 ?auto_139809 ) ) ( not ( = ?auto_139802 ?auto_139807 ) ) ( not ( = ?auto_139802 ?auto_139808 ) ) ( not ( = ?auto_139802 ?auto_139809 ) ) ( not ( = ?auto_139803 ?auto_139807 ) ) ( not ( = ?auto_139803 ?auto_139808 ) ) ( not ( = ?auto_139803 ?auto_139809 ) ) ( ON ?auto_139803 ?auto_139804 ) ( CLEAR ?auto_139803 ) ( HOLDING ?auto_139802 ) ( CLEAR ?auto_139801 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139801 ?auto_139802 )
      ( MAKE-5PILE ?auto_139801 ?auto_139802 ?auto_139803 ?auto_139804 ?auto_139805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139810 - BLOCK
      ?auto_139811 - BLOCK
      ?auto_139812 - BLOCK
      ?auto_139813 - BLOCK
      ?auto_139814 - BLOCK
    )
    :vars
    (
      ?auto_139818 - BLOCK
      ?auto_139816 - BLOCK
      ?auto_139817 - BLOCK
      ?auto_139815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139810 ) ( not ( = ?auto_139810 ?auto_139811 ) ) ( not ( = ?auto_139810 ?auto_139812 ) ) ( not ( = ?auto_139810 ?auto_139813 ) ) ( not ( = ?auto_139810 ?auto_139814 ) ) ( not ( = ?auto_139811 ?auto_139812 ) ) ( not ( = ?auto_139811 ?auto_139813 ) ) ( not ( = ?auto_139811 ?auto_139814 ) ) ( not ( = ?auto_139812 ?auto_139813 ) ) ( not ( = ?auto_139812 ?auto_139814 ) ) ( not ( = ?auto_139813 ?auto_139814 ) ) ( ON ?auto_139814 ?auto_139818 ) ( not ( = ?auto_139810 ?auto_139818 ) ) ( not ( = ?auto_139811 ?auto_139818 ) ) ( not ( = ?auto_139812 ?auto_139818 ) ) ( not ( = ?auto_139813 ?auto_139818 ) ) ( not ( = ?auto_139814 ?auto_139818 ) ) ( ON ?auto_139813 ?auto_139814 ) ( ON-TABLE ?auto_139816 ) ( ON ?auto_139817 ?auto_139816 ) ( ON ?auto_139815 ?auto_139817 ) ( ON ?auto_139818 ?auto_139815 ) ( not ( = ?auto_139816 ?auto_139817 ) ) ( not ( = ?auto_139816 ?auto_139815 ) ) ( not ( = ?auto_139816 ?auto_139818 ) ) ( not ( = ?auto_139816 ?auto_139814 ) ) ( not ( = ?auto_139816 ?auto_139813 ) ) ( not ( = ?auto_139817 ?auto_139815 ) ) ( not ( = ?auto_139817 ?auto_139818 ) ) ( not ( = ?auto_139817 ?auto_139814 ) ) ( not ( = ?auto_139817 ?auto_139813 ) ) ( not ( = ?auto_139815 ?auto_139818 ) ) ( not ( = ?auto_139815 ?auto_139814 ) ) ( not ( = ?auto_139815 ?auto_139813 ) ) ( not ( = ?auto_139810 ?auto_139816 ) ) ( not ( = ?auto_139810 ?auto_139817 ) ) ( not ( = ?auto_139810 ?auto_139815 ) ) ( not ( = ?auto_139811 ?auto_139816 ) ) ( not ( = ?auto_139811 ?auto_139817 ) ) ( not ( = ?auto_139811 ?auto_139815 ) ) ( not ( = ?auto_139812 ?auto_139816 ) ) ( not ( = ?auto_139812 ?auto_139817 ) ) ( not ( = ?auto_139812 ?auto_139815 ) ) ( ON ?auto_139812 ?auto_139813 ) ( CLEAR ?auto_139810 ) ( ON ?auto_139811 ?auto_139812 ) ( CLEAR ?auto_139811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139816 ?auto_139817 ?auto_139815 ?auto_139818 ?auto_139814 ?auto_139813 ?auto_139812 )
      ( MAKE-5PILE ?auto_139810 ?auto_139811 ?auto_139812 ?auto_139813 ?auto_139814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139819 - BLOCK
      ?auto_139820 - BLOCK
      ?auto_139821 - BLOCK
      ?auto_139822 - BLOCK
      ?auto_139823 - BLOCK
    )
    :vars
    (
      ?auto_139825 - BLOCK
      ?auto_139826 - BLOCK
      ?auto_139824 - BLOCK
      ?auto_139827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139819 ?auto_139820 ) ) ( not ( = ?auto_139819 ?auto_139821 ) ) ( not ( = ?auto_139819 ?auto_139822 ) ) ( not ( = ?auto_139819 ?auto_139823 ) ) ( not ( = ?auto_139820 ?auto_139821 ) ) ( not ( = ?auto_139820 ?auto_139822 ) ) ( not ( = ?auto_139820 ?auto_139823 ) ) ( not ( = ?auto_139821 ?auto_139822 ) ) ( not ( = ?auto_139821 ?auto_139823 ) ) ( not ( = ?auto_139822 ?auto_139823 ) ) ( ON ?auto_139823 ?auto_139825 ) ( not ( = ?auto_139819 ?auto_139825 ) ) ( not ( = ?auto_139820 ?auto_139825 ) ) ( not ( = ?auto_139821 ?auto_139825 ) ) ( not ( = ?auto_139822 ?auto_139825 ) ) ( not ( = ?auto_139823 ?auto_139825 ) ) ( ON ?auto_139822 ?auto_139823 ) ( ON-TABLE ?auto_139826 ) ( ON ?auto_139824 ?auto_139826 ) ( ON ?auto_139827 ?auto_139824 ) ( ON ?auto_139825 ?auto_139827 ) ( not ( = ?auto_139826 ?auto_139824 ) ) ( not ( = ?auto_139826 ?auto_139827 ) ) ( not ( = ?auto_139826 ?auto_139825 ) ) ( not ( = ?auto_139826 ?auto_139823 ) ) ( not ( = ?auto_139826 ?auto_139822 ) ) ( not ( = ?auto_139824 ?auto_139827 ) ) ( not ( = ?auto_139824 ?auto_139825 ) ) ( not ( = ?auto_139824 ?auto_139823 ) ) ( not ( = ?auto_139824 ?auto_139822 ) ) ( not ( = ?auto_139827 ?auto_139825 ) ) ( not ( = ?auto_139827 ?auto_139823 ) ) ( not ( = ?auto_139827 ?auto_139822 ) ) ( not ( = ?auto_139819 ?auto_139826 ) ) ( not ( = ?auto_139819 ?auto_139824 ) ) ( not ( = ?auto_139819 ?auto_139827 ) ) ( not ( = ?auto_139820 ?auto_139826 ) ) ( not ( = ?auto_139820 ?auto_139824 ) ) ( not ( = ?auto_139820 ?auto_139827 ) ) ( not ( = ?auto_139821 ?auto_139826 ) ) ( not ( = ?auto_139821 ?auto_139824 ) ) ( not ( = ?auto_139821 ?auto_139827 ) ) ( ON ?auto_139821 ?auto_139822 ) ( ON ?auto_139820 ?auto_139821 ) ( CLEAR ?auto_139820 ) ( HOLDING ?auto_139819 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139819 )
      ( MAKE-5PILE ?auto_139819 ?auto_139820 ?auto_139821 ?auto_139822 ?auto_139823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139828 - BLOCK
      ?auto_139829 - BLOCK
      ?auto_139830 - BLOCK
      ?auto_139831 - BLOCK
      ?auto_139832 - BLOCK
    )
    :vars
    (
      ?auto_139834 - BLOCK
      ?auto_139835 - BLOCK
      ?auto_139836 - BLOCK
      ?auto_139833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139828 ?auto_139829 ) ) ( not ( = ?auto_139828 ?auto_139830 ) ) ( not ( = ?auto_139828 ?auto_139831 ) ) ( not ( = ?auto_139828 ?auto_139832 ) ) ( not ( = ?auto_139829 ?auto_139830 ) ) ( not ( = ?auto_139829 ?auto_139831 ) ) ( not ( = ?auto_139829 ?auto_139832 ) ) ( not ( = ?auto_139830 ?auto_139831 ) ) ( not ( = ?auto_139830 ?auto_139832 ) ) ( not ( = ?auto_139831 ?auto_139832 ) ) ( ON ?auto_139832 ?auto_139834 ) ( not ( = ?auto_139828 ?auto_139834 ) ) ( not ( = ?auto_139829 ?auto_139834 ) ) ( not ( = ?auto_139830 ?auto_139834 ) ) ( not ( = ?auto_139831 ?auto_139834 ) ) ( not ( = ?auto_139832 ?auto_139834 ) ) ( ON ?auto_139831 ?auto_139832 ) ( ON-TABLE ?auto_139835 ) ( ON ?auto_139836 ?auto_139835 ) ( ON ?auto_139833 ?auto_139836 ) ( ON ?auto_139834 ?auto_139833 ) ( not ( = ?auto_139835 ?auto_139836 ) ) ( not ( = ?auto_139835 ?auto_139833 ) ) ( not ( = ?auto_139835 ?auto_139834 ) ) ( not ( = ?auto_139835 ?auto_139832 ) ) ( not ( = ?auto_139835 ?auto_139831 ) ) ( not ( = ?auto_139836 ?auto_139833 ) ) ( not ( = ?auto_139836 ?auto_139834 ) ) ( not ( = ?auto_139836 ?auto_139832 ) ) ( not ( = ?auto_139836 ?auto_139831 ) ) ( not ( = ?auto_139833 ?auto_139834 ) ) ( not ( = ?auto_139833 ?auto_139832 ) ) ( not ( = ?auto_139833 ?auto_139831 ) ) ( not ( = ?auto_139828 ?auto_139835 ) ) ( not ( = ?auto_139828 ?auto_139836 ) ) ( not ( = ?auto_139828 ?auto_139833 ) ) ( not ( = ?auto_139829 ?auto_139835 ) ) ( not ( = ?auto_139829 ?auto_139836 ) ) ( not ( = ?auto_139829 ?auto_139833 ) ) ( not ( = ?auto_139830 ?auto_139835 ) ) ( not ( = ?auto_139830 ?auto_139836 ) ) ( not ( = ?auto_139830 ?auto_139833 ) ) ( ON ?auto_139830 ?auto_139831 ) ( ON ?auto_139829 ?auto_139830 ) ( ON ?auto_139828 ?auto_139829 ) ( CLEAR ?auto_139828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139835 ?auto_139836 ?auto_139833 ?auto_139834 ?auto_139832 ?auto_139831 ?auto_139830 ?auto_139829 )
      ( MAKE-5PILE ?auto_139828 ?auto_139829 ?auto_139830 ?auto_139831 ?auto_139832 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139840 - BLOCK
      ?auto_139841 - BLOCK
      ?auto_139842 - BLOCK
    )
    :vars
    (
      ?auto_139843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139843 ?auto_139842 ) ( CLEAR ?auto_139843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139840 ) ( ON ?auto_139841 ?auto_139840 ) ( ON ?auto_139842 ?auto_139841 ) ( not ( = ?auto_139840 ?auto_139841 ) ) ( not ( = ?auto_139840 ?auto_139842 ) ) ( not ( = ?auto_139840 ?auto_139843 ) ) ( not ( = ?auto_139841 ?auto_139842 ) ) ( not ( = ?auto_139841 ?auto_139843 ) ) ( not ( = ?auto_139842 ?auto_139843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139843 ?auto_139842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139844 - BLOCK
      ?auto_139845 - BLOCK
      ?auto_139846 - BLOCK
    )
    :vars
    (
      ?auto_139847 - BLOCK
      ?auto_139848 - BLOCK
      ?auto_139849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139847 ?auto_139846 ) ( CLEAR ?auto_139847 ) ( ON-TABLE ?auto_139844 ) ( ON ?auto_139845 ?auto_139844 ) ( ON ?auto_139846 ?auto_139845 ) ( not ( = ?auto_139844 ?auto_139845 ) ) ( not ( = ?auto_139844 ?auto_139846 ) ) ( not ( = ?auto_139844 ?auto_139847 ) ) ( not ( = ?auto_139845 ?auto_139846 ) ) ( not ( = ?auto_139845 ?auto_139847 ) ) ( not ( = ?auto_139846 ?auto_139847 ) ) ( HOLDING ?auto_139848 ) ( CLEAR ?auto_139849 ) ( not ( = ?auto_139844 ?auto_139848 ) ) ( not ( = ?auto_139844 ?auto_139849 ) ) ( not ( = ?auto_139845 ?auto_139848 ) ) ( not ( = ?auto_139845 ?auto_139849 ) ) ( not ( = ?auto_139846 ?auto_139848 ) ) ( not ( = ?auto_139846 ?auto_139849 ) ) ( not ( = ?auto_139847 ?auto_139848 ) ) ( not ( = ?auto_139847 ?auto_139849 ) ) ( not ( = ?auto_139848 ?auto_139849 ) ) )
    :subtasks
    ( ( !STACK ?auto_139848 ?auto_139849 )
      ( MAKE-3PILE ?auto_139844 ?auto_139845 ?auto_139846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139850 - BLOCK
      ?auto_139851 - BLOCK
      ?auto_139852 - BLOCK
    )
    :vars
    (
      ?auto_139853 - BLOCK
      ?auto_139854 - BLOCK
      ?auto_139855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139853 ?auto_139852 ) ( ON-TABLE ?auto_139850 ) ( ON ?auto_139851 ?auto_139850 ) ( ON ?auto_139852 ?auto_139851 ) ( not ( = ?auto_139850 ?auto_139851 ) ) ( not ( = ?auto_139850 ?auto_139852 ) ) ( not ( = ?auto_139850 ?auto_139853 ) ) ( not ( = ?auto_139851 ?auto_139852 ) ) ( not ( = ?auto_139851 ?auto_139853 ) ) ( not ( = ?auto_139852 ?auto_139853 ) ) ( CLEAR ?auto_139854 ) ( not ( = ?auto_139850 ?auto_139855 ) ) ( not ( = ?auto_139850 ?auto_139854 ) ) ( not ( = ?auto_139851 ?auto_139855 ) ) ( not ( = ?auto_139851 ?auto_139854 ) ) ( not ( = ?auto_139852 ?auto_139855 ) ) ( not ( = ?auto_139852 ?auto_139854 ) ) ( not ( = ?auto_139853 ?auto_139855 ) ) ( not ( = ?auto_139853 ?auto_139854 ) ) ( not ( = ?auto_139855 ?auto_139854 ) ) ( ON ?auto_139855 ?auto_139853 ) ( CLEAR ?auto_139855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139850 ?auto_139851 ?auto_139852 ?auto_139853 )
      ( MAKE-3PILE ?auto_139850 ?auto_139851 ?auto_139852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139856 - BLOCK
      ?auto_139857 - BLOCK
      ?auto_139858 - BLOCK
    )
    :vars
    (
      ?auto_139861 - BLOCK
      ?auto_139859 - BLOCK
      ?auto_139860 - BLOCK
      ?auto_139864 - BLOCK
      ?auto_139863 - BLOCK
      ?auto_139862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139861 ?auto_139858 ) ( ON-TABLE ?auto_139856 ) ( ON ?auto_139857 ?auto_139856 ) ( ON ?auto_139858 ?auto_139857 ) ( not ( = ?auto_139856 ?auto_139857 ) ) ( not ( = ?auto_139856 ?auto_139858 ) ) ( not ( = ?auto_139856 ?auto_139861 ) ) ( not ( = ?auto_139857 ?auto_139858 ) ) ( not ( = ?auto_139857 ?auto_139861 ) ) ( not ( = ?auto_139858 ?auto_139861 ) ) ( not ( = ?auto_139856 ?auto_139859 ) ) ( not ( = ?auto_139856 ?auto_139860 ) ) ( not ( = ?auto_139857 ?auto_139859 ) ) ( not ( = ?auto_139857 ?auto_139860 ) ) ( not ( = ?auto_139858 ?auto_139859 ) ) ( not ( = ?auto_139858 ?auto_139860 ) ) ( not ( = ?auto_139861 ?auto_139859 ) ) ( not ( = ?auto_139861 ?auto_139860 ) ) ( not ( = ?auto_139859 ?auto_139860 ) ) ( ON ?auto_139859 ?auto_139861 ) ( CLEAR ?auto_139859 ) ( HOLDING ?auto_139860 ) ( CLEAR ?auto_139864 ) ( ON-TABLE ?auto_139863 ) ( ON ?auto_139862 ?auto_139863 ) ( ON ?auto_139864 ?auto_139862 ) ( not ( = ?auto_139863 ?auto_139862 ) ) ( not ( = ?auto_139863 ?auto_139864 ) ) ( not ( = ?auto_139863 ?auto_139860 ) ) ( not ( = ?auto_139862 ?auto_139864 ) ) ( not ( = ?auto_139862 ?auto_139860 ) ) ( not ( = ?auto_139864 ?auto_139860 ) ) ( not ( = ?auto_139856 ?auto_139864 ) ) ( not ( = ?auto_139856 ?auto_139863 ) ) ( not ( = ?auto_139856 ?auto_139862 ) ) ( not ( = ?auto_139857 ?auto_139864 ) ) ( not ( = ?auto_139857 ?auto_139863 ) ) ( not ( = ?auto_139857 ?auto_139862 ) ) ( not ( = ?auto_139858 ?auto_139864 ) ) ( not ( = ?auto_139858 ?auto_139863 ) ) ( not ( = ?auto_139858 ?auto_139862 ) ) ( not ( = ?auto_139861 ?auto_139864 ) ) ( not ( = ?auto_139861 ?auto_139863 ) ) ( not ( = ?auto_139861 ?auto_139862 ) ) ( not ( = ?auto_139859 ?auto_139864 ) ) ( not ( = ?auto_139859 ?auto_139863 ) ) ( not ( = ?auto_139859 ?auto_139862 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139863 ?auto_139862 ?auto_139864 ?auto_139860 )
      ( MAKE-3PILE ?auto_139856 ?auto_139857 ?auto_139858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139865 - BLOCK
      ?auto_139866 - BLOCK
      ?auto_139867 - BLOCK
    )
    :vars
    (
      ?auto_139871 - BLOCK
      ?auto_139872 - BLOCK
      ?auto_139873 - BLOCK
      ?auto_139869 - BLOCK
      ?auto_139868 - BLOCK
      ?auto_139870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139871 ?auto_139867 ) ( ON-TABLE ?auto_139865 ) ( ON ?auto_139866 ?auto_139865 ) ( ON ?auto_139867 ?auto_139866 ) ( not ( = ?auto_139865 ?auto_139866 ) ) ( not ( = ?auto_139865 ?auto_139867 ) ) ( not ( = ?auto_139865 ?auto_139871 ) ) ( not ( = ?auto_139866 ?auto_139867 ) ) ( not ( = ?auto_139866 ?auto_139871 ) ) ( not ( = ?auto_139867 ?auto_139871 ) ) ( not ( = ?auto_139865 ?auto_139872 ) ) ( not ( = ?auto_139865 ?auto_139873 ) ) ( not ( = ?auto_139866 ?auto_139872 ) ) ( not ( = ?auto_139866 ?auto_139873 ) ) ( not ( = ?auto_139867 ?auto_139872 ) ) ( not ( = ?auto_139867 ?auto_139873 ) ) ( not ( = ?auto_139871 ?auto_139872 ) ) ( not ( = ?auto_139871 ?auto_139873 ) ) ( not ( = ?auto_139872 ?auto_139873 ) ) ( ON ?auto_139872 ?auto_139871 ) ( CLEAR ?auto_139869 ) ( ON-TABLE ?auto_139868 ) ( ON ?auto_139870 ?auto_139868 ) ( ON ?auto_139869 ?auto_139870 ) ( not ( = ?auto_139868 ?auto_139870 ) ) ( not ( = ?auto_139868 ?auto_139869 ) ) ( not ( = ?auto_139868 ?auto_139873 ) ) ( not ( = ?auto_139870 ?auto_139869 ) ) ( not ( = ?auto_139870 ?auto_139873 ) ) ( not ( = ?auto_139869 ?auto_139873 ) ) ( not ( = ?auto_139865 ?auto_139869 ) ) ( not ( = ?auto_139865 ?auto_139868 ) ) ( not ( = ?auto_139865 ?auto_139870 ) ) ( not ( = ?auto_139866 ?auto_139869 ) ) ( not ( = ?auto_139866 ?auto_139868 ) ) ( not ( = ?auto_139866 ?auto_139870 ) ) ( not ( = ?auto_139867 ?auto_139869 ) ) ( not ( = ?auto_139867 ?auto_139868 ) ) ( not ( = ?auto_139867 ?auto_139870 ) ) ( not ( = ?auto_139871 ?auto_139869 ) ) ( not ( = ?auto_139871 ?auto_139868 ) ) ( not ( = ?auto_139871 ?auto_139870 ) ) ( not ( = ?auto_139872 ?auto_139869 ) ) ( not ( = ?auto_139872 ?auto_139868 ) ) ( not ( = ?auto_139872 ?auto_139870 ) ) ( ON ?auto_139873 ?auto_139872 ) ( CLEAR ?auto_139873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139865 ?auto_139866 ?auto_139867 ?auto_139871 ?auto_139872 )
      ( MAKE-3PILE ?auto_139865 ?auto_139866 ?auto_139867 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139874 - BLOCK
      ?auto_139875 - BLOCK
      ?auto_139876 - BLOCK
    )
    :vars
    (
      ?auto_139878 - BLOCK
      ?auto_139882 - BLOCK
      ?auto_139879 - BLOCK
      ?auto_139880 - BLOCK
      ?auto_139881 - BLOCK
      ?auto_139877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139878 ?auto_139876 ) ( ON-TABLE ?auto_139874 ) ( ON ?auto_139875 ?auto_139874 ) ( ON ?auto_139876 ?auto_139875 ) ( not ( = ?auto_139874 ?auto_139875 ) ) ( not ( = ?auto_139874 ?auto_139876 ) ) ( not ( = ?auto_139874 ?auto_139878 ) ) ( not ( = ?auto_139875 ?auto_139876 ) ) ( not ( = ?auto_139875 ?auto_139878 ) ) ( not ( = ?auto_139876 ?auto_139878 ) ) ( not ( = ?auto_139874 ?auto_139882 ) ) ( not ( = ?auto_139874 ?auto_139879 ) ) ( not ( = ?auto_139875 ?auto_139882 ) ) ( not ( = ?auto_139875 ?auto_139879 ) ) ( not ( = ?auto_139876 ?auto_139882 ) ) ( not ( = ?auto_139876 ?auto_139879 ) ) ( not ( = ?auto_139878 ?auto_139882 ) ) ( not ( = ?auto_139878 ?auto_139879 ) ) ( not ( = ?auto_139882 ?auto_139879 ) ) ( ON ?auto_139882 ?auto_139878 ) ( ON-TABLE ?auto_139880 ) ( ON ?auto_139881 ?auto_139880 ) ( not ( = ?auto_139880 ?auto_139881 ) ) ( not ( = ?auto_139880 ?auto_139877 ) ) ( not ( = ?auto_139880 ?auto_139879 ) ) ( not ( = ?auto_139881 ?auto_139877 ) ) ( not ( = ?auto_139881 ?auto_139879 ) ) ( not ( = ?auto_139877 ?auto_139879 ) ) ( not ( = ?auto_139874 ?auto_139877 ) ) ( not ( = ?auto_139874 ?auto_139880 ) ) ( not ( = ?auto_139874 ?auto_139881 ) ) ( not ( = ?auto_139875 ?auto_139877 ) ) ( not ( = ?auto_139875 ?auto_139880 ) ) ( not ( = ?auto_139875 ?auto_139881 ) ) ( not ( = ?auto_139876 ?auto_139877 ) ) ( not ( = ?auto_139876 ?auto_139880 ) ) ( not ( = ?auto_139876 ?auto_139881 ) ) ( not ( = ?auto_139878 ?auto_139877 ) ) ( not ( = ?auto_139878 ?auto_139880 ) ) ( not ( = ?auto_139878 ?auto_139881 ) ) ( not ( = ?auto_139882 ?auto_139877 ) ) ( not ( = ?auto_139882 ?auto_139880 ) ) ( not ( = ?auto_139882 ?auto_139881 ) ) ( ON ?auto_139879 ?auto_139882 ) ( CLEAR ?auto_139879 ) ( HOLDING ?auto_139877 ) ( CLEAR ?auto_139881 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139880 ?auto_139881 ?auto_139877 )
      ( MAKE-3PILE ?auto_139874 ?auto_139875 ?auto_139876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139883 - BLOCK
      ?auto_139884 - BLOCK
      ?auto_139885 - BLOCK
    )
    :vars
    (
      ?auto_139890 - BLOCK
      ?auto_139888 - BLOCK
      ?auto_139891 - BLOCK
      ?auto_139889 - BLOCK
      ?auto_139887 - BLOCK
      ?auto_139886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139890 ?auto_139885 ) ( ON-TABLE ?auto_139883 ) ( ON ?auto_139884 ?auto_139883 ) ( ON ?auto_139885 ?auto_139884 ) ( not ( = ?auto_139883 ?auto_139884 ) ) ( not ( = ?auto_139883 ?auto_139885 ) ) ( not ( = ?auto_139883 ?auto_139890 ) ) ( not ( = ?auto_139884 ?auto_139885 ) ) ( not ( = ?auto_139884 ?auto_139890 ) ) ( not ( = ?auto_139885 ?auto_139890 ) ) ( not ( = ?auto_139883 ?auto_139888 ) ) ( not ( = ?auto_139883 ?auto_139891 ) ) ( not ( = ?auto_139884 ?auto_139888 ) ) ( not ( = ?auto_139884 ?auto_139891 ) ) ( not ( = ?auto_139885 ?auto_139888 ) ) ( not ( = ?auto_139885 ?auto_139891 ) ) ( not ( = ?auto_139890 ?auto_139888 ) ) ( not ( = ?auto_139890 ?auto_139891 ) ) ( not ( = ?auto_139888 ?auto_139891 ) ) ( ON ?auto_139888 ?auto_139890 ) ( ON-TABLE ?auto_139889 ) ( ON ?auto_139887 ?auto_139889 ) ( not ( = ?auto_139889 ?auto_139887 ) ) ( not ( = ?auto_139889 ?auto_139886 ) ) ( not ( = ?auto_139889 ?auto_139891 ) ) ( not ( = ?auto_139887 ?auto_139886 ) ) ( not ( = ?auto_139887 ?auto_139891 ) ) ( not ( = ?auto_139886 ?auto_139891 ) ) ( not ( = ?auto_139883 ?auto_139886 ) ) ( not ( = ?auto_139883 ?auto_139889 ) ) ( not ( = ?auto_139883 ?auto_139887 ) ) ( not ( = ?auto_139884 ?auto_139886 ) ) ( not ( = ?auto_139884 ?auto_139889 ) ) ( not ( = ?auto_139884 ?auto_139887 ) ) ( not ( = ?auto_139885 ?auto_139886 ) ) ( not ( = ?auto_139885 ?auto_139889 ) ) ( not ( = ?auto_139885 ?auto_139887 ) ) ( not ( = ?auto_139890 ?auto_139886 ) ) ( not ( = ?auto_139890 ?auto_139889 ) ) ( not ( = ?auto_139890 ?auto_139887 ) ) ( not ( = ?auto_139888 ?auto_139886 ) ) ( not ( = ?auto_139888 ?auto_139889 ) ) ( not ( = ?auto_139888 ?auto_139887 ) ) ( ON ?auto_139891 ?auto_139888 ) ( CLEAR ?auto_139887 ) ( ON ?auto_139886 ?auto_139891 ) ( CLEAR ?auto_139886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139883 ?auto_139884 ?auto_139885 ?auto_139890 ?auto_139888 ?auto_139891 )
      ( MAKE-3PILE ?auto_139883 ?auto_139884 ?auto_139885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139892 - BLOCK
      ?auto_139893 - BLOCK
      ?auto_139894 - BLOCK
    )
    :vars
    (
      ?auto_139900 - BLOCK
      ?auto_139899 - BLOCK
      ?auto_139896 - BLOCK
      ?auto_139895 - BLOCK
      ?auto_139897 - BLOCK
      ?auto_139898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139900 ?auto_139894 ) ( ON-TABLE ?auto_139892 ) ( ON ?auto_139893 ?auto_139892 ) ( ON ?auto_139894 ?auto_139893 ) ( not ( = ?auto_139892 ?auto_139893 ) ) ( not ( = ?auto_139892 ?auto_139894 ) ) ( not ( = ?auto_139892 ?auto_139900 ) ) ( not ( = ?auto_139893 ?auto_139894 ) ) ( not ( = ?auto_139893 ?auto_139900 ) ) ( not ( = ?auto_139894 ?auto_139900 ) ) ( not ( = ?auto_139892 ?auto_139899 ) ) ( not ( = ?auto_139892 ?auto_139896 ) ) ( not ( = ?auto_139893 ?auto_139899 ) ) ( not ( = ?auto_139893 ?auto_139896 ) ) ( not ( = ?auto_139894 ?auto_139899 ) ) ( not ( = ?auto_139894 ?auto_139896 ) ) ( not ( = ?auto_139900 ?auto_139899 ) ) ( not ( = ?auto_139900 ?auto_139896 ) ) ( not ( = ?auto_139899 ?auto_139896 ) ) ( ON ?auto_139899 ?auto_139900 ) ( ON-TABLE ?auto_139895 ) ( not ( = ?auto_139895 ?auto_139897 ) ) ( not ( = ?auto_139895 ?auto_139898 ) ) ( not ( = ?auto_139895 ?auto_139896 ) ) ( not ( = ?auto_139897 ?auto_139898 ) ) ( not ( = ?auto_139897 ?auto_139896 ) ) ( not ( = ?auto_139898 ?auto_139896 ) ) ( not ( = ?auto_139892 ?auto_139898 ) ) ( not ( = ?auto_139892 ?auto_139895 ) ) ( not ( = ?auto_139892 ?auto_139897 ) ) ( not ( = ?auto_139893 ?auto_139898 ) ) ( not ( = ?auto_139893 ?auto_139895 ) ) ( not ( = ?auto_139893 ?auto_139897 ) ) ( not ( = ?auto_139894 ?auto_139898 ) ) ( not ( = ?auto_139894 ?auto_139895 ) ) ( not ( = ?auto_139894 ?auto_139897 ) ) ( not ( = ?auto_139900 ?auto_139898 ) ) ( not ( = ?auto_139900 ?auto_139895 ) ) ( not ( = ?auto_139900 ?auto_139897 ) ) ( not ( = ?auto_139899 ?auto_139898 ) ) ( not ( = ?auto_139899 ?auto_139895 ) ) ( not ( = ?auto_139899 ?auto_139897 ) ) ( ON ?auto_139896 ?auto_139899 ) ( ON ?auto_139898 ?auto_139896 ) ( CLEAR ?auto_139898 ) ( HOLDING ?auto_139897 ) ( CLEAR ?auto_139895 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139895 ?auto_139897 )
      ( MAKE-3PILE ?auto_139892 ?auto_139893 ?auto_139894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141759 - BLOCK
      ?auto_141760 - BLOCK
      ?auto_141761 - BLOCK
    )
    :vars
    (
      ?auto_141765 - BLOCK
      ?auto_141764 - BLOCK
      ?auto_141762 - BLOCK
      ?auto_141763 - BLOCK
      ?auto_141766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141765 ?auto_141761 ) ( ON-TABLE ?auto_141759 ) ( ON ?auto_141760 ?auto_141759 ) ( ON ?auto_141761 ?auto_141760 ) ( not ( = ?auto_141759 ?auto_141760 ) ) ( not ( = ?auto_141759 ?auto_141761 ) ) ( not ( = ?auto_141759 ?auto_141765 ) ) ( not ( = ?auto_141760 ?auto_141761 ) ) ( not ( = ?auto_141760 ?auto_141765 ) ) ( not ( = ?auto_141761 ?auto_141765 ) ) ( not ( = ?auto_141759 ?auto_141764 ) ) ( not ( = ?auto_141759 ?auto_141762 ) ) ( not ( = ?auto_141760 ?auto_141764 ) ) ( not ( = ?auto_141760 ?auto_141762 ) ) ( not ( = ?auto_141761 ?auto_141764 ) ) ( not ( = ?auto_141761 ?auto_141762 ) ) ( not ( = ?auto_141765 ?auto_141764 ) ) ( not ( = ?auto_141765 ?auto_141762 ) ) ( not ( = ?auto_141764 ?auto_141762 ) ) ( ON ?auto_141764 ?auto_141765 ) ( not ( = ?auto_141763 ?auto_141766 ) ) ( not ( = ?auto_141763 ?auto_141762 ) ) ( not ( = ?auto_141766 ?auto_141762 ) ) ( not ( = ?auto_141759 ?auto_141766 ) ) ( not ( = ?auto_141759 ?auto_141763 ) ) ( not ( = ?auto_141760 ?auto_141766 ) ) ( not ( = ?auto_141760 ?auto_141763 ) ) ( not ( = ?auto_141761 ?auto_141766 ) ) ( not ( = ?auto_141761 ?auto_141763 ) ) ( not ( = ?auto_141765 ?auto_141766 ) ) ( not ( = ?auto_141765 ?auto_141763 ) ) ( not ( = ?auto_141764 ?auto_141766 ) ) ( not ( = ?auto_141764 ?auto_141763 ) ) ( ON ?auto_141762 ?auto_141764 ) ( ON ?auto_141766 ?auto_141762 ) ( ON ?auto_141763 ?auto_141766 ) ( CLEAR ?auto_141763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141759 ?auto_141760 ?auto_141761 ?auto_141765 ?auto_141764 ?auto_141762 ?auto_141766 )
      ( MAKE-3PILE ?auto_141759 ?auto_141760 ?auto_141761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139910 - BLOCK
      ?auto_139911 - BLOCK
      ?auto_139912 - BLOCK
    )
    :vars
    (
      ?auto_139916 - BLOCK
      ?auto_139914 - BLOCK
      ?auto_139918 - BLOCK
      ?auto_139915 - BLOCK
      ?auto_139913 - BLOCK
      ?auto_139917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139916 ?auto_139912 ) ( ON-TABLE ?auto_139910 ) ( ON ?auto_139911 ?auto_139910 ) ( ON ?auto_139912 ?auto_139911 ) ( not ( = ?auto_139910 ?auto_139911 ) ) ( not ( = ?auto_139910 ?auto_139912 ) ) ( not ( = ?auto_139910 ?auto_139916 ) ) ( not ( = ?auto_139911 ?auto_139912 ) ) ( not ( = ?auto_139911 ?auto_139916 ) ) ( not ( = ?auto_139912 ?auto_139916 ) ) ( not ( = ?auto_139910 ?auto_139914 ) ) ( not ( = ?auto_139910 ?auto_139918 ) ) ( not ( = ?auto_139911 ?auto_139914 ) ) ( not ( = ?auto_139911 ?auto_139918 ) ) ( not ( = ?auto_139912 ?auto_139914 ) ) ( not ( = ?auto_139912 ?auto_139918 ) ) ( not ( = ?auto_139916 ?auto_139914 ) ) ( not ( = ?auto_139916 ?auto_139918 ) ) ( not ( = ?auto_139914 ?auto_139918 ) ) ( ON ?auto_139914 ?auto_139916 ) ( not ( = ?auto_139915 ?auto_139913 ) ) ( not ( = ?auto_139915 ?auto_139917 ) ) ( not ( = ?auto_139915 ?auto_139918 ) ) ( not ( = ?auto_139913 ?auto_139917 ) ) ( not ( = ?auto_139913 ?auto_139918 ) ) ( not ( = ?auto_139917 ?auto_139918 ) ) ( not ( = ?auto_139910 ?auto_139917 ) ) ( not ( = ?auto_139910 ?auto_139915 ) ) ( not ( = ?auto_139910 ?auto_139913 ) ) ( not ( = ?auto_139911 ?auto_139917 ) ) ( not ( = ?auto_139911 ?auto_139915 ) ) ( not ( = ?auto_139911 ?auto_139913 ) ) ( not ( = ?auto_139912 ?auto_139917 ) ) ( not ( = ?auto_139912 ?auto_139915 ) ) ( not ( = ?auto_139912 ?auto_139913 ) ) ( not ( = ?auto_139916 ?auto_139917 ) ) ( not ( = ?auto_139916 ?auto_139915 ) ) ( not ( = ?auto_139916 ?auto_139913 ) ) ( not ( = ?auto_139914 ?auto_139917 ) ) ( not ( = ?auto_139914 ?auto_139915 ) ) ( not ( = ?auto_139914 ?auto_139913 ) ) ( ON ?auto_139918 ?auto_139914 ) ( ON ?auto_139917 ?auto_139918 ) ( ON ?auto_139913 ?auto_139917 ) ( CLEAR ?auto_139913 ) ( HOLDING ?auto_139915 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139915 )
      ( MAKE-3PILE ?auto_139910 ?auto_139911 ?auto_139912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139919 - BLOCK
      ?auto_139920 - BLOCK
      ?auto_139921 - BLOCK
    )
    :vars
    (
      ?auto_139923 - BLOCK
      ?auto_139925 - BLOCK
      ?auto_139927 - BLOCK
      ?auto_139924 - BLOCK
      ?auto_139922 - BLOCK
      ?auto_139926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139923 ?auto_139921 ) ( ON-TABLE ?auto_139919 ) ( ON ?auto_139920 ?auto_139919 ) ( ON ?auto_139921 ?auto_139920 ) ( not ( = ?auto_139919 ?auto_139920 ) ) ( not ( = ?auto_139919 ?auto_139921 ) ) ( not ( = ?auto_139919 ?auto_139923 ) ) ( not ( = ?auto_139920 ?auto_139921 ) ) ( not ( = ?auto_139920 ?auto_139923 ) ) ( not ( = ?auto_139921 ?auto_139923 ) ) ( not ( = ?auto_139919 ?auto_139925 ) ) ( not ( = ?auto_139919 ?auto_139927 ) ) ( not ( = ?auto_139920 ?auto_139925 ) ) ( not ( = ?auto_139920 ?auto_139927 ) ) ( not ( = ?auto_139921 ?auto_139925 ) ) ( not ( = ?auto_139921 ?auto_139927 ) ) ( not ( = ?auto_139923 ?auto_139925 ) ) ( not ( = ?auto_139923 ?auto_139927 ) ) ( not ( = ?auto_139925 ?auto_139927 ) ) ( ON ?auto_139925 ?auto_139923 ) ( not ( = ?auto_139924 ?auto_139922 ) ) ( not ( = ?auto_139924 ?auto_139926 ) ) ( not ( = ?auto_139924 ?auto_139927 ) ) ( not ( = ?auto_139922 ?auto_139926 ) ) ( not ( = ?auto_139922 ?auto_139927 ) ) ( not ( = ?auto_139926 ?auto_139927 ) ) ( not ( = ?auto_139919 ?auto_139926 ) ) ( not ( = ?auto_139919 ?auto_139924 ) ) ( not ( = ?auto_139919 ?auto_139922 ) ) ( not ( = ?auto_139920 ?auto_139926 ) ) ( not ( = ?auto_139920 ?auto_139924 ) ) ( not ( = ?auto_139920 ?auto_139922 ) ) ( not ( = ?auto_139921 ?auto_139926 ) ) ( not ( = ?auto_139921 ?auto_139924 ) ) ( not ( = ?auto_139921 ?auto_139922 ) ) ( not ( = ?auto_139923 ?auto_139926 ) ) ( not ( = ?auto_139923 ?auto_139924 ) ) ( not ( = ?auto_139923 ?auto_139922 ) ) ( not ( = ?auto_139925 ?auto_139926 ) ) ( not ( = ?auto_139925 ?auto_139924 ) ) ( not ( = ?auto_139925 ?auto_139922 ) ) ( ON ?auto_139927 ?auto_139925 ) ( ON ?auto_139926 ?auto_139927 ) ( ON ?auto_139922 ?auto_139926 ) ( ON ?auto_139924 ?auto_139922 ) ( CLEAR ?auto_139924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139919 ?auto_139920 ?auto_139921 ?auto_139923 ?auto_139925 ?auto_139927 ?auto_139926 ?auto_139922 )
      ( MAKE-3PILE ?auto_139919 ?auto_139920 ?auto_139921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139934 - BLOCK
      ?auto_139935 - BLOCK
      ?auto_139936 - BLOCK
      ?auto_139937 - BLOCK
      ?auto_139938 - BLOCK
      ?auto_139939 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139939 ) ( CLEAR ?auto_139938 ) ( ON-TABLE ?auto_139934 ) ( ON ?auto_139935 ?auto_139934 ) ( ON ?auto_139936 ?auto_139935 ) ( ON ?auto_139937 ?auto_139936 ) ( ON ?auto_139938 ?auto_139937 ) ( not ( = ?auto_139934 ?auto_139935 ) ) ( not ( = ?auto_139934 ?auto_139936 ) ) ( not ( = ?auto_139934 ?auto_139937 ) ) ( not ( = ?auto_139934 ?auto_139938 ) ) ( not ( = ?auto_139934 ?auto_139939 ) ) ( not ( = ?auto_139935 ?auto_139936 ) ) ( not ( = ?auto_139935 ?auto_139937 ) ) ( not ( = ?auto_139935 ?auto_139938 ) ) ( not ( = ?auto_139935 ?auto_139939 ) ) ( not ( = ?auto_139936 ?auto_139937 ) ) ( not ( = ?auto_139936 ?auto_139938 ) ) ( not ( = ?auto_139936 ?auto_139939 ) ) ( not ( = ?auto_139937 ?auto_139938 ) ) ( not ( = ?auto_139937 ?auto_139939 ) ) ( not ( = ?auto_139938 ?auto_139939 ) ) )
    :subtasks
    ( ( !STACK ?auto_139939 ?auto_139938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139940 - BLOCK
      ?auto_139941 - BLOCK
      ?auto_139942 - BLOCK
      ?auto_139943 - BLOCK
      ?auto_139944 - BLOCK
      ?auto_139945 - BLOCK
    )
    :vars
    (
      ?auto_139946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139944 ) ( ON-TABLE ?auto_139940 ) ( ON ?auto_139941 ?auto_139940 ) ( ON ?auto_139942 ?auto_139941 ) ( ON ?auto_139943 ?auto_139942 ) ( ON ?auto_139944 ?auto_139943 ) ( not ( = ?auto_139940 ?auto_139941 ) ) ( not ( = ?auto_139940 ?auto_139942 ) ) ( not ( = ?auto_139940 ?auto_139943 ) ) ( not ( = ?auto_139940 ?auto_139944 ) ) ( not ( = ?auto_139940 ?auto_139945 ) ) ( not ( = ?auto_139941 ?auto_139942 ) ) ( not ( = ?auto_139941 ?auto_139943 ) ) ( not ( = ?auto_139941 ?auto_139944 ) ) ( not ( = ?auto_139941 ?auto_139945 ) ) ( not ( = ?auto_139942 ?auto_139943 ) ) ( not ( = ?auto_139942 ?auto_139944 ) ) ( not ( = ?auto_139942 ?auto_139945 ) ) ( not ( = ?auto_139943 ?auto_139944 ) ) ( not ( = ?auto_139943 ?auto_139945 ) ) ( not ( = ?auto_139944 ?auto_139945 ) ) ( ON ?auto_139945 ?auto_139946 ) ( CLEAR ?auto_139945 ) ( HAND-EMPTY ) ( not ( = ?auto_139940 ?auto_139946 ) ) ( not ( = ?auto_139941 ?auto_139946 ) ) ( not ( = ?auto_139942 ?auto_139946 ) ) ( not ( = ?auto_139943 ?auto_139946 ) ) ( not ( = ?auto_139944 ?auto_139946 ) ) ( not ( = ?auto_139945 ?auto_139946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139945 ?auto_139946 )
      ( MAKE-6PILE ?auto_139940 ?auto_139941 ?auto_139942 ?auto_139943 ?auto_139944 ?auto_139945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139947 - BLOCK
      ?auto_139948 - BLOCK
      ?auto_139949 - BLOCK
      ?auto_139950 - BLOCK
      ?auto_139951 - BLOCK
      ?auto_139952 - BLOCK
    )
    :vars
    (
      ?auto_139953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139947 ) ( ON ?auto_139948 ?auto_139947 ) ( ON ?auto_139949 ?auto_139948 ) ( ON ?auto_139950 ?auto_139949 ) ( not ( = ?auto_139947 ?auto_139948 ) ) ( not ( = ?auto_139947 ?auto_139949 ) ) ( not ( = ?auto_139947 ?auto_139950 ) ) ( not ( = ?auto_139947 ?auto_139951 ) ) ( not ( = ?auto_139947 ?auto_139952 ) ) ( not ( = ?auto_139948 ?auto_139949 ) ) ( not ( = ?auto_139948 ?auto_139950 ) ) ( not ( = ?auto_139948 ?auto_139951 ) ) ( not ( = ?auto_139948 ?auto_139952 ) ) ( not ( = ?auto_139949 ?auto_139950 ) ) ( not ( = ?auto_139949 ?auto_139951 ) ) ( not ( = ?auto_139949 ?auto_139952 ) ) ( not ( = ?auto_139950 ?auto_139951 ) ) ( not ( = ?auto_139950 ?auto_139952 ) ) ( not ( = ?auto_139951 ?auto_139952 ) ) ( ON ?auto_139952 ?auto_139953 ) ( CLEAR ?auto_139952 ) ( not ( = ?auto_139947 ?auto_139953 ) ) ( not ( = ?auto_139948 ?auto_139953 ) ) ( not ( = ?auto_139949 ?auto_139953 ) ) ( not ( = ?auto_139950 ?auto_139953 ) ) ( not ( = ?auto_139951 ?auto_139953 ) ) ( not ( = ?auto_139952 ?auto_139953 ) ) ( HOLDING ?auto_139951 ) ( CLEAR ?auto_139950 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139947 ?auto_139948 ?auto_139949 ?auto_139950 ?auto_139951 )
      ( MAKE-6PILE ?auto_139947 ?auto_139948 ?auto_139949 ?auto_139950 ?auto_139951 ?auto_139952 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139954 - BLOCK
      ?auto_139955 - BLOCK
      ?auto_139956 - BLOCK
      ?auto_139957 - BLOCK
      ?auto_139958 - BLOCK
      ?auto_139959 - BLOCK
    )
    :vars
    (
      ?auto_139960 - BLOCK
      ?auto_139961 - BLOCK
      ?auto_139962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139954 ) ( ON ?auto_139955 ?auto_139954 ) ( ON ?auto_139956 ?auto_139955 ) ( ON ?auto_139957 ?auto_139956 ) ( not ( = ?auto_139954 ?auto_139955 ) ) ( not ( = ?auto_139954 ?auto_139956 ) ) ( not ( = ?auto_139954 ?auto_139957 ) ) ( not ( = ?auto_139954 ?auto_139958 ) ) ( not ( = ?auto_139954 ?auto_139959 ) ) ( not ( = ?auto_139955 ?auto_139956 ) ) ( not ( = ?auto_139955 ?auto_139957 ) ) ( not ( = ?auto_139955 ?auto_139958 ) ) ( not ( = ?auto_139955 ?auto_139959 ) ) ( not ( = ?auto_139956 ?auto_139957 ) ) ( not ( = ?auto_139956 ?auto_139958 ) ) ( not ( = ?auto_139956 ?auto_139959 ) ) ( not ( = ?auto_139957 ?auto_139958 ) ) ( not ( = ?auto_139957 ?auto_139959 ) ) ( not ( = ?auto_139958 ?auto_139959 ) ) ( ON ?auto_139959 ?auto_139960 ) ( not ( = ?auto_139954 ?auto_139960 ) ) ( not ( = ?auto_139955 ?auto_139960 ) ) ( not ( = ?auto_139956 ?auto_139960 ) ) ( not ( = ?auto_139957 ?auto_139960 ) ) ( not ( = ?auto_139958 ?auto_139960 ) ) ( not ( = ?auto_139959 ?auto_139960 ) ) ( CLEAR ?auto_139957 ) ( ON ?auto_139958 ?auto_139959 ) ( CLEAR ?auto_139958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139961 ) ( ON ?auto_139962 ?auto_139961 ) ( ON ?auto_139960 ?auto_139962 ) ( not ( = ?auto_139961 ?auto_139962 ) ) ( not ( = ?auto_139961 ?auto_139960 ) ) ( not ( = ?auto_139961 ?auto_139959 ) ) ( not ( = ?auto_139961 ?auto_139958 ) ) ( not ( = ?auto_139962 ?auto_139960 ) ) ( not ( = ?auto_139962 ?auto_139959 ) ) ( not ( = ?auto_139962 ?auto_139958 ) ) ( not ( = ?auto_139954 ?auto_139961 ) ) ( not ( = ?auto_139954 ?auto_139962 ) ) ( not ( = ?auto_139955 ?auto_139961 ) ) ( not ( = ?auto_139955 ?auto_139962 ) ) ( not ( = ?auto_139956 ?auto_139961 ) ) ( not ( = ?auto_139956 ?auto_139962 ) ) ( not ( = ?auto_139957 ?auto_139961 ) ) ( not ( = ?auto_139957 ?auto_139962 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139961 ?auto_139962 ?auto_139960 ?auto_139959 )
      ( MAKE-6PILE ?auto_139954 ?auto_139955 ?auto_139956 ?auto_139957 ?auto_139958 ?auto_139959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139963 - BLOCK
      ?auto_139964 - BLOCK
      ?auto_139965 - BLOCK
      ?auto_139966 - BLOCK
      ?auto_139967 - BLOCK
      ?auto_139968 - BLOCK
    )
    :vars
    (
      ?auto_139971 - BLOCK
      ?auto_139969 - BLOCK
      ?auto_139970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139963 ) ( ON ?auto_139964 ?auto_139963 ) ( ON ?auto_139965 ?auto_139964 ) ( not ( = ?auto_139963 ?auto_139964 ) ) ( not ( = ?auto_139963 ?auto_139965 ) ) ( not ( = ?auto_139963 ?auto_139966 ) ) ( not ( = ?auto_139963 ?auto_139967 ) ) ( not ( = ?auto_139963 ?auto_139968 ) ) ( not ( = ?auto_139964 ?auto_139965 ) ) ( not ( = ?auto_139964 ?auto_139966 ) ) ( not ( = ?auto_139964 ?auto_139967 ) ) ( not ( = ?auto_139964 ?auto_139968 ) ) ( not ( = ?auto_139965 ?auto_139966 ) ) ( not ( = ?auto_139965 ?auto_139967 ) ) ( not ( = ?auto_139965 ?auto_139968 ) ) ( not ( = ?auto_139966 ?auto_139967 ) ) ( not ( = ?auto_139966 ?auto_139968 ) ) ( not ( = ?auto_139967 ?auto_139968 ) ) ( ON ?auto_139968 ?auto_139971 ) ( not ( = ?auto_139963 ?auto_139971 ) ) ( not ( = ?auto_139964 ?auto_139971 ) ) ( not ( = ?auto_139965 ?auto_139971 ) ) ( not ( = ?auto_139966 ?auto_139971 ) ) ( not ( = ?auto_139967 ?auto_139971 ) ) ( not ( = ?auto_139968 ?auto_139971 ) ) ( ON ?auto_139967 ?auto_139968 ) ( CLEAR ?auto_139967 ) ( ON-TABLE ?auto_139969 ) ( ON ?auto_139970 ?auto_139969 ) ( ON ?auto_139971 ?auto_139970 ) ( not ( = ?auto_139969 ?auto_139970 ) ) ( not ( = ?auto_139969 ?auto_139971 ) ) ( not ( = ?auto_139969 ?auto_139968 ) ) ( not ( = ?auto_139969 ?auto_139967 ) ) ( not ( = ?auto_139970 ?auto_139971 ) ) ( not ( = ?auto_139970 ?auto_139968 ) ) ( not ( = ?auto_139970 ?auto_139967 ) ) ( not ( = ?auto_139963 ?auto_139969 ) ) ( not ( = ?auto_139963 ?auto_139970 ) ) ( not ( = ?auto_139964 ?auto_139969 ) ) ( not ( = ?auto_139964 ?auto_139970 ) ) ( not ( = ?auto_139965 ?auto_139969 ) ) ( not ( = ?auto_139965 ?auto_139970 ) ) ( not ( = ?auto_139966 ?auto_139969 ) ) ( not ( = ?auto_139966 ?auto_139970 ) ) ( HOLDING ?auto_139966 ) ( CLEAR ?auto_139965 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139963 ?auto_139964 ?auto_139965 ?auto_139966 )
      ( MAKE-6PILE ?auto_139963 ?auto_139964 ?auto_139965 ?auto_139966 ?auto_139967 ?auto_139968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139972 - BLOCK
      ?auto_139973 - BLOCK
      ?auto_139974 - BLOCK
      ?auto_139975 - BLOCK
      ?auto_139976 - BLOCK
      ?auto_139977 - BLOCK
    )
    :vars
    (
      ?auto_139979 - BLOCK
      ?auto_139980 - BLOCK
      ?auto_139978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139972 ) ( ON ?auto_139973 ?auto_139972 ) ( ON ?auto_139974 ?auto_139973 ) ( not ( = ?auto_139972 ?auto_139973 ) ) ( not ( = ?auto_139972 ?auto_139974 ) ) ( not ( = ?auto_139972 ?auto_139975 ) ) ( not ( = ?auto_139972 ?auto_139976 ) ) ( not ( = ?auto_139972 ?auto_139977 ) ) ( not ( = ?auto_139973 ?auto_139974 ) ) ( not ( = ?auto_139973 ?auto_139975 ) ) ( not ( = ?auto_139973 ?auto_139976 ) ) ( not ( = ?auto_139973 ?auto_139977 ) ) ( not ( = ?auto_139974 ?auto_139975 ) ) ( not ( = ?auto_139974 ?auto_139976 ) ) ( not ( = ?auto_139974 ?auto_139977 ) ) ( not ( = ?auto_139975 ?auto_139976 ) ) ( not ( = ?auto_139975 ?auto_139977 ) ) ( not ( = ?auto_139976 ?auto_139977 ) ) ( ON ?auto_139977 ?auto_139979 ) ( not ( = ?auto_139972 ?auto_139979 ) ) ( not ( = ?auto_139973 ?auto_139979 ) ) ( not ( = ?auto_139974 ?auto_139979 ) ) ( not ( = ?auto_139975 ?auto_139979 ) ) ( not ( = ?auto_139976 ?auto_139979 ) ) ( not ( = ?auto_139977 ?auto_139979 ) ) ( ON ?auto_139976 ?auto_139977 ) ( ON-TABLE ?auto_139980 ) ( ON ?auto_139978 ?auto_139980 ) ( ON ?auto_139979 ?auto_139978 ) ( not ( = ?auto_139980 ?auto_139978 ) ) ( not ( = ?auto_139980 ?auto_139979 ) ) ( not ( = ?auto_139980 ?auto_139977 ) ) ( not ( = ?auto_139980 ?auto_139976 ) ) ( not ( = ?auto_139978 ?auto_139979 ) ) ( not ( = ?auto_139978 ?auto_139977 ) ) ( not ( = ?auto_139978 ?auto_139976 ) ) ( not ( = ?auto_139972 ?auto_139980 ) ) ( not ( = ?auto_139972 ?auto_139978 ) ) ( not ( = ?auto_139973 ?auto_139980 ) ) ( not ( = ?auto_139973 ?auto_139978 ) ) ( not ( = ?auto_139974 ?auto_139980 ) ) ( not ( = ?auto_139974 ?auto_139978 ) ) ( not ( = ?auto_139975 ?auto_139980 ) ) ( not ( = ?auto_139975 ?auto_139978 ) ) ( CLEAR ?auto_139974 ) ( ON ?auto_139975 ?auto_139976 ) ( CLEAR ?auto_139975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139980 ?auto_139978 ?auto_139979 ?auto_139977 ?auto_139976 )
      ( MAKE-6PILE ?auto_139972 ?auto_139973 ?auto_139974 ?auto_139975 ?auto_139976 ?auto_139977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139981 - BLOCK
      ?auto_139982 - BLOCK
      ?auto_139983 - BLOCK
      ?auto_139984 - BLOCK
      ?auto_139985 - BLOCK
      ?auto_139986 - BLOCK
    )
    :vars
    (
      ?auto_139988 - BLOCK
      ?auto_139987 - BLOCK
      ?auto_139989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139981 ) ( ON ?auto_139982 ?auto_139981 ) ( not ( = ?auto_139981 ?auto_139982 ) ) ( not ( = ?auto_139981 ?auto_139983 ) ) ( not ( = ?auto_139981 ?auto_139984 ) ) ( not ( = ?auto_139981 ?auto_139985 ) ) ( not ( = ?auto_139981 ?auto_139986 ) ) ( not ( = ?auto_139982 ?auto_139983 ) ) ( not ( = ?auto_139982 ?auto_139984 ) ) ( not ( = ?auto_139982 ?auto_139985 ) ) ( not ( = ?auto_139982 ?auto_139986 ) ) ( not ( = ?auto_139983 ?auto_139984 ) ) ( not ( = ?auto_139983 ?auto_139985 ) ) ( not ( = ?auto_139983 ?auto_139986 ) ) ( not ( = ?auto_139984 ?auto_139985 ) ) ( not ( = ?auto_139984 ?auto_139986 ) ) ( not ( = ?auto_139985 ?auto_139986 ) ) ( ON ?auto_139986 ?auto_139988 ) ( not ( = ?auto_139981 ?auto_139988 ) ) ( not ( = ?auto_139982 ?auto_139988 ) ) ( not ( = ?auto_139983 ?auto_139988 ) ) ( not ( = ?auto_139984 ?auto_139988 ) ) ( not ( = ?auto_139985 ?auto_139988 ) ) ( not ( = ?auto_139986 ?auto_139988 ) ) ( ON ?auto_139985 ?auto_139986 ) ( ON-TABLE ?auto_139987 ) ( ON ?auto_139989 ?auto_139987 ) ( ON ?auto_139988 ?auto_139989 ) ( not ( = ?auto_139987 ?auto_139989 ) ) ( not ( = ?auto_139987 ?auto_139988 ) ) ( not ( = ?auto_139987 ?auto_139986 ) ) ( not ( = ?auto_139987 ?auto_139985 ) ) ( not ( = ?auto_139989 ?auto_139988 ) ) ( not ( = ?auto_139989 ?auto_139986 ) ) ( not ( = ?auto_139989 ?auto_139985 ) ) ( not ( = ?auto_139981 ?auto_139987 ) ) ( not ( = ?auto_139981 ?auto_139989 ) ) ( not ( = ?auto_139982 ?auto_139987 ) ) ( not ( = ?auto_139982 ?auto_139989 ) ) ( not ( = ?auto_139983 ?auto_139987 ) ) ( not ( = ?auto_139983 ?auto_139989 ) ) ( not ( = ?auto_139984 ?auto_139987 ) ) ( not ( = ?auto_139984 ?auto_139989 ) ) ( ON ?auto_139984 ?auto_139985 ) ( CLEAR ?auto_139984 ) ( HOLDING ?auto_139983 ) ( CLEAR ?auto_139982 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139981 ?auto_139982 ?auto_139983 )
      ( MAKE-6PILE ?auto_139981 ?auto_139982 ?auto_139983 ?auto_139984 ?auto_139985 ?auto_139986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139990 - BLOCK
      ?auto_139991 - BLOCK
      ?auto_139992 - BLOCK
      ?auto_139993 - BLOCK
      ?auto_139994 - BLOCK
      ?auto_139995 - BLOCK
    )
    :vars
    (
      ?auto_139996 - BLOCK
      ?auto_139998 - BLOCK
      ?auto_139997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139990 ) ( ON ?auto_139991 ?auto_139990 ) ( not ( = ?auto_139990 ?auto_139991 ) ) ( not ( = ?auto_139990 ?auto_139992 ) ) ( not ( = ?auto_139990 ?auto_139993 ) ) ( not ( = ?auto_139990 ?auto_139994 ) ) ( not ( = ?auto_139990 ?auto_139995 ) ) ( not ( = ?auto_139991 ?auto_139992 ) ) ( not ( = ?auto_139991 ?auto_139993 ) ) ( not ( = ?auto_139991 ?auto_139994 ) ) ( not ( = ?auto_139991 ?auto_139995 ) ) ( not ( = ?auto_139992 ?auto_139993 ) ) ( not ( = ?auto_139992 ?auto_139994 ) ) ( not ( = ?auto_139992 ?auto_139995 ) ) ( not ( = ?auto_139993 ?auto_139994 ) ) ( not ( = ?auto_139993 ?auto_139995 ) ) ( not ( = ?auto_139994 ?auto_139995 ) ) ( ON ?auto_139995 ?auto_139996 ) ( not ( = ?auto_139990 ?auto_139996 ) ) ( not ( = ?auto_139991 ?auto_139996 ) ) ( not ( = ?auto_139992 ?auto_139996 ) ) ( not ( = ?auto_139993 ?auto_139996 ) ) ( not ( = ?auto_139994 ?auto_139996 ) ) ( not ( = ?auto_139995 ?auto_139996 ) ) ( ON ?auto_139994 ?auto_139995 ) ( ON-TABLE ?auto_139998 ) ( ON ?auto_139997 ?auto_139998 ) ( ON ?auto_139996 ?auto_139997 ) ( not ( = ?auto_139998 ?auto_139997 ) ) ( not ( = ?auto_139998 ?auto_139996 ) ) ( not ( = ?auto_139998 ?auto_139995 ) ) ( not ( = ?auto_139998 ?auto_139994 ) ) ( not ( = ?auto_139997 ?auto_139996 ) ) ( not ( = ?auto_139997 ?auto_139995 ) ) ( not ( = ?auto_139997 ?auto_139994 ) ) ( not ( = ?auto_139990 ?auto_139998 ) ) ( not ( = ?auto_139990 ?auto_139997 ) ) ( not ( = ?auto_139991 ?auto_139998 ) ) ( not ( = ?auto_139991 ?auto_139997 ) ) ( not ( = ?auto_139992 ?auto_139998 ) ) ( not ( = ?auto_139992 ?auto_139997 ) ) ( not ( = ?auto_139993 ?auto_139998 ) ) ( not ( = ?auto_139993 ?auto_139997 ) ) ( ON ?auto_139993 ?auto_139994 ) ( CLEAR ?auto_139991 ) ( ON ?auto_139992 ?auto_139993 ) ( CLEAR ?auto_139992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139998 ?auto_139997 ?auto_139996 ?auto_139995 ?auto_139994 ?auto_139993 )
      ( MAKE-6PILE ?auto_139990 ?auto_139991 ?auto_139992 ?auto_139993 ?auto_139994 ?auto_139995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_139999 - BLOCK
      ?auto_140000 - BLOCK
      ?auto_140001 - BLOCK
      ?auto_140002 - BLOCK
      ?auto_140003 - BLOCK
      ?auto_140004 - BLOCK
    )
    :vars
    (
      ?auto_140007 - BLOCK
      ?auto_140006 - BLOCK
      ?auto_140005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139999 ) ( not ( = ?auto_139999 ?auto_140000 ) ) ( not ( = ?auto_139999 ?auto_140001 ) ) ( not ( = ?auto_139999 ?auto_140002 ) ) ( not ( = ?auto_139999 ?auto_140003 ) ) ( not ( = ?auto_139999 ?auto_140004 ) ) ( not ( = ?auto_140000 ?auto_140001 ) ) ( not ( = ?auto_140000 ?auto_140002 ) ) ( not ( = ?auto_140000 ?auto_140003 ) ) ( not ( = ?auto_140000 ?auto_140004 ) ) ( not ( = ?auto_140001 ?auto_140002 ) ) ( not ( = ?auto_140001 ?auto_140003 ) ) ( not ( = ?auto_140001 ?auto_140004 ) ) ( not ( = ?auto_140002 ?auto_140003 ) ) ( not ( = ?auto_140002 ?auto_140004 ) ) ( not ( = ?auto_140003 ?auto_140004 ) ) ( ON ?auto_140004 ?auto_140007 ) ( not ( = ?auto_139999 ?auto_140007 ) ) ( not ( = ?auto_140000 ?auto_140007 ) ) ( not ( = ?auto_140001 ?auto_140007 ) ) ( not ( = ?auto_140002 ?auto_140007 ) ) ( not ( = ?auto_140003 ?auto_140007 ) ) ( not ( = ?auto_140004 ?auto_140007 ) ) ( ON ?auto_140003 ?auto_140004 ) ( ON-TABLE ?auto_140006 ) ( ON ?auto_140005 ?auto_140006 ) ( ON ?auto_140007 ?auto_140005 ) ( not ( = ?auto_140006 ?auto_140005 ) ) ( not ( = ?auto_140006 ?auto_140007 ) ) ( not ( = ?auto_140006 ?auto_140004 ) ) ( not ( = ?auto_140006 ?auto_140003 ) ) ( not ( = ?auto_140005 ?auto_140007 ) ) ( not ( = ?auto_140005 ?auto_140004 ) ) ( not ( = ?auto_140005 ?auto_140003 ) ) ( not ( = ?auto_139999 ?auto_140006 ) ) ( not ( = ?auto_139999 ?auto_140005 ) ) ( not ( = ?auto_140000 ?auto_140006 ) ) ( not ( = ?auto_140000 ?auto_140005 ) ) ( not ( = ?auto_140001 ?auto_140006 ) ) ( not ( = ?auto_140001 ?auto_140005 ) ) ( not ( = ?auto_140002 ?auto_140006 ) ) ( not ( = ?auto_140002 ?auto_140005 ) ) ( ON ?auto_140002 ?auto_140003 ) ( ON ?auto_140001 ?auto_140002 ) ( CLEAR ?auto_140001 ) ( HOLDING ?auto_140000 ) ( CLEAR ?auto_139999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139999 ?auto_140000 )
      ( MAKE-6PILE ?auto_139999 ?auto_140000 ?auto_140001 ?auto_140002 ?auto_140003 ?auto_140004 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140008 - BLOCK
      ?auto_140009 - BLOCK
      ?auto_140010 - BLOCK
      ?auto_140011 - BLOCK
      ?auto_140012 - BLOCK
      ?auto_140013 - BLOCK
    )
    :vars
    (
      ?auto_140015 - BLOCK
      ?auto_140016 - BLOCK
      ?auto_140014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140008 ) ( not ( = ?auto_140008 ?auto_140009 ) ) ( not ( = ?auto_140008 ?auto_140010 ) ) ( not ( = ?auto_140008 ?auto_140011 ) ) ( not ( = ?auto_140008 ?auto_140012 ) ) ( not ( = ?auto_140008 ?auto_140013 ) ) ( not ( = ?auto_140009 ?auto_140010 ) ) ( not ( = ?auto_140009 ?auto_140011 ) ) ( not ( = ?auto_140009 ?auto_140012 ) ) ( not ( = ?auto_140009 ?auto_140013 ) ) ( not ( = ?auto_140010 ?auto_140011 ) ) ( not ( = ?auto_140010 ?auto_140012 ) ) ( not ( = ?auto_140010 ?auto_140013 ) ) ( not ( = ?auto_140011 ?auto_140012 ) ) ( not ( = ?auto_140011 ?auto_140013 ) ) ( not ( = ?auto_140012 ?auto_140013 ) ) ( ON ?auto_140013 ?auto_140015 ) ( not ( = ?auto_140008 ?auto_140015 ) ) ( not ( = ?auto_140009 ?auto_140015 ) ) ( not ( = ?auto_140010 ?auto_140015 ) ) ( not ( = ?auto_140011 ?auto_140015 ) ) ( not ( = ?auto_140012 ?auto_140015 ) ) ( not ( = ?auto_140013 ?auto_140015 ) ) ( ON ?auto_140012 ?auto_140013 ) ( ON-TABLE ?auto_140016 ) ( ON ?auto_140014 ?auto_140016 ) ( ON ?auto_140015 ?auto_140014 ) ( not ( = ?auto_140016 ?auto_140014 ) ) ( not ( = ?auto_140016 ?auto_140015 ) ) ( not ( = ?auto_140016 ?auto_140013 ) ) ( not ( = ?auto_140016 ?auto_140012 ) ) ( not ( = ?auto_140014 ?auto_140015 ) ) ( not ( = ?auto_140014 ?auto_140013 ) ) ( not ( = ?auto_140014 ?auto_140012 ) ) ( not ( = ?auto_140008 ?auto_140016 ) ) ( not ( = ?auto_140008 ?auto_140014 ) ) ( not ( = ?auto_140009 ?auto_140016 ) ) ( not ( = ?auto_140009 ?auto_140014 ) ) ( not ( = ?auto_140010 ?auto_140016 ) ) ( not ( = ?auto_140010 ?auto_140014 ) ) ( not ( = ?auto_140011 ?auto_140016 ) ) ( not ( = ?auto_140011 ?auto_140014 ) ) ( ON ?auto_140011 ?auto_140012 ) ( ON ?auto_140010 ?auto_140011 ) ( CLEAR ?auto_140008 ) ( ON ?auto_140009 ?auto_140010 ) ( CLEAR ?auto_140009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140016 ?auto_140014 ?auto_140015 ?auto_140013 ?auto_140012 ?auto_140011 ?auto_140010 )
      ( MAKE-6PILE ?auto_140008 ?auto_140009 ?auto_140010 ?auto_140011 ?auto_140012 ?auto_140013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140017 - BLOCK
      ?auto_140018 - BLOCK
      ?auto_140019 - BLOCK
      ?auto_140020 - BLOCK
      ?auto_140021 - BLOCK
      ?auto_140022 - BLOCK
    )
    :vars
    (
      ?auto_140023 - BLOCK
      ?auto_140025 - BLOCK
      ?auto_140024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140017 ?auto_140018 ) ) ( not ( = ?auto_140017 ?auto_140019 ) ) ( not ( = ?auto_140017 ?auto_140020 ) ) ( not ( = ?auto_140017 ?auto_140021 ) ) ( not ( = ?auto_140017 ?auto_140022 ) ) ( not ( = ?auto_140018 ?auto_140019 ) ) ( not ( = ?auto_140018 ?auto_140020 ) ) ( not ( = ?auto_140018 ?auto_140021 ) ) ( not ( = ?auto_140018 ?auto_140022 ) ) ( not ( = ?auto_140019 ?auto_140020 ) ) ( not ( = ?auto_140019 ?auto_140021 ) ) ( not ( = ?auto_140019 ?auto_140022 ) ) ( not ( = ?auto_140020 ?auto_140021 ) ) ( not ( = ?auto_140020 ?auto_140022 ) ) ( not ( = ?auto_140021 ?auto_140022 ) ) ( ON ?auto_140022 ?auto_140023 ) ( not ( = ?auto_140017 ?auto_140023 ) ) ( not ( = ?auto_140018 ?auto_140023 ) ) ( not ( = ?auto_140019 ?auto_140023 ) ) ( not ( = ?auto_140020 ?auto_140023 ) ) ( not ( = ?auto_140021 ?auto_140023 ) ) ( not ( = ?auto_140022 ?auto_140023 ) ) ( ON ?auto_140021 ?auto_140022 ) ( ON-TABLE ?auto_140025 ) ( ON ?auto_140024 ?auto_140025 ) ( ON ?auto_140023 ?auto_140024 ) ( not ( = ?auto_140025 ?auto_140024 ) ) ( not ( = ?auto_140025 ?auto_140023 ) ) ( not ( = ?auto_140025 ?auto_140022 ) ) ( not ( = ?auto_140025 ?auto_140021 ) ) ( not ( = ?auto_140024 ?auto_140023 ) ) ( not ( = ?auto_140024 ?auto_140022 ) ) ( not ( = ?auto_140024 ?auto_140021 ) ) ( not ( = ?auto_140017 ?auto_140025 ) ) ( not ( = ?auto_140017 ?auto_140024 ) ) ( not ( = ?auto_140018 ?auto_140025 ) ) ( not ( = ?auto_140018 ?auto_140024 ) ) ( not ( = ?auto_140019 ?auto_140025 ) ) ( not ( = ?auto_140019 ?auto_140024 ) ) ( not ( = ?auto_140020 ?auto_140025 ) ) ( not ( = ?auto_140020 ?auto_140024 ) ) ( ON ?auto_140020 ?auto_140021 ) ( ON ?auto_140019 ?auto_140020 ) ( ON ?auto_140018 ?auto_140019 ) ( CLEAR ?auto_140018 ) ( HOLDING ?auto_140017 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140017 )
      ( MAKE-6PILE ?auto_140017 ?auto_140018 ?auto_140019 ?auto_140020 ?auto_140021 ?auto_140022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140026 - BLOCK
      ?auto_140027 - BLOCK
      ?auto_140028 - BLOCK
      ?auto_140029 - BLOCK
      ?auto_140030 - BLOCK
      ?auto_140031 - BLOCK
    )
    :vars
    (
      ?auto_140032 - BLOCK
      ?auto_140034 - BLOCK
      ?auto_140033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140026 ?auto_140027 ) ) ( not ( = ?auto_140026 ?auto_140028 ) ) ( not ( = ?auto_140026 ?auto_140029 ) ) ( not ( = ?auto_140026 ?auto_140030 ) ) ( not ( = ?auto_140026 ?auto_140031 ) ) ( not ( = ?auto_140027 ?auto_140028 ) ) ( not ( = ?auto_140027 ?auto_140029 ) ) ( not ( = ?auto_140027 ?auto_140030 ) ) ( not ( = ?auto_140027 ?auto_140031 ) ) ( not ( = ?auto_140028 ?auto_140029 ) ) ( not ( = ?auto_140028 ?auto_140030 ) ) ( not ( = ?auto_140028 ?auto_140031 ) ) ( not ( = ?auto_140029 ?auto_140030 ) ) ( not ( = ?auto_140029 ?auto_140031 ) ) ( not ( = ?auto_140030 ?auto_140031 ) ) ( ON ?auto_140031 ?auto_140032 ) ( not ( = ?auto_140026 ?auto_140032 ) ) ( not ( = ?auto_140027 ?auto_140032 ) ) ( not ( = ?auto_140028 ?auto_140032 ) ) ( not ( = ?auto_140029 ?auto_140032 ) ) ( not ( = ?auto_140030 ?auto_140032 ) ) ( not ( = ?auto_140031 ?auto_140032 ) ) ( ON ?auto_140030 ?auto_140031 ) ( ON-TABLE ?auto_140034 ) ( ON ?auto_140033 ?auto_140034 ) ( ON ?auto_140032 ?auto_140033 ) ( not ( = ?auto_140034 ?auto_140033 ) ) ( not ( = ?auto_140034 ?auto_140032 ) ) ( not ( = ?auto_140034 ?auto_140031 ) ) ( not ( = ?auto_140034 ?auto_140030 ) ) ( not ( = ?auto_140033 ?auto_140032 ) ) ( not ( = ?auto_140033 ?auto_140031 ) ) ( not ( = ?auto_140033 ?auto_140030 ) ) ( not ( = ?auto_140026 ?auto_140034 ) ) ( not ( = ?auto_140026 ?auto_140033 ) ) ( not ( = ?auto_140027 ?auto_140034 ) ) ( not ( = ?auto_140027 ?auto_140033 ) ) ( not ( = ?auto_140028 ?auto_140034 ) ) ( not ( = ?auto_140028 ?auto_140033 ) ) ( not ( = ?auto_140029 ?auto_140034 ) ) ( not ( = ?auto_140029 ?auto_140033 ) ) ( ON ?auto_140029 ?auto_140030 ) ( ON ?auto_140028 ?auto_140029 ) ( ON ?auto_140027 ?auto_140028 ) ( ON ?auto_140026 ?auto_140027 ) ( CLEAR ?auto_140026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140034 ?auto_140033 ?auto_140032 ?auto_140031 ?auto_140030 ?auto_140029 ?auto_140028 ?auto_140027 )
      ( MAKE-6PILE ?auto_140026 ?auto_140027 ?auto_140028 ?auto_140029 ?auto_140030 ?auto_140031 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140037 - BLOCK
      ?auto_140038 - BLOCK
    )
    :vars
    (
      ?auto_140039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140039 ?auto_140038 ) ( CLEAR ?auto_140039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140037 ) ( ON ?auto_140038 ?auto_140037 ) ( not ( = ?auto_140037 ?auto_140038 ) ) ( not ( = ?auto_140037 ?auto_140039 ) ) ( not ( = ?auto_140038 ?auto_140039 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140039 ?auto_140038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140040 - BLOCK
      ?auto_140041 - BLOCK
    )
    :vars
    (
      ?auto_140042 - BLOCK
      ?auto_140043 - BLOCK
      ?auto_140044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140042 ?auto_140041 ) ( CLEAR ?auto_140042 ) ( ON-TABLE ?auto_140040 ) ( ON ?auto_140041 ?auto_140040 ) ( not ( = ?auto_140040 ?auto_140041 ) ) ( not ( = ?auto_140040 ?auto_140042 ) ) ( not ( = ?auto_140041 ?auto_140042 ) ) ( HOLDING ?auto_140043 ) ( CLEAR ?auto_140044 ) ( not ( = ?auto_140040 ?auto_140043 ) ) ( not ( = ?auto_140040 ?auto_140044 ) ) ( not ( = ?auto_140041 ?auto_140043 ) ) ( not ( = ?auto_140041 ?auto_140044 ) ) ( not ( = ?auto_140042 ?auto_140043 ) ) ( not ( = ?auto_140042 ?auto_140044 ) ) ( not ( = ?auto_140043 ?auto_140044 ) ) )
    :subtasks
    ( ( !STACK ?auto_140043 ?auto_140044 )
      ( MAKE-2PILE ?auto_140040 ?auto_140041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140045 - BLOCK
      ?auto_140046 - BLOCK
    )
    :vars
    (
      ?auto_140048 - BLOCK
      ?auto_140049 - BLOCK
      ?auto_140047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140048 ?auto_140046 ) ( ON-TABLE ?auto_140045 ) ( ON ?auto_140046 ?auto_140045 ) ( not ( = ?auto_140045 ?auto_140046 ) ) ( not ( = ?auto_140045 ?auto_140048 ) ) ( not ( = ?auto_140046 ?auto_140048 ) ) ( CLEAR ?auto_140049 ) ( not ( = ?auto_140045 ?auto_140047 ) ) ( not ( = ?auto_140045 ?auto_140049 ) ) ( not ( = ?auto_140046 ?auto_140047 ) ) ( not ( = ?auto_140046 ?auto_140049 ) ) ( not ( = ?auto_140048 ?auto_140047 ) ) ( not ( = ?auto_140048 ?auto_140049 ) ) ( not ( = ?auto_140047 ?auto_140049 ) ) ( ON ?auto_140047 ?auto_140048 ) ( CLEAR ?auto_140047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140045 ?auto_140046 ?auto_140048 )
      ( MAKE-2PILE ?auto_140045 ?auto_140046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140050 - BLOCK
      ?auto_140051 - BLOCK
    )
    :vars
    (
      ?auto_140052 - BLOCK
      ?auto_140053 - BLOCK
      ?auto_140054 - BLOCK
      ?auto_140058 - BLOCK
      ?auto_140057 - BLOCK
      ?auto_140055 - BLOCK
      ?auto_140056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140052 ?auto_140051 ) ( ON-TABLE ?auto_140050 ) ( ON ?auto_140051 ?auto_140050 ) ( not ( = ?auto_140050 ?auto_140051 ) ) ( not ( = ?auto_140050 ?auto_140052 ) ) ( not ( = ?auto_140051 ?auto_140052 ) ) ( not ( = ?auto_140050 ?auto_140053 ) ) ( not ( = ?auto_140050 ?auto_140054 ) ) ( not ( = ?auto_140051 ?auto_140053 ) ) ( not ( = ?auto_140051 ?auto_140054 ) ) ( not ( = ?auto_140052 ?auto_140053 ) ) ( not ( = ?auto_140052 ?auto_140054 ) ) ( not ( = ?auto_140053 ?auto_140054 ) ) ( ON ?auto_140053 ?auto_140052 ) ( CLEAR ?auto_140053 ) ( HOLDING ?auto_140054 ) ( CLEAR ?auto_140058 ) ( ON-TABLE ?auto_140057 ) ( ON ?auto_140055 ?auto_140057 ) ( ON ?auto_140056 ?auto_140055 ) ( ON ?auto_140058 ?auto_140056 ) ( not ( = ?auto_140057 ?auto_140055 ) ) ( not ( = ?auto_140057 ?auto_140056 ) ) ( not ( = ?auto_140057 ?auto_140058 ) ) ( not ( = ?auto_140057 ?auto_140054 ) ) ( not ( = ?auto_140055 ?auto_140056 ) ) ( not ( = ?auto_140055 ?auto_140058 ) ) ( not ( = ?auto_140055 ?auto_140054 ) ) ( not ( = ?auto_140056 ?auto_140058 ) ) ( not ( = ?auto_140056 ?auto_140054 ) ) ( not ( = ?auto_140058 ?auto_140054 ) ) ( not ( = ?auto_140050 ?auto_140058 ) ) ( not ( = ?auto_140050 ?auto_140057 ) ) ( not ( = ?auto_140050 ?auto_140055 ) ) ( not ( = ?auto_140050 ?auto_140056 ) ) ( not ( = ?auto_140051 ?auto_140058 ) ) ( not ( = ?auto_140051 ?auto_140057 ) ) ( not ( = ?auto_140051 ?auto_140055 ) ) ( not ( = ?auto_140051 ?auto_140056 ) ) ( not ( = ?auto_140052 ?auto_140058 ) ) ( not ( = ?auto_140052 ?auto_140057 ) ) ( not ( = ?auto_140052 ?auto_140055 ) ) ( not ( = ?auto_140052 ?auto_140056 ) ) ( not ( = ?auto_140053 ?auto_140058 ) ) ( not ( = ?auto_140053 ?auto_140057 ) ) ( not ( = ?auto_140053 ?auto_140055 ) ) ( not ( = ?auto_140053 ?auto_140056 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140057 ?auto_140055 ?auto_140056 ?auto_140058 ?auto_140054 )
      ( MAKE-2PILE ?auto_140050 ?auto_140051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140059 - BLOCK
      ?auto_140060 - BLOCK
    )
    :vars
    (
      ?auto_140065 - BLOCK
      ?auto_140066 - BLOCK
      ?auto_140063 - BLOCK
      ?auto_140061 - BLOCK
      ?auto_140064 - BLOCK
      ?auto_140067 - BLOCK
      ?auto_140062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140065 ?auto_140060 ) ( ON-TABLE ?auto_140059 ) ( ON ?auto_140060 ?auto_140059 ) ( not ( = ?auto_140059 ?auto_140060 ) ) ( not ( = ?auto_140059 ?auto_140065 ) ) ( not ( = ?auto_140060 ?auto_140065 ) ) ( not ( = ?auto_140059 ?auto_140066 ) ) ( not ( = ?auto_140059 ?auto_140063 ) ) ( not ( = ?auto_140060 ?auto_140066 ) ) ( not ( = ?auto_140060 ?auto_140063 ) ) ( not ( = ?auto_140065 ?auto_140066 ) ) ( not ( = ?auto_140065 ?auto_140063 ) ) ( not ( = ?auto_140066 ?auto_140063 ) ) ( ON ?auto_140066 ?auto_140065 ) ( CLEAR ?auto_140061 ) ( ON-TABLE ?auto_140064 ) ( ON ?auto_140067 ?auto_140064 ) ( ON ?auto_140062 ?auto_140067 ) ( ON ?auto_140061 ?auto_140062 ) ( not ( = ?auto_140064 ?auto_140067 ) ) ( not ( = ?auto_140064 ?auto_140062 ) ) ( not ( = ?auto_140064 ?auto_140061 ) ) ( not ( = ?auto_140064 ?auto_140063 ) ) ( not ( = ?auto_140067 ?auto_140062 ) ) ( not ( = ?auto_140067 ?auto_140061 ) ) ( not ( = ?auto_140067 ?auto_140063 ) ) ( not ( = ?auto_140062 ?auto_140061 ) ) ( not ( = ?auto_140062 ?auto_140063 ) ) ( not ( = ?auto_140061 ?auto_140063 ) ) ( not ( = ?auto_140059 ?auto_140061 ) ) ( not ( = ?auto_140059 ?auto_140064 ) ) ( not ( = ?auto_140059 ?auto_140067 ) ) ( not ( = ?auto_140059 ?auto_140062 ) ) ( not ( = ?auto_140060 ?auto_140061 ) ) ( not ( = ?auto_140060 ?auto_140064 ) ) ( not ( = ?auto_140060 ?auto_140067 ) ) ( not ( = ?auto_140060 ?auto_140062 ) ) ( not ( = ?auto_140065 ?auto_140061 ) ) ( not ( = ?auto_140065 ?auto_140064 ) ) ( not ( = ?auto_140065 ?auto_140067 ) ) ( not ( = ?auto_140065 ?auto_140062 ) ) ( not ( = ?auto_140066 ?auto_140061 ) ) ( not ( = ?auto_140066 ?auto_140064 ) ) ( not ( = ?auto_140066 ?auto_140067 ) ) ( not ( = ?auto_140066 ?auto_140062 ) ) ( ON ?auto_140063 ?auto_140066 ) ( CLEAR ?auto_140063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140059 ?auto_140060 ?auto_140065 ?auto_140066 )
      ( MAKE-2PILE ?auto_140059 ?auto_140060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140068 - BLOCK
      ?auto_140069 - BLOCK
    )
    :vars
    (
      ?auto_140070 - BLOCK
      ?auto_140071 - BLOCK
      ?auto_140075 - BLOCK
      ?auto_140073 - BLOCK
      ?auto_140074 - BLOCK
      ?auto_140076 - BLOCK
      ?auto_140072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140070 ?auto_140069 ) ( ON-TABLE ?auto_140068 ) ( ON ?auto_140069 ?auto_140068 ) ( not ( = ?auto_140068 ?auto_140069 ) ) ( not ( = ?auto_140068 ?auto_140070 ) ) ( not ( = ?auto_140069 ?auto_140070 ) ) ( not ( = ?auto_140068 ?auto_140071 ) ) ( not ( = ?auto_140068 ?auto_140075 ) ) ( not ( = ?auto_140069 ?auto_140071 ) ) ( not ( = ?auto_140069 ?auto_140075 ) ) ( not ( = ?auto_140070 ?auto_140071 ) ) ( not ( = ?auto_140070 ?auto_140075 ) ) ( not ( = ?auto_140071 ?auto_140075 ) ) ( ON ?auto_140071 ?auto_140070 ) ( ON-TABLE ?auto_140073 ) ( ON ?auto_140074 ?auto_140073 ) ( ON ?auto_140076 ?auto_140074 ) ( not ( = ?auto_140073 ?auto_140074 ) ) ( not ( = ?auto_140073 ?auto_140076 ) ) ( not ( = ?auto_140073 ?auto_140072 ) ) ( not ( = ?auto_140073 ?auto_140075 ) ) ( not ( = ?auto_140074 ?auto_140076 ) ) ( not ( = ?auto_140074 ?auto_140072 ) ) ( not ( = ?auto_140074 ?auto_140075 ) ) ( not ( = ?auto_140076 ?auto_140072 ) ) ( not ( = ?auto_140076 ?auto_140075 ) ) ( not ( = ?auto_140072 ?auto_140075 ) ) ( not ( = ?auto_140068 ?auto_140072 ) ) ( not ( = ?auto_140068 ?auto_140073 ) ) ( not ( = ?auto_140068 ?auto_140074 ) ) ( not ( = ?auto_140068 ?auto_140076 ) ) ( not ( = ?auto_140069 ?auto_140072 ) ) ( not ( = ?auto_140069 ?auto_140073 ) ) ( not ( = ?auto_140069 ?auto_140074 ) ) ( not ( = ?auto_140069 ?auto_140076 ) ) ( not ( = ?auto_140070 ?auto_140072 ) ) ( not ( = ?auto_140070 ?auto_140073 ) ) ( not ( = ?auto_140070 ?auto_140074 ) ) ( not ( = ?auto_140070 ?auto_140076 ) ) ( not ( = ?auto_140071 ?auto_140072 ) ) ( not ( = ?auto_140071 ?auto_140073 ) ) ( not ( = ?auto_140071 ?auto_140074 ) ) ( not ( = ?auto_140071 ?auto_140076 ) ) ( ON ?auto_140075 ?auto_140071 ) ( CLEAR ?auto_140075 ) ( HOLDING ?auto_140072 ) ( CLEAR ?auto_140076 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140073 ?auto_140074 ?auto_140076 ?auto_140072 )
      ( MAKE-2PILE ?auto_140068 ?auto_140069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140077 - BLOCK
      ?auto_140078 - BLOCK
    )
    :vars
    (
      ?auto_140080 - BLOCK
      ?auto_140079 - BLOCK
      ?auto_140082 - BLOCK
      ?auto_140083 - BLOCK
      ?auto_140081 - BLOCK
      ?auto_140085 - BLOCK
      ?auto_140084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140080 ?auto_140078 ) ( ON-TABLE ?auto_140077 ) ( ON ?auto_140078 ?auto_140077 ) ( not ( = ?auto_140077 ?auto_140078 ) ) ( not ( = ?auto_140077 ?auto_140080 ) ) ( not ( = ?auto_140078 ?auto_140080 ) ) ( not ( = ?auto_140077 ?auto_140079 ) ) ( not ( = ?auto_140077 ?auto_140082 ) ) ( not ( = ?auto_140078 ?auto_140079 ) ) ( not ( = ?auto_140078 ?auto_140082 ) ) ( not ( = ?auto_140080 ?auto_140079 ) ) ( not ( = ?auto_140080 ?auto_140082 ) ) ( not ( = ?auto_140079 ?auto_140082 ) ) ( ON ?auto_140079 ?auto_140080 ) ( ON-TABLE ?auto_140083 ) ( ON ?auto_140081 ?auto_140083 ) ( ON ?auto_140085 ?auto_140081 ) ( not ( = ?auto_140083 ?auto_140081 ) ) ( not ( = ?auto_140083 ?auto_140085 ) ) ( not ( = ?auto_140083 ?auto_140084 ) ) ( not ( = ?auto_140083 ?auto_140082 ) ) ( not ( = ?auto_140081 ?auto_140085 ) ) ( not ( = ?auto_140081 ?auto_140084 ) ) ( not ( = ?auto_140081 ?auto_140082 ) ) ( not ( = ?auto_140085 ?auto_140084 ) ) ( not ( = ?auto_140085 ?auto_140082 ) ) ( not ( = ?auto_140084 ?auto_140082 ) ) ( not ( = ?auto_140077 ?auto_140084 ) ) ( not ( = ?auto_140077 ?auto_140083 ) ) ( not ( = ?auto_140077 ?auto_140081 ) ) ( not ( = ?auto_140077 ?auto_140085 ) ) ( not ( = ?auto_140078 ?auto_140084 ) ) ( not ( = ?auto_140078 ?auto_140083 ) ) ( not ( = ?auto_140078 ?auto_140081 ) ) ( not ( = ?auto_140078 ?auto_140085 ) ) ( not ( = ?auto_140080 ?auto_140084 ) ) ( not ( = ?auto_140080 ?auto_140083 ) ) ( not ( = ?auto_140080 ?auto_140081 ) ) ( not ( = ?auto_140080 ?auto_140085 ) ) ( not ( = ?auto_140079 ?auto_140084 ) ) ( not ( = ?auto_140079 ?auto_140083 ) ) ( not ( = ?auto_140079 ?auto_140081 ) ) ( not ( = ?auto_140079 ?auto_140085 ) ) ( ON ?auto_140082 ?auto_140079 ) ( CLEAR ?auto_140085 ) ( ON ?auto_140084 ?auto_140082 ) ( CLEAR ?auto_140084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140077 ?auto_140078 ?auto_140080 ?auto_140079 ?auto_140082 )
      ( MAKE-2PILE ?auto_140077 ?auto_140078 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140086 - BLOCK
      ?auto_140087 - BLOCK
    )
    :vars
    (
      ?auto_140089 - BLOCK
      ?auto_140093 - BLOCK
      ?auto_140090 - BLOCK
      ?auto_140092 - BLOCK
      ?auto_140088 - BLOCK
      ?auto_140094 - BLOCK
      ?auto_140091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140089 ?auto_140087 ) ( ON-TABLE ?auto_140086 ) ( ON ?auto_140087 ?auto_140086 ) ( not ( = ?auto_140086 ?auto_140087 ) ) ( not ( = ?auto_140086 ?auto_140089 ) ) ( not ( = ?auto_140087 ?auto_140089 ) ) ( not ( = ?auto_140086 ?auto_140093 ) ) ( not ( = ?auto_140086 ?auto_140090 ) ) ( not ( = ?auto_140087 ?auto_140093 ) ) ( not ( = ?auto_140087 ?auto_140090 ) ) ( not ( = ?auto_140089 ?auto_140093 ) ) ( not ( = ?auto_140089 ?auto_140090 ) ) ( not ( = ?auto_140093 ?auto_140090 ) ) ( ON ?auto_140093 ?auto_140089 ) ( ON-TABLE ?auto_140092 ) ( ON ?auto_140088 ?auto_140092 ) ( not ( = ?auto_140092 ?auto_140088 ) ) ( not ( = ?auto_140092 ?auto_140094 ) ) ( not ( = ?auto_140092 ?auto_140091 ) ) ( not ( = ?auto_140092 ?auto_140090 ) ) ( not ( = ?auto_140088 ?auto_140094 ) ) ( not ( = ?auto_140088 ?auto_140091 ) ) ( not ( = ?auto_140088 ?auto_140090 ) ) ( not ( = ?auto_140094 ?auto_140091 ) ) ( not ( = ?auto_140094 ?auto_140090 ) ) ( not ( = ?auto_140091 ?auto_140090 ) ) ( not ( = ?auto_140086 ?auto_140091 ) ) ( not ( = ?auto_140086 ?auto_140092 ) ) ( not ( = ?auto_140086 ?auto_140088 ) ) ( not ( = ?auto_140086 ?auto_140094 ) ) ( not ( = ?auto_140087 ?auto_140091 ) ) ( not ( = ?auto_140087 ?auto_140092 ) ) ( not ( = ?auto_140087 ?auto_140088 ) ) ( not ( = ?auto_140087 ?auto_140094 ) ) ( not ( = ?auto_140089 ?auto_140091 ) ) ( not ( = ?auto_140089 ?auto_140092 ) ) ( not ( = ?auto_140089 ?auto_140088 ) ) ( not ( = ?auto_140089 ?auto_140094 ) ) ( not ( = ?auto_140093 ?auto_140091 ) ) ( not ( = ?auto_140093 ?auto_140092 ) ) ( not ( = ?auto_140093 ?auto_140088 ) ) ( not ( = ?auto_140093 ?auto_140094 ) ) ( ON ?auto_140090 ?auto_140093 ) ( ON ?auto_140091 ?auto_140090 ) ( CLEAR ?auto_140091 ) ( HOLDING ?auto_140094 ) ( CLEAR ?auto_140088 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140092 ?auto_140088 ?auto_140094 )
      ( MAKE-2PILE ?auto_140086 ?auto_140087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140095 - BLOCK
      ?auto_140096 - BLOCK
    )
    :vars
    (
      ?auto_140102 - BLOCK
      ?auto_140097 - BLOCK
      ?auto_140103 - BLOCK
      ?auto_140098 - BLOCK
      ?auto_140099 - BLOCK
      ?auto_140101 - BLOCK
      ?auto_140100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140102 ?auto_140096 ) ( ON-TABLE ?auto_140095 ) ( ON ?auto_140096 ?auto_140095 ) ( not ( = ?auto_140095 ?auto_140096 ) ) ( not ( = ?auto_140095 ?auto_140102 ) ) ( not ( = ?auto_140096 ?auto_140102 ) ) ( not ( = ?auto_140095 ?auto_140097 ) ) ( not ( = ?auto_140095 ?auto_140103 ) ) ( not ( = ?auto_140096 ?auto_140097 ) ) ( not ( = ?auto_140096 ?auto_140103 ) ) ( not ( = ?auto_140102 ?auto_140097 ) ) ( not ( = ?auto_140102 ?auto_140103 ) ) ( not ( = ?auto_140097 ?auto_140103 ) ) ( ON ?auto_140097 ?auto_140102 ) ( ON-TABLE ?auto_140098 ) ( ON ?auto_140099 ?auto_140098 ) ( not ( = ?auto_140098 ?auto_140099 ) ) ( not ( = ?auto_140098 ?auto_140101 ) ) ( not ( = ?auto_140098 ?auto_140100 ) ) ( not ( = ?auto_140098 ?auto_140103 ) ) ( not ( = ?auto_140099 ?auto_140101 ) ) ( not ( = ?auto_140099 ?auto_140100 ) ) ( not ( = ?auto_140099 ?auto_140103 ) ) ( not ( = ?auto_140101 ?auto_140100 ) ) ( not ( = ?auto_140101 ?auto_140103 ) ) ( not ( = ?auto_140100 ?auto_140103 ) ) ( not ( = ?auto_140095 ?auto_140100 ) ) ( not ( = ?auto_140095 ?auto_140098 ) ) ( not ( = ?auto_140095 ?auto_140099 ) ) ( not ( = ?auto_140095 ?auto_140101 ) ) ( not ( = ?auto_140096 ?auto_140100 ) ) ( not ( = ?auto_140096 ?auto_140098 ) ) ( not ( = ?auto_140096 ?auto_140099 ) ) ( not ( = ?auto_140096 ?auto_140101 ) ) ( not ( = ?auto_140102 ?auto_140100 ) ) ( not ( = ?auto_140102 ?auto_140098 ) ) ( not ( = ?auto_140102 ?auto_140099 ) ) ( not ( = ?auto_140102 ?auto_140101 ) ) ( not ( = ?auto_140097 ?auto_140100 ) ) ( not ( = ?auto_140097 ?auto_140098 ) ) ( not ( = ?auto_140097 ?auto_140099 ) ) ( not ( = ?auto_140097 ?auto_140101 ) ) ( ON ?auto_140103 ?auto_140097 ) ( ON ?auto_140100 ?auto_140103 ) ( CLEAR ?auto_140099 ) ( ON ?auto_140101 ?auto_140100 ) ( CLEAR ?auto_140101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140095 ?auto_140096 ?auto_140102 ?auto_140097 ?auto_140103 ?auto_140100 )
      ( MAKE-2PILE ?auto_140095 ?auto_140096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140104 - BLOCK
      ?auto_140105 - BLOCK
    )
    :vars
    (
      ?auto_140107 - BLOCK
      ?auto_140108 - BLOCK
      ?auto_140111 - BLOCK
      ?auto_140112 - BLOCK
      ?auto_140110 - BLOCK
      ?auto_140106 - BLOCK
      ?auto_140109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140107 ?auto_140105 ) ( ON-TABLE ?auto_140104 ) ( ON ?auto_140105 ?auto_140104 ) ( not ( = ?auto_140104 ?auto_140105 ) ) ( not ( = ?auto_140104 ?auto_140107 ) ) ( not ( = ?auto_140105 ?auto_140107 ) ) ( not ( = ?auto_140104 ?auto_140108 ) ) ( not ( = ?auto_140104 ?auto_140111 ) ) ( not ( = ?auto_140105 ?auto_140108 ) ) ( not ( = ?auto_140105 ?auto_140111 ) ) ( not ( = ?auto_140107 ?auto_140108 ) ) ( not ( = ?auto_140107 ?auto_140111 ) ) ( not ( = ?auto_140108 ?auto_140111 ) ) ( ON ?auto_140108 ?auto_140107 ) ( ON-TABLE ?auto_140112 ) ( not ( = ?auto_140112 ?auto_140110 ) ) ( not ( = ?auto_140112 ?auto_140106 ) ) ( not ( = ?auto_140112 ?auto_140109 ) ) ( not ( = ?auto_140112 ?auto_140111 ) ) ( not ( = ?auto_140110 ?auto_140106 ) ) ( not ( = ?auto_140110 ?auto_140109 ) ) ( not ( = ?auto_140110 ?auto_140111 ) ) ( not ( = ?auto_140106 ?auto_140109 ) ) ( not ( = ?auto_140106 ?auto_140111 ) ) ( not ( = ?auto_140109 ?auto_140111 ) ) ( not ( = ?auto_140104 ?auto_140109 ) ) ( not ( = ?auto_140104 ?auto_140112 ) ) ( not ( = ?auto_140104 ?auto_140110 ) ) ( not ( = ?auto_140104 ?auto_140106 ) ) ( not ( = ?auto_140105 ?auto_140109 ) ) ( not ( = ?auto_140105 ?auto_140112 ) ) ( not ( = ?auto_140105 ?auto_140110 ) ) ( not ( = ?auto_140105 ?auto_140106 ) ) ( not ( = ?auto_140107 ?auto_140109 ) ) ( not ( = ?auto_140107 ?auto_140112 ) ) ( not ( = ?auto_140107 ?auto_140110 ) ) ( not ( = ?auto_140107 ?auto_140106 ) ) ( not ( = ?auto_140108 ?auto_140109 ) ) ( not ( = ?auto_140108 ?auto_140112 ) ) ( not ( = ?auto_140108 ?auto_140110 ) ) ( not ( = ?auto_140108 ?auto_140106 ) ) ( ON ?auto_140111 ?auto_140108 ) ( ON ?auto_140109 ?auto_140111 ) ( ON ?auto_140106 ?auto_140109 ) ( CLEAR ?auto_140106 ) ( HOLDING ?auto_140110 ) ( CLEAR ?auto_140112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140112 ?auto_140110 )
      ( MAKE-2PILE ?auto_140104 ?auto_140105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142131 - BLOCK
      ?auto_142132 - BLOCK
    )
    :vars
    (
      ?auto_142133 - BLOCK
      ?auto_142134 - BLOCK
      ?auto_142137 - BLOCK
      ?auto_142136 - BLOCK
      ?auto_142138 - BLOCK
      ?auto_142135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142133 ?auto_142132 ) ( ON-TABLE ?auto_142131 ) ( ON ?auto_142132 ?auto_142131 ) ( not ( = ?auto_142131 ?auto_142132 ) ) ( not ( = ?auto_142131 ?auto_142133 ) ) ( not ( = ?auto_142132 ?auto_142133 ) ) ( not ( = ?auto_142131 ?auto_142134 ) ) ( not ( = ?auto_142131 ?auto_142137 ) ) ( not ( = ?auto_142132 ?auto_142134 ) ) ( not ( = ?auto_142132 ?auto_142137 ) ) ( not ( = ?auto_142133 ?auto_142134 ) ) ( not ( = ?auto_142133 ?auto_142137 ) ) ( not ( = ?auto_142134 ?auto_142137 ) ) ( ON ?auto_142134 ?auto_142133 ) ( not ( = ?auto_142136 ?auto_142138 ) ) ( not ( = ?auto_142136 ?auto_142135 ) ) ( not ( = ?auto_142136 ?auto_142137 ) ) ( not ( = ?auto_142138 ?auto_142135 ) ) ( not ( = ?auto_142138 ?auto_142137 ) ) ( not ( = ?auto_142135 ?auto_142137 ) ) ( not ( = ?auto_142131 ?auto_142135 ) ) ( not ( = ?auto_142131 ?auto_142136 ) ) ( not ( = ?auto_142131 ?auto_142138 ) ) ( not ( = ?auto_142132 ?auto_142135 ) ) ( not ( = ?auto_142132 ?auto_142136 ) ) ( not ( = ?auto_142132 ?auto_142138 ) ) ( not ( = ?auto_142133 ?auto_142135 ) ) ( not ( = ?auto_142133 ?auto_142136 ) ) ( not ( = ?auto_142133 ?auto_142138 ) ) ( not ( = ?auto_142134 ?auto_142135 ) ) ( not ( = ?auto_142134 ?auto_142136 ) ) ( not ( = ?auto_142134 ?auto_142138 ) ) ( ON ?auto_142137 ?auto_142134 ) ( ON ?auto_142135 ?auto_142137 ) ( ON ?auto_142138 ?auto_142135 ) ( ON ?auto_142136 ?auto_142138 ) ( CLEAR ?auto_142136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142131 ?auto_142132 ?auto_142133 ?auto_142134 ?auto_142137 ?auto_142135 ?auto_142138 )
      ( MAKE-2PILE ?auto_142131 ?auto_142132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140122 - BLOCK
      ?auto_140123 - BLOCK
    )
    :vars
    (
      ?auto_140128 - BLOCK
      ?auto_140129 - BLOCK
      ?auto_140124 - BLOCK
      ?auto_140127 - BLOCK
      ?auto_140130 - BLOCK
      ?auto_140126 - BLOCK
      ?auto_140125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140128 ?auto_140123 ) ( ON-TABLE ?auto_140122 ) ( ON ?auto_140123 ?auto_140122 ) ( not ( = ?auto_140122 ?auto_140123 ) ) ( not ( = ?auto_140122 ?auto_140128 ) ) ( not ( = ?auto_140123 ?auto_140128 ) ) ( not ( = ?auto_140122 ?auto_140129 ) ) ( not ( = ?auto_140122 ?auto_140124 ) ) ( not ( = ?auto_140123 ?auto_140129 ) ) ( not ( = ?auto_140123 ?auto_140124 ) ) ( not ( = ?auto_140128 ?auto_140129 ) ) ( not ( = ?auto_140128 ?auto_140124 ) ) ( not ( = ?auto_140129 ?auto_140124 ) ) ( ON ?auto_140129 ?auto_140128 ) ( not ( = ?auto_140127 ?auto_140130 ) ) ( not ( = ?auto_140127 ?auto_140126 ) ) ( not ( = ?auto_140127 ?auto_140125 ) ) ( not ( = ?auto_140127 ?auto_140124 ) ) ( not ( = ?auto_140130 ?auto_140126 ) ) ( not ( = ?auto_140130 ?auto_140125 ) ) ( not ( = ?auto_140130 ?auto_140124 ) ) ( not ( = ?auto_140126 ?auto_140125 ) ) ( not ( = ?auto_140126 ?auto_140124 ) ) ( not ( = ?auto_140125 ?auto_140124 ) ) ( not ( = ?auto_140122 ?auto_140125 ) ) ( not ( = ?auto_140122 ?auto_140127 ) ) ( not ( = ?auto_140122 ?auto_140130 ) ) ( not ( = ?auto_140122 ?auto_140126 ) ) ( not ( = ?auto_140123 ?auto_140125 ) ) ( not ( = ?auto_140123 ?auto_140127 ) ) ( not ( = ?auto_140123 ?auto_140130 ) ) ( not ( = ?auto_140123 ?auto_140126 ) ) ( not ( = ?auto_140128 ?auto_140125 ) ) ( not ( = ?auto_140128 ?auto_140127 ) ) ( not ( = ?auto_140128 ?auto_140130 ) ) ( not ( = ?auto_140128 ?auto_140126 ) ) ( not ( = ?auto_140129 ?auto_140125 ) ) ( not ( = ?auto_140129 ?auto_140127 ) ) ( not ( = ?auto_140129 ?auto_140130 ) ) ( not ( = ?auto_140129 ?auto_140126 ) ) ( ON ?auto_140124 ?auto_140129 ) ( ON ?auto_140125 ?auto_140124 ) ( ON ?auto_140126 ?auto_140125 ) ( ON ?auto_140130 ?auto_140126 ) ( CLEAR ?auto_140130 ) ( HOLDING ?auto_140127 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140127 )
      ( MAKE-2PILE ?auto_140122 ?auto_140123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140131 - BLOCK
      ?auto_140132 - BLOCK
    )
    :vars
    (
      ?auto_140139 - BLOCK
      ?auto_140133 - BLOCK
      ?auto_140135 - BLOCK
      ?auto_140136 - BLOCK
      ?auto_140138 - BLOCK
      ?auto_140134 - BLOCK
      ?auto_140137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140139 ?auto_140132 ) ( ON-TABLE ?auto_140131 ) ( ON ?auto_140132 ?auto_140131 ) ( not ( = ?auto_140131 ?auto_140132 ) ) ( not ( = ?auto_140131 ?auto_140139 ) ) ( not ( = ?auto_140132 ?auto_140139 ) ) ( not ( = ?auto_140131 ?auto_140133 ) ) ( not ( = ?auto_140131 ?auto_140135 ) ) ( not ( = ?auto_140132 ?auto_140133 ) ) ( not ( = ?auto_140132 ?auto_140135 ) ) ( not ( = ?auto_140139 ?auto_140133 ) ) ( not ( = ?auto_140139 ?auto_140135 ) ) ( not ( = ?auto_140133 ?auto_140135 ) ) ( ON ?auto_140133 ?auto_140139 ) ( not ( = ?auto_140136 ?auto_140138 ) ) ( not ( = ?auto_140136 ?auto_140134 ) ) ( not ( = ?auto_140136 ?auto_140137 ) ) ( not ( = ?auto_140136 ?auto_140135 ) ) ( not ( = ?auto_140138 ?auto_140134 ) ) ( not ( = ?auto_140138 ?auto_140137 ) ) ( not ( = ?auto_140138 ?auto_140135 ) ) ( not ( = ?auto_140134 ?auto_140137 ) ) ( not ( = ?auto_140134 ?auto_140135 ) ) ( not ( = ?auto_140137 ?auto_140135 ) ) ( not ( = ?auto_140131 ?auto_140137 ) ) ( not ( = ?auto_140131 ?auto_140136 ) ) ( not ( = ?auto_140131 ?auto_140138 ) ) ( not ( = ?auto_140131 ?auto_140134 ) ) ( not ( = ?auto_140132 ?auto_140137 ) ) ( not ( = ?auto_140132 ?auto_140136 ) ) ( not ( = ?auto_140132 ?auto_140138 ) ) ( not ( = ?auto_140132 ?auto_140134 ) ) ( not ( = ?auto_140139 ?auto_140137 ) ) ( not ( = ?auto_140139 ?auto_140136 ) ) ( not ( = ?auto_140139 ?auto_140138 ) ) ( not ( = ?auto_140139 ?auto_140134 ) ) ( not ( = ?auto_140133 ?auto_140137 ) ) ( not ( = ?auto_140133 ?auto_140136 ) ) ( not ( = ?auto_140133 ?auto_140138 ) ) ( not ( = ?auto_140133 ?auto_140134 ) ) ( ON ?auto_140135 ?auto_140133 ) ( ON ?auto_140137 ?auto_140135 ) ( ON ?auto_140134 ?auto_140137 ) ( ON ?auto_140138 ?auto_140134 ) ( ON ?auto_140136 ?auto_140138 ) ( CLEAR ?auto_140136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140131 ?auto_140132 ?auto_140139 ?auto_140133 ?auto_140135 ?auto_140137 ?auto_140134 ?auto_140138 )
      ( MAKE-2PILE ?auto_140131 ?auto_140132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140147 - BLOCK
      ?auto_140148 - BLOCK
      ?auto_140149 - BLOCK
      ?auto_140150 - BLOCK
      ?auto_140151 - BLOCK
      ?auto_140152 - BLOCK
      ?auto_140153 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_140153 ) ( CLEAR ?auto_140152 ) ( ON-TABLE ?auto_140147 ) ( ON ?auto_140148 ?auto_140147 ) ( ON ?auto_140149 ?auto_140148 ) ( ON ?auto_140150 ?auto_140149 ) ( ON ?auto_140151 ?auto_140150 ) ( ON ?auto_140152 ?auto_140151 ) ( not ( = ?auto_140147 ?auto_140148 ) ) ( not ( = ?auto_140147 ?auto_140149 ) ) ( not ( = ?auto_140147 ?auto_140150 ) ) ( not ( = ?auto_140147 ?auto_140151 ) ) ( not ( = ?auto_140147 ?auto_140152 ) ) ( not ( = ?auto_140147 ?auto_140153 ) ) ( not ( = ?auto_140148 ?auto_140149 ) ) ( not ( = ?auto_140148 ?auto_140150 ) ) ( not ( = ?auto_140148 ?auto_140151 ) ) ( not ( = ?auto_140148 ?auto_140152 ) ) ( not ( = ?auto_140148 ?auto_140153 ) ) ( not ( = ?auto_140149 ?auto_140150 ) ) ( not ( = ?auto_140149 ?auto_140151 ) ) ( not ( = ?auto_140149 ?auto_140152 ) ) ( not ( = ?auto_140149 ?auto_140153 ) ) ( not ( = ?auto_140150 ?auto_140151 ) ) ( not ( = ?auto_140150 ?auto_140152 ) ) ( not ( = ?auto_140150 ?auto_140153 ) ) ( not ( = ?auto_140151 ?auto_140152 ) ) ( not ( = ?auto_140151 ?auto_140153 ) ) ( not ( = ?auto_140152 ?auto_140153 ) ) )
    :subtasks
    ( ( !STACK ?auto_140153 ?auto_140152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140154 - BLOCK
      ?auto_140155 - BLOCK
      ?auto_140156 - BLOCK
      ?auto_140157 - BLOCK
      ?auto_140158 - BLOCK
      ?auto_140159 - BLOCK
      ?auto_140160 - BLOCK
    )
    :vars
    (
      ?auto_140161 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140159 ) ( ON-TABLE ?auto_140154 ) ( ON ?auto_140155 ?auto_140154 ) ( ON ?auto_140156 ?auto_140155 ) ( ON ?auto_140157 ?auto_140156 ) ( ON ?auto_140158 ?auto_140157 ) ( ON ?auto_140159 ?auto_140158 ) ( not ( = ?auto_140154 ?auto_140155 ) ) ( not ( = ?auto_140154 ?auto_140156 ) ) ( not ( = ?auto_140154 ?auto_140157 ) ) ( not ( = ?auto_140154 ?auto_140158 ) ) ( not ( = ?auto_140154 ?auto_140159 ) ) ( not ( = ?auto_140154 ?auto_140160 ) ) ( not ( = ?auto_140155 ?auto_140156 ) ) ( not ( = ?auto_140155 ?auto_140157 ) ) ( not ( = ?auto_140155 ?auto_140158 ) ) ( not ( = ?auto_140155 ?auto_140159 ) ) ( not ( = ?auto_140155 ?auto_140160 ) ) ( not ( = ?auto_140156 ?auto_140157 ) ) ( not ( = ?auto_140156 ?auto_140158 ) ) ( not ( = ?auto_140156 ?auto_140159 ) ) ( not ( = ?auto_140156 ?auto_140160 ) ) ( not ( = ?auto_140157 ?auto_140158 ) ) ( not ( = ?auto_140157 ?auto_140159 ) ) ( not ( = ?auto_140157 ?auto_140160 ) ) ( not ( = ?auto_140158 ?auto_140159 ) ) ( not ( = ?auto_140158 ?auto_140160 ) ) ( not ( = ?auto_140159 ?auto_140160 ) ) ( ON ?auto_140160 ?auto_140161 ) ( CLEAR ?auto_140160 ) ( HAND-EMPTY ) ( not ( = ?auto_140154 ?auto_140161 ) ) ( not ( = ?auto_140155 ?auto_140161 ) ) ( not ( = ?auto_140156 ?auto_140161 ) ) ( not ( = ?auto_140157 ?auto_140161 ) ) ( not ( = ?auto_140158 ?auto_140161 ) ) ( not ( = ?auto_140159 ?auto_140161 ) ) ( not ( = ?auto_140160 ?auto_140161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140160 ?auto_140161 )
      ( MAKE-7PILE ?auto_140154 ?auto_140155 ?auto_140156 ?auto_140157 ?auto_140158 ?auto_140159 ?auto_140160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140162 - BLOCK
      ?auto_140163 - BLOCK
      ?auto_140164 - BLOCK
      ?auto_140165 - BLOCK
      ?auto_140166 - BLOCK
      ?auto_140167 - BLOCK
      ?auto_140168 - BLOCK
    )
    :vars
    (
      ?auto_140169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140162 ) ( ON ?auto_140163 ?auto_140162 ) ( ON ?auto_140164 ?auto_140163 ) ( ON ?auto_140165 ?auto_140164 ) ( ON ?auto_140166 ?auto_140165 ) ( not ( = ?auto_140162 ?auto_140163 ) ) ( not ( = ?auto_140162 ?auto_140164 ) ) ( not ( = ?auto_140162 ?auto_140165 ) ) ( not ( = ?auto_140162 ?auto_140166 ) ) ( not ( = ?auto_140162 ?auto_140167 ) ) ( not ( = ?auto_140162 ?auto_140168 ) ) ( not ( = ?auto_140163 ?auto_140164 ) ) ( not ( = ?auto_140163 ?auto_140165 ) ) ( not ( = ?auto_140163 ?auto_140166 ) ) ( not ( = ?auto_140163 ?auto_140167 ) ) ( not ( = ?auto_140163 ?auto_140168 ) ) ( not ( = ?auto_140164 ?auto_140165 ) ) ( not ( = ?auto_140164 ?auto_140166 ) ) ( not ( = ?auto_140164 ?auto_140167 ) ) ( not ( = ?auto_140164 ?auto_140168 ) ) ( not ( = ?auto_140165 ?auto_140166 ) ) ( not ( = ?auto_140165 ?auto_140167 ) ) ( not ( = ?auto_140165 ?auto_140168 ) ) ( not ( = ?auto_140166 ?auto_140167 ) ) ( not ( = ?auto_140166 ?auto_140168 ) ) ( not ( = ?auto_140167 ?auto_140168 ) ) ( ON ?auto_140168 ?auto_140169 ) ( CLEAR ?auto_140168 ) ( not ( = ?auto_140162 ?auto_140169 ) ) ( not ( = ?auto_140163 ?auto_140169 ) ) ( not ( = ?auto_140164 ?auto_140169 ) ) ( not ( = ?auto_140165 ?auto_140169 ) ) ( not ( = ?auto_140166 ?auto_140169 ) ) ( not ( = ?auto_140167 ?auto_140169 ) ) ( not ( = ?auto_140168 ?auto_140169 ) ) ( HOLDING ?auto_140167 ) ( CLEAR ?auto_140166 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140162 ?auto_140163 ?auto_140164 ?auto_140165 ?auto_140166 ?auto_140167 )
      ( MAKE-7PILE ?auto_140162 ?auto_140163 ?auto_140164 ?auto_140165 ?auto_140166 ?auto_140167 ?auto_140168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140170 - BLOCK
      ?auto_140171 - BLOCK
      ?auto_140172 - BLOCK
      ?auto_140173 - BLOCK
      ?auto_140174 - BLOCK
      ?auto_140175 - BLOCK
      ?auto_140176 - BLOCK
    )
    :vars
    (
      ?auto_140177 - BLOCK
      ?auto_140178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140170 ) ( ON ?auto_140171 ?auto_140170 ) ( ON ?auto_140172 ?auto_140171 ) ( ON ?auto_140173 ?auto_140172 ) ( ON ?auto_140174 ?auto_140173 ) ( not ( = ?auto_140170 ?auto_140171 ) ) ( not ( = ?auto_140170 ?auto_140172 ) ) ( not ( = ?auto_140170 ?auto_140173 ) ) ( not ( = ?auto_140170 ?auto_140174 ) ) ( not ( = ?auto_140170 ?auto_140175 ) ) ( not ( = ?auto_140170 ?auto_140176 ) ) ( not ( = ?auto_140171 ?auto_140172 ) ) ( not ( = ?auto_140171 ?auto_140173 ) ) ( not ( = ?auto_140171 ?auto_140174 ) ) ( not ( = ?auto_140171 ?auto_140175 ) ) ( not ( = ?auto_140171 ?auto_140176 ) ) ( not ( = ?auto_140172 ?auto_140173 ) ) ( not ( = ?auto_140172 ?auto_140174 ) ) ( not ( = ?auto_140172 ?auto_140175 ) ) ( not ( = ?auto_140172 ?auto_140176 ) ) ( not ( = ?auto_140173 ?auto_140174 ) ) ( not ( = ?auto_140173 ?auto_140175 ) ) ( not ( = ?auto_140173 ?auto_140176 ) ) ( not ( = ?auto_140174 ?auto_140175 ) ) ( not ( = ?auto_140174 ?auto_140176 ) ) ( not ( = ?auto_140175 ?auto_140176 ) ) ( ON ?auto_140176 ?auto_140177 ) ( not ( = ?auto_140170 ?auto_140177 ) ) ( not ( = ?auto_140171 ?auto_140177 ) ) ( not ( = ?auto_140172 ?auto_140177 ) ) ( not ( = ?auto_140173 ?auto_140177 ) ) ( not ( = ?auto_140174 ?auto_140177 ) ) ( not ( = ?auto_140175 ?auto_140177 ) ) ( not ( = ?auto_140176 ?auto_140177 ) ) ( CLEAR ?auto_140174 ) ( ON ?auto_140175 ?auto_140176 ) ( CLEAR ?auto_140175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140178 ) ( ON ?auto_140177 ?auto_140178 ) ( not ( = ?auto_140178 ?auto_140177 ) ) ( not ( = ?auto_140178 ?auto_140176 ) ) ( not ( = ?auto_140178 ?auto_140175 ) ) ( not ( = ?auto_140170 ?auto_140178 ) ) ( not ( = ?auto_140171 ?auto_140178 ) ) ( not ( = ?auto_140172 ?auto_140178 ) ) ( not ( = ?auto_140173 ?auto_140178 ) ) ( not ( = ?auto_140174 ?auto_140178 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140178 ?auto_140177 ?auto_140176 )
      ( MAKE-7PILE ?auto_140170 ?auto_140171 ?auto_140172 ?auto_140173 ?auto_140174 ?auto_140175 ?auto_140176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140179 - BLOCK
      ?auto_140180 - BLOCK
      ?auto_140181 - BLOCK
      ?auto_140182 - BLOCK
      ?auto_140183 - BLOCK
      ?auto_140184 - BLOCK
      ?auto_140185 - BLOCK
    )
    :vars
    (
      ?auto_140186 - BLOCK
      ?auto_140187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140179 ) ( ON ?auto_140180 ?auto_140179 ) ( ON ?auto_140181 ?auto_140180 ) ( ON ?auto_140182 ?auto_140181 ) ( not ( = ?auto_140179 ?auto_140180 ) ) ( not ( = ?auto_140179 ?auto_140181 ) ) ( not ( = ?auto_140179 ?auto_140182 ) ) ( not ( = ?auto_140179 ?auto_140183 ) ) ( not ( = ?auto_140179 ?auto_140184 ) ) ( not ( = ?auto_140179 ?auto_140185 ) ) ( not ( = ?auto_140180 ?auto_140181 ) ) ( not ( = ?auto_140180 ?auto_140182 ) ) ( not ( = ?auto_140180 ?auto_140183 ) ) ( not ( = ?auto_140180 ?auto_140184 ) ) ( not ( = ?auto_140180 ?auto_140185 ) ) ( not ( = ?auto_140181 ?auto_140182 ) ) ( not ( = ?auto_140181 ?auto_140183 ) ) ( not ( = ?auto_140181 ?auto_140184 ) ) ( not ( = ?auto_140181 ?auto_140185 ) ) ( not ( = ?auto_140182 ?auto_140183 ) ) ( not ( = ?auto_140182 ?auto_140184 ) ) ( not ( = ?auto_140182 ?auto_140185 ) ) ( not ( = ?auto_140183 ?auto_140184 ) ) ( not ( = ?auto_140183 ?auto_140185 ) ) ( not ( = ?auto_140184 ?auto_140185 ) ) ( ON ?auto_140185 ?auto_140186 ) ( not ( = ?auto_140179 ?auto_140186 ) ) ( not ( = ?auto_140180 ?auto_140186 ) ) ( not ( = ?auto_140181 ?auto_140186 ) ) ( not ( = ?auto_140182 ?auto_140186 ) ) ( not ( = ?auto_140183 ?auto_140186 ) ) ( not ( = ?auto_140184 ?auto_140186 ) ) ( not ( = ?auto_140185 ?auto_140186 ) ) ( ON ?auto_140184 ?auto_140185 ) ( CLEAR ?auto_140184 ) ( ON-TABLE ?auto_140187 ) ( ON ?auto_140186 ?auto_140187 ) ( not ( = ?auto_140187 ?auto_140186 ) ) ( not ( = ?auto_140187 ?auto_140185 ) ) ( not ( = ?auto_140187 ?auto_140184 ) ) ( not ( = ?auto_140179 ?auto_140187 ) ) ( not ( = ?auto_140180 ?auto_140187 ) ) ( not ( = ?auto_140181 ?auto_140187 ) ) ( not ( = ?auto_140182 ?auto_140187 ) ) ( not ( = ?auto_140183 ?auto_140187 ) ) ( HOLDING ?auto_140183 ) ( CLEAR ?auto_140182 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140179 ?auto_140180 ?auto_140181 ?auto_140182 ?auto_140183 )
      ( MAKE-7PILE ?auto_140179 ?auto_140180 ?auto_140181 ?auto_140182 ?auto_140183 ?auto_140184 ?auto_140185 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140188 - BLOCK
      ?auto_140189 - BLOCK
      ?auto_140190 - BLOCK
      ?auto_140191 - BLOCK
      ?auto_140192 - BLOCK
      ?auto_140193 - BLOCK
      ?auto_140194 - BLOCK
    )
    :vars
    (
      ?auto_140195 - BLOCK
      ?auto_140196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140188 ) ( ON ?auto_140189 ?auto_140188 ) ( ON ?auto_140190 ?auto_140189 ) ( ON ?auto_140191 ?auto_140190 ) ( not ( = ?auto_140188 ?auto_140189 ) ) ( not ( = ?auto_140188 ?auto_140190 ) ) ( not ( = ?auto_140188 ?auto_140191 ) ) ( not ( = ?auto_140188 ?auto_140192 ) ) ( not ( = ?auto_140188 ?auto_140193 ) ) ( not ( = ?auto_140188 ?auto_140194 ) ) ( not ( = ?auto_140189 ?auto_140190 ) ) ( not ( = ?auto_140189 ?auto_140191 ) ) ( not ( = ?auto_140189 ?auto_140192 ) ) ( not ( = ?auto_140189 ?auto_140193 ) ) ( not ( = ?auto_140189 ?auto_140194 ) ) ( not ( = ?auto_140190 ?auto_140191 ) ) ( not ( = ?auto_140190 ?auto_140192 ) ) ( not ( = ?auto_140190 ?auto_140193 ) ) ( not ( = ?auto_140190 ?auto_140194 ) ) ( not ( = ?auto_140191 ?auto_140192 ) ) ( not ( = ?auto_140191 ?auto_140193 ) ) ( not ( = ?auto_140191 ?auto_140194 ) ) ( not ( = ?auto_140192 ?auto_140193 ) ) ( not ( = ?auto_140192 ?auto_140194 ) ) ( not ( = ?auto_140193 ?auto_140194 ) ) ( ON ?auto_140194 ?auto_140195 ) ( not ( = ?auto_140188 ?auto_140195 ) ) ( not ( = ?auto_140189 ?auto_140195 ) ) ( not ( = ?auto_140190 ?auto_140195 ) ) ( not ( = ?auto_140191 ?auto_140195 ) ) ( not ( = ?auto_140192 ?auto_140195 ) ) ( not ( = ?auto_140193 ?auto_140195 ) ) ( not ( = ?auto_140194 ?auto_140195 ) ) ( ON ?auto_140193 ?auto_140194 ) ( ON-TABLE ?auto_140196 ) ( ON ?auto_140195 ?auto_140196 ) ( not ( = ?auto_140196 ?auto_140195 ) ) ( not ( = ?auto_140196 ?auto_140194 ) ) ( not ( = ?auto_140196 ?auto_140193 ) ) ( not ( = ?auto_140188 ?auto_140196 ) ) ( not ( = ?auto_140189 ?auto_140196 ) ) ( not ( = ?auto_140190 ?auto_140196 ) ) ( not ( = ?auto_140191 ?auto_140196 ) ) ( not ( = ?auto_140192 ?auto_140196 ) ) ( CLEAR ?auto_140191 ) ( ON ?auto_140192 ?auto_140193 ) ( CLEAR ?auto_140192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140196 ?auto_140195 ?auto_140194 ?auto_140193 )
      ( MAKE-7PILE ?auto_140188 ?auto_140189 ?auto_140190 ?auto_140191 ?auto_140192 ?auto_140193 ?auto_140194 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140197 - BLOCK
      ?auto_140198 - BLOCK
      ?auto_140199 - BLOCK
      ?auto_140200 - BLOCK
      ?auto_140201 - BLOCK
      ?auto_140202 - BLOCK
      ?auto_140203 - BLOCK
    )
    :vars
    (
      ?auto_140205 - BLOCK
      ?auto_140204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140197 ) ( ON ?auto_140198 ?auto_140197 ) ( ON ?auto_140199 ?auto_140198 ) ( not ( = ?auto_140197 ?auto_140198 ) ) ( not ( = ?auto_140197 ?auto_140199 ) ) ( not ( = ?auto_140197 ?auto_140200 ) ) ( not ( = ?auto_140197 ?auto_140201 ) ) ( not ( = ?auto_140197 ?auto_140202 ) ) ( not ( = ?auto_140197 ?auto_140203 ) ) ( not ( = ?auto_140198 ?auto_140199 ) ) ( not ( = ?auto_140198 ?auto_140200 ) ) ( not ( = ?auto_140198 ?auto_140201 ) ) ( not ( = ?auto_140198 ?auto_140202 ) ) ( not ( = ?auto_140198 ?auto_140203 ) ) ( not ( = ?auto_140199 ?auto_140200 ) ) ( not ( = ?auto_140199 ?auto_140201 ) ) ( not ( = ?auto_140199 ?auto_140202 ) ) ( not ( = ?auto_140199 ?auto_140203 ) ) ( not ( = ?auto_140200 ?auto_140201 ) ) ( not ( = ?auto_140200 ?auto_140202 ) ) ( not ( = ?auto_140200 ?auto_140203 ) ) ( not ( = ?auto_140201 ?auto_140202 ) ) ( not ( = ?auto_140201 ?auto_140203 ) ) ( not ( = ?auto_140202 ?auto_140203 ) ) ( ON ?auto_140203 ?auto_140205 ) ( not ( = ?auto_140197 ?auto_140205 ) ) ( not ( = ?auto_140198 ?auto_140205 ) ) ( not ( = ?auto_140199 ?auto_140205 ) ) ( not ( = ?auto_140200 ?auto_140205 ) ) ( not ( = ?auto_140201 ?auto_140205 ) ) ( not ( = ?auto_140202 ?auto_140205 ) ) ( not ( = ?auto_140203 ?auto_140205 ) ) ( ON ?auto_140202 ?auto_140203 ) ( ON-TABLE ?auto_140204 ) ( ON ?auto_140205 ?auto_140204 ) ( not ( = ?auto_140204 ?auto_140205 ) ) ( not ( = ?auto_140204 ?auto_140203 ) ) ( not ( = ?auto_140204 ?auto_140202 ) ) ( not ( = ?auto_140197 ?auto_140204 ) ) ( not ( = ?auto_140198 ?auto_140204 ) ) ( not ( = ?auto_140199 ?auto_140204 ) ) ( not ( = ?auto_140200 ?auto_140204 ) ) ( not ( = ?auto_140201 ?auto_140204 ) ) ( ON ?auto_140201 ?auto_140202 ) ( CLEAR ?auto_140201 ) ( HOLDING ?auto_140200 ) ( CLEAR ?auto_140199 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140197 ?auto_140198 ?auto_140199 ?auto_140200 )
      ( MAKE-7PILE ?auto_140197 ?auto_140198 ?auto_140199 ?auto_140200 ?auto_140201 ?auto_140202 ?auto_140203 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140206 - BLOCK
      ?auto_140207 - BLOCK
      ?auto_140208 - BLOCK
      ?auto_140209 - BLOCK
      ?auto_140210 - BLOCK
      ?auto_140211 - BLOCK
      ?auto_140212 - BLOCK
    )
    :vars
    (
      ?auto_140213 - BLOCK
      ?auto_140214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140206 ) ( ON ?auto_140207 ?auto_140206 ) ( ON ?auto_140208 ?auto_140207 ) ( not ( = ?auto_140206 ?auto_140207 ) ) ( not ( = ?auto_140206 ?auto_140208 ) ) ( not ( = ?auto_140206 ?auto_140209 ) ) ( not ( = ?auto_140206 ?auto_140210 ) ) ( not ( = ?auto_140206 ?auto_140211 ) ) ( not ( = ?auto_140206 ?auto_140212 ) ) ( not ( = ?auto_140207 ?auto_140208 ) ) ( not ( = ?auto_140207 ?auto_140209 ) ) ( not ( = ?auto_140207 ?auto_140210 ) ) ( not ( = ?auto_140207 ?auto_140211 ) ) ( not ( = ?auto_140207 ?auto_140212 ) ) ( not ( = ?auto_140208 ?auto_140209 ) ) ( not ( = ?auto_140208 ?auto_140210 ) ) ( not ( = ?auto_140208 ?auto_140211 ) ) ( not ( = ?auto_140208 ?auto_140212 ) ) ( not ( = ?auto_140209 ?auto_140210 ) ) ( not ( = ?auto_140209 ?auto_140211 ) ) ( not ( = ?auto_140209 ?auto_140212 ) ) ( not ( = ?auto_140210 ?auto_140211 ) ) ( not ( = ?auto_140210 ?auto_140212 ) ) ( not ( = ?auto_140211 ?auto_140212 ) ) ( ON ?auto_140212 ?auto_140213 ) ( not ( = ?auto_140206 ?auto_140213 ) ) ( not ( = ?auto_140207 ?auto_140213 ) ) ( not ( = ?auto_140208 ?auto_140213 ) ) ( not ( = ?auto_140209 ?auto_140213 ) ) ( not ( = ?auto_140210 ?auto_140213 ) ) ( not ( = ?auto_140211 ?auto_140213 ) ) ( not ( = ?auto_140212 ?auto_140213 ) ) ( ON ?auto_140211 ?auto_140212 ) ( ON-TABLE ?auto_140214 ) ( ON ?auto_140213 ?auto_140214 ) ( not ( = ?auto_140214 ?auto_140213 ) ) ( not ( = ?auto_140214 ?auto_140212 ) ) ( not ( = ?auto_140214 ?auto_140211 ) ) ( not ( = ?auto_140206 ?auto_140214 ) ) ( not ( = ?auto_140207 ?auto_140214 ) ) ( not ( = ?auto_140208 ?auto_140214 ) ) ( not ( = ?auto_140209 ?auto_140214 ) ) ( not ( = ?auto_140210 ?auto_140214 ) ) ( ON ?auto_140210 ?auto_140211 ) ( CLEAR ?auto_140208 ) ( ON ?auto_140209 ?auto_140210 ) ( CLEAR ?auto_140209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140214 ?auto_140213 ?auto_140212 ?auto_140211 ?auto_140210 )
      ( MAKE-7PILE ?auto_140206 ?auto_140207 ?auto_140208 ?auto_140209 ?auto_140210 ?auto_140211 ?auto_140212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140215 - BLOCK
      ?auto_140216 - BLOCK
      ?auto_140217 - BLOCK
      ?auto_140218 - BLOCK
      ?auto_140219 - BLOCK
      ?auto_140220 - BLOCK
      ?auto_140221 - BLOCK
    )
    :vars
    (
      ?auto_140223 - BLOCK
      ?auto_140222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140215 ) ( ON ?auto_140216 ?auto_140215 ) ( not ( = ?auto_140215 ?auto_140216 ) ) ( not ( = ?auto_140215 ?auto_140217 ) ) ( not ( = ?auto_140215 ?auto_140218 ) ) ( not ( = ?auto_140215 ?auto_140219 ) ) ( not ( = ?auto_140215 ?auto_140220 ) ) ( not ( = ?auto_140215 ?auto_140221 ) ) ( not ( = ?auto_140216 ?auto_140217 ) ) ( not ( = ?auto_140216 ?auto_140218 ) ) ( not ( = ?auto_140216 ?auto_140219 ) ) ( not ( = ?auto_140216 ?auto_140220 ) ) ( not ( = ?auto_140216 ?auto_140221 ) ) ( not ( = ?auto_140217 ?auto_140218 ) ) ( not ( = ?auto_140217 ?auto_140219 ) ) ( not ( = ?auto_140217 ?auto_140220 ) ) ( not ( = ?auto_140217 ?auto_140221 ) ) ( not ( = ?auto_140218 ?auto_140219 ) ) ( not ( = ?auto_140218 ?auto_140220 ) ) ( not ( = ?auto_140218 ?auto_140221 ) ) ( not ( = ?auto_140219 ?auto_140220 ) ) ( not ( = ?auto_140219 ?auto_140221 ) ) ( not ( = ?auto_140220 ?auto_140221 ) ) ( ON ?auto_140221 ?auto_140223 ) ( not ( = ?auto_140215 ?auto_140223 ) ) ( not ( = ?auto_140216 ?auto_140223 ) ) ( not ( = ?auto_140217 ?auto_140223 ) ) ( not ( = ?auto_140218 ?auto_140223 ) ) ( not ( = ?auto_140219 ?auto_140223 ) ) ( not ( = ?auto_140220 ?auto_140223 ) ) ( not ( = ?auto_140221 ?auto_140223 ) ) ( ON ?auto_140220 ?auto_140221 ) ( ON-TABLE ?auto_140222 ) ( ON ?auto_140223 ?auto_140222 ) ( not ( = ?auto_140222 ?auto_140223 ) ) ( not ( = ?auto_140222 ?auto_140221 ) ) ( not ( = ?auto_140222 ?auto_140220 ) ) ( not ( = ?auto_140215 ?auto_140222 ) ) ( not ( = ?auto_140216 ?auto_140222 ) ) ( not ( = ?auto_140217 ?auto_140222 ) ) ( not ( = ?auto_140218 ?auto_140222 ) ) ( not ( = ?auto_140219 ?auto_140222 ) ) ( ON ?auto_140219 ?auto_140220 ) ( ON ?auto_140218 ?auto_140219 ) ( CLEAR ?auto_140218 ) ( HOLDING ?auto_140217 ) ( CLEAR ?auto_140216 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140215 ?auto_140216 ?auto_140217 )
      ( MAKE-7PILE ?auto_140215 ?auto_140216 ?auto_140217 ?auto_140218 ?auto_140219 ?auto_140220 ?auto_140221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140224 - BLOCK
      ?auto_140225 - BLOCK
      ?auto_140226 - BLOCK
      ?auto_140227 - BLOCK
      ?auto_140228 - BLOCK
      ?auto_140229 - BLOCK
      ?auto_140230 - BLOCK
    )
    :vars
    (
      ?auto_140231 - BLOCK
      ?auto_140232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140224 ) ( ON ?auto_140225 ?auto_140224 ) ( not ( = ?auto_140224 ?auto_140225 ) ) ( not ( = ?auto_140224 ?auto_140226 ) ) ( not ( = ?auto_140224 ?auto_140227 ) ) ( not ( = ?auto_140224 ?auto_140228 ) ) ( not ( = ?auto_140224 ?auto_140229 ) ) ( not ( = ?auto_140224 ?auto_140230 ) ) ( not ( = ?auto_140225 ?auto_140226 ) ) ( not ( = ?auto_140225 ?auto_140227 ) ) ( not ( = ?auto_140225 ?auto_140228 ) ) ( not ( = ?auto_140225 ?auto_140229 ) ) ( not ( = ?auto_140225 ?auto_140230 ) ) ( not ( = ?auto_140226 ?auto_140227 ) ) ( not ( = ?auto_140226 ?auto_140228 ) ) ( not ( = ?auto_140226 ?auto_140229 ) ) ( not ( = ?auto_140226 ?auto_140230 ) ) ( not ( = ?auto_140227 ?auto_140228 ) ) ( not ( = ?auto_140227 ?auto_140229 ) ) ( not ( = ?auto_140227 ?auto_140230 ) ) ( not ( = ?auto_140228 ?auto_140229 ) ) ( not ( = ?auto_140228 ?auto_140230 ) ) ( not ( = ?auto_140229 ?auto_140230 ) ) ( ON ?auto_140230 ?auto_140231 ) ( not ( = ?auto_140224 ?auto_140231 ) ) ( not ( = ?auto_140225 ?auto_140231 ) ) ( not ( = ?auto_140226 ?auto_140231 ) ) ( not ( = ?auto_140227 ?auto_140231 ) ) ( not ( = ?auto_140228 ?auto_140231 ) ) ( not ( = ?auto_140229 ?auto_140231 ) ) ( not ( = ?auto_140230 ?auto_140231 ) ) ( ON ?auto_140229 ?auto_140230 ) ( ON-TABLE ?auto_140232 ) ( ON ?auto_140231 ?auto_140232 ) ( not ( = ?auto_140232 ?auto_140231 ) ) ( not ( = ?auto_140232 ?auto_140230 ) ) ( not ( = ?auto_140232 ?auto_140229 ) ) ( not ( = ?auto_140224 ?auto_140232 ) ) ( not ( = ?auto_140225 ?auto_140232 ) ) ( not ( = ?auto_140226 ?auto_140232 ) ) ( not ( = ?auto_140227 ?auto_140232 ) ) ( not ( = ?auto_140228 ?auto_140232 ) ) ( ON ?auto_140228 ?auto_140229 ) ( ON ?auto_140227 ?auto_140228 ) ( CLEAR ?auto_140225 ) ( ON ?auto_140226 ?auto_140227 ) ( CLEAR ?auto_140226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140232 ?auto_140231 ?auto_140230 ?auto_140229 ?auto_140228 ?auto_140227 )
      ( MAKE-7PILE ?auto_140224 ?auto_140225 ?auto_140226 ?auto_140227 ?auto_140228 ?auto_140229 ?auto_140230 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140233 - BLOCK
      ?auto_140234 - BLOCK
      ?auto_140235 - BLOCK
      ?auto_140236 - BLOCK
      ?auto_140237 - BLOCK
      ?auto_140238 - BLOCK
      ?auto_140239 - BLOCK
    )
    :vars
    (
      ?auto_140240 - BLOCK
      ?auto_140241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140233 ) ( not ( = ?auto_140233 ?auto_140234 ) ) ( not ( = ?auto_140233 ?auto_140235 ) ) ( not ( = ?auto_140233 ?auto_140236 ) ) ( not ( = ?auto_140233 ?auto_140237 ) ) ( not ( = ?auto_140233 ?auto_140238 ) ) ( not ( = ?auto_140233 ?auto_140239 ) ) ( not ( = ?auto_140234 ?auto_140235 ) ) ( not ( = ?auto_140234 ?auto_140236 ) ) ( not ( = ?auto_140234 ?auto_140237 ) ) ( not ( = ?auto_140234 ?auto_140238 ) ) ( not ( = ?auto_140234 ?auto_140239 ) ) ( not ( = ?auto_140235 ?auto_140236 ) ) ( not ( = ?auto_140235 ?auto_140237 ) ) ( not ( = ?auto_140235 ?auto_140238 ) ) ( not ( = ?auto_140235 ?auto_140239 ) ) ( not ( = ?auto_140236 ?auto_140237 ) ) ( not ( = ?auto_140236 ?auto_140238 ) ) ( not ( = ?auto_140236 ?auto_140239 ) ) ( not ( = ?auto_140237 ?auto_140238 ) ) ( not ( = ?auto_140237 ?auto_140239 ) ) ( not ( = ?auto_140238 ?auto_140239 ) ) ( ON ?auto_140239 ?auto_140240 ) ( not ( = ?auto_140233 ?auto_140240 ) ) ( not ( = ?auto_140234 ?auto_140240 ) ) ( not ( = ?auto_140235 ?auto_140240 ) ) ( not ( = ?auto_140236 ?auto_140240 ) ) ( not ( = ?auto_140237 ?auto_140240 ) ) ( not ( = ?auto_140238 ?auto_140240 ) ) ( not ( = ?auto_140239 ?auto_140240 ) ) ( ON ?auto_140238 ?auto_140239 ) ( ON-TABLE ?auto_140241 ) ( ON ?auto_140240 ?auto_140241 ) ( not ( = ?auto_140241 ?auto_140240 ) ) ( not ( = ?auto_140241 ?auto_140239 ) ) ( not ( = ?auto_140241 ?auto_140238 ) ) ( not ( = ?auto_140233 ?auto_140241 ) ) ( not ( = ?auto_140234 ?auto_140241 ) ) ( not ( = ?auto_140235 ?auto_140241 ) ) ( not ( = ?auto_140236 ?auto_140241 ) ) ( not ( = ?auto_140237 ?auto_140241 ) ) ( ON ?auto_140237 ?auto_140238 ) ( ON ?auto_140236 ?auto_140237 ) ( ON ?auto_140235 ?auto_140236 ) ( CLEAR ?auto_140235 ) ( HOLDING ?auto_140234 ) ( CLEAR ?auto_140233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140233 ?auto_140234 )
      ( MAKE-7PILE ?auto_140233 ?auto_140234 ?auto_140235 ?auto_140236 ?auto_140237 ?auto_140238 ?auto_140239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140242 - BLOCK
      ?auto_140243 - BLOCK
      ?auto_140244 - BLOCK
      ?auto_140245 - BLOCK
      ?auto_140246 - BLOCK
      ?auto_140247 - BLOCK
      ?auto_140248 - BLOCK
    )
    :vars
    (
      ?auto_140250 - BLOCK
      ?auto_140249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140242 ) ( not ( = ?auto_140242 ?auto_140243 ) ) ( not ( = ?auto_140242 ?auto_140244 ) ) ( not ( = ?auto_140242 ?auto_140245 ) ) ( not ( = ?auto_140242 ?auto_140246 ) ) ( not ( = ?auto_140242 ?auto_140247 ) ) ( not ( = ?auto_140242 ?auto_140248 ) ) ( not ( = ?auto_140243 ?auto_140244 ) ) ( not ( = ?auto_140243 ?auto_140245 ) ) ( not ( = ?auto_140243 ?auto_140246 ) ) ( not ( = ?auto_140243 ?auto_140247 ) ) ( not ( = ?auto_140243 ?auto_140248 ) ) ( not ( = ?auto_140244 ?auto_140245 ) ) ( not ( = ?auto_140244 ?auto_140246 ) ) ( not ( = ?auto_140244 ?auto_140247 ) ) ( not ( = ?auto_140244 ?auto_140248 ) ) ( not ( = ?auto_140245 ?auto_140246 ) ) ( not ( = ?auto_140245 ?auto_140247 ) ) ( not ( = ?auto_140245 ?auto_140248 ) ) ( not ( = ?auto_140246 ?auto_140247 ) ) ( not ( = ?auto_140246 ?auto_140248 ) ) ( not ( = ?auto_140247 ?auto_140248 ) ) ( ON ?auto_140248 ?auto_140250 ) ( not ( = ?auto_140242 ?auto_140250 ) ) ( not ( = ?auto_140243 ?auto_140250 ) ) ( not ( = ?auto_140244 ?auto_140250 ) ) ( not ( = ?auto_140245 ?auto_140250 ) ) ( not ( = ?auto_140246 ?auto_140250 ) ) ( not ( = ?auto_140247 ?auto_140250 ) ) ( not ( = ?auto_140248 ?auto_140250 ) ) ( ON ?auto_140247 ?auto_140248 ) ( ON-TABLE ?auto_140249 ) ( ON ?auto_140250 ?auto_140249 ) ( not ( = ?auto_140249 ?auto_140250 ) ) ( not ( = ?auto_140249 ?auto_140248 ) ) ( not ( = ?auto_140249 ?auto_140247 ) ) ( not ( = ?auto_140242 ?auto_140249 ) ) ( not ( = ?auto_140243 ?auto_140249 ) ) ( not ( = ?auto_140244 ?auto_140249 ) ) ( not ( = ?auto_140245 ?auto_140249 ) ) ( not ( = ?auto_140246 ?auto_140249 ) ) ( ON ?auto_140246 ?auto_140247 ) ( ON ?auto_140245 ?auto_140246 ) ( ON ?auto_140244 ?auto_140245 ) ( CLEAR ?auto_140242 ) ( ON ?auto_140243 ?auto_140244 ) ( CLEAR ?auto_140243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140249 ?auto_140250 ?auto_140248 ?auto_140247 ?auto_140246 ?auto_140245 ?auto_140244 )
      ( MAKE-7PILE ?auto_140242 ?auto_140243 ?auto_140244 ?auto_140245 ?auto_140246 ?auto_140247 ?auto_140248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140251 - BLOCK
      ?auto_140252 - BLOCK
      ?auto_140253 - BLOCK
      ?auto_140254 - BLOCK
      ?auto_140255 - BLOCK
      ?auto_140256 - BLOCK
      ?auto_140257 - BLOCK
    )
    :vars
    (
      ?auto_140259 - BLOCK
      ?auto_140258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140251 ?auto_140252 ) ) ( not ( = ?auto_140251 ?auto_140253 ) ) ( not ( = ?auto_140251 ?auto_140254 ) ) ( not ( = ?auto_140251 ?auto_140255 ) ) ( not ( = ?auto_140251 ?auto_140256 ) ) ( not ( = ?auto_140251 ?auto_140257 ) ) ( not ( = ?auto_140252 ?auto_140253 ) ) ( not ( = ?auto_140252 ?auto_140254 ) ) ( not ( = ?auto_140252 ?auto_140255 ) ) ( not ( = ?auto_140252 ?auto_140256 ) ) ( not ( = ?auto_140252 ?auto_140257 ) ) ( not ( = ?auto_140253 ?auto_140254 ) ) ( not ( = ?auto_140253 ?auto_140255 ) ) ( not ( = ?auto_140253 ?auto_140256 ) ) ( not ( = ?auto_140253 ?auto_140257 ) ) ( not ( = ?auto_140254 ?auto_140255 ) ) ( not ( = ?auto_140254 ?auto_140256 ) ) ( not ( = ?auto_140254 ?auto_140257 ) ) ( not ( = ?auto_140255 ?auto_140256 ) ) ( not ( = ?auto_140255 ?auto_140257 ) ) ( not ( = ?auto_140256 ?auto_140257 ) ) ( ON ?auto_140257 ?auto_140259 ) ( not ( = ?auto_140251 ?auto_140259 ) ) ( not ( = ?auto_140252 ?auto_140259 ) ) ( not ( = ?auto_140253 ?auto_140259 ) ) ( not ( = ?auto_140254 ?auto_140259 ) ) ( not ( = ?auto_140255 ?auto_140259 ) ) ( not ( = ?auto_140256 ?auto_140259 ) ) ( not ( = ?auto_140257 ?auto_140259 ) ) ( ON ?auto_140256 ?auto_140257 ) ( ON-TABLE ?auto_140258 ) ( ON ?auto_140259 ?auto_140258 ) ( not ( = ?auto_140258 ?auto_140259 ) ) ( not ( = ?auto_140258 ?auto_140257 ) ) ( not ( = ?auto_140258 ?auto_140256 ) ) ( not ( = ?auto_140251 ?auto_140258 ) ) ( not ( = ?auto_140252 ?auto_140258 ) ) ( not ( = ?auto_140253 ?auto_140258 ) ) ( not ( = ?auto_140254 ?auto_140258 ) ) ( not ( = ?auto_140255 ?auto_140258 ) ) ( ON ?auto_140255 ?auto_140256 ) ( ON ?auto_140254 ?auto_140255 ) ( ON ?auto_140253 ?auto_140254 ) ( ON ?auto_140252 ?auto_140253 ) ( CLEAR ?auto_140252 ) ( HOLDING ?auto_140251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140251 )
      ( MAKE-7PILE ?auto_140251 ?auto_140252 ?auto_140253 ?auto_140254 ?auto_140255 ?auto_140256 ?auto_140257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140260 - BLOCK
      ?auto_140261 - BLOCK
      ?auto_140262 - BLOCK
      ?auto_140263 - BLOCK
      ?auto_140264 - BLOCK
      ?auto_140265 - BLOCK
      ?auto_140266 - BLOCK
    )
    :vars
    (
      ?auto_140268 - BLOCK
      ?auto_140267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140260 ?auto_140261 ) ) ( not ( = ?auto_140260 ?auto_140262 ) ) ( not ( = ?auto_140260 ?auto_140263 ) ) ( not ( = ?auto_140260 ?auto_140264 ) ) ( not ( = ?auto_140260 ?auto_140265 ) ) ( not ( = ?auto_140260 ?auto_140266 ) ) ( not ( = ?auto_140261 ?auto_140262 ) ) ( not ( = ?auto_140261 ?auto_140263 ) ) ( not ( = ?auto_140261 ?auto_140264 ) ) ( not ( = ?auto_140261 ?auto_140265 ) ) ( not ( = ?auto_140261 ?auto_140266 ) ) ( not ( = ?auto_140262 ?auto_140263 ) ) ( not ( = ?auto_140262 ?auto_140264 ) ) ( not ( = ?auto_140262 ?auto_140265 ) ) ( not ( = ?auto_140262 ?auto_140266 ) ) ( not ( = ?auto_140263 ?auto_140264 ) ) ( not ( = ?auto_140263 ?auto_140265 ) ) ( not ( = ?auto_140263 ?auto_140266 ) ) ( not ( = ?auto_140264 ?auto_140265 ) ) ( not ( = ?auto_140264 ?auto_140266 ) ) ( not ( = ?auto_140265 ?auto_140266 ) ) ( ON ?auto_140266 ?auto_140268 ) ( not ( = ?auto_140260 ?auto_140268 ) ) ( not ( = ?auto_140261 ?auto_140268 ) ) ( not ( = ?auto_140262 ?auto_140268 ) ) ( not ( = ?auto_140263 ?auto_140268 ) ) ( not ( = ?auto_140264 ?auto_140268 ) ) ( not ( = ?auto_140265 ?auto_140268 ) ) ( not ( = ?auto_140266 ?auto_140268 ) ) ( ON ?auto_140265 ?auto_140266 ) ( ON-TABLE ?auto_140267 ) ( ON ?auto_140268 ?auto_140267 ) ( not ( = ?auto_140267 ?auto_140268 ) ) ( not ( = ?auto_140267 ?auto_140266 ) ) ( not ( = ?auto_140267 ?auto_140265 ) ) ( not ( = ?auto_140260 ?auto_140267 ) ) ( not ( = ?auto_140261 ?auto_140267 ) ) ( not ( = ?auto_140262 ?auto_140267 ) ) ( not ( = ?auto_140263 ?auto_140267 ) ) ( not ( = ?auto_140264 ?auto_140267 ) ) ( ON ?auto_140264 ?auto_140265 ) ( ON ?auto_140263 ?auto_140264 ) ( ON ?auto_140262 ?auto_140263 ) ( ON ?auto_140261 ?auto_140262 ) ( ON ?auto_140260 ?auto_140261 ) ( CLEAR ?auto_140260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140267 ?auto_140268 ?auto_140266 ?auto_140265 ?auto_140264 ?auto_140263 ?auto_140262 ?auto_140261 )
      ( MAKE-7PILE ?auto_140260 ?auto_140261 ?auto_140262 ?auto_140263 ?auto_140264 ?auto_140265 ?auto_140266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140270 - BLOCK
    )
    :vars
    (
      ?auto_140271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140271 ?auto_140270 ) ( CLEAR ?auto_140271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140270 ) ( not ( = ?auto_140270 ?auto_140271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140271 ?auto_140270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140272 - BLOCK
    )
    :vars
    (
      ?auto_140273 - BLOCK
      ?auto_140274 - BLOCK
      ?auto_140275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140273 ?auto_140272 ) ( CLEAR ?auto_140273 ) ( ON-TABLE ?auto_140272 ) ( not ( = ?auto_140272 ?auto_140273 ) ) ( HOLDING ?auto_140274 ) ( CLEAR ?auto_140275 ) ( not ( = ?auto_140272 ?auto_140274 ) ) ( not ( = ?auto_140272 ?auto_140275 ) ) ( not ( = ?auto_140273 ?auto_140274 ) ) ( not ( = ?auto_140273 ?auto_140275 ) ) ( not ( = ?auto_140274 ?auto_140275 ) ) )
    :subtasks
    ( ( !STACK ?auto_140274 ?auto_140275 )
      ( MAKE-1PILE ?auto_140272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140276 - BLOCK
    )
    :vars
    (
      ?auto_140278 - BLOCK
      ?auto_140279 - BLOCK
      ?auto_140277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140278 ?auto_140276 ) ( ON-TABLE ?auto_140276 ) ( not ( = ?auto_140276 ?auto_140278 ) ) ( CLEAR ?auto_140279 ) ( not ( = ?auto_140276 ?auto_140277 ) ) ( not ( = ?auto_140276 ?auto_140279 ) ) ( not ( = ?auto_140278 ?auto_140277 ) ) ( not ( = ?auto_140278 ?auto_140279 ) ) ( not ( = ?auto_140277 ?auto_140279 ) ) ( ON ?auto_140277 ?auto_140278 ) ( CLEAR ?auto_140277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140276 ?auto_140278 )
      ( MAKE-1PILE ?auto_140276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140280 - BLOCK
    )
    :vars
    (
      ?auto_140281 - BLOCK
      ?auto_140282 - BLOCK
      ?auto_140283 - BLOCK
      ?auto_140284 - BLOCK
      ?auto_140288 - BLOCK
      ?auto_140287 - BLOCK
      ?auto_140286 - BLOCK
      ?auto_140285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140281 ?auto_140280 ) ( ON-TABLE ?auto_140280 ) ( not ( = ?auto_140280 ?auto_140281 ) ) ( not ( = ?auto_140280 ?auto_140282 ) ) ( not ( = ?auto_140280 ?auto_140283 ) ) ( not ( = ?auto_140281 ?auto_140282 ) ) ( not ( = ?auto_140281 ?auto_140283 ) ) ( not ( = ?auto_140282 ?auto_140283 ) ) ( ON ?auto_140282 ?auto_140281 ) ( CLEAR ?auto_140282 ) ( HOLDING ?auto_140283 ) ( CLEAR ?auto_140284 ) ( ON-TABLE ?auto_140288 ) ( ON ?auto_140287 ?auto_140288 ) ( ON ?auto_140286 ?auto_140287 ) ( ON ?auto_140285 ?auto_140286 ) ( ON ?auto_140284 ?auto_140285 ) ( not ( = ?auto_140288 ?auto_140287 ) ) ( not ( = ?auto_140288 ?auto_140286 ) ) ( not ( = ?auto_140288 ?auto_140285 ) ) ( not ( = ?auto_140288 ?auto_140284 ) ) ( not ( = ?auto_140288 ?auto_140283 ) ) ( not ( = ?auto_140287 ?auto_140286 ) ) ( not ( = ?auto_140287 ?auto_140285 ) ) ( not ( = ?auto_140287 ?auto_140284 ) ) ( not ( = ?auto_140287 ?auto_140283 ) ) ( not ( = ?auto_140286 ?auto_140285 ) ) ( not ( = ?auto_140286 ?auto_140284 ) ) ( not ( = ?auto_140286 ?auto_140283 ) ) ( not ( = ?auto_140285 ?auto_140284 ) ) ( not ( = ?auto_140285 ?auto_140283 ) ) ( not ( = ?auto_140284 ?auto_140283 ) ) ( not ( = ?auto_140280 ?auto_140284 ) ) ( not ( = ?auto_140280 ?auto_140288 ) ) ( not ( = ?auto_140280 ?auto_140287 ) ) ( not ( = ?auto_140280 ?auto_140286 ) ) ( not ( = ?auto_140280 ?auto_140285 ) ) ( not ( = ?auto_140281 ?auto_140284 ) ) ( not ( = ?auto_140281 ?auto_140288 ) ) ( not ( = ?auto_140281 ?auto_140287 ) ) ( not ( = ?auto_140281 ?auto_140286 ) ) ( not ( = ?auto_140281 ?auto_140285 ) ) ( not ( = ?auto_140282 ?auto_140284 ) ) ( not ( = ?auto_140282 ?auto_140288 ) ) ( not ( = ?auto_140282 ?auto_140287 ) ) ( not ( = ?auto_140282 ?auto_140286 ) ) ( not ( = ?auto_140282 ?auto_140285 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140288 ?auto_140287 ?auto_140286 ?auto_140285 ?auto_140284 ?auto_140283 )
      ( MAKE-1PILE ?auto_140280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140289 - BLOCK
    )
    :vars
    (
      ?auto_140296 - BLOCK
      ?auto_140293 - BLOCK
      ?auto_140290 - BLOCK
      ?auto_140291 - BLOCK
      ?auto_140295 - BLOCK
      ?auto_140297 - BLOCK
      ?auto_140294 - BLOCK
      ?auto_140292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140296 ?auto_140289 ) ( ON-TABLE ?auto_140289 ) ( not ( = ?auto_140289 ?auto_140296 ) ) ( not ( = ?auto_140289 ?auto_140293 ) ) ( not ( = ?auto_140289 ?auto_140290 ) ) ( not ( = ?auto_140296 ?auto_140293 ) ) ( not ( = ?auto_140296 ?auto_140290 ) ) ( not ( = ?auto_140293 ?auto_140290 ) ) ( ON ?auto_140293 ?auto_140296 ) ( CLEAR ?auto_140291 ) ( ON-TABLE ?auto_140295 ) ( ON ?auto_140297 ?auto_140295 ) ( ON ?auto_140294 ?auto_140297 ) ( ON ?auto_140292 ?auto_140294 ) ( ON ?auto_140291 ?auto_140292 ) ( not ( = ?auto_140295 ?auto_140297 ) ) ( not ( = ?auto_140295 ?auto_140294 ) ) ( not ( = ?auto_140295 ?auto_140292 ) ) ( not ( = ?auto_140295 ?auto_140291 ) ) ( not ( = ?auto_140295 ?auto_140290 ) ) ( not ( = ?auto_140297 ?auto_140294 ) ) ( not ( = ?auto_140297 ?auto_140292 ) ) ( not ( = ?auto_140297 ?auto_140291 ) ) ( not ( = ?auto_140297 ?auto_140290 ) ) ( not ( = ?auto_140294 ?auto_140292 ) ) ( not ( = ?auto_140294 ?auto_140291 ) ) ( not ( = ?auto_140294 ?auto_140290 ) ) ( not ( = ?auto_140292 ?auto_140291 ) ) ( not ( = ?auto_140292 ?auto_140290 ) ) ( not ( = ?auto_140291 ?auto_140290 ) ) ( not ( = ?auto_140289 ?auto_140291 ) ) ( not ( = ?auto_140289 ?auto_140295 ) ) ( not ( = ?auto_140289 ?auto_140297 ) ) ( not ( = ?auto_140289 ?auto_140294 ) ) ( not ( = ?auto_140289 ?auto_140292 ) ) ( not ( = ?auto_140296 ?auto_140291 ) ) ( not ( = ?auto_140296 ?auto_140295 ) ) ( not ( = ?auto_140296 ?auto_140297 ) ) ( not ( = ?auto_140296 ?auto_140294 ) ) ( not ( = ?auto_140296 ?auto_140292 ) ) ( not ( = ?auto_140293 ?auto_140291 ) ) ( not ( = ?auto_140293 ?auto_140295 ) ) ( not ( = ?auto_140293 ?auto_140297 ) ) ( not ( = ?auto_140293 ?auto_140294 ) ) ( not ( = ?auto_140293 ?auto_140292 ) ) ( ON ?auto_140290 ?auto_140293 ) ( CLEAR ?auto_140290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140289 ?auto_140296 ?auto_140293 )
      ( MAKE-1PILE ?auto_140289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140298 - BLOCK
    )
    :vars
    (
      ?auto_140306 - BLOCK
      ?auto_140299 - BLOCK
      ?auto_140305 - BLOCK
      ?auto_140300 - BLOCK
      ?auto_140301 - BLOCK
      ?auto_140304 - BLOCK
      ?auto_140303 - BLOCK
      ?auto_140302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140306 ?auto_140298 ) ( ON-TABLE ?auto_140298 ) ( not ( = ?auto_140298 ?auto_140306 ) ) ( not ( = ?auto_140298 ?auto_140299 ) ) ( not ( = ?auto_140298 ?auto_140305 ) ) ( not ( = ?auto_140306 ?auto_140299 ) ) ( not ( = ?auto_140306 ?auto_140305 ) ) ( not ( = ?auto_140299 ?auto_140305 ) ) ( ON ?auto_140299 ?auto_140306 ) ( ON-TABLE ?auto_140300 ) ( ON ?auto_140301 ?auto_140300 ) ( ON ?auto_140304 ?auto_140301 ) ( ON ?auto_140303 ?auto_140304 ) ( not ( = ?auto_140300 ?auto_140301 ) ) ( not ( = ?auto_140300 ?auto_140304 ) ) ( not ( = ?auto_140300 ?auto_140303 ) ) ( not ( = ?auto_140300 ?auto_140302 ) ) ( not ( = ?auto_140300 ?auto_140305 ) ) ( not ( = ?auto_140301 ?auto_140304 ) ) ( not ( = ?auto_140301 ?auto_140303 ) ) ( not ( = ?auto_140301 ?auto_140302 ) ) ( not ( = ?auto_140301 ?auto_140305 ) ) ( not ( = ?auto_140304 ?auto_140303 ) ) ( not ( = ?auto_140304 ?auto_140302 ) ) ( not ( = ?auto_140304 ?auto_140305 ) ) ( not ( = ?auto_140303 ?auto_140302 ) ) ( not ( = ?auto_140303 ?auto_140305 ) ) ( not ( = ?auto_140302 ?auto_140305 ) ) ( not ( = ?auto_140298 ?auto_140302 ) ) ( not ( = ?auto_140298 ?auto_140300 ) ) ( not ( = ?auto_140298 ?auto_140301 ) ) ( not ( = ?auto_140298 ?auto_140304 ) ) ( not ( = ?auto_140298 ?auto_140303 ) ) ( not ( = ?auto_140306 ?auto_140302 ) ) ( not ( = ?auto_140306 ?auto_140300 ) ) ( not ( = ?auto_140306 ?auto_140301 ) ) ( not ( = ?auto_140306 ?auto_140304 ) ) ( not ( = ?auto_140306 ?auto_140303 ) ) ( not ( = ?auto_140299 ?auto_140302 ) ) ( not ( = ?auto_140299 ?auto_140300 ) ) ( not ( = ?auto_140299 ?auto_140301 ) ) ( not ( = ?auto_140299 ?auto_140304 ) ) ( not ( = ?auto_140299 ?auto_140303 ) ) ( ON ?auto_140305 ?auto_140299 ) ( CLEAR ?auto_140305 ) ( HOLDING ?auto_140302 ) ( CLEAR ?auto_140303 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140300 ?auto_140301 ?auto_140304 ?auto_140303 ?auto_140302 )
      ( MAKE-1PILE ?auto_140298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140307 - BLOCK
    )
    :vars
    (
      ?auto_140315 - BLOCK
      ?auto_140309 - BLOCK
      ?auto_140314 - BLOCK
      ?auto_140308 - BLOCK
      ?auto_140312 - BLOCK
      ?auto_140310 - BLOCK
      ?auto_140313 - BLOCK
      ?auto_140311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140315 ?auto_140307 ) ( ON-TABLE ?auto_140307 ) ( not ( = ?auto_140307 ?auto_140315 ) ) ( not ( = ?auto_140307 ?auto_140309 ) ) ( not ( = ?auto_140307 ?auto_140314 ) ) ( not ( = ?auto_140315 ?auto_140309 ) ) ( not ( = ?auto_140315 ?auto_140314 ) ) ( not ( = ?auto_140309 ?auto_140314 ) ) ( ON ?auto_140309 ?auto_140315 ) ( ON-TABLE ?auto_140308 ) ( ON ?auto_140312 ?auto_140308 ) ( ON ?auto_140310 ?auto_140312 ) ( ON ?auto_140313 ?auto_140310 ) ( not ( = ?auto_140308 ?auto_140312 ) ) ( not ( = ?auto_140308 ?auto_140310 ) ) ( not ( = ?auto_140308 ?auto_140313 ) ) ( not ( = ?auto_140308 ?auto_140311 ) ) ( not ( = ?auto_140308 ?auto_140314 ) ) ( not ( = ?auto_140312 ?auto_140310 ) ) ( not ( = ?auto_140312 ?auto_140313 ) ) ( not ( = ?auto_140312 ?auto_140311 ) ) ( not ( = ?auto_140312 ?auto_140314 ) ) ( not ( = ?auto_140310 ?auto_140313 ) ) ( not ( = ?auto_140310 ?auto_140311 ) ) ( not ( = ?auto_140310 ?auto_140314 ) ) ( not ( = ?auto_140313 ?auto_140311 ) ) ( not ( = ?auto_140313 ?auto_140314 ) ) ( not ( = ?auto_140311 ?auto_140314 ) ) ( not ( = ?auto_140307 ?auto_140311 ) ) ( not ( = ?auto_140307 ?auto_140308 ) ) ( not ( = ?auto_140307 ?auto_140312 ) ) ( not ( = ?auto_140307 ?auto_140310 ) ) ( not ( = ?auto_140307 ?auto_140313 ) ) ( not ( = ?auto_140315 ?auto_140311 ) ) ( not ( = ?auto_140315 ?auto_140308 ) ) ( not ( = ?auto_140315 ?auto_140312 ) ) ( not ( = ?auto_140315 ?auto_140310 ) ) ( not ( = ?auto_140315 ?auto_140313 ) ) ( not ( = ?auto_140309 ?auto_140311 ) ) ( not ( = ?auto_140309 ?auto_140308 ) ) ( not ( = ?auto_140309 ?auto_140312 ) ) ( not ( = ?auto_140309 ?auto_140310 ) ) ( not ( = ?auto_140309 ?auto_140313 ) ) ( ON ?auto_140314 ?auto_140309 ) ( CLEAR ?auto_140313 ) ( ON ?auto_140311 ?auto_140314 ) ( CLEAR ?auto_140311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140307 ?auto_140315 ?auto_140309 ?auto_140314 )
      ( MAKE-1PILE ?auto_140307 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140316 - BLOCK
    )
    :vars
    (
      ?auto_140324 - BLOCK
      ?auto_140322 - BLOCK
      ?auto_140319 - BLOCK
      ?auto_140320 - BLOCK
      ?auto_140318 - BLOCK
      ?auto_140323 - BLOCK
      ?auto_140321 - BLOCK
      ?auto_140317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140324 ?auto_140316 ) ( ON-TABLE ?auto_140316 ) ( not ( = ?auto_140316 ?auto_140324 ) ) ( not ( = ?auto_140316 ?auto_140322 ) ) ( not ( = ?auto_140316 ?auto_140319 ) ) ( not ( = ?auto_140324 ?auto_140322 ) ) ( not ( = ?auto_140324 ?auto_140319 ) ) ( not ( = ?auto_140322 ?auto_140319 ) ) ( ON ?auto_140322 ?auto_140324 ) ( ON-TABLE ?auto_140320 ) ( ON ?auto_140318 ?auto_140320 ) ( ON ?auto_140323 ?auto_140318 ) ( not ( = ?auto_140320 ?auto_140318 ) ) ( not ( = ?auto_140320 ?auto_140323 ) ) ( not ( = ?auto_140320 ?auto_140321 ) ) ( not ( = ?auto_140320 ?auto_140317 ) ) ( not ( = ?auto_140320 ?auto_140319 ) ) ( not ( = ?auto_140318 ?auto_140323 ) ) ( not ( = ?auto_140318 ?auto_140321 ) ) ( not ( = ?auto_140318 ?auto_140317 ) ) ( not ( = ?auto_140318 ?auto_140319 ) ) ( not ( = ?auto_140323 ?auto_140321 ) ) ( not ( = ?auto_140323 ?auto_140317 ) ) ( not ( = ?auto_140323 ?auto_140319 ) ) ( not ( = ?auto_140321 ?auto_140317 ) ) ( not ( = ?auto_140321 ?auto_140319 ) ) ( not ( = ?auto_140317 ?auto_140319 ) ) ( not ( = ?auto_140316 ?auto_140317 ) ) ( not ( = ?auto_140316 ?auto_140320 ) ) ( not ( = ?auto_140316 ?auto_140318 ) ) ( not ( = ?auto_140316 ?auto_140323 ) ) ( not ( = ?auto_140316 ?auto_140321 ) ) ( not ( = ?auto_140324 ?auto_140317 ) ) ( not ( = ?auto_140324 ?auto_140320 ) ) ( not ( = ?auto_140324 ?auto_140318 ) ) ( not ( = ?auto_140324 ?auto_140323 ) ) ( not ( = ?auto_140324 ?auto_140321 ) ) ( not ( = ?auto_140322 ?auto_140317 ) ) ( not ( = ?auto_140322 ?auto_140320 ) ) ( not ( = ?auto_140322 ?auto_140318 ) ) ( not ( = ?auto_140322 ?auto_140323 ) ) ( not ( = ?auto_140322 ?auto_140321 ) ) ( ON ?auto_140319 ?auto_140322 ) ( ON ?auto_140317 ?auto_140319 ) ( CLEAR ?auto_140317 ) ( HOLDING ?auto_140321 ) ( CLEAR ?auto_140323 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140320 ?auto_140318 ?auto_140323 ?auto_140321 )
      ( MAKE-1PILE ?auto_140316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140325 - BLOCK
    )
    :vars
    (
      ?auto_140326 - BLOCK
      ?auto_140327 - BLOCK
      ?auto_140328 - BLOCK
      ?auto_140329 - BLOCK
      ?auto_140332 - BLOCK
      ?auto_140331 - BLOCK
      ?auto_140333 - BLOCK
      ?auto_140330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140326 ?auto_140325 ) ( ON-TABLE ?auto_140325 ) ( not ( = ?auto_140325 ?auto_140326 ) ) ( not ( = ?auto_140325 ?auto_140327 ) ) ( not ( = ?auto_140325 ?auto_140328 ) ) ( not ( = ?auto_140326 ?auto_140327 ) ) ( not ( = ?auto_140326 ?auto_140328 ) ) ( not ( = ?auto_140327 ?auto_140328 ) ) ( ON ?auto_140327 ?auto_140326 ) ( ON-TABLE ?auto_140329 ) ( ON ?auto_140332 ?auto_140329 ) ( ON ?auto_140331 ?auto_140332 ) ( not ( = ?auto_140329 ?auto_140332 ) ) ( not ( = ?auto_140329 ?auto_140331 ) ) ( not ( = ?auto_140329 ?auto_140333 ) ) ( not ( = ?auto_140329 ?auto_140330 ) ) ( not ( = ?auto_140329 ?auto_140328 ) ) ( not ( = ?auto_140332 ?auto_140331 ) ) ( not ( = ?auto_140332 ?auto_140333 ) ) ( not ( = ?auto_140332 ?auto_140330 ) ) ( not ( = ?auto_140332 ?auto_140328 ) ) ( not ( = ?auto_140331 ?auto_140333 ) ) ( not ( = ?auto_140331 ?auto_140330 ) ) ( not ( = ?auto_140331 ?auto_140328 ) ) ( not ( = ?auto_140333 ?auto_140330 ) ) ( not ( = ?auto_140333 ?auto_140328 ) ) ( not ( = ?auto_140330 ?auto_140328 ) ) ( not ( = ?auto_140325 ?auto_140330 ) ) ( not ( = ?auto_140325 ?auto_140329 ) ) ( not ( = ?auto_140325 ?auto_140332 ) ) ( not ( = ?auto_140325 ?auto_140331 ) ) ( not ( = ?auto_140325 ?auto_140333 ) ) ( not ( = ?auto_140326 ?auto_140330 ) ) ( not ( = ?auto_140326 ?auto_140329 ) ) ( not ( = ?auto_140326 ?auto_140332 ) ) ( not ( = ?auto_140326 ?auto_140331 ) ) ( not ( = ?auto_140326 ?auto_140333 ) ) ( not ( = ?auto_140327 ?auto_140330 ) ) ( not ( = ?auto_140327 ?auto_140329 ) ) ( not ( = ?auto_140327 ?auto_140332 ) ) ( not ( = ?auto_140327 ?auto_140331 ) ) ( not ( = ?auto_140327 ?auto_140333 ) ) ( ON ?auto_140328 ?auto_140327 ) ( ON ?auto_140330 ?auto_140328 ) ( CLEAR ?auto_140331 ) ( ON ?auto_140333 ?auto_140330 ) ( CLEAR ?auto_140333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140325 ?auto_140326 ?auto_140327 ?auto_140328 ?auto_140330 )
      ( MAKE-1PILE ?auto_140325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140334 - BLOCK
    )
    :vars
    (
      ?auto_140335 - BLOCK
      ?auto_140338 - BLOCK
      ?auto_140337 - BLOCK
      ?auto_140340 - BLOCK
      ?auto_140342 - BLOCK
      ?auto_140339 - BLOCK
      ?auto_140341 - BLOCK
      ?auto_140336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140335 ?auto_140334 ) ( ON-TABLE ?auto_140334 ) ( not ( = ?auto_140334 ?auto_140335 ) ) ( not ( = ?auto_140334 ?auto_140338 ) ) ( not ( = ?auto_140334 ?auto_140337 ) ) ( not ( = ?auto_140335 ?auto_140338 ) ) ( not ( = ?auto_140335 ?auto_140337 ) ) ( not ( = ?auto_140338 ?auto_140337 ) ) ( ON ?auto_140338 ?auto_140335 ) ( ON-TABLE ?auto_140340 ) ( ON ?auto_140342 ?auto_140340 ) ( not ( = ?auto_140340 ?auto_140342 ) ) ( not ( = ?auto_140340 ?auto_140339 ) ) ( not ( = ?auto_140340 ?auto_140341 ) ) ( not ( = ?auto_140340 ?auto_140336 ) ) ( not ( = ?auto_140340 ?auto_140337 ) ) ( not ( = ?auto_140342 ?auto_140339 ) ) ( not ( = ?auto_140342 ?auto_140341 ) ) ( not ( = ?auto_140342 ?auto_140336 ) ) ( not ( = ?auto_140342 ?auto_140337 ) ) ( not ( = ?auto_140339 ?auto_140341 ) ) ( not ( = ?auto_140339 ?auto_140336 ) ) ( not ( = ?auto_140339 ?auto_140337 ) ) ( not ( = ?auto_140341 ?auto_140336 ) ) ( not ( = ?auto_140341 ?auto_140337 ) ) ( not ( = ?auto_140336 ?auto_140337 ) ) ( not ( = ?auto_140334 ?auto_140336 ) ) ( not ( = ?auto_140334 ?auto_140340 ) ) ( not ( = ?auto_140334 ?auto_140342 ) ) ( not ( = ?auto_140334 ?auto_140339 ) ) ( not ( = ?auto_140334 ?auto_140341 ) ) ( not ( = ?auto_140335 ?auto_140336 ) ) ( not ( = ?auto_140335 ?auto_140340 ) ) ( not ( = ?auto_140335 ?auto_140342 ) ) ( not ( = ?auto_140335 ?auto_140339 ) ) ( not ( = ?auto_140335 ?auto_140341 ) ) ( not ( = ?auto_140338 ?auto_140336 ) ) ( not ( = ?auto_140338 ?auto_140340 ) ) ( not ( = ?auto_140338 ?auto_140342 ) ) ( not ( = ?auto_140338 ?auto_140339 ) ) ( not ( = ?auto_140338 ?auto_140341 ) ) ( ON ?auto_140337 ?auto_140338 ) ( ON ?auto_140336 ?auto_140337 ) ( ON ?auto_140341 ?auto_140336 ) ( CLEAR ?auto_140341 ) ( HOLDING ?auto_140339 ) ( CLEAR ?auto_140342 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140340 ?auto_140342 ?auto_140339 )
      ( MAKE-1PILE ?auto_140334 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140343 - BLOCK
    )
    :vars
    (
      ?auto_140350 - BLOCK
      ?auto_140344 - BLOCK
      ?auto_140346 - BLOCK
      ?auto_140345 - BLOCK
      ?auto_140347 - BLOCK
      ?auto_140349 - BLOCK
      ?auto_140351 - BLOCK
      ?auto_140348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140350 ?auto_140343 ) ( ON-TABLE ?auto_140343 ) ( not ( = ?auto_140343 ?auto_140350 ) ) ( not ( = ?auto_140343 ?auto_140344 ) ) ( not ( = ?auto_140343 ?auto_140346 ) ) ( not ( = ?auto_140350 ?auto_140344 ) ) ( not ( = ?auto_140350 ?auto_140346 ) ) ( not ( = ?auto_140344 ?auto_140346 ) ) ( ON ?auto_140344 ?auto_140350 ) ( ON-TABLE ?auto_140345 ) ( ON ?auto_140347 ?auto_140345 ) ( not ( = ?auto_140345 ?auto_140347 ) ) ( not ( = ?auto_140345 ?auto_140349 ) ) ( not ( = ?auto_140345 ?auto_140351 ) ) ( not ( = ?auto_140345 ?auto_140348 ) ) ( not ( = ?auto_140345 ?auto_140346 ) ) ( not ( = ?auto_140347 ?auto_140349 ) ) ( not ( = ?auto_140347 ?auto_140351 ) ) ( not ( = ?auto_140347 ?auto_140348 ) ) ( not ( = ?auto_140347 ?auto_140346 ) ) ( not ( = ?auto_140349 ?auto_140351 ) ) ( not ( = ?auto_140349 ?auto_140348 ) ) ( not ( = ?auto_140349 ?auto_140346 ) ) ( not ( = ?auto_140351 ?auto_140348 ) ) ( not ( = ?auto_140351 ?auto_140346 ) ) ( not ( = ?auto_140348 ?auto_140346 ) ) ( not ( = ?auto_140343 ?auto_140348 ) ) ( not ( = ?auto_140343 ?auto_140345 ) ) ( not ( = ?auto_140343 ?auto_140347 ) ) ( not ( = ?auto_140343 ?auto_140349 ) ) ( not ( = ?auto_140343 ?auto_140351 ) ) ( not ( = ?auto_140350 ?auto_140348 ) ) ( not ( = ?auto_140350 ?auto_140345 ) ) ( not ( = ?auto_140350 ?auto_140347 ) ) ( not ( = ?auto_140350 ?auto_140349 ) ) ( not ( = ?auto_140350 ?auto_140351 ) ) ( not ( = ?auto_140344 ?auto_140348 ) ) ( not ( = ?auto_140344 ?auto_140345 ) ) ( not ( = ?auto_140344 ?auto_140347 ) ) ( not ( = ?auto_140344 ?auto_140349 ) ) ( not ( = ?auto_140344 ?auto_140351 ) ) ( ON ?auto_140346 ?auto_140344 ) ( ON ?auto_140348 ?auto_140346 ) ( ON ?auto_140351 ?auto_140348 ) ( CLEAR ?auto_140347 ) ( ON ?auto_140349 ?auto_140351 ) ( CLEAR ?auto_140349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140343 ?auto_140350 ?auto_140344 ?auto_140346 ?auto_140348 ?auto_140351 )
      ( MAKE-1PILE ?auto_140343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140352 - BLOCK
    )
    :vars
    (
      ?auto_140356 - BLOCK
      ?auto_140354 - BLOCK
      ?auto_140358 - BLOCK
      ?auto_140355 - BLOCK
      ?auto_140359 - BLOCK
      ?auto_140360 - BLOCK
      ?auto_140353 - BLOCK
      ?auto_140357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140356 ?auto_140352 ) ( ON-TABLE ?auto_140352 ) ( not ( = ?auto_140352 ?auto_140356 ) ) ( not ( = ?auto_140352 ?auto_140354 ) ) ( not ( = ?auto_140352 ?auto_140358 ) ) ( not ( = ?auto_140356 ?auto_140354 ) ) ( not ( = ?auto_140356 ?auto_140358 ) ) ( not ( = ?auto_140354 ?auto_140358 ) ) ( ON ?auto_140354 ?auto_140356 ) ( ON-TABLE ?auto_140355 ) ( not ( = ?auto_140355 ?auto_140359 ) ) ( not ( = ?auto_140355 ?auto_140360 ) ) ( not ( = ?auto_140355 ?auto_140353 ) ) ( not ( = ?auto_140355 ?auto_140357 ) ) ( not ( = ?auto_140355 ?auto_140358 ) ) ( not ( = ?auto_140359 ?auto_140360 ) ) ( not ( = ?auto_140359 ?auto_140353 ) ) ( not ( = ?auto_140359 ?auto_140357 ) ) ( not ( = ?auto_140359 ?auto_140358 ) ) ( not ( = ?auto_140360 ?auto_140353 ) ) ( not ( = ?auto_140360 ?auto_140357 ) ) ( not ( = ?auto_140360 ?auto_140358 ) ) ( not ( = ?auto_140353 ?auto_140357 ) ) ( not ( = ?auto_140353 ?auto_140358 ) ) ( not ( = ?auto_140357 ?auto_140358 ) ) ( not ( = ?auto_140352 ?auto_140357 ) ) ( not ( = ?auto_140352 ?auto_140355 ) ) ( not ( = ?auto_140352 ?auto_140359 ) ) ( not ( = ?auto_140352 ?auto_140360 ) ) ( not ( = ?auto_140352 ?auto_140353 ) ) ( not ( = ?auto_140356 ?auto_140357 ) ) ( not ( = ?auto_140356 ?auto_140355 ) ) ( not ( = ?auto_140356 ?auto_140359 ) ) ( not ( = ?auto_140356 ?auto_140360 ) ) ( not ( = ?auto_140356 ?auto_140353 ) ) ( not ( = ?auto_140354 ?auto_140357 ) ) ( not ( = ?auto_140354 ?auto_140355 ) ) ( not ( = ?auto_140354 ?auto_140359 ) ) ( not ( = ?auto_140354 ?auto_140360 ) ) ( not ( = ?auto_140354 ?auto_140353 ) ) ( ON ?auto_140358 ?auto_140354 ) ( ON ?auto_140357 ?auto_140358 ) ( ON ?auto_140353 ?auto_140357 ) ( ON ?auto_140360 ?auto_140353 ) ( CLEAR ?auto_140360 ) ( HOLDING ?auto_140359 ) ( CLEAR ?auto_140355 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140355 ?auto_140359 )
      ( MAKE-1PILE ?auto_140352 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142531 - BLOCK
    )
    :vars
    (
      ?auto_142537 - BLOCK
      ?auto_142532 - BLOCK
      ?auto_142535 - BLOCK
      ?auto_142538 - BLOCK
      ?auto_142534 - BLOCK
      ?auto_142533 - BLOCK
      ?auto_142536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142537 ?auto_142531 ) ( ON-TABLE ?auto_142531 ) ( not ( = ?auto_142531 ?auto_142537 ) ) ( not ( = ?auto_142531 ?auto_142532 ) ) ( not ( = ?auto_142531 ?auto_142535 ) ) ( not ( = ?auto_142537 ?auto_142532 ) ) ( not ( = ?auto_142537 ?auto_142535 ) ) ( not ( = ?auto_142532 ?auto_142535 ) ) ( ON ?auto_142532 ?auto_142537 ) ( not ( = ?auto_142538 ?auto_142534 ) ) ( not ( = ?auto_142538 ?auto_142533 ) ) ( not ( = ?auto_142538 ?auto_142536 ) ) ( not ( = ?auto_142538 ?auto_142535 ) ) ( not ( = ?auto_142534 ?auto_142533 ) ) ( not ( = ?auto_142534 ?auto_142536 ) ) ( not ( = ?auto_142534 ?auto_142535 ) ) ( not ( = ?auto_142533 ?auto_142536 ) ) ( not ( = ?auto_142533 ?auto_142535 ) ) ( not ( = ?auto_142536 ?auto_142535 ) ) ( not ( = ?auto_142531 ?auto_142536 ) ) ( not ( = ?auto_142531 ?auto_142538 ) ) ( not ( = ?auto_142531 ?auto_142534 ) ) ( not ( = ?auto_142531 ?auto_142533 ) ) ( not ( = ?auto_142537 ?auto_142536 ) ) ( not ( = ?auto_142537 ?auto_142538 ) ) ( not ( = ?auto_142537 ?auto_142534 ) ) ( not ( = ?auto_142537 ?auto_142533 ) ) ( not ( = ?auto_142532 ?auto_142536 ) ) ( not ( = ?auto_142532 ?auto_142538 ) ) ( not ( = ?auto_142532 ?auto_142534 ) ) ( not ( = ?auto_142532 ?auto_142533 ) ) ( ON ?auto_142535 ?auto_142532 ) ( ON ?auto_142536 ?auto_142535 ) ( ON ?auto_142533 ?auto_142536 ) ( ON ?auto_142534 ?auto_142533 ) ( ON ?auto_142538 ?auto_142534 ) ( CLEAR ?auto_142538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142531 ?auto_142537 ?auto_142532 ?auto_142535 ?auto_142536 ?auto_142533 ?auto_142534 )
      ( MAKE-1PILE ?auto_142531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140370 - BLOCK
    )
    :vars
    (
      ?auto_140375 - BLOCK
      ?auto_140377 - BLOCK
      ?auto_140372 - BLOCK
      ?auto_140376 - BLOCK
      ?auto_140371 - BLOCK
      ?auto_140373 - BLOCK
      ?auto_140374 - BLOCK
      ?auto_140378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140375 ?auto_140370 ) ( ON-TABLE ?auto_140370 ) ( not ( = ?auto_140370 ?auto_140375 ) ) ( not ( = ?auto_140370 ?auto_140377 ) ) ( not ( = ?auto_140370 ?auto_140372 ) ) ( not ( = ?auto_140375 ?auto_140377 ) ) ( not ( = ?auto_140375 ?auto_140372 ) ) ( not ( = ?auto_140377 ?auto_140372 ) ) ( ON ?auto_140377 ?auto_140375 ) ( not ( = ?auto_140376 ?auto_140371 ) ) ( not ( = ?auto_140376 ?auto_140373 ) ) ( not ( = ?auto_140376 ?auto_140374 ) ) ( not ( = ?auto_140376 ?auto_140378 ) ) ( not ( = ?auto_140376 ?auto_140372 ) ) ( not ( = ?auto_140371 ?auto_140373 ) ) ( not ( = ?auto_140371 ?auto_140374 ) ) ( not ( = ?auto_140371 ?auto_140378 ) ) ( not ( = ?auto_140371 ?auto_140372 ) ) ( not ( = ?auto_140373 ?auto_140374 ) ) ( not ( = ?auto_140373 ?auto_140378 ) ) ( not ( = ?auto_140373 ?auto_140372 ) ) ( not ( = ?auto_140374 ?auto_140378 ) ) ( not ( = ?auto_140374 ?auto_140372 ) ) ( not ( = ?auto_140378 ?auto_140372 ) ) ( not ( = ?auto_140370 ?auto_140378 ) ) ( not ( = ?auto_140370 ?auto_140376 ) ) ( not ( = ?auto_140370 ?auto_140371 ) ) ( not ( = ?auto_140370 ?auto_140373 ) ) ( not ( = ?auto_140370 ?auto_140374 ) ) ( not ( = ?auto_140375 ?auto_140378 ) ) ( not ( = ?auto_140375 ?auto_140376 ) ) ( not ( = ?auto_140375 ?auto_140371 ) ) ( not ( = ?auto_140375 ?auto_140373 ) ) ( not ( = ?auto_140375 ?auto_140374 ) ) ( not ( = ?auto_140377 ?auto_140378 ) ) ( not ( = ?auto_140377 ?auto_140376 ) ) ( not ( = ?auto_140377 ?auto_140371 ) ) ( not ( = ?auto_140377 ?auto_140373 ) ) ( not ( = ?auto_140377 ?auto_140374 ) ) ( ON ?auto_140372 ?auto_140377 ) ( ON ?auto_140378 ?auto_140372 ) ( ON ?auto_140374 ?auto_140378 ) ( ON ?auto_140373 ?auto_140374 ) ( ON ?auto_140371 ?auto_140373 ) ( CLEAR ?auto_140371 ) ( HOLDING ?auto_140376 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140376 )
      ( MAKE-1PILE ?auto_140370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140379 - BLOCK
    )
    :vars
    (
      ?auto_140383 - BLOCK
      ?auto_140387 - BLOCK
      ?auto_140385 - BLOCK
      ?auto_140384 - BLOCK
      ?auto_140382 - BLOCK
      ?auto_140386 - BLOCK
      ?auto_140381 - BLOCK
      ?auto_140380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140383 ?auto_140379 ) ( ON-TABLE ?auto_140379 ) ( not ( = ?auto_140379 ?auto_140383 ) ) ( not ( = ?auto_140379 ?auto_140387 ) ) ( not ( = ?auto_140379 ?auto_140385 ) ) ( not ( = ?auto_140383 ?auto_140387 ) ) ( not ( = ?auto_140383 ?auto_140385 ) ) ( not ( = ?auto_140387 ?auto_140385 ) ) ( ON ?auto_140387 ?auto_140383 ) ( not ( = ?auto_140384 ?auto_140382 ) ) ( not ( = ?auto_140384 ?auto_140386 ) ) ( not ( = ?auto_140384 ?auto_140381 ) ) ( not ( = ?auto_140384 ?auto_140380 ) ) ( not ( = ?auto_140384 ?auto_140385 ) ) ( not ( = ?auto_140382 ?auto_140386 ) ) ( not ( = ?auto_140382 ?auto_140381 ) ) ( not ( = ?auto_140382 ?auto_140380 ) ) ( not ( = ?auto_140382 ?auto_140385 ) ) ( not ( = ?auto_140386 ?auto_140381 ) ) ( not ( = ?auto_140386 ?auto_140380 ) ) ( not ( = ?auto_140386 ?auto_140385 ) ) ( not ( = ?auto_140381 ?auto_140380 ) ) ( not ( = ?auto_140381 ?auto_140385 ) ) ( not ( = ?auto_140380 ?auto_140385 ) ) ( not ( = ?auto_140379 ?auto_140380 ) ) ( not ( = ?auto_140379 ?auto_140384 ) ) ( not ( = ?auto_140379 ?auto_140382 ) ) ( not ( = ?auto_140379 ?auto_140386 ) ) ( not ( = ?auto_140379 ?auto_140381 ) ) ( not ( = ?auto_140383 ?auto_140380 ) ) ( not ( = ?auto_140383 ?auto_140384 ) ) ( not ( = ?auto_140383 ?auto_140382 ) ) ( not ( = ?auto_140383 ?auto_140386 ) ) ( not ( = ?auto_140383 ?auto_140381 ) ) ( not ( = ?auto_140387 ?auto_140380 ) ) ( not ( = ?auto_140387 ?auto_140384 ) ) ( not ( = ?auto_140387 ?auto_140382 ) ) ( not ( = ?auto_140387 ?auto_140386 ) ) ( not ( = ?auto_140387 ?auto_140381 ) ) ( ON ?auto_140385 ?auto_140387 ) ( ON ?auto_140380 ?auto_140385 ) ( ON ?auto_140381 ?auto_140380 ) ( ON ?auto_140386 ?auto_140381 ) ( ON ?auto_140382 ?auto_140386 ) ( ON ?auto_140384 ?auto_140382 ) ( CLEAR ?auto_140384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140379 ?auto_140383 ?auto_140387 ?auto_140385 ?auto_140380 ?auto_140381 ?auto_140386 ?auto_140382 )
      ( MAKE-1PILE ?auto_140379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140396 - BLOCK
      ?auto_140397 - BLOCK
      ?auto_140398 - BLOCK
      ?auto_140399 - BLOCK
      ?auto_140400 - BLOCK
      ?auto_140401 - BLOCK
      ?auto_140402 - BLOCK
      ?auto_140403 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_140403 ) ( CLEAR ?auto_140402 ) ( ON-TABLE ?auto_140396 ) ( ON ?auto_140397 ?auto_140396 ) ( ON ?auto_140398 ?auto_140397 ) ( ON ?auto_140399 ?auto_140398 ) ( ON ?auto_140400 ?auto_140399 ) ( ON ?auto_140401 ?auto_140400 ) ( ON ?auto_140402 ?auto_140401 ) ( not ( = ?auto_140396 ?auto_140397 ) ) ( not ( = ?auto_140396 ?auto_140398 ) ) ( not ( = ?auto_140396 ?auto_140399 ) ) ( not ( = ?auto_140396 ?auto_140400 ) ) ( not ( = ?auto_140396 ?auto_140401 ) ) ( not ( = ?auto_140396 ?auto_140402 ) ) ( not ( = ?auto_140396 ?auto_140403 ) ) ( not ( = ?auto_140397 ?auto_140398 ) ) ( not ( = ?auto_140397 ?auto_140399 ) ) ( not ( = ?auto_140397 ?auto_140400 ) ) ( not ( = ?auto_140397 ?auto_140401 ) ) ( not ( = ?auto_140397 ?auto_140402 ) ) ( not ( = ?auto_140397 ?auto_140403 ) ) ( not ( = ?auto_140398 ?auto_140399 ) ) ( not ( = ?auto_140398 ?auto_140400 ) ) ( not ( = ?auto_140398 ?auto_140401 ) ) ( not ( = ?auto_140398 ?auto_140402 ) ) ( not ( = ?auto_140398 ?auto_140403 ) ) ( not ( = ?auto_140399 ?auto_140400 ) ) ( not ( = ?auto_140399 ?auto_140401 ) ) ( not ( = ?auto_140399 ?auto_140402 ) ) ( not ( = ?auto_140399 ?auto_140403 ) ) ( not ( = ?auto_140400 ?auto_140401 ) ) ( not ( = ?auto_140400 ?auto_140402 ) ) ( not ( = ?auto_140400 ?auto_140403 ) ) ( not ( = ?auto_140401 ?auto_140402 ) ) ( not ( = ?auto_140401 ?auto_140403 ) ) ( not ( = ?auto_140402 ?auto_140403 ) ) )
    :subtasks
    ( ( !STACK ?auto_140403 ?auto_140402 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140404 - BLOCK
      ?auto_140405 - BLOCK
      ?auto_140406 - BLOCK
      ?auto_140407 - BLOCK
      ?auto_140408 - BLOCK
      ?auto_140409 - BLOCK
      ?auto_140410 - BLOCK
      ?auto_140411 - BLOCK
    )
    :vars
    (
      ?auto_140412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140410 ) ( ON-TABLE ?auto_140404 ) ( ON ?auto_140405 ?auto_140404 ) ( ON ?auto_140406 ?auto_140405 ) ( ON ?auto_140407 ?auto_140406 ) ( ON ?auto_140408 ?auto_140407 ) ( ON ?auto_140409 ?auto_140408 ) ( ON ?auto_140410 ?auto_140409 ) ( not ( = ?auto_140404 ?auto_140405 ) ) ( not ( = ?auto_140404 ?auto_140406 ) ) ( not ( = ?auto_140404 ?auto_140407 ) ) ( not ( = ?auto_140404 ?auto_140408 ) ) ( not ( = ?auto_140404 ?auto_140409 ) ) ( not ( = ?auto_140404 ?auto_140410 ) ) ( not ( = ?auto_140404 ?auto_140411 ) ) ( not ( = ?auto_140405 ?auto_140406 ) ) ( not ( = ?auto_140405 ?auto_140407 ) ) ( not ( = ?auto_140405 ?auto_140408 ) ) ( not ( = ?auto_140405 ?auto_140409 ) ) ( not ( = ?auto_140405 ?auto_140410 ) ) ( not ( = ?auto_140405 ?auto_140411 ) ) ( not ( = ?auto_140406 ?auto_140407 ) ) ( not ( = ?auto_140406 ?auto_140408 ) ) ( not ( = ?auto_140406 ?auto_140409 ) ) ( not ( = ?auto_140406 ?auto_140410 ) ) ( not ( = ?auto_140406 ?auto_140411 ) ) ( not ( = ?auto_140407 ?auto_140408 ) ) ( not ( = ?auto_140407 ?auto_140409 ) ) ( not ( = ?auto_140407 ?auto_140410 ) ) ( not ( = ?auto_140407 ?auto_140411 ) ) ( not ( = ?auto_140408 ?auto_140409 ) ) ( not ( = ?auto_140408 ?auto_140410 ) ) ( not ( = ?auto_140408 ?auto_140411 ) ) ( not ( = ?auto_140409 ?auto_140410 ) ) ( not ( = ?auto_140409 ?auto_140411 ) ) ( not ( = ?auto_140410 ?auto_140411 ) ) ( ON ?auto_140411 ?auto_140412 ) ( CLEAR ?auto_140411 ) ( HAND-EMPTY ) ( not ( = ?auto_140404 ?auto_140412 ) ) ( not ( = ?auto_140405 ?auto_140412 ) ) ( not ( = ?auto_140406 ?auto_140412 ) ) ( not ( = ?auto_140407 ?auto_140412 ) ) ( not ( = ?auto_140408 ?auto_140412 ) ) ( not ( = ?auto_140409 ?auto_140412 ) ) ( not ( = ?auto_140410 ?auto_140412 ) ) ( not ( = ?auto_140411 ?auto_140412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140411 ?auto_140412 )
      ( MAKE-8PILE ?auto_140404 ?auto_140405 ?auto_140406 ?auto_140407 ?auto_140408 ?auto_140409 ?auto_140410 ?auto_140411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140413 - BLOCK
      ?auto_140414 - BLOCK
      ?auto_140415 - BLOCK
      ?auto_140416 - BLOCK
      ?auto_140417 - BLOCK
      ?auto_140418 - BLOCK
      ?auto_140419 - BLOCK
      ?auto_140420 - BLOCK
    )
    :vars
    (
      ?auto_140421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140413 ) ( ON ?auto_140414 ?auto_140413 ) ( ON ?auto_140415 ?auto_140414 ) ( ON ?auto_140416 ?auto_140415 ) ( ON ?auto_140417 ?auto_140416 ) ( ON ?auto_140418 ?auto_140417 ) ( not ( = ?auto_140413 ?auto_140414 ) ) ( not ( = ?auto_140413 ?auto_140415 ) ) ( not ( = ?auto_140413 ?auto_140416 ) ) ( not ( = ?auto_140413 ?auto_140417 ) ) ( not ( = ?auto_140413 ?auto_140418 ) ) ( not ( = ?auto_140413 ?auto_140419 ) ) ( not ( = ?auto_140413 ?auto_140420 ) ) ( not ( = ?auto_140414 ?auto_140415 ) ) ( not ( = ?auto_140414 ?auto_140416 ) ) ( not ( = ?auto_140414 ?auto_140417 ) ) ( not ( = ?auto_140414 ?auto_140418 ) ) ( not ( = ?auto_140414 ?auto_140419 ) ) ( not ( = ?auto_140414 ?auto_140420 ) ) ( not ( = ?auto_140415 ?auto_140416 ) ) ( not ( = ?auto_140415 ?auto_140417 ) ) ( not ( = ?auto_140415 ?auto_140418 ) ) ( not ( = ?auto_140415 ?auto_140419 ) ) ( not ( = ?auto_140415 ?auto_140420 ) ) ( not ( = ?auto_140416 ?auto_140417 ) ) ( not ( = ?auto_140416 ?auto_140418 ) ) ( not ( = ?auto_140416 ?auto_140419 ) ) ( not ( = ?auto_140416 ?auto_140420 ) ) ( not ( = ?auto_140417 ?auto_140418 ) ) ( not ( = ?auto_140417 ?auto_140419 ) ) ( not ( = ?auto_140417 ?auto_140420 ) ) ( not ( = ?auto_140418 ?auto_140419 ) ) ( not ( = ?auto_140418 ?auto_140420 ) ) ( not ( = ?auto_140419 ?auto_140420 ) ) ( ON ?auto_140420 ?auto_140421 ) ( CLEAR ?auto_140420 ) ( not ( = ?auto_140413 ?auto_140421 ) ) ( not ( = ?auto_140414 ?auto_140421 ) ) ( not ( = ?auto_140415 ?auto_140421 ) ) ( not ( = ?auto_140416 ?auto_140421 ) ) ( not ( = ?auto_140417 ?auto_140421 ) ) ( not ( = ?auto_140418 ?auto_140421 ) ) ( not ( = ?auto_140419 ?auto_140421 ) ) ( not ( = ?auto_140420 ?auto_140421 ) ) ( HOLDING ?auto_140419 ) ( CLEAR ?auto_140418 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140413 ?auto_140414 ?auto_140415 ?auto_140416 ?auto_140417 ?auto_140418 ?auto_140419 )
      ( MAKE-8PILE ?auto_140413 ?auto_140414 ?auto_140415 ?auto_140416 ?auto_140417 ?auto_140418 ?auto_140419 ?auto_140420 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140422 - BLOCK
      ?auto_140423 - BLOCK
      ?auto_140424 - BLOCK
      ?auto_140425 - BLOCK
      ?auto_140426 - BLOCK
      ?auto_140427 - BLOCK
      ?auto_140428 - BLOCK
      ?auto_140429 - BLOCK
    )
    :vars
    (
      ?auto_140430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140422 ) ( ON ?auto_140423 ?auto_140422 ) ( ON ?auto_140424 ?auto_140423 ) ( ON ?auto_140425 ?auto_140424 ) ( ON ?auto_140426 ?auto_140425 ) ( ON ?auto_140427 ?auto_140426 ) ( not ( = ?auto_140422 ?auto_140423 ) ) ( not ( = ?auto_140422 ?auto_140424 ) ) ( not ( = ?auto_140422 ?auto_140425 ) ) ( not ( = ?auto_140422 ?auto_140426 ) ) ( not ( = ?auto_140422 ?auto_140427 ) ) ( not ( = ?auto_140422 ?auto_140428 ) ) ( not ( = ?auto_140422 ?auto_140429 ) ) ( not ( = ?auto_140423 ?auto_140424 ) ) ( not ( = ?auto_140423 ?auto_140425 ) ) ( not ( = ?auto_140423 ?auto_140426 ) ) ( not ( = ?auto_140423 ?auto_140427 ) ) ( not ( = ?auto_140423 ?auto_140428 ) ) ( not ( = ?auto_140423 ?auto_140429 ) ) ( not ( = ?auto_140424 ?auto_140425 ) ) ( not ( = ?auto_140424 ?auto_140426 ) ) ( not ( = ?auto_140424 ?auto_140427 ) ) ( not ( = ?auto_140424 ?auto_140428 ) ) ( not ( = ?auto_140424 ?auto_140429 ) ) ( not ( = ?auto_140425 ?auto_140426 ) ) ( not ( = ?auto_140425 ?auto_140427 ) ) ( not ( = ?auto_140425 ?auto_140428 ) ) ( not ( = ?auto_140425 ?auto_140429 ) ) ( not ( = ?auto_140426 ?auto_140427 ) ) ( not ( = ?auto_140426 ?auto_140428 ) ) ( not ( = ?auto_140426 ?auto_140429 ) ) ( not ( = ?auto_140427 ?auto_140428 ) ) ( not ( = ?auto_140427 ?auto_140429 ) ) ( not ( = ?auto_140428 ?auto_140429 ) ) ( ON ?auto_140429 ?auto_140430 ) ( not ( = ?auto_140422 ?auto_140430 ) ) ( not ( = ?auto_140423 ?auto_140430 ) ) ( not ( = ?auto_140424 ?auto_140430 ) ) ( not ( = ?auto_140425 ?auto_140430 ) ) ( not ( = ?auto_140426 ?auto_140430 ) ) ( not ( = ?auto_140427 ?auto_140430 ) ) ( not ( = ?auto_140428 ?auto_140430 ) ) ( not ( = ?auto_140429 ?auto_140430 ) ) ( CLEAR ?auto_140427 ) ( ON ?auto_140428 ?auto_140429 ) ( CLEAR ?auto_140428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140430 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140430 ?auto_140429 )
      ( MAKE-8PILE ?auto_140422 ?auto_140423 ?auto_140424 ?auto_140425 ?auto_140426 ?auto_140427 ?auto_140428 ?auto_140429 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140431 - BLOCK
      ?auto_140432 - BLOCK
      ?auto_140433 - BLOCK
      ?auto_140434 - BLOCK
      ?auto_140435 - BLOCK
      ?auto_140436 - BLOCK
      ?auto_140437 - BLOCK
      ?auto_140438 - BLOCK
    )
    :vars
    (
      ?auto_140439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140431 ) ( ON ?auto_140432 ?auto_140431 ) ( ON ?auto_140433 ?auto_140432 ) ( ON ?auto_140434 ?auto_140433 ) ( ON ?auto_140435 ?auto_140434 ) ( not ( = ?auto_140431 ?auto_140432 ) ) ( not ( = ?auto_140431 ?auto_140433 ) ) ( not ( = ?auto_140431 ?auto_140434 ) ) ( not ( = ?auto_140431 ?auto_140435 ) ) ( not ( = ?auto_140431 ?auto_140436 ) ) ( not ( = ?auto_140431 ?auto_140437 ) ) ( not ( = ?auto_140431 ?auto_140438 ) ) ( not ( = ?auto_140432 ?auto_140433 ) ) ( not ( = ?auto_140432 ?auto_140434 ) ) ( not ( = ?auto_140432 ?auto_140435 ) ) ( not ( = ?auto_140432 ?auto_140436 ) ) ( not ( = ?auto_140432 ?auto_140437 ) ) ( not ( = ?auto_140432 ?auto_140438 ) ) ( not ( = ?auto_140433 ?auto_140434 ) ) ( not ( = ?auto_140433 ?auto_140435 ) ) ( not ( = ?auto_140433 ?auto_140436 ) ) ( not ( = ?auto_140433 ?auto_140437 ) ) ( not ( = ?auto_140433 ?auto_140438 ) ) ( not ( = ?auto_140434 ?auto_140435 ) ) ( not ( = ?auto_140434 ?auto_140436 ) ) ( not ( = ?auto_140434 ?auto_140437 ) ) ( not ( = ?auto_140434 ?auto_140438 ) ) ( not ( = ?auto_140435 ?auto_140436 ) ) ( not ( = ?auto_140435 ?auto_140437 ) ) ( not ( = ?auto_140435 ?auto_140438 ) ) ( not ( = ?auto_140436 ?auto_140437 ) ) ( not ( = ?auto_140436 ?auto_140438 ) ) ( not ( = ?auto_140437 ?auto_140438 ) ) ( ON ?auto_140438 ?auto_140439 ) ( not ( = ?auto_140431 ?auto_140439 ) ) ( not ( = ?auto_140432 ?auto_140439 ) ) ( not ( = ?auto_140433 ?auto_140439 ) ) ( not ( = ?auto_140434 ?auto_140439 ) ) ( not ( = ?auto_140435 ?auto_140439 ) ) ( not ( = ?auto_140436 ?auto_140439 ) ) ( not ( = ?auto_140437 ?auto_140439 ) ) ( not ( = ?auto_140438 ?auto_140439 ) ) ( ON ?auto_140437 ?auto_140438 ) ( CLEAR ?auto_140437 ) ( ON-TABLE ?auto_140439 ) ( HOLDING ?auto_140436 ) ( CLEAR ?auto_140435 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140431 ?auto_140432 ?auto_140433 ?auto_140434 ?auto_140435 ?auto_140436 )
      ( MAKE-8PILE ?auto_140431 ?auto_140432 ?auto_140433 ?auto_140434 ?auto_140435 ?auto_140436 ?auto_140437 ?auto_140438 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140440 - BLOCK
      ?auto_140441 - BLOCK
      ?auto_140442 - BLOCK
      ?auto_140443 - BLOCK
      ?auto_140444 - BLOCK
      ?auto_140445 - BLOCK
      ?auto_140446 - BLOCK
      ?auto_140447 - BLOCK
    )
    :vars
    (
      ?auto_140448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140440 ) ( ON ?auto_140441 ?auto_140440 ) ( ON ?auto_140442 ?auto_140441 ) ( ON ?auto_140443 ?auto_140442 ) ( ON ?auto_140444 ?auto_140443 ) ( not ( = ?auto_140440 ?auto_140441 ) ) ( not ( = ?auto_140440 ?auto_140442 ) ) ( not ( = ?auto_140440 ?auto_140443 ) ) ( not ( = ?auto_140440 ?auto_140444 ) ) ( not ( = ?auto_140440 ?auto_140445 ) ) ( not ( = ?auto_140440 ?auto_140446 ) ) ( not ( = ?auto_140440 ?auto_140447 ) ) ( not ( = ?auto_140441 ?auto_140442 ) ) ( not ( = ?auto_140441 ?auto_140443 ) ) ( not ( = ?auto_140441 ?auto_140444 ) ) ( not ( = ?auto_140441 ?auto_140445 ) ) ( not ( = ?auto_140441 ?auto_140446 ) ) ( not ( = ?auto_140441 ?auto_140447 ) ) ( not ( = ?auto_140442 ?auto_140443 ) ) ( not ( = ?auto_140442 ?auto_140444 ) ) ( not ( = ?auto_140442 ?auto_140445 ) ) ( not ( = ?auto_140442 ?auto_140446 ) ) ( not ( = ?auto_140442 ?auto_140447 ) ) ( not ( = ?auto_140443 ?auto_140444 ) ) ( not ( = ?auto_140443 ?auto_140445 ) ) ( not ( = ?auto_140443 ?auto_140446 ) ) ( not ( = ?auto_140443 ?auto_140447 ) ) ( not ( = ?auto_140444 ?auto_140445 ) ) ( not ( = ?auto_140444 ?auto_140446 ) ) ( not ( = ?auto_140444 ?auto_140447 ) ) ( not ( = ?auto_140445 ?auto_140446 ) ) ( not ( = ?auto_140445 ?auto_140447 ) ) ( not ( = ?auto_140446 ?auto_140447 ) ) ( ON ?auto_140447 ?auto_140448 ) ( not ( = ?auto_140440 ?auto_140448 ) ) ( not ( = ?auto_140441 ?auto_140448 ) ) ( not ( = ?auto_140442 ?auto_140448 ) ) ( not ( = ?auto_140443 ?auto_140448 ) ) ( not ( = ?auto_140444 ?auto_140448 ) ) ( not ( = ?auto_140445 ?auto_140448 ) ) ( not ( = ?auto_140446 ?auto_140448 ) ) ( not ( = ?auto_140447 ?auto_140448 ) ) ( ON ?auto_140446 ?auto_140447 ) ( ON-TABLE ?auto_140448 ) ( CLEAR ?auto_140444 ) ( ON ?auto_140445 ?auto_140446 ) ( CLEAR ?auto_140445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140448 ?auto_140447 ?auto_140446 )
      ( MAKE-8PILE ?auto_140440 ?auto_140441 ?auto_140442 ?auto_140443 ?auto_140444 ?auto_140445 ?auto_140446 ?auto_140447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140449 - BLOCK
      ?auto_140450 - BLOCK
      ?auto_140451 - BLOCK
      ?auto_140452 - BLOCK
      ?auto_140453 - BLOCK
      ?auto_140454 - BLOCK
      ?auto_140455 - BLOCK
      ?auto_140456 - BLOCK
    )
    :vars
    (
      ?auto_140457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140449 ) ( ON ?auto_140450 ?auto_140449 ) ( ON ?auto_140451 ?auto_140450 ) ( ON ?auto_140452 ?auto_140451 ) ( not ( = ?auto_140449 ?auto_140450 ) ) ( not ( = ?auto_140449 ?auto_140451 ) ) ( not ( = ?auto_140449 ?auto_140452 ) ) ( not ( = ?auto_140449 ?auto_140453 ) ) ( not ( = ?auto_140449 ?auto_140454 ) ) ( not ( = ?auto_140449 ?auto_140455 ) ) ( not ( = ?auto_140449 ?auto_140456 ) ) ( not ( = ?auto_140450 ?auto_140451 ) ) ( not ( = ?auto_140450 ?auto_140452 ) ) ( not ( = ?auto_140450 ?auto_140453 ) ) ( not ( = ?auto_140450 ?auto_140454 ) ) ( not ( = ?auto_140450 ?auto_140455 ) ) ( not ( = ?auto_140450 ?auto_140456 ) ) ( not ( = ?auto_140451 ?auto_140452 ) ) ( not ( = ?auto_140451 ?auto_140453 ) ) ( not ( = ?auto_140451 ?auto_140454 ) ) ( not ( = ?auto_140451 ?auto_140455 ) ) ( not ( = ?auto_140451 ?auto_140456 ) ) ( not ( = ?auto_140452 ?auto_140453 ) ) ( not ( = ?auto_140452 ?auto_140454 ) ) ( not ( = ?auto_140452 ?auto_140455 ) ) ( not ( = ?auto_140452 ?auto_140456 ) ) ( not ( = ?auto_140453 ?auto_140454 ) ) ( not ( = ?auto_140453 ?auto_140455 ) ) ( not ( = ?auto_140453 ?auto_140456 ) ) ( not ( = ?auto_140454 ?auto_140455 ) ) ( not ( = ?auto_140454 ?auto_140456 ) ) ( not ( = ?auto_140455 ?auto_140456 ) ) ( ON ?auto_140456 ?auto_140457 ) ( not ( = ?auto_140449 ?auto_140457 ) ) ( not ( = ?auto_140450 ?auto_140457 ) ) ( not ( = ?auto_140451 ?auto_140457 ) ) ( not ( = ?auto_140452 ?auto_140457 ) ) ( not ( = ?auto_140453 ?auto_140457 ) ) ( not ( = ?auto_140454 ?auto_140457 ) ) ( not ( = ?auto_140455 ?auto_140457 ) ) ( not ( = ?auto_140456 ?auto_140457 ) ) ( ON ?auto_140455 ?auto_140456 ) ( ON-TABLE ?auto_140457 ) ( ON ?auto_140454 ?auto_140455 ) ( CLEAR ?auto_140454 ) ( HOLDING ?auto_140453 ) ( CLEAR ?auto_140452 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140449 ?auto_140450 ?auto_140451 ?auto_140452 ?auto_140453 )
      ( MAKE-8PILE ?auto_140449 ?auto_140450 ?auto_140451 ?auto_140452 ?auto_140453 ?auto_140454 ?auto_140455 ?auto_140456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140458 - BLOCK
      ?auto_140459 - BLOCK
      ?auto_140460 - BLOCK
      ?auto_140461 - BLOCK
      ?auto_140462 - BLOCK
      ?auto_140463 - BLOCK
      ?auto_140464 - BLOCK
      ?auto_140465 - BLOCK
    )
    :vars
    (
      ?auto_140466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140458 ) ( ON ?auto_140459 ?auto_140458 ) ( ON ?auto_140460 ?auto_140459 ) ( ON ?auto_140461 ?auto_140460 ) ( not ( = ?auto_140458 ?auto_140459 ) ) ( not ( = ?auto_140458 ?auto_140460 ) ) ( not ( = ?auto_140458 ?auto_140461 ) ) ( not ( = ?auto_140458 ?auto_140462 ) ) ( not ( = ?auto_140458 ?auto_140463 ) ) ( not ( = ?auto_140458 ?auto_140464 ) ) ( not ( = ?auto_140458 ?auto_140465 ) ) ( not ( = ?auto_140459 ?auto_140460 ) ) ( not ( = ?auto_140459 ?auto_140461 ) ) ( not ( = ?auto_140459 ?auto_140462 ) ) ( not ( = ?auto_140459 ?auto_140463 ) ) ( not ( = ?auto_140459 ?auto_140464 ) ) ( not ( = ?auto_140459 ?auto_140465 ) ) ( not ( = ?auto_140460 ?auto_140461 ) ) ( not ( = ?auto_140460 ?auto_140462 ) ) ( not ( = ?auto_140460 ?auto_140463 ) ) ( not ( = ?auto_140460 ?auto_140464 ) ) ( not ( = ?auto_140460 ?auto_140465 ) ) ( not ( = ?auto_140461 ?auto_140462 ) ) ( not ( = ?auto_140461 ?auto_140463 ) ) ( not ( = ?auto_140461 ?auto_140464 ) ) ( not ( = ?auto_140461 ?auto_140465 ) ) ( not ( = ?auto_140462 ?auto_140463 ) ) ( not ( = ?auto_140462 ?auto_140464 ) ) ( not ( = ?auto_140462 ?auto_140465 ) ) ( not ( = ?auto_140463 ?auto_140464 ) ) ( not ( = ?auto_140463 ?auto_140465 ) ) ( not ( = ?auto_140464 ?auto_140465 ) ) ( ON ?auto_140465 ?auto_140466 ) ( not ( = ?auto_140458 ?auto_140466 ) ) ( not ( = ?auto_140459 ?auto_140466 ) ) ( not ( = ?auto_140460 ?auto_140466 ) ) ( not ( = ?auto_140461 ?auto_140466 ) ) ( not ( = ?auto_140462 ?auto_140466 ) ) ( not ( = ?auto_140463 ?auto_140466 ) ) ( not ( = ?auto_140464 ?auto_140466 ) ) ( not ( = ?auto_140465 ?auto_140466 ) ) ( ON ?auto_140464 ?auto_140465 ) ( ON-TABLE ?auto_140466 ) ( ON ?auto_140463 ?auto_140464 ) ( CLEAR ?auto_140461 ) ( ON ?auto_140462 ?auto_140463 ) ( CLEAR ?auto_140462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140466 ?auto_140465 ?auto_140464 ?auto_140463 )
      ( MAKE-8PILE ?auto_140458 ?auto_140459 ?auto_140460 ?auto_140461 ?auto_140462 ?auto_140463 ?auto_140464 ?auto_140465 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140467 - BLOCK
      ?auto_140468 - BLOCK
      ?auto_140469 - BLOCK
      ?auto_140470 - BLOCK
      ?auto_140471 - BLOCK
      ?auto_140472 - BLOCK
      ?auto_140473 - BLOCK
      ?auto_140474 - BLOCK
    )
    :vars
    (
      ?auto_140475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140467 ) ( ON ?auto_140468 ?auto_140467 ) ( ON ?auto_140469 ?auto_140468 ) ( not ( = ?auto_140467 ?auto_140468 ) ) ( not ( = ?auto_140467 ?auto_140469 ) ) ( not ( = ?auto_140467 ?auto_140470 ) ) ( not ( = ?auto_140467 ?auto_140471 ) ) ( not ( = ?auto_140467 ?auto_140472 ) ) ( not ( = ?auto_140467 ?auto_140473 ) ) ( not ( = ?auto_140467 ?auto_140474 ) ) ( not ( = ?auto_140468 ?auto_140469 ) ) ( not ( = ?auto_140468 ?auto_140470 ) ) ( not ( = ?auto_140468 ?auto_140471 ) ) ( not ( = ?auto_140468 ?auto_140472 ) ) ( not ( = ?auto_140468 ?auto_140473 ) ) ( not ( = ?auto_140468 ?auto_140474 ) ) ( not ( = ?auto_140469 ?auto_140470 ) ) ( not ( = ?auto_140469 ?auto_140471 ) ) ( not ( = ?auto_140469 ?auto_140472 ) ) ( not ( = ?auto_140469 ?auto_140473 ) ) ( not ( = ?auto_140469 ?auto_140474 ) ) ( not ( = ?auto_140470 ?auto_140471 ) ) ( not ( = ?auto_140470 ?auto_140472 ) ) ( not ( = ?auto_140470 ?auto_140473 ) ) ( not ( = ?auto_140470 ?auto_140474 ) ) ( not ( = ?auto_140471 ?auto_140472 ) ) ( not ( = ?auto_140471 ?auto_140473 ) ) ( not ( = ?auto_140471 ?auto_140474 ) ) ( not ( = ?auto_140472 ?auto_140473 ) ) ( not ( = ?auto_140472 ?auto_140474 ) ) ( not ( = ?auto_140473 ?auto_140474 ) ) ( ON ?auto_140474 ?auto_140475 ) ( not ( = ?auto_140467 ?auto_140475 ) ) ( not ( = ?auto_140468 ?auto_140475 ) ) ( not ( = ?auto_140469 ?auto_140475 ) ) ( not ( = ?auto_140470 ?auto_140475 ) ) ( not ( = ?auto_140471 ?auto_140475 ) ) ( not ( = ?auto_140472 ?auto_140475 ) ) ( not ( = ?auto_140473 ?auto_140475 ) ) ( not ( = ?auto_140474 ?auto_140475 ) ) ( ON ?auto_140473 ?auto_140474 ) ( ON-TABLE ?auto_140475 ) ( ON ?auto_140472 ?auto_140473 ) ( ON ?auto_140471 ?auto_140472 ) ( CLEAR ?auto_140471 ) ( HOLDING ?auto_140470 ) ( CLEAR ?auto_140469 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140467 ?auto_140468 ?auto_140469 ?auto_140470 )
      ( MAKE-8PILE ?auto_140467 ?auto_140468 ?auto_140469 ?auto_140470 ?auto_140471 ?auto_140472 ?auto_140473 ?auto_140474 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140476 - BLOCK
      ?auto_140477 - BLOCK
      ?auto_140478 - BLOCK
      ?auto_140479 - BLOCK
      ?auto_140480 - BLOCK
      ?auto_140481 - BLOCK
      ?auto_140482 - BLOCK
      ?auto_140483 - BLOCK
    )
    :vars
    (
      ?auto_140484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140476 ) ( ON ?auto_140477 ?auto_140476 ) ( ON ?auto_140478 ?auto_140477 ) ( not ( = ?auto_140476 ?auto_140477 ) ) ( not ( = ?auto_140476 ?auto_140478 ) ) ( not ( = ?auto_140476 ?auto_140479 ) ) ( not ( = ?auto_140476 ?auto_140480 ) ) ( not ( = ?auto_140476 ?auto_140481 ) ) ( not ( = ?auto_140476 ?auto_140482 ) ) ( not ( = ?auto_140476 ?auto_140483 ) ) ( not ( = ?auto_140477 ?auto_140478 ) ) ( not ( = ?auto_140477 ?auto_140479 ) ) ( not ( = ?auto_140477 ?auto_140480 ) ) ( not ( = ?auto_140477 ?auto_140481 ) ) ( not ( = ?auto_140477 ?auto_140482 ) ) ( not ( = ?auto_140477 ?auto_140483 ) ) ( not ( = ?auto_140478 ?auto_140479 ) ) ( not ( = ?auto_140478 ?auto_140480 ) ) ( not ( = ?auto_140478 ?auto_140481 ) ) ( not ( = ?auto_140478 ?auto_140482 ) ) ( not ( = ?auto_140478 ?auto_140483 ) ) ( not ( = ?auto_140479 ?auto_140480 ) ) ( not ( = ?auto_140479 ?auto_140481 ) ) ( not ( = ?auto_140479 ?auto_140482 ) ) ( not ( = ?auto_140479 ?auto_140483 ) ) ( not ( = ?auto_140480 ?auto_140481 ) ) ( not ( = ?auto_140480 ?auto_140482 ) ) ( not ( = ?auto_140480 ?auto_140483 ) ) ( not ( = ?auto_140481 ?auto_140482 ) ) ( not ( = ?auto_140481 ?auto_140483 ) ) ( not ( = ?auto_140482 ?auto_140483 ) ) ( ON ?auto_140483 ?auto_140484 ) ( not ( = ?auto_140476 ?auto_140484 ) ) ( not ( = ?auto_140477 ?auto_140484 ) ) ( not ( = ?auto_140478 ?auto_140484 ) ) ( not ( = ?auto_140479 ?auto_140484 ) ) ( not ( = ?auto_140480 ?auto_140484 ) ) ( not ( = ?auto_140481 ?auto_140484 ) ) ( not ( = ?auto_140482 ?auto_140484 ) ) ( not ( = ?auto_140483 ?auto_140484 ) ) ( ON ?auto_140482 ?auto_140483 ) ( ON-TABLE ?auto_140484 ) ( ON ?auto_140481 ?auto_140482 ) ( ON ?auto_140480 ?auto_140481 ) ( CLEAR ?auto_140478 ) ( ON ?auto_140479 ?auto_140480 ) ( CLEAR ?auto_140479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140484 ?auto_140483 ?auto_140482 ?auto_140481 ?auto_140480 )
      ( MAKE-8PILE ?auto_140476 ?auto_140477 ?auto_140478 ?auto_140479 ?auto_140480 ?auto_140481 ?auto_140482 ?auto_140483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140485 - BLOCK
      ?auto_140486 - BLOCK
      ?auto_140487 - BLOCK
      ?auto_140488 - BLOCK
      ?auto_140489 - BLOCK
      ?auto_140490 - BLOCK
      ?auto_140491 - BLOCK
      ?auto_140492 - BLOCK
    )
    :vars
    (
      ?auto_140493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140485 ) ( ON ?auto_140486 ?auto_140485 ) ( not ( = ?auto_140485 ?auto_140486 ) ) ( not ( = ?auto_140485 ?auto_140487 ) ) ( not ( = ?auto_140485 ?auto_140488 ) ) ( not ( = ?auto_140485 ?auto_140489 ) ) ( not ( = ?auto_140485 ?auto_140490 ) ) ( not ( = ?auto_140485 ?auto_140491 ) ) ( not ( = ?auto_140485 ?auto_140492 ) ) ( not ( = ?auto_140486 ?auto_140487 ) ) ( not ( = ?auto_140486 ?auto_140488 ) ) ( not ( = ?auto_140486 ?auto_140489 ) ) ( not ( = ?auto_140486 ?auto_140490 ) ) ( not ( = ?auto_140486 ?auto_140491 ) ) ( not ( = ?auto_140486 ?auto_140492 ) ) ( not ( = ?auto_140487 ?auto_140488 ) ) ( not ( = ?auto_140487 ?auto_140489 ) ) ( not ( = ?auto_140487 ?auto_140490 ) ) ( not ( = ?auto_140487 ?auto_140491 ) ) ( not ( = ?auto_140487 ?auto_140492 ) ) ( not ( = ?auto_140488 ?auto_140489 ) ) ( not ( = ?auto_140488 ?auto_140490 ) ) ( not ( = ?auto_140488 ?auto_140491 ) ) ( not ( = ?auto_140488 ?auto_140492 ) ) ( not ( = ?auto_140489 ?auto_140490 ) ) ( not ( = ?auto_140489 ?auto_140491 ) ) ( not ( = ?auto_140489 ?auto_140492 ) ) ( not ( = ?auto_140490 ?auto_140491 ) ) ( not ( = ?auto_140490 ?auto_140492 ) ) ( not ( = ?auto_140491 ?auto_140492 ) ) ( ON ?auto_140492 ?auto_140493 ) ( not ( = ?auto_140485 ?auto_140493 ) ) ( not ( = ?auto_140486 ?auto_140493 ) ) ( not ( = ?auto_140487 ?auto_140493 ) ) ( not ( = ?auto_140488 ?auto_140493 ) ) ( not ( = ?auto_140489 ?auto_140493 ) ) ( not ( = ?auto_140490 ?auto_140493 ) ) ( not ( = ?auto_140491 ?auto_140493 ) ) ( not ( = ?auto_140492 ?auto_140493 ) ) ( ON ?auto_140491 ?auto_140492 ) ( ON-TABLE ?auto_140493 ) ( ON ?auto_140490 ?auto_140491 ) ( ON ?auto_140489 ?auto_140490 ) ( ON ?auto_140488 ?auto_140489 ) ( CLEAR ?auto_140488 ) ( HOLDING ?auto_140487 ) ( CLEAR ?auto_140486 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140485 ?auto_140486 ?auto_140487 )
      ( MAKE-8PILE ?auto_140485 ?auto_140486 ?auto_140487 ?auto_140488 ?auto_140489 ?auto_140490 ?auto_140491 ?auto_140492 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140494 - BLOCK
      ?auto_140495 - BLOCK
      ?auto_140496 - BLOCK
      ?auto_140497 - BLOCK
      ?auto_140498 - BLOCK
      ?auto_140499 - BLOCK
      ?auto_140500 - BLOCK
      ?auto_140501 - BLOCK
    )
    :vars
    (
      ?auto_140502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140494 ) ( ON ?auto_140495 ?auto_140494 ) ( not ( = ?auto_140494 ?auto_140495 ) ) ( not ( = ?auto_140494 ?auto_140496 ) ) ( not ( = ?auto_140494 ?auto_140497 ) ) ( not ( = ?auto_140494 ?auto_140498 ) ) ( not ( = ?auto_140494 ?auto_140499 ) ) ( not ( = ?auto_140494 ?auto_140500 ) ) ( not ( = ?auto_140494 ?auto_140501 ) ) ( not ( = ?auto_140495 ?auto_140496 ) ) ( not ( = ?auto_140495 ?auto_140497 ) ) ( not ( = ?auto_140495 ?auto_140498 ) ) ( not ( = ?auto_140495 ?auto_140499 ) ) ( not ( = ?auto_140495 ?auto_140500 ) ) ( not ( = ?auto_140495 ?auto_140501 ) ) ( not ( = ?auto_140496 ?auto_140497 ) ) ( not ( = ?auto_140496 ?auto_140498 ) ) ( not ( = ?auto_140496 ?auto_140499 ) ) ( not ( = ?auto_140496 ?auto_140500 ) ) ( not ( = ?auto_140496 ?auto_140501 ) ) ( not ( = ?auto_140497 ?auto_140498 ) ) ( not ( = ?auto_140497 ?auto_140499 ) ) ( not ( = ?auto_140497 ?auto_140500 ) ) ( not ( = ?auto_140497 ?auto_140501 ) ) ( not ( = ?auto_140498 ?auto_140499 ) ) ( not ( = ?auto_140498 ?auto_140500 ) ) ( not ( = ?auto_140498 ?auto_140501 ) ) ( not ( = ?auto_140499 ?auto_140500 ) ) ( not ( = ?auto_140499 ?auto_140501 ) ) ( not ( = ?auto_140500 ?auto_140501 ) ) ( ON ?auto_140501 ?auto_140502 ) ( not ( = ?auto_140494 ?auto_140502 ) ) ( not ( = ?auto_140495 ?auto_140502 ) ) ( not ( = ?auto_140496 ?auto_140502 ) ) ( not ( = ?auto_140497 ?auto_140502 ) ) ( not ( = ?auto_140498 ?auto_140502 ) ) ( not ( = ?auto_140499 ?auto_140502 ) ) ( not ( = ?auto_140500 ?auto_140502 ) ) ( not ( = ?auto_140501 ?auto_140502 ) ) ( ON ?auto_140500 ?auto_140501 ) ( ON-TABLE ?auto_140502 ) ( ON ?auto_140499 ?auto_140500 ) ( ON ?auto_140498 ?auto_140499 ) ( ON ?auto_140497 ?auto_140498 ) ( CLEAR ?auto_140495 ) ( ON ?auto_140496 ?auto_140497 ) ( CLEAR ?auto_140496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140502 ?auto_140501 ?auto_140500 ?auto_140499 ?auto_140498 ?auto_140497 )
      ( MAKE-8PILE ?auto_140494 ?auto_140495 ?auto_140496 ?auto_140497 ?auto_140498 ?auto_140499 ?auto_140500 ?auto_140501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140503 - BLOCK
      ?auto_140504 - BLOCK
      ?auto_140505 - BLOCK
      ?auto_140506 - BLOCK
      ?auto_140507 - BLOCK
      ?auto_140508 - BLOCK
      ?auto_140509 - BLOCK
      ?auto_140510 - BLOCK
    )
    :vars
    (
      ?auto_140511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140503 ) ( not ( = ?auto_140503 ?auto_140504 ) ) ( not ( = ?auto_140503 ?auto_140505 ) ) ( not ( = ?auto_140503 ?auto_140506 ) ) ( not ( = ?auto_140503 ?auto_140507 ) ) ( not ( = ?auto_140503 ?auto_140508 ) ) ( not ( = ?auto_140503 ?auto_140509 ) ) ( not ( = ?auto_140503 ?auto_140510 ) ) ( not ( = ?auto_140504 ?auto_140505 ) ) ( not ( = ?auto_140504 ?auto_140506 ) ) ( not ( = ?auto_140504 ?auto_140507 ) ) ( not ( = ?auto_140504 ?auto_140508 ) ) ( not ( = ?auto_140504 ?auto_140509 ) ) ( not ( = ?auto_140504 ?auto_140510 ) ) ( not ( = ?auto_140505 ?auto_140506 ) ) ( not ( = ?auto_140505 ?auto_140507 ) ) ( not ( = ?auto_140505 ?auto_140508 ) ) ( not ( = ?auto_140505 ?auto_140509 ) ) ( not ( = ?auto_140505 ?auto_140510 ) ) ( not ( = ?auto_140506 ?auto_140507 ) ) ( not ( = ?auto_140506 ?auto_140508 ) ) ( not ( = ?auto_140506 ?auto_140509 ) ) ( not ( = ?auto_140506 ?auto_140510 ) ) ( not ( = ?auto_140507 ?auto_140508 ) ) ( not ( = ?auto_140507 ?auto_140509 ) ) ( not ( = ?auto_140507 ?auto_140510 ) ) ( not ( = ?auto_140508 ?auto_140509 ) ) ( not ( = ?auto_140508 ?auto_140510 ) ) ( not ( = ?auto_140509 ?auto_140510 ) ) ( ON ?auto_140510 ?auto_140511 ) ( not ( = ?auto_140503 ?auto_140511 ) ) ( not ( = ?auto_140504 ?auto_140511 ) ) ( not ( = ?auto_140505 ?auto_140511 ) ) ( not ( = ?auto_140506 ?auto_140511 ) ) ( not ( = ?auto_140507 ?auto_140511 ) ) ( not ( = ?auto_140508 ?auto_140511 ) ) ( not ( = ?auto_140509 ?auto_140511 ) ) ( not ( = ?auto_140510 ?auto_140511 ) ) ( ON ?auto_140509 ?auto_140510 ) ( ON-TABLE ?auto_140511 ) ( ON ?auto_140508 ?auto_140509 ) ( ON ?auto_140507 ?auto_140508 ) ( ON ?auto_140506 ?auto_140507 ) ( ON ?auto_140505 ?auto_140506 ) ( CLEAR ?auto_140505 ) ( HOLDING ?auto_140504 ) ( CLEAR ?auto_140503 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140503 ?auto_140504 )
      ( MAKE-8PILE ?auto_140503 ?auto_140504 ?auto_140505 ?auto_140506 ?auto_140507 ?auto_140508 ?auto_140509 ?auto_140510 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140512 - BLOCK
      ?auto_140513 - BLOCK
      ?auto_140514 - BLOCK
      ?auto_140515 - BLOCK
      ?auto_140516 - BLOCK
      ?auto_140517 - BLOCK
      ?auto_140518 - BLOCK
      ?auto_140519 - BLOCK
    )
    :vars
    (
      ?auto_140520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140512 ) ( not ( = ?auto_140512 ?auto_140513 ) ) ( not ( = ?auto_140512 ?auto_140514 ) ) ( not ( = ?auto_140512 ?auto_140515 ) ) ( not ( = ?auto_140512 ?auto_140516 ) ) ( not ( = ?auto_140512 ?auto_140517 ) ) ( not ( = ?auto_140512 ?auto_140518 ) ) ( not ( = ?auto_140512 ?auto_140519 ) ) ( not ( = ?auto_140513 ?auto_140514 ) ) ( not ( = ?auto_140513 ?auto_140515 ) ) ( not ( = ?auto_140513 ?auto_140516 ) ) ( not ( = ?auto_140513 ?auto_140517 ) ) ( not ( = ?auto_140513 ?auto_140518 ) ) ( not ( = ?auto_140513 ?auto_140519 ) ) ( not ( = ?auto_140514 ?auto_140515 ) ) ( not ( = ?auto_140514 ?auto_140516 ) ) ( not ( = ?auto_140514 ?auto_140517 ) ) ( not ( = ?auto_140514 ?auto_140518 ) ) ( not ( = ?auto_140514 ?auto_140519 ) ) ( not ( = ?auto_140515 ?auto_140516 ) ) ( not ( = ?auto_140515 ?auto_140517 ) ) ( not ( = ?auto_140515 ?auto_140518 ) ) ( not ( = ?auto_140515 ?auto_140519 ) ) ( not ( = ?auto_140516 ?auto_140517 ) ) ( not ( = ?auto_140516 ?auto_140518 ) ) ( not ( = ?auto_140516 ?auto_140519 ) ) ( not ( = ?auto_140517 ?auto_140518 ) ) ( not ( = ?auto_140517 ?auto_140519 ) ) ( not ( = ?auto_140518 ?auto_140519 ) ) ( ON ?auto_140519 ?auto_140520 ) ( not ( = ?auto_140512 ?auto_140520 ) ) ( not ( = ?auto_140513 ?auto_140520 ) ) ( not ( = ?auto_140514 ?auto_140520 ) ) ( not ( = ?auto_140515 ?auto_140520 ) ) ( not ( = ?auto_140516 ?auto_140520 ) ) ( not ( = ?auto_140517 ?auto_140520 ) ) ( not ( = ?auto_140518 ?auto_140520 ) ) ( not ( = ?auto_140519 ?auto_140520 ) ) ( ON ?auto_140518 ?auto_140519 ) ( ON-TABLE ?auto_140520 ) ( ON ?auto_140517 ?auto_140518 ) ( ON ?auto_140516 ?auto_140517 ) ( ON ?auto_140515 ?auto_140516 ) ( ON ?auto_140514 ?auto_140515 ) ( CLEAR ?auto_140512 ) ( ON ?auto_140513 ?auto_140514 ) ( CLEAR ?auto_140513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140520 ?auto_140519 ?auto_140518 ?auto_140517 ?auto_140516 ?auto_140515 ?auto_140514 )
      ( MAKE-8PILE ?auto_140512 ?auto_140513 ?auto_140514 ?auto_140515 ?auto_140516 ?auto_140517 ?auto_140518 ?auto_140519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140521 - BLOCK
      ?auto_140522 - BLOCK
      ?auto_140523 - BLOCK
      ?auto_140524 - BLOCK
      ?auto_140525 - BLOCK
      ?auto_140526 - BLOCK
      ?auto_140527 - BLOCK
      ?auto_140528 - BLOCK
    )
    :vars
    (
      ?auto_140529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140521 ?auto_140522 ) ) ( not ( = ?auto_140521 ?auto_140523 ) ) ( not ( = ?auto_140521 ?auto_140524 ) ) ( not ( = ?auto_140521 ?auto_140525 ) ) ( not ( = ?auto_140521 ?auto_140526 ) ) ( not ( = ?auto_140521 ?auto_140527 ) ) ( not ( = ?auto_140521 ?auto_140528 ) ) ( not ( = ?auto_140522 ?auto_140523 ) ) ( not ( = ?auto_140522 ?auto_140524 ) ) ( not ( = ?auto_140522 ?auto_140525 ) ) ( not ( = ?auto_140522 ?auto_140526 ) ) ( not ( = ?auto_140522 ?auto_140527 ) ) ( not ( = ?auto_140522 ?auto_140528 ) ) ( not ( = ?auto_140523 ?auto_140524 ) ) ( not ( = ?auto_140523 ?auto_140525 ) ) ( not ( = ?auto_140523 ?auto_140526 ) ) ( not ( = ?auto_140523 ?auto_140527 ) ) ( not ( = ?auto_140523 ?auto_140528 ) ) ( not ( = ?auto_140524 ?auto_140525 ) ) ( not ( = ?auto_140524 ?auto_140526 ) ) ( not ( = ?auto_140524 ?auto_140527 ) ) ( not ( = ?auto_140524 ?auto_140528 ) ) ( not ( = ?auto_140525 ?auto_140526 ) ) ( not ( = ?auto_140525 ?auto_140527 ) ) ( not ( = ?auto_140525 ?auto_140528 ) ) ( not ( = ?auto_140526 ?auto_140527 ) ) ( not ( = ?auto_140526 ?auto_140528 ) ) ( not ( = ?auto_140527 ?auto_140528 ) ) ( ON ?auto_140528 ?auto_140529 ) ( not ( = ?auto_140521 ?auto_140529 ) ) ( not ( = ?auto_140522 ?auto_140529 ) ) ( not ( = ?auto_140523 ?auto_140529 ) ) ( not ( = ?auto_140524 ?auto_140529 ) ) ( not ( = ?auto_140525 ?auto_140529 ) ) ( not ( = ?auto_140526 ?auto_140529 ) ) ( not ( = ?auto_140527 ?auto_140529 ) ) ( not ( = ?auto_140528 ?auto_140529 ) ) ( ON ?auto_140527 ?auto_140528 ) ( ON-TABLE ?auto_140529 ) ( ON ?auto_140526 ?auto_140527 ) ( ON ?auto_140525 ?auto_140526 ) ( ON ?auto_140524 ?auto_140525 ) ( ON ?auto_140523 ?auto_140524 ) ( ON ?auto_140522 ?auto_140523 ) ( CLEAR ?auto_140522 ) ( HOLDING ?auto_140521 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140521 )
      ( MAKE-8PILE ?auto_140521 ?auto_140522 ?auto_140523 ?auto_140524 ?auto_140525 ?auto_140526 ?auto_140527 ?auto_140528 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140530 - BLOCK
      ?auto_140531 - BLOCK
      ?auto_140532 - BLOCK
      ?auto_140533 - BLOCK
      ?auto_140534 - BLOCK
      ?auto_140535 - BLOCK
      ?auto_140536 - BLOCK
      ?auto_140537 - BLOCK
    )
    :vars
    (
      ?auto_140538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140530 ?auto_140531 ) ) ( not ( = ?auto_140530 ?auto_140532 ) ) ( not ( = ?auto_140530 ?auto_140533 ) ) ( not ( = ?auto_140530 ?auto_140534 ) ) ( not ( = ?auto_140530 ?auto_140535 ) ) ( not ( = ?auto_140530 ?auto_140536 ) ) ( not ( = ?auto_140530 ?auto_140537 ) ) ( not ( = ?auto_140531 ?auto_140532 ) ) ( not ( = ?auto_140531 ?auto_140533 ) ) ( not ( = ?auto_140531 ?auto_140534 ) ) ( not ( = ?auto_140531 ?auto_140535 ) ) ( not ( = ?auto_140531 ?auto_140536 ) ) ( not ( = ?auto_140531 ?auto_140537 ) ) ( not ( = ?auto_140532 ?auto_140533 ) ) ( not ( = ?auto_140532 ?auto_140534 ) ) ( not ( = ?auto_140532 ?auto_140535 ) ) ( not ( = ?auto_140532 ?auto_140536 ) ) ( not ( = ?auto_140532 ?auto_140537 ) ) ( not ( = ?auto_140533 ?auto_140534 ) ) ( not ( = ?auto_140533 ?auto_140535 ) ) ( not ( = ?auto_140533 ?auto_140536 ) ) ( not ( = ?auto_140533 ?auto_140537 ) ) ( not ( = ?auto_140534 ?auto_140535 ) ) ( not ( = ?auto_140534 ?auto_140536 ) ) ( not ( = ?auto_140534 ?auto_140537 ) ) ( not ( = ?auto_140535 ?auto_140536 ) ) ( not ( = ?auto_140535 ?auto_140537 ) ) ( not ( = ?auto_140536 ?auto_140537 ) ) ( ON ?auto_140537 ?auto_140538 ) ( not ( = ?auto_140530 ?auto_140538 ) ) ( not ( = ?auto_140531 ?auto_140538 ) ) ( not ( = ?auto_140532 ?auto_140538 ) ) ( not ( = ?auto_140533 ?auto_140538 ) ) ( not ( = ?auto_140534 ?auto_140538 ) ) ( not ( = ?auto_140535 ?auto_140538 ) ) ( not ( = ?auto_140536 ?auto_140538 ) ) ( not ( = ?auto_140537 ?auto_140538 ) ) ( ON ?auto_140536 ?auto_140537 ) ( ON-TABLE ?auto_140538 ) ( ON ?auto_140535 ?auto_140536 ) ( ON ?auto_140534 ?auto_140535 ) ( ON ?auto_140533 ?auto_140534 ) ( ON ?auto_140532 ?auto_140533 ) ( ON ?auto_140531 ?auto_140532 ) ( ON ?auto_140530 ?auto_140531 ) ( CLEAR ?auto_140530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140538 ?auto_140537 ?auto_140536 ?auto_140535 ?auto_140534 ?auto_140533 ?auto_140532 ?auto_140531 )
      ( MAKE-8PILE ?auto_140530 ?auto_140531 ?auto_140532 ?auto_140533 ?auto_140534 ?auto_140535 ?auto_140536 ?auto_140537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140675 - BLOCK
    )
    :vars
    (
      ?auto_140676 - BLOCK
      ?auto_140677 - BLOCK
      ?auto_140678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140675 ?auto_140676 ) ( CLEAR ?auto_140675 ) ( not ( = ?auto_140675 ?auto_140676 ) ) ( HOLDING ?auto_140677 ) ( CLEAR ?auto_140678 ) ( not ( = ?auto_140675 ?auto_140677 ) ) ( not ( = ?auto_140675 ?auto_140678 ) ) ( not ( = ?auto_140676 ?auto_140677 ) ) ( not ( = ?auto_140676 ?auto_140678 ) ) ( not ( = ?auto_140677 ?auto_140678 ) ) )
    :subtasks
    ( ( !STACK ?auto_140677 ?auto_140678 )
      ( MAKE-1PILE ?auto_140675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140679 - BLOCK
    )
    :vars
    (
      ?auto_140682 - BLOCK
      ?auto_140680 - BLOCK
      ?auto_140681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140679 ?auto_140682 ) ( not ( = ?auto_140679 ?auto_140682 ) ) ( CLEAR ?auto_140680 ) ( not ( = ?auto_140679 ?auto_140681 ) ) ( not ( = ?auto_140679 ?auto_140680 ) ) ( not ( = ?auto_140682 ?auto_140681 ) ) ( not ( = ?auto_140682 ?auto_140680 ) ) ( not ( = ?auto_140681 ?auto_140680 ) ) ( ON ?auto_140681 ?auto_140679 ) ( CLEAR ?auto_140681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140682 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140682 ?auto_140679 )
      ( MAKE-1PILE ?auto_140679 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140683 - BLOCK
    )
    :vars
    (
      ?auto_140684 - BLOCK
      ?auto_140686 - BLOCK
      ?auto_140685 - BLOCK
      ?auto_140687 - BLOCK
      ?auto_140691 - BLOCK
      ?auto_140690 - BLOCK
      ?auto_140689 - BLOCK
      ?auto_140688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140683 ?auto_140684 ) ( not ( = ?auto_140683 ?auto_140684 ) ) ( not ( = ?auto_140683 ?auto_140686 ) ) ( not ( = ?auto_140683 ?auto_140685 ) ) ( not ( = ?auto_140684 ?auto_140686 ) ) ( not ( = ?auto_140684 ?auto_140685 ) ) ( not ( = ?auto_140686 ?auto_140685 ) ) ( ON ?auto_140686 ?auto_140683 ) ( CLEAR ?auto_140686 ) ( ON-TABLE ?auto_140684 ) ( HOLDING ?auto_140685 ) ( CLEAR ?auto_140687 ) ( ON-TABLE ?auto_140691 ) ( ON ?auto_140690 ?auto_140691 ) ( ON ?auto_140689 ?auto_140690 ) ( ON ?auto_140688 ?auto_140689 ) ( ON ?auto_140687 ?auto_140688 ) ( not ( = ?auto_140691 ?auto_140690 ) ) ( not ( = ?auto_140691 ?auto_140689 ) ) ( not ( = ?auto_140691 ?auto_140688 ) ) ( not ( = ?auto_140691 ?auto_140687 ) ) ( not ( = ?auto_140691 ?auto_140685 ) ) ( not ( = ?auto_140690 ?auto_140689 ) ) ( not ( = ?auto_140690 ?auto_140688 ) ) ( not ( = ?auto_140690 ?auto_140687 ) ) ( not ( = ?auto_140690 ?auto_140685 ) ) ( not ( = ?auto_140689 ?auto_140688 ) ) ( not ( = ?auto_140689 ?auto_140687 ) ) ( not ( = ?auto_140689 ?auto_140685 ) ) ( not ( = ?auto_140688 ?auto_140687 ) ) ( not ( = ?auto_140688 ?auto_140685 ) ) ( not ( = ?auto_140687 ?auto_140685 ) ) ( not ( = ?auto_140683 ?auto_140687 ) ) ( not ( = ?auto_140683 ?auto_140691 ) ) ( not ( = ?auto_140683 ?auto_140690 ) ) ( not ( = ?auto_140683 ?auto_140689 ) ) ( not ( = ?auto_140683 ?auto_140688 ) ) ( not ( = ?auto_140684 ?auto_140687 ) ) ( not ( = ?auto_140684 ?auto_140691 ) ) ( not ( = ?auto_140684 ?auto_140690 ) ) ( not ( = ?auto_140684 ?auto_140689 ) ) ( not ( = ?auto_140684 ?auto_140688 ) ) ( not ( = ?auto_140686 ?auto_140687 ) ) ( not ( = ?auto_140686 ?auto_140691 ) ) ( not ( = ?auto_140686 ?auto_140690 ) ) ( not ( = ?auto_140686 ?auto_140689 ) ) ( not ( = ?auto_140686 ?auto_140688 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140691 ?auto_140690 ?auto_140689 ?auto_140688 ?auto_140687 ?auto_140685 )
      ( MAKE-1PILE ?auto_140683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140692 - BLOCK
    )
    :vars
    (
      ?auto_140697 - BLOCK
      ?auto_140699 - BLOCK
      ?auto_140693 - BLOCK
      ?auto_140694 - BLOCK
      ?auto_140700 - BLOCK
      ?auto_140695 - BLOCK
      ?auto_140696 - BLOCK
      ?auto_140698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140692 ?auto_140697 ) ( not ( = ?auto_140692 ?auto_140697 ) ) ( not ( = ?auto_140692 ?auto_140699 ) ) ( not ( = ?auto_140692 ?auto_140693 ) ) ( not ( = ?auto_140697 ?auto_140699 ) ) ( not ( = ?auto_140697 ?auto_140693 ) ) ( not ( = ?auto_140699 ?auto_140693 ) ) ( ON ?auto_140699 ?auto_140692 ) ( ON-TABLE ?auto_140697 ) ( CLEAR ?auto_140694 ) ( ON-TABLE ?auto_140700 ) ( ON ?auto_140695 ?auto_140700 ) ( ON ?auto_140696 ?auto_140695 ) ( ON ?auto_140698 ?auto_140696 ) ( ON ?auto_140694 ?auto_140698 ) ( not ( = ?auto_140700 ?auto_140695 ) ) ( not ( = ?auto_140700 ?auto_140696 ) ) ( not ( = ?auto_140700 ?auto_140698 ) ) ( not ( = ?auto_140700 ?auto_140694 ) ) ( not ( = ?auto_140700 ?auto_140693 ) ) ( not ( = ?auto_140695 ?auto_140696 ) ) ( not ( = ?auto_140695 ?auto_140698 ) ) ( not ( = ?auto_140695 ?auto_140694 ) ) ( not ( = ?auto_140695 ?auto_140693 ) ) ( not ( = ?auto_140696 ?auto_140698 ) ) ( not ( = ?auto_140696 ?auto_140694 ) ) ( not ( = ?auto_140696 ?auto_140693 ) ) ( not ( = ?auto_140698 ?auto_140694 ) ) ( not ( = ?auto_140698 ?auto_140693 ) ) ( not ( = ?auto_140694 ?auto_140693 ) ) ( not ( = ?auto_140692 ?auto_140694 ) ) ( not ( = ?auto_140692 ?auto_140700 ) ) ( not ( = ?auto_140692 ?auto_140695 ) ) ( not ( = ?auto_140692 ?auto_140696 ) ) ( not ( = ?auto_140692 ?auto_140698 ) ) ( not ( = ?auto_140697 ?auto_140694 ) ) ( not ( = ?auto_140697 ?auto_140700 ) ) ( not ( = ?auto_140697 ?auto_140695 ) ) ( not ( = ?auto_140697 ?auto_140696 ) ) ( not ( = ?auto_140697 ?auto_140698 ) ) ( not ( = ?auto_140699 ?auto_140694 ) ) ( not ( = ?auto_140699 ?auto_140700 ) ) ( not ( = ?auto_140699 ?auto_140695 ) ) ( not ( = ?auto_140699 ?auto_140696 ) ) ( not ( = ?auto_140699 ?auto_140698 ) ) ( ON ?auto_140693 ?auto_140699 ) ( CLEAR ?auto_140693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140697 ?auto_140692 ?auto_140699 )
      ( MAKE-1PILE ?auto_140692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140701 - BLOCK
    )
    :vars
    (
      ?auto_140705 - BLOCK
      ?auto_140709 - BLOCK
      ?auto_140703 - BLOCK
      ?auto_140704 - BLOCK
      ?auto_140702 - BLOCK
      ?auto_140706 - BLOCK
      ?auto_140708 - BLOCK
      ?auto_140707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140701 ?auto_140705 ) ( not ( = ?auto_140701 ?auto_140705 ) ) ( not ( = ?auto_140701 ?auto_140709 ) ) ( not ( = ?auto_140701 ?auto_140703 ) ) ( not ( = ?auto_140705 ?auto_140709 ) ) ( not ( = ?auto_140705 ?auto_140703 ) ) ( not ( = ?auto_140709 ?auto_140703 ) ) ( ON ?auto_140709 ?auto_140701 ) ( ON-TABLE ?auto_140705 ) ( ON-TABLE ?auto_140704 ) ( ON ?auto_140702 ?auto_140704 ) ( ON ?auto_140706 ?auto_140702 ) ( ON ?auto_140708 ?auto_140706 ) ( not ( = ?auto_140704 ?auto_140702 ) ) ( not ( = ?auto_140704 ?auto_140706 ) ) ( not ( = ?auto_140704 ?auto_140708 ) ) ( not ( = ?auto_140704 ?auto_140707 ) ) ( not ( = ?auto_140704 ?auto_140703 ) ) ( not ( = ?auto_140702 ?auto_140706 ) ) ( not ( = ?auto_140702 ?auto_140708 ) ) ( not ( = ?auto_140702 ?auto_140707 ) ) ( not ( = ?auto_140702 ?auto_140703 ) ) ( not ( = ?auto_140706 ?auto_140708 ) ) ( not ( = ?auto_140706 ?auto_140707 ) ) ( not ( = ?auto_140706 ?auto_140703 ) ) ( not ( = ?auto_140708 ?auto_140707 ) ) ( not ( = ?auto_140708 ?auto_140703 ) ) ( not ( = ?auto_140707 ?auto_140703 ) ) ( not ( = ?auto_140701 ?auto_140707 ) ) ( not ( = ?auto_140701 ?auto_140704 ) ) ( not ( = ?auto_140701 ?auto_140702 ) ) ( not ( = ?auto_140701 ?auto_140706 ) ) ( not ( = ?auto_140701 ?auto_140708 ) ) ( not ( = ?auto_140705 ?auto_140707 ) ) ( not ( = ?auto_140705 ?auto_140704 ) ) ( not ( = ?auto_140705 ?auto_140702 ) ) ( not ( = ?auto_140705 ?auto_140706 ) ) ( not ( = ?auto_140705 ?auto_140708 ) ) ( not ( = ?auto_140709 ?auto_140707 ) ) ( not ( = ?auto_140709 ?auto_140704 ) ) ( not ( = ?auto_140709 ?auto_140702 ) ) ( not ( = ?auto_140709 ?auto_140706 ) ) ( not ( = ?auto_140709 ?auto_140708 ) ) ( ON ?auto_140703 ?auto_140709 ) ( CLEAR ?auto_140703 ) ( HOLDING ?auto_140707 ) ( CLEAR ?auto_140708 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140704 ?auto_140702 ?auto_140706 ?auto_140708 ?auto_140707 )
      ( MAKE-1PILE ?auto_140701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140710 - BLOCK
    )
    :vars
    (
      ?auto_140714 - BLOCK
      ?auto_140712 - BLOCK
      ?auto_140711 - BLOCK
      ?auto_140715 - BLOCK
      ?auto_140716 - BLOCK
      ?auto_140713 - BLOCK
      ?auto_140717 - BLOCK
      ?auto_140718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140710 ?auto_140714 ) ( not ( = ?auto_140710 ?auto_140714 ) ) ( not ( = ?auto_140710 ?auto_140712 ) ) ( not ( = ?auto_140710 ?auto_140711 ) ) ( not ( = ?auto_140714 ?auto_140712 ) ) ( not ( = ?auto_140714 ?auto_140711 ) ) ( not ( = ?auto_140712 ?auto_140711 ) ) ( ON ?auto_140712 ?auto_140710 ) ( ON-TABLE ?auto_140714 ) ( ON-TABLE ?auto_140715 ) ( ON ?auto_140716 ?auto_140715 ) ( ON ?auto_140713 ?auto_140716 ) ( ON ?auto_140717 ?auto_140713 ) ( not ( = ?auto_140715 ?auto_140716 ) ) ( not ( = ?auto_140715 ?auto_140713 ) ) ( not ( = ?auto_140715 ?auto_140717 ) ) ( not ( = ?auto_140715 ?auto_140718 ) ) ( not ( = ?auto_140715 ?auto_140711 ) ) ( not ( = ?auto_140716 ?auto_140713 ) ) ( not ( = ?auto_140716 ?auto_140717 ) ) ( not ( = ?auto_140716 ?auto_140718 ) ) ( not ( = ?auto_140716 ?auto_140711 ) ) ( not ( = ?auto_140713 ?auto_140717 ) ) ( not ( = ?auto_140713 ?auto_140718 ) ) ( not ( = ?auto_140713 ?auto_140711 ) ) ( not ( = ?auto_140717 ?auto_140718 ) ) ( not ( = ?auto_140717 ?auto_140711 ) ) ( not ( = ?auto_140718 ?auto_140711 ) ) ( not ( = ?auto_140710 ?auto_140718 ) ) ( not ( = ?auto_140710 ?auto_140715 ) ) ( not ( = ?auto_140710 ?auto_140716 ) ) ( not ( = ?auto_140710 ?auto_140713 ) ) ( not ( = ?auto_140710 ?auto_140717 ) ) ( not ( = ?auto_140714 ?auto_140718 ) ) ( not ( = ?auto_140714 ?auto_140715 ) ) ( not ( = ?auto_140714 ?auto_140716 ) ) ( not ( = ?auto_140714 ?auto_140713 ) ) ( not ( = ?auto_140714 ?auto_140717 ) ) ( not ( = ?auto_140712 ?auto_140718 ) ) ( not ( = ?auto_140712 ?auto_140715 ) ) ( not ( = ?auto_140712 ?auto_140716 ) ) ( not ( = ?auto_140712 ?auto_140713 ) ) ( not ( = ?auto_140712 ?auto_140717 ) ) ( ON ?auto_140711 ?auto_140712 ) ( CLEAR ?auto_140717 ) ( ON ?auto_140718 ?auto_140711 ) ( CLEAR ?auto_140718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140714 ?auto_140710 ?auto_140712 ?auto_140711 )
      ( MAKE-1PILE ?auto_140710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140719 - BLOCK
    )
    :vars
    (
      ?auto_140721 - BLOCK
      ?auto_140723 - BLOCK
      ?auto_140726 - BLOCK
      ?auto_140727 - BLOCK
      ?auto_140720 - BLOCK
      ?auto_140724 - BLOCK
      ?auto_140722 - BLOCK
      ?auto_140725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140719 ?auto_140721 ) ( not ( = ?auto_140719 ?auto_140721 ) ) ( not ( = ?auto_140719 ?auto_140723 ) ) ( not ( = ?auto_140719 ?auto_140726 ) ) ( not ( = ?auto_140721 ?auto_140723 ) ) ( not ( = ?auto_140721 ?auto_140726 ) ) ( not ( = ?auto_140723 ?auto_140726 ) ) ( ON ?auto_140723 ?auto_140719 ) ( ON-TABLE ?auto_140721 ) ( ON-TABLE ?auto_140727 ) ( ON ?auto_140720 ?auto_140727 ) ( ON ?auto_140724 ?auto_140720 ) ( not ( = ?auto_140727 ?auto_140720 ) ) ( not ( = ?auto_140727 ?auto_140724 ) ) ( not ( = ?auto_140727 ?auto_140722 ) ) ( not ( = ?auto_140727 ?auto_140725 ) ) ( not ( = ?auto_140727 ?auto_140726 ) ) ( not ( = ?auto_140720 ?auto_140724 ) ) ( not ( = ?auto_140720 ?auto_140722 ) ) ( not ( = ?auto_140720 ?auto_140725 ) ) ( not ( = ?auto_140720 ?auto_140726 ) ) ( not ( = ?auto_140724 ?auto_140722 ) ) ( not ( = ?auto_140724 ?auto_140725 ) ) ( not ( = ?auto_140724 ?auto_140726 ) ) ( not ( = ?auto_140722 ?auto_140725 ) ) ( not ( = ?auto_140722 ?auto_140726 ) ) ( not ( = ?auto_140725 ?auto_140726 ) ) ( not ( = ?auto_140719 ?auto_140725 ) ) ( not ( = ?auto_140719 ?auto_140727 ) ) ( not ( = ?auto_140719 ?auto_140720 ) ) ( not ( = ?auto_140719 ?auto_140724 ) ) ( not ( = ?auto_140719 ?auto_140722 ) ) ( not ( = ?auto_140721 ?auto_140725 ) ) ( not ( = ?auto_140721 ?auto_140727 ) ) ( not ( = ?auto_140721 ?auto_140720 ) ) ( not ( = ?auto_140721 ?auto_140724 ) ) ( not ( = ?auto_140721 ?auto_140722 ) ) ( not ( = ?auto_140723 ?auto_140725 ) ) ( not ( = ?auto_140723 ?auto_140727 ) ) ( not ( = ?auto_140723 ?auto_140720 ) ) ( not ( = ?auto_140723 ?auto_140724 ) ) ( not ( = ?auto_140723 ?auto_140722 ) ) ( ON ?auto_140726 ?auto_140723 ) ( ON ?auto_140725 ?auto_140726 ) ( CLEAR ?auto_140725 ) ( HOLDING ?auto_140722 ) ( CLEAR ?auto_140724 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140727 ?auto_140720 ?auto_140724 ?auto_140722 )
      ( MAKE-1PILE ?auto_140719 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140728 - BLOCK
    )
    :vars
    (
      ?auto_140731 - BLOCK
      ?auto_140735 - BLOCK
      ?auto_140736 - BLOCK
      ?auto_140732 - BLOCK
      ?auto_140733 - BLOCK
      ?auto_140729 - BLOCK
      ?auto_140730 - BLOCK
      ?auto_140734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140728 ?auto_140731 ) ( not ( = ?auto_140728 ?auto_140731 ) ) ( not ( = ?auto_140728 ?auto_140735 ) ) ( not ( = ?auto_140728 ?auto_140736 ) ) ( not ( = ?auto_140731 ?auto_140735 ) ) ( not ( = ?auto_140731 ?auto_140736 ) ) ( not ( = ?auto_140735 ?auto_140736 ) ) ( ON ?auto_140735 ?auto_140728 ) ( ON-TABLE ?auto_140731 ) ( ON-TABLE ?auto_140732 ) ( ON ?auto_140733 ?auto_140732 ) ( ON ?auto_140729 ?auto_140733 ) ( not ( = ?auto_140732 ?auto_140733 ) ) ( not ( = ?auto_140732 ?auto_140729 ) ) ( not ( = ?auto_140732 ?auto_140730 ) ) ( not ( = ?auto_140732 ?auto_140734 ) ) ( not ( = ?auto_140732 ?auto_140736 ) ) ( not ( = ?auto_140733 ?auto_140729 ) ) ( not ( = ?auto_140733 ?auto_140730 ) ) ( not ( = ?auto_140733 ?auto_140734 ) ) ( not ( = ?auto_140733 ?auto_140736 ) ) ( not ( = ?auto_140729 ?auto_140730 ) ) ( not ( = ?auto_140729 ?auto_140734 ) ) ( not ( = ?auto_140729 ?auto_140736 ) ) ( not ( = ?auto_140730 ?auto_140734 ) ) ( not ( = ?auto_140730 ?auto_140736 ) ) ( not ( = ?auto_140734 ?auto_140736 ) ) ( not ( = ?auto_140728 ?auto_140734 ) ) ( not ( = ?auto_140728 ?auto_140732 ) ) ( not ( = ?auto_140728 ?auto_140733 ) ) ( not ( = ?auto_140728 ?auto_140729 ) ) ( not ( = ?auto_140728 ?auto_140730 ) ) ( not ( = ?auto_140731 ?auto_140734 ) ) ( not ( = ?auto_140731 ?auto_140732 ) ) ( not ( = ?auto_140731 ?auto_140733 ) ) ( not ( = ?auto_140731 ?auto_140729 ) ) ( not ( = ?auto_140731 ?auto_140730 ) ) ( not ( = ?auto_140735 ?auto_140734 ) ) ( not ( = ?auto_140735 ?auto_140732 ) ) ( not ( = ?auto_140735 ?auto_140733 ) ) ( not ( = ?auto_140735 ?auto_140729 ) ) ( not ( = ?auto_140735 ?auto_140730 ) ) ( ON ?auto_140736 ?auto_140735 ) ( ON ?auto_140734 ?auto_140736 ) ( CLEAR ?auto_140729 ) ( ON ?auto_140730 ?auto_140734 ) ( CLEAR ?auto_140730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140731 ?auto_140728 ?auto_140735 ?auto_140736 ?auto_140734 )
      ( MAKE-1PILE ?auto_140728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140737 - BLOCK
    )
    :vars
    (
      ?auto_140741 - BLOCK
      ?auto_140743 - BLOCK
      ?auto_140742 - BLOCK
      ?auto_140744 - BLOCK
      ?auto_140739 - BLOCK
      ?auto_140738 - BLOCK
      ?auto_140745 - BLOCK
      ?auto_140740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140737 ?auto_140741 ) ( not ( = ?auto_140737 ?auto_140741 ) ) ( not ( = ?auto_140737 ?auto_140743 ) ) ( not ( = ?auto_140737 ?auto_140742 ) ) ( not ( = ?auto_140741 ?auto_140743 ) ) ( not ( = ?auto_140741 ?auto_140742 ) ) ( not ( = ?auto_140743 ?auto_140742 ) ) ( ON ?auto_140743 ?auto_140737 ) ( ON-TABLE ?auto_140741 ) ( ON-TABLE ?auto_140744 ) ( ON ?auto_140739 ?auto_140744 ) ( not ( = ?auto_140744 ?auto_140739 ) ) ( not ( = ?auto_140744 ?auto_140738 ) ) ( not ( = ?auto_140744 ?auto_140745 ) ) ( not ( = ?auto_140744 ?auto_140740 ) ) ( not ( = ?auto_140744 ?auto_140742 ) ) ( not ( = ?auto_140739 ?auto_140738 ) ) ( not ( = ?auto_140739 ?auto_140745 ) ) ( not ( = ?auto_140739 ?auto_140740 ) ) ( not ( = ?auto_140739 ?auto_140742 ) ) ( not ( = ?auto_140738 ?auto_140745 ) ) ( not ( = ?auto_140738 ?auto_140740 ) ) ( not ( = ?auto_140738 ?auto_140742 ) ) ( not ( = ?auto_140745 ?auto_140740 ) ) ( not ( = ?auto_140745 ?auto_140742 ) ) ( not ( = ?auto_140740 ?auto_140742 ) ) ( not ( = ?auto_140737 ?auto_140740 ) ) ( not ( = ?auto_140737 ?auto_140744 ) ) ( not ( = ?auto_140737 ?auto_140739 ) ) ( not ( = ?auto_140737 ?auto_140738 ) ) ( not ( = ?auto_140737 ?auto_140745 ) ) ( not ( = ?auto_140741 ?auto_140740 ) ) ( not ( = ?auto_140741 ?auto_140744 ) ) ( not ( = ?auto_140741 ?auto_140739 ) ) ( not ( = ?auto_140741 ?auto_140738 ) ) ( not ( = ?auto_140741 ?auto_140745 ) ) ( not ( = ?auto_140743 ?auto_140740 ) ) ( not ( = ?auto_140743 ?auto_140744 ) ) ( not ( = ?auto_140743 ?auto_140739 ) ) ( not ( = ?auto_140743 ?auto_140738 ) ) ( not ( = ?auto_140743 ?auto_140745 ) ) ( ON ?auto_140742 ?auto_140743 ) ( ON ?auto_140740 ?auto_140742 ) ( ON ?auto_140745 ?auto_140740 ) ( CLEAR ?auto_140745 ) ( HOLDING ?auto_140738 ) ( CLEAR ?auto_140739 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140744 ?auto_140739 ?auto_140738 )
      ( MAKE-1PILE ?auto_140737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140746 - BLOCK
    )
    :vars
    (
      ?auto_140752 - BLOCK
      ?auto_140753 - BLOCK
      ?auto_140747 - BLOCK
      ?auto_140754 - BLOCK
      ?auto_140750 - BLOCK
      ?auto_140751 - BLOCK
      ?auto_140748 - BLOCK
      ?auto_140749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140746 ?auto_140752 ) ( not ( = ?auto_140746 ?auto_140752 ) ) ( not ( = ?auto_140746 ?auto_140753 ) ) ( not ( = ?auto_140746 ?auto_140747 ) ) ( not ( = ?auto_140752 ?auto_140753 ) ) ( not ( = ?auto_140752 ?auto_140747 ) ) ( not ( = ?auto_140753 ?auto_140747 ) ) ( ON ?auto_140753 ?auto_140746 ) ( ON-TABLE ?auto_140752 ) ( ON-TABLE ?auto_140754 ) ( ON ?auto_140750 ?auto_140754 ) ( not ( = ?auto_140754 ?auto_140750 ) ) ( not ( = ?auto_140754 ?auto_140751 ) ) ( not ( = ?auto_140754 ?auto_140748 ) ) ( not ( = ?auto_140754 ?auto_140749 ) ) ( not ( = ?auto_140754 ?auto_140747 ) ) ( not ( = ?auto_140750 ?auto_140751 ) ) ( not ( = ?auto_140750 ?auto_140748 ) ) ( not ( = ?auto_140750 ?auto_140749 ) ) ( not ( = ?auto_140750 ?auto_140747 ) ) ( not ( = ?auto_140751 ?auto_140748 ) ) ( not ( = ?auto_140751 ?auto_140749 ) ) ( not ( = ?auto_140751 ?auto_140747 ) ) ( not ( = ?auto_140748 ?auto_140749 ) ) ( not ( = ?auto_140748 ?auto_140747 ) ) ( not ( = ?auto_140749 ?auto_140747 ) ) ( not ( = ?auto_140746 ?auto_140749 ) ) ( not ( = ?auto_140746 ?auto_140754 ) ) ( not ( = ?auto_140746 ?auto_140750 ) ) ( not ( = ?auto_140746 ?auto_140751 ) ) ( not ( = ?auto_140746 ?auto_140748 ) ) ( not ( = ?auto_140752 ?auto_140749 ) ) ( not ( = ?auto_140752 ?auto_140754 ) ) ( not ( = ?auto_140752 ?auto_140750 ) ) ( not ( = ?auto_140752 ?auto_140751 ) ) ( not ( = ?auto_140752 ?auto_140748 ) ) ( not ( = ?auto_140753 ?auto_140749 ) ) ( not ( = ?auto_140753 ?auto_140754 ) ) ( not ( = ?auto_140753 ?auto_140750 ) ) ( not ( = ?auto_140753 ?auto_140751 ) ) ( not ( = ?auto_140753 ?auto_140748 ) ) ( ON ?auto_140747 ?auto_140753 ) ( ON ?auto_140749 ?auto_140747 ) ( ON ?auto_140748 ?auto_140749 ) ( CLEAR ?auto_140750 ) ( ON ?auto_140751 ?auto_140748 ) ( CLEAR ?auto_140751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140752 ?auto_140746 ?auto_140753 ?auto_140747 ?auto_140749 ?auto_140748 )
      ( MAKE-1PILE ?auto_140746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140755 - BLOCK
    )
    :vars
    (
      ?auto_140762 - BLOCK
      ?auto_140758 - BLOCK
      ?auto_140763 - BLOCK
      ?auto_140756 - BLOCK
      ?auto_140757 - BLOCK
      ?auto_140759 - BLOCK
      ?auto_140761 - BLOCK
      ?auto_140760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140755 ?auto_140762 ) ( not ( = ?auto_140755 ?auto_140762 ) ) ( not ( = ?auto_140755 ?auto_140758 ) ) ( not ( = ?auto_140755 ?auto_140763 ) ) ( not ( = ?auto_140762 ?auto_140758 ) ) ( not ( = ?auto_140762 ?auto_140763 ) ) ( not ( = ?auto_140758 ?auto_140763 ) ) ( ON ?auto_140758 ?auto_140755 ) ( ON-TABLE ?auto_140762 ) ( ON-TABLE ?auto_140756 ) ( not ( = ?auto_140756 ?auto_140757 ) ) ( not ( = ?auto_140756 ?auto_140759 ) ) ( not ( = ?auto_140756 ?auto_140761 ) ) ( not ( = ?auto_140756 ?auto_140760 ) ) ( not ( = ?auto_140756 ?auto_140763 ) ) ( not ( = ?auto_140757 ?auto_140759 ) ) ( not ( = ?auto_140757 ?auto_140761 ) ) ( not ( = ?auto_140757 ?auto_140760 ) ) ( not ( = ?auto_140757 ?auto_140763 ) ) ( not ( = ?auto_140759 ?auto_140761 ) ) ( not ( = ?auto_140759 ?auto_140760 ) ) ( not ( = ?auto_140759 ?auto_140763 ) ) ( not ( = ?auto_140761 ?auto_140760 ) ) ( not ( = ?auto_140761 ?auto_140763 ) ) ( not ( = ?auto_140760 ?auto_140763 ) ) ( not ( = ?auto_140755 ?auto_140760 ) ) ( not ( = ?auto_140755 ?auto_140756 ) ) ( not ( = ?auto_140755 ?auto_140757 ) ) ( not ( = ?auto_140755 ?auto_140759 ) ) ( not ( = ?auto_140755 ?auto_140761 ) ) ( not ( = ?auto_140762 ?auto_140760 ) ) ( not ( = ?auto_140762 ?auto_140756 ) ) ( not ( = ?auto_140762 ?auto_140757 ) ) ( not ( = ?auto_140762 ?auto_140759 ) ) ( not ( = ?auto_140762 ?auto_140761 ) ) ( not ( = ?auto_140758 ?auto_140760 ) ) ( not ( = ?auto_140758 ?auto_140756 ) ) ( not ( = ?auto_140758 ?auto_140757 ) ) ( not ( = ?auto_140758 ?auto_140759 ) ) ( not ( = ?auto_140758 ?auto_140761 ) ) ( ON ?auto_140763 ?auto_140758 ) ( ON ?auto_140760 ?auto_140763 ) ( ON ?auto_140761 ?auto_140760 ) ( ON ?auto_140759 ?auto_140761 ) ( CLEAR ?auto_140759 ) ( HOLDING ?auto_140757 ) ( CLEAR ?auto_140756 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140756 ?auto_140757 )
      ( MAKE-1PILE ?auto_140755 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140764 - BLOCK
    )
    :vars
    (
      ?auto_140770 - BLOCK
      ?auto_140766 - BLOCK
      ?auto_140771 - BLOCK
      ?auto_140769 - BLOCK
      ?auto_140767 - BLOCK
      ?auto_140772 - BLOCK
      ?auto_140768 - BLOCK
      ?auto_140765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140764 ?auto_140770 ) ( not ( = ?auto_140764 ?auto_140770 ) ) ( not ( = ?auto_140764 ?auto_140766 ) ) ( not ( = ?auto_140764 ?auto_140771 ) ) ( not ( = ?auto_140770 ?auto_140766 ) ) ( not ( = ?auto_140770 ?auto_140771 ) ) ( not ( = ?auto_140766 ?auto_140771 ) ) ( ON ?auto_140766 ?auto_140764 ) ( ON-TABLE ?auto_140770 ) ( ON-TABLE ?auto_140769 ) ( not ( = ?auto_140769 ?auto_140767 ) ) ( not ( = ?auto_140769 ?auto_140772 ) ) ( not ( = ?auto_140769 ?auto_140768 ) ) ( not ( = ?auto_140769 ?auto_140765 ) ) ( not ( = ?auto_140769 ?auto_140771 ) ) ( not ( = ?auto_140767 ?auto_140772 ) ) ( not ( = ?auto_140767 ?auto_140768 ) ) ( not ( = ?auto_140767 ?auto_140765 ) ) ( not ( = ?auto_140767 ?auto_140771 ) ) ( not ( = ?auto_140772 ?auto_140768 ) ) ( not ( = ?auto_140772 ?auto_140765 ) ) ( not ( = ?auto_140772 ?auto_140771 ) ) ( not ( = ?auto_140768 ?auto_140765 ) ) ( not ( = ?auto_140768 ?auto_140771 ) ) ( not ( = ?auto_140765 ?auto_140771 ) ) ( not ( = ?auto_140764 ?auto_140765 ) ) ( not ( = ?auto_140764 ?auto_140769 ) ) ( not ( = ?auto_140764 ?auto_140767 ) ) ( not ( = ?auto_140764 ?auto_140772 ) ) ( not ( = ?auto_140764 ?auto_140768 ) ) ( not ( = ?auto_140770 ?auto_140765 ) ) ( not ( = ?auto_140770 ?auto_140769 ) ) ( not ( = ?auto_140770 ?auto_140767 ) ) ( not ( = ?auto_140770 ?auto_140772 ) ) ( not ( = ?auto_140770 ?auto_140768 ) ) ( not ( = ?auto_140766 ?auto_140765 ) ) ( not ( = ?auto_140766 ?auto_140769 ) ) ( not ( = ?auto_140766 ?auto_140767 ) ) ( not ( = ?auto_140766 ?auto_140772 ) ) ( not ( = ?auto_140766 ?auto_140768 ) ) ( ON ?auto_140771 ?auto_140766 ) ( ON ?auto_140765 ?auto_140771 ) ( ON ?auto_140768 ?auto_140765 ) ( ON ?auto_140772 ?auto_140768 ) ( CLEAR ?auto_140769 ) ( ON ?auto_140767 ?auto_140772 ) ( CLEAR ?auto_140767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140770 ?auto_140764 ?auto_140766 ?auto_140771 ?auto_140765 ?auto_140768 ?auto_140772 )
      ( MAKE-1PILE ?auto_140764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140773 - BLOCK
    )
    :vars
    (
      ?auto_140778 - BLOCK
      ?auto_140777 - BLOCK
      ?auto_140774 - BLOCK
      ?auto_140781 - BLOCK
      ?auto_140776 - BLOCK
      ?auto_140779 - BLOCK
      ?auto_140780 - BLOCK
      ?auto_140775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140773 ?auto_140778 ) ( not ( = ?auto_140773 ?auto_140778 ) ) ( not ( = ?auto_140773 ?auto_140777 ) ) ( not ( = ?auto_140773 ?auto_140774 ) ) ( not ( = ?auto_140778 ?auto_140777 ) ) ( not ( = ?auto_140778 ?auto_140774 ) ) ( not ( = ?auto_140777 ?auto_140774 ) ) ( ON ?auto_140777 ?auto_140773 ) ( ON-TABLE ?auto_140778 ) ( not ( = ?auto_140781 ?auto_140776 ) ) ( not ( = ?auto_140781 ?auto_140779 ) ) ( not ( = ?auto_140781 ?auto_140780 ) ) ( not ( = ?auto_140781 ?auto_140775 ) ) ( not ( = ?auto_140781 ?auto_140774 ) ) ( not ( = ?auto_140776 ?auto_140779 ) ) ( not ( = ?auto_140776 ?auto_140780 ) ) ( not ( = ?auto_140776 ?auto_140775 ) ) ( not ( = ?auto_140776 ?auto_140774 ) ) ( not ( = ?auto_140779 ?auto_140780 ) ) ( not ( = ?auto_140779 ?auto_140775 ) ) ( not ( = ?auto_140779 ?auto_140774 ) ) ( not ( = ?auto_140780 ?auto_140775 ) ) ( not ( = ?auto_140780 ?auto_140774 ) ) ( not ( = ?auto_140775 ?auto_140774 ) ) ( not ( = ?auto_140773 ?auto_140775 ) ) ( not ( = ?auto_140773 ?auto_140781 ) ) ( not ( = ?auto_140773 ?auto_140776 ) ) ( not ( = ?auto_140773 ?auto_140779 ) ) ( not ( = ?auto_140773 ?auto_140780 ) ) ( not ( = ?auto_140778 ?auto_140775 ) ) ( not ( = ?auto_140778 ?auto_140781 ) ) ( not ( = ?auto_140778 ?auto_140776 ) ) ( not ( = ?auto_140778 ?auto_140779 ) ) ( not ( = ?auto_140778 ?auto_140780 ) ) ( not ( = ?auto_140777 ?auto_140775 ) ) ( not ( = ?auto_140777 ?auto_140781 ) ) ( not ( = ?auto_140777 ?auto_140776 ) ) ( not ( = ?auto_140777 ?auto_140779 ) ) ( not ( = ?auto_140777 ?auto_140780 ) ) ( ON ?auto_140774 ?auto_140777 ) ( ON ?auto_140775 ?auto_140774 ) ( ON ?auto_140780 ?auto_140775 ) ( ON ?auto_140779 ?auto_140780 ) ( ON ?auto_140776 ?auto_140779 ) ( CLEAR ?auto_140776 ) ( HOLDING ?auto_140781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140781 )
      ( MAKE-1PILE ?auto_140773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140782 - BLOCK
    )
    :vars
    (
      ?auto_140784 - BLOCK
      ?auto_140783 - BLOCK
      ?auto_140788 - BLOCK
      ?auto_140786 - BLOCK
      ?auto_140787 - BLOCK
      ?auto_140790 - BLOCK
      ?auto_140789 - BLOCK
      ?auto_140785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140782 ?auto_140784 ) ( not ( = ?auto_140782 ?auto_140784 ) ) ( not ( = ?auto_140782 ?auto_140783 ) ) ( not ( = ?auto_140782 ?auto_140788 ) ) ( not ( = ?auto_140784 ?auto_140783 ) ) ( not ( = ?auto_140784 ?auto_140788 ) ) ( not ( = ?auto_140783 ?auto_140788 ) ) ( ON ?auto_140783 ?auto_140782 ) ( ON-TABLE ?auto_140784 ) ( not ( = ?auto_140786 ?auto_140787 ) ) ( not ( = ?auto_140786 ?auto_140790 ) ) ( not ( = ?auto_140786 ?auto_140789 ) ) ( not ( = ?auto_140786 ?auto_140785 ) ) ( not ( = ?auto_140786 ?auto_140788 ) ) ( not ( = ?auto_140787 ?auto_140790 ) ) ( not ( = ?auto_140787 ?auto_140789 ) ) ( not ( = ?auto_140787 ?auto_140785 ) ) ( not ( = ?auto_140787 ?auto_140788 ) ) ( not ( = ?auto_140790 ?auto_140789 ) ) ( not ( = ?auto_140790 ?auto_140785 ) ) ( not ( = ?auto_140790 ?auto_140788 ) ) ( not ( = ?auto_140789 ?auto_140785 ) ) ( not ( = ?auto_140789 ?auto_140788 ) ) ( not ( = ?auto_140785 ?auto_140788 ) ) ( not ( = ?auto_140782 ?auto_140785 ) ) ( not ( = ?auto_140782 ?auto_140786 ) ) ( not ( = ?auto_140782 ?auto_140787 ) ) ( not ( = ?auto_140782 ?auto_140790 ) ) ( not ( = ?auto_140782 ?auto_140789 ) ) ( not ( = ?auto_140784 ?auto_140785 ) ) ( not ( = ?auto_140784 ?auto_140786 ) ) ( not ( = ?auto_140784 ?auto_140787 ) ) ( not ( = ?auto_140784 ?auto_140790 ) ) ( not ( = ?auto_140784 ?auto_140789 ) ) ( not ( = ?auto_140783 ?auto_140785 ) ) ( not ( = ?auto_140783 ?auto_140786 ) ) ( not ( = ?auto_140783 ?auto_140787 ) ) ( not ( = ?auto_140783 ?auto_140790 ) ) ( not ( = ?auto_140783 ?auto_140789 ) ) ( ON ?auto_140788 ?auto_140783 ) ( ON ?auto_140785 ?auto_140788 ) ( ON ?auto_140789 ?auto_140785 ) ( ON ?auto_140790 ?auto_140789 ) ( ON ?auto_140787 ?auto_140790 ) ( ON ?auto_140786 ?auto_140787 ) ( CLEAR ?auto_140786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140784 ?auto_140782 ?auto_140783 ?auto_140788 ?auto_140785 ?auto_140789 ?auto_140790 ?auto_140787 )
      ( MAKE-1PILE ?auto_140782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140804 - BLOCK
      ?auto_140805 - BLOCK
      ?auto_140806 - BLOCK
      ?auto_140807 - BLOCK
      ?auto_140808 - BLOCK
      ?auto_140809 - BLOCK
    )
    :vars
    (
      ?auto_140810 - BLOCK
      ?auto_140811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140810 ?auto_140809 ) ( CLEAR ?auto_140810 ) ( ON-TABLE ?auto_140804 ) ( ON ?auto_140805 ?auto_140804 ) ( ON ?auto_140806 ?auto_140805 ) ( ON ?auto_140807 ?auto_140806 ) ( ON ?auto_140808 ?auto_140807 ) ( ON ?auto_140809 ?auto_140808 ) ( not ( = ?auto_140804 ?auto_140805 ) ) ( not ( = ?auto_140804 ?auto_140806 ) ) ( not ( = ?auto_140804 ?auto_140807 ) ) ( not ( = ?auto_140804 ?auto_140808 ) ) ( not ( = ?auto_140804 ?auto_140809 ) ) ( not ( = ?auto_140804 ?auto_140810 ) ) ( not ( = ?auto_140805 ?auto_140806 ) ) ( not ( = ?auto_140805 ?auto_140807 ) ) ( not ( = ?auto_140805 ?auto_140808 ) ) ( not ( = ?auto_140805 ?auto_140809 ) ) ( not ( = ?auto_140805 ?auto_140810 ) ) ( not ( = ?auto_140806 ?auto_140807 ) ) ( not ( = ?auto_140806 ?auto_140808 ) ) ( not ( = ?auto_140806 ?auto_140809 ) ) ( not ( = ?auto_140806 ?auto_140810 ) ) ( not ( = ?auto_140807 ?auto_140808 ) ) ( not ( = ?auto_140807 ?auto_140809 ) ) ( not ( = ?auto_140807 ?auto_140810 ) ) ( not ( = ?auto_140808 ?auto_140809 ) ) ( not ( = ?auto_140808 ?auto_140810 ) ) ( not ( = ?auto_140809 ?auto_140810 ) ) ( HOLDING ?auto_140811 ) ( not ( = ?auto_140804 ?auto_140811 ) ) ( not ( = ?auto_140805 ?auto_140811 ) ) ( not ( = ?auto_140806 ?auto_140811 ) ) ( not ( = ?auto_140807 ?auto_140811 ) ) ( not ( = ?auto_140808 ?auto_140811 ) ) ( not ( = ?auto_140809 ?auto_140811 ) ) ( not ( = ?auto_140810 ?auto_140811 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_140811 )
      ( MAKE-6PILE ?auto_140804 ?auto_140805 ?auto_140806 ?auto_140807 ?auto_140808 ?auto_140809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140929 - BLOCK
      ?auto_140930 - BLOCK
    )
    :vars
    (
      ?auto_140931 - BLOCK
      ?auto_140936 - BLOCK
      ?auto_140934 - BLOCK
      ?auto_140935 - BLOCK
      ?auto_140933 - BLOCK
      ?auto_140932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140929 ?auto_140930 ) ) ( ON ?auto_140930 ?auto_140931 ) ( not ( = ?auto_140929 ?auto_140931 ) ) ( not ( = ?auto_140930 ?auto_140931 ) ) ( ON ?auto_140929 ?auto_140930 ) ( CLEAR ?auto_140929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140936 ) ( ON ?auto_140934 ?auto_140936 ) ( ON ?auto_140935 ?auto_140934 ) ( ON ?auto_140933 ?auto_140935 ) ( ON ?auto_140932 ?auto_140933 ) ( ON ?auto_140931 ?auto_140932 ) ( not ( = ?auto_140936 ?auto_140934 ) ) ( not ( = ?auto_140936 ?auto_140935 ) ) ( not ( = ?auto_140936 ?auto_140933 ) ) ( not ( = ?auto_140936 ?auto_140932 ) ) ( not ( = ?auto_140936 ?auto_140931 ) ) ( not ( = ?auto_140936 ?auto_140930 ) ) ( not ( = ?auto_140936 ?auto_140929 ) ) ( not ( = ?auto_140934 ?auto_140935 ) ) ( not ( = ?auto_140934 ?auto_140933 ) ) ( not ( = ?auto_140934 ?auto_140932 ) ) ( not ( = ?auto_140934 ?auto_140931 ) ) ( not ( = ?auto_140934 ?auto_140930 ) ) ( not ( = ?auto_140934 ?auto_140929 ) ) ( not ( = ?auto_140935 ?auto_140933 ) ) ( not ( = ?auto_140935 ?auto_140932 ) ) ( not ( = ?auto_140935 ?auto_140931 ) ) ( not ( = ?auto_140935 ?auto_140930 ) ) ( not ( = ?auto_140935 ?auto_140929 ) ) ( not ( = ?auto_140933 ?auto_140932 ) ) ( not ( = ?auto_140933 ?auto_140931 ) ) ( not ( = ?auto_140933 ?auto_140930 ) ) ( not ( = ?auto_140933 ?auto_140929 ) ) ( not ( = ?auto_140932 ?auto_140931 ) ) ( not ( = ?auto_140932 ?auto_140930 ) ) ( not ( = ?auto_140932 ?auto_140929 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140936 ?auto_140934 ?auto_140935 ?auto_140933 ?auto_140932 ?auto_140931 ?auto_140930 )
      ( MAKE-2PILE ?auto_140929 ?auto_140930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140939 - BLOCK
      ?auto_140940 - BLOCK
    )
    :vars
    (
      ?auto_140941 - BLOCK
      ?auto_140942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140939 ?auto_140940 ) ) ( ON ?auto_140940 ?auto_140941 ) ( CLEAR ?auto_140940 ) ( not ( = ?auto_140939 ?auto_140941 ) ) ( not ( = ?auto_140940 ?auto_140941 ) ) ( ON ?auto_140939 ?auto_140942 ) ( CLEAR ?auto_140939 ) ( HAND-EMPTY ) ( not ( = ?auto_140939 ?auto_140942 ) ) ( not ( = ?auto_140940 ?auto_140942 ) ) ( not ( = ?auto_140941 ?auto_140942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140939 ?auto_140942 )
      ( MAKE-2PILE ?auto_140939 ?auto_140940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140943 - BLOCK
      ?auto_140944 - BLOCK
    )
    :vars
    (
      ?auto_140945 - BLOCK
      ?auto_140946 - BLOCK
      ?auto_140950 - BLOCK
      ?auto_140948 - BLOCK
      ?auto_140951 - BLOCK
      ?auto_140949 - BLOCK
      ?auto_140947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140943 ?auto_140944 ) ) ( not ( = ?auto_140943 ?auto_140945 ) ) ( not ( = ?auto_140944 ?auto_140945 ) ) ( ON ?auto_140943 ?auto_140946 ) ( CLEAR ?auto_140943 ) ( not ( = ?auto_140943 ?auto_140946 ) ) ( not ( = ?auto_140944 ?auto_140946 ) ) ( not ( = ?auto_140945 ?auto_140946 ) ) ( HOLDING ?auto_140944 ) ( CLEAR ?auto_140945 ) ( ON-TABLE ?auto_140950 ) ( ON ?auto_140948 ?auto_140950 ) ( ON ?auto_140951 ?auto_140948 ) ( ON ?auto_140949 ?auto_140951 ) ( ON ?auto_140947 ?auto_140949 ) ( ON ?auto_140945 ?auto_140947 ) ( not ( = ?auto_140950 ?auto_140948 ) ) ( not ( = ?auto_140950 ?auto_140951 ) ) ( not ( = ?auto_140950 ?auto_140949 ) ) ( not ( = ?auto_140950 ?auto_140947 ) ) ( not ( = ?auto_140950 ?auto_140945 ) ) ( not ( = ?auto_140950 ?auto_140944 ) ) ( not ( = ?auto_140948 ?auto_140951 ) ) ( not ( = ?auto_140948 ?auto_140949 ) ) ( not ( = ?auto_140948 ?auto_140947 ) ) ( not ( = ?auto_140948 ?auto_140945 ) ) ( not ( = ?auto_140948 ?auto_140944 ) ) ( not ( = ?auto_140951 ?auto_140949 ) ) ( not ( = ?auto_140951 ?auto_140947 ) ) ( not ( = ?auto_140951 ?auto_140945 ) ) ( not ( = ?auto_140951 ?auto_140944 ) ) ( not ( = ?auto_140949 ?auto_140947 ) ) ( not ( = ?auto_140949 ?auto_140945 ) ) ( not ( = ?auto_140949 ?auto_140944 ) ) ( not ( = ?auto_140947 ?auto_140945 ) ) ( not ( = ?auto_140947 ?auto_140944 ) ) ( not ( = ?auto_140943 ?auto_140950 ) ) ( not ( = ?auto_140943 ?auto_140948 ) ) ( not ( = ?auto_140943 ?auto_140951 ) ) ( not ( = ?auto_140943 ?auto_140949 ) ) ( not ( = ?auto_140943 ?auto_140947 ) ) ( not ( = ?auto_140946 ?auto_140950 ) ) ( not ( = ?auto_140946 ?auto_140948 ) ) ( not ( = ?auto_140946 ?auto_140951 ) ) ( not ( = ?auto_140946 ?auto_140949 ) ) ( not ( = ?auto_140946 ?auto_140947 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140950 ?auto_140948 ?auto_140951 ?auto_140949 ?auto_140947 ?auto_140945 ?auto_140944 )
      ( MAKE-2PILE ?auto_140943 ?auto_140944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140952 - BLOCK
      ?auto_140953 - BLOCK
    )
    :vars
    (
      ?auto_140954 - BLOCK
      ?auto_140955 - BLOCK
      ?auto_140957 - BLOCK
      ?auto_140959 - BLOCK
      ?auto_140958 - BLOCK
      ?auto_140960 - BLOCK
      ?auto_140956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140952 ?auto_140953 ) ) ( not ( = ?auto_140952 ?auto_140954 ) ) ( not ( = ?auto_140953 ?auto_140954 ) ) ( ON ?auto_140952 ?auto_140955 ) ( not ( = ?auto_140952 ?auto_140955 ) ) ( not ( = ?auto_140953 ?auto_140955 ) ) ( not ( = ?auto_140954 ?auto_140955 ) ) ( CLEAR ?auto_140954 ) ( ON-TABLE ?auto_140957 ) ( ON ?auto_140959 ?auto_140957 ) ( ON ?auto_140958 ?auto_140959 ) ( ON ?auto_140960 ?auto_140958 ) ( ON ?auto_140956 ?auto_140960 ) ( ON ?auto_140954 ?auto_140956 ) ( not ( = ?auto_140957 ?auto_140959 ) ) ( not ( = ?auto_140957 ?auto_140958 ) ) ( not ( = ?auto_140957 ?auto_140960 ) ) ( not ( = ?auto_140957 ?auto_140956 ) ) ( not ( = ?auto_140957 ?auto_140954 ) ) ( not ( = ?auto_140957 ?auto_140953 ) ) ( not ( = ?auto_140959 ?auto_140958 ) ) ( not ( = ?auto_140959 ?auto_140960 ) ) ( not ( = ?auto_140959 ?auto_140956 ) ) ( not ( = ?auto_140959 ?auto_140954 ) ) ( not ( = ?auto_140959 ?auto_140953 ) ) ( not ( = ?auto_140958 ?auto_140960 ) ) ( not ( = ?auto_140958 ?auto_140956 ) ) ( not ( = ?auto_140958 ?auto_140954 ) ) ( not ( = ?auto_140958 ?auto_140953 ) ) ( not ( = ?auto_140960 ?auto_140956 ) ) ( not ( = ?auto_140960 ?auto_140954 ) ) ( not ( = ?auto_140960 ?auto_140953 ) ) ( not ( = ?auto_140956 ?auto_140954 ) ) ( not ( = ?auto_140956 ?auto_140953 ) ) ( not ( = ?auto_140952 ?auto_140957 ) ) ( not ( = ?auto_140952 ?auto_140959 ) ) ( not ( = ?auto_140952 ?auto_140958 ) ) ( not ( = ?auto_140952 ?auto_140960 ) ) ( not ( = ?auto_140952 ?auto_140956 ) ) ( not ( = ?auto_140955 ?auto_140957 ) ) ( not ( = ?auto_140955 ?auto_140959 ) ) ( not ( = ?auto_140955 ?auto_140958 ) ) ( not ( = ?auto_140955 ?auto_140960 ) ) ( not ( = ?auto_140955 ?auto_140956 ) ) ( ON ?auto_140953 ?auto_140952 ) ( CLEAR ?auto_140953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140955 ?auto_140952 )
      ( MAKE-2PILE ?auto_140952 ?auto_140953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140961 - BLOCK
      ?auto_140962 - BLOCK
    )
    :vars
    (
      ?auto_140967 - BLOCK
      ?auto_140965 - BLOCK
      ?auto_140966 - BLOCK
      ?auto_140969 - BLOCK
      ?auto_140968 - BLOCK
      ?auto_140964 - BLOCK
      ?auto_140963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140961 ?auto_140962 ) ) ( not ( = ?auto_140961 ?auto_140967 ) ) ( not ( = ?auto_140962 ?auto_140967 ) ) ( ON ?auto_140961 ?auto_140965 ) ( not ( = ?auto_140961 ?auto_140965 ) ) ( not ( = ?auto_140962 ?auto_140965 ) ) ( not ( = ?auto_140967 ?auto_140965 ) ) ( ON-TABLE ?auto_140966 ) ( ON ?auto_140969 ?auto_140966 ) ( ON ?auto_140968 ?auto_140969 ) ( ON ?auto_140964 ?auto_140968 ) ( ON ?auto_140963 ?auto_140964 ) ( not ( = ?auto_140966 ?auto_140969 ) ) ( not ( = ?auto_140966 ?auto_140968 ) ) ( not ( = ?auto_140966 ?auto_140964 ) ) ( not ( = ?auto_140966 ?auto_140963 ) ) ( not ( = ?auto_140966 ?auto_140967 ) ) ( not ( = ?auto_140966 ?auto_140962 ) ) ( not ( = ?auto_140969 ?auto_140968 ) ) ( not ( = ?auto_140969 ?auto_140964 ) ) ( not ( = ?auto_140969 ?auto_140963 ) ) ( not ( = ?auto_140969 ?auto_140967 ) ) ( not ( = ?auto_140969 ?auto_140962 ) ) ( not ( = ?auto_140968 ?auto_140964 ) ) ( not ( = ?auto_140968 ?auto_140963 ) ) ( not ( = ?auto_140968 ?auto_140967 ) ) ( not ( = ?auto_140968 ?auto_140962 ) ) ( not ( = ?auto_140964 ?auto_140963 ) ) ( not ( = ?auto_140964 ?auto_140967 ) ) ( not ( = ?auto_140964 ?auto_140962 ) ) ( not ( = ?auto_140963 ?auto_140967 ) ) ( not ( = ?auto_140963 ?auto_140962 ) ) ( not ( = ?auto_140961 ?auto_140966 ) ) ( not ( = ?auto_140961 ?auto_140969 ) ) ( not ( = ?auto_140961 ?auto_140968 ) ) ( not ( = ?auto_140961 ?auto_140964 ) ) ( not ( = ?auto_140961 ?auto_140963 ) ) ( not ( = ?auto_140965 ?auto_140966 ) ) ( not ( = ?auto_140965 ?auto_140969 ) ) ( not ( = ?auto_140965 ?auto_140968 ) ) ( not ( = ?auto_140965 ?auto_140964 ) ) ( not ( = ?auto_140965 ?auto_140963 ) ) ( ON ?auto_140962 ?auto_140961 ) ( CLEAR ?auto_140962 ) ( ON-TABLE ?auto_140965 ) ( HOLDING ?auto_140967 ) ( CLEAR ?auto_140963 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140966 ?auto_140969 ?auto_140968 ?auto_140964 ?auto_140963 ?auto_140967 )
      ( MAKE-2PILE ?auto_140961 ?auto_140962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140970 - BLOCK
      ?auto_140971 - BLOCK
    )
    :vars
    (
      ?auto_140976 - BLOCK
      ?auto_140978 - BLOCK
      ?auto_140974 - BLOCK
      ?auto_140972 - BLOCK
      ?auto_140973 - BLOCK
      ?auto_140977 - BLOCK
      ?auto_140975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140970 ?auto_140971 ) ) ( not ( = ?auto_140970 ?auto_140976 ) ) ( not ( = ?auto_140971 ?auto_140976 ) ) ( ON ?auto_140970 ?auto_140978 ) ( not ( = ?auto_140970 ?auto_140978 ) ) ( not ( = ?auto_140971 ?auto_140978 ) ) ( not ( = ?auto_140976 ?auto_140978 ) ) ( ON-TABLE ?auto_140974 ) ( ON ?auto_140972 ?auto_140974 ) ( ON ?auto_140973 ?auto_140972 ) ( ON ?auto_140977 ?auto_140973 ) ( ON ?auto_140975 ?auto_140977 ) ( not ( = ?auto_140974 ?auto_140972 ) ) ( not ( = ?auto_140974 ?auto_140973 ) ) ( not ( = ?auto_140974 ?auto_140977 ) ) ( not ( = ?auto_140974 ?auto_140975 ) ) ( not ( = ?auto_140974 ?auto_140976 ) ) ( not ( = ?auto_140974 ?auto_140971 ) ) ( not ( = ?auto_140972 ?auto_140973 ) ) ( not ( = ?auto_140972 ?auto_140977 ) ) ( not ( = ?auto_140972 ?auto_140975 ) ) ( not ( = ?auto_140972 ?auto_140976 ) ) ( not ( = ?auto_140972 ?auto_140971 ) ) ( not ( = ?auto_140973 ?auto_140977 ) ) ( not ( = ?auto_140973 ?auto_140975 ) ) ( not ( = ?auto_140973 ?auto_140976 ) ) ( not ( = ?auto_140973 ?auto_140971 ) ) ( not ( = ?auto_140977 ?auto_140975 ) ) ( not ( = ?auto_140977 ?auto_140976 ) ) ( not ( = ?auto_140977 ?auto_140971 ) ) ( not ( = ?auto_140975 ?auto_140976 ) ) ( not ( = ?auto_140975 ?auto_140971 ) ) ( not ( = ?auto_140970 ?auto_140974 ) ) ( not ( = ?auto_140970 ?auto_140972 ) ) ( not ( = ?auto_140970 ?auto_140973 ) ) ( not ( = ?auto_140970 ?auto_140977 ) ) ( not ( = ?auto_140970 ?auto_140975 ) ) ( not ( = ?auto_140978 ?auto_140974 ) ) ( not ( = ?auto_140978 ?auto_140972 ) ) ( not ( = ?auto_140978 ?auto_140973 ) ) ( not ( = ?auto_140978 ?auto_140977 ) ) ( not ( = ?auto_140978 ?auto_140975 ) ) ( ON ?auto_140971 ?auto_140970 ) ( ON-TABLE ?auto_140978 ) ( CLEAR ?auto_140975 ) ( ON ?auto_140976 ?auto_140971 ) ( CLEAR ?auto_140976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140978 ?auto_140970 ?auto_140971 )
      ( MAKE-2PILE ?auto_140970 ?auto_140971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140979 - BLOCK
      ?auto_140980 - BLOCK
    )
    :vars
    (
      ?auto_140982 - BLOCK
      ?auto_140985 - BLOCK
      ?auto_140987 - BLOCK
      ?auto_140986 - BLOCK
      ?auto_140981 - BLOCK
      ?auto_140983 - BLOCK
      ?auto_140984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140979 ?auto_140980 ) ) ( not ( = ?auto_140979 ?auto_140982 ) ) ( not ( = ?auto_140980 ?auto_140982 ) ) ( ON ?auto_140979 ?auto_140985 ) ( not ( = ?auto_140979 ?auto_140985 ) ) ( not ( = ?auto_140980 ?auto_140985 ) ) ( not ( = ?auto_140982 ?auto_140985 ) ) ( ON-TABLE ?auto_140987 ) ( ON ?auto_140986 ?auto_140987 ) ( ON ?auto_140981 ?auto_140986 ) ( ON ?auto_140983 ?auto_140981 ) ( not ( = ?auto_140987 ?auto_140986 ) ) ( not ( = ?auto_140987 ?auto_140981 ) ) ( not ( = ?auto_140987 ?auto_140983 ) ) ( not ( = ?auto_140987 ?auto_140984 ) ) ( not ( = ?auto_140987 ?auto_140982 ) ) ( not ( = ?auto_140987 ?auto_140980 ) ) ( not ( = ?auto_140986 ?auto_140981 ) ) ( not ( = ?auto_140986 ?auto_140983 ) ) ( not ( = ?auto_140986 ?auto_140984 ) ) ( not ( = ?auto_140986 ?auto_140982 ) ) ( not ( = ?auto_140986 ?auto_140980 ) ) ( not ( = ?auto_140981 ?auto_140983 ) ) ( not ( = ?auto_140981 ?auto_140984 ) ) ( not ( = ?auto_140981 ?auto_140982 ) ) ( not ( = ?auto_140981 ?auto_140980 ) ) ( not ( = ?auto_140983 ?auto_140984 ) ) ( not ( = ?auto_140983 ?auto_140982 ) ) ( not ( = ?auto_140983 ?auto_140980 ) ) ( not ( = ?auto_140984 ?auto_140982 ) ) ( not ( = ?auto_140984 ?auto_140980 ) ) ( not ( = ?auto_140979 ?auto_140987 ) ) ( not ( = ?auto_140979 ?auto_140986 ) ) ( not ( = ?auto_140979 ?auto_140981 ) ) ( not ( = ?auto_140979 ?auto_140983 ) ) ( not ( = ?auto_140979 ?auto_140984 ) ) ( not ( = ?auto_140985 ?auto_140987 ) ) ( not ( = ?auto_140985 ?auto_140986 ) ) ( not ( = ?auto_140985 ?auto_140981 ) ) ( not ( = ?auto_140985 ?auto_140983 ) ) ( not ( = ?auto_140985 ?auto_140984 ) ) ( ON ?auto_140980 ?auto_140979 ) ( ON-TABLE ?auto_140985 ) ( ON ?auto_140982 ?auto_140980 ) ( CLEAR ?auto_140982 ) ( HOLDING ?auto_140984 ) ( CLEAR ?auto_140983 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140987 ?auto_140986 ?auto_140981 ?auto_140983 ?auto_140984 )
      ( MAKE-2PILE ?auto_140979 ?auto_140980 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140988 - BLOCK
      ?auto_140989 - BLOCK
    )
    :vars
    (
      ?auto_140996 - BLOCK
      ?auto_140995 - BLOCK
      ?auto_140993 - BLOCK
      ?auto_140991 - BLOCK
      ?auto_140990 - BLOCK
      ?auto_140992 - BLOCK
      ?auto_140994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140988 ?auto_140989 ) ) ( not ( = ?auto_140988 ?auto_140996 ) ) ( not ( = ?auto_140989 ?auto_140996 ) ) ( ON ?auto_140988 ?auto_140995 ) ( not ( = ?auto_140988 ?auto_140995 ) ) ( not ( = ?auto_140989 ?auto_140995 ) ) ( not ( = ?auto_140996 ?auto_140995 ) ) ( ON-TABLE ?auto_140993 ) ( ON ?auto_140991 ?auto_140993 ) ( ON ?auto_140990 ?auto_140991 ) ( ON ?auto_140992 ?auto_140990 ) ( not ( = ?auto_140993 ?auto_140991 ) ) ( not ( = ?auto_140993 ?auto_140990 ) ) ( not ( = ?auto_140993 ?auto_140992 ) ) ( not ( = ?auto_140993 ?auto_140994 ) ) ( not ( = ?auto_140993 ?auto_140996 ) ) ( not ( = ?auto_140993 ?auto_140989 ) ) ( not ( = ?auto_140991 ?auto_140990 ) ) ( not ( = ?auto_140991 ?auto_140992 ) ) ( not ( = ?auto_140991 ?auto_140994 ) ) ( not ( = ?auto_140991 ?auto_140996 ) ) ( not ( = ?auto_140991 ?auto_140989 ) ) ( not ( = ?auto_140990 ?auto_140992 ) ) ( not ( = ?auto_140990 ?auto_140994 ) ) ( not ( = ?auto_140990 ?auto_140996 ) ) ( not ( = ?auto_140990 ?auto_140989 ) ) ( not ( = ?auto_140992 ?auto_140994 ) ) ( not ( = ?auto_140992 ?auto_140996 ) ) ( not ( = ?auto_140992 ?auto_140989 ) ) ( not ( = ?auto_140994 ?auto_140996 ) ) ( not ( = ?auto_140994 ?auto_140989 ) ) ( not ( = ?auto_140988 ?auto_140993 ) ) ( not ( = ?auto_140988 ?auto_140991 ) ) ( not ( = ?auto_140988 ?auto_140990 ) ) ( not ( = ?auto_140988 ?auto_140992 ) ) ( not ( = ?auto_140988 ?auto_140994 ) ) ( not ( = ?auto_140995 ?auto_140993 ) ) ( not ( = ?auto_140995 ?auto_140991 ) ) ( not ( = ?auto_140995 ?auto_140990 ) ) ( not ( = ?auto_140995 ?auto_140992 ) ) ( not ( = ?auto_140995 ?auto_140994 ) ) ( ON ?auto_140989 ?auto_140988 ) ( ON-TABLE ?auto_140995 ) ( ON ?auto_140996 ?auto_140989 ) ( CLEAR ?auto_140992 ) ( ON ?auto_140994 ?auto_140996 ) ( CLEAR ?auto_140994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140995 ?auto_140988 ?auto_140989 ?auto_140996 )
      ( MAKE-2PILE ?auto_140988 ?auto_140989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140997 - BLOCK
      ?auto_140998 - BLOCK
    )
    :vars
    (
      ?auto_141005 - BLOCK
      ?auto_141000 - BLOCK
      ?auto_141001 - BLOCK
      ?auto_140999 - BLOCK
      ?auto_141003 - BLOCK
      ?auto_141004 - BLOCK
      ?auto_141002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140997 ?auto_140998 ) ) ( not ( = ?auto_140997 ?auto_141005 ) ) ( not ( = ?auto_140998 ?auto_141005 ) ) ( ON ?auto_140997 ?auto_141000 ) ( not ( = ?auto_140997 ?auto_141000 ) ) ( not ( = ?auto_140998 ?auto_141000 ) ) ( not ( = ?auto_141005 ?auto_141000 ) ) ( ON-TABLE ?auto_141001 ) ( ON ?auto_140999 ?auto_141001 ) ( ON ?auto_141003 ?auto_140999 ) ( not ( = ?auto_141001 ?auto_140999 ) ) ( not ( = ?auto_141001 ?auto_141003 ) ) ( not ( = ?auto_141001 ?auto_141004 ) ) ( not ( = ?auto_141001 ?auto_141002 ) ) ( not ( = ?auto_141001 ?auto_141005 ) ) ( not ( = ?auto_141001 ?auto_140998 ) ) ( not ( = ?auto_140999 ?auto_141003 ) ) ( not ( = ?auto_140999 ?auto_141004 ) ) ( not ( = ?auto_140999 ?auto_141002 ) ) ( not ( = ?auto_140999 ?auto_141005 ) ) ( not ( = ?auto_140999 ?auto_140998 ) ) ( not ( = ?auto_141003 ?auto_141004 ) ) ( not ( = ?auto_141003 ?auto_141002 ) ) ( not ( = ?auto_141003 ?auto_141005 ) ) ( not ( = ?auto_141003 ?auto_140998 ) ) ( not ( = ?auto_141004 ?auto_141002 ) ) ( not ( = ?auto_141004 ?auto_141005 ) ) ( not ( = ?auto_141004 ?auto_140998 ) ) ( not ( = ?auto_141002 ?auto_141005 ) ) ( not ( = ?auto_141002 ?auto_140998 ) ) ( not ( = ?auto_140997 ?auto_141001 ) ) ( not ( = ?auto_140997 ?auto_140999 ) ) ( not ( = ?auto_140997 ?auto_141003 ) ) ( not ( = ?auto_140997 ?auto_141004 ) ) ( not ( = ?auto_140997 ?auto_141002 ) ) ( not ( = ?auto_141000 ?auto_141001 ) ) ( not ( = ?auto_141000 ?auto_140999 ) ) ( not ( = ?auto_141000 ?auto_141003 ) ) ( not ( = ?auto_141000 ?auto_141004 ) ) ( not ( = ?auto_141000 ?auto_141002 ) ) ( ON ?auto_140998 ?auto_140997 ) ( ON-TABLE ?auto_141000 ) ( ON ?auto_141005 ?auto_140998 ) ( ON ?auto_141002 ?auto_141005 ) ( CLEAR ?auto_141002 ) ( HOLDING ?auto_141004 ) ( CLEAR ?auto_141003 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141001 ?auto_140999 ?auto_141003 ?auto_141004 )
      ( MAKE-2PILE ?auto_140997 ?auto_140998 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141006 - BLOCK
      ?auto_141007 - BLOCK
    )
    :vars
    (
      ?auto_141011 - BLOCK
      ?auto_141013 - BLOCK
      ?auto_141009 - BLOCK
      ?auto_141010 - BLOCK
      ?auto_141008 - BLOCK
      ?auto_141014 - BLOCK
      ?auto_141012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141006 ?auto_141007 ) ) ( not ( = ?auto_141006 ?auto_141011 ) ) ( not ( = ?auto_141007 ?auto_141011 ) ) ( ON ?auto_141006 ?auto_141013 ) ( not ( = ?auto_141006 ?auto_141013 ) ) ( not ( = ?auto_141007 ?auto_141013 ) ) ( not ( = ?auto_141011 ?auto_141013 ) ) ( ON-TABLE ?auto_141009 ) ( ON ?auto_141010 ?auto_141009 ) ( ON ?auto_141008 ?auto_141010 ) ( not ( = ?auto_141009 ?auto_141010 ) ) ( not ( = ?auto_141009 ?auto_141008 ) ) ( not ( = ?auto_141009 ?auto_141014 ) ) ( not ( = ?auto_141009 ?auto_141012 ) ) ( not ( = ?auto_141009 ?auto_141011 ) ) ( not ( = ?auto_141009 ?auto_141007 ) ) ( not ( = ?auto_141010 ?auto_141008 ) ) ( not ( = ?auto_141010 ?auto_141014 ) ) ( not ( = ?auto_141010 ?auto_141012 ) ) ( not ( = ?auto_141010 ?auto_141011 ) ) ( not ( = ?auto_141010 ?auto_141007 ) ) ( not ( = ?auto_141008 ?auto_141014 ) ) ( not ( = ?auto_141008 ?auto_141012 ) ) ( not ( = ?auto_141008 ?auto_141011 ) ) ( not ( = ?auto_141008 ?auto_141007 ) ) ( not ( = ?auto_141014 ?auto_141012 ) ) ( not ( = ?auto_141014 ?auto_141011 ) ) ( not ( = ?auto_141014 ?auto_141007 ) ) ( not ( = ?auto_141012 ?auto_141011 ) ) ( not ( = ?auto_141012 ?auto_141007 ) ) ( not ( = ?auto_141006 ?auto_141009 ) ) ( not ( = ?auto_141006 ?auto_141010 ) ) ( not ( = ?auto_141006 ?auto_141008 ) ) ( not ( = ?auto_141006 ?auto_141014 ) ) ( not ( = ?auto_141006 ?auto_141012 ) ) ( not ( = ?auto_141013 ?auto_141009 ) ) ( not ( = ?auto_141013 ?auto_141010 ) ) ( not ( = ?auto_141013 ?auto_141008 ) ) ( not ( = ?auto_141013 ?auto_141014 ) ) ( not ( = ?auto_141013 ?auto_141012 ) ) ( ON ?auto_141007 ?auto_141006 ) ( ON-TABLE ?auto_141013 ) ( ON ?auto_141011 ?auto_141007 ) ( ON ?auto_141012 ?auto_141011 ) ( CLEAR ?auto_141008 ) ( ON ?auto_141014 ?auto_141012 ) ( CLEAR ?auto_141014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141013 ?auto_141006 ?auto_141007 ?auto_141011 ?auto_141012 )
      ( MAKE-2PILE ?auto_141006 ?auto_141007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141015 - BLOCK
      ?auto_141016 - BLOCK
    )
    :vars
    (
      ?auto_141022 - BLOCK
      ?auto_141019 - BLOCK
      ?auto_141017 - BLOCK
      ?auto_141018 - BLOCK
      ?auto_141020 - BLOCK
      ?auto_141023 - BLOCK
      ?auto_141021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141015 ?auto_141016 ) ) ( not ( = ?auto_141015 ?auto_141022 ) ) ( not ( = ?auto_141016 ?auto_141022 ) ) ( ON ?auto_141015 ?auto_141019 ) ( not ( = ?auto_141015 ?auto_141019 ) ) ( not ( = ?auto_141016 ?auto_141019 ) ) ( not ( = ?auto_141022 ?auto_141019 ) ) ( ON-TABLE ?auto_141017 ) ( ON ?auto_141018 ?auto_141017 ) ( not ( = ?auto_141017 ?auto_141018 ) ) ( not ( = ?auto_141017 ?auto_141020 ) ) ( not ( = ?auto_141017 ?auto_141023 ) ) ( not ( = ?auto_141017 ?auto_141021 ) ) ( not ( = ?auto_141017 ?auto_141022 ) ) ( not ( = ?auto_141017 ?auto_141016 ) ) ( not ( = ?auto_141018 ?auto_141020 ) ) ( not ( = ?auto_141018 ?auto_141023 ) ) ( not ( = ?auto_141018 ?auto_141021 ) ) ( not ( = ?auto_141018 ?auto_141022 ) ) ( not ( = ?auto_141018 ?auto_141016 ) ) ( not ( = ?auto_141020 ?auto_141023 ) ) ( not ( = ?auto_141020 ?auto_141021 ) ) ( not ( = ?auto_141020 ?auto_141022 ) ) ( not ( = ?auto_141020 ?auto_141016 ) ) ( not ( = ?auto_141023 ?auto_141021 ) ) ( not ( = ?auto_141023 ?auto_141022 ) ) ( not ( = ?auto_141023 ?auto_141016 ) ) ( not ( = ?auto_141021 ?auto_141022 ) ) ( not ( = ?auto_141021 ?auto_141016 ) ) ( not ( = ?auto_141015 ?auto_141017 ) ) ( not ( = ?auto_141015 ?auto_141018 ) ) ( not ( = ?auto_141015 ?auto_141020 ) ) ( not ( = ?auto_141015 ?auto_141023 ) ) ( not ( = ?auto_141015 ?auto_141021 ) ) ( not ( = ?auto_141019 ?auto_141017 ) ) ( not ( = ?auto_141019 ?auto_141018 ) ) ( not ( = ?auto_141019 ?auto_141020 ) ) ( not ( = ?auto_141019 ?auto_141023 ) ) ( not ( = ?auto_141019 ?auto_141021 ) ) ( ON ?auto_141016 ?auto_141015 ) ( ON-TABLE ?auto_141019 ) ( ON ?auto_141022 ?auto_141016 ) ( ON ?auto_141021 ?auto_141022 ) ( ON ?auto_141023 ?auto_141021 ) ( CLEAR ?auto_141023 ) ( HOLDING ?auto_141020 ) ( CLEAR ?auto_141018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141017 ?auto_141018 ?auto_141020 )
      ( MAKE-2PILE ?auto_141015 ?auto_141016 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141024 - BLOCK
      ?auto_141025 - BLOCK
    )
    :vars
    (
      ?auto_141027 - BLOCK
      ?auto_141032 - BLOCK
      ?auto_141031 - BLOCK
      ?auto_141029 - BLOCK
      ?auto_141026 - BLOCK
      ?auto_141030 - BLOCK
      ?auto_141028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141024 ?auto_141025 ) ) ( not ( = ?auto_141024 ?auto_141027 ) ) ( not ( = ?auto_141025 ?auto_141027 ) ) ( ON ?auto_141024 ?auto_141032 ) ( not ( = ?auto_141024 ?auto_141032 ) ) ( not ( = ?auto_141025 ?auto_141032 ) ) ( not ( = ?auto_141027 ?auto_141032 ) ) ( ON-TABLE ?auto_141031 ) ( ON ?auto_141029 ?auto_141031 ) ( not ( = ?auto_141031 ?auto_141029 ) ) ( not ( = ?auto_141031 ?auto_141026 ) ) ( not ( = ?auto_141031 ?auto_141030 ) ) ( not ( = ?auto_141031 ?auto_141028 ) ) ( not ( = ?auto_141031 ?auto_141027 ) ) ( not ( = ?auto_141031 ?auto_141025 ) ) ( not ( = ?auto_141029 ?auto_141026 ) ) ( not ( = ?auto_141029 ?auto_141030 ) ) ( not ( = ?auto_141029 ?auto_141028 ) ) ( not ( = ?auto_141029 ?auto_141027 ) ) ( not ( = ?auto_141029 ?auto_141025 ) ) ( not ( = ?auto_141026 ?auto_141030 ) ) ( not ( = ?auto_141026 ?auto_141028 ) ) ( not ( = ?auto_141026 ?auto_141027 ) ) ( not ( = ?auto_141026 ?auto_141025 ) ) ( not ( = ?auto_141030 ?auto_141028 ) ) ( not ( = ?auto_141030 ?auto_141027 ) ) ( not ( = ?auto_141030 ?auto_141025 ) ) ( not ( = ?auto_141028 ?auto_141027 ) ) ( not ( = ?auto_141028 ?auto_141025 ) ) ( not ( = ?auto_141024 ?auto_141031 ) ) ( not ( = ?auto_141024 ?auto_141029 ) ) ( not ( = ?auto_141024 ?auto_141026 ) ) ( not ( = ?auto_141024 ?auto_141030 ) ) ( not ( = ?auto_141024 ?auto_141028 ) ) ( not ( = ?auto_141032 ?auto_141031 ) ) ( not ( = ?auto_141032 ?auto_141029 ) ) ( not ( = ?auto_141032 ?auto_141026 ) ) ( not ( = ?auto_141032 ?auto_141030 ) ) ( not ( = ?auto_141032 ?auto_141028 ) ) ( ON ?auto_141025 ?auto_141024 ) ( ON-TABLE ?auto_141032 ) ( ON ?auto_141027 ?auto_141025 ) ( ON ?auto_141028 ?auto_141027 ) ( ON ?auto_141030 ?auto_141028 ) ( CLEAR ?auto_141029 ) ( ON ?auto_141026 ?auto_141030 ) ( CLEAR ?auto_141026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141032 ?auto_141024 ?auto_141025 ?auto_141027 ?auto_141028 ?auto_141030 )
      ( MAKE-2PILE ?auto_141024 ?auto_141025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141033 - BLOCK
      ?auto_141034 - BLOCK
    )
    :vars
    (
      ?auto_141037 - BLOCK
      ?auto_141038 - BLOCK
      ?auto_141040 - BLOCK
      ?auto_141039 - BLOCK
      ?auto_141041 - BLOCK
      ?auto_141036 - BLOCK
      ?auto_141035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141033 ?auto_141034 ) ) ( not ( = ?auto_141033 ?auto_141037 ) ) ( not ( = ?auto_141034 ?auto_141037 ) ) ( ON ?auto_141033 ?auto_141038 ) ( not ( = ?auto_141033 ?auto_141038 ) ) ( not ( = ?auto_141034 ?auto_141038 ) ) ( not ( = ?auto_141037 ?auto_141038 ) ) ( ON-TABLE ?auto_141040 ) ( not ( = ?auto_141040 ?auto_141039 ) ) ( not ( = ?auto_141040 ?auto_141041 ) ) ( not ( = ?auto_141040 ?auto_141036 ) ) ( not ( = ?auto_141040 ?auto_141035 ) ) ( not ( = ?auto_141040 ?auto_141037 ) ) ( not ( = ?auto_141040 ?auto_141034 ) ) ( not ( = ?auto_141039 ?auto_141041 ) ) ( not ( = ?auto_141039 ?auto_141036 ) ) ( not ( = ?auto_141039 ?auto_141035 ) ) ( not ( = ?auto_141039 ?auto_141037 ) ) ( not ( = ?auto_141039 ?auto_141034 ) ) ( not ( = ?auto_141041 ?auto_141036 ) ) ( not ( = ?auto_141041 ?auto_141035 ) ) ( not ( = ?auto_141041 ?auto_141037 ) ) ( not ( = ?auto_141041 ?auto_141034 ) ) ( not ( = ?auto_141036 ?auto_141035 ) ) ( not ( = ?auto_141036 ?auto_141037 ) ) ( not ( = ?auto_141036 ?auto_141034 ) ) ( not ( = ?auto_141035 ?auto_141037 ) ) ( not ( = ?auto_141035 ?auto_141034 ) ) ( not ( = ?auto_141033 ?auto_141040 ) ) ( not ( = ?auto_141033 ?auto_141039 ) ) ( not ( = ?auto_141033 ?auto_141041 ) ) ( not ( = ?auto_141033 ?auto_141036 ) ) ( not ( = ?auto_141033 ?auto_141035 ) ) ( not ( = ?auto_141038 ?auto_141040 ) ) ( not ( = ?auto_141038 ?auto_141039 ) ) ( not ( = ?auto_141038 ?auto_141041 ) ) ( not ( = ?auto_141038 ?auto_141036 ) ) ( not ( = ?auto_141038 ?auto_141035 ) ) ( ON ?auto_141034 ?auto_141033 ) ( ON-TABLE ?auto_141038 ) ( ON ?auto_141037 ?auto_141034 ) ( ON ?auto_141035 ?auto_141037 ) ( ON ?auto_141036 ?auto_141035 ) ( ON ?auto_141041 ?auto_141036 ) ( CLEAR ?auto_141041 ) ( HOLDING ?auto_141039 ) ( CLEAR ?auto_141040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141040 ?auto_141039 )
      ( MAKE-2PILE ?auto_141033 ?auto_141034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141042 - BLOCK
      ?auto_141043 - BLOCK
    )
    :vars
    (
      ?auto_141047 - BLOCK
      ?auto_141049 - BLOCK
      ?auto_141045 - BLOCK
      ?auto_141048 - BLOCK
      ?auto_141044 - BLOCK
      ?auto_141046 - BLOCK
      ?auto_141050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141042 ?auto_141043 ) ) ( not ( = ?auto_141042 ?auto_141047 ) ) ( not ( = ?auto_141043 ?auto_141047 ) ) ( ON ?auto_141042 ?auto_141049 ) ( not ( = ?auto_141042 ?auto_141049 ) ) ( not ( = ?auto_141043 ?auto_141049 ) ) ( not ( = ?auto_141047 ?auto_141049 ) ) ( ON-TABLE ?auto_141045 ) ( not ( = ?auto_141045 ?auto_141048 ) ) ( not ( = ?auto_141045 ?auto_141044 ) ) ( not ( = ?auto_141045 ?auto_141046 ) ) ( not ( = ?auto_141045 ?auto_141050 ) ) ( not ( = ?auto_141045 ?auto_141047 ) ) ( not ( = ?auto_141045 ?auto_141043 ) ) ( not ( = ?auto_141048 ?auto_141044 ) ) ( not ( = ?auto_141048 ?auto_141046 ) ) ( not ( = ?auto_141048 ?auto_141050 ) ) ( not ( = ?auto_141048 ?auto_141047 ) ) ( not ( = ?auto_141048 ?auto_141043 ) ) ( not ( = ?auto_141044 ?auto_141046 ) ) ( not ( = ?auto_141044 ?auto_141050 ) ) ( not ( = ?auto_141044 ?auto_141047 ) ) ( not ( = ?auto_141044 ?auto_141043 ) ) ( not ( = ?auto_141046 ?auto_141050 ) ) ( not ( = ?auto_141046 ?auto_141047 ) ) ( not ( = ?auto_141046 ?auto_141043 ) ) ( not ( = ?auto_141050 ?auto_141047 ) ) ( not ( = ?auto_141050 ?auto_141043 ) ) ( not ( = ?auto_141042 ?auto_141045 ) ) ( not ( = ?auto_141042 ?auto_141048 ) ) ( not ( = ?auto_141042 ?auto_141044 ) ) ( not ( = ?auto_141042 ?auto_141046 ) ) ( not ( = ?auto_141042 ?auto_141050 ) ) ( not ( = ?auto_141049 ?auto_141045 ) ) ( not ( = ?auto_141049 ?auto_141048 ) ) ( not ( = ?auto_141049 ?auto_141044 ) ) ( not ( = ?auto_141049 ?auto_141046 ) ) ( not ( = ?auto_141049 ?auto_141050 ) ) ( ON ?auto_141043 ?auto_141042 ) ( ON-TABLE ?auto_141049 ) ( ON ?auto_141047 ?auto_141043 ) ( ON ?auto_141050 ?auto_141047 ) ( ON ?auto_141046 ?auto_141050 ) ( ON ?auto_141044 ?auto_141046 ) ( CLEAR ?auto_141045 ) ( ON ?auto_141048 ?auto_141044 ) ( CLEAR ?auto_141048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141049 ?auto_141042 ?auto_141043 ?auto_141047 ?auto_141050 ?auto_141046 ?auto_141044 )
      ( MAKE-2PILE ?auto_141042 ?auto_141043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141051 - BLOCK
      ?auto_141052 - BLOCK
    )
    :vars
    (
      ?auto_141054 - BLOCK
      ?auto_141058 - BLOCK
      ?auto_141059 - BLOCK
      ?auto_141057 - BLOCK
      ?auto_141053 - BLOCK
      ?auto_141055 - BLOCK
      ?auto_141056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141051 ?auto_141052 ) ) ( not ( = ?auto_141051 ?auto_141054 ) ) ( not ( = ?auto_141052 ?auto_141054 ) ) ( ON ?auto_141051 ?auto_141058 ) ( not ( = ?auto_141051 ?auto_141058 ) ) ( not ( = ?auto_141052 ?auto_141058 ) ) ( not ( = ?auto_141054 ?auto_141058 ) ) ( not ( = ?auto_141059 ?auto_141057 ) ) ( not ( = ?auto_141059 ?auto_141053 ) ) ( not ( = ?auto_141059 ?auto_141055 ) ) ( not ( = ?auto_141059 ?auto_141056 ) ) ( not ( = ?auto_141059 ?auto_141054 ) ) ( not ( = ?auto_141059 ?auto_141052 ) ) ( not ( = ?auto_141057 ?auto_141053 ) ) ( not ( = ?auto_141057 ?auto_141055 ) ) ( not ( = ?auto_141057 ?auto_141056 ) ) ( not ( = ?auto_141057 ?auto_141054 ) ) ( not ( = ?auto_141057 ?auto_141052 ) ) ( not ( = ?auto_141053 ?auto_141055 ) ) ( not ( = ?auto_141053 ?auto_141056 ) ) ( not ( = ?auto_141053 ?auto_141054 ) ) ( not ( = ?auto_141053 ?auto_141052 ) ) ( not ( = ?auto_141055 ?auto_141056 ) ) ( not ( = ?auto_141055 ?auto_141054 ) ) ( not ( = ?auto_141055 ?auto_141052 ) ) ( not ( = ?auto_141056 ?auto_141054 ) ) ( not ( = ?auto_141056 ?auto_141052 ) ) ( not ( = ?auto_141051 ?auto_141059 ) ) ( not ( = ?auto_141051 ?auto_141057 ) ) ( not ( = ?auto_141051 ?auto_141053 ) ) ( not ( = ?auto_141051 ?auto_141055 ) ) ( not ( = ?auto_141051 ?auto_141056 ) ) ( not ( = ?auto_141058 ?auto_141059 ) ) ( not ( = ?auto_141058 ?auto_141057 ) ) ( not ( = ?auto_141058 ?auto_141053 ) ) ( not ( = ?auto_141058 ?auto_141055 ) ) ( not ( = ?auto_141058 ?auto_141056 ) ) ( ON ?auto_141052 ?auto_141051 ) ( ON-TABLE ?auto_141058 ) ( ON ?auto_141054 ?auto_141052 ) ( ON ?auto_141056 ?auto_141054 ) ( ON ?auto_141055 ?auto_141056 ) ( ON ?auto_141053 ?auto_141055 ) ( ON ?auto_141057 ?auto_141053 ) ( CLEAR ?auto_141057 ) ( HOLDING ?auto_141059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141059 )
      ( MAKE-2PILE ?auto_141051 ?auto_141052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_141060 - BLOCK
      ?auto_141061 - BLOCK
    )
    :vars
    (
      ?auto_141064 - BLOCK
      ?auto_141062 - BLOCK
      ?auto_141065 - BLOCK
      ?auto_141067 - BLOCK
      ?auto_141063 - BLOCK
      ?auto_141066 - BLOCK
      ?auto_141068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141060 ?auto_141061 ) ) ( not ( = ?auto_141060 ?auto_141064 ) ) ( not ( = ?auto_141061 ?auto_141064 ) ) ( ON ?auto_141060 ?auto_141062 ) ( not ( = ?auto_141060 ?auto_141062 ) ) ( not ( = ?auto_141061 ?auto_141062 ) ) ( not ( = ?auto_141064 ?auto_141062 ) ) ( not ( = ?auto_141065 ?auto_141067 ) ) ( not ( = ?auto_141065 ?auto_141063 ) ) ( not ( = ?auto_141065 ?auto_141066 ) ) ( not ( = ?auto_141065 ?auto_141068 ) ) ( not ( = ?auto_141065 ?auto_141064 ) ) ( not ( = ?auto_141065 ?auto_141061 ) ) ( not ( = ?auto_141067 ?auto_141063 ) ) ( not ( = ?auto_141067 ?auto_141066 ) ) ( not ( = ?auto_141067 ?auto_141068 ) ) ( not ( = ?auto_141067 ?auto_141064 ) ) ( not ( = ?auto_141067 ?auto_141061 ) ) ( not ( = ?auto_141063 ?auto_141066 ) ) ( not ( = ?auto_141063 ?auto_141068 ) ) ( not ( = ?auto_141063 ?auto_141064 ) ) ( not ( = ?auto_141063 ?auto_141061 ) ) ( not ( = ?auto_141066 ?auto_141068 ) ) ( not ( = ?auto_141066 ?auto_141064 ) ) ( not ( = ?auto_141066 ?auto_141061 ) ) ( not ( = ?auto_141068 ?auto_141064 ) ) ( not ( = ?auto_141068 ?auto_141061 ) ) ( not ( = ?auto_141060 ?auto_141065 ) ) ( not ( = ?auto_141060 ?auto_141067 ) ) ( not ( = ?auto_141060 ?auto_141063 ) ) ( not ( = ?auto_141060 ?auto_141066 ) ) ( not ( = ?auto_141060 ?auto_141068 ) ) ( not ( = ?auto_141062 ?auto_141065 ) ) ( not ( = ?auto_141062 ?auto_141067 ) ) ( not ( = ?auto_141062 ?auto_141063 ) ) ( not ( = ?auto_141062 ?auto_141066 ) ) ( not ( = ?auto_141062 ?auto_141068 ) ) ( ON ?auto_141061 ?auto_141060 ) ( ON-TABLE ?auto_141062 ) ( ON ?auto_141064 ?auto_141061 ) ( ON ?auto_141068 ?auto_141064 ) ( ON ?auto_141066 ?auto_141068 ) ( ON ?auto_141063 ?auto_141066 ) ( ON ?auto_141067 ?auto_141063 ) ( ON ?auto_141065 ?auto_141067 ) ( CLEAR ?auto_141065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141062 ?auto_141060 ?auto_141061 ?auto_141064 ?auto_141068 ?auto_141066 ?auto_141063 ?auto_141067 )
      ( MAKE-2PILE ?auto_141060 ?auto_141061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141096 - BLOCK
      ?auto_141097 - BLOCK
      ?auto_141098 - BLOCK
      ?auto_141099 - BLOCK
      ?auto_141100 - BLOCK
    )
    :vars
    (
      ?auto_141103 - BLOCK
      ?auto_141102 - BLOCK
      ?auto_141101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141103 ?auto_141100 ) ( ON-TABLE ?auto_141096 ) ( ON ?auto_141097 ?auto_141096 ) ( ON ?auto_141098 ?auto_141097 ) ( ON ?auto_141099 ?auto_141098 ) ( ON ?auto_141100 ?auto_141099 ) ( not ( = ?auto_141096 ?auto_141097 ) ) ( not ( = ?auto_141096 ?auto_141098 ) ) ( not ( = ?auto_141096 ?auto_141099 ) ) ( not ( = ?auto_141096 ?auto_141100 ) ) ( not ( = ?auto_141096 ?auto_141103 ) ) ( not ( = ?auto_141097 ?auto_141098 ) ) ( not ( = ?auto_141097 ?auto_141099 ) ) ( not ( = ?auto_141097 ?auto_141100 ) ) ( not ( = ?auto_141097 ?auto_141103 ) ) ( not ( = ?auto_141098 ?auto_141099 ) ) ( not ( = ?auto_141098 ?auto_141100 ) ) ( not ( = ?auto_141098 ?auto_141103 ) ) ( not ( = ?auto_141099 ?auto_141100 ) ) ( not ( = ?auto_141099 ?auto_141103 ) ) ( not ( = ?auto_141100 ?auto_141103 ) ) ( not ( = ?auto_141096 ?auto_141102 ) ) ( not ( = ?auto_141096 ?auto_141101 ) ) ( not ( = ?auto_141097 ?auto_141102 ) ) ( not ( = ?auto_141097 ?auto_141101 ) ) ( not ( = ?auto_141098 ?auto_141102 ) ) ( not ( = ?auto_141098 ?auto_141101 ) ) ( not ( = ?auto_141099 ?auto_141102 ) ) ( not ( = ?auto_141099 ?auto_141101 ) ) ( not ( = ?auto_141100 ?auto_141102 ) ) ( not ( = ?auto_141100 ?auto_141101 ) ) ( not ( = ?auto_141103 ?auto_141102 ) ) ( not ( = ?auto_141103 ?auto_141101 ) ) ( not ( = ?auto_141102 ?auto_141101 ) ) ( ON ?auto_141102 ?auto_141103 ) ( CLEAR ?auto_141102 ) ( HOLDING ?auto_141101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141101 )
      ( MAKE-5PILE ?auto_141096 ?auto_141097 ?auto_141098 ?auto_141099 ?auto_141100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141209 - BLOCK
      ?auto_141210 - BLOCK
      ?auto_141211 - BLOCK
    )
    :vars
    (
      ?auto_141212 - BLOCK
      ?auto_141213 - BLOCK
      ?auto_141216 - BLOCK
      ?auto_141214 - BLOCK
      ?auto_141215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141209 ) ( not ( = ?auto_141209 ?auto_141210 ) ) ( not ( = ?auto_141209 ?auto_141211 ) ) ( not ( = ?auto_141210 ?auto_141211 ) ) ( ON ?auto_141211 ?auto_141212 ) ( not ( = ?auto_141209 ?auto_141212 ) ) ( not ( = ?auto_141210 ?auto_141212 ) ) ( not ( = ?auto_141211 ?auto_141212 ) ) ( CLEAR ?auto_141209 ) ( ON ?auto_141210 ?auto_141211 ) ( CLEAR ?auto_141210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141213 ) ( ON ?auto_141216 ?auto_141213 ) ( ON ?auto_141214 ?auto_141216 ) ( ON ?auto_141215 ?auto_141214 ) ( ON ?auto_141212 ?auto_141215 ) ( not ( = ?auto_141213 ?auto_141216 ) ) ( not ( = ?auto_141213 ?auto_141214 ) ) ( not ( = ?auto_141213 ?auto_141215 ) ) ( not ( = ?auto_141213 ?auto_141212 ) ) ( not ( = ?auto_141213 ?auto_141211 ) ) ( not ( = ?auto_141213 ?auto_141210 ) ) ( not ( = ?auto_141216 ?auto_141214 ) ) ( not ( = ?auto_141216 ?auto_141215 ) ) ( not ( = ?auto_141216 ?auto_141212 ) ) ( not ( = ?auto_141216 ?auto_141211 ) ) ( not ( = ?auto_141216 ?auto_141210 ) ) ( not ( = ?auto_141214 ?auto_141215 ) ) ( not ( = ?auto_141214 ?auto_141212 ) ) ( not ( = ?auto_141214 ?auto_141211 ) ) ( not ( = ?auto_141214 ?auto_141210 ) ) ( not ( = ?auto_141215 ?auto_141212 ) ) ( not ( = ?auto_141215 ?auto_141211 ) ) ( not ( = ?auto_141215 ?auto_141210 ) ) ( not ( = ?auto_141209 ?auto_141213 ) ) ( not ( = ?auto_141209 ?auto_141216 ) ) ( not ( = ?auto_141209 ?auto_141214 ) ) ( not ( = ?auto_141209 ?auto_141215 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141213 ?auto_141216 ?auto_141214 ?auto_141215 ?auto_141212 ?auto_141211 )
      ( MAKE-3PILE ?auto_141209 ?auto_141210 ?auto_141211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141217 - BLOCK
      ?auto_141218 - BLOCK
      ?auto_141219 - BLOCK
    )
    :vars
    (
      ?auto_141221 - BLOCK
      ?auto_141220 - BLOCK
      ?auto_141224 - BLOCK
      ?auto_141223 - BLOCK
      ?auto_141222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141217 ?auto_141218 ) ) ( not ( = ?auto_141217 ?auto_141219 ) ) ( not ( = ?auto_141218 ?auto_141219 ) ) ( ON ?auto_141219 ?auto_141221 ) ( not ( = ?auto_141217 ?auto_141221 ) ) ( not ( = ?auto_141218 ?auto_141221 ) ) ( not ( = ?auto_141219 ?auto_141221 ) ) ( ON ?auto_141218 ?auto_141219 ) ( CLEAR ?auto_141218 ) ( ON-TABLE ?auto_141220 ) ( ON ?auto_141224 ?auto_141220 ) ( ON ?auto_141223 ?auto_141224 ) ( ON ?auto_141222 ?auto_141223 ) ( ON ?auto_141221 ?auto_141222 ) ( not ( = ?auto_141220 ?auto_141224 ) ) ( not ( = ?auto_141220 ?auto_141223 ) ) ( not ( = ?auto_141220 ?auto_141222 ) ) ( not ( = ?auto_141220 ?auto_141221 ) ) ( not ( = ?auto_141220 ?auto_141219 ) ) ( not ( = ?auto_141220 ?auto_141218 ) ) ( not ( = ?auto_141224 ?auto_141223 ) ) ( not ( = ?auto_141224 ?auto_141222 ) ) ( not ( = ?auto_141224 ?auto_141221 ) ) ( not ( = ?auto_141224 ?auto_141219 ) ) ( not ( = ?auto_141224 ?auto_141218 ) ) ( not ( = ?auto_141223 ?auto_141222 ) ) ( not ( = ?auto_141223 ?auto_141221 ) ) ( not ( = ?auto_141223 ?auto_141219 ) ) ( not ( = ?auto_141223 ?auto_141218 ) ) ( not ( = ?auto_141222 ?auto_141221 ) ) ( not ( = ?auto_141222 ?auto_141219 ) ) ( not ( = ?auto_141222 ?auto_141218 ) ) ( not ( = ?auto_141217 ?auto_141220 ) ) ( not ( = ?auto_141217 ?auto_141224 ) ) ( not ( = ?auto_141217 ?auto_141223 ) ) ( not ( = ?auto_141217 ?auto_141222 ) ) ( HOLDING ?auto_141217 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141217 )
      ( MAKE-3PILE ?auto_141217 ?auto_141218 ?auto_141219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141225 - BLOCK
      ?auto_141226 - BLOCK
      ?auto_141227 - BLOCK
    )
    :vars
    (
      ?auto_141229 - BLOCK
      ?auto_141231 - BLOCK
      ?auto_141228 - BLOCK
      ?auto_141232 - BLOCK
      ?auto_141230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141225 ?auto_141226 ) ) ( not ( = ?auto_141225 ?auto_141227 ) ) ( not ( = ?auto_141226 ?auto_141227 ) ) ( ON ?auto_141227 ?auto_141229 ) ( not ( = ?auto_141225 ?auto_141229 ) ) ( not ( = ?auto_141226 ?auto_141229 ) ) ( not ( = ?auto_141227 ?auto_141229 ) ) ( ON ?auto_141226 ?auto_141227 ) ( ON-TABLE ?auto_141231 ) ( ON ?auto_141228 ?auto_141231 ) ( ON ?auto_141232 ?auto_141228 ) ( ON ?auto_141230 ?auto_141232 ) ( ON ?auto_141229 ?auto_141230 ) ( not ( = ?auto_141231 ?auto_141228 ) ) ( not ( = ?auto_141231 ?auto_141232 ) ) ( not ( = ?auto_141231 ?auto_141230 ) ) ( not ( = ?auto_141231 ?auto_141229 ) ) ( not ( = ?auto_141231 ?auto_141227 ) ) ( not ( = ?auto_141231 ?auto_141226 ) ) ( not ( = ?auto_141228 ?auto_141232 ) ) ( not ( = ?auto_141228 ?auto_141230 ) ) ( not ( = ?auto_141228 ?auto_141229 ) ) ( not ( = ?auto_141228 ?auto_141227 ) ) ( not ( = ?auto_141228 ?auto_141226 ) ) ( not ( = ?auto_141232 ?auto_141230 ) ) ( not ( = ?auto_141232 ?auto_141229 ) ) ( not ( = ?auto_141232 ?auto_141227 ) ) ( not ( = ?auto_141232 ?auto_141226 ) ) ( not ( = ?auto_141230 ?auto_141229 ) ) ( not ( = ?auto_141230 ?auto_141227 ) ) ( not ( = ?auto_141230 ?auto_141226 ) ) ( not ( = ?auto_141225 ?auto_141231 ) ) ( not ( = ?auto_141225 ?auto_141228 ) ) ( not ( = ?auto_141225 ?auto_141232 ) ) ( not ( = ?auto_141225 ?auto_141230 ) ) ( ON ?auto_141225 ?auto_141226 ) ( CLEAR ?auto_141225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141231 ?auto_141228 ?auto_141232 ?auto_141230 ?auto_141229 ?auto_141227 ?auto_141226 )
      ( MAKE-3PILE ?auto_141225 ?auto_141226 ?auto_141227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141236 - BLOCK
      ?auto_141237 - BLOCK
      ?auto_141238 - BLOCK
    )
    :vars
    (
      ?auto_141239 - BLOCK
      ?auto_141242 - BLOCK
      ?auto_141240 - BLOCK
      ?auto_141243 - BLOCK
      ?auto_141241 - BLOCK
      ?auto_141244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141236 ?auto_141237 ) ) ( not ( = ?auto_141236 ?auto_141238 ) ) ( not ( = ?auto_141237 ?auto_141238 ) ) ( ON ?auto_141238 ?auto_141239 ) ( not ( = ?auto_141236 ?auto_141239 ) ) ( not ( = ?auto_141237 ?auto_141239 ) ) ( not ( = ?auto_141238 ?auto_141239 ) ) ( ON ?auto_141237 ?auto_141238 ) ( CLEAR ?auto_141237 ) ( ON-TABLE ?auto_141242 ) ( ON ?auto_141240 ?auto_141242 ) ( ON ?auto_141243 ?auto_141240 ) ( ON ?auto_141241 ?auto_141243 ) ( ON ?auto_141239 ?auto_141241 ) ( not ( = ?auto_141242 ?auto_141240 ) ) ( not ( = ?auto_141242 ?auto_141243 ) ) ( not ( = ?auto_141242 ?auto_141241 ) ) ( not ( = ?auto_141242 ?auto_141239 ) ) ( not ( = ?auto_141242 ?auto_141238 ) ) ( not ( = ?auto_141242 ?auto_141237 ) ) ( not ( = ?auto_141240 ?auto_141243 ) ) ( not ( = ?auto_141240 ?auto_141241 ) ) ( not ( = ?auto_141240 ?auto_141239 ) ) ( not ( = ?auto_141240 ?auto_141238 ) ) ( not ( = ?auto_141240 ?auto_141237 ) ) ( not ( = ?auto_141243 ?auto_141241 ) ) ( not ( = ?auto_141243 ?auto_141239 ) ) ( not ( = ?auto_141243 ?auto_141238 ) ) ( not ( = ?auto_141243 ?auto_141237 ) ) ( not ( = ?auto_141241 ?auto_141239 ) ) ( not ( = ?auto_141241 ?auto_141238 ) ) ( not ( = ?auto_141241 ?auto_141237 ) ) ( not ( = ?auto_141236 ?auto_141242 ) ) ( not ( = ?auto_141236 ?auto_141240 ) ) ( not ( = ?auto_141236 ?auto_141243 ) ) ( not ( = ?auto_141236 ?auto_141241 ) ) ( ON ?auto_141236 ?auto_141244 ) ( CLEAR ?auto_141236 ) ( HAND-EMPTY ) ( not ( = ?auto_141236 ?auto_141244 ) ) ( not ( = ?auto_141237 ?auto_141244 ) ) ( not ( = ?auto_141238 ?auto_141244 ) ) ( not ( = ?auto_141239 ?auto_141244 ) ) ( not ( = ?auto_141242 ?auto_141244 ) ) ( not ( = ?auto_141240 ?auto_141244 ) ) ( not ( = ?auto_141243 ?auto_141244 ) ) ( not ( = ?auto_141241 ?auto_141244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141236 ?auto_141244 )
      ( MAKE-3PILE ?auto_141236 ?auto_141237 ?auto_141238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141245 - BLOCK
      ?auto_141246 - BLOCK
      ?auto_141247 - BLOCK
    )
    :vars
    (
      ?auto_141252 - BLOCK
      ?auto_141250 - BLOCK
      ?auto_141251 - BLOCK
      ?auto_141249 - BLOCK
      ?auto_141248 - BLOCK
      ?auto_141253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141245 ?auto_141246 ) ) ( not ( = ?auto_141245 ?auto_141247 ) ) ( not ( = ?auto_141246 ?auto_141247 ) ) ( ON ?auto_141247 ?auto_141252 ) ( not ( = ?auto_141245 ?auto_141252 ) ) ( not ( = ?auto_141246 ?auto_141252 ) ) ( not ( = ?auto_141247 ?auto_141252 ) ) ( ON-TABLE ?auto_141250 ) ( ON ?auto_141251 ?auto_141250 ) ( ON ?auto_141249 ?auto_141251 ) ( ON ?auto_141248 ?auto_141249 ) ( ON ?auto_141252 ?auto_141248 ) ( not ( = ?auto_141250 ?auto_141251 ) ) ( not ( = ?auto_141250 ?auto_141249 ) ) ( not ( = ?auto_141250 ?auto_141248 ) ) ( not ( = ?auto_141250 ?auto_141252 ) ) ( not ( = ?auto_141250 ?auto_141247 ) ) ( not ( = ?auto_141250 ?auto_141246 ) ) ( not ( = ?auto_141251 ?auto_141249 ) ) ( not ( = ?auto_141251 ?auto_141248 ) ) ( not ( = ?auto_141251 ?auto_141252 ) ) ( not ( = ?auto_141251 ?auto_141247 ) ) ( not ( = ?auto_141251 ?auto_141246 ) ) ( not ( = ?auto_141249 ?auto_141248 ) ) ( not ( = ?auto_141249 ?auto_141252 ) ) ( not ( = ?auto_141249 ?auto_141247 ) ) ( not ( = ?auto_141249 ?auto_141246 ) ) ( not ( = ?auto_141248 ?auto_141252 ) ) ( not ( = ?auto_141248 ?auto_141247 ) ) ( not ( = ?auto_141248 ?auto_141246 ) ) ( not ( = ?auto_141245 ?auto_141250 ) ) ( not ( = ?auto_141245 ?auto_141251 ) ) ( not ( = ?auto_141245 ?auto_141249 ) ) ( not ( = ?auto_141245 ?auto_141248 ) ) ( ON ?auto_141245 ?auto_141253 ) ( CLEAR ?auto_141245 ) ( not ( = ?auto_141245 ?auto_141253 ) ) ( not ( = ?auto_141246 ?auto_141253 ) ) ( not ( = ?auto_141247 ?auto_141253 ) ) ( not ( = ?auto_141252 ?auto_141253 ) ) ( not ( = ?auto_141250 ?auto_141253 ) ) ( not ( = ?auto_141251 ?auto_141253 ) ) ( not ( = ?auto_141249 ?auto_141253 ) ) ( not ( = ?auto_141248 ?auto_141253 ) ) ( HOLDING ?auto_141246 ) ( CLEAR ?auto_141247 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141250 ?auto_141251 ?auto_141249 ?auto_141248 ?auto_141252 ?auto_141247 ?auto_141246 )
      ( MAKE-3PILE ?auto_141245 ?auto_141246 ?auto_141247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141254 - BLOCK
      ?auto_141255 - BLOCK
      ?auto_141256 - BLOCK
    )
    :vars
    (
      ?auto_141257 - BLOCK
      ?auto_141261 - BLOCK
      ?auto_141258 - BLOCK
      ?auto_141262 - BLOCK
      ?auto_141259 - BLOCK
      ?auto_141260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141254 ?auto_141255 ) ) ( not ( = ?auto_141254 ?auto_141256 ) ) ( not ( = ?auto_141255 ?auto_141256 ) ) ( ON ?auto_141256 ?auto_141257 ) ( not ( = ?auto_141254 ?auto_141257 ) ) ( not ( = ?auto_141255 ?auto_141257 ) ) ( not ( = ?auto_141256 ?auto_141257 ) ) ( ON-TABLE ?auto_141261 ) ( ON ?auto_141258 ?auto_141261 ) ( ON ?auto_141262 ?auto_141258 ) ( ON ?auto_141259 ?auto_141262 ) ( ON ?auto_141257 ?auto_141259 ) ( not ( = ?auto_141261 ?auto_141258 ) ) ( not ( = ?auto_141261 ?auto_141262 ) ) ( not ( = ?auto_141261 ?auto_141259 ) ) ( not ( = ?auto_141261 ?auto_141257 ) ) ( not ( = ?auto_141261 ?auto_141256 ) ) ( not ( = ?auto_141261 ?auto_141255 ) ) ( not ( = ?auto_141258 ?auto_141262 ) ) ( not ( = ?auto_141258 ?auto_141259 ) ) ( not ( = ?auto_141258 ?auto_141257 ) ) ( not ( = ?auto_141258 ?auto_141256 ) ) ( not ( = ?auto_141258 ?auto_141255 ) ) ( not ( = ?auto_141262 ?auto_141259 ) ) ( not ( = ?auto_141262 ?auto_141257 ) ) ( not ( = ?auto_141262 ?auto_141256 ) ) ( not ( = ?auto_141262 ?auto_141255 ) ) ( not ( = ?auto_141259 ?auto_141257 ) ) ( not ( = ?auto_141259 ?auto_141256 ) ) ( not ( = ?auto_141259 ?auto_141255 ) ) ( not ( = ?auto_141254 ?auto_141261 ) ) ( not ( = ?auto_141254 ?auto_141258 ) ) ( not ( = ?auto_141254 ?auto_141262 ) ) ( not ( = ?auto_141254 ?auto_141259 ) ) ( ON ?auto_141254 ?auto_141260 ) ( not ( = ?auto_141254 ?auto_141260 ) ) ( not ( = ?auto_141255 ?auto_141260 ) ) ( not ( = ?auto_141256 ?auto_141260 ) ) ( not ( = ?auto_141257 ?auto_141260 ) ) ( not ( = ?auto_141261 ?auto_141260 ) ) ( not ( = ?auto_141258 ?auto_141260 ) ) ( not ( = ?auto_141262 ?auto_141260 ) ) ( not ( = ?auto_141259 ?auto_141260 ) ) ( CLEAR ?auto_141256 ) ( ON ?auto_141255 ?auto_141254 ) ( CLEAR ?auto_141255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141260 ?auto_141254 )
      ( MAKE-3PILE ?auto_141254 ?auto_141255 ?auto_141256 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141263 - BLOCK
      ?auto_141264 - BLOCK
      ?auto_141265 - BLOCK
    )
    :vars
    (
      ?auto_141270 - BLOCK
      ?auto_141268 - BLOCK
      ?auto_141271 - BLOCK
      ?auto_141267 - BLOCK
      ?auto_141269 - BLOCK
      ?auto_141266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141263 ?auto_141264 ) ) ( not ( = ?auto_141263 ?auto_141265 ) ) ( not ( = ?auto_141264 ?auto_141265 ) ) ( not ( = ?auto_141263 ?auto_141270 ) ) ( not ( = ?auto_141264 ?auto_141270 ) ) ( not ( = ?auto_141265 ?auto_141270 ) ) ( ON-TABLE ?auto_141268 ) ( ON ?auto_141271 ?auto_141268 ) ( ON ?auto_141267 ?auto_141271 ) ( ON ?auto_141269 ?auto_141267 ) ( ON ?auto_141270 ?auto_141269 ) ( not ( = ?auto_141268 ?auto_141271 ) ) ( not ( = ?auto_141268 ?auto_141267 ) ) ( not ( = ?auto_141268 ?auto_141269 ) ) ( not ( = ?auto_141268 ?auto_141270 ) ) ( not ( = ?auto_141268 ?auto_141265 ) ) ( not ( = ?auto_141268 ?auto_141264 ) ) ( not ( = ?auto_141271 ?auto_141267 ) ) ( not ( = ?auto_141271 ?auto_141269 ) ) ( not ( = ?auto_141271 ?auto_141270 ) ) ( not ( = ?auto_141271 ?auto_141265 ) ) ( not ( = ?auto_141271 ?auto_141264 ) ) ( not ( = ?auto_141267 ?auto_141269 ) ) ( not ( = ?auto_141267 ?auto_141270 ) ) ( not ( = ?auto_141267 ?auto_141265 ) ) ( not ( = ?auto_141267 ?auto_141264 ) ) ( not ( = ?auto_141269 ?auto_141270 ) ) ( not ( = ?auto_141269 ?auto_141265 ) ) ( not ( = ?auto_141269 ?auto_141264 ) ) ( not ( = ?auto_141263 ?auto_141268 ) ) ( not ( = ?auto_141263 ?auto_141271 ) ) ( not ( = ?auto_141263 ?auto_141267 ) ) ( not ( = ?auto_141263 ?auto_141269 ) ) ( ON ?auto_141263 ?auto_141266 ) ( not ( = ?auto_141263 ?auto_141266 ) ) ( not ( = ?auto_141264 ?auto_141266 ) ) ( not ( = ?auto_141265 ?auto_141266 ) ) ( not ( = ?auto_141270 ?auto_141266 ) ) ( not ( = ?auto_141268 ?auto_141266 ) ) ( not ( = ?auto_141271 ?auto_141266 ) ) ( not ( = ?auto_141267 ?auto_141266 ) ) ( not ( = ?auto_141269 ?auto_141266 ) ) ( ON ?auto_141264 ?auto_141263 ) ( CLEAR ?auto_141264 ) ( ON-TABLE ?auto_141266 ) ( HOLDING ?auto_141265 ) ( CLEAR ?auto_141270 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141268 ?auto_141271 ?auto_141267 ?auto_141269 ?auto_141270 ?auto_141265 )
      ( MAKE-3PILE ?auto_141263 ?auto_141264 ?auto_141265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141272 - BLOCK
      ?auto_141273 - BLOCK
      ?auto_141274 - BLOCK
    )
    :vars
    (
      ?auto_141275 - BLOCK
      ?auto_141276 - BLOCK
      ?auto_141279 - BLOCK
      ?auto_141278 - BLOCK
      ?auto_141280 - BLOCK
      ?auto_141277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141272 ?auto_141273 ) ) ( not ( = ?auto_141272 ?auto_141274 ) ) ( not ( = ?auto_141273 ?auto_141274 ) ) ( not ( = ?auto_141272 ?auto_141275 ) ) ( not ( = ?auto_141273 ?auto_141275 ) ) ( not ( = ?auto_141274 ?auto_141275 ) ) ( ON-TABLE ?auto_141276 ) ( ON ?auto_141279 ?auto_141276 ) ( ON ?auto_141278 ?auto_141279 ) ( ON ?auto_141280 ?auto_141278 ) ( ON ?auto_141275 ?auto_141280 ) ( not ( = ?auto_141276 ?auto_141279 ) ) ( not ( = ?auto_141276 ?auto_141278 ) ) ( not ( = ?auto_141276 ?auto_141280 ) ) ( not ( = ?auto_141276 ?auto_141275 ) ) ( not ( = ?auto_141276 ?auto_141274 ) ) ( not ( = ?auto_141276 ?auto_141273 ) ) ( not ( = ?auto_141279 ?auto_141278 ) ) ( not ( = ?auto_141279 ?auto_141280 ) ) ( not ( = ?auto_141279 ?auto_141275 ) ) ( not ( = ?auto_141279 ?auto_141274 ) ) ( not ( = ?auto_141279 ?auto_141273 ) ) ( not ( = ?auto_141278 ?auto_141280 ) ) ( not ( = ?auto_141278 ?auto_141275 ) ) ( not ( = ?auto_141278 ?auto_141274 ) ) ( not ( = ?auto_141278 ?auto_141273 ) ) ( not ( = ?auto_141280 ?auto_141275 ) ) ( not ( = ?auto_141280 ?auto_141274 ) ) ( not ( = ?auto_141280 ?auto_141273 ) ) ( not ( = ?auto_141272 ?auto_141276 ) ) ( not ( = ?auto_141272 ?auto_141279 ) ) ( not ( = ?auto_141272 ?auto_141278 ) ) ( not ( = ?auto_141272 ?auto_141280 ) ) ( ON ?auto_141272 ?auto_141277 ) ( not ( = ?auto_141272 ?auto_141277 ) ) ( not ( = ?auto_141273 ?auto_141277 ) ) ( not ( = ?auto_141274 ?auto_141277 ) ) ( not ( = ?auto_141275 ?auto_141277 ) ) ( not ( = ?auto_141276 ?auto_141277 ) ) ( not ( = ?auto_141279 ?auto_141277 ) ) ( not ( = ?auto_141278 ?auto_141277 ) ) ( not ( = ?auto_141280 ?auto_141277 ) ) ( ON ?auto_141273 ?auto_141272 ) ( ON-TABLE ?auto_141277 ) ( CLEAR ?auto_141275 ) ( ON ?auto_141274 ?auto_141273 ) ( CLEAR ?auto_141274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141277 ?auto_141272 ?auto_141273 )
      ( MAKE-3PILE ?auto_141272 ?auto_141273 ?auto_141274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141281 - BLOCK
      ?auto_141282 - BLOCK
      ?auto_141283 - BLOCK
    )
    :vars
    (
      ?auto_141285 - BLOCK
      ?auto_141289 - BLOCK
      ?auto_141288 - BLOCK
      ?auto_141286 - BLOCK
      ?auto_141284 - BLOCK
      ?auto_141287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141281 ?auto_141282 ) ) ( not ( = ?auto_141281 ?auto_141283 ) ) ( not ( = ?auto_141282 ?auto_141283 ) ) ( not ( = ?auto_141281 ?auto_141285 ) ) ( not ( = ?auto_141282 ?auto_141285 ) ) ( not ( = ?auto_141283 ?auto_141285 ) ) ( ON-TABLE ?auto_141289 ) ( ON ?auto_141288 ?auto_141289 ) ( ON ?auto_141286 ?auto_141288 ) ( ON ?auto_141284 ?auto_141286 ) ( not ( = ?auto_141289 ?auto_141288 ) ) ( not ( = ?auto_141289 ?auto_141286 ) ) ( not ( = ?auto_141289 ?auto_141284 ) ) ( not ( = ?auto_141289 ?auto_141285 ) ) ( not ( = ?auto_141289 ?auto_141283 ) ) ( not ( = ?auto_141289 ?auto_141282 ) ) ( not ( = ?auto_141288 ?auto_141286 ) ) ( not ( = ?auto_141288 ?auto_141284 ) ) ( not ( = ?auto_141288 ?auto_141285 ) ) ( not ( = ?auto_141288 ?auto_141283 ) ) ( not ( = ?auto_141288 ?auto_141282 ) ) ( not ( = ?auto_141286 ?auto_141284 ) ) ( not ( = ?auto_141286 ?auto_141285 ) ) ( not ( = ?auto_141286 ?auto_141283 ) ) ( not ( = ?auto_141286 ?auto_141282 ) ) ( not ( = ?auto_141284 ?auto_141285 ) ) ( not ( = ?auto_141284 ?auto_141283 ) ) ( not ( = ?auto_141284 ?auto_141282 ) ) ( not ( = ?auto_141281 ?auto_141289 ) ) ( not ( = ?auto_141281 ?auto_141288 ) ) ( not ( = ?auto_141281 ?auto_141286 ) ) ( not ( = ?auto_141281 ?auto_141284 ) ) ( ON ?auto_141281 ?auto_141287 ) ( not ( = ?auto_141281 ?auto_141287 ) ) ( not ( = ?auto_141282 ?auto_141287 ) ) ( not ( = ?auto_141283 ?auto_141287 ) ) ( not ( = ?auto_141285 ?auto_141287 ) ) ( not ( = ?auto_141289 ?auto_141287 ) ) ( not ( = ?auto_141288 ?auto_141287 ) ) ( not ( = ?auto_141286 ?auto_141287 ) ) ( not ( = ?auto_141284 ?auto_141287 ) ) ( ON ?auto_141282 ?auto_141281 ) ( ON-TABLE ?auto_141287 ) ( ON ?auto_141283 ?auto_141282 ) ( CLEAR ?auto_141283 ) ( HOLDING ?auto_141285 ) ( CLEAR ?auto_141284 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141289 ?auto_141288 ?auto_141286 ?auto_141284 ?auto_141285 )
      ( MAKE-3PILE ?auto_141281 ?auto_141282 ?auto_141283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141290 - BLOCK
      ?auto_141291 - BLOCK
      ?auto_141292 - BLOCK
    )
    :vars
    (
      ?auto_141293 - BLOCK
      ?auto_141295 - BLOCK
      ?auto_141297 - BLOCK
      ?auto_141296 - BLOCK
      ?auto_141294 - BLOCK
      ?auto_141298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141290 ?auto_141291 ) ) ( not ( = ?auto_141290 ?auto_141292 ) ) ( not ( = ?auto_141291 ?auto_141292 ) ) ( not ( = ?auto_141290 ?auto_141293 ) ) ( not ( = ?auto_141291 ?auto_141293 ) ) ( not ( = ?auto_141292 ?auto_141293 ) ) ( ON-TABLE ?auto_141295 ) ( ON ?auto_141297 ?auto_141295 ) ( ON ?auto_141296 ?auto_141297 ) ( ON ?auto_141294 ?auto_141296 ) ( not ( = ?auto_141295 ?auto_141297 ) ) ( not ( = ?auto_141295 ?auto_141296 ) ) ( not ( = ?auto_141295 ?auto_141294 ) ) ( not ( = ?auto_141295 ?auto_141293 ) ) ( not ( = ?auto_141295 ?auto_141292 ) ) ( not ( = ?auto_141295 ?auto_141291 ) ) ( not ( = ?auto_141297 ?auto_141296 ) ) ( not ( = ?auto_141297 ?auto_141294 ) ) ( not ( = ?auto_141297 ?auto_141293 ) ) ( not ( = ?auto_141297 ?auto_141292 ) ) ( not ( = ?auto_141297 ?auto_141291 ) ) ( not ( = ?auto_141296 ?auto_141294 ) ) ( not ( = ?auto_141296 ?auto_141293 ) ) ( not ( = ?auto_141296 ?auto_141292 ) ) ( not ( = ?auto_141296 ?auto_141291 ) ) ( not ( = ?auto_141294 ?auto_141293 ) ) ( not ( = ?auto_141294 ?auto_141292 ) ) ( not ( = ?auto_141294 ?auto_141291 ) ) ( not ( = ?auto_141290 ?auto_141295 ) ) ( not ( = ?auto_141290 ?auto_141297 ) ) ( not ( = ?auto_141290 ?auto_141296 ) ) ( not ( = ?auto_141290 ?auto_141294 ) ) ( ON ?auto_141290 ?auto_141298 ) ( not ( = ?auto_141290 ?auto_141298 ) ) ( not ( = ?auto_141291 ?auto_141298 ) ) ( not ( = ?auto_141292 ?auto_141298 ) ) ( not ( = ?auto_141293 ?auto_141298 ) ) ( not ( = ?auto_141295 ?auto_141298 ) ) ( not ( = ?auto_141297 ?auto_141298 ) ) ( not ( = ?auto_141296 ?auto_141298 ) ) ( not ( = ?auto_141294 ?auto_141298 ) ) ( ON ?auto_141291 ?auto_141290 ) ( ON-TABLE ?auto_141298 ) ( ON ?auto_141292 ?auto_141291 ) ( CLEAR ?auto_141294 ) ( ON ?auto_141293 ?auto_141292 ) ( CLEAR ?auto_141293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141298 ?auto_141290 ?auto_141291 ?auto_141292 )
      ( MAKE-3PILE ?auto_141290 ?auto_141291 ?auto_141292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141299 - BLOCK
      ?auto_141300 - BLOCK
      ?auto_141301 - BLOCK
    )
    :vars
    (
      ?auto_141302 - BLOCK
      ?auto_141304 - BLOCK
      ?auto_141306 - BLOCK
      ?auto_141303 - BLOCK
      ?auto_141305 - BLOCK
      ?auto_141307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141299 ?auto_141300 ) ) ( not ( = ?auto_141299 ?auto_141301 ) ) ( not ( = ?auto_141300 ?auto_141301 ) ) ( not ( = ?auto_141299 ?auto_141302 ) ) ( not ( = ?auto_141300 ?auto_141302 ) ) ( not ( = ?auto_141301 ?auto_141302 ) ) ( ON-TABLE ?auto_141304 ) ( ON ?auto_141306 ?auto_141304 ) ( ON ?auto_141303 ?auto_141306 ) ( not ( = ?auto_141304 ?auto_141306 ) ) ( not ( = ?auto_141304 ?auto_141303 ) ) ( not ( = ?auto_141304 ?auto_141305 ) ) ( not ( = ?auto_141304 ?auto_141302 ) ) ( not ( = ?auto_141304 ?auto_141301 ) ) ( not ( = ?auto_141304 ?auto_141300 ) ) ( not ( = ?auto_141306 ?auto_141303 ) ) ( not ( = ?auto_141306 ?auto_141305 ) ) ( not ( = ?auto_141306 ?auto_141302 ) ) ( not ( = ?auto_141306 ?auto_141301 ) ) ( not ( = ?auto_141306 ?auto_141300 ) ) ( not ( = ?auto_141303 ?auto_141305 ) ) ( not ( = ?auto_141303 ?auto_141302 ) ) ( not ( = ?auto_141303 ?auto_141301 ) ) ( not ( = ?auto_141303 ?auto_141300 ) ) ( not ( = ?auto_141305 ?auto_141302 ) ) ( not ( = ?auto_141305 ?auto_141301 ) ) ( not ( = ?auto_141305 ?auto_141300 ) ) ( not ( = ?auto_141299 ?auto_141304 ) ) ( not ( = ?auto_141299 ?auto_141306 ) ) ( not ( = ?auto_141299 ?auto_141303 ) ) ( not ( = ?auto_141299 ?auto_141305 ) ) ( ON ?auto_141299 ?auto_141307 ) ( not ( = ?auto_141299 ?auto_141307 ) ) ( not ( = ?auto_141300 ?auto_141307 ) ) ( not ( = ?auto_141301 ?auto_141307 ) ) ( not ( = ?auto_141302 ?auto_141307 ) ) ( not ( = ?auto_141304 ?auto_141307 ) ) ( not ( = ?auto_141306 ?auto_141307 ) ) ( not ( = ?auto_141303 ?auto_141307 ) ) ( not ( = ?auto_141305 ?auto_141307 ) ) ( ON ?auto_141300 ?auto_141299 ) ( ON-TABLE ?auto_141307 ) ( ON ?auto_141301 ?auto_141300 ) ( ON ?auto_141302 ?auto_141301 ) ( CLEAR ?auto_141302 ) ( HOLDING ?auto_141305 ) ( CLEAR ?auto_141303 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141304 ?auto_141306 ?auto_141303 ?auto_141305 )
      ( MAKE-3PILE ?auto_141299 ?auto_141300 ?auto_141301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141308 - BLOCK
      ?auto_141309 - BLOCK
      ?auto_141310 - BLOCK
    )
    :vars
    (
      ?auto_141312 - BLOCK
      ?auto_141313 - BLOCK
      ?auto_141311 - BLOCK
      ?auto_141316 - BLOCK
      ?auto_141314 - BLOCK
      ?auto_141315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141308 ?auto_141309 ) ) ( not ( = ?auto_141308 ?auto_141310 ) ) ( not ( = ?auto_141309 ?auto_141310 ) ) ( not ( = ?auto_141308 ?auto_141312 ) ) ( not ( = ?auto_141309 ?auto_141312 ) ) ( not ( = ?auto_141310 ?auto_141312 ) ) ( ON-TABLE ?auto_141313 ) ( ON ?auto_141311 ?auto_141313 ) ( ON ?auto_141316 ?auto_141311 ) ( not ( = ?auto_141313 ?auto_141311 ) ) ( not ( = ?auto_141313 ?auto_141316 ) ) ( not ( = ?auto_141313 ?auto_141314 ) ) ( not ( = ?auto_141313 ?auto_141312 ) ) ( not ( = ?auto_141313 ?auto_141310 ) ) ( not ( = ?auto_141313 ?auto_141309 ) ) ( not ( = ?auto_141311 ?auto_141316 ) ) ( not ( = ?auto_141311 ?auto_141314 ) ) ( not ( = ?auto_141311 ?auto_141312 ) ) ( not ( = ?auto_141311 ?auto_141310 ) ) ( not ( = ?auto_141311 ?auto_141309 ) ) ( not ( = ?auto_141316 ?auto_141314 ) ) ( not ( = ?auto_141316 ?auto_141312 ) ) ( not ( = ?auto_141316 ?auto_141310 ) ) ( not ( = ?auto_141316 ?auto_141309 ) ) ( not ( = ?auto_141314 ?auto_141312 ) ) ( not ( = ?auto_141314 ?auto_141310 ) ) ( not ( = ?auto_141314 ?auto_141309 ) ) ( not ( = ?auto_141308 ?auto_141313 ) ) ( not ( = ?auto_141308 ?auto_141311 ) ) ( not ( = ?auto_141308 ?auto_141316 ) ) ( not ( = ?auto_141308 ?auto_141314 ) ) ( ON ?auto_141308 ?auto_141315 ) ( not ( = ?auto_141308 ?auto_141315 ) ) ( not ( = ?auto_141309 ?auto_141315 ) ) ( not ( = ?auto_141310 ?auto_141315 ) ) ( not ( = ?auto_141312 ?auto_141315 ) ) ( not ( = ?auto_141313 ?auto_141315 ) ) ( not ( = ?auto_141311 ?auto_141315 ) ) ( not ( = ?auto_141316 ?auto_141315 ) ) ( not ( = ?auto_141314 ?auto_141315 ) ) ( ON ?auto_141309 ?auto_141308 ) ( ON-TABLE ?auto_141315 ) ( ON ?auto_141310 ?auto_141309 ) ( ON ?auto_141312 ?auto_141310 ) ( CLEAR ?auto_141316 ) ( ON ?auto_141314 ?auto_141312 ) ( CLEAR ?auto_141314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141315 ?auto_141308 ?auto_141309 ?auto_141310 ?auto_141312 )
      ( MAKE-3PILE ?auto_141308 ?auto_141309 ?auto_141310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141317 - BLOCK
      ?auto_141318 - BLOCK
      ?auto_141319 - BLOCK
    )
    :vars
    (
      ?auto_141321 - BLOCK
      ?auto_141324 - BLOCK
      ?auto_141323 - BLOCK
      ?auto_141322 - BLOCK
      ?auto_141325 - BLOCK
      ?auto_141320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141317 ?auto_141318 ) ) ( not ( = ?auto_141317 ?auto_141319 ) ) ( not ( = ?auto_141318 ?auto_141319 ) ) ( not ( = ?auto_141317 ?auto_141321 ) ) ( not ( = ?auto_141318 ?auto_141321 ) ) ( not ( = ?auto_141319 ?auto_141321 ) ) ( ON-TABLE ?auto_141324 ) ( ON ?auto_141323 ?auto_141324 ) ( not ( = ?auto_141324 ?auto_141323 ) ) ( not ( = ?auto_141324 ?auto_141322 ) ) ( not ( = ?auto_141324 ?auto_141325 ) ) ( not ( = ?auto_141324 ?auto_141321 ) ) ( not ( = ?auto_141324 ?auto_141319 ) ) ( not ( = ?auto_141324 ?auto_141318 ) ) ( not ( = ?auto_141323 ?auto_141322 ) ) ( not ( = ?auto_141323 ?auto_141325 ) ) ( not ( = ?auto_141323 ?auto_141321 ) ) ( not ( = ?auto_141323 ?auto_141319 ) ) ( not ( = ?auto_141323 ?auto_141318 ) ) ( not ( = ?auto_141322 ?auto_141325 ) ) ( not ( = ?auto_141322 ?auto_141321 ) ) ( not ( = ?auto_141322 ?auto_141319 ) ) ( not ( = ?auto_141322 ?auto_141318 ) ) ( not ( = ?auto_141325 ?auto_141321 ) ) ( not ( = ?auto_141325 ?auto_141319 ) ) ( not ( = ?auto_141325 ?auto_141318 ) ) ( not ( = ?auto_141317 ?auto_141324 ) ) ( not ( = ?auto_141317 ?auto_141323 ) ) ( not ( = ?auto_141317 ?auto_141322 ) ) ( not ( = ?auto_141317 ?auto_141325 ) ) ( ON ?auto_141317 ?auto_141320 ) ( not ( = ?auto_141317 ?auto_141320 ) ) ( not ( = ?auto_141318 ?auto_141320 ) ) ( not ( = ?auto_141319 ?auto_141320 ) ) ( not ( = ?auto_141321 ?auto_141320 ) ) ( not ( = ?auto_141324 ?auto_141320 ) ) ( not ( = ?auto_141323 ?auto_141320 ) ) ( not ( = ?auto_141322 ?auto_141320 ) ) ( not ( = ?auto_141325 ?auto_141320 ) ) ( ON ?auto_141318 ?auto_141317 ) ( ON-TABLE ?auto_141320 ) ( ON ?auto_141319 ?auto_141318 ) ( ON ?auto_141321 ?auto_141319 ) ( ON ?auto_141325 ?auto_141321 ) ( CLEAR ?auto_141325 ) ( HOLDING ?auto_141322 ) ( CLEAR ?auto_141323 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141324 ?auto_141323 ?auto_141322 )
      ( MAKE-3PILE ?auto_141317 ?auto_141318 ?auto_141319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141326 - BLOCK
      ?auto_141327 - BLOCK
      ?auto_141328 - BLOCK
    )
    :vars
    (
      ?auto_141332 - BLOCK
      ?auto_141329 - BLOCK
      ?auto_141331 - BLOCK
      ?auto_141334 - BLOCK
      ?auto_141333 - BLOCK
      ?auto_141330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141326 ?auto_141327 ) ) ( not ( = ?auto_141326 ?auto_141328 ) ) ( not ( = ?auto_141327 ?auto_141328 ) ) ( not ( = ?auto_141326 ?auto_141332 ) ) ( not ( = ?auto_141327 ?auto_141332 ) ) ( not ( = ?auto_141328 ?auto_141332 ) ) ( ON-TABLE ?auto_141329 ) ( ON ?auto_141331 ?auto_141329 ) ( not ( = ?auto_141329 ?auto_141331 ) ) ( not ( = ?auto_141329 ?auto_141334 ) ) ( not ( = ?auto_141329 ?auto_141333 ) ) ( not ( = ?auto_141329 ?auto_141332 ) ) ( not ( = ?auto_141329 ?auto_141328 ) ) ( not ( = ?auto_141329 ?auto_141327 ) ) ( not ( = ?auto_141331 ?auto_141334 ) ) ( not ( = ?auto_141331 ?auto_141333 ) ) ( not ( = ?auto_141331 ?auto_141332 ) ) ( not ( = ?auto_141331 ?auto_141328 ) ) ( not ( = ?auto_141331 ?auto_141327 ) ) ( not ( = ?auto_141334 ?auto_141333 ) ) ( not ( = ?auto_141334 ?auto_141332 ) ) ( not ( = ?auto_141334 ?auto_141328 ) ) ( not ( = ?auto_141334 ?auto_141327 ) ) ( not ( = ?auto_141333 ?auto_141332 ) ) ( not ( = ?auto_141333 ?auto_141328 ) ) ( not ( = ?auto_141333 ?auto_141327 ) ) ( not ( = ?auto_141326 ?auto_141329 ) ) ( not ( = ?auto_141326 ?auto_141331 ) ) ( not ( = ?auto_141326 ?auto_141334 ) ) ( not ( = ?auto_141326 ?auto_141333 ) ) ( ON ?auto_141326 ?auto_141330 ) ( not ( = ?auto_141326 ?auto_141330 ) ) ( not ( = ?auto_141327 ?auto_141330 ) ) ( not ( = ?auto_141328 ?auto_141330 ) ) ( not ( = ?auto_141332 ?auto_141330 ) ) ( not ( = ?auto_141329 ?auto_141330 ) ) ( not ( = ?auto_141331 ?auto_141330 ) ) ( not ( = ?auto_141334 ?auto_141330 ) ) ( not ( = ?auto_141333 ?auto_141330 ) ) ( ON ?auto_141327 ?auto_141326 ) ( ON-TABLE ?auto_141330 ) ( ON ?auto_141328 ?auto_141327 ) ( ON ?auto_141332 ?auto_141328 ) ( ON ?auto_141333 ?auto_141332 ) ( CLEAR ?auto_141331 ) ( ON ?auto_141334 ?auto_141333 ) ( CLEAR ?auto_141334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141330 ?auto_141326 ?auto_141327 ?auto_141328 ?auto_141332 ?auto_141333 )
      ( MAKE-3PILE ?auto_141326 ?auto_141327 ?auto_141328 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141335 - BLOCK
      ?auto_141336 - BLOCK
      ?auto_141337 - BLOCK
    )
    :vars
    (
      ?auto_141339 - BLOCK
      ?auto_141343 - BLOCK
      ?auto_141341 - BLOCK
      ?auto_141340 - BLOCK
      ?auto_141338 - BLOCK
      ?auto_141342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141335 ?auto_141336 ) ) ( not ( = ?auto_141335 ?auto_141337 ) ) ( not ( = ?auto_141336 ?auto_141337 ) ) ( not ( = ?auto_141335 ?auto_141339 ) ) ( not ( = ?auto_141336 ?auto_141339 ) ) ( not ( = ?auto_141337 ?auto_141339 ) ) ( ON-TABLE ?auto_141343 ) ( not ( = ?auto_141343 ?auto_141341 ) ) ( not ( = ?auto_141343 ?auto_141340 ) ) ( not ( = ?auto_141343 ?auto_141338 ) ) ( not ( = ?auto_141343 ?auto_141339 ) ) ( not ( = ?auto_141343 ?auto_141337 ) ) ( not ( = ?auto_141343 ?auto_141336 ) ) ( not ( = ?auto_141341 ?auto_141340 ) ) ( not ( = ?auto_141341 ?auto_141338 ) ) ( not ( = ?auto_141341 ?auto_141339 ) ) ( not ( = ?auto_141341 ?auto_141337 ) ) ( not ( = ?auto_141341 ?auto_141336 ) ) ( not ( = ?auto_141340 ?auto_141338 ) ) ( not ( = ?auto_141340 ?auto_141339 ) ) ( not ( = ?auto_141340 ?auto_141337 ) ) ( not ( = ?auto_141340 ?auto_141336 ) ) ( not ( = ?auto_141338 ?auto_141339 ) ) ( not ( = ?auto_141338 ?auto_141337 ) ) ( not ( = ?auto_141338 ?auto_141336 ) ) ( not ( = ?auto_141335 ?auto_141343 ) ) ( not ( = ?auto_141335 ?auto_141341 ) ) ( not ( = ?auto_141335 ?auto_141340 ) ) ( not ( = ?auto_141335 ?auto_141338 ) ) ( ON ?auto_141335 ?auto_141342 ) ( not ( = ?auto_141335 ?auto_141342 ) ) ( not ( = ?auto_141336 ?auto_141342 ) ) ( not ( = ?auto_141337 ?auto_141342 ) ) ( not ( = ?auto_141339 ?auto_141342 ) ) ( not ( = ?auto_141343 ?auto_141342 ) ) ( not ( = ?auto_141341 ?auto_141342 ) ) ( not ( = ?auto_141340 ?auto_141342 ) ) ( not ( = ?auto_141338 ?auto_141342 ) ) ( ON ?auto_141336 ?auto_141335 ) ( ON-TABLE ?auto_141342 ) ( ON ?auto_141337 ?auto_141336 ) ( ON ?auto_141339 ?auto_141337 ) ( ON ?auto_141338 ?auto_141339 ) ( ON ?auto_141340 ?auto_141338 ) ( CLEAR ?auto_141340 ) ( HOLDING ?auto_141341 ) ( CLEAR ?auto_141343 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141343 ?auto_141341 )
      ( MAKE-3PILE ?auto_141335 ?auto_141336 ?auto_141337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141344 - BLOCK
      ?auto_141345 - BLOCK
      ?auto_141346 - BLOCK
    )
    :vars
    (
      ?auto_141347 - BLOCK
      ?auto_141349 - BLOCK
      ?auto_141348 - BLOCK
      ?auto_141351 - BLOCK
      ?auto_141352 - BLOCK
      ?auto_141350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141344 ?auto_141345 ) ) ( not ( = ?auto_141344 ?auto_141346 ) ) ( not ( = ?auto_141345 ?auto_141346 ) ) ( not ( = ?auto_141344 ?auto_141347 ) ) ( not ( = ?auto_141345 ?auto_141347 ) ) ( not ( = ?auto_141346 ?auto_141347 ) ) ( ON-TABLE ?auto_141349 ) ( not ( = ?auto_141349 ?auto_141348 ) ) ( not ( = ?auto_141349 ?auto_141351 ) ) ( not ( = ?auto_141349 ?auto_141352 ) ) ( not ( = ?auto_141349 ?auto_141347 ) ) ( not ( = ?auto_141349 ?auto_141346 ) ) ( not ( = ?auto_141349 ?auto_141345 ) ) ( not ( = ?auto_141348 ?auto_141351 ) ) ( not ( = ?auto_141348 ?auto_141352 ) ) ( not ( = ?auto_141348 ?auto_141347 ) ) ( not ( = ?auto_141348 ?auto_141346 ) ) ( not ( = ?auto_141348 ?auto_141345 ) ) ( not ( = ?auto_141351 ?auto_141352 ) ) ( not ( = ?auto_141351 ?auto_141347 ) ) ( not ( = ?auto_141351 ?auto_141346 ) ) ( not ( = ?auto_141351 ?auto_141345 ) ) ( not ( = ?auto_141352 ?auto_141347 ) ) ( not ( = ?auto_141352 ?auto_141346 ) ) ( not ( = ?auto_141352 ?auto_141345 ) ) ( not ( = ?auto_141344 ?auto_141349 ) ) ( not ( = ?auto_141344 ?auto_141348 ) ) ( not ( = ?auto_141344 ?auto_141351 ) ) ( not ( = ?auto_141344 ?auto_141352 ) ) ( ON ?auto_141344 ?auto_141350 ) ( not ( = ?auto_141344 ?auto_141350 ) ) ( not ( = ?auto_141345 ?auto_141350 ) ) ( not ( = ?auto_141346 ?auto_141350 ) ) ( not ( = ?auto_141347 ?auto_141350 ) ) ( not ( = ?auto_141349 ?auto_141350 ) ) ( not ( = ?auto_141348 ?auto_141350 ) ) ( not ( = ?auto_141351 ?auto_141350 ) ) ( not ( = ?auto_141352 ?auto_141350 ) ) ( ON ?auto_141345 ?auto_141344 ) ( ON-TABLE ?auto_141350 ) ( ON ?auto_141346 ?auto_141345 ) ( ON ?auto_141347 ?auto_141346 ) ( ON ?auto_141352 ?auto_141347 ) ( ON ?auto_141351 ?auto_141352 ) ( CLEAR ?auto_141349 ) ( ON ?auto_141348 ?auto_141351 ) ( CLEAR ?auto_141348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141350 ?auto_141344 ?auto_141345 ?auto_141346 ?auto_141347 ?auto_141352 ?auto_141351 )
      ( MAKE-3PILE ?auto_141344 ?auto_141345 ?auto_141346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141353 - BLOCK
      ?auto_141354 - BLOCK
      ?auto_141355 - BLOCK
    )
    :vars
    (
      ?auto_141358 - BLOCK
      ?auto_141360 - BLOCK
      ?auto_141356 - BLOCK
      ?auto_141361 - BLOCK
      ?auto_141359 - BLOCK
      ?auto_141357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141353 ?auto_141354 ) ) ( not ( = ?auto_141353 ?auto_141355 ) ) ( not ( = ?auto_141354 ?auto_141355 ) ) ( not ( = ?auto_141353 ?auto_141358 ) ) ( not ( = ?auto_141354 ?auto_141358 ) ) ( not ( = ?auto_141355 ?auto_141358 ) ) ( not ( = ?auto_141360 ?auto_141356 ) ) ( not ( = ?auto_141360 ?auto_141361 ) ) ( not ( = ?auto_141360 ?auto_141359 ) ) ( not ( = ?auto_141360 ?auto_141358 ) ) ( not ( = ?auto_141360 ?auto_141355 ) ) ( not ( = ?auto_141360 ?auto_141354 ) ) ( not ( = ?auto_141356 ?auto_141361 ) ) ( not ( = ?auto_141356 ?auto_141359 ) ) ( not ( = ?auto_141356 ?auto_141358 ) ) ( not ( = ?auto_141356 ?auto_141355 ) ) ( not ( = ?auto_141356 ?auto_141354 ) ) ( not ( = ?auto_141361 ?auto_141359 ) ) ( not ( = ?auto_141361 ?auto_141358 ) ) ( not ( = ?auto_141361 ?auto_141355 ) ) ( not ( = ?auto_141361 ?auto_141354 ) ) ( not ( = ?auto_141359 ?auto_141358 ) ) ( not ( = ?auto_141359 ?auto_141355 ) ) ( not ( = ?auto_141359 ?auto_141354 ) ) ( not ( = ?auto_141353 ?auto_141360 ) ) ( not ( = ?auto_141353 ?auto_141356 ) ) ( not ( = ?auto_141353 ?auto_141361 ) ) ( not ( = ?auto_141353 ?auto_141359 ) ) ( ON ?auto_141353 ?auto_141357 ) ( not ( = ?auto_141353 ?auto_141357 ) ) ( not ( = ?auto_141354 ?auto_141357 ) ) ( not ( = ?auto_141355 ?auto_141357 ) ) ( not ( = ?auto_141358 ?auto_141357 ) ) ( not ( = ?auto_141360 ?auto_141357 ) ) ( not ( = ?auto_141356 ?auto_141357 ) ) ( not ( = ?auto_141361 ?auto_141357 ) ) ( not ( = ?auto_141359 ?auto_141357 ) ) ( ON ?auto_141354 ?auto_141353 ) ( ON-TABLE ?auto_141357 ) ( ON ?auto_141355 ?auto_141354 ) ( ON ?auto_141358 ?auto_141355 ) ( ON ?auto_141359 ?auto_141358 ) ( ON ?auto_141361 ?auto_141359 ) ( ON ?auto_141356 ?auto_141361 ) ( CLEAR ?auto_141356 ) ( HOLDING ?auto_141360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141360 )
      ( MAKE-3PILE ?auto_141353 ?auto_141354 ?auto_141355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141362 - BLOCK
      ?auto_141363 - BLOCK
      ?auto_141364 - BLOCK
    )
    :vars
    (
      ?auto_141365 - BLOCK
      ?auto_141366 - BLOCK
      ?auto_141369 - BLOCK
      ?auto_141370 - BLOCK
      ?auto_141368 - BLOCK
      ?auto_141367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141362 ?auto_141363 ) ) ( not ( = ?auto_141362 ?auto_141364 ) ) ( not ( = ?auto_141363 ?auto_141364 ) ) ( not ( = ?auto_141362 ?auto_141365 ) ) ( not ( = ?auto_141363 ?auto_141365 ) ) ( not ( = ?auto_141364 ?auto_141365 ) ) ( not ( = ?auto_141366 ?auto_141369 ) ) ( not ( = ?auto_141366 ?auto_141370 ) ) ( not ( = ?auto_141366 ?auto_141368 ) ) ( not ( = ?auto_141366 ?auto_141365 ) ) ( not ( = ?auto_141366 ?auto_141364 ) ) ( not ( = ?auto_141366 ?auto_141363 ) ) ( not ( = ?auto_141369 ?auto_141370 ) ) ( not ( = ?auto_141369 ?auto_141368 ) ) ( not ( = ?auto_141369 ?auto_141365 ) ) ( not ( = ?auto_141369 ?auto_141364 ) ) ( not ( = ?auto_141369 ?auto_141363 ) ) ( not ( = ?auto_141370 ?auto_141368 ) ) ( not ( = ?auto_141370 ?auto_141365 ) ) ( not ( = ?auto_141370 ?auto_141364 ) ) ( not ( = ?auto_141370 ?auto_141363 ) ) ( not ( = ?auto_141368 ?auto_141365 ) ) ( not ( = ?auto_141368 ?auto_141364 ) ) ( not ( = ?auto_141368 ?auto_141363 ) ) ( not ( = ?auto_141362 ?auto_141366 ) ) ( not ( = ?auto_141362 ?auto_141369 ) ) ( not ( = ?auto_141362 ?auto_141370 ) ) ( not ( = ?auto_141362 ?auto_141368 ) ) ( ON ?auto_141362 ?auto_141367 ) ( not ( = ?auto_141362 ?auto_141367 ) ) ( not ( = ?auto_141363 ?auto_141367 ) ) ( not ( = ?auto_141364 ?auto_141367 ) ) ( not ( = ?auto_141365 ?auto_141367 ) ) ( not ( = ?auto_141366 ?auto_141367 ) ) ( not ( = ?auto_141369 ?auto_141367 ) ) ( not ( = ?auto_141370 ?auto_141367 ) ) ( not ( = ?auto_141368 ?auto_141367 ) ) ( ON ?auto_141363 ?auto_141362 ) ( ON-TABLE ?auto_141367 ) ( ON ?auto_141364 ?auto_141363 ) ( ON ?auto_141365 ?auto_141364 ) ( ON ?auto_141368 ?auto_141365 ) ( ON ?auto_141370 ?auto_141368 ) ( ON ?auto_141369 ?auto_141370 ) ( ON ?auto_141366 ?auto_141369 ) ( CLEAR ?auto_141366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141367 ?auto_141362 ?auto_141363 ?auto_141364 ?auto_141365 ?auto_141368 ?auto_141370 ?auto_141369 )
      ( MAKE-3PILE ?auto_141362 ?auto_141363 ?auto_141364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141394 - BLOCK
      ?auto_141395 - BLOCK
      ?auto_141396 - BLOCK
      ?auto_141397 - BLOCK
    )
    :vars
    (
      ?auto_141400 - BLOCK
      ?auto_141399 - BLOCK
      ?auto_141398 - BLOCK
      ?auto_141401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141400 ?auto_141397 ) ( ON-TABLE ?auto_141394 ) ( ON ?auto_141395 ?auto_141394 ) ( ON ?auto_141396 ?auto_141395 ) ( ON ?auto_141397 ?auto_141396 ) ( not ( = ?auto_141394 ?auto_141395 ) ) ( not ( = ?auto_141394 ?auto_141396 ) ) ( not ( = ?auto_141394 ?auto_141397 ) ) ( not ( = ?auto_141394 ?auto_141400 ) ) ( not ( = ?auto_141395 ?auto_141396 ) ) ( not ( = ?auto_141395 ?auto_141397 ) ) ( not ( = ?auto_141395 ?auto_141400 ) ) ( not ( = ?auto_141396 ?auto_141397 ) ) ( not ( = ?auto_141396 ?auto_141400 ) ) ( not ( = ?auto_141397 ?auto_141400 ) ) ( not ( = ?auto_141394 ?auto_141399 ) ) ( not ( = ?auto_141394 ?auto_141398 ) ) ( not ( = ?auto_141395 ?auto_141399 ) ) ( not ( = ?auto_141395 ?auto_141398 ) ) ( not ( = ?auto_141396 ?auto_141399 ) ) ( not ( = ?auto_141396 ?auto_141398 ) ) ( not ( = ?auto_141397 ?auto_141399 ) ) ( not ( = ?auto_141397 ?auto_141398 ) ) ( not ( = ?auto_141400 ?auto_141399 ) ) ( not ( = ?auto_141400 ?auto_141398 ) ) ( not ( = ?auto_141399 ?auto_141398 ) ) ( ON ?auto_141399 ?auto_141400 ) ( CLEAR ?auto_141399 ) ( HOLDING ?auto_141398 ) ( CLEAR ?auto_141401 ) ( ON-TABLE ?auto_141401 ) ( not ( = ?auto_141401 ?auto_141398 ) ) ( not ( = ?auto_141394 ?auto_141401 ) ) ( not ( = ?auto_141395 ?auto_141401 ) ) ( not ( = ?auto_141396 ?auto_141401 ) ) ( not ( = ?auto_141397 ?auto_141401 ) ) ( not ( = ?auto_141400 ?auto_141401 ) ) ( not ( = ?auto_141399 ?auto_141401 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141401 ?auto_141398 )
      ( MAKE-4PILE ?auto_141394 ?auto_141395 ?auto_141396 ?auto_141397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141402 - BLOCK
      ?auto_141403 - BLOCK
      ?auto_141404 - BLOCK
      ?auto_141405 - BLOCK
    )
    :vars
    (
      ?auto_141409 - BLOCK
      ?auto_141407 - BLOCK
      ?auto_141408 - BLOCK
      ?auto_141406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141409 ?auto_141405 ) ( ON-TABLE ?auto_141402 ) ( ON ?auto_141403 ?auto_141402 ) ( ON ?auto_141404 ?auto_141403 ) ( ON ?auto_141405 ?auto_141404 ) ( not ( = ?auto_141402 ?auto_141403 ) ) ( not ( = ?auto_141402 ?auto_141404 ) ) ( not ( = ?auto_141402 ?auto_141405 ) ) ( not ( = ?auto_141402 ?auto_141409 ) ) ( not ( = ?auto_141403 ?auto_141404 ) ) ( not ( = ?auto_141403 ?auto_141405 ) ) ( not ( = ?auto_141403 ?auto_141409 ) ) ( not ( = ?auto_141404 ?auto_141405 ) ) ( not ( = ?auto_141404 ?auto_141409 ) ) ( not ( = ?auto_141405 ?auto_141409 ) ) ( not ( = ?auto_141402 ?auto_141407 ) ) ( not ( = ?auto_141402 ?auto_141408 ) ) ( not ( = ?auto_141403 ?auto_141407 ) ) ( not ( = ?auto_141403 ?auto_141408 ) ) ( not ( = ?auto_141404 ?auto_141407 ) ) ( not ( = ?auto_141404 ?auto_141408 ) ) ( not ( = ?auto_141405 ?auto_141407 ) ) ( not ( = ?auto_141405 ?auto_141408 ) ) ( not ( = ?auto_141409 ?auto_141407 ) ) ( not ( = ?auto_141409 ?auto_141408 ) ) ( not ( = ?auto_141407 ?auto_141408 ) ) ( ON ?auto_141407 ?auto_141409 ) ( CLEAR ?auto_141406 ) ( ON-TABLE ?auto_141406 ) ( not ( = ?auto_141406 ?auto_141408 ) ) ( not ( = ?auto_141402 ?auto_141406 ) ) ( not ( = ?auto_141403 ?auto_141406 ) ) ( not ( = ?auto_141404 ?auto_141406 ) ) ( not ( = ?auto_141405 ?auto_141406 ) ) ( not ( = ?auto_141409 ?auto_141406 ) ) ( not ( = ?auto_141407 ?auto_141406 ) ) ( ON ?auto_141408 ?auto_141407 ) ( CLEAR ?auto_141408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141402 ?auto_141403 ?auto_141404 ?auto_141405 ?auto_141409 ?auto_141407 )
      ( MAKE-4PILE ?auto_141402 ?auto_141403 ?auto_141404 ?auto_141405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141410 - BLOCK
      ?auto_141411 - BLOCK
      ?auto_141412 - BLOCK
      ?auto_141413 - BLOCK
    )
    :vars
    (
      ?auto_141414 - BLOCK
      ?auto_141416 - BLOCK
      ?auto_141417 - BLOCK
      ?auto_141415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141414 ?auto_141413 ) ( ON-TABLE ?auto_141410 ) ( ON ?auto_141411 ?auto_141410 ) ( ON ?auto_141412 ?auto_141411 ) ( ON ?auto_141413 ?auto_141412 ) ( not ( = ?auto_141410 ?auto_141411 ) ) ( not ( = ?auto_141410 ?auto_141412 ) ) ( not ( = ?auto_141410 ?auto_141413 ) ) ( not ( = ?auto_141410 ?auto_141414 ) ) ( not ( = ?auto_141411 ?auto_141412 ) ) ( not ( = ?auto_141411 ?auto_141413 ) ) ( not ( = ?auto_141411 ?auto_141414 ) ) ( not ( = ?auto_141412 ?auto_141413 ) ) ( not ( = ?auto_141412 ?auto_141414 ) ) ( not ( = ?auto_141413 ?auto_141414 ) ) ( not ( = ?auto_141410 ?auto_141416 ) ) ( not ( = ?auto_141410 ?auto_141417 ) ) ( not ( = ?auto_141411 ?auto_141416 ) ) ( not ( = ?auto_141411 ?auto_141417 ) ) ( not ( = ?auto_141412 ?auto_141416 ) ) ( not ( = ?auto_141412 ?auto_141417 ) ) ( not ( = ?auto_141413 ?auto_141416 ) ) ( not ( = ?auto_141413 ?auto_141417 ) ) ( not ( = ?auto_141414 ?auto_141416 ) ) ( not ( = ?auto_141414 ?auto_141417 ) ) ( not ( = ?auto_141416 ?auto_141417 ) ) ( ON ?auto_141416 ?auto_141414 ) ( not ( = ?auto_141415 ?auto_141417 ) ) ( not ( = ?auto_141410 ?auto_141415 ) ) ( not ( = ?auto_141411 ?auto_141415 ) ) ( not ( = ?auto_141412 ?auto_141415 ) ) ( not ( = ?auto_141413 ?auto_141415 ) ) ( not ( = ?auto_141414 ?auto_141415 ) ) ( not ( = ?auto_141416 ?auto_141415 ) ) ( ON ?auto_141417 ?auto_141416 ) ( CLEAR ?auto_141417 ) ( HOLDING ?auto_141415 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141415 )
      ( MAKE-4PILE ?auto_141410 ?auto_141411 ?auto_141412 ?auto_141413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141430 - BLOCK
      ?auto_141431 - BLOCK
      ?auto_141432 - BLOCK
      ?auto_141433 - BLOCK
    )
    :vars
    (
      ?auto_141434 - BLOCK
      ?auto_141435 - BLOCK
      ?auto_141436 - BLOCK
      ?auto_141437 - BLOCK
      ?auto_141438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141434 ?auto_141433 ) ( ON-TABLE ?auto_141430 ) ( ON ?auto_141431 ?auto_141430 ) ( ON ?auto_141432 ?auto_141431 ) ( ON ?auto_141433 ?auto_141432 ) ( not ( = ?auto_141430 ?auto_141431 ) ) ( not ( = ?auto_141430 ?auto_141432 ) ) ( not ( = ?auto_141430 ?auto_141433 ) ) ( not ( = ?auto_141430 ?auto_141434 ) ) ( not ( = ?auto_141431 ?auto_141432 ) ) ( not ( = ?auto_141431 ?auto_141433 ) ) ( not ( = ?auto_141431 ?auto_141434 ) ) ( not ( = ?auto_141432 ?auto_141433 ) ) ( not ( = ?auto_141432 ?auto_141434 ) ) ( not ( = ?auto_141433 ?auto_141434 ) ) ( not ( = ?auto_141430 ?auto_141435 ) ) ( not ( = ?auto_141430 ?auto_141436 ) ) ( not ( = ?auto_141431 ?auto_141435 ) ) ( not ( = ?auto_141431 ?auto_141436 ) ) ( not ( = ?auto_141432 ?auto_141435 ) ) ( not ( = ?auto_141432 ?auto_141436 ) ) ( not ( = ?auto_141433 ?auto_141435 ) ) ( not ( = ?auto_141433 ?auto_141436 ) ) ( not ( = ?auto_141434 ?auto_141435 ) ) ( not ( = ?auto_141434 ?auto_141436 ) ) ( not ( = ?auto_141435 ?auto_141436 ) ) ( ON ?auto_141435 ?auto_141434 ) ( not ( = ?auto_141437 ?auto_141436 ) ) ( not ( = ?auto_141430 ?auto_141437 ) ) ( not ( = ?auto_141431 ?auto_141437 ) ) ( not ( = ?auto_141432 ?auto_141437 ) ) ( not ( = ?auto_141433 ?auto_141437 ) ) ( not ( = ?auto_141434 ?auto_141437 ) ) ( not ( = ?auto_141435 ?auto_141437 ) ) ( ON ?auto_141436 ?auto_141435 ) ( CLEAR ?auto_141436 ) ( ON ?auto_141437 ?auto_141438 ) ( CLEAR ?auto_141437 ) ( HAND-EMPTY ) ( not ( = ?auto_141430 ?auto_141438 ) ) ( not ( = ?auto_141431 ?auto_141438 ) ) ( not ( = ?auto_141432 ?auto_141438 ) ) ( not ( = ?auto_141433 ?auto_141438 ) ) ( not ( = ?auto_141434 ?auto_141438 ) ) ( not ( = ?auto_141435 ?auto_141438 ) ) ( not ( = ?auto_141436 ?auto_141438 ) ) ( not ( = ?auto_141437 ?auto_141438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141437 ?auto_141438 )
      ( MAKE-4PILE ?auto_141430 ?auto_141431 ?auto_141432 ?auto_141433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141439 - BLOCK
      ?auto_141440 - BLOCK
      ?auto_141441 - BLOCK
      ?auto_141442 - BLOCK
    )
    :vars
    (
      ?auto_141444 - BLOCK
      ?auto_141445 - BLOCK
      ?auto_141446 - BLOCK
      ?auto_141443 - BLOCK
      ?auto_141447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141444 ?auto_141442 ) ( ON-TABLE ?auto_141439 ) ( ON ?auto_141440 ?auto_141439 ) ( ON ?auto_141441 ?auto_141440 ) ( ON ?auto_141442 ?auto_141441 ) ( not ( = ?auto_141439 ?auto_141440 ) ) ( not ( = ?auto_141439 ?auto_141441 ) ) ( not ( = ?auto_141439 ?auto_141442 ) ) ( not ( = ?auto_141439 ?auto_141444 ) ) ( not ( = ?auto_141440 ?auto_141441 ) ) ( not ( = ?auto_141440 ?auto_141442 ) ) ( not ( = ?auto_141440 ?auto_141444 ) ) ( not ( = ?auto_141441 ?auto_141442 ) ) ( not ( = ?auto_141441 ?auto_141444 ) ) ( not ( = ?auto_141442 ?auto_141444 ) ) ( not ( = ?auto_141439 ?auto_141445 ) ) ( not ( = ?auto_141439 ?auto_141446 ) ) ( not ( = ?auto_141440 ?auto_141445 ) ) ( not ( = ?auto_141440 ?auto_141446 ) ) ( not ( = ?auto_141441 ?auto_141445 ) ) ( not ( = ?auto_141441 ?auto_141446 ) ) ( not ( = ?auto_141442 ?auto_141445 ) ) ( not ( = ?auto_141442 ?auto_141446 ) ) ( not ( = ?auto_141444 ?auto_141445 ) ) ( not ( = ?auto_141444 ?auto_141446 ) ) ( not ( = ?auto_141445 ?auto_141446 ) ) ( ON ?auto_141445 ?auto_141444 ) ( not ( = ?auto_141443 ?auto_141446 ) ) ( not ( = ?auto_141439 ?auto_141443 ) ) ( not ( = ?auto_141440 ?auto_141443 ) ) ( not ( = ?auto_141441 ?auto_141443 ) ) ( not ( = ?auto_141442 ?auto_141443 ) ) ( not ( = ?auto_141444 ?auto_141443 ) ) ( not ( = ?auto_141445 ?auto_141443 ) ) ( ON ?auto_141443 ?auto_141447 ) ( CLEAR ?auto_141443 ) ( not ( = ?auto_141439 ?auto_141447 ) ) ( not ( = ?auto_141440 ?auto_141447 ) ) ( not ( = ?auto_141441 ?auto_141447 ) ) ( not ( = ?auto_141442 ?auto_141447 ) ) ( not ( = ?auto_141444 ?auto_141447 ) ) ( not ( = ?auto_141445 ?auto_141447 ) ) ( not ( = ?auto_141446 ?auto_141447 ) ) ( not ( = ?auto_141443 ?auto_141447 ) ) ( HOLDING ?auto_141446 ) ( CLEAR ?auto_141445 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141439 ?auto_141440 ?auto_141441 ?auto_141442 ?auto_141444 ?auto_141445 ?auto_141446 )
      ( MAKE-4PILE ?auto_141439 ?auto_141440 ?auto_141441 ?auto_141442 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141521 - BLOCK
      ?auto_141522 - BLOCK
      ?auto_141523 - BLOCK
      ?auto_141524 - BLOCK
    )
    :vars
    (
      ?auto_141525 - BLOCK
      ?auto_141528 - BLOCK
      ?auto_141526 - BLOCK
      ?auto_141527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141521 ) ( ON ?auto_141522 ?auto_141521 ) ( not ( = ?auto_141521 ?auto_141522 ) ) ( not ( = ?auto_141521 ?auto_141523 ) ) ( not ( = ?auto_141521 ?auto_141524 ) ) ( not ( = ?auto_141522 ?auto_141523 ) ) ( not ( = ?auto_141522 ?auto_141524 ) ) ( not ( = ?auto_141523 ?auto_141524 ) ) ( ON ?auto_141524 ?auto_141525 ) ( not ( = ?auto_141521 ?auto_141525 ) ) ( not ( = ?auto_141522 ?auto_141525 ) ) ( not ( = ?auto_141523 ?auto_141525 ) ) ( not ( = ?auto_141524 ?auto_141525 ) ) ( CLEAR ?auto_141522 ) ( ON ?auto_141523 ?auto_141524 ) ( CLEAR ?auto_141523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141528 ) ( ON ?auto_141526 ?auto_141528 ) ( ON ?auto_141527 ?auto_141526 ) ( ON ?auto_141525 ?auto_141527 ) ( not ( = ?auto_141528 ?auto_141526 ) ) ( not ( = ?auto_141528 ?auto_141527 ) ) ( not ( = ?auto_141528 ?auto_141525 ) ) ( not ( = ?auto_141528 ?auto_141524 ) ) ( not ( = ?auto_141528 ?auto_141523 ) ) ( not ( = ?auto_141526 ?auto_141527 ) ) ( not ( = ?auto_141526 ?auto_141525 ) ) ( not ( = ?auto_141526 ?auto_141524 ) ) ( not ( = ?auto_141526 ?auto_141523 ) ) ( not ( = ?auto_141527 ?auto_141525 ) ) ( not ( = ?auto_141527 ?auto_141524 ) ) ( not ( = ?auto_141527 ?auto_141523 ) ) ( not ( = ?auto_141521 ?auto_141528 ) ) ( not ( = ?auto_141521 ?auto_141526 ) ) ( not ( = ?auto_141521 ?auto_141527 ) ) ( not ( = ?auto_141522 ?auto_141528 ) ) ( not ( = ?auto_141522 ?auto_141526 ) ) ( not ( = ?auto_141522 ?auto_141527 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141528 ?auto_141526 ?auto_141527 ?auto_141525 ?auto_141524 )
      ( MAKE-4PILE ?auto_141521 ?auto_141522 ?auto_141523 ?auto_141524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141529 - BLOCK
      ?auto_141530 - BLOCK
      ?auto_141531 - BLOCK
      ?auto_141532 - BLOCK
    )
    :vars
    (
      ?auto_141534 - BLOCK
      ?auto_141533 - BLOCK
      ?auto_141535 - BLOCK
      ?auto_141536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141529 ) ( not ( = ?auto_141529 ?auto_141530 ) ) ( not ( = ?auto_141529 ?auto_141531 ) ) ( not ( = ?auto_141529 ?auto_141532 ) ) ( not ( = ?auto_141530 ?auto_141531 ) ) ( not ( = ?auto_141530 ?auto_141532 ) ) ( not ( = ?auto_141531 ?auto_141532 ) ) ( ON ?auto_141532 ?auto_141534 ) ( not ( = ?auto_141529 ?auto_141534 ) ) ( not ( = ?auto_141530 ?auto_141534 ) ) ( not ( = ?auto_141531 ?auto_141534 ) ) ( not ( = ?auto_141532 ?auto_141534 ) ) ( ON ?auto_141531 ?auto_141532 ) ( CLEAR ?auto_141531 ) ( ON-TABLE ?auto_141533 ) ( ON ?auto_141535 ?auto_141533 ) ( ON ?auto_141536 ?auto_141535 ) ( ON ?auto_141534 ?auto_141536 ) ( not ( = ?auto_141533 ?auto_141535 ) ) ( not ( = ?auto_141533 ?auto_141536 ) ) ( not ( = ?auto_141533 ?auto_141534 ) ) ( not ( = ?auto_141533 ?auto_141532 ) ) ( not ( = ?auto_141533 ?auto_141531 ) ) ( not ( = ?auto_141535 ?auto_141536 ) ) ( not ( = ?auto_141535 ?auto_141534 ) ) ( not ( = ?auto_141535 ?auto_141532 ) ) ( not ( = ?auto_141535 ?auto_141531 ) ) ( not ( = ?auto_141536 ?auto_141534 ) ) ( not ( = ?auto_141536 ?auto_141532 ) ) ( not ( = ?auto_141536 ?auto_141531 ) ) ( not ( = ?auto_141529 ?auto_141533 ) ) ( not ( = ?auto_141529 ?auto_141535 ) ) ( not ( = ?auto_141529 ?auto_141536 ) ) ( not ( = ?auto_141530 ?auto_141533 ) ) ( not ( = ?auto_141530 ?auto_141535 ) ) ( not ( = ?auto_141530 ?auto_141536 ) ) ( HOLDING ?auto_141530 ) ( CLEAR ?auto_141529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141529 ?auto_141530 )
      ( MAKE-4PILE ?auto_141529 ?auto_141530 ?auto_141531 ?auto_141532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141537 - BLOCK
      ?auto_141538 - BLOCK
      ?auto_141539 - BLOCK
      ?auto_141540 - BLOCK
    )
    :vars
    (
      ?auto_141542 - BLOCK
      ?auto_141543 - BLOCK
      ?auto_141544 - BLOCK
      ?auto_141541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141537 ) ( not ( = ?auto_141537 ?auto_141538 ) ) ( not ( = ?auto_141537 ?auto_141539 ) ) ( not ( = ?auto_141537 ?auto_141540 ) ) ( not ( = ?auto_141538 ?auto_141539 ) ) ( not ( = ?auto_141538 ?auto_141540 ) ) ( not ( = ?auto_141539 ?auto_141540 ) ) ( ON ?auto_141540 ?auto_141542 ) ( not ( = ?auto_141537 ?auto_141542 ) ) ( not ( = ?auto_141538 ?auto_141542 ) ) ( not ( = ?auto_141539 ?auto_141542 ) ) ( not ( = ?auto_141540 ?auto_141542 ) ) ( ON ?auto_141539 ?auto_141540 ) ( ON-TABLE ?auto_141543 ) ( ON ?auto_141544 ?auto_141543 ) ( ON ?auto_141541 ?auto_141544 ) ( ON ?auto_141542 ?auto_141541 ) ( not ( = ?auto_141543 ?auto_141544 ) ) ( not ( = ?auto_141543 ?auto_141541 ) ) ( not ( = ?auto_141543 ?auto_141542 ) ) ( not ( = ?auto_141543 ?auto_141540 ) ) ( not ( = ?auto_141543 ?auto_141539 ) ) ( not ( = ?auto_141544 ?auto_141541 ) ) ( not ( = ?auto_141544 ?auto_141542 ) ) ( not ( = ?auto_141544 ?auto_141540 ) ) ( not ( = ?auto_141544 ?auto_141539 ) ) ( not ( = ?auto_141541 ?auto_141542 ) ) ( not ( = ?auto_141541 ?auto_141540 ) ) ( not ( = ?auto_141541 ?auto_141539 ) ) ( not ( = ?auto_141537 ?auto_141543 ) ) ( not ( = ?auto_141537 ?auto_141544 ) ) ( not ( = ?auto_141537 ?auto_141541 ) ) ( not ( = ?auto_141538 ?auto_141543 ) ) ( not ( = ?auto_141538 ?auto_141544 ) ) ( not ( = ?auto_141538 ?auto_141541 ) ) ( CLEAR ?auto_141537 ) ( ON ?auto_141538 ?auto_141539 ) ( CLEAR ?auto_141538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141543 ?auto_141544 ?auto_141541 ?auto_141542 ?auto_141540 ?auto_141539 )
      ( MAKE-4PILE ?auto_141537 ?auto_141538 ?auto_141539 ?auto_141540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141545 - BLOCK
      ?auto_141546 - BLOCK
      ?auto_141547 - BLOCK
      ?auto_141548 - BLOCK
    )
    :vars
    (
      ?auto_141549 - BLOCK
      ?auto_141551 - BLOCK
      ?auto_141552 - BLOCK
      ?auto_141550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141545 ?auto_141546 ) ) ( not ( = ?auto_141545 ?auto_141547 ) ) ( not ( = ?auto_141545 ?auto_141548 ) ) ( not ( = ?auto_141546 ?auto_141547 ) ) ( not ( = ?auto_141546 ?auto_141548 ) ) ( not ( = ?auto_141547 ?auto_141548 ) ) ( ON ?auto_141548 ?auto_141549 ) ( not ( = ?auto_141545 ?auto_141549 ) ) ( not ( = ?auto_141546 ?auto_141549 ) ) ( not ( = ?auto_141547 ?auto_141549 ) ) ( not ( = ?auto_141548 ?auto_141549 ) ) ( ON ?auto_141547 ?auto_141548 ) ( ON-TABLE ?auto_141551 ) ( ON ?auto_141552 ?auto_141551 ) ( ON ?auto_141550 ?auto_141552 ) ( ON ?auto_141549 ?auto_141550 ) ( not ( = ?auto_141551 ?auto_141552 ) ) ( not ( = ?auto_141551 ?auto_141550 ) ) ( not ( = ?auto_141551 ?auto_141549 ) ) ( not ( = ?auto_141551 ?auto_141548 ) ) ( not ( = ?auto_141551 ?auto_141547 ) ) ( not ( = ?auto_141552 ?auto_141550 ) ) ( not ( = ?auto_141552 ?auto_141549 ) ) ( not ( = ?auto_141552 ?auto_141548 ) ) ( not ( = ?auto_141552 ?auto_141547 ) ) ( not ( = ?auto_141550 ?auto_141549 ) ) ( not ( = ?auto_141550 ?auto_141548 ) ) ( not ( = ?auto_141550 ?auto_141547 ) ) ( not ( = ?auto_141545 ?auto_141551 ) ) ( not ( = ?auto_141545 ?auto_141552 ) ) ( not ( = ?auto_141545 ?auto_141550 ) ) ( not ( = ?auto_141546 ?auto_141551 ) ) ( not ( = ?auto_141546 ?auto_141552 ) ) ( not ( = ?auto_141546 ?auto_141550 ) ) ( ON ?auto_141546 ?auto_141547 ) ( CLEAR ?auto_141546 ) ( HOLDING ?auto_141545 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141545 )
      ( MAKE-4PILE ?auto_141545 ?auto_141546 ?auto_141547 ?auto_141548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141553 - BLOCK
      ?auto_141554 - BLOCK
      ?auto_141555 - BLOCK
      ?auto_141556 - BLOCK
    )
    :vars
    (
      ?auto_141557 - BLOCK
      ?auto_141558 - BLOCK
      ?auto_141559 - BLOCK
      ?auto_141560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141553 ?auto_141554 ) ) ( not ( = ?auto_141553 ?auto_141555 ) ) ( not ( = ?auto_141553 ?auto_141556 ) ) ( not ( = ?auto_141554 ?auto_141555 ) ) ( not ( = ?auto_141554 ?auto_141556 ) ) ( not ( = ?auto_141555 ?auto_141556 ) ) ( ON ?auto_141556 ?auto_141557 ) ( not ( = ?auto_141553 ?auto_141557 ) ) ( not ( = ?auto_141554 ?auto_141557 ) ) ( not ( = ?auto_141555 ?auto_141557 ) ) ( not ( = ?auto_141556 ?auto_141557 ) ) ( ON ?auto_141555 ?auto_141556 ) ( ON-TABLE ?auto_141558 ) ( ON ?auto_141559 ?auto_141558 ) ( ON ?auto_141560 ?auto_141559 ) ( ON ?auto_141557 ?auto_141560 ) ( not ( = ?auto_141558 ?auto_141559 ) ) ( not ( = ?auto_141558 ?auto_141560 ) ) ( not ( = ?auto_141558 ?auto_141557 ) ) ( not ( = ?auto_141558 ?auto_141556 ) ) ( not ( = ?auto_141558 ?auto_141555 ) ) ( not ( = ?auto_141559 ?auto_141560 ) ) ( not ( = ?auto_141559 ?auto_141557 ) ) ( not ( = ?auto_141559 ?auto_141556 ) ) ( not ( = ?auto_141559 ?auto_141555 ) ) ( not ( = ?auto_141560 ?auto_141557 ) ) ( not ( = ?auto_141560 ?auto_141556 ) ) ( not ( = ?auto_141560 ?auto_141555 ) ) ( not ( = ?auto_141553 ?auto_141558 ) ) ( not ( = ?auto_141553 ?auto_141559 ) ) ( not ( = ?auto_141553 ?auto_141560 ) ) ( not ( = ?auto_141554 ?auto_141558 ) ) ( not ( = ?auto_141554 ?auto_141559 ) ) ( not ( = ?auto_141554 ?auto_141560 ) ) ( ON ?auto_141554 ?auto_141555 ) ( ON ?auto_141553 ?auto_141554 ) ( CLEAR ?auto_141553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141558 ?auto_141559 ?auto_141560 ?auto_141557 ?auto_141556 ?auto_141555 ?auto_141554 )
      ( MAKE-4PILE ?auto_141553 ?auto_141554 ?auto_141555 ?auto_141556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141565 - BLOCK
      ?auto_141566 - BLOCK
      ?auto_141567 - BLOCK
      ?auto_141568 - BLOCK
    )
    :vars
    (
      ?auto_141571 - BLOCK
      ?auto_141569 - BLOCK
      ?auto_141570 - BLOCK
      ?auto_141572 - BLOCK
      ?auto_141573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141565 ?auto_141566 ) ) ( not ( = ?auto_141565 ?auto_141567 ) ) ( not ( = ?auto_141565 ?auto_141568 ) ) ( not ( = ?auto_141566 ?auto_141567 ) ) ( not ( = ?auto_141566 ?auto_141568 ) ) ( not ( = ?auto_141567 ?auto_141568 ) ) ( ON ?auto_141568 ?auto_141571 ) ( not ( = ?auto_141565 ?auto_141571 ) ) ( not ( = ?auto_141566 ?auto_141571 ) ) ( not ( = ?auto_141567 ?auto_141571 ) ) ( not ( = ?auto_141568 ?auto_141571 ) ) ( ON ?auto_141567 ?auto_141568 ) ( ON-TABLE ?auto_141569 ) ( ON ?auto_141570 ?auto_141569 ) ( ON ?auto_141572 ?auto_141570 ) ( ON ?auto_141571 ?auto_141572 ) ( not ( = ?auto_141569 ?auto_141570 ) ) ( not ( = ?auto_141569 ?auto_141572 ) ) ( not ( = ?auto_141569 ?auto_141571 ) ) ( not ( = ?auto_141569 ?auto_141568 ) ) ( not ( = ?auto_141569 ?auto_141567 ) ) ( not ( = ?auto_141570 ?auto_141572 ) ) ( not ( = ?auto_141570 ?auto_141571 ) ) ( not ( = ?auto_141570 ?auto_141568 ) ) ( not ( = ?auto_141570 ?auto_141567 ) ) ( not ( = ?auto_141572 ?auto_141571 ) ) ( not ( = ?auto_141572 ?auto_141568 ) ) ( not ( = ?auto_141572 ?auto_141567 ) ) ( not ( = ?auto_141565 ?auto_141569 ) ) ( not ( = ?auto_141565 ?auto_141570 ) ) ( not ( = ?auto_141565 ?auto_141572 ) ) ( not ( = ?auto_141566 ?auto_141569 ) ) ( not ( = ?auto_141566 ?auto_141570 ) ) ( not ( = ?auto_141566 ?auto_141572 ) ) ( ON ?auto_141566 ?auto_141567 ) ( CLEAR ?auto_141566 ) ( ON ?auto_141565 ?auto_141573 ) ( CLEAR ?auto_141565 ) ( HAND-EMPTY ) ( not ( = ?auto_141565 ?auto_141573 ) ) ( not ( = ?auto_141566 ?auto_141573 ) ) ( not ( = ?auto_141567 ?auto_141573 ) ) ( not ( = ?auto_141568 ?auto_141573 ) ) ( not ( = ?auto_141571 ?auto_141573 ) ) ( not ( = ?auto_141569 ?auto_141573 ) ) ( not ( = ?auto_141570 ?auto_141573 ) ) ( not ( = ?auto_141572 ?auto_141573 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141565 ?auto_141573 )
      ( MAKE-4PILE ?auto_141565 ?auto_141566 ?auto_141567 ?auto_141568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141574 - BLOCK
      ?auto_141575 - BLOCK
      ?auto_141576 - BLOCK
      ?auto_141577 - BLOCK
    )
    :vars
    (
      ?auto_141581 - BLOCK
      ?auto_141578 - BLOCK
      ?auto_141579 - BLOCK
      ?auto_141582 - BLOCK
      ?auto_141580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141574 ?auto_141575 ) ) ( not ( = ?auto_141574 ?auto_141576 ) ) ( not ( = ?auto_141574 ?auto_141577 ) ) ( not ( = ?auto_141575 ?auto_141576 ) ) ( not ( = ?auto_141575 ?auto_141577 ) ) ( not ( = ?auto_141576 ?auto_141577 ) ) ( ON ?auto_141577 ?auto_141581 ) ( not ( = ?auto_141574 ?auto_141581 ) ) ( not ( = ?auto_141575 ?auto_141581 ) ) ( not ( = ?auto_141576 ?auto_141581 ) ) ( not ( = ?auto_141577 ?auto_141581 ) ) ( ON ?auto_141576 ?auto_141577 ) ( ON-TABLE ?auto_141578 ) ( ON ?auto_141579 ?auto_141578 ) ( ON ?auto_141582 ?auto_141579 ) ( ON ?auto_141581 ?auto_141582 ) ( not ( = ?auto_141578 ?auto_141579 ) ) ( not ( = ?auto_141578 ?auto_141582 ) ) ( not ( = ?auto_141578 ?auto_141581 ) ) ( not ( = ?auto_141578 ?auto_141577 ) ) ( not ( = ?auto_141578 ?auto_141576 ) ) ( not ( = ?auto_141579 ?auto_141582 ) ) ( not ( = ?auto_141579 ?auto_141581 ) ) ( not ( = ?auto_141579 ?auto_141577 ) ) ( not ( = ?auto_141579 ?auto_141576 ) ) ( not ( = ?auto_141582 ?auto_141581 ) ) ( not ( = ?auto_141582 ?auto_141577 ) ) ( not ( = ?auto_141582 ?auto_141576 ) ) ( not ( = ?auto_141574 ?auto_141578 ) ) ( not ( = ?auto_141574 ?auto_141579 ) ) ( not ( = ?auto_141574 ?auto_141582 ) ) ( not ( = ?auto_141575 ?auto_141578 ) ) ( not ( = ?auto_141575 ?auto_141579 ) ) ( not ( = ?auto_141575 ?auto_141582 ) ) ( ON ?auto_141574 ?auto_141580 ) ( CLEAR ?auto_141574 ) ( not ( = ?auto_141574 ?auto_141580 ) ) ( not ( = ?auto_141575 ?auto_141580 ) ) ( not ( = ?auto_141576 ?auto_141580 ) ) ( not ( = ?auto_141577 ?auto_141580 ) ) ( not ( = ?auto_141581 ?auto_141580 ) ) ( not ( = ?auto_141578 ?auto_141580 ) ) ( not ( = ?auto_141579 ?auto_141580 ) ) ( not ( = ?auto_141582 ?auto_141580 ) ) ( HOLDING ?auto_141575 ) ( CLEAR ?auto_141576 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141578 ?auto_141579 ?auto_141582 ?auto_141581 ?auto_141577 ?auto_141576 ?auto_141575 )
      ( MAKE-4PILE ?auto_141574 ?auto_141575 ?auto_141576 ?auto_141577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141583 - BLOCK
      ?auto_141584 - BLOCK
      ?auto_141585 - BLOCK
      ?auto_141586 - BLOCK
    )
    :vars
    (
      ?auto_141590 - BLOCK
      ?auto_141588 - BLOCK
      ?auto_141587 - BLOCK
      ?auto_141591 - BLOCK
      ?auto_141589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141583 ?auto_141584 ) ) ( not ( = ?auto_141583 ?auto_141585 ) ) ( not ( = ?auto_141583 ?auto_141586 ) ) ( not ( = ?auto_141584 ?auto_141585 ) ) ( not ( = ?auto_141584 ?auto_141586 ) ) ( not ( = ?auto_141585 ?auto_141586 ) ) ( ON ?auto_141586 ?auto_141590 ) ( not ( = ?auto_141583 ?auto_141590 ) ) ( not ( = ?auto_141584 ?auto_141590 ) ) ( not ( = ?auto_141585 ?auto_141590 ) ) ( not ( = ?auto_141586 ?auto_141590 ) ) ( ON ?auto_141585 ?auto_141586 ) ( ON-TABLE ?auto_141588 ) ( ON ?auto_141587 ?auto_141588 ) ( ON ?auto_141591 ?auto_141587 ) ( ON ?auto_141590 ?auto_141591 ) ( not ( = ?auto_141588 ?auto_141587 ) ) ( not ( = ?auto_141588 ?auto_141591 ) ) ( not ( = ?auto_141588 ?auto_141590 ) ) ( not ( = ?auto_141588 ?auto_141586 ) ) ( not ( = ?auto_141588 ?auto_141585 ) ) ( not ( = ?auto_141587 ?auto_141591 ) ) ( not ( = ?auto_141587 ?auto_141590 ) ) ( not ( = ?auto_141587 ?auto_141586 ) ) ( not ( = ?auto_141587 ?auto_141585 ) ) ( not ( = ?auto_141591 ?auto_141590 ) ) ( not ( = ?auto_141591 ?auto_141586 ) ) ( not ( = ?auto_141591 ?auto_141585 ) ) ( not ( = ?auto_141583 ?auto_141588 ) ) ( not ( = ?auto_141583 ?auto_141587 ) ) ( not ( = ?auto_141583 ?auto_141591 ) ) ( not ( = ?auto_141584 ?auto_141588 ) ) ( not ( = ?auto_141584 ?auto_141587 ) ) ( not ( = ?auto_141584 ?auto_141591 ) ) ( ON ?auto_141583 ?auto_141589 ) ( not ( = ?auto_141583 ?auto_141589 ) ) ( not ( = ?auto_141584 ?auto_141589 ) ) ( not ( = ?auto_141585 ?auto_141589 ) ) ( not ( = ?auto_141586 ?auto_141589 ) ) ( not ( = ?auto_141590 ?auto_141589 ) ) ( not ( = ?auto_141588 ?auto_141589 ) ) ( not ( = ?auto_141587 ?auto_141589 ) ) ( not ( = ?auto_141591 ?auto_141589 ) ) ( CLEAR ?auto_141585 ) ( ON ?auto_141584 ?auto_141583 ) ( CLEAR ?auto_141584 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141589 ?auto_141583 )
      ( MAKE-4PILE ?auto_141583 ?auto_141584 ?auto_141585 ?auto_141586 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141592 - BLOCK
      ?auto_141593 - BLOCK
      ?auto_141594 - BLOCK
      ?auto_141595 - BLOCK
    )
    :vars
    (
      ?auto_141597 - BLOCK
      ?auto_141600 - BLOCK
      ?auto_141596 - BLOCK
      ?auto_141599 - BLOCK
      ?auto_141598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141592 ?auto_141593 ) ) ( not ( = ?auto_141592 ?auto_141594 ) ) ( not ( = ?auto_141592 ?auto_141595 ) ) ( not ( = ?auto_141593 ?auto_141594 ) ) ( not ( = ?auto_141593 ?auto_141595 ) ) ( not ( = ?auto_141594 ?auto_141595 ) ) ( ON ?auto_141595 ?auto_141597 ) ( not ( = ?auto_141592 ?auto_141597 ) ) ( not ( = ?auto_141593 ?auto_141597 ) ) ( not ( = ?auto_141594 ?auto_141597 ) ) ( not ( = ?auto_141595 ?auto_141597 ) ) ( ON-TABLE ?auto_141600 ) ( ON ?auto_141596 ?auto_141600 ) ( ON ?auto_141599 ?auto_141596 ) ( ON ?auto_141597 ?auto_141599 ) ( not ( = ?auto_141600 ?auto_141596 ) ) ( not ( = ?auto_141600 ?auto_141599 ) ) ( not ( = ?auto_141600 ?auto_141597 ) ) ( not ( = ?auto_141600 ?auto_141595 ) ) ( not ( = ?auto_141600 ?auto_141594 ) ) ( not ( = ?auto_141596 ?auto_141599 ) ) ( not ( = ?auto_141596 ?auto_141597 ) ) ( not ( = ?auto_141596 ?auto_141595 ) ) ( not ( = ?auto_141596 ?auto_141594 ) ) ( not ( = ?auto_141599 ?auto_141597 ) ) ( not ( = ?auto_141599 ?auto_141595 ) ) ( not ( = ?auto_141599 ?auto_141594 ) ) ( not ( = ?auto_141592 ?auto_141600 ) ) ( not ( = ?auto_141592 ?auto_141596 ) ) ( not ( = ?auto_141592 ?auto_141599 ) ) ( not ( = ?auto_141593 ?auto_141600 ) ) ( not ( = ?auto_141593 ?auto_141596 ) ) ( not ( = ?auto_141593 ?auto_141599 ) ) ( ON ?auto_141592 ?auto_141598 ) ( not ( = ?auto_141592 ?auto_141598 ) ) ( not ( = ?auto_141593 ?auto_141598 ) ) ( not ( = ?auto_141594 ?auto_141598 ) ) ( not ( = ?auto_141595 ?auto_141598 ) ) ( not ( = ?auto_141597 ?auto_141598 ) ) ( not ( = ?auto_141600 ?auto_141598 ) ) ( not ( = ?auto_141596 ?auto_141598 ) ) ( not ( = ?auto_141599 ?auto_141598 ) ) ( ON ?auto_141593 ?auto_141592 ) ( CLEAR ?auto_141593 ) ( ON-TABLE ?auto_141598 ) ( HOLDING ?auto_141594 ) ( CLEAR ?auto_141595 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141600 ?auto_141596 ?auto_141599 ?auto_141597 ?auto_141595 ?auto_141594 )
      ( MAKE-4PILE ?auto_141592 ?auto_141593 ?auto_141594 ?auto_141595 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141601 - BLOCK
      ?auto_141602 - BLOCK
      ?auto_141603 - BLOCK
      ?auto_141604 - BLOCK
    )
    :vars
    (
      ?auto_141605 - BLOCK
      ?auto_141609 - BLOCK
      ?auto_141606 - BLOCK
      ?auto_141607 - BLOCK
      ?auto_141608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141601 ?auto_141602 ) ) ( not ( = ?auto_141601 ?auto_141603 ) ) ( not ( = ?auto_141601 ?auto_141604 ) ) ( not ( = ?auto_141602 ?auto_141603 ) ) ( not ( = ?auto_141602 ?auto_141604 ) ) ( not ( = ?auto_141603 ?auto_141604 ) ) ( ON ?auto_141604 ?auto_141605 ) ( not ( = ?auto_141601 ?auto_141605 ) ) ( not ( = ?auto_141602 ?auto_141605 ) ) ( not ( = ?auto_141603 ?auto_141605 ) ) ( not ( = ?auto_141604 ?auto_141605 ) ) ( ON-TABLE ?auto_141609 ) ( ON ?auto_141606 ?auto_141609 ) ( ON ?auto_141607 ?auto_141606 ) ( ON ?auto_141605 ?auto_141607 ) ( not ( = ?auto_141609 ?auto_141606 ) ) ( not ( = ?auto_141609 ?auto_141607 ) ) ( not ( = ?auto_141609 ?auto_141605 ) ) ( not ( = ?auto_141609 ?auto_141604 ) ) ( not ( = ?auto_141609 ?auto_141603 ) ) ( not ( = ?auto_141606 ?auto_141607 ) ) ( not ( = ?auto_141606 ?auto_141605 ) ) ( not ( = ?auto_141606 ?auto_141604 ) ) ( not ( = ?auto_141606 ?auto_141603 ) ) ( not ( = ?auto_141607 ?auto_141605 ) ) ( not ( = ?auto_141607 ?auto_141604 ) ) ( not ( = ?auto_141607 ?auto_141603 ) ) ( not ( = ?auto_141601 ?auto_141609 ) ) ( not ( = ?auto_141601 ?auto_141606 ) ) ( not ( = ?auto_141601 ?auto_141607 ) ) ( not ( = ?auto_141602 ?auto_141609 ) ) ( not ( = ?auto_141602 ?auto_141606 ) ) ( not ( = ?auto_141602 ?auto_141607 ) ) ( ON ?auto_141601 ?auto_141608 ) ( not ( = ?auto_141601 ?auto_141608 ) ) ( not ( = ?auto_141602 ?auto_141608 ) ) ( not ( = ?auto_141603 ?auto_141608 ) ) ( not ( = ?auto_141604 ?auto_141608 ) ) ( not ( = ?auto_141605 ?auto_141608 ) ) ( not ( = ?auto_141609 ?auto_141608 ) ) ( not ( = ?auto_141606 ?auto_141608 ) ) ( not ( = ?auto_141607 ?auto_141608 ) ) ( ON ?auto_141602 ?auto_141601 ) ( ON-TABLE ?auto_141608 ) ( CLEAR ?auto_141604 ) ( ON ?auto_141603 ?auto_141602 ) ( CLEAR ?auto_141603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141608 ?auto_141601 ?auto_141602 )
      ( MAKE-4PILE ?auto_141601 ?auto_141602 ?auto_141603 ?auto_141604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141610 - BLOCK
      ?auto_141611 - BLOCK
      ?auto_141612 - BLOCK
      ?auto_141613 - BLOCK
    )
    :vars
    (
      ?auto_141616 - BLOCK
      ?auto_141617 - BLOCK
      ?auto_141618 - BLOCK
      ?auto_141615 - BLOCK
      ?auto_141614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141610 ?auto_141611 ) ) ( not ( = ?auto_141610 ?auto_141612 ) ) ( not ( = ?auto_141610 ?auto_141613 ) ) ( not ( = ?auto_141611 ?auto_141612 ) ) ( not ( = ?auto_141611 ?auto_141613 ) ) ( not ( = ?auto_141612 ?auto_141613 ) ) ( not ( = ?auto_141610 ?auto_141616 ) ) ( not ( = ?auto_141611 ?auto_141616 ) ) ( not ( = ?auto_141612 ?auto_141616 ) ) ( not ( = ?auto_141613 ?auto_141616 ) ) ( ON-TABLE ?auto_141617 ) ( ON ?auto_141618 ?auto_141617 ) ( ON ?auto_141615 ?auto_141618 ) ( ON ?auto_141616 ?auto_141615 ) ( not ( = ?auto_141617 ?auto_141618 ) ) ( not ( = ?auto_141617 ?auto_141615 ) ) ( not ( = ?auto_141617 ?auto_141616 ) ) ( not ( = ?auto_141617 ?auto_141613 ) ) ( not ( = ?auto_141617 ?auto_141612 ) ) ( not ( = ?auto_141618 ?auto_141615 ) ) ( not ( = ?auto_141618 ?auto_141616 ) ) ( not ( = ?auto_141618 ?auto_141613 ) ) ( not ( = ?auto_141618 ?auto_141612 ) ) ( not ( = ?auto_141615 ?auto_141616 ) ) ( not ( = ?auto_141615 ?auto_141613 ) ) ( not ( = ?auto_141615 ?auto_141612 ) ) ( not ( = ?auto_141610 ?auto_141617 ) ) ( not ( = ?auto_141610 ?auto_141618 ) ) ( not ( = ?auto_141610 ?auto_141615 ) ) ( not ( = ?auto_141611 ?auto_141617 ) ) ( not ( = ?auto_141611 ?auto_141618 ) ) ( not ( = ?auto_141611 ?auto_141615 ) ) ( ON ?auto_141610 ?auto_141614 ) ( not ( = ?auto_141610 ?auto_141614 ) ) ( not ( = ?auto_141611 ?auto_141614 ) ) ( not ( = ?auto_141612 ?auto_141614 ) ) ( not ( = ?auto_141613 ?auto_141614 ) ) ( not ( = ?auto_141616 ?auto_141614 ) ) ( not ( = ?auto_141617 ?auto_141614 ) ) ( not ( = ?auto_141618 ?auto_141614 ) ) ( not ( = ?auto_141615 ?auto_141614 ) ) ( ON ?auto_141611 ?auto_141610 ) ( ON-TABLE ?auto_141614 ) ( ON ?auto_141612 ?auto_141611 ) ( CLEAR ?auto_141612 ) ( HOLDING ?auto_141613 ) ( CLEAR ?auto_141616 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141617 ?auto_141618 ?auto_141615 ?auto_141616 ?auto_141613 )
      ( MAKE-4PILE ?auto_141610 ?auto_141611 ?auto_141612 ?auto_141613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141619 - BLOCK
      ?auto_141620 - BLOCK
      ?auto_141621 - BLOCK
      ?auto_141622 - BLOCK
    )
    :vars
    (
      ?auto_141624 - BLOCK
      ?auto_141623 - BLOCK
      ?auto_141626 - BLOCK
      ?auto_141627 - BLOCK
      ?auto_141625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141619 ?auto_141620 ) ) ( not ( = ?auto_141619 ?auto_141621 ) ) ( not ( = ?auto_141619 ?auto_141622 ) ) ( not ( = ?auto_141620 ?auto_141621 ) ) ( not ( = ?auto_141620 ?auto_141622 ) ) ( not ( = ?auto_141621 ?auto_141622 ) ) ( not ( = ?auto_141619 ?auto_141624 ) ) ( not ( = ?auto_141620 ?auto_141624 ) ) ( not ( = ?auto_141621 ?auto_141624 ) ) ( not ( = ?auto_141622 ?auto_141624 ) ) ( ON-TABLE ?auto_141623 ) ( ON ?auto_141626 ?auto_141623 ) ( ON ?auto_141627 ?auto_141626 ) ( ON ?auto_141624 ?auto_141627 ) ( not ( = ?auto_141623 ?auto_141626 ) ) ( not ( = ?auto_141623 ?auto_141627 ) ) ( not ( = ?auto_141623 ?auto_141624 ) ) ( not ( = ?auto_141623 ?auto_141622 ) ) ( not ( = ?auto_141623 ?auto_141621 ) ) ( not ( = ?auto_141626 ?auto_141627 ) ) ( not ( = ?auto_141626 ?auto_141624 ) ) ( not ( = ?auto_141626 ?auto_141622 ) ) ( not ( = ?auto_141626 ?auto_141621 ) ) ( not ( = ?auto_141627 ?auto_141624 ) ) ( not ( = ?auto_141627 ?auto_141622 ) ) ( not ( = ?auto_141627 ?auto_141621 ) ) ( not ( = ?auto_141619 ?auto_141623 ) ) ( not ( = ?auto_141619 ?auto_141626 ) ) ( not ( = ?auto_141619 ?auto_141627 ) ) ( not ( = ?auto_141620 ?auto_141623 ) ) ( not ( = ?auto_141620 ?auto_141626 ) ) ( not ( = ?auto_141620 ?auto_141627 ) ) ( ON ?auto_141619 ?auto_141625 ) ( not ( = ?auto_141619 ?auto_141625 ) ) ( not ( = ?auto_141620 ?auto_141625 ) ) ( not ( = ?auto_141621 ?auto_141625 ) ) ( not ( = ?auto_141622 ?auto_141625 ) ) ( not ( = ?auto_141624 ?auto_141625 ) ) ( not ( = ?auto_141623 ?auto_141625 ) ) ( not ( = ?auto_141626 ?auto_141625 ) ) ( not ( = ?auto_141627 ?auto_141625 ) ) ( ON ?auto_141620 ?auto_141619 ) ( ON-TABLE ?auto_141625 ) ( ON ?auto_141621 ?auto_141620 ) ( CLEAR ?auto_141624 ) ( ON ?auto_141622 ?auto_141621 ) ( CLEAR ?auto_141622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141625 ?auto_141619 ?auto_141620 ?auto_141621 )
      ( MAKE-4PILE ?auto_141619 ?auto_141620 ?auto_141621 ?auto_141622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141628 - BLOCK
      ?auto_141629 - BLOCK
      ?auto_141630 - BLOCK
      ?auto_141631 - BLOCK
    )
    :vars
    (
      ?auto_141633 - BLOCK
      ?auto_141636 - BLOCK
      ?auto_141632 - BLOCK
      ?auto_141634 - BLOCK
      ?auto_141635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141628 ?auto_141629 ) ) ( not ( = ?auto_141628 ?auto_141630 ) ) ( not ( = ?auto_141628 ?auto_141631 ) ) ( not ( = ?auto_141629 ?auto_141630 ) ) ( not ( = ?auto_141629 ?auto_141631 ) ) ( not ( = ?auto_141630 ?auto_141631 ) ) ( not ( = ?auto_141628 ?auto_141633 ) ) ( not ( = ?auto_141629 ?auto_141633 ) ) ( not ( = ?auto_141630 ?auto_141633 ) ) ( not ( = ?auto_141631 ?auto_141633 ) ) ( ON-TABLE ?auto_141636 ) ( ON ?auto_141632 ?auto_141636 ) ( ON ?auto_141634 ?auto_141632 ) ( not ( = ?auto_141636 ?auto_141632 ) ) ( not ( = ?auto_141636 ?auto_141634 ) ) ( not ( = ?auto_141636 ?auto_141633 ) ) ( not ( = ?auto_141636 ?auto_141631 ) ) ( not ( = ?auto_141636 ?auto_141630 ) ) ( not ( = ?auto_141632 ?auto_141634 ) ) ( not ( = ?auto_141632 ?auto_141633 ) ) ( not ( = ?auto_141632 ?auto_141631 ) ) ( not ( = ?auto_141632 ?auto_141630 ) ) ( not ( = ?auto_141634 ?auto_141633 ) ) ( not ( = ?auto_141634 ?auto_141631 ) ) ( not ( = ?auto_141634 ?auto_141630 ) ) ( not ( = ?auto_141628 ?auto_141636 ) ) ( not ( = ?auto_141628 ?auto_141632 ) ) ( not ( = ?auto_141628 ?auto_141634 ) ) ( not ( = ?auto_141629 ?auto_141636 ) ) ( not ( = ?auto_141629 ?auto_141632 ) ) ( not ( = ?auto_141629 ?auto_141634 ) ) ( ON ?auto_141628 ?auto_141635 ) ( not ( = ?auto_141628 ?auto_141635 ) ) ( not ( = ?auto_141629 ?auto_141635 ) ) ( not ( = ?auto_141630 ?auto_141635 ) ) ( not ( = ?auto_141631 ?auto_141635 ) ) ( not ( = ?auto_141633 ?auto_141635 ) ) ( not ( = ?auto_141636 ?auto_141635 ) ) ( not ( = ?auto_141632 ?auto_141635 ) ) ( not ( = ?auto_141634 ?auto_141635 ) ) ( ON ?auto_141629 ?auto_141628 ) ( ON-TABLE ?auto_141635 ) ( ON ?auto_141630 ?auto_141629 ) ( ON ?auto_141631 ?auto_141630 ) ( CLEAR ?auto_141631 ) ( HOLDING ?auto_141633 ) ( CLEAR ?auto_141634 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141636 ?auto_141632 ?auto_141634 ?auto_141633 )
      ( MAKE-4PILE ?auto_141628 ?auto_141629 ?auto_141630 ?auto_141631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141637 - BLOCK
      ?auto_141638 - BLOCK
      ?auto_141639 - BLOCK
      ?auto_141640 - BLOCK
    )
    :vars
    (
      ?auto_141641 - BLOCK
      ?auto_141645 - BLOCK
      ?auto_141643 - BLOCK
      ?auto_141644 - BLOCK
      ?auto_141642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141637 ?auto_141638 ) ) ( not ( = ?auto_141637 ?auto_141639 ) ) ( not ( = ?auto_141637 ?auto_141640 ) ) ( not ( = ?auto_141638 ?auto_141639 ) ) ( not ( = ?auto_141638 ?auto_141640 ) ) ( not ( = ?auto_141639 ?auto_141640 ) ) ( not ( = ?auto_141637 ?auto_141641 ) ) ( not ( = ?auto_141638 ?auto_141641 ) ) ( not ( = ?auto_141639 ?auto_141641 ) ) ( not ( = ?auto_141640 ?auto_141641 ) ) ( ON-TABLE ?auto_141645 ) ( ON ?auto_141643 ?auto_141645 ) ( ON ?auto_141644 ?auto_141643 ) ( not ( = ?auto_141645 ?auto_141643 ) ) ( not ( = ?auto_141645 ?auto_141644 ) ) ( not ( = ?auto_141645 ?auto_141641 ) ) ( not ( = ?auto_141645 ?auto_141640 ) ) ( not ( = ?auto_141645 ?auto_141639 ) ) ( not ( = ?auto_141643 ?auto_141644 ) ) ( not ( = ?auto_141643 ?auto_141641 ) ) ( not ( = ?auto_141643 ?auto_141640 ) ) ( not ( = ?auto_141643 ?auto_141639 ) ) ( not ( = ?auto_141644 ?auto_141641 ) ) ( not ( = ?auto_141644 ?auto_141640 ) ) ( not ( = ?auto_141644 ?auto_141639 ) ) ( not ( = ?auto_141637 ?auto_141645 ) ) ( not ( = ?auto_141637 ?auto_141643 ) ) ( not ( = ?auto_141637 ?auto_141644 ) ) ( not ( = ?auto_141638 ?auto_141645 ) ) ( not ( = ?auto_141638 ?auto_141643 ) ) ( not ( = ?auto_141638 ?auto_141644 ) ) ( ON ?auto_141637 ?auto_141642 ) ( not ( = ?auto_141637 ?auto_141642 ) ) ( not ( = ?auto_141638 ?auto_141642 ) ) ( not ( = ?auto_141639 ?auto_141642 ) ) ( not ( = ?auto_141640 ?auto_141642 ) ) ( not ( = ?auto_141641 ?auto_141642 ) ) ( not ( = ?auto_141645 ?auto_141642 ) ) ( not ( = ?auto_141643 ?auto_141642 ) ) ( not ( = ?auto_141644 ?auto_141642 ) ) ( ON ?auto_141638 ?auto_141637 ) ( ON-TABLE ?auto_141642 ) ( ON ?auto_141639 ?auto_141638 ) ( ON ?auto_141640 ?auto_141639 ) ( CLEAR ?auto_141644 ) ( ON ?auto_141641 ?auto_141640 ) ( CLEAR ?auto_141641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141642 ?auto_141637 ?auto_141638 ?auto_141639 ?auto_141640 )
      ( MAKE-4PILE ?auto_141637 ?auto_141638 ?auto_141639 ?auto_141640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141646 - BLOCK
      ?auto_141647 - BLOCK
      ?auto_141648 - BLOCK
      ?auto_141649 - BLOCK
    )
    :vars
    (
      ?auto_141652 - BLOCK
      ?auto_141651 - BLOCK
      ?auto_141650 - BLOCK
      ?auto_141653 - BLOCK
      ?auto_141654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141646 ?auto_141647 ) ) ( not ( = ?auto_141646 ?auto_141648 ) ) ( not ( = ?auto_141646 ?auto_141649 ) ) ( not ( = ?auto_141647 ?auto_141648 ) ) ( not ( = ?auto_141647 ?auto_141649 ) ) ( not ( = ?auto_141648 ?auto_141649 ) ) ( not ( = ?auto_141646 ?auto_141652 ) ) ( not ( = ?auto_141647 ?auto_141652 ) ) ( not ( = ?auto_141648 ?auto_141652 ) ) ( not ( = ?auto_141649 ?auto_141652 ) ) ( ON-TABLE ?auto_141651 ) ( ON ?auto_141650 ?auto_141651 ) ( not ( = ?auto_141651 ?auto_141650 ) ) ( not ( = ?auto_141651 ?auto_141653 ) ) ( not ( = ?auto_141651 ?auto_141652 ) ) ( not ( = ?auto_141651 ?auto_141649 ) ) ( not ( = ?auto_141651 ?auto_141648 ) ) ( not ( = ?auto_141650 ?auto_141653 ) ) ( not ( = ?auto_141650 ?auto_141652 ) ) ( not ( = ?auto_141650 ?auto_141649 ) ) ( not ( = ?auto_141650 ?auto_141648 ) ) ( not ( = ?auto_141653 ?auto_141652 ) ) ( not ( = ?auto_141653 ?auto_141649 ) ) ( not ( = ?auto_141653 ?auto_141648 ) ) ( not ( = ?auto_141646 ?auto_141651 ) ) ( not ( = ?auto_141646 ?auto_141650 ) ) ( not ( = ?auto_141646 ?auto_141653 ) ) ( not ( = ?auto_141647 ?auto_141651 ) ) ( not ( = ?auto_141647 ?auto_141650 ) ) ( not ( = ?auto_141647 ?auto_141653 ) ) ( ON ?auto_141646 ?auto_141654 ) ( not ( = ?auto_141646 ?auto_141654 ) ) ( not ( = ?auto_141647 ?auto_141654 ) ) ( not ( = ?auto_141648 ?auto_141654 ) ) ( not ( = ?auto_141649 ?auto_141654 ) ) ( not ( = ?auto_141652 ?auto_141654 ) ) ( not ( = ?auto_141651 ?auto_141654 ) ) ( not ( = ?auto_141650 ?auto_141654 ) ) ( not ( = ?auto_141653 ?auto_141654 ) ) ( ON ?auto_141647 ?auto_141646 ) ( ON-TABLE ?auto_141654 ) ( ON ?auto_141648 ?auto_141647 ) ( ON ?auto_141649 ?auto_141648 ) ( ON ?auto_141652 ?auto_141649 ) ( CLEAR ?auto_141652 ) ( HOLDING ?auto_141653 ) ( CLEAR ?auto_141650 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141651 ?auto_141650 ?auto_141653 )
      ( MAKE-4PILE ?auto_141646 ?auto_141647 ?auto_141648 ?auto_141649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141655 - BLOCK
      ?auto_141656 - BLOCK
      ?auto_141657 - BLOCK
      ?auto_141658 - BLOCK
    )
    :vars
    (
      ?auto_141663 - BLOCK
      ?auto_141661 - BLOCK
      ?auto_141660 - BLOCK
      ?auto_141662 - BLOCK
      ?auto_141659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141655 ?auto_141656 ) ) ( not ( = ?auto_141655 ?auto_141657 ) ) ( not ( = ?auto_141655 ?auto_141658 ) ) ( not ( = ?auto_141656 ?auto_141657 ) ) ( not ( = ?auto_141656 ?auto_141658 ) ) ( not ( = ?auto_141657 ?auto_141658 ) ) ( not ( = ?auto_141655 ?auto_141663 ) ) ( not ( = ?auto_141656 ?auto_141663 ) ) ( not ( = ?auto_141657 ?auto_141663 ) ) ( not ( = ?auto_141658 ?auto_141663 ) ) ( ON-TABLE ?auto_141661 ) ( ON ?auto_141660 ?auto_141661 ) ( not ( = ?auto_141661 ?auto_141660 ) ) ( not ( = ?auto_141661 ?auto_141662 ) ) ( not ( = ?auto_141661 ?auto_141663 ) ) ( not ( = ?auto_141661 ?auto_141658 ) ) ( not ( = ?auto_141661 ?auto_141657 ) ) ( not ( = ?auto_141660 ?auto_141662 ) ) ( not ( = ?auto_141660 ?auto_141663 ) ) ( not ( = ?auto_141660 ?auto_141658 ) ) ( not ( = ?auto_141660 ?auto_141657 ) ) ( not ( = ?auto_141662 ?auto_141663 ) ) ( not ( = ?auto_141662 ?auto_141658 ) ) ( not ( = ?auto_141662 ?auto_141657 ) ) ( not ( = ?auto_141655 ?auto_141661 ) ) ( not ( = ?auto_141655 ?auto_141660 ) ) ( not ( = ?auto_141655 ?auto_141662 ) ) ( not ( = ?auto_141656 ?auto_141661 ) ) ( not ( = ?auto_141656 ?auto_141660 ) ) ( not ( = ?auto_141656 ?auto_141662 ) ) ( ON ?auto_141655 ?auto_141659 ) ( not ( = ?auto_141655 ?auto_141659 ) ) ( not ( = ?auto_141656 ?auto_141659 ) ) ( not ( = ?auto_141657 ?auto_141659 ) ) ( not ( = ?auto_141658 ?auto_141659 ) ) ( not ( = ?auto_141663 ?auto_141659 ) ) ( not ( = ?auto_141661 ?auto_141659 ) ) ( not ( = ?auto_141660 ?auto_141659 ) ) ( not ( = ?auto_141662 ?auto_141659 ) ) ( ON ?auto_141656 ?auto_141655 ) ( ON-TABLE ?auto_141659 ) ( ON ?auto_141657 ?auto_141656 ) ( ON ?auto_141658 ?auto_141657 ) ( ON ?auto_141663 ?auto_141658 ) ( CLEAR ?auto_141660 ) ( ON ?auto_141662 ?auto_141663 ) ( CLEAR ?auto_141662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141659 ?auto_141655 ?auto_141656 ?auto_141657 ?auto_141658 ?auto_141663 )
      ( MAKE-4PILE ?auto_141655 ?auto_141656 ?auto_141657 ?auto_141658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141664 - BLOCK
      ?auto_141665 - BLOCK
      ?auto_141666 - BLOCK
      ?auto_141667 - BLOCK
    )
    :vars
    (
      ?auto_141670 - BLOCK
      ?auto_141668 - BLOCK
      ?auto_141669 - BLOCK
      ?auto_141671 - BLOCK
      ?auto_141672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141664 ?auto_141665 ) ) ( not ( = ?auto_141664 ?auto_141666 ) ) ( not ( = ?auto_141664 ?auto_141667 ) ) ( not ( = ?auto_141665 ?auto_141666 ) ) ( not ( = ?auto_141665 ?auto_141667 ) ) ( not ( = ?auto_141666 ?auto_141667 ) ) ( not ( = ?auto_141664 ?auto_141670 ) ) ( not ( = ?auto_141665 ?auto_141670 ) ) ( not ( = ?auto_141666 ?auto_141670 ) ) ( not ( = ?auto_141667 ?auto_141670 ) ) ( ON-TABLE ?auto_141668 ) ( not ( = ?auto_141668 ?auto_141669 ) ) ( not ( = ?auto_141668 ?auto_141671 ) ) ( not ( = ?auto_141668 ?auto_141670 ) ) ( not ( = ?auto_141668 ?auto_141667 ) ) ( not ( = ?auto_141668 ?auto_141666 ) ) ( not ( = ?auto_141669 ?auto_141671 ) ) ( not ( = ?auto_141669 ?auto_141670 ) ) ( not ( = ?auto_141669 ?auto_141667 ) ) ( not ( = ?auto_141669 ?auto_141666 ) ) ( not ( = ?auto_141671 ?auto_141670 ) ) ( not ( = ?auto_141671 ?auto_141667 ) ) ( not ( = ?auto_141671 ?auto_141666 ) ) ( not ( = ?auto_141664 ?auto_141668 ) ) ( not ( = ?auto_141664 ?auto_141669 ) ) ( not ( = ?auto_141664 ?auto_141671 ) ) ( not ( = ?auto_141665 ?auto_141668 ) ) ( not ( = ?auto_141665 ?auto_141669 ) ) ( not ( = ?auto_141665 ?auto_141671 ) ) ( ON ?auto_141664 ?auto_141672 ) ( not ( = ?auto_141664 ?auto_141672 ) ) ( not ( = ?auto_141665 ?auto_141672 ) ) ( not ( = ?auto_141666 ?auto_141672 ) ) ( not ( = ?auto_141667 ?auto_141672 ) ) ( not ( = ?auto_141670 ?auto_141672 ) ) ( not ( = ?auto_141668 ?auto_141672 ) ) ( not ( = ?auto_141669 ?auto_141672 ) ) ( not ( = ?auto_141671 ?auto_141672 ) ) ( ON ?auto_141665 ?auto_141664 ) ( ON-TABLE ?auto_141672 ) ( ON ?auto_141666 ?auto_141665 ) ( ON ?auto_141667 ?auto_141666 ) ( ON ?auto_141670 ?auto_141667 ) ( ON ?auto_141671 ?auto_141670 ) ( CLEAR ?auto_141671 ) ( HOLDING ?auto_141669 ) ( CLEAR ?auto_141668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141668 ?auto_141669 )
      ( MAKE-4PILE ?auto_141664 ?auto_141665 ?auto_141666 ?auto_141667 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141673 - BLOCK
      ?auto_141674 - BLOCK
      ?auto_141675 - BLOCK
      ?auto_141676 - BLOCK
    )
    :vars
    (
      ?auto_141679 - BLOCK
      ?auto_141681 - BLOCK
      ?auto_141678 - BLOCK
      ?auto_141677 - BLOCK
      ?auto_141680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141673 ?auto_141674 ) ) ( not ( = ?auto_141673 ?auto_141675 ) ) ( not ( = ?auto_141673 ?auto_141676 ) ) ( not ( = ?auto_141674 ?auto_141675 ) ) ( not ( = ?auto_141674 ?auto_141676 ) ) ( not ( = ?auto_141675 ?auto_141676 ) ) ( not ( = ?auto_141673 ?auto_141679 ) ) ( not ( = ?auto_141674 ?auto_141679 ) ) ( not ( = ?auto_141675 ?auto_141679 ) ) ( not ( = ?auto_141676 ?auto_141679 ) ) ( ON-TABLE ?auto_141681 ) ( not ( = ?auto_141681 ?auto_141678 ) ) ( not ( = ?auto_141681 ?auto_141677 ) ) ( not ( = ?auto_141681 ?auto_141679 ) ) ( not ( = ?auto_141681 ?auto_141676 ) ) ( not ( = ?auto_141681 ?auto_141675 ) ) ( not ( = ?auto_141678 ?auto_141677 ) ) ( not ( = ?auto_141678 ?auto_141679 ) ) ( not ( = ?auto_141678 ?auto_141676 ) ) ( not ( = ?auto_141678 ?auto_141675 ) ) ( not ( = ?auto_141677 ?auto_141679 ) ) ( not ( = ?auto_141677 ?auto_141676 ) ) ( not ( = ?auto_141677 ?auto_141675 ) ) ( not ( = ?auto_141673 ?auto_141681 ) ) ( not ( = ?auto_141673 ?auto_141678 ) ) ( not ( = ?auto_141673 ?auto_141677 ) ) ( not ( = ?auto_141674 ?auto_141681 ) ) ( not ( = ?auto_141674 ?auto_141678 ) ) ( not ( = ?auto_141674 ?auto_141677 ) ) ( ON ?auto_141673 ?auto_141680 ) ( not ( = ?auto_141673 ?auto_141680 ) ) ( not ( = ?auto_141674 ?auto_141680 ) ) ( not ( = ?auto_141675 ?auto_141680 ) ) ( not ( = ?auto_141676 ?auto_141680 ) ) ( not ( = ?auto_141679 ?auto_141680 ) ) ( not ( = ?auto_141681 ?auto_141680 ) ) ( not ( = ?auto_141678 ?auto_141680 ) ) ( not ( = ?auto_141677 ?auto_141680 ) ) ( ON ?auto_141674 ?auto_141673 ) ( ON-TABLE ?auto_141680 ) ( ON ?auto_141675 ?auto_141674 ) ( ON ?auto_141676 ?auto_141675 ) ( ON ?auto_141679 ?auto_141676 ) ( ON ?auto_141677 ?auto_141679 ) ( CLEAR ?auto_141681 ) ( ON ?auto_141678 ?auto_141677 ) ( CLEAR ?auto_141678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141680 ?auto_141673 ?auto_141674 ?auto_141675 ?auto_141676 ?auto_141679 ?auto_141677 )
      ( MAKE-4PILE ?auto_141673 ?auto_141674 ?auto_141675 ?auto_141676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141682 - BLOCK
      ?auto_141683 - BLOCK
      ?auto_141684 - BLOCK
      ?auto_141685 - BLOCK
    )
    :vars
    (
      ?auto_141688 - BLOCK
      ?auto_141690 - BLOCK
      ?auto_141687 - BLOCK
      ?auto_141689 - BLOCK
      ?auto_141686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141682 ?auto_141683 ) ) ( not ( = ?auto_141682 ?auto_141684 ) ) ( not ( = ?auto_141682 ?auto_141685 ) ) ( not ( = ?auto_141683 ?auto_141684 ) ) ( not ( = ?auto_141683 ?auto_141685 ) ) ( not ( = ?auto_141684 ?auto_141685 ) ) ( not ( = ?auto_141682 ?auto_141688 ) ) ( not ( = ?auto_141683 ?auto_141688 ) ) ( not ( = ?auto_141684 ?auto_141688 ) ) ( not ( = ?auto_141685 ?auto_141688 ) ) ( not ( = ?auto_141690 ?auto_141687 ) ) ( not ( = ?auto_141690 ?auto_141689 ) ) ( not ( = ?auto_141690 ?auto_141688 ) ) ( not ( = ?auto_141690 ?auto_141685 ) ) ( not ( = ?auto_141690 ?auto_141684 ) ) ( not ( = ?auto_141687 ?auto_141689 ) ) ( not ( = ?auto_141687 ?auto_141688 ) ) ( not ( = ?auto_141687 ?auto_141685 ) ) ( not ( = ?auto_141687 ?auto_141684 ) ) ( not ( = ?auto_141689 ?auto_141688 ) ) ( not ( = ?auto_141689 ?auto_141685 ) ) ( not ( = ?auto_141689 ?auto_141684 ) ) ( not ( = ?auto_141682 ?auto_141690 ) ) ( not ( = ?auto_141682 ?auto_141687 ) ) ( not ( = ?auto_141682 ?auto_141689 ) ) ( not ( = ?auto_141683 ?auto_141690 ) ) ( not ( = ?auto_141683 ?auto_141687 ) ) ( not ( = ?auto_141683 ?auto_141689 ) ) ( ON ?auto_141682 ?auto_141686 ) ( not ( = ?auto_141682 ?auto_141686 ) ) ( not ( = ?auto_141683 ?auto_141686 ) ) ( not ( = ?auto_141684 ?auto_141686 ) ) ( not ( = ?auto_141685 ?auto_141686 ) ) ( not ( = ?auto_141688 ?auto_141686 ) ) ( not ( = ?auto_141690 ?auto_141686 ) ) ( not ( = ?auto_141687 ?auto_141686 ) ) ( not ( = ?auto_141689 ?auto_141686 ) ) ( ON ?auto_141683 ?auto_141682 ) ( ON-TABLE ?auto_141686 ) ( ON ?auto_141684 ?auto_141683 ) ( ON ?auto_141685 ?auto_141684 ) ( ON ?auto_141688 ?auto_141685 ) ( ON ?auto_141689 ?auto_141688 ) ( ON ?auto_141687 ?auto_141689 ) ( CLEAR ?auto_141687 ) ( HOLDING ?auto_141690 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141690 )
      ( MAKE-4PILE ?auto_141682 ?auto_141683 ?auto_141684 ?auto_141685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_141691 - BLOCK
      ?auto_141692 - BLOCK
      ?auto_141693 - BLOCK
      ?auto_141694 - BLOCK
    )
    :vars
    (
      ?auto_141699 - BLOCK
      ?auto_141697 - BLOCK
      ?auto_141696 - BLOCK
      ?auto_141695 - BLOCK
      ?auto_141698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141691 ?auto_141692 ) ) ( not ( = ?auto_141691 ?auto_141693 ) ) ( not ( = ?auto_141691 ?auto_141694 ) ) ( not ( = ?auto_141692 ?auto_141693 ) ) ( not ( = ?auto_141692 ?auto_141694 ) ) ( not ( = ?auto_141693 ?auto_141694 ) ) ( not ( = ?auto_141691 ?auto_141699 ) ) ( not ( = ?auto_141692 ?auto_141699 ) ) ( not ( = ?auto_141693 ?auto_141699 ) ) ( not ( = ?auto_141694 ?auto_141699 ) ) ( not ( = ?auto_141697 ?auto_141696 ) ) ( not ( = ?auto_141697 ?auto_141695 ) ) ( not ( = ?auto_141697 ?auto_141699 ) ) ( not ( = ?auto_141697 ?auto_141694 ) ) ( not ( = ?auto_141697 ?auto_141693 ) ) ( not ( = ?auto_141696 ?auto_141695 ) ) ( not ( = ?auto_141696 ?auto_141699 ) ) ( not ( = ?auto_141696 ?auto_141694 ) ) ( not ( = ?auto_141696 ?auto_141693 ) ) ( not ( = ?auto_141695 ?auto_141699 ) ) ( not ( = ?auto_141695 ?auto_141694 ) ) ( not ( = ?auto_141695 ?auto_141693 ) ) ( not ( = ?auto_141691 ?auto_141697 ) ) ( not ( = ?auto_141691 ?auto_141696 ) ) ( not ( = ?auto_141691 ?auto_141695 ) ) ( not ( = ?auto_141692 ?auto_141697 ) ) ( not ( = ?auto_141692 ?auto_141696 ) ) ( not ( = ?auto_141692 ?auto_141695 ) ) ( ON ?auto_141691 ?auto_141698 ) ( not ( = ?auto_141691 ?auto_141698 ) ) ( not ( = ?auto_141692 ?auto_141698 ) ) ( not ( = ?auto_141693 ?auto_141698 ) ) ( not ( = ?auto_141694 ?auto_141698 ) ) ( not ( = ?auto_141699 ?auto_141698 ) ) ( not ( = ?auto_141697 ?auto_141698 ) ) ( not ( = ?auto_141696 ?auto_141698 ) ) ( not ( = ?auto_141695 ?auto_141698 ) ) ( ON ?auto_141692 ?auto_141691 ) ( ON-TABLE ?auto_141698 ) ( ON ?auto_141693 ?auto_141692 ) ( ON ?auto_141694 ?auto_141693 ) ( ON ?auto_141699 ?auto_141694 ) ( ON ?auto_141695 ?auto_141699 ) ( ON ?auto_141696 ?auto_141695 ) ( ON ?auto_141697 ?auto_141696 ) ( CLEAR ?auto_141697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141698 ?auto_141691 ?auto_141692 ?auto_141693 ?auto_141694 ?auto_141699 ?auto_141695 ?auto_141696 )
      ( MAKE-4PILE ?auto_141691 ?auto_141692 ?auto_141693 ?auto_141694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141719 - BLOCK
      ?auto_141720 - BLOCK
      ?auto_141721 - BLOCK
    )
    :vars
    (
      ?auto_141724 - BLOCK
      ?auto_141722 - BLOCK
      ?auto_141723 - BLOCK
      ?auto_141726 - BLOCK
      ?auto_141725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141724 ?auto_141721 ) ( ON-TABLE ?auto_141719 ) ( ON ?auto_141720 ?auto_141719 ) ( ON ?auto_141721 ?auto_141720 ) ( not ( = ?auto_141719 ?auto_141720 ) ) ( not ( = ?auto_141719 ?auto_141721 ) ) ( not ( = ?auto_141719 ?auto_141724 ) ) ( not ( = ?auto_141720 ?auto_141721 ) ) ( not ( = ?auto_141720 ?auto_141724 ) ) ( not ( = ?auto_141721 ?auto_141724 ) ) ( not ( = ?auto_141719 ?auto_141722 ) ) ( not ( = ?auto_141719 ?auto_141723 ) ) ( not ( = ?auto_141720 ?auto_141722 ) ) ( not ( = ?auto_141720 ?auto_141723 ) ) ( not ( = ?auto_141721 ?auto_141722 ) ) ( not ( = ?auto_141721 ?auto_141723 ) ) ( not ( = ?auto_141724 ?auto_141722 ) ) ( not ( = ?auto_141724 ?auto_141723 ) ) ( not ( = ?auto_141722 ?auto_141723 ) ) ( ON ?auto_141722 ?auto_141724 ) ( CLEAR ?auto_141722 ) ( HOLDING ?auto_141723 ) ( CLEAR ?auto_141726 ) ( ON-TABLE ?auto_141725 ) ( ON ?auto_141726 ?auto_141725 ) ( not ( = ?auto_141725 ?auto_141726 ) ) ( not ( = ?auto_141725 ?auto_141723 ) ) ( not ( = ?auto_141726 ?auto_141723 ) ) ( not ( = ?auto_141719 ?auto_141726 ) ) ( not ( = ?auto_141719 ?auto_141725 ) ) ( not ( = ?auto_141720 ?auto_141726 ) ) ( not ( = ?auto_141720 ?auto_141725 ) ) ( not ( = ?auto_141721 ?auto_141726 ) ) ( not ( = ?auto_141721 ?auto_141725 ) ) ( not ( = ?auto_141724 ?auto_141726 ) ) ( not ( = ?auto_141724 ?auto_141725 ) ) ( not ( = ?auto_141722 ?auto_141726 ) ) ( not ( = ?auto_141722 ?auto_141725 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141725 ?auto_141726 ?auto_141723 )
      ( MAKE-3PILE ?auto_141719 ?auto_141720 ?auto_141721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141727 - BLOCK
      ?auto_141728 - BLOCK
      ?auto_141729 - BLOCK
    )
    :vars
    (
      ?auto_141733 - BLOCK
      ?auto_141732 - BLOCK
      ?auto_141730 - BLOCK
      ?auto_141731 - BLOCK
      ?auto_141734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141733 ?auto_141729 ) ( ON-TABLE ?auto_141727 ) ( ON ?auto_141728 ?auto_141727 ) ( ON ?auto_141729 ?auto_141728 ) ( not ( = ?auto_141727 ?auto_141728 ) ) ( not ( = ?auto_141727 ?auto_141729 ) ) ( not ( = ?auto_141727 ?auto_141733 ) ) ( not ( = ?auto_141728 ?auto_141729 ) ) ( not ( = ?auto_141728 ?auto_141733 ) ) ( not ( = ?auto_141729 ?auto_141733 ) ) ( not ( = ?auto_141727 ?auto_141732 ) ) ( not ( = ?auto_141727 ?auto_141730 ) ) ( not ( = ?auto_141728 ?auto_141732 ) ) ( not ( = ?auto_141728 ?auto_141730 ) ) ( not ( = ?auto_141729 ?auto_141732 ) ) ( not ( = ?auto_141729 ?auto_141730 ) ) ( not ( = ?auto_141733 ?auto_141732 ) ) ( not ( = ?auto_141733 ?auto_141730 ) ) ( not ( = ?auto_141732 ?auto_141730 ) ) ( ON ?auto_141732 ?auto_141733 ) ( CLEAR ?auto_141731 ) ( ON-TABLE ?auto_141734 ) ( ON ?auto_141731 ?auto_141734 ) ( not ( = ?auto_141734 ?auto_141731 ) ) ( not ( = ?auto_141734 ?auto_141730 ) ) ( not ( = ?auto_141731 ?auto_141730 ) ) ( not ( = ?auto_141727 ?auto_141731 ) ) ( not ( = ?auto_141727 ?auto_141734 ) ) ( not ( = ?auto_141728 ?auto_141731 ) ) ( not ( = ?auto_141728 ?auto_141734 ) ) ( not ( = ?auto_141729 ?auto_141731 ) ) ( not ( = ?auto_141729 ?auto_141734 ) ) ( not ( = ?auto_141733 ?auto_141731 ) ) ( not ( = ?auto_141733 ?auto_141734 ) ) ( not ( = ?auto_141732 ?auto_141731 ) ) ( not ( = ?auto_141732 ?auto_141734 ) ) ( ON ?auto_141730 ?auto_141732 ) ( CLEAR ?auto_141730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141727 ?auto_141728 ?auto_141729 ?auto_141733 ?auto_141732 )
      ( MAKE-3PILE ?auto_141727 ?auto_141728 ?auto_141729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141735 - BLOCK
      ?auto_141736 - BLOCK
      ?auto_141737 - BLOCK
    )
    :vars
    (
      ?auto_141740 - BLOCK
      ?auto_141742 - BLOCK
      ?auto_141739 - BLOCK
      ?auto_141738 - BLOCK
      ?auto_141741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141740 ?auto_141737 ) ( ON-TABLE ?auto_141735 ) ( ON ?auto_141736 ?auto_141735 ) ( ON ?auto_141737 ?auto_141736 ) ( not ( = ?auto_141735 ?auto_141736 ) ) ( not ( = ?auto_141735 ?auto_141737 ) ) ( not ( = ?auto_141735 ?auto_141740 ) ) ( not ( = ?auto_141736 ?auto_141737 ) ) ( not ( = ?auto_141736 ?auto_141740 ) ) ( not ( = ?auto_141737 ?auto_141740 ) ) ( not ( = ?auto_141735 ?auto_141742 ) ) ( not ( = ?auto_141735 ?auto_141739 ) ) ( not ( = ?auto_141736 ?auto_141742 ) ) ( not ( = ?auto_141736 ?auto_141739 ) ) ( not ( = ?auto_141737 ?auto_141742 ) ) ( not ( = ?auto_141737 ?auto_141739 ) ) ( not ( = ?auto_141740 ?auto_141742 ) ) ( not ( = ?auto_141740 ?auto_141739 ) ) ( not ( = ?auto_141742 ?auto_141739 ) ) ( ON ?auto_141742 ?auto_141740 ) ( ON-TABLE ?auto_141738 ) ( not ( = ?auto_141738 ?auto_141741 ) ) ( not ( = ?auto_141738 ?auto_141739 ) ) ( not ( = ?auto_141741 ?auto_141739 ) ) ( not ( = ?auto_141735 ?auto_141741 ) ) ( not ( = ?auto_141735 ?auto_141738 ) ) ( not ( = ?auto_141736 ?auto_141741 ) ) ( not ( = ?auto_141736 ?auto_141738 ) ) ( not ( = ?auto_141737 ?auto_141741 ) ) ( not ( = ?auto_141737 ?auto_141738 ) ) ( not ( = ?auto_141740 ?auto_141741 ) ) ( not ( = ?auto_141740 ?auto_141738 ) ) ( not ( = ?auto_141742 ?auto_141741 ) ) ( not ( = ?auto_141742 ?auto_141738 ) ) ( ON ?auto_141739 ?auto_141742 ) ( CLEAR ?auto_141739 ) ( HOLDING ?auto_141741 ) ( CLEAR ?auto_141738 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141738 ?auto_141741 )
      ( MAKE-3PILE ?auto_141735 ?auto_141736 ?auto_141737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141743 - BLOCK
      ?auto_141744 - BLOCK
      ?auto_141745 - BLOCK
    )
    :vars
    (
      ?auto_141748 - BLOCK
      ?auto_141750 - BLOCK
      ?auto_141747 - BLOCK
      ?auto_141749 - BLOCK
      ?auto_141746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141748 ?auto_141745 ) ( ON-TABLE ?auto_141743 ) ( ON ?auto_141744 ?auto_141743 ) ( ON ?auto_141745 ?auto_141744 ) ( not ( = ?auto_141743 ?auto_141744 ) ) ( not ( = ?auto_141743 ?auto_141745 ) ) ( not ( = ?auto_141743 ?auto_141748 ) ) ( not ( = ?auto_141744 ?auto_141745 ) ) ( not ( = ?auto_141744 ?auto_141748 ) ) ( not ( = ?auto_141745 ?auto_141748 ) ) ( not ( = ?auto_141743 ?auto_141750 ) ) ( not ( = ?auto_141743 ?auto_141747 ) ) ( not ( = ?auto_141744 ?auto_141750 ) ) ( not ( = ?auto_141744 ?auto_141747 ) ) ( not ( = ?auto_141745 ?auto_141750 ) ) ( not ( = ?auto_141745 ?auto_141747 ) ) ( not ( = ?auto_141748 ?auto_141750 ) ) ( not ( = ?auto_141748 ?auto_141747 ) ) ( not ( = ?auto_141750 ?auto_141747 ) ) ( ON ?auto_141750 ?auto_141748 ) ( ON-TABLE ?auto_141749 ) ( not ( = ?auto_141749 ?auto_141746 ) ) ( not ( = ?auto_141749 ?auto_141747 ) ) ( not ( = ?auto_141746 ?auto_141747 ) ) ( not ( = ?auto_141743 ?auto_141746 ) ) ( not ( = ?auto_141743 ?auto_141749 ) ) ( not ( = ?auto_141744 ?auto_141746 ) ) ( not ( = ?auto_141744 ?auto_141749 ) ) ( not ( = ?auto_141745 ?auto_141746 ) ) ( not ( = ?auto_141745 ?auto_141749 ) ) ( not ( = ?auto_141748 ?auto_141746 ) ) ( not ( = ?auto_141748 ?auto_141749 ) ) ( not ( = ?auto_141750 ?auto_141746 ) ) ( not ( = ?auto_141750 ?auto_141749 ) ) ( ON ?auto_141747 ?auto_141750 ) ( CLEAR ?auto_141749 ) ( ON ?auto_141746 ?auto_141747 ) ( CLEAR ?auto_141746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141743 ?auto_141744 ?auto_141745 ?auto_141748 ?auto_141750 ?auto_141747 )
      ( MAKE-3PILE ?auto_141743 ?auto_141744 ?auto_141745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141751 - BLOCK
      ?auto_141752 - BLOCK
      ?auto_141753 - BLOCK
    )
    :vars
    (
      ?auto_141755 - BLOCK
      ?auto_141754 - BLOCK
      ?auto_141757 - BLOCK
      ?auto_141756 - BLOCK
      ?auto_141758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141755 ?auto_141753 ) ( ON-TABLE ?auto_141751 ) ( ON ?auto_141752 ?auto_141751 ) ( ON ?auto_141753 ?auto_141752 ) ( not ( = ?auto_141751 ?auto_141752 ) ) ( not ( = ?auto_141751 ?auto_141753 ) ) ( not ( = ?auto_141751 ?auto_141755 ) ) ( not ( = ?auto_141752 ?auto_141753 ) ) ( not ( = ?auto_141752 ?auto_141755 ) ) ( not ( = ?auto_141753 ?auto_141755 ) ) ( not ( = ?auto_141751 ?auto_141754 ) ) ( not ( = ?auto_141751 ?auto_141757 ) ) ( not ( = ?auto_141752 ?auto_141754 ) ) ( not ( = ?auto_141752 ?auto_141757 ) ) ( not ( = ?auto_141753 ?auto_141754 ) ) ( not ( = ?auto_141753 ?auto_141757 ) ) ( not ( = ?auto_141755 ?auto_141754 ) ) ( not ( = ?auto_141755 ?auto_141757 ) ) ( not ( = ?auto_141754 ?auto_141757 ) ) ( ON ?auto_141754 ?auto_141755 ) ( not ( = ?auto_141756 ?auto_141758 ) ) ( not ( = ?auto_141756 ?auto_141757 ) ) ( not ( = ?auto_141758 ?auto_141757 ) ) ( not ( = ?auto_141751 ?auto_141758 ) ) ( not ( = ?auto_141751 ?auto_141756 ) ) ( not ( = ?auto_141752 ?auto_141758 ) ) ( not ( = ?auto_141752 ?auto_141756 ) ) ( not ( = ?auto_141753 ?auto_141758 ) ) ( not ( = ?auto_141753 ?auto_141756 ) ) ( not ( = ?auto_141755 ?auto_141758 ) ) ( not ( = ?auto_141755 ?auto_141756 ) ) ( not ( = ?auto_141754 ?auto_141758 ) ) ( not ( = ?auto_141754 ?auto_141756 ) ) ( ON ?auto_141757 ?auto_141754 ) ( ON ?auto_141758 ?auto_141757 ) ( CLEAR ?auto_141758 ) ( HOLDING ?auto_141756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141756 )
      ( MAKE-3PILE ?auto_141751 ?auto_141752 ?auto_141753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141770 - BLOCK
      ?auto_141771 - BLOCK
      ?auto_141772 - BLOCK
    )
    :vars
    (
      ?auto_141774 - BLOCK
      ?auto_141773 - BLOCK
      ?auto_141776 - BLOCK
      ?auto_141777 - BLOCK
      ?auto_141775 - BLOCK
      ?auto_141778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141774 ?auto_141772 ) ( ON-TABLE ?auto_141770 ) ( ON ?auto_141771 ?auto_141770 ) ( ON ?auto_141772 ?auto_141771 ) ( not ( = ?auto_141770 ?auto_141771 ) ) ( not ( = ?auto_141770 ?auto_141772 ) ) ( not ( = ?auto_141770 ?auto_141774 ) ) ( not ( = ?auto_141771 ?auto_141772 ) ) ( not ( = ?auto_141771 ?auto_141774 ) ) ( not ( = ?auto_141772 ?auto_141774 ) ) ( not ( = ?auto_141770 ?auto_141773 ) ) ( not ( = ?auto_141770 ?auto_141776 ) ) ( not ( = ?auto_141771 ?auto_141773 ) ) ( not ( = ?auto_141771 ?auto_141776 ) ) ( not ( = ?auto_141772 ?auto_141773 ) ) ( not ( = ?auto_141772 ?auto_141776 ) ) ( not ( = ?auto_141774 ?auto_141773 ) ) ( not ( = ?auto_141774 ?auto_141776 ) ) ( not ( = ?auto_141773 ?auto_141776 ) ) ( ON ?auto_141773 ?auto_141774 ) ( not ( = ?auto_141777 ?auto_141775 ) ) ( not ( = ?auto_141777 ?auto_141776 ) ) ( not ( = ?auto_141775 ?auto_141776 ) ) ( not ( = ?auto_141770 ?auto_141775 ) ) ( not ( = ?auto_141770 ?auto_141777 ) ) ( not ( = ?auto_141771 ?auto_141775 ) ) ( not ( = ?auto_141771 ?auto_141777 ) ) ( not ( = ?auto_141772 ?auto_141775 ) ) ( not ( = ?auto_141772 ?auto_141777 ) ) ( not ( = ?auto_141774 ?auto_141775 ) ) ( not ( = ?auto_141774 ?auto_141777 ) ) ( not ( = ?auto_141773 ?auto_141775 ) ) ( not ( = ?auto_141773 ?auto_141777 ) ) ( ON ?auto_141776 ?auto_141773 ) ( ON ?auto_141775 ?auto_141776 ) ( CLEAR ?auto_141775 ) ( ON ?auto_141777 ?auto_141778 ) ( CLEAR ?auto_141777 ) ( HAND-EMPTY ) ( not ( = ?auto_141770 ?auto_141778 ) ) ( not ( = ?auto_141771 ?auto_141778 ) ) ( not ( = ?auto_141772 ?auto_141778 ) ) ( not ( = ?auto_141774 ?auto_141778 ) ) ( not ( = ?auto_141773 ?auto_141778 ) ) ( not ( = ?auto_141776 ?auto_141778 ) ) ( not ( = ?auto_141777 ?auto_141778 ) ) ( not ( = ?auto_141775 ?auto_141778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141777 ?auto_141778 )
      ( MAKE-3PILE ?auto_141770 ?auto_141771 ?auto_141772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141779 - BLOCK
      ?auto_141780 - BLOCK
      ?auto_141781 - BLOCK
    )
    :vars
    (
      ?auto_141782 - BLOCK
      ?auto_141787 - BLOCK
      ?auto_141783 - BLOCK
      ?auto_141786 - BLOCK
      ?auto_141785 - BLOCK
      ?auto_141784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141782 ?auto_141781 ) ( ON-TABLE ?auto_141779 ) ( ON ?auto_141780 ?auto_141779 ) ( ON ?auto_141781 ?auto_141780 ) ( not ( = ?auto_141779 ?auto_141780 ) ) ( not ( = ?auto_141779 ?auto_141781 ) ) ( not ( = ?auto_141779 ?auto_141782 ) ) ( not ( = ?auto_141780 ?auto_141781 ) ) ( not ( = ?auto_141780 ?auto_141782 ) ) ( not ( = ?auto_141781 ?auto_141782 ) ) ( not ( = ?auto_141779 ?auto_141787 ) ) ( not ( = ?auto_141779 ?auto_141783 ) ) ( not ( = ?auto_141780 ?auto_141787 ) ) ( not ( = ?auto_141780 ?auto_141783 ) ) ( not ( = ?auto_141781 ?auto_141787 ) ) ( not ( = ?auto_141781 ?auto_141783 ) ) ( not ( = ?auto_141782 ?auto_141787 ) ) ( not ( = ?auto_141782 ?auto_141783 ) ) ( not ( = ?auto_141787 ?auto_141783 ) ) ( ON ?auto_141787 ?auto_141782 ) ( not ( = ?auto_141786 ?auto_141785 ) ) ( not ( = ?auto_141786 ?auto_141783 ) ) ( not ( = ?auto_141785 ?auto_141783 ) ) ( not ( = ?auto_141779 ?auto_141785 ) ) ( not ( = ?auto_141779 ?auto_141786 ) ) ( not ( = ?auto_141780 ?auto_141785 ) ) ( not ( = ?auto_141780 ?auto_141786 ) ) ( not ( = ?auto_141781 ?auto_141785 ) ) ( not ( = ?auto_141781 ?auto_141786 ) ) ( not ( = ?auto_141782 ?auto_141785 ) ) ( not ( = ?auto_141782 ?auto_141786 ) ) ( not ( = ?auto_141787 ?auto_141785 ) ) ( not ( = ?auto_141787 ?auto_141786 ) ) ( ON ?auto_141783 ?auto_141787 ) ( ON ?auto_141786 ?auto_141784 ) ( CLEAR ?auto_141786 ) ( not ( = ?auto_141779 ?auto_141784 ) ) ( not ( = ?auto_141780 ?auto_141784 ) ) ( not ( = ?auto_141781 ?auto_141784 ) ) ( not ( = ?auto_141782 ?auto_141784 ) ) ( not ( = ?auto_141787 ?auto_141784 ) ) ( not ( = ?auto_141783 ?auto_141784 ) ) ( not ( = ?auto_141786 ?auto_141784 ) ) ( not ( = ?auto_141785 ?auto_141784 ) ) ( HOLDING ?auto_141785 ) ( CLEAR ?auto_141783 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141779 ?auto_141780 ?auto_141781 ?auto_141782 ?auto_141787 ?auto_141783 ?auto_141785 )
      ( MAKE-3PILE ?auto_141779 ?auto_141780 ?auto_141781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141788 - BLOCK
      ?auto_141789 - BLOCK
      ?auto_141790 - BLOCK
    )
    :vars
    (
      ?auto_141795 - BLOCK
      ?auto_141791 - BLOCK
      ?auto_141794 - BLOCK
      ?auto_141793 - BLOCK
      ?auto_141796 - BLOCK
      ?auto_141792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141795 ?auto_141790 ) ( ON-TABLE ?auto_141788 ) ( ON ?auto_141789 ?auto_141788 ) ( ON ?auto_141790 ?auto_141789 ) ( not ( = ?auto_141788 ?auto_141789 ) ) ( not ( = ?auto_141788 ?auto_141790 ) ) ( not ( = ?auto_141788 ?auto_141795 ) ) ( not ( = ?auto_141789 ?auto_141790 ) ) ( not ( = ?auto_141789 ?auto_141795 ) ) ( not ( = ?auto_141790 ?auto_141795 ) ) ( not ( = ?auto_141788 ?auto_141791 ) ) ( not ( = ?auto_141788 ?auto_141794 ) ) ( not ( = ?auto_141789 ?auto_141791 ) ) ( not ( = ?auto_141789 ?auto_141794 ) ) ( not ( = ?auto_141790 ?auto_141791 ) ) ( not ( = ?auto_141790 ?auto_141794 ) ) ( not ( = ?auto_141795 ?auto_141791 ) ) ( not ( = ?auto_141795 ?auto_141794 ) ) ( not ( = ?auto_141791 ?auto_141794 ) ) ( ON ?auto_141791 ?auto_141795 ) ( not ( = ?auto_141793 ?auto_141796 ) ) ( not ( = ?auto_141793 ?auto_141794 ) ) ( not ( = ?auto_141796 ?auto_141794 ) ) ( not ( = ?auto_141788 ?auto_141796 ) ) ( not ( = ?auto_141788 ?auto_141793 ) ) ( not ( = ?auto_141789 ?auto_141796 ) ) ( not ( = ?auto_141789 ?auto_141793 ) ) ( not ( = ?auto_141790 ?auto_141796 ) ) ( not ( = ?auto_141790 ?auto_141793 ) ) ( not ( = ?auto_141795 ?auto_141796 ) ) ( not ( = ?auto_141795 ?auto_141793 ) ) ( not ( = ?auto_141791 ?auto_141796 ) ) ( not ( = ?auto_141791 ?auto_141793 ) ) ( ON ?auto_141794 ?auto_141791 ) ( ON ?auto_141793 ?auto_141792 ) ( not ( = ?auto_141788 ?auto_141792 ) ) ( not ( = ?auto_141789 ?auto_141792 ) ) ( not ( = ?auto_141790 ?auto_141792 ) ) ( not ( = ?auto_141795 ?auto_141792 ) ) ( not ( = ?auto_141791 ?auto_141792 ) ) ( not ( = ?auto_141794 ?auto_141792 ) ) ( not ( = ?auto_141793 ?auto_141792 ) ) ( not ( = ?auto_141796 ?auto_141792 ) ) ( CLEAR ?auto_141794 ) ( ON ?auto_141796 ?auto_141793 ) ( CLEAR ?auto_141796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141792 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141792 ?auto_141793 )
      ( MAKE-3PILE ?auto_141788 ?auto_141789 ?auto_141790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_141797 - BLOCK
      ?auto_141798 - BLOCK
      ?auto_141799 - BLOCK
    )
    :vars
    (
      ?auto_141801 - BLOCK
      ?auto_141803 - BLOCK
      ?auto_141802 - BLOCK
      ?auto_141804 - BLOCK
      ?auto_141800 - BLOCK
      ?auto_141805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_141801 ?auto_141799 ) ( ON-TABLE ?auto_141797 ) ( ON ?auto_141798 ?auto_141797 ) ( ON ?auto_141799 ?auto_141798 ) ( not ( = ?auto_141797 ?auto_141798 ) ) ( not ( = ?auto_141797 ?auto_141799 ) ) ( not ( = ?auto_141797 ?auto_141801 ) ) ( not ( = ?auto_141798 ?auto_141799 ) ) ( not ( = ?auto_141798 ?auto_141801 ) ) ( not ( = ?auto_141799 ?auto_141801 ) ) ( not ( = ?auto_141797 ?auto_141803 ) ) ( not ( = ?auto_141797 ?auto_141802 ) ) ( not ( = ?auto_141798 ?auto_141803 ) ) ( not ( = ?auto_141798 ?auto_141802 ) ) ( not ( = ?auto_141799 ?auto_141803 ) ) ( not ( = ?auto_141799 ?auto_141802 ) ) ( not ( = ?auto_141801 ?auto_141803 ) ) ( not ( = ?auto_141801 ?auto_141802 ) ) ( not ( = ?auto_141803 ?auto_141802 ) ) ( ON ?auto_141803 ?auto_141801 ) ( not ( = ?auto_141804 ?auto_141800 ) ) ( not ( = ?auto_141804 ?auto_141802 ) ) ( not ( = ?auto_141800 ?auto_141802 ) ) ( not ( = ?auto_141797 ?auto_141800 ) ) ( not ( = ?auto_141797 ?auto_141804 ) ) ( not ( = ?auto_141798 ?auto_141800 ) ) ( not ( = ?auto_141798 ?auto_141804 ) ) ( not ( = ?auto_141799 ?auto_141800 ) ) ( not ( = ?auto_141799 ?auto_141804 ) ) ( not ( = ?auto_141801 ?auto_141800 ) ) ( not ( = ?auto_141801 ?auto_141804 ) ) ( not ( = ?auto_141803 ?auto_141800 ) ) ( not ( = ?auto_141803 ?auto_141804 ) ) ( ON ?auto_141804 ?auto_141805 ) ( not ( = ?auto_141797 ?auto_141805 ) ) ( not ( = ?auto_141798 ?auto_141805 ) ) ( not ( = ?auto_141799 ?auto_141805 ) ) ( not ( = ?auto_141801 ?auto_141805 ) ) ( not ( = ?auto_141803 ?auto_141805 ) ) ( not ( = ?auto_141802 ?auto_141805 ) ) ( not ( = ?auto_141804 ?auto_141805 ) ) ( not ( = ?auto_141800 ?auto_141805 ) ) ( ON ?auto_141800 ?auto_141804 ) ( CLEAR ?auto_141800 ) ( ON-TABLE ?auto_141805 ) ( HOLDING ?auto_141802 ) ( CLEAR ?auto_141803 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141797 ?auto_141798 ?auto_141799 ?auto_141801 ?auto_141803 ?auto_141802 )
      ( MAKE-3PILE ?auto_141797 ?auto_141798 ?auto_141799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141864 - BLOCK
      ?auto_141865 - BLOCK
      ?auto_141866 - BLOCK
      ?auto_141867 - BLOCK
      ?auto_141868 - BLOCK
    )
    :vars
    (
      ?auto_141869 - BLOCK
      ?auto_141870 - BLOCK
      ?auto_141871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141864 ) ( ON ?auto_141865 ?auto_141864 ) ( ON ?auto_141866 ?auto_141865 ) ( not ( = ?auto_141864 ?auto_141865 ) ) ( not ( = ?auto_141864 ?auto_141866 ) ) ( not ( = ?auto_141864 ?auto_141867 ) ) ( not ( = ?auto_141864 ?auto_141868 ) ) ( not ( = ?auto_141865 ?auto_141866 ) ) ( not ( = ?auto_141865 ?auto_141867 ) ) ( not ( = ?auto_141865 ?auto_141868 ) ) ( not ( = ?auto_141866 ?auto_141867 ) ) ( not ( = ?auto_141866 ?auto_141868 ) ) ( not ( = ?auto_141867 ?auto_141868 ) ) ( ON ?auto_141868 ?auto_141869 ) ( not ( = ?auto_141864 ?auto_141869 ) ) ( not ( = ?auto_141865 ?auto_141869 ) ) ( not ( = ?auto_141866 ?auto_141869 ) ) ( not ( = ?auto_141867 ?auto_141869 ) ) ( not ( = ?auto_141868 ?auto_141869 ) ) ( CLEAR ?auto_141866 ) ( ON ?auto_141867 ?auto_141868 ) ( CLEAR ?auto_141867 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141870 ) ( ON ?auto_141871 ?auto_141870 ) ( ON ?auto_141869 ?auto_141871 ) ( not ( = ?auto_141870 ?auto_141871 ) ) ( not ( = ?auto_141870 ?auto_141869 ) ) ( not ( = ?auto_141870 ?auto_141868 ) ) ( not ( = ?auto_141870 ?auto_141867 ) ) ( not ( = ?auto_141871 ?auto_141869 ) ) ( not ( = ?auto_141871 ?auto_141868 ) ) ( not ( = ?auto_141871 ?auto_141867 ) ) ( not ( = ?auto_141864 ?auto_141870 ) ) ( not ( = ?auto_141864 ?auto_141871 ) ) ( not ( = ?auto_141865 ?auto_141870 ) ) ( not ( = ?auto_141865 ?auto_141871 ) ) ( not ( = ?auto_141866 ?auto_141870 ) ) ( not ( = ?auto_141866 ?auto_141871 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141870 ?auto_141871 ?auto_141869 ?auto_141868 )
      ( MAKE-5PILE ?auto_141864 ?auto_141865 ?auto_141866 ?auto_141867 ?auto_141868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141872 - BLOCK
      ?auto_141873 - BLOCK
      ?auto_141874 - BLOCK
      ?auto_141875 - BLOCK
      ?auto_141876 - BLOCK
    )
    :vars
    (
      ?auto_141877 - BLOCK
      ?auto_141878 - BLOCK
      ?auto_141879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141872 ) ( ON ?auto_141873 ?auto_141872 ) ( not ( = ?auto_141872 ?auto_141873 ) ) ( not ( = ?auto_141872 ?auto_141874 ) ) ( not ( = ?auto_141872 ?auto_141875 ) ) ( not ( = ?auto_141872 ?auto_141876 ) ) ( not ( = ?auto_141873 ?auto_141874 ) ) ( not ( = ?auto_141873 ?auto_141875 ) ) ( not ( = ?auto_141873 ?auto_141876 ) ) ( not ( = ?auto_141874 ?auto_141875 ) ) ( not ( = ?auto_141874 ?auto_141876 ) ) ( not ( = ?auto_141875 ?auto_141876 ) ) ( ON ?auto_141876 ?auto_141877 ) ( not ( = ?auto_141872 ?auto_141877 ) ) ( not ( = ?auto_141873 ?auto_141877 ) ) ( not ( = ?auto_141874 ?auto_141877 ) ) ( not ( = ?auto_141875 ?auto_141877 ) ) ( not ( = ?auto_141876 ?auto_141877 ) ) ( ON ?auto_141875 ?auto_141876 ) ( CLEAR ?auto_141875 ) ( ON-TABLE ?auto_141878 ) ( ON ?auto_141879 ?auto_141878 ) ( ON ?auto_141877 ?auto_141879 ) ( not ( = ?auto_141878 ?auto_141879 ) ) ( not ( = ?auto_141878 ?auto_141877 ) ) ( not ( = ?auto_141878 ?auto_141876 ) ) ( not ( = ?auto_141878 ?auto_141875 ) ) ( not ( = ?auto_141879 ?auto_141877 ) ) ( not ( = ?auto_141879 ?auto_141876 ) ) ( not ( = ?auto_141879 ?auto_141875 ) ) ( not ( = ?auto_141872 ?auto_141878 ) ) ( not ( = ?auto_141872 ?auto_141879 ) ) ( not ( = ?auto_141873 ?auto_141878 ) ) ( not ( = ?auto_141873 ?auto_141879 ) ) ( not ( = ?auto_141874 ?auto_141878 ) ) ( not ( = ?auto_141874 ?auto_141879 ) ) ( HOLDING ?auto_141874 ) ( CLEAR ?auto_141873 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141872 ?auto_141873 ?auto_141874 )
      ( MAKE-5PILE ?auto_141872 ?auto_141873 ?auto_141874 ?auto_141875 ?auto_141876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141880 - BLOCK
      ?auto_141881 - BLOCK
      ?auto_141882 - BLOCK
      ?auto_141883 - BLOCK
      ?auto_141884 - BLOCK
    )
    :vars
    (
      ?auto_141885 - BLOCK
      ?auto_141887 - BLOCK
      ?auto_141886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141880 ) ( ON ?auto_141881 ?auto_141880 ) ( not ( = ?auto_141880 ?auto_141881 ) ) ( not ( = ?auto_141880 ?auto_141882 ) ) ( not ( = ?auto_141880 ?auto_141883 ) ) ( not ( = ?auto_141880 ?auto_141884 ) ) ( not ( = ?auto_141881 ?auto_141882 ) ) ( not ( = ?auto_141881 ?auto_141883 ) ) ( not ( = ?auto_141881 ?auto_141884 ) ) ( not ( = ?auto_141882 ?auto_141883 ) ) ( not ( = ?auto_141882 ?auto_141884 ) ) ( not ( = ?auto_141883 ?auto_141884 ) ) ( ON ?auto_141884 ?auto_141885 ) ( not ( = ?auto_141880 ?auto_141885 ) ) ( not ( = ?auto_141881 ?auto_141885 ) ) ( not ( = ?auto_141882 ?auto_141885 ) ) ( not ( = ?auto_141883 ?auto_141885 ) ) ( not ( = ?auto_141884 ?auto_141885 ) ) ( ON ?auto_141883 ?auto_141884 ) ( ON-TABLE ?auto_141887 ) ( ON ?auto_141886 ?auto_141887 ) ( ON ?auto_141885 ?auto_141886 ) ( not ( = ?auto_141887 ?auto_141886 ) ) ( not ( = ?auto_141887 ?auto_141885 ) ) ( not ( = ?auto_141887 ?auto_141884 ) ) ( not ( = ?auto_141887 ?auto_141883 ) ) ( not ( = ?auto_141886 ?auto_141885 ) ) ( not ( = ?auto_141886 ?auto_141884 ) ) ( not ( = ?auto_141886 ?auto_141883 ) ) ( not ( = ?auto_141880 ?auto_141887 ) ) ( not ( = ?auto_141880 ?auto_141886 ) ) ( not ( = ?auto_141881 ?auto_141887 ) ) ( not ( = ?auto_141881 ?auto_141886 ) ) ( not ( = ?auto_141882 ?auto_141887 ) ) ( not ( = ?auto_141882 ?auto_141886 ) ) ( CLEAR ?auto_141881 ) ( ON ?auto_141882 ?auto_141883 ) ( CLEAR ?auto_141882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141887 ?auto_141886 ?auto_141885 ?auto_141884 ?auto_141883 )
      ( MAKE-5PILE ?auto_141880 ?auto_141881 ?auto_141882 ?auto_141883 ?auto_141884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141888 - BLOCK
      ?auto_141889 - BLOCK
      ?auto_141890 - BLOCK
      ?auto_141891 - BLOCK
      ?auto_141892 - BLOCK
    )
    :vars
    (
      ?auto_141894 - BLOCK
      ?auto_141895 - BLOCK
      ?auto_141893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141888 ) ( not ( = ?auto_141888 ?auto_141889 ) ) ( not ( = ?auto_141888 ?auto_141890 ) ) ( not ( = ?auto_141888 ?auto_141891 ) ) ( not ( = ?auto_141888 ?auto_141892 ) ) ( not ( = ?auto_141889 ?auto_141890 ) ) ( not ( = ?auto_141889 ?auto_141891 ) ) ( not ( = ?auto_141889 ?auto_141892 ) ) ( not ( = ?auto_141890 ?auto_141891 ) ) ( not ( = ?auto_141890 ?auto_141892 ) ) ( not ( = ?auto_141891 ?auto_141892 ) ) ( ON ?auto_141892 ?auto_141894 ) ( not ( = ?auto_141888 ?auto_141894 ) ) ( not ( = ?auto_141889 ?auto_141894 ) ) ( not ( = ?auto_141890 ?auto_141894 ) ) ( not ( = ?auto_141891 ?auto_141894 ) ) ( not ( = ?auto_141892 ?auto_141894 ) ) ( ON ?auto_141891 ?auto_141892 ) ( ON-TABLE ?auto_141895 ) ( ON ?auto_141893 ?auto_141895 ) ( ON ?auto_141894 ?auto_141893 ) ( not ( = ?auto_141895 ?auto_141893 ) ) ( not ( = ?auto_141895 ?auto_141894 ) ) ( not ( = ?auto_141895 ?auto_141892 ) ) ( not ( = ?auto_141895 ?auto_141891 ) ) ( not ( = ?auto_141893 ?auto_141894 ) ) ( not ( = ?auto_141893 ?auto_141892 ) ) ( not ( = ?auto_141893 ?auto_141891 ) ) ( not ( = ?auto_141888 ?auto_141895 ) ) ( not ( = ?auto_141888 ?auto_141893 ) ) ( not ( = ?auto_141889 ?auto_141895 ) ) ( not ( = ?auto_141889 ?auto_141893 ) ) ( not ( = ?auto_141890 ?auto_141895 ) ) ( not ( = ?auto_141890 ?auto_141893 ) ) ( ON ?auto_141890 ?auto_141891 ) ( CLEAR ?auto_141890 ) ( HOLDING ?auto_141889 ) ( CLEAR ?auto_141888 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141888 ?auto_141889 )
      ( MAKE-5PILE ?auto_141888 ?auto_141889 ?auto_141890 ?auto_141891 ?auto_141892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141896 - BLOCK
      ?auto_141897 - BLOCK
      ?auto_141898 - BLOCK
      ?auto_141899 - BLOCK
      ?auto_141900 - BLOCK
    )
    :vars
    (
      ?auto_141903 - BLOCK
      ?auto_141902 - BLOCK
      ?auto_141901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141896 ) ( not ( = ?auto_141896 ?auto_141897 ) ) ( not ( = ?auto_141896 ?auto_141898 ) ) ( not ( = ?auto_141896 ?auto_141899 ) ) ( not ( = ?auto_141896 ?auto_141900 ) ) ( not ( = ?auto_141897 ?auto_141898 ) ) ( not ( = ?auto_141897 ?auto_141899 ) ) ( not ( = ?auto_141897 ?auto_141900 ) ) ( not ( = ?auto_141898 ?auto_141899 ) ) ( not ( = ?auto_141898 ?auto_141900 ) ) ( not ( = ?auto_141899 ?auto_141900 ) ) ( ON ?auto_141900 ?auto_141903 ) ( not ( = ?auto_141896 ?auto_141903 ) ) ( not ( = ?auto_141897 ?auto_141903 ) ) ( not ( = ?auto_141898 ?auto_141903 ) ) ( not ( = ?auto_141899 ?auto_141903 ) ) ( not ( = ?auto_141900 ?auto_141903 ) ) ( ON ?auto_141899 ?auto_141900 ) ( ON-TABLE ?auto_141902 ) ( ON ?auto_141901 ?auto_141902 ) ( ON ?auto_141903 ?auto_141901 ) ( not ( = ?auto_141902 ?auto_141901 ) ) ( not ( = ?auto_141902 ?auto_141903 ) ) ( not ( = ?auto_141902 ?auto_141900 ) ) ( not ( = ?auto_141902 ?auto_141899 ) ) ( not ( = ?auto_141901 ?auto_141903 ) ) ( not ( = ?auto_141901 ?auto_141900 ) ) ( not ( = ?auto_141901 ?auto_141899 ) ) ( not ( = ?auto_141896 ?auto_141902 ) ) ( not ( = ?auto_141896 ?auto_141901 ) ) ( not ( = ?auto_141897 ?auto_141902 ) ) ( not ( = ?auto_141897 ?auto_141901 ) ) ( not ( = ?auto_141898 ?auto_141902 ) ) ( not ( = ?auto_141898 ?auto_141901 ) ) ( ON ?auto_141898 ?auto_141899 ) ( CLEAR ?auto_141896 ) ( ON ?auto_141897 ?auto_141898 ) ( CLEAR ?auto_141897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141902 ?auto_141901 ?auto_141903 ?auto_141900 ?auto_141899 ?auto_141898 )
      ( MAKE-5PILE ?auto_141896 ?auto_141897 ?auto_141898 ?auto_141899 ?auto_141900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141904 - BLOCK
      ?auto_141905 - BLOCK
      ?auto_141906 - BLOCK
      ?auto_141907 - BLOCK
      ?auto_141908 - BLOCK
    )
    :vars
    (
      ?auto_141910 - BLOCK
      ?auto_141911 - BLOCK
      ?auto_141909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141904 ?auto_141905 ) ) ( not ( = ?auto_141904 ?auto_141906 ) ) ( not ( = ?auto_141904 ?auto_141907 ) ) ( not ( = ?auto_141904 ?auto_141908 ) ) ( not ( = ?auto_141905 ?auto_141906 ) ) ( not ( = ?auto_141905 ?auto_141907 ) ) ( not ( = ?auto_141905 ?auto_141908 ) ) ( not ( = ?auto_141906 ?auto_141907 ) ) ( not ( = ?auto_141906 ?auto_141908 ) ) ( not ( = ?auto_141907 ?auto_141908 ) ) ( ON ?auto_141908 ?auto_141910 ) ( not ( = ?auto_141904 ?auto_141910 ) ) ( not ( = ?auto_141905 ?auto_141910 ) ) ( not ( = ?auto_141906 ?auto_141910 ) ) ( not ( = ?auto_141907 ?auto_141910 ) ) ( not ( = ?auto_141908 ?auto_141910 ) ) ( ON ?auto_141907 ?auto_141908 ) ( ON-TABLE ?auto_141911 ) ( ON ?auto_141909 ?auto_141911 ) ( ON ?auto_141910 ?auto_141909 ) ( not ( = ?auto_141911 ?auto_141909 ) ) ( not ( = ?auto_141911 ?auto_141910 ) ) ( not ( = ?auto_141911 ?auto_141908 ) ) ( not ( = ?auto_141911 ?auto_141907 ) ) ( not ( = ?auto_141909 ?auto_141910 ) ) ( not ( = ?auto_141909 ?auto_141908 ) ) ( not ( = ?auto_141909 ?auto_141907 ) ) ( not ( = ?auto_141904 ?auto_141911 ) ) ( not ( = ?auto_141904 ?auto_141909 ) ) ( not ( = ?auto_141905 ?auto_141911 ) ) ( not ( = ?auto_141905 ?auto_141909 ) ) ( not ( = ?auto_141906 ?auto_141911 ) ) ( not ( = ?auto_141906 ?auto_141909 ) ) ( ON ?auto_141906 ?auto_141907 ) ( ON ?auto_141905 ?auto_141906 ) ( CLEAR ?auto_141905 ) ( HOLDING ?auto_141904 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141904 )
      ( MAKE-5PILE ?auto_141904 ?auto_141905 ?auto_141906 ?auto_141907 ?auto_141908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141912 - BLOCK
      ?auto_141913 - BLOCK
      ?auto_141914 - BLOCK
      ?auto_141915 - BLOCK
      ?auto_141916 - BLOCK
    )
    :vars
    (
      ?auto_141917 - BLOCK
      ?auto_141919 - BLOCK
      ?auto_141918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141912 ?auto_141913 ) ) ( not ( = ?auto_141912 ?auto_141914 ) ) ( not ( = ?auto_141912 ?auto_141915 ) ) ( not ( = ?auto_141912 ?auto_141916 ) ) ( not ( = ?auto_141913 ?auto_141914 ) ) ( not ( = ?auto_141913 ?auto_141915 ) ) ( not ( = ?auto_141913 ?auto_141916 ) ) ( not ( = ?auto_141914 ?auto_141915 ) ) ( not ( = ?auto_141914 ?auto_141916 ) ) ( not ( = ?auto_141915 ?auto_141916 ) ) ( ON ?auto_141916 ?auto_141917 ) ( not ( = ?auto_141912 ?auto_141917 ) ) ( not ( = ?auto_141913 ?auto_141917 ) ) ( not ( = ?auto_141914 ?auto_141917 ) ) ( not ( = ?auto_141915 ?auto_141917 ) ) ( not ( = ?auto_141916 ?auto_141917 ) ) ( ON ?auto_141915 ?auto_141916 ) ( ON-TABLE ?auto_141919 ) ( ON ?auto_141918 ?auto_141919 ) ( ON ?auto_141917 ?auto_141918 ) ( not ( = ?auto_141919 ?auto_141918 ) ) ( not ( = ?auto_141919 ?auto_141917 ) ) ( not ( = ?auto_141919 ?auto_141916 ) ) ( not ( = ?auto_141919 ?auto_141915 ) ) ( not ( = ?auto_141918 ?auto_141917 ) ) ( not ( = ?auto_141918 ?auto_141916 ) ) ( not ( = ?auto_141918 ?auto_141915 ) ) ( not ( = ?auto_141912 ?auto_141919 ) ) ( not ( = ?auto_141912 ?auto_141918 ) ) ( not ( = ?auto_141913 ?auto_141919 ) ) ( not ( = ?auto_141913 ?auto_141918 ) ) ( not ( = ?auto_141914 ?auto_141919 ) ) ( not ( = ?auto_141914 ?auto_141918 ) ) ( ON ?auto_141914 ?auto_141915 ) ( ON ?auto_141913 ?auto_141914 ) ( ON ?auto_141912 ?auto_141913 ) ( CLEAR ?auto_141912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141919 ?auto_141918 ?auto_141917 ?auto_141916 ?auto_141915 ?auto_141914 ?auto_141913 )
      ( MAKE-5PILE ?auto_141912 ?auto_141913 ?auto_141914 ?auto_141915 ?auto_141916 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141925 - BLOCK
      ?auto_141926 - BLOCK
      ?auto_141927 - BLOCK
      ?auto_141928 - BLOCK
      ?auto_141929 - BLOCK
    )
    :vars
    (
      ?auto_141931 - BLOCK
      ?auto_141932 - BLOCK
      ?auto_141930 - BLOCK
      ?auto_141933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141925 ?auto_141926 ) ) ( not ( = ?auto_141925 ?auto_141927 ) ) ( not ( = ?auto_141925 ?auto_141928 ) ) ( not ( = ?auto_141925 ?auto_141929 ) ) ( not ( = ?auto_141926 ?auto_141927 ) ) ( not ( = ?auto_141926 ?auto_141928 ) ) ( not ( = ?auto_141926 ?auto_141929 ) ) ( not ( = ?auto_141927 ?auto_141928 ) ) ( not ( = ?auto_141927 ?auto_141929 ) ) ( not ( = ?auto_141928 ?auto_141929 ) ) ( ON ?auto_141929 ?auto_141931 ) ( not ( = ?auto_141925 ?auto_141931 ) ) ( not ( = ?auto_141926 ?auto_141931 ) ) ( not ( = ?auto_141927 ?auto_141931 ) ) ( not ( = ?auto_141928 ?auto_141931 ) ) ( not ( = ?auto_141929 ?auto_141931 ) ) ( ON ?auto_141928 ?auto_141929 ) ( ON-TABLE ?auto_141932 ) ( ON ?auto_141930 ?auto_141932 ) ( ON ?auto_141931 ?auto_141930 ) ( not ( = ?auto_141932 ?auto_141930 ) ) ( not ( = ?auto_141932 ?auto_141931 ) ) ( not ( = ?auto_141932 ?auto_141929 ) ) ( not ( = ?auto_141932 ?auto_141928 ) ) ( not ( = ?auto_141930 ?auto_141931 ) ) ( not ( = ?auto_141930 ?auto_141929 ) ) ( not ( = ?auto_141930 ?auto_141928 ) ) ( not ( = ?auto_141925 ?auto_141932 ) ) ( not ( = ?auto_141925 ?auto_141930 ) ) ( not ( = ?auto_141926 ?auto_141932 ) ) ( not ( = ?auto_141926 ?auto_141930 ) ) ( not ( = ?auto_141927 ?auto_141932 ) ) ( not ( = ?auto_141927 ?auto_141930 ) ) ( ON ?auto_141927 ?auto_141928 ) ( ON ?auto_141926 ?auto_141927 ) ( CLEAR ?auto_141926 ) ( ON ?auto_141925 ?auto_141933 ) ( CLEAR ?auto_141925 ) ( HAND-EMPTY ) ( not ( = ?auto_141925 ?auto_141933 ) ) ( not ( = ?auto_141926 ?auto_141933 ) ) ( not ( = ?auto_141927 ?auto_141933 ) ) ( not ( = ?auto_141928 ?auto_141933 ) ) ( not ( = ?auto_141929 ?auto_141933 ) ) ( not ( = ?auto_141931 ?auto_141933 ) ) ( not ( = ?auto_141932 ?auto_141933 ) ) ( not ( = ?auto_141930 ?auto_141933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141925 ?auto_141933 )
      ( MAKE-5PILE ?auto_141925 ?auto_141926 ?auto_141927 ?auto_141928 ?auto_141929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141934 - BLOCK
      ?auto_141935 - BLOCK
      ?auto_141936 - BLOCK
      ?auto_141937 - BLOCK
      ?auto_141938 - BLOCK
    )
    :vars
    (
      ?auto_141939 - BLOCK
      ?auto_141940 - BLOCK
      ?auto_141941 - BLOCK
      ?auto_141942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141934 ?auto_141935 ) ) ( not ( = ?auto_141934 ?auto_141936 ) ) ( not ( = ?auto_141934 ?auto_141937 ) ) ( not ( = ?auto_141934 ?auto_141938 ) ) ( not ( = ?auto_141935 ?auto_141936 ) ) ( not ( = ?auto_141935 ?auto_141937 ) ) ( not ( = ?auto_141935 ?auto_141938 ) ) ( not ( = ?auto_141936 ?auto_141937 ) ) ( not ( = ?auto_141936 ?auto_141938 ) ) ( not ( = ?auto_141937 ?auto_141938 ) ) ( ON ?auto_141938 ?auto_141939 ) ( not ( = ?auto_141934 ?auto_141939 ) ) ( not ( = ?auto_141935 ?auto_141939 ) ) ( not ( = ?auto_141936 ?auto_141939 ) ) ( not ( = ?auto_141937 ?auto_141939 ) ) ( not ( = ?auto_141938 ?auto_141939 ) ) ( ON ?auto_141937 ?auto_141938 ) ( ON-TABLE ?auto_141940 ) ( ON ?auto_141941 ?auto_141940 ) ( ON ?auto_141939 ?auto_141941 ) ( not ( = ?auto_141940 ?auto_141941 ) ) ( not ( = ?auto_141940 ?auto_141939 ) ) ( not ( = ?auto_141940 ?auto_141938 ) ) ( not ( = ?auto_141940 ?auto_141937 ) ) ( not ( = ?auto_141941 ?auto_141939 ) ) ( not ( = ?auto_141941 ?auto_141938 ) ) ( not ( = ?auto_141941 ?auto_141937 ) ) ( not ( = ?auto_141934 ?auto_141940 ) ) ( not ( = ?auto_141934 ?auto_141941 ) ) ( not ( = ?auto_141935 ?auto_141940 ) ) ( not ( = ?auto_141935 ?auto_141941 ) ) ( not ( = ?auto_141936 ?auto_141940 ) ) ( not ( = ?auto_141936 ?auto_141941 ) ) ( ON ?auto_141936 ?auto_141937 ) ( ON ?auto_141934 ?auto_141942 ) ( CLEAR ?auto_141934 ) ( not ( = ?auto_141934 ?auto_141942 ) ) ( not ( = ?auto_141935 ?auto_141942 ) ) ( not ( = ?auto_141936 ?auto_141942 ) ) ( not ( = ?auto_141937 ?auto_141942 ) ) ( not ( = ?auto_141938 ?auto_141942 ) ) ( not ( = ?auto_141939 ?auto_141942 ) ) ( not ( = ?auto_141940 ?auto_141942 ) ) ( not ( = ?auto_141941 ?auto_141942 ) ) ( HOLDING ?auto_141935 ) ( CLEAR ?auto_141936 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141940 ?auto_141941 ?auto_141939 ?auto_141938 ?auto_141937 ?auto_141936 ?auto_141935 )
      ( MAKE-5PILE ?auto_141934 ?auto_141935 ?auto_141936 ?auto_141937 ?auto_141938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141943 - BLOCK
      ?auto_141944 - BLOCK
      ?auto_141945 - BLOCK
      ?auto_141946 - BLOCK
      ?auto_141947 - BLOCK
    )
    :vars
    (
      ?auto_141949 - BLOCK
      ?auto_141950 - BLOCK
      ?auto_141948 - BLOCK
      ?auto_141951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141943 ?auto_141944 ) ) ( not ( = ?auto_141943 ?auto_141945 ) ) ( not ( = ?auto_141943 ?auto_141946 ) ) ( not ( = ?auto_141943 ?auto_141947 ) ) ( not ( = ?auto_141944 ?auto_141945 ) ) ( not ( = ?auto_141944 ?auto_141946 ) ) ( not ( = ?auto_141944 ?auto_141947 ) ) ( not ( = ?auto_141945 ?auto_141946 ) ) ( not ( = ?auto_141945 ?auto_141947 ) ) ( not ( = ?auto_141946 ?auto_141947 ) ) ( ON ?auto_141947 ?auto_141949 ) ( not ( = ?auto_141943 ?auto_141949 ) ) ( not ( = ?auto_141944 ?auto_141949 ) ) ( not ( = ?auto_141945 ?auto_141949 ) ) ( not ( = ?auto_141946 ?auto_141949 ) ) ( not ( = ?auto_141947 ?auto_141949 ) ) ( ON ?auto_141946 ?auto_141947 ) ( ON-TABLE ?auto_141950 ) ( ON ?auto_141948 ?auto_141950 ) ( ON ?auto_141949 ?auto_141948 ) ( not ( = ?auto_141950 ?auto_141948 ) ) ( not ( = ?auto_141950 ?auto_141949 ) ) ( not ( = ?auto_141950 ?auto_141947 ) ) ( not ( = ?auto_141950 ?auto_141946 ) ) ( not ( = ?auto_141948 ?auto_141949 ) ) ( not ( = ?auto_141948 ?auto_141947 ) ) ( not ( = ?auto_141948 ?auto_141946 ) ) ( not ( = ?auto_141943 ?auto_141950 ) ) ( not ( = ?auto_141943 ?auto_141948 ) ) ( not ( = ?auto_141944 ?auto_141950 ) ) ( not ( = ?auto_141944 ?auto_141948 ) ) ( not ( = ?auto_141945 ?auto_141950 ) ) ( not ( = ?auto_141945 ?auto_141948 ) ) ( ON ?auto_141945 ?auto_141946 ) ( ON ?auto_141943 ?auto_141951 ) ( not ( = ?auto_141943 ?auto_141951 ) ) ( not ( = ?auto_141944 ?auto_141951 ) ) ( not ( = ?auto_141945 ?auto_141951 ) ) ( not ( = ?auto_141946 ?auto_141951 ) ) ( not ( = ?auto_141947 ?auto_141951 ) ) ( not ( = ?auto_141949 ?auto_141951 ) ) ( not ( = ?auto_141950 ?auto_141951 ) ) ( not ( = ?auto_141948 ?auto_141951 ) ) ( CLEAR ?auto_141945 ) ( ON ?auto_141944 ?auto_141943 ) ( CLEAR ?auto_141944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141951 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141951 ?auto_141943 )
      ( MAKE-5PILE ?auto_141943 ?auto_141944 ?auto_141945 ?auto_141946 ?auto_141947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141952 - BLOCK
      ?auto_141953 - BLOCK
      ?auto_141954 - BLOCK
      ?auto_141955 - BLOCK
      ?auto_141956 - BLOCK
    )
    :vars
    (
      ?auto_141959 - BLOCK
      ?auto_141958 - BLOCK
      ?auto_141957 - BLOCK
      ?auto_141960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141952 ?auto_141953 ) ) ( not ( = ?auto_141952 ?auto_141954 ) ) ( not ( = ?auto_141952 ?auto_141955 ) ) ( not ( = ?auto_141952 ?auto_141956 ) ) ( not ( = ?auto_141953 ?auto_141954 ) ) ( not ( = ?auto_141953 ?auto_141955 ) ) ( not ( = ?auto_141953 ?auto_141956 ) ) ( not ( = ?auto_141954 ?auto_141955 ) ) ( not ( = ?auto_141954 ?auto_141956 ) ) ( not ( = ?auto_141955 ?auto_141956 ) ) ( ON ?auto_141956 ?auto_141959 ) ( not ( = ?auto_141952 ?auto_141959 ) ) ( not ( = ?auto_141953 ?auto_141959 ) ) ( not ( = ?auto_141954 ?auto_141959 ) ) ( not ( = ?auto_141955 ?auto_141959 ) ) ( not ( = ?auto_141956 ?auto_141959 ) ) ( ON ?auto_141955 ?auto_141956 ) ( ON-TABLE ?auto_141958 ) ( ON ?auto_141957 ?auto_141958 ) ( ON ?auto_141959 ?auto_141957 ) ( not ( = ?auto_141958 ?auto_141957 ) ) ( not ( = ?auto_141958 ?auto_141959 ) ) ( not ( = ?auto_141958 ?auto_141956 ) ) ( not ( = ?auto_141958 ?auto_141955 ) ) ( not ( = ?auto_141957 ?auto_141959 ) ) ( not ( = ?auto_141957 ?auto_141956 ) ) ( not ( = ?auto_141957 ?auto_141955 ) ) ( not ( = ?auto_141952 ?auto_141958 ) ) ( not ( = ?auto_141952 ?auto_141957 ) ) ( not ( = ?auto_141953 ?auto_141958 ) ) ( not ( = ?auto_141953 ?auto_141957 ) ) ( not ( = ?auto_141954 ?auto_141958 ) ) ( not ( = ?auto_141954 ?auto_141957 ) ) ( ON ?auto_141952 ?auto_141960 ) ( not ( = ?auto_141952 ?auto_141960 ) ) ( not ( = ?auto_141953 ?auto_141960 ) ) ( not ( = ?auto_141954 ?auto_141960 ) ) ( not ( = ?auto_141955 ?auto_141960 ) ) ( not ( = ?auto_141956 ?auto_141960 ) ) ( not ( = ?auto_141959 ?auto_141960 ) ) ( not ( = ?auto_141958 ?auto_141960 ) ) ( not ( = ?auto_141957 ?auto_141960 ) ) ( ON ?auto_141953 ?auto_141952 ) ( CLEAR ?auto_141953 ) ( ON-TABLE ?auto_141960 ) ( HOLDING ?auto_141954 ) ( CLEAR ?auto_141955 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141958 ?auto_141957 ?auto_141959 ?auto_141956 ?auto_141955 ?auto_141954 )
      ( MAKE-5PILE ?auto_141952 ?auto_141953 ?auto_141954 ?auto_141955 ?auto_141956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141961 - BLOCK
      ?auto_141962 - BLOCK
      ?auto_141963 - BLOCK
      ?auto_141964 - BLOCK
      ?auto_141965 - BLOCK
    )
    :vars
    (
      ?auto_141967 - BLOCK
      ?auto_141966 - BLOCK
      ?auto_141968 - BLOCK
      ?auto_141969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141961 ?auto_141962 ) ) ( not ( = ?auto_141961 ?auto_141963 ) ) ( not ( = ?auto_141961 ?auto_141964 ) ) ( not ( = ?auto_141961 ?auto_141965 ) ) ( not ( = ?auto_141962 ?auto_141963 ) ) ( not ( = ?auto_141962 ?auto_141964 ) ) ( not ( = ?auto_141962 ?auto_141965 ) ) ( not ( = ?auto_141963 ?auto_141964 ) ) ( not ( = ?auto_141963 ?auto_141965 ) ) ( not ( = ?auto_141964 ?auto_141965 ) ) ( ON ?auto_141965 ?auto_141967 ) ( not ( = ?auto_141961 ?auto_141967 ) ) ( not ( = ?auto_141962 ?auto_141967 ) ) ( not ( = ?auto_141963 ?auto_141967 ) ) ( not ( = ?auto_141964 ?auto_141967 ) ) ( not ( = ?auto_141965 ?auto_141967 ) ) ( ON ?auto_141964 ?auto_141965 ) ( ON-TABLE ?auto_141966 ) ( ON ?auto_141968 ?auto_141966 ) ( ON ?auto_141967 ?auto_141968 ) ( not ( = ?auto_141966 ?auto_141968 ) ) ( not ( = ?auto_141966 ?auto_141967 ) ) ( not ( = ?auto_141966 ?auto_141965 ) ) ( not ( = ?auto_141966 ?auto_141964 ) ) ( not ( = ?auto_141968 ?auto_141967 ) ) ( not ( = ?auto_141968 ?auto_141965 ) ) ( not ( = ?auto_141968 ?auto_141964 ) ) ( not ( = ?auto_141961 ?auto_141966 ) ) ( not ( = ?auto_141961 ?auto_141968 ) ) ( not ( = ?auto_141962 ?auto_141966 ) ) ( not ( = ?auto_141962 ?auto_141968 ) ) ( not ( = ?auto_141963 ?auto_141966 ) ) ( not ( = ?auto_141963 ?auto_141968 ) ) ( ON ?auto_141961 ?auto_141969 ) ( not ( = ?auto_141961 ?auto_141969 ) ) ( not ( = ?auto_141962 ?auto_141969 ) ) ( not ( = ?auto_141963 ?auto_141969 ) ) ( not ( = ?auto_141964 ?auto_141969 ) ) ( not ( = ?auto_141965 ?auto_141969 ) ) ( not ( = ?auto_141967 ?auto_141969 ) ) ( not ( = ?auto_141966 ?auto_141969 ) ) ( not ( = ?auto_141968 ?auto_141969 ) ) ( ON ?auto_141962 ?auto_141961 ) ( ON-TABLE ?auto_141969 ) ( CLEAR ?auto_141964 ) ( ON ?auto_141963 ?auto_141962 ) ( CLEAR ?auto_141963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141969 ?auto_141961 ?auto_141962 )
      ( MAKE-5PILE ?auto_141961 ?auto_141962 ?auto_141963 ?auto_141964 ?auto_141965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141970 - BLOCK
      ?auto_141971 - BLOCK
      ?auto_141972 - BLOCK
      ?auto_141973 - BLOCK
      ?auto_141974 - BLOCK
    )
    :vars
    (
      ?auto_141978 - BLOCK
      ?auto_141977 - BLOCK
      ?auto_141976 - BLOCK
      ?auto_141975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141970 ?auto_141971 ) ) ( not ( = ?auto_141970 ?auto_141972 ) ) ( not ( = ?auto_141970 ?auto_141973 ) ) ( not ( = ?auto_141970 ?auto_141974 ) ) ( not ( = ?auto_141971 ?auto_141972 ) ) ( not ( = ?auto_141971 ?auto_141973 ) ) ( not ( = ?auto_141971 ?auto_141974 ) ) ( not ( = ?auto_141972 ?auto_141973 ) ) ( not ( = ?auto_141972 ?auto_141974 ) ) ( not ( = ?auto_141973 ?auto_141974 ) ) ( ON ?auto_141974 ?auto_141978 ) ( not ( = ?auto_141970 ?auto_141978 ) ) ( not ( = ?auto_141971 ?auto_141978 ) ) ( not ( = ?auto_141972 ?auto_141978 ) ) ( not ( = ?auto_141973 ?auto_141978 ) ) ( not ( = ?auto_141974 ?auto_141978 ) ) ( ON-TABLE ?auto_141977 ) ( ON ?auto_141976 ?auto_141977 ) ( ON ?auto_141978 ?auto_141976 ) ( not ( = ?auto_141977 ?auto_141976 ) ) ( not ( = ?auto_141977 ?auto_141978 ) ) ( not ( = ?auto_141977 ?auto_141974 ) ) ( not ( = ?auto_141977 ?auto_141973 ) ) ( not ( = ?auto_141976 ?auto_141978 ) ) ( not ( = ?auto_141976 ?auto_141974 ) ) ( not ( = ?auto_141976 ?auto_141973 ) ) ( not ( = ?auto_141970 ?auto_141977 ) ) ( not ( = ?auto_141970 ?auto_141976 ) ) ( not ( = ?auto_141971 ?auto_141977 ) ) ( not ( = ?auto_141971 ?auto_141976 ) ) ( not ( = ?auto_141972 ?auto_141977 ) ) ( not ( = ?auto_141972 ?auto_141976 ) ) ( ON ?auto_141970 ?auto_141975 ) ( not ( = ?auto_141970 ?auto_141975 ) ) ( not ( = ?auto_141971 ?auto_141975 ) ) ( not ( = ?auto_141972 ?auto_141975 ) ) ( not ( = ?auto_141973 ?auto_141975 ) ) ( not ( = ?auto_141974 ?auto_141975 ) ) ( not ( = ?auto_141978 ?auto_141975 ) ) ( not ( = ?auto_141977 ?auto_141975 ) ) ( not ( = ?auto_141976 ?auto_141975 ) ) ( ON ?auto_141971 ?auto_141970 ) ( ON-TABLE ?auto_141975 ) ( ON ?auto_141972 ?auto_141971 ) ( CLEAR ?auto_141972 ) ( HOLDING ?auto_141973 ) ( CLEAR ?auto_141974 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141977 ?auto_141976 ?auto_141978 ?auto_141974 ?auto_141973 )
      ( MAKE-5PILE ?auto_141970 ?auto_141971 ?auto_141972 ?auto_141973 ?auto_141974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141979 - BLOCK
      ?auto_141980 - BLOCK
      ?auto_141981 - BLOCK
      ?auto_141982 - BLOCK
      ?auto_141983 - BLOCK
    )
    :vars
    (
      ?auto_141987 - BLOCK
      ?auto_141985 - BLOCK
      ?auto_141986 - BLOCK
      ?auto_141984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141979 ?auto_141980 ) ) ( not ( = ?auto_141979 ?auto_141981 ) ) ( not ( = ?auto_141979 ?auto_141982 ) ) ( not ( = ?auto_141979 ?auto_141983 ) ) ( not ( = ?auto_141980 ?auto_141981 ) ) ( not ( = ?auto_141980 ?auto_141982 ) ) ( not ( = ?auto_141980 ?auto_141983 ) ) ( not ( = ?auto_141981 ?auto_141982 ) ) ( not ( = ?auto_141981 ?auto_141983 ) ) ( not ( = ?auto_141982 ?auto_141983 ) ) ( ON ?auto_141983 ?auto_141987 ) ( not ( = ?auto_141979 ?auto_141987 ) ) ( not ( = ?auto_141980 ?auto_141987 ) ) ( not ( = ?auto_141981 ?auto_141987 ) ) ( not ( = ?auto_141982 ?auto_141987 ) ) ( not ( = ?auto_141983 ?auto_141987 ) ) ( ON-TABLE ?auto_141985 ) ( ON ?auto_141986 ?auto_141985 ) ( ON ?auto_141987 ?auto_141986 ) ( not ( = ?auto_141985 ?auto_141986 ) ) ( not ( = ?auto_141985 ?auto_141987 ) ) ( not ( = ?auto_141985 ?auto_141983 ) ) ( not ( = ?auto_141985 ?auto_141982 ) ) ( not ( = ?auto_141986 ?auto_141987 ) ) ( not ( = ?auto_141986 ?auto_141983 ) ) ( not ( = ?auto_141986 ?auto_141982 ) ) ( not ( = ?auto_141979 ?auto_141985 ) ) ( not ( = ?auto_141979 ?auto_141986 ) ) ( not ( = ?auto_141980 ?auto_141985 ) ) ( not ( = ?auto_141980 ?auto_141986 ) ) ( not ( = ?auto_141981 ?auto_141985 ) ) ( not ( = ?auto_141981 ?auto_141986 ) ) ( ON ?auto_141979 ?auto_141984 ) ( not ( = ?auto_141979 ?auto_141984 ) ) ( not ( = ?auto_141980 ?auto_141984 ) ) ( not ( = ?auto_141981 ?auto_141984 ) ) ( not ( = ?auto_141982 ?auto_141984 ) ) ( not ( = ?auto_141983 ?auto_141984 ) ) ( not ( = ?auto_141987 ?auto_141984 ) ) ( not ( = ?auto_141985 ?auto_141984 ) ) ( not ( = ?auto_141986 ?auto_141984 ) ) ( ON ?auto_141980 ?auto_141979 ) ( ON-TABLE ?auto_141984 ) ( ON ?auto_141981 ?auto_141980 ) ( CLEAR ?auto_141983 ) ( ON ?auto_141982 ?auto_141981 ) ( CLEAR ?auto_141982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141984 ?auto_141979 ?auto_141980 ?auto_141981 )
      ( MAKE-5PILE ?auto_141979 ?auto_141980 ?auto_141981 ?auto_141982 ?auto_141983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141988 - BLOCK
      ?auto_141989 - BLOCK
      ?auto_141990 - BLOCK
      ?auto_141991 - BLOCK
      ?auto_141992 - BLOCK
    )
    :vars
    (
      ?auto_141996 - BLOCK
      ?auto_141994 - BLOCK
      ?auto_141995 - BLOCK
      ?auto_141993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141988 ?auto_141989 ) ) ( not ( = ?auto_141988 ?auto_141990 ) ) ( not ( = ?auto_141988 ?auto_141991 ) ) ( not ( = ?auto_141988 ?auto_141992 ) ) ( not ( = ?auto_141989 ?auto_141990 ) ) ( not ( = ?auto_141989 ?auto_141991 ) ) ( not ( = ?auto_141989 ?auto_141992 ) ) ( not ( = ?auto_141990 ?auto_141991 ) ) ( not ( = ?auto_141990 ?auto_141992 ) ) ( not ( = ?auto_141991 ?auto_141992 ) ) ( not ( = ?auto_141988 ?auto_141996 ) ) ( not ( = ?auto_141989 ?auto_141996 ) ) ( not ( = ?auto_141990 ?auto_141996 ) ) ( not ( = ?auto_141991 ?auto_141996 ) ) ( not ( = ?auto_141992 ?auto_141996 ) ) ( ON-TABLE ?auto_141994 ) ( ON ?auto_141995 ?auto_141994 ) ( ON ?auto_141996 ?auto_141995 ) ( not ( = ?auto_141994 ?auto_141995 ) ) ( not ( = ?auto_141994 ?auto_141996 ) ) ( not ( = ?auto_141994 ?auto_141992 ) ) ( not ( = ?auto_141994 ?auto_141991 ) ) ( not ( = ?auto_141995 ?auto_141996 ) ) ( not ( = ?auto_141995 ?auto_141992 ) ) ( not ( = ?auto_141995 ?auto_141991 ) ) ( not ( = ?auto_141988 ?auto_141994 ) ) ( not ( = ?auto_141988 ?auto_141995 ) ) ( not ( = ?auto_141989 ?auto_141994 ) ) ( not ( = ?auto_141989 ?auto_141995 ) ) ( not ( = ?auto_141990 ?auto_141994 ) ) ( not ( = ?auto_141990 ?auto_141995 ) ) ( ON ?auto_141988 ?auto_141993 ) ( not ( = ?auto_141988 ?auto_141993 ) ) ( not ( = ?auto_141989 ?auto_141993 ) ) ( not ( = ?auto_141990 ?auto_141993 ) ) ( not ( = ?auto_141991 ?auto_141993 ) ) ( not ( = ?auto_141992 ?auto_141993 ) ) ( not ( = ?auto_141996 ?auto_141993 ) ) ( not ( = ?auto_141994 ?auto_141993 ) ) ( not ( = ?auto_141995 ?auto_141993 ) ) ( ON ?auto_141989 ?auto_141988 ) ( ON-TABLE ?auto_141993 ) ( ON ?auto_141990 ?auto_141989 ) ( ON ?auto_141991 ?auto_141990 ) ( CLEAR ?auto_141991 ) ( HOLDING ?auto_141992 ) ( CLEAR ?auto_141996 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141994 ?auto_141995 ?auto_141996 ?auto_141992 )
      ( MAKE-5PILE ?auto_141988 ?auto_141989 ?auto_141990 ?auto_141991 ?auto_141992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_141997 - BLOCK
      ?auto_141998 - BLOCK
      ?auto_141999 - BLOCK
      ?auto_142000 - BLOCK
      ?auto_142001 - BLOCK
    )
    :vars
    (
      ?auto_142002 - BLOCK
      ?auto_142003 - BLOCK
      ?auto_142004 - BLOCK
      ?auto_142005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141997 ?auto_141998 ) ) ( not ( = ?auto_141997 ?auto_141999 ) ) ( not ( = ?auto_141997 ?auto_142000 ) ) ( not ( = ?auto_141997 ?auto_142001 ) ) ( not ( = ?auto_141998 ?auto_141999 ) ) ( not ( = ?auto_141998 ?auto_142000 ) ) ( not ( = ?auto_141998 ?auto_142001 ) ) ( not ( = ?auto_141999 ?auto_142000 ) ) ( not ( = ?auto_141999 ?auto_142001 ) ) ( not ( = ?auto_142000 ?auto_142001 ) ) ( not ( = ?auto_141997 ?auto_142002 ) ) ( not ( = ?auto_141998 ?auto_142002 ) ) ( not ( = ?auto_141999 ?auto_142002 ) ) ( not ( = ?auto_142000 ?auto_142002 ) ) ( not ( = ?auto_142001 ?auto_142002 ) ) ( ON-TABLE ?auto_142003 ) ( ON ?auto_142004 ?auto_142003 ) ( ON ?auto_142002 ?auto_142004 ) ( not ( = ?auto_142003 ?auto_142004 ) ) ( not ( = ?auto_142003 ?auto_142002 ) ) ( not ( = ?auto_142003 ?auto_142001 ) ) ( not ( = ?auto_142003 ?auto_142000 ) ) ( not ( = ?auto_142004 ?auto_142002 ) ) ( not ( = ?auto_142004 ?auto_142001 ) ) ( not ( = ?auto_142004 ?auto_142000 ) ) ( not ( = ?auto_141997 ?auto_142003 ) ) ( not ( = ?auto_141997 ?auto_142004 ) ) ( not ( = ?auto_141998 ?auto_142003 ) ) ( not ( = ?auto_141998 ?auto_142004 ) ) ( not ( = ?auto_141999 ?auto_142003 ) ) ( not ( = ?auto_141999 ?auto_142004 ) ) ( ON ?auto_141997 ?auto_142005 ) ( not ( = ?auto_141997 ?auto_142005 ) ) ( not ( = ?auto_141998 ?auto_142005 ) ) ( not ( = ?auto_141999 ?auto_142005 ) ) ( not ( = ?auto_142000 ?auto_142005 ) ) ( not ( = ?auto_142001 ?auto_142005 ) ) ( not ( = ?auto_142002 ?auto_142005 ) ) ( not ( = ?auto_142003 ?auto_142005 ) ) ( not ( = ?auto_142004 ?auto_142005 ) ) ( ON ?auto_141998 ?auto_141997 ) ( ON-TABLE ?auto_142005 ) ( ON ?auto_141999 ?auto_141998 ) ( ON ?auto_142000 ?auto_141999 ) ( CLEAR ?auto_142002 ) ( ON ?auto_142001 ?auto_142000 ) ( CLEAR ?auto_142001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142005 ?auto_141997 ?auto_141998 ?auto_141999 ?auto_142000 )
      ( MAKE-5PILE ?auto_141997 ?auto_141998 ?auto_141999 ?auto_142000 ?auto_142001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_142006 - BLOCK
      ?auto_142007 - BLOCK
      ?auto_142008 - BLOCK
      ?auto_142009 - BLOCK
      ?auto_142010 - BLOCK
    )
    :vars
    (
      ?auto_142011 - BLOCK
      ?auto_142014 - BLOCK
      ?auto_142013 - BLOCK
      ?auto_142012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142006 ?auto_142007 ) ) ( not ( = ?auto_142006 ?auto_142008 ) ) ( not ( = ?auto_142006 ?auto_142009 ) ) ( not ( = ?auto_142006 ?auto_142010 ) ) ( not ( = ?auto_142007 ?auto_142008 ) ) ( not ( = ?auto_142007 ?auto_142009 ) ) ( not ( = ?auto_142007 ?auto_142010 ) ) ( not ( = ?auto_142008 ?auto_142009 ) ) ( not ( = ?auto_142008 ?auto_142010 ) ) ( not ( = ?auto_142009 ?auto_142010 ) ) ( not ( = ?auto_142006 ?auto_142011 ) ) ( not ( = ?auto_142007 ?auto_142011 ) ) ( not ( = ?auto_142008 ?auto_142011 ) ) ( not ( = ?auto_142009 ?auto_142011 ) ) ( not ( = ?auto_142010 ?auto_142011 ) ) ( ON-TABLE ?auto_142014 ) ( ON ?auto_142013 ?auto_142014 ) ( not ( = ?auto_142014 ?auto_142013 ) ) ( not ( = ?auto_142014 ?auto_142011 ) ) ( not ( = ?auto_142014 ?auto_142010 ) ) ( not ( = ?auto_142014 ?auto_142009 ) ) ( not ( = ?auto_142013 ?auto_142011 ) ) ( not ( = ?auto_142013 ?auto_142010 ) ) ( not ( = ?auto_142013 ?auto_142009 ) ) ( not ( = ?auto_142006 ?auto_142014 ) ) ( not ( = ?auto_142006 ?auto_142013 ) ) ( not ( = ?auto_142007 ?auto_142014 ) ) ( not ( = ?auto_142007 ?auto_142013 ) ) ( not ( = ?auto_142008 ?auto_142014 ) ) ( not ( = ?auto_142008 ?auto_142013 ) ) ( ON ?auto_142006 ?auto_142012 ) ( not ( = ?auto_142006 ?auto_142012 ) ) ( not ( = ?auto_142007 ?auto_142012 ) ) ( not ( = ?auto_142008 ?auto_142012 ) ) ( not ( = ?auto_142009 ?auto_142012 ) ) ( not ( = ?auto_142010 ?auto_142012 ) ) ( not ( = ?auto_142011 ?auto_142012 ) ) ( not ( = ?auto_142014 ?auto_142012 ) ) ( not ( = ?auto_142013 ?auto_142012 ) ) ( ON ?auto_142007 ?auto_142006 ) ( ON-TABLE ?auto_142012 ) ( ON ?auto_142008 ?auto_142007 ) ( ON ?auto_142009 ?auto_142008 ) ( ON ?auto_142010 ?auto_142009 ) ( CLEAR ?auto_142010 ) ( HOLDING ?auto_142011 ) ( CLEAR ?auto_142013 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142014 ?auto_142013 ?auto_142011 )
      ( MAKE-5PILE ?auto_142006 ?auto_142007 ?auto_142008 ?auto_142009 ?auto_142010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_142015 - BLOCK
      ?auto_142016 - BLOCK
      ?auto_142017 - BLOCK
      ?auto_142018 - BLOCK
      ?auto_142019 - BLOCK
    )
    :vars
    (
      ?auto_142021 - BLOCK
      ?auto_142022 - BLOCK
      ?auto_142020 - BLOCK
      ?auto_142023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142015 ?auto_142016 ) ) ( not ( = ?auto_142015 ?auto_142017 ) ) ( not ( = ?auto_142015 ?auto_142018 ) ) ( not ( = ?auto_142015 ?auto_142019 ) ) ( not ( = ?auto_142016 ?auto_142017 ) ) ( not ( = ?auto_142016 ?auto_142018 ) ) ( not ( = ?auto_142016 ?auto_142019 ) ) ( not ( = ?auto_142017 ?auto_142018 ) ) ( not ( = ?auto_142017 ?auto_142019 ) ) ( not ( = ?auto_142018 ?auto_142019 ) ) ( not ( = ?auto_142015 ?auto_142021 ) ) ( not ( = ?auto_142016 ?auto_142021 ) ) ( not ( = ?auto_142017 ?auto_142021 ) ) ( not ( = ?auto_142018 ?auto_142021 ) ) ( not ( = ?auto_142019 ?auto_142021 ) ) ( ON-TABLE ?auto_142022 ) ( ON ?auto_142020 ?auto_142022 ) ( not ( = ?auto_142022 ?auto_142020 ) ) ( not ( = ?auto_142022 ?auto_142021 ) ) ( not ( = ?auto_142022 ?auto_142019 ) ) ( not ( = ?auto_142022 ?auto_142018 ) ) ( not ( = ?auto_142020 ?auto_142021 ) ) ( not ( = ?auto_142020 ?auto_142019 ) ) ( not ( = ?auto_142020 ?auto_142018 ) ) ( not ( = ?auto_142015 ?auto_142022 ) ) ( not ( = ?auto_142015 ?auto_142020 ) ) ( not ( = ?auto_142016 ?auto_142022 ) ) ( not ( = ?auto_142016 ?auto_142020 ) ) ( not ( = ?auto_142017 ?auto_142022 ) ) ( not ( = ?auto_142017 ?auto_142020 ) ) ( ON ?auto_142015 ?auto_142023 ) ( not ( = ?auto_142015 ?auto_142023 ) ) ( not ( = ?auto_142016 ?auto_142023 ) ) ( not ( = ?auto_142017 ?auto_142023 ) ) ( not ( = ?auto_142018 ?auto_142023 ) ) ( not ( = ?auto_142019 ?auto_142023 ) ) ( not ( = ?auto_142021 ?auto_142023 ) ) ( not ( = ?auto_142022 ?auto_142023 ) ) ( not ( = ?auto_142020 ?auto_142023 ) ) ( ON ?auto_142016 ?auto_142015 ) ( ON-TABLE ?auto_142023 ) ( ON ?auto_142017 ?auto_142016 ) ( ON ?auto_142018 ?auto_142017 ) ( ON ?auto_142019 ?auto_142018 ) ( CLEAR ?auto_142020 ) ( ON ?auto_142021 ?auto_142019 ) ( CLEAR ?auto_142021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142023 ?auto_142015 ?auto_142016 ?auto_142017 ?auto_142018 ?auto_142019 )
      ( MAKE-5PILE ?auto_142015 ?auto_142016 ?auto_142017 ?auto_142018 ?auto_142019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_142024 - BLOCK
      ?auto_142025 - BLOCK
      ?auto_142026 - BLOCK
      ?auto_142027 - BLOCK
      ?auto_142028 - BLOCK
    )
    :vars
    (
      ?auto_142029 - BLOCK
      ?auto_142032 - BLOCK
      ?auto_142030 - BLOCK
      ?auto_142031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142024 ?auto_142025 ) ) ( not ( = ?auto_142024 ?auto_142026 ) ) ( not ( = ?auto_142024 ?auto_142027 ) ) ( not ( = ?auto_142024 ?auto_142028 ) ) ( not ( = ?auto_142025 ?auto_142026 ) ) ( not ( = ?auto_142025 ?auto_142027 ) ) ( not ( = ?auto_142025 ?auto_142028 ) ) ( not ( = ?auto_142026 ?auto_142027 ) ) ( not ( = ?auto_142026 ?auto_142028 ) ) ( not ( = ?auto_142027 ?auto_142028 ) ) ( not ( = ?auto_142024 ?auto_142029 ) ) ( not ( = ?auto_142025 ?auto_142029 ) ) ( not ( = ?auto_142026 ?auto_142029 ) ) ( not ( = ?auto_142027 ?auto_142029 ) ) ( not ( = ?auto_142028 ?auto_142029 ) ) ( ON-TABLE ?auto_142032 ) ( not ( = ?auto_142032 ?auto_142030 ) ) ( not ( = ?auto_142032 ?auto_142029 ) ) ( not ( = ?auto_142032 ?auto_142028 ) ) ( not ( = ?auto_142032 ?auto_142027 ) ) ( not ( = ?auto_142030 ?auto_142029 ) ) ( not ( = ?auto_142030 ?auto_142028 ) ) ( not ( = ?auto_142030 ?auto_142027 ) ) ( not ( = ?auto_142024 ?auto_142032 ) ) ( not ( = ?auto_142024 ?auto_142030 ) ) ( not ( = ?auto_142025 ?auto_142032 ) ) ( not ( = ?auto_142025 ?auto_142030 ) ) ( not ( = ?auto_142026 ?auto_142032 ) ) ( not ( = ?auto_142026 ?auto_142030 ) ) ( ON ?auto_142024 ?auto_142031 ) ( not ( = ?auto_142024 ?auto_142031 ) ) ( not ( = ?auto_142025 ?auto_142031 ) ) ( not ( = ?auto_142026 ?auto_142031 ) ) ( not ( = ?auto_142027 ?auto_142031 ) ) ( not ( = ?auto_142028 ?auto_142031 ) ) ( not ( = ?auto_142029 ?auto_142031 ) ) ( not ( = ?auto_142032 ?auto_142031 ) ) ( not ( = ?auto_142030 ?auto_142031 ) ) ( ON ?auto_142025 ?auto_142024 ) ( ON-TABLE ?auto_142031 ) ( ON ?auto_142026 ?auto_142025 ) ( ON ?auto_142027 ?auto_142026 ) ( ON ?auto_142028 ?auto_142027 ) ( ON ?auto_142029 ?auto_142028 ) ( CLEAR ?auto_142029 ) ( HOLDING ?auto_142030 ) ( CLEAR ?auto_142032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142032 ?auto_142030 )
      ( MAKE-5PILE ?auto_142024 ?auto_142025 ?auto_142026 ?auto_142027 ?auto_142028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_142033 - BLOCK
      ?auto_142034 - BLOCK
      ?auto_142035 - BLOCK
      ?auto_142036 - BLOCK
      ?auto_142037 - BLOCK
    )
    :vars
    (
      ?auto_142040 - BLOCK
      ?auto_142039 - BLOCK
      ?auto_142041 - BLOCK
      ?auto_142038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142033 ?auto_142034 ) ) ( not ( = ?auto_142033 ?auto_142035 ) ) ( not ( = ?auto_142033 ?auto_142036 ) ) ( not ( = ?auto_142033 ?auto_142037 ) ) ( not ( = ?auto_142034 ?auto_142035 ) ) ( not ( = ?auto_142034 ?auto_142036 ) ) ( not ( = ?auto_142034 ?auto_142037 ) ) ( not ( = ?auto_142035 ?auto_142036 ) ) ( not ( = ?auto_142035 ?auto_142037 ) ) ( not ( = ?auto_142036 ?auto_142037 ) ) ( not ( = ?auto_142033 ?auto_142040 ) ) ( not ( = ?auto_142034 ?auto_142040 ) ) ( not ( = ?auto_142035 ?auto_142040 ) ) ( not ( = ?auto_142036 ?auto_142040 ) ) ( not ( = ?auto_142037 ?auto_142040 ) ) ( ON-TABLE ?auto_142039 ) ( not ( = ?auto_142039 ?auto_142041 ) ) ( not ( = ?auto_142039 ?auto_142040 ) ) ( not ( = ?auto_142039 ?auto_142037 ) ) ( not ( = ?auto_142039 ?auto_142036 ) ) ( not ( = ?auto_142041 ?auto_142040 ) ) ( not ( = ?auto_142041 ?auto_142037 ) ) ( not ( = ?auto_142041 ?auto_142036 ) ) ( not ( = ?auto_142033 ?auto_142039 ) ) ( not ( = ?auto_142033 ?auto_142041 ) ) ( not ( = ?auto_142034 ?auto_142039 ) ) ( not ( = ?auto_142034 ?auto_142041 ) ) ( not ( = ?auto_142035 ?auto_142039 ) ) ( not ( = ?auto_142035 ?auto_142041 ) ) ( ON ?auto_142033 ?auto_142038 ) ( not ( = ?auto_142033 ?auto_142038 ) ) ( not ( = ?auto_142034 ?auto_142038 ) ) ( not ( = ?auto_142035 ?auto_142038 ) ) ( not ( = ?auto_142036 ?auto_142038 ) ) ( not ( = ?auto_142037 ?auto_142038 ) ) ( not ( = ?auto_142040 ?auto_142038 ) ) ( not ( = ?auto_142039 ?auto_142038 ) ) ( not ( = ?auto_142041 ?auto_142038 ) ) ( ON ?auto_142034 ?auto_142033 ) ( ON-TABLE ?auto_142038 ) ( ON ?auto_142035 ?auto_142034 ) ( ON ?auto_142036 ?auto_142035 ) ( ON ?auto_142037 ?auto_142036 ) ( ON ?auto_142040 ?auto_142037 ) ( CLEAR ?auto_142039 ) ( ON ?auto_142041 ?auto_142040 ) ( CLEAR ?auto_142041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142038 ?auto_142033 ?auto_142034 ?auto_142035 ?auto_142036 ?auto_142037 ?auto_142040 )
      ( MAKE-5PILE ?auto_142033 ?auto_142034 ?auto_142035 ?auto_142036 ?auto_142037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_142042 - BLOCK
      ?auto_142043 - BLOCK
      ?auto_142044 - BLOCK
      ?auto_142045 - BLOCK
      ?auto_142046 - BLOCK
    )
    :vars
    (
      ?auto_142047 - BLOCK
      ?auto_142048 - BLOCK
      ?auto_142049 - BLOCK
      ?auto_142050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142042 ?auto_142043 ) ) ( not ( = ?auto_142042 ?auto_142044 ) ) ( not ( = ?auto_142042 ?auto_142045 ) ) ( not ( = ?auto_142042 ?auto_142046 ) ) ( not ( = ?auto_142043 ?auto_142044 ) ) ( not ( = ?auto_142043 ?auto_142045 ) ) ( not ( = ?auto_142043 ?auto_142046 ) ) ( not ( = ?auto_142044 ?auto_142045 ) ) ( not ( = ?auto_142044 ?auto_142046 ) ) ( not ( = ?auto_142045 ?auto_142046 ) ) ( not ( = ?auto_142042 ?auto_142047 ) ) ( not ( = ?auto_142043 ?auto_142047 ) ) ( not ( = ?auto_142044 ?auto_142047 ) ) ( not ( = ?auto_142045 ?auto_142047 ) ) ( not ( = ?auto_142046 ?auto_142047 ) ) ( not ( = ?auto_142048 ?auto_142049 ) ) ( not ( = ?auto_142048 ?auto_142047 ) ) ( not ( = ?auto_142048 ?auto_142046 ) ) ( not ( = ?auto_142048 ?auto_142045 ) ) ( not ( = ?auto_142049 ?auto_142047 ) ) ( not ( = ?auto_142049 ?auto_142046 ) ) ( not ( = ?auto_142049 ?auto_142045 ) ) ( not ( = ?auto_142042 ?auto_142048 ) ) ( not ( = ?auto_142042 ?auto_142049 ) ) ( not ( = ?auto_142043 ?auto_142048 ) ) ( not ( = ?auto_142043 ?auto_142049 ) ) ( not ( = ?auto_142044 ?auto_142048 ) ) ( not ( = ?auto_142044 ?auto_142049 ) ) ( ON ?auto_142042 ?auto_142050 ) ( not ( = ?auto_142042 ?auto_142050 ) ) ( not ( = ?auto_142043 ?auto_142050 ) ) ( not ( = ?auto_142044 ?auto_142050 ) ) ( not ( = ?auto_142045 ?auto_142050 ) ) ( not ( = ?auto_142046 ?auto_142050 ) ) ( not ( = ?auto_142047 ?auto_142050 ) ) ( not ( = ?auto_142048 ?auto_142050 ) ) ( not ( = ?auto_142049 ?auto_142050 ) ) ( ON ?auto_142043 ?auto_142042 ) ( ON-TABLE ?auto_142050 ) ( ON ?auto_142044 ?auto_142043 ) ( ON ?auto_142045 ?auto_142044 ) ( ON ?auto_142046 ?auto_142045 ) ( ON ?auto_142047 ?auto_142046 ) ( ON ?auto_142049 ?auto_142047 ) ( CLEAR ?auto_142049 ) ( HOLDING ?auto_142048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142048 )
      ( MAKE-5PILE ?auto_142042 ?auto_142043 ?auto_142044 ?auto_142045 ?auto_142046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_142051 - BLOCK
      ?auto_142052 - BLOCK
      ?auto_142053 - BLOCK
      ?auto_142054 - BLOCK
      ?auto_142055 - BLOCK
    )
    :vars
    (
      ?auto_142056 - BLOCK
      ?auto_142057 - BLOCK
      ?auto_142058 - BLOCK
      ?auto_142059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142051 ?auto_142052 ) ) ( not ( = ?auto_142051 ?auto_142053 ) ) ( not ( = ?auto_142051 ?auto_142054 ) ) ( not ( = ?auto_142051 ?auto_142055 ) ) ( not ( = ?auto_142052 ?auto_142053 ) ) ( not ( = ?auto_142052 ?auto_142054 ) ) ( not ( = ?auto_142052 ?auto_142055 ) ) ( not ( = ?auto_142053 ?auto_142054 ) ) ( not ( = ?auto_142053 ?auto_142055 ) ) ( not ( = ?auto_142054 ?auto_142055 ) ) ( not ( = ?auto_142051 ?auto_142056 ) ) ( not ( = ?auto_142052 ?auto_142056 ) ) ( not ( = ?auto_142053 ?auto_142056 ) ) ( not ( = ?auto_142054 ?auto_142056 ) ) ( not ( = ?auto_142055 ?auto_142056 ) ) ( not ( = ?auto_142057 ?auto_142058 ) ) ( not ( = ?auto_142057 ?auto_142056 ) ) ( not ( = ?auto_142057 ?auto_142055 ) ) ( not ( = ?auto_142057 ?auto_142054 ) ) ( not ( = ?auto_142058 ?auto_142056 ) ) ( not ( = ?auto_142058 ?auto_142055 ) ) ( not ( = ?auto_142058 ?auto_142054 ) ) ( not ( = ?auto_142051 ?auto_142057 ) ) ( not ( = ?auto_142051 ?auto_142058 ) ) ( not ( = ?auto_142052 ?auto_142057 ) ) ( not ( = ?auto_142052 ?auto_142058 ) ) ( not ( = ?auto_142053 ?auto_142057 ) ) ( not ( = ?auto_142053 ?auto_142058 ) ) ( ON ?auto_142051 ?auto_142059 ) ( not ( = ?auto_142051 ?auto_142059 ) ) ( not ( = ?auto_142052 ?auto_142059 ) ) ( not ( = ?auto_142053 ?auto_142059 ) ) ( not ( = ?auto_142054 ?auto_142059 ) ) ( not ( = ?auto_142055 ?auto_142059 ) ) ( not ( = ?auto_142056 ?auto_142059 ) ) ( not ( = ?auto_142057 ?auto_142059 ) ) ( not ( = ?auto_142058 ?auto_142059 ) ) ( ON ?auto_142052 ?auto_142051 ) ( ON-TABLE ?auto_142059 ) ( ON ?auto_142053 ?auto_142052 ) ( ON ?auto_142054 ?auto_142053 ) ( ON ?auto_142055 ?auto_142054 ) ( ON ?auto_142056 ?auto_142055 ) ( ON ?auto_142058 ?auto_142056 ) ( ON ?auto_142057 ?auto_142058 ) ( CLEAR ?auto_142057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142059 ?auto_142051 ?auto_142052 ?auto_142053 ?auto_142054 ?auto_142055 ?auto_142056 ?auto_142058 )
      ( MAKE-5PILE ?auto_142051 ?auto_142052 ?auto_142053 ?auto_142054 ?auto_142055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142075 - BLOCK
      ?auto_142076 - BLOCK
    )
    :vars
    (
      ?auto_142078 - BLOCK
      ?auto_142077 - BLOCK
      ?auto_142079 - BLOCK
      ?auto_142080 - BLOCK
      ?auto_142082 - BLOCK
      ?auto_142081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142078 ?auto_142076 ) ( ON-TABLE ?auto_142075 ) ( ON ?auto_142076 ?auto_142075 ) ( not ( = ?auto_142075 ?auto_142076 ) ) ( not ( = ?auto_142075 ?auto_142078 ) ) ( not ( = ?auto_142076 ?auto_142078 ) ) ( not ( = ?auto_142075 ?auto_142077 ) ) ( not ( = ?auto_142075 ?auto_142079 ) ) ( not ( = ?auto_142076 ?auto_142077 ) ) ( not ( = ?auto_142076 ?auto_142079 ) ) ( not ( = ?auto_142078 ?auto_142077 ) ) ( not ( = ?auto_142078 ?auto_142079 ) ) ( not ( = ?auto_142077 ?auto_142079 ) ) ( ON ?auto_142077 ?auto_142078 ) ( CLEAR ?auto_142077 ) ( HOLDING ?auto_142079 ) ( CLEAR ?auto_142080 ) ( ON-TABLE ?auto_142082 ) ( ON ?auto_142081 ?auto_142082 ) ( ON ?auto_142080 ?auto_142081 ) ( not ( = ?auto_142082 ?auto_142081 ) ) ( not ( = ?auto_142082 ?auto_142080 ) ) ( not ( = ?auto_142082 ?auto_142079 ) ) ( not ( = ?auto_142081 ?auto_142080 ) ) ( not ( = ?auto_142081 ?auto_142079 ) ) ( not ( = ?auto_142080 ?auto_142079 ) ) ( not ( = ?auto_142075 ?auto_142080 ) ) ( not ( = ?auto_142075 ?auto_142082 ) ) ( not ( = ?auto_142075 ?auto_142081 ) ) ( not ( = ?auto_142076 ?auto_142080 ) ) ( not ( = ?auto_142076 ?auto_142082 ) ) ( not ( = ?auto_142076 ?auto_142081 ) ) ( not ( = ?auto_142078 ?auto_142080 ) ) ( not ( = ?auto_142078 ?auto_142082 ) ) ( not ( = ?auto_142078 ?auto_142081 ) ) ( not ( = ?auto_142077 ?auto_142080 ) ) ( not ( = ?auto_142077 ?auto_142082 ) ) ( not ( = ?auto_142077 ?auto_142081 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142082 ?auto_142081 ?auto_142080 ?auto_142079 )
      ( MAKE-2PILE ?auto_142075 ?auto_142076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142083 - BLOCK
      ?auto_142084 - BLOCK
    )
    :vars
    (
      ?auto_142086 - BLOCK
      ?auto_142087 - BLOCK
      ?auto_142089 - BLOCK
      ?auto_142088 - BLOCK
      ?auto_142085 - BLOCK
      ?auto_142090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142086 ?auto_142084 ) ( ON-TABLE ?auto_142083 ) ( ON ?auto_142084 ?auto_142083 ) ( not ( = ?auto_142083 ?auto_142084 ) ) ( not ( = ?auto_142083 ?auto_142086 ) ) ( not ( = ?auto_142084 ?auto_142086 ) ) ( not ( = ?auto_142083 ?auto_142087 ) ) ( not ( = ?auto_142083 ?auto_142089 ) ) ( not ( = ?auto_142084 ?auto_142087 ) ) ( not ( = ?auto_142084 ?auto_142089 ) ) ( not ( = ?auto_142086 ?auto_142087 ) ) ( not ( = ?auto_142086 ?auto_142089 ) ) ( not ( = ?auto_142087 ?auto_142089 ) ) ( ON ?auto_142087 ?auto_142086 ) ( CLEAR ?auto_142088 ) ( ON-TABLE ?auto_142085 ) ( ON ?auto_142090 ?auto_142085 ) ( ON ?auto_142088 ?auto_142090 ) ( not ( = ?auto_142085 ?auto_142090 ) ) ( not ( = ?auto_142085 ?auto_142088 ) ) ( not ( = ?auto_142085 ?auto_142089 ) ) ( not ( = ?auto_142090 ?auto_142088 ) ) ( not ( = ?auto_142090 ?auto_142089 ) ) ( not ( = ?auto_142088 ?auto_142089 ) ) ( not ( = ?auto_142083 ?auto_142088 ) ) ( not ( = ?auto_142083 ?auto_142085 ) ) ( not ( = ?auto_142083 ?auto_142090 ) ) ( not ( = ?auto_142084 ?auto_142088 ) ) ( not ( = ?auto_142084 ?auto_142085 ) ) ( not ( = ?auto_142084 ?auto_142090 ) ) ( not ( = ?auto_142086 ?auto_142088 ) ) ( not ( = ?auto_142086 ?auto_142085 ) ) ( not ( = ?auto_142086 ?auto_142090 ) ) ( not ( = ?auto_142087 ?auto_142088 ) ) ( not ( = ?auto_142087 ?auto_142085 ) ) ( not ( = ?auto_142087 ?auto_142090 ) ) ( ON ?auto_142089 ?auto_142087 ) ( CLEAR ?auto_142089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142083 ?auto_142084 ?auto_142086 ?auto_142087 )
      ( MAKE-2PILE ?auto_142083 ?auto_142084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142091 - BLOCK
      ?auto_142092 - BLOCK
    )
    :vars
    (
      ?auto_142096 - BLOCK
      ?auto_142098 - BLOCK
      ?auto_142097 - BLOCK
      ?auto_142094 - BLOCK
      ?auto_142093 - BLOCK
      ?auto_142095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142096 ?auto_142092 ) ( ON-TABLE ?auto_142091 ) ( ON ?auto_142092 ?auto_142091 ) ( not ( = ?auto_142091 ?auto_142092 ) ) ( not ( = ?auto_142091 ?auto_142096 ) ) ( not ( = ?auto_142092 ?auto_142096 ) ) ( not ( = ?auto_142091 ?auto_142098 ) ) ( not ( = ?auto_142091 ?auto_142097 ) ) ( not ( = ?auto_142092 ?auto_142098 ) ) ( not ( = ?auto_142092 ?auto_142097 ) ) ( not ( = ?auto_142096 ?auto_142098 ) ) ( not ( = ?auto_142096 ?auto_142097 ) ) ( not ( = ?auto_142098 ?auto_142097 ) ) ( ON ?auto_142098 ?auto_142096 ) ( ON-TABLE ?auto_142094 ) ( ON ?auto_142093 ?auto_142094 ) ( not ( = ?auto_142094 ?auto_142093 ) ) ( not ( = ?auto_142094 ?auto_142095 ) ) ( not ( = ?auto_142094 ?auto_142097 ) ) ( not ( = ?auto_142093 ?auto_142095 ) ) ( not ( = ?auto_142093 ?auto_142097 ) ) ( not ( = ?auto_142095 ?auto_142097 ) ) ( not ( = ?auto_142091 ?auto_142095 ) ) ( not ( = ?auto_142091 ?auto_142094 ) ) ( not ( = ?auto_142091 ?auto_142093 ) ) ( not ( = ?auto_142092 ?auto_142095 ) ) ( not ( = ?auto_142092 ?auto_142094 ) ) ( not ( = ?auto_142092 ?auto_142093 ) ) ( not ( = ?auto_142096 ?auto_142095 ) ) ( not ( = ?auto_142096 ?auto_142094 ) ) ( not ( = ?auto_142096 ?auto_142093 ) ) ( not ( = ?auto_142098 ?auto_142095 ) ) ( not ( = ?auto_142098 ?auto_142094 ) ) ( not ( = ?auto_142098 ?auto_142093 ) ) ( ON ?auto_142097 ?auto_142098 ) ( CLEAR ?auto_142097 ) ( HOLDING ?auto_142095 ) ( CLEAR ?auto_142093 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142094 ?auto_142093 ?auto_142095 )
      ( MAKE-2PILE ?auto_142091 ?auto_142092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142099 - BLOCK
      ?auto_142100 - BLOCK
    )
    :vars
    (
      ?auto_142102 - BLOCK
      ?auto_142103 - BLOCK
      ?auto_142104 - BLOCK
      ?auto_142105 - BLOCK
      ?auto_142106 - BLOCK
      ?auto_142101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142102 ?auto_142100 ) ( ON-TABLE ?auto_142099 ) ( ON ?auto_142100 ?auto_142099 ) ( not ( = ?auto_142099 ?auto_142100 ) ) ( not ( = ?auto_142099 ?auto_142102 ) ) ( not ( = ?auto_142100 ?auto_142102 ) ) ( not ( = ?auto_142099 ?auto_142103 ) ) ( not ( = ?auto_142099 ?auto_142104 ) ) ( not ( = ?auto_142100 ?auto_142103 ) ) ( not ( = ?auto_142100 ?auto_142104 ) ) ( not ( = ?auto_142102 ?auto_142103 ) ) ( not ( = ?auto_142102 ?auto_142104 ) ) ( not ( = ?auto_142103 ?auto_142104 ) ) ( ON ?auto_142103 ?auto_142102 ) ( ON-TABLE ?auto_142105 ) ( ON ?auto_142106 ?auto_142105 ) ( not ( = ?auto_142105 ?auto_142106 ) ) ( not ( = ?auto_142105 ?auto_142101 ) ) ( not ( = ?auto_142105 ?auto_142104 ) ) ( not ( = ?auto_142106 ?auto_142101 ) ) ( not ( = ?auto_142106 ?auto_142104 ) ) ( not ( = ?auto_142101 ?auto_142104 ) ) ( not ( = ?auto_142099 ?auto_142101 ) ) ( not ( = ?auto_142099 ?auto_142105 ) ) ( not ( = ?auto_142099 ?auto_142106 ) ) ( not ( = ?auto_142100 ?auto_142101 ) ) ( not ( = ?auto_142100 ?auto_142105 ) ) ( not ( = ?auto_142100 ?auto_142106 ) ) ( not ( = ?auto_142102 ?auto_142101 ) ) ( not ( = ?auto_142102 ?auto_142105 ) ) ( not ( = ?auto_142102 ?auto_142106 ) ) ( not ( = ?auto_142103 ?auto_142101 ) ) ( not ( = ?auto_142103 ?auto_142105 ) ) ( not ( = ?auto_142103 ?auto_142106 ) ) ( ON ?auto_142104 ?auto_142103 ) ( CLEAR ?auto_142106 ) ( ON ?auto_142101 ?auto_142104 ) ( CLEAR ?auto_142101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142099 ?auto_142100 ?auto_142102 ?auto_142103 ?auto_142104 )
      ( MAKE-2PILE ?auto_142099 ?auto_142100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142107 - BLOCK
      ?auto_142108 - BLOCK
    )
    :vars
    (
      ?auto_142109 - BLOCK
      ?auto_142110 - BLOCK
      ?auto_142111 - BLOCK
      ?auto_142113 - BLOCK
      ?auto_142114 - BLOCK
      ?auto_142112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142109 ?auto_142108 ) ( ON-TABLE ?auto_142107 ) ( ON ?auto_142108 ?auto_142107 ) ( not ( = ?auto_142107 ?auto_142108 ) ) ( not ( = ?auto_142107 ?auto_142109 ) ) ( not ( = ?auto_142108 ?auto_142109 ) ) ( not ( = ?auto_142107 ?auto_142110 ) ) ( not ( = ?auto_142107 ?auto_142111 ) ) ( not ( = ?auto_142108 ?auto_142110 ) ) ( not ( = ?auto_142108 ?auto_142111 ) ) ( not ( = ?auto_142109 ?auto_142110 ) ) ( not ( = ?auto_142109 ?auto_142111 ) ) ( not ( = ?auto_142110 ?auto_142111 ) ) ( ON ?auto_142110 ?auto_142109 ) ( ON-TABLE ?auto_142113 ) ( not ( = ?auto_142113 ?auto_142114 ) ) ( not ( = ?auto_142113 ?auto_142112 ) ) ( not ( = ?auto_142113 ?auto_142111 ) ) ( not ( = ?auto_142114 ?auto_142112 ) ) ( not ( = ?auto_142114 ?auto_142111 ) ) ( not ( = ?auto_142112 ?auto_142111 ) ) ( not ( = ?auto_142107 ?auto_142112 ) ) ( not ( = ?auto_142107 ?auto_142113 ) ) ( not ( = ?auto_142107 ?auto_142114 ) ) ( not ( = ?auto_142108 ?auto_142112 ) ) ( not ( = ?auto_142108 ?auto_142113 ) ) ( not ( = ?auto_142108 ?auto_142114 ) ) ( not ( = ?auto_142109 ?auto_142112 ) ) ( not ( = ?auto_142109 ?auto_142113 ) ) ( not ( = ?auto_142109 ?auto_142114 ) ) ( not ( = ?auto_142110 ?auto_142112 ) ) ( not ( = ?auto_142110 ?auto_142113 ) ) ( not ( = ?auto_142110 ?auto_142114 ) ) ( ON ?auto_142111 ?auto_142110 ) ( ON ?auto_142112 ?auto_142111 ) ( CLEAR ?auto_142112 ) ( HOLDING ?auto_142114 ) ( CLEAR ?auto_142113 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142113 ?auto_142114 )
      ( MAKE-2PILE ?auto_142107 ?auto_142108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142115 - BLOCK
      ?auto_142116 - BLOCK
    )
    :vars
    (
      ?auto_142120 - BLOCK
      ?auto_142122 - BLOCK
      ?auto_142117 - BLOCK
      ?auto_142118 - BLOCK
      ?auto_142119 - BLOCK
      ?auto_142121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142120 ?auto_142116 ) ( ON-TABLE ?auto_142115 ) ( ON ?auto_142116 ?auto_142115 ) ( not ( = ?auto_142115 ?auto_142116 ) ) ( not ( = ?auto_142115 ?auto_142120 ) ) ( not ( = ?auto_142116 ?auto_142120 ) ) ( not ( = ?auto_142115 ?auto_142122 ) ) ( not ( = ?auto_142115 ?auto_142117 ) ) ( not ( = ?auto_142116 ?auto_142122 ) ) ( not ( = ?auto_142116 ?auto_142117 ) ) ( not ( = ?auto_142120 ?auto_142122 ) ) ( not ( = ?auto_142120 ?auto_142117 ) ) ( not ( = ?auto_142122 ?auto_142117 ) ) ( ON ?auto_142122 ?auto_142120 ) ( ON-TABLE ?auto_142118 ) ( not ( = ?auto_142118 ?auto_142119 ) ) ( not ( = ?auto_142118 ?auto_142121 ) ) ( not ( = ?auto_142118 ?auto_142117 ) ) ( not ( = ?auto_142119 ?auto_142121 ) ) ( not ( = ?auto_142119 ?auto_142117 ) ) ( not ( = ?auto_142121 ?auto_142117 ) ) ( not ( = ?auto_142115 ?auto_142121 ) ) ( not ( = ?auto_142115 ?auto_142118 ) ) ( not ( = ?auto_142115 ?auto_142119 ) ) ( not ( = ?auto_142116 ?auto_142121 ) ) ( not ( = ?auto_142116 ?auto_142118 ) ) ( not ( = ?auto_142116 ?auto_142119 ) ) ( not ( = ?auto_142120 ?auto_142121 ) ) ( not ( = ?auto_142120 ?auto_142118 ) ) ( not ( = ?auto_142120 ?auto_142119 ) ) ( not ( = ?auto_142122 ?auto_142121 ) ) ( not ( = ?auto_142122 ?auto_142118 ) ) ( not ( = ?auto_142122 ?auto_142119 ) ) ( ON ?auto_142117 ?auto_142122 ) ( ON ?auto_142121 ?auto_142117 ) ( CLEAR ?auto_142118 ) ( ON ?auto_142119 ?auto_142121 ) ( CLEAR ?auto_142119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142115 ?auto_142116 ?auto_142120 ?auto_142122 ?auto_142117 ?auto_142121 )
      ( MAKE-2PILE ?auto_142115 ?auto_142116 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142123 - BLOCK
      ?auto_142124 - BLOCK
    )
    :vars
    (
      ?auto_142127 - BLOCK
      ?auto_142126 - BLOCK
      ?auto_142128 - BLOCK
      ?auto_142130 - BLOCK
      ?auto_142129 - BLOCK
      ?auto_142125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142127 ?auto_142124 ) ( ON-TABLE ?auto_142123 ) ( ON ?auto_142124 ?auto_142123 ) ( not ( = ?auto_142123 ?auto_142124 ) ) ( not ( = ?auto_142123 ?auto_142127 ) ) ( not ( = ?auto_142124 ?auto_142127 ) ) ( not ( = ?auto_142123 ?auto_142126 ) ) ( not ( = ?auto_142123 ?auto_142128 ) ) ( not ( = ?auto_142124 ?auto_142126 ) ) ( not ( = ?auto_142124 ?auto_142128 ) ) ( not ( = ?auto_142127 ?auto_142126 ) ) ( not ( = ?auto_142127 ?auto_142128 ) ) ( not ( = ?auto_142126 ?auto_142128 ) ) ( ON ?auto_142126 ?auto_142127 ) ( not ( = ?auto_142130 ?auto_142129 ) ) ( not ( = ?auto_142130 ?auto_142125 ) ) ( not ( = ?auto_142130 ?auto_142128 ) ) ( not ( = ?auto_142129 ?auto_142125 ) ) ( not ( = ?auto_142129 ?auto_142128 ) ) ( not ( = ?auto_142125 ?auto_142128 ) ) ( not ( = ?auto_142123 ?auto_142125 ) ) ( not ( = ?auto_142123 ?auto_142130 ) ) ( not ( = ?auto_142123 ?auto_142129 ) ) ( not ( = ?auto_142124 ?auto_142125 ) ) ( not ( = ?auto_142124 ?auto_142130 ) ) ( not ( = ?auto_142124 ?auto_142129 ) ) ( not ( = ?auto_142127 ?auto_142125 ) ) ( not ( = ?auto_142127 ?auto_142130 ) ) ( not ( = ?auto_142127 ?auto_142129 ) ) ( not ( = ?auto_142126 ?auto_142125 ) ) ( not ( = ?auto_142126 ?auto_142130 ) ) ( not ( = ?auto_142126 ?auto_142129 ) ) ( ON ?auto_142128 ?auto_142126 ) ( ON ?auto_142125 ?auto_142128 ) ( ON ?auto_142129 ?auto_142125 ) ( CLEAR ?auto_142129 ) ( HOLDING ?auto_142130 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142130 )
      ( MAKE-2PILE ?auto_142123 ?auto_142124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142141 - BLOCK
      ?auto_142142 - BLOCK
    )
    :vars
    (
      ?auto_142148 - BLOCK
      ?auto_142147 - BLOCK
      ?auto_142144 - BLOCK
      ?auto_142146 - BLOCK
      ?auto_142143 - BLOCK
      ?auto_142145 - BLOCK
      ?auto_142149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142148 ?auto_142142 ) ( ON-TABLE ?auto_142141 ) ( ON ?auto_142142 ?auto_142141 ) ( not ( = ?auto_142141 ?auto_142142 ) ) ( not ( = ?auto_142141 ?auto_142148 ) ) ( not ( = ?auto_142142 ?auto_142148 ) ) ( not ( = ?auto_142141 ?auto_142147 ) ) ( not ( = ?auto_142141 ?auto_142144 ) ) ( not ( = ?auto_142142 ?auto_142147 ) ) ( not ( = ?auto_142142 ?auto_142144 ) ) ( not ( = ?auto_142148 ?auto_142147 ) ) ( not ( = ?auto_142148 ?auto_142144 ) ) ( not ( = ?auto_142147 ?auto_142144 ) ) ( ON ?auto_142147 ?auto_142148 ) ( not ( = ?auto_142146 ?auto_142143 ) ) ( not ( = ?auto_142146 ?auto_142145 ) ) ( not ( = ?auto_142146 ?auto_142144 ) ) ( not ( = ?auto_142143 ?auto_142145 ) ) ( not ( = ?auto_142143 ?auto_142144 ) ) ( not ( = ?auto_142145 ?auto_142144 ) ) ( not ( = ?auto_142141 ?auto_142145 ) ) ( not ( = ?auto_142141 ?auto_142146 ) ) ( not ( = ?auto_142141 ?auto_142143 ) ) ( not ( = ?auto_142142 ?auto_142145 ) ) ( not ( = ?auto_142142 ?auto_142146 ) ) ( not ( = ?auto_142142 ?auto_142143 ) ) ( not ( = ?auto_142148 ?auto_142145 ) ) ( not ( = ?auto_142148 ?auto_142146 ) ) ( not ( = ?auto_142148 ?auto_142143 ) ) ( not ( = ?auto_142147 ?auto_142145 ) ) ( not ( = ?auto_142147 ?auto_142146 ) ) ( not ( = ?auto_142147 ?auto_142143 ) ) ( ON ?auto_142144 ?auto_142147 ) ( ON ?auto_142145 ?auto_142144 ) ( ON ?auto_142143 ?auto_142145 ) ( CLEAR ?auto_142143 ) ( ON ?auto_142146 ?auto_142149 ) ( CLEAR ?auto_142146 ) ( HAND-EMPTY ) ( not ( = ?auto_142141 ?auto_142149 ) ) ( not ( = ?auto_142142 ?auto_142149 ) ) ( not ( = ?auto_142148 ?auto_142149 ) ) ( not ( = ?auto_142147 ?auto_142149 ) ) ( not ( = ?auto_142144 ?auto_142149 ) ) ( not ( = ?auto_142146 ?auto_142149 ) ) ( not ( = ?auto_142143 ?auto_142149 ) ) ( not ( = ?auto_142145 ?auto_142149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142146 ?auto_142149 )
      ( MAKE-2PILE ?auto_142141 ?auto_142142 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142150 - BLOCK
      ?auto_142151 - BLOCK
    )
    :vars
    (
      ?auto_142158 - BLOCK
      ?auto_142152 - BLOCK
      ?auto_142155 - BLOCK
      ?auto_142153 - BLOCK
      ?auto_142154 - BLOCK
      ?auto_142157 - BLOCK
      ?auto_142156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142158 ?auto_142151 ) ( ON-TABLE ?auto_142150 ) ( ON ?auto_142151 ?auto_142150 ) ( not ( = ?auto_142150 ?auto_142151 ) ) ( not ( = ?auto_142150 ?auto_142158 ) ) ( not ( = ?auto_142151 ?auto_142158 ) ) ( not ( = ?auto_142150 ?auto_142152 ) ) ( not ( = ?auto_142150 ?auto_142155 ) ) ( not ( = ?auto_142151 ?auto_142152 ) ) ( not ( = ?auto_142151 ?auto_142155 ) ) ( not ( = ?auto_142158 ?auto_142152 ) ) ( not ( = ?auto_142158 ?auto_142155 ) ) ( not ( = ?auto_142152 ?auto_142155 ) ) ( ON ?auto_142152 ?auto_142158 ) ( not ( = ?auto_142153 ?auto_142154 ) ) ( not ( = ?auto_142153 ?auto_142157 ) ) ( not ( = ?auto_142153 ?auto_142155 ) ) ( not ( = ?auto_142154 ?auto_142157 ) ) ( not ( = ?auto_142154 ?auto_142155 ) ) ( not ( = ?auto_142157 ?auto_142155 ) ) ( not ( = ?auto_142150 ?auto_142157 ) ) ( not ( = ?auto_142150 ?auto_142153 ) ) ( not ( = ?auto_142150 ?auto_142154 ) ) ( not ( = ?auto_142151 ?auto_142157 ) ) ( not ( = ?auto_142151 ?auto_142153 ) ) ( not ( = ?auto_142151 ?auto_142154 ) ) ( not ( = ?auto_142158 ?auto_142157 ) ) ( not ( = ?auto_142158 ?auto_142153 ) ) ( not ( = ?auto_142158 ?auto_142154 ) ) ( not ( = ?auto_142152 ?auto_142157 ) ) ( not ( = ?auto_142152 ?auto_142153 ) ) ( not ( = ?auto_142152 ?auto_142154 ) ) ( ON ?auto_142155 ?auto_142152 ) ( ON ?auto_142157 ?auto_142155 ) ( ON ?auto_142153 ?auto_142156 ) ( CLEAR ?auto_142153 ) ( not ( = ?auto_142150 ?auto_142156 ) ) ( not ( = ?auto_142151 ?auto_142156 ) ) ( not ( = ?auto_142158 ?auto_142156 ) ) ( not ( = ?auto_142152 ?auto_142156 ) ) ( not ( = ?auto_142155 ?auto_142156 ) ) ( not ( = ?auto_142153 ?auto_142156 ) ) ( not ( = ?auto_142154 ?auto_142156 ) ) ( not ( = ?auto_142157 ?auto_142156 ) ) ( HOLDING ?auto_142154 ) ( CLEAR ?auto_142157 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142150 ?auto_142151 ?auto_142158 ?auto_142152 ?auto_142155 ?auto_142157 ?auto_142154 )
      ( MAKE-2PILE ?auto_142150 ?auto_142151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142159 - BLOCK
      ?auto_142160 - BLOCK
    )
    :vars
    (
      ?auto_142167 - BLOCK
      ?auto_142161 - BLOCK
      ?auto_142164 - BLOCK
      ?auto_142166 - BLOCK
      ?auto_142163 - BLOCK
      ?auto_142165 - BLOCK
      ?auto_142162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142167 ?auto_142160 ) ( ON-TABLE ?auto_142159 ) ( ON ?auto_142160 ?auto_142159 ) ( not ( = ?auto_142159 ?auto_142160 ) ) ( not ( = ?auto_142159 ?auto_142167 ) ) ( not ( = ?auto_142160 ?auto_142167 ) ) ( not ( = ?auto_142159 ?auto_142161 ) ) ( not ( = ?auto_142159 ?auto_142164 ) ) ( not ( = ?auto_142160 ?auto_142161 ) ) ( not ( = ?auto_142160 ?auto_142164 ) ) ( not ( = ?auto_142167 ?auto_142161 ) ) ( not ( = ?auto_142167 ?auto_142164 ) ) ( not ( = ?auto_142161 ?auto_142164 ) ) ( ON ?auto_142161 ?auto_142167 ) ( not ( = ?auto_142166 ?auto_142163 ) ) ( not ( = ?auto_142166 ?auto_142165 ) ) ( not ( = ?auto_142166 ?auto_142164 ) ) ( not ( = ?auto_142163 ?auto_142165 ) ) ( not ( = ?auto_142163 ?auto_142164 ) ) ( not ( = ?auto_142165 ?auto_142164 ) ) ( not ( = ?auto_142159 ?auto_142165 ) ) ( not ( = ?auto_142159 ?auto_142166 ) ) ( not ( = ?auto_142159 ?auto_142163 ) ) ( not ( = ?auto_142160 ?auto_142165 ) ) ( not ( = ?auto_142160 ?auto_142166 ) ) ( not ( = ?auto_142160 ?auto_142163 ) ) ( not ( = ?auto_142167 ?auto_142165 ) ) ( not ( = ?auto_142167 ?auto_142166 ) ) ( not ( = ?auto_142167 ?auto_142163 ) ) ( not ( = ?auto_142161 ?auto_142165 ) ) ( not ( = ?auto_142161 ?auto_142166 ) ) ( not ( = ?auto_142161 ?auto_142163 ) ) ( ON ?auto_142164 ?auto_142161 ) ( ON ?auto_142165 ?auto_142164 ) ( ON ?auto_142166 ?auto_142162 ) ( not ( = ?auto_142159 ?auto_142162 ) ) ( not ( = ?auto_142160 ?auto_142162 ) ) ( not ( = ?auto_142167 ?auto_142162 ) ) ( not ( = ?auto_142161 ?auto_142162 ) ) ( not ( = ?auto_142164 ?auto_142162 ) ) ( not ( = ?auto_142166 ?auto_142162 ) ) ( not ( = ?auto_142163 ?auto_142162 ) ) ( not ( = ?auto_142165 ?auto_142162 ) ) ( CLEAR ?auto_142165 ) ( ON ?auto_142163 ?auto_142166 ) ( CLEAR ?auto_142163 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142162 ?auto_142166 )
      ( MAKE-2PILE ?auto_142159 ?auto_142160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142168 - BLOCK
      ?auto_142169 - BLOCK
    )
    :vars
    (
      ?auto_142170 - BLOCK
      ?auto_142175 - BLOCK
      ?auto_142171 - BLOCK
      ?auto_142172 - BLOCK
      ?auto_142176 - BLOCK
      ?auto_142174 - BLOCK
      ?auto_142173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142170 ?auto_142169 ) ( ON-TABLE ?auto_142168 ) ( ON ?auto_142169 ?auto_142168 ) ( not ( = ?auto_142168 ?auto_142169 ) ) ( not ( = ?auto_142168 ?auto_142170 ) ) ( not ( = ?auto_142169 ?auto_142170 ) ) ( not ( = ?auto_142168 ?auto_142175 ) ) ( not ( = ?auto_142168 ?auto_142171 ) ) ( not ( = ?auto_142169 ?auto_142175 ) ) ( not ( = ?auto_142169 ?auto_142171 ) ) ( not ( = ?auto_142170 ?auto_142175 ) ) ( not ( = ?auto_142170 ?auto_142171 ) ) ( not ( = ?auto_142175 ?auto_142171 ) ) ( ON ?auto_142175 ?auto_142170 ) ( not ( = ?auto_142172 ?auto_142176 ) ) ( not ( = ?auto_142172 ?auto_142174 ) ) ( not ( = ?auto_142172 ?auto_142171 ) ) ( not ( = ?auto_142176 ?auto_142174 ) ) ( not ( = ?auto_142176 ?auto_142171 ) ) ( not ( = ?auto_142174 ?auto_142171 ) ) ( not ( = ?auto_142168 ?auto_142174 ) ) ( not ( = ?auto_142168 ?auto_142172 ) ) ( not ( = ?auto_142168 ?auto_142176 ) ) ( not ( = ?auto_142169 ?auto_142174 ) ) ( not ( = ?auto_142169 ?auto_142172 ) ) ( not ( = ?auto_142169 ?auto_142176 ) ) ( not ( = ?auto_142170 ?auto_142174 ) ) ( not ( = ?auto_142170 ?auto_142172 ) ) ( not ( = ?auto_142170 ?auto_142176 ) ) ( not ( = ?auto_142175 ?auto_142174 ) ) ( not ( = ?auto_142175 ?auto_142172 ) ) ( not ( = ?auto_142175 ?auto_142176 ) ) ( ON ?auto_142171 ?auto_142175 ) ( ON ?auto_142172 ?auto_142173 ) ( not ( = ?auto_142168 ?auto_142173 ) ) ( not ( = ?auto_142169 ?auto_142173 ) ) ( not ( = ?auto_142170 ?auto_142173 ) ) ( not ( = ?auto_142175 ?auto_142173 ) ) ( not ( = ?auto_142171 ?auto_142173 ) ) ( not ( = ?auto_142172 ?auto_142173 ) ) ( not ( = ?auto_142176 ?auto_142173 ) ) ( not ( = ?auto_142174 ?auto_142173 ) ) ( ON ?auto_142176 ?auto_142172 ) ( CLEAR ?auto_142176 ) ( ON-TABLE ?auto_142173 ) ( HOLDING ?auto_142174 ) ( CLEAR ?auto_142171 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142168 ?auto_142169 ?auto_142170 ?auto_142175 ?auto_142171 ?auto_142174 )
      ( MAKE-2PILE ?auto_142168 ?auto_142169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_142177 - BLOCK
      ?auto_142178 - BLOCK
    )
    :vars
    (
      ?auto_142184 - BLOCK
      ?auto_142182 - BLOCK
      ?auto_142179 - BLOCK
      ?auto_142180 - BLOCK
      ?auto_142185 - BLOCK
      ?auto_142181 - BLOCK
      ?auto_142183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142184 ?auto_142178 ) ( ON-TABLE ?auto_142177 ) ( ON ?auto_142178 ?auto_142177 ) ( not ( = ?auto_142177 ?auto_142178 ) ) ( not ( = ?auto_142177 ?auto_142184 ) ) ( not ( = ?auto_142178 ?auto_142184 ) ) ( not ( = ?auto_142177 ?auto_142182 ) ) ( not ( = ?auto_142177 ?auto_142179 ) ) ( not ( = ?auto_142178 ?auto_142182 ) ) ( not ( = ?auto_142178 ?auto_142179 ) ) ( not ( = ?auto_142184 ?auto_142182 ) ) ( not ( = ?auto_142184 ?auto_142179 ) ) ( not ( = ?auto_142182 ?auto_142179 ) ) ( ON ?auto_142182 ?auto_142184 ) ( not ( = ?auto_142180 ?auto_142185 ) ) ( not ( = ?auto_142180 ?auto_142181 ) ) ( not ( = ?auto_142180 ?auto_142179 ) ) ( not ( = ?auto_142185 ?auto_142181 ) ) ( not ( = ?auto_142185 ?auto_142179 ) ) ( not ( = ?auto_142181 ?auto_142179 ) ) ( not ( = ?auto_142177 ?auto_142181 ) ) ( not ( = ?auto_142177 ?auto_142180 ) ) ( not ( = ?auto_142177 ?auto_142185 ) ) ( not ( = ?auto_142178 ?auto_142181 ) ) ( not ( = ?auto_142178 ?auto_142180 ) ) ( not ( = ?auto_142178 ?auto_142185 ) ) ( not ( = ?auto_142184 ?auto_142181 ) ) ( not ( = ?auto_142184 ?auto_142180 ) ) ( not ( = ?auto_142184 ?auto_142185 ) ) ( not ( = ?auto_142182 ?auto_142181 ) ) ( not ( = ?auto_142182 ?auto_142180 ) ) ( not ( = ?auto_142182 ?auto_142185 ) ) ( ON ?auto_142179 ?auto_142182 ) ( ON ?auto_142180 ?auto_142183 ) ( not ( = ?auto_142177 ?auto_142183 ) ) ( not ( = ?auto_142178 ?auto_142183 ) ) ( not ( = ?auto_142184 ?auto_142183 ) ) ( not ( = ?auto_142182 ?auto_142183 ) ) ( not ( = ?auto_142179 ?auto_142183 ) ) ( not ( = ?auto_142180 ?auto_142183 ) ) ( not ( = ?auto_142185 ?auto_142183 ) ) ( not ( = ?auto_142181 ?auto_142183 ) ) ( ON ?auto_142185 ?auto_142180 ) ( ON-TABLE ?auto_142183 ) ( CLEAR ?auto_142179 ) ( ON ?auto_142181 ?auto_142185 ) ( CLEAR ?auto_142181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142183 ?auto_142180 ?auto_142185 )
      ( MAKE-2PILE ?auto_142177 ?auto_142178 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142235 - BLOCK
      ?auto_142236 - BLOCK
      ?auto_142237 - BLOCK
      ?auto_142238 - BLOCK
      ?auto_142239 - BLOCK
      ?auto_142240 - BLOCK
    )
    :vars
    (
      ?auto_142241 - BLOCK
      ?auto_142242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142235 ) ( ON ?auto_142236 ?auto_142235 ) ( ON ?auto_142237 ?auto_142236 ) ( ON ?auto_142238 ?auto_142237 ) ( not ( = ?auto_142235 ?auto_142236 ) ) ( not ( = ?auto_142235 ?auto_142237 ) ) ( not ( = ?auto_142235 ?auto_142238 ) ) ( not ( = ?auto_142235 ?auto_142239 ) ) ( not ( = ?auto_142235 ?auto_142240 ) ) ( not ( = ?auto_142236 ?auto_142237 ) ) ( not ( = ?auto_142236 ?auto_142238 ) ) ( not ( = ?auto_142236 ?auto_142239 ) ) ( not ( = ?auto_142236 ?auto_142240 ) ) ( not ( = ?auto_142237 ?auto_142238 ) ) ( not ( = ?auto_142237 ?auto_142239 ) ) ( not ( = ?auto_142237 ?auto_142240 ) ) ( not ( = ?auto_142238 ?auto_142239 ) ) ( not ( = ?auto_142238 ?auto_142240 ) ) ( not ( = ?auto_142239 ?auto_142240 ) ) ( ON ?auto_142240 ?auto_142241 ) ( not ( = ?auto_142235 ?auto_142241 ) ) ( not ( = ?auto_142236 ?auto_142241 ) ) ( not ( = ?auto_142237 ?auto_142241 ) ) ( not ( = ?auto_142238 ?auto_142241 ) ) ( not ( = ?auto_142239 ?auto_142241 ) ) ( not ( = ?auto_142240 ?auto_142241 ) ) ( CLEAR ?auto_142238 ) ( ON ?auto_142239 ?auto_142240 ) ( CLEAR ?auto_142239 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142242 ) ( ON ?auto_142241 ?auto_142242 ) ( not ( = ?auto_142242 ?auto_142241 ) ) ( not ( = ?auto_142242 ?auto_142240 ) ) ( not ( = ?auto_142242 ?auto_142239 ) ) ( not ( = ?auto_142235 ?auto_142242 ) ) ( not ( = ?auto_142236 ?auto_142242 ) ) ( not ( = ?auto_142237 ?auto_142242 ) ) ( not ( = ?auto_142238 ?auto_142242 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142242 ?auto_142241 ?auto_142240 )
      ( MAKE-6PILE ?auto_142235 ?auto_142236 ?auto_142237 ?auto_142238 ?auto_142239 ?auto_142240 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142243 - BLOCK
      ?auto_142244 - BLOCK
      ?auto_142245 - BLOCK
      ?auto_142246 - BLOCK
      ?auto_142247 - BLOCK
      ?auto_142248 - BLOCK
    )
    :vars
    (
      ?auto_142249 - BLOCK
      ?auto_142250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142243 ) ( ON ?auto_142244 ?auto_142243 ) ( ON ?auto_142245 ?auto_142244 ) ( not ( = ?auto_142243 ?auto_142244 ) ) ( not ( = ?auto_142243 ?auto_142245 ) ) ( not ( = ?auto_142243 ?auto_142246 ) ) ( not ( = ?auto_142243 ?auto_142247 ) ) ( not ( = ?auto_142243 ?auto_142248 ) ) ( not ( = ?auto_142244 ?auto_142245 ) ) ( not ( = ?auto_142244 ?auto_142246 ) ) ( not ( = ?auto_142244 ?auto_142247 ) ) ( not ( = ?auto_142244 ?auto_142248 ) ) ( not ( = ?auto_142245 ?auto_142246 ) ) ( not ( = ?auto_142245 ?auto_142247 ) ) ( not ( = ?auto_142245 ?auto_142248 ) ) ( not ( = ?auto_142246 ?auto_142247 ) ) ( not ( = ?auto_142246 ?auto_142248 ) ) ( not ( = ?auto_142247 ?auto_142248 ) ) ( ON ?auto_142248 ?auto_142249 ) ( not ( = ?auto_142243 ?auto_142249 ) ) ( not ( = ?auto_142244 ?auto_142249 ) ) ( not ( = ?auto_142245 ?auto_142249 ) ) ( not ( = ?auto_142246 ?auto_142249 ) ) ( not ( = ?auto_142247 ?auto_142249 ) ) ( not ( = ?auto_142248 ?auto_142249 ) ) ( ON ?auto_142247 ?auto_142248 ) ( CLEAR ?auto_142247 ) ( ON-TABLE ?auto_142250 ) ( ON ?auto_142249 ?auto_142250 ) ( not ( = ?auto_142250 ?auto_142249 ) ) ( not ( = ?auto_142250 ?auto_142248 ) ) ( not ( = ?auto_142250 ?auto_142247 ) ) ( not ( = ?auto_142243 ?auto_142250 ) ) ( not ( = ?auto_142244 ?auto_142250 ) ) ( not ( = ?auto_142245 ?auto_142250 ) ) ( not ( = ?auto_142246 ?auto_142250 ) ) ( HOLDING ?auto_142246 ) ( CLEAR ?auto_142245 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142243 ?auto_142244 ?auto_142245 ?auto_142246 )
      ( MAKE-6PILE ?auto_142243 ?auto_142244 ?auto_142245 ?auto_142246 ?auto_142247 ?auto_142248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142251 - BLOCK
      ?auto_142252 - BLOCK
      ?auto_142253 - BLOCK
      ?auto_142254 - BLOCK
      ?auto_142255 - BLOCK
      ?auto_142256 - BLOCK
    )
    :vars
    (
      ?auto_142258 - BLOCK
      ?auto_142257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142251 ) ( ON ?auto_142252 ?auto_142251 ) ( ON ?auto_142253 ?auto_142252 ) ( not ( = ?auto_142251 ?auto_142252 ) ) ( not ( = ?auto_142251 ?auto_142253 ) ) ( not ( = ?auto_142251 ?auto_142254 ) ) ( not ( = ?auto_142251 ?auto_142255 ) ) ( not ( = ?auto_142251 ?auto_142256 ) ) ( not ( = ?auto_142252 ?auto_142253 ) ) ( not ( = ?auto_142252 ?auto_142254 ) ) ( not ( = ?auto_142252 ?auto_142255 ) ) ( not ( = ?auto_142252 ?auto_142256 ) ) ( not ( = ?auto_142253 ?auto_142254 ) ) ( not ( = ?auto_142253 ?auto_142255 ) ) ( not ( = ?auto_142253 ?auto_142256 ) ) ( not ( = ?auto_142254 ?auto_142255 ) ) ( not ( = ?auto_142254 ?auto_142256 ) ) ( not ( = ?auto_142255 ?auto_142256 ) ) ( ON ?auto_142256 ?auto_142258 ) ( not ( = ?auto_142251 ?auto_142258 ) ) ( not ( = ?auto_142252 ?auto_142258 ) ) ( not ( = ?auto_142253 ?auto_142258 ) ) ( not ( = ?auto_142254 ?auto_142258 ) ) ( not ( = ?auto_142255 ?auto_142258 ) ) ( not ( = ?auto_142256 ?auto_142258 ) ) ( ON ?auto_142255 ?auto_142256 ) ( ON-TABLE ?auto_142257 ) ( ON ?auto_142258 ?auto_142257 ) ( not ( = ?auto_142257 ?auto_142258 ) ) ( not ( = ?auto_142257 ?auto_142256 ) ) ( not ( = ?auto_142257 ?auto_142255 ) ) ( not ( = ?auto_142251 ?auto_142257 ) ) ( not ( = ?auto_142252 ?auto_142257 ) ) ( not ( = ?auto_142253 ?auto_142257 ) ) ( not ( = ?auto_142254 ?auto_142257 ) ) ( CLEAR ?auto_142253 ) ( ON ?auto_142254 ?auto_142255 ) ( CLEAR ?auto_142254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142257 ?auto_142258 ?auto_142256 ?auto_142255 )
      ( MAKE-6PILE ?auto_142251 ?auto_142252 ?auto_142253 ?auto_142254 ?auto_142255 ?auto_142256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142259 - BLOCK
      ?auto_142260 - BLOCK
      ?auto_142261 - BLOCK
      ?auto_142262 - BLOCK
      ?auto_142263 - BLOCK
      ?auto_142264 - BLOCK
    )
    :vars
    (
      ?auto_142265 - BLOCK
      ?auto_142266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142259 ) ( ON ?auto_142260 ?auto_142259 ) ( not ( = ?auto_142259 ?auto_142260 ) ) ( not ( = ?auto_142259 ?auto_142261 ) ) ( not ( = ?auto_142259 ?auto_142262 ) ) ( not ( = ?auto_142259 ?auto_142263 ) ) ( not ( = ?auto_142259 ?auto_142264 ) ) ( not ( = ?auto_142260 ?auto_142261 ) ) ( not ( = ?auto_142260 ?auto_142262 ) ) ( not ( = ?auto_142260 ?auto_142263 ) ) ( not ( = ?auto_142260 ?auto_142264 ) ) ( not ( = ?auto_142261 ?auto_142262 ) ) ( not ( = ?auto_142261 ?auto_142263 ) ) ( not ( = ?auto_142261 ?auto_142264 ) ) ( not ( = ?auto_142262 ?auto_142263 ) ) ( not ( = ?auto_142262 ?auto_142264 ) ) ( not ( = ?auto_142263 ?auto_142264 ) ) ( ON ?auto_142264 ?auto_142265 ) ( not ( = ?auto_142259 ?auto_142265 ) ) ( not ( = ?auto_142260 ?auto_142265 ) ) ( not ( = ?auto_142261 ?auto_142265 ) ) ( not ( = ?auto_142262 ?auto_142265 ) ) ( not ( = ?auto_142263 ?auto_142265 ) ) ( not ( = ?auto_142264 ?auto_142265 ) ) ( ON ?auto_142263 ?auto_142264 ) ( ON-TABLE ?auto_142266 ) ( ON ?auto_142265 ?auto_142266 ) ( not ( = ?auto_142266 ?auto_142265 ) ) ( not ( = ?auto_142266 ?auto_142264 ) ) ( not ( = ?auto_142266 ?auto_142263 ) ) ( not ( = ?auto_142259 ?auto_142266 ) ) ( not ( = ?auto_142260 ?auto_142266 ) ) ( not ( = ?auto_142261 ?auto_142266 ) ) ( not ( = ?auto_142262 ?auto_142266 ) ) ( ON ?auto_142262 ?auto_142263 ) ( CLEAR ?auto_142262 ) ( HOLDING ?auto_142261 ) ( CLEAR ?auto_142260 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142259 ?auto_142260 ?auto_142261 )
      ( MAKE-6PILE ?auto_142259 ?auto_142260 ?auto_142261 ?auto_142262 ?auto_142263 ?auto_142264 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142267 - BLOCK
      ?auto_142268 - BLOCK
      ?auto_142269 - BLOCK
      ?auto_142270 - BLOCK
      ?auto_142271 - BLOCK
      ?auto_142272 - BLOCK
    )
    :vars
    (
      ?auto_142273 - BLOCK
      ?auto_142274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142267 ) ( ON ?auto_142268 ?auto_142267 ) ( not ( = ?auto_142267 ?auto_142268 ) ) ( not ( = ?auto_142267 ?auto_142269 ) ) ( not ( = ?auto_142267 ?auto_142270 ) ) ( not ( = ?auto_142267 ?auto_142271 ) ) ( not ( = ?auto_142267 ?auto_142272 ) ) ( not ( = ?auto_142268 ?auto_142269 ) ) ( not ( = ?auto_142268 ?auto_142270 ) ) ( not ( = ?auto_142268 ?auto_142271 ) ) ( not ( = ?auto_142268 ?auto_142272 ) ) ( not ( = ?auto_142269 ?auto_142270 ) ) ( not ( = ?auto_142269 ?auto_142271 ) ) ( not ( = ?auto_142269 ?auto_142272 ) ) ( not ( = ?auto_142270 ?auto_142271 ) ) ( not ( = ?auto_142270 ?auto_142272 ) ) ( not ( = ?auto_142271 ?auto_142272 ) ) ( ON ?auto_142272 ?auto_142273 ) ( not ( = ?auto_142267 ?auto_142273 ) ) ( not ( = ?auto_142268 ?auto_142273 ) ) ( not ( = ?auto_142269 ?auto_142273 ) ) ( not ( = ?auto_142270 ?auto_142273 ) ) ( not ( = ?auto_142271 ?auto_142273 ) ) ( not ( = ?auto_142272 ?auto_142273 ) ) ( ON ?auto_142271 ?auto_142272 ) ( ON-TABLE ?auto_142274 ) ( ON ?auto_142273 ?auto_142274 ) ( not ( = ?auto_142274 ?auto_142273 ) ) ( not ( = ?auto_142274 ?auto_142272 ) ) ( not ( = ?auto_142274 ?auto_142271 ) ) ( not ( = ?auto_142267 ?auto_142274 ) ) ( not ( = ?auto_142268 ?auto_142274 ) ) ( not ( = ?auto_142269 ?auto_142274 ) ) ( not ( = ?auto_142270 ?auto_142274 ) ) ( ON ?auto_142270 ?auto_142271 ) ( CLEAR ?auto_142268 ) ( ON ?auto_142269 ?auto_142270 ) ( CLEAR ?auto_142269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142274 ?auto_142273 ?auto_142272 ?auto_142271 ?auto_142270 )
      ( MAKE-6PILE ?auto_142267 ?auto_142268 ?auto_142269 ?auto_142270 ?auto_142271 ?auto_142272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142275 - BLOCK
      ?auto_142276 - BLOCK
      ?auto_142277 - BLOCK
      ?auto_142278 - BLOCK
      ?auto_142279 - BLOCK
      ?auto_142280 - BLOCK
    )
    :vars
    (
      ?auto_142281 - BLOCK
      ?auto_142282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142275 ) ( not ( = ?auto_142275 ?auto_142276 ) ) ( not ( = ?auto_142275 ?auto_142277 ) ) ( not ( = ?auto_142275 ?auto_142278 ) ) ( not ( = ?auto_142275 ?auto_142279 ) ) ( not ( = ?auto_142275 ?auto_142280 ) ) ( not ( = ?auto_142276 ?auto_142277 ) ) ( not ( = ?auto_142276 ?auto_142278 ) ) ( not ( = ?auto_142276 ?auto_142279 ) ) ( not ( = ?auto_142276 ?auto_142280 ) ) ( not ( = ?auto_142277 ?auto_142278 ) ) ( not ( = ?auto_142277 ?auto_142279 ) ) ( not ( = ?auto_142277 ?auto_142280 ) ) ( not ( = ?auto_142278 ?auto_142279 ) ) ( not ( = ?auto_142278 ?auto_142280 ) ) ( not ( = ?auto_142279 ?auto_142280 ) ) ( ON ?auto_142280 ?auto_142281 ) ( not ( = ?auto_142275 ?auto_142281 ) ) ( not ( = ?auto_142276 ?auto_142281 ) ) ( not ( = ?auto_142277 ?auto_142281 ) ) ( not ( = ?auto_142278 ?auto_142281 ) ) ( not ( = ?auto_142279 ?auto_142281 ) ) ( not ( = ?auto_142280 ?auto_142281 ) ) ( ON ?auto_142279 ?auto_142280 ) ( ON-TABLE ?auto_142282 ) ( ON ?auto_142281 ?auto_142282 ) ( not ( = ?auto_142282 ?auto_142281 ) ) ( not ( = ?auto_142282 ?auto_142280 ) ) ( not ( = ?auto_142282 ?auto_142279 ) ) ( not ( = ?auto_142275 ?auto_142282 ) ) ( not ( = ?auto_142276 ?auto_142282 ) ) ( not ( = ?auto_142277 ?auto_142282 ) ) ( not ( = ?auto_142278 ?auto_142282 ) ) ( ON ?auto_142278 ?auto_142279 ) ( ON ?auto_142277 ?auto_142278 ) ( CLEAR ?auto_142277 ) ( HOLDING ?auto_142276 ) ( CLEAR ?auto_142275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142275 ?auto_142276 )
      ( MAKE-6PILE ?auto_142275 ?auto_142276 ?auto_142277 ?auto_142278 ?auto_142279 ?auto_142280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142283 - BLOCK
      ?auto_142284 - BLOCK
      ?auto_142285 - BLOCK
      ?auto_142286 - BLOCK
      ?auto_142287 - BLOCK
      ?auto_142288 - BLOCK
    )
    :vars
    (
      ?auto_142289 - BLOCK
      ?auto_142290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142283 ) ( not ( = ?auto_142283 ?auto_142284 ) ) ( not ( = ?auto_142283 ?auto_142285 ) ) ( not ( = ?auto_142283 ?auto_142286 ) ) ( not ( = ?auto_142283 ?auto_142287 ) ) ( not ( = ?auto_142283 ?auto_142288 ) ) ( not ( = ?auto_142284 ?auto_142285 ) ) ( not ( = ?auto_142284 ?auto_142286 ) ) ( not ( = ?auto_142284 ?auto_142287 ) ) ( not ( = ?auto_142284 ?auto_142288 ) ) ( not ( = ?auto_142285 ?auto_142286 ) ) ( not ( = ?auto_142285 ?auto_142287 ) ) ( not ( = ?auto_142285 ?auto_142288 ) ) ( not ( = ?auto_142286 ?auto_142287 ) ) ( not ( = ?auto_142286 ?auto_142288 ) ) ( not ( = ?auto_142287 ?auto_142288 ) ) ( ON ?auto_142288 ?auto_142289 ) ( not ( = ?auto_142283 ?auto_142289 ) ) ( not ( = ?auto_142284 ?auto_142289 ) ) ( not ( = ?auto_142285 ?auto_142289 ) ) ( not ( = ?auto_142286 ?auto_142289 ) ) ( not ( = ?auto_142287 ?auto_142289 ) ) ( not ( = ?auto_142288 ?auto_142289 ) ) ( ON ?auto_142287 ?auto_142288 ) ( ON-TABLE ?auto_142290 ) ( ON ?auto_142289 ?auto_142290 ) ( not ( = ?auto_142290 ?auto_142289 ) ) ( not ( = ?auto_142290 ?auto_142288 ) ) ( not ( = ?auto_142290 ?auto_142287 ) ) ( not ( = ?auto_142283 ?auto_142290 ) ) ( not ( = ?auto_142284 ?auto_142290 ) ) ( not ( = ?auto_142285 ?auto_142290 ) ) ( not ( = ?auto_142286 ?auto_142290 ) ) ( ON ?auto_142286 ?auto_142287 ) ( ON ?auto_142285 ?auto_142286 ) ( CLEAR ?auto_142283 ) ( ON ?auto_142284 ?auto_142285 ) ( CLEAR ?auto_142284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142290 ?auto_142289 ?auto_142288 ?auto_142287 ?auto_142286 ?auto_142285 )
      ( MAKE-6PILE ?auto_142283 ?auto_142284 ?auto_142285 ?auto_142286 ?auto_142287 ?auto_142288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142291 - BLOCK
      ?auto_142292 - BLOCK
      ?auto_142293 - BLOCK
      ?auto_142294 - BLOCK
      ?auto_142295 - BLOCK
      ?auto_142296 - BLOCK
    )
    :vars
    (
      ?auto_142297 - BLOCK
      ?auto_142298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142291 ?auto_142292 ) ) ( not ( = ?auto_142291 ?auto_142293 ) ) ( not ( = ?auto_142291 ?auto_142294 ) ) ( not ( = ?auto_142291 ?auto_142295 ) ) ( not ( = ?auto_142291 ?auto_142296 ) ) ( not ( = ?auto_142292 ?auto_142293 ) ) ( not ( = ?auto_142292 ?auto_142294 ) ) ( not ( = ?auto_142292 ?auto_142295 ) ) ( not ( = ?auto_142292 ?auto_142296 ) ) ( not ( = ?auto_142293 ?auto_142294 ) ) ( not ( = ?auto_142293 ?auto_142295 ) ) ( not ( = ?auto_142293 ?auto_142296 ) ) ( not ( = ?auto_142294 ?auto_142295 ) ) ( not ( = ?auto_142294 ?auto_142296 ) ) ( not ( = ?auto_142295 ?auto_142296 ) ) ( ON ?auto_142296 ?auto_142297 ) ( not ( = ?auto_142291 ?auto_142297 ) ) ( not ( = ?auto_142292 ?auto_142297 ) ) ( not ( = ?auto_142293 ?auto_142297 ) ) ( not ( = ?auto_142294 ?auto_142297 ) ) ( not ( = ?auto_142295 ?auto_142297 ) ) ( not ( = ?auto_142296 ?auto_142297 ) ) ( ON ?auto_142295 ?auto_142296 ) ( ON-TABLE ?auto_142298 ) ( ON ?auto_142297 ?auto_142298 ) ( not ( = ?auto_142298 ?auto_142297 ) ) ( not ( = ?auto_142298 ?auto_142296 ) ) ( not ( = ?auto_142298 ?auto_142295 ) ) ( not ( = ?auto_142291 ?auto_142298 ) ) ( not ( = ?auto_142292 ?auto_142298 ) ) ( not ( = ?auto_142293 ?auto_142298 ) ) ( not ( = ?auto_142294 ?auto_142298 ) ) ( ON ?auto_142294 ?auto_142295 ) ( ON ?auto_142293 ?auto_142294 ) ( ON ?auto_142292 ?auto_142293 ) ( CLEAR ?auto_142292 ) ( HOLDING ?auto_142291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142291 )
      ( MAKE-6PILE ?auto_142291 ?auto_142292 ?auto_142293 ?auto_142294 ?auto_142295 ?auto_142296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142299 - BLOCK
      ?auto_142300 - BLOCK
      ?auto_142301 - BLOCK
      ?auto_142302 - BLOCK
      ?auto_142303 - BLOCK
      ?auto_142304 - BLOCK
    )
    :vars
    (
      ?auto_142305 - BLOCK
      ?auto_142306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142299 ?auto_142300 ) ) ( not ( = ?auto_142299 ?auto_142301 ) ) ( not ( = ?auto_142299 ?auto_142302 ) ) ( not ( = ?auto_142299 ?auto_142303 ) ) ( not ( = ?auto_142299 ?auto_142304 ) ) ( not ( = ?auto_142300 ?auto_142301 ) ) ( not ( = ?auto_142300 ?auto_142302 ) ) ( not ( = ?auto_142300 ?auto_142303 ) ) ( not ( = ?auto_142300 ?auto_142304 ) ) ( not ( = ?auto_142301 ?auto_142302 ) ) ( not ( = ?auto_142301 ?auto_142303 ) ) ( not ( = ?auto_142301 ?auto_142304 ) ) ( not ( = ?auto_142302 ?auto_142303 ) ) ( not ( = ?auto_142302 ?auto_142304 ) ) ( not ( = ?auto_142303 ?auto_142304 ) ) ( ON ?auto_142304 ?auto_142305 ) ( not ( = ?auto_142299 ?auto_142305 ) ) ( not ( = ?auto_142300 ?auto_142305 ) ) ( not ( = ?auto_142301 ?auto_142305 ) ) ( not ( = ?auto_142302 ?auto_142305 ) ) ( not ( = ?auto_142303 ?auto_142305 ) ) ( not ( = ?auto_142304 ?auto_142305 ) ) ( ON ?auto_142303 ?auto_142304 ) ( ON-TABLE ?auto_142306 ) ( ON ?auto_142305 ?auto_142306 ) ( not ( = ?auto_142306 ?auto_142305 ) ) ( not ( = ?auto_142306 ?auto_142304 ) ) ( not ( = ?auto_142306 ?auto_142303 ) ) ( not ( = ?auto_142299 ?auto_142306 ) ) ( not ( = ?auto_142300 ?auto_142306 ) ) ( not ( = ?auto_142301 ?auto_142306 ) ) ( not ( = ?auto_142302 ?auto_142306 ) ) ( ON ?auto_142302 ?auto_142303 ) ( ON ?auto_142301 ?auto_142302 ) ( ON ?auto_142300 ?auto_142301 ) ( ON ?auto_142299 ?auto_142300 ) ( CLEAR ?auto_142299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142306 ?auto_142305 ?auto_142304 ?auto_142303 ?auto_142302 ?auto_142301 ?auto_142300 )
      ( MAKE-6PILE ?auto_142299 ?auto_142300 ?auto_142301 ?auto_142302 ?auto_142303 ?auto_142304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142313 - BLOCK
      ?auto_142314 - BLOCK
      ?auto_142315 - BLOCK
      ?auto_142316 - BLOCK
      ?auto_142317 - BLOCK
      ?auto_142318 - BLOCK
    )
    :vars
    (
      ?auto_142319 - BLOCK
      ?auto_142320 - BLOCK
      ?auto_142321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142313 ?auto_142314 ) ) ( not ( = ?auto_142313 ?auto_142315 ) ) ( not ( = ?auto_142313 ?auto_142316 ) ) ( not ( = ?auto_142313 ?auto_142317 ) ) ( not ( = ?auto_142313 ?auto_142318 ) ) ( not ( = ?auto_142314 ?auto_142315 ) ) ( not ( = ?auto_142314 ?auto_142316 ) ) ( not ( = ?auto_142314 ?auto_142317 ) ) ( not ( = ?auto_142314 ?auto_142318 ) ) ( not ( = ?auto_142315 ?auto_142316 ) ) ( not ( = ?auto_142315 ?auto_142317 ) ) ( not ( = ?auto_142315 ?auto_142318 ) ) ( not ( = ?auto_142316 ?auto_142317 ) ) ( not ( = ?auto_142316 ?auto_142318 ) ) ( not ( = ?auto_142317 ?auto_142318 ) ) ( ON ?auto_142318 ?auto_142319 ) ( not ( = ?auto_142313 ?auto_142319 ) ) ( not ( = ?auto_142314 ?auto_142319 ) ) ( not ( = ?auto_142315 ?auto_142319 ) ) ( not ( = ?auto_142316 ?auto_142319 ) ) ( not ( = ?auto_142317 ?auto_142319 ) ) ( not ( = ?auto_142318 ?auto_142319 ) ) ( ON ?auto_142317 ?auto_142318 ) ( ON-TABLE ?auto_142320 ) ( ON ?auto_142319 ?auto_142320 ) ( not ( = ?auto_142320 ?auto_142319 ) ) ( not ( = ?auto_142320 ?auto_142318 ) ) ( not ( = ?auto_142320 ?auto_142317 ) ) ( not ( = ?auto_142313 ?auto_142320 ) ) ( not ( = ?auto_142314 ?auto_142320 ) ) ( not ( = ?auto_142315 ?auto_142320 ) ) ( not ( = ?auto_142316 ?auto_142320 ) ) ( ON ?auto_142316 ?auto_142317 ) ( ON ?auto_142315 ?auto_142316 ) ( ON ?auto_142314 ?auto_142315 ) ( CLEAR ?auto_142314 ) ( ON ?auto_142313 ?auto_142321 ) ( CLEAR ?auto_142313 ) ( HAND-EMPTY ) ( not ( = ?auto_142313 ?auto_142321 ) ) ( not ( = ?auto_142314 ?auto_142321 ) ) ( not ( = ?auto_142315 ?auto_142321 ) ) ( not ( = ?auto_142316 ?auto_142321 ) ) ( not ( = ?auto_142317 ?auto_142321 ) ) ( not ( = ?auto_142318 ?auto_142321 ) ) ( not ( = ?auto_142319 ?auto_142321 ) ) ( not ( = ?auto_142320 ?auto_142321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142313 ?auto_142321 )
      ( MAKE-6PILE ?auto_142313 ?auto_142314 ?auto_142315 ?auto_142316 ?auto_142317 ?auto_142318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142322 - BLOCK
      ?auto_142323 - BLOCK
      ?auto_142324 - BLOCK
      ?auto_142325 - BLOCK
      ?auto_142326 - BLOCK
      ?auto_142327 - BLOCK
    )
    :vars
    (
      ?auto_142328 - BLOCK
      ?auto_142329 - BLOCK
      ?auto_142330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142322 ?auto_142323 ) ) ( not ( = ?auto_142322 ?auto_142324 ) ) ( not ( = ?auto_142322 ?auto_142325 ) ) ( not ( = ?auto_142322 ?auto_142326 ) ) ( not ( = ?auto_142322 ?auto_142327 ) ) ( not ( = ?auto_142323 ?auto_142324 ) ) ( not ( = ?auto_142323 ?auto_142325 ) ) ( not ( = ?auto_142323 ?auto_142326 ) ) ( not ( = ?auto_142323 ?auto_142327 ) ) ( not ( = ?auto_142324 ?auto_142325 ) ) ( not ( = ?auto_142324 ?auto_142326 ) ) ( not ( = ?auto_142324 ?auto_142327 ) ) ( not ( = ?auto_142325 ?auto_142326 ) ) ( not ( = ?auto_142325 ?auto_142327 ) ) ( not ( = ?auto_142326 ?auto_142327 ) ) ( ON ?auto_142327 ?auto_142328 ) ( not ( = ?auto_142322 ?auto_142328 ) ) ( not ( = ?auto_142323 ?auto_142328 ) ) ( not ( = ?auto_142324 ?auto_142328 ) ) ( not ( = ?auto_142325 ?auto_142328 ) ) ( not ( = ?auto_142326 ?auto_142328 ) ) ( not ( = ?auto_142327 ?auto_142328 ) ) ( ON ?auto_142326 ?auto_142327 ) ( ON-TABLE ?auto_142329 ) ( ON ?auto_142328 ?auto_142329 ) ( not ( = ?auto_142329 ?auto_142328 ) ) ( not ( = ?auto_142329 ?auto_142327 ) ) ( not ( = ?auto_142329 ?auto_142326 ) ) ( not ( = ?auto_142322 ?auto_142329 ) ) ( not ( = ?auto_142323 ?auto_142329 ) ) ( not ( = ?auto_142324 ?auto_142329 ) ) ( not ( = ?auto_142325 ?auto_142329 ) ) ( ON ?auto_142325 ?auto_142326 ) ( ON ?auto_142324 ?auto_142325 ) ( ON ?auto_142322 ?auto_142330 ) ( CLEAR ?auto_142322 ) ( not ( = ?auto_142322 ?auto_142330 ) ) ( not ( = ?auto_142323 ?auto_142330 ) ) ( not ( = ?auto_142324 ?auto_142330 ) ) ( not ( = ?auto_142325 ?auto_142330 ) ) ( not ( = ?auto_142326 ?auto_142330 ) ) ( not ( = ?auto_142327 ?auto_142330 ) ) ( not ( = ?auto_142328 ?auto_142330 ) ) ( not ( = ?auto_142329 ?auto_142330 ) ) ( HOLDING ?auto_142323 ) ( CLEAR ?auto_142324 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142329 ?auto_142328 ?auto_142327 ?auto_142326 ?auto_142325 ?auto_142324 ?auto_142323 )
      ( MAKE-6PILE ?auto_142322 ?auto_142323 ?auto_142324 ?auto_142325 ?auto_142326 ?auto_142327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142331 - BLOCK
      ?auto_142332 - BLOCK
      ?auto_142333 - BLOCK
      ?auto_142334 - BLOCK
      ?auto_142335 - BLOCK
      ?auto_142336 - BLOCK
    )
    :vars
    (
      ?auto_142339 - BLOCK
      ?auto_142338 - BLOCK
      ?auto_142337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142331 ?auto_142332 ) ) ( not ( = ?auto_142331 ?auto_142333 ) ) ( not ( = ?auto_142331 ?auto_142334 ) ) ( not ( = ?auto_142331 ?auto_142335 ) ) ( not ( = ?auto_142331 ?auto_142336 ) ) ( not ( = ?auto_142332 ?auto_142333 ) ) ( not ( = ?auto_142332 ?auto_142334 ) ) ( not ( = ?auto_142332 ?auto_142335 ) ) ( not ( = ?auto_142332 ?auto_142336 ) ) ( not ( = ?auto_142333 ?auto_142334 ) ) ( not ( = ?auto_142333 ?auto_142335 ) ) ( not ( = ?auto_142333 ?auto_142336 ) ) ( not ( = ?auto_142334 ?auto_142335 ) ) ( not ( = ?auto_142334 ?auto_142336 ) ) ( not ( = ?auto_142335 ?auto_142336 ) ) ( ON ?auto_142336 ?auto_142339 ) ( not ( = ?auto_142331 ?auto_142339 ) ) ( not ( = ?auto_142332 ?auto_142339 ) ) ( not ( = ?auto_142333 ?auto_142339 ) ) ( not ( = ?auto_142334 ?auto_142339 ) ) ( not ( = ?auto_142335 ?auto_142339 ) ) ( not ( = ?auto_142336 ?auto_142339 ) ) ( ON ?auto_142335 ?auto_142336 ) ( ON-TABLE ?auto_142338 ) ( ON ?auto_142339 ?auto_142338 ) ( not ( = ?auto_142338 ?auto_142339 ) ) ( not ( = ?auto_142338 ?auto_142336 ) ) ( not ( = ?auto_142338 ?auto_142335 ) ) ( not ( = ?auto_142331 ?auto_142338 ) ) ( not ( = ?auto_142332 ?auto_142338 ) ) ( not ( = ?auto_142333 ?auto_142338 ) ) ( not ( = ?auto_142334 ?auto_142338 ) ) ( ON ?auto_142334 ?auto_142335 ) ( ON ?auto_142333 ?auto_142334 ) ( ON ?auto_142331 ?auto_142337 ) ( not ( = ?auto_142331 ?auto_142337 ) ) ( not ( = ?auto_142332 ?auto_142337 ) ) ( not ( = ?auto_142333 ?auto_142337 ) ) ( not ( = ?auto_142334 ?auto_142337 ) ) ( not ( = ?auto_142335 ?auto_142337 ) ) ( not ( = ?auto_142336 ?auto_142337 ) ) ( not ( = ?auto_142339 ?auto_142337 ) ) ( not ( = ?auto_142338 ?auto_142337 ) ) ( CLEAR ?auto_142333 ) ( ON ?auto_142332 ?auto_142331 ) ( CLEAR ?auto_142332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142337 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142337 ?auto_142331 )
      ( MAKE-6PILE ?auto_142331 ?auto_142332 ?auto_142333 ?auto_142334 ?auto_142335 ?auto_142336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142340 - BLOCK
      ?auto_142341 - BLOCK
      ?auto_142342 - BLOCK
      ?auto_142343 - BLOCK
      ?auto_142344 - BLOCK
      ?auto_142345 - BLOCK
    )
    :vars
    (
      ?auto_142346 - BLOCK
      ?auto_142348 - BLOCK
      ?auto_142347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142340 ?auto_142341 ) ) ( not ( = ?auto_142340 ?auto_142342 ) ) ( not ( = ?auto_142340 ?auto_142343 ) ) ( not ( = ?auto_142340 ?auto_142344 ) ) ( not ( = ?auto_142340 ?auto_142345 ) ) ( not ( = ?auto_142341 ?auto_142342 ) ) ( not ( = ?auto_142341 ?auto_142343 ) ) ( not ( = ?auto_142341 ?auto_142344 ) ) ( not ( = ?auto_142341 ?auto_142345 ) ) ( not ( = ?auto_142342 ?auto_142343 ) ) ( not ( = ?auto_142342 ?auto_142344 ) ) ( not ( = ?auto_142342 ?auto_142345 ) ) ( not ( = ?auto_142343 ?auto_142344 ) ) ( not ( = ?auto_142343 ?auto_142345 ) ) ( not ( = ?auto_142344 ?auto_142345 ) ) ( ON ?auto_142345 ?auto_142346 ) ( not ( = ?auto_142340 ?auto_142346 ) ) ( not ( = ?auto_142341 ?auto_142346 ) ) ( not ( = ?auto_142342 ?auto_142346 ) ) ( not ( = ?auto_142343 ?auto_142346 ) ) ( not ( = ?auto_142344 ?auto_142346 ) ) ( not ( = ?auto_142345 ?auto_142346 ) ) ( ON ?auto_142344 ?auto_142345 ) ( ON-TABLE ?auto_142348 ) ( ON ?auto_142346 ?auto_142348 ) ( not ( = ?auto_142348 ?auto_142346 ) ) ( not ( = ?auto_142348 ?auto_142345 ) ) ( not ( = ?auto_142348 ?auto_142344 ) ) ( not ( = ?auto_142340 ?auto_142348 ) ) ( not ( = ?auto_142341 ?auto_142348 ) ) ( not ( = ?auto_142342 ?auto_142348 ) ) ( not ( = ?auto_142343 ?auto_142348 ) ) ( ON ?auto_142343 ?auto_142344 ) ( ON ?auto_142340 ?auto_142347 ) ( not ( = ?auto_142340 ?auto_142347 ) ) ( not ( = ?auto_142341 ?auto_142347 ) ) ( not ( = ?auto_142342 ?auto_142347 ) ) ( not ( = ?auto_142343 ?auto_142347 ) ) ( not ( = ?auto_142344 ?auto_142347 ) ) ( not ( = ?auto_142345 ?auto_142347 ) ) ( not ( = ?auto_142346 ?auto_142347 ) ) ( not ( = ?auto_142348 ?auto_142347 ) ) ( ON ?auto_142341 ?auto_142340 ) ( CLEAR ?auto_142341 ) ( ON-TABLE ?auto_142347 ) ( HOLDING ?auto_142342 ) ( CLEAR ?auto_142343 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142348 ?auto_142346 ?auto_142345 ?auto_142344 ?auto_142343 ?auto_142342 )
      ( MAKE-6PILE ?auto_142340 ?auto_142341 ?auto_142342 ?auto_142343 ?auto_142344 ?auto_142345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142349 - BLOCK
      ?auto_142350 - BLOCK
      ?auto_142351 - BLOCK
      ?auto_142352 - BLOCK
      ?auto_142353 - BLOCK
      ?auto_142354 - BLOCK
    )
    :vars
    (
      ?auto_142357 - BLOCK
      ?auto_142355 - BLOCK
      ?auto_142356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142349 ?auto_142350 ) ) ( not ( = ?auto_142349 ?auto_142351 ) ) ( not ( = ?auto_142349 ?auto_142352 ) ) ( not ( = ?auto_142349 ?auto_142353 ) ) ( not ( = ?auto_142349 ?auto_142354 ) ) ( not ( = ?auto_142350 ?auto_142351 ) ) ( not ( = ?auto_142350 ?auto_142352 ) ) ( not ( = ?auto_142350 ?auto_142353 ) ) ( not ( = ?auto_142350 ?auto_142354 ) ) ( not ( = ?auto_142351 ?auto_142352 ) ) ( not ( = ?auto_142351 ?auto_142353 ) ) ( not ( = ?auto_142351 ?auto_142354 ) ) ( not ( = ?auto_142352 ?auto_142353 ) ) ( not ( = ?auto_142352 ?auto_142354 ) ) ( not ( = ?auto_142353 ?auto_142354 ) ) ( ON ?auto_142354 ?auto_142357 ) ( not ( = ?auto_142349 ?auto_142357 ) ) ( not ( = ?auto_142350 ?auto_142357 ) ) ( not ( = ?auto_142351 ?auto_142357 ) ) ( not ( = ?auto_142352 ?auto_142357 ) ) ( not ( = ?auto_142353 ?auto_142357 ) ) ( not ( = ?auto_142354 ?auto_142357 ) ) ( ON ?auto_142353 ?auto_142354 ) ( ON-TABLE ?auto_142355 ) ( ON ?auto_142357 ?auto_142355 ) ( not ( = ?auto_142355 ?auto_142357 ) ) ( not ( = ?auto_142355 ?auto_142354 ) ) ( not ( = ?auto_142355 ?auto_142353 ) ) ( not ( = ?auto_142349 ?auto_142355 ) ) ( not ( = ?auto_142350 ?auto_142355 ) ) ( not ( = ?auto_142351 ?auto_142355 ) ) ( not ( = ?auto_142352 ?auto_142355 ) ) ( ON ?auto_142352 ?auto_142353 ) ( ON ?auto_142349 ?auto_142356 ) ( not ( = ?auto_142349 ?auto_142356 ) ) ( not ( = ?auto_142350 ?auto_142356 ) ) ( not ( = ?auto_142351 ?auto_142356 ) ) ( not ( = ?auto_142352 ?auto_142356 ) ) ( not ( = ?auto_142353 ?auto_142356 ) ) ( not ( = ?auto_142354 ?auto_142356 ) ) ( not ( = ?auto_142357 ?auto_142356 ) ) ( not ( = ?auto_142355 ?auto_142356 ) ) ( ON ?auto_142350 ?auto_142349 ) ( ON-TABLE ?auto_142356 ) ( CLEAR ?auto_142352 ) ( ON ?auto_142351 ?auto_142350 ) ( CLEAR ?auto_142351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142356 ?auto_142349 ?auto_142350 )
      ( MAKE-6PILE ?auto_142349 ?auto_142350 ?auto_142351 ?auto_142352 ?auto_142353 ?auto_142354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142358 - BLOCK
      ?auto_142359 - BLOCK
      ?auto_142360 - BLOCK
      ?auto_142361 - BLOCK
      ?auto_142362 - BLOCK
      ?auto_142363 - BLOCK
    )
    :vars
    (
      ?auto_142365 - BLOCK
      ?auto_142366 - BLOCK
      ?auto_142364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142358 ?auto_142359 ) ) ( not ( = ?auto_142358 ?auto_142360 ) ) ( not ( = ?auto_142358 ?auto_142361 ) ) ( not ( = ?auto_142358 ?auto_142362 ) ) ( not ( = ?auto_142358 ?auto_142363 ) ) ( not ( = ?auto_142359 ?auto_142360 ) ) ( not ( = ?auto_142359 ?auto_142361 ) ) ( not ( = ?auto_142359 ?auto_142362 ) ) ( not ( = ?auto_142359 ?auto_142363 ) ) ( not ( = ?auto_142360 ?auto_142361 ) ) ( not ( = ?auto_142360 ?auto_142362 ) ) ( not ( = ?auto_142360 ?auto_142363 ) ) ( not ( = ?auto_142361 ?auto_142362 ) ) ( not ( = ?auto_142361 ?auto_142363 ) ) ( not ( = ?auto_142362 ?auto_142363 ) ) ( ON ?auto_142363 ?auto_142365 ) ( not ( = ?auto_142358 ?auto_142365 ) ) ( not ( = ?auto_142359 ?auto_142365 ) ) ( not ( = ?auto_142360 ?auto_142365 ) ) ( not ( = ?auto_142361 ?auto_142365 ) ) ( not ( = ?auto_142362 ?auto_142365 ) ) ( not ( = ?auto_142363 ?auto_142365 ) ) ( ON ?auto_142362 ?auto_142363 ) ( ON-TABLE ?auto_142366 ) ( ON ?auto_142365 ?auto_142366 ) ( not ( = ?auto_142366 ?auto_142365 ) ) ( not ( = ?auto_142366 ?auto_142363 ) ) ( not ( = ?auto_142366 ?auto_142362 ) ) ( not ( = ?auto_142358 ?auto_142366 ) ) ( not ( = ?auto_142359 ?auto_142366 ) ) ( not ( = ?auto_142360 ?auto_142366 ) ) ( not ( = ?auto_142361 ?auto_142366 ) ) ( ON ?auto_142358 ?auto_142364 ) ( not ( = ?auto_142358 ?auto_142364 ) ) ( not ( = ?auto_142359 ?auto_142364 ) ) ( not ( = ?auto_142360 ?auto_142364 ) ) ( not ( = ?auto_142361 ?auto_142364 ) ) ( not ( = ?auto_142362 ?auto_142364 ) ) ( not ( = ?auto_142363 ?auto_142364 ) ) ( not ( = ?auto_142365 ?auto_142364 ) ) ( not ( = ?auto_142366 ?auto_142364 ) ) ( ON ?auto_142359 ?auto_142358 ) ( ON-TABLE ?auto_142364 ) ( ON ?auto_142360 ?auto_142359 ) ( CLEAR ?auto_142360 ) ( HOLDING ?auto_142361 ) ( CLEAR ?auto_142362 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142366 ?auto_142365 ?auto_142363 ?auto_142362 ?auto_142361 )
      ( MAKE-6PILE ?auto_142358 ?auto_142359 ?auto_142360 ?auto_142361 ?auto_142362 ?auto_142363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142367 - BLOCK
      ?auto_142368 - BLOCK
      ?auto_142369 - BLOCK
      ?auto_142370 - BLOCK
      ?auto_142371 - BLOCK
      ?auto_142372 - BLOCK
    )
    :vars
    (
      ?auto_142375 - BLOCK
      ?auto_142374 - BLOCK
      ?auto_142373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142367 ?auto_142368 ) ) ( not ( = ?auto_142367 ?auto_142369 ) ) ( not ( = ?auto_142367 ?auto_142370 ) ) ( not ( = ?auto_142367 ?auto_142371 ) ) ( not ( = ?auto_142367 ?auto_142372 ) ) ( not ( = ?auto_142368 ?auto_142369 ) ) ( not ( = ?auto_142368 ?auto_142370 ) ) ( not ( = ?auto_142368 ?auto_142371 ) ) ( not ( = ?auto_142368 ?auto_142372 ) ) ( not ( = ?auto_142369 ?auto_142370 ) ) ( not ( = ?auto_142369 ?auto_142371 ) ) ( not ( = ?auto_142369 ?auto_142372 ) ) ( not ( = ?auto_142370 ?auto_142371 ) ) ( not ( = ?auto_142370 ?auto_142372 ) ) ( not ( = ?auto_142371 ?auto_142372 ) ) ( ON ?auto_142372 ?auto_142375 ) ( not ( = ?auto_142367 ?auto_142375 ) ) ( not ( = ?auto_142368 ?auto_142375 ) ) ( not ( = ?auto_142369 ?auto_142375 ) ) ( not ( = ?auto_142370 ?auto_142375 ) ) ( not ( = ?auto_142371 ?auto_142375 ) ) ( not ( = ?auto_142372 ?auto_142375 ) ) ( ON ?auto_142371 ?auto_142372 ) ( ON-TABLE ?auto_142374 ) ( ON ?auto_142375 ?auto_142374 ) ( not ( = ?auto_142374 ?auto_142375 ) ) ( not ( = ?auto_142374 ?auto_142372 ) ) ( not ( = ?auto_142374 ?auto_142371 ) ) ( not ( = ?auto_142367 ?auto_142374 ) ) ( not ( = ?auto_142368 ?auto_142374 ) ) ( not ( = ?auto_142369 ?auto_142374 ) ) ( not ( = ?auto_142370 ?auto_142374 ) ) ( ON ?auto_142367 ?auto_142373 ) ( not ( = ?auto_142367 ?auto_142373 ) ) ( not ( = ?auto_142368 ?auto_142373 ) ) ( not ( = ?auto_142369 ?auto_142373 ) ) ( not ( = ?auto_142370 ?auto_142373 ) ) ( not ( = ?auto_142371 ?auto_142373 ) ) ( not ( = ?auto_142372 ?auto_142373 ) ) ( not ( = ?auto_142375 ?auto_142373 ) ) ( not ( = ?auto_142374 ?auto_142373 ) ) ( ON ?auto_142368 ?auto_142367 ) ( ON-TABLE ?auto_142373 ) ( ON ?auto_142369 ?auto_142368 ) ( CLEAR ?auto_142371 ) ( ON ?auto_142370 ?auto_142369 ) ( CLEAR ?auto_142370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142373 ?auto_142367 ?auto_142368 ?auto_142369 )
      ( MAKE-6PILE ?auto_142367 ?auto_142368 ?auto_142369 ?auto_142370 ?auto_142371 ?auto_142372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142376 - BLOCK
      ?auto_142377 - BLOCK
      ?auto_142378 - BLOCK
      ?auto_142379 - BLOCK
      ?auto_142380 - BLOCK
      ?auto_142381 - BLOCK
    )
    :vars
    (
      ?auto_142382 - BLOCK
      ?auto_142384 - BLOCK
      ?auto_142383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142376 ?auto_142377 ) ) ( not ( = ?auto_142376 ?auto_142378 ) ) ( not ( = ?auto_142376 ?auto_142379 ) ) ( not ( = ?auto_142376 ?auto_142380 ) ) ( not ( = ?auto_142376 ?auto_142381 ) ) ( not ( = ?auto_142377 ?auto_142378 ) ) ( not ( = ?auto_142377 ?auto_142379 ) ) ( not ( = ?auto_142377 ?auto_142380 ) ) ( not ( = ?auto_142377 ?auto_142381 ) ) ( not ( = ?auto_142378 ?auto_142379 ) ) ( not ( = ?auto_142378 ?auto_142380 ) ) ( not ( = ?auto_142378 ?auto_142381 ) ) ( not ( = ?auto_142379 ?auto_142380 ) ) ( not ( = ?auto_142379 ?auto_142381 ) ) ( not ( = ?auto_142380 ?auto_142381 ) ) ( ON ?auto_142381 ?auto_142382 ) ( not ( = ?auto_142376 ?auto_142382 ) ) ( not ( = ?auto_142377 ?auto_142382 ) ) ( not ( = ?auto_142378 ?auto_142382 ) ) ( not ( = ?auto_142379 ?auto_142382 ) ) ( not ( = ?auto_142380 ?auto_142382 ) ) ( not ( = ?auto_142381 ?auto_142382 ) ) ( ON-TABLE ?auto_142384 ) ( ON ?auto_142382 ?auto_142384 ) ( not ( = ?auto_142384 ?auto_142382 ) ) ( not ( = ?auto_142384 ?auto_142381 ) ) ( not ( = ?auto_142384 ?auto_142380 ) ) ( not ( = ?auto_142376 ?auto_142384 ) ) ( not ( = ?auto_142377 ?auto_142384 ) ) ( not ( = ?auto_142378 ?auto_142384 ) ) ( not ( = ?auto_142379 ?auto_142384 ) ) ( ON ?auto_142376 ?auto_142383 ) ( not ( = ?auto_142376 ?auto_142383 ) ) ( not ( = ?auto_142377 ?auto_142383 ) ) ( not ( = ?auto_142378 ?auto_142383 ) ) ( not ( = ?auto_142379 ?auto_142383 ) ) ( not ( = ?auto_142380 ?auto_142383 ) ) ( not ( = ?auto_142381 ?auto_142383 ) ) ( not ( = ?auto_142382 ?auto_142383 ) ) ( not ( = ?auto_142384 ?auto_142383 ) ) ( ON ?auto_142377 ?auto_142376 ) ( ON-TABLE ?auto_142383 ) ( ON ?auto_142378 ?auto_142377 ) ( ON ?auto_142379 ?auto_142378 ) ( CLEAR ?auto_142379 ) ( HOLDING ?auto_142380 ) ( CLEAR ?auto_142381 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142384 ?auto_142382 ?auto_142381 ?auto_142380 )
      ( MAKE-6PILE ?auto_142376 ?auto_142377 ?auto_142378 ?auto_142379 ?auto_142380 ?auto_142381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142385 - BLOCK
      ?auto_142386 - BLOCK
      ?auto_142387 - BLOCK
      ?auto_142388 - BLOCK
      ?auto_142389 - BLOCK
      ?auto_142390 - BLOCK
    )
    :vars
    (
      ?auto_142391 - BLOCK
      ?auto_142393 - BLOCK
      ?auto_142392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142385 ?auto_142386 ) ) ( not ( = ?auto_142385 ?auto_142387 ) ) ( not ( = ?auto_142385 ?auto_142388 ) ) ( not ( = ?auto_142385 ?auto_142389 ) ) ( not ( = ?auto_142385 ?auto_142390 ) ) ( not ( = ?auto_142386 ?auto_142387 ) ) ( not ( = ?auto_142386 ?auto_142388 ) ) ( not ( = ?auto_142386 ?auto_142389 ) ) ( not ( = ?auto_142386 ?auto_142390 ) ) ( not ( = ?auto_142387 ?auto_142388 ) ) ( not ( = ?auto_142387 ?auto_142389 ) ) ( not ( = ?auto_142387 ?auto_142390 ) ) ( not ( = ?auto_142388 ?auto_142389 ) ) ( not ( = ?auto_142388 ?auto_142390 ) ) ( not ( = ?auto_142389 ?auto_142390 ) ) ( ON ?auto_142390 ?auto_142391 ) ( not ( = ?auto_142385 ?auto_142391 ) ) ( not ( = ?auto_142386 ?auto_142391 ) ) ( not ( = ?auto_142387 ?auto_142391 ) ) ( not ( = ?auto_142388 ?auto_142391 ) ) ( not ( = ?auto_142389 ?auto_142391 ) ) ( not ( = ?auto_142390 ?auto_142391 ) ) ( ON-TABLE ?auto_142393 ) ( ON ?auto_142391 ?auto_142393 ) ( not ( = ?auto_142393 ?auto_142391 ) ) ( not ( = ?auto_142393 ?auto_142390 ) ) ( not ( = ?auto_142393 ?auto_142389 ) ) ( not ( = ?auto_142385 ?auto_142393 ) ) ( not ( = ?auto_142386 ?auto_142393 ) ) ( not ( = ?auto_142387 ?auto_142393 ) ) ( not ( = ?auto_142388 ?auto_142393 ) ) ( ON ?auto_142385 ?auto_142392 ) ( not ( = ?auto_142385 ?auto_142392 ) ) ( not ( = ?auto_142386 ?auto_142392 ) ) ( not ( = ?auto_142387 ?auto_142392 ) ) ( not ( = ?auto_142388 ?auto_142392 ) ) ( not ( = ?auto_142389 ?auto_142392 ) ) ( not ( = ?auto_142390 ?auto_142392 ) ) ( not ( = ?auto_142391 ?auto_142392 ) ) ( not ( = ?auto_142393 ?auto_142392 ) ) ( ON ?auto_142386 ?auto_142385 ) ( ON-TABLE ?auto_142392 ) ( ON ?auto_142387 ?auto_142386 ) ( ON ?auto_142388 ?auto_142387 ) ( CLEAR ?auto_142390 ) ( ON ?auto_142389 ?auto_142388 ) ( CLEAR ?auto_142389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142392 ?auto_142385 ?auto_142386 ?auto_142387 ?auto_142388 )
      ( MAKE-6PILE ?auto_142385 ?auto_142386 ?auto_142387 ?auto_142388 ?auto_142389 ?auto_142390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142394 - BLOCK
      ?auto_142395 - BLOCK
      ?auto_142396 - BLOCK
      ?auto_142397 - BLOCK
      ?auto_142398 - BLOCK
      ?auto_142399 - BLOCK
    )
    :vars
    (
      ?auto_142402 - BLOCK
      ?auto_142401 - BLOCK
      ?auto_142400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142394 ?auto_142395 ) ) ( not ( = ?auto_142394 ?auto_142396 ) ) ( not ( = ?auto_142394 ?auto_142397 ) ) ( not ( = ?auto_142394 ?auto_142398 ) ) ( not ( = ?auto_142394 ?auto_142399 ) ) ( not ( = ?auto_142395 ?auto_142396 ) ) ( not ( = ?auto_142395 ?auto_142397 ) ) ( not ( = ?auto_142395 ?auto_142398 ) ) ( not ( = ?auto_142395 ?auto_142399 ) ) ( not ( = ?auto_142396 ?auto_142397 ) ) ( not ( = ?auto_142396 ?auto_142398 ) ) ( not ( = ?auto_142396 ?auto_142399 ) ) ( not ( = ?auto_142397 ?auto_142398 ) ) ( not ( = ?auto_142397 ?auto_142399 ) ) ( not ( = ?auto_142398 ?auto_142399 ) ) ( not ( = ?auto_142394 ?auto_142402 ) ) ( not ( = ?auto_142395 ?auto_142402 ) ) ( not ( = ?auto_142396 ?auto_142402 ) ) ( not ( = ?auto_142397 ?auto_142402 ) ) ( not ( = ?auto_142398 ?auto_142402 ) ) ( not ( = ?auto_142399 ?auto_142402 ) ) ( ON-TABLE ?auto_142401 ) ( ON ?auto_142402 ?auto_142401 ) ( not ( = ?auto_142401 ?auto_142402 ) ) ( not ( = ?auto_142401 ?auto_142399 ) ) ( not ( = ?auto_142401 ?auto_142398 ) ) ( not ( = ?auto_142394 ?auto_142401 ) ) ( not ( = ?auto_142395 ?auto_142401 ) ) ( not ( = ?auto_142396 ?auto_142401 ) ) ( not ( = ?auto_142397 ?auto_142401 ) ) ( ON ?auto_142394 ?auto_142400 ) ( not ( = ?auto_142394 ?auto_142400 ) ) ( not ( = ?auto_142395 ?auto_142400 ) ) ( not ( = ?auto_142396 ?auto_142400 ) ) ( not ( = ?auto_142397 ?auto_142400 ) ) ( not ( = ?auto_142398 ?auto_142400 ) ) ( not ( = ?auto_142399 ?auto_142400 ) ) ( not ( = ?auto_142402 ?auto_142400 ) ) ( not ( = ?auto_142401 ?auto_142400 ) ) ( ON ?auto_142395 ?auto_142394 ) ( ON-TABLE ?auto_142400 ) ( ON ?auto_142396 ?auto_142395 ) ( ON ?auto_142397 ?auto_142396 ) ( ON ?auto_142398 ?auto_142397 ) ( CLEAR ?auto_142398 ) ( HOLDING ?auto_142399 ) ( CLEAR ?auto_142402 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142401 ?auto_142402 ?auto_142399 )
      ( MAKE-6PILE ?auto_142394 ?auto_142395 ?auto_142396 ?auto_142397 ?auto_142398 ?auto_142399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142403 - BLOCK
      ?auto_142404 - BLOCK
      ?auto_142405 - BLOCK
      ?auto_142406 - BLOCK
      ?auto_142407 - BLOCK
      ?auto_142408 - BLOCK
    )
    :vars
    (
      ?auto_142409 - BLOCK
      ?auto_142411 - BLOCK
      ?auto_142410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142403 ?auto_142404 ) ) ( not ( = ?auto_142403 ?auto_142405 ) ) ( not ( = ?auto_142403 ?auto_142406 ) ) ( not ( = ?auto_142403 ?auto_142407 ) ) ( not ( = ?auto_142403 ?auto_142408 ) ) ( not ( = ?auto_142404 ?auto_142405 ) ) ( not ( = ?auto_142404 ?auto_142406 ) ) ( not ( = ?auto_142404 ?auto_142407 ) ) ( not ( = ?auto_142404 ?auto_142408 ) ) ( not ( = ?auto_142405 ?auto_142406 ) ) ( not ( = ?auto_142405 ?auto_142407 ) ) ( not ( = ?auto_142405 ?auto_142408 ) ) ( not ( = ?auto_142406 ?auto_142407 ) ) ( not ( = ?auto_142406 ?auto_142408 ) ) ( not ( = ?auto_142407 ?auto_142408 ) ) ( not ( = ?auto_142403 ?auto_142409 ) ) ( not ( = ?auto_142404 ?auto_142409 ) ) ( not ( = ?auto_142405 ?auto_142409 ) ) ( not ( = ?auto_142406 ?auto_142409 ) ) ( not ( = ?auto_142407 ?auto_142409 ) ) ( not ( = ?auto_142408 ?auto_142409 ) ) ( ON-TABLE ?auto_142411 ) ( ON ?auto_142409 ?auto_142411 ) ( not ( = ?auto_142411 ?auto_142409 ) ) ( not ( = ?auto_142411 ?auto_142408 ) ) ( not ( = ?auto_142411 ?auto_142407 ) ) ( not ( = ?auto_142403 ?auto_142411 ) ) ( not ( = ?auto_142404 ?auto_142411 ) ) ( not ( = ?auto_142405 ?auto_142411 ) ) ( not ( = ?auto_142406 ?auto_142411 ) ) ( ON ?auto_142403 ?auto_142410 ) ( not ( = ?auto_142403 ?auto_142410 ) ) ( not ( = ?auto_142404 ?auto_142410 ) ) ( not ( = ?auto_142405 ?auto_142410 ) ) ( not ( = ?auto_142406 ?auto_142410 ) ) ( not ( = ?auto_142407 ?auto_142410 ) ) ( not ( = ?auto_142408 ?auto_142410 ) ) ( not ( = ?auto_142409 ?auto_142410 ) ) ( not ( = ?auto_142411 ?auto_142410 ) ) ( ON ?auto_142404 ?auto_142403 ) ( ON-TABLE ?auto_142410 ) ( ON ?auto_142405 ?auto_142404 ) ( ON ?auto_142406 ?auto_142405 ) ( ON ?auto_142407 ?auto_142406 ) ( CLEAR ?auto_142409 ) ( ON ?auto_142408 ?auto_142407 ) ( CLEAR ?auto_142408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142410 ?auto_142403 ?auto_142404 ?auto_142405 ?auto_142406 ?auto_142407 )
      ( MAKE-6PILE ?auto_142403 ?auto_142404 ?auto_142405 ?auto_142406 ?auto_142407 ?auto_142408 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142412 - BLOCK
      ?auto_142413 - BLOCK
      ?auto_142414 - BLOCK
      ?auto_142415 - BLOCK
      ?auto_142416 - BLOCK
      ?auto_142417 - BLOCK
    )
    :vars
    (
      ?auto_142419 - BLOCK
      ?auto_142420 - BLOCK
      ?auto_142418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142412 ?auto_142413 ) ) ( not ( = ?auto_142412 ?auto_142414 ) ) ( not ( = ?auto_142412 ?auto_142415 ) ) ( not ( = ?auto_142412 ?auto_142416 ) ) ( not ( = ?auto_142412 ?auto_142417 ) ) ( not ( = ?auto_142413 ?auto_142414 ) ) ( not ( = ?auto_142413 ?auto_142415 ) ) ( not ( = ?auto_142413 ?auto_142416 ) ) ( not ( = ?auto_142413 ?auto_142417 ) ) ( not ( = ?auto_142414 ?auto_142415 ) ) ( not ( = ?auto_142414 ?auto_142416 ) ) ( not ( = ?auto_142414 ?auto_142417 ) ) ( not ( = ?auto_142415 ?auto_142416 ) ) ( not ( = ?auto_142415 ?auto_142417 ) ) ( not ( = ?auto_142416 ?auto_142417 ) ) ( not ( = ?auto_142412 ?auto_142419 ) ) ( not ( = ?auto_142413 ?auto_142419 ) ) ( not ( = ?auto_142414 ?auto_142419 ) ) ( not ( = ?auto_142415 ?auto_142419 ) ) ( not ( = ?auto_142416 ?auto_142419 ) ) ( not ( = ?auto_142417 ?auto_142419 ) ) ( ON-TABLE ?auto_142420 ) ( not ( = ?auto_142420 ?auto_142419 ) ) ( not ( = ?auto_142420 ?auto_142417 ) ) ( not ( = ?auto_142420 ?auto_142416 ) ) ( not ( = ?auto_142412 ?auto_142420 ) ) ( not ( = ?auto_142413 ?auto_142420 ) ) ( not ( = ?auto_142414 ?auto_142420 ) ) ( not ( = ?auto_142415 ?auto_142420 ) ) ( ON ?auto_142412 ?auto_142418 ) ( not ( = ?auto_142412 ?auto_142418 ) ) ( not ( = ?auto_142413 ?auto_142418 ) ) ( not ( = ?auto_142414 ?auto_142418 ) ) ( not ( = ?auto_142415 ?auto_142418 ) ) ( not ( = ?auto_142416 ?auto_142418 ) ) ( not ( = ?auto_142417 ?auto_142418 ) ) ( not ( = ?auto_142419 ?auto_142418 ) ) ( not ( = ?auto_142420 ?auto_142418 ) ) ( ON ?auto_142413 ?auto_142412 ) ( ON-TABLE ?auto_142418 ) ( ON ?auto_142414 ?auto_142413 ) ( ON ?auto_142415 ?auto_142414 ) ( ON ?auto_142416 ?auto_142415 ) ( ON ?auto_142417 ?auto_142416 ) ( CLEAR ?auto_142417 ) ( HOLDING ?auto_142419 ) ( CLEAR ?auto_142420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142420 ?auto_142419 )
      ( MAKE-6PILE ?auto_142412 ?auto_142413 ?auto_142414 ?auto_142415 ?auto_142416 ?auto_142417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142421 - BLOCK
      ?auto_142422 - BLOCK
      ?auto_142423 - BLOCK
      ?auto_142424 - BLOCK
      ?auto_142425 - BLOCK
      ?auto_142426 - BLOCK
    )
    :vars
    (
      ?auto_142429 - BLOCK
      ?auto_142428 - BLOCK
      ?auto_142427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142421 ?auto_142422 ) ) ( not ( = ?auto_142421 ?auto_142423 ) ) ( not ( = ?auto_142421 ?auto_142424 ) ) ( not ( = ?auto_142421 ?auto_142425 ) ) ( not ( = ?auto_142421 ?auto_142426 ) ) ( not ( = ?auto_142422 ?auto_142423 ) ) ( not ( = ?auto_142422 ?auto_142424 ) ) ( not ( = ?auto_142422 ?auto_142425 ) ) ( not ( = ?auto_142422 ?auto_142426 ) ) ( not ( = ?auto_142423 ?auto_142424 ) ) ( not ( = ?auto_142423 ?auto_142425 ) ) ( not ( = ?auto_142423 ?auto_142426 ) ) ( not ( = ?auto_142424 ?auto_142425 ) ) ( not ( = ?auto_142424 ?auto_142426 ) ) ( not ( = ?auto_142425 ?auto_142426 ) ) ( not ( = ?auto_142421 ?auto_142429 ) ) ( not ( = ?auto_142422 ?auto_142429 ) ) ( not ( = ?auto_142423 ?auto_142429 ) ) ( not ( = ?auto_142424 ?auto_142429 ) ) ( not ( = ?auto_142425 ?auto_142429 ) ) ( not ( = ?auto_142426 ?auto_142429 ) ) ( ON-TABLE ?auto_142428 ) ( not ( = ?auto_142428 ?auto_142429 ) ) ( not ( = ?auto_142428 ?auto_142426 ) ) ( not ( = ?auto_142428 ?auto_142425 ) ) ( not ( = ?auto_142421 ?auto_142428 ) ) ( not ( = ?auto_142422 ?auto_142428 ) ) ( not ( = ?auto_142423 ?auto_142428 ) ) ( not ( = ?auto_142424 ?auto_142428 ) ) ( ON ?auto_142421 ?auto_142427 ) ( not ( = ?auto_142421 ?auto_142427 ) ) ( not ( = ?auto_142422 ?auto_142427 ) ) ( not ( = ?auto_142423 ?auto_142427 ) ) ( not ( = ?auto_142424 ?auto_142427 ) ) ( not ( = ?auto_142425 ?auto_142427 ) ) ( not ( = ?auto_142426 ?auto_142427 ) ) ( not ( = ?auto_142429 ?auto_142427 ) ) ( not ( = ?auto_142428 ?auto_142427 ) ) ( ON ?auto_142422 ?auto_142421 ) ( ON-TABLE ?auto_142427 ) ( ON ?auto_142423 ?auto_142422 ) ( ON ?auto_142424 ?auto_142423 ) ( ON ?auto_142425 ?auto_142424 ) ( ON ?auto_142426 ?auto_142425 ) ( CLEAR ?auto_142428 ) ( ON ?auto_142429 ?auto_142426 ) ( CLEAR ?auto_142429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142427 ?auto_142421 ?auto_142422 ?auto_142423 ?auto_142424 ?auto_142425 ?auto_142426 )
      ( MAKE-6PILE ?auto_142421 ?auto_142422 ?auto_142423 ?auto_142424 ?auto_142425 ?auto_142426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142430 - BLOCK
      ?auto_142431 - BLOCK
      ?auto_142432 - BLOCK
      ?auto_142433 - BLOCK
      ?auto_142434 - BLOCK
      ?auto_142435 - BLOCK
    )
    :vars
    (
      ?auto_142436 - BLOCK
      ?auto_142437 - BLOCK
      ?auto_142438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142430 ?auto_142431 ) ) ( not ( = ?auto_142430 ?auto_142432 ) ) ( not ( = ?auto_142430 ?auto_142433 ) ) ( not ( = ?auto_142430 ?auto_142434 ) ) ( not ( = ?auto_142430 ?auto_142435 ) ) ( not ( = ?auto_142431 ?auto_142432 ) ) ( not ( = ?auto_142431 ?auto_142433 ) ) ( not ( = ?auto_142431 ?auto_142434 ) ) ( not ( = ?auto_142431 ?auto_142435 ) ) ( not ( = ?auto_142432 ?auto_142433 ) ) ( not ( = ?auto_142432 ?auto_142434 ) ) ( not ( = ?auto_142432 ?auto_142435 ) ) ( not ( = ?auto_142433 ?auto_142434 ) ) ( not ( = ?auto_142433 ?auto_142435 ) ) ( not ( = ?auto_142434 ?auto_142435 ) ) ( not ( = ?auto_142430 ?auto_142436 ) ) ( not ( = ?auto_142431 ?auto_142436 ) ) ( not ( = ?auto_142432 ?auto_142436 ) ) ( not ( = ?auto_142433 ?auto_142436 ) ) ( not ( = ?auto_142434 ?auto_142436 ) ) ( not ( = ?auto_142435 ?auto_142436 ) ) ( not ( = ?auto_142437 ?auto_142436 ) ) ( not ( = ?auto_142437 ?auto_142435 ) ) ( not ( = ?auto_142437 ?auto_142434 ) ) ( not ( = ?auto_142430 ?auto_142437 ) ) ( not ( = ?auto_142431 ?auto_142437 ) ) ( not ( = ?auto_142432 ?auto_142437 ) ) ( not ( = ?auto_142433 ?auto_142437 ) ) ( ON ?auto_142430 ?auto_142438 ) ( not ( = ?auto_142430 ?auto_142438 ) ) ( not ( = ?auto_142431 ?auto_142438 ) ) ( not ( = ?auto_142432 ?auto_142438 ) ) ( not ( = ?auto_142433 ?auto_142438 ) ) ( not ( = ?auto_142434 ?auto_142438 ) ) ( not ( = ?auto_142435 ?auto_142438 ) ) ( not ( = ?auto_142436 ?auto_142438 ) ) ( not ( = ?auto_142437 ?auto_142438 ) ) ( ON ?auto_142431 ?auto_142430 ) ( ON-TABLE ?auto_142438 ) ( ON ?auto_142432 ?auto_142431 ) ( ON ?auto_142433 ?auto_142432 ) ( ON ?auto_142434 ?auto_142433 ) ( ON ?auto_142435 ?auto_142434 ) ( ON ?auto_142436 ?auto_142435 ) ( CLEAR ?auto_142436 ) ( HOLDING ?auto_142437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142437 )
      ( MAKE-6PILE ?auto_142430 ?auto_142431 ?auto_142432 ?auto_142433 ?auto_142434 ?auto_142435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_142439 - BLOCK
      ?auto_142440 - BLOCK
      ?auto_142441 - BLOCK
      ?auto_142442 - BLOCK
      ?auto_142443 - BLOCK
      ?auto_142444 - BLOCK
    )
    :vars
    (
      ?auto_142445 - BLOCK
      ?auto_142447 - BLOCK
      ?auto_142446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142439 ?auto_142440 ) ) ( not ( = ?auto_142439 ?auto_142441 ) ) ( not ( = ?auto_142439 ?auto_142442 ) ) ( not ( = ?auto_142439 ?auto_142443 ) ) ( not ( = ?auto_142439 ?auto_142444 ) ) ( not ( = ?auto_142440 ?auto_142441 ) ) ( not ( = ?auto_142440 ?auto_142442 ) ) ( not ( = ?auto_142440 ?auto_142443 ) ) ( not ( = ?auto_142440 ?auto_142444 ) ) ( not ( = ?auto_142441 ?auto_142442 ) ) ( not ( = ?auto_142441 ?auto_142443 ) ) ( not ( = ?auto_142441 ?auto_142444 ) ) ( not ( = ?auto_142442 ?auto_142443 ) ) ( not ( = ?auto_142442 ?auto_142444 ) ) ( not ( = ?auto_142443 ?auto_142444 ) ) ( not ( = ?auto_142439 ?auto_142445 ) ) ( not ( = ?auto_142440 ?auto_142445 ) ) ( not ( = ?auto_142441 ?auto_142445 ) ) ( not ( = ?auto_142442 ?auto_142445 ) ) ( not ( = ?auto_142443 ?auto_142445 ) ) ( not ( = ?auto_142444 ?auto_142445 ) ) ( not ( = ?auto_142447 ?auto_142445 ) ) ( not ( = ?auto_142447 ?auto_142444 ) ) ( not ( = ?auto_142447 ?auto_142443 ) ) ( not ( = ?auto_142439 ?auto_142447 ) ) ( not ( = ?auto_142440 ?auto_142447 ) ) ( not ( = ?auto_142441 ?auto_142447 ) ) ( not ( = ?auto_142442 ?auto_142447 ) ) ( ON ?auto_142439 ?auto_142446 ) ( not ( = ?auto_142439 ?auto_142446 ) ) ( not ( = ?auto_142440 ?auto_142446 ) ) ( not ( = ?auto_142441 ?auto_142446 ) ) ( not ( = ?auto_142442 ?auto_142446 ) ) ( not ( = ?auto_142443 ?auto_142446 ) ) ( not ( = ?auto_142444 ?auto_142446 ) ) ( not ( = ?auto_142445 ?auto_142446 ) ) ( not ( = ?auto_142447 ?auto_142446 ) ) ( ON ?auto_142440 ?auto_142439 ) ( ON-TABLE ?auto_142446 ) ( ON ?auto_142441 ?auto_142440 ) ( ON ?auto_142442 ?auto_142441 ) ( ON ?auto_142443 ?auto_142442 ) ( ON ?auto_142444 ?auto_142443 ) ( ON ?auto_142445 ?auto_142444 ) ( ON ?auto_142447 ?auto_142445 ) ( CLEAR ?auto_142447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142446 ?auto_142439 ?auto_142440 ?auto_142441 ?auto_142442 ?auto_142443 ?auto_142444 ?auto_142445 )
      ( MAKE-6PILE ?auto_142439 ?auto_142440 ?auto_142441 ?auto_142442 ?auto_142443 ?auto_142444 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142459 - BLOCK
    )
    :vars
    (
      ?auto_142462 - BLOCK
      ?auto_142460 - BLOCK
      ?auto_142461 - BLOCK
      ?auto_142464 - BLOCK
      ?auto_142466 - BLOCK
      ?auto_142463 - BLOCK
      ?auto_142465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142462 ?auto_142459 ) ( ON-TABLE ?auto_142459 ) ( not ( = ?auto_142459 ?auto_142462 ) ) ( not ( = ?auto_142459 ?auto_142460 ) ) ( not ( = ?auto_142459 ?auto_142461 ) ) ( not ( = ?auto_142462 ?auto_142460 ) ) ( not ( = ?auto_142462 ?auto_142461 ) ) ( not ( = ?auto_142460 ?auto_142461 ) ) ( ON ?auto_142460 ?auto_142462 ) ( CLEAR ?auto_142460 ) ( HOLDING ?auto_142461 ) ( CLEAR ?auto_142464 ) ( ON-TABLE ?auto_142466 ) ( ON ?auto_142463 ?auto_142466 ) ( ON ?auto_142465 ?auto_142463 ) ( ON ?auto_142464 ?auto_142465 ) ( not ( = ?auto_142466 ?auto_142463 ) ) ( not ( = ?auto_142466 ?auto_142465 ) ) ( not ( = ?auto_142466 ?auto_142464 ) ) ( not ( = ?auto_142466 ?auto_142461 ) ) ( not ( = ?auto_142463 ?auto_142465 ) ) ( not ( = ?auto_142463 ?auto_142464 ) ) ( not ( = ?auto_142463 ?auto_142461 ) ) ( not ( = ?auto_142465 ?auto_142464 ) ) ( not ( = ?auto_142465 ?auto_142461 ) ) ( not ( = ?auto_142464 ?auto_142461 ) ) ( not ( = ?auto_142459 ?auto_142464 ) ) ( not ( = ?auto_142459 ?auto_142466 ) ) ( not ( = ?auto_142459 ?auto_142463 ) ) ( not ( = ?auto_142459 ?auto_142465 ) ) ( not ( = ?auto_142462 ?auto_142464 ) ) ( not ( = ?auto_142462 ?auto_142466 ) ) ( not ( = ?auto_142462 ?auto_142463 ) ) ( not ( = ?auto_142462 ?auto_142465 ) ) ( not ( = ?auto_142460 ?auto_142464 ) ) ( not ( = ?auto_142460 ?auto_142466 ) ) ( not ( = ?auto_142460 ?auto_142463 ) ) ( not ( = ?auto_142460 ?auto_142465 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142466 ?auto_142463 ?auto_142465 ?auto_142464 ?auto_142461 )
      ( MAKE-1PILE ?auto_142459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142467 - BLOCK
    )
    :vars
    (
      ?auto_142470 - BLOCK
      ?auto_142469 - BLOCK
      ?auto_142472 - BLOCK
      ?auto_142474 - BLOCK
      ?auto_142471 - BLOCK
      ?auto_142473 - BLOCK
      ?auto_142468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142470 ?auto_142467 ) ( ON-TABLE ?auto_142467 ) ( not ( = ?auto_142467 ?auto_142470 ) ) ( not ( = ?auto_142467 ?auto_142469 ) ) ( not ( = ?auto_142467 ?auto_142472 ) ) ( not ( = ?auto_142470 ?auto_142469 ) ) ( not ( = ?auto_142470 ?auto_142472 ) ) ( not ( = ?auto_142469 ?auto_142472 ) ) ( ON ?auto_142469 ?auto_142470 ) ( CLEAR ?auto_142474 ) ( ON-TABLE ?auto_142471 ) ( ON ?auto_142473 ?auto_142471 ) ( ON ?auto_142468 ?auto_142473 ) ( ON ?auto_142474 ?auto_142468 ) ( not ( = ?auto_142471 ?auto_142473 ) ) ( not ( = ?auto_142471 ?auto_142468 ) ) ( not ( = ?auto_142471 ?auto_142474 ) ) ( not ( = ?auto_142471 ?auto_142472 ) ) ( not ( = ?auto_142473 ?auto_142468 ) ) ( not ( = ?auto_142473 ?auto_142474 ) ) ( not ( = ?auto_142473 ?auto_142472 ) ) ( not ( = ?auto_142468 ?auto_142474 ) ) ( not ( = ?auto_142468 ?auto_142472 ) ) ( not ( = ?auto_142474 ?auto_142472 ) ) ( not ( = ?auto_142467 ?auto_142474 ) ) ( not ( = ?auto_142467 ?auto_142471 ) ) ( not ( = ?auto_142467 ?auto_142473 ) ) ( not ( = ?auto_142467 ?auto_142468 ) ) ( not ( = ?auto_142470 ?auto_142474 ) ) ( not ( = ?auto_142470 ?auto_142471 ) ) ( not ( = ?auto_142470 ?auto_142473 ) ) ( not ( = ?auto_142470 ?auto_142468 ) ) ( not ( = ?auto_142469 ?auto_142474 ) ) ( not ( = ?auto_142469 ?auto_142471 ) ) ( not ( = ?auto_142469 ?auto_142473 ) ) ( not ( = ?auto_142469 ?auto_142468 ) ) ( ON ?auto_142472 ?auto_142469 ) ( CLEAR ?auto_142472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142467 ?auto_142470 ?auto_142469 )
      ( MAKE-1PILE ?auto_142467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142475 - BLOCK
    )
    :vars
    (
      ?auto_142477 - BLOCK
      ?auto_142482 - BLOCK
      ?auto_142479 - BLOCK
      ?auto_142476 - BLOCK
      ?auto_142481 - BLOCK
      ?auto_142480 - BLOCK
      ?auto_142478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142477 ?auto_142475 ) ( ON-TABLE ?auto_142475 ) ( not ( = ?auto_142475 ?auto_142477 ) ) ( not ( = ?auto_142475 ?auto_142482 ) ) ( not ( = ?auto_142475 ?auto_142479 ) ) ( not ( = ?auto_142477 ?auto_142482 ) ) ( not ( = ?auto_142477 ?auto_142479 ) ) ( not ( = ?auto_142482 ?auto_142479 ) ) ( ON ?auto_142482 ?auto_142477 ) ( ON-TABLE ?auto_142476 ) ( ON ?auto_142481 ?auto_142476 ) ( ON ?auto_142480 ?auto_142481 ) ( not ( = ?auto_142476 ?auto_142481 ) ) ( not ( = ?auto_142476 ?auto_142480 ) ) ( not ( = ?auto_142476 ?auto_142478 ) ) ( not ( = ?auto_142476 ?auto_142479 ) ) ( not ( = ?auto_142481 ?auto_142480 ) ) ( not ( = ?auto_142481 ?auto_142478 ) ) ( not ( = ?auto_142481 ?auto_142479 ) ) ( not ( = ?auto_142480 ?auto_142478 ) ) ( not ( = ?auto_142480 ?auto_142479 ) ) ( not ( = ?auto_142478 ?auto_142479 ) ) ( not ( = ?auto_142475 ?auto_142478 ) ) ( not ( = ?auto_142475 ?auto_142476 ) ) ( not ( = ?auto_142475 ?auto_142481 ) ) ( not ( = ?auto_142475 ?auto_142480 ) ) ( not ( = ?auto_142477 ?auto_142478 ) ) ( not ( = ?auto_142477 ?auto_142476 ) ) ( not ( = ?auto_142477 ?auto_142481 ) ) ( not ( = ?auto_142477 ?auto_142480 ) ) ( not ( = ?auto_142482 ?auto_142478 ) ) ( not ( = ?auto_142482 ?auto_142476 ) ) ( not ( = ?auto_142482 ?auto_142481 ) ) ( not ( = ?auto_142482 ?auto_142480 ) ) ( ON ?auto_142479 ?auto_142482 ) ( CLEAR ?auto_142479 ) ( HOLDING ?auto_142478 ) ( CLEAR ?auto_142480 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142476 ?auto_142481 ?auto_142480 ?auto_142478 )
      ( MAKE-1PILE ?auto_142475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142483 - BLOCK
    )
    :vars
    (
      ?auto_142485 - BLOCK
      ?auto_142487 - BLOCK
      ?auto_142488 - BLOCK
      ?auto_142486 - BLOCK
      ?auto_142489 - BLOCK
      ?auto_142490 - BLOCK
      ?auto_142484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142485 ?auto_142483 ) ( ON-TABLE ?auto_142483 ) ( not ( = ?auto_142483 ?auto_142485 ) ) ( not ( = ?auto_142483 ?auto_142487 ) ) ( not ( = ?auto_142483 ?auto_142488 ) ) ( not ( = ?auto_142485 ?auto_142487 ) ) ( not ( = ?auto_142485 ?auto_142488 ) ) ( not ( = ?auto_142487 ?auto_142488 ) ) ( ON ?auto_142487 ?auto_142485 ) ( ON-TABLE ?auto_142486 ) ( ON ?auto_142489 ?auto_142486 ) ( ON ?auto_142490 ?auto_142489 ) ( not ( = ?auto_142486 ?auto_142489 ) ) ( not ( = ?auto_142486 ?auto_142490 ) ) ( not ( = ?auto_142486 ?auto_142484 ) ) ( not ( = ?auto_142486 ?auto_142488 ) ) ( not ( = ?auto_142489 ?auto_142490 ) ) ( not ( = ?auto_142489 ?auto_142484 ) ) ( not ( = ?auto_142489 ?auto_142488 ) ) ( not ( = ?auto_142490 ?auto_142484 ) ) ( not ( = ?auto_142490 ?auto_142488 ) ) ( not ( = ?auto_142484 ?auto_142488 ) ) ( not ( = ?auto_142483 ?auto_142484 ) ) ( not ( = ?auto_142483 ?auto_142486 ) ) ( not ( = ?auto_142483 ?auto_142489 ) ) ( not ( = ?auto_142483 ?auto_142490 ) ) ( not ( = ?auto_142485 ?auto_142484 ) ) ( not ( = ?auto_142485 ?auto_142486 ) ) ( not ( = ?auto_142485 ?auto_142489 ) ) ( not ( = ?auto_142485 ?auto_142490 ) ) ( not ( = ?auto_142487 ?auto_142484 ) ) ( not ( = ?auto_142487 ?auto_142486 ) ) ( not ( = ?auto_142487 ?auto_142489 ) ) ( not ( = ?auto_142487 ?auto_142490 ) ) ( ON ?auto_142488 ?auto_142487 ) ( CLEAR ?auto_142490 ) ( ON ?auto_142484 ?auto_142488 ) ( CLEAR ?auto_142484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142483 ?auto_142485 ?auto_142487 ?auto_142488 )
      ( MAKE-1PILE ?auto_142483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142491 - BLOCK
    )
    :vars
    (
      ?auto_142494 - BLOCK
      ?auto_142493 - BLOCK
      ?auto_142498 - BLOCK
      ?auto_142496 - BLOCK
      ?auto_142495 - BLOCK
      ?auto_142492 - BLOCK
      ?auto_142497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142494 ?auto_142491 ) ( ON-TABLE ?auto_142491 ) ( not ( = ?auto_142491 ?auto_142494 ) ) ( not ( = ?auto_142491 ?auto_142493 ) ) ( not ( = ?auto_142491 ?auto_142498 ) ) ( not ( = ?auto_142494 ?auto_142493 ) ) ( not ( = ?auto_142494 ?auto_142498 ) ) ( not ( = ?auto_142493 ?auto_142498 ) ) ( ON ?auto_142493 ?auto_142494 ) ( ON-TABLE ?auto_142496 ) ( ON ?auto_142495 ?auto_142496 ) ( not ( = ?auto_142496 ?auto_142495 ) ) ( not ( = ?auto_142496 ?auto_142492 ) ) ( not ( = ?auto_142496 ?auto_142497 ) ) ( not ( = ?auto_142496 ?auto_142498 ) ) ( not ( = ?auto_142495 ?auto_142492 ) ) ( not ( = ?auto_142495 ?auto_142497 ) ) ( not ( = ?auto_142495 ?auto_142498 ) ) ( not ( = ?auto_142492 ?auto_142497 ) ) ( not ( = ?auto_142492 ?auto_142498 ) ) ( not ( = ?auto_142497 ?auto_142498 ) ) ( not ( = ?auto_142491 ?auto_142497 ) ) ( not ( = ?auto_142491 ?auto_142496 ) ) ( not ( = ?auto_142491 ?auto_142495 ) ) ( not ( = ?auto_142491 ?auto_142492 ) ) ( not ( = ?auto_142494 ?auto_142497 ) ) ( not ( = ?auto_142494 ?auto_142496 ) ) ( not ( = ?auto_142494 ?auto_142495 ) ) ( not ( = ?auto_142494 ?auto_142492 ) ) ( not ( = ?auto_142493 ?auto_142497 ) ) ( not ( = ?auto_142493 ?auto_142496 ) ) ( not ( = ?auto_142493 ?auto_142495 ) ) ( not ( = ?auto_142493 ?auto_142492 ) ) ( ON ?auto_142498 ?auto_142493 ) ( ON ?auto_142497 ?auto_142498 ) ( CLEAR ?auto_142497 ) ( HOLDING ?auto_142492 ) ( CLEAR ?auto_142495 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142496 ?auto_142495 ?auto_142492 )
      ( MAKE-1PILE ?auto_142491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142499 - BLOCK
    )
    :vars
    (
      ?auto_142501 - BLOCK
      ?auto_142504 - BLOCK
      ?auto_142500 - BLOCK
      ?auto_142502 - BLOCK
      ?auto_142505 - BLOCK
      ?auto_142503 - BLOCK
      ?auto_142506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142501 ?auto_142499 ) ( ON-TABLE ?auto_142499 ) ( not ( = ?auto_142499 ?auto_142501 ) ) ( not ( = ?auto_142499 ?auto_142504 ) ) ( not ( = ?auto_142499 ?auto_142500 ) ) ( not ( = ?auto_142501 ?auto_142504 ) ) ( not ( = ?auto_142501 ?auto_142500 ) ) ( not ( = ?auto_142504 ?auto_142500 ) ) ( ON ?auto_142504 ?auto_142501 ) ( ON-TABLE ?auto_142502 ) ( ON ?auto_142505 ?auto_142502 ) ( not ( = ?auto_142502 ?auto_142505 ) ) ( not ( = ?auto_142502 ?auto_142503 ) ) ( not ( = ?auto_142502 ?auto_142506 ) ) ( not ( = ?auto_142502 ?auto_142500 ) ) ( not ( = ?auto_142505 ?auto_142503 ) ) ( not ( = ?auto_142505 ?auto_142506 ) ) ( not ( = ?auto_142505 ?auto_142500 ) ) ( not ( = ?auto_142503 ?auto_142506 ) ) ( not ( = ?auto_142503 ?auto_142500 ) ) ( not ( = ?auto_142506 ?auto_142500 ) ) ( not ( = ?auto_142499 ?auto_142506 ) ) ( not ( = ?auto_142499 ?auto_142502 ) ) ( not ( = ?auto_142499 ?auto_142505 ) ) ( not ( = ?auto_142499 ?auto_142503 ) ) ( not ( = ?auto_142501 ?auto_142506 ) ) ( not ( = ?auto_142501 ?auto_142502 ) ) ( not ( = ?auto_142501 ?auto_142505 ) ) ( not ( = ?auto_142501 ?auto_142503 ) ) ( not ( = ?auto_142504 ?auto_142506 ) ) ( not ( = ?auto_142504 ?auto_142502 ) ) ( not ( = ?auto_142504 ?auto_142505 ) ) ( not ( = ?auto_142504 ?auto_142503 ) ) ( ON ?auto_142500 ?auto_142504 ) ( ON ?auto_142506 ?auto_142500 ) ( CLEAR ?auto_142505 ) ( ON ?auto_142503 ?auto_142506 ) ( CLEAR ?auto_142503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142499 ?auto_142501 ?auto_142504 ?auto_142500 ?auto_142506 )
      ( MAKE-1PILE ?auto_142499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142507 - BLOCK
    )
    :vars
    (
      ?auto_142513 - BLOCK
      ?auto_142514 - BLOCK
      ?auto_142509 - BLOCK
      ?auto_142508 - BLOCK
      ?auto_142510 - BLOCK
      ?auto_142512 - BLOCK
      ?auto_142511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142513 ?auto_142507 ) ( ON-TABLE ?auto_142507 ) ( not ( = ?auto_142507 ?auto_142513 ) ) ( not ( = ?auto_142507 ?auto_142514 ) ) ( not ( = ?auto_142507 ?auto_142509 ) ) ( not ( = ?auto_142513 ?auto_142514 ) ) ( not ( = ?auto_142513 ?auto_142509 ) ) ( not ( = ?auto_142514 ?auto_142509 ) ) ( ON ?auto_142514 ?auto_142513 ) ( ON-TABLE ?auto_142508 ) ( not ( = ?auto_142508 ?auto_142510 ) ) ( not ( = ?auto_142508 ?auto_142512 ) ) ( not ( = ?auto_142508 ?auto_142511 ) ) ( not ( = ?auto_142508 ?auto_142509 ) ) ( not ( = ?auto_142510 ?auto_142512 ) ) ( not ( = ?auto_142510 ?auto_142511 ) ) ( not ( = ?auto_142510 ?auto_142509 ) ) ( not ( = ?auto_142512 ?auto_142511 ) ) ( not ( = ?auto_142512 ?auto_142509 ) ) ( not ( = ?auto_142511 ?auto_142509 ) ) ( not ( = ?auto_142507 ?auto_142511 ) ) ( not ( = ?auto_142507 ?auto_142508 ) ) ( not ( = ?auto_142507 ?auto_142510 ) ) ( not ( = ?auto_142507 ?auto_142512 ) ) ( not ( = ?auto_142513 ?auto_142511 ) ) ( not ( = ?auto_142513 ?auto_142508 ) ) ( not ( = ?auto_142513 ?auto_142510 ) ) ( not ( = ?auto_142513 ?auto_142512 ) ) ( not ( = ?auto_142514 ?auto_142511 ) ) ( not ( = ?auto_142514 ?auto_142508 ) ) ( not ( = ?auto_142514 ?auto_142510 ) ) ( not ( = ?auto_142514 ?auto_142512 ) ) ( ON ?auto_142509 ?auto_142514 ) ( ON ?auto_142511 ?auto_142509 ) ( ON ?auto_142512 ?auto_142511 ) ( CLEAR ?auto_142512 ) ( HOLDING ?auto_142510 ) ( CLEAR ?auto_142508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142508 ?auto_142510 )
      ( MAKE-1PILE ?auto_142507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142515 - BLOCK
    )
    :vars
    (
      ?auto_142521 - BLOCK
      ?auto_142520 - BLOCK
      ?auto_142519 - BLOCK
      ?auto_142522 - BLOCK
      ?auto_142518 - BLOCK
      ?auto_142517 - BLOCK
      ?auto_142516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142521 ?auto_142515 ) ( ON-TABLE ?auto_142515 ) ( not ( = ?auto_142515 ?auto_142521 ) ) ( not ( = ?auto_142515 ?auto_142520 ) ) ( not ( = ?auto_142515 ?auto_142519 ) ) ( not ( = ?auto_142521 ?auto_142520 ) ) ( not ( = ?auto_142521 ?auto_142519 ) ) ( not ( = ?auto_142520 ?auto_142519 ) ) ( ON ?auto_142520 ?auto_142521 ) ( ON-TABLE ?auto_142522 ) ( not ( = ?auto_142522 ?auto_142518 ) ) ( not ( = ?auto_142522 ?auto_142517 ) ) ( not ( = ?auto_142522 ?auto_142516 ) ) ( not ( = ?auto_142522 ?auto_142519 ) ) ( not ( = ?auto_142518 ?auto_142517 ) ) ( not ( = ?auto_142518 ?auto_142516 ) ) ( not ( = ?auto_142518 ?auto_142519 ) ) ( not ( = ?auto_142517 ?auto_142516 ) ) ( not ( = ?auto_142517 ?auto_142519 ) ) ( not ( = ?auto_142516 ?auto_142519 ) ) ( not ( = ?auto_142515 ?auto_142516 ) ) ( not ( = ?auto_142515 ?auto_142522 ) ) ( not ( = ?auto_142515 ?auto_142518 ) ) ( not ( = ?auto_142515 ?auto_142517 ) ) ( not ( = ?auto_142521 ?auto_142516 ) ) ( not ( = ?auto_142521 ?auto_142522 ) ) ( not ( = ?auto_142521 ?auto_142518 ) ) ( not ( = ?auto_142521 ?auto_142517 ) ) ( not ( = ?auto_142520 ?auto_142516 ) ) ( not ( = ?auto_142520 ?auto_142522 ) ) ( not ( = ?auto_142520 ?auto_142518 ) ) ( not ( = ?auto_142520 ?auto_142517 ) ) ( ON ?auto_142519 ?auto_142520 ) ( ON ?auto_142516 ?auto_142519 ) ( ON ?auto_142517 ?auto_142516 ) ( CLEAR ?auto_142522 ) ( ON ?auto_142518 ?auto_142517 ) ( CLEAR ?auto_142518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142515 ?auto_142521 ?auto_142520 ?auto_142519 ?auto_142516 ?auto_142517 )
      ( MAKE-1PILE ?auto_142515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142523 - BLOCK
    )
    :vars
    (
      ?auto_142527 - BLOCK
      ?auto_142528 - BLOCK
      ?auto_142529 - BLOCK
      ?auto_142526 - BLOCK
      ?auto_142525 - BLOCK
      ?auto_142530 - BLOCK
      ?auto_142524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142527 ?auto_142523 ) ( ON-TABLE ?auto_142523 ) ( not ( = ?auto_142523 ?auto_142527 ) ) ( not ( = ?auto_142523 ?auto_142528 ) ) ( not ( = ?auto_142523 ?auto_142529 ) ) ( not ( = ?auto_142527 ?auto_142528 ) ) ( not ( = ?auto_142527 ?auto_142529 ) ) ( not ( = ?auto_142528 ?auto_142529 ) ) ( ON ?auto_142528 ?auto_142527 ) ( not ( = ?auto_142526 ?auto_142525 ) ) ( not ( = ?auto_142526 ?auto_142530 ) ) ( not ( = ?auto_142526 ?auto_142524 ) ) ( not ( = ?auto_142526 ?auto_142529 ) ) ( not ( = ?auto_142525 ?auto_142530 ) ) ( not ( = ?auto_142525 ?auto_142524 ) ) ( not ( = ?auto_142525 ?auto_142529 ) ) ( not ( = ?auto_142530 ?auto_142524 ) ) ( not ( = ?auto_142530 ?auto_142529 ) ) ( not ( = ?auto_142524 ?auto_142529 ) ) ( not ( = ?auto_142523 ?auto_142524 ) ) ( not ( = ?auto_142523 ?auto_142526 ) ) ( not ( = ?auto_142523 ?auto_142525 ) ) ( not ( = ?auto_142523 ?auto_142530 ) ) ( not ( = ?auto_142527 ?auto_142524 ) ) ( not ( = ?auto_142527 ?auto_142526 ) ) ( not ( = ?auto_142527 ?auto_142525 ) ) ( not ( = ?auto_142527 ?auto_142530 ) ) ( not ( = ?auto_142528 ?auto_142524 ) ) ( not ( = ?auto_142528 ?auto_142526 ) ) ( not ( = ?auto_142528 ?auto_142525 ) ) ( not ( = ?auto_142528 ?auto_142530 ) ) ( ON ?auto_142529 ?auto_142528 ) ( ON ?auto_142524 ?auto_142529 ) ( ON ?auto_142530 ?auto_142524 ) ( ON ?auto_142525 ?auto_142530 ) ( CLEAR ?auto_142525 ) ( HOLDING ?auto_142526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142526 )
      ( MAKE-1PILE ?auto_142523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142540 - BLOCK
    )
    :vars
    (
      ?auto_142546 - BLOCK
      ?auto_142544 - BLOCK
      ?auto_142545 - BLOCK
      ?auto_142541 - BLOCK
      ?auto_142543 - BLOCK
      ?auto_142542 - BLOCK
      ?auto_142547 - BLOCK
      ?auto_142548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142546 ?auto_142540 ) ( ON-TABLE ?auto_142540 ) ( not ( = ?auto_142540 ?auto_142546 ) ) ( not ( = ?auto_142540 ?auto_142544 ) ) ( not ( = ?auto_142540 ?auto_142545 ) ) ( not ( = ?auto_142546 ?auto_142544 ) ) ( not ( = ?auto_142546 ?auto_142545 ) ) ( not ( = ?auto_142544 ?auto_142545 ) ) ( ON ?auto_142544 ?auto_142546 ) ( not ( = ?auto_142541 ?auto_142543 ) ) ( not ( = ?auto_142541 ?auto_142542 ) ) ( not ( = ?auto_142541 ?auto_142547 ) ) ( not ( = ?auto_142541 ?auto_142545 ) ) ( not ( = ?auto_142543 ?auto_142542 ) ) ( not ( = ?auto_142543 ?auto_142547 ) ) ( not ( = ?auto_142543 ?auto_142545 ) ) ( not ( = ?auto_142542 ?auto_142547 ) ) ( not ( = ?auto_142542 ?auto_142545 ) ) ( not ( = ?auto_142547 ?auto_142545 ) ) ( not ( = ?auto_142540 ?auto_142547 ) ) ( not ( = ?auto_142540 ?auto_142541 ) ) ( not ( = ?auto_142540 ?auto_142543 ) ) ( not ( = ?auto_142540 ?auto_142542 ) ) ( not ( = ?auto_142546 ?auto_142547 ) ) ( not ( = ?auto_142546 ?auto_142541 ) ) ( not ( = ?auto_142546 ?auto_142543 ) ) ( not ( = ?auto_142546 ?auto_142542 ) ) ( not ( = ?auto_142544 ?auto_142547 ) ) ( not ( = ?auto_142544 ?auto_142541 ) ) ( not ( = ?auto_142544 ?auto_142543 ) ) ( not ( = ?auto_142544 ?auto_142542 ) ) ( ON ?auto_142545 ?auto_142544 ) ( ON ?auto_142547 ?auto_142545 ) ( ON ?auto_142542 ?auto_142547 ) ( ON ?auto_142543 ?auto_142542 ) ( CLEAR ?auto_142543 ) ( ON ?auto_142541 ?auto_142548 ) ( CLEAR ?auto_142541 ) ( HAND-EMPTY ) ( not ( = ?auto_142540 ?auto_142548 ) ) ( not ( = ?auto_142546 ?auto_142548 ) ) ( not ( = ?auto_142544 ?auto_142548 ) ) ( not ( = ?auto_142545 ?auto_142548 ) ) ( not ( = ?auto_142541 ?auto_142548 ) ) ( not ( = ?auto_142543 ?auto_142548 ) ) ( not ( = ?auto_142542 ?auto_142548 ) ) ( not ( = ?auto_142547 ?auto_142548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142541 ?auto_142548 )
      ( MAKE-1PILE ?auto_142540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142549 - BLOCK
    )
    :vars
    (
      ?auto_142555 - BLOCK
      ?auto_142550 - BLOCK
      ?auto_142551 - BLOCK
      ?auto_142557 - BLOCK
      ?auto_142554 - BLOCK
      ?auto_142556 - BLOCK
      ?auto_142553 - BLOCK
      ?auto_142552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142555 ?auto_142549 ) ( ON-TABLE ?auto_142549 ) ( not ( = ?auto_142549 ?auto_142555 ) ) ( not ( = ?auto_142549 ?auto_142550 ) ) ( not ( = ?auto_142549 ?auto_142551 ) ) ( not ( = ?auto_142555 ?auto_142550 ) ) ( not ( = ?auto_142555 ?auto_142551 ) ) ( not ( = ?auto_142550 ?auto_142551 ) ) ( ON ?auto_142550 ?auto_142555 ) ( not ( = ?auto_142557 ?auto_142554 ) ) ( not ( = ?auto_142557 ?auto_142556 ) ) ( not ( = ?auto_142557 ?auto_142553 ) ) ( not ( = ?auto_142557 ?auto_142551 ) ) ( not ( = ?auto_142554 ?auto_142556 ) ) ( not ( = ?auto_142554 ?auto_142553 ) ) ( not ( = ?auto_142554 ?auto_142551 ) ) ( not ( = ?auto_142556 ?auto_142553 ) ) ( not ( = ?auto_142556 ?auto_142551 ) ) ( not ( = ?auto_142553 ?auto_142551 ) ) ( not ( = ?auto_142549 ?auto_142553 ) ) ( not ( = ?auto_142549 ?auto_142557 ) ) ( not ( = ?auto_142549 ?auto_142554 ) ) ( not ( = ?auto_142549 ?auto_142556 ) ) ( not ( = ?auto_142555 ?auto_142553 ) ) ( not ( = ?auto_142555 ?auto_142557 ) ) ( not ( = ?auto_142555 ?auto_142554 ) ) ( not ( = ?auto_142555 ?auto_142556 ) ) ( not ( = ?auto_142550 ?auto_142553 ) ) ( not ( = ?auto_142550 ?auto_142557 ) ) ( not ( = ?auto_142550 ?auto_142554 ) ) ( not ( = ?auto_142550 ?auto_142556 ) ) ( ON ?auto_142551 ?auto_142550 ) ( ON ?auto_142553 ?auto_142551 ) ( ON ?auto_142556 ?auto_142553 ) ( ON ?auto_142557 ?auto_142552 ) ( CLEAR ?auto_142557 ) ( not ( = ?auto_142549 ?auto_142552 ) ) ( not ( = ?auto_142555 ?auto_142552 ) ) ( not ( = ?auto_142550 ?auto_142552 ) ) ( not ( = ?auto_142551 ?auto_142552 ) ) ( not ( = ?auto_142557 ?auto_142552 ) ) ( not ( = ?auto_142554 ?auto_142552 ) ) ( not ( = ?auto_142556 ?auto_142552 ) ) ( not ( = ?auto_142553 ?auto_142552 ) ) ( HOLDING ?auto_142554 ) ( CLEAR ?auto_142556 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142549 ?auto_142555 ?auto_142550 ?auto_142551 ?auto_142553 ?auto_142556 ?auto_142554 )
      ( MAKE-1PILE ?auto_142549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142558 - BLOCK
    )
    :vars
    (
      ?auto_142565 - BLOCK
      ?auto_142562 - BLOCK
      ?auto_142564 - BLOCK
      ?auto_142563 - BLOCK
      ?auto_142561 - BLOCK
      ?auto_142560 - BLOCK
      ?auto_142566 - BLOCK
      ?auto_142559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142565 ?auto_142558 ) ( ON-TABLE ?auto_142558 ) ( not ( = ?auto_142558 ?auto_142565 ) ) ( not ( = ?auto_142558 ?auto_142562 ) ) ( not ( = ?auto_142558 ?auto_142564 ) ) ( not ( = ?auto_142565 ?auto_142562 ) ) ( not ( = ?auto_142565 ?auto_142564 ) ) ( not ( = ?auto_142562 ?auto_142564 ) ) ( ON ?auto_142562 ?auto_142565 ) ( not ( = ?auto_142563 ?auto_142561 ) ) ( not ( = ?auto_142563 ?auto_142560 ) ) ( not ( = ?auto_142563 ?auto_142566 ) ) ( not ( = ?auto_142563 ?auto_142564 ) ) ( not ( = ?auto_142561 ?auto_142560 ) ) ( not ( = ?auto_142561 ?auto_142566 ) ) ( not ( = ?auto_142561 ?auto_142564 ) ) ( not ( = ?auto_142560 ?auto_142566 ) ) ( not ( = ?auto_142560 ?auto_142564 ) ) ( not ( = ?auto_142566 ?auto_142564 ) ) ( not ( = ?auto_142558 ?auto_142566 ) ) ( not ( = ?auto_142558 ?auto_142563 ) ) ( not ( = ?auto_142558 ?auto_142561 ) ) ( not ( = ?auto_142558 ?auto_142560 ) ) ( not ( = ?auto_142565 ?auto_142566 ) ) ( not ( = ?auto_142565 ?auto_142563 ) ) ( not ( = ?auto_142565 ?auto_142561 ) ) ( not ( = ?auto_142565 ?auto_142560 ) ) ( not ( = ?auto_142562 ?auto_142566 ) ) ( not ( = ?auto_142562 ?auto_142563 ) ) ( not ( = ?auto_142562 ?auto_142561 ) ) ( not ( = ?auto_142562 ?auto_142560 ) ) ( ON ?auto_142564 ?auto_142562 ) ( ON ?auto_142566 ?auto_142564 ) ( ON ?auto_142560 ?auto_142566 ) ( ON ?auto_142563 ?auto_142559 ) ( not ( = ?auto_142558 ?auto_142559 ) ) ( not ( = ?auto_142565 ?auto_142559 ) ) ( not ( = ?auto_142562 ?auto_142559 ) ) ( not ( = ?auto_142564 ?auto_142559 ) ) ( not ( = ?auto_142563 ?auto_142559 ) ) ( not ( = ?auto_142561 ?auto_142559 ) ) ( not ( = ?auto_142560 ?auto_142559 ) ) ( not ( = ?auto_142566 ?auto_142559 ) ) ( CLEAR ?auto_142560 ) ( ON ?auto_142561 ?auto_142563 ) ( CLEAR ?auto_142561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142559 ?auto_142563 )
      ( MAKE-1PILE ?auto_142558 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142567 - BLOCK
    )
    :vars
    (
      ?auto_142569 - BLOCK
      ?auto_142568 - BLOCK
      ?auto_142575 - BLOCK
      ?auto_142571 - BLOCK
      ?auto_142570 - BLOCK
      ?auto_142573 - BLOCK
      ?auto_142574 - BLOCK
      ?auto_142572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142569 ?auto_142567 ) ( ON-TABLE ?auto_142567 ) ( not ( = ?auto_142567 ?auto_142569 ) ) ( not ( = ?auto_142567 ?auto_142568 ) ) ( not ( = ?auto_142567 ?auto_142575 ) ) ( not ( = ?auto_142569 ?auto_142568 ) ) ( not ( = ?auto_142569 ?auto_142575 ) ) ( not ( = ?auto_142568 ?auto_142575 ) ) ( ON ?auto_142568 ?auto_142569 ) ( not ( = ?auto_142571 ?auto_142570 ) ) ( not ( = ?auto_142571 ?auto_142573 ) ) ( not ( = ?auto_142571 ?auto_142574 ) ) ( not ( = ?auto_142571 ?auto_142575 ) ) ( not ( = ?auto_142570 ?auto_142573 ) ) ( not ( = ?auto_142570 ?auto_142574 ) ) ( not ( = ?auto_142570 ?auto_142575 ) ) ( not ( = ?auto_142573 ?auto_142574 ) ) ( not ( = ?auto_142573 ?auto_142575 ) ) ( not ( = ?auto_142574 ?auto_142575 ) ) ( not ( = ?auto_142567 ?auto_142574 ) ) ( not ( = ?auto_142567 ?auto_142571 ) ) ( not ( = ?auto_142567 ?auto_142570 ) ) ( not ( = ?auto_142567 ?auto_142573 ) ) ( not ( = ?auto_142569 ?auto_142574 ) ) ( not ( = ?auto_142569 ?auto_142571 ) ) ( not ( = ?auto_142569 ?auto_142570 ) ) ( not ( = ?auto_142569 ?auto_142573 ) ) ( not ( = ?auto_142568 ?auto_142574 ) ) ( not ( = ?auto_142568 ?auto_142571 ) ) ( not ( = ?auto_142568 ?auto_142570 ) ) ( not ( = ?auto_142568 ?auto_142573 ) ) ( ON ?auto_142575 ?auto_142568 ) ( ON ?auto_142574 ?auto_142575 ) ( ON ?auto_142571 ?auto_142572 ) ( not ( = ?auto_142567 ?auto_142572 ) ) ( not ( = ?auto_142569 ?auto_142572 ) ) ( not ( = ?auto_142568 ?auto_142572 ) ) ( not ( = ?auto_142575 ?auto_142572 ) ) ( not ( = ?auto_142571 ?auto_142572 ) ) ( not ( = ?auto_142570 ?auto_142572 ) ) ( not ( = ?auto_142573 ?auto_142572 ) ) ( not ( = ?auto_142574 ?auto_142572 ) ) ( ON ?auto_142570 ?auto_142571 ) ( CLEAR ?auto_142570 ) ( ON-TABLE ?auto_142572 ) ( HOLDING ?auto_142573 ) ( CLEAR ?auto_142574 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142567 ?auto_142569 ?auto_142568 ?auto_142575 ?auto_142574 ?auto_142573 )
      ( MAKE-1PILE ?auto_142567 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_142576 - BLOCK
    )
    :vars
    (
      ?auto_142583 - BLOCK
      ?auto_142584 - BLOCK
      ?auto_142582 - BLOCK
      ?auto_142578 - BLOCK
      ?auto_142577 - BLOCK
      ?auto_142579 - BLOCK
      ?auto_142580 - BLOCK
      ?auto_142581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_142583 ?auto_142576 ) ( ON-TABLE ?auto_142576 ) ( not ( = ?auto_142576 ?auto_142583 ) ) ( not ( = ?auto_142576 ?auto_142584 ) ) ( not ( = ?auto_142576 ?auto_142582 ) ) ( not ( = ?auto_142583 ?auto_142584 ) ) ( not ( = ?auto_142583 ?auto_142582 ) ) ( not ( = ?auto_142584 ?auto_142582 ) ) ( ON ?auto_142584 ?auto_142583 ) ( not ( = ?auto_142578 ?auto_142577 ) ) ( not ( = ?auto_142578 ?auto_142579 ) ) ( not ( = ?auto_142578 ?auto_142580 ) ) ( not ( = ?auto_142578 ?auto_142582 ) ) ( not ( = ?auto_142577 ?auto_142579 ) ) ( not ( = ?auto_142577 ?auto_142580 ) ) ( not ( = ?auto_142577 ?auto_142582 ) ) ( not ( = ?auto_142579 ?auto_142580 ) ) ( not ( = ?auto_142579 ?auto_142582 ) ) ( not ( = ?auto_142580 ?auto_142582 ) ) ( not ( = ?auto_142576 ?auto_142580 ) ) ( not ( = ?auto_142576 ?auto_142578 ) ) ( not ( = ?auto_142576 ?auto_142577 ) ) ( not ( = ?auto_142576 ?auto_142579 ) ) ( not ( = ?auto_142583 ?auto_142580 ) ) ( not ( = ?auto_142583 ?auto_142578 ) ) ( not ( = ?auto_142583 ?auto_142577 ) ) ( not ( = ?auto_142583 ?auto_142579 ) ) ( not ( = ?auto_142584 ?auto_142580 ) ) ( not ( = ?auto_142584 ?auto_142578 ) ) ( not ( = ?auto_142584 ?auto_142577 ) ) ( not ( = ?auto_142584 ?auto_142579 ) ) ( ON ?auto_142582 ?auto_142584 ) ( ON ?auto_142580 ?auto_142582 ) ( ON ?auto_142578 ?auto_142581 ) ( not ( = ?auto_142576 ?auto_142581 ) ) ( not ( = ?auto_142583 ?auto_142581 ) ) ( not ( = ?auto_142584 ?auto_142581 ) ) ( not ( = ?auto_142582 ?auto_142581 ) ) ( not ( = ?auto_142578 ?auto_142581 ) ) ( not ( = ?auto_142577 ?auto_142581 ) ) ( not ( = ?auto_142579 ?auto_142581 ) ) ( not ( = ?auto_142580 ?auto_142581 ) ) ( ON ?auto_142577 ?auto_142578 ) ( ON-TABLE ?auto_142581 ) ( CLEAR ?auto_142580 ) ( ON ?auto_142579 ?auto_142577 ) ( CLEAR ?auto_142579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142581 ?auto_142578 ?auto_142577 )
      ( MAKE-1PILE ?auto_142576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142628 - BLOCK
      ?auto_142629 - BLOCK
      ?auto_142630 - BLOCK
      ?auto_142631 - BLOCK
      ?auto_142632 - BLOCK
      ?auto_142633 - BLOCK
      ?auto_142634 - BLOCK
    )
    :vars
    (
      ?auto_142635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142628 ) ( ON ?auto_142629 ?auto_142628 ) ( ON ?auto_142630 ?auto_142629 ) ( ON ?auto_142631 ?auto_142630 ) ( ON ?auto_142632 ?auto_142631 ) ( not ( = ?auto_142628 ?auto_142629 ) ) ( not ( = ?auto_142628 ?auto_142630 ) ) ( not ( = ?auto_142628 ?auto_142631 ) ) ( not ( = ?auto_142628 ?auto_142632 ) ) ( not ( = ?auto_142628 ?auto_142633 ) ) ( not ( = ?auto_142628 ?auto_142634 ) ) ( not ( = ?auto_142629 ?auto_142630 ) ) ( not ( = ?auto_142629 ?auto_142631 ) ) ( not ( = ?auto_142629 ?auto_142632 ) ) ( not ( = ?auto_142629 ?auto_142633 ) ) ( not ( = ?auto_142629 ?auto_142634 ) ) ( not ( = ?auto_142630 ?auto_142631 ) ) ( not ( = ?auto_142630 ?auto_142632 ) ) ( not ( = ?auto_142630 ?auto_142633 ) ) ( not ( = ?auto_142630 ?auto_142634 ) ) ( not ( = ?auto_142631 ?auto_142632 ) ) ( not ( = ?auto_142631 ?auto_142633 ) ) ( not ( = ?auto_142631 ?auto_142634 ) ) ( not ( = ?auto_142632 ?auto_142633 ) ) ( not ( = ?auto_142632 ?auto_142634 ) ) ( not ( = ?auto_142633 ?auto_142634 ) ) ( ON ?auto_142634 ?auto_142635 ) ( not ( = ?auto_142628 ?auto_142635 ) ) ( not ( = ?auto_142629 ?auto_142635 ) ) ( not ( = ?auto_142630 ?auto_142635 ) ) ( not ( = ?auto_142631 ?auto_142635 ) ) ( not ( = ?auto_142632 ?auto_142635 ) ) ( not ( = ?auto_142633 ?auto_142635 ) ) ( not ( = ?auto_142634 ?auto_142635 ) ) ( CLEAR ?auto_142632 ) ( ON ?auto_142633 ?auto_142634 ) ( CLEAR ?auto_142633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142635 ?auto_142634 )
      ( MAKE-7PILE ?auto_142628 ?auto_142629 ?auto_142630 ?auto_142631 ?auto_142632 ?auto_142633 ?auto_142634 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142636 - BLOCK
      ?auto_142637 - BLOCK
      ?auto_142638 - BLOCK
      ?auto_142639 - BLOCK
      ?auto_142640 - BLOCK
      ?auto_142641 - BLOCK
      ?auto_142642 - BLOCK
    )
    :vars
    (
      ?auto_142643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142636 ) ( ON ?auto_142637 ?auto_142636 ) ( ON ?auto_142638 ?auto_142637 ) ( ON ?auto_142639 ?auto_142638 ) ( not ( = ?auto_142636 ?auto_142637 ) ) ( not ( = ?auto_142636 ?auto_142638 ) ) ( not ( = ?auto_142636 ?auto_142639 ) ) ( not ( = ?auto_142636 ?auto_142640 ) ) ( not ( = ?auto_142636 ?auto_142641 ) ) ( not ( = ?auto_142636 ?auto_142642 ) ) ( not ( = ?auto_142637 ?auto_142638 ) ) ( not ( = ?auto_142637 ?auto_142639 ) ) ( not ( = ?auto_142637 ?auto_142640 ) ) ( not ( = ?auto_142637 ?auto_142641 ) ) ( not ( = ?auto_142637 ?auto_142642 ) ) ( not ( = ?auto_142638 ?auto_142639 ) ) ( not ( = ?auto_142638 ?auto_142640 ) ) ( not ( = ?auto_142638 ?auto_142641 ) ) ( not ( = ?auto_142638 ?auto_142642 ) ) ( not ( = ?auto_142639 ?auto_142640 ) ) ( not ( = ?auto_142639 ?auto_142641 ) ) ( not ( = ?auto_142639 ?auto_142642 ) ) ( not ( = ?auto_142640 ?auto_142641 ) ) ( not ( = ?auto_142640 ?auto_142642 ) ) ( not ( = ?auto_142641 ?auto_142642 ) ) ( ON ?auto_142642 ?auto_142643 ) ( not ( = ?auto_142636 ?auto_142643 ) ) ( not ( = ?auto_142637 ?auto_142643 ) ) ( not ( = ?auto_142638 ?auto_142643 ) ) ( not ( = ?auto_142639 ?auto_142643 ) ) ( not ( = ?auto_142640 ?auto_142643 ) ) ( not ( = ?auto_142641 ?auto_142643 ) ) ( not ( = ?auto_142642 ?auto_142643 ) ) ( ON ?auto_142641 ?auto_142642 ) ( CLEAR ?auto_142641 ) ( ON-TABLE ?auto_142643 ) ( HOLDING ?auto_142640 ) ( CLEAR ?auto_142639 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142636 ?auto_142637 ?auto_142638 ?auto_142639 ?auto_142640 )
      ( MAKE-7PILE ?auto_142636 ?auto_142637 ?auto_142638 ?auto_142639 ?auto_142640 ?auto_142641 ?auto_142642 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142644 - BLOCK
      ?auto_142645 - BLOCK
      ?auto_142646 - BLOCK
      ?auto_142647 - BLOCK
      ?auto_142648 - BLOCK
      ?auto_142649 - BLOCK
      ?auto_142650 - BLOCK
    )
    :vars
    (
      ?auto_142651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142644 ) ( ON ?auto_142645 ?auto_142644 ) ( ON ?auto_142646 ?auto_142645 ) ( ON ?auto_142647 ?auto_142646 ) ( not ( = ?auto_142644 ?auto_142645 ) ) ( not ( = ?auto_142644 ?auto_142646 ) ) ( not ( = ?auto_142644 ?auto_142647 ) ) ( not ( = ?auto_142644 ?auto_142648 ) ) ( not ( = ?auto_142644 ?auto_142649 ) ) ( not ( = ?auto_142644 ?auto_142650 ) ) ( not ( = ?auto_142645 ?auto_142646 ) ) ( not ( = ?auto_142645 ?auto_142647 ) ) ( not ( = ?auto_142645 ?auto_142648 ) ) ( not ( = ?auto_142645 ?auto_142649 ) ) ( not ( = ?auto_142645 ?auto_142650 ) ) ( not ( = ?auto_142646 ?auto_142647 ) ) ( not ( = ?auto_142646 ?auto_142648 ) ) ( not ( = ?auto_142646 ?auto_142649 ) ) ( not ( = ?auto_142646 ?auto_142650 ) ) ( not ( = ?auto_142647 ?auto_142648 ) ) ( not ( = ?auto_142647 ?auto_142649 ) ) ( not ( = ?auto_142647 ?auto_142650 ) ) ( not ( = ?auto_142648 ?auto_142649 ) ) ( not ( = ?auto_142648 ?auto_142650 ) ) ( not ( = ?auto_142649 ?auto_142650 ) ) ( ON ?auto_142650 ?auto_142651 ) ( not ( = ?auto_142644 ?auto_142651 ) ) ( not ( = ?auto_142645 ?auto_142651 ) ) ( not ( = ?auto_142646 ?auto_142651 ) ) ( not ( = ?auto_142647 ?auto_142651 ) ) ( not ( = ?auto_142648 ?auto_142651 ) ) ( not ( = ?auto_142649 ?auto_142651 ) ) ( not ( = ?auto_142650 ?auto_142651 ) ) ( ON ?auto_142649 ?auto_142650 ) ( ON-TABLE ?auto_142651 ) ( CLEAR ?auto_142647 ) ( ON ?auto_142648 ?auto_142649 ) ( CLEAR ?auto_142648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142651 ?auto_142650 ?auto_142649 )
      ( MAKE-7PILE ?auto_142644 ?auto_142645 ?auto_142646 ?auto_142647 ?auto_142648 ?auto_142649 ?auto_142650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142652 - BLOCK
      ?auto_142653 - BLOCK
      ?auto_142654 - BLOCK
      ?auto_142655 - BLOCK
      ?auto_142656 - BLOCK
      ?auto_142657 - BLOCK
      ?auto_142658 - BLOCK
    )
    :vars
    (
      ?auto_142659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142652 ) ( ON ?auto_142653 ?auto_142652 ) ( ON ?auto_142654 ?auto_142653 ) ( not ( = ?auto_142652 ?auto_142653 ) ) ( not ( = ?auto_142652 ?auto_142654 ) ) ( not ( = ?auto_142652 ?auto_142655 ) ) ( not ( = ?auto_142652 ?auto_142656 ) ) ( not ( = ?auto_142652 ?auto_142657 ) ) ( not ( = ?auto_142652 ?auto_142658 ) ) ( not ( = ?auto_142653 ?auto_142654 ) ) ( not ( = ?auto_142653 ?auto_142655 ) ) ( not ( = ?auto_142653 ?auto_142656 ) ) ( not ( = ?auto_142653 ?auto_142657 ) ) ( not ( = ?auto_142653 ?auto_142658 ) ) ( not ( = ?auto_142654 ?auto_142655 ) ) ( not ( = ?auto_142654 ?auto_142656 ) ) ( not ( = ?auto_142654 ?auto_142657 ) ) ( not ( = ?auto_142654 ?auto_142658 ) ) ( not ( = ?auto_142655 ?auto_142656 ) ) ( not ( = ?auto_142655 ?auto_142657 ) ) ( not ( = ?auto_142655 ?auto_142658 ) ) ( not ( = ?auto_142656 ?auto_142657 ) ) ( not ( = ?auto_142656 ?auto_142658 ) ) ( not ( = ?auto_142657 ?auto_142658 ) ) ( ON ?auto_142658 ?auto_142659 ) ( not ( = ?auto_142652 ?auto_142659 ) ) ( not ( = ?auto_142653 ?auto_142659 ) ) ( not ( = ?auto_142654 ?auto_142659 ) ) ( not ( = ?auto_142655 ?auto_142659 ) ) ( not ( = ?auto_142656 ?auto_142659 ) ) ( not ( = ?auto_142657 ?auto_142659 ) ) ( not ( = ?auto_142658 ?auto_142659 ) ) ( ON ?auto_142657 ?auto_142658 ) ( ON-TABLE ?auto_142659 ) ( ON ?auto_142656 ?auto_142657 ) ( CLEAR ?auto_142656 ) ( HOLDING ?auto_142655 ) ( CLEAR ?auto_142654 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142652 ?auto_142653 ?auto_142654 ?auto_142655 )
      ( MAKE-7PILE ?auto_142652 ?auto_142653 ?auto_142654 ?auto_142655 ?auto_142656 ?auto_142657 ?auto_142658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142660 - BLOCK
      ?auto_142661 - BLOCK
      ?auto_142662 - BLOCK
      ?auto_142663 - BLOCK
      ?auto_142664 - BLOCK
      ?auto_142665 - BLOCK
      ?auto_142666 - BLOCK
    )
    :vars
    (
      ?auto_142667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142660 ) ( ON ?auto_142661 ?auto_142660 ) ( ON ?auto_142662 ?auto_142661 ) ( not ( = ?auto_142660 ?auto_142661 ) ) ( not ( = ?auto_142660 ?auto_142662 ) ) ( not ( = ?auto_142660 ?auto_142663 ) ) ( not ( = ?auto_142660 ?auto_142664 ) ) ( not ( = ?auto_142660 ?auto_142665 ) ) ( not ( = ?auto_142660 ?auto_142666 ) ) ( not ( = ?auto_142661 ?auto_142662 ) ) ( not ( = ?auto_142661 ?auto_142663 ) ) ( not ( = ?auto_142661 ?auto_142664 ) ) ( not ( = ?auto_142661 ?auto_142665 ) ) ( not ( = ?auto_142661 ?auto_142666 ) ) ( not ( = ?auto_142662 ?auto_142663 ) ) ( not ( = ?auto_142662 ?auto_142664 ) ) ( not ( = ?auto_142662 ?auto_142665 ) ) ( not ( = ?auto_142662 ?auto_142666 ) ) ( not ( = ?auto_142663 ?auto_142664 ) ) ( not ( = ?auto_142663 ?auto_142665 ) ) ( not ( = ?auto_142663 ?auto_142666 ) ) ( not ( = ?auto_142664 ?auto_142665 ) ) ( not ( = ?auto_142664 ?auto_142666 ) ) ( not ( = ?auto_142665 ?auto_142666 ) ) ( ON ?auto_142666 ?auto_142667 ) ( not ( = ?auto_142660 ?auto_142667 ) ) ( not ( = ?auto_142661 ?auto_142667 ) ) ( not ( = ?auto_142662 ?auto_142667 ) ) ( not ( = ?auto_142663 ?auto_142667 ) ) ( not ( = ?auto_142664 ?auto_142667 ) ) ( not ( = ?auto_142665 ?auto_142667 ) ) ( not ( = ?auto_142666 ?auto_142667 ) ) ( ON ?auto_142665 ?auto_142666 ) ( ON-TABLE ?auto_142667 ) ( ON ?auto_142664 ?auto_142665 ) ( CLEAR ?auto_142662 ) ( ON ?auto_142663 ?auto_142664 ) ( CLEAR ?auto_142663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142667 ?auto_142666 ?auto_142665 ?auto_142664 )
      ( MAKE-7PILE ?auto_142660 ?auto_142661 ?auto_142662 ?auto_142663 ?auto_142664 ?auto_142665 ?auto_142666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142668 - BLOCK
      ?auto_142669 - BLOCK
      ?auto_142670 - BLOCK
      ?auto_142671 - BLOCK
      ?auto_142672 - BLOCK
      ?auto_142673 - BLOCK
      ?auto_142674 - BLOCK
    )
    :vars
    (
      ?auto_142675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142668 ) ( ON ?auto_142669 ?auto_142668 ) ( not ( = ?auto_142668 ?auto_142669 ) ) ( not ( = ?auto_142668 ?auto_142670 ) ) ( not ( = ?auto_142668 ?auto_142671 ) ) ( not ( = ?auto_142668 ?auto_142672 ) ) ( not ( = ?auto_142668 ?auto_142673 ) ) ( not ( = ?auto_142668 ?auto_142674 ) ) ( not ( = ?auto_142669 ?auto_142670 ) ) ( not ( = ?auto_142669 ?auto_142671 ) ) ( not ( = ?auto_142669 ?auto_142672 ) ) ( not ( = ?auto_142669 ?auto_142673 ) ) ( not ( = ?auto_142669 ?auto_142674 ) ) ( not ( = ?auto_142670 ?auto_142671 ) ) ( not ( = ?auto_142670 ?auto_142672 ) ) ( not ( = ?auto_142670 ?auto_142673 ) ) ( not ( = ?auto_142670 ?auto_142674 ) ) ( not ( = ?auto_142671 ?auto_142672 ) ) ( not ( = ?auto_142671 ?auto_142673 ) ) ( not ( = ?auto_142671 ?auto_142674 ) ) ( not ( = ?auto_142672 ?auto_142673 ) ) ( not ( = ?auto_142672 ?auto_142674 ) ) ( not ( = ?auto_142673 ?auto_142674 ) ) ( ON ?auto_142674 ?auto_142675 ) ( not ( = ?auto_142668 ?auto_142675 ) ) ( not ( = ?auto_142669 ?auto_142675 ) ) ( not ( = ?auto_142670 ?auto_142675 ) ) ( not ( = ?auto_142671 ?auto_142675 ) ) ( not ( = ?auto_142672 ?auto_142675 ) ) ( not ( = ?auto_142673 ?auto_142675 ) ) ( not ( = ?auto_142674 ?auto_142675 ) ) ( ON ?auto_142673 ?auto_142674 ) ( ON-TABLE ?auto_142675 ) ( ON ?auto_142672 ?auto_142673 ) ( ON ?auto_142671 ?auto_142672 ) ( CLEAR ?auto_142671 ) ( HOLDING ?auto_142670 ) ( CLEAR ?auto_142669 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142668 ?auto_142669 ?auto_142670 )
      ( MAKE-7PILE ?auto_142668 ?auto_142669 ?auto_142670 ?auto_142671 ?auto_142672 ?auto_142673 ?auto_142674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142676 - BLOCK
      ?auto_142677 - BLOCK
      ?auto_142678 - BLOCK
      ?auto_142679 - BLOCK
      ?auto_142680 - BLOCK
      ?auto_142681 - BLOCK
      ?auto_142682 - BLOCK
    )
    :vars
    (
      ?auto_142683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142676 ) ( ON ?auto_142677 ?auto_142676 ) ( not ( = ?auto_142676 ?auto_142677 ) ) ( not ( = ?auto_142676 ?auto_142678 ) ) ( not ( = ?auto_142676 ?auto_142679 ) ) ( not ( = ?auto_142676 ?auto_142680 ) ) ( not ( = ?auto_142676 ?auto_142681 ) ) ( not ( = ?auto_142676 ?auto_142682 ) ) ( not ( = ?auto_142677 ?auto_142678 ) ) ( not ( = ?auto_142677 ?auto_142679 ) ) ( not ( = ?auto_142677 ?auto_142680 ) ) ( not ( = ?auto_142677 ?auto_142681 ) ) ( not ( = ?auto_142677 ?auto_142682 ) ) ( not ( = ?auto_142678 ?auto_142679 ) ) ( not ( = ?auto_142678 ?auto_142680 ) ) ( not ( = ?auto_142678 ?auto_142681 ) ) ( not ( = ?auto_142678 ?auto_142682 ) ) ( not ( = ?auto_142679 ?auto_142680 ) ) ( not ( = ?auto_142679 ?auto_142681 ) ) ( not ( = ?auto_142679 ?auto_142682 ) ) ( not ( = ?auto_142680 ?auto_142681 ) ) ( not ( = ?auto_142680 ?auto_142682 ) ) ( not ( = ?auto_142681 ?auto_142682 ) ) ( ON ?auto_142682 ?auto_142683 ) ( not ( = ?auto_142676 ?auto_142683 ) ) ( not ( = ?auto_142677 ?auto_142683 ) ) ( not ( = ?auto_142678 ?auto_142683 ) ) ( not ( = ?auto_142679 ?auto_142683 ) ) ( not ( = ?auto_142680 ?auto_142683 ) ) ( not ( = ?auto_142681 ?auto_142683 ) ) ( not ( = ?auto_142682 ?auto_142683 ) ) ( ON ?auto_142681 ?auto_142682 ) ( ON-TABLE ?auto_142683 ) ( ON ?auto_142680 ?auto_142681 ) ( ON ?auto_142679 ?auto_142680 ) ( CLEAR ?auto_142677 ) ( ON ?auto_142678 ?auto_142679 ) ( CLEAR ?auto_142678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142683 ?auto_142682 ?auto_142681 ?auto_142680 ?auto_142679 )
      ( MAKE-7PILE ?auto_142676 ?auto_142677 ?auto_142678 ?auto_142679 ?auto_142680 ?auto_142681 ?auto_142682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142684 - BLOCK
      ?auto_142685 - BLOCK
      ?auto_142686 - BLOCK
      ?auto_142687 - BLOCK
      ?auto_142688 - BLOCK
      ?auto_142689 - BLOCK
      ?auto_142690 - BLOCK
    )
    :vars
    (
      ?auto_142691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142684 ) ( not ( = ?auto_142684 ?auto_142685 ) ) ( not ( = ?auto_142684 ?auto_142686 ) ) ( not ( = ?auto_142684 ?auto_142687 ) ) ( not ( = ?auto_142684 ?auto_142688 ) ) ( not ( = ?auto_142684 ?auto_142689 ) ) ( not ( = ?auto_142684 ?auto_142690 ) ) ( not ( = ?auto_142685 ?auto_142686 ) ) ( not ( = ?auto_142685 ?auto_142687 ) ) ( not ( = ?auto_142685 ?auto_142688 ) ) ( not ( = ?auto_142685 ?auto_142689 ) ) ( not ( = ?auto_142685 ?auto_142690 ) ) ( not ( = ?auto_142686 ?auto_142687 ) ) ( not ( = ?auto_142686 ?auto_142688 ) ) ( not ( = ?auto_142686 ?auto_142689 ) ) ( not ( = ?auto_142686 ?auto_142690 ) ) ( not ( = ?auto_142687 ?auto_142688 ) ) ( not ( = ?auto_142687 ?auto_142689 ) ) ( not ( = ?auto_142687 ?auto_142690 ) ) ( not ( = ?auto_142688 ?auto_142689 ) ) ( not ( = ?auto_142688 ?auto_142690 ) ) ( not ( = ?auto_142689 ?auto_142690 ) ) ( ON ?auto_142690 ?auto_142691 ) ( not ( = ?auto_142684 ?auto_142691 ) ) ( not ( = ?auto_142685 ?auto_142691 ) ) ( not ( = ?auto_142686 ?auto_142691 ) ) ( not ( = ?auto_142687 ?auto_142691 ) ) ( not ( = ?auto_142688 ?auto_142691 ) ) ( not ( = ?auto_142689 ?auto_142691 ) ) ( not ( = ?auto_142690 ?auto_142691 ) ) ( ON ?auto_142689 ?auto_142690 ) ( ON-TABLE ?auto_142691 ) ( ON ?auto_142688 ?auto_142689 ) ( ON ?auto_142687 ?auto_142688 ) ( ON ?auto_142686 ?auto_142687 ) ( CLEAR ?auto_142686 ) ( HOLDING ?auto_142685 ) ( CLEAR ?auto_142684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142684 ?auto_142685 )
      ( MAKE-7PILE ?auto_142684 ?auto_142685 ?auto_142686 ?auto_142687 ?auto_142688 ?auto_142689 ?auto_142690 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142692 - BLOCK
      ?auto_142693 - BLOCK
      ?auto_142694 - BLOCK
      ?auto_142695 - BLOCK
      ?auto_142696 - BLOCK
      ?auto_142697 - BLOCK
      ?auto_142698 - BLOCK
    )
    :vars
    (
      ?auto_142699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142692 ) ( not ( = ?auto_142692 ?auto_142693 ) ) ( not ( = ?auto_142692 ?auto_142694 ) ) ( not ( = ?auto_142692 ?auto_142695 ) ) ( not ( = ?auto_142692 ?auto_142696 ) ) ( not ( = ?auto_142692 ?auto_142697 ) ) ( not ( = ?auto_142692 ?auto_142698 ) ) ( not ( = ?auto_142693 ?auto_142694 ) ) ( not ( = ?auto_142693 ?auto_142695 ) ) ( not ( = ?auto_142693 ?auto_142696 ) ) ( not ( = ?auto_142693 ?auto_142697 ) ) ( not ( = ?auto_142693 ?auto_142698 ) ) ( not ( = ?auto_142694 ?auto_142695 ) ) ( not ( = ?auto_142694 ?auto_142696 ) ) ( not ( = ?auto_142694 ?auto_142697 ) ) ( not ( = ?auto_142694 ?auto_142698 ) ) ( not ( = ?auto_142695 ?auto_142696 ) ) ( not ( = ?auto_142695 ?auto_142697 ) ) ( not ( = ?auto_142695 ?auto_142698 ) ) ( not ( = ?auto_142696 ?auto_142697 ) ) ( not ( = ?auto_142696 ?auto_142698 ) ) ( not ( = ?auto_142697 ?auto_142698 ) ) ( ON ?auto_142698 ?auto_142699 ) ( not ( = ?auto_142692 ?auto_142699 ) ) ( not ( = ?auto_142693 ?auto_142699 ) ) ( not ( = ?auto_142694 ?auto_142699 ) ) ( not ( = ?auto_142695 ?auto_142699 ) ) ( not ( = ?auto_142696 ?auto_142699 ) ) ( not ( = ?auto_142697 ?auto_142699 ) ) ( not ( = ?auto_142698 ?auto_142699 ) ) ( ON ?auto_142697 ?auto_142698 ) ( ON-TABLE ?auto_142699 ) ( ON ?auto_142696 ?auto_142697 ) ( ON ?auto_142695 ?auto_142696 ) ( ON ?auto_142694 ?auto_142695 ) ( CLEAR ?auto_142692 ) ( ON ?auto_142693 ?auto_142694 ) ( CLEAR ?auto_142693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142699 ?auto_142698 ?auto_142697 ?auto_142696 ?auto_142695 ?auto_142694 )
      ( MAKE-7PILE ?auto_142692 ?auto_142693 ?auto_142694 ?auto_142695 ?auto_142696 ?auto_142697 ?auto_142698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142700 - BLOCK
      ?auto_142701 - BLOCK
      ?auto_142702 - BLOCK
      ?auto_142703 - BLOCK
      ?auto_142704 - BLOCK
      ?auto_142705 - BLOCK
      ?auto_142706 - BLOCK
    )
    :vars
    (
      ?auto_142707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142700 ?auto_142701 ) ) ( not ( = ?auto_142700 ?auto_142702 ) ) ( not ( = ?auto_142700 ?auto_142703 ) ) ( not ( = ?auto_142700 ?auto_142704 ) ) ( not ( = ?auto_142700 ?auto_142705 ) ) ( not ( = ?auto_142700 ?auto_142706 ) ) ( not ( = ?auto_142701 ?auto_142702 ) ) ( not ( = ?auto_142701 ?auto_142703 ) ) ( not ( = ?auto_142701 ?auto_142704 ) ) ( not ( = ?auto_142701 ?auto_142705 ) ) ( not ( = ?auto_142701 ?auto_142706 ) ) ( not ( = ?auto_142702 ?auto_142703 ) ) ( not ( = ?auto_142702 ?auto_142704 ) ) ( not ( = ?auto_142702 ?auto_142705 ) ) ( not ( = ?auto_142702 ?auto_142706 ) ) ( not ( = ?auto_142703 ?auto_142704 ) ) ( not ( = ?auto_142703 ?auto_142705 ) ) ( not ( = ?auto_142703 ?auto_142706 ) ) ( not ( = ?auto_142704 ?auto_142705 ) ) ( not ( = ?auto_142704 ?auto_142706 ) ) ( not ( = ?auto_142705 ?auto_142706 ) ) ( ON ?auto_142706 ?auto_142707 ) ( not ( = ?auto_142700 ?auto_142707 ) ) ( not ( = ?auto_142701 ?auto_142707 ) ) ( not ( = ?auto_142702 ?auto_142707 ) ) ( not ( = ?auto_142703 ?auto_142707 ) ) ( not ( = ?auto_142704 ?auto_142707 ) ) ( not ( = ?auto_142705 ?auto_142707 ) ) ( not ( = ?auto_142706 ?auto_142707 ) ) ( ON ?auto_142705 ?auto_142706 ) ( ON-TABLE ?auto_142707 ) ( ON ?auto_142704 ?auto_142705 ) ( ON ?auto_142703 ?auto_142704 ) ( ON ?auto_142702 ?auto_142703 ) ( ON ?auto_142701 ?auto_142702 ) ( CLEAR ?auto_142701 ) ( HOLDING ?auto_142700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142700 )
      ( MAKE-7PILE ?auto_142700 ?auto_142701 ?auto_142702 ?auto_142703 ?auto_142704 ?auto_142705 ?auto_142706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142708 - BLOCK
      ?auto_142709 - BLOCK
      ?auto_142710 - BLOCK
      ?auto_142711 - BLOCK
      ?auto_142712 - BLOCK
      ?auto_142713 - BLOCK
      ?auto_142714 - BLOCK
    )
    :vars
    (
      ?auto_142715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142708 ?auto_142709 ) ) ( not ( = ?auto_142708 ?auto_142710 ) ) ( not ( = ?auto_142708 ?auto_142711 ) ) ( not ( = ?auto_142708 ?auto_142712 ) ) ( not ( = ?auto_142708 ?auto_142713 ) ) ( not ( = ?auto_142708 ?auto_142714 ) ) ( not ( = ?auto_142709 ?auto_142710 ) ) ( not ( = ?auto_142709 ?auto_142711 ) ) ( not ( = ?auto_142709 ?auto_142712 ) ) ( not ( = ?auto_142709 ?auto_142713 ) ) ( not ( = ?auto_142709 ?auto_142714 ) ) ( not ( = ?auto_142710 ?auto_142711 ) ) ( not ( = ?auto_142710 ?auto_142712 ) ) ( not ( = ?auto_142710 ?auto_142713 ) ) ( not ( = ?auto_142710 ?auto_142714 ) ) ( not ( = ?auto_142711 ?auto_142712 ) ) ( not ( = ?auto_142711 ?auto_142713 ) ) ( not ( = ?auto_142711 ?auto_142714 ) ) ( not ( = ?auto_142712 ?auto_142713 ) ) ( not ( = ?auto_142712 ?auto_142714 ) ) ( not ( = ?auto_142713 ?auto_142714 ) ) ( ON ?auto_142714 ?auto_142715 ) ( not ( = ?auto_142708 ?auto_142715 ) ) ( not ( = ?auto_142709 ?auto_142715 ) ) ( not ( = ?auto_142710 ?auto_142715 ) ) ( not ( = ?auto_142711 ?auto_142715 ) ) ( not ( = ?auto_142712 ?auto_142715 ) ) ( not ( = ?auto_142713 ?auto_142715 ) ) ( not ( = ?auto_142714 ?auto_142715 ) ) ( ON ?auto_142713 ?auto_142714 ) ( ON-TABLE ?auto_142715 ) ( ON ?auto_142712 ?auto_142713 ) ( ON ?auto_142711 ?auto_142712 ) ( ON ?auto_142710 ?auto_142711 ) ( ON ?auto_142709 ?auto_142710 ) ( ON ?auto_142708 ?auto_142709 ) ( CLEAR ?auto_142708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142715 ?auto_142714 ?auto_142713 ?auto_142712 ?auto_142711 ?auto_142710 ?auto_142709 )
      ( MAKE-7PILE ?auto_142708 ?auto_142709 ?auto_142710 ?auto_142711 ?auto_142712 ?auto_142713 ?auto_142714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142723 - BLOCK
      ?auto_142724 - BLOCK
      ?auto_142725 - BLOCK
      ?auto_142726 - BLOCK
      ?auto_142727 - BLOCK
      ?auto_142728 - BLOCK
      ?auto_142729 - BLOCK
    )
    :vars
    (
      ?auto_142730 - BLOCK
      ?auto_142731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142723 ?auto_142724 ) ) ( not ( = ?auto_142723 ?auto_142725 ) ) ( not ( = ?auto_142723 ?auto_142726 ) ) ( not ( = ?auto_142723 ?auto_142727 ) ) ( not ( = ?auto_142723 ?auto_142728 ) ) ( not ( = ?auto_142723 ?auto_142729 ) ) ( not ( = ?auto_142724 ?auto_142725 ) ) ( not ( = ?auto_142724 ?auto_142726 ) ) ( not ( = ?auto_142724 ?auto_142727 ) ) ( not ( = ?auto_142724 ?auto_142728 ) ) ( not ( = ?auto_142724 ?auto_142729 ) ) ( not ( = ?auto_142725 ?auto_142726 ) ) ( not ( = ?auto_142725 ?auto_142727 ) ) ( not ( = ?auto_142725 ?auto_142728 ) ) ( not ( = ?auto_142725 ?auto_142729 ) ) ( not ( = ?auto_142726 ?auto_142727 ) ) ( not ( = ?auto_142726 ?auto_142728 ) ) ( not ( = ?auto_142726 ?auto_142729 ) ) ( not ( = ?auto_142727 ?auto_142728 ) ) ( not ( = ?auto_142727 ?auto_142729 ) ) ( not ( = ?auto_142728 ?auto_142729 ) ) ( ON ?auto_142729 ?auto_142730 ) ( not ( = ?auto_142723 ?auto_142730 ) ) ( not ( = ?auto_142724 ?auto_142730 ) ) ( not ( = ?auto_142725 ?auto_142730 ) ) ( not ( = ?auto_142726 ?auto_142730 ) ) ( not ( = ?auto_142727 ?auto_142730 ) ) ( not ( = ?auto_142728 ?auto_142730 ) ) ( not ( = ?auto_142729 ?auto_142730 ) ) ( ON ?auto_142728 ?auto_142729 ) ( ON-TABLE ?auto_142730 ) ( ON ?auto_142727 ?auto_142728 ) ( ON ?auto_142726 ?auto_142727 ) ( ON ?auto_142725 ?auto_142726 ) ( ON ?auto_142724 ?auto_142725 ) ( CLEAR ?auto_142724 ) ( ON ?auto_142723 ?auto_142731 ) ( CLEAR ?auto_142723 ) ( HAND-EMPTY ) ( not ( = ?auto_142723 ?auto_142731 ) ) ( not ( = ?auto_142724 ?auto_142731 ) ) ( not ( = ?auto_142725 ?auto_142731 ) ) ( not ( = ?auto_142726 ?auto_142731 ) ) ( not ( = ?auto_142727 ?auto_142731 ) ) ( not ( = ?auto_142728 ?auto_142731 ) ) ( not ( = ?auto_142729 ?auto_142731 ) ) ( not ( = ?auto_142730 ?auto_142731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_142723 ?auto_142731 )
      ( MAKE-7PILE ?auto_142723 ?auto_142724 ?auto_142725 ?auto_142726 ?auto_142727 ?auto_142728 ?auto_142729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142732 - BLOCK
      ?auto_142733 - BLOCK
      ?auto_142734 - BLOCK
      ?auto_142735 - BLOCK
      ?auto_142736 - BLOCK
      ?auto_142737 - BLOCK
      ?auto_142738 - BLOCK
    )
    :vars
    (
      ?auto_142739 - BLOCK
      ?auto_142740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142732 ?auto_142733 ) ) ( not ( = ?auto_142732 ?auto_142734 ) ) ( not ( = ?auto_142732 ?auto_142735 ) ) ( not ( = ?auto_142732 ?auto_142736 ) ) ( not ( = ?auto_142732 ?auto_142737 ) ) ( not ( = ?auto_142732 ?auto_142738 ) ) ( not ( = ?auto_142733 ?auto_142734 ) ) ( not ( = ?auto_142733 ?auto_142735 ) ) ( not ( = ?auto_142733 ?auto_142736 ) ) ( not ( = ?auto_142733 ?auto_142737 ) ) ( not ( = ?auto_142733 ?auto_142738 ) ) ( not ( = ?auto_142734 ?auto_142735 ) ) ( not ( = ?auto_142734 ?auto_142736 ) ) ( not ( = ?auto_142734 ?auto_142737 ) ) ( not ( = ?auto_142734 ?auto_142738 ) ) ( not ( = ?auto_142735 ?auto_142736 ) ) ( not ( = ?auto_142735 ?auto_142737 ) ) ( not ( = ?auto_142735 ?auto_142738 ) ) ( not ( = ?auto_142736 ?auto_142737 ) ) ( not ( = ?auto_142736 ?auto_142738 ) ) ( not ( = ?auto_142737 ?auto_142738 ) ) ( ON ?auto_142738 ?auto_142739 ) ( not ( = ?auto_142732 ?auto_142739 ) ) ( not ( = ?auto_142733 ?auto_142739 ) ) ( not ( = ?auto_142734 ?auto_142739 ) ) ( not ( = ?auto_142735 ?auto_142739 ) ) ( not ( = ?auto_142736 ?auto_142739 ) ) ( not ( = ?auto_142737 ?auto_142739 ) ) ( not ( = ?auto_142738 ?auto_142739 ) ) ( ON ?auto_142737 ?auto_142738 ) ( ON-TABLE ?auto_142739 ) ( ON ?auto_142736 ?auto_142737 ) ( ON ?auto_142735 ?auto_142736 ) ( ON ?auto_142734 ?auto_142735 ) ( ON ?auto_142732 ?auto_142740 ) ( CLEAR ?auto_142732 ) ( not ( = ?auto_142732 ?auto_142740 ) ) ( not ( = ?auto_142733 ?auto_142740 ) ) ( not ( = ?auto_142734 ?auto_142740 ) ) ( not ( = ?auto_142735 ?auto_142740 ) ) ( not ( = ?auto_142736 ?auto_142740 ) ) ( not ( = ?auto_142737 ?auto_142740 ) ) ( not ( = ?auto_142738 ?auto_142740 ) ) ( not ( = ?auto_142739 ?auto_142740 ) ) ( HOLDING ?auto_142733 ) ( CLEAR ?auto_142734 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142739 ?auto_142738 ?auto_142737 ?auto_142736 ?auto_142735 ?auto_142734 ?auto_142733 )
      ( MAKE-7PILE ?auto_142732 ?auto_142733 ?auto_142734 ?auto_142735 ?auto_142736 ?auto_142737 ?auto_142738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142741 - BLOCK
      ?auto_142742 - BLOCK
      ?auto_142743 - BLOCK
      ?auto_142744 - BLOCK
      ?auto_142745 - BLOCK
      ?auto_142746 - BLOCK
      ?auto_142747 - BLOCK
    )
    :vars
    (
      ?auto_142748 - BLOCK
      ?auto_142749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142741 ?auto_142742 ) ) ( not ( = ?auto_142741 ?auto_142743 ) ) ( not ( = ?auto_142741 ?auto_142744 ) ) ( not ( = ?auto_142741 ?auto_142745 ) ) ( not ( = ?auto_142741 ?auto_142746 ) ) ( not ( = ?auto_142741 ?auto_142747 ) ) ( not ( = ?auto_142742 ?auto_142743 ) ) ( not ( = ?auto_142742 ?auto_142744 ) ) ( not ( = ?auto_142742 ?auto_142745 ) ) ( not ( = ?auto_142742 ?auto_142746 ) ) ( not ( = ?auto_142742 ?auto_142747 ) ) ( not ( = ?auto_142743 ?auto_142744 ) ) ( not ( = ?auto_142743 ?auto_142745 ) ) ( not ( = ?auto_142743 ?auto_142746 ) ) ( not ( = ?auto_142743 ?auto_142747 ) ) ( not ( = ?auto_142744 ?auto_142745 ) ) ( not ( = ?auto_142744 ?auto_142746 ) ) ( not ( = ?auto_142744 ?auto_142747 ) ) ( not ( = ?auto_142745 ?auto_142746 ) ) ( not ( = ?auto_142745 ?auto_142747 ) ) ( not ( = ?auto_142746 ?auto_142747 ) ) ( ON ?auto_142747 ?auto_142748 ) ( not ( = ?auto_142741 ?auto_142748 ) ) ( not ( = ?auto_142742 ?auto_142748 ) ) ( not ( = ?auto_142743 ?auto_142748 ) ) ( not ( = ?auto_142744 ?auto_142748 ) ) ( not ( = ?auto_142745 ?auto_142748 ) ) ( not ( = ?auto_142746 ?auto_142748 ) ) ( not ( = ?auto_142747 ?auto_142748 ) ) ( ON ?auto_142746 ?auto_142747 ) ( ON-TABLE ?auto_142748 ) ( ON ?auto_142745 ?auto_142746 ) ( ON ?auto_142744 ?auto_142745 ) ( ON ?auto_142743 ?auto_142744 ) ( ON ?auto_142741 ?auto_142749 ) ( not ( = ?auto_142741 ?auto_142749 ) ) ( not ( = ?auto_142742 ?auto_142749 ) ) ( not ( = ?auto_142743 ?auto_142749 ) ) ( not ( = ?auto_142744 ?auto_142749 ) ) ( not ( = ?auto_142745 ?auto_142749 ) ) ( not ( = ?auto_142746 ?auto_142749 ) ) ( not ( = ?auto_142747 ?auto_142749 ) ) ( not ( = ?auto_142748 ?auto_142749 ) ) ( CLEAR ?auto_142743 ) ( ON ?auto_142742 ?auto_142741 ) ( CLEAR ?auto_142742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_142749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142749 ?auto_142741 )
      ( MAKE-7PILE ?auto_142741 ?auto_142742 ?auto_142743 ?auto_142744 ?auto_142745 ?auto_142746 ?auto_142747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142750 - BLOCK
      ?auto_142751 - BLOCK
      ?auto_142752 - BLOCK
      ?auto_142753 - BLOCK
      ?auto_142754 - BLOCK
      ?auto_142755 - BLOCK
      ?auto_142756 - BLOCK
    )
    :vars
    (
      ?auto_142757 - BLOCK
      ?auto_142758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142750 ?auto_142751 ) ) ( not ( = ?auto_142750 ?auto_142752 ) ) ( not ( = ?auto_142750 ?auto_142753 ) ) ( not ( = ?auto_142750 ?auto_142754 ) ) ( not ( = ?auto_142750 ?auto_142755 ) ) ( not ( = ?auto_142750 ?auto_142756 ) ) ( not ( = ?auto_142751 ?auto_142752 ) ) ( not ( = ?auto_142751 ?auto_142753 ) ) ( not ( = ?auto_142751 ?auto_142754 ) ) ( not ( = ?auto_142751 ?auto_142755 ) ) ( not ( = ?auto_142751 ?auto_142756 ) ) ( not ( = ?auto_142752 ?auto_142753 ) ) ( not ( = ?auto_142752 ?auto_142754 ) ) ( not ( = ?auto_142752 ?auto_142755 ) ) ( not ( = ?auto_142752 ?auto_142756 ) ) ( not ( = ?auto_142753 ?auto_142754 ) ) ( not ( = ?auto_142753 ?auto_142755 ) ) ( not ( = ?auto_142753 ?auto_142756 ) ) ( not ( = ?auto_142754 ?auto_142755 ) ) ( not ( = ?auto_142754 ?auto_142756 ) ) ( not ( = ?auto_142755 ?auto_142756 ) ) ( ON ?auto_142756 ?auto_142757 ) ( not ( = ?auto_142750 ?auto_142757 ) ) ( not ( = ?auto_142751 ?auto_142757 ) ) ( not ( = ?auto_142752 ?auto_142757 ) ) ( not ( = ?auto_142753 ?auto_142757 ) ) ( not ( = ?auto_142754 ?auto_142757 ) ) ( not ( = ?auto_142755 ?auto_142757 ) ) ( not ( = ?auto_142756 ?auto_142757 ) ) ( ON ?auto_142755 ?auto_142756 ) ( ON-TABLE ?auto_142757 ) ( ON ?auto_142754 ?auto_142755 ) ( ON ?auto_142753 ?auto_142754 ) ( ON ?auto_142750 ?auto_142758 ) ( not ( = ?auto_142750 ?auto_142758 ) ) ( not ( = ?auto_142751 ?auto_142758 ) ) ( not ( = ?auto_142752 ?auto_142758 ) ) ( not ( = ?auto_142753 ?auto_142758 ) ) ( not ( = ?auto_142754 ?auto_142758 ) ) ( not ( = ?auto_142755 ?auto_142758 ) ) ( not ( = ?auto_142756 ?auto_142758 ) ) ( not ( = ?auto_142757 ?auto_142758 ) ) ( ON ?auto_142751 ?auto_142750 ) ( CLEAR ?auto_142751 ) ( ON-TABLE ?auto_142758 ) ( HOLDING ?auto_142752 ) ( CLEAR ?auto_142753 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142757 ?auto_142756 ?auto_142755 ?auto_142754 ?auto_142753 ?auto_142752 )
      ( MAKE-7PILE ?auto_142750 ?auto_142751 ?auto_142752 ?auto_142753 ?auto_142754 ?auto_142755 ?auto_142756 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142759 - BLOCK
      ?auto_142760 - BLOCK
      ?auto_142761 - BLOCK
      ?auto_142762 - BLOCK
      ?auto_142763 - BLOCK
      ?auto_142764 - BLOCK
      ?auto_142765 - BLOCK
    )
    :vars
    (
      ?auto_142766 - BLOCK
      ?auto_142767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142759 ?auto_142760 ) ) ( not ( = ?auto_142759 ?auto_142761 ) ) ( not ( = ?auto_142759 ?auto_142762 ) ) ( not ( = ?auto_142759 ?auto_142763 ) ) ( not ( = ?auto_142759 ?auto_142764 ) ) ( not ( = ?auto_142759 ?auto_142765 ) ) ( not ( = ?auto_142760 ?auto_142761 ) ) ( not ( = ?auto_142760 ?auto_142762 ) ) ( not ( = ?auto_142760 ?auto_142763 ) ) ( not ( = ?auto_142760 ?auto_142764 ) ) ( not ( = ?auto_142760 ?auto_142765 ) ) ( not ( = ?auto_142761 ?auto_142762 ) ) ( not ( = ?auto_142761 ?auto_142763 ) ) ( not ( = ?auto_142761 ?auto_142764 ) ) ( not ( = ?auto_142761 ?auto_142765 ) ) ( not ( = ?auto_142762 ?auto_142763 ) ) ( not ( = ?auto_142762 ?auto_142764 ) ) ( not ( = ?auto_142762 ?auto_142765 ) ) ( not ( = ?auto_142763 ?auto_142764 ) ) ( not ( = ?auto_142763 ?auto_142765 ) ) ( not ( = ?auto_142764 ?auto_142765 ) ) ( ON ?auto_142765 ?auto_142766 ) ( not ( = ?auto_142759 ?auto_142766 ) ) ( not ( = ?auto_142760 ?auto_142766 ) ) ( not ( = ?auto_142761 ?auto_142766 ) ) ( not ( = ?auto_142762 ?auto_142766 ) ) ( not ( = ?auto_142763 ?auto_142766 ) ) ( not ( = ?auto_142764 ?auto_142766 ) ) ( not ( = ?auto_142765 ?auto_142766 ) ) ( ON ?auto_142764 ?auto_142765 ) ( ON-TABLE ?auto_142766 ) ( ON ?auto_142763 ?auto_142764 ) ( ON ?auto_142762 ?auto_142763 ) ( ON ?auto_142759 ?auto_142767 ) ( not ( = ?auto_142759 ?auto_142767 ) ) ( not ( = ?auto_142760 ?auto_142767 ) ) ( not ( = ?auto_142761 ?auto_142767 ) ) ( not ( = ?auto_142762 ?auto_142767 ) ) ( not ( = ?auto_142763 ?auto_142767 ) ) ( not ( = ?auto_142764 ?auto_142767 ) ) ( not ( = ?auto_142765 ?auto_142767 ) ) ( not ( = ?auto_142766 ?auto_142767 ) ) ( ON ?auto_142760 ?auto_142759 ) ( ON-TABLE ?auto_142767 ) ( CLEAR ?auto_142762 ) ( ON ?auto_142761 ?auto_142760 ) ( CLEAR ?auto_142761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142767 ?auto_142759 ?auto_142760 )
      ( MAKE-7PILE ?auto_142759 ?auto_142760 ?auto_142761 ?auto_142762 ?auto_142763 ?auto_142764 ?auto_142765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142768 - BLOCK
      ?auto_142769 - BLOCK
      ?auto_142770 - BLOCK
      ?auto_142771 - BLOCK
      ?auto_142772 - BLOCK
      ?auto_142773 - BLOCK
      ?auto_142774 - BLOCK
    )
    :vars
    (
      ?auto_142775 - BLOCK
      ?auto_142776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142768 ?auto_142769 ) ) ( not ( = ?auto_142768 ?auto_142770 ) ) ( not ( = ?auto_142768 ?auto_142771 ) ) ( not ( = ?auto_142768 ?auto_142772 ) ) ( not ( = ?auto_142768 ?auto_142773 ) ) ( not ( = ?auto_142768 ?auto_142774 ) ) ( not ( = ?auto_142769 ?auto_142770 ) ) ( not ( = ?auto_142769 ?auto_142771 ) ) ( not ( = ?auto_142769 ?auto_142772 ) ) ( not ( = ?auto_142769 ?auto_142773 ) ) ( not ( = ?auto_142769 ?auto_142774 ) ) ( not ( = ?auto_142770 ?auto_142771 ) ) ( not ( = ?auto_142770 ?auto_142772 ) ) ( not ( = ?auto_142770 ?auto_142773 ) ) ( not ( = ?auto_142770 ?auto_142774 ) ) ( not ( = ?auto_142771 ?auto_142772 ) ) ( not ( = ?auto_142771 ?auto_142773 ) ) ( not ( = ?auto_142771 ?auto_142774 ) ) ( not ( = ?auto_142772 ?auto_142773 ) ) ( not ( = ?auto_142772 ?auto_142774 ) ) ( not ( = ?auto_142773 ?auto_142774 ) ) ( ON ?auto_142774 ?auto_142775 ) ( not ( = ?auto_142768 ?auto_142775 ) ) ( not ( = ?auto_142769 ?auto_142775 ) ) ( not ( = ?auto_142770 ?auto_142775 ) ) ( not ( = ?auto_142771 ?auto_142775 ) ) ( not ( = ?auto_142772 ?auto_142775 ) ) ( not ( = ?auto_142773 ?auto_142775 ) ) ( not ( = ?auto_142774 ?auto_142775 ) ) ( ON ?auto_142773 ?auto_142774 ) ( ON-TABLE ?auto_142775 ) ( ON ?auto_142772 ?auto_142773 ) ( ON ?auto_142768 ?auto_142776 ) ( not ( = ?auto_142768 ?auto_142776 ) ) ( not ( = ?auto_142769 ?auto_142776 ) ) ( not ( = ?auto_142770 ?auto_142776 ) ) ( not ( = ?auto_142771 ?auto_142776 ) ) ( not ( = ?auto_142772 ?auto_142776 ) ) ( not ( = ?auto_142773 ?auto_142776 ) ) ( not ( = ?auto_142774 ?auto_142776 ) ) ( not ( = ?auto_142775 ?auto_142776 ) ) ( ON ?auto_142769 ?auto_142768 ) ( ON-TABLE ?auto_142776 ) ( ON ?auto_142770 ?auto_142769 ) ( CLEAR ?auto_142770 ) ( HOLDING ?auto_142771 ) ( CLEAR ?auto_142772 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142775 ?auto_142774 ?auto_142773 ?auto_142772 ?auto_142771 )
      ( MAKE-7PILE ?auto_142768 ?auto_142769 ?auto_142770 ?auto_142771 ?auto_142772 ?auto_142773 ?auto_142774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142777 - BLOCK
      ?auto_142778 - BLOCK
      ?auto_142779 - BLOCK
      ?auto_142780 - BLOCK
      ?auto_142781 - BLOCK
      ?auto_142782 - BLOCK
      ?auto_142783 - BLOCK
    )
    :vars
    (
      ?auto_142784 - BLOCK
      ?auto_142785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142777 ?auto_142778 ) ) ( not ( = ?auto_142777 ?auto_142779 ) ) ( not ( = ?auto_142777 ?auto_142780 ) ) ( not ( = ?auto_142777 ?auto_142781 ) ) ( not ( = ?auto_142777 ?auto_142782 ) ) ( not ( = ?auto_142777 ?auto_142783 ) ) ( not ( = ?auto_142778 ?auto_142779 ) ) ( not ( = ?auto_142778 ?auto_142780 ) ) ( not ( = ?auto_142778 ?auto_142781 ) ) ( not ( = ?auto_142778 ?auto_142782 ) ) ( not ( = ?auto_142778 ?auto_142783 ) ) ( not ( = ?auto_142779 ?auto_142780 ) ) ( not ( = ?auto_142779 ?auto_142781 ) ) ( not ( = ?auto_142779 ?auto_142782 ) ) ( not ( = ?auto_142779 ?auto_142783 ) ) ( not ( = ?auto_142780 ?auto_142781 ) ) ( not ( = ?auto_142780 ?auto_142782 ) ) ( not ( = ?auto_142780 ?auto_142783 ) ) ( not ( = ?auto_142781 ?auto_142782 ) ) ( not ( = ?auto_142781 ?auto_142783 ) ) ( not ( = ?auto_142782 ?auto_142783 ) ) ( ON ?auto_142783 ?auto_142784 ) ( not ( = ?auto_142777 ?auto_142784 ) ) ( not ( = ?auto_142778 ?auto_142784 ) ) ( not ( = ?auto_142779 ?auto_142784 ) ) ( not ( = ?auto_142780 ?auto_142784 ) ) ( not ( = ?auto_142781 ?auto_142784 ) ) ( not ( = ?auto_142782 ?auto_142784 ) ) ( not ( = ?auto_142783 ?auto_142784 ) ) ( ON ?auto_142782 ?auto_142783 ) ( ON-TABLE ?auto_142784 ) ( ON ?auto_142781 ?auto_142782 ) ( ON ?auto_142777 ?auto_142785 ) ( not ( = ?auto_142777 ?auto_142785 ) ) ( not ( = ?auto_142778 ?auto_142785 ) ) ( not ( = ?auto_142779 ?auto_142785 ) ) ( not ( = ?auto_142780 ?auto_142785 ) ) ( not ( = ?auto_142781 ?auto_142785 ) ) ( not ( = ?auto_142782 ?auto_142785 ) ) ( not ( = ?auto_142783 ?auto_142785 ) ) ( not ( = ?auto_142784 ?auto_142785 ) ) ( ON ?auto_142778 ?auto_142777 ) ( ON-TABLE ?auto_142785 ) ( ON ?auto_142779 ?auto_142778 ) ( CLEAR ?auto_142781 ) ( ON ?auto_142780 ?auto_142779 ) ( CLEAR ?auto_142780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142785 ?auto_142777 ?auto_142778 ?auto_142779 )
      ( MAKE-7PILE ?auto_142777 ?auto_142778 ?auto_142779 ?auto_142780 ?auto_142781 ?auto_142782 ?auto_142783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142786 - BLOCK
      ?auto_142787 - BLOCK
      ?auto_142788 - BLOCK
      ?auto_142789 - BLOCK
      ?auto_142790 - BLOCK
      ?auto_142791 - BLOCK
      ?auto_142792 - BLOCK
    )
    :vars
    (
      ?auto_142794 - BLOCK
      ?auto_142793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142786 ?auto_142787 ) ) ( not ( = ?auto_142786 ?auto_142788 ) ) ( not ( = ?auto_142786 ?auto_142789 ) ) ( not ( = ?auto_142786 ?auto_142790 ) ) ( not ( = ?auto_142786 ?auto_142791 ) ) ( not ( = ?auto_142786 ?auto_142792 ) ) ( not ( = ?auto_142787 ?auto_142788 ) ) ( not ( = ?auto_142787 ?auto_142789 ) ) ( not ( = ?auto_142787 ?auto_142790 ) ) ( not ( = ?auto_142787 ?auto_142791 ) ) ( not ( = ?auto_142787 ?auto_142792 ) ) ( not ( = ?auto_142788 ?auto_142789 ) ) ( not ( = ?auto_142788 ?auto_142790 ) ) ( not ( = ?auto_142788 ?auto_142791 ) ) ( not ( = ?auto_142788 ?auto_142792 ) ) ( not ( = ?auto_142789 ?auto_142790 ) ) ( not ( = ?auto_142789 ?auto_142791 ) ) ( not ( = ?auto_142789 ?auto_142792 ) ) ( not ( = ?auto_142790 ?auto_142791 ) ) ( not ( = ?auto_142790 ?auto_142792 ) ) ( not ( = ?auto_142791 ?auto_142792 ) ) ( ON ?auto_142792 ?auto_142794 ) ( not ( = ?auto_142786 ?auto_142794 ) ) ( not ( = ?auto_142787 ?auto_142794 ) ) ( not ( = ?auto_142788 ?auto_142794 ) ) ( not ( = ?auto_142789 ?auto_142794 ) ) ( not ( = ?auto_142790 ?auto_142794 ) ) ( not ( = ?auto_142791 ?auto_142794 ) ) ( not ( = ?auto_142792 ?auto_142794 ) ) ( ON ?auto_142791 ?auto_142792 ) ( ON-TABLE ?auto_142794 ) ( ON ?auto_142786 ?auto_142793 ) ( not ( = ?auto_142786 ?auto_142793 ) ) ( not ( = ?auto_142787 ?auto_142793 ) ) ( not ( = ?auto_142788 ?auto_142793 ) ) ( not ( = ?auto_142789 ?auto_142793 ) ) ( not ( = ?auto_142790 ?auto_142793 ) ) ( not ( = ?auto_142791 ?auto_142793 ) ) ( not ( = ?auto_142792 ?auto_142793 ) ) ( not ( = ?auto_142794 ?auto_142793 ) ) ( ON ?auto_142787 ?auto_142786 ) ( ON-TABLE ?auto_142793 ) ( ON ?auto_142788 ?auto_142787 ) ( ON ?auto_142789 ?auto_142788 ) ( CLEAR ?auto_142789 ) ( HOLDING ?auto_142790 ) ( CLEAR ?auto_142791 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142794 ?auto_142792 ?auto_142791 ?auto_142790 )
      ( MAKE-7PILE ?auto_142786 ?auto_142787 ?auto_142788 ?auto_142789 ?auto_142790 ?auto_142791 ?auto_142792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142795 - BLOCK
      ?auto_142796 - BLOCK
      ?auto_142797 - BLOCK
      ?auto_142798 - BLOCK
      ?auto_142799 - BLOCK
      ?auto_142800 - BLOCK
      ?auto_142801 - BLOCK
    )
    :vars
    (
      ?auto_142802 - BLOCK
      ?auto_142803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142795 ?auto_142796 ) ) ( not ( = ?auto_142795 ?auto_142797 ) ) ( not ( = ?auto_142795 ?auto_142798 ) ) ( not ( = ?auto_142795 ?auto_142799 ) ) ( not ( = ?auto_142795 ?auto_142800 ) ) ( not ( = ?auto_142795 ?auto_142801 ) ) ( not ( = ?auto_142796 ?auto_142797 ) ) ( not ( = ?auto_142796 ?auto_142798 ) ) ( not ( = ?auto_142796 ?auto_142799 ) ) ( not ( = ?auto_142796 ?auto_142800 ) ) ( not ( = ?auto_142796 ?auto_142801 ) ) ( not ( = ?auto_142797 ?auto_142798 ) ) ( not ( = ?auto_142797 ?auto_142799 ) ) ( not ( = ?auto_142797 ?auto_142800 ) ) ( not ( = ?auto_142797 ?auto_142801 ) ) ( not ( = ?auto_142798 ?auto_142799 ) ) ( not ( = ?auto_142798 ?auto_142800 ) ) ( not ( = ?auto_142798 ?auto_142801 ) ) ( not ( = ?auto_142799 ?auto_142800 ) ) ( not ( = ?auto_142799 ?auto_142801 ) ) ( not ( = ?auto_142800 ?auto_142801 ) ) ( ON ?auto_142801 ?auto_142802 ) ( not ( = ?auto_142795 ?auto_142802 ) ) ( not ( = ?auto_142796 ?auto_142802 ) ) ( not ( = ?auto_142797 ?auto_142802 ) ) ( not ( = ?auto_142798 ?auto_142802 ) ) ( not ( = ?auto_142799 ?auto_142802 ) ) ( not ( = ?auto_142800 ?auto_142802 ) ) ( not ( = ?auto_142801 ?auto_142802 ) ) ( ON ?auto_142800 ?auto_142801 ) ( ON-TABLE ?auto_142802 ) ( ON ?auto_142795 ?auto_142803 ) ( not ( = ?auto_142795 ?auto_142803 ) ) ( not ( = ?auto_142796 ?auto_142803 ) ) ( not ( = ?auto_142797 ?auto_142803 ) ) ( not ( = ?auto_142798 ?auto_142803 ) ) ( not ( = ?auto_142799 ?auto_142803 ) ) ( not ( = ?auto_142800 ?auto_142803 ) ) ( not ( = ?auto_142801 ?auto_142803 ) ) ( not ( = ?auto_142802 ?auto_142803 ) ) ( ON ?auto_142796 ?auto_142795 ) ( ON-TABLE ?auto_142803 ) ( ON ?auto_142797 ?auto_142796 ) ( ON ?auto_142798 ?auto_142797 ) ( CLEAR ?auto_142800 ) ( ON ?auto_142799 ?auto_142798 ) ( CLEAR ?auto_142799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142803 ?auto_142795 ?auto_142796 ?auto_142797 ?auto_142798 )
      ( MAKE-7PILE ?auto_142795 ?auto_142796 ?auto_142797 ?auto_142798 ?auto_142799 ?auto_142800 ?auto_142801 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142804 - BLOCK
      ?auto_142805 - BLOCK
      ?auto_142806 - BLOCK
      ?auto_142807 - BLOCK
      ?auto_142808 - BLOCK
      ?auto_142809 - BLOCK
      ?auto_142810 - BLOCK
    )
    :vars
    (
      ?auto_142812 - BLOCK
      ?auto_142811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142804 ?auto_142805 ) ) ( not ( = ?auto_142804 ?auto_142806 ) ) ( not ( = ?auto_142804 ?auto_142807 ) ) ( not ( = ?auto_142804 ?auto_142808 ) ) ( not ( = ?auto_142804 ?auto_142809 ) ) ( not ( = ?auto_142804 ?auto_142810 ) ) ( not ( = ?auto_142805 ?auto_142806 ) ) ( not ( = ?auto_142805 ?auto_142807 ) ) ( not ( = ?auto_142805 ?auto_142808 ) ) ( not ( = ?auto_142805 ?auto_142809 ) ) ( not ( = ?auto_142805 ?auto_142810 ) ) ( not ( = ?auto_142806 ?auto_142807 ) ) ( not ( = ?auto_142806 ?auto_142808 ) ) ( not ( = ?auto_142806 ?auto_142809 ) ) ( not ( = ?auto_142806 ?auto_142810 ) ) ( not ( = ?auto_142807 ?auto_142808 ) ) ( not ( = ?auto_142807 ?auto_142809 ) ) ( not ( = ?auto_142807 ?auto_142810 ) ) ( not ( = ?auto_142808 ?auto_142809 ) ) ( not ( = ?auto_142808 ?auto_142810 ) ) ( not ( = ?auto_142809 ?auto_142810 ) ) ( ON ?auto_142810 ?auto_142812 ) ( not ( = ?auto_142804 ?auto_142812 ) ) ( not ( = ?auto_142805 ?auto_142812 ) ) ( not ( = ?auto_142806 ?auto_142812 ) ) ( not ( = ?auto_142807 ?auto_142812 ) ) ( not ( = ?auto_142808 ?auto_142812 ) ) ( not ( = ?auto_142809 ?auto_142812 ) ) ( not ( = ?auto_142810 ?auto_142812 ) ) ( ON-TABLE ?auto_142812 ) ( ON ?auto_142804 ?auto_142811 ) ( not ( = ?auto_142804 ?auto_142811 ) ) ( not ( = ?auto_142805 ?auto_142811 ) ) ( not ( = ?auto_142806 ?auto_142811 ) ) ( not ( = ?auto_142807 ?auto_142811 ) ) ( not ( = ?auto_142808 ?auto_142811 ) ) ( not ( = ?auto_142809 ?auto_142811 ) ) ( not ( = ?auto_142810 ?auto_142811 ) ) ( not ( = ?auto_142812 ?auto_142811 ) ) ( ON ?auto_142805 ?auto_142804 ) ( ON-TABLE ?auto_142811 ) ( ON ?auto_142806 ?auto_142805 ) ( ON ?auto_142807 ?auto_142806 ) ( ON ?auto_142808 ?auto_142807 ) ( CLEAR ?auto_142808 ) ( HOLDING ?auto_142809 ) ( CLEAR ?auto_142810 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142812 ?auto_142810 ?auto_142809 )
      ( MAKE-7PILE ?auto_142804 ?auto_142805 ?auto_142806 ?auto_142807 ?auto_142808 ?auto_142809 ?auto_142810 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142813 - BLOCK
      ?auto_142814 - BLOCK
      ?auto_142815 - BLOCK
      ?auto_142816 - BLOCK
      ?auto_142817 - BLOCK
      ?auto_142818 - BLOCK
      ?auto_142819 - BLOCK
    )
    :vars
    (
      ?auto_142820 - BLOCK
      ?auto_142821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142813 ?auto_142814 ) ) ( not ( = ?auto_142813 ?auto_142815 ) ) ( not ( = ?auto_142813 ?auto_142816 ) ) ( not ( = ?auto_142813 ?auto_142817 ) ) ( not ( = ?auto_142813 ?auto_142818 ) ) ( not ( = ?auto_142813 ?auto_142819 ) ) ( not ( = ?auto_142814 ?auto_142815 ) ) ( not ( = ?auto_142814 ?auto_142816 ) ) ( not ( = ?auto_142814 ?auto_142817 ) ) ( not ( = ?auto_142814 ?auto_142818 ) ) ( not ( = ?auto_142814 ?auto_142819 ) ) ( not ( = ?auto_142815 ?auto_142816 ) ) ( not ( = ?auto_142815 ?auto_142817 ) ) ( not ( = ?auto_142815 ?auto_142818 ) ) ( not ( = ?auto_142815 ?auto_142819 ) ) ( not ( = ?auto_142816 ?auto_142817 ) ) ( not ( = ?auto_142816 ?auto_142818 ) ) ( not ( = ?auto_142816 ?auto_142819 ) ) ( not ( = ?auto_142817 ?auto_142818 ) ) ( not ( = ?auto_142817 ?auto_142819 ) ) ( not ( = ?auto_142818 ?auto_142819 ) ) ( ON ?auto_142819 ?auto_142820 ) ( not ( = ?auto_142813 ?auto_142820 ) ) ( not ( = ?auto_142814 ?auto_142820 ) ) ( not ( = ?auto_142815 ?auto_142820 ) ) ( not ( = ?auto_142816 ?auto_142820 ) ) ( not ( = ?auto_142817 ?auto_142820 ) ) ( not ( = ?auto_142818 ?auto_142820 ) ) ( not ( = ?auto_142819 ?auto_142820 ) ) ( ON-TABLE ?auto_142820 ) ( ON ?auto_142813 ?auto_142821 ) ( not ( = ?auto_142813 ?auto_142821 ) ) ( not ( = ?auto_142814 ?auto_142821 ) ) ( not ( = ?auto_142815 ?auto_142821 ) ) ( not ( = ?auto_142816 ?auto_142821 ) ) ( not ( = ?auto_142817 ?auto_142821 ) ) ( not ( = ?auto_142818 ?auto_142821 ) ) ( not ( = ?auto_142819 ?auto_142821 ) ) ( not ( = ?auto_142820 ?auto_142821 ) ) ( ON ?auto_142814 ?auto_142813 ) ( ON-TABLE ?auto_142821 ) ( ON ?auto_142815 ?auto_142814 ) ( ON ?auto_142816 ?auto_142815 ) ( ON ?auto_142817 ?auto_142816 ) ( CLEAR ?auto_142819 ) ( ON ?auto_142818 ?auto_142817 ) ( CLEAR ?auto_142818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142821 ?auto_142813 ?auto_142814 ?auto_142815 ?auto_142816 ?auto_142817 )
      ( MAKE-7PILE ?auto_142813 ?auto_142814 ?auto_142815 ?auto_142816 ?auto_142817 ?auto_142818 ?auto_142819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142822 - BLOCK
      ?auto_142823 - BLOCK
      ?auto_142824 - BLOCK
      ?auto_142825 - BLOCK
      ?auto_142826 - BLOCK
      ?auto_142827 - BLOCK
      ?auto_142828 - BLOCK
    )
    :vars
    (
      ?auto_142829 - BLOCK
      ?auto_142830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142822 ?auto_142823 ) ) ( not ( = ?auto_142822 ?auto_142824 ) ) ( not ( = ?auto_142822 ?auto_142825 ) ) ( not ( = ?auto_142822 ?auto_142826 ) ) ( not ( = ?auto_142822 ?auto_142827 ) ) ( not ( = ?auto_142822 ?auto_142828 ) ) ( not ( = ?auto_142823 ?auto_142824 ) ) ( not ( = ?auto_142823 ?auto_142825 ) ) ( not ( = ?auto_142823 ?auto_142826 ) ) ( not ( = ?auto_142823 ?auto_142827 ) ) ( not ( = ?auto_142823 ?auto_142828 ) ) ( not ( = ?auto_142824 ?auto_142825 ) ) ( not ( = ?auto_142824 ?auto_142826 ) ) ( not ( = ?auto_142824 ?auto_142827 ) ) ( not ( = ?auto_142824 ?auto_142828 ) ) ( not ( = ?auto_142825 ?auto_142826 ) ) ( not ( = ?auto_142825 ?auto_142827 ) ) ( not ( = ?auto_142825 ?auto_142828 ) ) ( not ( = ?auto_142826 ?auto_142827 ) ) ( not ( = ?auto_142826 ?auto_142828 ) ) ( not ( = ?auto_142827 ?auto_142828 ) ) ( not ( = ?auto_142822 ?auto_142829 ) ) ( not ( = ?auto_142823 ?auto_142829 ) ) ( not ( = ?auto_142824 ?auto_142829 ) ) ( not ( = ?auto_142825 ?auto_142829 ) ) ( not ( = ?auto_142826 ?auto_142829 ) ) ( not ( = ?auto_142827 ?auto_142829 ) ) ( not ( = ?auto_142828 ?auto_142829 ) ) ( ON-TABLE ?auto_142829 ) ( ON ?auto_142822 ?auto_142830 ) ( not ( = ?auto_142822 ?auto_142830 ) ) ( not ( = ?auto_142823 ?auto_142830 ) ) ( not ( = ?auto_142824 ?auto_142830 ) ) ( not ( = ?auto_142825 ?auto_142830 ) ) ( not ( = ?auto_142826 ?auto_142830 ) ) ( not ( = ?auto_142827 ?auto_142830 ) ) ( not ( = ?auto_142828 ?auto_142830 ) ) ( not ( = ?auto_142829 ?auto_142830 ) ) ( ON ?auto_142823 ?auto_142822 ) ( ON-TABLE ?auto_142830 ) ( ON ?auto_142824 ?auto_142823 ) ( ON ?auto_142825 ?auto_142824 ) ( ON ?auto_142826 ?auto_142825 ) ( ON ?auto_142827 ?auto_142826 ) ( CLEAR ?auto_142827 ) ( HOLDING ?auto_142828 ) ( CLEAR ?auto_142829 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142829 ?auto_142828 )
      ( MAKE-7PILE ?auto_142822 ?auto_142823 ?auto_142824 ?auto_142825 ?auto_142826 ?auto_142827 ?auto_142828 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142831 - BLOCK
      ?auto_142832 - BLOCK
      ?auto_142833 - BLOCK
      ?auto_142834 - BLOCK
      ?auto_142835 - BLOCK
      ?auto_142836 - BLOCK
      ?auto_142837 - BLOCK
    )
    :vars
    (
      ?auto_142838 - BLOCK
      ?auto_142839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142831 ?auto_142832 ) ) ( not ( = ?auto_142831 ?auto_142833 ) ) ( not ( = ?auto_142831 ?auto_142834 ) ) ( not ( = ?auto_142831 ?auto_142835 ) ) ( not ( = ?auto_142831 ?auto_142836 ) ) ( not ( = ?auto_142831 ?auto_142837 ) ) ( not ( = ?auto_142832 ?auto_142833 ) ) ( not ( = ?auto_142832 ?auto_142834 ) ) ( not ( = ?auto_142832 ?auto_142835 ) ) ( not ( = ?auto_142832 ?auto_142836 ) ) ( not ( = ?auto_142832 ?auto_142837 ) ) ( not ( = ?auto_142833 ?auto_142834 ) ) ( not ( = ?auto_142833 ?auto_142835 ) ) ( not ( = ?auto_142833 ?auto_142836 ) ) ( not ( = ?auto_142833 ?auto_142837 ) ) ( not ( = ?auto_142834 ?auto_142835 ) ) ( not ( = ?auto_142834 ?auto_142836 ) ) ( not ( = ?auto_142834 ?auto_142837 ) ) ( not ( = ?auto_142835 ?auto_142836 ) ) ( not ( = ?auto_142835 ?auto_142837 ) ) ( not ( = ?auto_142836 ?auto_142837 ) ) ( not ( = ?auto_142831 ?auto_142838 ) ) ( not ( = ?auto_142832 ?auto_142838 ) ) ( not ( = ?auto_142833 ?auto_142838 ) ) ( not ( = ?auto_142834 ?auto_142838 ) ) ( not ( = ?auto_142835 ?auto_142838 ) ) ( not ( = ?auto_142836 ?auto_142838 ) ) ( not ( = ?auto_142837 ?auto_142838 ) ) ( ON-TABLE ?auto_142838 ) ( ON ?auto_142831 ?auto_142839 ) ( not ( = ?auto_142831 ?auto_142839 ) ) ( not ( = ?auto_142832 ?auto_142839 ) ) ( not ( = ?auto_142833 ?auto_142839 ) ) ( not ( = ?auto_142834 ?auto_142839 ) ) ( not ( = ?auto_142835 ?auto_142839 ) ) ( not ( = ?auto_142836 ?auto_142839 ) ) ( not ( = ?auto_142837 ?auto_142839 ) ) ( not ( = ?auto_142838 ?auto_142839 ) ) ( ON ?auto_142832 ?auto_142831 ) ( ON-TABLE ?auto_142839 ) ( ON ?auto_142833 ?auto_142832 ) ( ON ?auto_142834 ?auto_142833 ) ( ON ?auto_142835 ?auto_142834 ) ( ON ?auto_142836 ?auto_142835 ) ( CLEAR ?auto_142838 ) ( ON ?auto_142837 ?auto_142836 ) ( CLEAR ?auto_142837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142839 ?auto_142831 ?auto_142832 ?auto_142833 ?auto_142834 ?auto_142835 ?auto_142836 )
      ( MAKE-7PILE ?auto_142831 ?auto_142832 ?auto_142833 ?auto_142834 ?auto_142835 ?auto_142836 ?auto_142837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142840 - BLOCK
      ?auto_142841 - BLOCK
      ?auto_142842 - BLOCK
      ?auto_142843 - BLOCK
      ?auto_142844 - BLOCK
      ?auto_142845 - BLOCK
      ?auto_142846 - BLOCK
    )
    :vars
    (
      ?auto_142848 - BLOCK
      ?auto_142847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142840 ?auto_142841 ) ) ( not ( = ?auto_142840 ?auto_142842 ) ) ( not ( = ?auto_142840 ?auto_142843 ) ) ( not ( = ?auto_142840 ?auto_142844 ) ) ( not ( = ?auto_142840 ?auto_142845 ) ) ( not ( = ?auto_142840 ?auto_142846 ) ) ( not ( = ?auto_142841 ?auto_142842 ) ) ( not ( = ?auto_142841 ?auto_142843 ) ) ( not ( = ?auto_142841 ?auto_142844 ) ) ( not ( = ?auto_142841 ?auto_142845 ) ) ( not ( = ?auto_142841 ?auto_142846 ) ) ( not ( = ?auto_142842 ?auto_142843 ) ) ( not ( = ?auto_142842 ?auto_142844 ) ) ( not ( = ?auto_142842 ?auto_142845 ) ) ( not ( = ?auto_142842 ?auto_142846 ) ) ( not ( = ?auto_142843 ?auto_142844 ) ) ( not ( = ?auto_142843 ?auto_142845 ) ) ( not ( = ?auto_142843 ?auto_142846 ) ) ( not ( = ?auto_142844 ?auto_142845 ) ) ( not ( = ?auto_142844 ?auto_142846 ) ) ( not ( = ?auto_142845 ?auto_142846 ) ) ( not ( = ?auto_142840 ?auto_142848 ) ) ( not ( = ?auto_142841 ?auto_142848 ) ) ( not ( = ?auto_142842 ?auto_142848 ) ) ( not ( = ?auto_142843 ?auto_142848 ) ) ( not ( = ?auto_142844 ?auto_142848 ) ) ( not ( = ?auto_142845 ?auto_142848 ) ) ( not ( = ?auto_142846 ?auto_142848 ) ) ( ON ?auto_142840 ?auto_142847 ) ( not ( = ?auto_142840 ?auto_142847 ) ) ( not ( = ?auto_142841 ?auto_142847 ) ) ( not ( = ?auto_142842 ?auto_142847 ) ) ( not ( = ?auto_142843 ?auto_142847 ) ) ( not ( = ?auto_142844 ?auto_142847 ) ) ( not ( = ?auto_142845 ?auto_142847 ) ) ( not ( = ?auto_142846 ?auto_142847 ) ) ( not ( = ?auto_142848 ?auto_142847 ) ) ( ON ?auto_142841 ?auto_142840 ) ( ON-TABLE ?auto_142847 ) ( ON ?auto_142842 ?auto_142841 ) ( ON ?auto_142843 ?auto_142842 ) ( ON ?auto_142844 ?auto_142843 ) ( ON ?auto_142845 ?auto_142844 ) ( ON ?auto_142846 ?auto_142845 ) ( CLEAR ?auto_142846 ) ( HOLDING ?auto_142848 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142848 )
      ( MAKE-7PILE ?auto_142840 ?auto_142841 ?auto_142842 ?auto_142843 ?auto_142844 ?auto_142845 ?auto_142846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_142849 - BLOCK
      ?auto_142850 - BLOCK
      ?auto_142851 - BLOCK
      ?auto_142852 - BLOCK
      ?auto_142853 - BLOCK
      ?auto_142854 - BLOCK
      ?auto_142855 - BLOCK
    )
    :vars
    (
      ?auto_142857 - BLOCK
      ?auto_142856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142849 ?auto_142850 ) ) ( not ( = ?auto_142849 ?auto_142851 ) ) ( not ( = ?auto_142849 ?auto_142852 ) ) ( not ( = ?auto_142849 ?auto_142853 ) ) ( not ( = ?auto_142849 ?auto_142854 ) ) ( not ( = ?auto_142849 ?auto_142855 ) ) ( not ( = ?auto_142850 ?auto_142851 ) ) ( not ( = ?auto_142850 ?auto_142852 ) ) ( not ( = ?auto_142850 ?auto_142853 ) ) ( not ( = ?auto_142850 ?auto_142854 ) ) ( not ( = ?auto_142850 ?auto_142855 ) ) ( not ( = ?auto_142851 ?auto_142852 ) ) ( not ( = ?auto_142851 ?auto_142853 ) ) ( not ( = ?auto_142851 ?auto_142854 ) ) ( not ( = ?auto_142851 ?auto_142855 ) ) ( not ( = ?auto_142852 ?auto_142853 ) ) ( not ( = ?auto_142852 ?auto_142854 ) ) ( not ( = ?auto_142852 ?auto_142855 ) ) ( not ( = ?auto_142853 ?auto_142854 ) ) ( not ( = ?auto_142853 ?auto_142855 ) ) ( not ( = ?auto_142854 ?auto_142855 ) ) ( not ( = ?auto_142849 ?auto_142857 ) ) ( not ( = ?auto_142850 ?auto_142857 ) ) ( not ( = ?auto_142851 ?auto_142857 ) ) ( not ( = ?auto_142852 ?auto_142857 ) ) ( not ( = ?auto_142853 ?auto_142857 ) ) ( not ( = ?auto_142854 ?auto_142857 ) ) ( not ( = ?auto_142855 ?auto_142857 ) ) ( ON ?auto_142849 ?auto_142856 ) ( not ( = ?auto_142849 ?auto_142856 ) ) ( not ( = ?auto_142850 ?auto_142856 ) ) ( not ( = ?auto_142851 ?auto_142856 ) ) ( not ( = ?auto_142852 ?auto_142856 ) ) ( not ( = ?auto_142853 ?auto_142856 ) ) ( not ( = ?auto_142854 ?auto_142856 ) ) ( not ( = ?auto_142855 ?auto_142856 ) ) ( not ( = ?auto_142857 ?auto_142856 ) ) ( ON ?auto_142850 ?auto_142849 ) ( ON-TABLE ?auto_142856 ) ( ON ?auto_142851 ?auto_142850 ) ( ON ?auto_142852 ?auto_142851 ) ( ON ?auto_142853 ?auto_142852 ) ( ON ?auto_142854 ?auto_142853 ) ( ON ?auto_142855 ?auto_142854 ) ( ON ?auto_142857 ?auto_142855 ) ( CLEAR ?auto_142857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_142856 ?auto_142849 ?auto_142850 ?auto_142851 ?auto_142852 ?auto_142853 ?auto_142854 ?auto_142855 )
      ( MAKE-7PILE ?auto_142849 ?auto_142850 ?auto_142851 ?auto_142852 ?auto_142853 ?auto_142854 ?auto_142855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142874 - BLOCK
      ?auto_142875 - BLOCK
      ?auto_142876 - BLOCK
      ?auto_142877 - BLOCK
      ?auto_142878 - BLOCK
      ?auto_142879 - BLOCK
      ?auto_142880 - BLOCK
      ?auto_142881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_142880 ) ( ON-TABLE ?auto_142874 ) ( ON ?auto_142875 ?auto_142874 ) ( ON ?auto_142876 ?auto_142875 ) ( ON ?auto_142877 ?auto_142876 ) ( ON ?auto_142878 ?auto_142877 ) ( ON ?auto_142879 ?auto_142878 ) ( ON ?auto_142880 ?auto_142879 ) ( not ( = ?auto_142874 ?auto_142875 ) ) ( not ( = ?auto_142874 ?auto_142876 ) ) ( not ( = ?auto_142874 ?auto_142877 ) ) ( not ( = ?auto_142874 ?auto_142878 ) ) ( not ( = ?auto_142874 ?auto_142879 ) ) ( not ( = ?auto_142874 ?auto_142880 ) ) ( not ( = ?auto_142874 ?auto_142881 ) ) ( not ( = ?auto_142875 ?auto_142876 ) ) ( not ( = ?auto_142875 ?auto_142877 ) ) ( not ( = ?auto_142875 ?auto_142878 ) ) ( not ( = ?auto_142875 ?auto_142879 ) ) ( not ( = ?auto_142875 ?auto_142880 ) ) ( not ( = ?auto_142875 ?auto_142881 ) ) ( not ( = ?auto_142876 ?auto_142877 ) ) ( not ( = ?auto_142876 ?auto_142878 ) ) ( not ( = ?auto_142876 ?auto_142879 ) ) ( not ( = ?auto_142876 ?auto_142880 ) ) ( not ( = ?auto_142876 ?auto_142881 ) ) ( not ( = ?auto_142877 ?auto_142878 ) ) ( not ( = ?auto_142877 ?auto_142879 ) ) ( not ( = ?auto_142877 ?auto_142880 ) ) ( not ( = ?auto_142877 ?auto_142881 ) ) ( not ( = ?auto_142878 ?auto_142879 ) ) ( not ( = ?auto_142878 ?auto_142880 ) ) ( not ( = ?auto_142878 ?auto_142881 ) ) ( not ( = ?auto_142879 ?auto_142880 ) ) ( not ( = ?auto_142879 ?auto_142881 ) ) ( not ( = ?auto_142880 ?auto_142881 ) ) ( ON-TABLE ?auto_142881 ) ( CLEAR ?auto_142881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_142881 )
      ( MAKE-8PILE ?auto_142874 ?auto_142875 ?auto_142876 ?auto_142877 ?auto_142878 ?auto_142879 ?auto_142880 ?auto_142881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142882 - BLOCK
      ?auto_142883 - BLOCK
      ?auto_142884 - BLOCK
      ?auto_142885 - BLOCK
      ?auto_142886 - BLOCK
      ?auto_142887 - BLOCK
      ?auto_142888 - BLOCK
      ?auto_142889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142882 ) ( ON ?auto_142883 ?auto_142882 ) ( ON ?auto_142884 ?auto_142883 ) ( ON ?auto_142885 ?auto_142884 ) ( ON ?auto_142886 ?auto_142885 ) ( ON ?auto_142887 ?auto_142886 ) ( not ( = ?auto_142882 ?auto_142883 ) ) ( not ( = ?auto_142882 ?auto_142884 ) ) ( not ( = ?auto_142882 ?auto_142885 ) ) ( not ( = ?auto_142882 ?auto_142886 ) ) ( not ( = ?auto_142882 ?auto_142887 ) ) ( not ( = ?auto_142882 ?auto_142888 ) ) ( not ( = ?auto_142882 ?auto_142889 ) ) ( not ( = ?auto_142883 ?auto_142884 ) ) ( not ( = ?auto_142883 ?auto_142885 ) ) ( not ( = ?auto_142883 ?auto_142886 ) ) ( not ( = ?auto_142883 ?auto_142887 ) ) ( not ( = ?auto_142883 ?auto_142888 ) ) ( not ( = ?auto_142883 ?auto_142889 ) ) ( not ( = ?auto_142884 ?auto_142885 ) ) ( not ( = ?auto_142884 ?auto_142886 ) ) ( not ( = ?auto_142884 ?auto_142887 ) ) ( not ( = ?auto_142884 ?auto_142888 ) ) ( not ( = ?auto_142884 ?auto_142889 ) ) ( not ( = ?auto_142885 ?auto_142886 ) ) ( not ( = ?auto_142885 ?auto_142887 ) ) ( not ( = ?auto_142885 ?auto_142888 ) ) ( not ( = ?auto_142885 ?auto_142889 ) ) ( not ( = ?auto_142886 ?auto_142887 ) ) ( not ( = ?auto_142886 ?auto_142888 ) ) ( not ( = ?auto_142886 ?auto_142889 ) ) ( not ( = ?auto_142887 ?auto_142888 ) ) ( not ( = ?auto_142887 ?auto_142889 ) ) ( not ( = ?auto_142888 ?auto_142889 ) ) ( ON-TABLE ?auto_142889 ) ( CLEAR ?auto_142889 ) ( HOLDING ?auto_142888 ) ( CLEAR ?auto_142887 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142882 ?auto_142883 ?auto_142884 ?auto_142885 ?auto_142886 ?auto_142887 ?auto_142888 )
      ( MAKE-8PILE ?auto_142882 ?auto_142883 ?auto_142884 ?auto_142885 ?auto_142886 ?auto_142887 ?auto_142888 ?auto_142889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142890 - BLOCK
      ?auto_142891 - BLOCK
      ?auto_142892 - BLOCK
      ?auto_142893 - BLOCK
      ?auto_142894 - BLOCK
      ?auto_142895 - BLOCK
      ?auto_142896 - BLOCK
      ?auto_142897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142890 ) ( ON ?auto_142891 ?auto_142890 ) ( ON ?auto_142892 ?auto_142891 ) ( ON ?auto_142893 ?auto_142892 ) ( ON ?auto_142894 ?auto_142893 ) ( ON ?auto_142895 ?auto_142894 ) ( not ( = ?auto_142890 ?auto_142891 ) ) ( not ( = ?auto_142890 ?auto_142892 ) ) ( not ( = ?auto_142890 ?auto_142893 ) ) ( not ( = ?auto_142890 ?auto_142894 ) ) ( not ( = ?auto_142890 ?auto_142895 ) ) ( not ( = ?auto_142890 ?auto_142896 ) ) ( not ( = ?auto_142890 ?auto_142897 ) ) ( not ( = ?auto_142891 ?auto_142892 ) ) ( not ( = ?auto_142891 ?auto_142893 ) ) ( not ( = ?auto_142891 ?auto_142894 ) ) ( not ( = ?auto_142891 ?auto_142895 ) ) ( not ( = ?auto_142891 ?auto_142896 ) ) ( not ( = ?auto_142891 ?auto_142897 ) ) ( not ( = ?auto_142892 ?auto_142893 ) ) ( not ( = ?auto_142892 ?auto_142894 ) ) ( not ( = ?auto_142892 ?auto_142895 ) ) ( not ( = ?auto_142892 ?auto_142896 ) ) ( not ( = ?auto_142892 ?auto_142897 ) ) ( not ( = ?auto_142893 ?auto_142894 ) ) ( not ( = ?auto_142893 ?auto_142895 ) ) ( not ( = ?auto_142893 ?auto_142896 ) ) ( not ( = ?auto_142893 ?auto_142897 ) ) ( not ( = ?auto_142894 ?auto_142895 ) ) ( not ( = ?auto_142894 ?auto_142896 ) ) ( not ( = ?auto_142894 ?auto_142897 ) ) ( not ( = ?auto_142895 ?auto_142896 ) ) ( not ( = ?auto_142895 ?auto_142897 ) ) ( not ( = ?auto_142896 ?auto_142897 ) ) ( ON-TABLE ?auto_142897 ) ( CLEAR ?auto_142895 ) ( ON ?auto_142896 ?auto_142897 ) ( CLEAR ?auto_142896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142897 )
      ( MAKE-8PILE ?auto_142890 ?auto_142891 ?auto_142892 ?auto_142893 ?auto_142894 ?auto_142895 ?auto_142896 ?auto_142897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142898 - BLOCK
      ?auto_142899 - BLOCK
      ?auto_142900 - BLOCK
      ?auto_142901 - BLOCK
      ?auto_142902 - BLOCK
      ?auto_142903 - BLOCK
      ?auto_142904 - BLOCK
      ?auto_142905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142898 ) ( ON ?auto_142899 ?auto_142898 ) ( ON ?auto_142900 ?auto_142899 ) ( ON ?auto_142901 ?auto_142900 ) ( ON ?auto_142902 ?auto_142901 ) ( not ( = ?auto_142898 ?auto_142899 ) ) ( not ( = ?auto_142898 ?auto_142900 ) ) ( not ( = ?auto_142898 ?auto_142901 ) ) ( not ( = ?auto_142898 ?auto_142902 ) ) ( not ( = ?auto_142898 ?auto_142903 ) ) ( not ( = ?auto_142898 ?auto_142904 ) ) ( not ( = ?auto_142898 ?auto_142905 ) ) ( not ( = ?auto_142899 ?auto_142900 ) ) ( not ( = ?auto_142899 ?auto_142901 ) ) ( not ( = ?auto_142899 ?auto_142902 ) ) ( not ( = ?auto_142899 ?auto_142903 ) ) ( not ( = ?auto_142899 ?auto_142904 ) ) ( not ( = ?auto_142899 ?auto_142905 ) ) ( not ( = ?auto_142900 ?auto_142901 ) ) ( not ( = ?auto_142900 ?auto_142902 ) ) ( not ( = ?auto_142900 ?auto_142903 ) ) ( not ( = ?auto_142900 ?auto_142904 ) ) ( not ( = ?auto_142900 ?auto_142905 ) ) ( not ( = ?auto_142901 ?auto_142902 ) ) ( not ( = ?auto_142901 ?auto_142903 ) ) ( not ( = ?auto_142901 ?auto_142904 ) ) ( not ( = ?auto_142901 ?auto_142905 ) ) ( not ( = ?auto_142902 ?auto_142903 ) ) ( not ( = ?auto_142902 ?auto_142904 ) ) ( not ( = ?auto_142902 ?auto_142905 ) ) ( not ( = ?auto_142903 ?auto_142904 ) ) ( not ( = ?auto_142903 ?auto_142905 ) ) ( not ( = ?auto_142904 ?auto_142905 ) ) ( ON-TABLE ?auto_142905 ) ( ON ?auto_142904 ?auto_142905 ) ( CLEAR ?auto_142904 ) ( HOLDING ?auto_142903 ) ( CLEAR ?auto_142902 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142898 ?auto_142899 ?auto_142900 ?auto_142901 ?auto_142902 ?auto_142903 )
      ( MAKE-8PILE ?auto_142898 ?auto_142899 ?auto_142900 ?auto_142901 ?auto_142902 ?auto_142903 ?auto_142904 ?auto_142905 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142906 - BLOCK
      ?auto_142907 - BLOCK
      ?auto_142908 - BLOCK
      ?auto_142909 - BLOCK
      ?auto_142910 - BLOCK
      ?auto_142911 - BLOCK
      ?auto_142912 - BLOCK
      ?auto_142913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142906 ) ( ON ?auto_142907 ?auto_142906 ) ( ON ?auto_142908 ?auto_142907 ) ( ON ?auto_142909 ?auto_142908 ) ( ON ?auto_142910 ?auto_142909 ) ( not ( = ?auto_142906 ?auto_142907 ) ) ( not ( = ?auto_142906 ?auto_142908 ) ) ( not ( = ?auto_142906 ?auto_142909 ) ) ( not ( = ?auto_142906 ?auto_142910 ) ) ( not ( = ?auto_142906 ?auto_142911 ) ) ( not ( = ?auto_142906 ?auto_142912 ) ) ( not ( = ?auto_142906 ?auto_142913 ) ) ( not ( = ?auto_142907 ?auto_142908 ) ) ( not ( = ?auto_142907 ?auto_142909 ) ) ( not ( = ?auto_142907 ?auto_142910 ) ) ( not ( = ?auto_142907 ?auto_142911 ) ) ( not ( = ?auto_142907 ?auto_142912 ) ) ( not ( = ?auto_142907 ?auto_142913 ) ) ( not ( = ?auto_142908 ?auto_142909 ) ) ( not ( = ?auto_142908 ?auto_142910 ) ) ( not ( = ?auto_142908 ?auto_142911 ) ) ( not ( = ?auto_142908 ?auto_142912 ) ) ( not ( = ?auto_142908 ?auto_142913 ) ) ( not ( = ?auto_142909 ?auto_142910 ) ) ( not ( = ?auto_142909 ?auto_142911 ) ) ( not ( = ?auto_142909 ?auto_142912 ) ) ( not ( = ?auto_142909 ?auto_142913 ) ) ( not ( = ?auto_142910 ?auto_142911 ) ) ( not ( = ?auto_142910 ?auto_142912 ) ) ( not ( = ?auto_142910 ?auto_142913 ) ) ( not ( = ?auto_142911 ?auto_142912 ) ) ( not ( = ?auto_142911 ?auto_142913 ) ) ( not ( = ?auto_142912 ?auto_142913 ) ) ( ON-TABLE ?auto_142913 ) ( ON ?auto_142912 ?auto_142913 ) ( CLEAR ?auto_142910 ) ( ON ?auto_142911 ?auto_142912 ) ( CLEAR ?auto_142911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142913 ?auto_142912 )
      ( MAKE-8PILE ?auto_142906 ?auto_142907 ?auto_142908 ?auto_142909 ?auto_142910 ?auto_142911 ?auto_142912 ?auto_142913 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142914 - BLOCK
      ?auto_142915 - BLOCK
      ?auto_142916 - BLOCK
      ?auto_142917 - BLOCK
      ?auto_142918 - BLOCK
      ?auto_142919 - BLOCK
      ?auto_142920 - BLOCK
      ?auto_142921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142914 ) ( ON ?auto_142915 ?auto_142914 ) ( ON ?auto_142916 ?auto_142915 ) ( ON ?auto_142917 ?auto_142916 ) ( not ( = ?auto_142914 ?auto_142915 ) ) ( not ( = ?auto_142914 ?auto_142916 ) ) ( not ( = ?auto_142914 ?auto_142917 ) ) ( not ( = ?auto_142914 ?auto_142918 ) ) ( not ( = ?auto_142914 ?auto_142919 ) ) ( not ( = ?auto_142914 ?auto_142920 ) ) ( not ( = ?auto_142914 ?auto_142921 ) ) ( not ( = ?auto_142915 ?auto_142916 ) ) ( not ( = ?auto_142915 ?auto_142917 ) ) ( not ( = ?auto_142915 ?auto_142918 ) ) ( not ( = ?auto_142915 ?auto_142919 ) ) ( not ( = ?auto_142915 ?auto_142920 ) ) ( not ( = ?auto_142915 ?auto_142921 ) ) ( not ( = ?auto_142916 ?auto_142917 ) ) ( not ( = ?auto_142916 ?auto_142918 ) ) ( not ( = ?auto_142916 ?auto_142919 ) ) ( not ( = ?auto_142916 ?auto_142920 ) ) ( not ( = ?auto_142916 ?auto_142921 ) ) ( not ( = ?auto_142917 ?auto_142918 ) ) ( not ( = ?auto_142917 ?auto_142919 ) ) ( not ( = ?auto_142917 ?auto_142920 ) ) ( not ( = ?auto_142917 ?auto_142921 ) ) ( not ( = ?auto_142918 ?auto_142919 ) ) ( not ( = ?auto_142918 ?auto_142920 ) ) ( not ( = ?auto_142918 ?auto_142921 ) ) ( not ( = ?auto_142919 ?auto_142920 ) ) ( not ( = ?auto_142919 ?auto_142921 ) ) ( not ( = ?auto_142920 ?auto_142921 ) ) ( ON-TABLE ?auto_142921 ) ( ON ?auto_142920 ?auto_142921 ) ( ON ?auto_142919 ?auto_142920 ) ( CLEAR ?auto_142919 ) ( HOLDING ?auto_142918 ) ( CLEAR ?auto_142917 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142914 ?auto_142915 ?auto_142916 ?auto_142917 ?auto_142918 )
      ( MAKE-8PILE ?auto_142914 ?auto_142915 ?auto_142916 ?auto_142917 ?auto_142918 ?auto_142919 ?auto_142920 ?auto_142921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142922 - BLOCK
      ?auto_142923 - BLOCK
      ?auto_142924 - BLOCK
      ?auto_142925 - BLOCK
      ?auto_142926 - BLOCK
      ?auto_142927 - BLOCK
      ?auto_142928 - BLOCK
      ?auto_142929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142922 ) ( ON ?auto_142923 ?auto_142922 ) ( ON ?auto_142924 ?auto_142923 ) ( ON ?auto_142925 ?auto_142924 ) ( not ( = ?auto_142922 ?auto_142923 ) ) ( not ( = ?auto_142922 ?auto_142924 ) ) ( not ( = ?auto_142922 ?auto_142925 ) ) ( not ( = ?auto_142922 ?auto_142926 ) ) ( not ( = ?auto_142922 ?auto_142927 ) ) ( not ( = ?auto_142922 ?auto_142928 ) ) ( not ( = ?auto_142922 ?auto_142929 ) ) ( not ( = ?auto_142923 ?auto_142924 ) ) ( not ( = ?auto_142923 ?auto_142925 ) ) ( not ( = ?auto_142923 ?auto_142926 ) ) ( not ( = ?auto_142923 ?auto_142927 ) ) ( not ( = ?auto_142923 ?auto_142928 ) ) ( not ( = ?auto_142923 ?auto_142929 ) ) ( not ( = ?auto_142924 ?auto_142925 ) ) ( not ( = ?auto_142924 ?auto_142926 ) ) ( not ( = ?auto_142924 ?auto_142927 ) ) ( not ( = ?auto_142924 ?auto_142928 ) ) ( not ( = ?auto_142924 ?auto_142929 ) ) ( not ( = ?auto_142925 ?auto_142926 ) ) ( not ( = ?auto_142925 ?auto_142927 ) ) ( not ( = ?auto_142925 ?auto_142928 ) ) ( not ( = ?auto_142925 ?auto_142929 ) ) ( not ( = ?auto_142926 ?auto_142927 ) ) ( not ( = ?auto_142926 ?auto_142928 ) ) ( not ( = ?auto_142926 ?auto_142929 ) ) ( not ( = ?auto_142927 ?auto_142928 ) ) ( not ( = ?auto_142927 ?auto_142929 ) ) ( not ( = ?auto_142928 ?auto_142929 ) ) ( ON-TABLE ?auto_142929 ) ( ON ?auto_142928 ?auto_142929 ) ( ON ?auto_142927 ?auto_142928 ) ( CLEAR ?auto_142925 ) ( ON ?auto_142926 ?auto_142927 ) ( CLEAR ?auto_142926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142929 ?auto_142928 ?auto_142927 )
      ( MAKE-8PILE ?auto_142922 ?auto_142923 ?auto_142924 ?auto_142925 ?auto_142926 ?auto_142927 ?auto_142928 ?auto_142929 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142930 - BLOCK
      ?auto_142931 - BLOCK
      ?auto_142932 - BLOCK
      ?auto_142933 - BLOCK
      ?auto_142934 - BLOCK
      ?auto_142935 - BLOCK
      ?auto_142936 - BLOCK
      ?auto_142937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142930 ) ( ON ?auto_142931 ?auto_142930 ) ( ON ?auto_142932 ?auto_142931 ) ( not ( = ?auto_142930 ?auto_142931 ) ) ( not ( = ?auto_142930 ?auto_142932 ) ) ( not ( = ?auto_142930 ?auto_142933 ) ) ( not ( = ?auto_142930 ?auto_142934 ) ) ( not ( = ?auto_142930 ?auto_142935 ) ) ( not ( = ?auto_142930 ?auto_142936 ) ) ( not ( = ?auto_142930 ?auto_142937 ) ) ( not ( = ?auto_142931 ?auto_142932 ) ) ( not ( = ?auto_142931 ?auto_142933 ) ) ( not ( = ?auto_142931 ?auto_142934 ) ) ( not ( = ?auto_142931 ?auto_142935 ) ) ( not ( = ?auto_142931 ?auto_142936 ) ) ( not ( = ?auto_142931 ?auto_142937 ) ) ( not ( = ?auto_142932 ?auto_142933 ) ) ( not ( = ?auto_142932 ?auto_142934 ) ) ( not ( = ?auto_142932 ?auto_142935 ) ) ( not ( = ?auto_142932 ?auto_142936 ) ) ( not ( = ?auto_142932 ?auto_142937 ) ) ( not ( = ?auto_142933 ?auto_142934 ) ) ( not ( = ?auto_142933 ?auto_142935 ) ) ( not ( = ?auto_142933 ?auto_142936 ) ) ( not ( = ?auto_142933 ?auto_142937 ) ) ( not ( = ?auto_142934 ?auto_142935 ) ) ( not ( = ?auto_142934 ?auto_142936 ) ) ( not ( = ?auto_142934 ?auto_142937 ) ) ( not ( = ?auto_142935 ?auto_142936 ) ) ( not ( = ?auto_142935 ?auto_142937 ) ) ( not ( = ?auto_142936 ?auto_142937 ) ) ( ON-TABLE ?auto_142937 ) ( ON ?auto_142936 ?auto_142937 ) ( ON ?auto_142935 ?auto_142936 ) ( ON ?auto_142934 ?auto_142935 ) ( CLEAR ?auto_142934 ) ( HOLDING ?auto_142933 ) ( CLEAR ?auto_142932 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142930 ?auto_142931 ?auto_142932 ?auto_142933 )
      ( MAKE-8PILE ?auto_142930 ?auto_142931 ?auto_142932 ?auto_142933 ?auto_142934 ?auto_142935 ?auto_142936 ?auto_142937 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142938 - BLOCK
      ?auto_142939 - BLOCK
      ?auto_142940 - BLOCK
      ?auto_142941 - BLOCK
      ?auto_142942 - BLOCK
      ?auto_142943 - BLOCK
      ?auto_142944 - BLOCK
      ?auto_142945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142938 ) ( ON ?auto_142939 ?auto_142938 ) ( ON ?auto_142940 ?auto_142939 ) ( not ( = ?auto_142938 ?auto_142939 ) ) ( not ( = ?auto_142938 ?auto_142940 ) ) ( not ( = ?auto_142938 ?auto_142941 ) ) ( not ( = ?auto_142938 ?auto_142942 ) ) ( not ( = ?auto_142938 ?auto_142943 ) ) ( not ( = ?auto_142938 ?auto_142944 ) ) ( not ( = ?auto_142938 ?auto_142945 ) ) ( not ( = ?auto_142939 ?auto_142940 ) ) ( not ( = ?auto_142939 ?auto_142941 ) ) ( not ( = ?auto_142939 ?auto_142942 ) ) ( not ( = ?auto_142939 ?auto_142943 ) ) ( not ( = ?auto_142939 ?auto_142944 ) ) ( not ( = ?auto_142939 ?auto_142945 ) ) ( not ( = ?auto_142940 ?auto_142941 ) ) ( not ( = ?auto_142940 ?auto_142942 ) ) ( not ( = ?auto_142940 ?auto_142943 ) ) ( not ( = ?auto_142940 ?auto_142944 ) ) ( not ( = ?auto_142940 ?auto_142945 ) ) ( not ( = ?auto_142941 ?auto_142942 ) ) ( not ( = ?auto_142941 ?auto_142943 ) ) ( not ( = ?auto_142941 ?auto_142944 ) ) ( not ( = ?auto_142941 ?auto_142945 ) ) ( not ( = ?auto_142942 ?auto_142943 ) ) ( not ( = ?auto_142942 ?auto_142944 ) ) ( not ( = ?auto_142942 ?auto_142945 ) ) ( not ( = ?auto_142943 ?auto_142944 ) ) ( not ( = ?auto_142943 ?auto_142945 ) ) ( not ( = ?auto_142944 ?auto_142945 ) ) ( ON-TABLE ?auto_142945 ) ( ON ?auto_142944 ?auto_142945 ) ( ON ?auto_142943 ?auto_142944 ) ( ON ?auto_142942 ?auto_142943 ) ( CLEAR ?auto_142940 ) ( ON ?auto_142941 ?auto_142942 ) ( CLEAR ?auto_142941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_142945 ?auto_142944 ?auto_142943 ?auto_142942 )
      ( MAKE-8PILE ?auto_142938 ?auto_142939 ?auto_142940 ?auto_142941 ?auto_142942 ?auto_142943 ?auto_142944 ?auto_142945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142946 - BLOCK
      ?auto_142947 - BLOCK
      ?auto_142948 - BLOCK
      ?auto_142949 - BLOCK
      ?auto_142950 - BLOCK
      ?auto_142951 - BLOCK
      ?auto_142952 - BLOCK
      ?auto_142953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142946 ) ( ON ?auto_142947 ?auto_142946 ) ( not ( = ?auto_142946 ?auto_142947 ) ) ( not ( = ?auto_142946 ?auto_142948 ) ) ( not ( = ?auto_142946 ?auto_142949 ) ) ( not ( = ?auto_142946 ?auto_142950 ) ) ( not ( = ?auto_142946 ?auto_142951 ) ) ( not ( = ?auto_142946 ?auto_142952 ) ) ( not ( = ?auto_142946 ?auto_142953 ) ) ( not ( = ?auto_142947 ?auto_142948 ) ) ( not ( = ?auto_142947 ?auto_142949 ) ) ( not ( = ?auto_142947 ?auto_142950 ) ) ( not ( = ?auto_142947 ?auto_142951 ) ) ( not ( = ?auto_142947 ?auto_142952 ) ) ( not ( = ?auto_142947 ?auto_142953 ) ) ( not ( = ?auto_142948 ?auto_142949 ) ) ( not ( = ?auto_142948 ?auto_142950 ) ) ( not ( = ?auto_142948 ?auto_142951 ) ) ( not ( = ?auto_142948 ?auto_142952 ) ) ( not ( = ?auto_142948 ?auto_142953 ) ) ( not ( = ?auto_142949 ?auto_142950 ) ) ( not ( = ?auto_142949 ?auto_142951 ) ) ( not ( = ?auto_142949 ?auto_142952 ) ) ( not ( = ?auto_142949 ?auto_142953 ) ) ( not ( = ?auto_142950 ?auto_142951 ) ) ( not ( = ?auto_142950 ?auto_142952 ) ) ( not ( = ?auto_142950 ?auto_142953 ) ) ( not ( = ?auto_142951 ?auto_142952 ) ) ( not ( = ?auto_142951 ?auto_142953 ) ) ( not ( = ?auto_142952 ?auto_142953 ) ) ( ON-TABLE ?auto_142953 ) ( ON ?auto_142952 ?auto_142953 ) ( ON ?auto_142951 ?auto_142952 ) ( ON ?auto_142950 ?auto_142951 ) ( ON ?auto_142949 ?auto_142950 ) ( CLEAR ?auto_142949 ) ( HOLDING ?auto_142948 ) ( CLEAR ?auto_142947 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_142946 ?auto_142947 ?auto_142948 )
      ( MAKE-8PILE ?auto_142946 ?auto_142947 ?auto_142948 ?auto_142949 ?auto_142950 ?auto_142951 ?auto_142952 ?auto_142953 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142954 - BLOCK
      ?auto_142955 - BLOCK
      ?auto_142956 - BLOCK
      ?auto_142957 - BLOCK
      ?auto_142958 - BLOCK
      ?auto_142959 - BLOCK
      ?auto_142960 - BLOCK
      ?auto_142961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142954 ) ( ON ?auto_142955 ?auto_142954 ) ( not ( = ?auto_142954 ?auto_142955 ) ) ( not ( = ?auto_142954 ?auto_142956 ) ) ( not ( = ?auto_142954 ?auto_142957 ) ) ( not ( = ?auto_142954 ?auto_142958 ) ) ( not ( = ?auto_142954 ?auto_142959 ) ) ( not ( = ?auto_142954 ?auto_142960 ) ) ( not ( = ?auto_142954 ?auto_142961 ) ) ( not ( = ?auto_142955 ?auto_142956 ) ) ( not ( = ?auto_142955 ?auto_142957 ) ) ( not ( = ?auto_142955 ?auto_142958 ) ) ( not ( = ?auto_142955 ?auto_142959 ) ) ( not ( = ?auto_142955 ?auto_142960 ) ) ( not ( = ?auto_142955 ?auto_142961 ) ) ( not ( = ?auto_142956 ?auto_142957 ) ) ( not ( = ?auto_142956 ?auto_142958 ) ) ( not ( = ?auto_142956 ?auto_142959 ) ) ( not ( = ?auto_142956 ?auto_142960 ) ) ( not ( = ?auto_142956 ?auto_142961 ) ) ( not ( = ?auto_142957 ?auto_142958 ) ) ( not ( = ?auto_142957 ?auto_142959 ) ) ( not ( = ?auto_142957 ?auto_142960 ) ) ( not ( = ?auto_142957 ?auto_142961 ) ) ( not ( = ?auto_142958 ?auto_142959 ) ) ( not ( = ?auto_142958 ?auto_142960 ) ) ( not ( = ?auto_142958 ?auto_142961 ) ) ( not ( = ?auto_142959 ?auto_142960 ) ) ( not ( = ?auto_142959 ?auto_142961 ) ) ( not ( = ?auto_142960 ?auto_142961 ) ) ( ON-TABLE ?auto_142961 ) ( ON ?auto_142960 ?auto_142961 ) ( ON ?auto_142959 ?auto_142960 ) ( ON ?auto_142958 ?auto_142959 ) ( ON ?auto_142957 ?auto_142958 ) ( CLEAR ?auto_142955 ) ( ON ?auto_142956 ?auto_142957 ) ( CLEAR ?auto_142956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_142961 ?auto_142960 ?auto_142959 ?auto_142958 ?auto_142957 )
      ( MAKE-8PILE ?auto_142954 ?auto_142955 ?auto_142956 ?auto_142957 ?auto_142958 ?auto_142959 ?auto_142960 ?auto_142961 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142962 - BLOCK
      ?auto_142963 - BLOCK
      ?auto_142964 - BLOCK
      ?auto_142965 - BLOCK
      ?auto_142966 - BLOCK
      ?auto_142967 - BLOCK
      ?auto_142968 - BLOCK
      ?auto_142969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142962 ) ( not ( = ?auto_142962 ?auto_142963 ) ) ( not ( = ?auto_142962 ?auto_142964 ) ) ( not ( = ?auto_142962 ?auto_142965 ) ) ( not ( = ?auto_142962 ?auto_142966 ) ) ( not ( = ?auto_142962 ?auto_142967 ) ) ( not ( = ?auto_142962 ?auto_142968 ) ) ( not ( = ?auto_142962 ?auto_142969 ) ) ( not ( = ?auto_142963 ?auto_142964 ) ) ( not ( = ?auto_142963 ?auto_142965 ) ) ( not ( = ?auto_142963 ?auto_142966 ) ) ( not ( = ?auto_142963 ?auto_142967 ) ) ( not ( = ?auto_142963 ?auto_142968 ) ) ( not ( = ?auto_142963 ?auto_142969 ) ) ( not ( = ?auto_142964 ?auto_142965 ) ) ( not ( = ?auto_142964 ?auto_142966 ) ) ( not ( = ?auto_142964 ?auto_142967 ) ) ( not ( = ?auto_142964 ?auto_142968 ) ) ( not ( = ?auto_142964 ?auto_142969 ) ) ( not ( = ?auto_142965 ?auto_142966 ) ) ( not ( = ?auto_142965 ?auto_142967 ) ) ( not ( = ?auto_142965 ?auto_142968 ) ) ( not ( = ?auto_142965 ?auto_142969 ) ) ( not ( = ?auto_142966 ?auto_142967 ) ) ( not ( = ?auto_142966 ?auto_142968 ) ) ( not ( = ?auto_142966 ?auto_142969 ) ) ( not ( = ?auto_142967 ?auto_142968 ) ) ( not ( = ?auto_142967 ?auto_142969 ) ) ( not ( = ?auto_142968 ?auto_142969 ) ) ( ON-TABLE ?auto_142969 ) ( ON ?auto_142968 ?auto_142969 ) ( ON ?auto_142967 ?auto_142968 ) ( ON ?auto_142966 ?auto_142967 ) ( ON ?auto_142965 ?auto_142966 ) ( ON ?auto_142964 ?auto_142965 ) ( CLEAR ?auto_142964 ) ( HOLDING ?auto_142963 ) ( CLEAR ?auto_142962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_142962 ?auto_142963 )
      ( MAKE-8PILE ?auto_142962 ?auto_142963 ?auto_142964 ?auto_142965 ?auto_142966 ?auto_142967 ?auto_142968 ?auto_142969 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142970 - BLOCK
      ?auto_142971 - BLOCK
      ?auto_142972 - BLOCK
      ?auto_142973 - BLOCK
      ?auto_142974 - BLOCK
      ?auto_142975 - BLOCK
      ?auto_142976 - BLOCK
      ?auto_142977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_142970 ) ( not ( = ?auto_142970 ?auto_142971 ) ) ( not ( = ?auto_142970 ?auto_142972 ) ) ( not ( = ?auto_142970 ?auto_142973 ) ) ( not ( = ?auto_142970 ?auto_142974 ) ) ( not ( = ?auto_142970 ?auto_142975 ) ) ( not ( = ?auto_142970 ?auto_142976 ) ) ( not ( = ?auto_142970 ?auto_142977 ) ) ( not ( = ?auto_142971 ?auto_142972 ) ) ( not ( = ?auto_142971 ?auto_142973 ) ) ( not ( = ?auto_142971 ?auto_142974 ) ) ( not ( = ?auto_142971 ?auto_142975 ) ) ( not ( = ?auto_142971 ?auto_142976 ) ) ( not ( = ?auto_142971 ?auto_142977 ) ) ( not ( = ?auto_142972 ?auto_142973 ) ) ( not ( = ?auto_142972 ?auto_142974 ) ) ( not ( = ?auto_142972 ?auto_142975 ) ) ( not ( = ?auto_142972 ?auto_142976 ) ) ( not ( = ?auto_142972 ?auto_142977 ) ) ( not ( = ?auto_142973 ?auto_142974 ) ) ( not ( = ?auto_142973 ?auto_142975 ) ) ( not ( = ?auto_142973 ?auto_142976 ) ) ( not ( = ?auto_142973 ?auto_142977 ) ) ( not ( = ?auto_142974 ?auto_142975 ) ) ( not ( = ?auto_142974 ?auto_142976 ) ) ( not ( = ?auto_142974 ?auto_142977 ) ) ( not ( = ?auto_142975 ?auto_142976 ) ) ( not ( = ?auto_142975 ?auto_142977 ) ) ( not ( = ?auto_142976 ?auto_142977 ) ) ( ON-TABLE ?auto_142977 ) ( ON ?auto_142976 ?auto_142977 ) ( ON ?auto_142975 ?auto_142976 ) ( ON ?auto_142974 ?auto_142975 ) ( ON ?auto_142973 ?auto_142974 ) ( ON ?auto_142972 ?auto_142973 ) ( CLEAR ?auto_142970 ) ( ON ?auto_142971 ?auto_142972 ) ( CLEAR ?auto_142971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_142977 ?auto_142976 ?auto_142975 ?auto_142974 ?auto_142973 ?auto_142972 )
      ( MAKE-8PILE ?auto_142970 ?auto_142971 ?auto_142972 ?auto_142973 ?auto_142974 ?auto_142975 ?auto_142976 ?auto_142977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142978 - BLOCK
      ?auto_142979 - BLOCK
      ?auto_142980 - BLOCK
      ?auto_142981 - BLOCK
      ?auto_142982 - BLOCK
      ?auto_142983 - BLOCK
      ?auto_142984 - BLOCK
      ?auto_142985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142978 ?auto_142979 ) ) ( not ( = ?auto_142978 ?auto_142980 ) ) ( not ( = ?auto_142978 ?auto_142981 ) ) ( not ( = ?auto_142978 ?auto_142982 ) ) ( not ( = ?auto_142978 ?auto_142983 ) ) ( not ( = ?auto_142978 ?auto_142984 ) ) ( not ( = ?auto_142978 ?auto_142985 ) ) ( not ( = ?auto_142979 ?auto_142980 ) ) ( not ( = ?auto_142979 ?auto_142981 ) ) ( not ( = ?auto_142979 ?auto_142982 ) ) ( not ( = ?auto_142979 ?auto_142983 ) ) ( not ( = ?auto_142979 ?auto_142984 ) ) ( not ( = ?auto_142979 ?auto_142985 ) ) ( not ( = ?auto_142980 ?auto_142981 ) ) ( not ( = ?auto_142980 ?auto_142982 ) ) ( not ( = ?auto_142980 ?auto_142983 ) ) ( not ( = ?auto_142980 ?auto_142984 ) ) ( not ( = ?auto_142980 ?auto_142985 ) ) ( not ( = ?auto_142981 ?auto_142982 ) ) ( not ( = ?auto_142981 ?auto_142983 ) ) ( not ( = ?auto_142981 ?auto_142984 ) ) ( not ( = ?auto_142981 ?auto_142985 ) ) ( not ( = ?auto_142982 ?auto_142983 ) ) ( not ( = ?auto_142982 ?auto_142984 ) ) ( not ( = ?auto_142982 ?auto_142985 ) ) ( not ( = ?auto_142983 ?auto_142984 ) ) ( not ( = ?auto_142983 ?auto_142985 ) ) ( not ( = ?auto_142984 ?auto_142985 ) ) ( ON-TABLE ?auto_142985 ) ( ON ?auto_142984 ?auto_142985 ) ( ON ?auto_142983 ?auto_142984 ) ( ON ?auto_142982 ?auto_142983 ) ( ON ?auto_142981 ?auto_142982 ) ( ON ?auto_142980 ?auto_142981 ) ( ON ?auto_142979 ?auto_142980 ) ( CLEAR ?auto_142979 ) ( HOLDING ?auto_142978 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_142978 )
      ( MAKE-8PILE ?auto_142978 ?auto_142979 ?auto_142980 ?auto_142981 ?auto_142982 ?auto_142983 ?auto_142984 ?auto_142985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_142986 - BLOCK
      ?auto_142987 - BLOCK
      ?auto_142988 - BLOCK
      ?auto_142989 - BLOCK
      ?auto_142990 - BLOCK
      ?auto_142991 - BLOCK
      ?auto_142992 - BLOCK
      ?auto_142993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_142986 ?auto_142987 ) ) ( not ( = ?auto_142986 ?auto_142988 ) ) ( not ( = ?auto_142986 ?auto_142989 ) ) ( not ( = ?auto_142986 ?auto_142990 ) ) ( not ( = ?auto_142986 ?auto_142991 ) ) ( not ( = ?auto_142986 ?auto_142992 ) ) ( not ( = ?auto_142986 ?auto_142993 ) ) ( not ( = ?auto_142987 ?auto_142988 ) ) ( not ( = ?auto_142987 ?auto_142989 ) ) ( not ( = ?auto_142987 ?auto_142990 ) ) ( not ( = ?auto_142987 ?auto_142991 ) ) ( not ( = ?auto_142987 ?auto_142992 ) ) ( not ( = ?auto_142987 ?auto_142993 ) ) ( not ( = ?auto_142988 ?auto_142989 ) ) ( not ( = ?auto_142988 ?auto_142990 ) ) ( not ( = ?auto_142988 ?auto_142991 ) ) ( not ( = ?auto_142988 ?auto_142992 ) ) ( not ( = ?auto_142988 ?auto_142993 ) ) ( not ( = ?auto_142989 ?auto_142990 ) ) ( not ( = ?auto_142989 ?auto_142991 ) ) ( not ( = ?auto_142989 ?auto_142992 ) ) ( not ( = ?auto_142989 ?auto_142993 ) ) ( not ( = ?auto_142990 ?auto_142991 ) ) ( not ( = ?auto_142990 ?auto_142992 ) ) ( not ( = ?auto_142990 ?auto_142993 ) ) ( not ( = ?auto_142991 ?auto_142992 ) ) ( not ( = ?auto_142991 ?auto_142993 ) ) ( not ( = ?auto_142992 ?auto_142993 ) ) ( ON-TABLE ?auto_142993 ) ( ON ?auto_142992 ?auto_142993 ) ( ON ?auto_142991 ?auto_142992 ) ( ON ?auto_142990 ?auto_142991 ) ( ON ?auto_142989 ?auto_142990 ) ( ON ?auto_142988 ?auto_142989 ) ( ON ?auto_142987 ?auto_142988 ) ( ON ?auto_142986 ?auto_142987 ) ( CLEAR ?auto_142986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_142993 ?auto_142992 ?auto_142991 ?auto_142990 ?auto_142989 ?auto_142988 ?auto_142987 )
      ( MAKE-8PILE ?auto_142986 ?auto_142987 ?auto_142988 ?auto_142989 ?auto_142990 ?auto_142991 ?auto_142992 ?auto_142993 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143002 - BLOCK
      ?auto_143003 - BLOCK
      ?auto_143004 - BLOCK
      ?auto_143005 - BLOCK
      ?auto_143006 - BLOCK
      ?auto_143007 - BLOCK
      ?auto_143008 - BLOCK
      ?auto_143009 - BLOCK
    )
    :vars
    (
      ?auto_143010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143002 ?auto_143003 ) ) ( not ( = ?auto_143002 ?auto_143004 ) ) ( not ( = ?auto_143002 ?auto_143005 ) ) ( not ( = ?auto_143002 ?auto_143006 ) ) ( not ( = ?auto_143002 ?auto_143007 ) ) ( not ( = ?auto_143002 ?auto_143008 ) ) ( not ( = ?auto_143002 ?auto_143009 ) ) ( not ( = ?auto_143003 ?auto_143004 ) ) ( not ( = ?auto_143003 ?auto_143005 ) ) ( not ( = ?auto_143003 ?auto_143006 ) ) ( not ( = ?auto_143003 ?auto_143007 ) ) ( not ( = ?auto_143003 ?auto_143008 ) ) ( not ( = ?auto_143003 ?auto_143009 ) ) ( not ( = ?auto_143004 ?auto_143005 ) ) ( not ( = ?auto_143004 ?auto_143006 ) ) ( not ( = ?auto_143004 ?auto_143007 ) ) ( not ( = ?auto_143004 ?auto_143008 ) ) ( not ( = ?auto_143004 ?auto_143009 ) ) ( not ( = ?auto_143005 ?auto_143006 ) ) ( not ( = ?auto_143005 ?auto_143007 ) ) ( not ( = ?auto_143005 ?auto_143008 ) ) ( not ( = ?auto_143005 ?auto_143009 ) ) ( not ( = ?auto_143006 ?auto_143007 ) ) ( not ( = ?auto_143006 ?auto_143008 ) ) ( not ( = ?auto_143006 ?auto_143009 ) ) ( not ( = ?auto_143007 ?auto_143008 ) ) ( not ( = ?auto_143007 ?auto_143009 ) ) ( not ( = ?auto_143008 ?auto_143009 ) ) ( ON-TABLE ?auto_143009 ) ( ON ?auto_143008 ?auto_143009 ) ( ON ?auto_143007 ?auto_143008 ) ( ON ?auto_143006 ?auto_143007 ) ( ON ?auto_143005 ?auto_143006 ) ( ON ?auto_143004 ?auto_143005 ) ( ON ?auto_143003 ?auto_143004 ) ( CLEAR ?auto_143003 ) ( ON ?auto_143002 ?auto_143010 ) ( CLEAR ?auto_143002 ) ( HAND-EMPTY ) ( not ( = ?auto_143002 ?auto_143010 ) ) ( not ( = ?auto_143003 ?auto_143010 ) ) ( not ( = ?auto_143004 ?auto_143010 ) ) ( not ( = ?auto_143005 ?auto_143010 ) ) ( not ( = ?auto_143006 ?auto_143010 ) ) ( not ( = ?auto_143007 ?auto_143010 ) ) ( not ( = ?auto_143008 ?auto_143010 ) ) ( not ( = ?auto_143009 ?auto_143010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_143002 ?auto_143010 )
      ( MAKE-8PILE ?auto_143002 ?auto_143003 ?auto_143004 ?auto_143005 ?auto_143006 ?auto_143007 ?auto_143008 ?auto_143009 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143011 - BLOCK
      ?auto_143012 - BLOCK
      ?auto_143013 - BLOCK
      ?auto_143014 - BLOCK
      ?auto_143015 - BLOCK
      ?auto_143016 - BLOCK
      ?auto_143017 - BLOCK
      ?auto_143018 - BLOCK
    )
    :vars
    (
      ?auto_143019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143011 ?auto_143012 ) ) ( not ( = ?auto_143011 ?auto_143013 ) ) ( not ( = ?auto_143011 ?auto_143014 ) ) ( not ( = ?auto_143011 ?auto_143015 ) ) ( not ( = ?auto_143011 ?auto_143016 ) ) ( not ( = ?auto_143011 ?auto_143017 ) ) ( not ( = ?auto_143011 ?auto_143018 ) ) ( not ( = ?auto_143012 ?auto_143013 ) ) ( not ( = ?auto_143012 ?auto_143014 ) ) ( not ( = ?auto_143012 ?auto_143015 ) ) ( not ( = ?auto_143012 ?auto_143016 ) ) ( not ( = ?auto_143012 ?auto_143017 ) ) ( not ( = ?auto_143012 ?auto_143018 ) ) ( not ( = ?auto_143013 ?auto_143014 ) ) ( not ( = ?auto_143013 ?auto_143015 ) ) ( not ( = ?auto_143013 ?auto_143016 ) ) ( not ( = ?auto_143013 ?auto_143017 ) ) ( not ( = ?auto_143013 ?auto_143018 ) ) ( not ( = ?auto_143014 ?auto_143015 ) ) ( not ( = ?auto_143014 ?auto_143016 ) ) ( not ( = ?auto_143014 ?auto_143017 ) ) ( not ( = ?auto_143014 ?auto_143018 ) ) ( not ( = ?auto_143015 ?auto_143016 ) ) ( not ( = ?auto_143015 ?auto_143017 ) ) ( not ( = ?auto_143015 ?auto_143018 ) ) ( not ( = ?auto_143016 ?auto_143017 ) ) ( not ( = ?auto_143016 ?auto_143018 ) ) ( not ( = ?auto_143017 ?auto_143018 ) ) ( ON-TABLE ?auto_143018 ) ( ON ?auto_143017 ?auto_143018 ) ( ON ?auto_143016 ?auto_143017 ) ( ON ?auto_143015 ?auto_143016 ) ( ON ?auto_143014 ?auto_143015 ) ( ON ?auto_143013 ?auto_143014 ) ( ON ?auto_143011 ?auto_143019 ) ( CLEAR ?auto_143011 ) ( not ( = ?auto_143011 ?auto_143019 ) ) ( not ( = ?auto_143012 ?auto_143019 ) ) ( not ( = ?auto_143013 ?auto_143019 ) ) ( not ( = ?auto_143014 ?auto_143019 ) ) ( not ( = ?auto_143015 ?auto_143019 ) ) ( not ( = ?auto_143016 ?auto_143019 ) ) ( not ( = ?auto_143017 ?auto_143019 ) ) ( not ( = ?auto_143018 ?auto_143019 ) ) ( HOLDING ?auto_143012 ) ( CLEAR ?auto_143013 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143018 ?auto_143017 ?auto_143016 ?auto_143015 ?auto_143014 ?auto_143013 ?auto_143012 )
      ( MAKE-8PILE ?auto_143011 ?auto_143012 ?auto_143013 ?auto_143014 ?auto_143015 ?auto_143016 ?auto_143017 ?auto_143018 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143020 - BLOCK
      ?auto_143021 - BLOCK
      ?auto_143022 - BLOCK
      ?auto_143023 - BLOCK
      ?auto_143024 - BLOCK
      ?auto_143025 - BLOCK
      ?auto_143026 - BLOCK
      ?auto_143027 - BLOCK
    )
    :vars
    (
      ?auto_143028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143020 ?auto_143021 ) ) ( not ( = ?auto_143020 ?auto_143022 ) ) ( not ( = ?auto_143020 ?auto_143023 ) ) ( not ( = ?auto_143020 ?auto_143024 ) ) ( not ( = ?auto_143020 ?auto_143025 ) ) ( not ( = ?auto_143020 ?auto_143026 ) ) ( not ( = ?auto_143020 ?auto_143027 ) ) ( not ( = ?auto_143021 ?auto_143022 ) ) ( not ( = ?auto_143021 ?auto_143023 ) ) ( not ( = ?auto_143021 ?auto_143024 ) ) ( not ( = ?auto_143021 ?auto_143025 ) ) ( not ( = ?auto_143021 ?auto_143026 ) ) ( not ( = ?auto_143021 ?auto_143027 ) ) ( not ( = ?auto_143022 ?auto_143023 ) ) ( not ( = ?auto_143022 ?auto_143024 ) ) ( not ( = ?auto_143022 ?auto_143025 ) ) ( not ( = ?auto_143022 ?auto_143026 ) ) ( not ( = ?auto_143022 ?auto_143027 ) ) ( not ( = ?auto_143023 ?auto_143024 ) ) ( not ( = ?auto_143023 ?auto_143025 ) ) ( not ( = ?auto_143023 ?auto_143026 ) ) ( not ( = ?auto_143023 ?auto_143027 ) ) ( not ( = ?auto_143024 ?auto_143025 ) ) ( not ( = ?auto_143024 ?auto_143026 ) ) ( not ( = ?auto_143024 ?auto_143027 ) ) ( not ( = ?auto_143025 ?auto_143026 ) ) ( not ( = ?auto_143025 ?auto_143027 ) ) ( not ( = ?auto_143026 ?auto_143027 ) ) ( ON-TABLE ?auto_143027 ) ( ON ?auto_143026 ?auto_143027 ) ( ON ?auto_143025 ?auto_143026 ) ( ON ?auto_143024 ?auto_143025 ) ( ON ?auto_143023 ?auto_143024 ) ( ON ?auto_143022 ?auto_143023 ) ( ON ?auto_143020 ?auto_143028 ) ( not ( = ?auto_143020 ?auto_143028 ) ) ( not ( = ?auto_143021 ?auto_143028 ) ) ( not ( = ?auto_143022 ?auto_143028 ) ) ( not ( = ?auto_143023 ?auto_143028 ) ) ( not ( = ?auto_143024 ?auto_143028 ) ) ( not ( = ?auto_143025 ?auto_143028 ) ) ( not ( = ?auto_143026 ?auto_143028 ) ) ( not ( = ?auto_143027 ?auto_143028 ) ) ( CLEAR ?auto_143022 ) ( ON ?auto_143021 ?auto_143020 ) ( CLEAR ?auto_143021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_143028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143028 ?auto_143020 )
      ( MAKE-8PILE ?auto_143020 ?auto_143021 ?auto_143022 ?auto_143023 ?auto_143024 ?auto_143025 ?auto_143026 ?auto_143027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143029 - BLOCK
      ?auto_143030 - BLOCK
      ?auto_143031 - BLOCK
      ?auto_143032 - BLOCK
      ?auto_143033 - BLOCK
      ?auto_143034 - BLOCK
      ?auto_143035 - BLOCK
      ?auto_143036 - BLOCK
    )
    :vars
    (
      ?auto_143037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143029 ?auto_143030 ) ) ( not ( = ?auto_143029 ?auto_143031 ) ) ( not ( = ?auto_143029 ?auto_143032 ) ) ( not ( = ?auto_143029 ?auto_143033 ) ) ( not ( = ?auto_143029 ?auto_143034 ) ) ( not ( = ?auto_143029 ?auto_143035 ) ) ( not ( = ?auto_143029 ?auto_143036 ) ) ( not ( = ?auto_143030 ?auto_143031 ) ) ( not ( = ?auto_143030 ?auto_143032 ) ) ( not ( = ?auto_143030 ?auto_143033 ) ) ( not ( = ?auto_143030 ?auto_143034 ) ) ( not ( = ?auto_143030 ?auto_143035 ) ) ( not ( = ?auto_143030 ?auto_143036 ) ) ( not ( = ?auto_143031 ?auto_143032 ) ) ( not ( = ?auto_143031 ?auto_143033 ) ) ( not ( = ?auto_143031 ?auto_143034 ) ) ( not ( = ?auto_143031 ?auto_143035 ) ) ( not ( = ?auto_143031 ?auto_143036 ) ) ( not ( = ?auto_143032 ?auto_143033 ) ) ( not ( = ?auto_143032 ?auto_143034 ) ) ( not ( = ?auto_143032 ?auto_143035 ) ) ( not ( = ?auto_143032 ?auto_143036 ) ) ( not ( = ?auto_143033 ?auto_143034 ) ) ( not ( = ?auto_143033 ?auto_143035 ) ) ( not ( = ?auto_143033 ?auto_143036 ) ) ( not ( = ?auto_143034 ?auto_143035 ) ) ( not ( = ?auto_143034 ?auto_143036 ) ) ( not ( = ?auto_143035 ?auto_143036 ) ) ( ON-TABLE ?auto_143036 ) ( ON ?auto_143035 ?auto_143036 ) ( ON ?auto_143034 ?auto_143035 ) ( ON ?auto_143033 ?auto_143034 ) ( ON ?auto_143032 ?auto_143033 ) ( ON ?auto_143029 ?auto_143037 ) ( not ( = ?auto_143029 ?auto_143037 ) ) ( not ( = ?auto_143030 ?auto_143037 ) ) ( not ( = ?auto_143031 ?auto_143037 ) ) ( not ( = ?auto_143032 ?auto_143037 ) ) ( not ( = ?auto_143033 ?auto_143037 ) ) ( not ( = ?auto_143034 ?auto_143037 ) ) ( not ( = ?auto_143035 ?auto_143037 ) ) ( not ( = ?auto_143036 ?auto_143037 ) ) ( ON ?auto_143030 ?auto_143029 ) ( CLEAR ?auto_143030 ) ( ON-TABLE ?auto_143037 ) ( HOLDING ?auto_143031 ) ( CLEAR ?auto_143032 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143036 ?auto_143035 ?auto_143034 ?auto_143033 ?auto_143032 ?auto_143031 )
      ( MAKE-8PILE ?auto_143029 ?auto_143030 ?auto_143031 ?auto_143032 ?auto_143033 ?auto_143034 ?auto_143035 ?auto_143036 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143038 - BLOCK
      ?auto_143039 - BLOCK
      ?auto_143040 - BLOCK
      ?auto_143041 - BLOCK
      ?auto_143042 - BLOCK
      ?auto_143043 - BLOCK
      ?auto_143044 - BLOCK
      ?auto_143045 - BLOCK
    )
    :vars
    (
      ?auto_143046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143038 ?auto_143039 ) ) ( not ( = ?auto_143038 ?auto_143040 ) ) ( not ( = ?auto_143038 ?auto_143041 ) ) ( not ( = ?auto_143038 ?auto_143042 ) ) ( not ( = ?auto_143038 ?auto_143043 ) ) ( not ( = ?auto_143038 ?auto_143044 ) ) ( not ( = ?auto_143038 ?auto_143045 ) ) ( not ( = ?auto_143039 ?auto_143040 ) ) ( not ( = ?auto_143039 ?auto_143041 ) ) ( not ( = ?auto_143039 ?auto_143042 ) ) ( not ( = ?auto_143039 ?auto_143043 ) ) ( not ( = ?auto_143039 ?auto_143044 ) ) ( not ( = ?auto_143039 ?auto_143045 ) ) ( not ( = ?auto_143040 ?auto_143041 ) ) ( not ( = ?auto_143040 ?auto_143042 ) ) ( not ( = ?auto_143040 ?auto_143043 ) ) ( not ( = ?auto_143040 ?auto_143044 ) ) ( not ( = ?auto_143040 ?auto_143045 ) ) ( not ( = ?auto_143041 ?auto_143042 ) ) ( not ( = ?auto_143041 ?auto_143043 ) ) ( not ( = ?auto_143041 ?auto_143044 ) ) ( not ( = ?auto_143041 ?auto_143045 ) ) ( not ( = ?auto_143042 ?auto_143043 ) ) ( not ( = ?auto_143042 ?auto_143044 ) ) ( not ( = ?auto_143042 ?auto_143045 ) ) ( not ( = ?auto_143043 ?auto_143044 ) ) ( not ( = ?auto_143043 ?auto_143045 ) ) ( not ( = ?auto_143044 ?auto_143045 ) ) ( ON-TABLE ?auto_143045 ) ( ON ?auto_143044 ?auto_143045 ) ( ON ?auto_143043 ?auto_143044 ) ( ON ?auto_143042 ?auto_143043 ) ( ON ?auto_143041 ?auto_143042 ) ( ON ?auto_143038 ?auto_143046 ) ( not ( = ?auto_143038 ?auto_143046 ) ) ( not ( = ?auto_143039 ?auto_143046 ) ) ( not ( = ?auto_143040 ?auto_143046 ) ) ( not ( = ?auto_143041 ?auto_143046 ) ) ( not ( = ?auto_143042 ?auto_143046 ) ) ( not ( = ?auto_143043 ?auto_143046 ) ) ( not ( = ?auto_143044 ?auto_143046 ) ) ( not ( = ?auto_143045 ?auto_143046 ) ) ( ON ?auto_143039 ?auto_143038 ) ( ON-TABLE ?auto_143046 ) ( CLEAR ?auto_143041 ) ( ON ?auto_143040 ?auto_143039 ) ( CLEAR ?auto_143040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143046 ?auto_143038 ?auto_143039 )
      ( MAKE-8PILE ?auto_143038 ?auto_143039 ?auto_143040 ?auto_143041 ?auto_143042 ?auto_143043 ?auto_143044 ?auto_143045 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143047 - BLOCK
      ?auto_143048 - BLOCK
      ?auto_143049 - BLOCK
      ?auto_143050 - BLOCK
      ?auto_143051 - BLOCK
      ?auto_143052 - BLOCK
      ?auto_143053 - BLOCK
      ?auto_143054 - BLOCK
    )
    :vars
    (
      ?auto_143055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143047 ?auto_143048 ) ) ( not ( = ?auto_143047 ?auto_143049 ) ) ( not ( = ?auto_143047 ?auto_143050 ) ) ( not ( = ?auto_143047 ?auto_143051 ) ) ( not ( = ?auto_143047 ?auto_143052 ) ) ( not ( = ?auto_143047 ?auto_143053 ) ) ( not ( = ?auto_143047 ?auto_143054 ) ) ( not ( = ?auto_143048 ?auto_143049 ) ) ( not ( = ?auto_143048 ?auto_143050 ) ) ( not ( = ?auto_143048 ?auto_143051 ) ) ( not ( = ?auto_143048 ?auto_143052 ) ) ( not ( = ?auto_143048 ?auto_143053 ) ) ( not ( = ?auto_143048 ?auto_143054 ) ) ( not ( = ?auto_143049 ?auto_143050 ) ) ( not ( = ?auto_143049 ?auto_143051 ) ) ( not ( = ?auto_143049 ?auto_143052 ) ) ( not ( = ?auto_143049 ?auto_143053 ) ) ( not ( = ?auto_143049 ?auto_143054 ) ) ( not ( = ?auto_143050 ?auto_143051 ) ) ( not ( = ?auto_143050 ?auto_143052 ) ) ( not ( = ?auto_143050 ?auto_143053 ) ) ( not ( = ?auto_143050 ?auto_143054 ) ) ( not ( = ?auto_143051 ?auto_143052 ) ) ( not ( = ?auto_143051 ?auto_143053 ) ) ( not ( = ?auto_143051 ?auto_143054 ) ) ( not ( = ?auto_143052 ?auto_143053 ) ) ( not ( = ?auto_143052 ?auto_143054 ) ) ( not ( = ?auto_143053 ?auto_143054 ) ) ( ON-TABLE ?auto_143054 ) ( ON ?auto_143053 ?auto_143054 ) ( ON ?auto_143052 ?auto_143053 ) ( ON ?auto_143051 ?auto_143052 ) ( ON ?auto_143047 ?auto_143055 ) ( not ( = ?auto_143047 ?auto_143055 ) ) ( not ( = ?auto_143048 ?auto_143055 ) ) ( not ( = ?auto_143049 ?auto_143055 ) ) ( not ( = ?auto_143050 ?auto_143055 ) ) ( not ( = ?auto_143051 ?auto_143055 ) ) ( not ( = ?auto_143052 ?auto_143055 ) ) ( not ( = ?auto_143053 ?auto_143055 ) ) ( not ( = ?auto_143054 ?auto_143055 ) ) ( ON ?auto_143048 ?auto_143047 ) ( ON-TABLE ?auto_143055 ) ( ON ?auto_143049 ?auto_143048 ) ( CLEAR ?auto_143049 ) ( HOLDING ?auto_143050 ) ( CLEAR ?auto_143051 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143054 ?auto_143053 ?auto_143052 ?auto_143051 ?auto_143050 )
      ( MAKE-8PILE ?auto_143047 ?auto_143048 ?auto_143049 ?auto_143050 ?auto_143051 ?auto_143052 ?auto_143053 ?auto_143054 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143056 - BLOCK
      ?auto_143057 - BLOCK
      ?auto_143058 - BLOCK
      ?auto_143059 - BLOCK
      ?auto_143060 - BLOCK
      ?auto_143061 - BLOCK
      ?auto_143062 - BLOCK
      ?auto_143063 - BLOCK
    )
    :vars
    (
      ?auto_143064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143056 ?auto_143057 ) ) ( not ( = ?auto_143056 ?auto_143058 ) ) ( not ( = ?auto_143056 ?auto_143059 ) ) ( not ( = ?auto_143056 ?auto_143060 ) ) ( not ( = ?auto_143056 ?auto_143061 ) ) ( not ( = ?auto_143056 ?auto_143062 ) ) ( not ( = ?auto_143056 ?auto_143063 ) ) ( not ( = ?auto_143057 ?auto_143058 ) ) ( not ( = ?auto_143057 ?auto_143059 ) ) ( not ( = ?auto_143057 ?auto_143060 ) ) ( not ( = ?auto_143057 ?auto_143061 ) ) ( not ( = ?auto_143057 ?auto_143062 ) ) ( not ( = ?auto_143057 ?auto_143063 ) ) ( not ( = ?auto_143058 ?auto_143059 ) ) ( not ( = ?auto_143058 ?auto_143060 ) ) ( not ( = ?auto_143058 ?auto_143061 ) ) ( not ( = ?auto_143058 ?auto_143062 ) ) ( not ( = ?auto_143058 ?auto_143063 ) ) ( not ( = ?auto_143059 ?auto_143060 ) ) ( not ( = ?auto_143059 ?auto_143061 ) ) ( not ( = ?auto_143059 ?auto_143062 ) ) ( not ( = ?auto_143059 ?auto_143063 ) ) ( not ( = ?auto_143060 ?auto_143061 ) ) ( not ( = ?auto_143060 ?auto_143062 ) ) ( not ( = ?auto_143060 ?auto_143063 ) ) ( not ( = ?auto_143061 ?auto_143062 ) ) ( not ( = ?auto_143061 ?auto_143063 ) ) ( not ( = ?auto_143062 ?auto_143063 ) ) ( ON-TABLE ?auto_143063 ) ( ON ?auto_143062 ?auto_143063 ) ( ON ?auto_143061 ?auto_143062 ) ( ON ?auto_143060 ?auto_143061 ) ( ON ?auto_143056 ?auto_143064 ) ( not ( = ?auto_143056 ?auto_143064 ) ) ( not ( = ?auto_143057 ?auto_143064 ) ) ( not ( = ?auto_143058 ?auto_143064 ) ) ( not ( = ?auto_143059 ?auto_143064 ) ) ( not ( = ?auto_143060 ?auto_143064 ) ) ( not ( = ?auto_143061 ?auto_143064 ) ) ( not ( = ?auto_143062 ?auto_143064 ) ) ( not ( = ?auto_143063 ?auto_143064 ) ) ( ON ?auto_143057 ?auto_143056 ) ( ON-TABLE ?auto_143064 ) ( ON ?auto_143058 ?auto_143057 ) ( CLEAR ?auto_143060 ) ( ON ?auto_143059 ?auto_143058 ) ( CLEAR ?auto_143059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143064 ?auto_143056 ?auto_143057 ?auto_143058 )
      ( MAKE-8PILE ?auto_143056 ?auto_143057 ?auto_143058 ?auto_143059 ?auto_143060 ?auto_143061 ?auto_143062 ?auto_143063 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143065 - BLOCK
      ?auto_143066 - BLOCK
      ?auto_143067 - BLOCK
      ?auto_143068 - BLOCK
      ?auto_143069 - BLOCK
      ?auto_143070 - BLOCK
      ?auto_143071 - BLOCK
      ?auto_143072 - BLOCK
    )
    :vars
    (
      ?auto_143073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143065 ?auto_143066 ) ) ( not ( = ?auto_143065 ?auto_143067 ) ) ( not ( = ?auto_143065 ?auto_143068 ) ) ( not ( = ?auto_143065 ?auto_143069 ) ) ( not ( = ?auto_143065 ?auto_143070 ) ) ( not ( = ?auto_143065 ?auto_143071 ) ) ( not ( = ?auto_143065 ?auto_143072 ) ) ( not ( = ?auto_143066 ?auto_143067 ) ) ( not ( = ?auto_143066 ?auto_143068 ) ) ( not ( = ?auto_143066 ?auto_143069 ) ) ( not ( = ?auto_143066 ?auto_143070 ) ) ( not ( = ?auto_143066 ?auto_143071 ) ) ( not ( = ?auto_143066 ?auto_143072 ) ) ( not ( = ?auto_143067 ?auto_143068 ) ) ( not ( = ?auto_143067 ?auto_143069 ) ) ( not ( = ?auto_143067 ?auto_143070 ) ) ( not ( = ?auto_143067 ?auto_143071 ) ) ( not ( = ?auto_143067 ?auto_143072 ) ) ( not ( = ?auto_143068 ?auto_143069 ) ) ( not ( = ?auto_143068 ?auto_143070 ) ) ( not ( = ?auto_143068 ?auto_143071 ) ) ( not ( = ?auto_143068 ?auto_143072 ) ) ( not ( = ?auto_143069 ?auto_143070 ) ) ( not ( = ?auto_143069 ?auto_143071 ) ) ( not ( = ?auto_143069 ?auto_143072 ) ) ( not ( = ?auto_143070 ?auto_143071 ) ) ( not ( = ?auto_143070 ?auto_143072 ) ) ( not ( = ?auto_143071 ?auto_143072 ) ) ( ON-TABLE ?auto_143072 ) ( ON ?auto_143071 ?auto_143072 ) ( ON ?auto_143070 ?auto_143071 ) ( ON ?auto_143065 ?auto_143073 ) ( not ( = ?auto_143065 ?auto_143073 ) ) ( not ( = ?auto_143066 ?auto_143073 ) ) ( not ( = ?auto_143067 ?auto_143073 ) ) ( not ( = ?auto_143068 ?auto_143073 ) ) ( not ( = ?auto_143069 ?auto_143073 ) ) ( not ( = ?auto_143070 ?auto_143073 ) ) ( not ( = ?auto_143071 ?auto_143073 ) ) ( not ( = ?auto_143072 ?auto_143073 ) ) ( ON ?auto_143066 ?auto_143065 ) ( ON-TABLE ?auto_143073 ) ( ON ?auto_143067 ?auto_143066 ) ( ON ?auto_143068 ?auto_143067 ) ( CLEAR ?auto_143068 ) ( HOLDING ?auto_143069 ) ( CLEAR ?auto_143070 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_143072 ?auto_143071 ?auto_143070 ?auto_143069 )
      ( MAKE-8PILE ?auto_143065 ?auto_143066 ?auto_143067 ?auto_143068 ?auto_143069 ?auto_143070 ?auto_143071 ?auto_143072 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143074 - BLOCK
      ?auto_143075 - BLOCK
      ?auto_143076 - BLOCK
      ?auto_143077 - BLOCK
      ?auto_143078 - BLOCK
      ?auto_143079 - BLOCK
      ?auto_143080 - BLOCK
      ?auto_143081 - BLOCK
    )
    :vars
    (
      ?auto_143082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143074 ?auto_143075 ) ) ( not ( = ?auto_143074 ?auto_143076 ) ) ( not ( = ?auto_143074 ?auto_143077 ) ) ( not ( = ?auto_143074 ?auto_143078 ) ) ( not ( = ?auto_143074 ?auto_143079 ) ) ( not ( = ?auto_143074 ?auto_143080 ) ) ( not ( = ?auto_143074 ?auto_143081 ) ) ( not ( = ?auto_143075 ?auto_143076 ) ) ( not ( = ?auto_143075 ?auto_143077 ) ) ( not ( = ?auto_143075 ?auto_143078 ) ) ( not ( = ?auto_143075 ?auto_143079 ) ) ( not ( = ?auto_143075 ?auto_143080 ) ) ( not ( = ?auto_143075 ?auto_143081 ) ) ( not ( = ?auto_143076 ?auto_143077 ) ) ( not ( = ?auto_143076 ?auto_143078 ) ) ( not ( = ?auto_143076 ?auto_143079 ) ) ( not ( = ?auto_143076 ?auto_143080 ) ) ( not ( = ?auto_143076 ?auto_143081 ) ) ( not ( = ?auto_143077 ?auto_143078 ) ) ( not ( = ?auto_143077 ?auto_143079 ) ) ( not ( = ?auto_143077 ?auto_143080 ) ) ( not ( = ?auto_143077 ?auto_143081 ) ) ( not ( = ?auto_143078 ?auto_143079 ) ) ( not ( = ?auto_143078 ?auto_143080 ) ) ( not ( = ?auto_143078 ?auto_143081 ) ) ( not ( = ?auto_143079 ?auto_143080 ) ) ( not ( = ?auto_143079 ?auto_143081 ) ) ( not ( = ?auto_143080 ?auto_143081 ) ) ( ON-TABLE ?auto_143081 ) ( ON ?auto_143080 ?auto_143081 ) ( ON ?auto_143079 ?auto_143080 ) ( ON ?auto_143074 ?auto_143082 ) ( not ( = ?auto_143074 ?auto_143082 ) ) ( not ( = ?auto_143075 ?auto_143082 ) ) ( not ( = ?auto_143076 ?auto_143082 ) ) ( not ( = ?auto_143077 ?auto_143082 ) ) ( not ( = ?auto_143078 ?auto_143082 ) ) ( not ( = ?auto_143079 ?auto_143082 ) ) ( not ( = ?auto_143080 ?auto_143082 ) ) ( not ( = ?auto_143081 ?auto_143082 ) ) ( ON ?auto_143075 ?auto_143074 ) ( ON-TABLE ?auto_143082 ) ( ON ?auto_143076 ?auto_143075 ) ( ON ?auto_143077 ?auto_143076 ) ( CLEAR ?auto_143079 ) ( ON ?auto_143078 ?auto_143077 ) ( CLEAR ?auto_143078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_143082 ?auto_143074 ?auto_143075 ?auto_143076 ?auto_143077 )
      ( MAKE-8PILE ?auto_143074 ?auto_143075 ?auto_143076 ?auto_143077 ?auto_143078 ?auto_143079 ?auto_143080 ?auto_143081 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143083 - BLOCK
      ?auto_143084 - BLOCK
      ?auto_143085 - BLOCK
      ?auto_143086 - BLOCK
      ?auto_143087 - BLOCK
      ?auto_143088 - BLOCK
      ?auto_143089 - BLOCK
      ?auto_143090 - BLOCK
    )
    :vars
    (
      ?auto_143091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143083 ?auto_143084 ) ) ( not ( = ?auto_143083 ?auto_143085 ) ) ( not ( = ?auto_143083 ?auto_143086 ) ) ( not ( = ?auto_143083 ?auto_143087 ) ) ( not ( = ?auto_143083 ?auto_143088 ) ) ( not ( = ?auto_143083 ?auto_143089 ) ) ( not ( = ?auto_143083 ?auto_143090 ) ) ( not ( = ?auto_143084 ?auto_143085 ) ) ( not ( = ?auto_143084 ?auto_143086 ) ) ( not ( = ?auto_143084 ?auto_143087 ) ) ( not ( = ?auto_143084 ?auto_143088 ) ) ( not ( = ?auto_143084 ?auto_143089 ) ) ( not ( = ?auto_143084 ?auto_143090 ) ) ( not ( = ?auto_143085 ?auto_143086 ) ) ( not ( = ?auto_143085 ?auto_143087 ) ) ( not ( = ?auto_143085 ?auto_143088 ) ) ( not ( = ?auto_143085 ?auto_143089 ) ) ( not ( = ?auto_143085 ?auto_143090 ) ) ( not ( = ?auto_143086 ?auto_143087 ) ) ( not ( = ?auto_143086 ?auto_143088 ) ) ( not ( = ?auto_143086 ?auto_143089 ) ) ( not ( = ?auto_143086 ?auto_143090 ) ) ( not ( = ?auto_143087 ?auto_143088 ) ) ( not ( = ?auto_143087 ?auto_143089 ) ) ( not ( = ?auto_143087 ?auto_143090 ) ) ( not ( = ?auto_143088 ?auto_143089 ) ) ( not ( = ?auto_143088 ?auto_143090 ) ) ( not ( = ?auto_143089 ?auto_143090 ) ) ( ON-TABLE ?auto_143090 ) ( ON ?auto_143089 ?auto_143090 ) ( ON ?auto_143083 ?auto_143091 ) ( not ( = ?auto_143083 ?auto_143091 ) ) ( not ( = ?auto_143084 ?auto_143091 ) ) ( not ( = ?auto_143085 ?auto_143091 ) ) ( not ( = ?auto_143086 ?auto_143091 ) ) ( not ( = ?auto_143087 ?auto_143091 ) ) ( not ( = ?auto_143088 ?auto_143091 ) ) ( not ( = ?auto_143089 ?auto_143091 ) ) ( not ( = ?auto_143090 ?auto_143091 ) ) ( ON ?auto_143084 ?auto_143083 ) ( ON-TABLE ?auto_143091 ) ( ON ?auto_143085 ?auto_143084 ) ( ON ?auto_143086 ?auto_143085 ) ( ON ?auto_143087 ?auto_143086 ) ( CLEAR ?auto_143087 ) ( HOLDING ?auto_143088 ) ( CLEAR ?auto_143089 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_143090 ?auto_143089 ?auto_143088 )
      ( MAKE-8PILE ?auto_143083 ?auto_143084 ?auto_143085 ?auto_143086 ?auto_143087 ?auto_143088 ?auto_143089 ?auto_143090 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143092 - BLOCK
      ?auto_143093 - BLOCK
      ?auto_143094 - BLOCK
      ?auto_143095 - BLOCK
      ?auto_143096 - BLOCK
      ?auto_143097 - BLOCK
      ?auto_143098 - BLOCK
      ?auto_143099 - BLOCK
    )
    :vars
    (
      ?auto_143100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143092 ?auto_143093 ) ) ( not ( = ?auto_143092 ?auto_143094 ) ) ( not ( = ?auto_143092 ?auto_143095 ) ) ( not ( = ?auto_143092 ?auto_143096 ) ) ( not ( = ?auto_143092 ?auto_143097 ) ) ( not ( = ?auto_143092 ?auto_143098 ) ) ( not ( = ?auto_143092 ?auto_143099 ) ) ( not ( = ?auto_143093 ?auto_143094 ) ) ( not ( = ?auto_143093 ?auto_143095 ) ) ( not ( = ?auto_143093 ?auto_143096 ) ) ( not ( = ?auto_143093 ?auto_143097 ) ) ( not ( = ?auto_143093 ?auto_143098 ) ) ( not ( = ?auto_143093 ?auto_143099 ) ) ( not ( = ?auto_143094 ?auto_143095 ) ) ( not ( = ?auto_143094 ?auto_143096 ) ) ( not ( = ?auto_143094 ?auto_143097 ) ) ( not ( = ?auto_143094 ?auto_143098 ) ) ( not ( = ?auto_143094 ?auto_143099 ) ) ( not ( = ?auto_143095 ?auto_143096 ) ) ( not ( = ?auto_143095 ?auto_143097 ) ) ( not ( = ?auto_143095 ?auto_143098 ) ) ( not ( = ?auto_143095 ?auto_143099 ) ) ( not ( = ?auto_143096 ?auto_143097 ) ) ( not ( = ?auto_143096 ?auto_143098 ) ) ( not ( = ?auto_143096 ?auto_143099 ) ) ( not ( = ?auto_143097 ?auto_143098 ) ) ( not ( = ?auto_143097 ?auto_143099 ) ) ( not ( = ?auto_143098 ?auto_143099 ) ) ( ON-TABLE ?auto_143099 ) ( ON ?auto_143098 ?auto_143099 ) ( ON ?auto_143092 ?auto_143100 ) ( not ( = ?auto_143092 ?auto_143100 ) ) ( not ( = ?auto_143093 ?auto_143100 ) ) ( not ( = ?auto_143094 ?auto_143100 ) ) ( not ( = ?auto_143095 ?auto_143100 ) ) ( not ( = ?auto_143096 ?auto_143100 ) ) ( not ( = ?auto_143097 ?auto_143100 ) ) ( not ( = ?auto_143098 ?auto_143100 ) ) ( not ( = ?auto_143099 ?auto_143100 ) ) ( ON ?auto_143093 ?auto_143092 ) ( ON-TABLE ?auto_143100 ) ( ON ?auto_143094 ?auto_143093 ) ( ON ?auto_143095 ?auto_143094 ) ( ON ?auto_143096 ?auto_143095 ) ( CLEAR ?auto_143098 ) ( ON ?auto_143097 ?auto_143096 ) ( CLEAR ?auto_143097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_143100 ?auto_143092 ?auto_143093 ?auto_143094 ?auto_143095 ?auto_143096 )
      ( MAKE-8PILE ?auto_143092 ?auto_143093 ?auto_143094 ?auto_143095 ?auto_143096 ?auto_143097 ?auto_143098 ?auto_143099 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143101 - BLOCK
      ?auto_143102 - BLOCK
      ?auto_143103 - BLOCK
      ?auto_143104 - BLOCK
      ?auto_143105 - BLOCK
      ?auto_143106 - BLOCK
      ?auto_143107 - BLOCK
      ?auto_143108 - BLOCK
    )
    :vars
    (
      ?auto_143109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143101 ?auto_143102 ) ) ( not ( = ?auto_143101 ?auto_143103 ) ) ( not ( = ?auto_143101 ?auto_143104 ) ) ( not ( = ?auto_143101 ?auto_143105 ) ) ( not ( = ?auto_143101 ?auto_143106 ) ) ( not ( = ?auto_143101 ?auto_143107 ) ) ( not ( = ?auto_143101 ?auto_143108 ) ) ( not ( = ?auto_143102 ?auto_143103 ) ) ( not ( = ?auto_143102 ?auto_143104 ) ) ( not ( = ?auto_143102 ?auto_143105 ) ) ( not ( = ?auto_143102 ?auto_143106 ) ) ( not ( = ?auto_143102 ?auto_143107 ) ) ( not ( = ?auto_143102 ?auto_143108 ) ) ( not ( = ?auto_143103 ?auto_143104 ) ) ( not ( = ?auto_143103 ?auto_143105 ) ) ( not ( = ?auto_143103 ?auto_143106 ) ) ( not ( = ?auto_143103 ?auto_143107 ) ) ( not ( = ?auto_143103 ?auto_143108 ) ) ( not ( = ?auto_143104 ?auto_143105 ) ) ( not ( = ?auto_143104 ?auto_143106 ) ) ( not ( = ?auto_143104 ?auto_143107 ) ) ( not ( = ?auto_143104 ?auto_143108 ) ) ( not ( = ?auto_143105 ?auto_143106 ) ) ( not ( = ?auto_143105 ?auto_143107 ) ) ( not ( = ?auto_143105 ?auto_143108 ) ) ( not ( = ?auto_143106 ?auto_143107 ) ) ( not ( = ?auto_143106 ?auto_143108 ) ) ( not ( = ?auto_143107 ?auto_143108 ) ) ( ON-TABLE ?auto_143108 ) ( ON ?auto_143101 ?auto_143109 ) ( not ( = ?auto_143101 ?auto_143109 ) ) ( not ( = ?auto_143102 ?auto_143109 ) ) ( not ( = ?auto_143103 ?auto_143109 ) ) ( not ( = ?auto_143104 ?auto_143109 ) ) ( not ( = ?auto_143105 ?auto_143109 ) ) ( not ( = ?auto_143106 ?auto_143109 ) ) ( not ( = ?auto_143107 ?auto_143109 ) ) ( not ( = ?auto_143108 ?auto_143109 ) ) ( ON ?auto_143102 ?auto_143101 ) ( ON-TABLE ?auto_143109 ) ( ON ?auto_143103 ?auto_143102 ) ( ON ?auto_143104 ?auto_143103 ) ( ON ?auto_143105 ?auto_143104 ) ( ON ?auto_143106 ?auto_143105 ) ( CLEAR ?auto_143106 ) ( HOLDING ?auto_143107 ) ( CLEAR ?auto_143108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_143108 ?auto_143107 )
      ( MAKE-8PILE ?auto_143101 ?auto_143102 ?auto_143103 ?auto_143104 ?auto_143105 ?auto_143106 ?auto_143107 ?auto_143108 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143110 - BLOCK
      ?auto_143111 - BLOCK
      ?auto_143112 - BLOCK
      ?auto_143113 - BLOCK
      ?auto_143114 - BLOCK
      ?auto_143115 - BLOCK
      ?auto_143116 - BLOCK
      ?auto_143117 - BLOCK
    )
    :vars
    (
      ?auto_143118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143110 ?auto_143111 ) ) ( not ( = ?auto_143110 ?auto_143112 ) ) ( not ( = ?auto_143110 ?auto_143113 ) ) ( not ( = ?auto_143110 ?auto_143114 ) ) ( not ( = ?auto_143110 ?auto_143115 ) ) ( not ( = ?auto_143110 ?auto_143116 ) ) ( not ( = ?auto_143110 ?auto_143117 ) ) ( not ( = ?auto_143111 ?auto_143112 ) ) ( not ( = ?auto_143111 ?auto_143113 ) ) ( not ( = ?auto_143111 ?auto_143114 ) ) ( not ( = ?auto_143111 ?auto_143115 ) ) ( not ( = ?auto_143111 ?auto_143116 ) ) ( not ( = ?auto_143111 ?auto_143117 ) ) ( not ( = ?auto_143112 ?auto_143113 ) ) ( not ( = ?auto_143112 ?auto_143114 ) ) ( not ( = ?auto_143112 ?auto_143115 ) ) ( not ( = ?auto_143112 ?auto_143116 ) ) ( not ( = ?auto_143112 ?auto_143117 ) ) ( not ( = ?auto_143113 ?auto_143114 ) ) ( not ( = ?auto_143113 ?auto_143115 ) ) ( not ( = ?auto_143113 ?auto_143116 ) ) ( not ( = ?auto_143113 ?auto_143117 ) ) ( not ( = ?auto_143114 ?auto_143115 ) ) ( not ( = ?auto_143114 ?auto_143116 ) ) ( not ( = ?auto_143114 ?auto_143117 ) ) ( not ( = ?auto_143115 ?auto_143116 ) ) ( not ( = ?auto_143115 ?auto_143117 ) ) ( not ( = ?auto_143116 ?auto_143117 ) ) ( ON-TABLE ?auto_143117 ) ( ON ?auto_143110 ?auto_143118 ) ( not ( = ?auto_143110 ?auto_143118 ) ) ( not ( = ?auto_143111 ?auto_143118 ) ) ( not ( = ?auto_143112 ?auto_143118 ) ) ( not ( = ?auto_143113 ?auto_143118 ) ) ( not ( = ?auto_143114 ?auto_143118 ) ) ( not ( = ?auto_143115 ?auto_143118 ) ) ( not ( = ?auto_143116 ?auto_143118 ) ) ( not ( = ?auto_143117 ?auto_143118 ) ) ( ON ?auto_143111 ?auto_143110 ) ( ON-TABLE ?auto_143118 ) ( ON ?auto_143112 ?auto_143111 ) ( ON ?auto_143113 ?auto_143112 ) ( ON ?auto_143114 ?auto_143113 ) ( ON ?auto_143115 ?auto_143114 ) ( CLEAR ?auto_143117 ) ( ON ?auto_143116 ?auto_143115 ) ( CLEAR ?auto_143116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_143118 ?auto_143110 ?auto_143111 ?auto_143112 ?auto_143113 ?auto_143114 ?auto_143115 )
      ( MAKE-8PILE ?auto_143110 ?auto_143111 ?auto_143112 ?auto_143113 ?auto_143114 ?auto_143115 ?auto_143116 ?auto_143117 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143119 - BLOCK
      ?auto_143120 - BLOCK
      ?auto_143121 - BLOCK
      ?auto_143122 - BLOCK
      ?auto_143123 - BLOCK
      ?auto_143124 - BLOCK
      ?auto_143125 - BLOCK
      ?auto_143126 - BLOCK
    )
    :vars
    (
      ?auto_143127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143119 ?auto_143120 ) ) ( not ( = ?auto_143119 ?auto_143121 ) ) ( not ( = ?auto_143119 ?auto_143122 ) ) ( not ( = ?auto_143119 ?auto_143123 ) ) ( not ( = ?auto_143119 ?auto_143124 ) ) ( not ( = ?auto_143119 ?auto_143125 ) ) ( not ( = ?auto_143119 ?auto_143126 ) ) ( not ( = ?auto_143120 ?auto_143121 ) ) ( not ( = ?auto_143120 ?auto_143122 ) ) ( not ( = ?auto_143120 ?auto_143123 ) ) ( not ( = ?auto_143120 ?auto_143124 ) ) ( not ( = ?auto_143120 ?auto_143125 ) ) ( not ( = ?auto_143120 ?auto_143126 ) ) ( not ( = ?auto_143121 ?auto_143122 ) ) ( not ( = ?auto_143121 ?auto_143123 ) ) ( not ( = ?auto_143121 ?auto_143124 ) ) ( not ( = ?auto_143121 ?auto_143125 ) ) ( not ( = ?auto_143121 ?auto_143126 ) ) ( not ( = ?auto_143122 ?auto_143123 ) ) ( not ( = ?auto_143122 ?auto_143124 ) ) ( not ( = ?auto_143122 ?auto_143125 ) ) ( not ( = ?auto_143122 ?auto_143126 ) ) ( not ( = ?auto_143123 ?auto_143124 ) ) ( not ( = ?auto_143123 ?auto_143125 ) ) ( not ( = ?auto_143123 ?auto_143126 ) ) ( not ( = ?auto_143124 ?auto_143125 ) ) ( not ( = ?auto_143124 ?auto_143126 ) ) ( not ( = ?auto_143125 ?auto_143126 ) ) ( ON ?auto_143119 ?auto_143127 ) ( not ( = ?auto_143119 ?auto_143127 ) ) ( not ( = ?auto_143120 ?auto_143127 ) ) ( not ( = ?auto_143121 ?auto_143127 ) ) ( not ( = ?auto_143122 ?auto_143127 ) ) ( not ( = ?auto_143123 ?auto_143127 ) ) ( not ( = ?auto_143124 ?auto_143127 ) ) ( not ( = ?auto_143125 ?auto_143127 ) ) ( not ( = ?auto_143126 ?auto_143127 ) ) ( ON ?auto_143120 ?auto_143119 ) ( ON-TABLE ?auto_143127 ) ( ON ?auto_143121 ?auto_143120 ) ( ON ?auto_143122 ?auto_143121 ) ( ON ?auto_143123 ?auto_143122 ) ( ON ?auto_143124 ?auto_143123 ) ( ON ?auto_143125 ?auto_143124 ) ( CLEAR ?auto_143125 ) ( HOLDING ?auto_143126 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_143126 )
      ( MAKE-8PILE ?auto_143119 ?auto_143120 ?auto_143121 ?auto_143122 ?auto_143123 ?auto_143124 ?auto_143125 ?auto_143126 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_143128 - BLOCK
      ?auto_143129 - BLOCK
      ?auto_143130 - BLOCK
      ?auto_143131 - BLOCK
      ?auto_143132 - BLOCK
      ?auto_143133 - BLOCK
      ?auto_143134 - BLOCK
      ?auto_143135 - BLOCK
    )
    :vars
    (
      ?auto_143136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_143128 ?auto_143129 ) ) ( not ( = ?auto_143128 ?auto_143130 ) ) ( not ( = ?auto_143128 ?auto_143131 ) ) ( not ( = ?auto_143128 ?auto_143132 ) ) ( not ( = ?auto_143128 ?auto_143133 ) ) ( not ( = ?auto_143128 ?auto_143134 ) ) ( not ( = ?auto_143128 ?auto_143135 ) ) ( not ( = ?auto_143129 ?auto_143130 ) ) ( not ( = ?auto_143129 ?auto_143131 ) ) ( not ( = ?auto_143129 ?auto_143132 ) ) ( not ( = ?auto_143129 ?auto_143133 ) ) ( not ( = ?auto_143129 ?auto_143134 ) ) ( not ( = ?auto_143129 ?auto_143135 ) ) ( not ( = ?auto_143130 ?auto_143131 ) ) ( not ( = ?auto_143130 ?auto_143132 ) ) ( not ( = ?auto_143130 ?auto_143133 ) ) ( not ( = ?auto_143130 ?auto_143134 ) ) ( not ( = ?auto_143130 ?auto_143135 ) ) ( not ( = ?auto_143131 ?auto_143132 ) ) ( not ( = ?auto_143131 ?auto_143133 ) ) ( not ( = ?auto_143131 ?auto_143134 ) ) ( not ( = ?auto_143131 ?auto_143135 ) ) ( not ( = ?auto_143132 ?auto_143133 ) ) ( not ( = ?auto_143132 ?auto_143134 ) ) ( not ( = ?auto_143132 ?auto_143135 ) ) ( not ( = ?auto_143133 ?auto_143134 ) ) ( not ( = ?auto_143133 ?auto_143135 ) ) ( not ( = ?auto_143134 ?auto_143135 ) ) ( ON ?auto_143128 ?auto_143136 ) ( not ( = ?auto_143128 ?auto_143136 ) ) ( not ( = ?auto_143129 ?auto_143136 ) ) ( not ( = ?auto_143130 ?auto_143136 ) ) ( not ( = ?auto_143131 ?auto_143136 ) ) ( not ( = ?auto_143132 ?auto_143136 ) ) ( not ( = ?auto_143133 ?auto_143136 ) ) ( not ( = ?auto_143134 ?auto_143136 ) ) ( not ( = ?auto_143135 ?auto_143136 ) ) ( ON ?auto_143129 ?auto_143128 ) ( ON-TABLE ?auto_143136 ) ( ON ?auto_143130 ?auto_143129 ) ( ON ?auto_143131 ?auto_143130 ) ( ON ?auto_143132 ?auto_143131 ) ( ON ?auto_143133 ?auto_143132 ) ( ON ?auto_143134 ?auto_143133 ) ( ON ?auto_143135 ?auto_143134 ) ( CLEAR ?auto_143135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_143136 ?auto_143128 ?auto_143129 ?auto_143130 ?auto_143131 ?auto_143132 ?auto_143133 ?auto_143134 )
      ( MAKE-8PILE ?auto_143128 ?auto_143129 ?auto_143130 ?auto_143131 ?auto_143132 ?auto_143133 ?auto_143134 ?auto_143135 ) )
  )

)

